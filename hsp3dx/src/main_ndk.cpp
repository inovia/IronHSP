//
//  main_ndk.cpp — hsp3dx Android エントリポイント
//
//  DxLib Android は `android_main` をユーザーエントリとして呼ぶ (NativeActivity ベース)。
//  .ax ファイル + アセットは APK の assets/ に入っているが、HSP3 コアの filepack.cpp は
//  fopen() で読むため、起動時に DxLib FileRead_open (assets 対応) 経由で
//  内部 files dir に展開しておく。
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <android/log.h>

#include "DxLib.h"
#include "hgio_dx.h"
#include "hsp3dxcl.h"

#define LOG_TAG "hsp3dx"
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO,  LOG_TAG, __VA_ARGS__)
#define LOGW(...) __android_log_print(ANDROID_LOG_WARN,  LOG_TAG, __VA_ARGS__)
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)

//  1 ファイルを DxLib FileRead 経由で読み出し fopen で書き出す
static int extract_asset( const char *name, const char *dst_dir )
{
    int fh = FileRead_open( (const TCHAR *)name );
    if ( fh == 0 ) { LOGW( "FileRead_open failed: %s", name ); return -1; }

    LONGLONG sz = FileRead_size_handle( fh );
    if ( sz <= 0 ) { FileRead_close( fh ); return -1; }

    void *buf = malloc( (size_t)sz );
    if ( !buf ) { FileRead_close( fh ); return -1; }
    FileRead_read( buf, (int)sz, fh );
    FileRead_close( fh );

    char dst[1024];
    snprintf( dst, sizeof(dst), "%s/%s", dst_dir, name );
    FILE *fp = fopen( dst, "wb" );
    if ( !fp ) { free( buf ); LOGW( "fopen write failed: %s", dst ); return -1; }
    fwrite( buf, 1, (size_t)sz, fp );
    fclose( fp );
    free( buf );

    LOGI( "extracted: %s (%lld bytes) -> %s", name, (long long)sz, dst );
    return 0;
}

//  android_main は DxLib Android のエントリ。libDxLib.a 内の ANativeActivity コールバックから
//  適切なタイミングで呼び出される。DxLib Android は C++ 関数として呼ぶので extern "C" は付けない。
int android_main( void )
{
    LOGI( "hsp3dx android_main start" );

    //  DxLib 初期化 (.so 読み込み直後は画面未生成でも OK、SetGraphMode でサイズ設定)
    if ( hgio_dx_init( 0, 640, 480, nullptr ) != 0 ) {
        LOGE( "hgio_dx_init failed" );
        return -1;
    }

    //  内部データパス取得 (書き込み可能な private dir)
    char internal_dir[1024] = "";
    GetInternalDataPath( (TCHAR *)internal_dir, sizeof(internal_dir) );
    if ( internal_dir[0] == 0 ) strcpy( internal_dir, "/data/local/tmp" );
    LOGI( "internal dir: %s", internal_dir );

    //  カレントディレクトリを内部 dir に移動 (filepack の fopen 相対パス用)
    chdir( internal_dir );

    //  assets/start.ax を内部 dir にコピー
    if ( extract_asset( "start.ax", internal_dir ) != 0 ) {
        LOGE( "start.ax not found in assets" );
        hgio_dx_term();
        return -1;
    }
    //  他のアセット (PNG / WAV 等) も必要に応じて展開
    //  (ユーザが使うものを事前に名前で extract_asset 呼べばよい)

    SetDrawScreen( DX_SCREEN_BACK );
    ClearDrawScreen();
    ScreenFlip();

    if ( hsp3dxcl_init( "start.ax" ) != 0 ) {
        LOGE( "hsp3dxcl_init failed" );
        hgio_dx_term();
        return -1;
    }

    LOGI( "hsp3dx VM start" );
    int vm_result = hsp3dxcl_exec();
    LOGI( "hsp3dx VM end: result=%d", vm_result );

    ScreenFlip();

    //  ESC (Back キー) まで画面保持
    while ( hgio_dx_process_message() == 0 ) {
        if ( hgio_dx_getkey( KEY_INPUT_ESCAPE ) ) break;
        WaitTimer( 16 );
    }

    hsp3dxcl_bye();
    hgio_dx_term();
    return vm_result;
}
