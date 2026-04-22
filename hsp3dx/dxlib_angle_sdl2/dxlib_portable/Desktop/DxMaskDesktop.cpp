//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2+GL) 用 マスク 実装
//
//      OpenGL stencil buffer でマスクを実現する。
//       1. MaskManageData.MaskBuffer (CPU 側、8bit grayscale) を GPU に
//          GL_TEXTURE_2D (GL_LUMINANCE / GL_RED) でアップロード
//       2. Mask_DrawBeginFunction_PF: 画面全体にマスクテクスチャ付きの quad を
//          描画、alpha test で mask != 0 な pixel のみ stencil=1 を書く。
//          その後 glStencilTest を有効化して描画を stencil==1 の領域に限定。
//       3. Mask_DrawAfterFunction_PF: stencil test を無効化。
//
//      SDL_GL_SetAttribute( SDL_GL_STENCIL_SIZE, 8 ) で stencil 確保済み。
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#ifdef _WIN32
#include <windows.h>
#endif

#include "../DxCompileConfig.h"

#ifndef DX_NON_MASK

#include "DxMaskDesktop.h"
#include "../DxMask.h"

#include <SDL.h>
#include <SDL_opengl.h>

#include <cstdio>
#include <cstring>

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

// ---- desktop-local 状態 ---------------------------------------------------

static GLuint s_MaskTex    = 0 ;
static int    s_MaskTexW   = 0 ;
static int    s_MaskTexH   = 0 ;
static int    s_MaskCreated = 0 ;

static void desktop_mask_ensure_tex( int w, int h )
{
    if ( s_MaskTex == 0 ) {
        glGenTextures( 1, &s_MaskTex ) ;
    }
    if ( w == s_MaskTexW && h == s_MaskTexH ) return ;
    glBindTexture( GL_TEXTURE_2D, s_MaskTex ) ;
    glTexImage2D( GL_TEXTURE_2D, 0, GL_LUMINANCE, w, h, 0, GL_LUMINANCE, GL_UNSIGNED_BYTE, nullptr ) ;
    glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST ) ;
    glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST ) ;
    glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE ) ;
    glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE ) ;
    glBindTexture( GL_TEXTURE_2D, 0 ) ;
    s_MaskTexW = w ;
    s_MaskTexH = h ;
}

// ---- PF hooks -------------------------------------------------------------

extern int Mask_CreateScreenFunction_Timing0_PF( void ) { return 0 ; }

extern int Mask_CreateScreenFunction_Timing1_PF( int Width, int Height )
{
    desktop_mask_ensure_tex( Width, Height ) ;
    s_MaskCreated = 1 ;
    return 0 ;
}

extern int Mask_CreateScreenFunction_Timing2_PF( int /*OldW*/, int /*OldH*/ )
{
    return 0 ;
}

extern int Mask_ReleaseSurface_PF( void )
{
    if ( s_MaskTex ) { glDeleteTextures( 1, &s_MaskTex ) ; s_MaskTex = 0 ; }
    s_MaskTexW = s_MaskTexH = 0 ;
    s_MaskCreated = 0 ;
    return 0 ;
}

extern int Mask_SetUseMaskScreenFlag_PF( void ) { return 0 ; }

extern int Mask_UpdateMaskImageTexture_PF( RECT *Rect )
{
    if ( !MaskManageData.MaskBuffer ) return 0 ;
    int W = MaskManageData.MaskBufferSizeX ;
    int H = MaskManageData.MaskBufferSizeY ;
    desktop_mask_ensure_tex( W, H ) ;

    glBindTexture( GL_TEXTURE_2D, s_MaskTex ) ;
    glPixelStorei( GL_UNPACK_ALIGNMENT, 1 ) ;
    glPixelStorei( GL_UNPACK_ROW_LENGTH, MaskManageData.MaskBufferPitch ) ;
    if ( Rect && Rect->right > Rect->left && Rect->bottom > Rect->top )
    {
        int x = Rect->left ;
        int y = Rect->top ;
        int w = Rect->right  - Rect->left ;
        int h = Rect->bottom - Rect->top ;
        const BYTE *src = MaskManageData.MaskBuffer + y * MaskManageData.MaskBufferPitch + x ;
        glTexSubImage2D( GL_TEXTURE_2D, 0, x, y, w, h, GL_LUMINANCE, GL_UNSIGNED_BYTE, src ) ;
    }
    else
    {
        glTexSubImage2D( GL_TEXTURE_2D, 0, 0, 0, W, H,
                         GL_LUMINANCE, GL_UNSIGNED_BYTE, MaskManageData.MaskBuffer ) ;
    }
    glPixelStorei( GL_UNPACK_ROW_LENGTH, 0 ) ;
    glBindTexture( GL_TEXTURE_2D, 0 ) ;
    return 0 ;
}

// 画面全体に quad を描画して stencil buffer を mask 形状にセットアップする
static void desktop_mask_setup_stencil( void )
{
    if ( s_MaskTex == 0 ) return ;
    int vp[ 4 ] = { 0 } ;
    glGetIntegerv( GL_VIEWPORT, vp ) ;
    int w = vp[ 2 ] ;
    int h = vp[ 3 ] ;

    // 属性を保存
    GLboolean prev_color_mask[ 4 ] = { 0 } ;
    glGetBooleanv( GL_COLOR_WRITEMASK, prev_color_mask ) ;
    GLboolean prev_depth_mask = GL_TRUE ;
    glGetBooleanv( GL_DEPTH_WRITEMASK, &prev_depth_mask ) ;
    GLboolean prev_depth_test = glIsEnabled( GL_DEPTH_TEST ) ;
    GLboolean prev_blend      = glIsEnabled( GL_BLEND ) ;

    // stencil を 0 クリア
    glClearStencil( 0 ) ;
    glEnable( GL_STENCIL_TEST ) ;
    glStencilMask( 0xFF ) ;
    glClear( GL_STENCIL_BUFFER_BIT ) ;

    // 色/深度には書かず stencil のみに書き込み
    glColorMask( GL_FALSE, GL_FALSE, GL_FALSE, GL_FALSE ) ;
    glDepthMask( GL_FALSE ) ;
    glDisable( GL_DEPTH_TEST ) ;
    glDisable( GL_BLEND ) ;
    glStencilFunc ( GL_ALWAYS, 1, 0xFF ) ;
    glStencilOp   ( GL_KEEP, GL_KEEP, GL_REPLACE ) ;

    // alpha test で mask (luminance) が閾値以上のみ pass
    glEnable( GL_ALPHA_TEST ) ;
    glAlphaFunc( GL_GREATER, 0.1f ) ;

    // luminance tex を alpha として使う: GL_COMBINE_RGB=REPLACE, GL_COMBINE_ALPHA=REPLACE
    // デフォルトの GL_MODULATE は luminance→color に投影、glColor4f で alpha=luminance
    // 簡易に: glColor4f(1,1,1,1) にして tex alpha=luminance のままで比較
    glEnable( GL_TEXTURE_2D ) ;
    glBindTexture( GL_TEXTURE_2D, s_MaskTex ) ;
    glTexEnvi( GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE ) ;

    // 行列をプッシュして 2D 投影に切り替え
    glMatrixMode( GL_PROJECTION ) ;
    glPushMatrix() ;
    glLoadIdentity() ;
    glOrtho( 0, w, h, 0, -1, 1 ) ;
    glMatrixMode( GL_MODELVIEW ) ;
    glPushMatrix() ;
    glLoadIdentity() ;

    glColor4f( 1.0f, 1.0f, 1.0f, 1.0f ) ;
    glBegin( GL_QUADS ) ;
        glTexCoord2f( 0, 0 ) ; glVertex2f( 0, 0 ) ;
        glTexCoord2f( 1, 0 ) ; glVertex2f( ( float )w, 0 ) ;
        glTexCoord2f( 1, 1 ) ; glVertex2f( ( float )w, ( float )h ) ;
        glTexCoord2f( 0, 1 ) ; glVertex2f( 0, ( float )h ) ;
    glEnd() ;

    glBindTexture( GL_TEXTURE_2D, 0 ) ;
    glDisable( GL_TEXTURE_2D ) ;
    glDisable( GL_ALPHA_TEST ) ;

    glMatrixMode( GL_PROJECTION ) ; glPopMatrix() ;
    glMatrixMode( GL_MODELVIEW  ) ; glPopMatrix() ;

    // 書き込みフラグを復元
    glColorMask( prev_color_mask[ 0 ], prev_color_mask[ 1 ], prev_color_mask[ 2 ], prev_color_mask[ 3 ] ) ;
    glDepthMask( prev_depth_mask ) ;
    if ( prev_depth_test ) glEnable( GL_DEPTH_TEST ) ;
    if ( prev_blend      ) glEnable( GL_BLEND ) ;

    // stencil を読むモードに切替: MaskReverseEffectFlag が立っていれば
    // 「マスクがある箇所以外を通す」に、そうでなければ「マスクがある箇所のみ」
    if ( MaskManageData.MaskReverseEffectFlag ) {
        glStencilFunc( GL_NOTEQUAL, 1, 0xFF ) ;
    } else {
        glStencilFunc( GL_EQUAL,    1, 0xFF ) ;
    }
    glStencilOp   ( GL_KEEP, GL_KEEP, GL_KEEP ) ;
    glStencilMask ( 0x00 ) ;  // 描画中は stencil 変更禁止
}

extern int Mask_DrawBeginFunction_PF( RECT * /*Rect*/ )
{
    desktop_mask_setup_stencil() ;
    return 0 ;
}

extern int Mask_DrawAfterFunction_PF( RECT * /*Rect*/ )
{
    glDisable( GL_STENCIL_TEST ) ;
    glStencilMask( 0xFF ) ;
    return 0 ;
}

extern int Mask_FillMaskScreen_PF( int /*Flag*/ )
{
    // マスクバッファは DxMask.cpp 側で memset されているので、GPU 側は
    // 次の Update 呼び出しで同期される。ここでは特に何もしない。
    return 0 ;
}

#ifndef DX_NON_NAMESPACE
} // end namespace DxLib
#endif

#endif // DX_NON_MASK
