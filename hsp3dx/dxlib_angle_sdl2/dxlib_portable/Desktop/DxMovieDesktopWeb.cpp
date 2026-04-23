//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop Web (emscripten) 用 ムービー 実装
//
//      emscripten の場合は HTML5 <video> 要素をブラウザ側で生成し、その
//      currentTime に合わせて canvas.drawImage → getImageData で BGRA
//      (正しくは RGBA) を取り出す。この実装は emscripten_run_script_int /
//      EM_ASM 経由で JS ブリッジして texture を更新する簡易版。
//
//      **音声について:** HTML5 <video> 要素が native に audio 再生する。
//      muted=false で作成、SetMovieVolumeToGraph(0..10000) で <video>.volume
//      (0..1) にマップ。ChangeMovieVolumeToGraph (0..255) も対応。
//      ただし Chrome/Safari の Autoplay Policy で user gesture 前の .play()
//      は自動的に muted 再生にされる可能性あり (hsp3dx 側で touchstart /
//      keydown を契機に PlayMovieToGraph を呼ぶ運用推奨)。
//
//      制約:
//      - user gesture 無しに .play() を呼ぶと Autoplay Policy で失敗する
//        (stage 側で最初のクリック時に PlayMovieToGraph を呼ぶ等必要)
//      - クロスオリジンの動画は CORS ヘッダが無いと getImageData 不可
//      - 音声は <video> が自前で鳴らす (video と独立、PTS 同期は browser 側)
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#if defined(__EMSCRIPTEN__)

#include <emscripten.h>
#include <emscripten/html5.h>

#include "../DxCompileConfig.h"
#include "../DxLib.h"
#include "../DxBaseImage.h"
#include "../DxGraphics.h"

#include <SDL.h>
#include <cstdio>
#include <cstring>
#include <unordered_map>
#include <vector>
#include <string>

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

struct WebMovieEntry {
    int         video_id      = -1 ;   // JS 側の配列 index (window._dxMovies[id])
    int         graph_handle  = -1 ;
    int         width         = 0 ;
    int         height        = 0 ;
    int         state         = 0 ;
    int         loop_flag     = 0 ;
    int         volume_0_10000= 10000 ;
    int         last_update_ms= 0 ;
    std::vector<unsigned char> frame_argb ;
} ;

static std::unordered_map<int, WebMovieEntry *> g_WebMovies ;

// JS 側に video 要素管理用 helper を一度だけ inject する
static int g_JsInited = 0 ;
static void web_inject_helpers( void )
{
    if ( g_JsInited ) return ;
    EM_ASM({
        window._dxMovies = [];
        window._dxMovieCanvas = document.createElement('canvas');
        window._dxMovieOpen = function(url) {
            var v = document.createElement('video');
            v.src = url;
            v.crossOrigin = 'anonymous';
            v.muted = false;
            v.preload = 'auto';
            v.playsInline = true;
            window._dxMovies.push({ video: v, ready: false, width: 0, height: 0 });
            var id = window._dxMovies.length - 1;
            v.addEventListener('loadedmetadata', function() {
                window._dxMovies[id].width  = v.videoWidth;
                window._dxMovies[id].height = v.videoHeight;
                window._dxMovies[id].ready = true;
            });
            v.load();
            return id;
        };
        window._dxMovieReady = function(id) {
            return window._dxMovies[id] && window._dxMovies[id].ready ? 1 : 0;
        };
        window._dxMovieSize = function(id, wh) {
            var m = window._dxMovies[id];
            return wh === 0 ? m.width : m.height;
        };
        window._dxMoviePlay = function(id, loop) {
            var m = window._dxMovies[id];
            m.video.loop = !!loop;
            var p = m.video.play();
            if (p) p.catch(function(e){ console.warn('dxMovie play rejected:', e); });
        };
        window._dxMoviePause = function(id) { window._dxMovies[id].video.pause(); };
        window._dxMovieEnded = function(id) { return window._dxMovies[id].video.ended ? 1 : 0; };
        window._dxMovieTime  = function(id) { return (window._dxMovies[id].video.currentTime * 1000)|0; };
        window._dxMovieSeek  = function(id, ms) { window._dxMovies[id].video.currentTime = ms/1000; };
        window._dxMovieVol   = function(id, v) { window._dxMovies[id].video.volume = v/10000; };
        // canvas に現在フレームを描画して ImageData を返す
        window._dxMovieReadFrame = function(id) {
            var m = window._dxMovies[id];
            var c = window._dxMovieCanvas;
            c.width = m.width; c.height = m.height;
            var ctx = c.getContext('2d');
            ctx.drawImage(m.video, 0, 0, m.width, m.height);
            return ctx.getImageData(0, 0, m.width, m.height).data;
        };
    });
    g_JsInited = 1 ;
}

static int web_js_is_ready( int id )
{
    return EM_ASM_INT({ return window._dxMovieReady( $0 ); }, id ) ;
}
static int web_js_size( int id, int wh )
{
    return EM_ASM_INT({ return window._dxMovieSize( $0, $1 ); }, id, wh ) ;
}

extern int OpenMovieToGraph( const TCHAR *FileName, int FullColor )
{
    (void)FullColor;
    if ( !FileName ) return -1 ;
    web_inject_helpers() ;

    // JS 側で video を作成、id を取得
    int vid = EM_ASM_INT({
        return window._dxMovieOpen( UTF8ToString( $0 ) ) ;
    }, ( const char * )FileName ) ;

    // ready (loadedmetadata) になるまで最大 3 秒待つ
    for ( int i = 0 ; i < 300 ; ++i ) {
        if ( web_js_is_ready( vid ) ) break ;
        emscripten_sleep( 10 ) ;
    }
    if ( !web_js_is_ready( vid ) ) {
        std::fprintf( stderr, "[DxMovieWeb] video not ready (loadedmetadata timeout): %s\n",
                      ( const char * )FileName ) ;
        return -1 ;
    }
    int w = web_js_size( vid, 0 ) ;
    int h = web_js_size( vid, 1 ) ;

    int gh = NS_MakeGraph( w, h, TRUE ) ;
    if ( gh < 0 ) return -1 ;

    WebMovieEntry *m = new WebMovieEntry() ;
    m->video_id = vid ;
    m->graph_handle = gh ;
    m->width = w ;
    m->height = h ;
    g_WebMovies[ gh ] = m ;
    return gh ;
}

extern int OpenMovieToGraphWithStrLen( const TCHAR *FileName, size_t, int FullColor )
{ return OpenMovieToGraph( FileName, FullColor ) ; }

extern int PlayMovieToGraph( int GraphHandle, int PlayType, int )
{
    auto it = g_WebMovies.find( GraphHandle ) ;
    if ( it == g_WebMovies.end() ) return -1 ;
    WebMovieEntry *m = it->second ;
    m->loop_flag = ( PlayType & DX_PLAYTYPE_LOOPBIT ) ? 1 : 0 ;
    EM_ASM({ window._dxMoviePlay( $0, $1 ); }, m->video_id, m->loop_flag ) ;
    m->state = 1 ;
    return 0 ;
}

extern int PauseMovieToGraph( int GraphHandle, int )
{
    auto it = g_WebMovies.find( GraphHandle ) ;
    if ( it == g_WebMovies.end() ) return -1 ;
    EM_ASM({ window._dxMoviePause( $0 ); }, it->second->video_id ) ;
    it->second->state = 2 ;
    return 0 ;
}

extern int GetMovieStateToGraph( int GraphHandle )
{
    auto it = g_WebMovies.find( GraphHandle ) ;
    if ( it == g_WebMovies.end() ) return -1 ;
    WebMovieEntry *m = it->second ;
    int ended = EM_ASM_INT({ return window._dxMovieEnded( $0 ); }, m->video_id ) ;
    if ( ended && !m->loop_flag ) m->state = 0 ;
    return m->state == 1 ? 1 : 0 ;
}

extern int UpdateMovieToGraph( int GraphHandle )
{
    auto it = g_WebMovies.find( GraphHandle ) ;
    if ( it == g_WebMovies.end() ) return -1 ;
    WebMovieEntry *m = it->second ;
    if ( m->state != 1 ) return 0 ;

    // HTML5 canvas の getImageData は RGBA。BGRA (DxLib ARGB8) に swap。
    int row_bytes = m->width * 4 ;
    m->frame_argb.resize( ( size_t )m->height * row_bytes ) ;

    // JS から typed array をヒープに書き戻し、C 側にコピー
    int heap_ptr = ( int )( uintptr_t )m->frame_argb.data() ;
    EM_ASM({
        var data = window._dxMovieReadFrame( $0 );
        HEAPU8.set( data, $1 );
    }, m->video_id, heap_ptr ) ;

    // RGBA → BGRA swap
    for ( int i = 0 ; i < ( int )m->frame_argb.size() ; i += 4 ) {
        unsigned char t = m->frame_argb[ i ] ;
        m->frame_argb[ i ] = m->frame_argb[ i + 2 ] ;
        m->frame_argb[ i + 2 ] = t ;
    }

    BASEIMAGE bi ;
    std::memset( &bi, 0, sizeof( bi ) ) ;
    NS_CreateARGB8ColorData( &bi.ColorData ) ;
    bi.Width = m->width ;
    bi.Height = m->height ;
    bi.Pitch = m->width * 4 ;
    bi.GraphData = m->frame_argb.data() ;
    bi.MipMapCount = 0 ;
    bi.GraphDataCount = 0 ;
    NS_ReCreateGraphFromBaseImage( &bi, m->graph_handle ) ;
    m->last_update_ms = ( int )SDL_GetTicks() ;
    return 0 ;
}

extern int TellMovieToGraph( int GraphHandle )
{
    auto it = g_WebMovies.find( GraphHandle ) ;
    if ( it == g_WebMovies.end() ) return -1 ;
    return EM_ASM_INT({ return window._dxMovieTime( $0 ); }, it->second->video_id ) ;
}

extern int SeekMovieToGraph( int GraphHandle, int Time )
{
    auto it = g_WebMovies.find( GraphHandle ) ;
    if ( it == g_WebMovies.end() ) return -1 ;
    EM_ASM({ window._dxMovieSeek( $0, $1 ); }, it->second->video_id, Time ) ;
    return 0 ;
}

extern int SetMovieVolumeToGraph( int Volume, int GraphHandle )
{
    auto it = g_WebMovies.find( GraphHandle ) ;
    if ( it == g_WebMovies.end() ) return -1 ;
    WebMovieEntry *m = it->second ;
    m->volume_0_10000 = Volume ;
    EM_ASM({ window._dxMovieVol( $0, $1 ); }, m->video_id, Volume ) ;
    return 0 ;
}

extern int GetMovieVolumeToGraph( int GraphHandle )
{
    auto it = g_WebMovies.find( GraphHandle ) ;
    if ( it == g_WebMovies.end() ) return -1 ;
    return it->second->volume_0_10000 ;
}

extern int ChangeMovieVolumeToGraph( int Volume, int GraphHandle )
{ return SetMovieVolumeToGraph( ( Volume * 10000 + 127 ) / 255, GraphHandle ) ; }

extern int GetMovieVolumeToGraph2( int GraphHandle )
{
    auto it = g_WebMovies.find( GraphHandle ) ;
    if ( it == g_WebMovies.end() ) return -1 ;
    return ( it->second->volume_0_10000 * 255 + 5000 ) / 10000 ;
}

extern int GetMovieTotalFrameToGraph( int ) { return 0 ; }

extern int GetLastUpdateTimeMovieToGraph( int GraphHandle )
{
    auto it = g_WebMovies.find( GraphHandle ) ;
    if ( it == g_WebMovies.end() ) return -1 ;
    return it->second->last_update_ms ;
}

extern int GetMovieImageSize_File( const TCHAR *FileName, int *SizeX, int *SizeY )
{
    if ( !FileName ) return -1 ;
    // 一旦開いてサイズだけ取る (HTML5 は metadata ロードで取れる)
    int gh = OpenMovieToGraph( FileName, TRUE ) ;
    if ( gh < 0 ) return -1 ;
    auto it = g_WebMovies.find( gh ) ;
    if ( it == g_WebMovies.end() ) return -1 ;
    if ( SizeX ) *SizeX = it->second->width ;
    if ( SizeY ) *SizeY = it->second->height ;
    // Graph は DeleteGraph されるまで残す (user 責任)
    return 0 ;
}

#ifndef DX_NON_NAMESPACE
} // end namespace DxLib
#endif

#endif // __EMSCRIPTEN__
