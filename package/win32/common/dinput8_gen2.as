; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    dinput8.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __dinput8_gen2_as__
#define __dinput8_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "dinput8.dll"
; winmdroot.Foundation.HRESULT DirectInput8Create(winmdroot.Foundation.HINSTANCE hinst, uint dwVersion, global::System.Guid* riidltf, void** ppvOut, winmdroot.System.Com.IUnknown* punkOuter)
#cfunc DirectInput8Create "DirectInput8Create" intptr, int, var, var, var

#endif
