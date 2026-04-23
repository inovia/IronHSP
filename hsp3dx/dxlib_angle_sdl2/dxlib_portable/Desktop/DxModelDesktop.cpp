//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2+GL) 用 モデル 実装 (最小版 v1)
//
//      DxModel.cpp (34113 行) / DxModelLoader*.cpp / DxModelRead.cpp の CPU
//      側コードをコンパイル・リンク可能にするため、MV1_*_PF (14 個) の
//      エントリを提供する。このコミットでは VBO/シェーダ連動はまだ入れず、
//      PF は no-op に近い (handle 管理や Common バッファの確保のみ)。
//
//      次段で VBO 作成 + glDrawElements で実描画を動かす予定。
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#ifdef _WIN32
#include <windows.h>
#endif

#include "../DxCompileConfig.h"

#ifndef DX_NON_MODEL

#include "DxModelDesktop.h"
#include "../DxModel.h"
#include "../DxMemory.h"
#include "../DxGraphics.h"

#include <SDL.h>
#include <SDL_opengl.h>

#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <cmath>

// GL 1.3+ 関数 (glActiveTexture / glMultiTexCoord2f) は GDI32 の opengl32.lib
// には無いので SDL_GL_GetProcAddress で動的解決する。
#ifndef GL_TEXTURE0
#define GL_TEXTURE0 0x84C0
#endif
typedef void (APIENTRYP PFN_desk_glActiveTexture)( GLenum texture ) ;
typedef void (APIENTRYP PFN_desk_glMultiTexCoord2f)( GLenum target, GLfloat s, GLfloat t ) ;
static PFN_desk_glActiveTexture   p_glActiveTexture   = nullptr ;
static PFN_desk_glMultiTexCoord2f p_glMultiTexCoord2f = nullptr ;
static int s_mt_loaded = 0 ;
static void desktop_mv1_load_mt_funcs( void )
{
    if ( s_mt_loaded ) return ;
    p_glActiveTexture   = ( PFN_desk_glActiveTexture )   SDL_GL_GetProcAddress( "glActiveTexture" ) ;
    p_glMultiTexCoord2f = ( PFN_desk_glMultiTexCoord2f ) SDL_GL_GetProcAddress( "glMultiTexCoord2f" ) ;
    if ( !p_glActiveTexture ) {
        p_glActiveTexture = ( PFN_desk_glActiveTexture ) SDL_GL_GetProcAddress( "glActiveTextureARB" ) ;
    }
    if ( !p_glMultiTexCoord2f ) {
        p_glMultiTexCoord2f = ( PFN_desk_glMultiTexCoord2f ) SDL_GL_GetProcAddress( "glMultiTexCoord2fARB" ) ;
    }
    s_mt_loaded = 1 ;
}

// DxShaderDesktop.cpp で定義される C linkage 関数を宣言
extern "C" int Desktop_MV1_IsGLSLEnabled( void ) ;
extern "C" int Desktop_MV1_GetShaderHandle( void ) ;
extern "C" int DesktopShader_Use( int handle ) ;
extern "C" int DesktopShader_SetUniform1i( int h, const char *name, int v ) ;
extern "C" int DesktopShader_SetUniform1f( int h, const char *name, float v ) ;
extern "C" int DesktopShader_SetUniform3f( int h, const char *name, float a, float b, float c ) ;

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

MV1_MODEL_MANAGE_DESKTOP MV1Man_Desktop = {} ;

// --- 汎用バッファ関数 ----------------------------------------------------

extern int MV1_Desktop_CommonBuffer_Setup( int Size )
{
    if ( Size <= MV1Man_Desktop.CommonBufferSize ) return 0 ;
    if ( MV1Man_Desktop.CommonBuffer ) std::free( MV1Man_Desktop.CommonBuffer ) ;
    MV1Man_Desktop.CommonBuffer = std::malloc( Size ) ;
    MV1Man_Desktop.CommonBufferSize = MV1Man_Desktop.CommonBuffer ? Size : 0 ;
    return MV1Man_Desktop.CommonBuffer ? 0 : -1 ;
}

extern int MV1_Desktop_CommonBuffer_Terminate( void )
{
    if ( MV1Man_Desktop.CommonBuffer ) std::free( MV1Man_Desktop.CommonBuffer ) ;
    MV1Man_Desktop.CommonBuffer = nullptr ;
    MV1Man_Desktop.CommonBufferSize = 0 ;
    return 0 ;
}

// --- PF 関数 (最小実装: handle 管理のみ、描画は未実装) -----------------

extern int  MV1_Terminate_PF( void )
{
    return MV1_Desktop_CommonBuffer_Terminate() ;
}

extern int  MV1_TerminateModelBaseHandle_PF( MV1_MODEL_BASE *ModelBase )
{
    (void)ModelBase;
    return 0 ;
}

extern int  MV1_TerminateTriangleListBaseTempBuffer_PF( MV1_TRIANGLE_LIST_BASE *MBTList )
{
    if ( !MBTList ) return 0 ;
    // DxModel.h は PF 情報を PFBuffer[] に詰めるデザイン (iOS 版と同じ)
    MV1_TRIANGLE_LIST_BASE_PF *pf = ( MV1_TRIANGLE_LIST_BASE_PF * )MBTList->PFBuffer ;
    if ( pf->SkinFreeBoneVertexBuffer ) {
        std::free( pf->SkinFreeBoneVertexBuffer ) ;
        pf->SkinFreeBoneVertexBuffer = nullptr ;
    }
    pf->SkinFreeBoneVertexBufferUpdate = 0 ;
    return 0 ;
}

extern void MV1_SetupPackDrawInfo_PF( MV1_MODEL_BASE *ModelBase )
{
    (void)ModelBase;
    // pack draw info は VBO/シェーダ実装まで no-op
}

extern int  MV1_SetupVertexBufferBase_PF( int MV1ModelBaseHandle, int DuplicateNum, int ASyncThread )
{
    (void)MV1ModelBaseHandle; (void)DuplicateNum; (void)ASyncThread;
    return 0 ;
}

extern int  MV1_SetupVertexBuffer_PF( int MHandle, int ASyncThread )
{
    (void)MHandle; (void)ASyncThread;
    return 0 ;
}

extern int  MV1_TerminateVertexBufferBase_PF( int MV1ModelBaseHandle )
{
    (void)MV1ModelBaseHandle;
    return 0 ;
}

extern int  MV1_TerminateVertexBuffer_PF( int MV1ModelHandle )
{
    (void)MV1ModelHandle;
    return 0 ;
}

extern int  MV1_SetupShapeVertex_PF( int MHandle )
{
    (void)MHandle;
    return 0 ;
}

static bool s_MV1_LightWasOn = false ;

extern int  MV1_BeginRender_PF( MV1_MODEL *Model )
{
    (void)Model;
    // DxLib 側で既に SetTransformToView/Projection/World は呼ばれている。
    glEnable( GL_DEPTH_TEST ) ;
    // ライティング: DxLib::GetLightEnable() が TRUE なら GL_LIGHTING を有効化
    // ColorMaterial を使って glColor が diffuse/ambient を駆動するようにする
    s_MV1_LightWasOn = ( NS_GetLightEnable() != 0 ) ;
    if ( s_MV1_LightWasOn ) {
        glEnable( GL_LIGHTING ) ;
        glEnable( GL_COLOR_MATERIAL ) ;
        glColorMaterial( GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE ) ;
        // 法線の自動正規化 (スキニング後の normal は非単位ベクトルになる可能性)
        glEnable( GL_NORMALIZE ) ;
    }
    return 0 ;
}

extern int  MV1_EndRender_PF( void )
{
    if ( s_MV1_LightWasOn ) {
        glDisable( GL_NORMALIZE ) ;
        glDisable( GL_COLOR_MATERIAL ) ;
        glDisable( GL_LIGHTING ) ;
        s_MV1_LightWasOn = false ;
    }
    glDisable( GL_TEXTURE_2D ) ;
    glColor4ub( 255, 255, 255, 255 ) ;
    return 0 ;
}

// ワールド行列を Frame の LocalWorldMatrix から取得して glLoadMatrixf に流す
static void desktop_mv1_apply_frame_world( MV1_FRAME *frame )
{
    if ( !frame ) return ;
    // MATRIX_4X4CT は row-major 4x4。glLoadMatrixf に渡すと自動転置扱い。
    // NOTE: MATRIX_4X4CT はカラムメジャー実装の DirectX 派生なので、
    //   GL の column-major と合致する。そのまま glLoadMatrixf で OK のはず。
    //   (DxLib 本体の行列計算と GL の解釈が一致するよう DxLib 側で構築される)
    MATRIX m ;
    // FRAME の LocalWorldMatrix は行列化済。ここでは「現在の ModelView 行列に
    // 乗じる」の代わりに、GL 現在 MODELVIEW は View * World_prev。新しい World
    // に切り替えるため、View を再ロードして World を multiply しなおす。
    // 単純化: ここでは identity を重ねるだけ (frame の LocalWorld は既に
    // DxLib 内部で SetTransformToWorld にセットされていることを期待)。
    (void)m ; (void)frame ;
}

// 指定 DxLib GraphHandle から GL テクスチャ ID を取得 (0 なら失敗)
static GLuint desktop_mv1_tex_from_graph( int graphHandle )
{
    if ( graphHandle <= 0 ) return 0 ;
    IMAGEDATA *img = nullptr ;
    if ( GRAPHCHK( graphHandle, img ) ) return 0 ;
    if ( !img || !img->Orig || img->Orig->Hard.TexNum == 0 ) return 0 ;
    IMAGEDATA_ORIG_HARD_TEX *tex = &img->Orig->Hard.Tex[ 0 ] ;
    if ( !tex->PF ) return 0 ;
    return ( GLuint )tex->PF->Texture.TextureBuffer ;
}

// MATRIX_4X4CT は m[row][col] (row 0..2, col 0..3)、row 3 は暗黙の (0,0,0,1)。
// out = M * (p.x, p.y, p.z, 1)
static inline void desktop_mv1_mul_mat4x4ct(
    const MATRIX_4X4CT *M, const FLOAT4 &p, float &ox, float &oy, float &oz )
{
    ox = M->mf.m[ 0 ][ 0 ] * p.x + M->mf.m[ 0 ][ 1 ] * p.y + M->mf.m[ 0 ][ 2 ] * p.z + M->mf.m[ 0 ][ 3 ] ;
    oy = M->mf.m[ 1 ][ 0 ] * p.x + M->mf.m[ 1 ][ 1 ] * p.y + M->mf.m[ 1 ][ 2 ] * p.z + M->mf.m[ 1 ][ 3 ] ;
    oz = M->mf.m[ 2 ][ 0 ] * p.x + M->mf.m[ 2 ][ 1 ] * p.y + M->mf.m[ 2 ][ 2 ] * p.z + M->mf.m[ 2 ][ 3 ] ;
}

// 法線変換用 (平行移動は除外、3x3 回転/スケール成分のみ)
static inline void desktop_mv1_mul_mat4x4ct_dir(
    const MATRIX_4X4CT *M, const VECTOR &n, float &ox, float &oy, float &oz )
{
    ox = M->mf.m[ 0 ][ 0 ] * n.x + M->mf.m[ 0 ][ 1 ] * n.y + M->mf.m[ 0 ][ 2 ] * n.z ;
    oy = M->mf.m[ 1 ][ 0 ] * n.x + M->mf.m[ 1 ][ 1 ] * n.y + M->mf.m[ 1 ][ 2 ] * n.z ;
    oz = M->mf.m[ 2 ][ 0 ] * n.x + M->mf.m[ 2 ][ 1 ] * n.y + M->mf.m[ 2 ][ 2 ] * n.z ;
}

// CPU スキニング。各頂点タイプごとに MatrixWeight × BoneMatrix を合成し、
// world 空間の位置 + 法線を返す (法線は呼び側で正規化または GL_NORMALIZE に任せる)。
static void desktop_mv1_skin_vertex(
    MV1_FRAME *Frame, MV1_TRIANGLE_LIST_BASE *bd,
    const MV1_TLIST_SKIN_POS_4B *v4,
    const MV1_TLIST_SKIN_POS_8B *v8,
    int vertexType, float outPos[ 3 ], float outNrm[ 3 ] )
{
    outPos[ 0 ] = outPos[ 1 ] = outPos[ 2 ] = 0.0f ;
    outNrm[ 0 ] = outNrm[ 1 ] = outNrm[ 2 ] = 0.0f ;
    if ( !Frame || !Frame->UseSkinBoneMatrix || !bd ) return ;

    if ( vertexType == MV1_VERTEX_TYPE_SKIN_4BONE && v4 ) {
        for ( int k = 0 ; k < 4 ; ++k ) {
            float w = v4->MatrixWeight[ k ] ;
            if ( w <= 0.0f ) continue ;
            BYTE idx = v4->MatrixIndex[ k ] ;
            if ( idx >= bd->UseBoneNum ) continue ;
            int boneIdx = bd->UseBone[ idx ] ;
            if ( boneIdx < 0 ) continue ;
            MATRIX_4X4CT *M = Frame->UseSkinBoneMatrix[ boneIdx ] ;
            if ( !M ) continue ;
            float tx, ty, tz ;
            desktop_mv1_mul_mat4x4ct( M, v4->Position, tx, ty, tz ) ;
            outPos[ 0 ] += tx * w ;
            outPos[ 1 ] += ty * w ;
            outPos[ 2 ] += tz * w ;
            float nx, ny, nz ;
            desktop_mv1_mul_mat4x4ct_dir( M, v4->Normal, nx, ny, nz ) ;
            outNrm[ 0 ] += nx * w ;
            outNrm[ 1 ] += ny * w ;
            outNrm[ 2 ] += nz * w ;
        }
    } else if ( vertexType == MV1_VERTEX_TYPE_SKIN_8BONE && v8 ) {
        BYTE idx_all[ 8 ] ;
        for ( int k = 0 ; k < 4 ; ++k ) idx_all[ k ] = v8->MatrixIndex1[ k ] ;
        for ( int k = 0 ; k < 4 ; ++k ) idx_all[ 4 + k ] = v8->MatrixIndex2[ k ] ;
        for ( int k = 0 ; k < 8 ; ++k ) {
            float w = v8->MatrixWeight[ k ] ;
            if ( w <= 0.0f ) continue ;
            if ( idx_all[ k ] >= bd->UseBoneNum ) continue ;
            int boneIdx = bd->UseBone[ idx_all[ k ] ] ;
            if ( boneIdx < 0 ) continue ;
            MATRIX_4X4CT *M = Frame->UseSkinBoneMatrix[ boneIdx ] ;
            if ( !M ) continue ;
            FLOAT4 p = { v8->Position.x, v8->Position.y, v8->Position.z, 1.0f } ;
            float tx, ty, tz ;
            desktop_mv1_mul_mat4x4ct( M, p, tx, ty, tz ) ;
            outPos[ 0 ] += tx * w ;
            outPos[ 1 ] += ty * w ;
            outPos[ 2 ] += tz * w ;
            float nx, ny, nz ;
            desktop_mv1_mul_mat4x4ct_dir( M, v8->Normal, nx, ny, nz ) ;
            outNrm[ 0 ] += nx * w ;
            outNrm[ 1 ] += ny * w ;
            outNrm[ 2 ] += nz * w ;
        }
    }
}

// 頂点 index vi における world 空間位置を取得する (vertex type 毎に分岐)。
// スキニング付きは CPU 計算で bone アニメーションを反映 (v5)。
// FREEBONE (9 bone 以上) は可変長構造体 + MV1_MODEL.SkinBone 経由なので
// 未対応 (base position のまま、T ポーズ)。
static void desktop_mv1_get_vertex_pos(
    MV1_MESH *Mesh, MV1_TRIANGLE_LIST *TList, unsigned short vi,
    float outPos[ 3 ], float outNrm[ 3 ] )
{
    MV1_TRIANGLE_LIST_BASE *bd = TList->BaseData ;
    MV1_FRAME *Frame = Mesh ? Mesh->Container : nullptr ;
    outNrm[ 0 ] = 0 ; outNrm[ 1 ] = 1 ; outNrm[ 2 ] = 0 ;  // デフォルト上向き

    switch ( bd->VertexType ) {
    case MV1_VERTEX_TYPE_NORMAL: {
        const MV1_TLIST_NORMAL_POS &v = TList->NormalPosition[ vi ] ;
        outPos[ 0 ] = v.Position.x ; outPos[ 1 ] = v.Position.y ; outPos[ 2 ] = v.Position.z ;
        outNrm[ 0 ] = v.Normal.x   ; outNrm[ 1 ] = v.Normal.y   ; outNrm[ 2 ] = v.Normal.z ;
        return ;
    }
    case MV1_VERTEX_TYPE_SKIN_4BONE:
        desktop_mv1_skin_vertex( Frame, bd,
            &TList->SkinPosition4B[ vi ], nullptr,
            MV1_VERTEX_TYPE_SKIN_4BONE, outPos, outNrm ) ;
        return ;
    case MV1_VERTEX_TYPE_SKIN_8BONE:
        desktop_mv1_skin_vertex( Frame, bd,
            nullptr, &TList->SkinPosition8B[ vi ],
            MV1_VERTEX_TYPE_SKIN_8BONE, outPos, outNrm ) ;
        return ;
    case MV1_VERTEX_TYPE_SKIN_FREEBONE: {
        const unsigned char *base = ( const unsigned char * )TList->SkinPositionFREEB ;
        int unitSize = bd->PosUnitSize ;
        const MV1_TLIST_SKIN_POS_FREEB *v =
            ( const MV1_TLIST_SKIN_POS_FREEB * )( base + ( size_t )vi * unitSize ) ;
        outPos[ 0 ] = outPos[ 1 ] = outPos[ 2 ] = 0.0f ;
        outNrm[ 0 ] = outNrm[ 1 ] = outNrm[ 2 ] = 0.0f ;
        if ( !Frame || !Frame->UseSkinBoneMatrix ) {
            outPos[ 0 ] = v->Position.x ; outPos[ 1 ] = v->Position.y ; outPos[ 2 ] = v->Position.z ;
            outNrm[ 0 ] = v->Normal.x   ; outNrm[ 1 ] = v->Normal.y   ; outNrm[ 2 ] = v->Normal.z ;
            return ;
        }
        const MV1_SKINBONE_BLEND *b = v->MatrixWeight ;
        int maxBones = bd->MaxBoneNum > 0 ? bd->MaxBoneNum : 256 ;
        VECTOR n3 = { v->Normal.x, v->Normal.y, v->Normal.z } ;
        for ( int k = 0 ; k < maxBones && b[ k ].Index != -1 ; ++k ) {
            float w = b[ k ].W ;
            if ( w <= 0.0f ) continue ;
            int idx = b[ k ].Index ;
            MATRIX_4X4CT *M = Frame->UseSkinBoneMatrix[ idx ] ;
            if ( !M ) continue ;
            float tx, ty, tz ;
            desktop_mv1_mul_mat4x4ct( M, v->Position, tx, ty, tz ) ;
            outPos[ 0 ] += tx * w ;
            outPos[ 1 ] += ty * w ;
            outPos[ 2 ] += tz * w ;
            float nx, ny, nz ;
            desktop_mv1_mul_mat4x4ct_dir( M, n3, nx, ny, nz ) ;
            outNrm[ 0 ] += nx * w ;
            outNrm[ 1 ] += ny * w ;
            outNrm[ 2 ] += nz * w ;
        }
        return ;
    }
    default:
        outPos[ 0 ] = outPos[ 1 ] = outPos[ 2 ] = 0.0f ;
        return ;
    }
}

// Toon outline (inverted-hull 法): 頂点を法線方向に押し出した「反転殻」を
// 前面カリングで描画して輪郭線を作る。drawModel の 1 回目のパスとして呼ぶ。
static void desktop_mv1_draw_outline_pass( MV1_MESH *Mesh, MV1_TRIANGLE_LIST *TList )
{
    if ( !TList || !TList->BaseData ) return ;
    if ( !Mesh || !Mesh->BaseData || !Mesh->Material || !Mesh->Material->BaseData ) return ;
    MV1_MATERIAL_BASE *mb = Mesh->Material->BaseData ;
    float width = mb->OutLineWidth ;
    if ( width <= 0.0f ) return ;  // outline 無効なマテリアル
    MV1_TRIANGLE_LIST_BASE *bd = TList->BaseData ;
    if ( !bd->Index || bd->IndexNum < 3 ) return ;

    // 前面カリング (inverted-hull)
    glEnable( GL_CULL_FACE ) ;
    glCullFace( GL_FRONT ) ;
    glDisable( GL_TEXTURE_2D ) ;

    COLOR_F &oc = mb->OutLineColor ;
    glColor4f( oc.r, oc.g, oc.b, oc.a > 0 ? oc.a : 1.0f ) ;

    // Vertex-scale 係数: 頂点の ToonOutLineScale を material width に掛ける
    MV1_MESH_BASE *mbase = Mesh->BaseData ;
    unsigned char *vraw = ( unsigned char * )mbase->Vertex ;
    int vsize = mbase->VertUnitSize ;

    glBegin( GL_TRIANGLES ) ;
    for ( int i = 0 ; i + 2 < bd->IndexNum ; i += 3 ) {
        for ( int k = 0 ; k < 3 ; ++k ) {
            unsigned short vi = bd->Index[ i + k ] ;
            if ( vi >= bd->VertexNum ) continue ;
            float p[ 3 ], n[ 3 ] ;
            desktop_mv1_get_vertex_pos( Mesh, TList, vi, p, n ) ;

            // 頂点毎 scale
            DWORD meshVi = bd->MeshVertexIndex ? bd->MeshVertexIndex[ vi ] : ( DWORD )vi ;
            float vscale = 1.0f ;
            if ( vraw && vsize > 0 ) {
                MV1_MESH_VERTEX *mv = ( MV1_MESH_VERTEX * )( vraw + meshVi * vsize ) ;
                if ( mv->ToonOutLineScale > 0 ) vscale = mv->ToonOutLineScale ;
            }
            float w = width * vscale ;
            glVertex3f( p[ 0 ] + n[ 0 ] * w,
                        p[ 1 ] + n[ 1 ] * w,
                        p[ 2 ] + n[ 2 ] * w ) ;
        }
    }
    glEnd() ;

    // 元のカリング設定に戻す (呼び側が CullFace(GL_BACK) を改めて指定する想定)
    glCullFace( GL_BACK ) ;
}

// 単一トライアングルリストを描画。全 VertexType 対応。
static void desktop_mv1_draw_triangle_list( MV1_MESH *Mesh, MV1_TRIANGLE_LIST *TList )
{
    if ( !TList || !TList->BaseData ) return ;
    MV1_TRIANGLE_LIST_BASE *bd = TList->BaseData ;
    if ( !bd->Index || bd->IndexNum < 3 ) return ;
    if ( !Mesh || !Mesh->BaseData ) return ;
    // NormalPosition (union) ポインタが無効なら描画不可
    if ( !TList->NormalPosition ) return ;
    if ( !Mesh || !Mesh->BaseData ) return ;

    desktop_mv1_load_mt_funcs() ;

    // L4 Phase 2: optional GLSL shader path (宣言は file 末尾の extern "C" block)
    bool useGLSL = Desktop_MV1_IsGLSLEnabled() != 0 ;
    int  glslH   = useGLSL ? Desktop_MV1_GetShaderHandle() : 0 ;
    if ( useGLSL && glslH > 0 ) {
        DesktopShader_Use( glslH ) ;
    }

    // Toon 用の情報 (Material Type 1/2 = DX_MATERIAL_TYPE_TOON / TOON_2)
    bool    isToon    = false ;
    int     toonRampGraph = -1 ;   // Diffuse ramp の GraphHandle (ModelBase->Texture[] より引く)
    if ( Mesh->Material && Mesh->Material->BaseData ) {
        int mtype = Mesh->Material->BaseData->Type ;
        if ( mtype == 1 /*DX_MATERIAL_TYPE_TOON*/ || mtype == 2 /*TOON_2*/ ) {
            isToon = true ;
            int texIdx = Mesh->Material->BaseData->DiffuseGradTexture ;
            if ( texIdx >= 0 && Mesh->Container && Mesh->Container->BaseData &&
                 Mesh->Container->BaseData->Container ) {
                MV1_MODEL_BASE *modelBase = Mesh->Container->BaseData->Container ;
                if ( texIdx < modelBase->TextureNum && modelBase->Texture ) {
                    toonRampGraph = modelBase->Texture[ texIdx ].GraphHandle ;
                }
            }
        }
    }

    // Toon ramp LUT を CPU 側で作成 (テクスチャを GraphLock → 横軸 [0,1] の色に
    // サンプリングして 256 段階の ARGB LUT を作る)。このループ内で 1 回だけ。
    unsigned char toonRampLUT[ 256 ][ 4 ] = {} ;
    bool toonRampReady = false ;
    if ( isToon && toonRampGraph > 0 ) {
        int rw = 0, rh = 0 ;
        NS_GetGraphSize( toonRampGraph, &rw, &rh ) ;
        if ( rw > 0 && rh > 0 ) {
            int rp = 0 ; void *rd = nullptr ; COLORDATA *rcd = nullptr ;
            if ( NS_GraphLock( toonRampGraph, &rp, &rd, &rcd, FALSE ) == 0 ) {
                const unsigned char *pix = ( const unsigned char * )rd ;
                // 縦方向は中央行を使う (ramp は通常 1 行)
                int y0 = rh / 2 ;
                for ( int i = 0 ; i < 256 ; ++i ) {
                    int x = ( i * ( rw - 1 ) ) / 255 ;
                    const unsigned char *p = pix + y0 * rp + x * 4 ;
                    toonRampLUT[ i ][ 0 ] = p[ 0 ] ;
                    toonRampLUT[ i ][ 1 ] = p[ 1 ] ;
                    toonRampLUT[ i ][ 2 ] = p[ 2 ] ;
                    toonRampLUT[ i ][ 3 ] = p[ 3 ] ;
                }
                NS_GraphUnLock( toonRampGraph ) ;
                toonRampReady = true ;
            }
        }
    }

    // マテリアルから Diffuse と DiffuseLayer[0..N-1] (multi-texture) を取得
    GLubyte mR = 200, mG = 200, mB = 200, mA = 255 ;
    GLuint texId  = 0 ;        // layer 0 (メイン texture、multi-tex 無し経路と互換)
    int    layerN = 0 ;        // 有効 DiffuseLayer 数 (最大 4 までに制限)
    GLuint layerTex [ 8 ] = { 0 } ;
    int    layerBlend[ 8 ] = { 0 } ;
    // Specular Layer (TMU N 番目に bind して specular 乗算、効果は材質 Specular
    // に glMaterialfv で反映する代用として、RGB を Specular 色として modulate)
    // Normal Layer は shader 必須のため bind のみ (fixed-function では効果なし)
    GLuint specTex = 0 ;
    GLuint normTex = 0 ;
    bool useVertexColor = Mesh->BaseData->UseVertexDiffuseColor != 0 ;
    if ( Mesh->Material && Mesh->Material->BaseData ) {
        MV1_MATERIAL_BASE *mb = Mesh->Material->BaseData ;
        COLOR_F &d = mb->Diffuse ;
        float ds = Mesh->DrawMaterial.UseColorScale ? Mesh->DrawMaterial.DiffuseScale.r : 1.0f ;
        float dg = Mesh->DrawMaterial.UseColorScale ? Mesh->DrawMaterial.DiffuseScale.g : 1.0f ;
        float db = Mesh->DrawMaterial.UseColorScale ? Mesh->DrawMaterial.DiffuseScale.b : 1.0f ;
        float op = Mesh->DrawMaterial.OpacityRate ;
        if ( op <= 0 ) op = 1.0f ;
        mR = ( GLubyte )( fminf( d.r * ds, 1.0f ) * 255 ) ;
        mG = ( GLubyte )( fminf( d.g * dg, 1.0f ) * 255 ) ;
        mB = ( GLubyte )( fminf( d.b * db, 1.0f ) * 255 ) ;
        mA = ( GLubyte )( fminf( d.a * op, 1.0f ) * 255 ) ;
        int maxLayers = mb->DiffuseLayerNum ;
        if ( maxLayers > 4 ) maxLayers = 4 ;  // fixed-function は 4 TMU 程度まで安全
        for ( int li = 0 ; li < maxLayers ; ++li ) {
            GLuint t = desktop_mv1_tex_from_graph( mb->DiffuseLayer[ li ].GraphHandle ) ;
            if ( t == 0 ) continue ;
            layerTex  [ layerN ] = t ;
            layerBlend[ layerN ] = mb->DiffuseLayer[ li ].BlendType ;
            if ( layerN == 0 ) texId = t ;
            layerN++ ;
        }
        // Specular Layer[0] を拾う (複数ある場合は最初のものだけ)。
        // fixed-function では normal map shader 化が要るため効果は限定的。
        if ( mb->SpecularLayerNum > 0 ) {
            specTex = desktop_mv1_tex_from_graph( mb->SpecularLayer[ 0 ].GraphHandle ) ;
        }
        // Normal Layer[0] — fixed-function 下では bind のみ。将来の shader 化で使用
        if ( mb->NormalLayerNum > 0 ) {
            normTex = desktop_mv1_tex_from_graph( mb->NormalLayer[ 0 ].GraphHandle ) ;
            (void)normTex ;  // 現状は使用しない
        }
        // スペキュラ・エミッシブ (glMaterialfv で設定、ColorMaterial は
        // diffuse/ambient のみカバー)。specTex がある場合、per-material spec color
        // の代わりに中央 texel のRGB平均を取って近似 (本当は per-fragment 必要)
        if ( s_MV1_LightWasOn ) {
            float sclS = Mesh->DrawMaterial.UseColorScale ? Mesh->DrawMaterial.SpecularScale.r : 1.0f ;
            float sclE = Mesh->DrawMaterial.UseColorScale ? Mesh->DrawMaterial.EmissiveScale.r : 1.0f ;
            float spc[ 4 ] = {
                mb->Specular.r * sclS, mb->Specular.g * sclS, mb->Specular.b * sclS, 1.0f
            } ;
            float emi[ 4 ] = {
                mb->Emissive.r * sclE, mb->Emissive.g * sclE, mb->Emissive.b * sclE, 1.0f
            } ;
            glMaterialfv( GL_FRONT_AND_BACK, GL_SPECULAR, spc ) ;
            glMaterialfv( GL_FRONT_AND_BACK, GL_EMISSION, emi ) ;
            float power = mb->Power ;
            if ( power < 0.0f ) power = 0.0f ;
            if ( power > 128.0f ) power = 128.0f ;
            glMaterialf( GL_FRONT_AND_BACK, GL_SHININESS, power ) ;
        }
    }

    // Toon 材質はライティングを自前で (per-vertex dot + ramp)。
    // GL_LIGHTING を無効化し、描画後に復元する。
    GLboolean prevLighting = GL_FALSE ;
    if ( isToon ) {
        prevLighting = glIsEnabled( GL_LIGHTING ) ;
        if ( prevLighting ) glDisable( GL_LIGHTING ) ;
    }

    // ---- Shadow projective texture (TMU 4) ---------------------------------
    // SetUse_PF で g_ShadowActive が立てられ、g_ShadowLightMatrix (= Bias * VP) と
    // g_ShadowDepthTex がセットされている。MV1 は world-space 位置を glVertex3f で
    // 渡すため、glTexGen GL_OBJECT_LINEAR + identity plane + texture matrix で
    // 射影シャドウ座標を自動生成する。compare mode により陰影は depth 比較で決まる。
    extern int    g_ShadowActive ;
    extern GLuint g_ShadowDepthTex ;
    extern float  g_ShadowLightMatrix[ 16 ] ;
#ifdef GL_TEXTURE0
    bool useShadow = ( g_ShadowActive != 0 && g_ShadowDepthTex != 0 && p_glActiveTexture != nullptr ) ;
    if ( useShadow )
    {
        p_glActiveTexture( GL_TEXTURE0 + 4 ) ;
        glEnable( GL_TEXTURE_2D ) ;
        glBindTexture( GL_TEXTURE_2D, g_ShadowDepthTex ) ;
        // depth compare: ref_r <= tex_depth → 1.0 (lit), else 0.0 (shadowed)
#       ifndef GL_TEXTURE_COMPARE_MODE
#       define GL_TEXTURE_COMPARE_MODE       0x884C
#       define GL_TEXTURE_COMPARE_FUNC       0x884D
#       define GL_COMPARE_R_TO_TEXTURE       0x884E
#       define GL_DEPTH_TEXTURE_MODE         0x884B
#       endif
        glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_COMPARE_MODE, GL_COMPARE_R_TO_TEXTURE ) ;
        glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_COMPARE_FUNC, GL_LEQUAL ) ;
        glTexParameteri( GL_TEXTURE_2D, GL_DEPTH_TEXTURE_MODE,   GL_INTENSITY ) ;
        // TexGen: GL_OBJECT_LINEAR の identity plane (s,t,r,q ← x,y,z,1)
        const float pS[ 4 ] = { 1, 0, 0, 0 } ;
        const float pT[ 4 ] = { 0, 1, 0, 0 } ;
        const float pR[ 4 ] = { 0, 0, 1, 0 } ;
        const float pQ[ 4 ] = { 0, 0, 0, 1 } ;
        glTexGeni( GL_S, GL_TEXTURE_GEN_MODE, GL_OBJECT_LINEAR ) ;
        glTexGeni( GL_T, GL_TEXTURE_GEN_MODE, GL_OBJECT_LINEAR ) ;
        glTexGeni( GL_R, GL_TEXTURE_GEN_MODE, GL_OBJECT_LINEAR ) ;
        glTexGeni( GL_Q, GL_TEXTURE_GEN_MODE, GL_OBJECT_LINEAR ) ;
        glTexGenfv( GL_S, GL_OBJECT_PLANE, pS ) ;
        glTexGenfv( GL_T, GL_OBJECT_PLANE, pT ) ;
        glTexGenfv( GL_R, GL_OBJECT_PLANE, pR ) ;
        glTexGenfv( GL_Q, GL_OBJECT_PLANE, pQ ) ;
        glEnable( GL_TEXTURE_GEN_S ) ;
        glEnable( GL_TEXTURE_GEN_T ) ;
        glEnable( GL_TEXTURE_GEN_R ) ;
        glEnable( GL_TEXTURE_GEN_Q ) ;
        // Texture matrix = Bias * shadowVP (row-major)、glLoadMatrix は列 major
        // 解釈なので DxLib row-major をそのまま渡して意図通り動作する
        glMatrixMode( GL_TEXTURE ) ;
        glLoadMatrixf( g_ShadowLightMatrix ) ;
        glMatrixMode( GL_MODELVIEW ) ;
        // GL_MODULATE で diffuse × shadow_factor
        glTexEnvi( GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE ) ;
        p_glActiveTexture( GL_TEXTURE0 ) ;
    }
#else
    bool useShadow = false ;
#endif

    // BackCulling
    int bc = Mesh->BaseData->BackCulling ;
    if ( bc ) { glEnable( GL_CULL_FACE ) ; glCullFace( GL_BACK ) ; }
    else     { glDisable( GL_CULL_FACE ) ; }

    // テクスチャバインド (multi-texture 対応、最大 4 unit)
    //   Layer 0 : GL_MODULATE (glColor × tex)
    //   Layer 1+ : BlendType に応じて GL_ADD / GL_MODULATE / GL_DECAL
    //     DX_MATERIAL_BLENDTYPE_TRANSLUCENT(0) → GL_DECAL (tex alpha で混合)
    //     DX_MATERIAL_BLENDTYPE_ADDITIVE   (1) → GL_ADD
    //     DX_MATERIAL_BLENDTYPE_MODULATE   (2) → GL_MODULATE
    //     DX_MATERIAL_BLENDTYPE_NONE       (3) → GL_REPLACE
#ifdef GL_TEXTURE0
    auto to_tex_env = []( int bt ) -> GLenum {
        switch ( bt ) {
        case 1 /*ADDITIVE*/:   return GL_ADD ;
        case 2 /*MODULATE*/:   return GL_MODULATE ;
        case 3 /*NONE*/:       return GL_REPLACE ;
        default /*TRANSLUCENT*/: return GL_DECAL ;
        }
    } ;
    for ( int li = 0 ; li < layerN ; ++li ) {
        if ( p_glActiveTexture ) p_glActiveTexture( GL_TEXTURE0 + li ) ;
        glEnable( GL_TEXTURE_2D ) ;
        glBindTexture( GL_TEXTURE_2D, layerTex[ li ] ) ;
        GLenum mode = ( li == 0 ) ? GL_MODULATE : to_tex_env( layerBlend[ li ] ) ;
        glTexEnvi( GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, mode ) ;
    }
    if ( p_glActiveTexture ) p_glActiveTexture( GL_TEXTURE0 ) ;  // 頂点属性送信は TMU 0 を主とする
    if ( layerN == 0 ) glDisable( GL_TEXTURE_2D ) ;
#else
    if ( texId ) {
        glEnable( GL_TEXTURE_2D ) ;
        glBindTexture( GL_TEXTURE_2D, texId ) ;
        glTexEnvi( GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE ) ;
    } else {
        glDisable( GL_TEXTURE_2D ) ;
    }
#endif

    // 頂点データ配列 (UV / DiffuseColor を引くのに使う)。VertUnitSize 可変なので
    // ポインタ算術で要素取得する
    MV1_MESH_BASE *mb = Mesh->BaseData ;
    unsigned char *vraw = ( unsigned char * )mb->Vertex ;
    int vsize = mb->VertUnitSize ;
    bool hasUV = ( mb->UVUnitNum > 0 ) ;

    // GLSL shader 経路: uniform を現在の state に合わせて設定
    if ( useGLSL && glslH > 0 ) {
        DesktopShader_SetUniform1i( glslH, "u_diffuse0",     0 ) ;
        DesktopShader_SetUniform1i( glslH, "u_shadowMap",    4 ) ;
        DesktopShader_SetUniform1i( glslH, "u_normalMap",    2 ) ;
        DesktopShader_SetUniform1i( glslH, "u_specularMap",  3 ) ;
        DesktopShader_SetUniform1i( glslH, "u_diffuse1",     5 ) ;
        DesktopShader_SetUniform1i( glslH, "u_diffuse2",     6 ) ;
        DesktopShader_SetUniform1i( glslH, "u_diffuse3",     7 ) ;
        DesktopShader_SetUniform1i( glslH, "u_useTexture",   texId ? 1 : 0 ) ;
        DesktopShader_SetUniform1i( glslH, "u_useLighting",  ( s_MV1_LightWasOn && !isToon ) ? 1 : 0 ) ;
        DesktopShader_SetUniform1i( glslH, "u_useShadow",    useShadow ? 1 : 0 ) ;
        DesktopShader_SetUniform1i( glslH, "u_useNormalMap", normTex ? 1 : 0 ) ;
        DesktopShader_SetUniform1i( glslH, "u_useSpecularMap", specTex ? 1 : 0 ) ;
        //  Parallax mapping: normal map の alpha を height として使う。
        //  MV1 に explicit parallax flag が無いため、env var で opt-in。
        //  HEIGHTSCALE は 0.02 前後が標準 (高いと歪み)。
        static float s_parallaxScale = -1.0f ;
        if ( s_parallaxScale < 0.0f ) {
            const char *e = std::getenv( "HSP3DX_PARALLAX_SCALE" ) ;
            s_parallaxScale = e ? ( float )std::atof( e ) : 0.0f ;
        }
        DesktopShader_SetUniform1i( glslH, "u_useParallax", ( normTex && s_parallaxScale > 0.0f ) ? 1 : 0 ) ;
        DesktopShader_SetUniform1f( glslH, "u_parallaxHeightScale", s_parallaxScale ) ;
        //  DiffuseLayer[1..3]: 有効 layer 数 layerN を元に uniform 設定
        int d1 = ( layerN >= 2 ) ? 1 : 0 ;
        int d2 = ( layerN >= 3 ) ? 1 : 0 ;
        int d3 = ( layerN >= 4 ) ? 1 : 0 ;
        DesktopShader_SetUniform1i( glslH, "u_useDiffuse1", d1 ) ;
        DesktopShader_SetUniform1i( glslH, "u_useDiffuse2", d2 ) ;
        DesktopShader_SetUniform1i( glslH, "u_useDiffuse3", d3 ) ;
        DesktopShader_SetUniform1i( glslH, "u_blendMode1", d1 ? layerBlend[ 1 ] : 0 ) ;
        DesktopShader_SetUniform1i( glslH, "u_blendMode2", d2 ? layerBlend[ 2 ] : 0 ) ;
        DesktopShader_SetUniform1i( glslH, "u_blendMode3", d3 ? layerBlend[ 3 ] : 0 ) ;
        //  Toon ramp: CPU 側で作った 256 色 LUT を 256×1 texture に upload して TMU 8 に bind
        //  (texture は毎 mesh 更新するが、実用上 material 数分のキャッシュで十分)
        static GLuint s_ToonRampTex = 0 ;
        int useToonRamp = ( isToon && toonRampReady ) ? 1 : 0 ;
        if ( useToonRamp ) {
            if ( s_ToonRampTex == 0 ) glGenTextures( 1, &s_ToonRampTex ) ;
            p_glActiveTexture( GL_TEXTURE0 + 8 ) ;
            glBindTexture( GL_TEXTURE_2D, s_ToonRampTex ) ;
            glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR ) ;
            glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR ) ;
            glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE ) ;
            glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE ) ;
            //  toonRampLUT は BGRA バイト順 (DxLib ARGB8)、GL に RGBA で渡すので swap しない
            //  (blue ←→ red swap は DxLib からの sampling で逆回しされて整合する、以下の
            //   理由: CPU 版も同じ BGRA 読み出しを rB/rG/rR に map している)
            //  実害避けるため、RGBA 順に rearrange した buffer を別途作って渡す:
            static unsigned char rgba256[ 256 * 4 ] ;
            for ( int i = 0 ; i < 256 ; ++i ) {
                rgba256[ i * 4 + 0 ] = toonRampLUT[ i ][ 2 ] ;  //  R <- B
                rgba256[ i * 4 + 1 ] = toonRampLUT[ i ][ 1 ] ;  //  G
                rgba256[ i * 4 + 2 ] = toonRampLUT[ i ][ 0 ] ;  //  B <- R
                rgba256[ i * 4 + 3 ] = toonRampLUT[ i ][ 3 ] ;  //  A
            }
            glTexImage2D( GL_TEXTURE_2D, 0, GL_RGBA, 256, 1, 0, GL_RGBA, GL_UNSIGNED_BYTE, rgba256 ) ;
            p_glActiveTexture( GL_TEXTURE0 ) ;
        }
        DesktopShader_SetUniform1i( glslH, "u_toonRamp",    8 ) ;
        DesktopShader_SetUniform1i( glslH, "u_useToonRamp", useToonRamp ) ;
        //  主光源方向 (eye-space、g_MainLightDir* は既に反転済み)
        extern float g_MainLightDirX, g_MainLightDirY, g_MainLightDirZ ;
        float lx = g_MainLightDirX, ly = g_MainLightDirY, lz = g_MainLightDirZ ;
        float len = std::sqrt( lx*lx + ly*ly + lz*lz ) ;
        if ( len > 0.0001f ) { lx /= len ; ly /= len ; lz /= len ; }
        DesktopShader_SetUniform3f( glslH, "u_mainLightDirEye", lx, ly, lz ) ;
        // normal map は TMU 2、specular map は TMU 3 に bind
        if ( normTex && p_glActiveTexture ) {
            p_glActiveTexture( GL_TEXTURE0 + 2 ) ;
            glBindTexture( GL_TEXTURE_2D, normTex ) ;
            p_glActiveTexture( GL_TEXTURE0 ) ;
        }
        if ( specTex && p_glActiveTexture ) {
            p_glActiveTexture( GL_TEXTURE0 + 3 ) ;
            glBindTexture( GL_TEXTURE_2D, specTex ) ;
            p_glActiveTexture( GL_TEXTURE0 ) ;
        }
        //  DiffuseLayer[1..3] を TMU 5/6/7 に bind
        if ( p_glActiveTexture ) {
            if ( d1 && layerTex[ 1 ] ) {
                p_glActiveTexture( GL_TEXTURE0 + 5 ) ;
                glBindTexture( GL_TEXTURE_2D, layerTex[ 1 ] ) ;
            }
            if ( d2 && layerTex[ 2 ] ) {
                p_glActiveTexture( GL_TEXTURE0 + 6 ) ;
                glBindTexture( GL_TEXTURE_2D, layerTex[ 2 ] ) ;
            }
            if ( d3 && layerTex[ 3 ] ) {
                p_glActiveTexture( GL_TEXTURE0 + 7 ) ;
                glBindTexture( GL_TEXTURE_2D, layerTex[ 3 ] ) ;
            }
            p_glActiveTexture( GL_TEXTURE0 ) ;
        }
        float alphaTh = 0.0f ;
        if ( Mesh->Material && Mesh->Material->BaseData &&
             Mesh->Material->BaseData->UseAlphaTest ) {
            alphaTh = Mesh->Material->BaseData->AlphaRef / 255.0f ;
        }
        DesktopShader_SetUniform1f( glslH, "u_alphaThreshold", alphaTh ) ;
    }

    glBegin( GL_TRIANGLES ) ;
    for ( int i = 0 ; i + 2 < bd->IndexNum ; i += 3 ) {
        for ( int k = 0 ; k < 3 ; ++k ) {
            unsigned short vi = bd->Index[ i + k ] ;
            if ( vi >= bd->VertexNum ) { glEnd() ; glBegin( GL_TRIANGLES ) ; continue ; }

            // トライアングルリスト vi → メッシュ vertex メタ index
            DWORD meshVi = bd->MeshVertexIndex ? bd->MeshVertexIndex[ vi ] : ( DWORD )vi ;
            MV1_MESH_VERTEX *mv = ( vraw && vsize > 0 )
                ? ( MV1_MESH_VERTEX * )( vraw + meshVi * vsize )
                : nullptr ;

            if ( mv && hasUV && texId ) {
                glTexCoord2f( mv->UVs[ 0 ][ 0 ], mv->UVs[ 0 ][ 1 ] ) ;
#ifdef GL_TEXTURE0
                // multi-texture layer 1+ にも同じ UV を供給 (UV1 が別にあれば UVs[1] を使用)
                for ( int ti = 1 ; ti < layerN ; ++ti ) {
                    float u = mv->UVs[ 0 ][ 0 ] ;
                    float v = mv->UVs[ 0 ][ 1 ] ;
                    // UV unit が複数あれば対応する UV をバインド (2 段以上の tex UV)
                    if ( mb->UVUnitNum > ti ) {
                        u = mv->UVs[ ti ][ 0 ] ; v = mv->UVs[ ti ][ 1 ] ;
                    }
                    if ( p_glMultiTexCoord2f ) p_glMultiTexCoord2f( GL_TEXTURE0 + ti, u, v ) ;
                }
#endif
            }
            float p[ 3 ], n[ 3 ] ;
            desktop_mv1_get_vertex_pos( Mesh, TList, vi, p, n ) ;

            if ( isToon ) {
                // Toon: 主光源ベクトルとの dot product → ramp サンプリング → glColor
                extern float g_MainLightDirX, g_MainLightDirY, g_MainLightDirZ ;
                float lx = g_MainLightDirX, ly = g_MainLightDirY, lz = g_MainLightDirZ ;
                float dot = n[0] * lx + n[1] * ly + n[2] * lz ;
                if ( dot < 0 ) dot = 0 ;
                if ( dot > 1 ) dot = 1 ;
                int lutIdx = ( int )( dot * 255.0f + 0.5f ) ;
                if ( lutIdx < 0 ) lutIdx = 0 ; if ( lutIdx > 255 ) lutIdx = 255 ;
                unsigned char rR, rG, rB ;
                if ( toonRampReady ) {
                    // ramp は BGRA バイト順 (DxLib ARGB8)
                    rB = toonRampLUT[ lutIdx ][ 0 ] ;
                    rG = toonRampLUT[ lutIdx ][ 1 ] ;
                    rR = toonRampLUT[ lutIdx ][ 2 ] ;
                } else {
                    // ramp 無し: 3 段階量子化で toon-like
                    float q = ( dot < 0.3f ) ? 0.3f : ( ( dot < 0.7f ) ? 0.65f : 1.0f ) ;
                    rR = ( unsigned char )( mR * q ) ;
                    rG = ( unsigned char )( mG * q ) ;
                    rB = ( unsigned char )( mB * q ) ;
                }
                // マテリアル diffuse と乗算
                unsigned char cR = ( rR * mR ) / 255 ;
                unsigned char cG = ( rG * mG ) / 255 ;
                unsigned char cB = ( rB * mB ) / 255 ;
                glColor4ub( cR, cG, cB, mA ) ;
            } else if ( useVertexColor && mv ) {
                // COLOR_U8 は b,g,r,a 順 (DxLib 内部)
                glColor4ub( mv->DiffuseColor.r, mv->DiffuseColor.g,
                            mv->DiffuseColor.b, mv->DiffuseColor.a ) ;
            } else {
                glColor4ub( mR, mG, mB, mA ) ;
            }

            glNormal3f( n[ 0 ], n[ 1 ], n[ 2 ] ) ;
            glVertex3f( p[ 0 ], p[ 1 ], p[ 2 ] ) ;
        }
    }
    glEnd() ;

    // テクスチャアンバインド (multi-texture 対応)
#ifdef GL_TEXTURE0
    for ( int li = 0 ; li < layerN ; ++li ) {
        if ( p_glActiveTexture ) p_glActiveTexture( GL_TEXTURE0 + li ) ;
        glBindTexture( GL_TEXTURE_2D, 0 ) ;
        glDisable( GL_TEXTURE_2D ) ;
    }
    if ( p_glActiveTexture ) p_glActiveTexture( GL_TEXTURE0 ) ;
#else
    if ( texId ) {
        glBindTexture( GL_TEXTURE_2D, 0 ) ;
        glDisable( GL_TEXTURE_2D ) ;
    }
#endif

    // Shadow projective を使った場合、TMU 4 を unbind + texture matrix を identity に戻す
#ifdef GL_TEXTURE0
    if ( useShadow ) {
        p_glActiveTexture( GL_TEXTURE0 + 4 ) ;
        glDisable( GL_TEXTURE_GEN_S ) ;
        glDisable( GL_TEXTURE_GEN_T ) ;
        glDisable( GL_TEXTURE_GEN_R ) ;
        glDisable( GL_TEXTURE_GEN_Q ) ;
        glMatrixMode( GL_TEXTURE ) ;
        glLoadIdentity() ;
        glMatrixMode( GL_MODELVIEW ) ;
        glBindTexture( GL_TEXTURE_2D, 0 ) ;
        glDisable( GL_TEXTURE_2D ) ;
        p_glActiveTexture( GL_TEXTURE0 ) ;
    }
#endif

    // Toon で GL_LIGHTING を無効化した場合、復元
    if ( isToon && prevLighting ) glEnable( GL_LIGHTING ) ;

    // GLSL shader を使った場合、fixed-function に戻す
    if ( useGLSL && glslH > 0 ) DesktopShader_Use( 0 ) ;
}

extern void MV1_DrawMesh_PF( MV1_MESH *Mesh, int TriangleListIndex )
{
    if ( !Mesh || !Mesh->BaseData ) return ;
    if ( !Mesh->BaseData->Visible ) return ;

    MV1_MESH_BASE *mb = Mesh->BaseData ;
    // マテリアルに OutLineWidth > 0 があれば Toon 輪郭パス (inverted-hull) を先に
    bool hasOutline = ( Mesh->Material && Mesh->Material->BaseData &&
                         Mesh->Material->BaseData->OutLineWidth > 0.0f ) ;
    if ( hasOutline ) {
        // ライティング無しで単色塗り (outline 色)
        GLboolean wasLit = glIsEnabled( GL_LIGHTING ) ;
        if ( wasLit ) glDisable( GL_LIGHTING ) ;
        if ( TriangleListIndex < 0 ) {
            for ( int k = 0 ; k < mb->TriangleListNum ; ++k ) {
                desktop_mv1_draw_outline_pass( Mesh, &Mesh->TriangleList[ k ] ) ;
            }
        } else if ( TriangleListIndex < mb->TriangleListNum ) {
            desktop_mv1_draw_outline_pass( Mesh, &Mesh->TriangleList[ TriangleListIndex ] ) ;
        }
        if ( wasLit ) glEnable( GL_LIGHTING ) ;
    }

    if ( TriangleListIndex < 0 ) {
        // 全トライアングルリスト描画
        for ( int k = 0 ; k < mb->TriangleListNum ; ++k ) {
            desktop_mv1_draw_triangle_list( Mesh, &Mesh->TriangleList[ k ] ) ;
        }
    } else if ( TriangleListIndex < mb->TriangleListNum ) {
        desktop_mv1_draw_triangle_list( Mesh, &Mesh->TriangleList[ TriangleListIndex ] ) ;
    }
}

#ifndef DX_NON_NAMESPACE
} // end namespace DxLib
#endif

#endif // DX_NON_MODEL
