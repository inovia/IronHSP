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
#include <cstring>
#include <cmath>
#include <vector>

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

// --- SDL2 window / GL context state --------------------------------------

static SDL_Window    *s_Window    = nullptr ;
static SDL_GLContext  s_GLContext = nullptr ;
static int            s_WinW      = 640 ;
static int            s_WinH      = 480 ;

// 描画ターゲット (FBO / viewport / scissor) — namespace DxLib 外から assign 可
// するため global scope 側で宣言
static unsigned int   s_CurrentFBO    = 0 ;
static int            s_DrawTargetW   = 640 ;
static int            s_DrawTargetH   = 480 ;
static int            s_DrawArea_L    = 0 ;
static int            s_DrawArea_T    = 0 ;
static int            s_DrawArea_R    = 640 ;
static int            s_DrawArea_B    = 480 ;
static int            s_DrawAreaValid = 0 ;

// --- GL FBO 関数ポインタ ---------------------------------------------------
// Windows の opengl32.dll は GL 1.1 しか export していないため、
// glGenFramebuffers 等は SDL_GL_GetProcAddress で動的ロードする。
// Web (emscripten) は LEGACY_GL_EMULATION モードでもこれらは直接使える。
#ifndef GL_FRAMEBUFFER
#define GL_FRAMEBUFFER            0x8D40
#define GL_COLOR_ATTACHMENT0      0x8CE0
#define GL_DEPTH_ATTACHMENT       0x8D00
#define GL_RENDERBUFFER           0x8D41
#define GL_DEPTH_COMPONENT24      0x81A6
#define GL_FRAMEBUFFER_COMPLETE   0x8CD5
#define GL_FRAMEBUFFER_BINDING    0x8CA6
#endif

typedef void   (APIENTRYP PFN_glGenFramebuffers)       ( GLsizei n, GLuint *framebuffers ) ;
typedef void   (APIENTRYP PFN_glDeleteFramebuffers)    ( GLsizei n, const GLuint *framebuffers ) ;
typedef void   (APIENTRYP PFN_glBindFramebuffer)       ( GLenum target, GLuint framebuffer ) ;
typedef void   (APIENTRYP PFN_glFramebufferTexture2D)  ( GLenum target, GLenum attachment, GLenum textarget, GLuint tex, GLint lv ) ;
typedef void   (APIENTRYP PFN_glGenRenderbuffers)      ( GLsizei n, GLuint *rbs ) ;
typedef void   (APIENTRYP PFN_glDeleteRenderbuffers)   ( GLsizei n, const GLuint *rbs ) ;
typedef void   (APIENTRYP PFN_glBindRenderbuffer)      ( GLenum target, GLuint rb ) ;
typedef void   (APIENTRYP PFN_glRenderbufferStorage)   ( GLenum target, GLenum fmt, GLsizei w, GLsizei h ) ;
typedef void   (APIENTRYP PFN_glFramebufferRenderbuffer)( GLenum target, GLenum attach, GLenum rbtarget, GLuint rb ) ;
typedef GLenum (APIENTRYP PFN_glCheckFramebufferStatus)( GLenum target ) ;

static PFN_glGenFramebuffers        p_glGenFramebuffers        = nullptr ;
static PFN_glDeleteFramebuffers     p_glDeleteFramebuffers     = nullptr ;
static PFN_glBindFramebuffer        p_glBindFramebuffer        = nullptr ;
static PFN_glFramebufferTexture2D   p_glFramebufferTexture2D   = nullptr ;
static PFN_glGenRenderbuffers       p_glGenRenderbuffers       = nullptr ;
static PFN_glDeleteRenderbuffers    p_glDeleteRenderbuffers    = nullptr ;
static PFN_glBindRenderbuffer       p_glBindRenderbuffer       = nullptr ;
static PFN_glRenderbufferStorage    p_glRenderbufferStorage    = nullptr ;
static PFN_glFramebufferRenderbuffer p_glFramebufferRenderbuffer = nullptr ;
static PFN_glCheckFramebufferStatus p_glCheckFramebufferStatus = nullptr ;

static void desktop_load_fbo_funcs( void )
{
    if ( p_glGenFramebuffers ) return ;
    p_glGenFramebuffers        = ( PFN_glGenFramebuffers )       SDL_GL_GetProcAddress( "glGenFramebuffers" ) ;
    p_glDeleteFramebuffers     = ( PFN_glDeleteFramebuffers )    SDL_GL_GetProcAddress( "glDeleteFramebuffers" ) ;
    p_glBindFramebuffer        = ( PFN_glBindFramebuffer )       SDL_GL_GetProcAddress( "glBindFramebuffer" ) ;
    p_glFramebufferTexture2D   = ( PFN_glFramebufferTexture2D )  SDL_GL_GetProcAddress( "glFramebufferTexture2D" ) ;
    p_glGenRenderbuffers       = ( PFN_glGenRenderbuffers )      SDL_GL_GetProcAddress( "glGenRenderbuffers" ) ;
    p_glDeleteRenderbuffers    = ( PFN_glDeleteRenderbuffers )   SDL_GL_GetProcAddress( "glDeleteRenderbuffers" ) ;
    p_glBindRenderbuffer       = ( PFN_glBindRenderbuffer )      SDL_GL_GetProcAddress( "glBindRenderbuffer" ) ;
    p_glRenderbufferStorage    = ( PFN_glRenderbufferStorage )   SDL_GL_GetProcAddress( "glRenderbufferStorage" ) ;
    p_glFramebufferRenderbuffer = ( PFN_glFramebufferRenderbuffer )SDL_GL_GetProcAddress( "glFramebufferRenderbuffer" ) ;
    p_glCheckFramebufferStatus = ( PFN_glCheckFramebufferStatus )SDL_GL_GetProcAddress( "glCheckFramebufferStatus" ) ;
    if ( !p_glGenFramebuffers ) {
        std::fprintf( stderr, "[DxGfxDesk] FBO extension not available\n" ) ;
    }
}

#define glGenFramebuffers        p_glGenFramebuffers
#define glDeleteFramebuffers     p_glDeleteFramebuffers
#define glBindFramebuffer        p_glBindFramebuffer
#define glFramebufferTexture2D   p_glFramebufferTexture2D
#define glGenRenderbuffers       p_glGenRenderbuffers
#define glDeleteRenderbuffers    p_glDeleteRenderbuffers
#define glBindRenderbuffer       p_glBindRenderbuffer
#define glRenderbufferStorage    p_glRenderbufferStorage
#define glFramebufferRenderbuffer p_glFramebufferRenderbuffer
#define glCheckFramebufferStatus p_glCheckFramebufferStatus

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

#ifdef __EMSCRIPTEN__
    // emscripten では profile/version を指定しない (LEGACY_GL_EMULATION が自動)
    SDL_GL_SetAttribute( SDL_GL_DOUBLEBUFFER, 1 ) ;
    SDL_GL_SetAttribute( SDL_GL_DEPTH_SIZE, 16 ) ;
    SDL_GL_SetAttribute( SDL_GL_STENCIL_SIZE, 8 ) ;    // Mask 用 8-bit stencil
#else
    // Stage 7 暫定: Windows では compat profile を指定して fixed-function も
    // 使えるようにする (glBegin/glEnd 可)。ES context は ANGLE 差し替え時に戻す。
    SDL_GL_SetAttribute( SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_COMPATIBILITY ) ;
    SDL_GL_SetAttribute( SDL_GL_CONTEXT_MAJOR_VERSION, 2 ) ;
    SDL_GL_SetAttribute( SDL_GL_CONTEXT_MINOR_VERSION, 1 ) ;
    SDL_GL_SetAttribute( SDL_GL_DOUBLEBUFFER, 1 ) ;
    SDL_GL_SetAttribute( SDL_GL_DEPTH_SIZE, 24 ) ;
    SDL_GL_SetAttribute( SDL_GL_STENCIL_SIZE, 8 ) ;    // Mask 用 8-bit stencil
#endif

    s_WinW = w ;
    s_WinH = h ;
    s_DrawTargetW = w ;
    s_DrawTargetH = h ;
    s_DrawArea_R  = w ;
    s_DrawArea_B  = h ;

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

    desktop_load_fbo_funcs() ;

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

    // L1: DxLib Shader API compat。Graphics_Shader_CreateHandle() が
    // UseShader FALSE で失敗するのを避けるため TRUE にする。
    // ただし Graphics_Hardware_Shader_Create_PF と Draw*PrimitiveToShader_PF は
    // 全て no-op stub のままなので、shader を使った描画は無効化される
    // (LoadVertexShader は成功するが SetUseVertexShader 後の描画は fixed-function)。
    GSYS.HardInfo.UseShader   = TRUE ;
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

// 描画ターゲット / scissor は global scope 側で定義済み (s_CurrentFBO 等)

static void Desktop_ApplyScissor( void )
{
    if ( !s_DrawAreaValid ) { glDisable( GL_SCISSOR_TEST ) ; return ; }
    // DxLib の (L,T,R,B) 座標 → GL scissor (x, y, w, h)。
    // FBO 時はそのまま、画面時は GL が左下原点なので Y 反転が必要。
    int x = s_DrawArea_L ;
    int w = s_DrawArea_R - s_DrawArea_L ;
    int h = s_DrawArea_B - s_DrawArea_T ;
    int y ;
    if ( s_CurrentFBO != 0 ) {
        y = s_DrawArea_T ;
    } else {
        y = s_DrawTargetH - s_DrawArea_B ;
    }
    if ( w < 0 ) w = 0 ;
    if ( h < 0 ) h = 0 ;
    glEnable( GL_SCISSOR_TEST ) ;
    glScissor( x, y, w, h ) ;
}

static void Desktop_SetOrtho2D( void )
{
    glViewport( 0, 0, s_DrawTargetW, s_DrawTargetH ) ;
    glMatrixMode( GL_PROJECTION ) ;
    glLoadIdentity() ;
    // DxLib は左上原点 (Y 下方向)。画面 (デフォルト FBO) と FBO では GL のメモリ向きが
    // 異なるので、後段 DrawGraph で反転なしでサンプルできるように ortho を切り替える。
    //   画面:  Y 反転 (top=0, bottom=h) — GL 左下原点に合わせる
    //   FBO:   Y 反転しない (bottom=0, top=h) — テクスチャメモリ row 0 = DxLib y=0 にする
    if ( s_CurrentFBO != 0 ) {
        glOrtho( 0.0, ( double )s_DrawTargetW, 0.0, ( double )s_DrawTargetH, -1.0, 1.0 ) ;
    } else {
        glOrtho( 0.0, ( double )s_DrawTargetW, ( double )s_DrawTargetH, 0.0, -1.0, 1.0 ) ;
    }
    glMatrixMode( GL_MODELVIEW ) ;
    glLoadIdentity() ;
    glDisable( GL_DEPTH_TEST ) ;
    Desktop_ApplyScissor() ;
}

// DxLib DrawBright 用の現在値 (0..255)
static int s_BrightR = 255, s_BrightG = 255, s_BrightB = 255 ;

// DxLib の unsigned int Color を DrawBright 乗算して glColor に渡す
static inline void Desktop_SetGLColor( unsigned int Color )
{
    int R, G, B ;
    NS_GetColor2( Color, &R, &G, &B ) ;
    R = ( R * s_BrightR ) / 255 ;
    G = ( G * s_BrightG ) / 255 ;
    B = ( B * s_BrightB ) / 255 ;
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

// --- Stage 10: float 座標版 + Blend Mode + Bright ------------------------

extern int Graphics_Hardware_DrawQuadrangleF_PF( float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, unsigned int Color, int FillFlag )
{
    Desktop_SetOrtho2D() ;
    Desktop_SetGLColor( Color ) ;
    glBegin( FillFlag ? GL_TRIANGLE_FAN : GL_LINE_LOOP ) ;
        glVertex2f( x1, y1 ) ;
        glVertex2f( x2, y2 ) ;
        glVertex2f( x3, y3 ) ;
        glVertex2f( x4, y4 ) ;
    glEnd() ;
    return 0 ;
}

// Blend mode state (DxLib の SetDrawBlendMode → GL の glBlendFunc)
extern int Graphics_Hardware_SetDrawBlendMode_PF( int BlendMode, int BlendParam )
{
    (void)BlendParam;
    switch ( BlendMode )
    {
        case DX_BLENDMODE_NOBLEND:
            glDisable( GL_BLEND ) ;
            break ;
        case DX_BLENDMODE_ALPHA:
            glEnable( GL_BLEND ) ;
            glBlendFunc( GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA ) ;
            break ;
        case DX_BLENDMODE_ADD:
        case DX_BLENDMODE_ADD_X4:
            glEnable( GL_BLEND ) ;
            glBlendFunc( GL_SRC_ALPHA, GL_ONE ) ;
            break ;
        case DX_BLENDMODE_SUB:
        case DX_BLENDMODE_SUB1:
        case DX_BLENDMODE_SUB2:
            // glBlendEquation は extension なので compat mode では使用せず、
            // α を反転してかける近似 (完全互換でないが視認可能)
            glEnable( GL_BLEND ) ;
            glBlendFunc( GL_ZERO, GL_ONE_MINUS_SRC_ALPHA ) ;
            break ;
        case DX_BLENDMODE_MUL:
            glEnable( GL_BLEND ) ;
            glBlendFunc( GL_DST_COLOR, GL_ZERO ) ;
            break ;
        case DX_BLENDMODE_PMA_ALPHA:
            glEnable( GL_BLEND ) ;
            glBlendFunc( GL_ONE, GL_ONE_MINUS_SRC_ALPHA ) ;
            break ;
        case DX_BLENDMODE_INVSRC:
            glEnable( GL_BLEND ) ;
            glBlendFunc( GL_ONE_MINUS_SRC_COLOR, GL_ZERO ) ;
            break ;
        default:
            glDisable( GL_BLEND ) ;
            break ;
    }
    return 0 ;
}

// DxLib の DrawBright は描画輝度を 0..255 の倍率で指定する。
// fixed-function では glColor の乗算値として反映 (上の Desktop_SetGLColor で処理)。

extern int Graphics_Hardware_SetDrawBright_PF( int Red, int Green, int Blue )
{
    s_BrightR = Red ;
    s_BrightG = Green ;
    s_BrightB = Blue ;
    return 0 ;
}

extern int Graphics_Hardware_SetDrawBrightToOneParam_PF( DWORD Param )
{
    (void)Param;  // 旧 API 互換、fixed-function では未使用
    return 0 ;
}

// RefreshAlphaChDrawMode は描画先に α を書き込むか否かの切り替え。
// 描画先が back buffer の場合 α は最終合成に使われないので no-op でよい。
extern int Graphics_Hardware_RefreshAlphaChDrawMode_PF( void )
{
    return 0 ;
}

// --- Stage 17: テクスチャ (CreateOrigTexture / BltBmpOrBaseImageToGraph3 / DrawGraph) ---

extern int Graphics_Hardware_CreateOrigTexture_PF( IMAGEDATA_ORIG *Orig, int ASyncThread )
{
    (void)ASyncThread;
    if ( !Orig ) return -1 ;
    Orig->Hard.MipMapCount = 1 ;
    Orig->Hard.TexNum      = 1 ;
    IMAGEDATA_ORIG_HARD_TEX *tex = &Orig->Hard.Tex[ 0 ] ;
    tex->OrigPosX = 0 ; tex->OrigPosY = 0 ;
    tex->UseWidth = Orig->Width ;
    tex->UseHeight = Orig->Height ;
    // POT にして余白を許容 (GL ES2 互換)
    int tw = 1, th = 1 ;
    while ( tw < Orig->Width )  tw <<= 1 ;
    while ( th < Orig->Height ) th <<= 1 ;
    tex->TexWidth  = tw ;
    tex->TexHeight = th ;

    if ( !tex->PF ) {
        tex->PF = new IMAGEDATA_ORIG_HARD_TEX_PF() ;
        memset( tex->PF, 0, sizeof( *tex->PF ) ) ;
    }

    GLuint id = 0 ;
    glGenTextures( 1, &id ) ;
    tex->PF->Texture.TextureBuffer = id ;
    tex->PF->Texture.Width         = tw ;
    tex->PF->Texture.Height        = th ;
    tex->PF->Texture.MipMapCount   = 1 ;

    glBindTexture( GL_TEXTURE_2D, id ) ;
    // POT サイズで空の RGBA バッファを確保 (後で BltBmpOrBaseImageToGraph3 で埋める)
    glTexImage2D( GL_TEXTURE_2D, 0, GL_RGBA, tw, th, 0, GL_RGBA, GL_UNSIGNED_BYTE, nullptr ) ;
    glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR ) ;
    glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR ) ;
    glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_WRAP_S,     GL_CLAMP_TO_EDGE ) ;
    glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_WRAP_T,     GL_CLAMP_TO_EDGE ) ;
    glBindTexture( GL_TEXTURE_2D, 0 ) ;

    // 描画対象 (MakeScreen) ならば FBO + 深度バッファを用意する
    if ( Orig->FormatDesc.DrawValidFlag )
    {
        GLuint fbo = 0 ;
        GLuint rb_depth = 0 ;
        glGenFramebuffers( 1, &fbo ) ;
        glBindFramebuffer( GL_FRAMEBUFFER, fbo ) ;
        glFramebufferTexture2D( GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, id, 0 ) ;

        glGenRenderbuffers( 1, &rb_depth ) ;
        glBindRenderbuffer( GL_RENDERBUFFER, rb_depth ) ;
        glRenderbufferStorage( GL_RENDERBUFFER, GL_DEPTH_COMPONENT24, tw, th ) ;
        glFramebufferRenderbuffer( GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, rb_depth ) ;

        GLenum fbstat = glCheckFramebufferStatus( GL_FRAMEBUFFER ) ;
        if ( fbstat != GL_FRAMEBUFFER_COMPLETE ) {
            std::fprintf( stderr, "[DxGfxDesk] FBO incomplete: 0x%x\n", fbstat ) ;
        }
        tex->PF->FrameBuffer = fbo ;
        tex->PF->DepthBuffer = rb_depth ;

        // 元の FBO に戻す
        glBindFramebuffer( GL_FRAMEBUFFER, s_CurrentFBO ) ;
    }
    return 0 ;
}

extern int Graphics_Hardware_ReleaseOrigTexture_PF( IMAGEDATA_ORIG *Orig )
{
    if ( !Orig ) return -1 ;
    for ( int i = 0 ; i < Orig->Hard.TexNum ; ++i )
    {
        IMAGEDATA_ORIG_HARD_TEX *tex = &Orig->Hard.Tex[ i ] ;
        if ( tex->PF ) {
            GLuint fbo = ( GLuint )tex->PF->FrameBuffer ;
            GLuint rb  = ( GLuint )tex->PF->DepthBuffer ;
            GLuint id  = ( GLuint )tex->PF->Texture.TextureBuffer ;
            if ( fbo ) glDeleteFramebuffers( 1, &fbo ) ;
            if ( rb  ) glDeleteRenderbuffers( 1, &rb ) ;
            if ( id  ) glDeleteTextures( 1, &id ) ;
            delete tex->PF ;
            tex->PF = nullptr ;
        }
    }
    return 0 ;
}

// BASEIMAGE のピクセルを RGBA8 に変換してコピー (最低限、RGBA8/ARGB8 のみ対応)
// DxLib のデフォルト Color 形式は ARGB8 (BGRA8 bytes)。GL_RGBA と並び順が違うので swap
static void basemage_to_rgba8( const BASEIMAGE *bi, int x, int y, int w, int h, GLubyte *out )
{
    if ( !bi || !bi->GraphData ) { std::memset( out, 0, w * h * 4 ) ; return ; }
    const unsigned char *src0 = ( const unsigned char * )bi->GraphData ;
    int stride = bi->Pitch ;
    for ( int j = 0 ; j < h ; ++j )
    {
        const unsigned char *src = src0 + ( y + j ) * stride + x * 4 ;
        GLubyte *dst = out + j * w * 4 ;
        for ( int i = 0 ; i < w ; ++i )
        {
            // ARGB (little-endian: B,G,R,A) → RGBA
            GLubyte B = src[0] ;
            GLubyte G = src[1] ;
            GLubyte R = src[2] ;
            GLubyte A = src[3] ;
            dst[0] = R ; dst[1] = G ; dst[2] = B ; dst[3] = A ;
            src += 4 ; dst += 4 ;
        }
    }
}

extern int Graphics_Hardware_BltBmpOrBaseImageToGraph3_PF( const RECT *SrcRect, int DestX, int DestY, int GraphHandle, const BASEIMAGE *BaseImage, const BASEIMAGE *AlphaBaseImage, int ReverseFlag, int SrcBltBlendMode, int SrcBltBlendParam, int UseEdgeMode )
{
    (void)AlphaBaseImage; (void)ReverseFlag; (void)SrcBltBlendMode; (void)SrcBltBlendParam; (void)UseEdgeMode;
    if ( !BaseImage ) return -1 ;
    IMAGEDATA *ImgData = nullptr ;
    GRAPHCHK( GraphHandle, ImgData ) ;
    if ( !ImgData || !ImgData->Orig || ImgData->Orig->Hard.TexNum == 0 ) return -1 ;

    IMAGEDATA_ORIG_HARD_TEX *tex = &ImgData->Orig->Hard.Tex[ 0 ] ;
    if ( !tex->PF ) return -1 ;
    GLuint id = ( GLuint )tex->PF->Texture.TextureBuffer ;

    int sx = SrcRect ? SrcRect->left : 0 ;
    int sy = SrcRect ? SrcRect->top  : 0 ;
    int w  = SrcRect ? ( SrcRect->right - SrcRect->left ) : BaseImage->Width ;
    int h  = SrcRect ? ( SrcRect->bottom - SrcRect->top  ) : BaseImage->Height ;

    // 変換バッファ
    std::vector<GLubyte> buf( w * h * 4 ) ;
    basemage_to_rgba8( BaseImage, sx, sy, w, h, buf.data() ) ;

    glBindTexture( GL_TEXTURE_2D, id ) ;
    glTexSubImage2D( GL_TEXTURE_2D, 0, DestX, DestY, w, h, GL_RGBA, GL_UNSIGNED_BYTE, buf.data() ) ;
    glBindTexture( GL_TEXTURE_2D, 0 ) ;
    return 0 ;
}

extern int Graphics_Hardware_DrawGraph_PF( int x, int y, float xf, float yf, IMAGEDATA *Image, IMAGEDATA *BlendImage, int TransFlag, int IntFlag )
{
    (void)BlendImage; (void)IntFlag;
    if ( !Image || !Image->Orig || Image->Orig->Hard.TexNum == 0 ) return -1 ;
    IMAGEDATA_ORIG_HARD_TEX *tex = &Image->Orig->Hard.Tex[ 0 ] ;
    if ( !tex->PF ) return -1 ;

    float fx = ( xf != 0.0f ) ? xf : ( float )x ;
    float fy = ( yf != 0.0f ) ? yf : ( float )y ;

    float u0 = ( float )tex->OrigPosX / ( float )tex->TexWidth ;
    float v0 = ( float )tex->OrigPosY / ( float )tex->TexHeight ;
    float u1 = u0 + ( float )tex->UseWidth  / ( float )tex->TexWidth ;
    float v1 = v0 + ( float )tex->UseHeight / ( float )tex->TexHeight ;

    Desktop_SetOrtho2D() ;
    if ( TransFlag ) {
        glEnable( GL_BLEND ) ;
        glBlendFunc( GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA ) ;
    }
    glColor4ub( 255, 255, 255, 255 ) ;
    glEnable( GL_TEXTURE_2D ) ;
    glBindTexture( GL_TEXTURE_2D, ( GLuint )tex->PF->Texture.TextureBuffer ) ;
    glBegin( GL_TRIANGLE_STRIP ) ;
        glTexCoord2f( u0, v0 ) ; glVertex2f( fx,                               fy ) ;
        glTexCoord2f( u1, v0 ) ; glVertex2f( fx + ( float )tex->UseWidth,      fy ) ;
        glTexCoord2f( u0, v1 ) ; glVertex2f( fx,                               fy + ( float )tex->UseHeight ) ;
        glTexCoord2f( u1, v1 ) ; glVertex2f( fx + ( float )tex->UseWidth,      fy + ( float )tex->UseHeight ) ;
    glEnd() ;
    glBindTexture( GL_TEXTURE_2D, 0 ) ;
    glDisable( GL_TEXTURE_2D ) ;
    return 0 ;
}

// --- Stage 18: テクスチャ拡張 (ExtendGraph / RotaGraph) ------------------

static void Desktop_DrawTexQuad( IMAGEDATA_ORIG_HARD_TEX *tex, float cx[4], float cy[4], int TransFlag )
{
    float u0 = ( float )tex->OrigPosX / ( float )tex->TexWidth ;
    float v0 = ( float )tex->OrigPosY / ( float )tex->TexHeight ;
    float u1 = u0 + ( float )tex->UseWidth  / ( float )tex->TexWidth ;
    float v1 = v0 + ( float )tex->UseHeight / ( float )tex->TexHeight ;

    Desktop_SetOrtho2D() ;
    if ( TransFlag ) {
        glEnable( GL_BLEND ) ;
        glBlendFunc( GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA ) ;
    }
    glColor4ub( 255, 255, 255, 255 ) ;
    glEnable( GL_TEXTURE_2D ) ;
    glBindTexture( GL_TEXTURE_2D, ( GLuint )tex->PF->Texture.TextureBuffer ) ;
    // cx,cy の順: 左上, 右上, 左下, 右下 → GL_TRIANGLE_STRIP
    glBegin( GL_TRIANGLE_STRIP ) ;
        glTexCoord2f( u0, v0 ) ; glVertex2f( cx[0], cy[0] ) ;
        glTexCoord2f( u1, v0 ) ; glVertex2f( cx[1], cy[1] ) ;
        glTexCoord2f( u0, v1 ) ; glVertex2f( cx[2], cy[2] ) ;
        glTexCoord2f( u1, v1 ) ; glVertex2f( cx[3], cy[3] ) ;
    glEnd() ;
    glBindTexture( GL_TEXTURE_2D, 0 ) ;
    glDisable( GL_TEXTURE_2D ) ;
}

extern int Graphics_Hardware_DrawExtendGraph_PF( int x1, int y1, int x2, int y2, float x1f, float y1f, float x2f, float y2f, IMAGEDATA *Image, IMAGEDATA *BlendImage, int TransFlag, int IntFlag )
{
    (void)BlendImage; (void)IntFlag; (void)x1f; (void)y1f; (void)x2f; (void)y2f;
    if ( !Image || !Image->Orig || Image->Orig->Hard.TexNum == 0 ) return -1 ;
    IMAGEDATA_ORIG_HARD_TEX *tex = &Image->Orig->Hard.Tex[ 0 ] ;
    if ( !tex->PF ) return -1 ;
    float cx[4] = { ( float )x1, ( float )x2, ( float )x1, ( float )x2 } ;
    float cy[4] = { ( float )y1, ( float )y1, ( float )y2, ( float )y2 } ;
    Desktop_DrawTexQuad( tex, cx, cy, TransFlag ) ;
    return 0 ;
}

extern int Graphics_Hardware_DrawRotaGraph_PF( int x, int y, float xf, float yf, double ExRate, double Angle, IMAGEDATA *Image, IMAGEDATA *BlendImage, int TransFlag, int ReverseXFlag, int ReverseYFlag, int IntFlag )
{
    (void)BlendImage; (void)IntFlag;
    if ( !Image || !Image->Orig || Image->Orig->Hard.TexNum == 0 ) return -1 ;
    IMAGEDATA_ORIG_HARD_TEX *tex = &Image->Orig->Hard.Tex[ 0 ] ;
    if ( !tex->PF ) return -1 ;
    float fx = ( xf != 0.0f ) ? xf : ( float )x ;
    float fy = ( yf != 0.0f ) ? yf : ( float )y ;
    float w = ( float )tex->UseWidth  * ( float )ExRate ;
    float h = ( float )tex->UseHeight * ( float )ExRate ;
    float hw = w * 0.5f, hh = h * 0.5f ;
    float cosA = ( float )std::cos( Angle ) ;
    float sinA = ( float )std::sin( Angle ) ;

    // center 回転。局所 (-hw,-hh)..(+hw,+hh) を回転して offset
    float lx0 = ReverseXFlag ?  hw : -hw ;
    float lx1 = ReverseXFlag ? -hw :  hw ;
    float ly0 = ReverseYFlag ?  hh : -hh ;
    float ly1 = ReverseYFlag ? -hh :  hh ;
    auto rot = [&]( float lx, float ly, float &rx, float &ry ) {
        rx = fx + lx * cosA - ly * sinA ;
        ry = fy + lx * sinA + ly * cosA ;
    } ;
    float cx[4], cy[4] ;
    rot( lx0, ly0, cx[0], cy[0] ) ;  // TL
    rot( lx1, ly0, cx[1], cy[1] ) ;  // TR
    rot( lx0, ly1, cx[2], cy[2] ) ;  // BL
    rot( lx1, ly1, cx[3], cy[3] ) ;  // BR
    Desktop_DrawTexQuad( tex, cx, cy, TransFlag ) ;
    return 0 ;
}

extern int Graphics_Hardware_DrawRotaGraphFast_PF( int x, int y, float xf, float yf, float ExtendRate, float Angle, IMAGEDATA *Image, IMAGEDATA *BlendImage, int TransFlag, int ReverseXFlag, int ReverseYFlag, int IntFlag )
{
    return Graphics_Hardware_DrawRotaGraph_PF( x, y, xf, yf, ( double )ExtendRate, ( double )Angle, Image, BlendImage, TransFlag, ReverseXFlag, ReverseYFlag, IntFlag ) ;
}

// 4 点自由変形。頂点順: (x1,y1)=LT, (x2,y2)=RT, (x3,y3)=RB, (x4,y4)=LB
extern int Graphics_Hardware_DrawModiGraph_PF( int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, IMAGEDATA *Image, IMAGEDATA *BlendImage, int TransFlag, bool Is3D )
{
    (void)BlendImage; (void)Is3D;
    if ( !Image || !Image->Orig || Image->Orig->Hard.TexNum == 0 ) return -1 ;
    IMAGEDATA_ORIG_HARD_TEX *tex = &Image->Orig->Hard.Tex[ 0 ] ;
    if ( !tex->PF ) return -1 ;

    // cx, cy の順は Desktop_DrawTexQuad: 左上 / 右上 / 左下 / 右下 (GL_TRIANGLE_STRIP)
    float cx[ 4 ] = { ( float )x1, ( float )x2, ( float )x4, ( float )x3 } ;
    float cy[ 4 ] = { ( float )y1, ( float )y2, ( float )y4, ( float )y3 } ;
    Desktop_DrawTexQuad( tex, cx, cy, TransFlag ) ;
    return 0 ;
}

extern int Graphics_Hardware_DrawModiGraphF_PF( float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, IMAGEDATA *Image, IMAGEDATA *BlendImage, int TransFlag, bool Is3D )
{
    (void)BlendImage; (void)Is3D;
    if ( !Image || !Image->Orig || Image->Orig->Hard.TexNum == 0 ) return -1 ;
    IMAGEDATA_ORIG_HARD_TEX *tex = &Image->Orig->Hard.Tex[ 0 ] ;
    if ( !tex->PF ) return -1 ;
    float cx[ 4 ] = { x1, x2, x4, x3 } ;
    float cy[ 4 ] = { y1, y2, y4, y3 } ;
    Desktop_DrawTexQuad( tex, cx, cy, TransFlag ) ;
    return 0 ;
}

// --- Stage 19: 汎用 2D プリミティブ描画 (font atlas 用) ------------------
// DxLib の NS_DrawString は内部で atlas texture を持ち、この PF で描画する。
// VERTEX_2D は pos(VECTOR) + rhw + color(ARGB8) + u,v。座標は既にスクリーン。
//
// PrimitiveType (DxLib 定数):
//   DX_PRIMTYPE_POINTLIST=1 LINELIST=2 LINESTRIP=3 TRIANGLELIST=4 TRIANGLESTRIP=5 TRIANGLEFAN=6

extern int Graphics_Hardware_DrawPrimitive2D_PF( VERTEX_2D *Vertex, int VertexNum, int PrimitiveType, IMAGEDATA *Image, int TransFlag, int BillboardFlag, int Is3D, int ReverseXFlag, int ReverseYFlag, int TextureNo, int IsShadowMap )
{
    (void)BillboardFlag; (void)Is3D; (void)ReverseXFlag; (void)ReverseYFlag; (void)TextureNo; (void)IsShadowMap;
    if ( !Vertex || VertexNum <= 0 ) return 0 ;

    Desktop_SetOrtho2D() ;

    if ( TransFlag ) {
        glEnable( GL_BLEND ) ;
        glBlendFunc( GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA ) ;
    }

    GLenum mode = GL_TRIANGLES ;
    switch ( PrimitiveType ) {
        case 1: mode = GL_POINTS        ; break ;
        case 2: mode = GL_LINES         ; break ;
        case 3: mode = GL_LINE_STRIP    ; break ;
        case 4: mode = GL_TRIANGLES     ; break ;
        case 5: mode = GL_TRIANGLE_STRIP; break ;
        case 6: mode = GL_TRIANGLE_FAN  ; break ;
        default: mode = GL_TRIANGLES    ; break ;
    }

    // テクスチャ指定があればバインド
    bool hasTex = false ;
    if ( Image && Image->Orig && Image->Orig->Hard.TexNum > 0 ) {
        IMAGEDATA_ORIG_HARD_TEX *tex = &Image->Orig->Hard.Tex[ 0 ] ;
        if ( tex->PF ) {
            glEnable( GL_TEXTURE_2D ) ;
            glBindTexture( GL_TEXTURE_2D, ( GLuint )tex->PF->Texture.TextureBuffer ) ;
            hasTex = true ;
        }
    }

    glBegin( mode ) ;
    for ( int i = 0 ; i < VertexNum ; ++i )
    {
        const VERTEX_2D &v = Vertex[ i ] ;
        // color は DxLib 内部 ARGB8 (DxLib GetColor 形式)
        int R, G, B ;
        NS_GetColor2( v.color, &R, &G, &B ) ;
        GLubyte A = ( GLubyte )( ( v.color >> 24 ) & 0xFF ) ;
        if ( A == 0 && ( v.color & 0x00FFFFFF ) != 0 ) A = 255 ;  // 色があって α=0 は不透明扱い
        glColor4ub( ( GLubyte )R, ( GLubyte )G, ( GLubyte )B, A ) ;
        if ( hasTex ) glTexCoord2f( v.u, v.v ) ;
        glVertex2f( v.pos.x, v.pos.y ) ;
    }
    glEnd() ;

    if ( hasTex ) {
        glBindTexture( GL_TEXTURE_2D, 0 ) ;
        glDisable( GL_TEXTURE_2D ) ;
    }
    return 0 ;
}

// --- その他 (Stage 5 から継続) -------------------------------------------

// --- Tier 1: SetDrawScreen / SetDrawArea / FillGraph / GraphLock 系 --------

extern int Graphics_Hardware_SetDrawScreen_PF( int DrawScreen, int OldScreenSurface, int OldScreenMipLevel, IMAGEDATA *Image, IMAGEDATA *OldImage, SHADOWMAPDATA *ShadowMap, SHADOWMAPDATA *OldShadowMap )
{
    (void)OldScreenSurface; (void)OldScreenMipLevel; (void)OldImage;
    (void)ShadowMap; (void)OldShadowMap;

    // DX_SCREEN_BACK / DX_SCREEN_FRONT / DX_SCREEN_WORK → default framebuffer
    if ( ( DWORD )DrawScreen == DX_SCREEN_BACK  ||
         ( DWORD )DrawScreen == DX_SCREEN_FRONT ||
         ( DWORD )DrawScreen == DX_SCREEN_WORK  ||
         ( DWORD )DrawScreen == DX_SCREEN_TEMPFRONT )
    {
        s_CurrentFBO  = 0 ;
        s_DrawTargetW = s_WinW ;
        s_DrawTargetH = s_WinH ;
        glBindFramebuffer( GL_FRAMEBUFFER, 0 ) ;
        glViewport( 0, 0, s_DrawTargetW, s_DrawTargetH ) ;
        return 0 ;
    }

    // 画像ハンドル → FBO
    if ( !Image || !Image->Orig || Image->Orig->Hard.TexNum == 0 ) return -1 ;
    IMAGEDATA_ORIG_HARD_TEX *tex = &Image->Orig->Hard.Tex[ 0 ] ;
    if ( !tex->PF ) return -1 ;
    GLuint fbo = ( GLuint )tex->PF->FrameBuffer ;
    if ( !fbo ) {
        std::fprintf( stderr, "[DxGfxDesk] SetDrawScreen: image has no FBO (not a MakeScreen target?)\n" ) ;
        return -1 ;
    }
    s_CurrentFBO  = fbo ;
    s_DrawTargetW = tex->UseWidth ;
    s_DrawTargetH = tex->UseHeight ;
    glBindFramebuffer( GL_FRAMEBUFFER, fbo ) ;
    glViewport( 0, 0, s_DrawTargetW, s_DrawTargetH ) ;
    return 0 ;
}

extern int Graphics_Hardware_SetDrawScreen_Post_PF( int DrawScreen )
{
    (void)DrawScreen;
    // DxGraphics 側が SetDrawArea を改めて呼ぶので、ここでは何もしない
    return 0 ;
}

extern int Graphics_Hardware_SetDrawArea_PF( int x1, int y1, int x2, int y2 )
{
    s_DrawArea_L = x1 ;
    s_DrawArea_T = y1 ;
    s_DrawArea_R = x2 ;
    s_DrawArea_B = y2 ;
    // 画面全域なら scissor 無効化
    int fullw = s_DrawTargetW ;
    int fullh = s_DrawTargetH ;
    s_DrawAreaValid = !( x1 == 0 && y1 == 0 && x2 == fullw && y2 == fullh ) ;
    Desktop_ApplyScissor() ;
    return 0 ;
}

extern int Graphics_Hardware_FillGraph_PF( IMAGEDATA *Image, int R, int G, int B, int A, int Surface )
{
    (void)Surface;
    if ( !Image || !Image->Orig || Image->Orig->Hard.TexNum == 0 ) return -1 ;
    IMAGEDATA_ORIG_HARD_TEX *tex = &Image->Orig->Hard.Tex[ 0 ] ;
    if ( !tex->PF ) return -1 ;

    // 描画対象に FBO がある場合は glClear で塗りつぶす
    GLuint fbo = ( GLuint )tex->PF->FrameBuffer ;
    if ( fbo )
    {
        GLint prev_fbo = 0 ;
        glGetIntegerv( GL_FRAMEBUFFER_BINDING, &prev_fbo ) ;
        glBindFramebuffer( GL_FRAMEBUFFER, fbo ) ;
        glDisable( GL_SCISSOR_TEST ) ;
        glClearColor( R / 255.0f, G / 255.0f, B / 255.0f, A / 255.0f ) ;
        glClear( GL_COLOR_BUFFER_BIT ) ;
        glBindFramebuffer( GL_FRAMEBUFFER, ( GLuint )prev_fbo ) ;
        Desktop_ApplyScissor() ;
        return 0 ;
    }
    // FBO が無いテクスチャは glTexSubImage2D で RGBA 配列を埋める
    GLuint id = ( GLuint )tex->PF->Texture.TextureBuffer ;
    if ( !id ) return -1 ;
    int w = tex->UseWidth ;
    int h = tex->UseHeight ;
    std::vector<GLubyte> buf( ( size_t )w * ( size_t )h * 4 ) ;
    for ( size_t i = 0 ; i < buf.size() ; i += 4 ) {
        buf[ i + 0 ] = ( GLubyte )R ;
        buf[ i + 1 ] = ( GLubyte )G ;
        buf[ i + 2 ] = ( GLubyte )B ;
        buf[ i + 3 ] = ( GLubyte )A ;
    }
    glBindTexture( GL_TEXTURE_2D, id ) ;
    glTexSubImage2D( GL_TEXTURE_2D, 0, 0, 0, w, h, GL_RGBA, GL_UNSIGNED_BYTE, buf.data() ) ;
    glBindTexture( GL_TEXTURE_2D, 0 ) ;
    return 0 ;
}

// GraphLock / GraphUnlock: CPU 側へテクスチャ内容をコピー / 書き戻し
//   DxLib は CPU 側バッファと GL texture を分離管理するが、ここでは簡易実装として
//   Lock 時に glGetTexImage で吸い出し、Unlock 時に glTexSubImage2D で戻す。
//   Web (WebGL) は glGetTexImage 非対応なので FBO 経由で glReadPixels 迂回。
static std::vector<GLubyte> s_LockBuffer ;
static GLuint s_LockTexId = 0 ;
static int    s_LockW = 0, s_LockH = 0 ;

extern int Graphics_Hardware_GraphLock_PF( IMAGEDATA *Image, COLORDATA **ColorDataPP, int WriteOnlyFlag )
{
    (void)WriteOnlyFlag;
    if ( !Image || !Image->Orig || Image->Orig->Hard.TexNum == 0 ) return -1 ;
    IMAGEDATA_ORIG_HARD_TEX *tex = &Image->Orig->Hard.Tex[ 0 ] ;
    if ( !tex->PF ) return -1 ;
    GLuint id = ( GLuint )tex->PF->Texture.TextureBuffer ;
    if ( !id ) return -1 ;

    int w = tex->TexWidth ;
    int h = tex->TexHeight ;
    s_LockBuffer.assign( ( size_t )w * ( size_t )h * 4, 0 ) ;
    s_LockTexId = id ;
    s_LockW = w ;
    s_LockH = h ;
#ifndef __EMSCRIPTEN__
    glBindTexture( GL_TEXTURE_2D, id ) ;
    glGetTexImage( GL_TEXTURE_2D, 0, GL_BGRA, GL_UNSIGNED_BYTE, s_LockBuffer.data() ) ;
    glBindTexture( GL_TEXTURE_2D, 0 ) ;
#else
    // WebGL: glGetTexImage 未サポート。FBO 経由で ReadPixels
    GLuint tmp_fbo = 0 ;
    glGenFramebuffers( 1, &tmp_fbo ) ;
    glBindFramebuffer( GL_FRAMEBUFFER, tmp_fbo ) ;
    glFramebufferTexture2D( GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, id, 0 ) ;
    glReadPixels( 0, 0, w, h, GL_RGBA, GL_UNSIGNED_BYTE, s_LockBuffer.data() ) ;
    // RGBA → BGRA swap
    for ( size_t i = 0 ; i < s_LockBuffer.size() ; i += 4 ) {
        std::swap( s_LockBuffer[ i + 0 ], s_LockBuffer[ i + 2 ] ) ;
    }
    glBindFramebuffer( GL_FRAMEBUFFER, s_CurrentFBO ) ;
    glDeleteFramebuffers( 1, &tmp_fbo ) ;
#endif
    Image->LockImage      = ( BYTE * )s_LockBuffer.data() ;
    Image->LockImagePitch = ( DWORD )( w * 4 ) ;
    // ColorDataPP は ARGB8 フォーマット (DxLib 内部標準) を返す
    if ( ColorDataPP ) {
        static COLORDATA s_lockColor ;
        NS_CreateARGB8ColorData( &s_lockColor ) ;
        *ColorDataPP = &s_lockColor ;
    }
    return 0 ;
}

extern int Graphics_Hardware_GraphUnlock_PF( IMAGEDATA *Image )
{
    if ( !Image || !s_LockTexId ) return -1 ;
    // 書き戻し: BGRA → テクスチャ
    glBindTexture( GL_TEXTURE_2D, s_LockTexId ) ;
    glTexSubImage2D( GL_TEXTURE_2D, 0, 0, 0, s_LockW, s_LockH, GL_BGRA, GL_UNSIGNED_BYTE, s_LockBuffer.data() ) ;
    glBindTexture( GL_TEXTURE_2D, 0 ) ;
    s_LockTexId = 0 ;
    s_LockBuffer.clear() ;
    return 0 ;
}

// GetDrawScreenGraph 用: 取り込み元 (TargetImage or backbuffer) の rect を
// 取得して dest (Image) の (destX,destY) に転送する。
//   glReadPixels は GL 座標系 (bottom-up) なので Y を反転して取得し、
//   さらに取得した行を上下反転してから glTexSubImage2D へ書き込む。
extern int Graphics_Hardware_GetDrawScreenGraphBase_PF( IMAGEDATA *Image, IMAGEDATA *TargetImage, int TargetScreen, int TargetScreenSurface, int TargetScreenMipLevel, int TargetScreenWidth, int TargetScreenHeight, int x1, int y1, int x2, int y2, int destX, int destY )
{
    (void)TargetScreen; (void)TargetScreenSurface; (void)TargetScreenMipLevel;
    if ( !Image || !Image->Orig || Image->Orig->Hard.TexNum == 0 ) return -1 ;
    IMAGEDATA_ORIG_HARD_TEX *dtex = &Image->Orig->Hard.Tex[ 0 ] ;
    if ( !dtex->PF ) return -1 ;
    GLuint dstTex = ( GLuint )dtex->PF->Texture.TextureBuffer ;
    if ( !dstTex ) return -1 ;

    int w = x2 - x1 ;
    int h = y2 - y1 ;
    if ( w <= 0 || h <= 0 ) return -1 ;

    // 取り込み元 FBO と width/height を決定
    GLuint srcFbo  = 0 ;
    int    srcW = 0, srcH = 0 ;
    if ( TargetImage )
    {
        if ( !TargetImage->Orig || TargetImage->Orig->Hard.TexNum == 0 ) return -1 ;
        IMAGEDATA_ORIG_HARD_TEX *stex = &TargetImage->Orig->Hard.Tex[ 0 ] ;
        if ( !stex->PF || !stex->PF->FrameBuffer ) return -1 ;
        srcFbo = ( GLuint )stex->PF->FrameBuffer ;
        srcW   = stex->UseWidth ;
        srcH   = stex->UseHeight ;
    }
    else
    {
        srcFbo = 0 ;  // default framebuffer (back buffer)
        srcW   = ( TargetScreenWidth  > 0 ) ? TargetScreenWidth  : s_WinW ;
        srcH   = ( TargetScreenHeight > 0 ) ? TargetScreenHeight : s_WinH ;
    }

    // 描画保留があれば flush
    glFlush() ;

    // GL: bottom-left origin → flip Y
    int glY = srcH - ( y1 + h ) ;
    if ( glY < 0 ) glY = 0 ;

    std::vector<GLubyte> buf( ( size_t )w * ( size_t )h * 4 ) ;

    GLint prev_fbo = 0 ;
    glGetIntegerv( GL_FRAMEBUFFER_BINDING, &prev_fbo ) ;
    glBindFramebuffer( GL_FRAMEBUFFER, srcFbo ) ;
    glPixelStorei( GL_PACK_ALIGNMENT, 1 ) ;
#ifndef __EMSCRIPTEN__
    glReadPixels( x1, glY, w, h, GL_BGRA, GL_UNSIGNED_BYTE, buf.data() ) ;
#else
    // WebGL は GL_BGRA 非対応。RGBA で読んで後で swap。
    glReadPixels( x1, glY, w, h, GL_RGBA, GL_UNSIGNED_BYTE, buf.data() ) ;
    for ( size_t i = 0 ; i < buf.size() ; i += 4 ) std::swap( buf[ i + 0 ], buf[ i + 2 ] ) ;
#endif
    glBindFramebuffer( GL_FRAMEBUFFER, ( GLuint )prev_fbo ) ;

    // 行単位で上下反転
    int rowBytes = w * 4 ;
    std::vector<GLubyte> flipped( buf.size() ) ;
    for ( int r = 0 ; r < h ; ++r )
    {
        std::memcpy( &flipped[ ( size_t )r * rowBytes ],
                     &buf    [ ( size_t )( h - 1 - r ) * rowBytes ],
                     rowBytes ) ;
    }

    // dest texture に転送
    glBindTexture( GL_TEXTURE_2D, dstTex ) ;
    glPixelStorei( GL_UNPACK_ALIGNMENT, 1 ) ;
    glTexSubImage2D( GL_TEXTURE_2D, 0, destX, destY, w, h, GL_BGRA, GL_UNSIGNED_BYTE, flipped.data() ) ;
    glBindTexture( GL_TEXTURE_2D, 0 ) ;
    return 0 ;
}

// --- Tier 3: 3D 描画 (Matrix / Line3D / Triangle3D / Pixel3D / Billboard3D / Primitive3D) ---

static MATRIX s_ViewMat    = { { { 1,0,0,0 },{ 0,1,0,0 },{ 0,0,1,0 },{ 0,0,0,1 } } } ;
static MATRIX s_ProjMat    = { { { 1,0,0,0 },{ 0,1,0,0 },{ 0,0,1,0 },{ 0,0,0,1 } } } ;
static MATRIX s_WorldMat   = { { { 1,0,0,0 },{ 0,1,0,0 },{ 0,0,1,0 },{ 0,0,0,1 } } } ;

extern int Graphics_Hardware_SetTransformToView_PF      ( const MATRIX *m ) { if ( m ) s_ViewMat  = *m ; return 0 ; }
extern int Graphics_Hardware_SetTransformToProjection_PF( const MATRIX *m ) { if ( m ) s_ProjMat  = *m ; return 0 ; }
extern int Graphics_Hardware_SetTransformToWorld_PF     ( const MATRIX *m ) { if ( m ) s_WorldMat = *m ; return 0 ; }
extern int Graphics_Hardware_SetTransformToViewport_PF  ( const MATRIX *m ) { (void)m; return 0 ; }

// DxLib の行 major MATRIX を glLoadMatrixf に渡すと自動的に転置されて GL 列 major
// として解釈される。結果、ベクトル変換ルールの違いが相殺され、意図通りに動く。
// (DxLib: v' = v*M, GL: v' = M*v — storage layout が逆で整合)
static void Desktop_Apply3DMatrices( void )
{
    glViewport( 0, 0, s_DrawTargetW, s_DrawTargetH ) ;
    glMatrixMode( GL_PROJECTION ) ;
    glLoadMatrixf( ( const float * )s_ProjMat.m ) ;
    glMatrixMode( GL_MODELVIEW ) ;
    glLoadMatrixf( ( const float * )s_ViewMat.m ) ;
    glMultMatrixf( ( const float * )s_WorldMat.m ) ;
    Desktop_ApplyScissor() ;
}

extern int Graphics_Hardware_DrawLine3D_PF( VECTOR Pos1, VECTOR Pos2, unsigned int Color, int WriteZBufferFlag, RECT *DrawArea )
{
    (void)DrawArea;
    Desktop_Apply3DMatrices() ;
    if ( WriteZBufferFlag ) glEnable( GL_DEPTH_TEST ) ; else glDisable( GL_DEPTH_TEST ) ;
    Desktop_SetGLColor( Color ) ;
    glBegin( GL_LINES ) ;
        glVertex3f( Pos1.x, Pos1.y, Pos1.z ) ;
        glVertex3f( Pos2.x, Pos2.y, Pos2.z ) ;
    glEnd() ;
    return 0 ;
}

extern int Graphics_Hardware_DrawPixel3D_PF( VECTOR Pos, unsigned int Color, int WriteZBufferFlag, RECT *DrawArea )
{
    (void)DrawArea;
    Desktop_Apply3DMatrices() ;
    if ( WriteZBufferFlag ) glEnable( GL_DEPTH_TEST ) ; else glDisable( GL_DEPTH_TEST ) ;
    Desktop_SetGLColor( Color ) ;
    glBegin( GL_POINTS ) ;
        glVertex3f( Pos.x, Pos.y, Pos.z ) ;
    glEnd() ;
    return 0 ;
}

extern int Graphics_Hardware_DrawTriangle3D_PF( VECTOR Pos1, VECTOR Pos2, VECTOR Pos3, unsigned int Color, int FillFlag, int WriteZBufferFlag, RECT *DrawArea )
{
    (void)DrawArea;
    Desktop_Apply3DMatrices() ;
    if ( WriteZBufferFlag ) glEnable( GL_DEPTH_TEST ) ; else glDisable( GL_DEPTH_TEST ) ;
    Desktop_SetGLColor( Color ) ;
    glBegin( FillFlag ? GL_TRIANGLES : GL_LINE_LOOP ) ;
        glVertex3f( Pos1.x, Pos1.y, Pos1.z ) ;
        glVertex3f( Pos2.x, Pos2.y, Pos2.z ) ;
        glVertex3f( Pos3.x, Pos3.y, Pos3.z ) ;
    glEnd() ;
    return 0 ;
}

extern int Graphics_Hardware_DrawBillboard3D_PF( VECTOR Pos, float cx, float cy, float Size, float Angle, IMAGEDATA *Image, IMAGEDATA *BlendImage, int TransFlag, int WriteZBufferFlag, int Is3D, int IntFlag, RECT *DrawArea )
{
    (void)BlendImage; (void)Is3D; (void)IntFlag; (void)DrawArea;
    if ( !Image || !Image->Orig || Image->Orig->Hard.TexNum == 0 ) return -1 ;
    IMAGEDATA_ORIG_HARD_TEX *tex = &Image->Orig->Hard.Tex[ 0 ] ;
    if ( !tex->PF ) return -1 ;

    Desktop_Apply3DMatrices() ;
    if ( WriteZBufferFlag ) glEnable( GL_DEPTH_TEST ) ; else glDisable( GL_DEPTH_TEST ) ;

    // View 行列の逆から「右ベクトル (X)」「上ベクトル (Y)」をワールド空間で取り出し、
    // billboard quad に適用する。回転 Angle は view 前の quad を Z 軸周りに回転。
    // DxLib MATRIX は row-major なので view[0][0..2] = view の第1行 (ワールド→view 射影の x 軸成分)。
    // 視野座標系: 右 = view 第 1 列 = view[0][0], view[1][0], view[2][0] をワールドへ。
    // Row-major 逆転/転置関係より、ここでは view_row[i][0..2] を「ワールドの基底」と解釈する。
    // DxLib 互換動作のため: カメラ行列の右ベクトルは s_ViewMat.m[0][*]、上ベクトルは s_ViewMat.m[1][*]。
    float rx = s_ViewMat.m[ 0 ][ 0 ], ry = s_ViewMat.m[ 1 ][ 0 ], rz = s_ViewMat.m[ 2 ][ 0 ] ;
    float ux = s_ViewMat.m[ 0 ][ 1 ], uy = s_ViewMat.m[ 1 ][ 1 ], uz = s_ViewMat.m[ 2 ][ 1 ] ;

    float hw = Size * 0.5f, hh = Size * 0.5f ;
    // Angle 適用 (local 2D 回転)
    float c = std::cos( Angle ), s = std::sin( Angle ) ;
    // quad ローカル座標 4 隅 (中心基準)
    float lx[ 4 ] = { -hw - cx, +hw - cx, -hw - cx, +hw - cx } ;
    float ly[ 4 ] = { -hh - cy, -hh - cy, +hh - cy, +hh - cy } ;

    float wpx[ 4 ], wpy[ 4 ], wpz[ 4 ] ;
    for ( int i = 0 ; i < 4 ; ++i ) {
        float lrx =  lx[ i ] * c - ly[ i ] * s ;
        float lry =  lx[ i ] * s + ly[ i ] * c ;
        wpx[ i ] = Pos.x + rx * lrx + ux * lry ;
        wpy[ i ] = Pos.y + ry * lrx + uy * lry ;
        wpz[ i ] = Pos.z + rz * lrx + uz * lry ;
    }
    float u0 = ( float )tex->OrigPosX / ( float )tex->TexWidth ;
    float v0 = ( float )tex->OrigPosY / ( float )tex->TexHeight ;
    float u1 = u0 + ( float )tex->UseWidth  / ( float )tex->TexWidth ;
    float v1 = v0 + ( float )tex->UseHeight / ( float )tex->TexHeight ;

    if ( TransFlag ) { glEnable( GL_BLEND ) ; glBlendFunc( GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA ) ; }
    glEnable( GL_TEXTURE_2D ) ;
    glBindTexture( GL_TEXTURE_2D, ( GLuint )tex->PF->Texture.TextureBuffer ) ;
    glColor4ub( 255, 255, 255, 255 ) ;
    glBegin( GL_TRIANGLE_STRIP ) ;
        glTexCoord2f( u0, v0 ) ; glVertex3f( wpx[ 0 ], wpy[ 0 ], wpz[ 0 ] ) ;
        glTexCoord2f( u1, v0 ) ; glVertex3f( wpx[ 1 ], wpy[ 1 ], wpz[ 1 ] ) ;
        glTexCoord2f( u0, v1 ) ; glVertex3f( wpx[ 2 ], wpy[ 2 ], wpz[ 2 ] ) ;
        glTexCoord2f( u1, v1 ) ; glVertex3f( wpx[ 3 ], wpy[ 3 ], wpz[ 3 ] ) ;
    glEnd() ;
    glBindTexture( GL_TEXTURE_2D, 0 ) ;
    glDisable( GL_TEXTURE_2D ) ;
    return 0 ;
}

// DxLib VERTEX_3D は pos(x,y,z) + b,g,r,a + u,v。PrimitiveType:
//   1: POINTLIST, 2: LINELIST, 3: LINESTRIP, 4: TRIANGLELIST, 5: TRIANGLESTRIP, 6: TRIANGLEFAN
extern int Graphics_Hardware_DrawPrimitive_PF( const VERTEX_3D *Vertex, int VertexNum, int PrimitiveType, IMAGEDATA *Image, int TransFlag )
{
    if ( !Vertex || VertexNum <= 0 ) return 0 ;
    Desktop_Apply3DMatrices() ;

    GLenum mode = GL_TRIANGLES ;
    switch ( PrimitiveType ) {
        case 1: mode = GL_POINTS        ; break ;
        case 2: mode = GL_LINES         ; break ;
        case 3: mode = GL_LINE_STRIP    ; break ;
        case 4: mode = GL_TRIANGLES     ; break ;
        case 5: mode = GL_TRIANGLE_STRIP; break ;
        case 6: mode = GL_TRIANGLE_FAN  ; break ;
        default: mode = GL_TRIANGLES    ; break ;
    }

    bool hasTex = false ;
    if ( Image && Image->Orig && Image->Orig->Hard.TexNum > 0 ) {
        IMAGEDATA_ORIG_HARD_TEX *tex = &Image->Orig->Hard.Tex[ 0 ] ;
        if ( tex->PF ) {
            glEnable( GL_TEXTURE_2D ) ;
            glBindTexture( GL_TEXTURE_2D, ( GLuint )tex->PF->Texture.TextureBuffer ) ;
            hasTex = true ;
        }
    }
    if ( TransFlag ) { glEnable( GL_BLEND ) ; glBlendFunc( GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA ) ; }

    glBegin( mode ) ;
    for ( int i = 0 ; i < VertexNum ; ++i ) {
        const VERTEX_3D &v = Vertex[ i ] ;
        glColor4ub( v.r, v.g, v.b, v.a ) ;
        if ( hasTex ) glTexCoord2f( v.u, v.v ) ;
        glVertex3f( v.pos.x, v.pos.y, v.pos.z ) ;
    }
    glEnd() ;
    if ( hasTex ) { glBindTexture( GL_TEXTURE_2D, 0 ) ; glDisable( GL_TEXTURE_2D ) ; }
    return 0 ;
}

// DrawPrimitiveLight: VERTEX3D (pos/norm/dif/spc/uv) 版。ライティングは未実装
// なので diffuse 色のみ使用 (dif) して DrawPrimitive と同等の fallback に。
extern int Graphics_Hardware_DrawPrimitiveLight_PF( const VERTEX3D *Vertex, int VertexNum, int PrimitiveType, IMAGEDATA *Image, int TransFlag )
{
    if ( !Vertex || VertexNum <= 0 ) return 0 ;
    Desktop_Apply3DMatrices() ;

    GLenum mode = GL_TRIANGLES ;
    switch ( PrimitiveType ) {
        case 1: mode = GL_POINTS        ; break ;
        case 2: mode = GL_LINES         ; break ;
        case 3: mode = GL_LINE_STRIP    ; break ;
        case 4: mode = GL_TRIANGLES     ; break ;
        case 5: mode = GL_TRIANGLE_STRIP; break ;
        case 6: mode = GL_TRIANGLE_FAN  ; break ;
        default: mode = GL_TRIANGLES    ; break ;
    }
    bool hasTex = false ;
    if ( Image && Image->Orig && Image->Orig->Hard.TexNum > 0 ) {
        IMAGEDATA_ORIG_HARD_TEX *tex = &Image->Orig->Hard.Tex[ 0 ] ;
        if ( tex->PF ) {
            glEnable( GL_TEXTURE_2D ) ;
            glBindTexture( GL_TEXTURE_2D, ( GLuint )tex->PF->Texture.TextureBuffer ) ;
            hasTex = true ;
        }
    }
    if ( TransFlag ) { glEnable( GL_BLEND ) ; glBlendFunc( GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA ) ; }

    glBegin( mode ) ;
    for ( int i = 0 ; i < VertexNum ; ++i ) {
        const VERTEX3D &v = Vertex[ i ] ;
        glColor4ub( v.dif.r, v.dif.g, v.dif.b, v.dif.a ) ;
        if ( hasTex ) glTexCoord2f( v.u, v.v ) ;
        glVertex3f( v.pos.x, v.pos.y, v.pos.z ) ;
    }
    glEnd() ;
    if ( hasTex ) { glBindTexture( GL_TEXTURE_2D, 0 ) ; glDisable( GL_TEXTURE_2D ) ; }
    return 0 ;
}

// --- Tier 4a: Light / Fog (fixed-function GL) -----------------------------

// DxLib の LIGHTTYPE → GL_LIGHT0..GL_LIGHT7 はそのまま index マップ (8 個まで)
static inline GLenum desktop_gl_light( int index ) { return GL_LIGHT0 + index ; }

extern int Graphics_Hardware_Light_SetUse_PF( int Flag )
{
    if ( Flag ) glEnable( GL_LIGHTING ) ; else glDisable( GL_LIGHTING ) ;
    return 0 ;
}

extern int Graphics_Hardware_Light_SetEnable_PF( int index, int Flag )
{
    if ( index < 0 || index >= 8 ) return -1 ;
    if ( Flag ) glEnable( desktop_gl_light( index ) ) ;
    else        glDisable( desktop_gl_light( index ) ) ;
    return 0 ;
}

// Toon gradation 用に directional light 0 の方向を保存 (光源の位置ベクトル、
// GL 規約: 点から光源へのベクトル = -Direction)
float g_MainLightDirX = 0.0f, g_MainLightDirY = -1.0f, g_MainLightDirZ = 0.0f ;

// ---- Shadow Map infrastructure (M2) --------------------------------------
//   SHADOWMAPDATA_PF { FrameBuffer, Texture, DepthBuffer } を確保し、
//   DrawSetup で shadow FBO にバインド、DrawEnd で元に戻す。
//   実際の projective shadow 適用 (TMU + GL_TEXTURE_COMPARE_MODE) は次段。

#include "DxGraphicsDesktop.h"  // SHADOWMAPDATA_PF の定義

// Shadow FBO 切替用の状態保存
static GLuint s_ShadowPrevFBO   = 0 ;
static int    s_ShadowPrevVP[4] = { 0 } ;
static int    s_ShadowActive    = 0 ;
static GLuint s_ShadowCurrTex   = 0 ;   // SetUse で bind 中のシャドウ depth tex
static int    s_ShadowCurrSlot  = -1 ;

extern int Graphics_Hardware_ShadowMap_CreateTexture_PF( SHADOWMAPDATA *sm, int /*ASyncThread*/ )
{
    if ( !sm || !sm->PF ) return -1 ;
    int w = sm->BaseSizeX, h = sm->BaseSizeY ;
    if ( w <= 0 || h <= 0 ) return -1 ;

    GLuint depth = 0 ;
    glGenTextures( 1, &depth ) ;
    glBindTexture( GL_TEXTURE_2D, depth ) ;
    glTexImage2D( GL_TEXTURE_2D, 0, GL_DEPTH_COMPONENT, w, h, 0,
                  GL_DEPTH_COMPONENT, GL_FLOAT, nullptr ) ;
    glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR ) ;
    glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR ) ;
    glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE ) ;
    glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE ) ;
    glBindTexture( GL_TEXTURE_2D, 0 ) ;

    GLuint fbo = 0 ;
    glGenFramebuffers( 1, &fbo ) ;
    glBindFramebuffer( GL_FRAMEBUFFER, fbo ) ;
    glFramebufferTexture2D( GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_TEXTURE_2D, depth, 0 ) ;
    // 色バッファは無し (depth only)
#ifdef GL_NONE
    glDrawBuffer( GL_NONE ) ;
    glReadBuffer( GL_NONE ) ;
#endif
    glBindFramebuffer( GL_FRAMEBUFFER, 0 ) ;

    sm->PF->FrameBuffer              = fbo ;
    sm->PF->Texture.TextureBuffer    = depth ;
    sm->PF->Texture.Width            = w ;
    sm->PF->Texture.Height           = h ;
    sm->PF->DepthBuffer              = 0 ;  // 別途の renderbuffer 無し (depth tex が兼ねる)
    return 0 ;
}

extern int Graphics_Hardware_ShadowMap_ReleaseTexture_PF( SHADOWMAPDATA *sm )
{
    if ( !sm || !sm->PF ) return -1 ;
    if ( sm->PF->FrameBuffer ) { GLuint f = ( GLuint )sm->PF->FrameBuffer ; glDeleteFramebuffers( 1, &f ) ; sm->PF->FrameBuffer = 0 ; }
    if ( sm->PF->Texture.TextureBuffer ) {
        GLuint t = ( GLuint )sm->PF->Texture.TextureBuffer ;
        glDeleteTextures( 1, &t ) ;
        sm->PF->Texture.TextureBuffer = 0 ;
    }
    return 0 ;
}

extern int Graphics_Hardware_ShadowMap_DrawSetup_PF( SHADOWMAPDATA *sm )
{
    if ( !sm || !sm->PF || !sm->PF->FrameBuffer ) return -1 ;
    GLint prev = 0 ;
    glGetIntegerv( GL_FRAMEBUFFER_BINDING, &prev ) ;
    s_ShadowPrevFBO = ( GLuint )prev ;
    glGetIntegerv( GL_VIEWPORT, s_ShadowPrevVP ) ;

    glBindFramebuffer( GL_FRAMEBUFFER, ( GLuint )sm->PF->FrameBuffer ) ;
    glViewport( 0, 0, sm->BaseSizeX, sm->BaseSizeY ) ;
    // depth only
    glColorMask( GL_FALSE, GL_FALSE, GL_FALSE, GL_FALSE ) ;
    glEnable ( GL_DEPTH_TEST ) ;
    glDepthFunc( GL_LEQUAL ) ;
    glDepthMask( GL_TRUE ) ;
    glClear( GL_DEPTH_BUFFER_BIT ) ;

    // ShadowMapViewMatrix / ProjectionMatrix は common 層で計算済
    glMatrixMode( GL_PROJECTION ) ;
    glLoadMatrixf( ( const float * )sm->ShadowMapProjectionMatrix.m ) ;
    glMatrixMode( GL_MODELVIEW ) ;
    glLoadMatrixf( ( const float * )sm->ShadowMapViewMatrix.m ) ;

    s_ShadowActive = 1 ;
    return 0 ;
}

extern int Graphics_Hardware_ShadowMap_DrawEnd_PF( SHADOWMAPDATA * /*sm*/ )
{
    if ( !s_ShadowActive ) return 0 ;
    glBindFramebuffer( GL_FRAMEBUFFER, s_ShadowPrevFBO ) ;
    glViewport( s_ShadowPrevVP[ 0 ], s_ShadowPrevVP[ 1 ], s_ShadowPrevVP[ 2 ], s_ShadowPrevVP[ 3 ] ) ;
    glColorMask( GL_TRUE, GL_TRUE, GL_TRUE, GL_TRUE ) ;
    s_ShadowActive = 0 ;
    return 0 ;
}

extern int Graphics_Hardware_ShadowMap_SetUse_PF( int SlotIndex, SHADOWMAPDATA *sm )
{
    // SlotIndex 0..2 の shadow texture を TMU 2+ にバインドする
    //   TMU 0 = diffuse, TMU 1 = multi-layer diffuse, TMU 2.. = shadow
    // 実際の projective sampling + compare は MV1 draw path 側で今後対応。
    // ここでは texture の bind のみ行い、グローバル状態として記録する。
    if ( !sm || !sm->PF || !sm->PF->Texture.TextureBuffer ) {
        s_ShadowCurrTex  = 0 ;
        s_ShadowCurrSlot = -1 ;
        return 0 ;
    }
    s_ShadowCurrTex  = ( GLuint )sm->PF->Texture.TextureBuffer ;
    s_ShadowCurrSlot = SlotIndex ;
    return 0 ;
}

extern int Graphics_Hardware_Light_SetState_PF( int index, LIGHTPARAM *p )
{
    if ( !p || index < 0 || index >= 8 ) return -1 ;
    GLenum lg = desktop_gl_light( index ) ;

    float dif[4] = { p->Diffuse.r,  p->Diffuse.g,  p->Diffuse.b,  p->Diffuse.a  } ;
    float spc[4] = { p->Specular.r, p->Specular.g, p->Specular.b, p->Specular.a } ;
    float amb[4] = { p->Ambient.r,  p->Ambient.g,  p->Ambient.b,  p->Ambient.a  } ;
    glLightfv( lg, GL_DIFFUSE,  dif ) ;
    glLightfv( lg, GL_SPECULAR, spc ) ;
    glLightfv( lg, GL_AMBIENT,  amb ) ;

    // Position / Direction: GL では light position の w 成分で種類分け
    //   w = 0: directional (Direction をそのまま方向として)
    //   w = 1: positional (Position が座標、attenuation 有効)
    if ( p->LightType == DX_LIGHTTYPE_D3DLIGHT_DIRECTIONAL ) {
        // GL は「光線の方向」ではなく「光源のある方向」を渡す必要あり (方向反転)
        float dir[4] = { -p->Direction.x, -p->Direction.y, -p->Direction.z, 0.0f } ;
        glLightfv( lg, GL_POSITION, dir ) ;
        // Toon: 主光源 (index 0) のみ保存
        if ( index == 0 ) {
            g_MainLightDirX = -p->Direction.x ;
            g_MainLightDirY = -p->Direction.y ;
            g_MainLightDirZ = -p->Direction.z ;
        }
    } else {
        float pos[4] = { p->Position.x, p->Position.y, p->Position.z, 1.0f } ;
        glLightfv( lg, GL_POSITION, pos ) ;
        glLightf( lg, GL_CONSTANT_ATTENUATION,  p->Attenuation0 ) ;
        glLightf( lg, GL_LINEAR_ATTENUATION,    p->Attenuation1 ) ;
        glLightf( lg, GL_QUADRATIC_ATTENUATION, p->Attenuation2 ) ;
    }
    // Spot
    if ( p->LightType == DX_LIGHTTYPE_D3DLIGHT_SPOT ) {
        float sdir[3] = { p->Direction.x, p->Direction.y, p->Direction.z } ;
        glLightfv( lg, GL_SPOT_DIRECTION, sdir ) ;
        // Phi (外側) で cutoff、Theta (内側) で spot_exponent
        glLightf( lg, GL_SPOT_CUTOFF,   p->Phi * 90.0f / 3.14159265f ) ;
        glLightf( lg, GL_SPOT_EXPONENT, p->Falloff > 0 ? p->Falloff : 1.0f ) ;
    } else {
        glLightf( lg, GL_SPOT_CUTOFF, 180.0f ) ;  // non-spot
    }
    return 0 ;
}

extern int Graphics_Hardware_Light_GlobalAmbient_PF( COLOR_F *c )
{
    if ( !c ) return -1 ;
    float amb[4] = { c->r, c->g, c->b, c->a } ;
    glLightModelfv( GL_LIGHT_MODEL_AMBIENT, amb ) ;
    return 0 ;
}

extern int Graphics_Hardware_Light_SetNoAngleAttenuation_PF( int Flag ) { (void)Flag; return 0 ; }
extern int Graphics_Hardware_Light_SetUseHalfLambert_PF   ( int Flag ) { (void)Flag; return 0 ; }
extern int Graphics_Hardware_ApplyLigFogToHardware_PF     ( void ) { return 0 ; }  // state は都度反映済

// --- Fog ---
extern int Graphics_Hardware_SetFogEnable_PF( int Flag )
{
    if ( Flag ) glEnable( GL_FOG ) ; else glDisable( GL_FOG ) ;
    return 0 ;
}

extern int Graphics_Hardware_SetFogMode_PF( int Mode )
{
    switch ( Mode ) {
        case DX_FOGMODE_LINEAR: glFogi( GL_FOG_MODE, GL_LINEAR ) ; break ;
        case DX_FOGMODE_EXP   : glFogi( GL_FOG_MODE, GL_EXP    ) ; break ;
        case DX_FOGMODE_EXP2  : glFogi( GL_FOG_MODE, GL_EXP2   ) ; break ;
        case DX_FOGMODE_NONE  : default: break ;  // NONE は SetFogEnable(FALSE) 側で
    }
    return 0 ;
}

extern int Graphics_Hardware_SetFogColor_PF( DWORD ColorARGB )
{
    // DxLib の Color は 0xAARRGGBB (unsigned int 格納)
    float r = ( ( ColorARGB >> 16 ) & 0xFF ) / 255.0f ;
    float g = ( ( ColorARGB >>  8 ) & 0xFF ) / 255.0f ;
    float b = ( ( ColorARGB       ) & 0xFF ) / 255.0f ;
    float a = ( ( ColorARGB >> 24 ) & 0xFF ) / 255.0f ;
    if ( a == 0.0f ) a = 1.0f ;
    float col[4] = { r, g, b, a } ;
    glFogfv( GL_FOG_COLOR, col ) ;
    return 0 ;
}

extern int Graphics_Hardware_SetFogStartEnd_PF( float Start, float End )
{
    glFogf( GL_FOG_START, Start ) ;
    glFogf( GL_FOG_END,   End ) ;
    return 0 ;
}

extern int Graphics_Hardware_SetFogDensity_PF( float Density )
{
    glFogf( GL_FOG_DENSITY, Density ) ;
    return 0 ;
}

// Z バッファ
extern int Graphics_Hardware_ClearDrawScreenZBuffer_PF( const RECT *ClearRect )
{
    (void)ClearRect;
    glClearDepth( 1.0 ) ;
    glClear( GL_DEPTH_BUFFER_BIT ) ;
    return 0 ;
}

extern int Graphics_Hardware_SetDrawZBuffer_PF( int Flag, IMAGEDATA *Image )
{
    (void)Image;
    if ( Flag ) glEnable( GL_DEPTH_TEST ) ; else glDisable( GL_DEPTH_TEST ) ;
    return 0 ;
}

extern int Graphics_Hardware_RenderVertex( int Param ) { (void)Param; return 0 ; }

// DxImageDesktop.cpp で提供 (stb_image による PNG/JPEG/BMP/GIF/TGA/PSD 読み込み)
extern int LoadStbImage( STREAMDATA *Src, BASEIMAGE *BaseImage, int GetFormatOnly ) ;

int ( *DefaultImageLoadFunc_PF[] )( STREAMDATA *, BASEIMAGE *, int ) = {
    LoadStbImage ,
    nullptr
} ;

#ifndef DX_NON_NAMESPACE
}
#endif

#endif // DX_NON_GRAPHICS
