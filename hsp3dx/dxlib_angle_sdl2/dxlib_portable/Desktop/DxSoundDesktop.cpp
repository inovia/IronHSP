//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2_mixer) 用 サウンド 実装
//
//      DxLib の 1679 行にわたる sound 系ソースの完全移植は重いため、
//      Font と同じく「本道 API を自前提供」方式で SDL2_mixer に直結する。
//      DX_NON_SOUND=1 のままで DxSound.cpp / DxGateway.cpp の sound 部分は
//      コンパイル対象外だが、DxLib.h の宣言に対してここで実体を与える。
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#ifdef _WIN32
#include <windows.h>
#endif

#include "../DxCompileConfig.h"
#include "../DxLib.h"

#include <SDL.h>
#include <SDL_mixer.h>

// bundled libvorbisfile (extlib/libvorbis/include) で OGG Vorbis を decode
extern "C" {
#include <vorbis/vorbisfile.h>
#include <opusfile.h>
}

#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <cctype>
#include <unordered_map>
#include <map>
#include <string>
#include <vector>

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

// SoundHandle → Mix_Chunk* (WAV/OGG/短尺効果音)
struct DesktopSoundEntry {
    Mix_Chunk *chunk = nullptr ;
    int last_channel = -1 ;
    int volume_0_10000 = 10000 ; // DxLib 標準は 0..10000
    // OGG decoded PCM を保持するバッファ (Mix_QuickLoad_RAW は所有しない).
    // nullptr 以外なら free() で解放が必要。
    Uint8 *raw_buffer = nullptr ;
    // 3D sound 用 (Set3DPositionSoundMem 等で設定、PlaySoundMem 時に Mix_SetPosition)
    bool   has_3d_pos = false ;
    float  pos_x = 0, pos_y = 0, pos_z = 0 ;
    float  radius = 1000.0f ;        // 距離減衰の最大、これ以上は無音
    // LoadSoundMem2 (prelude+loop) 用: prelude=chunk、loop_chunk が non-null なら
    // PlaySoundMem 完了時に Mix_ChannelFinished callback で loop_chunk を再生
    Mix_Chunk *loop_chunk = nullptr ;
    Uint8     *loop_raw_buffer = nullptr ;
} ;

// ファイルを丸ごと PCM S16LE stereo 44100Hz に decode する。
// bundled libvorbisfile を使う。返り値: 成功時 malloc バッファ (*OutBytes セット)、
// 失敗時 nullptr。呼び出し側が std::free 必須。
static Uint8 *desktop_decode_ogg_to_pcm( const char *path, int *OutBytes )
{
    OggVorbis_File vf ;
    if ( ov_fopen( path, &vf ) != 0 ) return nullptr ;

    vorbis_info *vi = ov_info( &vf, -1 ) ;
    if ( !vi ) { ov_clear( &vf ) ; return nullptr ; }

    int src_ch   = vi->channels ;
    int src_rate = ( int )vi->rate ;

    std::vector<Uint8> pcm ;
    pcm.reserve( 1 << 20 ) ;
    char buf[ 4096 ] ;
    int bitstream = 0 ;
    for ( ; ; )
    {
        long n = ov_read( &vf, buf, ( int )sizeof( buf ), 0 /*LE*/, 2 /*S16*/, 1 /*signed*/, &bitstream ) ;
        if ( n == 0 ) break ;
        if ( n <  0 ) { ov_clear( &vf ) ; return nullptr ; }
        pcm.insert( pcm.end(), ( Uint8 * )buf, ( Uint8 * )buf + n ) ;
    }
    ov_clear( &vf ) ;

    // モノラル → ステレオに複製 (SDL_mixer の open format が 2ch のため)
    if ( src_ch == 1 )
    {
        std::vector<Uint8> stereo ;
        stereo.reserve( pcm.size() * 2 ) ;
        for ( size_t i = 0 ; i + 1 < pcm.size() ; i += 2 ) {
            stereo.push_back( pcm[ i + 0 ] ) ; stereo.push_back( pcm[ i + 1 ] ) ;
            stereo.push_back( pcm[ i + 0 ] ) ; stereo.push_back( pcm[ i + 1 ] ) ;
        }
        pcm.swap( stereo ) ;
    }

    // サンプルレートが 44100 と異なる場合は SDL_AudioCVT で変換する
    if ( src_rate != 44100 )
    {
        SDL_AudioCVT cvt ;
        if ( SDL_BuildAudioCVT( &cvt, AUDIO_S16LSB, 2, src_rate,
                                       AUDIO_S16LSB, 2, 44100 ) < 0 )
        {
            return nullptr ;
        }
        cvt.len = ( int )pcm.size() ;
        std::vector<Uint8> tmp( ( size_t )( cvt.len * cvt.len_mult ) ) ;
        std::memcpy( tmp.data(), pcm.data(), pcm.size() ) ;
        cvt.buf = tmp.data() ;
        if ( SDL_ConvertAudio( &cvt ) < 0 ) return nullptr ;
        pcm.assign( tmp.begin(), tmp.begin() + cvt.len_cvt ) ;
    }

    Uint8 *out = ( Uint8 * )std::malloc( pcm.size() ) ;
    if ( !out ) return nullptr ;
    std::memcpy( out, pcm.data(), pcm.size() ) ;
    *OutBytes = ( int )pcm.size() ;
    return out ;
}

static bool desktop_path_ext_is( const char *path, const char *ext )
{
    if ( !path || !ext ) return false ;
    size_t pn = std::strlen( path ) ;
    size_t en = std::strlen( ext ) ;
    if ( pn < en + 1 ) return false ;
    const char *p = path + pn - en ;
    if ( *( p - 1 ) != '.' ) return false ;
    for ( size_t i = 0 ; i < en ; ++i ) {
        if ( std::tolower( ( unsigned char )p[ i ] ) !=
             std::tolower( ( unsigned char )ext[ i ] ) )
            return false ;
    }
    return true ;
}

static bool desktop_path_is_ogg ( const char *path ) { return desktop_path_ext_is( path, "ogg"  ) ; }
static bool desktop_path_is_opus( const char *path ) { return desktop_path_ext_is( path, "opus" ) ; }

// bundled opusfile で Opus (.opus) → PCM S16LE stereo 48kHz に decode。
// 成功時 malloc バッファ (呼び出し側 free 必須)、失敗時 nullptr。
static Uint8 *desktop_decode_opus_to_pcm( const char *path, int *OutBytes )
{
    int err = 0 ;
    OggOpusFile *of = op_open_file( path, &err ) ;
    if ( !of || err != 0 ) return nullptr ;

    // Opus はネイティブ 48kHz、op_read_stereo で 16-bit stereo を返す
    std::vector<Uint8> pcm ;
    pcm.reserve( 1 << 20 ) ;
    opus_int16 buf[ 120 * 48 * 2 ] ;  // 最大 120ms * 48kHz * 2ch
    for ( ; ; )
    {
        int n = op_read_stereo( of, buf, ( int )( sizeof( buf ) / sizeof( buf[0] ) ) ) ;
        if ( n == 0 ) break ;
        if ( n <  0 ) { op_free( of ) ; return nullptr ; }
        // n = per-channel 16-bit samples
        pcm.insert( pcm.end(), ( Uint8 * )buf, ( Uint8 * )buf + n * 4 /* 2ch * 2byte */ ) ;
    }
    op_free( of ) ;

    // 48kHz → 44.1kHz にリサンプル (SDL_mixer は 44100 で open されてる前提)
    SDL_AudioCVT cvt ;
    if ( SDL_BuildAudioCVT( &cvt, AUDIO_S16LSB, 2, 48000,
                                   AUDIO_S16LSB, 2, 44100 ) < 0 )
    {
        return nullptr ;
    }
    cvt.len = ( int )pcm.size() ;
    std::vector<Uint8> tmp( ( size_t )( cvt.len * cvt.len_mult ) ) ;
    std::memcpy( tmp.data(), pcm.data(), pcm.size() ) ;
    cvt.buf = tmp.data() ;
    if ( SDL_ConvertAudio( &cvt ) < 0 ) return nullptr ;
    pcm.assign( tmp.begin(), tmp.begin() + cvt.len_cvt ) ;

    Uint8 *out = ( Uint8 * )std::malloc( pcm.size() ) ;
    if ( !out ) return nullptr ;
    std::memcpy( out, pcm.data(), pcm.size() ) ;
    *OutBytes = ( int )pcm.size() ;
    return out ;
}

static int g_MixInited = 0 ;
static std::unordered_map<int, DesktopSoundEntry> g_Sounds ;
static int g_NextSoundHandle = 1 ;

static int desktop_sound_ensure_init( void )
{
    if ( g_MixInited ) return 0 ;
    if ( !SDL_WasInit( SDL_INIT_AUDIO ) && SDL_InitSubSystem( SDL_INIT_AUDIO ) != 0 ) {
        std::fprintf( stderr, "[DxSoundDesktop] SDL_InitSubSystem(AUDIO) fail: %s\n", SDL_GetError() ) ;
        return -1 ;
    }
    if ( Mix_OpenAudio( 44100, MIX_DEFAULT_FORMAT, 2, 1024 ) != 0 ) {
        std::fprintf( stderr, "[DxSoundDesktop] Mix_OpenAudio fail: %s\n", Mix_GetError() ) ;
        return -1 ;
    }
    Mix_AllocateChannels( 32 ) ;
    g_MixInited = 1 ;
    return 0 ;
}

// DxLib のボリュームスケール (0..10000) → SDL_mixer (0..128) に変換
static inline int desktop_vol_dx_to_mix( int v )
{
    if ( v < 0 ) v = 0 ;
    if ( v > 10000 ) v = 10000 ;
    return ( v * MIX_MAX_VOLUME + 5000 ) / 10000 ;
}

static inline int desktop_vol_0_128_to_mix( int v )
{
    if ( v < 0 ) v = 0 ;
    if ( v > 128 ) v = 128 ;
    return v ;
}

// --- DxLib public API (DxGateway.cpp は DX_NON_SOUND で殺されているので
//     ここで直接ユーザ側 API を提供する) ------------------------------------

extern int LoadSoundMem( const TCHAR *FileName, int BufferNum, int UnionHandle )
{
    (void)BufferNum; (void)UnionHandle;
    if ( !FileName ) return -1 ;
    if ( desktop_sound_ensure_init() != 0 ) return -1 ;

    // TCHAR = char (UNICODE 無効) の前提で単純 cast する
    const char *path = ( const char * )FileName ;

    Mix_Chunk *c = nullptr ;
    Uint8     *raw = nullptr ;

    if ( desktop_path_is_ogg( path ) )
    {
        // bundled libvorbisfile で OGG → PCM S16LE 44100Hz stereo に decode
        int bytes = 0 ;
        raw = desktop_decode_ogg_to_pcm( path, &bytes ) ;
        if ( !raw ) {
            std::fprintf( stderr, "[DxSoundDesktop] OGG decode fail: %s\n", path ) ;
            return -1 ;
        }
        c = Mix_QuickLoad_RAW( raw, ( Uint32 )bytes ) ;
        if ( !c ) { std::free( raw ) ; return -1 ; }
    }
    else if ( desktop_path_is_opus( path ) )
    {
        // bundled opusfile で Opus → PCM 48kHz → 44.1kHz にリサンプル
        int bytes = 0 ;
        raw = desktop_decode_opus_to_pcm( path, &bytes ) ;
        if ( !raw ) {
            std::fprintf( stderr, "[DxSoundDesktop] Opus decode fail: %s\n", path ) ;
            return -1 ;
        }
        c = Mix_QuickLoad_RAW( raw, ( Uint32 )bytes ) ;
        if ( !c ) { std::free( raw ) ; return -1 ; }
    }
    else
    {
        c = Mix_LoadWAV( path ) ;
    }
    if ( !c ) {
        std::fprintf( stderr, "[DxSoundDesktop] LoadSoundMem fail: %s (%s)\n", path, Mix_GetError() ) ;
        return -1 ;
    }
    int h = g_NextSoundHandle++ ;
    DesktopSoundEntry e ;
    e.chunk = c ;
    e.last_channel = -1 ;
    e.volume_0_10000 = 10000 ;
    e.raw_buffer = raw ;
    Mix_VolumeChunk( c, MIX_MAX_VOLUME ) ;
    g_Sounds[ h ] = e ;
    return h ;
}

extern int LoadSoundMemWithStrLen( const TCHAR *FileName, size_t FileNameLength, int BufferNum, int UnionHandle )
{
    (void)FileNameLength;
    return LoadSoundMem( FileName, BufferNum, UnionHandle ) ;
}

// --- Memory-image based load (from byte array, embedded asset 等) ----------
// DxLib の LoadSoundMemByMemImage / LoadSoundMemByMemImageBase。SDL_mixer の
// Mix_LoadWAV_RW は .wav を memory から、音声形式 detection は SDL_mixer に任せる。
// OGG/Opus/MP3 も Mix_LoadWAV_RW が認識 (SDL_mixer 2 系は OGG/MP3/MOD 対応)
extern int LoadSoundMemByMemImageBase( const void *FileImage, size_t FileImageSize,
                                       int BufferNum, int UnionHandle )
{
    (void)BufferNum; (void)UnionHandle;
    if ( !FileImage || FileImageSize == 0 ) return -1 ;
    if ( desktop_sound_ensure_init() != 0 ) return -1 ;

    SDL_RWops *rw = SDL_RWFromConstMem( FileImage, ( int )FileImageSize ) ;
    if ( !rw ) return -1 ;
    Mix_Chunk *c = Mix_LoadWAV_RW( rw, 1 /*freesrc=1 で SDL_RWops を自動解放*/ ) ;
    if ( !c ) {
        std::fprintf( stderr, "[DxSoundDesktop] LoadSoundMemByMemImage fail: %s\n",
                      Mix_GetError() ) ;
        return -1 ;
    }
    int h = g_NextSoundHandle++ ;
    DesktopSoundEntry e ;
    e.chunk = c ;
    e.last_channel = -1 ;
    e.volume_0_10000 = 10000 ;
    e.raw_buffer = nullptr ;   // Mix_LoadWAV_RW が内部で alloc 済
    Mix_VolumeChunk( c, MIX_MAX_VOLUME ) ;
    g_Sounds[ h ] = e ;
    return h ;
}

extern int LoadSoundMemByMemImage( const void *FileImage, size_t FileImageSize,
                                   int BufferNum, int UnionHandle )
{
    return LoadSoundMemByMemImageBase( FileImage, FileImageSize, BufferNum, UnionHandle ) ;
}

extern int LoadSoundMemByMemImageToBufNumSitei( const void *FileImage, size_t FileImageSize,
                                                int BufferNum )
{
    return LoadSoundMemByMemImageBase( FileImage, FileImageSize, BufferNum, -1 ) ;
}

extern int LoadSoundMemBase( const TCHAR *FileName, int BufferNum, int UnionHandle )
{
    return LoadSoundMem( FileName, BufferNum, UnionHandle ) ;
}

// --- LoadSoundMem2 (prelude + loop): 前奏 + 後ループの 2 ファイル合成再生 -----
// チャンネル終了時のコールバックで loop_chunk を再生する。
// SDL_mixer の Mix_ChannelFinished は global 1 callback のため、
// channel → SoundHandle map で「どの handle が終了したか」を引いて loop 起動

static std::map<int, int>  g_Channel2Handle ;   // SDL_mixer channel → SoundHandle
static SDL_mutex          *g_ChannelMutex = nullptr ;

static void desktop_sound_finished_cb( int channel )
{
    int h = -1 ;
    if ( g_ChannelMutex ) SDL_LockMutex( g_ChannelMutex ) ;
    auto it = g_Channel2Handle.find( channel ) ;
    if ( it != g_Channel2Handle.end() ) {
        h = it->second ;
        g_Channel2Handle.erase( it ) ;
    }
    if ( g_ChannelMutex ) SDL_UnlockMutex( g_ChannelMutex ) ;
    if ( h <= 0 ) return ;
    auto sit = g_Sounds.find( h ) ;
    if ( sit == g_Sounds.end() || !sit->second.loop_chunk ) return ;
    // loop_chunk を無限ループで再生開始
    int ch = Mix_PlayChannel( -1, sit->second.loop_chunk, -1 ) ;
    if ( ch >= 0 ) sit->second.last_channel = ch ;
}

static void desktop_install_finished_cb( void )
{
    static int s_installed = 0 ;
    if ( s_installed ) return ;
    if ( !g_ChannelMutex ) g_ChannelMutex = SDL_CreateMutex() ;
    Mix_ChannelFinished( desktop_sound_finished_cb ) ;
    s_installed = 1 ;
}

// 内部ヘルパ: 1 ファイルを読み込んで Mix_Chunk + raw_buffer を返す
// (LoadSoundMem の中身を再利用したいが直接 chunk を返すために抽出)
static Mix_Chunk *desktop_load_chunk_from_file( const char *path, Uint8 **out_raw )
{
    *out_raw = nullptr ;
    if ( !path ) return nullptr ;
    if ( desktop_path_is_ogg( path ) ) {
        int bytes = 0 ;
        Uint8 *raw = desktop_decode_ogg_to_pcm( path, &bytes ) ;
        if ( !raw ) return nullptr ;
        Mix_Chunk *c = Mix_QuickLoad_RAW( raw, ( Uint32 )bytes ) ;
        if ( !c ) { std::free( raw ) ; return nullptr ; }
        *out_raw = raw ;
        return c ;
    }
    if ( desktop_path_is_opus( path ) ) {
        int bytes = 0 ;
        Uint8 *raw = desktop_decode_opus_to_pcm( path, &bytes ) ;
        if ( !raw ) return nullptr ;
        Mix_Chunk *c = Mix_QuickLoad_RAW( raw, ( Uint32 )bytes ) ;
        if ( !c ) { std::free( raw ) ; return nullptr ; }
        *out_raw = raw ;
        return c ;
    }
    return Mix_LoadWAV( path ) ;
}

extern int LoadSoundMem2( const TCHAR *FileName1, const TCHAR *FileName2 )
{
    if ( desktop_sound_ensure_init() != 0 ) return -1 ;
    Uint8 *raw1 = nullptr, *raw2 = nullptr ;
    Mix_Chunk *c1 = desktop_load_chunk_from_file( ( const char * )FileName1, &raw1 ) ;
    Mix_Chunk *c2 = desktop_load_chunk_from_file( ( const char * )FileName2, &raw2 ) ;
    if ( !c1 || !c2 ) {
        if ( c1 ) Mix_FreeChunk( c1 ) ;
        if ( c2 ) Mix_FreeChunk( c2 ) ;
        if ( raw1 ) std::free( raw1 ) ;
        if ( raw2 ) std::free( raw2 ) ;
        std::fprintf( stderr, "[DxSoundDesktop] LoadSoundMem2 fail: %s / %s\n",
                      ( const char * )FileName1, ( const char * )FileName2 ) ;
        return -1 ;
    }
    int h = g_NextSoundHandle++ ;
    DesktopSoundEntry e ;
    e.chunk           = c1 ;
    e.raw_buffer      = raw1 ;
    e.loop_chunk      = c2 ;
    e.loop_raw_buffer = raw2 ;
    e.volume_0_10000  = 10000 ;
    e.last_channel    = -1 ;
    Mix_VolumeChunk( c1, MIX_MAX_VOLUME ) ;
    Mix_VolumeChunk( c2, MIX_MAX_VOLUME ) ;
    g_Sounds[ h ] = e ;
    desktop_install_finished_cb() ;
    return h ;
}

// --- 3D サウンド: リスナー位置/前方ベクトル + per-sound position/radius ----
// SDL_mixer の Mix_SetPosition(channel, angle_deg, distance_0_255) で近似
// (フル 3D ではなく方角と距離減衰の単純モデル)
static float g_Listener_X = 0, g_Listener_Y = 0, g_Listener_Z = 0 ;
static float g_ListenerFront_X = 0, g_ListenerFront_Y = 0, g_ListenerFront_Z = 1.0f ;

extern int Set3DSoundListenerPosAndFrontPos_UpVecY( VECTOR Position, VECTOR FrontPosition )
{
    g_Listener_X = Position.x ; g_Listener_Y = Position.y ; g_Listener_Z = Position.z ;
    g_ListenerFront_X = FrontPosition.x - Position.x ;
    g_ListenerFront_Y = FrontPosition.y - Position.y ;
    g_ListenerFront_Z = FrontPosition.z - Position.z ;
    float l = std::sqrt( g_ListenerFront_X * g_ListenerFront_X
                       + g_ListenerFront_Y * g_ListenerFront_Y
                       + g_ListenerFront_Z * g_ListenerFront_Z ) ;
    if ( l > 0.0001f ) {
        g_ListenerFront_X /= l ; g_ListenerFront_Y /= l ; g_ListenerFront_Z /= l ;
    }
    return 0 ;
}

extern int Set3DSoundListenerPosAndFrontPosAndUpVec( VECTOR Position, VECTOR FrontPosition, VECTOR /*UpVector*/ )
{
    return Set3DSoundListenerPosAndFrontPos_UpVecY( Position, FrontPosition ) ;
}

extern int Set3DSoundListenerVelocity( VECTOR /*Velocity*/ ) { return 0 ; }   // doppler 未対応
extern int Set3DSoundListenerConeAngle( float, float ) { return 0 ; }
extern int Set3DSoundListenerConeVolume( float, float ) { return 0 ; }

extern int Set3DPositionSoundMem( VECTOR Position, int SoundHandle )
{
    auto it = g_Sounds.find( SoundHandle ) ;
    if ( it == g_Sounds.end() ) return -1 ;
    it->second.has_3d_pos = true ;
    it->second.pos_x = Position.x ; it->second.pos_y = Position.y ; it->second.pos_z = Position.z ;
    return 0 ;
}
extern int SetNextPlay3DPositionSoundMem( VECTOR Position, int SoundHandle )
{
    return Set3DPositionSoundMem( Position, SoundHandle ) ;
}
extern int Set3DRadiusSoundMem( float Radius, int SoundHandle )
{
    auto it = g_Sounds.find( SoundHandle ) ;
    if ( it == g_Sounds.end() ) return -1 ;
    it->second.radius = Radius > 0.0f ? Radius : 1000.0f ;
    return 0 ;
}
extern int SetNextPlay3DRadiusSoundMem( float Radius, int SoundHandle )
{
    return Set3DRadiusSoundMem( Radius, SoundHandle ) ;
}
extern int Set3DVelocitySoundMem( VECTOR /*Velocity*/, int /*SoundHandle*/ ) { return 0 ; }
extern int SetNextPlay3DVelocitySoundMem( VECTOR /*Velocity*/, int /*SoundHandle*/ ) { return 0 ; }

// listener 基準で sound source の方角 (angle 0..360 度、0=前方、時計回り) と
// 距離減衰 0..255 (Mix_SetPosition の規約) を計算
static void desktop_compute_3d_pan( const DesktopSoundEntry &e, int *out_angle, int *out_dist )
{
    float dx = e.pos_x - g_Listener_X ;
    float dy = e.pos_y - g_Listener_Y ;
    float dz = e.pos_z - g_Listener_Z ;
    float dist = std::sqrt( dx * dx + dy * dy + dz * dz ) ;
    int dist255 = ( int )( ( dist / e.radius ) * 255.0f ) ;
    if ( dist255 < 0 ) dist255 = 0 ;
    if ( dist255 > 255 ) dist255 = 255 ;
    // XZ 平面で listener forward と source 方向の角度
    float fx = g_ListenerFront_X, fz = g_ListenerFront_Z ;
    // forward を 0 度として時計回りに angle
    float ang = std::atan2( dx, dz ) - std::atan2( fx, fz ) ;
    int   ang_deg = ( int )( ang * 180.0f / 3.14159265f ) ;
    while ( ang_deg <    0 ) ang_deg += 360 ;
    while ( ang_deg >= 360 ) ang_deg -= 360 ;
    *out_angle = ang_deg ;
    *out_dist  = dist255 ;
}

extern int PlaySoundMem( int SoundHandle, int PlayType, int TopPositionFlag )
{
    (void)TopPositionFlag;
    auto it = g_Sounds.find( SoundHandle ) ;
    if ( it == g_Sounds.end() ) return -1 ;

    bool has_loop_part = ( it->second.loop_chunk != nullptr ) ;
    // 2-part sound では prelude を 1 回再生、終了 callback で loop_chunk を ループ
    // 通常 sound では PlayType の LOOPBIT で loop 制御 (-1 = 無限)
    int loops ;
    if ( has_loop_part ) {
        loops = 0 ;  // prelude は必ず 1 回
    } else {
        loops = ( PlayType & DX_PLAYTYPE_LOOPBIT ) ? -1 : 0 ;
    }
    int ch = Mix_PlayChannel( -1, it->second.chunk, loops ) ;
    it->second.last_channel = ch ;
    if ( ch >= 0 && has_loop_part ) {
        if ( g_ChannelMutex ) SDL_LockMutex( g_ChannelMutex ) ;
        g_Channel2Handle[ ch ] = SoundHandle ;
        if ( g_ChannelMutex ) SDL_UnlockMutex( g_ChannelMutex ) ;
    }
    if ( ch >= 0 && it->second.has_3d_pos ) {
        int ang = 0, dist = 0 ;
        desktop_compute_3d_pan( it->second, &ang, &dist ) ;
        Mix_SetPosition( ch, ( Sint16 )ang, ( Uint8 )dist ) ;
    }
    return 0 ;
}

extern int StopSoundMem( int SoundHandle, int IsNextLoopEnd )
{
    (void)IsNextLoopEnd;
    auto it = g_Sounds.find( SoundHandle ) ;
    if ( it == g_Sounds.end() ) return -1 ;
    if ( it->second.last_channel >= 0 ) Mix_HaltChannel( it->second.last_channel ) ;
    it->second.last_channel = -1 ;
    return 0 ;
}

extern int CheckSoundMem( int SoundHandle )
{
    auto it = g_Sounds.find( SoundHandle ) ;
    if ( it == g_Sounds.end() ) return -1 ;
    if ( it->second.last_channel < 0 ) return 0 ;
    return Mix_Playing( it->second.last_channel ) ? 1 : 0 ;
}

extern int SetVolumeSoundMem( int VolumePal, int SoundHandle )
{
    auto it = g_Sounds.find( SoundHandle ) ;
    if ( it == g_Sounds.end() ) return -1 ;
    it->second.volume_0_10000 = VolumePal ;
    Mix_VolumeChunk( it->second.chunk, desktop_vol_dx_to_mix( VolumePal ) ) ;
    return 0 ;
}

extern int ChangeVolumeSoundMem( int VolumePal, int SoundHandle )
{
    return SetVolumeSoundMem( VolumePal, SoundHandle ) ;
}

// --- Pan (左右バランス) 制御: SDL_mixer Mix_SetPanning (0..255 左/右) ---
// DxLib の SetPanSoundMem は -10000..10000 の範囲 (0=中央、負=左、正=右)
// Gateway は DX_NON_SOUND=1 で lib から除外されているので、
// ここで SetPanSoundMem をそのまま定義 (他の PlaySoundMem 等と同じパターン)
extern int SetPanSoundMem( int PanPal, int SoundHandle )
{
    auto it = g_Sounds.find( SoundHandle ) ;
    if ( it == g_Sounds.end() ) return -1 ;
    if ( it->second.last_channel < 0 ) return 0 ;  // 未再生時は no-op
    int clamped = PanPal ;
    if ( clamped < -10000 ) clamped = -10000 ;
    if ( clamped >  10000 ) clamped =  10000 ;
    int left  = ( clamped <= 0 ) ? 255 : ( 255 - ( clamped * 255 / 10000 ) ) ;
    int right = ( clamped >= 0 ) ? 255 : ( 255 + ( clamped * 255 / 10000 ) ) ;
    if ( left  < 0 ) left  = 0 ; if ( left  > 255 ) left  = 255 ;
    if ( right < 0 ) right = 0 ; if ( right > 255 ) right = 255 ;
    Mix_SetPanning( it->second.last_channel, ( Uint8 )left, ( Uint8 )right ) ;
    return 0 ;
}

extern int ChangePanSoundMem( int PanPal, int SoundHandle )
{
    return SetPanSoundMem( PanPal, SoundHandle ) ;
}

extern int DeleteSoundMem( int SoundHandle )
{
    auto it = g_Sounds.find( SoundHandle ) ;
    if ( it == g_Sounds.end() ) return -1 ;
    if ( it->second.last_channel >= 0 ) Mix_HaltChannel( it->second.last_channel ) ;
    if ( it->second.chunk )           Mix_FreeChunk( it->second.chunk ) ;
    if ( it->second.raw_buffer )      std::free( it->second.raw_buffer ) ;
    if ( it->second.loop_chunk )      Mix_FreeChunk( it->second.loop_chunk ) ;
    if ( it->second.loop_raw_buffer ) std::free( it->second.loop_raw_buffer ) ;
    g_Sounds.erase( it ) ;
    return 0 ;
}

extern int InitSoundMem( void )
{
    for ( auto &p : g_Sounds ) {
        if ( p.second.last_channel >= 0 ) Mix_HaltChannel( p.second.last_channel ) ;
        if ( p.second.chunk )           Mix_FreeChunk( p.second.chunk ) ;
        if ( p.second.raw_buffer )      std::free( p.second.raw_buffer ) ;
        if ( p.second.loop_chunk )      Mix_FreeChunk( p.second.loop_chunk ) ;
        if ( p.second.loop_raw_buffer ) std::free( p.second.loop_raw_buffer ) ;
    }
    g_Sounds.clear() ;
    if ( g_ChannelMutex ) {
        SDL_LockMutex( g_ChannelMutex ) ;
        g_Channel2Handle.clear() ;
        SDL_UnlockMutex( g_ChannelMutex ) ;
    }
    return 0 ;
}

// --- SoftSound (procedural waveform manipulation) -------------------------
// software side で PCM サンプルを直接 read/write できる buffer。signal generation /
// audio analysis / WAV save 用途。LoadSoundMemFromSoftSound で playable な
// Mix_Chunk に変換できる。
struct DesktopSoftSoundEntry {
    int       channels = 2 ;        // 1 or 2
    int       bits     = 16 ;       // 8, 16, or 32 (float)
    int       rate     = 44100 ;
    int       is_float = 0 ;        // 1 で 32bit float
    long long sample_num = 0 ;
    Uint8    *pcm = nullptr ;       // size = sample_num * channels * (bits/8)
} ;
static std::unordered_map<int, DesktopSoftSoundEntry> g_SoftSounds ;
static int g_NextSoftSoundHandle = 1 ;

static int desktop_softsound_bytes_per_sample( const DesktopSoftSoundEntry &e )
{
    return e.channels * ( e.bits / 8 ) ;
}

extern int MakeSoftSoundCustom( int ChannelNum, int BitsPerSample, int SamplesPerSec,
                                LONGLONG SampleNum, int IsFloatType )
{
    if ( ChannelNum < 1 || ChannelNum > 2 ) return -1 ;
    if ( BitsPerSample != 8 && BitsPerSample != 16 && BitsPerSample != 32 ) return -1 ;
    if ( SampleNum < 0 ) return -1 ;
    DesktopSoftSoundEntry e ;
    e.channels   = ChannelNum ;
    e.bits       = BitsPerSample ;
    e.rate       = SamplesPerSec ;
    e.is_float   = IsFloatType ;
    e.sample_num = SampleNum ;
    size_t bytes = ( size_t )SampleNum * desktop_softsound_bytes_per_sample( e ) ;
    e.pcm = ( Uint8 * )std::calloc( 1, bytes ? bytes : 1 ) ;
    if ( !e.pcm ) return -1 ;
    int h = g_NextSoftSoundHandle++ ;
    g_SoftSounds[ h ] = e ;
    return h ;
}

extern int MakeSoftSound2Ch16Bit44KHz( LONGLONG SampleNum ) { return MakeSoftSoundCustom( 2, 16, 44100, SampleNum, 0 ) ; }
extern int MakeSoftSound2Ch16Bit22KHz( LONGLONG SampleNum ) { return MakeSoftSoundCustom( 2, 16, 22050, SampleNum, 0 ) ; }
extern int MakeSoftSound2Ch8Bit44KHz ( LONGLONG SampleNum ) { return MakeSoftSoundCustom( 2,  8, 44100, SampleNum, 0 ) ; }
extern int MakeSoftSound2Ch8Bit22KHz ( LONGLONG SampleNum ) { return MakeSoftSoundCustom( 2,  8, 22050, SampleNum, 0 ) ; }
extern int MakeSoftSound1Ch16Bit44KHz( LONGLONG SampleNum ) { return MakeSoftSoundCustom( 1, 16, 44100, SampleNum, 0 ) ; }
extern int MakeSoftSound1Ch16Bit22KHz( LONGLONG SampleNum ) { return MakeSoftSoundCustom( 1, 16, 22050, SampleNum, 0 ) ; }
extern int MakeSoftSound1Ch8Bit44KHz ( LONGLONG SampleNum ) { return MakeSoftSoundCustom( 1,  8, 44100, SampleNum, 0 ) ; }
extern int MakeSoftSound1Ch8Bit22KHz ( LONGLONG SampleNum ) { return MakeSoftSoundCustom( 1,  8, 22050, SampleNum, 0 ) ; }

// MakeSoftSound( UseFormat_SoftSoundHandle, SampleNum ) — フォーマットを既存
// SoftSound から複製して新規作成
extern int MakeSoftSound( int UseFormat_SoftSoundHandle, LONGLONG SampleNum )
{
    auto it = g_SoftSounds.find( UseFormat_SoftSoundHandle ) ;
    if ( it == g_SoftSounds.end() ) return -1 ;
    return MakeSoftSoundCustom( it->second.channels, it->second.bits, it->second.rate,
                                SampleNum, it->second.is_float ) ;
}

extern int LoadSoftSound( const TCHAR *FileName )
{
    if ( !FileName ) return -1 ;
    if ( desktop_sound_ensure_init() != 0 ) return -1 ;
    Mix_Chunk *c = Mix_LoadWAV( ( const char * )FileName ) ;
    if ( !c ) return -1 ;
    // SDL_mixer は Mix_OpenAudio で指定したフォーマット (44100 16bit stereo) に
    // 変換済の chunk を返す。abuf/alen から生 PCM を取り出す
    int h = MakeSoftSoundCustom( 2, 16, 44100, ( LONGLONG )( c->alen / 4 ), 0 ) ;
    if ( h < 0 ) { Mix_FreeChunk( c ) ; return -1 ; }
    auto sit = g_SoftSounds.find( h ) ;
    std::memcpy( sit->second.pcm, c->abuf, c->alen ) ;
    Mix_FreeChunk( c ) ;
    return h ;
}

extern int LoadSoftSoundWithStrLen( const TCHAR *FileName, size_t /*len*/ ) { return LoadSoftSound( FileName ) ; }

extern int LoadSoftSoundFromMemImage( const void *FileImage, size_t FileImageSize )
{
    if ( !FileImage || FileImageSize == 0 ) return -1 ;
    if ( desktop_sound_ensure_init() != 0 ) return -1 ;
    SDL_RWops *rw = SDL_RWFromConstMem( FileImage, ( int )FileImageSize ) ;
    if ( !rw ) return -1 ;
    Mix_Chunk *c = Mix_LoadWAV_RW( rw, 1 ) ;
    if ( !c ) return -1 ;
    int h = MakeSoftSoundCustom( 2, 16, 44100, ( LONGLONG )( c->alen / 4 ), 0 ) ;
    if ( h < 0 ) { Mix_FreeChunk( c ) ; return -1 ; }
    auto sit = g_SoftSounds.find( h ) ;
    std::memcpy( sit->second.pcm, c->abuf, c->alen ) ;
    Mix_FreeChunk( c ) ;
    return h ;
}

extern int DeleteSoftSound( int SoftSoundHandle )
{
    auto it = g_SoftSounds.find( SoftSoundHandle ) ;
    if ( it == g_SoftSounds.end() ) return -1 ;
    if ( it->second.pcm ) std::free( it->second.pcm ) ;
    g_SoftSounds.erase( it ) ;
    return 0 ;
}

extern int InitSoftSound( void )
{
    for ( auto &p : g_SoftSounds ) if ( p.second.pcm ) std::free( p.second.pcm ) ;
    g_SoftSounds.clear() ;
    return 0 ;
}

extern LONGLONG GetSoftSoundSampleNum( int SoftSoundHandle )
{
    auto it = g_SoftSounds.find( SoftSoundHandle ) ;
    if ( it == g_SoftSounds.end() ) return 0 ;
    return it->second.sample_num ;
}

extern int GetSoftSoundFormat( int SoftSoundHandle, int *Channels, int *BitsPerSample,
                                int *SamplesPerSec, int *IsFloatType )
{
    auto it = g_SoftSounds.find( SoftSoundHandle ) ;
    if ( it == g_SoftSounds.end() ) return -1 ;
    if ( Channels )      *Channels      = it->second.channels ;
    if ( BitsPerSample ) *BitsPerSample = it->second.bits ;
    if ( SamplesPerSec ) *SamplesPerSec = it->second.rate ;
    if ( IsFloatType )   *IsFloatType   = it->second.is_float ;
    return 0 ;
}

// 1 サンプル分の値を読み取る (整数)
extern int ReadSoftSoundData( int SoftSoundHandle, LONGLONG SamplePosition,
                               int *Channel1, int *Channel2 )
{
    auto it = g_SoftSounds.find( SoftSoundHandle ) ;
    if ( it == g_SoftSounds.end() ) return -1 ;
    auto &e = it->second ;
    if ( SamplePosition < 0 || SamplePosition >= e.sample_num ) return -1 ;
    int bps = desktop_softsound_bytes_per_sample( e ) ;
    Uint8 *p = e.pcm + ( size_t )SamplePosition * bps ;
    auto read_one = [ &e ]( const Uint8 *src ) -> int {
        if ( e.bits == 16 ) return ( int )( ( int16_t )( ( ( uint16_t )src[ 0 ] ) | ( ( uint16_t )src[ 1 ] << 8 ) ) ) ;
        if ( e.bits ==  8 ) return ( int )src[ 0 ] - 128 ;
        if ( e.bits == 32 && e.is_float ) {
            float f ; std::memcpy( &f, src, 4 ) ;
            int v = ( int )( f * 32767.0f ) ;
            if ( v >  32767 ) v =  32767 ;
            if ( v < -32768 ) v = -32768 ;
            return v ;
        }
        return 0 ;
    } ;
    int ch1 = read_one( p ) ;
    int ch2 = ( e.channels >= 2 ) ? read_one( p + ( e.bits / 8 ) ) : ch1 ;
    if ( Channel1 ) *Channel1 = ch1 ;
    if ( Channel2 ) *Channel2 = ch2 ;
    return 0 ;
}

extern int ReadSoftSoundDataF( int SoftSoundHandle, LONGLONG SamplePosition,
                                float *Channel1, float *Channel2 )
{
    int c1 = 0, c2 = 0 ;
    if ( ReadSoftSoundData( SoftSoundHandle, SamplePosition, &c1, &c2 ) < 0 ) return -1 ;
    if ( Channel1 ) *Channel1 = ( float )c1 / 32767.0f ;
    if ( Channel2 ) *Channel2 = ( float )c2 / 32767.0f ;
    return 0 ;
}

extern int WriteSoftSoundData( int SoftSoundHandle, LONGLONG SamplePosition,
                                int Channel1, int Channel2 )
{
    auto it = g_SoftSounds.find( SoftSoundHandle ) ;
    if ( it == g_SoftSounds.end() ) return -1 ;
    auto &e = it->second ;
    if ( SamplePosition < 0 || SamplePosition >= e.sample_num ) return -1 ;
    int bps = desktop_softsound_bytes_per_sample( e ) ;
    Uint8 *p = e.pcm + ( size_t )SamplePosition * bps ;
    auto write_one = [ &e ]( Uint8 *dst, int v ) {
        if ( e.bits == 16 ) {
            int16_t s = ( int16_t )( ( v >  32767 ) ? 32767 : ( v < -32768 ) ? -32768 : v ) ;
            dst[ 0 ] = ( Uint8 )( s & 0xff ) ;
            dst[ 1 ] = ( Uint8 )( ( s >> 8 ) & 0xff ) ;
        } else if ( e.bits == 8 ) {
            int u = v + 128 ;
            if ( u <   0 ) u =   0 ;
            if ( u > 255 ) u = 255 ;
            dst[ 0 ] = ( Uint8 )u ;
        } else if ( e.bits == 32 && e.is_float ) {
            float f = ( float )v / 32767.0f ;
            std::memcpy( dst, &f, 4 ) ;
        }
    } ;
    write_one( p, Channel1 ) ;
    if ( e.channels >= 2 ) write_one( p + ( e.bits / 8 ), Channel2 ) ;
    return 0 ;
}

extern int WriteSoftSoundDataF( int SoftSoundHandle, LONGLONG SamplePosition,
                                 float Channel1, float Channel2 )
{
    int c1 = ( int )( Channel1 * 32767.0f ) ;
    int c2 = ( int )( Channel2 * 32767.0f ) ;
    return WriteSoftSoundData( SoftSoundHandle, SamplePosition, c1, c2 ) ;
}

// SoftSound を WAV (PCM) ファイルに書き出す
// RIFF header (12B) + fmt chunk (24B) + data chunk header (8B) + raw PCM
extern int SaveSoftSound( int SoftSoundHandle, const TCHAR *FileName )
{
    auto it = g_SoftSounds.find( SoftSoundHandle ) ;
    if ( it == g_SoftSounds.end() ) return -1 ;
    auto &e = it->second ;
    if ( !e.pcm || !FileName ) return -1 ;

    FILE *f = std::fopen( ( const char * )FileName, "wb" ) ;
    if ( !f ) return -1 ;

    auto wr_u32 = [&]( uint32_t v ) {
        Uint8 b[ 4 ] = { ( Uint8 )(  v        & 0xff ), ( Uint8 )( ( v >>  8 ) & 0xff ),
                         ( Uint8 )( ( v >> 16 ) & 0xff ), ( Uint8 )( ( v >> 24 ) & 0xff ) } ;
        std::fwrite( b, 1, 4, f ) ;
    } ;
    auto wr_u16 = [&]( uint16_t v ) {
        Uint8 b[ 2 ] = { ( Uint8 )( v & 0xff ), ( Uint8 )( ( v >> 8 ) & 0xff ) } ;
        std::fwrite( b, 1, 2, f ) ;
    } ;

    int bytes_per_sample = desktop_softsound_bytes_per_sample( e ) ;
    uint32_t pcm_bytes   = ( uint32_t )( ( size_t )e.sample_num * bytes_per_sample ) ;
    uint16_t fmt_tag     = e.is_float ? 3 /*IEEE float*/ : 1 /*PCM*/ ;
    uint32_t byte_rate   = ( uint32_t )( e.rate * bytes_per_sample ) ;

    // RIFF header
    std::fwrite( "RIFF", 1, 4, f ) ;
    wr_u32( 36 + pcm_bytes ) ;          // total file size - 8
    std::fwrite( "WAVE", 1, 4, f ) ;
    // fmt chunk
    std::fwrite( "fmt ", 1, 4, f ) ;
    wr_u32( 16 ) ;                      // fmt chunk size (PCM = 16)
    wr_u16( fmt_tag ) ;                 // 1 = PCM, 3 = IEEE float
    wr_u16( ( uint16_t )e.channels ) ;
    wr_u32( ( uint32_t )e.rate ) ;
    wr_u32( byte_rate ) ;
    wr_u16( ( uint16_t )bytes_per_sample ) ;  // block align
    wr_u16( ( uint16_t )e.bits ) ;
    // data chunk
    std::fwrite( "data", 1, 4, f ) ;
    wr_u32( pcm_bytes ) ;
    std::fwrite( e.pcm, 1, pcm_bytes, f ) ;
    std::fclose( f ) ;
    return 0 ;
}

extern int SaveSoftSoundWithStrLen( int SoftSoundHandle, const TCHAR *FileName, size_t /*len*/ )
{
    return SaveSoftSound( SoftSoundHandle, FileName ) ;
}

// SoftSound から playable な Mix_Chunk を作って Sound handle を返す
extern int LoadSoundMemFromSoftSound( int SoftSoundHandle, int /*BufferNum*/ )
{
    auto it = g_SoftSounds.find( SoftSoundHandle ) ;
    if ( it == g_SoftSounds.end() ) return -1 ;
    auto &e = it->second ;
    if ( !e.pcm || e.sample_num <= 0 ) return -1 ;
    if ( desktop_sound_ensure_init() != 0 ) return -1 ;

    // PCM を SDL_mixer の形式 (16bit stereo 44100Hz) に揃える必要がある。
    // 既に同じ format の場合はコピーで済む、それ以外は SDL_AudioCVT で変換
    SDL_AudioFormat src_fmt = AUDIO_S16LSB ;
    if ( e.bits == 8 ) src_fmt = AUDIO_U8 ;
    else if ( e.bits == 32 && e.is_float ) src_fmt = AUDIO_F32LSB ;

    SDL_AudioCVT cvt ;
    if ( SDL_BuildAudioCVT( &cvt, src_fmt, ( Uint8 )e.channels, e.rate,
                            AUDIO_S16LSB, 2, 44100 ) < 0 ) return -1 ;
    size_t src_bytes = ( size_t )e.sample_num * desktop_softsound_bytes_per_sample( e ) ;
    cvt.len = ( int )src_bytes ;
    cvt.buf = ( Uint8 * )std::malloc( ( size_t )cvt.len * cvt.len_mult ) ;
    if ( !cvt.buf ) return -1 ;
    std::memcpy( cvt.buf, e.pcm, src_bytes ) ;
    if ( cvt.needed ) {
        if ( SDL_ConvertAudio( &cvt ) < 0 ) { std::free( cvt.buf ) ; return -1 ; }
    }
    Mix_Chunk *c = Mix_QuickLoad_RAW( cvt.buf, ( Uint32 )cvt.len_cvt ) ;
    if ( !c ) { std::free( cvt.buf ) ; return -1 ; }

    int h = g_NextSoundHandle++ ;
    DesktopSoundEntry se ;
    se.chunk = c ;
    se.raw_buffer = cvt.buf ;   // Mix_QuickLoad_RAW は所有しないので保持
    se.last_channel = -1 ;
    se.volume_0_10000 = 10000 ;
    Mix_VolumeChunk( c, MIX_MAX_VOLUME ) ;
    g_Sounds[ h ] = se ;
    return h ;
}

// --- Music (BGM track、SDL_mixer Mix_Music 経由) ----------------------------
// DxLib の PlayMusic は MIDI 専用だったが、SDL_mixer の Mix_LoadMUS は
// MIDI / OGG / MP3 / MOD / WAV を統一的に扱う。よって PlayMusic で BGM として
// 任意形式を再生できる (拡張)。Music は常に 1 track、PlaySoundMem の複数 sfx
// と共存可能。
struct DesktopMusicEntry { Mix_Music *mus ; } ;
static std::unordered_map<int, DesktopMusicEntry> g_Musics ;
static int g_NextMusicHandle = 1 ;
static int g_MusicVolume_0_10000 = 10000 ;  // 0..10000 範囲で保持

extern int LoadMusicMem( const TCHAR *FileName )
{
    if ( !FileName ) return -1 ;
    if ( desktop_sound_ensure_init() != 0 ) return -1 ;
    Mix_Music *m = Mix_LoadMUS( ( const char * )FileName ) ;
    if ( !m ) {
        std::fprintf( stderr, "[DxSoundDesktop] LoadMusicMem fail: %s (%s)\n",
                      FileName, Mix_GetError() ) ;
        return -1 ;
    }
    int h = g_NextMusicHandle++ ;
    g_Musics[ h ] = { m } ;
    return h ;
}

extern int LoadMusicMemWithStrLen( const TCHAR *FileName, size_t /*FileNameLength*/ )
{
    return LoadMusicMem( FileName ) ;
}

extern int LoadMusicMemByMemImage( const void *FileImage, size_t FileImageSize )
{
    if ( !FileImage || FileImageSize == 0 ) return -1 ;
    if ( desktop_sound_ensure_init() != 0 ) return -1 ;
    SDL_RWops *rw = SDL_RWFromConstMem( FileImage, ( int )FileImageSize ) ;
    if ( !rw ) return -1 ;
    Mix_Music *m = Mix_LoadMUS_RW( rw, 1 ) ;
    if ( !m ) {
        std::fprintf( stderr, "[DxSoundDesktop] LoadMusicMemByMemImage fail: %s\n",
                      Mix_GetError() ) ;
        return -1 ;
    }
    int h = g_NextMusicHandle++ ;
    g_Musics[ h ] = { m } ;
    return h ;
}

extern int PlayMusicMem( int MusicHandle, int PlayType )
{
    auto it = g_Musics.find( MusicHandle ) ;
    if ( it == g_Musics.end() ) return -1 ;
    int loops = ( PlayType & DX_PLAYTYPE_LOOPBIT ) ? -1 : 0 ;
    Mix_VolumeMusic( desktop_vol_dx_to_mix( g_MusicVolume_0_10000 ) ) ;
    if ( Mix_PlayMusic( it->second.mus, loops ) < 0 ) return -1 ;
    return 0 ;
}

extern int StopMusicMem( int /*MusicHandle*/ )
{
    Mix_HaltMusic() ;
    return 0 ;
}

extern int CheckMusicMem( int MusicHandle )
{
    auto it = g_Musics.find( MusicHandle ) ;
    if ( it == g_Musics.end() ) return -1 ;
    return Mix_PlayingMusic() ? 1 : 0 ;
}

extern int SetVolumeMusicMem( int Volume, int /*MusicHandle*/ )
{
    g_MusicVolume_0_10000 = Volume ;
    Mix_VolumeMusic( desktop_vol_dx_to_mix( Volume ) ) ;
    return 0 ;
}

// 単一 Music track API (DxLib 既定では 1 MIDI のみ)
static int g_GlobalMusic = -1 ;

extern int PlayMusic( const TCHAR *FileName, int PlayType )
{
    if ( g_GlobalMusic > 0 ) { StopMusicMem( g_GlobalMusic ) ; }
    int h = LoadMusicMem( FileName ) ;
    if ( h < 0 ) return -1 ;
    g_GlobalMusic = h ;
    return PlayMusicMem( h, PlayType ) ;
}

extern int PlayMusicWithStrLen( const TCHAR *FileName, size_t /*FileNameLength*/, int PlayType )
{
    return PlayMusic( FileName, PlayType ) ;
}

extern int PlayMusicByMemImage( const void *FileImage, size_t FileImageSize, int PlayType )
{
    if ( g_GlobalMusic > 0 ) { StopMusicMem( g_GlobalMusic ) ; }
    int h = LoadMusicMemByMemImage( FileImage, FileImageSize ) ;
    if ( h < 0 ) return -1 ;
    g_GlobalMusic = h ;
    return PlayMusicMem( h, PlayType ) ;
}

extern int SetVolumeMusic( int Volume ) { g_MusicVolume_0_10000 = Volume ; Mix_VolumeMusic( desktop_vol_dx_to_mix( Volume ) ) ; return 0 ; }
extern int StopMusic( void )            { Mix_HaltMusic() ; return 0 ; }
extern int CheckMusic( void )           { return Mix_PlayingMusic() ? 1 : 0 ; }

// DxSystem から呼ばれる可能性があるもの
extern int InitializeSoundSystem( void )
{
    return desktop_sound_ensure_init() ;
}

extern int TerminateSoundSystem( void )
{
    if ( !g_MixInited ) return 0 ;
    InitSoundMem() ;
    Mix_CloseAudio() ;
    g_MixInited = 0 ;
    return 0 ;
}

#ifndef DX_NON_NAMESPACE
} // end namespace DxLib
#endif

