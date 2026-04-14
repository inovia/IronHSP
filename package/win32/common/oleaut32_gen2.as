; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    oleaut32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __oleaut32_gen2_as__
#define __oleaut32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "oleaut32.dll"
; void SysFreeString(winmdroot.Foundation.BSTR bstrString)
#func SysFreeString "SysFreeString" int

; winmdroot.Foundation.BSTR SysAllocString(winmdroot.Foundation.PCWSTR psz)
#cfunc SysAllocString "SysAllocString" wstr

; uint SysStringLen(winmdroot.Foundation.BSTR pbstr)
#cfunc SysStringLen "SysStringLen" int

#endif
