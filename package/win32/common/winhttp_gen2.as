; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    winhttp.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __winhttp_gen2_as__
#define global __winhttp_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "winhttp.dll"
; winmdroot.Foundation.BOOL WinHttpAddRequestHeaders(void* hRequest, winmdroot.Foundation.PCWSTR lpszHeaders, uint dwHeadersLength, uint dwModifiers)
#cfunc global WinHttpAddRequestHeaders "WinHttpAddRequestHeaders" intptr, wstr, int, int

; uint WinHttpAddRequestHeadersEx(void* hRequest, uint dwModifiers, ulong ullFlags, ulong ullExtra, uint cHeaders, winmdroot.Networking.WinHttp.WINHTTP_EXTENDED_HEADER* pHeaders)
#cfunc global WinHttpAddRequestHeadersEx "WinHttpAddRequestHeadersEx" intptr, int, int64, int64, int, var

; winmdroot.Foundation.BOOL WinHttpCheckPlatform()
#cfunc global WinHttpCheckPlatform "WinHttpCheckPlatform"

; winmdroot.Foundation.BOOL WinHttpCloseHandle(void* hInternet)
#cfunc global WinHttpCloseHandle "WinHttpCloseHandle" intptr

; void* WinHttpConnect(void* hSession, winmdroot.Foundation.PCWSTR pswzServerName, ushort nServerPort, uint dwReserved)
#cfunc global WinHttpConnect "WinHttpConnect" intptr, wstr, int, int

; winmdroot.Foundation.BOOL WinHttpCrackUrl(winmdroot.Foundation.PCWSTR pwszUrl, uint dwUrlLength, uint dwFlags, winmdroot.Networking.WinHttp.URL_COMPONENTS* lpUrlComponents)
#cfunc global WinHttpCrackUrl "WinHttpCrackUrl" wstr, int, int, var

; uint WinHttpCreateProxyResolver(void* hSession, void** phResolver)
#cfunc global WinHttpCreateProxyResolver "WinHttpCreateProxyResolver" intptr, var

; winmdroot.Foundation.BOOL WinHttpCreateUrl(winmdroot.Networking.WinHttp.URL_COMPONENTS* lpUrlComponents, winmdroot.Networking.WinHttp.WIN_HTTP_CREATE_URL_FLAGS dwFlags, winmdroot.Foundation.PWSTR pwszUrl, uint* pdwUrlLength)
#cfunc global WinHttpCreateUrl "WinHttpCreateUrl" var, int, wstr, var

; winmdroot.Foundation.BOOL WinHttpDetectAutoProxyConfigUrl(uint dwAutoDetectFlags, winmdroot.Foundation.PWSTR* ppwstrAutoConfigUrl)
#cfunc global WinHttpDetectAutoProxyConfigUrl "WinHttpDetectAutoProxyConfigUrl" int, var

; void WinHttpFreeProxyResult(winmdroot.Networking.WinHttp.WINHTTP_PROXY_RESULT* pProxyResult)
#func global WinHttpFreeProxyResult "WinHttpFreeProxyResult" var

; void WinHttpFreeProxyResultEx(winmdroot.Networking.WinHttp.WINHTTP_PROXY_RESULT_EX* pProxyResultEx)
#func global WinHttpFreeProxyResultEx "WinHttpFreeProxyResultEx" var

; void WinHttpFreeProxySettings(winmdroot.Networking.WinHttp.WINHTTP_PROXY_SETTINGS* pWinHttpProxySettings)
#func global WinHttpFreeProxySettings "WinHttpFreeProxySettings" var

; winmdroot.Foundation.BOOL WinHttpGetDefaultProxyConfiguration(winmdroot.Networking.WinHttp.WINHTTP_PROXY_INFO* pProxyInfo)
#cfunc global WinHttpGetDefaultProxyConfiguration "WinHttpGetDefaultProxyConfiguration" var

; winmdroot.Foundation.BOOL WinHttpGetIEProxyConfigForCurrentUser(winmdroot.Networking.WinHttp.WINHTTP_CURRENT_USER_IE_PROXY_CONFIG* pProxyConfig)
#cfunc global WinHttpGetIEProxyConfigForCurrentUser "WinHttpGetIEProxyConfigForCurrentUser" var

; winmdroot.Foundation.BOOL WinHttpGetProxyForUrl(void* hSession, winmdroot.Foundation.PCWSTR lpcwszUrl, winmdroot.Networking.WinHttp.WINHTTP_AUTOPROXY_OPTIONS* pAutoProxyOptions, winmdroot.Networking.WinHttp.WINHTTP_PROXY_INFO* pProxyInfo)
#cfunc global WinHttpGetProxyForUrl "WinHttpGetProxyForUrl" intptr, wstr, var, var

; uint WinHttpGetProxyForUrlEx(void* hResolver, winmdroot.Foundation.PCWSTR pcwszUrl, winmdroot.Networking.WinHttp.WINHTTP_AUTOPROXY_OPTIONS* pAutoProxyOptions, nuint pContext)
#cfunc global WinHttpGetProxyForUrlEx "WinHttpGetProxyForUrlEx" intptr, wstr, var, int

; uint WinHttpGetProxyForUrlEx2(void* hResolver, winmdroot.Foundation.PCWSTR pcwszUrl, winmdroot.Networking.WinHttp.WINHTTP_AUTOPROXY_OPTIONS* pAutoProxyOptions, uint cbInterfaceSelectionContext, [Optional] byte* pInterfaceSelectionContext, nuint pContext)
#cfunc global WinHttpGetProxyForUrlEx2 "WinHttpGetProxyForUrlEx2" intptr, wstr, var, int, var, int

; uint WinHttpGetProxyResult(void* hResolver, winmdroot.Networking.WinHttp.WINHTTP_PROXY_RESULT* pProxyResult)
#cfunc global WinHttpGetProxyResult "WinHttpGetProxyResult" intptr, var

; uint WinHttpGetProxyResultEx(void* hResolver, winmdroot.Networking.WinHttp.WINHTTP_PROXY_RESULT_EX* pProxyResultEx)
#cfunc global WinHttpGetProxyResultEx "WinHttpGetProxyResultEx" intptr, var

; uint WinHttpGetProxySettingsVersion(void* hSession, uint* pdwProxySettingsVersion)
#cfunc global WinHttpGetProxySettingsVersion "WinHttpGetProxySettingsVersion" intptr, var

; void* WinHttpOpen(winmdroot.Foundation.PCWSTR pszAgentW, winmdroot.Networking.WinHttp.WINHTTP_ACCESS_TYPE dwAccessType, winmdroot.Foundation.PCWSTR pszProxyW, winmdroot.Foundation.PCWSTR pszProxyBypassW, uint dwFlags)
#cfunc global WinHttpOpen "WinHttpOpen" wstr, int, wstr, wstr, int

; void* WinHttpOpenRequest(void* hConnect, winmdroot.Foundation.PCWSTR pwszVerb, winmdroot.Foundation.PCWSTR pwszObjectName, winmdroot.Foundation.PCWSTR pwszVersion, winmdroot.Foundation.PCWSTR pwszReferrer, winmdroot.Foundation.PCWSTR* ppwszAcceptTypes, winmdroot.Networking.WinHttp.WINHTTP_OPEN_REQUEST_FLAGS dwFlags)
#cfunc global WinHttpOpenRequest "WinHttpOpenRequest" intptr, wstr, wstr, wstr, wstr, var, int

; winmdroot.Foundation.BOOL WinHttpQueryAuthSchemes(void* hRequest, uint* lpdwSupportedSchemes, uint* lpdwFirstScheme, uint* pdwAuthTarget)
#cfunc global WinHttpQueryAuthSchemes "WinHttpQueryAuthSchemes" intptr, var, var, var

; winmdroot.Foundation.BOOL WinHttpQueryDataAvailable(void* hRequest, uint* lpdwNumberOfBytesAvailable)
#cfunc global WinHttpQueryDataAvailable "WinHttpQueryDataAvailable" intptr, var

; winmdroot.Foundation.BOOL WinHttpQueryHeaders(void* hRequest, uint dwInfoLevel, winmdroot.Foundation.PCWSTR pwszName, [Optional] void* lpBuffer, uint* lpdwBufferLength, uint* lpdwIndex)
#cfunc global WinHttpQueryHeaders "WinHttpQueryHeaders" intptr, int, wstr, intptr, var, var

; winmdroot.Foundation.BOOL WinHttpQueryOption(void* hInternet, uint dwOption, [Optional] void* lpBuffer, uint* lpdwBufferLength)
#cfunc global WinHttpQueryOption "WinHttpQueryOption" intptr, int, intptr, var

; winmdroot.Foundation.BOOL WinHttpReadData(void* hRequest, void* lpBuffer, uint dwNumberOfBytesToRead, uint* lpdwNumberOfBytesRead)
#cfunc global WinHttpReadData "WinHttpReadData" intptr, intptr, int, var

; uint WinHttpReadProxySettings(void* hSession, winmdroot.Foundation.PCWSTR pcwszConnectionName, winmdroot.Foundation.BOOL fFallBackToDefaultSettings, winmdroot.Foundation.BOOL fSetAutoDiscoverForDefaultSettings, uint* pdwSettingsVersion, winmdroot.Foundation.BOOL* pfDefaultSettingsAreReturned, winmdroot.Networking.WinHttp.WINHTTP_PROXY_SETTINGS* pWinHttpProxySettings)
#cfunc global WinHttpReadProxySettings "WinHttpReadProxySettings" intptr, wstr, int, int, var, var, var

; winmdroot.Foundation.BOOL WinHttpReceiveResponse(void* hRequest, void* lpReserved)
#cfunc global WinHttpReceiveResponse "WinHttpReceiveResponse" intptr, intptr

; uint WinHttpResetAutoProxy(void* hSession, uint dwFlags)
#cfunc global WinHttpResetAutoProxy "WinHttpResetAutoProxy" intptr, int

; winmdroot.Foundation.BOOL WinHttpSendRequest(void* hRequest, winmdroot.Foundation.PCWSTR lpszHeaders, uint dwHeadersLength, [Optional] void* lpOptional, uint dwOptionalLength, uint dwTotalLength, nuint dwContext)
#cfunc global WinHttpSendRequest "WinHttpSendRequest" intptr, wstr, int, intptr, int, int, int

; winmdroot.Foundation.BOOL WinHttpSetCredentials(void* hRequest, uint AuthTargets, uint AuthScheme, winmdroot.Foundation.PCWSTR pwszUserName, winmdroot.Foundation.PCWSTR pwszPassword, void* pAuthParams)
#cfunc global WinHttpSetCredentials "WinHttpSetCredentials" intptr, int, int, wstr, wstr, intptr

; winmdroot.Foundation.BOOL WinHttpSetDefaultProxyConfiguration(winmdroot.Networking.WinHttp.WINHTTP_PROXY_INFO* pProxyInfo)
#cfunc global WinHttpSetDefaultProxyConfiguration "WinHttpSetDefaultProxyConfiguration" var

; winmdroot.Foundation.BOOL WinHttpSetOption([Optional] void* hInternet, uint dwOption, [Optional] void* lpBuffer, uint dwBufferLength)
#cfunc global WinHttpSetOption "WinHttpSetOption" intptr, int, intptr, int

; uint WinHttpSetProxySettingsPerUser(winmdroot.Foundation.BOOL fProxySettingsPerUser)
#cfunc global WinHttpSetProxySettingsPerUser "WinHttpSetProxySettingsPerUser" int

; winmdroot.Foundation.BOOL WinHttpSetTimeouts(void* hInternet, int nResolveTimeout, int nConnectTimeout, int nSendTimeout, int nReceiveTimeout)
#cfunc global WinHttpSetTimeouts "WinHttpSetTimeouts" intptr, int, int, int, int

; winmdroot.Foundation.BOOL WinHttpTimeFromSystemTime(winmdroot.Foundation.SYSTEMTIME* pst, winmdroot.Foundation.PWSTR pwszTime)
#cfunc global WinHttpTimeFromSystemTime "WinHttpTimeFromSystemTime" var, wstr

; winmdroot.Foundation.BOOL WinHttpTimeToSystemTime(winmdroot.Foundation.PCWSTR pwszTime, winmdroot.Foundation.SYSTEMTIME* pst)
#cfunc global WinHttpTimeToSystemTime "WinHttpTimeToSystemTime" wstr, var

; uint WinHttpWebSocketClose(void* hWebSocket, ushort usStatus, [Optional] void* pvReason, uint dwReasonLength)
#cfunc global WinHttpWebSocketClose "WinHttpWebSocketClose" intptr, int, intptr, int

; void* WinHttpWebSocketCompleteUpgrade(void* hRequest, nuint pContext)
#cfunc global WinHttpWebSocketCompleteUpgrade "WinHttpWebSocketCompleteUpgrade" intptr, int

; uint WinHttpWebSocketQueryCloseStatus(void* hWebSocket, ushort* pusStatus, [Optional] void* pvReason, uint dwReasonLength, uint* pdwReasonLengthConsumed)
#cfunc global WinHttpWebSocketQueryCloseStatus "WinHttpWebSocketQueryCloseStatus" intptr, var, intptr, int, var

; uint WinHttpWebSocketReceive(void* hWebSocket, void* pvBuffer, uint dwBufferLength, uint* pdwBytesRead, winmdroot.Networking.WinHttp.WINHTTP_WEB_SOCKET_BUFFER_TYPE* peBufferType)
#cfunc global WinHttpWebSocketReceive "WinHttpWebSocketReceive" intptr, intptr, int, var, var

; uint WinHttpWebSocketSend(void* hWebSocket, winmdroot.Networking.WinHttp.WINHTTP_WEB_SOCKET_BUFFER_TYPE eBufferType, [Optional] void* pvBuffer, uint dwBufferLength)
#cfunc global WinHttpWebSocketSend "WinHttpWebSocketSend" intptr, int, intptr, int

; uint WinHttpWebSocketShutdown(void* hWebSocket, ushort usStatus, [Optional] void* pvReason, uint dwReasonLength)
#cfunc global WinHttpWebSocketShutdown "WinHttpWebSocketShutdown" intptr, int, intptr, int

; winmdroot.Foundation.BOOL WinHttpWriteData(void* hRequest, [Optional] void* lpBuffer, uint dwNumberOfBytesToWrite, uint* lpdwNumberOfBytesWritten)
#cfunc global WinHttpWriteData "WinHttpWriteData" intptr, intptr, int, var

; uint WinHttpWriteProxySettings(void* hSession, winmdroot.Foundation.BOOL fForceUpdate, winmdroot.Networking.WinHttp.WINHTTP_PROXY_SETTINGS* pWinHttpProxySettings)
#cfunc global WinHttpWriteProxySettings "WinHttpWriteProxySettings" intptr, int, var

#endif
