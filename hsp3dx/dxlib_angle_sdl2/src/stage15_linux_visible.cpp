//
// hsp3dx Stage 15 (Linux / Mac): 60 秒間描画し続けるテスト (WSLg/Mac スクショ撮影用)
// stage8 相当を 60 秒ループ
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
#define DX_NON_INPUT           1

#include "DxLib.h"
#include <SDL.h>
#include <cstdio>

int main( int argc, char **argv )
{
    (void)argc; (void)argv;
    if ( DxLib::DxLib_Init() != 0 ) return 1;
    DxLib::SetBackgroundColor( 20, 20, 30 );

    Uint32 start = SDL_GetTicks();
    int frames = 0;
    while ( SDL_GetTicks() - start < 60000 )
    {
        // SDL event pump はするが SDL_QUIT で exit しない (WSLg 環境で誤発火対策)
        SDL_Event ev;
        while ( SDL_PollEvent( &ev ) ) { (void)ev; }

        DxLib::ClearDrawScreen();

        DxLib::DrawCircle( 120, 120, 60, DxLib::GetColor( 255, 120, 120 ), TRUE );
        DxLib::DrawCircle( 260, 120, 60, DxLib::GetColor( 255, 255, 255 ), FALSE );
        DxLib::DrawOval( 400, 120, 80, 40, DxLib::GetColor( 120, 255, 120 ), TRUE );
        DxLib::DrawOval( 540, 120, 30, 60, DxLib::GetColor( 120, 120, 255 ), TRUE );
        DxLib::DrawTriangle( 80, 280, 180, 280, 130, 360, DxLib::GetColor( 255, 200, 80 ), TRUE );
        DxLib::DrawTriangle( 220, 280, 320, 280, 270, 360, DxLib::GetColor( 255, 255, 255 ), FALSE );
        DxLib::DrawQuadrangle( 400, 280, 460, 320, 400, 360, 340, 320, DxLib::GetColor( 200, 80, 255 ), TRUE );
        DxLib::DrawLineBox( 500, 280, 600, 360, DxLib::GetColor( 80, 255, 255 ) );
        DxLib::DrawFillBox( 50, 400, 130, 440, DxLib::GetColor( 100, 200, 255 ) );
        DxLib::DrawLine( 0, 0, 640, 480, DxLib::GetColor( 120, 120, 120 ) );

        DxLib::ScreenFlip();
        if ( (++frames % 60) == 0 )
            std::printf("[Stage15] %d frames\n", frames);
    }
    DxLib::DxLib_End();
    return 0;
}
