cmake_minimum_required(VERSION 3.16)
project(hsp3dx_angle_sdl2 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# =========================================================================
# hsp3dx Mac/Linux/Web 移植 PoC
#
# 対応プラットフォーム:
#   - Windows MSVC (extlib/SDL2 の prebuilt VC + opengl32)
#   - Linux GCC/Clang (apt install libsdl2-dev + libGL)
#   - macOS Clang + Apple Silicon (brew install sdl2 + OpenGL.framework)
# =========================================================================

# --- SDL2 ---------------------------------------------------------------

if(WIN32)
    # Windows: extlib/ 配下の prebuilt VC パッケージ
    set(SDL2_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/extlib/SDL2")
    if(NOT EXISTS "${SDL2_ROOT}/include/SDL.h")
        message(FATAL_ERROR "SDL2 not found at ${SDL2_ROOT}")
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
        INTERFACE_INCLUDE_DIRECTORIES "${SDL2_ROOT}/include")
    add_library(SDL2::SDL2main STATIC IMPORTED)
    set_target_properties(SDL2::SDL2main PROPERTIES
        IMPORTED_LOCATION "${SDL2_LIB_DIR}/SDL2main.lib")
    set(GL_LIB opengl32)
else()
    # Linux / Mac: pkg-config か find_package で探す
    find_package(SDL2 REQUIRED)
    # Mac/Linux では SDL2main は不要/optional
    if(NOT TARGET SDL2::SDL2)
        # 古い find module の場合 (SDL2_INCLUDE_DIRS + SDL2_LIBRARIES 形式)
        add_library(SDL2::SDL2 INTERFACE IMPORTED)
        target_include_directories(SDL2::SDL2 INTERFACE ${SDL2_INCLUDE_DIRS})
        target_link_libraries(SDL2::SDL2 INTERFACE ${SDL2_LIBRARIES})
    endif()
    if(NOT TARGET SDL2::SDL2main)
        add_library(SDL2::SDL2main INTERFACE IMPORTED)
    endif()
    # OpenGL
    find_package(OpenGL REQUIRED)
    set(GL_LIB OpenGL::GL)
endif()

# --- DxLib portable fork ------------------------------------------------
set(DXLIB_PORTABLE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/dxlib_portable")

# --- 共通: DxLib desktop 用コンパイル設定 ------------------------------
function(dxlib_desktop_settings target)
    target_include_directories(${target} PRIVATE ${DXLIB_PORTABLE_DIR})
    target_compile_definitions(${target} PRIVATE
        DX_PLATFORM_DESKTOP_SDL2=1
        DX_GCC_COMPILE=1
        DX_NON_INLINE_ASM=1
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
    else()
        # GCC/Clang (Linux/Mac/emscripten): ShiftJIS 混在を許容
        target_compile_options(${target} PRIVATE
            -Wno-invalid-source-encoding
            -Wno-macro-redefined
            -Wno-null-dereference
            -Wno-unused-parameter
        )
    endif()
endfunction()

# --- Stage 2: header-only parse -----------------------------------------
add_executable(stage2_header_compile src/stage2_header_compile.cpp)
dxlib_desktop_settings(stage2_header_compile)

# --- Stage 3: dxlib_portable static library -----------------------------
add_library(dxlib_portable_stage3 STATIC
    # Desktop platform layer
    ${DXLIB_PORTABLE_DIR}/Desktop/DxBaseFuncDesktop.cpp
    ${DXLIB_PORTABLE_DIR}/Desktop/DxLogDesktop.cpp
    ${DXLIB_PORTABLE_DIR}/Desktop/DxMemoryDesktop.cpp
    ${DXLIB_PORTABLE_DIR}/Desktop/DxThreadDesktop.cpp
    ${DXLIB_PORTABLE_DIR}/Desktop/DxFileDesktop.cpp
    ${DXLIB_PORTABLE_DIR}/Desktop/DxSystemDesktop.cpp
    # DxLib core (platform-independent)
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

# --- 共通: stage exe 設定ヘルパ ------------------------------------------
function(dxlib_stage_exe name src)
    add_executable(${name} ${src})
    dxlib_desktop_settings(${name})
    target_link_libraries(${name} PRIVATE dxlib_portable_stage3 ${GL_LIB})
    if(WIN32)
        # SDL2.dll を exe 横にコピー (WIN32 のみ)
        add_custom_command(TARGET ${name} POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E copy_if_different
                "${SDL2_LIB_DIR}/SDL2.dll"
                "$<TARGET_FILE_DIR:${name}>/SDL2.dll")
    endif()
endfunction()

dxlib_stage_exe(stage4_init_test          src/stage4_init_test.cpp)
dxlib_stage_exe(stage6_window_clear       src/stage6_window_clear.cpp)
dxlib_stage_exe(stage7_draw_primitives    src/stage7_draw_primitives.cpp)
dxlib_stage_exe(stage8_more_primitives    src/stage8_more_primitives.cpp)
dxlib_stage_exe(stage9_animated           src/stage9_animated.cpp)
dxlib_stage_exe(stage15_linux_visible     src/stage15_linux_visible.cpp)

# --- Stage 1 (pure SDL2, no DxLib) ---------------------------------------
if(WIN32)
    add_executable(stage1_empty_window WIN32 src/stage1_empty_window.cpp)
else()
    add_executable(stage1_empty_window src/stage1_empty_window.cpp)
endif()
target_link_libraries(stage1_empty_window PRIVATE
    SDL2::SDL2main SDL2::SDL2 ${GL_LIB})
if(WIN32)
    add_custom_command(TARGET stage1_empty_window POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
            "${SDL2_LIB_DIR}/SDL2.dll"
            "$<TARGET_FILE_DIR:stage1_empty_window>/SDL2.dll")
endif()
if(MSVC)
    target_compile_options(stage1_empty_window PRIVATE /utf-8 /W3)
    target_compile_definitions(stage1_empty_window PRIVATE
        _CRT_SECURE_NO_WARNINGS UNICODE _UNICODE)
endif()
