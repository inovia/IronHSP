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

//  拡張子ベースで Movie か否かを判定
static bool is_movie_path( const char *path )
{
    if ( path == nullptr ) return false;
    size_t len = strlen( path );
    if ( len < 4 ) return false;
    const char *ext = path + len - 4;
    if ( strcasecmp( ext, ".mp4" ) == 0 ) return true;
    if ( strcasecmp( ext, ".mov" ) == 0 ) return true;
    if ( strcasecmp( ext, ".m4v" ) == 0 ) return true;
    if ( strcasecmp( ext, ".ogv" ) == 0 ) return true;
    return false;
}

extern "C" int hsp3dx_ios_LoadGraph_wrap( const char *path, int NotUse3DFlag )
{
    if ( path == nullptr ) return -1;
    char rpath[1024];
    resolve_path( path, rpath, sizeof(rpath) );
    //  Movie file は CreateGraphFromMem 経路に乗せると FileName==NULL で
    //  OpenMovie_UseGParam が fail するので、直接 LoadGraph を呼んで
    //  OpenMovie_UseGParam_PF (DxMovieiOS_AVP.mm) に FileName 付きで到達させる。
    //  DxLib iOS LoadGraph は内部でパス区切り正規化 (/→\) を行うが、
    //  最終的に OpenMovie_UseGParam_PF に渡る wchar_t* に元パスが保存される。
    //  原文 path (Documents 相対 "test_movie.mp4") をそのまま渡す。
    if ( is_movie_path( path ) ) {
        return LoadGraph( path, NotUse3DFlag );
    }
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
