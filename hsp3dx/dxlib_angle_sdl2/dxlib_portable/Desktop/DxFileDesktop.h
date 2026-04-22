// -------------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2/ANGLE) 用 ファイル ヘッダ
//
//      まずは struct 宣言のみ。関数実装は Stage 4 以降。
//
// -------------------------------------------------------------------------------

#ifndef DX_FILEDESKTOP_H
#define DX_FILEDESKTOP_H

#include "../DxCompileConfig.h"
#include "../DxThread.h"
#include <stdio.h>

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

// ファイルアクセス処理用構造体 (iOS 版相当)
struct FILEACCESS_PF
{
    FILE *FilePointer ;
} ;

// ファイル検索処理用構造体
// iOS は DIR* (POSIX dirent) を持つが、desktop では後で OS 別に差し替えるため
// まずは void* + 検索名で持つ最小実装。
struct FINDINFO_PF
{
    void    *Dir ;                        // 実装側で OS 固有 handle を入れる (opendir / FindFirstFile)
    wchar_t  SearchFileName[ 1024 ] ;
} ;

// ファイルアクセス処理が使用するグローバルデータの環境依存データ構造体
struct FILEMANAGEDATA_PF
{
    int Dummy ;
} ;

#ifndef DX_NON_NAMESPACE
}
#endif

#endif // DX_FILEDESKTOP_H
