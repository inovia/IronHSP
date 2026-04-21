//
//  HspHttp.java — hsp3dx Android HTTP helper (JNI から呼ばれる)
//
//  HttpURLConnection (Android 標準) ベースで GET/POST/PUT/DELETE/PATCH を提供。
//  戻り値は "status\nbody" 形式の文字列。status が 0 = エラー (body に理由)。
//
package com.ironhsp.hsp3dx;

import java.io.*;
import java.net.*;
import java.util.concurrent.TimeUnit;
import android.util.Log;
import okhttp3.*;

public class HspHttp {

    //  ================================================================
    //  multipart/form-data (OkHttp ベース)
    //  ================================================================
    private static MultipartBody.Builder mpBuilder = null;

    public static void mpBegin()
    {
        mpBuilder = new MultipartBody.Builder().setType( MultipartBody.FORM );
    }

    public static int mpAddText( String name, String value )
    {
        if ( mpBuilder == null ) return -1;
        mpBuilder.addFormDataPart( name, value != null ? value : "" );
        return 0;
    }

    public static int mpAddFile( String name, String filePath,
                                  String contentType, String filename )
    {
        if ( mpBuilder == null ) return -1;
        File f = new File( filePath );
        if ( !f.exists() ) { Log.w( "HspHttp", "mpAddFile: not found " + filePath ); return -1; }
        MediaType mt = ( contentType != null && !contentType.isEmpty() )
            ? MediaType.parse( contentType )
            : MediaType.parse( "application/octet-stream" );
        String fn = ( filename != null && !filename.isEmpty() ) ? filename : f.getName();
        mpBuilder.addFormDataPart( name, fn, RequestBody.create( mt, f ) );
        return 0;
    }

    //  戻り値は request() と同形式: [4byte status LE] + body
    public static byte[] mpPost( String url, String userAgent,
                                  String extraHeaders, int timeoutMs )
    {
        Log.i( "HspHttp", "mpPost: " + url );
        if ( mpBuilder == null ) return new byte[]{0,0,0,0};
        try {
            MultipartBody body = mpBuilder.build();
            Request.Builder b = new Request.Builder().url( url ).post( body );
            if ( userAgent != null && !userAgent.isEmpty() ) {
                b.header( "User-Agent", userAgent );
            }
            if ( extraHeaders != null && !extraHeaders.isEmpty() ) {
                for ( String line : extraHeaders.split( "\\r\\n|\\n" ) ) {
                    int colon = line.indexOf( ':' );
                    if ( colon > 0 ) {
                        String key = line.substring( 0, colon ).trim();
                        String val = line.substring( colon + 1 ).trim();
                        if ( !key.isEmpty() ) b.addHeader( key, val );
                    }
                }
            }
            int to = timeoutMs > 0 ? timeoutMs : 30000;
            OkHttpClient c = new OkHttpClient.Builder()
                .connectTimeout( to, TimeUnit.MILLISECONDS )
                .readTimeout( to, TimeUnit.MILLISECONDS )
                .writeTimeout( to, TimeUnit.MILLISECONDS )
                .build();
            Response response = c.newCall( b.build() ).execute();
            int code = response.code();
            byte[] respBody = ( response.body() != null ) ? response.body().bytes() : new byte[0];
            response.close();

            ByteArrayOutputStream out = new ByteArrayOutputStream();
            out.write( code        & 0xFF );
            out.write( (code >> 8) & 0xFF );
            out.write( (code >>16) & 0xFF );
            out.write( (code >>24) & 0xFF );
            out.write( respBody );
            return out.toByteArray();
        } catch ( Exception e ) {
            Log.e( "HspHttp", "mpPost exception: " + e );
            try {
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                out.write( 0 ); out.write( 0 ); out.write( 0 ); out.write( 0 );
                String msg = e.getClass().getSimpleName() + ": " + e.getMessage();
                out.write( msg.getBytes( "UTF-8" ) );
                return out.toByteArray();
            } catch ( Exception e2 ) {
                return new byte[]{0,0,0,0};
            }
        }
    }

    public static void mpEnd()
    {
        mpBuilder = null;
    }


    //  汎用リクエスト (method = "GET"/"POST"/"PUT"/"DELETE"/"PATCH")
    public static byte[] request( String method, String url,
                                   byte[] body, String contentType,
                                   String userAgent, String extraHeaders,
                                   int timeoutMs )
    {
        Log.i( "HspHttp", "request: " + method + " " + url );
        try {
            URL u = new URL( url );
            HttpURLConnection conn = (HttpURLConnection) u.openConnection();
            conn.setRequestMethod( method );
            if ( timeoutMs <= 0 ) timeoutMs = 30000;
            conn.setConnectTimeout( timeoutMs );
            conn.setReadTimeout( timeoutMs );

            if ( userAgent != null && !userAgent.isEmpty() ) {
                conn.setRequestProperty( "User-Agent", userAgent );
            }
            if ( extraHeaders != null && !extraHeaders.isEmpty() ) {
                for ( String line : extraHeaders.split( "\\r\\n|\\n" ) ) {
                    int colon = line.indexOf( ':' );
                    if ( colon > 0 ) {
                        String key = line.substring( 0, colon ).trim();
                        String val = line.substring( colon + 1 ).trim();
                        if ( !key.isEmpty() ) conn.setRequestProperty( key, val );
                    }
                }
            }

            if ( body != null && body.length > 0 ) {
                conn.setDoOutput( true );
                if ( contentType != null && !contentType.isEmpty() ) {
                    conn.setRequestProperty( "Content-Type", contentType );
                }
                OutputStream os = conn.getOutputStream();
                os.write( body );
                os.flush();
                os.close();
            }

            int code = conn.getResponseCode();
            InputStream is = ( code >= 200 && code < 400 )
                             ? conn.getInputStream() : conn.getErrorStream();
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            if ( is != null ) {
                byte[] buf = new byte[8192];
                int n;
                while ( ( n = is.read( buf ) ) > 0 ) bos.write( buf, 0, n );
                is.close();
            }
            byte[] respBody = bos.toByteArray();

            //  形式: [4byte status LE] + body バイト列
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            out.write( code        & 0xFF );
            out.write( (code >> 8) & 0xFF );
            out.write( (code >>16) & 0xFF );
            out.write( (code >>24) & 0xFF );
            out.write( respBody );
            conn.disconnect();
            return out.toByteArray();
        } catch ( Exception e ) {
            Log.e( "HspHttp", "exception: " + e.getClass().getSimpleName() + ": " + e.getMessage() );
            //  status = 0、body に例外メッセージ
            try {
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                out.write( 0 ); out.write( 0 ); out.write( 0 ); out.write( 0 );
                String msg = e.getClass().getSimpleName() + ": " + e.getMessage();
                out.write( msg.getBytes( "UTF-8" ) );
                return out.toByteArray();
            } catch ( Exception e2 ) {
                return new byte[]{0, 0, 0, 0};
            }
        }
    }
}
