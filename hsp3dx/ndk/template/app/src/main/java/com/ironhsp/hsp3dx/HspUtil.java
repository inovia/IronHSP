//
//  HspUtil.java — プラットフォーム抽象機能 (exec / dialog / pref) JNI から呼ぶ
//
package com.ironhsp.hsp3dx;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.content.ComponentCallbacks2;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.media.ToneGenerator;
import android.media.AudioManager;
import android.net.Uri;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Bundle;
import android.os.Looper;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.util.Log;
import android.view.Surface;

import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicInteger;

public class HspUtil {

    static {
        try { System.loadLibrary( "hsp3dx" ); }
        catch ( UnsatisfiedLinkError e ) { /* NativeActivity 経由で既に load 済の場合は無視 */ }
    }

    private static final String TAG = "HspUtil";
    private static final String PREFS_NAME = "hsp3dx_prefs";

    //  NativeActivity が起動直後にセットする (hsp3dx_platform_init)
    private static Activity  sActivity = null;

    public static void setActivity( Activity a ) {
        sActivity = a;
        installEventHooks();
    }
    public static Activity getActivity() { return sActivity; }

    //  ================================================================
    //  Phase M.3: アプリライフサイクル通知を JNI 経由で hsp3dx_events_fire へ
    //  event ID は hsp3dx_events.h の定数と揃える:
    //    0=BACKGROUND / 1=FOREGROUND / 2=WILL_TERMINATE
    //    3=LOW_MEMORY / 4=ORIENTATION_CHANGED
    //  ================================================================
    public static native void nativeFireEvent( int eventId );

    private static boolean sHooksInstalled = false;

    private static void installEventHooks()
    {
        if ( sHooksInstalled || sActivity == null ) return;
        Application app = sActivity.getApplication();
        if ( app == null ) return;

        app.registerActivityLifecycleCallbacks(
            new Application.ActivityLifecycleCallbacks() {
                @Override public void onActivityResumed( Activity a )  { Log.i(TAG, "onResume"); nativeFireEvent( 1 ); }
                @Override public void onActivityPaused( Activity a )   { Log.i(TAG, "onPause");  nativeFireEvent( 0 ); }
                @Override public void onActivityDestroyed( Activity a ){ Log.i(TAG, "onDestroy"); nativeFireEvent( 2 ); }
                @Override public void onActivityCreated( Activity a, Bundle b ) {}
                @Override public void onActivityStarted( Activity a ) {}
                @Override public void onActivityStopped( Activity a ) {}
                @Override public void onActivitySaveInstanceState( Activity a, Bundle b ) {}
            }
        );
        app.registerComponentCallbacks( new ComponentCallbacks2() {
            @Override public void onConfigurationChanged( Configuration c ) { Log.i(TAG, "onCfg"); nativeFireEvent( 4 ); }
            @Override public void onLowMemory() { Log.i(TAG, "onLowMem"); nativeFireEvent( 3 ); }
            @Override public void onTrimMemory( int level ) {}
        } );

        sHooksInstalled = true;
        Log.i( TAG, "lifecycle/component hooks installed" );
    }

    //  ================================================================
    //  exec: URL を Intent で開く (http/https/mailto/tel 等)
    //  ================================================================
    public static int exec( String urlOrPath )
    {
        if ( sActivity == null || urlOrPath == null || urlOrPath.isEmpty() ) return -1;
        try {
            Uri uri = Uri.parse( urlOrPath );
            Intent intent = new Intent( Intent.ACTION_VIEW, uri );
            intent.addFlags( Intent.FLAG_ACTIVITY_NEW_TASK );
            sActivity.startActivity( intent );
            return 0;
        } catch ( Exception e ) {
            Log.w( TAG, "exec: " + e );
            return -1;
        }
    }

    //  ================================================================
    //  dialog: AlertDialog 表示、ユーザー選択まで同期待機
    //    mode: 0=OK / 1=OK+Cancel / 2=Yes+No / 3=Yes+No+Cancel
    //    戻り値: 1=OK/Yes, 2=Cancel/No, 3=Cancel(mode=3), -1=失敗
    //  ================================================================
    public static int dialog( final String text, final String title, final int mode )
    {
        if ( sActivity == null ) return -1;
        final AtomicInteger result = new AtomicInteger( -1 );
        final CountDownLatch latch = new CountDownLatch( 1 );

        sActivity.runOnUiThread( new Runnable() {
            @Override
            public void run() {
                try {
                    AlertDialog.Builder b = new AlertDialog.Builder( sActivity );
                    b.setTitle( title != null ? title : "hsp3dx" );
                    b.setMessage( text != null ? text : "" );
                    b.setCancelable( false );

                    DialogInterface.OnClickListener L1 = new DialogInterface.OnClickListener() {
                        @Override public void onClick( DialogInterface d, int w ) {
                            result.set( 1 ); latch.countDown();
                        }
                    };
                    DialogInterface.OnClickListener L2 = new DialogInterface.OnClickListener() {
                        @Override public void onClick( DialogInterface d, int w ) {
                            result.set( 2 ); latch.countDown();
                        }
                    };
                    DialogInterface.OnClickListener L3 = new DialogInterface.OnClickListener() {
                        @Override public void onClick( DialogInterface d, int w ) {
                            result.set( 3 ); latch.countDown();
                        }
                    };

                    switch ( mode ) {
                    case 1:
                        b.setPositiveButton( "OK",     L1 );
                        b.setNegativeButton( "Cancel", L2 );
                        break;
                    case 2:
                        b.setPositiveButton( "Yes", L1 );
                        b.setNegativeButton( "No",  L2 );
                        break;
                    case 3:
                        b.setPositiveButton( "Yes",    L1 );
                        b.setNeutralButton ( "No",     L2 );
                        b.setNegativeButton( "Cancel", L3 );
                        break;
                    default:
                        b.setPositiveButton( "OK", L1 );
                        break;
                    }
                    b.show();
                } catch ( Exception e ) {
                    Log.w( TAG, "dialog: " + e );
                    latch.countDown();
                }
            }
        } );

        try { latch.await(); } catch ( InterruptedException ie ) { return -1; }
        return result.get();
    }

    //  ================================================================
    //  KV 永続ストア: SharedPreferences ("hsp3dx_prefs")
    //    section + key は "section/key" の単一キーで保存 (section 空の場合は key のみ)
    //  ================================================================
    private static String fullKey( String section, String key )
    {
        if ( section == null || section.isEmpty() ) return key == null ? "" : key;
        return section + "/" + ( key == null ? "" : key );
    }

    private static SharedPreferences prefs()
    {
        if ( sActivity == null ) return null;
        return sActivity.getSharedPreferences( PREFS_NAME, Context.MODE_PRIVATE );
    }

    public static int prefSetStr( String section, String key, String value )
    {
        SharedPreferences p = prefs();
        if ( p == null || key == null ) return -1;
        p.edit().putString( fullKey( section, key ), value != null ? value : "" ).apply();
        return 0;
    }

    public static int prefSetInt( String section, String key, int value )
    {
        SharedPreferences p = prefs();
        if ( p == null || key == null ) return -1;
        p.edit().putInt( fullKey( section, key ), value ).apply();
        return 0;
    }

    public static String prefGetStr( String section, String key, String defValue )
    {
        SharedPreferences p = prefs();
        if ( p == null || key == null ) return defValue != null ? defValue : "";
        return p.getString( fullKey( section, key ), defValue != null ? defValue : "" );
    }

    public static int prefGetInt( String section, String key, int defValue )
    {
        SharedPreferences p = prefs();
        if ( p == null || key == null ) return defValue;
        //  putString / putInt が混在するケースに備えて try-catch で string→int fallback
        try {
            return p.getInt( fullKey( section, key ), defValue );
        } catch ( ClassCastException ce ) {
            String s = p.getString( fullKey( section, key ), null );
            if ( s == null ) return defValue;
            try { return Integer.parseInt( s ); } catch ( Exception ex ) { return defValue; }
        }
    }

    public static int prefRemove( String section, String key )
    {
        SharedPreferences p = prefs();
        if ( p == null || key == null ) return -1;
        p.edit().remove( fullKey( section, key ) ).apply();
        return 0;
    }

    public static int prefExists( String section, String key )
    {
        SharedPreferences p = prefs();
        if ( p == null || key == null ) return 0;
        return p.contains( fullKey( section, key ) ) ? 1 : 0;
    }

    public static String prefListKeys( String section )
    {
        SharedPreferences p = prefs();
        if ( p == null ) return "";
        StringBuilder sb = new StringBuilder();
        String prefix = ( section != null && !section.isEmpty() ) ? section + "/" : null;
        boolean first = true;
        for ( String k : p.getAll().keySet() ) {
            String keyOnly;
            if ( prefix != null ) {
                if ( !k.startsWith( prefix ) ) continue;
                keyOnly = k.substring( prefix.length() );
            } else {
                keyOnly = k;
            }
            if ( !first ) sb.append( '\n' );
            sb.append( keyOnly );
            first = false;
        }
        return sb.toString();
    }

    //  ================================================================
    //  Phase M.4: デバイス情報 / 制御
    //  ================================================================

    public static void devVibrate( int ms )
    {
        if ( sActivity == null || ms <= 0 ) return;
        try {
            Vibrator v = (Vibrator) sActivity.getSystemService( Context.VIBRATOR_SERVICE );
            if ( v == null || !v.hasVibrator() ) return;
            if ( Build.VERSION.SDK_INT >= Build.VERSION_CODES.O ) {
                v.vibrate( VibrationEffect.createOneShot( ms, VibrationEffect.DEFAULT_AMPLITUDE ) );
            } else {
                v.vibrate( ms );
            }
        } catch ( Exception e ) {
            Log.w( TAG, "vibrate: " + e );
        }
    }

    public static int devIsDark()
    {
        if ( sActivity == null ) return 0;
        int m = sActivity.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        return m == Configuration.UI_MODE_NIGHT_YES ? 1 : 0;
    }

    //  level[0] = 0-100 (-1=取得不能)、state[1] = 0/1/2 (-1=unknown)
    public static int[] devBattery()
    {
        int[] r = new int[] { -1, -1 };
        if ( sActivity == null ) return r;
        try {
            IntentFilter f = new IntentFilter( Intent.ACTION_BATTERY_CHANGED );
            Intent bat = sActivity.registerReceiver( null, f );
            if ( bat == null ) return r;
            int lv = bat.getIntExtra( BatteryManager.EXTRA_LEVEL, -1 );
            int sc = bat.getIntExtra( BatteryManager.EXTRA_SCALE, -1 );
            if ( lv >= 0 && sc > 0 ) r[0] = (int)( lv * 100 / sc );
            int st = bat.getIntExtra( BatteryManager.EXTRA_STATUS, BatteryManager.BATTERY_STATUS_UNKNOWN );
            switch ( st ) {
            case BatteryManager.BATTERY_STATUS_CHARGING:     r[1] = 1; break;
            case BatteryManager.BATTERY_STATUS_FULL:         r[1] = 2; break;
            case BatteryManager.BATTERY_STATUS_DISCHARGING:
            case BatteryManager.BATTERY_STATUS_NOT_CHARGING: r[1] = 0; break;
            default:                                         r[1] = -1; break;
            }
        } catch ( Exception e ) {
            Log.w( TAG, "battery: " + e );
        }
        return r;
    }

    public static int devOrientation()
    {
        if ( sActivity == null ) return 0;
        int rot = sActivity.getWindowManager().getDefaultDisplay().getRotation();
        switch ( rot ) {
        case Surface.ROTATION_0:   return 0;
        case Surface.ROTATION_90:  return 1;
        case Surface.ROTATION_180: return 2;
        case Surface.ROTATION_270: return 3;
        default:                   return 0;
        }
    }

    public static void devSound( int id )
    {
        try {
            //  id は iOS 互換を意識して無視。Android は TONE_PROP_BEEP 固定で鳴らす
            ToneGenerator tg = new ToneGenerator( AudioManager.STREAM_NOTIFICATION, 100 );
            tg.startTone( ToneGenerator.TONE_PROP_BEEP, 150 );
            tg.release();
        } catch ( Exception e ) {
            Log.w( TAG, "sound: " + e );
        }
    }

    public static int prefClear( String section )
    {
        SharedPreferences p = prefs();
        if ( p == null ) return -1;
        if ( section == null || section.isEmpty() ) {
            p.edit().clear().apply();
        } else {
            String prefix = section + "/";
            SharedPreferences.Editor ed = p.edit();
            for ( Map.Entry<String, ?> e : p.getAll().entrySet() ) {
                if ( e.getKey().startsWith( prefix ) ) ed.remove( e.getKey() );
            }
            ed.apply();
        }
        return 0;
    }
}
