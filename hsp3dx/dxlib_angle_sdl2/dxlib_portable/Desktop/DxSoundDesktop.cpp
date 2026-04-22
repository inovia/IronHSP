//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2_mixer) 用 サウンド 実装 (バイパス)
//
//      DxLib の sound 系 1679 行を完全移植するのは重いため、Stage 19 のフォント
//      と同様「バイパス方式」で hsp3dx 側から直接呼べるヘルパを提供する。
//      DX_NON_SOUND=1 は維持 (DxLib 内部 sound 系は全停止)。
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#include "../DxCompileConfig.h"

#include <SDL.h>
#include <SDL_mixer.h>

#include <cstdio>
#include <cstring>
#include <unordered_map>
#include <string>

namespace {
    int                                         g_MixInited = 0 ;
    std::unordered_map<int, Mix_Chunk *>        g_Chunks ;
    std::unordered_map<int, Mix_Music *>        g_Musics ;
    int                                         g_NextSoundHandle = 1 ;
    int                                         g_NextMusicHandle = 1 ;

    int ensure_init()
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
}

// --- API (extern "C" で hsp3dx 側から直接呼べる) -------------------------

// 効果音 (WAV/OGG/MP3) を読み込む。-1 なら失敗
extern "C" int DxDesktop_LoadSound( const char *path_utf8 )
{
    if ( ensure_init() != 0 ) return -1 ;
    Mix_Chunk *c = Mix_LoadWAV( path_utf8 ) ;
    if ( !c ) {
        std::fprintf( stderr, "[DxSoundDesktop] LoadSound fail: %s (%s)\n", path_utf8, Mix_GetError() ) ;
        return -1 ;
    }
    int h = g_NextSoundHandle++ ;
    g_Chunks[ h ] = c ;
    return h ;
}

extern "C" int DxDesktop_PlaySound( int handle, int loops /* 0=once */ )
{
    auto it = g_Chunks.find( handle ) ;
    if ( it == g_Chunks.end() ) return -1 ;
    return Mix_PlayChannel( -1, it->second, loops ) ;
}

extern "C" int DxDesktop_StopSound( int handle )
{
    (void)handle; // handle ごとではなく全チャンネル停止 (MVP)
    Mix_HaltChannel( -1 ) ;
    return 0 ;
}

extern "C" int DxDesktop_DeleteSound( int handle )
{
    auto it = g_Chunks.find( handle ) ;
    if ( it == g_Chunks.end() ) return -1 ;
    Mix_FreeChunk( it->second ) ;
    g_Chunks.erase( it ) ;
    return 0 ;
}

// BGM
extern "C" int DxDesktop_LoadMusic( const char *path_utf8 )
{
    if ( ensure_init() != 0 ) return -1 ;
    Mix_Music *m = Mix_LoadMUS( path_utf8 ) ;
    if ( !m ) {
        std::fprintf( stderr, "[DxSoundDesktop] LoadMusic fail: %s (%s)\n", path_utf8, Mix_GetError() ) ;
        return -1 ;
    }
    int h = g_NextMusicHandle++ ;
    g_Musics[ h ] = m ;
    return h ;
}

extern "C" int DxDesktop_PlayMusic( int handle, int loops /* -1=infinite */ )
{
    auto it = g_Musics.find( handle ) ;
    if ( it == g_Musics.end() ) return -1 ;
    return Mix_PlayMusic( it->second, loops ) ;
}

extern "C" int DxDesktop_StopMusic( void )
{
    Mix_HaltMusic() ;
    return 0 ;
}

extern "C" int DxDesktop_DeleteMusic( int handle )
{
    auto it = g_Musics.find( handle ) ;
    if ( it == g_Musics.end() ) return -1 ;
    Mix_FreeMusic( it->second ) ;
    g_Musics.erase( it ) ;
    return 0 ;
}

// 音量 (0..128)
extern "C" int DxDesktop_SetSoundVolume( int handle, int volume /* 0..128 */ )
{
    auto it = g_Chunks.find( handle ) ;
    if ( it == g_Chunks.end() ) return -1 ;
    Mix_VolumeChunk( it->second, volume ) ;
    return 0 ;
}

extern "C" int DxDesktop_SetMusicVolume( int volume /* 0..128 */ )
{
    Mix_VolumeMusic( volume ) ;
    return 0 ;
}
