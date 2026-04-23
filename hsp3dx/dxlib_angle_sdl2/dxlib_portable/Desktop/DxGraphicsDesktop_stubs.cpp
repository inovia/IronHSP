//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop 用 Graphics platform-specific 関数 stub
//
//      Mac/Linux/Web で link を通すための実装。実描画 PF はすべて
//      DxGraphicsDesktop.cpp に移管済 (このファイルにあるのは合理的に
//      no-op で問題ない関数のみ)。
//
//      残った stub の分類:
//
//        [Shader 経路] DrawPrimitive*ToShader_PF / SetRenderTargetToShader_PF /
//          ShaderConstantBuffer_*_PF / Shader_GetConst*_PF / Shader_ModelCode_*_PF
//          → Desktop fork は基本 fixed-function 経路で描く (UseShader=TRUE
//          だが Light_PF 等が描画する)。Cubism などはここを通らず
//          DrawPrimitive*ToShader_UseVertexBuffer2_PF (DxGraphicsDesktop.cpp)
//          側で処理。よって here は no-op で OK。
//
//        [Init/Terminate hook] Graphics_Initialize_Timing0/1_PF /
//          Graphics_Terminate_PF / Graphics_SetupDisplayInfo_PF /
//          InitializeBaseImageManage_PF / TerminateBaseImageManage_PF /
//          RefreshSetting_PF / RestoreOrChangeSetupGraphSystem_PF
//          → DxLib_Init/End や fullscreen toggle 時の hook。Desktop では
//          state が即時反映なので no-op で OK。
//
//        [Device 仮想化] SetGraphicsDeviceLost/RestoreCallback_PF
//          → D3D9 のロスト/再生成イベント対応。emscripten/SDL2 では
//          context lost は別経路 (WebGL は context lost 通知が違う)。
//
//        [Misc] CopyGraphZBufferImage_PF / GetVideoMemorySizeEx_PF /
//          Paint_PF / SetBlendGraphParamBase_PF /
//          SetTextureAddressTransformMatrix_PF / MailApp_Send_WCHAR_T_PF /
//          CheckRequiredNormalImageConv_BaseImageFormat_PF
//          → 用途が specific すぎ、または OS/ブラウザ環境で意味なし。
//          基本的な HSP/DxLib アプリでは呼ばれないか呼ばれても問題なし。
//
//        [getters returning nullptr] GetDispColorData / ShaderConstantBuffer_GetBuffer
//          / Shader_GetConstDefaultParamF
//          → null 許容、または shader 非使用時に null を返して問題なし。
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#include "../DxCompileConfig.h"


// __cdecl は MSVC 固有の calling convention。GCC/Clang では空にする。
#if !defined(_MSC_VER)
  #ifndef __cdecl
  #define __cdecl
  #endif
#endif

#ifndef DX_NON_GRAPHICS

#include "DxGraphicsDesktop.h"
#include "../DxGraphics.h"
#include "../DxLib.h"

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

// === Shader 経路 (fixed-function 描画では通らない、Cubism 等は別経路) =====
extern int Graphics_Hardware_DrawPrimitive2DToShader_PF(struct tagVERTEX2DSHADER const *,int,int) { return 0; }
extern int Graphics_Hardware_DrawPrimitive3DToShader_PF(struct tagVERTEX3DSHADER const *,int,int) { return 0; }
extern int Graphics_Hardware_DrawPrimitive32bitIndexed2DToShader_PF(struct tagVERTEX2DSHADER const *,int,unsigned int const *,int,int) { return 0; }
extern int Graphics_Hardware_DrawPrimitive32bitIndexed3DToShader_PF(struct tagVERTEX3DSHADER const *,int,unsigned int const *,int,int) { return 0; }
extern int Graphics_Hardware_DrawPrimitiveIndexed2DToShader_PF(struct tagVERTEX2DSHADER const *,int,unsigned short const *,int,int) { return 0; }
extern int Graphics_Hardware_DrawPrimitiveIndexed3DToShader_PF(struct tagVERTEX3DSHADER const *,int,unsigned short const *,int,int) { return 0; }
extern int Graphics_Hardware_SetRenderTargetToShader_PF(int,int,int,int) { return 0; }

extern int Graphics_Hardware_ShaderConstantBuffer_Create_PF(int,int,int) { return 0; }
extern int Graphics_Hardware_ShaderConstantBuffer_Set_PF(struct SHADERCONSTANTBUFFERHANDLEDATA *,int,int) { return 0; }
extern int Graphics_Hardware_ShaderConstantBuffer_TerminateHandle_PF(struct SHADERCONSTANTBUFFERHANDLEDATA *) { return 0; }
extern int Graphics_Hardware_ShaderConstantBuffer_Update_PF(struct SHADERCONSTANTBUFFERHANDLEDATA *) { return 0; }
extern void * Graphics_Hardware_ShaderConstantBuffer_GetBuffer_PF(struct SHADERCONSTANTBUFFERHANDLEDATA *) { return nullptr; }
extern struct DxLib::tagFLOAT4 const * Graphics_Hardware_Shader_GetConstDefaultParamF_PF(wchar_t const *,struct SHADERHANDLEDATA *) { return nullptr; }

// Graphics_Hardware_Shader_*_PF: impl in DxShaderDesktop.cpp (GLSL source 経路)
extern "C" int Graphics_Hardware_Shader_Create_PF_Desktop(int,int,void *,int,int,int);
extern "C" int Graphics_Hardware_Shader_TerminateHandle_PF_Desktop(int);
extern "C" int Graphics_Hardware_Shader_SetConst_PF_Desktop(int,int,int,const void *,int,int);
extern "C" int Graphics_Hardware_Shader_ResetConst_PF_Desktop(int,int,int,int);

extern int Graphics_Hardware_Shader_Create_PF(int ShaderHandle, int ShaderType, void *Image, int ImageSize, int ImageAfterFree, int ASyncThread)
{
    return Graphics_Hardware_Shader_Create_PF_Desktop(ShaderHandle, ShaderType, Image, ImageSize, ImageAfterFree, ASyncThread);
}
extern int Graphics_Hardware_Shader_GetConstCount_PF(wchar_t const *,struct SHADERHANDLEDATA *) { return 0; }
extern int Graphics_Hardware_Shader_GetConstIndex_PF(wchar_t const *,struct SHADERHANDLEDATA *) { return -1; }
extern int Graphics_Hardware_Shader_GetValidShaderVersion_PF(void) { return 300; }
extern int Graphics_Hardware_Shader_ResetConst_PF(int TypeIndex, int SetIndex, int ConstantIndex, int ParamNum)
{
    return Graphics_Hardware_Shader_ResetConst_PF_Desktop(TypeIndex, SetIndex, ConstantIndex, ParamNum);
}
extern int Graphics_Hardware_Shader_SetConst_PF(int TypeIndex, int SetIndex, int ConstantIndex, void const *Param, int ParamNum, int UpdateUseArea)
{
    return Graphics_Hardware_Shader_SetConst_PF_Desktop(TypeIndex, SetIndex, ConstantIndex, Param, ParamNum, UpdateUseArea);
}
extern int Graphics_Hardware_Shader_TerminateHandle_PF(struct SHADERHANDLEDATA *Shader)
{
    if (!Shader) return 0;
    return Graphics_Hardware_Shader_TerminateHandle_PF_Desktop(Shader->HandleInfo.Handle);
}
extern int Graphics_Hardware_Shader_ModelCode_Init_PF(void) { return 0; }
extern int Graphics_Hardware_Shader_ModelCode_Terminate_PF(void) { return 0; }

// === Init/Terminate hook (DxLib_Init/End / fullscreen 等のフック、no-op) ===
extern int Graphics_Initialize_Timing0_PF(void) { return 0; }
extern int Graphics_Initialize_Timing1_PF(void) { return 0; }
extern int Graphics_Terminate_PF(void) { return 0; }
extern int Graphics_SetupDisplayInfo_PF(void) { return 0; }
extern int Graphics_RestoreOrChangeSetupGraphSystem_PF(int,int,int,int,int) { return 0; }
extern int InitializeBaseImageManage_PF(void) { return 0; }
extern int TerminateBaseImageManage_PF(void) { return 0; }
// Live2D Cubism4 が参照、Desktop では fixed-function state が常に即時反映なので no-op
extern int Graphics_Hardware_RefreshSetting_PF(void) { return 0; }

// === Device lost/restore コールバック (D3D9 用、SDL2/WebGL では別経路) ====
extern int Graphics_Hardware_SetGraphicsDeviceLostCallbackFunction_PF(void (__cdecl*)(void *),void *) { return 0; }
extern int Graphics_Hardware_SetGraphicsDeviceRestoreCallbackFunction_PF(void (__cdecl*)(void *),void *) { return 0; }

// === Misc no-op (HSP/DxLib 通常用途では無関係 or null OK) =================
extern int Graphics_CheckRequiredNormalImageConv_BaseImageFormat_PF(struct IMAGEDATA_ORIG *,int,int *,int,int *) { return 0; }
extern int Graphics_Hardware_CopyGraphZBufferImage_PF(struct IMAGEDATA *,struct IMAGEDATA *) { return 0; }
extern int Graphics_Hardware_GetVideoMemorySizeEx_PF(unsigned long long *,unsigned long long *) { return 0; }
extern int Graphics_Hardware_Paint_PF(int,int,unsigned int,unsigned long long) { return 0; }
extern int Graphics_Hardware_SetBlendGraphParamBase_PF(struct IMAGEDATA *,int,int *) { return 0; }
extern int Graphics_Hardware_SetTextureAddressTransformMatrix_PF(int,struct tagMATRIX *,int) { return 0; }
extern int MailApp_Send_WCHAR_T_PF(const wchar_t *,const wchar_t *,const wchar_t *,const wchar_t *,const wchar_t *) { return 0; }

extern struct DxLib::tagCOLORDATA const * Graphics_Hardware_GetDispColorData_PF(void) { return nullptr; }
extern void Graphics_Hardware_ShadowMap_RefreshPSParam_PF(void) { }
extern void Graphics_Hardware_ShadowMap_RefreshVSParam_PF(void) { }

#ifndef DX_NON_NAMESPACE
}
#endif

#endif // DX_NON_GRAPHICS
