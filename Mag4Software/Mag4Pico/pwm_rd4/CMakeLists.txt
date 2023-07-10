add_executable(pwm_rd4)

pico_generate_pio_header(pwm_rd4 ${CMAKE_CURRENT_LIST_DIR}/pwm_rd4.pio)

target_sources(pwm_rd4 PRIVATE pwm_rd4_test.cpp pwm_rd4.cpp)

target_link_libraries(pwm_rd4 PRIVATE
        pico_stdlib
        hardware_pio
        hardware_pwm
        hardware_gpio
        )

pico_add_extra_outputs(pwm_rd4)