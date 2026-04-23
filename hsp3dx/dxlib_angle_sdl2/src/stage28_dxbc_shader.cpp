//
// hsp3dx Stage 28: DXBC (.vso/.pso) end-to-end
//
// 目的: DxLib::LoadVertexShader / LoadPixelShader に fxc.exe 出力の DXBC
// binary を読ませ、DxDxbcTranslator が自動で GLSL に変換して描画が通る
// ことを確認する。
//
// フロー:
//   1. embed された tri.vso / tri.pso (fxc -T vs_4_0 / ps_4_0 出力) を
//      ディスクに書き出し
//   2. DxLib::LoadVertexShader("tri.vso") — Shader_Create_PF が DXBC 検知、
//      DxDxbc_Translate で GLSL 変換 → glCompileShader
//   3. SetUseVertexShader / SetUsePixelShader + SetVSConstF で uniform
//   4. 頂点バッファ作成 + DrawPolygon3DToShader_UseVertexBuffer で描画
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

#include "tri_embed.inc"

static void write_file( const char *path, const unsigned char *data, int len )
{
    FILE *f = std::fopen( path, "wb" ) ;
    if ( !f ) return ;
    std::fwrite( data, 1, ( size_t )len, f ) ;
    std::fclose( f ) ;
}

int main( int, char ** )
{
    // 1. Embed された DXBC をディスクに書き出す
    write_file( "tri.vso", tri_vso, tri_vso_len ) ;
    write_file( "tri.pso", tri_pso, tri_pso_len ) ;

    if ( DxLib::DxLib_Init() != 0 ) return 1 ;
    DxLib::SetBackgroundColor( 20, 20, 40 ) ;
    int font = DxLib::CreateFontToHandle( nullptr, 16, -1 ) ;

    // 2. DXBC binary を load — DxDxbcTranslator 経由で GLSL compile される
    int vs = DxLib::LoadVertexShader( "tri.vso" ) ;
    int ps = DxLib::LoadPixelShader(  "tri.pso" ) ;
    std::fprintf( stderr, "[Stage28] LoadVertexShader(tri.vso)=%d  LoadPixelShader(tri.pso)=%d\n",
                  vs, ps ) ;

    // 3. 頂点バッファ (VERTEX3DSHADER) + インデックスバッファ
    int vb = DxLib::CreateVertexBuffer( 3, DX_VERTEX_TYPE_SHADER_3D ) ;
    int ib = DxLib::CreateIndexBuffer( 3, DX_INDEX_TYPE_16BIT ) ;
    DxLib::VERTEX3DSHADER verts[ 3 ] = {} ;
    verts[ 0 ].pos = {  0.0f,  0.7f, 0.5f } ;
    verts[ 1 ].pos = { -0.7f, -0.5f, 0.5f } ;
    verts[ 2 ].pos = {  0.7f, -0.5f, 0.5f } ;
    for ( auto &v : verts ) v.dif = DxLib::GetColorU8( 255, 255, 255, 255 ) ;
    DxLib::SetVertexBufferData( 0, verts, 3, vb ) ;
    unsigned short idx[ 3 ] = { 0, 1, 2 } ;
    DxLib::SetIndexBufferData( 0, idx, 3, ib ) ;

    Uint32 start = SDL_GetTicks() ;
    while ( SDL_GetTicks() - start < 6000 ) {
        SDL_Event ev ; while ( SDL_PollEvent( &ev ) ) { (void)ev ; }
        float t = ( SDL_GetTicks() - start ) / 1000.0f ;

        DxLib::ClearDrawScreen() ;

        if ( vs > 0 && ps > 0 ) {
            DxLib::SetUseVertexShader( vs ) ;
            DxLib::SetUsePixelShader(  ps ) ;
            // cb0[0] = col_tint (from HLSL cbuffer)、時間で色相変化
            DxLib::FLOAT4 tint = {
                0.5f + 0.5f * std::sin( t * 1.3f ),
                0.5f + 0.5f * std::sin( t * 1.7f + 2.0f ),
                0.5f + 0.5f * std::sin( t * 2.1f + 4.0f ),
                1.0f
            } ;
            DxLib::SetVSConstF( 0, tint ) ;
            DxLib::SetPSConstF( 0, tint ) ;
            DxLib::DrawPolygonIndexed3DToShader_UseVertexBuffer( vb, ib ) ;
        }

        DxLib::DrawStringToHandle( 10, 10,
            "Stage 28: DXBC (.vso/.pso) end-to-end via DxDxbcTranslator",
            DxLib::GetColor( 255, 255, 255 ), font ) ;
        char buf[ 128 ] ;
        std::snprintf( buf, sizeof buf, "vs=%d ps=%d t=%.2f", vs, ps, t ) ;
        DxLib::DrawStringToHandle( 10, 32, buf,
            ( vs > 0 && ps > 0 ) ? DxLib::GetColor( 180, 255, 180 )
                                  : DxLib::GetColor( 255, 120, 120 ), font ) ;

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
