//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2+GL) 用 GraphFilter GPU backend
//
//      BICUBIC / LANCZOS3 / GAUSS (separable) の GLSL shader 版。
//      CPU 版 (DxGraphicsFilterDesktop.cpp) は O(w*h*kernel) で遅いため、
//      GPU 版を優先的に使う経路を追加する。
//
//      使い方: GraphFilterBlt(src, dst, DX_GRAPH_FILTER_BICUBIC_SCALE, ...) の
//      時に dest 側が FBO を持つ (MakeScreen で作られた描画可能 graph) 場合、
//      GPU 経路が有効化される。dst が CPU 専用 graph (通常 LoadGraph) だと
//      FBO が無いので CPU 経路にフォールバック。
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#ifdef _WIN32
#define NOMINMAX 1
#include <windows.h>
#endif

#include "../DxCompileConfig.h"
#include "../DxLib.h"
#include "../DxGraphics.h"
#include "../DxBaseImage.h"
#include "DxGraphicsDesktop.h"       // IMAGEDATA_ORIG_HARD_TEX_PF の実体定義

#include <SDL.h>
#include <SDL_opengl.h>
// Windows の opengl32.lib は GL 1.1 のみ。FBO 系 / multi-tex は dynamic 解決
typedef void (APIENTRYP PFN_desk_glGenFramebuffers )   ( GLsizei n, GLuint *ids ) ;
typedef void (APIENTRYP PFN_desk_glBindFramebuffer )   ( GLenum target, GLuint fb ) ;
typedef void (APIENTRYP PFN_desk_glDeleteFramebuffers) ( GLsizei n, const GLuint *ids ) ;
typedef void (APIENTRYP PFN_desk_glActiveTexture)      ( GLenum texture ) ;
#ifndef GL_FRAMEBUFFER
#define GL_FRAMEBUFFER         0x8D40
#define GL_FRAMEBUFFER_BINDING 0x8CA6
#define GL_TEXTURE0            0x84C0
#endif
static PFN_desk_glBindFramebuffer  p_glBindFramebuffer = nullptr ;
static PFN_desk_glActiveTexture    p_glActiveTexture   = nullptr ;
static int s_filter_gpu_loaded = 0 ;
static void desktop_filter_gpu_load_funcs( void )
{
    if ( s_filter_gpu_loaded ) return ;
    p_glBindFramebuffer = ( PFN_desk_glBindFramebuffer ) SDL_GL_GetProcAddress( "glBindFramebuffer" ) ;
    if ( !p_glBindFramebuffer )
        p_glBindFramebuffer = ( PFN_desk_glBindFramebuffer ) SDL_GL_GetProcAddress( "glBindFramebufferEXT" ) ;
    p_glActiveTexture = ( PFN_desk_glActiveTexture ) SDL_GL_GetProcAddress( "glActiveTexture" ) ;
    if ( !p_glActiveTexture )
        p_glActiveTexture = ( PFN_desk_glActiveTexture ) SDL_GL_GetProcAddress( "glActiveTextureARB" ) ;
    s_filter_gpu_loaded = 1 ;
}
#include <cstdio>
#include <cstring>
#include <cstdarg>

// DxShaderDesktop.cpp で定義済の GLSL helper
extern "C" int DesktopShader_CompileGLSL ( const char *vs, const char *fs ) ;
extern "C" int DesktopShader_Use         ( int handle ) ;
extern "C" int DesktopShader_SetUniform1i( int h, const char *name, int v ) ;
extern "C" int DesktopShader_SetUniform1f( int h, const char *name, float v ) ;
extern "C" int DesktopShader_SetUniform2f( int h, const char *name, float a, float b ) ;
extern "C" int DesktopShader_SetUniform3f( int h, const char *name, float a, float b, float c ) ;
extern "C" int DesktopShader_SetUniform4f( int h, const char *name, float a, float b, float c, float d ) ;

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

// ---- GLSL sources (embed) --------------------------------------------------

// Apple Core profile では gl_Vertex / gl_MultiTexCoord0 (fixed-function attribute)
// が使えないため、attribute 経由で受ける形式に統一。compat profile (Win/Linux)
// では DesktopShader_CompileGLSL の compat header inject はないが、attribute は
// GLSL 1.20 構文として valid なのでそのまま動く。
static const char *s_filter_vs = R"GLSL(
attribute vec2 a_pos ;
attribute vec2 a_uv ;
varying vec2 v_uv ;
void main( void )
{
    gl_Position = vec4( a_pos, 0.0, 1.0 ) ;
    v_uv        = a_uv ;
}
)GLSL" ;

// Catmull-Rom bicubic (Mitchell-Netravali B=0, C=0.5)
static const char *s_filter_bicubic_fs = R"GLSL(
#version 120
uniform sampler2D u_input ;
uniform vec2      u_srcSize ;   // (srcW, srcH)
varying vec2      v_uv ;

float w_bicubic( float t ) {
    float at = abs( t ) ;
    if ( at < 1.0 ) return 1.5 * at*at*at - 2.5 * at*at + 1.0 ;
    if ( at < 2.0 ) return -0.5 * at*at*at + 2.5 * at*at - 4.0 * at + 2.0 ;
    return 0.0 ;
}

void main( void ) {
    vec2 pos  = v_uv * u_srcSize - vec2( 0.5 ) ;
    vec2 pi   = floor( pos ) ;
    vec2 fr   = pos - pi ;
    vec4 acc  = vec4( 0.0 ) ;
    float wsum = 0.0 ;
    for ( int j = -1 ; j <= 2 ; ++j ) {
        float wy = w_bicubic( float( j ) - fr.y ) ;
        for ( int i = -1 ; i <= 2 ; ++i ) {
            float wx = w_bicubic( float( i ) - fr.x ) ;
            float w  = wx * wy ;
            vec2 uv  = ( pi + vec2( float( i ), float( j ) ) + vec2( 0.5 ) ) / u_srcSize ;
            uv       = clamp( uv, vec2( 0.0 ), vec2( 1.0 ) ) ;
            acc += texture2D( u_input, uv ) * w ;
            wsum += w ;
        }
    }
    gl_FragColor = acc / wsum ;
}
)GLSL" ;

// Lanczos-3 (sinc * sinc window of radius 3)
static const char *s_filter_lanczos3_fs = R"GLSL(
#version 120
uniform sampler2D u_input ;
uniform vec2      u_srcSize ;
varying vec2      v_uv ;

const float PI = 3.14159265 ;

float w_sinc( float x ) {
    if ( x == 0.0 ) return 1.0 ;
    return sin( PI * x ) / ( PI * x ) ;
}
float w_lanczos3( float x ) {
    if ( abs( x ) >= 3.0 ) return 0.0 ;
    return w_sinc( x ) * w_sinc( x / 3.0 ) ;
}

void main( void ) {
    vec2 pos  = v_uv * u_srcSize - vec2( 0.5 ) ;
    vec2 pi   = floor( pos ) ;
    vec2 fr   = pos - pi ;
    vec4 acc  = vec4( 0.0 ) ;
    float wsum = 0.0 ;
    for ( int j = -2 ; j <= 3 ; ++j ) {
        float wy = w_lanczos3( float( j ) - fr.y ) ;
        for ( int i = -2 ; i <= 3 ; ++i ) {
            float wx = w_lanczos3( float( i ) - fr.x ) ;
            float w  = wx * wy ;
            vec2 uv  = ( pi + vec2( float( i ), float( j ) ) + vec2( 0.5 ) ) / u_srcSize ;
            uv       = clamp( uv, vec2( 0.0 ), vec2( 1.0 ) ) ;
            acc += texture2D( u_input, uv ) * w ;
            wsum += w ;
        }
    }
    gl_FragColor = acc / wsum ;
}
)GLSL" ;

// separable Gaussian: σ=1.5 相当 (9-tap)
static const char *s_filter_gauss_fs = R"GLSL(
#version 120
uniform sampler2D u_input ;
uniform vec2      u_pixelSize ;      // (1/w, 1/h)
uniform int       u_isHorizontal ;
varying vec2      v_uv ;

void main( void ) {
    vec2 d = ( u_isHorizontal == 1 )
             ? vec2( u_pixelSize.x, 0.0 )
             : vec2( 0.0, u_pixelSize.y ) ;
    float w0 = 0.2271, w1 = 0.1945, w2 = 0.1216, w3 = 0.0540, w4 = 0.0162 ;
    vec4 s = texture2D( u_input, v_uv ) * w0
           + texture2D( u_input, v_uv + d ) * w1
           + texture2D( u_input, v_uv - d ) * w1
           + texture2D( u_input, v_uv + d * 2.0 ) * w2
           + texture2D( u_input, v_uv - d * 2.0 ) * w2
           + texture2D( u_input, v_uv + d * 3.0 ) * w3
           + texture2D( u_input, v_uv - d * 3.0 ) * w3
           + texture2D( u_input, v_uv + d * 4.0 ) * w4
           + texture2D( u_input, v_uv - d * 4.0 ) * w4 ;
    gl_FragColor = s ;
}
)GLSL" ;

// -------------------------------------------------------------------------
// 追加 GPU filter 2026-04-23 後半分: CPU 版と同式の pixel-local shader を
// 順に追加。dispatcher (DxGraphicsFilterDesktop.cpp) から Desktop_GraphFilter_Params
// 経由で arg を受け取る。
// -------------------------------------------------------------------------

//  MONO: BT.601 輝度化 (Cb/Cr offset は簡易版では無視、純モノクロ)
static const char *s_filter_mono_fs = R"GLSL(
#version 120
uniform sampler2D u_input ;
varying vec2 v_uv ;
void main( void ) {
    vec4 c = texture2D( u_input, v_uv ) ;
    float lum = c.r * 0.299 + c.g * 0.587 + c.b * 0.114 ;
    gl_FragColor = vec4( lum, lum, lum, c.a ) ;
}
)GLSL" ;

//  INVERT: RGB 反転、alpha 保持
static const char *s_filter_invert_fs = R"GLSL(
#version 120
uniform sampler2D u_input ;
varying vec2 v_uv ;
void main( void ) {
    vec4 c = texture2D( u_input, v_uv ) ;
    gl_FragColor = vec4( 1.0 - c.r, 1.0 - c.g, 1.0 - c.b, c.a ) ;
}
)GLSL" ;

//  BRIGHT_CLIP: u_cmpType (0=below, 1=above) の輝度を切り捨てて透明化
static const char *s_filter_brightclip_fs = R"GLSL(
#version 120
uniform sampler2D u_input ;
uniform int       u_cmpType ;     // 0=below, 1=above
uniform float     u_cmpParam ;    // 0..1 (0..255/255)
varying vec2 v_uv ;
void main( void ) {
    vec4 c = texture2D( u_input, v_uv ) ;
    float lum = c.r * 0.299 + c.g * 0.587 + c.b * 0.114 ;
    bool clipped = ( u_cmpType == 0 ) ? ( lum < u_cmpParam ) : ( lum > u_cmpParam ) ;
    gl_FragColor = clipped ? vec4( 0.0 ) : c ;
}
)GLSL" ;

//  BRIGHT_SCALE: [u_min,u_max] を [0,1] にリマップ
static const char *s_filter_brightscale_fs = R"GLSL(
#version 120
uniform sampler2D u_input ;
uniform float u_min ;    // 0..1
uniform float u_max ;    // 0..1
varying vec2 v_uv ;
void main( void ) {
    vec4 c = texture2D( u_input, v_uv ) ;
    float s = 1.0 / max( u_max - u_min, 1.0/255.0 ) ;
    vec3 mapped = clamp( ( c.rgb - vec3( u_min ) ) * s, vec3( 0.0 ), vec3( 1.0 ) ) ;
    gl_FragColor = vec4( mapped, c.a ) ;
}
)GLSL" ;

//  HSB: YIQ 経由 hue 回転 + 彩度 + 明度
static const char *s_filter_hsb_fs = R"GLSL(
#version 120
uniform sampler2D u_input ;
uniform float u_cosH ;
uniform float u_sinH ;
uniform float u_dSat ;    // -1..1 (彩度加減)
uniform float u_dBri ;    // -1..1 (明度加減)
varying vec2 v_uv ;
void main( void ) {
    vec4 c = texture2D( u_input, v_uv ) ;
    float Y = 0.299 * c.r + 0.587 * c.g + 0.114 * c.b ;
    float I = 0.596 * c.r - 0.274 * c.g - 0.322 * c.b ;
    float Q = 0.211 * c.r - 0.523 * c.g + 0.312 * c.b ;
    float ni = I * u_cosH - Q * u_sinH ;
    float nq = I * u_sinH + Q * u_cosH ;
    ni *= ( 1.0 + u_dSat ) ;
    nq *= ( 1.0 + u_dSat ) ;
    Y += u_dBri ;
    float nR = Y + 0.956 * ni + 0.621 * nq ;
    float nG = Y - 0.272 * ni - 0.647 * nq ;
    float nB = Y - 1.106 * ni + 1.703 * nq ;
    gl_FragColor = vec4( clamp( vec3( nR, nG, nB ), 0.0, 1.0 ), c.a ) ;
}
)GLSL" ;

//  LEVEL: [u_minIn,u_maxIn] → [u_minOut,u_maxOut] リマップ + gamma
static const char *s_filter_level_fs = R"GLSL(
#version 120
uniform sampler2D u_input ;
uniform float u_minIn ;
uniform float u_maxIn ;
uniform float u_gamma ;
uniform float u_minOut ;
uniform float u_maxOut ;
varying vec2 v_uv ;
void main( void ) {
    vec4 c = texture2D( u_input, v_uv ) ;
    float invGamma = ( u_gamma > 0.0 ) ? ( 1.0 / u_gamma ) : 1.0 ;
    vec3 t = clamp( ( c.rgb - vec3( u_minIn ) ) / max( u_maxIn - u_minIn, 1.0/255.0 ), 0.0, 1.0 ) ;
    vec3 g = pow( t, vec3( invGamma ) ) ;
    vec3 o = mix( vec3( u_minOut ), vec3( u_maxOut ), g ) ;
    gl_FragColor = vec4( clamp( o, 0.0, 1.0 ), c.a ) ;
}
)GLSL" ;

//  TWO_COLOR: 輝度 threshold で 2 色置換
static const char *s_filter_twocolor_fs = R"GLSL(
#version 120
uniform sampler2D u_input ;
uniform float u_threshold ;
uniform vec4  u_lowColor ;
uniform vec4  u_highColor ;
varying vec2 v_uv ;
void main( void ) {
    vec4 c = texture2D( u_input, v_uv ) ;
    float lum = c.r * 0.299 + c.g * 0.587 + c.b * 0.114 ;
    gl_FragColor = ( lum < u_threshold ) ? u_lowColor : u_highColor ;
}
)GLSL" ;

//  PREMUL_ALPHA: RGB *= A (straight → premultiplied)
static const char *s_filter_premul_fs = R"GLSL(
#version 120
uniform sampler2D u_input ;
varying vec2 v_uv ;
void main( void ) {
    vec4 c = texture2D( u_input, v_uv ) ;
    gl_FragColor = vec4( c.rgb * c.a, c.a ) ;
}
)GLSL" ;

//  YUV_TO_RGB: BT.601 YCbCr → RGB 変換 (BGRA 8bit は Y=R, U=G, V=B 扱いの簡易版)
static const char *s_filter_yuv_fs = R"GLSL(
#version 120
uniform sampler2D u_input ;
uniform int       u_yuvRra ;   // 1=RRA (R を alpha にも) 変種
varying vec2 v_uv ;
void main( void ) {
    vec4 c = texture2D( u_input, v_uv ) ;
    float Y = c.r, Cb = c.g - 0.5, Cr = c.b - 0.5 ;
    float R = Y + 1.402   * Cr ;
    float G = Y - 0.344136 * Cb - 0.714136 * Cr ;
    float B = Y + 1.772   * Cb ;
    float A = ( u_yuvRra == 1 ) ? Y : c.a ;
    gl_FragColor = vec4( clamp( vec3( R, G, B ), 0.0, 1.0 ), A ) ;
}
)GLSL" ;

//  FLOAT_COLOR_SCALE: 各 channel を float スケール
static const char *s_filter_fcs_fs = R"GLSL(
#version 120
uniform sampler2D u_input ;
uniform vec4 u_scale ;
varying vec2 v_uv ;
void main( void ) {
    vec4 c = texture2D( u_input, v_uv ) ;
    gl_FragColor = clamp( c * u_scale, 0.0, 1.0 ) ;
}
)GLSL" ;

//  REPLACEMENT: 特定色を別色に置換 (exact match、閾値 u_rangeDelta 内)
static const char *s_filter_replace_fs = R"GLSL(
#version 120
uniform sampler2D u_input ;
uniform vec3  u_targetColor ;    // 検索する色
uniform float u_rangeDelta ;     // 許容範囲 (0..1)
uniform vec4  u_replaceColor ;
varying vec2 v_uv ;
void main( void ) {
    vec4 c = texture2D( u_input, v_uv ) ;
    vec3 d = abs( c.rgb - u_targetColor ) ;
    bool match = all( lessThan( d, vec3( u_rangeDelta ) ) ) ;
    gl_FragColor = match ? u_replaceColor : c ;
}
)GLSL" ;

// Gradient Map — 256 色 palette で luminance 置換。
// palette は CPU 側で事前に 256×1 RGBA texture として構築 (別 setter 経由)。
static const char *s_filter_gradmap_fs = R"GLSL(
#version 120
uniform sampler2D u_input ;
uniform sampler2D u_palette ;    // 256x1 RGBA、u ∈ [0,1] = luminance
varying vec2      v_uv ;

void main( void ) {
    vec4 c = texture2D( u_input, v_uv ) ;
    //  DxLib CPU 版と同じ 0.113 R + 0.586 G + 0.301 B (精度 >>8 近似)
    float lum = c.r * 0.1133 + c.g * 0.5859 + c.b * 0.3008 ;
    vec4 pal = texture2D( u_palette, vec2( lum, 0.5 ) ) ;
    gl_FragColor = vec4( pal.rgb, c.a ) ;
}
)GLSL" ;

// SSAO (Screen-Space AO) — depth buffer 無しの簡易実装。
// CPU 版 (DxGraphicsFilterDesktop.cpp:399-439) の輝度差ベース陰影生成を GPU 化。
// 8 近傍 (radius=2 pixels ring) との輝度比較、暗い近傍が多ければ現ピクセルを減光。
static const char *s_filter_ssao_fs = R"GLSL(
#version 120
uniform sampler2D u_input ;
uniform vec2      u_pixelSize ;   // (1/w, 1/h)
uniform float     u_radius ;      // pixel 単位の半径 (default 2)
uniform float     u_strength ;    // 減光度合い (0..1、default 0.5)
varying vec2      v_uv ;

const vec3 LUMA = vec3( 0.1133, 0.5859, 0.3008 ) ;  // 29/256, 150/256, 77/256

void main( void ) {
    vec4  center = texture2D( u_input, v_uv ) ;
    float lum    = dot( center.rgb, LUMA ) ;

    float darker = 0.0 ;
    float samples = 0.0 ;
    // CPU 版と同じ 3x3 ring - center = 8 taps
    for ( int j = -1 ; j <= 1 ; ++j ) {
        for ( int i = -1 ; i <= 1 ; ++i ) {
            if ( i == 0 && j == 0 ) continue ;
            vec2  offset = vec2( float( i ), float( j ) ) * u_radius * u_pixelSize ;
            vec4  s      = texture2D( u_input, clamp( v_uv + offset, vec2( 0.0 ), vec2( 1.0 ) ) ) ;
            float sLum   = dot( s.rgb, LUMA ) ;
            if ( sLum < lum ) darker += 1.0 ;
            samples += 1.0 ;
        }
    }
    float occ = 1.0 - ( darker * u_strength / samples ) ;
    gl_FragColor = vec4( center.rgb * occ, center.a ) ;
}
)GLSL" ;

// ---- shader handle cache -------------------------------------------------

static int s_Shader_Bicubic  = 0 ;
static int s_Shader_Lanczos3 = 0 ;
static int s_Shader_Gauss    = 0 ;
static int s_Shader_SSAO     = 0 ;
static int s_Shader_GradMap  = 0 ;
static int s_Shader_Mono     = 0 ;
static int s_Shader_Invert   = 0 ;
static int s_Shader_BrightClip  = 0 ;
static int s_Shader_BrightScale = 0 ;
static int s_Shader_HSB      = 0 ;
static int s_Shader_Level    = 0 ;
static int s_Shader_TwoColor = 0 ;
static int s_Shader_Premul   = 0 ;
static int s_Shader_YUV      = 0 ;
static int s_Shader_FCS      = 0 ;
static int s_Shader_Replace  = 0 ;

//  dispatcher (DxGraphicsFilterDesktop.cpp) から設定される GPU filter params
//  SSAO/GradMap は独立、それ以外は共用
struct DesktopFilterParams {
    //  BRIGHT_CLIP
    int    cmpType   = 0 ;
    float  cmpParam  = 0.0f ;
    //  BRIGHT_SCALE
    float  minBright = 0.0f ;
    float  maxBright = 1.0f ;
    //  HSB
    float  cosH = 1.0f ;
    float  sinH = 0.0f ;
    float  dSat = 0.0f ;
    float  dBri = 0.0f ;
    //  LEVEL
    float  minIn  = 0.0f ;
    float  maxIn  = 1.0f ;
    float  gamma  = 1.0f ;
    float  minOut = 0.0f ;
    float  maxOut = 1.0f ;
    //  TWO_COLOR
    float  threshold   = 0.5f ;
    float  lowColor[4]  = { 0, 0, 0, 1 } ;
    float  highColor[4] = { 1, 1, 1, 1 } ;
    //  YUV
    int    yuvRra = 0 ;
    //  FLOAT_COLOR_SCALE
    float  scale[4]    = { 1, 1, 1, 1 } ;
    //  REPLACEMENT
    float  targetColor[3] = { 0, 0, 0 } ;
    float  rangeDelta     = 0.0f ;
    float  replaceColor[4] = { 0, 0, 0, 1 } ;
} ;
static DesktopFilterParams s_FilterParams ;

extern "C" void *Desktop_GraphFilter_GetParamsPtr( void )
{
    return ( void * )&s_FilterParams ;
}

//  gradmap 用 palette texture (256×1 RGBA、CPU 側で setter が都度更新)
static GLuint s_GradMapPaletteTex = 0 ;
static bool   s_GradMapPaletteSet = false ;

//  CPU 側で build 済の 256 色 palette (各色 RGBA) をテクスチャに転送。
//  GraphFilterBlt の GRADIENT_MAP ケースで呼び出され、直後に GPU 経路へ進む。
extern "C" int Desktop_GradMap_SetPalette256( const unsigned char *rgba256 )
{
    if ( !rgba256 ) return -1 ;
    desktop_filter_gpu_load_funcs() ;
    if ( !p_glActiveTexture ) return -1 ;

    if ( s_GradMapPaletteTex == 0 ) {
        glGenTextures( 1, &s_GradMapPaletteTex ) ;
    }
    glBindTexture( GL_TEXTURE_2D, s_GradMapPaletteTex ) ;
    glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR ) ;
    glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR ) ;
    glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE ) ;
    glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE ) ;
    glTexImage2D( GL_TEXTURE_2D, 0, GL_RGBA, 256, 1, 0, GL_RGBA, GL_UNSIGNED_BYTE, rgba256 ) ;
    s_GradMapPaletteSet = true ;
    return 0 ;
}

#define DESK_GET_FILTER( h, src ) \
    if ( ( h ) == 0 ) ( h ) = DesktopShader_CompileGLSL( s_filter_vs, src ) ; return ( h )

static int desktop_get_filter_shader( int filterType )
{
    if ( filterType == DX_GRAPH_FILTER_GRADIENT_MAP )    { DESK_GET_FILTER( s_Shader_GradMap,  s_filter_gradmap_fs ) ; }
    if ( filterType == DX_GRAPH_FILTER_SSAO )            { DESK_GET_FILTER( s_Shader_SSAO,     s_filter_ssao_fs ) ; }
    if ( filterType == DX_GRAPH_FILTER_MONO )            { DESK_GET_FILTER( s_Shader_Mono,     s_filter_mono_fs ) ; }
    if ( filterType == DX_GRAPH_FILTER_INVERT )          { DESK_GET_FILTER( s_Shader_Invert,   s_filter_invert_fs ) ; }
    if ( filterType == DX_GRAPH_FILTER_PMA_INVERT )      { DESK_GET_FILTER( s_Shader_Invert,   s_filter_invert_fs ) ; }
    if ( filterType == DX_GRAPH_FILTER_BRIGHT_CLIP ||
         filterType == DX_GRAPH_FILTER_PMA_BRIGHT_CLIP ) { DESK_GET_FILTER( s_Shader_BrightClip, s_filter_brightclip_fs ) ; }
    if ( filterType == DX_GRAPH_FILTER_BRIGHT_SCALE ||
         filterType == DX_GRAPH_FILTER_PMA_BRIGHT_SCALE ){ DESK_GET_FILTER( s_Shader_BrightScale, s_filter_brightscale_fs ) ; }
    if ( filterType == DX_GRAPH_FILTER_HSB ||
         filterType == DX_GRAPH_FILTER_PMA_HSB )         { DESK_GET_FILTER( s_Shader_HSB,      s_filter_hsb_fs ) ; }
    if ( filterType == DX_GRAPH_FILTER_LEVEL )           { DESK_GET_FILTER( s_Shader_Level,    s_filter_level_fs ) ; }
    if ( filterType == DX_GRAPH_FILTER_TWO_COLOR )       { DESK_GET_FILTER( s_Shader_TwoColor, s_filter_twocolor_fs ) ; }
    if ( filterType == DX_GRAPH_FILTER_PREMUL_ALPHA ||
         filterType == DX_GRAPH_FILTER_INTERP_ALPHA )    { DESK_GET_FILTER( s_Shader_Premul,   s_filter_premul_fs ) ; }
    if ( filterType == DX_GRAPH_FILTER_YUV_TO_RGB ||
         filterType == DX_GRAPH_FILTER_YUV_TO_RGB_RRA )  { DESK_GET_FILTER( s_Shader_YUV,      s_filter_yuv_fs ) ; }
    if ( filterType == DX_GRAPH_FILTER_FLOAT_COLOR_SCALE ) { DESK_GET_FILTER( s_Shader_FCS,    s_filter_fcs_fs ) ; }
    if ( filterType == DX_GRAPH_FILTER_REPLACEMENT )     { DESK_GET_FILTER( s_Shader_Replace,  s_filter_replace_fs ) ; }
    if ( filterType == DX_GRAPH_FILTER_BICUBIC_SCALE ) {
        if ( s_Shader_Bicubic == 0 )
            s_Shader_Bicubic = DesktopShader_CompileGLSL( s_filter_vs, s_filter_bicubic_fs ) ;
        return s_Shader_Bicubic ;
    }
    if ( filterType == DX_GRAPH_FILTER_LANCZOS3_SCALE ) {
        if ( s_Shader_Lanczos3 == 0 )
            s_Shader_Lanczos3 = DesktopShader_CompileGLSL( s_filter_vs, s_filter_lanczos3_fs ) ;
        return s_Shader_Lanczos3 ;
    }
    if ( filterType == DX_GRAPH_FILTER_GAUSS ) {
        if ( s_Shader_Gauss == 0 )
            s_Shader_Gauss = DesktopShader_CompileGLSL( s_filter_vs, s_filter_gauss_fs ) ;
        return s_Shader_Gauss ;
    }
    return 0 ;
}

// ---- FBO quad render helper ----------------------------------------------

static void desktop_render_fullscreen_quad( GLuint srcTex, GLuint dstFBO, int dstW, int dstH )
{
    GLint prev_fbo = 0 ;
    glGetIntegerv( GL_FRAMEBUFFER_BINDING, &prev_fbo ) ;
    GLint prev_vp[ 4 ] ;
    glGetIntegerv( GL_VIEWPORT, prev_vp ) ;

    p_glBindFramebuffer( GL_FRAMEBUFFER, dstFBO ) ;
    glViewport( 0, 0, dstW, dstH ) ;
    glDisable( GL_DEPTH_TEST ) ;
    glDisable( GL_BLEND ) ;
    glDisable( GL_CULL_FACE ) ;

    p_glActiveTexture(GL_TEXTURE0 ) ;
    glBindTexture( GL_TEXTURE_2D, srcTex ) ;
    glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR ) ;
    glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR ) ;
    glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE ) ;
    glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE ) ;

    // Full-screen quad: a_pos (NDC -1..1) + a_uv (0..1) を VBO で
    // GL_TRIANGLE_STRIP 4 vertex (modern path)
    typedef void (APIENTRY *PFN_glGenBuffers_)(GLsizei, GLuint*) ;
    typedef void (APIENTRY *PFN_glBindBuffer_)(GLenum, GLuint) ;
    typedef void (APIENTRY *PFN_glBufferData_)(GLenum, ptrdiff_t, const void*, GLenum) ;
    typedef void (APIENTRY *PFN_glEnableVAA_)(GLuint) ;
    typedef void (APIENTRY *PFN_glDisableVAA_)(GLuint) ;
    typedef void (APIENTRY *PFN_glVAttribPtr_)(GLuint, GLint, GLenum, GLboolean, GLsizei, const void*) ;
    typedef GLint (APIENTRY *PFN_glGetAttribLoc_)(GLuint, const char*) ;
    typedef void (APIENTRY *PFN_glGenVAO_)(GLsizei, GLuint*) ;
    typedef void (APIENTRY *PFN_glBindVAO_)(GLuint) ;
    static PFN_glGenBuffers_     pGB  = (PFN_glGenBuffers_)    SDL_GL_GetProcAddress( "glGenBuffers" ) ;
    static PFN_glBindBuffer_     pBB  = (PFN_glBindBuffer_)    SDL_GL_GetProcAddress( "glBindBuffer" ) ;
    static PFN_glBufferData_     pBD  = (PFN_glBufferData_)    SDL_GL_GetProcAddress( "glBufferData" ) ;
    static PFN_glEnableVAA_      pEV  = (PFN_glEnableVAA_)     SDL_GL_GetProcAddress( "glEnableVertexAttribArray" ) ;
    static PFN_glDisableVAA_     pDV  = (PFN_glDisableVAA_)    SDL_GL_GetProcAddress( "glDisableVertexAttribArray" ) ;
    static PFN_glVAttribPtr_     pVP  = (PFN_glVAttribPtr_)    SDL_GL_GetProcAddress( "glVertexAttribPointer" ) ;
    static PFN_glGetAttribLoc_   pGAL = (PFN_glGetAttribLoc_)  SDL_GL_GetProcAddress( "glGetAttribLocation" ) ;
    static PFN_glGenVAO_         pGVA = (PFN_glGenVAO_)        SDL_GL_GetProcAddress( "glGenVertexArrays" ) ;
    static PFN_glBindVAO_        pBVA = (PFN_glBindVAO_)       SDL_GL_GetProcAddress( "glBindVertexArray" ) ;
    static GLuint s_quad_vbo = 0 ;
    static GLuint s_quad_vao = 0 ;
    if ( !s_quad_vbo && pGB ) pGB( 1, &s_quad_vbo ) ;
    if ( !s_quad_vao && pGVA ) pGVA( 1, &s_quad_vao ) ;
    if ( pBVA && s_quad_vao ) pBVA( s_quad_vao ) ;
    if ( pBB && s_quad_vbo ) pBB( 0x8892 /*GL_ARRAY_BUFFER*/, s_quad_vbo ) ;
    // (x,y, u,v) × 4 (TRIANGLE_STRIP)
    static const float quad_xyuv[ 16 ] = {
        -1.0f, -1.0f,  0.0f, 0.0f,
         1.0f, -1.0f,  1.0f, 0.0f,
        -1.0f,  1.0f,  0.0f, 1.0f,
         1.0f,  1.0f,  1.0f, 1.0f,
    } ;
    if ( pBD ) pBD( 0x8892, ( ptrdiff_t )sizeof( quad_xyuv ), quad_xyuv, 0x88E4 /*GL_STATIC_DRAW*/ ) ;
    GLint cur_prog = 0 ; glGetIntegerv( GL_CURRENT_PROGRAM, &cur_prog ) ;
    GLint apos = ( cur_prog > 0 && pGAL ) ? pGAL( ( GLuint )cur_prog, "a_pos" ) : -1 ;
    GLint auv  = ( cur_prog > 0 && pGAL ) ? pGAL( ( GLuint )cur_prog, "a_uv"  ) : -1 ;
    if ( apos >= 0 && pEV && pVP ) { pEV( apos ) ; pVP( apos, 2, GL_FLOAT, GL_FALSE, 16, ( const void * )0 ) ; }
    if ( auv  >= 0 && pEV && pVP ) { pEV( auv  ) ; pVP( auv,  2, GL_FLOAT, GL_FALSE, 16, ( const void * )8 ) ; }
    glDrawArrays( GL_TRIANGLE_STRIP, 0, 4 ) ;
    if ( apos >= 0 && pDV ) pDV( apos ) ;
    if ( auv  >= 0 && pDV ) pDV( auv  ) ;

    p_glBindFramebuffer( GL_FRAMEBUFFER, ( GLuint )prev_fbo ) ;
    glViewport( prev_vp[ 0 ], prev_vp[ 1 ], prev_vp[ 2 ], prev_vp[ 3 ] ) ;
}

// ---- GPU filter entry point ---------------------------------------------

// 戻り値: 0 成功、-1 fallback 要 (GPU 経路で処理できなかった)
extern int Desktop_GraphFilter_GPU( int SrcGrHandle, int DestGrHandle, int FilterType )
{
    desktop_filter_gpu_load_funcs() ;
    if ( !p_glBindFramebuffer || !p_glActiveTexture ) return -1 ;

    IMAGEDATA *srcImg = Graphics_Image_GetData( SrcGrHandle ) ;
    IMAGEDATA *dstImg = Graphics_Image_GetData( DestGrHandle ) ;
    if ( !srcImg || !dstImg ) return -1 ;
    if ( !srcImg->Orig || !dstImg->Orig ) return -1 ;
    if ( srcImg->Orig->Hard.TexNum == 0 || dstImg->Orig->Hard.TexNum == 0 ) return -1 ;
    IMAGEDATA_ORIG_HARD_TEX *st = &srcImg->Orig->Hard.Tex[ 0 ] ;
    IMAGEDATA_ORIG_HARD_TEX *dt = &dstImg->Orig->Hard.Tex[ 0 ] ;
    if ( !st->PF || !dt->PF ) return -1 ;
    GLuint srcTex = ( GLuint )st->PF->Texture.TextureBuffer ;
    GLuint dstFBO = ( GLuint )dt->PF->FrameBuffer ;
    if ( srcTex == 0 || dstFBO == 0 ) return -1 ;  // dst は render-target でないと GPU 不可

    int sw = st->UseWidth, sh = st->UseHeight ;
    int dw = dt->UseWidth, dh = dt->UseHeight ;
    if ( sw <= 0 || sh <= 0 || dw <= 0 || dh <= 0 ) return -1 ;

    int shader = desktop_get_filter_shader( FilterType ) ;
    if ( shader <= 0 ) return -1 ;

    DesktopShader_Use( shader ) ;
    DesktopShader_SetUniform1i( shader, "u_input", 0 ) ;
    if ( FilterType == DX_GRAPH_FILTER_GAUSS ) {
        DesktopShader_SetUniform2f( shader, "u_pixelSize", 1.0f / sw, 1.0f / sh ) ;
        // Gauss は 2-pass だが single-pass 経路に簡略化 (垂直のみ)
        DesktopShader_SetUniform1i( shader, "u_isHorizontal", 1 ) ;
    } else if ( FilterType == DX_GRAPH_FILTER_SSAO ) {
        DesktopShader_SetUniform2f( shader, "u_pixelSize", 1.0f / sw, 1.0f / sh ) ;
        // CPU 版と同じ default (radius=2, strength=0.5)。将来は va_arg 経由で受け取る
        DesktopShader_SetUniform1f( shader, "u_radius",   2.0f ) ;
        DesktopShader_SetUniform1f( shader, "u_strength", 0.5f ) ;
    } else if ( FilterType == DX_GRAPH_FILTER_GRADIENT_MAP ) {
        if ( !s_GradMapPaletteSet || s_GradMapPaletteTex == 0 ) return -1 ;
        DesktopShader_SetUniform1i( shader, "u_palette", 1 ) ;
        p_glActiveTexture( GL_TEXTURE1 ) ;
        glBindTexture( GL_TEXTURE_2D, s_GradMapPaletteTex ) ;
        p_glActiveTexture( GL_TEXTURE0 ) ;
    } else if ( FilterType == DX_GRAPH_FILTER_BRIGHT_CLIP ||
                FilterType == DX_GRAPH_FILTER_PMA_BRIGHT_CLIP ) {
        DesktopShader_SetUniform1i( shader, "u_cmpType",  s_FilterParams.cmpType ) ;
        DesktopShader_SetUniform1f( shader, "u_cmpParam", s_FilterParams.cmpParam ) ;
    } else if ( FilterType == DX_GRAPH_FILTER_BRIGHT_SCALE ||
                FilterType == DX_GRAPH_FILTER_PMA_BRIGHT_SCALE ) {
        DesktopShader_SetUniform1f( shader, "u_min", s_FilterParams.minBright ) ;
        DesktopShader_SetUniform1f( shader, "u_max", s_FilterParams.maxBright ) ;
    } else if ( FilterType == DX_GRAPH_FILTER_HSB ||
                FilterType == DX_GRAPH_FILTER_PMA_HSB ) {
        DesktopShader_SetUniform1f( shader, "u_cosH", s_FilterParams.cosH ) ;
        DesktopShader_SetUniform1f( shader, "u_sinH", s_FilterParams.sinH ) ;
        DesktopShader_SetUniform1f( shader, "u_dSat", s_FilterParams.dSat ) ;
        DesktopShader_SetUniform1f( shader, "u_dBri", s_FilterParams.dBri ) ;
    } else if ( FilterType == DX_GRAPH_FILTER_LEVEL ) {
        DesktopShader_SetUniform1f( shader, "u_minIn",  s_FilterParams.minIn ) ;
        DesktopShader_SetUniform1f( shader, "u_maxIn",  s_FilterParams.maxIn ) ;
        DesktopShader_SetUniform1f( shader, "u_gamma",  s_FilterParams.gamma ) ;
        DesktopShader_SetUniform1f( shader, "u_minOut", s_FilterParams.minOut ) ;
        DesktopShader_SetUniform1f( shader, "u_maxOut", s_FilterParams.maxOut ) ;
    } else if ( FilterType == DX_GRAPH_FILTER_TWO_COLOR ) {
        DesktopShader_SetUniform1f( shader, "u_threshold", s_FilterParams.threshold ) ;
        DesktopShader_SetUniform4f( shader, "u_lowColor",
            s_FilterParams.lowColor[0], s_FilterParams.lowColor[1],
            s_FilterParams.lowColor[2], s_FilterParams.lowColor[3] ) ;
        DesktopShader_SetUniform4f( shader, "u_highColor",
            s_FilterParams.highColor[0], s_FilterParams.highColor[1],
            s_FilterParams.highColor[2], s_FilterParams.highColor[3] ) ;
    } else if ( FilterType == DX_GRAPH_FILTER_YUV_TO_RGB ||
                FilterType == DX_GRAPH_FILTER_YUV_TO_RGB_RRA ) {
        DesktopShader_SetUniform1i( shader, "u_yuvRra",
            FilterType == DX_GRAPH_FILTER_YUV_TO_RGB_RRA ? 1 : 0 ) ;
    } else if ( FilterType == DX_GRAPH_FILTER_FLOAT_COLOR_SCALE ) {
        DesktopShader_SetUniform4f( shader, "u_scale",
            s_FilterParams.scale[0], s_FilterParams.scale[1],
            s_FilterParams.scale[2], s_FilterParams.scale[3] ) ;
    } else if ( FilterType == DX_GRAPH_FILTER_REPLACEMENT ) {
        DesktopShader_SetUniform3f( shader, "u_targetColor",
            s_FilterParams.targetColor[0], s_FilterParams.targetColor[1],
            s_FilterParams.targetColor[2] ) ;
        DesktopShader_SetUniform1f( shader, "u_rangeDelta", s_FilterParams.rangeDelta ) ;
        DesktopShader_SetUniform4f( shader, "u_replaceColor",
            s_FilterParams.replaceColor[0], s_FilterParams.replaceColor[1],
            s_FilterParams.replaceColor[2], s_FilterParams.replaceColor[3] ) ;
    }
    //  MONO / INVERT / PMA_INVERT / PREMUL_ALPHA / INTERP_ALPHA は uniform 不要
    //  (shader 内で pixel-local 処理のみ)
    else if ( FilterType != DX_GRAPH_FILTER_MONO &&
              FilterType != DX_GRAPH_FILTER_INVERT &&
              FilterType != DX_GRAPH_FILTER_PMA_INVERT &&
              FilterType != DX_GRAPH_FILTER_PREMUL_ALPHA &&
              FilterType != DX_GRAPH_FILTER_INTERP_ALPHA ) {
        //  元々 bicubic/lanczos3/gauss/ssao 用 u_srcSize 経路
        DesktopShader_SetUniform2f( shader, "u_srcSize", ( float )sw, ( float )sh ) ;
    }

    desktop_render_fullscreen_quad( srcTex, dstFBO, dw, dh ) ;

    DesktopShader_Use( 0 ) ;
    return 0 ;
}

#ifndef DX_NON_NAMESPACE
} // end namespace DxLib
#endif
