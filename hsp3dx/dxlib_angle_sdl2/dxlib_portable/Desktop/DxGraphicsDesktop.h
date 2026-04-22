// -------------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2/ANGLE) 用 グラフィックス ヘッダ
//
//      Stage 5 時点: iOS 版の struct レイアウトを踏襲する (GLuint = uint32 相当)。
//      GL ヘッダは .cpp 側だけで include し、本ヘッダでは uint32_t ベースで持つ。
//      Stage 5 では link が通ることだけが目的。中身の実装は後続 Stage で。
//
// -------------------------------------------------------------------------------

#ifndef DX_GRAPHICSDESKTOP_H
#define DX_GRAPHICSDESKTOP_H

#include "../DxCompileConfig.h"
#include <stdint.h>

#ifndef DX_NON_GRAPHICS

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

// GL ハンドル相当 (SDL2 環境でヘッダへ <GL/gl.h> を巻き込まないため独自 typedef)
typedef uint32_t DxGLuint ;
typedef int32_t  DxGLint ;

// Desktop 用 テクスチャ情報 (iOS GRAPHICS_IOS_TEXTURE と同構造)
struct GRAPHICS_DESKTOP_TEXTURE
{
    DxGLuint   TextureBuffer ;
    int        MipMapCount ;
    int        PixelFormat ;
    DxGLuint   Width ;
    DxGLuint   Height ;
    DxGLint    MagFilter ;
    DxGLint    MinFilter ;
    DxGLint    WrapS ;
    DxGLint    WrapT ;
    DxGLint    WrapR ;
} ;

// ハードウェアレンダリング用オリジナル画像テクスチャ情報
struct IMAGEDATA_ORIG_HARD_TEX_PF
{
    DxGLuint                   MSRenderTarget ;
    DxGLuint                   FrameBuffer ;
    GRAPHICS_DESKTOP_TEXTURE   Texture ;
    DxGLuint                   DepthBuffer ;
} ;

// シャドウマップ
struct SHADOWMAPDATA_PF
{
    DxGLuint                   FrameBuffer ;
    GRAPHICS_DESKTOP_TEXTURE   Texture ;
    DxGLuint                   DepthBuffer ;
} ;

// 頂点バッファハンドル
struct VERTEXBUFFERHANDLEDATA_PF
{
    DxGLuint VertexBuffer ;
} ;

// インデックスバッファハンドル
struct INDEXBUFFERHANDLEDATA_PF
{
    DxGLuint IndexBuffer ;
} ;

// シェーダーハンドル
struct SHADERHANDLEDATA_PF
{
    DxGLuint Shader ;
} ;

// シェーダー用定数バッファハンドル
struct SHADERCONSTANTBUFFERHANDLEDATA_PF
{
    int Dummy ;
} ;

#ifndef DX_NON_NAMESPACE
}
#endif

#endif // DX_NON_GRAPHICS

#endif // DX_GRAPHICSDESKTOP_H
