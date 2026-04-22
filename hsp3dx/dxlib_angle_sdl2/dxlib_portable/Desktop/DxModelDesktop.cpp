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

extern int  MV1_BeginRender_PF( MV1_MODEL *Model )
{
    (void)Model;
    // DxLib 側で既に SetTransformToView/Projection/World は呼ばれている。
    // 3D 描画用のセットアップ (ortho は切らない、depth/blend は呼び側管理)。
    glEnable( GL_DEPTH_TEST ) ;
    return 0 ;
}

extern int  MV1_EndRender_PF( void )
{
    // テクスチャ/ライティングを無効化 (Draw2D に戻す時のため)
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

// CPU スキニング。各頂点タイプごとに MatrixWeight × BoneMatrix を合成する。
static void desktop_mv1_skin_vertex(
    MV1_FRAME *Frame, MV1_TRIANGLE_LIST_BASE *bd,
    const MV1_TLIST_SKIN_POS_4B *v4,
    const MV1_TLIST_SKIN_POS_8B *v8,
    int vertexType, float out[ 3 ] )
{
    out[ 0 ] = out[ 1 ] = out[ 2 ] = 0.0f ;
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
            out[ 0 ] += tx * w ;
            out[ 1 ] += ty * w ;
            out[ 2 ] += tz * w ;
        }
    } else if ( vertexType == MV1_VERTEX_TYPE_SKIN_8BONE && v8 ) {
        // 8 bone は MatrixIndex1[4] + MatrixIndex2[4]、MatrixWeight[8]
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
            out[ 0 ] += tx * w ;
            out[ 1 ] += ty * w ;
            out[ 2 ] += tz * w ;
        }
    }
}

// 頂点 index vi における world 空間位置を取得する (vertex type 毎に分岐)。
// スキニング付きは CPU 計算で bone アニメーションを反映 (v5)。
// FREEBONE (9 bone 以上) は可変長構造体 + MV1_MODEL.SkinBone 経由なので
// 未対応 (base position のまま、T ポーズ)。
static void desktop_mv1_get_vertex_pos(
    MV1_MESH *Mesh, MV1_TRIANGLE_LIST *TList, unsigned short vi, float out[ 3 ] )
{
    MV1_TRIANGLE_LIST_BASE *bd = TList->BaseData ;
    MV1_FRAME *Frame = Mesh ? Mesh->Container : nullptr ;
    switch ( bd->VertexType ) {
    case MV1_VERTEX_TYPE_NORMAL:
        out[ 0 ] = TList->NormalPosition[ vi ].Position.x ;
        out[ 1 ] = TList->NormalPosition[ vi ].Position.y ;
        out[ 2 ] = TList->NormalPosition[ vi ].Position.z ;
        return ;
    case MV1_VERTEX_TYPE_SKIN_4BONE:
        desktop_mv1_skin_vertex( Frame, bd,
            &TList->SkinPosition4B[ vi ], nullptr,
            MV1_VERTEX_TYPE_SKIN_4BONE, out ) ;
        return ;
    case MV1_VERTEX_TYPE_SKIN_8BONE:
        desktop_mv1_skin_vertex( Frame, bd,
            nullptr, &TList->SkinPosition8B[ vi ],
            MV1_VERTEX_TYPE_SKIN_8BONE, out ) ;
        return ;
    case MV1_VERTEX_TYPE_SKIN_FREEBONE:
        out[ 0 ] = TList->SkinPositionFREEB[ vi ].Position.x ;
        out[ 1 ] = TList->SkinPositionFREEB[ vi ].Position.y ;
        out[ 2 ] = TList->SkinPositionFREEB[ vi ].Position.z ;
        return ;
    default:
        out[ 0 ] = out[ 1 ] = out[ 2 ] = 0.0f ;
        return ;
    }
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

    // マテリアルから Diffuse と DiffuseLayer[0] (diffuse texture) を取得
    GLubyte mR = 200, mG = 200, mB = 200, mA = 255 ;
    GLuint texId = 0 ;
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
        if ( mb->DiffuseLayerNum > 0 ) {
            texId = desktop_mv1_tex_from_graph( mb->DiffuseLayer[ 0 ].GraphHandle ) ;
        }
    }

    // BackCulling
    int bc = Mesh->BaseData->BackCulling ;
    if ( bc ) { glEnable( GL_CULL_FACE ) ; glCullFace( GL_BACK ) ; }
    else     { glDisable( GL_CULL_FACE ) ; }

    // テクスチャバインド
    if ( texId ) {
        glEnable( GL_TEXTURE_2D ) ;
        glBindTexture( GL_TEXTURE_2D, texId ) ;
        // GL_MODULATE で glColor と乗算 (デフォルト設定だが明示)
        glTexEnvi( GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE ) ;
    } else {
        glDisable( GL_TEXTURE_2D ) ;
    }

    // 頂点データ配列 (UV / DiffuseColor を引くのに使う)。VertUnitSize 可変なので
    // ポインタ算術で要素取得する
    MV1_MESH_BASE *mb = Mesh->BaseData ;
    unsigned char *vraw = ( unsigned char * )mb->Vertex ;
    int vsize = mb->VertUnitSize ;
    bool hasUV = ( mb->UVUnitNum > 0 ) ;

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
            }
            if ( useVertexColor && mv ) {
                // COLOR_U8 は b,g,r,a 順 (DxLib 内部)
                glColor4ub( mv->DiffuseColor.r, mv->DiffuseColor.g,
                            mv->DiffuseColor.b, mv->DiffuseColor.a ) ;
            } else {
                glColor4ub( mR, mG, mB, mA ) ;
            }

            float p[ 3 ] ;
            desktop_mv1_get_vertex_pos( Mesh, TList, vi, p ) ;
            glVertex3f( p[ 0 ], p[ 1 ], p[ 2 ] ) ;
        }
    }
    glEnd() ;

    if ( texId ) {
        glBindTexture( GL_TEXTURE_2D, 0 ) ;
        glDisable( GL_TEXTURE_2D ) ;
    }
}

extern void MV1_DrawMesh_PF( MV1_MESH *Mesh, int TriangleListIndex )
{
    if ( !Mesh || !Mesh->BaseData ) return ;
    if ( !Mesh->BaseData->Visible ) return ;

    MV1_MESH_BASE *mb = Mesh->BaseData ;
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
