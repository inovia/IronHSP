//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop Live2D Cubism4 shader 実装 (stub)
//
//      DxUseCLibLive2DCubism4.cpp 内の D_CubismShader_DxLib::LoadShaderProgram()
//      は platform-specific で、本家 Windows/Android/iOS は各 Graphics*.cpp で
//      HLSL (.cso) / GLSL を compile する実装を持つ。
//      Desktop では GLSL 版 Cubism shader を用意するのが本道だが、
//      L4 Phase 4 以降の課題として保留し、ここでは stub で return true。
//      結果として GenerateShaders() は走るが、実際の描画は no-op。
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#ifdef _WIN32
#include <windows.h>
#endif

#include "../DxCompileConfig.h"

#ifndef DX_NON_LIVE2D_CUBISM4

#include "../DxLib.h"
#include "../DxUseCLibLive2DCubism4.h"

// D_CubismShader_DxLib は DxUseCLibLive2DCubism4.h 内で global scope (namespace なし)
// で定義されているため、stub 定義も global に置く。

bool D_CubismShader_DxLib::LoadShaderProgram( bool /*isPs*/, int /*assign*/, const char * /*entryPoint*/ )
{
    // Desktop は Cubism shader を現状実装しない。GL program は nullptr のまま、
    // Live2DCubism4_SetupShader_PF も no-op なので描画は白黒 or 省略される。
    // 将来: DxShaderDesktop.cpp の DesktopShader_CompileGLSL を呼び出し、
    //       CubismFramework の OpenGL shader テンプレートを使う。
    return true ;
}

#endif // DX_NON_LIVE2D_CUBISM4
