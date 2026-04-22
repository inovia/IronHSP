//
// hsp3dx angle+sdl2 Stage 6: DxLib_Init で実際に窓を開いて DxLib 経由で clear
//
//  期待する動作:
//    DxLib_Init() → SDL2 window + GL ES context 作成
//    SetBackgroundColor で色指定
//    ClearDrawScreen → glClear
//    ScreenFlip → SDL_GL_SwapWindow
//    DxLib_End で破棄
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

    std::printf( "[Stage6] DxLib_Init...\n" ); std::fflush( stdout );
    if ( DxLib::DxLib_Init() != 0 ) {
        std::printf( "[Stage6] DxLib_Init failed\n" );
        return 1;
    }

    DxLib::SetBackgroundColor( 30, 80, 180 ) ;

    // 3 秒間回し続ける
    Uint32 start = SDL_GetTicks();
    int    frame = 0;
    while ( SDL_GetTicks() - start < 3000 )
    {
        // ProcessMessage 相当 (SDL event pump)
        SDL_Event ev;
        while ( SDL_PollEvent( &ev ) )
        {
            if ( ev.type == SDL_QUIT ) goto END_LOOP;
        }

        DxLib::ClearDrawScreen() ;
        DxLib::ScreenFlip() ;
        frame++;
    }
END_LOOP:

    std::printf( "[Stage6] rendered %d frames, DxLib_End...\n", frame ); std::fflush( stdout );
    DxLib::DxLib_End() ;
    std::printf( "[Stage6] Done.\n" );
    return 0;
}
