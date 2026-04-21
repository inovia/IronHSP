//
//  hsp3dx_console.cpp — UTF-8 → wchar_t 変換 + msgbox (Win/Android/iOS 共通)
//
#include "hsp3dx_console.h"

#include <stdio.h>
#include <stdlib.h>

#ifdef _WIN32
#include <windows.h>
#elif defined(__ANDROID__)
#include <android/log.h>
#elif defined(__APPLE__)
#include <os/log.h>
#endif

void hsp3dx_utf8_to_wide( const char *utf8, wchar_t *out_buf, int out_capacity )
{
    if ( out_buf == nullptr || out_capacity <= 0 ) return;
    if ( utf8 == nullptr ) { out_buf[0] = 0; return; }
#ifdef _WIN32
    int n = MultiByteToWideChar( CP_UTF8, 0, utf8, -1, out_buf, out_capacity - 1 );
    if ( n <= 0 ) out_buf[0] = 0;
#else
    //  Android/iOS: HSP3Dx は UTF-8 固定なので wchar_t 変換は実質不要。
    //  一応 mbstowcs で変換するが、普通は呼ばれない (Windows 専用経路から使われる API)。
    size_t n = mbstowcs( out_buf, utf8, (size_t)out_capacity - 1 );
    if ( n == (size_t)-1 ) out_buf[0] = 0;
    else                   out_buf[n] = 0;
#endif
}

#ifdef _WIN32
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
#endif

int hsp3dx_msgbox_utf8( const char *text_utf8, const char *title_utf8, unsigned int mb_flags )
{
#ifdef _WIN32
    wchar_t *wt = utf8_dup_w( text_utf8 ? text_utf8 : "" );
    wchar_t *wc = utf8_dup_w( title_utf8 ? title_utf8 : "hsp3dx" );
    int rc = MessageBoxW( nullptr,
                          wt ? wt : L"",
                          wc ? wc : L"hsp3dx",
                          mb_flags );
    if ( wt ) free( wt );
    if ( wc ) free( wc );
    return rc;
#elif defined(__ANDROID__)
    //  Android: logcat に出すのみ (ダイアログ UI はユーザ側で Toast 等使うこと)
    (void)mb_flags;
    __android_log_print( ANDROID_LOG_ERROR,
                         title_utf8 ? title_utf8 : "hsp3dx",
                         "%s", text_utf8 ? text_utf8 : "" );
    return 0;
#elif defined(__APPLE__)
    //  iOS: os_log に出す (xcrun simctl log / Console.app で見える)
    (void)mb_flags;
    os_log_error( OS_LOG_DEFAULT, "[%{public}s] %{public}s",
                  title_utf8 ? title_utf8 : "hsp3dx",
                  text_utf8 ? text_utf8 : "" );
    return 0;
#else
    //  Linux: stderr に出すだけ
    (void)mb_flags;
    fprintf( stderr, "[%s] %s\n",
             title_utf8 ? title_utf8 : "hsp3dx",
             text_utf8 ? text_utf8 : "" );
    return 0;
#endif
}
