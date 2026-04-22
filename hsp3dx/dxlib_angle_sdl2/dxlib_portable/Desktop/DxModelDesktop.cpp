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

#include <cstdio>
#include <cstring>
#include <cstdlib>

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
    // TODO: シェーダ切替 + transform 行列 + ライト設定
    return 0 ;
}

extern int  MV1_EndRender_PF( void )
{
    return 0 ;
}

extern void MV1_DrawMesh_PF( MV1_MESH *Mesh, int TriangleListIndex )
{
    (void)Mesh; (void)TriangleListIndex;
    // TODO: glDrawElements で描画。未実装なので黙って何も描かない。
}

#ifndef DX_NON_NAMESPACE
} // end namespace DxLib
#endif

#endif // DX_NON_MODEL
