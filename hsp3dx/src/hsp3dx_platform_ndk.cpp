//
//  hsp3dx_platform_ndk.cpp — Android 版プラットフォーム実装 (exec/dialog/pref)
//
//  JNI で HspUtil.java の static メソッドを呼び出す。
//  HspHttp.java / hsp3dx_http_ndk.cpp と同じ ClassLoader.loadClass パターン。
//
#ifdef __ANDROID__

#include "hsp3dx_platform.h"

#include <jni.h>
#include <stdlib.h>
#include <string.h>
#include <android/log.h>
#include <android/native_activity.h>

namespace DxLib { extern const ANativeActivity *GetNativeActivity( void ); }

#define LOG_TAG "hsp3dx.util"
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO,  LOG_TAG, __VA_ARGS__)
#define LOGW(...) __android_log_print(ANDROID_LOG_WARN,  LOG_TAG, __VA_ARGS__)
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)

static JavaVM  *s_vm               = nullptr;
static jclass   s_HspUtil_class    = nullptr;
static jmethodID s_mid_setActivity = nullptr;
static jmethodID s_mid_exec        = nullptr;
static jmethodID s_mid_dialog      = nullptr;
static jmethodID s_mid_prefSetStr  = nullptr;
static jmethodID s_mid_prefSetInt  = nullptr;
static jmethodID s_mid_prefGetStr  = nullptr;
static jmethodID s_mid_prefGetInt  = nullptr;
static jmethodID s_mid_prefRemove  = nullptr;
static jmethodID s_mid_prefClear   = nullptr;

static JNIEnv *jni_env( bool *needs_detach )
{
    *needs_detach = false;
    if ( !s_vm ) return nullptr;
    JNIEnv *env = nullptr;
    int st = s_vm->GetEnv( (void **)&env, JNI_VERSION_1_6 );
    if ( st == JNI_EDETACHED ) {
        if ( s_vm->AttachCurrentThread( &env, nullptr ) == 0 ) {
            *needs_detach = true; return env;
        }
        return nullptr;
    }
    return env;
}

static bool ensure_jni_init()
{
    if ( s_HspUtil_class && s_mid_exec ) return true;

    const ANativeActivity *act = DxLib::GetNativeActivity();
    if ( !act ) { LOGE( "NativeActivity is null" ); return false; }
    s_vm = act->vm;

    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return false;

    jclass activityCls = env->GetObjectClass( act->clazz );
    jmethodID getClassLoader = env->GetMethodID( activityCls, "getClassLoader", "()Ljava/lang/ClassLoader;" );
    jobject classLoader = env->CallObjectMethod( act->clazz, getClassLoader );
    jclass classLoaderCls = env->FindClass( "java/lang/ClassLoader" );
    jmethodID loadClass = env->GetMethodID( classLoaderCls, "loadClass", "(Ljava/lang/String;)Ljava/lang/Class;" );

    jstring name = env->NewStringUTF( "com.ironhsp.hsp3dx.HspUtil" );
    jclass cls = (jclass)env->CallObjectMethod( classLoader, loadClass, name );
    env->DeleteLocalRef( name );

    if ( env->ExceptionCheck() ) { env->ExceptionDescribe(); env->ExceptionClear(); return false; }
    if ( !cls ) { LOGE( "HspUtil not found" ); return false; }

    s_HspUtil_class = (jclass)env->NewGlobalRef( cls );
    env->DeleteLocalRef( cls );

    s_mid_setActivity = env->GetStaticMethodID( s_HspUtil_class, "setActivity", "(Landroid/app/Activity;)V" );
    s_mid_exec        = env->GetStaticMethodID( s_HspUtil_class, "exec",        "(Ljava/lang/String;)I" );
    s_mid_dialog      = env->GetStaticMethodID( s_HspUtil_class, "dialog",      "(Ljava/lang/String;Ljava/lang/String;I)I" );
    s_mid_prefSetStr  = env->GetStaticMethodID( s_HspUtil_class, "prefSetStr",  "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I" );
    s_mid_prefSetInt  = env->GetStaticMethodID( s_HspUtil_class, "prefSetInt",  "(Ljava/lang/String;Ljava/lang/String;I)I" );
    s_mid_prefGetStr  = env->GetStaticMethodID( s_HspUtil_class, "prefGetStr",  "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;" );
    s_mid_prefGetInt  = env->GetStaticMethodID( s_HspUtil_class, "prefGetInt",  "(Ljava/lang/String;Ljava/lang/String;I)I" );
    s_mid_prefRemove  = env->GetStaticMethodID( s_HspUtil_class, "prefRemove",  "(Ljava/lang/String;Ljava/lang/String;)I" );
    s_mid_prefClear   = env->GetStaticMethodID( s_HspUtil_class, "prefClear",   "(Ljava/lang/String;)I" );

    //  setActivity(act->clazz) で HspUtil にアプリ Activity を渡す
    if ( s_mid_setActivity ) {
        env->CallStaticVoidMethod( s_HspUtil_class, s_mid_setActivity, act->clazz );
    }

    if ( detach ) s_vm->DetachCurrentThread();
    return s_mid_exec != nullptr;
}

//  ---- exec ----
extern "C" int hsp3dx_platform_exec( const char *url_or_path, const char * /*param*/, int /*mode*/ )
{
    if ( !ensure_jni_init() || !url_or_path ) return -1;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return -1;
    jstring js = env->NewStringUTF( url_or_path );
    jint rc = env->CallStaticIntMethod( s_HspUtil_class, s_mid_exec, js );
    env->DeleteLocalRef( js );
    if ( detach ) s_vm->DetachCurrentThread();
    return (int)rc;
}

//  ---- dialog ----
extern "C" int hsp3dx_platform_dialog( const char *text, const char *title, int mode )
{
    if ( !ensure_jni_init() ) return -1;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return -1;
    jstring jt = env->NewStringUTF( text  ? text  : "" );
    jstring jc = env->NewStringUTF( title ? title : "hsp3dx" );
    jint rc = env->CallStaticIntMethod( s_HspUtil_class, s_mid_dialog, jt, jc, (jint)mode );
    env->DeleteLocalRef( jt ); env->DeleteLocalRef( jc );
    if ( detach ) s_vm->DetachCurrentThread();
    return (int)rc;
}

//  ---- pref ----
extern "C" int hsp3dx_pref_set_str( const char *section, const char *key, const char *value )
{
    if ( !ensure_jni_init() || !key ) return -1;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return -1;
    jstring js = env->NewStringUTF( section ? section : "" );
    jstring jk = env->NewStringUTF( key );
    jstring jv = env->NewStringUTF( value ? value : "" );
    jint rc = env->CallStaticIntMethod( s_HspUtil_class, s_mid_prefSetStr, js, jk, jv );
    env->DeleteLocalRef( js ); env->DeleteLocalRef( jk ); env->DeleteLocalRef( jv );
    if ( detach ) s_vm->DetachCurrentThread();
    return (int)rc;
}

extern "C" int hsp3dx_pref_set_int( const char *section, const char *key, int value )
{
    if ( !ensure_jni_init() || !key ) return -1;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return -1;
    jstring js = env->NewStringUTF( section ? section : "" );
    jstring jk = env->NewStringUTF( key );
    jint rc = env->CallStaticIntMethod( s_HspUtil_class, s_mid_prefSetInt, js, jk, (jint)value );
    env->DeleteLocalRef( js ); env->DeleteLocalRef( jk );
    if ( detach ) s_vm->DetachCurrentThread();
    return (int)rc;
}

extern "C" int hsp3dx_pref_get_str( const char *section, const char *key,
                                     char *out, size_t out_cap, const char *default_value )
{
    if ( !ensure_jni_init() || !key || !out || out_cap == 0 ) return -1;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return -1;
    jstring js = env->NewStringUTF( section ? section : "" );
    jstring jk = env->NewStringUTF( key );
    jstring jd = env->NewStringUTF( default_value ? default_value : "" );
    jstring jresult = (jstring)env->CallStaticObjectMethod(
        s_HspUtil_class, s_mid_prefGetStr, js, jk, jd );
    env->DeleteLocalRef( js ); env->DeleteLocalRef( jk ); env->DeleteLocalRef( jd );

    int written = -1;
    if ( jresult ) {
        const char *c = env->GetStringUTFChars( jresult, nullptr );
        if ( c ) {
            strncpy( out, c, out_cap - 1 );
            out[out_cap - 1] = 0;
            written = (int)strlen( out );
            env->ReleaseStringUTFChars( jresult, c );
        }
        env->DeleteLocalRef( jresult );
    } else {
        strncpy( out, default_value ? default_value : "", out_cap - 1 );
        out[out_cap - 1] = 0;
        written = (int)strlen( out );
    }
    if ( detach ) s_vm->DetachCurrentThread();
    return written;
}

extern "C" int hsp3dx_pref_get_int( const char *section, const char *key, int default_value )
{
    if ( !ensure_jni_init() || !key ) return default_value;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return default_value;
    jstring js = env->NewStringUTF( section ? section : "" );
    jstring jk = env->NewStringUTF( key );
    jint rc = env->CallStaticIntMethod(
        s_HspUtil_class, s_mid_prefGetInt, js, jk, (jint)default_value );
    env->DeleteLocalRef( js ); env->DeleteLocalRef( jk );
    if ( detach ) s_vm->DetachCurrentThread();
    return (int)rc;
}

extern "C" int hsp3dx_pref_remove( const char *section, const char *key )
{
    if ( !ensure_jni_init() || !key ) return -1;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return -1;
    jstring js = env->NewStringUTF( section ? section : "" );
    jstring jk = env->NewStringUTF( key );
    jint rc = env->CallStaticIntMethod( s_HspUtil_class, s_mid_prefRemove, js, jk );
    env->DeleteLocalRef( js ); env->DeleteLocalRef( jk );
    if ( detach ) s_vm->DetachCurrentThread();
    return (int)rc;
}

extern "C" int hsp3dx_pref_clear( const char *section )
{
    if ( !ensure_jni_init() ) return -1;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return -1;
    jstring js = env->NewStringUTF( section ? section : "" );
    jint rc = env->CallStaticIntMethod( s_HspUtil_class, s_mid_prefClear, js );
    env->DeleteLocalRef( js );
    if ( detach ) s_vm->DetachCurrentThread();
    return (int)rc;
}

#endif  // __ANDROID__
