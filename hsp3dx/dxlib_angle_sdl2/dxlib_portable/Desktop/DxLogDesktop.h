// -------------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2/ANGLE) 用 ログ ヘッダ
//
//      DxLogiOS.h をベースに desktop 向けに複製したもの
//
// -------------------------------------------------------------------------------

#ifndef DX_LOGDESKTOP_H
#define DX_LOGDESKTOP_H

#include "../DxCompileConfig.h"

#ifndef DX_NON_LOG

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

// ログ処理用環境依存データ構造体 (iOS 版と同構造)
struct LOGDATA_PF
{
    int   InitializeFlag ;
    char  LogDataPath[ 2048 ] ;
    FILE *fp ;
} ;

#ifndef DX_NON_NAMESPACE
}
#endif

#endif // DX_NON_LOG

#endif // DX_LOGDESKTOP_H
