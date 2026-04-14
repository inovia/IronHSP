; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    propsys.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __propsys_gen2_as__
#define global __propsys_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "propsys.dll"
; winmdroot.Foundation.HRESULT PropVariantChangeType(winmdroot.System.Com.StructuredStorage.PROPVARIANT* ppropvarDest, winmdroot.System.Com.StructuredStorage.PROPVARIANT* propvarSrc, winmdroot.System.Com.StructuredStorage.PROPVAR_CHANGE_FLAGS flags, winmdroot.System.Variant.VARENUM vt)
#cfunc global PropVariantChangeType "PropVariantChangeType" var, var, int, int

#endif
