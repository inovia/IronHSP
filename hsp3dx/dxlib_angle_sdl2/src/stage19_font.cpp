//
// hsp3dx Stage 19: フォント / DrawString テスト
//
#define DX_PLATFORM_DESKTOP_SDL2 1
#define DX_NON_MOVIE 1
#define DX_NON_LIVE2D_CUBISM4 1
#define DX_NON_MODEL 1
#define DX_NON_BULLET_PHYSICS 1
#define DX_NON_FILTER 1
#define DX_NON_MASK 1
#define DX_NON_SOUND 1
#define DX_NON_KEYEX 1
#define DX_NON_INPUTSTRING 1

#include "DxLib.h"
#include <SDL.h>
#include <cstdio>

// バイパス用ヘルパ (Desktop/DxFontDesktop.cpp で提供)
extern "C" int DxDesktop_DrawText( int x, int y, const char *utf8_text,
                                    unsigned char r, unsigned char g, unsigned char b,
                                    int font_pt );

int main( int argc, char **argv )
{
    (void)argc; (void)argv;
    if ( DxLib::DxLib_Init() != 0 ) return 1;
    DxLib::SetBackgroundColor( 20, 20, 40 );

    Uint32 start = SDL_GetTicks();
    int frame = 0;
    while ( SDL_GetTicks() - start < 10000 )
    {
        SDL_Event ev; while ( SDL_PollEvent( &ev ) ) { (void)ev; }

        DxLib::ClearDrawScreen();
        float t = ( SDL_GetTicks() - start ) / 1000.0f ;

        // Desktop 直接バイパス (DxLib の DrawString は font cache 問題で未動作)
        DxDesktop_DrawText( 50,  50, "Hello, DxLib on Desktop!",     255, 255, 255, 22 );
        DxDesktop_DrawText( 50,  90, "hsp3dx + SDL2 + SDL2_ttf",      255, 200, 120, 18 );
        DxDesktop_DrawText( 50, 130, "Windows / Mac / Linux / Web",   120, 200, 255, 18 );

        char buf[ 128 ];
        std::snprintf( buf, sizeof buf, "time=%.2f  frame=%d", t, frame );
        DxDesktop_DrawText( 50, 180, buf,                             180, 255, 180, 16 );

        // 日本語
        DxDesktop_DrawText( 50, 230, "日本語テスト 123 ABC",          255, 255, 120, 22 );

        // 矩形も描画 (混在確認)
        DxLib::DrawFillBox( 50, 280, 590, 330,
                              DxLib::GetColor( 60, 80, 120 ) );
        DxDesktop_DrawText( 60, 295, "mixed with DxLib DrawFillBox", 255, 255, 255, 16 );

        DxLib::ScreenFlip();
        frame++;
    }

    DxLib::DxLib_End();
    return 0;
}
