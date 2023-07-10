// pwm_rd4 -- Class to measure (read) four input pwm signals.
// 
// This code is writen to run on a RP2040 Raspberry PICO chip.
// 
// This class is optimized to read pwm signals with a frequency between
// 200 and 1000 Hz.  The readings are updated upon the falling edge of 
// the pwm pulse -- therefore you can expect an update at least once every
// 5 milliseconds.
//
// This reader also detects for the absents of a signal.  
//
// Resources:  This code uses all four state machines in PIO 1.  

#include <stdio.h>

#include "pico/stdlib.h"
#include "hardware/pio.h"
#include "hardware/irq.h"

#include "pwm_rd4.h"
#include "pwm_rd4.pio.h"

// The MAX_PERIOD_TICKS is a result of the following:
//
// We want to measure PWM signal with a minimun frequency of about 200HZ.  Anything slower
// is considered "off" by this code.  This is because we don't want any measurement to take
// longer than about 5 milliseconds when the PWM is "on", or about 15 to 20 milliseconds when
// it is "off".  That is, we don't want blocking measurements -- hence the reason for 200HZ.
// 
// So, we need to calculate a starting number to subtract counts from to make measurements.
// When this number reaches zero -- a timeout is declared and a new measurement is started.
// Ticks are subtracted from this number at the system clock frequency of 125 MHZ divided by
// two -- or one tick every 16 nanoseconds.  A time-out of 5 milliseconds requires 312,500
// ticks.  Therefore we use 312,500 for our time-out parameters, below.

#define MAX_PERIOD_TICKS 312500   
#define OVERHEAD_TICKS 3               // This is a consequence of the PIO asm code..
#define PIO_TICK_TIME_MS 0.000016      // pio tick length in milliseconds -- see PIO asm code.

uint32_t Pwm_Rd4::high_count[4];
uint32_t Pwm_Rd4::low_count[4];
PIO Pwm_Rd4::pio;

// class that reads PWM pulses from up to 4 pins
Pwm_Rd4::Pwm_Rd4(uint *pin_list, uint num_of_pins)
{
    _num_of_pins = num_of_pins;
    // pio 1 is used
    pio = pio1;
    // load the pio program into the pio memory
    uint offset = pio_add_program(pio, &Pwm_Rd4_program);
    // start num_of_pins state machines
    for (int i = 0; i < num_of_pins; i++)
    {
        // prepare state machine i
        high_count[i] = 0;
        low_count[i] = 0;

        // configure the used pins (pull down, controlled by PIO)
        gpio_pull_down(pin_list[i]);
        pio_gpio_init(pio, pin_list[i]);
        // make a sm config
        pio_sm_config c = Pwm_Rd4_program_get_default_config(offset);
        // set the 'jmp' pin
        sm_config_set_jmp_pin(&c, pin_list[i]);
        // set the 'wait' pin (uses 'in' pins)
        sm_config_set_in_pins(&c, pin_list[i]);
        // set shift direction
        sm_config_set_in_shift(&c, false, false, 0);
        // init the pio sm with the config
        pio_sm_init(pio, i, offset, &c);
        // enable the sm
        pio_sm_set_enabled(pio, i, true);
        // push the time-out parameter to the sm
        pio_sm_put(pio, i, MAX_PERIOD_TICKS);
    }
    // set the IRQ handler
    irq_set_exclusive_handler(PIO1_IRQ_0, pio_irq_handler);
    // enable the IRQ
    irq_set_enabled(PIO1_IRQ_0, true);
    // allow irqs from the low 4 state machines
    pio1_hw->inte0 = PIO_IRQ0_INTE_SM0_BITS | PIO_IRQ0_INTE_SM1_BITS | PIO_IRQ0_INTE_SM2_BITS | PIO_IRQ0_INTE_SM3_BITS ;
};

// The interrupt handler
void Pwm_Rd4::pio_irq_handler()
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
            high_count[i] = pio_sm_get(pio, i);
            // read low period from the FIFO
            low_count[i] = pio_sm_get(pio, i);
            // clear interrupt
            pio1_hw->irq = 1 << i;
        }
    }
}

uint32_t Pwm_Rd4::get_high_count(uint pin) {
    uint32_t c = high_count[pin];
    if (c == 0) return 0;
    return MAX_PERIOD_TICKS - c + OVERHEAD_TICKS;
}

uint32_t Pwm_Rd4::get_low_count(uint pin) {
    uint32_t c = low_count[pin];
    if (c == 0) return 0;
    return MAX_PERIOD_TICKS - c + OVERHEAD_TICKS;
}

float Pwm_Rd4::get_pulsewidth_ms(uint pin) {
    uint32_t c = get_high_count(pin);
    return c * PIO_TICK_TIME_MS;
}

float Pwm_Rd4::get_period_ms(uint pin) {
    uint32_t c1 = get_high_count(pin);
    uint32_t c2 = get_low_count(pin);
    if (c1 == 0 || c2 == 0) return 0.0;
    return (c1 + c2) * PIO_TICK_TIME_MS;
}

float Pwm_Rd4::get_freq(uint pin) {
    float period = get_period_ms(pin);
    if (period == 0.0) return 0.0;
    float freq = 1000.0 / period;
    return freq;
}

float Pwm_Rd4::get_dutycycle(uint pin) {
    float pw = get_pulsewidth_ms(pin);
    float period = get_period_ms(pin);
    if (pw == 0.0 || period == 0.0) return 0.0;
    return pw / period;
}




