//
//  hsp3dx_console.cpp — mes / print 用のテキストバッファ実装
//
#include "hsp3dx_console.h"

#include <string.h>
#include <stdio.h>
#include <windows.h>

#include "DxLib.h"

//  UTF-8 → wchar_t 変換 (DxLib は UNICODE 定義下では wchar_t を要求する)
//  呼び出し元の stack バッファに書き込む方式 (DxLib が描画バッチ処理で
//  ポインタを後続フレームまで保持した場合に備えて、毎行別バッファにする)。
static void utf8_to_wide( const char *utf8, wchar_t *out_buf, int out_capacity )
{
    int n = MultiByteToWideChar( CP_UTF8, 0, utf8, -1, out_buf, out_capacity - 1 );
    if ( n <= 0 ) out_buf[0] = 0;
}

//  リングバッファ: 書き込みは末尾追加、溢れたら先頭を破棄。
static char s_lines[HSP3DX_CONSOLE_MAX_LINES][HSP3DX_CONSOLE_LINE_BYTES];
static int  s_line_count = 0;       // 現在の有効行数
static int  s_cur_pos    = 0;       // 最終行の現在の追記位置 (改行待ち中のバッファ)

static void shift_lines_up( void )
{
    //  1 行分スクロール (先頭を捨てる)
    for ( int i = 0; i < HSP3DX_CONSOLE_MAX_LINES - 1; i++ ) {
        memcpy( s_lines[i], s_lines[i + 1], HSP3DX_CONSOLE_LINE_BYTES );
    }
    s_lines[HSP3DX_CONSOLE_MAX_LINES - 1][0] = 0;
    if ( s_line_count > 0 ) s_line_count--;
}

void hsp3dx_console_append( const char *text, int newline )
{
    if ( text == nullptr ) text = "";

    //  まだ 1 行目がなければ初期化
    if ( s_line_count == 0 ) {
        s_lines[0][0] = 0;
        s_line_count  = 1;
        s_cur_pos     = 0;
    }

    int idx = s_line_count - 1;
    int remain = HSP3DX_CONSOLE_LINE_BYTES - 1 - s_cur_pos;
    int n = (int)strlen( text );
    if ( n > remain ) n = remain;
    memcpy( s_lines[idx] + s_cur_pos, text, n );
    s_cur_pos += n;
    s_lines[idx][s_cur_pos] = 0;

    if ( newline ) {
        //  新しい行を作る。既に最大行数なら 1 行シフトしてから追加。
        if ( s_line_count >= HSP3DX_CONSOLE_MAX_LINES ) {
            shift_lines_up();
            s_line_count = HSP3DX_CONSOLE_MAX_LINES;  // 再度最大値
        } else {
            s_line_count++;
        }
        s_lines[s_line_count - 1][0] = 0;
        s_cur_pos = 0;
    }
}

void hsp3dx_console_clear( void )
{
    s_line_count = 0;
    s_cur_pos    = 0;
    for ( int i = 0; i < HSP3DX_CONSOLE_MAX_LINES; i++ ) s_lines[i][0] = 0;
}

void hsp3dx_console_render_dxlib( int left, int top, unsigned int color )
{
    //  フォント高を固定 (DxLib のデフォルト = 16px 相当)。Phase 1.3 で調整可。
    const int line_height = 18;
    for ( int i = 0; i < s_line_count; i++ ) {
        wchar_t wbuf[HSP3DX_CONSOLE_LINE_BYTES];
        utf8_to_wide( s_lines[i], wbuf, HSP3DX_CONSOLE_LINE_BYTES );
        DrawString( left, top + i * line_height, wbuf, (unsigned int)color );
    }
}
