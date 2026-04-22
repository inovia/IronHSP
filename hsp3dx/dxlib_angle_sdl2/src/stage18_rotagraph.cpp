//
// hsp3dx Stage 18: DrawRotaGraph / DrawExtendGraph
//
#define DX_PLATFORM_DESKTOP_SDL2 1
#define DX_NON_MOVIE 1
#define DX_NON_LIVE2D_CUBISM4 1
#define DX_NON_MODEL 1
#define DX_NON_BULLET_PHYSICS 1
#define DX_NON_FILTER 1
#define DX_NON_MASK 1
#define DX_NON_SOUND 1
#define DX_NON_FONT 1
#define DX_NON_KEYEX 1
#define DX_NON_INPUTSTRING 1

#include "DxLib.h"
#include <SDL.h>
#include <cmath>
#include <cstdio>

int main( int argc, char **argv )
{
    (void)argc; (void)argv;
    if ( DxLib::DxLib_Init() != 0 ) return 1;
    DxLib::SetBackgroundColor( 20, 20, 40 );

    // 64x64 カラフル放射状パターン
    DxLib::BASEIMAGE bi;
    DxLib::CreateARGB8ColorBaseImage( 64, 64, &bi );
    for ( int y = 0 ; y < 64 ; ++y )
        for ( int x = 0 ; x < 64 ; ++x )
        {
            int dx = x - 32, dy = y - 32;
            float ang = std::atan2( ( float )dy, ( float )dx ) + 3.14159f ;  // 0..2pi
            float dist = std::sqrt( ( float )( dx*dx + dy*dy ) );
            int r = ( int )( 128 + 127 * std::sin( ang * 3 ) );
            int g = ( int )( 128 + 127 * std::sin( ang * 3 + 2.0f ) );
            int b = ( int )( 128 + 127 * std::sin( ang * 3 + 4.0f ) );
            int a = dist > 30 ? 0 : 255;  // 丸くくり抜く
            DxLib::SetPixelBaseImage( &bi, x, y, r, g, b, a );
        }
    int tex = DxLib::CreateGraphFromBaseImage( &bi );

    Uint32 start = SDL_GetTicks();
    while ( SDL_GetTicks() - start < 15000 )
    {
        SDL_Event ev;
        while ( SDL_PollEvent( &ev ) ) { (void)ev; }

        DxLib::ClearDrawScreen();
        float t = ( SDL_GetTicks() - start ) / 1000.0f;

        // DrawExtendGraph: 左上に大きめ
        DxLib::DrawExtendGraph( 20, 20, 220, 150, tex, TRUE );

        // DrawRotaGraph: 複数回転
        for ( int i = 0 ; i < 6 ; ++i )
        {
            int x = 300 + ( i % 3 ) * 100;
            int y = 60 + ( i / 3 ) * 100;
            double angle = t + i * 0.5;
            double scale = 1.0 + 0.3 * std::sin( t * 2 + i );
            DxLib::DrawRotaGraph( x, y, scale, angle, tex, TRUE );
        }

        // 中央で大きく回転
        DxLib::DrawRotaGraph( 320, 330, 2.5, t, tex, TRUE );

        DxLib::ScreenFlip();
    }

    DxLib::DeleteGraph( tex );
    DxLib::ReleaseBaseImage( &bi );
    DxLib::DxLib_End();
    return 0;
}
