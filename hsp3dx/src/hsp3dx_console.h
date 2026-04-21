//
//  hsp3dx_console.h — UTF-8 ↔ wchar_t 変換ユーティリティ
//
//  Phase 1.3 で「別レイヤの console バッファを main で再描画する」モデルから
//  「mes が即 DxLib DrawString で back buffer に書く」モデルに変更。
//  そのため console バッファは廃止し、本ヘッダは UTF-8 → wchar_t 変換の
//  utility のみ提供する。
//
//  (ファイル名は互換のため残すが、中身は utility 関数のみ。)
//
#ifndef __hsp3dx_console_h
#define __hsp3dx_console_h

#ifdef __cplusplus
extern "C" {
#endif

//  UTF-8 → wchar_t 変換 (呼び出し側のバッファに書き込む)
//  out_capacity は wchar_t 単位の要素数。
void hsp3dx_utf8_to_wide( const char *utf8, wchar_t *out_buf, int out_capacity );

//  UTF-8 文字列を MessageBoxW で表示 (日本語の文字化けを防ぐ)
//  title は NULL 可 (デフォルト "hsp3dx")。
int  hsp3dx_msgbox_utf8( const char *text_utf8, const char *title_utf8, unsigned int mb_flags );

#ifdef __cplusplus
}
#endif

#endif
