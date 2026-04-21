# CMakeLists.txt — hsp3dx Android ランタイム (libhsp3dx.so)
#
# DxLib Android の libDxLib.a などをリンクし、
# hsp3 コア + hsp3dx 拡張 + Android 専用エントリを 1 つの .so にまとめる。

cmake_minimum_required(VERSION 3.10.2)

project("hsp3dx")

# ---- パスの定義 ----
# template/app/src/main/cpp/ → リポジトリ root は 6 階層上
set(IRONHSP_ROOT   ${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../..)
set(HSP3_DIR       ${IRONHSP_ROOT}/hsp3)
set(HSP3NET_DIR    ${IRONHSP_ROOT}/hsp3net)
set(HSP3DX_DIR     ${IRONHSP_ROOT}/hsp3dx)
set(DXLIB_DIR      ${HSP3DX_DIR}/extlib/dxlib_android/DxLib_Android/Lib_AndroidStudio)

include_directories(
    ${HSP3_DIR}
    ${HSP3DX_DIR}/src
    ${HSP3DX_DIR}/extlib/picojson
    ${DXLIB_DIR}/${ANDROID_ABI}
)
link_directories( ${DXLIB_DIR}/${ANDROID_ABI} )

add_compile_definitions(
    HSP3DX
    HSPUTF8
    HSPANDROID
    HSPDEBUG
    _HSP64
    HSP64
)

set(HSP3_SRC
    ${HSP3_DIR}/hsp3.cpp
    ${HSP3_DIR}/hsp3code.cpp
    ${HSP3_DIR}/hsp3crypt.cpp
    ${HSP3_DIR}/hsp3debug.cpp
    ${HSP3_DIR}/hsp3int.cpp
    ${HSP3_DIR}/hsp3utfcnv.cpp
    ${HSP3_DIR}/hspvar_core.cpp
    ${HSP3_DIR}/hspvar_double.cpp
    ${HSP3_DIR}/hspvar_int.cpp
    ${HSP3_DIR}/hspvar_int64.cpp
    ${HSP3_DIR}/hspvar_label.cpp
    ${HSP3_DIR}/hspvar_str.cpp
    ${HSP3_DIR}/hspvar_struct.cpp
    ${HSP3_DIR}/hspvar_wstr.cpp
    ${HSP3_DIR}/stack.cpp
    ${HSP3_DIR}/strbuf.cpp
    ${HSP3_DIR}/strnote.cpp
    ${HSP3_DIR}/dpmread.cpp
    ${HSP3_DIR}/filepack.cpp
    # #defstruct (NSTRUCT) 対応のため hsp3net の実装を共有リンク
    ${HSP3NET_DIR}/hspvar_nstruct.cpp
)

set(HSP3DX_SRC
    ${HSP3DX_DIR}/src/hgio_dx.cpp
    ${HSP3DX_DIR}/src/hsp3dxcl.cpp
    ${HSP3DX_DIR}/src/hsp3dx_extcmd.cpp
    ${HSP3DX_DIR}/src/hsp3dx_console.cpp
    ${HSP3DX_DIR}/src/hsp3dx_dxlib_auto.cpp
    ${HSP3DX_DIR}/src/hsp3dx_dxlib_auto_f.cpp
    ${HSP3DX_DIR}/src/hsp3dx_json.cpp
    # Android プラットフォーム固有
    ${HSP3DX_DIR}/src/hsp3dx_platform_io_ndk.cpp
    ${HSP3DX_DIR}/src/hsp3dx_http_ndk.cpp
    ${HSP3DX_DIR}/src/hsp3dx_ws_ndk.cpp
    ${HSP3DX_DIR}/src/main_ndk.cpp
)

add_library(hsp3dx SHARED ${HSP3_SRC} ${HSP3DX_SRC})

target_link_libraries(hsp3dx
    android
    log
    GLESv1_CM
    EGL
    GLESv2
    OpenSLES
    m
    DxLib
    DxUseCLib
    jpeg
    png
    zlib
    tiff
    theora_static
    vorbis_static
    vorbisfile_static
    ogg_static
    bullet
    opus
)
