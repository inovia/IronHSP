//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop Live2D Cubism4 shader 実装
//
//      DxUseCLibLive2DCubism4.cpp 内の D_CubismShader_DxLib::LoadShaderProgram()
//      を GLSL shader compile で実装。 DxLib 本家 Win/iOS/Android は HLSL/GLSL
//      バイナリ shader を .a/.lib に埋め込んでいるが、Desktop SDL2 fork は
//      source を埋め込んで実行時 compile する方式。
//
//      CubismFramework の Rendering/OpenGL 標準 shader (GLES2 #version 120)
//      を 6 種 compile し、7 個の shader name 枠 (SetupMask + 6 Normal 系変種)
//      に handle を配る。Add/Mult 系 (enum 7..18) は SetupShader_PF 側で
//      blend 状態のみ切り替え同 shader を再利用する (Normal と同 handle)。
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#ifdef _WIN32
#include <windows.h>
#endif

#include <cstdio>

#include "../DxCompileConfig.h"

#ifndef DX_NON_LIVE2D_CUBISM4

#include "../DxLib.h"
#include "../DxUseCLibLive2DCubism4.h"

extern "C" int DesktopShader_CompileGLSL( const char *vs_src, const char *fs_src ) ;

// ---------------------------------------------------------------------------
// 埋込 GLSL source (CubismFramework の Rendering/OpenGL/Shaders/Standard/ 由来、
// CubismPubliclyLicensedLive2DSdk_ja の Live2D Open Software license に準拠)
// ---------------------------------------------------------------------------

static const char *VS_NORMAL = R"GLSL(#ifdef GL_ES
precision mediump float;
#endif
attribute vec4 a_position;
attribute vec2 a_texCoord;
varying vec2 v_texCoord;
uniform mat4 u_matrix;
void main() {
    gl_Position = u_matrix * a_position;
    v_texCoord = a_texCoord;
    v_texCoord.y = 1.0 - v_texCoord.y;
}
)GLSL" ;

static const char *VS_MASKED = R"GLSL(#ifdef GL_ES
precision mediump float;
#endif
attribute vec4 a_position;
attribute vec2 a_texCoord;
varying vec2 v_texCoord;
varying vec4 v_clipPos;
uniform mat4 u_matrix;
uniform mat4 u_clipMatrix;
void main() {
    gl_Position = u_matrix * a_position;
    v_clipPos = u_clipMatrix * a_position;
    v_texCoord = a_texCoord;
    v_texCoord.y = 1.0 - v_texCoord.y;
}
)GLSL" ;

static const char *VS_SETUP_MASK = R"GLSL(#ifdef GL_ES
precision mediump float;
#endif
attribute vec4 a_position;
attribute vec2 a_texCoord;
varying vec2 v_texCoord;
varying vec4 v_myPos;
uniform mat4 u_clipMatrix;
void main() {
    gl_Position = u_clipMatrix * a_position;
    v_myPos = u_clipMatrix * a_position;
    v_texCoord = a_texCoord;
    v_texCoord.y = 1.0 - v_texCoord.y;
}
)GLSL" ;

static const char *FS_SETUP_MASK = R"GLSL(#ifdef GL_ES
precision mediump float;
#endif
varying vec2 v_texCoord;
varying vec4 v_myPos;
uniform sampler2D s_texture0;
uniform vec4 u_channelFlag;
uniform vec4 u_baseColor;
void main() {
    float isInside =
        step(u_baseColor.x, v_myPos.x/v_myPos.w)
      * step(u_baseColor.y, v_myPos.y/v_myPos.w)
      * step(v_myPos.x/v_myPos.w, u_baseColor.z)
      * step(v_myPos.y/v_myPos.w, u_baseColor.w);
    gl_FragColor = u_channelFlag * texture2D(s_texture0, v_texCoord).a * isInside;
}
)GLSL" ;

static const char *FS_NORMAL = R"GLSL(#ifdef GL_ES
precision mediump float;
#endif
varying vec2 v_texCoord;
uniform sampler2D s_texture0;
uniform vec4 u_baseColor;
uniform vec4 u_multiplyColor;
uniform vec4 u_screenColor;
void main() {
    vec4 texColor = texture2D(s_texture0, v_texCoord);
    texColor.rgb = texColor.rgb * u_multiplyColor.rgb;
    texColor.rgb = texColor.rgb + u_screenColor.rgb - (texColor.rgb * u_screenColor.rgb);
    vec4 color = texColor * u_baseColor;
    gl_FragColor = vec4(color.rgb * color.a, color.a);
}
)GLSL" ;

static const char *FS_NORMAL_PA = R"GLSL(#ifdef GL_ES
precision mediump float;
#endif
varying vec2 v_texCoord;
uniform sampler2D s_texture0;
uniform vec4 u_baseColor;
uniform vec4 u_multiplyColor;
uniform vec4 u_screenColor;
void main() {
    vec4 texColor = texture2D(s_texture0, v_texCoord);
    texColor.rgb = texColor.rgb * u_multiplyColor.rgb;
    texColor.rgb = (texColor.rgb + u_screenColor.rgb * texColor.a) - (texColor.rgb * u_screenColor.rgb);
    gl_FragColor = texColor * u_baseColor;
}
)GLSL" ;

static const char *FS_MASK = R"GLSL(#ifdef GL_ES
precision mediump float;
#endif
varying vec2 v_texCoord;
varying vec4 v_clipPos;
uniform sampler2D s_texture0;
uniform sampler2D s_texture1;
uniform vec4 u_channelFlag;
uniform vec4 u_baseColor;
uniform vec4 u_multiplyColor;
uniform vec4 u_screenColor;
void main() {
    vec4 texColor = texture2D(s_texture0, v_texCoord);
    texColor.rgb = texColor.rgb * u_multiplyColor.rgb;
    texColor.rgb = texColor.rgb + u_screenColor.rgb - (texColor.rgb * u_screenColor.rgb);
    vec4 col_formask = texColor * u_baseColor;
    col_formask.rgb = col_formask.rgb * col_formask.a;
    vec4 clipMask = (1.0 - texture2D(s_texture1, v_clipPos.xy / v_clipPos.w)) * u_channelFlag;
    float maskVal = clipMask.r + clipMask.g + clipMask.b + clipMask.a;
    gl_FragColor = col_formask * maskVal;
}
)GLSL" ;

static const char *FS_MASK_INV = R"GLSL(#ifdef GL_ES
precision mediump float;
#endif
varying vec2 v_texCoord;
varying vec4 v_clipPos;
uniform sampler2D s_texture0;
uniform sampler2D s_texture1;
uniform vec4 u_channelFlag;
uniform vec4 u_baseColor;
uniform vec4 u_multiplyColor;
uniform vec4 u_screenColor;
void main() {
    vec4 texColor = texture2D(s_texture0, v_texCoord);
    texColor.rgb = texColor.rgb * u_multiplyColor.rgb;
    texColor.rgb = texColor.rgb + u_screenColor.rgb - (texColor.rgb * u_screenColor.rgb);
    vec4 col_formask = texColor * u_baseColor;
    col_formask.rgb = col_formask.rgb * col_formask.a;
    vec4 clipMask = (1.0 - texture2D(s_texture1, v_clipPos.xy / v_clipPos.w)) * u_channelFlag;
    float maskVal = clipMask.r + clipMask.g + clipMask.b + clipMask.a;
    gl_FragColor = col_formask * (1.0 - maskVal);
}
)GLSL" ;

static const char *FS_MASK_PA = R"GLSL(#ifdef GL_ES
precision mediump float;
#endif
varying vec2 v_texCoord;
varying vec4 v_clipPos;
uniform sampler2D s_texture0;
uniform sampler2D s_texture1;
uniform vec4 u_channelFlag;
uniform vec4 u_baseColor;
uniform vec4 u_multiplyColor;
uniform vec4 u_screenColor;
void main() {
    vec4 texColor = texture2D(s_texture0, v_texCoord);
    texColor.rgb = texColor.rgb * u_multiplyColor.rgb;
    texColor.rgb = (texColor.rgb + u_screenColor.rgb * texColor.a) - (texColor.rgb * u_screenColor.rgb);
    vec4 col_formask = texColor * u_baseColor;
    vec4 clipMask = (1.0 - texture2D(s_texture1, v_clipPos.xy / v_clipPos.w)) * u_channelFlag;
    float maskVal = clipMask.r + clipMask.g + clipMask.b + clipMask.a;
    gl_FragColor = col_formask * maskVal;
}
)GLSL" ;

static const char *FS_MASK_INV_PA = R"GLSL(#ifdef GL_ES
precision mediump float;
#endif
varying vec2 v_texCoord;
varying vec4 v_clipPos;
uniform sampler2D s_texture0;
uniform sampler2D s_texture1;
uniform vec4 u_channelFlag;
uniform vec4 u_baseColor;
uniform vec4 u_multiplyColor;
uniform vec4 u_screenColor;
void main() {
    vec4 texColor = texture2D(s_texture0, v_texCoord);
    texColor.rgb = texColor.rgb * u_multiplyColor.rgb;
    texColor.rgb = (texColor.rgb + u_screenColor.rgb * texColor.a) - (texColor.rgb * u_screenColor.rgb);
    vec4 col_formask = texColor * u_baseColor;
    vec4 clipMask = (1.0 - texture2D(s_texture1, v_clipPos.xy / v_clipPos.w)) * u_channelFlag;
    float maskVal = clipMask.r + clipMask.g + clipMask.b + clipMask.a;
    gl_FragColor = col_formask * (1.0 - maskVal);
}
)GLSL" ;

// ---------------------------------------------------------------------------
// shader handle テーブル (Desktop 専用のキャッシュ)
// 各 D_ShaderNames に対応する shader program handle。Add/Mult 系は
// Normal 系と同 handle を共有する。SetupShader_PF から参照される。
// ---------------------------------------------------------------------------

static int g_cubism_shader_handles[ D_ShaderNames_Max ] = { 0 } ;

extern "C" int Desktop_CubismShader_GetHandle( int shaderName )
{
    if ( shaderName < 0 || shaderName >= D_ShaderNames_Max ) return 0 ;
    return g_cubism_shader_handles[ shaderName ] ;
}

// 各 shader name を (vert_src, frag_src) に map してコンパイル
static int compile_for_name( int shaderName )
{
    const char *vs = nullptr ;
    const char *fs = nullptr ;
    switch ( shaderName ) {
    case D_ShaderNames_SetupMask:
        vs = VS_SETUP_MASK ; fs = FS_SETUP_MASK ; break ;

    case D_ShaderNames_Normal:
    case D_ShaderNames_Add:
    case D_ShaderNames_Mult:
        vs = VS_NORMAL ; fs = FS_NORMAL ; break ;

    case D_ShaderNames_NormalPremultipliedAlpha:
    case D_ShaderNames_AddPremultipliedAlpha:
    case D_ShaderNames_MultPremultipliedAlpha:
        vs = VS_NORMAL ; fs = FS_NORMAL_PA ; break ;

    case D_ShaderNames_NormalMasked:
    case D_ShaderNames_AddMasked:
    case D_ShaderNames_MultMasked:
        vs = VS_MASKED ; fs = FS_MASK ; break ;

    case D_ShaderNames_NormalMaskedInverted:
    case D_ShaderNames_AddMaskedInverted:
    case D_ShaderNames_MultMaskedInverted:
        vs = VS_MASKED ; fs = FS_MASK_INV ; break ;

    case D_ShaderNames_NormalMaskedPremultipliedAlpha:
    case D_ShaderNames_AddMaskedPremultipliedAlpha:
    case D_ShaderNames_MultMaskedPremultipliedAlpha:
        vs = VS_MASKED ; fs = FS_MASK_PA ; break ;

    case D_ShaderNames_NormalMaskedInvertedPremultipliedAlpha:
    case D_ShaderNames_AddMaskedInvertedPremultipliedAlpha:
    case D_ShaderNames_MultMaskedInvertedPremultipliedAlpha:
        vs = VS_MASKED ; fs = FS_MASK_INV_PA ; break ;

    default: return 0 ;
    }
    int h = DesktopShader_CompileGLSL( vs, fs ) ;
    return ( h > 0 ) ? h : 0 ;
}

// ---------------------------------------------------------------------------
// D_CubismShader_DxLib::LoadShaderProgram 実装
// DxLib の GenerateShaders() から各 shader name につき VS 1回 / PS 1回の計
// 2 回呼ばれる。Desktop GLSL は VS+FS を一つの program に link する仕組みの
// ため、最初の呼び出しで compile + link を行い、2 回目はキャッシュを返す。
// _shaderSetsVS[assign] / _shaderSetsPS[assign] の両方に同 handle を保存。
// ---------------------------------------------------------------------------

bool D_CubismShader_DxLib::LoadShaderProgram( bool isPs, int assign, const char * /*entryPoint*/ )
{
    if ( assign < 0 || assign >= D_ShaderNames_Max ) return false ;

    // 既に compile 済ならキャッシュ handle を反映して即 OK
    if ( g_cubism_shader_handles[ assign ] > 0 ) {
        if ( isPs ) _shaderSetsPS[ assign ] = g_cubism_shader_handles[ assign ] ;
        else        _shaderSetsVS[ assign ] = g_cubism_shader_handles[ assign ] ;
        return true ;
    }

    int h = compile_for_name( assign ) ;
    if ( h <= 0 ) {
        std::fprintf( stderr, "[Cubism4] shader compile failed: assign=%d\n", assign ) ;
        return false ;
    }
    g_cubism_shader_handles[ assign ] = h ;

    // 両 slot に同じ handle (VS/PS 分離を要求しない GL 構造に合わせる)
    _shaderSetsVS[ assign ] = h ;
    _shaderSetsPS[ assign ] = h ;
    return true ;
}

#endif // DX_NON_LIVE2D_CUBISM4
