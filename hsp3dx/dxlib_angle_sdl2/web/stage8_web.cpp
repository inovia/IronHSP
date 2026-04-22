//
// hsp3dx Stage 14 (Web): stage8 の emscripten 版
//   DrawCircle / DrawOval / DrawTriangle / DrawQuadrangle / DrawLineBox
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
#include <emscripten.h>
#include <cstdio>

static Uint32 g_Start = 0 ;

static void frame( void )
{
    DxLib::ClearDrawScreen() ;
    float t = ( SDL_GetTicks() - g_Start ) / 1000.0f ;

    DxLib::DrawCircle( 120, 120, 60, DxLib::GetColor( 255, 120, 120 ), TRUE ) ;
    DxLib::DrawCircle( 260, 120, 60, DxLib::GetColor( 255, 255, 255 ), FALSE ) ;

    DxLib::DrawOval( 400, 120, 80, 40, DxLib::GetColor( 120, 255, 120 ), TRUE ) ;
    DxLib::DrawOval( 540, 120, 30, 60, DxLib::GetColor( 120, 120, 255 ), TRUE ) ;

    DxLib::DrawTriangle( 80, 280, 180, 280, 130, 360, DxLib::GetColor( 255, 200, 80 ), TRUE ) ;
    DxLib::DrawTriangle( 220, 280, 320, 280, 270, 360, DxLib::GetColor( 255, 255, 255 ), FALSE ) ;

    DxLib::DrawQuadrangle( 400, 280, 460, 320, 400, 360, 340, 320,
                           DxLib::GetColor( 200, 80, 255 ), TRUE ) ;

    DxLib::DrawLineBox( 500, 280, 600, 360, DxLib::GetColor( 80, 255, 255 ) ) ;

    int x = ( int )( t * 80 ) % 500 ;
    DxLib::DrawFillBox( 50 + x, 400, 130 + x, 440, DxLib::GetColor( 100, 200, 255 ) ) ;

    DxLib::DrawLine( 0, 0, 640, 480, DxLib::GetColor( 120, 120, 120 ) ) ;

    DxLib::ScreenFlip() ;
}

int main( int argc, char **argv )
{
    (void)argc; (void)argv;
    std::printf( "[Stage8Web] DxLib_Init...\n" ); std::fflush( stdout );
    if ( DxLib::DxLib_Init() != 0 ) return 1;
    DxLib::SetBackgroundColor( 20, 20, 30 ) ;
    g_Start = SDL_GetTicks() ;
    std::printf( "[Stage8Web] Starting main loop\n" ); std::fflush( stdout );
    emscripten_set_main_loop( frame, 0, 1 ) ;
    return 0;
}
