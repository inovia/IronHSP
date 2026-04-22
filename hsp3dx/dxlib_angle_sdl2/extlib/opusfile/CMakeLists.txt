# opusfile minimal bundle (hsp3dx dxlib_angle_sdl2 fork)
# upstream: https://github.com/xiph/opusfile  (BSD 2-clause)
# http/wincerts は除外 (file decode のみなら不要)

cmake_minimum_required(VERSION 3.15)
project(dx_opusfile C)

add_library(dx_opusfile STATIC
    src/opusfile.c
    src/info.c
    src/internal.c
    src/stream.c
)
target_include_directories(dx_opusfile
    PUBLIC  ${CMAKE_CURRENT_SOURCE_DIR}/include
    PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/src
)
target_compile_definitions(dx_opusfile PRIVATE
    OP_DISABLE_HTTP=1
    OP_ENABLE_ASSERTIONS=0
    OP_DISABLE_FLOAT_API=0
)
target_link_libraries(dx_opusfile PUBLIC dx_opus dx_ogg)
if(MSVC)
    target_compile_definitions(dx_opusfile PRIVATE _CRT_SECURE_NO_WARNINGS)
    target_compile_options    (dx_opusfile PRIVATE /wd4244 /wd4267 /wd4018 /wd4996)
endif()
set_target_properties(dx_opusfile PROPERTIES POSITION_INDEPENDENT_CODE ON)
