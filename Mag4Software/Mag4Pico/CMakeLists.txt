cmake_minimum_required(VERSION 3.12)

include(pico_sdk_import.cmake)
project(mag4dev C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

pico_sdk_init()

# Add Subprojects
add_subdirectory(blink)
add_subdirectory(adder)
add_subdirectory(loopirq)
add_subdirectory(encoders)
add_subdirectory(pio_blink)
add_subdirectory(pwm_reader)
add_subdirectory(pwm_rd4)
add_subdirectory(mag4)
add_subdirectory(stepper)
add_subdirectory(motordrive)
add_subdirectory(magreader)

add_compile_options(-Wall
        -Wno-format          # int != int32_t as far as the compiler is concerned because gcc has int32_t as long int
        -Wno-unused-function # we have some for the docs that aren't called
        -Wno-maybe-uninitialized
        )
