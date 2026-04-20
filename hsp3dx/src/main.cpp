//
//  main.cpp — hsp3dx.exe Windows エントリポイント (Phase 1.0 スケルトン)
//
//  処理の流れ:
//    1. コマンドライン引数 or 同ディレクトリの start.ax を読み込み
//    2. hgio_dx_init で DxLib 初期化 (UTF-8 固定)
//    3. hsp3embed VM を init し、.ax を食わせる
//    4. メインループ: ProcessMessage → render_start → VM 実行 (1 フレーム分)
//                    → render_end → ループ
//    5. 終了時 hgio_dx_term
//
//  Phase 1.1 で VM の実際の実行ドライブを実装する。現状はスケルトン。
//
#include <windows.h>
#include <stdio.h>

#include "hgio_dx.h"
#include "DxLib.h"                           // KEY_INPUT_ESCAPE などの定数用
// #include "../../hsp3embed/hsp3embed.h"     // Phase 1.1 で有効化

static int LoadAx( const char *path, unsigned char **out_buf, size_t *out_len )
{
    FILE *fp = fopen( path, "rb" );
    if ( !fp ) return -1;
    fseek( fp, 0, SEEK_END );
    long sz = ftell( fp );
    fseek( fp, 0, SEEK_SET );
    unsigned char *buf = (unsigned char *)malloc( sz );
    if ( !buf ) { fclose( fp ); return -2; }
    fread( buf, 1, sz, fp );
    fclose( fp );
    *out_buf = buf;
    *out_len = (size_t)sz;
    return 0;
}

int WINAPI WinMain( HINSTANCE, HINSTANCE, LPSTR cmdline, int )
{
    const char *ax_path = ( cmdline && cmdline[0] ) ? cmdline : "start.ax";

    unsigned char *ax_buf = nullptr;
    size_t         ax_len = 0;
    if ( LoadAx( ax_path, &ax_buf, &ax_len ) != 0 ) {
        MessageBoxA( nullptr, "start.ax が見つかりません", "hsp3dx", MB_OK );
        return 1;
    }

    if ( hgio_dx_init( 0, 640, 480, nullptr ) != 0 ) {
        MessageBoxA( nullptr, "DxLib 初期化失敗", "hsp3dx", MB_OK );
        free( ax_buf );
        return 2;
    }

    // TODO (Phase 1.1):
    //   hsp3eb_init();
    //   hsp3eb_load_ax( ax_buf, ax_len );
    //   hsp3eb_execstart();
    //   メインループで hsp3eb_exectime(16) を呼びつつ hgio_dx_render_* で挟む

    // Phase 1.0 暫定: ESC が押されるまで空ループ
    while ( hgio_dx_process_message() == 0 ) {
        hgio_dx_render_start();
        // TODO: VM 1 フレーム実行
        hgio_dx_render_end();
        if ( hgio_dx_getkey( KEY_INPUT_ESCAPE ) ) break;
    }

    hgio_dx_term();
    free( ax_buf );
    return 0;
}
