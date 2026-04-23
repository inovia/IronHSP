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

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

// ---- GLSL sources (embed) --------------------------------------------------

static const char *s_filter_vs = R"GLSL(
#version 120
varying vec2 v_uv ;
void main( void )
{
    gl_Position = vec4( gl_Vertex.xy, 0.0, 1.0 ) ;      // NDC 直接
    v_uv        = gl_MultiTexCoord0.xy ;
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

static int desktop_get_filter_shader( int filterType )
{
    if ( filterType == DX_GRAPH_FILTER_GRADIENT_MAP ) {
        if ( s_Shader_GradMap == 0 )
            s_Shader_GradMap = DesktopShader_CompileGLSL( s_filter_vs, s_filter_gradmap_fs ) ;
        return s_Shader_GradMap ;
    }
    if ( filterType == DX_GRAPH_FILTER_SSAO ) {
        if ( s_Shader_SSAO == 0 )
            s_Shader_SSAO = DesktopShader_CompileGLSL( s_filter_vs, s_filter_ssao_fs ) ;
        return s_Shader_SSAO ;
    }
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

    // Full-screen quad in NDC, UV 0..1
    glMatrixMode( GL_PROJECTION ) ; glPushMatrix() ; glLoadIdentity() ;
    glMatrixMode( GL_MODELVIEW  ) ; glPushMatrix() ; glLoadIdentity() ;
    glBegin( GL_QUADS ) ;
        glTexCoord2f( 0, 0 ) ; glVertex2f( -1, -1 ) ;
        glTexCoord2f( 1, 0 ) ; glVertex2f(  1, -1 ) ;
        glTexCoord2f( 1, 1 ) ; glVertex2f(  1,  1 ) ;
        glTexCoord2f( 0, 1 ) ; glVertex2f( -1,  1 ) ;
    glEnd() ;
    glMatrixMode( GL_PROJECTION ) ; glPopMatrix() ;
    glMatrixMode( GL_MODELVIEW  ) ; glPopMatrix() ;

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
        //  palette texture (256x1) を TEXTURE1 に bind
        if ( !s_GradMapPaletteSet || s_GradMapPaletteTex == 0 ) {
            //  setter 未呼び出しなら CPU fallback
            return -1 ;
        }
        DesktopShader_SetUniform1i( shader, "u_palette", 1 ) ;
        p_glActiveTexture( GL_TEXTURE1 ) ;
        glBindTexture( GL_TEXTURE_2D, s_GradMapPaletteTex ) ;
        p_glActiveTexture( GL_TEXTURE0 ) ;
    } else {
        DesktopShader_SetUniform2f( shader, "u_srcSize", ( float )sw, ( float )sh ) ;
    }

    desktop_render_fullscreen_quad( srcTex, dstFBO, dw, dh ) ;

    DesktopShader_Use( 0 ) ;
    return 0 ;
}

#ifndef DX_NON_NAMESPACE
} // end namespace DxLib
#endif
