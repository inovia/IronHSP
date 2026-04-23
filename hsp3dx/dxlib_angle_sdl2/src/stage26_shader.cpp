//
// hsp3dx Stage 26: DxLib Shader API (GLSL source 経路) の動作確認
//
// LoadVertexShader / LoadPixelShader / SetUseVertexShader / SetUsePixelShader /
// SetVSConstF / DrawPolygonIndexed3DToShader_UseVertexBuffer の一連を
// GLSL ソースで動かす。
//
// 使い方: stage26_shader.exe
//   実行時に同梱 GLSL を .vert / .frag として書き出し、DxLib::LoadVertexShader
//   / LoadPixelShader でそれを読み込む。
//
#define DX_PLATFORM_DESKTOP_SDL2 1
#define DX_NON_LIVE2D_CUBISM4 1
#define DX_NON_BULLET_PHYSICS 1
#define DX_NON_FILTER 1
#define DX_NON_KEYEX 1
#define DX_NON_INPUTSTRING 1

#include "DxLib.h"
#include <SDL.h>
#include <cstdio>
#include <cstring>
#include <cmath>

static const char *g_vs = R"(
#version 120
attribute vec3 a_position ;
attribute vec2 a_texCoord ;
attribute vec4 a_color ;
uniform vec4 vs_c[256] ;    // vs_c[0].xyzw = (time, _, _, _)、残りは未使用
varying vec2 v_uv ;
varying vec4 v_col ;
void main()
{
    float t = vs_c[0].x ;
    float s = sin( t ) * 0.3 + 1.0 ;
    gl_Position = vec4( a_position.xy * s, a_position.z, 1.0 ) ;
    v_uv  = a_texCoord ;
    v_col = a_color ;
}
)" ;

static const char *g_fs = R"(
#version 120
uniform vec4 ps_c[256] ;    // ps_c[0] = base tint
varying vec2 v_uv ;
varying vec4 v_col ;
void main()
{
    vec3 tint = ps_c[0].rgb ;
    gl_FragColor = vec4( v_col.rgb * tint, 1.0 ) ;
}
)" ;

static void write_file( const char *path, const char *data )
{
    FILE *f = std::fopen( path, "wb" ) ;
    if ( !f ) return ;
    std::fwrite( data, 1, std::strlen( data ), f ) ;
    std::fclose( f ) ;
}

int main( int, char ** )
{
    write_file( "stage26.vert", g_vs ) ;
    write_file( "stage26.frag", g_fs ) ;

    if ( DxLib::DxLib_Init() != 0 ) return 1 ;
    DxLib::SetBackgroundColor( 10, 10, 20 ) ;
    int font = DxLib::CreateFontToHandle( nullptr, 16, -1 ) ;

    int vs = DxLib::LoadVertexShader( "stage26.vert" ) ;
    int ps = DxLib::LoadPixelShader( "stage26.frag" ) ;
    std::fprintf( stderr, "[Stage26] LoadVertexShader=%d LoadPixelShader=%d\n", vs, ps ) ;

    // 頂点バッファ作成 (VERTEX3DSHADER、3 頂点のカラー三角形)
    int vb = DxLib::CreateVertexBuffer( 3, DX_VERTEX_TYPE_SHADER_3D ) ;
    int ib = DxLib::CreateIndexBuffer( 3, DX_INDEX_TYPE_16BIT ) ;
    DxLib::VERTEX3DSHADER verts[ 3 ] = {} ;
    verts[ 0 ].pos = {  0.0f,  0.8f, 0.5f } ; verts[ 0 ].dif = DxLib::GetColorU8( 255, 80, 80, 255 ) ;
    verts[ 1 ].pos = { -0.8f, -0.6f, 0.5f } ; verts[ 1 ].dif = DxLib::GetColorU8( 80, 255, 80, 255 ) ;
    verts[ 2 ].pos = {  0.8f, -0.6f, 0.5f } ; verts[ 2 ].dif = DxLib::GetColorU8( 80, 80, 255, 255 ) ;
    DxLib::SetVertexBufferData( 0, verts, 3, vb ) ;
    unsigned short idx[ 3 ] = { 0, 1, 2 } ;
    DxLib::SetIndexBufferData( 0, idx, 3, ib ) ;

    Uint32 start = SDL_GetTicks() ;
    while ( SDL_GetTicks() - start < 6000 ) {
        SDL_Event ev ; while ( SDL_PollEvent( &ev ) ) { (void)ev ; }
        float t = ( SDL_GetTicks() - start ) / 1000.0f ;

        DxLib::ClearDrawScreen() ;

        // 定数を設定 (時刻 + tint)
        DxLib::SetUseVertexShader( vs ) ;
        DxLib::SetUsePixelShader(  ps ) ;
        DxLib::FLOAT4 vsc0 = { t, 0, 0, 0 } ;
        DxLib::FLOAT4 psc0 = {
            0.5f + 0.5f * std::sin( t * 1.2f ),
            0.5f + 0.5f * std::sin( t * 1.5f + 2.0f ),
            0.5f + 0.5f * std::sin( t * 1.7f + 4.0f ),
            1.0f
        } ;
        DxLib::SetVSConstF( 0, vsc0 ) ;
        DxLib::SetPSConstF( 0, psc0 ) ;

        // 三角形を描画
        DxLib::DrawPolygonIndexed3DToShader_UseVertexBuffer( vb, ib ) ;

        DxLib::DrawStringToHandle( 10, 10,
            "Stage 26: DxLib::LoadVertexShader + LoadPixelShader (GLSL source 経路)",
            DxLib::GetColor( 255, 255, 255 ), font ) ;
        char buf[ 128 ] ;
        std::snprintf( buf, sizeof buf, "vs_h=%d ps_h=%d t=%.2f", vs, ps, t ) ;
        DxLib::DrawStringToHandle( 10, 32, buf, DxLib::GetColor( 180, 255, 180 ), font ) ;

        DxLib::ScreenFlip() ;
    }

    if ( vb > 0 ) DxLib::DeleteVertexBuffer( vb ) ;
    if ( ib > 0 ) DxLib::DeleteIndexBuffer( ib ) ;
    if ( vs > 0 ) DxLib::DeleteShader( vs ) ;
    if ( ps > 0 ) DxLib::DeleteShader( ps ) ;
    DxLib::DeleteFontToHandle( font ) ;
    DxLib::DxLib_End() ;
    return 0 ;
}
