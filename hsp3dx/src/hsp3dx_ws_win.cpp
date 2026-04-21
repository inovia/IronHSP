//
//  hsp3dx_ws_win.cpp — WinHTTP WebSocket クライアント (Windows 8+)
//
//  ・WinHttpOpen / Connect / OpenRequest / SetOption(UPGRADE) / SendRequest /
//    ReceiveResponse / CompleteUpgrade の 7 段階で確立。
//  ・受信は background thread で WinHttpWebSocketReceive をループし、
//    受信したフレームを WsSlot の message queue に push。
//  ・dx_ws_recv は queue から pop。timeout_ms >0 なら条件変数で待つ。
//  ・送信はメインスレッドから WinHttpWebSocketSend 直接呼び出し。
//
#include "hsp3dx_ws.h"

#include <windows.h>
#include <winhttp.h>

#include <atomic>
#include <condition_variable>
#include <deque>
#include <mutex>
#include <string>
#include <thread>
#include <vector>

#pragma comment(lib, "winhttp.lib")

namespace {

struct Message {
    int                    type = HSP3DX_WS_MSG_TEXT;
    std::vector<char>      data;
};

struct WsSlot {
    HINTERNET              session    = nullptr;
    HINTERNET              connection = nullptr;
    HINTERNET              request    = nullptr;
    HINTERNET              websocket  = nullptr;

    std::thread            rx_thread;
    std::atomic<int>       status { HSP3DX_WS_CLOSED };
    std::atomic<bool>      rx_quit { false };

    std::mutex             q_mx;
    std::condition_variable q_cv;
    std::deque<Message>    queue;
};

static const int kMaxWs = 64;
static WsSlot *g_slots[kMaxWs] = { nullptr };
static std::mutex g_slot_mx;

//  接続失敗時の診断用 (dx_ws_last_error で取得)
static char g_last_err[256] = { 0 };
static void set_last_err( const char *stage )
{
    DWORD e = GetLastError();
    _snprintf_s( g_last_err, sizeof(g_last_err), _TRUNCATE,
                  "[%s] GetLastError=%lu (0x%08lX)", stage, e, e );
    OutputDebugStringA( g_last_err );
    OutputDebugStringA( "\n" );
}

//  ---- UTF-8 → wchar_t (malloc) ----
static wchar_t *utf8_to_w( const char *s )
{
    if ( !s ) return nullptr;
    int n = MultiByteToWideChar( CP_UTF8, 0, s, -1, nullptr, 0 );
    if ( n <= 0 ) return nullptr;
    wchar_t *w = (wchar_t *)malloc( (size_t)n * sizeof(wchar_t) );
    MultiByteToWideChar( CP_UTF8, 0, s, -1, w, n );
    return w;
}

//  ---- url parser: "ws://host:port/path" または "wss://..." ----
struct ParsedUrl {
    bool         secure = false;
    std::wstring host;
    int          port   = 0;
    std::wstring path;
};

static bool parse_ws_url( const char *url, ParsedUrl &out )
{
    if ( !url ) return false;
    const char *p = url;
    if ( _strnicmp( p, "wss://", 6 ) == 0 ) { out.secure = true;  p += 6; }
    else if ( _strnicmp( p, "ws://",  5 ) == 0 ) { out.secure = false; p += 5; }
    else return false;

    //  host[:port]/path
    std::string host_port;
    while ( *p && *p != '/' ) { host_port += *p++; }

    std::string path_a;
    if ( *p == 0 ) path_a = "/"; else path_a = p;

    //  split host:port
    int default_port = out.secure ? 443 : 80;
    size_t colon = host_port.find( ':' );
    std::string host_a;
    int port = default_port;
    if ( colon == std::string::npos ) host_a = host_port;
    else {
        host_a = host_port.substr( 0, colon );
        port   = atoi( host_port.c_str() + colon + 1 );
        if ( port <= 0 ) port = default_port;
    }

    wchar_t *wh = utf8_to_w( host_a.c_str() );
    wchar_t *wp = utf8_to_w( path_a.c_str() );
    if ( !wh || !wp ) { free(wh); free(wp); return false; }
    out.host = wh;
    out.path = wp;
    out.port = port;
    free(wh); free(wp);
    return true;
}

static int alloc_slot( WsSlot *s )
{
    std::lock_guard<std::mutex> lk( g_slot_mx );
    for ( int i = 0; i < kMaxWs; ++i ) {
        if ( !g_slots[i] ) { g_slots[i] = s; return i; }
    }
    return -1;
}

static WsSlot *get_slot( int h )
{
    if ( h < 0 || h >= kMaxWs ) return nullptr;
    return g_slots[h];
}

static void rx_loop( WsSlot *s )
{
    const size_t BUF = 32768;
    std::vector<char> buf( BUF );
    std::vector<char> accum;
    int  accum_type = HSP3DX_WS_MSG_TEXT;

    while ( !s->rx_quit.load() && s->websocket ) {
        DWORD read = 0;
        WINHTTP_WEB_SOCKET_BUFFER_TYPE bt = WINHTTP_WEB_SOCKET_UTF8_MESSAGE_BUFFER_TYPE;
        DWORD rc = WinHttpWebSocketReceive( s->websocket, buf.data(), (DWORD)buf.size(),
                                            &read, &bt );
        if ( rc != ERROR_SUCCESS ) {
            s->status.store( HSP3DX_WS_CLOSED );
            s->q_cv.notify_all();
            break;
        }

        if ( bt == WINHTTP_WEB_SOCKET_CLOSE_BUFFER_TYPE ) {
            s->status.store( HSP3DX_WS_CLOSED );
            s->q_cv.notify_all();
            break;
        }

        bool final_fragment =
            (bt == WINHTTP_WEB_SOCKET_UTF8_MESSAGE_BUFFER_TYPE) ||
            (bt == WINHTTP_WEB_SOCKET_BINARY_MESSAGE_BUFFER_TYPE);
        int msg_type =
            (bt == WINHTTP_WEB_SOCKET_UTF8_MESSAGE_BUFFER_TYPE ||
             bt == WINHTTP_WEB_SOCKET_UTF8_FRAGMENT_BUFFER_TYPE)
                ? HSP3DX_WS_MSG_TEXT : HSP3DX_WS_MSG_BINARY;

        accum.insert( accum.end(), buf.data(), buf.data() + read );
        accum_type = msg_type;

        if ( final_fragment ) {
            Message m;
            m.type = accum_type;
            m.data = std::move( accum );
            accum.clear();
            {
                std::lock_guard<std::mutex> lk( s->q_mx );
                s->queue.push_back( std::move(m) );
            }
            s->q_cv.notify_all();
        }
    }
}

} // namespace

//  ------------------------------------------------------------------
//  public API
//  ------------------------------------------------------------------

extern "C" int hsp3dx_ws_connect( const char *url, const char *extra_hdr, int timeout_ms )
{
    ParsedUrl u;
    if ( !parse_ws_url( url, u ) ) return -1;

    if ( timeout_ms <= 0 ) timeout_ms = 10000;

    WsSlot *s = new WsSlot();
    s->status.store( HSP3DX_WS_CONNECTING );

    s->session = WinHttpOpen( L"hsp3dx/1.0",
                              WINHTTP_ACCESS_TYPE_AUTOMATIC_PROXY,
                              WINHTTP_NO_PROXY_NAME,
                              WINHTTP_NO_PROXY_BYPASS, 0 );
    if ( !s->session ) { set_last_err("WinHttpOpen"); delete s; return -1; }
    WinHttpSetTimeouts( s->session, timeout_ms, timeout_ms, timeout_ms, timeout_ms );

    s->connection = WinHttpConnect( s->session, u.host.c_str(),
                                    (INTERNET_PORT)u.port, 0 );
    if ( !s->connection ) { set_last_err("WinHttpConnect"); WinHttpCloseHandle( s->session ); delete s; return -1; }

    DWORD req_flags = u.secure ? WINHTTP_FLAG_SECURE : 0;
    s->request = WinHttpOpenRequest( s->connection, L"GET", u.path.c_str(),
                                     nullptr, WINHTTP_NO_REFERER,
                                     WINHTTP_DEFAULT_ACCEPT_TYPES, req_flags );
    if ( !s->request ) {
        set_last_err("WinHttpOpenRequest");
        WinHttpCloseHandle( s->connection );
        WinHttpCloseHandle( s->session );
        delete s;
        return -1;
    }

    //  WebSocket アップグレード要求
    BOOL ok = WinHttpSetOption( s->request, WINHTTP_OPTION_UPGRADE_TO_WEB_SOCKET,
                                nullptr, 0 );
    if ( !ok ) { set_last_err("SetOption UPGRADE"); goto fail; }

    //  追加ヘッダ
    if ( extra_hdr && extra_hdr[0] ) {
        wchar_t *wh = utf8_to_w( extra_hdr );
        if ( wh ) {
            WinHttpAddRequestHeaders( s->request, wh, (DWORD)-1L,
                                       WINHTTP_ADDREQ_FLAG_ADD );
            free( wh );
        }
    }

    ok = WinHttpSendRequest( s->request, WINHTTP_NO_ADDITIONAL_HEADERS, 0,
                             WINHTTP_NO_REQUEST_DATA, 0, 0, 0 );
    if ( !ok ) { set_last_err("WinHttpSendRequest"); goto fail; }

    ok = WinHttpReceiveResponse( s->request, nullptr );
    if ( !ok ) { set_last_err("WinHttpReceiveResponse"); goto fail; }

    s->websocket = WinHttpWebSocketCompleteUpgrade( s->request, 0 );
    if ( !s->websocket ) { set_last_err("CompleteUpgrade"); goto fail; }

    //  アップグレード後、request handle は閉じる (websocket 側で通信)
    WinHttpCloseHandle( s->request );
    s->request = nullptr;

    s->status.store( HSP3DX_WS_OPEN );
    s->rx_thread = std::thread( rx_loop, s );

    {
        int h = alloc_slot( s );
        if ( h < 0 ) {
            s->rx_quit.store( true );
            if ( s->websocket ) WinHttpCloseHandle( s->websocket );
            if ( s->rx_thread.joinable() ) s->rx_thread.join();
            if ( s->connection ) WinHttpCloseHandle( s->connection );
            if ( s->session )    WinHttpCloseHandle( s->session );
            delete s;
            return -1;
        }
        return h;
    }

fail:
    if ( s->request )    WinHttpCloseHandle( s->request );
    if ( s->connection ) WinHttpCloseHandle( s->connection );
    if ( s->session )    WinHttpCloseHandle( s->session );
    delete s;
    return -1;
}

extern "C" void hsp3dx_ws_close( int handle, int code )
{
    WsSlot *s = get_slot( handle );
    if ( !s ) return;
    if ( s->websocket && s->status.load() == HSP3DX_WS_OPEN ) {
        s->status.store( HSP3DX_WS_CLOSING );
        WinHttpWebSocketClose( s->websocket,
                                (USHORT)(code > 0 ? code : 1000),
                                nullptr, 0 );
    }
}

extern "C" void hsp3dx_ws_free( int handle )
{
    WsSlot *s = nullptr;
    {
        std::lock_guard<std::mutex> lk( g_slot_mx );
        if ( handle < 0 || handle >= kMaxWs ) return;
        s = g_slots[handle];
        g_slots[handle] = nullptr;
    }
    if ( !s ) return;
    s->rx_quit.store( true );
    if ( s->websocket ) {
        WinHttpWebSocketClose( s->websocket, 1000, nullptr, 0 );
        WinHttpCloseHandle( s->websocket );
        s->websocket = nullptr;
    }
    if ( s->rx_thread.joinable() ) s->rx_thread.join();
    if ( s->connection ) WinHttpCloseHandle( s->connection );
    if ( s->session )    WinHttpCloseHandle( s->session );
    delete s;
}

extern "C" int hsp3dx_ws_send_text( int handle, const char *text, size_t len )
{
    WsSlot *s = get_slot( handle );
    if ( !s || !s->websocket ) return -1;
    DWORD rc = WinHttpWebSocketSend( s->websocket,
                                     WINHTTP_WEB_SOCKET_UTF8_MESSAGE_BUFFER_TYPE,
                                     (PVOID)text, (DWORD)len );
    return rc == ERROR_SUCCESS ? 0 : -1;
}

extern "C" int hsp3dx_ws_send_binary( int handle, const void *data, size_t len )
{
    WsSlot *s = get_slot( handle );
    if ( !s || !s->websocket ) return -1;
    DWORD rc = WinHttpWebSocketSend( s->websocket,
                                     WINHTTP_WEB_SOCKET_BINARY_MESSAGE_BUFFER_TYPE,
                                     (PVOID)data, (DWORD)len );
    return rc == ERROR_SUCCESS ? 0 : -1;
}

extern "C" int hsp3dx_ws_recv( int handle, int timeout_ms,
                                void *out, size_t out_cap,
                                size_t *out_len, int *out_type )
{
    WsSlot *s = get_slot( handle );
    if ( !s ) return -1;

    std::unique_lock<std::mutex> lk( s->q_mx );
    if ( s->queue.empty() ) {
        if ( timeout_ms <= 0 ) {
            //  ポーリング
            if ( s->status.load() == HSP3DX_WS_CLOSED ) return -1;
            return 1;
        }
        auto pred = [&]{ return !s->queue.empty() ||
                                s->status.load() == HSP3DX_WS_CLOSED; };
        bool got = s->q_cv.wait_for( lk, std::chrono::milliseconds(timeout_ms), pred );
        if ( !got ) return 1;
        if ( s->queue.empty() ) return -1;
    }

    Message m = std::move( s->queue.front() );
    s->queue.pop_front();
    lk.unlock();

    size_t copy = m.data.size();
    if ( copy > (out_cap > 0 ? out_cap - 1 : 0) ) {
        copy = out_cap > 0 ? out_cap - 1 : 0;
    }
    if ( out && out_cap > 0 ) {
        memcpy( out, m.data.data(), copy );
        ((char *)out)[copy] = 0;
    }
    if ( out_len )  *out_len  = copy;
    if ( out_type ) *out_type = m.type;
    return 0;
}

extern "C" int hsp3dx_ws_status( int handle )
{
    WsSlot *s = get_slot( handle );
    if ( !s ) return HSP3DX_WS_CLOSED;
    return s->status.load();
}
