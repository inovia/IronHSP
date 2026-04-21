//
//  hsp3dx_ws.h — Win/iOS/Android 共通 WebSocket クライアント抽象
//
//  実装:
//      Win     : hsp3dx_ws_win.cpp  (WinHTTP WebSocket、Windows 8+)
//      iOS     : hsp3dx_ws_ios.mm   (NSURLSessionWebSocketTask、Phase 3)
//      Android : hsp3dx_ws_ndk.cpp  (OkHttp via JNI、Phase 4)
//
//  設計:
//      * ハンドル方式 (int ID、無効は -1)
//      * 受信は background thread で受けてキューに積む → dx_ws_recv で取り出す
//      * 送信は直接呼び出し (ブロッキングだが通常は高速)
//      * text / binary 両対応
//      * URL は ws:// / wss://
//
#ifndef __hsp3dx_ws_h
#define __hsp3dx_ws_h

#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

enum {
    HSP3DX_WS_OPEN       = 0,
    HSP3DX_WS_CONNECTING = 1,
    HSP3DX_WS_CLOSING    = 2,
    HSP3DX_WS_CLOSED     = 3,
};

enum {
    HSP3DX_WS_MSG_TEXT   = 0,
    HSP3DX_WS_MSG_BINARY = 1,
};

//  接続 (blocking、タイムアウトは内部設定)
//      url       : "ws://host:port/path" または "wss://..."
//      extra_hdr : NULL 可 "Name: val\r\n..." 追加ヘッダ (Origin, Sec-WebSocket-Protocol 等)
//      timeout_ms: 接続タイムアウト
//  戻り値: handle (>=0) / -1 失敗
int  hsp3dx_ws_connect( const char *url, const char *extra_hdr, int timeout_ms );

//  切断 + 解放 (ハンドル ID は即無効化)
void hsp3dx_ws_close  ( int handle, int code );
void hsp3dx_ws_free   ( int handle );

//  送信 (blocking、通常すぐ返る)
//      戻り値: 0=成功、負値=失敗
int  hsp3dx_ws_send_text  ( int handle, const char *text, size_t len );
int  hsp3dx_ws_send_binary( int handle, const void *data, size_t len );

//  受信 (内部キューから取り出し)
//      timeout_ms = 0 で即時ポーリング、>0 でブロッキング待機
//      out        : 受信したバイトを書き込む buffer (null 終端)
//      out_cap    : buffer 容量
//      *out_len   : 実際のバイト数
//      *out_type  : TEXT (0) / BINARY (1)
//  戻り値: 0=受信あり / 1=タイムアウト / -1=切断 or エラー
int  hsp3dx_ws_recv   ( int handle, int timeout_ms,
                         void *out, size_t out_cap,
                         size_t *out_len, int *out_type );

//  接続状態 (HSP3DX_WS_*)
int  hsp3dx_ws_status ( int handle );

#ifdef __cplusplus
}
#endif

#endif
