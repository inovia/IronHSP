//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2/ANGLE) 用 グラフィックス (Stage 6: 最小実装)
//
//      Stage 5 でここは空、Stage 6 でウィンドウ作成 + 画面クリア + Flip を実装。
//      SDL2 で window を開き OpenGL ES 2 context を取る。ANGLE 差し替えは後日。
//
//-----------------------------------------------------------------------------

#define DX_MAKE

// Windows SDK ヘッダ (windows.h) を DxLib のタイプ定義より先に include する。
// SDL_opengl.h が windows.h を引き込むため、ここで typedef BYTE/WORD/DWORD を
// 確定させておかないと DxDataTypeDesktop.h の #define と衝突する。
#ifdef _WIN32
#include <windows.h>
#endif

#include "../DxCompileConfig.h"

#ifndef DX_NON_GRAPHICS

#include "DxGraphicsDesktop.h"
#include "../DxGraphics.h"
#include "../DxLib.h"

#include <SDL.h>
#include <SDL_video.h>
#include <SDL_opengl.h>

#include <cstdio>
#include <cmath>

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

// --- SDL2 window / GL context state --------------------------------------

static SDL_Window    *s_Window    = nullptr ;
static SDL_GLContext  s_GLContext = nullptr ;
static int            s_WinW      = 640 ;
static int            s_WinH      = 480 ;

#ifndef DX_NON_NAMESPACE
}  // close namespace DxLib — DxDesktop_* は global にする
#endif

extern "C" SDL_Window *DxDesktop_GetSDLWindow( void ) { return s_Window ; }

// 外部から呼べるよう公開する初期化/終了 (global scope, extern "C" 不要だが念のため)
extern "C" int DxDesktop_MakeWinAndGL( int w, int h, const char *title )
{
    if ( s_Window ) return 0 ; // 二重初期化防止

    if ( !SDL_WasInit( SDL_INIT_VIDEO ) )
    {
        if ( SDL_InitSubSystem( SDL_INIT_VIDEO ) != 0 )
        {
            std::fprintf( stderr, "[DxLib Desktop] SDL_InitSubSystem(VIDEO) failed: %s\n", SDL_GetError() ) ;
            return -1 ;
        }
    }

    // Stage 7 暫定: Windows では compat profile を指定して fixed-function も
    // 使えるようにする (glBegin/glEnd 可)。ES context は ANGLE 差し替え時に戻す。
    SDL_GL_SetAttribute( SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_COMPATIBILITY ) ;
    SDL_GL_SetAttribute( SDL_GL_CONTEXT_MAJOR_VERSION, 2 ) ;
    SDL_GL_SetAttribute( SDL_GL_CONTEXT_MINOR_VERSION, 1 ) ;
    SDL_GL_SetAttribute( SDL_GL_DOUBLEBUFFER, 1 ) ;
    SDL_GL_SetAttribute( SDL_GL_DEPTH_SIZE, 24 ) ;

    s_WinW = w ;
    s_WinH = h ;

    s_Window = SDL_CreateWindow(
        title ? title : "hsp3dx dxlib_angle_sdl2",
        SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
        w, h, SDL_WINDOW_OPENGL | SDL_WINDOW_SHOWN ) ;
    if ( s_Window == nullptr )
    {
        std::fprintf( stderr, "[DxLib Desktop] SDL_CreateWindow failed: %s\n", SDL_GetError() ) ;
        return -1 ;
    }

    s_GLContext = SDL_GL_CreateContext( s_Window ) ;
    if ( s_GLContext == nullptr )
    {
        // ES2 が取れない場合は compat にフォールバック
        SDL_GL_SetAttribute( SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_COMPATIBILITY ) ;
        SDL_GL_SetAttribute( SDL_GL_CONTEXT_MAJOR_VERSION, 2 ) ;
        SDL_GL_SetAttribute( SDL_GL_CONTEXT_MINOR_VERSION, 1 ) ;
        s_GLContext = SDL_GL_CreateContext( s_Window ) ;
    }
    if ( s_GLContext == nullptr )
    {
        std::fprintf( stderr, "[DxLib Desktop] SDL_GL_CreateContext failed: %s\n", SDL_GetError() ) ;
        SDL_DestroyWindow( s_Window ) ; s_Window = nullptr ;
        return -1 ;
    }

    SDL_GL_MakeCurrent( s_Window, s_GLContext ) ;
    SDL_GL_SetSwapInterval( 1 ) ;

    std::fprintf( stderr, "[DxLib Desktop] GL_VENDOR:   %s\n", ( const char * )glGetString( GL_VENDOR ) ) ;
    std::fprintf( stderr, "[DxLib Desktop] GL_VERSION:  %s\n", ( const char * )glGetString( GL_VERSION ) ) ;

    // DxLib の ValidHardware フラグを立てておく。これが FALSE だと
    // NS_ClearDrawScreen が software path に行ってしまう。
    GSYS.Setting.ValidHardware = TRUE ;

    return 0 ;
}

extern "C" int DxDesktop_KillWinAndGL( void )
{
    if ( s_GLContext ) { SDL_GL_DeleteContext( s_GLContext ) ; s_GLContext = nullptr ; }
    if ( s_Window )    { SDL_DestroyWindow( s_Window )       ; s_Window    = nullptr ; }
    return 0 ;
}

// ===== ここから namespace DxLib を再開 =====
#ifndef DX_NON_NAMESPACE
namespace DxLib {
#endif

// --- Graphics_Hardware_*_PF (Stage 6 最小実装) ---------------------------

extern int Graphics_Hardware_Initialize_PF( void )
{
    // NS_DxLib_Init ですでに window/context は作られている想定。
    // ここでは GL 側の追加セットアップを行うべきだが、Stage 6 では何もしない。
    std::fprintf( stderr, "[DxLib Desktop] Graphics_Hardware_Initialize_PF\n" ) ;
    return 0 ;
}

extern int Graphics_Hardware_ClearDrawScreen_PF( const RECT *ClearRect )
{
    (void)ClearRect;
    // BackgroundColor の設定を読んで clear 色に反映
    float r = GSYS.Screen.BackgroundRed   / 255.0f ;
    float g = GSYS.Screen.BackgroundGreen / 255.0f ;
    float b = GSYS.Screen.BackgroundBlue  / 255.0f ;
    float a = GSYS.Screen.BackgroundAlpha / 255.0f ;
    glClearColor( r, g, b, a ) ;
    glClear( GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT ) ;
    return 0 ;
}

extern int Graphics_ScreenFlipBase_PF( void )
{
    if ( s_Window ) SDL_GL_SwapWindow( s_Window ) ;
    return 0 ;
}

// --- 2D primitives: fixed-function pipeline で最低限の可視化 -----------
// GL compat profile 前提。glOrtho + glBegin/glEnd を使う。
// ANGLE (GL ES) 移行時は shader に書き直すが、Stage 7 は compat で可視化優先。

static void Desktop_SetOrtho2D( void )
{
    glViewport( 0, 0, s_WinW, s_WinH ) ;
    glMatrixMode( GL_PROJECTION ) ;
    glLoadIdentity() ;
    // DxLib は左上原点 (Y 下方向) なので glOrtho の top/bottom を反転
    glOrtho( 0.0, ( double )s_WinW, ( double )s_WinH, 0.0, -1.0, 1.0 ) ;
    glMatrixMode( GL_MODELVIEW ) ;
    glLoadIdentity() ;
    glDisable( GL_DEPTH_TEST ) ;
}

// DxLib の unsigned int Color (ARGB, GetColor で作られたやつ) を RGBA に
static inline void Desktop_SetGLColor( unsigned int Color )
{
    int R, G, B ;
    NS_GetColor2( Color, &R, &G, &B ) ;
    glColor4ub( ( GLubyte )R, ( GLubyte )G, ( GLubyte )B, 255 ) ;
}

extern int Graphics_Hardware_DrawFillBox_PF( int x1, int y1, int x2, int y2, unsigned int Color )
{
    Desktop_SetOrtho2D() ;
    Desktop_SetGLColor( Color ) ;

    glBegin( GL_TRIANGLE_STRIP ) ;
        glVertex2f( ( float )x1, ( float )y1 ) ;
        glVertex2f( ( float )x2, ( float )y1 ) ;
        glVertex2f( ( float )x1, ( float )y2 ) ;
        glVertex2f( ( float )x2, ( float )y2 ) ;
    glEnd() ;
    return 0 ;
}

extern int Graphics_Hardware_DrawLine_PF( int x1, int y1, int x2, int y2, unsigned int Color )
{
    Desktop_SetOrtho2D() ;
    Desktop_SetGLColor( Color ) ;

    glBegin( GL_LINES ) ;
        glVertex2f( ( float )x1 + 0.5f, ( float )y1 + 0.5f ) ;
        glVertex2f( ( float )x2 + 0.5f, ( float )y2 + 0.5f ) ;
    glEnd() ;
    return 0 ;
}

extern int Graphics_Hardware_DrawPixel_PF( int x, int y, unsigned int Color )
{
    Desktop_SetOrtho2D() ;
    Desktop_SetGLColor( Color ) ;
    glBegin( GL_POINTS ) ;
        glVertex2f( ( float )x + 0.5f, ( float )y + 0.5f ) ;
    glEnd() ;
    return 0 ;
}

// --- 追加の 2D primitive (Stage 8) ----------------------------------------

extern int Graphics_Hardware_DrawLineBox_PF( int x1, int y1, int x2, int y2, unsigned int Color, int Thickness )
{
    (void)Thickness;  // 太さは fixed-function では線幅を glLineWidth で設定すべきだが省略
    Desktop_SetOrtho2D() ;
    Desktop_SetGLColor( Color ) ;
    glBegin( GL_LINE_LOOP ) ;
        glVertex2f( ( float )x1 + 0.5f, ( float )y1 + 0.5f ) ;
        glVertex2f( ( float )x2 + 0.5f, ( float )y1 + 0.5f ) ;
        glVertex2f( ( float )x2 + 0.5f, ( float )y2 + 0.5f ) ;
        glVertex2f( ( float )x1 + 0.5f, ( float )y2 + 0.5f ) ;
    glEnd() ;
    return 0 ;
}

extern int Graphics_Hardware_DrawCircle_PF( int x, int y, int r, unsigned int Color, int FillFlag, int Rx_One_Minus, int Ry_One_Minus )
{
    (void)Rx_One_Minus; (void)Ry_One_Minus;
    Desktop_SetOrtho2D() ;
    Desktop_SetGLColor( Color ) ;

    const int N = 48 ;
    glBegin( FillFlag ? GL_TRIANGLE_FAN : GL_LINE_LOOP ) ;
    if ( FillFlag ) glVertex2f( ( float )x, ( float )y ) ;
    for ( int i = 0 ; i <= N ; ++i )
    {
        float a = ( float )i * 2.0f * 3.14159265358979f / ( float )N ;
        glVertex2f( x + std::cos( a ) * r, y + std::sin( a ) * r ) ;
    }
    glEnd() ;
    return 0 ;
}

extern int Graphics_Hardware_DrawOval_PF( int x, int y, int rx, int ry, unsigned int Color, int FillFlag, int Rx_One_Minus, int Ry_One_Minus )
{
    (void)Rx_One_Minus; (void)Ry_One_Minus;
    Desktop_SetOrtho2D() ;
    Desktop_SetGLColor( Color ) ;

    const int N = 48 ;
    glBegin( FillFlag ? GL_TRIANGLE_FAN : GL_LINE_LOOP ) ;
    if ( FillFlag ) glVertex2f( ( float )x, ( float )y ) ;
    for ( int i = 0 ; i <= N ; ++i )
    {
        float a = ( float )i * 2.0f * 3.14159265358979f / ( float )N ;
        glVertex2f( x + std::cos( a ) * rx, y + std::sin( a ) * ry ) ;
    }
    glEnd() ;
    return 0 ;
}

extern int Graphics_Hardware_DrawTriangle_PF( int x1, int y1, int x2, int y2, int x3, int y3, unsigned int Color, int FillFlag )
{
    Desktop_SetOrtho2D() ;
    Desktop_SetGLColor( Color ) ;
    glBegin( FillFlag ? GL_TRIANGLES : GL_LINE_LOOP ) ;
        glVertex2f( ( float )x1, ( float )y1 ) ;
        glVertex2f( ( float )x2, ( float )y2 ) ;
        glVertex2f( ( float )x3, ( float )y3 ) ;
    glEnd() ;
    return 0 ;
}

extern int Graphics_Hardware_DrawQuadrangle_PF( int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, unsigned int Color, int FillFlag )
{
    Desktop_SetOrtho2D() ;
    Desktop_SetGLColor( Color ) ;
    if ( FillFlag ) {
        glBegin( GL_TRIANGLE_FAN ) ;
            glVertex2f( ( float )x1, ( float )y1 ) ;
            glVertex2f( ( float )x2, ( float )y2 ) ;
            glVertex2f( ( float )x3, ( float )y3 ) ;
            glVertex2f( ( float )x4, ( float )y4 ) ;
        glEnd() ;
    } else {
        glBegin( GL_LINE_LOOP ) ;
            glVertex2f( ( float )x1, ( float )y1 ) ;
            glVertex2f( ( float )x2, ( float )y2 ) ;
            glVertex2f( ( float )x3, ( float )y3 ) ;
            glVertex2f( ( float )x4, ( float )y4 ) ;
        glEnd() ;
    }
    return 0 ;
}

// --- Stage 9: *_Set 系 (配列一括描画) ------------------------------------

extern int Graphics_Hardware_DrawBoxSet_PF( const RECTDATA *RectData, int Num )
{
    if ( !RectData || Num <= 0 ) return 0 ;
    Desktop_SetOrtho2D() ;
    // 1 件ずつ色が違うので毎回 color 設定する。TRIANGLES で済ませる
    glBegin( GL_TRIANGLES ) ;
    for ( int i = 0 ; i < Num ; ++i )
    {
        int R, G, B ;
        NS_GetColor2( RectData[i].color, &R, &G, &B ) ;
        glColor4ub( ( GLubyte )R, ( GLubyte )G, ( GLubyte )B, 255 ) ;
        float x1 = ( float )RectData[i].x1 ;
        float y1 = ( float )RectData[i].y1 ;
        float x2 = ( float )RectData[i].x2 ;
        float y2 = ( float )RectData[i].y2 ;
        glVertex2f( x1, y1 ) ; glVertex2f( x2, y1 ) ; glVertex2f( x1, y2 ) ;
        glVertex2f( x2, y1 ) ; glVertex2f( x2, y2 ) ; glVertex2f( x1, y2 ) ;
    }
    glEnd() ;
    return 0 ;
}

extern int Graphics_Hardware_DrawLineSet_PF( const LINEDATA *LineData, int Num )
{
    if ( !LineData || Num <= 0 ) return 0 ;
    Desktop_SetOrtho2D() ;
    glBegin( GL_LINES ) ;
    for ( int i = 0 ; i < Num ; ++i )
    {
        int R, G, B ;
        NS_GetColor2( LineData[i].color, &R, &G, &B ) ;
        glColor4ub( ( GLubyte )R, ( GLubyte )G, ( GLubyte )B, 255 ) ;
        glVertex2f( ( float )LineData[i].x1 + 0.5f, ( float )LineData[i].y1 + 0.5f ) ;
        glVertex2f( ( float )LineData[i].x2 + 0.5f, ( float )LineData[i].y2 + 0.5f ) ;
    }
    glEnd() ;
    return 0 ;
}

extern int Graphics_Hardware_DrawPixelSet_PF( const POINTDATA *PointData, int Num )
{
    if ( !PointData || Num <= 0 ) return 0 ;
    Desktop_SetOrtho2D() ;
    glBegin( GL_POINTS ) ;
    for ( int i = 0 ; i < Num ; ++i )
    {
        int R, G, B ;
        NS_GetColor2( PointData[i].color, &R, &G, &B ) ;
        glColor4ub( ( GLubyte )R, ( GLubyte )G, ( GLubyte )B, 255 ) ;
        glVertex2f( ( float )PointData[i].x + 0.5f, ( float )PointData[i].y + 0.5f ) ;
    }
    glEnd() ;
    return 0 ;
}

// --- Stage 9: *_Thickness 系 ---------------------------------------------

extern int Graphics_Hardware_DrawCircle_Thickness_PF( int x, int y, int r, unsigned int Color, int Thickness )
{
    Desktop_SetOrtho2D() ;
    Desktop_SetGLColor( Color ) ;
    glLineWidth( ( float )Thickness ) ;
    const int N = 48 ;
    glBegin( GL_LINE_LOOP ) ;
    for ( int i = 0 ; i < N ; ++i )
    {
        float a = ( float )i * 2.0f * 3.14159265358979f / ( float )N ;
        glVertex2f( x + std::cos( a ) * r, y + std::sin( a ) * r ) ;
    }
    glEnd() ;
    glLineWidth( 1.0f ) ;
    return 0 ;
}

extern int Graphics_Hardware_DrawOval_Thickness_PF( int x, int y, int rx, int ry, unsigned int Color, int Thickness )
{
    Desktop_SetOrtho2D() ;
    Desktop_SetGLColor( Color ) ;
    glLineWidth( ( float )Thickness ) ;
    const int N = 48 ;
    glBegin( GL_LINE_LOOP ) ;
    for ( int i = 0 ; i < N ; ++i )
    {
        float a = ( float )i * 2.0f * 3.14159265358979f / ( float )N ;
        glVertex2f( x + std::cos( a ) * rx, y + std::sin( a ) * ry ) ;
    }
    glEnd() ;
    glLineWidth( 1.0f ) ;
    return 0 ;
}

// --- その他 (Stage 5 から継続) -------------------------------------------

extern int Graphics_Hardware_RenderVertex( int Param ) { (void)Param; return 0 ; }

int ( *DefaultImageLoadFunc_PF[] )( STREAMDATA *, BASEIMAGE *, int ) = { nullptr } ;

#ifndef DX_NON_NAMESPACE
}
#endif

#endif // DX_NON_GRAPHICS
