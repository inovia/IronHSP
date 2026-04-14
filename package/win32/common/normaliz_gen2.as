; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    normaliz.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __normaliz_gen2_as__
#define global __normaliz_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "normaliz.dll"
; int IdnToAscii(uint dwFlags, winmdroot.Foundation.PCWSTR lpUnicodeCharStr, int cchUnicodeChar, winmdroot.Foundation.PWSTR lpASCIICharStr, int cchASCIIChar)
#cfunc global IdnToAscii "IdnToAscii" int, wstr, int, wstr, int

; int IdnToUnicode(uint dwFlags, winmdroot.Foundation.PCWSTR lpASCIICharStr, int cchASCIIChar, winmdroot.Foundation.PWSTR lpUnicodeCharStr, int cchUnicodeChar)
#cfunc global IdnToUnicode "IdnToUnicode" int, wstr, int, wstr, int

#endif
