// -------------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2) 用 入力
//
// -------------------------------------------------------------------------------

#ifndef DX_INPUTDESKTOP_H
#define DX_INPUTDESKTOP_H

#include "../DxCompileConfig.h"

#ifndef DX_NON_INPUT

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

// 振動情報 (SDL2 haptic は cpp 側で管理。ここは dummy)
struct INPUTVIBRATIONDATA_PF
{
    int Dummy ;
} ;

// ゲームパッド情報 (cpp 側で SDL_GameController* にキャスト)
struct INPUTPADDATA_PF
{
    int   ControllerId ;
    void *Controller ;
} ;

struct INPUTSYSTEMDATA_PF
{
    int Dummy ;
} ;

#ifndef DX_NON_NAMESPACE
}
#endif

#endif // DX_NON_INPUT

#endif // DX_INPUTDESKTOP_H
