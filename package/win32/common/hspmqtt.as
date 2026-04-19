;============================================================
;  hspmqtt.as — 最小 MQTT 3.1.1 クライアント (TCP, TLS 未対応)
;============================================================
#ifndef __hspmqtt_as__
#define __hspmqtt_as__
#ifdef _HSP64
#uselib "hspmqtt_64.dll"
#else
#uselib "hspmqtt.dll"
#endif
; open(host, port, client_id, keepalive_sec) → stat = handle (>=0 成功)
#cfunc hspmqtt_open      "hspmqtt_open"       str, int, str, int
; publish/subscribe: 戻り値 0 成功、<0 失敗
#func  hspmqtt_publish   "hspmqtt_publish"    int, str, str
#func  hspmqtt_subscribe "hspmqtt_subscribe"  int, str
; recv: 非ブロッキング受信、戻り値 = payload バイト数 (0 = 何もなし)
#cfunc hspmqtt_recv      "hspmqtt_recv"       int, var, int, var, int
#func  hspmqtt_close     "hspmqtt_close"      int
#endif
