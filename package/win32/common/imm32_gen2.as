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

; int ImmGetCompositionStringW(winmdroot.UI.Input.Ime.HIMC param0, winmdroot.UI.Input.Ime.IME_COMPOSITION_STRING param1, [Optional] void* lpBuf, uint dwBufLen)
#cfunc ImmGetCompositionStringW "ImmGetCompositionStringW" intptr, int, intptr, int

; winmdroot.UI.Input.Ime.HIMC ImmGetContext(winmdroot.Foundation.HWND param0)
#cfunc ImmGetContext "ImmGetContext" intptr

; winmdroot.Foundation.HWND ImmGetDefaultIMEWnd(winmdroot.Foundation.HWND param0)
#cfunc ImmGetDefaultIMEWnd "ImmGetDefaultIMEWnd" intptr

; winmdroot.Foundation.BOOL ImmIsIME(winmdroot.UI.Input.KeyboardAndMouse.HKL param0)
#cfunc ImmIsIME "ImmIsIME" intptr

; winmdroot.Foundation.BOOL ImmReleaseContext(winmdroot.Foundation.HWND param0, winmdroot.UI.Input.Ime.HIMC param1)
#cfunc ImmReleaseContext "ImmReleaseContext" intptr, intptr

; winmdroot.Foundation.BOOL ImmSetCandidateWindow(winmdroot.UI.Input.Ime.HIMC param0, winmdroot.UI.Input.Ime.CANDIDATEFORM* lpCandidate)
#cfunc ImmSetCandidateWindow "ImmSetCandidateWindow" intptr, var

; winmdroot.Foundation.BOOL ImmSetCompositionWindow(winmdroot.UI.Input.Ime.HIMC param0, winmdroot.UI.Input.Ime.COMPOSITIONFORM* lpCompForm)
#cfunc ImmSetCompositionWindow "ImmSetCompositionWindow" intptr, var

#endif
