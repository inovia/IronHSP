//
// hsp3dx angle+sdl2 Stage 11 (Web): stage1_empty_window の emscripten 版
//
// emscripten + SDL2 で WebAssembly ビルドし、ブラウザ上で WebGL context を取る。
// DxLib は含めず、SDL2 + 背景色 clear のみの最小デモ。
//

#include <SDL.h>
#include <SDL_opengl.h>
#include <emscripten.h>
#include <emscripten/html5.h>
#include <cmath>
#include <cstdio>

static SDL_Window    *g_Window    = nullptr ;
static SDL_GLContext  g_GLContext = nullptr ;
static int            g_Frame     = 0 ;

static void main_loop( void )
{
    SDL_Event ev ;
    while ( SDL_PollEvent( &ev ) )
    {
        // Web 版は quit なし (ブラウザ側でタブ閉じ)
    }

    float t = g_Frame / 60.0f ;
    float r = 0.10f + 0.05f * ( 0.5f + 0.5f * std::sin( t ) ) ;
    float g = 0.25f + 0.05f * ( 0.5f + 0.5f * std::sin( t * 1.3f ) ) ;
    float b = 0.50f + 0.10f * ( 0.5f + 0.5f * std::sin( t * 0.7f ) ) ;

    glClearColor( r, g, b, 1.0f ) ;
    glClear( GL_COLOR_BUFFER_BIT ) ;

    SDL_GL_SwapWindow( g_Window ) ;
    g_Frame++ ;
}

int main( int argc, char **argv )
{
    (void)argc; (void)argv;

    if ( SDL_Init( SDL_INIT_VIDEO ) != 0 ) {
        std::fprintf( stderr, "SDL_Init failed: %s\n", SDL_GetError() ) ;
        return 1 ;
    }

    SDL_GL_SetAttribute( SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_ES ) ;
    SDL_GL_SetAttribute( SDL_GL_CONTEXT_MAJOR_VERSION, 2 ) ;
    SDL_GL_SetAttribute( SDL_GL_CONTEXT_MINOR_VERSION, 0 ) ;
    SDL_GL_SetAttribute( SDL_GL_DOUBLEBUFFER, 1 ) ;

    g_Window = SDL_CreateWindow(
        "hsp3dx dxlib_angle_sdl2 Stage 11 (Web)",
        SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
        800, 600, SDL_WINDOW_OPENGL | SDL_WINDOW_SHOWN ) ;
    if ( !g_Window ) { std::fprintf( stderr, "window: %s\n", SDL_GetError() ) ; return 1 ; }

    g_GLContext = SDL_GL_CreateContext( g_Window ) ;
    if ( !g_GLContext ) { std::fprintf( stderr, "gl ctx: %s\n", SDL_GetError() ) ; return 1 ; }

    std::printf( "GL_VERSION: %s\n", ( const char * )glGetString( GL_VERSION ) ) ;

    emscripten_set_main_loop( main_loop, 0, 1 ) ;
    return 0 ;
}
