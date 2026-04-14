; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    dxgi.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __dxgi_gen2_as__
#define __dxgi_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "dxgi.dll"
; winmdroot.Foundation.HRESULT CreateDXGIFactory(global::System.Guid* riid, void** ppFactory)
#cfunc CreateDXGIFactory "CreateDXGIFactory" var, var

; winmdroot.Foundation.HRESULT CreateDXGIFactory1(global::System.Guid* riid, void** ppFactory)
#cfunc CreateDXGIFactory1 "CreateDXGIFactory1" var, var

; winmdroot.Foundation.HRESULT CreateDXGIFactory2(winmdroot.Graphics.Dxgi.DXGI_CREATE_FACTORY_FLAGS Flags, global::System.Guid* riid, void** ppFactory)
#cfunc CreateDXGIFactory2 "CreateDXGIFactory2" int, var, var

; winmdroot.Foundation.HRESULT DXGIDeclareAdapterRemovalSupport()
#cfunc DXGIDeclareAdapterRemovalSupport "DXGIDeclareAdapterRemovalSupport"

; winmdroot.Foundation.HRESULT DXGIGetDebugInterface1(uint Flags, global::System.Guid* riid, void** pDebug)
#cfunc DXGIGetDebugInterface1 "DXGIGetDebugInterface1" int, var, var

#endif
