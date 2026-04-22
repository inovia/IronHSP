# libvorbis / libvorbisfile minimal bundle (hsp3dx dxlib_angle_sdl2 fork)
# upstream: https://github.com/xiph/vorbis  (BSD 3-clause)

cmake_minimum_required(VERSION 3.15)
project(dx_vorbis C)

# libvorbis: decoder + encoder (DxLib は decode しか使わないが、
# vorbisfile.c が vorbisenc 参照するので丸ごと入れる)
add_library(dx_vorbis STATIC
    lib/analysis.c
    lib/bitrate.c
    lib/block.c
    lib/codebook.c
    lib/envelope.c
    lib/floor0.c
    lib/floor1.c
    lib/info.c
    lib/lookup.c
    lib/lpc.c
    lib/lsp.c
    lib/mapping0.c
    lib/mdct.c
    lib/psy.c
    lib/registry.c
    lib/res0.c
    lib/sharedbook.c
    lib/smallft.c
    lib/synthesis.c
    lib/vorbisenc.c
    lib/window.c
)
target_include_directories(dx_vorbis PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)
target_include_directories(dx_vorbis PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/lib
)
target_link_libraries(dx_vorbis PUBLIC dx_ogg)
set_target_properties(dx_vorbis PROPERTIES POSITION_INDEPENDENT_CODE ON)

# libvorbisfile: 便利 wrapper (ov_open_callbacks など)
add_library(dx_vorbisfile STATIC
    lib/vorbisfile.c
)
target_include_directories(dx_vorbisfile PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)
target_link_libraries(dx_vorbisfile PUBLIC dx_vorbis dx_ogg)
set_target_properties(dx_vorbisfile PROPERTIES POSITION_INDEPENDENT_CODE ON)

if(MSVC)
    target_compile_options(dx_vorbis     PRIVATE /wd4244 /wd4267 /wd4018 /wd4305 /wd4996)
    target_compile_options(dx_vorbisfile PRIVATE /wd4244 /wd4267 /wd4018 /wd4305 /wd4996)
endif()
