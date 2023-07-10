// Test PIO interrupt.

#include <stdio.h>
#include "pico/stdlib.h"
#include "hardware/pio.h"
#include "hardware/clocks.h"
#include "hardware/irq.h"
#include "blink.pio.h"

volatile uint32_t pcount = 0;
PIO pio = pio0;

void pioIRQ() {
    if(pio_interrupt_get(pio, 0)) {
        pcount++;
        pio_interrupt_clear(pio, 0);
    }
}

void blink_pin_forever(PIO pio, uint sm, uint offset, uint pin, uint freq) {
    // NOTE: pio must be pio zero for this to work!
    blink_program_init(pio, sm, offset, pin);
    pio_set_irq0_source_enabled(pio, pis_interrupt0, true);  // Enable IRQ-0 in PIO machine
    irq_set_exclusive_handler(PIO0_IRQ_0, pioIRQ);  // Set the handler in the NVIC
    irq_set_enabled(PIO0_IRQ_0, true); // Enable the interrupt at the NVIC

    pio_sm_set_enabled(pio, sm, true);  // Turn on the PIO state machine
    printf("Blinking pin %d at %d Hz\n", pin, freq);

    // PIO counter program takes 3 more cycles in total than we pass as
    // input (wait for n + 1; mov; jmp)
    pio->txf[sm] = (clock_get_hz(clk_sys) / (2 * freq)) - 3;
}

int main() {
    stdio_init_all();

    PIO pio = pio0;
    uint offset = pio_add_program(pio, &blink_program);
    printf("Loaded program at %d\n", offset);

    blink_pin_forever(pio, 0, offset, 4, 500);

    while(true) {
        sleep_ms(500);
        printf("Interrupt Count = %ld\n", pcount);
    }

}


