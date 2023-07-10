// swerve_encoder.c -- main program for swerve encoder project

#include <stdio.h>
#include "pico/stdlib.h"
#include "pico/types.h"
#include "hardware/gpio.h"
#include "hardware/timer.h"

#include "pico/binary_info.h"
#include "hardware/pio.h"
#include "swerve_encoder.pio.h"
#include "pwm_reader.pio.h"

#define MAX_ENCODER_FREQ 0   // Zero means as fast as posible, which should be about 8.9M steps/sec.

const uint PIN_LED = 25;
const uint PIN_ENC_1 = 10;  // Encoder 1:  A pin is 10, B pin is 11.
const uint PIN_ENC_2 = 12;  // Encoder 2:  A pin is 12, B pin is 13.
const uint PIN_ENC_3 = 14;  // Encoder 3:  A pin is 14, B pin is 15.
const uint PIN_ENC_4 = 16;  // Encoder 4:  A pin is 16, B pin is 17.

const uint encoder_pin_base[] = {PIN_ENC_1, PIN_ENC_2, PIN_ENC_3, PIN_ENC_4};
const uint encoder_sm[] = {0, 1, 2, 3};
int32_t encoder_values[] = {0, 0, 0, 0};
int32_t pwm_values[] = {0, 0, 0, 0};
PIO pio_a = pio0;  // NOTE: For some reason, pio0 cannot be used as a constant!

volatile int32_t test_counter = 0;

// Init encoders.  Should be called once at startup.
void init_encoders() {
    uint pio_prog_addr = pio_add_program(pio_a, &swerve_encoder_program);
    for(int i = 0; i < 4; i++) {
        swerve_encoder_program_init(pio_a, encoder_sm[i], pio_prog_addr, encoder_pin_base[i], MAX_ENCODER_FREQ);
    }
}

void update_encoder_values() {
    // Start the requests.  Each one takes a few cycles to complete.
    for (int i = 0; i < 4; i++) {
        swerve_encoder_request_count(pio_a, encoder_sm[i]);
    }
    // Collect the results...
    for (int i = 0; i < 4; i++) {
        encoder_values[i] = swerve_encoder_fetch_count(pio_a, encoder_sm[i]);
    }
}

void get_pwm_values(void) {
    pwm_values[0] = pwm_reader_get_count(0);
    pwm_values[1] = pwm_reader_get_count(1);
    pwm_values[2] = pwm_reader_get_count(2);
    pwm_values[3] = pwm_reader_get_count(3);
}

int main() {
    stdio_init_all();
    printf("Init stdio\n");
    gpio_init(PIN_LED);
    gpio_set_dir(PIN_LED, GPIO_OUT);
    printf("Init Leds\n");
    init_encoders();
    printf("Init Encoders\n");
    pwm_reader_program_init();
    printf("Init pwm.\n");

    while (1) {
        gpio_put(PIN_LED, 0);
        sleep_ms(100);
        gpio_put(PIN_LED, 1);
        update_encoder_values();
        printf("Encoders: %8d  %8d  %8d  %8d\n", 
            encoder_values[0], encoder_values[1], 
            encoder_values[2], encoder_values[3]);
        get_pwm_values();
        printf("PWMs:     %8d  %8d  %8d  %8d\n",
            pwm_values[0], pwm_values[1], pwm_values[2], pwm_values[3]);
        sleep_ms(250);
    }
}