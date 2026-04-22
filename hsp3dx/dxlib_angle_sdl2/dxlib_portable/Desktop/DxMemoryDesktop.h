// -------------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2/ANGLE) 用 メモリ ヘッダ
//
// -------------------------------------------------------------------------------

#ifndef DX_MEMORYDESKTOP_H
#define DX_MEMORYDESKTOP_H

#include "../DxCompileConfig.h"
#include "../DxHeap.h"

#define DXMEMORY_SMALLHEAP_UNITSIZE		( 4 * 1024 * 1024)
#define DXMEMORY_BIGHEAP_UNITSIZE		(32 * 1024 * 1024)
#define DXMEMORY_SMALL_MAX_SIZE			(64 * 1024)

// Desktop 用ヒープの情報 (iOS 版と同構造)
struct PLATFORMHEAP_DESKTOP
{
    void  *AllocAddress ;
    size_t AllocSize ;
} ;

#endif // DX_MEMORYDESKTOP_H
