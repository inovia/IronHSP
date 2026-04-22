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
#else
    // Stage 7 暫定: Windows では compat profile を指定して fixed-function も
    // 使えるようにする (glBegin/glEnd 可)。ES context は ANGLE 差し替え時に戻す。
    SDL_GL_SetAttribute( SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_COMPATIBILITY ) ;
    SDL_GL_SetAttribute( SDL_GL_CONTEXT_MAJOR_VERSION, 2 ) ;
    SDL_GL_SetAttribute( SDL_GL_CONTEXT_MINOR_VERSION, 1 ) ;
    SDL_GL_SetAttribute( SDL_GL_DOUBLEBUFFER, 1 ) ;
    SDL_GL_SetAttribute( SDL_GL_DEPTH_SIZE, 24 ) ;
#endif

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
    return 0 ;
}

extern int Graphics_Hardware_ReleaseOrigTexture_PF( IMAGEDATA_ORIG *Orig )
{
    if ( !Orig ) return -1 ;
    for ( int i = 0 ; i < Orig->Hard.TexNum ; ++i )
    {
        IMAGEDATA_ORIG_HARD_TEX *tex = &Orig->Hard.Tex[ i ] ;
        if ( tex->PF ) {
            GLuint id = ( GLuint )tex->PF->Texture.TextureBuffer ;
            if ( id ) glDeleteTextures( 1, &id ) ;
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
