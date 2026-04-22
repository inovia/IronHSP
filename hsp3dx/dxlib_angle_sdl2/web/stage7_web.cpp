//
// hsp3dx angle+sdl2 Stage 13: stage7 の Web 版 (emscripten_set_main_loop 版)
//
// Web ではメインループを async にしないとブラウザが描画しない。
// emscripten_set_main_loop で frame callback 形式に書き直す。
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

static void frame_callback( void )
{
    DxLib::ClearDrawScreen() ;

    int x = ( int )( ( SDL_GetTicks() - g_Start ) / 8 ) % 500 ;
    DxLib::DrawFillBox( 50 + x, 100, 150 + x, 200, DxLib::GetColor( 100, 200, 255 ) ) ;

    DxLib::DrawFillBox( 20,  20,  80,  60,  DxLib::GetColor( 255, 80,  80  ) ) ;
    DxLib::DrawFillBox( 540, 20,  620, 60,  DxLib::GetColor( 80,  255, 80  ) ) ;
    DxLib::DrawFillBox( 20,  420, 80,  460, DxLib::GetColor( 80,  80,  255 ) ) ;
    DxLib::DrawFillBox( 540, 420, 620, 460, DxLib::GetColor( 255, 255, 80  ) ) ;

    DxLib::DrawLine( 0, 0, 640, 480, DxLib::GetColor( 255, 255, 255 ) ) ;
    DxLib::DrawLine( 640, 0, 0, 480, DxLib::GetColor( 255, 255, 255 ) ) ;

    DxLib::ScreenFlip() ;
}

int main( int argc, char **argv )
{
    (void)argc; (void)argv;

    std::printf( "[Stage7Web] DxLib_Init...\n" ); std::fflush( stdout );
    if ( DxLib::DxLib_Init() != 0 ) return 1;
    DxLib::SetBackgroundColor( 30, 30, 60 ) ;
    g_Start = SDL_GetTicks() ;

    std::printf( "[Stage7Web] Starting main loop (60fps)\n" ); std::fflush( stdout );
    emscripten_set_main_loop( frame_callback, 0 /* use rAF */, 1 /* block */ ) ;
    return 0;
}
