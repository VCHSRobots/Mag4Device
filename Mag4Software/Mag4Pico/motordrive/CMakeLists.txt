add_executable(motordrive
    motordrive.c
        )

#target_compile_definitions(blink PRIVATE
#        PICO_DEFAULT_UART_BAUD_RATE=230400)

# pull in common dependencies
target_link_libraries(motordrive pico_stdlib)
target_link_libraries(motordrive hardware_irq)
target_link_libraries(motordrive hardware_uart)
target_link_libraries(motordrive pico_multicore)

pico_enable_stdio_usb(motordrive 1)
pico_enable_stdio_uart(motordrive 1)

# create map/bin/hex file etc.
pico_add_extra_outputs(motordrive)