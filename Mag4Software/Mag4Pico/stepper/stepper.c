// stepper.c -- Program to control a two-winding stepper motor
//
// Theory of Operation
// Core 0 is used to communicate with the host.  Core 1 is used
// to send pulses to the stepper motor.  
//
// Command Protocol:
// The protocol allows for setting parameters without changing
// the current operation of the motor, and then executing the
// new parameters as a group.  Any parameters not specified will
// retain its old or default value.  The parameters are as follows:
//
//  s  == speed in steps per second
//  t  == target position in step counts
//  d  == direction, (0=cw, 1=ccw)
//  m  == mode (0=stop, 1=move to target, 2=free run)
//  r  == set (reset) contents of step register
//
// The numerical argument is appended to the character that
// specifies the parameter, like so: "s200".  The numerial
// argument can be negative, such as "t-8000".  An example
// of a complete command:
//
//    s300t4800!  
// 
// Note the execution character: '!'.  When the exectuion 
// character is received, the new parameters are loaded into 
// the output engine for execution, and a response in the 
// form '[nnnnn]' is sent to the host, where the nnnnn is
// the current step position.  
// 
// Note that punctuation, special characters, spaces, and capital 
// characters are ignored.  So "tXY50,00" reduces to
// "t5000".
// 
// A '?' will cause a status message from the output engine to be 
// returned, in the form of:
//
// {Target=nnn, Direction=n, Mode=n, Ticks/Pulse=nnn}
// 
// Sending "!" without any preceding parameters is acceptable
// and will simply return the current step position.
// 
// If no numerical argument after the parameter character
// is sent, the argument is assumed to be zero.  Therefore
// sending "trm1!" will cause the step position and target
// to be set to zero, and the mode will be set to "Move to Target".
// Since the target is equal to the step position, the motor
// will be stopped.

#include <stdio.h>
#include "pico/stdlib.h"
#include "pico/multicore.h"
#include "hardware/timer.h"

#define PIN_COIL_1A 15
#define PIN_COIL_1B 14
#define PIN_COIL_2A 13
#define PIN_COIL_2B 12
#define PIN_ENALBE  11  // Currently not used

#define MODE_STOP 0
#define MODE_RUN_TO_TARGET 1
#define MODE_RUN_FREE 2
#define DIRECTION_CW 0
#define DIRECTION_CCW 1

#define DEFAULT_TICKS_PER_PULSE 25000  // For 12 RPM on a 200 pulse/rev motor

// State Variables for motor driver:
volatile int32_t step_position = 0;             // Current absolute step position
volatile uint64_t time_last_pulse = 0;          // Time last pulse was issued.
volatile uint step_direction = DIRECTION_CW;    // Direction of Rotation for free run mode
volatile int32_t step_target = 0;               // Step target for run to target mode
volatile uint32_t ticks_per_pulse = DEFAULT_TICKS_PER_PULSE;    // 1us ticks between pulses
volatile uint run_mode = MODE_STOP;             // Mode
// Following are used to control motor driver:
volatile bool pending_update = false;            // If new parameters are avaliable
volatile int32_t pending_target = 0;             // New pending target
volatile uint pending_direction = DIRECTION_CW;  // New pending direction
volatile uint pending_mode = MODE_RUN_FREE;      // New pending mode
volatile bool pending_reset_position = false;    // If a position reset is requested
volatile int32_t pending_step_position = 0;      // The value of the reset position
volatile uint32_t pending_ticks_per_pulse = DEFAULT_TICKS_PER_PULSE;  // New pending speed

// Variables for processing input
char current_parameter = 0;
int current_arg = 0;
int current_arg_sign = 1;
int current_arg_digit = 0;
uint change_count = 0;

void send_step(int idir) {
    static int step_seq = 0;
    if (idir == 0) return;
    if (idir < 0) {
        step_seq--;
        if (step_seq < 0) step_seq = 3;
        step_position--;
    }
    if (idir > 0) {
        step_seq++;
        if (step_seq > 3) step_seq = 0;
        step_position++;
    }
    switch(step_seq) {
        case 0:
            gpio_put(PIN_COIL_1A, 1);
            gpio_put(PIN_COIL_1B, 0);
            gpio_put(PIN_COIL_2A, 1);
            gpio_put(PIN_COIL_2B, 0);
            return;
        case 1:
            gpio_put(PIN_COIL_1A, 0);
            gpio_put(PIN_COIL_1B, 1);
            gpio_put(PIN_COIL_2A, 1);
            gpio_put(PIN_COIL_2B, 0);
            return;
        case 2:
            gpio_put(PIN_COIL_1A, 0);
            gpio_put(PIN_COIL_1B, 1);
            gpio_put(PIN_COIL_2A, 0);
            gpio_put(PIN_COIL_2B, 1);
            return;
        case 3:
            gpio_put(PIN_COIL_1A, 1);
            gpio_put(PIN_COIL_1B, 0);
            gpio_put(PIN_COIL_2A, 0);
            gpio_put(PIN_COIL_2B, 1);
            return;
    }
}

void init_pins() {
    gpio_init(PIN_COIL_1A);
    gpio_set_dir(PIN_COIL_1A, GPIO_OUT);
    gpio_init(PIN_COIL_1B);
    gpio_set_dir(PIN_COIL_1B, GPIO_OUT);
    gpio_init(PIN_COIL_2A);
    gpio_set_dir(PIN_COIL_2A, GPIO_OUT);
    gpio_init(PIN_COIL_2B);
    gpio_set_dir(PIN_COIL_2B, GPIO_OUT);
}

// This code is the engine that drives the motor.  It runs
// as fast as possible -- constantly looking for input while
// timing the output pulses.
void core1() {
    printf("Core1. Motor Driver Running.\n");
    init_pins();
    time_last_pulse = time_us_64();
    while(true) {
        if (pending_update) {
            printf("Core1. Updating paramereters.\n");
            step_direction = pending_direction;
            ticks_per_pulse = pending_ticks_per_pulse;
            run_mode = pending_mode;
            step_target = pending_target;
            if (pending_reset_position) {
                pending_reset_position = false;
                step_position = pending_step_position;
            }
            pending_update = false;
        }
        uint64_t time_now = time_us_64();
        uint32_t elp_time = (uint32_t) (time_now - time_last_pulse);
        if (elp_time < ticks_per_pulse) continue;
        // The following logic attemps to reduce jitter by adjusting
        // the time for the next pulse to be in pace even if this
        // pulse is not exactly timed correctly.
        uint32_t time_error = elp_time - ticks_per_pulse;
        if (time_error < ticks_per_pulse / 2) {
            time_last_pulse += ticks_per_pulse;
        } else {
            // Jitter is too big.  Restart pace.
            time_last_pulse = time_now;
        }
        // Now its time to do something...
        if (run_mode == MODE_RUN_FREE) {
            if (step_direction == DIRECTION_CW) send_step(1);
            if (step_direction == DIRECTION_CCW) send_step(-1);
        }
        if (run_mode == MODE_RUN_TO_TARGET) {
            int32_t steps_to_target = step_target - step_position;
            if (steps_to_target > 0) send_step(1);
            if (steps_to_target < 0) send_step(-1);
        }
    }
}


inline void wait_for_update() {
    while(pending_update);
}

void update_parameter() {
    wait_for_update();
    switch(current_parameter) {
        case 's':
            if (current_arg == 0) current_arg = 12 * 200;
            pending_ticks_per_pulse = 1000000 / current_arg;
            change_count++;
            break;
        case 't':
            pending_target = current_arg;
            change_count++;
            break;
        case 'd':
            if (current_arg == 0) pending_direction = DIRECTION_CW;
            else                  pending_direction = DIRECTION_CCW;
            change_count++;
            break;
        case 'm':
            if (current_arg == 0) pending_mode = MODE_STOP;
            if (current_arg == 1) pending_mode = MODE_RUN_TO_TARGET;
            if (current_arg == 2) pending_mode = MODE_RUN_FREE;
            change_count++;
            break;
        case 'r':
            pending_step_position = current_arg;   
            pending_reset_position = true;
            change_count++;
            break;
    }
    current_parameter = 0;
    current_arg = 0;
    current_arg_sign = 1;
    current_arg_digit = 0;
}

int main() {

    stdio_init_all();
    printf("Motor Controller.\n");
    multicore_launch_core1(core1);

    while(true) {
        char c = getchar();
        if (c == '?') {
            update_parameter();
            printf("{Target=%ld, Direction=%d, Mode=%d, Ticks/Pulse=%ld}\n", 
                step_target, step_direction, run_mode, ticks_per_pulse);
        }
        if (c == '!') {
            update_parameter();
            if(change_count > 0) {
                pending_update = true;
                change_count = 0;
            }
            printf("[%ld]\n", step_position);
        } else {
            if (c >= 'a' && c <= 'z') {
                update_parameter();
                current_parameter = c;
            }
            if (c >= '0' && c <= '9') {
                current_arg_digit++;
                current_arg = current_arg * 10 + (c - '0');
            }
            if (c == '-' && current_arg_digit == 0) current_arg_sign = -1;
        }
    }
}


