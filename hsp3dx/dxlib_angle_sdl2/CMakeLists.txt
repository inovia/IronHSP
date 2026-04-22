cmake_minimum_required(VERSION 3.16)
project(hsp3dx_angle_sdl2 LANGUAGES C CXX)

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
    # SDL2_ttf (オプショナル、あれば font 有効化)
    set(SDL2_TTF_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/extlib/SDL2_ttf")
    if(EXISTS "${SDL2_TTF_ROOT}/include/SDL_ttf.h")
        add_library(SDL2::ttf SHARED IMPORTED)
        set_target_properties(SDL2::ttf PROPERTIES
            IMPORTED_LOCATION             "${SDL2_TTF_ROOT}/lib/x64/SDL2_ttf.dll"
            IMPORTED_IMPLIB               "${SDL2_TTF_ROOT}/lib/x64/SDL2_ttf.lib"
            INTERFACE_INCLUDE_DIRECTORIES "${SDL2_TTF_ROOT}/include")
        set(HAS_SDL2_TTF 1)
    endif()
    # SDL2_mixer
    set(SDL2_MIXER_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/extlib/SDL2_mixer")
    if(EXISTS "${SDL2_MIXER_ROOT}/include/SDL_mixer.h")
        add_library(SDL2::mixer SHARED IMPORTED)
        set_target_properties(SDL2::mixer PROPERTIES
            IMPORTED_LOCATION             "${SDL2_MIXER_ROOT}/lib/x64/SDL2_mixer.dll"
            IMPORTED_IMPLIB               "${SDL2_MIXER_ROOT}/lib/x64/SDL2_mixer.lib"
            INTERFACE_INCLUDE_DIRECTORIES "${SDL2_MIXER_ROOT}/include")
        set(HAS_SDL2_MIXER 1)
    endif()
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
    # SDL2_ttf (optional)
    find_package(SDL2_ttf QUIET)
    if(SDL2_ttf_FOUND OR TARGET SDL2_ttf::SDL2_ttf)
        if(NOT TARGET SDL2::ttf)
            if(TARGET SDL2_ttf::SDL2_ttf)
                add_library(SDL2::ttf ALIAS SDL2_ttf::SDL2_ttf)
            else()
                add_library(SDL2::ttf INTERFACE IMPORTED)
                target_link_libraries(SDL2::ttf INTERFACE ${SDL2_TTF_LIBRARIES})
                target_include_directories(SDL2::ttf INTERFACE ${SDL2_TTF_INCLUDE_DIRS})
            endif()
        endif()
        set(HAS_SDL2_TTF 1)
    else()
        # pkg-config で探す fallback (brew 環境の Mac で有効)
        find_package(PkgConfig QUIET)
        if(PkgConfig_FOUND)
            pkg_check_modules(SDL2_TTF QUIET SDL2_ttf)
            if(SDL2_TTF_FOUND)
                add_library(SDL2::ttf INTERFACE IMPORTED)
                target_include_directories(SDL2::ttf INTERFACE ${SDL2_TTF_INCLUDE_DIRS})
                target_link_libraries(SDL2::ttf INTERFACE ${SDL2_TTF_LIBRARIES})
                target_link_directories(SDL2::ttf INTERFACE ${SDL2_TTF_LIBRARY_DIRS})
                set(HAS_SDL2_TTF 1)
            endif()
        endif()
    endif()
    # SDL2_mixer (optional)
    find_package(SDL2_mixer QUIET)
    if(TARGET SDL2_mixer::SDL2_mixer)
        add_library(SDL2::mixer ALIAS SDL2_mixer::SDL2_mixer)
        set(HAS_SDL2_MIXER 1)
    else()
        find_package(PkgConfig QUIET)
        if(PkgConfig_FOUND)
            pkg_check_modules(SDL2_MIXER QUIET SDL2_mixer)
            if(SDL2_MIXER_FOUND)
                add_library(SDL2::mixer INTERFACE IMPORTED)
                target_include_directories(SDL2::mixer INTERFACE ${SDL2_MIXER_INCLUDE_DIRS})
                target_link_libraries(SDL2::mixer INTERFACE ${SDL2_MIXER_LIBRARIES})
                target_link_directories(SDL2::mixer INTERFACE ${SDL2_MIXER_LIBRARY_DIRS})
                set(HAS_SDL2_MIXER 1)
            endif()
        endif()
    endif()
endif()

if(HAS_SDL2_TTF)
    message(STATUS "SDL2_ttf found — font support enabled")
else()
    message(STATUS "SDL2_ttf NOT found — font support disabled")
endif()
if(HAS_SDL2_MIXER)
    message(STATUS "SDL2_mixer found — sound support enabled")
else()
    message(STATUS "SDL2_mixer NOT found — sound support disabled")
endif()

# --- DxLib portable fork ------------------------------------------------
set(DXLIB_PORTABLE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/dxlib_portable")

# --- zlib バンドル (PMX など圧縮フォーマット decode 用) ---------------------
set(ZLIB_DIR "${CMAKE_CURRENT_SOURCE_DIR}/extlib/zlib")
add_library(dx_zlib STATIC
    ${ZLIB_DIR}/adler32.c
    ${ZLIB_DIR}/compress.c
    ${ZLIB_DIR}/crc32.c
    ${ZLIB_DIR}/deflate.c
    ${ZLIB_DIR}/infback.c
    ${ZLIB_DIR}/inffast.c
    ${ZLIB_DIR}/inflate.c
    ${ZLIB_DIR}/inftrees.c
    ${ZLIB_DIR}/trees.c
    ${ZLIB_DIR}/uncompr.c
    ${ZLIB_DIR}/zutil.c
)
target_include_directories(dx_zlib PUBLIC ${ZLIB_DIR})
if(MSVC)
    target_compile_options(dx_zlib PRIVATE /wd4996 /wd4244 /wd4267)
else()
    target_compile_options(dx_zlib PRIVATE -Wno-implicit-function-declaration -Wno-shift-negative-value)
endif()

# --- libogg バンドル (Vorbis/Opus/Theora の基盤) ---------------------------
# upstream 1.3.5 from https://github.com/xiph/ogg (BSD-3)
add_subdirectory(extlib/libogg)
if(MSVC)
    target_compile_options(dx_ogg PRIVATE /wd4244 /wd4267 /wd4018)
endif()

# --- libvorbis + libvorbisfile バンドル ---------------------------------
# upstream from https://github.com/xiph/vorbis (BSD-3)
add_subdirectory(extlib/libvorbis)

# --- libopus バンドル (float-only, no SIMD) -------------------------------
# upstream from https://github.com/xiph/opus (BSD-3)
add_subdirectory(extlib/libopus)
# --- opusfile バンドル (opus + ogg の高レベル wrapper、http は無効化) ----
# upstream from https://github.com/xiph/opusfile (BSD-2)
add_subdirectory(extlib/opusfile)

# --- libtheora (decoder-only, pure-C) バンドル --------------------------
# upstream from https://github.com/xiph/theora (BSD-3)
add_subdirectory(extlib/libtheora)

# --- libtiff (minimal: LZW/PackBits/Deflate/CCITT/Thunder/NeXT/LogLuv) ---
# upstream from https://gitlab.com/libtiff/libtiff (libtiff license)
add_subdirectory(extlib/libtiff)

# --- Live2D Cubism SDK (L2): Core (prebuilt) + Framework (source) ---------
# Live2D Proprietary + MIT (LICENSE_Core.md / LICENSE_Framework.md 参照)
# extlib/cubism/lib に prebuilt static lib があれば有効化、無ければ skip
if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/extlib/cubism/include/Live2DCubismCore.h")
    add_subdirectory(extlib/cubism)
    set(HAVE_LIVE2D_CUBISM4 TRUE)
    message(STATUS "Live2D Cubism SDK found — dx_cubism_framework enabled")
else()
    set(HAVE_LIVE2D_CUBISM4 FALSE)
endif()

# --- Bullet Physics 3.25 (L3) --------------------------------------------
# upstream from https://github.com/bulletphysics/bullet3 (zlib license)
# LinearMath / BulletCollision / BulletDynamics / BulletSoftBody /
# BulletInverseDynamics の 5 モジュール (Bullet3* experimental と OpenCL は除外)
add_subdirectory(extlib/bullet3)

# --- 共通: DxLib desktop 用コンパイル設定 ------------------------------
function(dxlib_desktop_settings target)
    target_include_directories(${target} PRIVATE ${DXLIB_PORTABLE_DIR})
    target_compile_definitions(${target} PRIVATE
        DX_PLATFORM_DESKTOP_SDL2=1
        DX_GCC_COMPILE=1
        DX_NON_INLINE_ASM=1
        # DX_NON_MOVIE=1 は lib (dxlib_portable_stage3) にのみ。user 側 exe では
        # 外して DxLib::OpenMovieToGraph 等の宣言を通す (Sound/Image と同じパターン)。
        DX_NON_LIVE2D_CUBISM4=1
        # DX_NON_MODEL=1 を外した (Tier 4d v1 最小版: MV1 load は動くが描画は未実装)
        DX_NON_BULLET_PHYSICS=1
        # DX_NON_FILTER=1 は lib 側のみ。user 側は宣言を通して
        # Desktop/DxGraphicsFilterDesktop.cpp の CPU 版で override する。
        # DX_NON_MASK=1 を外した (Tier 4c)。DxMask.cpp の CPU 側が動作、
        # Mask_*_PF は Desktop/DxMaskDesktop.cpp で no-op stub 実装。
        # DX_NON_SOUND=1 は dxlib_portable_stage3 (lib) にのみ付与する。
        # user 側 (stage exe) はこれを外しておかないと DxLib::LoadSoundMem 等の
        # 宣言が DxLib.h から見えなくなる (L4853 の #ifndef DX_NON_SOUND)。
        # DxGateway.cpp の sound wrapper は lib 側で NS_* を呼ぼうとするので
        # lib 側だけ DX_NON_SOUND=1 にして DxSoundDesktop.cpp の実体に寄せる。
        # DX_NON_FONT=1  ← Stage 19 で font 有効化
        # DX_NON_INPUT=1  ← Stage 16 で input 有効化
        DX_NON_KEYEX=1       # 高機能キー入力は未対応
        DX_NON_INPUTSTRING=1 # 文字列入力 API は未対応
        # DX_NON_TIFFREAD   : D5 で bundled libtiff により有効化
        # DX_NON_OGGVORBIS  : D2 で bundled libogg+libvorbis により有効化
        # DX_NON_OGGTHEORA  : D4 で bundled libtheora により有効化
        # DX_NON_OPUS       : D3 で bundled libopus+opusfile により有効化
        # DX_NON_JPEGREAD / DX_NON_PNGREAD は lib 側のみで付与 (stb_image 経路)
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
    # Stage 16: Input
    ${DXLIB_PORTABLE_DIR}/DxInput.cpp
    ${DXLIB_PORTABLE_DIR}/Desktop/DxInputDesktop.cpp
    # Stage 19: Font (DxFont.cpp は常にビルド、DxFontDesktop.cpp は HAS_SDL2_TTF 時のみ)
    ${DXLIB_PORTABLE_DIR}/DxFont.cpp
    # Stage 21: Image (stb_image: PNG/JPEG/BMP/GIF/TGA/PSD)
    ${DXLIB_PORTABLE_DIR}/Desktop/DxImageDesktop.cpp
    ${DXLIB_PORTABLE_DIR}/Desktop/DxImageDesktop_stb.cpp
    # Tier 4c: Mask (CPU 側 DxMask.cpp + 空の PF stub)
    ${DXLIB_PORTABLE_DIR}/DxMask.cpp
    ${DXLIB_PORTABLE_DIR}/Desktop/DxMaskDesktop.cpp
    # Tier 4b: Movie (Win=Media Foundation / Mac=AVFoundation / Linux/Web=pending stubs)
    ${DXLIB_PORTABLE_DIR}/Desktop/DxMovieDesktop.cpp
    # D4b: Theora 追加経路 (Ogg Theora .ogv / .ogg を bundled libtheoradec で decode)
    ${DXLIB_PORTABLE_DIR}/Desktop/DxMovieTheoraDesktop.cpp
    # Tier 4e: GraphFilter (CPU 版 override)
    ${DXLIB_PORTABLE_DIR}/Desktop/DxGraphicsFilterDesktop.cpp
    # Tier 4f: Shader 基盤 (Desktop 固有 GLSL API、DxLib 本家 API は stub)
    ${DXLIB_PORTABLE_DIR}/Desktop/DxShaderDesktop.cpp
    # Category C: 3D sound stubs (iOS 同様 return 0、呼べても 2D として鳴る)
    ${DXLIB_PORTABLE_DIR}/Desktop/DxSound3DStubsDesktop.cpp
    # Tier 4d: Model (zlib + DxModel CPU 側 + 全 loader + PF stub)
    ${DXLIB_PORTABLE_DIR}/DxModel.cpp
    ${DXLIB_PORTABLE_DIR}/DxModelRead.cpp
    ${DXLIB_PORTABLE_DIR}/DxModelLoader0.cpp
    ${DXLIB_PORTABLE_DIR}/DxModelLoader1.cpp
    ${DXLIB_PORTABLE_DIR}/DxModelLoader2.cpp
    ${DXLIB_PORTABLE_DIR}/DxModelLoader3.cpp
    ${DXLIB_PORTABLE_DIR}/DxModelLoader4.cpp
    ${DXLIB_PORTABLE_DIR}/DxModelLoaderVMD.cpp
    ${DXLIB_PORTABLE_DIR}/Desktop/DxModelDesktop.cpp
)
# HAS_SDL2_TTF の時だけ DxFontDesktop.cpp を追加
if(HAS_SDL2_TTF)
    target_sources(dxlib_portable_stage3 PRIVATE ${DXLIB_PORTABLE_DIR}/Desktop/DxFontDesktop.cpp)
endif()
# HAS_SDL2_MIXER の時だけ DxSoundDesktop.cpp を追加
if(HAS_SDL2_MIXER)
    target_sources(dxlib_portable_stage3 PRIVATE ${DXLIB_PORTABLE_DIR}/Desktop/DxSoundDesktop.cpp)
endif()
# zlib を model/PMX 関連ソースから使う
target_link_libraries(dxlib_portable_stage3 PUBLIC dx_zlib)
# libogg / libvorbis / libvorbisfile を DxSoundDesktop.cpp の OGG decode で使う
target_link_libraries(dxlib_portable_stage3 PUBLIC dx_vorbisfile)
# opusfile を DxSoundDesktop.cpp の Opus decode で使う
target_link_libraries(dxlib_portable_stage3 PUBLIC dx_opusfile)
# libtheoradec を DxMovieTheoraDesktop.cpp の Theora decode で使う
target_link_libraries(dxlib_portable_stage3 PUBLIC dx_theoradec)
# libtiff を DxBaseImage.cpp の LoadTiffImage で使う
target_link_libraries(dxlib_portable_stage3 PUBLIC dx_tiff)
dxlib_desktop_settings(dxlib_portable_stage3)
# lib 側は DxGateway.cpp の sound / movie / libpng/jpeg 部分を殺して
# stub 未参照にする。user 側 exe はこれらを外して DxLib.h の宣言を通す。
target_compile_definitions(dxlib_portable_stage3 PRIVATE
    DX_NON_SOUND=1
    DX_NON_MOVIE=1
    DX_NON_FILTER=1
    DX_NON_JPEGREAD=1
    DX_NON_PNGREAD=1
)
# KeyInputString / MakeKeyInput / DrawIMEInputString 系はユーザ側でも未提供にする
# (SDL2 ベースの IME 実装は将来タスク)。PUBLIC で user 側にも同じフラグを渡し、
# 宣言を消してコンパイル時に気付けるようにする。
target_compile_definitions(dxlib_portable_stage3 PUBLIC
    DX_NON_INPUTSTRING=1
    DX_NON_KEYEX=1
)
# Windows のみ Media Foundation ライブラリをリンク
if(WIN32)
    target_link_libraries(dxlib_portable_stage3 PUBLIC mfplat mfreadwrite mfuuid)
endif()
# Mac のみ AVFoundation (Obj-C++ .mm)
if(APPLE)
    target_sources(dxlib_portable_stage3 PRIVATE
        ${DXLIB_PORTABLE_DIR}/Desktop/DxMovieDesktopMac.mm)
    # ARC は使わない (retain/release 手動) ので -fno-objc-arc
    set_source_files_properties(
        ${DXLIB_PORTABLE_DIR}/Desktop/DxMovieDesktopMac.mm
        PROPERTIES COMPILE_FLAGS "-fno-objc-arc -x objective-c++")
    target_link_libraries(dxlib_portable_stage3 PUBLIC
        "-framework Foundation"
        "-framework AVFoundation"
        "-framework CoreMedia"
        "-framework CoreVideo"
        "-framework CoreFoundation")
endif()
# Linux (non-Apple) は GStreamer 1.0 (pkg-config 経由)
if(UNIX AND NOT APPLE AND NOT EMSCRIPTEN)
    find_package(PkgConfig QUIET)
    if(PkgConfig_FOUND)
        pkg_check_modules(GST QUIET gstreamer-1.0 gstreamer-app-1.0)
        if(GST_FOUND)
            message(STATUS "GStreamer found — Linux Movie support enabled")
            target_sources(dxlib_portable_stage3 PRIVATE
                ${DXLIB_PORTABLE_DIR}/Desktop/DxMovieDesktopLinux.cpp)
            target_include_directories(dxlib_portable_stage3 PRIVATE ${GST_INCLUDE_DIRS})
            target_link_libraries(dxlib_portable_stage3 PUBLIC ${GST_LIBRARIES})
        else()
            message(STATUS "GStreamer NOT found — Linux Movie disabled (stub)")
        endif()
    endif()
endif()
# Web (emscripten) は HTML5 <video> ブリッジ
if(EMSCRIPTEN)
    target_sources(dxlib_portable_stage3 PRIVATE
        ${DXLIB_PORTABLE_DIR}/Desktop/DxMovieDesktopWeb.cpp)
    # emscripten_sleep 使用のため ASYNCIFY 要 (user 側 link flag で指定)
endif()
target_link_libraries(dxlib_portable_stage3 PUBLIC SDL2::SDL2 SDL2::SDL2main)
if(HAS_SDL2_TTF)
    target_link_libraries(dxlib_portable_stage3 PUBLIC SDL2::ttf)
endif()
if(HAS_SDL2_MIXER)
    target_link_libraries(dxlib_portable_stage3 PUBLIC SDL2::mixer)
endif()

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
        if(HAS_SDL2_TTF)
            add_custom_command(TARGET ${name} POST_BUILD
                COMMAND ${CMAKE_COMMAND} -E copy_if_different
                    "${SDL2_TTF_ROOT}/lib/x64/SDL2_ttf.dll"
                    "$<TARGET_FILE_DIR:${name}>/SDL2_ttf.dll")
        endif()
        if(HAS_SDL2_MIXER)
            add_custom_command(TARGET ${name} POST_BUILD
                COMMAND ${CMAKE_COMMAND} -E copy_if_different
                    "${SDL2_MIXER_ROOT}/lib/x64/SDL2_mixer.dll"
                    "$<TARGET_FILE_DIR:${name}>/SDL2_mixer.dll")
        endif()
    endif()
endfunction()

dxlib_stage_exe(stage4_init_test          src/stage4_init_test.cpp)
dxlib_stage_exe(stage6_window_clear       src/stage6_window_clear.cpp)
dxlib_stage_exe(stage7_draw_primitives    src/stage7_draw_primitives.cpp)
dxlib_stage_exe(stage8_more_primitives    src/stage8_more_primitives.cpp)
dxlib_stage_exe(stage9_animated           src/stage9_animated.cpp)
dxlib_stage_exe(stage15_linux_visible     src/stage15_linux_visible.cpp)
dxlib_stage_exe(stage16_input             src/stage16_input.cpp)
dxlib_stage_exe(stage17_texture           src/stage17_texture.cpp)
dxlib_stage_exe(stage18_rotagraph         src/stage18_rotagraph.cpp)
dxlib_stage_exe(stage19_font              src/stage19_font.cpp)
dxlib_stage_exe(stage20_sound             src/stage20_sound.cpp)
dxlib_stage_exe(stage21_image             src/stage21_image.cpp)
dxlib_stage_exe(stage22_makescreen        src/stage22_makescreen.cpp)
dxlib_stage_exe(stage23_3d                src/stage23_3d.cpp)
dxlib_stage_exe(stage24_movie             src/stage24_movie.cpp)
dxlib_stage_exe(stage25_mv1               src/stage25_mv1.cpp)

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
