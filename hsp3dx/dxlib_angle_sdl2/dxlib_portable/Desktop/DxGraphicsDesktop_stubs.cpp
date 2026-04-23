//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop 用 Graphics platform-specific 関数 stub
//
//      Stage 5 link を通すための空実装。実 GL 描画は後段 Stage で埋める。
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

// --- stubs (auto-generated from build log) -------------------------------
extern int Graphics_CheckRequiredNormalImageConv_BaseImageFormat_PF(struct IMAGEDATA_ORIG *,int,int *,int,int *) { return 0; }
// Graphics_GetRefreshRate_PF: impl in DxGraphicsDesktop.cpp (SDL_GetCurrentDisplayMode)
// Graphics_Hardware_ApplyLigFogToHardware_PF: impl in DxGraphicsDesktop.cpp (Tier 4a)
// moved to DxGraphicsDesktop.cpp (Stage 17)
// Graphics_Hardware_CheckValid_PF: impl in DxGraphicsDesktop.cpp (GL context 判定)
// Graphics_Hardware_ClearDrawScreenZBuffer_PF: impl in DxGraphicsDesktop.cpp (Tier 3)
// Graphics_Hardware_ClearDrawScreen_PF: impl in DxGraphicsDesktop.cpp (Stage 6)
extern int Graphics_Hardware_CopyGraphZBufferImage_PF(struct IMAGEDATA *,struct IMAGEDATA *) { return 0; }
// moved to DxGraphicsDesktop.cpp (Stage 17)
extern int Graphics_Hardware_DeviceDirect_SetViewMatrix_PF(struct tagMATRIX const *) { return 0; }
extern int Graphics_Hardware_DeviceDirect_SetWorldMatrix_PF(struct tagMATRIX const *) { return 0; }
// Graphics_Hardware_Draw32bitIndexedPrimitive2DUser_PF: impl in DxGraphicsDesktop.cpp
// Graphics_Hardware_Draw32bitIndexedPrimitiveLight_PF: impl in DxGraphicsDesktop.cpp
// Graphics_Hardware_Draw32bitIndexedPrimitive_PF: impl in DxGraphicsDesktop.cpp
// Graphics_Hardware_DrawBillboard3D_PF: impl in DxGraphicsDesktop.cpp (Tier 3)
// Graphics_Hardware_DrawBoxSet_PF: impl in DxGraphicsDesktop.cpp (Stage 9)
// Graphics_Hardware_DrawCircle_PF: impl in DxGraphicsDesktop.cpp (Stage 8)
// Graphics_Hardware_DrawCircle_Thickness_PF: impl in DxGraphicsDesktop.cpp (Stage 9)
// moved to DxGraphicsDesktop.cpp (Stage 18)
// Graphics_Hardware_DrawFillBox_PF: impl in DxGraphicsDesktop.cpp (Stage 7)
// moved to DxGraphicsDesktop.cpp (Stage 17)
// Graphics_Hardware_DrawIndexedPrimitive2DUser_PF: impl in DxGraphicsDesktop.cpp
// Graphics_Hardware_DrawIndexedPrimitiveLight_PF: impl in DxGraphicsDesktop.cpp (3D primitive Tier 4)
// Graphics_Hardware_DrawIndexedPrimitiveLight_UseVertexBuffer_PF: impl in DxGraphicsDesktop.cpp
// Graphics_Hardware_DrawIndexedPrimitive_PF: impl in DxGraphicsDesktop.cpp
// Graphics_Hardware_DrawLine3D_PF: impl in DxGraphicsDesktop.cpp (Tier 3)
// Graphics_Hardware_DrawLineBox_PF: impl in DxGraphicsDesktop.cpp (Stage 8)
// Graphics_Hardware_DrawLineSet_PF: impl in DxGraphicsDesktop.cpp (Stage 9)
// Graphics_Hardware_DrawLine_PF: impl in DxGraphicsDesktop.cpp (Stage 7)
// Graphics_Hardware_DrawModiBillboard3D_PF: impl in DxGraphicsDesktop.cpp
// Graphics_Hardware_DrawModiGraph_PF / DrawModiGraphF_PF: impl in DxGraphicsDesktop.cpp (Tier 1)
// Graphics_Hardware_DrawOval_PF: impl in DxGraphicsDesktop.cpp (Stage 8)
// Graphics_Hardware_DrawOval_Thickness_PF: impl in DxGraphicsDesktop.cpp (Stage 9)
// Graphics_Hardware_DrawPixel3D_PF: impl in DxGraphicsDesktop.cpp (Tier 3)
// Graphics_Hardware_DrawPixelSet_PF: impl in DxGraphicsDesktop.cpp (Stage 9)
// Graphics_Hardware_DrawPixel_PF: impl in DxGraphicsDesktop.cpp (Stage 7)
extern int Graphics_Hardware_DrawPrimitive2DToShader_PF(struct tagVERTEX2DSHADER const *,int,int) { return 0; }
// Graphics_Hardware_DrawPrimitive2DUser_PF: impl in DxGraphicsDesktop.cpp
// moved to DxGraphicsDesktop.cpp (Stage 19)
extern int Graphics_Hardware_DrawPrimitive32bitIndexed2DToShader_PF(struct tagVERTEX2DSHADER const *,int,unsigned int const *,int,int) { return 0; }
extern int Graphics_Hardware_DrawPrimitive32bitIndexed3DToShader_PF(struct tagVERTEX3DSHADER const *,int,unsigned int const *,int,int) { return 0; }
extern int Graphics_Hardware_DrawPrimitive3DToShader_PF(struct tagVERTEX3DSHADER const *,int,int) { return 0; }
// Graphics_Hardware_DrawPrimitive3DToShader_UseVertexBuffer2_PF: impl in DxGraphicsDesktop.cpp (Cubism 経路)
extern int Graphics_Hardware_DrawPrimitiveIndexed2DToShader_PF(struct tagVERTEX2DSHADER const *,int,unsigned short const *,int,int) { return 0; }
extern int Graphics_Hardware_DrawPrimitiveIndexed3DToShader_PF(struct tagVERTEX3DSHADER const *,int,unsigned short const *,int,int) { return 0; }
// Graphics_Hardware_DrawPrimitiveIndexed3DToShader_UseVertexBuffer2_PF: impl in DxGraphicsDesktop.cpp (Cubism 経路)
// Graphics_Hardware_DrawPrimitiveLight_PF: impl in DxGraphicsDesktop.cpp (Tier 3)
// Graphics_Hardware_DrawPrimitiveLight_UseVertexBuffer_PF: impl in DxGraphicsDesktop.cpp
// Graphics_Hardware_DrawPrimitive_PF: impl in DxGraphicsDesktop.cpp (Tier 3)
// Graphics_Hardware_DrawQuadrangleF_PF: impl in DxGraphicsDesktop.cpp (Stage 10)
// Graphics_Hardware_DrawQuadrangle_PF: impl in DxGraphicsDesktop.cpp (Stage 8)
// moved to DxGraphicsDesktop.cpp (Stage 18)
// moved to DxGraphicsDesktop.cpp (Stage 18)
// Graphics_Hardware_DrawSimpleQuadrangleGraphF_PF: impl in DxGraphicsDesktop.cpp
// Graphics_Hardware_DrawSimpleTriangleGraphF_PF: impl in DxGraphicsDesktop.cpp
// Graphics_Hardware_DrawTriangle3D_PF: impl in DxGraphicsDesktop.cpp (Tier 3)
// Graphics_Hardware_DrawTriangle_PF: impl in DxGraphicsDesktop.cpp (Stage 8)
// Graphics_Hardware_FillGraph_PF: impl in DxGraphicsDesktop.cpp (Tier 1)
// Graphics_Hardware_GetDrawScreenGraphBase_PF: impl in DxGraphicsDesktop.cpp (Category C)
// Graphics_Hardware_GetMultiSampleQuality_PF: impl in DxGraphicsDesktop.cpp
extern int Graphics_Hardware_GetVideoMemorySizeEx_PF(unsigned long long *,unsigned long long *) { return 0; }
// Graphics_Hardware_GraphLock_PF / GraphUnlock_PF: impl in DxGraphicsDesktop.cpp (Tier 1)
// Graphics_Hardware_IndexBuffer_*_PF: impl in DxGraphicsDesktop.cpp (no-op but present)
// Graphics_Hardware_InitGraph_PF: impl in DxGraphicsDesktop.cpp
// Graphics_Hardware_Initialize_PF: impl in DxGraphicsDesktop.cpp (Stage 6)
// Graphics_Hardware_Light_*_PF: impl in DxGraphicsDesktop.cpp (Tier 4a)
extern int Graphics_Hardware_LockDrawScreenBuffer_PF(struct tagRECT *,struct tagBASEIMAGE *,int,struct IMAGEDATA *,int,int,int,int) { return 0; }
extern int Graphics_Hardware_Paint_PF(int,int,unsigned int,unsigned long long) { return 0; }
// Graphics_Hardware_RefreshAlphaChDrawMode_PF: impl in DxGraphicsDesktop.cpp (Stage 10)
// moved to DxGraphicsDesktop.cpp (Stage 17)
// Graphics_Hardware_ScreenCopy_PF: impl in DxGraphicsDesktop.cpp
// Graphics_Hardware_SetBackgroundColor_PF: impl in DxGraphicsDesktop.cpp (glClearColor 予約)
extern int Graphics_Hardware_SetBlendGraphParamBase_PF(struct IMAGEDATA *,int,int *) { return 0; }
// Graphics_Hardware_SetDrawAddColor_PF: impl in DxGraphicsDesktop.cpp (placeholder)
// Graphics_Hardware_SetDrawAlphaTest_PF: impl in DxGraphicsDesktop.cpp (GL_ALPHA_TEST + glAlphaFunc)
// Graphics_Hardware_SetDrawArea_PF: impl in DxGraphicsDesktop.cpp (Tier 1)
// Graphics_Hardware_SetDrawBlendMode_PF: impl in DxGraphicsDesktop.cpp (Stage 10)
// Graphics_Hardware_SetDrawBrightToOneParam_PF: impl in DxGraphicsDesktop.cpp (Stage 10)
// Graphics_Hardware_SetDrawBright_PF: impl in DxGraphicsDesktop.cpp (Stage 10)
// Graphics_Hardware_SetDrawCustomBlendMode_PF: impl in DxGraphicsDesktop.cpp (glBlendFuncSeparate)
// Graphics_Hardware_SetDrawMode_PF: impl in DxGraphicsDesktop.cpp
// Graphics_Hardware_SetMaxAnisotropy_PF / SetTextureAddressMode* / SetDrawAlphaTest:
//   impl in DxGraphicsDesktop.cpp
// Graphics_Hardware_SetDrawScreen_PF / _Post_PF: impl in DxGraphicsDesktop.cpp (Tier 1)
// Graphics_Hardware_SetDrawZBuffer_PF: impl in DxGraphicsDesktop.cpp (Tier 3)
// Graphics_Hardware_SetFog*_PF: impl in DxGraphicsDesktop.cpp (Tier 4a)
extern int Graphics_Hardware_SetGraphicsDeviceLostCallbackFunction_PF(void (__cdecl*)(void *),void *) { return 0; }
extern int Graphics_Hardware_SetGraphicsDeviceRestoreCallbackFunction_PF(void (__cdecl*)(void *),void *) { return 0; }
// Graphics_Hardware_SetMaxAnisotropy_PF: impl in DxGraphicsDesktop.cpp
extern int Graphics_Hardware_SetRenderTargetToShader_PF(int,int,int,int) { return 0; }
// Graphics_Hardware_SetTextureAddressMode{,UV}_PF: impl in DxGraphicsDesktop.cpp
extern int Graphics_Hardware_SetTextureAddressTransformMatrix_PF(int,struct tagMATRIX *,int) { return 0; }
// Graphics_Hardware_SetTransformTo*_PF: impl in DxGraphicsDesktop.cpp (Tier 3)
// Graphics_Hardware_SetUseHardwareVertexProcessing_PF / SetUseNormalDrawShader_PF /
// SetUseOldDrawModiGraphCodeFlag_PF / SetUsePlatformTextureFormat_PF:
//   impl in DxGraphicsDesktop.cpp
// Graphics_Hardware_SetUsePixelLighting_PF / SetVerticalFog* / SetZBufferMode_PF /
// SetupUseZBuffer_PF: impl in DxGraphicsDesktop.cpp
// SetUsePlatformTextureFormat_PF: impl in DxGraphicsDesktop.cpp
extern int Graphics_Hardware_ShaderConstantBuffer_Create_PF(int,int,int) { return 0; }
extern int Graphics_Hardware_ShaderConstantBuffer_Set_PF(struct SHADERCONSTANTBUFFERHANDLEDATA *,int,int) { return 0; }
extern int Graphics_Hardware_ShaderConstantBuffer_TerminateHandle_PF(struct SHADERCONSTANTBUFFERHANDLEDATA *) { return 0; }
extern int Graphics_Hardware_ShaderConstantBuffer_Update_PF(struct SHADERCONSTANTBUFFERHANDLEDATA *) { return 0; }
// Graphics_Hardware_Shader_*_PF: impl in DxShaderDesktop.cpp (GLSL source 経路)
// — DxLib 本家 API (LoadVertexShader/LoadPixelShader 等) を GLSL source 経由で動かす
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
// Graphics_Hardware_ShadowMap_*_PF: impl in DxGraphicsDesktop.cpp (M2)
// Live2D Cubism4 が参照する Graphics_Hardware_RefreshSetting_PF (描画 state を
// 全再送する) は、Desktop では fixed-function の state が常に即時反映される
// ため no-op で OK。
extern int Graphics_Hardware_RefreshSetting_PF(void) { return 0; }
extern int Graphics_Hardware_UnlockDrawScreenBuffer_PF(void) { return 0; }
// Graphics_Hardware_VertexBuffer_*_PF / WaitVSync_PF: impl in DxGraphicsDesktop.cpp
extern int Graphics_Initialize_Timing0_PF(void) { return 0; }
extern int Graphics_Initialize_Timing1_PF(void) { return 0; }
extern int Graphics_RestoreOrChangeSetupGraphSystem_PF(int,int,int,int,int) { return 0; }
// Graphics_ScreenFlipBase_PF: impl in DxGraphicsDesktop.cpp (Stage 6)
// Graphics_SetWaitVSyncFlag_PF: impl in DxGraphicsDesktop.cpp (SDL_GL_SetSwapInterval)
extern int Graphics_SetupDisplayInfo_PF(void) { return 0; }
extern int Graphics_Terminate_PF(void) { return 0; }
extern int InitializeBaseImageManage_PF(void) { return 0; }
extern int TerminateBaseImageManage_PF(void) { return 0; }
extern struct DxLib::tagCOLORDATA const * Graphics_Hardware_GetDispColorData_PF(void) { return nullptr; }
// Graphics_Hardware_GetPixelF_PF: impl in DxGraphicsDesktop.cpp (glReadPixels 1x1)
extern struct DxLib::tagFLOAT4 const * Graphics_Hardware_Shader_GetConstDefaultParamF_PF(wchar_t const *,struct SHADERHANDLEDATA *) { return nullptr; }
// Graphics_Hardware_GetPixel_PF: impl in DxGraphicsDesktop.cpp
extern void * Graphics_Hardware_ShaderConstantBuffer_GetBuffer_PF(struct SHADERCONSTANTBUFFERHANDLEDATA *) { return nullptr; }
extern void Graphics_Hardware_ShadowMap_RefreshPSParam_PF(void) { }
extern void Graphics_Hardware_ShadowMap_RefreshVSParam_PF(void) { }

extern int MailApp_Send_WCHAR_T_PF(const wchar_t *,const wchar_t *,const wchar_t *,const wchar_t *,const wchar_t *) { return 0; }

// --- end of stubs --------------------------------------------------------

#ifndef DX_NON_NAMESPACE
}
#endif

#endif // DX_NON_GRAPHICS
