//
//  hsp3dx_platform_io_ios.mm — iOS 版ファイル I/O (NSBundle + fopen)
//
//  Phase 3.0: 単純な fopen ラッパ。iOS のアプリ bundle 内ファイルは
//  DxLib FileRead_open が既に透過で読むので、.ax 読み込み用途では
//  この抽象層は直接使われない (main_ios.mm 側が FileRead_open を使う)。
//  HSP スクリプトが fopen 系を明示的に呼んだ場合のみ経由する。
//
#include "hsp3dx_platform_io.h"

#import <Foundation/Foundation.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>

struct hsp3dx_file {
    FILE *fp;
    size_t size;
};

static NSString *resolve_path( const char *utf8_path )
{
    if ( !utf8_path || !*utf8_path ) return nil;
    NSString *p = [NSString stringWithUTF8String:utf8_path];
    //  絶対パスはそのまま
    if ( [p hasPrefix:@"/"] ) return p;
    //  相対パスはまず cwd (Documents) を想定、なければ bundle resource
    NSString *cwd = [[NSFileManager defaultManager] currentDirectoryPath];
    NSString *abs = [cwd stringByAppendingPathComponent:p];
    if ( [[NSFileManager defaultManager] fileExistsAtPath:abs] ) return abs;
    NSString *bundleRes = [[NSBundle mainBundle] pathForResource:
        [p stringByDeletingPathExtension] ofType:[p pathExtension]];
    return bundleRes ?: abs;
}

extern "C" hsp3dx_file *hsp3dx_fopen( const char *utf8_path )
{
    NSString *p = resolve_path( utf8_path );
    if ( !p ) return nullptr;
    FILE *fp = fopen( [p UTF8String], "rb" );
    if ( !fp ) return nullptr;

    hsp3dx_file *f = (hsp3dx_file *)malloc( sizeof(hsp3dx_file) );
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
    hsp3dx_file *f = hsp3dx_fopen( utf8_path );
    if ( !f ) return -1;
    size_t sz = f->size;
    void *buf = malloc( sz + 1 );
    if ( !buf ) { hsp3dx_fclose( f ); return -1; }
    size_t got = hsp3dx_fread( buf, sz, f );
    ((char *)buf)[ got ] = 0;
    hsp3dx_fclose( f );
    if ( out_buf )  *out_buf  = buf;
    if ( out_size ) *out_size = got;
    return 0;
}

extern "C" void hsp3dx_free_file_buf( void *buf ) { if ( buf ) free( buf ); }

extern "C" long hsp3dx_file_size_if_exists( const char *utf8_path )
{
    NSString *p = resolve_path( utf8_path );
    if ( !p ) return -1;
    struct stat st;
    if ( stat( [p UTF8String], &st ) != 0 ) return -1;
    return (long)st.st_size;
}
