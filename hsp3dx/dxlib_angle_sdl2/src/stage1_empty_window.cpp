//
// hsp3dx angle+sdl2 Stage 1: Empty Window
//
//  SDL2 で 800x600 のウィンドウを開き、OpenGL ES 2.0 互換の GL context を
//  取得して青系色でクリアし続けるだけの PoC。
//
//  - ESC キーまたは閉じるボタンで終了
//  - 現状は Windows (desktop GL driver 経由) での動作確認用
//  - Stage 2 以降で ANGLE (libEGL.dll + libGLESv2.dll) に差し替える
//

#include <SDL.h>
#include <SDL_opengl.h>
#include <cstdio>
#include <cstdlib>
#include <cmath>

static const int  kWinW = 800;
static const int  kWinH = 600;
static const char kAppTitle[] = "hsp3dx angle+sdl2 — Stage 1";

int main( int argc, char **argv )
{
    (void)argc; (void)argv;

    if ( SDL_Init( SDL_INIT_VIDEO | SDL_INIT_EVENTS ) != 0 ) {
        std::fprintf( stderr, "SDL_Init failed: %s\n", SDL_GetError() );
        return EXIT_FAILURE;
    }

    // OpenGL ES 2.0 profile を要求。Windows の desktop driver は
    // ARB_ES2_compatibility を持っていれば素直に返してくれる。
    // ANGLE 差し替え時は SDL_HINT_VIDEO_DRIVER か EGL 側設定で対応。
    SDL_GL_SetAttribute( SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_ES );
    SDL_GL_SetAttribute( SDL_GL_CONTEXT_MAJOR_VERSION, 2 );
    SDL_GL_SetAttribute( SDL_GL_CONTEXT_MINOR_VERSION, 0 );
    SDL_GL_SetAttribute( SDL_GL_DOUBLEBUFFER, 1 );
    SDL_GL_SetAttribute( SDL_GL_DEPTH_SIZE, 24 );

    SDL_Window *win = SDL_CreateWindow(
        kAppTitle,
        SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
        kWinW, kWinH,
        SDL_WINDOW_OPENGL | SDL_WINDOW_SHOWN
    );
    if ( !win ) {
        std::fprintf( stderr, "SDL_CreateWindow failed: %s\n", SDL_GetError() );
        SDL_Quit();
        return EXIT_FAILURE;
    }

    SDL_GLContext gl = SDL_GL_CreateContext( win );
    if ( !gl ) {
        std::fprintf( stderr, "SDL_GL_CreateContext(ES2) failed: %s\n"
                              "Falling back to desktop GL compat.\n",
                              SDL_GetError() );
        SDL_GL_SetAttribute( SDL_GL_CONTEXT_PROFILE_MASK,
                             SDL_GL_CONTEXT_PROFILE_COMPATIBILITY );
        SDL_GL_SetAttribute( SDL_GL_CONTEXT_MAJOR_VERSION, 2 );
        SDL_GL_SetAttribute( SDL_GL_CONTEXT_MINOR_VERSION, 1 );
        gl = SDL_GL_CreateContext( win );
    }
    if ( !gl ) {
        std::fprintf( stderr, "SDL_GL_CreateContext also failed: %s\n",
                              SDL_GetError() );
        SDL_DestroyWindow( win );
        SDL_Quit();
        return EXIT_FAILURE;
    }

    SDL_GL_MakeCurrent( win, gl );
    SDL_GL_SetSwapInterval( 1 );  // VSync

    const char *gl_vendor   = (const char*)glGetString( GL_VENDOR );
    const char *gl_renderer = (const char*)glGetString( GL_RENDERER );
    const char *gl_version  = (const char*)glGetString( GL_VERSION );
    std::printf( "GL_VENDOR:   %s\n", gl_vendor   ? gl_vendor   : "(null)" );
    std::printf( "GL_RENDERER: %s\n", gl_renderer ? gl_renderer : "(null)" );
    std::printf( "GL_VERSION:  %s\n", gl_version  ? gl_version  : "(null)" );
    std::fflush( stdout );

    bool running = true;
    Uint32 start_ticks = SDL_GetTicks();
    while ( running ) {
        SDL_Event ev;
        while ( SDL_PollEvent( &ev ) ) {
            if ( ev.type == SDL_QUIT ) running = false;
            if ( ev.type == SDL_KEYDOWN &&
                 ev.key.keysym.sym == SDLK_ESCAPE ) running = false;
        }

        // 時間で色をうっすら変化させて「更新されてる」ことが分かるように
        float t = (SDL_GetTicks() - start_ticks) / 1000.0f;
        float r = 0.10f + 0.05f * (float)( 0.5 + 0.5 * std::sin( t ) );
        float g = 0.25f + 0.05f * (float)( 0.5 + 0.5 * std::sin( t * 1.3 ) );
        float b = 0.50f + 0.10f * (float)( 0.5 + 0.5 * std::sin( t * 0.7 ) );

        glViewport( 0, 0, kWinW, kWinH );
        glClearColor( r, g, b, 1.0f );
        glClear( GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT );

        SDL_GL_SwapWindow( win );
    }

    SDL_GL_DeleteContext( gl );
    SDL_DestroyWindow( win );
    SDL_Quit();
    return EXIT_SUCCESS;
}
