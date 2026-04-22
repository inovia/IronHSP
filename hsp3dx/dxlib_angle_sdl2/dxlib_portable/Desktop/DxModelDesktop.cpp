//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2+GL) 用 モデル 実装 (最小版 stub)
//
//      DxModel.cpp (34113 行) の CPU 側コードをコンパイル可能にするため、
//      MV1_*_PF (14 個) を no-op stub 実装で提供する。モデルロード API は呼べる
//      が実際の 3D 描画は出ない。
//
//      完全実装は iOS DxModeliOS.cpp (4238 行) 相当の GL VBO + シェーダ + スキン
//      アニメーション。次段で対応予定。
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

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

extern int  MV1_Terminate_PF                              ( void )                                   { return 0 ; }
extern int  MV1_TerminateModelBaseHandle_PF               ( MV1_MODEL_BASE *ModelBase )              { (void)ModelBase; return 0 ; }
extern int  MV1_TerminateTriangleListBaseTempBuffer_PF    ( MV1_TRIANGLE_LIST_BASE *MBTList )        { (void)MBTList; return 0 ; }
extern void MV1_SetupPackDrawInfo_PF                      ( MV1_MODEL_BASE *ModelBase )              { (void)ModelBase; }
extern int  MV1_SetupVertexBufferBase_PF                  ( int MV1ModelBaseHandle, int DuplicateNum, int ASyncThread ) { (void)MV1ModelBaseHandle; (void)DuplicateNum; (void)ASyncThread; return 0 ; }
extern int  MV1_SetupVertexBuffer_PF                      ( int MHandle, int ASyncThread )           { (void)MHandle; (void)ASyncThread; return 0 ; }
extern int  MV1_TerminateVertexBufferBase_PF              ( int MV1ModelBaseHandle )                 { (void)MV1ModelBaseHandle; return 0 ; }
extern int  MV1_TerminateVertexBuffer_PF                  ( int MV1ModelHandle )                     { (void)MV1ModelHandle; return 0 ; }
extern int  MV1_SetupShapeVertex_PF                       ( int MHandle )                            { (void)MHandle; return 0 ; }
extern int  MV1_BeginRender_PF                            ( MV1_MODEL *Model )                       { (void)Model; return 0 ; }
extern int  MV1_EndRender_PF                              ( void )                                   { return 0 ; }
extern void MV1_DrawMesh_PF                               ( MV1_MESH *Mesh, int TriangleListIndex )  { (void)Mesh; (void)TriangleListIndex; }

#ifndef DX_NON_NAMESPACE
} // end namespace DxLib
#endif

#endif // DX_NON_MODEL
