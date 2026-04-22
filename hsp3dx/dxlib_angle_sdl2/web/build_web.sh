#!/bin/bash
#
# emscripten で dxlib_portable と stage デモを Web ビルドするスクリプト
#
# 使い方:
#   cd web/build
#   bash ../build_web.sh [stage4|stage6|stage7|...]
#
set -e

EMCC=/c/Build/emsdk/upstream/emscripten/emcc.bat
STAGE="${1:-stage4}"
PORTABLE=../../dxlib_portable

# 共通フラグ
COMMON="-DDX_PLATFORM_DESKTOP_SDL2=1 \
-DDX_GCC_COMPILE=1 \
-DDX_NON_INLINE_ASM=1 \
-DDX_NON_MOVIE=1 \
-DDX_NON_LIVE2D_CUBISM4=1 \
-DDX_NON_MODEL=1 \
-DDX_NON_BULLET_PHYSICS=1 \
-DDX_NON_FILTER=1 \
-DDX_NON_MASK=1 \
-DDX_NON_SOUND=1 \
-DDX_NON_FONT=1 \
-DDX_NON_INPUT=1 \
-DDX_NON_TIFFREAD=1 \
-DDX_NON_JPEGREAD=1 \
-DDX_NON_PNGREAD=1 \
-DDX_NON_OGGVORBIS=1 \
-DDX_NON_OGGTHEORA=1 \
-DDX_NON_OPUS=1 \
-I${PORTABLE} \
-s USE_SDL=2 \
-std=c++17 \
-O0 -g \
-Wno-macro-redefined \
-Wno-invalid-source-encoding"

# Graphics 有効/無効 (stage4 stubのみは GRAPHICS disable、stage6+ は enable)
# stage6+ は fixed-function pipeline 使用のため LEGACY_GL_EMULATION が必要
if [ "$STAGE" == "stage4" ]; then
    GFX="-DDX_NON_GRAPHICS=1"
    GL_EMUL=""
else
    GFX=""
    # WebGL は fixed-function 無し。emscripten のエミュで対応試行
    GL_EMUL="-s LEGACY_GL_EMULATION=1 -s GL_UNSAFE_OPTS=0"
fi

# ソースリスト
CORE="${PORTABLE}/DxBaseFunc.cpp \
${PORTABLE}/DxChar.cpp \
${PORTABLE}/DxFile.cpp \
${PORTABLE}/DxLog.cpp \
${PORTABLE}/DxMemory.cpp \
${PORTABLE}/DxThread.cpp \
${PORTABLE}/DxHeap.cpp \
${PORTABLE}/DxSystem.cpp \
${PORTABLE}/DxArchive_.cpp \
${PORTABLE}/DxCharCodeTable.cpp \
${PORTABLE}/DxMath.cpp \
${PORTABLE}/DxUseCLib.cpp \
${PORTABLE}/DxHandle.cpp \
${PORTABLE}/DxASyncLoad.cpp \
${PORTABLE}/DxBaseImage.cpp \
${PORTABLE}/DxSoftImage.cpp \
${PORTABLE}/DxMemImg.cpp \
${PORTABLE}/DxMemImgDrawFunction0.cpp \
${PORTABLE}/DxMemImgDrawFunction1.cpp \
${PORTABLE}/DxMemImgDrawFunction2.cpp \
${PORTABLE}/DxMemImgDrawFunction3.cpp \
${PORTABLE}/DxGraphics.cpp \
${PORTABLE}/DxGateway.cpp"

DESKTOP="${PORTABLE}/Desktop/DxBaseFuncDesktop.cpp \
${PORTABLE}/Desktop/DxLogDesktop.cpp \
${PORTABLE}/Desktop/DxMemoryDesktop.cpp \
${PORTABLE}/Desktop/DxThreadDesktop.cpp \
${PORTABLE}/Desktop/DxFileDesktop.cpp \
${PORTABLE}/Desktop/DxSystemDesktop.cpp \
${PORTABLE}/Desktop/DxGraphicsDesktop.cpp \
${PORTABLE}/Desktop/DxGraphicsDesktop_stubs.cpp"

MAIN="../../src/${STAGE}_*.cpp"
# Web 専用ソースが存在すればそちらを優先 (emscripten_set_main_loop 版)
if [ -f "../${STAGE}_web.cpp" ]; then
    MAIN="../${STAGE}_web.cpp"
fi

echo "Building ${STAGE}_web.html..."
# --shell-file でカスタム shell を指定 (canvas/log 自動 POST 対応)
SHELL_FILE=../capture_shell.html

$EMCC $COMMON $GFX $CORE $DESKTOP $MAIN \
    -o ${STAGE}_web.html \
    --shell-file ${SHELL_FILE} \
    -s ALLOW_MEMORY_GROWTH=1 \
    -s INITIAL_MEMORY=64MB \
    -s MIN_WEBGL_VERSION=1 \
    -s MAX_WEBGL_VERSION=2 \
    $GL_EMUL
echo "Done: $(ls -la ${STAGE}_web.wasm)"
