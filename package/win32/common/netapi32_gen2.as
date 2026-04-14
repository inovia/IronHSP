; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    netapi32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __netapi32_gen2_as__
#define __netapi32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "netapi32.dll"
; uint NetApiBufferFree([Optional] void* Buffer)
#cfunc NetApiBufferFree "NetApiBufferFree" intptr

; uint NetShareEnum(winmdroot.Foundation.PWSTR servername, uint level, byte** bufptr, uint prefmaxlen, uint* entriesread, uint* totalentries, [Optional] uint* resume_handle)
#cfunc NetShareEnum "NetShareEnum" wstr, int, var, int, var, var, var

; uint NetShareGetInfo(winmdroot.Foundation.PWSTR servername, winmdroot.Foundation.PWSTR netname, uint level, byte** bufptr)
#cfunc NetShareGetInfo "NetShareGetInfo" wstr, wstr, int, var

; uint NetUserGetInfo(winmdroot.Foundation.PCWSTR servername, winmdroot.Foundation.PCWSTR username, uint level, byte** bufptr)
#cfunc NetUserGetInfo "NetUserGetInfo" wstr, wstr, int, var

; uint NetWkstaGetInfo(winmdroot.Foundation.PWSTR servername, uint level, [Optional] byte** bufptr)
#cfunc NetWkstaGetInfo "NetWkstaGetInfo" wstr, int, var

#endif
