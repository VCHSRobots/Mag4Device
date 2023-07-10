#ifndef mag4_H
#define mag4_H

#include <stdio.h>

#include "pico/stdlib.h"
#include "hardware/pio.h"
#include "quad.pio.h"
#include "pwm_rd4.pio.h"

void init_mag4();
void quad_get_all_counts(int32_t *counts);
uint32_t pwm_get_high_count(uint channel);
uint32_t pwm_get_low_count(uint channel);
float pwm_get_pulsewidth_ms(uint channel);
float pwm_get_period_ms(uint channel);
float pwm_get_freq(uint channel);
float pwm_get_dutycycle(uint channel);

uint get_angle_raw(uint channel, float *angle);
uint get_angle_with_sync(uint channel, float *angle);
float get_angle_error(uint channel);

#endif