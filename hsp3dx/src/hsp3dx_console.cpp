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
