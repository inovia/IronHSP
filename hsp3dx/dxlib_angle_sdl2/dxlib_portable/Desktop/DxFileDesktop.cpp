//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2/ANGLE) 用 ファイル 実装
//
//      DxFileiOS.cpp をベースに desktop 向けに移植したもの。
//      ディレクトリ列挙は std::filesystem (C++17) を使用。
//      相対パスは iOS のように Bundle 下ではなく、カレントディレクトリ基点。
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#include "DxFileDesktop.h"
#include "../DxFile.h"
#include "../DxLog.h"
#include "../DxChar.h"
#include "../DxBaseFunc.h"
#include "../DxMemory.h"

#include <cstdio>
#include <cstring>
#include <filesystem>
#include <string>

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

#define MAX_PATH_LENGTH		1024

// グローバルデータ (iOS 版と同じ名前/意味で一応置く)
int g_EnableRootDirName = 0 ;
int g_AddDriveNameNum    = 0 ;
const char * g_AddDriveName[ 16 ] = { NULL } ;

// 初期化・終了
extern int InitializeFile_PF( void ) { return 0 ; }
extern int TerminateFile_PF ( void ) { return 0 ; }

// wchar_t パス → UTF-8 パス (cwd 基点でフルパスに展開)
static int Desktop_wchar_t_to_utf8_Path( const wchar_t *Path, char *utf8_PathBuffer, size_t utf8_PathBufferBytes )
{
    wchar_t DirPath[ 512 ] = L"" ;
    wchar_t FullPath[ 512 ] ;
    wchar_t PathNoBS[ 512 ] ;

    // backslash を slash に置換 (Win-style パスを POSIX に正規化)
    {
        size_t i = 0 ;
        for ( ; i < ( sizeof( PathNoBS ) / sizeof( PathNoBS[ 0 ] ) ) - 1 && Path[ i ] ; ++i )
            PathNoBS[ i ] = ( Path[ i ] == L'\\' ) ? L'/' : Path[ i ] ;
        PathNoBS[ i ] = 0 ;
    }

    // ConvertFullPathW_ は POSIX 絶対パス (/foo/bar) を相対パス扱いして
    // CurrentDir を prepend してしまう (DxLib の Win 仕様)。
    // 既に絶対パスなら ConvertFullPathW_ をスキップして直接コピー。
#if !defined(_WIN32)
    if ( PathNoBS[ 0 ] == L'/' )
    {
        size_t i = 0 ;
        for ( ; i < ( sizeof( FullPath ) / sizeof( FullPath[ 0 ] ) ) - 1 && PathNoBS[ i ] ; ++i )
            FullPath[ i ] = PathNoBS[ i ] ;
        FullPath[ i ] = 0 ;
    }
    else
#endif
    {
        _WGETCWD( DirPath, sizeof( DirPath ) ) ;
        ConvertFullPathW_( PathNoBS, FullPath, sizeof( FullPath ), DirPath ) ;
        ChangeEnMarkToSlashW_( FullPath ) ;
    }

    // wchar_t → UTF-8
    ConvString( ( const char * )FullPath, -1, WCHAR_T_CHARCODEFORMAT,
                utf8_PathBuffer, utf8_PathBufferBytes, DX_CHARCODEFORMAT_UTF8 ) ;
    return 0 ;
}

// 読み込み専用 ----------------------------------------------------------------

extern int ReadOnlyFileAccessOpen_PF( FILEACCESS *FileAccess, const wchar_t *Path, int UseCacheFlag, int BlockReadFlag )
{
    (void)UseCacheFlag; (void)BlockReadFlag;

    char FullPathUTF8[ 1024 ] ;
    Desktop_wchar_t_to_utf8_Path( Path, FullPathUTF8, sizeof( FullPathUTF8 ) ) ;

    FileAccess->PF.FilePointer = fopen( FullPathUTF8, "rb" ) ;
    if ( FileAccess->PF.FilePointer == NULL )
        return -1 ;

    fseek( FileAccess->PF.FilePointer, 0, SEEK_END ) ;
    FileAccess->Size = ftell( FileAccess->PF.FilePointer ) ;
    fseek( FileAccess->PF.FilePointer, 0, SEEK_SET ) ;

    return 0 ;
}

extern int ReadOnlyFileAccessClose_PF( FILEACCESS *FileAccess )
{
    if ( FileAccess->PF.FilePointer != NULL )
    {
        fclose( FileAccess->PF.FilePointer ) ;
        FileAccess->PF.FilePointer = NULL ;
    }
    return 0 ;
}

extern int ReadOnlyFileAccessSeek_PF( FILEACCESS *FileAccess, LONGLONG SeekPoint )
{
    if ( FileAccess->PF.FilePointer != NULL )
        fseek( FileAccess->PF.FilePointer, ( long )SeekPoint, SEEK_SET ) ;
    return 0 ;
}

extern size_t ReadOnlyFileAccessRead_PF( void *Buffer, size_t BlockSize, size_t DataNum, FILEACCESS *FileAccess )
{
    if ( BlockSize == 0 || DataNum == 0 ) return 0 ;
    if ( FileAccess->PF.FilePointer == NULL ) return 0 ;
    return fread( Buffer, BlockSize, DataNum, FileAccess->PF.FilePointer ) * BlockSize ;
}

extern int ReadOnlyFileAccessIdleCheck_PF( FILEACCESS *FileAccess )
{
    (void)FileAccess;
    return TRUE ;
}

extern int ReadOnlyFileAccessChDir_PF( const wchar_t *Path )
{
    return _WCHDIR( Path ) ;
}

extern int ReadOnlyFileAccessGetDirS_PF( wchar_t *Buffer, size_t BufferBytes )
{
    _WGETCWD( Buffer, BufferBytes ) ;
    return 0 ;
}

// ディレクトリ検索 --------------------------------------------------------------
// std::filesystem::directory_iterator を使う。FINDINFO_PF::Dir に iterator の
// コピーを new で持たせ、FindClose で delete する。

struct DesktopFindIterator
{
    std::filesystem::directory_iterator it ;
    std::filesystem::directory_iterator end ;
} ;

extern int ReadOnlyFileAccessFindFirst_PF( FINDINFO *FindInfo, const wchar_t *FilePath, FILEINFOW *Buffer )
{
    wchar_t DirPath[ 1024 ] ;
    char    DirPathUTF8[ 1024 ] ;

    AnalysisFileNameAndDirPathW_( FilePath,
        FindInfo->PF.SearchFileName, sizeof( FindInfo->PF.SearchFileName ),
        DirPath, sizeof( DirPath ) ) ;

    Desktop_wchar_t_to_utf8_Path( DirPath, DirPathUTF8, sizeof( DirPathUTF8 ) ) ;

    FindInfo->PF.Dir = NULL ;

    try {
        auto *iter = new DesktopFindIterator() ;
        iter->it  = std::filesystem::directory_iterator( DirPathUTF8 ) ;
        iter->end = std::filesystem::directory_iterator() ;
        FindInfo->PF.Dir = iter ;
    } catch ( ... ) {
        return -1 ;
    }

    if ( ReadOnlyFileAccessFindNext_PF( FindInfo, Buffer ) < 0 )
    {
        if ( FindInfo->PF.Dir != NULL )
        {
            delete ( DesktopFindIterator * )FindInfo->PF.Dir ;
            FindInfo->PF.Dir = NULL ;
        }
        return -1 ;
    }
    return 0 ;
}

extern int ReadOnlyFileAccessFindNext_PF( FINDINFO *FindInfo, FILEINFOW *Buffer )
{
    if ( FindInfo->PF.Dir == NULL )
        return -1 ;

    auto *iter = ( DesktopFindIterator * )FindInfo->PF.Dir ;

    while ( iter->it != iter->end )
    {
        const auto &entry = *iter->it ;
        std::string FileNameUTF8 ;
        try {
            FileNameUTF8 = entry.path().filename().string() ;
        } catch ( ... ) {
            ++iter->it ;
            continue ;
        }

        wchar_t FileNameW[ 1024 ] ;
        ConvString( FileNameUTF8.c_str(), -1, DX_CHARCODEFORMAT_UTF8,
                    ( char * )FileNameW, sizeof( FileNameW ), WCHAR_T_CHARCODEFORMAT ) ;

        // 次の iterator に進める (今の entry は取り終わってる)
        bool match = ( Strcmp_Str2_WildcardW_( FileNameW, FindInfo->PF.SearchFileName ) == 0 ) ;
        bool is_dir = false ;
        try { is_dir = entry.is_directory() ; } catch ( ... ) { is_dir = false ; }
        ++iter->it ;

        if ( match )
        {
            if ( Buffer )
            {
                CL_strcpy( WCHAR_T_CHARCODEFORMAT, ( char * )Buffer->Name, ( char * )FileNameW ) ;
                Buffer->DirFlag = is_dir ? TRUE : FALSE ;
                Buffer->Size    = 0 ;
                _MEMSET( &Buffer->CreationTime,  0, sizeof( Buffer->CreationTime  ) ) ;
                _MEMSET( &Buffer->LastWriteTime, 0, sizeof( Buffer->LastWriteTime ) ) ;
            }
            return 0 ;
        }
    }
    return -1 ;
}

extern int ReadOnlyFileAccessFindClose_PF( FINDINFO *FindInfo )
{
    if ( FindInfo->PF.Dir != NULL )
    {
        delete ( DesktopFindIterator * )FindInfo->PF.Dir ;
        FindInfo->PF.Dir = NULL ;
    }
    return 0 ;
}

// 書き込み専用 ---------------------------------------------------------------

extern int WriteOnlyFileAccessDelete_PF( const wchar_t *Path )
{
    char FullPathUTF8[ 1024 ] ;
    Desktop_wchar_t_to_utf8_Path( Path, FullPathUTF8, sizeof( FullPathUTF8 ) ) ;
    remove( FullPathUTF8 ) ;
    return 0 ;
}

extern DWORD_PTR WriteOnlyFileAccessOpen_PF( const wchar_t *Path )
{
    char FullPathUTF8[ 1024 ] ;
    Desktop_wchar_t_to_utf8_Path( Path, FullPathUTF8, sizeof( FullPathUTF8 ) ) ;
    FILE *fp = fopen( FullPathUTF8, "wb" ) ;
    if ( fp == NULL ) return 0 ;
    return ( DWORD_PTR )fp ;
}

extern int WriteOnlyFileAccessClose_PF( DWORD_PTR Handle )
{
    fclose( ( FILE * )Handle ) ;
    return 0 ;
}

extern int WriteOnlyFileAccessSeek_PF( DWORD_PTR Handle, LONGLONG SeekPoint, int SeekType )
{
    fseek( ( FILE * )Handle, ( long )SeekPoint, SeekType ) ;
    return 0 ;
}

extern int WriteOnlyFileAccessWrite_PF( DWORD_PTR Handle, void *Buffer, size_t WriteSize, size_t *GetWriteSize )
{
    size_t n = fwrite( Buffer, 1, WriteSize, ( FILE * )Handle ) ;
    if ( GetWriteSize ) *GetWriteSize = n ;
    return 0 ;
}

#ifndef DX_NON_NAMESPACE
}
#endif
