//
//  hsp3dx_events.h — アプリライフサイクル / デバイス通知の HSP ラベル連携
//
//  HSP スクリプトは `onevents <ID>, *label` でラベルを登録し、
//  プラットフォーム層 (iOS/Android) から通知が来たらそのラベルへ gosub する。
//  通知は別スレッドから来る可能性があるため static queue に積み、
//  メインループ側で `hsp3dx_events_poll()` を呼んで VM 実行中に発火させる。
//
#ifndef __hsp3dx_events_h
#define __hsp3dx_events_h

#ifdef __cplusplus
extern "C" {
#endif

//  ---- イベント ID (スクリプトから定数で指定) ----
//  下の #define と iron_dxlib.as の #define global ctype DX_EVT_* が一致すること。
#define HSP3DX_EVT_APP_BACKGROUND        0   // アプリがバックグラウンドへ
#define HSP3DX_EVT_APP_FOREGROUND        1   // バックグラウンドから復帰
#define HSP3DX_EVT_APP_WILL_TERMINATE    2   // アプリ終了直前
#define HSP3DX_EVT_APP_LOW_MEMORY        3   // メモリ警告 (iOS didReceiveMemoryWarning 等)
#define HSP3DX_EVT_ORIENTATION_CHANGED   4   // 画面回転
#define HSP3DX_EVT_COUNT                16   // 予約分含めて最大 16

//  ---- HSP スクリプト側 API ----
//  ラベル登録 (nullptr or empty で登録解除)。label は code_getlb() の戻り値。
int  hsp3dx_events_register( int event_id, unsigned short *label );

//  ---- プラットフォーム層 API (別スレッドから呼ばれる可能性あり) ----
//  キューに積むだけ。実際の発火は次のメインループ poll で。
void hsp3dx_events_fire( int event_id );

//  ---- メインループから呼ぶ ----
//  キューに積まれたイベントのラベルを順に code_callback() で発火。
void hsp3dx_events_poll( void );

#ifdef __cplusplus
}
#endif

#endif
