; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    ncrypt.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __ncrypt_gen2_as__
#define __ncrypt_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "ncrypt.dll"
; winmdroot.Foundation.HRESULT NCryptFreeObject(winmdroot.Security.Cryptography.NCRYPT_HANDLE hObject)
#cfunc NCryptFreeObject "NCryptFreeObject" int

#endif
