//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop 用 Live2D Cubism4 PF 実装 (stub 版)
//
//      DxLive2DCubism4.cpp / DxUseCLibLive2DCubism4.cpp から呼ばれる
//      Live2DCubism4_*_PF 5 関数を提供する。
//      現状は no-op stub (return 0) で、API コール層は動作するが実際の
//      Cubism shader 生成・描画は Desktop では未対応。完全描画には
//      CubismFramework の Rendering/OpenGL と DxLib 本家の shader 連携機構を
//      橋渡しする実装が要るので、L4 Phase 4 以降で対応予定。
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#ifdef _WIN32
#include <windows.h>
#endif

#include "../DxCompileConfig.h"

#ifndef DX_NON_LIVE2D_CUBISM4

// DxLib.h を先に include しておくと末尾で `using namespace DxLib ;` が走り、
// DxLib 名前空間の型が global に見えるようになる (DxLive2DCubism4.h は
// global scope で DxLib の型を直接参照しているため必須)。
#include "../DxLib.h"
#include "../DxUseCLibLive2DCubism4.h"
#include "../DxLive2DCubism4.h"

extern int Live2DCubism4_Initialize_PF      ( void )                                               { return 0 ; }
extern int Live2DCubism4_Terminate_PF       ( void )                                               { return 0 ; }
extern int Live2DCubism4_GenerateShaders_PF ( void )                                               { return 0 ; }
extern int Live2DCubism4_SetupShader_PF     ( int                                 /*ConstantBufferHandle*/,
                                              D_CubismConstantBufferDxLib        * /*ConstantBuffer*/,
                                              D_ShaderNames                       /*VertexShader*/,
                                              D_ShaderNames                       /*PixelShader*/  ) { return 0 ; }
extern int Live2DCubism4_DrawAfter_PF       ( void )                                               { return 0 ; }

#endif // DX_NON_LIVE2D_CUBISM4
