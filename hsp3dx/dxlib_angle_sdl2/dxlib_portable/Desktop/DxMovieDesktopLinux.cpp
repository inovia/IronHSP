//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop Linux 用 ムービー 実装 (GStreamer 1.0)
//
//      filesrc ! decodebin ! videoconvert ! capsfilter(BGRA) ! appsink の
//      パイプラインを gst_parse_launch で作り、appsink から BGRA フレームを
//      pull_sample で取り出して DxLib Graph に転送する。音声ストリームは
//      rtpbin にも渡さず吸い込まない (video-only)。
//
//      ビルド要件: libgstreamer1.0-dev + libgstreamer-plugins-base1.0-dev
//        Ubuntu/Debian: apt install libgstreamer1.0-dev
//                                   libgstreamer-plugins-base1.0-dev
//                                   gstreamer1.0-libav (MP4 decode)
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#if defined(__linux__) && !defined(__APPLE__)

#include <gst/gst.h>
#include <gst/app/gstappsink.h>

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

struct LinuxMovieEntry {
    GstElement                *pipeline    = nullptr ;
    GstAppSink                *appsink     = nullptr ;
    int                        graph_handle = -1 ;
    int                        width        = 0 ;
    int                        height       = 0 ;
    gint64                     duration_ms  = 0 ;
    gint64                     last_time_ms = 0 ;
    int                        state        = 0 ;  // 0=stopped, 1=playing, 2=paused
    Uint32                     play_start_ms       = 0 ;
    gint64                     play_offset_ms      = 0 ;
    int                        volume_0_10000 = 10000 ;
    int                        loop_flag    = 0 ;
    int                        last_update_ms = 0 ;
    std::string                path ;
    std::vector<unsigned char> frame_argb ;
} ;

static std::unordered_map<int, LinuxMovieEntry *> g_LinuxMovies ;
static int g_GstInited = 0 ;

static int linux_gst_init( void )
{
    if ( g_GstInited ) return 0 ;
    GError *err = nullptr ;
    if ( !gst_init_check( nullptr, nullptr, &err ) ) {
        std::fprintf( stderr, "[DxMovieLinux] gst_init_check fail: %s\n",
                      err ? err->message : "nil" ) ;
        if ( err ) g_error_free( err ) ;
        return -1 ;
    }
    g_GstInited = 1 ;
    return 0 ;
}

static LinuxMovieEntry *linux_open_reader( const char *utf8_path )
{
    if ( linux_gst_init() != 0 ) return nullptr ;

    // gst_parse_launch で appsink 付きのパイプラインを作成
    // BGRA 指定で videoconvert が自動的に NV12/YUV → BGRA 変換
    std::string pipe = "filesrc location=\"" + std::string( utf8_path ) +
        "\" ! decodebin ! videoconvert ! video/x-raw,format=BGRA ! "
        "appsink name=sink max-buffers=2 drop=false sync=true" ;

    GError *err = nullptr ;
    GstElement *pipeline = gst_parse_launch( pipe.c_str(), &err ) ;
    if ( !pipeline ) {
        std::fprintf( stderr, "[DxMovieLinux] gst_parse_launch fail: %s\n",
                      err ? err->message : "nil" ) ;
        if ( err ) g_error_free( err ) ;
        return nullptr ;
    }

    GstElement *sink = gst_bin_get_by_name( GST_BIN( pipeline ), "sink" ) ;
    if ( !sink ) { gst_object_unref( pipeline ) ; return nullptr ; }

    // Prerolling: PAUSED 状態にしてフォーマットを確定させる
    gst_element_set_state( pipeline, GST_STATE_PAUSED ) ;
    GstStateChangeReturn scret = gst_element_get_state( pipeline, nullptr, nullptr,
                                                         5 * GST_SECOND ) ;
    if ( scret == GST_STATE_CHANGE_FAILURE ) {
        std::fprintf( stderr, "[DxMovieLinux] preroll failed\n" ) ;
        gst_object_unref( sink ) ;
        gst_element_set_state( pipeline, GST_STATE_NULL ) ;
        gst_object_unref( pipeline ) ;
        return nullptr ;
    }

    // 最初の sample を取って width/height を得る
    GstSample *sample = gst_app_sink_pull_preroll( GST_APP_SINK( sink ) ) ;
    if ( !sample ) {
        gst_object_unref( sink ) ;
        gst_element_set_state( pipeline, GST_STATE_NULL ) ;
        gst_object_unref( pipeline ) ;
        return nullptr ;
    }
    GstCaps *caps = gst_sample_get_caps( sample ) ;
    GstStructure *s = gst_caps_get_structure( caps, 0 ) ;
    gint w = 0, h = 0 ;
    gst_structure_get_int( s, "width", &w ) ;
    gst_structure_get_int( s, "height", &h ) ;
    gst_sample_unref( sample ) ;

    // Duration
    gint64 dur_ns = 0 ;
    gst_element_query_duration( pipeline, GST_FORMAT_TIME, &dur_ns ) ;

    LinuxMovieEntry *m = new LinuxMovieEntry() ;
    m->pipeline = pipeline ;
    m->appsink = GST_APP_SINK( sink ) ;
    m->width = w ;
    m->height = h ;
    m->duration_ms = dur_ns / 1000000 ;
    m->path = utf8_path ;
    return m ;
}

static void linux_close_reader( LinuxMovieEntry *m )
{
    if ( !m ) return ;
    if ( m->pipeline ) {
        gst_element_set_state( m->pipeline, GST_STATE_NULL ) ;
        gst_object_unref( m->pipeline ) ;
        m->pipeline = nullptr ;
    }
    m->appsink = nullptr ;
}

static int linux_read_frame( LinuxMovieEntry *m, std::vector<unsigned char> &buf, gint64 *out_time_ms )
{
    if ( !m->appsink ) return -1 ;
    GstSample *sample = gst_app_sink_try_pull_sample( m->appsink, 0 ) ;
    if ( !sample ) {
        // EOS 判定
        if ( gst_app_sink_is_eos( m->appsink ) ) return 1 ;
        return 0 ;  // gap
    }
    GstBuffer *b = gst_sample_get_buffer( sample ) ;
    GstMapInfo map ;
    if ( !gst_buffer_map( b, &map, GST_MAP_READ ) ) {
        gst_sample_unref( sample ) ;
        return -1 ;
    }
    int row_bytes = m->width * 4 ;
    buf.resize( ( size_t )m->height * row_bytes ) ;
    // GStreamer videoconvert BGRA は stride=width*4 (padding なし) を返すのが普通
    std::memcpy( buf.data(), map.data, std::min( map.size, ( gsize )buf.size() ) ) ;

    GstClockTime pts = GST_BUFFER_PTS( b ) ;
    *out_time_ms = ( pts == GST_CLOCK_TIME_NONE ) ? 0 : ( gint64 )( pts / 1000000 ) ;

    gst_buffer_unmap( b, &map ) ;
    gst_sample_unref( sample ) ;
    return 0 ;
}

static void linux_upload_frame( LinuxMovieEntry *m )
{
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
}

// --- DxLib Movie API (Linux backend) ---

extern int OpenMovieToGraph( const TCHAR *FileName, int FullColor )
{
    (void)FullColor;
    if ( !FileName ) return -1 ;
    LinuxMovieEntry *m = linux_open_reader( ( const char * )FileName ) ;
    if ( !m ) return -1 ;

    int gh = NS_MakeGraph( m->width, m->height, TRUE ) ;
    if ( gh < 0 ) { linux_close_reader( m ) ; delete m ; return -1 ; }
    m->graph_handle = gh ;
    g_LinuxMovies[ gh ] = m ;

    gint64 t = 0 ;
    if ( linux_read_frame( m, m->frame_argb, &t ) == 0 && !m->frame_argb.empty() ) {
        m->last_time_ms = t ;
        linux_upload_frame( m ) ;
        m->last_update_ms = ( int )SDL_GetTicks() ;
    }
    return gh ;
}

extern int OpenMovieToGraphWithStrLen( const TCHAR *FileName, size_t, int FullColor )
{ return OpenMovieToGraph( FileName, FullColor ) ; }

extern int PlayMovieToGraph( int GraphHandle, int PlayType, int )
{
    auto it = g_LinuxMovies.find( GraphHandle ) ;
    if ( it == g_LinuxMovies.end() ) return -1 ;
    LinuxMovieEntry *m = it->second ;
    m->loop_flag = ( PlayType & DX_PLAYTYPE_LOOPBIT ) ? 1 : 0 ;
    gst_element_set_state( m->pipeline, GST_STATE_PLAYING ) ;
    m->state = 1 ;
    m->play_start_ms = SDL_GetTicks() ;
    return 0 ;
}

extern int PauseMovieToGraph( int GraphHandle, int )
{
    auto it = g_LinuxMovies.find( GraphHandle ) ;
    if ( it == g_LinuxMovies.end() ) return -1 ;
    LinuxMovieEntry *m = it->second ;
    if ( m->state == 1 ) {
        m->play_offset_ms += ( gint64 )( SDL_GetTicks() - m->play_start_ms ) ;
        gst_element_set_state( m->pipeline, GST_STATE_PAUSED ) ;
        m->state = 2 ;
    }
    return 0 ;
}

extern int GetMovieStateToGraph( int GraphHandle )
{
    auto it = g_LinuxMovies.find( GraphHandle ) ;
    if ( it == g_LinuxMovies.end() ) return -1 ;
    return it->second->state == 1 ? 1 : 0 ;
}

extern int UpdateMovieToGraph( int GraphHandle )
{
    auto it = g_LinuxMovies.find( GraphHandle ) ;
    if ( it == g_LinuxMovies.end() ) return -1 ;
    LinuxMovieEntry *m = it->second ;
    if ( m->state != 1 ) return 0 ;

    // EOS 時 loop 処理
    if ( gst_app_sink_is_eos( m->appsink ) ) {
        if ( m->loop_flag ) {
            gst_element_seek_simple( m->pipeline, GST_FORMAT_TIME,
                ( GstSeekFlags )( GST_SEEK_FLAG_FLUSH | GST_SEEK_FLAG_KEY_UNIT ), 0 ) ;
            m->play_start_ms = SDL_GetTicks() ;
            m->play_offset_ms = 0 ;
            m->last_time_ms = 0 ;
        } else {
            m->state = 0 ;
            return 0 ;
        }
    }

    gint64 t = 0 ;
    bool updated = false ;
    // 可能な限り直近フレームまで pull (drop=false なので通常 1-2 枚程度)
    for ( int i = 0 ; i < 4 ; ++i ) {
        int r = linux_read_frame( m, m->frame_argb, &t ) ;
        if ( r < 0 ) return -1 ;
        if ( r == 1 ) break ;  // EOS
        if ( m->frame_argb.empty() ) break ;
        m->last_time_ms = t ;
        updated = true ;
    }
    if ( updated ) {
        linux_upload_frame( m ) ;
        m->last_update_ms = ( int )SDL_GetTicks() ;
    }
    return 0 ;
}

extern int TellMovieToGraph( int GraphHandle )
{
    auto it = g_LinuxMovies.find( GraphHandle ) ;
    if ( it == g_LinuxMovies.end() ) return -1 ;
    return ( int )it->second->last_time_ms ;
}

extern int SeekMovieToGraph( int GraphHandle, int Time )
{
    auto it = g_LinuxMovies.find( GraphHandle ) ;
    if ( it == g_LinuxMovies.end() ) return -1 ;
    LinuxMovieEntry *m = it->second ;
    gboolean ok = gst_element_seek_simple( m->pipeline, GST_FORMAT_TIME,
        ( GstSeekFlags )( GST_SEEK_FLAG_FLUSH | GST_SEEK_FLAG_KEY_UNIT ),
        ( gint64 )Time * 1000000 /* ms → ns */ ) ;
    if ( !ok ) return -1 ;
    m->play_start_ms = SDL_GetTicks() ;
    m->play_offset_ms = Time ;
    m->last_time_ms = Time ;
    return 0 ;
}

extern int SetMovieVolumeToGraph( int Volume, int GraphHandle )
{
    auto it = g_LinuxMovies.find( GraphHandle ) ;
    if ( it == g_LinuxMovies.end() ) return -1 ;
    it->second->volume_0_10000 = Volume ;
    return 0 ;
}

extern int GetMovieVolumeToGraph( int GraphHandle )
{
    auto it = g_LinuxMovies.find( GraphHandle ) ;
    if ( it == g_LinuxMovies.end() ) return -1 ;
    return it->second->volume_0_10000 ;
}

extern int ChangeMovieVolumeToGraph( int Volume, int GraphHandle )
{ return SetMovieVolumeToGraph( ( Volume * 10000 + 127 ) / 255, GraphHandle ) ; }

extern int GetMovieVolumeToGraph2( int GraphHandle )
{
    auto it = g_LinuxMovies.find( GraphHandle ) ;
    if ( it == g_LinuxMovies.end() ) return -1 ;
    return ( it->second->volume_0_10000 * 255 + 5000 ) / 10000 ;
}

extern int GetMovieTotalFrameToGraph( int ) { return 0 ; }

extern int GetLastUpdateTimeMovieToGraph( int GraphHandle )
{
    auto it = g_LinuxMovies.find( GraphHandle ) ;
    if ( it == g_LinuxMovies.end() ) return -1 ;
    return it->second->last_update_ms ;
}

extern int GetMovieImageSize_File( const TCHAR *FileName, int *SizeX, int *SizeY )
{
    if ( !FileName ) return -1 ;
    LinuxMovieEntry *m = linux_open_reader( ( const char * )FileName ) ;
    if ( !m ) return -1 ;
    if ( SizeX ) *SizeX = m->width ;
    if ( SizeY ) *SizeY = m->height ;
    linux_close_reader( m ) ;
    delete m ;
    return 0 ;
}

#ifndef DX_NON_NAMESPACE
} // end namespace DxLib
#endif

#endif // __linux__ && !__APPLE__
