# libogg 1.3.x minimal bundle (hsp3dx dxlib_angle_sdl2 fork)
# upstream: https://github.com/xiph/ogg  (BSD 3-clause)

cmake_minimum_required(VERSION 3.15)
project(dx_ogg C)

add_library(dx_ogg STATIC
    src/bitwise.c
    src/framing.c
)
target_include_directories(dx_ogg PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)
set_target_properties(dx_ogg PROPERTIES
    POSITION_INDEPENDENT_CODE ON
)
