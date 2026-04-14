; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    comctl32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __comctl32_gen2_as__
#define __comctl32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "comctl32.dll"
; winmdroot.Foundation.BOOL ImageList_Destroy(winmdroot.UI.Controls.HIMAGELIST himl)
#cfunc ImageList_Destroy "ImageList_Destroy" intptr

; int ImageList_Add(winmdroot.UI.Controls.HIMAGELIST himl, winmdroot.Graphics.Gdi.HBITMAP hbmImage, winmdroot.Graphics.Gdi.HBITMAP hbmMask)
#cfunc ImageList_Add "ImageList_Add" intptr, intptr, intptr

; winmdroot.UI.Controls.HIMAGELIST ImageList_Create(int cx, int cy, winmdroot.UI.Controls.IMAGELIST_CREATION_FLAGS flags, int cInitial, int cGrow)
#cfunc ImageList_Create "ImageList_Create" int, int, int, int, int

; winmdroot.Foundation.BOOL ImageList_Draw(winmdroot.UI.Controls.HIMAGELIST himl, int i, winmdroot.Graphics.Gdi.HDC hdcDst, int x, int y, winmdroot.UI.Controls.IMAGE_LIST_DRAW_STYLE fStyle)
#cfunc ImageList_Draw "ImageList_Draw" intptr, int, intptr, int, int, int

; int ImageList_GetImageCount(winmdroot.UI.Controls.HIMAGELIST himl)
#cfunc ImageList_GetImageCount "ImageList_GetImageCount" intptr

; winmdroot.Foundation.BOOL InitCommonControlsEx(winmdroot.UI.Controls.INITCOMMONCONTROLSEX* picce)
#cfunc InitCommonControlsEx "InitCommonControlsEx" var

#endif
