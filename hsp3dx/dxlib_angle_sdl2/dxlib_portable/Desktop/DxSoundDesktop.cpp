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

#include <cstdio>
#include <cstring>
#include <unordered_map>
#include <string>

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

// SoundHandle → Mix_Chunk* (WAV/OGG/短尺効果音)
struct DesktopSoundEntry {
    Mix_Chunk *chunk = nullptr ;
    int last_channel = -1 ;
    int volume_0_10000 = 10000 ; // DxLib 標準は 0..10000
} ;

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

    Mix_Chunk *c = Mix_LoadWAV( path ) ;
    if ( !c ) {
        std::fprintf( stderr, "[DxSoundDesktop] LoadSoundMem fail: %s (%s)\n", path, Mix_GetError() ) ;
        return -1 ;
    }
    int h = g_NextSoundHandle++ ;
    DesktopSoundEntry e ;
    e.chunk = c ;
    e.last_channel = -1 ;
    e.volume_0_10000 = 10000 ;
    Mix_VolumeChunk( c, MIX_MAX_VOLUME ) ;
    g_Sounds[ h ] = e ;
    return h ;
}

extern int LoadSoundMemWithStrLen( const TCHAR *FileName, size_t FileNameLength, int BufferNum, int UnionHandle )
{
    (void)FileNameLength;
    return LoadSoundMem( FileName, BufferNum, UnionHandle ) ;
}

extern int LoadSoundMemBase( const TCHAR *FileName, int BufferNum, int UnionHandle )
{
    return LoadSoundMem( FileName, BufferNum, UnionHandle ) ;
}

extern int PlaySoundMem( int SoundHandle, int PlayType, int TopPositionFlag )
{
    (void)TopPositionFlag;
    auto it = g_Sounds.find( SoundHandle ) ;
    if ( it == g_Sounds.end() ) return -1 ;

    int loops = ( PlayType & DX_PLAYTYPE_LOOPBIT ) ? -1 : 0 ;
    int ch = Mix_PlayChannel( -1, it->second.chunk, loops ) ;
    it->second.last_channel = ch ;
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

extern int DeleteSoundMem( int SoundHandle )
{
    auto it = g_Sounds.find( SoundHandle ) ;
    if ( it == g_Sounds.end() ) return -1 ;
    if ( it->second.last_channel >= 0 ) Mix_HaltChannel( it->second.last_channel ) ;
    if ( it->second.chunk ) Mix_FreeChunk( it->second.chunk ) ;
    g_Sounds.erase( it ) ;
    return 0 ;
}

extern int InitSoundMem( void )
{
    for ( auto &p : g_Sounds ) {
        if ( p.second.last_channel >= 0 ) Mix_HaltChannel( p.second.last_channel ) ;
        if ( p.second.chunk ) Mix_FreeChunk( p.second.chunk ) ;
    }
    g_Sounds.clear() ;
    return 0 ;
}

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

