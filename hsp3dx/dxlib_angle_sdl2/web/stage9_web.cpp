//
// hsp3dx Stage 14 (Web): stage9 の emscripten 版
//   Animated BoxSet / LineSet / Circle_Thickness / Oval_Thickness
//

#define DX_PLATFORM_DESKTOP_SDL2 1
#define DX_NON_MOVIE           1
#define DX_NON_LIVE2D_CUBISM4  1
#define DX_NON_MODEL           1
#define DX_NON_BULLET_PHYSICS  1
#define DX_NON_FILTER          1
#define DX_NON_MASK            1
#define DX_NON_SOUND           1
#define DX_NON_FONT            1
#define DX_NON_INPUT           1

#include "DxLib.h"
#include <SDL.h>
#include <emscripten.h>
#include <cmath>
#include <cstdio>

static Uint32 g_Start = 0 ;
static const float PI = 3.14159265358979f ;

static void frame( void )
{
    DxLib::ClearDrawScreen() ;
    float t = ( SDL_GetTicks() - g_Start ) / 1000.0f ;

    // 50 個の波打つ矩形
    DxLib::RECTDATA boxes[ 50 ] ;
    for ( int i = 0 ; i < 50 ; ++i )
    {
        float ph = t * 2.0f + i * 0.3f ;
        int   c  = ( int )( 127 + 127 * std::sin( ph ) ) ;
        boxes[ i ].x1 = 20 + i * 12 ;
        boxes[ i ].y1 = 30 ;
        boxes[ i ].x2 = 30 + i * 12 ;
        boxes[ i ].y2 = 80 ;
        boxes[ i ].color = DxLib::GetColor( c, 255 - c, 200 ) ;
        boxes[ i ].pal = 0 ;
    }
    DxLib::DrawBoxSet( boxes, 50 ) ;

    // 60 本の螺旋の線
    DxLib::LINEDATA lines[ 60 ] ;
    for ( int i = 0 ; i < 60 ; ++i )
    {
        float a1 = t + i * 0.1f ;
        float a2 = a1 + PI / 3 ;
        int   R  = ( int )( 128 + 127 * std::sin( a1 ) ) ;
        int   G  = ( int )( 128 + 127 * std::sin( a1 + PI * 2 / 3 ) ) ;
        int   B  = ( int )( 128 + 127 * std::sin( a1 + PI * 4 / 3 ) ) ;
        float r1 = 30 + i * 1.5f ;
        float r2 = r1 + 40 ;
        lines[ i ].x1 = ( int )( 320 + std::cos( a1 ) * r1 ) ;
        lines[ i ].y1 = ( int )( 200 + std::sin( a1 ) * r1 ) ;
        lines[ i ].x2 = ( int )( 320 + std::cos( a2 ) * r2 ) ;
        lines[ i ].y2 = ( int )( 200 + std::sin( a2 ) * r2 ) ;
        lines[ i ].color = DxLib::GetColor( R, G, B ) ;
        lines[ i ].pal = 0 ;
    }
    DxLib::DrawLineSet( lines, 60 ) ;

    for ( int i = 0 ; i < 4 ; ++i )
    {
        int rad = 30 + i * 12 ;
        int c   = 80 + i * 40 ;
        DxLib::DrawCircle( 140 + i * 10, 400, rad,
                           DxLib::GetColor( c, 255 - c, 255 ), FALSE ) ;
    }

    DxLib::DrawOval( 440, 400, 80, 40,
                     DxLib::GetColor( 255, 180, 80 ), FALSE ) ;

    DxLib::ScreenFlip() ;
}

int main( int argc, char **argv )
{
    (void)argc; (void)argv;
    if ( DxLib::DxLib_Init() != 0 ) return 1;
    DxLib::SetBackgroundColor( 12, 12, 24 ) ;
    g_Start = SDL_GetTicks() ;
    emscripten_set_main_loop( frame, 0, 1 ) ;
    return 0;
}
