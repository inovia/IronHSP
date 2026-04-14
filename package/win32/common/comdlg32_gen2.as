; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    comdlg32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __comdlg32_gen2_as__
#define global __comdlg32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "comdlg32.dll"
; winmdroot.UI.Controls.Dialogs.COMMON_DLG_ERRORS CommDlgExtendedError()
#cfunc global CommDlgExtendedError "CommDlgExtendedError"

; short GetFileTitleW(winmdroot.Foundation.PCWSTR param0, winmdroot.Foundation.PWSTR Buf, ushort cchSize)
#cfunc global GetFileTitleW "GetFileTitleW" wstr, wstr, int

#endif
