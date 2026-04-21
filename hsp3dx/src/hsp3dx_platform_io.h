//
//  hsp3dx_platform_io.h — Win/iOS/Android 統一ファイル I/O 抽象
//
//  `.ax` / 画像 / 音声 など全てのリソースファイルを、プラットフォーム問わず
//  同じ API で読み込めるようにする薄い抽象層。
//
//  実装:
//      Win     : hsp3dx_platform_io_win.cpp    (fopen ベース)
//      iOS     : hsp3dx_platform_io_ios.mm     (NSBundle + fopen、Phase 3)
//      Android : hsp3dx_platform_io_ndk.cpp    (AAssetManager、Phase 4)
//
//  設計方針:
//  * UTF-8 パス前提 (hsp3dx 全体の共通ルール)
//  * 読み込み専用 (ユーザー書き込みは別抽象で扱う)
//  * stream 型と「全部メモリに読む」型の 2 種類を提供
//    - stream: 巨大ファイル向け (動画ストリーム、大アセット)
//    - 全部読み: .ax / PNG / WAV など典型的な使い方
//
#ifndef __hsp3dx_platform_io_h
#define __hsp3dx_platform_io_h

#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

//  ---- stream I/O ----
typedef struct hsp3dx_file hsp3dx_file;

//  UTF-8 パスでファイルを開く。成功で非 NULL、失敗で NULL。
hsp3dx_file *hsp3dx_fopen( const char *utf8_path );

//  size バイト読む。実際に読めたバイト数を返す (EOF で 0)。
size_t       hsp3dx_fread( void *buf, size_t size, hsp3dx_file *f );

//  ファイル全体のサイズ (fopen 直後に呼ぶ想定)
size_t       hsp3dx_fsize( hsp3dx_file *f );

//  閉じる。f が NULL でも安全 (no-op)。
void         hsp3dx_fclose( hsp3dx_file *f );


//  ---- 全部メモリに読む (便利関数) ----
//  成功時 0、失敗時 -1。成功時は *out_buf に malloc 済バッファ、*out_size にサイズ。
//  呼び出し側は hsp3dx_free_file_buf() で解放する責任を持つ。
int          hsp3dx_load_file_all( const char *utf8_path, void **out_buf, size_t *out_size );

//  hsp3dx_load_file_all で得たバッファを解放。
void         hsp3dx_free_file_buf( void *buf );


//  ---- 存在確認 (exist 命令などで使用) ----
//  存在すればサイズ、なければ -1。
long         hsp3dx_file_size_if_exists( const char *utf8_path );

#ifdef __cplusplus
}
#endif

#endif
