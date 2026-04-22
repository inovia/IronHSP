//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2/ANGLE) 用 標準関数互換 実装
//
//      DxBaseFunciOS.cpp を desktop 向けに最小移植したもの
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#include "DxBaseFuncDesktop.h"
#include "../DxBaseFunc.h"
#include "../DxChar.h"
#include "../DxLog.h"

#include <math.h>

#ifdef _WIN32
  #include <direct.h>
  #define DESKTOP_GETCWD  _getcwd
  #define DESKTOP_CHDIR   _chdir
#else
  #include <unistd.h>
  #define DESKTOP_GETCWD  getcwd
  #define DESKTOP_CHDIR   chdir
#endif

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

#define CURRENTDIRECTORY_MAX_LENGTH		(2048)

static wchar_t g_CurrentDirectory[ CURRENTDIRECTORY_MAX_LENGTH ] = L"";

extern void _SET_DEFAULT_CHARCODEFORMAT( void )
{
    _SET_WCHAR_T_CHARCODEFORMAT( sizeof( wchar_t ) > 2
                                  ? DX_CHARCODEFORMAT_UTF32LE
                                  : DX_CHARCODEFORMAT_UTF16LE ) ;
    _SET_CHARSET( DX_CHARSET_UTF8 ) ;
    _SET_CHAR_CHARCODEFORMAT( DX_CHARCODEFORMAT_UTF8 ) ;
}

extern char *_GETCWD( char *Buffer, size_t BufferBytes )
{
    return DESKTOP_GETCWD( Buffer, (int)BufferBytes ) ;
}

extern wchar_t *_WGETCWD( wchar_t *Buffer, size_t BufferBytes )
{
    char tmp[ CURRENTDIRECTORY_MAX_LENGTH ] = {0};
    if ( DESKTOP_GETCWD( tmp, (int)sizeof( tmp ) ) == nullptr )
        return nullptr;
    ConvString( tmp, -1, CHAR_CHARCODEFORMAT,
                ( char * )Buffer, BufferBytes, WCHAR_T_CHARCODEFORMAT ) ;
    return Buffer ;
}

extern int _CHDIR( const char *DirName )
{
    return DESKTOP_CHDIR( DirName ) == 0 ? 0 : -1 ;
}

extern int _WCHDIR( const wchar_t *DirName )
{
    char tmp[ CURRENTDIRECTORY_MAX_LENGTH ] = {0};
    ConvString( ( const char * )DirName, -1, WCHAR_T_CHARCODEFORMAT,
                tmp, sizeof( tmp ), CHAR_CHARCODEFORMAT ) ;
    return _CHDIR( tmp ) ;
}

extern int _FPCLASS( double x )
{
    int Return = 0 ;
    if ( isnan( x ) ) {
        Return = _FPCLASS_SNAN ;
    } else if ( isinf( x ) ) {
        Return = _FPCLASS_NINF ;
    }
    return Return ;
}

#ifndef DX_NON_NAMESPACE
}
#endif
