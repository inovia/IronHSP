// -------------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2/ANGLE) 用 スレッド ヘッダ
//
//      iOS は pthread 直接、Desktop は SDL2 thread API 経由で実装する。
//      SDL2 ヘッダは .cpp 側だけでインクルードするため、本ヘッダでは
//      SDL_* 型を void* で持つ (実装側でキャスト)。
//
// -------------------------------------------------------------------------------

#ifndef DX_THREADDESKTOP_H
#define DX_THREADDESKTOP_H

#include "../DxCompileConfig.h"

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

// クリティカルセクション (SDL2 mutex を void* で保持)
struct DX_CRITICAL_SECTION
{
    int     Mutex_valid ;
    void   *Mutex ;                  // 実体は SDL_mutex*
    int     Mutexaddr_valid ;        // 未使用 (iOS struct 互換)
#if defined( _DEBUG )
    char    FilePath[ 512 ] ;
    int     LineNo ;
    DWORD_PTR ThreadID ;
#endif
} ;

// 一つのスレッドの情報 (SDL2 thread を void* で保持)
struct THREAD_INFO
{
    void  ( *pFunction )( THREAD_INFO *, void * ) ;
    void   *pParam ;
    int     Thread_valid ;
    void   *Thread ;                 // SDL_Thread*
    int     Threadattr_valid ;       // 未使用
    int     Cond_valid ;
    void   *Cond ;                   // SDL_cond*
    int     Mutex_valid ;
    void   *Mutex ;                  // SDL_mutex*
    int     Mutexaddr_valid ;        // 未使用
    int     SuspendFlag ;
} ;

#ifndef DX_NON_NAMESPACE
}
#endif

#endif // DX_THREADDESKTOP_H
