; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    msimg32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __msimg32_gen2_as__
#define __msimg32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "msimg32.dll"
; winmdroot.Foundation.BOOL AlphaBlend(winmdroot.Graphics.Gdi.HDC hdcDest, int xoriginDest, int yoriginDest, int wDest, int hDest, winmdroot.Graphics.Gdi.HDC hdcSrc, int xoriginSrc, int yoriginSrc, int wSrc, int hSrc, winmdroot.Graphics.Gdi.BLENDFUNCTION ftn)
#cfunc AlphaBlend "AlphaBlend" intptr, int, int, int, int, intptr, int, int, int, int, var

; winmdroot.Foundation.BOOL GradientFill(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.TRIVERTEX* pVertex, uint nVertex, void* pMesh, uint nMesh, winmdroot.Graphics.Gdi.GRADIENT_FILL ulMode)
#cfunc GradientFill "GradientFill" intptr, var, int, intptr, int, int

; winmdroot.Foundation.BOOL TransparentBlt(winmdroot.Graphics.Gdi.HDC hdcDest, int xoriginDest, int yoriginDest, int wDest, int hDest, winmdroot.Graphics.Gdi.HDC hdcSrc, int xoriginSrc, int yoriginSrc, int wSrc, int hSrc, uint crTransparent)
#cfunc TransparentBlt "TransparentBlt" intptr, int, int, int, int, intptr, int, int, int, int, int

#endif
