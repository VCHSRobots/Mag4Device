// spicom.c -- Test spi communication with mag4 interface 
// 
// This program is an interface between mag4 and a laptop/desktop
// by way of usb.

#include <stdio.h>
#include <string.h>
#include "pico/stdlib.h"
#include "pico/time.h"
#include "hardware/spi.h"
#include "pico/multicore.h"


