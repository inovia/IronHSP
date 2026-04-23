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
#import <UIKit/UIKit.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "DxLib.h"
#include "hgio_dx.h"
#include "hsp3dxcl.h"
#include "hsp3dx_events.h"

//  アプリライフサイクル通知 → hsp3dx_events_fire のブリッジ
//  通知ハンドラは実際にはメインスレッドで呼ばれるが、fire は atomic queue で安全。
static void hsp3dx_install_event_observers( void )
{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserverForName:UIApplicationDidEnterBackgroundNotification
                    object:nil queue:nil usingBlock:^( NSNotification *n ) {
        hsp3dx_events_fire( HSP3DX_EVT_APP_BACKGROUND );
    }];
    [nc addObserverForName:UIApplicationWillEnterForegroundNotification
                    object:nil queue:nil usingBlock:^( NSNotification *n ) {
        hsp3dx_events_fire( HSP3DX_EVT_APP_FOREGROUND );
    }];
    [nc addObserverForName:UIApplicationWillTerminateNotification
                    object:nil queue:nil usingBlock:^( NSNotification *n ) {
        hsp3dx_events_fire( HSP3DX_EVT_APP_WILL_TERMINATE );
    }];
    [nc addObserverForName:UIApplicationDidReceiveMemoryWarningNotification
                    object:nil queue:nil usingBlock:^( NSNotification *n ) {
        hsp3dx_events_fire( HSP3DX_EVT_APP_LOW_MEMORY );
    }];
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [nc addObserverForName:UIDeviceOrientationDidChangeNotification
                    object:nil queue:nil usingBlock:^( NSNotification *n ) {
        hsp3dx_events_fire( HSP3DX_EVT_ORIENTATION_CHANGED );
    }];
}

//  1 ファイルを DxLib FileRead 経由で読み出し fopen で書き出す
//  name は bundle root からの相対パス (例 "Hiyori/Hiyori.model3.json")
//  dst_dir 配下に同じ相対パスで書き出す。中間ディレクトリが無ければ作る。
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

    //  中間ディレクトリを作成 (Hiyori/Hiyori.model3.json のようなパス用)
    NSString *dstNS = [NSString stringWithUTF8String:dst];
    NSString *parent = [dstNS stringByDeletingLastPathComponent];
    [[NSFileManager defaultManager] createDirectoryAtPath:parent
                              withIntermediateDirectories:YES
                                               attributes:nil error:nil];

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
//  毎起動で bundle の内容を Documents に同期 (bundle を build 時に更新した場合に
//  Documents 側の古いファイルが残り続けないようにするため)。
//  Documents/start_override.ax は extract_all の対象外 (拡張子は ax だが
//  bundle に存在しないので展開されない)。このあとの override 処理で rename 消費。
static void extract_all_bundle_assets( const char *dst_dir )
{
    NSString *resDir = [[NSBundle mainBundle] resourcePath];
    if ( resDir == nil ) return;

    NSFileManager *fm = [NSFileManager defaultManager];
    //  再帰的にファイル一覧取得 (サブディレクトリ構造を保持)
    NSArray<NSString *> *files = [fm subpathsOfDirectoryAtPath:resDir error:nil];
    if ( files == nil ) return;

    //  拡張子フィルタ (3D モデル / Live2D 関連拡張も含める)
    NSSet<NSString *> *validExt = [NSSet setWithObjects:
        @"ax", @"png", @"jpg", @"jpeg", @"bmp", @"wav", @"ogg",
        @"mp3", @"txt", @"json", @"dat", @"csv", @"xml",
        //  3D モデル
        @"mv1", @"obj", @"pmx", @"pmd", @"fbx", @"gltf", @"glb", @"vrm",
        //  Live2D Cubism 4
        @"moc3", @"motion3", @"exp3", @"phys3", @"pose3",
        //  Movie (AVFoundation / DxMovieiOS_AVP)
        @"mp4", @"mov", @"m4v", @"ogv", nil];

    for ( NSString *rel in files ) {
        NSString *abs = [resDir stringByAppendingPathComponent:rel];
        //  注: hsp3dx_compat.h が BOOL=int と typedef しているため、ここで
        //  (BOOL*) とキャストすると int* 解釈されエラー。ObjC 本来の BOOL
        //  (64bit iOS では bool) と同じ型の bool を生で使って渡す。
        bool isDir_b = false;
        [fm fileExistsAtPath:abs isDirectory:(_Bool *)&isDir_b];
        if ( isDir_b ) continue;

        NSString *ext = [[rel pathExtension] lowercaseString];
        if ( ![validExt containsObject:ext] ) continue;

        char utf8Rel[1024];
        strncpy( utf8Rel, [rel UTF8String], sizeof(utf8Rel) - 1 );
        utf8Rel[sizeof(utf8Rel) - 1] = 0;

        //  毎起動で上書き (bundle の最新内容を反映)
        extract_bundle_asset( utf8Rel, dst_dir );
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

    //  Phase M.3: アプリライフサイクル通知を events queue にブリッジ
    hsp3dx_install_event_observers();

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
        hsp3dx_events_poll();
        WaitTimer( 16 );
    }

    hsp3dxcl_bye();
    hgio_dx_term();
    return vm_result;
}
