//
// hsp3dx Stage 23: 3D primitives (Line3D / Triangle3D / Billboard3D)
//
#define DX_PLATFORM_DESKTOP_SDL2 1
#define DX_NON_MOVIE 1
#define DX_NON_LIVE2D_CUBISM4 1
#define DX_NON_MODEL 1
#define DX_NON_BULLET_PHYSICS 1
#define DX_NON_FILTER 1
#define DX_NON_MASK 1
#define DX_NON_KEYEX 1
#define DX_NON_INPUTSTRING 1

#include "DxLib.h"
#include <SDL.h>
#include <cstdio>
#include <cmath>

int main( int argc, char **argv )
{
    (void)argc; (void)argv;
    if ( DxLib::DxLib_Init() != 0 ) return 1;
    DxLib::SetBackgroundColor( 10, 10, 30 );

    int fontM = DxLib::CreateFontToHandle( nullptr, 18, -1 );

    Uint32 start = SDL_GetTicks();
    int frame = 0;
    while ( SDL_GetTicks() - start < 10000 )
    {
        SDL_Event ev; while ( SDL_PollEvent( &ev ) ) { (void)ev; }
        float t = ( SDL_GetTicks() - start ) / 1000.0f;

        DxLib::ClearDrawScreen();
        DxLib::ClearDrawScreenZBuffer( nullptr );

        // カメラを (ターゲットから距離 400 で公転)
        DxLib::VECTOR eye;
        eye.x = 400.0f * std::cos( t * 0.6f );
        eye.y = 200.0f;
        eye.z = 400.0f * std::sin( t * 0.6f );
        DxLib::VECTOR target = { 0, 0, 0 };
        DxLib::SetCameraPositionAndTarget_UpVecY( eye, target );
        DxLib::SetupCamera_Perspective( DX_PI_F / 3 );
        DxLib::SetCameraNearFar( 10.0f, 2000.0f );

        DxLib::SetUseZBuffer3D( TRUE );
        DxLib::SetWriteZBuffer3D( TRUE );

        // 軸 (赤 X, 緑 Y, 青 Z)
        DxLib::DrawLine3D( { -200, 0, 0 }, { 200, 0, 0 }, DxLib::GetColor( 255, 80, 80 ) );
        DxLib::DrawLine3D( { 0, -200, 0 }, { 0, 200, 0 }, DxLib::GetColor( 80, 255, 80 ) );
        DxLib::DrawLine3D( { 0, 0, -200 }, { 0, 0, 200 }, DxLib::GetColor( 80, 80, 255 ) );

        // 原点を囲む三角形 (ワイヤ) 8 個で正八面体
        unsigned int oct_col = DxLib::GetColor( 255, 200, 100 );
        DxLib::VECTOR v[ 6 ] = {
            { 100, 0, 0 }, { -100, 0, 0 },
            { 0, 100, 0 }, { 0, -100, 0 },
            { 0, 0, 100 }, { 0, 0, -100 },
        };
        DxLib::DrawTriangle3D( v[ 0 ], v[ 2 ], v[ 4 ], oct_col, FALSE );
        DxLib::DrawTriangle3D( v[ 0 ], v[ 4 ], v[ 3 ], oct_col, FALSE );
        DxLib::DrawTriangle3D( v[ 0 ], v[ 3 ], v[ 5 ], oct_col, FALSE );
        DxLib::DrawTriangle3D( v[ 0 ], v[ 5 ], v[ 2 ], oct_col, FALSE );
        DxLib::DrawTriangle3D( v[ 1 ], v[ 2 ], v[ 5 ], oct_col, FALSE );
        DxLib::DrawTriangle3D( v[ 1 ], v[ 5 ], v[ 3 ], oct_col, FALSE );
        DxLib::DrawTriangle3D( v[ 1 ], v[ 3 ], v[ 4 ], oct_col, FALSE );
        DxLib::DrawTriangle3D( v[ 1 ], v[ 4 ], v[ 2 ], oct_col, FALSE );

        // 3D 空間に粒子 (Pixel3D)
        for ( int i = 0 ; i < 60 ; ++i )
        {
            float a = ( float )i / 60 * 6.283f;
            float r = 180;
            DxLib::VECTOR p = { r * std::cos( a + t ), 30.0f * std::sin( t * 2 + a ), r * std::sin( a + t ) };
            unsigned int col = DxLib::GetColor(
                ( int )( 128 + 127 * std::sin( a ) ),
                ( int )( 128 + 127 * std::sin( a + 2.0f ) ),
                ( int )( 128 + 127 * std::sin( a + 4.0f ) ) );
            DxLib::DrawPixel3D( p, col );
        }

        // --- 2D HUD (3D 後に描画) ----------------------------
        DxLib::DrawStringToHandle( 10, 10, "Stage 23: 3D primitives (DrawLine3D / Triangle3D / Pixel3D)",
            DxLib::GetColor( 255, 255, 255 ), fontM );
        char buf[ 64 ];
        std::snprintf( buf, sizeof buf, "t=%.2f  eye=(%.0f, %.0f, %.0f)", t, eye.x, eye.y, eye.z );
        DxLib::DrawStringToHandle( 10, 34, buf, DxLib::GetColor( 180, 255, 180 ), fontM );

        DxLib::ScreenFlip();
        frame++;
    }

    DxLib::DeleteFontToHandle( fontM );
    DxLib::DxLib_End();
    return 0;
}
