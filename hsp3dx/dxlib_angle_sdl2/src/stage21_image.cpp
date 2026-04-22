//
// hsp3dx Stage 21: 画像ロード (PNG / JPEG) ネイティブ DxLib::LoadGraph 経由
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
    const char *png_path = ( argc >= 2 ) ? argv[ 1 ] : "stage19_capture.png" ;

    if ( DxLib::DxLib_Init() != 0 ) return 1;
    DxLib::SetBackgroundColor( 30, 40, 50 );

    std::fprintf( stderr, "[Stage21] loading %s\n", png_path );
    int gh = DxLib::LoadGraph( png_path );
    std::fprintf( stderr, "[Stage21] LoadGraph -> %d\n", gh );

    int iw = 0, ih = 0;
    if ( gh >= 0 ) DxLib::GetGraphSize( gh, &iw, &ih );
    std::fprintf( stderr, "[Stage21] Graph size: %dx%d\n", iw, ih );

    int fontM = DxLib::CreateFontToHandle( nullptr, 18, -1 );

    Uint32 start = SDL_GetTicks();
    int frame = 0;
    while ( SDL_GetTicks() - start < 10000 )
    {
        SDL_Event ev; while ( SDL_PollEvent( &ev ) ) { (void)ev; }

        DxLib::ClearDrawScreen();
        float t = ( SDL_GetTicks() - start ) / 1000.0f;

        DxLib::DrawStringToHandle( 20, 20,
            "Stage 21: DxLib::LoadGraph (PNG via stb_image)",
            DxLib::GetColor( 255, 255, 255 ), fontM );

        char buf[ 128 ];
        std::snprintf( buf, sizeof buf, "image: %s  (%dx%d) handle=%d", png_path, iw, ih, gh );
        DxLib::DrawStringToHandle( 20, 50, buf,
            DxLib::GetColor( 180, 255, 180 ), fontM );

        if ( gh >= 0 ) {
            // そのまま描画
            DxLib::DrawGraph( 20, 90, gh, TRUE );

            // ずらし + 拡縮
            double sc = 0.5 + 0.25 * std::sin( t * 2.0 );
            DxLib::DrawRotaGraph( 480, 220, sc, t * 0.5, gh, TRUE );

            // Flip / TransFlag の確認
            DxLib::DrawExtendGraph( 20, 340, 300, 440, gh, TRUE );
        } else {
            DxLib::DrawStringToHandle( 20, 90, "Failed to load image. Place a PNG in CWD.",
                DxLib::GetColor( 255, 100, 100 ), fontM );
        }

        DxLib::ScreenFlip();
        frame++;
    }

    if ( gh >= 0 ) DxLib::DeleteGraph( gh );
    DxLib::DeleteFontToHandle( fontM );
    DxLib::DxLib_End();
    return 0;
}
