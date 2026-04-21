//
//  hsp3dx_http_ndk.cpp — Android 版 HTTP クライアント (stub、Phase 4.1 以降で本実装)
//
//  将来: HttpURLConnection via JNI、または Cronet
//
#include "hsp3dx_http.h"
#include <stdlib.h>
#include <string.h>

extern "C" int hsp3dx_http_request( const char *, const char *,
                                    const void *, size_t,
                                    const char *, const char *,
                                    const char *, int,
                                    hsp3dx_http_response *out )
{
    if ( out ) { out->status = 0; out->body = nullptr; out->size = 0; out->headers = nullptr; }
    return -1;      // Android 版未実装
}

extern "C" int hsp3dx_http_get   ( const char *, const char *, const char *, int, hsp3dx_http_response *out )
{ if ( out ) { out->status = 0; out->body = nullptr; out->size = 0; out->headers = nullptr; } return -1; }
extern "C" int hsp3dx_http_post  ( const char *, const void *, size_t, const char *, const char *, const char *, int, hsp3dx_http_response *out )
{ if ( out ) { out->status = 0; out->body = nullptr; out->size = 0; out->headers = nullptr; } return -1; }
extern "C" int hsp3dx_http_put   ( const char *, const void *, size_t, const char *, const char *, const char *, int, hsp3dx_http_response *out )
{ if ( out ) { out->status = 0; out->body = nullptr; out->size = 0; out->headers = nullptr; } return -1; }
extern "C" int hsp3dx_http_delete( const char *, const char *, const char *, int, hsp3dx_http_response *out )
{ if ( out ) { out->status = 0; out->body = nullptr; out->size = 0; out->headers = nullptr; } return -1; }
extern "C" int hsp3dx_http_patch ( const char *, const void *, size_t, const char *, const char *, const char *, int, hsp3dx_http_response *out )
{ if ( out ) { out->status = 0; out->body = nullptr; out->size = 0; out->headers = nullptr; } return -1; }
extern "C" int hsp3dx_http_download( const char *, const char *, const char *, const char *, int, int *out_status, size_t *out_size )
{ if ( out_status ) *out_status = 0; if ( out_size ) *out_size = 0; return -1; }
extern "C" int hsp3dx_http_get_header( const hsp3dx_http_response *, const char *, char *out, size_t out_cap )
{ if ( out && out_cap ) out[0] = 0; return -1; }
extern "C" void hsp3dx_http_cookie_clear( void ) {}
extern "C" void hsp3dx_http_cookie_set_enabled( int ) {}
extern "C" void hsp3dx_http_free( hsp3dx_http_response *resp )
{ if ( resp ) { if ( resp->body ) free( resp->body ); if ( resp->headers ) free( resp->headers );
                resp->body = nullptr; resp->headers = nullptr; resp->size = 0; resp->status = 0; } }
extern "C" int hsp3dx_http_build_basic_auth( const char *, const char *, char *out, size_t out_cap )
{ if ( out && out_cap ) out[0] = 0; return -1; }
extern "C" void hsp3dx_http_mp_begin    ( void ) {}
extern "C" int  hsp3dx_http_mp_add_text ( const char *, const char * ) { return -1; }
extern "C" int  hsp3dx_http_mp_add_file ( const char *, const char *, const char *, const char * ) { return -1; }
extern "C" int  hsp3dx_http_mp_post     ( const char *, const char *, const char *, int, hsp3dx_http_response *out )
{ if ( out ) { out->status = 0; out->body = nullptr; out->size = 0; out->headers = nullptr; } return -1; }
extern "C" void hsp3dx_http_mp_end      ( void ) {}
