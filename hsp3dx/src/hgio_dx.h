//
//  hgio_dx.h — hsp3dx graphics I/O (DxLib バックエンド)
//
//  HSP3 VM から見える hgio 互換 API を DxLib 呼び出しに転送する層。
//  VM (hsp3embed) 側は hgio_* 関数群だけを呼び、DxLib 固有のことは知らない。
//
//  iOS / Android では同じ関数群が DxLib_iOS / DxLib_Android にルーティングされる。
//
#ifndef __hgio_dx_h
#define __hgio_dx_h

#ifdef __cplusplus
extern "C" {
#endif

// 初期化 / 終了
int  hgio_dx_init( int mode, int sx, int sy, void *hwnd );
void hgio_dx_term( void );

// フレーム制御
int  hgio_dx_render_start( void );
int  hgio_dx_render_end( void );
int  hgio_dx_process_message( void );       // DxLib の ProcessMessage() に相当

// 入力
int  hgio_dx_getkey( int keycode );
void hgio_dx_getmouse( int *px, int *py, int *pbtn );

// TODO: Phase 1.1 以降で描画/音声 API 追加

#ifdef __cplusplus
}
#endif

#endif
