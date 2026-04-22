# libtheora decoder-only bundle (hsp3dx dxlib_angle_sdl2 fork)
# upstream: https://github.com/xiph/theora  (BSD 3-clause)
# エンコーダは含めない (DxLib は再生のみ)、SIMD サブディレクトリも除外。

cmake_minimum_required(VERSION 3.15)
project(dx_theoradec C)

add_library(dx_theoradec STATIC
    lib/apiwrapper.c
    lib/bitpack.c
    lib/decapiwrapper.c
    lib/decinfo.c
    lib/decode.c
    lib/dequant.c
    lib/fragment.c
    lib/huffdec.c
    lib/idct.c
    lib/info.c
    lib/internal.c
    lib/quant.c
    lib/state.c
)
target_include_directories(dx_theoradec
    PUBLIC  ${CMAKE_CURRENT_SOURCE_DIR}/include
    PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/lib
)
target_link_libraries(dx_theoradec PUBLIC dx_ogg)

# libtheora は OC_CPU_X86 / OC_X86_ASM 等で asm を有効化するが、
# ここでは pure C のみでビルド (非 asm パス) するため何も defines 追加しない。

if(MSVC)
    target_compile_definitions(dx_theoradec PRIVATE _CRT_SECURE_NO_WARNINGS)
    target_compile_options    (dx_theoradec PRIVATE /wd4244 /wd4267 /wd4018 /wd4305 /wd4996 /wd4146 /wd4101 /wd4127)
else()
    target_compile_options    (dx_theoradec PRIVATE -Wno-implicit-function-declaration)
endif()
set_target_properties(dx_theoradec PROPERTIES POSITION_INDEPENDENT_CODE ON)
