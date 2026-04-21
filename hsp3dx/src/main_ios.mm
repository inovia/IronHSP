//
//  main_ios.mm — hsp3dx iOS エントリポイント
//
//  DxLib iOS は内部 libDxLib_iOS.a で UIApplicationMain を立ててユーザーの
//  `int ios_main(void)` を呼ぶ (Android の android_main と同構造)。
//
//  .ax バイトコードは Xcode プロジェクトの Data/start.ax リソースを bundle に
//  同梱し、起動時に DxLib FileRead_open 経由で読み出して内部 dir にコピーする。
//
#import <Foundation/Foundation.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "DxLib.h"
#include "hgio_dx.h"
#include "hsp3dxcl.h"

//  1 ファイルを DxLib FileRead 経由で読み出し fopen で書き出す
static int extract_bundle_asset( const char *name, const char *dst_dir )
{
    int fh = FileRead_open( (const TCHAR *)name );
    if ( fh == 0 ) { NSLog( @"FileRead_open failed: %s", name ); return -1; }

    LONGLONG sz = FileRead_size_handle( fh );
    if ( sz <= 0 ) { FileRead_close( fh ); return -1; }

    void *buf = malloc( (size_t)sz );
    if ( !buf ) { FileRead_close( fh ); return -1; }
    FileRead_read( buf, (int)sz, fh );
    FileRead_close( fh );

    char dst[1024];
    snprintf( dst, sizeof(dst), "%s/%s", dst_dir, name );
    FILE *fp = fopen( dst, "wb" );
    if ( !fp ) { free( buf ); NSLog( @"fopen write failed: %s", dst ); return -1; }
    fwrite( buf, 1, (size_t)sz, fp );
    fclose( fp );
    free( buf );

    NSLog( @"extracted: %s (%lld bytes) -> %s", name, (long long)sz, dst );
    return 0;
}

//  bundle Resources 直下のアセットを Documents にコピーする (拡張子で絞り込み)。
//  DxLib 内部ファイル (*.strings, *.nib, Info.plist 等) は除外。
//  既に Documents に同名のファイルがある場合は上書きしない (override を尊重)。
static void extract_all_bundle_assets( const char *dst_dir )
{
    NSString *resDir = [[NSBundle mainBundle] resourcePath];
    if ( resDir == nil ) return;

    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray<NSString *> *files = [fm contentsOfDirectoryAtPath:resDir error:nil];
    if ( files == nil ) return;

    NSSet<NSString *> *validExt = [NSSet setWithObjects:
        @"ax", @"png", @"jpg", @"jpeg", @"bmp", @"wav", @"ogg",
        @"mp3", @"txt", @"json", @"dat", @"csv", @"xml", nil];

    for ( NSString *file in files ) {
        NSString *ext = [[file pathExtension] lowercaseString];
        if ( ![validExt containsObject:ext] ) continue;

        char utf8Name[512];
        strncpy( utf8Name, [file UTF8String], sizeof(utf8Name) - 1 );
        utf8Name[sizeof(utf8Name) - 1] = 0;

        //  既存ファイルがあればスキップ (毎起動コピーの無駄を避ける)
        char dst[1024];
        snprintf( dst, sizeof(dst), "%s/%s", dst_dir, utf8Name );
        if ( access( dst, F_OK ) == 0 ) continue;

        extract_bundle_asset( utf8Name, dst_dir );
    }
}

//  DxLib iOS のユーザーエントリ (libDxLib_iOS.a から呼ばれる)
int ios_main( void )
{
    NSLog( @"hsp3dx ios_main start" );

    //  DxLib 初期化 (論理 640x480 仮、スクリプト側で screen 命令で変更可)
    if ( hgio_dx_init( 0, 640, 480, nullptr ) != 0 ) {
        NSLog( @"hgio_dx_init failed" );
        return -1;
    }

    //  参考: 物理画面サイズ (hgio_dx 側で letterbox 計算に使う)
    int disp_w = 0, disp_h = 0;
    if ( GetDisplayResolution_iOS( &disp_w, &disp_h ) == 0 ) {
        NSLog( @"physical display: %dx%d (logical=640x480 letterbox)", disp_w, disp_h );
    }

    //  内部 Documents dir 取得
    char internal_dir[1024] = "";
    GetDocumentsDirPath( (TCHAR *)internal_dir, sizeof(internal_dir) );
    if ( internal_dir[0] == 0 ) strcpy( internal_dir, "/tmp" );
    NSLog( @"internal dir: %s", internal_dir );

    chdir( internal_dir );

    //  bundle Data/ 配下のアセット (画像/音声/json 等) を Documents にコピー。
    //  既存ファイルは上書きしないので、開発時に Documents に push したファイルは保持される。
    extract_all_bundle_assets( internal_dir );

    //  開発時のサンプル差し替え用: ~/Documents/start_override.ax があれば優先
    //  (シミュレータなら xcrun simctl get_app_container 経由で push 可)
    char override_path[1024];
    snprintf( override_path, sizeof(override_path), "%s/start_override.ax", internal_dir );
    FILE *ov = fopen( override_path, "rb" );
    if ( ov ) {
        fclose( ov );
        char target[1024];
        snprintf( target, sizeof(target), "%s/start.ax", internal_dir );
        remove( target );
        rename( override_path, target );
        NSLog( @"using pushed override .ax as start.ax" );
    } else {
        //  bundle 内 start.ax を Documents にコピー (extract_all_bundle_assets で
        //  既にコピー済なら no-op、Documents にも bundle にも無ければエラー)
        char start_ax_path[1024];
        snprintf( start_ax_path, sizeof(start_ax_path), "%s/start.ax", internal_dir );
        if ( access( start_ax_path, F_OK ) != 0 ) {
            NSLog( @"start.ax not found in bundle or Documents" );
            hgio_dx_term();
            return -1;
        }
    }

    //  letterbox 余白を黒にするため背景色設定 + 初期クリア
    SetBackgroundColor( 0, 0, 0 );
    ClearDrawScreen();

    if ( hsp3dxcl_init( "start.ax" ) != 0 ) {
        NSLog( @"hsp3dxcl_init failed" );
        hgio_dx_term();
        return -1;
    }

    NSLog( @"hsp3dx VM start" );
    int vm_result = hsp3dxcl_exec();
    NSLog( @"hsp3dx VM end: result=%d", vm_result );

    hgio_dx_flip();

    //  iOS は ESC キーがないので ProcessMessage の終了通知を待つ
    //  (Home ボタンでバックグラウンド → タスクキルで終了)
    while ( hgio_dx_process_message() == 0 ) {
        WaitTimer( 16 );
    }

    hsp3dxcl_bye();
    hgio_dx_term();
    return vm_result;
}
