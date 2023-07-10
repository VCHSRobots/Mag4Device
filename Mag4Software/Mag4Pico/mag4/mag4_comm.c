// mag4_comm.cpp -- Communication for the Mag4 interface device.

#include <stdio.h>
#include <string.h>
#include "pico/stdlib.h"
#include "pico/time.h"
#include "mag4.h"

#include "pico/binary_info.h"
#include "hardware/spi.h"
#include "pico/multicore.h"
#include "pico/binary_info.h"

// Data Protocol:
//
// The Mag4 interface device acts as a SPI slave -- it only responds to
// requests from the master SPI.
//
// Each transfer is two-way, i.e., the content of two buffers are exchanged,
// one being the input, the other output.  The buffers are the same size, and
// always 30 bytes long.
//
// Upon Chip Select (CS) being asserted, the most up-to-date info is loaded
// into the output buffer before the transfer.  Therefore, it is best to cycle CS
// for each transfer instead of holding it always asserted.  However, after each
// transfer, the buffer is reloaded in case CS is not being cycled.  That is,
// if CS is not being cycled, stale data might result.
//
// Each Transfer: 30 Bytes or 240 bits
// At 1MBit/sec = 0.24 msec delay per transfer, or a max update rate of over 4 KHz.
//
// Each Transfer follows this pattern:
//   Label:   v C1 C2 C3 C4 A1 A2 A3 A4 E1 E2 E3 E4  L
//   Bytes:   1  4  4  4  4  2  2  2  2  1  1  1  1  1  = 30 bytes / transfer
// 
// Where v is one byte that gives the version number indicator (currently = 5), 
// C1, C2, C3, C4 are the count ticks for ports 1-4 respectively,
// A1, A2, A3, A4 are the angles for ports 1-4 respectively,
// E1, E2, E3, E4 are the error in the angles for ports 1-4 respectively,
// L is one byte that contains the conditions of the limit switch inputs.  
//
// Counts are int32_t.  
// Angles are uint16_t, scaled so that there are 65536 ticks in the absolute circle.
// Error are uint8_t, scaled so that there are 256 ticks in the absolute circle.
//
// The Limit Switch byte is coded as one bit per switch, with this pattern: "44332211",
// where the pair of digits stand for the port number the bits are associated with.
// The first bit in each pair is for the forward limit direction, labeled "FLMT" on the
// SR-MAG encoder, and the second bit in each pair is for the reverse direction, 
// labeled "RLMT" on the SR-MAG encoder.

// See the schematic for these:

#define PIN_SPI_CLK    2  
#define PIN_SPI_MOSI   3
#define PIN_SPI_MISO   4
#define PIN_SPI_CS     5
#define PIN_FLMT1      6
#define PIN_RLMT1      7
#define PIN_FLMT2      8
#define PIN_RLMT2      9
#define PIN_FLMT3     22
#define PIN_RLMT3     26
#define PIN_FLMT4     27
#define PIN_RLMT4     28

#define CURRENT_VERSION 5
#define BUF_LEN 30

uint8_t limit_pins[] = {PIN_FLMT4, PIN_RLMT4, PIN_FLMT3, PIN_RLMT3, PIN_FLMT2, PIN_RLMT2, PIN_FLMT1, PIN_RLMT1};

uint8_t buf_out0[BUF_LEN];
 uint8_t buf_out1[BUF_LEN];
uint8_t *buf_out = NULL;
volatile bool start_transfer = false;
volatile bool can_switch = false;
volatile bool buf_lock = false;
volatile int bestbuf = 0;            // Latest buffer to use (either 0 or 1)
volatile long intr_cntr = 0;

uint8_t buf_in[BUF_LEN];
uint32_t io_cycles = 0;
uint32_t buf_switches = 0;

// Setup the SPI.  It took lots of debugging on the ossilliscope to get
// the SPI setup to work with the RoboRio.
void setup_spi_output() {
    spi_init(spi0, 1000 * 1000);
    spi_set_format(spi0, 8, SPI_CPOL_1, SPI_CPHA_1, SPI_MSB_FIRST);  // Must be THIS WAY!  
    spi_set_slave(spi0, true);
    gpio_set_function(PIN_SPI_MISO, GPIO_FUNC_SPI);
    gpio_set_function(PIN_SPI_CLK, GPIO_FUNC_SPI);
    gpio_set_function(PIN_SPI_MOSI, GPIO_FUNC_SPI);
    gpio_set_function(PIN_SPI_CS, GPIO_FUNC_SPI);
}

// Setup the pins for the limit switches.  Note that some pins (the ADCs) must
// be set to SIO and input enabled.  For other pins, that is the default.
void setup_limit_inputs() {
    for(int i = 0; i < 8; i++) {
        gpio_set_function(limit_pins[i], GPIO_FUNC_SIO);
        gpio_set_input_enabled(limit_pins[i], true);
        gpio_set_dir(limit_pins[i], GPIO_IN);
        gpio_pull_up(limit_pins[i]);  // Not sure this is necessary
    }
}

// Retrives the condition of all the limit switch inputs, and builds a byte.
uint8_t get_limit_switch_byte() {
    int lims = 0;
    for(int i = 0; i < 8; i++) {
        int v = 0;
        if (gpio_get(limit_pins[i])) v = 1;
        lims = (lims << 1) | (0x0001 & v);
    }
    return lims;
}

// For Debugging Purposes
char* buftostr(uint8_t buf[]) {
    static char line[100];
    char temp[20];
    line[0] = 0;
    for(int i = 0; i < BUF_LEN; i++) {
        sprintf(temp, "%2x ", buf[i]);
        strcat(line, temp);
    }
    return line;
}

// Gets info from the background processes and encodes it for output.
void load_buffer(uint8_t *buf) {
    int32_t quad_counts[4];
    uint8_t buferr[4];
    int indx = 0;
    buf[indx++] = CURRENT_VERSION;
    quad_get_all_counts(quad_counts);
    memcpy(buf + indx, quad_counts, 16);
    indx += 16;
    for(int iport = 0; iport < 4; iport++) {
        float angle;
        uint8_t ierr = 0;
        uint16_t iangle = 0;
        int okay = get_angle_raw(iport, &angle);
        if (okay == 0) {
            ierr = 255;
            iangle = 0;
        }
        else {
            uint32_t iiangle = (uint32_t) (angle * 65536.0);
            if(iiangle > 65535) iiangle = 0;  
            iangle = (uint16_t) iiangle;
            float angle_err = get_angle_error(iport);
            uint32_t iierr = (uint32_t) angle_err * 256.0;
            if (iierr > 255) iierr = 255;
            ierr = (uint8_t) iierr;
        }
        memcpy(buf + indx, &iangle, 2);
        indx += 2;
        buferr[iport] = ierr;
    }
    // Append the error data -- four bytes...
    for (int iport = 0; iport < 4; iport++) {
        buf[indx++] = buferr[iport];
    }
    buf[indx++] = get_limit_switch_byte();
}

// On interrupt, a transfer is about to take place -- measured to be 7us in
// the future for first bit.  Here, we quickly switch buffers, then set the go flag.
void cs_iqr_handler(uint gpio, uint32_t event_mask)
{
    if(event_mask & GPIO_IRQ_EDGE_FALL) {
        if (gpio == PIN_SPI_CS) {
            intr_cntr++;
            while(buf_lock) ;  // wait till okay to change pointers.
            if (bestbuf == 0) buf_out = buf_out0;
            else              buf_out = buf_out1;
            can_switch = false;
            start_transfer = true;
        }
    }
}

// Processor 1 is responsible for monitoring the SPI bus and responding
// to data requests.
void proc1() {
    setup_spi_output();
    setup_limit_inputs();
    // Set up an interrupt on CS line 
    gpio_set_irq_enabled_with_callback(PIN_SPI_CS, GPIO_IRQ_EDGE_FALL, true, cs_iqr_handler);
    gpio_set_irq_enabled(PIN_SPI_CS, GPIO_IRQ_EDGE_FALL, true);
    while(1) {
        while(!start_transfer) ;  // Wait for single to go.
        spi_write_read_blocking(spi0, buf_out, buf_in, BUF_LEN);
        //char *p = buftostr(buf_out);
        //printf("buf_out = %s\n", p);
        start_transfer = false;
        can_switch = true;
        io_cycles++;
    }
}


// Processor 0 is responsible for reading the encoders.  Note that
// all the hard work is done via interrupts in the background.  The
// main loop is only needed to keep the output buffer loaded with
// the most up-to-date info. Note also, that processor 1 is started
// by processor 0.
int main()
{
    int32_t quad_counts[4];

    stdio_init_all();
    setup_spi_output();
    printf("Mag4 PWM/Quadrature Interface Device\n");
    init_mag4();
    multicore_launch_core1(proc1);

    // Info about this loop:  Cycle time is about 59 usec.  Used with the RoboRio, a transfer
    // occurs once every 20 milliseconds, and lasts .3ms. Therefore the duty cycle is 0.015.
    // When transefers are not occuring, the buffers are being updated and switched.  Our
    // debug counts show the the ratio of switched to non-switched is 0.009.  Therefore,
    // switching is occurring very often -- leading one to believe that the max latency
    // through the system is 59 usecs for the buffer load, and then .3 msecs for the transfer.
    // Therefore the latency at the RoboRio should only be about .36 msec!
    while (true)
    {
        if (bestbuf == 0) {
            load_buffer(buf_out1);
        } else {
            load_buffer(buf_out0);
        }
        if (can_switch) {
            buf_lock = true;
            bestbuf++;
            if(bestbuf > 1) bestbuf = 0;
            buf_lock = false;
        }
    }
}