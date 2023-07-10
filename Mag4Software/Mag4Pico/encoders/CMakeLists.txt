add_executable(encoders)

pico_generate_pio_header(encoders ${CMAKE_CURRENT_LIST_DIR}/swerve_encoder.pio)
pico_generate_pio_header(encoders ${CMAKE_CURRENT_LIST_DIR}/pwm_reader.pio)

target_sources(encoders PRIVATE swerve_encoder.c)

target_link_libraries(encoders PRIVATE
    pico_stdlib
    pico_multicore
    hardware_pio)
    
pico_enable_stdio_usb(encoders 1)
pico_enable_stdio_uart(encoders 1)

# create map/bin/hex file etc.  
pico_add_extra_outputs(encoders)




