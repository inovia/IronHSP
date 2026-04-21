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

//  HTTP モジュール初期化 (ANativeActivity 経由で JavaVM を取得)
extern "C" void hsp3dx_http_init_jni( void );

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

    //  DxLib 初期化 (論理解像度 640x480 固定 + フィットストレッチで端末画面に表示)
    if ( hgio_dx_init( 0, 640, 480, nullptr ) != 0 ) {
        LOGE( "hgio_dx_init failed" );
        return -1;
    }

    //  参考情報: 端末実解像度 (DxLib_Init 後なら取得可)
    int disp_w = 0, disp_h = 0;
    if ( GetAndroidDisplayResolution( &disp_w, &disp_h ) == 0 ) {
        LOGI( "physical display: %dx%d (logical=640x480 stretched)", disp_w, disp_h );
    }

    //  HTTP モジュールに JavaVM を教える (DxLib が NativeActivity を保持してから)
    hsp3dx_http_init_jni();

    //  内部データパス取得 (書き込み可能な private dir)
    char internal_dir[1024] = "";
    GetInternalDataPath( (TCHAR *)internal_dir, sizeof(internal_dir) );
    if ( internal_dir[0] == 0 ) strcpy( internal_dir, "/data/local/tmp" );
    LOGI( "internal dir: %s", internal_dir );

    //  カレントディレクトリを内部 dir に移動 (filepack の fopen 相対パス用)
    chdir( internal_dir );

    //  開発時のサンプル切替用: `adb push foo.ax /data/data/<pkg>/files/start_override.ax`
    //  で置いた場合はそれを優先 (assets からの start.ax 抽出はスキップ)。
    char override_path[1024];
    snprintf( override_path, sizeof(override_path), "%s/start_override.ax", internal_dir );
    FILE *ov = fopen( override_path, "rb" );
    if ( ov ) {
        fclose( ov );
        char target[1024];
        snprintf( target, sizeof(target), "%s/start.ax", internal_dir );
        //  override を start.ax にリネーム (rename で上書きコピー)
        remove( target );
        rename( override_path, target );
        LOGI( "using pushed override .ax as start.ax" );
    } else {
        //  assets/start.ax を内部 dir にコピー
        if ( extract_asset( "start.ax", internal_dir ) != 0 ) {
            LOGE( "start.ax not found in assets" );
            hgio_dx_term();
            return -1;
        }
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
