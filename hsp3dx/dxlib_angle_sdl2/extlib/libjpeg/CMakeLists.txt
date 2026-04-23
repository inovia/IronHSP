# libjpeg-turbo 3.0.4 minimal bundle (hsp3dx dxlib_angle_sdl2 fork)
# upstream: https://github.com/libjpeg-turbo/libjpeg-turbo (IJG + BSD + zlib)
#
# 構成: 8-bit precision のみ、arithmetic coding 有効、lossless 有効、
#       SIMD 無効 (pure C) でシンプルに static lib 化。
# 除外: TurboJPEG (tj*) / Java / fuzz / cjpeg/djpeg/jpegtran ツール。
# SIMD は将来的に simd/arm64 を有効化可能 (コスト対効果で pending)。

cmake_minimum_required(VERSION 3.15)
project(dx_jpeg C)

# --- 設定 -----------------------------------------------------------------
set(VERSION "3.0.4")
set(LIBJPEG_TURBO_VERSION_NUMBER 3000004)
set(JPEG_LIB_VERSION 62)
set(COPYRIGHT_YEAR "2024")
set(BUILD "dxlib-bundle")
if(MSVC)
    set(HIDDEN "")
    set(INLINE "__forceinline")
    set(THREAD_LOCAL "__declspec(thread)")
else()
    set(HIDDEN "__attribute__((visibility(\"hidden\")))")
    set(INLINE "inline __attribute__((always_inline))")
    set(THREAD_LOCAL "__thread")
endif()

# size_t のサイズ判定
include(CheckTypeSize)
check_type_size(size_t SIZE_T)

# C_ARITH_CODING_SUPPORTED / D_ARITH_CODING_SUPPORTED / WITH_SIMD は cmakedefine
set(C_ARITH_CODING_SUPPORTED 1)
set(D_ARITH_CODING_SUPPORTED 1)
# SIMD は無効 (pure C)
# set(WITH_SIMD 1)  ← 無効

# コンパイラ互換
include(CheckSymbolExists)
check_symbol_exists(__builtin_ctzl "" HAVE_BUILTIN_CTZL)
if(MSVC)
    set(HAVE_INTRIN_H 1)
endif()

# RIGHT_SHIFT_IS_UNSIGNED の検出 (ほぼ全ての modern コンパイラは signed shift)
set(RIGHT_SHIFT_IS_UNSIGNED 0)

configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/jconfig.h.in
    ${CMAKE_CURRENT_BINARY_DIR}/jconfig.h
)
configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/jconfigint.h.in
    ${CMAKE_CURRENT_BINARY_DIR}/jconfigint.h
)

# --- ソース -----------------------------------------------------------------
set(JPEG_SRC
    ${CMAKE_CURRENT_SOURCE_DIR}/jcapimin.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jcapistd.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jccoefct.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jccolor.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jcdctmgr.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jcdiffct.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jchuff.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jcicc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jcinit.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jclhuff.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jclossls.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jcmainct.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jcmarker.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jcmaster.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jcomapi.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jcparam.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jcphuff.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jcprepct.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jcsample.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jctrans.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jdapimin.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jdapistd.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jdatadst.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jdatasrc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jdcoefct.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jdcolor.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jddctmgr.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jddiffct.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jdhuff.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jdicc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jdinput.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jdlhuff.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jdlossls.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jdmainct.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jdmarker.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jdmaster.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jdmerge.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jdphuff.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jdpostct.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jdsample.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jdtrans.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jerror.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jfdctflt.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jfdctfst.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jfdctint.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jidctflt.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jidctfst.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jidctint.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jidctred.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jmemmgr.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jmemnobs.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jpeg_nbits.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jquant1.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jquant2.c
    # jstdhuff.c は jcparam.c / jdhuff.c から #include される template なので除外
    ${CMAKE_CURRENT_SOURCE_DIR}/jutils.c
    # arithmetic coding (8-bit support)
    ${CMAKE_CURRENT_SOURCE_DIR}/jaricom.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jcarith.c
    ${CMAKE_CURRENT_SOURCE_DIR}/jdarith.c
    # color 565 (RGB 565) helpers (jdcol565.c / jdmrg565.c / jdmrgext.c / jccolext.c /
    #   jdcolext.c は他 .c から #include される template ファイルのため source には入れない)
)

add_library(dx_jpeg STATIC ${JPEG_SRC})

target_include_directories(dx_jpeg PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_BINARY_DIR}   # configure_file の jconfig.h / jconfigint.h 用
)

if(MSVC)
    target_compile_options(dx_jpeg PRIVATE /wd4244 /wd4267 /wd4996 /wd4018)
    target_compile_definitions(dx_jpeg PRIVATE _CRT_SECURE_NO_WARNINGS)
else()
    target_compile_options(dx_jpeg PRIVATE
        -Wno-implicit-function-declaration
        -Wno-unused-function
        -Wno-unused-variable
    )
endif()
