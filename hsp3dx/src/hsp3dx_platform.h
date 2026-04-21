//
//  hsp3dx_platform.h — Win/iOS/Android 共通の端末機能抽象レイヤ
//
//  Phase M 以降で順次実装する「プラットフォーム固有の単純機能」を
//  このヘッダで宣言する。実装は hsp3dx_platform_win.cpp / _ndk.cpp / _ios.mm。
//
#ifndef __hsp3dx_platform_h
#define __hsp3dx_platform_h

#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

//  ----------------------------------------------------------------
//  exec: 外部 URL / ファイル / アプリを既定ハンドラで開く
//    url_or_path: "https://..." / "mailto:..." / ファイルパス等
//    param: Win の ShellExecute 用引数 (iOS/Android は無視)
//    mode : 互換用 (現状どのプラットフォームも未使用、0 推奨)
//  返値: 0=成功、-1=失敗
//  ----------------------------------------------------------------
int hsp3dx_platform_exec( const char *url_or_path, const char *param, int mode );

//  ----------------------------------------------------------------
//  dialog: モーダルメッセージボックス
//    text, title: UTF-8
//    mode: 0=OK / 1=OK+Cancel / 2=Yes+No / 3=Yes+No+Cancel
//  返値 (HSP の dialog stat 相当):
//    1=OK/Yes, 2=Cancel/No (mode=2 では No), 3=Cancel (mode=3 のみ)
//    -1=表示失敗
//  ----------------------------------------------------------------
int hsp3dx_platform_dialog( const char *text, const char *title, int mode );

//  ----------------------------------------------------------------
//  Key-Value 永続ストア (Phase M.2)
//    section: INI のセクション名 (iOS/Android は "section/" prefix として使用、空 OK)
//    key    : キー名
//  ----------------------------------------------------------------
int  hsp3dx_pref_set_str ( const char *section, const char *key, const char *value );
int  hsp3dx_pref_set_int ( const char *section, const char *key, int value );
int  hsp3dx_pref_get_str ( const char *section, const char *key,
                           char *out, size_t out_cap, const char *default_value );
int  hsp3dx_pref_get_int ( const char *section, const char *key, int default_value );
int  hsp3dx_pref_remove  ( const char *section, const char *key );
int  hsp3dx_pref_clear   ( const char *section );   //  "" or NULL で全削除

#ifdef __cplusplus
}
#endif

#endif
