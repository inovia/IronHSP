; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    advapi32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __advapi32_gen2_as__
#define __advapi32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "advapi32.dll"
; winmdroot.Foundation.WIN32_ERROR RegCloseKey(winmdroot.System.Registry.HKEY hKey)
#cfunc RegCloseKey "RegCloseKey" intptr

; winmdroot.Foundation.WIN32_ERROR RegCreateKeyExW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpSubKey, uint Reserved, winmdroot.Foundation.PWSTR lpClass, winmdroot.System.Registry.REG_OPEN_CREATE_OPTIONS dwOptions, winmdroot.System.Registry.REG_SAM_FLAGS samDesired, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes, winmdroot.System.Registry.HKEY* phkResult, [Optional] winmdroot.System.Registry.REG_CREATE_KEY_DISPOSITION* lpdwDisposition)
#cfunc RegCreateKeyExW "RegCreateKeyExW" intptr, wstr, int, wstr, int, int, var, intptr, var

; winmdroot.Foundation.WIN32_ERROR RegDeleteKeyW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpSubKey)
#cfunc RegDeleteKeyW "RegDeleteKeyW" intptr, wstr

; winmdroot.Foundation.WIN32_ERROR RegDeleteValueW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpValueName)
#cfunc RegDeleteValueW "RegDeleteValueW" intptr, wstr

; winmdroot.Foundation.WIN32_ERROR RegEnumKeyExW(winmdroot.System.Registry.HKEY hKey, uint dwIndex, winmdroot.Foundation.PWSTR lpName, uint* lpcchName, [Optional] uint* lpReserved, winmdroot.Foundation.PWSTR lpClass, [Optional] uint* lpcchClass, [Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* lpftLastWriteTime)
#cfunc RegEnumKeyExW "RegEnumKeyExW" intptr, int, wstr, var, var, wstr, var, var

; winmdroot.Foundation.WIN32_ERROR RegEnumValueW(winmdroot.System.Registry.HKEY hKey, uint dwIndex, winmdroot.Foundation.PWSTR lpValueName, uint* lpcchValueName, [Optional] uint* lpReserved, [Optional] uint* lpType, [Optional] byte* lpData, [Optional] uint* lpcbData)
#cfunc RegEnumValueW "RegEnumValueW" intptr, int, wstr, var, var, var, var, var

; winmdroot.Foundation.WIN32_ERROR RegOpenKeyExW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpSubKey, uint ulOptions, winmdroot.System.Registry.REG_SAM_FLAGS samDesired, winmdroot.System.Registry.HKEY* phkResult)
#cfunc RegOpenKeyExW "RegOpenKeyExW" intptr, wstr, int, int, intptr

; winmdroot.Foundation.WIN32_ERROR RegQueryInfoKeyW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PWSTR lpClass, [Optional] uint* lpcchClass, [Optional] uint* lpReserved, [Optional] uint* lpcSubKeys, [Optional] uint* lpcbMaxSubKeyLen, [Optional] uint* lpcbMaxClassLen, [Optional] uint* lpcValues, [Optional] uint* lpcbMaxValueNameLen, [Optional] uint* lpcbMaxValueLen, [Optional] uint* lpcbSecurityDescriptor, [Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* lpftLastWriteTime)
#cfunc RegQueryInfoKeyW "RegQueryInfoKeyW" intptr, wstr, var, var, var, var, var, var, var, var, var, var

; winmdroot.Foundation.WIN32_ERROR RegQueryValueExW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpValueName, [Optional] uint* lpReserved, [Optional] winmdroot.System.Registry.REG_VALUE_TYPE* lpType, [Optional] byte* lpData, [Optional] uint* lpcbData)
#cfunc RegQueryValueExW "RegQueryValueExW" intptr, wstr, var, var, var, var

; winmdroot.Foundation.WIN32_ERROR RegSetValueExW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpValueName, uint Reserved, winmdroot.System.Registry.REG_VALUE_TYPE dwType, [Optional] byte* lpData, uint cbData)
#cfunc RegSetValueExW "RegSetValueExW" intptr, wstr, int, int, var, int

#endif
