; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    dwmapi.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __dwmapi_gen2_as__
#define global __dwmapi_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "dwmapi.dll"
; winmdroot.Foundation.HRESULT DwmAttachMilContent(winmdroot.Foundation.HWND hwnd)
#cfunc global DwmAttachMilContent "DwmAttachMilContent" intptr

; winmdroot.Foundation.BOOL DwmDefWindowProc(winmdroot.Foundation.HWND hWnd, uint msg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam, winmdroot.Foundation.LRESULT* plResult)
#cfunc global DwmDefWindowProc "DwmDefWindowProc" intptr, int, intptr, intptr, intptr

; winmdroot.Foundation.HRESULT DwmDetachMilContent(winmdroot.Foundation.HWND hwnd)
#cfunc global DwmDetachMilContent "DwmDetachMilContent" intptr

; winmdroot.Foundation.HRESULT DwmEnableBlurBehindWindow(winmdroot.Foundation.HWND hWnd, winmdroot.Graphics.Dwm.DWM_BLURBEHIND* pBlurBehind)
#cfunc global DwmEnableBlurBehindWindow "DwmEnableBlurBehindWindow" intptr, var

; winmdroot.Foundation.HRESULT DwmEnableComposition(uint uCompositionAction)
#cfunc global DwmEnableComposition "DwmEnableComposition" int

; winmdroot.Foundation.HRESULT DwmEnableMMCSS(winmdroot.Foundation.BOOL fEnableMMCSS)
#cfunc global DwmEnableMMCSS "DwmEnableMMCSS" int

; winmdroot.Foundation.HRESULT DwmExtendFrameIntoClientArea(winmdroot.Foundation.HWND hWnd, winmdroot.UI.Controls.MARGINS* pMarInset)
#cfunc global DwmExtendFrameIntoClientArea "DwmExtendFrameIntoClientArea" intptr, var

; winmdroot.Foundation.HRESULT DwmFlush()
#cfunc global DwmFlush "DwmFlush"

; winmdroot.Foundation.HRESULT DwmGetColorizationColor(uint* pcrColorization, winmdroot.Foundation.BOOL* pfOpaqueBlend)
#cfunc global DwmGetColorizationColor "DwmGetColorizationColor" var, var

; winmdroot.Foundation.HRESULT DwmGetCompositionTimingInfo(winmdroot.Foundation.HWND hwnd, winmdroot.Graphics.Dwm.DWM_TIMING_INFO* pTimingInfo)
#cfunc global DwmGetCompositionTimingInfo "DwmGetCompositionTimingInfo" intptr, var

; winmdroot.Foundation.HRESULT DwmGetGraphicsStreamClient(uint uIndex, global::System.Guid* pClientUuid)
#cfunc global DwmGetGraphicsStreamClient "DwmGetGraphicsStreamClient" int, var

; winmdroot.Foundation.HRESULT DwmGetGraphicsStreamTransformHint(uint uIndex, winmdroot.Graphics.Dwm.MilMatrix3x2D* pTransform)
#cfunc global DwmGetGraphicsStreamTransformHint "DwmGetGraphicsStreamTransformHint" int, var

; winmdroot.Foundation.HRESULT DwmGetTransportAttributes(winmdroot.Foundation.BOOL* pfIsRemoting, winmdroot.Foundation.BOOL* pfIsConnected, uint* pDwGeneration)
#cfunc global DwmGetTransportAttributes "DwmGetTransportAttributes" var, var, var

; winmdroot.Foundation.HRESULT DwmGetUnmetTabRequirements(winmdroot.Foundation.HWND appWindow, winmdroot.Graphics.Dwm.DWM_TAB_WINDOW_REQUIREMENTS* value)
#cfunc global DwmGetUnmetTabRequirements "DwmGetUnmetTabRequirements" intptr, var

; winmdroot.Foundation.HRESULT DwmGetWindowAttribute(winmdroot.Foundation.HWND hwnd, uint dwAttribute, void* pvAttribute, uint cbAttribute)
#cfunc global DwmGetWindowAttribute "DwmGetWindowAttribute" intptr, int, intptr, int

; winmdroot.Foundation.HRESULT DwmInvalidateIconicBitmaps(winmdroot.Foundation.HWND hwnd)
#cfunc global DwmInvalidateIconicBitmaps "DwmInvalidateIconicBitmaps" intptr

; winmdroot.Foundation.HRESULT DwmIsCompositionEnabled(winmdroot.Foundation.BOOL* pfEnabled)
#cfunc global DwmIsCompositionEnabled "DwmIsCompositionEnabled" var

; winmdroot.Foundation.HRESULT DwmModifyPreviousDxFrameDuration(winmdroot.Foundation.HWND hwnd, int cRefreshes, winmdroot.Foundation.BOOL fRelative)
#cfunc global DwmModifyPreviousDxFrameDuration "DwmModifyPreviousDxFrameDuration" intptr, int, int

; winmdroot.Foundation.HRESULT DwmQueryThumbnailSourceSize(nint hThumbnail, winmdroot.Foundation.SIZE* pSize)
#cfunc global DwmQueryThumbnailSourceSize "DwmQueryThumbnailSourceSize" int, var

; winmdroot.Foundation.HRESULT DwmRegisterThumbnail(winmdroot.Foundation.HWND hwndDestination, winmdroot.Foundation.HWND hwndSource, nint* phThumbnailId)
#cfunc global DwmRegisterThumbnail "DwmRegisterThumbnail" intptr, intptr, var

; winmdroot.Foundation.HRESULT DwmRenderGesture(winmdroot.Graphics.Dwm.GESTURE_TYPE gt, uint cContacts, uint* pdwPointerID, global::System.Drawing.Point* pPoints)
#cfunc global DwmRenderGesture "DwmRenderGesture" int, int, var, var

; winmdroot.Foundation.HRESULT DwmSetDxFrameDuration(winmdroot.Foundation.HWND hwnd, int cRefreshes)
#cfunc global DwmSetDxFrameDuration "DwmSetDxFrameDuration" intptr, int

; winmdroot.Foundation.HRESULT DwmSetIconicLivePreviewBitmap(winmdroot.Foundation.HWND hwnd, winmdroot.Graphics.Gdi.HBITMAP hbmp, [Optional] global::System.Drawing.Point* pptClient, uint dwSITFlags)
#cfunc global DwmSetIconicLivePreviewBitmap "DwmSetIconicLivePreviewBitmap" intptr, intptr, var, int

; winmdroot.Foundation.HRESULT DwmSetIconicThumbnail(winmdroot.Foundation.HWND hwnd, winmdroot.Graphics.Gdi.HBITMAP hbmp, uint dwSITFlags)
#cfunc global DwmSetIconicThumbnail "DwmSetIconicThumbnail" intptr, intptr, int

; winmdroot.Foundation.HRESULT DwmSetPresentParameters(winmdroot.Foundation.HWND hwnd, winmdroot.Graphics.Dwm.DWM_PRESENT_PARAMETERS* pPresentParams)
#cfunc global DwmSetPresentParameters "DwmSetPresentParameters" intptr, var

; winmdroot.Foundation.HRESULT DwmSetWindowAttribute(winmdroot.Foundation.HWND hwnd, uint dwAttribute, void* pvAttribute, uint cbAttribute)
#cfunc global DwmSetWindowAttribute "DwmSetWindowAttribute" intptr, int, intptr, int

; winmdroot.Foundation.HRESULT DwmShowContact(uint dwPointerID, winmdroot.Graphics.Dwm.DWM_SHOWCONTACT eShowContact)
#cfunc global DwmShowContact "DwmShowContact" int, int

; winmdroot.Foundation.HRESULT DwmTetherContact(uint dwPointerID, winmdroot.Foundation.BOOL fEnable, global::System.Drawing.Point ptTether)
#cfunc global DwmTetherContact "DwmTetherContact" int, int, int

; winmdroot.Foundation.HRESULT DwmTransitionOwnedWindow(winmdroot.Foundation.HWND hwnd, winmdroot.Graphics.Dwm.DWMTRANSITION_OWNEDWINDOW_TARGET target)
#cfunc global DwmTransitionOwnedWindow "DwmTransitionOwnedWindow" intptr, int

; winmdroot.Foundation.HRESULT DwmUnregisterThumbnail(nint hThumbnailId)
#cfunc global DwmUnregisterThumbnail "DwmUnregisterThumbnail" int

; winmdroot.Foundation.HRESULT DwmUpdateThumbnailProperties(nint hThumbnailId, winmdroot.Graphics.Dwm.DWM_THUMBNAIL_PROPERTIES* ptnProperties)
#cfunc global DwmUpdateThumbnailProperties "DwmUpdateThumbnailProperties" int, var

#endif
