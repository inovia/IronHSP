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
; winmdroot.Foundation.BOOL BitBlt(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, int cx, int cy, winmdroot.Graphics.Gdi.HDC hdcSrc, int x1, int y1, winmdroot.Graphics.Gdi.ROP_CODE rop)
#cfunc BitBlt "BitBlt" intptr, int, int, int, int, intptr, int, int, int

; winmdroot.Foundation.BOOL DeleteObject(winmdroot.Graphics.Gdi.HGDIOBJ ho)
#cfunc DeleteObject "DeleteObject" intptr

; winmdroot.Graphics.Gdi.HBITMAP CreateBitmap(int nWidth, int nHeight, uint nPlanes, uint nBitCount, [Optional] void* lpBits)
#cfunc CreateBitmap "CreateBitmap" int, int, int, int, intptr

; winmdroot.Graphics.Gdi.HBITMAP CreateCompatibleBitmap(winmdroot.Graphics.Gdi.HDC hdc, int cx, int cy)
#cfunc CreateCompatibleBitmap "CreateCompatibleBitmap" intptr, int, int

; winmdroot.Graphics.Gdi.HDC CreateCompatibleDC(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc CreateCompatibleDC "CreateCompatibleDC" intptr

; winmdroot.Graphics.Gdi.HBITMAP CreateDIBSection(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.BITMAPINFO* pbmi, winmdroot.Graphics.Gdi.DIB_USAGE usage, void** ppvBits, winmdroot.Foundation.HANDLE hSection, uint offset)
#cfunc CreateDIBSection "CreateDIBSection" intptr, var, int, var, intptr, int

; winmdroot.Graphics.Gdi.HFONT CreateFontW(int cHeight, int cWidth, int cEscapement, int cOrientation, int cWeight, uint bItalic, uint bUnderline, uint bStrikeOut, uint iCharSet, uint iOutPrecision, uint iClipPrecision, uint iQuality, uint iPitchAndFamily, winmdroot.Foundation.PCWSTR pszFaceName)
#cfunc CreateFontW "CreateFontW" int, int, int, int, int, int, int, int, int, int, int, int, int, wstr

; winmdroot.Graphics.Gdi.HFONT CreateFontIndirectW(winmdroot.Graphics.Gdi.LOGFONTW* lplf)
#cfunc CreateFontIndirectW "CreateFontIndirectW" var

; winmdroot.Graphics.Gdi.HBRUSH CreateHatchBrush(winmdroot.Graphics.Gdi.HATCH_BRUSH_STYLE iHatch, winmdroot.Foundation.COLORREF color)
#cfunc CreateHatchBrush "CreateHatchBrush" int, int

; winmdroot.Graphics.Gdi.HBRUSH CreatePatternBrush(winmdroot.Graphics.Gdi.HBITMAP hbm)
#cfunc CreatePatternBrush "CreatePatternBrush" intptr

; winmdroot.Graphics.Gdi.HPEN CreatePen(winmdroot.Graphics.Gdi.PEN_STYLE iStyle, int cWidth, winmdroot.Foundation.COLORREF color)
#cfunc CreatePen "CreatePen" int, int, int

; winmdroot.Graphics.Gdi.HBRUSH CreateSolidBrush(winmdroot.Foundation.COLORREF color)
#cfunc CreateSolidBrush "CreateSolidBrush" int

; winmdroot.Foundation.BOOL DeleteDC(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc DeleteDC "DeleteDC" intptr

; winmdroot.Foundation.BOOL Ellipse(winmdroot.Graphics.Gdi.HDC hdc, int left, int top, int right, int bottom)
#cfunc Ellipse "Ellipse" intptr, int, int, int, int

; int GetDIBits(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HBITMAP hbm, uint start, uint cLines, [Optional] void* lpvBits, winmdroot.Graphics.Gdi.BITMAPINFO* lpbmi, winmdroot.Graphics.Gdi.DIB_USAGE usage)
#cfunc GetDIBits "GetDIBits" intptr, intptr, int, int, intptr, var, int

; winmdroot.Foundation.COLORREF GetPixel(winmdroot.Graphics.Gdi.HDC hdc, int x, int y)
#cfunc GetPixel "GetPixel" intptr, int, int

; winmdroot.Graphics.Gdi.HGDIOBJ GetStockObject(winmdroot.Graphics.Gdi.GET_STOCK_OBJECT_FLAGS i)
#cfunc GetStockObject "GetStockObject" int

; winmdroot.Foundation.BOOL GetTextExtentPoint32W(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.PCWSTR lpString, int c, winmdroot.Foundation.SIZE* psizl)
#cfunc GetTextExtentPoint32W "GetTextExtentPoint32W" intptr, wstr, int, var

; winmdroot.Foundation.BOOL GetTextMetricsW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.TEXTMETRICW* lptm)
#cfunc GetTextMetricsW "GetTextMetricsW" intptr, var

; winmdroot.Foundation.BOOL LineTo(winmdroot.Graphics.Gdi.HDC hdc, int x, int y)
#cfunc LineTo "LineTo" intptr, int, int

; winmdroot.Foundation.BOOL MoveToEx(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, [Optional] global::System.Drawing.Point* lppt)
#cfunc MoveToEx "MoveToEx" intptr, int, int, var

; winmdroot.Foundation.BOOL Polygon(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* apt, int cpt)
#cfunc Polygon "Polygon" intptr, var, int

; winmdroot.Foundation.BOOL Polyline(winmdroot.Graphics.Gdi.HDC hdc, global::System.Drawing.Point* apt, int cpt)
#cfunc Polyline "Polyline" intptr, var, int

; winmdroot.Foundation.BOOL Rectangle(winmdroot.Graphics.Gdi.HDC hdc, int left, int top, int right, int bottom)
#cfunc Rectangle "Rectangle" intptr, int, int, int, int

; winmdroot.Graphics.Gdi.HGDIOBJ SelectObject(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HGDIOBJ h)
#cfunc SelectObject "SelectObject" intptr, intptr

; winmdroot.Foundation.COLORREF SetBkColor(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.COLORREF color)
#cfunc SetBkColor "SetBkColor" intptr, int

; int SetBkMode(winmdroot.Graphics.Gdi.HDC hdc, int mode)
#cfunc SetBkMode "SetBkMode" intptr, int

; int SetDIBits(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HBITMAP hbm, uint start, uint cLines, void* lpBits, winmdroot.Graphics.Gdi.BITMAPINFO* lpbmi, winmdroot.Graphics.Gdi.DIB_USAGE ColorUse)
#cfunc SetDIBits "SetDIBits" intptr, intptr, int, int, intptr, var, int

; winmdroot.Foundation.COLORREF SetPixel(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, winmdroot.Foundation.COLORREF color)
#cfunc SetPixel "SetPixel" intptr, int, int, int

; int SetROP2(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.R2_MODE rop2)
#cfunc SetROP2 "SetROP2" intptr, int

; winmdroot.Foundation.COLORREF SetTextColor(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.COLORREF color)
#cfunc SetTextColor "SetTextColor" intptr, int

; winmdroot.Foundation.BOOL StretchBlt(winmdroot.Graphics.Gdi.HDC hdcDest, int xDest, int yDest, int wDest, int hDest, winmdroot.Graphics.Gdi.HDC hdcSrc, int xSrc, int ySrc, int wSrc, int hSrc, winmdroot.Graphics.Gdi.ROP_CODE rop)
#cfunc StretchBlt "StretchBlt" intptr, int, int, int, int, intptr, int, int, int, int, int

; winmdroot.Foundation.BOOL TextOutW(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, winmdroot.Foundation.PCWSTR lpString, int c)
#cfunc TextOutW "TextOutW" intptr, int, int, wstr, int

#endif
