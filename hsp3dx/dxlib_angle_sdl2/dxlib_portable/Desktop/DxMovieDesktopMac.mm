//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop Mac 用 ムービー 実装 (AVFoundation)
//
//      Obj-C++ (.mm) で AVAssetReader + AVAssetReaderTrackOutput を使い
//      MP4/MOV を video-only で decode して DxLib の Graph に転送する。
//      DxMovieDesktop.cpp は __APPLE__ の時は空スタブに切り替えるので、
//      このファイルが OpenMovieToGraph / PlayMovieToGraph 等の実体を提供。
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#ifdef __APPLE__

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreVideo/CoreVideo.h>

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

struct MacMovieEntry {
    AVAsset                   *asset        = nil ;
    AVAssetReader             *reader       = nil ;
    AVAssetReaderTrackOutput  *track_output = nil ;
    //  音声トラック (optional、動画に含まれていなければ nil のまま)
    AVAssetReaderTrackOutput  *audio_output = nil ;
    int                        audio_sample_rate   = 48000 ;
    int                        audio_channels      = 2 ;     // 常に stereo へ変換
    bool                       audio_eof          = false ;
    int                        graph_handle = -1 ;
    int                        width        = 0 ;
    int                        height       = 0 ;
    int64_t                    duration_ms  = 0 ;
    int64_t                    last_time_ms = 0 ;
    int                        state        = 0 ;  // 0=stopped, 1=playing, 2=paused
    Uint32                     play_start_ms       = 0 ;
    int64_t                    play_offset_ms      = 0 ;
    int                        volume_0_10000 = 10000 ;
    int                        loop_flag    = 0 ;
    int                        last_update_ms = 0 ;
    std::vector<unsigned char> frame_argb ;
    // Seek / Loop 用: AVAssetReader は forward-only、reader を閉じて再作成する
    // 必要があるので元のファイルパスを保持する。
    std::string                file_path ;
} ;

static std::unordered_map<int, MacMovieEntry *> g_MacMovies ;

//  共有 SDL audio device (全 movie で共通)。最初に open_reader が呼ばれた時に open、
//  任意の movie を再生する時に必要なら unpause。PCM s16le stereo 48kHz で統一。
static SDL_AudioDeviceID g_MacAudioDev = 0 ;
static bool              g_MacAudioPaused = true ;

static void mac_audio_ensure( void )
{
    if ( g_MacAudioDev != 0 ) return ;
    SDL_AudioSpec want ;
    std::memset( &want, 0, sizeof( want ) ) ;
    want.freq     = 48000 ;
    want.format   = AUDIO_S16SYS ;
    want.channels = 2 ;
    want.samples  = 2048 ;
    want.callback = nullptr ;  // queue-based
    SDL_AudioSpec have ;
    g_MacAudioDev = SDL_OpenAudioDevice( nullptr, 0, &want, &have, 0 ) ;
    if ( g_MacAudioDev == 0 ) {
        std::fprintf( stderr, "[DxMovieMac] SDL_OpenAudioDevice failed: %s\n", SDL_GetError() ) ;
    }
}
static void mac_audio_play( void )
{
    if ( g_MacAudioDev != 0 && g_MacAudioPaused ) {
        SDL_PauseAudioDevice( g_MacAudioDev, 0 ) ;
        g_MacAudioPaused = false ;
    }
}
static void mac_audio_clear_queue( void )
{
    if ( g_MacAudioDev != 0 ) SDL_ClearQueuedAudio( g_MacAudioDev ) ;
}
//  PCM int16 stereo LE を音量 0..10000 で掛け算して SDL queue に積む
static void mac_audio_queue_pcm( const int16_t *samples, size_t sampleCount, int volume_0_10000 )
{
    if ( g_MacAudioDev == 0 || samples == nullptr || sampleCount == 0 ) return ;
    //  音量 10000 以外は local buffer に複写 + スケール。10000 なら直接 queue。
    if ( volume_0_10000 >= 10000 ) {
        SDL_QueueAudio( g_MacAudioDev, samples, ( Uint32 )( sampleCount * sizeof( int16_t ) ) ) ;
        return ;
    }
    std::vector<int16_t> scaled( sampleCount ) ;
    int v = volume_0_10000 < 0 ? 0 : volume_0_10000 ;
    for ( size_t i = 0 ; i < sampleCount ; ++i ) {
        int s = ( int )samples[ i ] * v / 10000 ;
        if ( s < -32768 ) s = -32768 ;
        if ( s >  32767 ) s =  32767 ;
        scaled[ i ] = ( int16_t )s ;
    }
    SDL_QueueAudio( g_MacAudioDev, scaled.data(), ( Uint32 )( scaled.size() * sizeof( int16_t ) ) ) ;
}

static MacMovieEntry *mac_open_reader( const char *utf8_path )
{
    @autoreleasepool {
        NSString *nspath = [NSString stringWithUTF8String:utf8_path] ;
        if ( !nspath ) return nullptr ;
        NSURL *url = [NSURL fileURLWithPath:nspath] ;
        AVAsset *asset = [AVURLAsset URLAssetWithURL:url options:nil] ;
        if ( !asset ) return nullptr ;

        NSArray<AVAssetTrack *> *videoTracks = [asset tracksWithMediaType:AVMediaTypeVideo] ;
        if ( videoTracks.count == 0 ) {
            std::fprintf( stderr, "[DxMovieMac] no video track in %s\n", utf8_path ) ;
            return nullptr ;
        }
        AVAssetTrack *vt = videoTracks.firstObject ;
        CGSize sz = vt.naturalSize ;

        NSError *err = nil ;
        AVAssetReader *reader = [AVAssetReader assetReaderWithAsset:asset error:&err] ;
        if ( !reader ) {
            std::fprintf( stderr, "[DxMovieMac] AVAssetReader init fail: %s\n",
                          err ? err.localizedDescription.UTF8String : "nil" ) ;
            return nullptr ;
        }

        // BGRA 出力設定 (DxLib ARGB8 = BGRA バイト順 と一致)
        NSDictionary *settings = @{
            (NSString *)kCVPixelBufferPixelFormatTypeKey : @( kCVPixelFormatType_32BGRA )
        } ;
        AVAssetReaderTrackOutput *trackOut =
            [[AVAssetReaderTrackOutput alloc] initWithTrack:vt outputSettings:settings] ;
        if ( ![reader canAddOutput:trackOut] ) {
            std::fprintf( stderr, "[DxMovieMac] canAddOutput=NO\n" ) ;
            return nullptr ;
        }
        [reader addOutput:trackOut] ;

        //  音声トラック (あれば追加、PCM int16 stereo LE 48kHz で展開)
        AVAssetReaderTrackOutput *audioOut = nil ;
        NSArray<AVAssetTrack *> *audioTracks = [asset tracksWithMediaType:AVMediaTypeAudio] ;
        if ( audioTracks.count > 0 ) {
            AVAssetTrack *at = audioTracks.firstObject ;
            NSDictionary *asettings = @{
                AVFormatIDKey          : @( kAudioFormatLinearPCM ),
                AVSampleRateKey        : @( 48000.0 ),
                AVNumberOfChannelsKey  : @( 2 ),
                AVLinearPCMBitDepthKey : @( 16 ),
                AVLinearPCMIsFloatKey  : @( NO ),
                AVLinearPCMIsBigEndianKey   : @( NO ),
                AVLinearPCMIsNonInterleaved : @( NO )
            } ;
            audioOut = [[AVAssetReaderTrackOutput alloc] initWithTrack:at outputSettings:asettings] ;
            if ( [reader canAddOutput:audioOut] ) {
                [reader addOutput:audioOut] ;
            } else {
                std::fprintf( stderr, "[DxMovieMac] audio canAddOutput=NO (動画のみで再生)\n" ) ;
                [audioOut release] ;
                audioOut = nil ;
            }
        }

        if ( ![reader startReading] ) {
            std::fprintf( stderr, "[DxMovieMac] startReading fail: %s\n",
                          reader.error ? reader.error.localizedDescription.UTF8String : "nil" ) ;
            return nullptr ;
        }

        MacMovieEntry *m = new MacMovieEntry() ;
        m->asset         = [asset retain] ;
        m->reader        = [reader retain] ;
        m->track_output  = [trackOut retain] ;
        m->audio_output  = audioOut ? [audioOut retain] : nil ;
        m->width         = ( int )sz.width ;
        m->height        = ( int )sz.height ;
        m->duration_ms   = ( int64_t )( CMTimeGetSeconds( asset.duration ) * 1000.0 ) ;

        //  audio device を確保 (初回のみ)
        if ( m->audio_output ) mac_audio_ensure() ;
        return m ;
    }
}

static void mac_close_reader( MacMovieEntry *m )
{
    if ( !m ) return ;
    [m->track_output release] ;
    if ( m->audio_output ) [m->audio_output release] ;
    [m->reader cancelReading] ;
    [m->reader release] ;
    [m->asset release] ;
    m->track_output = nil ;
    m->audio_output = nil ;
    m->reader = nil ;
    m->asset = nil ;
    m->audio_eof = false ;
}

// reader を閉じて file_path から新しい reader を作成する (seek/loop 用)。
// 失敗したら false。
static bool mac_rebuild_reader( MacMovieEntry *m )
{
    if ( !m || m->file_path.empty() ) return false ;
    mac_close_reader( m ) ;
    @autoreleasepool {
        NSString *nspath = [NSString stringWithUTF8String:m->file_path.c_str()] ;
        if ( !nspath ) return false ;
        NSURL *url = [NSURL fileURLWithPath:nspath] ;
        AVAsset *asset = [AVURLAsset URLAssetWithURL:url options:nil] ;
        if ( !asset ) return false ;
        NSArray<AVAssetTrack *> *videoTracks = [asset tracksWithMediaType:AVMediaTypeVideo] ;
        if ( videoTracks.count == 0 ) return false ;
        AVAssetTrack *vt = videoTracks.firstObject ;
        NSError *err = nil ;
        AVAssetReader *reader = [AVAssetReader assetReaderWithAsset:asset error:&err] ;
        if ( !reader ) return false ;
        NSDictionary *settings = @{
            (NSString *)kCVPixelBufferPixelFormatTypeKey : @( kCVPixelFormatType_32BGRA )
        } ;
        AVAssetReaderTrackOutput *trackOut =
            [[AVAssetReaderTrackOutput alloc] initWithTrack:vt outputSettings:settings] ;
        if ( ![reader canAddOutput:trackOut] ) return false ;
        [reader addOutput:trackOut] ;

        //  audio track も再度追加 (loop/seek 時も音声が続くように)
        AVAssetReaderTrackOutput *audioOut = nil ;
        NSArray<AVAssetTrack *> *audioTracks = [asset tracksWithMediaType:AVMediaTypeAudio] ;
        if ( audioTracks.count > 0 ) {
            AVAssetTrack *at = audioTracks.firstObject ;
            NSDictionary *asettings = @{
                AVFormatIDKey          : @( kAudioFormatLinearPCM ),
                AVSampleRateKey        : @( 48000.0 ),
                AVNumberOfChannelsKey  : @( 2 ),
                AVLinearPCMBitDepthKey : @( 16 ),
                AVLinearPCMIsFloatKey  : @( NO ),
                AVLinearPCMIsBigEndianKey   : @( NO ),
                AVLinearPCMIsNonInterleaved : @( NO )
            } ;
            audioOut = [[AVAssetReaderTrackOutput alloc] initWithTrack:at outputSettings:asettings] ;
            if ( [reader canAddOutput:audioOut] ) {
                [reader addOutput:audioOut] ;
            } else {
                [audioOut release] ;
                audioOut = nil ;
            }
        }

        if ( ![reader startReading] ) return false ;
        m->asset        = [asset retain] ;
        m->reader       = [reader retain] ;
        m->track_output = [trackOut retain] ;
        m->audio_output = audioOut ? [audioOut retain] : nil ;
        m->audio_eof    = false ;
        return true ;
    }
}

// 次フレーム取得 (BGRA を buf に入れる、eof なら 1)
static int mac_read_frame( MacMovieEntry *m, std::vector<unsigned char> &buf, int64_t *out_time_ms )
{
    if ( !m->track_output ) return -1 ;
    CMSampleBufferRef sample = [m->track_output copyNextSampleBuffer] ;
    if ( !sample ) {
        // ストリーム終端または未読
        if ( m->reader.status == AVAssetReaderStatusCompleted ) return 1 ;
        return -1 ;
    }
    CVImageBufferRef img = CMSampleBufferGetImageBuffer( sample ) ;
    if ( !img ) { CFRelease( sample ) ; return -1 ; }

    CVPixelBufferLockBaseAddress( img, kCVPixelBufferLock_ReadOnly ) ;
    size_t w  = CVPixelBufferGetWidth( img ) ;
    size_t h  = CVPixelBufferGetHeight( img ) ;
    size_t pitch = CVPixelBufferGetBytesPerRow( img ) ;
    uint8_t *base = ( uint8_t * )CVPixelBufferGetBaseAddress( img ) ;

    int row_bytes = ( int )w * 4 ;
    buf.resize( h * row_bytes ) ;
    for ( size_t y = 0 ; y < h ; ++y ) {
        std::memcpy( buf.data() + y * row_bytes, base + y * pitch, row_bytes ) ;
    }
    CMTime pts = CMSampleBufferGetPresentationTimeStamp( sample ) ;
    *out_time_ms = ( int64_t )( CMTimeGetSeconds( pts ) * 1000.0 ) ;

    CVPixelBufferUnlockBaseAddress( img, kCVPixelBufferLock_ReadOnly ) ;
    CFRelease( sample ) ;
    return 0 ;
}

//  audio サンプル 1 つ取り出して SDL audio device に queue。EOS なら audio_eof = true
//  戻り値: 1 = queue できた、0 = 何も読まなかった (既に EOS or track なし)、負値 = error
static int mac_pump_audio_once( MacMovieEntry *m )
{
    if ( !m || !m->audio_output || m->audio_eof ) return 0 ;
    CMSampleBufferRef sample = [m->audio_output copyNextSampleBuffer] ;
    if ( !sample ) {
        //  reader の状態で EOS 判定
        if ( m->reader && m->reader.status == AVAssetReaderStatusCompleted ) {
            m->audio_eof = true ;
        }
        return 0 ;
    }
    CMBlockBufferRef block = CMSampleBufferGetDataBuffer( sample ) ;
    if ( !block ) { CFRelease( sample ) ; return 0 ; }

    size_t totalSize = 0 ;
    char  *dataPtr   = nullptr ;
    OSStatus s = CMBlockBufferGetDataPointer( block, 0, nullptr, &totalSize, &dataPtr ) ;
    if ( s != kCMBlockBufferNoErr || !dataPtr || totalSize == 0 ) {
        CFRelease( sample ) ; return 0 ;
    }
    //  int16 stereo LE を直接 SDL に queue。音量はここで適用
    size_t nSamples = totalSize / sizeof( int16_t ) ;
    mac_audio_queue_pcm( ( const int16_t * )dataPtr, nSamples, m->volume_0_10000 ) ;
    CFRelease( sample ) ;
    return 1 ;
}

//  SDL queue の蓄積量 (ms) を返す。backpressure 判定用
static int mac_audio_queued_ms( MacMovieEntry *m )
{
    if ( g_MacAudioDev == 0 ) return 0 ;
    Uint32 bytes = SDL_GetQueuedAudioSize( g_MacAudioDev ) ;
    //  48000Hz * 2ch * 2bytes = 192000 B/sec
    return ( int )( bytes / 192 ) ;  //  ms
}

static void mac_upload_frame( MacMovieEntry *m )
{
    BASEIMAGE bi ;
    std::memset( &bi, 0, sizeof( bi ) ) ;
    NS_CreateARGB8ColorData( &bi.ColorData ) ;
    bi.Width  = m->width ;
    bi.Height = m->height ;
    bi.Pitch  = m->width * 4 ;
    bi.GraphData = m->frame_argb.data() ;
    bi.MipMapCount = 0 ;
    bi.GraphDataCount = 0 ;
    NS_ReCreateGraphFromBaseImage( &bi, m->graph_handle ) ;
}

// --- DxLib Movie API 実装 (Mac backend) ---

extern int OpenMovieToGraph( const TCHAR *FileName, int FullColor )
{
    (void)FullColor;
    if ( !FileName ) return -1 ;
    const char *path = ( const char * )FileName ;
    MacMovieEntry *m = mac_open_reader( path ) ;
    if ( !m ) return -1 ;

    int gh = NS_MakeGraph( m->width, m->height, TRUE ) ;
    if ( gh < 0 ) { mac_close_reader( m ) ; delete m ; return -1 ; }
    m->graph_handle = gh ;
    m->file_path    = path ;  // seek / loop 用に保持
    g_MacMovies[ gh ] = m ;

    // 先読み
    int64_t t = 0 ;
    if ( mac_read_frame( m, m->frame_argb, &t ) == 0 && !m->frame_argb.empty() ) {
        m->last_time_ms = t ;
        mac_upload_frame( m ) ;
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
    auto it = g_MacMovies.find( GraphHandle ) ;
    if ( it == g_MacMovies.end() ) return -1 ;
    MacMovieEntry *m = it->second ;
    m->loop_flag = ( PlayType & DX_PLAYTYPE_LOOPBIT ) ? 1 : 0 ;
    m->state = 1 ;
    m->play_start_ms = SDL_GetTicks() ;
    //  audio 先行バッファ (~200ms) を積んでから再生開始、queue が尽きないようにする
    if ( m->audio_output && !m->audio_eof ) {
        while ( mac_audio_queued_ms( m ) < 200 && mac_pump_audio_once( m ) ) { /* pump */ }
        mac_audio_play() ;
    }
    return 0 ;
}

extern int PauseMovieToGraph( int GraphHandle, int SysPause )
{
    (void)SysPause;
    auto it = g_MacMovies.find( GraphHandle ) ;
    if ( it == g_MacMovies.end() ) return -1 ;
    MacMovieEntry *m = it->second ;
    if ( m->state == 1 ) {
        m->play_offset_ms += ( SDL_GetTicks() - m->play_start_ms ) ;
        m->state = 2 ;
        //  audio queue を残したまま SDL デバイスは動かしっぱなし (一時停止は queue 自体で
        //  再生位置が止まる訳ではない)。完全一時停止なら SDL_PauseAudioDevice 1 だが、
        //  resume 時の再同期が面倒なので queue 自体を cleanse + refill する。
        mac_audio_clear_queue() ;
    }
    return 0 ;
}

extern int GetMovieStateToGraph( int GraphHandle )
{
    auto it = g_MacMovies.find( GraphHandle ) ;
    if ( it == g_MacMovies.end() ) return -1 ;
    return it->second->state == 1 ? 1 : 0 ;
}

extern int UpdateMovieToGraph( int GraphHandle )
{
    auto it = g_MacMovies.find( GraphHandle ) ;
    if ( it == g_MacMovies.end() ) return -1 ;
    MacMovieEntry *m = it->second ;
    if ( m->state != 1 ) return 0 ;

    int64_t target_ms = m->play_offset_ms + ( SDL_GetTicks() - m->play_start_ms ) ;
    if ( m->duration_ms > 0 && target_ms >= m->duration_ms ) {
        if ( m->loop_flag ) {
            if ( !mac_rebuild_reader( m ) ) { m->state = 0 ; return -1 ; }
            m->play_start_ms = SDL_GetTicks() ;
            m->play_offset_ms = 0 ;
            m->last_time_ms = 0 ;
            target_ms = 0 ;
            //  loop 時は audio queue をクリアして先頭から積み直す
            mac_audio_clear_queue() ;
        } else {
            m->state = 0 ;
            return 0 ;
        }
    }

    //  audio: queue が 500ms 以下になるまで先読みで補充
    if ( m->audio_output && !m->audio_eof ) {
        while ( mac_audio_queued_ms( m ) < 500 && mac_pump_audio_once( m ) ) { /* pump */ }
    }

    bool updated = false ;
    while ( m->last_time_ms < target_ms ) {
        int64_t t = 0 ;
        int r = mac_read_frame( m, m->frame_argb, &t ) ;
        if ( r < 0 ) { m->state = 0 ; return -1 ; }
        if ( r == 1 ) {  // EOS
            if ( m->loop_flag ) {
                if ( !mac_rebuild_reader( m ) ) { m->state = 0 ; return -1 ; }
                m->play_start_ms = SDL_GetTicks() ;
                m->play_offset_ms = 0 ;
                m->last_time_ms = 0 ;
                target_ms = 0 ;
                continue ;
            }
            m->state = 0 ;
            return 0 ;
        }
        if ( m->frame_argb.empty() ) break ;
        m->last_time_ms = t ;
        updated = true ;
    }
    if ( updated ) {
        mac_upload_frame( m ) ;
        m->last_update_ms = ( int )SDL_GetTicks() ;
    }
    return 0 ;
}

extern int TellMovieToGraph( int GraphHandle )
{
    auto it = g_MacMovies.find( GraphHandle ) ;
    if ( it == g_MacMovies.end() ) return -1 ;
    return ( int )it->second->last_time_ms ;
}

extern int SeekMovieToGraph( int GraphHandle, int Time )
{
    auto it = g_MacMovies.find( GraphHandle ) ;
    if ( it == g_MacMovies.end() ) return -1 ;
    MacMovieEntry *m = it->second ;
    // AVAssetReader は forward-only なので reader を作り直して、
    // 指定時刻 (ミリ秒) まで空読みで進める。
    if ( !mac_rebuild_reader( m ) ) return -1 ;
    m->play_start_ms  = SDL_GetTicks() ;
    m->play_offset_ms = Time ;
    m->last_time_ms   = 0 ;
    //  audio queue もクリア (古い sample が残ったまま先に進まないように)
    mac_audio_clear_queue() ;

    // Time まで空読み (逐次 decode)。audio も同様に捨てる
    int64_t t = 0 ;
    while ( m->last_time_ms < Time ) {
        int r = mac_read_frame( m, m->frame_argb, &t ) ;
        if ( r == 1 ) break ;   // EOS
        if ( r < 0  ) return -1 ;
        if ( m->frame_argb.empty() ) break ;
        m->last_time_ms = t ;
        //  seek 中の audio は捨てる (queue に積まずに読み進めるだけ)
        if ( m->audio_output && !m->audio_eof ) {
            CMSampleBufferRef s = [m->audio_output copyNextSampleBuffer] ;
            if ( s ) CFRelease( s ) ;
        }
    }
    // シーク後の最新フレームを graph に反映
    if ( !m->frame_argb.empty() ) {
        mac_upload_frame( m ) ;
        m->last_update_ms = ( int )SDL_GetTicks() ;
    }
    return 0 ;
}

extern int SetMovieVolumeToGraph( int Volume, int GraphHandle )
{
    auto it = g_MacMovies.find( GraphHandle ) ;
    if ( it == g_MacMovies.end() ) return -1 ;
    it->second->volume_0_10000 = Volume ;
    return 0 ;
}

extern int GetMovieVolumeToGraph( int GraphHandle )
{
    auto it = g_MacMovies.find( GraphHandle ) ;
    if ( it == g_MacMovies.end() ) return -1 ;
    return it->second->volume_0_10000 ;
}

extern int ChangeMovieVolumeToGraph( int Volume, int GraphHandle )
{
    int v10000 = ( Volume * 10000 + 127 ) / 255 ;
    return SetMovieVolumeToGraph( v10000, GraphHandle ) ;
}

extern int GetMovieVolumeToGraph2( int GraphHandle )
{
    auto it = g_MacMovies.find( GraphHandle ) ;
    if ( it == g_MacMovies.end() ) return -1 ;
    return ( it->second->volume_0_10000 * 255 + 5000 ) / 10000 ;
}

extern int GetMovieTotalFrameToGraph( int GraphHandle )
{
    (void)GraphHandle;
    return 0 ;  // AVFoundation から総フレーム数は直接取れない (avg frame rate 要)
}

extern int GetLastUpdateTimeMovieToGraph( int GraphHandle )
{
    auto it = g_MacMovies.find( GraphHandle ) ;
    if ( it == g_MacMovies.end() ) return -1 ;
    return it->second->last_update_ms ;
}

extern int GetMovieImageSize_File( const TCHAR *FileName, int *SizeX, int *SizeY )
{
    if ( !FileName ) return -1 ;
    MacMovieEntry *m = mac_open_reader( ( const char * )FileName ) ;
    if ( !m ) return -1 ;
    if ( SizeX ) *SizeX = m->width ;
    if ( SizeY ) *SizeY = m->height ;
    mac_close_reader( m ) ;
    delete m ;
    return 0 ;
}

#ifndef DX_NON_NAMESPACE
} // end namespace DxLib
#endif

#endif // __APPLE__
