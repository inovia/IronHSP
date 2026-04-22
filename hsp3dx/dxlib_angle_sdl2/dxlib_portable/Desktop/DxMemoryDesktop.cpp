//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2/ANGLE) 用 メモリ 実装
//      DxMemoryiOS.cpp の最小移植 (iOS → PLATFORMHEAP_DESKTOP に名称変更のみ)
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#include "../DxMemory.h"
#include "../DxLog.h"
#include "../DxBaseFunc.h"
#include "DxMemoryDesktop.h"

#include <stdlib.h>
#include <new>
#include <cstdlib>
#include <cerrno>

#ifndef DX_NON_NAMESPACE
using namespace DxLib ;
namespace DxLib
{
#endif

extern int MemoryInitialize_PF( void )                { return 0 ; }
extern int MemoryTerminate_PF( void )                 { return 0 ; }
extern int MemoryProcess_PF( void )                   { return 0 ; }
extern int MemoryErrorCheck_PF( void )                { return 0 ; }

extern int NormalMemory_AutoAlloc_CreateHeapCallback_PF( int Param, void *Buffer, ALLOCMEM_SIZE_TYPE Size )
{
    (void)Param;
    PLATFORMHEAP_DESKTOP *h = ( PLATFORMHEAP_DESKTOP * )Buffer ;
    if ( sizeof( PLATFORMHEAP_DESKTOP ) > ALLOCHEAP_CALLBACK_INFO_SIZE )
    {
        // コールバック情報のバッファサイズ不足 → 意図的にクラッシュ
        *( ( volatile DWORD * )0x00000000 ) = 0xffffffff ;
    }
    h->AllocAddress = malloc( Size ) ;
    if ( h->AllocAddress == NULL )
        return -1 ;
    h->AllocSize = Size ;
    return 0 ;
}

extern void *NormalMemory_AutoAlloc_GetHeapAddressCallback_PF( int Param, void *Buffer )
{
    (void)Param;
    return ( ( PLATFORMHEAP_DESKTOP * )Buffer )->AllocAddress ;
}

extern ALLOCMEM_SIZE_TYPE NormalMemory_AutoAlloc_GetHeapSizeCallback_PF( int Param, void *Buffer )
{
    (void)Param;
    return ( ALLOCMEM_SIZE_TYPE )( ( PLATFORMHEAP_DESKTOP * )Buffer )->AllocSize ;
}

extern int NormalMemory_AutoAlloc_DeleteHeapCallback_PF( int Param, void *Buffer )
{
    (void)Param;
    free( ( ( PLATFORMHEAP_DESKTOP * )Buffer )->AllocAddress ) ;
    return 0 ;
}

extern int DxDumpAlloc_PF( void )                     { return 0 ; }

#ifndef DX_NON_NAMESPACE
}
#endif
