//
//  hsp3dx_platform_desktop.cpp — Mac/Linux/Web 向けプラットフォーム抽象 stub
//
//  Win/iOS/Android には本実装があるが Desktop は PoC 段階なのでほぼ stub。
//  将来的には:
//    Mac/Linux  : libcurl (HTTP), libwebsockets (WS), getenv + ini ファイル (pref)
//    Web        : emscripten fetch / EM_JS hook (HTTP), WebSocket JS API (WS)
//    共通       : dialog は SDL2_showsimpleMessageBox で可
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "hsp3dx_platform.h"
#include "hsp3dx_http.h"
#include "hsp3dx_ws.h"
#include "hsp3dx_platform_io.h"

//  ====================================================================
//  platform IO (fopen ベース、desktop はファイルシステムが普通に使えるため)
//  ====================================================================
struct hsp3dx_file {
    FILE *fp;
    size_t size;
};

extern "C" hsp3dx_file *hsp3dx_fopen( const char *utf8_path )
{
    FILE *fp = fopen( utf8_path, "rb" );
    if ( !fp ) return NULL;
    hsp3dx_file *f = (hsp3dx_file *)malloc( sizeof(hsp3dx_file) );
    if ( !f ) { fclose( fp ); return NULL; }
    f->fp = fp;
    fseek( fp, 0, SEEK_END );
    f->size = (size_t)ftell( fp );
    fseek( fp, 0, SEEK_SET );
    return f;
}

extern "C" size_t hsp3dx_fread( void *buf, size_t size, hsp3dx_file *f )
{
    if ( !f || !f->fp ) return 0;
    return fread( buf, 1, size, f->fp );
}

extern "C" size_t hsp3dx_fsize( hsp3dx_file *f )
{
    return f ? f->size : 0;
}

extern "C" void hsp3dx_fclose( hsp3dx_file *f )
{
    if ( !f ) return;
    if ( f->fp ) fclose( f->fp );
    free( f );
}

extern "C" int hsp3dx_load_file_all( const char *utf8_path, void **out_buf, size_t *out_size )
{
    FILE *fp = fopen( utf8_path, "rb" );
    if ( !fp ) return -1;
    fseek( fp, 0, SEEK_END );
    long sz = ftell( fp );
    fseek( fp, 0, SEEK_SET );
    if ( sz < 0 ) { fclose( fp ); return -1; }
    void *buf = malloc( (size_t)sz + 1 );
    if ( !buf ) { fclose( fp ); return -1; }
    size_t rd = fread( buf, 1, (size_t)sz, fp );
    fclose( fp );
    ((char *)buf)[rd] = 0;
    *out_buf = buf;
    *out_size = rd;
    return 0;
}

extern "C" void hsp3dx_free_file_buf( void *buf )
{
    free( buf );
}

extern "C" long hsp3dx_file_size_if_exists( const char *utf8_path )
{
    FILE *fp = fopen( utf8_path, "rb" );
    if ( !fp ) return -1;
    fseek( fp, 0, SEEK_END );
    long sz = ftell( fp );
    fclose( fp );
    return sz;
}

//  ====================================================================
//  platform misc (stub — desktop で実装予定)
//  ====================================================================
extern "C" int hsp3dx_platform_exec( const char *, const char *, int ) { return -1; }
extern "C" int hsp3dx_platform_dialog( const char *text, const char *title, int )
{
    fprintf( stderr, "[dialog] %s: %s\n", title ? title : "hsp3dx", text ? text : "" );
    return 1;
}
extern "C" int  hsp3dx_pref_set_str ( const char *, const char *, const char * ) { return -1; }
extern "C" int  hsp3dx_pref_set_int ( const char *, const char *, int ) { return -1; }
extern "C" int  hsp3dx_pref_get_str ( const char *, const char *, char *out, size_t cap, const char *def )
{
    if ( out && cap > 0 ) {
        if ( def ) strncpy( out, def, cap - 1 ), out[cap - 1] = 0;
        else out[0] = 0;
    }
    return -1;
}
extern "C" int  hsp3dx_pref_get_int ( const char *, const char *, int def ) { return def; }
extern "C" int  hsp3dx_pref_remove  ( const char *, const char * ) { return -1; }
extern "C" int  hsp3dx_pref_clear   ( const char * ) { return -1; }
extern "C" int  hsp3dx_pref_exists  ( const char *, const char * ) { return 0; }
//  hsp3dx_pref_set_double / hsp3dx_pref_get_double は platform_common.cpp で実装済
extern "C" int  hsp3dx_pref_list_keys( const char *, char *out, size_t cap )
{
    if ( out && cap > 0 ) out[0] = 0;
    return 0;
}

extern "C" void hsp3dx_dev_vibrate( int ) {}
extern "C" int  hsp3dx_dev_is_dark( void ) { return 0; }
extern "C" void hsp3dx_dev_battery( int *level, int *state ) { if (level) *level = -1; if (state) *state = -1; }
extern "C" int  hsp3dx_dev_orientation( void ) { return 1; }
extern "C" void hsp3dx_dev_sound( int ) {}
extern "C" void hsp3dx_dev_accel   ( double *x, double *y, double *z ) { if(x)*x=0; if(y)*y=0; if(z)*z=0; }
extern "C" void hsp3dx_dev_gyro    ( double *x, double *y, double *z ) { if(x)*x=0; if(y)*y=0; if(z)*z=0; }
extern "C" void hsp3dx_dev_attitude( double *r, double *p, double *y ) { if(r)*r=0; if(p)*p=0; if(y)*y=0; }
extern "C" void hsp3dx_dev_gps_start ( void ) {}
extern "C" void hsp3dx_dev_gps_stop  ( void ) {}
extern "C" void hsp3dx_dev_gps_get   ( double *lat, double *lng ) { if(lat)*lat=0; if(lng)*lng=0; }
extern "C" int  hsp3dx_dev_gps_status( void ) { return 0; }
extern "C" int  hsp3dx_dev_torch_supported( void ) { return 0; }
extern "C" void hsp3dx_dev_torch          ( int ) {}
extern "C" void hsp3dx_dev_mic_start( void ) {}
extern "C" void hsp3dx_dev_mic_stop ( void ) {}
extern "C" int  hsp3dx_dev_mic_level( void ) { return -1; }
extern "C" int  hsp3dx_dev_biometric_auth( const char * ) { return -1; }

//  ====================================================================
//  HTTP (stub — libcurl / emscripten fetch 実装予定)
//  ====================================================================
extern "C" int  hsp3dx_http_request( const char *, const char *, const void *, size_t,
                                     const char *, const char *, const char *, int,
                                     hsp3dx_http_response * ) { return -1; }
extern "C" int  hsp3dx_http_get   ( const char *, const char *, const char *, int, hsp3dx_http_response * ) { return -1; }
extern "C" int  hsp3dx_http_post  ( const char *, const void *, size_t, const char *, const char *, const char *, int, hsp3dx_http_response * ) { return -1; }
extern "C" int  hsp3dx_http_put   ( const char *, const void *, size_t, const char *, const char *, const char *, int, hsp3dx_http_response * ) { return -1; }
extern "C" int  hsp3dx_http_delete( const char *, const char *, const char *, int, hsp3dx_http_response * ) { return -1; }
extern "C" int  hsp3dx_http_patch ( const char *, const void *, size_t, const char *, const char *, const char *, int, hsp3dx_http_response * ) { return -1; }
extern "C" int  hsp3dx_http_download( const char *, const char *, const char *, const char *, int, int *, size_t * ) { return -1; }
extern "C" int  hsp3dx_http_get_header( const hsp3dx_http_response *, const char *, char *out, size_t cap ) { if(out&&cap>0)out[0]=0; return -1; }
extern "C" void hsp3dx_http_cookie_clear( void ) {}
extern "C" void hsp3dx_http_cookie_set_enabled( int ) {}
extern "C" void hsp3dx_http_free( hsp3dx_http_response *resp )
{
    if ( !resp ) return;
    free( resp->body ); resp->body = NULL;
    free( resp->headers ); resp->headers = NULL;
}
extern "C" int  hsp3dx_http_build_basic_auth( const char *, const char *, char *out, size_t cap )
{ if (out && cap > 0) out[0] = 0; return -1; }
extern "C" void hsp3dx_http_mp_begin    ( void ) {}
extern "C" int  hsp3dx_http_mp_add_text ( const char *, const char * ) { return -1; }
extern "C" int  hsp3dx_http_mp_add_file ( const char *, const char *, const char *, const char * ) { return -1; }
extern "C" int  hsp3dx_http_mp_post     ( const char *, const char *, const char *, int, hsp3dx_http_response * ) { return -1; }
extern "C" void hsp3dx_http_mp_end      ( void ) {}

//  ====================================================================
//  WebSocket (stub — libwebsockets / emscripten WS 実装予定)
//  ====================================================================
extern "C" int  hsp3dx_ws_connect( const char *, const char *, int ) { return -1; }
extern "C" void hsp3dx_ws_close  ( int, int ) {}
extern "C" void hsp3dx_ws_free   ( int ) {}
extern "C" int  hsp3dx_ws_send_text  ( int, const char *, size_t ) { return -1; }
extern "C" int  hsp3dx_ws_send_binary( int, const void *, size_t ) { return -1; }
extern "C" int  hsp3dx_ws_recv   ( int, int, void *, size_t, size_t *, int * ) { return -1; }
extern "C" int  hsp3dx_ws_status ( int ) { return 3 /* CLOSED */; }
