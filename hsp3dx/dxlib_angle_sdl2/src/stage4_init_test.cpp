//
// hsp3dx angle+sdl2 Stage 4: DxLib_Init link test
//
//  dxlib_portable_stage3.lib に対して DxLib_Init / DxLib_End を呼ぶだけの
//  最小テスト。link エラーが出れば、どのシンボルが足りていないかが判る。
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
#include <cstdio>

int main( int argc, char **argv )
{
    (void)argc; (void)argv;

    std::printf( "[Stage4] Calling DxLib_Init...\n" );
    int ret = DxLib::DxLib_Init();
    std::printf( "[Stage4] DxLib_Init returned %d\n", ret );

    std::printf( "[Stage4] Calling DxLib_End...\n" );
    DxLib::DxLib_End();
    std::printf( "[Stage4] Done.\n" );
    return 0;
}
