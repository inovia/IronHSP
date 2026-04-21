//
//  main.cpp — hsp3dx.exe Windows エントリポイント (Phase 1.3)
//
//  処理の流れ:
//    1. コマンドライン引数 or カレントディレクトリの start.ax をパスとして決定
//    2. hgio_dx_init で DxLib 初期化 (UTF-8 固定)
//    3. hsp3dxcl_init で HSP3 VM 起動 + .ax ロード
//    4. hsp3dxcl_exec で VM 実行 (end に到達するか redraw で ScreenFlip)
//    5. VM 終了後は画面内容を保持したまま ESC 待ち
//
//  Phase 1.3 の描画モデル:
//    VM が mes / line / boxf などを呼ぶとその場で DxLib DrawString 等で
//    back buffer に書き込まれる。redraw 1 で back → front へ ScreenFlip。
//    main 側は ClearDrawScreen しない (VM が管理する)。
//
#include <windows.h>
#include <stdio.h>
#include <stdlib.h>

#include "hgio_dx.h"
#include "hsp3dxcl.h"
#include "DxLib.h"

int WINAPI WinMain( HINSTANCE, HINSTANCE, LPSTR cmdline, int )
{
    const char *ax_path = ( cmdline && cmdline[0] ) ? cmdline : "start.ax";

    if ( hgio_dx_init( 0, 640, 480, nullptr ) != 0 ) {
        MessageBoxA( nullptr, "DxLib 初期化失敗", "hsp3dx", MB_OK | MB_ICONERROR );
        return 2;
    }

    //  デフォルトでは back buffer に描画、redraw 1 で flip されるまで見えない。
    //  起動直後の 1 回だけ back → front をコピーして、黒画面が一瞬出るのを防ぐ。
    SetDrawScreen( DX_SCREEN_BACK );
    ClearDrawScreen();
    ScreenFlip();

    if ( hsp3dxcl_init( ax_path ) != 0 ) {
        char buf[1024];
        snprintf( buf, sizeof(buf), "start.ax の読み込みに失敗しました\npath=%s", ax_path );
        MessageBoxA( nullptr, buf, "hsp3dx", MB_OK | MB_ICONERROR );
        hgio_dx_term();
        return 1;
    }

    //  VM を回す。mes / line / boxf などはこの中で DxLib に直接描画される。
    //  redraw 1 でのみ ScreenFlip が走る。
    int vm_result = hsp3dxcl_exec();

    //  VM 終了後は back buffer の内容を 1 回 flip して最終画面を確定させる。
    //  (VM が最後に redraw 1 をしていなくても、描いた内容が見えるように)
    ScreenFlip();

    //  ESC が押されるまで画面を保持。ClearDrawScreen は呼ばない。
    while ( hgio_dx_process_message() == 0 ) {
        if ( hgio_dx_getkey( KEY_INPUT_ESCAPE ) ) break;
        Sleep( 16 );
    }

    hsp3dxcl_bye();
    hgio_dx_term();
    return vm_result;
}
