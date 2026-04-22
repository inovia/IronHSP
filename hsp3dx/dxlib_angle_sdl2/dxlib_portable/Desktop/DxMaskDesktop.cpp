//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2+GL) 用 マスク 実装 (最小版)
//
//      DxMask.cpp (3124 行) は CPU 側でマスクバッファを計算する作りなので、
//      そのまま DX_NON_MASK を外してビルドしても API は動く (ただし実際の
//      「マスクによるクリップ」効果は PF stub なので画面に出ない)。
//
//      本実装は 9 個の PF を no-op として提供し、SetUseMaskScreenFlag や
//      CreateMaskScreen が失敗せずに呼べる状態にする。視覚的マスク効果は
//      将来の GL texture + alpha 合成実装で対応予定。
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#ifdef _WIN32
#include <windows.h>
#endif

#include "../DxCompileConfig.h"

#ifndef DX_NON_MASK

#include "DxMaskDesktop.h"
#include "../DxMask.h"

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

extern int Mask_CreateScreenFunction_Timing0_PF ( void )                                { return 0 ; }
extern int Mask_CreateScreenFunction_Timing1_PF ( int Width, int Height )               { (void)Width; (void)Height; return 0 ; }
extern int Mask_CreateScreenFunction_Timing2_PF ( int OldW, int OldH )                  { (void)OldW; (void)OldH; return 0 ; }
extern int Mask_ReleaseSurface_PF               ( void )                                { return 0 ; }
extern int Mask_SetUseMaskScreenFlag_PF         ( void )                                { return 0 ; }
extern int Mask_DrawBeginFunction_PF            ( RECT *Rect )                          { (void)Rect; return 0 ; }
extern int Mask_DrawAfterFunction_PF            ( RECT *Rect )                          { (void)Rect; return 0 ; }
extern int Mask_FillMaskScreen_PF               ( int Flag )                            { (void)Flag; return 0 ; }
extern int Mask_UpdateMaskImageTexture_PF       ( RECT *Rect )                          { (void)Rect; return 0 ; }

#ifndef DX_NON_NAMESPACE
} // end namespace DxLib
#endif

#endif // DX_NON_MASK
