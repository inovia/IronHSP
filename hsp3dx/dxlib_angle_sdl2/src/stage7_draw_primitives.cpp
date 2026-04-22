//
// hsp3dx angle+sdl2 Stage 7: DxLib::DrawFillBox / DrawLine / DrawPixel を
//                             実際に画面に描画する (GL compat fixed-func 経由)
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

    std::printf( "[Stage7] DxLib_Init...\n" ); std::fflush( stdout );
    if ( DxLib::DxLib_Init() != 0 ) return 1;

    DxLib::SetBackgroundColor( 30, 30, 60 ) ;

    Uint32 start = SDL_GetTicks();
    int    frame = 0;
    while ( SDL_GetTicks() - start < 4000 )
    {
        SDL_Event ev;
        while ( SDL_PollEvent( &ev ) )
            if ( ev.type == SDL_QUIT ) goto END;

        DxLib::ClearDrawScreen() ;

        // 左右に流れる水色の矩形
        int x = ( int )( ( SDL_GetTicks() - start ) / 8 ) % 500 ;
        DxLib::DrawFillBox( 50 + x, 100, 150 + x, 200, DxLib::GetColor( 100, 200, 255 ) ) ;

        // 四隅に異なる色の矩形
        DxLib::DrawFillBox( 20,  20,  80,  60,  DxLib::GetColor( 255, 80,  80  ) ) ;
        DxLib::DrawFillBox( 540, 20,  620, 60,  DxLib::GetColor( 80,  255, 80  ) ) ;
        DxLib::DrawFillBox( 20,  420, 80,  460, DxLib::GetColor( 80,  80,  255 ) ) ;
        DxLib::DrawFillBox( 540, 420, 620, 460, DxLib::GetColor( 255, 255, 80  ) ) ;

        // 中央に対角線
        DxLib::DrawLine( 0, 0, 640, 480, DxLib::GetColor( 255, 255, 255 ) ) ;
        DxLib::DrawLine( 640, 0, 0, 480, DxLib::GetColor( 255, 255, 255 ) ) ;

        DxLib::ScreenFlip() ;
        frame++;
    }
END:
    std::printf( "[Stage7] rendered %d frames, DxLib_End...\n", frame ); std::fflush( stdout );
    DxLib::DxLib_End() ;
    std::printf( "[Stage7] Done.\n" );
    return 0;
}
