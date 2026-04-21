//
//  hsp3dx_console.h — mes / print 専用の最小テキストバッファ
//
//  hsp3dx では Win32 コンソールを使わず、DxLib 画面に文字を書く設計。
//  VM 側 (extcmd の mes 実装) から append、main の render ループから
//  draw を呼ぶ。スレッドセーフにはしていない (VM とレンダリングは同じ
//  メインスレッドで回る想定)。
//
#ifndef __hsp3dx_console_h
#define __hsp3dx_console_h

#ifdef __cplusplus
extern "C" {
#endif

//  最大行数 / 1 行あたりバイト数 は固定。収まらない分は破棄 or 折り返し。
#define HSP3DX_CONSOLE_MAX_LINES   64
#define HSP3DX_CONSOLE_LINE_BYTES  512

//  1 行追加。text が null 終端文字列。newline=1 で改行扱い。
void hsp3dx_console_append( const char *text, int newline );

//  全消去 (cls 用、Phase 1.3+)
void hsp3dx_console_clear( void );

//  main render ループから呼ぶ。DxLib の DrawString を使って現在の
//  バッファ内容を画面に描く。left/top は描画開始ピクセル座標。
void hsp3dx_console_render_dxlib( int left, int top, unsigned int color );

#ifdef __cplusplus
}
#endif

#endif
