//
//  hsp3dx_ios_dxlib_override.cpp — iOS DxLib ファイル I/O ラッパ実装
//
//  このファイルでは DxLib.h を直接 include し、override ヘッダは include
//  しない。そのため LoadGraph / LoadSoundMem / CreateGraphFromMem /
//  LoadSoundMemByMemImage は DxLib の素の関数を参照する。
//
#ifdef __APPLE__

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "DxLib.h"

//  相対パスは chdir 済みの内部 Documents ディレクトリに対する相対扱い。
//  絶対パスならそのまま。
static void resolve_path( const char *src, char *out, size_t out_cap )
{
    if ( src == nullptr || out == nullptr || out_cap == 0 ) return;
    if ( src[0] == '/' ) {
        strncpy( out, src, out_cap - 1 );
        out[out_cap - 1] = 0;
        return;
    }
    char cwd[1024];
    if ( getcwd( cwd, sizeof(cwd) ) != nullptr ) {
        snprintf( out, out_cap, "%s/%s", cwd, src );
    } else {
        strncpy( out, src, out_cap - 1 );
        out[out_cap - 1] = 0;
    }
}

//  fopen → 全読み → buffer を返す。呼出側が free。
static void *slurp_file( const char *path, long *out_size )
{
    FILE *fp = fopen( path, "rb" );
    if ( fp == nullptr ) return nullptr;
    fseek( fp, 0, SEEK_END );
    long sz = ftell( fp );
    fseek( fp, 0, SEEK_SET );
    if ( sz <= 0 ) { fclose( fp ); return nullptr; }
    void *buf = malloc( (size_t)sz );
    if ( buf == nullptr ) { fclose( fp ); return nullptr; }
    size_t n = fread( buf, 1, (size_t)sz, fp );
    fclose( fp );
    if ( (long)n != sz ) { free( buf ); return nullptr; }
    if ( out_size ) *out_size = sz;
    return buf;
}

extern "C" int hsp3dx_ios_LoadGraph_wrap( const char *path, int /*NotUse3DFlag*/ )
{
    if ( path == nullptr ) return -1;
    char rpath[1024];
    resolve_path( path, rpath, sizeof(rpath) );
    long sz = 0;
    void *buf = slurp_file( rpath, &sz );
    if ( buf == nullptr ) return -1;
    int h = CreateGraphFromMem( buf, (int)sz );
    free( buf );
    return h;
}

extern "C" int hsp3dx_ios_LoadSoundMem_wrap( const char *path, int BufferNum, int UnionHandle )
{
    if ( path == nullptr ) return -1;
    char rpath[1024];
    resolve_path( path, rpath, sizeof(rpath) );
    long sz = 0;
    void *buf = slurp_file( rpath, &sz );
    if ( buf == nullptr ) return -1;
    int h = LoadSoundMemByMemImage( buf, (size_t)sz, BufferNum, UnionHandle );
    free( buf );
    return h;
}

#endif  // __APPLE__
