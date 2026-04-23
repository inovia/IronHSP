//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2+GL) 用 GLSL シェーダ 基盤 (Tier 4f)
//
//      DxLib 本家の Shader API (LoadVertexShader / LoadPixelShader) は
//      D3D バイナリ (.vso / .pso / .cso) を前提としているため Desktop GL では
//      直接互換不可能。本ファイルでは:
//
//      1) DxLib 既存 API の PF (Graphics_Hardware_Shader_*_PF) を本格実装では
//         なく診断ログ付きの no-op に留める (LoadVertexShader 等は -1 を返す)
//      2) Desktop 固有の GLSL API を extern "C" で提供:
//           DesktopShader_CompileGLSL(vs, fs) → int handle
//           DesktopShader_Use(handle)
//           DesktopShader_SetUniform1f / 2f / 3f / 4f / 1i
//           DesktopShader_SetUniformMatrix4f
//           DesktopShader_Delete(handle)
//         これは DxLib API 互換ではないが、Desktop 専用プロジェクト向けに
//         「本当は shader が使いたい」ユーザへの逃げ道として提供。
//
//      完全な DxLib Shader API 互換 (HLSL→GLSL 変換 + DxLib 内蔵 Model/Filter
//      shader の GLSL 版バンドル) は 2〜3 週間規模のため見送り。
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#ifdef _WIN32
#include <windows.h>
#endif

#include "../DxCompileConfig.h"
#include "../DxLib.h"

#include <SDL.h>
#include <SDL_opengl.h>

#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <unordered_map>
#include <vector>
#include <string>

// GL 関数ポインタ (DxGraphicsDesktop.cpp で load 済の前提で拡張)
typedef GLuint  (APIENTRYP PFN_glCreateShader)   ( GLenum type ) ;
typedef void    (APIENTRYP PFN_glDeleteShader)   ( GLuint shader ) ;
typedef void    (APIENTRYP PFN_glShaderSource)   ( GLuint shader, GLsizei count, const char *const *strings, const GLint *lengths ) ;
typedef void    (APIENTRYP PFN_glCompileShader)  ( GLuint shader ) ;
typedef void    (APIENTRYP PFN_glGetShaderiv)    ( GLuint shader, GLenum pname, GLint *params ) ;
typedef void    (APIENTRYP PFN_glGetShaderInfoLog)( GLuint shader, GLsizei bufSize, GLsizei *length, char *infoLog ) ;
typedef GLuint  (APIENTRYP PFN_glCreateProgram)  ( void ) ;
typedef void    (APIENTRYP PFN_glDeleteProgram)  ( GLuint program ) ;
typedef void    (APIENTRYP PFN_glAttachShader)   ( GLuint program, GLuint shader ) ;
typedef void    (APIENTRYP PFN_glLinkProgram)    ( GLuint program ) ;
typedef void    (APIENTRYP PFN_glGetProgramiv)   ( GLuint program, GLenum pname, GLint *params ) ;
typedef void    (APIENTRYP PFN_glGetProgramInfoLog)( GLuint program, GLsizei bufSize, GLsizei *length, char *infoLog ) ;
typedef void    (APIENTRYP PFN_glUseProgram)     ( GLuint program ) ;
typedef GLint   (APIENTRYP PFN_glGetUniformLocation)( GLuint program, const char *name ) ;
typedef void    (APIENTRYP PFN_glUniform1f)      ( GLint loc, GLfloat v0 ) ;
typedef void    (APIENTRYP PFN_glUniform2f)      ( GLint loc, GLfloat v0, GLfloat v1 ) ;
typedef void    (APIENTRYP PFN_glUniform3f)      ( GLint loc, GLfloat v0, GLfloat v1, GLfloat v2 ) ;
typedef void    (APIENTRYP PFN_glUniform4f)      ( GLint loc, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3 ) ;
typedef void    (APIENTRYP PFN_glUniform1i)      ( GLint loc, GLint v0 ) ;
typedef void    (APIENTRYP PFN_glUniformMatrix4fv)( GLint loc, GLsizei count, GLboolean transpose, const GLfloat *value ) ;

#ifndef GL_VERTEX_SHADER
#define GL_VERTEX_SHADER   0x8B31
#define GL_FRAGMENT_SHADER 0x8B30
#define GL_COMPILE_STATUS  0x8B81
#define GL_LINK_STATUS     0x8B82
#define GL_INFO_LOG_LENGTH 0x8B84
#endif

static PFN_glCreateShader       p_glCreateShader       = nullptr ;
static PFN_glDeleteShader       p_glDeleteShader       = nullptr ;
static PFN_glShaderSource       p_glShaderSource       = nullptr ;
static PFN_glCompileShader      p_glCompileShader      = nullptr ;
static PFN_glGetShaderiv        p_glGetShaderiv        = nullptr ;
static PFN_glGetShaderInfoLog   p_glGetShaderInfoLog   = nullptr ;
static PFN_glCreateProgram      p_glCreateProgram      = nullptr ;
static PFN_glDeleteProgram      p_glDeleteProgram      = nullptr ;
static PFN_glAttachShader       p_glAttachShader       = nullptr ;
static PFN_glLinkProgram        p_glLinkProgram        = nullptr ;
static PFN_glGetProgramiv       p_glGetProgramiv       = nullptr ;
static PFN_glGetProgramInfoLog  p_glGetProgramInfoLog  = nullptr ;
static PFN_glUseProgram         p_glUseProgram         = nullptr ;
static PFN_glGetUniformLocation p_glGetUniformLocation = nullptr ;
static PFN_glUniform1f          p_glUniform1f          = nullptr ;
static PFN_glUniform2f          p_glUniform2f          = nullptr ;
static PFN_glUniform3f          p_glUniform3f          = nullptr ;
static PFN_glUniform4f          p_glUniform4f          = nullptr ;
static PFN_glUniform1i          p_glUniform1i          = nullptr ;
static PFN_glUniformMatrix4fv   p_glUniformMatrix4fv   = nullptr ;

static int s_shader_loaded = 0 ;
static void desktop_shader_load_funcs( void )
{
    if ( s_shader_loaded ) return ;
    p_glCreateShader       = ( PFN_glCreateShader )       SDL_GL_GetProcAddress( "glCreateShader" ) ;
    p_glDeleteShader       = ( PFN_glDeleteShader )       SDL_GL_GetProcAddress( "glDeleteShader" ) ;
    p_glShaderSource       = ( PFN_glShaderSource )       SDL_GL_GetProcAddress( "glShaderSource" ) ;
    p_glCompileShader      = ( PFN_glCompileShader )      SDL_GL_GetProcAddress( "glCompileShader" ) ;
    p_glGetShaderiv        = ( PFN_glGetShaderiv )        SDL_GL_GetProcAddress( "glGetShaderiv" ) ;
    p_glGetShaderInfoLog   = ( PFN_glGetShaderInfoLog )   SDL_GL_GetProcAddress( "glGetShaderInfoLog" ) ;
    p_glCreateProgram      = ( PFN_glCreateProgram )      SDL_GL_GetProcAddress( "glCreateProgram" ) ;
    p_glDeleteProgram      = ( PFN_glDeleteProgram )      SDL_GL_GetProcAddress( "glDeleteProgram" ) ;
    p_glAttachShader       = ( PFN_glAttachShader )       SDL_GL_GetProcAddress( "glAttachShader" ) ;
    p_glLinkProgram        = ( PFN_glLinkProgram )        SDL_GL_GetProcAddress( "glLinkProgram" ) ;
    p_glGetProgramiv       = ( PFN_glGetProgramiv )       SDL_GL_GetProcAddress( "glGetProgramiv" ) ;
    p_glGetProgramInfoLog  = ( PFN_glGetProgramInfoLog )  SDL_GL_GetProcAddress( "glGetProgramInfoLog" ) ;
    p_glUseProgram         = ( PFN_glUseProgram )         SDL_GL_GetProcAddress( "glUseProgram" ) ;
    p_glGetUniformLocation = ( PFN_glGetUniformLocation ) SDL_GL_GetProcAddress( "glGetUniformLocation" ) ;
    p_glUniform1f          = ( PFN_glUniform1f )          SDL_GL_GetProcAddress( "glUniform1f" ) ;
    p_glUniform2f          = ( PFN_glUniform2f )          SDL_GL_GetProcAddress( "glUniform2f" ) ;
    p_glUniform3f          = ( PFN_glUniform3f )          SDL_GL_GetProcAddress( "glUniform3f" ) ;
    p_glUniform4f          = ( PFN_glUniform4f )          SDL_GL_GetProcAddress( "glUniform4f" ) ;
    p_glUniform1i          = ( PFN_glUniform1i )          SDL_GL_GetProcAddress( "glUniform1i" ) ;
    p_glUniformMatrix4fv   = ( PFN_glUniformMatrix4fv )   SDL_GL_GetProcAddress( "glUniformMatrix4fv" ) ;
    s_shader_loaded = 1 ;
}

// Handle → GL program。単純な配列管理 (0 は無効扱い)
static std::unordered_map<int, GLuint> g_Programs ;
static int g_NextHandle = 1 ;

static GLuint desktop_compile_one( GLenum type, const char *src )
{
    GLuint sh = p_glCreateShader( type ) ;
    p_glShaderSource( sh, 1, &src, nullptr ) ;
    p_glCompileShader( sh ) ;
    GLint ok = 0 ;
    p_glGetShaderiv( sh, GL_COMPILE_STATUS, &ok ) ;
    if ( !ok ) {
        char log[ 2048 ] = { 0 } ;
        p_glGetShaderInfoLog( sh, sizeof( log ) - 1, nullptr, log ) ;
        std::fprintf( stderr, "[DxShaderDesktop] compile fail (%s): %s\n",
                      type == GL_VERTEX_SHADER ? "VS" : "FS", log ) ;
        p_glDeleteShader( sh ) ;
        return 0 ;
    }
    return sh ;
}

extern "C" int DesktopShader_CompileGLSL( const char *vs_src, const char *fs_src )
{
    desktop_shader_load_funcs() ;
    if ( !p_glCreateShader ) {
        std::fprintf( stderr, "[DxShaderDesktop] GL_ARB_shader_objects not available\n" ) ;
        return -1 ;
    }
    if ( !vs_src || !fs_src ) return -1 ;

    GLuint vs = desktop_compile_one( GL_VERTEX_SHADER,   vs_src ) ;
    if ( !vs ) return -1 ;
    GLuint fs = desktop_compile_one( GL_FRAGMENT_SHADER, fs_src ) ;
    if ( !fs ) { p_glDeleteShader( vs ) ; return -1 ; }

    GLuint prog = p_glCreateProgram() ;
    p_glAttachShader( prog, vs ) ;
    p_glAttachShader( prog, fs ) ;
    p_glLinkProgram( prog ) ;
    GLint ok = 0 ;
    p_glGetProgramiv( prog, GL_LINK_STATUS, &ok ) ;
    p_glDeleteShader( vs ) ;
    p_glDeleteShader( fs ) ;
    if ( !ok ) {
        char log[ 2048 ] = { 0 } ;
        p_glGetProgramInfoLog( prog, sizeof( log ) - 1, nullptr, log ) ;
        std::fprintf( stderr, "[DxShaderDesktop] link fail: %s\n", log ) ;
        p_glDeleteProgram( prog ) ;
        return -1 ;
    }

    int h = g_NextHandle++ ;
    g_Programs[ h ] = prog ;
    return h ;
}

extern "C" int DesktopShader_Use( int handle )
{
    desktop_shader_load_funcs() ;
    if ( handle <= 0 ) { if ( p_glUseProgram ) p_glUseProgram( 0 ) ; return 0 ; }
    auto it = g_Programs.find( handle ) ;
    if ( it == g_Programs.end() ) return -1 ;
    p_glUseProgram( it->second ) ;
    return 0 ;
}

extern "C" int DesktopShader_Delete( int handle )
{
    auto it = g_Programs.find( handle ) ;
    if ( it == g_Programs.end() ) return -1 ;
    p_glDeleteProgram( it->second ) ;
    g_Programs.erase( it ) ;
    return 0 ;
}

static GLint desktop_uniform_loc( int handle, const char *name )
{
    auto it = g_Programs.find( handle ) ;
    if ( it == g_Programs.end() ) return -1 ;
    return p_glGetUniformLocation( it->second, name ) ;
}

extern "C" int DesktopShader_SetUniform1f( int h, const char *name, float v )
{ GLint l = desktop_uniform_loc( h, name ) ; if ( l < 0 ) return -1 ; p_glUniform1f( l, v ) ; return 0 ; }
extern "C" int DesktopShader_SetUniform2f( int h, const char *name, float a, float b )
{ GLint l = desktop_uniform_loc( h, name ) ; if ( l < 0 ) return -1 ; p_glUniform2f( l, a, b ) ; return 0 ; }
extern "C" int DesktopShader_SetUniform3f( int h, const char *name, float a, float b, float c )
{ GLint l = desktop_uniform_loc( h, name ) ; if ( l < 0 ) return -1 ; p_glUniform3f( l, a, b, c ) ; return 0 ; }
extern "C" int DesktopShader_SetUniform4f( int h, const char *name, float a, float b, float c, float d )
{ GLint l = desktop_uniform_loc( h, name ) ; if ( l < 0 ) return -1 ; p_glUniform4f( l, a, b, c, d ) ; return 0 ; }
extern "C" int DesktopShader_SetUniform1i( int h, const char *name, int v )
{ GLint l = desktop_uniform_loc( h, name ) ; if ( l < 0 ) return -1 ; p_glUniform1i( l, v ) ; return 0 ; }
extern "C" int DesktopShader_SetUniformMatrix4f( int h, const char *name, const float *m16, int transpose )
{ GLint l = desktop_uniform_loc( h, name ) ; if ( l < 0 ) return -1 ;
  p_glUniformMatrix4fv( l, 1, transpose ? GL_TRUE : GL_FALSE, m16 ) ; return 0 ; }

// ---- MV1 basic shader (L4 Phase 2) -------------------------------------
//   MV1 モデル描画の fixed-function 版から GLSL 版への切替経路。
//   ビルド時に GLSL source を const char* として embed。初回使用時に compile。
//   `Desktop_MV1_UseGLSLShader(1)` で有効化、以降の MV1DrawModel では
//   DxShaderDesktop.cpp が提供する MV1 basic shader program が bind される。

static const char *s_mv1_vs = R"GLSL(
#version 120
#extension GL_EXT_gpu_shader4 : enable
varying vec2 v_uv0 ;
varying vec3 v_normal ;
varying vec4 v_color ;
varying vec3 v_eyePos ;

void main( void )
{
    gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex ;
    v_uv0       = gl_MultiTexCoord0.xy ;
    v_normal    = normalize( gl_NormalMatrix * gl_Normal ) ;
    v_color     = gl_Color ;
    v_eyePos    = ( gl_ModelViewMatrix * gl_Vertex ).xyz ;
    gl_TexCoord[ 4 ] = gl_TextureMatrix[ 4 ] * gl_Vertex ;
}
)GLSL" ;

static const char *s_mv1_fs = R"GLSL(
#version 120
#extension GL_OES_standard_derivatives : enable

uniform sampler2D       u_diffuse0 ;
uniform int             u_useTexture ;
uniform int             u_useLighting ;
uniform int             u_useShadow ;
uniform sampler2DShadow u_shadowMap ;
uniform sampler2D       u_normalMap ;
uniform int             u_useNormalMap ;
uniform float           u_parallaxHeightScale ;  //  0 なら parallax 無し
uniform int             u_useParallax ;          //  1 で normal map の alpha を height として使用
uniform sampler2D       u_specularMap ;
uniform int             u_useSpecularMap ;
uniform float           u_alphaThreshold ;
//  DiffuseLayer[1..3] 多段 blending (TMU 5/6/7、有効 flag + blend mode)
//  blend mode: 1=ADDITIVE 2=MODULATE 3=REPLACE 4=TRANSLUCENT (decal)
uniform sampler2D       u_diffuse1 ;
uniform sampler2D       u_diffuse2 ;
uniform sampler2D       u_diffuse3 ;
uniform int             u_useDiffuse1 ;
uniform int             u_useDiffuse2 ;
uniform int             u_useDiffuse3 ;
uniform int             u_blendMode1 ;
uniform int             u_blendMode2 ;
uniform int             u_blendMode3 ;
//  Toon ramp (256×1 RGBA、dot(N,L) を U 軸として sampling)
uniform sampler2D       u_toonRamp ;
uniform int             u_useToonRamp ;
uniform vec3            u_mainLightDirEye ;   // eye-space、既に正規化済みを渡す
//  Multi-light 制御 (1..4、gl_LightSource[0..n-1] を累積評価)
uniform int             u_numLights ;
//  Fog 有効化 (gl_Fog.color / density を使う) と mode (0=off, 1=linear, 2=exp, 3=exp2)
uniform int             u_fogMode ;
//  Sphere map (MatCap、eye-space normal の xy を UV としてサンプリング)
uniform sampler2D       u_sphereMap ;
uniform int             u_useSphereMap ;
uniform int             u_sphereMapBlend ;  // 0=MULTIPLY (MMD .sph), 1=ADD (MMD .spa), 2=REPLACE
//  Emissive color (self-illumination、ライティング非依存で加算)
uniform vec3            u_emissive ;
uniform sampler2D       u_emissiveMap ;
uniform int             u_useEmissiveMap ;

varying vec2 v_uv0 ;
varying vec3 v_normal ;
varying vec4 v_color ;
varying vec3 v_eyePos ;

// tangent basis を derivative chain rule で求める (tangent attribute 不要)
// Christian Schüler, "Followup: Normal Mapping Without Precomputed Tangents"
mat3 derive_tbn( vec3 N, vec3 p, vec2 uv )
{
    vec3 dp1 = dFdx( p  ) ;
    vec3 dp2 = dFdy( p  ) ;
    vec2 du1 = dFdx( uv ) ;
    vec2 du2 = dFdy( uv ) ;
    vec3 dp2p = cross( dp2, N ) ;
    vec3 dp1p = cross( N, dp1 ) ;
    vec3 T = dp2p * du1.x + dp1p * du2.x ;
    vec3 B = dp2p * du1.y + dp1p * du2.y ;
    float invmax = inversesqrt( max( dot( T, T ), dot( B, B ) ) ) ;
    return mat3( T * invmax, B * invmax, N ) ;
}

//  DiffuseLayer blend helper (1 layer apply)
vec4 apply_layer( vec4 base, sampler2D tex, int mode )
{
    vec4 c = texture2D( tex, v_uv0 ) ;
    if ( mode == 1 )      return vec4( base.rgb + c.rgb, base.a ) ;           // ADDITIVE
    else if ( mode == 2 ) return base * c ;                                   // MODULATE
    else if ( mode == 3 ) return c ;                                          // REPLACE
    else                  return vec4( mix( base.rgb, c.rgb, c.a ), base.a ) ;// TRANSLUCENT (DECAL)
}

void main( void )
{
    vec4 base = ( u_useTexture == 1 )
                ? texture2D( u_diffuse0, v_uv0 ) * v_color
                :                                 v_color ;

    //  DiffuseLayer[1..3] を順に適用 (MV1 は blend order が重要)
    if ( u_useDiffuse1 == 1 ) base = apply_layer( base, u_diffuse1, u_blendMode1 ) ;
    if ( u_useDiffuse2 == 1 ) base = apply_layer( base, u_diffuse2, u_blendMode2 ) ;
    if ( u_useDiffuse3 == 1 ) base = apply_layer( base, u_diffuse3, u_blendMode3 ) ;

    if ( u_alphaThreshold > 0.0 && base.a < u_alphaThreshold ) discard ;

    vec3 N = normalize( v_normal ) ;
    //  Parallax mapping: 事前に view 方向を tangent space に変換して UV を offset
    //  (normal map の alpha を height として使う、u_parallaxHeightScale 0..1 程度)
    //  GLSL 1.20 に transpose() 無いため手動で T,B,N の dot 積で代替。
    vec2 uv = v_uv0 ;
    if ( u_useNormalMap == 1 && u_useParallax == 1 && u_parallaxHeightScale > 0.0 ) {
        mat3 TBN = derive_tbn( N, -v_eyePos, v_uv0 ) ;
        vec3 V_eye = normalize( -v_eyePos ) ;
        //  transpose(TBN) * V_eye は TBN の各列 (T,B,N) との dot 積
        vec3 V_tan = vec3( dot( V_eye, TBN[ 0 ] ), dot( V_eye, TBN[ 1 ] ), dot( V_eye, TBN[ 2 ] ) ) ;
        V_tan = normalize( V_tan ) ;
        float h = texture2D( u_normalMap, v_uv0 ).a ;
        uv = v_uv0 - V_tan.xy * ( ( h - 0.5 ) * u_parallaxHeightScale ) ;
    }
    if ( u_useNormalMap == 1 ) {
        // tangent-space normal map を eye-space normal に変換
        mat3 TBN = derive_tbn( N, -v_eyePos, uv ) ;
        vec3 nm  = texture2D( u_normalMap, uv ).xyz * 2.0 - 1.0 ;
        N = normalize( TBN * nm ) ;
    }

    if ( u_useLighting == 1 ) {
        vec3 V = normalize( -v_eyePos ) ;
        //  Specular color: u_useSpecularMap==1 なら texture sample
        vec3 specColor = gl_FrontMaterial.specular.rgb ;
        if ( u_useSpecularMap == 1 ) {
            vec4 ss = texture2D( u_specularMap, v_uv0 ) ;
            specColor = ss.rgb * ss.a ;
        }
        float shininess = gl_FrontMaterial.shininess ;
        vec3 ambient    = base.rgb * gl_LightModel.ambient.rgb ;

        //  Multi-light: gl_LightSource[0..3] を累積 (GLSL 1.20 は最大 8 だが
        //  実用域と uniform 量のバランスで 4 に制限。u_numLights で実ループ数を制御)
        vec3 diffuseAccum  = vec3( 0.0 ) ;
        vec3 specularAccum = vec3( 0.0 ) ;
        int nLights = u_numLights ;
        if ( nLights < 1 ) nLights = 1 ;
        if ( nLights > 4 ) nLights = 4 ;
        for ( int i = 0 ; i < 4 ; ++i ) {
            if ( i >= nLights ) break ;
            //  GL では position.w=0 が directional、1 が positional
            vec3 L = ( gl_LightSource[ i ].position.w < 0.5 )
                     ? normalize( gl_LightSource[ i ].position.xyz )
                     : normalize( gl_LightSource[ i ].position.xyz - v_eyePos ) ;
            vec3 H = normalize( L + V ) ;
            float ndl = max( dot( N, L ), 0.0 ) ;
            float ndh = max( dot( N, H ), 0.0 ) ;
            float sp  = ( shininess > 0.0 ) ? pow( ndh, max( shininess, 1.0 ) ) : 0.0 ;
            diffuseAccum  += gl_LightSource[ i ].diffuse.rgb  * ndl ;
            specularAccum += specColor * ( gl_LightSource[ i ].specular.rgb * sp ) ;
        }

        base.rgb = ambient + base.rgb * diffuseAccum + specularAccum ;
    }

    //  Shadow: 3x3 PCF (Percentage Closer Filtering) で影境界を滑らかに
    //  shadow2DProj は depth compare 組み込みの 4x1 sampler (GLSL 1.20)、
    //  周辺 8 tap + center 1 tap の合計 9 tap で平均化
    if ( u_useShadow == 1 ) {
        vec4 sc = gl_TexCoord[ 4 ] ;
        //  shadow map 解像度に対する 1 texel 分の offset (1/1024 仮、実用的には
        //  uniform 化推奨だが現段階は固定値で近似)
        float dx = sc.w / 1024.0 ;
        float lit = 0.0 ;
        lit += shadow2DProj( u_shadowMap, sc ).r ;
        lit += shadow2DProj( u_shadowMap, sc + vec4(  dx,   0.0, 0.0, 0.0 ) ).r ;
        lit += shadow2DProj( u_shadowMap, sc + vec4( -dx,   0.0, 0.0, 0.0 ) ).r ;
        lit += shadow2DProj( u_shadowMap, sc + vec4( 0.0,   dx, 0.0, 0.0 ) ).r ;
        lit += shadow2DProj( u_shadowMap, sc + vec4( 0.0,  -dx, 0.0, 0.0 ) ).r ;
        lit += shadow2DProj( u_shadowMap, sc + vec4(  dx,   dx, 0.0, 0.0 ) ).r ;
        lit += shadow2DProj( u_shadowMap, sc + vec4( -dx,   dx, 0.0, 0.0 ) ).r ;
        lit += shadow2DProj( u_shadowMap, sc + vec4(  dx,  -dx, 0.0, 0.0 ) ).r ;
        lit += shadow2DProj( u_shadowMap, sc + vec4( -dx,  -dx, 0.0, 0.0 ) ).r ;
        lit /= 9.0 ;
        base.rgb *= ( 0.3 + 0.7 * lit ) ;
    }

    //  Toon ramp: dot(N,L) を [0,1] に clamp して ramp texture から色を lookup
    //  Lighting (u_useLighting) と排他で、toon はここで base.rgb を rampColor 側に寄せる。
    if ( u_useToonRamp == 1 ) {
        vec3 Ntoon = normalize( v_normal ) ;
        //  main light direction は eye-space 単位ベクトル (hsp3dx から uniform 経由)
        float ndl = max( dot( Ntoon, u_mainLightDirEye ), 0.0 ) ;
        vec3 rampColor = texture2D( u_toonRamp, vec2( ndl, 0.5 ) ).rgb ;
        //  DxLib CPU 版と同じ "ramp * material diffuse" の乗算
        base.rgb = base.rgb * rampColor ;
    }

    //  Sphere map (MatCap、MMD .sph/.spa / toon 系で使う環境マップ風効果)
    //  eye-space normal の xy を UV として texture 2D sampling。blend mode で混合方法切替
    if ( u_useSphereMap == 1 ) {
        vec2 sphUV = N.xy * 0.5 + 0.5 ;
        vec4 sph = texture2D( u_sphereMap, sphUV ) ;
        if ( u_sphereMapBlend == 0 )      base.rgb = base.rgb * sph.rgb ;           // MULTIPLY (.sph)
        else if ( u_sphereMapBlend == 1 ) base.rgb = base.rgb + sph.rgb * sph.a ;   // ADD (.spa)
        else                               base.rgb = sph.rgb ;                     // REPLACE
    }

    //  Emissive: material 固有の発光 (lighting 非依存で base に加算)
    //  EmissiveMap があれば texture2D の RGB を加算色として採用 (alpha で強度調整)
    vec3 emiColor = u_emissive ;
    if ( u_useEmissiveMap == 1 ) {
        vec4 em = texture2D( u_emissiveMap, uv ) ;
        emiColor = emiColor + em.rgb * em.a ;
    }
    base.rgb = base.rgb + emiColor ;

    //  Fog: gl_Fog 組み込み変数 (start/end/density/color) を使う。
    //  fixed-function と同 API、mode: 0=off, 1=linear, 2=exp, 3=exp2
    if ( u_fogMode > 0 ) {
        float d = length( v_eyePos ) ;   // eye-space 距離
        float f = 1.0 ;
        if ( u_fogMode == 1 ) {
            //  linear
            f = clamp( ( gl_Fog.end - d ) / max( gl_Fog.end - gl_Fog.start, 0.001 ), 0.0, 1.0 ) ;
        } else if ( u_fogMode == 2 ) {
            //  exp
            f = clamp( exp( -gl_Fog.density * d ), 0.0, 1.0 ) ;
        } else if ( u_fogMode == 3 ) {
            //  exp2
            float dd = gl_Fog.density * d ;
            f = clamp( exp( -( dd * dd ) ), 0.0, 1.0 ) ;
        }
        base.rgb = mix( gl_Fog.color.rgb, base.rgb, f ) ;
    }

    gl_FragColor = base ;
}
)GLSL" ;

static int s_MV1_ShaderHandle = 0 ;
static int s_MV1_UseGLSL      = 0 ;   // 0=fixed-function, 1=GLSL 経路

extern "C" int Desktop_MV1_UseGLSLShader( int enable )
{
    s_MV1_UseGLSL = enable ? 1 : 0 ;
    if ( enable && s_MV1_ShaderHandle == 0 ) {
        s_MV1_ShaderHandle = DesktopShader_CompileGLSL( s_mv1_vs, s_mv1_fs ) ;
        if ( s_MV1_ShaderHandle < 0 ) {
            std::fprintf( stderr, "[DxShaderDesktop] MV1 basic shader compile fail\n" ) ;
            s_MV1_UseGLSL = 0 ;
            return -1 ;
        }
    }
    return 0 ;
}

extern "C" int Desktop_MV1_GetShaderHandle( void )
{
    return s_MV1_ShaderHandle ;
}

extern "C" int Desktop_MV1_IsGLSLEnabled( void )
{
    return s_MV1_UseGLSL ;
}
