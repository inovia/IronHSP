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
#ifndef __hsp3dx_http_h
#define __hsp3dx_http_h

#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

//  HTTP レスポンス (body は malloc 済、hsp3dx_http_free で解放)
typedef struct hsp3dx_http_response {
    int    status;          //  HTTP status code (200 / 404 / …)、失敗時 0
    char  *body;            //  null 終端 (バイナリ含め、size バイトまで)、未取得時 NULL
    size_t size;            //  body の実バイト数
} hsp3dx_http_response;

//  GET "url"
//      user_agent   : User-Agent ヘッダ、NULL で "hsp3dx/1.0"
//      extra_headers: "Header: value\r\nHeader2: value2\r\n" 形式、NULL 可
//      timeout_ms   : 接続 + 送受信タイムアウトの目安
//      out          : 成功時 status/body/size 設定、呼び出し後 hsp3dx_http_free で解放
//  戻り値: 0=成功、負値=失敗 (WinHTTP error code 等)
int  hsp3dx_http_get ( const char *url,
                       const char *user_agent,
                       const char *extra_headers,
                       int         timeout_ms,
                       hsp3dx_http_response *out );

//  POST "url" with body
//      content_type: "application/json" / "application/x-www-form-urlencoded" 等
int  hsp3dx_http_post( const char *url,
                       const void *body, size_t body_size,
                       const char *content_type,
                       const char *user_agent,
                       const char *extra_headers,
                       int         timeout_ms,
                       hsp3dx_http_response *out );

//  レスポンスの body バッファを解放
void hsp3dx_http_free( hsp3dx_http_response *resp );

#ifdef __cplusplus
}
#endif

#endif
