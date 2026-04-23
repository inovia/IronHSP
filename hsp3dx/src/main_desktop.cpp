//
//  main_desktop.cpp — hsp3dx Desktop (Mac/Linux/Web) エントリポイント
//
//  iOS/Android 版と同じ hsp3dx VM + hgio_dx を使い、graphics backend を
//  SDL2 + OpenGL (DxLib Desktop fork) に置換したもの。
//
//  `start.ax` をカレントディレクトリ (または argv[1]) から読み込んで実行する。
//  bundle 機構は無いので通常のファイルシステムから直接読む。
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#ifdef _WIN32
#include <direct.h>
#define chdir _chdir
#else
#include <unistd.h>
#endif

#include "DxLib.h"
#include "hgio_dx.h"
#include "hsp3dxcl.h"
#include "hsp3dx_events.h"

#ifdef __EMSCRIPTEN__
#include <emscripten.h>
#endif

//  sample_physics.hsp 等が参照できるよう、ある程度の標準解像度で起動
//  (HSP script 側で screen 命令で変更可)
static const int kDefaultWidth  = 640;
static const int kDefaultHeight = 480;

#ifdef __EMSCRIPTEN__
//  Web は browser のメインループを奪えないので emscripten_set_main_loop で回す
static void hsp3dx_web_frame( void )
{
    if ( hgio_dx_process_message() != 0 ) {
        emscripten_cancel_main_loop();
        hsp3dxcl_bye();
        hgio_dx_term();
        return;
    }
    hsp3dx_events_poll();
    //  hsp3dxcl_exec は await / loop を VM 内で処理するので、
    //  web では短いスライスに分割して呼ぶのが理想だが、一旦は
    //  一括で走らせる (将来コルーチン化候補)
}
#endif

int main( int argc, char *argv[] )
{
    const char *ax_path = "start.ax";
    if ( argc > 1 ) {
        ax_path = argv[1];
    }

    //  引数が絶対パスで指定された場合はその親ディレクトリに chdir して
    //  相対リソース参照 (picload "image.png" 等) を script 側から書けるように
    if ( ax_path[0] == '/' || (ax_path[0] && ax_path[1] == ':') ) {
        char dir[1024];
        strncpy( dir, ax_path, sizeof(dir) - 1 );
        dir[sizeof(dir) - 1] = 0;
        char *slash = strrchr( dir, '/' );
#ifdef _WIN32
        char *bs = strrchr( dir, '\\' );
        if ( bs && (slash == NULL || bs > slash) ) slash = bs;
#endif
        if ( slash ) {
            *slash = 0;
            chdir( dir );
            ax_path = slash + 1;
        }
    }

    //  DxLib Desktop (SDL2+GL) 初期化
    if ( hgio_dx_init( 0, kDefaultWidth, kDefaultHeight, NULL ) != 0 ) {
        fprintf( stderr, "hgio_dx_init failed\n" );
        return -1;
    }

    //  letterbox 余白を黒に
    SetBackgroundColor( 0, 0, 0 );
    ClearDrawScreen();

    //  HSP `mes` は DX_DEFAULT_FONT_HANDLE 経由で DrawString を呼ぶが、
    //  Desktop fork の default font 自動作成パスが安定しないため、ここで
    //  明示的に CreateFontToHandle で fallback font handle を作って
    //  ChangeFontFromHandle で default として有効化する (mes が SIGABRT
    //  する問題の workaround)。Web (Emscripten) では SDL2_ttf 非 link
    //  なので font 自体無効、skip する。
#ifndef __EMSCRIPTEN__
    {
        int defh = CreateFontToHandle( NULL, 16, -1 );
        if ( defh >= 0 ) ChangeFontFromHandle( defh );
    }
#endif

    //  HSP VM 初期化
    if ( hsp3dxcl_init( (char *)ax_path ) != 0 ) {
        fprintf( stderr, "hsp3dxcl_init failed (ax=%s)\n", ax_path );
        hgio_dx_term();
        return -1;
    }

    //  VM 実行 (await/loop 内での ScreenFlip + ProcessMessage は hsp3dxcl 側で回る)
    int vm_result = hsp3dxcl_exec();
    fprintf( stderr, "[hsp3dx_desktop] VM end result=%d\n", vm_result );

    hgio_dx_flip();

#ifdef __EMSCRIPTEN__
    //  Web: VM 終了後にポスト描画を回す main loop (window close 検出用)
    emscripten_set_main_loop( hsp3dx_web_frame, 0, 1 );
#else
    //  Desktop: ESC or window close 検出まで post-exec 待機
    while ( hgio_dx_process_message() == 0 ) {
        hsp3dx_events_poll();
        WaitTimer( 16 );
    }

    hsp3dxcl_bye();
    hgio_dx_term();
#endif
    return vm_result;
}
