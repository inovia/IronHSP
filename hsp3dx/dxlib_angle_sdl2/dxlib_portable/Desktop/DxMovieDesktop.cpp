//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop 用 ムービー 実装
//
//      プラットフォームごとに native backend を使用する方針 (ffmpeg 不使用):
//        Windows Desktop: Media Foundation (IMFSourceReader, 本ファイルで実装)
//        Mac             : AVFoundation (将来実装)
//        Linux           : GStreamer or libmpv (将来実装)
//        Web             : HTML5 <video> 要素ブリッジ (将来実装)
//
//      第一弾 (このコミット) は Windows のみ video-only (音声ミュート)。
//      DxLib 本家の Movie API (OpenMovieToGraph / PlayMovieToGraph 等) を
//      DxMovie.cpp を経由せず直接提供 (Sound/Image と同じパターン)。
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#ifdef _WIN32
#include <windows.h>
#include <mfapi.h>
#include <mfidl.h>
#include <mfreadwrite.h>
#include <mferror.h>
#endif

#include "../DxCompileConfig.h"
#include "../DxLib.h"
#include "../DxBaseImage.h"
#include "../DxGraphics.h"

#include <SDL.h>
#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <unordered_map>
#include <vector>

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

// --- Theora backend (bundled libtheoradec 経由) ------------------------
// DxMovieTheoraDesktop.cpp 側で実装。.ogv / Ogg Theora の .ogg を扱う。
struct TheoraMovie ;
extern "C" TheoraMovie *Desktop_TheoraOpen( const char *path, int *out_w, int *out_h ) ;
extern "C" int  Desktop_TheoraReadFrame( TheoraMovie *m ) ;
extern "C" void Desktop_TheoraSeekToStart( TheoraMovie *m ) ;
extern "C" int  Desktop_TheoraFps( TheoraMovie *m, int *num, int *den ) ;
extern "C" const unsigned char *Desktop_TheoraFrameBGRA( TheoraMovie *m, int *bytes ) ;
extern "C" void Desktop_TheoraClose( TheoraMovie *m ) ;

// Theora 経路で開いた GraphHandle を管理 (MF 側と competing しない前提で、
// 同じ g_Movies に入れる設計も可能だが、MovieEntry が MF 固有なので分離)
struct TheoraEntry {
    TheoraMovie *mov            = nullptr ;
    int          graph_handle   = -1 ;
    int          width          = 0 ;
    int          height         = 0 ;
    int          state          = 0 ;   // 0=stopped, 1=playing, 2=paused
    Uint32       play_start_ms  = 0 ;
    Uint32       play_offset_ms = 0 ;
    int          loop_flag      = 0 ;
    int          volume_0_10000 = 10000 ;
    double       frame_interval_ms = 0.0 ;
    double       current_time_ms = 0.0 ;
    int          last_update_ms = 0 ;
    int          update_counter = 0 ;
} ;
static std::unordered_map<int, TheoraEntry *> g_TheoraMovies ;

static bool desktop_movie_path_is_theora( const char *path )
{
    if ( !path ) return false ;
    size_t n = std::strlen( path ) ;
    if ( n >= 4 && path[ n-4 ] == '.' &&
         ( path[ n-3 ] == 'o' || path[ n-3 ] == 'O' ) &&
         ( path[ n-2 ] == 'g' || path[ n-2 ] == 'G' ) &&
         ( path[ n-1 ] == 'v' || path[ n-1 ] == 'V' ) )
        return true ;
    // .ogg は Ogg Vorbis の可能性もあるが、ここでは movie 文脈 = Theora 想定
    if ( n >= 4 && path[ n-4 ] == '.' &&
         ( path[ n-3 ] == 'o' || path[ n-3 ] == 'O' ) &&
         ( path[ n-2 ] == 'g' || path[ n-2 ] == 'G' ) &&
         ( path[ n-1 ] == 'g' || path[ n-1 ] == 'G' ) )
        return true ;
    return false ;
}

static void desktop_theora_upload_frame( TheoraEntry *t )
{
    int bytes = 0 ;
    const unsigned char *px = Desktop_TheoraFrameBGRA( t->mov, &bytes ) ;
    if ( !px || bytes == 0 ) return ;
    BASEIMAGE bi ;
    std::memset( &bi, 0, sizeof( bi ) ) ;
    NS_CreateARGB8ColorData( &bi.ColorData ) ;
    bi.Width          = t->width ;
    bi.Height         = t->height ;
    bi.Pitch          = t->width * 4 ;
    bi.GraphData      = ( void * )px ;
    bi.MipMapCount    = 0 ;
    bi.GraphDataCount = 0 ;
    NS_ReCreateGraphFromBaseImage( &bi, t->graph_handle ) ;
}

#ifdef _WIN32

// --- Windows Media Foundation backend ----------------------------------

struct MovieEntry {
    IMFSourceReader *reader           = nullptr ;
    int              graph_handle     = -1 ;
    int              width            = 0 ;
    int              height           = 0 ;
    LONGLONG         duration_100ns   = 0 ;
    LONGLONG         last_time_100ns  = 0 ;
    int              state            = 0 ;   // 0=stopped, 1=playing, 2=paused
    Uint32           play_start_ms    = 0 ;   // PlayMovieToGraph 時刻 (SDL_GetTicks)
    LONGLONG         play_offset_100ns= 0 ;   // pause/seek 時の時間オフセット
    int              volume_0_10000   = 10000 ;
    int              loop_flag        = 0 ;   // DX_PLAYTYPE_LOOP ビット
    std::vector<unsigned char> frame_argb ;   // BGRA 形式 (DxLib 内部 ARGB8 と同じバイト順)
    int              last_update_ms   = 0 ;
    int              update_counter   = 0 ;
} ;

static std::unordered_map<int, MovieEntry *> g_Movies ;
static int g_MFStarted = 0 ;

static int desktop_movie_mf_init( void )
{
    if ( g_MFStarted ) return 0 ;
    HRESULT hr = MFStartup( MF_VERSION, MFSTARTUP_FULL ) ;
    if ( FAILED( hr ) ) {
        std::fprintf( stderr, "[DxMovieDesktop] MFStartup fail: 0x%08lx\n", hr ) ;
        return -1 ;
    }
    g_MFStarted = 1 ;
    return 0 ;
}

static void desktop_movie_mf_shutdown( void )
{
    if ( !g_MFStarted ) return ;
    MFShutdown() ;
    g_MFStarted = 0 ;
}

// MP4 などを開いて IMFSourceReader を作成。RGB32 (= BGRA) 出力に設定
static IMFSourceReader *desktop_movie_open_reader( const char *utf8_path, int *out_w, int *out_h, LONGLONG *out_duration )
{
    if ( desktop_movie_mf_init() != 0 ) return nullptr ;
    // UTF-8 → UTF-16 (WCHAR)
    int wlen = MultiByteToWideChar( CP_UTF8, 0, utf8_path, -1, nullptr, 0 ) ;
    if ( wlen <= 0 ) return nullptr ;
    std::vector<wchar_t> wpath( wlen ) ;
    MultiByteToWideChar( CP_UTF8, 0, utf8_path, -1, wpath.data(), wlen ) ;

    IMFSourceReader *reader = nullptr ;
    HRESULT hr = MFCreateSourceReaderFromURL( wpath.data(), nullptr, &reader ) ;
    if ( FAILED( hr ) ) {
        std::fprintf( stderr, "[DxMovieDesktop] MFCreateSourceReaderFromURL fail: %s (0x%08lx)\n", utf8_path, hr ) ;
        return nullptr ;
    }

    // 音声ストリームは今回は disable (MF に decode させない)
    reader->SetStreamSelection( MF_SOURCE_READER_FIRST_AUDIO_STREAM, FALSE ) ;
    reader->SetStreamSelection( MF_SOURCE_READER_FIRST_VIDEO_STREAM, TRUE  ) ;

    // 出力フォーマットを RGB32 に (MF の RGB32 は実際には BGRA バイト順 = DxLib ARGB8 と同じ)
    IMFMediaType *outType = nullptr ;
    MFCreateMediaType( &outType ) ;
    outType->SetGUID( MF_MT_MAJOR_TYPE, MFMediaType_Video ) ;
    outType->SetGUID( MF_MT_SUBTYPE,    MFVideoFormat_RGB32 ) ;
    hr = reader->SetCurrentMediaType( MF_SOURCE_READER_FIRST_VIDEO_STREAM, nullptr, outType ) ;
    outType->Release() ;
    if ( FAILED( hr ) ) {
        std::fprintf( stderr, "[DxMovieDesktop] SetCurrentMediaType RGB32 fail: 0x%08lx\n", hr ) ;
        reader->Release() ;
        return nullptr ;
    }

    // サイズ取得
    IMFMediaType *curType = nullptr ;
    reader->GetCurrentMediaType( MF_SOURCE_READER_FIRST_VIDEO_STREAM, &curType ) ;
    UINT32 w = 0, h = 0 ;
    MFGetAttributeSize( curType, MF_MT_FRAME_SIZE, &w, &h ) ;
    curType->Release() ;
    *out_w = ( int )w ;
    *out_h = ( int )h ;

    // 総再生時間 (100ns 単位)
    PROPVARIANT var ;
    PropVariantInit( &var ) ;
    reader->GetPresentationAttribute( MF_SOURCE_READER_MEDIASOURCE, MF_PD_DURATION, &var ) ;
    *out_duration = var.hVal.QuadPart ;
    PropVariantClear( &var ) ;
    return reader ;
}

// 最新フレームを読み出して BGRA を buf に入れる。eof なら 1 を返す。
static int desktop_movie_read_frame( MovieEntry *m, std::vector<unsigned char> &buf, LONGLONG *out_time )
{
    DWORD streamIndex = 0 ;
    DWORD flags = 0 ;
    LONGLONG time = 0 ;
    IMFSample *sample = nullptr ;
    HRESULT hr = m->reader->ReadSample( MF_SOURCE_READER_FIRST_VIDEO_STREAM, 0,
                                         &streamIndex, &flags, &time, &sample ) ;
    if ( FAILED( hr ) ) return -1 ;
    if ( flags & MF_SOURCE_READERF_ENDOFSTREAM ) {
        if ( sample ) sample->Release() ;
        return 1 ;
    }
    if ( !sample ) { *out_time = time ; return 0 ; }  // gap, no frame

    IMFMediaBuffer *mb = nullptr ;
    sample->ConvertToContiguousBuffer( &mb ) ;
    BYTE *data = nullptr ;
    DWORD cur_len = 0 ;
    mb->Lock( &data, nullptr, &cur_len ) ;

    // MF の RGB32 フォーマットは上下反転 (bottom-up) で返ることが多い。
    // DxLib ARGB8 は top-down を期待するので、コピー時に行反転する。
    int row_bytes = m->width * 4 ;
    buf.resize( ( size_t )m->height * ( size_t )row_bytes ) ;
    for ( int y = 0 ; y < m->height ; ++y )
    {
        std::memcpy( buf.data() + y * row_bytes,
                     data + ( m->height - 1 - y ) * row_bytes,
                     row_bytes ) ;
    }

    mb->Unlock() ;
    mb->Release() ;
    sample->Release() ;
    *out_time = time ;
    return 0 ;
}

// DxLib graph にフレームをアップロード
static void desktop_movie_upload_frame( MovieEntry *m )
{
    BASEIMAGE bi ;
    std::memset( &bi, 0, sizeof( bi ) ) ;
    NS_CreateARGB8ColorData( &bi.ColorData ) ;
    bi.Width          = m->width ;
    bi.Height         = m->height ;
    bi.Pitch          = m->width * 4 ;
    bi.GraphData      = m->frame_argb.data() ;
    bi.MipMapCount    = 0 ;
    bi.GraphDataCount = 0 ;
    NS_ReCreateGraphFromBaseImage( &bi, m->graph_handle ) ;
}

// --- DxLib Movie API 実装 (extern) -------------------------------------

extern int OpenMovieToGraph( const TCHAR *FileName, int FullColor )
{
    (void)FullColor;
    if ( !FileName ) return -1 ;
    const char *path = ( const char * )FileName ;  // TCHAR = char 前提

    // 拡張子で Theora 経路か判定。Theora のみ対応 (.ogv / .ogg)
    if ( desktop_movie_path_is_theora( path ) )
    {
        int w = 0, h = 0 ;
        TheoraMovie *tm = Desktop_TheoraOpen( path, &w, &h ) ;
        if ( !tm ) return -1 ;
        int gh = NS_MakeGraph( w, h, TRUE ) ;
        if ( gh < 0 ) { Desktop_TheoraClose( tm ) ; return -1 ; }

        TheoraEntry *t = new TheoraEntry() ;
        t->mov = tm ; t->graph_handle = gh ; t->width = w ; t->height = h ;
        int num = 0, den = 1 ;
        Desktop_TheoraFps( tm, &num, &den ) ;
        t->frame_interval_ms = ( num > 0 ) ? ( 1000.0 * den / num ) : ( 1000.0 / 30.0 ) ;
        g_TheoraMovies[ gh ] = t ;

        // 初期フレーム表示
        if ( Desktop_TheoraReadFrame( tm ) == 0 ) desktop_theora_upload_frame( t ) ;
        return gh ;
    }

    int w = 0, h = 0 ;
    LONGLONG dur = 0 ;
    IMFSourceReader *reader = desktop_movie_open_reader( path, &w, &h, &dur ) ;
    if ( !reader ) return -1 ;

    // w x h のグラフハンドルを作成 (描画可)
    int gh = NS_MakeGraph( w, h, TRUE ) ;
    if ( gh < 0 ) {
        reader->Release() ;
        std::fprintf( stderr, "[DxMovieDesktop] MakeGraph(%d, %d) fail\n", w, h ) ;
        return -1 ;
    }

    MovieEntry *m = new MovieEntry() ;
    m->reader = reader ;
    m->graph_handle = gh ;
    m->width = w ;
    m->height = h ;
    m->duration_100ns = dur ;
    g_Movies[ gh ] = m ;

    // 1 フレーム先読みしてグラフに流し込む (表示準備)
    LONGLONG t = 0 ;
    if ( desktop_movie_read_frame( m, m->frame_argb, &t ) == 0 && !m->frame_argb.empty() ) {
        m->last_time_100ns = t ;
        desktop_movie_upload_frame( m ) ;
        m->update_counter++ ;
        m->last_update_ms = ( int )SDL_GetTicks() ;
    }
    return gh ;
}

extern int OpenMovieToGraphWithStrLen( const TCHAR *FileName, size_t FileNameLength, int FullColor )
{
    (void)FileNameLength;
    return OpenMovieToGraph( FileName, FullColor ) ;
}

extern int PlayMovieToGraph( int GraphHandle, int PlayType, int SysPlay )
{
    (void)SysPlay;
    // Theora 経路
    auto ti = g_TheoraMovies.find( GraphHandle ) ;
    if ( ti != g_TheoraMovies.end() )
    {
        TheoraEntry *t = ti->second ;
        t->loop_flag = ( PlayType & DX_PLAYTYPE_LOOPBIT ) ? 1 : 0 ;
        t->state = 1 ;
        t->play_start_ms = SDL_GetTicks() ;
        return 0 ;
    }
    auto it = g_Movies.find( GraphHandle ) ;
    if ( it == g_Movies.end() ) return -1 ;
    MovieEntry *m = it->second ;
    m->loop_flag = ( PlayType & DX_PLAYTYPE_LOOPBIT ) ? 1 : 0 ;
    m->state = 1 ;
    m->play_start_ms = SDL_GetTicks() ;
    // 再開時は既再生時間を保持 (play_offset_100ns)
    return 0 ;
}

extern int PauseMovieToGraph( int GraphHandle, int SysPause )
{
    (void)SysPause;
    auto ti = g_TheoraMovies.find( GraphHandle ) ;
    if ( ti != g_TheoraMovies.end() )
    {
        TheoraEntry *t = ti->second ;
        if ( t->state == 1 ) {
            Uint32 elapsed = SDL_GetTicks() - t->play_start_ms ;
            t->play_offset_ms += elapsed ;
            t->state = 2 ;
        }
        return 0 ;
    }
    auto it = g_Movies.find( GraphHandle ) ;
    if ( it == g_Movies.end() ) return -1 ;
    MovieEntry *m = it->second ;
    if ( m->state == 1 ) {
        Uint32 elapsed = SDL_GetTicks() - m->play_start_ms ;
        m->play_offset_100ns += ( LONGLONG )elapsed * 10000 ;
        m->state = 2 ;
    }
    return 0 ;
}

extern int GetMovieStateToGraph( int GraphHandle )
{
    auto ti = g_TheoraMovies.find( GraphHandle ) ;
    if ( ti != g_TheoraMovies.end() )
        return ti->second->state == 1 ? 1 : 0 ;
    auto it = g_Movies.find( GraphHandle ) ;
    if ( it == g_Movies.end() ) return -1 ;
    return it->second->state == 1 ? 1 : 0 ;  // playing?
}

extern int UpdateMovieToGraph( int GraphHandle )
{
    // Theora 経路
    auto ti = g_TheoraMovies.find( GraphHandle ) ;
    if ( ti != g_TheoraMovies.end() )
    {
        TheoraEntry *t = ti->second ;
        if ( t->state != 1 ) return 0 ;
        Uint32 now = SDL_GetTicks() ;
        double target_ms = ( double )t->play_offset_ms + ( now - t->play_start_ms ) ;
        bool updated = false ;
        while ( t->current_time_ms + t->frame_interval_ms <= target_ms )
        {
            int r = Desktop_TheoraReadFrame( t->mov ) ;
            if ( r < 0 ) { t->state = 0 ; return -1 ; }
            if ( r == 1 ) {
                if ( t->loop_flag ) {
                    Desktop_TheoraSeekToStart( t->mov ) ;
                    t->play_start_ms = now ;
                    t->play_offset_ms = 0 ;
                    t->current_time_ms = 0 ;
                    continue ;
                } else { t->state = 0 ; return 0 ; }
            }
            t->current_time_ms += t->frame_interval_ms ;
            updated = true ;
        }
        if ( updated ) {
            desktop_theora_upload_frame( t ) ;
            t->update_counter++ ;
            t->last_update_ms = ( int )now ;
        }
        return 0 ;
    }

    auto it = g_Movies.find( GraphHandle ) ;
    if ( it == g_Movies.end() ) return -1 ;
    MovieEntry *m = it->second ;
    if ( m->state != 1 ) return 0 ;

    // 再生開始時からの経過時間 (100ns 単位)
    Uint32 now_ms = SDL_GetTicks() ;
    LONGLONG target_100ns = m->play_offset_100ns
                          + ( LONGLONG )( now_ms - m->play_start_ms ) * 10000 ;

    // loop 超過
    if ( target_100ns >= m->duration_100ns && m->duration_100ns > 0 ) {
        if ( m->loop_flag ) {
            PROPVARIANT var ;
            PropVariantInit( &var ) ;
            var.vt = VT_I8 ;
            var.hVal.QuadPart = 0 ;
            m->reader->SetCurrentPosition( GUID_NULL, var ) ;
            PropVariantClear( &var ) ;
            m->play_start_ms = now_ms ;
            m->play_offset_100ns = 0 ;
            target_100ns = 0 ;
        } else {
            m->state = 0 ;
            return 0 ;
        }
    }

    // target 時刻までフレームを読み進める
    bool updated = false ;
    while ( m->last_time_100ns < target_100ns ) {
        LONGLONG t = 0 ;
        int r = desktop_movie_read_frame( m, m->frame_argb, &t ) ;
        if ( r < 0 ) { m->state = 0 ; return -1 ; }
        if ( r == 1 ) {  // EOS
            if ( m->loop_flag ) {
                PROPVARIANT var ;
                PropVariantInit( &var ) ;
                var.vt = VT_I8 ;
                var.hVal.QuadPart = 0 ;
                m->reader->SetCurrentPosition( GUID_NULL, var ) ;
                PropVariantClear( &var ) ;
                m->play_start_ms = now_ms ;
                m->play_offset_100ns = 0 ;
                m->last_time_100ns = 0 ;
                continue ;
            } else {
                m->state = 0 ;
                return 0 ;
            }
        }
        if ( m->frame_argb.empty() ) break ;
        m->last_time_100ns = t ;
        updated = true ;
    }

    if ( updated ) {
        desktop_movie_upload_frame( m ) ;
        m->update_counter++ ;
        m->last_update_ms = ( int )now_ms ;
    }
    return 0 ;
}

extern int TellMovieToGraph( int GraphHandle )
{
    auto it = g_Movies.find( GraphHandle ) ;
    if ( it == g_Movies.end() ) return -1 ;
    return ( int )( it->second->last_time_100ns / 10000 ) ;
}

extern int SeekMovieToGraph( int GraphHandle, int Time )
{
    auto it = g_Movies.find( GraphHandle ) ;
    if ( it == g_Movies.end() ) return -1 ;
    MovieEntry *m = it->second ;
    PROPVARIANT var ;
    PropVariantInit( &var ) ;
    var.vt = VT_I8 ;
    var.hVal.QuadPart = ( LONGLONG )Time * 10000 ;  // ms → 100ns
    HRESULT hr = m->reader->SetCurrentPosition( GUID_NULL, var ) ;
    PropVariantClear( &var ) ;
    if ( FAILED( hr ) ) return -1 ;
    m->play_start_ms = SDL_GetTicks() ;
    m->play_offset_100ns = ( LONGLONG )Time * 10000 ;
    m->last_time_100ns = 0 ;
    return 0 ;
}

extern int SetMovieVolumeToGraph( int Volume, int GraphHandle )
{
    auto it = g_Movies.find( GraphHandle ) ;
    if ( it == g_Movies.end() ) return -1 ;
    it->second->volume_0_10000 = Volume ;
    return 0 ;  // 音声未実装、値保持のみ
}

extern int GetMovieVolumeToGraph( int GraphHandle )
{
    auto it = g_Movies.find( GraphHandle ) ;
    if ( it == g_Movies.end() ) return -1 ;
    return it->second->volume_0_10000 ;
}

extern int ChangeMovieVolumeToGraph( int Volume, int GraphHandle )
{
    int v10000 = ( Volume * 10000 + 127 ) / 255 ;
    return SetMovieVolumeToGraph( v10000, GraphHandle ) ;
}

extern int GetMovieVolumeToGraph2( int GraphHandle )
{
    auto it = g_Movies.find( GraphHandle ) ;
    if ( it == g_Movies.end() ) return -1 ;
    return ( it->second->volume_0_10000 * 255 + 5000 ) / 10000 ;
}

extern int GetMovieTotalFrameToGraph( int GraphHandle )
{
    auto it = g_Movies.find( GraphHandle ) ;
    if ( it == g_Movies.end() ) return -1 ;
    // TotalFrame は MF_PD_DURATION + avg frame rate から推定すべきだが暫定 0
    return 0 ;
}

extern int GetLastUpdateTimeMovieToGraph( int GraphHandle )
{
    auto it = g_Movies.find( GraphHandle ) ;
    if ( it == g_Movies.end() ) return -1 ;
    return it->second->last_update_ms ;
}

extern int GetMovieImageSize_File( const TCHAR *FileName, int *SizeX, int *SizeY )
{
    if ( !FileName ) return -1 ;
    int w = 0, h = 0 ;
    LONGLONG dur = 0 ;
    IMFSourceReader *r = desktop_movie_open_reader( ( const char * )FileName, &w, &h, &dur ) ;
    if ( !r ) return -1 ;
    if ( SizeX ) *SizeX = w ;
    if ( SizeY ) *SizeY = h ;
    r->Release() ;
    return 0 ;
}

// DeleteGraph が呼ばれた時の後始末用 (DxLib から fb hook は無いので手動)
static void desktop_movie_cleanup_for_graph( int GraphHandle )
{
    auto it = g_Movies.find( GraphHandle ) ;
    if ( it == g_Movies.end() ) return ;
    if ( it->second->reader ) it->second->reader->Release() ;
    delete it->second ;
    g_Movies.erase( it ) ;
}

#elif defined(__EMSCRIPTEN__) // -----------------------------------------
// Web の実装は DxMovieDesktopWeb.cpp (HTML5 <video>) に在る。
#elif defined(__APPLE__) // ----------------------------------------------
// Mac の実装は DxMovieDesktopMac.mm (Obj-C++ / AVFoundation) に在る。
#elif defined(__linux__) // ----------------------------------------------
// Linux の実装は DxMovieDesktopLinux.cpp (GStreamer 1.0) に在る。
#else  // その他 ---------------------------------------------------------

// その他: stub
extern int OpenMovieToGraph( const TCHAR *FileName, int FullColor ) { (void)FileName; (void)FullColor; return -1 ; }
extern int OpenMovieToGraphWithStrLen( const TCHAR *FileName, size_t FileNameLength, int FullColor ) { (void)FileName; (void)FileNameLength; (void)FullColor; return -1 ; }
extern int PlayMovieToGraph( int GraphHandle, int PlayType, int SysPlay ) { (void)GraphHandle; (void)PlayType; (void)SysPlay; return -1 ; }
extern int PauseMovieToGraph( int GraphHandle, int SysPause ) { (void)GraphHandle; (void)SysPause; return -1 ; }
extern int GetMovieStateToGraph( int GraphHandle ) { (void)GraphHandle; return -1 ; }
extern int UpdateMovieToGraph( int GraphHandle ) { (void)GraphHandle; return -1 ; }
extern int TellMovieToGraph( int GraphHandle ) { (void)GraphHandle; return -1 ; }
extern int SeekMovieToGraph( int GraphHandle, int Time ) { (void)GraphHandle; (void)Time; return -1 ; }
extern int SetMovieVolumeToGraph( int Volume, int GraphHandle ) { (void)Volume; (void)GraphHandle; return -1 ; }
extern int GetMovieVolumeToGraph( int GraphHandle ) { (void)GraphHandle; return -1 ; }
extern int ChangeMovieVolumeToGraph( int Volume, int GraphHandle ) { (void)Volume; (void)GraphHandle; return -1 ; }
extern int GetMovieVolumeToGraph2( int GraphHandle ) { (void)GraphHandle; return -1 ; }
extern int GetMovieTotalFrameToGraph( int GraphHandle ) { (void)GraphHandle; return -1 ; }
extern int GetLastUpdateTimeMovieToGraph( int GraphHandle ) { (void)GraphHandle; return -1 ; }
extern int GetMovieImageSize_File( const TCHAR *FileName, int *SizeX, int *SizeY ) { (void)FileName; (void)SizeX; (void)SizeY; return -1 ; }

#endif // _WIN32

#ifndef DX_NON_NAMESPACE
} // end namespace DxLib
#endif
