//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2/ANGLE) 用 スレッド 実装
//
//      THREAD_INFO / DX_CRITICAL_SECTION は void* で SDL2 ハンドルを保持する。
//      実装側でキャストして使う。
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#include "DxThreadDesktop.h"
#include "../DxMemory.h"
#include "../DxBaseFunc.h"

#include <SDL.h>
#include <SDL_thread.h>
#include <SDL_mutex.h>
#include <SDL_timer.h>

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

static inline SDL_mutex  *to_mutex ( void *p ) { return (SDL_mutex  *)p ; }
static inline SDL_cond   *to_cond  ( void *p ) { return (SDL_cond   *)p ; }
static inline SDL_Thread *to_thread( void *p ) { return (SDL_Thread *)p ; }

extern void Thread_Initialize( void ) { }

static int ThreadRunFunction( void *pArgBlock )
{
    THREAD_INFO *pInfo = ( THREAD_INFO * )pArgBlock ;
    Thread_Suspend( pInfo ) ;
    pInfo->pFunction( pInfo, pInfo->pParam ) ;
    return 0 ;
}

extern int Thread_Create( THREAD_INFO *pThreadInfo, void ( *pFunction )( THREAD_INFO *, void * ), void *pParam )
{
    pThreadInfo->Thread_valid     = 0 ;
    pThreadInfo->Threadattr_valid = 0 ;
    pThreadInfo->Cond_valid       = 0 ;
    pThreadInfo->Mutex_valid      = 0 ;
    pThreadInfo->Mutexaddr_valid  = 0 ;
    pThreadInfo->SuspendFlag      = FALSE ;
    pThreadInfo->pFunction        = pFunction ;
    pThreadInfo->pParam           = pParam ;
    pThreadInfo->Mutex            = NULL ;
    pThreadInfo->Cond             = NULL ;
    pThreadInfo->Thread           = NULL ;

    pThreadInfo->Mutex = SDL_CreateMutex() ;
    if ( pThreadInfo->Mutex == NULL ) goto ERR ;
    pThreadInfo->Mutex_valid = 1 ;

    pThreadInfo->Cond = SDL_CreateCond() ;
    if ( pThreadInfo->Cond == NULL ) goto ERR ;
    pThreadInfo->Cond_valid = 1 ;

    pThreadInfo->Thread = SDL_CreateThread( ThreadRunFunction, "DxLib_Thread", pThreadInfo ) ;
    if ( pThreadInfo->Thread == NULL ) goto ERR ;
    pThreadInfo->Thread_valid = 1 ;

    return 0 ;

ERR:
    if ( pThreadInfo->Mutex_valid )  { SDL_DestroyMutex( to_mutex ( pThreadInfo->Mutex  ) ) ; pThreadInfo->Mutex_valid  = 0 ; pThreadInfo->Mutex  = NULL ; }
    if ( pThreadInfo->Cond_valid )   { SDL_DestroyCond ( to_cond  ( pThreadInfo->Cond   ) ) ; pThreadInfo->Cond_valid   = 0 ; pThreadInfo->Cond   = NULL ; }
    if ( pThreadInfo->Thread_valid ) { SDL_DetachThread( to_thread( pThreadInfo->Thread ) ) ; pThreadInfo->Thread_valid = 0 ; pThreadInfo->Thread = NULL ; }
    return -1 ;
}

extern void Thread_Delete( THREAD_INFO *pThreadInfo )
{
    if ( pThreadInfo->Thread_valid ) { SDL_DetachThread( to_thread( pThreadInfo->Thread ) ) ; pThreadInfo->Thread_valid = 0 ; pThreadInfo->Thread = NULL ; }
    if ( pThreadInfo->Cond_valid )   { SDL_DestroyCond ( to_cond  ( pThreadInfo->Cond   ) ) ; pThreadInfo->Cond_valid   = 0 ; pThreadInfo->Cond   = NULL ; }
    if ( pThreadInfo->Mutex_valid )  { SDL_DestroyMutex( to_mutex ( pThreadInfo->Mutex  ) ) ; pThreadInfo->Mutex_valid  = 0 ; pThreadInfo->Mutex  = NULL ; }
}

extern int Thread_IsValid( THREAD_INFO *pThreadInfo )
{
    return pThreadInfo->Thread_valid ;
}

extern void Thread_SetPriority( THREAD_INFO *pThreadInfo, int Priority )
{
    (void)pThreadInfo;  // SDL2 はカレントスレッドの priority のみ設定可
    SDL_ThreadPriority p = SDL_THREAD_PRIORITY_NORMAL ;
    switch ( Priority ) {
        case DX_THREAD_PRIORITY_LOWEST:       p = SDL_THREAD_PRIORITY_LOW    ; break ;
        case DX_THREAD_PRIORITY_BELOW_NORMAL: p = SDL_THREAD_PRIORITY_LOW    ; break ;
        case DX_THREAD_PRIORITY_NORMAL:       p = SDL_THREAD_PRIORITY_NORMAL ; break ;
        case DX_THREAD_PRIORITY_HIGHEST:      p = SDL_THREAD_PRIORITY_HIGH   ; break ;
    }
    SDL_SetThreadPriority( p ) ;
}

extern DWORD_PTR Thread_GetCurrentId( void )
{
    return ( DWORD_PTR )SDL_ThreadID() ;
}

extern DWORD_PTR Thread_GetId( THREAD_INFO *pThreadInfo )
{
    return ( DWORD_PTR )SDL_GetThreadID( to_thread( pThreadInfo->Thread ) ) ;
}

extern void Thread_Suspend( THREAD_INFO *pThreadInfo )
{
    SDL_LockMutex( to_mutex( pThreadInfo->Mutex ) ) ;
    pThreadInfo->SuspendFlag = TRUE ;
    SDL_CondWait( to_cond( pThreadInfo->Cond ), to_mutex( pThreadInfo->Mutex ) ) ;
    SDL_UnlockMutex( to_mutex( pThreadInfo->Mutex ) ) ;
}

extern int Thread_Resume( THREAD_INFO *pThreadInfo )
{
    SDL_LockMutex( to_mutex( pThreadInfo->Mutex ) ) ;
    if ( pThreadInfo->SuspendFlag == FALSE )
    {
        SDL_UnlockMutex( to_mutex( pThreadInfo->Mutex ) ) ;
        return 0 ;
    }
    pThreadInfo->SuspendFlag = FALSE ;
    SDL_CondSignal( to_cond( pThreadInfo->Cond ) ) ;
    SDL_UnlockMutex( to_mutex( pThreadInfo->Mutex ) ) ;
    return 1 ;
}

extern void Thread_Sleep( DWORD MiliSecond )
{
    SDL_Delay( ( Uint32 )MiliSecond ) ;
}

extern int CriticalSection_Initialize( DX_CRITICAL_SECTION *pCSection )
{
    pCSection->Mutex_valid     = 0 ;
    pCSection->Mutexaddr_valid = 0 ;
    pCSection->Mutex           = SDL_CreateMutex() ;
    if ( pCSection->Mutex == NULL )
        return -1 ;
    pCSection->Mutex_valid = 1 ;
#if defined( _DEBUG )
    pCSection->FilePath[ 0 ] = '\0' ;
    pCSection->LineNo        = 0 ;
    pCSection->ThreadID      = 0 ;
#endif
    return 0 ;
}

extern int CriticalSection_Delete( DX_CRITICAL_SECTION *pCSection )
{
    if ( pCSection->Mutex_valid )
    {
        SDL_DestroyMutex( to_mutex( pCSection->Mutex ) ) ;
        pCSection->Mutex_valid = 0 ;
        pCSection->Mutex       = NULL ;
    }
    return 0 ;
}

extern int CriticalSection_Lock( DX_CRITICAL_SECTION *pCSection, const char *FilePath, int LineNo )
{
    (void)FilePath; (void)LineNo;
    SDL_LockMutex( to_mutex( pCSection->Mutex ) ) ;
#if defined( _DEBUG )
    if ( FilePath ) {
        int Length = ( int )_STRLEN( FilePath ) ;
        if ( Length >= 512 ) Length = 511 ;
        _MEMCPY( pCSection->FilePath, FilePath, ( size_t )Length ) ;
        pCSection->FilePath[ Length ] = '\0' ;
        pCSection->LineNo   = LineNo ;
        pCSection->ThreadID = Thread_GetCurrentId() ;
    }
#endif
    return 0 ;
}

extern int CriticalSection_Lock( DX_CRITICAL_SECTION *pCSection )
{
    return CriticalSection_Lock( pCSection, NULL, 0 ) ;
}

extern int CriticalSection_Unlock( DX_CRITICAL_SECTION *pCSection )
{
    SDL_UnlockMutex( to_mutex( pCSection->Mutex ) ) ;
    return 0 ;
}

#ifndef DX_NON_NAMESPACE
}
#endif
