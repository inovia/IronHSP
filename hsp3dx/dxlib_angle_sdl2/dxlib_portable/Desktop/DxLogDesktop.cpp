//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2/ANGLE) 用 ログ 実装
//
//      DxLogiOS.cpp をベースに desktop 向けに移植したもの
//      - NSLog → fprintf(stderr,...)
//      - GetDocumentsDirPathForChar → SDL_GetPrefPath (後で) / 暫定 cwd
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#include "../DxCompileConfig.h"

#ifndef DX_NON_LOG

#include "DxLogDesktop.h"
#include "DxFileDesktop.h"
#include "../DxStatic.h"
#include "../DxLib.h"
#include "../DxLog.h"
#include "../DxBaseFunc.h"
#include "../DxMemory.h"
#include "../DxChar.h"

#include <wchar.h>
#include <cstdio>
#include <cstring>

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

// ログファイルを初期化する処理の環境依存部分
extern int LogFileInitialize_PF( const wchar_t *LogFilePath )
{
    (void)LogFilePath;

    // 既に初期化済みの場合は何もしない
    if ( LogData.PF.InitializeFlag == TRUE )
        return 0 ;

    LogData.PF.InitializeFlag = TRUE ;

    // 暫定: カレントディレクトリをログ出力先にする
    // TODO: SDL_GetPrefPath or XDG_DATA_HOME 等に切替
    LogData.PF.LogDataPath[ 0 ] = '.';
    LogData.PF.LogDataPath[ 1 ] = '\0';

    // エラーログファイルを再作成して BOM を書く
    char TempLogFilePath[ 1024 ] ;
    char LogFileNameUTF8[ 256 ] ;
    int  Length ;

    ConvString( ( char * )LogData.LogFileName, -1, WCHAR_T_CHARCODEFORMAT,
                LogFileNameUTF8, sizeof( LogFileNameUTF8 ),
                DX_CHARCODEFORMAT_UTF8 ) ;

    Length = CL_strlen( DX_CHARCODEFORMAT_UTF8, LogData.PF.LogDataPath ) ;
    if ( Length + CL_strlen( DX_CHARCODEFORMAT_UTF8, LogFileNameUTF8 ) + 1
         < (int)sizeof( TempLogFilePath ) - 16 )
    {
        FILE *fp ;
        CL_strcpy( DX_CHARCODEFORMAT_UTF8, TempLogFilePath, LogData.PF.LogDataPath ) ;
        if ( TempLogFilePath[ Length - 1 ] != '/' &&
             TempLogFilePath[ Length - 1 ] != '\\' )
        {
            TempLogFilePath[ Length ] = '/' ;
            TempLogFilePath[ Length + 1 ] = '\0' ;
        }
        CL_strcat( DX_CHARCODEFORMAT_UTF8, TempLogFilePath, LogFileNameUTF8 ) ;
        remove( TempLogFilePath ) ;
        fp = fopen( TempLogFilePath, "wb" ) ;
        if ( fp != NULL )
        {
            BYTE HEAD[ 3 ] = { 0xef, 0xbb, 0xbf } ;
            fwrite( &HEAD, 3, 1, fp ) ;
            fclose( fp ) ;
        }
    }

    return 0 ;
}

// ログファイルの後始末の環境依存部分
extern int LogFileTerminate_PF( void )
{
    return 0 ;
}

// ログファイルへ文字列を書き出す処理の環境依存部分
extern int LogFileAdd_WCHAR_T_PF( const wchar_t *LogFilePath, const wchar_t *ErrorStr )
{
    (void)LogFilePath;

    char  ErrorStrDefaultBuffer[ 1024 ] ;
    char *ErrorStrTempBuffer = NULL ;
    char *ErrorStrUseBuffer  = NULL ;
    int   ErrorStrUseBufferBytes ;
    int   Bytes ;
    int   StringBytes ;

    StringBytes = ( ( int )_WCSLEN( ErrorStr ) + 1 ) * (int)sizeof( wchar_t ) ;
    if ( StringBytes > (int)sizeof( ErrorStrDefaultBuffer ) )
    {
        ErrorStrTempBuffer = ( char * )DXALLOC( StringBytes ) ;
        if ( ErrorStrTempBuffer == NULL )
            return -1 ;
        ErrorStrUseBuffer      = ErrorStrTempBuffer ;
        ErrorStrUseBufferBytes = StringBytes ;
    }
    else
    {
        ErrorStrUseBuffer      = ErrorStrDefaultBuffer ;
        ErrorStrUseBufferBytes = sizeof( ErrorStrDefaultBuffer ) ;
    }

    Bytes = ConvString( ( char * )ErrorStr, -1, WCHAR_T_CHARCODEFORMAT,
                        ErrorStrUseBuffer, ErrorStrUseBufferBytes,
                        DX_CHARCODEFORMAT_UTF8 ) ;

    if ( Bytes > 1 && LogData.PF.LogDataPath[ 0 ] != '\0' )
    {
        char TempLogFilePath[ 1024 ] ;
        char LogFileNameUTF8[ 256 ] ;
        int  Length ;

        ConvString( ( char * )LogData.LogFileName, -1, WCHAR_T_CHARCODEFORMAT,
                    LogFileNameUTF8, sizeof( LogFileNameUTF8 ),
                    DX_CHARCODEFORMAT_UTF8 ) ;

        Length = CL_strlen( DX_CHARCODEFORMAT_UTF8, LogData.PF.LogDataPath ) ;
        if ( Length + CL_strlen( DX_CHARCODEFORMAT_UTF8, LogFileNameUTF8 ) + 1
             < (int)sizeof( TempLogFilePath ) - 16 )
        {
            FILE *fp ;
            CL_strcpy( DX_CHARCODEFORMAT_UTF8, TempLogFilePath, LogData.PF.LogDataPath ) ;
            if ( TempLogFilePath[ Length - 1 ] != '/' &&
                 TempLogFilePath[ Length - 1 ] != '\\' )
            {
                TempLogFilePath[ Length ] = '/' ;
                TempLogFilePath[ Length + 1 ] = '\0' ;
            }
            CL_strcat( DX_CHARCODEFORMAT_UTF8, TempLogFilePath, LogFileNameUTF8 ) ;
            fp = fopen( TempLogFilePath, "ab" ) ;
            if ( fp != NULL )
            {
                fwrite( ErrorStrUseBuffer, ( DWORD )( Bytes - 1 ), 1, fp ) ;
                fclose( fp ) ;
            }
        }
    }

    // iOS の NSLog 相当: stderr にも出力
    std::fprintf( stderr, "%s\n", ErrorStrUseBuffer ) ;

    if ( ErrorStrTempBuffer != NULL )
    {
        DXFREE( ErrorStrTempBuffer ) ;
        ErrorStrTempBuffer = NULL ;
    }

    return 0 ;
}

// ログ機能の初期化を行うかどうかを取得する
extern int IsInitializeLog( void )
{
    return TRUE ;
}

#ifndef DX_NON_NAMESPACE
}
#endif

#endif // DX_NON_LOG
