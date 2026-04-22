//
//  hsp3dx_platform_ndk.cpp — Android 版プラットフォーム実装 (exec/dialog/pref)
//
//  JNI で HspUtil.java の static メソッドを呼び出す。
//  HspHttp.java / hsp3dx_http_ndk.cpp と同じ ClassLoader.loadClass パターン。
//
#ifdef __ANDROID__

#include "hsp3dx_platform.h"
#include "hsp3dx_events.h"

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
static jmethodID s_mid_prefExists    = nullptr;
static jmethodID s_mid_prefListKeys  = nullptr;
static jmethodID s_mid_devVibrate    = nullptr;
static jmethodID s_mid_devIsDark     = nullptr;
static jmethodID s_mid_devBattery    = nullptr;
static jmethodID s_mid_devOrientation= nullptr;
static jmethodID s_mid_devSound      = nullptr;
static jmethodID s_mid_devAccel      = nullptr;
static jmethodID s_mid_devGyro       = nullptr;
static jmethodID s_mid_devAttitude   = nullptr;
static jmethodID s_mid_devGpsStart   = nullptr;
static jmethodID s_mid_devGpsStop    = nullptr;
static jmethodID s_mid_devGpsGet     = nullptr;
static jmethodID s_mid_devGpsStatus  = nullptr;
static jmethodID s_mid_devTorchSupported = nullptr;
static jmethodID s_mid_devTorch      = nullptr;

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
    s_mid_prefExists  = env->GetStaticMethodID( s_HspUtil_class, "prefExists",  "(Ljava/lang/String;Ljava/lang/String;)I" );
    s_mid_prefListKeys= env->GetStaticMethodID( s_HspUtil_class, "prefListKeys","(Ljava/lang/String;)Ljava/lang/String;" );
    s_mid_devVibrate    = env->GetStaticMethodID( s_HspUtil_class, "devVibrate",    "(I)V" );
    s_mid_devIsDark     = env->GetStaticMethodID( s_HspUtil_class, "devIsDark",     "()I" );
    s_mid_devBattery    = env->GetStaticMethodID( s_HspUtil_class, "devBattery",    "()[I" );
    s_mid_devOrientation= env->GetStaticMethodID( s_HspUtil_class, "devOrientation","()I" );
    s_mid_devSound      = env->GetStaticMethodID( s_HspUtil_class, "devSound",      "(I)V" );
    s_mid_devAccel      = env->GetStaticMethodID( s_HspUtil_class, "devAccel",      "()[F" );
    s_mid_devGyro       = env->GetStaticMethodID( s_HspUtil_class, "devGyro",       "()[F" );
    s_mid_devAttitude   = env->GetStaticMethodID( s_HspUtil_class, "devAttitude",   "()[F" );
    s_mid_devGpsStart   = env->GetStaticMethodID( s_HspUtil_class, "devGpsStart",   "()V" );
    s_mid_devGpsStop    = env->GetStaticMethodID( s_HspUtil_class, "devGpsStop",    "()V" );
    s_mid_devGpsGet     = env->GetStaticMethodID( s_HspUtil_class, "devGpsGet",     "()[D" );
    s_mid_devGpsStatus  = env->GetStaticMethodID( s_HspUtil_class, "devGpsStatus",  "()I" );
    s_mid_devTorchSupported = env->GetStaticMethodID( s_HspUtil_class, "devTorchSupported","()I" );
    s_mid_devTorch      = env->GetStaticMethodID( s_HspUtil_class, "devTorch",      "(I)V" );

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

extern "C" int hsp3dx_pref_exists( const char *section, const char *key )
{
    if ( !ensure_jni_init() || !key ) return 0;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return 0;
    jstring js = env->NewStringUTF( section ? section : "" );
    jstring jk = env->NewStringUTF( key );
    jint rc = env->CallStaticIntMethod( s_HspUtil_class, s_mid_prefExists, js, jk );
    env->DeleteLocalRef( js ); env->DeleteLocalRef( jk );
    if ( detach ) s_vm->DetachCurrentThread();
    return (int)rc;
}

extern "C" int hsp3dx_pref_list_keys( const char *section, char *out, size_t out_cap )
{
    if ( !ensure_jni_init() || !out || out_cap == 0 ) return -1;
    out[0] = 0;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return -1;
    jstring js = env->NewStringUTF( section ? section : "" );
    jstring jresult = (jstring)env->CallStaticObjectMethod( s_HspUtil_class, s_mid_prefListKeys, js );
    env->DeleteLocalRef( js );
    int count = 0;
    if ( jresult ) {
        const char *c = env->GetStringUTFChars( jresult, nullptr );
        if ( c ) {
            strncpy( out, c, out_cap - 1 );
            out[out_cap - 1] = 0;
            //  \n を数えてキー数を得る
            if ( out[0] ) {
                count = 1;
                for ( const char *p = out; *p; p++ ) if ( *p == '\n' ) count++;
            }
            env->ReleaseStringUTFChars( jresult, c );
        }
        env->DeleteLocalRef( jresult );
    }
    if ( detach ) s_vm->DetachCurrentThread();
    return count;
}

//  main_ndk から起動時に呼ばれる: HspUtil のロード + setActivity + lifecycle hook
extern "C" void hsp3dx_platform_init_jni( void )
{
    ensure_jni_init();
}

//  ================================================================
//  Phase M.4: デバイス制御 (HspUtil の Java メソッドを呼ぶ)
//  ================================================================
extern "C" void hsp3dx_dev_vibrate( int ms )
{
    if ( !ensure_jni_init() ) return;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return;
    env->CallStaticVoidMethod( s_HspUtil_class, s_mid_devVibrate, (jint)ms );
    if ( detach ) s_vm->DetachCurrentThread();
}

extern "C" int hsp3dx_dev_is_dark( void )
{
    if ( !ensure_jni_init() ) return 0;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return 0;
    jint rc = env->CallStaticIntMethod( s_HspUtil_class, s_mid_devIsDark );
    if ( detach ) s_vm->DetachCurrentThread();
    return (int)rc;
}

extern "C" void hsp3dx_dev_battery( int *level, int *state )
{
    if ( level ) *level = -1;
    if ( state ) *state = -1;
    if ( !ensure_jni_init() ) return;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return;
    jintArray arr = (jintArray)env->CallStaticObjectMethod( s_HspUtil_class, s_mid_devBattery );
    if ( arr ) {
        jsize n = env->GetArrayLength( arr );
        if ( n >= 2 ) {
            jint buf[2];
            env->GetIntArrayRegion( arr, 0, 2, buf );
            if ( level ) *level = (int)buf[0];
            if ( state ) *state = (int)buf[1];
        }
        env->DeleteLocalRef( arr );
    }
    if ( detach ) s_vm->DetachCurrentThread();
}

extern "C" int hsp3dx_dev_orientation( void )
{
    if ( !ensure_jni_init() ) return 0;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return 0;
    jint rc = env->CallStaticIntMethod( s_HspUtil_class, s_mid_devOrientation );
    if ( detach ) s_vm->DetachCurrentThread();
    return (int)rc;
}

extern "C" void hsp3dx_dev_sound( int id )
{
    if ( !ensure_jni_init() ) return;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return;
    env->CallStaticVoidMethod( s_HspUtil_class, s_mid_devSound, (jint)id );
    if ( detach ) s_vm->DetachCurrentThread();
}

//  センサー値取得 (jfloatArray[3] を double[3] に変換)
static void get_sensor_triple( jmethodID mid, double *a, double *b, double *c )
{
    if ( a ) *a = 0; if ( b ) *b = 0; if ( c ) *c = 0;
    if ( !ensure_jni_init() || !mid ) return;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return;
    jfloatArray arr = (jfloatArray)env->CallStaticObjectMethod( s_HspUtil_class, mid );
    if ( arr ) {
        jsize n = env->GetArrayLength( arr );
        if ( n >= 3 ) {
            jfloat buf[3];
            env->GetFloatArrayRegion( arr, 0, 3, buf );
            if ( a ) *a = (double)buf[0];
            if ( b ) *b = (double)buf[1];
            if ( c ) *c = (double)buf[2];
        }
        env->DeleteLocalRef( arr );
    }
    if ( detach ) s_vm->DetachCurrentThread();
}

extern "C" void hsp3dx_dev_accel( double *x, double *y, double *z )
{
    get_sensor_triple( s_mid_devAccel, x, y, z );
}
extern "C" void hsp3dx_dev_gyro( double *x, double *y, double *z )
{
    get_sensor_triple( s_mid_devGyro, x, y, z );
}
extern "C" void hsp3dx_dev_attitude( double *roll, double *pitch, double *yaw )
{
    get_sensor_triple( s_mid_devAttitude, roll, pitch, yaw );
}

//  Phase M.6
extern "C" void hsp3dx_dev_gps_start( void )
{
    if ( !ensure_jni_init() ) return;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return;
    env->CallStaticVoidMethod( s_HspUtil_class, s_mid_devGpsStart );
    if ( detach ) s_vm->DetachCurrentThread();
}

extern "C" void hsp3dx_dev_gps_stop( void )
{
    if ( !ensure_jni_init() ) return;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return;
    env->CallStaticVoidMethod( s_HspUtil_class, s_mid_devGpsStop );
    if ( detach ) s_vm->DetachCurrentThread();
}

extern "C" void hsp3dx_dev_gps_get( double *lat, double *lng )
{
    if ( lat ) *lat = 0; if ( lng ) *lng = 0;
    if ( !ensure_jni_init() ) return;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return;
    jdoubleArray arr = (jdoubleArray)env->CallStaticObjectMethod( s_HspUtil_class, s_mid_devGpsGet );
    if ( arr ) {
        jsize n = env->GetArrayLength( arr );
        if ( n >= 2 ) {
            jdouble buf[2];
            env->GetDoubleArrayRegion( arr, 0, 2, buf );
            if ( lat ) *lat = (double)buf[0];
            if ( lng ) *lng = (double)buf[1];
        }
        env->DeleteLocalRef( arr );
    }
    if ( detach ) s_vm->DetachCurrentThread();
}

extern "C" int hsp3dx_dev_gps_status( void )
{
    if ( !ensure_jni_init() ) return 0;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return 0;
    jint rc = env->CallStaticIntMethod( s_HspUtil_class, s_mid_devGpsStatus );
    if ( detach ) s_vm->DetachCurrentThread();
    return (int)rc;
}

extern "C" int hsp3dx_dev_torch_supported( void )
{
    if ( !ensure_jni_init() ) return 0;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return 0;
    jint rc = env->CallStaticIntMethod( s_HspUtil_class, s_mid_devTorchSupported );
    if ( detach ) s_vm->DetachCurrentThread();
    return (int)rc;
}

extern "C" void hsp3dx_dev_torch( int on )
{
    if ( !ensure_jni_init() ) return;
    bool detach = false;
    JNIEnv *env = jni_env( &detach );
    if ( !env ) return;
    env->CallStaticVoidMethod( s_HspUtil_class, s_mid_devTorch, (jint)on );
    if ( detach ) s_vm->DetachCurrentThread();
}

//  HspUtil.nativeFireEvent(int) の実装 (Java → C への通知)
extern "C" JNIEXPORT void JNICALL
Java_com_ironhsp_hsp3dx_HspUtil_nativeFireEvent( JNIEnv *, jclass, jint eventId )
{
    hsp3dx_events_fire( (int)eventId );
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
