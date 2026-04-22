//
// hsp3dx angle+sdl2 Stage 2: DxLib.h compile test
//
//  DX_PLATFORM_DESKTOP_SDL2 を定義した状態で DxLib.h がエラー無しにパースできるか
//  を確認するだけの単体ファイル。
//
//  成功条件: DxLib::DxLib_IsInit 等のシンボルが宣言されていて、
//           DX_PLATFORM_DESKTOP_SDL2 ブランチが正しく引けていること。
//

#define DX_PLATFORM_DESKTOP_SDL2 1

#include "DxLib.h"

#include <cstdio>
#include <cstddef>

int main( int argc, char **argv )
{
    (void)argc; (void)argv;

    std::printf( "DXLIB_VERSION = 0x%x\n", DXLIB_VERSION );

    // DxLib の型/定数が正しく見えているか touch する
    RECT r { 0, 0, 100, 100 };
    POINT p { 50, 50 };
    (void)r; (void)p;

    DWORD x = 0x12345678;
    BYTE  b = 0x42;
    (void)x; (void)b;

    // プラットフォームスイッチ検証
#ifdef WINDOWS_DESKTOP_OS
    #error "WINDOWS_DESKTOP_OS must NOT be set when DX_PLATFORM_DESKTOP_SDL2 is on"
#endif
#ifdef DX_NON_DIRECT3D11
    std::printf( "DX_NON_DIRECT3D11 is defined (expected)\n" );
#else
    #error "DX_NON_DIRECT3D11 must be set on desktop SDL2 build"
#endif
#ifdef DX_NON_NETWORK
    std::printf( "DX_NON_NETWORK is defined (expected on initial stage)\n" );
#endif

    std::printf( "Stage 2 header-only compile succeeded.\n" );
    return 0;
}
