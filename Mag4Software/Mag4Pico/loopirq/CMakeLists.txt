add_executable(loopirq
        loopirq.c
        )

# pull in common dependencies
target_link_libraries(loopirq pico_stdlib)
target_link_libraries(loopirq hardware_irq)
target_link_libraries(loopirq pico_multicore)


pico_enable_stdio_usb(loopirq 1)
pico_enable_stdio_uart(loopirq 1)

# create map/bin/hex file etc.
pico_add_extra_outputs(loopirq)