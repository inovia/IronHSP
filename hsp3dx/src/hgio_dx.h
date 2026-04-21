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

// ScreenFlip 代替 (現状は ScreenFlip() を呼ぶだけ)
int  hgio_dx_flip( void );

// 入力
int  hgio_dx_getkey( int keycode );
void hgio_dx_getmouse( int *px, int *py, int *pbtn );

// 画面フィット切替 (主に Android)
//   mode = 0: アスペクト比維持 letterbox (余白は黒) ← hsp3dx default
//          1: 画面いっぱいにストレッチ (比率無視)
//          2: ピクセル等倍 (未実装、現状 0 と同じ)
void hgio_dx_set_screen_fit( int mode );

// 論理解像度の取得 / 変更 (screen 命令経由)。SetGraphMode を呼ぶ + 内部値更新
int  hgio_dx_get_screen_width( void );
int  hgio_dx_get_screen_height( void );
void hgio_dx_set_screen_size( int w, int h );

// 物理画面 (デスクトップ / 端末) のネイティブ解像度を取得
//   戻り値: 0=成功、-1=取得失敗 (その場合 pw/ph に 640/480 fallback を書く)
int  hgio_dx_get_display_size( int *pw, int *ph );

// マルチタッチ対応
//   Android: DxLib GetTouchInput を呼ぶ
//   Win    : マウス左ボタン押下を 1 本指として扱う (互換性のため)
int  hgio_dx_get_touch_num( void );
int  hgio_dx_get_touch( int index, int *px, int *py );   // 0=成功、-1=範囲外

// TODO: Phase 1.1 以降で描画/音声 API 追加

#ifdef __cplusplus
}
#endif

#endif
