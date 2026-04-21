//
//  hsp3dx_http_ndk.cpp — Android HTTP クライアント (JNI 経由 HttpURLConnection)
//
//  NativeActivity は dlopen で .so をロードするため JNI_OnLoad は呼ばれない。
//  代わりに DxLib の GetNativeActivity() から ANativeActivity->vm を取り出し、
//  ANativeActivity->clazz の ClassLoader.loadClass() 経由で HspHttp を解決する。
//  (FindClass は background thread からだとシステム ClassLoader しか見えずアプリクラスが見えない)
//
//  Java 側: com.ironhsp.hsp3dx.HspHttp.request(method, url, body, ct, ua, xhdr, timeout)
//    → byte[] (先頭 4 バイト status LE + body バイト列)
//
#include "hsp3dx_http.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <jni.h>
#include <android/log.h>
#include <android/native_activity.h>

//  DxLib の GetNativeActivity 宣言だけ拾う (DxLib.h 全体 include は重いので)
namespace DxLib { extern const ANativeActivity *GetNativeActivity( void ); }

#define LOG_TAG "hsp3dx.http"
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO,  LOG_TAG, __VA_ARGS__)
#define LOGW(...) __android_log_print(ANDROID_LOG_WARN,  LOG_TAG, __VA_ARGS__)
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)

//  ---- キャッシュ (android_main 開始時に lazy init) ----
static JavaVM  *s_vm             = nullptr;
static jclass   s_HspHttp_class  = nullptr;    //  GlobalRef
static jmethodID s_request_mid   = nullptr;

//  ---- JNI ヘルパ ----
static JNIEnv *jni_env( bool *needs_detach )
{
    *needs_detach = false;
    if ( !s_vm ) return nullptr;
    JNIEnv *env = nullptr;
    int st = s_vm->GetEnv( (void **)&env, JNI_VERSION_1_6 );
    if ( st == JNI_EDETACHED ) {
        if ( s_vm->AttachCurrentThread( &env, nullptr ) == 0 ) {
            *needs_detach = true;
            return env;
        }
        return nullptr;
    }
    return st == JNI_OK ? env : nullptr;
}

//  GetNativeActivity() + ClassLoader.loadClass() で HspHttp を解決する
static bool ensure_jni_init( void )
{
    if ( s_HspHttp_class && s_request_mid ) return true;

    const ANativeActivity *act = DxLib::GetNativeActivity();
    if ( !act || !act->vm || !act->clazz ) {
        LOGW( "GetNativeActivity() returned null" );
        return false;
    }
    s_vm = act->vm;

    JNIEnv *env = nullptr;
    if ( s_vm->GetEnv( (void **)&env, JNI_VERSION_1_6 ) != JNI_OK ) {
        if ( s_vm->AttachCurrentThread( &env, nullptr ) != 0 ) {
            LOGW( "AttachCurrentThread failed" );
            return false;
        }
    }

    //  act->clazz.getClassLoader() を取得 → そこから loadClass
    jclass activityCls = env->GetObjectClass( act->clazz );
    jmethodID getClassLoader = env->GetMethodID( activityCls, "getClassLoader", "()Ljava/lang/ClassLoader;" );
    jobject classLoader = env->CallObjectMethod( act->clazz, getClassLoader );
    jclass classLoaderCls = env->FindClass( "java/lang/ClassLoader" );
    jmethodID loadClass = env->GetMethodID( classLoaderCls, "loadClass", "(Ljava/lang/String;)Ljava/lang/Class;" );

    jstring name = env->NewStringUTF( "com.ironhsp.hsp3dx.HspHttp" );
    jclass cls = (jclass)env->CallObjectMethod( classLoader, loadClass, name );
    env->DeleteLocalRef( name );

    if ( env->ExceptionCheck() ) {
        env->ExceptionDescribe();
        env->ExceptionClear();
        LOGE( "ClassLoader.loadClass(HspHttp) threw" );
        return false;
    }
    if ( !cls ) {
        LOGE( "HspHttp class not found via ClassLoader" );
        return false;
    }

    s_HspHttp_class = (jclass)env->NewGlobalRef( cls );
    env->DeleteLocalRef( cls );

    s_request_mid = env->GetStaticMethodID( s_HspHttp_class, "request",
        "(Ljava/lang/String;Ljava/lang/String;[BLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)[B" );
    if ( !s_request_mid ) {
        env->ExceptionClear();
        LOGE( "HspHttp.request method not found" );
        return false;
    }

    LOGI( "JNI HspHttp ready (vm=%p clazz=%p)", (void *)s_vm, (void *)s_HspHttp_class );
    return true;
}

//  android_main から明示的に呼ぶ (DxLib Init 後)
extern "C" void hsp3dx_http_init_jni( void )
{
    ensure_jni_init();
}

//  共通 request 実装
static int do_request( const char *method, const char *url,
                        const void *body, size_t size,
                        const char *content_type,
                        const char *user_agent,
                        const char *extra_headers,
                        int timeout_ms,
                        hsp3dx_http_response *out )
{
    if ( out ) { out->status = 0; out->body = nullptr; out->size = 0; out->headers = nullptr; }

    if ( !ensure_jni_init() ) return -1;

    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) { LOGW( "JNIEnv unavailable" ); return -1; }

    jstring j_method = env->NewStringUTF( method ? method : "GET" );
    jstring j_url    = env->NewStringUTF( url ? url : "" );
    jbyteArray j_body = nullptr;
    if ( body && size > 0 ) {
        j_body = env->NewByteArray( (jsize)size );
        env->SetByteArrayRegion( j_body, 0, (jsize)size, (const jbyte *)body );
    }
    jstring j_ct  = env->NewStringUTF( content_type   ? content_type   : "" );
    jstring j_ua  = env->NewStringUTF( user_agent     ? user_agent     : "hsp3dx/1.0" );
    jstring j_xh  = env->NewStringUTF( extra_headers  ? extra_headers  : "" );

    jobject result = env->CallStaticObjectMethod( s_HspHttp_class, s_request_mid,
        j_method, j_url, j_body, j_ct, j_ua, j_xh, (jint)timeout_ms );

    if ( env->ExceptionCheck() ) {
        env->ExceptionDescribe();
        env->ExceptionClear();
        env->DeleteLocalRef( j_method ); env->DeleteLocalRef( j_url );
        if ( j_body ) env->DeleteLocalRef( j_body );
        env->DeleteLocalRef( j_ct ); env->DeleteLocalRef( j_ua ); env->DeleteLocalRef( j_xh );
        if ( detach ) s_vm->DetachCurrentThread();
        return -1;
    }

    int rc = -1;
    if ( result ) {
        jsize len = env->GetArrayLength( (jbyteArray)result );
        if ( len >= 4 ) {
            jbyte *p = env->GetByteArrayElements( (jbyteArray)result, nullptr );
            int status = (int)(unsigned char)p[0]
                       | ((int)(unsigned char)p[1] << 8)
                       | ((int)(unsigned char)p[2] << 16)
                       | ((int)(unsigned char)p[3] << 24);
            int body_len = len - 4;
            char *buf = (char *)malloc( (size_t)body_len + 1 );
            if ( buf ) {
                memcpy( buf, p + 4, (size_t)body_len );
                buf[body_len] = 0;
                if ( out ) {
                    out->status  = status;
                    out->body    = buf;
                    out->size    = (size_t)body_len;
                    out->headers = strdup( "" );
                } else {
                    free( buf );
                }
            }
            env->ReleaseByteArrayElements( (jbyteArray)result, p, JNI_ABORT );
            rc = 0;
        }
        env->DeleteLocalRef( result );
    }

    env->DeleteLocalRef( j_method ); env->DeleteLocalRef( j_url );
    if ( j_body ) env->DeleteLocalRef( j_body );
    env->DeleteLocalRef( j_ct ); env->DeleteLocalRef( j_ua ); env->DeleteLocalRef( j_xh );
    if ( detach ) s_vm->DetachCurrentThread();
    return rc;
}

extern "C" int hsp3dx_http_request( const char *method, const char *url,
                                    const void *body, size_t size,
                                    const char *content_type,
                                    const char *user_agent,
                                    const char *extra_headers,
                                    int timeout_ms,
                                    hsp3dx_http_response *out )
{
    return do_request( method, url, body, size, content_type, user_agent, extra_headers, timeout_ms, out );
}

extern "C" int hsp3dx_http_get( const char *url, const char *ua, const char *xhdr,
                                 int timeout_ms, hsp3dx_http_response *out )
{
    return do_request( "GET", url, nullptr, 0, nullptr, ua, xhdr, timeout_ms, out );
}

extern "C" int hsp3dx_http_post( const char *url, const void *body, size_t size,
                                  const char *content_type, const char *ua,
                                  const char *xhdr, int timeout_ms,
                                  hsp3dx_http_response *out )
{
    return do_request( "POST", url, body, size, content_type, ua, xhdr, timeout_ms, out );
}

extern "C" int hsp3dx_http_put( const char *url, const void *body, size_t size,
                                 const char *content_type, const char *ua,
                                 const char *xhdr, int timeout_ms,
                                 hsp3dx_http_response *out )
{
    return do_request( "PUT", url, body, size, content_type, ua, xhdr, timeout_ms, out );
}

extern "C" int hsp3dx_http_delete( const char *url, const char *ua, const char *xhdr,
                                    int timeout_ms, hsp3dx_http_response *out )
{
    return do_request( "DELETE", url, nullptr, 0, nullptr, ua, xhdr, timeout_ms, out );
}

extern "C" int hsp3dx_http_patch( const char *url, const void *body, size_t size,
                                   const char *content_type, const char *ua,
                                   const char *xhdr, int timeout_ms,
                                   hsp3dx_http_response *out )
{
    return do_request( "PATCH", url, body, size, content_type, ua, xhdr, timeout_ms, out );
}

extern "C" int hsp3dx_http_download( const char *url, const char *dest_path_u8,
                                      const char *ua, const char *xhdr,
                                      int timeout_ms, int *out_status, size_t *out_size )
{
    hsp3dx_http_response r;
    int rc = do_request( "GET", url, nullptr, 0, nullptr, ua, xhdr, timeout_ms, &r );
    if ( rc != 0 ) { if ( out_status ) *out_status = 0; if ( out_size ) *out_size = 0; return -1; }
    if ( out_status ) *out_status = r.status;
    FILE *fp = fopen( dest_path_u8, "wb" );
    size_t written = 0;
    if ( fp && r.body ) {
        written = fwrite( r.body, 1, r.size, fp );
        fclose( fp );
    }
    if ( out_size ) *out_size = written;
    if ( r.body ) free( r.body );
    if ( r.headers ) free( r.headers );
    return 0;
}

extern "C" int hsp3dx_http_get_header( const hsp3dx_http_response *, const char *,
                                        char *out, size_t out_cap )
{
    if ( out && out_cap > 0 ) out[0] = 0;
    return -1;
}

extern "C" void hsp3dx_http_cookie_clear( void ) {}
extern "C" void hsp3dx_http_cookie_set_enabled( int ) {}

extern "C" void hsp3dx_http_free( hsp3dx_http_response *resp )
{
    if ( !resp ) return;
    if ( resp->body )    free( resp->body );
    if ( resp->headers ) free( resp->headers );
    resp->body = nullptr;
    resp->headers = nullptr;
    resp->size = 0;
    resp->status = 0;
}

extern "C" int hsp3dx_http_build_basic_auth( const char *, const char *,
                                              char *out, size_t out_cap )
{
    if ( out && out_cap > 0 ) out[0] = 0;
    return -1;
}

//  multipart: Phase 4.x で本実装
extern "C" void hsp3dx_http_mp_begin( void ) {}
extern "C" int  hsp3dx_http_mp_add_text( const char *, const char * ) { return -1; }
extern "C" int  hsp3dx_http_mp_add_file( const char *, const char *, const char *, const char * ) { return -1; }
extern "C" int  hsp3dx_http_mp_post( const char *, const char *, const char *, int,
                                      hsp3dx_http_response *out )
{ if ( out ) { out->status = 0; out->body = nullptr; out->size = 0; out->headers = nullptr; } return -1; }
extern "C" void hsp3dx_http_mp_end( void ) {}
