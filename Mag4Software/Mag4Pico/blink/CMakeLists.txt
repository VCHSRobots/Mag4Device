add_executable(blink
        blink.c
        )

#target_compile_definitions(blink PRIVATE
#        PICO_DEFAULT_UART_BAUD_RATE=230400)

# pull in common dependencies
target_link_libraries(blink pico_stdlib)

pico_enable_stdio_usb(blink 1)
pico_enable_stdio_uart(blink 1)

# create map/bin/hex file etc.
pico_add_extra_outputs(blink)


