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

// 単一トライアングルリストを描画 (MV1_VERTEX_TYPE_NORMAL のみ、material color で塗る)
static void desktop_mv1_draw_triangle_list( MV1_MESH *Mesh, MV1_TRIANGLE_LIST *TList )
{
    if ( !TList || !TList->BaseData ) return ;
    MV1_TRIANGLE_LIST_BASE *bd = TList->BaseData ;
    if ( bd->VertexType != MV1_VERTEX_TYPE_NORMAL ) {
        // skinning 版は未実装 (4BONE / 8BONE / FREEBONE)。スキニング無しの
        // NORMAL タイプのみ描画する。
        return ;
    }
    if ( !TList->NormalPosition || !bd->Index || bd->IndexNum < 3 ) return ;

    // マテリアル色 (diffuse) を取得
    GLubyte r = 200, g = 200, b = 200, a = 255 ;
    if ( Mesh && Mesh->Material && Mesh->Material->BaseData ) {
        COLOR_F &d = Mesh->Material->BaseData->Diffuse ;
        float ds = Mesh->DrawMaterial.UseColorScale ? Mesh->DrawMaterial.DiffuseScale.r : 1.0f ;
        float dg = Mesh->DrawMaterial.UseColorScale ? Mesh->DrawMaterial.DiffuseScale.g : 1.0f ;
        float db = Mesh->DrawMaterial.UseColorScale ? Mesh->DrawMaterial.DiffuseScale.b : 1.0f ;
        float op = Mesh->DrawMaterial.OpacityRate ;
        if ( op <= 0 ) op = 1.0f ;
        r = ( GLubyte )( fminf( d.r * ds, 1.0f ) * 255 ) ;
        g = ( GLubyte )( fminf( d.g * dg, 1.0f ) * 255 ) ;
        b = ( GLubyte )( fminf( d.b * db, 1.0f ) * 255 ) ;
        a = ( GLubyte )( fminf( d.a * op, 1.0f ) * 255 ) ;
    }

    // BackCulling (mesh base 側フラグ) を尊重
    int bc = Mesh && Mesh->BaseData ? Mesh->BaseData->BackCulling : 1 ;
    if ( bc ) { glEnable( GL_CULL_FACE ) ; glCullFace( GL_BACK ) ; }
    else     { glDisable( GL_CULL_FACE ) ; }

    glDisable( GL_TEXTURE_2D ) ;
    glColor4ub( r, g, b, a ) ;

    glBegin( GL_TRIANGLES ) ;
    for ( int i = 0 ; i + 2 < bd->IndexNum ; i += 3 ) {
        unsigned short i0 = bd->Index[ i + 0 ] ;
        unsigned short i1 = bd->Index[ i + 1 ] ;
        unsigned short i2 = bd->Index[ i + 2 ] ;
        if ( i0 >= bd->VertexNum || i1 >= bd->VertexNum || i2 >= bd->VertexNum ) continue ;
        glVertex3f( TList->NormalPosition[ i0 ].Position.x,
                    TList->NormalPosition[ i0 ].Position.y,
                    TList->NormalPosition[ i0 ].Position.z ) ;
        glVertex3f( TList->NormalPosition[ i1 ].Position.x,
                    TList->NormalPosition[ i1 ].Position.y,
                    TList->NormalPosition[ i1 ].Position.z ) ;
        glVertex3f( TList->NormalPosition[ i2 ].Position.x,
                    TList->NormalPosition[ i2 ].Position.y,
                    TList->NormalPosition[ i2 ].Position.z ) ;
    }
    glEnd() ;
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
