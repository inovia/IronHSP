//
//  hsp3dx_http_win.cpp — Windows WinHTTP HTTP クライアント実装
//
//  cross-platform `hsp3dx_http.h` API の Windows 向け実体。WinHTTP は Win7+ で
//  標準搭載。#uselib 無しでも静的リンク可能なのでモバイル移植時に LoadLibrary
//  の議論から切り離せる。
//
#include "hsp3dx_http.h"

#include <windows.h>
#include <winhttp.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#pragma comment(lib, "winhttp.lib")
#pragma comment(lib, "crypt32.lib")      // CryptBinaryToStringA (base64)

//  ------------------------------------------------------------------
//  内部ユーティリティ
//  ------------------------------------------------------------------

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

static char *w_to_u8_alloc( const wchar_t *w )
{
    if ( !w ) w = L"";
    int need = WideCharToMultiByte( CP_UTF8, 0, w, -1, nullptr, 0, nullptr, nullptr );
    if ( need <= 0 ) need = 1;
    char *s = (char *)malloc( need );
    if ( !s ) return nullptr;
    int n = WideCharToMultiByte( CP_UTF8, 0, w, -1, s, need, nullptr, nullptr );
    if ( n <= 0 ) s[0] = 0;
    return s;
}

//  ------------------------------------------------------------------
//  Cookie ジャー (プロセスグローバル、シンプル実装)
//  ------------------------------------------------------------------

//  本実装では WinHTTP の内部 cookie 機能 (WINHTTP_DISABLE_COOKIES なし) を使うのが
//  最も簡単だが、WinHTTP のクッキー保持は "セッション単位" のため、hsp3dx が毎回
//  新しい WinHttpOpen でセッションを作る構造では持続しない。
//
//  回避策: 単一の WinHTTP セッションハンドルを lazy に保持して使い回す。
//  プロセス終了時に WinHttpCloseHandle。

static HINTERNET g_session   = nullptr;
static int       g_use_cookies = 1;

static HINTERNET get_session( int timeout_ms, const wchar_t *ua )
{
    if ( g_session ) {
        WinHttpSetTimeouts( g_session, timeout_ms, timeout_ms, timeout_ms, timeout_ms );
        return g_session;
    }
    HINTERNET hs = WinHttpOpen( ua,
                                WINHTTP_ACCESS_TYPE_AUTOMATIC_PROXY,
                                WINHTTP_NO_PROXY_NAME, WINHTTP_NO_PROXY_BYPASS, 0 );
    if ( !hs ) return nullptr;
    WinHttpSetTimeouts( hs, timeout_ms, timeout_ms, timeout_ms, timeout_ms );
    g_session = hs;
    return hs;
}

extern "C" void hsp3dx_http_cookie_clear( void )
{
    if ( g_session ) {
        WinHttpCloseHandle( g_session );
        g_session = nullptr;
    }
}

extern "C" void hsp3dx_http_cookie_set_enabled( int enabled )
{
    g_use_cookies = enabled;
}

//  ------------------------------------------------------------------
//  リクエスト共通部
//  ------------------------------------------------------------------

struct RequestIO {
    HINTERNET hr          = nullptr;
    HINTERNET hc          = nullptr;
    wchar_t  *url_w       = nullptr;
    wchar_t  *path_full   = nullptr;
    wchar_t  *headers_w   = nullptr;
};

static void cleanup_io( RequestIO &io )
{
    if ( io.hr )        WinHttpCloseHandle( io.hr );
    if ( io.hc )        WinHttpCloseHandle( io.hc );
    //  hs はグローバルなので閉じない
    if ( io.headers_w ) free( io.headers_w );
    if ( io.url_w )     free( io.url_w );
    if ( io.path_full ) free( io.path_full );
    io.hr = nullptr; io.hc = nullptr;
    io.headers_w = nullptr; io.url_w = nullptr; io.path_full = nullptr;
}

//  リクエスト準備 (hc + hr を open まで)
static int prepare_request( const wchar_t *verb,
                            const char    *url_u8,
                            const char    *user_agent,
                            RequestIO     &io )
{
    io.url_w = u8_to_w_alloc( url_u8 );
    if ( !io.url_w ) return -1;

    URL_COMPONENTS uc;
    memset( &uc, 0, sizeof(uc) );
    uc.dwStructSize      = sizeof(uc);
    uc.dwHostNameLength  = (DWORD)-1;
    uc.dwUrlPathLength   = (DWORD)-1;
    uc.dwSchemeLength    = (DWORD)-1;
    uc.dwExtraInfoLength = (DWORD)-1;
    if ( !WinHttpCrackUrl( io.url_w, 0, 0, &uc ) ) return -2;

    wchar_t host[512] = { 0 };
    if ( uc.dwHostNameLength >= 512 ) return -2;
    wcsncpy_s( host, uc.lpszHostName, uc.dwHostNameLength );

    size_t need = (size_t)uc.dwUrlPathLength + uc.dwExtraInfoLength + 2;
    io.path_full = (wchar_t *)malloc( need * sizeof(wchar_t) );
    if ( !io.path_full ) return -1;
    if ( uc.lpszUrlPath && uc.dwUrlPathLength > 0 ) {
        wcsncpy_s( io.path_full, need, uc.lpszUrlPath,
                   uc.dwUrlPathLength + uc.dwExtraInfoLength );
    } else {
        wcscpy_s( io.path_full, need, L"/" );
    }

    bool is_https = ( uc.nScheme == INTERNET_SCHEME_HTTPS );
    INTERNET_PORT port = uc.nPort;

    //  ua 指定あればそれで、なければデフォルト
    wchar_t *ua_w = nullptr;
    if ( user_agent && *user_agent ) ua_w = u8_to_w_alloc( user_agent );
    const wchar_t *ua_use = ua_w ? ua_w : L"hsp3dx/1.0";

    HINTERNET hs = get_session( 30000, ua_use );
    if ( ua_w ) free( ua_w );
    if ( !hs ) return -3;

    io.hc = WinHttpConnect( hs, host, port, 0 );
    if ( !io.hc ) return -4;

    DWORD rflags = is_https ? WINHTTP_FLAG_SECURE : 0;
    io.hr = WinHttpOpenRequest( io.hc, verb, io.path_full,
                                nullptr, WINHTTP_NO_REFERER,
                                WINHTTP_DEFAULT_ACCEPT_TYPES, rflags );
    if ( !io.hr ) return -5;

    //  HTTP/2 有効化 (サーバが対応していれば使う、非対応なら自動で HTTP/1.1 fallback)
    DWORD http2 = WINHTTP_PROTOCOL_FLAG_HTTP2;
    WinHttpSetOption( io.hr, WINHTTP_OPTION_ENABLE_HTTP_PROTOCOL,
                      &http2, sizeof(http2) );

    //  gzip / deflate 自動解凍
    DWORD decomp = WINHTTP_DECOMPRESSION_FLAG_ALL;
    WinHttpSetOption( io.hr, WINHTTP_OPTION_DECOMPRESSION,
                      &decomp, sizeof(decomp) );

    //  Cookie 動作
    if ( !g_use_cookies ) {
        DWORD nocookie = WINHTTP_DISABLE_COOKIES;
        WinHttpSetOption( io.hr, WINHTTP_OPTION_DISABLE_FEATURE,
                          &nocookie, sizeof(nocookie) );
    }

    return 0;
}

//  共通のレスポンス受信ループ (body + ヘッダ取得)
static int receive_response( RequestIO &io, hsp3dx_http_response *out,
                             FILE *dest_fp, size_t *dest_written )
{
    //  ステータスコード取得
    DWORD status = 0;
    DWORD status_size = sizeof(status);
    if ( WinHttpQueryHeaders( io.hr,
                              WINHTTP_QUERY_STATUS_CODE | WINHTTP_QUERY_FLAG_NUMBER,
                              WINHTTP_HEADER_NAME_BY_INDEX, &status, &status_size,
                              WINHTTP_NO_HEADER_INDEX ) ) {
        if ( out ) out->status = (int)status;
    }

    //  全ヘッダ文字列取得 (out->headers に保存)
    if ( out ) {
        DWORD hsize = 0;
        WinHttpQueryHeaders( io.hr,
                             WINHTTP_QUERY_RAW_HEADERS_CRLF,
                             WINHTTP_HEADER_NAME_BY_INDEX, nullptr, &hsize,
                             WINHTTP_NO_HEADER_INDEX );
        if ( hsize > 0 ) {
            wchar_t *hw = (wchar_t *)malloc( hsize );
            if ( hw ) {
                if ( WinHttpQueryHeaders( io.hr, WINHTTP_QUERY_RAW_HEADERS_CRLF,
                                          WINHTTP_HEADER_NAME_BY_INDEX, hw, &hsize,
                                          WINHTTP_NO_HEADER_INDEX ) ) {
                    out->headers = w_to_u8_alloc( hw );
                }
                free( hw );
            }
        }
    }

    //  body 取得 (メモリ積み or ファイル出力)
    size_t cap = 8192;
    size_t len = 0;
    char   *buf = nullptr;
    if ( out ) {
        buf = (char *)malloc( cap );
        if ( !buf ) return -8;
    }
    if ( dest_written ) *dest_written = 0;

    while ( true ) {
        DWORD avail = 0;
        if ( !WinHttpQueryDataAvailable( io.hr, &avail ) ) break;
        if ( avail == 0 ) break;

        //  tmp で読み込む
        char *tmp = (char *)malloc( avail );
        if ( !tmp ) break;
        DWORD read = 0;
        if ( !WinHttpReadData( io.hr, tmp, avail, &read ) || read == 0 ) {
            free( tmp );
            break;
        }
        if ( dest_fp ) {
            fwrite( tmp, 1, read, dest_fp );
            if ( dest_written ) *dest_written += read;
        }
        if ( buf ) {
            if ( len + read + 1 > cap ) {
                while ( len + read + 1 > cap ) cap *= 2;
                char *nb = (char *)realloc( buf, cap );
                if ( !nb ) { free( buf ); buf = nullptr; free( tmp ); break; }
                buf = nb;
            }
            memcpy( buf + len, tmp, read );
            len += read;
        }
        free( tmp );
    }
    if ( buf ) {
        buf[len] = 0;
        if ( out ) { out->body = buf; out->size = len; }
    }
    return 0;
}

//  メソッド名 + body + オプション → リクエスト発行
extern "C" int hsp3dx_http_request( const char *method,
                                    const char *url,
                                    const void *body, size_t body_size,
                                    const char *content_type,
                                    const char *user_agent,
                                    const char *extra_headers,
                                    int         timeout_ms,
                                    hsp3dx_http_response *out )
{
    if ( !out ) return -1;
    out->status = 0; out->body = nullptr; out->size = 0; out->headers = nullptr;

    wchar_t *verb_w = u8_to_w_alloc( method ? method : "GET" );
    if ( !verb_w ) return -1;

    RequestIO io;
    int rc = prepare_request( verb_w, url, user_agent, io );
    free( verb_w );
    if ( rc != 0 ) { cleanup_io( io ); return rc; }

    //  タイムアウト (セッション側にも設定されているが、ここでも保険的に)
    WinHttpSetTimeouts( io.hr, timeout_ms, timeout_ms, timeout_ms, timeout_ms );

    //  追加ヘッダ (Content-Type + extra)
    wchar_t *ct_w = content_type ? u8_to_w_alloc( content_type ) : nullptr;
    wchar_t *eh_w = extra_headers ? u8_to_w_alloc( extra_headers ) : nullptr;
    size_t ct_len = ct_w ? wcslen( ct_w ) : 0;
    size_t eh_len = eh_w ? wcslen( eh_w ) : 0;
    size_t need = ( ct_len + eh_len + 32 ) * sizeof(wchar_t);
    DWORD  headers_len = 0;
    if ( ct_len > 0 || eh_len > 0 ) {
        io.headers_w = (wchar_t *)malloc( need );
        if ( io.headers_w ) {
            io.headers_w[0] = 0;
            if ( ct_len > 0 ) {
                wcscat_s( io.headers_w, need / sizeof(wchar_t), L"Content-Type: " );
                wcscat_s( io.headers_w, need / sizeof(wchar_t), ct_w );
                wcscat_s( io.headers_w, need / sizeof(wchar_t), L"\r\n" );
            }
            if ( eh_len > 0 ) wcscat_s( io.headers_w, need / sizeof(wchar_t), eh_w );
            headers_len = (DWORD)wcslen( io.headers_w );
        }
    }
    if ( ct_w ) free( ct_w );
    if ( eh_w ) free( eh_w );

    DWORD  body_len = (DWORD)body_size;
    LPVOID body_ptr = body_size ? (LPVOID)body : WINHTTP_NO_REQUEST_DATA;
    BOOL ok = WinHttpSendRequest( io.hr, io.headers_w, headers_len,
                                  body_ptr, body_len, body_len, 0 );
    if ( !ok ) { cleanup_io( io ); return -6; }
    if ( !WinHttpReceiveResponse( io.hr, nullptr ) ) { cleanup_io( io ); return -7; }

    int rrc = receive_response( io, out, nullptr, nullptr );
    cleanup_io( io );
    return rrc;
}

//  便利 wrapper
extern "C" int hsp3dx_http_get( const char *url, const char *ua, const char *xhdr,
                                int timeout_ms, hsp3dx_http_response *out )
{
    return hsp3dx_http_request( "GET", url, nullptr, 0, nullptr, ua, xhdr, timeout_ms, out );
}

extern "C" int hsp3dx_http_post( const char *url, const void *body, size_t size,
                                 const char *ct, const char *ua, const char *xhdr,
                                 int timeout_ms, hsp3dx_http_response *out )
{
    return hsp3dx_http_request( "POST", url, body, size, ct, ua, xhdr, timeout_ms, out );
}

extern "C" int hsp3dx_http_put( const char *url, const void *body, size_t size,
                                const char *ct, const char *ua, const char *xhdr,
                                int timeout_ms, hsp3dx_http_response *out )
{
    return hsp3dx_http_request( "PUT", url, body, size, ct, ua, xhdr, timeout_ms, out );
}

extern "C" int hsp3dx_http_delete( const char *url, const char *ua, const char *xhdr,
                                   int timeout_ms, hsp3dx_http_response *out )
{
    return hsp3dx_http_request( "DELETE", url, nullptr, 0, nullptr, ua, xhdr, timeout_ms, out );
}

extern "C" int hsp3dx_http_patch( const char *url, const void *body, size_t size,
                                  const char *ct, const char *ua, const char *xhdr,
                                  int timeout_ms, hsp3dx_http_response *out )
{
    return hsp3dx_http_request( "PATCH", url, body, size, ct, ua, xhdr, timeout_ms, out );
}

//  ダウンロード: ストリーム保存 (大きいファイル対応、メモリに全部載せない)
extern "C" int hsp3dx_http_download( const char *url, const char *dest_path_u8,
                                     const char *ua, const char *xhdr,
                                     int timeout_ms,
                                     int *out_status, size_t *out_size )
{
    if ( out_status ) *out_status = 0;
    if ( out_size )   *out_size   = 0;

    wchar_t *dest_w = u8_to_w_alloc( dest_path_u8 );
    if ( !dest_w ) return -1;
    FILE *fp = _wfopen( dest_w, L"wb" );
    free( dest_w );
    if ( !fp ) return -9;

    RequestIO io;
    int rc = prepare_request( L"GET", url, ua, io );
    if ( rc != 0 ) { fclose( fp ); cleanup_io( io ); return rc; }

    WinHttpSetTimeouts( io.hr, timeout_ms, timeout_ms, timeout_ms, timeout_ms );

    wchar_t *xh_w = xhdr ? u8_to_w_alloc( xhdr ) : nullptr;
    DWORD   hlen  = xh_w ? (DWORD)wcslen( xh_w ) : 0;

    BOOL ok = WinHttpSendRequest( io.hr, xh_w, hlen,
                                  WINHTTP_NO_REQUEST_DATA, 0, 0, 0 );
    if ( xh_w ) free( xh_w );
    if ( !ok ) { fclose( fp ); cleanup_io( io ); return -6; }
    if ( !WinHttpReceiveResponse( io.hr, nullptr ) ) {
        fclose( fp ); cleanup_io( io ); return -7;
    }

    //  受信時 out は使わず fp にのみ書き込む
    size_t written = 0;
    DWORD  status = 0, ssz = sizeof(status);
    WinHttpQueryHeaders( io.hr,
                         WINHTTP_QUERY_STATUS_CODE | WINHTTP_QUERY_FLAG_NUMBER,
                         WINHTTP_HEADER_NAME_BY_INDEX, &status, &ssz,
                         WINHTTP_NO_HEADER_INDEX );
    if ( out_status ) *out_status = (int)status;

    int rrc = receive_response( io, nullptr, fp, &written );
    if ( out_size ) *out_size = written;

    fclose( fp );
    cleanup_io( io );
    return rrc;
}

//  ヘッダ値取得 (大文字小文字無視)
extern "C" int hsp3dx_http_get_header( const hsp3dx_http_response *resp,
                                       const char *name,
                                       char *out, size_t out_cap )
{
    if ( !resp || !resp->headers || !name || !out || out_cap == 0 ) return -1;
    const char *p = resp->headers;
    size_t name_len = strlen( name );
    while ( *p ) {
        //  line start, search for ':'
        const char *colon = strchr( p, ':' );
        const char *eol   = strstr( p, "\r\n" );
        if ( !eol ) eol = p + strlen( p );
        if ( colon && colon < eol ) {
            size_t key_len = (size_t)( colon - p );
            if ( key_len == name_len ) {
                int match = 1;
                for ( size_t i = 0; i < name_len; i++ ) {
                    if ( tolower( (unsigned char)p[i] ) !=
                         tolower( (unsigned char)name[i] ) ) { match = 0; break; }
                }
                if ( match ) {
                    const char *vstart = colon + 1;
                    while ( vstart < eol && ( *vstart == ' ' || *vstart == '\t' ) ) vstart++;
                    size_t vlen = (size_t)( eol - vstart );
                    if ( vlen >= out_cap ) vlen = out_cap - 1;
                    memcpy( out, vstart, vlen );
                    out[vlen] = 0;
                    return 0;
                }
            }
        }
        if ( *eol == 0 ) break;
        p = eol + 2;
    }
    out[0] = 0;
    return -1;
}

//  Basic 認証ヘッダ生成 ("Basic base64(user:pass)")
extern "C" int hsp3dx_http_build_basic_auth( const char *user, const char *pass,
                                             char *out, size_t out_cap )
{
    if ( !user || !pass || !out || out_cap < 32 ) return -1;
    size_t u_len = strlen( user );
    size_t p_len = strlen( pass );
    size_t pair_len = u_len + 1 + p_len;
    char *pair = (char *)malloc( pair_len + 1 );
    if ( !pair ) return -1;
    memcpy( pair, user, u_len );
    pair[u_len] = ':';
    memcpy( pair + u_len + 1, pass, p_len );
    pair[pair_len] = 0;

    //  WinAPI CryptBinaryToStringA を使う (base64 エンコード)
    //  CRYPT_STRING_BASE64 | CRYPT_STRING_NOCRLF で 1 行にする
    DWORD enc_len = 0;
    //  sizeof prefix "Basic " + base64 length + 1
    CryptBinaryToStringA( (BYTE *)pair, (DWORD)pair_len,
                          CRYPT_STRING_BASE64 | CRYPT_STRING_NOCRLF,
                          nullptr, &enc_len );
    if ( enc_len + 7 > out_cap ) { free( pair ); return -1; }
    strcpy( out, "Basic " );
    char *b64 = out + 6;
    DWORD cap_left = (DWORD)( out_cap - 6 );
    CryptBinaryToStringA( (BYTE *)pair, (DWORD)pair_len,
                          CRYPT_STRING_BASE64 | CRYPT_STRING_NOCRLF,
                          b64, &cap_left );
    free( pair );
    return 0;
}

extern "C" void hsp3dx_http_free( hsp3dx_http_response *resp )
{
    if ( !resp ) return;
    if ( resp->body )    { free( resp->body );    resp->body = nullptr; }
    if ( resp->headers ) { free( resp->headers ); resp->headers = nullptr; }
    resp->size = 0;
}

//  ------------------------------------------------------------------
//  multipart/form-data ビルダ
//  ------------------------------------------------------------------

struct MpBuilder {
    unsigned char *buf  = nullptr;  // body バイト列
    size_t         len  = 0;
    size_t         cap  = 0;
    char           boundary[64] = { 0 };
};
static MpBuilder g_mp;

static void mp_append( const void *data, size_t n )
{
    if ( g_mp.len + n > g_mp.cap ) {
        size_t new_cap = g_mp.cap ? g_mp.cap : 4096;
        while ( g_mp.len + n > new_cap ) new_cap *= 2;
        unsigned char *nb = (unsigned char *)realloc( g_mp.buf, new_cap );
        if ( !nb ) return;
        g_mp.buf = nb;
        g_mp.cap = new_cap;
    }
    memcpy( g_mp.buf + g_mp.len, data, n );
    g_mp.len += n;
}

static void mp_append_str( const char *s ) { mp_append( s, strlen( s ) ); }

static const char *basename_of( const char *path )
{
    const char *p = path;
    const char *last = p;
    while ( *p ) {
        if ( *p == '/' || *p == '\\' ) last = p + 1;
        p++;
    }
    return last;
}

static const char *guess_mime( const char *path )
{
    const char *dot = strrchr( path, '.' );
    if ( !dot ) return "application/octet-stream";
    if ( _stricmp( dot, ".png" )  == 0 ) return "image/png";
    if ( _stricmp( dot, ".jpg" )  == 0 ) return "image/jpeg";
    if ( _stricmp( dot, ".jpeg" ) == 0 ) return "image/jpeg";
    if ( _stricmp( dot, ".gif" )  == 0 ) return "image/gif";
    if ( _stricmp( dot, ".webp" ) == 0 ) return "image/webp";
    if ( _stricmp( dot, ".bmp" )  == 0 ) return "image/bmp";
    if ( _stricmp( dot, ".pdf" )  == 0 ) return "application/pdf";
    if ( _stricmp( dot, ".json" ) == 0 ) return "application/json";
    if ( _stricmp( dot, ".txt" )  == 0 ) return "text/plain";
    if ( _stricmp( dot, ".html" ) == 0 ) return "text/html";
    if ( _stricmp( dot, ".mp4" )  == 0 ) return "video/mp4";
    if ( _stricmp( dot, ".wav" )  == 0 ) return "audio/wav";
    if ( _stricmp( dot, ".mp3" )  == 0 ) return "audio/mpeg";
    return "application/octet-stream";
}

extern "C" void hsp3dx_http_mp_begin( void )
{
    if ( g_mp.buf ) free( g_mp.buf );
    g_mp.buf = nullptr;
    g_mp.len = 0;
    g_mp.cap = 0;
    //  ランダム風 boundary 生成 (時刻ベース、完全乱数不要)
    FILETIME ft; GetSystemTimeAsFileTime( &ft );
    snprintf( g_mp.boundary, sizeof(g_mp.boundary),
              "----hsp3dx-%08x%08x",
              (unsigned)ft.dwLowDateTime, (unsigned)ft.dwHighDateTime );
}

extern "C" int hsp3dx_http_mp_add_text( const char *name, const char *value )
{
    if ( !g_mp.boundary[0] ) return -1;
    if ( !name || !value ) return -1;
    mp_append_str( "--" );
    mp_append_str( g_mp.boundary );
    mp_append_str( "\r\nContent-Disposition: form-data; name=\"" );
    mp_append_str( name );
    mp_append_str( "\"\r\n\r\n" );
    mp_append_str( value );
    mp_append_str( "\r\n" );
    return 0;
}

extern "C" int hsp3dx_http_mp_add_file( const char *name,
                                        const char *file_path_u8,
                                        const char *content_type,
                                        const char *filename )
{
    if ( !g_mp.boundary[0] ) return -1;
    if ( !name || !file_path_u8 ) return -1;
    const char *disp_name = filename ? filename : basename_of( file_path_u8 );
    const char *mime      = content_type ? content_type : guess_mime( file_path_u8 );

    //  ファイル読み込み
    wchar_t *wpath = u8_to_w_alloc( file_path_u8 );
    if ( !wpath ) return -1;
    FILE *fp = _wfopen( wpath, L"rb" );
    free( wpath );
    if ( !fp ) return -9;
    fseek( fp, 0, SEEK_END );
    long sz = ftell( fp );
    fseek( fp, 0, SEEK_SET );
    if ( sz < 0 ) { fclose( fp ); return -9; }

    mp_append_str( "--" );
    mp_append_str( g_mp.boundary );
    mp_append_str( "\r\nContent-Disposition: form-data; name=\"" );
    mp_append_str( name );
    mp_append_str( "\"; filename=\"" );
    mp_append_str( disp_name );
    mp_append_str( "\"\r\nContent-Type: " );
    mp_append_str( mime );
    mp_append_str( "\r\n\r\n" );

    //  ファイル本体を追記
    size_t old_len = g_mp.len;
    if ( g_mp.len + (size_t)sz + 2 > g_mp.cap ) {
        size_t nc = g_mp.cap ? g_mp.cap : 4096;
        while ( g_mp.len + (size_t)sz + 2 > nc ) nc *= 2;
        unsigned char *nb = (unsigned char *)realloc( g_mp.buf, nc );
        if ( !nb ) { fclose( fp ); return -1; }
        g_mp.buf = nb; g_mp.cap = nc;
    }
    size_t rd = fread( g_mp.buf + g_mp.len, 1, (size_t)sz, fp );
    g_mp.len += rd;
    fclose( fp );
    if ( rd != (size_t)sz ) { g_mp.len = old_len; return -9; }

    mp_append_str( "\r\n" );
    return 0;
}

extern "C" int hsp3dx_http_mp_post( const char *url,
                                    const char *ua, const char *xhdr,
                                    int timeout_ms,
                                    hsp3dx_http_response *out )
{
    if ( !g_mp.boundary[0] ) return -1;

    //  終端 boundary
    mp_append_str( "--" );
    mp_append_str( g_mp.boundary );
    mp_append_str( "--\r\n" );

    //  Content-Type ヘッダ
    char ct[128];
    snprintf( ct, sizeof(ct), "multipart/form-data; boundary=%s", g_mp.boundary );

    int rc = hsp3dx_http_request( "POST", url,
                                  g_mp.buf, g_mp.len,
                                  ct, ua, xhdr, timeout_ms, out );
    return rc;
}

extern "C" void hsp3dx_http_mp_end( void )
{
    if ( g_mp.buf ) { free( g_mp.buf ); g_mp.buf = nullptr; }
    g_mp.len = 0;
    g_mp.cap = 0;
    g_mp.boundary[0] = 0;
}
