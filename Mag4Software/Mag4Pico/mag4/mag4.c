// mag4.cpp -- class to read 4 SRX Mag encoders from CTRE
//
// This code provides the ability to quickly read both the
// absolute and relative position of up to four SRX Mag encoders.
// 
// Techinal Issues:
// The SRX Mag encoder is a device that senses the position
// of a magnet that is embedded at the end of a rotating
// shaft.  By sensing the direction of the flux lines of the
// magnet, the sensor can output the absolute rotational 
// position of the shaft.
//
// The sensor communicates the absolute angle with a PWM
// signal that has period of about 4 milliseconds.  The
// sensor also outputs a series of pulses (in quadrature) that
// indicates the relative direction and speed of rotation.  The
// quadrature output is much faster than the PWM, so if one
// can track the quadrature data and combine it with the PWM,
// a very fast and acurate reading of absolute angle measurements
// can be provided -- which is what this code attemps to do.
//
// This code works as follows:  At startup, a register is set to zero.
// As the quadrature pulses are received, the register is 
// incrememted or decremeneted as dictated by the quadrature.
// At the same time, the PWM signal is monitored.  On the
// first update of the PWM, the quadrature register is "synced"
// with the PWM to derive an absolute angle measurement.  Then,
// as more PWM updates are received the syncing is adjusted
// if more accurracy would be achieved, as explained below.
//
// Note that if the shaft is moving, the PWM signal is not
// accurate.  This is something that this code must contend with.
// The maximum error in the PWM signal is related to how
// fast the shaft is rotating.  Since, from the quadrature,
// the speed of the shaft is known, this code can estimate
// the error in the PWM signal.  Therefore, the syncing of
// the quadrature and the PWM is done only if doing so would
// yeild a tighter connection.  
//
// At any time the caller can read the rotational angle
// changes since startup (i.e., relative changes) and the
// caller can also read the currently estimated absolute position and
// the associated error estimate for the absolute angle. The
// data provided will always be the most up-to-date possible. 
//
// Startup Issues:
// Before any useable absolute angle data are ready, the caller
// must wait about 10 millisconds after startup to allow the
// first few PWM pulses to be decoded.  Note also, that if the shaft
// is rotating at startup, accuracy will suffer until the
// shaft slows down or stops for a period of about 10 milliseconds.
// As an example, if the shaft is spinning at 40 RPM at startup
// and thereafter never slower, the error in absolute angle
// measurements will be about 1 degree. 
//
// Maximum RPM:
// The maximum rpm is determined by the sample rate of the PIO
// code, which in the worst case is 14 system cycles.  Since
// the system clock is 125 MHZ, the maximum input pulse rate
// is 8.9 Msamples/sec.  Since one revolution of the shaft
// generates 4096 pulses, the max RPM is over 130,000.
// 
// Regarding accuracy:
// The discussion above assumes the error in the absolute angle
// is only due to the inherent limitations of the electronics and software.
// In reallity, a mismatch in the physical mounting of the magnet
// and the sensor can also introduce significate error in the
// absolute measurements of angle.
//
// Hardware:
// This code is intended to run on a RP2040 chip.
// It uses both PIOs and all the state machines. PIO 0 is used to 
// process the quadrature input, and PIO 1 is used for the PWM input.
//
// Pinout:
// The input pins for the 4 channels of PWM are fixed in this code
// by the defines below. Each channel requires 3 input pins: two for
// quadrature and one for PWM.  The two quadrature pins for each
// channel must be in sequence.
//

#include <stdio.h>
#include <math.h>

#include "pico/stdlib.h"
#include "hardware/pio.h"
#include "hardware/irq.h"
#include "hardware/clocks.h"
#include "hardware/gpio.h"

#include "mag4.h"
#include "pwm_rd4.pio.h"
#include "quad.pio.h"

// The MAX_PERIOD_TICKS, defined below, is a result of the following:
//
// The PIO code needs a "timeout" parameter which is maximum period
// to wait for a transistion on the input signal. The timeout guarentees that
// a report will be made without blocking. The PIO code counts down
// from this timeout parameter and returns the resulting count for both
// the high and low periods of the PWM input.  Since the PWM period of
// the SX Mag Encoder is about 4 milliseconds, we use 5 milliseconds to
// be safe.  The counting rate of the PIO is half of the system clock
// rate, or about 62.5 MHz.  For a 5 millisecond period 312,500 ticks
// need to be counted.

#define MAX_PERIOD_TICKS 312500        // See above
#define OVERHEAD_TICKS 3               // This is a consequence of the PIO asm code..
#define PIO_TICK_TIME_MS 0.000016      // pio tick length in milliseconds -- see PIO asm code.
#define MAX_QUADRATURE_FREQ 0          // Zero means as fast as posible, which should be about 8.9M steps/sec.
#define ANGLE_UNKNOWN_COUNT 10000      // More than one rotation in quadrature ticks.

// Pinout defined here:
const uint PIN_QUAD_1 = 10;  // Quadrature Encoder 1:  A pin is 10, B pin is 11.
const uint PIN_PWM_1  = 12;  // PWM Input 1
const uint PIN_QUAD_2 = 19;  // Quadrature Encoder 2:  A pin is 19, B pin is 20.
const uint PIN_PWM_2  = 21;  // PWM Input 2
const uint PIN_QUAD_3 = 16;  // Quadrature Encoder 3:  A pin is 16, B pin is 17.
const uint PIN_PWM_3  = 18;  // PWM Input 3
const uint PIN_QUAD_4 = 13;  // Quadrature Encoder 4:  A pin is 13, B pin is 14.
const uint PIN_PWM_4  = 15;  // PWM Input 4

const uint quadrature_pin_base[] = {PIN_QUAD_1, PIN_QUAD_2, PIN_QUAD_3, PIN_QUAD_4};
const uint pwm_pins[] = {PIN_PWM_1, PIN_PWM_2, PIN_PWM_3, PIN_PWM_4};

PIO pio_quad = pio0;     // NOTE: For some reason, pio0 and pio1 cannot be used as a constant!
PIO pio_pwm  = pio1;  
volatile int32_t quadrature_values[] = {0, 0, 0, 0};
volatile bool sync_inited[] = {false, false, false, false};
volatile uint32_t pwm_reading_error_count[] = {0, 0, 0, 0};
volatile uint32_t pwm_high_count[4];
volatile uint32_t pwm_low_count[4];
volatile int32_t last_quad_count[] = {0, 0, 0, 0};
volatile uint32_t pwm_accuracy[] = {10000, 10000, 10000, 10000};
volatile uint32_t pwm_high_count_at_sync[] = {0, 0, 0, 0};
volatile uint32_t pwm_low_count_at_sync[] = {0, 0, 0, 0};
volatile uint32_t quadrature_at_sync[] = {0, 0, 0, 0};
volatile uint32_t pwm_update_count[] = {0, 0, 0, 0};
volatile uint resync_wait_count[] = {3, 3, 3, 3};  // Initial Debounce Filter Time

static inline void quad_program_init(PIO pio, uint sm, uint offset, uint pin, int max_step_rate)
{
	pio_sm_set_consecutive_pindirs(pio, sm, pin, 2, false);
	gpio_pull_up(pin);
	gpio_pull_up(pin + 1);

	pio_sm_config c = quad_program_get_default_config(offset);
	sm_config_set_in_pins(&c, pin); // for WAIT, IN
	sm_config_set_jmp_pin(&c, pin); // for JMP
	// shift to left, autopull disabled
	sm_config_set_in_shift(&c, false, false, 32);
	// don't join FIFO's
	sm_config_set_fifo_join(&c, PIO_FIFO_JOIN_NONE);

	// passing "0" as the sample frequency,
	if (max_step_rate == 0) {
		sm_config_set_clkdiv(&c, 1.0);
	} else {
		// one state machine loop takes at most 14 cycles
		float div = (float)clock_get_hz(clk_sys) / (14 * max_step_rate);
		sm_config_set_clkdiv(&c, div);
	}

	pio_sm_init(pio, sm, offset, &c);
	pio_sm_set_enabled(pio, sm, true);
}

// When requesting the current quadrature count we may have to wait a few
// cycles (average ~11 sysclk cycles) for the state machine to reply. If
// we are reading multiple encoders, we may request them all in one go and
// then fetch them all, thus avoiding doing the wait multiple times. If we
// are reading just one encoder,
// we can use the "get_count" function to request and wait

// Request the quadrature count.  This sends a request without
// blocking. 
static inline void quad_request_count(uint channel)
{
	pio_quad->txf[channel] = 1;
}

// Fetch and return the quadrature count for one channel.  This blocks
// until the count is ready in the fifo.  Therefore be sure to call
// quad_request_count() with the same channel number before calling 
// this function.
static inline int32_t quad_fetch_count(uint channel)
{
	while (pio_sm_is_rx_fifo_empty(pio_quad, channel))
		tight_loop_contents();
	return pio_quad->rxf[channel];
}

// Get quadrature count for one channel. Blocks until the 
// statemachine replys -- about 14 system cycles.
static inline int32_t quad_get_count(uint channel)
{
	quad_request_count(channel);
	return quad_fetch_count(channel);
}

// Get all the current quadrature counts with minumum blockage.
void quad_get_all_counts(int32_t *counts) {
    for(int i = 0; i < 4; i++) {
        quad_request_count(i);
    }
    for(int i = 0; i < 4; i++) {
        counts[i] = quad_fetch_count(i);
    }
}

// This is where the logic for syncing PWM and quadrature
// is housed.  Note that this logic runs at interrupt time
// so unneeded calculations are avoided.
void pwm_process_channel_at_interrupt(uint channel) {
    // immediately grab the quadrature count for this channel.
    int32_t current_quad_count = quad_get_count(channel);
    // If we got an invalid pwm reading, start over.
    if (pwm_high_count[channel] == 0 || pwm_low_count[channel] == 0) {
        // We have an invalid pwm reading, which calls into question
        // our current sync, if any.  Mark this channel as uninitalized
        // which means that the actual angle is unknown.
        pwm_reading_error_count[channel] += 1;
        sync_inited[channel] = false;
        pwm_accuracy[channel] = ANGLE_UNKNOWN_COUNT;
        return;
    }
    if (!sync_inited[channel]) {
            sync_inited[channel] = true;
            last_quad_count[channel] = current_quad_count;
            resync_wait_count[channel] = 10;
            return;
    }
    int32_t quad_delta = current_quad_count - last_quad_count[channel];
    if (quad_delta < 0) quad_delta = 0 - quad_delta;
    last_quad_count[channel] = current_quad_count;
    if (resync_wait_count[channel] > 0) {
        // This is basically a debunce filter 
        resync_wait_count[channel]--;
        return;
    }
    if ((uint32_t) quad_delta <= pwm_accuracy[channel]) {
        // We have a better update, establish it as the sync value.
        pwm_high_count_at_sync[channel] = pwm_high_count[channel];
        pwm_low_count_at_sync[channel] = pwm_low_count[channel];
        quadrature_at_sync[channel] = current_quad_count;
        pwm_accuracy[channel] = (uint32_t) quad_delta;
    }
}

// The interrupt handler to process pwm measurements.
void pwm_pio_irq_handler()
{
    int state_machine = -1;
    // check which IRQ was raised:
    for (int i = 0; i < 4; i++)
    {
        if (pio1_hw->irq & 1<<i)
        {
            // clear interrupt
            pio1_hw->irq = 1 << i;
            // read pulse width from the FIFO
            pwm_high_count[i] = pio_sm_get(pio_pwm, i);
            // read low period from the FIFO
            pwm_low_count[i] = pio_sm_get(pio_pwm, i);
            // Do the syncing logic.
            pwm_update_count[i]++;
            pwm_process_channel_at_interrupt(i);
            // clear interrupt
            pio1_hw->irq = 1 << i;
        }
    }
}

// Initilize the PWM state machines.
void init_pwm4()
{
    // load the pio program into the pio memory
    uint offset = pio_add_program(pio_pwm, &pwm_rd4_program);
    // start the state machines
    for (int i = 0; i < 4; i++)
    {
        // prepare state machine i
        pwm_high_count[i] = 0;
        pwm_low_count[i] = 0;

        // configure the used pins (pull down, controlled by PIO)
        gpio_pull_down(pwm_pins[i]);
        pio_gpio_init(pio_pwm, pwm_pins[i]);
        // make a sm config
        pio_sm_config c = pwm_rd4_program_get_default_config(offset);
        // set the 'jmp' pin
        sm_config_set_jmp_pin(&c, pwm_pins[i]);
        // set the 'wait' pin (uses 'in' pins)
        sm_config_set_in_pins(&c, pwm_pins[i]);
        // set shift direction
        sm_config_set_in_shift(&c, false, false, 0);
        // init the pio sm with the config
        pio_sm_init(pio_pwm, i, offset, &c);
        // enable the sm
        pio_sm_set_enabled(pio_pwm, i, true);
        // push the time-out parameter to the sm
        pio_sm_put(pio_pwm, i, MAX_PERIOD_TICKS);
    }
    // set the IRQ handler
    irq_set_exclusive_handler(PIO1_IRQ_0, pwm_pio_irq_handler);
    // enable the IRQ
    irq_set_enabled(PIO1_IRQ_0, true);
    // allow irqs from the low 4 state machines
    pio1_hw->inte0 = PIO_IRQ0_INTE_SM0_BITS | PIO_IRQ0_INTE_SM1_BITS | PIO_IRQ0_INTE_SM2_BITS | PIO_IRQ0_INTE_SM3_BITS ;
};

// Init encoders.  Should be called once at startup.
void init_mag4() {
    // Start the quadrature Input:
    uint pio_prog_addr = pio_add_program(pio_quad, &quad_program);
    for(int i = 0; i < 4; i++) {
        quad_program_init(pio_quad, i, pio_prog_addr, quadrature_pin_base[i], MAX_QUADRATURE_FREQ);
    }
    // Start the PWM Input:
    init_pwm4();
}

uint32_t pwm_get_high_count(uint channel) {
    uint32_t c = pwm_high_count[channel];
    if (c == 0) return 0;
    return MAX_PERIOD_TICKS - c + OVERHEAD_TICKS;
}

uint32_t pwm_get_low_count(uint channel) {
    uint32_t c = pwm_low_count[channel];
    if (c == 0) return 0;
    return MAX_PERIOD_TICKS - c + OVERHEAD_TICKS;
}

float pwm_get_pulsewidth_ms(uint channel) {
    uint32_t c = pwm_get_high_count(channel);
    return c * PIO_TICK_TIME_MS;
}

float pwm_get_period_ms(uint channel) {
    uint32_t c1 = pwm_get_high_count(channel);
    uint32_t c2 = pwm_get_low_count(channel);
    if (c1 == 0 || c2 == 0) return 0.0;
    return (c1 + c2) * PIO_TICK_TIME_MS;
}

float pwm_get_freq(uint channel) {
    float period = pwm_get_period_ms(channel);
    if (period == 0.0) return 0.0;
    float freq = 1000.0 / period;
    return freq;
}

float pwm_get_dutycycle(uint channel) {
    float pw = pwm_get_pulsewidth_ms(channel);
    float period = pwm_get_period_ms(channel);
    if (pw == 0.0 || period == 0.0) return 0.0;
    return pw / period;
}

// Retrives the raw angle in cycles (i.e., 0.0 to 1.0) without 
// attempting to sync.  This is absolute angle -- the measurement
// wraps around the uint circle.  Multiply by 360 to get degrees,
// or 2 pi to get radians. The angle is returned in the location
// pointed to by *angle.  On error, the returned value is zero.
// On success, the returned value is 1.
uint get_angle_raw(uint channel, float *angle) {
    *angle = 0.0;  // Assume error.
    // Retrieve data. Make sure it is from same interrupt update.
    uint32_t ic1, ic2;
    uint ntrys = 0;
    while(1)  {
        uint32_t update_count_0 = pwm_update_count[channel];
        ic1 = pwm_high_count[channel];
        ic2 = pwm_low_count[channel];
        uint32_t update_count_1 = pwm_update_count[channel];
        if (update_count_0 == update_count_1) break;
        ntrys++;
        if(ntrys > 3) return 0;  // Too many trys = error.
    }
    // Calculate angle...
    if(ic1 == 0 || ic2 == 0) return 0;
    float c1 = MAX_PERIOD_TICKS - ic1 + OVERHEAD_TICKS;
    float c2 = MAX_PERIOD_TICKS - ic2 + OVERHEAD_TICKS;
    float fangle = c1 / (c1+c2);
    // Combine PWM and Quadrature
    *angle = fmod(fangle, 1.0);
    // Make sure it's between zero and one:
    if (*angle < 0.0) *angle += 1.0;
    return 1;
}

// Retrives the synced angle in cycles (i.e., 0.0 to 1.0).  This is 
// absolute angle -- the measurement wraps around the uint circle.
// Multiply by 360 to get degrees, or 2 pi to get radians. The 
// angle is returned in the location pointed to by *angle.  On 
// error, the returned value is zero.  On success, the returned
// value is 1.
uint get_angle_with_sync(uint channel, float *angle) {
    *angle = 0.0;  // Assume error.
    if (!sync_inited[channel]) return 0;
    // Retrieve data. Make sure it is from same interrupt update.
    uint32_t ic1, ic2, quad_at_sync;
    uint ntrys = 0;
    while(1)  {
        uint32_t update_count_0 = pwm_update_count[channel];
        ic1 = pwm_high_count_at_sync[channel];
        ic2 = pwm_low_count_at_sync[channel];
        quad_at_sync = quadrature_at_sync[channel];
        uint32_t update_count_1 = pwm_update_count[channel];
        if (update_count_0 == update_count_1) break;
        ntrys++;
        if(ntrys > 3) return 0;  // Too many trys = error.
    }
    // Calculate angle at sync...
    if(ic1 == 0 || ic2 == 0) return 0;
    float c1 = MAX_PERIOD_TICKS - ic1 + OVERHEAD_TICKS;
    float c2 = MAX_PERIOD_TICKS - ic2 + OVERHEAD_TICKS;
    float sync_angle = c1 / (c1+c2);
    // Get modulo of quadrature count right now.
    int32_t quad = quad_get_count(channel);
    // Get difference since time of sync
    int32_t diff = (quad - quad_at_sync) % 4096;
    // Convert to unit angle 
    float fdiff = (float) diff / 4096.0f;
    // Combine PWM and Quadrature
    *angle = fmod(sync_angle + fdiff, 1.0);
    // Make sure it's between zero and one:
    if (*angle < 0.0) *angle += 1.0;
    return 1;
}

// Returns the currently known accuracy of the angle measurement in cycles.
// If the value returned is greater than 1.0, this means the PWM signal
// has not been correctly received or processed.  If the shaft is ever
// motionless for about 10 to 20 millisconds, the error should be zero
// which indicates a perfect synchronization between the PWM and
// quadrature readings.
float get_angle_error(uint channel) {
    return (pwm_accuracy[channel]) / 4096.0;
}