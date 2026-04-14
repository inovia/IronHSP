; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    psapi.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __psapi_gen2_as__
#define global __psapi_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "psapi.dll"
; winmdroot.Foundation.BOOL EmptyWorkingSet(winmdroot.Foundation.HANDLE hProcess)
#cfunc global EmptyWorkingSet "EmptyWorkingSet" intptr

; winmdroot.Foundation.BOOL EnumDeviceDrivers(void** lpImageBase, uint cb, uint* lpcbNeeded)
#cfunc global EnumDeviceDrivers "EnumDeviceDrivers" var, int, var

; winmdroot.Foundation.BOOL EnumPageFiles(delegate *unmanaged[Stdcall]<void*,winmdroot.System.ProcessStatus.ENUM_PAGE_FILE_INFORMATION*,winmdroot.Foundation.PCWSTR,global::Windows.Win32.Foundation.BOOL> pCallBackRoutine, void* pContext)
#cfunc global EnumPageFilesW "EnumPageFilesW" int, intptr

; winmdroot.Foundation.BOOL EnumProcessModules(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.HMODULE* lphModule, uint cb, uint* lpcbNeeded)
#cfunc global EnumProcessModules "EnumProcessModules" intptr, intptr, int, var

; winmdroot.Foundation.BOOL EnumProcessModulesEx(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.HMODULE* lphModule, uint cb, uint* lpcbNeeded, winmdroot.System.ProcessStatus.ENUM_PROCESS_MODULES_EX_FLAGS dwFilterFlag)
#cfunc global EnumProcessModulesEx "EnumProcessModulesEx" intptr, intptr, int, var, int

; winmdroot.Foundation.BOOL EnumProcesses(uint* lpidProcess, uint cb, uint* lpcbNeeded)
#cfunc global EnumProcesses "EnumProcesses" var, int, var

; uint GetDeviceDriverBaseName(void* ImageBase, winmdroot.Foundation.PWSTR lpBaseName, uint nSize)
#cfunc global GetDeviceDriverBaseNameW "GetDeviceDriverBaseNameW" intptr, wstr, int

; uint GetDeviceDriverFileName(void* ImageBase, winmdroot.Foundation.PWSTR lpFilename, uint nSize)
#cfunc global GetDeviceDriverFileNameW "GetDeviceDriverFileNameW" intptr, wstr, int

; uint GetMappedFileName(winmdroot.Foundation.HANDLE hProcess, void* lpv, winmdroot.Foundation.PWSTR lpFilename, uint nSize)
#cfunc global GetMappedFileNameW "GetMappedFileNameW" intptr, intptr, wstr, int

; uint GetModuleBaseName(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.PWSTR lpBaseName, uint nSize)
#cfunc global GetModuleBaseNameW "GetModuleBaseNameW" intptr, intptr, wstr, int

; uint GetModuleFileNameEx(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.PWSTR lpFilename, uint nSize)
#cfunc global GetModuleFileNameExW "GetModuleFileNameExW" intptr, intptr, wstr, int

; winmdroot.Foundation.BOOL GetModuleInformation(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.HMODULE hModule, winmdroot.System.ProcessStatus.MODULEINFO* lpmodinfo, uint cb)
#cfunc global GetModuleInformation "GetModuleInformation" intptr, intptr, var, int

; winmdroot.Foundation.BOOL GetPerformanceInfo(winmdroot.System.ProcessStatus.PERFORMANCE_INFORMATION* pPerformanceInformation, uint cb)
#cfunc global GetPerformanceInfo "GetPerformanceInfo" var, int

; uint GetProcessImageFileName(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.PWSTR lpImageFileName, uint nSize)
#cfunc global GetProcessImageFileNameW "GetProcessImageFileNameW" intptr, wstr, int

; winmdroot.Foundation.BOOL GetProcessMemoryInfo(winmdroot.Foundation.HANDLE Process, winmdroot.System.ProcessStatus.PROCESS_MEMORY_COUNTERS* ppsmemCounters, uint cb)
#cfunc global GetProcessMemoryInfo "GetProcessMemoryInfo" intptr, var, int

; winmdroot.Foundation.BOOL GetWsChanges(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.ProcessStatus.PSAPI_WS_WATCH_INFORMATION* lpWatchInfo, uint cb)
#cfunc global GetWsChanges "GetWsChanges" intptr, var, int

; winmdroot.Foundation.BOOL GetWsChangesEx(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.ProcessStatus.PSAPI_WS_WATCH_INFORMATION_EX* lpWatchInfoEx, uint* cb)
#cfunc global GetWsChangesEx "GetWsChangesEx" intptr, var, var

; winmdroot.Foundation.BOOL InitializeProcessForWsWatch(winmdroot.Foundation.HANDLE hProcess)
#cfunc global InitializeProcessForWsWatch "InitializeProcessForWsWatch" intptr

; winmdroot.Foundation.BOOL QueryWorkingSet(winmdroot.Foundation.HANDLE hProcess, void* pv, uint cb)
#cfunc global QueryWorkingSet "QueryWorkingSet" intptr, intptr, int

; winmdroot.Foundation.BOOL QueryWorkingSetEx(winmdroot.Foundation.HANDLE hProcess, void* pv, uint cb)
#cfunc global QueryWorkingSetEx "QueryWorkingSetEx" intptr, intptr, int

#endif
