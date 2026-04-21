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

#include <stdarg.h>
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
        //  新フォーマット: [4B status LE][4B header_len LE][headers bytes][body]
        if ( len >= 8 ) {
            jbyte *p = env->GetByteArrayElements( (jbyteArray)result, nullptr );
            int status = (int)(unsigned char)p[0]
                       | ((int)(unsigned char)p[1] << 8)
                       | ((int)(unsigned char)p[2] << 16)
                       | ((int)(unsigned char)p[3] << 24);
            int hdr_len = (int)(unsigned char)p[4]
                        | ((int)(unsigned char)p[5] << 8)
                        | ((int)(unsigned char)p[6] << 16)
                        | ((int)(unsigned char)p[7] << 24);
            if ( hdr_len < 0 ) hdr_len = 0;
            if ( 8 + hdr_len > len ) hdr_len = len - 8;
            int body_len = len - 8 - hdr_len;
            char *hbuf = (char *)malloc( (size_t)hdr_len + 1 );
            char *buf  = (char *)malloc( (size_t)body_len + 1 );
            if ( hbuf && buf ) {
                memcpy( hbuf, p + 8, (size_t)hdr_len );
                hbuf[hdr_len] = 0;
                memcpy( buf, p + 8 + hdr_len, (size_t)body_len );
                buf[body_len] = 0;
                if ( out ) {
                    out->status  = status;
                    out->body    = buf;
                    out->size    = (size_t)body_len;
                    out->headers = hbuf;
                } else {
                    free( buf ); free( hbuf );
                }
            } else {
                if ( hbuf ) free( hbuf );
                if ( buf ) free( buf );
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

//  resp->headers ("Key: Value\r\n" 連結) から name を大小無視で検索し、値を out に書く。
extern "C" int hsp3dx_http_get_header( const hsp3dx_http_response *resp,
                                        const char *name,
                                        char *out, size_t out_cap )
{
    if ( !resp || !resp->headers || !name || !out || out_cap == 0 ) return -1;
    const char *p = resp->headers;
    size_t name_len = strlen( name );
    while ( *p ) {
        const char *colon = strchr( p, ':' );
        const char *eol   = strstr( p, "\r\n" );
        if ( !eol ) eol = p + strlen( p );
        if ( colon && colon < eol ) {
            size_t key_len = (size_t)( colon - p );
            if ( key_len == name_len ) {
                int match = 1;
                for ( size_t i = 0; i < name_len; i++ ) {
                    char a = p[i], b = name[i];
                    if ( a >= 'A' && a <= 'Z' ) a = (char)(a - 'A' + 'a');
                    if ( b >= 'A' && b <= 'Z' ) b = (char)(b - 'A' + 'a');
                    if ( a != b ) { match = 0; break; }
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

//  Cookie 管理 (HspHttp.cookieEnable / cookieClear 呼び出し)
static void call_cookie_method( const char *name, const char *sig, ... )
{
    if ( !ensure_jni_init() ) return;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return;
    jmethodID mid = env->GetStaticMethodID( s_HspHttp_class, name, sig );
    if ( mid ) {
        va_list ap;
        va_start( ap, sig );
        env->CallStaticVoidMethodV( s_HspHttp_class, mid, ap );
        va_end( ap );
        if ( env->ExceptionCheck() ) {
            env->ExceptionDescribe();
            env->ExceptionClear();
        }
    } else {
        env->ExceptionClear();
        LOGW( "HspHttp.%s not found", name );
    }
    if ( detach ) s_vm->DetachCurrentThread();
}

extern "C" void hsp3dx_http_cookie_clear( void )
{
    call_cookie_method( "cookieClear", "()V" );
}

extern "C" void hsp3dx_http_cookie_set_enabled( int enabled )
{
    call_cookie_method( "cookieEnable", "(I)V", (jint)enabled );
}

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

//  標準 Base64 エンコード (RFC 4648)。src_len バイトを out に書き、
//  末尾 '\0' を付ける。out は少なくとも ((src_len+2)/3)*4 + 1 バイト必要。
static size_t base64_encode( const unsigned char *src, size_t src_len, char *out )
{
    static const char tbl[] =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    size_t i = 0, o = 0;
    while ( i + 3 <= src_len ) {
        unsigned v = ( (unsigned)src[i] << 16 ) |
                     ( (unsigned)src[i+1] << 8 ) |
                     ( (unsigned)src[i+2] );
        out[o++] = tbl[ (v >> 18) & 0x3F ];
        out[o++] = tbl[ (v >> 12) & 0x3F ];
        out[o++] = tbl[ (v >> 6)  & 0x3F ];
        out[o++] = tbl[  v        & 0x3F ];
        i += 3;
    }
    if ( i < src_len ) {
        unsigned v = (unsigned)src[i] << 16;
        if ( i + 1 < src_len ) v |= (unsigned)src[i+1] << 8;
        out[o++] = tbl[ (v >> 18) & 0x3F ];
        out[o++] = tbl[ (v >> 12) & 0x3F ];
        out[o++] = ( i + 1 < src_len ) ? tbl[ (v >> 6) & 0x3F ] : '=';
        out[o++] = '=';
    }
    out[o] = 0;
    return o;
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

    size_t need = 6 /*"Basic "*/ + ( (pair_len + 2) / 3 ) * 4 + 1;
    if ( need > out_cap ) { free( pair ); return -1; }

    strcpy( out, "Basic " );
    base64_encode( (const unsigned char *)pair, pair_len, out + 6 );
    free( pair );
    return 0;
}

//  ----------------------------------------------------------------
//  multipart/form-data (OkHttp 経由)
//  ----------------------------------------------------------------
static jmethodID s_mid_mp_begin   = nullptr;
static jmethodID s_mid_mp_addText = nullptr;
static jmethodID s_mid_mp_addFile = nullptr;
static jmethodID s_mid_mp_post    = nullptr;
static jmethodID s_mid_mp_end     = nullptr;

static bool ensure_mp_methods( JNIEnv *env )
{
    if ( !ensure_jni_init() ) return false;
    if ( s_mid_mp_begin && s_mid_mp_addText && s_mid_mp_addFile
         && s_mid_mp_post && s_mid_mp_end ) return true;

    s_mid_mp_begin   = env->GetStaticMethodID( s_HspHttp_class, "mpBegin",   "()V" );
    s_mid_mp_addText = env->GetStaticMethodID( s_HspHttp_class, "mpAddText", "(Ljava/lang/String;Ljava/lang/String;)I" );
    s_mid_mp_addFile = env->GetStaticMethodID( s_HspHttp_class, "mpAddFile", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I" );
    s_mid_mp_post    = env->GetStaticMethodID( s_HspHttp_class, "mpPost",    "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)[B" );
    s_mid_mp_end     = env->GetStaticMethodID( s_HspHttp_class, "mpEnd",     "()V" );
    if ( !s_mid_mp_begin || !s_mid_mp_addText || !s_mid_mp_addFile
         || !s_mid_mp_post || !s_mid_mp_end ) {
        env->ExceptionClear();
        LOGW( "HspHttp multipart methods not resolved" );
        return false;
    }
    return true;
}

extern "C" void hsp3dx_http_mp_begin( void )
{
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env || !ensure_mp_methods( env ) ) { if ( detach ) s_vm->DetachCurrentThread(); return; }
    env->CallStaticVoidMethod( s_HspHttp_class, s_mid_mp_begin );
    if ( env->ExceptionCheck() ) env->ExceptionClear();
    if ( detach ) s_vm->DetachCurrentThread();
}

extern "C" int hsp3dx_http_mp_add_text( const char *name, const char *value )
{
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env || !ensure_mp_methods( env ) ) { if ( detach ) s_vm->DetachCurrentThread(); return -1; }
    jstring jn = env->NewStringUTF( name  ? name  : "" );
    jstring jv = env->NewStringUTF( value ? value : "" );
    int rc = env->CallStaticIntMethod( s_HspHttp_class, s_mid_mp_addText, jn, jv );
    env->DeleteLocalRef( jn ); env->DeleteLocalRef( jv );
    if ( env->ExceptionCheck() ) { env->ExceptionClear(); rc = -1; }
    if ( detach ) s_vm->DetachCurrentThread();
    return rc;
}

extern "C" int hsp3dx_http_mp_add_file( const char *name, const char *path,
                                         const char *ctype, const char *filename )
{
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env || !ensure_mp_methods( env ) ) { if ( detach ) s_vm->DetachCurrentThread(); return -1; }
    jstring jn = env->NewStringUTF( name     ? name     : "" );
    jstring jp = env->NewStringUTF( path     ? path     : "" );
    jstring jc = env->NewStringUTF( ctype    ? ctype    : "" );
    jstring jf = env->NewStringUTF( filename ? filename : "" );
    int rc = env->CallStaticIntMethod( s_HspHttp_class, s_mid_mp_addFile, jn, jp, jc, jf );
    env->DeleteLocalRef( jn ); env->DeleteLocalRef( jp );
    env->DeleteLocalRef( jc ); env->DeleteLocalRef( jf );
    if ( env->ExceptionCheck() ) { env->ExceptionClear(); rc = -1; }
    if ( detach ) s_vm->DetachCurrentThread();
    return rc;
}

extern "C" int hsp3dx_http_mp_post( const char *url, const char *ua,
                                     const char *xhdr, int timeout_ms,
                                     hsp3dx_http_response *out )
{
    if ( out ) { out->status = 0; out->body = nullptr; out->size = 0; out->headers = nullptr; }
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env || !ensure_mp_methods( env ) ) { if ( detach ) s_vm->DetachCurrentThread(); return -1; }

    jstring jurl = env->NewStringUTF( url  ? url  : "" );
    jstring jua  = env->NewStringUTF( ua   ? ua   : "hsp3dx/1.0" );
    jstring jxh  = env->NewStringUTF( xhdr ? xhdr : "" );
    jbyteArray result = (jbyteArray)env->CallStaticObjectMethod(
        s_HspHttp_class, s_mid_mp_post, jurl, jua, jxh, (jint)timeout_ms );
    env->DeleteLocalRef( jurl ); env->DeleteLocalRef( jua ); env->DeleteLocalRef( jxh );
    if ( env->ExceptionCheck() ) { env->ExceptionDescribe(); env->ExceptionClear();
                                    if ( detach ) s_vm->DetachCurrentThread(); return -1; }

    int rc = -1;
    if ( result ) {
        jsize len = env->GetArrayLength( result );
        //  新フォーマット: [4B status LE][4B header_len LE][headers bytes][body]
        if ( len >= 8 ) {
            jbyte *p = env->GetByteArrayElements( result, nullptr );
            int status = (int)(unsigned char)p[0]
                       | ((int)(unsigned char)p[1] << 8)
                       | ((int)(unsigned char)p[2] << 16)
                       | ((int)(unsigned char)p[3] << 24);
            int hdr_len = (int)(unsigned char)p[4]
                        | ((int)(unsigned char)p[5] << 8)
                        | ((int)(unsigned char)p[6] << 16)
                        | ((int)(unsigned char)p[7] << 24);
            if ( hdr_len < 0 ) hdr_len = 0;
            if ( 8 + hdr_len > len ) hdr_len = len - 8;
            int body_len = len - 8 - hdr_len;
            char *hbuf = (char *)malloc( (size_t)hdr_len + 1 );
            char *buf  = (char *)malloc( (size_t)body_len + 1 );
            if ( hbuf && buf ) {
                memcpy( hbuf, p + 8, (size_t)hdr_len );
                hbuf[hdr_len] = 0;
                memcpy( buf, p + 8 + hdr_len, (size_t)body_len );
                buf[body_len] = 0;
                if ( out ) {
                    out->status  = status;
                    out->body    = buf;
                    out->size    = (size_t)body_len;
                    out->headers = hbuf;
                } else { free( buf ); free( hbuf ); }
            } else {
                if ( hbuf ) free( hbuf );
                if ( buf ) free( buf );
            }
            env->ReleaseByteArrayElements( result, p, JNI_ABORT );
            rc = 0;
        }
        env->DeleteLocalRef( result );
    }
    if ( detach ) s_vm->DetachCurrentThread();
    return rc;
}

extern "C" void hsp3dx_http_mp_end( void )
{
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env || !ensure_mp_methods( env ) ) { if ( detach ) s_vm->DetachCurrentThread(); return; }
    env->CallStaticVoidMethod( s_HspHttp_class, s_mid_mp_end );
    if ( env->ExceptionCheck() ) env->ExceptionClear();
    if ( detach ) s_vm->DetachCurrentThread();
}
