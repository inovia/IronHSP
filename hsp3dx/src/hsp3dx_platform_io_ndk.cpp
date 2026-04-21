//
//  hsp3dx_platform_io_ndk.cpp — Android 版ファイル I/O (AAssetManager)
//
//  .ax / 画像 / 音声は APK の assets/ 内に配置される。AAssetManager 経由で読む。
//  (DxLib Android の内部画像/音声ロード は別経路で AAssetManager を自分で持つ)
//
#include "hsp3dx_platform_io.h"

#include <stdlib.h>
#include <string.h>
#include <android/asset_manager.h>
#include <android/asset_manager_jni.h>
#include <android/log.h>

#define LOG_TAG "hsp3dx.io"
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO,  LOG_TAG, __VA_ARGS__)
#define LOGW(...) __android_log_print(ANDROID_LOG_WARN,  LOG_TAG, __VA_ARGS__)
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)

//  ランタイム初期化時 (NativeActivity の onCreate / ANativeActivity コールバック) に
//  AAssetManager* をセットする。hsp3dx_ndk_set_asset_manager() で外部から渡す。
static AAssetManager *g_asset_manager = nullptr;

extern "C" void hsp3dx_ndk_set_asset_manager( AAssetManager *am )
{
    g_asset_manager = am;
    LOGI( "AAssetManager set: %p", (void *)am );
}

struct hsp3dx_file {
    AAsset *asset;
    size_t  size;
};

extern "C" hsp3dx_file *hsp3dx_fopen( const char *utf8_path )
{
    if ( !g_asset_manager || !utf8_path ) return nullptr;

    //  先頭の "./" や "/" をスキップ (assets ルート相対にする)
    const char *p = utf8_path;
    if ( p[0] == '.' && p[1] == '/' ) p += 2;
    while ( p[0] == '/' ) ++p;

    AAsset *a = AAssetManager_open( g_asset_manager, p, AASSET_MODE_STREAMING );
    if ( !a ) {
        LOGW( "AAssetManager_open failed: %s", p );
        return nullptr;
    }

    hsp3dx_file *f = (hsp3dx_file *)malloc( sizeof(hsp3dx_file) );
    if ( !f ) { AAsset_close( a ); return nullptr; }
    f->asset = a;
    f->size  = (size_t)AAsset_getLength64( a );
    return f;
}

extern "C" size_t hsp3dx_fread( void *buf, size_t size, hsp3dx_file *f )
{
    if ( !f || !f->asset ) return 0;
    int n = AAsset_read( f->asset, buf, size );
    return ( n > 0 ) ? (size_t)n : 0;
}

extern "C" size_t hsp3dx_fsize( hsp3dx_file *f )
{
    return f ? f->size : 0;
}

extern "C" void hsp3dx_fclose( hsp3dx_file *f )
{
    if ( !f ) return;
    if ( f->asset ) AAsset_close( f->asset );
    free( f );
}

//  ---- 全部読み (Win 版と同じシグネチャ) ----
extern "C" int hsp3dx_readall_alloc( const char *utf8_path, void **out_buf, size_t *out_size )
{
    hsp3dx_file *f = hsp3dx_fopen( utf8_path );
    if ( !f ) { if ( out_buf ) *out_buf = nullptr; if ( out_size ) *out_size = 0; return -1; }
    size_t sz = hsp3dx_fsize( f );
    void *buf = malloc( sz + 1 );
    if ( !buf ) { hsp3dx_fclose( f ); return -1; }
    hsp3dx_fread( buf, sz, f );
    hsp3dx_fclose( f );
    ((char *)buf)[sz] = 0;
    if ( out_buf )  *out_buf  = buf;
    if ( out_size ) *out_size = sz;
    return 0;
}
