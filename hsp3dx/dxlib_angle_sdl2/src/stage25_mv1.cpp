//
// hsp3dx Stage 25: MV1 モデル描画 (MV1 / X / PMD / PMX 等)
//
// 使い方: stage25_mv1.exe [path/to/model.mv1|.x|.pmd|.pmx]
//   引数なしなら model.mv1 / test.mv1 / test.x / test.pmd を順に試す。
//   見つからなければガイダンス表示で終了。
//
// 本 stage の意図: Tier 4d v1〜v4 (MV1 load + NORMAL/Skin 静的描画 + テクスチャ)
// を結合した初回可視化デモ。アニメーションは T ポーズ静止のみ。
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
#include <cmath>

static const char *find_default_model( void )
{
    static const char *candidates[] = {
        "model.mv1", "test.mv1", "test.x", "test.pmd", "test.pmx", "test.mqo",
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
    const char *path = ( argc >= 2 ) ? argv[ 1 ] : find_default_model();

    if ( DxLib::DxLib_Init() != 0 ) return 1;
    DxLib::SetBackgroundColor( 20, 20, 35 );

    int fontM = DxLib::CreateFontToHandle( nullptr, 18, -1 );
    int fontS = DxLib::CreateFontToHandle( nullptr, 14, -1 );

    int mh = -1;
    if ( path ) {
        mh = DxLib::MV1LoadModel( path );
        std::fprintf( stderr, "[Stage25] MV1LoadModel(%s) -> %d\n", path, mh );
    }

    // モデルの bounding box を全メッシュで合成して適切なカメラ距離を決める
    DxLib::VECTOR bbMin = {  1e30f,  1e30f,  1e30f };
    DxLib::VECTOR bbMax = { -1e30f, -1e30f, -1e30f };
    float radius = 100.0f;
    if ( mh >= 0 ) {
        int nm = DxLib::MV1GetMeshNum( mh );
        for ( int i = 0 ; i < nm ; ++i ) {
            DxLib::VECTOR a = DxLib::MV1GetMeshMinPosition( mh, i );
            DxLib::VECTOR b = DxLib::MV1GetMeshMaxPosition( mh, i );
            if ( a.x < bbMin.x ) bbMin.x = a.x;
            if ( a.y < bbMin.y ) bbMin.y = a.y;
            if ( a.z < bbMin.z ) bbMin.z = a.z;
            if ( b.x > bbMax.x ) bbMax.x = b.x;
            if ( b.y > bbMax.y ) bbMax.y = b.y;
            if ( b.z > bbMax.z ) bbMax.z = b.z;
        }
        if ( nm > 0 ) {
            float dx = bbMax.x - bbMin.x, dy = bbMax.y - bbMin.y, dz = bbMax.z - bbMin.z;
            radius = std::sqrt( dx * dx + dy * dy + dz * dz );
            if ( radius < 10 ) radius = 100;
        } else {
            bbMin = { 0, 0, 0 }; bbMax = { 0, 0, 0 };
        }
    }
    float camDist = radius * 1.5f;
    DxLib::VECTOR center = {
        ( bbMin.x + bbMax.x ) * 0.5f,
        ( bbMin.y + bbMax.y ) * 0.5f,
        ( bbMin.z + bbMax.z ) * 0.5f
    };

    Uint32 start = SDL_GetTicks();
    int frame = 0;
    while ( SDL_GetTicks() - start < 15000 )
    {
        SDL_Event ev; while ( SDL_PollEvent( &ev ) ) { (void)ev; }
        float t = ( SDL_GetTicks() - start ) / 1000.0f;

        DxLib::ClearDrawScreen();
        DxLib::ClearDrawScreenZBuffer( nullptr );

        // カメラを中心の回りに公転
        DxLib::VECTOR eye = {
            center.x + camDist * std::cos( t * 0.4f ),
            center.y + radius * 0.4f,
            center.z + camDist * std::sin( t * 0.4f )
        };
        DxLib::SetCameraPositionAndTarget_UpVecY( eye, center );
        DxLib::SetupCamera_Perspective( DX_PI_F / 3 );
        DxLib::SetCameraNearFar( radius * 0.05f, radius * 10.0f );
        DxLib::SetUseZBuffer3D( TRUE );
        DxLib::SetWriteZBuffer3D( TRUE );

        if ( mh >= 0 ) {
            DxLib::MV1DrawModel( mh );
        }

        // 簡易座標軸 (スケール感を見るため)
        DxLib::DrawLine3D( { 0, 0, 0 }, { radius, 0, 0 }, DxLib::GetColor( 255, 60, 60 ) );
        DxLib::DrawLine3D( { 0, 0, 0 }, { 0, radius, 0 }, DxLib::GetColor( 60, 255, 60 ) );
        DxLib::DrawLine3D( { 0, 0, 0 }, { 0, 0, radius }, DxLib::GetColor( 60, 60, 255 ) );

        // 2D HUD (3D 後)
        DxLib::DrawStringToHandle( 10, 10, "Stage 25: DxLib::MV1LoadModel + MV1DrawModel",
            DxLib::GetColor( 255, 255, 255 ), fontM );
        char buf[ 128 ];
        if ( mh >= 0 ) {
            std::snprintf( buf, sizeof buf, "model: %s  handle=%d  t=%.2f",
                path, mh, t );
            DxLib::DrawStringToHandle( 10, 34, buf, DxLib::GetColor( 180, 255, 180 ), fontS );
            std::snprintf( buf, sizeof buf, "bbox: (%.1f %.1f %.1f) - (%.1f %.1f %.1f)  radius=%.1f",
                bbMin.x, bbMin.y, bbMin.z, bbMax.x, bbMax.y, bbMax.z, radius );
            DxLib::DrawStringToHandle( 10, 54, buf, DxLib::GetColor( 180, 255, 180 ), fontS );
        } else {
            DxLib::DrawStringToHandle( 20, 80,
                "MV1/X/PMD/PMX model not found. Place model.mv1 next to exe, or pass path via argv.",
                DxLib::GetColor( 255, 150, 150 ), fontM );
            DxLib::DrawStringToHandle( 20, 120,
                "Example: stage25_mv1.exe C:/models/chara.mv1",
                DxLib::GetColor( 180, 180, 255 ), fontS );
        }

        DxLib::ScreenFlip();
        frame++;
    }

    if ( mh >= 0 ) DxLib::MV1DeleteModel( mh );
    DxLib::DeleteFontToHandle( fontM );
    DxLib::DeleteFontToHandle( fontS );
    DxLib::DxLib_End();
    return 0;
}
