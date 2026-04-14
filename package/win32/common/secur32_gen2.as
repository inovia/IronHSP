; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    secur32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __secur32_gen2_as__
#define global __secur32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "secur32.dll"
; winmdroot.Foundation.BOOLEAN GetComputerObjectName(winmdroot.Security.Authentication.Identity.EXTENDED_NAME_FORMAT NameFormat, winmdroot.Foundation.PWSTR lpNameBuffer, uint* nSize)
#cfunc global GetComputerObjectNameW "GetComputerObjectNameW" int, wstr, var

; winmdroot.Foundation.BOOLEAN TranslateName(winmdroot.Foundation.PCWSTR lpAccountName, winmdroot.Security.Authentication.Identity.EXTENDED_NAME_FORMAT AccountNameFormat, winmdroot.Security.Authentication.Identity.EXTENDED_NAME_FORMAT DesiredNameFormat, winmdroot.Foundation.PWSTR lpTranslatedName, uint* nSize)
#cfunc global TranslateNameW "TranslateNameW" wstr, int, int, wstr, var

#endif
