//
//  hsp3dx_http_win.cpp — Windows WinHTTP HTTP クライアント実装
//
//  iron_http.hsp (#uselib winhttp.dll 版) と同等の GET/POST を C++ 静的リンクで提供。
//  hsp3dx は #uselib 禁止なのでここで完結する。
//
#include "hsp3dx_http.h"

#include <windows.h>
#include <winhttp.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#pragma comment(lib, "winhttp.lib")

//  UTF-8 → wchar_t を malloc で確保 (サイズ制限なし)。呼び出し側で free() 責任。
static wchar_t *u8_to_w_alloc( const char *u8 )
{
    if ( !u8 ) u8 = "";
    int need = MultiByteToWideChar( CP_UTF8, 0, u8, -1, nullptr, 0 );
    if ( need <= 0 ) need = 1;
    wchar_t *w = (wchar_t *)malloc( need * sizeof(wchar_t) );
    if ( !w ) return nullptr;
    int n = MultiByteToWideChar( CP_UTF8, 0, u8, -1, w, need );
    if ( n <= 0 ) w[0] = 0;
    return w;
}

//  1 回の HTTP リクエストを実行する内部関数 (verb = L"GET" / L"POST")
static int do_request( const wchar_t *verb,
                       const char   *url_u8,
                       const void   *body, size_t body_size,
                       const char   *content_type,
                       const char   *user_agent,
                       const char   *extra_headers,
                       int           timeout_ms,
                       hsp3dx_http_response *out )
{
    if ( !out ) return -1;
    out->status = 0;
    out->body   = nullptr;
    out->size   = 0;

    //  URL をクラック (長さ無制限、URL 実体のぶんだけ malloc)
    wchar_t *url_w = u8_to_w_alloc( url_u8 );
    if ( !url_w ) return -1;

    URL_COMPONENTS uc;
    memset( &uc, 0, sizeof(uc) );
    uc.dwStructSize      = sizeof(uc);
    uc.dwHostNameLength  = (DWORD)-1;
    uc.dwUrlPathLength   = (DWORD)-1;
    uc.dwSchemeLength    = (DWORD)-1;
    uc.dwExtraInfoLength = (DWORD)-1;
    if ( !WinHttpCrackUrl( url_w, 0, 0, &uc ) ) { free( url_w ); return -2; }

    //  host はドメイン名なので DNS 上限 253 文字 + \0 で十分
    wchar_t host[512] = { 0 };
    if ( uc.dwHostNameLength < 512 ) {
        wcsncpy_s( host, uc.lpszHostName, uc.dwHostNameLength );
    } else { free( url_w ); return -2; }

    //  path + query を動的確保で繋げる (長いクエリ文字列対応)
    size_t   path_needed = ( (size_t)uc.dwUrlPathLength + uc.dwExtraInfoLength + 2 );
    wchar_t *path_full   = (wchar_t *)malloc( path_needed * sizeof(wchar_t) );
    if ( !path_full ) { free( url_w ); return -1; }
    if ( uc.lpszUrlPath && uc.dwUrlPathLength > 0 ) {
        wcsncpy_s( path_full, path_needed, uc.lpszUrlPath,
                   uc.dwUrlPathLength + uc.dwExtraInfoLength );
    } else {
        wcscpy_s( path_full, path_needed, L"/" );
    }

    bool is_https = ( uc.nScheme == INTERNET_SCHEME_HTTPS );
    INTERNET_PORT port = uc.nPort;

    //  セッション作成 (User-Agent は引数 or デフォルト "hsp3dx/1.0")
    wchar_t *ua_w = nullptr;
    if ( user_agent && *user_agent ) {
        ua_w = u8_to_w_alloc( user_agent );
    }
    const wchar_t *ua_use = ua_w ? ua_w : L"hsp3dx/1.0";
    HINTERNET hs = WinHttpOpen( ua_use,
                                WINHTTP_ACCESS_TYPE_AUTOMATIC_PROXY,
                                WINHTTP_NO_PROXY_NAME, WINHTTP_NO_PROXY_BYPASS, 0 );
    if ( ua_w ) free( ua_w );
    if ( !hs ) { free( url_w ); free( path_full ); return -3; }

    //  タイムアウト設定
    WinHttpSetTimeouts( hs, timeout_ms, timeout_ms, timeout_ms, timeout_ms );

    //  接続
    HINTERNET hc = WinHttpConnect( hs, host, port, 0 );
    if ( !hc ) { WinHttpCloseHandle( hs ); free( url_w ); free( path_full ); return -4; }

    //  リクエストオブジェクト
    DWORD rflags = is_https ? WINHTTP_FLAG_SECURE : 0;
    HINTERNET hr = WinHttpOpenRequest( hc, verb, path_full,
                                       nullptr, WINHTTP_NO_REFERER,
                                       WINHTTP_DEFAULT_ACCEPT_TYPES, rflags );
    if ( !hr ) {
        WinHttpCloseHandle( hc );
        WinHttpCloseHandle( hs );
        free( url_w ); free( path_full );
        return -5;
    }

    //  追加ヘッダ (Content-Type + extra_headers を連結)
    wchar_t *ct_w = content_type ? u8_to_w_alloc( content_type ) : nullptr;
    wchar_t *eh_w = extra_headers ? u8_to_w_alloc( extra_headers ) : nullptr;
    size_t   ct_len = ct_w ? wcslen( ct_w ) : 0;
    size_t   eh_len = eh_w ? wcslen( eh_w ) : 0;
    size_t   need   = ( ct_len + eh_len + 32 ) * sizeof(wchar_t);
    wchar_t *headers_w = nullptr;
    DWORD    headers_len = 0;
    if ( ct_len > 0 || eh_len > 0 ) {
        headers_w = (wchar_t *)malloc( need );
        if ( headers_w ) {
            headers_w[0] = 0;
            if ( ct_len > 0 ) {
                wcscat_s( headers_w, need / sizeof(wchar_t), L"Content-Type: " );
                wcscat_s( headers_w, need / sizeof(wchar_t), ct_w );
                wcscat_s( headers_w, need / sizeof(wchar_t), L"\r\n" );
            }
            if ( eh_len > 0 ) {
                wcscat_s( headers_w, need / sizeof(wchar_t), eh_w );
            }
            headers_len = (DWORD)wcslen( headers_w );
        }
    }
    if ( ct_w ) free( ct_w );
    if ( eh_w ) free( eh_w );

    //  body
    DWORD body_len = (DWORD)body_size;
    LPVOID body_ptr = body_size ? (LPVOID)body : WINHTTP_NO_REQUEST_DATA;

    BOOL ok = WinHttpSendRequest( hr, headers_w, headers_len,
                                  body_ptr, body_len, body_len, 0 );
    if ( !ok ) {
        WinHttpCloseHandle( hr ); WinHttpCloseHandle( hc ); WinHttpCloseHandle( hs );
        if ( headers_w ) free( headers_w );
        free( url_w ); free( path_full );
        return -6;
    }
    if ( !WinHttpReceiveResponse( hr, nullptr ) ) {
        WinHttpCloseHandle( hr ); WinHttpCloseHandle( hc ); WinHttpCloseHandle( hs );
        if ( headers_w ) free( headers_w );
        free( url_w ); free( path_full );
        return -7;
    }

    //  ステータスコード取得
    DWORD status = 0;
    DWORD status_size = sizeof(status);
    if ( WinHttpQueryHeaders( hr, WINHTTP_QUERY_STATUS_CODE | WINHTTP_QUERY_FLAG_NUMBER,
                              WINHTTP_HEADER_NAME_BY_INDEX, &status, &status_size,
                              WINHTTP_NO_HEADER_INDEX ) ) {
        out->status = (int)status;
    }

    //  body 取得 (可変長、必要に応じて realloc)
    size_t   cap = 8192;
    size_t   len = 0;
    char    *buf = (char *)malloc( cap );
    if ( !buf ) {
        WinHttpCloseHandle( hr ); WinHttpCloseHandle( hc ); WinHttpCloseHandle( hs );
        return -8;
    }

    while ( true ) {
        DWORD avail = 0;
        if ( !WinHttpQueryDataAvailable( hr, &avail ) ) break;
        if ( avail == 0 ) break;
        if ( len + avail + 1 > cap ) {
            while ( len + avail + 1 > cap ) cap *= 2;
            char *nb = (char *)realloc( buf, cap );
            if ( !nb ) { free( buf ); buf = nullptr; break; }
            buf = nb;
        }
        DWORD read = 0;
        if ( !WinHttpReadData( hr, buf + len, avail, &read ) ) break;
        len += read;
        if ( read == 0 ) break;
    }
    if ( buf ) {
        buf[len] = 0;
        out->body = buf;
        out->size = len;
    }

    WinHttpCloseHandle( hr );
    WinHttpCloseHandle( hc );
    WinHttpCloseHandle( hs );
    if ( headers_w ) free( headers_w );
    free( url_w );
    free( path_full );
    return 0;
}

extern "C" int hsp3dx_http_get( const char *url,
                                const char *user_agent,
                                const char *extra_headers,
                                int         timeout_ms,
                                hsp3dx_http_response *out )
{
    return do_request( L"GET", url, nullptr, 0, nullptr,
                       user_agent, extra_headers, timeout_ms, out );
}

extern "C" int hsp3dx_http_post( const char *url,
                                 const void *body, size_t body_size,
                                 const char *content_type,
                                 const char *user_agent,
                                 const char *extra_headers,
                                 int         timeout_ms,
                                 hsp3dx_http_response *out )
{
    return do_request( L"POST", url, body, body_size, content_type,
                       user_agent, extra_headers, timeout_ms, out );
}

extern "C" void hsp3dx_http_free( hsp3dx_http_response *resp )
{
    if ( !resp ) return;
    if ( resp->body ) { free( resp->body ); resp->body = nullptr; }
    resp->size = 0;
}
