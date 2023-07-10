// magreader.c -- Test spi communication with mag4 interface 
// 
// This program is an interface between the mag4 module 
// and a laptop/desktop by way of usb.

#include <stdio.h>
#include <string.h>
#include "pico/stdlib.h"
#include "pico/time.h" 

#define PIN_SPI_CS     5

#define BUF_LEN 18

uint8_t buf_out[BUF_LEN];
uint8_t buf_in[BUF_LEN];

uint32_t counts[4];
uint16_t angles[4];
uint8_t  angerr[4];
uint8_t  limits;
char     version[18];

void setup_spi_channel() {
    spi_init(spi0, 1000 * 1000);
    spi_set_slave(spi0, false);
    spi_set_format(spi0, 8, SPI_CPOL_0, SPI_CPHA_0, SPI_LSB_FIRST);
    gpio_set_function(PIN_SPI_MISO, GPIO_FUNC_SPI);
    gpio_set_function(PIN_SPI_CLK, GPIO_FUNC_SPI);
    gpio_set_function(PIN_SPI_MOSI, GPIO_FUNC_SPI);
    gpio_set_function(PIN_SPI_CS, GPIO_FUNC_SPI);
}

uint32_t counts[4];
uint16_t angles[4];
uint8_t  angerr[4];
uint8_t  limits;
char     version[18];

void dumpbuf(char c, uint8_t *buf, int n) {
    printf("%c ", c);
    for (int i = 0; i < n; i++) {
        printf(" %02x", buf[i]);
    }
    printf("\n");
}

void read_mag4_raw() {
    // Attempt to flush out old data from FIFO
    while(spi_is_readable(spi0)) {
        printf("Flushing\n");
        spi_read_blocking(spi0, 0, buf_in, 1);
    }
    buf_out[0] = 'c';
    spi_write_read_blocking(spi0, buf_out, buf_in, BUF_LEN);  // Send c, garbage back
    buf_out[0] = 'a';
    memset(buf_in, 0, BUF_LEN);
    spi_write_read_blocking(spi0, buf_out, buf_in, BUF_LEN);  // Send a, counts back
    dumpbuf('c', buf_in, BUF_LEN);
    buf_out[0] = 'v';
    memset(buf_in, 0, BUF_LEN);
    spi_write_read_blocking(spi0, buf_out, buf_in, BUF_LEN);  // Send v, angles back
    dumpbuf('a', buf_in, BUF_LEN);
    buf_out[0] = 'c';
    memset(buf_in, 0, BUF_LEN);
    spi_write_read_blocking(spi0, buf_out, buf_in, BUF_LEN);  // Send c, version back
    dumpbuf('v', buf_in, BUF_LEN);
}

void read_mag4() {
    buf_out[0] = 'c';
    spi_write_read_blocking(spi0, buf_out, buf_in, BUF_LEN);  // Send c, garbage back
    buf_out[0] = 'a';
    spi_write_read_blocking(spi0, buf_out, buf_in, BUF_LEN);  // Send a, counts back
    if (buf_in[0] != 'c') {
        memset(counts, 0, 16);
        printf("\nBad 'c' resp. Got = %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x  %02x  %02xresponse.  Should be 'c'.\n");
        return;
    }
    memcpy(counts, buf_in + 1, 16);
    buf_out[0] = 'v';
    spi_write_read_blocking(spi0, buf_out, buf_in, BUF_LEN); // Send v, angles back
    if (buf_in[0] != 'a') {
        memset(angles, 0, 8);
        printf("Bad response. Should be 'a'.\n");
        return;
    }
    memcpy(angles, buf_in + 1, 8);
    memcpy(angerr, buf_in + 9, 4);
    limits = buf_in[13];
    buf_out[0] = 'c';
    spi_write_read_blocking(spi0, buf_out, buf_in, BUF_LEN); // Send c, version back
    if (buf_in[0] != 'v') {
        strcpy(version, "[Err!]");
        printf("Bad response. Should be 'v'.\n");
        return;
    }
    memcpy(version, buf_in + 1, 17);
    version[17] = 0;
}

void main() {
    stdio_init_all();
    setup_spi_channel();
    printf("MagReader.\n");
    uint32_t n = 0;
    while(1) {
        read_mag4_raw();
        // read_mag4();
        // if (n % 50 == 0) printf("\nVersion = %s\n", version);
        // n++;
        // printf("%010ld %06d %03d   %010ld %06d %03d   %010ld %06d %03d   %010ld %06d %03d",
        //     counts[0], angles[0], angerr[0],
        //     counts[1], angles[1], angerr[1],
        //     counts[2], angles[2], angerr[2],
        //     counts[3], angles[3], angerr[3]
        //     );
        sleep_ms(250);
    }
}