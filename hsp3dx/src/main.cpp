//
//  main.cpp — hsp3dx.exe Windows エントリポイント (Phase 1.1)
//
//  処理の流れ:
//    1. コマンドライン引数 or カレントディレクトリの start.ax をパスとして決定
//    2. hgio_dx_init で DxLib 初期化 (UTF-8 固定)
//    3. hsp3dxcl_init で HSP3 VM 起動 + .ax ロード
//    4. メインループ:
//       - ProcessMessage → ウィンドウ閉じ要求で終了
//       - render_start → VM 実行 (hsp3dxcl_exec を 1 回) → render_end
//       - VM が終了 (RUNMODE_END) したら ESC 押下まで待機
//    5. 終了処理
//
#include <windows.h>
#include <stdio.h>
#include <stdlib.h>

#include "hgio_dx.h"
#include "hsp3dxcl.h"
#include "hsp3dx_console.h"
#include "DxLib.h"

int WINAPI WinMain( HINSTANCE, HINSTANCE, LPSTR cmdline, int )
{
    //  ---- .ax パス決定 ----
    const char *ax_path = ( cmdline && cmdline[0] ) ? cmdline : "start.ax";

    //  ---- DxLib 初期化 ----
    if ( hgio_dx_init( 0, 640, 480, nullptr ) != 0 ) {
        MessageBoxA( nullptr, "DxLib 初期化失敗", "hsp3dx", MB_OK | MB_ICONERROR );
        return 2;
    }

    //  ---- HSP3 VM 起動 + .ax ロード ----
    if ( hsp3dxcl_init( ax_path ) != 0 ) {
        char buf[1024];
        snprintf( buf, sizeof(buf), "start.ax の読み込みに失敗しました\npath=%s", ax_path );
        MessageBoxA( nullptr, buf, "hsp3dx", MB_OK | MB_ICONERROR );
        hgio_dx_term();
        return 1;
    }

    //  ---- メインループ ----
    //  hsp3dxcl_exec() は VM が end / stop に到達するまで内部で回る。
    //  その前に wait/await に入れば msgfunc (hsp3dxcl 側) で制御が戻ってくる。
    //  Phase 1.1 は VM 実行と描画のサイクルがまだ完全統合されていないので、
    //  VM を 1 回走らせて終わり → あとは ESC 待ちの単純ループ。
    //  Phase 1.2 以降で redraw / await と ScreenFlip を同期させる。

    int vm_result = hsp3dxcl_exec();

    while ( hgio_dx_process_message() == 0 ) {
        hgio_dx_render_start();
        hsp3dx_console_render_dxlib( 10, 10, 0xFFFFFF );
        hgio_dx_render_end();
        if ( hgio_dx_getkey( KEY_INPUT_ESCAPE ) ) break;
    }

    hsp3dxcl_bye();
    hgio_dx_term();
    return vm_result;
}
