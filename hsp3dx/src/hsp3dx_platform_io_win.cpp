//
//  hsp3dx_platform_io_win.cpp — Windows 版ファイル I/O
//
//  UTF-8 パスを wchar_t に変換して _wfopen で開く。
//  iOS / Android 版 (Phase 3/4) も同じ hsp3dx_platform_io.h を実装する。
//
#include "hsp3dx_platform_io.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <windows.h>

struct hsp3dx_file {
    FILE *fp;
    size_t size;
};

static FILE *open_utf8_path( const char *utf8_path, const wchar_t *mode )
{
    if ( utf8_path == nullptr ) return nullptr;
    wchar_t wpath[2048];
    int n = MultiByteToWideChar( CP_UTF8, 0, utf8_path, -1, wpath,
                                 (int)(sizeof(wpath)/sizeof(wpath[0])) );
    if ( n <= 0 ) return nullptr;
    return _wfopen( wpath, mode );
}

hsp3dx_file *hsp3dx_fopen( const char *utf8_path )
{
    FILE *fp = open_utf8_path( utf8_path, L"rb" );
    if ( !fp ) return nullptr;

    if ( fseek( fp, 0, SEEK_END ) != 0 ) { fclose( fp ); return nullptr; }
    long sz = ftell( fp );
    if ( sz < 0 ) { fclose( fp ); return nullptr; }
    fseek( fp, 0, SEEK_SET );

    hsp3dx_file *f = (hsp3dx_file *)malloc( sizeof(hsp3dx_file) );
    if ( !f ) { fclose( fp ); return nullptr; }
    f->fp   = fp;
    f->size = (size_t)sz;
    return f;
}

size_t hsp3dx_fread( void *buf, size_t size, hsp3dx_file *f )
{
    if ( !f || !f->fp ) return 0;
    return fread( buf, 1, size, f->fp );
}

size_t hsp3dx_fsize( hsp3dx_file *f )
{
    return f ? f->size : 0;
}

void hsp3dx_fclose( hsp3dx_file *f )
{
    if ( !f ) return;
    if ( f->fp ) fclose( f->fp );
    free( f );
}

int hsp3dx_load_file_all( const char *utf8_path, void **out_buf, size_t *out_size )
{
    if ( !out_buf || !out_size ) return -1;
    *out_buf  = nullptr;
    *out_size = 0;

    hsp3dx_file *f = hsp3dx_fopen( utf8_path );
    if ( !f ) return -1;

    size_t sz = hsp3dx_fsize( f );
    void *buf = malloc( sz > 0 ? sz : 1 );
    if ( !buf ) { hsp3dx_fclose( f ); return -1; }

    size_t rd = hsp3dx_fread( buf, sz, f );
    hsp3dx_fclose( f );

    if ( rd != sz ) { free( buf ); return -1; }
    *out_buf  = buf;
    *out_size = sz;
    return 0;
}

void hsp3dx_free_file_buf( void *buf )
{
    free( buf );
}

long hsp3dx_file_size_if_exists( const char *utf8_path )
{
    hsp3dx_file *f = hsp3dx_fopen( utf8_path );
    if ( !f ) return -1;
    long sz = (long)hsp3dx_fsize( f );
    hsp3dx_fclose( f );
    return sz;
}
