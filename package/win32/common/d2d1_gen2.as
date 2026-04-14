; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    d2d1.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __d2d1_gen2_as__
#define __d2d1_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "d2d1.dll"
; float D2D1ComputeMaximumScaleFactor(winmdroot.Graphics.Direct2D.Common.D2D_MATRIX_3X2_F* matrix)
#cfunc D2D1ComputeMaximumScaleFactor "D2D1ComputeMaximumScaleFactor" var

; winmdroot.Graphics.Direct2D.Common.D2D1_COLOR_F D2D1ConvertColorSpace(winmdroot.Graphics.Direct2D.D2D1_COLOR_SPACE sourceColorSpace, winmdroot.Graphics.Direct2D.D2D1_COLOR_SPACE destinationColorSpace, winmdroot.Graphics.Direct2D.Common.D2D1_COLOR_F* color)
#cfunc D2D1ConvertColorSpace "D2D1ConvertColorSpace" int, int, var

; winmdroot.Foundation.HRESULT D2D1CreateDevice(winmdroot.Graphics.Dxgi.IDXGIDevice* dxgiDevice, [Optional] winmdroot.Graphics.Direct2D.D2D1_CREATION_PROPERTIES* creationProperties, winmdroot.Graphics.Direct2D.ID2D1Device** d2dDevice)
#cfunc D2D1CreateDevice "D2D1CreateDevice" var, var, var

; winmdroot.Foundation.HRESULT D2D1CreateDeviceContext(winmdroot.Graphics.Dxgi.IDXGISurface* dxgiSurface, [Optional] winmdroot.Graphics.Direct2D.D2D1_CREATION_PROPERTIES* creationProperties, winmdroot.Graphics.Direct2D.ID2D1DeviceContext** d2dDeviceContext)
#cfunc D2D1CreateDeviceContext "D2D1CreateDeviceContext" var, var, var

; winmdroot.Foundation.HRESULT D2D1CreateFactory(winmdroot.Graphics.Direct2D.D2D1_FACTORY_TYPE factoryType, global::System.Guid* riid, [Optional] winmdroot.Graphics.Direct2D.D2D1_FACTORY_OPTIONS* pFactoryOptions, void** ppIFactory)
#cfunc D2D1CreateFactory "D2D1CreateFactory" int, var, var, var

; void D2D1GetGradientMeshInteriorPointsFromCoonsPatch(winmdroot.Graphics.Direct2D.Common.D2D_POINT_2F* pPoint0, winmdroot.Graphics.Direct2D.Common.D2D_POINT_2F* pPoint1, winmdroot.Graphics.Direct2D.Common.D2D_POINT_2F* pPoint2, winmdroot.Graphics.Direct2D.Common.D2D_POINT_2F* pPoint3, winmdroot.Graphics.Direct2D.Common.D2D_POINT_2F* pPoint4, winmdroot.Graphics.Direct2D.Common.D2D_POINT_2F* pPoint5, winmdroot.Graphics.Direct2D.Common.D2D_POINT_2F* pPoint6, winmdroot.Graphics.Direct2D.Common.D2D_POINT_2F* pPoint7, winmdroot.Graphics.Direct2D.Common.D2D_POINT_2F* pPoint8, winmdroot.Graphics.Direct2D.Common.D2D_POINT_2F* pPoint9, winmdroot.Graphics.Direct2D.Common.D2D_POINT_2F* pPoint10, winmdroot.Graphics.Direct2D.Common.D2D_POINT_2F* pPoint11, winmdroot.Graphics.Direct2D.Common.D2D_POINT_2F* pTensorPoint11, winmdroot.Graphics.Direct2D.Common.D2D_POINT_2F* pTensorPoint12, winmdroot.Graphics.Direct2D.Common.D2D_POINT_2F* pTensorPoint21, winmdroot.Graphics.Direct2D.Common.D2D_POINT_2F* pTensorPoint22)
#func D2D1GetGradientMeshInteriorPointsFromCoonsPatch "D2D1GetGradientMeshInteriorPointsFromCoonsPatch" var, var, var, var, var, var, var, var, var, var, var, var, var, var, var, var

; winmdroot.Foundation.BOOL D2D1InvertMatrix(winmdroot.Graphics.Direct2D.Common.D2D_MATRIX_3X2_F* matrix)
#cfunc D2D1InvertMatrix "D2D1InvertMatrix" var

; winmdroot.Foundation.BOOL D2D1IsMatrixInvertible(winmdroot.Graphics.Direct2D.Common.D2D_MATRIX_3X2_F* matrix)
#cfunc D2D1IsMatrixInvertible "D2D1IsMatrixInvertible" var

; void D2D1MakeRotateMatrix(float angle, winmdroot.Graphics.Direct2D.Common.D2D_POINT_2F center, winmdroot.Graphics.Direct2D.Common.D2D_MATRIX_3X2_F* matrix)
#func D2D1MakeRotateMatrix "D2D1MakeRotateMatrix" float, var, var

; void D2D1MakeSkewMatrix(float angleX, float angleY, winmdroot.Graphics.Direct2D.Common.D2D_POINT_2F center, winmdroot.Graphics.Direct2D.Common.D2D_MATRIX_3X2_F* matrix)
#func D2D1MakeSkewMatrix "D2D1MakeSkewMatrix" float, float, var, var

; void D2D1SinCos(float angle, float* s, float* c)
#func D2D1SinCos "D2D1SinCos" float, var, var

; float D2D1Tan(float angle)
#cfunc D2D1Tan "D2D1Tan" float

; float D2D1Vec3Length(float x, float y, float z)
#cfunc D2D1Vec3Length "D2D1Vec3Length" float, float, float

#endif
