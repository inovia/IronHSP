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
if [ "$STAGE" == "stage4" ]; then
    GFX="-DDX_NON_GRAPHICS=1"
else
    GFX=""
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

echo "Building ${STAGE}_web.html..."
$EMCC $COMMON $GFX $CORE $DESKTOP $MAIN \
    -o ${STAGE}_web.html \
    -s ALLOW_MEMORY_GROWTH=1 \
    -s INITIAL_MEMORY=64MB \
    -s FULL_ES2=1 \
    -s MIN_WEBGL_VERSION=2 \
    -s MAX_WEBGL_VERSION=2
echo "Done: $(ls -la ${STAGE}_web.wasm)"
