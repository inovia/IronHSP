//
// hsp3dx Stage 17: テクスチャテスト (PNG/BMP 不使用、メモリ生成パターン)
//   CreateGraphFromBaseImage で格子模様テクスチャ作成 → DrawGraph で表示
//
#define DX_PLATFORM_DESKTOP_SDL2 1
#define DX_NON_MOVIE           1
#define DX_NON_LIVE2D_CUBISM4  1
#define DX_NON_MODEL           1
#define DX_NON_BULLET_PHYSICS  1
#define DX_NON_FILTER          1
#define DX_NON_MASK            1
#define DX_NON_SOUND           1
#define DX_NON_FONT            1
#define DX_NON_KEYEX           1
#define DX_NON_INPUTSTRING     1

#include "DxLib.h"
#include <SDL.h>
#include <cmath>
#include <cstdio>

int main( int argc, char **argv )
{
    (void)argc; (void)argv;
    if ( DxLib::DxLib_Init() != 0 ) return 1;
    DxLib::SetBackgroundColor( 20, 20, 40 );

    // 128x128 のチェッカーパターンを BASEIMAGE で作成
    DxLib::BASEIMAGE bi;
    DxLib::CreateARGB8ColorBaseImage( 128, 128, &bi );
    for ( int y = 0 ; y < 128 ; ++y )
        for ( int x = 0 ; x < 128 ; ++x )
        {
            int cx = x / 16, cy = y / 16;
            bool dark = ( cx + cy ) & 1;
            int r = dark ? 40 : 220;
            int g = dark ? 40 : 120;
            int b = dark ? 80 : 200;
            DxLib::SetPixelBaseImage( &bi, x, y, r, g, b, 255 );
        }

    int tex = DxLib::CreateGraphFromBaseImage( &bi );
    std::printf( "[Stage17] tex handle = %d\n", tex );

    Uint32 start = SDL_GetTicks();
    while ( SDL_GetTicks() - start < 10000 )
    {
        SDL_Event ev;
        while ( SDL_PollEvent( &ev ) ) { (void)ev; }

        DxLib::ClearDrawScreen();

        float t = ( SDL_GetTicks() - start ) / 1000.0f;

        // 固定位置
        DxLib::DrawGraph( 50, 50, tex, TRUE );
        // 動く
        int mx = 250 + ( int )( 100 * std::sin( t ) );
        DxLib::DrawGraph( mx, 250, tex, TRUE );

        // 3 つ並べる
        for ( int i = 0 ; i < 3 ; ++i )
            DxLib::DrawGraph( 50 + i * 140, 330, tex, TRUE );

        DxLib::ScreenFlip();
    }

    DxLib::DeleteGraph( tex );
    DxLib::ReleaseBaseImage( &bi );
    DxLib::DxLib_End();
    return 0;
}
