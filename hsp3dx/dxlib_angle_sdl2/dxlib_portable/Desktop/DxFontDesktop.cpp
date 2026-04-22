//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2_ttf) 用 フォント 実装
//
//      SDL2_ttf でグリフをラスタライズし、DxLib の FontCache に転送する。
//      フォント名マッチは未対応 (Stage 19 では default system font を使用)。
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#include "../DxCompileConfig.h"

#ifndef DX_NON_FONT

#include "DxFontDesktop.h"
#include "../DxFont.h"
#include "../DxLib.h"

#include <SDL.h>
#include <SDL_ttf.h>

#include <cstdio>
#include <cstring>
#include <string>

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

static int s_TtfInited = 0 ;

// プラットフォーム別のデフォルトフォントパスを返す
static const char *default_font_path( void )
{
#if defined(_WIN32)
    return "C:/Windows/Fonts/YuGothR.ttc" ;   // Yu Gothic (Windows 10+ 標準)
#elif defined(__APPLE__)
    return "/System/Library/Fonts/ヒラギノ角ゴシック W3.ttc" ;  // Hiragino
#else
    return "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf" ;  // Linux/WSL 標準
#endif
}

// 代替候補を順番に試す (Windows で Yu Gothic が無い時の代替)
static const char * const *fallback_font_paths( void )
{
    static const char *paths[] = {
#if defined(_WIN32)
        "C:/Windows/Fonts/YuGothR.ttc",
        "C:/Windows/Fonts/meiryo.ttc",
        "C:/Windows/Fonts/msgothic.ttc",
        "C:/Windows/Fonts/arial.ttf",
#elif defined(__APPLE__)
        "/System/Library/Fonts/Hiragino Sans GB.ttc",
        "/System/Library/Fonts/ヒラギノ角ゴシック W3.ttc",
        "/System/Library/Fonts/Helvetica.ttc",
        "/Library/Fonts/Arial.ttf",
#else
        "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf",
        "/usr/share/fonts/truetype/noto/NotoSansCJK-Regular.ttc",
        "/usr/share/fonts/opentype/noto/NotoSansCJK-Regular.ttc",
        "/usr/share/fonts/truetype/liberation/LiberationSans-Regular.ttf",
#endif
        nullptr
    } ;
    return paths ;
}

static inline TTF_Font *as_ttf( void *p ) { return ( TTF_Font * )p ; }

// --- 初期化・終了 -------------------------------------------------------

extern int InitFontManage_PF( void )
{
    if ( !s_TtfInited )
    {
        if ( TTF_Init() != 0 ) {
            std::fprintf( stderr, "[DxLib Desktop] TTF_Init failed: %s\n", TTF_GetError() ) ;
            return -1 ;
        }
        s_TtfInited = 1 ;
    }
    return 0 ;
}

extern int TermFontManage_PF( void )
{
    if ( s_TtfInited ) {
        TTF_Quit() ;
        s_TtfInited = 0 ;
    }
    return 0 ;
}

// --- フォントハンドル作成・破棄 -----------------------------------------

extern int CreateFontToHandle_PF( CREATEFONTTOHANDLE_GPARAM *GParam, FONTMANAGE *ManageData, int DefaultCharSet )
{
    (void)GParam; (void)DefaultCharSet;
    std::fprintf( stderr, "[DxFontDesktop] CreateFontToHandle_PF called (FontSize=%d)\n", ManageData->BaseInfo.FontSize ) ;
    if ( ManageData->UseFontDataFile ) return 0 ;  // DxFont データファイル使用時は何もしない
    if ( !s_TtfInited ) InitFontManage_PF() ;

    int pt = ManageData->BaseInfo.FontSize ;
    if ( pt <= 0 ) pt = 16 ;

    // フォントファイルを順に試す (フォント名マッチは暫定 TODO)
    TTF_Font *font = nullptr ;
    const char * const *paths = fallback_font_paths() ;
    for ( int i = 0 ; paths[i] ; ++i ) {
        font = TTF_OpenFont( paths[i], pt ) ;
        if ( font ) { std::fprintf( stderr, "[DxFontDesktop] opened %s @ %dpt\n", paths[i], pt ) ; break ; }
    }
    if ( !font ) {
        std::fprintf( stderr, "[DxLib Desktop] CreateFontToHandle_PF: no font found (pt=%d)\n", pt ) ;
        return -1 ;
    }

    ManageData->PF->FontData = font ;

    // メトリクスを DxLib に伝える
    int ascent  = TTF_FontAscent ( font ) ;
    int descent = TTF_FontDescent( font ) ;
    int lineskip = TTF_FontLineSkip( font ) ;
    int height   = TTF_FontHeight( font ) ;

    ManageData->BaseInfo.FontHeight    = height ;
    ManageData->BaseInfo.FontAddHeight = 0 ;
    ManageData->BaseInfo.MaxWidth      = height ;  // 粗く日本語対応
    ManageData->BaseInfo.Ascent        = ascent ;

    (void)descent; (void)lineskip;
    return 0 ;
}

extern int CreateFontToHandle_Error_PF( FONTMANAGE *ManageData )
{
    if ( ManageData->PF->FontData ) {
        TTF_CloseFont( as_ttf( ManageData->PF->FontData ) ) ;
        ManageData->PF->FontData = nullptr ;
    }
    return 0 ;
}

extern int TerminateFontHandle_PF( FONTMANAGE *ManageData )
{
    if ( ManageData->PF->FontData ) {
        TTF_CloseFont( as_ttf( ManageData->PF->FontData ) ) ;
        ManageData->PF->FontData = nullptr ;
    }
    return 0 ;
}

extern int SetupFontCache_PF( CREATEFONTTOHANDLE_GPARAM *, FONTMANAGE *, int ) { return 0 ; }

// --- グリフ追加 (本体) --------------------------------------------------

extern int FontCacheCharAddToHandle_Timing0_PF( FONTMANAGE *m )
{
    static int c = 0 ; c++ ; if ( c <= 3 ) std::fprintf( stderr, "[DxFontDesktop] Timing0 #%d TCFlag=%d\n", c, ( int )m->TextureCacheFlag ) ;
    return 0 ;
}
extern int FontCacheCharAddToHandle_Timing2_PF( FONTMANAGE *m )
{
    static int c = 0 ; c++ ; if ( c <= 3 ) std::fprintf( stderr, "[DxFontDesktop] Timing2 #%d\n", c ) ;
    return 0 ;
}

extern int FontCacheCharAddToHandle_Timing1_PF( FONTMANAGE *ManageData, FONTCHARDATA *CharData, DWORD CharCode, DWORD IVSCode, int TextureCacheUpdate )
{
    static int call_count = 0 ;
    call_count++ ;
    if ( call_count <= 5 ) std::fprintf( stderr, "[DxFontDesktop] CacheChar call#%d code=U+%04X\n", call_count, CharCode ) ;
    TTF_Font *font = as_ttf( ManageData->PF->FontData ) ;
    if ( !font ) { std::fprintf( stderr, "[DxFontDesktop] CacheChar: FontData NULL\n" ) ; return -1 ; }

    // スペース判定
    int Space = 0 ;
    if ( CharCode == L' ' ) Space = 1 ;
    else if ( CharCode == ( DWORD )FSYS.DoubleByteSpaceCharCode ) Space = 2 ;

    if ( Space != 0 ) {
        FontCacheCharImageBltToHandle(
            ManageData, CharData, CharCode, IVSCode, TRUE,
            DX_FONT_SRCIMAGETYPE_8BIT_MAX255,
            nullptr, 0, 0, 0, 0, 0,
            Space * ManageData->BaseInfo.FontSize / 2,
            FALSE ) ;
        return 0 ;
    }

    // グリフを Shaded で RGBA 描画 (Blended が使えない古い環境保険)
    // Uint16 に CharCode を入れて TTF_RenderUNICODE を使ってもいいが、
    // UTF-32 code points 向けに TTF_RenderGlyph32 系を使う
    SDL_Color white = { 255, 255, 255, 255 } ;
    SDL_Color black = {   0,   0,   0,   0 } ;
    SDL_Surface *surf = TTF_RenderGlyph32_Shaded( font, CharCode, white, black ) ;
    if ( !surf ) {
        // 非対応グリフ: 空でキャッシュだけ進める
        FontCacheCharImageBltToHandle(
            ManageData, CharData, CharCode, IVSCode, TRUE,
            DX_FONT_SRCIMAGETYPE_8BIT_MAX255,
            nullptr, 0, 0, 0, 0, 0,
            ManageData->BaseInfo.FontSize / 2, FALSE ) ;
        return 0 ;
    }

    // Shaded の surface は 8bit palette (INDEX8), value は 0..255 (白背景に対する濃度)
    // DxLib の DX_FONT_SRCIMAGETYPE_8BIT_MAX255 と直接一致するので、そのまま転送
    int w = surf->w ;
    int h = surf->h ;
    int pitch = surf->pitch ;
    Uint8 *pixels = ( Uint8 * )surf->pixels ;

    // advance (次の文字への相対 x)
    int minx = 0, maxx = 0, miny = 0, maxy = 0, advance = 0 ;
    TTF_GlyphMetrics32( font, CharCode, &minx, &maxx, &miny, &maxy, &advance ) ;

    // DxLib は DrawX/DrawY で文字を表示すべき offset を指定する
    int DrawX = minx ;
    int DrawY = ( TTF_FontAscent( font ) - maxy ) ;

    FontCacheCharImageBltToHandle(
        ManageData, CharData, CharCode, IVSCode, FALSE,
        DX_FONT_SRCIMAGETYPE_8BIT_MAX255,
        pixels, w, h, pitch,
        DrawX, DrawY, advance,
        TextureCacheUpdate ) ;

    SDL_FreeSurface( surf ) ;
    return 0 ;
}

// --- EnumFontName は stub --------------------------------------------------

extern int EnumFontName_PF( ENUMFONTDATA *EnumFontData, int IsEx, int CharSet )
{
    (void)EnumFontData; (void)IsEx; (void)CharSet;
    return 0 ;
}

#ifndef DX_NON_NAMESPACE
} // end namespace DxLib
#endif

// Windows で windows.h を先に include させる (GL type 衝突対策)
#ifdef _WIN32
#include <windows.h>
#endif
#include <SDL_opengl.h>

// --- バイパス: SDL_ttf 直接で画面に文字を描く helper --------------------
//
// DxLib の DrawString -> DrawStringHardware -> TextureCacheFlag=FALSE で
// 黙って無描画になる問題を回避するため、別名関数 DxDesktop_DrawText を
// hsp3dx 側から直接呼べるようにする。
// TrueType フォントを SDL_ttf で直接ラスタライズ → 毎フレーム一時テクスチャに
// アップ → DrawGraph 経由で描画する単純な実装 (キャッシュなし)。

extern "C" int DxDesktop_DrawText( int x, int y, const char *utf8_text,
                                    unsigned char r, unsigned char g, unsigned char b,
                                    int font_pt )
{
    if ( !utf8_text || !*utf8_text ) return 0 ;
    if ( !s_TtfInited ) { if ( TTF_Init() != 0 ) return -1 ; s_TtfInited = 1 ; }
    if ( font_pt <= 0 ) font_pt = 16 ;

    static TTF_Font *cached = nullptr ;
    static int       cached_pt = 0 ;
    if ( !cached || cached_pt != font_pt ) {
        if ( cached ) TTF_CloseFont( cached ) ;
        cached = nullptr ;
        const char * const *paths ;
    #if defined(_WIN32)
        static const char *win_paths[] = {
            "C:/Windows/Fonts/YuGothR.ttc",
            "C:/Windows/Fonts/meiryo.ttc",
            "C:/Windows/Fonts/msgothic.ttc",
            nullptr } ;
        paths = win_paths ;
    #elif defined(__APPLE__)
        static const char *mac_paths[] = {
            "/System/Library/Fonts/ヒラギノ角ゴシック W3.ttc",
            "/System/Library/Fonts/Hiragino Sans GB.ttc",
            "/System/Library/Fonts/Helvetica.ttc",
            nullptr } ;
        paths = mac_paths ;
    #else
        static const char *linux_paths[] = {
            "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf",
            "/usr/share/fonts/truetype/noto/NotoSansCJK-Regular.ttc",
            nullptr } ;
        paths = linux_paths ;
    #endif
        for ( int i = 0 ; paths[i] ; ++i ) {
            cached = TTF_OpenFont( paths[i], font_pt ) ;
            if ( cached ) break ;
        }
        cached_pt = font_pt ;
    }
    if ( !cached ) return -1 ;

    SDL_Color color = { r, g, b, 255 } ;
    SDL_Surface *surf = TTF_RenderUTF8_Blended( cached, utf8_text, color ) ;
    if ( !surf ) return -1 ;

    // GL texture 化 → screen 座標に描画
    // 下のコードは名前空間 DxLib のブロック外 (グローバル) にあるが、
    // SDL/GL の関数は名前空間関係なく使える。DxLib の Desktop_SetOrtho2D は
    // DxLib namespace 内の static 関数なので直接呼べない。
    // → 最低限の OpenGL 直接呼びで代用。
    GLuint tex = 0 ;
    glGenTextures( 1, &tex ) ;
    glBindTexture( GL_TEXTURE_2D, tex ) ;

    // surf->format->BytesPerPixel は 4 (RGBA) のはず
    // SDL_Surface のフォーマットは ARGB8888 or BGRA — 環境依存。
    // GL_BGRA でアップすれば Windows SDL2 + little-endian で一致する。
    GLenum gl_fmt = GL_BGRA ;
    glPixelStorei( GL_UNPACK_ROW_LENGTH, surf->pitch / surf->format->BytesPerPixel ) ;
    glTexImage2D( GL_TEXTURE_2D, 0, GL_RGBA, surf->w, surf->h, 0, gl_fmt, GL_UNSIGNED_BYTE, surf->pixels ) ;
    glPixelStorei( GL_UNPACK_ROW_LENGTH, 0 ) ;
    glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR ) ;
    glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR ) ;

    // ortho 2D (viewport size は GSYS.Screen 経由で取れない from extern "C" なので
    // viewport 現行値を取る)
    GLint vp[ 4 ] ;
    glGetIntegerv( GL_VIEWPORT, vp ) ;
    glMatrixMode( GL_PROJECTION ) ;
    glLoadIdentity() ;
    glOrtho( 0, vp[2], vp[3], 0, -1, 1 ) ;
    glMatrixMode( GL_MODELVIEW ) ;
    glLoadIdentity() ;
    glDisable( GL_DEPTH_TEST ) ;

    glEnable( GL_BLEND ) ;
    glBlendFunc( GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA ) ;
    glColor4ub( 255, 255, 255, 255 ) ;
    glEnable( GL_TEXTURE_2D ) ;

    float fw = ( float )surf->w, fh = ( float )surf->h ;
    glBegin( GL_TRIANGLE_STRIP ) ;
        glTexCoord2f( 0, 0 ) ; glVertex2f( ( float )x,       ( float )y       ) ;
        glTexCoord2f( 1, 0 ) ; glVertex2f( ( float )x + fw,  ( float )y       ) ;
        glTexCoord2f( 0, 1 ) ; glVertex2f( ( float )x,       ( float )y + fh  ) ;
        glTexCoord2f( 1, 1 ) ; glVertex2f( ( float )x + fw,  ( float )y + fh  ) ;
    glEnd() ;

    glBindTexture( GL_TEXTURE_2D, 0 ) ;
    glDisable( GL_TEXTURE_2D ) ;
    glDeleteTextures( 1, &tex ) ;

    SDL_FreeSurface( surf ) ;
    return 0 ;
}

#endif // DX_NON_FONT
