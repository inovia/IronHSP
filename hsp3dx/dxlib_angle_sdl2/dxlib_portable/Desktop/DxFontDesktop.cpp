//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2_ttf) 用 フォント 実装
//
//      SDL2_ttf でグリフをラスタライズし、DxLib の FontCache に転送する。
//      フォント名マッチは未対応 (Stage 19 では default system font を使用)。
//
//-----------------------------------------------------------------------------

#define DX_MAKE

// Windows SDK (windows.h) を先に include して BYTE/WORD 等を確定させる。
// DxDataTypeDesktop.h でも同じことをしているので二重 include は OK。
#ifdef _WIN32
#include <windows.h>
#endif

#include "../DxCompileConfig.h"

#ifndef DX_NON_FONT

#include "DxFontDesktop.h"
#include "../DxFont.h"
#include "../DxLib.h"

#include <SDL.h>
#include <SDL_ttf.h>
#include <SDL_opengl.h>

#include <cstdio>
#include <cstring>
#include <string>
#include <vector>
#include <string>
#include <cmath>

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
#elif ( defined(__APPLE__) || defined(__linux__) )
    return "/System/Library/Fonts/ヒラギノ角ゴシック W3.ttc" ;  // Hiragino
#else
    return "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf" ;  // Linux/WSL 標準
#endif
}

// 代替候補を順番に試す (Windows で Yu Gothic が無い時の代替)
static const char * const *fallback_font_paths( void )
{
    static const char *paths[] = {
#if defined(__EMSCRIPTEN__)
        "/MSGOTHIC.TTC",  // wasm virtual fs に preload-file で bundle 済
#elif defined(_WIN32)
        "C:/Windows/Fonts/YuGothR.ttc",
        "C:/Windows/Fonts/meiryo.ttc",
        "C:/Windows/Fonts/msgothic.ttc",
        "C:/Windows/Fonts/arial.ttf",
#elif ( defined(__APPLE__) || defined(__linux__) )
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

// User-added font paths (Desktop_AddFontPath で登録、CreateFontToHandle 検索の
// 一番先頭に試される)
static std::vector<std::string> g_UserFontPaths ;

extern "C" int Desktop_AddFontPath( const char *path )
{
    if ( !path || !*path ) return -1 ;
    g_UserFontPaths.push_back( path ) ;
    return 0 ;
}

extern "C" int Desktop_ClearFontPaths( void )
{
    g_UserFontPaths.clear() ;
    return 0 ;
}

extern int CreateFontToHandle_PF( CREATEFONTTOHANDLE_GPARAM *GParam, FONTMANAGE *ManageData, int DefaultCharSet )
{
    (void)GParam; (void)DefaultCharSet;
    if ( ManageData->UseFontDataFile ) return 0 ;  // DxFont データファイル使用時は何もしない
    if ( !s_TtfInited ) InitFontManage_PF() ;

    int pt = ManageData->BaseInfo.FontSize ;
    if ( pt <= 0 ) pt = 16 ;

    TTF_Font *font = nullptr ;

    // (1) ManageData.FontName が直接 .ttf/.ttc/.otf パスなら最優先
    const wchar_t *wname = ManageData->FontName ;
    if ( wname && wname[ 0 ] ) {
        // wchar_t → UTF-8
        std::string name_utf8 ;
        for ( int i = 0 ; wname[ i ] && i < 256 ; i++ ) {
            wchar_t w = wname[ i ] ;
            if ( w < 0x80 ) name_utf8.push_back( ( char )w ) ;
            else if ( w < 0x800 ) {
                name_utf8.push_back( ( char )( 0xC0 | ( w >> 6 ) ) ) ;
                name_utf8.push_back( ( char )( 0x80 | ( w & 0x3f ) ) ) ;
            } else {
                name_utf8.push_back( ( char )( 0xE0 | ( w >> 12 ) ) ) ;
                name_utf8.push_back( ( char )( 0x80 | ( ( w >> 6 ) & 0x3f ) ) ) ;
                name_utf8.push_back( ( char )( 0x80 | ( w & 0x3f ) ) ) ;
            }
        }
        // 拡張子で判定 — .ttf/.ttc/.otf/.fon/.pfb 等
        size_t n = name_utf8.size() ;
        bool looks_like_path = false ;
        const char *exts[] = { ".ttf", ".ttc", ".otf", ".TTF", ".TTC", ".OTF", nullptr } ;
        for ( int j = 0 ; exts[ j ] && !looks_like_path ; j++ ) {
            size_t el = std::strlen( exts[ j ] ) ;
            if ( n >= el && std::strcmp( name_utf8.c_str() + n - el, exts[ j ] ) == 0 )
                looks_like_path = true ;
        }
        if ( looks_like_path ) {
            font = TTF_OpenFont( name_utf8.c_str(), pt ) ;
        }
    }

    // (2) User-added paths を最優先に試す (Desktop_AddFontPath で登録)
    if ( !font ) {
        for ( const auto &p : g_UserFontPaths ) {
            font = TTF_OpenFont( p.c_str(), pt ) ;
            if ( font ) break ;
        }
    }

    // (3) Fallback の system 標準パス
    if ( !font ) {
        const char * const *paths = fallback_font_paths() ;
        for ( int i = 0 ; paths[i] ; ++i ) {
            font = TTF_OpenFont( paths[i], pt ) ;
            if ( font ) break ;
        }
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

extern int FontCacheCharAddToHandle_Timing0_PF( FONTMANAGE *m ) { (void)m; return 0 ; }
extern int FontCacheCharAddToHandle_Timing2_PF( FONTMANAGE *m ) { (void)m; return 0 ; }

extern int FontCacheCharAddToHandle_Timing1_PF( FONTMANAGE *ManageData, FONTCHARDATA *CharData, DWORD CharCode, DWORD IVSCode, int TextureCacheUpdate )
{
    // Desktop では Desktop_DrawString_Hook が DrawString の前に実行され、
    // SDL_ttf で直接描画するので FontCache は使われない。本関数が呼ばれる
    // のは Software fallback パスだけだが、それも Hook が吸収する。
    TTF_Font *font = as_ttf( ManageData->PF->FontData ) ;
    if ( !font ) return -1 ;

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

// --- EnumFontName: Win32 EnumFontFamiliesEx 経由 (Win のみ実装、他 platform は no-op) ---
// EnumFontData->FontBuffer に wchar_t (LF_FACESIZE=32 区切り) を埋めて FontNum を返す
// IsEx == TRUE で extra info も格納するが、現状は名前のみ収集

#ifdef _WIN32
struct EnumFontCtx {
    wchar_t *out_buf ;     // FontBuffer (LF_FACESIZE 単位で並ぶ)
    int      buf_capacity ;// BufferNum (face 数の上限)
    int      count ;
} ;
static int CALLBACK desktop_font_enum_proc( const LOGFONTW *lf,
                                             const TEXTMETRICW * /*tm*/,
                                             DWORD /*FontType*/,
                                             LPARAM lParam )
{
    EnumFontCtx *ctx = ( EnumFontCtx * )lParam ;
    if ( !ctx || !ctx->out_buf ) return 0 ;
    if ( ctx->count >= ctx->buf_capacity ) return 0 ;   // stop
    // フェイス名の重複除外 (DxLib 本家準拠の簡易チェック)
    for ( int i = 0 ; i < ctx->count ; i++ ) {
        const wchar_t *prev = ctx->out_buf + ( size_t )i * LF_FACESIZE ;
        if ( wcsncmp( prev, lf->lfFaceName, LF_FACESIZE ) == 0 ) return 1 ;
    }
    wchar_t *dst = ctx->out_buf + ( size_t )ctx->count * LF_FACESIZE ;
    wcsncpy( dst, lf->lfFaceName, LF_FACESIZE - 1 ) ;
    dst[ LF_FACESIZE - 1 ] = L'\0' ;
    ctx->count++ ;
    return 1 ;   // continue
}
#endif

extern int EnumFontName_PF( ENUMFONTDATA *EnumFontData, int IsEx, int CharSet )
{
    (void)IsEx;
    if ( !EnumFontData || !EnumFontData->FontBuffer || EnumFontData->BufferNum <= 0 ) {
        return 0 ;
    }
#ifdef _WIN32
    EnumFontCtx ctx ;
    ctx.out_buf      = EnumFontData->FontBuffer ;
    ctx.buf_capacity = EnumFontData->BufferNum ;
    ctx.count        = 0 ;

    HDC hdc = GetDC( NULL ) ;
    if ( !hdc ) { EnumFontData->FontNum = 0 ; return 0 ; }

    LOGFONTW lf ;
    std::memset( &lf, 0, sizeof( lf ) ) ;
    lf.lfCharSet = ( CharSet >= 0 ) ? ( BYTE )CharSet : DEFAULT_CHARSET ;
    if ( EnumFontData->EnumFontName ) {
        wcsncpy( lf.lfFaceName, EnumFontData->EnumFontName, LF_FACESIZE - 1 ) ;
    }

    EnumFontFamiliesExW( hdc, &lf,
                         ( FONTENUMPROCW )desktop_font_enum_proc,
                         ( LPARAM )&ctx,
                         0 ) ;
    ReleaseDC( NULL, hdc ) ;
    EnumFontData->FontNum = ctx.count ;
    return ctx.count ;
#else
    // 非 Win platform は fontconfig 等が必要だが現状未対応 (stub)
    EnumFontData->FontNum = 0 ;
    return 0 ;
#endif
}

// --- Desktop_DrawString_Hook ------------------------------------------------
// DxFont.cpp の DrawStringHardware / DrawStringSoftware からフォックされる。
// Font->PF->FontData の TTF_Font* を使って SDL_ttf で直接描画。
// 戻り値 >= 0 ならそこで処理完了 (DxFont の後続ロジックは実行しない)。

// wchar_t* (size は Win=2/Mac/Linux=4) を UTF-8 std::string に変換
static std::string desktop_wchar_to_utf8( const wchar_t *ws, size_t len )
{
    std::string out ;
    if ( !ws || len == 0 ) return out ;
    out.reserve( len * 3 ) ;
    for ( size_t i = 0 ; i < len ; ++i )
    {
        unsigned int cp = ( unsigned int )ws[ i ] ;
        // UTF-16 サロゲート処理 (Windows wchar_t=2)
        if ( sizeof( wchar_t ) == 2 && cp >= 0xD800 && cp <= 0xDBFF && i + 1 < len )
        {
            unsigned int lo = ( unsigned int )ws[ i + 1 ] ;
            if ( lo >= 0xDC00 && lo <= 0xDFFF ) {
                cp = 0x10000 + ( ( cp - 0xD800 ) << 10 ) + ( lo - 0xDC00 ) ;
                ++i ;
            }
        }
        if ( cp < 0x80 ) {
            out.push_back( ( char )cp ) ;
        } else if ( cp < 0x800 ) {
            out.push_back( ( char )( 0xC0 | ( cp >> 6 ) ) ) ;
            out.push_back( ( char )( 0x80 | ( cp & 0x3F ) ) ) ;
        } else if ( cp < 0x10000 ) {
            out.push_back( ( char )( 0xE0 | ( cp >> 12 ) ) ) ;
            out.push_back( ( char )( 0x80 | ( ( cp >> 6 ) & 0x3F ) ) ) ;
            out.push_back( ( char )( 0x80 | ( cp & 0x3F ) ) ) ;
        } else if ( cp < 0x110000 ) {
            out.push_back( ( char )( 0xF0 | ( cp >> 18 ) ) ) ;
            out.push_back( ( char )( 0x80 | ( ( cp >> 12 ) & 0x3F ) ) ) ;
            out.push_back( ( char )( 0x80 | ( ( cp >> 6 ) & 0x3F ) ) ) ;
            out.push_back( ( char )( 0x80 | ( cp & 0x3F ) ) ) ;
        }
    }
    return out ;
}

// 現在の GL viewport サイズに対して 2D ortho を組む
// FBO (GL_FRAMEBUFFER_BINDING != 0) の場合は Y 反転しない (DxGraphicsDesktop の
// Desktop_SetOrtho2D と同じ方針 — テクスチャメモリ row 0 を DxLib y=0 に合わせる)
static void desktop_font_set_ortho2d( void )
{
    GLint vp[ 4 ] ;
    glGetIntegerv( GL_VIEWPORT, vp ) ;
    GLint fbo = 0 ;
    glGetIntegerv( 0x8CA6 /*GL_FRAMEBUFFER_BINDING*/, &fbo ) ;
    glMatrixMode( GL_PROJECTION ) ;
    glLoadIdentity() ;
    if ( fbo != 0 ) {
        glOrtho( 0.0, ( double )vp[ 2 ], 0.0, ( double )vp[ 3 ], -1.0, 1.0 ) ;
    } else {
        glOrtho( 0.0, ( double )vp[ 2 ], ( double )vp[ 3 ], 0.0, -1.0, 1.0 ) ;
    }
    glMatrixMode( GL_MODELVIEW ) ;
    glLoadIdentity() ;
    glDisable( GL_DEPTH_TEST ) ;
}

#if ( defined(__APPLE__) || defined(__linux__) )
// Apple Core Profile は fixed-function なし。 shader-based で描画。
extern "C" int DesktopShader_CompileGLSL( const char *vs_src, const char *fs_src ) ;
extern "C" int DesktopShader_Use( int handle ) ;
extern "C" int DesktopShader_SetUniform1f( int h, const char *name, float v ) ;
extern "C" int DesktopShader_SetUniform2f( int h, const char *name, float a, float b ) ;
extern "C" int DesktopShader_SetUniform4f( int h, const char *name, float a, float b, float c, float d ) ;
extern "C" int DesktopShader_SetUniform1i( int h, const char *name, int v ) ;

static int    s_font_shader_h = 0 ;
static GLuint s_font_vbo      = 0 ;
static GLuint s_font_vao      = 0 ;

static void desktop_font_init_shader( void )
{
    if ( s_font_shader_h ) return ;
    const char *vs =
        "attribute vec2 a_pos;\n"
        "attribute vec2 a_uv;\n"
        "uniform vec2 u_screen;\n"
        "uniform float u_yflip;\n"
        "varying vec2 v_uv;\n"
        "void main() {\n"
        "    vec2 ndc = a_pos / u_screen * 2.0 - 1.0;\n"
        "    ndc.y *= u_yflip;\n"
        "    gl_Position = vec4(ndc, 0.0, 1.0);\n"
        "    v_uv = a_uv;\n"
        "}\n" ;
    const char *fs =
        "uniform sampler2D u_tex;\n"
        "uniform vec4 u_color;\n"
        "varying vec2 v_uv;\n"
        "void main() { gl_FragColor = texture2D(u_tex, v_uv) * u_color; }\n" ;
    s_font_shader_h = DesktopShader_CompileGLSL( vs, fs ) ;
    typedef void (APIENTRY *PFN_glGenBuffers)(GLsizei, GLuint*) ;
    typedef void (APIENTRY *PFN_glGenVertexArrays)(GLsizei, GLuint*) ;
    static PFN_glGenBuffers      pGB  = (PFN_glGenBuffers)     SDL_GL_GetProcAddress( "glGenBuffers" ) ;
    static PFN_glGenVertexArrays pGVA = (PFN_glGenVertexArrays)SDL_GL_GetProcAddress( "glGenVertexArrays" ) ;
    if ( pGB ) pGB( 1, &s_font_vbo ) ;
    if ( pGVA ) pGVA( 1, &s_font_vao ) ;
}
#endif

// SDL_Surface を一時 GL texture にして、指定四角形へ描画する (color は multiply)
static void desktop_font_draw_surface( SDL_Surface *surf,
                                       float cx[ 4 ], float cy[ 4 ],
                                       unsigned char R, unsigned char G, unsigned char B )
{
    if ( !surf ) return ;
    GLuint tex = 0 ;
    glGenTextures( 1, &tex ) ;
    glBindTexture( GL_TEXTURE_2D, tex ) ;

#ifdef __EMSCRIPTEN__
    //  WebGL 1 は GL_UNPACK_ROW_LENGTH も GL_BGRA も非対応。
    //  SDL_ConvertSurfaceFormat で RGBA32 へ変換してから tightly-packed で upload。
    SDL_Surface *rgba = SDL_ConvertSurfaceFormat( surf, SDL_PIXELFORMAT_RGBA32, 0 ) ;
    if ( !rgba ) {
        glDeleteTextures( 1, &tex ) ;
        return ;
    }
    glPixelStorei( GL_UNPACK_ALIGNMENT, 1 ) ;
    glTexImage2D( GL_TEXTURE_2D, 0, GL_RGBA, rgba->w, rgba->h, 0,
                  GL_RGBA, GL_UNSIGNED_BYTE, rgba->pixels ) ;
    SDL_FreeSurface( rgba ) ;
#elif ( defined(__APPLE__) || defined(__linux__) )
    //  Apple Core Profile も GL_BGRA + GL_UNSIGNED_BYTE は valid (GL 1.2+)、 GL_UNPACK_ROW_LENGTH は GL 1.4+ で OK。
    glPixelStorei( GL_UNPACK_ALIGNMENT, 1 ) ;
    glPixelStorei( GL_UNPACK_ROW_LENGTH, surf->pitch / surf->format->BytesPerPixel ) ;
    glTexImage2D( GL_TEXTURE_2D, 0, GL_RGBA, surf->w, surf->h, 0,
                  GL_BGRA, GL_UNSIGNED_BYTE, surf->pixels ) ;
    glPixelStorei( GL_UNPACK_ROW_LENGTH, 0 ) ;
#else
    // SDL_ttf の Blended surface は 32bit RGBA だが、ネイティブ endianness に依存。
    // SDL2 の masks を見て RGBA/BGRA を判別するのが確実だが、little-endian + SDL2 の
    // TTF_RenderUTF8_Blended は ARGB (BGRA in memory) で返す。GL_BGRA でアップ。
    glPixelStorei( GL_UNPACK_ALIGNMENT, 1 ) ;
    glPixelStorei( GL_UNPACK_ROW_LENGTH, surf->pitch / surf->format->BytesPerPixel ) ;
    glTexImage2D( GL_TEXTURE_2D, 0, GL_RGBA, surf->w, surf->h, 0,
                  GL_BGRA, GL_UNSIGNED_BYTE, surf->pixels ) ;
    glPixelStorei( GL_UNPACK_ROW_LENGTH, 0 ) ;
#endif
    glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR ) ;
    glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR ) ;
    glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE ) ;
    glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE ) ;

#if ( defined(__APPLE__) || defined(__linux__) )
    // shader-based path
    desktop_font_init_shader() ;
    if ( s_font_shader_h <= 0 ) {
        glBindTexture( GL_TEXTURE_2D, 0 ) ;
        glDeleteTextures( 1, &tex ) ;
        return ;
    }
    GLint vp[ 4 ] ; glGetIntegerv( GL_VIEWPORT, vp ) ;
    GLint fbo = 0 ; glGetIntegerv( 0x8CA6 /*GL_FRAMEBUFFER_BINDING*/, &fbo ) ;
    glDisable( GL_DEPTH_TEST ) ;
    glEnable( GL_BLEND ) ;
    glBlendFunc( GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA ) ;
    DesktopShader_Use( s_font_shader_h ) ;
    DesktopShader_SetUniform2f( s_font_shader_h, "u_screen", ( float )vp[ 2 ], ( float )vp[ 3 ] ) ;
    DesktopShader_SetUniform1f( s_font_shader_h, "u_yflip", ( fbo != 0 ) ? 1.0f : -1.0f ) ;
    DesktopShader_SetUniform4f( s_font_shader_h, "u_color", R / 255.0f, G / 255.0f, B / 255.0f, 1.0f ) ;
    DesktopShader_SetUniform1i( s_font_shader_h, "u_tex", 0 ) ;

    typedef void (APIENTRY *PFN_glBindVAO)(GLuint) ;
    typedef void (APIENTRY *PFN_glBindBuffer)(GLenum, GLuint) ;
    typedef void (APIENTRY *PFN_glBufferData)(GLenum, GLsizeiptr, const void*, GLenum) ;
    typedef void (APIENTRY *PFN_glEnableVAA)(GLuint) ;
    typedef void (APIENTRY *PFN_glDisableVAA)(GLuint) ;
    typedef void (APIENTRY *PFN_glVAttribPtr)(GLuint, GLint, GLenum, GLboolean, GLsizei, const void*) ;
    typedef GLint (APIENTRY *PFN_glGetAttribLoc)(GLuint, const char*) ;
    static PFN_glBindVAO   pBVA = (PFN_glBindVAO)  SDL_GL_GetProcAddress( "glBindVertexArray" ) ;
    static PFN_glBindBuffer pBB = (PFN_glBindBuffer)SDL_GL_GetProcAddress( "glBindBuffer" ) ;
    static PFN_glBufferData pBD = (PFN_glBufferData)SDL_GL_GetProcAddress( "glBufferData" ) ;
    static PFN_glEnableVAA  pEV = (PFN_glEnableVAA) SDL_GL_GetProcAddress( "glEnableVertexAttribArray" ) ;
    static PFN_glDisableVAA pDV = (PFN_glDisableVAA)SDL_GL_GetProcAddress( "glDisableVertexAttribArray" ) ;
    static PFN_glVAttribPtr pVP = (PFN_glVAttribPtr)SDL_GL_GetProcAddress( "glVertexAttribPointer" ) ;
    static PFN_glGetAttribLoc pGAL = (PFN_glGetAttribLoc)SDL_GL_GetProcAddress( "glGetAttribLocation" ) ;

    if ( pBVA && s_font_vao ) pBVA( s_font_vao ) ;
    glActiveTexture( GL_TEXTURE0 ) ;
    glBindTexture( GL_TEXTURE_2D, tex ) ;
    if ( pBB ) pBB( 0x8892 /*GL_ARRAY_BUFFER*/, s_font_vbo ) ;
    const float xyuv[ 16 ] = {
        cx[0], cy[0], 0.0f, 0.0f,
        cx[1], cy[1], 1.0f, 0.0f,
        cx[2], cy[2], 0.0f, 1.0f,
        cx[3], cy[3], 1.0f, 1.0f,
    } ;
    if ( pBD ) pBD( 0x8892, ( GLsizeiptr )sizeof( xyuv ), xyuv, 0x88E8 /*GL_DYNAMIC_DRAW*/ ) ;
    GLint cur_prog = 0 ; glGetIntegerv( GL_CURRENT_PROGRAM, &cur_prog ) ;
    GLint apos = ( cur_prog > 0 && pGAL ) ? pGAL( ( GLuint )cur_prog, "a_pos" ) : -1 ;
    GLint auv  = ( cur_prog > 0 && pGAL ) ? pGAL( ( GLuint )cur_prog, "a_uv"  ) : -1 ;
    if ( apos >= 0 && pEV && pVP ) { pEV( apos ) ; pVP( apos, 2, GL_FLOAT, GL_FALSE, 16, ( const void * )0 ) ; }
    if ( auv  >= 0 && pEV && pVP ) { pEV( auv  ) ; pVP( auv,  2, GL_FLOAT, GL_FALSE, 16, ( const void * )8 ) ; }
    glDrawArrays( GL_TRIANGLE_STRIP, 0, 4 ) ;
    if ( apos >= 0 && pDV ) pDV( apos ) ;
    if ( auv  >= 0 && pDV ) pDV( auv  ) ;
    DesktopShader_Use( 0 ) ;
#else
    desktop_font_set_ortho2d() ;
    glEnable( GL_BLEND ) ;
    glBlendFunc( GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA ) ;
    glEnable( GL_TEXTURE_2D ) ;
    glColor4ub( R, G, B, 255 ) ;
    glBegin( GL_TRIANGLE_STRIP ) ;
        glTexCoord2f( 0, 0 ) ; glVertex2f( cx[ 0 ], cy[ 0 ] ) ;  // TL
        glTexCoord2f( 1, 0 ) ; glVertex2f( cx[ 1 ], cy[ 1 ] ) ;  // TR
        glTexCoord2f( 0, 1 ) ; glVertex2f( cx[ 2 ], cy[ 2 ] ) ;  // BL
        glTexCoord2f( 1, 1 ) ; glVertex2f( cx[ 3 ], cy[ 3 ] ) ;  // BR
    glEnd() ;
    glDisable( GL_TEXTURE_2D ) ;
#endif

    glBindTexture( GL_TEXTURE_2D, 0 ) ;
    glDeleteTextures( 1, &tex ) ;
}

extern int Desktop_DrawString_Hook(
    int xi, int yi, float xf, float yf, int PosIntFlag,
    double ExRateX, double ExRateY,
    int RotCenterEnable, float RotCenterX, float RotCenterY, double RotAngle,
    const wchar_t *String, size_t StringLength,
    unsigned int Color, FONTMANAGE *Font,
    unsigned int EdgeColor, int VerticalFlag )
{
    (void)EdgeColor; (void)VerticalFlag;
    if ( !String || StringLength == 0 || !Font || !Font->PF ) return -1 ;
    if ( !s_TtfInited ) {
        if ( InitFontManage_PF() != 0 ) return -1 ;
    }
    TTF_Font *font = as_ttf( Font->PF->FontData ) ;
    //  HSP の `mes` 等で default font が未確保 (FontData==NULL) の場合は
    //  fallback font を lazy load して FontData にセット。
    //  (Desktop fork は CreateFontToHandle_PF が呼ばれない経路がある)
    if ( !font ) {
        int pt = ( Font->BaseInfo.FontSize > 0 ) ? Font->BaseInfo.FontSize : 16 ;
        TTF_Font *lazy = nullptr ;
        for ( const auto &p : g_UserFontPaths ) {
            lazy = TTF_OpenFont( p.c_str(), pt ) ;
            if ( lazy ) break ;
        }
        if ( !lazy ) {
            const char * const *paths = fallback_font_paths() ;
            for ( int i = 0 ; paths[i] ; ++i ) {
                lazy = TTF_OpenFont( paths[i], pt ) ;
                if ( lazy ) break ;
            }
        }
        if ( !lazy ) {
            std::fprintf( stderr, "[DxFontDesktop] lazy fallback font open failed (pt=%d)\n", pt ) ;
            return -1 ;
        }
        Font->PF->FontData = lazy ;
        //  メトリクスも更新 (DxLib 側で y advance 計算に使う)
        Font->BaseInfo.FontHeight    = TTF_FontHeight( lazy ) ;
        Font->BaseInfo.FontAddHeight = 0 ;
        Font->BaseInfo.MaxWidth      = TTF_FontHeight( lazy ) ;
        font = lazy ;
        std::fprintf( stderr, "[DxFontDesktop] lazy fallback font loaded (pt=%d)\n", pt ) ;
    }

    std::string utf8 = desktop_wchar_to_utf8( String, StringLength ) ;
    if ( utf8.empty() ) return 0 ;

    // DxLib の Color は GetColor / NS_GetColor2 と同フォーマット (内部 ARGB8)
    int R = 255, G = 255, B = 255 ;
    NS_GetColor2( Color, &R, &G, &B ) ;
    SDL_Color c = { ( Uint8 )R, ( Uint8 )G, ( Uint8 )B, 255 } ;

    SDL_Surface *surf = TTF_RenderUTF8_Blended( font, utf8.c_str(), c ) ;
    if ( !surf ) {
        std::fprintf( stderr, "[DxFontDesktop] TTF_RenderUTF8_Blended failed: %s\n", TTF_GetError() ) ;
        return -1 ;
    }

    float x = PosIntFlag ? ( float )xi : xf ;
    float y = PosIntFlag ? ( float )yi : yf ;
    float w = ( float )surf->w * ( float )ExRateX ;
    float h = ( float )surf->h * ( float )ExRateY ;

    float cx[ 4 ], cy[ 4 ] ;
    if ( RotCenterEnable && RotAngle != 0.0 )
    {
        // RotCenter を中心に回転。xi/yi は回転前の原点 (left-top) 扱い
        float cosA = ( float )std::cos( RotAngle ) ;
        float sinA = ( float )std::sin( RotAngle ) ;
        auto rot = [&]( float lx, float ly, float &ox, float &oy ) {
            float dx = lx - RotCenterX ;
            float dy = ly - RotCenterY ;
            ox = x + RotCenterX + dx * cosA - dy * sinA ;
            oy = y + RotCenterY + dx * sinA + dy * cosA ;
        } ;
        rot( 0, 0, cx[ 0 ], cy[ 0 ] ) ;
        rot( w, 0, cx[ 1 ], cy[ 1 ] ) ;
        rot( 0, h, cx[ 2 ], cy[ 2 ] ) ;
        rot( w, h, cx[ 3 ], cy[ 3 ] ) ;
    }
    else
    {
        cx[ 0 ] = x     ; cy[ 0 ] = y     ;
        cx[ 1 ] = x + w ; cy[ 1 ] = y     ;
        cx[ 2 ] = x     ; cy[ 2 ] = y + h ;
        cx[ 3 ] = x + w ; cy[ 3 ] = y + h ;
    }

    desktop_font_draw_surface( surf, cx, cy, ( Uint8 )R, ( Uint8 )G, ( Uint8 )B ) ;
    SDL_FreeSurface( surf ) ;
    return 0 ;
}

// DxFont.cpp の GetDrawStringWidthToHandle_WCHAR_T からフック。
// SDL_ttf の TTF_SizeUTF8 で文字幅を実測して返す。失敗時は -1。
extern int Desktop_GetStringWidth_Hook( const wchar_t *String, int StrLen, FONTMANAGE *Font )
{
    if ( !String || StrLen <= 0 || !Font || !Font->PF ) return -1 ;
    if ( !s_TtfInited ) return -1 ;
    TTF_Font *font = as_ttf( Font->PF->FontData ) ;
    if ( !font ) return -1 ;
    std::string utf8 = desktop_wchar_to_utf8( String, ( size_t )StrLen ) ;
    if ( utf8.empty() ) return 0 ;
    int w = 0, h = 0 ;
    if ( TTF_SizeUTF8( font, utf8.c_str(), &w, &h ) != 0 ) return -1 ;
    return w ;
}

#ifndef DX_NON_NAMESPACE
} // end namespace DxLib
#endif

#endif // DX_NON_FONT
