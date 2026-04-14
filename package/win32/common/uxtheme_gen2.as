; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    uxtheme.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __uxtheme_gen2_as__
#define __uxtheme_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "uxtheme.dll"
; winmdroot.Foundation.HRESULT CloseThemeData(winmdroot.UI.Controls.HTHEME hTheme)
#cfunc CloseThemeData "CloseThemeData" intptr

; winmdroot.Foundation.HRESULT DrawThemeBackground(winmdroot.UI.Controls.HTHEME hTheme, winmdroot.Graphics.Gdi.HDC hdc, int iPartId, int iStateId, winmdroot.Foundation.RECT* pRect, [Optional] winmdroot.Foundation.RECT* pClipRect)
#cfunc DrawThemeBackground "DrawThemeBackground" intptr, intptr, int, int, var, var

; winmdroot.Foundation.HRESULT DrawThemeText(winmdroot.UI.Controls.HTHEME hTheme, winmdroot.Graphics.Gdi.HDC hdc, int iPartId, int iStateId, winmdroot.Foundation.PCWSTR pszText, int cchText, winmdroot.Graphics.Gdi.DRAW_TEXT_FORMAT dwTextFlags, uint dwTextFlags2, winmdroot.Foundation.RECT* pRect)
#cfunc DrawThemeText "DrawThemeText" intptr, intptr, int, int, wstr, int, int, int, var

; winmdroot.Foundation.HRESULT GetThemeColor(winmdroot.UI.Controls.HTHEME hTheme, int iPartId, int iStateId, int iPropId, winmdroot.Foundation.COLORREF* pColor)
#cfunc GetThemeColor "GetThemeColor" intptr, int, int, int, var

; winmdroot.Foundation.HRESULT GetThemePartSize(winmdroot.UI.Controls.HTHEME hTheme, winmdroot.Graphics.Gdi.HDC hdc, int iPartId, int iStateId, [Optional] winmdroot.Foundation.RECT* prc, winmdroot.UI.Controls.THEMESIZE eSize, winmdroot.Foundation.SIZE* psz)
#cfunc GetThemePartSize "GetThemePartSize" intptr, intptr, int, int, var, int, var

; winmdroot.Foundation.BOOL IsAppThemed()
#cfunc IsAppThemed "IsAppThemed"

; winmdroot.Foundation.BOOL IsThemeActive()
#cfunc IsThemeActive "IsThemeActive"

; winmdroot.UI.Controls.HTHEME OpenThemeData(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.PCWSTR pszClassList)
#cfunc OpenThemeData "OpenThemeData" intptr, wstr

; winmdroot.Foundation.HRESULT SetWindowTheme(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.PCWSTR pszSubAppName, winmdroot.Foundation.PCWSTR pszSubIdList)
#cfunc SetWindowTheme "SetWindowTheme" intptr, wstr, wstr

#endif
