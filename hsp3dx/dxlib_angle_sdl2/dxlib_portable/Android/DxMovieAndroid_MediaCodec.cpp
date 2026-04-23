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
#include <aaudio/AAudio.h>    //  audio 出力 (API 26+、minSdk 27 で OK)

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
    AMediaExtractor          *extractor        = nullptr ;   // video 専用
    AMediaExtractor          *audioExtractor   = nullptr ;   // audio 専用 (別 fd)
    AMediaCodec              *videoCodec       = nullptr ;
    AMediaCodec              *audioCodec       = nullptr ;
    int                       videoTrack       = -1 ;
    int                       audioTrack       = -1 ;
    FILE                     *audio_fp         = nullptr ;   // audio extractor 用 fd
    int                       width            = 0 ;
    int                       height           = 0 ;
    int                       color_format     = 0 ;  // OMX color format (出力 format 判明後に値入る)
    int                       stride           = 0 ;  // Y plane stride (bytes)
    int                       slice_height     = 0 ;  // Y plane height (含む padding)
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
    FILE                     *fp               = nullptr ;  // setDataSourceFd 用の保持
    //  audio
    AAudioStream             *audioStream      = nullptr ;
    int                       audio_sample_rate = 0 ;
    int                       audio_channels    = 0 ;
    bool                      audio_saw_input_eof  = false ;
    bool                      audio_saw_output_eof = false ;
} ;

//  OMX color format 定数 (android/media/NdkMediaCodec.h にも同値)
enum {
    COLOR_FormatYUV420Planar      = 19,       // I420: Y plane, U plane, V plane
    COLOR_FormatYUV420SemiPlanar  = 21,       // NV12: Y plane, interleaved UV
    COLOR_FormatYUV420PackedPlanar = 20,      // I420 の変種
    COLOR_FormatYUV420PackedSemiPlanar = 39,  // NV12 の変種
    COLOR_QCOM_FormatYUV420SemiPlanar = 0x7FA30C00,
    COLOR_FormatYUV420Flexible    = 0x7F420888,  // AImage 経由で plane 取得必要
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

//  BT.601 YUV → BGRA 行列 (AMediaCodec 出力は基本 BT.601 limited range)
static inline void yuv_to_bgra_pixel( int Y, int U, int V, uint8_t *dst )
{
    U -= 128 ; V -= 128 ;
    int R = Y + ( 91881 * V ) / 65536 ;
    int G = Y - ( 22554 * U + 46802 * V ) / 65536 ;
    int B = Y + ( 116130 * U ) / 65536 ;
    if ( R < 0 ) R = 0 ; if ( R > 255 ) R = 255 ;
    if ( G < 0 ) G = 0 ; if ( G > 255 ) G = 255 ;
    if ( B < 0 ) B = 0 ; if ( B > 255 ) B = 255 ;
    dst[ 0 ] = ( uint8_t )B ;
    dst[ 1 ] = ( uint8_t )G ;
    dst[ 2 ] = ( uint8_t )R ;
    dst[ 3 ] = 255 ;
}

//  NV12 (Y plane + interleaved UV plane)
//  uv_order: 0=UV (NV12), 1=VU (NV21)
static void nv_to_bgra( const uint8_t *y, const uint8_t *uv, int w, int h,
                        int y_stride, int uv_stride, int uv_order, uint8_t *dst )
{
    for ( int j = 0 ; j < h ; ++j ) {
        const uint8_t *yrow  = y  + j * y_stride ;
        const uint8_t *uvrow = uv + ( j / 2 ) * uv_stride ;
        uint8_t *drow = dst + j * w * 4 ;
        for ( int i = 0 ; i < w ; ++i ) {
            int Y = yrow[ i ] ;
            int U = uvrow[ ( i / 2 ) * 2 + uv_order ] ;
            int V = uvrow[ ( i / 2 ) * 2 + ( 1 - uv_order ) ] ;
            yuv_to_bgra_pixel( Y, U, V, drow ) ;
            drow += 4 ;
        }
    }
}

//  I420 (Y plane / U plane / V plane) planar 4:2:0
//  v_first: 0=UV順 (I420), 1=VU順 (YV12)
static void i420_to_bgra( const uint8_t *y, const uint8_t *u, const uint8_t *v,
                          int w, int h, int y_stride, int uv_stride, uint8_t *dst )
{
    for ( int j = 0 ; j < h ; ++j ) {
        const uint8_t *yrow = y + j * y_stride ;
        const uint8_t *urow = u + ( j / 2 ) * uv_stride ;
        const uint8_t *vrow = v + ( j / 2 ) * uv_stride ;
        uint8_t *drow = dst + j * w * 4 ;
        for ( int i = 0 ; i < w ; ++i ) {
            int Y = yrow[ i ] ;
            int U = urow[ i / 2 ] ;
            int V = vrow[ i / 2 ] ;
            yuv_to_bgra_pixel( Y, U, V, drow ) ;
            drow += 4 ;
        }
    }
}

extern int InitializeMovieManage_PF( void ) { return 0 ; }
extern int TerminateMovieManage_PF( void )
{
    for ( auto &kv : g_AndroidPlayers ) {
        if ( kv.second ) {
            if ( kv.second->audioStream ) {
                AAudioStream_requestStop( kv.second->audioStream ) ;
                AAudioStream_close( kv.second->audioStream ) ;
            }
            if ( kv.second->videoCodec ) AMediaCodec_delete( kv.second->videoCodec ) ;
            if ( kv.second->audioCodec ) AMediaCodec_delete( kv.second->audioCodec ) ;
            if ( kv.second->extractor )      AMediaExtractor_delete( kv.second->extractor ) ;
            if ( kv.second->audioExtractor ) AMediaExtractor_delete( kv.second->audioExtractor ) ;
            if ( kv.second->fp )         fclose( kv.second->fp ) ;
            if ( kv.second->audio_fp )   fclose( kv.second->audio_fp ) ;
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
    //  AMediaExtractor_setDataSource(path) は URI (file:// or http(s)://) 要求で
    //  相対 path が通らない。fopen + fileno の fd 経由なら libc の cwd 解決で動く。
    FILE *fp = fopen( path.c_str(), "rb" ) ;
    if ( !fp ) {
        ALOGE( "fopen failed: %s", path.c_str() ) ;
        AMediaExtractor_delete( ex ) ;
        return -1 ;
    }
    fseek( fp, 0, SEEK_END ) ;
    off_t fsize = ftello( fp ) ;
    fseek( fp, 0, SEEK_SET ) ;
    media_status_t st = AMediaExtractor_setDataSourceFd( ex, fileno( fp ), 0, fsize ) ;
    if ( st != AMEDIA_OK ) {
        ALOGE( "setDataSourceFd failed: %s (st=%d)", path.c_str(), (int)st ) ;
        fclose( fp ) ;
        AMediaExtractor_delete( ex ) ;
        return -1 ;
    }
    //  AMediaExtractor は fd を内部で dup するので close して OK (多分)、念のため player
    //  struct に保持しておく。
    // fclose( fp ) ;  → dup 済みなら閉じてよいが NDK docs 不明瞭のため保持

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
    //  emulator 上では c2.goldfish.h264.decoder が選ばれて CPU buffer 出力が動かないので、
    //  確実に software decoder (c2.android.avc.decoder) を優先する。実機 HW decoder の
    //  最適化は一旦諦め、互換性を取る。
    AMediaCodec *vcodec = nullptr ;
    if ( vmime && strstr( vmime, "avc" ) ) {
        vcodec = AMediaCodec_createCodecByName( "c2.android.avc.decoder" ) ;
    }
    if ( !vcodec ) vcodec = AMediaCodec_createDecoderByType( vmime ? vmime : "video/avc" ) ;
    if ( !vcodec ) { AMediaFormat_delete( vfmt ) ; AMediaExtractor_delete( ex ) ; return -1 ; }
    //  decoder に YUV420 Flexible を要求 (CPU-readable buffer 出力)
    AMediaFormat_setInt32( vfmt, AMEDIAFORMAT_KEY_COLOR_FORMAT, 0x7F420888 /* Flexible */ ) ;
    media_status_t cst = AMediaCodec_configure( vcodec, vfmt, nullptr, nullptr, 0 ) ;
    if ( cst != AMEDIA_OK ) {
        ALOGE( "AMediaCodec_configure failed: %d", (int)cst ) ;
        AMediaCodec_delete( vcodec ) ;
        AMediaFormat_delete( vfmt ) ;
        AMediaExtractor_delete( ex ) ;
        return -1 ;
    }
    AMediaCodec_start( vcodec ) ;
    AMediaFormat_delete( vfmt ) ;

    //  audio codec 起動 (optional): video と track を混ぜない専用 extractor を開く。
    //  同じ fd は AMediaExtractor 側で内部 dup されるが ensure の意味でも
    //  2 つ目の FILE* を開いて別 fd を渡す。
    AMediaCodec *acodec = nullptr ;
    AMediaExtractor *aex = nullptr ;
    FILE *afp = nullptr ;
    int audio_sr = 0, audio_ch = 0 ;
    if ( atrack >= 0 ) {
        afp = fopen( path.c_str(), "rb" ) ;
        if ( afp ) {
            fseek( afp, 0, SEEK_END ) ;
            off_t afsize = ftello( afp ) ;
            fseek( afp, 0, SEEK_SET ) ;
            aex = AMediaExtractor_new() ;
            if ( AMediaExtractor_setDataSourceFd( aex, fileno( afp ), 0, afsize ) == AMEDIA_OK ) {
                AMediaExtractor_selectTrack( aex, atrack ) ;
                AMediaFormat *afmt = AMediaExtractor_getTrackFormat( aex, atrack ) ;
                const char *amime = nullptr ;
                AMediaFormat_getString( afmt, AMEDIAFORMAT_KEY_MIME, &amime ) ;
                AMediaFormat_getInt32( afmt, AMEDIAFORMAT_KEY_SAMPLE_RATE,    &audio_sr ) ;
                AMediaFormat_getInt32( afmt, AMEDIAFORMAT_KEY_CHANNEL_COUNT,  &audio_ch ) ;
                acodec = AMediaCodec_createDecoderByType( amime ? amime : "audio/mp4a-latm" ) ;
                if ( acodec ) {
                    AMediaCodec_configure( acodec, afmt, nullptr, nullptr, 0 ) ;
                    AMediaCodec_start( acodec ) ;
                }
                AMediaFormat_delete( afmt ) ;
            } else {
                AMediaExtractor_delete( aex ) ;
                aex = nullptr ;
                fclose( afp ) ;
                afp = nullptr ;
            }
        }
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
    p->fp           = fp ;    //  setDataSourceFd 用の FILE*、destroy 時に close
    p->audioExtractor = aex ;
    p->audio_fp     = afp ;
    p->audio_sample_rate = audio_sr ;
    p->audio_channels    = audio_ch ;

    //  audio track がある場合は AAudio stream を open (16-bit PCM)
    if ( acodec && audio_sr > 0 && audio_ch > 0 ) {
        AAudioStreamBuilder *builder = nullptr ;
        if ( AAudio_createStreamBuilder( &builder ) == AAUDIO_OK ) {
            AAudioStreamBuilder_setSampleRate( builder, audio_sr ) ;
            AAudioStreamBuilder_setChannelCount( builder, audio_ch ) ;
            AAudioStreamBuilder_setFormat( builder, AAUDIO_FORMAT_PCM_I16 ) ;
            AAudioStreamBuilder_setSharingMode( builder, AAUDIO_SHARING_MODE_SHARED ) ;
            AAudioStreamBuilder_setPerformanceMode( builder, AAUDIO_PERFORMANCE_MODE_NONE ) ;
            AAudioStreamBuilder_setDirection( builder, AAUDIO_DIRECTION_OUTPUT ) ;
            if ( AAudioStreamBuilder_openStream( builder, &p->audioStream ) == AAUDIO_OK ) {
                AAudioStream_requestStart( p->audioStream ) ;
            }
            AAudioStreamBuilder_delete( builder ) ;
        }
    }
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
        if ( p->audioStream ) {
            AAudioStream_requestStop( p->audioStream ) ;
            AAudioStream_close( p->audioStream ) ;
        }
        if ( p->videoCodec ) { AMediaCodec_stop( p->videoCodec ) ; AMediaCodec_delete( p->videoCodec ) ; }
        if ( p->audioCodec ) { AMediaCodec_stop( p->audioCodec ) ; AMediaCodec_delete( p->audioCodec ) ; }
        if ( p->extractor )      AMediaExtractor_delete( p->extractor ) ;
        if ( p->audioExtractor ) AMediaExtractor_delete( p->audioExtractor ) ;
        if ( p->fp )         fclose( p->fp ) ;
        if ( p->audio_fp )   fclose( p->audio_fp ) ;
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

//  audio: 専用 extractor → audio codec → AAudio stream に流す。戻り値: 進んだ = 1, 無し = 0
static int android_pump_audio( AndroidMoviePlayer *p )
{
    if ( !p || !p->audioCodec || !p->audioExtractor || !p->audioStream ) return 0 ;

    //  input: audio extractor から読み出して codec に queue (複数可能なだけ queue)
    while ( !p->audio_saw_input_eof ) {
        ssize_t idx = AMediaCodec_dequeueInputBuffer( p->audioCodec, 0 ) ;
        if ( idx < 0 ) break ;
        size_t bufsize = 0 ;
        uint8_t *buf = AMediaCodec_getInputBuffer( p->audioCodec, idx, &bufsize ) ;
        if ( !buf ) break ;
        ssize_t sampleSize = AMediaExtractor_readSampleData( p->audioExtractor, buf, bufsize ) ;
        if ( sampleSize < 0 ) {
            AMediaCodec_queueInputBuffer( p->audioCodec, idx, 0, 0, 0,
                                           AMEDIACODEC_BUFFER_FLAG_END_OF_STREAM ) ;
            p->audio_saw_input_eof = true ;
            break ;
        } else {
            int64_t pts = AMediaExtractor_getSampleTime( p->audioExtractor ) ;
            AMediaCodec_queueInputBuffer( p->audioCodec, idx, 0,
                                           ( size_t )sampleSize, pts, 0 ) ;
            AMediaExtractor_advance( p->audioExtractor ) ;
        }
    }

    //  output: 取り出して AAudio に write
    AMediaCodecBufferInfo info ;
    ssize_t outIdx = AMediaCodec_dequeueOutputBuffer( p->audioCodec, &info, 0 ) ;
    if ( outIdx >= 0 ) {
        size_t outSize = 0 ;
        uint8_t *out = AMediaCodec_getOutputBuffer( p->audioCodec, outIdx, &outSize ) ;
        if ( out && info.size > 0 ) {
            //  AAudio に write。16-bit PCM 前提。frame 数 = bytes / (channels * 2)
            int32_t frames = info.size / ( p->audio_channels * 2 ) ;
            AAudioStream_write( p->audioStream, out + info.offset, frames, 0 ) ;
        }
        AMediaCodec_releaseOutputBuffer( p->audioCodec, outIdx, false ) ;
        if ( info.flags & AMEDIACODEC_BUFFER_FLAG_END_OF_STREAM ) {
            p->audio_saw_output_eof = true ;
        }
        return 1 ;
    }
    return 0 ;
}

//  1 回の pump で video input / output を進める。戻り値: 新 frame あり = 1, 無し = 0, EOF = -1
static int android_pump_video( AndroidMoviePlayer *p )
{
    if ( !p || !p->videoCodec || !p->extractor ) return -1 ;

    //  input: 可能な限り複数サンプルを一気に queue (H.264 decoder は入力溜めが必要)
    while ( !p->saw_input_eof ) {
        ssize_t idx = AMediaCodec_dequeueInputBuffer( p->videoCodec, 0 ) ;
        if ( idx < 0 ) break ;  //  これ以上 input buffer 空きが無ければ抜ける
        {
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
    //  timeout 10ms を与えないと software decoder 側が TRY_AGAIN_LATER を返し続けることがある
    AMediaCodecBufferInfo info ;
    ssize_t outIdx = AMediaCodec_dequeueOutputBuffer( p->videoCodec, &info, 10000 ) ;
    if ( outIdx == AMEDIACODEC_INFO_OUTPUT_FORMAT_CHANGED ) {
        //  初回の decoded frame 出力前後で発火。実際の stride / slice_height /
        //  color_format をここで取得する。
        AMediaFormat *out_fmt = AMediaCodec_getOutputFormat( p->videoCodec ) ;
        if ( out_fmt ) {
            //  AMEDIAFORMAT_KEY_SLICE_HEIGHT は API 28+ なので string literal で直接指定
            //  (minSdk 27 対応のため)
            AMediaFormat_getInt32( out_fmt, AMEDIAFORMAT_KEY_STRIDE,       &p->stride ) ;
            AMediaFormat_getInt32( out_fmt, "slice-height",                &p->slice_height ) ;
            AMediaFormat_getInt32( out_fmt, AMEDIAFORMAT_KEY_COLOR_FORMAT, &p->color_format ) ;
            int ow = p->width, oh = p->height ;
            AMediaFormat_getInt32( out_fmt, AMEDIAFORMAT_KEY_WIDTH,  &ow ) ;
            AMediaFormat_getInt32( out_fmt, AMEDIAFORMAT_KEY_HEIGHT, &oh ) ;
            if ( ow > 0 ) p->width  = ow ;
            if ( oh > 0 ) p->height = oh ;
            ALOGI( "output format: %dx%d stride=%d slice=%d color=0x%x",
                   p->width, p->height, p->stride, p->slice_height, p->color_format ) ;
            AMediaFormat_delete( out_fmt ) ;
        }
        //  stride 未報告なら width 推定 / slice_height 未報告なら height
        if ( p->stride       <= 0 ) p->stride       = p->width ;
        if ( p->slice_height <= 0 ) p->slice_height = p->height ;
        return 0 ;    //  次の pump で実 frame を取る
    }
    if ( outIdx == AMEDIACODEC_INFO_OUTPUT_BUFFERS_CHANGED ) return 0 ;
    if ( outIdx == AMEDIACODEC_INFO_TRY_AGAIN_LATER ) return 0 ;
    if ( outIdx >= 0 ) {
        size_t outSize = 0 ;
        uint8_t *out = AMediaCodec_getOutputBuffer( p->videoCodec, outIdx, &outSize ) ;
        if ( out && info.size > 0 ) {
            int w = p->width, h = p->height ;
            int y_stride = p->stride > 0 ? p->stride : w ;
            //  slice_height は codec 内部 macroblock padding で info.size と整合しない
            //  場合があるので、info.size から逆算した実効 Y-plane 高さを使う。
            //  YUV420: total = Y (stride*y_h) + UV (stride*y_h/2) = stride * y_h * 1.5
            //  → y_h = (info.size / stride) / 1.5
            int effective_y_h = 0 ;
            if ( y_stride > 0 && info.size > 0 ) {
                effective_y_h = ( info.size * 2 ) / ( y_stride * 3 ) ;
            }
            //  effective が height 以上を満たす場合はそちらを採用 (valid rows + padding)
            int slice_h = effective_y_h >= h ? effective_y_h : h ;
            int uv_stride = y_stride ;  //  NV12 系は UV plane も同じ stride
            p->frame_argb.resize( ( size_t )w * h * 4 ) ;
            const uint8_t *y_plane = out + info.offset ;

            switch ( p->color_format ) {
            case COLOR_FormatYUV420Flexible:
            case COLOR_FormatYUV420Planar:
            case COLOR_FormatYUV420PackedPlanar: {
                //  I420: Y / U / V
                const uint8_t *u_plane = y_plane + ( size_t )y_stride * slice_h ;
                const uint8_t *v_plane = u_plane + ( size_t )( y_stride / 2 ) * ( slice_h / 2 ) ;
                i420_to_bgra( y_plane, u_plane, v_plane, w, h, y_stride, y_stride / 2,
                              p->frame_argb.data() ) ;
                break ; }
            case COLOR_FormatYUV420SemiPlanar:
            case COLOR_FormatYUV420PackedSemiPlanar:
            case COLOR_QCOM_FormatYUV420SemiPlanar:
            default: {
                //  NV12 (UV 順) — 多くの実機はこれ
                const uint8_t *uv_plane = y_plane + ( size_t )y_stride * slice_h ;
                nv_to_bgra( y_plane, uv_plane, w, h, y_stride, uv_stride, 0,
                            p->frame_argb.data() ) ;
                break ; }
            }
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
    //  DxLib のフレームループから毎フレ呼ばれる。decode pump → Movie->NowImage
    //  更新 → UpdateFunction callback で graph texture 更新の順。
    AndroidMoviePlayer *p = android_get_player( Movie ) ;
    if ( !p ) return -1 ;
    if ( Movie->SysPauseFlag ) return 0 ;

    int64_t target = android_now_ms() - p->start_monotonic_ms ;
    bool updated = false ;
    while ( !p->saw_output_eof && p->last_pts_ms < target ) {
        int r = android_pump_video( p ) ;
        if ( r < 0 ) break ;
        if ( r == 0 ) break ;
        updated = true ;
    }

    //  audio も毎フレ pump (AAudio stream にフィード)
    android_pump_audio( p ) ;

    //  loop 時 EOF → seek 0
    if ( p->saw_output_eof && p->loop_flag ) {
        AMediaExtractor_seekTo( p->extractor, 0, AMEDIAEXTRACTOR_SEEK_CLOSEST_SYNC ) ;
        AMediaCodec_flush( p->videoCodec ) ;
        if ( p->audioCodec ) AMediaCodec_flush( p->audioCodec ) ;
        if ( p->audioExtractor ) AMediaExtractor_seekTo( p->audioExtractor, 0, AMEDIAEXTRACTOR_SEEK_CLOSEST_SYNC ) ;
        p->last_pts_ms = 0 ;
        p->start_monotonic_ms = android_now_ms() ;
        p->saw_input_eof = false ;
        p->saw_output_eof = false ;
        p->audio_saw_input_eof = false ;
        p->audio_saw_output_eof = false ;
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
        //  graph-backed 再生時: graph texture を更新するコールバックを呼ぶ
        if ( Movie->UpdateFunction ) {
            Movie->UpdateFunction( Movie, Movie->UpdateFunctionData ) ;
        }
    }
    return 0 ;
}

#ifndef DX_NON_NAMESPACE
} // namespace DxLib
#endif

#endif // __ANDROID__ && !DX_NON_MOVIE
