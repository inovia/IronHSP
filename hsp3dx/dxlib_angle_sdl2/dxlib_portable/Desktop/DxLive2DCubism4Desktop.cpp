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

#include <cstring>

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
#include "Live2DCubismCore.h"

// Cubism Core 5.x ヘッダから rename/削除された API を Web bridge 側で shim
// として持っている (DxLive2DCubism4WebBridge.cpp)。前方宣言だけ追加。
#ifdef __EMSCRIPTEN__
extern "C" const int *csmGetDrawableRenderOrders( const csmModel *model ) ;
#endif

// DxLib の MATRIX (row-major 4x4 float) を GL の column-major 4x4 にそのまま
// 渡せるかは微妙。DxLib の MATRIX は以下のレイアウト (DxDataType.h):
//   m[4][4] で行優先。GL glUniformMatrix4fv は transpose=0 時に column-major
//   を期待。行優先で格納した値を column-major に解釈させるには transpose=1 が正解。
// DxShaderDesktop.cpp の SetUniformMatrix4f は transpose 引数をそのまま渡すので
// 1 指定で行列転置読みにする。

// Cubism Core C API → DxLib LIVE2DDLL 関数ポインタ表に静的バインドする。
// Win/iOS/Android は同名 _DLL_Load 内で同じ事をしている (iOS は static 配置、
// Win は GetProcAddress、Android は dlsym)。Desktop SDL2 fork では Cubism Core
// は dx_cubism_framework lib (Mac/Linux) または DxLive2DCubism4WebBridge.cpp の
// EM_JS bridge (Web) 経由で symbol resolved 済み、ここで関数ポインタ
// 構造体に詰めるだけ。詰めないと CALL_csmXxx 経由で NULL deref して落ちる。
//
// 注: Mac/Linux native build は Cubism Core 5-r.5 を bundle 済 (extlib/cubism/lib/)
// で、5 では csmGetDrawableRenderOrders が削除/rename されている。Web bridge は
// shim を提供するので __EMSCRIPTEN__ ビルドでは安全に bind できる。Mac/Linux で
// Live2D を動かすには別途 5→4 互換 shim が必要 (現時点 Web 限定で動かす)。
static int Live2DCubism4_DLL_Load_Desktop( void )
{
#ifdef __EMSCRIPTEN__
    LIVE2DDLL.csmGetVersion                     = ( DWORD                       (*)( void ) )csmGetVersion ;
    LIVE2DDLL.csmGetLatestMocVersion            = ( DWORD                       (*)( void ) )csmGetLatestMocVersion ;
    LIVE2DDLL.csmGetMocVersion                  = ( DWORD                       (*)( const void* address, const DWORD size ) )csmGetMocVersion ;
    LIVE2DDLL.csmHasMocConsistency              = ( int                         (*)( void* address, const unsigned int size ) )csmHasMocConsistency ;
    LIVE2DDLL.csmGetLogFunction                 = ( csmLogFunctionP             (*)( void ) )csmGetLogFunction ;
    LIVE2DDLL.csmSetLogFunction                 = ( void                        (*)( csmLogFunctionP handler ) )csmSetLogFunction ;
    LIVE2DDLL.csmReviveMocInPlace               = ( void*                       (*)( void* address, const DWORD size ) )csmReviveMocInPlace ;
    LIVE2DDLL.csmGetSizeofModel                 = ( DWORD                       (*)( const void* moc ) )csmGetSizeofModel ;
    LIVE2DDLL.csmInitializeModelInPlace         = ( void*                       (*)( const void* moc, void* address, const DWORD size ) )csmInitializeModelInPlace ;
    LIVE2DDLL.csmUpdateModel                    = ( void                        (*)( void* model ) )csmUpdateModel ;
    LIVE2DDLL.csmReadCanvasInfo                 = ( void                        (*)( const void* model, D_CubismVector2* outSizeInPixels, D_CubismVector2* outOriginInPixels, float* outPixelsPerUnit ) )csmReadCanvasInfo ;
    LIVE2DDLL.csmGetParameterCount              = ( int                         (*)( const void* model ) )csmGetParameterCount ;
    LIVE2DDLL.csmGetParameterIds                = ( const char**                (*)( const void* model ) )csmGetParameterIds ;
    LIVE2DDLL.csmGetParameterTypes              = ( const D_csmParameterType*   (*)( const void* model ) )csmGetParameterTypes ;
    LIVE2DDLL.csmGetParameterMinimumValues      = ( const float*                (*)( const void* model ) )csmGetParameterMinimumValues ;
    LIVE2DDLL.csmGetParameterMaximumValues      = ( const float*                (*)( const void* model ) )csmGetParameterMaximumValues ;
    LIVE2DDLL.csmGetParameterDefaultValues      = ( const float*                (*)( const void* model ) )csmGetParameterDefaultValues ;
    LIVE2DDLL.csmGetParameterValues             = ( float*                      (*)( void* model ) )csmGetParameterValues ;
    LIVE2DDLL.csmGetParameterKeyCounts          = ( const int*                  (*)( const void* model ) )csmGetParameterKeyCounts ;
    LIVE2DDLL.csmGetParameterKeyValues          = ( const float**               (*)( const void* model ) )csmGetParameterKeyValues ;
    LIVE2DDLL.csmGetPartCount                   = ( int                         (*)( const void* model ) )csmGetPartCount ;
    LIVE2DDLL.csmGetPartIds                     = ( const char**                (*)( const void* model ) )csmGetPartIds ;
    LIVE2DDLL.csmGetPartOpacities               = ( float*                      (*)( void* model ) )csmGetPartOpacities ;
    LIVE2DDLL.csmGetPartParentPartIndices       = ( const int*                  (*)( const void* model ) )csmGetPartParentPartIndices ;
    LIVE2DDLL.csmGetDrawableCount               = ( int                         (*)( const void* model ) )csmGetDrawableCount ;
    LIVE2DDLL.csmGetDrawableIds                 = ( const char**                (*)( const void* model ) )csmGetDrawableIds ;
    LIVE2DDLL.csmGetDrawableConstantFlags       = ( const BYTE*                 (*)( const void* model ) )csmGetDrawableConstantFlags ;
    LIVE2DDLL.csmGetDrawableDynamicFlags        = ( const BYTE*                 (*)( const void* model ) )csmGetDrawableDynamicFlags ;
    LIVE2DDLL.csmGetDrawableTextureIndices      = ( const int*                  (*)( const void* model ) )csmGetDrawableTextureIndices ;
    LIVE2DDLL.csmGetDrawableDrawOrders          = ( const int*                  (*)( const void* model ) )csmGetDrawableDrawOrders ;
    LIVE2DDLL.csmGetDrawableRenderOrders        = ( const int*                  (*)( const void* model ) )csmGetDrawableRenderOrders ;
    LIVE2DDLL.csmGetDrawableOpacities           = ( const float*                (*)( const void* model ) )csmGetDrawableOpacities ;
    LIVE2DDLL.csmGetDrawableMaskCounts          = ( const int*                  (*)( const void* model ) )csmGetDrawableMaskCounts ;
    LIVE2DDLL.csmGetDrawableMasks               = ( const int**                 (*)( const void* model ) )csmGetDrawableMasks ;
    LIVE2DDLL.csmGetDrawableVertexCounts        = ( const int*                  (*)( const void* model ) )csmGetDrawableVertexCounts ;
    LIVE2DDLL.csmGetDrawableVertexPositions     = ( const D_CubismVector2**     (*)( const void* model ) )csmGetDrawableVertexPositions ;
    LIVE2DDLL.csmGetDrawableVertexUvs           = ( const D_CubismVector2**     (*)( const void* model ) )csmGetDrawableVertexUvs ;
    LIVE2DDLL.csmGetDrawableIndexCounts         = ( const int*                  (*)( const void* model ) )csmGetDrawableIndexCounts ;
    LIVE2DDLL.csmGetDrawableIndices             = ( const unsigned short**      (*)( const void* model ) )csmGetDrawableIndices ;
    LIVE2DDLL.csmGetDrawableMultiplyColors      = ( const D_CubismVector4*      (*)( const void* model ) )csmGetDrawableMultiplyColors ;
    LIVE2DDLL.csmGetDrawableScreenColors        = ( const D_CubismVector4*      (*)( const void* model ) )csmGetDrawableScreenColors ;
    LIVE2DDLL.csmGetDrawableParentPartIndices   = ( const int*                  (*)( const void* model ) )csmGetDrawableParentPartIndices ;
    LIVE2DDLL.csmResetDrawableDynamicFlags      = ( void                        (*)( void* model ) )csmResetDrawableDynamicFlags ;
#endif // __EMSCRIPTEN__
    return 0 ;
}

static int Live2DCubism4_DLL_Unload_Desktop( void )
{
    memset( &LIVE2DDLL, 0, sizeof( LIVE2DDLL ) ) ;
    return 0 ;
}

extern int Live2DCubism4_Initialize_PF      ( void )
{
    if ( Live2DCubism4_DLL_Load_Desktop() < 0 ) return -1 ;
    LIVE2DSYS.EnableConstantBuffer = FALSE ;
    return 0 ;
}
extern int Live2DCubism4_Terminate_PF       ( void )
{
    Live2DCubism4_DLL_Unload_Desktop() ;
    return 0 ;
}

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
