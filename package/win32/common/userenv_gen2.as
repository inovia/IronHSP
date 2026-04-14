; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    userenv.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __userenv_gen2_as__
#define __userenv_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "userenv.dll"
; winmdroot.Foundation.BOOL CreateEnvironmentBlock(void** lpEnvironment, winmdroot.Foundation.HANDLE hToken, winmdroot.Foundation.BOOL bInherit)
#cfunc CreateEnvironmentBlock "CreateEnvironmentBlock" var, intptr, int

; winmdroot.Foundation.BOOL DestroyEnvironmentBlock(void* lpEnvironment)
#cfunc DestroyEnvironmentBlock "DestroyEnvironmentBlock" intptr

; winmdroot.Foundation.BOOL ExpandEnvironmentStringsForUser(winmdroot.Foundation.HANDLE hToken, winmdroot.Foundation.PCWSTR lpSrc, winmdroot.Foundation.PWSTR lpDest, uint dwSize)
#cfunc ExpandEnvironmentStringsForUserW "ExpandEnvironmentStringsForUserW" intptr, wstr, wstr, int

; winmdroot.Foundation.BOOL GetUserProfileDirectory(winmdroot.Foundation.HANDLE hToken, winmdroot.Foundation.PWSTR lpProfileDir, uint* lpcchSize)
#cfunc GetUserProfileDirectoryW "GetUserProfileDirectoryW" intptr, wstr, var

#endif
