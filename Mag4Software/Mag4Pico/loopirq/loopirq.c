// loopirq.c -- testing interrupts

#include <stdio.h>
#include "pico/stdlib.h"
#include "pico/multicore.h"
#include "hardware/irq.h"

#define PIN_LED PICO_DEFAULT_LED_PIN
#define PIN_SIGNAL_1 16
#define PIN_INTR_1 17
#define PIN_SIGNAL_2 18
#define PIN_INTR_2 19

volatile uint32_t ctr1 = 0;
volatile uint32_t ctr2 = 0;

// Code running on Core 1... Provide a simple interrupt, once per second
void core1() {
    gpio_init(PIN_SIGNAL_1);
    gpio_set_dir(PIN_SIGNAL_1, GPIO_OUT);
    gpio_init(PIN_SIGNAL_2);
    gpio_set_dir(PIN_SIGNAL_2, GPIO_OUT);
    while(1) {
        gpio_put(PIN_SIGNAL_1, 1);
        sleep_ms(500);
        gpio_put(PIN_SIGNAL_1, 0);
        gpio_put(PIN_SIGNAL_2, 1);
        sleep_ms(500);
        gpio_put(PIN_SIGNAL_2, 0);
        sleep_ms(200);
        gpio_put(PIN_SIGNAL_2, 1);
        sleep_ms(40);
        gpio_put(PIN_SIGNAL_2, 0);
        sleep_ms(10);
    }
}

void gpio_iqr_handler(uint gpio, uint32_t event_mask)
{
    if(event_mask & GPIO_IRQ_EDGE_RISE) {
        if (gpio == PIN_INTR_1) ctr1++;
        if (gpio == PIN_INTR_2) ctr2++;
    }
}


// Interrupt handler for 
void iqr_handler1() {
    if (gpio_get_irq_event_mask(PIN_INTR_1) & GPIO_IRQ_EDGE_RISE)
    {
        gpio_acknowledge_irq(PIN_INTR_1, GPIO_IRQ_EDGE_RISE);
        ctr1++;
    }
    ctr1++;
}

// Interrupt handler
void iqr_handler2() {
    if (gpio_get_irq_event_mask(PIN_INTR_2) & GPIO_IRQ_EDGE_RISE)
    {
        gpio_acknowledge_irq(PIN_INTR_2, GPIO_IRQ_EDGE_RISE);
        ctr2++;
    }
    ctr2++;
}

int main() {
    stdio_init_all();
    gpio_init(PIN_LED);
    gpio_set_dir(PIN_LED, GPIO_OUT);
    gpio_init(PIN_INTR_1);
    gpio_set_dir(PIN_INTR_1, GPIO_IN);
    gpio_init(PIN_INTR_2);
    gpio_set_dir(PIN_INTR_2, GPIO_IN);
    sleep_ms(500);
    gpio_set_irq_enabled_with_callback(PIN_INTR_1, GPIO_IRQ_EDGE_RISE, true, gpio_iqr_handler);
    gpio_set_irq_enabled(PIN_INTR_2, GPIO_IRQ_EDGE_RISE, true);

    //gpio_set_irq_enabled_with_callback(PIN_INTR_2, GPIO_IRQ_EDGE_RISE, true, &iqr_handler2);
    //gpio_add_raw_irq_handler(PIN_INTR_1, &iqr_handler1);
    //gpio_add_raw_irq_handler(PIN_INTR_2, &iqr_handler2);
    //gpio_set_irq_enabled(PIN_INTR_1, GPIO_IRQ_EDGE_RISE, true);
    //gpio_set_irq_enabled(PIN_INTR_2, GPIO_IRQ_EDGE_RISE, true);
   
    sleep_ms(100);
    multicore_launch_core1(core1);
    //irq_set_exclusive_handler(IO_IRQ_QSPI, iqr_handler);
    //irq_set_enabled(IO_IRQ_QSPI, true)

    while (true) {
        gpio_put(PIN_LED, 1);
        sleep_ms(250);
        gpio_put(PIN_LED, 0);
        sleep_ms(250);
        printf("Interrupt Counters = %ld, %ld\n", ctr1, ctr2);
    }
}
