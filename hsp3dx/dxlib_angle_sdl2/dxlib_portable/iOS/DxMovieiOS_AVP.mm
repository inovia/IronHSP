//-----------------------------------------------------------------------------
//
//      ＤＸライブラリ     iOS 用 ムービー実装 (AVPlayer 版、2026-04-23 追加)
//
//      DxLib 3.24f の本家 DxMovieiOS.cpp は PF 関数が全部 return 0 / -1 の
//      stub のため iOS では MP4 等が再生できない。このファイルは
//      AVFoundation の AVPlayer + AVPlayerItemVideoOutput を使って
//      video+audio の基本再生を提供する**リファレンス実装**。
//
//      有効化方法 (将来):
//      1. DxLib iOS を from-source でビルドする場合、DxMovieiOS.cpp の代わりに
//         このファイルをコンパイル対象に含める。
//      2. DxLibEnableLive2D_iOS_3_24f.zip の prebuilt libDxLib_iOS.a 利用時は
//         archive から DxMovieiOS.o を `ar d` で削除し、このファイルの .o を
//         app 側でリンクする (link 順で app/.o → -lDxLib_iOS)。
//
//      現時点では iOS ビルドに組み込まれていない (= 現状 iOS Movie は動かない
//      まま)。コードは将来作業の足場として用意。
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#include "../DxCompileConfig.h"

#if defined(__APPLE__) && TARGET_OS_IOS && !defined(DX_NON_MOVIE)

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreVideo/CoreVideo.h>

#include "../DxLib.h"
#include "../DxMovie.h"
#include "../DxBaseImage.h"

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

//  AVPlayer 状態を MOVIEGRAPH->PF に直接埋め込みにくいので、外部 map で管理
struct iOSMoviePlayer {
    AVPlayer                      *player       = nil ;
    AVPlayerItem                  *item         = nil ;
    AVPlayerItemVideoOutput       *videoOutput  = nil ;
    std::vector<unsigned char>     frame_argb ;
    int                            width        = 0 ;
    int                            height       = 0 ;
    int64_t                        duration_ms  = 0 ;
    int64_t                        last_time_ms = 0 ;
    int                            last_update_ms = 0 ;
    int                            volume_0_10000 = 10000 ;
} ;

static std::unordered_map<MOVIEGRAPH*, iOSMoviePlayer*> g_iOSPlayers ;

static iOSMoviePlayer *ios_get_player( MOVIEGRAPH *Movie )
{
    auto it = g_iOSPlayers.find( Movie ) ;
    return it != g_iOSPlayers.end() ? it->second : nullptr ;
}

extern int InitializeMovieManage_PF( void ) { return 0 ; }
extern int TerminateMovieManage_PF( void )
{
    for ( auto &kv : g_iOSPlayers ) {
        if ( kv.second ) {
            [kv.second->player pause] ;
            [kv.second->videoOutput release] ;
            [kv.second->item release] ;
            [kv.second->player release] ;
            delete kv.second ;
        }
    }
    g_iOSPlayers.clear() ;
    return 0 ;
}

extern int OpenMovie_UseGParam_PF( MOVIEGRAPH *Movie, OPENMOVIE_GPARAM * /*GParam*/,
                                   const wchar_t *FileName, int *Width, int *Height,
                                   int /*SurfaceMode*/, int ImageSizeGetOnly, int /*ASyncThread*/ )
{
    if ( !Movie || !FileName ) return -1 ;

    //  wchar_t → UTF-8 変換 (iOS は TCHAR = wchar_t)
    @autoreleasepool {
        NSString *path = nil ;
        //  wchar_t の UTF-8 変換は platform 依存。iOS wchar_t は UTF-32
        NSData *d = [NSData dataWithBytes:FileName length:wcslen(FileName) * 4] ;
        path = [[[NSString alloc] initWithData:d encoding:NSUTF32LittleEndianStringEncoding] autorelease] ;
        if ( !path ) return -1 ;

        NSURL *url = [NSURL fileURLWithPath:path] ;
        AVAsset *asset = [AVURLAsset URLAssetWithURL:url options:nil] ;
        if ( !asset ) return -1 ;

        NSArray<AVAssetTrack *> *vtracks = [asset tracksWithMediaType:AVMediaTypeVideo] ;
        if ( vtracks.count == 0 ) return -1 ;
        CGSize sz = vtracks.firstObject.naturalSize ;
        if ( Width )  *Width  = ( int )sz.width ;
        if ( Height ) *Height = ( int )sz.height ;
        if ( ImageSizeGetOnly ) return 0 ;

        //  BGRA 出力の AVPlayerItemVideoOutput を作成
        NSDictionary *pixAttr = @{
            (NSString *)kCVPixelBufferPixelFormatTypeKey : @( kCVPixelFormatType_32BGRA )
        } ;
        AVPlayerItem *item = [AVPlayerItem playerItemWithAsset:asset] ;
        AVPlayerItemVideoOutput *vout =
            [[AVPlayerItemVideoOutput alloc] initWithPixelBufferAttributes:pixAttr] ;
        [item addOutput:vout] ;
        AVPlayer *player = [AVPlayer playerWithPlayerItem:item] ;
        //  audio は AVPlayer が自動再生、iOS の AVAudioSession に委ねる

        iOSMoviePlayer *p = new iOSMoviePlayer() ;
        p->player      = [player retain] ;
        p->item        = [item retain] ;
        p->videoOutput = [vout retain] ;
        p->width       = ( int )sz.width ;
        p->height      = ( int )sz.height ;
        p->duration_ms = ( int64_t )( CMTimeGetSeconds( asset.duration ) * 1000.0 ) ;
        g_iOSPlayers[ Movie ] = p ;
        Movie->Width  = p->width ;
        Movie->Height = p->height ;
        return 0 ;
    }
}

extern int OpenMovie_CustomGraphHandleGParam_PF( MOVIEGRAPH * /*Movie*/,
                                                 struct SETUP_GRAPHHANDLE_GPARAM * /*Param*/ )
{ return 0 ; }

extern int TerminateMovieHandle_PF( HANDLEINFO *HandleInfo )
{
    MOVIEGRAPH *Movie = ( MOVIEGRAPH * )HandleInfo ;
    auto it = g_iOSPlayers.find( Movie ) ;
    if ( it == g_iOSPlayers.end() ) return 0 ;
    iOSMoviePlayer *p = it->second ;
    if ( p ) {
        [p->player pause] ;
        [p->videoOutput release] ;
        [p->item release] ;
        [p->player release] ;
        delete p ;
    }
    g_iOSPlayers.erase( it ) ;
    return 0 ;
}

extern int PlayMovie__PF( MOVIEGRAPH *Movie, int PlayType, int /*SysPlay*/ )
{
    iOSMoviePlayer *p = ios_get_player( Movie ) ;
    if ( !p ) return -1 ;
    p->player.actionAtItemEnd = ( PlayType & DX_PLAYTYPE_LOOPBIT )
        ? AVPlayerActionAtItemEndNone   //  loop 時: 自前で seek to 0
        : AVPlayerActionAtItemEndPause ;
    [p->player play] ;
    Movie->PlayFlag = 1 ;
    return 0 ;
}

extern int PauseMovie_PF( MOVIEGRAPH *Movie, int /*SysPause*/ )
{
    iOSMoviePlayer *p = ios_get_player( Movie ) ;
    if ( !p ) return -1 ;
    [p->player pause] ;
    Movie->PlayFlag = 0 ;
    return 0 ;
}

extern int SeekMovie_PF( MOVIEGRAPH *Movie, int Time )
{
    iOSMoviePlayer *p = ios_get_player( Movie ) ;
    if ( !p ) return -1 ;
    CMTime t = CMTimeMakeWithSeconds( Time / 1000.0, 1000 ) ;
    [p->player seekToTime:t toleranceBefore:kCMTimeZero afterTolerance:kCMTimeZero] ;
    return 0 ;
}

extern int SetPlaySpeedRateMovie_PF( MOVIEGRAPH *Movie, double SpeedRate )
{
    iOSMoviePlayer *p = ios_get_player( Movie ) ;
    if ( !p ) return -1 ;
    p->player.rate = ( float )SpeedRate ;
    return 0 ;
}

extern int GetMovieState_PF( MOVIEGRAPH *Movie )
{
    return Movie->PlayFlag ;
}

extern int SetMovieVolume_PF( MOVIEGRAPH *Movie, int Volume )
{
    iOSMoviePlayer *p = ios_get_player( Movie ) ;
    if ( !p ) return -1 ;
    p->volume_0_10000 = Volume ;
    p->player.volume = Volume / 10000.0f ;
    return 0 ;
}

extern BASEIMAGE *GetMovieBaseImage_PF( MOVIEGRAPH *Movie, int *ImageUpdateFlag, int ImageUpdateFlagSetOnly )
{
    iOSMoviePlayer *p = ios_get_player( Movie ) ;
    if ( !p ) return NULL ;

    if ( ImageUpdateFlagSetOnly ) {
        if ( ImageUpdateFlag ) *ImageUpdateFlag = 0 ;
        return &Movie->NowImage ;
    }

    CMTime now = p->item.currentTime ;
    if ( [p->videoOutput hasNewPixelBufferForItemTime:now] ) {
        CMTime outItemTime ;
        CVPixelBufferRef pix =
            [p->videoOutput copyPixelBufferForItemTime:now itemTimeForDisplay:&outItemTime] ;
        if ( pix ) {
            CVPixelBufferLockBaseAddress( pix, kCVPixelBufferLock_ReadOnly ) ;
            size_t w  = CVPixelBufferGetWidth( pix ) ;
            size_t h  = CVPixelBufferGetHeight( pix ) ;
            size_t pitch = CVPixelBufferGetBytesPerRow( pix ) ;
            uint8_t *base = ( uint8_t * )CVPixelBufferGetBaseAddress( pix ) ;
            int row = ( int )w * 4 ;
            p->frame_argb.resize( h * row ) ;
            for ( size_t y = 0 ; y < h ; ++y )
                std::memcpy( p->frame_argb.data() + y * row, base + y * pitch, row ) ;
            CVPixelBufferUnlockBaseAddress( pix, kCVPixelBufferLock_ReadOnly ) ;
            CFRelease( pix ) ;

            //  BASEIMAGE に BGRA データをセット (ARGB8 color 形式)
            NS_CreateARGB8ColorData( &Movie->NowImage.ColorData ) ;
            Movie->NowImage.Width  = p->width ;
            Movie->NowImage.Height = p->height ;
            Movie->NowImage.Pitch  = row ;
            Movie->NowImage.GraphData = p->frame_argb.data() ;
            Movie->NowImage.MipMapCount   = 0 ;
            Movie->NowImage.GraphDataCount = 0 ;
            Movie->NowImageUpdateFlag = 1 ;
            p->last_time_ms = ( int64_t )( CMTimeGetSeconds( outItemTime ) * 1000.0 ) ;
            if ( ImageUpdateFlag ) *ImageUpdateFlag = 1 ;
            return &Movie->NowImage ;
        }
    }
    if ( ImageUpdateFlag ) *ImageUpdateFlag = 0 ;
    return &Movie->NowImage ;
}

extern int GetMovieTotalFrame_PF( MOVIEGRAPH * /*Movie*/ ) { return -1 ; }

extern int TellMovie_PF( MOVIEGRAPH *Movie )
{
    iOSMoviePlayer *p = ios_get_player( Movie ) ;
    if ( !p ) return 0 ;
    return ( int )( CMTimeGetSeconds( p->player.currentTime ) * 1000.0 ) ;
}

extern int TellMovieToFrame_PF( MOVIEGRAPH * /*Movie*/ ) { return 0 ; }
extern int SeekMovieToFrame_PF( MOVIEGRAPH * /*Movie*/, int /*Frame*/ ) { return 0 ; }

extern LONGLONG GetOneFrameTimeMovie_PF( MOVIEGRAPH * /*Movie*/ )
{
    return ( LONGLONG )( 1000000.0f / 29.970f ) ;   //  29.97 fps 固定
}

extern int UpdateMovie_PF( MOVIEGRAPH *Movie, int /*AlwaysFlag*/ )
{
    iOSMoviePlayer *p = ios_get_player( Movie ) ;
    if ( !p ) return -1 ;
    //  Loop 時 end reached なら 0 に戻す
    if ( Movie->PlayFlag && Movie->PlayType & DX_PLAYTYPE_LOOPBIT ) {
        if ( CMTIME_COMPARE_INLINE( p->player.currentTime, >=, p->item.duration ) ) {
            [p->player seekToTime:kCMTimeZero] ;
            [p->player play] ;
        }
    }
    return 0 ;
}

#ifndef DX_NON_NAMESPACE
} // namespace DxLib
#endif

#endif // __APPLE__ && TARGET_OS_IOS && !DX_NON_MOVIE
