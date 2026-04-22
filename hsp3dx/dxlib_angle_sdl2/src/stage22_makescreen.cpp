//
// hsp3dx Stage 22: MakeScreen + SetDrawScreen (offscreen render-to-texture)
//
#define DX_PLATFORM_DESKTOP_SDL2 1
#define DX_NON_MOVIE 1
#define DX_NON_LIVE2D_CUBISM4 1
#define DX_NON_MODEL 1
#define DX_NON_BULLET_PHYSICS 1
#define DX_NON_FILTER 1
#define DX_NON_MASK 1
#define DX_NON_KEYEX 1
#define DX_NON_INPUTSTRING 1

#include "DxLib.h"
#include <SDL.h>
#include <cstdio>
#include <cmath>

int main( int argc, char **argv )
{
    (void)argc; (void)argv;
    if ( DxLib::DxLib_Init() != 0 ) return 1;
    DxLib::SetBackgroundColor( 20, 30, 40 );

    // 256x256 のオフスクリーンバッファを作成
    int offscreen = DxLib::MakeScreen( 256, 256, FALSE );
    std::fprintf( stderr, "[Stage22] MakeScreen handle = %d\n", offscreen );

    int fontM = DxLib::CreateFontToHandle( nullptr, 18, -1 );

    Uint32 start = SDL_GetTicks();
    int frame = 0;
    while ( SDL_GetTicks() - start < 10000 )
    {
        SDL_Event ev; while ( SDL_PollEvent( &ev ) ) { (void)ev; }
        float t = ( SDL_GetTicks() - start ) / 1000.0f;

        // --- Phase 1: オフスクリーンへ描画 -----------------
        DxLib::SetDrawScreen( offscreen );
        // クリアは SetBackgroundColor と ClearDrawScreen で
        DxLib::ClearDrawScreen();
        // 赤い矩形 + 黄色い円 を offscreen に描く
        DxLib::DrawFillBox( 10, 10, 246, 246, DxLib::GetColor( 80, 40, 40 ) );
        DxLib::DrawCircle( 128, 128, 60 + ( int )( 20 * std::sin( t * 2 ) ),
                            DxLib::GetColor( 255, 220, 80 ), TRUE );
        DxLib::DrawStringToHandle( 20, 110, "Offscreen!",
            DxLib::GetColor( 255, 255, 255 ), fontM );

        // --- Phase 2: バックバッファに戻して、offscreen を使って描画 ---
        DxLib::SetDrawScreen( DX_SCREEN_BACK );
        DxLib::ClearDrawScreen();

        DxLib::DrawStringToHandle( 20, 20, "Stage 22: MakeScreen + SetDrawScreen",
            DxLib::GetColor( 255, 255, 255 ), fontM );

        // 固定位置で offscreen を表示
        DxLib::DrawGraph( 20, 60, offscreen, TRUE );

        // 縮小版を右に 3 つ並べる (ミニマップ風)
        for ( int i = 0 ; i < 3 ; ++i ) {
            DxLib::DrawExtendGraph( 300, 60 + i * 90, 400, 140 + i * 90, offscreen, TRUE );
        }

        // 回転拡大したやつ
        double sc = 0.3 + 0.1 * std::sin( t * 3 );
        DxLib::DrawRotaGraph( 480, 380, sc, t * 0.5, offscreen, TRUE );

        DxLib::ScreenFlip();
        frame++;
    }

    DxLib::DeleteGraph( offscreen );
    DxLib::DeleteFontToHandle( fontM );
    DxLib::DxLib_End();
    return 0;
}
