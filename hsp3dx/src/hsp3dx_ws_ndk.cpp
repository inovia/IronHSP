//
//  hsp3dx_ws_ndk.cpp — Android 版 WebSocket (OkHttp via JNI)
//
//  Java 側: com.ironhsp.hsp3dx.HspWebSocket
//      static int     connect(String url, String xhdr, int timeoutMs)     → handle/-1
//      static int     sendText(int id, String text)                       → 0/-1
//      static int     sendBinary(int id, byte[] data)                     → 0/-1
//      static byte[]  recv(int id, int timeoutMs)                         → null=エラー、空=タイムアウト、[type,payload...]
//      static void    close(int id, int code)
//      static void    free(int id)
//      static int     status(int id)
//
#include "hsp3dx_ws.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <jni.h>
#include <android/log.h>
#include <android/native_activity.h>

namespace DxLib { extern const ANativeActivity *GetNativeActivity( void ); }

#define LOG_TAG "hsp3dx.ws"
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO,  LOG_TAG, __VA_ARGS__)
#define LOGW(...) __android_log_print(ANDROID_LOG_WARN,  LOG_TAG, __VA_ARGS__)
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)

static JavaVM   *s_vm           = nullptr;
static jclass    s_cls          = nullptr;    //  GlobalRef
static jmethodID s_mid_connect  = nullptr;
static jmethodID s_mid_sendTxt  = nullptr;
static jmethodID s_mid_sendBin  = nullptr;
static jmethodID s_mid_recv     = nullptr;
static jmethodID s_mid_close    = nullptr;
static jmethodID s_mid_free     = nullptr;
static jmethodID s_mid_status   = nullptr;

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

static bool ensure_init( void )
{
    if ( s_cls && s_mid_connect ) return true;

    const ANativeActivity *act = DxLib::GetNativeActivity();
    if ( !act || !act->vm || !act->clazz ) return false;
    s_vm = act->vm;

    JNIEnv *env = nullptr;
    if ( s_vm->GetEnv( (void **)&env, JNI_VERSION_1_6 ) != JNI_OK ) {
        if ( s_vm->AttachCurrentThread( &env, nullptr ) != 0 ) return false;
    }

    jclass activityCls = env->GetObjectClass( act->clazz );
    jmethodID getClassLoader = env->GetMethodID( activityCls, "getClassLoader", "()Ljava/lang/ClassLoader;" );
    jobject classLoader = env->CallObjectMethod( act->clazz, getClassLoader );
    jclass classLoaderCls = env->FindClass( "java/lang/ClassLoader" );
    jmethodID loadClass = env->GetMethodID( classLoaderCls, "loadClass", "(Ljava/lang/String;)Ljava/lang/Class;" );

    jstring name = env->NewStringUTF( "com.ironhsp.hsp3dx.HspWebSocket" );
    jclass cls = (jclass)env->CallObjectMethod( classLoader, loadClass, name );
    env->DeleteLocalRef( name );
    if ( env->ExceptionCheck() ) { env->ExceptionDescribe(); env->ExceptionClear(); return false; }
    if ( !cls ) { LOGE( "HspWebSocket class not found" ); return false; }

    s_cls = (jclass)env->NewGlobalRef( cls );
    env->DeleteLocalRef( cls );

    s_mid_connect  = env->GetStaticMethodID( s_cls, "connect",
        "(Ljava/lang/String;Ljava/lang/String;I)I" );
    s_mid_sendTxt  = env->GetStaticMethodID( s_cls, "sendText",   "(ILjava/lang/String;)I" );
    s_mid_sendBin  = env->GetStaticMethodID( s_cls, "sendBinary", "(I[B)I" );
    s_mid_recv     = env->GetStaticMethodID( s_cls, "recv",       "(II)[B" );
    s_mid_close    = env->GetStaticMethodID( s_cls, "close",      "(II)V" );
    s_mid_free     = env->GetStaticMethodID( s_cls, "free",       "(I)V" );
    s_mid_status   = env->GetStaticMethodID( s_cls, "status",     "(I)I" );

    if ( !s_mid_connect || !s_mid_sendTxt || !s_mid_sendBin ||
         !s_mid_recv    || !s_mid_close   || !s_mid_free   || !s_mid_status ) {
        env->ExceptionClear();
        LOGE( "HspWebSocket methods not resolved" );
        return false;
    }
    LOGI( "JNI HspWebSocket ready" );
    return true;
}

extern "C" int hsp3dx_ws_connect( const char *url, const char *xhdr, int timeout_ms )
{
    if ( !ensure_init() ) return -1;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return -1;

    jstring ju = env->NewStringUTF( url ? url : "" );
    jstring jh = env->NewStringUTF( xhdr ? xhdr : "" );
    jint handle = env->CallStaticIntMethod( s_cls, s_mid_connect, ju, jh, (jint)timeout_ms );
    env->DeleteLocalRef( ju );
    env->DeleteLocalRef( jh );
    if ( env->ExceptionCheck() ) { env->ExceptionDescribe(); env->ExceptionClear(); handle = -1; }
    if ( detach ) s_vm->DetachCurrentThread();
    return (int)handle;
}

extern "C" void hsp3dx_ws_close( int handle, int code )
{
    if ( !ensure_init() ) return;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return;
    env->CallStaticVoidMethod( s_cls, s_mid_close, (jint)handle, (jint)code );
    if ( env->ExceptionCheck() ) env->ExceptionClear();
    if ( detach ) s_vm->DetachCurrentThread();
}

extern "C" void hsp3dx_ws_free( int handle )
{
    if ( !ensure_init() ) return;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return;
    env->CallStaticVoidMethod( s_cls, s_mid_free, (jint)handle );
    if ( env->ExceptionCheck() ) env->ExceptionClear();
    if ( detach ) s_vm->DetachCurrentThread();
}

extern "C" int hsp3dx_ws_send_text( int handle, const char *text, size_t len )
{
    if ( !ensure_init() ) return -1;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return -1;

    //  NewStringUTF は null 終端文字列前提。len を考慮するため一時バッファで null 終端保証。
    int rc;
    if ( text && len > 0 ) {
        char *buf = (char *)malloc( len + 1 );
        if ( !buf ) { if ( detach ) s_vm->DetachCurrentThread(); return -1; }
        memcpy( buf, text, len );
        buf[len] = 0;
        jstring jt = env->NewStringUTF( buf );
        free( buf );
        rc = (int)env->CallStaticIntMethod( s_cls, s_mid_sendTxt, (jint)handle, jt );
        env->DeleteLocalRef( jt );
    } else {
        jstring jt = env->NewStringUTF( "" );
        rc = (int)env->CallStaticIntMethod( s_cls, s_mid_sendTxt, (jint)handle, jt );
        env->DeleteLocalRef( jt );
    }
    if ( env->ExceptionCheck() ) { env->ExceptionClear(); rc = -1; }
    if ( detach ) s_vm->DetachCurrentThread();
    return rc;
}

extern "C" int hsp3dx_ws_send_binary( int handle, const void *data, size_t len )
{
    if ( !ensure_init() ) return -1;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return -1;

    jbyteArray arr = env->NewByteArray( (jsize)len );
    if ( data && len > 0 ) {
        env->SetByteArrayRegion( arr, 0, (jsize)len, (const jbyte *)data );
    }
    int rc = (int)env->CallStaticIntMethod( s_cls, s_mid_sendBin, (jint)handle, arr );
    env->DeleteLocalRef( arr );
    if ( env->ExceptionCheck() ) { env->ExceptionClear(); rc = -1; }
    if ( detach ) s_vm->DetachCurrentThread();
    return rc;
}

extern "C" int hsp3dx_ws_recv( int handle, int timeout_ms,
                                void *out, size_t out_cap,
                                size_t *out_len, int *out_type )
{
    if ( out_len ) *out_len = 0;
    if ( out_type ) *out_type = 0;
    if ( !ensure_init() ) return -1;

    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return -1;

    jbyteArray result = (jbyteArray)env->CallStaticObjectMethod(
        s_cls, s_mid_recv, (jint)handle, (jint)timeout_ms );
    if ( env->ExceptionCheck() ) { env->ExceptionDescribe(); env->ExceptionClear();
                                    if ( detach ) s_vm->DetachCurrentThread(); return -1; }
    if ( !result ) {
        //  null = エラー/切断
        if ( detach ) s_vm->DetachCurrentThread();
        return -1;
    }

    jsize len = env->GetArrayLength( result );
    if ( len == 0 ) {
        //  空 = タイムアウト
        env->DeleteLocalRef( result );
        if ( detach ) s_vm->DetachCurrentThread();
        return 1;
    }

    jbyte *p = env->GetByteArrayElements( result, nullptr );
    int type = (int)(unsigned char)p[0];
    size_t payload_len = (size_t)( len - 1 );
    if ( out ) {
        size_t cp = payload_len < out_cap ? payload_len : ( out_cap > 0 ? out_cap - 1 : 0 );
        if ( cp > 0 ) memcpy( out, p + 1, cp );
        if ( out_cap > 0 ) ((char *)out)[ cp ] = 0;
        if ( out_len ) *out_len = cp;
    } else {
        if ( out_len ) *out_len = payload_len;
    }
    if ( out_type ) *out_type = type;
    env->ReleaseByteArrayElements( result, p, JNI_ABORT );
    env->DeleteLocalRef( result );
    if ( detach ) s_vm->DetachCurrentThread();
    return 0;
}

extern "C" int hsp3dx_ws_status( int handle )
{
    if ( !ensure_init() ) return 3;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return 3;
    int rc = (int)env->CallStaticIntMethod( s_cls, s_mid_status, (jint)handle );
    if ( env->ExceptionCheck() ) { env->ExceptionClear(); rc = 3; }
    if ( detach ) s_vm->DetachCurrentThread();
    return rc;
}
