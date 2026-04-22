//
// hsp3dx Stage 16: キーボード/マウス入力テスト
//   矢印キーで矩形を動かし、ESC で終了
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
#define DX_NON_KEYEX           1
#define DX_NON_INPUTSTRING     1

#include "DxLib.h"
#include <SDL.h>
#include <cstdio>

int main( int argc, char **argv )
{
    (void)argc; (void)argv;
    if ( DxLib::DxLib_Init() != 0 ) return 1;
    DxLib::SetBackgroundColor( 30, 30, 60 );

    int px = 300, py = 220;
    Uint32 start = SDL_GetTicks();

    while ( SDL_GetTicks() - start < 30000 )
    {
        // event pump (WSLg の SDL_QUIT 早期発火を無視)
        SDL_Event ev;
        while ( SDL_PollEvent( &ev ) ) { (void)ev; }

        DxLib::ClearDrawScreen();

        // CheckHitKey は DxLib 内部で SDL_GetKeyboardState を使う想定
        // (UpdateKeyboardInputState_PF 経由)
        if ( DxLib::CheckHitKey( KEY_INPUT_ESCAPE ) ) break;
        if ( DxLib::CheckHitKey( KEY_INPUT_LEFT  ) ) px -= 4;
        if ( DxLib::CheckHitKey( KEY_INPUT_RIGHT ) ) px += 4;
        if ( DxLib::CheckHitKey( KEY_INPUT_UP    ) ) py -= 4;
        if ( DxLib::CheckHitKey( KEY_INPUT_DOWN  ) ) py += 4;

        // マウス位置にカーソル矩形
        int mx, my;
        DxLib::GetMousePoint( &mx, &my );
        int mb = DxLib::GetMouseInput();

        // 矢印キーで動く青い矩形
        DxLib::DrawFillBox( px-20, py-20, px+20, py+20,
                            DxLib::GetColor( 100, 200, 255 ) );

        // マウスカーソル (赤)
        DxLib::DrawCircle( mx, my, 8,
                            DxLib::GetColor( 255, 100, 100 ), TRUE );

        // マウスボタン表示
        if ( mb & 1 ) DxLib::DrawFillBox( 10, 10, 40, 40,  DxLib::GetColor(255,0,0) );
        if ( mb & 2 ) DxLib::DrawFillBox( 50, 10, 80, 40,  DxLib::GetColor(0,255,0) );
        if ( mb & 4 ) DxLib::DrawFillBox( 90, 10, 120, 40, DxLib::GetColor(0,0,255) );

        DxLib::ScreenFlip();
    }

    DxLib::DxLib_End();
    return 0;
}
