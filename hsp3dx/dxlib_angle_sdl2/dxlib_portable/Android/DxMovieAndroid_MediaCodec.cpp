//-----------------------------------------------------------------------------
//
//      ＤＸライブラリ     Android 用 ムービー実装 (MediaCodec NDK 版、2026-04-23 追加)
//
//      DxLib 3.24f の本家 DxMovieAndroid.cpp は PF 関数が全部 return 0 / -1 の
//      stub のため Android では MP4 等が再生できない。このファイルは NDK の
//      AMediaExtractor + AMediaCodec (API 21+) を使って video+audio の基本
//      再生を提供する**リファレンス実装**。
//
//      有効化方法 (将来):
//      1. DxLib Android を from-source でビルドする場合、DxMovieAndroid.cpp の
//         代わりにこのファイルをコンパイル対象に。
//      2. DxLibEnableLive2D_Android_3_24f.zip の prebuilt libDxLib.a 利用時は
//         archive から DxMovieAndroid.o を `ar d` で削除し、このファイルの .o を
//         app 側でリンク (ndk CMakeLists.txt で hsp3dx ソースに追加)。
//      3. Android.mk / CMakeLists.txt に -lmediandk -lOpenSLES 追加必須。
//
//      設計:
//      - AMediaExtractor で MP4 demux、MIME で video/audio track を判別
//      - AMediaCodec で video decode → AImageReader → NV12/BGRA 変換
//        (API 24+ なら AMediaCodec_getOutputBuffer の output format の
//         COLOR_FormatSurface を使って GL surface に直接書ける)
//      - audio は AMediaCodec decode → OpenSL ES 経由 or AAudio で再生
//
//      現時点では Android build に組み込まれていない (= 現状 Android Movie は
//      動かないまま)。コードは将来作業の足場として用意。
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#include "../DxCompileConfig.h"

#if defined(__ANDROID__) && !defined(DX_NON_MOVIE)

#include <media/NdkMediaExtractor.h>
#include <media/NdkMediaCodec.h>
#include <media/NdkMediaFormat.h>
#include <android/log.h>
#include <unistd.h>

#include "../DxLib.h"
#include "../DxMovie.h"
#include "../DxBaseImage.h"

#include <string>
#include <vector>
#include <unordered_map>
#include <cstring>

#define ALOG_TAG "DxMovieAndroid"
#define ALOGI(...) __android_log_print(ANDROID_LOG_INFO,  ALOG_TAG, __VA_ARGS__)
#define ALOGE(...) __android_log_print(ANDROID_LOG_ERROR, ALOG_TAG, __VA_ARGS__)

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

struct AndroidMoviePlayer {
    AMediaExtractor          *extractor        = nullptr ;
    AMediaCodec              *videoCodec       = nullptr ;
    AMediaCodec              *audioCodec       = nullptr ;
    int                       videoTrack       = -1 ;
    int                       audioTrack       = -1 ;
    int                       width            = 0 ;
    int                       height           = 0 ;
    int                       color_format     = 0 ;  // OMX color format
    int64_t                   duration_ms      = 0 ;
    int64_t                   start_monotonic_ms = 0 ;
    int64_t                   last_pts_ms      = 0 ;
    int                       volume_0_10000   = 10000 ;
    int                       state            = 0 ;  // 0=stopped 1=playing 2=paused
    int                       loop_flag        = 0 ;
    bool                      saw_input_eof    = false ;
    bool                      saw_output_eof   = false ;
    std::vector<unsigned char> frame_argb ;
    std::string               path ;
} ;

static std::unordered_map<MOVIEGRAPH*, AndroidMoviePlayer*> g_AndroidPlayers ;

static AndroidMoviePlayer *android_get_player( MOVIEGRAPH *Movie )
{
    auto it = g_AndroidPlayers.find( Movie ) ;
    return it != g_AndroidPlayers.end() ? it->second : nullptr ;
}

//  現在のモノトニッククロック (ms)
static int64_t android_now_ms( void )
{
    struct timespec ts ;
    clock_gettime( CLOCK_MONOTONIC, &ts ) ;
    return ( int64_t )ts.tv_sec * 1000 + ts.tv_nsec / 1000000 ;
}

//  NV12 (Y plane + interleaved UV plane) を BGRA に変換。
//  AMediaCodec が返す色空間は端末/MIME で可変、代表ケースの NV12 のみ対応。
static void nv12_to_bgra( const uint8_t *y, const uint8_t *uv, int w, int h,
                          int y_stride, int uv_stride, uint8_t *dst )
{
    for ( int j = 0 ; j < h ; ++j ) {
        const uint8_t *yrow = y + j * y_stride ;
        const uint8_t *uvrow = uv + ( j / 2 ) * uv_stride ;
        uint8_t *drow = dst + j * w * 4 ;
        for ( int i = 0 ; i < w ; ++i ) {
            int Y = yrow[ i ] ;
            int U = uvrow[ ( i / 2 ) * 2 ] - 128 ;
            int V = uvrow[ ( i / 2 ) * 2 + 1 ] - 128 ;
            int R = Y + ( 91881 * V ) / 65536 ;
            int G = Y - ( 22554 * U + 46802 * V ) / 65536 ;
            int B = Y + ( 116130 * U ) / 65536 ;
            if ( R < 0 ) R = 0 ; if ( R > 255 ) R = 255 ;
            if ( G < 0 ) G = 0 ; if ( G > 255 ) G = 255 ;
            if ( B < 0 ) B = 0 ; if ( B > 255 ) B = 255 ;
            drow[ 0 ] = ( uint8_t )B ;
            drow[ 1 ] = ( uint8_t )G ;
            drow[ 2 ] = ( uint8_t )R ;
            drow[ 3 ] = 255 ;
            drow += 4 ;
        }
    }
}

extern int InitializeMovieManage_PF( void ) { return 0 ; }
extern int TerminateMovieManage_PF( void )
{
    for ( auto &kv : g_AndroidPlayers ) {
        if ( kv.second ) {
            if ( kv.second->videoCodec ) AMediaCodec_delete( kv.second->videoCodec ) ;
            if ( kv.second->audioCodec ) AMediaCodec_delete( kv.second->audioCodec ) ;
            if ( kv.second->extractor )  AMediaExtractor_delete( kv.second->extractor ) ;
            delete kv.second ;
        }
    }
    g_AndroidPlayers.clear() ;
    return 0 ;
}

extern int OpenMovie_UseGParam_PF( MOVIEGRAPH *Movie, OPENMOVIE_GPARAM * /*GParam*/,
                                   const wchar_t *FileName, int *Width, int *Height,
                                   int /*SurfaceMode*/, int ImageSizeGetOnly, int /*ASyncThread*/ )
{
    if ( !Movie || !FileName ) return -1 ;
    //  wchar_t → UTF-8 (Android wchar_t は UTF-32)
    std::string path ;
    for ( const wchar_t *s = FileName ; *s ; ++s ) {
        unsigned int c = ( unsigned int )*s ;
        if ( c < 0x80 ) { path += ( char )c ; }
        else if ( c < 0x800 ) {
            path += ( char )( 0xC0 | ( c >> 6 ) ) ;
            path += ( char )( 0x80 | ( c & 0x3F ) ) ;
        } else if ( c < 0x10000 ) {
            path += ( char )( 0xE0 | ( c >> 12 ) ) ;
            path += ( char )( 0x80 | ( ( c >> 6 ) & 0x3F ) ) ;
            path += ( char )( 0x80 | ( c & 0x3F ) ) ;
        } else {
            path += ( char )( 0xF0 | ( c >> 18 ) ) ;
            path += ( char )( 0x80 | ( ( c >> 12 ) & 0x3F ) ) ;
            path += ( char )( 0x80 | ( ( c >> 6 ) & 0x3F ) ) ;
            path += ( char )( 0x80 | ( c & 0x3F ) ) ;
        }
    }

    AMediaExtractor *ex = AMediaExtractor_new() ;
    if ( AMediaExtractor_setDataSource( ex, path.c_str() ) != AMEDIA_OK ) {
        ALOGE( "setDataSource failed: %s", path.c_str() ) ;
        AMediaExtractor_delete( ex ) ;
        return -1 ;
    }

    //  video/audio track を検出
    int ntracks = AMediaExtractor_getTrackCount( ex ) ;
    int vtrack = -1, atrack = -1 ;
    int vw = 0, vh = 0 ;
    int64_t dur_us = 0 ;
    for ( int i = 0 ; i < ntracks ; ++i ) {
        AMediaFormat *fmt = AMediaExtractor_getTrackFormat( ex, i ) ;
        const char *mime = nullptr ;
        AMediaFormat_getString( fmt, AMEDIAFORMAT_KEY_MIME, &mime ) ;
        int64_t d = 0 ;
        if ( AMediaFormat_getInt64( fmt, AMEDIAFORMAT_KEY_DURATION, &d ) && d > dur_us ) dur_us = d ;
        if ( mime ) {
            if ( strncmp( mime, "video/", 6 ) == 0 && vtrack < 0 ) {
                vtrack = i ;
                AMediaFormat_getInt32( fmt, AMEDIAFORMAT_KEY_WIDTH,  &vw ) ;
                AMediaFormat_getInt32( fmt, AMEDIAFORMAT_KEY_HEIGHT, &vh ) ;
            } else if ( strncmp( mime, "audio/", 6 ) == 0 && atrack < 0 ) {
                atrack = i ;
            }
        }
        AMediaFormat_delete( fmt ) ;
    }
    if ( vtrack < 0 ) { AMediaExtractor_delete( ex ) ; return -1 ; }
    if ( Width )  *Width  = vw ;
    if ( Height ) *Height = vh ;
    if ( ImageSizeGetOnly ) { AMediaExtractor_delete( ex ) ; return 0 ; }

    //  video codec 起動
    AMediaExtractor_selectTrack( ex, vtrack ) ;
    AMediaFormat *vfmt = AMediaExtractor_getTrackFormat( ex, vtrack ) ;
    const char *vmime = nullptr ;
    AMediaFormat_getString( vfmt, AMEDIAFORMAT_KEY_MIME, &vmime ) ;
    AMediaCodec *vcodec = AMediaCodec_createDecoderByType( vmime ? vmime : "video/avc" ) ;
    if ( !vcodec ) { AMediaFormat_delete( vfmt ) ; AMediaExtractor_delete( ex ) ; return -1 ; }
    AMediaCodec_configure( vcodec, vfmt, nullptr, nullptr, 0 ) ;
    AMediaCodec_start( vcodec ) ;
    AMediaFormat_delete( vfmt ) ;

    //  audio codec 起動 (optional)
    AMediaCodec *acodec = nullptr ;
    if ( atrack >= 0 ) {
        AMediaExtractor_selectTrack( ex, atrack ) ;
        AMediaFormat *afmt = AMediaExtractor_getTrackFormat( ex, atrack ) ;
        const char *amime = nullptr ;
        AMediaFormat_getString( afmt, AMEDIAFORMAT_KEY_MIME, &amime ) ;
        acodec = AMediaCodec_createDecoderByType( amime ? amime : "audio/mp4a-latm" ) ;
        if ( acodec ) {
            AMediaCodec_configure( acodec, afmt, nullptr, nullptr, 0 ) ;
            AMediaCodec_start( acodec ) ;
        }
        AMediaFormat_delete( afmt ) ;
    }

    AndroidMoviePlayer *p = new AndroidMoviePlayer() ;
    p->extractor    = ex ;
    p->videoCodec   = vcodec ;
    p->audioCodec   = acodec ;
    p->videoTrack   = vtrack ;
    p->audioTrack   = atrack ;
    p->width        = vw ;
    p->height       = vh ;
    p->duration_ms  = dur_us / 1000 ;
    p->path         = path ;
    g_AndroidPlayers[ Movie ] = p ;
    Movie->Width  = vw ;
    Movie->Height = vh ;
    return 0 ;
}

extern int OpenMovie_CustomGraphHandleGParam_PF( MOVIEGRAPH *, struct SETUP_GRAPHHANDLE_GPARAM * ) { return 0 ; }

extern int TerminateMovieHandle_PF( HANDLEINFO *HandleInfo )
{
    MOVIEGRAPH *Movie = ( MOVIEGRAPH * )HandleInfo ;
    auto it = g_AndroidPlayers.find( Movie ) ;
    if ( it == g_AndroidPlayers.end() ) return 0 ;
    AndroidMoviePlayer *p = it->second ;
    if ( p ) {
        if ( p->videoCodec ) { AMediaCodec_stop( p->videoCodec ) ; AMediaCodec_delete( p->videoCodec ) ; }
        if ( p->audioCodec ) { AMediaCodec_stop( p->audioCodec ) ; AMediaCodec_delete( p->audioCodec ) ; }
        if ( p->extractor )  AMediaExtractor_delete( p->extractor ) ;
        delete p ;
    }
    g_AndroidPlayers.erase( it ) ;
    return 0 ;
}

extern int PlayMovie__PF( MOVIEGRAPH *Movie, int PlayType, int /*SysPlay*/ )
{
    AndroidMoviePlayer *p = android_get_player( Movie ) ;
    if ( !p ) return -1 ;
    p->loop_flag = ( PlayType & DX_PLAYTYPE_LOOPBIT ) ? 1 : 0 ;
    p->state = 1 ;
    p->start_monotonic_ms = android_now_ms() - p->last_pts_ms ;
    Movie->PlayFlag = 1 ;
    return 0 ;
}

extern int PauseMovie_PF( MOVIEGRAPH *Movie, int /*SysPause*/ )
{
    AndroidMoviePlayer *p = android_get_player( Movie ) ;
    if ( !p ) return -1 ;
    p->state = 2 ;
    Movie->PlayFlag = 0 ;
    return 0 ;
}

extern int SeekMovie_PF( MOVIEGRAPH *Movie, int Time )
{
    AndroidMoviePlayer *p = android_get_player( Movie ) ;
    if ( !p ) return -1 ;
    AMediaExtractor_seekTo( p->extractor, ( int64_t )Time * 1000,
                            AMEDIAEXTRACTOR_SEEK_CLOSEST_SYNC ) ;
    AMediaCodec_flush( p->videoCodec ) ;
    if ( p->audioCodec ) AMediaCodec_flush( p->audioCodec ) ;
    p->last_pts_ms = Time ;
    p->start_monotonic_ms = android_now_ms() - Time ;
    p->saw_input_eof = false ;
    p->saw_output_eof = false ;
    return 0 ;
}

extern int SetPlaySpeedRateMovie_PF( MOVIEGRAPH *, double /*SpeedRate*/ ) { return 0 ; }

extern int GetMovieState_PF( MOVIEGRAPH *Movie ) { return Movie->PlayFlag ; }

extern int SetMovieVolume_PF( MOVIEGRAPH *Movie, int Volume )
{
    AndroidMoviePlayer *p = android_get_player( Movie ) ;
    if ( !p ) return -1 ;
    p->volume_0_10000 = Volume ;
    //  audio codec に直接 volume 反映は NDK に API が無い。audio sink (AAudio)
    //  側で scale する実装が要る。現段階は volume 保持のみ。
    return 0 ;
}

//  1 回の pump で video input / output を進める。戻り値: 新 frame あり = 1, 無し = 0, EOF = -1
static int android_pump_video( AndroidMoviePlayer *p )
{
    if ( !p || !p->videoCodec || !p->extractor ) return -1 ;

    //  input: extract サンプル → codec に queue
    if ( !p->saw_input_eof ) {
        ssize_t idx = AMediaCodec_dequeueInputBuffer( p->videoCodec, 0 ) ;
        if ( idx >= 0 ) {
            size_t bufsize = 0 ;
            uint8_t *buf = AMediaCodec_getInputBuffer( p->videoCodec, idx, &bufsize ) ;
            if ( buf ) {
                ssize_t sampleSize = AMediaExtractor_readSampleData( p->extractor, buf, bufsize ) ;
                if ( sampleSize < 0 ) {
                    AMediaCodec_queueInputBuffer( p->videoCodec, idx, 0, 0, 0,
                                                   AMEDIACODEC_BUFFER_FLAG_END_OF_STREAM ) ;
                    p->saw_input_eof = true ;
                } else {
                    int64_t pts = AMediaExtractor_getSampleTime( p->extractor ) ;
                    AMediaCodec_queueInputBuffer( p->videoCodec, idx, 0,
                                                   ( size_t )sampleSize, pts, 0 ) ;
                    AMediaExtractor_advance( p->extractor ) ;
                }
            }
        }
    }

    //  output: codec から decoded frame を取り出す
    AMediaCodecBufferInfo info ;
    ssize_t outIdx = AMediaCodec_dequeueOutputBuffer( p->videoCodec, &info, 0 ) ;
    if ( outIdx >= 0 ) {
        size_t outSize = 0 ;
        uint8_t *out = AMediaCodec_getOutputBuffer( p->videoCodec, outIdx, &outSize ) ;
        if ( out && info.size > 0 ) {
            //  NV12 前提で BGRA に変換 (Y plane: w*h, UV plane: w*h/2)
            int w = p->width, h = p->height ;
            int y_stride = w ;    //  端末による padding は無視 (簡易)
            int uv_stride = w ;
            p->frame_argb.resize( ( size_t )w * h * 4 ) ;
            const uint8_t *y  = out ;
            const uint8_t *uv = out + ( size_t )w * h ;
            nv12_to_bgra( y, uv, w, h, y_stride, uv_stride, p->frame_argb.data() ) ;
            p->last_pts_ms = info.presentationTimeUs / 1000 ;
        }
        AMediaCodec_releaseOutputBuffer( p->videoCodec, outIdx, false ) ;
        if ( info.flags & AMEDIACODEC_BUFFER_FLAG_END_OF_STREAM ) {
            p->saw_output_eof = true ;
            return -1 ;
        }
        return 1 ;
    }
    return 0 ;
}

extern BASEIMAGE *GetMovieBaseImage_PF( MOVIEGRAPH *Movie, int *ImageUpdateFlag, int ImageUpdateFlagSetOnly )
{
    AndroidMoviePlayer *p = android_get_player( Movie ) ;
    if ( !p ) return NULL ;
    if ( ImageUpdateFlagSetOnly ) {
        if ( ImageUpdateFlag ) *ImageUpdateFlag = 0 ;
        return &Movie->NowImage ;
    }

    int64_t target = android_now_ms() - p->start_monotonic_ms ;
    bool updated = false ;
    while ( !p->saw_output_eof && p->last_pts_ms < target ) {
        int r = android_pump_video( p ) ;
        if ( r < 0 ) break ;
        if ( r == 0 ) break ;
        updated = true ;
    }

    //  loop 時 EOF → seek 0
    if ( p->saw_output_eof && p->loop_flag ) {
        AMediaExtractor_seekTo( p->extractor, 0, AMEDIAEXTRACTOR_SEEK_CLOSEST_SYNC ) ;
        AMediaCodec_flush( p->videoCodec ) ;
        if ( p->audioCodec ) AMediaCodec_flush( p->audioCodec ) ;
        p->last_pts_ms = 0 ;
        p->start_monotonic_ms = android_now_ms() ;
        p->saw_input_eof = false ;
        p->saw_output_eof = false ;
    }

    if ( updated && !p->frame_argb.empty() ) {
        NS_CreateARGB8ColorData( &Movie->NowImage.ColorData ) ;
        Movie->NowImage.Width  = p->width ;
        Movie->NowImage.Height = p->height ;
        Movie->NowImage.Pitch  = p->width * 4 ;
        Movie->NowImage.GraphData = p->frame_argb.data() ;
        Movie->NowImage.MipMapCount = 0 ;
        Movie->NowImage.GraphDataCount = 0 ;
        Movie->NowImageUpdateFlag = 1 ;
        if ( ImageUpdateFlag ) *ImageUpdateFlag = 1 ;
    } else {
        if ( ImageUpdateFlag ) *ImageUpdateFlag = 0 ;
    }
    return &Movie->NowImage ;
}

extern int GetMovieTotalFrame_PF( MOVIEGRAPH * ) { return -1 ; }

extern int TellMovie_PF( MOVIEGRAPH *Movie )
{
    AndroidMoviePlayer *p = android_get_player( Movie ) ;
    return p ? ( int )p->last_pts_ms : 0 ;
}

extern int TellMovieToFrame_PF( MOVIEGRAPH * ) { return 0 ; }
extern int SeekMovieToFrame_PF( MOVIEGRAPH *, int ) { return 0 ; }

extern LONGLONG GetOneFrameTimeMovie_PF( MOVIEGRAPH * )
{
    return ( LONGLONG )( 1000000.0f / 29.970f ) ;
}

extern int UpdateMovie_PF( MOVIEGRAPH *Movie, int /*AlwaysFlag*/ )
{
    //  GetMovieBaseImage_PF で push 型に pump するので UpdateMovie は no-op
    (void)Movie;
    return 0 ;
}

#ifndef DX_NON_NAMESPACE
} // namespace DxLib
#endif

#endif // __ANDROID__ && !DX_NON_MOVIE
