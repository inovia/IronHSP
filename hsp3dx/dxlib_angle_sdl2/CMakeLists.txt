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

# --- GLEW (GL extension loader, Live2D Rendering/OpenGL 用) ---------------
add_subdirectory(extlib/glew)

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

# opt-in: DxLib の DxUseCLibPhysics.cpp を Desktop/DxBulletCompat.h 経由で
# extlib/bullet3 と結線して MV1PhysicsCalculation 等を有効化。デフォルトは OFF
# (当面は Win 実機で検証、Mac/Linux は bundle 互換性確認後に ON 推奨)。
option(DX_DESKTOP_ENABLE_BULLET_PHYSICS
    "Enable MV1 Bullet Physics on Desktop SDL2 fork (via DxBulletCompat.h)" OFF)

# --- 共通: DxLib desktop 用コンパイル設定 ------------------------------
function(dxlib_desktop_settings target)
    target_include_directories(${target} PRIVATE ${DXLIB_PORTABLE_DIR})
    target_compile_definitions(${target} PRIVATE
        DX_PLATFORM_DESKTOP_SDL2=1
        DX_GCC_COMPILE=1
        DX_NON_INLINE_ASM=1
        # DX_NON_MOVIE=1 は lib (dxlib_portable_stage3) にのみ。user 側 exe では
        # 外して DxLib::OpenMovieToGraph 等の宣言を通す (Sound/Image と同じパターン)。
        # DX_NON_LIVE2D_CUBISM4 は外して Cubism SDK との統合を有効化する。
        # DxLive2DCubism4.cpp + DxUseCLibLive2DCubism4.cpp が lib に入り、
        # Live2DCubism4_*_PF は Desktop/DxLive2DCubism4Desktop.cpp の stub で満たす。
        # DX_NON_MODEL=1 を外した (Tier 4d v1 最小版: MV1 load は動くが描画は未実装)
        # DX_NON_BULLET_PHYSICS は opt-in (DX_DESKTOP_ENABLE_BULLET_PHYSICS=ON) で
        # 外せるように function 末尾の if で制御する。
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
        # DX_NON_INPUTSTRING は lib のみ PRIVATE 適用、user 側は宣言を通して
        # DxInputDesktop.cpp の独自 KeyInputString 実装を呼べるようにする
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
    # Bullet Physics: opt-in で無ければ NON 指定を立てる
    if(NOT DX_DESKTOP_ENABLE_BULLET_PHYSICS)
        target_compile_definitions(${target} PRIVATE DX_NON_BULLET_PHYSICS=1)
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
    # Tier 4e: GraphFilter (CPU 版 override + GPU GLSL 版)
    ${DXLIB_PORTABLE_DIR}/Desktop/DxGraphicsFilterDesktop.cpp
    ${DXLIB_PORTABLE_DIR}/Desktop/DxGraphicsFilterGPUDesktop.cpp
    # Tier 4f: Shader 基盤 (Desktop 固有 GLSL API、DxLib 本家 API は stub)
    ${DXLIB_PORTABLE_DIR}/Desktop/DxShaderDesktop.cpp
    # DXBC (.vso/.pso) → GLSL 翻訳 (最小実装)
    ${DXLIB_PORTABLE_DIR}/Desktop/DxDxbcTranslator.cpp
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
    # Live2D Cubism4 (DxLib 本家の integration + Desktop PF stub)
    ${DXLIB_PORTABLE_DIR}/DxLive2DCubism4.cpp
    ${DXLIB_PORTABLE_DIR}/DxUseCLibLive2DCubism4.cpp
    ${DXLIB_PORTABLE_DIR}/Desktop/DxLive2DCubism4Desktop.cpp
    ${DXLIB_PORTABLE_DIR}/Desktop/DxLive2DCubism4Shader_stub.cpp
)

# opt-in: MV1 Bullet Physics を Desktop で有効化する (DxBulletCompat.h 経由)
if(DX_DESKTOP_ENABLE_BULLET_PHYSICS)
    target_sources(dxlib_portable_stage3 PRIVATE
        ${DXLIB_PORTABLE_DIR}/DxUseCLibPhysics.cpp
    )
    target_include_directories(dxlib_portable_stage3 PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/extlib/bullet3/src
    )
    target_link_libraries(dxlib_portable_stage3 PUBLIC dx_bullet)
    # DxUseCLibPhysics.cpp だけ D_bt* → bt* 置換 shim を force-include
    if(MSVC)
        set_source_files_properties(
            ${DXLIB_PORTABLE_DIR}/DxUseCLibPhysics.cpp PROPERTIES
            COMPILE_FLAGS "/FI\"${DXLIB_PORTABLE_DIR}/Desktop/DxBulletCompat.h\" /UDX_NON_BULLET_PHYSICS"
        )
    else()
        set_source_files_properties(
            ${DXLIB_PORTABLE_DIR}/DxUseCLibPhysics.cpp PROPERTIES
            COMPILE_FLAGS "-include ${DXLIB_PORTABLE_DIR}/Desktop/DxBulletCompat.h -UDX_NON_BULLET_PHYSICS"
        )
    endif()
    message(STATUS "DX_DESKTOP_ENABLE_BULLET_PHYSICS=ON — MV1 Bullet physics enabled")
endif()
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
# Live2D Cubism SDK (L2 で bundle 済) と link
if(HAVE_LIVE2D_CUBISM4)
    target_link_libraries(dxlib_portable_stage3 PUBLIC dx_cubism_framework)
endif()
dxlib_desktop_settings(dxlib_portable_stage3)
# lib 側は DxGateway.cpp の sound / movie / libpng/jpeg 部分を殺して
# stub 未参照にする。user 側 exe はこれらを外して DxLib.h の宣言を通す。
target_compile_definitions(dxlib_portable_stage3 PRIVATE
    DX_NON_SOUND=1
    DX_NON_MOVIE=1
    DX_NON_FILTER=1
    DX_NON_JPEGREAD=1
    DX_NON_PNGREAD=1
    DX_NON_INPUTSTRING=1   # lib 側 (Gateway / DxInputString) は除外、Desktop layer に独自実装
)
# KeyInputString は SDL2 SDL_StartTextInput + SDL_TEXTINPUT で最小実装済
# (DxInputDesktop.cpp、IME 合成 popup は未対応で plain ASCII / UTF-8 のみ)。
# DX_NON_INPUTSTRING は lib 側 PRIVATE のみで DxInputString.cpp の compile を
# 抑止し、user 側は declarations が見えるよう PUBLIC からは外す。
target_compile_definitions(dxlib_portable_stage3 PUBLIC
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
dxlib_stage_exe(stage26_shader            src/stage26_shader.cpp)
dxlib_stage_exe(stage27_dxbc_test         src/stage27_dxbc_test.cpp)
dxlib_stage_exe(stage28_dxbc_shader       src/stage28_dxbc_shader.cpp)

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

# ==========================================================================
#  hsp3dx_desktop — HSP VM + DxLib Desktop fork を結合した .ax ランタイム
#  --------------------------------------------------------------------------
#  `./hsp3dx_desktop start.ax` のように起動。iOS の main_ios.mm と同構造。
#  Mac (SDL2+GL via brew)、Linux (SDL2+GL native)、Web (Emscripten) を想定。
# ==========================================================================
set(HSP3_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../hsp3)
set(HSP3NET_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../hsp3net)
set(HSP3DX_SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../src)

add_executable(hsp3dx_desktop
    # hsp3dx 共通
    ${HSP3DX_SRC_DIR}/main_desktop.cpp
    ${HSP3DX_SRC_DIR}/hgio_dx.cpp
    ${HSP3DX_SRC_DIR}/hsp3dxcl.cpp
    ${HSP3DX_SRC_DIR}/hsp3dx_extcmd.cpp
    ${HSP3DX_SRC_DIR}/hsp3dx_console.cpp
    ${HSP3DX_SRC_DIR}/hsp3dx_dxlib_auto.cpp
    ${HSP3DX_SRC_DIR}/hsp3dx_dxlib_auto_f.cpp
    ${HSP3DX_SRC_DIR}/hsp3dx_platform_common.cpp
    ${HSP3DX_SRC_DIR}/hsp3dx_platform_desktop.cpp
    ${HSP3DX_SRC_DIR}/hsp3dx_dxlib_desktop_stubs.cpp
    ${HSP3DX_SRC_DIR}/hsp3dx_events.cpp
    ${HSP3DX_SRC_DIR}/hsp3dx_json.cpp
    # HSP3 core
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
    # NSTRUCT
    ${HSP3NET_DIR}/hspvar_nstruct.cpp
)
# platform 別 supio (Mac/Linux は linux/, Web は emscripten/)
if(EMSCRIPTEN)
    target_sources(hsp3dx_desktop PRIVATE
        ${HSP3_DIR}/emscripten/supio_emscripten.cpp
        ${HSP3_DIR}/emscripten/hsp3ext_emscripten.cpp
    )
    target_compile_definitions(hsp3dx_desktop PRIVATE HSPEMSCRIPTEN=1)
elseif(APPLE)
    target_sources(hsp3dx_desktop PRIVATE
        ${HSP3_DIR}/linux/supio_linux.cpp
        ${HSP3_DIR}/linux/hsp3ext_linux.cpp
    )
    target_compile_definitions(hsp3dx_desktop PRIVATE HSPMAC=1)
else()
    target_sources(hsp3dx_desktop PRIVATE
        ${HSP3_DIR}/linux/supio_linux.cpp
        ${HSP3_DIR}/linux/hsp3ext_linux.cpp
    )
    target_compile_definitions(hsp3dx_desktop PRIVATE HSPLINUX=1)
endif()
dxlib_desktop_settings(hsp3dx_desktop)
target_include_directories(hsp3dx_desktop PRIVATE
    ${HSP3_DIR}
    ${HSP3DX_SRC_DIR}
)
target_compile_definitions(hsp3dx_desktop PRIVATE
    HSPDEBUG=1
    _HSP64=1
    HSP64=1
    HSPUTF8=1
)
if(NOT HAS_SDL2_MIXER)
    target_compile_definitions(hsp3dx_desktop PRIVATE HSP3DX_NO_SDL2_MIXER=1)
endif()
target_link_libraries(hsp3dx_desktop PRIVATE dxlib_portable_stage3 ${GL_LIB})
if(WIN32)
    add_custom_command(TARGET hsp3dx_desktop POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
            "${SDL2_LIB_DIR}/SDL2.dll"
            "$<TARGET_FILE_DIR:hsp3dx_desktop>/SDL2.dll")
endif()
if(EMSCRIPTEN)
    # Web 用 emcc link flags:
    # - WebGL1/2 + LEGACY_GL_EMULATION で DxLib の固定機能 GL を fall through
    # - ASYNCIFY で同期 HSP VM ループ (wait/await) を browser event loop にも yield
    # - ASYNCIFY_STACK_SIZE は Cubism/Bullet 深いコールスタックのため大きめ
    # - INITIAL_MEMORY 64MB + ALLOW_MEMORY_GROWTH (Cubism + DxLib 内部が結構使う)
    # - -O1 で wasm-opt を通しつつ速度を確保 (-O0 だと wasm が太り、ASYNCIFY も重い。
    #   -O2/-O3 は過去 wasm-opt が永遠終わらない事例あり、-O1 で balance)
    set_target_properties(hsp3dx_desktop PROPERTIES SUFFIX ".html")
    target_link_options(hsp3dx_desktop PRIVATE
        "SHELL:-s USE_SDL=2"
        "SHELL:-s ALLOW_MEMORY_GROWTH=1"
        "SHELL:-s INITIAL_MEMORY=64MB"
        "SHELL:-s MIN_WEBGL_VERSION=1"
        "SHELL:-s MAX_WEBGL_VERSION=2"
        "SHELL:-s LEGACY_GL_EMULATION=1"
        "SHELL:-s GL_UNSAFE_OPTS=0"
        # ASYNCIFY=2 (JSPI: JavaScript Promise Integration) を使う。ASYNCIFY=1 は
        # wasm-opt が大規模 wasm で 30+ 分掛かり実用にならないが、JSPI は wasm-opt
        # 不要で link 速度が桁違いに速い。Chrome 123+ / FF Nightly などで動く。
        # 6.5MB wasm + DxLib + Cubism + Bullet + HSP VM 全部入りでも build 数分。
        "SHELL:-s JSPI=1"
        # HSP/DxLib は C++ 例外を投げる (hsp3dxcl_msgfunc の throw HSPERR_NONE 等)。
        # emscripten デフォルトで例外 catch 無効になってるので明示的に enable。
        # 代替案として -fwasm-exceptions も検討余地あり (より高速、要 link/compile 両方指定)。
        "SHELL:-s DISABLE_EXCEPTION_CATCHING=0"
        "SHELL:-O0"
        # divide-by-zero の関数特定のため debug info + symbol map 残す。
        # -g4 + DWARF source map で browser DevTools が呼出スタックを source 行で
        # 表示できるようになる。wasm が大きくなるが diagnostic 用途では必須。
        "SHELL:-g"
        "SHELL:--emit-symbol-map"
        "SHELL:--preload-file ${CMAKE_CURRENT_BINARY_DIR}/start.ax@/start.ax"
        "SHELL:--shell-file ${CMAKE_CURRENT_SOURCE_DIR}/web/capture_shell.html"
    )
endif()
