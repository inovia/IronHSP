; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    dwmapi.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __dwmapi_gen2_as__
#define __dwmapi_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "dwmapi.dll"
; winmdroot.Foundation.HRESULT DwmEnableBlurBehindWindow(winmdroot.Foundation.HWND hWnd, winmdroot.Graphics.Dwm.DWM_BLURBEHIND* pBlurBehind)
#cfunc DwmEnableBlurBehindWindow "DwmEnableBlurBehindWindow" intptr, var

; winmdroot.Foundation.HRESULT DwmExtendFrameIntoClientArea(winmdroot.Foundation.HWND hWnd, winmdroot.UI.Controls.MARGINS* pMarInset)
#cfunc DwmExtendFrameIntoClientArea "DwmExtendFrameIntoClientArea" intptr, var

; winmdroot.Foundation.HRESULT DwmGetWindowAttribute(winmdroot.Foundation.HWND hwnd, uint dwAttribute, void* pvAttribute, uint cbAttribute)
#cfunc DwmGetWindowAttribute "DwmGetWindowAttribute" intptr, int, intptr, int

; winmdroot.Foundation.HRESULT DwmSetWindowAttribute(winmdroot.Foundation.HWND hwnd, uint dwAttribute, void* pvAttribute, uint cbAttribute)
#cfunc DwmSetWindowAttribute "DwmSetWindowAttribute" intptr, int, intptr, int

#endif
