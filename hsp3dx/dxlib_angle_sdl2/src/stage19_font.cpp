//
// hsp3dx Stage 19: フォント / DxLib::DrawString テスト (native path)
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

int main( int argc, char **argv )
{
    (void)argc; (void)argv;
    if ( DxLib::DxLib_Init() != 0 ) return 1;
    DxLib::SetBackgroundColor( 20, 20, 40 );

    // フォントハンドルを用途別に作る (DrawString の引数は Color のみ、サイズは Font から)
    int fontL = DxLib::CreateFontToHandle( nullptr, 22, -1 );
    int fontM = DxLib::CreateFontToHandle( nullptr, 18, -1 );
    int fontS = DxLib::CreateFontToHandle( nullptr, 16, -1 );

    Uint32 start = SDL_GetTicks();
    int frame = 0;
    while ( SDL_GetTicks() - start < 10000 )
    {
        SDL_Event ev; while ( SDL_PollEvent( &ev ) ) { (void)ev; }

        DxLib::ClearDrawScreen();
        float t = ( SDL_GetTicks() - start ) / 1000.0f ;

        // ネイティブ DxLib API を使用 (Desktop では SDL_ttf フック経由で描画)
        DxLib::DrawStringToHandle(  50,  50, "Hello, DxLib on Desktop!",     DxLib::GetColor( 255, 255, 255 ), fontL );
        DxLib::DrawStringToHandle(  50,  90, "hsp3dx + SDL2 + SDL2_ttf",     DxLib::GetColor( 255, 200, 120 ), fontM );
        DxLib::DrawStringToHandle(  50, 130, "Windows / Mac / Linux / Web",  DxLib::GetColor( 120, 200, 255 ), fontM );

        char buf[ 128 ];
        std::snprintf( buf, sizeof buf, "time=%.2f  frame=%d", t, frame );
        DxLib::DrawStringToHandle(  50, 180, buf,                            DxLib::GetColor( 180, 255, 180 ), fontS );

        // 日本語
        DxLib::DrawStringToHandle(  50, 230, "日本語テスト 123 ABC",         DxLib::GetColor( 255, 255, 120 ), fontL );

        // 矩形も描画 (混在確認)
        DxLib::DrawFillBox( 50, 280, 590, 330,
                              DxLib::GetColor( 60, 80, 120 ) );
        DxLib::DrawStringToHandle(  60, 295, "mixed with DxLib DrawFillBox", DxLib::GetColor( 255, 255, 255 ), fontS );

        DxLib::ScreenFlip();
        frame++;
    }

    DxLib::DeleteFontToHandle( fontL );
    DxLib::DeleteFontToHandle( fontM );
    DxLib::DeleteFontToHandle( fontS );
    DxLib::DxLib_End();
    return 0;
}
