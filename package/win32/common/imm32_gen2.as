; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    imm32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __imm32_gen2_as__
#define __imm32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "imm32.dll"
; winmdroot.Foundation.BOOL ImmDestroyContext(winmdroot.UI.Input.Ime.HIMC param0)
#cfunc ImmDestroyContext "ImmDestroyContext" intptr

; winmdroot.UI.Input.Ime.HIMC ImmAssociateContext(winmdroot.Foundation.HWND param0, winmdroot.UI.Input.Ime.HIMC param1)
#cfunc ImmAssociateContext "ImmAssociateContext" intptr, intptr

; winmdroot.Foundation.BOOL ImmAssociateContextEx(winmdroot.Foundation.HWND param0, winmdroot.UI.Input.Ime.HIMC param1, uint param2)
#cfunc ImmAssociateContextEx "ImmAssociateContextEx" intptr, intptr, int

; winmdroot.Foundation.BOOL ImmConfigureIMEA(winmdroot.UI.Input.KeyboardAndMouse.HKL param0, winmdroot.Foundation.HWND param1, uint param2, void* param3)
#cfunc ImmConfigureIMEA "ImmConfigureIMEA" intptr, intptr, int, intptr

; winmdroot.Foundation.BOOL ImmConfigureIMEW(winmdroot.UI.Input.KeyboardAndMouse.HKL param0, winmdroot.Foundation.HWND param1, uint param2, void* param3)
#cfunc ImmConfigureIMEW "ImmConfigureIMEW" intptr, intptr, int, intptr

; winmdroot.UI.Input.Ime.HIMC ImmCreateContext()
#cfunc ImmCreateContext "ImmCreateContext"

; winmdroot.UI.Input.Ime.HIMCC ImmCreateIMCC(uint param0)
#cfunc ImmCreateIMCC "ImmCreateIMCC" int

; winmdroot.Foundation.HWND ImmCreateSoftKeyboard(uint param0, winmdroot.Foundation.HWND param1, int param2, int param3)
#cfunc ImmCreateSoftKeyboard "ImmCreateSoftKeyboard" int, intptr, int, int

; winmdroot.UI.Input.Ime.HIMCC ImmDestroyIMCC(winmdroot.UI.Input.Ime.HIMCC param0)
#cfunc ImmDestroyIMCC "ImmDestroyIMCC" intptr

; winmdroot.Foundation.BOOL ImmDestroySoftKeyboard(winmdroot.Foundation.HWND param0)
#cfunc ImmDestroySoftKeyboard "ImmDestroySoftKeyboard" intptr

; winmdroot.Foundation.BOOL ImmDisableIME(uint param0)
#cfunc ImmDisableIME "ImmDisableIME" int

; winmdroot.Foundation.BOOL ImmDisableLegacyIME()
#cfunc ImmDisableLegacyIME "ImmDisableLegacyIME"

; winmdroot.Foundation.BOOL ImmDisableTextFrameService(uint idThread)
#cfunc ImmDisableTextFrameService "ImmDisableTextFrameService" int

; winmdroot.Foundation.BOOL ImmEnumInputContext(uint idThread, delegate *unmanaged[Stdcall]<global::Windows.Win32.UI.Input.Ime.HIMC,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.BOOL> lpfn, winmdroot.Foundation.LPARAM lParam)
#cfunc ImmEnumInputContext "ImmEnumInputContext" int, int, intptr

; uint ImmEnumRegisterWordW(winmdroot.UI.Input.KeyboardAndMouse.HKL param0, delegate *unmanaged[Stdcall]<winmdroot.Foundation.PCWSTR,uint,winmdroot.Foundation.PCWSTR,void*,int> param1, winmdroot.Foundation.PCWSTR lpszReading, uint param3, winmdroot.Foundation.PCWSTR lpszRegister, void* param5)
#cfunc ImmEnumRegisterWordW "ImmEnumRegisterWordW" intptr, int, wstr, int, wstr, intptr

; winmdroot.Foundation.LRESULT ImmEscapeW(winmdroot.UI.Input.KeyboardAndMouse.HKL param0, winmdroot.UI.Input.Ime.HIMC param1, winmdroot.UI.Input.Ime.IME_ESCAPE param2, void* param3)
#cfunc ImmEscapeW "ImmEscapeW" intptr, intptr, int, intptr

; winmdroot.Foundation.BOOL ImmGenerateMessage(winmdroot.UI.Input.Ime.HIMC param0)
#cfunc ImmGenerateMessage "ImmGenerateMessage" intptr

; uint ImmGetCandidateListW(winmdroot.UI.Input.Ime.HIMC param0, uint deIndex, [Optional] winmdroot.UI.Input.Ime.CANDIDATELIST* lpCandList, uint dwBufLen)
#cfunc ImmGetCandidateListW "ImmGetCandidateListW" intptr, int, var, int

; uint ImmGetCandidateListCountW(winmdroot.UI.Input.Ime.HIMC param0, uint* lpdwListCount)
#cfunc ImmGetCandidateListCountW "ImmGetCandidateListCountW" intptr, var

; winmdroot.Foundation.BOOL ImmGetCandidateWindow(winmdroot.UI.Input.Ime.HIMC param0, uint param1, winmdroot.UI.Input.Ime.CANDIDATEFORM* lpCandidate)
#cfunc ImmGetCandidateWindow "ImmGetCandidateWindow" intptr, int, var

; winmdroot.Foundation.BOOL ImmGetCompositionFontW(winmdroot.UI.Input.Ime.HIMC param0, winmdroot.Graphics.Gdi.LOGFONTW* lplf)
#cfunc ImmGetCompositionFontW "ImmGetCompositionFontW" intptr, var

; int ImmGetCompositionStringW(winmdroot.UI.Input.Ime.HIMC param0, winmdroot.UI.Input.Ime.IME_COMPOSITION_STRING param1, [Optional] void* lpBuf, uint dwBufLen)
#cfunc ImmGetCompositionStringW "ImmGetCompositionStringW" intptr, int, intptr, int

; winmdroot.Foundation.BOOL ImmGetCompositionWindow(winmdroot.UI.Input.Ime.HIMC param0, winmdroot.UI.Input.Ime.COMPOSITIONFORM* lpCompForm)
#cfunc ImmGetCompositionWindow "ImmGetCompositionWindow" intptr, var

; winmdroot.UI.Input.Ime.HIMC ImmGetContext(winmdroot.Foundation.HWND param0)
#cfunc ImmGetContext "ImmGetContext" intptr

; uint ImmGetConversionListW(winmdroot.UI.Input.KeyboardAndMouse.HKL param0, winmdroot.UI.Input.Ime.HIMC param1, winmdroot.Foundation.PCWSTR lpSrc, winmdroot.UI.Input.Ime.CANDIDATELIST* lpDst, uint dwBufLen, winmdroot.UI.Input.Ime.GET_CONVERSION_LIST_FLAG uFlag)
#cfunc ImmGetConversionListW "ImmGetConversionListW" intptr, intptr, wstr, var, int, int

; winmdroot.Foundation.BOOL ImmGetConversionStatus(winmdroot.UI.Input.Ime.HIMC param0, [Optional] winmdroot.UI.Input.Ime.IME_CONVERSION_MODE* lpfdwConversion, [Optional] winmdroot.UI.Input.Ime.IME_SENTENCE_MODE* lpfdwSentence)
#cfunc ImmGetConversionStatus "ImmGetConversionStatus" intptr, var, var

; winmdroot.Foundation.HWND ImmGetDefaultIMEWnd(winmdroot.Foundation.HWND param0)
#cfunc ImmGetDefaultIMEWnd "ImmGetDefaultIMEWnd" intptr

; uint ImmGetDescriptionW(winmdroot.UI.Input.KeyboardAndMouse.HKL param0, winmdroot.Foundation.PWSTR lpszDescription, uint uBufLen)
#cfunc ImmGetDescriptionW "ImmGetDescriptionW" intptr, wstr, int

; uint ImmGetGuideLineW(winmdroot.UI.Input.Ime.HIMC param0, winmdroot.UI.Input.Ime.GET_GUIDE_LINE_TYPE dwIndex, winmdroot.Foundation.PWSTR lpBuf, uint dwBufLen)
#cfunc ImmGetGuideLineW "ImmGetGuideLineW" intptr, int, wstr, int

; winmdroot.Foundation.BOOL ImmGetHotKey(uint param0, uint* lpuModifiers, uint* lpuVKey, winmdroot.UI.Input.KeyboardAndMouse.HKL* phKL)
#cfunc ImmGetHotKey "ImmGetHotKey" int, var, var, intptr

; uint ImmGetIMCCLockCount(winmdroot.UI.Input.Ime.HIMCC param0)
#cfunc ImmGetIMCCLockCount "ImmGetIMCCLockCount" intptr

; uint ImmGetIMCCSize(winmdroot.UI.Input.Ime.HIMCC param0)
#cfunc ImmGetIMCCSize "ImmGetIMCCSize" intptr

; uint ImmGetIMCLockCount(winmdroot.UI.Input.Ime.HIMC param0)
#cfunc ImmGetIMCLockCount "ImmGetIMCLockCount" intptr

; uint ImmGetIMEFileNameW(winmdroot.UI.Input.KeyboardAndMouse.HKL param0, winmdroot.Foundation.PWSTR lpszFileName, uint uBufLen)
#cfunc ImmGetIMEFileNameW "ImmGetIMEFileNameW" intptr, wstr, int

; uint ImmGetImeMenuItemsW(winmdroot.UI.Input.Ime.HIMC param0, uint param1, uint param2, [Optional] winmdroot.UI.Input.Ime.IMEMENUITEMINFOW* lpImeParentMenu, [Optional] winmdroot.UI.Input.Ime.IMEMENUITEMINFOW* lpImeMenu, uint dwSize)
#cfunc ImmGetImeMenuItemsW "ImmGetImeMenuItemsW" intptr, int, int, var, var, int

; winmdroot.Foundation.BOOL ImmGetOpenStatus(winmdroot.UI.Input.Ime.HIMC param0)
#cfunc ImmGetOpenStatus "ImmGetOpenStatus" intptr

; uint ImmGetProperty(winmdroot.UI.Input.KeyboardAndMouse.HKL param0, uint param1)
#cfunc ImmGetProperty "ImmGetProperty" intptr, int

; uint ImmGetRegisterWordStyleW(winmdroot.UI.Input.KeyboardAndMouse.HKL param0, uint nItem, winmdroot.UI.Input.Ime.STYLEBUFW* lpStyleBuf)
#cfunc ImmGetRegisterWordStyleW "ImmGetRegisterWordStyleW" intptr, int, var

; winmdroot.Foundation.BOOL ImmGetStatusWindowPos(winmdroot.UI.Input.Ime.HIMC param0, global::System.Drawing.Point* lpptPos)
#cfunc ImmGetStatusWindowPos "ImmGetStatusWindowPos" intptr, var

; uint ImmGetVirtualKey(winmdroot.Foundation.HWND param0)
#cfunc ImmGetVirtualKey "ImmGetVirtualKey" intptr

; winmdroot.UI.Input.KeyboardAndMouse.HKL ImmInstallIMEA(winmdroot.Foundation.PCSTR lpszIMEFileName, winmdroot.Foundation.PCSTR lpszLayoutText)
#cfunc ImmInstallIMEA "ImmInstallIMEA" str, str

; winmdroot.UI.Input.KeyboardAndMouse.HKL ImmInstallIMEW(winmdroot.Foundation.PCWSTR lpszIMEFileName, winmdroot.Foundation.PCWSTR lpszLayoutText)
#cfunc ImmInstallIMEW "ImmInstallIMEW" wstr, wstr

; winmdroot.Foundation.BOOL ImmIsIME(winmdroot.UI.Input.KeyboardAndMouse.HKL param0)
#cfunc ImmIsIME "ImmIsIME" intptr

; winmdroot.Foundation.BOOL ImmIsUIMessageW(winmdroot.Foundation.HWND param0, uint param1, winmdroot.Foundation.WPARAM param2, winmdroot.Foundation.LPARAM param3)
#cfunc ImmIsUIMessageW "ImmIsUIMessageW" intptr, int, intptr, intptr

; winmdroot.UI.Input.Ime.INPUTCONTEXT* ImmLockIMC(winmdroot.UI.Input.Ime.HIMC param0)
#cfunc ImmLockIMC "ImmLockIMC" intptr

; void* ImmLockIMCC(winmdroot.UI.Input.Ime.HIMCC param0)
#cfunc ImmLockIMCC "ImmLockIMCC" intptr

; winmdroot.Foundation.BOOL ImmNotifyIME(winmdroot.UI.Input.Ime.HIMC param0, winmdroot.UI.Input.Ime.NOTIFY_IME_ACTION dwAction, winmdroot.UI.Input.Ime.NOTIFY_IME_INDEX dwIndex, uint dwValue)
#cfunc ImmNotifyIME "ImmNotifyIME" intptr, int, int, int

; winmdroot.UI.Input.Ime.HIMCC ImmReSizeIMCC(winmdroot.UI.Input.Ime.HIMCC param0, uint param1)
#cfunc ImmReSizeIMCC "ImmReSizeIMCC" intptr, int

; winmdroot.Foundation.BOOL ImmRegisterWordW(winmdroot.UI.Input.KeyboardAndMouse.HKL param0, winmdroot.Foundation.PCWSTR lpszReading, uint param2, winmdroot.Foundation.PCWSTR lpszRegister)
#cfunc ImmRegisterWordW "ImmRegisterWordW" intptr, wstr, int, wstr

; winmdroot.Foundation.BOOL ImmReleaseContext(winmdroot.Foundation.HWND param0, winmdroot.UI.Input.Ime.HIMC param1)
#cfunc ImmReleaseContext "ImmReleaseContext" intptr, intptr

; winmdroot.Foundation.LRESULT ImmRequestMessageW(winmdroot.UI.Input.Ime.HIMC param0, winmdroot.Foundation.WPARAM param1, winmdroot.Foundation.LPARAM param2)
#cfunc ImmRequestMessageW "ImmRequestMessageW" intptr, intptr, intptr

; winmdroot.Foundation.BOOL ImmSetCandidateWindow(winmdroot.UI.Input.Ime.HIMC param0, winmdroot.UI.Input.Ime.CANDIDATEFORM* lpCandidate)
#cfunc ImmSetCandidateWindow "ImmSetCandidateWindow" intptr, var

; winmdroot.Foundation.BOOL ImmSetCompositionFontW(winmdroot.UI.Input.Ime.HIMC param0, winmdroot.Graphics.Gdi.LOGFONTW* lplf)
#cfunc ImmSetCompositionFontW "ImmSetCompositionFontW" intptr, var

; winmdroot.Foundation.BOOL ImmSetCompositionStringW(winmdroot.UI.Input.Ime.HIMC param0, winmdroot.UI.Input.Ime.SET_COMPOSITION_STRING_TYPE dwIndex, [Optional] void* lpComp, uint dwCompLen, [Optional] void* lpRead, uint dwReadLen)
#cfunc ImmSetCompositionStringW "ImmSetCompositionStringW" intptr, int, intptr, int, intptr, int

; winmdroot.Foundation.BOOL ImmSetCompositionWindow(winmdroot.UI.Input.Ime.HIMC param0, winmdroot.UI.Input.Ime.COMPOSITIONFORM* lpCompForm)
#cfunc ImmSetCompositionWindow "ImmSetCompositionWindow" intptr, var

; winmdroot.Foundation.BOOL ImmSetConversionStatus(winmdroot.UI.Input.Ime.HIMC param0, winmdroot.UI.Input.Ime.IME_CONVERSION_MODE param1, winmdroot.UI.Input.Ime.IME_SENTENCE_MODE param2)
#cfunc ImmSetConversionStatus "ImmSetConversionStatus" intptr, int, int

; winmdroot.Foundation.BOOL ImmSetOpenStatus(winmdroot.UI.Input.Ime.HIMC param0, winmdroot.Foundation.BOOL param1)
#cfunc ImmSetOpenStatus "ImmSetOpenStatus" intptr, int

; winmdroot.Foundation.BOOL ImmSetStatusWindowPos(winmdroot.UI.Input.Ime.HIMC param0, global::System.Drawing.Point* lpptPos)
#cfunc ImmSetStatusWindowPos "ImmSetStatusWindowPos" intptr, var

; winmdroot.Foundation.BOOL ImmShowSoftKeyboard(winmdroot.Foundation.HWND param0, int param1)
#cfunc ImmShowSoftKeyboard "ImmShowSoftKeyboard" intptr, int

; winmdroot.Foundation.BOOL ImmSimulateHotKey(winmdroot.Foundation.HWND param0, winmdroot.UI.Input.Ime.IME_HOTKEY_IDENTIFIER param1)
#cfunc ImmSimulateHotKey "ImmSimulateHotKey" intptr, int

; winmdroot.Foundation.BOOL ImmUnlockIMC(winmdroot.UI.Input.Ime.HIMC param0)
#cfunc ImmUnlockIMC "ImmUnlockIMC" intptr

; winmdroot.Foundation.BOOL ImmUnlockIMCC(winmdroot.UI.Input.Ime.HIMCC param0)
#cfunc ImmUnlockIMCC "ImmUnlockIMCC" intptr

; winmdroot.Foundation.BOOL ImmUnregisterWordW(winmdroot.UI.Input.KeyboardAndMouse.HKL param0, winmdroot.Foundation.PCWSTR lpszReading, uint param2, winmdroot.Foundation.PCWSTR lpszUnregister)
#cfunc ImmUnregisterWordW "ImmUnregisterWordW" intptr, wstr, int, wstr

#endif
