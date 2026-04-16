; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    gdi32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __gdi32_gen2_as__
#define global __gdi32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "gdi32.dll"
; winmdroot.Foundation.BOOL DeleteObject(winmdroot.Graphics.Gdi.HGDIOBJ ho)
#cfunc global DeleteObject "DeleteObject" intptr

; int AbortDoc(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global AbortDoc "AbortDoc" intptr

; winmdroot.Foundation.BOOL AbortPath(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global AbortPath "AbortPath" intptr

; winmdroot.Foundation.HANDLE AddFontMemResourceEx(void* pFileView, uint cjSize, [Optional] void* pvResrved, uint* pNumFonts)
#cfunc global AddFontMemResourceEx "AddFontMemResourceEx" intptr, int, intptr, var

; int AddFontResourceW(winmdroot.Foundation.PCWSTR param0)
#cfunc global AddFontResourceW "AddFontResourceW" wstr

; int AddFontResourceExW(winmdroot.Foundation.PCWSTR name, winmdroot.Graphics.Gdi.FONT_RESOURCE_CHARACTERISTICS fl, [Optional] void* res)
#cfunc global AddFontResourceExW "AddFontResourceExW" wstr, int, intptr

; winmdroot.Foundation.BOOL AngleArc(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, uint r, float StartAngle, float SweepAngle)
#cfunc global AngleArc "AngleArc" intptr, int, int, int, float, float

; winmdroot.Foundation.BOOL AnimatePalette(winmdroot.Graphics.Gdi.HPALETTE hPal, uint iStartIndex, uint cEntries, winmdroot.Graphics.Gdi.PALETTEENTRY* ppe)
#cfunc global AnimatePalette "AnimatePalette" intptr, int, int, var

; winmdroot.Foundation.BOOL Arc(winmdroot.Graphics.Gdi.HDC hdc, int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4)
#cfunc global Arc "Arc" intptr, int, int, int, int, int, int, int, int

; winmdroot.Foundation.BOOL ArcTo(winmdroot.Graphics.Gdi.HDC hdc, int left, int top, int right, int bottom, int xr1, int yr1, int xr2, int yr2)
#cfunc global ArcTo "ArcTo" intptr, int, int, int, int, int, int, int, int

; winmdroot.Foundation.HANDLE BRUSHOBJ_hGetColorTransform(winmdroot.Devices.Display.BRUSHOBJ* pbo)
#cfunc global BRUSHOBJ_hGetColorTransform "BRUSHOBJ_hGetColorTransform" var

; void* BRUSHOBJ_pvAllocRbrush(winmdroot.Devices.Display.BRUSHOBJ* pbo, uint cj)
#cfunc global BRUSHOBJ_pvAllocRbrush "BRUSHOBJ_pvAllocRbrush" var, int

; void* BRUSHOBJ_pvGetRbrush(winmdroot.Devices.Display.BRUSHOBJ* pbo)
#cfunc global BRUSHOBJ_pvGetRbrush "BRUSHOBJ_pvGetRbrush" var

; uint BRUSHOBJ_ulGetBrushColor(winmdroot.Devices.Display.BRUSHOBJ* pbo)
#cfunc global BRUSHOBJ_ulGetBrushColor "BRUSHOBJ_ulGetBrushColor" var

; winmdroot.Foundation.BOOL BeginPath(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global BeginPath "BeginPath" intptr

; winmdroot.Foundation.BOOL BitBlt(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, int cx, int cy, winmdroot.Graphics.Gdi.HDC hdcSrc, int x1, int y1, winmdroot.Graphics.Gdi.ROP_CODE rop)
#cfunc global BitBlt "BitBlt" intptr, int, int, int, int, intptr, int, int, int

; winmdroot.Foundation.BOOL CLIPOBJ_bEnum(winmdroot.Devices.Display.CLIPOBJ* pco, uint cj, uint* pul)
#cfunc global CLIPOBJ_bEnum "CLIPOBJ_bEnum" var, int, var

; uint CLIPOBJ_cEnumStart(winmdroot.Devices.Display.CLIPOBJ* pco, winmdroot.Foundation.BOOL bAll, uint iType, uint iDirection, uint cLimit)
#cfunc global CLIPOBJ_cEnumStart "CLIPOBJ_cEnumStart" var, int, int, int, int

; winmdroot.Devices.Display.PATHOBJ* CLIPOBJ_ppoGetPath(winmdroot.Devices.Display.CLIPOBJ* pco)
#cfunc global CLIPOBJ_ppoGetPath "CLIPOBJ_ppoGetPath" var

; winmdroot.Foundation.BOOL CancelDC(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global CancelDC "CancelDC" intptr

; winmdroot.Foundation.BOOL CheckColorsInGamut(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.RGBTRIPLE* lpRGBTriple, void* dlpBuffer, uint nCount)
#cfunc global CheckColorsInGamut "CheckColorsInGamut" intptr, var, intptr, int

; int ChoosePixelFormat(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.OpenGL.PIXELFORMATDESCRIPTOR* ppfd)
#cfunc global ChoosePixelFormat "ChoosePixelFormat" intptr, var

; winmdroot.Foundation.BOOL Chord(winmdroot.Graphics.Gdi.HDC hdc, int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4)
#cfunc global Chord "Chord" intptr, int, int, int, int, int, int, int, int

; winmdroot.Foundation.BOOL DeleteEnhMetaFile(winmdroot.Graphics.Gdi.HENHMETAFILE hmf)
#cfunc global DeleteEnhMetaFile "DeleteEnhMetaFile" intptr

; winmdroot.Graphics.Gdi.HENHMETAFILE CloseEnhMetaFile(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global CloseEnhMetaFile "CloseEnhMetaFile" intptr

; winmdroot.Foundation.BOOL CloseFigure(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global CloseFigure "CloseFigure" intptr

; winmdroot.Foundation.BOOL DeleteMetaFile(winmdroot.Graphics.Gdi.HMETAFILE hmf)
#cfunc global DeleteMetaFile "DeleteMetaFile" intptr

; winmdroot.Graphics.Gdi.HMETAFILE CloseMetaFile(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global CloseMetaFile "CloseMetaFile" intptr

; winmdroot.Foundation.BOOL ColorCorrectPalette(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HPALETTE hPal, uint deFirst, uint num)
#cfunc global ColorCorrectPalette "ColorCorrectPalette" intptr, intptr, int, int

; winmdroot.Foundation.BOOL ColorMatchToTarget(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HDC hdcTarget, winmdroot.UI.ColorSystem.COLOR_MATCH_TO_TARGET_ACTION action)
#cfunc global ColorMatchToTarget "ColorMatchToTarget" intptr, intptr, int

; winmdroot.Graphics.Gdi.GDI_REGION_TYPE CombineRgn(winmdroot.Graphics.Gdi.HRGN hrgnDst, winmdroot.Graphics.Gdi.HRGN hrgnSrc1, winmdroot.Graphics.Gdi.HRGN hrgnSrc2, winmdroot.Graphics.Gdi.RGN_COMBINE_MODE iMode)
#cfunc global CombineRgn "CombineRgn" intptr, intptr, intptr, int

; winmdroot.Foundation.BOOL CombineTransform(winmdroot.Graphics.Gdi.XFORM* lpxfOut, winmdroot.Graphics.Gdi.XFORM* lpxf1, winmdroot.Graphics.Gdi.XFORM* lpxf2)
#cfunc global CombineTransform "CombineTransform" var, var, var

; winmdroot.Graphics.Gdi.HENHMETAFILE CopyEnhMetaFileW(winmdroot.Graphics.Gdi.HENHMETAFILE hEnh, winmdroot.Foundation.PCWSTR lpFileName)
#cfunc global CopyEnhMetaFileW "CopyEnhMetaFileW" intptr, wstr

; winmdroot.Graphics.Gdi.HMETAFILE CopyMetaFileW(winmdroot.Graphics.Gdi.HMETAFILE param0, winmdroot.Foundation.PCWSTR param1)
#cfunc global CopyMetaFileW "CopyMetaFileW" intptr, wstr

; winmdroot.Graphics.Gdi.HBITMAP CreateBitmap(int nWidth, int nHeight, uint nPlanes, uint nBitCount, [Optional] void* lpBits)
#cfunc global CreateBitmap "CreateBitmap" int, int, int, int, intptr

; winmdroot.Graphics.Gdi.HBITMAP CreateBitmapIndirect(winmdroot.Graphics.Gdi.BITMAP* pbm)
#cfunc global CreateBitmapIndirect "CreateBitmapIndirect" var

; winmdroot.Graphics.Gdi.HBRUSH CreateBrushIndirect(winmdroot.Graphics.Gdi.LOGBRUSH* plbrush)
#cfunc global CreateBrushIndirect "CreateBrushIndirect" var

; winmdroot.Foundation.BOOL DeleteColorSpace(winmdroot.UI.ColorSystem.HCOLORSPACE hcs)
#cfunc global DeleteColorSpace "DeleteColorSpace" intptr

; winmdroot.UI.ColorSystem.HCOLORSPACE CreateColorSpaceW(winmdroot.UI.ColorSystem.LOGCOLORSPACEW* lplcs)
#cfunc global CreateColorSpaceW "CreateColorSpaceW" var

; winmdroot.Graphics.Gdi.HBITMAP CreateCompatibleBitmap(winmdroot.Graphics.Gdi.HDC hdc, int cx, int cy)
#cfunc global CreateCompatibleBitmap "CreateCompatibleBitmap" intptr, int, int

; winmdroot.Graphics.Gdi.HDC CreateCompatibleDC(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global CreateCompatibleDC "CreateCompatibleDC" intptr

; winmdroot.Graphics.Gdi.HDC CreateDCA(winmdroot.Foundation.PCSTR pwszDriver, winmdroot.Foundation.PCSTR pwszDevice, winmdroot.Foundation.PCSTR pszPort, [Optional] winmdroot.Graphics.Gdi.DEVMODEA* pdm)
#cfunc global CreateDCA "CreateDCA" str, str, str, var

; winmdroot.Graphics.Gdi.HDC CreateDCW(winmdroot.Foundation.PCWSTR pwszDriver, winmdroot.Foundation.PCWSTR pwszDevice, winmdroot.Foundation.PCWSTR pszPort, [Optional] winmdroot.Graphics.Gdi.DEVMODEW* pdm)
#cfunc global CreateDCW "CreateDCW" wstr, wstr, wstr, var

; winmdroot.Graphics.Gdi.HBRUSH CreateDIBPatternBrush(winmdroot.Foundation.HGLOBAL h, winmdroot.Graphics.Gdi.DIB_USAGE iUsage)
#cfunc global CreateDIBPatternBrush "CreateDIBPatternBrush" int, int

; winmdroot.Graphics.Gdi.HBRUSH CreateDIBPatternBrushPt(void* lpPackedDIB, winmdroot.Graphics.Gdi.DIB_USAGE iUsage)
#cfunc global CreateDIBPatternBrushPt "CreateDIBPatternBrushPt" intptr, int

; winmdroot.Graphics.Gdi.HBITMAP CreateDIBSection(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.BITMAPINFO* pbmi, winmdroot.Graphics.Gdi.DIB_USAGE usage, void** ppvBits, winmdroot.Foundation.HANDLE hSection, uint offset)
#cfunc global CreateDIBSection "CreateDIBSection" intptr, var, int, var, intptr, int

; winmdroot.Graphics.Gdi.HBITMAP CreateDIBitmap(winmdroot.Graphics.Gdi.HDC hdc, [Optional] winmdroot.Graphics.Gdi.BITMAPINFOHEADER* pbmih, uint flInit, [Optional] void* pjBits, [Optional] winmdroot.Graphics.Gdi.BITMAPINFO* pbmi, winmdroot.Graphics.Gdi.DIB_USAGE iUsage)
#cfunc global CreateDIBitmap "CreateDIBitmap" intptr, var, int, intptr, var, int

; winmdroot.Graphics.Gdi.HBITMAP CreateDiscardableBitmap(winmdroot.Graphics.Gdi.HDC hdc, int cx, int cy)
#cfunc global CreateDiscardableBitmap "CreateDiscardableBitmap" intptr, int, int

; winmdroot.Graphics.Gdi.HRGN CreateEllipticRgn(int x1, int y1, int x2, int y2)
#cfunc global CreateEllipticRgn "CreateEllipticRgn" int, int, int, int

; winmdroot.Graphics.Gdi.HRGN CreateEllipticRgnIndirect(winmdroot.Foundation.RECT* lprect)
#cfunc global CreateEllipticRgnIndirect "CreateEllipticRgnIndirect" var

; winmdroot.Graphics.Gdi.HDC CreateEnhMetaFileW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.PCWSTR lpFilename, [Optional] winmdroot.Foundation.RECT* lprc, winmdroot.Foundation.PCWSTR lpDesc)
#cfunc global CreateEnhMetaFileW "CreateEnhMetaFileW" intptr, wstr, var, wstr

; winmdroot.Graphics.Gdi.HFONT CreateFontW(int cHeight, int cWidth, int cEscapement, int cOrientation, int cWeight, uint bItalic, uint bUnderline, uint bStrikeOut, uint iCharSet, uint iOutPrecision, uint iClipPrecision, uint iQuality, uint iPitchAndFamily, winmdroot.Foundation.PCWSTR pszFaceName)
#cfunc global CreateFontW "CreateFontW" int, int, int, int, int, int, int, int, int, int, int, int, int, wstr

; winmdroot.Graphics.Gdi.HFONT CreateFontIndirectW(winmdroot.Graphics.Gdi.LOGFONTW* lplf)
#cfunc global CreateFontIndirectW "CreateFontIndirectW" var

; winmdroot.Graphics.Gdi.HFONT CreateFontIndirectExW(winmdroot.Graphics.Gdi.ENUMLOGFONTEXDVW* param0)
#cfunc global CreateFontIndirectExW "CreateFontIndirectExW" var

; winmdroot.Graphics.Gdi.HPALETTE CreateHalftonePalette(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global CreateHalftonePalette "CreateHalftonePalette" intptr

; winmdroot.Graphics.Gdi.HBRUSH CreateHatchBrush(winmdroot.Graphics.Gdi.HATCH_BRUSH_STYLE iHatch, winmdroot.Foundation.COLORREF color)
#cfunc global CreateHatchBrush "CreateHatchBrush" int, int

; winmdroot.Graphics.Gdi.HDC CreateICA(winmdroot.Foundation.PCSTR pszDriver, winmdroot.Foundation.PCSTR pszDevice, winmdroot.Foundation.PCSTR pszPort, [Optional] winmdroot.Graphics.Gdi.DEVMODEA* pdm)
#cfunc global CreateICA "CreateICA" str, str, str, var

; winmdroot.Graphics.Gdi.HDC CreateICW(winmdroot.Foundation.PCWSTR pszDriver, winmdroot.Foundation.PCWSTR pszDevice, winmdroot.Foundation.PCWSTR pszPort, [Optional] winmdroot.Graphics.Gdi.DEVMODEW* pdm)
#cfunc global CreateICW "CreateICW" wstr, wstr, wstr, var

; winmdroot.Graphics.Gdi.HDC CreateMetaFileW(winmdroot.Foundation.PCWSTR pszFile)
#cfunc global CreateMetaFileW "CreateMetaFileW" wstr

; winmdroot.Graphics.Gdi.HPALETTE CreatePalette(winmdroot.Graphics.Gdi.LOGPALETTE* plpal)
#cfunc global CreatePalette "CreatePalette" var

; winmdroot.Graphics.Gdi.HBRUSH CreatePatternBrush(winmdroot.Graphics.Gdi.HBITMAP hbm)
#cfunc global CreatePatternBrush "CreatePatternBrush" intptr

; winmdroot.Graphics.Gdi.HPEN CreatePen(winmdroot.Graphics.Gdi.PEN_STYLE iStyle, int cWidth, winmdroot.Foundation.COLORREF color)
#cfunc global CreatePen "CreatePen" int, int, int

; winmdroot.Graphics.Gdi.HPEN CreatePenIndirect(winmdroot.Graphics.Gdi.LOGPEN* plpen)
#cfunc global CreatePenIndirect "CreatePenIndirect" var

; winmdroot.Graphics.Gdi.HRGN CreatePolyPolygonRgn(global::System.Drawing.Point* pptl, int* pc, int cPoly, winmdroot.Graphics.Gdi.CREATE_POLYGON_RGN_MODE iMode)
#cfunc global CreatePolyPolygonRgn "CreatePolyPolygonRgn" var, var, int, int

; winmdroot.Graphics.Gdi.HRGN CreatePolygonRgn(global::System.Drawing.Point* pptl, int cPoint, winmdroot.Graphics.Gdi.CREATE_POLYGON_RGN_MODE iMode)
#cfunc global CreatePolygonRgn "CreatePolygonRgn" var, int, int

; winmdroot.Graphics.Gdi.HRGN CreateRectRgn(int x1, int y1, int x2, int y2)
#cfunc global CreateRectRgn "CreateRectRgn" int, int, int, int

; winmdroot.Graphics.Gdi.HRGN CreateRectRgnIndirect(winmdroot.Foundation.RECT* lprect)
#cfunc global CreateRectRgnIndirect "CreateRectRgnIndirect" var

; winmdroot.Graphics.Gdi.HRGN CreateRoundRectRgn(int x1, int y1, int x2, int y2, int w, int h)
#cfunc global CreateRoundRectRgn "CreateRoundRectRgn" int, int, int, int, int, int

; winmdroot.Foundation.BOOL CreateScalableFontResource(uint fdwHidden, winmdroot.Foundation.PCWSTR lpszFont, winmdroot.Foundation.PCWSTR lpszFile, winmdroot.Foundation.PCWSTR lpszPath)
#cfunc global CreateScalableFontResourceW "CreateScalableFontResourceW" int, wstr, wstr, wstr

; winmdroot.Graphics.Gdi.HBRUSH CreateSolidBrush(winmdroot.Foundation.COLORREF color)
#cfunc global CreateSolidBrush "CreateSolidBrush" int

; winmdroot.Foundation.BOOL DPtoLP(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* lppt, int c)
#cfunc global DPtoLP "DPtoLP" intptr, var, int

; winmdroot.Foundation.BOOL DeleteDC(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global DeleteDC "DeleteDC" intptr

; int DescribePixelFormat(winmdroot.Graphics.Gdi.HDC hdc, int iPixelFormat, uint nBytes, [Optional] winmdroot.Graphics.OpenGL.PIXELFORMATDESCRIPTOR* ppfd)
#cfunc global DescribePixelFormat "DescribePixelFormat" intptr, int, int, var

; int DrawEscape(winmdroot.Graphics.Gdi.HDC hdc, int iEscape, int cjIn, winmdroot.Foundation.PCSTR lpIn)
#cfunc global DrawEscape "DrawEscape" intptr, int, int, str

; winmdroot.Foundation.BOOL Ellipse(winmdroot.Graphics.Gdi.HDC hdc, int left, int top, int right, int bottom)
#cfunc global Ellipse "Ellipse" intptr, int, int, int, int

; int EndDoc(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global EndDoc "EndDoc" intptr

; int EndPage(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global EndPage "EndPage" intptr

; winmdroot.Foundation.BOOL EndPath(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global EndPath "EndPath" intptr

; void EngDeleteSemaphore(winmdroot.Devices.Display.HSEMAPHORE hsem)
#func global EngDeleteSemaphore "EngDeleteSemaphore" intptr

; void EngAcquireSemaphore(winmdroot.Devices.Display.HSEMAPHORE hsem)
#func global EngAcquireSemaphore "EngAcquireSemaphore" intptr

; winmdroot.Foundation.BOOL EngAlphaBlend(winmdroot.Devices.Display.SURFOBJ* psoDest, winmdroot.Devices.Display.SURFOBJ* psoSrc, winmdroot.Devices.Display.CLIPOBJ* pco, winmdroot.Devices.Display.XLATEOBJ* pxlo, winmdroot.Foundation.RECTL* prclDest, winmdroot.Foundation.RECTL* prclSrc, winmdroot.Devices.Display.BLENDOBJ* pBlendObj)
#cfunc global EngAlphaBlend "EngAlphaBlend" var, var, var, var, var, var, var

; winmdroot.Foundation.BOOL EngAssociateSurface(winmdroot.Devices.Display.HSURF hsurf, winmdroot.Devices.Display.HDEV hdev, uint flHooks)
#cfunc global EngAssociateSurface "EngAssociateSurface" intptr, intptr, int

; winmdroot.Foundation.BOOL EngBitBlt(winmdroot.Devices.Display.SURFOBJ* psoTrg, winmdroot.Devices.Display.SURFOBJ* psoSrc, winmdroot.Devices.Display.SURFOBJ* psoMask, winmdroot.Devices.Display.CLIPOBJ* pco, winmdroot.Devices.Display.XLATEOBJ* pxlo, winmdroot.Foundation.RECTL* prclTrg, winmdroot.Foundation.POINTL* pptlSrc, winmdroot.Foundation.POINTL* pptlMask, winmdroot.Devices.Display.BRUSHOBJ* pbo, winmdroot.Foundation.POINTL* pptlBrush, uint rop4)
#cfunc global EngBitBlt "EngBitBlt" var, var, var, var, var, var, var, var, var, var, int

; winmdroot.Foundation.BOOL EngCheckAbort(winmdroot.Devices.Display.SURFOBJ* pso)
#cfunc global EngCheckAbort "EngCheckAbort" var

; winmdroot.Devices.Display.FD_GLYPHSET* EngComputeGlyphSet(int nCodePage, int nFirstChar, int cChars)
#cfunc global EngComputeGlyphSet "EngComputeGlyphSet" int, int, int

; winmdroot.Foundation.BOOL EngCopyBits(winmdroot.Devices.Display.SURFOBJ* psoDest, winmdroot.Devices.Display.SURFOBJ* psoSrc, winmdroot.Devices.Display.CLIPOBJ* pco, winmdroot.Devices.Display.XLATEOBJ* pxlo, winmdroot.Foundation.RECTL* prclDest, winmdroot.Foundation.POINTL* pptlSrc)
#cfunc global EngCopyBits "EngCopyBits" var, var, var, var, var, var

; winmdroot.Graphics.Gdi.HBITMAP EngCreateBitmap(winmdroot.Foundation.SIZE sizl, int lWidth, uint iFormat, uint fl, void* pvBits)
#cfunc global EngCreateBitmap "EngCreateBitmap" var, int, int, int, intptr

; winmdroot.Devices.Display.CLIPOBJ* EngCreateClip()
#cfunc global EngCreateClip "EngCreateClip"

; winmdroot.Graphics.Gdi.HBITMAP EngCreateDeviceBitmap(winmdroot.Devices.Display.DHSURF dhsurf, winmdroot.Foundation.SIZE sizl, uint iFormatCompat)
#cfunc global EngCreateDeviceBitmap "EngCreateDeviceBitmap" intptr, var, int

; winmdroot.Devices.Display.HSURF EngCreateDeviceSurface(winmdroot.Devices.Display.DHSURF dhsurf, winmdroot.Foundation.SIZE sizl, uint iFormatCompat)
#cfunc global EngCreateDeviceSurface "EngCreateDeviceSurface" intptr, var, int

; winmdroot.Graphics.Gdi.HPALETTE EngCreatePalette(uint iMode, uint cColors, uint* pulColors, uint flRed, uint flGreen, uint flBlue)
#cfunc global EngCreatePalette "EngCreatePalette" int, int, var, int, int, int

; winmdroot.Devices.Display.HSEMAPHORE EngCreateSemaphore()
#cfunc global EngCreateSemaphore "EngCreateSemaphore"

; void EngDeleteClip([Optional] winmdroot.Devices.Display.CLIPOBJ* pco)
#func global EngDeleteClip "EngDeleteClip" var

; winmdroot.Foundation.BOOL EngDeletePalette(winmdroot.Graphics.Gdi.HPALETTE hpal)
#cfunc global EngDeletePalette "EngDeletePalette" intptr

; void EngDeletePath(winmdroot.Devices.Display.PATHOBJ* ppo)
#func global EngDeletePath "EngDeletePath" var

; winmdroot.Foundation.BOOL EngDeleteSurface(winmdroot.Devices.Display.HSURF hsurf)
#cfunc global EngDeleteSurface "EngDeleteSurface" intptr

; winmdroot.Foundation.BOOL EngEraseSurface(winmdroot.Devices.Display.SURFOBJ* pso, winmdroot.Foundation.RECTL* prcl, uint iColor)
#cfunc global EngEraseSurface "EngEraseSurface" var, var, int

; winmdroot.Foundation.BOOL EngFillPath(winmdroot.Devices.Display.SURFOBJ* pso, winmdroot.Devices.Display.PATHOBJ* ppo, winmdroot.Devices.Display.CLIPOBJ* pco, winmdroot.Devices.Display.BRUSHOBJ* pbo, winmdroot.Foundation.POINTL* pptlBrushOrg, uint mix, uint flOptions)
#cfunc global EngFillPath "EngFillPath" var, var, var, var, var, int, int

; void* EngFindResource(winmdroot.Foundation.HANDLE h, int iName, int iType, uint* pulSize)
#cfunc global EngFindResource "EngFindResource" intptr, int, int, var

; void EngFreeModule(winmdroot.Foundation.HANDLE h)
#func global EngFreeModule "EngFreeModule" intptr

; void EngGetCurrentCodePage(ushort* OemCodePage, ushort* AnsiCodePage)
#func global EngGetCurrentCodePage "EngGetCurrentCodePage" var, var

; winmdroot.Foundation.PWSTR EngGetDriverName(winmdroot.Devices.Display.HDEV hdev)
#cfunc global EngGetDriverName "EngGetDriverName" intptr

; winmdroot.Foundation.PWSTR EngGetPrinterDataFileName(winmdroot.Devices.Display.HDEV hdev)
#cfunc global EngGetPrinterDataFileName "EngGetPrinterDataFileName" intptr

; winmdroot.Foundation.BOOL EngGradientFill(winmdroot.Devices.Display.SURFOBJ* psoDest, winmdroot.Devices.Display.CLIPOBJ* pco, winmdroot.Devices.Display.XLATEOBJ* pxlo, winmdroot.Graphics.Gdi.TRIVERTEX* pVertex, uint nVertex, void* pMesh, uint nMesh, winmdroot.Foundation.RECTL* prclExtents, winmdroot.Foundation.POINTL* pptlDitherOrg, uint ulMode)
#cfunc global EngGradientFill "EngGradientFill" var, var, var, var, int, intptr, int, var, var, int

; winmdroot.Foundation.BOOL EngLineTo(winmdroot.Devices.Display.SURFOBJ* pso, winmdroot.Devices.Display.CLIPOBJ* pco, winmdroot.Devices.Display.BRUSHOBJ* pbo, int x1, int y1, int x2, int y2, winmdroot.Foundation.RECTL* prclBounds, uint mix)
#cfunc global EngLineTo "EngLineTo" var, var, var, int, int, int, int, var, int

; winmdroot.Foundation.HANDLE EngLoadModule(winmdroot.Foundation.PWSTR pwsz)
#cfunc global EngLoadModule "EngLoadModule" wstr

; winmdroot.Devices.Display.SURFOBJ* EngLockSurface(winmdroot.Devices.Display.HSURF hsurf)
#cfunc global EngLockSurface "EngLockSurface" intptr

; winmdroot.Foundation.BOOL EngMarkBandingSurface(winmdroot.Devices.Display.HSURF hsurf)
#cfunc global EngMarkBandingSurface "EngMarkBandingSurface" intptr

; void EngMultiByteToUnicodeN(winmdroot.Foundation.PWSTR UnicodeString, uint MaxBytesInUnicodeString, [Optional] uint* BytesInUnicodeString, winmdroot.Foundation.PSTR MultiByteString, uint BytesInMultiByteString)
#func global EngMultiByteToUnicodeN "EngMultiByteToUnicodeN" wstr, int, var, str, int

; int EngMultiByteToWideChar(uint CodePage, winmdroot.Foundation.PWSTR WideCharString, int BytesInWideCharString, winmdroot.Foundation.PSTR MultiByteString, int BytesInMultiByteString)
#cfunc global EngMultiByteToWideChar "EngMultiByteToWideChar" int, wstr, int, str, int

; winmdroot.Foundation.BOOL EngPaint(winmdroot.Devices.Display.SURFOBJ* pso, winmdroot.Devices.Display.CLIPOBJ* pco, winmdroot.Devices.Display.BRUSHOBJ* pbo, winmdroot.Foundation.POINTL* pptlBrushOrg, uint mix)
#cfunc global EngPaint "EngPaint" var, var, var, var, int

; winmdroot.Foundation.BOOL EngPlgBlt(winmdroot.Devices.Display.SURFOBJ* psoTrg, winmdroot.Devices.Display.SURFOBJ* psoSrc, winmdroot.Devices.Display.SURFOBJ* psoMsk, winmdroot.Devices.Display.CLIPOBJ* pco, winmdroot.Devices.Display.XLATEOBJ* pxlo, winmdroot.Graphics.Gdi.COLORADJUSTMENT* pca, winmdroot.Foundation.POINTL* pptlBrushOrg, winmdroot.Devices.Display.POINTFIX* pptfx, winmdroot.Foundation.RECTL* prcl, winmdroot.Foundation.POINTL* pptl, uint iMode)
#cfunc global EngPlgBlt "EngPlgBlt" var, var, var, var, var, var, var, var, var, var, int

; winmdroot.Foundation.BOOL EngQueryEMFInfo(winmdroot.Devices.Display.HDEV hdev, winmdroot.Devices.Display.EMFINFO* pEMFInfo)
#cfunc global EngQueryEMFInfo "EngQueryEMFInfo" intptr, var

; void EngQueryLocalTime(winmdroot.Devices.Display.ENG_TIME_FIELDS* param0)
#func global EngQueryLocalTime "EngQueryLocalTime" var

; void EngReleaseSemaphore(winmdroot.Devices.Display.HSEMAPHORE hsem)
#func global EngReleaseSemaphore "EngReleaseSemaphore" intptr

; winmdroot.Foundation.BOOL EngStretchBlt(winmdroot.Devices.Display.SURFOBJ* psoDest, winmdroot.Devices.Display.SURFOBJ* psoSrc, winmdroot.Devices.Display.SURFOBJ* psoMask, winmdroot.Devices.Display.CLIPOBJ* pco, winmdroot.Devices.Display.XLATEOBJ* pxlo, winmdroot.Graphics.Gdi.COLORADJUSTMENT* pca, winmdroot.Foundation.POINTL* pptlHTOrg, winmdroot.Foundation.RECTL* prclDest, winmdroot.Foundation.RECTL* prclSrc, winmdroot.Foundation.POINTL* pptlMask, uint iMode)
#cfunc global EngStretchBlt "EngStretchBlt" var, var, var, var, var, var, var, var, var, var, int

; winmdroot.Foundation.BOOL EngStretchBltROP(winmdroot.Devices.Display.SURFOBJ* psoDest, winmdroot.Devices.Display.SURFOBJ* psoSrc, winmdroot.Devices.Display.SURFOBJ* psoMask, winmdroot.Devices.Display.CLIPOBJ* pco, winmdroot.Devices.Display.XLATEOBJ* pxlo, winmdroot.Graphics.Gdi.COLORADJUSTMENT* pca, winmdroot.Foundation.POINTL* pptlHTOrg, winmdroot.Foundation.RECTL* prclDest, winmdroot.Foundation.RECTL* prclSrc, winmdroot.Foundation.POINTL* pptlMask, uint iMode, winmdroot.Devices.Display.BRUSHOBJ* pbo, uint rop4)
#cfunc global EngStretchBltROP "EngStretchBltROP" var, var, var, var, var, var, var, var, var, var, int, var, int

; winmdroot.Foundation.BOOL EngTextOut(winmdroot.Devices.Display.SURFOBJ* pso, winmdroot.Devices.Display.STROBJ* pstro, winmdroot.Devices.Display.FONTOBJ* pfo, winmdroot.Devices.Display.CLIPOBJ* pco, winmdroot.Foundation.RECTL* prclExtra, winmdroot.Foundation.RECTL* prclOpaque, winmdroot.Devices.Display.BRUSHOBJ* pboFore, winmdroot.Devices.Display.BRUSHOBJ* pboOpaque, winmdroot.Foundation.POINTL* pptlOrg, uint mix)
#cfunc global EngTextOut "EngTextOut" var, var, var, var, var, var, var, var, var, int

; winmdroot.Foundation.BOOL EngTransparentBlt(winmdroot.Devices.Display.SURFOBJ* psoDst, winmdroot.Devices.Display.SURFOBJ* psoSrc, [Optional] winmdroot.Devices.Display.CLIPOBJ* pco, [Optional] winmdroot.Devices.Display.XLATEOBJ* pxlo, winmdroot.Foundation.RECTL* prclDst, winmdroot.Foundation.RECTL* prclSrc, uint TransColor, uint bCalledFromBitBlt)
#cfunc global EngTransparentBlt "EngTransparentBlt" var, var, var, var, var, var, int, int

; void EngUnicodeToMultiByteN(winmdroot.Foundation.PSTR MultiByteString, uint MaxBytesInMultiByteString, [Optional] uint* BytesInMultiByteString, winmdroot.Foundation.PWSTR UnicodeString, uint BytesInUnicodeString)
#func global EngUnicodeToMultiByteN "EngUnicodeToMultiByteN" str, int, var, wstr, int

; void EngUnlockSurface(winmdroot.Devices.Display.SURFOBJ* pso)
#func global EngUnlockSurface "EngUnlockSurface" var

; int EngWideCharToMultiByte(uint CodePage, winmdroot.Foundation.PWSTR WideCharString, int BytesInWideCharString, winmdroot.Foundation.PSTR MultiByteString, int BytesInMultiByteString)
#cfunc global EngWideCharToMultiByte "EngWideCharToMultiByte" int, wstr, int, str, int

; winmdroot.Foundation.BOOL EnumEnhMetaFile(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HENHMETAFILE hmf, delegate *unmanaged[Stdcall]<global::Windows.Win32.Graphics.Gdi.HDC,global::Windows.Win32.Graphics.Gdi.HANDLETABLE*,global::Windows.Win32.Graphics.Gdi.ENHMETARECORD*,int,global::Windows.Win32.Foundation.LPARAM,int> proc, [Optional] void* param3, [Optional] winmdroot.Foundation.RECT* lpRect)
#cfunc global EnumEnhMetaFile "EnumEnhMetaFile" intptr, intptr, int, intptr, var

; int EnumFontFamiliesW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.PCWSTR lpLogfont, delegate *unmanaged[Stdcall]<global::Windows.Win32.Graphics.Gdi.LOGFONTW*,global::Windows.Win32.Graphics.Gdi.TEXTMETRICW*,uint,global::Windows.Win32.Foundation.LPARAM,int> lpProc, winmdroot.Foundation.LPARAM lParam)
#cfunc global EnumFontFamiliesW "EnumFontFamiliesW" intptr, wstr, int, intptr

; int EnumFontFamiliesExW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.LOGFONTW* lpLogfont, delegate *unmanaged[Stdcall]<global::Windows.Win32.Graphics.Gdi.LOGFONTW*,global::Windows.Win32.Graphics.Gdi.TEXTMETRICW*,uint,global::Windows.Win32.Foundation.LPARAM,int> lpProc, winmdroot.Foundation.LPARAM lParam, uint dwFlags)
#cfunc global EnumFontFamiliesExW "EnumFontFamiliesExW" intptr, var, int, intptr, int

; int EnumFontsW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.PCWSTR lpLogfont, delegate *unmanaged[Stdcall]<global::Windows.Win32.Graphics.Gdi.LOGFONTW*,global::Windows.Win32.Graphics.Gdi.TEXTMETRICW*,uint,global::Windows.Win32.Foundation.LPARAM,int> lpProc, winmdroot.Foundation.LPARAM lParam)
#cfunc global EnumFontsW "EnumFontsW" intptr, wstr, int, intptr

; int EnumICMProfilesW(winmdroot.Graphics.Gdi.HDC hdc, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.LPARAM,int> proc, winmdroot.Foundation.LPARAM param2)
#cfunc global EnumICMProfilesW "EnumICMProfilesW" intptr, int, intptr

; winmdroot.Foundation.BOOL EnumMetaFile(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HMETAFILE hmf, delegate *unmanaged[Stdcall]<global::Windows.Win32.Graphics.Gdi.HDC,global::Windows.Win32.Graphics.Gdi.HANDLETABLE*,global::Windows.Win32.Graphics.Gdi.METARECORD*,int,global::Windows.Win32.Foundation.LPARAM,int> proc, winmdroot.Foundation.LPARAM param3)
#cfunc global EnumMetaFile "EnumMetaFile" intptr, intptr, int, intptr

; int EnumObjects(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.OBJ_TYPE nType, delegate *unmanaged[Stdcall]<void*,global::Windows.Win32.Foundation.LPARAM,int> lpFunc, winmdroot.Foundation.LPARAM lParam)
#cfunc global EnumObjects "EnumObjects" intptr, int, int, intptr

; winmdroot.Foundation.BOOL EqualRgn(winmdroot.Graphics.Gdi.HRGN hrgn1, winmdroot.Graphics.Gdi.HRGN hrgn2)
#cfunc global EqualRgn "EqualRgn" intptr, intptr

; int Escape(winmdroot.Graphics.Gdi.HDC hdc, int iEscape, int cjIn, winmdroot.Foundation.PCSTR pvIn, [Optional] void* pvOut)
#cfunc global Escape "Escape" intptr, int, int, str, intptr

; winmdroot.Graphics.Gdi.GDI_REGION_TYPE ExcludeClipRect(winmdroot.Graphics.Gdi.HDC hdc, int left, int top, int right, int bottom)
#cfunc global ExcludeClipRect "ExcludeClipRect" intptr, int, int, int, int

; winmdroot.Graphics.Gdi.HPEN ExtCreatePen(uint iPenStyle, uint cWidth, winmdroot.Graphics.Gdi.LOGBRUSH* plbrush, uint cStyle, [Optional] uint* pstyle)
#cfunc global ExtCreatePen "ExtCreatePen" int, int, var, int, var

; winmdroot.Graphics.Gdi.HRGN ExtCreateRegion([Optional] winmdroot.Graphics.Gdi.XFORM* lpx, uint nCount, winmdroot.Graphics.Gdi.RGNDATA* lpData)
#cfunc global ExtCreateRegion "ExtCreateRegion" var, int, var

; int ExtEscape(winmdroot.Graphics.Gdi.HDC hdc, int iEscape, int cjInput, winmdroot.Foundation.PCSTR lpInData, int cjOutput, winmdroot.Foundation.PSTR lpOutData)
#cfunc global ExtEscape "ExtEscape" intptr, int, int, str, int, str

; winmdroot.Foundation.BOOL ExtFloodFill(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, winmdroot.Foundation.COLORREF color, winmdroot.Graphics.Gdi.EXT_FLOOD_FILL_TYPE type)
#cfunc global ExtFloodFill "ExtFloodFill" intptr, int, int, int, int

; winmdroot.Graphics.Gdi.GDI_REGION_TYPE ExtSelectClipRgn(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HRGN hrgn, winmdroot.Graphics.Gdi.RGN_COMBINE_MODE mode)
#cfunc global ExtSelectClipRgn "ExtSelectClipRgn" intptr, intptr, int

; winmdroot.Foundation.BOOL ExtTextOutW(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, winmdroot.Graphics.Gdi.ETO_OPTIONS options, [Optional] winmdroot.Foundation.RECT* lprect, winmdroot.Foundation.PCWSTR lpString, uint c, [Optional] int* lpDx)
#cfunc global ExtTextOutW "ExtTextOutW" intptr, int, int, int, var, wstr, int, var

; uint FONTOBJ_cGetAllGlyphHandles(winmdroot.Devices.Display.FONTOBJ* pfo, uint* phg)
#cfunc global FONTOBJ_cGetAllGlyphHandles "FONTOBJ_cGetAllGlyphHandles" var, var

; uint FONTOBJ_cGetGlyphs(winmdroot.Devices.Display.FONTOBJ* pfo, uint iMode, uint cGlyph, uint* phg, void** ppvGlyph)
#cfunc global FONTOBJ_cGetGlyphs "FONTOBJ_cGetGlyphs" var, int, int, var, var

; winmdroot.Devices.Display.FD_GLYPHATTR* FONTOBJ_pQueryGlyphAttrs(winmdroot.Devices.Display.FONTOBJ* pfo, uint iMode)
#cfunc global FONTOBJ_pQueryGlyphAttrs "FONTOBJ_pQueryGlyphAttrs" var, int

; winmdroot.Devices.Display.FD_GLYPHSET* FONTOBJ_pfdg(winmdroot.Devices.Display.FONTOBJ* pfo)
#cfunc global FONTOBJ_pfdg "FONTOBJ_pfdg" var

; void* FONTOBJ_pvTrueTypeFontFile(winmdroot.Devices.Display.FONTOBJ* pfo, uint* pcjFile)
#cfunc global FONTOBJ_pvTrueTypeFontFile "FONTOBJ_pvTrueTypeFontFile" var, var

; winmdroot.Devices.Display.XFORMOBJ* FONTOBJ_pxoGetXform(winmdroot.Devices.Display.FONTOBJ* pfo)
#cfunc global FONTOBJ_pxoGetXform "FONTOBJ_pxoGetXform" var

; void FONTOBJ_vGetInfo(winmdroot.Devices.Display.FONTOBJ* pfo, uint cjSize, winmdroot.Devices.Display.FONTINFO* pfi)
#func global FONTOBJ_vGetInfo "FONTOBJ_vGetInfo" var, int, var

; winmdroot.Foundation.BOOL FillPath(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global FillPath "FillPath" intptr

; winmdroot.Foundation.BOOL FillRgn(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HRGN hrgn, winmdroot.Graphics.Gdi.HBRUSH hbr)
#cfunc global FillRgn "FillRgn" intptr, intptr, intptr

; winmdroot.Foundation.BOOL FixBrushOrgEx(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, [Optional] global::System.Drawing.Point* ptl)
#cfunc global FixBrushOrgEx "FixBrushOrgEx" intptr, int, int, var

; winmdroot.Foundation.BOOL FlattenPath(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global FlattenPath "FlattenPath" intptr

; winmdroot.Foundation.BOOL FloodFill(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, winmdroot.Foundation.COLORREF color)
#cfunc global FloodFill "FloodFill" intptr, int, int, int

; winmdroot.Foundation.BOOL FrameRgn(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HRGN hrgn, winmdroot.Graphics.Gdi.HBRUSH hbr, int w, int h)
#cfunc global FrameRgn "FrameRgn" intptr, intptr, intptr, int, int

; winmdroot.Foundation.BOOL GdiAlphaBlend(winmdroot.Graphics.Gdi.HDC hdcDest, int xoriginDest, int yoriginDest, int wDest, int hDest, winmdroot.Graphics.Gdi.HDC hdcSrc, int xoriginSrc, int yoriginSrc, int wSrc, int hSrc, winmdroot.Graphics.Gdi.BLENDFUNCTION ftn)
#cfunc global GdiAlphaBlend "GdiAlphaBlend" intptr, int, int, int, int, intptr, int, int, int, int, var

; winmdroot.Foundation.BOOL GdiComment(winmdroot.Graphics.Gdi.HDC hdc, uint nSize, byte* lpData)
#cfunc global GdiComment "GdiComment" intptr, int, var

; winmdroot.Foundation.BOOL GdiDeleteSpoolFileHandle(winmdroot.Foundation.HANDLE SpoolFileHandle)
#cfunc global GdiDeleteSpoolFileHandle "GdiDeleteSpoolFileHandle" intptr

; winmdroot.Foundation.BOOL GdiEndDocEMF(winmdroot.Foundation.HANDLE SpoolFileHandle)
#cfunc global GdiEndDocEMF "GdiEndDocEMF" intptr

; winmdroot.Foundation.BOOL GdiEndPageEMF(winmdroot.Foundation.HANDLE SpoolFileHandle, uint dwOptimization)
#cfunc global GdiEndPageEMF "GdiEndPageEMF" intptr, int

; winmdroot.Foundation.BOOL GdiFlush()
#cfunc global GdiFlush "GdiFlush"

; uint GdiGetBatchLimit()
#cfunc global GdiGetBatchLimit "GdiGetBatchLimit"

; winmdroot.Graphics.Gdi.HDC GdiGetDC(winmdroot.Foundation.HANDLE SpoolFileHandle)
#cfunc global GdiGetDC "GdiGetDC" intptr

; winmdroot.Foundation.BOOL GdiGetDevmodeForPage(winmdroot.Foundation.HANDLE SpoolFileHandle, uint dwPageNumber, winmdroot.Graphics.Gdi.DEVMODEW** pCurrDM, winmdroot.Graphics.Gdi.DEVMODEW** pLastDM)
#cfunc global GdiGetDevmodeForPage "GdiGetDevmodeForPage" intptr, int, var, var

; uint GdiGetPageCount(winmdroot.Foundation.HANDLE SpoolFileHandle)
#cfunc global GdiGetPageCount "GdiGetPageCount" intptr

; winmdroot.Foundation.HANDLE GdiGetPageHandle(winmdroot.Foundation.HANDLE SpoolFileHandle, uint Page, uint* pdwPageType)
#cfunc global GdiGetPageHandle "GdiGetPageHandle" intptr, int, var

; winmdroot.Foundation.HANDLE GdiGetSpoolFileHandle(winmdroot.Foundation.PWSTR pwszPrinterName, winmdroot.Graphics.Gdi.DEVMODEW* pDevmode, winmdroot.Foundation.PWSTR pwszDocName)
#cfunc global GdiGetSpoolFileHandle "GdiGetSpoolFileHandle" wstr, var, wstr

; winmdroot.Foundation.BOOL GdiGradientFill(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.TRIVERTEX* pVertex, uint nVertex, void* pMesh, uint nCount, winmdroot.Graphics.Gdi.GRADIENT_FILL ulMode)
#cfunc global GdiGradientFill "GdiGradientFill" intptr, var, int, intptr, int, int

; winmdroot.Foundation.BOOL GdiPlayPageEMF(winmdroot.Foundation.HANDLE SpoolFileHandle, winmdroot.Foundation.HANDLE hemf, winmdroot.Foundation.RECT* prectDocument, winmdroot.Foundation.RECT* prectBorder, winmdroot.Foundation.RECT* prectClip)
#cfunc global GdiPlayPageEMF "GdiPlayPageEMF" intptr, intptr, var, var, var

; winmdroot.Foundation.BOOL GdiResetDCEMF(winmdroot.Foundation.HANDLE SpoolFileHandle, winmdroot.Graphics.Gdi.DEVMODEW* pCurrDM)
#cfunc global GdiResetDCEMF "GdiResetDCEMF" intptr, var

; uint GdiSetBatchLimit(uint dw)
#cfunc global GdiSetBatchLimit "GdiSetBatchLimit" int

; winmdroot.Foundation.BOOL GdiStartDocEMF(winmdroot.Foundation.HANDLE SpoolFileHandle, winmdroot.Storage.Xps.DOCINFOW* pDocInfo)
#cfunc global GdiStartDocEMF "GdiStartDocEMF" intptr, var

; winmdroot.Foundation.BOOL GdiStartPageEMF(winmdroot.Foundation.HANDLE SpoolFileHandle)
#cfunc global GdiStartPageEMF "GdiStartPageEMF" intptr

; winmdroot.Foundation.BOOL GdiTransparentBlt(winmdroot.Graphics.Gdi.HDC hdcDest, int xoriginDest, int yoriginDest, int wDest, int hDest, winmdroot.Graphics.Gdi.HDC hdcSrc, int xoriginSrc, int yoriginSrc, int wSrc, int hSrc, uint crTransparent)
#cfunc global GdiTransparentBlt "GdiTransparentBlt" intptr, int, int, int, int, intptr, int, int, int, int, int

; int GetArcDirection(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global GetArcDirection "GetArcDirection" intptr

; winmdroot.Foundation.BOOL GetAspectRatioFilterEx(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.SIZE* lpsize)
#cfunc global GetAspectRatioFilterEx "GetAspectRatioFilterEx" intptr, var

; int GetBitmapBits(winmdroot.Graphics.Gdi.HBITMAP hbit, int cb, void* lpvBits)
#cfunc global GetBitmapBits "GetBitmapBits" intptr, int, intptr

; winmdroot.Foundation.BOOL GetBitmapDimensionEx(winmdroot.Graphics.Gdi.HBITMAP hbit, winmdroot.Foundation.SIZE* lpsize)
#cfunc global GetBitmapDimensionEx "GetBitmapDimensionEx" intptr, var

; winmdroot.Foundation.COLORREF GetBkColor(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global GetBkColor "GetBkColor" intptr

; int GetBkMode(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global GetBkMode "GetBkMode" intptr

; uint GetBoundsRect(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.RECT* lprect, uint flags)
#cfunc global GetBoundsRect "GetBoundsRect" intptr, var, int

; winmdroot.Foundation.BOOL GetBrushOrgEx(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* lppt)
#cfunc global GetBrushOrgEx "GetBrushOrgEx" intptr, var

; winmdroot.Foundation.BOOL GetCharABCWidthsW(winmdroot.Graphics.Gdi.HDC hdc, uint wFirst, uint wLast, winmdroot.Graphics.Gdi.ABC* lpABC)
#cfunc global GetCharABCWidthsW "GetCharABCWidthsW" intptr, int, int, var

; winmdroot.Foundation.BOOL GetCharABCWidthsFloatW(winmdroot.Graphics.Gdi.HDC hdc, uint iFirst, uint iLast, winmdroot.Graphics.Gdi.ABCFLOAT* lpABC)
#cfunc global GetCharABCWidthsFloatW "GetCharABCWidthsFloatW" intptr, int, int, var

; winmdroot.Foundation.BOOL GetCharABCWidthsI(winmdroot.Graphics.Gdi.HDC hdc, uint giFirst, uint cgi, [Optional] ushort* pgi, winmdroot.Graphics.Gdi.ABC* pabc)
#cfunc global GetCharABCWidthsI "GetCharABCWidthsI" intptr, int, int, var, var

; winmdroot.Foundation.BOOL GetCharWidthW(winmdroot.Graphics.Gdi.HDC hdc, uint iFirst, uint iLast, int* lpBuffer)
#cfunc global GetCharWidthW "GetCharWidthW" intptr, int, int, var

; winmdroot.Foundation.BOOL GetCharWidth32A(winmdroot.Graphics.Gdi.HDC hdc, uint iFirst, uint iLast, int* lpBuffer)
#cfunc global GetCharWidth32A "GetCharWidth32A" intptr, int, int, var

; winmdroot.Foundation.BOOL GetCharWidth32W(winmdroot.Graphics.Gdi.HDC hdc, uint iFirst, uint iLast, int* lpBuffer)
#cfunc global GetCharWidth32W "GetCharWidth32W" intptr, int, int, var

; winmdroot.Foundation.BOOL GetCharWidthFloatW(winmdroot.Graphics.Gdi.HDC hdc, uint iFirst, uint iLast, float* lpBuffer)
#cfunc global GetCharWidthFloatW "GetCharWidthFloatW" intptr, int, int, var

; winmdroot.Foundation.BOOL GetCharWidthI(winmdroot.Graphics.Gdi.HDC hdc, uint giFirst, uint cgi, [Optional] ushort* pgi, int* piWidths)
#cfunc global GetCharWidthI "GetCharWidthI" intptr, int, int, var, var

; uint GetCharacterPlacementW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.PCWSTR lpString, int nCount, int nMexExtent, winmdroot.Graphics.Gdi.GCP_RESULTSW* lpResults, winmdroot.Graphics.Gdi.GET_CHARACTER_PLACEMENT_FLAGS dwFlags)
#cfunc global GetCharacterPlacementW "GetCharacterPlacementW" intptr, wstr, int, int, var, int

; winmdroot.Graphics.Gdi.GDI_REGION_TYPE GetClipBox(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.RECT* lprect)
#cfunc global GetClipBox "GetClipBox" intptr, var

; int GetClipRgn(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HRGN hrgn)
#cfunc global GetClipRgn "GetClipRgn" intptr, intptr

; winmdroot.Foundation.BOOL GetColorAdjustment(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.COLORADJUSTMENT* lpca)
#cfunc global GetColorAdjustment "GetColorAdjustment" intptr, var

; winmdroot.UI.ColorSystem.HCOLORSPACE GetColorSpace(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global GetColorSpace "GetColorSpace" intptr

; winmdroot.Graphics.Gdi.HGDIOBJ GetCurrentObject(winmdroot.Graphics.Gdi.HDC hdc, uint type)
#cfunc global GetCurrentObject "GetCurrentObject" intptr, int

; winmdroot.Foundation.BOOL GetCurrentPositionEx(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* lppt)
#cfunc global GetCurrentPositionEx "GetCurrentPositionEx" intptr, var

; winmdroot.Foundation.COLORREF GetDCBrushColor(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global GetDCBrushColor "GetDCBrushColor" intptr

; winmdroot.Foundation.BOOL GetDCOrgEx(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* lppt)
#cfunc global GetDCOrgEx "GetDCOrgEx" intptr, var

; winmdroot.Foundation.COLORREF GetDCPenColor(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global GetDCPenColor "GetDCPenColor" intptr

; uint GetDIBColorTable(winmdroot.Graphics.Gdi.HDC hdc, uint iStart, uint cEntries, winmdroot.Graphics.Gdi.RGBQUAD* prgbq)
#cfunc global GetDIBColorTable "GetDIBColorTable" intptr, int, int, var

; int GetDIBits(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HBITMAP hbm, uint start, uint cLines, [Optional] void* lpvBits, winmdroot.Graphics.Gdi.BITMAPINFO* lpbmi, winmdroot.Graphics.Gdi.DIB_USAGE usage)
#cfunc global GetDIBits "GetDIBits" intptr, intptr, int, int, intptr, var, int

; int GetDeviceCaps(winmdroot.Graphics.Gdi.HDC hdc, int index)
#cfunc global GetDeviceCaps "GetDeviceCaps" intptr, int

; winmdroot.Foundation.BOOL GetDeviceGammaRamp(winmdroot.Graphics.Gdi.HDC hdc, void* lpRamp)
#cfunc global GetDeviceGammaRamp "GetDeviceGammaRamp" intptr, intptr

; winmdroot.Graphics.Gdi.HENHMETAFILE GetEnhMetaFileW(winmdroot.Foundation.PCWSTR lpName)
#cfunc global GetEnhMetaFileW "GetEnhMetaFileW" wstr

; uint GetEnhMetaFileBits(winmdroot.Graphics.Gdi.HENHMETAFILE hEMF, uint nSize, [Optional] byte* lpData)
#cfunc global GetEnhMetaFileBits "GetEnhMetaFileBits" intptr, int, var

; uint GetEnhMetaFileDescriptionW(winmdroot.Graphics.Gdi.HENHMETAFILE hemf, uint cchBuffer, winmdroot.Foundation.PWSTR lpDescription)
#cfunc global GetEnhMetaFileDescriptionW "GetEnhMetaFileDescriptionW" intptr, int, wstr

; uint GetEnhMetaFileHeader(winmdroot.Graphics.Gdi.HENHMETAFILE hemf, uint nSize, [Optional] winmdroot.Graphics.Gdi.ENHMETAHEADER* lpEnhMetaHeader)
#cfunc global GetEnhMetaFileHeader "GetEnhMetaFileHeader" intptr, int, var

; uint GetEnhMetaFilePaletteEntries(winmdroot.Graphics.Gdi.HENHMETAFILE hemf, uint nNumEntries, [Optional] winmdroot.Graphics.Gdi.PALETTEENTRY* lpPaletteEntries)
#cfunc global GetEnhMetaFilePaletteEntries "GetEnhMetaFilePaletteEntries" intptr, int, var

; uint GetEnhMetaFilePixelFormat(winmdroot.Graphics.Gdi.HENHMETAFILE hemf, uint cbBuffer, [Optional] winmdroot.Graphics.OpenGL.PIXELFORMATDESCRIPTOR* ppfd)
#cfunc global GetEnhMetaFilePixelFormat "GetEnhMetaFilePixelFormat" intptr, int, var

; uint GetFontData(winmdroot.Graphics.Gdi.HDC hdc, uint dwTable, uint dwOffset, [Optional] void* pvBuffer, uint cjBuffer)
#cfunc global GetFontData "GetFontData" intptr, int, int, intptr, int

; uint GetFontLanguageInfo(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global GetFontLanguageInfo "GetFontLanguageInfo" intptr

; uint GetFontUnicodeRanges(winmdroot.Graphics.Gdi.HDC hdc, [Optional] winmdroot.Graphics.Gdi.GLYPHSET* lpgs)
#cfunc global GetFontUnicodeRanges "GetFontUnicodeRanges" intptr, var

; uint GetGlyphIndicesW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.PCWSTR lpstr, int c, ushort* pgi, uint fl)
#cfunc global GetGlyphIndicesW "GetGlyphIndicesW" intptr, wstr, int, var, int

; uint GetGlyphOutlineW(winmdroot.Graphics.Gdi.HDC hdc, uint uChar, winmdroot.Graphics.Gdi.GET_GLYPH_OUTLINE_FORMAT fuFormat, winmdroot.Graphics.Gdi.GLYPHMETRICS* lpgm, uint cjBuffer, [Optional] void* pvBuffer, winmdroot.Graphics.Gdi.MAT2* lpmat2)
#cfunc global GetGlyphOutlineW "GetGlyphOutlineW" intptr, int, int, var, int, intptr, var

; int GetGraphicsMode(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global GetGraphicsMode "GetGraphicsMode" intptr

; winmdroot.Foundation.BOOL GetICMProfileW(winmdroot.Graphics.Gdi.HDC hdc, uint* pBufSize, winmdroot.Foundation.PWSTR pszFilename)
#cfunc global GetICMProfileW "GetICMProfileW" intptr, var, wstr

; uint GetKerningPairsW(winmdroot.Graphics.Gdi.HDC hdc, uint nPairs, [Optional] winmdroot.Graphics.Gdi.KERNINGPAIR* lpKernPair)
#cfunc global GetKerningPairsW "GetKerningPairsW" intptr, int, var

; uint GetLayout(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global GetLayout "GetLayout" intptr

; winmdroot.Foundation.BOOL GetLogColorSpaceW(winmdroot.UI.ColorSystem.HCOLORSPACE hColorSpace, winmdroot.UI.ColorSystem.LOGCOLORSPACEW* lpBuffer, uint nSize)
#cfunc global GetLogColorSpaceW "GetLogColorSpaceW" intptr, var, int

; winmdroot.Graphics.Gdi.HDC_MAP_MODE GetMapMode(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global GetMapMode "GetMapMode" intptr

; winmdroot.Graphics.Gdi.HMETAFILE GetMetaFileW(winmdroot.Foundation.PCWSTR lpName)
#cfunc global GetMetaFileW "GetMetaFileW" wstr

; uint GetMetaFileBitsEx(winmdroot.Graphics.Gdi.HMETAFILE hMF, uint cbBuffer, [Optional] void* lpData)
#cfunc global GetMetaFileBitsEx "GetMetaFileBitsEx" intptr, int, intptr

; int GetMetaRgn(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HRGN hrgn)
#cfunc global GetMetaRgn "GetMetaRgn" intptr, intptr

; winmdroot.Foundation.BOOL GetMiterLimit(winmdroot.Graphics.Gdi.HDC hdc, float* plimit)
#cfunc global GetMiterLimit "GetMiterLimit" intptr, var

; winmdroot.Foundation.COLORREF GetNearestColor(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.COLORREF color)
#cfunc global GetNearestColor "GetNearestColor" intptr, int

; uint GetNearestPaletteIndex(winmdroot.Graphics.Gdi.HPALETTE h, winmdroot.Foundation.COLORREF color)
#cfunc global GetNearestPaletteIndex "GetNearestPaletteIndex" intptr, int

; int GetObjectW(winmdroot.Graphics.Gdi.HGDIOBJ h, int c, [Optional] void* pv)
#cfunc global GetObjectW "GetObjectW" intptr, int, intptr

; uint GetObjectType(winmdroot.Graphics.Gdi.HGDIOBJ h)
#cfunc global GetObjectType "GetObjectType" intptr

; uint GetOutlineTextMetricsW(winmdroot.Graphics.Gdi.HDC hdc, uint cjCopy, [Optional] winmdroot.Graphics.Gdi.OUTLINETEXTMETRICW* potm)
#cfunc global GetOutlineTextMetricsW "GetOutlineTextMetricsW" intptr, int, var

; uint GetPaletteEntries(winmdroot.Graphics.Gdi.HPALETTE hpal, uint iStart, uint cEntries, [Optional] winmdroot.Graphics.Gdi.PALETTEENTRY* pPalEntries)
#cfunc global GetPaletteEntries "GetPaletteEntries" intptr, int, int, var

; int GetPath(winmdroot.Graphics.Gdi.HDC hdc, [Optional] global::System.Drawing.Point* apt, [Optional] byte* aj, int cpt)
; HSP 組み込み getpath と衝突するため GDI_GetPath にリネーム
#cfunc global GDI_GetPath "GetPath" intptr, var, var, int

; winmdroot.Foundation.COLORREF GetPixel(winmdroot.Graphics.Gdi.HDC hdc, int x, int y)
#cfunc global GetPixel "GetPixel" intptr, int, int

; int GetPixelFormat(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global GetPixelFormat "GetPixelFormat" intptr

; int GetPolyFillMode(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global GetPolyFillMode "GetPolyFillMode" intptr

; winmdroot.Graphics.Gdi.R2_MODE GetROP2(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global GetROP2 "GetROP2" intptr

; int GetRandomRgn(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HRGN hrgn, int i)
#cfunc global GetRandomRgn "GetRandomRgn" intptr, intptr, int

; winmdroot.Foundation.BOOL GetRasterizerCaps(winmdroot.Graphics.Gdi.RASTERIZER_STATUS* lpraststat, uint cjBytes)
#cfunc global GetRasterizerCaps "GetRasterizerCaps" var, int

; uint GetRegionData(winmdroot.Graphics.Gdi.HRGN hrgn, uint nCount, [Optional] winmdroot.Graphics.Gdi.RGNDATA* lpRgnData)
#cfunc global GetRegionData "GetRegionData" intptr, int, var

; winmdroot.Graphics.Gdi.GDI_REGION_TYPE GetRgnBox(winmdroot.Graphics.Gdi.HRGN hrgn, winmdroot.Foundation.RECT* lprc)
#cfunc global GetRgnBox "GetRgnBox" intptr, var

; winmdroot.Graphics.Gdi.HGDIOBJ GetStockObject(winmdroot.Graphics.Gdi.GET_STOCK_OBJECT_FLAGS i)
#cfunc global GetStockObject "GetStockObject" int

; int GetStretchBltMode(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global GetStretchBltMode "GetStretchBltMode" intptr

; uint GetSystemPaletteEntries(winmdroot.Graphics.Gdi.HDC hdc, uint iStart, uint cEntries, [Optional] winmdroot.Graphics.Gdi.PALETTEENTRY* pPalEntries)
#cfunc global GetSystemPaletteEntries "GetSystemPaletteEntries" intptr, int, int, var

; uint GetSystemPaletteUse(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global GetSystemPaletteUse "GetSystemPaletteUse" intptr

; winmdroot.Graphics.Gdi.TEXT_ALIGN_OPTIONS GetTextAlign(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global GetTextAlign "GetTextAlign" intptr

; int GetTextCharacterExtra(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global GetTextCharacterExtra "GetTextCharacterExtra" intptr

; int GetTextCharset(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global GetTextCharset "GetTextCharset" intptr

; int GetTextCharsetInfo(winmdroot.Graphics.Gdi.HDC hdc, [Optional] winmdroot.Globalization.FONTSIGNATURE* lpSig, uint dwFlags)
#cfunc global GetTextCharsetInfo "GetTextCharsetInfo" intptr, var, int

; winmdroot.Foundation.COLORREF GetTextColor(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global GetTextColor "GetTextColor" intptr

; winmdroot.Foundation.BOOL GetTextExtentExPointW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.PCWSTR lpszString, int cchString, int nMaxExtent, [Optional] int* lpnFit, [Optional] int* lpnDx, winmdroot.Foundation.SIZE* lpSize)
#cfunc global GetTextExtentExPointW "GetTextExtentExPointW" intptr, wstr, int, int, var, var, var

; winmdroot.Foundation.BOOL GetTextExtentExPointI(winmdroot.Graphics.Gdi.HDC hdc, ushort* lpwszString, int cwchString, int nMaxExtent, [Optional] int* lpnFit, [Optional] int* lpnDx, winmdroot.Foundation.SIZE* lpSize)
#cfunc global GetTextExtentExPointI "GetTextExtentExPointI" intptr, var, int, int, var, var, var

; winmdroot.Foundation.BOOL GetTextExtentPointW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.PCWSTR lpString, int c, winmdroot.Foundation.SIZE* lpsz)
#cfunc global GetTextExtentPointW "GetTextExtentPointW" intptr, wstr, int, var

; winmdroot.Foundation.BOOL GetTextExtentPoint32A(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.PCSTR lpString, int c, winmdroot.Foundation.SIZE* psizl)
#cfunc global GetTextExtentPoint32A "GetTextExtentPoint32A" intptr, str, int, var

; winmdroot.Foundation.BOOL GetTextExtentPoint32W(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.PCWSTR lpString, int c, winmdroot.Foundation.SIZE* psizl)
#cfunc global GetTextExtentPoint32W "GetTextExtentPoint32W" intptr, wstr, int, var

; winmdroot.Foundation.BOOL GetTextExtentPointI(winmdroot.Graphics.Gdi.HDC hdc, ushort* pgiIn, int cgi, winmdroot.Foundation.SIZE* psize)
#cfunc global GetTextExtentPointI "GetTextExtentPointI" intptr, var, int, var

; int GetTextFaceW(winmdroot.Graphics.Gdi.HDC hdc, int c, winmdroot.Foundation.PWSTR lpName)
#cfunc global GetTextFaceW "GetTextFaceW" intptr, int, wstr

; winmdroot.Foundation.BOOL GetTextMetricsW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.TEXTMETRICW* lptm)
#cfunc global GetTextMetricsW "GetTextMetricsW" intptr, var

; winmdroot.Foundation.BOOL GetViewportExtEx(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.SIZE* lpsize)
#cfunc global GetViewportExtEx "GetViewportExtEx" intptr, var

; winmdroot.Foundation.BOOL GetViewportOrgEx(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* lppoint)
#cfunc global GetViewportOrgEx "GetViewportOrgEx" intptr, var

; uint GetWinMetaFileBits(winmdroot.Graphics.Gdi.HENHMETAFILE hemf, uint cbData16, [Optional] byte* pData16, int iMapMode, winmdroot.Graphics.Gdi.HDC hdcRef)
#cfunc global GetWinMetaFileBits "GetWinMetaFileBits" intptr, int, var, int, intptr

; winmdroot.Foundation.BOOL GetWindowExtEx(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.SIZE* lpsize)
#cfunc global GetWindowExtEx "GetWindowExtEx" intptr, var

; winmdroot.Foundation.BOOL GetWindowOrgEx(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* lppoint)
#cfunc global GetWindowOrgEx "GetWindowOrgEx" intptr, var

; winmdroot.Foundation.BOOL GetWorldTransform(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.XFORM* lpxf)
#cfunc global GetWorldTransform "GetWorldTransform" intptr, var

; int HT_Get8BPPFormatPalette([Optional] winmdroot.Graphics.Gdi.PALETTEENTRY* pPaletteEntry, ushort RedGamma, ushort GreenGamma, ushort BlueGamma)
#cfunc global HT_Get8BPPFormatPalette "HT_Get8BPPFormatPalette" var, int, int, int

; int HT_Get8BPPMaskPalette([Optional] winmdroot.Graphics.Gdi.PALETTEENTRY* pPaletteEntry, winmdroot.Foundation.BOOL Use8BPPMaskPal, byte CMYMask, ushort RedGamma, ushort GreenGamma, ushort BlueGamma)
#cfunc global HT_Get8BPPMaskPalette "HT_Get8BPPMaskPalette" var, int, int, int, int, int

; winmdroot.Graphics.Gdi.GDI_REGION_TYPE IntersectClipRect(winmdroot.Graphics.Gdi.HDC hdc, int left, int top, int right, int bottom)
#cfunc global IntersectClipRect "IntersectClipRect" intptr, int, int, int, int

; winmdroot.Foundation.BOOL InvertRgn(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HRGN hrgn)
#cfunc global InvertRgn "InvertRgn" intptr, intptr

; winmdroot.Foundation.BOOL LPtoDP(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* lppt, int c)
#cfunc global LPtoDP "LPtoDP" intptr, var, int

; winmdroot.Foundation.BOOL LineDDA(int xStart, int yStart, int xEnd, int yEnd, delegate *unmanaged[Stdcall]<int,int,global::Windows.Win32.Foundation.LPARAM,void> lpProc, winmdroot.Foundation.LPARAM data)
#cfunc global LineDDA "LineDDA" int, int, int, int, int, intptr

; winmdroot.Foundation.BOOL LineTo(winmdroot.Graphics.Gdi.HDC hdc, int x, int y)
#cfunc global LineTo "LineTo" intptr, int, int

; winmdroot.Foundation.BOOL MaskBlt(winmdroot.Graphics.Gdi.HDC hdcDest, int xDest, int yDest, int width, int height, winmdroot.Graphics.Gdi.HDC hdcSrc, int xSrc, int ySrc, winmdroot.Graphics.Gdi.HBITMAP hbmMask, int xMask, int yMask, uint rop)
#cfunc global MaskBlt "MaskBlt" intptr, int, int, int, int, intptr, int, int, intptr, int, int, int

; winmdroot.Foundation.BOOL ModifyWorldTransform(winmdroot.Graphics.Gdi.HDC hdc, [Optional] winmdroot.Graphics.Gdi.XFORM* lpxf, winmdroot.Graphics.Gdi.MODIFY_WORLD_TRANSFORM_MODE mode)
#cfunc global ModifyWorldTransform "ModifyWorldTransform" intptr, var, int

; winmdroot.Foundation.BOOL MoveToEx(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, [Optional] global::System.Drawing.Point* lppt)
#cfunc global MoveToEx "MoveToEx" intptr, int, int, var

; winmdroot.Graphics.Gdi.GDI_REGION_TYPE OffsetClipRgn(winmdroot.Graphics.Gdi.HDC hdc, int x, int y)
#cfunc global OffsetClipRgn "OffsetClipRgn" intptr, int, int

; winmdroot.Graphics.Gdi.GDI_REGION_TYPE OffsetRgn(winmdroot.Graphics.Gdi.HRGN hrgn, int x, int y)
#cfunc global OffsetRgn "OffsetRgn" intptr, int, int

; winmdroot.Foundation.BOOL OffsetViewportOrgEx(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, [Optional] global::System.Drawing.Point* lppt)
#cfunc global OffsetViewportOrgEx "OffsetViewportOrgEx" intptr, int, int, var

; winmdroot.Foundation.BOOL OffsetWindowOrgEx(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, [Optional] global::System.Drawing.Point* lppt)
#cfunc global OffsetWindowOrgEx "OffsetWindowOrgEx" intptr, int, int, var

; winmdroot.Foundation.BOOL PATHOBJ_bEnum(winmdroot.Devices.Display.PATHOBJ* ppo, winmdroot.Devices.Display.PATHDATA* ppd)
#cfunc global PATHOBJ_bEnum "PATHOBJ_bEnum" var, var

; winmdroot.Foundation.BOOL PATHOBJ_bEnumClipLines(winmdroot.Devices.Display.PATHOBJ* ppo, uint cb, winmdroot.Devices.Display.CLIPLINE* pcl)
#cfunc global PATHOBJ_bEnumClipLines "PATHOBJ_bEnumClipLines" var, int, var

; void PATHOBJ_vEnumStart(winmdroot.Devices.Display.PATHOBJ* ppo)
#func global PATHOBJ_vEnumStart "PATHOBJ_vEnumStart" var

; void PATHOBJ_vGetBounds(winmdroot.Devices.Display.PATHOBJ* ppo, winmdroot.Devices.Display.RECTFX* prectfx)
#func global PATHOBJ_vGetBounds "PATHOBJ_vGetBounds" var, var

; winmdroot.Foundation.BOOL PaintRgn(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HRGN hrgn)
#cfunc global PaintRgn "PaintRgn" intptr, intptr

; winmdroot.Foundation.BOOL PatBlt(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, int w, int h, winmdroot.Graphics.Gdi.ROP_CODE rop)
#cfunc global PatBlt "PatBlt" intptr, int, int, int, int, int

; winmdroot.Graphics.Gdi.HRGN PathToRegion(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global PathToRegion "PathToRegion" intptr

; winmdroot.Foundation.BOOL Pie(winmdroot.Graphics.Gdi.HDC hdc, int left, int top, int right, int bottom, int xr1, int yr1, int xr2, int yr2)
#cfunc global Pie "Pie" intptr, int, int, int, int, int, int, int, int

; winmdroot.Foundation.BOOL PlayEnhMetaFile(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HENHMETAFILE hmf, winmdroot.Foundation.RECT* lprect)
#cfunc global PlayEnhMetaFile "PlayEnhMetaFile" intptr, intptr, var

; winmdroot.Foundation.BOOL PlayEnhMetaFileRecord(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HANDLETABLE* pht, winmdroot.Graphics.Gdi.ENHMETARECORD* pmr, uint cht)
#cfunc global PlayEnhMetaFileRecord "PlayEnhMetaFileRecord" intptr, var, var, int

; winmdroot.Foundation.BOOL PlayMetaFile(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HMETAFILE hmf)
#cfunc global PlayMetaFile "PlayMetaFile" intptr, intptr

; winmdroot.Foundation.BOOL PlayMetaFileRecord(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HANDLETABLE* lpHandleTable, winmdroot.Graphics.Gdi.METARECORD* lpMR, uint noObjs)
#cfunc global PlayMetaFileRecord "PlayMetaFileRecord" intptr, var, var, int

; winmdroot.Foundation.BOOL PlgBlt(winmdroot.Graphics.Gdi.HDC hdcDest, global::System.Drawing.Point* lpPoint, winmdroot.Graphics.Gdi.HDC hdcSrc, int xSrc, int ySrc, int width, int height, winmdroot.Graphics.Gdi.HBITMAP hbmMask, int xMask, int yMask)
#cfunc global PlgBlt "PlgBlt" intptr, var, intptr, int, int, int, int, intptr, int, int

; winmdroot.Foundation.BOOL PolyBezier(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* apt, uint cpt)
#cfunc global PolyBezier "PolyBezier" intptr, var, int

; winmdroot.Foundation.BOOL PolyBezierTo(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* apt, uint cpt)
#cfunc global PolyBezierTo "PolyBezierTo" intptr, var, int

; winmdroot.Foundation.BOOL PolyDraw(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* apt, byte* aj, int cpt)
#cfunc global PolyDraw "PolyDraw" intptr, var, var, int

; winmdroot.Foundation.BOOL PolyPolygon(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* apt, int* asz, int csz)
#cfunc global PolyPolygon "PolyPolygon" intptr, var, var, int

; winmdroot.Foundation.BOOL PolyPolyline(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* apt, uint* asz, uint csz)
#cfunc global PolyPolyline "PolyPolyline" intptr, var, var, int

; winmdroot.Foundation.BOOL PolyTextOutW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.POLYTEXTW* ppt, int nstrings)
#cfunc global PolyTextOutW "PolyTextOutW" intptr, var, int

; winmdroot.Foundation.BOOL Polygon(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* apt, int cpt)
#cfunc global Polygon "Polygon" intptr, var, int

; winmdroot.Foundation.BOOL Polyline(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* apt, int cpt)
#cfunc global Polyline "Polyline" intptr, var, int

; winmdroot.Foundation.BOOL PolylineTo(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* apt, uint cpt)
#cfunc global PolylineTo "PolylineTo" intptr, var, int

; winmdroot.Foundation.BOOL PtInRegion(winmdroot.Graphics.Gdi.HRGN hrgn, int x, int y)
#cfunc global PtInRegion "PtInRegion" intptr, int, int

; winmdroot.Foundation.BOOL PtVisible(winmdroot.Graphics.Gdi.HDC hdc, int x, int y)
#cfunc global PtVisible "PtVisible" intptr, int, int

; uint RealizePalette(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global RealizePalette "RealizePalette" intptr

; winmdroot.Foundation.BOOL RectInRegion(winmdroot.Graphics.Gdi.HRGN hrgn, winmdroot.Foundation.RECT* lprect)
#cfunc global RectInRegion "RectInRegion" intptr, var

; winmdroot.Foundation.BOOL RectVisible(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.RECT* lprect)
#cfunc global RectVisible "RectVisible" intptr, var

; winmdroot.Foundation.BOOL Rectangle(winmdroot.Graphics.Gdi.HDC hdc, int left, int top, int right, int bottom)
#cfunc global Rectangle "Rectangle" intptr, int, int, int, int

; winmdroot.Foundation.BOOL RemoveFontMemResourceEx(winmdroot.Foundation.HANDLE h)
#cfunc global RemoveFontMemResourceEx "RemoveFontMemResourceEx" intptr

; winmdroot.Foundation.BOOL RemoveFontResourceW(winmdroot.Foundation.PCWSTR lpFileName)
#cfunc global RemoveFontResourceW "RemoveFontResourceW" wstr

; winmdroot.Foundation.BOOL RemoveFontResourceExW(winmdroot.Foundation.PCWSTR name, uint fl, [Optional] void* pdv)
#cfunc global RemoveFontResourceExW "RemoveFontResourceExW" wstr, int, intptr

; winmdroot.Graphics.Gdi.HDC ResetDCA(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.DEVMODEA* lpdm)
#cfunc global ResetDCA "ResetDCA" intptr, var

; winmdroot.Graphics.Gdi.HDC ResetDCW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.DEVMODEW* lpdm)
#cfunc global ResetDCW "ResetDCW" intptr, var

; winmdroot.Foundation.BOOL ResizePalette(winmdroot.Graphics.Gdi.HPALETTE hpal, uint n)
#cfunc global ResizePalette "ResizePalette" intptr, int

; winmdroot.Foundation.BOOL RestoreDC(winmdroot.Graphics.Gdi.HDC hdc, int nSavedDC)
#cfunc global RestoreDC "RestoreDC" intptr, int

; winmdroot.Foundation.BOOL RoundRect(winmdroot.Graphics.Gdi.HDC hdc, int left, int top, int right, int bottom, int width, int height)
#cfunc global RoundRect "RoundRect" intptr, int, int, int, int, int, int

; winmdroot.Foundation.BOOL STROBJ_bEnum(winmdroot.Devices.Display.STROBJ* pstro, uint* pc, winmdroot.Devices.Display.GLYPHPOS** ppgpos)
#cfunc global STROBJ_bEnum "STROBJ_bEnum" var, var, var

; winmdroot.Foundation.BOOL STROBJ_bEnumPositionsOnly(winmdroot.Devices.Display.STROBJ* pstro, uint* pc, winmdroot.Devices.Display.GLYPHPOS** ppgpos)
#cfunc global STROBJ_bEnumPositionsOnly "STROBJ_bEnumPositionsOnly" var, var, var

; winmdroot.Foundation.BOOL STROBJ_bGetAdvanceWidths(winmdroot.Devices.Display.STROBJ* pso, uint iFirst, uint c, winmdroot.Devices.Display.POINTQF* pptqD)
#cfunc global STROBJ_bGetAdvanceWidths "STROBJ_bGetAdvanceWidths" var, int, int, var

; uint STROBJ_dwGetCodePage(winmdroot.Devices.Display.STROBJ* pstro)
#cfunc global STROBJ_dwGetCodePage "STROBJ_dwGetCodePage" var

; void STROBJ_vEnumStart(winmdroot.Devices.Display.STROBJ* pstro)
#func global STROBJ_vEnumStart "STROBJ_vEnumStart" var

; int SaveDC(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global SaveDC "SaveDC" intptr

; winmdroot.Foundation.BOOL ScaleViewportExtEx(winmdroot.Graphics.Gdi.HDC hdc, int xn, int dx, int yn, int yd, [Optional] winmdroot.Foundation.SIZE* lpsz)
#cfunc global ScaleViewportExtEx "ScaleViewportExtEx" intptr, int, int, int, int, var

; winmdroot.Foundation.BOOL ScaleWindowExtEx(winmdroot.Graphics.Gdi.HDC hdc, int xn, int xd, int yn, int yd, [Optional] winmdroot.Foundation.SIZE* lpsz)
#cfunc global ScaleWindowExtEx "ScaleWindowExtEx" intptr, int, int, int, int, var

; winmdroot.Foundation.BOOL SelectClipPath(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.RGN_COMBINE_MODE mode)
#cfunc global SelectClipPath "SelectClipPath" intptr, int

; winmdroot.Graphics.Gdi.GDI_REGION_TYPE SelectClipRgn(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HRGN hrgn)
#cfunc global SelectClipRgn "SelectClipRgn" intptr, intptr

; winmdroot.Graphics.Gdi.HGDIOBJ SelectObject(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HGDIOBJ h)
#cfunc global SelectObject "SelectObject" intptr, intptr

; winmdroot.Graphics.Gdi.HPALETTE SelectPalette(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HPALETTE hPal, winmdroot.Foundation.BOOL bForceBkgd)
#cfunc global SelectPalette "SelectPalette" intptr, intptr, int

; int SetAbortProc(winmdroot.Graphics.Gdi.HDC hdc, delegate *unmanaged[Stdcall]<global::Windows.Win32.Graphics.Gdi.HDC,int,global::Windows.Win32.Foundation.BOOL> proc)
#cfunc global SetAbortProc "SetAbortProc" intptr, int

; int SetArcDirection(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.ARC_DIRECTION dir)
#cfunc global SetArcDirection "SetArcDirection" intptr, int

; int SetBitmapBits(winmdroot.Graphics.Gdi.HBITMAP hbm, uint cb, void* pvBits)
#cfunc global SetBitmapBits "SetBitmapBits" intptr, int, intptr

; winmdroot.Foundation.BOOL SetBitmapDimensionEx(winmdroot.Graphics.Gdi.HBITMAP hbm, int w, int h, [Optional] winmdroot.Foundation.SIZE* lpsz)
#cfunc global SetBitmapDimensionEx "SetBitmapDimensionEx" intptr, int, int, var

; winmdroot.Foundation.COLORREF SetBkColor(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.COLORREF color)
#cfunc global SetBkColor "SetBkColor" intptr, int

; int SetBkMode(winmdroot.Graphics.Gdi.HDC hdc, int mode)
#cfunc global SetBkMode "SetBkMode" intptr, int

; uint SetBoundsRect(winmdroot.Graphics.Gdi.HDC hdc, [Optional] winmdroot.Foundation.RECT* lprect, winmdroot.Graphics.Gdi.SET_BOUNDS_RECT_FLAGS flags)
#cfunc global SetBoundsRect "SetBoundsRect" intptr, var, int

; winmdroot.Foundation.BOOL SetBrushOrgEx(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, [Optional] global::System.Drawing.Point* lppt)
#cfunc global SetBrushOrgEx "SetBrushOrgEx" intptr, int, int, var

; winmdroot.Foundation.BOOL SetColorAdjustment(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.COLORADJUSTMENT* lpca)
#cfunc global SetColorAdjustment "SetColorAdjustment" intptr, var

; winmdroot.UI.ColorSystem.HCOLORSPACE SetColorSpace(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.UI.ColorSystem.HCOLORSPACE hcs)
#cfunc global SetColorSpace "SetColorSpace" intptr, intptr

; winmdroot.Foundation.COLORREF SetDCBrushColor(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.COLORREF color)
#cfunc global SetDCBrushColor "SetDCBrushColor" intptr, int

; winmdroot.Foundation.COLORREF SetDCPenColor(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.COLORREF color)
#cfunc global SetDCPenColor "SetDCPenColor" intptr, int

; uint SetDIBColorTable(winmdroot.Graphics.Gdi.HDC hdc, uint iStart, uint cEntries, winmdroot.Graphics.Gdi.RGBQUAD* prgbq)
#cfunc global SetDIBColorTable "SetDIBColorTable" intptr, int, int, var

; int SetDIBits(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HBITMAP hbm, uint start, uint cLines, void* lpBits, winmdroot.Graphics.Gdi.BITMAPINFO* lpbmi, winmdroot.Graphics.Gdi.DIB_USAGE ColorUse)
#cfunc global SetDIBits "SetDIBits" intptr, intptr, int, int, intptr, var, int

; int SetDIBitsToDevice(winmdroot.Graphics.Gdi.HDC hdc, int xDest, int yDest, uint w, uint h, int xSrc, int ySrc, uint StartScan, uint cLines, void* lpvBits, winmdroot.Graphics.Gdi.BITMAPINFO* lpbmi, winmdroot.Graphics.Gdi.DIB_USAGE ColorUse)
#cfunc global SetDIBitsToDevice "SetDIBitsToDevice" intptr, int, int, int, int, int, int, int, int, intptr, var, int

; winmdroot.Foundation.BOOL SetDeviceGammaRamp(winmdroot.Graphics.Gdi.HDC hdc, void* lpRamp)
#cfunc global SetDeviceGammaRamp "SetDeviceGammaRamp" intptr, intptr

; winmdroot.Graphics.Gdi.HENHMETAFILE SetEnhMetaFileBits(uint nSize, byte* pb)
#cfunc global SetEnhMetaFileBits "SetEnhMetaFileBits" int, var

; int SetGraphicsMode(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.GRAPHICS_MODE iMode)
#cfunc global SetGraphicsMode "SetGraphicsMode" intptr, int

; int SetICMMode(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.UI.ColorSystem.ICM_MODE mode)
#cfunc global SetICMMode "SetICMMode" intptr, int

; winmdroot.Foundation.BOOL SetICMProfileW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.PWSTR lpFileName)
#cfunc global SetICMProfileW "SetICMProfileW" intptr, wstr

; uint SetLayout(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.DC_LAYOUT l)
#cfunc global SetLayout "SetLayout" intptr, int

; int SetMapMode(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HDC_MAP_MODE iMode)
#cfunc global SetMapMode "SetMapMode" intptr, int

; uint SetMapperFlags(winmdroot.Graphics.Gdi.HDC hdc, uint flags)
#cfunc global SetMapperFlags "SetMapperFlags" intptr, int

; winmdroot.Graphics.Gdi.HMETAFILE SetMetaFileBitsEx(uint cbBuffer, byte* lpData)
#cfunc global SetMetaFileBitsEx "SetMetaFileBitsEx" int, var

; winmdroot.Graphics.Gdi.GDI_REGION_TYPE SetMetaRgn(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global SetMetaRgn "SetMetaRgn" intptr

; winmdroot.Foundation.BOOL SetMiterLimit(winmdroot.Graphics.Gdi.HDC hdc, float limit, [Optional] float* old)
#cfunc global SetMiterLimit "SetMiterLimit" intptr, float, var

; uint SetPaletteEntries(winmdroot.Graphics.Gdi.HPALETTE hpal, uint iStart, uint cEntries, winmdroot.Graphics.Gdi.PALETTEENTRY* pPalEntries)
#cfunc global SetPaletteEntries "SetPaletteEntries" intptr, int, int, var

; winmdroot.Foundation.COLORREF SetPixel(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, winmdroot.Foundation.COLORREF color)
#cfunc global SetPixel "SetPixel" intptr, int, int, int

; winmdroot.Foundation.BOOL SetPixelFormat(winmdroot.Graphics.Gdi.HDC hdc, int format, winmdroot.Graphics.OpenGL.PIXELFORMATDESCRIPTOR* ppfd)
#cfunc global SetPixelFormat "SetPixelFormat" intptr, int, var

; winmdroot.Foundation.BOOL SetPixelV(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, winmdroot.Foundation.COLORREF color)
#cfunc global SetPixelV "SetPixelV" intptr, int, int, int

; int SetPolyFillMode(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.CREATE_POLYGON_RGN_MODE mode)
#cfunc global SetPolyFillMode "SetPolyFillMode" intptr, int

; int SetROP2(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.R2_MODE rop2)
#cfunc global SetROP2 "SetROP2" intptr, int

; winmdroot.Foundation.BOOL SetRectRgn(winmdroot.Graphics.Gdi.HRGN hrgn, int left, int top, int right, int bottom)
#cfunc global SetRectRgn "SetRectRgn" intptr, int, int, int, int

; int SetStretchBltMode(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.STRETCH_BLT_MODE mode)
#cfunc global SetStretchBltMode "SetStretchBltMode" intptr, int

; uint SetSystemPaletteUse(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.SYSTEM_PALETTE_USE use)
#cfunc global SetSystemPaletteUse "SetSystemPaletteUse" intptr, int

; uint SetTextAlign(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.TEXT_ALIGN_OPTIONS align)
#cfunc global SetTextAlign "SetTextAlign" intptr, int

; int SetTextCharacterExtra(winmdroot.Graphics.Gdi.HDC hdc, int extra)
#cfunc global SetTextCharacterExtra "SetTextCharacterExtra" intptr, int

; winmdroot.Foundation.COLORREF SetTextColor(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.COLORREF color)
#cfunc global SetTextColor "SetTextColor" intptr, int

; winmdroot.Foundation.BOOL SetTextJustification(winmdroot.Graphics.Gdi.HDC hdc, int extra, int count)
#cfunc global SetTextJustification "SetTextJustification" intptr, int, int

; winmdroot.Foundation.BOOL SetViewportExtEx(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, [Optional] winmdroot.Foundation.SIZE* lpsz)
#cfunc global SetViewportExtEx "SetViewportExtEx" intptr, int, int, var

; winmdroot.Foundation.BOOL SetViewportOrgEx(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, [Optional] global::System.Drawing.Point* lppt)
#cfunc global SetViewportOrgEx "SetViewportOrgEx" intptr, int, int, var

; winmdroot.Graphics.Gdi.HENHMETAFILE SetWinMetaFileBits(uint nSize, byte* lpMeta16Data, winmdroot.Graphics.Gdi.HDC hdcRef, [Optional] winmdroot.System.DataExchange.METAFILEPICT* lpMFP)
#cfunc global SetWinMetaFileBits "SetWinMetaFileBits" int, var, intptr, var

; winmdroot.Foundation.BOOL SetWindowExtEx(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, [Optional] winmdroot.Foundation.SIZE* lpsz)
#cfunc global SetWindowExtEx "SetWindowExtEx" intptr, int, int, var

; winmdroot.Foundation.BOOL SetWindowOrgEx(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, [Optional] global::System.Drawing.Point* lppt)
#cfunc global SetWindowOrgEx "SetWindowOrgEx" intptr, int, int, var

; winmdroot.Foundation.BOOL SetWorldTransform(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.XFORM* lpxf)
#cfunc global SetWorldTransform "SetWorldTransform" intptr, var

; int StartDocW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Storage.Xps.DOCINFOW* lpdi)
#cfunc global StartDocW "StartDocW" intptr, var

; int StartPage(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global StartPage "StartPage" intptr

; winmdroot.Foundation.BOOL StretchBlt(winmdroot.Graphics.Gdi.HDC hdcDest, int xDest, int yDest, int wDest, int hDest, winmdroot.Graphics.Gdi.HDC hdcSrc, int xSrc, int ySrc, int wSrc, int hSrc, winmdroot.Graphics.Gdi.ROP_CODE rop)
#cfunc global StretchBlt "StretchBlt" intptr, int, int, int, int, intptr, int, int, int, int, int

; int StretchDIBits(winmdroot.Graphics.Gdi.HDC hdc, int xDest, int yDest, int DestWidth, int DestHeight, int xSrc, int ySrc, int SrcWidth, int SrcHeight, [Optional] void* lpBits, winmdroot.Graphics.Gdi.BITMAPINFO* lpbmi, winmdroot.Graphics.Gdi.DIB_USAGE iUsage, winmdroot.Graphics.Gdi.ROP_CODE rop)
#cfunc global StretchDIBits "StretchDIBits" intptr, int, int, int, int, int, int, int, int, intptr, var, int, int

; winmdroot.Foundation.BOOL StrokeAndFillPath(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global StrokeAndFillPath "StrokeAndFillPath" intptr

; winmdroot.Foundation.BOOL StrokePath(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global StrokePath "StrokePath" intptr

; winmdroot.Foundation.BOOL SwapBuffers(winmdroot.Graphics.Gdi.HDC param0)
#cfunc global SwapBuffers "SwapBuffers" intptr

; winmdroot.Foundation.BOOL TextOutW(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, winmdroot.Foundation.PCWSTR lpString, int c)
#cfunc global TextOutW "TextOutW" intptr, int, int, wstr, int

; winmdroot.Foundation.BOOL TranslateCharsetInfo(uint* lpSrc, winmdroot.Globalization.CHARSETINFO* lpCs, winmdroot.Globalization.TRANSLATE_CHARSET_INFO_FLAGS dwFlags)
#cfunc global TranslateCharsetInfo "TranslateCharsetInfo" var, var, int

; winmdroot.Foundation.BOOL UnrealizeObject(winmdroot.Graphics.Gdi.HGDIOBJ h)
#cfunc global UnrealizeObject "UnrealizeObject" intptr

; winmdroot.Foundation.BOOL UpdateColors(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global UpdateColors "UpdateColors" intptr

; winmdroot.Foundation.BOOL UpdateICMRegKeyW(uint reserved, winmdroot.Foundation.PWSTR lpszCMID, winmdroot.Foundation.PWSTR lpszFileName, winmdroot.UI.ColorSystem.ICM_COMMAND command)
#cfunc global UpdateICMRegKeyW "UpdateICMRegKeyW" int, wstr, wstr, int

; winmdroot.Foundation.BOOL WidenPath(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global WidenPath "WidenPath" intptr

; winmdroot.Foundation.BOOL XFORMOBJ_bApplyXform(winmdroot.Devices.Display.XFORMOBJ* pxo, uint iMode, uint cPoints, void* pvIn, void* pvOut)
#cfunc global XFORMOBJ_bApplyXform "XFORMOBJ_bApplyXform" var, int, int, intptr, intptr

; uint XLATEOBJ_cGetPalette(winmdroot.Devices.Display.XLATEOBJ* pxlo, uint iPal, uint cPal, uint* pPal)
#cfunc global XLATEOBJ_cGetPalette "XLATEOBJ_cGetPalette" var, int, int, var

; winmdroot.Foundation.HANDLE XLATEOBJ_hGetColorTransform(winmdroot.Devices.Display.XLATEOBJ* pxlo)
#cfunc global XLATEOBJ_hGetColorTransform "XLATEOBJ_hGetColorTransform" var

; uint XLATEOBJ_iXlate(winmdroot.Devices.Display.XLATEOBJ* pxlo, uint iColor)
#cfunc global XLATEOBJ_iXlate "XLATEOBJ_iXlate" var, int

; uint* XLATEOBJ_piVector(winmdroot.Devices.Display.XLATEOBJ* pxlo)
#cfunc global XLATEOBJ_piVector "XLATEOBJ_piVector" var

#endif
