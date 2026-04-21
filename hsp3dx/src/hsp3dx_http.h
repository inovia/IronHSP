//
//  hsp3dx_http.h — Win/iOS/Android 共通 HTTP クライアント抽象
//
//  実装:
//      Win     : hsp3dx_http_win.cpp     (WinHTTP)
//      iOS     : hsp3dx_http_ios.mm      (NSURLSession、Phase 3)
//      Android : hsp3dx_http_ndk.cpp     (HttpURLConnection via JNI、Phase 4)
//
//  全部 UTF-8 文字列前提。blocking I/O。WebSocket は別モジュール (hsp3dx_ws.h)。
//
//  機能:
//  * GET / POST / PUT / DELETE / PATCH (REST API フル対応)
//  * ファイルダウンロード (ストリーム保存、巨大ファイル対応)
//  * レスポンスヘッダ取得 (Content-Type / Location / Set-Cookie 等)
//  * Cookie 自動保持 (同一プロセス内のセッション)
//  * gzip / deflate 自動解凍
//  * HTTP/2 有効化 (サーバ側サポートすれば使用)
//  * Basic 認証ヘルパ
//
#ifndef __hsp3dx_http_h
#define __hsp3dx_http_h

#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

//  HTTP レスポンス (body / headers は malloc 済、hsp3dx_http_free で解放)
typedef struct hsp3dx_http_response {
    int    status;          //  HTTP status code、失敗時 0
    char  *body;            //  body バイナリ (null 終端)
    size_t size;            //  body の実バイト数
    char  *headers;         //  全レスポンスヘッダを "Name: value\r\n..." 形式で保持
} hsp3dx_http_response;

//  任意メソッド + body でリクエスト (内部用、便利 wrapper は下記)
//      method       : "GET" / "POST" / "PUT" / "DELETE" / "PATCH" など
//      body / size  : null / 0 で空ボディ
//      content_type : body ありの場合のヘッダ値 (NULL でデフォルト)
//      user_agent   : NULL で "hsp3dx/1.0"
//      extra_headers: "Name: val\r\n..." 、NULL 可
//      timeout_ms   : 接続 + 送受信タイムアウト
//  戻り値: 0=成功、負値=失敗
int  hsp3dx_http_request( const char *method,
                          const char *url,
                          const void *body, size_t size,
                          const char *content_type,
                          const char *user_agent,
                          const char *extra_headers,
                          int         timeout_ms,
                          hsp3dx_http_response *out );

//  便利 wrapper (内部で hsp3dx_http_request 呼出)
int  hsp3dx_http_get   ( const char *url, const char *ua, const char *xhdr,
                         int timeout_ms, hsp3dx_http_response *out );
int  hsp3dx_http_post  ( const char *url, const void *body, size_t size,
                         const char *content_type, const char *ua,
                         const char *xhdr, int timeout_ms,
                         hsp3dx_http_response *out );
int  hsp3dx_http_put   ( const char *url, const void *body, size_t size,
                         const char *content_type, const char *ua,
                         const char *xhdr, int timeout_ms,
                         hsp3dx_http_response *out );
int  hsp3dx_http_delete( const char *url, const char *ua, const char *xhdr,
                         int timeout_ms, hsp3dx_http_response *out );
int  hsp3dx_http_patch ( const char *url, const void *body, size_t size,
                         const char *content_type, const char *ua,
                         const char *xhdr, int timeout_ms,
                         hsp3dx_http_response *out );

//  ファイルダウンロード (ストリーム保存、メモリ消費最小)
//      dest_path_u8 : ローカル保存パス (UTF-8)
//      out_status   : HTTP status (200 以外でも保存される)
//      out_size     : 保存されたバイト数
int  hsp3dx_http_download( const char *url, const char *dest_path_u8,
                           const char *ua, const char *xhdr,
                           int timeout_ms,
                           int *out_status, size_t *out_size );

//  レスポンスヘッダ値を取得 (Content-Type / Location / Set-Cookie 等)
//      name    : "Content-Type" のような大文字小文字区別なしの名前
//      out     : value 書き込み先 (UTF-8、null 終端)
//      out_cap : out のバッファサイズ
//  戻り値: 0=見つかった、-1=なし
int  hsp3dx_http_get_header( const hsp3dx_http_response *resp,
                             const char *name,
                             char *out, size_t out_cap );

//  Cookie ジャー管理 (プロセス内持続、全リクエストで送出)
void hsp3dx_http_cookie_clear( void );
void hsp3dx_http_cookie_set_enabled( int enabled );   // デフォルト ON

//  レスポンス body / headers の解放
void hsp3dx_http_free( hsp3dx_http_response *resp );

//  Basic 認証ヘッダ値を作る (user:pass → "Basic <base64>")
//      out_cap は目安 256 以上
int  hsp3dx_http_build_basic_auth( const char *user, const char *pass,
                                   char *out_header_value, size_t out_cap );

//  ------------------------------------------------------------------
//  multipart/form-data ファイルアップロード (ステートフル builder)
//
//  使用例:
//      hsp3dx_http_mp_begin();
//      hsp3dx_http_mp_add_text ("description", "photo of cat");
//      hsp3dx_http_mp_add_file ("photo", "cat.jpg", "image/jpeg", NULL);
//      hsp3dx_http_mp_post     ("https://api.example.com/upload", ua, xhdr,
//                               timeout, &resp);
//      hsp3dx_http_mp_end();   // 状態クリア
//  ------------------------------------------------------------------

void hsp3dx_http_mp_begin    ( void );                         // 内部状態リセット
int  hsp3dx_http_mp_add_text ( const char *field_name, const char *value );
//  content_type: NULL でファイル拡張子から自動推定
//  filename    : NULL でパスの basename を使用 (サーバ側で表示される名前)
int  hsp3dx_http_mp_add_file ( const char *field_name,
                               const char *file_path_u8,
                               const char *content_type,
                               const char *filename );
int  hsp3dx_http_mp_post     ( const char *url,
                               const char *user_agent,
                               const char *extra_headers,
                               int         timeout_ms,
                               hsp3dx_http_response *out );
void hsp3dx_http_mp_end      ( void );                         // 状態クリア

#ifdef __cplusplus
}
#endif

#endif
