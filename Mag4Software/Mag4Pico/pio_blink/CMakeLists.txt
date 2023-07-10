add_executable(pio_blink)

pico_generate_pio_header(pio_blink ${CMAKE_CURRENT_LIST_DIR}/blink.pio)

target_sources(pio_blink PRIVATE pio_blink.c)

target_link_libraries(pio_blink PRIVATE
    pico_stdlib
    pico_multicore
    hardware_pio)
    
pico_enable_stdio_usb(pio_blink 1)
pico_enable_stdio_uart(pio_blink 1)

# create map/bin/hex file etc.  
pico_add_extra_outputs(pio_blink)