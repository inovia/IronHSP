; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    comctl32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __comctl32_gen2_as__
#define global __comctl32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "comctl32.dll"
; winmdroot.Foundation.BOOL ImageList_Destroy(winmdroot.UI.Controls.HIMAGELIST himl)
#cfunc global ImageList_Destroy "ImageList_Destroy" intptr

; winmdroot.Foundation.BOOL DestroyPropertySheetPage(winmdroot.UI.Controls.HPROPSHEETPAGE param0)
#cfunc global DestroyPropertySheetPage "DestroyPropertySheetPage" intptr

; winmdroot.Graphics.Gdi.HBITMAP CreateMappedBitmap(winmdroot.Foundation.HINSTANCE hInstance, nint idBitmap, uint wFlags, [Optional] winmdroot.UI.Controls.COLORMAP* lpColorMap, int iNumMaps)
#cfunc global CreateMappedBitmap "CreateMappedBitmap" intptr, int, int, var, int

; winmdroot.UI.Controls.HPROPSHEETPAGE CreatePropertySheetPageW(winmdroot.UI.Controls.PROPSHEETPAGEW* constPropSheetPagePointer)
#cfunc global CreatePropertySheetPageW "CreatePropertySheetPageW" var

; winmdroot.Foundation.HWND CreateStatusWindow(int style, winmdroot.Foundation.PCWSTR lpszText, winmdroot.Foundation.HWND hwndParent, uint wID)
#cfunc global CreateStatusWindowW "CreateStatusWindowW" int, wstr, intptr, int

; winmdroot.Foundation.HWND CreateUpDownControl(uint dwStyle, int x, int y, int cx, int cy, winmdroot.Foundation.HWND hParent, int nID, winmdroot.Foundation.HINSTANCE hInst, winmdroot.Foundation.HWND hBuddy, int nUpper, int nLower, int nPos)
#cfunc global CreateUpDownControl "CreateUpDownControl" int, int, int, int, int, intptr, int, intptr, intptr, int, int, int

; winmdroot.Foundation.BOOL DPA_Destroy(winmdroot.UI.Controls.HDPA hdpa)
#cfunc global DPA_Destroy "DPA_Destroy" intptr

; winmdroot.UI.Controls.HDPA DPA_Clone(winmdroot.UI.Controls.HDPA hdpa, winmdroot.UI.Controls.HDPA hdpaNew)
#cfunc global DPA_Clone "DPA_Clone" intptr, intptr

; winmdroot.UI.Controls.HDPA DPA_Create(int cItemGrow)
#cfunc global DPA_Create "DPA_Create" int

; winmdroot.UI.Controls.HDPA DPA_CreateEx(int cpGrow, winmdroot.Foundation.HANDLE hheap)
#cfunc global DPA_CreateEx "DPA_CreateEx" int, intptr

; winmdroot.Foundation.BOOL DPA_DeleteAllPtrs(winmdroot.UI.Controls.HDPA hdpa)
#cfunc global DPA_DeleteAllPtrs "DPA_DeleteAllPtrs" intptr

; void* DPA_DeletePtr(winmdroot.UI.Controls.HDPA hdpa, int i)
#cfunc global DPA_DeletePtr "DPA_DeletePtr" intptr, int

; void DPA_DestroyCallback(winmdroot.UI.Controls.HDPA hdpa, delegate *unmanaged[Stdcall]<void*,void*,int> pfnCB, [Optional] void* pData)
#func global DPA_DestroyCallback "DPA_DestroyCallback" intptr, int, intptr

; void DPA_EnumCallback(winmdroot.UI.Controls.HDPA hdpa, delegate *unmanaged[Stdcall]<void*,void*,int> pfnCB, [Optional] void* pData)
#func global DPA_EnumCallback "DPA_EnumCallback" intptr, int, intptr

; void* DPA_GetPtr(winmdroot.UI.Controls.HDPA hdpa, nint i)
#cfunc global DPA_GetPtr "DPA_GetPtr" intptr, int

; int DPA_GetPtrIndex(winmdroot.UI.Controls.HDPA hdpa, [Optional] void* p)
#cfunc global DPA_GetPtrIndex "DPA_GetPtrIndex" intptr, intptr

; winmdroot.Foundation.BOOL DPA_Grow(winmdroot.UI.Controls.HDPA pdpa, int cp)
#cfunc global DPA_Grow "DPA_Grow" intptr, int

; int DPA_InsertPtr(winmdroot.UI.Controls.HDPA hdpa, int i, [Optional] void* p)
#cfunc global DPA_InsertPtr "DPA_InsertPtr" intptr, int, intptr

; winmdroot.Foundation.HRESULT DPA_LoadStream(winmdroot.UI.Controls.HDPA* phdpa, delegate *unmanaged[Stdcall]<winmdroot.UI.Controls.DPASTREAMINFO*,global::Windows.Win32.System.Com.IStream*,void*,global::Windows.Win32.Foundation.HRESULT> pfn, winmdroot.System.Com.IStream* pstream, [Optional] void* pvInstData)
#cfunc global DPA_LoadStream "DPA_LoadStream" intptr, int, var, intptr

; winmdroot.Foundation.BOOL DPA_Merge(winmdroot.UI.Controls.HDPA hdpaDest, winmdroot.UI.Controls.HDPA hdpaSrc, uint dwFlags, delegate *unmanaged[Stdcall]<void*,void*,global::Windows.Win32.Foundation.LPARAM,int> pfnCompare, delegate *unmanaged[Stdcall]<global::Windows.Win32.UI.Controls.DPAMM_MESSAGE,void*,void*,global::Windows.Win32.Foundation.LPARAM,void*> pfnMerge, winmdroot.Foundation.LPARAM lParam)
#cfunc global DPA_Merge "DPA_Merge" intptr, intptr, int, int, int, intptr

; winmdroot.Foundation.HRESULT DPA_SaveStream(winmdroot.UI.Controls.HDPA hdpa, delegate *unmanaged[Stdcall]<winmdroot.UI.Controls.DPASTREAMINFO*,global::Windows.Win32.System.Com.IStream*,void*,global::Windows.Win32.Foundation.HRESULT> pfn, winmdroot.System.Com.IStream* pstream, [Optional] void* pvInstData)
#cfunc global DPA_SaveStream "DPA_SaveStream" intptr, int, var, intptr

; int DPA_Search(winmdroot.UI.Controls.HDPA hdpa, [Optional] void* pFind, int iStart, delegate *unmanaged[Stdcall]<void*,void*,global::Windows.Win32.Foundation.LPARAM,int> pfnCompare, winmdroot.Foundation.LPARAM lParam, uint options)
#cfunc global DPA_Search "DPA_Search" intptr, intptr, int, int, intptr, int

; winmdroot.Foundation.BOOL DPA_SetPtr(winmdroot.UI.Controls.HDPA hdpa, int i, [Optional] void* p)
#cfunc global DPA_SetPtr "DPA_SetPtr" intptr, int, intptr

; winmdroot.Foundation.BOOL DPA_Sort(winmdroot.UI.Controls.HDPA hdpa, delegate *unmanaged[Stdcall]<void*,void*,global::Windows.Win32.Foundation.LPARAM,int> pfnCompare, winmdroot.Foundation.LPARAM lParam)
#cfunc global DPA_Sort "DPA_Sort" intptr, int, intptr

; winmdroot.Foundation.BOOL DSA_Destroy(winmdroot.UI.Controls.HDSA hdsa)
#cfunc global DSA_Destroy "DSA_Destroy" intptr

; winmdroot.UI.Controls.HDSA DSA_Create(int cbItem, int cItemGrow)
#cfunc global DSA_Create "DSA_Create" int, int

; winmdroot.Foundation.BOOL DSA_DeleteAllItems(winmdroot.UI.Controls.HDSA hdsa)
#cfunc global DSA_DeleteAllItems "DSA_DeleteAllItems" intptr

; winmdroot.Foundation.BOOL DSA_DeleteItem(winmdroot.UI.Controls.HDSA hdsa, int i)
#cfunc global DSA_DeleteItem "DSA_DeleteItem" intptr, int

; void DSA_DestroyCallback(winmdroot.UI.Controls.HDSA hdsa, delegate *unmanaged[Stdcall]<void*,void*,int> pfnCB, [Optional] void* pData)
#func global DSA_DestroyCallback "DSA_DestroyCallback" intptr, int, intptr

; void DSA_EnumCallback(winmdroot.UI.Controls.HDSA hdsa, delegate *unmanaged[Stdcall]<void*,void*,int> pfnCB, [Optional] void* pData)
#func global DSA_EnumCallback "DSA_EnumCallback" intptr, int, intptr

; winmdroot.Foundation.BOOL DSA_GetItem(winmdroot.UI.Controls.HDSA hdsa, int i, void* pitem)
#cfunc global DSA_GetItem "DSA_GetItem" intptr, int, intptr

; void* DSA_GetItemPtr(winmdroot.UI.Controls.HDSA hdsa, int i)
#cfunc global DSA_GetItemPtr "DSA_GetItemPtr" intptr, int

; int DSA_InsertItem(winmdroot.UI.Controls.HDSA hdsa, int i, void* pitem)
#cfunc global DSA_InsertItem "DSA_InsertItem" intptr, int, intptr

; winmdroot.Foundation.BOOL DSA_SetItem(winmdroot.UI.Controls.HDSA hdsa, int i, void* pitem)
#cfunc global DSA_SetItem "DSA_SetItem" intptr, int, intptr

; winmdroot.Foundation.LRESULT DefSubclassProc(winmdroot.Foundation.HWND hWnd, uint uMsg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam)
#cfunc global DefSubclassProc "DefSubclassProc" intptr, int, intptr, intptr

; void DrawInsert(winmdroot.Foundation.HWND handParent, winmdroot.Foundation.HWND hLB, int nItem)
#func global DrawInsert "DrawInsert" intptr, intptr, int

; void DrawStatusTextW(winmdroot.Graphics.Gdi.HDC hDC, winmdroot.Foundation.RECT* lprc, winmdroot.Foundation.PCWSTR pszText, uint uFlags)
#func global DrawStatusTextW "DrawStatusTextW" intptr, var, wstr, int

; winmdroot.Foundation.BOOL FlatSB_EnableScrollBar(winmdroot.Foundation.HWND param0, int param1, uint param2)
#cfunc global FlatSB_EnableScrollBar "FlatSB_EnableScrollBar" intptr, int, int

; winmdroot.Foundation.BOOL FlatSB_GetScrollInfo(winmdroot.Foundation.HWND param0, winmdroot.UI.WindowsAndMessaging.SCROLLBAR_CONSTANTS code, winmdroot.UI.WindowsAndMessaging.SCROLLINFO* param2)
#cfunc global FlatSB_GetScrollInfo "FlatSB_GetScrollInfo" intptr, int, var

; int FlatSB_GetScrollPos(winmdroot.Foundation.HWND param0, winmdroot.UI.WindowsAndMessaging.SCROLLBAR_CONSTANTS code)
#cfunc global FlatSB_GetScrollPos "FlatSB_GetScrollPos" intptr, int

; winmdroot.Foundation.BOOL FlatSB_GetScrollProp(winmdroot.Foundation.HWND param0, winmdroot.UI.Controls.WSB_PROP propIndex, int* param2)
#cfunc global FlatSB_GetScrollProp "FlatSB_GetScrollProp" intptr, int, var

; winmdroot.Foundation.BOOL FlatSB_GetScrollRange(winmdroot.Foundation.HWND param0, winmdroot.UI.WindowsAndMessaging.SCROLLBAR_CONSTANTS code, int* param2, int* param3)
#cfunc global FlatSB_GetScrollRange "FlatSB_GetScrollRange" intptr, int, var, var

; int FlatSB_SetScrollInfo(winmdroot.Foundation.HWND param0, winmdroot.UI.WindowsAndMessaging.SCROLLBAR_CONSTANTS code, winmdroot.UI.WindowsAndMessaging.SCROLLINFO* psi, winmdroot.Foundation.BOOL fRedraw)
#cfunc global FlatSB_SetScrollInfo "FlatSB_SetScrollInfo" intptr, int, var, int

; int FlatSB_SetScrollPos(winmdroot.Foundation.HWND param0, winmdroot.UI.WindowsAndMessaging.SCROLLBAR_CONSTANTS code, int pos, winmdroot.Foundation.BOOL fRedraw)
#cfunc global FlatSB_SetScrollPos "FlatSB_SetScrollPos" intptr, int, int, int

; winmdroot.Foundation.BOOL FlatSB_SetScrollProp(winmdroot.Foundation.HWND param0, uint index, nint newValue, winmdroot.Foundation.BOOL param3)
#cfunc global FlatSB_SetScrollProp "FlatSB_SetScrollProp" intptr, int, int, int

; int FlatSB_SetScrollRange(winmdroot.Foundation.HWND param0, winmdroot.UI.WindowsAndMessaging.SCROLLBAR_CONSTANTS code, int min, int max, winmdroot.Foundation.BOOL fRedraw)
#cfunc global FlatSB_SetScrollRange "FlatSB_SetScrollRange" intptr, int, int, int, int

; winmdroot.Foundation.BOOL FlatSB_ShowScrollBar(winmdroot.Foundation.HWND param0, winmdroot.UI.WindowsAndMessaging.SCROLLBAR_CONSTANTS code, winmdroot.Foundation.BOOL param2)
#cfunc global FlatSB_ShowScrollBar "FlatSB_ShowScrollBar" intptr, int, int

; void GetEffectiveClientRect(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.RECT* lprc, int* lpInfo)
#func global GetEffectiveClientRect "GetEffectiveClientRect" intptr, var, var

; ushort GetMUILanguage()
#cfunc global GetMUILanguage "GetMUILanguage"

; int ImageList_Add(winmdroot.UI.Controls.HIMAGELIST himl, winmdroot.Graphics.Gdi.HBITMAP hbmImage, winmdroot.Graphics.Gdi.HBITMAP hbmMask)
#cfunc global ImageList_Add "ImageList_Add" intptr, intptr, intptr

; int ImageList_AddMasked(winmdroot.UI.Controls.HIMAGELIST himl, winmdroot.Graphics.Gdi.HBITMAP hbmImage, winmdroot.Foundation.COLORREF crMask)
#cfunc global ImageList_AddMasked "ImageList_AddMasked" intptr, intptr, int

; winmdroot.Foundation.BOOL ImageList_BeginDrag(winmdroot.UI.Controls.HIMAGELIST himlTrack, int iTrack, int dxHotspot, int dyHotspot)
#cfunc global ImageList_BeginDrag "ImageList_BeginDrag" intptr, int, int, int

; winmdroot.Foundation.BOOL ImageList_Copy(winmdroot.UI.Controls.HIMAGELIST himlDst, int iDst, winmdroot.UI.Controls.HIMAGELIST himlSrc, int iSrc, winmdroot.UI.Controls.IMAGE_LIST_COPY_FLAGS uFlags)
#cfunc global ImageList_Copy "ImageList_Copy" intptr, int, intptr, int, int

; winmdroot.UI.Controls.HIMAGELIST ImageList_Create(int cx, int cy, winmdroot.UI.Controls.IMAGELIST_CREATION_FLAGS flags, int cInitial, int cGrow)
#cfunc global ImageList_Create "ImageList_Create" int, int, int, int, int

; winmdroot.Foundation.BOOL ImageList_DragEnter(winmdroot.Foundation.HWND hwndLock, int x, int y)
#cfunc global ImageList_DragEnter "ImageList_DragEnter" intptr, int, int

; winmdroot.Foundation.BOOL ImageList_DragLeave(winmdroot.Foundation.HWND hwndLock)
#cfunc global ImageList_DragLeave "ImageList_DragLeave" intptr

; winmdroot.Foundation.BOOL ImageList_DragMove(int x, int y)
#cfunc global ImageList_DragMove "ImageList_DragMove" int, int

; winmdroot.Foundation.BOOL ImageList_DragShowNolock(winmdroot.Foundation.BOOL fShow)
#cfunc global ImageList_DragShowNolock "ImageList_DragShowNolock" int

; winmdroot.Foundation.BOOL ImageList_Draw(winmdroot.UI.Controls.HIMAGELIST himl, int i, winmdroot.Graphics.Gdi.HDC hdcDst, int x, int y, winmdroot.UI.Controls.IMAGE_LIST_DRAW_STYLE fStyle)
#cfunc global ImageList_Draw "ImageList_Draw" intptr, int, intptr, int, int, int

; winmdroot.Foundation.BOOL ImageList_DrawEx(winmdroot.UI.Controls.HIMAGELIST himl, int i, winmdroot.Graphics.Gdi.HDC hdcDst, int x, int y, int dx, int dy, winmdroot.Foundation.COLORREF rgbBk, winmdroot.Foundation.COLORREF rgbFg, winmdroot.UI.Controls.IMAGE_LIST_DRAW_STYLE fStyle)
#cfunc global ImageList_DrawEx "ImageList_DrawEx" intptr, int, intptr, int, int, int, int, int, int, int

; winmdroot.Foundation.BOOL ImageList_DrawIndirect(winmdroot.UI.Controls.IMAGELISTDRAWPARAMS* pimldp)
#cfunc global ImageList_DrawIndirect "ImageList_DrawIndirect" var

; winmdroot.UI.Controls.HIMAGELIST ImageList_Duplicate(winmdroot.UI.Controls.HIMAGELIST himl)
#cfunc global ImageList_Duplicate "ImageList_Duplicate" intptr

; void ImageList_EndDrag()
#func global ImageList_EndDrag "ImageList_EndDrag"

; winmdroot.Foundation.COLORREF ImageList_GetBkColor(winmdroot.UI.Controls.HIMAGELIST himl)
#cfunc global ImageList_GetBkColor "ImageList_GetBkColor" intptr

; winmdroot.UI.Controls.HIMAGELIST ImageList_GetDragImage([Optional] global::System.Drawing.Point* ppt, [Optional] global::System.Drawing.Point* pptHotspot)
#cfunc global ImageList_GetDragImage "ImageList_GetDragImage" var, var

; winmdroot.UI.WindowsAndMessaging.HICON ImageList_GetIcon(winmdroot.UI.Controls.HIMAGELIST himl, int i, winmdroot.UI.Controls.IMAGE_LIST_DRAW_STYLE flags)
#cfunc global ImageList_GetIcon "ImageList_GetIcon" intptr, int, int

; winmdroot.Foundation.BOOL ImageList_GetIconSize(winmdroot.UI.Controls.HIMAGELIST himl, [Optional] int* cx, [Optional] int* cy)
#cfunc global ImageList_GetIconSize "ImageList_GetIconSize" intptr, var, var

; int ImageList_GetImageCount(winmdroot.UI.Controls.HIMAGELIST himl)
#cfunc global ImageList_GetImageCount "ImageList_GetImageCount" intptr

; winmdroot.Foundation.BOOL ImageList_GetImageInfo(winmdroot.UI.Controls.HIMAGELIST himl, int i, winmdroot.UI.Controls.IMAGEINFO* pImageInfo)
#cfunc global ImageList_GetImageInfo "ImageList_GetImageInfo" intptr, int, var

; winmdroot.UI.Controls.HIMAGELIST ImageList_LoadImageW(winmdroot.Foundation.HINSTANCE hi, winmdroot.Foundation.PCWSTR lpbmp, int cx, int cGrow, winmdroot.Foundation.COLORREF crMask, uint uType, winmdroot.UI.WindowsAndMessaging.IMAGE_FLAGS uFlags)
#cfunc global ImageList_LoadImageW "ImageList_LoadImageW" intptr, wstr, int, int, int, int, int

; winmdroot.UI.Controls.HIMAGELIST ImageList_Merge(winmdroot.UI.Controls.HIMAGELIST himl1, int i1, winmdroot.UI.Controls.HIMAGELIST himl2, int i2, int dx, int dy)
#cfunc global ImageList_Merge "ImageList_Merge" intptr, int, intptr, int, int, int

; winmdroot.UI.Controls.HIMAGELIST ImageList_Read(winmdroot.System.Com.IStream* pstm)
#cfunc global ImageList_Read "ImageList_Read" var

; winmdroot.Foundation.BOOL ImageList_Remove(winmdroot.UI.Controls.HIMAGELIST himl, int i)
#cfunc global ImageList_Remove "ImageList_Remove" intptr, int

; winmdroot.Foundation.BOOL ImageList_Replace(winmdroot.UI.Controls.HIMAGELIST himl, int i, winmdroot.Graphics.Gdi.HBITMAP hbmImage, winmdroot.Graphics.Gdi.HBITMAP hbmMask)
#cfunc global ImageList_Replace "ImageList_Replace" intptr, int, intptr, intptr

; int ImageList_ReplaceIcon(winmdroot.UI.Controls.HIMAGELIST himl, int i, winmdroot.UI.WindowsAndMessaging.HICON hicon)
#cfunc global ImageList_ReplaceIcon "ImageList_ReplaceIcon" intptr, int, intptr

; winmdroot.Foundation.COLORREF ImageList_SetBkColor(winmdroot.UI.Controls.HIMAGELIST himl, winmdroot.Foundation.COLORREF clrBk)
#cfunc global ImageList_SetBkColor "ImageList_SetBkColor" intptr, int

; winmdroot.Foundation.BOOL ImageList_SetDragCursorImage(winmdroot.UI.Controls.HIMAGELIST himlDrag, int iDrag, int dxHotspot, int dyHotspot)
#cfunc global ImageList_SetDragCursorImage "ImageList_SetDragCursorImage" intptr, int, int, int

; winmdroot.Foundation.BOOL ImageList_SetIconSize(winmdroot.UI.Controls.HIMAGELIST himl, int cx, int cy)
#cfunc global ImageList_SetIconSize "ImageList_SetIconSize" intptr, int, int

; winmdroot.Foundation.BOOL ImageList_SetImageCount(winmdroot.UI.Controls.HIMAGELIST himl, uint uNewCount)
#cfunc global ImageList_SetImageCount "ImageList_SetImageCount" intptr, int

; winmdroot.Foundation.BOOL ImageList_SetOverlayImage(winmdroot.UI.Controls.HIMAGELIST himl, int iImage, int iOverlay)
#cfunc global ImageList_SetOverlayImage "ImageList_SetOverlayImage" intptr, int, int

; winmdroot.Foundation.BOOL ImageList_Write(winmdroot.UI.Controls.HIMAGELIST himl, winmdroot.System.Com.IStream* pstm)
#cfunc global ImageList_Write "ImageList_Write" intptr, var

; void InitCommonControls()
#func global InitCommonControls "InitCommonControls"

; winmdroot.Foundation.BOOL InitCommonControlsEx(winmdroot.UI.Controls.INITCOMMONCONTROLSEX* picce)
#cfunc global InitCommonControlsEx "InitCommonControlsEx" var

; void InitMUILanguage(ushort uiLang)
#func global InitMUILanguage "InitMUILanguage" int

; winmdroot.Foundation.BOOL InitializeFlatSB(winmdroot.Foundation.HWND param0)
#cfunc global InitializeFlatSB "InitializeFlatSB" intptr

; int LBItemFromPt(winmdroot.Foundation.HWND hLB, global::System.Drawing.Point pt, winmdroot.Foundation.BOOL bAutoScroll)
#cfunc global LBItemFromPt "LBItemFromPt" intptr, int, int

; winmdroot.Foundation.BOOL MakeDragList(winmdroot.Foundation.HWND hLB)
#cfunc global MakeDragList "MakeDragList" intptr

; void MenuHelp(uint uMsg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam, winmdroot.UI.WindowsAndMessaging.HMENU hMainMenu, winmdroot.Foundation.HINSTANCE hInst, winmdroot.Foundation.HWND hwndStatus, uint* lpwIDs)
#func global MenuHelp "MenuHelp" int, intptr, intptr, intptr, intptr, intptr, var

; nint PropertySheet(winmdroot.UI.Controls.PROPSHEETHEADERW_V2* param0)
#cfunc global PropertySheetW "PropertySheetW" var

; winmdroot.Foundation.BOOL RemoveWindowSubclass(winmdroot.Foundation.HWND hWnd, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,uint,global::Windows.Win32.Foundation.WPARAM,global::Windows.Win32.Foundation.LPARAM,nuint,nuint,global::Windows.Win32.Foundation.LRESULT> pfnSubclass, nuint uIdSubclass)
#cfunc global RemoveWindowSubclass "RemoveWindowSubclass" intptr, int, int

; winmdroot.Foundation.BOOL SetWindowSubclass(winmdroot.Foundation.HWND hWnd, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,uint,global::Windows.Win32.Foundation.WPARAM,global::Windows.Win32.Foundation.LPARAM,nuint,nuint,global::Windows.Win32.Foundation.LRESULT> pfnSubclass, nuint uIdSubclass, nuint dwRefData)
#cfunc global SetWindowSubclass "SetWindowSubclass" intptr, int, int, int

; winmdroot.Foundation.BOOL ShowHideMenuCtl(winmdroot.Foundation.HWND hWnd, nuint uFlags, int* lpInfo)
#cfunc global ShowHideMenuCtl "ShowHideMenuCtl" intptr, int, var

; winmdroot.Foundation.BOOL Str_SetPtrW(winmdroot.Foundation.PWSTR* ppsz, winmdroot.Foundation.PCWSTR psz)
#cfunc global Str_SetPtrW "Str_SetPtrW" var, wstr

; winmdroot.Foundation.HRESULT UninitializeFlatSB(winmdroot.Foundation.HWND param0)
#cfunc global UninitializeFlatSB "UninitializeFlatSB" intptr

#endif
