add_executable(magreader
    magreader.c)

# pull in common dependencies
target_link_libraries(magreader PRIVATE
    pico_stdlib
    pico_multicore
    hardware_pio
    hardware_pwm
    hardware_gpio
    hardware_clocks
    hardware_spi)

pico_enable_stdio_usb(magreader 1)
pico_enable_stdio_uart(magreader 0)

# create map/bin/hex file etc.
pico_add_extra_outputs(magreader) 