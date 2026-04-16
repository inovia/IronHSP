;
; hspdxlib.as - DxLibW header for HSP
; Auto-generated from DxDLLW.cs (DxLib 3.24f)
; Unicode (Wide) version - 32bit/64bit auto-detect
;

#ifdef __hsp30__
#ifndef __HSPDXLIB__
#define global __HSPDXLIB__

#include "hspdxlib_const.as"
#include "hspdxlib_struct.as"

; === Struct definitions (#defstruct) ===
#defstruct global VECTOR
#field float x
#field float y
#field float z
#endstruct

#defstruct global VECTOR_D
#field double x
#field double y
#field double z
#endstruct

#defstruct global MATRIX
#field float m00
#field float m01
#field float m02
#field float m03
#field float m10
#field float m11
#field float m12
#field float m13
#field float m20
#field float m21
#field float m22
#field float m23
#field float m30
#field float m31
#field float m32
#field float m33
#endstruct

#defstruct global COLOR_F
#field float r
#field float g
#field float b
#field float a
#endstruct

#defstruct global FLOAT4
#field float x
#field float y
#field float z
#field float w
#endstruct

#defstruct global DOUBLE4
#field double x
#field double y
#field double z
#field double w
#endstruct

#defstruct global INT4
#field int x
#field int y
#field int z
#field int w
#endstruct

#defstruct global IPDATA
#field byte d1
#field byte d2
#field byte d3
#field byte d4
#endstruct

#defstruct global IPDATA_IPv6
#field byte Byte00
#field byte Byte01
#field byte Byte02
#field byte Byte03
#field byte Byte04
#field byte Byte05
#field byte Byte06
#field byte Byte07
#field byte Byte08
#field byte Byte09
#field byte Byte10
#field byte Byte11
#field byte Byte12
#field byte Byte13
#field byte Byte14
#field byte Byte15
#endstruct

#defstruct global MATERIALPARAM
#field float Power
#endstruct

#defstruct global MATRIX_D
#field double m00
#field double m01
#field double m02
#field double m03
#field double m10
#field double m11
#field double m12
#field double m13
#field double m20
#field double m21
#field double m22
#field double m23
#field double m30
#field double m31
#field double m32
#field double m33
#endstruct

#defstruct global MV1_COLL_RESULT_POLY_DIM
#field int HitNum
#endstruct

#defstruct global RECT
#field int left
#field int top
#field int right
#field int bottom
#endstruct



; --- DLL selection (32bit / 64bit) ---
#ifdef __hsp64__
#uselib "DxLibW_x64.dll"
#else
#uselib "DxLibW.dll"
#endif

	; === システム ===
	#func global DxLib_Init "dx_DxLib_Init"
	#func global DxLib_End "dx_DxLib_End"
	#cfunc global DxLib_GlobalStructInitialize "dx_DxLib_GlobalStructInitialize"
	#cfunc global DxLib_IsInit "dx_DxLib_IsInit"
	#func global ProcessMessage "dx_ProcessMessage"
	#func global SetAlwaysRunFlag "dx_SetAlwaysRunFlag" int
	#func global WaitTimer "dx_WaitTimer" int
	#func global WaitKey "dx_WaitKey"
	#cfunc global GetNowCount "dx_GetNowCount"
	#cfunc global GetNowCount_1 "dx_GetNowCount" int
	#cfunc global GetNowHiPerformanceCount "dx_GetNowHiPerformanceCount"
	#cfunc global GetNowHiPerformanceCount_1 "dx_GetNowHiPerformanceCount" int
	#cfunc global GetDateTime "dx_GetDateTime" var
	#cfunc global GetRand "dx_GetRand" int
	#func global SRand "dx_SRand" int
	#func global SetOutApplicationLogValidFlag "dx_SetOutApplicationLogValidFlag" int
	#func global SetLogDrawOutFlag "dx_SetLogDrawOutFlag" int
	#func global SetWaitVSyncFlag "dx_SetWaitVSyncFlag" int
	#func global SetUseDXArchiveFlag "dx_SetUseDXArchiveFlag" int
	#func global SetDXArchiveKeyString "dx_SetDXArchiveKeyString"
	#func global SetDXArchiveKeyString_1 "dx_SetDXArchiveKeyString" wstr
	#func global SetUseCharSet "dx_SetUseCharSet" int
	#func global SetDoubleStartValidFlag "dx_SetDoubleStartValidFlag" int

	; === ウィンドウ ===
	#func global SetWindowMenu "dx_SetWindowMenu" int, int
	#cfunc global MakeScreen "dx_MakeScreen" int, int
	#cfunc global MakeScreen_1 "dx_MakeScreen" int, int, int
	#func global SetGraphColorBitDepth "dx_SetGraphColorBitDepth" int
	#cfunc global GetGraphColorBitDepth "dx_GetGraphColorBitDepth"
	#func global SetCreateGraphColorBitDepth "dx_SetCreateGraphColorBitDepth" int
	#cfunc global GetCreateGraphColorBitDepth "dx_GetCreateGraphColorBitDepth"
	#cfunc global LoadGraphScreen "dx_LoadGraphScreen" int, int, wstr, int
	#cfuncst global VECTOR ConvWorldPosToScreenPos "dx_ConvWorldPosToScreenPos" VECTOR
	#cfuncst global VECTOR_D ConvWorldPosToScreenPosD "dx_ConvWorldPosToScreenPosD" VECTOR_D
	#cfuncst global FLOAT4 ConvWorldPosToScreenPosPlusW "dx_ConvWorldPosToScreenPosPlusW" VECTOR
	#cfuncst global DOUBLE4 ConvWorldPosToScreenPosPlusWD "dx_ConvWorldPosToScreenPosPlusWD" VECTOR_D
	#cfuncst global VECTOR ConvScreenPosToWorldPos "dx_ConvScreenPosToWorldPos" VECTOR
	#cfuncst global VECTOR_D ConvScreenPosToWorldPosD "dx_ConvScreenPosToWorldPosD" VECTOR_D
	#cfuncst global VECTOR ConvScreenPosToWorldPos_ZLinear "dx_ConvScreenPosToWorldPos_ZLinear" VECTOR
	#cfuncst global VECTOR_D ConvScreenPosToWorldPos_ZLinearD "dx_ConvScreenPosToWorldPos_ZLinearD" VECTOR_D
	#func global ScreenFlip "dx_ScreenFlip"
	#cfunc global ScreenCopy "dx_ScreenCopy"
	#func global SetGraphMode "dx_SetGraphMode" int, int, int
	#func global SetGraphMode_1 "dx_SetGraphMode" int, int, int, int
	#func global SetUserScreenImage "dx_SetUserScreenImage" int, int
	#func global SetFullScreenResolutionMode "dx_SetFullScreenResolutionMode" int
	#cfunc global GetFullScreenResolutionMode "dx_GetFullScreenResolutionMode" var, var
	#cfunc global GetUseFullScreenResolutionMode "dx_GetUseFullScreenResolutionMode"
	#func global SetFullScreenScalingMode "dx_SetFullScreenScalingMode" int
	#func global SetFullScreenScalingMode_1 "dx_SetFullScreenScalingMode" int, int
	#func global SetChangeScreenModeGraphicsSystemResetFlag "dx_SetChangeScreenModeGraphicsSystemResetFlag" int
	#cfunc global GetScreenState "dx_GetScreenState" var, var, var
	#cfunc global GetScreenBitDepth "dx_GetScreenBitDepth"
	#cfunc global GetColorBitDepth "dx_GetColorBitDepth"
	#cfuncst global GetFullScreenUseDisplayMode "dx_GetFullScreenUseDisplayMode" 16
	#cfunc global GetDisplayMaxResolution "dx_GetDisplayMaxResolution" var, var
	#cfunc global GetDisplayMaxResolution_1 "dx_GetDisplayMaxResolution" var, var, int
	#func global SetScreenMemToVramFlag "dx_SetScreenMemToVramFlag" int
	#cfunc global GetScreenMemToSystemMemFlag "dx_GetScreenMemToSystemMemFlag"
	#func global SetCameraScreenCenter "dx_SetCameraScreenCenter" float, float
	#func global SetCameraScreenCenterD "dx_SetCameraScreenCenterD" double, double
	#cfunc global GetCameraScreenCenter "dx_GetCameraScreenCenter" var, var
	#cfunc global GetCameraScreenCenterD "dx_GetCameraScreenCenterD" var, var
	#cfunc global CreateMaskScreen "dx_CreateMaskScreen"
	#func global DeleteMaskScreen "dx_DeleteMaskScreen"
	#func global SetUseMaskScreenFlag "dx_SetUseMaskScreenFlag" int
	#cfunc global GetUseMaskScreenFlag "dx_GetUseMaskScreenFlag"
	#cfunc global FillMaskScreen "dx_FillMaskScreen" int
	#func global SetMaskScreenGraph "dx_SetMaskScreenGraph" int
	#func global SetMaskScreenGraphUseChannel "dx_SetMaskScreenGraphUseChannel" int
	#cfunc global GetMaskScreenData "dx_GetMaskScreenData" int, int, int, int, int
	#func global SetFontCacheTextureColorBitDepth "dx_SetFontCacheTextureColorBitDepth" int
	#cfunc global GetFontCacheTextureColorBitDepth "dx_GetFontCacheTextureColorBitDepth"
	#cfunc global GetWindowCRect "dx_GetWindowCRect" var
	#cfunc global GetWindowClientRect "dx_GetWindowClientRect" var
	#cfunc global GetWindowFrameRect "dx_GetWindowFrameRect" var
	#cfunc global GetWindowActiveFlag "dx_GetWindowActiveFlag"
	#cfunc global GetWindowMinSizeFlag "dx_GetWindowMinSizeFlag"
	#cfunc global GetWindowMaxSizeFlag "dx_GetWindowMaxSizeFlag"
	#cfunc global GetMainWindowHandle "dx_GetMainWindowHandle"
	#cfunc global GetWindowModeFlag "dx_GetWindowModeFlag"
	#cfunc global GetWindowOSVersion "dx_GetWindowOSVersion"
	#cfunc global GetWindowCloseFlag "dx_GetWindowCloseFlag"
	#cfunc global GetUseWindowRgnFlag "dx_GetUseWindowRgnFlag"
	#cfunc global GetWindowSize "dx_GetWindowSize" var, var
	#cfunc global GetWindowEdgeWidth "dx_GetWindowEdgeWidth" var, var, var, var
	#cfunc global GetWindowPosition "dx_GetWindowPosition" var, var
	#cfunc global GetWindowUserCloseFlag "dx_GetWindowUserCloseFlag"
	#cfunc global GetWindowUserCloseFlag_1 "dx_GetWindowUserCloseFlag" int
	#cfunc global CheckWindowMaximizeButtonInput "dx_CheckWindowMaximizeButtonInput"
	#cfunc global CheckWindowMaximizeButtonInput_1 "dx_CheckWindowMaximizeButtonInput" int
	#func global ChangeWindowMode "dx_ChangeWindowMode" int
	#func global SetWindowText "dx_SetWindowText" wstr
	#func global SetWindowTextDX "dx_SetWindowTextDX" wstr
	#func global SetMainWindowText "dx_SetMainWindowText" wstr
	#func global SetMainWindowClassName "dx_SetMainWindowClassName" wstr
	#func global SetWindowIconID "dx_SetWindowIconID" int
	#func global SetWindowIconHandle "dx_SetWindowIconHandle" int
	#func global SetWindowStyleMode "dx_SetWindowStyleMode" int
	#func global SetWindowZOrder "dx_SetWindowZOrder" int
	#func global SetWindowZOrder_1 "dx_SetWindowZOrder" int, int
	#func global SetWindowSizeChangeEnableFlag "dx_SetWindowSizeChangeEnableFlag" int
	#func global SetWindowSizeChangeEnableFlag_1 "dx_SetWindowSizeChangeEnableFlag" int, int
	#func global SetWindowSizeExtendRate "dx_SetWindowSizeExtendRate" double
	#func global SetWindowSizeExtendRate_1 "dx_SetWindowSizeExtendRate" double, double
	#func global SetWindowSize "dx_SetWindowSize" int, int
	#func global SetWindowMaxSize "dx_SetWindowMaxSize" int, int
	#func global SetWindowMinSize "dx_SetWindowMinSize" int, int
	#func global SetWindowPosition "dx_SetWindowPosition" int, int
	#func global SetWindowMaximizeButtonBehavior "dx_SetWindowMaximizeButtonBehavior" int
	#func global AddMessageTakeOverWindow "dx_AddMessageTakeOverWindow" int
	#func global SubMessageTakeOverWindow "dx_SubMessageTakeOverWindow" int
	#func global SetWindowInitPosition "dx_SetWindowInitPosition" int, int
	#func global SetWindowVisibleFlag "dx_SetWindowVisibleFlag" int
	#func global SetWindowMinimizeFlag "dx_SetWindowMinimizeFlag" int
	#func global SetWindowUserCloseEnableFlag "dx_SetWindowUserCloseEnableFlag" int
	#func global SetUseBorderlessWindowFlag "dx_SetUseBorderlessWindowFlag" int
	#func global SetUserWindow "dx_SetUserWindow" int
	#func global SetUserChildWindow "dx_SetUserChildWindow" int
	#func global SetUserWindowMessageProcessDXLibFlag "dx_SetUserWindowMessageProcessDXLibFlag" int
	#func global SetValidMousePointerWindowOutClientAreaMoveFlag "dx_SetValidMousePointerWindowOutClientAreaMoveFlag" int
	#func global SetUseUpdateLayerdWindowFlag "dx_SetUseUpdateLayerdWindowFlag" int
	#func global SetUseMouseEventTransparentWindowFlag "dx_SetUseMouseEventTransparentWindowFlag" int
	#func global SetWindows10_WM_CHAR_CancelTime "dx_SetWindows10_WM_CHAR_CancelTime" int
	#func global SetUseWindows10_WM_CHAR_CancelTime "dx_SetUseWindows10_WM_CHAR_CancelTime" int
	#func global SetWindowRgnGraph "dx_SetWindowRgnGraph" wstr
	#func global UpdateTransColorWindowRgn "dx_UpdateTransColorWindowRgn"
	#func global BltBackScreenToWindow "dx_BltBackScreenToWindow" int, int, int
	#func global BltRectBackScreenToWindow "dx_BltRectBackScreenToWindow" int, RECT, RECT
	#func global SetScreenFlipTargetWindow "dx_SetScreenFlipTargetWindow" int
	#func global SetScreenFlipTargetWindow_1 "dx_SetScreenFlipTargetWindow" int, double
	#func global SetScreenFlipTargetWindow_2 "dx_SetScreenFlipTargetWindow" int, double, double
	#cfunc global GetDesktopScreenGraph "dx_GetDesktopScreenGraph" int, int, int, int, int
	#cfunc global GetDesktopScreenGraph_1 "dx_GetDesktopScreenGraph" int, int, int, int, int, int
	#cfunc global GetDesktopScreenGraph_2 "dx_GetDesktopScreenGraph" int, int, int, int, int, int, int
	#cfunc global GetDesktopScreenGraphMemImage "dx_GetDesktopScreenGraphMemImage" int, int, int, int, var, var, var
	#cfunc global GetDesktopScreenGraphMemImage_1 "dx_GetDesktopScreenGraphMemImage" int, int, int, int, var, var, var, int
	#cfunc global GetOtherWindowGraph "dx_GetOtherWindowGraph" int, int, int, int, int, int
	#cfunc global GetOtherWindowGraph_1 "dx_GetOtherWindowGraph" int, int, int, int, int, int, int
	#cfunc global GetOtherWindowGraph_2 "dx_GetOtherWindowGraph" int, int, int, int, int, int, int, int
	#func global UpdateLayerdWindowForSoftImage "dx_UpdateLayerdWindowForSoftImage" int
	#func global UpdateLayerdWindowForSoftImageRect "dx_UpdateLayerdWindowForSoftImageRect" int, int, int, int, int
	#func global UpdateLayerdWindowForPremultipliedAlphaSoftImage "dx_UpdateLayerdWindowForPremultipliedAlphaSoftImage" int
	#func global UpdateLayerdWindowForPremultipliedAlphaSoftImageRect "dx_UpdateLayerdWindowForPremultipliedAlphaSoftImageRect" int, int, int, int, int
	#cfunc global GetDesktopScreenSoftImage "dx_GetDesktopScreenSoftImage" int, int, int, int, int, int, int

	; === グラフィック描画 ===
	#func global ClearDrawScreen "dx_ClearDrawScreen" var
	#func global ClearDrawScreen_1 "dx_ClearDrawScreen"
	#func global ClearDrawScreenZBuffer "dx_ClearDrawScreenZBuffer" var
	#func global ClearDrawScreenZBuffer_1 "dx_ClearDrawScreenZBuffer"
	#func global Paint "dx_Paint" int, int, int
	#func global Paint_1 "dx_Paint" int, int, int, int
	#func global DrawObtainsBox "dx_DrawObtainsBox" int, int, int, int, int, int, int
	#func global SetDrawValidGraphCreateFlag "dx_SetDrawValidGraphCreateFlag" int
	#func global SetDrawValidFlagOf3DGraph "dx_SetDrawValidFlagOf3DGraph" int
	#func global SetDrawValidAlphaChannelGraphCreateFlag "dx_SetDrawValidAlphaChannelGraphCreateFlag" int
	#func global SetDrawValidFloatTypeGraphCreateFlag "dx_SetDrawValidFloatTypeGraphCreateFlag" int
	#func global SetDrawValidGraphCreateZBufferFlag "dx_SetDrawValidGraphCreateZBufferFlag" int
	#func global SetDrawValidMultiSample "dx_SetDrawValidMultiSample" int, int
	#func global DrawLine "dx_DrawLine" int, int, int, int, int
	#func global DrawLine_1 "dx_DrawLine" int, int, int, int, int, int
	#func global DrawLineAA "dx_DrawLineAA" float, float, float, float, int
	#func global DrawLineAA_1 "dx_DrawLineAA" float, float, float, float, int, float
	#func global DrawBox "dx_DrawBox" int, int, int, int, int, int
	#func global DrawBox_1 "dx_DrawBox" int, int, int, int, int, int, int
	#func global DrawBoxAA "dx_DrawBoxAA" float, float, float, float, int, int
	#func global DrawBoxAA_1 "dx_DrawBoxAA" float, float, float, float, int, int, float
	#func global DrawFillBox "dx_DrawFillBox" int, int, int, int, int
	#func global DrawLineBox "dx_DrawLineBox" int, int, int, int, int
	#func global DrawLineBox_1 "dx_DrawLineBox" int, int, int, int, int, int
	#func global DrawCircle "dx_DrawCircle" int, int, int, int
	#func global DrawCircle_1 "dx_DrawCircle" int, int, int, int, int
	#func global DrawCircle_2 "dx_DrawCircle" int, int, int, int, int, int
	#func global DrawCircleAA "dx_DrawCircleAA" float, float, float, int, int
	#func global DrawCircleAA_1 "dx_DrawCircleAA" float, float, float, int, int, int
	#func global DrawCircleAA_2 "dx_DrawCircleAA" float, float, float, int, int, int, float
	#func global DrawCircleAA_3 "dx_DrawCircleAA" float, float, float, int, int, int, float, double
	#func global DrawOval "dx_DrawOval" int, int, int, int, int, int
	#func global DrawOval_1 "dx_DrawOval" int, int, int, int, int, int, int
	#func global DrawOvalAA "dx_DrawOvalAA" float, float, float, float, int, int, int
	#func global DrawOvalAA_1 "dx_DrawOvalAA" float, float, float, float, int, int, int, float
	#func global DrawOval_Rect "dx_DrawOval_Rect" int, int, int, int, int, int
	#func global DrawTriangle "dx_DrawTriangle" int, int, int, int, int, int, int, int
	#func global DrawTriangleAA "dx_DrawTriangleAA" float, float, float, float, float, float, int, int
	#func global DrawTriangleAA_1 "dx_DrawTriangleAA" float, float, float, float, float, float, int, int, float
	#func global DrawQuadrangle "dx_DrawQuadrangle" int, int, int, int, int, int, int, int, int, int
	#func global DrawQuadrangleAA "dx_DrawQuadrangleAA" float, float, float, float, float, float, float, float, int, int
	#func global DrawQuadrangleAA_1 "dx_DrawQuadrangleAA" float, float, float, float, float, float, float, float, int, int, float
	#func global DrawRoundRect "dx_DrawRoundRect" int, int, int, int, int, int, int, int
	#func global DrawRoundRectAA "dx_DrawRoundRectAA" float, float, float, float, float, float, int, int, int
	#func global DrawRoundRectAA_1 "dx_DrawRoundRectAA" float, float, float, float, float, float, int, int, int, float
	#func global DrawPixel "dx_DrawPixel" int, int, int
	#func global DrawPixelSet "dx_DrawPixelSet" int, var, int
	#func global DrawLineSet "dx_DrawLineSet" int, var, int
	#func global DrawBoxSet "dx_DrawBoxSet" int, var, int
	#func global DrawPixel3D "dx_DrawPixel3D" VECTOR, int
	#func global DrawPixel3DD "dx_DrawPixel3DD" VECTOR_D, int
	#func global DrawLine3D "dx_DrawLine3D" VECTOR, VECTOR, int
	#func global DrawLine3DD "dx_DrawLine3DD" VECTOR_D, VECTOR_D, int
	#func global DrawTriangle3D "dx_DrawTriangle3D" VECTOR, VECTOR, VECTOR, int, int
	#func global DrawTriangle3DD "dx_DrawTriangle3DD" VECTOR_D, VECTOR_D, VECTOR_D, int, int
	#func global DrawCube3D "dx_DrawCube3D" VECTOR, VECTOR, int, int, int
	#func global DrawCube3DD "dx_DrawCube3DD" VECTOR_D, VECTOR_D, int, int, int
	#func global DrawCubeSet3D "dx_DrawCubeSet3D" int, var, int, int
	#func global DrawSphere3D "dx_DrawSphere3D" VECTOR, float, int, int, int, int
	#func global DrawSphere3DD "dx_DrawSphere3DD" VECTOR_D, double, int, int, int, int
	#func global DrawCapsule3D "dx_DrawCapsule3D" VECTOR, VECTOR, float, int, int, int, int
	#func global DrawCapsule3DD "dx_DrawCapsule3DD" VECTOR_D, VECTOR_D, double, int, int, int, int
	#func global DrawCylinder3D "dx_DrawCylinder3D" VECTOR, VECTOR, float, int, int, int, int
	#func global DrawCylinder3DD "dx_DrawCylinder3DD" VECTOR_D, VECTOR_D, double, int, int, int, int
	#func global DrawTube3D "dx_DrawTube3D" VECTOR, VECTOR, float, float, int, int, int, int
	#func global DrawTube3DD "dx_DrawTube3DD" VECTOR_D, VECTOR_D, double, double, int, int, int, int
	#func global DrawCone3D "dx_DrawCone3D" VECTOR, VECTOR, float, int, int, int, int
	#func global DrawCone3DD "dx_DrawCone3DD" VECTOR_D, VECTOR_D, double, int, int, int, int
	#func global DrawGraph "dx_DrawGraph" int, int, int, int
	#func global DrawExtendGraph "dx_DrawExtendGraph" int, int, int, int, int, int
	#func global DrawRotaGraph "dx_DrawRotaGraph" int, int, double, double, int, int
	#func global DrawRotaGraph_1 "dx_DrawRotaGraph" int, int, double, double, int, int, int
	#func global DrawRotaGraph_2 "dx_DrawRotaGraph" int, int, double, double, int, int, int, int
	#func global DrawRotaGraph2 "dx_DrawRotaGraph2" int, int, int, int, double, double, int, int
	#func global DrawRotaGraph2_1 "dx_DrawRotaGraph2" int, int, int, int, double, double, int, int, int
	#func global DrawRotaGraph2_2 "dx_DrawRotaGraph2" int, int, int, int, double, double, int, int, int, int
	#func global DrawRotaGraph3 "dx_DrawRotaGraph3" int, int, int, int, double, double, double, int, int
	#func global DrawRotaGraph3_1 "dx_DrawRotaGraph3" int, int, int, int, double, double, double, int, int, int
	#func global DrawRotaGraph3_2 "dx_DrawRotaGraph3" int, int, int, int, double, double, double, int, int, int, int
	#func global DrawRotaGraphFast "dx_DrawRotaGraphFast" int, int, float, float, int, int
	#func global DrawRotaGraphFast_1 "dx_DrawRotaGraphFast" int, int, float, float, int, int, int
	#func global DrawRotaGraphFast_2 "dx_DrawRotaGraphFast" int, int, float, float, int, int, int, int
	#func global DrawRotaGraphFast2 "dx_DrawRotaGraphFast2" int, int, int, int, float, float, int, int
	#func global DrawRotaGraphFast2_1 "dx_DrawRotaGraphFast2" int, int, int, int, float, float, int, int, int
	#func global DrawRotaGraphFast2_2 "dx_DrawRotaGraphFast2" int, int, int, int, float, float, int, int, int, int
	#func global DrawRotaGraphFast3 "dx_DrawRotaGraphFast3" int, int, int, int, float, float, float, int, int
	#func global DrawRotaGraphFast3_1 "dx_DrawRotaGraphFast3" int, int, int, int, float, float, float, int, int, int
	#func global DrawRotaGraphFast3_2 "dx_DrawRotaGraphFast3" int, int, int, int, float, float, float, int, int, int, int
	#func global DrawModiGraph "dx_DrawModiGraph" int, int, int, int, int, int, int, int, int, int
	#func global DrawTurnGraph "dx_DrawTurnGraph" int, int, int, int
	#func global DrawReverseGraph "dx_DrawReverseGraph" int, int, int, int
	#func global DrawReverseGraph_1 "dx_DrawReverseGraph" int, int, int, int, int
	#func global DrawReverseGraph_2 "dx_DrawReverseGraph" int, int, int, int, int, int
	#func global DrawGraphF "dx_DrawGraphF" float, float, int, int
	#func global DrawExtendGraphF "dx_DrawExtendGraphF" float, float, float, float, int, int
	#func global DrawRotaGraphF "dx_DrawRotaGraphF" float, float, double, double, int, int
	#func global DrawRotaGraphF_1 "dx_DrawRotaGraphF" float, float, double, double, int, int, int
	#func global DrawRotaGraphF_2 "dx_DrawRotaGraphF" float, float, double, double, int, int, int, int
	#func global DrawRotaGraph2F "dx_DrawRotaGraph2F" float, float, float, float, double, double, int, int
	#func global DrawRotaGraph2F_1 "dx_DrawRotaGraph2F" float, float, float, float, double, double, int, int, int
	#func global DrawRotaGraph2F_2 "dx_DrawRotaGraph2F" float, float, float, float, double, double, int, int, int, int
	#func global DrawRotaGraph3F "dx_DrawRotaGraph3F" float, float, float, float, double, double, double, int, int
	#func global DrawRotaGraph3F_1 "dx_DrawRotaGraph3F" float, float, float, float, double, double, double, int, int, int
	#func global DrawRotaGraph3F_2 "dx_DrawRotaGraph3F" float, float, float, float, double, double, double, int, int, int, int
	#func global DrawRotaGraphFastF "dx_DrawRotaGraphFastF" float, float, float, float, int, int
	#func global DrawRotaGraphFastF_1 "dx_DrawRotaGraphFastF" float, float, float, float, int, int, int
	#func global DrawRotaGraphFastF_2 "dx_DrawRotaGraphFastF" float, float, float, float, int, int, int, int
	#func global DrawRotaGraphFast2F "dx_DrawRotaGraphFast2F" float, float, float, float, float, float, int, int
	#func global DrawRotaGraphFast2F_1 "dx_DrawRotaGraphFast2F" float, float, float, float, float, float, int, int, int
	#func global DrawRotaGraphFast2F_2 "dx_DrawRotaGraphFast2F" float, float, float, float, float, float, int, int, int, int
	#func global DrawRotaGraphFast3F "dx_DrawRotaGraphFast3F" float, float, float, float, float, float, float, int, int
	#func global DrawRotaGraphFast3F_1 "dx_DrawRotaGraphFast3F" float, float, float, float, float, float, float, int, int, int
	#func global DrawRotaGraphFast3F_2 "dx_DrawRotaGraphFast3F" float, float, float, float, float, float, float, int, int, int, int
	#func global DrawModiGraphF "dx_DrawModiGraphF" float, float, float, float, float, float, float, float, int, int
	#func global DrawTurnGraphF "dx_DrawTurnGraphF" float, float, int, int
	#func global DrawReverseGraphF "dx_DrawReverseGraphF" float, float, int, int
	#func global DrawReverseGraphF_1 "dx_DrawReverseGraphF" float, float, int, int, int
	#func global DrawReverseGraphF_2 "dx_DrawReverseGraphF" float, float, int, int, int, int
	#func global DrawChipMap2 "dx_DrawChipMap2" int, int, var, int, var, int, int, int, int, int, int, int
	#func global DrawTile "dx_DrawTile" int, int, int, int, int, int, double, double, int, int
	#func global DrawRectGraph "dx_DrawRectGraph" int, int, int, int, int, int, int, int
	#func global DrawRectGraph_1 "dx_DrawRectGraph" int, int, int, int, int, int, int, int, int
	#func global DrawRectGraph_2 "dx_DrawRectGraph" int, int, int, int, int, int, int, int, int, int
	#func global DrawRectExtendGraph "dx_DrawRectExtendGraph" int, int, int, int, int, int, int, int, int, int
	#func global DrawRectRotaGraph "dx_DrawRectRotaGraph" int, int, int, int, int, int, double, double, int, int
	#func global DrawRectRotaGraph_1 "dx_DrawRectRotaGraph" int, int, int, int, int, int, double, double, int, int, int
	#func global DrawRectRotaGraph_2 "dx_DrawRectRotaGraph" int, int, int, int, int, int, double, double, int, int, int, int
	#func global DrawRectRotaGraph2 "dx_DrawRectRotaGraph2" int, int, int, int, int, int, int, int, double, double, int, int
	#func global DrawRectRotaGraph2_1 "dx_DrawRectRotaGraph2" int, int, int, int, int, int, int, int, double, double, int, int, int
	#func global DrawRectRotaGraph2_2 "dx_DrawRectRotaGraph2" int, int, int, int, int, int, int, int, double, double, int, int, int, int
	#func global DrawRectRotaGraph3 "dx_DrawRectRotaGraph3" int, int, int, int, int, int, int, int, double, double, double, int, int
	#func global DrawRectRotaGraph3_1 "dx_DrawRectRotaGraph3" int, int, int, int, int, int, int, int, double, double, double, int, int, int
	#func global DrawRectRotaGraph3_2 "dx_DrawRectRotaGraph3" int, int, int, int, int, int, int, int, double, double, double, int, int, int, int
	#func global DrawRectRotaGraphFast "dx_DrawRectRotaGraphFast" int, int, int, int, int, int, float, float, int, int
	#func global DrawRectRotaGraphFast_1 "dx_DrawRectRotaGraphFast" int, int, int, int, int, int, float, float, int, int, int
	#func global DrawRectRotaGraphFast_2 "dx_DrawRectRotaGraphFast" int, int, int, int, int, int, float, float, int, int, int, int
	#func global DrawRectRotaGraphFast2 "dx_DrawRectRotaGraphFast2" int, int, int, int, int, int, int, int, float, float, int, int
	#func global DrawRectRotaGraphFast2_1 "dx_DrawRectRotaGraphFast2" int, int, int, int, int, int, int, int, float, float, int, int, int
	#func global DrawRectRotaGraphFast2_2 "dx_DrawRectRotaGraphFast2" int, int, int, int, int, int, int, int, float, float, int, int, int, int
	#func global DrawRectRotaGraphFast3 "dx_DrawRectRotaGraphFast3" int, int, int, int, int, int, int, int, float, float, float, int, int
	#func global DrawRectRotaGraphFast3_1 "dx_DrawRectRotaGraphFast3" int, int, int, int, int, int, int, int, float, float, float, int, int, int
	#func global DrawRectRotaGraphFast3_2 "dx_DrawRectRotaGraphFast3" int, int, int, int, int, int, int, int, float, float, float, int, int, int, int
	#func global DrawRectModiGraph "dx_DrawRectModiGraph" int, int, int, int, int, int, int, int, int, int, int, int, int, int
	#func global DrawRectGraphF "dx_DrawRectGraphF" float, float, int, int, int, int, int, int
	#func global DrawRectGraphF_1 "dx_DrawRectGraphF" float, float, int, int, int, int, int, int, int
	#func global DrawRectGraphF_2 "dx_DrawRectGraphF" float, float, int, int, int, int, int, int, int, int
	#func global DrawRectGraphF2 "dx_DrawRectGraphF2" float, float, float, float, float, float, int, int
	#func global DrawRectGraphF2_1 "dx_DrawRectGraphF2" float, float, float, float, float, float, int, int, int
	#func global DrawRectGraphF2_2 "dx_DrawRectGraphF2" float, float, float, float, float, float, int, int, int, int
	#func global DrawRectExtendGraphF "dx_DrawRectExtendGraphF" float, float, float, float, int, int, int, int, int, int
	#func global DrawRectExtendGraphF2 "dx_DrawRectExtendGraphF2" float, float, float, float, float, float, float, float, int, int
	#func global DrawRectRotaGraphF "dx_DrawRectRotaGraphF" float, float, int, int, int, int, double, double, int, int
	#func global DrawRectRotaGraphF_1 "dx_DrawRectRotaGraphF" float, float, int, int, int, int, double, double, int, int, int
	#func global DrawRectRotaGraphF_2 "dx_DrawRectRotaGraphF" float, float, int, int, int, int, double, double, int, int, int, int
	#func global DrawRectRotaGraph2F "dx_DrawRectRotaGraph2F" float, float, int, int, int, int, float, float, double, double, int, int
	#func global DrawRectRotaGraph2F_1 "dx_DrawRectRotaGraph2F" float, float, int, int, int, int, float, float, double, double, int, int, int
	#func global DrawRectRotaGraph2F_2 "dx_DrawRectRotaGraph2F" float, float, int, int, int, int, float, float, double, double, int, int, int, int
	#func global DrawRectRotaGraph3F "dx_DrawRectRotaGraph3F" float, float, int, int, int, int, float, float, double, double, double, int, int
	#func global DrawRectRotaGraph3F_1 "dx_DrawRectRotaGraph3F" float, float, int, int, int, int, float, float, double, double, double, int, int, int
	#func global DrawRectRotaGraph3F_2 "dx_DrawRectRotaGraph3F" float, float, int, int, int, int, float, float, double, double, double, int, int, int, int
	#func global DrawRectRotaGraphFastF "dx_DrawRectRotaGraphFastF" float, float, int, int, int, int, float, float, int, int
	#func global DrawRectRotaGraphFastF_1 "dx_DrawRectRotaGraphFastF" float, float, int, int, int, int, float, float, int, int, int
	#func global DrawRectRotaGraphFastF_2 "dx_DrawRectRotaGraphFastF" float, float, int, int, int, int, float, float, int, int, int, int
	#func global DrawRectRotaGraphFast2F "dx_DrawRectRotaGraphFast2F" float, float, int, int, int, int, float, float, float, float, int, int
	#func global DrawRectRotaGraphFast2F_1 "dx_DrawRectRotaGraphFast2F" float, float, int, int, int, int, float, float, float, float, int, int, int
	#func global DrawRectRotaGraphFast2F_2 "dx_DrawRectRotaGraphFast2F" float, float, int, int, int, int, float, float, float, float, int, int, int, int
	#func global DrawRectRotaGraphFast3F "dx_DrawRectRotaGraphFast3F" float, float, int, int, int, int, float, float, float, float, float, int, int
	#func global DrawRectRotaGraphFast3F_1 "dx_DrawRectRotaGraphFast3F" float, float, int, int, int, int, float, float, float, float, float, int, int, int
	#func global DrawRectRotaGraphFast3F_2 "dx_DrawRectRotaGraphFast3F" float, float, int, int, int, int, float, float, float, float, float, int, int, int, int
	#func global DrawRectModiGraphF "dx_DrawRectModiGraphF" float, float, float, float, float, float, float, float, int, int, int, int, int, int
	#func global DrawBlendGraph "dx_DrawBlendGraph" int, int, int, int, int, int, int
	#func global DrawBlendGraphF "dx_DrawBlendGraphF" float, float, int, int, int, int, int
	#func global DrawBlendGraphPos "dx_DrawBlendGraphPos" int, int, int, int, int, int, int, int, int
	#func global DrawCircleGauge "dx_DrawCircleGauge" int, int, double, int
	#func global DrawCircleGauge_1 "dx_DrawCircleGauge" int, int, double, int, double
	#func global DrawCircleGauge_2 "dx_DrawCircleGauge" int, int, double, int, double, double
	#func global DrawCircleGauge_3 "dx_DrawCircleGauge" int, int, double, int, double, double, int
	#func global DrawCircleGauge_4 "dx_DrawCircleGauge" int, int, double, int, double, double, int, int
	#func global DrawCircleGaugeF "dx_DrawCircleGaugeF" float, float, double, int
	#func global DrawCircleGaugeF_1 "dx_DrawCircleGaugeF" float, float, double, int, double
	#func global DrawCircleGaugeF_2 "dx_DrawCircleGaugeF" float, float, double, int, double, double
	#func global DrawCircleGaugeF_3 "dx_DrawCircleGaugeF" float, float, double, int, double, double, int
	#func global DrawCircleGaugeF_4 "dx_DrawCircleGaugeF" float, float, double, int, double, double, int, int
	#func global DrawGraphToZBuffer "dx_DrawGraphToZBuffer" int, int, int, int
	#func global DrawTurnGraphToZBuffer "dx_DrawTurnGraphToZBuffer" int, int, int, int
	#func global DrawReverseGraphToZBuffer "dx_DrawReverseGraphToZBuffer" int, int, int, int
	#func global DrawReverseGraphToZBuffer_1 "dx_DrawReverseGraphToZBuffer" int, int, int, int, int
	#func global DrawReverseGraphToZBuffer_2 "dx_DrawReverseGraphToZBuffer" int, int, int, int, int, int
	#func global DrawExtendGraphToZBuffer "dx_DrawExtendGraphToZBuffer" int, int, int, int, int, int
	#func global DrawRotaGraphToZBuffer "dx_DrawRotaGraphToZBuffer" int, int, double, double, int, int
	#func global DrawRotaGraphToZBuffer_1 "dx_DrawRotaGraphToZBuffer" int, int, double, double, int, int, int
	#func global DrawRotaGraphToZBuffer_2 "dx_DrawRotaGraphToZBuffer" int, int, double, double, int, int, int, int
	#func global DrawRotaGraph2ToZBuffer "dx_DrawRotaGraph2ToZBuffer" int, int, int, int, double, double, int, int
	#func global DrawRotaGraph2ToZBuffer_1 "dx_DrawRotaGraph2ToZBuffer" int, int, int, int, double, double, int, int, int
	#func global DrawRotaGraph2ToZBuffer_2 "dx_DrawRotaGraph2ToZBuffer" int, int, int, int, double, double, int, int, int, int
	#func global DrawRotaGraph3ToZBuffer "dx_DrawRotaGraph3ToZBuffer" int, int, int, int, double, double, double, int, int
	#func global DrawRotaGraph3ToZBuffer_1 "dx_DrawRotaGraph3ToZBuffer" int, int, int, int, double, double, double, int, int, int
	#func global DrawRotaGraph3ToZBuffer_2 "dx_DrawRotaGraph3ToZBuffer" int, int, int, int, double, double, double, int, int, int, int
	#func global DrawRotaGraphFastToZBuffer "dx_DrawRotaGraphFastToZBuffer" int, int, float, float, int, int
	#func global DrawRotaGraphFastToZBuffer_1 "dx_DrawRotaGraphFastToZBuffer" int, int, float, float, int, int, int
	#func global DrawRotaGraphFastToZBuffer_2 "dx_DrawRotaGraphFastToZBuffer" int, int, float, float, int, int, int, int
	#func global DrawRotaGraphFast2ToZBuffer "dx_DrawRotaGraphFast2ToZBuffer" int, int, int, int, float, float, int, int
	#func global DrawRotaGraphFast2ToZBuffer_1 "dx_DrawRotaGraphFast2ToZBuffer" int, int, int, int, float, float, int, int, int
	#func global DrawRotaGraphFast2ToZBuffer_2 "dx_DrawRotaGraphFast2ToZBuffer" int, int, int, int, float, float, int, int, int, int
	#func global DrawRotaGraphFast3ToZBuffer "dx_DrawRotaGraphFast3ToZBuffer" int, int, int, int, float, float, float, int, int
	#func global DrawRotaGraphFast3ToZBuffer_1 "dx_DrawRotaGraphFast3ToZBuffer" int, int, int, int, float, float, float, int, int, int
	#func global DrawRotaGraphFast3ToZBuffer_2 "dx_DrawRotaGraphFast3ToZBuffer" int, int, int, int, float, float, float, int, int, int, int
	#func global DrawModiGraphToZBuffer "dx_DrawModiGraphToZBuffer" int, int, int, int, int, int, int, int, int, int
	#func global DrawBoxToZBuffer "dx_DrawBoxToZBuffer" int, int, int, int, int, int
	#func global DrawCircleToZBuffer "dx_DrawCircleToZBuffer" int, int, int, int, int
	#func global DrawTriangleToZBuffer "dx_DrawTriangleToZBuffer" int, int, int, int, int, int, int, int
	#func global DrawQuadrangleToZBuffer "dx_DrawQuadrangleToZBuffer" int, int, int, int, int, int, int, int, int, int
	#func global DrawRoundRectToZBuffer "dx_DrawRoundRectToZBuffer" int, int, int, int, int, int, int, int
	#func global DrawPolygon "dx_DrawPolygon" int, var, int, int, int
	#func global DrawPolygon_1 "dx_DrawPolygon" int, var, int, int, int, int
	#func global DrawPolygon2D "dx_DrawPolygon2D" int, var, int, int, int
	#func global DrawPolygon3D "dx_DrawPolygon3D" int, var, int, int, int
	#func global DrawPolygonIndexed2D "dx_DrawPolygonIndexed2D" int, var, int, int, var, int, int, int
	#func global DrawPolygon32bitIndexed2D "dx_DrawPolygon32bitIndexed2D" int, var, int, int, var, int, int, int
	#func global DrawPolygonIndexed3D "dx_DrawPolygonIndexed3D" int, var, int, int, var, int, int, int
	#func global DrawPolygon32bitIndexed3D "dx_DrawPolygon32bitIndexed3D" int, var, int, int, var, int, int, int
	#func global DrawPolygonIndexed3DBase "dx_DrawPolygonIndexed3DBase" int, var, int, int, var, int, int, int, int
	#func global DrawPolygon32bitIndexed3DBase "dx_DrawPolygon32bitIndexed3DBase" int, var, int, int, var, int, int, int, int
	#func global DrawPolygon3DBase "dx_DrawPolygon3DBase" int, var, int, int, int, int
	#func global DrawPolygon3D_1 "dx_DrawPolygon3D" int, var, int, int, int
	#func global DrawPolygon3D2 "dx_DrawPolygon3D2" int, var, int, int, int
	#func global DrawPolygonBase "dx_DrawPolygonBase" int, var, int, int, int, int
	#func global DrawPolygonBase_1 "dx_DrawPolygonBase" int, var, int, int, int, int, int
	#func global DrawPrimitive2D "dx_DrawPrimitive2D" int, var, int, int, int, int
	#func global DrawPrimitive3D "dx_DrawPrimitive3D" int, var, int, int, int, int
	#func global DrawPrimitiveIndexed2D "dx_DrawPrimitiveIndexed2D" int, var, int, int, var, int, int, int, int
	#func global DrawPrimitive32bitIndexed2D "dx_DrawPrimitive32bitIndexed2D" int, var, int, int, var, int, int, int, int
	#func global DrawPrimitiveIndexed3D "dx_DrawPrimitiveIndexed3D" int, var, int, int, var, int, int, int, int
	#func global DrawPrimitive32bitIndexed3D "dx_DrawPrimitive32bitIndexed3D" int, var, int, int, var, int, int, int, int
	#func global DrawPolygon3D_UseVertexBuffer "dx_DrawPolygon3D_UseVertexBuffer" int, int, int
	#func global DrawPrimitive3D_UseVertexBuffer "dx_DrawPrimitive3D_UseVertexBuffer" int, int, int, int
	#func global DrawPrimitive3D_UseVertexBuffer2 "dx_DrawPrimitive3D_UseVertexBuffer2" int, int, int, int, int, int
	#func global DrawPolygonIndexed3D_UseVertexBuffer "dx_DrawPolygonIndexed3D_UseVertexBuffer" int, int, int, int
	#func global DrawPrimitiveIndexed3D_UseVertexBuffer "dx_DrawPrimitiveIndexed3D_UseVertexBuffer" int, int, int, int, int
	#func global DrawPrimitiveIndexed3D_UseVertexBuffer2 "dx_DrawPrimitiveIndexed3D_UseVertexBuffer2" int, int, int, int, int, int, int, int, int, int
	#func global DrawGraph3D "dx_DrawGraph3D" float, float, float, int, int
	#func global DrawExtendGraph3D "dx_DrawExtendGraph3D" float, float, float, double, double, int, int
	#func global DrawRotaGraph3D "dx_DrawRotaGraph3D" float, float, float, double, double, int, int
	#func global DrawRotaGraph3D_1 "dx_DrawRotaGraph3D" float, float, float, double, double, int, int, int
	#func global DrawRotaGraph3D_2 "dx_DrawRotaGraph3D" float, float, float, double, double, int, int, int, int
	#func global DrawRota2Graph3D "dx_DrawRota2Graph3D" float, float, float, float, float, double, double, double, int, int
	#func global DrawRota2Graph3D_1 "dx_DrawRota2Graph3D" float, float, float, float, float, double, double, double, int, int, int
	#func global DrawRota2Graph3D_2 "dx_DrawRota2Graph3D" float, float, float, float, float, double, double, double, int, int, int, int
	#func global DrawModiBillboard3D "dx_DrawModiBillboard3D" var, float, float, float, float, float, float, float, float, int, int
	#func global DrawBillboard3D "dx_DrawBillboard3D" var, float, float, float, float, int, int
	#func global DrawBillboard3D_1 "dx_DrawBillboard3D" var, float, float, float, float, int, int, int
	#func global DrawBillboard3D_2 "dx_DrawBillboard3D" var, float, float, float, float, int, int, int, int
	#func global SetDrawMode "dx_SetDrawMode" int
	#func global SetDrawBlendMode "dx_SetDrawBlendMode" int, int
	#func global SetDrawCustomBlendMode "dx_SetDrawCustomBlendMode" int, int, int, int, int, int, int, int
	#func global SetDrawAlphaTest "dx_SetDrawAlphaTest" int, int
	#func global SetDrawBright "dx_SetDrawBright" int, int, int
	#func global SetDrawAddColor "dx_SetDrawAddColor" int, int, int
	#func global SetDrawZ "dx_SetDrawZ" float
	#func global SetDrawArea "dx_SetDrawArea" int, int, int, int
	#func global SetDrawAreaFull "dx_SetDrawAreaFull"
	#func global SetDraw3DScale "dx_SetDraw3DScale" float
	#cfunc global GetPixel "dx_GetPixel" int, int
	#func global SetBackgroundColor "dx_SetBackgroundColor" int, int, int
	#func global SetBackgroundColor_1 "dx_SetBackgroundColor" int, int, int, int
	#cfunc global GetDrawScreenGraph "dx_GetDrawScreenGraph" int, int, int, int, int
	#cfunc global GetDrawScreenGraph_1 "dx_GetDrawScreenGraph" int, int, int, int, int, int
	#cfunc global ClsDrawScreen "dx_ClsDrawScreen"
	#func global SetDrawScreen "dx_SetDrawScreen" int
	#cfunc global GetDrawScreen "dx_GetDrawScreen"
	#func global SetUseSetDrawScreenSettingReset "dx_SetUseSetDrawScreenSettingReset" int
	#cfunc global GetUseSetDrawScreenSettingReset "dx_GetUseSetDrawScreenSettingReset"
	#func global SetDrawZBuffer "dx_SetDrawZBuffer" int
	#cfunc global GetDrawScreenSize "dx_GetDrawScreenSize" var, var
	#cfunc global GetMultiDrawScreenNum "dx_GetMultiDrawScreenNum"
	#func global SaveDrawScreen "dx_SaveDrawScreen" int, int, int, int, wstr
	#func global SaveDrawScreen_1 "dx_SaveDrawScreen" int, int, int, int, wstr, int
	#func global SaveDrawScreen_2 "dx_SaveDrawScreen" int, int, int, int, wstr, int, int
	#func global SaveDrawScreen_3 "dx_SaveDrawScreen" int, int, int, int, wstr, int, int, int
	#func global SaveDrawScreen_4 "dx_SaveDrawScreen" int, int, int, int, wstr, int, int, int, int
	#func global SaveDrawScreenToBMP "dx_SaveDrawScreenToBMP" int, int, int, int, wstr
	#func global SaveDrawScreenToDDS "dx_SaveDrawScreenToDDS" int, int, int, int, wstr
	#func global SaveDrawScreenToJPEG "dx_SaveDrawScreenToJPEG" int, int, int, int, wstr
	#func global SaveDrawScreenToJPEG_1 "dx_SaveDrawScreenToJPEG" int, int, int, int, wstr, int
	#func global SaveDrawScreenToJPEG_2 "dx_SaveDrawScreenToJPEG" int, int, int, int, wstr, int, int
	#func global SaveDrawScreenToPNG "dx_SaveDrawScreenToPNG" int, int, int, int, wstr
	#func global SaveDrawScreenToPNG_1 "dx_SaveDrawScreenToPNG" int, int, int, int, wstr, int
	#func global DrawBillboard3DToShader "dx_DrawBillboard3DToShader" var, float, float, float, float, int, int
	#func global DrawBillboard3DToShader_1 "dx_DrawBillboard3DToShader" var, float, float, float, float, int, int, int
	#func global DrawBillboard3DToShader_2 "dx_DrawBillboard3DToShader" var, float, float, float, float, int, int, int, int
	#func global DrawPolygon2DToShader "dx_DrawPolygon2DToShader" int, var, int
	#func global DrawPolygon3DToShader "dx_DrawPolygon3DToShader" int, var, int
	#func global DrawPolygonIndexed2DToShader "dx_DrawPolygonIndexed2DToShader" int, var, int, int, var, int
	#func global DrawPolygon32bitIndexed2DToShader "dx_DrawPolygon32bitIndexed2DToShader" int, var, int, int, var, int
	#func global DrawPolygonIndexed3DToShader "dx_DrawPolygonIndexed3DToShader" int, var, int, int, var, int
	#func global DrawPolygon32bitIndexed3DToShader "dx_DrawPolygon32bitIndexed3DToShader" int, var, int, int, var, int
	#func global DrawPrimitive2DToShader "dx_DrawPrimitive2DToShader" int, var, int, int
	#func global DrawPrimitive3DToShader "dx_DrawPrimitive3DToShader" int, var, int, int
	#func global DrawPrimitiveIndexed2DToShader "dx_DrawPrimitiveIndexed2DToShader" int, var, int, int, var, int, int
	#func global DrawPrimitive32bitIndexed2DToShader "dx_DrawPrimitive32bitIndexed2DToShader" int, var, int, int, var, int, int
	#func global DrawPrimitiveIndexed3DToShader "dx_DrawPrimitiveIndexed3DToShader" int, var, int, int, var, int, int
	#func global DrawPrimitive32bitIndexed3DToShader "dx_DrawPrimitive32bitIndexed3DToShader" int, var, int, int, var, int, int
	#func global DrawPolygon3DToShader_UseVertexBuffer "dx_DrawPolygon3DToShader_UseVertexBuffer" int
	#func global DrawPolygonIndexed3DToShader_UseVertexBuffer "dx_DrawPolygonIndexed3DToShader_UseVertexBuffer" int, int
	#func global DrawPrimitive3DToShader_UseVertexBuffer "dx_DrawPrimitive3DToShader_UseVertexBuffer" int, int
	#func global DrawPrimitive3DToShader_UseVertexBuffer2 "dx_DrawPrimitive3DToShader_UseVertexBuffer2" int, int, int, int
	#func global DrawPrimitiveIndexed3DToShader_UseVertexBuffer "dx_DrawPrimitiveIndexed3DToShader_UseVertexBuffer" int, int, int
	#func global DrawPrimitiveIndexed3DToShader_UseVertexBuffer2 "dx_DrawPrimitiveIndexed3DToShader_UseVertexBuffer2" int, int, int, int, int, int, int, int
	#func global DrawMaskToDirectData "dx_DrawMaskToDirectData" int, int, int, int, int, int
	#func global DrawFillMaskToDirectData "dx_DrawFillMaskToDirectData" int, int, int, int, int, int, int
	#func global DrawMask "dx_DrawMask" int, int, int, int
	#func global DrawFillMask "dx_DrawFillMask" int, int, int, int, int
	#cfunc global GetDrawScreenSoftImage "dx_GetDrawScreenSoftImage" int, int, int, int, int
	#cfunc global GetDrawScreenSoftImageDestPos "dx_GetDrawScreenSoftImageDestPos" int, int, int, int, int, int, int
	#func global DrawPixelPalCodeSoftImage "dx_DrawPixelPalCodeSoftImage" int, int, int, int
	#func global DrawPixelSoftImage "dx_DrawPixelSoftImage" int, int, int, int, int, int, int
	#func global DrawPixelSoftImageF "dx_DrawPixelSoftImageF" int, int, int, float, float, float, float
	#func global DrawPixelSoftImage_Unsafe_XRGB8 "dx_DrawPixelSoftImage_Unsafe_XRGB8" int, int, int, int, int, int
	#func global DrawPixelSoftImage_Unsafe_ARGB8 "dx_DrawPixelSoftImage_Unsafe_ARGB8" int, int, int, int, int, int, int
	#func global DrawLineSoftImage "dx_DrawLineSoftImage" int, int, int, int, int, int, int, int, int
	#func global DrawCircleSoftImage "dx_DrawCircleSoftImage" int, int, int, int, int, int, int, int
	#func global DrawCircleSoftImage_1 "dx_DrawCircleSoftImage" int, int, int, int, int, int, int, int, int
	#func global DrawSoftImage "dx_DrawSoftImage" int, int, int
	#func global SetDrawScreen_ID3D11RenderTargetView "dx_SetDrawScreen_ID3D11RenderTargetView" int
	#func global SetDrawScreen_ID3D11RenderTargetView_1 "dx_SetDrawScreen_ID3D11RenderTargetView" int, int

	; === 画像管理 ===
	#func global SetRestoreGraphCallback "dx_SetRestoreGraphCallback" int
	#cfunc global MakeGraph "dx_MakeGraph" int, int
	#cfunc global MakeGraph_1 "dx_MakeGraph" int, int, int
	#cfunc global DerivationGraph "dx_DerivationGraph" int, int, int, int, int
	#cfunc global DerivationGraphF "dx_DerivationGraphF" float, float, float, float, int
	#func global DeleteGraph "dx_DeleteGraph" int
	#cfunc global GetGraphNum "dx_GetGraphNum"
	#func global SetGraphLostFlag "dx_SetGraphLostFlag" int, var
	#func global InitGraph "dx_InitGraph"
	#cfunc global LoadGraph "dx_LoadGraph" wstr
	#cfunc global LoadGraph_1 "dx_LoadGraph" wstr, int
	#cfunc global LoadBlendGraph "dx_LoadBlendGraph" wstr
	#cfunc global CreateGraphFromMem "dx_CreateGraphFromMem" int, int
	#cfunc global CreateGraphFromMem_1 "dx_CreateGraphFromMem" int, int, int
	#cfunc global CreateGraphFromMem_2 "dx_CreateGraphFromMem" int, int, int, int
	#cfunc global CreateGraphFromMem_3 "dx_CreateGraphFromMem" int, int, int, int, int
	#cfunc global CreateGraphFromMem_4 "dx_CreateGraphFromMem" int, int, int, int, int, int
	#cfunc global ReCreateGraphFromMem "dx_ReCreateGraphFromMem" int, int, int
	#cfunc global ReCreateGraphFromMem_1 "dx_ReCreateGraphFromMem" int, int, int, int
	#cfunc global ReCreateGraphFromMem_2 "dx_ReCreateGraphFromMem" int, int, int, int, int
	#cfunc global ReCreateGraphFromMem_3 "dx_ReCreateGraphFromMem" int, int, int, int, int, int
	#cfunc global ReCreateGraphFromMem_4 "dx_ReCreateGraphFromMem" int, int, int, int, int, int, int
	#cfunc global CreateGraph "dx_CreateGraph" int, int, int, int
	#cfunc global CreateGraph_1 "dx_CreateGraph" int, int, int, int, int
	#cfunc global CreateGraph_2 "dx_CreateGraph" int, int, int, int, int, int
	#cfunc global ReCreateGraph "dx_ReCreateGraph" int, int, int, int, int
	#cfunc global ReCreateGraph_1 "dx_ReCreateGraph" int, int, int, int, int, int
	#cfunc global CreateBlendGraphFromSoftImage "dx_CreateBlendGraphFromSoftImage" int
	#cfunc global CreateGraphFromSoftImage "dx_CreateGraphFromSoftImage" int
	#cfunc global CreateGraphFromRectSoftImage "dx_CreateGraphFromRectSoftImage" int, int, int, int, int
	#cfunc global ReCreateGraphFromSoftImage "dx_ReCreateGraphFromSoftImage" int, int
	#cfunc global ReCreateGraphFromRectSoftImage "dx_ReCreateGraphFromRectSoftImage" int, int, int, int, int, int
	#cfunc global ReloadGraph "dx_ReloadGraph" wstr, int
	#cfunc global ReloadGraph_1 "dx_ReloadGraph" wstr, int, int
	#func global SetCreateGraphChannelBitDepth "dx_SetCreateGraphChannelBitDepth" int
	#cfunc global GetCreateGraphChannelBitDepth "dx_GetCreateGraphChannelBitDepth"
	#func global SetCreateGraphInitGraphDelete "dx_SetCreateGraphInitGraphDelete" int
	#cfunc global GetCreateGraphInitGraphDelete "dx_GetCreateGraphInitGraphDelete"
	#cfunc global SetCreateGraphHandle "dx_SetCreateGraphHandle" int
	#cfunc global GetCreateGraphHandle "dx_GetCreateGraphHandle"
	#func global SetLeftUpColorIsTransColorFlag "dx_SetLeftUpColorIsTransColorFlag" int
	#func global SetUseBlendGraphCreateFlag "dx_SetUseBlendGraphCreateFlag" int
	#cfunc global GetUseBlendGraphCreateFlag "dx_GetUseBlendGraphCreateFlag"
	#func global SetUseTransColor "dx_SetUseTransColor" int
	#func global SetUseTransColorGraphCreateFlag "dx_SetUseTransColorGraphCreateFlag" int
	#func global SetTransColor "dx_SetTransColor" int, int, int
	#cfunc global GetTransColor "dx_GetTransColor" var, var, var
	#func global SetDeviceLostDeleteGraphFlag "dx_SetDeviceLostDeleteGraphFlag" int, int
	#cfunc global GetGraphSize "dx_GetGraphSize" int, var, var
	#cfunc global GetGraphSizeF "dx_GetGraphSizeF" int, var, var
	#cfunc global GetGraphTextureSize "dx_GetGraphTextureSize" int, var, var
	#cfunc global GetGraphUseBaseGraphArea "dx_GetGraphUseBaseGraphArea" int, var, var, var, var
	#cfunc global GetGraphMipmapCount "dx_GetGraphMipmapCount" int
	#cfunc global GetGraphFilePath "dx_GetGraphFilePath" int, int
	#cfunc global GetCreateGraphColorData "dx_GetCreateGraphColorData" var, var
	#cfunc global GetGraphPalette "dx_GetGraphPalette" int, int, var, var, var
	#cfunc global GetGraphOriginalPalette "dx_GetGraphOriginalPalette" int, int, var, var, var
	#func global SetGraphPalette "dx_SetGraphPalette" int, int, int
	#func global SetBlendGraph "dx_SetBlendGraph" int, int, int
	#func global SetBlendGraphPosition "dx_SetBlendGraphPosition" int, int
	#func global SetBlendGraphPositionMode "dx_SetBlendGraphPositionMode" int
	#func global SetGraphDisplayArea "dx_SetGraphDisplayArea" int, int, int, int
	#func global SaveDrawValidGraph "dx_SaveDrawValidGraph" int, int, int, int, int, wstr
	#func global SaveDrawValidGraph_1 "dx_SaveDrawValidGraph" int, int, int, int, int, wstr, int
	#func global SaveDrawValidGraph_2 "dx_SaveDrawValidGraph" int, int, int, int, int, wstr, int, int
	#func global SaveDrawValidGraph_3 "dx_SaveDrawValidGraph" int, int, int, int, int, wstr, int, int, int
	#func global SaveDrawValidGraph_4 "dx_SaveDrawValidGraph" int, int, int, int, int, wstr, int, int, int, int
	#func global SaveDrawValidGraphToBMP "dx_SaveDrawValidGraphToBMP" int, int, int, int, int, wstr
	#func global SaveDrawValidGraphToDDS "dx_SaveDrawValidGraphToDDS" int, int, int, int, int, wstr
	#func global SaveDrawValidGraphToJPEG "dx_SaveDrawValidGraphToJPEG" int, int, int, int, int, wstr
	#func global SaveDrawValidGraphToJPEG_1 "dx_SaveDrawValidGraphToJPEG" int, int, int, int, int, wstr, int
	#func global SaveDrawValidGraphToJPEG_2 "dx_SaveDrawValidGraphToJPEG" int, int, int, int, int, wstr, int, int
	#func global SaveDrawValidGraphToPNG "dx_SaveDrawValidGraphToPNG" int, int, int, int, int, wstr
	#func global SaveDrawValidGraphToPNG_1 "dx_SaveDrawValidGraphToPNG" int, int, int, int, int, wstr, int
	#func global SetGraphFilterBltBlendMode "dx_SetGraphFilterBltBlendMode" int
	#func global SetGraphBlendScalingFilterMode "dx_SetGraphBlendScalingFilterMode" int
	#func global SetGraphDataShavedMode "dx_SetGraphDataShavedMode" int
	#cfunc global GetGraphDataShavedMode "dx_GetGraphDataShavedMode"
	#func global BltSoftImageWithTransColor "dx_BltSoftImageWithTransColor" int, int, int, int, int, int, int, int, int, int, int, int
	#func global SetUseBackBufferTransColorFlag "dx_SetUseBackBufferTransColorFlag" int
	#cfunc global LoadGraphToResource2 "dx_LoadGraphToResource2" wstr, wstr
	#cfunc global CreateGraphFromID3D11Texture2D "dx_CreateGraphFromID3D11Texture2D" int
	#cfunc global GetGraphID3D11Texture2D "dx_GetGraphID3D11Texture2D" int
	#cfunc global GetGraphID3D11RenderTargetView "dx_GetGraphID3D11RenderTargetView" int
	#cfunc global GetGraphID3D11DepthStencilView "dx_GetGraphID3D11DepthStencilView" int

	; === 文字描画 ===
	#func global DrawIMEInputString "dx_DrawIMEInputString" int, int, int
	#func global DrawIMEInputString_1 "dx_DrawIMEInputString" int, int, int, int
	#func global DrawIMEInputExtendString "dx_DrawIMEInputExtendString" int, int, double, double, int
	#func global DrawIMEInputExtendString_1 "dx_DrawIMEInputExtendString" int, int, double, double, int, int
	#func global DrawObtainsString "dx_DrawObtainsString" int, int, int, wstr, int, int, int, int, int, int, int, int, var
	#func global DrawObtainsNString "dx_DrawObtainsNString" int, int, int, wstr, int, int, int, int, int, int, int, int, int, var
	#func global DrawObtainsString_CharClip "dx_DrawObtainsString_CharClip" int, int, int, wstr, int, int, int, int, int, int, int, int, var
	#func global DrawObtainsNString_CharClip "dx_DrawObtainsNString_CharClip" int, int, int, wstr, int, int, int, int, int, int, int, int, int, var
	#func global DrawObtainsString_WordClip "dx_DrawObtainsString_WordClip" int, int, int, wstr, int, int, int, int, int, int, int, int, var
	#func global DrawObtainsNString_WordClip "dx_DrawObtainsNString_WordClip" int, int, int, wstr, int, int, int, int, int, int, int, int, int, var
	#func global DrawKeyInputModeString "dx_DrawKeyInputModeString" int, int
	#func global DrawKeyInputString "dx_DrawKeyInputString" int, int, int
	#func global DrawKeyInputString_1 "dx_DrawKeyInputString" int, int, int, int
	#func global DrawKeyInputExtendString "dx_DrawKeyInputExtendString" int, int, double, double, int
	#func global DrawKeyInputExtendString_1 "dx_DrawKeyInputExtendString" int, int, double, double, int, int
	#func global DrawStringMask "dx_DrawStringMask" int, int, int, wstr
	#func global DrawNStringMask "dx_DrawNStringMask" int, int, int, wstr, int
	#func global DrawStringMaskToHandle "dx_DrawStringMaskToHandle" int, int, int, int, wstr
	#func global DrawNStringMaskToHandle "dx_DrawNStringMaskToHandle" int, int, int, int, wstr, int
	#func global DrawString "dx_DrawString" int, int, wstr, int
	#func global DrawString_1 "dx_DrawString" int, int, wstr, int, int
	#func global DrawNString "dx_DrawNString" int, int, wstr, int, int
	#func global DrawNString_1 "dx_DrawNString" int, int, wstr, int, int, int
	#func global DrawVString "dx_DrawVString" int, int, wstr, int
	#func global DrawVString_1 "dx_DrawVString" int, int, wstr, int, int
	#func global DrawNVString "dx_DrawNVString" int, int, wstr, int, int
	#func global DrawNVString_1 "dx_DrawNVString" int, int, wstr, int, int, int
	#func global DrawExtendString "dx_DrawExtendString" int, int, double, double, wstr, int
	#func global DrawExtendString_1 "dx_DrawExtendString" int, int, double, double, wstr, int, int
	#func global DrawExtendNString "dx_DrawExtendNString" int, int, double, double, wstr, int, int
	#func global DrawExtendNString_1 "dx_DrawExtendNString" int, int, double, double, wstr, int, int, int
	#func global DrawExtendVString "dx_DrawExtendVString" int, int, double, double, wstr, int
	#func global DrawExtendVString_1 "dx_DrawExtendVString" int, int, double, double, wstr, int, int
	#func global DrawExtendNVString "dx_DrawExtendNVString" int, int, double, double, wstr, int, int
	#func global DrawExtendNVString_1 "dx_DrawExtendNVString" int, int, double, double, wstr, int, int, int
	#func global DrawRotaString "dx_DrawRotaString" int, int, double, double, double, double, double, int
	#func global DrawRotaString_1 "dx_DrawRotaString" int, int, double, double, double, double, double, int, int
	#func global DrawRotaString_2 "dx_DrawRotaString" int, int, double, double, double, double, double, int, int, int
	#func global DrawRotaString_3 "dx_DrawRotaString" int, int, double, double, double, double, double, int, int, int, wstr
	#func global DrawRotaNString "dx_DrawRotaNString" int, int, double, double, double, double, double, int
	#func global DrawRotaNString_1 "dx_DrawRotaNString" int, int, double, double, double, double, double, int, int
	#func global DrawRotaNString_2 "dx_DrawRotaNString" int, int, double, double, double, double, double, int, int, int
	#func global DrawRotaNString_3 "dx_DrawRotaNString" int, int, double, double, double, double, double, int, int, int, wstr
	#func global DrawRotaNString_4 "dx_DrawRotaNString" int, int, double, double, double, double, double, int, int, int, wstr, int
	#func global DrawModiString "dx_DrawModiString" int, int, int, int, int, int, int, int, int
	#func global DrawModiString_1 "dx_DrawModiString" int, int, int, int, int, int, int, int, int, int
	#func global DrawModiString_2 "dx_DrawModiString" int, int, int, int, int, int, int, int, int, int, int
	#func global DrawModiString_3 "dx_DrawModiString" int, int, int, int, int, int, int, int, int, int, int, wstr
	#func global DrawModiNString "dx_DrawModiNString" int, int, int, int, int, int, int, int, int
	#func global DrawModiNString_1 "dx_DrawModiNString" int, int, int, int, int, int, int, int, int, int
	#func global DrawModiNString_2 "dx_DrawModiNString" int, int, int, int, int, int, int, int, int, int, int
	#func global DrawModiNString_3 "dx_DrawModiNString" int, int, int, int, int, int, int, int, int, int, int, wstr
	#func global DrawModiNString_4 "dx_DrawModiNString" int, int, int, int, int, int, int, int, int, int, int, wstr, int
	#func global DrawStringF "dx_DrawStringF" float, float, wstr, int
	#func global DrawStringF_1 "dx_DrawStringF" float, float, wstr, int, int
	#func global DrawNStringF "dx_DrawNStringF" float, float, wstr, int, int
	#func global DrawNStringF_1 "dx_DrawNStringF" float, float, wstr, int, int, int
	#func global DrawVStringF "dx_DrawVStringF" float, float, wstr, int
	#func global DrawVStringF_1 "dx_DrawVStringF" float, float, wstr, int, int
	#func global DrawNVStringF "dx_DrawNVStringF" float, float, wstr, int, int
	#func global DrawNVStringF_1 "dx_DrawNVStringF" float, float, wstr, int, int, int
	#func global DrawExtendStringF "dx_DrawExtendStringF" float, float, double, double, wstr, int
	#func global DrawExtendStringF_1 "dx_DrawExtendStringF" float, float, double, double, wstr, int, int
	#func global DrawExtendNStringF "dx_DrawExtendNStringF" float, float, double, double, wstr, int, int
	#func global DrawExtendNStringF_1 "dx_DrawExtendNStringF" float, float, double, double, wstr, int, int, int
	#func global DrawExtendVStringF "dx_DrawExtendVStringF" float, float, double, double, wstr, int
	#func global DrawExtendVStringF_1 "dx_DrawExtendVStringF" float, float, double, double, wstr, int, int
	#func global DrawExtendNVStringF "dx_DrawExtendNVStringF" float, float, double, double, wstr, int, int
	#func global DrawExtendNVStringF_1 "dx_DrawExtendNVStringF" float, float, double, double, wstr, int, int, int
	#func global DrawRotaStringF "dx_DrawRotaStringF" float, float, double, double, double, double, double, int
	#func global DrawRotaStringF_1 "dx_DrawRotaStringF" float, float, double, double, double, double, double, int, int
	#func global DrawRotaStringF_2 "dx_DrawRotaStringF" float, float, double, double, double, double, double, int, int, int
	#func global DrawRotaStringF_3 "dx_DrawRotaStringF" float, float, double, double, double, double, double, int, int, int, wstr
	#func global DrawRotaNStringF "dx_DrawRotaNStringF" float, float, double, double, double, double, double, int
	#func global DrawRotaNStringF_1 "dx_DrawRotaNStringF" float, float, double, double, double, double, double, int, int
	#func global DrawRotaNStringF_2 "dx_DrawRotaNStringF" float, float, double, double, double, double, double, int, int, int
	#func global DrawRotaNStringF_3 "dx_DrawRotaNStringF" float, float, double, double, double, double, double, int, int, int, wstr
	#func global DrawRotaNStringF_4 "dx_DrawRotaNStringF" float, float, double, double, double, double, double, int, int, int, wstr, int
	#func global DrawModiStringF "dx_DrawModiStringF" float, float, float, float, float, float, float, float, int
	#func global DrawModiStringF_1 "dx_DrawModiStringF" float, float, float, float, float, float, float, float, int, int
	#func global DrawModiStringF_2 "dx_DrawModiStringF" float, float, float, float, float, float, float, float, int, int, int
	#func global DrawModiStringF_3 "dx_DrawModiStringF" float, float, float, float, float, float, float, float, int, int, int, wstr
	#func global DrawModiNStringF "dx_DrawModiNStringF" float, float, float, float, float, float, float, float, int
	#func global DrawModiNStringF_1 "dx_DrawModiNStringF" float, float, float, float, float, float, float, float, int, int
	#func global DrawModiNStringF_2 "dx_DrawModiNStringF" float, float, float, float, float, float, float, float, int, int, int
	#func global DrawModiNStringF_3 "dx_DrawModiNStringF" float, float, float, float, float, float, float, float, int, int, int, wstr
	#func global DrawModiNStringF_4 "dx_DrawModiNStringF" float, float, float, float, float, float, float, float, int, int, int, wstr, int
	#func global DrawNumberToI "dx_DrawNumberToI" int, int, int, int, int
	#func global DrawNumberToI_1 "dx_DrawNumberToI" int, int, int, int, int, int
	#func global DrawNumberToF "dx_DrawNumberToF" int, int, double, int, int
	#func global DrawNumberToF_1 "dx_DrawNumberToF" int, int, double, int, int, int
	#func global DrawNumberPlusToI "dx_DrawNumberPlusToI" int, int, wstr, int, int, int
	#func global DrawNumberPlusToI_1 "dx_DrawNumberPlusToI" int, int, wstr, int, int, int, int
	#func global DrawNumberPlusToF "dx_DrawNumberPlusToF" int, int, wstr, double, int, int
	#func global DrawNumberPlusToF_1 "dx_DrawNumberPlusToF" int, int, wstr, double, int, int, int
	#func global DrawStringToZBuffer "dx_DrawStringToZBuffer" int, int, wstr, int
	#func global DrawNStringToZBuffer "dx_DrawNStringToZBuffer" int, int, wstr, int, int
	#func global DrawVStringToZBuffer "dx_DrawVStringToZBuffer" int, int, wstr, int
	#func global DrawNVStringToZBuffer "dx_DrawNVStringToZBuffer" int, int, wstr, int, int
	#func global DrawExtendStringToZBuffer "dx_DrawExtendStringToZBuffer" int, int, double, double, wstr, int
	#func global DrawExtendNStringToZBuffer "dx_DrawExtendNStringToZBuffer" int, int, double, double, wstr, int, int
	#func global DrawExtendVStringToZBuffer "dx_DrawExtendVStringToZBuffer" int, int, double, double, wstr, int
	#func global DrawExtendNVStringToZBuffer "dx_DrawExtendNVStringToZBuffer" int, int, double, double, wstr, int, int
	#func global DrawRotaStringToZBuffer "dx_DrawRotaStringToZBuffer" int, int, double, double, double, double, double, int, int, wstr
	#func global DrawRotaNStringToZBuffer "dx_DrawRotaNStringToZBuffer" int, int, double, double, double, double, double, int, int, wstr, int
	#func global DrawModiStringToZBuffer "dx_DrawModiStringToZBuffer" int, int, int, int, int, int, int, int, int, int, wstr
	#func global DrawModiNStringToZBuffer "dx_DrawModiNStringToZBuffer" int, int, int, int, int, int, int, int, int, int, wstr, int
	#func global DrawStringToHandle "dx_DrawStringToHandle" int, int, wstr, int, int
	#func global DrawStringToHandle_1 "dx_DrawStringToHandle" int, int, wstr, int, int, int
	#func global DrawStringToHandle_2 "dx_DrawStringToHandle" int, int, wstr, int, int, int, int
	#func global DrawNStringToHandle "dx_DrawNStringToHandle" int, int, wstr, int, int, int
	#func global DrawNStringToHandle_1 "dx_DrawNStringToHandle" int, int, wstr, int, int, int, int
	#func global DrawNStringToHandle_2 "dx_DrawNStringToHandle" int, int, wstr, int, int, int, int, int
	#func global DrawVStringToHandle "dx_DrawVStringToHandle" int, int, wstr, int, int
	#func global DrawVStringToHandle_1 "dx_DrawVStringToHandle" int, int, wstr, int, int, int
	#func global DrawNVStringToHandle "dx_DrawNVStringToHandle" int, int, wstr, int, int, int
	#func global DrawNVStringToHandle_1 "dx_DrawNVStringToHandle" int, int, wstr, int, int, int, int
	#func global DrawExtendStringToHandle "dx_DrawExtendStringToHandle" int, int, double, double, wstr, int, int
	#func global DrawExtendStringToHandle_1 "dx_DrawExtendStringToHandle" int, int, double, double, wstr, int, int, int
	#func global DrawExtendStringToHandle_2 "dx_DrawExtendStringToHandle" int, int, double, double, wstr, int, int, int, int
	#func global DrawExtendNStringToHandle "dx_DrawExtendNStringToHandle" int, int, double, double, wstr, int, int, int
	#func global DrawExtendNStringToHandle_1 "dx_DrawExtendNStringToHandle" int, int, double, double, wstr, int, int, int, int
	#func global DrawExtendNStringToHandle_2 "dx_DrawExtendNStringToHandle" int, int, double, double, wstr, int, int, int, int, int
	#func global DrawExtendVStringToHandle "dx_DrawExtendVStringToHandle" int, int, double, double, wstr, int, int
	#func global DrawExtendVStringToHandle_1 "dx_DrawExtendVStringToHandle" int, int, double, double, wstr, int, int, int
	#func global DrawExtendNVStringToHandle "dx_DrawExtendNVStringToHandle" int, int, double, double, wstr, int, int, int
	#func global DrawExtendNVStringToHandle_1 "dx_DrawExtendNVStringToHandle" int, int, double, double, wstr, int, int, int, int
	#func global DrawRotaStringToHandle "dx_DrawRotaStringToHandle" int, int, double, double, double, double, double, int, int, int, int, wstr
	#func global DrawRotaNStringToHandle "dx_DrawRotaNStringToHandle" int, int, double, double, double, double, double, int, int, int, int, wstr, int
	#func global DrawModiStringToHandle "dx_DrawModiStringToHandle" int, int, int, int, int, int, int, int, int, int, int, int, wstr
	#func global DrawModiNStringToHandle "dx_DrawModiNStringToHandle" int, int, int, int, int, int, int, int, int, int, int, int, wstr, int
	#func global DrawStringFToHandle "dx_DrawStringFToHandle" float, float, wstr, int, int
	#func global DrawStringFToHandle_1 "dx_DrawStringFToHandle" float, float, wstr, int, int, int
	#func global DrawStringFToHandle_2 "dx_DrawStringFToHandle" float, float, wstr, int, int, int, int
	#func global DrawNStringFToHandle "dx_DrawNStringFToHandle" float, float, wstr, int, int, int
	#func global DrawNStringFToHandle_1 "dx_DrawNStringFToHandle" float, float, wstr, int, int, int, int
	#func global DrawNStringFToHandle_2 "dx_DrawNStringFToHandle" float, float, wstr, int, int, int, int, int
	#func global DrawVStringFToHandle "dx_DrawVStringFToHandle" float, float, wstr, int, int
	#func global DrawVStringFToHandle_1 "dx_DrawVStringFToHandle" float, float, wstr, int, int, int
	#func global DrawNVStringFToHandle "dx_DrawNVStringFToHandle" float, float, wstr, int, int, int
	#func global DrawNVStringFToHandle_1 "dx_DrawNVStringFToHandle" float, float, wstr, int, int, int, int
	#func global DrawExtendStringFToHandle "dx_DrawExtendStringFToHandle" float, float, double, double, wstr, int, int
	#func global DrawExtendStringFToHandle_1 "dx_DrawExtendStringFToHandle" float, float, double, double, wstr, int, int, int
	#func global DrawExtendStringFToHandle_2 "dx_DrawExtendStringFToHandle" float, float, double, double, wstr, int, int, int, int
	#func global DrawExtendNStringFToHandle "dx_DrawExtendNStringFToHandle" float, float, double, double, wstr, int, int, int
	#func global DrawExtendNStringFToHandle_1 "dx_DrawExtendNStringFToHandle" float, float, double, double, wstr, int, int, int, int
	#func global DrawExtendNStringFToHandle_2 "dx_DrawExtendNStringFToHandle" float, float, double, double, wstr, int, int, int, int, int
	#func global DrawExtendVStringFToHandle "dx_DrawExtendVStringFToHandle" float, float, double, double, wstr, int, int
	#func global DrawExtendVStringFToHandle_1 "dx_DrawExtendVStringFToHandle" float, float, double, double, wstr, int, int, int
	#func global DrawExtendNVStringFToHandle "dx_DrawExtendNVStringFToHandle" float, float, double, double, wstr, int, int, int
	#func global DrawExtendNVStringFToHandle_1 "dx_DrawExtendNVStringFToHandle" float, float, double, double, wstr, int, int, int, int
	#func global DrawRotaStringFToHandle "dx_DrawRotaStringFToHandle" float, float, double, double, double, double, double, int, int
	#func global DrawRotaStringFToHandle_1 "dx_DrawRotaStringFToHandle" float, float, double, double, double, double, double, int, int, int
	#func global DrawRotaStringFToHandle_2 "dx_DrawRotaStringFToHandle" float, float, double, double, double, double, double, int, int, int, int
	#func global DrawRotaStringFToHandle_3 "dx_DrawRotaStringFToHandle" float, float, double, double, double, double, double, int, int, int, int, wstr
	#func global DrawRotaNStringFToHandle "dx_DrawRotaNStringFToHandle" float, float, double, double, double, double, double, int, int
	#func global DrawRotaNStringFToHandle_1 "dx_DrawRotaNStringFToHandle" float, float, double, double, double, double, double, int, int, int
	#func global DrawRotaNStringFToHandle_2 "dx_DrawRotaNStringFToHandle" float, float, double, double, double, double, double, int, int, int, int
	#func global DrawRotaNStringFToHandle_3 "dx_DrawRotaNStringFToHandle" float, float, double, double, double, double, double, int, int, int, int, wstr
	#func global DrawRotaNStringFToHandle_4 "dx_DrawRotaNStringFToHandle" float, float, double, double, double, double, double, int, int, int, int, wstr, int
	#func global DrawModiStringFToHandle "dx_DrawModiStringFToHandle" float, float, float, float, float, float, float, float, int, int, int, int, wstr
	#func global DrawModiNStringFToHandle "dx_DrawModiNStringFToHandle" float, float, float, float, float, float, float, float, int, int, int, int, wstr, int
	#func global DrawNumberToIToHandle "dx_DrawNumberToIToHandle" int, int, int, int, int, int
	#func global DrawNumberToIToHandle_1 "dx_DrawNumberToIToHandle" int, int, int, int, int, int, int
	#func global DrawNumberToFToHandle "dx_DrawNumberToFToHandle" int, int, double, int, int, int
	#func global DrawNumberToFToHandle_1 "dx_DrawNumberToFToHandle" int, int, double, int, int, int, int
	#func global DrawNumberPlusToIToHandle "dx_DrawNumberPlusToIToHandle" int, int, wstr, int, int, int, int
	#func global DrawNumberPlusToIToHandle_1 "dx_DrawNumberPlusToIToHandle" int, int, wstr, int, int, int, int, int
	#func global DrawNumberPlusToFToHandle "dx_DrawNumberPlusToFToHandle" int, int, wstr, double, int, int, int
	#func global DrawNumberPlusToFToHandle_1 "dx_DrawNumberPlusToFToHandle" int, int, wstr, double, int, int, int, int
	#func global DrawStringToHandleToZBuffer "dx_DrawStringToHandleToZBuffer" int, int, wstr, int, int
	#func global DrawStringToHandleToZBuffer_1 "dx_DrawStringToHandleToZBuffer" int, int, wstr, int, int, int
	#func global DrawNStringToHandleToZBuffer "dx_DrawNStringToHandleToZBuffer" int, int, wstr, int, int, int
	#func global DrawNStringToHandleToZBuffer_1 "dx_DrawNStringToHandleToZBuffer" int, int, wstr, int, int, int, int
	#func global DrawVStringToHandleToZBuffer "dx_DrawVStringToHandleToZBuffer" int, int, wstr, int, int
	#func global DrawNVStringToHandleToZBuffer "dx_DrawNVStringToHandleToZBuffer" int, int, wstr, int, int, int
	#func global DrawExtendStringToHandleToZBuffer "dx_DrawExtendStringToHandleToZBuffer" int, int, double, double, wstr, int, int
	#func global DrawExtendStringToHandleToZBuffer_1 "dx_DrawExtendStringToHandleToZBuffer" int, int, double, double, wstr, int, int, int
	#func global DrawExtendNStringToHandleToZBuffer "dx_DrawExtendNStringToHandleToZBuffer" int, int, double, double, wstr, int, int, int
	#func global DrawExtendNStringToHandleToZBuffer_1 "dx_DrawExtendNStringToHandleToZBuffer" int, int, double, double, wstr, int, int, int, int
	#func global DrawExtendVStringToHandleToZBuffer "dx_DrawExtendVStringToHandleToZBuffer" int, int, double, double, wstr, int, int
	#func global DrawExtendNVStringToHandleToZBuffer "dx_DrawExtendNVStringToHandleToZBuffer" int, int, double, double, wstr, int, int, int
	#func global DrawRotaStringToHandleToZBuffer "dx_DrawRotaStringToHandleToZBuffer" int, int, double, double, double, double, double, int, int, int, wstr
	#func global DrawRotaNStringToHandleToZBuffer "dx_DrawRotaNStringToHandleToZBuffer" int, int, double, double, double, double, double, int, int, int, wstr, int
	#func global DrawModiStringToHandleToZBuffer "dx_DrawModiStringToHandleToZBuffer" int, int, int, int, int, int, int, int, int, int, int, wstr
	#func global DrawModiNStringToHandleToZBuffer "dx_DrawModiNStringToHandleToZBuffer" int, int, int, int, int, int, int, int, int, int, int, wstr, int

	; === フォント ===
	#func global SetLogFontSize "dx_SetLogFontSize" int
	#func global SetLogFontHandle "dx_SetLogFontHandle" int
	#func global SetKeyInputStringFont "dx_SetKeyInputStringFont" int
	#cfunc global EnumFontName "dx_EnumFontName" int, int
	#cfunc global EnumFontName_1 "dx_EnumFontName" int, int, int
	#cfunc global EnumFontNameEx "dx_EnumFontNameEx" int, int
	#cfunc global EnumFontNameEx_1 "dx_EnumFontNameEx" int, int, int
	#cfunc global EnumFontNameEx2 "dx_EnumFontNameEx2" int, int, wstr
	#cfunc global EnumFontNameEx2_1 "dx_EnumFontNameEx2" int, int, wstr, int
	#cfunc global CheckFontName "dx_CheckFontName" wstr
	#cfunc global CheckFontName_1 "dx_CheckFontName" wstr, int
	#func global InitFontToHandle "dx_InitFontToHandle"
	#cfunc global CreateFontToHandle "dx_CreateFontToHandle" wstr, int, int
	#cfunc global CreateFontToHandle_1 "dx_CreateFontToHandle" wstr, int, int, int
	#cfunc global CreateFontToHandle_2 "dx_CreateFontToHandle" wstr, int, int, int, int
	#cfunc global CreateFontToHandle_3 "dx_CreateFontToHandle" wstr, int, int, int, int, int
	#cfunc global CreateFontToHandle_4 "dx_CreateFontToHandle" wstr, int, int, int, int, int, int
	#cfunc global CreateFontToHandle_5 "dx_CreateFontToHandle" wstr, int, int, int, int, int, int, int
	#cfunc global LoadFontDataToHandle "dx_LoadFontDataToHandle" wstr
	#cfunc global LoadFontDataToHandle_1 "dx_LoadFontDataToHandle" wstr, int
	#cfunc global LoadFontDataFromMemToHandle "dx_LoadFontDataFromMemToHandle" int, int
	#cfunc global LoadFontDataFromMemToHandle_1 "dx_LoadFontDataFromMemToHandle" int, int, int
	#func global SetFontSpaceToHandle "dx_SetFontSpaceToHandle" int, int
	#func global SetFontLineSpaceToHandle "dx_SetFontLineSpaceToHandle" int, int
	#func global SetFontCharCodeFormatToHandle "dx_SetFontCharCodeFormatToHandle" int, int
	#func global DeleteFontToHandle "dx_DeleteFontToHandle" int
	#func global SetFontLostFlag "dx_SetFontLostFlag" int, var
	#cfunc global AddFontImageToHandle "dx_AddFontImageToHandle" int, wstr, int, int, int, int
	#func global SubFontImageToHandle "dx_SubFontImageToHandle" int, wstr
	#cfunc global AddSubstitutionFontToHandle "dx_AddSubstitutionFontToHandle" int, int, int, int
	#func global SubSubstitutionFontToHandle "dx_SubSubstitutionFontToHandle" int, int
	#func global ChangeFont "dx_ChangeFont" wstr
	#func global ChangeFont_1 "dx_ChangeFont" wstr, int
	#func global ChangeFontFromHandle "dx_ChangeFontFromHandle" int
	#func global ChangeFontType "dx_ChangeFontType" int
	#cfunc global GetFontName "dx_GetFontName"
	#func global SetFontSize "dx_SetFontSize" int
	#cfunc global GetFontSize "dx_GetFontSize"
	#cfunc global GetFontEdgeSize "dx_GetFontEdgeSize"
	#func global SetFontThickness "dx_SetFontThickness" int
	#func global SetFontSpace "dx_SetFontSpace" int
	#cfunc global GetFontSpace "dx_GetFontSpace"
	#func global SetFontLineSpace "dx_SetFontLineSpace" int
	#cfunc global GetFontLineSpace "dx_GetFontLineSpace"
	#func global SetFontCharCodeFormat "dx_SetFontCharCodeFormat" int
	#func global SetDefaultFontState "dx_SetDefaultFontState" wstr, int, int
	#func global SetDefaultFontState_1 "dx_SetDefaultFontState" wstr, int, int, int
	#func global SetDefaultFontState_2 "dx_SetDefaultFontState" wstr, int, int, int, int
	#func global SetDefaultFontState_3 "dx_SetDefaultFontState" wstr, int, int, int, int, int
	#func global SetDefaultFontState_4 "dx_SetDefaultFontState" wstr, int, int, int, int, int, int
	#cfunc global GetDefaultFontHandle "dx_GetDefaultFontHandle"
	#cfunc global GetFontMaxCacheCharNum "dx_GetFontMaxCacheCharNum"
	#cfunc global GetFontMaxWidth "dx_GetFontMaxWidth"
	#cfunc global GetFontAscent "dx_GetFontAscent"
	#cfunc global GetFontNameToHandle "dx_GetFontNameToHandle" int
	#cfunc global GetFontMaxCacheCharNumToHandle "dx_GetFontMaxCacheCharNumToHandle" int
	#cfunc global GetFontMaxWidthToHandle "dx_GetFontMaxWidthToHandle" int
	#cfunc global GetFontAscentToHandle "dx_GetFontAscentToHandle" int
	#cfunc global GetFontSizeToHandle "dx_GetFontSizeToHandle" int
	#cfunc global GetFontEdgeSizeToHandle "dx_GetFontEdgeSizeToHandle" int
	#cfunc global GetFontSpaceToHandle "dx_GetFontSpaceToHandle" int
	#cfunc global GetFontLineSpaceToHandle "dx_GetFontLineSpaceToHandle" int
	#cfunc global GetFontCharInfo "dx_GetFontCharInfo" int, wstr, var, var, var, var, var
	#cfunc global GetFontStateToHandle "dx_GetFontStateToHandle" int, var, var, int, var, var, var, var
	#cfunc global CheckFontCacheToTextureFlag "dx_CheckFontCacheToTextureFlag" int
	#cfunc global CheckFontChacheToTextureFlag "dx_CheckFontChacheToTextureFlag" int
	#cfunc global CheckFontHandleValid "dx_CheckFontHandleValid" int
	#func global ClearFontCacheToHandle "dx_ClearFontCacheToHandle" int
	#func global SetFontCacheToTextureFlag "dx_SetFontCacheToTextureFlag" int
	#cfunc global GetFontCacheToTextureFlag "dx_GetFontCacheToTextureFlag"
	#func global SetFontChacheToTextureFlag "dx_SetFontChacheToTextureFlag" int
	#cfunc global GetFontChacheToTextureFlag "dx_GetFontChacheToTextureFlag"
	#func global SetFontCacheCharNum "dx_SetFontCacheCharNum" int
	#cfunc global GetFontCacheCharNum "dx_GetFontCacheCharNum"
	#func global SetFontCacheUsePremulAlphaFlag "dx_SetFontCacheUsePremulAlphaFlag" int
	#cfunc global GetFontCacheUsePremulAlphaFlag "dx_GetFontCacheUsePremulAlphaFlag"
	#func global SetFontUseAdjustSizeFlag "dx_SetFontUseAdjustSizeFlag" int
	#cfunc global GetFontUseAdjustSizeFlag "dx_GetFontUseAdjustSizeFlag"
	#func global SetFontOnlyDrawType "dx_SetFontOnlyDrawType" int
	#cfunc global GetFontOnlyDrawType "dx_GetFontOnlyDrawType"
	#func global SetFontIgnoreLFFlag "dx_SetFontIgnoreLFFlag" int
	#cfunc global GetFontIgnoreLFFlag "dx_GetFontIgnoreLFFlag"
	#func global AddFontFile "dx_AddFontFile" wstr
	#func global AddFontFileFromMem "dx_AddFontFileFromMem" int, int
	#func global RemoveFontFile "dx_RemoveFontFile" int
	#cfunc global CreateFontDataFile "dx_CreateFontDataFile" wstr, wstr, int, int, int
	#cfunc global CreateFontDataFile_1 "dx_CreateFontDataFile" wstr, wstr, int, int, int, int
	#cfunc global CreateFontDataFile_2 "dx_CreateFontDataFile" wstr, wstr, int, int, int, int, int
	#cfunc global CreateFontDataFile_3 "dx_CreateFontDataFile" wstr, wstr, int, int, int, int, int, wstr

	; === 入力 ===
	#func global SetKeyInputStringColor "dx_SetKeyInputStringColor" int, int, int, int, int, int, int
	#func global SetKeyInputStringColor_1 "dx_SetKeyInputStringColor" int, int, int, int, int, int, int, int
	#func global SetKeyInputStringColor_2 "dx_SetKeyInputStringColor" int, int, int, int, int, int, int, int, int
	#func global SetKeyInputStringColor_3 "dx_SetKeyInputStringColor" int, int, int, int, int, int, int, int, int, int
	#func global SetKeyInputStringColor_4 "dx_SetKeyInputStringColor" int, int, int, int, int, int, int, int, int, int, int
	#func global SetKeyInputStringColor_5 "dx_SetKeyInputStringColor" int, int, int, int, int, int, int, int, int, int, int, int
	#func global SetKeyInputStringColor_6 "dx_SetKeyInputStringColor" int, int, int, int, int, int, int, int, int, int, int, int, int
	#func global SetKeyInputStringColor_7 "dx_SetKeyInputStringColor" int, int, int, int, int, int, int, int, int, int, int, int, int, int
	#func global SetKeyInputStringColor_8 "dx_SetKeyInputStringColor" int, int, int, int, int, int, int, int, int, int, int, int, int, int, int
	#func global SetMouseDispFlag "dx_SetMouseDispFlag" int
	#func global SetMouseDispIgnoreMenuFlag "dx_SetMouseDispIgnoreMenuFlag" int
	#cfunc global GetMousePoint "dx_GetMousePoint" var, var
	#func global SetMousePoint "dx_SetMousePoint" int, int
	#cfunc global GetMouseInput "dx_GetMouseInput"
	#cfunc global GetMouseWheelRotVol "dx_GetMouseWheelRotVol"
	#cfunc global GetMouseWheelRotVol_1 "dx_GetMouseWheelRotVol" int
	#cfunc global GetMouseHWheelRotVol "dx_GetMouseHWheelRotVol"
	#cfunc global GetMouseHWheelRotVol_1 "dx_GetMouseHWheelRotVol" int
	#cfuncf global GetMouseWheelRotVolF "dx_GetMouseWheelRotVolF"
	#cfuncf global GetMouseWheelRotVolF_1 "dx_GetMouseWheelRotVolF" int
	#cfuncf global GetMouseHWheelRotVolF "dx_GetMouseHWheelRotVolF"
	#cfuncf global GetMouseHWheelRotVolF_1 "dx_GetMouseHWheelRotVolF" int
	#cfunc global GetMouseInputLog "dx_GetMouseInputLog" var, var, var
	#cfunc global GetMouseInputLog_1 "dx_GetMouseInputLog" var, var, var, int
	#cfunc global GetMouseInputLog2 "dx_GetMouseInputLog2" var, var, var, var
	#cfunc global GetMouseInputLog2_1 "dx_GetMouseInputLog2" var, var, var, var, int
	#cfunc global GetTouchInputNum "dx_GetTouchInputNum"
	#cfunc global GetTouchInput "dx_GetTouchInput" int, var, var, var, var, var
	#cfunc global GetTouchInputLogNum "dx_GetTouchInputLogNum"
	#func global ClearTouchInputLog "dx_ClearTouchInputLog"
	#cfunc global GetTouchInputLog "dx_GetTouchInputLog" var, int
	#cfunc global GetTouchInputLog_1 "dx_GetTouchInputLog" var, int, int
	#cfunc global GetTouchInputDownLogNum "dx_GetTouchInputDownLogNum"
	#func global ClearTouchInputDownLog "dx_ClearTouchInputDownLog"
	#cfunc global GetTouchInputDownLog "dx_GetTouchInputDownLog" var, int
	#cfunc global GetTouchInputDownLog_1 "dx_GetTouchInputDownLog" var, int, int
	#cfunc global GetTouchInputUpLogNum "dx_GetTouchInputUpLogNum"
	#func global ClearTouchInputUpLog "dx_ClearTouchInputUpLog"
	#cfunc global GetTouchInputUpLog "dx_GetTouchInputUpLog" var, int
	#cfunc global GetTouchInputUpLog_1 "dx_GetTouchInputUpLog" var, int, int
	#cfunc global StockInputChar "dx_StockInputChar" int
	#func global ClearInputCharBuf "dx_ClearInputCharBuf"
	#func global SetInputStringMaxLengthIMESync "dx_SetInputStringMaxLengthIMESync" int
	#func global SetIMEInputStringMaxLength "dx_SetIMEInputStringMaxLength" int
	#cfunc global InputStringToCustom "dx_InputStringToCustom" int, int, int, int, int, int, int
	#cfunc global InputStringToCustom_1 "dx_InputStringToCustom" int, int, int, int, int, int, int, int
	#cfunc global InputStringToCustom_2 "dx_InputStringToCustom" int, int, int, int, int, int, int, int, int
	#cfunc global InputStringToCustom_3 "dx_InputStringToCustom" int, int, int, int, int, int, int, int, int, int
	#cfunc global KeyInputString "dx_KeyInputString" int, int, int, int, int
	#cfunc global KeyInputSingleCharString "dx_KeyInputSingleCharString" int, int, int, int, int
	#cfunc global KeyInputNumber "dx_KeyInputNumber" int, int, int, int, int
	#cfunc global GetIMEInputModeStr "dx_GetIMEInputModeStr" int
	#func global SetIMEInputString "dx_SetIMEInputString" wstr
	#func global SetKeyInputStringColor2 "dx_SetKeyInputStringColor2" int, int
	#func global ResetKeyInputStringColor2 "dx_ResetKeyInputStringColor2" int
	#func global SetKeyInputStringEndCharaMode "dx_SetKeyInputStringEndCharaMode" int
	#func global InitKeyInput "dx_InitKeyInput"
	#cfunc global MakeKeyInput "dx_MakeKeyInput" int, int, int, int
	#cfunc global MakeKeyInput_1 "dx_MakeKeyInput" int, int, int, int, int
	#cfunc global MakeKeyInput_2 "dx_MakeKeyInput" int, int, int, int, int, int
	#func global DeleteKeyInput "dx_DeleteKeyInput" int
	#func global SetActiveKeyInput "dx_SetActiveKeyInput" int
	#cfunc global GetActiveKeyInput "dx_GetActiveKeyInput"
	#cfunc global CheckKeyInput "dx_CheckKeyInput" int
	#cfunc global ReStartKeyInput "dx_ReStartKeyInput" int
	#cfunc global ProcessActKeyInput "dx_ProcessActKeyInput"
	#func global SetKeyInputDrawArea "dx_SetKeyInputDrawArea" int, int, int, int, int
	#func global SetKeyInputSelectArea "dx_SetKeyInputSelectArea" int, int, int
	#cfunc global GetKeyInputSelectArea "dx_GetKeyInputSelectArea" var, var, int
	#func global SetKeyInputDrawStartPos "dx_SetKeyInputDrawStartPos" int, int
	#cfunc global GetKeyInputDrawStartPos "dx_GetKeyInputDrawStartPos" int
	#func global SetKeyInputCursorBrinkTime "dx_SetKeyInputCursorBrinkTime" int
	#func global SetKeyInputCursorBrinkFlag "dx_SetKeyInputCursorBrinkFlag" int
	#func global SetKeyInputString "dx_SetKeyInputString" wstr, int
	#func global SetKeyInputNumber "dx_SetKeyInputNumber" int, int
	#func global SetKeyInputNumberToFloat "dx_SetKeyInputNumberToFloat" float, int
	#cfunc global GetKeyInputString "dx_GetKeyInputString" int, int
	#cfunc global GetKeyInputNumber "dx_GetKeyInputNumber" int
	#cfuncf global GetKeyInputNumberToFloat "dx_GetKeyInputNumberToFloat" int
	#func global SetKeyInputCursorPosition "dx_SetKeyInputCursorPosition" int, int
	#cfunc global GetKeyInputCursorPosition "dx_GetKeyInputCursorPosition" int
	#cfunc global CheckHitKey "dx_CheckHitKey" int
	#cfunc global CheckHitKeyAll "dx_CheckHitKeyAll"
	#cfunc global CheckHitKeyAll_1 "dx_CheckHitKeyAll" int
	#cfunc global GetHitKeyStateAll "dx_GetHitKeyStateAll" int, var
	#cfunc global GetHitKeyStateAllEx "dx_GetHitKeyStateAllEx" int, var
	#cfunc global GetJoypadNum "dx_GetJoypadNum"
	#cfunc global GetJoypadButtonNum "dx_GetJoypadButtonNum" int
	#cfunc global GetJoypadInputState "dx_GetJoypadInputState" int
	#cfunc global GetJoypadAnalogInput "dx_GetJoypadAnalogInput" var, var, int
	#cfunc global GetJoypadAnalogInputRight "dx_GetJoypadAnalogInputRight" var, var, int
	#cfunc global GetJoypadDirectInputState "dx_GetJoypadDirectInputState" int, var
	#cfunc global CheckJoypadXInput "dx_CheckJoypadXInput" int
	#cfunc global GetJoypadType "dx_GetJoypadType" int
	#cfunc global GetJoypadXInputState "dx_GetJoypadXInputState" int, var
	#func global SetJoypadInputToKeyInput "dx_SetJoypadInputToKeyInput" int, int, int
	#func global SetJoypadInputToKeyInput_1 "dx_SetJoypadInputToKeyInput" int, int, int, int
	#func global SetJoypadInputToKeyInput_2 "dx_SetJoypadInputToKeyInput" int, int, int, int, int
	#func global SetJoypadInputToKeyInput_3 "dx_SetJoypadInputToKeyInput" int, int, int, int, int, int
	#func global SetJoypadDeadZone "dx_SetJoypadDeadZone" int, double
	#func global SetJoypadDefaultDeadZoneAll "dx_SetJoypadDefaultDeadZoneAll" double
	#cfunc global StartJoypadVibration "dx_StartJoypadVibration" int, int, int
	#cfunc global StartJoypadVibration_1 "dx_StartJoypadVibration" int, int, int, int
	#func global StopJoypadVibration "dx_StopJoypadVibration" int
	#func global StopJoypadVibration_1 "dx_StopJoypadVibration" int, int
	#cfunc global GetJoypadPOVState "dx_GetJoypadPOVState" int, int
	#cfunc global ReSetupJoypad "dx_ReSetupJoypad"
	#cfunc global ReSetupInputSystem "dx_ReSetupInputSystem"
	#func global SetUseJoypadVibrationFlag "dx_SetUseJoypadVibrationFlag" int
	#cfunc global MV1GetAnimTargetFrameKeySetNum "dx_MV1GetAnimTargetFrameKeySetNum" int, int, int
	#cfunc global MV1GetAnimTargetFrameKeySet "dx_MV1GetAnimTargetFrameKeySet" int, int, int, int
	#cfunc global MV1GetAnimKeySetNum "dx_MV1GetAnimKeySetNum" int
	#cfunc global MV1GetAnimKeySetType "dx_MV1GetAnimKeySetType" int, int
	#cfunc global MV1GetAnimKeySetDataType "dx_MV1GetAnimKeySetDataType" int, int
	#cfunc global MV1GetAnimKeySetTimeType "dx_MV1GetAnimKeySetTimeType" int, int
	#cfunc global MV1GetAnimKeySetDataNum "dx_MV1GetAnimKeySetDataNum" int, int
	#cfuncf global MV1GetAnimKeyDataTime "dx_MV1GetAnimKeyDataTime" int, int, int
	#cfunc global MV1GetAnimKeyDataIndexFromTime "dx_MV1GetAnimKeyDataIndexFromTime" int, int, float
	#cfuncst global FLOAT4 MV1GetAnimKeyDataToQuaternion "dx_MV1GetAnimKeyDataToQuaternion" int, int, int
	#cfuncst global FLOAT4 MV1GetAnimKeyDataToQuaternionFromTime "dx_MV1GetAnimKeyDataToQuaternionFromTime" int, int, float
	#cfuncst global VECTOR MV1GetAnimKeyDataToVector "dx_MV1GetAnimKeyDataToVector" int, int, int
	#cfuncst global VECTOR MV1GetAnimKeyDataToVectorFromTime "dx_MV1GetAnimKeyDataToVectorFromTime" int, int, float
	#cfuncst global MATRIX MV1GetAnimKeyDataToMatrix "dx_MV1GetAnimKeyDataToMatrix" int, int, int
	#cfuncst global MATRIX MV1GetAnimKeyDataToMatrixFromTime "dx_MV1GetAnimKeyDataToMatrixFromTime" int, int, float
	#cfuncf global MV1GetAnimKeyDataToFlat "dx_MV1GetAnimKeyDataToFlat" int, int, int
	#cfuncf global MV1GetAnimKeyDataToFlatFromTime "dx_MV1GetAnimKeyDataToFlatFromTime" int, int, float
	#cfuncf global MV1GetAnimKeyDataToLinear "dx_MV1GetAnimKeyDataToLinear" int, int, int
	#cfuncf global MV1GetAnimKeyDataToLinearFromTime "dx_MV1GetAnimKeyDataToLinearFromTime" int, int, float
	#cfunc global GetMouseDispFlag "dx_GetMouseDispFlag"
	#func global SetNotInputFlag "dx_SetNotInputFlag" int
	#func global SetUseKeyAccelFlag "dx_SetUseKeyAccelFlag" int
	#func global AddKeyAccel "dx_AddKeyAccel" wstr, int, int, int, int, int
	#func global AddKeyAccel_Name "dx_AddKeyAccel_Name" wstr, int, int, int, int
	#func global AddKeyAccel_ID "dx_AddKeyAccel_ID" int, int, int, int, int
	#func global ClearKeyAccel "dx_ClearKeyAccel"
	#func global SetKeyExclusiveCooperativeLevelFlag "dx_SetKeyExclusiveCooperativeLevelFlag" int
	#func global SetKeyboardNotDirectInputFlag "dx_SetKeyboardNotDirectInputFlag" int
	#func global SetUseDirectInputFlag "dx_SetUseDirectInputFlag" int
	#func global SetDirectInputMouseMode "dx_SetDirectInputMouseMode" int
	#func global SetUseXInputFlag "dx_SetUseXInputFlag" int
	#func global SetUseXboxControllerDirectInputFlag "dx_SetUseXboxControllerDirectInputFlag" int
	#cfunc global GetJoypadName "dx_GetJoypadName" int, int, int
	#cfunc global ConvertKeyCodeToVirtualKey "dx_ConvertKeyCodeToVirtualKey" int
	#cfunc global ConvertVirtualKeyToKeyCode "dx_ConvertVirtualKeyToKeyCode" int

	; === サウンド ===
	#func global InitSoundMem "dx_InitSoundMem"
	#func global AddSoundData "dx_AddSoundData"
	#func global AddSoundData_1 "dx_AddSoundData" int
	#func global AddStreamSoundMemToMem "dx_AddStreamSoundMemToMem" int, int, int, int, int
	#func global AddStreamSoundMemToMem_1 "dx_AddStreamSoundMemToMem" int, int, int, int, int, int
	#func global AddStreamSoundMemToFile "dx_AddStreamSoundMemToFile" wstr, int, int, int
	#func global AddStreamSoundMemToFile_1 "dx_AddStreamSoundMemToFile" wstr, int, int, int, int
	#func global SetupStreamSoundMem "dx_SetupStreamSoundMem" int
	#func global PlayStreamSoundMem "dx_PlayStreamSoundMem" int
	#func global PlayStreamSoundMem_1 "dx_PlayStreamSoundMem" int, int
	#func global PlayStreamSoundMem_2 "dx_PlayStreamSoundMem" int, int, int
	#cfunc global CheckStreamSoundMem "dx_CheckStreamSoundMem" int
	#func global StopStreamSoundMem "dx_StopStreamSoundMem" int
	#func global StopStreamSoundMem_1 "dx_StopStreamSoundMem" int, int
	#func global SetStreamSoundCurrentPosition "dx_SetStreamSoundCurrentPosition" int, int
	#cfunc global GetStreamSoundCurrentPosition "dx_GetStreamSoundCurrentPosition" int
	#func global SetStreamSoundCurrentTime "dx_SetStreamSoundCurrentTime" int, int
	#cfunc global GetStreamSoundCurrentTime "dx_GetStreamSoundCurrentTime" int
	#cfunc global ProcessStreamSoundMem "dx_ProcessStreamSoundMem" int
	#cfunc global ProcessStreamSoundMemAll "dx_ProcessStreamSoundMemAll"
	#cfunc global LoadSoundMem2 "dx_LoadSoundMem2" wstr, wstr
	#cfunc global LoadSoundMemBase "dx_LoadSoundMemBase" wstr, int
	#cfunc global LoadSoundMemBase_1 "dx_LoadSoundMemBase" wstr, int, int
	#cfunc global LoadSoundMem "dx_LoadSoundMem" wstr
	#cfunc global LoadSoundMem_1 "dx_LoadSoundMem" wstr, int
	#cfunc global LoadSoundMem_2 "dx_LoadSoundMem" wstr, int, int
	#cfunc global LoadSoundMemToBufNumSitei "dx_LoadSoundMemToBufNumSitei" wstr, int
	#cfunc global DuplicateSoundMem "dx_DuplicateSoundMem" int
	#cfunc global DuplicateSoundMem_1 "dx_DuplicateSoundMem" int, int
	#cfunc global LoadSoundMemByMemImageBase "dx_LoadSoundMemByMemImageBase" int, int, int
	#cfunc global LoadSoundMemByMemImageBase_1 "dx_LoadSoundMemByMemImageBase" int, int, int, int
	#cfunc global LoadSoundMemByMemImage "dx_LoadSoundMemByMemImage" int, int
	#cfunc global LoadSoundMemByMemImage_1 "dx_LoadSoundMemByMemImage" int, int, int
	#cfunc global LoadSoundMemByMemImage_2 "dx_LoadSoundMemByMemImage" int, int, int, int
	#cfunc global LoadSoundMemByMemImageToBufNumSitei "dx_LoadSoundMemByMemImageToBufNumSitei" int, int, int
	#cfunc global LoadSoundMem2ByMemImage "dx_LoadSoundMem2ByMemImage" int, int, int, int
	#cfunc global LoadSoundMemFromSoftSound "dx_LoadSoundMemFromSoftSound" int
	#cfunc global LoadSoundMemFromSoftSound_1 "dx_LoadSoundMemFromSoftSound" int, int
	#func global DeleteSoundMem "dx_DeleteSoundMem" int
	#func global PlaySoundMem "dx_PlaySoundMem" int, int
	#func global PlaySoundMem_1 "dx_PlaySoundMem" int, int, int
	#func global StopSoundMem "dx_StopSoundMem" int
	#func global StopSoundMem_1 "dx_StopSoundMem" int, int
	#cfunc global CheckSoundMem "dx_CheckSoundMem" int
	#func global SetPanSoundMem "dx_SetPanSoundMem" int, int
	#func global ChangePanSoundMem "dx_ChangePanSoundMem" int, int
	#cfunc global GetPanSoundMem "dx_GetPanSoundMem" int
	#func global SetVolumeSoundMem "dx_SetVolumeSoundMem" int, int
	#func global ChangeVolumeSoundMem "dx_ChangeVolumeSoundMem" int, int
	#cfunc global GetVolumeSoundMem "dx_GetVolumeSoundMem" int
	#cfunc global GetVolumeSoundMem2 "dx_GetVolumeSoundMem2" int
	#func global SetChannelVolumeSoundMem "dx_SetChannelVolumeSoundMem" int, int, int
	#func global ChangeChannelVolumeSoundMem "dx_ChangeChannelVolumeSoundMem" int, int, int
	#cfunc global GetChannelVolumeSoundMem "dx_GetChannelVolumeSoundMem" int, int
	#cfunc global GetChannelVolumeSoundMem2 "dx_GetChannelVolumeSoundMem2" int, int
	#func global SetFrequencySoundMem "dx_SetFrequencySoundMem" int, int
	#cfunc global GetFrequencySoundMem "dx_GetFrequencySoundMem" int
	#func global ResetFrequencySoundMem "dx_ResetFrequencySoundMem" int
	#func global SetNextPlayPanSoundMem "dx_SetNextPlayPanSoundMem" int, int
	#func global ChangeNextPlayPanSoundMem "dx_ChangeNextPlayPanSoundMem" int, int
	#func global SetNextPlayVolumeSoundMem "dx_SetNextPlayVolumeSoundMem" int, int
	#func global ChangeNextPlayVolumeSoundMem "dx_ChangeNextPlayVolumeSoundMem" int, int
	#func global SetNextPlayChannelVolumeSoundMem "dx_SetNextPlayChannelVolumeSoundMem" int, int, int
	#func global ChangeNextPlayChannelVolumeSoundMem "dx_ChangeNextPlayChannelVolumeSoundMem" int, int, int
	#func global SetNextPlayFrequencySoundMem "dx_SetNextPlayFrequencySoundMem" int, int
	#func global SetCurrentPositionSoundMem "dx_SetCurrentPositionSoundMem" int, int
	#cfunc global GetCurrentPositionSoundMem "dx_GetCurrentPositionSoundMem" int
	#func global SetSoundCurrentPosition "dx_SetSoundCurrentPosition" int, int
	#cfunc global GetSoundCurrentPosition "dx_GetSoundCurrentPosition" int
	#func global SetSoundCurrentTime "dx_SetSoundCurrentTime" int, int
	#cfunc global GetSoundCurrentTime "dx_GetSoundCurrentTime" int
	#cfunc global GetSoundTotalSample "dx_GetSoundTotalSample" int
	#cfunc global GetSoundTotalTime "dx_GetSoundTotalTime" int
	#func global SetLoopPosSoundMem "dx_SetLoopPosSoundMem" int, int
	#func global SetLoopTimePosSoundMem "dx_SetLoopTimePosSoundMem" int, int
	#func global SetLoopSamplePosSoundMem "dx_SetLoopSamplePosSoundMem" int, int
	#func global SetLoopStartTimePosSoundMem "dx_SetLoopStartTimePosSoundMem" int, int
	#func global SetLoopStartSamplePosSoundMem "dx_SetLoopStartSamplePosSoundMem" int, int
	#func global SetLoopAreaTimePosSoundMem "dx_SetLoopAreaTimePosSoundMem" int, int, int
	#cfunc global GetLoopAreaTimePosSoundMem "dx_GetLoopAreaTimePosSoundMem" var, var, int
	#func global SetLoopAreaSamplePosSoundMem "dx_SetLoopAreaSamplePosSoundMem" int, int, int
	#cfunc global GetLoopAreaSamplePosSoundMem "dx_GetLoopAreaSamplePosSoundMem" var, var, int
	#func global SetPlayFinishDeleteSoundMem "dx_SetPlayFinishDeleteSoundMem" int, int
	#func global Set3DReverbParamSoundMem "dx_Set3DReverbParamSoundMem" var, int
	#func global Set3DPresetReverbParamSoundMem "dx_Set3DPresetReverbParamSoundMem" int, int
	#func global Set3DReverbParamSoundMemAll "dx_Set3DReverbParamSoundMemAll" var
	#func global Set3DReverbParamSoundMemAll_1 "dx_Set3DReverbParamSoundMemAll" var, int
	#func global Set3DPresetReverbParamSoundMemAll "dx_Set3DPresetReverbParamSoundMemAll" int
	#func global Set3DPresetReverbParamSoundMemAll_1 "dx_Set3DPresetReverbParamSoundMemAll" int, int
	#cfunc global Get3DReverbParamSoundMem "dx_Get3DReverbParamSoundMem" var, int
	#cfunc global Get3DPresetReverbParamSoundMem "dx_Get3DPresetReverbParamSoundMem" var, int
	#func global Set3DPositionSoundMem "dx_Set3DPositionSoundMem" VECTOR, int
	#func global Set3DRadiusSoundMem "dx_Set3DRadiusSoundMem" float, int
	#func global Set3DVelocitySoundMem "dx_Set3DVelocitySoundMem" VECTOR, int
	#func global SetNextPlay3DPositionSoundMem "dx_SetNextPlay3DPositionSoundMem" VECTOR, int
	#func global SetNextPlay3DRadiusSoundMem "dx_SetNextPlay3DRadiusSoundMem" float, int
	#func global SetNextPlay3DVelocitySoundMem "dx_SetNextPlay3DVelocitySoundMem" VECTOR, int
	#func global SetCreateSoundDataType "dx_SetCreateSoundDataType" int
	#cfunc global GetCreateSoundDataType "dx_GetCreateSoundDataType"
	#func global SetCreateSoundPitchRate "dx_SetCreateSoundPitchRate" float
	#cfuncf global GetCreateSoundPitchRate "dx_GetCreateSoundPitchRate"
	#func global SetCreateSoundTimeStretchRate "dx_SetCreateSoundTimeStretchRate" float
	#cfuncf global GetCreateSoundTimeStretchRate "dx_GetCreateSoundTimeStretchRate"
	#func global SetCreateSoundLoopAreaTimePos "dx_SetCreateSoundLoopAreaTimePos" int, int
	#cfunc global GetCreateSoundLoopAreaTimePos "dx_GetCreateSoundLoopAreaTimePos" var, var
	#func global SetCreateSoundLoopAreaSamplePos "dx_SetCreateSoundLoopAreaSamplePos" int, int
	#cfunc global GetCreateSoundLoopAreaSamplePos "dx_GetCreateSoundLoopAreaSamplePos" var, var
	#func global SetCreateSoundIgnoreLoopAreaInfo "dx_SetCreateSoundIgnoreLoopAreaInfo" int
	#cfunc global GetCreateSoundIgnoreLoopAreaInfo "dx_GetCreateSoundIgnoreLoopAreaInfo"
	#func global SetDisableReadSoundFunctionMask "dx_SetDisableReadSoundFunctionMask" int
	#cfunc global GetDisableReadSoundFunctionMask "dx_GetDisableReadSoundFunctionMask"
	#func global SetEnableSoundCaptureFlag "dx_SetEnableSoundCaptureFlag" int
	#func global SetSoundCurrentTimeType "dx_SetSoundCurrentTimeType" int
	#cfunc global GetSoundCurrentTimeType "dx_GetSoundCurrentTimeType"
	#func global SetCreate3DSoundFlag "dx_SetCreate3DSoundFlag" int
	#func global Set3DSoundOneMetre "dx_Set3DSoundOneMetre" float
	#func global Set3DSoundListenerPosAndFrontPos_UpVecY "dx_Set3DSoundListenerPosAndFrontPos_UpVecY" VECTOR, VECTOR
	#func global Set3DSoundListenerPosAndFrontPosAndUpVec "dx_Set3DSoundListenerPosAndFrontPosAndUpVec" VECTOR, VECTOR, VECTOR
	#func global Set3DSoundListenerVelocity "dx_Set3DSoundListenerVelocity" VECTOR
	#func global Set3DSoundListenerConeAngle "dx_Set3DSoundListenerConeAngle" float, float
	#func global Set3DSoundListenerConeVolume "dx_Set3DSoundListenerConeVolume" float, float
	#func global PlaySoundFile "dx_PlaySoundFile" wstr, int
	#func global PlaySound "dx_PlaySound" wstr, int
	#func global PlaySoundDX "dx_PlaySoundDX" wstr, int
	#cfunc global CheckSoundFile "dx_CheckSoundFile"
	#cfunc global CheckSound "dx_CheckSound"
	#func global StopSoundFile "dx_StopSoundFile"
	#func global StopSound "dx_StopSound"
	#func global SetVolumeSoundFile "dx_SetVolumeSoundFile" int
	#func global SetVolumeSound "dx_SetVolumeSound" int
	#func global InitSoftSound "dx_InitSoftSound"
	#cfunc global LoadSoftSound "dx_LoadSoftSound" wstr
	#cfunc global LoadSoftSoundFromMemImage "dx_LoadSoftSoundFromMemImage" int, int
	#cfunc global MakeSoftSound "dx_MakeSoftSound" int, int
	#cfunc global MakeSoftSound2Ch16Bit44KHz "dx_MakeSoftSound2Ch16Bit44KHz" int
	#cfunc global MakeSoftSound2Ch16Bit22KHz "dx_MakeSoftSound2Ch16Bit22KHz" int
	#cfunc global MakeSoftSound2Ch8Bit44KHz "dx_MakeSoftSound2Ch8Bit44KHz" int
	#cfunc global MakeSoftSound2Ch8Bit22KHz "dx_MakeSoftSound2Ch8Bit22KHz" int
	#cfunc global MakeSoftSound1Ch16Bit44KHz "dx_MakeSoftSound1Ch16Bit44KHz" int
	#cfunc global MakeSoftSound1Ch16Bit22KHz "dx_MakeSoftSound1Ch16Bit22KHz" int
	#cfunc global MakeSoftSound1Ch8Bit44KHz "dx_MakeSoftSound1Ch8Bit44KHz" int
	#cfunc global MakeSoftSound1Ch8Bit22KHz "dx_MakeSoftSound1Ch8Bit22KHz" int
	#cfunc global MakeSoftSoundCustom "dx_MakeSoftSoundCustom" int, int, int, int
	#cfunc global MakeSoftSoundCustom_1 "dx_MakeSoftSoundCustom" int, int, int, int, int
	#func global DeleteSoftSound "dx_DeleteSoftSound" int
	#func global SaveSoftSound "dx_SaveSoftSound" int, wstr
	#cfunc global GetSoftSoundSampleNum "dx_GetSoftSoundSampleNum" int
	#cfunc global GetSoftSoundFormat "dx_GetSoftSoundFormat" int, var, var, var, var
	#cfunc global ReadSoftSoundData "dx_ReadSoftSoundData" int, int, var, var
	#cfunc global ReadSoftSoundDataF "dx_ReadSoftSoundDataF" int, int, var, var
	#func global WriteSoftSoundData "dx_WriteSoftSoundData" int, int, int, int
	#func global WriteSoftSoundDataF "dx_WriteSoftSoundDataF" int, int, float, float
	#func global WriteTimeStretchSoftSoundData "dx_WriteTimeStretchSoftSoundData" int, int
	#func global WritePitchShiftSoftSoundData "dx_WritePitchShiftSoftSoundData" int, int
	#cfunc global GetSoftSoundDataImage "dx_GetSoftSoundDataImage" int
	#cfunc global GetFFTVibrationSoftSound "dx_GetFFTVibrationSoftSound" int, int, int, int, int, var, int
	#cfunc global GetFFTVibrationSoftSoundBase "dx_GetFFTVibrationSoftSoundBase" int, int, int, int, int, var, int, var, int
	#func global InitSoftSoundPlayer "dx_InitSoftSoundPlayer"
	#cfunc global MakeSoftSoundPlayer "dx_MakeSoftSoundPlayer" int
	#cfunc global MakeSoftSoundPlayer2Ch16Bit44KHz "dx_MakeSoftSoundPlayer2Ch16Bit44KHz"
	#cfunc global MakeSoftSoundPlayer2Ch16Bit22KHz "dx_MakeSoftSoundPlayer2Ch16Bit22KHz"
	#cfunc global MakeSoftSoundPlayer2Ch8Bit44KHz "dx_MakeSoftSoundPlayer2Ch8Bit44KHz"
	#cfunc global MakeSoftSoundPlayer2Ch8Bit22KHz "dx_MakeSoftSoundPlayer2Ch8Bit22KHz"
	#cfunc global MakeSoftSoundPlayer1Ch16Bit44KHz "dx_MakeSoftSoundPlayer1Ch16Bit44KHz"
	#cfunc global MakeSoftSoundPlayer1Ch16Bit22KHz "dx_MakeSoftSoundPlayer1Ch16Bit22KHz"
	#cfunc global MakeSoftSoundPlayer1Ch8Bit44KHz "dx_MakeSoftSoundPlayer1Ch8Bit44KHz"
	#cfunc global MakeSoftSoundPlayer1Ch8Bit22KHz "dx_MakeSoftSoundPlayer1Ch8Bit22KHz"
	#cfunc global MakeSoftSoundPlayerCustom "dx_MakeSoftSoundPlayerCustom" int, int, int
	#func global DeleteSoftSoundPlayer "dx_DeleteSoftSoundPlayer" int
	#func global AddDataSoftSoundPlayer "dx_AddDataSoftSoundPlayer" int, int, int, int
	#func global AddDirectDataSoftSoundPlayer "dx_AddDirectDataSoftSoundPlayer" int, int, int
	#func global AddOneDataSoftSoundPlayer "dx_AddOneDataSoftSoundPlayer" int, int, int
	#cfunc global GetSoftSoundPlayerFormat "dx_GetSoftSoundPlayerFormat" int, var, var, var
	#cfunc global StartSoftSoundPlayer "dx_StartSoftSoundPlayer" int
	#cfunc global CheckStartSoftSoundPlayer "dx_CheckStartSoftSoundPlayer" int
	#func global StopSoftSoundPlayer "dx_StopSoftSoundPlayer" int
	#func global ResetSoftSoundPlayer "dx_ResetSoftSoundPlayer" int
	#cfunc global GetStockDataLengthSoftSoundPlayer "dx_GetStockDataLengthSoftSoundPlayer" int, var
	#cfunc global CheckSoftSoundPlayerNoneData "dx_CheckSoftSoundPlayerNoneData" int
	#func global DeleteMusicMem "dx_DeleteMusicMem" int
	#cfunc global LoadMusicMem "dx_LoadMusicMem" wstr
	#cfunc global LoadMusicMemByMemImage "dx_LoadMusicMemByMemImage" int, int
	#func global PlayMusicMem "dx_PlayMusicMem" int, int
	#func global StopMusicMem "dx_StopMusicMem" int
	#cfunc global CheckMusicMem "dx_CheckMusicMem" int
	#func global SetVolumeMusicMem "dx_SetVolumeMusicMem" int, int
	#cfunc global GetMusicMemPosition "dx_GetMusicMemPosition" int
	#func global InitMusicMem "dx_InitMusicMem"
	#cfunc global ProcessMusicMem "dx_ProcessMusicMem"
	#func global PlayMusic "dx_PlayMusic" wstr, int
	#func global PlayMusicByMemImage "dx_PlayMusicByMemImage" int, int, int
	#func global SetVolumeMusic "dx_SetVolumeMusic" int
	#func global StopMusic "dx_StopMusic"
	#cfunc global CheckMusic "dx_CheckMusic"
	#cfunc global GetMusicPosition "dx_GetMusicPosition"
	#cfunc global Live2D_Model_GetMotionSoundFileName "dx_Live2D_Model_GetMotionSoundFileName" int, wstr, int
	#func global SetNotSoundFlag "dx_SetNotSoundFlag" int
	#cfunc global LoadSoundMemByResource "dx_LoadSoundMemByResource" wstr, wstr
	#cfunc global LoadSoundMemByResource_1 "dx_LoadSoundMemByResource" wstr, wstr, int
	#func global SetUseSoftwareMixingSoundFlag "dx_SetUseSoftwareMixingSoundFlag" int
	#cfunc global GetDSoundObj "dx_GetDSoundObj"
	#cfunc global LoadMusicMemByResource "dx_LoadMusicMemByResource" wstr, wstr
	#func global PlayMusicByResource "dx_PlayMusicByResource" wstr, wstr, int

	; === 3Dモデル ===
	#cfunc global MV1LoadModel "dx_MV1LoadModel" wstr
	#cfunc global MV1DuplicateModel "dx_MV1DuplicateModel" int
	#cfunc global MV1CreateCloneModel "dx_MV1CreateCloneModel" int
	#cfunc global MV1CreateSimpleModel "dx_MV1CreateSimpleModel" var, int, var, int, var, int
	#func global MV1DeleteModel "dx_MV1DeleteModel" int
	#cfunc global MV1InitModel "dx_MV1InitModel"
	#func global MV1SetLoadModelReMakeNormal "dx_MV1SetLoadModelReMakeNormal" int
	#func global MV1SetLoadModelReMakeNormalSmoothingAngle "dx_MV1SetLoadModelReMakeNormalSmoothingAngle"
	#func global MV1SetLoadModelReMakeNormalSmoothingAngle_1 "dx_MV1SetLoadModelReMakeNormalSmoothingAngle" float
	#func global MV1SetLoadModelIgnoreScaling "dx_MV1SetLoadModelIgnoreScaling" int
	#func global MV1SetLoadModelPositionOptimize "dx_MV1SetLoadModelPositionOptimize" int
	#func global MV1SetLoadModelNotEqNormalSide_AddZeroAreaPolygon "dx_MV1SetLoadModelNotEqNormalSide_AddZeroAreaPolygon" int
	#func global MV1SetLoadModelUsePhysicsMode "dx_MV1SetLoadModelUsePhysicsMode" int
	#func global MV1SetLoadModelPhysicsWorldGravity "dx_MV1SetLoadModelPhysicsWorldGravity" float
	#cfuncf global MV1GetLoadModelPhysicsWorldGravity "dx_MV1GetLoadModelPhysicsWorldGravity"
	#func global MV1SetLoadCalcPhysicsWorldGravity "dx_MV1SetLoadCalcPhysicsWorldGravity" int, VECTOR
	#cfuncst global VECTOR MV1GetLoadCalcPhysicsWorldGravity "dx_MV1GetLoadCalcPhysicsWorldGravity" int
	#func global MV1SetLoadModelPhysicsCalcPrecision "dx_MV1SetLoadModelPhysicsCalcPrecision" int
	#func global MV1SetLoadModel_PMD_PMX_AnimationFPSMode "dx_MV1SetLoadModel_PMD_PMX_AnimationFPSMode" int
	#cfunc global MV1AddLoadModelDisablePhysicsNameWord "dx_MV1AddLoadModelDisablePhysicsNameWord" wstr
	#func global MV1ResetLoadModelDisablePhysicsNameWord "dx_MV1ResetLoadModelDisablePhysicsNameWord"
	#func global MV1SetLoadModelDisablePhysicsNameWordMode "dx_MV1SetLoadModelDisablePhysicsNameWordMode" int
	#func global MV1SetLoadModelAnimFilePath "dx_MV1SetLoadModelAnimFilePath" wstr
	#func global MV1SetLoadModelUsePackDraw "dx_MV1SetLoadModelUsePackDraw" int
	#func global MV1SetLoadModelTriangleListUseMaxBoneNum "dx_MV1SetLoadModelTriangleListUseMaxBoneNum" int
	#func global MV1SetLoadModelTextureLoad "dx_MV1SetLoadModelTextureLoad" int
	#func global MV1SetLoadModelIgnoreIK "dx_MV1SetLoadModelIgnoreIK" int
	#cfunc global MV1SaveModelToMV1File "dx_MV1SaveModelToMV1File" int, wstr
	#cfunc global MV1SaveModelToMV1File_1 "dx_MV1SaveModelToMV1File" int, wstr, int
	#cfunc global MV1SaveModelToMV1File_2 "dx_MV1SaveModelToMV1File" int, wstr, int, int
	#cfunc global MV1SaveModelToMV1File_3 "dx_MV1SaveModelToMV1File" int, wstr, int, int, int
	#cfunc global MV1SaveModelToMV1File_4 "dx_MV1SaveModelToMV1File" int, wstr, int, int, int, int
	#cfunc global MV1SaveModelToMV1File_5 "dx_MV1SaveModelToMV1File" int, wstr, int, int, int, int, int
	#cfunc global MV1SaveModelToMV1File_6 "dx_MV1SaveModelToMV1File" int, wstr, int, int, int, int, int, int
	#cfunc global MV1SaveModelToMV1File_7 "dx_MV1SaveModelToMV1File" int, wstr, int, int, int, int, int, int, int
	#cfunc global MV1SaveModelToXFile "dx_MV1SaveModelToXFile" int, wstr
	#cfunc global MV1SaveModelToXFile_1 "dx_MV1SaveModelToXFile" int, wstr, int
	#cfunc global MV1SaveModelToXFile_2 "dx_MV1SaveModelToXFile" int, wstr, int, int
	#cfunc global MV1SaveModelToXFile_3 "dx_MV1SaveModelToXFile" int, wstr, int, int, int
	#cfunc global MV1DrawModel "dx_MV1DrawModel" int
	#cfunc global MV1DrawFrame "dx_MV1DrawFrame" int, int
	#cfunc global MV1DrawMesh "dx_MV1DrawMesh" int, int
	#cfunc global MV1DrawTriangleList "dx_MV1DrawTriangleList" int, int
	#cfunc global MV1DrawModelDebug "dx_MV1DrawModelDebug" int, int, int, float, int, int
	#func global MV1SetUseOrigShader "dx_MV1SetUseOrigShader" int
	#func global MV1SetDrawMode "dx_MV1SetDrawMode" int
	#func global MV1SetSemiTransDrawMode "dx_MV1SetSemiTransDrawMode" int
	#cfuncst global MATRIX MV1GetLocalWorldMatrix "dx_MV1GetLocalWorldMatrix" int
	#cfuncst global MV1GetLocalWorldMatrixD "dx_MV1GetLocalWorldMatrixD" 128, int
	#func global MV1SetPosition "dx_MV1SetPosition" int, VECTOR
	#func global MV1SetPositionD "dx_MV1SetPositionD" int, VECTOR_D
	#cfuncst global VECTOR MV1GetPosition "dx_MV1GetPosition" int
	#cfuncst global VECTOR_D MV1GetPositionD "dx_MV1GetPositionD" int
	#func global MV1SetScale "dx_MV1SetScale" int, VECTOR
	#cfuncst global VECTOR MV1GetScale "dx_MV1GetScale" int
	#func global MV1SetRotationXYZ "dx_MV1SetRotationXYZ" int, VECTOR
	#cfuncst global VECTOR MV1GetRotationXYZ "dx_MV1GetRotationXYZ" int
	#func global MV1SetRotationZYAxis "dx_MV1SetRotationZYAxis" int, VECTOR, VECTOR, float
	#func global MV1SetRotationYUseDir "dx_MV1SetRotationYUseDir" int, VECTOR, float
	#func global MV1SetRotationMatrix "dx_MV1SetRotationMatrix" int, MATRIX
	#cfuncst global MATRIX MV1GetRotationMatrix "dx_MV1GetRotationMatrix" int
	#func global MV1SetMatrix "dx_MV1SetMatrix" int, MATRIX
	#func global MV1SetMatrixD "dx_MV1SetMatrixD" int, MATRIX_D
	#cfuncst global MATRIX MV1GetMatrix "dx_MV1GetMatrix" int
	#cfuncst global MV1GetMatrixD "dx_MV1GetMatrixD" 128, int
	#func global MV1SetVisible "dx_MV1SetVisible" int, int
	#cfunc global MV1GetVisible "dx_MV1GetVisible" int
	#func global MV1SetMeshCategoryVisible "dx_MV1SetMeshCategoryVisible" int, int, int
	#cfunc global MV1GetMeshCategoryVisible "dx_MV1GetMeshCategoryVisible" int, int
	#func global MV1SetDifColorScale "dx_MV1SetDifColorScale" int, COLOR_F
	#cfuncst global COLOR_F MV1GetDifColorScale "dx_MV1GetDifColorScale" int
	#func global MV1SetSpcColorScale "dx_MV1SetSpcColorScale" int, COLOR_F
	#cfuncst global COLOR_F MV1GetSpcColorScale "dx_MV1GetSpcColorScale" int
	#func global MV1SetEmiColorScale "dx_MV1SetEmiColorScale" int, COLOR_F
	#cfuncst global COLOR_F MV1GetEmiColorScale "dx_MV1GetEmiColorScale" int
	#func global MV1SetAmbColorScale "dx_MV1SetAmbColorScale" int, COLOR_F
	#cfuncst global COLOR_F MV1GetAmbColorScale "dx_MV1GetAmbColorScale" int
	#cfunc global MV1GetSemiTransState "dx_MV1GetSemiTransState" int
	#func global MV1SetOpacityRate "dx_MV1SetOpacityRate" int, float
	#cfuncf global MV1GetOpacityRate "dx_MV1GetOpacityRate" int
	#func global MV1SetUseDrawMulAlphaColor "dx_MV1SetUseDrawMulAlphaColor" int, int
	#cfunc global MV1GetUseDrawMulAlphaColor "dx_MV1GetUseDrawMulAlphaColor" int
	#func global MV1SetUseZBuffer "dx_MV1SetUseZBuffer" int, int
	#func global MV1SetWriteZBuffer "dx_MV1SetWriteZBuffer" int, int
	#func global MV1SetZBufferCmpType "dx_MV1SetZBufferCmpType" int, int
	#func global MV1SetZBias "dx_MV1SetZBias" int, int
	#func global MV1SetUseVertDifColor "dx_MV1SetUseVertDifColor" int, int
	#func global MV1SetUseVertSpcColor "dx_MV1SetUseVertSpcColor" int, int
	#func global MV1SetSampleFilterMode "dx_MV1SetSampleFilterMode" int, int
	#func global MV1SetMaxAnisotropy "dx_MV1SetMaxAnisotropy" int, int
	#func global MV1SetWireFrameDrawFlag "dx_MV1SetWireFrameDrawFlag" int, int
	#cfunc global MV1RefreshVertColorFromMaterial "dx_MV1RefreshVertColorFromMaterial" int
	#func global MV1SetPhysicsWorldGravity "dx_MV1SetPhysicsWorldGravity" int, VECTOR
	#cfunc global MV1PhysicsCalculation "dx_MV1PhysicsCalculation" int, float
	#cfunc global MV1PhysicsResetState "dx_MV1PhysicsResetState" int
	#func global MV1SetPrioritizePhysicsOverAnimFlag "dx_MV1SetPrioritizePhysicsOverAnimFlag" int, int
	#func global MV1SetUseShapeFlag "dx_MV1SetUseShapeFlag" int, int
	#cfunc global MV1GetMaterialNumberOrderFlag "dx_MV1GetMaterialNumberOrderFlag" int
	#cfunc global MV1AttachAnim "dx_MV1AttachAnim" int, int
	#cfunc global MV1AttachAnim_1 "dx_MV1AttachAnim" int, int, int
	#cfunc global MV1AttachAnim_2 "dx_MV1AttachAnim" int, int, int, int
	#func global MV1DetachAnim "dx_MV1DetachAnim" int, int
	#func global MV1SetAttachAnimTime "dx_MV1SetAttachAnimTime" int, int, float
	#cfuncf global MV1GetAttachAnimTime "dx_MV1GetAttachAnimTime" int, int
	#cfuncf global MV1GetAttachAnimTotalTime "dx_MV1GetAttachAnimTotalTime" int, int
	#func global MV1SetAttachAnimBlendRate "dx_MV1SetAttachAnimBlendRate" int, int
	#func global MV1SetAttachAnimBlendRate_1 "dx_MV1SetAttachAnimBlendRate" int, int, float
	#cfuncf global MV1GetAttachAnimBlendRate "dx_MV1GetAttachAnimBlendRate" int, int
	#func global MV1SetAttachAnimBlendRateToFrame "dx_MV1SetAttachAnimBlendRateToFrame" int, int, int, float
	#func global MV1SetAttachAnimBlendRateToFrame_1 "dx_MV1SetAttachAnimBlendRateToFrame" int, int, int, float, int
	#cfuncf global MV1GetAttachAnimBlendRateToFrame "dx_MV1GetAttachAnimBlendRateToFrame" int, int, int
	#func global MV1SetAttachAnimTimeToFrame "dx_MV1SetAttachAnimTimeToFrame" int, int, int, float
	#func global MV1SetAttachAnimTimeToFrame_1 "dx_MV1SetAttachAnimTimeToFrame" int, int, int, float, int
	#cfuncf global MV1GetAttachAnimTimeToFrame "dx_MV1GetAttachAnimTimeToFrame" int, int, int
	#cfunc global MV1GetAttachAnim "dx_MV1GetAttachAnim" int, int
	#func global MV1SetAttachAnimUseShapeFlag "dx_MV1SetAttachAnimUseShapeFlag" int, int, int
	#cfunc global MV1GetAttachAnimUseShapeFlag "dx_MV1GetAttachAnimUseShapeFlag" int, int
	#cfuncst global VECTOR MV1GetAttachAnimFrameLocalPosition "dx_MV1GetAttachAnimFrameLocalPosition" int, int, int
	#cfuncst global MATRIX MV1GetAttachAnimFrameLocalMatrix "dx_MV1GetAttachAnimFrameLocalMatrix" int, int, int
	#cfunc global MV1GetAnimNum "dx_MV1GetAnimNum" int
	#cfunc global MV1GetAnimName "dx_MV1GetAnimName" int, int
	#func global MV1SetAnimName "dx_MV1SetAnimName" int, int, wstr
	#cfunc global MV1GetAnimIndex "dx_MV1GetAnimIndex" int, wstr
	#cfuncf global MV1GetAnimTotalTime "dx_MV1GetAnimTotalTime" int, int
	#cfunc global MV1GetAnimTargetFrameNum "dx_MV1GetAnimTargetFrameNum" int, int
	#cfunc global MV1GetAnimTargetFrameName "dx_MV1GetAnimTargetFrameName" int, int, int
	#cfunc global MV1GetAnimTargetFrame "dx_MV1GetAnimTargetFrame" int, int, int
	#cfunc global MV1GetMaterialNum "dx_MV1GetMaterialNum" int
	#cfunc global MV1GetMaterialName "dx_MV1GetMaterialName" int, int
	#func global MV1SetMaterialTypeAll "dx_MV1SetMaterialTypeAll" int, int
	#func global MV1SetMaterialType "dx_MV1SetMaterialType" int, int, int
	#cfunc global MV1GetMaterialType "dx_MV1GetMaterialType" int, int
	#func global MV1SetMaterialDifColor "dx_MV1SetMaterialDifColor" int, int, COLOR_F
	#cfuncst global COLOR_F MV1GetMaterialDifColor "dx_MV1GetMaterialDifColor" int, int
	#func global MV1SetMaterialSpcColor "dx_MV1SetMaterialSpcColor" int, int, COLOR_F
	#cfuncst global COLOR_F MV1GetMaterialSpcColor "dx_MV1GetMaterialSpcColor" int, int
	#func global MV1SetMaterialEmiColor "dx_MV1SetMaterialEmiColor" int, int, COLOR_F
	#cfuncst global COLOR_F MV1GetMaterialEmiColor "dx_MV1GetMaterialEmiColor" int, int
	#func global MV1SetMaterialAmbColor "dx_MV1SetMaterialAmbColor" int, int, COLOR_F
	#cfuncst global COLOR_F MV1GetMaterialAmbColor "dx_MV1GetMaterialAmbColor" int, int
	#func global MV1SetMaterialSpcPower "dx_MV1SetMaterialSpcPower" int, int, float
	#cfuncf global MV1GetMaterialSpcPower "dx_MV1GetMaterialSpcPower" int, int
	#func global MV1SetMaterialDifMapTexture "dx_MV1SetMaterialDifMapTexture" int, int, int
	#cfunc global MV1GetMaterialDifMapTexture "dx_MV1GetMaterialDifMapTexture" int, int
	#func global MV1SetMaterialSubDifMapTexture "dx_MV1SetMaterialSubDifMapTexture" int, int, int
	#cfunc global MV1GetMaterialSubDifMapTexture "dx_MV1GetMaterialSubDifMapTexture" int, int
	#func global MV1SetMaterialSpcMapTexture "dx_MV1SetMaterialSpcMapTexture" int, int, int
	#cfunc global MV1GetMaterialSpcMapTexture "dx_MV1GetMaterialSpcMapTexture" int, int
	#func global MV1SetMaterialNormalMapTexture "dx_MV1SetMaterialNormalMapTexture" int, int, int
	#cfunc global MV1GetMaterialNormalMapTexture "dx_MV1GetMaterialNormalMapTexture" int, int
	#func global MV1SetMaterialDifGradTexture "dx_MV1SetMaterialDifGradTexture" int, int, int
	#cfunc global MV1GetMaterialDifGradTexture "dx_MV1GetMaterialDifGradTexture" int, int
	#func global MV1SetMaterialSpcGradTexture "dx_MV1SetMaterialSpcGradTexture" int, int, int
	#cfunc global MV1GetMaterialSpcGradTexture "dx_MV1GetMaterialSpcGradTexture" int, int
	#func global MV1SetMaterialSphereMapTexture "dx_MV1SetMaterialSphereMapTexture" int, int, int
	#cfunc global MV1GetMaterialSphereMapTexture "dx_MV1GetMaterialSphereMapTexture" int, int
	#func global MV1SetMaterialDifGradBlendTypeAll "dx_MV1SetMaterialDifGradBlendTypeAll" int, int
	#func global MV1SetMaterialDifGradBlendType "dx_MV1SetMaterialDifGradBlendType" int, int, int
	#cfunc global MV1GetMaterialDifGradBlendType "dx_MV1GetMaterialDifGradBlendType" int, int
	#func global MV1SetMaterialSpcGradBlendTypeAll "dx_MV1SetMaterialSpcGradBlendTypeAll" int, int
	#func global MV1SetMaterialSpcGradBlendType "dx_MV1SetMaterialSpcGradBlendType" int, int, int
	#cfunc global MV1GetMaterialSpcGradBlendType "dx_MV1GetMaterialSpcGradBlendType" int, int
	#func global MV1SetMaterialSphereMapBlendTypeAll "dx_MV1SetMaterialSphereMapBlendTypeAll" int, int
	#func global MV1SetMaterialSphereMapBlendType "dx_MV1SetMaterialSphereMapBlendType" int, int, int
	#cfunc global MV1GetMaterialSphereMapBlendType "dx_MV1GetMaterialSphereMapBlendType" int, int
	#func global MV1SetMaterialOutLineWidthAll "dx_MV1SetMaterialOutLineWidthAll" int, float
	#func global MV1SetMaterialOutLineWidth "dx_MV1SetMaterialOutLineWidth" int, int, float
	#cfuncf global MV1GetMaterialOutLineWidth "dx_MV1GetMaterialOutLineWidth" int, int
	#func global MV1SetMaterialOutLineDotWidthAll "dx_MV1SetMaterialOutLineDotWidthAll" int, float
	#func global MV1SetMaterialOutLineDotWidth "dx_MV1SetMaterialOutLineDotWidth" int, int, float
	#cfuncf global MV1GetMaterialOutLineDotWidth "dx_MV1GetMaterialOutLineDotWidth" int, int
	#func global MV1SetMaterialOutLineColorAll "dx_MV1SetMaterialOutLineColorAll" int, COLOR_F
	#func global MV1SetMaterialOutLineColor "dx_MV1SetMaterialOutLineColor" int, int, COLOR_F
	#cfuncst global COLOR_F MV1GetMaterialOutLineColor "dx_MV1GetMaterialOutLineColor" int, int
	#func global MV1SetMaterialDrawBlendModeAll "dx_MV1SetMaterialDrawBlendModeAll" int, int
	#func global MV1SetMaterialDrawBlendMode "dx_MV1SetMaterialDrawBlendMode" int, int, int
	#cfunc global MV1GetMaterialDrawBlendMode "dx_MV1GetMaterialDrawBlendMode" int, int
	#func global MV1SetMaterialDrawBlendParamAll "dx_MV1SetMaterialDrawBlendParamAll" int, int
	#func global MV1SetMaterialDrawBlendParam "dx_MV1SetMaterialDrawBlendParam" int, int, int
	#cfunc global MV1GetMaterialDrawBlendParam "dx_MV1GetMaterialDrawBlendParam" int, int
	#func global MV1SetMaterialDrawAlphaTestAll "dx_MV1SetMaterialDrawAlphaTestAll" int, int, int, int
	#func global MV1SetMaterialDrawAlphaTest "dx_MV1SetMaterialDrawAlphaTest" int, int, int, int, int
	#cfunc global MV1GetMaterialDrawAlphaTestEnable "dx_MV1GetMaterialDrawAlphaTestEnable" int, int
	#cfunc global MV1GetMaterialDrawAlphaTestMode "dx_MV1GetMaterialDrawAlphaTestMode" int, int
	#cfunc global MV1GetMaterialDrawAlphaTestParam "dx_MV1GetMaterialDrawAlphaTestParam" int, int
	#func global MV1SetMaterialDrawAddColorAll "dx_MV1SetMaterialDrawAddColorAll" int, int, int, int
	#func global MV1SetMaterialDrawAddColor "dx_MV1SetMaterialDrawAddColor" int, int, int, int, int
	#cfunc global MV1GetMaterialDrawAddColor "dx_MV1GetMaterialDrawAddColor" int, int, var, var, var
	#cfunc global MV1GetTextureNum "dx_MV1GetTextureNum" int
	#cfunc global MV1GetTextureName "dx_MV1GetTextureName" int, int
	#func global MV1SetTextureColorFilePath "dx_MV1SetTextureColorFilePath" int, int, wstr
	#cfunc global MV1GetTextureColorFilePath "dx_MV1GetTextureColorFilePath" int, int
	#func global MV1SetTextureAlphaFilePath "dx_MV1SetTextureAlphaFilePath" int, int, wstr
	#cfunc global MV1GetTextureAlphaFilePath "dx_MV1GetTextureAlphaFilePath" int, int
	#func global MV1SetTextureGraphHandle "dx_MV1SetTextureGraphHandle" int, int, int, int
	#cfunc global MV1GetTextureGraphHandle "dx_MV1GetTextureGraphHandle" int, int
	#func global MV1SetTextureAddressMode "dx_MV1SetTextureAddressMode" int, int, int, int
	#cfunc global MV1GetTextureAddressModeU "dx_MV1GetTextureAddressModeU" int, int
	#cfunc global MV1GetTextureAddressModeV "dx_MV1GetTextureAddressModeV" int, int
	#cfunc global MV1GetTextureWidth "dx_MV1GetTextureWidth" int, int
	#cfunc global MV1GetTextureHeight "dx_MV1GetTextureHeight" int, int
	#cfunc global MV1GetTextureSemiTransState "dx_MV1GetTextureSemiTransState" int, int
	#func global MV1SetTextureBumpImageFlag "dx_MV1SetTextureBumpImageFlag" int, int, int
	#cfunc global MV1GetTextureBumpImageFlag "dx_MV1GetTextureBumpImageFlag" int, int
	#func global MV1SetTextureBumpImageNextPixelLength "dx_MV1SetTextureBumpImageNextPixelLength" int, int, float
	#cfuncf global MV1GetTextureBumpImageNextPixelLength "dx_MV1GetTextureBumpImageNextPixelLength" int, int
	#func global MV1SetTextureSampleFilterMode "dx_MV1SetTextureSampleFilterMode" int, int, int
	#cfunc global MV1GetTextureSampleFilterMode "dx_MV1GetTextureSampleFilterMode" int, int
	#cfunc global MV1AddTexture "dx_MV1AddTexture" int, wstr, wstr, wstr, int, int, int, int, int, int, float, int, int
	#cfunc global MV1AddTextureGraphHandle "dx_MV1AddTextureGraphHandle" int, wstr, int, int
	#cfunc global MV1AddTextureGraphHandle_1 "dx_MV1AddTextureGraphHandle" int, wstr, int, int, int
	#cfunc global MV1AddTextureGraphHandle_2 "dx_MV1AddTextureGraphHandle" int, wstr, int, int, int, int
	#cfunc global MV1AddTextureGraphHandle_3 "dx_MV1AddTextureGraphHandle" int, wstr, int, int, int, int, int
	#cfunc global MV1LoadTexture "dx_MV1LoadTexture" wstr
	#cfunc global MV1GetFrameNum "dx_MV1GetFrameNum" int
	#cfunc global MV1SearchFrame "dx_MV1SearchFrame" int, wstr
	#cfunc global MV1SearchFrameChild "dx_MV1SearchFrameChild" int
	#cfunc global MV1SearchFrameChild_1 "dx_MV1SearchFrameChild" int, int
	#cfunc global MV1SearchFrameChild_2 "dx_MV1SearchFrameChild" int, int, wstr
	#cfunc global MV1GetFrameName "dx_MV1GetFrameName" int, int
	#cfunc global MV1GetFrameName2 "dx_MV1GetFrameName2" int, int, int
	#cfunc global MV1GetFrameParent "dx_MV1GetFrameParent" int, int
	#cfunc global MV1GetFrameChildNum "dx_MV1GetFrameChildNum" int
	#cfunc global MV1GetFrameChildNum_1 "dx_MV1GetFrameChildNum" int, int
	#cfunc global MV1GetFrameChild "dx_MV1GetFrameChild" int
	#cfunc global MV1GetFrameChild_1 "dx_MV1GetFrameChild" int, int
	#cfunc global MV1GetFrameChild_2 "dx_MV1GetFrameChild" int, int, int
	#cfuncst global VECTOR MV1GetFramePosition "dx_MV1GetFramePosition" int, int
	#cfuncst global VECTOR_D MV1GetFramePositionD "dx_MV1GetFramePositionD" int, int
	#cfuncst global MATRIX MV1GetFrameBaseLocalMatrix "dx_MV1GetFrameBaseLocalMatrix" int, int
	#cfuncst global MV1GetFrameBaseLocalMatrixD "dx_MV1GetFrameBaseLocalMatrixD" 128, int, int
	#cfuncst global MATRIX MV1GetFrameLocalMatrix "dx_MV1GetFrameLocalMatrix" int, int
	#cfuncst global MV1GetFrameLocalMatrixD "dx_MV1GetFrameLocalMatrixD" 128, int, int
	#cfuncst global MATRIX MV1GetFrameLocalWorldMatrix "dx_MV1GetFrameLocalWorldMatrix" int, int
	#cfuncst global MV1GetFrameLocalWorldMatrixD "dx_MV1GetFrameLocalWorldMatrixD" 128, int, int
	#func global MV1SetFrameUserLocalMatrix "dx_MV1SetFrameUserLocalMatrix" int, int, MATRIX
	#func global MV1SetFrameUserLocalMatrixD "dx_MV1SetFrameUserLocalMatrixD" int, int, MATRIX_D
	#func global MV1ResetFrameUserLocalMatrix "dx_MV1ResetFrameUserLocalMatrix" int, int
	#func global MV1SetFrameUserLocalWorldMatrix "dx_MV1SetFrameUserLocalWorldMatrix" int, int, MATRIX
	#func global MV1SetFrameUserLocalWorldMatrixD "dx_MV1SetFrameUserLocalWorldMatrixD" int, int, MATRIX_D
	#func global MV1ResetFrameUserLocalWorldMatrix "dx_MV1ResetFrameUserLocalWorldMatrix" int, int
	#cfuncst global VECTOR MV1GetFrameMaxVertexLocalPosition "dx_MV1GetFrameMaxVertexLocalPosition" int, int
	#cfuncst global VECTOR_D MV1GetFrameMaxVertexLocalPositionD "dx_MV1GetFrameMaxVertexLocalPositionD" int, int
	#cfuncst global VECTOR MV1GetFrameMinVertexLocalPosition "dx_MV1GetFrameMinVertexLocalPosition" int, int
	#cfuncst global VECTOR_D MV1GetFrameMinVertexLocalPositionD "dx_MV1GetFrameMinVertexLocalPositionD" int, int
	#cfuncst global VECTOR MV1GetFrameAvgVertexLocalPosition "dx_MV1GetFrameAvgVertexLocalPosition" int, int
	#cfuncst global VECTOR_D MV1GetFrameAvgVertexLocalPositionD "dx_MV1GetFrameAvgVertexLocalPositionD" int, int
	#cfunc global MV1GetFrameVertexNum "dx_MV1GetFrameVertexNum" int, int
	#cfunc global MV1GetFrameTriangleNum "dx_MV1GetFrameTriangleNum" int, int
	#cfunc global MV1GetFrameMeshNum "dx_MV1GetFrameMeshNum" int, int
	#cfunc global MV1GetFrameMesh "dx_MV1GetFrameMesh" int, int, int
	#func global MV1SetFrameVisible "dx_MV1SetFrameVisible" int, int, int
	#cfunc global MV1GetFrameVisible "dx_MV1GetFrameVisible" int, int
	#func global MV1SetFrameDifColorScale "dx_MV1SetFrameDifColorScale" int, int, COLOR_F
	#func global MV1SetFrameSpcColorScale "dx_MV1SetFrameSpcColorScale" int, int, COLOR_F
	#func global MV1SetFrameEmiColorScale "dx_MV1SetFrameEmiColorScale" int, int, COLOR_F
	#func global MV1SetFrameAmbColorScale "dx_MV1SetFrameAmbColorScale" int, int, COLOR_F
	#cfuncst global COLOR_F MV1GetFrameDifColorScale "dx_MV1GetFrameDifColorScale" int, int
	#cfuncst global COLOR_F MV1GetFrameSpcColorScale "dx_MV1GetFrameSpcColorScale" int, int
	#cfuncst global COLOR_F MV1GetFrameEmiColorScale "dx_MV1GetFrameEmiColorScale" int, int
	#cfuncst global COLOR_F MV1GetFrameAmbColorScale "dx_MV1GetFrameAmbColorScale" int, int
	#cfunc global MV1GetFrameSemiTransState "dx_MV1GetFrameSemiTransState" int, int
	#func global MV1SetFrameOpacityRate "dx_MV1SetFrameOpacityRate" int, int, float
	#cfuncf global MV1GetFrameOpacityRate "dx_MV1GetFrameOpacityRate" int, int
	#func global MV1SetFrameBaseVisible "dx_MV1SetFrameBaseVisible" int, int, int
	#cfunc global MV1GetFrameBaseVisible "dx_MV1GetFrameBaseVisible" int, int
	#func global MV1SetFrameTextureAddressTransform "dx_MV1SetFrameTextureAddressTransform" int, int, float, float, float, float, float, float, float
	#func global MV1SetFrameTextureAddressTransformMatrix "dx_MV1SetFrameTextureAddressTransformMatrix" int, int, MATRIX
	#func global MV1ResetFrameTextureAddressTransform "dx_MV1ResetFrameTextureAddressTransform" int, int
	#cfunc global MV1GetMeshNum "dx_MV1GetMeshNum" int
	#cfunc global MV1GetMeshMaterial "dx_MV1GetMeshMaterial" int, int
	#cfunc global MV1GetMeshVertexNum "dx_MV1GetMeshVertexNum" int, int
	#cfunc global MV1GetMeshTriangleNum "dx_MV1GetMeshTriangleNum" int, int
	#func global MV1SetMeshVisible "dx_MV1SetMeshVisible" int, int, int
	#cfunc global MV1GetMeshVisible "dx_MV1GetMeshVisible" int, int
	#func global MV1SetMeshDifColorScale "dx_MV1SetMeshDifColorScale" int, int, COLOR_F
	#func global MV1SetMeshSpcColorScale "dx_MV1SetMeshSpcColorScale" int, int, COLOR_F
	#func global MV1SetMeshEmiColorScale "dx_MV1SetMeshEmiColorScale" int, int, COLOR_F
	#func global MV1SetMeshAmbColorScale "dx_MV1SetMeshAmbColorScale" int, int, COLOR_F
	#cfuncst global COLOR_F MV1GetMeshDifColorScale "dx_MV1GetMeshDifColorScale" int, int
	#cfuncst global COLOR_F MV1GetMeshSpcColorScale "dx_MV1GetMeshSpcColorScale" int, int
	#cfuncst global COLOR_F MV1GetMeshEmiColorScale "dx_MV1GetMeshEmiColorScale" int, int
	#cfuncst global COLOR_F MV1GetMeshAmbColorScale "dx_MV1GetMeshAmbColorScale" int, int
	#func global MV1SetMeshOpacityRate "dx_MV1SetMeshOpacityRate" int, int, float
	#cfuncf global MV1GetMeshOpacityRate "dx_MV1GetMeshOpacityRate" int, int
	#func global MV1SetMeshDrawBlendMode "dx_MV1SetMeshDrawBlendMode" int, int, int
	#func global MV1SetMeshDrawBlendParam "dx_MV1SetMeshDrawBlendParam" int, int, int
	#cfunc global MV1GetMeshDrawBlendMode "dx_MV1GetMeshDrawBlendMode" int, int
	#cfunc global MV1GetMeshDrawBlendParam "dx_MV1GetMeshDrawBlendParam" int, int
	#func global MV1SetMeshBaseVisible "dx_MV1SetMeshBaseVisible" int, int, int
	#cfunc global MV1GetMeshBaseVisible "dx_MV1GetMeshBaseVisible" int, int
	#func global MV1SetMeshBackCulling "dx_MV1SetMeshBackCulling" int, int, int
	#cfunc global MV1GetMeshBackCulling "dx_MV1GetMeshBackCulling" int, int
	#cfuncst global VECTOR MV1GetMeshMaxPosition "dx_MV1GetMeshMaxPosition" int, int
	#cfuncst global VECTOR MV1GetMeshMinPosition "dx_MV1GetMeshMinPosition" int, int
	#cfunc global MV1GetMeshTListNum "dx_MV1GetMeshTListNum" int, int
	#cfunc global MV1GetMeshTList "dx_MV1GetMeshTList" int, int, int
	#cfunc global MV1GetMeshSemiTransState "dx_MV1GetMeshSemiTransState" int, int
	#func global MV1SetMeshUseVertDifColor "dx_MV1SetMeshUseVertDifColor" int, int, int
	#func global MV1SetMeshUseVertSpcColor "dx_MV1SetMeshUseVertSpcColor" int, int, int
	#cfunc global MV1GetMeshUseVertDifColor "dx_MV1GetMeshUseVertDifColor" int, int
	#cfunc global MV1GetMeshUseVertSpcColor "dx_MV1GetMeshUseVertSpcColor" int, int
	#cfunc global MV1GetMeshShapeFlag "dx_MV1GetMeshShapeFlag" int, int
	#cfunc global MV1GetShapeNum "dx_MV1GetShapeNum" int
	#cfunc global MV1SearchShape "dx_MV1SearchShape" int, wstr
	#cfunc global MV1GetShapeName "dx_MV1GetShapeName" int, int
	#cfunc global MV1GetShapeTargetMeshNum "dx_MV1GetShapeTargetMeshNum" int, int
	#cfunc global MV1GetShapeTargetMesh "dx_MV1GetShapeTargetMesh" int, int, int
	#func global MV1SetShapeRate "dx_MV1SetShapeRate" int, int, float
	#func global MV1SetShapeRate_1 "dx_MV1SetShapeRate" int, int, float, int
	#cfuncf global MV1GetShapeRate "dx_MV1GetShapeRate" int, int
	#cfuncf global MV1GetShapeApplyRate "dx_MV1GetShapeApplyRate" int, int
	#cfunc global MV1GetTriangleListNum "dx_MV1GetTriangleListNum" int
	#cfunc global MV1GetTriangleListVertexType "dx_MV1GetTriangleListVertexType" int, int
	#cfunc global MV1GetTriangleListPolygonNum "dx_MV1GetTriangleListPolygonNum" int, int
	#cfunc global MV1GetTriangleListVertexNum "dx_MV1GetTriangleListVertexNum" int, int
	#cfunc global MV1GetTriangleListLocalWorldMatrixNum "dx_MV1GetTriangleListLocalWorldMatrixNum" int, int
	#cfuncst global MATRIX MV1GetTriangleListLocalWorldMatrix "dx_MV1GetTriangleListLocalWorldMatrix" int, int, int
	#cfunc global MV1GetTriangleListPolygonVertexPosition "dx_MV1GetTriangleListPolygonVertexPosition" int, int, int, int, var, int, var
	#cfunc global MV1GetTriangleListUseMaterial "dx_MV1GetTriangleListUseMaterial" int, int
	#func global MV1SetupCollInfo "dx_MV1SetupCollInfo" int
	#func global MV1SetupCollInfo_1 "dx_MV1SetupCollInfo" int, int
	#func global MV1SetupCollInfo_2 "dx_MV1SetupCollInfo" int, int, int
	#func global MV1SetupCollInfo_3 "dx_MV1SetupCollInfo" int, int, int, int
	#func global MV1SetupCollInfo_4 "dx_MV1SetupCollInfo" int, int, int, int, int
	#func global MV1SetupCollInfo_5 "dx_MV1SetupCollInfo" int, int, int, int, int, int
	#cfunc global MV1TerminateCollInfo "dx_MV1TerminateCollInfo" int
	#cfunc global MV1TerminateCollInfo_1 "dx_MV1TerminateCollInfo" int, int
	#cfunc global MV1TerminateCollInfo_2 "dx_MV1TerminateCollInfo" int, int, int
	#cfunc global MV1RefreshCollInfo "dx_MV1RefreshCollInfo" int
	#cfunc global MV1RefreshCollInfo_1 "dx_MV1RefreshCollInfo" int, int
	#cfunc global MV1RefreshCollInfo_2 "dx_MV1RefreshCollInfo" int, int, int
	#cfuncst global MV1CollCheck_Line "dx_MV1CollCheck_Line" 100, int, int, var, var
	#cfuncst global MV1CollCheck_Line_1 "dx_MV1CollCheck_Line" 100, int, int, var, var, int
	#cfuncst global MV1CollCheck_LineDim "dx_MV1CollCheck_LineDim" 8, int, int, var, var
	#cfuncst global MV1CollCheck_LineDim_1 "dx_MV1CollCheck_LineDim" 8, int, int, var, var, int
	#cfuncst global MV1CollCheck_Sphere "dx_MV1CollCheck_Sphere" 8, int, int, var, float
	#cfuncst global MV1CollCheck_Sphere_1 "dx_MV1CollCheck_Sphere" 8, int, int, var, float, int
	#cfuncst global MV1CollCheck_Capsule "dx_MV1CollCheck_Capsule" 8, int, int, var, var, float
	#cfuncst global MV1CollCheck_Capsule_1 "dx_MV1CollCheck_Capsule" 8, int, int, var, var, float, int
	#cfuncst global MV1CollCheck_Triangle "dx_MV1CollCheck_Triangle" 8, int, int, var, var, var
	#cfuncst global MV1CollCheck_Triangle_1 "dx_MV1CollCheck_Triangle" 8, int, int, var, var, var, int
	#cfuncst global MV1CollCheck_GetResultPoly "dx_MV1CollCheck_GetResultPoly" 100, var, int
	#cfunc global MV1CollResultPolyDimTerminate "dx_MV1CollResultPolyDimTerminate" MV1_COLL_RESULT_POLY_DIM
	#func global MV1SetupReferenceMesh "dx_MV1SetupReferenceMesh" int, int, int
	#func global MV1SetupReferenceMesh_1 "dx_MV1SetupReferenceMesh" int, int, int, int
	#func global MV1SetupReferenceMesh_2 "dx_MV1SetupReferenceMesh" int, int, int, int, int
	#cfunc global MV1TerminateReferenceMesh "dx_MV1TerminateReferenceMesh" int, int, int
	#cfunc global MV1TerminateReferenceMesh_1 "dx_MV1TerminateReferenceMesh" int, int, int, int
	#cfunc global MV1TerminateReferenceMesh_2 "dx_MV1TerminateReferenceMesh" int, int, int, int, int
	#cfunc global MV1RefreshReferenceMesh "dx_MV1RefreshReferenceMesh" int, int, int
	#cfunc global MV1RefreshReferenceMesh_1 "dx_MV1RefreshReferenceMesh" int, int, int, int
	#cfunc global MV1RefreshReferenceMesh_2 "dx_MV1RefreshReferenceMesh" int, int, int, int, int

	; === 3Dカメラ ===
	#func global SetCameraNearFar "dx_SetCameraNearFar" float, float
	#func global SetCameraNearFarD "dx_SetCameraNearFarD" double, double
	#func global SetCameraPositionAndTarget_UpVecY "dx_SetCameraPositionAndTarget_UpVecY" VECTOR, VECTOR
	#func global SetCameraPositionAndTarget_UpVecYD "dx_SetCameraPositionAndTarget_UpVecYD" VECTOR_D, VECTOR_D
	#func global SetCameraPositionAndTargetAndUpVec "dx_SetCameraPositionAndTargetAndUpVec" VECTOR, VECTOR, VECTOR
	#func global SetCameraPositionAndTargetAndUpVecD "dx_SetCameraPositionAndTargetAndUpVecD" VECTOR_D, VECTOR_D, VECTOR_D
	#func global SetCameraPositionAndAngle "dx_SetCameraPositionAndAngle" VECTOR, float, float, float
	#func global SetCameraPositionAndAngleD "dx_SetCameraPositionAndAngleD" VECTOR_D, double, double, double
	#func global SetCameraViewMatrix "dx_SetCameraViewMatrix" MATRIX
	#func global SetCameraViewMatrixD "dx_SetCameraViewMatrixD" MATRIX_D
	#func global SetCameraDotAspect "dx_SetCameraDotAspect" float
	#func global SetCameraDotAspectD "dx_SetCameraDotAspectD" double
	#cfuncf global GetCameraNear "dx_GetCameraNear"
	#cfuncf global GetCameraFar "dx_GetCameraFar"
	#cfuncst global VECTOR GetCameraPosition "dx_GetCameraPosition"
	#cfuncst global VECTOR_D GetCameraPositionD "dx_GetCameraPositionD"
	#cfuncst global VECTOR GetCameraTarget "dx_GetCameraTarget"
	#cfuncst global VECTOR_D GetCameraTargetD "dx_GetCameraTargetD"
	#cfuncst global VECTOR GetCameraUpVector "dx_GetCameraUpVector"
	#cfuncst global VECTOR_D GetCameraUpVectorD "dx_GetCameraUpVectorD"
	#cfuncst global VECTOR GetCameraDownVector "dx_GetCameraDownVector"
	#cfuncst global VECTOR_D GetCameraDownVectorD "dx_GetCameraDownVectorD"
	#cfuncst global VECTOR GetCameraRightVector "dx_GetCameraRightVector"
	#cfuncst global VECTOR_D GetCameraRightVectorD "dx_GetCameraRightVectorD"
	#cfuncst global VECTOR GetCameraLeftVector "dx_GetCameraLeftVector"
	#cfuncst global VECTOR_D GetCameraLeftVectorD "dx_GetCameraLeftVectorD"
	#cfuncst global VECTOR GetCameraFrontVector "dx_GetCameraFrontVector"
	#cfuncst global VECTOR_D GetCameraFrontVectorD "dx_GetCameraFrontVectorD"
	#cfuncst global VECTOR GetCameraBackVector "dx_GetCameraBackVector"
	#cfuncst global VECTOR_D GetCameraBackVectorD "dx_GetCameraBackVectorD"
	#cfuncf global GetCameraAngleHRotate "dx_GetCameraAngleHRotate"
	#cfuncf global GetCameraAngleVRotate "dx_GetCameraAngleVRotate"
	#cfuncf global GetCameraAngleTRotate "dx_GetCameraAngleTRotate"
	#cfuncst global MATRIX GetCameraViewMatrix "dx_GetCameraViewMatrix"
	#cfuncst global GetCameraViewMatrixD "dx_GetCameraViewMatrixD" 128
	#cfuncst global MATRIX GetCameraBillboardMatrix "dx_GetCameraBillboardMatrix"
	#cfuncst global GetCameraBillboardMatrixD "dx_GetCameraBillboardMatrixD" 128
	#cfuncf global GetCameraFov "dx_GetCameraFov"
	#cfuncf global GetCameraSize "dx_GetCameraSize"
	#cfuncst global MATRIX GetCameraProjectionMatrix "dx_GetCameraProjectionMatrix"
	#cfuncst global GetCameraProjectionMatrixD "dx_GetCameraProjectionMatrixD" 128
	#cfuncf global GetCameraDotAspect "dx_GetCameraDotAspect"
	#cfuncst global MATRIX GetCameraViewportMatrix "dx_GetCameraViewportMatrix"
	#cfuncst global GetCameraViewportMatrixD "dx_GetCameraViewportMatrixD" 128
	#cfuncst global MATRIX GetCameraAPIViewportMatrix "dx_GetCameraAPIViewportMatrix"
	#cfuncst global GetCameraAPIViewportMatrixD "dx_GetCameraAPIViewportMatrixD" 128

	; === 3Dライト ===
	#func global ChangeLightTypeDir "dx_ChangeLightTypeDir" VECTOR
	#func global ChangeLightTypeSpot "dx_ChangeLightTypeSpot" VECTOR, VECTOR, float, float, float, float, float, float
	#func global ChangeLightTypePoint "dx_ChangeLightTypePoint" VECTOR, float, float, float, float
	#cfunc global GetLightType "dx_GetLightType"
	#func global SetLightEnable "dx_SetLightEnable" int
	#cfunc global GetLightEnable "dx_GetLightEnable"
	#func global SetLightDifColor "dx_SetLightDifColor" COLOR_F
	#cfuncst global COLOR_F GetLightDifColor "dx_GetLightDifColor"
	#func global SetLightSpcColor "dx_SetLightSpcColor" COLOR_F
	#cfuncst global COLOR_F GetLightSpcColor "dx_GetLightSpcColor"
	#func global SetLightAmbColor "dx_SetLightAmbColor" COLOR_F
	#cfuncst global COLOR_F GetLightAmbColor "dx_GetLightAmbColor"
	#func global SetLightDirection "dx_SetLightDirection" VECTOR
	#cfuncst global VECTOR GetLightDirection "dx_GetLightDirection"
	#func global SetLightPosition "dx_SetLightPosition" VECTOR
	#cfuncst global VECTOR GetLightPosition "dx_GetLightPosition"
	#func global SetLightRangeAtten "dx_SetLightRangeAtten" float, float, float, float
	#cfunc global GetLightRangeAtten "dx_GetLightRangeAtten" var, var, var, var
	#func global SetLightAngle "dx_SetLightAngle" float, float
	#cfunc global GetLightAngle "dx_GetLightAngle" var, var
	#func global SetLightUseShadowMap "dx_SetLightUseShadowMap" int, int
	#cfunc global CreateDirLightHandle "dx_CreateDirLightHandle" VECTOR
	#cfunc global CreateSpotLightHandle "dx_CreateSpotLightHandle" VECTOR, VECTOR, float, float, float, float, float, float
	#cfunc global CreatePointLightHandle "dx_CreatePointLightHandle" VECTOR, float, float, float, float
	#func global DeleteLightHandle "dx_DeleteLightHandle" int
	#func global DeleteLightHandleAll "dx_DeleteLightHandleAll"
	#func global SetLightTypeHandle "dx_SetLightTypeHandle" int, int
	#func global SetLightEnableHandle "dx_SetLightEnableHandle" int, int
	#func global SetLightDifColorHandle "dx_SetLightDifColorHandle" int, COLOR_F
	#func global SetLightSpcColorHandle "dx_SetLightSpcColorHandle" int, COLOR_F
	#func global SetLightAmbColorHandle "dx_SetLightAmbColorHandle" int, COLOR_F
	#func global SetLightDirectionHandle "dx_SetLightDirectionHandle" int, VECTOR
	#func global SetLightPositionHandle "dx_SetLightPositionHandle" int, VECTOR
	#func global SetLightRangeAttenHandle "dx_SetLightRangeAttenHandle" int, float, float, float, float
	#func global SetLightAngleHandle "dx_SetLightAngleHandle" int, float, float
	#func global SetLightUseShadowMapHandle "dx_SetLightUseShadowMapHandle" int, int, int
	#cfunc global GetLightTypeHandle "dx_GetLightTypeHandle" int
	#cfunc global GetLightEnableHandle "dx_GetLightEnableHandle" int
	#cfuncst global COLOR_F GetLightDifColorHandle "dx_GetLightDifColorHandle" int
	#cfuncst global COLOR_F GetLightSpcColorHandle "dx_GetLightSpcColorHandle" int
	#cfuncst global COLOR_F GetLightAmbColorHandle "dx_GetLightAmbColorHandle" int
	#cfuncst global VECTOR GetLightDirectionHandle "dx_GetLightDirectionHandle" int
	#cfuncst global VECTOR GetLightPositionHandle "dx_GetLightPositionHandle" int
	#cfunc global GetLightRangeAttenHandle "dx_GetLightRangeAttenHandle" int, var, var, var, var
	#cfunc global GetLightAngleHandle "dx_GetLightAngleHandle" int, var, var

	; === 3D数学 ===
	#cfunc global CreateIdentityMatrix "dx_CreateIdentityMatrix" var
	#cfunc global CreateIdentityMatrixD "dx_CreateIdentityMatrixD" var
	#cfunc global CreateLookAtMatrix "dx_CreateLookAtMatrix" var, var, var, var
	#cfunc global CreateLookAtMatrixD "dx_CreateLookAtMatrixD" var, var, var, var
	#cfunc global CreateLookAtMatrix2 "dx_CreateLookAtMatrix2" var, var, double, double
	#cfunc global CreateLookAtMatrix2D "dx_CreateLookAtMatrix2D" var, var, double, double
	#cfunc global CreateLookAtMatrixRH "dx_CreateLookAtMatrixRH" var, var, var, var
	#cfunc global CreateLookAtMatrixRHD "dx_CreateLookAtMatrixRHD" var, var, var, var
	#cfunc global CreatePerspectiveFovMatrix "dx_CreatePerspectiveFovMatrix" var, float, float, float
	#cfunc global CreatePerspectiveFovMatrix_1 "dx_CreatePerspectiveFovMatrix" var, float, float, float, float
	#cfunc global CreatePerspectiveFovMatrixD "dx_CreatePerspectiveFovMatrixD" var, double, double, double
	#cfunc global CreatePerspectiveFovMatrixD_1 "dx_CreatePerspectiveFovMatrixD" var, double, double, double, double
	#cfunc global CreatePerspectiveFovMatrixRH "dx_CreatePerspectiveFovMatrixRH" var, float, float, float
	#cfunc global CreatePerspectiveFovMatrixRH_1 "dx_CreatePerspectiveFovMatrixRH" var, float, float, float, float
	#cfunc global CreatePerspectiveFovMatrixRHD "dx_CreatePerspectiveFovMatrixRHD" var, double, double, double
	#cfunc global CreatePerspectiveFovMatrixRHD_1 "dx_CreatePerspectiveFovMatrixRHD" var, double, double, double, double
	#cfuncst global MATRIX MMult "dx_MMult" MATRIX, MATRIX
	#cfuncst global MMultD "dx_MMultD" 128, var, var
	#cfuncst global MATRIX MScale "dx_MScale" MATRIX, float
	#cfuncst global MScaleD "dx_MScaleD" 128, var, double
	#cfuncst global VECTOR VNorm "dx_VNorm" VECTOR
	#cfuncst global VECTOR_D VNormD "dx_VNormD" var
	#cfuncf global VSize "dx_VSize" VECTOR
	#cfuncst global FLOAT4 QTRot "dx_QTRot" var, float
	#cfuncst global DOUBLE4 QTRotD "dx_QTRotD" var, double

	; === 通信 ===
	#cfunc global ConnectNetWork "dx_ConnectNetWork" var
	#cfunc global ConnectNetWork_1 "dx_ConnectNetWork" var, int
	#cfunc global ConnectNetWork_IPv6 "dx_ConnectNetWork_IPv6" var
	#cfunc global ConnectNetWork_IPv6_1 "dx_ConnectNetWork_IPv6" var, int
	#cfunc global ConnectNetWork_ASync "dx_ConnectNetWork_ASync" var
	#cfunc global ConnectNetWork_ASync_1 "dx_ConnectNetWork_ASync" var, int
	#cfunc global ConnectNetWork_IPv6_ASync "dx_ConnectNetWork_IPv6_ASync" var
	#cfunc global ConnectNetWork_IPv6_ASync_1 "dx_ConnectNetWork_IPv6_ASync" var, int
	#cfunc global PreparationListenNetWork "dx_PreparationListenNetWork"
	#cfunc global PreparationListenNetWork_1 "dx_PreparationListenNetWork" int
	#cfunc global PreparationListenNetWork_IPv6 "dx_PreparationListenNetWork_IPv6"
	#cfunc global PreparationListenNetWork_IPv6_1 "dx_PreparationListenNetWork_IPv6" int
	#func global StopListenNetWork "dx_StopListenNetWork"
	#func global CloseNetWork "dx_CloseNetWork" int
	#cfunc global GetNetWorkAcceptState "dx_GetNetWorkAcceptState" int
	#cfunc global GetNetWorkDataLength "dx_GetNetWorkDataLength" int
	#cfunc global GetNetWorkSendDataLength "dx_GetNetWorkSendDataLength" int
	#cfunc global GetNewAcceptNetWork "dx_GetNewAcceptNetWork"
	#cfunc global GetLostNetWork "dx_GetLostNetWork"
	#func global SetConnectTimeOutWait "dx_SetConnectTimeOutWait" int
	#func global SetUseDXNetWorkProtocol "dx_SetUseDXNetWorkProtocol" int
	#cfunc global GetUseDXNetWorkProtocol "dx_GetUseDXNetWorkProtocol"
	#func global SetNetWorkCloseAfterLostFlag "dx_SetNetWorkCloseAfterLostFlag" int
	#cfunc global GetNetWorkCloseAfterLostFlag "dx_GetNetWorkCloseAfterLostFlag"
	#cfunc global NetWorkRecv "dx_NetWorkRecv" int, int, int
	#cfunc global NetWorkRecvToPeek "dx_NetWorkRecvToPeek" int, int, int
	#cfunc global NetWorkRecvBufferClear "dx_NetWorkRecvBufferClear" int
	#cfunc global NetWorkSend "dx_NetWorkSend" int, int, int
	#cfunc global MakeUDPSocket "dx_MakeUDPSocket"
	#cfunc global MakeUDPSocket_1 "dx_MakeUDPSocket" int
	#cfunc global MakeUDPSocket_IPv6 "dx_MakeUDPSocket_IPv6"
	#cfunc global MakeUDPSocket_IPv6_1 "dx_MakeUDPSocket_IPv6" int
	#func global DeleteUDPSocket "dx_DeleteUDPSocket" int
	#cfunc global NetWorkSendUDP "dx_NetWorkSendUDP" int, IPDATA, int, int, int
	#cfunc global NetWorkSendUDP_IPv6 "dx_NetWorkSendUDP_IPv6" int, IPDATA_IPv6, int, int, int
	#cfunc global CheckNetWorkRecvUDP "dx_CheckNetWorkRecvUDP" int

	; === ファイル ===
	#cfunc global LogFileAdd "dx_LogFileAdd" wstr
	#cfunc global LogFileTabAdd "dx_LogFileTabAdd"
	#cfunc global LogFileTabSub "dx_LogFileTabSub"
	#func global SetApplicationLogFileName "dx_SetApplicationLogFileName" wstr
	#func global SetUseDateNameLogFile "dx_SetUseDateNameLogFile" int
	#cfunc global FileRead_open "dx_FileRead_open" wstr
	#cfunc global FileRead_open_1 "dx_FileRead_open" wstr, int
	#cfunc global FileRead_open_mem "dx_FileRead_open_mem" int, int
	#cfunc global FileRead_size "dx_FileRead_size" wstr
	#cfunc global FileRead_size_handle "dx_FileRead_size_handle" int
	#cfunc global FileRead_close "dx_FileRead_close" int
	#cfunc global FileRead_tell "dx_FileRead_tell" int
	#cfunc global FileRead_seek "dx_FileRead_seek" int, int, int
	#cfunc global FileRead_read "dx_FileRead_read" int, int, int
	#cfunc global FileRead_idle_chk "dx_FileRead_idle_chk" int
	#cfunc global FileRead_eof "dx_FileRead_eof" int
	#cfunc global FileRead_set_format "dx_FileRead_set_format" int, int
	#cfunc global FileRead_gets "dx_FileRead_gets" int, int, int
	#cfunc global FileRead_createInfo "dx_FileRead_createInfo" wstr
	#cfunc global FileRead_getInfoNum "dx_FileRead_getInfoNum" int
	#cfunc global FileRead_deleteInfo "dx_FileRead_deleteInfo" int
	#cfunc global FileRead_fullyLoad "dx_FileRead_fullyLoad" wstr
	#cfunc global FileRead_fullyLoad_delete "dx_FileRead_fullyLoad_delete" int
	#cfunc global FileRead_fullyLoad_getImage "dx_FileRead_fullyLoad_getImage" int
	#cfunc global FileRead_fullyLoad_getSize "dx_FileRead_fullyLoad_getSize" int
	#cfunc global ReloadFileGraphAll "dx_ReloadFileGraphAll"
	#cfunc global GetMovieImageSize_File "dx_GetMovieImageSize_File" wstr, var, var
	#cfunc global GetImageSize_File "dx_GetImageSize_File" wstr, var, var
	#cfunc global DXArchivePreLoad "dx_DXArchivePreLoad" wstr
	#cfunc global DXArchivePreLoad_1 "dx_DXArchivePreLoad" wstr, int
	#cfunc global DXArchiveCheckIdle "dx_DXArchiveCheckIdle" wstr
	#cfunc global DXArchiveRelease "dx_DXArchiveRelease" wstr
	#cfunc global DXArchiveCheckFile "dx_DXArchiveCheckFile" wstr, wstr
	#cfunc global DXArchiveSetMemImage "dx_DXArchiveSetMemImage" int, int, wstr
	#cfunc global DXArchiveSetMemImage_1 "dx_DXArchiveSetMemImage" int, int, wstr, int
	#cfunc global DXArchiveSetMemImage_2 "dx_DXArchiveSetMemImage" int, int, wstr, int, int
	#cfunc global DXArchiveReleaseMemImage "dx_DXArchiveReleaseMemImage" int
	#cfunc global Live2D_Model_GetPhysicsFileName "dx_Live2D_Model_GetPhysicsFileName" int
	#cfunc global Live2D_Model_GetPoseFileName "dx_Live2D_Model_GetPoseFileName" int
	#cfunc global Live2D_Model_GetExpressionFileName "dx_Live2D_Model_GetExpressionFileName" int, int
	#cfunc global Live2D_Model_GetMotionFileName "dx_Live2D_Model_GetMotionFileName" int, wstr, int
	#cfunc global Live2D_Model_GetUserDataFile "dx_Live2D_Model_GetUserDataFile" int
	#func global SetDragFileValidFlag "dx_SetDragFileValidFlag" int
	#cfunc global DragFileInfoClear "dx_DragFileInfoClear"
	#cfunc global GetDragFilePath "dx_GetDragFilePath" int
	#cfunc global GetDragFilePath_1 "dx_GetDragFilePath" int, int
	#cfunc global GetDragFileNum "dx_GetDragFileNum"

	; === その他 ===
	#func global SetMenuItemSelectCallBackFunction "dx_SetMenuItemSelectCallBackFunction" int
	#func global SetRestoreShredPoint "dx_SetRestoreShredPoint" int
	#cfunc global GetLastErrorCode "dx_GetLastErrorCode"
	#cfunc global GetLastErrorMessage "dx_GetLastErrorMessage" int, int
	#cfunc global SleepThread "dx_SleepThread" int
	#cfunc global GetNowSysPerformanceCount "dx_GetNowSysPerformanceCount"
	#cfunc global GetSysPerformanceFrequency "dx_GetSysPerformanceFrequency"
	#cfunc global ConvSysPerformanceCountToSeconds "dx_ConvSysPerformanceCountToSeconds" int
	#cfunc global ConvSysPerformanceCountToMilliSeconds "dx_ConvSysPerformanceCountToMilliSeconds" int
	#cfunc global ConvSysPerformanceCountToMicroSeconds "dx_ConvSysPerformanceCountToMicroSeconds" int
	#cfunc global ConvSysPerformanceCountToNanoSeconds "dx_ConvSysPerformanceCountToNanoSeconds" int
	#cfunc global ConvSecondsToSysPerformanceCount "dx_ConvSecondsToSysPerformanceCount" int
	#cfunc global ConvMilliSecondsToSysPerformanceCount "dx_ConvMilliSecondsToSysPerformanceCount" int
	#cfunc global ConvMicroSecondsToSysPerformanceCount "dx_ConvMicroSecondsToSysPerformanceCount" int
	#cfunc global ConvNanoSecondsToSysPerformanceCount "dx_ConvNanoSecondsToSysPerformanceCount" int
	#cfunc global GetMersenneTwisterRand "dx_GetMersenneTwisterRand"
	#cfunc global CreateRandHandle "dx_CreateRandHandle"
	#cfunc global CreateRandHandle_1 "dx_CreateRandHandle" int
	#func global DeleteRandHandle "dx_DeleteRandHandle" int
	#cfunc global SRandHandle "dx_SRandHandle" int, int
	#cfunc global GetRandHandle "dx_GetRandHandle" int, int
	#cfunc global GetMersenneTwisterRandHandle "dx_GetMersenneTwisterRandHandle" int
	#cfunc global GetBatteryLifePercent "dx_GetBatteryLifePercent"
	#cfunc global GetClipboardText "dx_GetClipboardText" int
	#cfunc global GetClipboardText_1 "dx_GetClipboardText" int, int
	#func global SetClipboardText "dx_SetClipboardText" wstr
	#cfunc global GetPrivateProfileStringDx "dx_GetPrivateProfileStringDx" wstr, wstr, wstr, int, int, wstr
	#cfunc global GetPrivateProfileStringDx_1 "dx_GetPrivateProfileStringDx" wstr, wstr, wstr, int, int, wstr, int
	#cfunc global GetPrivateProfileIntDx "dx_GetPrivateProfileIntDx" wstr, wstr, int, wstr
	#cfunc global GetPrivateProfileIntDx_1 "dx_GetPrivateProfileIntDx" wstr, wstr, int, wstr, int
	#cfunc global GetPrivateProfileStringDxForMem "dx_GetPrivateProfileStringDxForMem" wstr, wstr, wstr, int, int, int, int
	#cfunc global GetPrivateProfileStringDxForMem_1 "dx_GetPrivateProfileStringDxForMem" wstr, wstr, wstr, int, int, int, int, int
	#cfunc global GetPrivateProfileIntDxForMem "dx_GetPrivateProfileIntDxForMem" wstr, wstr, int, int, int
	#cfunc global GetPrivateProfileIntDxForMem_1 "dx_GetPrivateProfileIntDxForMem" wstr, wstr, int, int, int, int
	#cfunc global ErrorLogAdd "dx_ErrorLogAdd" wstr
	#cfunc global ErrorLogTabAdd "dx_ErrorLogTabAdd"
	#cfunc global ErrorLogTabSub "dx_ErrorLogTabSub"
	#func global SetUseTimeStampFlag "dx_SetUseTimeStampFlag" int
	#func global SetOutApplicationSystemLogValidFlag "dx_SetOutApplicationSystemLogValidFlag" int
	#func global SetApplicationLogSaveDirectory "dx_SetApplicationLogSaveDirectory" wstr
	#cfunc global GetLogDrawFlag "dx_GetLogDrawFlag"
	#func global SetLogDrawArea "dx_SetLogDrawArea" int, int, int, int
	#cfunc global putsDx "dx_putsDx" wstr
	#cfunc global putsDx_1 "dx_putsDx" wstr, int
	#cfunc global clsDx "dx_clsDx"
	#cfunc global setPrintColorDx "dx_setPrintColorDx" int
	#cfunc global setPrintColorDx_1 "dx_setPrintColorDx" int, int
	#func global SetUseASyncLoadFlag "dx_SetUseASyncLoadFlag" int
	#cfunc global GetUseASyncLoadFlag "dx_GetUseASyncLoadFlag"
	#cfunc global CheckHandleASyncLoad "dx_CheckHandleASyncLoad" int
	#cfunc global GetHandleASyncLoadResult "dx_GetHandleASyncLoadResult" int
	#func global SetASyncLoadFinishDeleteFlag "dx_SetASyncLoadFinishDeleteFlag" int
	#cfunc global WaitHandleASyncLoad "dx_WaitHandleASyncLoad" int
	#cfunc global WaitHandleASyncLoadAll "dx_WaitHandleASyncLoadAll"
	#cfunc global GetASyncLoadNum "dx_GetASyncLoadNum"
	#func global SetASyncLoadThreadNum "dx_SetASyncLoadThreadNum" int
	#func global SetDeleteHandleFlag "dx_SetDeleteHandleFlag" int, var
	#cfunc global GetHandleNum "dx_GetHandleNum" int
	#cfunc global GetMaxHandleNum "dx_GetMaxHandleNum" int
	#cfunc global DumpHandleInfo "dx_DumpHandleInfo" int
	#cfunc global DxAlloc "dx_DxAlloc" int
	#cfunc global DxAlloc_1 "dx_DxAlloc" int, wstr
	#cfunc global DxAlloc_2 "dx_DxAlloc" int, wstr, int
	#cfunc global DxAllocAligned "dx_DxAllocAligned" int, int
	#cfunc global DxAllocAligned_1 "dx_DxAllocAligned" int, int, wstr
	#cfunc global DxAllocAligned_2 "dx_DxAllocAligned" int, int, wstr, int
	#cfunc global DxCalloc "dx_DxCalloc" int
	#cfunc global DxCalloc_1 "dx_DxCalloc" int, wstr
	#cfunc global DxCalloc_2 "dx_DxCalloc" int, wstr, int
	#cfunc global DxCallocAligned "dx_DxCallocAligned" int, int
	#cfunc global DxCallocAligned_1 "dx_DxCallocAligned" int, int, wstr
	#cfunc global DxCallocAligned_2 "dx_DxCallocAligned" int, int, wstr, int
	#cfunc global DxRealloc "dx_DxRealloc" int, int
	#cfunc global DxRealloc_1 "dx_DxRealloc" int, int, wstr
	#cfunc global DxRealloc_2 "dx_DxRealloc" int, int, wstr, int
	#cfunc global DxReallocAligned "dx_DxReallocAligned" int, int, int
	#cfunc global DxReallocAligned_1 "dx_DxReallocAligned" int, int, int, wstr
	#cfunc global DxReallocAligned_2 "dx_DxReallocAligned" int, int, int, wstr, int
	#func global DxFree "dx_DxFree" int
	#cfunc global DxSetAllocSizeTrap "dx_DxSetAllocSizeTrap" int
	#cfunc global DxSetAllocPrintFlag "dx_DxSetAllocPrintFlag" int
	#cfunc global DxGetAllocSize "dx_DxGetAllocSize"
	#cfunc global DxGetAllocNum "dx_DxGetAllocNum"
	#func global DxDumpAlloc "dx_DxDumpAlloc"
	#func global DxDrawAlloc "dx_DxDrawAlloc" int, int, int, int
	#cfunc global DxErrorCheckAlloc "dx_DxErrorCheckAlloc"
	#cfunc global DxSetAllocSizeOutFlag "dx_DxSetAllocSizeOutFlag" int
	#cfunc global DxSetAllocMemoryErrorCheckFlag "dx_DxSetAllocMemoryErrorCheckFlag" int
	#cfunc global GetCharBytes "dx_GetCharBytes" int, int
	#cfunc global ConvertStringCharCodeFormat "dx_ConvertStringCharCodeFormat" int, int, int, int
	#func global SetUseCharCodeFormat "dx_SetUseCharCodeFormat" int
	#cfunc global GetUseCharCodeFormat "dx_GetUseCharCodeFormat"
	#cfunc global Get_wchar_t_CharCodeFormat "dx_Get_wchar_t_CharCodeFormat"
	#func global strcpyDx "dx_strcpyDx" int, wstr
	#func global strcpy_sDx "dx_strcpy_sDx" int, int, wstr
	#func global strpcpyDx "dx_strpcpyDx" int, wstr, int
	#func global strpcpy_sDx "dx_strpcpy_sDx" int, int, wstr, int
	#func global strpcpy2Dx "dx_strpcpy2Dx" int, wstr, int
	#func global strpcpy2_sDx "dx_strpcpy2_sDx" int, int, wstr, int
	#func global strncpyDx "dx_strncpyDx" int, wstr, int
	#func global strncpy_sDx "dx_strncpy_sDx" int, int, wstr, int
	#func global strncpy2Dx "dx_strncpy2Dx" int, wstr, int
	#func global strncpy2_sDx "dx_strncpy2_sDx" int, int, wstr, int
	#func global strrncpyDx "dx_strrncpyDx" int, wstr, int
	#func global strrncpy_sDx "dx_strrncpy_sDx" int, int, wstr, int
	#func global strrncpy2Dx "dx_strrncpy2Dx" int, wstr, int
	#func global strrncpy2_sDx "dx_strrncpy2_sDx" int, int, wstr, int
	#func global strpncpyDx "dx_strpncpyDx" int, wstr, int, int
	#func global strpncpy_sDx "dx_strpncpy_sDx" int, int, wstr, int, int
	#func global strpncpy2Dx "dx_strpncpy2Dx" int, wstr, int, int
	#func global strpncpy2_sDx "dx_strpncpy2_sDx" int, int, wstr, int, int
	#func global strcatDx "dx_strcatDx" int, wstr
	#func global strcat_sDx "dx_strcat_sDx" int, int, wstr
	#cfunc global strlenDx "dx_strlenDx" wstr
	#cfunc global strlen2Dx "dx_strlen2Dx" wstr
	#cfunc global strcmpDx "dx_strcmpDx" wstr, wstr
	#cfunc global stricmpDx "dx_stricmpDx" wstr, wstr
	#cfunc global strncmpDx "dx_strncmpDx" wstr, wstr, int
	#cfunc global strncmp2Dx "dx_strncmp2Dx" wstr, wstr, int
	#cfunc global strpncmpDx "dx_strpncmpDx" wstr, wstr, int, int
	#cfunc global strpncmp2Dx "dx_strpncmp2Dx" wstr, wstr, int, int
	#cfunc global strgetchrDx "dx_strgetchrDx" wstr, int, var
	#cfunc global strgetchr2Dx "dx_strgetchr2Dx" wstr, int, var
	#cfunc global strputchrDx "dx_strputchrDx" int, int, int
	#cfunc global strputchr2Dx "dx_strputchr2Dx" int, int, int
	#cfunc global strposDx "dx_strposDx" wstr, int
	#cfunc global strpos2Dx "dx_strpos2Dx" wstr, int
	#cfunc global strstrDx "dx_strstrDx" wstr, wstr
	#cfunc global strstr2Dx "dx_strstr2Dx" wstr, wstr
	#cfunc global strrstrDx "dx_strrstrDx" wstr, wstr
	#cfunc global strrstr2Dx "dx_strrstr2Dx" wstr, wstr
	#cfunc global strchrDx "dx_strchrDx" wstr, int
	#cfunc global strchr2Dx "dx_strchr2Dx" wstr, int
	#cfunc global strrchrDx "dx_strrchrDx" wstr, int
	#cfunc global strrchr2Dx "dx_strrchr2Dx" wstr, int
	#cfunc global struprDx "dx_struprDx" int
	#cfunc global itoaDx "dx_itoaDx" int, int, int
	#cfunc global itoa_sDx "dx_itoa_sDx" int, int, int, int
	#cfunc global atoiDx "dx_atoiDx" wstr
	#cfunc global ProcessNetMessage "dx_ProcessNetMessage"
	#cfunc global ProcessNetMessage_1 "dx_ProcessNetMessage" int
	#func global SetUseDXProtocol "dx_SetUseDXProtocol" int
	#cfunc global GetUseDXProtocol "dx_GetUseDXProtocol"
	#cfunc global GetOneChar "dx_GetOneChar" int, int
	#cfunc global GetOneCharWait "dx_GetOneCharWait" int, int
	#cfunc global GetCtrlCodeCmp "dx_GetCtrlCodeCmp" int
	#func global SetUseIMEFlag "dx_SetUseIMEFlag" int
	#cfunc global GetUseIMEFlag "dx_GetUseIMEFlag"
	#cfunc global GetStringPoint "dx_GetStringPoint" wstr, int
	#cfunc global GetStringPoint2 "dx_GetStringPoint2" wstr, int
	#cfunc global GetStringLength "dx_GetStringLength" wstr
	#cfunc global GetObtainsStringCharPosition "dx_GetObtainsStringCharPosition" int, int, int, wstr, int, var, var, int, var
	#cfunc global GetObtainsStringCharPosition_CharClip "dx_GetObtainsStringCharPosition_CharClip" int, int, int, wstr, int, var, var, int, var
	#cfunc global GetObtainsStringCharPosition_WordClip "dx_GetObtainsStringCharPosition_WordClip" int, int, int, wstr, int, var, var, int, var
	#cfunc global GetStreamFunctionDefault "dx_GetStreamFunctionDefault"
	#cfunc global ConvertFullPath "dx_ConvertFullPath" wstr, int
	#cfunc global ConvertFullPath_1 "dx_ConvertFullPath" wstr, int, wstr
	#func global DeleteSharingGraph "dx_DeleteSharingGraph" int
	#cfunc global FillGraph "dx_FillGraph" int, int, int, int
	#cfunc global FillGraph_1 "dx_FillGraph" int, int, int, int, int
	#cfunc global FillRectGraph "dx_FillRectGraph" int, int, int, int, int, int, int, int
	#cfunc global FillRectGraph_1 "dx_FillRectGraph" int, int, int, int, int, int, int, int, int
	#cfunc global MakeShadowMap "dx_MakeShadowMap" int, int
	#func global DeleteShadowMap "dx_DeleteShadowMap" int
	#func global SetShadowMapLightDirection "dx_SetShadowMapLightDirection" int, var
	#cfunc global ShadowMap_DrawSetup "dx_ShadowMap_DrawSetup" int
	#cfunc global ShadowMap_DrawEnd "dx_ShadowMap_DrawEnd"
	#func global SetUseShadowMap "dx_SetUseShadowMap" int, int
	#func global SetShadowMapDrawArea "dx_SetShadowMapDrawArea" int, var, var
	#func global ResetShadowMapDrawArea "dx_ResetShadowMapDrawArea" int
	#func global SetShadowMapAdjustDepth "dx_SetShadowMapAdjustDepth" int, float
	#cfunc global GetShadowMapViewProjectionMatrix "dx_GetShadowMapViewProjectionMatrix" int, var
	#cfunc global TestDrawShadowMap "dx_TestDrawShadowMap" int, int, int, int, int
	#cfunc global LoadBmpToGraph "dx_LoadBmpToGraph" wstr, int, int
	#cfunc global LoadBmpToGraph_1 "dx_LoadBmpToGraph" wstr, int, int, int
	#cfunc global LoadReverseGraph "dx_LoadReverseGraph" wstr
	#cfunc global LoadReverseGraph_1 "dx_LoadReverseGraph" wstr, int
	#cfunc global LoadDivGraph "dx_LoadDivGraph" wstr, int, int, int, int, int, int, var
	#cfunc global LoadDivGraph_1 "dx_LoadDivGraph" wstr, int, int, int, int, int, int, var, int
	#cfunc global LoadDivGraph_2 "dx_LoadDivGraph" wstr, int, int, int, int, int, int, var, int, int
	#cfunc global LoadDivGraph_3 "dx_LoadDivGraph" wstr, int, int, int, int, int, int, var, int, int, int
	#cfunc global LoadDivGraphF "dx_LoadDivGraphF" wstr, int, int, int, float, float, int, var
	#cfunc global LoadDivGraphF_1 "dx_LoadDivGraphF" wstr, int, int, int, float, float, int, var, int
	#cfunc global LoadDivGraphF_2 "dx_LoadDivGraphF" wstr, int, int, int, float, float, int, var, int, float
	#cfunc global LoadDivGraphF_3 "dx_LoadDivGraphF" wstr, int, int, int, float, float, int, var, int, float, float
	#cfunc global LoadDivBmpToGraph "dx_LoadDivBmpToGraph" wstr, int, int, int, int, int, int, var, int, int
	#cfunc global LoadDivBmpToGraph_1 "dx_LoadDivBmpToGraph" wstr, int, int, int, int, int, int, var, int, int, int
	#cfunc global LoadDivBmpToGraph_2 "dx_LoadDivBmpToGraph" wstr, int, int, int, int, int, int, var, int, int, int, int
	#cfunc global LoadDivBmpToGraphF "dx_LoadDivBmpToGraphF" wstr, int, int, int, float, float, int, var, int, int
	#cfunc global LoadDivBmpToGraphF_1 "dx_LoadDivBmpToGraphF" wstr, int, int, int, float, float, int, var, int, int, float
	#cfunc global LoadDivBmpToGraphF_2 "dx_LoadDivBmpToGraphF" wstr, int, int, int, float, float, int, var, int, int, float, float
	#cfunc global LoadReverseDivGraph "dx_LoadReverseDivGraph" wstr, int, int, int, int, int, int, var
	#cfunc global LoadReverseDivGraph_1 "dx_LoadReverseDivGraph" wstr, int, int, int, int, int, int, var, int
	#cfunc global LoadReverseDivGraph_2 "dx_LoadReverseDivGraph" wstr, int, int, int, int, int, int, var, int, int
	#cfunc global LoadReverseDivGraph_3 "dx_LoadReverseDivGraph" wstr, int, int, int, int, int, int, var, int, int, int
	#cfunc global LoadReverseDivGraphF "dx_LoadReverseDivGraphF" wstr, int, int, int, float, float, int, var
	#cfunc global LoadReverseDivGraphF_1 "dx_LoadReverseDivGraphF" wstr, int, int, int, float, float, int, var, int
	#cfunc global LoadReverseDivGraphF_2 "dx_LoadReverseDivGraphF" wstr, int, int, int, float, float, int, var, int, float
	#cfunc global LoadReverseDivGraphF_3 "dx_LoadReverseDivGraphF" wstr, int, int, int, float, float, int, var, int, float, float
	#cfunc global CreateDivGraphFromMem "dx_CreateDivGraphFromMem" int, int, int, int, int, int, int, int, var
	#cfunc global CreateDivGraphFromMem_1 "dx_CreateDivGraphFromMem" int, int, int, int, int, int, int, int, var, int
	#cfunc global CreateDivGraphFromMem_2 "dx_CreateDivGraphFromMem" int, int, int, int, int, int, int, int, var, int, int
	#cfunc global CreateDivGraphFromMem_3 "dx_CreateDivGraphFromMem" int, int, int, int, int, int, int, int, var, int, int, int
	#cfunc global CreateDivGraphFromMem_4 "dx_CreateDivGraphFromMem" int, int, int, int, int, int, int, int, var, int, int, int, int
	#cfunc global CreateDivGraphFFromMem "dx_CreateDivGraphFFromMem" int, int, int, int, int, float, float, int, var
	#cfunc global CreateDivGraphFFromMem_1 "dx_CreateDivGraphFFromMem" int, int, int, int, int, float, float, int, var, int
	#cfunc global CreateDivGraphFFromMem_2 "dx_CreateDivGraphFFromMem" int, int, int, int, int, float, float, int, var, int, int
	#cfunc global CreateDivGraphFFromMem_3 "dx_CreateDivGraphFFromMem" int, int, int, int, int, float, float, int, var, int, int, int
	#cfunc global CreateDivGraphFFromMem_4 "dx_CreateDivGraphFFromMem" int, int, int, int, int, float, float, int, var, int, int, int, int
	#cfunc global ReCreateDivGraphFromMem "dx_ReCreateDivGraphFromMem" int, int, int, int, int, int, int, int, var
	#cfunc global ReCreateDivGraphFromMem_1 "dx_ReCreateDivGraphFromMem" int, int, int, int, int, int, int, int, var, int
	#cfunc global ReCreateDivGraphFromMem_2 "dx_ReCreateDivGraphFromMem" int, int, int, int, int, int, int, int, var, int, int
	#cfunc global ReCreateDivGraphFromMem_3 "dx_ReCreateDivGraphFromMem" int, int, int, int, int, int, int, int, var, int, int, int
	#cfunc global ReCreateDivGraphFromMem_4 "dx_ReCreateDivGraphFromMem" int, int, int, int, int, int, int, int, var, int, int, int, int
	#cfunc global ReCreateDivGraphFFromMem "dx_ReCreateDivGraphFFromMem" int, int, int, int, int, float, float, int, var
	#cfunc global ReCreateDivGraphFFromMem_1 "dx_ReCreateDivGraphFFromMem" int, int, int, int, int, float, float, int, var, int
	#cfunc global ReCreateDivGraphFFromMem_2 "dx_ReCreateDivGraphFFromMem" int, int, int, int, int, float, float, int, var, int, int
	#cfunc global ReCreateDivGraphFFromMem_3 "dx_ReCreateDivGraphFFromMem" int, int, int, int, int, float, float, int, var, int, int, int
	#cfunc global ReCreateDivGraphFFromMem_4 "dx_ReCreateDivGraphFFromMem" int, int, int, int, int, float, float, int, var, int, int, int, int
	#cfunc global CreateDivGraph "dx_CreateDivGraph" int, int, int, int, int, int, int, int, int, int, var
	#cfunc global CreateDivGraph_1 "dx_CreateDivGraph" int, int, int, int, int, int, int, int, int, int, var, int
	#cfunc global CreateDivGraphF "dx_CreateDivGraphF" int, int, int, int, int, int, int, float, float, int, var
	#cfunc global CreateDivGraphF_1 "dx_CreateDivGraphF" int, int, int, int, int, int, int, float, float, int, var, int
	#cfunc global CreateDivGraphFromSoftImage "dx_CreateDivGraphFromSoftImage" int, int, int, int, int, int, int, var
	#cfunc global CreateDivGraphFFromSoftImage "dx_CreateDivGraphFFromSoftImage" int, int, int, int, float, float, int, var
	#cfunc global ReCreateDivGraphFromSoftImage "dx_ReCreateDivGraphFromSoftImage" int, int, int, int, int, int, int, var
	#cfunc global ReCreateDivGraphFFromSoftImage "dx_ReCreateDivGraphFFromSoftImage" int, int, int, int, float, float, int, var
	#cfunc global ReloadDivGraph "dx_ReloadDivGraph" wstr, int, int, int, int, int, int, var
	#cfunc global ReloadDivGraph_1 "dx_ReloadDivGraph" wstr, int, int, int, int, int, int, var, int
	#cfunc global ReloadDivGraphF "dx_ReloadDivGraphF" wstr, int, int, int, float, float, int, var
	#cfunc global ReloadDivGraphF_1 "dx_ReloadDivGraphF" wstr, int, int, int, float, float, int, var, int
	#cfunc global ReloadReverseGraph "dx_ReloadReverseGraph" wstr, int
	#cfunc global ReloadReverseDivGraph "dx_ReloadReverseDivGraph" wstr, int, int, int, int, int, int, var
	#cfunc global ReloadReverseDivGraphF "dx_ReloadReverseDivGraphF" wstr, int, int, int, float, float, int, var
	#cfunc global SetCreateDivGraphHandle "dx_SetCreateDivGraphHandle" int, var, int
	#cfunc global GetCreateDivGraphHandle "dx_GetCreateDivGraphHandle" int, var
	#cfunc global GetDrawValidGraphCreateFlag "dx_GetDrawValidGraphCreateFlag"
	#func global SetUsePaletteGraphFlag "dx_SetUsePaletteGraphFlag" int
	#func global SetUseAlphaTestGraphCreateFlag "dx_SetUseAlphaTestGraphCreateFlag" int
	#cfunc global GetUseAlphaTestGraphCreateFlag "dx_GetUseAlphaTestGraphCreateFlag"
	#func global SetUseAlphaTestFlag "dx_SetUseAlphaTestFlag" int
	#cfunc global GetUseAlphaTestFlag "dx_GetUseAlphaTestFlag"
	#func global SetCubeMapTextureCreateFlag "dx_SetCubeMapTextureCreateFlag" int
	#cfunc global GetCubeMapTextureCreateFlag "dx_GetCubeMapTextureCreateFlag"
	#func global SetUseNoBlendModeParam "dx_SetUseNoBlendModeParam" int
	#cfunc global GetDrawValidAlphaChannelGraphCreateFlag "dx_GetDrawValidAlphaChannelGraphCreateFlag"
	#cfunc global GetDrawValidFloatTypeGraphCreateFlag "dx_GetDrawValidFloatTypeGraphCreateFlag"
	#cfunc global GetDrawValidGraphCreateZBufferFlag "dx_GetDrawValidGraphCreateZBufferFlag"
	#func global SetCreateDrawValidGraphZBufferBitDepth "dx_SetCreateDrawValidGraphZBufferBitDepth" int
	#cfunc global GetCreateDrawValidGraphZBufferBitDepth "dx_GetCreateDrawValidGraphZBufferBitDepth"
	#func global SetCreateDrawValidGraphMipLevels "dx_SetCreateDrawValidGraphMipLevels" int
	#cfunc global GetCreateDrawValidGraphMipLevels "dx_GetCreateDrawValidGraphMipLevels"
	#func global SetCreateDrawValidGraphChannelNum "dx_SetCreateDrawValidGraphChannelNum" int
	#cfunc global GetCreateDrawValidGraphChannelNum "dx_GetCreateDrawValidGraphChannelNum"
	#func global SetCreateDrawValidGraphMultiSample "dx_SetCreateDrawValidGraphMultiSample" int, int
	#cfunc global GetMultiSampleQuality "dx_GetMultiSampleQuality" int
	#func global SetUseGraphAlphaChannel "dx_SetUseGraphAlphaChannel" int
	#cfunc global GetUseGraphAlphaChannel "dx_GetUseGraphAlphaChannel"
	#func global SetUseAlphaChannelGraphCreateFlag "dx_SetUseAlphaChannelGraphCreateFlag" int
	#cfunc global GetUseAlphaChannelGraphCreateFlag "dx_GetUseAlphaChannelGraphCreateFlag"
	#func global SetUseNotManageTextureFlag "dx_SetUseNotManageTextureFlag" int
	#cfunc global GetUseNotManageTextureFlag "dx_GetUseNotManageTextureFlag"
	#func global SetUsePlatformTextureFormat "dx_SetUsePlatformTextureFormat" int
	#cfunc global GetUsePlatformTextureFormat "dx_GetUsePlatformTextureFormat"
	#func global SetUseDivGraphFlag "dx_SetUseDivGraphFlag" int
	#func global SetUseAlphaImageLoadFlag "dx_SetUseAlphaImageLoadFlag" int
	#func global SetUseMaxTextureSize "dx_SetUseMaxTextureSize" int
	#func global SetUseGraphBaseDataBackup "dx_SetUseGraphBaseDataBackup" int
	#cfunc global GetUseGraphBaseDataBackup "dx_GetUseGraphBaseDataBackup"
	#func global SetUseSystemMemGraphCreateFlag "dx_SetUseSystemMemGraphCreateFlag" int
	#cfunc global GetUseSystemMemGraphCreateFlag "dx_GetUseSystemMemGraphCreateFlag"
	#func global SetUseLoadDivGraphSizeCheckFlag "dx_SetUseLoadDivGraphSizeCheckFlag" int
	#cfunc global GetUseLoadDivGraphSizeCheckFlag "dx_GetUseLoadDivGraphSizeCheckFlag"
	#cfunc global GraphUnLock "dx_GraphUnLock" int
	#func global SetUseGraphZBuffer "dx_SetUseGraphZBuffer" int, int
	#func global SetUseGraphZBuffer_1 "dx_SetUseGraphZBuffer" int, int, int
	#cfunc global CopyGraphZBufferImage "dx_CopyGraphZBufferImage" int, int
	#cfunc global CheckDrawValidGraph "dx_CheckDrawValidGraph" int
	#cfunc global GetMaxGraphTextureSize "dx_GetMaxGraphTextureSize" var, var
	#cfunc global GetValidRestoreShredPoint "dx_GetValidRestoreShredPoint"
	#func global ResetGraphPalette "dx_ResetGraphPalette" int
	#cfunc global BeginAADraw "dx_BeginAADraw"
	#cfunc global EndAADraw "dx_EndAADraw"
	#cfunc global GetDrawMode "dx_GetDrawMode"
	#cfunc global GetDrawBlendMode "dx_GetDrawBlendMode" var, var
	#cfunc global GetDrawCustomBlendMode "dx_GetDrawCustomBlendMode" var, var, var, var, var, var, var, var
	#cfunc global GetDrawAlphaTest "dx_GetDrawAlphaTest" var, var
	#cfunc global GetDrawBright "dx_GetDrawBright" var, var, var
	#cfunc global GetDrawAddColor "dx_GetDrawAddColor" var, var, var
	#func global SetWriteAlphaChannelFlag "dx_SetWriteAlphaChannelFlag" int
	#cfunc global GetWriteAlphaChannelFlag "dx_GetWriteAlphaChannelFlag"
	#cfunc global CheckSeparateAlphaBlendEnable "dx_CheckSeparateAlphaBlendEnable"
	#func global SetIgnoreDrawGraphColor "dx_SetIgnoreDrawGraphColor" int
	#cfunc global GetIgnoreDrawGraphColor "dx_GetIgnoreDrawGraphColor"
	#func global SetMaxAnisotropy "dx_SetMaxAnisotropy" int
	#cfunc global GetMaxAnisotropy "dx_GetMaxAnisotropy"
	#func global SetUseLarge3DPositionSupport "dx_SetUseLarge3DPositionSupport" int
	#func global SetUseZBufferFlag "dx_SetUseZBufferFlag" int
	#func global SetWriteZBufferFlag "dx_SetWriteZBufferFlag" int
	#func global SetZBufferCmpType "dx_SetZBufferCmpType" int
	#func global SetZBias "dx_SetZBias" int
	#func global SetUseZBuffer3D "dx_SetUseZBuffer3D" int
	#func global SetWriteZBuffer3D "dx_SetWriteZBuffer3D" int
	#func global SetZBufferCmpType3D "dx_SetZBufferCmpType3D" int
	#func global SetZBias3D "dx_SetZBias3D" int
	#func global SetUseReversedZ "dx_SetUseReversedZ" int
	#cfunc global GetDrawArea "dx_GetDrawArea" var
	#cfunc global RunRestoreShred "dx_RunRestoreShred"
	#func global SetTransformTo2D "dx_SetTransformTo2D" var
	#func global SetTransformTo2DD "dx_SetTransformTo2DD" var
	#func global ResetTransformTo2D "dx_ResetTransformTo2D"
	#func global SetTransformToWorld "dx_SetTransformToWorld" var
	#func global SetTransformToWorldD "dx_SetTransformToWorldD" var
	#cfunc global GetTransformToWorldMatrix "dx_GetTransformToWorldMatrix" var
	#cfunc global GetTransformToWorldMatrixD "dx_GetTransformToWorldMatrixD" var
	#func global SetTransformToView "dx_SetTransformToView" var
	#func global SetTransformToViewD "dx_SetTransformToViewD" var
	#cfunc global GetTransformToViewMatrix "dx_GetTransformToViewMatrix" var
	#cfunc global GetTransformToViewMatrixD "dx_GetTransformToViewMatrixD" var
	#func global SetTransformToProjection "dx_SetTransformToProjection" var
	#func global SetTransformToProjectionD "dx_SetTransformToProjectionD" var
	#cfunc global GetTransformToProjectionMatrix "dx_GetTransformToProjectionMatrix" var
	#cfunc global GetTransformToProjectionMatrixD "dx_GetTransformToProjectionMatrixD" var
	#func global SetTransformToViewport "dx_SetTransformToViewport" var
	#func global SetTransformToViewportD "dx_SetTransformToViewportD" var
	#cfunc global GetTransformToViewportMatrix "dx_GetTransformToViewportMatrix" var
	#cfunc global GetTransformToViewportMatrixD "dx_GetTransformToViewportMatrixD" var
	#cfunc global GetTransformToAPIViewportMatrix "dx_GetTransformToAPIViewportMatrix" var
	#cfunc global GetTransformToAPIViewportMatrixD "dx_GetTransformToAPIViewportMatrixD" var
	#func global SetDefTransformMatrix "dx_SetDefTransformMatrix"
	#cfunc global GetTransformPosition "dx_GetTransformPosition" var, var, var
	#cfunc global GetTransformPositionD "dx_GetTransformPositionD" var, var, var
	#cfuncf global GetBillboardPixelSize "dx_GetBillboardPixelSize" VECTOR, float
	#cfuncst global VECTOR ConvWorldPosToViewPos "dx_ConvWorldPosToViewPos" VECTOR
	#cfuncst global VECTOR_D ConvWorldPosToViewPosD "dx_ConvWorldPosToViewPosD" VECTOR_D
	#func global SetUseCullingFlag "dx_SetUseCullingFlag" int
	#func global SetUseBackCulling "dx_SetUseBackCulling" int
	#cfunc global GetUseBackCulling "dx_GetUseBackCulling"
	#func global SetUseRightHandClippingProcess "dx_SetUseRightHandClippingProcess" int
	#cfunc global GetUseRightHandClippingProcess "dx_GetUseRightHandClippingProcess"
	#func global SetTextureAddressMode "dx_SetTextureAddressMode" int
	#func global SetTextureAddressMode_1 "dx_SetTextureAddressMode" int, int
	#func global SetTextureAddressModeUV "dx_SetTextureAddressModeUV" int, int
	#func global SetTextureAddressModeUV_1 "dx_SetTextureAddressModeUV" int, int, int
	#func global SetTextureAddressTransform "dx_SetTextureAddressTransform" float, float, float, float, float, float, float
	#func global SetTextureAddressTransformMatrix "dx_SetTextureAddressTransformMatrix" MATRIX
	#func global ResetTextureAddressTransform "dx_ResetTextureAddressTransform"
	#func global SetFogEnable "dx_SetFogEnable" int
	#cfunc global GetFogEnable "dx_GetFogEnable"
	#func global SetFogMode "dx_SetFogMode" int
	#cfunc global GetFogMode "dx_GetFogMode"
	#func global SetFogColor "dx_SetFogColor" int, int, int
	#cfunc global GetFogColor "dx_GetFogColor" var, var, var
	#func global SetFogStartEnd "dx_SetFogStartEnd" float, float
	#cfunc global GetFogStartEnd "dx_GetFogStartEnd" var, var
	#func global SetFogDensity "dx_SetFogDensity" float
	#cfuncf global GetFogDensity "dx_GetFogDensity"
	#func global SetVerticalFogEnable "dx_SetVerticalFogEnable" int
	#cfunc global GetVerticalFogEnable "dx_GetVerticalFogEnable"
	#func global SetVerticalFogMode "dx_SetVerticalFogMode" int
	#cfunc global GetVerticalFogMode "dx_GetVerticalFogMode"
	#func global SetVerticalFogColor "dx_SetVerticalFogColor" int, int, int
	#cfunc global GetVerticalFogColor "dx_GetVerticalFogColor" var, var, var
	#func global SetVerticalFogStartEnd "dx_SetVerticalFogStartEnd" float, float
	#cfunc global GetVerticalFogStartEnd "dx_GetVerticalFogStartEnd" var, var
	#func global SetVerticalFogDensity "dx_SetVerticalFogDensity" float, float
	#cfunc global GetVerticalFogDensity "dx_GetVerticalFogDensity" var, var
	#cfunc global GetPixelDX "dx_GetPixelDX" int, int
	#cfuncst global COLOR_F GetPixelF "dx_GetPixelF" int, int
	#cfunc global GetBackgroundColor "dx_GetBackgroundColor" var, var, var, var
	#func global BltDrawValidGraph "dx_BltDrawValidGraph" int, int, int, int, int, int, int, int
	#func global WaitVSync "dx_WaitVSync" int
	#cfunc global GetActiveGraph "dx_GetActiveGraph"
	#func global SetEmulation320x240 "dx_SetEmulation320x240" int
	#func global SetZBufferSize "dx_SetZBufferSize" int, int
	#func global SetZBufferBitDepth "dx_SetZBufferBitDepth" int
	#cfunc global GetWaitVSyncFlag "dx_GetWaitVSyncFlag"
	#func global SetFullSceneAntiAliasingMode "dx_SetFullSceneAntiAliasingMode" int, int
	#cfunc global GetChangeDisplayFlag "dx_GetChangeDisplayFlag"
	#cfunc global GetVideoMemorySize "dx_GetVideoMemorySize" var, var
	#cfunc global GetVideoMemorySizeEx "dx_GetVideoMemorySizeEx" var, var
	#cfunc global GetRefreshRate "dx_GetRefreshRate"
	#cfunc global GetDisplayNum "dx_GetDisplayNum"
	#cfunc global GetDisplayInfo "dx_GetDisplayInfo" int, var, var, var, var, var, var
	#cfunc global GetDisplayModeNum "dx_GetDisplayModeNum"
	#cfunc global GetDisplayModeNum_1 "dx_GetDisplayModeNum" int
	#cfuncst global GetDisplayMode "dx_GetDisplayMode" 16, int
	#cfuncst global GetDisplayMode_1 "dx_GetDisplayMode" 16, int, int
	#cfunc global GetDrawFloatCoordType "dx_GetDrawFloatCoordType"
	#func global SetUseNormalDrawShader "dx_SetUseNormalDrawShader" int
	#func global SetUseSoftwareRenderModeFlag "dx_SetUseSoftwareRenderModeFlag" int
	#func global SetNotUse3DFlag "dx_SetNotUse3DFlag" int
	#func global SetUse3DFlag "dx_SetUse3DFlag" int
	#cfunc global GetUse3DFlag "dx_GetUse3DFlag"
	#func global SetWindowDrawRect "dx_SetWindowDrawRect" var
	#cfunc global RestoreGraphSystem "dx_RestoreGraphSystem"
	#func global SetUseHardwareVertexProcessing "dx_SetUseHardwareVertexProcessing" int
	#func global SetUsePixelLighting "dx_SetUsePixelLighting" int
	#func global SetUseOldDrawModiGraphCodeFlag "dx_SetUseOldDrawModiGraphCodeFlag" int
	#func global SetUseVramFlag "dx_SetUseVramFlag" int
	#cfunc global GetUseVramFlag "dx_GetUseVramFlag"
	#func global SetBasicBlendFlag "dx_SetBasicBlendFlag" int
	#func global SetUseBasicGraphDraw3DDeviceMethodFlag "dx_SetUseBasicGraphDraw3DDeviceMethodFlag" int
	#func global SetUseDisplayIndex "dx_SetUseDisplayIndex" int
	#cfunc global RenderVertex "dx_RenderVertex"
	#cfunc global GetDrawCallCount "dx_GetDrawCallCount"
	#cfuncf global GetFPS "dx_GetFPS"
	#cfunc global CreateVertexBuffer "dx_CreateVertexBuffer" int, int
	#func global DeleteVertexBuffer "dx_DeleteVertexBuffer" int
	#func global InitVertexBuffer "dx_InitVertexBuffer"
	#func global SetVertexBufferData "dx_SetVertexBufferData" int, int, int, int
	#cfunc global GetBufferVertexBuffer "dx_GetBufferVertexBuffer" int
	#func global UpdateVertexBuffer "dx_UpdateVertexBuffer" int, int, int
	#cfunc global CreateIndexBuffer "dx_CreateIndexBuffer" int, int
	#func global DeleteIndexBuffer "dx_DeleteIndexBuffer" int
	#func global InitIndexBuffer "dx_InitIndexBuffer"
	#func global SetIndexBufferData "dx_SetIndexBufferData" int, int, int, int
	#cfunc global GetBufferIndexBuffer "dx_GetBufferIndexBuffer" int
	#func global UpdateIndexBuffer "dx_UpdateIndexBuffer" int, int, int
	#cfunc global GetMaxPrimitiveCount "dx_GetMaxPrimitiveCount"
	#cfunc global GetMaxVertexIndex "dx_GetMaxVertexIndex"
	#cfunc global GetValidShaderVersion "dx_GetValidShaderVersion"
	#cfunc global LoadVertexShader "dx_LoadVertexShader" wstr
	#cfunc global LoadGeometryShader "dx_LoadGeometryShader" wstr
	#cfunc global LoadPixelShader "dx_LoadPixelShader" wstr
	#cfunc global LoadVertexShaderFromMem "dx_LoadVertexShaderFromMem" int, int
	#cfunc global LoadGeometryShaderFromMem "dx_LoadGeometryShaderFromMem" int, int
	#cfunc global LoadPixelShaderFromMem "dx_LoadPixelShaderFromMem" int, int
	#func global DeleteShader "dx_DeleteShader" int
	#func global InitShader "dx_InitShader"
	#cfunc global GetConstIndexToShader "dx_GetConstIndexToShader" wstr, int
	#cfunc global GetConstCountToShader "dx_GetConstCountToShader" wstr, int
	#func global SetVSConstSF "dx_SetVSConstSF" int, float
	#func global SetVSConstF "dx_SetVSConstF" int, FLOAT4
	#func global SetVSConstFMtx "dx_SetVSConstFMtx" int, MATRIX
	#func global SetVSConstFMtxT "dx_SetVSConstFMtxT" int, MATRIX
	#func global SetVSConstSI "dx_SetVSConstSI" int, int
	#func global SetVSConstI "dx_SetVSConstI" int, INT4
	#func global SetVSConstB "dx_SetVSConstB" int, int
	#func global SetVSConstSFArray "dx_SetVSConstSFArray" int, int, var, int
	#func global SetVSConstFArray "dx_SetVSConstFArray" int, int, var, int
	#func global SetVSConstFMtxArray "dx_SetVSConstFMtxArray" int, int, var, int
	#func global SetVSConstFMtxTArray "dx_SetVSConstFMtxTArray" int, int, var, int
	#func global SetVSConstSIArray "dx_SetVSConstSIArray" int, int, var, int
	#func global SetVSConstIArray "dx_SetVSConstIArray" int, int, var, int
	#func global SetVSConstBArray "dx_SetVSConstBArray" int, int, var, int
	#func global ResetVSConstF "dx_ResetVSConstF" int, int
	#func global ResetVSConstI "dx_ResetVSConstI" int, int
	#func global ResetVSConstB "dx_ResetVSConstB" int, int
	#func global SetPSConstSF "dx_SetPSConstSF" int, float
	#func global SetPSConstF "dx_SetPSConstF" int, FLOAT4
	#func global SetPSConstFMtx "dx_SetPSConstFMtx" int, MATRIX
	#func global SetPSConstFMtxT "dx_SetPSConstFMtxT" int, MATRIX
	#func global SetPSConstSI "dx_SetPSConstSI" int, int
	#func global SetPSConstI "dx_SetPSConstI" int, INT4
	#func global SetPSConstB "dx_SetPSConstB" int, int
	#func global SetPSConstSFArray "dx_SetPSConstSFArray" int, int, var, int
	#func global SetPSConstFArray "dx_SetPSConstFArray" int, int, var, int
	#func global SetPSConstFMtxArray "dx_SetPSConstFMtxArray" int, int, var, int
	#func global SetPSConstFMtxTArray "dx_SetPSConstFMtxTArray" int, int, var, int
	#func global SetPSConstSIArray "dx_SetPSConstSIArray" int, int, var, int
	#func global SetPSConstIArray "dx_SetPSConstIArray" int, int, var, int
	#func global SetPSConstBArray "dx_SetPSConstBArray" int, int, var, int
	#func global ResetPSConstF "dx_ResetPSConstF" int, int
	#func global ResetPSConstI "dx_ResetPSConstI" int, int
	#func global ResetPSConstB "dx_ResetPSConstB" int, int
	#func global SetRenderTargetToShader "dx_SetRenderTargetToShader" int, int
	#func global SetRenderTargetToShader_1 "dx_SetRenderTargetToShader" int, int, int
	#func global SetRenderTargetToShader_2 "dx_SetRenderTargetToShader" int, int, int, int
	#func global SetUseTextureToShader "dx_SetUseTextureToShader" int, int
	#func global SetUseVertexShader "dx_SetUseVertexShader" int
	#func global SetUseGeometryShader "dx_SetUseGeometryShader" int
	#func global SetUsePixelShader "dx_SetUsePixelShader" int
	#cfunc global CalcPolygonBinormalAndTangentsToShader "dx_CalcPolygonBinormalAndTangentsToShader" int, var, int
	#cfunc global CalcPolygonIndexedBinormalAndTangentsToShader "dx_CalcPolygonIndexedBinormalAndTangentsToShader" int, var, int, int, var, int
	#cfunc global CalcPolygon32bitIndexedBinormalAndTangentsToShader "dx_CalcPolygon32bitIndexedBinormalAndTangentsToShader" int, var, int, int, var, int
	#func global InitShaderConstantBuffer "dx_InitShaderConstantBuffer"
	#cfunc global CreateShaderConstantBuffer "dx_CreateShaderConstantBuffer" int
	#func global DeleteShaderConstantBuffer "dx_DeleteShaderConstantBuffer" int
	#cfunc global GetBufferShaderConstantBuffer "dx_GetBufferShaderConstantBuffer" int
	#func global UpdateShaderConstantBuffer "dx_UpdateShaderConstantBuffer" int
	#func global SetShaderConstantBuffer "dx_SetShaderConstantBuffer" int, int, int
	#func global PlayMovie "dx_PlayMovie" wstr, int, int
	#cfunc global GetMovieImageSize_Mem "dx_GetMovieImageSize_Mem" int, int, var, var
	#func global OpenMovieToGraph "dx_OpenMovieToGraph" wstr
	#func global OpenMovieToGraph_1 "dx_OpenMovieToGraph" wstr, int
	#func global PlayMovieToGraph "dx_PlayMovieToGraph" int
	#func global PlayMovieToGraph_1 "dx_PlayMovieToGraph" int, int
	#func global PlayMovieToGraph_2 "dx_PlayMovieToGraph" int, int, int
	#cfunc global PauseMovieToGraph "dx_PauseMovieToGraph" int
	#cfunc global PauseMovieToGraph_1 "dx_PauseMovieToGraph" int, int
	#func global AddMovieFrameToGraph "dx_AddMovieFrameToGraph" int, int
	#cfunc global SeekMovieToGraph "dx_SeekMovieToGraph" int, int
	#func global SetPlaySpeedRateMovieToGraph "dx_SetPlaySpeedRateMovieToGraph" int, double
	#cfunc global GetMovieStateToGraph "dx_GetMovieStateToGraph" int
	#func global SetMovieVolumeToGraph "dx_SetMovieVolumeToGraph" int, int
	#cfunc global GetMovieVolumeToGraph "dx_GetMovieVolumeToGraph" int
	#func global ChangeMovieVolumeToGraph "dx_ChangeMovieVolumeToGraph" int, int
	#cfunc global GetMovieVolumeToGraph2 "dx_GetMovieVolumeToGraph2" int
	#cfunc global GetMovieTotalFrameToGraph "dx_GetMovieTotalFrameToGraph" int
	#cfunc global TellMovieToGraph "dx_TellMovieToGraph" int
	#cfunc global TellMovieToGraphToFrame "dx_TellMovieToGraphToFrame" int
	#cfunc global SeekMovieToGraphToFrame "dx_SeekMovieToGraphToFrame" int, int
	#cfunc global GetOneFrameTimeMovieToGraph "dx_GetOneFrameTimeMovieToGraph" int
	#cfunc global GetLastUpdateTimeMovieToGraph "dx_GetLastUpdateTimeMovieToGraph" int
	#func global UpdateMovieToGraph "dx_UpdateMovieToGraph" int
	#func global SetMovieRightImageAlphaFlag "dx_SetMovieRightImageAlphaFlag" int
	#func global SetMovieColorA8R8G8B8Flag "dx_SetMovieColorA8R8G8B8Flag" int
	#func global SetMovieUseYUVFormatSurfaceFlag "dx_SetMovieUseYUVFormatSurfaceFlag" int
	#func global SetupCamera_Perspective "dx_SetupCamera_Perspective" float
	#func global SetupCamera_PerspectiveD "dx_SetupCamera_PerspectiveD" double
	#func global SetupCamera_Ortho "dx_SetupCamera_Ortho" float
	#func global SetupCamera_OrthoD "dx_SetupCamera_OrthoD" double
	#func global SetupCamera_ProjectionMatrix "dx_SetupCamera_ProjectionMatrix" MATRIX
	#func global SetupCamera_ProjectionMatrixD "dx_SetupCamera_ProjectionMatrixD" MATRIX_D
	#cfunc global CheckCameraViewClip "dx_CheckCameraViewClip" VECTOR
	#cfunc global CheckCameraViewClipD "dx_CheckCameraViewClipD" VECTOR_D
	#cfunc global CheckCameraViewClip_Dir "dx_CheckCameraViewClip_Dir" VECTOR
	#cfunc global CheckCameraViewClip_DirD "dx_CheckCameraViewClip_DirD" VECTOR_D
	#cfunc global CheckCameraViewClip_Box "dx_CheckCameraViewClip_Box" VECTOR, VECTOR
	#cfunc global CheckCameraViewClip_BoxD "dx_CheckCameraViewClip_BoxD" VECTOR_D, VECTOR_D
	#func global SetUseLighting "dx_SetUseLighting" int
	#func global SetMaterialUseVertDifColor "dx_SetMaterialUseVertDifColor" int
	#func global SetMaterialUseVertSpcColor "dx_SetMaterialUseVertSpcColor" int
	#func global SetMaterialParam "dx_SetMaterialParam" MATERIALPARAM
	#func global SetUseSpecular "dx_SetUseSpecular" int
	#func global SetGlobalAmbientLight "dx_SetGlobalAmbientLight" COLOR_F
	#func global SetUseLightAngleAttenuation "dx_SetUseLightAngleAttenuation" int
	#func global SetUseHalfLambertLighting "dx_SetUseHalfLambertLighting" int
	#cfunc global GetEnableLightHandleNum "dx_GetEnableLightHandleNum"
	#cfunc global GetEnableLightHandle "dx_GetEnableLightHandle" int
	#cfunc global GetTexFormatIndex "dx_GetTexFormatIndex" var
	#func global InitMask "dx_InitMask"
	#cfunc global MakeMask "dx_MakeMask" int, int
	#cfunc global GetMaskSize "dx_GetMaskSize" var, var, int
	#func global SetDataToMask "dx_SetDataToMask" int, int, int, int
	#func global DeleteMask "dx_DeleteMask" int
	#cfunc global LoadMask "dx_LoadMask" wstr
	#cfunc global LoadDivMask "dx_LoadDivMask" wstr, int, int, int, int, int, int, var
	#cfunc global CreateMaskFromMem "dx_CreateMaskFromMem" int, int
	#cfunc global CreateDivMaskFromMem "dx_CreateDivMaskFromMem" int, int, int, int, int, int, int, int, var
	#func global SetMaskReverseEffectFlag "dx_SetMaskReverseEffectFlag" int
	#cfunc global GetMaskUseFlag "dx_GetMaskUseFlag"
	#cfunc global GetDrawStringWidth "dx_GetDrawStringWidth" wstr, int
	#cfunc global GetDrawStringWidth_1 "dx_GetDrawStringWidth" wstr, int, int
	#cfunc global GetDrawNStringWidth "dx_GetDrawNStringWidth" wstr, int
	#cfunc global GetDrawNStringWidth_1 "dx_GetDrawNStringWidth" wstr, int, int
	#cfunc global GetDrawExtendStringWidth "dx_GetDrawExtendStringWidth" double, wstr, int
	#cfunc global GetDrawExtendStringWidth_1 "dx_GetDrawExtendStringWidth" double, wstr, int, int
	#cfunc global GetDrawExtendNStringWidth "dx_GetDrawExtendNStringWidth" double, wstr, int
	#cfunc global GetDrawExtendNStringWidth_1 "dx_GetDrawExtendNStringWidth" double, wstr, int, int
	#cfunc global GetDrawStringSize "dx_GetDrawStringSize" var, var, var, wstr, int
	#cfunc global GetDrawStringSize_1 "dx_GetDrawStringSize" var, var, var, wstr, int, int
	#cfunc global GetDrawNStringSize "dx_GetDrawNStringSize" var, var, var, wstr, int
	#cfunc global GetDrawNStringSize_1 "dx_GetDrawNStringSize" var, var, var, wstr, int, int
	#cfunc global GetDrawExtendStringSize "dx_GetDrawExtendStringSize" var, var, var, double, double, wstr, int
	#cfunc global GetDrawExtendStringSize_1 "dx_GetDrawExtendStringSize" var, var, var, double, double, wstr, int, int
	#cfunc global GetDrawExtendNStringSize "dx_GetDrawExtendNStringSize" var, var, var, double, double, wstr, int
	#cfunc global GetDrawExtendNStringSize_1 "dx_GetDrawExtendNStringSize" var, var, var, double, double, wstr, int, int
	#cfunc global GetDrawStringKerningPairInfo "dx_GetDrawStringKerningPairInfo" wstr, var
	#cfunc global GetDrawStringWidthToHandle "dx_GetDrawStringWidthToHandle" wstr, int, int
	#cfunc global GetDrawStringWidthToHandle_1 "dx_GetDrawStringWidthToHandle" wstr, int, int, int
	#cfunc global GetDrawNStringWidthToHandle "dx_GetDrawNStringWidthToHandle" wstr, int, int
	#cfunc global GetDrawNStringWidthToHandle_1 "dx_GetDrawNStringWidthToHandle" wstr, int, int, int
	#cfunc global GetDrawExtendStringWidthToHandle "dx_GetDrawExtendStringWidthToHandle" double, wstr, int, int
	#cfunc global GetDrawExtendStringWidthToHandle_1 "dx_GetDrawExtendStringWidthToHandle" double, wstr, int, int, int
	#cfunc global GetDrawExtendNStringWidthToHandle "dx_GetDrawExtendNStringWidthToHandle" double, wstr, int, int
	#cfunc global GetDrawExtendNStringWidthToHandle_1 "dx_GetDrawExtendNStringWidthToHandle" double, wstr, int, int, int
	#cfunc global GetDrawStringSizeToHandle "dx_GetDrawStringSizeToHandle" var, var, var, wstr, int, int
	#cfunc global GetDrawStringSizeToHandle_1 "dx_GetDrawStringSizeToHandle" var, var, var, wstr, int, int, int
	#cfunc global GetDrawNStringSizeToHandle "dx_GetDrawNStringSizeToHandle" var, var, var, wstr, int, int
	#cfunc global GetDrawNStringSizeToHandle_1 "dx_GetDrawNStringSizeToHandle" var, var, var, wstr, int, int, int
	#cfunc global GetDrawExtendStringSizeToHandle "dx_GetDrawExtendStringSizeToHandle" var, var, var, double, double, wstr, int, int
	#cfunc global GetDrawExtendStringSizeToHandle_1 "dx_GetDrawExtendStringSizeToHandle" var, var, var, double, double, wstr, int, int, int
	#cfunc global GetDrawExtendNStringSizeToHandle "dx_GetDrawExtendNStringSizeToHandle" var, var, var, double, double, wstr, int, int
	#cfunc global GetDrawExtendNStringSizeToHandle_1 "dx_GetDrawExtendNStringSizeToHandle" var, var, var, double, double, wstr, int, int, int
	#cfunc global GetDrawStringKerningPairInfoToHandle "dx_GetDrawStringKerningPairInfoToHandle" wstr, var, int
	#cfunc global MultiByteCharCheck "dx_MultiByteCharCheck" wstr, int
	#cfunc global ConvertMatrixFtoD "dx_ConvertMatrixFtoD" var, var
	#cfunc global ConvertMatrixDtoF "dx_ConvertMatrixDtoF" var, var
	#cfunc global CreateMultiplyMatrix "dx_CreateMultiplyMatrix" var, var, var
	#cfunc global CreateMultiplyMatrixD "dx_CreateMultiplyMatrixD" var, var, var
	#cfunc global CreateOrthoMatrix "dx_CreateOrthoMatrix" var, float, float, float
	#cfunc global CreateOrthoMatrix_1 "dx_CreateOrthoMatrix" var, float, float, float, float
	#cfunc global CreateOrthoMatrixD "dx_CreateOrthoMatrixD" var, double, double, double
	#cfunc global CreateOrthoMatrixD_1 "dx_CreateOrthoMatrixD" var, double, double, double, double
	#cfunc global CreateOrthoMatrixRH "dx_CreateOrthoMatrixRH" var, float, float, float
	#cfunc global CreateOrthoMatrixRH_1 "dx_CreateOrthoMatrixRH" var, float, float, float, float
	#cfunc global CreateOrthoMatrixRHD "dx_CreateOrthoMatrixRHD" var, double, double, double
	#cfunc global CreateOrthoMatrixRHD_1 "dx_CreateOrthoMatrixRHD" var, double, double, double, double
	#cfunc global CreateScalingMatrix "dx_CreateScalingMatrix" var, float, float, float
	#cfunc global CreateScalingMatrixD "dx_CreateScalingMatrixD" var, double, double, double
	#cfunc global CreateRotationXMatrix "dx_CreateRotationXMatrix" var, float
	#cfunc global CreateRotationXMatrixD "dx_CreateRotationXMatrixD" var, double
	#cfunc global CreateRotationYMatrix "dx_CreateRotationYMatrix" var, float
	#cfunc global CreateRotationYMatrixD "dx_CreateRotationYMatrixD" var, double
	#cfunc global CreateRotationZMatrix "dx_CreateRotationZMatrix" var, float
	#cfunc global CreateRotationZMatrixD "dx_CreateRotationZMatrixD" var, double
	#cfunc global CreateTranslationMatrix "dx_CreateTranslationMatrix" var, float, float, float
	#cfunc global CreateTranslationMatrixD "dx_CreateTranslationMatrixD" var, double, double, double
	#cfunc global CreateTransposeMatrix "dx_CreateTransposeMatrix" var, var
	#cfunc global CreateTransposeMatrixD "dx_CreateTransposeMatrixD" var, var
	#cfunc global CreateInverseMatrix "dx_CreateInverseMatrix" var, var
	#cfunc global CreateInverseMatrixD "dx_CreateInverseMatrixD" var, var
	#cfunc global CreateViewportMatrix "dx_CreateViewportMatrix" var, float, float, float, float
	#cfunc global CreateViewportMatrixD "dx_CreateViewportMatrixD" var, double, double, double, double
	#cfunc global CreateRotationXYZMatrix "dx_CreateRotationXYZMatrix" var, float, float, float
	#cfunc global CreateRotationXYZMatrixD "dx_CreateRotationXYZMatrixD" var, double, double, double
	#cfunc global CreateRotationXZYMatrix "dx_CreateRotationXZYMatrix" var, float, float, float
	#cfunc global CreateRotationXZYMatrixD "dx_CreateRotationXZYMatrixD" var, double, double, double
	#cfunc global CreateRotationYXZMatrix "dx_CreateRotationYXZMatrix" var, float, float, float
	#cfunc global CreateRotationYXZMatrixD "dx_CreateRotationYXZMatrixD" var, double, double, double
	#cfunc global CreateRotationYZXMatrix "dx_CreateRotationYZXMatrix" var, float, float, float
	#cfunc global CreateRotationYZXMatrixD "dx_CreateRotationYZXMatrixD" var, double, double, double
	#cfunc global CreateRotationZXYMatrix "dx_CreateRotationZXYMatrix" var, float, float, float
	#cfunc global CreateRotationZXYMatrixD "dx_CreateRotationZXYMatrixD" var, double, double, double
	#cfunc global CreateRotationZYXMatrix "dx_CreateRotationZYXMatrix" var, float, float, float
	#cfunc global CreateRotationZYXMatrixD "dx_CreateRotationZYXMatrixD" var, double, double, double
	#cfunc global GetMatrixXYZRotation "dx_GetMatrixXYZRotation" var, var, var, var
	#cfunc global GetMatrixXYZRotationD "dx_GetMatrixXYZRotationD" var, var, var, var
	#cfunc global GetMatrixXZYRotation "dx_GetMatrixXZYRotation" var, var, var, var
	#cfunc global GetMatrixXZYRotationD "dx_GetMatrixXZYRotationD" var, var, var, var
	#cfunc global GetMatrixYXZRotation "dx_GetMatrixYXZRotation" var, var, var, var
	#cfunc global GetMatrixYXZRotationD "dx_GetMatrixYXZRotationD" var, var, var, var
	#cfunc global GetMatrixYZXRotation "dx_GetMatrixYZXRotation" var, var, var, var
	#cfunc global GetMatrixYZXRotationD "dx_GetMatrixYZXRotationD" var, var, var, var
	#cfunc global GetMatrixZXYRotation "dx_GetMatrixZXYRotation" var, var, var, var
	#cfunc global GetMatrixZXYRotationD "dx_GetMatrixZXYRotationD" var, var, var, var
	#cfunc global GetMatrixZYXRotation "dx_GetMatrixZYXRotation" var, var, var, var
	#cfunc global GetMatrixZYXRotationD "dx_GetMatrixZYXRotationD" var, var, var, var
	#cfunc global VectorConvertFtoD "dx_VectorConvertFtoD" var, var
	#cfunc global VectorConvertDtoF "dx_VectorConvertDtoF" var, var
	#cfunc global VectorNormalize "dx_VectorNormalize" var, var
	#cfunc global VectorNormalizeD "dx_VectorNormalizeD" var, var
	#cfunc global VectorScale "dx_VectorScale" var, var, float
	#cfunc global VectorScaleD "dx_VectorScaleD" var, var, double
	#cfunc global VectorMultiply "dx_VectorMultiply" var, var, var
	#cfunc global VectorMultiplyD "dx_VectorMultiplyD" var, var, var
	#cfunc global VectorSub "dx_VectorSub" var, var, var
	#cfunc global VectorSubD "dx_VectorSubD" var, var, var
	#cfunc global VectorAdd "dx_VectorAdd" var, var, var
	#cfunc global VectorAddD "dx_VectorAddD" var, var, var
	#cfunc global VectorOuterProduct "dx_VectorOuterProduct" var, var, var
	#cfunc global VectorOuterProductD "dx_VectorOuterProductD" var, var, var
	#cfuncf global VectorInnerProduct "dx_VectorInnerProduct" var, var
	#cfunc global VectorRotationX "dx_VectorRotationX" var, var, double
	#cfunc global VectorRotationXD "dx_VectorRotationXD" var, var, double
	#cfunc global VectorRotationY "dx_VectorRotationY" var, var, double
	#cfunc global VectorRotationYD "dx_VectorRotationYD" var, var, double
	#cfunc global VectorRotationZ "dx_VectorRotationZ" var, var, double
	#cfunc global VectorRotationZD "dx_VectorRotationZD" var, var, double
	#cfunc global VectorTransform "dx_VectorTransform" var, var, var
	#cfunc global VectorTransformD "dx_VectorTransformD" var, var, var
	#cfunc global VectorTransformSR "dx_VectorTransformSR" var, var, var
	#cfunc global VectorTransformSRD "dx_VectorTransformSRD" var, var, var
	#cfunc global VectorTransform4 "dx_VectorTransform4" var, var, var, var, var
	#cfunc global VectorTransform4D "dx_VectorTransform4D" var, var, var, var, var
	#cfunc global Segment_Segment_Analyse "dx_Segment_Segment_Analyse" var, var, var, var, var
	#cfunc global Segment_Segment_AnalyseD "dx_Segment_Segment_AnalyseD" var, var, var, var, var
	#cfunc global Segment_Point_Analyse "dx_Segment_Point_Analyse" var, var, var, var
	#cfunc global Segment_Point_AnalyseD "dx_Segment_Point_AnalyseD" var, var, var, var
	#cfunc global Segment_Triangle_Analyse "dx_Segment_Triangle_Analyse" var, var, var, var, var, var
	#cfunc global Segment_Triangle_AnalyseD "dx_Segment_Triangle_AnalyseD" var, var, var, var, var, var
	#cfunc global Triangle_Point_Analyse "dx_Triangle_Point_Analyse" var, var, var, var, var
	#cfunc global Triangle_Point_AnalyseD "dx_Triangle_Point_AnalyseD" var, var, var, var, var
	#cfunc global Plane_Point_Analyse "dx_Plane_Point_Analyse" var, var, var, var
	#cfunc global Plane_Point_AnalyseD "dx_Plane_Point_AnalyseD" var, var, var, var
	#func global TriangleBarycenter "dx_TriangleBarycenter" VECTOR, VECTOR, VECTOR, VECTOR, var, var, var
	#func global TriangleBarycenterD "dx_TriangleBarycenterD" VECTOR_D, VECTOR_D, VECTOR_D, VECTOR_D, var, var, var
	#cfuncf global Segment_Segment_MinLength "dx_Segment_Segment_MinLength" VECTOR, VECTOR, VECTOR, VECTOR
	#cfuncf global Segment_Segment_MinLength_Square "dx_Segment_Segment_MinLength_Square" VECTOR, VECTOR, VECTOR, VECTOR
	#cfuncf global Segment_Triangle_MinLength "dx_Segment_Triangle_MinLength" VECTOR, VECTOR, VECTOR, VECTOR, VECTOR
	#cfuncf global Segment_Triangle_MinLength_Square "dx_Segment_Triangle_MinLength_Square" VECTOR, VECTOR, VECTOR, VECTOR, VECTOR
	#cfuncf global Segment_Point_MinLength "dx_Segment_Point_MinLength" VECTOR, VECTOR, VECTOR
	#cfuncf global Segment_Point_MinLength_Square "dx_Segment_Point_MinLength_Square" VECTOR, VECTOR, VECTOR
	#cfuncf global Triangle_Point_MinLength "dx_Triangle_Point_MinLength" VECTOR, VECTOR, VECTOR, VECTOR
	#cfuncf global Triangle_Point_MinLength_Square "dx_Triangle_Point_MinLength_Square" VECTOR, VECTOR, VECTOR, VECTOR
	#cfuncf global Triangle_Triangle_MinLength "dx_Triangle_Triangle_MinLength" VECTOR, VECTOR, VECTOR, VECTOR, VECTOR, VECTOR
	#cfuncf global Triangle_Triangle_MinLength_Square "dx_Triangle_Triangle_MinLength_Square" VECTOR, VECTOR, VECTOR, VECTOR, VECTOR, VECTOR
	#cfuncst global VECTOR Plane_Point_MinLength_Position "dx_Plane_Point_MinLength_Position" VECTOR, VECTOR, VECTOR
	#cfuncst global VECTOR_D Plane_Point_MinLength_PositionD "dx_Plane_Point_MinLength_PositionD" VECTOR_D, VECTOR_D, VECTOR_D
	#cfuncf global Plane_Point_MinLength "dx_Plane_Point_MinLength" VECTOR, VECTOR, VECTOR
	#cfuncst global HitCheck_Line_Triangle "dx_HitCheck_Line_Triangle" 8, var, var, var, var, var
	#cfunc global HitCheck_Triangle_Triangle "dx_HitCheck_Triangle_Triangle" VECTOR, VECTOR, VECTOR, VECTOR, VECTOR, VECTOR
	#cfunc global HitCheck_Triangle_TriangleD "dx_HitCheck_Triangle_TriangleD" VECTOR_D, VECTOR_D, VECTOR_D, VECTOR_D, VECTOR_D, VECTOR_D
	#cfunc global HitCheck_Triangle_Triangle_2D "dx_HitCheck_Triangle_Triangle_2D" VECTOR, VECTOR, VECTOR, VECTOR, VECTOR, VECTOR
	#cfunc global HitCheck_Triangle_TriangleD_2D "dx_HitCheck_Triangle_TriangleD_2D" VECTOR_D, VECTOR_D, VECTOR_D, VECTOR_D, VECTOR_D, VECTOR_D
	#cfuncst global HitCheck_Line_Cube "dx_HitCheck_Line_Cube" 8, var, var, var, var
	#cfunc global HitCheck_Point_Cone "dx_HitCheck_Point_Cone" VECTOR, VECTOR, VECTOR, float
	#cfunc global HitCheck_Point_ConeD "dx_HitCheck_Point_ConeD" VECTOR_D, VECTOR_D, VECTOR_D, double
	#cfunc global HitCheck_Line_Sphere "dx_HitCheck_Line_Sphere" VECTOR, VECTOR, VECTOR, float
	#cfunc global HitCheck_Line_SphereD "dx_HitCheck_Line_SphereD" VECTOR_D, VECTOR_D, VECTOR_D, double
	#cfunc global HitCheck_Sphere_Sphere "dx_HitCheck_Sphere_Sphere" VECTOR, float, VECTOR, float
	#cfunc global HitCheck_Sphere_SphereD "dx_HitCheck_Sphere_SphereD" VECTOR_D, double, VECTOR_D, double
	#cfunc global HitCheck_Sphere_Capsule "dx_HitCheck_Sphere_Capsule" VECTOR, float, VECTOR, VECTOR, float
	#cfunc global HitCheck_Sphere_CapsuleD "dx_HitCheck_Sphere_CapsuleD" VECTOR_D, double, VECTOR_D, VECTOR_D, double
	#cfunc global HitCheck_Sphere_Triangle "dx_HitCheck_Sphere_Triangle" VECTOR, float, VECTOR, VECTOR, VECTOR
	#cfunc global HitCheck_Sphere_TriangleD "dx_HitCheck_Sphere_TriangleD" VECTOR_D, double, VECTOR_D, VECTOR_D, VECTOR_D
	#cfunc global HitCheck_Capsule_Capsule "dx_HitCheck_Capsule_Capsule" VECTOR, VECTOR, float, VECTOR, VECTOR, float
	#cfunc global HitCheck_Capsule_CapsuleD "dx_HitCheck_Capsule_CapsuleD" VECTOR_D, VECTOR_D, double, VECTOR_D, VECTOR_D, double
	#cfunc global HitCheck_Capsule_Triangle "dx_HitCheck_Capsule_Triangle" VECTOR, VECTOR, float, VECTOR, VECTOR, VECTOR
	#cfunc global HitCheck_Capsule_TriangleD "dx_HitCheck_Capsule_TriangleD" VECTOR_D, VECTOR_D, double, VECTOR_D, VECTOR_D, VECTOR_D
	#cfunc global RectClipping "dx_RectClipping" var, var
	#cfunc global RectAdjust "dx_RectAdjust" var
	#cfunc global GetRectSize "dx_GetRectSize" var, var, var
	#cfuncst global MATRIX MGetIdent "dx_MGetIdent"
	#cfuncst global MGetIdentD "dx_MGetIdentD" 128
	#cfuncst global MATRIX MAdd "dx_MAdd" MATRIX, MATRIX
	#cfuncst global MAddD "dx_MAddD" 128, var, var
	#cfuncst global MATRIX MGetScale "dx_MGetScale" VECTOR
	#cfuncst global MGetScaleD "dx_MGetScaleD" 128, var
	#cfuncst global MATRIX MGetRotX "dx_MGetRotX" float
	#cfuncst global MGetRotXD "dx_MGetRotXD" 128, double
	#cfuncst global MATRIX MGetRotY "dx_MGetRotY" float
	#cfuncst global MGetRotYD "dx_MGetRotYD" 128, double
	#cfuncst global MATRIX MGetRotZ "dx_MGetRotZ" float
	#cfuncst global MGetRotZD "dx_MGetRotZD" 128, double
	#cfuncst global MATRIX MGetRotAxis "dx_MGetRotAxis" VECTOR, float
	#cfuncst global MGetRotAxisD "dx_MGetRotAxisD" 128, var, double
	#cfuncst global MATRIX MGetRotVec2 "dx_MGetRotVec2" VECTOR, VECTOR
	#cfuncst global MGetRotVec2D "dx_MGetRotVec2D" 128, var, var
	#cfuncst global MATRIX MGetTranslate "dx_MGetTranslate" VECTOR
	#cfuncst global MGetTranslateD "dx_MGetTranslateD" 128, var
	#cfuncst global MATRIX MGetAxis1 "dx_MGetAxis1" VECTOR, VECTOR, VECTOR, VECTOR
	#cfuncst global MGetAxis1D "dx_MGetAxis1D" 128, var, var, var, var
	#cfuncst global MATRIX MGetAxis2 "dx_MGetAxis2" VECTOR, VECTOR, VECTOR, VECTOR
	#cfuncst global MGetAxis2D "dx_MGetAxis2D" 128, var, var, var, var
	#cfuncst global MATRIX MTranspose "dx_MTranspose" MATRIX
	#cfuncst global MTransposeD "dx_MTransposeD" 128, var
	#cfuncst global MATRIX MInverse "dx_MInverse" MATRIX
	#cfuncst global MInverseD "dx_MInverseD" 128, var
	#cfuncst global VECTOR MGetSize "dx_MGetSize" MATRIX
	#cfuncst global VECTOR_D MGetSizeD "dx_MGetSizeD" MATRIX_D
	#cfuncst global MATRIX MGetRotElem "dx_MGetRotElem" MATRIX
	#cfuncst global MGetRotElemD "dx_MGetRotElemD" 128, var
	#cfuncf global VCos "dx_VCos" var, var
	#cfuncf global VRad "dx_VRad" var, var
	#cfuncst global VECTOR VRotQ "dx_VRotQ" var, var, float
	#cfuncst global VECTOR_D VRotQD "dx_VRotQD" var, var, double
	#cfunc global GetImageSize_Mem "dx_GetImageSize_Mem" int, int, var, var
	#func global SetUseFastLoadFlag "dx_SetUseFastLoadFlag" int
	#func global SetUsePremulAlphaConvertLoad "dx_SetUsePremulAlphaConvertLoad" int
	#cfunc global GetUsePremulAlphaConvertLoad "dx_GetUsePremulAlphaConvertLoad"
	#func global SetUseConvertNormalFormatLoad "dx_SetUseConvertNormalFormatLoad" int
	#cfunc global GetUseConvertNormalFormatLoad "dx_GetUseConvertNormalFormatLoad"
	#cfunc global ReadJpegExif "dx_ReadJpegExif" wstr, int, var, int
	#cfuncst global COLOR_F GetColorF "dx_GetColorF" float, float, float, float
	#cfuncst global GetColorU8 "dx_GetColorU8" 4, int, int, int, int
	#cfunc global GetColor "dx_GetColor" int, int, int
	#cfunc global GetColor2 "dx_GetColor2" int, var, var, var
	#cfunc global GetColor3 "dx_GetColor3" var, int, int, int
	#cfunc global GetColor3_1 "dx_GetColor3" var, int, int, int, int
	#cfunc global GetColor4 "dx_GetColor4" var, var, int
	#cfunc global GetColor5 "dx_GetColor5" var, int, var, var, var, var
	#cfunc global CreatePaletteColorData "dx_CreatePaletteColorData" var
	#cfunc global CreateARGBF32ColorData "dx_CreateARGBF32ColorData" var
	#cfunc global CreateARGBF16ColorData "dx_CreateARGBF16ColorData" var
	#cfunc global CreateXRGB8ColorData "dx_CreateXRGB8ColorData" var
	#cfunc global CreateARGB8ColorData "dx_CreateARGB8ColorData" var
	#cfunc global CreateRGBA8ColorData "dx_CreateRGBA8ColorData" var
	#cfunc global CreateABGR8ColorData "dx_CreateABGR8ColorData" var
	#cfunc global CreateBGRA8ColorData "dx_CreateBGRA8ColorData" var
	#cfunc global CreateBGR8ColorData "dx_CreateBGR8ColorData" var
	#cfunc global CreateARGB4ColorData "dx_CreateARGB4ColorData" var
	#cfunc global CreateA1R5G5B5ColorData "dx_CreateA1R5G5B5ColorData" var
	#cfunc global CreateX1R5G5B5ColorData "dx_CreateX1R5G5B5ColorData" var
	#cfunc global CreateR5G5B5A1ColorData "dx_CreateR5G5B5A1ColorData" var
	#cfunc global CreateR5G6B5ColorData "dx_CreateR5G6B5ColorData" var
	#cfunc global CreateFullColorData "dx_CreateFullColorData" var
	#cfunc global CreateGrayColorData "dx_CreateGrayColorData" var
	#cfunc global CreatePal8ColorData "dx_CreatePal8ColorData" var
	#cfunc global CreatePal8ColorData_1 "dx_CreatePal8ColorData" var, int
	#cfunc global CreateColorData "dx_CreateColorData" var, int, int, int, int, int
	#cfunc global CreateColorData_1 "dx_CreateColorData" var, int, int, int, int, int, int
	#cfunc global CreateColorData_2 "dx_CreateColorData" var, int, int, int, int, int, int, int
	#cfunc global CreateColorData_3 "dx_CreateColorData" var, int, int, int, int, int, int, int, int
	#func global SetColorDataNoneMask "dx_SetColorDataNoneMask" var
	#cfunc global CmpColorData "dx_CmpColorData" var, var
	#func global InitSoftImage "dx_InitSoftImage"
	#cfunc global LoadSoftImage "dx_LoadSoftImage" wstr
	#cfunc global LoadARGB8ColorSoftImage "dx_LoadARGB8ColorSoftImage" wstr
	#cfunc global LoadXRGB8ColorSoftImage "dx_LoadXRGB8ColorSoftImage" wstr
	#cfunc global LoadSoftImageToMem "dx_LoadSoftImageToMem" int, int
	#cfunc global LoadARGB8ColorSoftImageToMem "dx_LoadARGB8ColorSoftImageToMem" int, int
	#cfunc global LoadXRGB8ColorSoftImageToMem "dx_LoadXRGB8ColorSoftImageToMem" int, int
	#cfunc global MakeSoftImage "dx_MakeSoftImage" int, int
	#cfunc global MakeARGBF32ColorSoftImage "dx_MakeARGBF32ColorSoftImage" int, int
	#cfunc global MakeARGBF16ColorSoftImage "dx_MakeARGBF16ColorSoftImage" int, int
	#cfunc global MakeXRGB8ColorSoftImage "dx_MakeXRGB8ColorSoftImage" int, int
	#cfunc global MakeARGB8ColorSoftImage "dx_MakeARGB8ColorSoftImage" int, int
	#cfunc global MakeRGBA8ColorSoftImage "dx_MakeRGBA8ColorSoftImage" int, int
	#cfunc global MakeABGR8ColorSoftImage "dx_MakeABGR8ColorSoftImage" int, int
	#cfunc global MakeBGRA8ColorSoftImage "dx_MakeBGRA8ColorSoftImage" int, int
	#cfunc global MakeARGB4ColorSoftImage "dx_MakeARGB4ColorSoftImage" int, int
	#cfunc global MakeA1R5G5B5ColorSoftImage "dx_MakeA1R5G5B5ColorSoftImage" int, int
	#cfunc global MakeX1R5G5B5ColorSoftImage "dx_MakeX1R5G5B5ColorSoftImage" int, int
	#cfunc global MakeR5G5B5A1ColorSoftImage "dx_MakeR5G5B5A1ColorSoftImage" int, int
	#cfunc global MakeR5G6B5ColorSoftImage "dx_MakeR5G6B5ColorSoftImage" int, int
	#cfunc global MakeRGB8ColorSoftImage "dx_MakeRGB8ColorSoftImage" int, int
	#cfunc global MakePAL8ColorSoftImage "dx_MakePAL8ColorSoftImage" int, int
	#cfunc global MakePAL8ColorSoftImage_1 "dx_MakePAL8ColorSoftImage" int, int, int
	#cfunc global MakeColorDataSoftImage "dx_MakeColorDataSoftImage" int, int, var
	#func global DeleteSoftImage "dx_DeleteSoftImage" int
	#cfunc global GetSoftImageSize "dx_GetSoftImageSize" int, var, var
	#cfunc global CheckPaletteSoftImage "dx_CheckPaletteSoftImage" int
	#cfunc global CheckAlphaSoftImage "dx_CheckAlphaSoftImage" int
	#cfunc global CheckPixelAlphaSoftImage "dx_CheckPixelAlphaSoftImage" int
	#cfunc global FillSoftImage "dx_FillSoftImage" int, int, int, int, int
	#func global ClearRectSoftImage "dx_ClearRectSoftImage" int, int, int, int, int
	#cfunc global GetPaletteSoftImage "dx_GetPaletteSoftImage" int, int, var, var, var, var
	#func global SetPaletteSoftImage "dx_SetPaletteSoftImage" int, int, int, int, int, int
	#cfunc global GetPixelPalCodeSoftImage "dx_GetPixelPalCodeSoftImage" int, int, int
	#cfunc global GetImageAddressSoftImage "dx_GetImageAddressSoftImage" int
	#cfunc global GetPitchSoftImage "dx_GetPitchSoftImage" int
	#cfunc global GetPixelSoftImage "dx_GetPixelSoftImage" int, int, int, var, var, var, var
	#cfunc global GetPixelSoftImageF "dx_GetPixelSoftImageF" int, int, int, var, var, var, var
	#func global GetPixelSoftImage_Unsafe_XRGB8 "dx_GetPixelSoftImage_Unsafe_XRGB8" int, int, int, var, var, var
	#func global GetPixelSoftImage_Unsafe_ARGB8 "dx_GetPixelSoftImage_Unsafe_ARGB8" int, int, int, var, var, var, var
	#func global BltSoftImage "dx_BltSoftImage" int, int, int, int, int, int, int, int
	#func global BltSoftImageWithAlphaBlend "dx_BltSoftImageWithAlphaBlend" int, int, int, int, int, int, int, int
	#func global BltSoftImageWithAlphaBlend_1 "dx_BltSoftImageWithAlphaBlend" int, int, int, int, int, int, int, int, int
	#cfunc global ReverseSoftImageH "dx_ReverseSoftImageH" int
	#cfunc global ReverseSoftImageV "dx_ReverseSoftImageV" int
	#cfunc global ReverseSoftImage "dx_ReverseSoftImage" int
	#cfunc global ConvertPremulAlphaSoftImage "dx_ConvertPremulAlphaSoftImage" int
	#cfunc global ConvertInterpAlphaSoftImage "dx_ConvertInterpAlphaSoftImage" int
	#func global BltStringSoftImage "dx_BltStringSoftImage" int, int, wstr, int
	#func global BltStringSoftImage_1 "dx_BltStringSoftImage" int, int, wstr, int, int
	#func global BltStringSoftImage_2 "dx_BltStringSoftImage" int, int, wstr, int, int, int
	#func global BltStringSoftImageToHandle "dx_BltStringSoftImageToHandle" int, int, wstr, int, int, int
	#func global BltStringSoftImageToHandle_1 "dx_BltStringSoftImageToHandle" int, int, wstr, int, int, int, int
	#func global SaveSoftImageToBmp "dx_SaveSoftImageToBmp" wstr, int
	#func global SaveSoftImageToDds "dx_SaveSoftImageToDds" wstr, int
	#func global SaveSoftImageToPng "dx_SaveSoftImageToPng" wstr, int, int
	#func global SaveSoftImageToJpeg "dx_SaveSoftImageToJpeg" wstr, int, int, int
	#cfunc global LoadBGM "dx_LoadBGM" wstr
	#cfunc global GetMP3TagInfo "dx_GetMP3TagInfo" wstr, int, int, int, int, int, int, int, int, int, int, int, int, int, int, var
	#cfunc global GetOggCommentNum "dx_GetOggCommentNum" wstr
	#cfunc global GetOggComment "dx_GetOggComment" wstr, int, int, int, int, int
	#func global SetUseOldVolumeCalcFlag "dx_SetUseOldVolumeCalcFlag" int
	#cfunc global SelectMidiMode "dx_SelectMidiMode" int
	#func global SetDXArchivePriority "dx_SetDXArchivePriority"
	#func global SetDXArchivePriority_1 "dx_SetDXArchivePriority" int
	#func global SetDXArchiveExtension "dx_SetDXArchiveExtension"
	#func global SetDXArchiveExtension_1 "dx_SetDXArchiveExtension" wstr
	#cfunc global HashCRC32 "dx_HashCRC32" int, int
	#cfunc global Live2D_SetCubism4CoreDLLPath "dx_Live2D_SetCubism4CoreDLLPath" wstr
	#cfunc global Live2D_SetCubism3CoreDLLPath "dx_Live2D_SetCubism3CoreDLLPath" wstr
	#cfunc global Live2D_RenderBegin "dx_Live2D_RenderBegin"
	#cfunc global Live2D_RenderEnd "dx_Live2D_RenderEnd"
	#cfunc global Live2D_LoadModel "dx_Live2D_LoadModel" wstr
	#cfunc global Live2D_DeleteModel "dx_Live2D_DeleteModel" int
	#cfunc global Live2D_InitModel "dx_Live2D_InitModel"
	#cfunc global Live2D_SetUserShader "dx_Live2D_SetUserShader" int
	#cfunc global Live2D_SetUserShader_1 "dx_Live2D_SetUserShader" int, int
	#cfunc global Live2D_SetUseAutoScaling "dx_Live2D_SetUseAutoScaling" int
	#cfunc global Live2D_SetUseAutoCentering "dx_Live2D_SetUseAutoCentering" int
	#cfunc global Live2D_SetUseReverseYAxis "dx_Live2D_SetUseReverseYAxis" int
	#cfunc global Live2D_Model_Update "dx_Live2D_Model_Update" int, float
	#cfunc global Live2D_Model_SetTranslate "dx_Live2D_Model_SetTranslate" int, float, float
	#cfunc global Live2D_Model_SetExtendRate "dx_Live2D_Model_SetExtendRate" int, float, float
	#cfunc global Live2D_Model_SetRotate "dx_Live2D_Model_SetRotate" int, float
	#cfunc global Live2D_Model_Draw "dx_Live2D_Model_Draw" int
	#cfunc global Live2D_Model_StartMotion "dx_Live2D_Model_StartMotion" int, wstr, int
	#cfunc global Live2D_Model_StartMotion_1 "dx_Live2D_Model_StartMotion" int, wstr, int, float
	#cfunc global Live2D_Model_StartMotion_2 "dx_Live2D_Model_StartMotion" int, wstr, int, float, float
	#cfunc global Live2D_Model_StartMotion_3 "dx_Live2D_Model_StartMotion" int, wstr, int, float, float, int
	#cfunc global Live2D_Model_GetLastPlayMotionNo "dx_Live2D_Model_GetLastPlayMotionNo" int
	#cfunc global Live2D_Model_IsMotionFinished "dx_Live2D_Model_IsMotionFinished" int
	#cfuncf global Live2D_Model_GetMotionPlayTime "dx_Live2D_Model_GetMotionPlayTime" int
	#cfunc global Live2D_Model_SetExpression "dx_Live2D_Model_SetExpression" int, wstr
	#cfunc global Live2D_Model_HitTest "dx_Live2D_Model_HitTest" int, wstr, float, float
	#cfunc global Live2D_Model_GetParameterCount "dx_Live2D_Model_GetParameterCount" int
	#cfunc global Live2D_Model_GetParameterId "dx_Live2D_Model_GetParameterId" int, int
	#cfuncf global Live2D_Model_GetParameterValue "dx_Live2D_Model_GetParameterValue" int, wstr
	#cfunc global Live2D_Model_SetParameterValue "dx_Live2D_Model_SetParameterValue" int, wstr, float
	#cfunc global Live2D_Model_GetHitAreasCount "dx_Live2D_Model_GetHitAreasCount" int
	#cfunc global Live2D_Model_GetHitAreaName "dx_Live2D_Model_GetHitAreaName" int, int
	#cfunc global Live2D_Model_GetExpressionCount "dx_Live2D_Model_GetExpressionCount" int
	#cfunc global Live2D_Model_GetExpressionName "dx_Live2D_Model_GetExpressionName" int, int
	#cfunc global Live2D_Model_GetMotionGroupCount "dx_Live2D_Model_GetMotionGroupCount" int
	#cfunc global Live2D_Model_GetMotionGroupName "dx_Live2D_Model_GetMotionGroupName" int, int
	#cfunc global Live2D_Model_GetMotionCount "dx_Live2D_Model_GetMotionCount" int, wstr
	#cfuncf global Live2D_Model_GetMotionFadeInTimeValue "dx_Live2D_Model_GetMotionFadeInTimeValue" int, wstr, int
	#cfuncf global Live2D_Model_GetMotionFadeOutTimeValue "dx_Live2D_Model_GetMotionFadeOutTimeValue" int, wstr, int
	#cfunc global Live2D_Model_GetEyeBlinkParameterCount "dx_Live2D_Model_GetEyeBlinkParameterCount" int
	#cfunc global Live2D_Model_GetEyeBlinkParameterId "dx_Live2D_Model_GetEyeBlinkParameterId" int, int
	#cfunc global Live2D_Model_GetLipSyncParameterCount "dx_Live2D_Model_GetLipSyncParameterCount" int
	#cfunc global Live2D_Model_GetLipSyncParameterId "dx_Live2D_Model_GetLipSyncParameterId" int, int
	#cfuncf global Live2D_Model_GetCanvasWidth "dx_Live2D_Model_GetCanvasWidth" int
	#cfuncf global Live2D_Model_GetCanvasHeight "dx_Live2D_Model_GetCanvasHeight" int
	#cfunc global GetActiveFlag "dx_GetActiveFlag"
	#cfunc global GetDefaultState "dx_GetDefaultState" var, var, var, var, var, var, var, var, var, var
	#cfunc global GetMonitorDpi "dx_GetMonitorDpi" var, var
	#cfunc global GetMonitorDpi_1 "dx_GetMonitorDpi" var, var, int
	#cfunc global GetNoActiveState "dx_GetNoActiveState"
	#cfunc global GetNoActiveState_1 "dx_GetNoActiveState" int
	#cfunc global GetAlwaysRunFlag "dx_GetAlwaysRunFlag"
	#cfunc global GetSystemInfo_ "dx_GetSystemInfo_" var, var, var
	#cfunc global GetPcInfo "dx_GetPcInfo" int, int, int, var, var, var, int, int, var, var
	#cfunc global GetUseMMXFlag "dx_GetUseMMXFlag"
	#cfunc global GetUseSSEFlag "dx_GetUseSSEFlag"
	#cfunc global GetUseSSE2Flag "dx_GetUseSSE2Flag"
	#cfunc global GetNotDrawFlag "dx_GetNotDrawFlag"
	#cfunc global GetPaintMessageFlag "dx_GetPaintMessageFlag"
	#cfunc global GetValidHiPerformanceCounter "dx_GetValidHiPerformanceCounter"
	#cfunc global LoadPauseGraph "dx_LoadPauseGraph" wstr
	#cfunc global LoadPauseGraphFromMem "dx_LoadPauseGraphFromMem" int, int
	#func global SetSysCommandOffFlag "dx_SetSysCommandOffFlag" int
	#func global SetSysCommandOffFlag_1 "dx_SetSysCommandOffFlag" int, wstr
	#func global SetUseHookWinProcReturnValue "dx_SetUseHookWinProcReturnValue" int
	#cfunc global CheckDoubleStart "dx_CheckDoubleStart"
	#func global SetNotWinFlag "dx_SetNotWinFlag" int
	#func global SetNotDrawFlag "dx_SetNotDrawFlag" int
	#func global SetDialogBoxHandle "dx_SetDialogBoxHandle" int
	#func global SetDxLibEndPostQuitMessageFlag "dx_SetDxLibEndPostQuitMessageFlag" int
	#func global SetUseFPUPreserveFlag "dx_SetUseFPUPreserveFlag" int
	#func global SetUseDxLibWM_PAINTProcess "dx_SetUseDxLibWM_PAINTProcess" int
	#func global SetupToolBar "dx_SetupToolBar" wstr, int
	#func global SetupToolBar_1 "dx_SetupToolBar" wstr, int, int
	#func global AddToolBarButton "dx_AddToolBarButton" int, int, int, int
	#func global AddToolBarSep "dx_AddToolBarSep"
	#cfunc global GetToolBarButtonState "dx_GetToolBarButtonState" int
	#func global SetToolBarButtonState "dx_SetToolBarButtonState" int, int
	#func global DeleteAllToolBarButton "dx_DeleteAllToolBarButton"
	#func global SetUseMenuFlag "dx_SetUseMenuFlag" int
	#func global AddMenuItem "dx_AddMenuItem" int, wstr, int, int
	#func global AddMenuItem_1 "dx_AddMenuItem" int, wstr, int, int, wstr
	#func global AddMenuItem_2 "dx_AddMenuItem" int, wstr, int, int, wstr, int
	#func global DeleteMenuItem "dx_DeleteMenuItem" wstr, int
	#cfunc global CheckMenuItemSelect "dx_CheckMenuItemSelect" wstr, int
	#func global SetMenuItemEnable "dx_SetMenuItemEnable" wstr, int, int
	#func global SetMenuItemMark "dx_SetMenuItemMark" wstr, int, int
	#cfunc global CheckMenuItemSelectAll "dx_CheckMenuItemSelectAll"
	#func global AddMenuItem_Name "dx_AddMenuItem_Name" wstr, wstr
	#func global AddMenuLine_Name "dx_AddMenuLine_Name" wstr
	#func global InsertMenuItem_Name "dx_InsertMenuItem_Name" wstr, wstr
	#func global InsertMenuLine_Name "dx_InsertMenuLine_Name" wstr
	#func global DeleteMenuItem_Name "dx_DeleteMenuItem_Name" wstr
	#cfunc global CheckMenuItemSelect_Name "dx_CheckMenuItemSelect_Name" wstr
	#func global SetMenuItemEnable_Name "dx_SetMenuItemEnable_Name" wstr, int
	#func global SetMenuItemMark_Name "dx_SetMenuItemMark_Name" wstr, int
	#func global AddMenuItem_ID "dx_AddMenuItem_ID" int, wstr
	#func global AddMenuItem_ID_1 "dx_AddMenuItem_ID" int, wstr, int
	#func global AddMenuLine_ID "dx_AddMenuLine_ID" int
	#func global InsertMenuItem_ID "dx_InsertMenuItem_ID" int, int
	#func global InsertMenuLine_ID "dx_InsertMenuLine_ID" int, int
	#func global DeleteMenuItem_ID "dx_DeleteMenuItem_ID" int
	#cfunc global CheckMenuItemSelect_ID "dx_CheckMenuItemSelect_ID" int
	#func global SetMenuItemEnable_ID "dx_SetMenuItemEnable_ID" int, int
	#func global SetMenuItemMark_ID "dx_SetMenuItemMark_ID" int, int
	#func global DeleteMenuItemAll "dx_DeleteMenuItemAll"
	#func global ClearMenuItemSelect "dx_ClearMenuItemSelect"
	#cfunc global GetMenuItemID "dx_GetMenuItemID" wstr
	#cfunc global GetMenuItemIDDX "dx_GetMenuItemIDDX" wstr
	#cfunc global GetMenuItemName "dx_GetMenuItemName" int, int
	#cfunc global LoadMenuResource "dx_LoadMenuResource" int
	#func global SetDisplayMenuFlag "dx_SetDisplayMenuFlag" int
	#cfunc global GetDisplayMenuFlag "dx_GetDisplayMenuFlag"
	#cfunc global GetUseMenuFlag "dx_GetUseMenuFlag"
	#func global SetAutoMenuDisplayFlag "dx_SetAutoMenuDisplayFlag" int
	#cfunc global GetWinSockLastError "dx_GetWinSockLastError"
	#func global SetUseTSFFlag "dx_SetUseTSFFlag" int
	#cfunc global LoadDivGraphToResource "dx_LoadDivGraphToResource" int, int, int, int, int, int, int, var
	#cfunc global LoadDivGraphFToResource "dx_LoadDivGraphFToResource" int, int, int, int, float, float, int, var
	#cfunc global LoadDivGraphToResource_1 "dx_LoadDivGraphToResource" wstr, wstr, int, int, int, int, int, int, var
	#cfunc global LoadDivGraphFToResource_1 "dx_LoadDivGraphFToResource" wstr, wstr, int, int, int, float, float, int, var
	#cfunc global LoadDivGraphToResource2 "dx_LoadDivGraphToResource2" wstr, wstr, int, int, int, int, int, int, var
	#cfunc global LoadDivGraphFToResource2 "dx_LoadDivGraphFToResource2" wstr, wstr, int, int, int, float, float, int, var
	#func global SetMultiThreadFlag "dx_SetMultiThreadFlag" int
	#func global SetUseDirectDrawDeviceIndex "dx_SetUseDirectDrawDeviceIndex" int
	#func global SetAeroDisableFlag "dx_SetAeroDisableFlag" int
	#func global SetUseDirect3D9Ex "dx_SetUseDirect3D9Ex" int
	#func global SetUseDirect3D11 "dx_SetUseDirect3D11" int
	#func global SetUseDirect3D11MinFeatureLevel "dx_SetUseDirect3D11MinFeatureLevel" int
	#func global SetUseDirect3D11WARPDriver "dx_SetUseDirect3D11WARPDriver" int
	#func global SetUseDirect3DVersion "dx_SetUseDirect3DVersion" int
	#cfunc global GetUseDirect3DVersion "dx_GetUseDirect3DVersion"
	#cfunc global GetUseDirect3D11FeatureLevel "dx_GetUseDirect3D11FeatureLevel"
	#func global SetUseDirect3D11AdapterIndex "dx_SetUseDirect3D11AdapterIndex" int
	#func global SetUseDirect3D11BGRASupport "dx_SetUseDirect3D11BGRASupport" int
	#cfunc global GetUseDirect3D11BGRASupport "dx_GetUseDirect3D11BGRASupport"
	#func global SetUseDirectDrawFlag "dx_SetUseDirectDrawFlag" int
	#func global SetUseGDIFlag "dx_SetUseGDIFlag" int
	#cfunc global GetUseGDIFlag "dx_GetUseGDIFlag"
	#cfunc global GetDirectDrawDeviceDescription "dx_GetDirectDrawDeviceDescription" int, int
	#cfunc global GetDirectDrawDeviceNum "dx_GetDirectDrawDeviceNum"
	#cfunc global GetUseDirect3DDevice9 "dx_GetUseDirect3DDevice9"
	#cfunc global GetUseDirect3D9BackBufferSurface "dx_GetUseDirect3D9BackBufferSurface"
	#cfunc global GetUseDirect3D11Device "dx_GetUseDirect3D11Device"
	#cfunc global GetUseDirect3D11DeviceContext "dx_GetUseDirect3D11DeviceContext"
	#cfunc global GetUseDirect3D11BackBufferTexture2D "dx_GetUseDirect3D11BackBufferTexture2D"
	#cfunc global GetUseDirect3D11BackBufferRenderTargetView "dx_GetUseDirect3D11BackBufferRenderTargetView"
	#cfunc global GetUseDirect3D11DepthStencilTexture2D "dx_GetUseDirect3D11DepthStencilTexture2D"
	#func global RefreshDxLibDirect3DSetting "dx_RefreshDxLibDirect3DSetting"
	#func global SetUseDirect3D11SwapEffect "dx_SetUseDirect3D11SwapEffect" int
	#func global SetUseMediaFoundationFlag "dx_SetUseMediaFoundationFlag" int
	#cfunc global ColorKaiseki "dx_ColorKaiseki" int, var
	#func global SetEnableXAudioFlag "dx_SetEnableXAudioFlag" int
	#func global SetEnableWASAPIFlag "dx_SetEnableWASAPIFlag" int
	#func global SetEnableWASAPIFlag_1 "dx_SetEnableWASAPIFlag" int, int
	#func global SetEnableWASAPIFlag_2 "dx_SetEnableWASAPIFlag" int, int, int
	#func global SetEnableWASAPIFlag_3 "dx_SetEnableWASAPIFlag" int, int, int, int
	#func global SetEnableASIOFlag "dx_SetEnableASIOFlag" int
	#func global SetEnableASIOFlag_1 "dx_SetEnableASIOFlag" int, int
	#func global SetEnableASIOFlag_2 "dx_SetEnableASIOFlag" int, int, int
	#func global SetUseASIODriverIndex "dx_SetUseASIODriverIndex" int
	#func global SetEnableMMEwaveOutFlag "dx_SetEnableMMEwaveOutFlag" int
	#func global SetEnableMMEwaveOutFlag_1 "dx_SetEnableMMEwaveOutFlag" int, int
	#func global SetEnableMMEwaveOutFlag_2 "dx_SetEnableMMEwaveOutFlag" int, int, int

	; Total: 2738 functions exported

#endif ; __HSPDXLIB__
#endif ; __hsp30__
