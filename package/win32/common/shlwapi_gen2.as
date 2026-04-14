; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    shlwapi.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __shlwapi_gen2_as__
#define global __shlwapi_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "shlwapi.dll"
; winmdroot.Foundation.PWSTR StrChrW(winmdroot.Foundation.PCWSTR pszStart, char wMatch)
#cfunc global StrChrW "StrChrW" wstr, int

; winmdroot.Foundation.PSTR StrChrIA(winmdroot.Foundation.PCSTR pszStart, ushort wMatch)
#cfunc global StrChrIA "StrChrIA" str, int

; winmdroot.Foundation.PWSTR StrChrIW(winmdroot.Foundation.PCWSTR pszStart, char wMatch)
#cfunc global StrChrIW "StrChrIW" wstr, int

; int StrCmpNA(winmdroot.Foundation.PCSTR psz1, winmdroot.Foundation.PCSTR psz2, int nChar)
#cfunc global StrCmpNA "StrCmpNA" str, str, int

; int StrCmpNIA(winmdroot.Foundation.PCSTR psz1, winmdroot.Foundation.PCSTR psz2, int nChar)
#cfunc global StrCmpNIA "StrCmpNIA" str, str, int

; int StrCmpNIW(winmdroot.Foundation.PCWSTR psz1, winmdroot.Foundation.PCWSTR psz2, int nChar)
#cfunc global StrCmpNIW "StrCmpNIW" wstr, wstr, int

; int StrCmpNW(winmdroot.Foundation.PCWSTR psz1, winmdroot.Foundation.PCWSTR psz2, int nChar)
#cfunc global StrCmpNW "StrCmpNW" wstr, wstr, int

; winmdroot.Foundation.PWSTR StrRChrW(winmdroot.Foundation.PCWSTR pszStart, winmdroot.Foundation.PCWSTR pszEnd, char wMatch)
#cfunc global StrRChrW "StrRChrW" wstr, wstr, int

; winmdroot.Foundation.PSTR StrRChrIA(winmdroot.Foundation.PCSTR pszStart, winmdroot.Foundation.PCSTR pszEnd, ushort wMatch)
#cfunc global StrRChrIA "StrRChrIA" str, str, int

; winmdroot.Foundation.PWSTR StrRChrIW(winmdroot.Foundation.PCWSTR pszStart, winmdroot.Foundation.PCWSTR pszEnd, char wMatch)
#cfunc global StrRChrIW "StrRChrIW" wstr, wstr, int

; winmdroot.Foundation.PSTR StrRStrIA(winmdroot.Foundation.PCSTR pszSource, winmdroot.Foundation.PCSTR pszLast, winmdroot.Foundation.PCSTR pszSrch)
#cfunc global StrRStrIA "StrRStrIA" str, str, str

; winmdroot.Foundation.PWSTR StrRStrIW(winmdroot.Foundation.PCWSTR pszSource, winmdroot.Foundation.PCWSTR pszLast, winmdroot.Foundation.PCWSTR pszSrch)
#cfunc global StrRStrIW "StrRStrIW" wstr, wstr, wstr

; winmdroot.Foundation.PWSTR StrStrW(winmdroot.Foundation.PCWSTR pszFirst, winmdroot.Foundation.PCWSTR pszSrch)
#cfunc global StrStrW "StrStrW" wstr, wstr

; winmdroot.Foundation.PSTR StrStrIA(winmdroot.Foundation.PCSTR pszFirst, winmdroot.Foundation.PCSTR pszSrch)
#cfunc global StrStrIA "StrStrIA" str, str

; winmdroot.Foundation.PWSTR StrStrIW(winmdroot.Foundation.PCWSTR pszFirst, winmdroot.Foundation.PCWSTR pszSrch)
#cfunc global StrStrIW "StrStrIW" wstr, wstr

#endif
