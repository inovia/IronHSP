//
//  HspWebSocket.java — hsp3dx Android WebSocket (OkHttp 3.x)
//
//  JNI 経由で C++ から呼ばれる。受信は OkHttp の background thread から onMessage で
//  キューに積まれ、C 側の recv() で取り出す (ポーリング方式)。
//  返却データフォーマット: byte[0] = type (0=TEXT / 1=BINARY)、byte[1..] = payload
//
package com.ironhsp.hsp3dx;

import java.util.*;
import java.util.concurrent.*;
import okhttp3.*;
import okio.ByteString;
import android.util.Log;

public class HspWebSocket extends WebSocketListener {

    private static final Map<Integer, HspWebSocket> sessions = new ConcurrentHashMap<>();
    private static int nextId = 0;

    private static final OkHttpClient baseClient = new OkHttpClient.Builder()
        .connectTimeout(30, TimeUnit.SECONDS)
        .readTimeout(0, TimeUnit.NANOSECONDS)
        .pingInterval(30, TimeUnit.SECONDS)
        .build();

    private final int id;
    private WebSocket ws;
    private volatile int status = 1;   // CONNECTING
    private final BlockingQueue<byte[]> queue = new LinkedBlockingQueue<>();

    private HspWebSocket( int id ) { this.id = id; }

    //  戻り値: handle (>=0) / -1 失敗
    public static int connect( String url, String extraHeaders, int timeoutMs )
    {
        try {
            Request.Builder b = new Request.Builder().url( url );
            if ( extraHeaders != null && !extraHeaders.isEmpty() ) {
                for ( String line : extraHeaders.split( "\\r\\n|\\n" ) ) {
                    int colon = line.indexOf( ':' );
                    if ( colon > 0 ) {
                        b.addHeader( line.substring( 0, colon ).trim(),
                                     line.substring( colon + 1 ).trim() );
                    }
                }
            }
            Request req = b.build();

            int id;
            synchronized ( HspWebSocket.class ) { id = ++nextId; }
            HspWebSocket session = new HspWebSocket( id );

            long to = timeoutMs > 0 ? timeoutMs : 30000;
            OkHttpClient c = baseClient.newBuilder()
                .connectTimeout( to, TimeUnit.MILLISECONDS )
                .build();
            session.ws = c.newWebSocket( req, session );
            sessions.put( id, session );

            //  CONNECTING → OPEN or CLOSED を待つ
            long deadline = System.currentTimeMillis() + to;
            while ( session.status == 1 && System.currentTimeMillis() < deadline ) {
                Thread.sleep( 50 );
            }
            if ( session.status != 0 ) {
                sessions.remove( id );
                Log.w( "HspWebSocket", "connect timeout or failed: " + url );
                return -1;
            }
            Log.i( "HspWebSocket", "connected id=" + id + " " + url );
            return id;
        } catch ( Exception e ) {
            Log.e( "HspWebSocket", "connect exception: " + e );
            return -1;
        }
    }

    public static int sendText( int id, String text )
    {
        HspWebSocket s = sessions.get( id );
        if ( s == null || s.ws == null ) return -1;
        return s.ws.send( text ) ? 0 : -1;
    }

    public static int sendBinary( int id, byte[] data )
    {
        HspWebSocket s = sessions.get( id );
        if ( s == null || s.ws == null ) return -1;
        return s.ws.send( ByteString.of( data ) ) ? 0 : -1;
    }

    //  byte[] = [type(1byte)] + [payload...]。null=エラーor切断、空配列=タイムアウト
    public static byte[] recv( int id, int timeoutMs )
    {
        HspWebSocket s = sessions.get( id );
        if ( s == null ) return null;
        try {
            byte[] msg;
            if ( timeoutMs <= 0 ) {
                msg = s.queue.poll();
                if ( msg == null ) {
                    //  キュー空。セッション終了なら null、まだなら空配列 (タイムアウト)
                    return s.status == 3 ? null : new byte[0];
                }
            } else {
                msg = s.queue.poll( timeoutMs, TimeUnit.MILLISECONDS );
                if ( msg == null ) return s.status == 3 ? null : new byte[0];
            }
            return msg;
        } catch ( InterruptedException e ) {
            return null;
        }
    }

    public static void close( int id, int code )
    {
        HspWebSocket s = sessions.get( id );
        if ( s != null && s.ws != null ) {
            s.ws.close( code > 0 ? code : 1000, "bye" );
        }
    }

    public static void free( int id )
    {
        HspWebSocket s = sessions.remove( id );
        if ( s != null && s.ws != null ) {
            try { s.ws.cancel(); } catch ( Exception ignored ) {}
        }
    }

    public static int status( int id )
    {
        HspWebSocket s = sessions.get( id );
        return s == null ? 3 : s.status;
    }

    //  ---- WebSocketListener ----
    @Override public void onOpen( WebSocket webSocket, Response response ) {
        status = 0;
        Log.i( "HspWebSocket", "onOpen id=" + id );
    }

    @Override public void onMessage( WebSocket webSocket, String text ) {
        byte[] payload = text.getBytes();
        byte[] buf = new byte[ payload.length + 1 ];
        buf[0] = 0;   // TEXT
        System.arraycopy( payload, 0, buf, 1, payload.length );
        queue.offer( buf );
    }

    @Override public void onMessage( WebSocket webSocket, ByteString bytes ) {
        byte[] payload = bytes.toByteArray();
        byte[] buf = new byte[ payload.length + 1 ];
        buf[0] = 1;   // BINARY
        System.arraycopy( payload, 0, buf, 1, payload.length );
        queue.offer( buf );
    }

    @Override public void onClosing( WebSocket webSocket, int code, String reason ) {
        status = 2;
        webSocket.close( code, reason );
    }

    @Override public void onClosed( WebSocket webSocket, int code, String reason ) {
        status = 3;
        Log.i( "HspWebSocket", "onClosed id=" + id + " code=" + code + " reason=" + reason );
    }

    @Override public void onFailure( WebSocket webSocket, Throwable t, Response response ) {
        status = 3;
        Log.w( "HspWebSocket", "onFailure id=" + id + ": " + t );
    }
}
