//
//  hsp3dx_console.cpp — UTF-8 → wchar_t 変換 (utility)
//
#include "hsp3dx_console.h"

#include <windows.h>

void hsp3dx_utf8_to_wide( const char *utf8, wchar_t *out_buf, int out_capacity )
{
    if ( out_buf == nullptr || out_capacity <= 0 ) return;
    if ( utf8 == nullptr ) { out_buf[0] = 0; return; }
    int n = MultiByteToWideChar( CP_UTF8, 0, utf8, -1, out_buf, out_capacity - 1 );
    if ( n <= 0 ) out_buf[0] = 0;
}

//  UTF-8 文字列を動的確保の wchar_t バッファに変換 (呼び出し側 free)
static wchar_t *utf8_dup_w( const char *utf8 )
{
    if ( !utf8 ) return nullptr;
    int n = MultiByteToWideChar( CP_UTF8, 0, utf8, -1, nullptr, 0 );
    if ( n <= 0 ) return nullptr;
    wchar_t *w = (wchar_t *)malloc( sizeof(wchar_t) * (size_t)n );
    if ( !w ) return nullptr;
    MultiByteToWideChar( CP_UTF8, 0, utf8, -1, w, n );
    return w;
}

int hsp3dx_msgbox_utf8( const char *text_utf8, const char *title_utf8, unsigned int mb_flags )
{
    wchar_t *wt = utf8_dup_w( text_utf8 ? text_utf8 : "" );
    wchar_t *wc = utf8_dup_w( title_utf8 ? title_utf8 : "hsp3dx" );
    int rc = MessageBoxW( nullptr,
                          wt ? wt : L"",
                          wc ? wc : L"hsp3dx",
                          mb_flags );
    if ( wt ) free( wt );
    if ( wc ) free( wc );
    return rc;
}
