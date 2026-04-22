// -------------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2/ANGLE) 用 システム ヘッダ
//
// -------------------------------------------------------------------------------

#ifndef DX_SYSTEMDESKTOP_H
#define DX_SYSTEMDESKTOP_H

#include "../DxCompileConfig.h"

// iOS DxSystemiOS.h の CheckActiveState() マクロ相当。
// Desktop ではバックグラウンド抑止しない (常に実行) ので no-op にする。
#ifndef CheckActiveState
#define CheckActiveState()
#endif

// Desktop 側 Graphics 実装で提供される window/GL の初期化関数。
// DxLib namespace の外 (global) に置く。
#ifdef __cplusplus
extern "C" {
#endif

int DxDesktop_MakeWinAndGL( int w, int h, const char *title ) ;
int DxDesktop_KillWinAndGL( void ) ;

#ifdef __cplusplus
}
#endif

#endif // DX_SYSTEMDESKTOP_H
