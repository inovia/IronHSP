// -------------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2/GL compat) 用 DxModel ヘッダ
//      iOS DxModeliOS.h の struct 定義を踏襲。GLuint は DxGLuint typedef。
//
// -------------------------------------------------------------------------------

#ifndef DX_MODEL_DESKTOP_H
#define DX_MODEL_DESKTOP_H

#include "../DxCompileConfig.h"

#ifndef DX_NON_MODEL

#include "../DxLib.h"
#include "../DxModel.h"
#include "DxGraphicsDesktop.h"  // DxGLuint / DxGLint 定義

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

// Desktop 用 モデルデータ管理用構造体
struct MV1_MODEL_MANAGE_DESKTOP
{
    void *      CommonBuffer ;         // シェイプ更新用汎用バッファ
    int         CommonBufferSize ;     // 汎用バッファサイズ
    int         EnableLightNum ;       // 有効ライト数
} ;

// Desktop 用 頂点バッファ環境依存情報
struct MV1_VERTEXBUFFER_PF
{
    DxGLuint    VertexBufferObject ;   // glGenBuffers の頂点 VBO
    DxGLuint    IndexBufferObject ;    // glGenBuffers の要素 IBO
} ;

// Desktop 用 トライアングルリスト基データ環境依存情報
struct MV1_TRIANGLE_LIST_BASE_PF
{
    BYTE        SkinFreeBoneVertexBufferUpdate ;
    void *      SkinFreeBoneVertexBuffer ;
} ;

// Desktop 用 トライアングルリスト環境依存情報
struct MV1_TRIANGLE_LIST_PF
{
    void *      SkinFreeBoneVertexPositionBuffer ;
    DxGLuint    VertexBufferObject ;
} ;

// 内部大域変数
extern MV1_MODEL_MANAGE_DESKTOP MV1Man_Desktop ;

// 汎用バッファ関数
extern int MV1_Desktop_CommonBuffer_Setup   ( int Size ) ;
extern int MV1_Desktop_CommonBuffer_Terminate( void ) ;

#ifndef DX_NON_NAMESPACE
}
#endif

#endif // DX_NON_MODEL

#endif // DX_MODEL_DESKTOP_H
