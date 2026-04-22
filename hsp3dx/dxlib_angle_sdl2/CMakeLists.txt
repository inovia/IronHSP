cmake_minimum_required(VERSION 3.16)
project(hsp3dx_angle_sdl2 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# =========================================================================
# hsp3dx Mac/Linux/Web 移植 PoC ビルド (Stage 1)
#
# 目的: SDL2 でウィンドウを開き、OpenGL ES 2.0 相当のコンテキストを
#       取得して、任意色でクリアする最小動作を各 OS で確認する。
#
# Stage 1 (本ファイル): Win(desktop GL) + SDL2 のみ。ANGLE はまだ使わない
# Stage 2 以降:         ANGLE を EGL として挟み込み、Metal/Vulkan/WebGPU
#                       経由の GLES を実現する。
# =========================================================================

# --- SDL2 (prebuilt VC package) -----------------------------------------
set(SDL2_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/extlib/SDL2")

if(NOT EXISTS "${SDL2_ROOT}/include/SDL.h")
    message(FATAL_ERROR "SDL2 not found at ${SDL2_ROOT}. "
                        "Place SDL2-devel-*-VC package contents there.")
endif()

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    set(SDL2_LIB_DIR "${SDL2_ROOT}/lib/x64")
else()
    set(SDL2_LIB_DIR "${SDL2_ROOT}/lib/x86")
endif()

add_library(SDL2::SDL2 SHARED IMPORTED)
set_target_properties(SDL2::SDL2 PROPERTIES
    IMPORTED_LOCATION             "${SDL2_LIB_DIR}/SDL2.dll"
    IMPORTED_IMPLIB               "${SDL2_LIB_DIR}/SDL2.lib"
    INTERFACE_INCLUDE_DIRECTORIES "${SDL2_ROOT}/include"
)

add_library(SDL2::SDL2main STATIC IMPORTED)
set_target_properties(SDL2::SDL2main PROPERTIES
    IMPORTED_LOCATION "${SDL2_LIB_DIR}/SDL2main.lib"
)

# --- DxLib portable fork -----------------------------------------------
# dxlib_portable/ = extlib/DxLibMake/ の完全フォーク (Desktop 用 patch 適用済)。
# extlib/DxLibMake/ は read-only reference (diff 用に保持)。
set(DXLIB_PORTABLE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/dxlib_portable")

# --- 共通: DxLib desktop 用コンパイル設定 -------------------------------
function(dxlib_desktop_settings target)
    target_include_directories(${target} PRIVATE ${DXLIB_PORTABLE_DIR})
    target_compile_definitions(${target} PRIVATE
        DX_PLATFORM_DESKTOP_SDL2=1
        DX_GCC_COMPILE=1
        DX_NON_INLINE_ASM=1
        # Stage 3 scope: skip large subsystems until we write their Desktop backends
        DX_NON_MOVIE=1
        DX_NON_LIVE2D_CUBISM4=1
        DX_NON_MODEL=1
        DX_NON_BULLET_PHYSICS=1
        DX_NON_FILTER=1
        DX_NON_MASK=1
        DX_NON_SOUND=1
        DX_NON_FONT=1
        DX_NON_INPUT=1
        DX_NON_TIFFREAD=1
        DX_NON_JPEGREAD=1
        DX_NON_PNGREAD=1
        DX_NON_OGGVORBIS=1
        DX_NON_OGGTHEORA=1
        DX_NON_OPUS=1
    )
    if(MSVC)
        target_compile_options(${target} PRIVATE
            /source-charset:.932
            /execution-charset:utf-8
            /W3 /wd4996 /wd4819 /wd4005
        )
    endif()
endfunction()

# --- Stage 2: DxLib.h header-only compile test --------------------------
add_executable(stage2_header_compile
    src/stage2_header_compile.cpp
)
dxlib_desktop_settings(stage2_header_compile)

# --- Stage 3: dxlib_portable 最小静的ライブラリ -------------------------
# まずは Desktop 側 platform impl と、platform-独立の中核ソース少数を対象に
# compile & link するか検証する。
add_library(dxlib_portable_stage3 STATIC
    # Desktop platform layer
    ${DXLIB_PORTABLE_DIR}/Desktop/DxBaseFuncDesktop.cpp
    ${DXLIB_PORTABLE_DIR}/Desktop/DxLogDesktop.cpp
    ${DXLIB_PORTABLE_DIR}/Desktop/DxMemoryDesktop.cpp
    ${DXLIB_PORTABLE_DIR}/Desktop/DxThreadDesktop.cpp
    ${DXLIB_PORTABLE_DIR}/Desktop/DxFileDesktop.cpp
    ${DXLIB_PORTABLE_DIR}/Desktop/DxSystemDesktop.cpp
    # 中核 (platform-独立)
    ${DXLIB_PORTABLE_DIR}/DxBaseFunc.cpp
    ${DXLIB_PORTABLE_DIR}/DxChar.cpp
    ${DXLIB_PORTABLE_DIR}/DxFile.cpp
    ${DXLIB_PORTABLE_DIR}/DxLog.cpp
    ${DXLIB_PORTABLE_DIR}/DxMemory.cpp
    ${DXLIB_PORTABLE_DIR}/DxThread.cpp
    ${DXLIB_PORTABLE_DIR}/DxHeap.cpp
    ${DXLIB_PORTABLE_DIR}/DxSystem.cpp
    ${DXLIB_PORTABLE_DIR}/DxArchive_.cpp
    ${DXLIB_PORTABLE_DIR}/DxCharCodeTable.cpp
    ${DXLIB_PORTABLE_DIR}/DxMath.cpp
    ${DXLIB_PORTABLE_DIR}/DxUseCLib.cpp
    ${DXLIB_PORTABLE_DIR}/DxHandle.cpp
    ${DXLIB_PORTABLE_DIR}/DxASyncLoad.cpp
    # Stage 5
    ${DXLIB_PORTABLE_DIR}/DxBaseImage.cpp
    ${DXLIB_PORTABLE_DIR}/DxSoftImage.cpp
    ${DXLIB_PORTABLE_DIR}/DxMemImg.cpp
    ${DXLIB_PORTABLE_DIR}/DxMemImgDrawFunction0.cpp
    ${DXLIB_PORTABLE_DIR}/DxMemImgDrawFunction1.cpp
    ${DXLIB_PORTABLE_DIR}/DxMemImgDrawFunction2.cpp
    ${DXLIB_PORTABLE_DIR}/DxMemImgDrawFunction3.cpp
    ${DXLIB_PORTABLE_DIR}/DxGraphics.cpp
    ${DXLIB_PORTABLE_DIR}/DxGateway.cpp
    ${DXLIB_PORTABLE_DIR}/Desktop/DxGraphicsDesktop.cpp
    ${DXLIB_PORTABLE_DIR}/Desktop/DxGraphicsDesktop_stubs.cpp
)
dxlib_desktop_settings(dxlib_portable_stage3)
target_link_libraries(dxlib_portable_stage3 PUBLIC SDL2::SDL2 SDL2::SDL2main)

# --- Stage 4: DxLib_Init link test --------------------------------------
add_executable(stage4_init_test src/stage4_init_test.cpp)
dxlib_desktop_settings(stage4_init_test)
target_link_libraries(stage4_init_test PRIVATE dxlib_portable_stage3)
add_custom_command(TARGET stage4_init_test POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        "${SDL2_LIB_DIR}/SDL2.dll"
        "$<TARGET_FILE_DIR:stage4_init_test>/SDL2.dll"
)

# --- Stage 6: 実窓 + clear + flip (DxLib 経由) ---------------------------
add_executable(stage6_window_clear src/stage6_window_clear.cpp)
dxlib_desktop_settings(stage6_window_clear)
target_link_libraries(stage6_window_clear PRIVATE dxlib_portable_stage3 opengl32)
add_custom_command(TARGET stage6_window_clear POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        "${SDL2_LIB_DIR}/SDL2.dll"
        "$<TARGET_FILE_DIR:stage6_window_clear>/SDL2.dll"
)

# --- Stage 7: DrawFillBox / DrawLine / DrawPixel 可視テスト --------------
add_executable(stage7_draw_primitives src/stage7_draw_primitives.cpp)
dxlib_desktop_settings(stage7_draw_primitives)
target_link_libraries(stage7_draw_primitives PRIVATE dxlib_portable_stage3 opengl32)
add_custom_command(TARGET stage7_draw_primitives POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        "${SDL2_LIB_DIR}/SDL2.dll"
        "$<TARGET_FILE_DIR:stage7_draw_primitives>/SDL2.dll"
)

# --- Stage 8: Circle / Oval / Triangle / Quadrangle / LineBox ----------
add_executable(stage8_more_primitives src/stage8_more_primitives.cpp)
dxlib_desktop_settings(stage8_more_primitives)
target_link_libraries(stage8_more_primitives PRIVATE dxlib_portable_stage3 opengl32)
add_custom_command(TARGET stage8_more_primitives POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        "${SDL2_LIB_DIR}/SDL2.dll"
        "$<TARGET_FILE_DIR:stage8_more_primitives>/SDL2.dll"
)

# --- Stage 9: Animated + Set/Thickness variants -------------------------
add_executable(stage9_animated src/stage9_animated.cpp)
dxlib_desktop_settings(stage9_animated)
target_link_libraries(stage9_animated PRIVATE dxlib_portable_stage3 opengl32)
add_custom_command(TARGET stage9_animated POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        "${SDL2_LIB_DIR}/SDL2.dll"
        "$<TARGET_FILE_DIR:stage9_animated>/SDL2.dll"
)

# --- Stage 1 PoC ---------------------------------------------------------
add_executable(stage1_empty_window WIN32
    src/stage1_empty_window.cpp
)

target_link_libraries(stage1_empty_window PRIVATE
    SDL2::SDL2main
    SDL2::SDL2
    opengl32
)

# Copy SDL2.dll next to the built exe
add_custom_command(TARGET stage1_empty_window POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        "${SDL2_LIB_DIR}/SDL2.dll"
        "$<TARGET_FILE_DIR:stage1_empty_window>/SDL2.dll"
)

if(MSVC)
    target_compile_options(stage1_empty_window PRIVATE /utf-8 /W3)
    target_compile_definitions(stage1_empty_window PRIVATE
        _CRT_SECURE_NO_WARNINGS
        UNICODE _UNICODE
    )
endif()
