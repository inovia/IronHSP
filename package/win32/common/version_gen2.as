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

; uint GetFileVersionInfoSize(winmdroot.Foundation.PCWSTR lptstrFilename, [Optional] uint* lpdwHandle)
#cfunc GetFileVersionInfoSizeW "GetFileVersionInfoSizeW" wstr, var

; winmdroot.Foundation.BOOL VerQueryValueW(void* pBlock, winmdroot.Foundation.PCWSTR lpSubBlock, void** lplpBuffer, uint* puLen)
#cfunc VerQueryValueW "VerQueryValueW" intptr, wstr, var, var

#endif
