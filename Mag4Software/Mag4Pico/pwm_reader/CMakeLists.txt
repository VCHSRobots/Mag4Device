add_executable(pwm4)

pico_generate_pio_header(pwm4 ${CMAKE_CURRENT_LIST_DIR}/pwmin.pio)

target_sources(pwm4 PRIVATE pwm4.cpp pwmin.cpp)

target_link_libraries(pwm4 PRIVATE
        pico_stdlib
        hardware_pio
        hardware_pwm
        hardware_gpio
        )

pico_add_extra_outputs(pwm4)