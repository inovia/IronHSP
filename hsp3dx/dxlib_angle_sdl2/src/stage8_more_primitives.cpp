//
// hsp3dx angle+sdl2 Stage 8: 追加の 2D primitive を動かす
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
#include <cstdio>

int main( int argc, char **argv )
{
    (void)argc; (void)argv;

    if ( DxLib::DxLib_Init() != 0 ) return 1;

    DxLib::SetBackgroundColor( 20, 20, 30 ) ;

    Uint32 start = SDL_GetTicks();
    int    frame = 0;
    while ( SDL_GetTicks() - start < 5000 )
    {
        SDL_Event ev;
        while ( SDL_PollEvent( &ev ) )
            if ( ev.type == SDL_QUIT ) goto END;

        DxLib::ClearDrawScreen() ;

        float t = ( SDL_GetTicks() - start ) / 1000.0f ;

        // Circle 塗りつぶし
        DxLib::DrawCircle( 120, 120, 60, DxLib::GetColor( 255, 120, 120 ), TRUE ) ;
        // Circle 枠のみ
        DxLib::DrawCircle( 260, 120, 60, DxLib::GetColor( 255, 255, 255 ), FALSE ) ;

        // Oval 塗りつぶし (横長/縦長)
        DxLib::DrawOval( 400, 120, 80, 40, DxLib::GetColor( 120, 255, 120 ), TRUE ) ;
        DxLib::DrawOval( 540, 120, 30, 60, DxLib::GetColor( 120, 120, 255 ), TRUE ) ;

        // Triangle
        DxLib::DrawTriangle( 80, 280, 180, 280, 130, 360, DxLib::GetColor( 255, 200, 80 ), TRUE ) ;
        DxLib::DrawTriangle( 220, 280, 320, 280, 270, 360, DxLib::GetColor( 255, 255, 255 ), FALSE ) ;

        // Quadrangle (ひし形)
        DxLib::DrawQuadrangle( 400, 280, 460, 320, 400, 360, 340, 320,
                               DxLib::GetColor( 200, 80, 255 ), TRUE ) ;

        // LineBox (枠)
        DxLib::DrawLineBox( 500, 280, 600, 360, DxLib::GetColor( 80, 255, 255 ) ) ;

        // 動く FillBox (Stage 7 の再掲)
        int x = ( int )( t * 80 ) % 500 ;
        DxLib::DrawFillBox( 50 + x, 400, 130 + x, 440,
                            DxLib::GetColor( 100, 200, 255 ) ) ;

        // 対角線
        DxLib::DrawLine( 0, 0, 640, 480, DxLib::GetColor( 120, 120, 120 ) ) ;

        DxLib::ScreenFlip() ;
        frame++;
    }
END:
    std::printf( "[Stage8] rendered %d frames\n", frame );
    DxLib::DxLib_End() ;
    return 0;
}
