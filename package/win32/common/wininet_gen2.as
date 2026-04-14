; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    wininet.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __wininet_gen2_as__
#define __wininet_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "wininet.dll"
; void* HttpOpenRequest(void* hConnect, winmdroot.Foundation.PCWSTR lpszVerb, winmdroot.Foundation.PCWSTR lpszObjectName, winmdroot.Foundation.PCWSTR lpszVersion, winmdroot.Foundation.PCWSTR lpszReferrer, [Optional] winmdroot.Foundation.PCWSTR* lplpszAcceptTypes, uint dwFlags, nuint dwContext)
#cfunc HttpOpenRequestW "HttpOpenRequestW" intptr, wstr, wstr, wstr, wstr, var, int, int

; winmdroot.Foundation.BOOL HttpQueryInfo(void* hRequest, uint dwInfoLevel, [Optional] void* lpBuffer, uint* lpdwBufferLength, [Optional] uint* lpdwIndex)
#cfunc HttpQueryInfoW "HttpQueryInfoW" intptr, int, intptr, var, var

; winmdroot.Foundation.BOOL HttpSendRequest(void* hRequest, winmdroot.Foundation.PCWSTR lpszHeaders, uint dwHeadersLength, [Optional] void* lpOptional, uint dwOptionalLength)
#cfunc HttpSendRequestW "HttpSendRequestW" intptr, wstr, int, intptr, int

; winmdroot.Foundation.BOOL InternetCloseHandle(void* hInternet)
#cfunc InternetCloseHandle "InternetCloseHandle" intptr

; void* InternetConnect(void* hInternet, winmdroot.Foundation.PCWSTR lpszServerName, ushort nServerPort, winmdroot.Foundation.PCWSTR lpszUserName, winmdroot.Foundation.PCWSTR lpszPassword, uint dwService, uint dwFlags, nuint dwContext)
#cfunc InternetConnectW "InternetConnectW" intptr, wstr, int, wstr, wstr, int, int, int

; void* InternetOpen(winmdroot.Foundation.PCWSTR lpszAgent, uint dwAccessType, winmdroot.Foundation.PCWSTR lpszProxy, winmdroot.Foundation.PCWSTR lpszProxyBypass, uint dwFlags)
#cfunc InternetOpenW "InternetOpenW" wstr, int, wstr, wstr, int

; void* InternetOpenUrl(void* hInternet, winmdroot.Foundation.PCWSTR lpszUrl, winmdroot.Foundation.PCWSTR lpszHeaders, uint dwHeadersLength, uint dwFlags, nuint dwContext)
#cfunc InternetOpenUrlW "InternetOpenUrlW" intptr, wstr, wstr, int, int, int

; winmdroot.Foundation.BOOL InternetReadFile(void* hFile, void* lpBuffer, uint dwNumberOfBytesToRead, uint* lpdwNumberOfBytesRead)
#cfunc InternetReadFile "InternetReadFile" intptr, intptr, int, var

; winmdroot.Foundation.BOOL InternetSetOption([Optional] void* hInternet, uint dwOption, [Optional] void* lpBuffer, uint dwBufferLength)
#cfunc InternetSetOptionW "InternetSetOptionW" intptr, int, intptr, int

#endif
