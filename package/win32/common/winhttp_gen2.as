; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    winhttp.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __winhttp_gen2_as__
#define __winhttp_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "winhttp.dll"
; winmdroot.Foundation.BOOL WinHttpAddRequestHeaders(void* hRequest, winmdroot.Foundation.PCWSTR lpszHeaders, uint dwHeadersLength, uint dwModifiers)
#cfunc WinHttpAddRequestHeaders "WinHttpAddRequestHeaders" intptr, wstr, int, int

; winmdroot.Foundation.BOOL WinHttpCloseHandle(void* hInternet)
#cfunc WinHttpCloseHandle "WinHttpCloseHandle" intptr

; void* WinHttpConnect(void* hSession, winmdroot.Foundation.PCWSTR pswzServerName, ushort nServerPort, uint dwReserved)
#cfunc WinHttpConnect "WinHttpConnect" intptr, wstr, int, int

; void* WinHttpOpen(winmdroot.Foundation.PCWSTR pszAgentW, winmdroot.Networking.WinHttp.WINHTTP_ACCESS_TYPE dwAccessType, winmdroot.Foundation.PCWSTR pszProxyW, winmdroot.Foundation.PCWSTR pszProxyBypassW, uint dwFlags)
#cfunc WinHttpOpen "WinHttpOpen" wstr, int, wstr, wstr, int

; void* WinHttpOpenRequest(void* hConnect, winmdroot.Foundation.PCWSTR pwszVerb, winmdroot.Foundation.PCWSTR pwszObjectName, winmdroot.Foundation.PCWSTR pwszVersion, winmdroot.Foundation.PCWSTR pwszReferrer, winmdroot.Foundation.PCWSTR* ppwszAcceptTypes, winmdroot.Networking.WinHttp.WINHTTP_OPEN_REQUEST_FLAGS dwFlags)
#cfunc WinHttpOpenRequest "WinHttpOpenRequest" intptr, wstr, wstr, wstr, wstr, var, int

; winmdroot.Foundation.BOOL WinHttpQueryDataAvailable(void* hRequest, uint* lpdwNumberOfBytesAvailable)
#cfunc WinHttpQueryDataAvailable "WinHttpQueryDataAvailable" intptr, var

; winmdroot.Foundation.BOOL WinHttpQueryHeaders(void* hRequest, uint dwInfoLevel, winmdroot.Foundation.PCWSTR pwszName, [Optional] void* lpBuffer, uint* lpdwBufferLength, uint* lpdwIndex)
#cfunc WinHttpQueryHeaders "WinHttpQueryHeaders" intptr, int, wstr, intptr, var, var

; winmdroot.Foundation.BOOL WinHttpReadData(void* hRequest, void* lpBuffer, uint dwNumberOfBytesToRead, uint* lpdwNumberOfBytesRead)
#cfunc WinHttpReadData "WinHttpReadData" intptr, intptr, int, var

; winmdroot.Foundation.BOOL WinHttpReceiveResponse(void* hRequest, void* lpReserved)
#cfunc WinHttpReceiveResponse "WinHttpReceiveResponse" intptr, intptr

; winmdroot.Foundation.BOOL WinHttpSendRequest(void* hRequest, winmdroot.Foundation.PCWSTR lpszHeaders, uint dwHeadersLength, [Optional] void* lpOptional, uint dwOptionalLength, uint dwTotalLength, nuint dwContext)
#cfunc WinHttpSendRequest "WinHttpSendRequest" intptr, wstr, int, intptr, int, int, int

; winmdroot.Foundation.BOOL WinHttpSetOption([Optional] void* hInternet, uint dwOption, [Optional] void* lpBuffer, uint dwBufferLength)
#cfunc WinHttpSetOption "WinHttpSetOption" intptr, int, intptr, int

#endif
