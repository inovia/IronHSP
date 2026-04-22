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
extern int Graphics_GetRefreshRate_PF(void) { return 0; }
// Graphics_Hardware_ApplyLigFogToHardware_PF: impl in DxGraphicsDesktop.cpp (Tier 4a)
// moved to DxGraphicsDesktop.cpp (Stage 17)
extern int Graphics_Hardware_CheckValid_PF(void) { return 0; }
// Graphics_Hardware_ClearDrawScreenZBuffer_PF: impl in DxGraphicsDesktop.cpp (Tier 3)
// Graphics_Hardware_ClearDrawScreen_PF: impl in DxGraphicsDesktop.cpp (Stage 6)
extern int Graphics_Hardware_CopyGraphZBufferImage_PF(struct IMAGEDATA *,struct IMAGEDATA *) { return 0; }
// moved to DxGraphicsDesktop.cpp (Stage 17)
extern int Graphics_Hardware_DeviceDirect_SetViewMatrix_PF(struct tagMATRIX const *) { return 0; }
extern int Graphics_Hardware_DeviceDirect_SetWorldMatrix_PF(struct tagMATRIX const *) { return 0; }
extern int Graphics_Hardware_Draw32bitIndexedPrimitive2DUser_PF(struct tagVERTEX2D const *,int,DWORD const *,int,int,struct IMAGEDATA *,int) { return 0; }
extern int Graphics_Hardware_Draw32bitIndexedPrimitiveLight_PF(struct tagVERTEX3D const *,int,DWORD const *,int,int,struct IMAGEDATA *,int) { return 0; }
extern int Graphics_Hardware_Draw32bitIndexedPrimitive_PF(struct tagVERTEX_3D const *,int,DWORD const *,int,int,struct IMAGEDATA *,int) { return 0; }
// Graphics_Hardware_DrawBillboard3D_PF: impl in DxGraphicsDesktop.cpp (Tier 3)
// Graphics_Hardware_DrawBoxSet_PF: impl in DxGraphicsDesktop.cpp (Stage 9)
// Graphics_Hardware_DrawCircle_PF: impl in DxGraphicsDesktop.cpp (Stage 8)
// Graphics_Hardware_DrawCircle_Thickness_PF: impl in DxGraphicsDesktop.cpp (Stage 9)
// moved to DxGraphicsDesktop.cpp (Stage 18)
// Graphics_Hardware_DrawFillBox_PF: impl in DxGraphicsDesktop.cpp (Stage 7)
// moved to DxGraphicsDesktop.cpp (Stage 17)
extern int Graphics_Hardware_DrawIndexedPrimitive2DUser_PF(struct tagVERTEX2D const *,int,unsigned short const *,int,int,struct IMAGEDATA *,int) { return 0; }
extern int Graphics_Hardware_DrawIndexedPrimitiveLight_PF(struct tagVERTEX3D const *,int,unsigned short const *,int,int,struct IMAGEDATA *,int) { return 0; }
extern int Graphics_Hardware_DrawIndexedPrimitiveLight_UseVertexBuffer_PF(struct VERTEXBUFFERHANDLEDATA *,struct INDEXBUFFERHANDLEDATA *,int,int,int,int,int,int,struct IMAGEDATA *,int) { return 0; }
extern int Graphics_Hardware_DrawIndexedPrimitive_PF(struct tagVERTEX_3D const *,int,unsigned short const *,int,int,struct IMAGEDATA *,int) { return 0; }
// Graphics_Hardware_DrawLine3D_PF: impl in DxGraphicsDesktop.cpp (Tier 3)
// Graphics_Hardware_DrawLineBox_PF: impl in DxGraphicsDesktop.cpp (Stage 8)
// Graphics_Hardware_DrawLineSet_PF: impl in DxGraphicsDesktop.cpp (Stage 9)
// Graphics_Hardware_DrawLine_PF: impl in DxGraphicsDesktop.cpp (Stage 7)
extern int Graphics_Hardware_DrawModiBillboard3D_PF(struct tagVECTOR,float,float,float,float,float,float,float,float,struct IMAGEDATA *,struct IMAGEDATA *,int,int,struct tagRECT *) { return 0; }
// Graphics_Hardware_DrawModiGraph_PF / DrawModiGraphF_PF: impl in DxGraphicsDesktop.cpp (Tier 1)
// Graphics_Hardware_DrawOval_PF: impl in DxGraphicsDesktop.cpp (Stage 8)
// Graphics_Hardware_DrawOval_Thickness_PF: impl in DxGraphicsDesktop.cpp (Stage 9)
// Graphics_Hardware_DrawPixel3D_PF: impl in DxGraphicsDesktop.cpp (Tier 3)
// Graphics_Hardware_DrawPixelSet_PF: impl in DxGraphicsDesktop.cpp (Stage 9)
// Graphics_Hardware_DrawPixel_PF: impl in DxGraphicsDesktop.cpp (Stage 7)
extern int Graphics_Hardware_DrawPrimitive2DToShader_PF(struct tagVERTEX2DSHADER const *,int,int) { return 0; }
extern int Graphics_Hardware_DrawPrimitive2DUser_PF(struct tagVERTEX2D const *,int,int,struct IMAGEDATA *,int,int,int,int,int) { return 0; }
// moved to DxGraphicsDesktop.cpp (Stage 19)
extern int Graphics_Hardware_DrawPrimitive32bitIndexed2DToShader_PF(struct tagVERTEX2DSHADER const *,int,unsigned int const *,int,int) { return 0; }
extern int Graphics_Hardware_DrawPrimitive32bitIndexed3DToShader_PF(struct tagVERTEX3DSHADER const *,int,unsigned int const *,int,int) { return 0; }
extern int Graphics_Hardware_DrawPrimitive3DToShader_PF(struct tagVERTEX3DSHADER const *,int,int) { return 0; }
extern int Graphics_Hardware_DrawPrimitive3DToShader_UseVertexBuffer2_PF(int,int,int,int) { return 0; }
extern int Graphics_Hardware_DrawPrimitiveIndexed2DToShader_PF(struct tagVERTEX2DSHADER const *,int,unsigned short const *,int,int) { return 0; }
extern int Graphics_Hardware_DrawPrimitiveIndexed3DToShader_PF(struct tagVERTEX3DSHADER const *,int,unsigned short const *,int,int) { return 0; }
extern int Graphics_Hardware_DrawPrimitiveIndexed3DToShader_UseVertexBuffer2_PF(int,int,int,int,int,int,int,int) { return 0; }
// Graphics_Hardware_DrawPrimitiveLight_PF: impl in DxGraphicsDesktop.cpp (Tier 3)
extern int Graphics_Hardware_DrawPrimitiveLight_UseVertexBuffer_PF(struct VERTEXBUFFERHANDLEDATA *,int,int,int,struct IMAGEDATA *,int) { return 0; }
// Graphics_Hardware_DrawPrimitive_PF: impl in DxGraphicsDesktop.cpp (Tier 3)
// Graphics_Hardware_DrawQuadrangleF_PF: impl in DxGraphicsDesktop.cpp (Stage 10)
// Graphics_Hardware_DrawQuadrangle_PF: impl in DxGraphicsDesktop.cpp (Stage 8)
// moved to DxGraphicsDesktop.cpp (Stage 18)
// moved to DxGraphicsDesktop.cpp (Stage 18)
extern int Graphics_Hardware_DrawSimpleQuadrangleGraphF_PF(struct tagGRAPHICS_DRAW_DRAWSIMPLEQUADRANGLEGRAPHF_PARAM const *,struct IMAGEDATA *,struct IMAGEDATA *) { return 0; }
extern int Graphics_Hardware_DrawSimpleTriangleGraphF_PF(struct tagGRAPHICS_DRAW_DRAWSIMPLETRIANGLEGRAPHF_PARAM const *,struct IMAGEDATA *,struct IMAGEDATA *) { return 0; }
// Graphics_Hardware_DrawTriangle3D_PF: impl in DxGraphicsDesktop.cpp (Tier 3)
// Graphics_Hardware_DrawTriangle_PF: impl in DxGraphicsDesktop.cpp (Stage 8)
// Graphics_Hardware_FillGraph_PF: impl in DxGraphicsDesktop.cpp (Tier 1)
// Graphics_Hardware_GetDrawScreenGraphBase_PF: impl in DxGraphicsDesktop.cpp (Category C)
extern int Graphics_Hardware_GetMultiSampleQuality_PF(int) { return 0; }
extern int Graphics_Hardware_GetVideoMemorySizeEx_PF(unsigned long long *,unsigned long long *) { return 0; }
// Graphics_Hardware_GraphLock_PF / GraphUnlock_PF: impl in DxGraphicsDesktop.cpp (Tier 1)
extern int Graphics_Hardware_IndexBuffer_Create_PF(struct INDEXBUFFERHANDLEDATA *) { return 0; }
extern int Graphics_Hardware_IndexBuffer_SetData_PF(struct INDEXBUFFERHANDLEDATA *,int,void const *,int) { return 0; }
extern int Graphics_Hardware_IndexBuffer_Terminate_PF(struct INDEXBUFFERHANDLEDATA *) { return 0; }
extern int Graphics_Hardware_InitGraph_PF(void) { return 0; }
// Graphics_Hardware_Initialize_PF: impl in DxGraphicsDesktop.cpp (Stage 6)
// Graphics_Hardware_Light_*_PF: impl in DxGraphicsDesktop.cpp (Tier 4a)
extern int Graphics_Hardware_LockDrawScreenBuffer_PF(struct tagRECT *,struct tagBASEIMAGE *,int,struct IMAGEDATA *,int,int,int,int) { return 0; }
extern int Graphics_Hardware_Paint_PF(int,int,unsigned int,unsigned long long) { return 0; }
// Graphics_Hardware_RefreshAlphaChDrawMode_PF: impl in DxGraphicsDesktop.cpp (Stage 10)
// moved to DxGraphicsDesktop.cpp (Stage 17)
extern int Graphics_Hardware_ScreenCopy_PF(int) { return 0; }
extern int Graphics_Hardware_SetBackgroundColor_PF(int,int,int,int) { return 0; }
extern int Graphics_Hardware_SetBlendGraphParamBase_PF(struct IMAGEDATA *,int,int *) { return 0; }
extern int Graphics_Hardware_SetDrawAddColor_PF(int,int,int) { return 0; }
extern int Graphics_Hardware_SetDrawAlphaTest_PF(int,int) { return 0; }
// Graphics_Hardware_SetDrawArea_PF: impl in DxGraphicsDesktop.cpp (Tier 1)
// Graphics_Hardware_SetDrawBlendMode_PF: impl in DxGraphicsDesktop.cpp (Stage 10)
// Graphics_Hardware_SetDrawBrightToOneParam_PF: impl in DxGraphicsDesktop.cpp (Stage 10)
// Graphics_Hardware_SetDrawBright_PF: impl in DxGraphicsDesktop.cpp (Stage 10)
extern int Graphics_Hardware_SetDrawCustomBlendMode_PF(int,int,int,int,int,int,int,int) { return 0; }
extern int Graphics_Hardware_SetDrawMode_PF(int) { return 0; }
// Graphics_Hardware_SetDrawScreen_PF / _Post_PF: impl in DxGraphicsDesktop.cpp (Tier 1)
// Graphics_Hardware_SetDrawZBuffer_PF: impl in DxGraphicsDesktop.cpp (Tier 3)
// Graphics_Hardware_SetFog*_PF: impl in DxGraphicsDesktop.cpp (Tier 4a)
extern int Graphics_Hardware_SetGraphicsDeviceLostCallbackFunction_PF(void (__cdecl*)(void *),void *) { return 0; }
extern int Graphics_Hardware_SetGraphicsDeviceRestoreCallbackFunction_PF(void (__cdecl*)(void *),void *) { return 0; }
extern int Graphics_Hardware_SetMaxAnisotropy_PF(int) { return 0; }
extern int Graphics_Hardware_SetRenderTargetToShader_PF(int,int,int,int) { return 0; }
extern int Graphics_Hardware_SetTextureAddressModeUV_PF(int,int,int) { return 0; }
extern int Graphics_Hardware_SetTextureAddressMode_PF(int,int) { return 0; }
extern int Graphics_Hardware_SetTextureAddressTransformMatrix_PF(int,struct tagMATRIX *,int) { return 0; }
// Graphics_Hardware_SetTransformTo*_PF: impl in DxGraphicsDesktop.cpp (Tier 3)
extern int Graphics_Hardware_SetUseHardwareVertexProcessing_PF(int) { return 0; }
extern int Graphics_Hardware_SetUseNormalDrawShader_PF(int) { return 0; }
extern int Graphics_Hardware_SetUseOldDrawModiGraphCodeFlag_PF(int) { return 0; }
extern int Graphics_Hardware_SetUsePixelLighting_PF(int) { return 0; }
extern int Graphics_Hardware_SetUsePlatformTextureFormat_PF(int) { return 0; }
extern int Graphics_Hardware_SetVerticalFogColor_PF(DWORD) { return 0; }
extern int Graphics_Hardware_SetVerticalFogDensity_PF(float,float) { return 0; }
extern int Graphics_Hardware_SetVerticalFogEnable_PF(int) { return 0; }
extern int Graphics_Hardware_SetVerticalFogMode_PF(int) { return 0; }
extern int Graphics_Hardware_SetVerticalFogStartEnd_PF(float,float) { return 0; }
extern int Graphics_Hardware_SetZBufferMode_PF(int,int,int) { return 0; }
extern int Graphics_Hardware_SetupUseZBuffer_PF(void) { return 0; }
extern int Graphics_Hardware_ShaderConstantBuffer_Create_PF(int,int,int) { return 0; }
extern int Graphics_Hardware_ShaderConstantBuffer_Set_PF(struct SHADERCONSTANTBUFFERHANDLEDATA *,int,int) { return 0; }
extern int Graphics_Hardware_ShaderConstantBuffer_TerminateHandle_PF(struct SHADERCONSTANTBUFFERHANDLEDATA *) { return 0; }
extern int Graphics_Hardware_ShaderConstantBuffer_Update_PF(struct SHADERCONSTANTBUFFERHANDLEDATA *) { return 0; }
extern int Graphics_Hardware_Shader_Create_PF(int,int,void *,int,int,int) { return 0; }
extern int Graphics_Hardware_Shader_GetConstCount_PF(wchar_t const *,struct SHADERHANDLEDATA *) { return 0; }
extern int Graphics_Hardware_Shader_GetConstIndex_PF(wchar_t const *,struct SHADERHANDLEDATA *) { return 0; }
extern int Graphics_Hardware_Shader_GetValidShaderVersion_PF(void) { return 0; }
extern int Graphics_Hardware_Shader_ResetConst_PF(int,int,int,int) { return 0; }
extern int Graphics_Hardware_Shader_SetConst_PF(int,int,int,void const *,int,int) { return 0; }
extern int Graphics_Hardware_Shader_TerminateHandle_PF(struct SHADERHANDLEDATA *) { return 0; }
extern int Graphics_Hardware_Shader_ModelCode_Init_PF(void) { return 0; }
extern int Graphics_Hardware_Shader_ModelCode_Terminate_PF(void) { return 0; }
extern int Graphics_Hardware_ShadowMap_CreateTexture_PF(struct SHADOWMAPDATA *,int) { return 0; }
extern int Graphics_Hardware_ShadowMap_DrawEnd_PF(struct SHADOWMAPDATA *) { return 0; }
extern int Graphics_Hardware_ShadowMap_DrawSetup_PF(struct SHADOWMAPDATA *) { return 0; }
extern int Graphics_Hardware_ShadowMap_ReleaseTexture_PF(struct SHADOWMAPDATA *) { return 0; }
extern int Graphics_Hardware_ShadowMap_SetUse_PF(int,struct SHADOWMAPDATA *) { return 0; }
extern int Graphics_Hardware_UnlockDrawScreenBuffer_PF(void) { return 0; }
extern int Graphics_Hardware_VertexBuffer_Create_PF(struct VERTEXBUFFERHANDLEDATA *) { return 0; }
extern int Graphics_Hardware_VertexBuffer_SetData_PF(struct VERTEXBUFFERHANDLEDATA *,int,void const *,int) { return 0; }
extern int Graphics_Hardware_VertexBuffer_Terminate_PF(struct VERTEXBUFFERHANDLEDATA *) { return 0; }
extern int Graphics_Hardware_WaitVSync_PF(int) { return 0; }
extern int Graphics_Initialize_Timing0_PF(void) { return 0; }
extern int Graphics_Initialize_Timing1_PF(void) { return 0; }
extern int Graphics_RestoreOrChangeSetupGraphSystem_PF(int,int,int,int,int) { return 0; }
// Graphics_ScreenFlipBase_PF: impl in DxGraphicsDesktop.cpp (Stage 6)
extern int Graphics_SetWaitVSyncFlag_PF(int) { return 0; }
extern int Graphics_SetupDisplayInfo_PF(void) { return 0; }
extern int Graphics_Terminate_PF(void) { return 0; }
extern int InitializeBaseImageManage_PF(void) { return 0; }
extern int TerminateBaseImageManage_PF(void) { return 0; }
extern struct DxLib::tagCOLORDATA const * Graphics_Hardware_GetDispColorData_PF(void) { return nullptr; }
extern struct DxLib::tagCOLOR_F Graphics_Hardware_GetPixelF_PF(int,int) { tagCOLOR_F r = {0,0,0,0}; return r; }
extern struct DxLib::tagFLOAT4 const * Graphics_Hardware_Shader_GetConstDefaultParamF_PF(wchar_t const *,struct SHADERHANDLEDATA *) { return nullptr; }
extern DWORD Graphics_Hardware_GetPixel_PF(int,int) { return 0; }
extern void * Graphics_Hardware_ShaderConstantBuffer_GetBuffer_PF(struct SHADERCONSTANTBUFFERHANDLEDATA *) { return nullptr; }
extern void Graphics_Hardware_ShadowMap_RefreshPSParam_PF(void) { }
extern void Graphics_Hardware_ShadowMap_RefreshVSParam_PF(void) { }

extern int MailApp_Send_WCHAR_T_PF(const wchar_t *,const wchar_t *,const wchar_t *,const wchar_t *,const wchar_t *) { return 0; }

// --- end of stubs --------------------------------------------------------

#ifndef DX_NON_NAMESPACE
}
#endif

#endif // DX_NON_GRAPHICS
