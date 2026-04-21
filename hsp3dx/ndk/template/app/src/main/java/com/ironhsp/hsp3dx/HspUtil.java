//
//  HspUtil.java — プラットフォーム抽象機能 (exec / dialog / pref) JNI から呼ぶ
//
package com.ironhsp.hsp3dx;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Looper;
import android.util.Log;

import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicInteger;

public class HspUtil {

    private static final String TAG = "HspUtil";
    private static final String PREFS_NAME = "hsp3dx_prefs";

    //  NativeActivity が起動直後にセットする (hsp3dx_platform_init)
    private static Activity  sActivity = null;

    public static void setActivity( Activity a ) { sActivity = a; }
    public static Activity getActivity() { return sActivity; }

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
