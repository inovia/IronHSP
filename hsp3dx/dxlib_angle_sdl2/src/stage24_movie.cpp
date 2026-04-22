//
// hsp3dx Stage 24: Movie (Windows Media Foundation、video-only)
//
// 使い方: stage24_movie.exe [path/to/movie.mp4]
//   引数なしの場合はいくつかの既定パスを試す。見つからなければ
//   ガイダンスを表示して終了。
//
#define DX_PLATFORM_DESKTOP_SDL2 1
#define DX_NON_LIVE2D_CUBISM4 1
#define DX_NON_BULLET_PHYSICS 1
#define DX_NON_FILTER 1
#define DX_NON_KEYEX 1
#define DX_NON_INPUTSTRING 1

#include "DxLib.h"
#include <SDL.h>
#include <cstdio>
#include <cstring>

static const char *find_default_movie( void )
{
    static const char *candidates[] = {
        "test.mp4",
        "sample.mp4",
        "stage24.mp4",
        "C:/Windows/Performance/WinSAT/winsat.wmv",
        nullptr
    };
    for ( int i = 0 ; candidates[ i ] ; ++i ) {
        FILE *f = std::fopen( candidates[ i ], "rb" );
        if ( f ) { std::fclose( f ); return candidates[ i ]; }
    }
    return nullptr;
}

int main( int argc, char **argv )
{
    const char *path = ( argc >= 2 ) ? argv[ 1 ] : find_default_movie();

    if ( DxLib::DxLib_Init() != 0 ) return 1;
    DxLib::SetBackgroundColor( 10, 10, 10 );

    int fontM = DxLib::CreateFontToHandle( nullptr, 18, -1 );
    int fontS = DxLib::CreateFontToHandle( nullptr, 14, -1 );

    int movie_gh = -1;
    if ( path ) {
        movie_gh = DxLib::OpenMovieToGraph( path );
        std::fprintf( stderr, "[Stage24] OpenMovieToGraph(%s) -> %d\n", path, movie_gh );
    }

    if ( movie_gh >= 0 ) {
        DxLib::PlayMovieToGraph( movie_gh, DX_PLAYTYPE_LOOP );
    }

    int mw = 0, mh = 0;
    if ( movie_gh >= 0 ) DxLib::GetGraphSize( movie_gh, &mw, &mh );

    Uint32 start = SDL_GetTicks();
    int frame = 0;
    while ( SDL_GetTicks() - start < 15000 )
    {
        SDL_Event ev; while ( SDL_PollEvent( &ev ) ) { (void)ev; }

        // Movie フレーム更新
        if ( movie_gh >= 0 ) DxLib::UpdateMovieToGraph( movie_gh );

        DxLib::ClearDrawScreen();
        float t = ( SDL_GetTicks() - start ) / 1000.0f;

        DxLib::DrawStringToHandle( 10, 10, "Stage 24: DxLib::OpenMovieToGraph + PlayMovieToGraph (Win MF)",
            DxLib::GetColor( 255, 255, 255 ), fontM );

        if ( movie_gh >= 0 ) {
            // 中央にフィット配置
            int sw = 640, sh = 480;
            float sc = ( mw > 0 && mh > 0 ) ? (float)( sw - 40 ) / (float)mw : 1.0f;
            float sc2 = ( mw > 0 && mh > 0 ) ? (float)( sh - 120 ) / (float)mh : 1.0f;
            if ( sc2 < sc ) sc = sc2;
            int dw = (int)( mw * sc ), dh = (int)( mh * sc );
            int dx = ( sw - dw ) / 2, dy = 50 + ( sh - 120 - dh ) / 2;
            DxLib::DrawExtendGraph( dx, dy, dx + dw, dy + dh, movie_gh, FALSE );

            char buf[ 128 ];
            std::snprintf( buf, sizeof buf, "file: %s  (%dx%d)  t=%.2f", path, mw, mh, t );
            DxLib::DrawStringToHandle( 10, 440, buf, DxLib::GetColor( 180, 255, 180 ), fontS );
            int tell = DxLib::TellMovieToGraph( movie_gh );
            int state = DxLib::GetMovieStateToGraph( movie_gh );
            std::snprintf( buf, sizeof buf, "movie time: %d ms  state: %d", tell, state );
            DxLib::DrawStringToHandle( 10, 458, buf, DxLib::GetColor( 180, 255, 180 ), fontS );
        } else {
            DxLib::DrawStringToHandle( 20, 80,
                "MP4 not found. Place test.mp4 / sample.mp4 next to exe, or pass path via argv.",
                DxLib::GetColor( 255, 150, 150 ), fontM );
            DxLib::DrawStringToHandle( 20, 120,
                "Example: stage24_movie.exe C:/Videos/intro.mp4",
                DxLib::GetColor( 180, 180, 255 ), fontS );
        }

        DxLib::ScreenFlip();
        frame++;
    }

    if ( movie_gh >= 0 ) DxLib::DeleteGraph( movie_gh );
    DxLib::DeleteFontToHandle( fontM );
    DxLib::DeleteFontToHandle( fontS );
    DxLib::DxLib_End();
    return 0;
}
