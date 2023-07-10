/**
 * Copyright (c) 2020 Raspberry Pi (Trading) Ltd.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include <stdio.h>
#include <math.h>
#include "pico/stdlib.h"

uint32_t count = 0;

int main() {
    stdio_init_all();
    const uint LED_PIN = PICO_DEFAULT_LED_PIN;
    gpio_init(LED_PIN);
    gpio_set_dir(LED_PIN, GPIO_OUT);
    while (true) {
        gpio_put(LED_PIN, 1);
        sleep_ms(50);
        gpio_put(LED_PIN, 0);
        sleep_ms(50);
        count += 1;
        float angle = (((count % 50) / 50.0) * 3.141592654);
        float x = sin(angle);
        float y = cos(angle);
        printf("/* %d, %f, %f */\n", count, x, y);
    }
}
