; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    psapi.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __psapi_gen2_as__
#define __psapi_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "psapi.dll"
; winmdroot.Foundation.BOOL EnumProcesses(uint* lpidProcess, uint cb, uint* lpcbNeeded)
#cfunc EnumProcesses "EnumProcesses" var, int, var

; winmdroot.Foundation.BOOL EnumProcessModules(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.HMODULE* lphModule, uint cb, uint* lpcbNeeded)
#cfunc EnumProcessModules "EnumProcessModules" intptr, intptr, int, var

; uint GetModuleBaseName(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.PWSTR lpBaseName, uint nSize)
#cfunc GetModuleBaseNameW "GetModuleBaseNameW" intptr, intptr, wstr, int

; uint GetModuleFileNameEx(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.PWSTR lpFilename, uint nSize)
#cfunc GetModuleFileNameExW "GetModuleFileNameExW" intptr, intptr, wstr, int

; uint GetProcessImageFileName(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.PWSTR lpImageFileName, uint nSize)
#cfunc GetProcessImageFileNameW "GetProcessImageFileNameW" intptr, wstr, int

; winmdroot.Foundation.BOOL GetProcessMemoryInfo(winmdroot.Foundation.HANDLE Process, winmdroot.System.ProcessStatus.PROCESS_MEMORY_COUNTERS* ppsmemCounters, uint cb)
#cfunc GetProcessMemoryInfo "GetProcessMemoryInfo" intptr, var, int

#endif
