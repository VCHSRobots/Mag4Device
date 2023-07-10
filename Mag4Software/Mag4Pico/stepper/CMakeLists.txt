add_executable(stepper
        stepper.c
        )

#target_compile_definitions(blink PRIVATE
#        PICO_DEFAULT_UART_BAUD_RATE=230400)

# pull in common dependencies
target_link_libraries(stepper PRIVATE
        pico_stdlib
        hardware_irq
        pico_multicore)

pico_enable_stdio_usb(stepper 1)
pico_enable_stdio_uart(stepper 0)

# create map/bin/hex file etc.
pico_add_extra_outputs(stepper)