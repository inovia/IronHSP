; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    gdiplus.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __gdiplus_gen2_as__
#define global __gdiplus_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "gdiplus.dll"
; winmdroot.Graphics.GdiPlus.Status GdipAddPathArc(winmdroot.Graphics.GdiPlus.GpPath* path, float x, float y, float width, float height, float startAngle, float sweepAngle)
#cfunc global GdipAddPathArc "GdipAddPathArc" intptr, float, float, float, float, float, float

; winmdroot.Graphics.GdiPlus.Status GdipAddPathArcI(winmdroot.Graphics.GdiPlus.GpPath* path, int x, int y, int width, int height, float startAngle, float sweepAngle)
#cfunc global GdipAddPathArcI "GdipAddPathArcI" intptr, int, int, int, int, float, float

; winmdroot.Graphics.GdiPlus.Status GdipAddPathBezier(winmdroot.Graphics.GdiPlus.GpPath* path, float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4)
#cfunc global GdipAddPathBezier "GdipAddPathBezier" intptr, float, float, float, float, float, float, float, float

; winmdroot.Graphics.GdiPlus.Status GdipAddPathBezierI(winmdroot.Graphics.GdiPlus.GpPath* path, int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4)
#cfunc global GdipAddPathBezierI "GdipAddPathBezierI" intptr, int, int, int, int, int, int, int, int

; winmdroot.Graphics.GdiPlus.Status GdipAddPathBeziers(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.PointF* points, int count)
#cfunc global GdipAddPathBeziers "GdipAddPathBeziers" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipAddPathBeziersI(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.Point* points, int count)
#cfunc global GdipAddPathBeziersI "GdipAddPathBeziersI" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipAddPathClosedCurve(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.PointF* points, int count)
#cfunc global GdipAddPathClosedCurve "GdipAddPathClosedCurve" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipAddPathClosedCurve2(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.PointF* points, int count, float tension)
#cfunc global GdipAddPathClosedCurve2 "GdipAddPathClosedCurve2" intptr, var, int, float

; winmdroot.Graphics.GdiPlus.Status GdipAddPathClosedCurve2I(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.Point* points, int count, float tension)
#cfunc global GdipAddPathClosedCurve2I "GdipAddPathClosedCurve2I" intptr, var, int, float

; winmdroot.Graphics.GdiPlus.Status GdipAddPathClosedCurveI(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.Point* points, int count)
#cfunc global GdipAddPathClosedCurveI "GdipAddPathClosedCurveI" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipAddPathCurve(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.PointF* points, int count)
#cfunc global GdipAddPathCurve "GdipAddPathCurve" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipAddPathCurve2(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.PointF* points, int count, float tension)
#cfunc global GdipAddPathCurve2 "GdipAddPathCurve2" intptr, var, int, float

; winmdroot.Graphics.GdiPlus.Status GdipAddPathCurve2I(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.Point* points, int count, float tension)
#cfunc global GdipAddPathCurve2I "GdipAddPathCurve2I" intptr, var, int, float

; winmdroot.Graphics.GdiPlus.Status GdipAddPathCurve3(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.PointF* points, int count, int offset, int numberOfSegments, float tension)
#cfunc global GdipAddPathCurve3 "GdipAddPathCurve3" intptr, var, int, int, int, float

; winmdroot.Graphics.GdiPlus.Status GdipAddPathCurve3I(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.Point* points, int count, int offset, int numberOfSegments, float tension)
#cfunc global GdipAddPathCurve3I "GdipAddPathCurve3I" intptr, var, int, int, int, float

; winmdroot.Graphics.GdiPlus.Status GdipAddPathCurveI(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.Point* points, int count)
#cfunc global GdipAddPathCurveI "GdipAddPathCurveI" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipAddPathEllipse(winmdroot.Graphics.GdiPlus.GpPath* path, float x, float y, float width, float height)
#cfunc global GdipAddPathEllipse "GdipAddPathEllipse" intptr, float, float, float, float

; winmdroot.Graphics.GdiPlus.Status GdipAddPathEllipseI(winmdroot.Graphics.GdiPlus.GpPath* path, int x, int y, int width, int height)
#cfunc global GdipAddPathEllipseI "GdipAddPathEllipseI" intptr, int, int, int, int

; winmdroot.Graphics.GdiPlus.Status GdipAddPathLine(winmdroot.Graphics.GdiPlus.GpPath* path, float x1, float y1, float x2, float y2)
#cfunc global GdipAddPathLine "GdipAddPathLine" intptr, float, float, float, float

; winmdroot.Graphics.GdiPlus.Status GdipAddPathLine2(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.PointF* points, int count)
#cfunc global GdipAddPathLine2 "GdipAddPathLine2" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipAddPathLine2I(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.Point* points, int count)
#cfunc global GdipAddPathLine2I "GdipAddPathLine2I" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipAddPathLineI(winmdroot.Graphics.GdiPlus.GpPath* path, int x1, int y1, int x2, int y2)
#cfunc global GdipAddPathLineI "GdipAddPathLineI" intptr, int, int, int, int

; winmdroot.Graphics.GdiPlus.Status GdipAddPathPath(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.GpPath* addingPath, winmdroot.Foundation.BOOL connect)
#cfunc global GdipAddPathPath "GdipAddPathPath" intptr, intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipAddPathPie(winmdroot.Graphics.GdiPlus.GpPath* path, float x, float y, float width, float height, float startAngle, float sweepAngle)
#cfunc global GdipAddPathPie "GdipAddPathPie" intptr, float, float, float, float, float, float

; winmdroot.Graphics.GdiPlus.Status GdipAddPathPieI(winmdroot.Graphics.GdiPlus.GpPath* path, int x, int y, int width, int height, float startAngle, float sweepAngle)
#cfunc global GdipAddPathPieI "GdipAddPathPieI" intptr, int, int, int, int, float, float

; winmdroot.Graphics.GdiPlus.Status GdipAddPathPolygon(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.PointF* points, int count)
#cfunc global GdipAddPathPolygon "GdipAddPathPolygon" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipAddPathPolygonI(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.Point* points, int count)
#cfunc global GdipAddPathPolygonI "GdipAddPathPolygonI" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipAddPathRectangle(winmdroot.Graphics.GdiPlus.GpPath* path, float x, float y, float width, float height)
#cfunc global GdipAddPathRectangle "GdipAddPathRectangle" intptr, float, float, float, float

; winmdroot.Graphics.GdiPlus.Status GdipAddPathRectangleI(winmdroot.Graphics.GdiPlus.GpPath* path, int x, int y, int width, int height)
#cfunc global GdipAddPathRectangleI "GdipAddPathRectangleI" intptr, int, int, int, int

; winmdroot.Graphics.GdiPlus.Status GdipAddPathRectangles(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.RectF* rects, int count)
#cfunc global GdipAddPathRectangles "GdipAddPathRectangles" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipAddPathRectanglesI(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.Rect* rects, int count)
#cfunc global GdipAddPathRectanglesI "GdipAddPathRectanglesI" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipAddPathString(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Foundation.PCWSTR @string, int length, winmdroot.Graphics.GdiPlus.GpFontFamily* family, int style, float emSize, winmdroot.Graphics.GdiPlus.RectF* layoutRect, winmdroot.Graphics.GdiPlus.GpStringFormat* format)
#cfunc global GdipAddPathString "GdipAddPathString" intptr, int, int, intptr, int, float, var, intptr

; winmdroot.Graphics.GdiPlus.Status GdipAddPathStringI(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Foundation.PCWSTR @string, int length, winmdroot.Graphics.GdiPlus.GpFontFamily* family, int style, float emSize, winmdroot.Graphics.GdiPlus.Rect* layoutRect, winmdroot.Graphics.GdiPlus.GpStringFormat* format)
#cfunc global GdipAddPathStringI "GdipAddPathStringI" intptr, int, int, intptr, int, float, var, intptr

; void* GdipAlloc(nuint size)
#cfunc global GdipAlloc "GdipAlloc" int

; winmdroot.Graphics.GdiPlus.Status GdipBeginContainer(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.RectF* dstrect, winmdroot.Graphics.GdiPlus.RectF* srcrect, winmdroot.Graphics.GdiPlus.Unit unit, uint* state)
#cfunc global GdipBeginContainer "GdipBeginContainer" intptr, var, var, int, var

; winmdroot.Graphics.GdiPlus.Status GdipBeginContainer2(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, uint* state)
#cfunc global GdipBeginContainer2 "GdipBeginContainer2" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipBeginContainerI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.Rect* dstrect, winmdroot.Graphics.GdiPlus.Rect* srcrect, winmdroot.Graphics.GdiPlus.Unit unit, uint* state)
#cfunc global GdipBeginContainerI "GdipBeginContainerI" intptr, var, var, int, var

; winmdroot.Graphics.GdiPlus.Status GdipBitmapApplyEffect(winmdroot.Graphics.GdiPlus.GpBitmap* bitmap, winmdroot.Graphics.GdiPlus.CGpEffect* effect, winmdroot.Foundation.RECT* roi, winmdroot.Foundation.BOOL useAuxData, void** auxData, int* auxDataSize)
#cfunc global GdipBitmapApplyEffect "GdipBitmapApplyEffect" intptr, intptr, var, int, var, var

; winmdroot.Graphics.GdiPlus.Status GdipBitmapConvertFormat(winmdroot.Graphics.GdiPlus.GpBitmap* pInputBitmap, int format, winmdroot.Graphics.GdiPlus.DitherType dithertype, winmdroot.Graphics.GdiPlus.PaletteType palettetype, winmdroot.Graphics.GdiPlus.ColorPalette* palette, float alphaThresholdPercent)
#cfunc global GdipBitmapConvertFormat "GdipBitmapConvertFormat" intptr, int, int, int, var, float

; winmdroot.Graphics.GdiPlus.Status GdipBitmapCreateApplyEffect(winmdroot.Graphics.GdiPlus.GpBitmap** inputBitmaps, int numInputs, winmdroot.Graphics.GdiPlus.CGpEffect* effect, winmdroot.Foundation.RECT* roi, winmdroot.Foundation.RECT* outputRect, winmdroot.Graphics.GdiPlus.GpBitmap** outputBitmap, winmdroot.Foundation.BOOL useAuxData, void** auxData, int* auxDataSize)
#cfunc global GdipBitmapCreateApplyEffect "GdipBitmapCreateApplyEffect" var, int, intptr, var, var, var, int, var, var

; winmdroot.Graphics.GdiPlus.Status GdipBitmapGetHistogram(winmdroot.Graphics.GdiPlus.GpBitmap* bitmap, winmdroot.Graphics.GdiPlus.HistogramFormat format, uint NumberOfEntries, uint* channel0, uint* channel1, uint* channel2, uint* channel3)
#cfunc global GdipBitmapGetHistogram "GdipBitmapGetHistogram" intptr, int, int, var, var, var, var

; winmdroot.Graphics.GdiPlus.Status GdipBitmapGetHistogramSize(winmdroot.Graphics.GdiPlus.HistogramFormat format, uint* NumberOfEntries)
#cfunc global GdipBitmapGetHistogramSize "GdipBitmapGetHistogramSize" int, var

; winmdroot.Graphics.GdiPlus.Status GdipBitmapGetPixel(winmdroot.Graphics.GdiPlus.GpBitmap* bitmap, int x, int y, uint* color)
#cfunc global GdipBitmapGetPixel "GdipBitmapGetPixel" intptr, int, int, var

; winmdroot.Graphics.GdiPlus.Status GdipBitmapLockBits(winmdroot.Graphics.GdiPlus.GpBitmap* bitmap, winmdroot.Graphics.GdiPlus.Rect* rect, uint flags, int format, winmdroot.Graphics.GdiPlus.BitmapData* lockedBitmapData)
#cfunc global GdipBitmapLockBits "GdipBitmapLockBits" intptr, var, int, int, var

; winmdroot.Graphics.GdiPlus.Status GdipBitmapSetPixel(winmdroot.Graphics.GdiPlus.GpBitmap* bitmap, int x, int y, uint color)
#cfunc global GdipBitmapSetPixel "GdipBitmapSetPixel" intptr, int, int, int

; winmdroot.Graphics.GdiPlus.Status GdipBitmapSetResolution(winmdroot.Graphics.GdiPlus.GpBitmap* bitmap, float xdpi, float ydpi)
#cfunc global GdipBitmapSetResolution "GdipBitmapSetResolution" intptr, float, float

; winmdroot.Graphics.GdiPlus.Status GdipBitmapUnlockBits(winmdroot.Graphics.GdiPlus.GpBitmap* bitmap, winmdroot.Graphics.GdiPlus.BitmapData* lockedBitmapData)
#cfunc global GdipBitmapUnlockBits "GdipBitmapUnlockBits" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipClearPathMarkers(winmdroot.Graphics.GdiPlus.GpPath* path)
#cfunc global GdipClearPathMarkers "GdipClearPathMarkers" intptr

; winmdroot.Graphics.GdiPlus.Status GdipCloneBitmapArea(float x, float y, float width, float height, int format, winmdroot.Graphics.GdiPlus.GpBitmap* srcBitmap, winmdroot.Graphics.GdiPlus.GpBitmap** dstBitmap)
#cfunc global GdipCloneBitmapArea "GdipCloneBitmapArea" float, float, float, float, int, intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipCloneBitmapAreaI(int x, int y, int width, int height, int format, winmdroot.Graphics.GdiPlus.GpBitmap* srcBitmap, winmdroot.Graphics.GdiPlus.GpBitmap** dstBitmap)
#cfunc global GdipCloneBitmapAreaI "GdipCloneBitmapAreaI" int, int, int, int, int, intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipCloneBrush(winmdroot.Graphics.GdiPlus.GpBrush* brush, winmdroot.Graphics.GdiPlus.GpBrush** cloneBrush)
#cfunc global GdipCloneBrush "GdipCloneBrush" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipCloneCustomLineCap(winmdroot.Graphics.GdiPlus.GpCustomLineCap* customCap, winmdroot.Graphics.GdiPlus.GpCustomLineCap** clonedCap)
#cfunc global GdipCloneCustomLineCap "GdipCloneCustomLineCap" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipCloneFont(winmdroot.Graphics.GdiPlus.GpFont* font, winmdroot.Graphics.GdiPlus.GpFont** cloneFont)
#cfunc global GdipCloneFont "GdipCloneFont" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipCloneFontFamily(winmdroot.Graphics.GdiPlus.GpFontFamily* fontFamily, winmdroot.Graphics.GdiPlus.GpFontFamily** clonedFontFamily)
#cfunc global GdipCloneFontFamily "GdipCloneFontFamily" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipCloneImage(winmdroot.Graphics.GdiPlus.GpImage* image, winmdroot.Graphics.GdiPlus.GpImage** cloneImage)
#cfunc global GdipCloneImage "GdipCloneImage" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipCloneImageAttributes(winmdroot.Graphics.GdiPlus.GpImageAttributes* imageattr, winmdroot.Graphics.GdiPlus.GpImageAttributes** cloneImageattr)
#cfunc global GdipCloneImageAttributes "GdipCloneImageAttributes" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipCloneMatrix(winmdroot.Graphics.GdiPlus.Matrix* matrix, winmdroot.Graphics.GdiPlus.Matrix** cloneMatrix)
#cfunc global GdipCloneMatrix "GdipCloneMatrix" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipClonePath(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.GpPath** clonePath)
#cfunc global GdipClonePath "GdipClonePath" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipClonePen(winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.GpPen** clonepen)
#cfunc global GdipClonePen "GdipClonePen" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipCloneRegion(winmdroot.Graphics.GdiPlus.GpRegion* region, winmdroot.Graphics.GdiPlus.GpRegion** cloneRegion)
#cfunc global GdipCloneRegion "GdipCloneRegion" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipCloneStringFormat(winmdroot.Graphics.GdiPlus.GpStringFormat* format, winmdroot.Graphics.GdiPlus.GpStringFormat** newFormat)
#cfunc global GdipCloneStringFormat "GdipCloneStringFormat" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipClosePathFigure(winmdroot.Graphics.GdiPlus.GpPath* path)
#cfunc global GdipClosePathFigure "GdipClosePathFigure" intptr

; winmdroot.Graphics.GdiPlus.Status GdipClosePathFigures(winmdroot.Graphics.GdiPlus.GpPath* path)
#cfunc global GdipClosePathFigures "GdipClosePathFigures" intptr

; winmdroot.Graphics.GdiPlus.Status GdipCombineRegionPath(winmdroot.Graphics.GdiPlus.GpRegion* region, winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.CombineMode combineMode)
#cfunc global GdipCombineRegionPath "GdipCombineRegionPath" intptr, intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipCombineRegionRect(winmdroot.Graphics.GdiPlus.GpRegion* region, winmdroot.Graphics.GdiPlus.RectF* rect, winmdroot.Graphics.GdiPlus.CombineMode combineMode)
#cfunc global GdipCombineRegionRect "GdipCombineRegionRect" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipCombineRegionRectI(winmdroot.Graphics.GdiPlus.GpRegion* region, winmdroot.Graphics.GdiPlus.Rect* rect, winmdroot.Graphics.GdiPlus.CombineMode combineMode)
#cfunc global GdipCombineRegionRectI "GdipCombineRegionRectI" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipCombineRegionRegion(winmdroot.Graphics.GdiPlus.GpRegion* region, winmdroot.Graphics.GdiPlus.GpRegion* region2, winmdroot.Graphics.GdiPlus.CombineMode combineMode)
#cfunc global GdipCombineRegionRegion "GdipCombineRegionRegion" intptr, intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipComment(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, uint sizeData, byte* data)
#cfunc global GdipComment "GdipComment" intptr, int, var

; winmdroot.Graphics.GdiPlus.Status GdipConvertToEmfPlus(winmdroot.Graphics.GdiPlus.GpGraphics* refGraphics, winmdroot.Graphics.GdiPlus.GpMetafile* metafile, int* conversionFailureFlag, winmdroot.Graphics.GdiPlus.EmfType emfType, winmdroot.Foundation.PCWSTR description, winmdroot.Graphics.GdiPlus.GpMetafile** out_metafile)
#cfunc global GdipConvertToEmfPlus "GdipConvertToEmfPlus" intptr, intptr, var, int, wstr, var

; winmdroot.Graphics.GdiPlus.Status GdipConvertToEmfPlusToFile(winmdroot.Graphics.GdiPlus.GpGraphics* refGraphics, winmdroot.Graphics.GdiPlus.GpMetafile* metafile, int* conversionFailureFlag, winmdroot.Foundation.PCWSTR filename, winmdroot.Graphics.GdiPlus.EmfType emfType, winmdroot.Foundation.PCWSTR description, winmdroot.Graphics.GdiPlus.GpMetafile** out_metafile)
#cfunc global GdipConvertToEmfPlusToFile "GdipConvertToEmfPlusToFile" intptr, intptr, var, wstr, int, wstr, var

; winmdroot.Graphics.GdiPlus.Status GdipConvertToEmfPlusToStream(winmdroot.Graphics.GdiPlus.GpGraphics* refGraphics, winmdroot.Graphics.GdiPlus.GpMetafile* metafile, int* conversionFailureFlag, winmdroot.System.Com.IStream* stream, winmdroot.Graphics.GdiPlus.EmfType emfType, winmdroot.Foundation.PCWSTR description, winmdroot.Graphics.GdiPlus.GpMetafile** out_metafile)
#cfunc global GdipConvertToEmfPlusToStream "GdipConvertToEmfPlusToStream" intptr, intptr, var, var, int, wstr, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateAdjustableArrowCap(float height, float width, winmdroot.Foundation.BOOL isFilled, winmdroot.Graphics.GdiPlus.GpAdjustableArrowCap** cap)
#cfunc global GdipCreateAdjustableArrowCap "GdipCreateAdjustableArrowCap" float, float, int, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateBitmapFromDirectDrawSurface(winmdroot.Graphics.DirectDraw.IDirectDrawSurface7* surface, winmdroot.Graphics.GdiPlus.GpBitmap** bitmap)
#cfunc global GdipCreateBitmapFromDirectDrawSurface "GdipCreateBitmapFromDirectDrawSurface" var, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateBitmapFromFile(winmdroot.Foundation.PCWSTR filename, winmdroot.Graphics.GdiPlus.GpBitmap** bitmap)
#cfunc global GdipCreateBitmapFromFile "GdipCreateBitmapFromFile" wstr, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateBitmapFromFileICM(winmdroot.Foundation.PCWSTR filename, winmdroot.Graphics.GdiPlus.GpBitmap** bitmap)
#cfunc global GdipCreateBitmapFromFileICM "GdipCreateBitmapFromFileICM" wstr, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateBitmapFromGdiDib(winmdroot.Graphics.Gdi.BITMAPINFO* gdiBitmapInfo, void* gdiBitmapData, winmdroot.Graphics.GdiPlus.GpBitmap** bitmap)
#cfunc global GdipCreateBitmapFromGdiDib "GdipCreateBitmapFromGdiDib" var, intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateBitmapFromGraphics(int width, int height, winmdroot.Graphics.GdiPlus.GpGraphics* target, winmdroot.Graphics.GdiPlus.GpBitmap** bitmap)
#cfunc global GdipCreateBitmapFromGraphics "GdipCreateBitmapFromGraphics" int, int, intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateBitmapFromHBITMAP(winmdroot.Graphics.Gdi.HBITMAP hbm, winmdroot.Graphics.Gdi.HPALETTE hpal, winmdroot.Graphics.GdiPlus.GpBitmap** bitmap)
#cfunc global GdipCreateBitmapFromHBITMAP "GdipCreateBitmapFromHBITMAP" intptr, intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateBitmapFromHICON(winmdroot.UI.WindowsAndMessaging.HICON hicon, winmdroot.Graphics.GdiPlus.GpBitmap** bitmap)
#cfunc global GdipCreateBitmapFromHICON "GdipCreateBitmapFromHICON" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateBitmapFromResource(winmdroot.Foundation.HINSTANCE hInstance, winmdroot.Foundation.PCWSTR lpBitmapName, winmdroot.Graphics.GdiPlus.GpBitmap** bitmap)
#cfunc global GdipCreateBitmapFromResource "GdipCreateBitmapFromResource" intptr, wstr, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateBitmapFromScan0(int width, int height, int stride, int format, [Optional] byte* scan0, winmdroot.Graphics.GdiPlus.GpBitmap** bitmap)
#cfunc global GdipCreateBitmapFromScan0 "GdipCreateBitmapFromScan0" int, int, int, int, var, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateBitmapFromStream(winmdroot.System.Com.IStream* stream, winmdroot.Graphics.GdiPlus.GpBitmap** bitmap)
#cfunc global GdipCreateBitmapFromStream "GdipCreateBitmapFromStream" var, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateBitmapFromStreamICM(winmdroot.System.Com.IStream* stream, winmdroot.Graphics.GdiPlus.GpBitmap** bitmap)
#cfunc global GdipCreateBitmapFromStreamICM "GdipCreateBitmapFromStreamICM" var, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateCachedBitmap(winmdroot.Graphics.GdiPlus.GpBitmap* bitmap, winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpCachedBitmap** cachedBitmap)
#cfunc global GdipCreateCachedBitmap "GdipCreateCachedBitmap" intptr, intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateCustomLineCap(winmdroot.Graphics.GdiPlus.GpPath* fillPath, winmdroot.Graphics.GdiPlus.GpPath* strokePath, winmdroot.Graphics.GdiPlus.LineCap baseCap, float baseInset, winmdroot.Graphics.GdiPlus.GpCustomLineCap** customCap)
#cfunc global GdipCreateCustomLineCap "GdipCreateCustomLineCap" intptr, intptr, int, float, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateEffect(global::System.Guid guid, winmdroot.Graphics.GdiPlus.CGpEffect** effect)
#cfunc global GdipCreateEffect "GdipCreateEffect" int, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateFont(winmdroot.Graphics.GdiPlus.GpFontFamily* fontFamily, float emSize, int style, winmdroot.Graphics.GdiPlus.Unit unit, winmdroot.Graphics.GdiPlus.GpFont** font)
#cfunc global GdipCreateFont "GdipCreateFont" intptr, float, int, int, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateFontFamilyFromName(winmdroot.Foundation.PCWSTR name, winmdroot.Graphics.GdiPlus.GpFontCollection* fontCollection, winmdroot.Graphics.GdiPlus.GpFontFamily** fontFamily)
#cfunc global GdipCreateFontFamilyFromName "GdipCreateFontFamilyFromName" wstr, intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateFontFromDC(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.GdiPlus.GpFont** font)
#cfunc global GdipCreateFontFromDC "GdipCreateFontFromDC" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateFontFromLogfontW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.LOGFONTW* logfont, winmdroot.Graphics.GdiPlus.GpFont** font)
#cfunc global GdipCreateFontFromLogfontW "GdipCreateFontFromLogfontW" intptr, var, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateFromHDC(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.GdiPlus.GpGraphics** graphics)
#cfunc global GdipCreateFromHDC "GdipCreateFromHDC" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateFromHDC2(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.HANDLE hDevice, winmdroot.Graphics.GdiPlus.GpGraphics** graphics)
#cfunc global GdipCreateFromHDC2 "GdipCreateFromHDC2" intptr, intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateFromHWND(winmdroot.Foundation.HWND hwnd, winmdroot.Graphics.GdiPlus.GpGraphics** graphics)
#cfunc global GdipCreateFromHWND "GdipCreateFromHWND" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateFromHWNDICM(winmdroot.Foundation.HWND hwnd, winmdroot.Graphics.GdiPlus.GpGraphics** graphics)
#cfunc global GdipCreateFromHWNDICM "GdipCreateFromHWNDICM" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateHBITMAPFromBitmap(winmdroot.Graphics.GdiPlus.GpBitmap* bitmap, winmdroot.Graphics.Gdi.HBITMAP* hbmReturn, uint background)
#cfunc global GdipCreateHBITMAPFromBitmap "GdipCreateHBITMAPFromBitmap" intptr, intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipCreateHICONFromBitmap(winmdroot.Graphics.GdiPlus.GpBitmap* bitmap, winmdroot.UI.WindowsAndMessaging.HICON* hbmReturn)
#cfunc global GdipCreateHICONFromBitmap "GdipCreateHICONFromBitmap" intptr, intptr

; winmdroot.Graphics.Gdi.HPALETTE GdipCreateHalftonePalette()
#cfunc global GdipCreateHalftonePalette "GdipCreateHalftonePalette"

; winmdroot.Graphics.GdiPlus.Status GdipCreateHatchBrush(winmdroot.Graphics.GdiPlus.HatchStyle hatchstyle, uint forecol, uint backcol, winmdroot.Graphics.GdiPlus.GpHatch** brush)
#cfunc global GdipCreateHatchBrush "GdipCreateHatchBrush" int, int, int, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateImageAttributes(winmdroot.Graphics.GdiPlus.GpImageAttributes** imageattr)
#cfunc global GdipCreateImageAttributes "GdipCreateImageAttributes" var

; winmdroot.Graphics.GdiPlus.Status GdipCreateLineBrush(winmdroot.Graphics.GdiPlus.PointF* point1, winmdroot.Graphics.GdiPlus.PointF* point2, uint color1, uint color2, winmdroot.Graphics.GdiPlus.WrapMode wrapMode, winmdroot.Graphics.GdiPlus.GpLineGradient** lineGradient)
#cfunc global GdipCreateLineBrush "GdipCreateLineBrush" var, var, int, int, int, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateLineBrushFromRect(winmdroot.Graphics.GdiPlus.RectF* rect, uint color1, uint color2, winmdroot.Graphics.GdiPlus.LinearGradientMode mode, winmdroot.Graphics.GdiPlus.WrapMode wrapMode, winmdroot.Graphics.GdiPlus.GpLineGradient** lineGradient)
#cfunc global GdipCreateLineBrushFromRect "GdipCreateLineBrushFromRect" var, int, int, int, int, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateLineBrushFromRectI(winmdroot.Graphics.GdiPlus.Rect* rect, uint color1, uint color2, winmdroot.Graphics.GdiPlus.LinearGradientMode mode, winmdroot.Graphics.GdiPlus.WrapMode wrapMode, winmdroot.Graphics.GdiPlus.GpLineGradient** lineGradient)
#cfunc global GdipCreateLineBrushFromRectI "GdipCreateLineBrushFromRectI" var, int, int, int, int, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateLineBrushFromRectWithAngle(winmdroot.Graphics.GdiPlus.RectF* rect, uint color1, uint color2, float angle, winmdroot.Foundation.BOOL isAngleScalable, winmdroot.Graphics.GdiPlus.WrapMode wrapMode, winmdroot.Graphics.GdiPlus.GpLineGradient** lineGradient)
#cfunc global GdipCreateLineBrushFromRectWithAngle "GdipCreateLineBrushFromRectWithAngle" var, int, int, float, int, int, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateLineBrushFromRectWithAngleI(winmdroot.Graphics.GdiPlus.Rect* rect, uint color1, uint color2, float angle, winmdroot.Foundation.BOOL isAngleScalable, winmdroot.Graphics.GdiPlus.WrapMode wrapMode, winmdroot.Graphics.GdiPlus.GpLineGradient** lineGradient)
#cfunc global GdipCreateLineBrushFromRectWithAngleI "GdipCreateLineBrushFromRectWithAngleI" var, int, int, float, int, int, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateLineBrushI(winmdroot.Graphics.GdiPlus.Point* point1, winmdroot.Graphics.GdiPlus.Point* point2, uint color1, uint color2, winmdroot.Graphics.GdiPlus.WrapMode wrapMode, winmdroot.Graphics.GdiPlus.GpLineGradient** lineGradient)
#cfunc global GdipCreateLineBrushI "GdipCreateLineBrushI" var, var, int, int, int, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateMatrix(winmdroot.Graphics.GdiPlus.Matrix** matrix)
#cfunc global GdipCreateMatrix "GdipCreateMatrix" var

; winmdroot.Graphics.GdiPlus.Status GdipCreateMatrix2(float m11, float m12, float m21, float m22, float dx, float dy, winmdroot.Graphics.GdiPlus.Matrix** matrix)
#cfunc global GdipCreateMatrix2 "GdipCreateMatrix2" float, float, float, float, float, float, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateMatrix3(winmdroot.Graphics.GdiPlus.RectF* rect, winmdroot.Graphics.GdiPlus.PointF* dstplg, winmdroot.Graphics.GdiPlus.Matrix** matrix)
#cfunc global GdipCreateMatrix3 "GdipCreateMatrix3" var, var, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateMatrix3I(winmdroot.Graphics.GdiPlus.Rect* rect, winmdroot.Graphics.GdiPlus.Point* dstplg, winmdroot.Graphics.GdiPlus.Matrix** matrix)
#cfunc global GdipCreateMatrix3I "GdipCreateMatrix3I" var, var, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateMetafileFromEmf(winmdroot.Graphics.Gdi.HENHMETAFILE hEmf, winmdroot.Foundation.BOOL deleteEmf, winmdroot.Graphics.GdiPlus.GpMetafile** metafile)
#cfunc global GdipCreateMetafileFromEmf "GdipCreateMetafileFromEmf" intptr, int, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateMetafileFromFile(winmdroot.Foundation.PCWSTR file, winmdroot.Graphics.GdiPlus.GpMetafile** metafile)
#cfunc global GdipCreateMetafileFromFile "GdipCreateMetafileFromFile" wstr, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateMetafileFromStream(winmdroot.System.Com.IStream* stream, winmdroot.Graphics.GdiPlus.GpMetafile** metafile)
#cfunc global GdipCreateMetafileFromStream "GdipCreateMetafileFromStream" var, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateMetafileFromWmf(winmdroot.Graphics.Gdi.HMETAFILE hWmf, winmdroot.Foundation.BOOL deleteWmf, winmdroot.Graphics.GdiPlus.WmfPlaceableFileHeader* wmfPlaceableFileHeader, winmdroot.Graphics.GdiPlus.GpMetafile** metafile)
#cfunc global GdipCreateMetafileFromWmf "GdipCreateMetafileFromWmf" intptr, int, var, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateMetafileFromWmfFile(winmdroot.Foundation.PCWSTR file, winmdroot.Graphics.GdiPlus.WmfPlaceableFileHeader* wmfPlaceableFileHeader, winmdroot.Graphics.GdiPlus.GpMetafile** metafile)
#cfunc global GdipCreateMetafileFromWmfFile "GdipCreateMetafileFromWmfFile" wstr, var, var

; winmdroot.Graphics.GdiPlus.Status GdipCreatePath(winmdroot.Graphics.GdiPlus.FillMode brushMode, winmdroot.Graphics.GdiPlus.GpPath** path)
#cfunc global GdipCreatePath "GdipCreatePath" int, var

; winmdroot.Graphics.GdiPlus.Status GdipCreatePath2(winmdroot.Graphics.GdiPlus.PointF* param0, byte* param1, int param2, winmdroot.Graphics.GdiPlus.FillMode param3, winmdroot.Graphics.GdiPlus.GpPath** path)
#cfunc global GdipCreatePath2 "GdipCreatePath2" var, var, int, int, var

; winmdroot.Graphics.GdiPlus.Status GdipCreatePath2I(winmdroot.Graphics.GdiPlus.Point* param0, byte* param1, int param2, winmdroot.Graphics.GdiPlus.FillMode param3, winmdroot.Graphics.GdiPlus.GpPath** path)
#cfunc global GdipCreatePath2I "GdipCreatePath2I" var, var, int, int, var

; winmdroot.Graphics.GdiPlus.Status GdipCreatePathGradient(winmdroot.Graphics.GdiPlus.PointF* points, int count, winmdroot.Graphics.GdiPlus.WrapMode wrapMode, winmdroot.Graphics.GdiPlus.GpPathGradient** polyGradient)
#cfunc global GdipCreatePathGradient "GdipCreatePathGradient" var, int, int, var

; winmdroot.Graphics.GdiPlus.Status GdipCreatePathGradientFromPath(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.GpPathGradient** polyGradient)
#cfunc global GdipCreatePathGradientFromPath "GdipCreatePathGradientFromPath" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipCreatePathGradientI(winmdroot.Graphics.GdiPlus.Point* points, int count, winmdroot.Graphics.GdiPlus.WrapMode wrapMode, winmdroot.Graphics.GdiPlus.GpPathGradient** polyGradient)
#cfunc global GdipCreatePathGradientI "GdipCreatePathGradientI" var, int, int, var

; winmdroot.Graphics.GdiPlus.Status GdipCreatePathIter(winmdroot.Graphics.GdiPlus.GpPathIterator** iterator, winmdroot.Graphics.GdiPlus.GpPath* path)
#cfunc global GdipCreatePathIter "GdipCreatePathIter" var, intptr

; winmdroot.Graphics.GdiPlus.Status GdipCreatePen1(uint color, float width, winmdroot.Graphics.GdiPlus.Unit unit, winmdroot.Graphics.GdiPlus.GpPen** pen)
#cfunc global GdipCreatePen1 "GdipCreatePen1" int, float, int, var

; winmdroot.Graphics.GdiPlus.Status GdipCreatePen2(winmdroot.Graphics.GdiPlus.GpBrush* brush, float width, winmdroot.Graphics.GdiPlus.Unit unit, winmdroot.Graphics.GdiPlus.GpPen** pen)
#cfunc global GdipCreatePen2 "GdipCreatePen2" intptr, float, int, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateRegion(winmdroot.Graphics.GdiPlus.GpRegion** region)
#cfunc global GdipCreateRegion "GdipCreateRegion" var

; winmdroot.Graphics.GdiPlus.Status GdipCreateRegionHrgn(winmdroot.Graphics.Gdi.HRGN hRgn, winmdroot.Graphics.GdiPlus.GpRegion** region)
#cfunc global GdipCreateRegionHrgn "GdipCreateRegionHrgn" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateRegionPath(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.GpRegion** region)
#cfunc global GdipCreateRegionPath "GdipCreateRegionPath" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateRegionRect(winmdroot.Graphics.GdiPlus.RectF* rect, winmdroot.Graphics.GdiPlus.GpRegion** region)
#cfunc global GdipCreateRegionRect "GdipCreateRegionRect" var, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateRegionRectI(winmdroot.Graphics.GdiPlus.Rect* rect, winmdroot.Graphics.GdiPlus.GpRegion** region)
#cfunc global GdipCreateRegionRectI "GdipCreateRegionRectI" var, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateRegionRgnData(byte* regionData, int size, winmdroot.Graphics.GdiPlus.GpRegion** region)
#cfunc global GdipCreateRegionRgnData "GdipCreateRegionRgnData" var, int, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateSolidFill(uint color, winmdroot.Graphics.GdiPlus.GpSolidFill** brush)
#cfunc global GdipCreateSolidFill "GdipCreateSolidFill" int, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateStreamOnFile(winmdroot.Foundation.PCWSTR filename, uint access, winmdroot.System.Com.IStream** stream)
#cfunc global GdipCreateStreamOnFile "GdipCreateStreamOnFile" wstr, int, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateStringFormat(int formatAttributes, ushort language, winmdroot.Graphics.GdiPlus.GpStringFormat** format)
#cfunc global GdipCreateStringFormat "GdipCreateStringFormat" int, int, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateTexture(winmdroot.Graphics.GdiPlus.GpImage* image, winmdroot.Graphics.GdiPlus.WrapMode wrapmode, winmdroot.Graphics.GdiPlus.GpTexture** texture)
#cfunc global GdipCreateTexture "GdipCreateTexture" intptr, int, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateTexture2(winmdroot.Graphics.GdiPlus.GpImage* image, winmdroot.Graphics.GdiPlus.WrapMode wrapmode, float x, float y, float width, float height, winmdroot.Graphics.GdiPlus.GpTexture** texture)
#cfunc global GdipCreateTexture2 "GdipCreateTexture2" intptr, int, float, float, float, float, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateTexture2I(winmdroot.Graphics.GdiPlus.GpImage* image, winmdroot.Graphics.GdiPlus.WrapMode wrapmode, int x, int y, int width, int height, winmdroot.Graphics.GdiPlus.GpTexture** texture)
#cfunc global GdipCreateTexture2I "GdipCreateTexture2I" intptr, int, int, int, int, int, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateTextureIA(winmdroot.Graphics.GdiPlus.GpImage* image, winmdroot.Graphics.GdiPlus.GpImageAttributes* imageAttributes, float x, float y, float width, float height, winmdroot.Graphics.GdiPlus.GpTexture** texture)
#cfunc global GdipCreateTextureIA "GdipCreateTextureIA" intptr, intptr, float, float, float, float, var

; winmdroot.Graphics.GdiPlus.Status GdipCreateTextureIAI(winmdroot.Graphics.GdiPlus.GpImage* image, winmdroot.Graphics.GdiPlus.GpImageAttributes* imageAttributes, int x, int y, int width, int height, winmdroot.Graphics.GdiPlus.GpTexture** texture)
#cfunc global GdipCreateTextureIAI "GdipCreateTextureIAI" intptr, intptr, int, int, int, int, var

; winmdroot.Graphics.GdiPlus.Status GdipDeleteBrush(winmdroot.Graphics.GdiPlus.GpBrush* brush)
#cfunc global GdipDeleteBrush "GdipDeleteBrush" intptr

; winmdroot.Graphics.GdiPlus.Status GdipDeleteCachedBitmap(winmdroot.Graphics.GdiPlus.GpCachedBitmap* cachedBitmap)
#cfunc global GdipDeleteCachedBitmap "GdipDeleteCachedBitmap" intptr

; winmdroot.Graphics.GdiPlus.Status GdipDeleteCustomLineCap(winmdroot.Graphics.GdiPlus.GpCustomLineCap* customCap)
#cfunc global GdipDeleteCustomLineCap "GdipDeleteCustomLineCap" intptr

; winmdroot.Graphics.GdiPlus.Status GdipDeleteEffect(winmdroot.Graphics.GdiPlus.CGpEffect* effect)
#cfunc global GdipDeleteEffect "GdipDeleteEffect" intptr

; winmdroot.Graphics.GdiPlus.Status GdipDeleteFont(winmdroot.Graphics.GdiPlus.GpFont* font)
#cfunc global GdipDeleteFont "GdipDeleteFont" intptr

; winmdroot.Graphics.GdiPlus.Status GdipDeleteFontFamily(winmdroot.Graphics.GdiPlus.GpFontFamily* fontFamily)
#cfunc global GdipDeleteFontFamily "GdipDeleteFontFamily" intptr

; winmdroot.Graphics.GdiPlus.Status GdipDeleteGraphics(winmdroot.Graphics.GdiPlus.GpGraphics* graphics)
#cfunc global GdipDeleteGraphics "GdipDeleteGraphics" intptr

; winmdroot.Graphics.GdiPlus.Status GdipDeleteMatrix(winmdroot.Graphics.GdiPlus.Matrix* matrix)
#cfunc global GdipDeleteMatrix "GdipDeleteMatrix" intptr

; winmdroot.Graphics.GdiPlus.Status GdipDeletePath(winmdroot.Graphics.GdiPlus.GpPath* path)
#cfunc global GdipDeletePath "GdipDeletePath" intptr

; winmdroot.Graphics.GdiPlus.Status GdipDeletePathIter(winmdroot.Graphics.GdiPlus.GpPathIterator* iterator)
#cfunc global GdipDeletePathIter "GdipDeletePathIter" intptr

; winmdroot.Graphics.GdiPlus.Status GdipDeletePen(winmdroot.Graphics.GdiPlus.GpPen* pen)
#cfunc global GdipDeletePen "GdipDeletePen" intptr

; winmdroot.Graphics.GdiPlus.Status GdipDeletePrivateFontCollection(winmdroot.Graphics.GdiPlus.GpFontCollection** fontCollection)
#cfunc global GdipDeletePrivateFontCollection "GdipDeletePrivateFontCollection" var

; winmdroot.Graphics.GdiPlus.Status GdipDeleteRegion(winmdroot.Graphics.GdiPlus.GpRegion* region)
#cfunc global GdipDeleteRegion "GdipDeleteRegion" intptr

; winmdroot.Graphics.GdiPlus.Status GdipDeleteStringFormat(winmdroot.Graphics.GdiPlus.GpStringFormat* format)
#cfunc global GdipDeleteStringFormat "GdipDeleteStringFormat" intptr

; winmdroot.Graphics.GdiPlus.Status GdipDisposeImage(winmdroot.Graphics.GdiPlus.GpImage* image)
#cfunc global GdipDisposeImage "GdipDisposeImage" intptr

; winmdroot.Graphics.GdiPlus.Status GdipDisposeImageAttributes(winmdroot.Graphics.GdiPlus.GpImageAttributes* imageattr)
#cfunc global GdipDisposeImageAttributes "GdipDisposeImageAttributes" intptr

; winmdroot.Graphics.GdiPlus.Status GdipDrawArc(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, float x, float y, float width, float height, float startAngle, float sweepAngle)
#cfunc global GdipDrawArc "GdipDrawArc" intptr, intptr, float, float, float, float, float, float

; winmdroot.Graphics.GdiPlus.Status GdipDrawArcI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, int x, int y, int width, int height, float startAngle, float sweepAngle)
#cfunc global GdipDrawArcI "GdipDrawArcI" intptr, intptr, int, int, int, int, float, float

; winmdroot.Graphics.GdiPlus.Status GdipDrawBezier(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4)
#cfunc global GdipDrawBezier "GdipDrawBezier" intptr, intptr, float, float, float, float, float, float, float, float

; winmdroot.Graphics.GdiPlus.Status GdipDrawBezierI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4)
#cfunc global GdipDrawBezierI "GdipDrawBezierI" intptr, intptr, int, int, int, int, int, int, int, int

; winmdroot.Graphics.GdiPlus.Status GdipDrawBeziers(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.PointF* points, int count)
#cfunc global GdipDrawBeziers "GdipDrawBeziers" intptr, intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipDrawBeziersI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.Point* points, int count)
#cfunc global GdipDrawBeziersI "GdipDrawBeziersI" intptr, intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipDrawCachedBitmap(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpCachedBitmap* cachedBitmap, int x, int y)
#cfunc global GdipDrawCachedBitmap "GdipDrawCachedBitmap" intptr, intptr, int, int

; winmdroot.Graphics.GdiPlus.Status GdipDrawClosedCurve(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.PointF* points, int count)
#cfunc global GdipDrawClosedCurve "GdipDrawClosedCurve" intptr, intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipDrawClosedCurve2(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.PointF* points, int count, float tension)
#cfunc global GdipDrawClosedCurve2 "GdipDrawClosedCurve2" intptr, intptr, var, int, float

; winmdroot.Graphics.GdiPlus.Status GdipDrawClosedCurve2I(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.Point* points, int count, float tension)
#cfunc global GdipDrawClosedCurve2I "GdipDrawClosedCurve2I" intptr, intptr, var, int, float

; winmdroot.Graphics.GdiPlus.Status GdipDrawClosedCurveI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.Point* points, int count)
#cfunc global GdipDrawClosedCurveI "GdipDrawClosedCurveI" intptr, intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipDrawCurve(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.PointF* points, int count)
#cfunc global GdipDrawCurve "GdipDrawCurve" intptr, intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipDrawCurve2(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.PointF* points, int count, float tension)
#cfunc global GdipDrawCurve2 "GdipDrawCurve2" intptr, intptr, var, int, float

; winmdroot.Graphics.GdiPlus.Status GdipDrawCurve2I(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.Point* points, int count, float tension)
#cfunc global GdipDrawCurve2I "GdipDrawCurve2I" intptr, intptr, var, int, float

; winmdroot.Graphics.GdiPlus.Status GdipDrawCurve3(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.PointF* points, int count, int offset, int numberOfSegments, float tension)
#cfunc global GdipDrawCurve3 "GdipDrawCurve3" intptr, intptr, var, int, int, int, float

; winmdroot.Graphics.GdiPlus.Status GdipDrawCurve3I(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.Point* points, int count, int offset, int numberOfSegments, float tension)
#cfunc global GdipDrawCurve3I "GdipDrawCurve3I" intptr, intptr, var, int, int, int, float

; winmdroot.Graphics.GdiPlus.Status GdipDrawCurveI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.Point* points, int count)
#cfunc global GdipDrawCurveI "GdipDrawCurveI" intptr, intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipDrawDriverString(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, ushort* text, int length, winmdroot.Graphics.GdiPlus.GpFont* font, winmdroot.Graphics.GdiPlus.GpBrush* brush, winmdroot.Graphics.GdiPlus.PointF* positions, int flags, winmdroot.Graphics.GdiPlus.Matrix* matrix)
#cfunc global GdipDrawDriverString "GdipDrawDriverString" intptr, var, int, intptr, intptr, var, int, intptr

; winmdroot.Graphics.GdiPlus.Status GdipDrawEllipse(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, float x, float y, float width, float height)
#cfunc global GdipDrawEllipse "GdipDrawEllipse" intptr, intptr, float, float, float, float

; winmdroot.Graphics.GdiPlus.Status GdipDrawEllipseI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, int x, int y, int width, int height)
#cfunc global GdipDrawEllipseI "GdipDrawEllipseI" intptr, intptr, int, int, int, int

; winmdroot.Graphics.GdiPlus.Status GdipDrawImage(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpImage* image, float x, float y)
#cfunc global GdipDrawImage "GdipDrawImage" intptr, intptr, float, float

; winmdroot.Graphics.GdiPlus.Status GdipDrawImageFX(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpImage* image, winmdroot.Graphics.GdiPlus.RectF* source, winmdroot.Graphics.GdiPlus.Matrix* xForm, winmdroot.Graphics.GdiPlus.CGpEffect* effect, winmdroot.Graphics.GdiPlus.GpImageAttributes* imageAttributes, winmdroot.Graphics.GdiPlus.Unit srcUnit)
#cfunc global GdipDrawImageFX "GdipDrawImageFX" intptr, intptr, var, intptr, intptr, intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipDrawImageI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpImage* image, int x, int y)
#cfunc global GdipDrawImageI "GdipDrawImageI" intptr, intptr, int, int

; winmdroot.Graphics.GdiPlus.Status GdipDrawImagePointRect(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpImage* image, float x, float y, float srcx, float srcy, float srcwidth, float srcheight, winmdroot.Graphics.GdiPlus.Unit srcUnit)
#cfunc global GdipDrawImagePointRect "GdipDrawImagePointRect" intptr, intptr, float, float, float, float, float, float, int

; winmdroot.Graphics.GdiPlus.Status GdipDrawImagePointRectI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpImage* image, int x, int y, int srcx, int srcy, int srcwidth, int srcheight, winmdroot.Graphics.GdiPlus.Unit srcUnit)
#cfunc global GdipDrawImagePointRectI "GdipDrawImagePointRectI" intptr, intptr, int, int, int, int, int, int, int

; winmdroot.Graphics.GdiPlus.Status GdipDrawImagePoints(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpImage* image, winmdroot.Graphics.GdiPlus.PointF* dstpoints, int count)
#cfunc global GdipDrawImagePoints "GdipDrawImagePoints" intptr, intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipDrawImagePointsI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpImage* image, winmdroot.Graphics.GdiPlus.Point* dstpoints, int count)
#cfunc global GdipDrawImagePointsI "GdipDrawImagePointsI" intptr, intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipDrawImagePointsRect(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpImage* image, winmdroot.Graphics.GdiPlus.PointF* points, int count, float srcx, float srcy, float srcwidth, float srcheight, winmdroot.Graphics.GdiPlus.Unit srcUnit, winmdroot.Graphics.GdiPlus.GpImageAttributes* imageAttributes, nint callback, void* callbackData)
#cfunc global GdipDrawImagePointsRect "GdipDrawImagePointsRect" intptr, intptr, var, int, float, float, float, float, int, intptr, int, intptr

; winmdroot.Graphics.GdiPlus.Status GdipDrawImagePointsRectI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpImage* image, winmdroot.Graphics.GdiPlus.Point* points, int count, int srcx, int srcy, int srcwidth, int srcheight, winmdroot.Graphics.GdiPlus.Unit srcUnit, winmdroot.Graphics.GdiPlus.GpImageAttributes* imageAttributes, nint callback, void* callbackData)
#cfunc global GdipDrawImagePointsRectI "GdipDrawImagePointsRectI" intptr, intptr, var, int, int, int, int, int, int, intptr, int, intptr

; winmdroot.Graphics.GdiPlus.Status GdipDrawImageRect(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpImage* image, float x, float y, float width, float height)
#cfunc global GdipDrawImageRect "GdipDrawImageRect" intptr, intptr, float, float, float, float

; winmdroot.Graphics.GdiPlus.Status GdipDrawImageRectI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpImage* image, int x, int y, int width, int height)
#cfunc global GdipDrawImageRectI "GdipDrawImageRectI" intptr, intptr, int, int, int, int

; winmdroot.Graphics.GdiPlus.Status GdipDrawImageRectRect(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpImage* image, float dstx, float dsty, float dstwidth, float dstheight, float srcx, float srcy, float srcwidth, float srcheight, winmdroot.Graphics.GdiPlus.Unit srcUnit, winmdroot.Graphics.GdiPlus.GpImageAttributes* imageAttributes, nint callback, void* callbackData)
#cfunc global GdipDrawImageRectRect "GdipDrawImageRectRect" intptr, intptr, float, float, float, float, float, float, float, float, int, intptr, int, intptr

; winmdroot.Graphics.GdiPlus.Status GdipDrawImageRectRectI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpImage* image, int dstx, int dsty, int dstwidth, int dstheight, int srcx, int srcy, int srcwidth, int srcheight, winmdroot.Graphics.GdiPlus.Unit srcUnit, winmdroot.Graphics.GdiPlus.GpImageAttributes* imageAttributes, nint callback, void* callbackData)
#cfunc global GdipDrawImageRectRectI "GdipDrawImageRectRectI" intptr, intptr, int, int, int, int, int, int, int, int, int, intptr, int, intptr

; winmdroot.Graphics.GdiPlus.Status GdipDrawLine(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, float x1, float y1, float x2, float y2)
#cfunc global GdipDrawLine "GdipDrawLine" intptr, intptr, float, float, float, float

; winmdroot.Graphics.GdiPlus.Status GdipDrawLineI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, int x1, int y1, int x2, int y2)
#cfunc global GdipDrawLineI "GdipDrawLineI" intptr, intptr, int, int, int, int

; winmdroot.Graphics.GdiPlus.Status GdipDrawLines(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.PointF* points, int count)
#cfunc global GdipDrawLines "GdipDrawLines" intptr, intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipDrawLinesI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.Point* points, int count)
#cfunc global GdipDrawLinesI "GdipDrawLinesI" intptr, intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipDrawPath(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.GpPath* path)
#cfunc global GdipDrawPath "GdipDrawPath" intptr, intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipDrawPie(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, float x, float y, float width, float height, float startAngle, float sweepAngle)
#cfunc global GdipDrawPie "GdipDrawPie" intptr, intptr, float, float, float, float, float, float

; winmdroot.Graphics.GdiPlus.Status GdipDrawPieI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, int x, int y, int width, int height, float startAngle, float sweepAngle)
#cfunc global GdipDrawPieI "GdipDrawPieI" intptr, intptr, int, int, int, int, float, float

; winmdroot.Graphics.GdiPlus.Status GdipDrawPolygon(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.PointF* points, int count)
#cfunc global GdipDrawPolygon "GdipDrawPolygon" intptr, intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipDrawPolygonI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.Point* points, int count)
#cfunc global GdipDrawPolygonI "GdipDrawPolygonI" intptr, intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipDrawRectangle(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, float x, float y, float width, float height)
#cfunc global GdipDrawRectangle "GdipDrawRectangle" intptr, intptr, float, float, float, float

; winmdroot.Graphics.GdiPlus.Status GdipDrawRectangleI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, int x, int y, int width, int height)
#cfunc global GdipDrawRectangleI "GdipDrawRectangleI" intptr, intptr, int, int, int, int

; winmdroot.Graphics.GdiPlus.Status GdipDrawRectangles(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.RectF* rects, int count)
#cfunc global GdipDrawRectangles "GdipDrawRectangles" intptr, intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipDrawRectanglesI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.Rect* rects, int count)
#cfunc global GdipDrawRectanglesI "GdipDrawRectanglesI" intptr, intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipDrawString(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Foundation.PCWSTR @string, int length, winmdroot.Graphics.GdiPlus.GpFont* font, winmdroot.Graphics.GdiPlus.RectF* layoutRect, winmdroot.Graphics.GdiPlus.GpStringFormat* stringFormat, winmdroot.Graphics.GdiPlus.GpBrush* brush)
#cfunc global GdipDrawString "GdipDrawString" intptr, int, int, intptr, var, intptr, intptr

; uint GdipEmfToWmfBits(winmdroot.Graphics.Gdi.HENHMETAFILE hemf, uint cbData16, [Optional] byte* pData16, int iMapMode, int eFlags)
#cfunc global GdipEmfToWmfBits "GdipEmfToWmfBits" intptr, int, var, int, int

; winmdroot.Graphics.GdiPlus.Status GdipEndContainer(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, uint state)
#cfunc global GdipEndContainer "GdipEndContainer" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipEnumerateMetafileDestPoint(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpMetafile* metafile, winmdroot.Graphics.GdiPlus.PointF* destPoint, nint callback, void* callbackData, winmdroot.Graphics.GdiPlus.GpImageAttributes* imageAttributes)
#cfunc global GdipEnumerateMetafileDestPoint "GdipEnumerateMetafileDestPoint" intptr, intptr, var, int, intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipEnumerateMetafileDestPointI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpMetafile* metafile, winmdroot.Graphics.GdiPlus.Point* destPoint, nint callback, void* callbackData, winmdroot.Graphics.GdiPlus.GpImageAttributes* imageAttributes)
#cfunc global GdipEnumerateMetafileDestPointI "GdipEnumerateMetafileDestPointI" intptr, intptr, var, int, intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipEnumerateMetafileDestPoints(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpMetafile* metafile, winmdroot.Graphics.GdiPlus.PointF* destPoints, int count, nint callback, void* callbackData, winmdroot.Graphics.GdiPlus.GpImageAttributes* imageAttributes)
#cfunc global GdipEnumerateMetafileDestPoints "GdipEnumerateMetafileDestPoints" intptr, intptr, var, int, int, intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipEnumerateMetafileDestPointsI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpMetafile* metafile, winmdroot.Graphics.GdiPlus.Point* destPoints, int count, nint callback, void* callbackData, winmdroot.Graphics.GdiPlus.GpImageAttributes* imageAttributes)
#cfunc global GdipEnumerateMetafileDestPointsI "GdipEnumerateMetafileDestPointsI" intptr, intptr, var, int, int, intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipEnumerateMetafileDestRect(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpMetafile* metafile, winmdroot.Graphics.GdiPlus.RectF* destRect, nint callback, void* callbackData, winmdroot.Graphics.GdiPlus.GpImageAttributes* imageAttributes)
#cfunc global GdipEnumerateMetafileDestRect "GdipEnumerateMetafileDestRect" intptr, intptr, var, int, intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipEnumerateMetafileDestRectI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpMetafile* metafile, winmdroot.Graphics.GdiPlus.Rect* destRect, nint callback, void* callbackData, winmdroot.Graphics.GdiPlus.GpImageAttributes* imageAttributes)
#cfunc global GdipEnumerateMetafileDestRectI "GdipEnumerateMetafileDestRectI" intptr, intptr, var, int, intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipEnumerateMetafileSrcRectDestPoint(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpMetafile* metafile, winmdroot.Graphics.GdiPlus.PointF* destPoint, winmdroot.Graphics.GdiPlus.RectF* srcRect, winmdroot.Graphics.GdiPlus.Unit srcUnit, nint callback, void* callbackData, winmdroot.Graphics.GdiPlus.GpImageAttributes* imageAttributes)
#cfunc global GdipEnumerateMetafileSrcRectDestPoint "GdipEnumerateMetafileSrcRectDestPoint" intptr, intptr, var, var, int, int, intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipEnumerateMetafileSrcRectDestPointI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpMetafile* metafile, winmdroot.Graphics.GdiPlus.Point* destPoint, winmdroot.Graphics.GdiPlus.Rect* srcRect, winmdroot.Graphics.GdiPlus.Unit srcUnit, nint callback, void* callbackData, winmdroot.Graphics.GdiPlus.GpImageAttributes* imageAttributes)
#cfunc global GdipEnumerateMetafileSrcRectDestPointI "GdipEnumerateMetafileSrcRectDestPointI" intptr, intptr, var, var, int, int, intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipEnumerateMetafileSrcRectDestPoints(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpMetafile* metafile, winmdroot.Graphics.GdiPlus.PointF* destPoints, int count, winmdroot.Graphics.GdiPlus.RectF* srcRect, winmdroot.Graphics.GdiPlus.Unit srcUnit, nint callback, void* callbackData, winmdroot.Graphics.GdiPlus.GpImageAttributes* imageAttributes)
#cfunc global GdipEnumerateMetafileSrcRectDestPoints "GdipEnumerateMetafileSrcRectDestPoints" intptr, intptr, var, int, var, int, int, intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipEnumerateMetafileSrcRectDestPointsI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpMetafile* metafile, winmdroot.Graphics.GdiPlus.Point* destPoints, int count, winmdroot.Graphics.GdiPlus.Rect* srcRect, winmdroot.Graphics.GdiPlus.Unit srcUnit, nint callback, void* callbackData, winmdroot.Graphics.GdiPlus.GpImageAttributes* imageAttributes)
#cfunc global GdipEnumerateMetafileSrcRectDestPointsI "GdipEnumerateMetafileSrcRectDestPointsI" intptr, intptr, var, int, var, int, int, intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipEnumerateMetafileSrcRectDestRect(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpMetafile* metafile, winmdroot.Graphics.GdiPlus.RectF* destRect, winmdroot.Graphics.GdiPlus.RectF* srcRect, winmdroot.Graphics.GdiPlus.Unit srcUnit, nint callback, void* callbackData, winmdroot.Graphics.GdiPlus.GpImageAttributes* imageAttributes)
#cfunc global GdipEnumerateMetafileSrcRectDestRect "GdipEnumerateMetafileSrcRectDestRect" intptr, intptr, var, var, int, int, intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipEnumerateMetafileSrcRectDestRectI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpMetafile* metafile, winmdroot.Graphics.GdiPlus.Rect* destRect, winmdroot.Graphics.GdiPlus.Rect* srcRect, winmdroot.Graphics.GdiPlus.Unit srcUnit, nint callback, void* callbackData, winmdroot.Graphics.GdiPlus.GpImageAttributes* imageAttributes)
#cfunc global GdipEnumerateMetafileSrcRectDestRectI "GdipEnumerateMetafileSrcRectDestRectI" intptr, intptr, var, var, int, int, intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipFillClosedCurve(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpBrush* brush, winmdroot.Graphics.GdiPlus.PointF* points, int count)
#cfunc global GdipFillClosedCurve "GdipFillClosedCurve" intptr, intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipFillClosedCurve2(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpBrush* brush, winmdroot.Graphics.GdiPlus.PointF* points, int count, float tension, winmdroot.Graphics.GdiPlus.FillMode fillMode)
#cfunc global GdipFillClosedCurve2 "GdipFillClosedCurve2" intptr, intptr, var, int, float, int

; winmdroot.Graphics.GdiPlus.Status GdipFillClosedCurve2I(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpBrush* brush, winmdroot.Graphics.GdiPlus.Point* points, int count, float tension, winmdroot.Graphics.GdiPlus.FillMode fillMode)
#cfunc global GdipFillClosedCurve2I "GdipFillClosedCurve2I" intptr, intptr, var, int, float, int

; winmdroot.Graphics.GdiPlus.Status GdipFillClosedCurveI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpBrush* brush, winmdroot.Graphics.GdiPlus.Point* points, int count)
#cfunc global GdipFillClosedCurveI "GdipFillClosedCurveI" intptr, intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipFillEllipse(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpBrush* brush, float x, float y, float width, float height)
#cfunc global GdipFillEllipse "GdipFillEllipse" intptr, intptr, float, float, float, float

; winmdroot.Graphics.GdiPlus.Status GdipFillEllipseI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpBrush* brush, int x, int y, int width, int height)
#cfunc global GdipFillEllipseI "GdipFillEllipseI" intptr, intptr, int, int, int, int

; winmdroot.Graphics.GdiPlus.Status GdipFillPath(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpBrush* brush, winmdroot.Graphics.GdiPlus.GpPath* path)
#cfunc global GdipFillPath "GdipFillPath" intptr, intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipFillPie(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpBrush* brush, float x, float y, float width, float height, float startAngle, float sweepAngle)
#cfunc global GdipFillPie "GdipFillPie" intptr, intptr, float, float, float, float, float, float

; winmdroot.Graphics.GdiPlus.Status GdipFillPieI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpBrush* brush, int x, int y, int width, int height, float startAngle, float sweepAngle)
#cfunc global GdipFillPieI "GdipFillPieI" intptr, intptr, int, int, int, int, float, float

; winmdroot.Graphics.GdiPlus.Status GdipFillPolygon(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpBrush* brush, winmdroot.Graphics.GdiPlus.PointF* points, int count, winmdroot.Graphics.GdiPlus.FillMode fillMode)
#cfunc global GdipFillPolygon "GdipFillPolygon" intptr, intptr, var, int, int

; winmdroot.Graphics.GdiPlus.Status GdipFillPolygon2(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpBrush* brush, winmdroot.Graphics.GdiPlus.PointF* points, int count)
#cfunc global GdipFillPolygon2 "GdipFillPolygon2" intptr, intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipFillPolygon2I(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpBrush* brush, winmdroot.Graphics.GdiPlus.Point* points, int count)
#cfunc global GdipFillPolygon2I "GdipFillPolygon2I" intptr, intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipFillPolygonI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpBrush* brush, winmdroot.Graphics.GdiPlus.Point* points, int count, winmdroot.Graphics.GdiPlus.FillMode fillMode)
#cfunc global GdipFillPolygonI "GdipFillPolygonI" intptr, intptr, var, int, int

; winmdroot.Graphics.GdiPlus.Status GdipFillRectangle(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpBrush* brush, float x, float y, float width, float height)
#cfunc global GdipFillRectangle "GdipFillRectangle" intptr, intptr, float, float, float, float

; winmdroot.Graphics.GdiPlus.Status GdipFillRectangleI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpBrush* brush, int x, int y, int width, int height)
#cfunc global GdipFillRectangleI "GdipFillRectangleI" intptr, intptr, int, int, int, int

; winmdroot.Graphics.GdiPlus.Status GdipFillRectangles(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpBrush* brush, winmdroot.Graphics.GdiPlus.RectF* rects, int count)
#cfunc global GdipFillRectangles "GdipFillRectangles" intptr, intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipFillRectanglesI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpBrush* brush, winmdroot.Graphics.GdiPlus.Rect* rects, int count)
#cfunc global GdipFillRectanglesI "GdipFillRectanglesI" intptr, intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipFillRegion(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpBrush* brush, winmdroot.Graphics.GdiPlus.GpRegion* region)
#cfunc global GdipFillRegion "GdipFillRegion" intptr, intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipFindFirstImageItem(winmdroot.Graphics.GdiPlus.GpImage* image, winmdroot.Graphics.GdiPlus.ImageItemData* item)
#cfunc global GdipFindFirstImageItem "GdipFindFirstImageItem" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipFindNextImageItem(winmdroot.Graphics.GdiPlus.GpImage* image, winmdroot.Graphics.GdiPlus.ImageItemData* item)
#cfunc global GdipFindNextImageItem "GdipFindNextImageItem" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipFlattenPath(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.Matrix* matrix, float flatness)
#cfunc global GdipFlattenPath "GdipFlattenPath" intptr, intptr, float

; winmdroot.Graphics.GdiPlus.Status GdipFlush(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.FlushIntention intention)
#cfunc global GdipFlush "GdipFlush" intptr, int

; void GdipFree(void* ptr)
#func global GdipFree "GdipFree" intptr

; winmdroot.Graphics.GdiPlus.Status GdipGetAdjustableArrowCapFillState(winmdroot.Graphics.GdiPlus.GpAdjustableArrowCap* cap, winmdroot.Foundation.BOOL* fillState)
#cfunc global GdipGetAdjustableArrowCapFillState "GdipGetAdjustableArrowCapFillState" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetAdjustableArrowCapHeight(winmdroot.Graphics.GdiPlus.GpAdjustableArrowCap* cap, float* height)
#cfunc global GdipGetAdjustableArrowCapHeight "GdipGetAdjustableArrowCapHeight" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetAdjustableArrowCapMiddleInset(winmdroot.Graphics.GdiPlus.GpAdjustableArrowCap* cap, float* middleInset)
#cfunc global GdipGetAdjustableArrowCapMiddleInset "GdipGetAdjustableArrowCapMiddleInset" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetAdjustableArrowCapWidth(winmdroot.Graphics.GdiPlus.GpAdjustableArrowCap* cap, float* width)
#cfunc global GdipGetAdjustableArrowCapWidth "GdipGetAdjustableArrowCapWidth" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetAllPropertyItems(winmdroot.Graphics.GdiPlus.GpImage* image, uint totalBufferSize, uint numProperties, winmdroot.Graphics.GdiPlus.PropertyItem* allItems)
#cfunc global GdipGetAllPropertyItems "GdipGetAllPropertyItems" intptr, int, int, var

; winmdroot.Graphics.GdiPlus.Status GdipGetBrushType(winmdroot.Graphics.GdiPlus.GpBrush* brush, winmdroot.Graphics.GdiPlus.BrushType* type)
#cfunc global GdipGetBrushType "GdipGetBrushType" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetCellAscent(winmdroot.Graphics.GdiPlus.GpFontFamily* family, int style, ushort* CellAscent)
#cfunc global GdipGetCellAscent "GdipGetCellAscent" intptr, int, var

; winmdroot.Graphics.GdiPlus.Status GdipGetCellDescent(winmdroot.Graphics.GdiPlus.GpFontFamily* family, int style, ushort* CellDescent)
#cfunc global GdipGetCellDescent "GdipGetCellDescent" intptr, int, var

; winmdroot.Graphics.GdiPlus.Status GdipGetClip(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpRegion* region)
#cfunc global GdipGetClip "GdipGetClip" intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipGetClipBounds(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.RectF* rect)
#cfunc global GdipGetClipBounds "GdipGetClipBounds" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetClipBoundsI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.Rect* rect)
#cfunc global GdipGetClipBoundsI "GdipGetClipBoundsI" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetCompositingMode(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.CompositingMode* compositingMode)
#cfunc global GdipGetCompositingMode "GdipGetCompositingMode" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetCompositingQuality(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.CompositingQuality* compositingQuality)
#cfunc global GdipGetCompositingQuality "GdipGetCompositingQuality" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetCustomLineCapBaseCap(winmdroot.Graphics.GdiPlus.GpCustomLineCap* customCap, winmdroot.Graphics.GdiPlus.LineCap* baseCap)
#cfunc global GdipGetCustomLineCapBaseCap "GdipGetCustomLineCapBaseCap" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetCustomLineCapBaseInset(winmdroot.Graphics.GdiPlus.GpCustomLineCap* customCap, float* inset)
#cfunc global GdipGetCustomLineCapBaseInset "GdipGetCustomLineCapBaseInset" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetCustomLineCapStrokeCaps(winmdroot.Graphics.GdiPlus.GpCustomLineCap* customCap, winmdroot.Graphics.GdiPlus.LineCap* startCap, winmdroot.Graphics.GdiPlus.LineCap* endCap)
#cfunc global GdipGetCustomLineCapStrokeCaps "GdipGetCustomLineCapStrokeCaps" intptr, var, var

; winmdroot.Graphics.GdiPlus.Status GdipGetCustomLineCapStrokeJoin(winmdroot.Graphics.GdiPlus.GpCustomLineCap* customCap, winmdroot.Graphics.GdiPlus.LineJoin* lineJoin)
#cfunc global GdipGetCustomLineCapStrokeJoin "GdipGetCustomLineCapStrokeJoin" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetCustomLineCapType(winmdroot.Graphics.GdiPlus.GpCustomLineCap* customCap, winmdroot.Graphics.GdiPlus.CustomLineCapType* capType)
#cfunc global GdipGetCustomLineCapType "GdipGetCustomLineCapType" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetCustomLineCapWidthScale(winmdroot.Graphics.GdiPlus.GpCustomLineCap* customCap, float* widthScale)
#cfunc global GdipGetCustomLineCapWidthScale "GdipGetCustomLineCapWidthScale" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetDC(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.Gdi.HDC* hdc)
#cfunc global GdipGetDC "GdipGetDC" intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipGetDpiX(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, float* dpi)
#cfunc global GdipGetDpiX "GdipGetDpiX" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetDpiY(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, float* dpi)
#cfunc global GdipGetDpiY "GdipGetDpiY" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetEffectParameterSize(winmdroot.Graphics.GdiPlus.CGpEffect* effect, uint* size)
#cfunc global GdipGetEffectParameterSize "GdipGetEffectParameterSize" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetEffectParameters(winmdroot.Graphics.GdiPlus.CGpEffect* effect, uint* size, void* @params)
#cfunc global GdipGetEffectParameters "GdipGetEffectParameters" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipGetEmHeight(winmdroot.Graphics.GdiPlus.GpFontFamily* family, int style, ushort* EmHeight)
#cfunc global GdipGetEmHeight "GdipGetEmHeight" intptr, int, var

; winmdroot.Graphics.GdiPlus.Status GdipGetEncoderParameterList(winmdroot.Graphics.GdiPlus.GpImage* image, global::System.Guid* clsidEncoder, uint size, winmdroot.Graphics.GdiPlus.EncoderParameters* buffer)
#cfunc global GdipGetEncoderParameterList "GdipGetEncoderParameterList" intptr, var, int, var

; winmdroot.Graphics.GdiPlus.Status GdipGetEncoderParameterListSize(winmdroot.Graphics.GdiPlus.GpImage* image, global::System.Guid* clsidEncoder, uint* size)
#cfunc global GdipGetEncoderParameterListSize "GdipGetEncoderParameterListSize" intptr, var, var

; winmdroot.Graphics.GdiPlus.Status GdipGetFamily(winmdroot.Graphics.GdiPlus.GpFont* font, winmdroot.Graphics.GdiPlus.GpFontFamily** family)
#cfunc global GdipGetFamily "GdipGetFamily" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetFamilyName(winmdroot.Graphics.GdiPlus.GpFontFamily* family, winmdroot.Foundation.PWSTR name, ushort language)
#cfunc global GdipGetFamilyName "GdipGetFamilyName" intptr, wstr, int

; winmdroot.Graphics.GdiPlus.Status GdipGetFontCollectionFamilyCount(winmdroot.Graphics.GdiPlus.GpFontCollection* fontCollection, int* numFound)
#cfunc global GdipGetFontCollectionFamilyCount "GdipGetFontCollectionFamilyCount" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetFontCollectionFamilyList(winmdroot.Graphics.GdiPlus.GpFontCollection* fontCollection, int numSought, winmdroot.Graphics.GdiPlus.GpFontFamily** gpfamilies, int* numFound)
#cfunc global GdipGetFontCollectionFamilyList "GdipGetFontCollectionFamilyList" intptr, int, var, var

; winmdroot.Graphics.GdiPlus.Status GdipGetFontHeight(winmdroot.Graphics.GdiPlus.GpFont* font, winmdroot.Graphics.GdiPlus.GpGraphics* graphics, float* height)
#cfunc global GdipGetFontHeight "GdipGetFontHeight" intptr, intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetFontHeightGivenDPI(winmdroot.Graphics.GdiPlus.GpFont* font, float dpi, float* height)
#cfunc global GdipGetFontHeightGivenDPI "GdipGetFontHeightGivenDPI" intptr, float, var

; winmdroot.Graphics.GdiPlus.Status GdipGetFontSize(winmdroot.Graphics.GdiPlus.GpFont* font, float* size)
#cfunc global GdipGetFontSize "GdipGetFontSize" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetFontStyle(winmdroot.Graphics.GdiPlus.GpFont* font, int* style)
#cfunc global GdipGetFontStyle "GdipGetFontStyle" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetFontUnit(winmdroot.Graphics.GdiPlus.GpFont* font, winmdroot.Graphics.GdiPlus.Unit* unit)
#cfunc global GdipGetFontUnit "GdipGetFontUnit" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetGenericFontFamilyMonospace(winmdroot.Graphics.GdiPlus.GpFontFamily** nativeFamily)
#cfunc global GdipGetGenericFontFamilyMonospace "GdipGetGenericFontFamilyMonospace" var

; winmdroot.Graphics.GdiPlus.Status GdipGetGenericFontFamilySansSerif(winmdroot.Graphics.GdiPlus.GpFontFamily** nativeFamily)
#cfunc global GdipGetGenericFontFamilySansSerif "GdipGetGenericFontFamilySansSerif" var

; winmdroot.Graphics.GdiPlus.Status GdipGetGenericFontFamilySerif(winmdroot.Graphics.GdiPlus.GpFontFamily** nativeFamily)
#cfunc global GdipGetGenericFontFamilySerif "GdipGetGenericFontFamilySerif" var

; winmdroot.Graphics.GdiPlus.Status GdipGetHatchBackgroundColor(winmdroot.Graphics.GdiPlus.GpHatch* brush, uint* backcol)
#cfunc global GdipGetHatchBackgroundColor "GdipGetHatchBackgroundColor" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetHatchForegroundColor(winmdroot.Graphics.GdiPlus.GpHatch* brush, uint* forecol)
#cfunc global GdipGetHatchForegroundColor "GdipGetHatchForegroundColor" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetHatchStyle(winmdroot.Graphics.GdiPlus.GpHatch* brush, winmdroot.Graphics.GdiPlus.HatchStyle* hatchstyle)
#cfunc global GdipGetHatchStyle "GdipGetHatchStyle" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetHemfFromMetafile(winmdroot.Graphics.GdiPlus.GpMetafile* metafile, winmdroot.Graphics.Gdi.HENHMETAFILE* hEmf)
#cfunc global GdipGetHemfFromMetafile "GdipGetHemfFromMetafile" intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipGetImageAttributesAdjustedPalette(winmdroot.Graphics.GdiPlus.GpImageAttributes* imageAttr, winmdroot.Graphics.GdiPlus.ColorPalette* colorPalette, winmdroot.Graphics.GdiPlus.ColorAdjustType colorAdjustType)
#cfunc global GdipGetImageAttributesAdjustedPalette "GdipGetImageAttributesAdjustedPalette" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipGetImageBounds(winmdroot.Graphics.GdiPlus.GpImage* image, winmdroot.Graphics.GdiPlus.RectF* srcRect, winmdroot.Graphics.GdiPlus.Unit* srcUnit)
#cfunc global GdipGetImageBounds "GdipGetImageBounds" intptr, var, var

; winmdroot.Graphics.GdiPlus.Status GdipGetImageDecoders(uint numDecoders, uint size, winmdroot.Graphics.GdiPlus.ImageCodecInfo* decoders)
#cfunc global GdipGetImageDecoders "GdipGetImageDecoders" int, int, var

; winmdroot.Graphics.GdiPlus.Status GdipGetImageDecodersSize(uint* numDecoders, uint* size)
#cfunc global GdipGetImageDecodersSize "GdipGetImageDecodersSize" var, var

; winmdroot.Graphics.GdiPlus.Status GdipGetImageDimension(winmdroot.Graphics.GdiPlus.GpImage* image, float* width, float* height)
#cfunc global GdipGetImageDimension "GdipGetImageDimension" intptr, var, var

; winmdroot.Graphics.GdiPlus.Status GdipGetImageEncoders(uint numEncoders, uint size, winmdroot.Graphics.GdiPlus.ImageCodecInfo* encoders)
#cfunc global GdipGetImageEncoders "GdipGetImageEncoders" int, int, var

; winmdroot.Graphics.GdiPlus.Status GdipGetImageEncodersSize(uint* numEncoders, uint* size)
#cfunc global GdipGetImageEncodersSize "GdipGetImageEncodersSize" var, var

; winmdroot.Graphics.GdiPlus.Status GdipGetImageFlags(winmdroot.Graphics.GdiPlus.GpImage* image, uint* flags)
#cfunc global GdipGetImageFlags "GdipGetImageFlags" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetImageGraphicsContext(winmdroot.Graphics.GdiPlus.GpImage* image, winmdroot.Graphics.GdiPlus.GpGraphics** graphics)
#cfunc global GdipGetImageGraphicsContext "GdipGetImageGraphicsContext" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetImageHeight(winmdroot.Graphics.GdiPlus.GpImage* image, uint* height)
#cfunc global GdipGetImageHeight "GdipGetImageHeight" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetImageHorizontalResolution(winmdroot.Graphics.GdiPlus.GpImage* image, float* resolution)
#cfunc global GdipGetImageHorizontalResolution "GdipGetImageHorizontalResolution" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetImageItemData(winmdroot.Graphics.GdiPlus.GpImage* image, winmdroot.Graphics.GdiPlus.ImageItemData* item)
#cfunc global GdipGetImageItemData "GdipGetImageItemData" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetImagePalette(winmdroot.Graphics.GdiPlus.GpImage* image, winmdroot.Graphics.GdiPlus.ColorPalette* palette, int size)
#cfunc global GdipGetImagePalette "GdipGetImagePalette" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipGetImagePaletteSize(winmdroot.Graphics.GdiPlus.GpImage* image, int* size)
#cfunc global GdipGetImagePaletteSize "GdipGetImagePaletteSize" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetImagePixelFormat(winmdroot.Graphics.GdiPlus.GpImage* image, int* format)
#cfunc global GdipGetImagePixelFormat "GdipGetImagePixelFormat" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetImageRawFormat(winmdroot.Graphics.GdiPlus.GpImage* image, global::System.Guid* format)
#cfunc global GdipGetImageRawFormat "GdipGetImageRawFormat" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetImageThumbnail(winmdroot.Graphics.GdiPlus.GpImage* image, uint thumbWidth, uint thumbHeight, winmdroot.Graphics.GdiPlus.GpImage** thumbImage, nint callback, void* callbackData)
#cfunc global GdipGetImageThumbnail "GdipGetImageThumbnail" intptr, int, int, var, int, intptr

; winmdroot.Graphics.GdiPlus.Status GdipGetImageType(winmdroot.Graphics.GdiPlus.GpImage* image, winmdroot.Graphics.GdiPlus.ImageType* type)
#cfunc global GdipGetImageType "GdipGetImageType" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetImageVerticalResolution(winmdroot.Graphics.GdiPlus.GpImage* image, float* resolution)
#cfunc global GdipGetImageVerticalResolution "GdipGetImageVerticalResolution" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetImageWidth(winmdroot.Graphics.GdiPlus.GpImage* image, uint* width)
#cfunc global GdipGetImageWidth "GdipGetImageWidth" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetInterpolationMode(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.InterpolationMode* interpolationMode)
#cfunc global GdipGetInterpolationMode "GdipGetInterpolationMode" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetLineBlend(winmdroot.Graphics.GdiPlus.GpLineGradient* brush, float* blend, float* positions, int count)
#cfunc global GdipGetLineBlend "GdipGetLineBlend" intptr, var, var, int

; winmdroot.Graphics.GdiPlus.Status GdipGetLineBlendCount(winmdroot.Graphics.GdiPlus.GpLineGradient* brush, int* count)
#cfunc global GdipGetLineBlendCount "GdipGetLineBlendCount" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetLineColors(winmdroot.Graphics.GdiPlus.GpLineGradient* brush, uint* colors)
#cfunc global GdipGetLineColors "GdipGetLineColors" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetLineGammaCorrection(winmdroot.Graphics.GdiPlus.GpLineGradient* brush, winmdroot.Foundation.BOOL* useGammaCorrection)
#cfunc global GdipGetLineGammaCorrection "GdipGetLineGammaCorrection" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetLinePresetBlend(winmdroot.Graphics.GdiPlus.GpLineGradient* brush, uint* blend, float* positions, int count)
#cfunc global GdipGetLinePresetBlend "GdipGetLinePresetBlend" intptr, var, var, int

; winmdroot.Graphics.GdiPlus.Status GdipGetLinePresetBlendCount(winmdroot.Graphics.GdiPlus.GpLineGradient* brush, int* count)
#cfunc global GdipGetLinePresetBlendCount "GdipGetLinePresetBlendCount" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetLineRect(winmdroot.Graphics.GdiPlus.GpLineGradient* brush, winmdroot.Graphics.GdiPlus.RectF* rect)
#cfunc global GdipGetLineRect "GdipGetLineRect" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetLineRectI(winmdroot.Graphics.GdiPlus.GpLineGradient* brush, winmdroot.Graphics.GdiPlus.Rect* rect)
#cfunc global GdipGetLineRectI "GdipGetLineRectI" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetLineSpacing(winmdroot.Graphics.GdiPlus.GpFontFamily* family, int style, ushort* LineSpacing)
#cfunc global GdipGetLineSpacing "GdipGetLineSpacing" intptr, int, var

; winmdroot.Graphics.GdiPlus.Status GdipGetLineTransform(winmdroot.Graphics.GdiPlus.GpLineGradient* brush, winmdroot.Graphics.GdiPlus.Matrix* matrix)
#cfunc global GdipGetLineTransform "GdipGetLineTransform" intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipGetLineWrapMode(winmdroot.Graphics.GdiPlus.GpLineGradient* brush, winmdroot.Graphics.GdiPlus.WrapMode* wrapmode)
#cfunc global GdipGetLineWrapMode "GdipGetLineWrapMode" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetLogFontW(winmdroot.Graphics.GdiPlus.GpFont* font, winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.Gdi.LOGFONTW* logfontW)
#cfunc global GdipGetLogFontW "GdipGetLogFontW" intptr, intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetMatrixElements(winmdroot.Graphics.GdiPlus.Matrix* matrix, float* matrixOut)
#cfunc global GdipGetMatrixElements "GdipGetMatrixElements" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetMetafileDownLevelRasterizationLimit(winmdroot.Graphics.GdiPlus.GpMetafile* metafile, uint* metafileRasterizationLimitDpi)
#cfunc global GdipGetMetafileDownLevelRasterizationLimit "GdipGetMetafileDownLevelRasterizationLimit" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetMetafileHeaderFromEmf(winmdroot.Graphics.Gdi.HENHMETAFILE hEmf, winmdroot.Graphics.GdiPlus.MetafileHeader* header)
#cfunc global GdipGetMetafileHeaderFromEmf "GdipGetMetafileHeaderFromEmf" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetMetafileHeaderFromFile(winmdroot.Foundation.PCWSTR filename, winmdroot.Graphics.GdiPlus.MetafileHeader* header)
#cfunc global GdipGetMetafileHeaderFromFile "GdipGetMetafileHeaderFromFile" wstr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetMetafileHeaderFromMetafile(winmdroot.Graphics.GdiPlus.GpMetafile* metafile, winmdroot.Graphics.GdiPlus.MetafileHeader* header)
#cfunc global GdipGetMetafileHeaderFromMetafile "GdipGetMetafileHeaderFromMetafile" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetMetafileHeaderFromStream(winmdroot.System.Com.IStream* stream, winmdroot.Graphics.GdiPlus.MetafileHeader* header)
#cfunc global GdipGetMetafileHeaderFromStream "GdipGetMetafileHeaderFromStream" var, var

; winmdroot.Graphics.GdiPlus.Status GdipGetMetafileHeaderFromWmf(winmdroot.Graphics.Gdi.HMETAFILE hWmf, winmdroot.Graphics.GdiPlus.WmfPlaceableFileHeader* wmfPlaceableFileHeader, winmdroot.Graphics.GdiPlus.MetafileHeader* header)
#cfunc global GdipGetMetafileHeaderFromWmf "GdipGetMetafileHeaderFromWmf" intptr, var, var

; winmdroot.Graphics.GdiPlus.Status GdipGetNearestColor(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, uint* argb)
#cfunc global GdipGetNearestColor "GdipGetNearestColor" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPageScale(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, float* scale)
#cfunc global GdipGetPageScale "GdipGetPageScale" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPageUnit(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.Unit* unit)
#cfunc global GdipGetPageUnit "GdipGetPageUnit" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPathData(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.PathData* pathData)
#cfunc global GdipGetPathData "GdipGetPathData" intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipGetPathFillMode(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.FillMode* fillmode)
#cfunc global GdipGetPathFillMode "GdipGetPathFillMode" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPathGradientBlend(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, float* blend, float* positions, int count)
#cfunc global GdipGetPathGradientBlend "GdipGetPathGradientBlend" intptr, var, var, int

; winmdroot.Graphics.GdiPlus.Status GdipGetPathGradientBlendCount(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, int* count)
#cfunc global GdipGetPathGradientBlendCount "GdipGetPathGradientBlendCount" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPathGradientCenterColor(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, uint* colors)
#cfunc global GdipGetPathGradientCenterColor "GdipGetPathGradientCenterColor" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPathGradientCenterPoint(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, winmdroot.Graphics.GdiPlus.PointF* points)
#cfunc global GdipGetPathGradientCenterPoint "GdipGetPathGradientCenterPoint" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPathGradientCenterPointI(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, winmdroot.Graphics.GdiPlus.Point* points)
#cfunc global GdipGetPathGradientCenterPointI "GdipGetPathGradientCenterPointI" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPathGradientFocusScales(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, float* xScale, float* yScale)
#cfunc global GdipGetPathGradientFocusScales "GdipGetPathGradientFocusScales" intptr, var, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPathGradientGammaCorrection(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, winmdroot.Foundation.BOOL* useGammaCorrection)
#cfunc global GdipGetPathGradientGammaCorrection "GdipGetPathGradientGammaCorrection" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPathGradientPath(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, winmdroot.Graphics.GdiPlus.GpPath* path)
#cfunc global GdipGetPathGradientPath "GdipGetPathGradientPath" intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipGetPathGradientPointCount(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, int* count)
#cfunc global GdipGetPathGradientPointCount "GdipGetPathGradientPointCount" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPathGradientPresetBlend(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, uint* blend, float* positions, int count)
#cfunc global GdipGetPathGradientPresetBlend "GdipGetPathGradientPresetBlend" intptr, var, var, int

; winmdroot.Graphics.GdiPlus.Status GdipGetPathGradientPresetBlendCount(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, int* count)
#cfunc global GdipGetPathGradientPresetBlendCount "GdipGetPathGradientPresetBlendCount" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPathGradientRect(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, winmdroot.Graphics.GdiPlus.RectF* rect)
#cfunc global GdipGetPathGradientRect "GdipGetPathGradientRect" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPathGradientRectI(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, winmdroot.Graphics.GdiPlus.Rect* rect)
#cfunc global GdipGetPathGradientRectI "GdipGetPathGradientRectI" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPathGradientSurroundColorCount(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, int* count)
#cfunc global GdipGetPathGradientSurroundColorCount "GdipGetPathGradientSurroundColorCount" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPathGradientSurroundColorsWithCount(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, uint* color, int* count)
#cfunc global GdipGetPathGradientSurroundColorsWithCount "GdipGetPathGradientSurroundColorsWithCount" intptr, var, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPathGradientTransform(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, winmdroot.Graphics.GdiPlus.Matrix* matrix)
#cfunc global GdipGetPathGradientTransform "GdipGetPathGradientTransform" intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipGetPathGradientWrapMode(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, winmdroot.Graphics.GdiPlus.WrapMode* wrapmode)
#cfunc global GdipGetPathGradientWrapMode "GdipGetPathGradientWrapMode" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPathLastPoint(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.PointF* lastPoint)
#cfunc global GdipGetPathLastPoint "GdipGetPathLastPoint" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPathPoints(winmdroot.Graphics.GdiPlus.GpPath* param0, winmdroot.Graphics.GdiPlus.PointF* points, int count)
#cfunc global GdipGetPathPoints "GdipGetPathPoints" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipGetPathPointsI(winmdroot.Graphics.GdiPlus.GpPath* param0, winmdroot.Graphics.GdiPlus.Point* points, int count)
#cfunc global GdipGetPathPointsI "GdipGetPathPointsI" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipGetPathTypes(winmdroot.Graphics.GdiPlus.GpPath* path, byte* types, int count)
#cfunc global GdipGetPathTypes "GdipGetPathTypes" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipGetPathWorldBounds(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.RectF* bounds, winmdroot.Graphics.GdiPlus.Matrix* matrix, winmdroot.Graphics.GdiPlus.GpPen* pen)
#cfunc global GdipGetPathWorldBounds "GdipGetPathWorldBounds" intptr, var, intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipGetPathWorldBoundsI(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.Rect* bounds, winmdroot.Graphics.GdiPlus.Matrix* matrix, winmdroot.Graphics.GdiPlus.GpPen* pen)
#cfunc global GdipGetPathWorldBoundsI "GdipGetPathWorldBoundsI" intptr, var, intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipGetPenBrushFill(winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.GpBrush** brush)
#cfunc global GdipGetPenBrushFill "GdipGetPenBrushFill" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPenColor(winmdroot.Graphics.GdiPlus.GpPen* pen, uint* argb)
#cfunc global GdipGetPenColor "GdipGetPenColor" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPenCompoundArray(winmdroot.Graphics.GdiPlus.GpPen* pen, float* dash, int count)
#cfunc global GdipGetPenCompoundArray "GdipGetPenCompoundArray" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipGetPenCompoundCount(winmdroot.Graphics.GdiPlus.GpPen* pen, int* count)
#cfunc global GdipGetPenCompoundCount "GdipGetPenCompoundCount" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPenCustomEndCap(winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.GpCustomLineCap** customCap)
#cfunc global GdipGetPenCustomEndCap "GdipGetPenCustomEndCap" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPenCustomStartCap(winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.GpCustomLineCap** customCap)
#cfunc global GdipGetPenCustomStartCap "GdipGetPenCustomStartCap" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPenDashArray(winmdroot.Graphics.GdiPlus.GpPen* pen, float* dash, int count)
#cfunc global GdipGetPenDashArray "GdipGetPenDashArray" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipGetPenDashCap197819(winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.DashCap* dashCap)
#cfunc global GdipGetPenDashCap197819 "GdipGetPenDashCap197819" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPenDashCount(winmdroot.Graphics.GdiPlus.GpPen* pen, int* count)
#cfunc global GdipGetPenDashCount "GdipGetPenDashCount" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPenDashOffset(winmdroot.Graphics.GdiPlus.GpPen* pen, float* offset)
#cfunc global GdipGetPenDashOffset "GdipGetPenDashOffset" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPenDashStyle(winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.DashStyle* dashstyle)
#cfunc global GdipGetPenDashStyle "GdipGetPenDashStyle" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPenEndCap(winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.LineCap* endCap)
#cfunc global GdipGetPenEndCap "GdipGetPenEndCap" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPenFillType(winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.PenType* type)
#cfunc global GdipGetPenFillType "GdipGetPenFillType" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPenLineJoin(winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.LineJoin* lineJoin)
#cfunc global GdipGetPenLineJoin "GdipGetPenLineJoin" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPenMiterLimit(winmdroot.Graphics.GdiPlus.GpPen* pen, float* miterLimit)
#cfunc global GdipGetPenMiterLimit "GdipGetPenMiterLimit" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPenMode(winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.PenAlignment* penMode)
#cfunc global GdipGetPenMode "GdipGetPenMode" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPenStartCap(winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.LineCap* startCap)
#cfunc global GdipGetPenStartCap "GdipGetPenStartCap" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPenTransform(winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.Matrix* matrix)
#cfunc global GdipGetPenTransform "GdipGetPenTransform" intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipGetPenUnit(winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.Unit* unit)
#cfunc global GdipGetPenUnit "GdipGetPenUnit" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPenWidth(winmdroot.Graphics.GdiPlus.GpPen* pen, float* width)
#cfunc global GdipGetPenWidth "GdipGetPenWidth" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPixelOffsetMode(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.PixelOffsetMode* pixelOffsetMode)
#cfunc global GdipGetPixelOffsetMode "GdipGetPixelOffsetMode" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPointCount(winmdroot.Graphics.GdiPlus.GpPath* path, int* count)
#cfunc global GdipGetPointCount "GdipGetPointCount" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPropertyCount(winmdroot.Graphics.GdiPlus.GpImage* image, uint* numOfProperty)
#cfunc global GdipGetPropertyCount "GdipGetPropertyCount" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPropertyIdList(winmdroot.Graphics.GdiPlus.GpImage* image, uint numOfProperty, uint* list)
#cfunc global GdipGetPropertyIdList "GdipGetPropertyIdList" intptr, int, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPropertyItem(winmdroot.Graphics.GdiPlus.GpImage* image, uint propId, uint propSize, winmdroot.Graphics.GdiPlus.PropertyItem* buffer)
#cfunc global GdipGetPropertyItem "GdipGetPropertyItem" intptr, int, int, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPropertyItemSize(winmdroot.Graphics.GdiPlus.GpImage* image, uint propId, uint* size)
#cfunc global GdipGetPropertyItemSize "GdipGetPropertyItemSize" intptr, int, var

; winmdroot.Graphics.GdiPlus.Status GdipGetPropertySize(winmdroot.Graphics.GdiPlus.GpImage* image, uint* totalBufferSize, uint* numProperties)
#cfunc global GdipGetPropertySize "GdipGetPropertySize" intptr, var, var

; winmdroot.Graphics.GdiPlus.Status GdipGetRegionBounds(winmdroot.Graphics.GdiPlus.GpRegion* region, winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.RectF* rect)
#cfunc global GdipGetRegionBounds "GdipGetRegionBounds" intptr, intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetRegionBoundsI(winmdroot.Graphics.GdiPlus.GpRegion* region, winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.Rect* rect)
#cfunc global GdipGetRegionBoundsI "GdipGetRegionBoundsI" intptr, intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetRegionData(winmdroot.Graphics.GdiPlus.GpRegion* region, byte* buffer, uint bufferSize, [Optional] uint* sizeFilled)
#cfunc global GdipGetRegionData "GdipGetRegionData" intptr, var, int, var

; winmdroot.Graphics.GdiPlus.Status GdipGetRegionDataSize(winmdroot.Graphics.GdiPlus.GpRegion* region, uint* bufferSize)
#cfunc global GdipGetRegionDataSize "GdipGetRegionDataSize" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetRegionHRgn(winmdroot.Graphics.GdiPlus.GpRegion* region, winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.Gdi.HRGN* hRgn)
#cfunc global GdipGetRegionHRgn "GdipGetRegionHRgn" intptr, intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipGetRegionScans(winmdroot.Graphics.GdiPlus.GpRegion* region, winmdroot.Graphics.GdiPlus.RectF* rects, int* count, winmdroot.Graphics.GdiPlus.Matrix* matrix)
#cfunc global GdipGetRegionScans "GdipGetRegionScans" intptr, var, var, intptr

; winmdroot.Graphics.GdiPlus.Status GdipGetRegionScansCount(winmdroot.Graphics.GdiPlus.GpRegion* region, uint* count, winmdroot.Graphics.GdiPlus.Matrix* matrix)
#cfunc global GdipGetRegionScansCount "GdipGetRegionScansCount" intptr, var, intptr

; winmdroot.Graphics.GdiPlus.Status GdipGetRegionScansI(winmdroot.Graphics.GdiPlus.GpRegion* region, winmdroot.Graphics.GdiPlus.Rect* rects, int* count, winmdroot.Graphics.GdiPlus.Matrix* matrix)
#cfunc global GdipGetRegionScansI "GdipGetRegionScansI" intptr, var, var, intptr

; winmdroot.Graphics.GdiPlus.Status GdipGetRenderingOrigin(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, int* x, int* y)
#cfunc global GdipGetRenderingOrigin "GdipGetRenderingOrigin" intptr, var, var

; winmdroot.Graphics.GdiPlus.Status GdipGetSmoothingMode(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.SmoothingMode* smoothingMode)
#cfunc global GdipGetSmoothingMode "GdipGetSmoothingMode" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetSolidFillColor(winmdroot.Graphics.GdiPlus.GpSolidFill* brush, uint* color)
#cfunc global GdipGetSolidFillColor "GdipGetSolidFillColor" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetStringFormatAlign(winmdroot.Graphics.GdiPlus.GpStringFormat* format, winmdroot.Graphics.GdiPlus.StringAlignment* align)
#cfunc global GdipGetStringFormatAlign "GdipGetStringFormatAlign" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetStringFormatDigitSubstitution(winmdroot.Graphics.GdiPlus.GpStringFormat* format, ushort* language, winmdroot.Graphics.GdiPlus.StringDigitSubstitute* substitute)
#cfunc global GdipGetStringFormatDigitSubstitution "GdipGetStringFormatDigitSubstitution" intptr, var, var

; winmdroot.Graphics.GdiPlus.Status GdipGetStringFormatFlags(winmdroot.Graphics.GdiPlus.GpStringFormat* format, int* flags)
#cfunc global GdipGetStringFormatFlags "GdipGetStringFormatFlags" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetStringFormatHotkeyPrefix(winmdroot.Graphics.GdiPlus.GpStringFormat* format, int* hotkeyPrefix)
#cfunc global GdipGetStringFormatHotkeyPrefix "GdipGetStringFormatHotkeyPrefix" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetStringFormatLineAlign(winmdroot.Graphics.GdiPlus.GpStringFormat* format, winmdroot.Graphics.GdiPlus.StringAlignment* align)
#cfunc global GdipGetStringFormatLineAlign "GdipGetStringFormatLineAlign" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetStringFormatMeasurableCharacterRangeCount(winmdroot.Graphics.GdiPlus.GpStringFormat* format, int* count)
#cfunc global GdipGetStringFormatMeasurableCharacterRangeCount "GdipGetStringFormatMeasurableCharacterRangeCount" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetStringFormatTabStopCount(winmdroot.Graphics.GdiPlus.GpStringFormat* format, int* count)
#cfunc global GdipGetStringFormatTabStopCount "GdipGetStringFormatTabStopCount" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetStringFormatTabStops(winmdroot.Graphics.GdiPlus.GpStringFormat* format, int count, float* firstTabOffset, float* tabStops)
#cfunc global GdipGetStringFormatTabStops "GdipGetStringFormatTabStops" intptr, int, var, var

; winmdroot.Graphics.GdiPlus.Status GdipGetStringFormatTrimming(winmdroot.Graphics.GdiPlus.GpStringFormat* format, winmdroot.Graphics.GdiPlus.StringTrimming* trimming)
#cfunc global GdipGetStringFormatTrimming "GdipGetStringFormatTrimming" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetTextContrast(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, uint* contrast)
#cfunc global GdipGetTextContrast "GdipGetTextContrast" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetTextRenderingHint(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.TextRenderingHint* mode)
#cfunc global GdipGetTextRenderingHint "GdipGetTextRenderingHint" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetTextureImage(winmdroot.Graphics.GdiPlus.GpTexture* brush, winmdroot.Graphics.GdiPlus.GpImage** image)
#cfunc global GdipGetTextureImage "GdipGetTextureImage" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetTextureTransform(winmdroot.Graphics.GdiPlus.GpTexture* brush, winmdroot.Graphics.GdiPlus.Matrix* matrix)
#cfunc global GdipGetTextureTransform "GdipGetTextureTransform" intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipGetTextureWrapMode(winmdroot.Graphics.GdiPlus.GpTexture* brush, winmdroot.Graphics.GdiPlus.WrapMode* wrapmode)
#cfunc global GdipGetTextureWrapMode "GdipGetTextureWrapMode" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetVisibleClipBounds(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.RectF* rect)
#cfunc global GdipGetVisibleClipBounds "GdipGetVisibleClipBounds" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetVisibleClipBoundsI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.Rect* rect)
#cfunc global GdipGetVisibleClipBoundsI "GdipGetVisibleClipBoundsI" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipGetWorldTransform(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.Matrix* matrix)
#cfunc global GdipGetWorldTransform "GdipGetWorldTransform" intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipGraphicsClear(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, uint color)
#cfunc global GdipGraphicsClear "GdipGraphicsClear" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipGraphicsSetAbort(winmdroot.Graphics.GdiPlus.GpGraphics* pGraphics, winmdroot.Graphics.GdiPlus.GdiplusAbort* pIAbort)
#cfunc global GdipGraphicsSetAbort "GdipGraphicsSetAbort" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipImageForceValidation(winmdroot.Graphics.GdiPlus.GpImage* image)
#cfunc global GdipImageForceValidation "GdipImageForceValidation" intptr

; winmdroot.Graphics.GdiPlus.Status GdipImageGetFrameCount(winmdroot.Graphics.GdiPlus.GpImage* image, global::System.Guid* dimensionID, uint* count)
#cfunc global GdipImageGetFrameCount "GdipImageGetFrameCount" intptr, var, var

; winmdroot.Graphics.GdiPlus.Status GdipImageGetFrameDimensionsCount(winmdroot.Graphics.GdiPlus.GpImage* image, uint* count)
#cfunc global GdipImageGetFrameDimensionsCount "GdipImageGetFrameDimensionsCount" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipImageGetFrameDimensionsList(winmdroot.Graphics.GdiPlus.GpImage* image, global::System.Guid* dimensionIDs, uint count)
#cfunc global GdipImageGetFrameDimensionsList "GdipImageGetFrameDimensionsList" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipImageRotateFlip(winmdroot.Graphics.GdiPlus.GpImage* image, winmdroot.Graphics.GdiPlus.RotateFlipType rfType)
#cfunc global GdipImageRotateFlip "GdipImageRotateFlip" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipImageSelectActiveFrame(winmdroot.Graphics.GdiPlus.GpImage* image, global::System.Guid* dimensionID, uint frameIndex)
#cfunc global GdipImageSelectActiveFrame "GdipImageSelectActiveFrame" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipImageSetAbort(winmdroot.Graphics.GdiPlus.GpImage* pImage, winmdroot.Graphics.GdiPlus.GdiplusAbort* pIAbort)
#cfunc global GdipImageSetAbort "GdipImageSetAbort" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipInitializePalette(winmdroot.Graphics.GdiPlus.ColorPalette* palette, winmdroot.Graphics.GdiPlus.PaletteType palettetype, int optimalColors, winmdroot.Foundation.BOOL useTransparentColor, winmdroot.Graphics.GdiPlus.GpBitmap* bitmap)
#cfunc global GdipInitializePalette "GdipInitializePalette" var, int, int, int, intptr

; winmdroot.Graphics.GdiPlus.Status GdipInvertMatrix(winmdroot.Graphics.GdiPlus.Matrix* matrix)
#cfunc global GdipInvertMatrix "GdipInvertMatrix" intptr

; winmdroot.Graphics.GdiPlus.Status GdipIsClipEmpty(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Foundation.BOOL* result)
#cfunc global GdipIsClipEmpty "GdipIsClipEmpty" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipIsEmptyRegion(winmdroot.Graphics.GdiPlus.GpRegion* region, winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Foundation.BOOL* result)
#cfunc global GdipIsEmptyRegion "GdipIsEmptyRegion" intptr, intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipIsEqualRegion(winmdroot.Graphics.GdiPlus.GpRegion* region, winmdroot.Graphics.GdiPlus.GpRegion* region2, winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Foundation.BOOL* result)
#cfunc global GdipIsEqualRegion "GdipIsEqualRegion" intptr, intptr, intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipIsInfiniteRegion(winmdroot.Graphics.GdiPlus.GpRegion* region, winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Foundation.BOOL* result)
#cfunc global GdipIsInfiniteRegion "GdipIsInfiniteRegion" intptr, intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipIsMatrixEqual(winmdroot.Graphics.GdiPlus.Matrix* matrix, winmdroot.Graphics.GdiPlus.Matrix* matrix2, winmdroot.Foundation.BOOL* result)
#cfunc global GdipIsMatrixEqual "GdipIsMatrixEqual" intptr, intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipIsMatrixIdentity(winmdroot.Graphics.GdiPlus.Matrix* matrix, winmdroot.Foundation.BOOL* result)
#cfunc global GdipIsMatrixIdentity "GdipIsMatrixIdentity" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipIsMatrixInvertible(winmdroot.Graphics.GdiPlus.Matrix* matrix, winmdroot.Foundation.BOOL* result)
#cfunc global GdipIsMatrixInvertible "GdipIsMatrixInvertible" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipIsOutlineVisiblePathPoint(winmdroot.Graphics.GdiPlus.GpPath* path, float x, float y, winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Foundation.BOOL* result)
#cfunc global GdipIsOutlineVisiblePathPoint "GdipIsOutlineVisiblePathPoint" intptr, float, float, intptr, intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipIsOutlineVisiblePathPointI(winmdroot.Graphics.GdiPlus.GpPath* path, int x, int y, winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Foundation.BOOL* result)
#cfunc global GdipIsOutlineVisiblePathPointI "GdipIsOutlineVisiblePathPointI" intptr, int, int, intptr, intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipIsStyleAvailable(winmdroot.Graphics.GdiPlus.GpFontFamily* family, int style, winmdroot.Foundation.BOOL* IsStyleAvailable)
#cfunc global GdipIsStyleAvailable "GdipIsStyleAvailable" intptr, int, var

; winmdroot.Graphics.GdiPlus.Status GdipIsVisibleClipEmpty(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Foundation.BOOL* result)
#cfunc global GdipIsVisibleClipEmpty "GdipIsVisibleClipEmpty" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipIsVisiblePathPoint(winmdroot.Graphics.GdiPlus.GpPath* path, float x, float y, winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Foundation.BOOL* result)
#cfunc global GdipIsVisiblePathPoint "GdipIsVisiblePathPoint" intptr, float, float, intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipIsVisiblePathPointI(winmdroot.Graphics.GdiPlus.GpPath* path, int x, int y, winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Foundation.BOOL* result)
#cfunc global GdipIsVisiblePathPointI "GdipIsVisiblePathPointI" intptr, int, int, intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipIsVisiblePoint(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, float x, float y, winmdroot.Foundation.BOOL* result)
#cfunc global GdipIsVisiblePoint "GdipIsVisiblePoint" intptr, float, float, var

; winmdroot.Graphics.GdiPlus.Status GdipIsVisiblePointI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, int x, int y, winmdroot.Foundation.BOOL* result)
#cfunc global GdipIsVisiblePointI "GdipIsVisiblePointI" intptr, int, int, var

; winmdroot.Graphics.GdiPlus.Status GdipIsVisibleRect(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, float x, float y, float width, float height, winmdroot.Foundation.BOOL* result)
#cfunc global GdipIsVisibleRect "GdipIsVisibleRect" intptr, float, float, float, float, var

; winmdroot.Graphics.GdiPlus.Status GdipIsVisibleRectI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, int x, int y, int width, int height, winmdroot.Foundation.BOOL* result)
#cfunc global GdipIsVisibleRectI "GdipIsVisibleRectI" intptr, int, int, int, int, var

; winmdroot.Graphics.GdiPlus.Status GdipIsVisibleRegionPoint(winmdroot.Graphics.GdiPlus.GpRegion* region, float x, float y, winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Foundation.BOOL* result)
#cfunc global GdipIsVisibleRegionPoint "GdipIsVisibleRegionPoint" intptr, float, float, intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipIsVisibleRegionPointI(winmdroot.Graphics.GdiPlus.GpRegion* region, int x, int y, winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Foundation.BOOL* result)
#cfunc global GdipIsVisibleRegionPointI "GdipIsVisibleRegionPointI" intptr, int, int, intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipIsVisibleRegionRect(winmdroot.Graphics.GdiPlus.GpRegion* region, float x, float y, float width, float height, winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Foundation.BOOL* result)
#cfunc global GdipIsVisibleRegionRect "GdipIsVisibleRegionRect" intptr, float, float, float, float, intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipIsVisibleRegionRectI(winmdroot.Graphics.GdiPlus.GpRegion* region, int x, int y, int width, int height, winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Foundation.BOOL* result)
#cfunc global GdipIsVisibleRegionRectI "GdipIsVisibleRegionRectI" intptr, int, int, int, int, intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipLoadImageFromFile(winmdroot.Foundation.PCWSTR filename, winmdroot.Graphics.GdiPlus.GpImage** image)
#cfunc global GdipLoadImageFromFile "GdipLoadImageFromFile" wstr, var

; winmdroot.Graphics.GdiPlus.Status GdipLoadImageFromFileICM(winmdroot.Foundation.PCWSTR filename, winmdroot.Graphics.GdiPlus.GpImage** image)
#cfunc global GdipLoadImageFromFileICM "GdipLoadImageFromFileICM" wstr, var

; winmdroot.Graphics.GdiPlus.Status GdipLoadImageFromStream(winmdroot.System.Com.IStream* stream, winmdroot.Graphics.GdiPlus.GpImage** image)
#cfunc global GdipLoadImageFromStream "GdipLoadImageFromStream" var, var

; winmdroot.Graphics.GdiPlus.Status GdipLoadImageFromStreamICM(winmdroot.System.Com.IStream* stream, winmdroot.Graphics.GdiPlus.GpImage** image)
#cfunc global GdipLoadImageFromStreamICM "GdipLoadImageFromStreamICM" var, var

; winmdroot.Graphics.GdiPlus.Status GdipMeasureCharacterRanges(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Foundation.PCWSTR @string, int length, winmdroot.Graphics.GdiPlus.GpFont* font, winmdroot.Graphics.GdiPlus.RectF* layoutRect, winmdroot.Graphics.GdiPlus.GpStringFormat* stringFormat, int regionCount, winmdroot.Graphics.GdiPlus.GpRegion** regions)
#cfunc global GdipMeasureCharacterRanges "GdipMeasureCharacterRanges" intptr, int, int, intptr, var, intptr, int, var

; winmdroot.Graphics.GdiPlus.Status GdipMeasureDriverString(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, ushort* text, int length, winmdroot.Graphics.GdiPlus.GpFont* font, winmdroot.Graphics.GdiPlus.PointF* positions, int flags, winmdroot.Graphics.GdiPlus.Matrix* matrix, winmdroot.Graphics.GdiPlus.RectF* boundingBox)
#cfunc global GdipMeasureDriverString "GdipMeasureDriverString" intptr, var, int, intptr, var, int, intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipMeasureString(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Foundation.PCWSTR @string, int length, winmdroot.Graphics.GdiPlus.GpFont* font, winmdroot.Graphics.GdiPlus.RectF* layoutRect, winmdroot.Graphics.GdiPlus.GpStringFormat* stringFormat, winmdroot.Graphics.GdiPlus.RectF* boundingBox, int* codepointsFitted, int* linesFilled)
#cfunc global GdipMeasureString "GdipMeasureString" intptr, int, int, intptr, var, intptr, var, var, var

; winmdroot.Graphics.GdiPlus.Status GdipMultiplyLineTransform(winmdroot.Graphics.GdiPlus.GpLineGradient* brush, winmdroot.Graphics.GdiPlus.Matrix* matrix, winmdroot.Graphics.GdiPlus.MatrixOrder order)
#cfunc global GdipMultiplyLineTransform "GdipMultiplyLineTransform" intptr, intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipMultiplyMatrix(winmdroot.Graphics.GdiPlus.Matrix* matrix, winmdroot.Graphics.GdiPlus.Matrix* matrix2, winmdroot.Graphics.GdiPlus.MatrixOrder order)
#cfunc global GdipMultiplyMatrix "GdipMultiplyMatrix" intptr, intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipMultiplyPathGradientTransform(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, winmdroot.Graphics.GdiPlus.Matrix* matrix, winmdroot.Graphics.GdiPlus.MatrixOrder order)
#cfunc global GdipMultiplyPathGradientTransform "GdipMultiplyPathGradientTransform" intptr, intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipMultiplyPenTransform(winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.Matrix* matrix, winmdroot.Graphics.GdiPlus.MatrixOrder order)
#cfunc global GdipMultiplyPenTransform "GdipMultiplyPenTransform" intptr, intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipMultiplyTextureTransform(winmdroot.Graphics.GdiPlus.GpTexture* brush, winmdroot.Graphics.GdiPlus.Matrix* matrix, winmdroot.Graphics.GdiPlus.MatrixOrder order)
#cfunc global GdipMultiplyTextureTransform "GdipMultiplyTextureTransform" intptr, intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipMultiplyWorldTransform(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.Matrix* matrix, winmdroot.Graphics.GdiPlus.MatrixOrder order)
#cfunc global GdipMultiplyWorldTransform "GdipMultiplyWorldTransform" intptr, intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipNewInstalledFontCollection(winmdroot.Graphics.GdiPlus.GpFontCollection** fontCollection)
#cfunc global GdipNewInstalledFontCollection "GdipNewInstalledFontCollection" var

; winmdroot.Graphics.GdiPlus.Status GdipNewPrivateFontCollection(winmdroot.Graphics.GdiPlus.GpFontCollection** fontCollection)
#cfunc global GdipNewPrivateFontCollection "GdipNewPrivateFontCollection" var

; winmdroot.Graphics.GdiPlus.Status GdipPathIterCopyData(winmdroot.Graphics.GdiPlus.GpPathIterator* iterator, int* resultCount, winmdroot.Graphics.GdiPlus.PointF* points, byte* types, int startIndex, int endIndex)
#cfunc global GdipPathIterCopyData "GdipPathIterCopyData" intptr, var, var, var, int, int

; winmdroot.Graphics.GdiPlus.Status GdipPathIterEnumerate(winmdroot.Graphics.GdiPlus.GpPathIterator* iterator, int* resultCount, winmdroot.Graphics.GdiPlus.PointF* points, byte* types, int count)
#cfunc global GdipPathIterEnumerate "GdipPathIterEnumerate" intptr, var, var, var, int

; winmdroot.Graphics.GdiPlus.Status GdipPathIterGetCount(winmdroot.Graphics.GdiPlus.GpPathIterator* iterator, int* count)
#cfunc global GdipPathIterGetCount "GdipPathIterGetCount" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipPathIterGetSubpathCount(winmdroot.Graphics.GdiPlus.GpPathIterator* iterator, int* count)
#cfunc global GdipPathIterGetSubpathCount "GdipPathIterGetSubpathCount" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipPathIterHasCurve(winmdroot.Graphics.GdiPlus.GpPathIterator* iterator, winmdroot.Foundation.BOOL* hasCurve)
#cfunc global GdipPathIterHasCurve "GdipPathIterHasCurve" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipPathIterIsValid(winmdroot.Graphics.GdiPlus.GpPathIterator* iterator, winmdroot.Foundation.BOOL* valid)
#cfunc global GdipPathIterIsValid "GdipPathIterIsValid" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipPathIterNextMarker(winmdroot.Graphics.GdiPlus.GpPathIterator* iterator, int* resultCount, int* startIndex, int* endIndex)
#cfunc global GdipPathIterNextMarker "GdipPathIterNextMarker" intptr, var, var, var

; winmdroot.Graphics.GdiPlus.Status GdipPathIterNextMarkerPath(winmdroot.Graphics.GdiPlus.GpPathIterator* iterator, int* resultCount, winmdroot.Graphics.GdiPlus.GpPath* path)
#cfunc global GdipPathIterNextMarkerPath "GdipPathIterNextMarkerPath" intptr, var, intptr

; winmdroot.Graphics.GdiPlus.Status GdipPathIterNextPathType(winmdroot.Graphics.GdiPlus.GpPathIterator* iterator, int* resultCount, byte* pathType, int* startIndex, int* endIndex)
#cfunc global GdipPathIterNextPathType "GdipPathIterNextPathType" intptr, var, var, var, var

; winmdroot.Graphics.GdiPlus.Status GdipPathIterNextSubpath(winmdroot.Graphics.GdiPlus.GpPathIterator* iterator, int* resultCount, int* startIndex, int* endIndex, winmdroot.Foundation.BOOL* isClosed)
#cfunc global GdipPathIterNextSubpath "GdipPathIterNextSubpath" intptr, var, var, var, var

; winmdroot.Graphics.GdiPlus.Status GdipPathIterNextSubpathPath(winmdroot.Graphics.GdiPlus.GpPathIterator* iterator, int* resultCount, winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Foundation.BOOL* isClosed)
#cfunc global GdipPathIterNextSubpathPath "GdipPathIterNextSubpathPath" intptr, var, intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipPathIterRewind(winmdroot.Graphics.GdiPlus.GpPathIterator* iterator)
#cfunc global GdipPathIterRewind "GdipPathIterRewind" intptr

; winmdroot.Graphics.GdiPlus.Status GdipPlayMetafileRecord(winmdroot.Graphics.GdiPlus.GpMetafile* metafile, winmdroot.Graphics.GdiPlus.EmfPlusRecordType recordType, uint flags, uint dataSize, byte* data)
#cfunc global GdipPlayMetafileRecord "GdipPlayMetafileRecord" intptr, int, int, int, var

; winmdroot.Graphics.GdiPlus.Status GdipPrivateAddFontFile(winmdroot.Graphics.GdiPlus.GpFontCollection* fontCollection, winmdroot.Foundation.PCWSTR filename)
#cfunc global GdipPrivateAddFontFile "GdipPrivateAddFontFile" intptr, wstr

; winmdroot.Graphics.GdiPlus.Status GdipPrivateAddMemoryFont(winmdroot.Graphics.GdiPlus.GpFontCollection* fontCollection, void* memory, int length)
#cfunc global GdipPrivateAddMemoryFont "GdipPrivateAddMemoryFont" intptr, intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipRecordMetafile(winmdroot.Graphics.Gdi.HDC referenceHdc, winmdroot.Graphics.GdiPlus.EmfType type, winmdroot.Graphics.GdiPlus.RectF* frameRect, winmdroot.Graphics.GdiPlus.MetafileFrameUnit frameUnit, winmdroot.Foundation.PCWSTR description, winmdroot.Graphics.GdiPlus.GpMetafile** metafile)
#cfunc global GdipRecordMetafile "GdipRecordMetafile" intptr, int, var, int, wstr, var

; winmdroot.Graphics.GdiPlus.Status GdipRecordMetafileFileName(winmdroot.Foundation.PCWSTR fileName, winmdroot.Graphics.Gdi.HDC referenceHdc, winmdroot.Graphics.GdiPlus.EmfType type, winmdroot.Graphics.GdiPlus.RectF* frameRect, winmdroot.Graphics.GdiPlus.MetafileFrameUnit frameUnit, winmdroot.Foundation.PCWSTR description, winmdroot.Graphics.GdiPlus.GpMetafile** metafile)
#cfunc global GdipRecordMetafileFileName "GdipRecordMetafileFileName" wstr, intptr, int, var, int, wstr, var

; winmdroot.Graphics.GdiPlus.Status GdipRecordMetafileFileNameI(winmdroot.Foundation.PCWSTR fileName, winmdroot.Graphics.Gdi.HDC referenceHdc, winmdroot.Graphics.GdiPlus.EmfType type, winmdroot.Graphics.GdiPlus.Rect* frameRect, winmdroot.Graphics.GdiPlus.MetafileFrameUnit frameUnit, winmdroot.Foundation.PCWSTR description, winmdroot.Graphics.GdiPlus.GpMetafile** metafile)
#cfunc global GdipRecordMetafileFileNameI "GdipRecordMetafileFileNameI" wstr, intptr, int, var, int, wstr, var

; winmdroot.Graphics.GdiPlus.Status GdipRecordMetafileI(winmdroot.Graphics.Gdi.HDC referenceHdc, winmdroot.Graphics.GdiPlus.EmfType type, winmdroot.Graphics.GdiPlus.Rect* frameRect, winmdroot.Graphics.GdiPlus.MetafileFrameUnit frameUnit, winmdroot.Foundation.PCWSTR description, winmdroot.Graphics.GdiPlus.GpMetafile** metafile)
#cfunc global GdipRecordMetafileI "GdipRecordMetafileI" intptr, int, var, int, wstr, var

; winmdroot.Graphics.GdiPlus.Status GdipRecordMetafileStream(winmdroot.System.Com.IStream* stream, winmdroot.Graphics.Gdi.HDC referenceHdc, winmdroot.Graphics.GdiPlus.EmfType type, winmdroot.Graphics.GdiPlus.RectF* frameRect, winmdroot.Graphics.GdiPlus.MetafileFrameUnit frameUnit, winmdroot.Foundation.PCWSTR description, winmdroot.Graphics.GdiPlus.GpMetafile** metafile)
#cfunc global GdipRecordMetafileStream "GdipRecordMetafileStream" var, intptr, int, var, int, wstr, var

; winmdroot.Graphics.GdiPlus.Status GdipRecordMetafileStreamI(winmdroot.System.Com.IStream* stream, winmdroot.Graphics.Gdi.HDC referenceHdc, winmdroot.Graphics.GdiPlus.EmfType type, winmdroot.Graphics.GdiPlus.Rect* frameRect, winmdroot.Graphics.GdiPlus.MetafileFrameUnit frameUnit, winmdroot.Foundation.PCWSTR description, winmdroot.Graphics.GdiPlus.GpMetafile** metafile)
#cfunc global GdipRecordMetafileStreamI "GdipRecordMetafileStreamI" var, intptr, int, var, int, wstr, var

; winmdroot.Graphics.GdiPlus.Status GdipReleaseDC(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global GdipReleaseDC "GdipReleaseDC" intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipRemovePropertyItem(winmdroot.Graphics.GdiPlus.GpImage* image, uint propId)
#cfunc global GdipRemovePropertyItem "GdipRemovePropertyItem" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipResetClip(winmdroot.Graphics.GdiPlus.GpGraphics* graphics)
#cfunc global GdipResetClip "GdipResetClip" intptr

; winmdroot.Graphics.GdiPlus.Status GdipResetImageAttributes(winmdroot.Graphics.GdiPlus.GpImageAttributes* imageattr, winmdroot.Graphics.GdiPlus.ColorAdjustType type)
#cfunc global GdipResetImageAttributes "GdipResetImageAttributes" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipResetLineTransform(winmdroot.Graphics.GdiPlus.GpLineGradient* brush)
#cfunc global GdipResetLineTransform "GdipResetLineTransform" intptr

; winmdroot.Graphics.GdiPlus.Status GdipResetPageTransform(winmdroot.Graphics.GdiPlus.GpGraphics* graphics)
#cfunc global GdipResetPageTransform "GdipResetPageTransform" intptr

; winmdroot.Graphics.GdiPlus.Status GdipResetPath(winmdroot.Graphics.GdiPlus.GpPath* path)
#cfunc global GdipResetPath "GdipResetPath" intptr

; winmdroot.Graphics.GdiPlus.Status GdipResetPathGradientTransform(winmdroot.Graphics.GdiPlus.GpPathGradient* brush)
#cfunc global GdipResetPathGradientTransform "GdipResetPathGradientTransform" intptr

; winmdroot.Graphics.GdiPlus.Status GdipResetPenTransform(winmdroot.Graphics.GdiPlus.GpPen* pen)
#cfunc global GdipResetPenTransform "GdipResetPenTransform" intptr

; winmdroot.Graphics.GdiPlus.Status GdipResetTextureTransform(winmdroot.Graphics.GdiPlus.GpTexture* brush)
#cfunc global GdipResetTextureTransform "GdipResetTextureTransform" intptr

; winmdroot.Graphics.GdiPlus.Status GdipResetWorldTransform(winmdroot.Graphics.GdiPlus.GpGraphics* graphics)
#cfunc global GdipResetWorldTransform "GdipResetWorldTransform" intptr

; winmdroot.Graphics.GdiPlus.Status GdipRestoreGraphics(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, uint state)
#cfunc global GdipRestoreGraphics "GdipRestoreGraphics" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipReversePath(winmdroot.Graphics.GdiPlus.GpPath* path)
#cfunc global GdipReversePath "GdipReversePath" intptr

; winmdroot.Graphics.GdiPlus.Status GdipRotateLineTransform(winmdroot.Graphics.GdiPlus.GpLineGradient* brush, float angle, winmdroot.Graphics.GdiPlus.MatrixOrder order)
#cfunc global GdipRotateLineTransform "GdipRotateLineTransform" intptr, float, int

; winmdroot.Graphics.GdiPlus.Status GdipRotateMatrix(winmdroot.Graphics.GdiPlus.Matrix* matrix, float angle, winmdroot.Graphics.GdiPlus.MatrixOrder order)
#cfunc global GdipRotateMatrix "GdipRotateMatrix" intptr, float, int

; winmdroot.Graphics.GdiPlus.Status GdipRotatePathGradientTransform(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, float angle, winmdroot.Graphics.GdiPlus.MatrixOrder order)
#cfunc global GdipRotatePathGradientTransform "GdipRotatePathGradientTransform" intptr, float, int

; winmdroot.Graphics.GdiPlus.Status GdipRotatePenTransform(winmdroot.Graphics.GdiPlus.GpPen* pen, float angle, winmdroot.Graphics.GdiPlus.MatrixOrder order)
#cfunc global GdipRotatePenTransform "GdipRotatePenTransform" intptr, float, int

; winmdroot.Graphics.GdiPlus.Status GdipRotateTextureTransform(winmdroot.Graphics.GdiPlus.GpTexture* brush, float angle, winmdroot.Graphics.GdiPlus.MatrixOrder order)
#cfunc global GdipRotateTextureTransform "GdipRotateTextureTransform" intptr, float, int

; winmdroot.Graphics.GdiPlus.Status GdipRotateWorldTransform(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, float angle, winmdroot.Graphics.GdiPlus.MatrixOrder order)
#cfunc global GdipRotateWorldTransform "GdipRotateWorldTransform" intptr, float, int

; winmdroot.Graphics.GdiPlus.Status GdipSaveAdd(winmdroot.Graphics.GdiPlus.GpImage* image, winmdroot.Graphics.GdiPlus.EncoderParameters* encoderParams)
#cfunc global GdipSaveAdd "GdipSaveAdd" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipSaveAddImage(winmdroot.Graphics.GdiPlus.GpImage* image, winmdroot.Graphics.GdiPlus.GpImage* newImage, winmdroot.Graphics.GdiPlus.EncoderParameters* encoderParams)
#cfunc global GdipSaveAddImage "GdipSaveAddImage" intptr, intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipSaveGraphics(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, uint* state)
#cfunc global GdipSaveGraphics "GdipSaveGraphics" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipSaveImageToFile(winmdroot.Graphics.GdiPlus.GpImage* image, winmdroot.Foundation.PCWSTR filename, global::System.Guid* clsidEncoder, winmdroot.Graphics.GdiPlus.EncoderParameters* encoderParams)
#cfunc global GdipSaveImageToFile "GdipSaveImageToFile" intptr, wstr, var, var

; winmdroot.Graphics.GdiPlus.Status GdipSaveImageToStream(winmdroot.Graphics.GdiPlus.GpImage* image, winmdroot.System.Com.IStream* stream, global::System.Guid* clsidEncoder, winmdroot.Graphics.GdiPlus.EncoderParameters* encoderParams)
#cfunc global GdipSaveImageToStream "GdipSaveImageToStream" intptr, var, var, var

; winmdroot.Graphics.GdiPlus.Status GdipScaleLineTransform(winmdroot.Graphics.GdiPlus.GpLineGradient* brush, float sx, float sy, winmdroot.Graphics.GdiPlus.MatrixOrder order)
#cfunc global GdipScaleLineTransform "GdipScaleLineTransform" intptr, float, float, int

; winmdroot.Graphics.GdiPlus.Status GdipScaleMatrix(winmdroot.Graphics.GdiPlus.Matrix* matrix, float scaleX, float scaleY, winmdroot.Graphics.GdiPlus.MatrixOrder order)
#cfunc global GdipScaleMatrix "GdipScaleMatrix" intptr, float, float, int

; winmdroot.Graphics.GdiPlus.Status GdipScalePathGradientTransform(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, float sx, float sy, winmdroot.Graphics.GdiPlus.MatrixOrder order)
#cfunc global GdipScalePathGradientTransform "GdipScalePathGradientTransform" intptr, float, float, int

; winmdroot.Graphics.GdiPlus.Status GdipScalePenTransform(winmdroot.Graphics.GdiPlus.GpPen* pen, float sx, float sy, winmdroot.Graphics.GdiPlus.MatrixOrder order)
#cfunc global GdipScalePenTransform "GdipScalePenTransform" intptr, float, float, int

; winmdroot.Graphics.GdiPlus.Status GdipScaleTextureTransform(winmdroot.Graphics.GdiPlus.GpTexture* brush, float sx, float sy, winmdroot.Graphics.GdiPlus.MatrixOrder order)
#cfunc global GdipScaleTextureTransform "GdipScaleTextureTransform" intptr, float, float, int

; winmdroot.Graphics.GdiPlus.Status GdipScaleWorldTransform(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, float sx, float sy, winmdroot.Graphics.GdiPlus.MatrixOrder order)
#cfunc global GdipScaleWorldTransform "GdipScaleWorldTransform" intptr, float, float, int

; winmdroot.Graphics.GdiPlus.Status GdipSetAdjustableArrowCapFillState(winmdroot.Graphics.GdiPlus.GpAdjustableArrowCap* cap, winmdroot.Foundation.BOOL fillState)
#cfunc global GdipSetAdjustableArrowCapFillState "GdipSetAdjustableArrowCapFillState" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetAdjustableArrowCapHeight(winmdroot.Graphics.GdiPlus.GpAdjustableArrowCap* cap, float height)
#cfunc global GdipSetAdjustableArrowCapHeight "GdipSetAdjustableArrowCapHeight" intptr, float

; winmdroot.Graphics.GdiPlus.Status GdipSetAdjustableArrowCapMiddleInset(winmdroot.Graphics.GdiPlus.GpAdjustableArrowCap* cap, float middleInset)
#cfunc global GdipSetAdjustableArrowCapMiddleInset "GdipSetAdjustableArrowCapMiddleInset" intptr, float

; winmdroot.Graphics.GdiPlus.Status GdipSetAdjustableArrowCapWidth(winmdroot.Graphics.GdiPlus.GpAdjustableArrowCap* cap, float width)
#cfunc global GdipSetAdjustableArrowCapWidth "GdipSetAdjustableArrowCapWidth" intptr, float

; winmdroot.Graphics.GdiPlus.Status GdipSetClipGraphics(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpGraphics* srcgraphics, winmdroot.Graphics.GdiPlus.CombineMode combineMode)
#cfunc global GdipSetClipGraphics "GdipSetClipGraphics" intptr, intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetClipHrgn(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.Gdi.HRGN hRgn, winmdroot.Graphics.GdiPlus.CombineMode combineMode)
#cfunc global GdipSetClipHrgn "GdipSetClipHrgn" intptr, intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetClipPath(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.CombineMode combineMode)
#cfunc global GdipSetClipPath "GdipSetClipPath" intptr, intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetClipRect(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, float x, float y, float width, float height, winmdroot.Graphics.GdiPlus.CombineMode combineMode)
#cfunc global GdipSetClipRect "GdipSetClipRect" intptr, float, float, float, float, int

; winmdroot.Graphics.GdiPlus.Status GdipSetClipRectI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, int x, int y, int width, int height, winmdroot.Graphics.GdiPlus.CombineMode combineMode)
#cfunc global GdipSetClipRectI "GdipSetClipRectI" intptr, int, int, int, int, int

; winmdroot.Graphics.GdiPlus.Status GdipSetClipRegion(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.GpRegion* region, winmdroot.Graphics.GdiPlus.CombineMode combineMode)
#cfunc global GdipSetClipRegion "GdipSetClipRegion" intptr, intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetCompositingMode(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.CompositingMode compositingMode)
#cfunc global GdipSetCompositingMode "GdipSetCompositingMode" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetCompositingQuality(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.CompositingQuality compositingQuality)
#cfunc global GdipSetCompositingQuality "GdipSetCompositingQuality" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetCustomLineCapBaseCap(winmdroot.Graphics.GdiPlus.GpCustomLineCap* customCap, winmdroot.Graphics.GdiPlus.LineCap baseCap)
#cfunc global GdipSetCustomLineCapBaseCap "GdipSetCustomLineCapBaseCap" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetCustomLineCapBaseInset(winmdroot.Graphics.GdiPlus.GpCustomLineCap* customCap, float inset)
#cfunc global GdipSetCustomLineCapBaseInset "GdipSetCustomLineCapBaseInset" intptr, float

; winmdroot.Graphics.GdiPlus.Status GdipSetCustomLineCapStrokeCaps(winmdroot.Graphics.GdiPlus.GpCustomLineCap* customCap, winmdroot.Graphics.GdiPlus.LineCap startCap, winmdroot.Graphics.GdiPlus.LineCap endCap)
#cfunc global GdipSetCustomLineCapStrokeCaps "GdipSetCustomLineCapStrokeCaps" intptr, int, int

; winmdroot.Graphics.GdiPlus.Status GdipSetCustomLineCapStrokeJoin(winmdroot.Graphics.GdiPlus.GpCustomLineCap* customCap, winmdroot.Graphics.GdiPlus.LineJoin lineJoin)
#cfunc global GdipSetCustomLineCapStrokeJoin "GdipSetCustomLineCapStrokeJoin" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetCustomLineCapWidthScale(winmdroot.Graphics.GdiPlus.GpCustomLineCap* customCap, float widthScale)
#cfunc global GdipSetCustomLineCapWidthScale "GdipSetCustomLineCapWidthScale" intptr, float

; winmdroot.Graphics.GdiPlus.Status GdipSetEffectParameters(winmdroot.Graphics.GdiPlus.CGpEffect* effect, void* @params, uint size)
#cfunc global GdipSetEffectParameters "GdipSetEffectParameters" intptr, int, int

; winmdroot.Graphics.GdiPlus.Status GdipSetEmpty(winmdroot.Graphics.GdiPlus.GpRegion* region)
#cfunc global GdipSetEmpty "GdipSetEmpty" intptr

; winmdroot.Graphics.GdiPlus.Status GdipSetImageAttributesCachedBackground(winmdroot.Graphics.GdiPlus.GpImageAttributes* imageattr, winmdroot.Foundation.BOOL enableFlag)
#cfunc global GdipSetImageAttributesCachedBackground "GdipSetImageAttributesCachedBackground" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetImageAttributesColorKeys(winmdroot.Graphics.GdiPlus.GpImageAttributes* imageattr, winmdroot.Graphics.GdiPlus.ColorAdjustType type, winmdroot.Foundation.BOOL enableFlag, uint colorLow, uint colorHigh)
#cfunc global GdipSetImageAttributesColorKeys "GdipSetImageAttributesColorKeys" intptr, int, int, int, int

; winmdroot.Graphics.GdiPlus.Status GdipSetImageAttributesColorMatrix(winmdroot.Graphics.GdiPlus.GpImageAttributes* imageattr, winmdroot.Graphics.GdiPlus.ColorAdjustType type, winmdroot.Foundation.BOOL enableFlag, winmdroot.Graphics.GdiPlus.ColorMatrix* colorMatrix, winmdroot.Graphics.GdiPlus.ColorMatrix* grayMatrix, winmdroot.Graphics.GdiPlus.ColorMatrixFlags flags)
#cfunc global GdipSetImageAttributesColorMatrix "GdipSetImageAttributesColorMatrix" intptr, int, int, var, var, int

; winmdroot.Graphics.GdiPlus.Status GdipSetImageAttributesGamma(winmdroot.Graphics.GdiPlus.GpImageAttributes* imageattr, winmdroot.Graphics.GdiPlus.ColorAdjustType type, winmdroot.Foundation.BOOL enableFlag, float gamma)
#cfunc global GdipSetImageAttributesGamma "GdipSetImageAttributesGamma" intptr, int, int, float

; winmdroot.Graphics.GdiPlus.Status GdipSetImageAttributesNoOp(winmdroot.Graphics.GdiPlus.GpImageAttributes* imageattr, winmdroot.Graphics.GdiPlus.ColorAdjustType type, winmdroot.Foundation.BOOL enableFlag)
#cfunc global GdipSetImageAttributesNoOp "GdipSetImageAttributesNoOp" intptr, int, int

; winmdroot.Graphics.GdiPlus.Status GdipSetImageAttributesOutputChannel(winmdroot.Graphics.GdiPlus.GpImageAttributes* imageattr, winmdroot.Graphics.GdiPlus.ColorAdjustType type, winmdroot.Foundation.BOOL enableFlag, winmdroot.Graphics.GdiPlus.ColorChannelFlags channelFlags)
#cfunc global GdipSetImageAttributesOutputChannel "GdipSetImageAttributesOutputChannel" intptr, int, int, int

; winmdroot.Graphics.GdiPlus.Status GdipSetImageAttributesOutputChannelColorProfile(winmdroot.Graphics.GdiPlus.GpImageAttributes* imageattr, winmdroot.Graphics.GdiPlus.ColorAdjustType type, winmdroot.Foundation.BOOL enableFlag, winmdroot.Foundation.PCWSTR colorProfileFilename)
#cfunc global GdipSetImageAttributesOutputChannelColorProfile "GdipSetImageAttributesOutputChannelColorProfile" intptr, int, int, wstr

; winmdroot.Graphics.GdiPlus.Status GdipSetImageAttributesRemapTable(winmdroot.Graphics.GdiPlus.GpImageAttributes* imageattr, winmdroot.Graphics.GdiPlus.ColorAdjustType type, winmdroot.Foundation.BOOL enableFlag, uint mapSize, winmdroot.Graphics.GdiPlus.ColorMap* map)
#cfunc global GdipSetImageAttributesRemapTable "GdipSetImageAttributesRemapTable" intptr, int, int, int, var

; winmdroot.Graphics.GdiPlus.Status GdipSetImageAttributesThreshold(winmdroot.Graphics.GdiPlus.GpImageAttributes* imageattr, winmdroot.Graphics.GdiPlus.ColorAdjustType type, winmdroot.Foundation.BOOL enableFlag, float threshold)
#cfunc global GdipSetImageAttributesThreshold "GdipSetImageAttributesThreshold" intptr, int, int, float

; winmdroot.Graphics.GdiPlus.Status GdipSetImageAttributesToIdentity(winmdroot.Graphics.GdiPlus.GpImageAttributes* imageattr, winmdroot.Graphics.GdiPlus.ColorAdjustType type)
#cfunc global GdipSetImageAttributesToIdentity "GdipSetImageAttributesToIdentity" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetImageAttributesWrapMode(winmdroot.Graphics.GdiPlus.GpImageAttributes* imageAttr, winmdroot.Graphics.GdiPlus.WrapMode wrap, uint argb, winmdroot.Foundation.BOOL clamp)
#cfunc global GdipSetImageAttributesWrapMode "GdipSetImageAttributesWrapMode" intptr, int, int, int

; winmdroot.Graphics.GdiPlus.Status GdipSetImagePalette(winmdroot.Graphics.GdiPlus.GpImage* image, winmdroot.Graphics.GdiPlus.ColorPalette* palette)
#cfunc global GdipSetImagePalette "GdipSetImagePalette" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipSetInfinite(winmdroot.Graphics.GdiPlus.GpRegion* region)
#cfunc global GdipSetInfinite "GdipSetInfinite" intptr

; winmdroot.Graphics.GdiPlus.Status GdipSetInterpolationMode(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.InterpolationMode interpolationMode)
#cfunc global GdipSetInterpolationMode "GdipSetInterpolationMode" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetLineBlend(winmdroot.Graphics.GdiPlus.GpLineGradient* brush, float* blend, float* positions, int count)
#cfunc global GdipSetLineBlend "GdipSetLineBlend" intptr, var, var, int

; winmdroot.Graphics.GdiPlus.Status GdipSetLineColors(winmdroot.Graphics.GdiPlus.GpLineGradient* brush, uint color1, uint color2)
#cfunc global GdipSetLineColors "GdipSetLineColors" intptr, int, int

; winmdroot.Graphics.GdiPlus.Status GdipSetLineGammaCorrection(winmdroot.Graphics.GdiPlus.GpLineGradient* brush, winmdroot.Foundation.BOOL useGammaCorrection)
#cfunc global GdipSetLineGammaCorrection "GdipSetLineGammaCorrection" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetLineLinearBlend(winmdroot.Graphics.GdiPlus.GpLineGradient* brush, float focus, float scale)
#cfunc global GdipSetLineLinearBlend "GdipSetLineLinearBlend" intptr, float, float

; winmdroot.Graphics.GdiPlus.Status GdipSetLinePresetBlend(winmdroot.Graphics.GdiPlus.GpLineGradient* brush, uint* blend, float* positions, int count)
#cfunc global GdipSetLinePresetBlend "GdipSetLinePresetBlend" intptr, var, var, int

; winmdroot.Graphics.GdiPlus.Status GdipSetLineSigmaBlend(winmdroot.Graphics.GdiPlus.GpLineGradient* brush, float focus, float scale)
#cfunc global GdipSetLineSigmaBlend "GdipSetLineSigmaBlend" intptr, float, float

; winmdroot.Graphics.GdiPlus.Status GdipSetLineTransform(winmdroot.Graphics.GdiPlus.GpLineGradient* brush, winmdroot.Graphics.GdiPlus.Matrix* matrix)
#cfunc global GdipSetLineTransform "GdipSetLineTransform" intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipSetLineWrapMode(winmdroot.Graphics.GdiPlus.GpLineGradient* brush, winmdroot.Graphics.GdiPlus.WrapMode wrapmode)
#cfunc global GdipSetLineWrapMode "GdipSetLineWrapMode" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetMatrixElements(winmdroot.Graphics.GdiPlus.Matrix* matrix, float m11, float m12, float m21, float m22, float dx, float dy)
#cfunc global GdipSetMatrixElements "GdipSetMatrixElements" intptr, float, float, float, float, float, float

; winmdroot.Graphics.GdiPlus.Status GdipSetMetafileDownLevelRasterizationLimit(winmdroot.Graphics.GdiPlus.GpMetafile* metafile, uint metafileRasterizationLimitDpi)
#cfunc global GdipSetMetafileDownLevelRasterizationLimit "GdipSetMetafileDownLevelRasterizationLimit" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetPageScale(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, float scale)
#cfunc global GdipSetPageScale "GdipSetPageScale" intptr, float

; winmdroot.Graphics.GdiPlus.Status GdipSetPageUnit(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.Unit unit)
#cfunc global GdipSetPageUnit "GdipSetPageUnit" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetPathFillMode(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.FillMode fillmode)
#cfunc global GdipSetPathFillMode "GdipSetPathFillMode" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetPathGradientBlend(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, float* blend, float* positions, int count)
#cfunc global GdipSetPathGradientBlend "GdipSetPathGradientBlend" intptr, var, var, int

; winmdroot.Graphics.GdiPlus.Status GdipSetPathGradientCenterColor(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, uint colors)
#cfunc global GdipSetPathGradientCenterColor "GdipSetPathGradientCenterColor" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetPathGradientCenterPoint(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, winmdroot.Graphics.GdiPlus.PointF* points)
#cfunc global GdipSetPathGradientCenterPoint "GdipSetPathGradientCenterPoint" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipSetPathGradientCenterPointI(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, winmdroot.Graphics.GdiPlus.Point* points)
#cfunc global GdipSetPathGradientCenterPointI "GdipSetPathGradientCenterPointI" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipSetPathGradientFocusScales(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, float xScale, float yScale)
#cfunc global GdipSetPathGradientFocusScales "GdipSetPathGradientFocusScales" intptr, float, float

; winmdroot.Graphics.GdiPlus.Status GdipSetPathGradientGammaCorrection(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, winmdroot.Foundation.BOOL useGammaCorrection)
#cfunc global GdipSetPathGradientGammaCorrection "GdipSetPathGradientGammaCorrection" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetPathGradientLinearBlend(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, float focus, float scale)
#cfunc global GdipSetPathGradientLinearBlend "GdipSetPathGradientLinearBlend" intptr, float, float

; winmdroot.Graphics.GdiPlus.Status GdipSetPathGradientPath(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, winmdroot.Graphics.GdiPlus.GpPath* path)
#cfunc global GdipSetPathGradientPath "GdipSetPathGradientPath" intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipSetPathGradientPresetBlend(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, uint* blend, float* positions, int count)
#cfunc global GdipSetPathGradientPresetBlend "GdipSetPathGradientPresetBlend" intptr, var, var, int

; winmdroot.Graphics.GdiPlus.Status GdipSetPathGradientSigmaBlend(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, float focus, float scale)
#cfunc global GdipSetPathGradientSigmaBlend "GdipSetPathGradientSigmaBlend" intptr, float, float

; winmdroot.Graphics.GdiPlus.Status GdipSetPathGradientSurroundColorsWithCount(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, uint* color, int* count)
#cfunc global GdipSetPathGradientSurroundColorsWithCount "GdipSetPathGradientSurroundColorsWithCount" intptr, var, var

; winmdroot.Graphics.GdiPlus.Status GdipSetPathGradientTransform(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, winmdroot.Graphics.GdiPlus.Matrix* matrix)
#cfunc global GdipSetPathGradientTransform "GdipSetPathGradientTransform" intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipSetPathGradientWrapMode(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, winmdroot.Graphics.GdiPlus.WrapMode wrapmode)
#cfunc global GdipSetPathGradientWrapMode "GdipSetPathGradientWrapMode" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetPathMarker(winmdroot.Graphics.GdiPlus.GpPath* path)
#cfunc global GdipSetPathMarker "GdipSetPathMarker" intptr

; winmdroot.Graphics.GdiPlus.Status GdipSetPenBrushFill(winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.GpBrush* brush)
#cfunc global GdipSetPenBrushFill "GdipSetPenBrushFill" intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipSetPenColor(winmdroot.Graphics.GdiPlus.GpPen* pen, uint argb)
#cfunc global GdipSetPenColor "GdipSetPenColor" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetPenCompoundArray(winmdroot.Graphics.GdiPlus.GpPen* pen, float* dash, int count)
#cfunc global GdipSetPenCompoundArray "GdipSetPenCompoundArray" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipSetPenCustomEndCap(winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.GpCustomLineCap* customCap)
#cfunc global GdipSetPenCustomEndCap "GdipSetPenCustomEndCap" intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipSetPenCustomStartCap(winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.GpCustomLineCap* customCap)
#cfunc global GdipSetPenCustomStartCap "GdipSetPenCustomStartCap" intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipSetPenDashArray(winmdroot.Graphics.GdiPlus.GpPen* pen, float* dash, int count)
#cfunc global GdipSetPenDashArray "GdipSetPenDashArray" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipSetPenDashCap197819(winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.DashCap dashCap)
#cfunc global GdipSetPenDashCap197819 "GdipSetPenDashCap197819" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetPenDashOffset(winmdroot.Graphics.GdiPlus.GpPen* pen, float offset)
#cfunc global GdipSetPenDashOffset "GdipSetPenDashOffset" intptr, float

; winmdroot.Graphics.GdiPlus.Status GdipSetPenDashStyle(winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.DashStyle dashstyle)
#cfunc global GdipSetPenDashStyle "GdipSetPenDashStyle" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetPenEndCap(winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.LineCap endCap)
#cfunc global GdipSetPenEndCap "GdipSetPenEndCap" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetPenLineCap197819(winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.LineCap startCap, winmdroot.Graphics.GdiPlus.LineCap endCap, winmdroot.Graphics.GdiPlus.DashCap dashCap)
#cfunc global GdipSetPenLineCap197819 "GdipSetPenLineCap197819" intptr, int, int, int

; winmdroot.Graphics.GdiPlus.Status GdipSetPenLineJoin(winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.LineJoin lineJoin)
#cfunc global GdipSetPenLineJoin "GdipSetPenLineJoin" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetPenMiterLimit(winmdroot.Graphics.GdiPlus.GpPen* pen, float miterLimit)
#cfunc global GdipSetPenMiterLimit "GdipSetPenMiterLimit" intptr, float

; winmdroot.Graphics.GdiPlus.Status GdipSetPenMode(winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.PenAlignment penMode)
#cfunc global GdipSetPenMode "GdipSetPenMode" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetPenStartCap(winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.LineCap startCap)
#cfunc global GdipSetPenStartCap "GdipSetPenStartCap" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetPenTransform(winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.Matrix* matrix)
#cfunc global GdipSetPenTransform "GdipSetPenTransform" intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipSetPenUnit(winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.Unit unit)
#cfunc global GdipSetPenUnit "GdipSetPenUnit" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetPenWidth(winmdroot.Graphics.GdiPlus.GpPen* pen, float width)
#cfunc global GdipSetPenWidth "GdipSetPenWidth" intptr, float

; winmdroot.Graphics.GdiPlus.Status GdipSetPixelOffsetMode(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.PixelOffsetMode pixelOffsetMode)
#cfunc global GdipSetPixelOffsetMode "GdipSetPixelOffsetMode" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetPropertyItem(winmdroot.Graphics.GdiPlus.GpImage* image, winmdroot.Graphics.GdiPlus.PropertyItem* item)
#cfunc global GdipSetPropertyItem "GdipSetPropertyItem" intptr, var

; winmdroot.Graphics.GdiPlus.Status GdipSetRenderingOrigin(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, int x, int y)
#cfunc global GdipSetRenderingOrigin "GdipSetRenderingOrigin" intptr, int, int

; winmdroot.Graphics.GdiPlus.Status GdipSetSmoothingMode(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.SmoothingMode smoothingMode)
#cfunc global GdipSetSmoothingMode "GdipSetSmoothingMode" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetSolidFillColor(winmdroot.Graphics.GdiPlus.GpSolidFill* brush, uint color)
#cfunc global GdipSetSolidFillColor "GdipSetSolidFillColor" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetStringFormatAlign(winmdroot.Graphics.GdiPlus.GpStringFormat* format, winmdroot.Graphics.GdiPlus.StringAlignment align)
#cfunc global GdipSetStringFormatAlign "GdipSetStringFormatAlign" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetStringFormatDigitSubstitution(winmdroot.Graphics.GdiPlus.GpStringFormat* format, ushort language, winmdroot.Graphics.GdiPlus.StringDigitSubstitute substitute)
#cfunc global GdipSetStringFormatDigitSubstitution "GdipSetStringFormatDigitSubstitution" intptr, int, int

; winmdroot.Graphics.GdiPlus.Status GdipSetStringFormatFlags(winmdroot.Graphics.GdiPlus.GpStringFormat* format, int flags)
#cfunc global GdipSetStringFormatFlags "GdipSetStringFormatFlags" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetStringFormatHotkeyPrefix(winmdroot.Graphics.GdiPlus.GpStringFormat* format, int hotkeyPrefix)
#cfunc global GdipSetStringFormatHotkeyPrefix "GdipSetStringFormatHotkeyPrefix" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetStringFormatLineAlign(winmdroot.Graphics.GdiPlus.GpStringFormat* format, winmdroot.Graphics.GdiPlus.StringAlignment align)
#cfunc global GdipSetStringFormatLineAlign "GdipSetStringFormatLineAlign" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetStringFormatMeasurableCharacterRanges(winmdroot.Graphics.GdiPlus.GpStringFormat* format, int rangeCount, winmdroot.Graphics.GdiPlus.CharacterRange* ranges)
#cfunc global GdipSetStringFormatMeasurableCharacterRanges "GdipSetStringFormatMeasurableCharacterRanges" intptr, int, var

; winmdroot.Graphics.GdiPlus.Status GdipSetStringFormatTabStops(winmdroot.Graphics.GdiPlus.GpStringFormat* format, float firstTabOffset, int count, float* tabStops)
#cfunc global GdipSetStringFormatTabStops "GdipSetStringFormatTabStops" intptr, float, int, var

; winmdroot.Graphics.GdiPlus.Status GdipSetStringFormatTrimming(winmdroot.Graphics.GdiPlus.GpStringFormat* format, winmdroot.Graphics.GdiPlus.StringTrimming trimming)
#cfunc global GdipSetStringFormatTrimming "GdipSetStringFormatTrimming" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetTextContrast(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, uint contrast)
#cfunc global GdipSetTextContrast "GdipSetTextContrast" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetTextRenderingHint(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.TextRenderingHint mode)
#cfunc global GdipSetTextRenderingHint "GdipSetTextRenderingHint" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetTextureTransform(winmdroot.Graphics.GdiPlus.GpTexture* brush, winmdroot.Graphics.GdiPlus.Matrix* matrix)
#cfunc global GdipSetTextureTransform "GdipSetTextureTransform" intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipSetTextureWrapMode(winmdroot.Graphics.GdiPlus.GpTexture* brush, winmdroot.Graphics.GdiPlus.WrapMode wrapmode)
#cfunc global GdipSetTextureWrapMode "GdipSetTextureWrapMode" intptr, int

; winmdroot.Graphics.GdiPlus.Status GdipSetWorldTransform(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.Matrix* matrix)
#cfunc global GdipSetWorldTransform "GdipSetWorldTransform" intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipShearMatrix(winmdroot.Graphics.GdiPlus.Matrix* matrix, float shearX, float shearY, winmdroot.Graphics.GdiPlus.MatrixOrder order)
#cfunc global GdipShearMatrix "GdipShearMatrix" intptr, float, float, int

; winmdroot.Graphics.GdiPlus.Status GdipStartPathFigure(winmdroot.Graphics.GdiPlus.GpPath* path)
#cfunc global GdipStartPathFigure "GdipStartPathFigure" intptr

; winmdroot.Graphics.GdiPlus.Status GdipStringFormatGetGenericDefault(winmdroot.Graphics.GdiPlus.GpStringFormat** format)
#cfunc global GdipStringFormatGetGenericDefault "GdipStringFormatGetGenericDefault" var

; winmdroot.Graphics.GdiPlus.Status GdipStringFormatGetGenericTypographic(winmdroot.Graphics.GdiPlus.GpStringFormat** format)
#cfunc global GdipStringFormatGetGenericTypographic "GdipStringFormatGetGenericTypographic" var

; winmdroot.Graphics.GdiPlus.Status GdipTestControl(winmdroot.Graphics.GdiPlus.GpTestControlEnum control, void* param1)
#cfunc global GdipTestControl "GdipTestControl" int, intptr

; winmdroot.Graphics.GdiPlus.Status GdipTransformMatrixPoints(winmdroot.Graphics.GdiPlus.Matrix* matrix, winmdroot.Graphics.GdiPlus.PointF* pts, int count)
#cfunc global GdipTransformMatrixPoints "GdipTransformMatrixPoints" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipTransformMatrixPointsI(winmdroot.Graphics.GdiPlus.Matrix* matrix, winmdroot.Graphics.GdiPlus.Point* pts, int count)
#cfunc global GdipTransformMatrixPointsI "GdipTransformMatrixPointsI" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipTransformPath(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.Matrix* matrix)
#cfunc global GdipTransformPath "GdipTransformPath" intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipTransformPoints(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.CoordinateSpace destSpace, winmdroot.Graphics.GdiPlus.CoordinateSpace srcSpace, winmdroot.Graphics.GdiPlus.PointF* points, int count)
#cfunc global GdipTransformPoints "GdipTransformPoints" intptr, int, int, var, int

; winmdroot.Graphics.GdiPlus.Status GdipTransformPointsI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, winmdroot.Graphics.GdiPlus.CoordinateSpace destSpace, winmdroot.Graphics.GdiPlus.CoordinateSpace srcSpace, winmdroot.Graphics.GdiPlus.Point* points, int count)
#cfunc global GdipTransformPointsI "GdipTransformPointsI" intptr, int, int, var, int

; winmdroot.Graphics.GdiPlus.Status GdipTransformRegion(winmdroot.Graphics.GdiPlus.GpRegion* region, winmdroot.Graphics.GdiPlus.Matrix* matrix)
#cfunc global GdipTransformRegion "GdipTransformRegion" intptr, intptr

; winmdroot.Graphics.GdiPlus.Status GdipTranslateClip(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, float dx, float dy)
#cfunc global GdipTranslateClip "GdipTranslateClip" intptr, float, float

; winmdroot.Graphics.GdiPlus.Status GdipTranslateClipI(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, int dx, int dy)
#cfunc global GdipTranslateClipI "GdipTranslateClipI" intptr, int, int

; winmdroot.Graphics.GdiPlus.Status GdipTranslateLineTransform(winmdroot.Graphics.GdiPlus.GpLineGradient* brush, float dx, float dy, winmdroot.Graphics.GdiPlus.MatrixOrder order)
#cfunc global GdipTranslateLineTransform "GdipTranslateLineTransform" intptr, float, float, int

; winmdroot.Graphics.GdiPlus.Status GdipTranslateMatrix(winmdroot.Graphics.GdiPlus.Matrix* matrix, float offsetX, float offsetY, winmdroot.Graphics.GdiPlus.MatrixOrder order)
#cfunc global GdipTranslateMatrix "GdipTranslateMatrix" intptr, float, float, int

; winmdroot.Graphics.GdiPlus.Status GdipTranslatePathGradientTransform(winmdroot.Graphics.GdiPlus.GpPathGradient* brush, float dx, float dy, winmdroot.Graphics.GdiPlus.MatrixOrder order)
#cfunc global GdipTranslatePathGradientTransform "GdipTranslatePathGradientTransform" intptr, float, float, int

; winmdroot.Graphics.GdiPlus.Status GdipTranslatePenTransform(winmdroot.Graphics.GdiPlus.GpPen* pen, float dx, float dy, winmdroot.Graphics.GdiPlus.MatrixOrder order)
#cfunc global GdipTranslatePenTransform "GdipTranslatePenTransform" intptr, float, float, int

; winmdroot.Graphics.GdiPlus.Status GdipTranslateRegion(winmdroot.Graphics.GdiPlus.GpRegion* region, float dx, float dy)
#cfunc global GdipTranslateRegion "GdipTranslateRegion" intptr, float, float

; winmdroot.Graphics.GdiPlus.Status GdipTranslateRegionI(winmdroot.Graphics.GdiPlus.GpRegion* region, int dx, int dy)
#cfunc global GdipTranslateRegionI "GdipTranslateRegionI" intptr, int, int

; winmdroot.Graphics.GdiPlus.Status GdipTranslateTextureTransform(winmdroot.Graphics.GdiPlus.GpTexture* brush, float dx, float dy, winmdroot.Graphics.GdiPlus.MatrixOrder order)
#cfunc global GdipTranslateTextureTransform "GdipTranslateTextureTransform" intptr, float, float, int

; winmdroot.Graphics.GdiPlus.Status GdipTranslateWorldTransform(winmdroot.Graphics.GdiPlus.GpGraphics* graphics, float dx, float dy, winmdroot.Graphics.GdiPlus.MatrixOrder order)
#cfunc global GdipTranslateWorldTransform "GdipTranslateWorldTransform" intptr, float, float, int

; winmdroot.Graphics.GdiPlus.Status GdipVectorTransformMatrixPoints(winmdroot.Graphics.GdiPlus.Matrix* matrix, winmdroot.Graphics.GdiPlus.PointF* pts, int count)
#cfunc global GdipVectorTransformMatrixPoints "GdipVectorTransformMatrixPoints" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipVectorTransformMatrixPointsI(winmdroot.Graphics.GdiPlus.Matrix* matrix, winmdroot.Graphics.GdiPlus.Point* pts, int count)
#cfunc global GdipVectorTransformMatrixPointsI "GdipVectorTransformMatrixPointsI" intptr, var, int

; winmdroot.Graphics.GdiPlus.Status GdipWarpPath(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.Matrix* matrix, winmdroot.Graphics.GdiPlus.PointF* points, int count, float srcx, float srcy, float srcwidth, float srcheight, winmdroot.Graphics.GdiPlus.WarpMode warpMode, float flatness)
#cfunc global GdipWarpPath "GdipWarpPath" intptr, intptr, var, int, float, float, float, float, int, float

; winmdroot.Graphics.GdiPlus.Status GdipWidenPath(winmdroot.Graphics.GdiPlus.GpPath* nativePath, winmdroot.Graphics.GdiPlus.GpPen* pen, winmdroot.Graphics.GdiPlus.Matrix* matrix, float flatness)
#cfunc global GdipWidenPath "GdipWidenPath" intptr, intptr, intptr, float

; winmdroot.Graphics.GdiPlus.Status GdipWindingModeOutline(winmdroot.Graphics.GdiPlus.GpPath* path, winmdroot.Graphics.GdiPlus.Matrix* matrix, float flatness)
#cfunc global GdipWindingModeOutline "GdipWindingModeOutline" intptr, intptr, float

; winmdroot.Graphics.GdiPlus.Status GdiplusNotificationHook(nuint* token)
#cfunc global GdiplusNotificationHook "GdiplusNotificationHook" var

; void GdiplusNotificationUnhook(nuint token)
#func global GdiplusNotificationUnhook "GdiplusNotificationUnhook" int

; void GdiplusShutdown(nuint token)
#func global GdiplusShutdown "GdiplusShutdown" int

; winmdroot.Graphics.GdiPlus.Status GdiplusStartup(nuint* token, winmdroot.Graphics.GdiPlus.GdiplusStartupInput* input, winmdroot.Graphics.GdiPlus.GdiplusStartupOutput* output)
#cfunc global GdiplusStartup "GdiplusStartup" var, var, var

#endif
