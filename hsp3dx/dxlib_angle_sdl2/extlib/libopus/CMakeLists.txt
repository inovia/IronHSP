# libopus 1.5.x minimal bundle (hsp3dx dxlib_angle_sdl2 fork)
# upstream: https://github.com/xiph/opus  (BSD 3-clause)
# Float-only build (decoder と encoder 両方)、SIMD サブディレクトリは除外。

cmake_minimum_required(VERSION 3.15)
project(dx_opus C)

# celt / silk / silk/float / src の全 .c を拾う
file(GLOB OPUS_CELT_SRC       ${CMAKE_CURRENT_SOURCE_DIR}/celt/*.c)
file(GLOB OPUS_SILK_SRC       ${CMAKE_CURRENT_SOURCE_DIR}/silk/*.c)
file(GLOB OPUS_SILK_FLOAT_SRC ${CMAKE_CURRENT_SOURCE_DIR}/silk/float/*.c)
file(GLOB OPUS_SRC_SRC        ${CMAKE_CURRENT_SOURCE_DIR}/src/*.c)

# 除外: fixed-point 専用 (float build なので不要)、mini_kfft (experimental)
list(FILTER OPUS_CELT_SRC EXCLUDE REGEX "mini_kfft\\.c$")

add_library(dx_opus STATIC
    ${OPUS_CELT_SRC}
    ${OPUS_SILK_SRC}
    ${OPUS_SILK_FLOAT_SRC}
    ${OPUS_SRC_SRC}
)
target_include_directories(dx_opus
    PUBLIC  ${CMAKE_CURRENT_SOURCE_DIR}/include
    PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/celt
    PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/silk
    PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/silk/float
    PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/src
)
target_compile_definitions(dx_opus PRIVATE
    OPUS_BUILD=1
    # SILK は fixed 非使用 = float (SigProc_FLP 経路)
    # encoder も要る場合 FLOAT_APPROX の代わりに有理実装 -> デフォルトでOK
)
if(MSVC)
    target_compile_definitions(dx_opus PRIVATE USE_ALLOCA=1 _CRT_SECURE_NO_WARNINGS)
    target_compile_options    (dx_opus PRIVATE /wd4244 /wd4267 /wd4018 /wd4305 /wd4146 /wd4701 /wd4703 /wd4127 /wd4334)
else()
    target_compile_definitions(dx_opus PRIVATE VAR_ARRAYS=1)
    target_compile_options    (dx_opus PRIVATE -Wno-implicit-function-declaration)
endif()
set_target_properties(dx_opus PROPERTIES POSITION_INDEPENDENT_CODE ON)
