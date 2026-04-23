//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop 用 Live2D Cubism4 PF 関数実装
//
//      DxLive2DCubism4.cpp / DxUseCLibLive2DCubism4.cpp から呼ばれる
//      Live2DCubism4_*_PF 5 関数を提供する。shader は
//      DxLive2DCubism4Shader_stub.cpp (実実装、ファイル名は stub のまま)
//      側で GLSL compile 済みなので、ここでは SetupShader_PF で program 切替と
//      uniform bind を行う。
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#ifdef _WIN32
#include <windows.h>
#endif

// extern "C" 宣言はヘッダ include 前に global scope で済ませる
// (後段のヘッダで namespace が開く可能性があるため)
extern "C" {
    int  Desktop_CubismShader_GetHandle( int shaderName ) ;
    int  DesktopShader_Use( int handle ) ;
    int  DesktopShader_SetUniform1i( int h, const char *name, int v ) ;
    int  DesktopShader_SetUniform4f( int h, const char *name,
                                     float a, float b, float c, float d ) ;
    int  DesktopShader_SetUniformMatrix4f( int h, const char *name,
                                           const float *m16, int transpose ) ;
}

#include "../DxCompileConfig.h"

#ifndef DX_NON_LIVE2D_CUBISM4

#include "../DxLib.h"
#include "../DxUseCLibLive2DCubism4.h"
#include "../DxLive2DCubism4.h"

// DxLib の MATRIX (row-major 4x4 float) を GL の column-major 4x4 にそのまま
// 渡せるかは微妙。DxLib の MATRIX は以下のレイアウト (DxDataType.h):
//   m[4][4] で行優先。GL glUniformMatrix4fv は transpose=0 時に column-major
//   を期待。行優先で格納した値を column-major に解釈させるには transpose=1 が正解。
// DxShaderDesktop.cpp の SetUniformMatrix4f は transpose 引数をそのまま渡すので
// 1 指定で行列転置読みにする。

extern int Live2DCubism4_Initialize_PF      ( void ) { return 0 ; }
extern int Live2DCubism4_Terminate_PF       ( void ) { return 0 ; }

// GenerateShaders_PF は DxLib の D_CubismShader_DxLib::GenerateShaders() 末尾で
// 呼ばれる post-init hook。LoadShaderProgram 側で compile 完了済みなので no-op。
extern int Live2DCubism4_GenerateShaders_PF ( void ) { return 0 ; }

extern int Live2DCubism4_SetupShader_PF( int                                 /*ConstantBufferHandle*/,
                                         D_CubismConstantBufferDxLib        *ConstantBuffer,
                                         D_ShaderNames                       /*VertexShader*/,
                                         D_ShaderNames                       PixelShader )
{
    if ( ConstantBuffer == nullptr ) return -1 ;
    int h = Desktop_CubismShader_GetHandle( (int)PixelShader ) ;
    if ( h <= 0 ) return -1 ;

    DesktopShader_Use( h ) ;

    // sampler unit 固定 (DxLib 側で SetUseTextureToShader(0/1, ...) を呼ぶ際の
    // GL_TEXTURE0/1 バインドに対応)
    DesktopShader_SetUniform1i( h, "s_texture0", 0 ) ;
    DesktopShader_SetUniform1i( h, "s_texture1", 1 ) ;

    // 行列: DxLib MATRIX は row-major、GL は column-major を期待 → transpose=1
    DesktopShader_SetUniformMatrix4f( h, "u_matrix",
                                      (const float *)&ConstantBuffer->projectMatrix, 1 ) ;
    DesktopShader_SetUniformMatrix4f( h, "u_clipMatrix",
                                      (const float *)&ConstantBuffer->clipMatrix, 1 ) ;

    // 色 (COLOR_F は r,g,b,a float の struct)
    DesktopShader_SetUniform4f( h, "u_baseColor",
                                ConstantBuffer->baseColor.r,
                                ConstantBuffer->baseColor.g,
                                ConstantBuffer->baseColor.b,
                                ConstantBuffer->baseColor.a ) ;
    DesktopShader_SetUniform4f( h, "u_multiplyColor",
                                ConstantBuffer->multiplyColor.r,
                                ConstantBuffer->multiplyColor.g,
                                ConstantBuffer->multiplyColor.b,
                                ConstantBuffer->multiplyColor.a ) ;
    DesktopShader_SetUniform4f( h, "u_screenColor",
                                ConstantBuffer->screenColor.r,
                                ConstantBuffer->screenColor.g,
                                ConstantBuffer->screenColor.b,
                                ConstantBuffer->screenColor.a ) ;
    DesktopShader_SetUniform4f( h, "u_channelFlag",
                                ConstantBuffer->channelFlag.r,
                                ConstantBuffer->channelFlag.g,
                                ConstantBuffer->channelFlag.b,
                                ConstantBuffer->channelFlag.a ) ;
    return 0 ;
}

extern int Live2DCubism4_DrawAfter_PF( void )
{
    // glUseProgram(0) に戻して DxLib 本体の shader に支障が出ないようにする
    DesktopShader_Use( 0 ) ;
    return 0 ;
}

#endif // DX_NON_LIVE2D_CUBISM4
