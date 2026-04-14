; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    gdi32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __gdi32_gen2_as__
#define __gdi32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "gdi32.dll"
; winmdroot.Foundation.BOOL DeleteObject(winmdroot.Graphics.Gdi.HGDIOBJ ho)
#cfunc DeleteObject "DeleteObject" intptr

; int AbortDoc(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc AbortDoc "AbortDoc" intptr

; winmdroot.Foundation.BOOL AbortPath(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc AbortPath "AbortPath" intptr

; winmdroot.Foundation.HANDLE AddFontMemResourceEx(void* pFileView, uint cjSize, [Optional] void* pvResrved, uint* pNumFonts)
#cfunc AddFontMemResourceEx "AddFontMemResourceEx" intptr, int, intptr, var

; int AddFontResourceW(winmdroot.Foundation.PCWSTR param0)
#cfunc AddFontResourceW "AddFontResourceW" wstr

; int AddFontResourceExW(winmdroot.Foundation.PCWSTR name, winmdroot.Graphics.Gdi.FONT_RESOURCE_CHARACTERISTICS fl, [Optional] void* res)
#cfunc AddFontResourceExW "AddFontResourceExW" wstr, int, intptr

; winmdroot.Foundation.BOOL AngleArc(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, uint r, float StartAngle, float SweepAngle)
#cfunc AngleArc "AngleArc" intptr, int, int, int, float, float

; winmdroot.Foundation.BOOL AnimatePalette(winmdroot.Graphics.Gdi.HPALETTE hPal, uint iStartIndex, uint cEntries, winmdroot.Graphics.Gdi.PALETTEENTRY* ppe)
#cfunc AnimatePalette "AnimatePalette" intptr, int, int, var

; winmdroot.Foundation.BOOL Arc(winmdroot.Graphics.Gdi.HDC hdc, int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4)
#cfunc Arc "Arc" intptr, int, int, int, int, int, int, int, int

; winmdroot.Foundation.BOOL ArcTo(winmdroot.Graphics.Gdi.HDC hdc, int left, int top, int right, int bottom, int xr1, int yr1, int xr2, int yr2)
#cfunc ArcTo "ArcTo" intptr, int, int, int, int, int, int, int, int

; winmdroot.Foundation.HANDLE BRUSHOBJ_hGetColorTransform(winmdroot.Devices.Display.BRUSHOBJ* pbo)
#cfunc BRUSHOBJ_hGetColorTransform "BRUSHOBJ_hGetColorTransform" var

; void* BRUSHOBJ_pvAllocRbrush(winmdroot.Devices.Display.BRUSHOBJ* pbo, uint cj)
#cfunc BRUSHOBJ_pvAllocRbrush "BRUSHOBJ_pvAllocRbrush" var, int

; void* BRUSHOBJ_pvGetRbrush(winmdroot.Devices.Display.BRUSHOBJ* pbo)
#cfunc BRUSHOBJ_pvGetRbrush "BRUSHOBJ_pvGetRbrush" var

; uint BRUSHOBJ_ulGetBrushColor(winmdroot.Devices.Display.BRUSHOBJ* pbo)
#cfunc BRUSHOBJ_ulGetBrushColor "BRUSHOBJ_ulGetBrushColor" var

; winmdroot.Foundation.BOOL BeginPath(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc BeginPath "BeginPath" intptr

; winmdroot.Foundation.BOOL BitBlt(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, int cx, int cy, winmdroot.Graphics.Gdi.HDC hdcSrc, int x1, int y1, winmdroot.Graphics.Gdi.ROP_CODE rop)
#cfunc BitBlt "BitBlt" intptr, int, int, int, int, intptr, int, int, int

; winmdroot.Foundation.BOOL CLIPOBJ_bEnum(winmdroot.Devices.Display.CLIPOBJ* pco, uint cj, uint* pul)
#cfunc CLIPOBJ_bEnum "CLIPOBJ_bEnum" var, int, var

; uint CLIPOBJ_cEnumStart(winmdroot.Devices.Display.CLIPOBJ* pco, winmdroot.Foundation.BOOL bAll, uint iType, uint iDirection, uint cLimit)
#cfunc CLIPOBJ_cEnumStart "CLIPOBJ_cEnumStart" var, int, int, int, int

; winmdroot.Devices.Display.PATHOBJ* CLIPOBJ_ppoGetPath(winmdroot.Devices.Display.CLIPOBJ* pco)
#cfunc CLIPOBJ_ppoGetPath "CLIPOBJ_ppoGetPath" var

; winmdroot.Foundation.BOOL CancelDC(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc CancelDC "CancelDC" intptr

; winmdroot.Foundation.BOOL CheckColorsInGamut(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.RGBTRIPLE* lpRGBTriple, void* dlpBuffer, uint nCount)
#cfunc CheckColorsInGamut "CheckColorsInGamut" intptr, var, intptr, int

; int ChoosePixelFormat(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.OpenGL.PIXELFORMATDESCRIPTOR* ppfd)
#cfunc ChoosePixelFormat "ChoosePixelFormat" intptr, var

; winmdroot.Foundation.BOOL Chord(winmdroot.Graphics.Gdi.HDC hdc, int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4)
#cfunc Chord "Chord" intptr, int, int, int, int, int, int, int, int

; winmdroot.Foundation.BOOL DeleteEnhMetaFile(winmdroot.Graphics.Gdi.HENHMETAFILE hmf)
#cfunc DeleteEnhMetaFile "DeleteEnhMetaFile" intptr

; winmdroot.Graphics.Gdi.HENHMETAFILE CloseEnhMetaFile(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc CloseEnhMetaFile "CloseEnhMetaFile" intptr

; winmdroot.Foundation.BOOL CloseFigure(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc CloseFigure "CloseFigure" intptr

; winmdroot.Foundation.BOOL DeleteMetaFile(winmdroot.Graphics.Gdi.HMETAFILE hmf)
#cfunc DeleteMetaFile "DeleteMetaFile" intptr

; winmdroot.Graphics.Gdi.HMETAFILE CloseMetaFile(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc CloseMetaFile "CloseMetaFile" intptr

; winmdroot.Foundation.BOOL ColorCorrectPalette(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HPALETTE hPal, uint deFirst, uint num)
#cfunc ColorCorrectPalette "ColorCorrectPalette" intptr, intptr, int, int

; winmdroot.Foundation.BOOL ColorMatchToTarget(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HDC hdcTarget, winmdroot.UI.ColorSystem.COLOR_MATCH_TO_TARGET_ACTION action)
#cfunc ColorMatchToTarget "ColorMatchToTarget" intptr, intptr, int

; winmdroot.Graphics.Gdi.GDI_REGION_TYPE CombineRgn(winmdroot.Graphics.Gdi.HRGN hrgnDst, winmdroot.Graphics.Gdi.HRGN hrgnSrc1, winmdroot.Graphics.Gdi.HRGN hrgnSrc2, winmdroot.Graphics.Gdi.RGN_COMBINE_MODE iMode)
#cfunc CombineRgn "CombineRgn" intptr, intptr, intptr, int

; winmdroot.Foundation.BOOL CombineTransform(winmdroot.Graphics.Gdi.XFORM* lpxfOut, winmdroot.Graphics.Gdi.XFORM* lpxf1, winmdroot.Graphics.Gdi.XFORM* lpxf2)
#cfunc CombineTransform "CombineTransform" var, var, var

; winmdroot.Graphics.Gdi.HENHMETAFILE CopyEnhMetaFileW(winmdroot.Graphics.Gdi.HENHMETAFILE hEnh, winmdroot.Foundation.PCWSTR lpFileName)
#cfunc CopyEnhMetaFileW "CopyEnhMetaFileW" intptr, wstr

; winmdroot.Graphics.Gdi.HMETAFILE CopyMetaFileW(winmdroot.Graphics.Gdi.HMETAFILE param0, winmdroot.Foundation.PCWSTR param1)
#cfunc CopyMetaFileW "CopyMetaFileW" intptr, wstr

; winmdroot.Graphics.Gdi.HBITMAP CreateBitmap(int nWidth, int nHeight, uint nPlanes, uint nBitCount, [Optional] void* lpBits)
#cfunc CreateBitmap "CreateBitmap" int, int, int, int, intptr

; winmdroot.Graphics.Gdi.HBITMAP CreateBitmapIndirect(winmdroot.Graphics.Gdi.BITMAP* pbm)
#cfunc CreateBitmapIndirect "CreateBitmapIndirect" var

; winmdroot.Graphics.Gdi.HBRUSH CreateBrushIndirect(winmdroot.Graphics.Gdi.LOGBRUSH* plbrush)
#cfunc CreateBrushIndirect "CreateBrushIndirect" var

; winmdroot.Foundation.BOOL DeleteColorSpace(winmdroot.UI.ColorSystem.HCOLORSPACE hcs)
#cfunc DeleteColorSpace "DeleteColorSpace" intptr

; winmdroot.UI.ColorSystem.HCOLORSPACE CreateColorSpaceW(winmdroot.UI.ColorSystem.LOGCOLORSPACEW* lplcs)
#cfunc CreateColorSpaceW "CreateColorSpaceW" var

; winmdroot.Graphics.Gdi.HBITMAP CreateCompatibleBitmap(winmdroot.Graphics.Gdi.HDC hdc, int cx, int cy)
#cfunc CreateCompatibleBitmap "CreateCompatibleBitmap" intptr, int, int

; winmdroot.Graphics.Gdi.HDC CreateCompatibleDC(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc CreateCompatibleDC "CreateCompatibleDC" intptr

; winmdroot.Graphics.Gdi.HDC CreateDCA(winmdroot.Foundation.PCSTR pwszDriver, winmdroot.Foundation.PCSTR pwszDevice, winmdroot.Foundation.PCSTR pszPort, [Optional] winmdroot.Graphics.Gdi.DEVMODEA* pdm)
#cfunc CreateDCA "CreateDCA" str, str, str, var

; winmdroot.Graphics.Gdi.HDC CreateDCW(winmdroot.Foundation.PCWSTR pwszDriver, winmdroot.Foundation.PCWSTR pwszDevice, winmdroot.Foundation.PCWSTR pszPort, [Optional] winmdroot.Graphics.Gdi.DEVMODEW* pdm)
#cfunc CreateDCW "CreateDCW" wstr, wstr, wstr, var

; winmdroot.Graphics.Gdi.HBRUSH CreateDIBPatternBrush(winmdroot.Foundation.HGLOBAL h, winmdroot.Graphics.Gdi.DIB_USAGE iUsage)
#cfunc CreateDIBPatternBrush "CreateDIBPatternBrush" int, int

; winmdroot.Graphics.Gdi.HBRUSH CreateDIBPatternBrushPt(void* lpPackedDIB, winmdroot.Graphics.Gdi.DIB_USAGE iUsage)
#cfunc CreateDIBPatternBrushPt "CreateDIBPatternBrushPt" intptr, int

; winmdroot.Graphics.Gdi.HBITMAP CreateDIBSection(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.BITMAPINFO* pbmi, winmdroot.Graphics.Gdi.DIB_USAGE usage, void** ppvBits, winmdroot.Foundation.HANDLE hSection, uint offset)
#cfunc CreateDIBSection "CreateDIBSection" intptr, var, int, var, intptr, int

; winmdroot.Graphics.Gdi.HBITMAP CreateDIBitmap(winmdroot.Graphics.Gdi.HDC hdc, [Optional] winmdroot.Graphics.Gdi.BITMAPINFOHEADER* pbmih, uint flInit, [Optional] void* pjBits, [Optional] winmdroot.Graphics.Gdi.BITMAPINFO* pbmi, winmdroot.Graphics.Gdi.DIB_USAGE iUsage)
#cfunc CreateDIBitmap "CreateDIBitmap" intptr, var, int, intptr, var, int

; winmdroot.Graphics.Gdi.HBITMAP CreateDiscardableBitmap(winmdroot.Graphics.Gdi.HDC hdc, int cx, int cy)
#cfunc CreateDiscardableBitmap "CreateDiscardableBitmap" intptr, int, int

; winmdroot.Graphics.Gdi.HRGN CreateEllipticRgn(int x1, int y1, int x2, int y2)
#cfunc CreateEllipticRgn "CreateEllipticRgn" int, int, int, int

; winmdroot.Graphics.Gdi.HRGN CreateEllipticRgnIndirect(winmdroot.Foundation.RECT* lprect)
#cfunc CreateEllipticRgnIndirect "CreateEllipticRgnIndirect" var

; winmdroot.Graphics.Gdi.HDC CreateEnhMetaFileW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.PCWSTR lpFilename, [Optional] winmdroot.Foundation.RECT* lprc, winmdroot.Foundation.PCWSTR lpDesc)
#cfunc CreateEnhMetaFileW "CreateEnhMetaFileW" intptr, wstr, var, wstr

; winmdroot.Graphics.Gdi.HFONT CreateFontW(int cHeight, int cWidth, int cEscapement, int cOrientation, int cWeight, uint bItalic, uint bUnderline, uint bStrikeOut, uint iCharSet, uint iOutPrecision, uint iClipPrecision, uint iQuality, uint iPitchAndFamily, winmdroot.Foundation.PCWSTR pszFaceName)
#cfunc CreateFontW "CreateFontW" int, int, int, int, int, int, int, int, int, int, int, int, int, wstr

; winmdroot.Graphics.Gdi.HFONT CreateFontIndirectW(winmdroot.Graphics.Gdi.LOGFONTW* lplf)
#cfunc CreateFontIndirectW "CreateFontIndirectW" var

; winmdroot.Graphics.Gdi.HFONT CreateFontIndirectExW(winmdroot.Graphics.Gdi.ENUMLOGFONTEXDVW* param0)
#cfunc CreateFontIndirectExW "CreateFontIndirectExW" var

; winmdroot.Graphics.Gdi.HPALETTE CreateHalftonePalette(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc CreateHalftonePalette "CreateHalftonePalette" intptr

; winmdroot.Graphics.Gdi.HBRUSH CreateHatchBrush(winmdroot.Graphics.Gdi.HATCH_BRUSH_STYLE iHatch, winmdroot.Foundation.COLORREF color)
#cfunc CreateHatchBrush "CreateHatchBrush" int, int

; winmdroot.Graphics.Gdi.HDC CreateICA(winmdroot.Foundation.PCSTR pszDriver, winmdroot.Foundation.PCSTR pszDevice, winmdroot.Foundation.PCSTR pszPort, [Optional] winmdroot.Graphics.Gdi.DEVMODEA* pdm)
#cfunc CreateICA "CreateICA" str, str, str, var

; winmdroot.Graphics.Gdi.HDC CreateICW(winmdroot.Foundation.PCWSTR pszDriver, winmdroot.Foundation.PCWSTR pszDevice, winmdroot.Foundation.PCWSTR pszPort, [Optional] winmdroot.Graphics.Gdi.DEVMODEW* pdm)
#cfunc CreateICW "CreateICW" wstr, wstr, wstr, var

; winmdroot.Graphics.Gdi.HDC CreateMetaFileW(winmdroot.Foundation.PCWSTR pszFile)
#cfunc CreateMetaFileW "CreateMetaFileW" wstr

; winmdroot.Graphics.Gdi.HPALETTE CreatePalette(winmdroot.Graphics.Gdi.LOGPALETTE* plpal)
#cfunc CreatePalette "CreatePalette" var

; winmdroot.Graphics.Gdi.HBRUSH CreatePatternBrush(winmdroot.Graphics.Gdi.HBITMAP hbm)
#cfunc CreatePatternBrush "CreatePatternBrush" intptr

; winmdroot.Graphics.Gdi.HPEN CreatePen(winmdroot.Graphics.Gdi.PEN_STYLE iStyle, int cWidth, winmdroot.Foundation.COLORREF color)
#cfunc CreatePen "CreatePen" int, int, int

; winmdroot.Graphics.Gdi.HPEN CreatePenIndirect(winmdroot.Graphics.Gdi.LOGPEN* plpen)
#cfunc CreatePenIndirect "CreatePenIndirect" var

; winmdroot.Graphics.Gdi.HRGN CreatePolyPolygonRgn(global::System.Drawing.Point* pptl, int* pc, int cPoly, winmdroot.Graphics.Gdi.CREATE_POLYGON_RGN_MODE iMode)
#cfunc CreatePolyPolygonRgn "CreatePolyPolygonRgn" var, var, int, int

; winmdroot.Graphics.Gdi.HRGN CreatePolygonRgn(global::System.Drawing.Point* pptl, int cPoint, winmdroot.Graphics.Gdi.CREATE_POLYGON_RGN_MODE iMode)
#cfunc CreatePolygonRgn "CreatePolygonRgn" var, int, int

; winmdroot.Graphics.Gdi.HRGN CreateRectRgn(int x1, int y1, int x2, int y2)
#cfunc CreateRectRgn "CreateRectRgn" int, int, int, int

; winmdroot.Graphics.Gdi.HRGN CreateRectRgnIndirect(winmdroot.Foundation.RECT* lprect)
#cfunc CreateRectRgnIndirect "CreateRectRgnIndirect" var

; winmdroot.Graphics.Gdi.HRGN CreateRoundRectRgn(int x1, int y1, int x2, int y2, int w, int h)
#cfunc CreateRoundRectRgn "CreateRoundRectRgn" int, int, int, int, int, int

; winmdroot.Foundation.BOOL CreateScalableFontResource(uint fdwHidden, winmdroot.Foundation.PCWSTR lpszFont, winmdroot.Foundation.PCWSTR lpszFile, winmdroot.Foundation.PCWSTR lpszPath)
#cfunc CreateScalableFontResourceW "CreateScalableFontResourceW" int, wstr, wstr, wstr

; winmdroot.Graphics.Gdi.HBRUSH CreateSolidBrush(winmdroot.Foundation.COLORREF color)
#cfunc CreateSolidBrush "CreateSolidBrush" int

; winmdroot.Foundation.BOOL DPtoLP(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* lppt, int c)
#cfunc DPtoLP "DPtoLP" intptr, var, int

; winmdroot.Foundation.BOOL DeleteDC(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc DeleteDC "DeleteDC" intptr

; int DescribePixelFormat(winmdroot.Graphics.Gdi.HDC hdc, int iPixelFormat, uint nBytes, [Optional] winmdroot.Graphics.OpenGL.PIXELFORMATDESCRIPTOR* ppfd)
#cfunc DescribePixelFormat "DescribePixelFormat" intptr, int, int, var

; int DrawEscape(winmdroot.Graphics.Gdi.HDC hdc, int iEscape, int cjIn, winmdroot.Foundation.PCSTR lpIn)
#cfunc DrawEscape "DrawEscape" intptr, int, int, str

; winmdroot.Foundation.BOOL Ellipse(winmdroot.Graphics.Gdi.HDC hdc, int left, int top, int right, int bottom)
#cfunc Ellipse "Ellipse" intptr, int, int, int, int

; int EndDoc(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc EndDoc "EndDoc" intptr

; int EndPage(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc EndPage "EndPage" intptr

; winmdroot.Foundation.BOOL EndPath(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc EndPath "EndPath" intptr

; void EngDeleteSemaphore(winmdroot.Devices.Display.HSEMAPHORE hsem)
#func EngDeleteSemaphore "EngDeleteSemaphore" intptr

; void EngAcquireSemaphore(winmdroot.Devices.Display.HSEMAPHORE hsem)
#func EngAcquireSemaphore "EngAcquireSemaphore" intptr

; winmdroot.Foundation.BOOL EngAlphaBlend(winmdroot.Devices.Display.SURFOBJ* psoDest, winmdroot.Devices.Display.SURFOBJ* psoSrc, winmdroot.Devices.Display.CLIPOBJ* pco, winmdroot.Devices.Display.XLATEOBJ* pxlo, winmdroot.Foundation.RECTL* prclDest, winmdroot.Foundation.RECTL* prclSrc, winmdroot.Devices.Display.BLENDOBJ* pBlendObj)
#cfunc EngAlphaBlend "EngAlphaBlend" var, var, var, var, var, var, var

; winmdroot.Foundation.BOOL EngAssociateSurface(winmdroot.Devices.Display.HSURF hsurf, winmdroot.Devices.Display.HDEV hdev, uint flHooks)
#cfunc EngAssociateSurface "EngAssociateSurface" intptr, intptr, int

; winmdroot.Foundation.BOOL EngBitBlt(winmdroot.Devices.Display.SURFOBJ* psoTrg, winmdroot.Devices.Display.SURFOBJ* psoSrc, winmdroot.Devices.Display.SURFOBJ* psoMask, winmdroot.Devices.Display.CLIPOBJ* pco, winmdroot.Devices.Display.XLATEOBJ* pxlo, winmdroot.Foundation.RECTL* prclTrg, winmdroot.Foundation.POINTL* pptlSrc, winmdroot.Foundation.POINTL* pptlMask, winmdroot.Devices.Display.BRUSHOBJ* pbo, winmdroot.Foundation.POINTL* pptlBrush, uint rop4)
#cfunc EngBitBlt "EngBitBlt" var, var, var, var, var, var, var, var, var, var, int

; winmdroot.Foundation.BOOL EngCheckAbort(winmdroot.Devices.Display.SURFOBJ* pso)
#cfunc EngCheckAbort "EngCheckAbort" var

; winmdroot.Devices.Display.FD_GLYPHSET* EngComputeGlyphSet(int nCodePage, int nFirstChar, int cChars)
#cfunc EngComputeGlyphSet "EngComputeGlyphSet" int, int, int

; winmdroot.Foundation.BOOL EngCopyBits(winmdroot.Devices.Display.SURFOBJ* psoDest, winmdroot.Devices.Display.SURFOBJ* psoSrc, winmdroot.Devices.Display.CLIPOBJ* pco, winmdroot.Devices.Display.XLATEOBJ* pxlo, winmdroot.Foundation.RECTL* prclDest, winmdroot.Foundation.POINTL* pptlSrc)
#cfunc EngCopyBits "EngCopyBits" var, var, var, var, var, var

; winmdroot.Graphics.Gdi.HBITMAP EngCreateBitmap(winmdroot.Foundation.SIZE sizl, int lWidth, uint iFormat, uint fl, void* pvBits)
#cfunc EngCreateBitmap "EngCreateBitmap" var, int, int, int, intptr

; winmdroot.Devices.Display.CLIPOBJ* EngCreateClip()
#cfunc EngCreateClip "EngCreateClip"

; winmdroot.Graphics.Gdi.HBITMAP EngCreateDeviceBitmap(winmdroot.Devices.Display.DHSURF dhsurf, winmdroot.Foundation.SIZE sizl, uint iFormatCompat)
#cfunc EngCreateDeviceBitmap "EngCreateDeviceBitmap" intptr, var, int

; winmdroot.Devices.Display.HSURF EngCreateDeviceSurface(winmdroot.Devices.Display.DHSURF dhsurf, winmdroot.Foundation.SIZE sizl, uint iFormatCompat)
#cfunc EngCreateDeviceSurface "EngCreateDeviceSurface" intptr, var, int

; winmdroot.Graphics.Gdi.HPALETTE EngCreatePalette(uint iMode, uint cColors, uint* pulColors, uint flRed, uint flGreen, uint flBlue)
#cfunc EngCreatePalette "EngCreatePalette" int, int, var, int, int, int

; winmdroot.Devices.Display.HSEMAPHORE EngCreateSemaphore()
#cfunc EngCreateSemaphore "EngCreateSemaphore"

; void EngDeleteClip([Optional] winmdroot.Devices.Display.CLIPOBJ* pco)
#func EngDeleteClip "EngDeleteClip" var

; winmdroot.Foundation.BOOL EngDeletePalette(winmdroot.Graphics.Gdi.HPALETTE hpal)
#cfunc EngDeletePalette "EngDeletePalette" intptr

; void EngDeletePath(winmdroot.Devices.Display.PATHOBJ* ppo)
#func EngDeletePath "EngDeletePath" var

; winmdroot.Foundation.BOOL EngDeleteSurface(winmdroot.Devices.Display.HSURF hsurf)
#cfunc EngDeleteSurface "EngDeleteSurface" intptr

; winmdroot.Foundation.BOOL EngEraseSurface(winmdroot.Devices.Display.SURFOBJ* pso, winmdroot.Foundation.RECTL* prcl, uint iColor)
#cfunc EngEraseSurface "EngEraseSurface" var, var, int

; winmdroot.Foundation.BOOL EngFillPath(winmdroot.Devices.Display.SURFOBJ* pso, winmdroot.Devices.Display.PATHOBJ* ppo, winmdroot.Devices.Display.CLIPOBJ* pco, winmdroot.Devices.Display.BRUSHOBJ* pbo, winmdroot.Foundation.POINTL* pptlBrushOrg, uint mix, uint flOptions)
#cfunc EngFillPath "EngFillPath" var, var, var, var, var, int, int

; void* EngFindResource(winmdroot.Foundation.HANDLE h, int iName, int iType, uint* pulSize)
#cfunc EngFindResource "EngFindResource" intptr, int, int, var

; void EngFreeModule(winmdroot.Foundation.HANDLE h)
#func EngFreeModule "EngFreeModule" intptr

; void EngGetCurrentCodePage(ushort* OemCodePage, ushort* AnsiCodePage)
#func EngGetCurrentCodePage "EngGetCurrentCodePage" var, var

; winmdroot.Foundation.PWSTR EngGetDriverName(winmdroot.Devices.Display.HDEV hdev)
#cfunc EngGetDriverName "EngGetDriverName" intptr

; winmdroot.Foundation.PWSTR EngGetPrinterDataFileName(winmdroot.Devices.Display.HDEV hdev)
#cfunc EngGetPrinterDataFileName "EngGetPrinterDataFileName" intptr

; winmdroot.Foundation.BOOL EngGradientFill(winmdroot.Devices.Display.SURFOBJ* psoDest, winmdroot.Devices.Display.CLIPOBJ* pco, winmdroot.Devices.Display.XLATEOBJ* pxlo, winmdroot.Graphics.Gdi.TRIVERTEX* pVertex, uint nVertex, void* pMesh, uint nMesh, winmdroot.Foundation.RECTL* prclExtents, winmdroot.Foundation.POINTL* pptlDitherOrg, uint ulMode)
#cfunc EngGradientFill "EngGradientFill" var, var, var, var, int, intptr, int, var, var, int

; winmdroot.Foundation.BOOL EngLineTo(winmdroot.Devices.Display.SURFOBJ* pso, winmdroot.Devices.Display.CLIPOBJ* pco, winmdroot.Devices.Display.BRUSHOBJ* pbo, int x1, int y1, int x2, int y2, winmdroot.Foundation.RECTL* prclBounds, uint mix)
#cfunc EngLineTo "EngLineTo" var, var, var, int, int, int, int, var, int

; winmdroot.Foundation.HANDLE EngLoadModule(winmdroot.Foundation.PWSTR pwsz)
#cfunc EngLoadModule "EngLoadModule" wstr

; winmdroot.Devices.Display.SURFOBJ* EngLockSurface(winmdroot.Devices.Display.HSURF hsurf)
#cfunc EngLockSurface "EngLockSurface" intptr

; winmdroot.Foundation.BOOL EngMarkBandingSurface(winmdroot.Devices.Display.HSURF hsurf)
#cfunc EngMarkBandingSurface "EngMarkBandingSurface" intptr

; void EngMultiByteToUnicodeN(winmdroot.Foundation.PWSTR UnicodeString, uint MaxBytesInUnicodeString, [Optional] uint* BytesInUnicodeString, winmdroot.Foundation.PSTR MultiByteString, uint BytesInMultiByteString)
#func EngMultiByteToUnicodeN "EngMultiByteToUnicodeN" wstr, int, var, str, int

; int EngMultiByteToWideChar(uint CodePage, winmdroot.Foundation.PWSTR WideCharString, int BytesInWideCharString, winmdroot.Foundation.PSTR MultiByteString, int BytesInMultiByteString)
#cfunc EngMultiByteToWideChar "EngMultiByteToWideChar" int, wstr, int, str, int

; winmdroot.Foundation.BOOL EngPaint(winmdroot.Devices.Display.SURFOBJ* pso, winmdroot.Devices.Display.CLIPOBJ* pco, winmdroot.Devices.Display.BRUSHOBJ* pbo, winmdroot.Foundation.POINTL* pptlBrushOrg, uint mix)
#cfunc EngPaint "EngPaint" var, var, var, var, int

; winmdroot.Foundation.BOOL EngPlgBlt(winmdroot.Devices.Display.SURFOBJ* psoTrg, winmdroot.Devices.Display.SURFOBJ* psoSrc, winmdroot.Devices.Display.SURFOBJ* psoMsk, winmdroot.Devices.Display.CLIPOBJ* pco, winmdroot.Devices.Display.XLATEOBJ* pxlo, winmdroot.Graphics.Gdi.COLORADJUSTMENT* pca, winmdroot.Foundation.POINTL* pptlBrushOrg, winmdroot.Devices.Display.POINTFIX* pptfx, winmdroot.Foundation.RECTL* prcl, winmdroot.Foundation.POINTL* pptl, uint iMode)
#cfunc EngPlgBlt "EngPlgBlt" var, var, var, var, var, var, var, var, var, var, int

; winmdroot.Foundation.BOOL EngQueryEMFInfo(winmdroot.Devices.Display.HDEV hdev, winmdroot.Devices.Display.EMFINFO* pEMFInfo)
#cfunc EngQueryEMFInfo "EngQueryEMFInfo" intptr, var

; void EngQueryLocalTime(winmdroot.Devices.Display.ENG_TIME_FIELDS* param0)
#func EngQueryLocalTime "EngQueryLocalTime" var

; void EngReleaseSemaphore(winmdroot.Devices.Display.HSEMAPHORE hsem)
#func EngReleaseSemaphore "EngReleaseSemaphore" intptr

; winmdroot.Foundation.BOOL EngStretchBlt(winmdroot.Devices.Display.SURFOBJ* psoDest, winmdroot.Devices.Display.SURFOBJ* psoSrc, winmdroot.Devices.Display.SURFOBJ* psoMask, winmdroot.Devices.Display.CLIPOBJ* pco, winmdroot.Devices.Display.XLATEOBJ* pxlo, winmdroot.Graphics.Gdi.COLORADJUSTMENT* pca, winmdroot.Foundation.POINTL* pptlHTOrg, winmdroot.Foundation.RECTL* prclDest, winmdroot.Foundation.RECTL* prclSrc, winmdroot.Foundation.POINTL* pptlMask, uint iMode)
#cfunc EngStretchBlt "EngStretchBlt" var, var, var, var, var, var, var, var, var, var, int

; winmdroot.Foundation.BOOL EngStretchBltROP(winmdroot.Devices.Display.SURFOBJ* psoDest, winmdroot.Devices.Display.SURFOBJ* psoSrc, winmdroot.Devices.Display.SURFOBJ* psoMask, winmdroot.Devices.Display.CLIPOBJ* pco, winmdroot.Devices.Display.XLATEOBJ* pxlo, winmdroot.Graphics.Gdi.COLORADJUSTMENT* pca, winmdroot.Foundation.POINTL* pptlHTOrg, winmdroot.Foundation.RECTL* prclDest, winmdroot.Foundation.RECTL* prclSrc, winmdroot.Foundation.POINTL* pptlMask, uint iMode, winmdroot.Devices.Display.BRUSHOBJ* pbo, uint rop4)
#cfunc EngStretchBltROP "EngStretchBltROP" var, var, var, var, var, var, var, var, var, var, int, var, int

; winmdroot.Foundation.BOOL EngTextOut(winmdroot.Devices.Display.SURFOBJ* pso, winmdroot.Devices.Display.STROBJ* pstro, winmdroot.Devices.Display.FONTOBJ* pfo, winmdroot.Devices.Display.CLIPOBJ* pco, winmdroot.Foundation.RECTL* prclExtra, winmdroot.Foundation.RECTL* prclOpaque, winmdroot.Devices.Display.BRUSHOBJ* pboFore, winmdroot.Devices.Display.BRUSHOBJ* pboOpaque, winmdroot.Foundation.POINTL* pptlOrg, uint mix)
#cfunc EngTextOut "EngTextOut" var, var, var, var, var, var, var, var, var, int

; winmdroot.Foundation.BOOL EngTransparentBlt(winmdroot.Devices.Display.SURFOBJ* psoDst, winmdroot.Devices.Display.SURFOBJ* psoSrc, [Optional] winmdroot.Devices.Display.CLIPOBJ* pco, [Optional] winmdroot.Devices.Display.XLATEOBJ* pxlo, winmdroot.Foundation.RECTL* prclDst, winmdroot.Foundation.RECTL* prclSrc, uint TransColor, uint bCalledFromBitBlt)
#cfunc EngTransparentBlt "EngTransparentBlt" var, var, var, var, var, var, int, int

; void EngUnicodeToMultiByteN(winmdroot.Foundation.PSTR MultiByteString, uint MaxBytesInMultiByteString, [Optional] uint* BytesInMultiByteString, winmdroot.Foundation.PWSTR UnicodeString, uint BytesInUnicodeString)
#func EngUnicodeToMultiByteN "EngUnicodeToMultiByteN" str, int, var, wstr, int

; void EngUnlockSurface(winmdroot.Devices.Display.SURFOBJ* pso)
#func EngUnlockSurface "EngUnlockSurface" var

; int EngWideCharToMultiByte(uint CodePage, winmdroot.Foundation.PWSTR WideCharString, int BytesInWideCharString, winmdroot.Foundation.PSTR MultiByteString, int BytesInMultiByteString)
#cfunc EngWideCharToMultiByte "EngWideCharToMultiByte" int, wstr, int, str, int

; winmdroot.Foundation.BOOL EnumEnhMetaFile(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HENHMETAFILE hmf, delegate *unmanaged[Stdcall]<global::Windows.Win32.Graphics.Gdi.HDC,global::Windows.Win32.Graphics.Gdi.HANDLETABLE*,global::Windows.Win32.Graphics.Gdi.ENHMETARECORD*,int,global::Windows.Win32.Foundation.LPARAM,int> proc, [Optional] void* param3, [Optional] winmdroot.Foundation.RECT* lpRect)
#cfunc EnumEnhMetaFile "EnumEnhMetaFile" intptr, intptr, int, intptr, var

; int EnumFontFamiliesW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.PCWSTR lpLogfont, delegate *unmanaged[Stdcall]<global::Windows.Win32.Graphics.Gdi.LOGFONTW*,global::Windows.Win32.Graphics.Gdi.TEXTMETRICW*,uint,global::Windows.Win32.Foundation.LPARAM,int> lpProc, winmdroot.Foundation.LPARAM lParam)
#cfunc EnumFontFamiliesW "EnumFontFamiliesW" intptr, wstr, int, intptr

; int EnumFontFamiliesExW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.LOGFONTW* lpLogfont, delegate *unmanaged[Stdcall]<global::Windows.Win32.Graphics.Gdi.LOGFONTW*,global::Windows.Win32.Graphics.Gdi.TEXTMETRICW*,uint,global::Windows.Win32.Foundation.LPARAM,int> lpProc, winmdroot.Foundation.LPARAM lParam, uint dwFlags)
#cfunc EnumFontFamiliesExW "EnumFontFamiliesExW" intptr, var, int, intptr, int

; int EnumFontsW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.PCWSTR lpLogfont, delegate *unmanaged[Stdcall]<global::Windows.Win32.Graphics.Gdi.LOGFONTW*,global::Windows.Win32.Graphics.Gdi.TEXTMETRICW*,uint,global::Windows.Win32.Foundation.LPARAM,int> lpProc, winmdroot.Foundation.LPARAM lParam)
#cfunc EnumFontsW "EnumFontsW" intptr, wstr, int, intptr

; int EnumICMProfilesW(winmdroot.Graphics.Gdi.HDC hdc, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.LPARAM,int> proc, winmdroot.Foundation.LPARAM param2)
#cfunc EnumICMProfilesW "EnumICMProfilesW" intptr, int, intptr

; winmdroot.Foundation.BOOL EnumMetaFile(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HMETAFILE hmf, delegate *unmanaged[Stdcall]<global::Windows.Win32.Graphics.Gdi.HDC,global::Windows.Win32.Graphics.Gdi.HANDLETABLE*,global::Windows.Win32.Graphics.Gdi.METARECORD*,int,global::Windows.Win32.Foundation.LPARAM,int> proc, winmdroot.Foundation.LPARAM param3)
#cfunc EnumMetaFile "EnumMetaFile" intptr, intptr, int, intptr

; int EnumObjects(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.OBJ_TYPE nType, delegate *unmanaged[Stdcall]<void*,global::Windows.Win32.Foundation.LPARAM,int> lpFunc, winmdroot.Foundation.LPARAM lParam)
#cfunc EnumObjects "EnumObjects" intptr, int, int, intptr

; winmdroot.Foundation.BOOL EqualRgn(winmdroot.Graphics.Gdi.HRGN hrgn1, winmdroot.Graphics.Gdi.HRGN hrgn2)
#cfunc EqualRgn "EqualRgn" intptr, intptr

; int Escape(winmdroot.Graphics.Gdi.HDC hdc, int iEscape, int cjIn, winmdroot.Foundation.PCSTR pvIn, [Optional] void* pvOut)
#cfunc Escape "Escape" intptr, int, int, str, intptr

; winmdroot.Graphics.Gdi.GDI_REGION_TYPE ExcludeClipRect(winmdroot.Graphics.Gdi.HDC hdc, int left, int top, int right, int bottom)
#cfunc ExcludeClipRect "ExcludeClipRect" intptr, int, int, int, int

; winmdroot.Graphics.Gdi.HPEN ExtCreatePen(uint iPenStyle, uint cWidth, winmdroot.Graphics.Gdi.LOGBRUSH* plbrush, uint cStyle, [Optional] uint* pstyle)
#cfunc ExtCreatePen "ExtCreatePen" int, int, var, int, var

; winmdroot.Graphics.Gdi.HRGN ExtCreateRegion([Optional] winmdroot.Graphics.Gdi.XFORM* lpx, uint nCount, winmdroot.Graphics.Gdi.RGNDATA* lpData)
#cfunc ExtCreateRegion "ExtCreateRegion" var, int, var

; int ExtEscape(winmdroot.Graphics.Gdi.HDC hdc, int iEscape, int cjInput, winmdroot.Foundation.PCSTR lpInData, int cjOutput, winmdroot.Foundation.PSTR lpOutData)
#cfunc ExtEscape "ExtEscape" intptr, int, int, str, int, str

; winmdroot.Foundation.BOOL ExtFloodFill(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, winmdroot.Foundation.COLORREF color, winmdroot.Graphics.Gdi.EXT_FLOOD_FILL_TYPE type)
#cfunc ExtFloodFill "ExtFloodFill" intptr, int, int, int, int

; winmdroot.Graphics.Gdi.GDI_REGION_TYPE ExtSelectClipRgn(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HRGN hrgn, winmdroot.Graphics.Gdi.RGN_COMBINE_MODE mode)
#cfunc ExtSelectClipRgn "ExtSelectClipRgn" intptr, intptr, int

; winmdroot.Foundation.BOOL ExtTextOutW(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, winmdroot.Graphics.Gdi.ETO_OPTIONS options, [Optional] winmdroot.Foundation.RECT* lprect, winmdroot.Foundation.PCWSTR lpString, uint c, [Optional] int* lpDx)
#cfunc ExtTextOutW "ExtTextOutW" intptr, int, int, int, var, wstr, int, var

; uint FONTOBJ_cGetAllGlyphHandles(winmdroot.Devices.Display.FONTOBJ* pfo, uint* phg)
#cfunc FONTOBJ_cGetAllGlyphHandles "FONTOBJ_cGetAllGlyphHandles" var, var

; uint FONTOBJ_cGetGlyphs(winmdroot.Devices.Display.FONTOBJ* pfo, uint iMode, uint cGlyph, uint* phg, void** ppvGlyph)
#cfunc FONTOBJ_cGetGlyphs "FONTOBJ_cGetGlyphs" var, int, int, var, var

; winmdroot.Devices.Display.FD_GLYPHATTR* FONTOBJ_pQueryGlyphAttrs(winmdroot.Devices.Display.FONTOBJ* pfo, uint iMode)
#cfunc FONTOBJ_pQueryGlyphAttrs "FONTOBJ_pQueryGlyphAttrs" var, int

; winmdroot.Devices.Display.FD_GLYPHSET* FONTOBJ_pfdg(winmdroot.Devices.Display.FONTOBJ* pfo)
#cfunc FONTOBJ_pfdg "FONTOBJ_pfdg" var

; void* FONTOBJ_pvTrueTypeFontFile(winmdroot.Devices.Display.FONTOBJ* pfo, uint* pcjFile)
#cfunc FONTOBJ_pvTrueTypeFontFile "FONTOBJ_pvTrueTypeFontFile" var, var

; winmdroot.Devices.Display.XFORMOBJ* FONTOBJ_pxoGetXform(winmdroot.Devices.Display.FONTOBJ* pfo)
#cfunc FONTOBJ_pxoGetXform "FONTOBJ_pxoGetXform" var

; void FONTOBJ_vGetInfo(winmdroot.Devices.Display.FONTOBJ* pfo, uint cjSize, winmdroot.Devices.Display.FONTINFO* pfi)
#func FONTOBJ_vGetInfo "FONTOBJ_vGetInfo" var, int, var

; winmdroot.Foundation.BOOL FillPath(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc FillPath "FillPath" intptr

; winmdroot.Foundation.BOOL FillRgn(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HRGN hrgn, winmdroot.Graphics.Gdi.HBRUSH hbr)
#cfunc FillRgn "FillRgn" intptr, intptr, intptr

; winmdroot.Foundation.BOOL FixBrushOrgEx(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, [Optional] global::System.Drawing.Point* ptl)
#cfunc FixBrushOrgEx "FixBrushOrgEx" intptr, int, int, var

; winmdroot.Foundation.BOOL FlattenPath(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc FlattenPath "FlattenPath" intptr

; winmdroot.Foundation.BOOL FloodFill(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, winmdroot.Foundation.COLORREF color)
#cfunc FloodFill "FloodFill" intptr, int, int, int

; winmdroot.Foundation.BOOL FrameRgn(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HRGN hrgn, winmdroot.Graphics.Gdi.HBRUSH hbr, int w, int h)
#cfunc FrameRgn "FrameRgn" intptr, intptr, intptr, int, int

; winmdroot.Foundation.BOOL GdiAlphaBlend(winmdroot.Graphics.Gdi.HDC hdcDest, int xoriginDest, int yoriginDest, int wDest, int hDest, winmdroot.Graphics.Gdi.HDC hdcSrc, int xoriginSrc, int yoriginSrc, int wSrc, int hSrc, winmdroot.Graphics.Gdi.BLENDFUNCTION ftn)
#cfunc GdiAlphaBlend "GdiAlphaBlend" intptr, int, int, int, int, intptr, int, int, int, int, var

; winmdroot.Foundation.BOOL GdiComment(winmdroot.Graphics.Gdi.HDC hdc, uint nSize, byte* lpData)
#cfunc GdiComment "GdiComment" intptr, int, var

; winmdroot.Foundation.BOOL GdiDeleteSpoolFileHandle(winmdroot.Foundation.HANDLE SpoolFileHandle)
#cfunc GdiDeleteSpoolFileHandle "GdiDeleteSpoolFileHandle" intptr

; winmdroot.Foundation.BOOL GdiEndDocEMF(winmdroot.Foundation.HANDLE SpoolFileHandle)
#cfunc GdiEndDocEMF "GdiEndDocEMF" intptr

; winmdroot.Foundation.BOOL GdiEndPageEMF(winmdroot.Foundation.HANDLE SpoolFileHandle, uint dwOptimization)
#cfunc GdiEndPageEMF "GdiEndPageEMF" intptr, int

; winmdroot.Foundation.BOOL GdiFlush()
#cfunc GdiFlush "GdiFlush"

; uint GdiGetBatchLimit()
#cfunc GdiGetBatchLimit "GdiGetBatchLimit"

; winmdroot.Graphics.Gdi.HDC GdiGetDC(winmdroot.Foundation.HANDLE SpoolFileHandle)
#cfunc GdiGetDC "GdiGetDC" intptr

; winmdroot.Foundation.BOOL GdiGetDevmodeForPage(winmdroot.Foundation.HANDLE SpoolFileHandle, uint dwPageNumber, winmdroot.Graphics.Gdi.DEVMODEW** pCurrDM, winmdroot.Graphics.Gdi.DEVMODEW** pLastDM)
#cfunc GdiGetDevmodeForPage "GdiGetDevmodeForPage" intptr, int, var, var

; uint GdiGetPageCount(winmdroot.Foundation.HANDLE SpoolFileHandle)
#cfunc GdiGetPageCount "GdiGetPageCount" intptr

; winmdroot.Foundation.HANDLE GdiGetPageHandle(winmdroot.Foundation.HANDLE SpoolFileHandle, uint Page, uint* pdwPageType)
#cfunc GdiGetPageHandle "GdiGetPageHandle" intptr, int, var

; winmdroot.Foundation.HANDLE GdiGetSpoolFileHandle(winmdroot.Foundation.PWSTR pwszPrinterName, winmdroot.Graphics.Gdi.DEVMODEW* pDevmode, winmdroot.Foundation.PWSTR pwszDocName)
#cfunc GdiGetSpoolFileHandle "GdiGetSpoolFileHandle" wstr, var, wstr

; winmdroot.Foundation.BOOL GdiGradientFill(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.TRIVERTEX* pVertex, uint nVertex, void* pMesh, uint nCount, winmdroot.Graphics.Gdi.GRADIENT_FILL ulMode)
#cfunc GdiGradientFill "GdiGradientFill" intptr, var, int, intptr, int, int

; winmdroot.Foundation.BOOL GdiPlayPageEMF(winmdroot.Foundation.HANDLE SpoolFileHandle, winmdroot.Foundation.HANDLE hemf, winmdroot.Foundation.RECT* prectDocument, winmdroot.Foundation.RECT* prectBorder, winmdroot.Foundation.RECT* prectClip)
#cfunc GdiPlayPageEMF "GdiPlayPageEMF" intptr, intptr, var, var, var

; winmdroot.Foundation.BOOL GdiResetDCEMF(winmdroot.Foundation.HANDLE SpoolFileHandle, winmdroot.Graphics.Gdi.DEVMODEW* pCurrDM)
#cfunc GdiResetDCEMF "GdiResetDCEMF" intptr, var

; uint GdiSetBatchLimit(uint dw)
#cfunc GdiSetBatchLimit "GdiSetBatchLimit" int

; winmdroot.Foundation.BOOL GdiStartDocEMF(winmdroot.Foundation.HANDLE SpoolFileHandle, winmdroot.Storage.Xps.DOCINFOW* pDocInfo)
#cfunc GdiStartDocEMF "GdiStartDocEMF" intptr, var

; winmdroot.Foundation.BOOL GdiStartPageEMF(winmdroot.Foundation.HANDLE SpoolFileHandle)
#cfunc GdiStartPageEMF "GdiStartPageEMF" intptr

; winmdroot.Foundation.BOOL GdiTransparentBlt(winmdroot.Graphics.Gdi.HDC hdcDest, int xoriginDest, int yoriginDest, int wDest, int hDest, winmdroot.Graphics.Gdi.HDC hdcSrc, int xoriginSrc, int yoriginSrc, int wSrc, int hSrc, uint crTransparent)
#cfunc GdiTransparentBlt "GdiTransparentBlt" intptr, int, int, int, int, intptr, int, int, int, int, int

; int GetArcDirection(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc GetArcDirection "GetArcDirection" intptr

; winmdroot.Foundation.BOOL GetAspectRatioFilterEx(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.SIZE* lpsize)
#cfunc GetAspectRatioFilterEx "GetAspectRatioFilterEx" intptr, var

; int GetBitmapBits(winmdroot.Graphics.Gdi.HBITMAP hbit, int cb, void* lpvBits)
#cfunc GetBitmapBits "GetBitmapBits" intptr, int, intptr

; winmdroot.Foundation.BOOL GetBitmapDimensionEx(winmdroot.Graphics.Gdi.HBITMAP hbit, winmdroot.Foundation.SIZE* lpsize)
#cfunc GetBitmapDimensionEx "GetBitmapDimensionEx" intptr, var

; winmdroot.Foundation.COLORREF GetBkColor(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc GetBkColor "GetBkColor" intptr

; int GetBkMode(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc GetBkMode "GetBkMode" intptr

; uint GetBoundsRect(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.RECT* lprect, uint flags)
#cfunc GetBoundsRect "GetBoundsRect" intptr, var, int

; winmdroot.Foundation.BOOL GetBrushOrgEx(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* lppt)
#cfunc GetBrushOrgEx "GetBrushOrgEx" intptr, var

; winmdroot.Foundation.BOOL GetCharABCWidthsW(winmdroot.Graphics.Gdi.HDC hdc, uint wFirst, uint wLast, winmdroot.Graphics.Gdi.ABC* lpABC)
#cfunc GetCharABCWidthsW "GetCharABCWidthsW" intptr, int, int, var

; winmdroot.Foundation.BOOL GetCharABCWidthsFloatW(winmdroot.Graphics.Gdi.HDC hdc, uint iFirst, uint iLast, winmdroot.Graphics.Gdi.ABCFLOAT* lpABC)
#cfunc GetCharABCWidthsFloatW "GetCharABCWidthsFloatW" intptr, int, int, var

; winmdroot.Foundation.BOOL GetCharABCWidthsI(winmdroot.Graphics.Gdi.HDC hdc, uint giFirst, uint cgi, [Optional] ushort* pgi, winmdroot.Graphics.Gdi.ABC* pabc)
#cfunc GetCharABCWidthsI "GetCharABCWidthsI" intptr, int, int, var, var

; winmdroot.Foundation.BOOL GetCharWidthW(winmdroot.Graphics.Gdi.HDC hdc, uint iFirst, uint iLast, int* lpBuffer)
#cfunc GetCharWidthW "GetCharWidthW" intptr, int, int, var

; winmdroot.Foundation.BOOL GetCharWidth32A(winmdroot.Graphics.Gdi.HDC hdc, uint iFirst, uint iLast, int* lpBuffer)
#cfunc GetCharWidth32A "GetCharWidth32A" intptr, int, int, var

; winmdroot.Foundation.BOOL GetCharWidth32W(winmdroot.Graphics.Gdi.HDC hdc, uint iFirst, uint iLast, int* lpBuffer)
#cfunc GetCharWidth32W "GetCharWidth32W" intptr, int, int, var

; winmdroot.Foundation.BOOL GetCharWidthFloatW(winmdroot.Graphics.Gdi.HDC hdc, uint iFirst, uint iLast, float* lpBuffer)
#cfunc GetCharWidthFloatW "GetCharWidthFloatW" intptr, int, int, var

; winmdroot.Foundation.BOOL GetCharWidthI(winmdroot.Graphics.Gdi.HDC hdc, uint giFirst, uint cgi, [Optional] ushort* pgi, int* piWidths)
#cfunc GetCharWidthI "GetCharWidthI" intptr, int, int, var, var

; uint GetCharacterPlacementW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.PCWSTR lpString, int nCount, int nMexExtent, winmdroot.Graphics.Gdi.GCP_RESULTSW* lpResults, winmdroot.Graphics.Gdi.GET_CHARACTER_PLACEMENT_FLAGS dwFlags)
#cfunc GetCharacterPlacementW "GetCharacterPlacementW" intptr, wstr, int, int, var, int

; winmdroot.Graphics.Gdi.GDI_REGION_TYPE GetClipBox(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.RECT* lprect)
#cfunc GetClipBox "GetClipBox" intptr, var

; int GetClipRgn(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HRGN hrgn)
#cfunc GetClipRgn "GetClipRgn" intptr, intptr

; winmdroot.Foundation.BOOL GetColorAdjustment(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.COLORADJUSTMENT* lpca)
#cfunc GetColorAdjustment "GetColorAdjustment" intptr, var

; winmdroot.UI.ColorSystem.HCOLORSPACE GetColorSpace(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc GetColorSpace "GetColorSpace" intptr

; winmdroot.Graphics.Gdi.HGDIOBJ GetCurrentObject(winmdroot.Graphics.Gdi.HDC hdc, uint type)
#cfunc GetCurrentObject "GetCurrentObject" intptr, int

; winmdroot.Foundation.BOOL GetCurrentPositionEx(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* lppt)
#cfunc GetCurrentPositionEx "GetCurrentPositionEx" intptr, var

; winmdroot.Foundation.COLORREF GetDCBrushColor(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc GetDCBrushColor "GetDCBrushColor" intptr

; winmdroot.Foundation.BOOL GetDCOrgEx(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* lppt)
#cfunc GetDCOrgEx "GetDCOrgEx" intptr, var

; winmdroot.Foundation.COLORREF GetDCPenColor(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc GetDCPenColor "GetDCPenColor" intptr

; uint GetDIBColorTable(winmdroot.Graphics.Gdi.HDC hdc, uint iStart, uint cEntries, winmdroot.Graphics.Gdi.RGBQUAD* prgbq)
#cfunc GetDIBColorTable "GetDIBColorTable" intptr, int, int, var

; int GetDIBits(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HBITMAP hbm, uint start, uint cLines, [Optional] void* lpvBits, winmdroot.Graphics.Gdi.BITMAPINFO* lpbmi, winmdroot.Graphics.Gdi.DIB_USAGE usage)
#cfunc GetDIBits "GetDIBits" intptr, intptr, int, int, intptr, var, int

; int GetDeviceCaps(winmdroot.Graphics.Gdi.HDC hdc, int index)
#cfunc GetDeviceCaps "GetDeviceCaps" intptr, int

; winmdroot.Foundation.BOOL GetDeviceGammaRamp(winmdroot.Graphics.Gdi.HDC hdc, void* lpRamp)
#cfunc GetDeviceGammaRamp "GetDeviceGammaRamp" intptr, intptr

; winmdroot.Graphics.Gdi.HENHMETAFILE GetEnhMetaFileW(winmdroot.Foundation.PCWSTR lpName)
#cfunc GetEnhMetaFileW "GetEnhMetaFileW" wstr

; uint GetEnhMetaFileBits(winmdroot.Graphics.Gdi.HENHMETAFILE hEMF, uint nSize, [Optional] byte* lpData)
#cfunc GetEnhMetaFileBits "GetEnhMetaFileBits" intptr, int, var

; uint GetEnhMetaFileDescriptionW(winmdroot.Graphics.Gdi.HENHMETAFILE hemf, uint cchBuffer, winmdroot.Foundation.PWSTR lpDescription)
#cfunc GetEnhMetaFileDescriptionW "GetEnhMetaFileDescriptionW" intptr, int, wstr

; uint GetEnhMetaFileHeader(winmdroot.Graphics.Gdi.HENHMETAFILE hemf, uint nSize, [Optional] winmdroot.Graphics.Gdi.ENHMETAHEADER* lpEnhMetaHeader)
#cfunc GetEnhMetaFileHeader "GetEnhMetaFileHeader" intptr, int, var

; uint GetEnhMetaFilePaletteEntries(winmdroot.Graphics.Gdi.HENHMETAFILE hemf, uint nNumEntries, [Optional] winmdroot.Graphics.Gdi.PALETTEENTRY* lpPaletteEntries)
#cfunc GetEnhMetaFilePaletteEntries "GetEnhMetaFilePaletteEntries" intptr, int, var

; uint GetEnhMetaFilePixelFormat(winmdroot.Graphics.Gdi.HENHMETAFILE hemf, uint cbBuffer, [Optional] winmdroot.Graphics.OpenGL.PIXELFORMATDESCRIPTOR* ppfd)
#cfunc GetEnhMetaFilePixelFormat "GetEnhMetaFilePixelFormat" intptr, int, var

; uint GetFontData(winmdroot.Graphics.Gdi.HDC hdc, uint dwTable, uint dwOffset, [Optional] void* pvBuffer, uint cjBuffer)
#cfunc GetFontData "GetFontData" intptr, int, int, intptr, int

; uint GetFontLanguageInfo(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc GetFontLanguageInfo "GetFontLanguageInfo" intptr

; uint GetFontUnicodeRanges(winmdroot.Graphics.Gdi.HDC hdc, [Optional] winmdroot.Graphics.Gdi.GLYPHSET* lpgs)
#cfunc GetFontUnicodeRanges "GetFontUnicodeRanges" intptr, var

; uint GetGlyphIndicesW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.PCWSTR lpstr, int c, ushort* pgi, uint fl)
#cfunc GetGlyphIndicesW "GetGlyphIndicesW" intptr, wstr, int, var, int

; uint GetGlyphOutlineW(winmdroot.Graphics.Gdi.HDC hdc, uint uChar, winmdroot.Graphics.Gdi.GET_GLYPH_OUTLINE_FORMAT fuFormat, winmdroot.Graphics.Gdi.GLYPHMETRICS* lpgm, uint cjBuffer, [Optional] void* pvBuffer, winmdroot.Graphics.Gdi.MAT2* lpmat2)
#cfunc GetGlyphOutlineW "GetGlyphOutlineW" intptr, int, int, var, int, intptr, var

; int GetGraphicsMode(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc GetGraphicsMode "GetGraphicsMode" intptr

; winmdroot.Foundation.BOOL GetICMProfileW(winmdroot.Graphics.Gdi.HDC hdc, uint* pBufSize, winmdroot.Foundation.PWSTR pszFilename)
#cfunc GetICMProfileW "GetICMProfileW" intptr, var, wstr

; uint GetKerningPairsW(winmdroot.Graphics.Gdi.HDC hdc, uint nPairs, [Optional] winmdroot.Graphics.Gdi.KERNINGPAIR* lpKernPair)
#cfunc GetKerningPairsW "GetKerningPairsW" intptr, int, var

; uint GetLayout(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc GetLayout "GetLayout" intptr

; winmdroot.Foundation.BOOL GetLogColorSpaceW(winmdroot.UI.ColorSystem.HCOLORSPACE hColorSpace, winmdroot.UI.ColorSystem.LOGCOLORSPACEW* lpBuffer, uint nSize)
#cfunc GetLogColorSpaceW "GetLogColorSpaceW" intptr, var, int

; winmdroot.Graphics.Gdi.HDC_MAP_MODE GetMapMode(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc GetMapMode "GetMapMode" intptr

; winmdroot.Graphics.Gdi.HMETAFILE GetMetaFileW(winmdroot.Foundation.PCWSTR lpName)
#cfunc GetMetaFileW "GetMetaFileW" wstr

; uint GetMetaFileBitsEx(winmdroot.Graphics.Gdi.HMETAFILE hMF, uint cbBuffer, [Optional] void* lpData)
#cfunc GetMetaFileBitsEx "GetMetaFileBitsEx" intptr, int, intptr

; int GetMetaRgn(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HRGN hrgn)
#cfunc GetMetaRgn "GetMetaRgn" intptr, intptr

; winmdroot.Foundation.BOOL GetMiterLimit(winmdroot.Graphics.Gdi.HDC hdc, float* plimit)
#cfunc GetMiterLimit "GetMiterLimit" intptr, var

; winmdroot.Foundation.COLORREF GetNearestColor(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.COLORREF color)
#cfunc GetNearestColor "GetNearestColor" intptr, int

; uint GetNearestPaletteIndex(winmdroot.Graphics.Gdi.HPALETTE h, winmdroot.Foundation.COLORREF color)
#cfunc GetNearestPaletteIndex "GetNearestPaletteIndex" intptr, int

; int GetObjectW(winmdroot.Graphics.Gdi.HGDIOBJ h, int c, [Optional] void* pv)
#cfunc GetObjectW "GetObjectW" intptr, int, intptr

; uint GetObjectType(winmdroot.Graphics.Gdi.HGDIOBJ h)
#cfunc GetObjectType "GetObjectType" intptr

; uint GetOutlineTextMetricsW(winmdroot.Graphics.Gdi.HDC hdc, uint cjCopy, [Optional] winmdroot.Graphics.Gdi.OUTLINETEXTMETRICW* potm)
#cfunc GetOutlineTextMetricsW "GetOutlineTextMetricsW" intptr, int, var

; uint GetPaletteEntries(winmdroot.Graphics.Gdi.HPALETTE hpal, uint iStart, uint cEntries, [Optional] winmdroot.Graphics.Gdi.PALETTEENTRY* pPalEntries)
#cfunc GetPaletteEntries "GetPaletteEntries" intptr, int, int, var

; int GetPath(winmdroot.Graphics.Gdi.HDC hdc, [Optional] global::System.Drawing.Point* apt, [Optional] byte* aj, int cpt)
#cfunc GetPath "GetPath" intptr, var, var, int

; winmdroot.Foundation.COLORREF GetPixel(winmdroot.Graphics.Gdi.HDC hdc, int x, int y)
#cfunc GetPixel "GetPixel" intptr, int, int

; int GetPixelFormat(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc GetPixelFormat "GetPixelFormat" intptr

; int GetPolyFillMode(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc GetPolyFillMode "GetPolyFillMode" intptr

; winmdroot.Graphics.Gdi.R2_MODE GetROP2(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc GetROP2 "GetROP2" intptr

; int GetRandomRgn(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HRGN hrgn, int i)
#cfunc GetRandomRgn "GetRandomRgn" intptr, intptr, int

; winmdroot.Foundation.BOOL GetRasterizerCaps(winmdroot.Graphics.Gdi.RASTERIZER_STATUS* lpraststat, uint cjBytes)
#cfunc GetRasterizerCaps "GetRasterizerCaps" var, int

; uint GetRegionData(winmdroot.Graphics.Gdi.HRGN hrgn, uint nCount, [Optional] winmdroot.Graphics.Gdi.RGNDATA* lpRgnData)
#cfunc GetRegionData "GetRegionData" intptr, int, var

; winmdroot.Graphics.Gdi.GDI_REGION_TYPE GetRgnBox(winmdroot.Graphics.Gdi.HRGN hrgn, winmdroot.Foundation.RECT* lprc)
#cfunc GetRgnBox "GetRgnBox" intptr, var

; winmdroot.Graphics.Gdi.HGDIOBJ GetStockObject(winmdroot.Graphics.Gdi.GET_STOCK_OBJECT_FLAGS i)
#cfunc GetStockObject "GetStockObject" int

; int GetStretchBltMode(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc GetStretchBltMode "GetStretchBltMode" intptr

; uint GetSystemPaletteEntries(winmdroot.Graphics.Gdi.HDC hdc, uint iStart, uint cEntries, [Optional] winmdroot.Graphics.Gdi.PALETTEENTRY* pPalEntries)
#cfunc GetSystemPaletteEntries "GetSystemPaletteEntries" intptr, int, int, var

; uint GetSystemPaletteUse(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc GetSystemPaletteUse "GetSystemPaletteUse" intptr

; winmdroot.Graphics.Gdi.TEXT_ALIGN_OPTIONS GetTextAlign(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc GetTextAlign "GetTextAlign" intptr

; int GetTextCharacterExtra(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc GetTextCharacterExtra "GetTextCharacterExtra" intptr

; int GetTextCharset(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc GetTextCharset "GetTextCharset" intptr

; int GetTextCharsetInfo(winmdroot.Graphics.Gdi.HDC hdc, [Optional] winmdroot.Globalization.FONTSIGNATURE* lpSig, uint dwFlags)
#cfunc GetTextCharsetInfo "GetTextCharsetInfo" intptr, var, int

; winmdroot.Foundation.COLORREF GetTextColor(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc GetTextColor "GetTextColor" intptr

; winmdroot.Foundation.BOOL GetTextExtentExPointW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.PCWSTR lpszString, int cchString, int nMaxExtent, [Optional] int* lpnFit, [Optional] int* lpnDx, winmdroot.Foundation.SIZE* lpSize)
#cfunc GetTextExtentExPointW "GetTextExtentExPointW" intptr, wstr, int, int, var, var, var

; winmdroot.Foundation.BOOL GetTextExtentExPointI(winmdroot.Graphics.Gdi.HDC hdc, ushort* lpwszString, int cwchString, int nMaxExtent, [Optional] int* lpnFit, [Optional] int* lpnDx, winmdroot.Foundation.SIZE* lpSize)
#cfunc GetTextExtentExPointI "GetTextExtentExPointI" intptr, var, int, int, var, var, var

; winmdroot.Foundation.BOOL GetTextExtentPointW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.PCWSTR lpString, int c, winmdroot.Foundation.SIZE* lpsz)
#cfunc GetTextExtentPointW "GetTextExtentPointW" intptr, wstr, int, var

; winmdroot.Foundation.BOOL GetTextExtentPoint32A(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.PCSTR lpString, int c, winmdroot.Foundation.SIZE* psizl)
#cfunc GetTextExtentPoint32A "GetTextExtentPoint32A" intptr, str, int, var

; winmdroot.Foundation.BOOL GetTextExtentPoint32W(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.PCWSTR lpString, int c, winmdroot.Foundation.SIZE* psizl)
#cfunc GetTextExtentPoint32W "GetTextExtentPoint32W" intptr, wstr, int, var

; winmdroot.Foundation.BOOL GetTextExtentPointI(winmdroot.Graphics.Gdi.HDC hdc, ushort* pgiIn, int cgi, winmdroot.Foundation.SIZE* psize)
#cfunc GetTextExtentPointI "GetTextExtentPointI" intptr, var, int, var

; int GetTextFaceW(winmdroot.Graphics.Gdi.HDC hdc, int c, winmdroot.Foundation.PWSTR lpName)
#cfunc GetTextFaceW "GetTextFaceW" intptr, int, wstr

; winmdroot.Foundation.BOOL GetTextMetricsW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.TEXTMETRICW* lptm)
#cfunc GetTextMetricsW "GetTextMetricsW" intptr, var

; winmdroot.Foundation.BOOL GetViewportExtEx(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.SIZE* lpsize)
#cfunc GetViewportExtEx "GetViewportExtEx" intptr, var

; winmdroot.Foundation.BOOL GetViewportOrgEx(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* lppoint)
#cfunc GetViewportOrgEx "GetViewportOrgEx" intptr, var

; uint GetWinMetaFileBits(winmdroot.Graphics.Gdi.HENHMETAFILE hemf, uint cbData16, [Optional] byte* pData16, int iMapMode, winmdroot.Graphics.Gdi.HDC hdcRef)
#cfunc GetWinMetaFileBits "GetWinMetaFileBits" intptr, int, var, int, intptr

; winmdroot.Foundation.BOOL GetWindowExtEx(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.SIZE* lpsize)
#cfunc GetWindowExtEx "GetWindowExtEx" intptr, var

; winmdroot.Foundation.BOOL GetWindowOrgEx(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* lppoint)
#cfunc GetWindowOrgEx "GetWindowOrgEx" intptr, var

; winmdroot.Foundation.BOOL GetWorldTransform(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.XFORM* lpxf)
#cfunc GetWorldTransform "GetWorldTransform" intptr, var

; int HT_Get8BPPFormatPalette([Optional] winmdroot.Graphics.Gdi.PALETTEENTRY* pPaletteEntry, ushort RedGamma, ushort GreenGamma, ushort BlueGamma)
#cfunc HT_Get8BPPFormatPalette "HT_Get8BPPFormatPalette" var, int, int, int

; int HT_Get8BPPMaskPalette([Optional] winmdroot.Graphics.Gdi.PALETTEENTRY* pPaletteEntry, winmdroot.Foundation.BOOL Use8BPPMaskPal, byte CMYMask, ushort RedGamma, ushort GreenGamma, ushort BlueGamma)
#cfunc HT_Get8BPPMaskPalette "HT_Get8BPPMaskPalette" var, int, int, int, int, int

; winmdroot.Graphics.Gdi.GDI_REGION_TYPE IntersectClipRect(winmdroot.Graphics.Gdi.HDC hdc, int left, int top, int right, int bottom)
#cfunc IntersectClipRect "IntersectClipRect" intptr, int, int, int, int

; winmdroot.Foundation.BOOL InvertRgn(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HRGN hrgn)
#cfunc InvertRgn "InvertRgn" intptr, intptr

; winmdroot.Foundation.BOOL LPtoDP(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* lppt, int c)
#cfunc LPtoDP "LPtoDP" intptr, var, int

; winmdroot.Foundation.BOOL LineDDA(int xStart, int yStart, int xEnd, int yEnd, delegate *unmanaged[Stdcall]<int,int,global::Windows.Win32.Foundation.LPARAM,void> lpProc, winmdroot.Foundation.LPARAM data)
#cfunc LineDDA "LineDDA" int, int, int, int, int, intptr

; winmdroot.Foundation.BOOL LineTo(winmdroot.Graphics.Gdi.HDC hdc, int x, int y)
#cfunc LineTo "LineTo" intptr, int, int

; winmdroot.Foundation.BOOL MaskBlt(winmdroot.Graphics.Gdi.HDC hdcDest, int xDest, int yDest, int width, int height, winmdroot.Graphics.Gdi.HDC hdcSrc, int xSrc, int ySrc, winmdroot.Graphics.Gdi.HBITMAP hbmMask, int xMask, int yMask, uint rop)
#cfunc MaskBlt "MaskBlt" intptr, int, int, int, int, intptr, int, int, intptr, int, int, int

; winmdroot.Foundation.BOOL ModifyWorldTransform(winmdroot.Graphics.Gdi.HDC hdc, [Optional] winmdroot.Graphics.Gdi.XFORM* lpxf, winmdroot.Graphics.Gdi.MODIFY_WORLD_TRANSFORM_MODE mode)
#cfunc ModifyWorldTransform "ModifyWorldTransform" intptr, var, int

; winmdroot.Foundation.BOOL MoveToEx(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, [Optional] global::System.Drawing.Point* lppt)
#cfunc MoveToEx "MoveToEx" intptr, int, int, var

; winmdroot.Graphics.Gdi.GDI_REGION_TYPE OffsetClipRgn(winmdroot.Graphics.Gdi.HDC hdc, int x, int y)
#cfunc OffsetClipRgn "OffsetClipRgn" intptr, int, int

; winmdroot.Graphics.Gdi.GDI_REGION_TYPE OffsetRgn(winmdroot.Graphics.Gdi.HRGN hrgn, int x, int y)
#cfunc OffsetRgn "OffsetRgn" intptr, int, int

; winmdroot.Foundation.BOOL OffsetViewportOrgEx(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, [Optional] global::System.Drawing.Point* lppt)
#cfunc OffsetViewportOrgEx "OffsetViewportOrgEx" intptr, int, int, var

; winmdroot.Foundation.BOOL OffsetWindowOrgEx(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, [Optional] global::System.Drawing.Point* lppt)
#cfunc OffsetWindowOrgEx "OffsetWindowOrgEx" intptr, int, int, var

; winmdroot.Foundation.BOOL PATHOBJ_bEnum(winmdroot.Devices.Display.PATHOBJ* ppo, winmdroot.Devices.Display.PATHDATA* ppd)
#cfunc PATHOBJ_bEnum "PATHOBJ_bEnum" var, var

; winmdroot.Foundation.BOOL PATHOBJ_bEnumClipLines(winmdroot.Devices.Display.PATHOBJ* ppo, uint cb, winmdroot.Devices.Display.CLIPLINE* pcl)
#cfunc PATHOBJ_bEnumClipLines "PATHOBJ_bEnumClipLines" var, int, var

; void PATHOBJ_vEnumStart(winmdroot.Devices.Display.PATHOBJ* ppo)
#func PATHOBJ_vEnumStart "PATHOBJ_vEnumStart" var

; void PATHOBJ_vGetBounds(winmdroot.Devices.Display.PATHOBJ* ppo, winmdroot.Devices.Display.RECTFX* prectfx)
#func PATHOBJ_vGetBounds "PATHOBJ_vGetBounds" var, var

; winmdroot.Foundation.BOOL PaintRgn(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HRGN hrgn)
#cfunc PaintRgn "PaintRgn" intptr, intptr

; winmdroot.Foundation.BOOL PatBlt(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, int w, int h, winmdroot.Graphics.Gdi.ROP_CODE rop)
#cfunc PatBlt "PatBlt" intptr, int, int, int, int, int

; winmdroot.Graphics.Gdi.HRGN PathToRegion(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc PathToRegion "PathToRegion" intptr

; winmdroot.Foundation.BOOL Pie(winmdroot.Graphics.Gdi.HDC hdc, int left, int top, int right, int bottom, int xr1, int yr1, int xr2, int yr2)
#cfunc Pie "Pie" intptr, int, int, int, int, int, int, int, int

; winmdroot.Foundation.BOOL PlayEnhMetaFile(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HENHMETAFILE hmf, winmdroot.Foundation.RECT* lprect)
#cfunc PlayEnhMetaFile "PlayEnhMetaFile" intptr, intptr, var

; winmdroot.Foundation.BOOL PlayEnhMetaFileRecord(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HANDLETABLE* pht, winmdroot.Graphics.Gdi.ENHMETARECORD* pmr, uint cht)
#cfunc PlayEnhMetaFileRecord "PlayEnhMetaFileRecord" intptr, var, var, int

; winmdroot.Foundation.BOOL PlayMetaFile(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HMETAFILE hmf)
#cfunc PlayMetaFile "PlayMetaFile" intptr, intptr

; winmdroot.Foundation.BOOL PlayMetaFileRecord(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HANDLETABLE* lpHandleTable, winmdroot.Graphics.Gdi.METARECORD* lpMR, uint noObjs)
#cfunc PlayMetaFileRecord "PlayMetaFileRecord" intptr, var, var, int

; winmdroot.Foundation.BOOL PlgBlt(winmdroot.Graphics.Gdi.HDC hdcDest, global::System.Drawing.Point* lpPoint, winmdroot.Graphics.Gdi.HDC hdcSrc, int xSrc, int ySrc, int width, int height, winmdroot.Graphics.Gdi.HBITMAP hbmMask, int xMask, int yMask)
#cfunc PlgBlt "PlgBlt" intptr, var, intptr, int, int, int, int, intptr, int, int

; winmdroot.Foundation.BOOL PolyBezier(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* apt, uint cpt)
#cfunc PolyBezier "PolyBezier" intptr, var, int

; winmdroot.Foundation.BOOL PolyBezierTo(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* apt, uint cpt)
#cfunc PolyBezierTo "PolyBezierTo" intptr, var, int

; winmdroot.Foundation.BOOL PolyDraw(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* apt, byte* aj, int cpt)
#cfunc PolyDraw "PolyDraw" intptr, var, var, int

; winmdroot.Foundation.BOOL PolyPolygon(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* apt, int* asz, int csz)
#cfunc PolyPolygon "PolyPolygon" intptr, var, var, int

; winmdroot.Foundation.BOOL PolyPolyline(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* apt, uint* asz, uint csz)
#cfunc PolyPolyline "PolyPolyline" intptr, var, var, int

; winmdroot.Foundation.BOOL PolyTextOutW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.POLYTEXTW* ppt, int nstrings)
#cfunc PolyTextOutW "PolyTextOutW" intptr, var, int

; winmdroot.Foundation.BOOL Polygon(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* apt, int cpt)
#cfunc Polygon "Polygon" intptr, var, int

; winmdroot.Foundation.BOOL Polyline(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* apt, int cpt)
#cfunc Polyline "Polyline" intptr, var, int

; winmdroot.Foundation.BOOL PolylineTo(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* apt, uint cpt)
#cfunc PolylineTo "PolylineTo" intptr, var, int

; winmdroot.Foundation.BOOL PtInRegion(winmdroot.Graphics.Gdi.HRGN hrgn, int x, int y)
#cfunc PtInRegion "PtInRegion" intptr, int, int

; winmdroot.Foundation.BOOL PtVisible(winmdroot.Graphics.Gdi.HDC hdc, int x, int y)
#cfunc PtVisible "PtVisible" intptr, int, int

; uint RealizePalette(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc RealizePalette "RealizePalette" intptr

; winmdroot.Foundation.BOOL RectInRegion(winmdroot.Graphics.Gdi.HRGN hrgn, winmdroot.Foundation.RECT* lprect)
#cfunc RectInRegion "RectInRegion" intptr, var

; winmdroot.Foundation.BOOL RectVisible(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.RECT* lprect)
#cfunc RectVisible "RectVisible" intptr, var

; winmdroot.Foundation.BOOL Rectangle(winmdroot.Graphics.Gdi.HDC hdc, int left, int top, int right, int bottom)
#cfunc Rectangle "Rectangle" intptr, int, int, int, int

; winmdroot.Foundation.BOOL RemoveFontMemResourceEx(winmdroot.Foundation.HANDLE h)
#cfunc RemoveFontMemResourceEx "RemoveFontMemResourceEx" intptr

; winmdroot.Foundation.BOOL RemoveFontResourceW(winmdroot.Foundation.PCWSTR lpFileName)
#cfunc RemoveFontResourceW "RemoveFontResourceW" wstr

; winmdroot.Foundation.BOOL RemoveFontResourceExW(winmdroot.Foundation.PCWSTR name, uint fl, [Optional] void* pdv)
#cfunc RemoveFontResourceExW "RemoveFontResourceExW" wstr, int, intptr

; winmdroot.Graphics.Gdi.HDC ResetDCA(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.DEVMODEA* lpdm)
#cfunc ResetDCA "ResetDCA" intptr, var

; winmdroot.Graphics.Gdi.HDC ResetDCW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.DEVMODEW* lpdm)
#cfunc ResetDCW "ResetDCW" intptr, var

; winmdroot.Foundation.BOOL ResizePalette(winmdroot.Graphics.Gdi.HPALETTE hpal, uint n)
#cfunc ResizePalette "ResizePalette" intptr, int

; winmdroot.Foundation.BOOL RestoreDC(winmdroot.Graphics.Gdi.HDC hdc, int nSavedDC)
#cfunc RestoreDC "RestoreDC" intptr, int

; winmdroot.Foundation.BOOL RoundRect(winmdroot.Graphics.Gdi.HDC hdc, int left, int top, int right, int bottom, int width, int height)
#cfunc RoundRect "RoundRect" intptr, int, int, int, int, int, int

; winmdroot.Foundation.BOOL STROBJ_bEnum(winmdroot.Devices.Display.STROBJ* pstro, uint* pc, winmdroot.Devices.Display.GLYPHPOS** ppgpos)
#cfunc STROBJ_bEnum "STROBJ_bEnum" var, var, var

; winmdroot.Foundation.BOOL STROBJ_bEnumPositionsOnly(winmdroot.Devices.Display.STROBJ* pstro, uint* pc, winmdroot.Devices.Display.GLYPHPOS** ppgpos)
#cfunc STROBJ_bEnumPositionsOnly "STROBJ_bEnumPositionsOnly" var, var, var

; winmdroot.Foundation.BOOL STROBJ_bGetAdvanceWidths(winmdroot.Devices.Display.STROBJ* pso, uint iFirst, uint c, winmdroot.Devices.Display.POINTQF* pptqD)
#cfunc STROBJ_bGetAdvanceWidths "STROBJ_bGetAdvanceWidths" var, int, int, var

; uint STROBJ_dwGetCodePage(winmdroot.Devices.Display.STROBJ* pstro)
#cfunc STROBJ_dwGetCodePage "STROBJ_dwGetCodePage" var

; void STROBJ_vEnumStart(winmdroot.Devices.Display.STROBJ* pstro)
#func STROBJ_vEnumStart "STROBJ_vEnumStart" var

; int SaveDC(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc SaveDC "SaveDC" intptr

; winmdroot.Foundation.BOOL ScaleViewportExtEx(winmdroot.Graphics.Gdi.HDC hdc, int xn, int dx, int yn, int yd, [Optional] winmdroot.Foundation.SIZE* lpsz)
#cfunc ScaleViewportExtEx "ScaleViewportExtEx" intptr, int, int, int, int, var

; winmdroot.Foundation.BOOL ScaleWindowExtEx(winmdroot.Graphics.Gdi.HDC hdc, int xn, int xd, int yn, int yd, [Optional] winmdroot.Foundation.SIZE* lpsz)
#cfunc ScaleWindowExtEx "ScaleWindowExtEx" intptr, int, int, int, int, var

; winmdroot.Foundation.BOOL SelectClipPath(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.RGN_COMBINE_MODE mode)
#cfunc SelectClipPath "SelectClipPath" intptr, int

; winmdroot.Graphics.Gdi.GDI_REGION_TYPE SelectClipRgn(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HRGN hrgn)
#cfunc SelectClipRgn "SelectClipRgn" intptr, intptr

; winmdroot.Graphics.Gdi.HGDIOBJ SelectObject(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HGDIOBJ h)
#cfunc SelectObject "SelectObject" intptr, intptr

; winmdroot.Graphics.Gdi.HPALETTE SelectPalette(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HPALETTE hPal, winmdroot.Foundation.BOOL bForceBkgd)
#cfunc SelectPalette "SelectPalette" intptr, intptr, int

; int SetAbortProc(winmdroot.Graphics.Gdi.HDC hdc, delegate *unmanaged[Stdcall]<global::Windows.Win32.Graphics.Gdi.HDC,int,global::Windows.Win32.Foundation.BOOL> proc)
#cfunc SetAbortProc "SetAbortProc" intptr, int

; int SetArcDirection(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.ARC_DIRECTION dir)
#cfunc SetArcDirection "SetArcDirection" intptr, int

; int SetBitmapBits(winmdroot.Graphics.Gdi.HBITMAP hbm, uint cb, void* pvBits)
#cfunc SetBitmapBits "SetBitmapBits" intptr, int, intptr

; winmdroot.Foundation.BOOL SetBitmapDimensionEx(winmdroot.Graphics.Gdi.HBITMAP hbm, int w, int h, [Optional] winmdroot.Foundation.SIZE* lpsz)
#cfunc SetBitmapDimensionEx "SetBitmapDimensionEx" intptr, int, int, var

; winmdroot.Foundation.COLORREF SetBkColor(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.COLORREF color)
#cfunc SetBkColor "SetBkColor" intptr, int

; int SetBkMode(winmdroot.Graphics.Gdi.HDC hdc, int mode)
#cfunc SetBkMode "SetBkMode" intptr, int

; uint SetBoundsRect(winmdroot.Graphics.Gdi.HDC hdc, [Optional] winmdroot.Foundation.RECT* lprect, winmdroot.Graphics.Gdi.SET_BOUNDS_RECT_FLAGS flags)
#cfunc SetBoundsRect "SetBoundsRect" intptr, var, int

; winmdroot.Foundation.BOOL SetBrushOrgEx(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, [Optional] global::System.Drawing.Point* lppt)
#cfunc SetBrushOrgEx "SetBrushOrgEx" intptr, int, int, var

; winmdroot.Foundation.BOOL SetColorAdjustment(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.COLORADJUSTMENT* lpca)
#cfunc SetColorAdjustment "SetColorAdjustment" intptr, var

; winmdroot.UI.ColorSystem.HCOLORSPACE SetColorSpace(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.UI.ColorSystem.HCOLORSPACE hcs)
#cfunc SetColorSpace "SetColorSpace" intptr, intptr

; winmdroot.Foundation.COLORREF SetDCBrushColor(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.COLORREF color)
#cfunc SetDCBrushColor "SetDCBrushColor" intptr, int

; winmdroot.Foundation.COLORREF SetDCPenColor(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.COLORREF color)
#cfunc SetDCPenColor "SetDCPenColor" intptr, int

; uint SetDIBColorTable(winmdroot.Graphics.Gdi.HDC hdc, uint iStart, uint cEntries, winmdroot.Graphics.Gdi.RGBQUAD* prgbq)
#cfunc SetDIBColorTable "SetDIBColorTable" intptr, int, int, var

; int SetDIBits(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HBITMAP hbm, uint start, uint cLines, void* lpBits, winmdroot.Graphics.Gdi.BITMAPINFO* lpbmi, winmdroot.Graphics.Gdi.DIB_USAGE ColorUse)
#cfunc SetDIBits "SetDIBits" intptr, intptr, int, int, intptr, var, int

; int SetDIBitsToDevice(winmdroot.Graphics.Gdi.HDC hdc, int xDest, int yDest, uint w, uint h, int xSrc, int ySrc, uint StartScan, uint cLines, void* lpvBits, winmdroot.Graphics.Gdi.BITMAPINFO* lpbmi, winmdroot.Graphics.Gdi.DIB_USAGE ColorUse)
#cfunc SetDIBitsToDevice "SetDIBitsToDevice" intptr, int, int, int, int, int, int, int, int, intptr, var, int

; winmdroot.Foundation.BOOL SetDeviceGammaRamp(winmdroot.Graphics.Gdi.HDC hdc, void* lpRamp)
#cfunc SetDeviceGammaRamp "SetDeviceGammaRamp" intptr, intptr

; winmdroot.Graphics.Gdi.HENHMETAFILE SetEnhMetaFileBits(uint nSize, byte* pb)
#cfunc SetEnhMetaFileBits "SetEnhMetaFileBits" int, var

; int SetGraphicsMode(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.GRAPHICS_MODE iMode)
#cfunc SetGraphicsMode "SetGraphicsMode" intptr, int

; int SetICMMode(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.UI.ColorSystem.ICM_MODE mode)
#cfunc SetICMMode "SetICMMode" intptr, int

; winmdroot.Foundation.BOOL SetICMProfileW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.PWSTR lpFileName)
#cfunc SetICMProfileW "SetICMProfileW" intptr, wstr

; uint SetLayout(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.DC_LAYOUT l)
#cfunc SetLayout "SetLayout" intptr, int

; int SetMapMode(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HDC_MAP_MODE iMode)
#cfunc SetMapMode "SetMapMode" intptr, int

; uint SetMapperFlags(winmdroot.Graphics.Gdi.HDC hdc, uint flags)
#cfunc SetMapperFlags "SetMapperFlags" intptr, int

; winmdroot.Graphics.Gdi.HMETAFILE SetMetaFileBitsEx(uint cbBuffer, byte* lpData)
#cfunc SetMetaFileBitsEx "SetMetaFileBitsEx" int, var

; winmdroot.Graphics.Gdi.GDI_REGION_TYPE SetMetaRgn(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc SetMetaRgn "SetMetaRgn" intptr

; winmdroot.Foundation.BOOL SetMiterLimit(winmdroot.Graphics.Gdi.HDC hdc, float limit, [Optional] float* old)
#cfunc SetMiterLimit "SetMiterLimit" intptr, float, var

; uint SetPaletteEntries(winmdroot.Graphics.Gdi.HPALETTE hpal, uint iStart, uint cEntries, winmdroot.Graphics.Gdi.PALETTEENTRY* pPalEntries)
#cfunc SetPaletteEntries "SetPaletteEntries" intptr, int, int, var

; winmdroot.Foundation.COLORREF SetPixel(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, winmdroot.Foundation.COLORREF color)
#cfunc SetPixel "SetPixel" intptr, int, int, int

; winmdroot.Foundation.BOOL SetPixelFormat(winmdroot.Graphics.Gdi.HDC hdc, int format, winmdroot.Graphics.OpenGL.PIXELFORMATDESCRIPTOR* ppfd)
#cfunc SetPixelFormat "SetPixelFormat" intptr, int, var

; winmdroot.Foundation.BOOL SetPixelV(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, winmdroot.Foundation.COLORREF color)
#cfunc SetPixelV "SetPixelV" intptr, int, int, int

; int SetPolyFillMode(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.CREATE_POLYGON_RGN_MODE mode)
#cfunc SetPolyFillMode "SetPolyFillMode" intptr, int

; int SetROP2(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.R2_MODE rop2)
#cfunc SetROP2 "SetROP2" intptr, int

; winmdroot.Foundation.BOOL SetRectRgn(winmdroot.Graphics.Gdi.HRGN hrgn, int left, int top, int right, int bottom)
#cfunc SetRectRgn "SetRectRgn" intptr, int, int, int, int

; int SetStretchBltMode(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.STRETCH_BLT_MODE mode)
#cfunc SetStretchBltMode "SetStretchBltMode" intptr, int

; uint SetSystemPaletteUse(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.SYSTEM_PALETTE_USE use)
#cfunc SetSystemPaletteUse "SetSystemPaletteUse" intptr, int

; uint SetTextAlign(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.TEXT_ALIGN_OPTIONS align)
#cfunc SetTextAlign "SetTextAlign" intptr, int

; int SetTextCharacterExtra(winmdroot.Graphics.Gdi.HDC hdc, int extra)
#cfunc SetTextCharacterExtra "SetTextCharacterExtra" intptr, int

; winmdroot.Foundation.COLORREF SetTextColor(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.COLORREF color)
#cfunc SetTextColor "SetTextColor" intptr, int

; winmdroot.Foundation.BOOL SetTextJustification(winmdroot.Graphics.Gdi.HDC hdc, int extra, int count)
#cfunc SetTextJustification "SetTextJustification" intptr, int, int

; winmdroot.Foundation.BOOL SetViewportExtEx(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, [Optional] winmdroot.Foundation.SIZE* lpsz)
#cfunc SetViewportExtEx "SetViewportExtEx" intptr, int, int, var

; winmdroot.Foundation.BOOL SetViewportOrgEx(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, [Optional] global::System.Drawing.Point* lppt)
#cfunc SetViewportOrgEx "SetViewportOrgEx" intptr, int, int, var

; winmdroot.Graphics.Gdi.HENHMETAFILE SetWinMetaFileBits(uint nSize, byte* lpMeta16Data, winmdroot.Graphics.Gdi.HDC hdcRef, [Optional] winmdroot.System.DataExchange.METAFILEPICT* lpMFP)
#cfunc SetWinMetaFileBits "SetWinMetaFileBits" int, var, intptr, var

; winmdroot.Foundation.BOOL SetWindowExtEx(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, [Optional] winmdroot.Foundation.SIZE* lpsz)
#cfunc SetWindowExtEx "SetWindowExtEx" intptr, int, int, var

; winmdroot.Foundation.BOOL SetWindowOrgEx(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, [Optional] global::System.Drawing.Point* lppt)
#cfunc SetWindowOrgEx "SetWindowOrgEx" intptr, int, int, var

; winmdroot.Foundation.BOOL SetWorldTransform(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.XFORM* lpxf)
#cfunc SetWorldTransform "SetWorldTransform" intptr, var

; int StartDocW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Storage.Xps.DOCINFOW* lpdi)
#cfunc StartDocW "StartDocW" intptr, var

; int StartPage(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc StartPage "StartPage" intptr

; winmdroot.Foundation.BOOL StretchBlt(winmdroot.Graphics.Gdi.HDC hdcDest, int xDest, int yDest, int wDest, int hDest, winmdroot.Graphics.Gdi.HDC hdcSrc, int xSrc, int ySrc, int wSrc, int hSrc, winmdroot.Graphics.Gdi.ROP_CODE rop)
#cfunc StretchBlt "StretchBlt" intptr, int, int, int, int, intptr, int, int, int, int, int

; int StretchDIBits(winmdroot.Graphics.Gdi.HDC hdc, int xDest, int yDest, int DestWidth, int DestHeight, int xSrc, int ySrc, int SrcWidth, int SrcHeight, [Optional] void* lpBits, winmdroot.Graphics.Gdi.BITMAPINFO* lpbmi, winmdroot.Graphics.Gdi.DIB_USAGE iUsage, winmdroot.Graphics.Gdi.ROP_CODE rop)
#cfunc StretchDIBits "StretchDIBits" intptr, int, int, int, int, int, int, int, int, intptr, var, int, int

; winmdroot.Foundation.BOOL StrokeAndFillPath(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc StrokeAndFillPath "StrokeAndFillPath" intptr

; winmdroot.Foundation.BOOL StrokePath(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc StrokePath "StrokePath" intptr

; winmdroot.Foundation.BOOL SwapBuffers(winmdroot.Graphics.Gdi.HDC param0)
#cfunc SwapBuffers "SwapBuffers" intptr

; winmdroot.Foundation.BOOL TextOutW(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, winmdroot.Foundation.PCWSTR lpString, int c)
#cfunc TextOutW "TextOutW" intptr, int, int, wstr, int

; winmdroot.Foundation.BOOL TranslateCharsetInfo(uint* lpSrc, winmdroot.Globalization.CHARSETINFO* lpCs, winmdroot.Globalization.TRANSLATE_CHARSET_INFO_FLAGS dwFlags)
#cfunc TranslateCharsetInfo "TranslateCharsetInfo" var, var, int

; winmdroot.Foundation.BOOL UnrealizeObject(winmdroot.Graphics.Gdi.HGDIOBJ h)
#cfunc UnrealizeObject "UnrealizeObject" intptr

; winmdroot.Foundation.BOOL UpdateColors(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc UpdateColors "UpdateColors" intptr

; winmdroot.Foundation.BOOL UpdateICMRegKeyW(uint reserved, winmdroot.Foundation.PWSTR lpszCMID, winmdroot.Foundation.PWSTR lpszFileName, winmdroot.UI.ColorSystem.ICM_COMMAND command)
#cfunc UpdateICMRegKeyW "UpdateICMRegKeyW" int, wstr, wstr, int

; winmdroot.Foundation.BOOL WidenPath(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc WidenPath "WidenPath" intptr

; winmdroot.Foundation.BOOL XFORMOBJ_bApplyXform(winmdroot.Devices.Display.XFORMOBJ* pxo, uint iMode, uint cPoints, void* pvIn, void* pvOut)
#cfunc XFORMOBJ_bApplyXform "XFORMOBJ_bApplyXform" var, int, int, intptr, intptr

; uint XLATEOBJ_cGetPalette(winmdroot.Devices.Display.XLATEOBJ* pxlo, uint iPal, uint cPal, uint* pPal)
#cfunc XLATEOBJ_cGetPalette "XLATEOBJ_cGetPalette" var, int, int, var

; winmdroot.Foundation.HANDLE XLATEOBJ_hGetColorTransform(winmdroot.Devices.Display.XLATEOBJ* pxlo)
#cfunc XLATEOBJ_hGetColorTransform "XLATEOBJ_hGetColorTransform" var

; uint XLATEOBJ_iXlate(winmdroot.Devices.Display.XLATEOBJ* pxlo, uint iColor)
#cfunc XLATEOBJ_iXlate "XLATEOBJ_iXlate" var, int

; uint* XLATEOBJ_piVector(winmdroot.Devices.Display.XLATEOBJ* pxlo)
#cfunc XLATEOBJ_piVector "XLATEOBJ_piVector" var

#endif
