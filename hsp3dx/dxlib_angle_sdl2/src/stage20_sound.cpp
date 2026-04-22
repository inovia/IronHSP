//
// hsp3dx Stage 20: サウンド (バイパス DxDesktop_* 経由)
//   起動時に一度だけ生成したビープ音を 2 秒おきに再生
//
#define DX_PLATFORM_DESKTOP_SDL2 1
#define DX_NON_MOVIE 1
#define DX_NON_LIVE2D_CUBISM4 1
#define DX_NON_MODEL 1
#define DX_NON_BULLET_PHYSICS 1
#define DX_NON_FILTER 1
#define DX_NON_MASK 1
#define DX_NON_SOUND 1
#define DX_NON_KEYEX 1
#define DX_NON_INPUTSTRING 1

#include "DxLib.h"
#include <SDL.h>
#include <cstdio>
#include <cmath>
#include <cstring>
#include <vector>

extern "C" int DxDesktop_LoadSound( const char *path );
extern "C" int DxDesktop_PlaySound( int handle, int loops );
extern "C" int DxDesktop_SetSoundVolume( int handle, int volume );
extern "C" int DxDesktop_DeleteSound( int handle );
extern "C" int DxDesktop_DrawText( int, int, const char *, unsigned char, unsigned char, unsigned char, int );

// 440Hz 0.3 秒のサイン波 WAV を一時ファイルとして書き出す
static bool make_beep_wav( const char *path, double freq_hz, double seconds )
{
    const int sr = 44100;
    const int ns = ( int )( sr * seconds );
    std::vector<short> pcm( ns );
    for ( int i = 0 ; i < ns ; ++i ) {
        double t = ( double )i / sr ;
        double env = 1.0 ;
        if ( t < 0.01 ) env = t / 0.01 ;              // attack
        if ( t > seconds - 0.05 ) env = ( seconds - t ) / 0.05 ;
        if ( env < 0 ) env = 0 ;
        pcm[ i ] = ( short )( 12000 * env * std::sin( 2 * 3.14159265 * freq_hz * t ) );
    }
    FILE *f = std::fopen( path, "wb" );
    if ( !f ) return false;

    // WAV header (PCM 16bit mono)
    int data_size = ns * 2;
    int file_size = 36 + data_size;
    std::fwrite( "RIFF", 1, 4, f );
    std::fwrite( &file_size, 4, 1, f );
    std::fwrite( "WAVEfmt ", 1, 8, f );
    int fmt_size = 16;                 std::fwrite( &fmt_size, 4, 1, f );
    short fmt_type = 1; std::fwrite( &fmt_type, 2, 1, f );
    short channels = 1; std::fwrite( &channels, 2, 1, f );
    int sr_u = sr;      std::fwrite( &sr_u, 4, 1, f );
    int byte_rate = sr * 2; std::fwrite( &byte_rate, 4, 1, f );
    short blk_align = 2; std::fwrite( &blk_align, 2, 1, f );
    short bits = 16;    std::fwrite( &bits, 2, 1, f );
    std::fwrite( "data", 1, 4, f );
    std::fwrite( &data_size, 4, 1, f );
    std::fwrite( pcm.data(), 2, ns, f );
    std::fclose( f );
    return true;
}

int main( int argc, char **argv )
{
    (void)argc; (void)argv;
    if ( DxLib::DxLib_Init() != 0 ) return 1;
    DxLib::SetBackgroundColor( 20, 20, 30 );

    // 2 種類のビープ音を作成
    const char *wav1 = "stage20_beep1.wav";
    const char *wav2 = "stage20_beep2.wav";
    make_beep_wav( wav1, 440.0, 0.25 );
    make_beep_wav( wav2, 880.0, 0.20 );

    int s1 = DxDesktop_LoadSound( wav1 );
    int s2 = DxDesktop_LoadSound( wav2 );
    DxDesktop_SetSoundVolume( s1, 100 );
    DxDesktop_SetSoundVolume( s2, 100 );

    std::printf( "[Stage20] sound handles: s1=%d s2=%d\n", s1, s2 );

    Uint32 start = SDL_GetTicks();
    Uint32 last_beep = 0;
    int    beep_cnt = 0;

    while ( SDL_GetTicks() - start < 15000 )
    {
        SDL_Event ev; while ( SDL_PollEvent( &ev ) ) { (void)ev; }

        // 1.5 秒おきにビープ
        Uint32 now = SDL_GetTicks();
        if ( now - last_beep > 1500 ) {
            int h = ( beep_cnt & 1 ) ? s2 : s1;
            DxDesktop_PlaySound( h, 0 );
            last_beep = now;
            beep_cnt++;
        }

        DxLib::ClearDrawScreen();

        // テキスト
        DxDesktop_DrawText(  50, 40, "Stage 20: Sound (SDL2_mixer bypass)", 255,255,255, 20 );
        DxDesktop_DrawText(  50, 80, "Beeps every 1.5 seconds, alternating 440Hz / 880Hz", 180,255,180, 16 );

        char buf[64];
        std::snprintf( buf, sizeof buf, "beep count = %d", beep_cnt );
        DxDesktop_DrawText( 50, 120, buf, 255, 220, 120, 18 );

        // 視覚フィードバック: beep するたび矩形フラッシュ
        float since = ( now - last_beep ) / 1000.0f;
        if ( since < 0.3f ) {
            int a = ( int )( 255 * ( 1.0f - since / 0.3f ) );
            DxLib::DrawFillBox( 50, 180, 590, 260,
                                  DxLib::GetColor( a, a/2, a/4 ) );
        }

        DxLib::ScreenFlip();
    }

    DxDesktop_DeleteSound( s1 );
    DxDesktop_DeleteSound( s2 );
    DxLib::DxLib_End();

    std::remove( wav1 );
    std::remove( wav2 );
    return 0;
}
