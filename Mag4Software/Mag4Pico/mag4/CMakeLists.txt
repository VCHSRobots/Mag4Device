add_executable(mag4)

pico_generate_pio_header(mag4 ${CMAKE_CURRENT_LIST_DIR}/pwm_rd4.pio)
pico_generate_pio_header(mag4 ${CMAKE_CURRENT_LIST_DIR}/quad.pio)

target_sources(mag4 PRIVATE mag4.c mag4_comm.c)

target_link_libraries(mag4 PRIVATE
        pico_stdlib
        pico_multicore
        hardware_pio
        hardware_pwm
        hardware_gpio
        hardware_clocks
        hardware_spi
        )

pico_enable_stdio_usb(mag4 1)
pico_enable_stdio_uart(mag4 0)

pico_add_extra_outputs(mag4)