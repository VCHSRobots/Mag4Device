#ifndef Pwm_Rd4_H
#define Pwm_Rd4_H

#include <stdio.h>

#include "pico/stdlib.h"
#include "hardware/pio.h"
#include "pwm_rd4.h"
#include "pwm_rd4.pio.h"

// class that reads PWM pulses on max 4 pins
class Pwm_Rd4
{
public:
    // constructor
    Pwm_Rd4(uint *pin_list, uint num_of_pin);   // Constructor
    uint32_t get_high_count(uint pin);
    uint32_t get_low_count(uint pin);
    float get_pulsewidth_ms(uint pin);
    float get_period_ms(uint pin);
    float get_freq(uint pin);
    float get_dutycycle(uint pin);

private:
    // set the irq handler
    static void pio_irq_handler();
    // the pio instance
    static PIO pio;
    // the pins and number of pins
    uint _num_of_pins;
    // data about the PWM input measured in pio clock cycles
    static uint32_t high_count[4], low_count[4];
};

#endif