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
; uint AppCacheCheckManifest(winmdroot.Foundation.PCWSTR pwszMasterUrl, winmdroot.Foundation.PCWSTR pwszManifestUrl, byte* pbManifestData, uint dwManifestDataSize, byte* pbManifestResponseHeaders, uint dwManifestResponseHeadersSize, winmdroot.Networking.WinInet.APP_CACHE_STATE* peState, void** phNewAppCache)
#cfunc AppCacheCheckManifest "AppCacheCheckManifest" wstr, wstr, var, int, var, int, var, var

; void AppCacheCloseHandle(void* hAppCache)
#func AppCacheCloseHandle "AppCacheCloseHandle" intptr

; uint AppCacheCreateAndCommitFile(void* hAppCache, winmdroot.Foundation.PCWSTR pwszSourceFilePath, winmdroot.Foundation.PCWSTR pwszUrl, byte* pbResponseHeaders, uint dwResponseHeadersSize)
#cfunc AppCacheCreateAndCommitFile "AppCacheCreateAndCommitFile" intptr, wstr, wstr, var, int

; uint AppCacheDeleteGroup(winmdroot.Foundation.PCWSTR pwszManifestUrl)
#cfunc AppCacheDeleteGroup "AppCacheDeleteGroup" wstr

; uint AppCacheDeleteIEGroup(winmdroot.Foundation.PCWSTR pwszManifestUrl)
#cfunc AppCacheDeleteIEGroup "AppCacheDeleteIEGroup" wstr

; uint AppCacheDuplicateHandle(void* hAppCache, void** phDuplicatedAppCache)
#cfunc AppCacheDuplicateHandle "AppCacheDuplicateHandle" intptr, var

; uint AppCacheFinalize(void* hAppCache, byte* pbManifestData, uint dwManifestDataSize, winmdroot.Networking.WinInet.APP_CACHE_FINALIZE_STATE* peState)
#cfunc AppCacheFinalize "AppCacheFinalize" intptr, var, int, var

; void AppCacheFreeDownloadList(winmdroot.Networking.WinInet.APP_CACHE_DOWNLOAD_LIST* pDownloadList)
#func AppCacheFreeDownloadList "AppCacheFreeDownloadList" var

; void AppCacheFreeGroupList(winmdroot.Networking.WinInet.APP_CACHE_GROUP_LIST* pAppCacheGroupList)
#func AppCacheFreeGroupList "AppCacheFreeGroupList" var

; uint AppCacheFreeIESpace(global::System.Runtime.InteropServices.ComTypes.FILETIME ftCutOff)
#cfunc AppCacheFreeIESpace "AppCacheFreeIESpace" int

; uint AppCacheFreeSpace(global::System.Runtime.InteropServices.ComTypes.FILETIME ftCutOff)
#cfunc AppCacheFreeSpace "AppCacheFreeSpace" int

; uint AppCacheGetDownloadList(void* hAppCache, winmdroot.Networking.WinInet.APP_CACHE_DOWNLOAD_LIST* pDownloadList)
#cfunc AppCacheGetDownloadList "AppCacheGetDownloadList" intptr, var

; uint AppCacheGetFallbackUrl(void* hAppCache, winmdroot.Foundation.PCWSTR pwszUrl, winmdroot.Foundation.PWSTR* ppwszFallbackUrl)
#cfunc AppCacheGetFallbackUrl "AppCacheGetFallbackUrl" intptr, wstr, var

; uint AppCacheGetGroupList(winmdroot.Networking.WinInet.APP_CACHE_GROUP_LIST* pAppCacheGroupList)
#cfunc AppCacheGetGroupList "AppCacheGetGroupList" var

; uint AppCacheGetIEGroupList(winmdroot.Networking.WinInet.APP_CACHE_GROUP_LIST* pAppCacheGroupList)
#cfunc AppCacheGetIEGroupList "AppCacheGetIEGroupList" var

; uint AppCacheGetInfo(void* hAppCache, winmdroot.Networking.WinInet.APP_CACHE_GROUP_INFO* pAppCacheInfo)
#cfunc AppCacheGetInfo "AppCacheGetInfo" intptr, var

; uint AppCacheGetManifestUrl(void* hAppCache, winmdroot.Foundation.PWSTR* ppwszManifestUrl)
#cfunc AppCacheGetManifestUrl "AppCacheGetManifestUrl" intptr, var

; uint AppCacheLookup(winmdroot.Foundation.PCWSTR pwszUrl, uint dwFlags, void** phAppCache)
#cfunc AppCacheLookup "AppCacheLookup" wstr, int, var

; winmdroot.Foundation.BOOL CommitUrlCacheEntry(winmdroot.Foundation.PCWSTR lpszUrlName, winmdroot.Foundation.PCWSTR lpszLocalFileName, global::System.Runtime.InteropServices.ComTypes.FILETIME ExpireTime, global::System.Runtime.InteropServices.ComTypes.FILETIME LastModifiedTime, uint CacheEntryType, winmdroot.Foundation.PWSTR lpszHeaderInfo, uint cchHeaderInfo, winmdroot.Foundation.PCWSTR lpszFileExtension, winmdroot.Foundation.PCWSTR lpszOriginalUrl)
#cfunc CommitUrlCacheEntryW "CommitUrlCacheEntryW" wstr, wstr, int, int, int, wstr, int, wstr, wstr

; uint CommitUrlCacheEntryBinaryBlob(winmdroot.Foundation.PCWSTR pwszUrlName, uint dwType, global::System.Runtime.InteropServices.ComTypes.FILETIME ftExpireTime, global::System.Runtime.InteropServices.ComTypes.FILETIME ftModifiedTime, [Optional] byte* pbBlob, uint cbBlob)
#cfunc CommitUrlCacheEntryBinaryBlob "CommitUrlCacheEntryBinaryBlob" wstr, int, int, int, var, int

; winmdroot.Foundation.BOOL CreateMD5SSOHash(winmdroot.Foundation.PWSTR pszChallengeInfo, winmdroot.Foundation.PWSTR pwszRealm, winmdroot.Foundation.PWSTR pwszTarget, byte* pbHexHash)
#cfunc CreateMD5SSOHash "CreateMD5SSOHash" wstr, wstr, wstr, var

; winmdroot.Foundation.BOOL CreateUrlCacheContainer(winmdroot.Foundation.PCWSTR Name, winmdroot.Foundation.PCWSTR lpCachePrefix, winmdroot.Foundation.PCWSTR lpszCachePath, uint KBCacheLimit, uint dwContainerType, uint dwOptions, [Optional] void* pvBuffer, [Optional] uint* cbBuffer)
#cfunc CreateUrlCacheContainerW "CreateUrlCacheContainerW" wstr, wstr, wstr, int, int, int, intptr, var

; winmdroot.Foundation.BOOL CreateUrlCacheEntry(winmdroot.Foundation.PCWSTR lpszUrlName, uint dwExpectedFileSize, winmdroot.Foundation.PCWSTR lpszFileExtension, winmdroot.Foundation.PWSTR lpszFileName, uint dwReserved)
#cfunc CreateUrlCacheEntryW "CreateUrlCacheEntryW" wstr, int, wstr, wstr, int

; winmdroot.Foundation.BOOL CreateUrlCacheEntryExW(winmdroot.Foundation.PCWSTR lpszUrlName, uint dwExpectedFileSize, winmdroot.Foundation.PCWSTR lpszFileExtension, winmdroot.Foundation.PWSTR lpszFileName, uint dwReserved, winmdroot.Foundation.BOOL fPreserveIncomingFileName)
#cfunc CreateUrlCacheEntryExW "CreateUrlCacheEntryExW" wstr, int, wstr, wstr, int, int

; long CreateUrlCacheGroup(uint dwFlags, [Optional] void* lpReserved)
#cfunc CreateUrlCacheGroup "CreateUrlCacheGroup" int, intptr

; uint DeleteIE3Cache(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.HINSTANCE hinst, winmdroot.Foundation.PSTR lpszCmd, int nCmdShow)
#cfunc DeleteIE3Cache "DeleteIE3Cache" intptr, intptr, str, int

; winmdroot.Foundation.BOOL DeleteUrlCacheContainer(winmdroot.Foundation.PCWSTR Name, uint dwOptions)
#cfunc DeleteUrlCacheContainerW "DeleteUrlCacheContainerW" wstr, int

; winmdroot.Foundation.BOOL DeleteUrlCacheEntry(winmdroot.Foundation.PCSTR lpszUrlName)
#cfunc DeleteUrlCacheEntry "DeleteUrlCacheEntry" str

; winmdroot.Foundation.BOOL DeleteUrlCacheGroup(long GroupId, uint dwFlags, [Optional] void* lpReserved)
#cfunc DeleteUrlCacheGroup "DeleteUrlCacheGroup" int64, int, intptr

; winmdroot.Foundation.BOOL DeleteWpadCacheForNetworks(winmdroot.Networking.WinInet.WPAD_CACHE_DELETE param0)
#cfunc DeleteWpadCacheForNetworks "DeleteWpadCacheForNetworks" int

; winmdroot.Foundation.BOOL DetectAutoProxyUrl(winmdroot.Foundation.PSTR pszAutoProxyUrl, uint cchAutoProxyUrl, winmdroot.Networking.WinInet.PROXY_AUTO_DETECT_TYPE dwDetectFlags)
#cfunc DetectAutoProxyUrl "DetectAutoProxyUrl" str, int, int

; winmdroot.Foundation.BOOL FindCloseUrlCache(winmdroot.Foundation.HANDLE hEnumHandle)
#cfunc FindCloseUrlCache "FindCloseUrlCache" intptr

; winmdroot.Foundation.HANDLE FindFirstUrlCacheContainerW(uint* pdwModified, winmdroot.Networking.WinInet.INTERNET_CACHE_CONTAINER_INFOW* lpContainerInfo, uint* lpcbContainerInfo, uint dwOptions)
#cfunc FindFirstUrlCacheContainerW "FindFirstUrlCacheContainerW" var, var, var, int

; winmdroot.Foundation.HANDLE FindFirstUrlCacheEntry(winmdroot.Foundation.PCWSTR lpszUrlSearchPattern, [Optional] winmdroot.Networking.WinInet.INTERNET_CACHE_ENTRY_INFOW* lpFirstCacheEntryInfo, uint* lpcbCacheEntryInfo)
#cfunc FindFirstUrlCacheEntryW "FindFirstUrlCacheEntryW" wstr, var, var

; winmdroot.Foundation.HANDLE FindFirstUrlCacheEntryEx(winmdroot.Foundation.PCWSTR lpszUrlSearchPattern, uint dwFlags, uint dwFilter, long GroupId, [Optional] winmdroot.Networking.WinInet.INTERNET_CACHE_ENTRY_INFOW* lpFirstCacheEntryInfo, uint* lpcbCacheEntryInfo, [Optional] void* lpGroupAttributes, [Optional] uint* lpcbGroupAttributes, [Optional] void* lpReserved)
#cfunc FindFirstUrlCacheEntryExW "FindFirstUrlCacheEntryExW" wstr, int, int, int64, var, var, intptr, var, intptr

; winmdroot.Foundation.HANDLE FindFirstUrlCacheGroup(uint dwFlags, uint dwFilter, [Optional] void* lpSearchCondition, uint dwSearchCondition, long* lpGroupId, [Optional] void* lpReserved)
#cfunc FindFirstUrlCacheGroup "FindFirstUrlCacheGroup" int, int, intptr, int, var, intptr

; winmdroot.Foundation.BOOL FindNextUrlCacheContainerW(winmdroot.Foundation.HANDLE hEnumHandle, winmdroot.Networking.WinInet.INTERNET_CACHE_CONTAINER_INFOW* lpContainerInfo, uint* lpcbContainerInfo)
#cfunc FindNextUrlCacheContainerW "FindNextUrlCacheContainerW" intptr, var, var

; winmdroot.Foundation.BOOL FindNextUrlCacheEntry(winmdroot.Foundation.HANDLE hEnumHandle, [Optional] winmdroot.Networking.WinInet.INTERNET_CACHE_ENTRY_INFOW* lpNextCacheEntryInfo, uint* lpcbCacheEntryInfo)
#cfunc FindNextUrlCacheEntryW "FindNextUrlCacheEntryW" intptr, var, var

; winmdroot.Foundation.BOOL FindNextUrlCacheEntryEx(winmdroot.Foundation.HANDLE hEnumHandle, [Optional] winmdroot.Networking.WinInet.INTERNET_CACHE_ENTRY_INFOW* lpNextCacheEntryInfo, uint* lpcbCacheEntryInfo, [Optional] void* lpGroupAttributes, [Optional] uint* lpcbGroupAttributes, [Optional] void* lpReserved)
#cfunc FindNextUrlCacheEntryExW "FindNextUrlCacheEntryExW" intptr, var, var, intptr, var, intptr

; winmdroot.Foundation.BOOL FindNextUrlCacheGroup(winmdroot.Foundation.HANDLE hFind, long* lpGroupId, [Optional] void* lpReserved)
#cfunc FindNextUrlCacheGroup "FindNextUrlCacheGroup" intptr, var, intptr

; winmdroot.Foundation.BOOL FreeUrlCacheSpace(winmdroot.Foundation.PCWSTR lpszCachePath, uint dwSize, uint dwFilter)
#cfunc FreeUrlCacheSpaceW "FreeUrlCacheSpaceW" wstr, int, int

; winmdroot.Foundation.BOOL FtpCommand(void* hConnect, winmdroot.Foundation.BOOL fExpectResponse, winmdroot.Networking.WinInet.FTP_FLAGS dwFlags, winmdroot.Foundation.PCWSTR lpszCommand, nuint dwContext, [Optional] void** phFtpCommand)
#cfunc FtpCommandW "FtpCommandW" intptr, int, int, wstr, int, var

; winmdroot.Foundation.BOOL FtpCreateDirectory(void* hConnect, winmdroot.Foundation.PCWSTR lpszDirectory)
#cfunc FtpCreateDirectoryW "FtpCreateDirectoryW" intptr, wstr

; winmdroot.Foundation.BOOL FtpDeleteFile(void* hConnect, winmdroot.Foundation.PCWSTR lpszFileName)
#cfunc FtpDeleteFileW "FtpDeleteFileW" intptr, wstr

; void* FtpFindFirstFile(void* hConnect, winmdroot.Foundation.PCWSTR lpszSearchFile, [Optional] winmdroot.Storage.FileSystem.WIN32_FIND_DATAW* lpFindFileData, uint dwFlags, nuint dwContext)
#cfunc FtpFindFirstFileW "FtpFindFirstFileW" intptr, wstr, var, int, int

; winmdroot.Foundation.BOOL FtpGetCurrentDirectory(void* hConnect, winmdroot.Foundation.PWSTR lpszCurrentDirectory, uint* lpdwCurrentDirectory)
#cfunc FtpGetCurrentDirectoryW "FtpGetCurrentDirectoryW" intptr, wstr, var

; winmdroot.Foundation.BOOL FtpGetFile(void* hConnect, winmdroot.Foundation.PCWSTR lpszRemoteFile, winmdroot.Foundation.PCWSTR lpszNewFile, winmdroot.Foundation.BOOL fFailIfExists, uint dwFlagsAndAttributes, uint dwFlags, nuint dwContext)
#cfunc FtpGetFileW "FtpGetFileW" intptr, wstr, wstr, int, int, int, int

; winmdroot.Foundation.BOOL FtpGetFileEx(void* hFtpSession, winmdroot.Foundation.PCSTR lpszRemoteFile, winmdroot.Foundation.PCWSTR lpszNewFile, winmdroot.Foundation.BOOL fFailIfExists, uint dwFlagsAndAttributes, uint dwFlags, nuint dwContext)
#cfunc FtpGetFileEx "FtpGetFileEx" intptr, str, wstr, int, int, int, int

; uint FtpGetFileSize(void* hFile, [Optional] uint* lpdwFileSizeHigh)
#cfunc FtpGetFileSize "FtpGetFileSize" intptr, var

; void* FtpOpenFile(void* hConnect, winmdroot.Foundation.PCWSTR lpszFileName, uint dwAccess, winmdroot.Networking.WinInet.FTP_FLAGS dwFlags, nuint dwContext)
#cfunc FtpOpenFileW "FtpOpenFileW" intptr, wstr, int, int, int

; winmdroot.Foundation.BOOL FtpPutFile(void* hConnect, winmdroot.Foundation.PCWSTR lpszLocalFile, winmdroot.Foundation.PCWSTR lpszNewRemoteFile, winmdroot.Networking.WinInet.FTP_FLAGS dwFlags, nuint dwContext)
#cfunc FtpPutFileW "FtpPutFileW" intptr, wstr, wstr, int, int

; winmdroot.Foundation.BOOL FtpPutFileEx(void* hFtpSession, winmdroot.Foundation.PCWSTR lpszLocalFile, winmdroot.Foundation.PCSTR lpszNewRemoteFile, uint dwFlags, nuint dwContext)
#cfunc FtpPutFileEx "FtpPutFileEx" intptr, wstr, str, int, int

; winmdroot.Foundation.BOOL FtpRemoveDirectory(void* hConnect, winmdroot.Foundation.PCWSTR lpszDirectory)
#cfunc FtpRemoveDirectoryW "FtpRemoveDirectoryW" intptr, wstr

; winmdroot.Foundation.BOOL FtpRenameFile(void* hConnect, winmdroot.Foundation.PCWSTR lpszExisting, winmdroot.Foundation.PCWSTR lpszNew)
#cfunc FtpRenameFileW "FtpRenameFileW" intptr, wstr, wstr

; winmdroot.Foundation.BOOL FtpSetCurrentDirectory(void* hConnect, winmdroot.Foundation.PCWSTR lpszDirectory)
#cfunc FtpSetCurrentDirectoryW "FtpSetCurrentDirectoryW" intptr, wstr

; winmdroot.Foundation.BOOL GetUrlCacheConfigInfo(winmdroot.Networking.WinInet.INTERNET_CACHE_CONFIG_INFOW* lpCacheConfigInfo, [Optional] uint* lpcbCacheConfigInfo, winmdroot.Networking.WinInet.CACHE_CONFIG dwFieldControl)
#cfunc GetUrlCacheConfigInfoW "GetUrlCacheConfigInfoW" var, var, int

; uint GetUrlCacheEntryBinaryBlob(winmdroot.Foundation.PCWSTR pwszUrlName, uint* dwType, global::System.Runtime.InteropServices.ComTypes.FILETIME* pftExpireTime, global::System.Runtime.InteropServices.ComTypes.FILETIME* pftAccessTime, global::System.Runtime.InteropServices.ComTypes.FILETIME* pftModifiedTime, byte** ppbBlob, uint* pcbBlob)
#cfunc GetUrlCacheEntryBinaryBlob "GetUrlCacheEntryBinaryBlob" wstr, var, var, var, var, var, var

; winmdroot.Foundation.BOOL GetUrlCacheEntryInfo(winmdroot.Foundation.PCWSTR lpszUrlName, [Optional] winmdroot.Networking.WinInet.INTERNET_CACHE_ENTRY_INFOW* lpCacheEntryInfo, [Optional] uint* lpcbCacheEntryInfo)
#cfunc GetUrlCacheEntryInfoW "GetUrlCacheEntryInfoW" wstr, var, var

; winmdroot.Foundation.BOOL GetUrlCacheEntryInfoEx(winmdroot.Foundation.PCWSTR lpszUrl, [Optional] winmdroot.Networking.WinInet.INTERNET_CACHE_ENTRY_INFOW* lpCacheEntryInfo, [Optional] uint* lpcbCacheEntryInfo, winmdroot.Foundation.PWSTR lpszRedirectUrl, [Optional] uint* lpcbRedirectUrl, [Optional] void* lpReserved, uint dwFlags)
#cfunc GetUrlCacheEntryInfoExW "GetUrlCacheEntryInfoExW" wstr, var, var, wstr, var, intptr, int

; winmdroot.Foundation.BOOL GetUrlCacheGroupAttribute(long gid, uint dwFlags, uint dwAttributes, winmdroot.Networking.WinInet.INTERNET_CACHE_GROUP_INFOW* lpGroupInfo, uint* lpcbGroupInfo, [Optional] void* lpReserved)
#cfunc GetUrlCacheGroupAttributeW "GetUrlCacheGroupAttributeW" int64, int, int, var, var, intptr

; winmdroot.Foundation.BOOL GetUrlCacheHeaderData(uint nIdx, uint* lpdwData)
#cfunc GetUrlCacheHeaderData "GetUrlCacheHeaderData" int, var

; winmdroot.Foundation.BOOL GopherCreateLocator(winmdroot.Foundation.PCWSTR lpszHost, ushort nServerPort, winmdroot.Foundation.PCWSTR lpszDisplayString, winmdroot.Foundation.PCWSTR lpszSelectorString, uint dwGopherType, winmdroot.Foundation.PWSTR lpszLocator, uint* lpdwBufferLength)
#cfunc GopherCreateLocatorW "GopherCreateLocatorW" wstr, int, wstr, wstr, int, wstr, var

; void* GopherFindFirstFile(void* hConnect, winmdroot.Foundation.PCWSTR lpszLocator, winmdroot.Foundation.PCWSTR lpszSearchString, [Optional] winmdroot.Networking.WinInet.GOPHER_FIND_DATAW* lpFindData, uint dwFlags, nuint dwContext)
#cfunc GopherFindFirstFileW "GopherFindFirstFileW" intptr, wstr, wstr, var, int, int

; winmdroot.Foundation.BOOL GopherGetAttribute(void* hConnect, winmdroot.Foundation.PCWSTR lpszLocator, winmdroot.Foundation.PCWSTR lpszAttributeName, byte* lpBuffer, uint dwBufferLength, uint* lpdwCharactersReturned, delegate *unmanaged[Stdcall]<global::Windows.Win32.Networking.WinInet.GOPHER_ATTRIBUTE_TYPE*,uint,global::Windows.Win32.Foundation.BOOL> lpfnEnumerator, nuint dwContext)
#cfunc GopherGetAttributeW "GopherGetAttributeW" intptr, wstr, wstr, var, int, var, int, int

; winmdroot.Foundation.BOOL GopherGetLocatorType(winmdroot.Foundation.PCWSTR lpszLocator, uint* lpdwGopherType)
#cfunc GopherGetLocatorTypeW "GopherGetLocatorTypeW" wstr, var

; void* GopherOpenFile(void* hConnect, winmdroot.Foundation.PCWSTR lpszLocator, winmdroot.Foundation.PCWSTR lpszView, uint dwFlags, nuint dwContext)
#cfunc GopherOpenFileW "GopherOpenFileW" intptr, wstr, wstr, int, int

; winmdroot.Foundation.BOOL HttpAddRequestHeaders(void* hRequest, winmdroot.Foundation.PCWSTR lpszHeaders, uint dwHeadersLength, winmdroot.Networking.WinInet.HTTP_ADDREQ_FLAG dwModifiers)
#cfunc HttpAddRequestHeadersW "HttpAddRequestHeadersW" intptr, wstr, int, int

; winmdroot.Foundation.BOOL HttpCheckDavComplianceW(winmdroot.Foundation.PCWSTR lpszUrl, winmdroot.Foundation.PCWSTR lpszComplianceToken, winmdroot.Foundation.BOOL* lpfFound, winmdroot.Foundation.HWND hWnd, void* lpvReserved)
#cfunc HttpCheckDavComplianceW "HttpCheckDavComplianceW" wstr, wstr, var, intptr, intptr

; void HttpCloseDependencyHandle(void* hDependencyHandle)
#func HttpCloseDependencyHandle "HttpCloseDependencyHandle" intptr

; uint HttpDuplicateDependencyHandle(void* hDependencyHandle, void** phDuplicatedDependencyHandle)
#cfunc HttpDuplicateDependencyHandle "HttpDuplicateDependencyHandle" intptr, var

; winmdroot.Foundation.BOOL HttpEndRequest(void* hRequest, [Optional] winmdroot.Networking.WinInet.INTERNET_BUFFERSW* lpBuffersOut, uint dwFlags, nuint dwContext)
#cfunc HttpEndRequestW "HttpEndRequestW" intptr, var, int, int

; uint HttpGetServerCredentials(winmdroot.Foundation.PWSTR pwszUrl, winmdroot.Foundation.PWSTR* ppwszUserName, winmdroot.Foundation.PWSTR* ppwszPassword)
#cfunc HttpGetServerCredentials "HttpGetServerCredentials" wstr, var, var

; uint HttpIndicatePageLoadComplete(void* hDependencyHandle)
#cfunc HttpIndicatePageLoadComplete "HttpIndicatePageLoadComplete" intptr

; uint HttpIsHostHstsEnabled(winmdroot.Foundation.PCWSTR pcwszUrl, winmdroot.Foundation.BOOL* pfIsHsts)
#cfunc HttpIsHostHstsEnabled "HttpIsHostHstsEnabled" wstr, var

; uint HttpOpenDependencyHandle(void* hRequestHandle, winmdroot.Foundation.BOOL fBackground, void** phDependencyHandle)
#cfunc HttpOpenDependencyHandle "HttpOpenDependencyHandle" intptr, int, var

; void* HttpOpenRequest(void* hConnect, winmdroot.Foundation.PCWSTR lpszVerb, winmdroot.Foundation.PCWSTR lpszObjectName, winmdroot.Foundation.PCWSTR lpszVersion, winmdroot.Foundation.PCWSTR lpszReferrer, [Optional] winmdroot.Foundation.PCWSTR* lplpszAcceptTypes, uint dwFlags, nuint dwContext)
#cfunc HttpOpenRequestW "HttpOpenRequestW" intptr, wstr, wstr, wstr, wstr, var, int, int

; void HttpPushClose(winmdroot.Networking.WinInet.HTTP_PUSH_WAIT_HANDLE hWait)
#func HttpPushClose "HttpPushClose" intptr

; uint HttpPushEnable(void* hRequest, winmdroot.Networking.WinInet.HTTP_PUSH_TRANSPORT_SETTING* pTransportSetting, winmdroot.Networking.WinInet.HTTP_PUSH_WAIT_HANDLE* phWait)
#cfunc HttpPushEnable "HttpPushEnable" intptr, var, intptr

; uint HttpPushWait(winmdroot.Networking.WinInet.HTTP_PUSH_WAIT_HANDLE hWait, winmdroot.Networking.WinInet.HTTP_PUSH_WAIT_TYPE eType, [Optional] winmdroot.Networking.WinInet.HTTP_PUSH_NOTIFICATION_STATUS* pNotificationStatus)
#cfunc HttpPushWait "HttpPushWait" intptr, int, var

; winmdroot.Foundation.BOOL HttpQueryInfo(void* hRequest, uint dwInfoLevel, [Optional] void* lpBuffer, uint* lpdwBufferLength, [Optional] uint* lpdwIndex)
#cfunc HttpQueryInfoW "HttpQueryInfoW" intptr, int, intptr, var, var

; winmdroot.Foundation.BOOL HttpSendRequest(void* hRequest, winmdroot.Foundation.PCWSTR lpszHeaders, uint dwHeadersLength, [Optional] void* lpOptional, uint dwOptionalLength)
#cfunc HttpSendRequestW "HttpSendRequestW" intptr, wstr, int, intptr, int

; winmdroot.Foundation.BOOL HttpSendRequestEx(void* hRequest, [Optional] winmdroot.Networking.WinInet.INTERNET_BUFFERSW* lpBuffersIn, [Optional] winmdroot.Networking.WinInet.INTERNET_BUFFERSW* lpBuffersOut, uint dwFlags, nuint dwContext)
#cfunc HttpSendRequestExW "HttpSendRequestExW" intptr, var, var, int, int

; winmdroot.Foundation.BOOL HttpWebSocketClose(void* hWebSocket, ushort usStatus, [Optional] void* pvReason, uint dwReasonLength)
#cfunc HttpWebSocketClose "HttpWebSocketClose" intptr, int, intptr, int

; void* HttpWebSocketCompleteUpgrade(void* hRequest, nuint dwContext)
#cfunc HttpWebSocketCompleteUpgrade "HttpWebSocketCompleteUpgrade" intptr, int

; winmdroot.Foundation.BOOL HttpWebSocketQueryCloseStatus(void* hWebSocket, ushort* pusStatus, [Optional] void* pvReason, uint dwReasonLength, uint* pdwReasonLengthConsumed)
#cfunc HttpWebSocketQueryCloseStatus "HttpWebSocketQueryCloseStatus" intptr, var, intptr, int, var

; winmdroot.Foundation.BOOL HttpWebSocketReceive(void* hWebSocket, void* pvBuffer, uint dwBufferLength, uint* pdwBytesRead, winmdroot.Networking.WinInet.HTTP_WEB_SOCKET_BUFFER_TYPE* pBufferType)
#cfunc HttpWebSocketReceive "HttpWebSocketReceive" intptr, intptr, int, var, var

; winmdroot.Foundation.BOOL HttpWebSocketSend(void* hWebSocket, winmdroot.Networking.WinInet.HTTP_WEB_SOCKET_BUFFER_TYPE BufferType, [Optional] void* pvBuffer, uint dwBufferLength)
#cfunc HttpWebSocketSend "HttpWebSocketSend" intptr, int, intptr, int

; winmdroot.Foundation.BOOL HttpWebSocketShutdown(void* hWebSocket, ushort usStatus, [Optional] void* pvReason, uint dwReasonLength)
#cfunc HttpWebSocketShutdown "HttpWebSocketShutdown" intptr, int, intptr, int

; winmdroot.Foundation.BOOL IncrementUrlCacheHeaderData(uint nIdx, uint* lpdwData)
#cfunc IncrementUrlCacheHeaderData "IncrementUrlCacheHeaderData" int, var

; winmdroot.Foundation.BOOL InternetAlgIdToStringW(winmdroot.Security.Cryptography.ALG_ID ai, winmdroot.Foundation.PWSTR lpstr, uint* lpdwstrLength, uint dwReserved)
#cfunc InternetAlgIdToStringW "InternetAlgIdToStringW" int, wstr, var, int

; uint InternetAttemptConnect(uint dwReserved)
#cfunc InternetAttemptConnect "InternetAttemptConnect" int

; winmdroot.Foundation.BOOL InternetAutodial(winmdroot.Networking.WinInet.INTERNET_AUTODIAL dwFlags, winmdroot.Foundation.HWND hwndParent)
#cfunc InternetAutodial "InternetAutodial" int, intptr

; winmdroot.Foundation.BOOL InternetAutodialHangup(uint dwReserved)
#cfunc InternetAutodialHangup "InternetAutodialHangup" int

; winmdroot.Foundation.BOOL InternetCanonicalizeUrl(winmdroot.Foundation.PCWSTR lpszUrl, winmdroot.Foundation.PWSTR lpszBuffer, uint* lpdwBufferLength, uint dwFlags)
#cfunc InternetCanonicalizeUrlW "InternetCanonicalizeUrlW" wstr, wstr, var, int

; winmdroot.Foundation.BOOL InternetCheckConnection(winmdroot.Foundation.PCWSTR lpszUrl, uint dwFlags, uint dwReserved)
#cfunc InternetCheckConnectionW "InternetCheckConnectionW" wstr, int, int

; winmdroot.Foundation.BOOL InternetClearAllPerSiteCookieDecisions()
#cfunc InternetClearAllPerSiteCookieDecisions "InternetClearAllPerSiteCookieDecisions"

; winmdroot.Foundation.BOOL InternetCloseHandle(void* hInternet)
#cfunc InternetCloseHandle "InternetCloseHandle" intptr

; winmdroot.Foundation.BOOL InternetCombineUrl(winmdroot.Foundation.PCWSTR lpszBaseUrl, winmdroot.Foundation.PCWSTR lpszRelativeUrl, winmdroot.Foundation.PWSTR lpszBuffer, uint* lpdwBufferLength, uint dwFlags)
#cfunc InternetCombineUrlW "InternetCombineUrlW" wstr, wstr, wstr, var, int

; uint InternetConfirmZoneCrossing(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.PSTR szUrlPrev, winmdroot.Foundation.PSTR szUrlNew, winmdroot.Foundation.BOOL bPost)
#cfunc InternetConfirmZoneCrossing "InternetConfirmZoneCrossing" intptr, str, str, int

; void* InternetConnect(void* hInternet, winmdroot.Foundation.PCWSTR lpszServerName, ushort nServerPort, winmdroot.Foundation.PCWSTR lpszUserName, winmdroot.Foundation.PCWSTR lpszPassword, uint dwService, uint dwFlags, nuint dwContext)
#cfunc InternetConnectW "InternetConnectW" intptr, wstr, int, wstr, wstr, int, int, int

; uint InternetConvertUrlFromWireToWideChar(winmdroot.Foundation.PCSTR pcszUrl, uint cchUrl, winmdroot.Foundation.PCWSTR pcwszBaseUrl, uint dwCodePageHost, uint dwCodePagePath, winmdroot.Foundation.BOOL fEncodePathExtra, uint dwCodePageExtra, winmdroot.Foundation.PWSTR* ppwszConvertedUrl)
#cfunc InternetConvertUrlFromWireToWideChar "InternetConvertUrlFromWireToWideChar" str, int, wstr, int, int, int, int, var

; winmdroot.Foundation.BOOL InternetCrackUrl(winmdroot.Foundation.PCWSTR lpszUrl, uint dwUrlLength, winmdroot.Networking.WinHttp.WIN_HTTP_CREATE_URL_FLAGS dwFlags, winmdroot.Networking.WinInet.URL_COMPONENTSW* lpUrlComponents)
#cfunc InternetCrackUrlW "InternetCrackUrlW" wstr, int, int, var

; winmdroot.Foundation.BOOL InternetCreateUrl(winmdroot.Networking.WinInet.URL_COMPONENTSW* lpUrlComponents, uint dwFlags, winmdroot.Foundation.PWSTR lpszUrl, uint* lpdwUrlLength)
#cfunc InternetCreateUrlW "InternetCreateUrlW" var, int, wstr, var

; uint InternetDial(winmdroot.Foundation.HWND hwndParent, winmdroot.Foundation.PSTR lpszConnectoid, uint dwFlags, uint* lpdwConnection, uint dwReserved)
#cfunc InternetDial "InternetDial" intptr, str, int, var, int

; winmdroot.Foundation.BOOL InternetEnumPerSiteCookieDecisionW(winmdroot.Foundation.PWSTR pszSiteName, uint* pcSiteNameSize, uint* pdwDecision, uint dwIndex)
#cfunc InternetEnumPerSiteCookieDecisionW "InternetEnumPerSiteCookieDecisionW" wstr, var, var, int

; uint InternetErrorDlg(winmdroot.Foundation.HWND hWnd, [Optional] void* hRequest, uint dwError, uint dwFlags, [Optional] void** lppvData)
#cfunc InternetErrorDlg "InternetErrorDlg" intptr, intptr, int, int, var

; winmdroot.Foundation.BOOL InternetFindNextFile(void* hFind, void* lpvFindData)
#cfunc InternetFindNextFileW "InternetFindNextFileW" intptr, intptr

; winmdroot.Foundation.BOOL InternetFortezzaCommand(uint dwCommand, winmdroot.Foundation.HWND hwnd, nuint dwReserved)
#cfunc InternetFortezzaCommand "InternetFortezzaCommand" int, intptr, int

; void InternetFreeCookies([Optional] winmdroot.Networking.WinInet.INTERNET_COOKIE2* pCookies, uint dwCookieCount)
#func InternetFreeCookies "InternetFreeCookies" var, int

; void InternetFreeProxyInfoList(winmdroot.Networking.WinInet.WININET_PROXY_INFO_LIST* pProxyInfoList)
#func InternetFreeProxyInfoList "InternetFreeProxyInfoList" var

; winmdroot.Foundation.BOOL InternetGetConnectedState(winmdroot.Networking.WinInet.INTERNET_CONNECTION* lpdwFlags, uint dwReserved)
#cfunc InternetGetConnectedState "InternetGetConnectedState" var, int

; winmdroot.Foundation.BOOL InternetGetConnectedStateEx(winmdroot.Networking.WinInet.INTERNET_CONNECTION* lpdwFlags, winmdroot.Foundation.PSTR lpszConnectionName, uint dwNameLen, uint dwReserved)
#cfunc InternetGetConnectedStateEx "InternetGetConnectedStateEx" var, str, int, int

; winmdroot.Foundation.BOOL InternetGetCookie(winmdroot.Foundation.PCWSTR lpszUrl, winmdroot.Foundation.PCWSTR lpszCookieName, winmdroot.Foundation.PWSTR lpszCookieData, uint* lpdwSize)
#cfunc InternetGetCookieW "InternetGetCookieW" wstr, wstr, wstr, var

; winmdroot.Foundation.BOOL InternetGetCookieEx(winmdroot.Foundation.PCWSTR lpszUrl, winmdroot.Foundation.PCWSTR lpszCookieName, winmdroot.Foundation.PWSTR lpszCookieData, uint* lpdwSize, winmdroot.Networking.WinInet.INTERNET_COOKIE_FLAGS dwFlags, [Optional] void* lpReserved)
#cfunc InternetGetCookieExW "InternetGetCookieExW" wstr, wstr, wstr, var, int, intptr

; uint InternetGetCookieEx2(winmdroot.Foundation.PCWSTR pcwszUrl, winmdroot.Foundation.PCWSTR pcwszCookieName, uint dwFlags, winmdroot.Networking.WinInet.INTERNET_COOKIE2** ppCookies, uint* pdwCookieCount)
#cfunc InternetGetCookieEx2 "InternetGetCookieEx2" wstr, wstr, int, var, var

; winmdroot.Foundation.BOOL InternetGetLastResponseInfo(uint* lpdwError, winmdroot.Foundation.PWSTR lpszBuffer, uint* lpdwBufferLength)
#cfunc InternetGetLastResponseInfoW "InternetGetLastResponseInfoW" var, wstr, var

; winmdroot.Foundation.BOOL InternetGetPerSiteCookieDecisionW(winmdroot.Foundation.PCWSTR pchHostName, uint* pResult)
#cfunc InternetGetPerSiteCookieDecisionW "InternetGetPerSiteCookieDecisionW" wstr, var

; uint InternetGetProxyForUrl(void* hInternet, winmdroot.Foundation.PCWSTR pcwszUrl, winmdroot.Networking.WinInet.WININET_PROXY_INFO_LIST* pProxyInfoList)
#cfunc InternetGetProxyForUrl "InternetGetProxyForUrl" intptr, wstr, var

; winmdroot.Foundation.BOOL InternetGetSecurityInfoByURL(winmdroot.Foundation.PSTR lpszURL, winmdroot.Security.Cryptography.CERT_CHAIN_CONTEXT** ppCertChain, uint* pdwSecureFlags)
#cfunc InternetGetSecurityInfoByURL "InternetGetSecurityInfoByURL" str, var, var

; winmdroot.Foundation.BOOL InternetGetSecurityInfoByURLA(winmdroot.Foundation.PSTR lpszURL, winmdroot.Security.Cryptography.CERT_CHAIN_CONTEXT** ppCertChain, uint* pdwSecureFlags)
#cfunc InternetGetSecurityInfoByURLA "InternetGetSecurityInfoByURLA" str, var, var

; winmdroot.Foundation.BOOL InternetGetSecurityInfoByURLW(winmdroot.Foundation.PCWSTR lpszURL, winmdroot.Security.Cryptography.CERT_CHAIN_CONTEXT** ppCertChain, uint* pdwSecureFlags)
#cfunc InternetGetSecurityInfoByURLW "InternetGetSecurityInfoByURLW" wstr, var, var

; winmdroot.Foundation.BOOL InternetGoOnline(winmdroot.Foundation.PSTR lpszURL, winmdroot.Foundation.HWND hwndParent, uint dwFlags)
#cfunc InternetGoOnline "InternetGoOnline" str, intptr, int

; uint InternetHangUp(nuint dwConnection, uint dwReserved)
#cfunc InternetHangUp "InternetHangUp" int, int

; winmdroot.Foundation.BOOL InternetInitializeAutoProxyDll(uint dwReserved)
#cfunc InternetInitializeAutoProxyDll "InternetInitializeAutoProxyDll" int

; winmdroot.Foundation.BOOL InternetLockRequestFile(void* hInternet, winmdroot.Foundation.HANDLE* lphLockRequestInfo)
#cfunc InternetLockRequestFile "InternetLockRequestFile" intptr, intptr

; void* InternetOpen(winmdroot.Foundation.PCWSTR lpszAgent, uint dwAccessType, winmdroot.Foundation.PCWSTR lpszProxy, winmdroot.Foundation.PCWSTR lpszProxyBypass, uint dwFlags)
#cfunc InternetOpenW "InternetOpenW" wstr, int, wstr, wstr, int

; void* InternetOpenUrl(void* hInternet, winmdroot.Foundation.PCWSTR lpszUrl, winmdroot.Foundation.PCWSTR lpszHeaders, uint dwHeadersLength, uint dwFlags, nuint dwContext)
#cfunc InternetOpenUrlW "InternetOpenUrlW" intptr, wstr, wstr, int, int, int

; winmdroot.Foundation.BOOL InternetQueryDataAvailable(void* hFile, [Optional] uint* lpdwNumberOfBytesAvailable, uint dwFlags, nuint dwContext)
#cfunc InternetQueryDataAvailable "InternetQueryDataAvailable" intptr, var, int, int

; winmdroot.Foundation.BOOL InternetQueryFortezzaStatus(uint* pdwStatus, nuint dwReserved)
#cfunc InternetQueryFortezzaStatus "InternetQueryFortezzaStatus" var, int

; winmdroot.Foundation.BOOL InternetQueryOption([Optional] void* hInternet, uint dwOption, [Optional] void* lpBuffer, uint* lpdwBufferLength)
#cfunc InternetQueryOptionW "InternetQueryOptionW" intptr, int, intptr, var

; winmdroot.Foundation.BOOL InternetReadFile(void* hFile, void* lpBuffer, uint dwNumberOfBytesToRead, uint* lpdwNumberOfBytesRead)
#cfunc InternetReadFile "InternetReadFile" intptr, intptr, int, var

; winmdroot.Foundation.BOOL InternetReadFileEx(void* hFile, winmdroot.Networking.WinInet.INTERNET_BUFFERSW* lpBuffersOut, uint dwFlags, nuint dwContext)
#cfunc InternetReadFileExW "InternetReadFileExW" intptr, var, int, int

; winmdroot.Foundation.BOOL InternetSecurityProtocolToStringW(uint dwProtocol, winmdroot.Foundation.PWSTR lpstr, uint* lpdwstrLength, uint dwReserved)
#cfunc InternetSecurityProtocolToStringW "InternetSecurityProtocolToStringW" int, wstr, var, int

; winmdroot.Foundation.BOOL InternetSetCookie(winmdroot.Foundation.PCWSTR lpszUrl, winmdroot.Foundation.PCWSTR lpszCookieName, winmdroot.Foundation.PCWSTR lpszCookieData)
#cfunc InternetSetCookieW "InternetSetCookieW" wstr, wstr, wstr

; uint InternetSetCookieEx(winmdroot.Foundation.PCWSTR lpszUrl, winmdroot.Foundation.PCWSTR lpszCookieName, winmdroot.Foundation.PCWSTR lpszCookieData, uint dwFlags, nuint dwReserved)
#cfunc InternetSetCookieExW "InternetSetCookieExW" wstr, wstr, wstr, int, int

; uint InternetSetCookieEx2(winmdroot.Foundation.PCWSTR pcwszUrl, winmdroot.Networking.WinInet.INTERNET_COOKIE2* pCookie, winmdroot.Foundation.PCWSTR pcwszP3PPolicy, uint dwFlags, uint* pdwCookieState)
#cfunc InternetSetCookieEx2 "InternetSetCookieEx2" wstr, var, wstr, int, var

; winmdroot.Foundation.BOOL InternetSetDialState(winmdroot.Foundation.PCSTR lpszConnectoid, uint dwState, uint dwReserved)
#cfunc InternetSetDialState "InternetSetDialState" str, int, int

; uint InternetSetFilePointer(void* hFile, int lDistanceToMove, [Optional] int* lpDistanceToMoveHigh, uint dwMoveMethod, nuint dwContext)
#cfunc InternetSetFilePointer "InternetSetFilePointer" intptr, int, var, int, int

; winmdroot.Foundation.BOOL InternetSetOption([Optional] void* hInternet, uint dwOption, [Optional] void* lpBuffer, uint dwBufferLength)
#cfunc InternetSetOptionW "InternetSetOptionW" intptr, int, intptr, int

; winmdroot.Foundation.BOOL InternetSetOptionExW([Optional] void* hInternet, uint dwOption, [Optional] void* lpBuffer, uint dwBufferLength, uint dwFlags)
#cfunc InternetSetOptionExW "InternetSetOptionExW" intptr, int, intptr, int, int

; winmdroot.Foundation.BOOL InternetSetPerSiteCookieDecisionW(winmdroot.Foundation.PCWSTR pchHostName, uint dwDecision)
#cfunc InternetSetPerSiteCookieDecisionW "InternetSetPerSiteCookieDecisionW" wstr, int

; winmdroot.Foundation.BOOL InternetShowSecurityInfoByURL(winmdroot.Foundation.PSTR lpszURL, winmdroot.Foundation.HWND hwndParent)
#cfunc InternetShowSecurityInfoByURL "InternetShowSecurityInfoByURL" str, intptr

; winmdroot.Foundation.BOOL InternetShowSecurityInfoByURLA(winmdroot.Foundation.PSTR lpszURL, winmdroot.Foundation.HWND hwndParent)
#cfunc InternetShowSecurityInfoByURLA "InternetShowSecurityInfoByURLA" str, intptr

; winmdroot.Foundation.BOOL InternetShowSecurityInfoByURLW(winmdroot.Foundation.PCWSTR lpszURL, winmdroot.Foundation.HWND hwndParent)
#cfunc InternetShowSecurityInfoByURLW "InternetShowSecurityInfoByURLW" wstr, intptr

; winmdroot.Foundation.BOOL InternetTimeFromSystemTime(winmdroot.Foundation.SYSTEMTIME* pst, uint dwRFC, winmdroot.Foundation.PSTR lpszTime, uint cbTime)
#cfunc InternetTimeFromSystemTime "InternetTimeFromSystemTime" var, int, str, int

; winmdroot.Foundation.BOOL InternetTimeToSystemTime(winmdroot.Foundation.PCSTR lpszTime, winmdroot.Foundation.SYSTEMTIME* pst, uint dwReserved)
#cfunc InternetTimeToSystemTime "InternetTimeToSystemTime" str, var, int

; winmdroot.Foundation.BOOL InternetUnlockRequestFile(winmdroot.Foundation.HANDLE hLockRequestInfo)
#cfunc InternetUnlockRequestFile "InternetUnlockRequestFile" intptr

; winmdroot.Foundation.BOOL InternetWriteFile(void* hFile, void* lpBuffer, uint dwNumberOfBytesToWrite, uint* lpdwNumberOfBytesWritten)
#cfunc InternetWriteFile "InternetWriteFile" intptr, intptr, int, var

; winmdroot.Foundation.BOOL InternetWriteFileExW(void* hFile, winmdroot.Networking.WinInet.INTERNET_BUFFERSW* lpBuffersIn, uint dwFlags, nuint dwContext)
#cfunc InternetWriteFileExW "InternetWriteFileExW" intptr, var, int, int

; winmdroot.Foundation.BOOL IsHostInProxyBypassList(winmdroot.Networking.WinInet.INTERNET_SCHEME tScheme, winmdroot.Foundation.PCSTR lpszHost, uint cchHost)
#cfunc IsHostInProxyBypassList "IsHostInProxyBypassList" int, str, int

; winmdroot.Foundation.BOOL IsUrlCacheEntryExpiredW(winmdroot.Foundation.PCWSTR lpszUrlName, uint dwFlags, global::System.Runtime.InteropServices.ComTypes.FILETIME* pftLastModified)
#cfunc IsUrlCacheEntryExpiredW "IsUrlCacheEntryExpiredW" wstr, int, var

; winmdroot.Foundation.BOOL LoadUrlCacheContent()
#cfunc LoadUrlCacheContent "LoadUrlCacheContent"

; uint ParseX509EncodedCertificateForListBoxEntry(byte* lpCert, uint cbCert, winmdroot.Foundation.PSTR lpszListBoxEntry, uint* lpdwListBoxEntry)
#cfunc ParseX509EncodedCertificateForListBoxEntry "ParseX509EncodedCertificateForListBoxEntry" var, int, str, var

; uint PrivacyGetZonePreferenceW(uint dwZone, uint dwType, [Optional] uint* pdwTemplate, winmdroot.Foundation.PWSTR pszBuffer, [Optional] uint* pdwBufferLength)
#cfunc PrivacyGetZonePreferenceW "PrivacyGetZonePreferenceW" int, int, var, wstr, var

; uint PrivacySetZonePreferenceW(uint dwZone, uint dwType, uint dwTemplate, winmdroot.Foundation.PCWSTR pszPreference)
#cfunc PrivacySetZonePreferenceW "PrivacySetZonePreferenceW" int, int, int, wstr

; winmdroot.Foundation.BOOL ReadUrlCacheEntryStream(winmdroot.Foundation.HANDLE hUrlCacheStream, uint dwLocation, void* lpBuffer, uint* lpdwLen, uint Reserved)
#cfunc ReadUrlCacheEntryStream "ReadUrlCacheEntryStream" intptr, int, intptr, var, int

; winmdroot.Foundation.BOOL ReadUrlCacheEntryStreamEx(winmdroot.Foundation.HANDLE hUrlCacheStream, ulong qwLocation, void* lpBuffer, uint* lpdwLen)
#cfunc ReadUrlCacheEntryStreamEx "ReadUrlCacheEntryStreamEx" intptr, int64, intptr, var

; winmdroot.Foundation.BOOL RegisterUrlCacheNotification(winmdroot.Foundation.HWND hWnd, uint uMsg, long gid, uint dwOpsFilter, uint dwReserved)
#cfunc RegisterUrlCacheNotification "RegisterUrlCacheNotification" intptr, int, int64, int, int

; winmdroot.Foundation.BOOL ResumeSuspendedDownload(void* hRequest, uint dwResultCode)
#cfunc ResumeSuspendedDownload "ResumeSuspendedDownload" intptr, int

; winmdroot.Foundation.BOOL RetrieveUrlCacheEntryFile(winmdroot.Foundation.PCWSTR lpszUrlName, [Optional] winmdroot.Networking.WinInet.INTERNET_CACHE_ENTRY_INFOW* lpCacheEntryInfo, uint* lpcbCacheEntryInfo, uint dwReserved)
#cfunc RetrieveUrlCacheEntryFileW "RetrieveUrlCacheEntryFileW" wstr, var, var, int

; winmdroot.Foundation.HANDLE RetrieveUrlCacheEntryStream(winmdroot.Foundation.PCWSTR lpszUrlName, [Optional] winmdroot.Networking.WinInet.INTERNET_CACHE_ENTRY_INFOW* lpCacheEntryInfo, uint* lpcbCacheEntryInfo, winmdroot.Foundation.BOOL fRandomRead, uint dwReserved)
#cfunc RetrieveUrlCacheEntryStreamW "RetrieveUrlCacheEntryStreamW" wstr, var, var, int, int

; uint RunOnceUrlCache(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.HINSTANCE hinst, winmdroot.Foundation.PSTR lpszCmd, int nCmdShow)
#cfunc RunOnceUrlCache "RunOnceUrlCache" intptr, intptr, str, int

; winmdroot.Foundation.BOOL SetUrlCacheConfigInfoW(winmdroot.Networking.WinInet.INTERNET_CACHE_CONFIG_INFOW* lpCacheConfigInfo, uint dwFieldControl)
#cfunc SetUrlCacheConfigInfoW "SetUrlCacheConfigInfoW" var, int

; winmdroot.Foundation.BOOL SetUrlCacheEntryGroup(winmdroot.Foundation.PCSTR lpszUrlName, uint dwFlags, long GroupId, [Optional] byte* pbGroupAttributes, uint cbGroupAttributes, [Optional] void* lpReserved)
#cfunc SetUrlCacheEntryGroup "SetUrlCacheEntryGroup" str, int, int64, var, int, intptr

; winmdroot.Foundation.BOOL SetUrlCacheEntryInfo(winmdroot.Foundation.PCWSTR lpszUrlName, winmdroot.Networking.WinInet.INTERNET_CACHE_ENTRY_INFOW* lpCacheEntryInfo, uint dwFieldControl)
#cfunc SetUrlCacheEntryInfoW "SetUrlCacheEntryInfoW" wstr, var, int

; winmdroot.Foundation.BOOL SetUrlCacheGroupAttribute(long gid, uint dwFlags, uint dwAttributes, winmdroot.Networking.WinInet.INTERNET_CACHE_GROUP_INFOW* lpGroupInfo, [Optional] void* lpReserved)
#cfunc SetUrlCacheGroupAttributeW "SetUrlCacheGroupAttributeW" int64, int, int, var, intptr

; winmdroot.Foundation.BOOL SetUrlCacheHeaderData(uint nIdx, uint dwData)
#cfunc SetUrlCacheHeaderData "SetUrlCacheHeaderData" int, int

; uint ShowClientAuthCerts(winmdroot.Foundation.HWND hWndParent)
#cfunc ShowClientAuthCerts "ShowClientAuthCerts" intptr

; uint ShowSecurityInfo(winmdroot.Foundation.HWND hWndParent, winmdroot.Networking.WinInet.INTERNET_SECURITY_INFO* pSecurityInfo)
#cfunc ShowSecurityInfo "ShowSecurityInfo" intptr, var

; uint ShowX509EncodedCertificate(winmdroot.Foundation.HWND hWndParent, byte* lpCert, uint cbCert)
#cfunc ShowX509EncodedCertificate "ShowX509EncodedCertificate" intptr, var, int

; winmdroot.Foundation.BOOL UnlockUrlCacheEntryFile(winmdroot.Foundation.PCSTR lpszUrlName, uint dwReserved)
#cfunc UnlockUrlCacheEntryFile "UnlockUrlCacheEntryFile" str, int

; winmdroot.Foundation.BOOL UnlockUrlCacheEntryStream(winmdroot.Foundation.HANDLE hUrlCacheStream, uint Reserved)
#cfunc UnlockUrlCacheEntryStream "UnlockUrlCacheEntryStream" intptr, int

; winmdroot.Foundation.BOOL UpdateUrlCacheContentPath(winmdroot.Foundation.PCSTR szNewPath)
#cfunc UpdateUrlCacheContentPath "UpdateUrlCacheContentPath" str

; uint UrlCacheCheckEntriesExist(winmdroot.Foundation.PCWSTR* rgpwszUrls, uint cEntries, winmdroot.Foundation.BOOL* rgfExist)
#cfunc UrlCacheCheckEntriesExist "UrlCacheCheckEntriesExist" var, int, var

; void UrlCacheCloseEntryHandle(void* hEntryFile)
#func UrlCacheCloseEntryHandle "UrlCacheCloseEntryHandle" intptr

; uint UrlCacheContainerSetEntryMaximumAge(winmdroot.Foundation.PCWSTR pwszPrefix, uint dwEntryMaxAge)
#cfunc UrlCacheContainerSetEntryMaximumAge "UrlCacheContainerSetEntryMaximumAge" wstr, int

; uint UrlCacheCreateContainer(winmdroot.Foundation.PCWSTR pwszName, winmdroot.Foundation.PCWSTR pwszPrefix, winmdroot.Foundation.PCWSTR pwszDirectory, ulong ullLimit, uint dwOptions)
#cfunc UrlCacheCreateContainer "UrlCacheCreateContainer" wstr, wstr, wstr, int64, int

; uint UrlCacheFindFirstEntry(winmdroot.Foundation.PCWSTR pwszPrefix, uint dwFlags, uint dwFilter, long GroupId, winmdroot.Networking.WinInet.URLCACHE_ENTRY_INFO* pCacheEntryInfo, winmdroot.Foundation.HANDLE* phFind)
#cfunc UrlCacheFindFirstEntry "UrlCacheFindFirstEntry" wstr, int, int, int64, var, intptr

; uint UrlCacheFindNextEntry(winmdroot.Foundation.HANDLE hFind, winmdroot.Networking.WinInet.URLCACHE_ENTRY_INFO* pCacheEntryInfo)
#cfunc UrlCacheFindNextEntry "UrlCacheFindNextEntry" intptr, var

; void UrlCacheFreeEntryInfo(winmdroot.Networking.WinInet.URLCACHE_ENTRY_INFO* pCacheEntryInfo)
#func UrlCacheFreeEntryInfo "UrlCacheFreeEntryInfo" var

; uint UrlCacheFreeGlobalSpace(ulong ullTargetSize, uint dwFilter)
#cfunc UrlCacheFreeGlobalSpace "UrlCacheFreeGlobalSpace" int64, int

; uint UrlCacheGetContentPaths(winmdroot.Foundation.PWSTR** pppwszDirectories, uint* pcDirectories)
#cfunc UrlCacheGetContentPaths "UrlCacheGetContentPaths" var, var

; uint UrlCacheGetEntryInfo([Optional] void* hAppCache, winmdroot.Foundation.PCWSTR pcwszUrl, [Optional] winmdroot.Networking.WinInet.URLCACHE_ENTRY_INFO* pCacheEntryInfo)
#cfunc UrlCacheGetEntryInfo "UrlCacheGetEntryInfo" intptr, wstr, var

; uint UrlCacheGetGlobalCacheSize(uint dwFilter, ulong* pullSize, ulong* pullLimit)
#cfunc UrlCacheGetGlobalCacheSize "UrlCacheGetGlobalCacheSize" int, var, var

; uint UrlCacheGetGlobalLimit(winmdroot.Networking.WinInet.URL_CACHE_LIMIT_TYPE limitType, ulong* pullLimit)
#cfunc UrlCacheGetGlobalLimit "UrlCacheGetGlobalLimit" int, var

; uint UrlCacheReadEntryStream(void* hUrlCacheStream, ulong ullLocation, void* pBuffer, uint dwBufferLen, uint* pdwBufferLen)
#cfunc UrlCacheReadEntryStream "UrlCacheReadEntryStream" intptr, int64, intptr, int, var

; uint UrlCacheReloadSettings()
#cfunc UrlCacheReloadSettings "UrlCacheReloadSettings"

; uint UrlCacheRetrieveEntryFile([Optional] void* hAppCache, winmdroot.Foundation.PCWSTR pcwszUrl, winmdroot.Networking.WinInet.URLCACHE_ENTRY_INFO* pCacheEntryInfo, void** phEntryFile)
#cfunc UrlCacheRetrieveEntryFile "UrlCacheRetrieveEntryFile" intptr, wstr, var, var

; uint UrlCacheRetrieveEntryStream([Optional] void* hAppCache, winmdroot.Foundation.PCWSTR pcwszUrl, winmdroot.Foundation.BOOL fRandomRead, winmdroot.Networking.WinInet.URLCACHE_ENTRY_INFO* pCacheEntryInfo, void** phEntryStream)
#cfunc UrlCacheRetrieveEntryStream "UrlCacheRetrieveEntryStream" intptr, wstr, int, var, var

; uint UrlCacheServer()
#cfunc UrlCacheServer "UrlCacheServer"

; uint UrlCacheSetGlobalLimit(winmdroot.Networking.WinInet.URL_CACHE_LIMIT_TYPE limitType, ulong ullLimit)
#cfunc UrlCacheSetGlobalLimit "UrlCacheSetGlobalLimit" int, int64

; uint UrlCacheUpdateEntryExtraData([Optional] void* hAppCache, winmdroot.Foundation.PCWSTR pcwszUrl, byte* pbExtraData, uint cbExtraData)
#cfunc UrlCacheUpdateEntryExtraData "UrlCacheUpdateEntryExtraData" intptr, wstr, var, int

#endif
