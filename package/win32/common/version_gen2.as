; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    version.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __version_gen2_as__
#define __version_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "version.dll"
; winmdroot.Foundation.BOOL GetFileVersionInfo(winmdroot.Foundation.PCWSTR lptstrFilename, uint dwHandle, uint dwLen, void* lpData)
#cfunc GetFileVersionInfoW "GetFileVersionInfoW" wstr, int, int, intptr

; winmdroot.Foundation.BOOL GetFileVersionInfoEx(winmdroot.Storage.FileSystem.GET_FILE_VERSION_INFO_FLAGS dwFlags, winmdroot.Foundation.PCWSTR lpwstrFilename, uint dwHandle, uint dwLen, void* lpData)
#cfunc GetFileVersionInfoExW "GetFileVersionInfoExW" int, wstr, int, int, intptr

; uint GetFileVersionInfoSize(winmdroot.Foundation.PCWSTR lptstrFilename, [Optional] uint* lpdwHandle)
#cfunc GetFileVersionInfoSizeW "GetFileVersionInfoSizeW" wstr, var

; uint GetFileVersionInfoSizeEx(winmdroot.Storage.FileSystem.GET_FILE_VERSION_INFO_FLAGS dwFlags, winmdroot.Foundation.PCWSTR lpwstrFilename, uint* lpdwHandle)
#cfunc GetFileVersionInfoSizeExW "GetFileVersionInfoSizeExW" int, wstr, var

; winmdroot.Storage.FileSystem.VER_FIND_FILE_STATUS VerFindFileW(winmdroot.Storage.FileSystem.VER_FIND_FILE_FLAGS uFlags, winmdroot.Foundation.PCWSTR szFileName, winmdroot.Foundation.PCWSTR szWinDir, winmdroot.Foundation.PCWSTR szAppDir, winmdroot.Foundation.PWSTR szCurDir, uint* puCurDirLen, winmdroot.Foundation.PWSTR szDestDir, uint* puDestDirLen)
#cfunc VerFindFileW "VerFindFileW" int, wstr, wstr, wstr, wstr, var, wstr, var

; winmdroot.Storage.FileSystem.VER_INSTALL_FILE_STATUS VerInstallFileW(winmdroot.Storage.FileSystem.VER_INSTALL_FILE_FLAGS uFlags, winmdroot.Foundation.PCWSTR szSrcFileName, winmdroot.Foundation.PCWSTR szDestFileName, winmdroot.Foundation.PCWSTR szSrcDir, winmdroot.Foundation.PCWSTR szDestDir, winmdroot.Foundation.PCWSTR szCurDir, winmdroot.Foundation.PWSTR szTmpFile, uint* puTmpFileLen)
#cfunc VerInstallFileW "VerInstallFileW" int, wstr, wstr, wstr, wstr, wstr, wstr, var

; winmdroot.Foundation.BOOL VerQueryValueW(void* pBlock, winmdroot.Foundation.PCWSTR lpSubBlock, void** lplpBuffer, uint* puLen)
#cfunc VerQueryValueW "VerQueryValueW" intptr, wstr, var, var

#endif
