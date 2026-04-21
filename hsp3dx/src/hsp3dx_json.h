//
//  hsp3dx_json.h — picojson ベースの JSON ヘルパ (Win/iOS/Android 共通)
//
//  HSP スクリプトからは dx_json_* 命令経由で使用。handle = ID + version の
//  スロット方式。path は dotted + [i] 記法 ("user.items[0].name")。
//
#ifndef __hsp3dx_json_h
#define __hsp3dx_json_h

#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

//  dx_json_type の戻り値
enum {
    HSP3DX_JTYPE_INVALID = -1,      //  無効ハンドル / path 先なし
    HSP3DX_JTYPE_NULL    = 0,
    HSP3DX_JTYPE_BOOL    = 1,
    HSP3DX_JTYPE_NUMBER  = 2,
    HSP3DX_JTYPE_STRING  = 3,
    HSP3DX_JTYPE_ARRAY   = 4,
    HSP3DX_JTYPE_OBJECT  = 5,
};

//  ドキュメント生成 / 解放
int  hsp3dx_json_parse   ( const char *src );                   //  ret = handle / -1
int  hsp3dx_json_new_obj ( void );
int  hsp3dx_json_new_arr ( void );
void hsp3dx_json_free    ( int handle );

//  シリアライズ (pretty=0 で最小化)
//  戻り値: 書き込みバイト数、失敗時 -1
//  必要バッファ長は一度 NULL, 0 で呼ぶと返却
int  hsp3dx_json_stringify( int handle, int pretty, char *out, size_t out_cap );

//  参照
int  hsp3dx_json_type    ( int handle, const char *path );      //  HSP3DX_JTYPE_*
int  hsp3dx_json_size    ( int handle, const char *path );      //  -1 以外: length
int  hsp3dx_json_key_at  ( int handle, const char *path, int index,
                            char *out, size_t out_cap );        //  0=ok / -1=fail
int  hsp3dx_json_get_str ( int handle, const char *path,
                           char *out, size_t out_cap,
                           const char *defval );                //  0=ok / -1=not found
int  hsp3dx_json_get_int ( int handle, const char *path, int defval );
int  hsp3dx_json_get_double(int handle, const char *path, double *out, double defval );
int  hsp3dx_json_get_bool( int handle, const char *path, int defval );

//  設定 (path 中間に object が足りなければ自動生成)
int  hsp3dx_json_set_str ( int handle, const char *path, const char *value );
int  hsp3dx_json_set_int ( int handle, const char *path, int value );
int  hsp3dx_json_set_double(int handle, const char *path, double value );
int  hsp3dx_json_set_bool( int handle, const char *path, int value );
int  hsp3dx_json_set_null( int handle, const char *path );
int  hsp3dx_json_set_obj ( int handle, const char *path );
int  hsp3dx_json_set_arr ( int handle, const char *path );
int  hsp3dx_json_remove  ( int handle, const char *path );

#ifdef __cplusplus
}
#endif

#endif
