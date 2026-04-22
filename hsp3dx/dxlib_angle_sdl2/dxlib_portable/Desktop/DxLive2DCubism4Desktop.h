//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2+GL) 用 Live2D Cubism4 ヘッダ
//
//      DxLive2DCubism4.h L296 の LIVE2DCUBISM4SYSTEMDATA_PF を satisfies。
//      Android/iOS と異なり、Desktop では GL shader 管理を
//      DxShaderDesktop.cpp 経由で行う想定 (L4 Phase 4 で実装)。
//      現状は shader handle の格納領域だけ用意する stub。
//
//-----------------------------------------------------------------------------

#ifndef DX_LIVE2DCUBISM4_DESKTOP_H
#define DX_LIVE2DCUBISM4_DESKTOP_H

#include "../DxCompileConfig.h"

#ifndef DX_NON_LIVE2D_CUBISM4

#include <stdint.h>

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

// Live2D Cubism4 が要求する shader 種別数 (D_ShaderNames 全列挙想定で広めに)
#define LIVE2D_SHADER_NUM_MAX   32

struct LIVE2DCUBISM4SYSTEMDATA_PF
{
    uint32_t    VertexShader  [ LIVE2D_SHADER_NUM_MAX ] ;
    uint32_t    FragmentShader[ LIVE2D_SHADER_NUM_MAX ] ;
    uint32_t    Program       [ LIVE2D_SHADER_NUM_MAX ] ;
} ;

#ifndef DX_NON_NAMESPACE
}
#endif

#endif // DX_NON_LIVE2D_CUBISM4

#endif // DX_LIVE2DCUBISM4_DESKTOP_H
