# libtiff 4.7 minimal bundle (hsp3dx dxlib_angle_sdl2 fork)
# upstream: https://gitlab.com/libtiff/libtiff  (libtiff license, BSD-like)
# 同梱 codec: LZW / PackBits / Deflate(zlib) / CCITT / Thunder / NeXT / LogLuv
# 非同梱: JPEG / OJPEG / JBIG / LZMA / Zstd / LERC / WebP / PixarLog

cmake_minimum_required(VERSION 3.15)
project(dx_tiff C)

set(TIFF_SRCS
    libtiff/tif_aux.c
    libtiff/tif_close.c
    libtiff/tif_codec.c
    libtiff/tif_color.c
    libtiff/tif_compress.c
    libtiff/tif_dir.c
    libtiff/tif_dirinfo.c
    libtiff/tif_dirread.c
    libtiff/tif_dirwrite.c
    libtiff/tif_dumpmode.c
    libtiff/tif_error.c
    libtiff/tif_extension.c
    libtiff/tif_fax3.c
    libtiff/tif_fax3sm.c
    libtiff/tif_flush.c
    libtiff/tif_getimage.c
    libtiff/tif_hash_set.c
    libtiff/tif_luv.c
    libtiff/tif_lzw.c
    libtiff/tif_next.c
    libtiff/tif_open.c
    libtiff/tif_packbits.c
    libtiff/tif_predict.c
    libtiff/tif_print.c
    libtiff/tif_read.c
    libtiff/tif_strip.c
    libtiff/tif_swab.c
    libtiff/tif_thunder.c
    libtiff/tif_tile.c
    libtiff/tif_version.c
    libtiff/tif_warning.c
    libtiff/tif_write.c
    libtiff/tif_zip.c
)
if(WIN32)
    list(APPEND TIFF_SRCS libtiff/tif_win32.c)
else()
    list(APPEND TIFF_SRCS libtiff/tif_unix.c)
endif()

add_library(dx_tiff STATIC ${TIFF_SRCS})
target_include_directories(dx_tiff
    PUBLIC  ${CMAKE_CURRENT_SOURCE_DIR}/libtiff
)
target_link_libraries(dx_tiff PUBLIC dx_zlib)
if(MSVC)
    target_compile_definitions(dx_tiff PRIVATE _CRT_SECURE_NO_WARNINGS _CRT_NONSTDC_NO_WARNINGS)
    target_compile_options    (dx_tiff PRIVATE /wd4244 /wd4267 /wd4018 /wd4305 /wd4146 /wd4101 /wd4127 /wd4273 /wd4090 /wd4334)
else()
    target_compile_options    (dx_tiff PRIVATE -Wno-implicit-function-declaration)
endif()
set_target_properties(dx_tiff PROPERTIES POSITION_INDEPENDENT_CODE ON)
