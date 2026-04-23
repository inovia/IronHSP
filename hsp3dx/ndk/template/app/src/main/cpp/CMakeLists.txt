# CMakeLists.txt — hsp3dx Android ランタイム (libhsp3dx.so)
#
# DxLib Android の libDxLib.a などをリンクし、
# hsp3 コア + hsp3dx 拡張 + Android 専用エントリを 1 つの .so にまとめる。
#
# オプション:
#   DXLIB_FROM_SOURCE (default OFF)
#     ON にすると prebuilt libDxLib.a / libDxUseCLib.a / libpng.a / libjpeg.a / libzlib.a
#     を使わず、hsp3dx/dxlib_angle_sdl2/dxlib_portable + extlib/libpng + extlib/libjpeg +
#     extlib/zlib の source から build する。Movie MediaCodec 差替えや本家 DxLib バグ
#     修正を自前で入れたい場合に有効化。
#     tiff / ogg / vorbis / theora / opus / bullet / Live2DCubismCore は当面 prebuilt 継続。

cmake_minimum_required(VERSION 3.10.2)

project("hsp3dx")

# ---- パスの定義 ----
# template/app/src/main/cpp/ → リポジトリ root は 6 階層上
set(IRONHSP_ROOT   ${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../..)
set(HSP3_DIR       ${IRONHSP_ROOT}/hsp3)
set(HSP3NET_DIR    ${IRONHSP_ROOT}/hsp3net)
set(HSP3DX_DIR     ${IRONHSP_ROOT}/hsp3dx)
set(DXLIB_DIR      ${HSP3DX_DIR}/extlib/dxlib_android/DxLib_Android/Lib_AndroidStudio)
set(DXLIB_FORK_DIR ${HSP3DX_DIR}/dxlib_angle_sdl2)
set(DXLIB_SRC_DIR  ${DXLIB_FORK_DIR}/dxlib_portable)

option(DXLIB_FROM_SOURCE
    "Build DxLib / DxUseCLib / libpng / libjpeg / zlib from source instead of prebuilt .a"
    OFF)

include_directories(
    ${HSP3_DIR}
    ${HSP3DX_DIR}/src
    ${HSP3DX_DIR}/extlib/picojson
    ${DXLIB_DIR}/${ANDROID_ABI}
)
link_directories( ${DXLIB_DIR}/${ANDROID_ABI} )

add_compile_definitions(
    HSP3DX
    HSPNDK          # hsp3config.h でこれを見て HSPGCC + HSPUTF8 が有効化される
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
    # Android 専用 supio 実装 (mem_ini / mem_bye / htoi / strsp_ini 等)
    ${HSP3_DIR}/ndk/supio_ndk.cpp
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
    ${HSP3DX_DIR}/src/hsp3dx_platform_ndk.cpp
    ${HSP3DX_DIR}/src/hsp3dx_platform_common.cpp
    ${HSP3DX_DIR}/src/hsp3dx_events.cpp
    ${HSP3DX_DIR}/src/hsp3dx_http_ndk.cpp
    ${HSP3DX_DIR}/src/hsp3dx_ws_ndk.cpp
    ${HSP3DX_DIR}/src/main_ndk.cpp
)

add_library(hsp3dx SHARED ${HSP3_SRC} ${HSP3DX_SRC})

# =============================================================================
# DXLIB_FROM_SOURCE=ON: DxLib + DxUseCLib を source から build
# =============================================================================
if(DXLIB_FROM_SOURCE)
    message(STATUS "hsp3dx: building DxLib + DxUseCLib from source (dxlib_angle_sdl2/dxlib_portable)")

    # --- zlib (bundled 1.3.1) ---------------------------------------------
    set(ZLIB_DIR ${DXLIB_FORK_DIR}/extlib/zlib)
    add_library(dx_zlib STATIC
        ${ZLIB_DIR}/adler32.c ${ZLIB_DIR}/compress.c ${ZLIB_DIR}/crc32.c
        ${ZLIB_DIR}/deflate.c ${ZLIB_DIR}/infback.c ${ZLIB_DIR}/inffast.c
        ${ZLIB_DIR}/inflate.c ${ZLIB_DIR}/inftrees.c ${ZLIB_DIR}/trees.c
        ${ZLIB_DIR}/uncompr.c ${ZLIB_DIR}/zutil.c
    )
    target_include_directories(dx_zlib PUBLIC ${ZLIB_DIR})
    target_compile_options(dx_zlib PRIVATE
        -Wno-implicit-function-declaration -Wno-shift-negative-value)

    # --- libpng / libjpeg (2026-04-23 bundle) -----------------------------
    add_subdirectory(${DXLIB_FORK_DIR}/extlib/libpng ${CMAKE_CURRENT_BINARY_DIR}/dx_libpng)
    add_subdirectory(${DXLIB_FORK_DIR}/extlib/libjpeg ${CMAKE_CURRENT_BINARY_DIR}/dx_libjpeg)

    # --- Bullet Physics 3.25 (fork bundle) --------------------------------
    # DxUseCLibPhysics.cpp が D_bt* → bt* shim 経由で Bullet を使うため source build が必須
    # (prebuilt libbullet.a は DxLib 独自の D_bt* symbol で互換性無し)
    add_subdirectory(${DXLIB_FORK_DIR}/extlib/bullet3 ${CMAKE_CURRENT_BINARY_DIR}/dx_bullet)

    # --- DxLib / DxUseCLib 共通 source (pristine DxLib 3.24f) -------------
    set(DXLIB_COMMON_SRC
        ${DXLIB_SRC_DIR}/DxASyncLoad.cpp
        ${DXLIB_SRC_DIR}/DxArchive_.cpp
        ${DXLIB_SRC_DIR}/DxBaseFunc.cpp
        ${DXLIB_SRC_DIR}/DxBaseImage.cpp
        ${DXLIB_SRC_DIR}/DxChar.cpp
        ${DXLIB_SRC_DIR}/DxCharCodeTable.cpp
        ${DXLIB_SRC_DIR}/DxFile.cpp
        ${DXLIB_SRC_DIR}/DxFont.cpp
        ${DXLIB_SRC_DIR}/DxGateway.cpp
        ${DXLIB_SRC_DIR}/DxGraphics.cpp
        ${DXLIB_SRC_DIR}/DxGraphicsFilter.cpp
        ${DXLIB_SRC_DIR}/DxHandle.cpp
        ${DXLIB_SRC_DIR}/DxHeap.cpp
        ${DXLIB_SRC_DIR}/DxInput.cpp
        ${DXLIB_SRC_DIR}/DxInputString.cpp
        ${DXLIB_SRC_DIR}/DxLive2DCubism4.cpp
        ${DXLIB_SRC_DIR}/DxLog.cpp
        ${DXLIB_SRC_DIR}/DxMask.cpp
        ${DXLIB_SRC_DIR}/DxMath.cpp
        ${DXLIB_SRC_DIR}/DxMemImg.cpp
        ${DXLIB_SRC_DIR}/DxMemImgDrawFunction0.cpp
        ${DXLIB_SRC_DIR}/DxMemImgDrawFunction1.cpp
        ${DXLIB_SRC_DIR}/DxMemImgDrawFunction2.cpp
        ${DXLIB_SRC_DIR}/DxMemImgDrawFunction3.cpp
        ${DXLIB_SRC_DIR}/DxMemory.cpp
        ${DXLIB_SRC_DIR}/DxModel.cpp
        ${DXLIB_SRC_DIR}/DxModelLoader0.cpp
        ${DXLIB_SRC_DIR}/DxModelLoader1.cpp
        ${DXLIB_SRC_DIR}/DxModelLoader2.cpp
        ${DXLIB_SRC_DIR}/DxModelLoader3.cpp
        ${DXLIB_SRC_DIR}/DxModelLoader4.cpp
        ${DXLIB_SRC_DIR}/DxModelLoaderVMD.cpp
        ${DXLIB_SRC_DIR}/DxModelRead.cpp
        ${DXLIB_SRC_DIR}/DxMovie.cpp
        ${DXLIB_SRC_DIR}/DxNetwork.cpp
        ${DXLIB_SRC_DIR}/DxRingBuffer.cpp
        ${DXLIB_SRC_DIR}/DxSoftImage.cpp
        ${DXLIB_SRC_DIR}/DxSound.cpp
        ${DXLIB_SRC_DIR}/DxSoundConvert.cpp
        ${DXLIB_SRC_DIR}/DxSystem.cpp
        ${DXLIB_SRC_DIR}/DxThread.cpp
        ${DXLIB_SRC_DIR}/DxUseCLib.cpp
        ${DXLIB_SRC_DIR}/DxUseCLibLive2DCubism4.cpp
        ${DXLIB_SRC_DIR}/DxUseCLibOgg.cpp
        ${DXLIB_SRC_DIR}/DxUseCLibPhysics.cpp
    )

    # --- Android platform source (pristine DxLib 3.24f Android) -----------
    file(GLOB DXLIB_ANDROID_SRC
        ${DXLIB_SRC_DIR}/Android/*.cpp
    )

    # Movie: 本家 DxMovieAndroid.cpp は全 PF が return 0 / -1 の stub のため、
    # NDK AMediaExtractor + AMediaCodec を使う DxMovieAndroid_MediaCodec.cpp に
    # 差し替えて実機能化 (両者で同じ PF symbol を定義するので stub を除外)。
    list(REMOVE_ITEM DXLIB_ANDROID_SRC
        ${DXLIB_SRC_DIR}/Android/DxMovieAndroid.cpp)

    add_library(DxLibSource STATIC ${DXLIB_COMMON_SRC} ${DXLIB_ANDROID_SRC})

    target_include_directories(DxLibSource PUBLIC
        ${DXLIB_SRC_DIR}
        ${DXLIB_SRC_DIR}/Android
        # 既存 SDK 同梱の dep .a に合わせた header 群 (fork bundle 版)
        ${DXLIB_FORK_DIR}/extlib/libogg/include
        ${DXLIB_FORK_DIR}/extlib/libvorbis/include
        ${DXLIB_FORK_DIR}/extlib/libvorbis/lib       # internal: os.h 等
        ${DXLIB_FORK_DIR}/extlib/libtheora/include
        ${DXLIB_FORK_DIR}/extlib/libopus/include
        ${DXLIB_FORK_DIR}/extlib/opusfile/include
        ${DXLIB_FORK_DIR}/extlib/libtiff/libtiff
        # Live2D Cubism Core — DxLib 3.24f は Cubism 4 必須
        # (fork bundle extlib/cubism は Cubism 5 で csmGetDrawableRenderOrders が
        #  rename されているため使えない。hsp3dx/extlib/cubism_sdk_native/ の
        #  Cubism 4 SDK header を使う)
        ${HSP3DX_DIR}/extlib/cubism_sdk_native/Core/include
        # Bullet Physics (DxUseCLibPhysics / DxUseCLib の MV1 物理計算用)
        ${DXLIB_FORK_DIR}/extlib/bullet3/src
    )
    target_link_libraries(DxLibSource PUBLIC dx_png dx_jpeg dx_zlib dx_bullet)

    # SJIS コメント / #pragma warning 等を許容。
    # NDK clang は入力を UTF-8 固定で扱う (-finput-charset は非対応)。
    # DxLib 本家 source は SJIS だが、コメント内のみなので -Wno-invalid-source-encoding
    # で警告抑制すれば通る (コード部は ASCII 互換)。
    target_compile_options(DxLibSource PRIVATE
        -Wno-everything
        -Wno-invalid-source-encoding
    )

    # Bullet Physics: DxLib の D_btXxx → bt* マッピング shim (SDL2 fork 由来)
    # を DxUseCLib*.cpp に force-include、DX_NON_BULLET_PHYSICS を明示的に外す。
    set_source_files_properties(
        ${DXLIB_SRC_DIR}/DxUseCLibPhysics.cpp
        ${DXLIB_SRC_DIR}/DxUseCLib.cpp
        PROPERTIES
            COMPILE_FLAGS "-include ${DXLIB_SRC_DIR}/Desktop/DxBulletCompat.h -UDX_NON_BULLET_PHYSICS"
    )

    # Cubism 4 Framework header が Live2DCubism4 source から参照される。
    # prebuilt SDK 側には header が含まれない場合が多いので、user が Cubism SDK
    # を extlib/live2d_cubism/ に展開していれば追加 include する。
    if(EXISTS "${HSP3DX_DIR}/extlib/live2d_cubism/Framework/src/CubismFramework.hpp")
        target_include_directories(DxLibSource PUBLIC
            ${HSP3DX_DIR}/extlib/live2d_cubism/Framework/src
            ${HSP3DX_DIR}/extlib/live2d_cubism/Core/include
        )
    endif()

    target_link_libraries(hsp3dx
        android
        log
        GLESv1_CM
        EGL
        GLESv2
        OpenSLES
        m
        DxLibSource            # source build
        tiff
        theora_static
        vorbis_static
        vorbisfile_static
        ogg_static
        # bullet は dx_bullet (source) に置換えたので prebuilt は除外
        opus
        Live2DCubismCore
        # Movie MediaCodec 用 (AMediaExtractor / AMediaCodec / AMediaFormat)
        mediandk
        # Movie audio 用 (AAudio、API 26+)
        aaudio
    )
else()
    # =============================================================================
    # DXLIB_FROM_SOURCE=OFF (default): 従来通り prebuilt .a を link
    # =============================================================================
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
        Live2DCubismCore   # DxLibEnableLive2D_Android_3_24f + Cubism SDK 4-r.7
    )
endif()
