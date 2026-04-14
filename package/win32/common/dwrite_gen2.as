; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    dwrite.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __dwrite_gen2_as__
#define global __dwrite_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "dwrite.dll"
; winmdroot.Foundation.HRESULT DWriteCreateFactory(winmdroot.Graphics.DirectWrite.DWRITE_FACTORY_TYPE factoryType, global::System.Guid* iid, void** factory)
#cfunc global DWriteCreateFactory "DWriteCreateFactory" int, var, var

#endif
