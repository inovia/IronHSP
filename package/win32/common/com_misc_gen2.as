;============================================================
;  COM interfaces (misc) ? auto-generated from CsWin32
;  allowMarshaling=true sandbox
;  tool: tools/cswin32_bridge_com/gen_com_from_cswin32.py
;  hsp3net êÍóp (#usecom / #comfunc + intptr / comobj)
;============================================================

#ifndef __com_misc_gen2_as__
#define __com_misc_gen2_as__

;--- IAdviseSink
#define IID_IAdviseSink "{0000010F-0000-0000-C000-000000000046}"
#usecom IAdviseSink IID_IAdviseSink "{}"
#comfunc IAdviseSink_OnDataChange 3 var, int
#comfunc IAdviseSink_OnViewChange 4 int, int
#comfunc IAdviseSink_OnRename 5 comobj
#comfunc IAdviseSink_OnSave 6
#comfunc IAdviseSink_OnClose 7

;--- IBindCtx
#define IID_IBindCtx "{0000000E-0000-0000-C000-000000000046}"
#usecom IBindCtx IID_IBindCtx "{}"
#comfunc IBindCtx_RegisterObjectBound 3 int
#comfunc IBindCtx_RevokeObjectBound 4 int
#comfunc IBindCtx_ReleaseBoundObjects 5
#comfunc IBindCtx_SetBindOptions 6 var
#comfunc IBindCtx_GetBindOptions 7 var
#comfunc IBindCtx_GetRunningObjectTable 8 comobj
#comfunc IBindCtx_RegisterObjectParam 9 wstr, int
#comfunc IBindCtx_GetObjectParam 10 wstr, int
#comfunc IBindCtx_EnumObjectParam 11 comobj
#comfunc IBindCtx_RevokeObjectParam 12 wstr

;--- IBinding
#define IID_IBinding "{79EAC9C0-BAF9-11CE-8C82-00AA004BA90B}"
#usecom IBinding IID_IBinding "{}"
#comfunc IBinding_Abort 3
#comfunc IBinding_Suspend 4
#comfunc IBinding_Resume 5
#comfunc IBinding_SetPriority 6 int
#comfunc IBinding_GetPriority 7 int
#comfunc IBinding_GetBindResult 8 var, int, var, int

;--- IBindStatusCallback
#define IID_IBindStatusCallback "{79EAC9C1-BAF9-11CE-8C82-00AA004BA90B}"
#usecom IBindStatusCallback IID_IBindStatusCallback "{}"
#comfunc IBindStatusCallback_OnStartBinding 3 int, comobj
#comfunc IBindStatusCallback_GetPriority 4 int
#comfunc IBindStatusCallback_OnLowResource 5 int
#comfunc IBindStatusCallback_OnProgress 6 int, int, int, wstr
#comfunc IBindStatusCallback_OnStopBinding 7 intptr, wstr
#comfunc IBindStatusCallback_GetBindInfo 8 int, int
#comfunc IBindStatusCallback_OnDataAvailable 9 int, int, var, int
#comfunc IBindStatusCallback_OnObjectAvailable 10 var, int

;--- ID2D1Bitmap
#define IID_ID2D1Bitmap "{A2296057-EA42-4099-983B-539FB6505426}"
#usecom ID2D1Bitmap IID_ID2D1Bitmap "{}"
#comfunc ID2D1Bitmap_GetFactory 3 comobj
#comfunc ID2D1Bitmap_GetSize 4
#comfunc ID2D1Bitmap_GetPixelSize 5
#comfunc ID2D1Bitmap_GetPixelFormat 6
#comfunc ID2D1Bitmap_GetDpi 7 float, float
#comfunc ID2D1Bitmap_CopyFromBitmap 8 var, comobj, var
#comfunc ID2D1Bitmap_CopyFromRenderTarget 9 var, comobj, var
#comfunc ID2D1Bitmap_CopyFromMemory 10 var, intptr, int

;--- ID2D1BitmapBrush
#define IID_ID2D1BitmapBrush "{2CD906AA-12E2-11DC-9FED-001143A055F9}"
#usecom ID2D1BitmapBrush IID_ID2D1BitmapBrush "{}"
#comfunc ID2D1BitmapBrush_GetFactory 3 comobj
#comfunc ID2D1BitmapBrush_SetOpacity 4 float
#comfunc ID2D1BitmapBrush_SetTransform 5 var
#comfunc ID2D1BitmapBrush_GetOpacity 6
#comfunc ID2D1BitmapBrush_GetTransform 7 var
#comfunc ID2D1BitmapBrush_SetExtendModeX 8 int
#comfunc ID2D1BitmapBrush_SetExtendModeY 9 int
#comfunc ID2D1BitmapBrush_SetInterpolationMode 10 int
#comfunc ID2D1BitmapBrush_SetBitmap 11 comobj
#comfunc ID2D1BitmapBrush_GetExtendModeX 12
#comfunc ID2D1BitmapBrush_GetExtendModeY 13
#comfunc ID2D1BitmapBrush_GetInterpolationMode 14
#comfunc ID2D1BitmapBrush_GetBitmap 15 comobj

;--- ID2D1BitmapRenderTarget
#define IID_ID2D1BitmapRenderTarget "{2CD90695-12E2-11DC-9FED-001143A055F9}"
#usecom ID2D1BitmapRenderTarget IID_ID2D1BitmapRenderTarget "{}"
#comfunc ID2D1BitmapRenderTarget_GetFactory 3 comobj
#comfunc ID2D1BitmapRenderTarget_CreateBitmap 4 int, intptr, int, var, comobj
#comfunc ID2D1BitmapRenderTarget_CreateBitmapFromWicBitmap 5 comobj, var, comobj
#comfunc ID2D1BitmapRenderTarget_CreateSharedBitmap 6 var, intptr, var, comobj
#comfunc ID2D1BitmapRenderTarget_CreateBitmapBrush 7 comobj, var, var, comobj
#comfunc ID2D1BitmapRenderTarget_CreateSolidColorBrush 8 var, var, comobj
#comfunc ID2D1BitmapRenderTarget_CreateGradientStopCollection 9 var, int, int, int, comobj
#comfunc ID2D1BitmapRenderTarget_CreateLinearGradientBrush 10 var, var, comobj, comobj
#comfunc ID2D1BitmapRenderTarget_CreateRadialGradientBrush 11 var, var, comobj, comobj
#comfunc ID2D1BitmapRenderTarget_CreateCompatibleRenderTarget 12 var, var, var, int, comobj
#comfunc ID2D1BitmapRenderTarget_CreateLayer 13 var, comobj
#comfunc ID2D1BitmapRenderTarget_CreateMesh 14 comobj
#comfunc ID2D1BitmapRenderTarget_DrawLine 15 int, int, comobj, float, comobj
#comfunc ID2D1BitmapRenderTarget_DrawRectangle 16 var, comobj, float, comobj
#comfunc ID2D1BitmapRenderTarget_FillRectangle 17 var, comobj
#comfunc ID2D1BitmapRenderTarget_DrawRoundedRectangle 18 var, comobj, float, comobj
#comfunc ID2D1BitmapRenderTarget_FillRoundedRectangle 19 var, comobj
#comfunc ID2D1BitmapRenderTarget_DrawEllipse 20 var, comobj, float, comobj
#comfunc ID2D1BitmapRenderTarget_FillEllipse 21 var, comobj
#comfunc ID2D1BitmapRenderTarget_DrawGeometry 22 comobj, comobj, float, comobj
#comfunc ID2D1BitmapRenderTarget_FillGeometry 23 comobj, comobj, comobj
#comfunc ID2D1BitmapRenderTarget_FillMesh 24 comobj, comobj
#comfunc ID2D1BitmapRenderTarget_FillOpacityMask 25 comobj, comobj, int, var, var
#comfunc ID2D1BitmapRenderTarget_DrawBitmap 26 comobj, var, float, int, var
#comfunc ID2D1BitmapRenderTarget_DrawText 27 int, int, comobj, var, comobj, int, int
#comfunc ID2D1BitmapRenderTarget_DrawTextLayout 28 int, comobj, comobj, int
#comfunc ID2D1BitmapRenderTarget_DrawGlyphRun 29 int, int, comobj, int
#comfunc ID2D1BitmapRenderTarget_SetTransform 30 var
#comfunc ID2D1BitmapRenderTarget_GetTransform 31 var
#comfunc ID2D1BitmapRenderTarget_SetAntialiasMode 32 int
#comfunc ID2D1BitmapRenderTarget_GetAntialiasMode 33
#comfunc ID2D1BitmapRenderTarget_SetTextAntialiasMode 34 int
#comfunc ID2D1BitmapRenderTarget_GetTextAntialiasMode 35
#comfunc ID2D1BitmapRenderTarget_SetTextRenderingParams 36 comobj
#comfunc ID2D1BitmapRenderTarget_GetTextRenderingParams 37 comobj
#comfunc ID2D1BitmapRenderTarget_SetTags 38 int64, int64
#comfunc ID2D1BitmapRenderTarget_GetTags 39 var, var
#comfunc ID2D1BitmapRenderTarget_PushLayer 40 int, comobj
#comfunc ID2D1BitmapRenderTarget_PopLayer 41
#comfunc ID2D1BitmapRenderTarget_Flush 42 var, var
#comfunc ID2D1BitmapRenderTarget_SaveDrawingState 43 comobj
#comfunc ID2D1BitmapRenderTarget_RestoreDrawingState 44 comobj
#comfunc ID2D1BitmapRenderTarget_PushAxisAlignedClip 45 var, int
#comfunc ID2D1BitmapRenderTarget_PopAxisAlignedClip 46
#comfunc ID2D1BitmapRenderTarget_Clear 47 var
#comfunc ID2D1BitmapRenderTarget_BeginDraw 48
#comfunc ID2D1BitmapRenderTarget_EndDraw 49 var, var
#comfunc ID2D1BitmapRenderTarget_GetPixelFormat 50
#comfunc ID2D1BitmapRenderTarget_SetDpi 51 float, float
#comfunc ID2D1BitmapRenderTarget_GetDpi 52 float, float
#comfunc ID2D1BitmapRenderTarget_GetSize 53
#comfunc ID2D1BitmapRenderTarget_GetPixelSize 54
#comfunc ID2D1BitmapRenderTarget_GetMaximumBitmapSize 55
#comfunc ID2D1BitmapRenderTarget_IsSupported 56 var
#comfunc ID2D1BitmapRenderTarget_GetBitmap 57 comobj

;--- ID2D1Brush
#define IID_ID2D1Brush "{2CD906A8-12E2-11DC-9FED-001143A055F9}"
#usecom ID2D1Brush IID_ID2D1Brush "{}"
#comfunc ID2D1Brush_GetFactory 3 comobj
#comfunc ID2D1Brush_SetOpacity 4 float
#comfunc ID2D1Brush_SetTransform 5 var
#comfunc ID2D1Brush_GetOpacity 6
#comfunc ID2D1Brush_GetTransform 7 var

;--- ID2D1DCRenderTarget
#define IID_ID2D1DCRenderTarget "{1C51BC64-DE61-46FD-9899-63A5D8F03950}"
#usecom ID2D1DCRenderTarget IID_ID2D1DCRenderTarget "{}"
#comfunc ID2D1DCRenderTarget_GetFactory 3 comobj
#comfunc ID2D1DCRenderTarget_CreateBitmap 4 int, intptr, int, var, comobj
#comfunc ID2D1DCRenderTarget_CreateBitmapFromWicBitmap 5 comobj, var, comobj
#comfunc ID2D1DCRenderTarget_CreateSharedBitmap 6 var, intptr, var, comobj
#comfunc ID2D1DCRenderTarget_CreateBitmapBrush 7 comobj, var, var, comobj
#comfunc ID2D1DCRenderTarget_CreateSolidColorBrush 8 var, var, comobj
#comfunc ID2D1DCRenderTarget_CreateGradientStopCollection 9 var, int, int, int, comobj
#comfunc ID2D1DCRenderTarget_CreateLinearGradientBrush 10 var, var, comobj, comobj
#comfunc ID2D1DCRenderTarget_CreateRadialGradientBrush 11 var, var, comobj, comobj
#comfunc ID2D1DCRenderTarget_CreateCompatibleRenderTarget 12 var, var, var, int, comobj
#comfunc ID2D1DCRenderTarget_CreateLayer 13 var, comobj
#comfunc ID2D1DCRenderTarget_CreateMesh 14 comobj
#comfunc ID2D1DCRenderTarget_DrawLine 15 int, int, comobj, float, comobj
#comfunc ID2D1DCRenderTarget_DrawRectangle 16 var, comobj, float, comobj
#comfunc ID2D1DCRenderTarget_FillRectangle 17 var, comobj
#comfunc ID2D1DCRenderTarget_DrawRoundedRectangle 18 var, comobj, float, comobj
#comfunc ID2D1DCRenderTarget_FillRoundedRectangle 19 var, comobj
#comfunc ID2D1DCRenderTarget_DrawEllipse 20 var, comobj, float, comobj
#comfunc ID2D1DCRenderTarget_FillEllipse 21 var, comobj
#comfunc ID2D1DCRenderTarget_DrawGeometry 22 comobj, comobj, float, comobj
#comfunc ID2D1DCRenderTarget_FillGeometry 23 comobj, comobj, comobj
#comfunc ID2D1DCRenderTarget_FillMesh 24 comobj, comobj
#comfunc ID2D1DCRenderTarget_FillOpacityMask 25 comobj, comobj, int, var, var
#comfunc ID2D1DCRenderTarget_DrawBitmap 26 comobj, var, float, int, var
#comfunc ID2D1DCRenderTarget_DrawText 27 int, int, comobj, var, comobj, int, int
#comfunc ID2D1DCRenderTarget_DrawTextLayout 28 int, comobj, comobj, int
#comfunc ID2D1DCRenderTarget_DrawGlyphRun 29 int, int, comobj, int
#comfunc ID2D1DCRenderTarget_SetTransform 30 var
#comfunc ID2D1DCRenderTarget_GetTransform 31 var
#comfunc ID2D1DCRenderTarget_SetAntialiasMode 32 int
#comfunc ID2D1DCRenderTarget_GetAntialiasMode 33
#comfunc ID2D1DCRenderTarget_SetTextAntialiasMode 34 int
#comfunc ID2D1DCRenderTarget_GetTextAntialiasMode 35
#comfunc ID2D1DCRenderTarget_SetTextRenderingParams 36 comobj
#comfunc ID2D1DCRenderTarget_GetTextRenderingParams 37 comobj
#comfunc ID2D1DCRenderTarget_SetTags 38 int64, int64
#comfunc ID2D1DCRenderTarget_GetTags 39 var, var
#comfunc ID2D1DCRenderTarget_PushLayer 40 int, comobj
#comfunc ID2D1DCRenderTarget_PopLayer 41
#comfunc ID2D1DCRenderTarget_Flush 42 var, var
#comfunc ID2D1DCRenderTarget_SaveDrawingState 43 comobj
#comfunc ID2D1DCRenderTarget_RestoreDrawingState 44 comobj
#comfunc ID2D1DCRenderTarget_PushAxisAlignedClip 45 var, int
#comfunc ID2D1DCRenderTarget_PopAxisAlignedClip 46
#comfunc ID2D1DCRenderTarget_Clear 47 var
#comfunc ID2D1DCRenderTarget_BeginDraw 48
#comfunc ID2D1DCRenderTarget_EndDraw 49 var, var
#comfunc ID2D1DCRenderTarget_GetPixelFormat 50
#comfunc ID2D1DCRenderTarget_SetDpi 51 float, float
#comfunc ID2D1DCRenderTarget_GetDpi 52 float, float
#comfunc ID2D1DCRenderTarget_GetSize 53
#comfunc ID2D1DCRenderTarget_GetPixelSize 54
#comfunc ID2D1DCRenderTarget_GetMaximumBitmapSize 55
#comfunc ID2D1DCRenderTarget_IsSupported 56 var
#comfunc ID2D1DCRenderTarget_BindDC 57 intptr, var

;--- ID2D1DrawingStateBlock
#define IID_ID2D1DrawingStateBlock "{28506E39-EBF6-46A1-BB47-FD85565AB957}"
#usecom ID2D1DrawingStateBlock IID_ID2D1DrawingStateBlock "{}"
#comfunc ID2D1DrawingStateBlock_GetFactory 3 comobj
#comfunc ID2D1DrawingStateBlock_GetDescription 4 var
#comfunc ID2D1DrawingStateBlock_SetDescription 5 var
#comfunc ID2D1DrawingStateBlock_SetTextRenderingParams 6 comobj
#comfunc ID2D1DrawingStateBlock_GetTextRenderingParams 7 comobj

;--- ID2D1EllipseGeometry
#define IID_ID2D1EllipseGeometry "{2CD906A4-12E2-11DC-9FED-001143A055F9}"
#usecom ID2D1EllipseGeometry IID_ID2D1EllipseGeometry "{}"
#comfunc ID2D1EllipseGeometry_GetFactory 3 comobj
#comfunc ID2D1EllipseGeometry_GetBounds 4 var, var
#comfunc ID2D1EllipseGeometry_GetWidenedBounds 5 float, comobj, var, float, var
#comfunc ID2D1EllipseGeometry_StrokeContainsPoint 6 int, float, comobj, var, float, var
#comfunc ID2D1EllipseGeometry_FillContainsPoint 7 int, var, float, var
#comfunc ID2D1EllipseGeometry_CompareWithGeometry 8 comobj, var, float, var
#comfunc ID2D1EllipseGeometry_Simplify 9 int, var, float, comobj
#comfunc ID2D1EllipseGeometry_Tessellate 10 var, float, comobj
#comfunc ID2D1EllipseGeometry_CombineWithGeometry 11 comobj, int, var, float, comobj
#comfunc ID2D1EllipseGeometry_Outline 12 var, float, comobj
#comfunc ID2D1EllipseGeometry_ComputeArea 13 var, float, float
#comfunc ID2D1EllipseGeometry_ComputeLength 14 var, float, float
#comfunc ID2D1EllipseGeometry_ComputePointAtLength 15 float, var, float, var, var
#comfunc ID2D1EllipseGeometry_Widen 16 float, comobj, var, float, comobj
#comfunc ID2D1EllipseGeometry_GetEllipse 17 var

;--- ID2D1Factory
#define IID_ID2D1Factory "{06152247-6F50-465A-9245-118BFD3B6007}"
#usecom ID2D1Factory IID_ID2D1Factory "{}"
#comfunc ID2D1Factory_ReloadSystemMetrics 3
#comfunc ID2D1Factory_GetDesktopDpi 4 float, float
#comfunc ID2D1Factory_CreateRectangleGeometry 5 var, comobj
#comfunc ID2D1Factory_CreateRoundedRectangleGeometry 6 var, comobj
#comfunc ID2D1Factory_CreateEllipseGeometry 7 var, comobj
#comfunc ID2D1Factory_CreateGeometryGroup 8 int, comobj, int, comobj
#comfunc ID2D1Factory_CreateTransformedGeometry 9 comobj, var, comobj
#comfunc ID2D1Factory_CreatePathGeometry 10 comobj
#comfunc ID2D1Factory_CreateStrokeStyle 11 var, var, int, comobj
#comfunc ID2D1Factory_CreateDrawingStateBlock 12 var, comobj, comobj
#comfunc ID2D1Factory_CreateWicBitmapRenderTarget 13 comobj, var, comobj
#comfunc ID2D1Factory_CreateHwndRenderTarget 14 var, var, comobj
#comfunc ID2D1Factory_CreateDxgiSurfaceRenderTarget 15 comobj, var, comobj
#comfunc ID2D1Factory_CreateDCRenderTarget 16 var, comobj

;--- ID2D1Geometry
#define IID_ID2D1Geometry "{2CD906A1-12E2-11DC-9FED-001143A055F9}"
#usecom ID2D1Geometry IID_ID2D1Geometry "{}"
#comfunc ID2D1Geometry_GetFactory 3 comobj
#comfunc ID2D1Geometry_GetBounds 4 var, var
#comfunc ID2D1Geometry_GetWidenedBounds 5 float, comobj, var, float, var
#comfunc ID2D1Geometry_StrokeContainsPoint 6 int, float, comobj, var, float, var
#comfunc ID2D1Geometry_FillContainsPoint 7 int, var, float, var
#comfunc ID2D1Geometry_CompareWithGeometry 8 comobj, var, float, var
#comfunc ID2D1Geometry_Simplify 9 int, var, float, comobj
#comfunc ID2D1Geometry_Tessellate 10 var, float, comobj
#comfunc ID2D1Geometry_CombineWithGeometry 11 comobj, int, var, float, comobj
#comfunc ID2D1Geometry_Outline 12 var, float, comobj
#comfunc ID2D1Geometry_ComputeArea 13 var, float, float
#comfunc ID2D1Geometry_ComputeLength 14 var, float, float
#comfunc ID2D1Geometry_ComputePointAtLength 15 float, var, float, var, var
#comfunc ID2D1Geometry_Widen 16 float, comobj, var, float, comobj

;--- ID2D1GeometryGroup
#define IID_ID2D1GeometryGroup "{2CD906A6-12E2-11DC-9FED-001143A055F9}"
#usecom ID2D1GeometryGroup IID_ID2D1GeometryGroup "{}"
#comfunc ID2D1GeometryGroup_GetFactory 3 comobj
#comfunc ID2D1GeometryGroup_GetBounds 4 var, var
#comfunc ID2D1GeometryGroup_GetWidenedBounds 5 float, comobj, var, float, var
#comfunc ID2D1GeometryGroup_StrokeContainsPoint 6 int, float, comobj, var, float, var
#comfunc ID2D1GeometryGroup_FillContainsPoint 7 int, var, float, var
#comfunc ID2D1GeometryGroup_CompareWithGeometry 8 comobj, var, float, var
#comfunc ID2D1GeometryGroup_Simplify 9 int, var, float, comobj
#comfunc ID2D1GeometryGroup_Tessellate 10 var, float, comobj
#comfunc ID2D1GeometryGroup_CombineWithGeometry 11 comobj, int, var, float, comobj
#comfunc ID2D1GeometryGroup_Outline 12 var, float, comobj
#comfunc ID2D1GeometryGroup_ComputeArea 13 var, float, float
#comfunc ID2D1GeometryGroup_ComputeLength 14 var, float, float
#comfunc ID2D1GeometryGroup_ComputePointAtLength 15 float, var, float, var, var
#comfunc ID2D1GeometryGroup_Widen 16 float, comobj, var, float, comobj
#comfunc ID2D1GeometryGroup_GetFillMode 17
#comfunc ID2D1GeometryGroup_GetSourceGeometryCount 18
#comfunc ID2D1GeometryGroup_GetSourceGeometries 19 comobj, int

;--- ID2D1GeometrySink
#define IID_ID2D1GeometrySink "{2CD9069F-12E2-11DC-9FED-001143A055F9}"
#usecom ID2D1GeometrySink IID_ID2D1GeometrySink "{}"
#comfunc ID2D1GeometrySink_SetFillMode 3 int
#comfunc ID2D1GeometrySink_SetSegmentFlags 4 int
#comfunc ID2D1GeometrySink_BeginFigure 5 int, int
#comfunc ID2D1GeometrySink_AddLines 6 var, int
#comfunc ID2D1GeometrySink_AddBeziers 7 var, int
#comfunc ID2D1GeometrySink_EndFigure 8 int
#comfunc ID2D1GeometrySink_Close 9
#comfunc ID2D1GeometrySink_AddLine 10 int
#comfunc ID2D1GeometrySink_AddBezier 11 var
#comfunc ID2D1GeometrySink_AddQuadraticBezier 12 var
#comfunc ID2D1GeometrySink_AddQuadraticBeziers 13 var, int
#comfunc ID2D1GeometrySink_AddArc 14 var

;--- ID2D1GradientStopCollection
#define IID_ID2D1GradientStopCollection "{2CD906A7-12E2-11DC-9FED-001143A055F9}"
#usecom ID2D1GradientStopCollection IID_ID2D1GradientStopCollection "{}"
#comfunc ID2D1GradientStopCollection_GetFactory 3 comobj
#comfunc ID2D1GradientStopCollection_GetGradientStopCount 4
#comfunc ID2D1GradientStopCollection_GetGradientStops 5 var, int
#comfunc ID2D1GradientStopCollection_GetColorInterpolationGamma 6
#comfunc ID2D1GradientStopCollection_GetExtendMode 7

;--- ID2D1HwndRenderTarget
#define IID_ID2D1HwndRenderTarget "{2CD90698-12E2-11DC-9FED-001143A055F9}"
#usecom ID2D1HwndRenderTarget IID_ID2D1HwndRenderTarget "{}"
#comfunc ID2D1HwndRenderTarget_GetFactory 3 comobj
#comfunc ID2D1HwndRenderTarget_CreateBitmap 4 int, intptr, int, var, comobj
#comfunc ID2D1HwndRenderTarget_CreateBitmapFromWicBitmap 5 comobj, var, comobj
#comfunc ID2D1HwndRenderTarget_CreateSharedBitmap 6 var, intptr, var, comobj
#comfunc ID2D1HwndRenderTarget_CreateBitmapBrush 7 comobj, var, var, comobj
#comfunc ID2D1HwndRenderTarget_CreateSolidColorBrush 8 var, var, comobj
#comfunc ID2D1HwndRenderTarget_CreateGradientStopCollection 9 var, int, int, int, comobj
#comfunc ID2D1HwndRenderTarget_CreateLinearGradientBrush 10 var, var, comobj, comobj
#comfunc ID2D1HwndRenderTarget_CreateRadialGradientBrush 11 var, var, comobj, comobj
#comfunc ID2D1HwndRenderTarget_CreateCompatibleRenderTarget 12 var, var, var, int, comobj
#comfunc ID2D1HwndRenderTarget_CreateLayer 13 var, comobj
#comfunc ID2D1HwndRenderTarget_CreateMesh 14 comobj
#comfunc ID2D1HwndRenderTarget_DrawLine 15 int, int, comobj, float, comobj
#comfunc ID2D1HwndRenderTarget_DrawRectangle 16 var, comobj, float, comobj
#comfunc ID2D1HwndRenderTarget_FillRectangle 17 var, comobj
#comfunc ID2D1HwndRenderTarget_DrawRoundedRectangle 18 var, comobj, float, comobj
#comfunc ID2D1HwndRenderTarget_FillRoundedRectangle 19 var, comobj
#comfunc ID2D1HwndRenderTarget_DrawEllipse 20 var, comobj, float, comobj
#comfunc ID2D1HwndRenderTarget_FillEllipse 21 var, comobj
#comfunc ID2D1HwndRenderTarget_DrawGeometry 22 comobj, comobj, float, comobj
#comfunc ID2D1HwndRenderTarget_FillGeometry 23 comobj, comobj, comobj
#comfunc ID2D1HwndRenderTarget_FillMesh 24 comobj, comobj
#comfunc ID2D1HwndRenderTarget_FillOpacityMask 25 comobj, comobj, int, var, var
#comfunc ID2D1HwndRenderTarget_DrawBitmap 26 comobj, var, float, int, var
#comfunc ID2D1HwndRenderTarget_DrawText 27 int, int, comobj, var, comobj, int, int
#comfunc ID2D1HwndRenderTarget_DrawTextLayout 28 int, comobj, comobj, int
#comfunc ID2D1HwndRenderTarget_DrawGlyphRun 29 int, int, comobj, int
#comfunc ID2D1HwndRenderTarget_SetTransform 30 var
#comfunc ID2D1HwndRenderTarget_GetTransform 31 var
#comfunc ID2D1HwndRenderTarget_SetAntialiasMode 32 int
#comfunc ID2D1HwndRenderTarget_GetAntialiasMode 33
#comfunc ID2D1HwndRenderTarget_SetTextAntialiasMode 34 int
#comfunc ID2D1HwndRenderTarget_GetTextAntialiasMode 35
#comfunc ID2D1HwndRenderTarget_SetTextRenderingParams 36 comobj
#comfunc ID2D1HwndRenderTarget_GetTextRenderingParams 37 comobj
#comfunc ID2D1HwndRenderTarget_SetTags 38 int64, int64
#comfunc ID2D1HwndRenderTarget_GetTags 39 var, var
#comfunc ID2D1HwndRenderTarget_PushLayer 40 int, comobj
#comfunc ID2D1HwndRenderTarget_PopLayer 41
#comfunc ID2D1HwndRenderTarget_Flush 42 var, var
#comfunc ID2D1HwndRenderTarget_SaveDrawingState 43 comobj
#comfunc ID2D1HwndRenderTarget_RestoreDrawingState 44 comobj
#comfunc ID2D1HwndRenderTarget_PushAxisAlignedClip 45 var, int
#comfunc ID2D1HwndRenderTarget_PopAxisAlignedClip 46
#comfunc ID2D1HwndRenderTarget_Clear 47 var
#comfunc ID2D1HwndRenderTarget_BeginDraw 48
#comfunc ID2D1HwndRenderTarget_EndDraw 49 var, var
#comfunc ID2D1HwndRenderTarget_GetPixelFormat 50
#comfunc ID2D1HwndRenderTarget_SetDpi 51 float, float
#comfunc ID2D1HwndRenderTarget_GetDpi 52 float, float
#comfunc ID2D1HwndRenderTarget_GetSize 53
#comfunc ID2D1HwndRenderTarget_GetPixelSize 54
#comfunc ID2D1HwndRenderTarget_GetMaximumBitmapSize 55
#comfunc ID2D1HwndRenderTarget_IsSupported 56 var
#comfunc ID2D1HwndRenderTarget_CheckWindowState 57
#comfunc ID2D1HwndRenderTarget_Resize 58 var
#comfunc ID2D1HwndRenderTarget_GetHwnd 59

;--- ID2D1Image
#define IID_ID2D1Image "{65019F75-8DA2-497C-B32C-DFA34E48EDE6}"
#usecom ID2D1Image IID_ID2D1Image "{}"
#comfunc ID2D1Image_GetFactory 3 comobj

;--- ID2D1Layer
#define IID_ID2D1Layer "{2CD9069B-12E2-11DC-9FED-001143A055F9}"
#usecom ID2D1Layer IID_ID2D1Layer "{}"
#comfunc ID2D1Layer_GetFactory 3 comobj
#comfunc ID2D1Layer_GetSize 4

;--- ID2D1LinearGradientBrush
#define IID_ID2D1LinearGradientBrush "{2CD906AB-12E2-11DC-9FED-001143A055F9}"
#usecom ID2D1LinearGradientBrush IID_ID2D1LinearGradientBrush "{}"
#comfunc ID2D1LinearGradientBrush_GetFactory 3 comobj
#comfunc ID2D1LinearGradientBrush_SetOpacity 4 float
#comfunc ID2D1LinearGradientBrush_SetTransform 5 var
#comfunc ID2D1LinearGradientBrush_GetOpacity 6
#comfunc ID2D1LinearGradientBrush_GetTransform 7 var
#comfunc ID2D1LinearGradientBrush_SetStartPoint 8 int
#comfunc ID2D1LinearGradientBrush_SetEndPoint 9 int
#comfunc ID2D1LinearGradientBrush_GetStartPoint 10
#comfunc ID2D1LinearGradientBrush_GetEndPoint 11
#comfunc ID2D1LinearGradientBrush_GetGradientStopCollection 12 comobj

;--- ID2D1Mesh
#define IID_ID2D1Mesh "{2CD906C2-12E2-11DC-9FED-001143A055F9}"
#usecom ID2D1Mesh IID_ID2D1Mesh "{}"
#comfunc ID2D1Mesh_GetFactory 3 comobj
#comfunc ID2D1Mesh_Open 4 comobj

;--- ID2D1PathGeometry
#define IID_ID2D1PathGeometry "{2CD906A5-12E2-11DC-9FED-001143A055F9}"
#usecom ID2D1PathGeometry IID_ID2D1PathGeometry "{}"
#comfunc ID2D1PathGeometry_GetFactory 3 comobj
#comfunc ID2D1PathGeometry_GetBounds 4 var, var
#comfunc ID2D1PathGeometry_GetWidenedBounds 5 float, comobj, var, float, var
#comfunc ID2D1PathGeometry_StrokeContainsPoint 6 int, float, comobj, var, float, var
#comfunc ID2D1PathGeometry_FillContainsPoint 7 int, var, float, var
#comfunc ID2D1PathGeometry_CompareWithGeometry 8 comobj, var, float, var
#comfunc ID2D1PathGeometry_Simplify 9 int, var, float, comobj
#comfunc ID2D1PathGeometry_Tessellate 10 var, float, comobj
#comfunc ID2D1PathGeometry_CombineWithGeometry 11 comobj, int, var, float, comobj
#comfunc ID2D1PathGeometry_Outline 12 var, float, comobj
#comfunc ID2D1PathGeometry_ComputeArea 13 var, float, float
#comfunc ID2D1PathGeometry_ComputeLength 14 var, float, float
#comfunc ID2D1PathGeometry_ComputePointAtLength 15 float, var, float, var, var
#comfunc ID2D1PathGeometry_Widen 16 float, comobj, var, float, comobj
#comfunc ID2D1PathGeometry_Open 17 comobj
#comfunc ID2D1PathGeometry_Stream 18 comobj
#comfunc ID2D1PathGeometry_GetSegmentCount 19 int
#comfunc ID2D1PathGeometry_GetFigureCount 20 int

;--- ID2D1RadialGradientBrush
#define IID_ID2D1RadialGradientBrush "{2CD906AC-12E2-11DC-9FED-001143A055F9}"
#usecom ID2D1RadialGradientBrush IID_ID2D1RadialGradientBrush "{}"
#comfunc ID2D1RadialGradientBrush_GetFactory 3 comobj
#comfunc ID2D1RadialGradientBrush_SetOpacity 4 float
#comfunc ID2D1RadialGradientBrush_SetTransform 5 var
#comfunc ID2D1RadialGradientBrush_GetOpacity 6
#comfunc ID2D1RadialGradientBrush_GetTransform 7 var
#comfunc ID2D1RadialGradientBrush_SetCenter 8 int
#comfunc ID2D1RadialGradientBrush_SetGradientOriginOffset 9 int
#comfunc ID2D1RadialGradientBrush_SetRadiusX 10 float
#comfunc ID2D1RadialGradientBrush_SetRadiusY 11 float
#comfunc ID2D1RadialGradientBrush_GetCenter 12
#comfunc ID2D1RadialGradientBrush_GetGradientOriginOffset 13
#comfunc ID2D1RadialGradientBrush_GetRadiusX 14
#comfunc ID2D1RadialGradientBrush_GetRadiusY 15
#comfunc ID2D1RadialGradientBrush_GetGradientStopCollection 16 comobj

;--- ID2D1RectangleGeometry
#define IID_ID2D1RectangleGeometry "{2CD906A2-12E2-11DC-9FED-001143A055F9}"
#usecom ID2D1RectangleGeometry IID_ID2D1RectangleGeometry "{}"
#comfunc ID2D1RectangleGeometry_GetFactory 3 comobj
#comfunc ID2D1RectangleGeometry_GetBounds 4 var, var
#comfunc ID2D1RectangleGeometry_GetWidenedBounds 5 float, comobj, var, float, var
#comfunc ID2D1RectangleGeometry_StrokeContainsPoint 6 int, float, comobj, var, float, var
#comfunc ID2D1RectangleGeometry_FillContainsPoint 7 int, var, float, var
#comfunc ID2D1RectangleGeometry_CompareWithGeometry 8 comobj, var, float, var
#comfunc ID2D1RectangleGeometry_Simplify 9 int, var, float, comobj
#comfunc ID2D1RectangleGeometry_Tessellate 10 var, float, comobj
#comfunc ID2D1RectangleGeometry_CombineWithGeometry 11 comobj, int, var, float, comobj
#comfunc ID2D1RectangleGeometry_Outline 12 var, float, comobj
#comfunc ID2D1RectangleGeometry_ComputeArea 13 var, float, float
#comfunc ID2D1RectangleGeometry_ComputeLength 14 var, float, float
#comfunc ID2D1RectangleGeometry_ComputePointAtLength 15 float, var, float, var, var
#comfunc ID2D1RectangleGeometry_Widen 16 float, comobj, var, float, comobj
#comfunc ID2D1RectangleGeometry_GetRect 17 var

;--- ID2D1RenderTarget
#define IID_ID2D1RenderTarget "{2CD90694-12E2-11DC-9FED-001143A055F9}"
#usecom ID2D1RenderTarget IID_ID2D1RenderTarget "{}"
#comfunc ID2D1RenderTarget_GetFactory 3 comobj
#comfunc ID2D1RenderTarget_CreateBitmap 4 int, intptr, int, var, comobj
#comfunc ID2D1RenderTarget_CreateBitmapFromWicBitmap 5 comobj, var, comobj
#comfunc ID2D1RenderTarget_CreateSharedBitmap 6 var, intptr, var, comobj
#comfunc ID2D1RenderTarget_CreateBitmapBrush 7 comobj, var, var, comobj
#comfunc ID2D1RenderTarget_CreateSolidColorBrush 8 var, var, comobj
#comfunc ID2D1RenderTarget_CreateGradientStopCollection 9 var, int, int, int, comobj
#comfunc ID2D1RenderTarget_CreateLinearGradientBrush 10 var, var, comobj, comobj
#comfunc ID2D1RenderTarget_CreateRadialGradientBrush 11 var, var, comobj, comobj
#comfunc ID2D1RenderTarget_CreateCompatibleRenderTarget 12 var, var, var, int, comobj
#comfunc ID2D1RenderTarget_CreateLayer 13 var, comobj
#comfunc ID2D1RenderTarget_CreateMesh 14 comobj
#comfunc ID2D1RenderTarget_DrawLine 15 int, int, comobj, float, comobj
#comfunc ID2D1RenderTarget_DrawRectangle 16 var, comobj, float, comobj
#comfunc ID2D1RenderTarget_FillRectangle 17 var, comobj
#comfunc ID2D1RenderTarget_DrawRoundedRectangle 18 var, comobj, float, comobj
#comfunc ID2D1RenderTarget_FillRoundedRectangle 19 var, comobj
#comfunc ID2D1RenderTarget_DrawEllipse 20 var, comobj, float, comobj
#comfunc ID2D1RenderTarget_FillEllipse 21 var, comobj
#comfunc ID2D1RenderTarget_DrawGeometry 22 comobj, comobj, float, comobj
#comfunc ID2D1RenderTarget_FillGeometry 23 comobj, comobj, comobj
#comfunc ID2D1RenderTarget_FillMesh 24 comobj, comobj
#comfunc ID2D1RenderTarget_FillOpacityMask 25 comobj, comobj, int, var, var
#comfunc ID2D1RenderTarget_DrawBitmap 26 comobj, var, float, int, var
#comfunc ID2D1RenderTarget_DrawText 27 int, int, comobj, var, comobj, int, int
#comfunc ID2D1RenderTarget_DrawTextLayout 28 int, comobj, comobj, int
#comfunc ID2D1RenderTarget_DrawGlyphRun 29 int, int, comobj, int
#comfunc ID2D1RenderTarget_SetTransform 30 var
#comfunc ID2D1RenderTarget_GetTransform 31 var
#comfunc ID2D1RenderTarget_SetAntialiasMode 32 int
#comfunc ID2D1RenderTarget_GetAntialiasMode 33
#comfunc ID2D1RenderTarget_SetTextAntialiasMode 34 int
#comfunc ID2D1RenderTarget_GetTextAntialiasMode 35
#comfunc ID2D1RenderTarget_SetTextRenderingParams 36 comobj
#comfunc ID2D1RenderTarget_GetTextRenderingParams 37 comobj
#comfunc ID2D1RenderTarget_SetTags 38 int64, int64
#comfunc ID2D1RenderTarget_GetTags 39 var, var
#comfunc ID2D1RenderTarget_PushLayer 40 int, comobj
#comfunc ID2D1RenderTarget_PopLayer 41
#comfunc ID2D1RenderTarget_Flush 42 var, var
#comfunc ID2D1RenderTarget_SaveDrawingState 43 comobj
#comfunc ID2D1RenderTarget_RestoreDrawingState 44 comobj
#comfunc ID2D1RenderTarget_PushAxisAlignedClip 45 var, int
#comfunc ID2D1RenderTarget_PopAxisAlignedClip 46
#comfunc ID2D1RenderTarget_Clear 47 var
#comfunc ID2D1RenderTarget_BeginDraw 48
#comfunc ID2D1RenderTarget_EndDraw 49 var, var
#comfunc ID2D1RenderTarget_GetPixelFormat 50
#comfunc ID2D1RenderTarget_SetDpi 51 float, float
#comfunc ID2D1RenderTarget_GetDpi 52 float, float
#comfunc ID2D1RenderTarget_GetSize 53
#comfunc ID2D1RenderTarget_GetPixelSize 54
#comfunc ID2D1RenderTarget_GetMaximumBitmapSize 55
#comfunc ID2D1RenderTarget_IsSupported 56 var

;--- ID2D1Resource
#define IID_ID2D1Resource "{2CD90691-12E2-11DC-9FED-001143A055F9}"
#usecom ID2D1Resource IID_ID2D1Resource "{}"
#comfunc ID2D1Resource_GetFactory 3 comobj

;--- ID2D1RoundedRectangleGeometry
#define IID_ID2D1RoundedRectangleGeometry "{2CD906A3-12E2-11DC-9FED-001143A055F9}"
#usecom ID2D1RoundedRectangleGeometry IID_ID2D1RoundedRectangleGeometry "{}"
#comfunc ID2D1RoundedRectangleGeometry_GetFactory 3 comobj
#comfunc ID2D1RoundedRectangleGeometry_GetBounds 4 var, var
#comfunc ID2D1RoundedRectangleGeometry_GetWidenedBounds 5 float, comobj, var, float, var
#comfunc ID2D1RoundedRectangleGeometry_StrokeContainsPoint 6 int, float, comobj, var, float, var
#comfunc ID2D1RoundedRectangleGeometry_FillContainsPoint 7 int, var, float, var
#comfunc ID2D1RoundedRectangleGeometry_CompareWithGeometry 8 comobj, var, float, var
#comfunc ID2D1RoundedRectangleGeometry_Simplify 9 int, var, float, comobj
#comfunc ID2D1RoundedRectangleGeometry_Tessellate 10 var, float, comobj
#comfunc ID2D1RoundedRectangleGeometry_CombineWithGeometry 11 comobj, int, var, float, comobj
#comfunc ID2D1RoundedRectangleGeometry_Outline 12 var, float, comobj
#comfunc ID2D1RoundedRectangleGeometry_ComputeArea 13 var, float, float
#comfunc ID2D1RoundedRectangleGeometry_ComputeLength 14 var, float, float
#comfunc ID2D1RoundedRectangleGeometry_ComputePointAtLength 15 float, var, float, var, var
#comfunc ID2D1RoundedRectangleGeometry_Widen 16 float, comobj, var, float, comobj
#comfunc ID2D1RoundedRectangleGeometry_GetRoundedRect 17 var

;--- ID2D1SimplifiedGeometrySink
#define IID_ID2D1SimplifiedGeometrySink "{2CD9069E-12E2-11DC-9FED-001143A055F9}"
#usecom ID2D1SimplifiedGeometrySink IID_ID2D1SimplifiedGeometrySink "{}"
#comfunc ID2D1SimplifiedGeometrySink_SetFillMode 3 int
#comfunc ID2D1SimplifiedGeometrySink_SetSegmentFlags 4 int
#comfunc ID2D1SimplifiedGeometrySink_BeginFigure 5 int, int
#comfunc ID2D1SimplifiedGeometrySink_AddLines 6 var, int
#comfunc ID2D1SimplifiedGeometrySink_AddBeziers 7 var, int
#comfunc ID2D1SimplifiedGeometrySink_EndFigure 8 int
#comfunc ID2D1SimplifiedGeometrySink_Close 9

;--- ID2D1SolidColorBrush
#define IID_ID2D1SolidColorBrush "{2CD906A9-12E2-11DC-9FED-001143A055F9}"
#usecom ID2D1SolidColorBrush IID_ID2D1SolidColorBrush "{}"
#comfunc ID2D1SolidColorBrush_GetFactory 3 comobj
#comfunc ID2D1SolidColorBrush_SetOpacity 4 float
#comfunc ID2D1SolidColorBrush_SetTransform 5 var
#comfunc ID2D1SolidColorBrush_GetOpacity 6
#comfunc ID2D1SolidColorBrush_GetTransform 7 var
#comfunc ID2D1SolidColorBrush_SetColor 8 var
#comfunc ID2D1SolidColorBrush_GetColor 9

;--- ID2D1StrokeStyle
#define IID_ID2D1StrokeStyle "{2CD9069D-12E2-11DC-9FED-001143A055F9}"
#usecom ID2D1StrokeStyle IID_ID2D1StrokeStyle "{}"
#comfunc ID2D1StrokeStyle_GetFactory 3 comobj
#comfunc ID2D1StrokeStyle_GetStartCap 4
#comfunc ID2D1StrokeStyle_GetEndCap 5
#comfunc ID2D1StrokeStyle_GetDashCap 6
#comfunc ID2D1StrokeStyle_GetMiterLimit 7
#comfunc ID2D1StrokeStyle_GetLineJoin 8
#comfunc ID2D1StrokeStyle_GetDashOffset 9
#comfunc ID2D1StrokeStyle_GetDashStyle 10
#comfunc ID2D1StrokeStyle_GetDashesCount 11
#comfunc ID2D1StrokeStyle_GetDashes 12 float, int

;--- ID2D1TessellationSink
#define IID_ID2D1TessellationSink "{2CD906C1-12E2-11DC-9FED-001143A055F9}"
#usecom ID2D1TessellationSink IID_ID2D1TessellationSink "{}"
#comfunc ID2D1TessellationSink_AddTriangles 3 var, int
#comfunc ID2D1TessellationSink_Close 4

;--- ID2D1TransformedGeometry
#define IID_ID2D1TransformedGeometry "{2CD906BB-12E2-11DC-9FED-001143A055F9}"
#usecom ID2D1TransformedGeometry IID_ID2D1TransformedGeometry "{}"
#comfunc ID2D1TransformedGeometry_GetFactory 3 comobj
#comfunc ID2D1TransformedGeometry_GetBounds 4 var, var
#comfunc ID2D1TransformedGeometry_GetWidenedBounds 5 float, comobj, var, float, var
#comfunc ID2D1TransformedGeometry_StrokeContainsPoint 6 int, float, comobj, var, float, var
#comfunc ID2D1TransformedGeometry_FillContainsPoint 7 int, var, float, var
#comfunc ID2D1TransformedGeometry_CompareWithGeometry 8 comobj, var, float, var
#comfunc ID2D1TransformedGeometry_Simplify 9 int, var, float, comobj
#comfunc ID2D1TransformedGeometry_Tessellate 10 var, float, comobj
#comfunc ID2D1TransformedGeometry_CombineWithGeometry 11 comobj, int, var, float, comobj
#comfunc ID2D1TransformedGeometry_Outline 12 var, float, comobj
#comfunc ID2D1TransformedGeometry_ComputeArea 13 var, float, float
#comfunc ID2D1TransformedGeometry_ComputeLength 14 var, float, float
#comfunc ID2D1TransformedGeometry_ComputePointAtLength 15 float, var, float, var, var
#comfunc ID2D1TransformedGeometry_Widen 16 float, comobj, var, float, comobj
#comfunc ID2D1TransformedGeometry_GetSourceGeometry 17 comobj
#comfunc ID2D1TransformedGeometry_GetTransform 18 var

;--- IDataObject
#define IID_IDataObject "{0000010E-0000-0000-C000-000000000046}"
#usecom IDataObject IID_IDataObject "{}"
#comfunc IDataObject_GetData 3 var, int
#comfunc IDataObject_GetDataHere 4 var, int
#comfunc IDataObject_QueryGetData 5 var
#comfunc IDataObject_GetCanonicalFormatEtc 6 var, var
#comfunc IDataObject_SetData 7 var, int, int
#comfunc IDataObject_EnumFormatEtc 8 int, comobj
#comfunc IDataObject_DAdvise 9 var, int, comobj, int
#comfunc IDataObject_DUnadvise 10 int
#comfunc IDataObject_EnumDAdvise 11 comobj

;--- IDropSource
#define IID_IDropSource "{00000121-0000-0000-C000-000000000046}"
#usecom IDropSource IID_IDropSource "{}"
#comfunc IDropSource_QueryContinueDrag 3 int, int
#comfunc IDropSource_GiveFeedback 4 int

;--- IDropTarget
#define IID_IDropTarget "{00000122-0000-0000-C000-000000000046}"
#usecom IDropTarget IID_IDropTarget "{}"
#comfunc IDropTarget_DragEnter 3 comobj, int, int, var
#comfunc IDropTarget_DragOver 4 int, int, var
#comfunc IDropTarget_DragLeave 5
#comfunc IDropTarget_Drop 6 comobj, int, int, var

;--- IDWriteBitmapRenderTarget
#define IID_IDWriteBitmapRenderTarget "{5E5A32A3-8DFF-4773-9FF6-0696EAB77267}"
#usecom IDWriteBitmapRenderTarget IID_IDWriteBitmapRenderTarget "{}"
#comfunc IDWriteBitmapRenderTarget_DrawGlyphRun 3 float, float, int, int, comobj, int, var
#comfunc IDWriteBitmapRenderTarget_GetMemoryDC 4
#comfunc IDWriteBitmapRenderTarget_GetPixelsPerDip 5
#comfunc IDWriteBitmapRenderTarget_SetPixelsPerDip 6 float
#comfunc IDWriteBitmapRenderTarget_GetCurrentTransform 7 var
#comfunc IDWriteBitmapRenderTarget_SetCurrentTransform 8 var
#comfunc IDWriteBitmapRenderTarget_GetSize 9 var
#comfunc IDWriteBitmapRenderTarget_Resize 10 int, int

;--- IDWriteFactory
#define IID_IDWriteFactory "{B859EE5A-D838-4B5B-A2E8-1ADC7D93DB48}"
#usecom IDWriteFactory IID_IDWriteFactory "{}"
#comfunc IDWriteFactory_GetSystemFontCollection 3 comobj, int
#comfunc IDWriteFactory_CreateCustomFontCollection 4 comobj, intptr, int, comobj
#comfunc IDWriteFactory_RegisterFontCollectionLoader 5 comobj
#comfunc IDWriteFactory_UnregisterFontCollectionLoader 6 comobj
#comfunc IDWriteFactory_CreateFontFileReference 7 wstr, var, comobj
#comfunc IDWriteFactory_CreateCustomFontFileReference 8 intptr, int, comobj, comobj
#comfunc IDWriteFactory_CreateFontFace 9 int, int, comobj, int, int, comobj
#comfunc IDWriteFactory_CreateRenderingParams 10 comobj
#comfunc IDWriteFactory_CreateMonitorRenderingParams 11 int, comobj
#comfunc IDWriteFactory_CreateCustomRenderingParams 12 float, float, float, int, int, comobj
#comfunc IDWriteFactory_RegisterFontFileLoader 13 comobj
#comfunc IDWriteFactory_UnregisterFontFileLoader 14 comobj
#comfunc IDWriteFactory_CreateTextFormat 15 wstr, comobj, int, int, int, float, wstr, comobj
#comfunc IDWriteFactory_CreateTypography 16 comobj
#comfunc IDWriteFactory_GetGdiInterop 17 comobj
#comfunc IDWriteFactory_CreateTextLayout 18 int, int, comobj, float, float, comobj
#comfunc IDWriteFactory_CreateGdiCompatibleTextLayout 19 int, int, comobj, float, float, float, var, int, comobj
#comfunc IDWriteFactory_CreateEllipsisTrimmingSign 20 comobj, comobj
#comfunc IDWriteFactory_CreateTextAnalyzer 21 comobj
#comfunc IDWriteFactory_CreateNumberSubstitution 22 int, wstr, int, comobj
#comfunc IDWriteFactory_CreateGlyphRunAnalysis 23 int, float, var, int, int, float, float, comobj

;--- IDWriteFont
#define IID_IDWriteFont "{ACD16696-8C14-4F5D-877E-FE3FC1D32737}"
#usecom IDWriteFont IID_IDWriteFont "{}"
#comfunc IDWriteFont_GetFontFamily 3 comobj
#comfunc IDWriteFont_GetWeight 4
#comfunc IDWriteFont_GetStretch 5
#comfunc IDWriteFont_GetStyle 6
#comfunc IDWriteFont_IsSymbolFont 7
#comfunc IDWriteFont_GetFaceNames 8 comobj
#comfunc IDWriteFont_GetInformationalStrings 9 int, comobj, var
#comfunc IDWriteFont_GetSimulations 10
#comfunc IDWriteFont_GetMetrics 11 var
#comfunc IDWriteFont_HasCharacter 12 int, var
#comfunc IDWriteFont_CreateFontFace 13 comobj

;--- IDWriteFontCollection
#define IID_IDWriteFontCollection "{A84CEE02-3EEA-4EEE-A827-87C1A02A0FCC}"
#usecom IDWriteFontCollection IID_IDWriteFontCollection "{}"
#comfunc IDWriteFontCollection_GetFontFamilyCount 3
#comfunc IDWriteFontCollection_GetFontFamily 4 int, comobj
#comfunc IDWriteFontCollection_FindFamilyName 5 wstr, int, var
#comfunc IDWriteFontCollection_GetFontFromFontFace 6 comobj, comobj

;--- IDWriteFontCollectionLoader
#define IID_IDWriteFontCollectionLoader "{CCA920E4-52F0-492B-BFA8-29C72EE0A468}"
#usecom IDWriteFontCollectionLoader IID_IDWriteFontCollectionLoader "{}"
#comfunc IDWriteFontCollectionLoader_CreateEnumeratorFromKey 3 comobj, intptr, int, comobj

;--- IDWriteFontFace
#define IID_IDWriteFontFace "{5F49804D-7024-4D43-BFA9-D25984F53849}"
#usecom IDWriteFontFace IID_IDWriteFontFace "{}"
#comfunc IDWriteFontFace_GetType 3
#comfunc IDWriteFontFace_GetFiles 4 int, comobj
#comfunc IDWriteFontFace_GetIndex 5
#comfunc IDWriteFontFace_GetSimulations 6
#comfunc IDWriteFontFace_IsSymbolFont 7
#comfunc IDWriteFontFace_GetMetrics 8 var
#comfunc IDWriteFontFace_GetGlyphCount 9
#comfunc IDWriteFontFace_GetDesignGlyphMetrics 10 int, int, var, int
#comfunc IDWriteFontFace_GetGlyphIndices 11 int, int, int
#comfunc IDWriteFontFace_TryGetFontTable 12 int, var, int, var, var
#comfunc IDWriteFontFace_ReleaseFontTable 13 intptr
#comfunc IDWriteFontFace_GetGlyphRunOutline 14 float, int, var, var, int, int, int, comobj
#comfunc IDWriteFontFace_GetRecommendedRenderingMode 15 float, float, int, comobj, var
#comfunc IDWriteFontFace_GetGdiCompatibleMetrics 16 float, float, var, var
#comfunc IDWriteFontFace_GetGdiCompatibleGlyphMetrics 17 float, float, var, int, int, int, var, int

;--- IDWriteFontFamily
#define IID_IDWriteFontFamily "{DA20D8EF-812A-4C43-9802-62EC4ABD7ADD}"
#usecom IDWriteFontFamily IID_IDWriteFontFamily "{}"
#comfunc IDWriteFontFamily_GetFontCollection 3 comobj
#comfunc IDWriteFontFamily_GetFontCount 4
#comfunc IDWriteFontFamily_GetFont 5 int, comobj
#comfunc IDWriteFontFamily_GetFamilyNames 6 comobj
#comfunc IDWriteFontFamily_GetFirstMatchingFont 7 int, int, int, comobj
#comfunc IDWriteFontFamily_GetMatchingFonts 8 int, int, int, comobj

;--- IDWriteFontFile
#define IID_IDWriteFontFile "{739D886A-CEF5-47DC-8769-1A8B41BEBBB0}"
#usecom IDWriteFontFile IID_IDWriteFontFile "{}"
#comfunc IDWriteFontFile_GetReferenceKey 3 var, int
#comfunc IDWriteFontFile_GetLoader 4 comobj
#comfunc IDWriteFontFile_Analyze 5 var, var, var, int

;--- IDWriteFontFileEnumerator
#define IID_IDWriteFontFileEnumerator "{72755049-5FF7-435D-8348-4BE97CFA6C7C}"
#usecom IDWriteFontFileEnumerator IID_IDWriteFontFileEnumerator "{}"
#comfunc IDWriteFontFileEnumerator_MoveNext 3 var
#comfunc IDWriteFontFileEnumerator_GetCurrentFontFile 4 comobj

;--- IDWriteFontFileLoader
#define IID_IDWriteFontFileLoader "{727CAD4E-D6AF-4C9E-8A08-D695B11CAA49}"
#usecom IDWriteFontFileLoader IID_IDWriteFontFileLoader "{}"
#comfunc IDWriteFontFileLoader_CreateStreamFromKey 3 intptr, int, comobj

;--- IDWriteFontFileStream
#define IID_IDWriteFontFileStream "{6D4865FE-0AB8-4D91-8F62-5DD6BE34A3E0}"
#usecom IDWriteFontFileStream IID_IDWriteFontFileStream "{}"
#comfunc IDWriteFontFileStream_ReadFileFragment 3 var, int64, int64, var
#comfunc IDWriteFontFileStream_ReleaseFileFragment 4 intptr
#comfunc IDWriteFontFileStream_GetFileSize 5 int64
#comfunc IDWriteFontFileStream_GetLastWriteTime 6 int64

;--- IDWriteFontList
#define IID_IDWriteFontList "{1A0D8438-1D97-4EC1-AEF9-A2FB86ED6ACB}"
#usecom IDWriteFontList IID_IDWriteFontList "{}"
#comfunc IDWriteFontList_GetFontCollection 3 comobj
#comfunc IDWriteFontList_GetFontCount 4
#comfunc IDWriteFontList_GetFont 5 int, comobj

;--- IDWriteGdiInterop
#define IID_IDWriteGdiInterop "{1EDD9491-9853-4299-898F-6432983B6F3A}"
#usecom IDWriteGdiInterop IID_IDWriteGdiInterop "{}"
#comfunc IDWriteGdiInterop_CreateFontFromLOGFONT 3 var, comobj
#comfunc IDWriteGdiInterop_ConvertFontToLOGFONT 4 comobj, var, var
#comfunc IDWriteGdiInterop_ConvertFontFaceToLOGFONT 5 comobj, var
#comfunc IDWriteGdiInterop_CreateFontFaceFromHdc 6 intptr, comobj
#comfunc IDWriteGdiInterop_CreateBitmapRenderTarget 7 intptr, int, int, comobj

;--- IDWriteGlyphRunAnalysis
#define IID_IDWriteGlyphRunAnalysis "{7D97DBF7-E085-42D4-81E3-6A883BDED118}"
#usecom IDWriteGlyphRunAnalysis IID_IDWriteGlyphRunAnalysis "{}"
#comfunc IDWriteGlyphRunAnalysis_GetAlphaTextureBounds 3 int, var
#comfunc IDWriteGlyphRunAnalysis_CreateAlphaTexture 4 int, var, int, int
#comfunc IDWriteGlyphRunAnalysis_GetAlphaBlendParams 5 comobj, float, float, float

;--- IDWriteInlineObject
#define IID_IDWriteInlineObject "{8339FDE3-106F-47AB-8373-1C6295EB10B3}"
#usecom IDWriteInlineObject IID_IDWriteInlineObject "{}"
#comfunc IDWriteInlineObject_Draw 3 intptr, comobj, float, float, int, int, int
#comfunc IDWriteInlineObject_GetMetrics 4 var
#comfunc IDWriteInlineObject_GetOverhangMetrics 5 var
#comfunc IDWriteInlineObject_GetBreakConditions 6 var, var

;--- IDWriteLocalizedStrings
#define IID_IDWriteLocalizedStrings "{08256209-099A-4B34-B86D-C22B110E7771}"
#usecom IDWriteLocalizedStrings IID_IDWriteLocalizedStrings "{}"
#comfunc IDWriteLocalizedStrings_GetCount 3
#comfunc IDWriteLocalizedStrings_FindLocaleName 4 wstr, int, var
#comfunc IDWriteLocalizedStrings_GetLocaleNameLength 5 int, int
#comfunc IDWriteLocalizedStrings_GetLocaleName 6 int, wstr, int
#comfunc IDWriteLocalizedStrings_GetStringLength 7 int, int
#comfunc IDWriteLocalizedStrings_GetString 8 int, wstr, int

;--- IDWritePixelSnapping
#define IID_IDWritePixelSnapping "{EAF3A2DA-ECF4-4D24-B644-B34F6842024B}"
#usecom IDWritePixelSnapping IID_IDWritePixelSnapping "{}"
#comfunc IDWritePixelSnapping_IsPixelSnappingDisabled 3 intptr, var
#comfunc IDWritePixelSnapping_GetCurrentTransform 4 intptr, var
#comfunc IDWritePixelSnapping_GetPixelsPerDip 5 intptr, float

;--- IDWriteRenderingParams
#define IID_IDWriteRenderingParams "{2F0DA53A-2ADD-47CD-82EE-D9EC34688E75}"
#usecom IDWriteRenderingParams IID_IDWriteRenderingParams "{}"
#comfunc IDWriteRenderingParams_GetGamma 3
#comfunc IDWriteRenderingParams_GetEnhancedContrast 4
#comfunc IDWriteRenderingParams_GetClearTypeLevel 5
#comfunc IDWriteRenderingParams_GetPixelGeometry 6
#comfunc IDWriteRenderingParams_GetRenderingMode 7

;--- IDWriteTextAnalysisSink
#define IID_IDWriteTextAnalysisSink "{5810CD44-0CA0-4701-B3FA-BEC5182AE4F6}"
#usecom IDWriteTextAnalysisSink IID_IDWriteTextAnalysisSink "{}"
#comfunc IDWriteTextAnalysisSink_SetScriptAnalysis 3 int, int, var
#comfunc IDWriteTextAnalysisSink_SetLineBreakpoints 4 int, int, var
#comfunc IDWriteTextAnalysisSink_SetBidiLevel 5 int, int, int, int
#comfunc IDWriteTextAnalysisSink_SetNumberSubstitution 6 int, int, comobj

;--- IDWriteTextAnalysisSource
#define IID_IDWriteTextAnalysisSource "{688E1A58-5094-47C8-ADC8-FBCEA60AE92B}"
#usecom IDWriteTextAnalysisSource IID_IDWriteTextAnalysisSource "{}"
#comfunc IDWriteTextAnalysisSource_GetTextAtPosition 3 int, var, int
#comfunc IDWriteTextAnalysisSource_GetTextBeforePosition 4 int, var, int
#comfunc IDWriteTextAnalysisSource_GetParagraphReadingDirection 5
#comfunc IDWriteTextAnalysisSource_GetLocaleName 6 int, int, var
#comfunc IDWriteTextAnalysisSource_GetNumberSubstitution 7 int, int, comobj

;--- IDWriteTextAnalyzer
#define IID_IDWriteTextAnalyzer "{B7E6163E-7F46-43B4-84B3-E4E6249C365D}"
#usecom IDWriteTextAnalyzer IID_IDWriteTextAnalyzer "{}"
#comfunc IDWriteTextAnalyzer_AnalyzeScript 3 comobj, int, int, comobj
#comfunc IDWriteTextAnalyzer_AnalyzeBidi 4 comobj, int, int, comobj
#comfunc IDWriteTextAnalyzer_AnalyzeNumberSubstitution 5 comobj, int, int, comobj
#comfunc IDWriteTextAnalyzer_AnalyzeLineBreakpoints 6 comobj, int, int, comobj
#comfunc IDWriteTextAnalyzer_GetGlyphs 7 wstr, int, comobj, int, int, var, wstr, comobj, var, var, int, int, int, var, int, var, int
#comfunc IDWriteTextAnalyzer_GetGlyphPlacements 8 wstr, int, var, int, int, var, int, comobj, float, int, int, var, wstr, var, var, int, float, var
#comfunc IDWriteTextAnalyzer_GetGdiCompatibleGlyphPlacements 9 wstr, int, var, int, int, var, int, comobj, float, float, var, int, int, int, var, wstr, var, var, int, float, var

;--- IDWriteTextFormat
#define IID_IDWriteTextFormat "{9C906818-31D7-4FD3-A151-7C5E225DB55A}"
#usecom IDWriteTextFormat IID_IDWriteTextFormat "{}"
#comfunc IDWriteTextFormat_SetTextAlignment 3 int
#comfunc IDWriteTextFormat_SetParagraphAlignment 4 int
#comfunc IDWriteTextFormat_SetWordWrapping 5 int
#comfunc IDWriteTextFormat_SetReadingDirection 6 int
#comfunc IDWriteTextFormat_SetFlowDirection 7 int
#comfunc IDWriteTextFormat_SetIncrementalTabStop 8 float
#comfunc IDWriteTextFormat_SetTrimming 9 var, comobj
#comfunc IDWriteTextFormat_SetLineSpacing 10 int, float, float
#comfunc IDWriteTextFormat_GetTextAlignment 11
#comfunc IDWriteTextFormat_GetParagraphAlignment 12
#comfunc IDWriteTextFormat_GetWordWrapping 13
#comfunc IDWriteTextFormat_GetReadingDirection 14
#comfunc IDWriteTextFormat_GetFlowDirection 15
#comfunc IDWriteTextFormat_GetIncrementalTabStop 16
#comfunc IDWriteTextFormat_GetTrimming 17 var, comobj
#comfunc IDWriteTextFormat_GetLineSpacing 18 var, float, float
#comfunc IDWriteTextFormat_GetFontCollection 19 comobj
#comfunc IDWriteTextFormat_GetFontFamilyNameLength 20
#comfunc IDWriteTextFormat_GetFontFamilyName 21 wstr, int
#comfunc IDWriteTextFormat_GetFontWeight 22
#comfunc IDWriteTextFormat_GetFontStyle 23
#comfunc IDWriteTextFormat_GetFontStretch 24
#comfunc IDWriteTextFormat_GetFontSize 25
#comfunc IDWriteTextFormat_GetLocaleNameLength 26
#comfunc IDWriteTextFormat_GetLocaleName 27 wstr, int

;--- IDWriteTextLayout
#define IID_IDWriteTextLayout "{53737037-6D14-410B-9BFE-0B182BB70961}"
#usecom IDWriteTextLayout IID_IDWriteTextLayout "{}"
#comfunc IDWriteTextLayout_SetTextAlignment 3 int
#comfunc IDWriteTextLayout_SetParagraphAlignment 4 int
#comfunc IDWriteTextLayout_SetWordWrapping 5 int
#comfunc IDWriteTextLayout_SetReadingDirection 6 int
#comfunc IDWriteTextLayout_SetFlowDirection 7 int
#comfunc IDWriteTextLayout_SetIncrementalTabStop 8 float
#comfunc IDWriteTextLayout_SetTrimming 9 var, comobj
#comfunc IDWriteTextLayout_SetLineSpacing 10 int, float, float
#comfunc IDWriteTextLayout_GetTextAlignment 11
#comfunc IDWriteTextLayout_GetParagraphAlignment 12
#comfunc IDWriteTextLayout_GetWordWrapping 13
#comfunc IDWriteTextLayout_GetReadingDirection 14
#comfunc IDWriteTextLayout_GetFlowDirection 15
#comfunc IDWriteTextLayout_GetIncrementalTabStop 16
#comfunc IDWriteTextLayout_GetTrimming 17 var, comobj
#comfunc IDWriteTextLayout_GetLineSpacing 18 var, float, float
#comfunc IDWriteTextLayout_GetFontCollection 19 comobj
#comfunc IDWriteTextLayout_GetFontFamilyNameLength 20
#comfunc IDWriteTextLayout_GetFontFamilyName 21 wstr, int
#comfunc IDWriteTextLayout_GetFontWeight 22
#comfunc IDWriteTextLayout_GetFontStyle 23
#comfunc IDWriteTextLayout_GetFontStretch 24
#comfunc IDWriteTextLayout_GetFontSize 25
#comfunc IDWriteTextLayout_GetLocaleNameLength 26
#comfunc IDWriteTextLayout_GetLocaleName 27 wstr, int
#comfunc IDWriteTextLayout_SetMaxWidth 28 float
#comfunc IDWriteTextLayout_SetMaxHeight 29 float
#comfunc IDWriteTextLayout_SetFontCollection 30 comobj, int
#comfunc IDWriteTextLayout_SetFontFamilyName 31 wstr, int
#comfunc IDWriteTextLayout_SetFontWeight 32 int, int
#comfunc IDWriteTextLayout_SetFontStyle 33 int, int
#comfunc IDWriteTextLayout_SetFontStretch 34 int, int
#comfunc IDWriteTextLayout_SetFontSize 35 float, int
#comfunc IDWriteTextLayout_SetUnderline 36 int, int
#comfunc IDWriteTextLayout_SetStrikethrough 37 int, int
#comfunc IDWriteTextLayout_SetDrawingEffect 38 int, int
#comfunc IDWriteTextLayout_SetInlineObject 39 comobj, int
#comfunc IDWriteTextLayout_SetTypography 40 comobj, int
#comfunc IDWriteTextLayout_SetLocaleName 41 wstr, int
#comfunc IDWriteTextLayout_GetMaxWidth 42
#comfunc IDWriteTextLayout_GetMaxHeight 43
#comfunc IDWriteTextLayout_GetFontCollection 44 int, comobj, var
#comfunc IDWriteTextLayout_GetFontFamilyNameLength 45 int, int, var
#comfunc IDWriteTextLayout_GetFontFamilyName 46 int, wstr, int, var
#comfunc IDWriteTextLayout_GetFontWeight 47 int, var, var
#comfunc IDWriteTextLayout_GetFontStyle 48 int, var, var
#comfunc IDWriteTextLayout_GetFontStretch 49 int, var, var
#comfunc IDWriteTextLayout_GetFontSize 50 int, float, var
#comfunc IDWriteTextLayout_GetUnderline 51 int, var, var
#comfunc IDWriteTextLayout_GetStrikethrough 52 int, var, var
#comfunc IDWriteTextLayout_GetDrawingEffect 53 int, int, var
#comfunc IDWriteTextLayout_GetInlineObject 54 int, comobj, var
#comfunc IDWriteTextLayout_GetTypography 55 int, comobj, var
#comfunc IDWriteTextLayout_GetLocaleNameLength 56 int, int, var
#comfunc IDWriteTextLayout_GetLocaleName 57 int, wstr, int, var
#comfunc IDWriteTextLayout_Draw 58 intptr, comobj, float, float
#comfunc IDWriteTextLayout_GetLineMetrics 59 var, int, int
#comfunc IDWriteTextLayout_GetMetrics 60 var
#comfunc IDWriteTextLayout_GetOverhangMetrics 61 var
#comfunc IDWriteTextLayout_GetClusterMetrics 62 var, int, int
#comfunc IDWriteTextLayout_DetermineMinWidth 63 float
#comfunc IDWriteTextLayout_HitTestPoint 64 float, float, var, var, var
#comfunc IDWriteTextLayout_HitTestTextPosition 65 int, int, float, float, var
#comfunc IDWriteTextLayout_HitTestTextRange 66 int, int, float, float, var, int, int

;--- IDWriteTextRenderer
#define IID_IDWriteTextRenderer "{EF8A8135-5CC6-45FE-8825-C5A0724EB819}"
#usecom IDWriteTextRenderer IID_IDWriteTextRenderer "{}"
#comfunc IDWriteTextRenderer_IsPixelSnappingDisabled 3 intptr, var
#comfunc IDWriteTextRenderer_GetCurrentTransform 4 intptr, var
#comfunc IDWriteTextRenderer_GetPixelsPerDip 5 intptr, float
#comfunc IDWriteTextRenderer_DrawGlyphRun 6 intptr, float, float, int, int, var, int
#comfunc IDWriteTextRenderer_DrawUnderline 7 intptr, float, float, var, int
#comfunc IDWriteTextRenderer_DrawStrikethrough 8 intptr, float, float, var, int
#comfunc IDWriteTextRenderer_DrawInlineObject 9 intptr, float, float, comobj, int, int, int

;--- IDWriteTypography
#define IID_IDWriteTypography "{55F1112B-1DC2-4B3C-9541-F46894ED85B6}"
#usecom IDWriteTypography IID_IDWriteTypography "{}"
#comfunc IDWriteTypography_AddFontFeature 3 int
#comfunc IDWriteTypography_GetFontFeatureCount 4
#comfunc IDWriteTypography_GetFontFeature 5 int, var

;--- IDXGIAdapter
#define IID_IDXGIAdapter "{2411E7E1-12AC-4CCF-BD14-9798E8534DC0}"
#usecom IDXGIAdapter IID_IDXGIAdapter "{}"
#comfunc IDXGIAdapter_SetPrivateData 3 var, int, intptr
#comfunc IDXGIAdapter_SetPrivateDataInterface 4 var, int
#comfunc IDXGIAdapter_GetPrivateData 5 var, int, intptr
#comfunc IDXGIAdapter_GetParent 6 var, int
#comfunc IDXGIAdapter_EnumOutputs 7 int, comobj
#comfunc IDXGIAdapter_GetDesc 8
#comfunc IDXGIAdapter_CheckInterfaceSupport 9 var, int64

;--- IDXGIDevice
#define IID_IDXGIDevice "{54EC77FA-1377-44E6-8C32-88FD5F44C84C}"
#usecom IDXGIDevice IID_IDXGIDevice "{}"
#comfunc IDXGIDevice_SetPrivateData 3 var, int, intptr
#comfunc IDXGIDevice_SetPrivateDataInterface 4 var, int
#comfunc IDXGIDevice_GetPrivateData 5 var, int, intptr
#comfunc IDXGIDevice_GetParent 6 var, int
#comfunc IDXGIDevice_GetAdapter 7 comobj
#comfunc IDXGIDevice_CreateSurface 8 var, int, int, var, comobj
#comfunc IDXGIDevice_QueryResourceResidency 9 int, var, int
#comfunc IDXGIDevice_SetGPUThreadPriority 10 int
#comfunc IDXGIDevice_GetGPUThreadPriority 11 int

;--- IDXGIDeviceSubObject
#define IID_IDXGIDeviceSubObject "{3D3E0379-F9DE-4D58-BB6C-18D62992F1A6}"
#usecom IDXGIDeviceSubObject IID_IDXGIDeviceSubObject "{}"
#comfunc IDXGIDeviceSubObject_SetPrivateData 3 var, int, intptr
#comfunc IDXGIDeviceSubObject_SetPrivateDataInterface 4 var, int
#comfunc IDXGIDeviceSubObject_GetPrivateData 5 var, int, intptr
#comfunc IDXGIDeviceSubObject_GetParent 6 var, int
#comfunc IDXGIDeviceSubObject_GetDevice 7 var, int

;--- IDXGIFactory
#define IID_IDXGIFactory "{7B7166EC-21C7-44AE-B21A-C9AE321AE369}"
#usecom IDXGIFactory IID_IDXGIFactory "{}"
#comfunc IDXGIFactory_SetPrivateData 3 var, int, intptr
#comfunc IDXGIFactory_SetPrivateDataInterface 4 var, int
#comfunc IDXGIFactory_GetPrivateData 5 var, int, intptr
#comfunc IDXGIFactory_GetParent 6 var, int
#comfunc IDXGIFactory_EnumAdapters 7 int, comobj
#comfunc IDXGIFactory_MakeWindowAssociation 8 intptr, int
#comfunc IDXGIFactory_GetWindowAssociation 9 var
#comfunc IDXGIFactory_CreateSwapChain 10 int, var, comobj
#comfunc IDXGIFactory_CreateSoftwareAdapter 11 intptr, comobj

;--- IDXGIObject
#define IID_IDXGIObject "{AEC22FB8-76F3-4639-9BE0-28EB43A67A2E}"
#usecom IDXGIObject IID_IDXGIObject "{}"
#comfunc IDXGIObject_SetPrivateData 3 var, int, intptr
#comfunc IDXGIObject_SetPrivateDataInterface 4 var, int
#comfunc IDXGIObject_GetPrivateData 5 var, int, intptr
#comfunc IDXGIObject_GetParent 6 var, int

;--- IDXGIOutput
#define IID_IDXGIOutput "{AE02EEDB-C735-4690-8D52-5A8DC20213AA}"
#usecom IDXGIOutput IID_IDXGIOutput "{}"
#comfunc IDXGIOutput_SetPrivateData 3 var, int, intptr
#comfunc IDXGIOutput_SetPrivateDataInterface 4 var, int
#comfunc IDXGIOutput_GetPrivateData 5 var, int, intptr
#comfunc IDXGIOutput_GetParent 6 var, int
#comfunc IDXGIOutput_GetDesc 7
#comfunc IDXGIOutput_GetDisplayModeList 8 int, int, int, var
#comfunc IDXGIOutput_FindClosestMatchingMode 9 var, var, int
#comfunc IDXGIOutput_WaitForVBlank 10
#comfunc IDXGIOutput_TakeOwnership 11 int, int
#comfunc IDXGIOutput_ReleaseOwnership 12
#comfunc IDXGIOutput_GetGammaControlCapabilities 13 var
#comfunc IDXGIOutput_SetGammaControl 14 var
#comfunc IDXGIOutput_GetGammaControl 15 var
#comfunc IDXGIOutput_SetDisplaySurface 16 comobj
#comfunc IDXGIOutput_GetDisplaySurfaceData 17 comobj
#comfunc IDXGIOutput_GetFrameStatistics 18 var

;--- IDXGISurface
#define IID_IDXGISurface "{CAFCB56C-6AC3-4889-BF47-9E23BBD260EC}"
#usecom IDXGISurface IID_IDXGISurface "{}"
#comfunc IDXGISurface_SetPrivateData 3 var, int, intptr
#comfunc IDXGISurface_SetPrivateDataInterface 4 var, int
#comfunc IDXGISurface_GetPrivateData 5 var, int, intptr
#comfunc IDXGISurface_GetParent 6 var, int
#comfunc IDXGISurface_GetDevice 7 var, int
#comfunc IDXGISurface_GetDesc 8
#comfunc IDXGISurface_Map 9 var, int
#comfunc IDXGISurface_Unmap 10

;--- IDXGISwapChain
#define IID_IDXGISwapChain "{310D36A0-D2E7-4C0A-AA04-6A9D23B8886A}"
#usecom IDXGISwapChain IID_IDXGISwapChain "{}"
#comfunc IDXGISwapChain_SetPrivateData 3 var, int, intptr
#comfunc IDXGISwapChain_SetPrivateDataInterface 4 var, int
#comfunc IDXGISwapChain_GetPrivateData 5 var, int, intptr
#comfunc IDXGISwapChain_GetParent 6 var, int
#comfunc IDXGISwapChain_GetDevice 7 var, int
#comfunc IDXGISwapChain_Present 8 int, int
#comfunc IDXGISwapChain_GetBuffer 9 int, var, int
#comfunc IDXGISwapChain_SetFullscreenState 10 int, comobj
#comfunc IDXGISwapChain_GetFullscreenState 11 var, comobj
#comfunc IDXGISwapChain_GetDesc 12
#comfunc IDXGISwapChain_ResizeBuffers 13 int, int, int, int, int
#comfunc IDXGISwapChain_ResizeTarget 14 var
#comfunc IDXGISwapChain_GetContainingOutput 15 comobj
#comfunc IDXGISwapChain_GetFrameStatistics 16 var
#comfunc IDXGISwapChain_GetLastPresentCount 17 int

;--- IEnumFORMATETC
#define IID_IEnumFORMATETC "{00000103-0000-0000-C000-000000000046}"
#usecom IEnumFORMATETC IID_IEnumFORMATETC "{}"
#comfunc IEnumFORMATETC_Next 3 int, var, var
#comfunc IEnumFORMATETC_Skip 4 int
#comfunc IEnumFORMATETC_Reset 5
#comfunc IEnumFORMATETC_Clone 6 comobj

;--- IEnumMoniker
#define IID_IEnumMoniker "{00000102-0000-0000-C000-000000000046}"
#usecom IEnumMoniker IID_IEnumMoniker "{}"
#comfunc IEnumMoniker_Next 3 int, comobj, var
#comfunc IEnumMoniker_Skip 4 int
#comfunc IEnumMoniker_Reset 5
#comfunc IEnumMoniker_Clone 6 comobj

;--- IEnumShellItems
#define IID_IEnumShellItems "{70629033-E363-4A28-A567-0DB78006E6D7}"
#usecom IEnumShellItems IID_IEnumShellItems "{}"
#comfunc IEnumShellItems_Next 3 int, comobj, var
#comfunc IEnumShellItems_Skip 4 int
#comfunc IEnumShellItems_Reset 5
#comfunc IEnumShellItems_Clone 6 comobj

;--- IEnumSTATDATA
#define IID_IEnumSTATDATA "{00000105-0000-0000-C000-000000000046}"
#usecom IEnumSTATDATA IID_IEnumSTATDATA "{}"
#comfunc IEnumSTATDATA_Next 3 int, int, var
#comfunc IEnumSTATDATA_Skip 4 int
#comfunc IEnumSTATDATA_Reset 5
#comfunc IEnumSTATDATA_Clone 6 comobj

;--- IEnumString
#define IID_IEnumString "{00000101-0000-0000-C000-000000000046}"
#usecom IEnumString IID_IEnumString "{}"
#comfunc IEnumString_Next 3 int, var, var
#comfunc IEnumString_Skip 4 int
#comfunc IEnumString_Reset 5
#comfunc IEnumString_Clone 6 comobj

;--- IEnumUnknown
#define IID_IEnumUnknown "{00000100-0000-0000-C000-000000000046}"
#usecom IEnumUnknown IID_IEnumUnknown "{}"
#comfunc IEnumUnknown_Next 3 int, int, var
#comfunc IEnumUnknown_Skip 4 int
#comfunc IEnumUnknown_Reset 5
#comfunc IEnumUnknown_Clone 6 comobj

;--- IErrorLog
#define IID_IErrorLog "{3127CA40-446E-11CE-8135-00AA004BB851}"
#usecom IErrorLog IID_IErrorLog "{}"
#comfunc IErrorLog_AddError 3 wstr, int

;--- IFileDialog
#define IID_IFileDialog "{42F85136-DB7E-439C-85F1-E4075D135FC8}"
#usecom IFileDialog IID_IFileDialog "{}"
#comfunc IFileDialog_Show 3 intptr
#comfunc IFileDialog_SetFileTypes 4 int, var
#comfunc IFileDialog_SetFileTypeIndex 5 int
#comfunc IFileDialog_GetFileTypeIndex 6 int
#comfunc IFileDialog_Advise 7 comobj, int
#comfunc IFileDialog_Unadvise 8 int
#comfunc IFileDialog_SetOptions 9 int
#comfunc IFileDialog_GetOptions 10 var
#comfunc IFileDialog_SetDefaultFolder 11 comobj
#comfunc IFileDialog_SetFolder 12 comobj
#comfunc IFileDialog_GetFolder 13 comobj
#comfunc IFileDialog_GetCurrentSelection 14 comobj
#comfunc IFileDialog_SetFileName 15 wstr
#comfunc IFileDialog_GetFileName 16 var
#comfunc IFileDialog_SetTitle 17 wstr
#comfunc IFileDialog_SetOkButtonLabel 18 wstr
#comfunc IFileDialog_SetFileNameLabel 19 wstr
#comfunc IFileDialog_GetResult 20 comobj
#comfunc IFileDialog_AddPlace 21 comobj, int
#comfunc IFileDialog_SetDefaultExtension 22 wstr
#comfunc IFileDialog_Close 23 intptr
#comfunc IFileDialog_SetClientGuid 24 var
#comfunc IFileDialog_ClearClientData 25
#comfunc IFileDialog_SetFilter 26 comobj

;--- IFileDialogEvents
#define IID_IFileDialogEvents "{973510DB-7D7F-452B-8975-74A85828D354}"
#usecom IFileDialogEvents IID_IFileDialogEvents "{}"
#comfunc IFileDialogEvents_OnFileOk 3 comobj
#comfunc IFileDialogEvents_OnFolderChanging 4 comobj, comobj
#comfunc IFileDialogEvents_OnFolderChange 5 comobj
#comfunc IFileDialogEvents_OnSelectionChange 6 comobj
#comfunc IFileDialogEvents_OnShareViolation 7 comobj, comobj, var
#comfunc IFileDialogEvents_OnTypeChange 8 comobj
#comfunc IFileDialogEvents_OnOverwrite 9 comobj, comobj, var

;--- IFileOpenDialog
#define IID_IFileOpenDialog "{D57C7288-D4AD-4768-BE02-9D969532D960}"
#usecom IFileOpenDialog IID_IFileOpenDialog "{}"
#comfunc IFileOpenDialog_Show 3 intptr
#comfunc IFileOpenDialog_SetFileTypes 4 int, var
#comfunc IFileOpenDialog_SetFileTypeIndex 5 int
#comfunc IFileOpenDialog_GetFileTypeIndex 6 int
#comfunc IFileOpenDialog_Advise 7 comobj, int
#comfunc IFileOpenDialog_Unadvise 8 int
#comfunc IFileOpenDialog_SetOptions 9 int
#comfunc IFileOpenDialog_GetOptions 10 var
#comfunc IFileOpenDialog_SetDefaultFolder 11 comobj
#comfunc IFileOpenDialog_SetFolder 12 comobj
#comfunc IFileOpenDialog_GetFolder 13 comobj
#comfunc IFileOpenDialog_GetCurrentSelection 14 comobj
#comfunc IFileOpenDialog_SetFileName 15 wstr
#comfunc IFileOpenDialog_GetFileName 16 var
#comfunc IFileOpenDialog_SetTitle 17 wstr
#comfunc IFileOpenDialog_SetOkButtonLabel 18 wstr
#comfunc IFileOpenDialog_SetFileNameLabel 19 wstr
#comfunc IFileOpenDialog_GetResult 20 comobj
#comfunc IFileOpenDialog_AddPlace 21 comobj, int
#comfunc IFileOpenDialog_SetDefaultExtension 22 wstr
#comfunc IFileOpenDialog_Close 23 intptr
#comfunc IFileOpenDialog_SetClientGuid 24 var
#comfunc IFileOpenDialog_ClearClientData 25
#comfunc IFileOpenDialog_SetFilter 26 comobj
#comfunc IFileOpenDialog_GetResults 27 comobj
#comfunc IFileOpenDialog_GetSelectedItems 28 comobj

;--- IFileOperationProgressSink
#define IID_IFileOperationProgressSink "{04B0F1A7-9490-44BC-96E1-4296A31252E2}"
#usecom IFileOperationProgressSink IID_IFileOperationProgressSink "{}"
#comfunc IFileOperationProgressSink_StartOperations 3
#comfunc IFileOperationProgressSink_FinishOperations 4 intptr
#comfunc IFileOperationProgressSink_PreRenameItem 5 int, comobj, wstr
#comfunc IFileOperationProgressSink_PostRenameItem 6 int, comobj, wstr, intptr, comobj
#comfunc IFileOperationProgressSink_PreMoveItem 7 int, comobj, comobj, wstr
#comfunc IFileOperationProgressSink_PostMoveItem 8 int, comobj, comobj, wstr, intptr, comobj
#comfunc IFileOperationProgressSink_PreCopyItem 9 int, comobj, comobj, wstr
#comfunc IFileOperationProgressSink_PostCopyItem 10 int, comobj, comobj, wstr, intptr, comobj
#comfunc IFileOperationProgressSink_PreDeleteItem 11 int, comobj
#comfunc IFileOperationProgressSink_PostDeleteItem 12 int, comobj, intptr, comobj
#comfunc IFileOperationProgressSink_PreNewItem 13 int, comobj, wstr
#comfunc IFileOperationProgressSink_PostNewItem 14 int, comobj, wstr, wstr, int, intptr, comobj
#comfunc IFileOperationProgressSink_UpdateProgress 15 int, int
#comfunc IFileOperationProgressSink_ResetTimer 16
#comfunc IFileOperationProgressSink_PauseTimer 17
#comfunc IFileOperationProgressSink_ResumeTimer 18

;--- IFileSaveDialog
#define IID_IFileSaveDialog "{84BCCD23-5FDE-4CDB-AEA4-AF64B83D78AB}"
#usecom IFileSaveDialog IID_IFileSaveDialog "{}"
#comfunc IFileSaveDialog_Show 3 intptr
#comfunc IFileSaveDialog_SetFileTypes 4 int, var
#comfunc IFileSaveDialog_SetFileTypeIndex 5 int
#comfunc IFileSaveDialog_GetFileTypeIndex 6 int
#comfunc IFileSaveDialog_Advise 7 comobj, int
#comfunc IFileSaveDialog_Unadvise 8 int
#comfunc IFileSaveDialog_SetOptions 9 int
#comfunc IFileSaveDialog_GetOptions 10 var
#comfunc IFileSaveDialog_SetDefaultFolder 11 comobj
#comfunc IFileSaveDialog_SetFolder 12 comobj
#comfunc IFileSaveDialog_GetFolder 13 comobj
#comfunc IFileSaveDialog_GetCurrentSelection 14 comobj
#comfunc IFileSaveDialog_SetFileName 15 wstr
#comfunc IFileSaveDialog_GetFileName 16 var
#comfunc IFileSaveDialog_SetTitle 17 wstr
#comfunc IFileSaveDialog_SetOkButtonLabel 18 wstr
#comfunc IFileSaveDialog_SetFileNameLabel 19 wstr
#comfunc IFileSaveDialog_GetResult 20 comobj
#comfunc IFileSaveDialog_AddPlace 21 comobj, int
#comfunc IFileSaveDialog_SetDefaultExtension 22 wstr
#comfunc IFileSaveDialog_Close 23 intptr
#comfunc IFileSaveDialog_SetClientGuid 24 var
#comfunc IFileSaveDialog_ClearClientData 25
#comfunc IFileSaveDialog_SetFilter 26 comobj
#comfunc IFileSaveDialog_SetSaveAsItem 27 comobj
#comfunc IFileSaveDialog_SetProperties 28 comobj
#comfunc IFileSaveDialog_SetCollectedProperties 29 comobj, int
#comfunc IFileSaveDialog_GetProperties 30 comobj
#comfunc IFileSaveDialog_ApplyProperties 31 comobj, comobj, intptr, comobj

;--- IModalWindow
#define IID_IModalWindow "{B4DB1657-70D7-485E-8E3E-6FCB5A5C1802}"
#usecom IModalWindow IID_IModalWindow "{}"
#comfunc IModalWindow_Show 3 intptr

;--- IMoniker
#define IID_IMoniker "{0000000F-0000-0000-C000-000000000046}"
#usecom IMoniker IID_IMoniker "{}"
#comfunc IMoniker_GetClassID 3 var
#comfunc IMoniker_IsDirty 4
#comfunc IMoniker_Load 5 comobj
#comfunc IMoniker_Save 6 comobj, int
#comfunc IMoniker_GetSizeMax 7 int64
#comfunc IMoniker_BindToObject 8 comobj, comobj, var, int
#comfunc IMoniker_BindToStorage 9 comobj, comobj, var, int
#comfunc IMoniker_Reduce 10 comobj, int, comobj, comobj
#comfunc IMoniker_ComposeWith 11 comobj, int, comobj
#comfunc IMoniker_Enum 12 int, comobj
#comfunc IMoniker_IsEqual 13 comobj
#comfunc IMoniker_Hash 14 int
#comfunc IMoniker_IsRunning 15 comobj, comobj, comobj
#comfunc IMoniker_GetTimeOfLastChange 16 comobj, comobj, var
#comfunc IMoniker_Inverse 17 comobj
#comfunc IMoniker_CommonPrefixWith 18 comobj, comobj
#comfunc IMoniker_RelativePathTo 19 comobj, comobj
#comfunc IMoniker_GetDisplayName 20 comobj, comobj, var
#comfunc IMoniker_ParseDisplayName 21 comobj, comobj, wstr, int, comobj
#comfunc IMoniker_IsSystemMoniker 22 int

;--- IPersist
#define IID_IPersist "{0000010C-0000-0000-C000-000000000046}"
#usecom IPersist IID_IPersist "{}"
#comfunc IPersist_GetClassID 3 var

;--- IPersistFile
#define IID_IPersistFile "{0000010B-0000-0000-C000-000000000046}"
#usecom IPersistFile IID_IPersistFile "{}"
#comfunc IPersistFile_GetClassID 3 var
#comfunc IPersistFile_IsDirty 4
#comfunc IPersistFile_Load 5 wstr, int
#comfunc IPersistFile_Save 6 wstr, int
#comfunc IPersistFile_SaveCompleted 7 wstr
#comfunc IPersistFile_GetCurFile 8 var

;--- IPersistStream
#define IID_IPersistStream "{00000109-0000-0000-C000-000000000046}"
#usecom IPersistStream IID_IPersistStream "{}"
#comfunc IPersistStream_GetClassID 3 var
#comfunc IPersistStream_IsDirty 4
#comfunc IPersistStream_Load 5 comobj
#comfunc IPersistStream_Save 6 comobj, int
#comfunc IPersistStream_GetSizeMax 7 int64

;--- IPropertyBag2
#define IID_IPropertyBag2 "{22F55882-280B-11D0-A8A9-00A0C90C2004}"
#usecom IPropertyBag2 IID_IPropertyBag2 "{}"
#comfunc IPropertyBag2_Read 3 int, var, comobj, int, var
#comfunc IPropertyBag2_Write 4 int, var, int
#comfunc IPropertyBag2_CountProperties 5 int
#comfunc IPropertyBag2_GetPropertyInfo 6 int, int, var, int
#comfunc IPropertyBag2_LoadObject 7 wstr, int, int, comobj

;--- IPropertyDescriptionList
#define IID_IPropertyDescriptionList "{1F9FC1D0-C39B-4B26-817F-011967D3440E}"
#usecom IPropertyDescriptionList IID_IPropertyDescriptionList "{}"
#comfunc IPropertyDescriptionList_GetCount 3 int
#comfunc IPropertyDescriptionList_GetAt 4 int, var, int

;--- IPropertyStore
#define IID_IPropertyStore "{886D8EEB-8CF2-4446-8D02-CDBA1DBDCF99}"
#usecom IPropertyStore IID_IPropertyStore "{}"
#comfunc IPropertyStore_GetCount 3 int
#comfunc IPropertyStore_GetAt 4 int, var
#comfunc IPropertyStore_GetValue 5 var, int
#comfunc IPropertyStore_SetValue 6 var, int
#comfunc IPropertyStore_Commit 7

;--- IRunningObjectTable
#define IID_IRunningObjectTable "{00000010-0000-0000-C000-000000000046}"
#usecom IRunningObjectTable IID_IRunningObjectTable "{}"
#comfunc IRunningObjectTable_Register 3 int, int, comobj, int
#comfunc IRunningObjectTable_Revoke 4 int
#comfunc IRunningObjectTable_IsRunning 5 comobj
#comfunc IRunningObjectTable_GetObject 6 comobj, int
#comfunc IRunningObjectTable_NoteChangeTime 7 int, var
#comfunc IRunningObjectTable_GetTimeOfLastChange 8 comobj, var
#comfunc IRunningObjectTable_EnumRunning 9 comobj

;--- ISequentialStream
#define IID_ISequentialStream "{0C733A30-2A1C-11CE-ADE5-00AA0044773D}"
#usecom ISequentialStream IID_ISequentialStream "{}"
#comfunc ISequentialStream_Read 3 intptr, int, var
#comfunc ISequentialStream_Write 4 intptr, int, var

;--- IShellItem
#define IID_IShellItem "{43826D1E-E718-42EE-BC55-A1E261C37BFE}"
#usecom IShellItem IID_IShellItem "{}"
#comfunc IShellItem_BindToHandler 3 comobj, var, var, int
#comfunc IShellItem_GetParent 4 comobj
#comfunc IShellItem_GetDisplayName 5 int, var
#comfunc IShellItem_GetAttributes 6 int, var
#comfunc IShellItem_Compare 7 comobj, int, int

;--- IShellItemArray
#define IID_IShellItemArray "{B63EA76D-1F85-456F-A19C-48159EFA858B}"
#usecom IShellItemArray IID_IShellItemArray "{}"
#comfunc IShellItemArray_BindToHandler 3 comobj, var, var, int
#comfunc IShellItemArray_GetPropertyStore 4 int, var, int
#comfunc IShellItemArray_GetPropertyDescriptionList 5 var, var, int
#comfunc IShellItemArray_GetAttributes 6 int, int, var
#comfunc IShellItemArray_GetCount 7 int
#comfunc IShellItemArray_GetItemAt 8 int, comobj
#comfunc IShellItemArray_EnumItems 9 comobj

;--- IShellItemFilter
#define IID_IShellItemFilter "{2659B475-EEB8-48B7-8F07-B378810F48CF}"
#usecom IShellItemFilter IID_IShellItemFilter "{}"
#comfunc IShellItemFilter_IncludeItem 3 comobj
#comfunc IShellItemFilter_GetEnumFlagsForItem 4 comobj, int

;--- IShellLinkW
#define IID_IShellLinkW "{000214F9-0000-0000-C000-000000000046}"
#usecom IShellLinkW IID_IShellLinkW "{}"
#comfunc IShellLinkW_GetPath 3 wstr, int, var, int
#comfunc IShellLinkW_GetIDList 4 comobj
#comfunc IShellLinkW_SetIDList 5 comobj
#comfunc IShellLinkW_GetDescription 6 wstr, int
#comfunc IShellLinkW_SetDescription 7 wstr
#comfunc IShellLinkW_GetWorkingDirectory 8 wstr, int
#comfunc IShellLinkW_SetWorkingDirectory 9 wstr
#comfunc IShellLinkW_GetArguments 10 wstr, int
#comfunc IShellLinkW_SetArguments 11 wstr
#comfunc IShellLinkW_GetHotkey 12 int
#comfunc IShellLinkW_SetHotkey 13 int
#comfunc IShellLinkW_GetShowCmd 14 var
#comfunc IShellLinkW_SetShowCmd 15 int
#comfunc IShellLinkW_GetIconLocation 16 wstr, int, int
#comfunc IShellLinkW_SetIconLocation 17 wstr, int
#comfunc IShellLinkW_SetRelativePath 18 wstr, int
#comfunc IShellLinkW_Resolve 19 intptr, int
#comfunc IShellLinkW_SetPath 20 wstr

;--- IStream
#define IID_IStream "{0000000C-0000-0000-C000-000000000046}"
#usecom IStream IID_IStream "{}"
#comfunc IStream_Read 3 intptr, int, var
#comfunc IStream_Write 4 intptr, int, var
#comfunc IStream_Seek 5 int64, int, var
#comfunc IStream_SetSize 6 int64
#comfunc IStream_CopyTo 7 comobj, int64, var, var
#comfunc IStream_Commit 8 int
#comfunc IStream_Revert 9
#comfunc IStream_LockRegion 10 int64, int64, int
#comfunc IStream_UnlockRegion 11 int64, int64, int
#comfunc IStream_Stat 12 var, int
#comfunc IStream_Clone 13 comobj

;--- IWICBitmap
#define IID_IWICBitmap "{00000121-A8F2-4877-BA0A-FD2B6645FB94}"
#usecom IWICBitmap IID_IWICBitmap "{}"
#comfunc IWICBitmap_GetSize 3 int, int
#comfunc IWICBitmap_GetPixelFormat 4 var
#comfunc IWICBitmap_GetResolution 5 double, double
#comfunc IWICBitmap_CopyPalette 6 comobj
#comfunc IWICBitmap_CopyPixels 7 var, int, int, int
#comfunc IWICBitmap_Lock 8 var, int, comobj
#comfunc IWICBitmap_SetPalette 9 comobj
#comfunc IWICBitmap_SetResolution 10 double, double

;--- IWICBitmapClipper
#define IID_IWICBitmapClipper "{E4FBCF03-223D-4E81-9333-D635556DD1B5}"
#usecom IWICBitmapClipper IID_IWICBitmapClipper "{}"
#comfunc IWICBitmapClipper_GetSize 3 int, int
#comfunc IWICBitmapClipper_GetPixelFormat 4 var
#comfunc IWICBitmapClipper_GetResolution 5 double, double
#comfunc IWICBitmapClipper_CopyPalette 6 comobj
#comfunc IWICBitmapClipper_CopyPixels 7 var, int, int, int
#comfunc IWICBitmapClipper_Initialize 8 comobj, var

;--- IWICBitmapCodecInfo
#define IID_IWICBitmapCodecInfo "{E87A44C4-B76E-4C47-8B09-298EB12A2714}"
#usecom IWICBitmapCodecInfo IID_IWICBitmapCodecInfo "{}"
#comfunc IWICBitmapCodecInfo_GetComponentType 3 var
#comfunc IWICBitmapCodecInfo_GetCLSID 4 var
#comfunc IWICBitmapCodecInfo_GetSigningStatus 5 int
#comfunc IWICBitmapCodecInfo_GetAuthor 6 int, wstr, int
#comfunc IWICBitmapCodecInfo_GetVendorGUID 7 var
#comfunc IWICBitmapCodecInfo_GetVersion 8 int, wstr, int
#comfunc IWICBitmapCodecInfo_GetSpecVersion 9 int, wstr, int
#comfunc IWICBitmapCodecInfo_GetFriendlyName 10 int, wstr, int
#comfunc IWICBitmapCodecInfo_GetContainerFormat 11 var
#comfunc IWICBitmapCodecInfo_GetPixelFormats 12 int, var, int
#comfunc IWICBitmapCodecInfo_GetColorManagementVersion 13 int, wstr, int
#comfunc IWICBitmapCodecInfo_GetDeviceManufacturer 14 int, wstr, int
#comfunc IWICBitmapCodecInfo_GetDeviceModels 15 int, wstr, int
#comfunc IWICBitmapCodecInfo_GetMimeTypes 16 int, wstr, int
#comfunc IWICBitmapCodecInfo_GetFileExtensions 17 int, wstr, int
#comfunc IWICBitmapCodecInfo_DoesSupportAnimation 18 var
#comfunc IWICBitmapCodecInfo_DoesSupportChromakey 19 var
#comfunc IWICBitmapCodecInfo_DoesSupportLossless 20 var
#comfunc IWICBitmapCodecInfo_DoesSupportMultiframe 21 var
#comfunc IWICBitmapCodecInfo_MatchesMimeType 22 wstr, var

;--- IWICBitmapDecoder
#define IID_IWICBitmapDecoder "{9EDDE9E7-8DEE-47EA-99DF-E6FAF2ED44BF}"
#usecom IWICBitmapDecoder IID_IWICBitmapDecoder "{}"
#comfunc IWICBitmapDecoder_QueryCapability 3 comobj, int
#comfunc IWICBitmapDecoder_Initialize 4 comobj, int
#comfunc IWICBitmapDecoder_GetContainerFormat 5 var
#comfunc IWICBitmapDecoder_GetDecoderInfo 6 comobj
#comfunc IWICBitmapDecoder_CopyPalette 7 comobj
#comfunc IWICBitmapDecoder_GetMetadataQueryReader 8 comobj
#comfunc IWICBitmapDecoder_GetPreview 9 comobj
#comfunc IWICBitmapDecoder_GetColorContexts 10 int, comobj, int
#comfunc IWICBitmapDecoder_GetThumbnail 11 comobj
#comfunc IWICBitmapDecoder_GetFrameCount 12 int
#comfunc IWICBitmapDecoder_GetFrame 13 int, comobj

;--- IWICBitmapDecoderInfo
#define IID_IWICBitmapDecoderInfo "{D8CD007F-D08F-4191-9BFC-236EA7F0E4B5}"
#usecom IWICBitmapDecoderInfo IID_IWICBitmapDecoderInfo "{}"
#comfunc IWICBitmapDecoderInfo_GetComponentType 3 var
#comfunc IWICBitmapDecoderInfo_GetCLSID 4 var
#comfunc IWICBitmapDecoderInfo_GetSigningStatus 5 int
#comfunc IWICBitmapDecoderInfo_GetAuthor 6 int, wstr, int
#comfunc IWICBitmapDecoderInfo_GetVendorGUID 7 var
#comfunc IWICBitmapDecoderInfo_GetVersion 8 int, wstr, int
#comfunc IWICBitmapDecoderInfo_GetSpecVersion 9 int, wstr, int
#comfunc IWICBitmapDecoderInfo_GetFriendlyName 10 int, wstr, int
#comfunc IWICBitmapDecoderInfo_GetContainerFormat 11 var
#comfunc IWICBitmapDecoderInfo_GetPixelFormats 12 int, var, int
#comfunc IWICBitmapDecoderInfo_GetColorManagementVersion 13 int, wstr, int
#comfunc IWICBitmapDecoderInfo_GetDeviceManufacturer 14 int, wstr, int
#comfunc IWICBitmapDecoderInfo_GetDeviceModels 15 int, wstr, int
#comfunc IWICBitmapDecoderInfo_GetMimeTypes 16 int, wstr, int
#comfunc IWICBitmapDecoderInfo_GetFileExtensions 17 int, wstr, int
#comfunc IWICBitmapDecoderInfo_DoesSupportAnimation 18 var
#comfunc IWICBitmapDecoderInfo_DoesSupportChromakey 19 var
#comfunc IWICBitmapDecoderInfo_DoesSupportLossless 20 var
#comfunc IWICBitmapDecoderInfo_DoesSupportMultiframe 21 var
#comfunc IWICBitmapDecoderInfo_MatchesMimeType 22 wstr, var
#comfunc IWICBitmapDecoderInfo_GetPatterns 23 int, var, var, int
#comfunc IWICBitmapDecoderInfo_MatchesPattern 24 comobj, var
#comfunc IWICBitmapDecoderInfo_CreateInstance 25 comobj

;--- IWICBitmapEncoder
#define IID_IWICBitmapEncoder "{00000103-A8F2-4877-BA0A-FD2B6645FB94}"
#usecom IWICBitmapEncoder IID_IWICBitmapEncoder "{}"
#comfunc IWICBitmapEncoder_Initialize 3 comobj, int
#comfunc IWICBitmapEncoder_GetContainerFormat 4 var
#comfunc IWICBitmapEncoder_GetEncoderInfo 5 comobj
#comfunc IWICBitmapEncoder_SetColorContexts 6 int, comobj
#comfunc IWICBitmapEncoder_SetPalette 7 comobj
#comfunc IWICBitmapEncoder_SetThumbnail 8 comobj
#comfunc IWICBitmapEncoder_SetPreview 9 comobj
#comfunc IWICBitmapEncoder_CreateNewFrame 10 comobj, comobj
#comfunc IWICBitmapEncoder_Commit 11
#comfunc IWICBitmapEncoder_GetMetadataQueryWriter 12 comobj

;--- IWICBitmapEncoderInfo
#define IID_IWICBitmapEncoderInfo "{94C9B4EE-A09F-4F92-8A1E-4A9BCE7E76FB}"
#usecom IWICBitmapEncoderInfo IID_IWICBitmapEncoderInfo "{}"
#comfunc IWICBitmapEncoderInfo_GetComponentType 3 var
#comfunc IWICBitmapEncoderInfo_GetCLSID 4 var
#comfunc IWICBitmapEncoderInfo_GetSigningStatus 5 int
#comfunc IWICBitmapEncoderInfo_GetAuthor 6 int, wstr, int
#comfunc IWICBitmapEncoderInfo_GetVendorGUID 7 var
#comfunc IWICBitmapEncoderInfo_GetVersion 8 int, wstr, int
#comfunc IWICBitmapEncoderInfo_GetSpecVersion 9 int, wstr, int
#comfunc IWICBitmapEncoderInfo_GetFriendlyName 10 int, wstr, int
#comfunc IWICBitmapEncoderInfo_GetContainerFormat 11 var
#comfunc IWICBitmapEncoderInfo_GetPixelFormats 12 int, var, int
#comfunc IWICBitmapEncoderInfo_GetColorManagementVersion 13 int, wstr, int
#comfunc IWICBitmapEncoderInfo_GetDeviceManufacturer 14 int, wstr, int
#comfunc IWICBitmapEncoderInfo_GetDeviceModels 15 int, wstr, int
#comfunc IWICBitmapEncoderInfo_GetMimeTypes 16 int, wstr, int
#comfunc IWICBitmapEncoderInfo_GetFileExtensions 17 int, wstr, int
#comfunc IWICBitmapEncoderInfo_DoesSupportAnimation 18 var
#comfunc IWICBitmapEncoderInfo_DoesSupportChromakey 19 var
#comfunc IWICBitmapEncoderInfo_DoesSupportLossless 20 var
#comfunc IWICBitmapEncoderInfo_DoesSupportMultiframe 21 var
#comfunc IWICBitmapEncoderInfo_MatchesMimeType 22 wstr, var
#comfunc IWICBitmapEncoderInfo_CreateInstance 23 comobj

;--- IWICBitmapFlipRotator
#define IID_IWICBitmapFlipRotator "{5009834F-2D6A-41CE-9E1B-17C5AFF7A782}"
#usecom IWICBitmapFlipRotator IID_IWICBitmapFlipRotator "{}"
#comfunc IWICBitmapFlipRotator_GetSize 3 int, int
#comfunc IWICBitmapFlipRotator_GetPixelFormat 4 var
#comfunc IWICBitmapFlipRotator_GetResolution 5 double, double
#comfunc IWICBitmapFlipRotator_CopyPalette 6 comobj
#comfunc IWICBitmapFlipRotator_CopyPixels 7 var, int, int, int
#comfunc IWICBitmapFlipRotator_Initialize 8 comobj, int

;--- IWICBitmapFrameDecode
#define IID_IWICBitmapFrameDecode "{3B16811B-6A43-4EC9-A813-3D930C13B940}"
#usecom IWICBitmapFrameDecode IID_IWICBitmapFrameDecode "{}"
#comfunc IWICBitmapFrameDecode_GetSize 3 int, int
#comfunc IWICBitmapFrameDecode_GetPixelFormat 4 var
#comfunc IWICBitmapFrameDecode_GetResolution 5 double, double
#comfunc IWICBitmapFrameDecode_CopyPalette 6 comobj
#comfunc IWICBitmapFrameDecode_CopyPixels 7 var, int, int, int
#comfunc IWICBitmapFrameDecode_GetMetadataQueryReader 8 comobj
#comfunc IWICBitmapFrameDecode_GetColorContexts 9 int, comobj, int
#comfunc IWICBitmapFrameDecode_GetThumbnail 10 comobj

;--- IWICBitmapFrameEncode
#define IID_IWICBitmapFrameEncode "{00000105-A8F2-4877-BA0A-FD2B6645FB94}"
#usecom IWICBitmapFrameEncode IID_IWICBitmapFrameEncode "{}"
#comfunc IWICBitmapFrameEncode_Initialize 3 comobj
#comfunc IWICBitmapFrameEncode_SetSize 4 int, int
#comfunc IWICBitmapFrameEncode_SetResolution 5 double, double
#comfunc IWICBitmapFrameEncode_SetPixelFormat 6 var
#comfunc IWICBitmapFrameEncode_SetColorContexts 7 int, comobj
#comfunc IWICBitmapFrameEncode_SetPalette 8 comobj
#comfunc IWICBitmapFrameEncode_SetThumbnail 9 comobj
#comfunc IWICBitmapFrameEncode_WritePixels 10 int, int, int, int
#comfunc IWICBitmapFrameEncode_WriteSource 11 comobj, var
#comfunc IWICBitmapFrameEncode_Commit 12
#comfunc IWICBitmapFrameEncode_GetMetadataQueryWriter 13 comobj

;--- IWICBitmapLock
#define IID_IWICBitmapLock "{00000123-A8F2-4877-BA0A-FD2B6645FB94}"
#usecom IWICBitmapLock IID_IWICBitmapLock "{}"
#comfunc IWICBitmapLock_GetSize 3 int, int
#comfunc IWICBitmapLock_GetStride 4 int
#comfunc IWICBitmapLock_GetDataPointer 5 int, var
#comfunc IWICBitmapLock_GetPixelFormat 6 var

;--- IWICBitmapScaler
#define IID_IWICBitmapScaler "{00000302-A8F2-4877-BA0A-FD2B6645FB94}"
#usecom IWICBitmapScaler IID_IWICBitmapScaler "{}"
#comfunc IWICBitmapScaler_GetSize 3 int, int
#comfunc IWICBitmapScaler_GetPixelFormat 4 var
#comfunc IWICBitmapScaler_GetResolution 5 double, double
#comfunc IWICBitmapScaler_CopyPalette 6 comobj
#comfunc IWICBitmapScaler_CopyPixels 7 var, int, int, int
#comfunc IWICBitmapScaler_Initialize 8 comobj, int, int, int

;--- IWICBitmapSource
#define IID_IWICBitmapSource "{00000120-A8F2-4877-BA0A-FD2B6645FB94}"
#usecom IWICBitmapSource IID_IWICBitmapSource "{}"
#comfunc IWICBitmapSource_GetSize 3 int, int
#comfunc IWICBitmapSource_GetPixelFormat 4 var
#comfunc IWICBitmapSource_GetResolution 5 double, double
#comfunc IWICBitmapSource_CopyPalette 6 comobj
#comfunc IWICBitmapSource_CopyPixels 7 var, int, int, int

;--- IWICColorContext
#define IID_IWICColorContext "{3C613A02-34B2-44EA-9A7C-45AEA9C6FD6D}"
#usecom IWICColorContext IID_IWICColorContext "{}"
#comfunc IWICColorContext_InitializeFromFilename 3 wstr
#comfunc IWICColorContext_InitializeFromMemory 4 int, int
#comfunc IWICColorContext_InitializeFromExifColorSpace 5 int
#comfunc IWICColorContext_GetType 6 var
#comfunc IWICColorContext_GetProfileBytes 7 int, int, int
#comfunc IWICColorContext_GetExifColorSpace 8 int

;--- IWICColorTransform
#define IID_IWICColorTransform "{B66F034F-D0E2-40AB-B436-6DE39E321A94}"
#usecom IWICColorTransform IID_IWICColorTransform "{}"
#comfunc IWICColorTransform_GetSize 3 int, int
#comfunc IWICColorTransform_GetPixelFormat 4 var
#comfunc IWICColorTransform_GetResolution 5 double, double
#comfunc IWICColorTransform_CopyPalette 6 comobj
#comfunc IWICColorTransform_CopyPixels 7 var, int, int, int
#comfunc IWICColorTransform_Initialize 8 comobj, comobj, comobj, var

;--- IWICComponentInfo
#define IID_IWICComponentInfo "{23BC3F0A-698B-4357-886B-F24D50671334}"
#usecom IWICComponentInfo IID_IWICComponentInfo "{}"
#comfunc IWICComponentInfo_GetComponentType 3 var
#comfunc IWICComponentInfo_GetCLSID 4 var
#comfunc IWICComponentInfo_GetSigningStatus 5 int
#comfunc IWICComponentInfo_GetAuthor 6 int, wstr, int
#comfunc IWICComponentInfo_GetVendorGUID 7 var
#comfunc IWICComponentInfo_GetVersion 8 int, wstr, int
#comfunc IWICComponentInfo_GetSpecVersion 9 int, wstr, int
#comfunc IWICComponentInfo_GetFriendlyName 10 int, wstr, int

;--- IWICFastMetadataEncoder
#define IID_IWICFastMetadataEncoder "{B84E2C09-78C9-4AC4-8BD3-524AE1663A2F}"
#usecom IWICFastMetadataEncoder IID_IWICFastMetadataEncoder "{}"
#comfunc IWICFastMetadataEncoder_Commit 3
#comfunc IWICFastMetadataEncoder_GetMetadataQueryWriter 4 comobj

;--- IWICFormatConverter
#define IID_IWICFormatConverter "{00000301-A8F2-4877-BA0A-FD2B6645FB94}"
#usecom IWICFormatConverter IID_IWICFormatConverter "{}"
#comfunc IWICFormatConverter_GetSize 3 int, int
#comfunc IWICFormatConverter_GetPixelFormat 4 var
#comfunc IWICFormatConverter_GetResolution 5 double, double
#comfunc IWICFormatConverter_CopyPalette 6 comobj
#comfunc IWICFormatConverter_CopyPixels 7 var, int, int, int
#comfunc IWICFormatConverter_Initialize 8 comobj, var, int, comobj, double, int
#comfunc IWICFormatConverter_CanConvert 9 var, var, var

;--- IWICImagingFactory
#define IID_IWICImagingFactory "{EC5EC8A9-C395-4314-9C77-54D7A935FF70}"
#usecom IWICImagingFactory IID_IWICImagingFactory "{}"
#comfunc IWICImagingFactory_CreateDecoderFromFilename 3 wstr, var, int, int
#comfunc IWICImagingFactory_CreateDecoderFromStream 4 comobj, var, int
#comfunc IWICImagingFactory_CreateDecoderFromFileHandle 5 int, var, int
#comfunc IWICImagingFactory_CreateComponentInfo 6 var, comobj
#comfunc IWICImagingFactory_CreateDecoder 7 var, var
#comfunc IWICImagingFactory_CreateEncoder 8 var, var
#comfunc IWICImagingFactory_CreatePalette 9 comobj
#comfunc IWICImagingFactory_CreateFormatConverter 10 comobj
#comfunc IWICImagingFactory_CreateBitmapScaler 11 comobj
#comfunc IWICImagingFactory_CreateBitmapClipper 12 comobj
#comfunc IWICImagingFactory_CreateBitmapFlipRotator 13 comobj
#comfunc IWICImagingFactory_CreateStream 14 comobj
#comfunc IWICImagingFactory_CreateColorContext 15 comobj
#comfunc IWICImagingFactory_CreateColorTransformer 16 comobj
#comfunc IWICImagingFactory_CreateBitmap 17 int, int, var, int, comobj
#comfunc IWICImagingFactory_CreateBitmapFromSource 18 comobj, int, comobj
#comfunc IWICImagingFactory_CreateBitmapFromSourceRect 19 comobj, int, int, int, int, comobj
#comfunc IWICImagingFactory_CreateBitmapFromMemory 20 int, int, var, int, int, int, comobj
#comfunc IWICImagingFactory_CreateBitmapFromHBITMAP 21 intptr, int, int, comobj
#comfunc IWICImagingFactory_CreateBitmapFromHICON 22 intptr, comobj
#comfunc IWICImagingFactory_CreateComponentEnumerator 23 int, int, comobj
#comfunc IWICImagingFactory_CreateFastMetadataEncoderFromDecoder 24 comobj, comobj
#comfunc IWICImagingFactory_CreateFastMetadataEncoderFromFrameDecode 25 comobj, comobj
#comfunc IWICImagingFactory_CreateQueryWriter 26 var, var, comobj
#comfunc IWICImagingFactory_CreateQueryWriterFromReader 27 comobj, var, comobj

;--- IWICMetadataQueryReader
#define IID_IWICMetadataQueryReader "{30989668-E1C9-4597-B395-458EEDB808DF}"
#usecom IWICMetadataQueryReader IID_IWICMetadataQueryReader "{}"
#comfunc IWICMetadataQueryReader_GetContainerFormat 3 var
#comfunc IWICMetadataQueryReader_GetLocation 4 int, wstr, int
#comfunc IWICMetadataQueryReader_GetMetadataByName 5 wstr, int
#comfunc IWICMetadataQueryReader_GetEnumerator 6 comobj

;--- IWICMetadataQueryWriter
#define IID_IWICMetadataQueryWriter "{A721791A-0DEF-4D06-BD91-2118BF1DB10B}"
#usecom IWICMetadataQueryWriter IID_IWICMetadataQueryWriter "{}"
#comfunc IWICMetadataQueryWriter_GetContainerFormat 3 var
#comfunc IWICMetadataQueryWriter_GetLocation 4 int, wstr, int
#comfunc IWICMetadataQueryWriter_GetMetadataByName 5 wstr, int
#comfunc IWICMetadataQueryWriter_GetEnumerator 6 comobj
#comfunc IWICMetadataQueryWriter_SetMetadataByName 7 wstr, int
#comfunc IWICMetadataQueryWriter_RemoveMetadataByName 8 wstr

;--- IWICPalette
#define IID_IWICPalette "{00000040-A8F2-4877-BA0A-FD2B6645FB94}"
#usecom IWICPalette IID_IWICPalette "{}"
#comfunc IWICPalette_InitializePredefined 3 int, int
#comfunc IWICPalette_InitializeCustom 4 int, int
#comfunc IWICPalette_InitializeFromBitmap 5 comobj, int, int
#comfunc IWICPalette_InitializeFromPalette 6 comobj
#comfunc IWICPalette_GetType 7 var
#comfunc IWICPalette_GetColorCount 8 int
#comfunc IWICPalette_GetColors 9 int, int, int
#comfunc IWICPalette_IsBlackWhite 10 var
#comfunc IWICPalette_IsGrayscale 11 var
#comfunc IWICPalette_HasAlpha 12 var

;--- IWICStream
#define IID_IWICStream "{135FF860-22B7-4DDF-B0F6-218F4F299A43}"
#usecom IWICStream IID_IWICStream "{}"
#comfunc IWICStream_Read 3 intptr, int, var
#comfunc IWICStream_Write 4 intptr, int, var
#comfunc IWICStream_Seek 5 int64, int, var
#comfunc IWICStream_SetSize 6 int64
#comfunc IWICStream_CopyTo 7 comobj, int64, var, var
#comfunc IWICStream_Commit 8 int
#comfunc IWICStream_Revert 9
#comfunc IWICStream_LockRegion 10 int64, int64, int
#comfunc IWICStream_UnlockRegion 11 int64, int64, int
#comfunc IWICStream_Stat 12 var, int
#comfunc IWICStream_Clone 13 comobj
#comfunc IWICStream_InitializeFromIStream 14 comobj
#comfunc IWICStream_InitializeFromFilename 15 wstr, int
#comfunc IWICStream_InitializeFromMemory 16 int, int
#comfunc IWICStream_InitializeFromIStreamRegion 17 comobj, int64, int64

#endif
