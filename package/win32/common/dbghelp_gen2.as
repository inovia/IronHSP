; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    dbghelp.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __dbghelp_gen2_as__
#define __dbghelp_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "dbghelp.dll"
; winmdroot.Foundation.BOOL StackWalk64(uint MachineType, winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.HANDLE hThread, winmdroot.System.Diagnostics.Debug.STACKFRAME64* StackFrame, void* ContextRecord, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HANDLE,ulong,void*,uint,uint*,global::Windows.Win32.Foundation.BOOL> ReadMemoryRoutine, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HANDLE,ulong,void*> FunctionTableAccessRoutine, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HANDLE,ulong,ulong> GetModuleBaseRoutine, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HANDLE,global::Windows.Win32.Foundation.HANDLE,winmdroot.System.Diagnostics.Debug.ADDRESS64*,ulong> TranslateAddress)
#cfunc StackWalk64 "StackWalk64" int, intptr, intptr, var, intptr, int, int, int, int

; winmdroot.Foundation.BOOL SymCleanup(winmdroot.Foundation.HANDLE hProcess)
#cfunc SymCleanup "SymCleanup" intptr

; winmdroot.Foundation.BOOL SymFromAddr(winmdroot.Foundation.HANDLE hProcess, ulong Address, [Optional] ulong* Displacement, winmdroot.System.Diagnostics.Debug.SYMBOL_INFO* Symbol)
#cfunc SymFromAddr "SymFromAddr" intptr, int64, var, var

; winmdroot.Foundation.BOOL SymGetLineFromAddr64(winmdroot.Foundation.HANDLE hProcess, ulong qwAddr, uint* pdwDisplacement, winmdroot.System.Diagnostics.Debug.IMAGEHLP_LINE64* Line64)
#cfunc SymGetLineFromAddr64 "SymGetLineFromAddr64" intptr, int64, var, var

; winmdroot.Foundation.BOOL SymInitialize(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.PCSTR UserSearchPath, winmdroot.Foundation.BOOL fInvadeProcess)
#cfunc SymInitialize "SymInitialize" intptr, str, int

#endif
