// motordrive.c -- Program to control a two-winding stepper motor
//                 via a TMC2209 chip
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
//  e  == enable (1) or disable (0) the motor
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
#include <string.h>
#include "pico/stdlib.h"
#include "pico/multicore.h"
#include "hardware/timer.h"
#include "hardware/uart.h"

#define PIN_ENABLE    16
#define PIN_DIRECTION 17
#define PIN_STEP      18 

#define PIN_UART_TX    4
#define PIN_UART_RX    5

#define MODE_STOP 0
#define MODE_RUN_TO_TARGET 1
#define MODE_RUN_FREE 2
#define DIRECTION_CW 0
#define DIRECTION_CCW 1

//#define DEFAULT_TICKS_PER_PULSE 25000  // For 12 RPM on a 200 pulse/rev motor
#define DEFAULT_TICKS_PER_PULSE  1562  // For 12 RPM on a 3200 pulse/rev motor

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

// void send_halfpulse(int idir) {
//     static int seq = 0;
//     gpio_put(PIN_STEP, seq);
//     seq++;
//     if (seq > 1) {
//         seq = 0;
//         if (idir == DIRECTION_CW) step_position++;
//         if (idir == DIRECTION_CCW) step_position--;
//     }
// }
    
void send_fullstep(int idir) {
    for(int i = 0; i < 3; i++) ; // Wait at least 20 ns.
    gpio_put(PIN_STEP, 1);
    for(int i = 0; i < 8; i++) ;  // Generate at least 100ns wait.
    gpio_put(PIN_STEP, 0);
    if (idir == DIRECTION_CW) step_position++;
    if (idir == DIRECTION_CCW) step_position--;
}

void init_pins() {
    gpio_init(PIN_ENABLE);
    gpio_set_dir(PIN_ENABLE, GPIO_OUT);
    gpio_put(PIN_ENABLE, 1);   // High is motor off
    gpio_init(PIN_DIRECTION);
    gpio_set_dir(PIN_DIRECTION, GPIO_OUT);
    gpio_put(PIN_DIRECTION, DIRECTION_CW);
    gpio_init(PIN_STEP);
    gpio_set_dir(PIN_STEP, GPIO_OUT);
    gpio_put(PIN_STEP, 0);
}

void init_uart_1() {
    uart_init(uart1, 115200);
    gpio_set_function(PIN_UART_RX, GPIO_FUNC_UART);
    gpio_set_function(PIN_UART_TX, GPIO_FUNC_UART);
}

// This code is the engine that drives the motor.  It runs
// as fast as possible -- constantly looking for input while
// timing the output pulses.
void core1() {
    //printf("Core1. Motor Driver Running.\n");
    init_pins();
    time_last_pulse = time_us_64();
    while(true) {
        if (pending_update) {
            //printf("Core1. Updating paramereters.\n");
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
            gpio_put(PIN_DIRECTION, step_direction);
            send_fullstep(step_direction);
        }
        if (run_mode == MODE_RUN_TO_TARGET) {
            int32_t steps_to_target = step_target - step_position;
            if (steps_to_target > 0) {
                gpio_put(PIN_DIRECTION, DIRECTION_CW);
                send_fullstep(DIRECTION_CW);
            }            
            if (steps_to_target < 0) {
                gpio_put(PIN_DIRECTION, DIRECTION_CCW);
                send_fullstep(DIRECTION_CCW);
            }
        }
    }
}

inline void wait_for_update() {
    while(pending_update);
}

void update_parameter() {
    wait_for_update();
    switch(current_parameter) {
        case 'e':
            if (current_arg == 0) gpio_put(PIN_ENABLE, 1);  // Motor Off
            if (current_arg == 1) gpio_put(PIN_ENABLE, 0);  // Motor On
            break;
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

void execute_buffer(char *buf, int n) {
    for(int ibuf = 0; ibuf < n; ibuf++) {
        char c = buf[ibuf];
        if (c == '!') {
            update_parameter();
            if(change_count > 0) {
                pending_update = true;
                change_count = 0;
            }
            return;
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

int main() {

    char buf_usb[256];
    char buf_uart[256];
    char sout[100];
    int i_usb = 0;
    int i_uart = 0;

    stdio_init_all();
    init_uart_1();
    printf("Motor Controller.\n");
    multicore_launch_core1(core1);

    while(true) {
        int cc = getchar_timeout_us(0);
        if (cc != PICO_ERROR_TIMEOUT) {
            if (i_usb < 255) buf_usb[i_usb++] = (char) cc;
            if ( (char) cc == '!') {
                buf_usb[255] = '!';
                execute_buffer(buf_usb, i_usb);
                printf("[%ld]\n", step_position);
                i_usb = 0;
            }
            if ( (char) cc == '?') {
                printf("{Target=%ld, Direction=%d, Mode=%d, Ticks/Pulse=%ld}\n", 
                    step_target, step_direction, run_mode, ticks_per_pulse);
            }
        }
        if (uart_is_readable(uart1)) {
            char c = uart_getc(uart1);
            //printf("Char Received: %c\n", c);
            if(i_uart < 254) buf_uart[i_uart++] = c;
            if (c == '!') {
                buf_uart[i_uart++] = '!';
                buf_uart[i_uart] = 0;
                execute_buffer(buf_uart, i_uart);
                printf("From RoboRio: %s\n", buf_uart);
                sprintf(sout, "[%ld]\n", step_position);
                uart_write_blocking(uart1, sout, strlen(sout));
                i_uart = 0;
            }
        }
    }
}


