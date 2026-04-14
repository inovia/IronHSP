; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    ole32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __ole32_gen2_as__
#define __ole32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "ole32.dll"
; winmdroot.Foundation.HRESULT CLSIDFromString(winmdroot.Foundation.PCWSTR lpsz, global::System.Guid* pclsid)
#cfunc CLSIDFromString "CLSIDFromString" wstr, var

; winmdroot.Foundation.HRESULT CoCreateInstance(global::System.Guid* rclsid, [Optional] winmdroot.System.Com.IUnknown* pUnkOuter, winmdroot.System.Com.CLSCTX dwClsContext, global::System.Guid* riid, void** ppv)
#cfunc CoCreateInstance "CoCreateInstance" var, var, int, var, var

; winmdroot.Foundation.HRESULT CoInitialize([Optional] void* pvReserved)
#cfunc CoInitialize "CoInitialize" intptr

; winmdroot.Foundation.HRESULT CoInitializeEx([Optional] void* pvReserved, uint dwCoInit)
#cfunc CoInitializeEx "CoInitializeEx" intptr, int

; void* CoTaskMemAlloc(nuint cb)
#cfunc CoTaskMemAlloc "CoTaskMemAlloc" int

; void CoTaskMemFree([Optional] void* pv)
#func CoTaskMemFree "CoTaskMemFree" intptr

; void CoUninitialize()
#func CoUninitialize "CoUninitialize"

; winmdroot.Foundation.HRESULT StringFromCLSID(global::System.Guid* rclsid, winmdroot.Foundation.PWSTR* lplpsz)
#cfunc StringFromCLSID "StringFromCLSID" var, var

#endif
