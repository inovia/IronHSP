//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2/ANGLE) 用 システム 実装 (Stage 4 最小版)
//
//      本来は NS_DxLib_Init() で Graphics/Sound/Input をまとめて初期化し、
//      DxGateway.cpp 経由で DxLib_Init() が呼ばれる。
//
//      Stage 4 時点ではまだ Graphics/Sound/Input を Desktop に移植していない
//      ので、DxLib_Init / DxLib_End は最小ログ出力のみ行い、後段の Stage で
//      徐々に本実装に置き換えていく。
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#include "DxSystemDesktop.h"
#include "../DxSystem.h"
#include "../DxLib.h"

#include <SDL.h>
#include <cstdio>
#include <cstring>
#include <cwchar>
#include <ctime>

// DxDesktop_MakeWinAndGL / KillWinAndGL は DxSystemDesktop.h で宣言済

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

// --- NS_DxLib_Init / NS_DxLib_End -----------------------------------------
// Stage 5: DxGateway.cpp に DxLib_Init / DxLib_End が定義されていて、
// それが NS_DxLib_Init / NS_DxLib_End を呼び出す。Desktop 版はここで最小実装。

// DxLib 内部の初期化関数 (別 .cpp から呼び出す前方宣言)
extern int InitializeBaseImageManage( void ) ;
extern int Graphics_Initialize( void ) ;

extern int NS_DxLib_Init( void )
{
    std::fprintf( stderr, "[DxLib Desktop] NS_DxLib_Init\n" ) ;
    if ( !SDL_WasInit( SDL_INIT_TIMER ) )
        SDL_InitSubSystem( SDL_INIT_TIMER ) ;

#ifndef DX_NON_GRAPHICS
    if ( ::DxDesktop_MakeWinAndGL( 640, 480, "hsp3dx dxlib_angle_sdl2" ) != 0 )
    {
        std::fprintf( stderr, "[DxLib Desktop] window creation failed\n" ) ;
        return -1 ;
    }

    // DxLib 内部 handle manager の初期化 (Stage 17 で必要)
    InitializeBaseImageManage() ;
    Graphics_Initialize() ;
#endif

    DxSysData.DxLib_InitializeFlag = TRUE ;
    return 0 ;
}

extern int NS_DxLib_End( void )
{
    std::fprintf( stderr, "[DxLib Desktop] NS_DxLib_End\n" ) ;
#ifndef DX_NON_GRAPHICS
    ::DxDesktop_KillWinAndGL() ;
#endif
    DxSysData.DxLib_InitializeFlag = FALSE ;
    return 0 ;
}

// --- タイマ --------------------------------------------------------------

extern ULONGLONG GetNowSysPerformanceCount( void )
{
    return ( ULONGLONG )SDL_GetPerformanceCounter() ;
}

extern ULONGLONG ConvMilliSecondsToSysPerformanceCount( ULONGLONG MilliSeconds )
{
    return MilliSeconds * ( ULONGLONG )SDL_GetPerformanceFrequency() / 1000ULL ;
}

extern ULONGLONG GetSysPerformanceFrequency( void )
{
    return ( ULONGLONG )SDL_GetPerformanceFrequency() ;
}

extern int GetNowCount( int UseRDTSCFlag )
{
    (void)UseRDTSCFlag;
    return ( int )SDL_GetTicks() ;
}

extern int GetDateTime( tagDATEDATA *DateBuf )
{
    if ( DateBuf == NULL ) return -1 ;
    std::time_t now = std::time( NULL ) ;
    std::tm *tm_ = std::localtime( &now ) ;
    DateBuf->Year   = tm_->tm_year + 1900 ;
    DateBuf->Mon    = tm_->tm_mon  + 1 ;
    DateBuf->Day    = tm_->tm_mday ;
    DateBuf->Hour   = tm_->tm_hour ;
    DateBuf->Min    = tm_->tm_min ;
    DateBuf->Sec    = tm_->tm_sec ;
    return 0 ;
}

// --- メッセージループ ----------------------------------------------------
// Stage 4 では SDL_PollEvent で quit のみ拾う。後段で入力/リサイズ等対応。

extern int NS_ProcessMessage( void )
{
    SDL_Event ev ;
    while ( SDL_PollEvent( &ev ) )
    {
        if ( ev.type == SDL_QUIT )
            return -1 ;
    }
    return 0 ;
}

// --- エラー出力 ----------------------------------------------------------

extern int DxLib_Error( const wchar_t *ErrorStr )
{
    if ( ErrorStr ) std::fwprintf( stderr, L"[DxLib Error] %ls\n", ErrorStr ) ;
    return -1 ;
}

extern int DxLib_ErrorUTF16LE( const char *ErrorStr )
{
    // UTF-16LE バイト列をそのまま stderr に流す (正しい文字化は後日)
    if ( ErrorStr ) std::fprintf( stderr, "[DxLib Error (UTF16LE)]\n" ) ;
    return -1 ;
}

// --- クリップボード (SDL2 経由) ------------------------------------------

extern int GetClipboardText_PF( char *Buffer, int BufferBytes )
{
    char *txt = SDL_GetClipboardText() ;
    if ( txt == NULL ) { if ( Buffer && BufferBytes ) Buffer[0] = '\0' ; return 0 ; }
    int len = ( int )std::strlen( txt ) ;
    if ( Buffer && BufferBytes > 0 )
    {
        int copy = len < BufferBytes - 1 ? len : BufferBytes - 1 ;
        std::memcpy( Buffer, txt, copy ) ;
        Buffer[ copy ] = '\0' ;
    }
    SDL_free( txt ) ;
    return len ;
}

extern int GetClipboardText_WCHAR_T_PF( wchar_t *Buffer, int BufferBytes )
{
    char utf8[ 4096 ] = {0} ;
    GetClipboardText_PF( utf8, sizeof( utf8 ) ) ;
    ConvString( utf8, -1, DX_CHARCODEFORMAT_UTF8,
                ( char * )Buffer, BufferBytes, WCHAR_T_CHARCODEFORMAT ) ;
    return 0 ;
}

extern int SetClipboardText_WCHAR_T_PF( const wchar_t *Text )
{
    char utf8[ 4096 ] = {0} ;
    ConvString( ( const char * )Text, -1, WCHAR_T_CHARCODEFORMAT,
                utf8, sizeof( utf8 ), DX_CHARCODEFORMAT_UTF8 ) ;
    SDL_SetClipboardText( utf8 ) ;
    return 0 ;
}

#ifndef DX_NON_NAMESPACE
}
#endif
