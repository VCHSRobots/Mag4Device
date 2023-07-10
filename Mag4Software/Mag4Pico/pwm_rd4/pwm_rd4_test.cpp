// pwm_rd4_test.c -- Put the PWM reader to the test.

#include <stdio.h>
#include "pico/stdlib.h"
#include "pico/time.h"
#include "pwm_rd4.h"

#define NUM_OF_PINS 4

int main()
{
    stdio_init_all();
    printf("Testing Pwm_Rd4 with 4 input pins.\n");

    uint pin_list[NUM_OF_PINS] = {18, 19, 20, 21};
    Pwm_Rd4 pwm_rd(pin_list, NUM_OF_PINS);

    while (true)
    {
        // adviced empty (for now) function of sdk
        tight_loop_contents();

        // translate pwm of input to output
        for(int i = 0; i < 4; i++) {
            float pw = pwm_rd.get_pulsewidth_ms(i);
            float period = pwm_rd.get_period_ms(i);
            float freq = pwm_rd.get_freq(i);
            float duty = pwm_rd.get_dutycycle(i);
            printf("%d: PW=%7.3fms Period=%7.3fms, Freq=%7.1fHz, Duty=%7.5f\n", i, pw, period, freq, duty);
        }
        printf("\n\n");
        sleep_ms(100);
    }
}