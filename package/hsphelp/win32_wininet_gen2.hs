; ============================================================
;   wininet.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
AppCacheCheckManifest
(no summary)
%group
Win32 wininet
%prm
pwszMasterUrl, pwszManifestUrl, pbManifestData, dwManifestDataSize, pbManifestResponseHeaders, dwManifestResponseHeadersSize, peState, phNewAppCache
pwszMasterUrl : [wstr] 
pwszManifestUrl : [wstr] 
pbManifestData : [var] 
dwManifestDataSize : [int] 
pbManifestResponseHeaders : [var] 
dwManifestResponseHeadersSize : [int] 
peState : [var] 
phNewAppCache : [var] 
%inst



%index
AppCacheCloseHandle
(no summary)
%group
Win32 wininet
%prm
hAppCache
hAppCache : [intptr] 
%inst



%index
AppCacheCreateAndCommitFile
(no summary)
%group
Win32 wininet
%prm
hAppCache, pwszSourceFilePath, pwszUrl, pbResponseHeaders, dwResponseHeadersSize
hAppCache : [intptr] 
pwszSourceFilePath : [wstr] 
pwszUrl : [wstr] 
pbResponseHeaders : [var] 
dwResponseHeadersSize : [int] 
%inst



%index
AppCacheDeleteGroup
(no summary)
%group
Win32 wininet
%prm
pwszManifestUrl
pwszManifestUrl : [wstr] 
%inst



%index
AppCacheDeleteIEGroup
(no summary)
%group
Win32 wininet
%prm
pwszManifestUrl
pwszManifestUrl : [wstr] 
%inst



%index
AppCacheDuplicateHandle
(no summary)
%group
Win32 wininet
%prm
hAppCache, phDuplicatedAppCache
hAppCache : [intptr] 
phDuplicatedAppCache : [var] 
%inst



%index
AppCacheFinalize
(no summary)
%group
Win32 wininet
%prm
hAppCache, pbManifestData, dwManifestDataSize, peState
hAppCache : [intptr] 
pbManifestData : [var] 
dwManifestDataSize : [int] 
peState : [var] 
%inst



%index
AppCacheFreeDownloadList
(no summary)
%group
Win32 wininet
%prm
pDownloadList
pDownloadList : [var] 
%inst



%index
AppCacheFreeGroupList
(no summary)
%group
Win32 wininet
%prm
pAppCacheGroupList
pAppCacheGroupList : [var] 
%inst



%index
AppCacheFreeIESpace
(no summary)
%group
Win32 wininet
%prm
ftCutOff
ftCutOff : [int] 
%inst



%index
AppCacheFreeSpace
(no summary)
%group
Win32 wininet
%prm
ftCutOff
ftCutOff : [int] 
%inst



%index
AppCacheGetDownloadList
(no summary)
%group
Win32 wininet
%prm
hAppCache, pDownloadList
hAppCache : [intptr] 
pDownloadList : [var] 
%inst



%index
AppCacheGetFallbackUrl
(no summary)
%group
Win32 wininet
%prm
hAppCache, pwszUrl, ppwszFallbackUrl
hAppCache : [intptr] 
pwszUrl : [wstr] 
ppwszFallbackUrl : [var] 
%inst



%index
AppCacheGetGroupList
(no summary)
%group
Win32 wininet
%prm
pAppCacheGroupList
pAppCacheGroupList : [var] 
%inst



%index
AppCacheGetIEGroupList
(no summary)
%group
Win32 wininet
%prm
pAppCacheGroupList
pAppCacheGroupList : [var] 
%inst



%index
AppCacheGetInfo
(no summary)
%group
Win32 wininet
%prm
hAppCache, pAppCacheInfo
hAppCache : [intptr] 
pAppCacheInfo : [var] 
%inst



%index
AppCacheGetManifestUrl
(no summary)
%group
Win32 wininet
%prm
hAppCache, ppwszManifestUrl
hAppCache : [intptr] 
ppwszManifestUrl : [var] 
%inst



%index
AppCacheLookup
(no summary)
%group
Win32 wininet
%prm
pwszUrl, dwFlags, phAppCache
pwszUrl : [wstr] 
dwFlags : [int] 
phAppCache : [var] 
%inst



%index
CommitUrlCacheEntryW
Stores data in the specified file in the Internet cache and associates it with the specified URL. (Unicode)
%group
Win32 wininet
%prm
lpszUrlName, lpszLocalFileName, ExpireTime, LastModifiedTime, CacheEntryType, lpszHeaderInfo, cchHeaderInfo, lpszFileExtension, lpszOriginalUrl
lpszUrlName : [wstr] Pointer to a string variable that contains the source name of the cache entry. The name string must be unique and should not contain any escape characters.
lpszLocalFileName : [wstr] Pointer to a string variable that contains the name of the local file that is being cached. This should be the same name as that returned by CreateUrlCacheEntryW.
ExpireTime : [int] FILETIME structure that contains the expire date and time (in Greenwich mean time) of the file that is being cached. If the expire date and time is unknown, set this parameter to zero.
LastModifiedTime : [int] FILETIME structure that contains the last modified date and time (in Greenwich mean time) of the URL that is being cached. If the last modified date and time is unknown, set this parameter to zero.
CacheEntryType : [int] A bitmask indicating the type of cache entry and its properties. The cache entry types include: history entries (URLHISTORY_CACHE_ENTRY),  cookie entries  (COOKIE_CACHE_ENTRY), and normal cached content (NORMAL_CACHE_ENTRY). This parameter can be zero or more of the following property flags, and  cache type flags listed below.
lpszHeaderInfo : [wstr] Pointer to the buffer that contains the header information. If this parameter is not NULL, the header information is treated as extended attributes of the URL that are returned in the lpHeaderInfo member of the INTERNET_CACHE_ENTRY_INFO structure.
cchHeaderInfo : [int] Size of the header information, in TCHARs. If lpHeaderInfo is not NULL, this value is assumed to indicate the size of the buffer that  stores the header information. An application can maintain headers as part of the data and provide cchHeaderInfo together with a NULL value for lpHeaderInfo.
lpszFileExtension : [wstr] This parameter is reserved and must be NULL.
lpszOriginalUrl : [wstr] Pointer to a string  that contains the original URL, if redirection has occurred.
%inst
Stores data in the specified file in the Internet cache and
associates it with the specified URL. (Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get extended error
information, call GetLastError. The following are possible error
values.
This doc was truncated.

[備考]
The STICKY_CACHE_ENTRY type is used to make cache entries exempt from
scavenging. The default exempt time for entries set using
CommitUrlCacheEntryW is ten minutes. The exempt time can be changed
by setting the expires time parameter in the
INTERNET_CACHE_ENTRY_INFO structure in the call to the
SetUrlCacheEntryInfo function. If the cache storage is full,
CommitUrlCacheEntryW invokes cache cleanup to make space for this new
file. If the cache entry already exists, the function overwrites the
entry if it is not in use. An entry is in use when it has been
retrieved with either RetrieveUrlCacheEntryStream or
RetrieveUrlCacheEntryFile. Clients that add entries to the cache
should set the headers to at least "HTTP/1.0 200 OK\r\n\r\n";
otherwise, Microsoft Internet Explorer and other client applications
should disregard the entry. See Caching for example code calling
CreateUrlCacheEntryW. Like all other aspects of the WinINet API, this
function cannot be safely called from within DllMain or the
constructors and destructors of global objects. Note WinINet does not
support server implementations. In addition, it should not be used
from a service. For server implementations or services use Microsoft
Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines CommitUrlCacheEntry as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CommitUrlCacheEntryBinaryBlob
(no summary)
%group
Win32 wininet
%prm
pwszUrlName, dwType, ftExpireTime, ftModifiedTime, pbBlob, cbBlob
pwszUrlName : [wstr] 
dwType : [int] 
ftExpireTime : [int] 
ftModifiedTime : [int] 
pbBlob : [var] 
cbBlob : [int] 
%inst



%index
CreateMD5SSOHash
The CreateMD5SSOHash function (wininet.h) obtains the Microsoft Passport password, creates an MD5 hash using a specific string, and returns the result.
%group
Win32 wininet
%prm
pszChallengeInfo, pwszRealm, pwszTarget, pbHexHash
pszChallengeInfo : [wstr] Pointer to the wide-character challenge string to use for the MD5 hash.
pwszRealm : [wstr] Pointer to a string that names a realm for which to obtain the password. This parameter is ignored unless pwszTarget is NULL. If both pwszTarget and pwszRealm are NULL, the default realm is used.
pwszTarget : [wstr] Pointer to a string that names an account for which to obtain the password. If pwszTarget is NULL, the realm indicated by pwszRealm is used.
pbHexHash : [var] Pointer to an output buffer into which the MD5 hash is returned in hex string format. This buffer must be at least 33 bytes long.
%inst
The CreateMD5SSOHash function (wininet.h) obtains the Microsoft
Passport password, creates an MD5 hash using a specific string, and
returns the result.

[戻り値]
Returns TRUE if successful, or FALSE otherwise.

[備考]
Once the CreateMD5SSOHash function successfully obtains the Microsoft
Passport password for the specified account or realm, it converts
both the challenge string and the password from wide characters to
multi-byte (generally 8-bit) characters, concatenates them, and uses
the RSA library to generate an MD5 hash from the resulting key. It
then converts the hash into a null-terminated string of 8-bit
hexadecimal digits (using lowercase letters) which it places in the
buffer pointed to by the pbHexHash parameter. The output buffer
pointed to by pbHexHash must therefore be long enough to accept two
bytes for each of the 16 bytes of the hash, plus a terminating null
character, for a total of 33 bytes. Like all other aspects of the
WinINet API, this function cannot be safely called from within
DllMain or the constructors and destructors of global objects. Note
WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).


%index
CreateUrlCacheContainerW
Creates a cache container in the specified cache path to hold cache entries based on the specified name, cache prefix, and container type. (Unicode)
%group
Win32 wininet
%prm
Name, lpCachePrefix, lpszCachePath, KBCacheLimit, dwContainerType, dwOptions, pvBuffer, cbBuffer
Name : [wstr] The name to give to the cache.
lpCachePrefix : [wstr] The cache prefix to base the cache on.
lpszCachePath : [wstr] The cache prefix to create the cache in.
KBCacheLimit : [int] The size limit of the cache in whole kilobytes, or 0 for the default size.
dwContainerType : [int] The container type to base the cache on.
dwOptions : [int] This parameter is reserved and must be 0.
pvBuffer : [intptr] This parameter is reserved and must be NULL.
cbBuffer : [var] This parameter is reserved and must be NULL.
%inst
Creates a cache container in the specified cache path to hold cache
entries based on the specified name, cache prefix, and container
type. (Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get extended error
information, call GetLastError.

[備考]
> [!NOTE] > The winineti.h header defines CreateUrlCacheContainer as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CreateUrlCacheEntryW
Creates a local file name for saving the cache entry based on the specified URL and the file name extension. (Unicode)
%group
Win32 wininet
%prm
lpszUrlName, dwExpectedFileSize, lpszFileExtension, lpszFileName, dwReserved
lpszUrlName : [wstr] Pointer to a string value that contains the name of the URL. The string must contain a value; an empty string will cause CreateUrlCacheEntry to fail. In addition, the string must not contain any escape characters.
dwExpectedFileSize : [int] Expected size of the file needed to store the data that corresponds to the source entity, in TCHARs. If the expected size is unknown, set this value to zero.
lpszFileExtension : [wstr] Pointer to a string value that contains an extension name of the file in the local storage.
lpszFileName : [wstr] Pointer to a buffer that receives the file name. The buffer should be large enough  to store the path of the created file (at least MAX_PATH  characters in length).
dwReserved : [int] This parameter is reserved and must be 0.
%inst
Creates a local file name for saving the cache entry based on the
specified URL and the file name extension. (Unicode)

[戻り値]
If the function succeeds, the function returns TRUE.
If the function fails, it returns FALSE. To get extended error
information, call GetLastError.

[備考]
After CreateUrlCacheEntry is called, the application can write
directly into the file in local storage. When the file is completely
received, the caller should call CommitUrlCacheEntry to commit the
entry in the cache. WinINet attempts to decode Unicode parameters
according to the system code page. Applications should ensure that
Unicode parameters are properly encoded for the system code page.
Applications can set the system code page with InternetSetOption as
shown in the following code example:
This doc was truncated.


%index
CreateUrlCacheEntryExW
(no summary)
%group
Win32 wininet
%prm
lpszUrlName, dwExpectedFileSize, lpszFileExtension, lpszFileName, dwReserved, fPreserveIncomingFileName
lpszUrlName : [wstr] 
dwExpectedFileSize : [int] 
lpszFileExtension : [wstr] 
lpszFileName : [wstr] 
dwReserved : [int] 
fPreserveIncomingFileName : [int] 
%inst



%index
CreateUrlCacheGroup
Generates cache group identifications.
%group
Win32 wininet
%prm
dwFlags, lpReserved
dwFlags : [int] Controls the creation of the cache group. This parameter can be set to CACHEGROUP_FLAG_GIDONLY, which causes CreateUrlCacheGroup to generate a unique GROUPID, but does not create a physical group.
lpReserved : [intptr] This parameter is reserved and must be NULL.
%inst
Generates cache group identifications.

[戻り値]
Returns a valid GROUPID if successful, or FALSE otherwise. To get
specific error information, call GetLastError.

[備考]
Note WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).


%index
DeleteIE3Cache
(no summary)
%group
Win32 wininet
%prm
hwnd, hinst, lpszCmd, nCmdShow
hwnd : [intptr] 
hinst : [intptr] 
lpszCmd : [str] 
nCmdShow : [int] 
%inst



%index
DeleteUrlCacheContainerW
Deletes a cache container (which contains cache entries) based on the specified name. (Unicode)
%group
Win32 wininet
%prm
Name, dwOptions
Name : [wstr] The name of the cache container to be deleted.
dwOptions : [int] This parameter is reserved, and must be 0.
%inst
Deletes a cache container (which contains cache entries) based on the
specified name. (Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get extended error
information, call GetLastError.

[備考]
Note WinINet does not support server implementations. In addition, it
should not be used from a service nor when impersonating a security
context. For server implementations or services use Microsoft Windows
HTTP Services (WinHTTP).
> [!NOTE] > The winineti.h header defines DeleteUrlCacheContainer as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
DeleteUrlCacheEntry
The DeleteUrlCacheEntry function (wininet.h) removes the file associated with the source name from the cache, if the file exists.
%group
Win32 wininet
%prm
lpszUrlName
lpszUrlName : [str] Pointer to a string that contains the name of the source that corresponds to the cache entry.
%inst
The DeleteUrlCacheEntry function (wininet.h) removes the file
associated with the source name from the cache, if the file exists.

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get extended error
information, call GetLastError. Possible error values include the
following.
This doc was truncated.

[備考]
Note WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).


%index
DeleteUrlCacheGroup
Releases the specified GROUPID and any associated state in the cache index file.
%group
Win32 wininet
%prm
GroupId, dwFlags, lpReserved
GroupId : [int64] ID of the cache group to be released.
dwFlags : [int] Controls the cache group deletion. This can be set to any member of the cache group constants. When this parameter is set to CACHEGROUP_FLAG_FLUSHURL_ONDELETE, it causes DeleteUrlCacheGroup to delete all of the cache entries associated with this group, unless the entry belongs to another group.
lpReserved : [intptr] This parameter is reserved and must be NULL.
%inst
Releases the specified GROUPID and any associated state in the cache
index file.

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get specific error
information, call GetLastError.

[備考]
Note WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).


%index
DeleteWpadCacheForNetworks
(no summary)
%group
Win32 wininet
%prm
param0
param0 : [int] 
%inst



%index
DetectAutoProxyUrl
The DetectAutoProxyUrl function (wininet.h) attempts to determine the location of a WPAD autoproxy script.
%group
Win32 wininet
%prm
pszAutoProxyUrl, cchAutoProxyUrl, dwDetectFlags
pszAutoProxyUrl : [str] Pointer to a buffer to receive the URL from which a WPAD autoproxy script can be downloaded.
cchAutoProxyUrl : [int] Size of the buffer pointed to by lpszAutoProxyUrl, in bytes.
dwDetectFlags : [int] 
%inst
The DetectAutoProxyUrl function (wininet.h) attempts to determine the
location of a WPAD autoproxy script.

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get extended error
information, call GetLastError.

[備考]
Note WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).


%index
FindCloseUrlCache
Closes the specified cache enumeration handle.
%group
Win32 wininet
%prm
hEnumHandle
hEnumHandle : [intptr] Handle returned by a previous call to the FindFirstUrlCacheEntry function.
%inst
Closes the specified cache enumeration handle.

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get extended error
information, call GetLastError.

[備考]
Note WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).


%index
FindFirstUrlCacheContainerW
(no summary)
%group
Win32 wininet
%prm
pdwModified, lpContainerInfo, lpcbContainerInfo, dwOptions
pdwModified : [var] 
lpContainerInfo : [var] 
lpcbContainerInfo : [var] 
dwOptions : [int] 
%inst



%index
FindFirstUrlCacheEntryW
Begins the enumeration of the Internet cache. (Unicode)
%group
Win32 wininet
%prm
lpszUrlSearchPattern, lpFirstCacheEntryInfo, lpcbCacheEntryInfo
lpszUrlSearchPattern : [wstr] A pointer to a string that contains the source name pattern to search for. This parameter can only be set to "cookie:", "visited:", or NULL. Set this parameter to "cookie:" to enumerate the cookies or "visited:" to enumerate the URL History entries in the cache. If this parameter is NULL, FindFirstUrlCacheEntry returns all content entries in the cache.
lpFirstCacheEntryInfo : [var] Pointer to an INTERNET_CACHE_ENTRY_INFO structure.
lpcbCacheEntryInfo : [var] Pointer to a variable that specifies the size of the lpFirstCacheEntryInfo buffer, in bytes. When the function returns, the variable contains the number of bytes copied to the buffer, or the required size needed to retrieve the cache entry, in bytes.
%inst
Begins the enumeration of the Internet cache. (Unicode)

[戻り値]
Returns a handle that the application can use in the
FindNextUrlCacheEntry function to retrieve subsequent entries in the
cache. If the function fails, the return value is NULL. To get
extended error information, call GetLastError.
ERROR_INSUFFICIENT_BUFFER indicates that the size of
lpFirstCacheEntryInfo as specified by
lpdwFirstCacheEntryInfoBufferSize is not sufficient to contain all
the information. The value returned in
lpdwFirstCacheEntryInfoBufferSize indicates the buffer size necessary
to contain all the information.

[備考]
The handle returned from FindFirstUrlCacheEntry is used in all
subsequent calls to FindNextUrlCacheEntry. At the end of the
enumeration, the application should call FindCloseUrlCache.
FindFirstUrlCacheEntry and FindNextUrlCacheEntry return variable size
information. If ERROR_INSUFFICIENT_BUFFER is returned, the
application should allocate a buffer of the size specified by
lpdwFirstCacheEntryInfoBufferSize. For more information, see Using
Buffers. Like all other aspects of the WinINet API, this function
cannot be safely called from within DllMain or the constructors and
destructors of global objects. Note WinINet does not support server
implementations. In addition, it should not be used from a service.
For server implementations or services use Microsoft Windows HTTP
Services (WinHTTP).
> [!NOTE] > The wininet.h header defines FindFirstUrlCacheEntry as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
FindFirstUrlCacheEntryExW
Starts a filtered enumeration of the Internet cache. (Unicode)
%group
Win32 wininet
%prm
lpszUrlSearchPattern, dwFlags, dwFilter, GroupId, lpFirstCacheEntryInfo, lpcbCacheEntryInfo, lpGroupAttributes, lpcbGroupAttributes, lpReserved
lpszUrlSearchPattern : [wstr] A pointer to a string that contains the source name pattern to search for. This parameter can only be set to "cookie:", "visited:", or NULL. Set this parameter to "cookie:" to enumerate the cookies or "visited:" to enumerate the URL History entries in the cache. If this parameter is NULL, FindFirstUrlCacheEntryEx returns all content entries in the cache.
dwFlags : [int] Controls the enumeration. No flags are currently implemented; this parameter must be set to zero.
dwFilter : [int] A bitmask indicating the type of cache entry and its properties. The cache entry types include: history entries (URLHISTORY_CACHE_ENTRY),  cookie entries  (COOKIE_CACHE_ENTRY), and normal cached content (NORMAL_CACHE_ENTRY). This parameter can be zero or more of the following property flags, and  cache type flags listed below.
GroupId : [int64] ID of the cache group to be enumerated. Set this parameter to zero to enumerate all entries that are not grouped.
lpFirstCacheEntryInfo : [var] Pointer to a INTERNET_CACHE_ENTRY_INFO structure to receive the cache entry information.
lpcbCacheEntryInfo : [var] Pointer to variable that indicates the size of the structure referenced by the lpFirstCacheEntryInfo parameter, in bytes.
lpGroupAttributes : [intptr] This parameter is reserved and must be NULL.
lpcbGroupAttributes : [var] This parameter is reserved and must be NULL.
lpReserved : [intptr] This parameter is reserved and must be NULL.
%inst
Starts a filtered enumeration of the Internet cache. (Unicode)

[戻り値]
Returns a valid handle if successful, or NULL otherwise. To get
specific error information, call GetLastError. If the function finds
no matching files, GetLastError returns ERROR_NO_MORE_FILES.

[備考]
The handle returned from FindFirstUrlCacheEntryEx is used in all
subsequent calls to FindNextUrlCacheEntryEx. At the end of the
enumeration, the application should call FindCloseUrlCache. Like all
other aspects of the WinINet API, this function cannot be safely
called from within DllMain or the constructors and destructors of
global objects. Note WinINet does not support server implementations.
In addition, it should not be used from a service. For server
implementations or services use Microsoft Windows HTTP Services
(WinHTTP).
> [!NOTE] > The wininet.h header defines FindFirstUrlCacheEntryEx as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
FindFirstUrlCacheGroup
Initiates the enumeration of the cache groups in the Internet cache.
%group
Win32 wininet
%prm
dwFlags, dwFilter, lpSearchCondition, dwSearchCondition, lpGroupId, lpReserved
dwFlags : [int] This parameter is reserved and must be 0.
dwFilter : [int] 
lpSearchCondition : [intptr] This parameter is reserved and must be NULL.
dwSearchCondition : [int] This parameter is reserved and must be 0.
lpGroupId : [var] Pointer to the ID of the first cache group that matches the search criteria.
lpReserved : [intptr] This parameter is reserved and must be NULL.
%inst
Initiates the enumeration of the cache groups in the Internet cache.

[戻り値]
Returns a valid handle to the first item in the enumeration if
successful, or NULL otherwise. To get specific error information,
call GetLastError. If the function finds no matching files,
GetLastError returns ERROR_NO_MORE_FILES.

[備考]
The handle returned from FindFirstUrlCacheGroup is used in subsequent
calls to FindNextUrlCacheGroup. At the end of the enumeration, the
application should call FindCloseUrlCache. Like all other aspects of
the WinINet API, this function cannot be safely called from within
DllMain or the constructors and destructors of global objects. Note
WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).


%index
FindNextUrlCacheContainerW
(no summary)
%group
Win32 wininet
%prm
hEnumHandle, lpContainerInfo, lpcbContainerInfo
hEnumHandle : [intptr] 
lpContainerInfo : [var] 
lpcbContainerInfo : [var] 
%inst



%index
FindNextUrlCacheEntryW
Retrieves the next entry in the Internet cache. (Unicode)
%group
Win32 wininet
%prm
hEnumHandle, lpNextCacheEntryInfo, lpcbCacheEntryInfo
hEnumHandle : [intptr] Handle to the enumeration obtained from a previous call to FindFirstUrlCacheEntry.
lpNextCacheEntryInfo : [var] Pointer to an INTERNET_CACHE_ENTRY_INFO structure that receives information about the cache entry.
lpcbCacheEntryInfo : [var] Pointer to a variable that specifies the size of the lpNextCacheEntryInfo buffer, in bytes. When the function returns, the variable contains the number of bytes copied to the buffer, or the size of the buffer required to retrieve the cache entry, in bytes.
%inst
Retrieves the next entry in the Internet cache. (Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get extended error
information, call GetLastError. Possible error values include the
following.
This doc was truncated.

[備考]
Continue to call FindNextUrlCacheEntry until the last item in the
cache is returned. Like all other aspects of the WinINet API, this
function cannot be safely called from within DllMain or the
constructors and destructors of global objects. Note WinINet does not
support server implementations. In addition, it should not be used
from a service. For server implementations or services use Microsoft
Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines FindNextUrlCacheEntry as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
FindNextUrlCacheEntryExW
Finds the next cache entry in a cache enumeration started by the FindFirstUrlCacheEntryEx function. (Unicode)
%group
Win32 wininet
%prm
hEnumHandle, lpNextCacheEntryInfo, lpcbCacheEntryInfo, lpGroupAttributes, lpcbGroupAttributes, lpReserved
hEnumHandle : [intptr] Handle returned by FindFirstUrlCacheEntryEx, which started a cache enumeration.
lpNextCacheEntryInfo : [var] Pointer to the INTERNET_CACHE_ENTRY_INFO structure that receives the cache entry information.
lpcbCacheEntryInfo : [var] Pointer to a variable that indicates the size of the buffer, in bytes.
lpGroupAttributes : [intptr] This parameter is reserved and must be NULL.
lpcbGroupAttributes : [var] This parameter is reserved and must be NULL.
lpReserved : [intptr] This parameter is reserved.
%inst
Finds the next cache entry in a cache enumeration started by the
FindFirstUrlCacheEntryEx function. (Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get specific error
information, call GetLastError.

[備考]
Continue to call FindNextUrlCacheEntryEx until the last item in the
cache is returned. Like all other aspects of the WinINet API, this
function cannot be safely called from within DllMain or the
constructors and destructors of global objects. Note WinINet does not
support server implementations. In addition, it should not be used
from a service. For server implementations or services use Microsoft
Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines FindNextUrlCacheEntryEx as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
FindNextUrlCacheGroup
Retrieves the next cache group in a cache group enumeration started by FindFirstUrlCacheGroup.
%group
Win32 wininet
%prm
hFind, lpGroupId, lpReserved
hFind : [intptr] The cache group enumeration handle, which is returned by FindFirstUrlCacheGroup.
lpGroupId : [var] Pointer to a variable that receives the cache group identifier.
lpReserved : [intptr] This parameter is reserved and must be NULL.
%inst
Retrieves the next cache group in a cache group enumeration started
by FindFirstUrlCacheGroup.

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get specific error
information, call GetLastError.

[備考]
Continue to call FindNextUrlCacheGroup until the last item in the
cache is returned. Like all other aspects of the WinINet API, this
function cannot be safely called from within DllMain or the
constructors and destructors of global objects. Note WinINet does not
support server implementations. In addition, it should not be used
from a service. For server implementations or services use Microsoft
Windows HTTP Services (WinHTTP).


%index
FreeUrlCacheSpaceW
Frees space in the cache. (Unicode)
%group
Win32 wininet
%prm
lpszCachePath, dwSize, dwFilter
lpszCachePath : [wstr] The path for the cache.
dwSize : [int] The percentage of the cache to free (in the range 1 to 100, inclusive).
dwFilter : [int] This parameter is reserved, and must be 0.
%inst
Frees space in the cache. (Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get extended error
information, call GetLastError.

[備考]
Note WinINet does not support server implementations. In addition, it
should not be used from a service nor when impersonating a security
context. For server implementations or services use Microsoft Windows
HTTP Services (WinHTTP).
> [!NOTE] > The winineti.h header defines FreeUrlCacheSpace as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
FtpCommandW
Sends commands directly to an FTP server. (Unicode)
%group
Win32 wininet
%prm
hConnect, fExpectResponse, dwFlags, lpszCommand, dwContext, phFtpCommand
hConnect : [intptr] A handle returned from a call to InternetConnect.
fExpectResponse : [int] A Boolean value that indicates whether the application expects a data connection to be established by the FTP server. This must be set to TRUE if a data connection is expected, or FALSE otherwise.
dwFlags : [int] 
lpszCommand : [wstr] A pointer to a string that contains the command to send to the FTP server.
dwContext : [int] A pointer to a variable that contains an application-defined value used to identify the application context in callback operations.
phFtpCommand : [var] A pointer to a handle that is created if a valid data socket is opened. The fExpectResponse parameter must be set to TRUE for phFtpCommand to be filled.
%inst
Sends commands directly to an FTP server. (Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get a specific
error message, call GetLastError.

[備考]
GetLastError can return ERROR_INTERNET_NO_DIRECT_ACCESS if the client
application is offline. If one or more of the parameters are invalid,
GetLastError will return ERROR_INVALID_PARAMETER. Like all other
aspects of the WinINet API, this function cannot be safely called
from within DllMain or the constructors and destructors of global
objects. Note WinINet does not support server implementations. In
addition, it should not be used from a service. For server
implementations or services use Microsoft Windows HTTP Services
(WinHTTP).
> [!NOTE] > The wininet.h header defines FtpCommand as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
FtpCreateDirectoryW
Creates a new directory on the FTP server. (Unicode)
%group
Win32 wininet
%prm
hConnect, lpszDirectory
hConnect : [intptr] Handle returned by a previous call to InternetConnect using INTERNET_SERVICE_FTP.
lpszDirectory : [wstr] Pointer to a null-terminated string that contains the name of the directory to be created. This can be either a fully qualified path or a name relative to the current directory.
%inst
Creates a new directory on the FTP server. (Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get a specific
error message, call GetLastError. If the error message indicates that
the FTP server denied the request to create a directory, use
InternetGetLastResponseInfo to determine why.

[備考]
An application should use FtpGetCurrentDirectory to determine the
remote site's current working directory instead of assuming that the
remote system uses a hierarchical naming scheme for directories. The
lpszDirectory parameter can be either partially or fully qualified
file names relative to the current directory. Like all other aspects
of the WinINet API, this function cannot be safely called from within
DllMain or the constructors and destructors of global objects. Note
WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines FtpCreateDirectory as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
FtpDeleteFileW
Deletes a file stored on the FTP server. (Unicode)
%group
Win32 wininet
%prm
hConnect, lpszFileName
hConnect : [intptr] Handle returned by a previous call to InternetConnect using INTERNET_SERVICE_FTP.
lpszFileName : [wstr] Pointer to a null-terminated string that contains the name of the file to be deleted.
%inst
Deletes a file stored on the FTP server. (Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get a specific
error message, call GetLastError.

[備考]
The lpszFileName parameter can be either partially or fully qualified
file names relative to the current directory. Like all other aspects
of the WinINet API, this function cannot be safely called from within
DllMain or the constructors and destructors of global objects. Note
WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines FtpDeleteFile as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
FtpFindFirstFileW
Searches the specified directory of the given FTP session. File and directory entries are returned to the application in the WIN32_FIND_DATA structure. (Unicode)
%group
Win32 wininet
%prm
hConnect, lpszSearchFile, lpFindFileData, dwFlags, dwContext
hConnect : [intptr] Handle to an FTP session returned from InternetConnect.
lpszSearchFile : [wstr] Pointer to a null-terminated string that specifies a valid directory path or file name for the FTP server's file system. The string can contain wildcards, but no blank spaces are allowed. If the value of lpszSearchFile is NULL or if it is an empty string, the function  finds the first file in the current directory on the server.
lpFindFileData : [var] Pointer to a WIN32_FIND_DATA structure that receives information about the found file or directory.
dwFlags : [int] 
dwContext : [int] Pointer to a variable that specifies the application-defined value that associates this search with any application data. This parameter is used only if the application has already called InternetSetStatusCallback to set up a status callback function.
%inst
Searches the specified directory of the given FTP session. File and
directory entries are returned to the application in the
WIN32_FIND_DATA structure. (Unicode)

[戻り値]
Returns a valid handle for the request if the directory enumeration
was started successfully, or returns NULL otherwise. To get a
specific error message, call GetLastError. If GetLastError returns
ERROR_INTERNET_EXTENDED_ERROR, as in the case where the function
finds no matching files, call the InternetGetLastResponseInfo
function to retrieve the extended error text, as documented in
Handling Errors.

[備考]
For FtpFindFirstFile, file times returned in the WIN32_FIND_DATA
structure are in the local time zone, not in a coordinated universal
time (UTC) format. FtpFindFirstFile is similar to the FindFirstFile
function. Note, however, that only one FtpFindFirstFile can occur at
a time within a given FTP session. The enumerations, therefore, are
correlated with the FTP session handle. This is because the FTP
protocol allows only a single directory enumeration per session.
After calling FtpFindFirstFile and until calling InternetCloseHandle,
the application cannot call FtpFindFirstFile again on the given FTP
session handle. If a call is made to FtpFindFirstFile on that handle,
the function fails with ERROR_FTP_TRANSFER_IN_PROGRESS. After the
calling application has finished using the HINTERNET handle returned
by FtpFindFirstFile, it must be closed using the InternetCloseHandle
function. After beginning a directory enumeration with
FtpFindFirstFile, the InternetFindNextFile function can be used to
continue the enumeration. Because the FTP protocol provides no
standard means of enumerating, some of the common information about
files, such as file creation date and time, is not always available
or correct. When this happens, FtpFindFirstFile and
InternetFindNextFile fill in unavailable information with a best
guess based on available information. For example, creation and last
access dates are often the same as the file's modification date. The
application cannot call FtpFindFirstFile between calls to FtpOpenFile
and InternetCloseHandle. Like all other aspects of the WinINet API,
this function cannot be safely called from within DllMain or the
constructors and destructors of global objects. Note WinINet does not
support server implementations. In addition, it should not be used
from a service. For server implementations or services use Microsoft
Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines FtpFindFirstFile as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
FtpGetCurrentDirectoryW
Retrieves the current directory for the specified FTP session. (Unicode)
%group
Win32 wininet
%prm
hConnect, lpszCurrentDirectory, lpdwCurrentDirectory
hConnect : [intptr] Handle to an FTP session.
lpszCurrentDirectory : [wstr] Pointer to a null-terminated string that receives the absolute path of the current directory.
lpdwCurrentDirectory : [var] Pointer to a variable that specifies the length of the buffer, in TCHARs. The buffer length must include room for a terminating null character. Using a length of MAX_PATH is sufficient for all paths. When the function returns, the variable receives the number of characters copied into the buffer.
%inst
Retrieves the current directory for the specified FTP session.
(Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get a specific
error message, call GetLastError.

[備考]
If the lpszCurrentDirectory buffer is not large enough,
lpdwCurrentDirectory receives the number of bytes required to
retrieve the full, current directory name. Like all other aspects of
the WinINet API, this function cannot be safely called from within
DllMain or the constructors and destructors of global objects. Note
WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines FtpGetCurrentDirectory as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
FtpGetFileW
Retrieves a file from the FTP server and stores it under the specified file name, creating a new local file in the process. (Unicode)
%group
Win32 wininet
%prm
hConnect, lpszRemoteFile, lpszNewFile, fFailIfExists, dwFlagsAndAttributes, dwFlags, dwContext
hConnect : [intptr] Handle to an FTP session.
lpszRemoteFile : [wstr] Pointer to a null-terminated string that contains the name of the file to be retrieved.
lpszNewFile : [wstr] Pointer to a null-terminated string that contains the name of the file to be created on the local system.
fFailIfExists : [int] Indicates whether the function should proceed if a local file of the specified name already exists. If fFailIfExists is TRUE and the local file exists, FtpGetFile fails.
dwFlagsAndAttributes : [int] File attributes for the new file. This parameter can be any combination of the FILE_ATTRIBUTE_* flags used by the CreateFile function.
dwFlags : [int] Controls how the function will handle the file download. The first set of flag values indicates the conditions under which the transfer occurs. These transfer type flags can be used in combination with the second set of flags that control caching.
dwContext : [int] Pointer to a variable that contains the application-defined value that associates this search with any application data. This is used only if the application has already called InternetSetStatusCallback to set up a status callback function.
%inst
Retrieves a file from the FTP server and stores it under the
specified file name, creating a new local file in the process.
(Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get a specific
error message, call GetLastError.

[備考]
FtpGetFile is a high-level routine that handles all the bookkeeping
and overhead associated with reading a file from an FTP server and
storing it locally. An application that needs to retrieve file data
only or that requires close control over the file transfer should use
the FtpOpenFile and InternetReadFile functions. If the dwFlags
parameter specifies FTP_TRANSFER_TYPE_ASCII, translation of the file
data converts control and formatting characters to local equivalents.
The default transfer is binary mode, where the file is downloaded in
the same format as it is stored on the server. Both lpszRemoteFile
and lpszNewFile can be either partially or fully qualified file names
relative to the current directory. Like all other aspects of the
WinINet API, this function cannot be safely called from within
DllMain or the constructors and destructors of global objects. Note
WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines FtpGetFile as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
FtpGetFileEx
(no summary)
%group
Win32 wininet
%prm
hFtpSession, lpszRemoteFile, lpszNewFile, fFailIfExists, dwFlagsAndAttributes, dwFlags, dwContext
hFtpSession : [intptr] 
lpszRemoteFile : [str] 
lpszNewFile : [wstr] 
fFailIfExists : [int] 
dwFlagsAndAttributes : [int] 
dwFlags : [int] 
dwContext : [int] 
%inst



%index
FtpGetFileSize
Retrieves the file size of the requested FTP resource.
%group
Win32 wininet
%prm
hFile, lpdwFileSizeHigh
hFile : [intptr] Handle returned from a call to FtpOpenFile.
lpdwFileSizeHigh : [var] Pointer to the high-order unsigned long integer of the file size of the requested FTP resource.
%inst
Retrieves the file size of the requested FTP resource.

[戻り値]
Returns the low-order unsigned long integer of the file size of the
requested FTP resource.

[備考]
Note WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).


%index
FtpOpenFileW
Initiates access to a remote file on an FTP server for reading or writing. (Unicode)
%group
Win32 wininet
%prm
hConnect, lpszFileName, dwAccess, dwFlags, dwContext
hConnect : [intptr] Handle to an FTP session.
lpszFileName : [wstr] Pointer to a null-terminated string that contains the name of the file to be accessed.
dwAccess : [int] File  access. This parameter can be GENERIC_READ or GENERIC_WRITE, but not both.
dwFlags : [int] Conditions under which the transfers occur. The application should select one transfer type and any of the flags that indicate how the caching of the file will be controlled.
dwContext : [int] Pointer to a variable that contains the application-defined value that associates this search with any application data. This is only used if the application has already called InternetSetStatusCallback to set up a status callback function.
%inst
Initiates access to a remote file on an FTP server for reading or
writing. (Unicode)

[戻り値]
Returns a handle if successful, or NULL otherwise. To retrieve a
specific error message, call GetLastError.

[備考]
After calling FtpOpenFile and until calling InternetCloseHandle, all
other calls to FTP functions on the same FTP session handle will fail
and set the error message to ERROR_FTP_TRANSFER_IN_PROGRESS. After
the calling application has finished using the HINTERNET handle
returned by FtpOpenFile, it must be closed using the
InternetCloseHandle function. Only one file can be open in a single
FTP session. Therefore, no file handle is returned and the
application simply uses the FTP session handle when necessary. The
lpszFileName parameter can be either a partially or fully qualified
file name relative to the current directory. Like all other aspects
of the WinINet API, this function cannot be safely called from within
DllMain or the constructors and destructors of global objects. Note
WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines FtpOpenFile as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
FtpPutFileW
Stores a file on the FTP server. (Unicode)
%group
Win32 wininet
%prm
hConnect, lpszLocalFile, lpszNewRemoteFile, dwFlags, dwContext
hConnect : [intptr] Handle to an FTP session.
lpszLocalFile : [wstr] Pointer to a null-terminated string that contains the name of the file to be sent from the local system.
lpszNewRemoteFile : [wstr] Pointer to a null-terminated string that contains the name of the file to be created on the remote system.
dwFlags : [int] Conditions under which the transfers occur. The application should select one transfer type and any of the flags that control how the caching of the file will be controlled.
dwContext : [int] Pointer to a variable that contains the application-defined value that associates this search with any application data. This parameter is used only if the application has already called InternetSetStatusCallback to set up a status callback.
%inst
Stores a file on the FTP server. (Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get a specific
error message, call GetLastError.

[備考]
FtpPutFile is a high-level routine that handles all the bookkeeping
and overhead associated with reading a file locally and storing it on
an FTP server. An application that needs to send file data only, or
that requires close control over the file transfer, should use the
FtpOpenFile and InternetWriteFile functions. If the dwFlags parameter
specifies FILE_TRANSFER_TYPE_ASCII, translation of the file data
converts control and formatting characters to local equivalents. Both
lpszNewRemoteFile and lpszLocalFile can be either partially or fully
qualified file names relative to the current directory. Like all
other aspects of the WinINet API, this function cannot be safely
called from within DllMain or the constructors and destructors of
global objects. Note WinINet does not support server implementations.
In addition, it should not be used from a service. For server
implementations or services use Microsoft Windows HTTP Services
(WinHTTP).
> [!NOTE] > The wininet.h header defines FtpPutFile as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
FtpPutFileEx
(no summary)
%group
Win32 wininet
%prm
hFtpSession, lpszLocalFile, lpszNewRemoteFile, dwFlags, dwContext
hFtpSession : [intptr] 
lpszLocalFile : [wstr] 
lpszNewRemoteFile : [str] 
dwFlags : [int] 
dwContext : [int] 
%inst



%index
FtpRemoveDirectoryW
Removes the specified directory on the FTP server. (Unicode)
%group
Win32 wininet
%prm
hConnect, lpszDirectory
hConnect : [intptr] Handle to an FTP session.
lpszDirectory : [wstr] Pointer to a null-terminated string that contains the name of the directory to be removed. This can be either a fully qualified path or a name relative to the current directory.
%inst
Removes the specified directory on the FTP server. (Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get a specific
error message, call GetLastError. If the error message indicates that
the FTP server denied the request to remove a directory, use
InternetGetLastResponseInfo to determine why.

[備考]
An application should use FtpGetCurrentDirectory to determine the
remote site's current working directory, instead of assuming that the
remote system uses a hierarchical naming scheme for directories. The
lpszDirectory parameter can be either partially or fully qualified
file names relative to the current directory. Like all other aspects
of the WinINet API, this function cannot be safely called from within
DllMain or the constructors and destructors of global objects. Note
WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines FtpRemoveDirectory as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
FtpRenameFileW
Renames a file stored on the FTP server. (Unicode)
%group
Win32 wininet
%prm
hConnect, lpszExisting, lpszNew
hConnect : [intptr] Handle to an FTP session.
lpszExisting : [wstr] Pointer to a null-terminated string that contains the name of the file to be renamed.
lpszNew : [wstr] Pointer to a null-terminated string that contains the new name for the remote file.
%inst
Renames a file stored on the FTP server. (Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get a specific
error message, call GetLastError.

[備考]
The lpszExisting and lpszNew parameters can be either partially or
fully qualified file names relative to the current directory. Like
all other aspects of the WinINet API, this function cannot be safely
called from within DllMain or the constructors and destructors of
global objects. Note WinINet does not support server implementations.
In addition, it should not be used from a service. For server
implementations or services use Microsoft Windows HTTP Services
(WinHTTP).
> [!NOTE] > The wininet.h header defines FtpRenameFile as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
FtpSetCurrentDirectoryW
Changes to a different working directory on the FTP server. (Unicode)
%group
Win32 wininet
%prm
hConnect, lpszDirectory
hConnect : [intptr] Handle to an FTP session.
lpszDirectory : [wstr] Pointer to a null-terminated string that contains the name of the directory to become the current working directory. This can be either a fully qualified path or a name relative to the current directory.
%inst
Changes to a different working directory on the FTP server. (Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get a specific
error message, call GetLastError. If the error message indicates that
the FTP server denied the request to change a directory, use
InternetGetLastResponseInfo to determine why.

[備考]
An application should use FtpGetCurrentDirectory to determine the
remote site's current working directory, instead of assuming that the
remote system uses a hierarchical naming scheme for directories. The
lpszDirectory parameter can be either partially or fully qualified
file names relative to the current directory. Like all other aspects
of the WinINet API, this function cannot be safely called from within
DllMain or the constructors and destructors of global objects. Note
WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines FtpSetCurrentDirectory as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetUrlCacheConfigInfoW
Retrieves information about cache configuration. (Unicode)
%group
Win32 wininet
%prm
lpCacheConfigInfo, lpcbCacheConfigInfo, dwFieldControl
lpCacheConfigInfo : [var] A pointer to an INTERNET_CACHE_CONFIG_INFO structure that receives information about the cache configuration. The dwStructSize field of the structure should be initialized to the size of INTERNET_CACHE_CONFIG_INFO.
lpcbCacheConfigInfo : [var] This parameter is reserved and must be NULL.
dwFieldControl : [int] 
%inst
Retrieves information about cache configuration. (Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get extended error
information, call GetLastError.

[備考]
Note WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).
> [!NOTE] > The winineti.h header defines GetUrlCacheConfigInfo as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetUrlCacheEntryBinaryBlob
(no summary)
%group
Win32 wininet
%prm
pwszUrlName, dwType, pftExpireTime, pftAccessTime, pftModifiedTime, ppbBlob, pcbBlob
pwszUrlName : [wstr] 
dwType : [var] 
pftExpireTime : [var] 
pftAccessTime : [var] 
pftModifiedTime : [var] 
ppbBlob : [var] 
pcbBlob : [var] 
%inst



%index
GetUrlCacheEntryInfoW
Retrieves information about a cache entry. (Unicode)
%group
Win32 wininet
%prm
lpszUrlName, lpCacheEntryInfo, lpcbCacheEntryInfo
lpszUrlName : [wstr] A pointer to a null-terminated string that contains the name of the cache entry. The name string should not contain any escape characters.
lpCacheEntryInfo : [var] A pointer to an INTERNET_CACHE_ENTRY_INFO structure that receives information about the cache entry. A buffer should be allocated for this parameter. Since the required size of the buffer is not known in advance,  it is best to allocate a buffer adequate to handle the size of most INTERNET_CACHE_ENTRY_INFO entries. There is no cache entry size limit, so applications that need to enumerate the cache must be prepared to allocate variable-sized buffers.
lpcbCacheEntryInfo : [var] A pointer to a variable that specifies the size of the lpCacheEntryInfo buffer, in bytes. When the function returns, the variable contains the number of bytes copied to the buffer, or the required size of the buffer, in bytes.
%inst
Retrieves information about a cache entry. (Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get extended error
information, call GetLastError. Possible error values include the
following.
This doc was truncated.

[備考]
GetUrlCacheEntryInfo does not do any URL parsing, so a URL containing
an anchor (#) will not be found in the cache, even if the resource is
cached. For example, if the URL
`http://example.com/example.htm#sample` is passed, the function
returns ERROR_FILE_NOT_FOUND even if `http://example.com/example.htm`
is in the cache. Like all other aspects of the WinINet API, this
function cannot be safely called from within DllMain or the
constructors and destructors of global objects. Note WinINet does not
support server implementations. In addition, it should not be used
from a service. For server implementations or services use Microsoft
Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines GetUrlCacheEntryInfo as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetUrlCacheEntryInfoExW
Retrieves information on the cache entry associated with the specified URL, taking into account any redirections that are applied in offline mode by the HttpSendRequest function. (Unicode)
%group
Win32 wininet
%prm
lpszUrl, lpCacheEntryInfo, lpcbCacheEntryInfo, lpszRedirectUrl, lpcbRedirectUrl, lpReserved, dwFlags
lpszUrl : [wstr] A pointer to a null-terminated string that contains the name of the cache entry. The name string should not contain any escape characters.
lpCacheEntryInfo : [var] A pointer to an INTERNET_CACHE_ENTRY_INFO structure that receives information about the cache entry. A buffer should be allocated for this parameter. Since the required size of the buffer is not known in advance,  it is best to allocate a buffer adequate to handle the size of most INTERNET_CACHE_ENTRY_INFO entries. There is no cache entry size limit, so applications that need to enumerate the cache must be prepared to allocate variable-sized buffers.
lpcbCacheEntryInfo : [var] Pointer to a variable that specifies the size of the lpCacheEntryInfo buffer, in bytes. When the function returns, the variable contains the number of bytes copied to the buffer, or the required size of the buffer in bytes.
lpszRedirectUrl : [wstr] This parameter is reserved and must be NULL.
lpcbRedirectUrl : [var] This parameter is reserved and must be NULL.
lpReserved : [intptr] This parameter is reserved and must be NULL.
dwFlags : [int] This parameter is reserved and must be 0.
%inst
Retrieves information on the cache entry associated with the
specified URL, taking into account any redirections that are applied
in offline mode by the HttpSendRequest function. (Unicode)

[戻り値]
Returns TRUE if the URL was located, or FALSE otherwise. Call
GetLastError for specific error information. Possible errors include
the following.
This doc was truncated.

[備考]
GetUrlCacheEntryInfoEx does not do any URL parsing, so a URL
containing an anchor (#) will not be found in the cache, even if the
resource is cached. For example, if the URL
`http://example.com/example.htm#sample` is passed, the function
returns ERROR_FILE_NOT_FOUND even if `http://example.com/example.htm`
is in the cache. Like all other aspects of the WinINet API, this
function cannot be safely called from within DllMain or the
constructors and destructors of global objects. Note WinINet does not
support server implementations. In addition, it should not be used
from a service. For server implementations or services use Microsoft
Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines GetUrlCacheEntryInfoEx as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetUrlCacheGroupAttributeW
Retrieves the attribute information of the specified cache group. (Unicode)
%group
Win32 wininet
%prm
gid, dwFlags, dwAttributes, lpGroupInfo, lpcbGroupInfo, lpReserved
gid : [int64] Identifier of the cache group.
dwFlags : [int] This parameter is reserved and must be 0.
dwAttributes : [int] 
lpGroupInfo : [var] Pointer to an INTERNET_CACHE_GROUP_INFO structure that receives the requested information.
lpcbGroupInfo : [var] Pointer to a variable that contains the size of the lpGroupInfo buffer. When the function returns, the variable contains the number of bytes copied to the buffer, or the required size of the buffer, in bytes.
lpReserved : [intptr] This parameter is reserved and must be NULL.
%inst
Retrieves the attribute information of the specified cache group.
(Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get specific error
information, call GetLastError.

[備考]
Note WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines GetUrlCacheGroupAttribute as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetUrlCacheHeaderData
(no summary)
%group
Win32 wininet
%prm
nIdx, lpdwData
nIdx : [int] 
lpdwData : [var] 
%inst



%index
GopherCreateLocatorW
Creates a Gopher or Gopher+ locator string from the selector string's component parts. (Unicode)
%group
Win32 wininet
%prm
lpszHost, nServerPort, lpszDisplayString, lpszSelectorString, dwGopherType, lpszLocator, lpdwBufferLength
lpszHost : [wstr] Pointer to a null-terminated string that contains the name of the host, or a dotted-decimal IP address (such as 198.105.232.1).
nServerPort : [int] Port number on which the Gopher server at lpszHost lives, in host byte order. If nServerPort is INTERNET_INVALID_PORT_NUMBER, the default Gopher port is used.
lpszDisplayString : [wstr] Pointer to a null-terminated string that contains the Gopher document or directory to be displayed. If this parameter is NULL, the function returns the default directory for the Gopher server.
lpszSelectorString : [wstr] Pointer to the selector string to send to the Gopher server in order to retrieve information. This parameter can be NULL.
dwGopherType : [int] Determines whether lpszSelectorString refers to a directory or document, and whether the request is Gopher+ or Gopher. The default value, GOPHER_TYPE_DIRECTORY, is used if the value of dwGopherType is zero. This can be one of the gopher type values.
lpszLocator : [wstr] Pointer to a buffer  that receives the locator string. If lpszLocator is NULL, lpdwBufferLength receives the necessary buffer length, but the function performs no other processing.
lpdwBufferLength : [var] Pointer to a variable that contains the length of the lpszLocator buffer, in characters. When the function returns, this parameter receives the number of characters written to the buffer. If GetLastError returns ERROR_INSUFFICIENT_BUFFER, this parameter receives the number of characters required.
%inst
Creates a Gopher or Gopher+ locator string from the selector string's
component parts. (Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get extended error
information, call GetLastError or InternetGetLastResponseInfo.

[備考]
To retrieve information from a Gopher server, an application must
first get a Gopher "locator" from the Gopher server. The locator,
which the application should treat as an opaque token, is normally
used for calls to the GopherFindFirstFile function to retrieve a
specific piece of information. Like all other aspects of the WinINet
API, this function cannot be safely called from within DllMain or the
constructors and destructors of global objects. Note WinINet does not
support server implementations. In addition, it should not be used
from a service. For server implementations or services use Microsoft
Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines GopherCreateLocator as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GopherFindFirstFileW
Uses a Gopher locator and search criteria to create a session with the server and locate the requested documents, binary files, index servers, or directory trees. (Unicode)
%group
Win32 wininet
%prm
hConnect, lpszLocator, lpszSearchString, lpFindData, dwFlags, dwContext
hConnect : [intptr] Handle to a Gopher session returned by InternetConnect.
lpszLocator : [wstr] Pointer to a null-terminated string that contains the name of the item to locate. This can be one of the following:
lpszSearchString : [wstr] Pointer to a buffer that contains the strings to search, if this request is to an index server. Otherwise, this parameter should be NULL.
lpFindData : [var] Pointer to a GOPHER_FIND_DATA structure that receives the information retrieved by this function.
dwFlags : [int] 
dwContext : [int] Pointer to a variable that contains the application-defined value that associates this search with any application data.
%inst
Uses a Gopher locator and search criteria to create a session with
the server and locate the requested documents, binary files, index
servers, or directory trees. (Unicode)

[戻り値]
Returns a valid search handle if successful, or NULL otherwise. To
retrieve extended error information, call GetLastError or
InternetGetLastResponseInfo.

[備考]
GopherFindFirstFile closely resembles the FindFirstFile function. It
creates a connection with a Gopher server, and then returns a single
structure containing information about the first Gopher object
referenced by the locator string. After calling GopherFindFirstFile
to retrieve the first Gopher object in an enumeration, an application
can use the InternetFindNextFile function to retrieve subsequent
Gopher objects. After the calling application has finished using the
HINTERNET handle returned by GopherFindFirstFile, it must be closed
using the InternetCloseHandle function. Like all other aspects of the
WinINet API, this function cannot be safely called from within
DllMain or the constructors and destructors of global objects. Note
WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines GopherFindFirstFile as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GopherGetAttributeW
Retrieves the specific attribute information from the server. (Unicode)
%group
Win32 wininet
%prm
hConnect, lpszLocator, lpszAttributeName, lpBuffer, dwBufferLength, lpdwCharactersReturned, lpfnEnumerator, dwContext
hConnect : [intptr] Handle to a Gopher session returned by InternetConnect.
lpszLocator : [wstr] Pointer to a null-terminated string that identifies the item at the Gopher server on which to return attribute information.
lpszAttributeName : [wstr] Pointer to a space-delimited string specifying the names of attributes to return. If lpszAttributeName is NULL, GopherGetAttribute returns information about all attributes.
lpBuffer : [var] Pointer to an application-defined buffer from which attribute information is retrieved.
dwBufferLength : [int] Size of the lpBuffer buffer, in TCHARs.
lpdwCharactersReturned : [var] Pointer to a variable that contains the number of characters read into the lpBuffer buffer.
lpfnEnumerator : [int] Pointer to a GopherAttributeEnumerator callback function that enumerates each attribute of the locator. This parameter is optional. If it is NULL, all  Gopher attribute information is placed into lpBuffer. If lpfnEnumerator is specified, the callback function is called once for each attribute of the object.
dwContext : [int] Application-defined value that associates this operation with any application data.
%inst
Retrieves the specific attribute information from the server.
(Unicode)

[戻り値]
Returns TRUE if the request is satisfied, or FALSE otherwise. To get
extended error information, call GetLastError or
InternetGetLastResponseInfo.

[備考]
Generally, applications call this function after calling
GopherFindFirstFile or InternetFindNextFile. The size of the lpBuffer
parameter must be equal to or greater than the value of
MIN_GOPHER_ATTRIBUTE_LENGTH. Like all other aspects of the WinINet
API, this function cannot be safely called from within DllMain or the
constructors and destructors of global objects. Note WinINet does not
support server implementations. In addition, it should not be used
from a service. For server implementations or services use Microsoft
Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines GopherGetAttribute as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GopherGetLocatorTypeW
Parses a Gopher locator and determines its attributes. (Unicode)
%group
Win32 wininet
%prm
lpszLocator, lpdwGopherType
lpszLocator : [wstr] Pointer to a null-terminated string that specifies the Gopher locator to be parsed.
lpdwGopherType : [var] Pointer to a variable that receives the type of the locator. The type is a bitmask that consists of a combination of the gopher type values.
%inst
Parses a Gopher locator and determines its attributes. (Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get extended error
information, call GetLastError.

[備考]
GopherGetLocatorType returns information about the item referenced by
a Gopher locator. Note that it is possible for multiple attributes to
be set on a file. For example, both GOPHER_TYPE_TEXT_FILE and
GOPHER_TYPE_GOPHER_PLUS are set for a text file stored on a Gopher+
server. Like all other aspects of the WinINet API, this function
cannot be safely called from within DllMain or the constructors and
destructors of global objects. Note WinINet does not support server
implementations. In addition, it should not be used from a service.
For server implementations or services use Microsoft Windows HTTP
Services (WinHTTP).
> [!NOTE] > The wininet.h header defines GopherGetLocatorType as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GopherOpenFileW
Begins reading a Gopher data file from a Gopher server. (Unicode)
%group
Win32 wininet
%prm
hConnect, lpszLocator, lpszView, dwFlags, dwContext
hConnect : [intptr] Handle to a Gopher session returned by InternetConnect.
lpszLocator : [wstr] Pointer to a null-terminated string that specifies the file to be opened. Generally, this locator is returned from a call to GopherFindFirstFile or InternetFindNextFile. Because the Gopher protocol has no concept of a current directory, the locator is always fully qualified.
lpszView : [wstr] Pointer to a null-terminated string that describes the view to open if several views of the file exist on the server. If lpszView is NULL, the function uses the default file view.
dwFlags : [int] 
dwContext : [int] Pointer to a variable that contains an application-defined value that associates this operation with any application data.
%inst
Begins reading a Gopher data file from a Gopher server. (Unicode)

[戻り値]
Returns a handle if successful, or NULL if the file cannot be opened.
To retrieve extended error information, call GetLastError or
InternetGetLastResponseInfo.

[備考]
GopherOpenFile opens a file at a Gopher server. Because a file cannot
actually be opened or locked at a server, this function simply
associates location information with a handle that an application can
use for file-based operations such as InternetReadFile or
GopherGetAttribute. After the calling application has finished using
the HINTERNET handle returned by GopherOpenFile, it must be closed
using the InternetCloseHandle function. Like all other aspects of the
WinINet API, this function cannot be safely called from within
DllMain or the constructors and destructors of global objects. Note
WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines GopherOpenFile as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
HttpAddRequestHeadersW
Adds one or more HTTP request headers to the HTTP request handle. (HttpAddRequestHeadersW)
%group
Win32 wininet
%prm
hRequest, lpszHeaders, dwHeadersLength, dwModifiers
hRequest : [intptr] A handle returned by a call to the HttpOpenRequest function.
lpszHeaders : [wstr] A pointer to a string variable containing the headers to append to the request. Each header must be terminated by a CR/LF (carriage return/line feed) pair.
dwHeadersLength : [int] The size of lpszHeaders, in TCHARs. If this parameter is -1L, the function assumes that lpszHeaders is zero-terminated (ASCIIZ), and the length is computed.
dwModifiers : [int] 
%inst
Adds one or more HTTP request headers to the HTTP request handle.
(HttpAddRequestHeadersW)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get extended error
information, call GetLastError.

[備考]
HttpAddRequestHeaders appends additional, free-format headers to the
HTTP request handle and is intended for use by sophisticated clients
that need detailed control over the exact request sent to the HTTP
server. Note that for basic HttpAddRequestHeaders, the application
can pass in multiple headers in a single buffer. If the application
is trying to remove or replace a header, only one header can be
supplied in lpszHeaders. Note The HttpAddRequestHeadersA function
represents headers as ISO-8859-1 characters not ANSI characters. The
HttpAddRequestHeadersW function represents headers as ISO-8859-1
characters converted to UTF-16LE characters. As a result, it is never
safe to use the HttpAddRequestHeadersW function when the headers to
be added can contain non-ASCII characters. Instead, an application
can use the MultiByteToWideChar and WideCharToMultiByte functions
with a Codepage parameter set to 28591 to map between ANSI characters
and UTF-16LE characters. Like all other aspects of the WinINet API,
this function cannot be safely called from within DllMain or the
constructors and destructors of global objects. Note WinINet does not
support server implementations. In addition, it should not be used
from a service. For server implementations or services use Microsoft
Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines HttpAddRequestHeaders as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
HttpCheckDavComplianceW
(no summary)
%group
Win32 wininet
%prm
lpszUrl, lpszComplianceToken, lpfFound, hWnd, lpvReserved
lpszUrl : [wstr] 
lpszComplianceToken : [wstr] 
lpfFound : [var] 
hWnd : [intptr] 
lpvReserved : [intptr] 
%inst



%index
HttpCloseDependencyHandle
(no summary)
%group
Win32 wininet
%prm
hDependencyHandle
hDependencyHandle : [intptr] 
%inst



%index
HttpDuplicateDependencyHandle
(no summary)
%group
Win32 wininet
%prm
hDependencyHandle, phDuplicatedDependencyHandle
hDependencyHandle : [intptr] 
phDuplicatedDependencyHandle : [var] 
%inst



%index
HttpEndRequestW
Ends an HTTP request that was initiated by HttpSendRequestEx. (Unicode)
%group
Win32 wininet
%prm
hRequest, lpBuffersOut, dwFlags, dwContext
hRequest : [intptr] Handle returned by HttpOpenRequest and sent by HttpSendRequestEx.
lpBuffersOut : [var] This parameter is reserved and must be NULL.
dwFlags : [int] This parameter is reserved and must be set to 0.
dwContext : [int] This parameter is reserved and must be set to 0.
%inst
Ends an HTTP request that was initiated by HttpSendRequestEx.
(Unicode)

[戻り値]
If the function succeeds, the function returns TRUE.
If the function fails, it returns FALSE. To get extended error
information, call GetLastError.

[備考]
If lpBuffersOut is not set to NULL, HttpEndRequest will return
ERROR_INVALID_PARAMETER.
Like all other aspects of the WinINet API, this function cannot be
safely called from within DllMain or the constructors and destructors
of global objects. Note WinINet does not support server
implementations. In addition, it should not be used from a service.
For server implementations or services use Microsoft Windows HTTP
Services (WinHTTP).
> [!NOTE] > The wininet.h header defines HttpEndRequest as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
HttpGetServerCredentials
(no summary)
%group
Win32 wininet
%prm
pwszUrl, ppwszUserName, ppwszPassword
pwszUrl : [wstr] 
ppwszUserName : [var] 
ppwszPassword : [var] 
%inst



%index
HttpIndicatePageLoadComplete
(no summary)
%group
Win32 wininet
%prm
hDependencyHandle
hDependencyHandle : [intptr] 
%inst



%index
HttpIsHostHstsEnabled
(no summary)
%group
Win32 wininet
%prm
pcwszUrl, pfIsHsts
pcwszUrl : [wstr] 
pfIsHsts : [var] 
%inst



%index
HttpOpenDependencyHandle
(no summary)
%group
Win32 wininet
%prm
hRequestHandle, fBackground, phDependencyHandle
hRequestHandle : [intptr] 
fBackground : [int] 
phDependencyHandle : [var] 
%inst



%index
HttpOpenRequestW
HTTP リクエストハンドルを作成する。(Unicode)
%group
Win32 wininet
%prm
hConnect, lpszVerb, lpszObjectName, lpszVersion, lpszReferrer, lplpszAcceptTypes, dwFlags, dwContext
hConnect : [intptr] InternetConnect が返した HTTP セッションへのハンドル。
lpszVerb : [wstr] リクエストで使用する HTTP verb を含む NULL 終端文字列へのポインタ。NULL なら GET を使用。
lpszObjectName : [wstr] 指定 HTTP verb のターゲットオブジェクト名を含む NULL 終端文字列へのポインタ。通常はファイル名、実行モジュール、検索指定子。
lpszVersion : [wstr] 使用する HTTP バージョンを含む NULL 終端文字列へのポインタ。IE 設定によって上書きされる。NULL の場合、IE 設定に応じて HTTP/1.1 または 1.0 を使用する。
lpszReferrer : [wstr] lpszObjectName の URL の元ドキュメント URL を指定する NULL 終端文字列へのポインタ。NULL なら referer は指定されない。
lplpszAcceptTypes : [var] クライアントが受け入れるメディアタイプを示す NULL 終端文字列配列へのポインタ。例: PCTSTR rgpszAcceptTypes[] = {_T("text/*"), NULL}; 配列を NULL ポインタで正しく終端しないとクラッシュする。NULL なら何も受け入れない。
dwFlags : [int] 
dwContext : [int] この操作とアプリケーションデータを関連付けるアプリケーション定義値を保持する変数へのポインタ。
%inst
HTTP リクエストハンドルを作成する。(Unicode)

[戻り値]
成功時は HTTP リクエストハンドル、失敗時は NULL を返す。拡張エラー情報は GetLastError で取得する。

[備考]
HttpOpenRequest は新しい HTTP リクエストハンドルを作成し指定パラメータを格納する。リクエストハンドルは HTTP
サーバーに送信するリクエストと関連ヘッダを保持する。"GET" や "POST" 以外の verb を指定した場合は
INTERNET_FLAG_NO_CACHE_WRITE と INTERNET_FLAG_RELOAD が自動設定される。IE5
以降、lpszVerb が "HEAD" の場合、HTTP/1.1 サーバーからの応答の Content-Length
ヘッダは無視される。Windows 7/Windows Server 2008 R2 以降は lpszVersion が Internet
Explorer 設定で上書きされる。使用後は InternetCloseHandle で閉じること。WinINet
はサービスやサーバー実装で使用すべきでない。サーバー用途では WinHTTP を使用すること。
> [!NOTE] > wininet.h は UNICODE マクロに応じて HttpOpenRequest を
ANSI/Unicode 版のエイリアスとして定義する。


%index
HttpPushClose
(no summary)
%group
Win32 wininet
%prm
hWait
hWait : [intptr] 
%inst



%index
HttpPushEnable
(no summary)
%group
Win32 wininet
%prm
hRequest, pTransportSetting, phWait
hRequest : [intptr] 
pTransportSetting : [var] 
phWait : [intptr] 
%inst



%index
HttpPushWait
(no summary)
%group
Win32 wininet
%prm
hWait, eType, pNotificationStatus
hWait : [intptr] 
eType : [int] 
pNotificationStatus : [var] 
%inst



%index
HttpQueryInfoW
HTTP リクエストに関連するヘッダ情報を取得する。(Unicode)
%group
Win32 wininet
%prm
hRequest, dwInfoLevel, lpBuffer, lpdwBufferLength, lpdwIndex
hRequest : [intptr] HttpOpenRequest または InternetOpenUrl が返したハンドル。
dwInfoLevel : [int] 取得する属性とリクエストを変更するフラグの組み合わせ。可能な値は Query Info Flags を参照。
lpBuffer : [intptr] 要求情報を受け取るバッファへのポインタ。NULL は不可。
lpdwBufferLength : [var] lpvBuffer のバイト数を保持する変数へのポインタ。成功時は書き込まれた情報のバイト数を受け取る。ERROR_INSUFFICIENT_BUFFER で失敗した場合は必要なバッファサイズを受け取る。
lpdwIndex : [var] 同名の複数ヘッダを列挙するための 0 始まりのヘッダインデックス。呼び出し時は返したいヘッダのインデックス、復帰時は次のインデックス。見つからない場合は ERROR_HTTP_HEADER_NOT_FOUND を返す。
%inst
HTTP リクエストに関連するヘッダ情報を取得する。(Unicode)

[戻り値]
成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。

[備考]
次の種類のデータを取得できる。
（以下省略）


%index
HttpSendRequestW
指定のリクエストを HTTP サーバーに送信する。(Unicode) HttpSendRequestEx より多くのデータを送信できる。
%group
Win32 wininet
%prm
hRequest, lpszHeaders, dwHeadersLength, lpOptional, dwOptionalLength
hRequest : [intptr] HttpOpenRequest が返したハンドル。
lpszHeaders : [wstr] リクエストに追加するヘッダを含む NULL 終端文字列へのポインタ。追加ヘッダがなければ NULL 可。
dwHeadersLength : [int] 追加ヘッダのサイズ(TCHAR 単位)。-1L で lpszHeaders が NULL でない場合、NULL 終端とみなして計算する(ANSI 版のみ)。
lpOptional : [intptr] リクエストヘッダ直後に送信するオプションデータを含むバッファへのポインタ。通常 POST/PUT で使用する。送らない場合は NULL 可。
dwOptionalLength : [int] オプションデータのサイズ(バイト単位)。送らない場合は 0 可。
%inst
指定のリクエストを HTTP サーバーに送信する。(Unicode) HttpSendRequestEx より多くのデータを送信できる。

[戻り値]
成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。

[備考]
リクエスト送信後、HTTP
サーバーからのステータスコードと応答ヘッダを読み取る。これらのヘッダは内部に保持され、HttpQueryInfo
でクライアントから取得できる。オフラインモードでは、リソースがキャッシュになければ ERROR_FILE_NOT_FOUND
を返す。HttpSendRequestA と HttpSendRequestW の 2 種類があり、dwHeadersLength が
-1L で lpszHeaders が NULL でない場合の動作が異なる(W 版では
ERROR_INVALID_PARAMETER)。HttpSendRequestW は ISO-8859-1 を UTF-16LE
に変換したものとしてヘッダを扱うため、非 ASCII 文字を含むヘッダには安全に使えない。WinINet
はサービスやサーバー実装から使用すべきでない。


%index
HttpSendRequestExW
Sends the specified request to the HTTP server. (HttpSendRequestExW)
%group
Win32 wininet
%prm
hRequest, lpBuffersIn, lpBuffersOut, dwFlags, dwContext
hRequest : [intptr] A handle returned by a call to the HttpOpenRequest function.
lpBuffersIn : [var] Optional. A pointer to an INTERNET_BUFFERS structure.
lpBuffersOut : [var] Reserved. Must be NULL.
dwFlags : [int] Reserved. Must be zero.
dwContext : [int] Application-defined context value, if a status callback function has been registered.
%inst
Sends the specified request to the HTTP server. (HttpSendRequestExW)

[戻り値]
If the function succeeds, the function returns TRUE.
If the function fails, it returns FALSE. To get extended error
information, call GetLastError.

[備考]
HttpSendRequestEx performs both the send and the receive for the
response. This does not allow the application to send any extra data
beyond the single buffer that was passed to HttpSendRequestEx.
Callers that need to send extra data beyond what is normally passed
to HttpSendRequestEx can do so by calling HttpSendRequest instead.
After the call to HttpSendRequestEx, send the remaining data by
calling InternetWriteFile. Finally, follow up with a call to
HttpEndRequest. Note The HttpSendRequestExA function represents data
to send as ISO-8859-1 characters not ANSI characters. The
HttpSendRequestExW function represents data to send as ISO-8859-1
characters converted to UTF-16LE characters. As a result, it is never
safe to use the HttpSendRequestExW function when the headers to be
added can contain non-ASCII characters. Instead, an application can
use the MultiByteToWideChar and WideCharToMultiByte functions with a
Codepage parameter set to 28591 to map between ANSI characters and
UTF-16LE characters. Note WinINet does not support server
implementations. In addition, it should not be used from a service.
For server implementations or services use Microsoft Windows HTTP
Services (WinHTTP).
> [!NOTE] > The wininet.h header defines HttpSendRequestEx as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
HttpWebSocketClose
(no summary)
%group
Win32 wininet
%prm
hWebSocket, usStatus, pvReason, dwReasonLength
hWebSocket : [intptr] 
usStatus : [int] 
pvReason : [intptr] 
dwReasonLength : [int] 
%inst



%index
HttpWebSocketCompleteUpgrade
(no summary)
%group
Win32 wininet
%prm
hRequest, dwContext
hRequest : [intptr] 
dwContext : [int] 
%inst



%index
HttpWebSocketQueryCloseStatus
(no summary)
%group
Win32 wininet
%prm
hWebSocket, pusStatus, pvReason, dwReasonLength, pdwReasonLengthConsumed
hWebSocket : [intptr] 
pusStatus : [var] 
pvReason : [intptr] 
dwReasonLength : [int] 
pdwReasonLengthConsumed : [var] 
%inst



%index
HttpWebSocketReceive
(no summary)
%group
Win32 wininet
%prm
hWebSocket, pvBuffer, dwBufferLength, pdwBytesRead, pBufferType
hWebSocket : [intptr] 
pvBuffer : [intptr] 
dwBufferLength : [int] 
pdwBytesRead : [var] 
pBufferType : [var] 
%inst



%index
HttpWebSocketSend
(no summary)
%group
Win32 wininet
%prm
hWebSocket, BufferType, pvBuffer, dwBufferLength
hWebSocket : [intptr] 
BufferType : [int] 
pvBuffer : [intptr] 
dwBufferLength : [int] 
%inst



%index
HttpWebSocketShutdown
(no summary)
%group
Win32 wininet
%prm
hWebSocket, usStatus, pvReason, dwReasonLength
hWebSocket : [intptr] 
usStatus : [int] 
pvReason : [intptr] 
dwReasonLength : [int] 
%inst



%index
IncrementUrlCacheHeaderData
(no summary)
%group
Win32 wininet
%prm
nIdx, lpdwData
nIdx : [int] 
lpdwData : [var] 
%inst



%index
InternetAlgIdToStringW
(no summary)
%group
Win32 wininet
%prm
ai, lpstr, lpdwstrLength, dwReserved
ai : [int] 
lpstr : [wstr] 
lpdwstrLength : [var] 
dwReserved : [int] 
%inst



%index
InternetAttemptConnect
Attempts to make a connection to the Internet.
%group
Win32 wininet
%prm
dwReserved
dwReserved : [int] This parameter is reserved and must be 0.
%inst
Attempts to make a connection to the Internet.

[戻り値]
Returns ERROR_SUCCESS if successful, or a system error code
otherwise.

[備考]
This function allows an application to first attempt to connect
before issuing any requests. A client program can use this to evoke
the dial-up dialog box. If the attempt fails, the application should
enter offline mode. Like all other aspects of the WinINet API, this
function cannot be safely called from within DllMain or the
constructors and destructors of global objects. Note WinINet does not
support server implementations. In addition, it should not be used
from a service. For server implementations or services use Microsoft
Windows HTTP Services (WinHTTP).


%index
InternetAutodial
The InternetAutodial function (wininet.h) causes the modem to automatically dial the default Internet connection.
%group
Win32 wininet
%prm
dwFlags, hwndParent
dwFlags : [int] 
hwndParent : [intptr] Handle to the parent window.
%inst
The InternetAutodial function (wininet.h) causes the modem to
automatically dial the default Internet connection.

[戻り値]
If the function succeeds, it returns TRUE.
If the function fails, it returns FALSE. Applications can call
GetLastError to retrieve the error code.

[備考]
InternetAutodial does not support double-dial connections, SmartCard
authentication, or connections that require registry-based
certification. Note Starting on Windows Vista and Windows Server
2008, the WinINet dial-up functions use the RAS functions to
establish a dial-up connection. WinINet supports the functionality
documented in the RasDialDlg function. InternetAutodial does not
attempt to dial if there is an existing dial-up connection on the
system. Also, if there is an existing LAN connection, and
InternetAutodial is not configured to force dial (set the
INTERNET_AUTODIAL_FORCE_ONLINE in the dwFlags parameter),
InternetAutodial does not attempt to dial the connection and returns
TRUE. Like all other aspects of the WinINet API, this function cannot
be safely called from within DllMain or the constructors and
destructors of global objects. Note WinINet does not support server
implementations. In addition, it should not be used from a service.
For server implementations or services use Microsoft Windows HTTP
Services (WinHTTP).


%index
InternetAutodialHangup
The InternetAutodialHangup function (wininet.h) disconnects an automatic dial-up connection.
%group
Win32 wininet
%prm
dwReserved
dwReserved : [int] This parameter is reserved and must be 0.
%inst
The InternetAutodialHangup function (wininet.h) disconnects an
automatic dial-up connection.

[戻り値]
If the function succeeds, it returns TRUE.
If the function fails, it returns FALSE. Applications can call
GetLastError to retrieve the error code.

[備考]
InternetAutoDialHangup returns TRUE if autodial is not enabled, or if
autodial is enabled but does not have an entry configured on the
computer. Like all other aspects of the WinINet API, this function
cannot be safely called from within DllMain or the constructors and
destructors of global objects. Note WinINet does not support server
implementations. In addition, it should not be used from a service.
For server implementations or services use Microsoft Windows HTTP
Services (WinHTTP).


%index
InternetCanonicalizeUrlW
Canonicalizes a URL, which includes converting unsafe characters and spaces into escape sequences. (Unicode)
%group
Win32 wininet
%prm
lpszUrl, lpszBuffer, lpdwBufferLength, dwFlags
lpszUrl : [wstr] A pointer to the string that contains the URL to canonicalize.
lpszBuffer : [wstr] A pointer to the buffer that receives the resulting canonicalized URL.
lpdwBufferLength : [var] A pointer to a variable that contains the size, in characters,  of the lpszBuffer buffer. If the function succeeds, this parameter receives the number of characters actually copied to the lpszBuffer buffer, which does not include the terminating null character. If the function fails, this parameter receives the required size of the buffer, in characters, which includes the terminating null character.
dwFlags : [int] Controls canonicalization. If no flags are specified, the function converts all unsafe characters and meta sequences (such as \.,\ .., and \...) to escape sequences.
%inst
Canonicalizes a URL, which includes converting unsafe characters and
spaces into escape sequences. (Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get extended error
information, call the GetLastError function. Possible errors include
the following.
This doc was truncated.

[備考]
In Internet Explorer 4.0 and later, InternetCanonicalizeUrl always
functions as if the ICU_BROWSER_MODE flag is set. Client applications
that must canonicalize the entire URL should use either
CoInternetParseUrl (with the action PARSE_CANONICALIZE and the flag
URL_ESCAPE_UNSAFE) or UrlCanonicalize. InternetCanonicalizeUrl always
encodes by default, even if the ICU_DECODE flag has been specified.
To decode without reencoding, use ICU_DECODE | ICU_NO_ENCODE. If the
ICU_DECODE flag is used without ICU_NO_ENCODE, the URL is decoded
before being parsed; unsafe characters are then re-encoded after
parsing. This function handles arbitrary protocol schemes, but to do
so it must make inferences from the unsafe character set.
Applications that call InternetCanonicalizeUrl when using Internet
Explorer 3.0 (or when setting the ICU_ENCODE_PERCENT flag for
Internet Explorer 5 and later) should track the usage of this
function on a particular URL. If unsafe characters in a URL have been
converted to escape sequences, using InternetCanonicalizeUrl again on
the URL (with no flags) causes the escape sequences to be converted
to another escape sequence. For example, a blank space in a URL would
be converted to the escape sequence %20. Calling
InternetCanonicalizeUrl again on the URL would cause the escape
sequence %20 to be converted to the escape sequence %2520, because
the % sign is an unsafe character that is reserved for escape
sequences and is replaced by the function with the escape sequence
%25. Like all other aspects of the WinINet API, this function cannot
be safely called from within DllMain or the constructors and
destructors of global objects. Note WinINet does not support server
implementations. In addition, it should not be used from a service.
For server implementations or services use Microsoft Windows HTTP
Services (WinHTTP).
> [!NOTE] > The wininet.h header defines InternetCanonicalizeUrl as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
InternetCheckConnectionW
Allows an application to check if a connection to the Internet can be established. (Unicode)
%group
Win32 wininet
%prm
lpszUrl, dwFlags, dwReserved
lpszUrl : [wstr] Pointer to a null-terminated string that specifies the URL to use to check the connection. This value can be NULL.
dwFlags : [int] Options. FLAG_ICC_FORCE_CONNECTION is the only flag that is currently available. If this flag is set, it forces a connection. A sockets connection is attempted in the following order:
dwReserved : [int] This parameter is reserved and must be 0.
%inst
Allows an application to check if a connection to the Internet can be
established. (Unicode)

[戻り値]
Returns TRUE if a connection is made successfully, or FALSE
otherwise. Use GetLastError to retrieve the error code.
ERROR_NOT_CONNECTED is returned by GetLastError if a connection
cannot be made or if the sockets database is unconditionally offline.

[備考]
InternetCheckConnection is deprecated. InternetCheckConnection does
not work in environments that use a web proxy server to access the
Internet. Depending on the environment, use
NetworkInformation.GetInternetConnectionProfile or the NLM Interfaces
to check for Internet access instead. Note WinINet does not support
server implementations. In addition, it should not be used from a
service. For server implementations or services use Microsoft Windows
HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines InternetCheckConnection as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
InternetClearAllPerSiteCookieDecisions
Clears all decisions that were made about cookies on a site by site basis.
%group
Win32 wininet
%prm

%inst
Clears all decisions that were made about cookies on a site by site
basis.

[戻り値]
Returns TRUE if all decisions were cleared and FALSE otherwise.

[備考]
Note WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).


%index
InternetCloseHandle
単一のインターネットハンドルを閉じる。
%group
Win32 wininet
%prm
hInternet
hInternet : [intptr] 閉じるハンドル。
%inst
単一のインターネットハンドルを閉じる。

[戻り値]
成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。

[備考]
ハンドルの保留中の操作を終了し未処理データを破棄する。API 呼び出し中でなければ安全に呼べる。API が
ERROR_IO_PENDING を返した後、それ以降に API 呼び出しを行わない限り安全に I/O
をキャンセルできる。閉じるハンドルのコールバック内から呼んでも安全。閉じるハンドルに状態コールバックが登録されていて非 NULL
コンテキストが設定されている場合、INTERNET_STATUS_HANDLE_CLOSING
コールバックが呼ばれる。非同期リクエストが保留中の場合、ハンドルは即座に閉じられないが無効化される。WinINet
はサービスやサーバー実装から使用すべきでない。


%index
InternetCombineUrlW
Combines a base and relative URL into a single URL. The resultant URL is canonicalized (see InternetCanonicalizeUrl). (Unicode)
%group
Win32 wininet
%prm
lpszBaseUrl, lpszRelativeUrl, lpszBuffer, lpdwBufferLength, dwFlags
lpszBaseUrl : [wstr] Pointer to a null-terminated string  that contains the base URL.
lpszRelativeUrl : [wstr] Pointer to a null-terminated string  that contains the relative URL.
lpszBuffer : [wstr] Pointer to a buffer that receives the combined URL.
lpdwBufferLength : [var] Pointer to a variable that contains the size of the lpszBuffer buffer, in characters. If the function succeeds, this parameter receives the size of the combined URL, in characters, not including the null-terminating character. If the function fails, this parameter receives the size of the required buffer, in characters (including the null-terminating character).
dwFlags : [int] 
%inst
Combines a base and relative URL into a single URL. The resultant URL
is canonicalized (see InternetCanonicalizeUrl). (Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get extended error
information, call GetLastError. Possible errors include the
following.
This doc was truncated.

[備考]
Note WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines InternetCombineUrl as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
InternetConfirmZoneCrossing
The InternetConfirmZoneCrossing function (wininet.h) checks for changes between secure and nonsecure URLs.
%group
Win32 wininet
%prm
hWnd, szUrlPrev, szUrlNew, bPost
hWnd : [intptr] Handle to the parent window for any required dialog box.
szUrlPrev : [str] Pointer to a null-terminated string that specifies the URL that was viewed before the current request was made.
szUrlNew : [str] Pointer to a null-terminated string that specifies the new URL that the user has requested to view.
bPost : [int] Not implemented.
%inst
The InternetConfirmZoneCrossing function (wininet.h) checks for
changes between secure and nonsecure URLs.

[戻り値]
Returns one of the following values.
This doc was truncated.

[備考]
Always inform the user when a change in security level occurs, or you
risk subjecting the user to involuntary information disclosure. Like
all other aspects of the WinINet API, this function cannot be safely
called from within DllMain or the constructors and destructors of
global objects. Note WinINet does not support server implementations.
In addition, it should not be used from a service. For server
implementations or services use Microsoft Windows HTTP Services
(WinHTTP).


%index
InternetConnectW
指定サイトに対する FTP または HTTP セッションを開く。(Unicode)
%group
Win32 wininet
%prm
hInternet, lpszServerName, nServerPort, lpszUserName, lpszPassword, dwService, dwFlags, dwContext
hInternet : [intptr] InternetOpen の呼び出しが返したハンドル。
lpszServerName : [wstr] インターネットサーバーのホスト名を指定する NULL 終端文字列へのポインタ。ASCII ドット区切り IP アドレスでも可。
nServerPort : [int] サーバーの TCP/IP ポート。ポートのみ設定し、サービスは dwService で設定する。
lpszUserName : [wstr] ログインするユーザー名を指定する NULL 終端文字列へのポインタ。NULL の場合、適切な既定値が使用される。FTP では既定は "anonymous"。
lpszPassword : [wstr] ログインに使うパスワードを含む NULL 終端文字列へのポインタ。lpszPassword と lpszUsername が両方 NULL の場合、既定の "anonymous" パスワードが使われる。FTP では既定パスワードはユーザーのメール名。lpszUsername のみ NULL でない場合は空パスワードが使われる。
dwService : [int] 
dwFlags : [int] サービス固有のオプション。dwService が INTERNET_SERVICE_FTP の場合、INTERNET_FLAG_PASSIVE でパッシブ FTP セマンティクスを使用する。
dwContext : [int] 返されたハンドルのコールバックで、アプリケーションコンテキストを識別するためのアプリケーション定義値を含む変数へのポインタ。
%inst
指定サイトに対する FTP または HTTP セッションを開く。(Unicode)

[戻り値]
接続成功時はセッションへの有効なハンドル、それ以外は NULL を返す。拡張エラー情報は GetLastError
で取得する。InternetGetLastResponseInfo でサービスアクセス拒否の原因も取得できる。

[備考]
lpszUsername と lpszPassword の 4 つの組み合わせに対する動作は以下の表の通り。
（以下省略）


%index
InternetConvertUrlFromWireToWideChar
(no summary)
%group
Win32 wininet
%prm
pcszUrl, cchUrl, pcwszBaseUrl, dwCodePageHost, dwCodePagePath, fEncodePathExtra, dwCodePageExtra, ppwszConvertedUrl
pcszUrl : [str] 
cchUrl : [int] 
pcwszBaseUrl : [wstr] 
dwCodePageHost : [int] 
dwCodePagePath : [int] 
fEncodePathExtra : [int] 
dwCodePageExtra : [int] 
ppwszConvertedUrl : [var] 
%inst



%index
InternetCrackUrlW
Cracks a URL into its component parts. (Unicode)
%group
Win32 wininet
%prm
lpszUrl, dwUrlLength, dwFlags, lpUrlComponents
lpszUrl : [wstr] Pointer to a string that contains the canonical URL to be cracked.
dwUrlLength : [int] Size of the lpszUrl string, in TCHARs, or zero if lpszUrl is an ASCIIZ string.
dwFlags : [int] 
lpUrlComponents : [var] Pointer to a URL_COMPONENTS structure that receives the URL components.
%inst
Cracks a URL into its component parts. (Unicode)

[戻り値]
Returns TRUE if the function succeeds, or FALSE otherwise. To get
extended error information, call GetLastError.

[備考]
The required components are indicated by members of the
URL_COMPONENTS structure. Each component has a pointer to the value
and has a member that stores the length of the stored value. If both
the value and the length for a component are equal to zero, that
component is not returned. Windows Vista and later.: If the pointer
to the value of the component is NULL and the value of its
corresponding length member is nonzero, the address of the first
character of the corresponding component in the lpszUrl string is
stored in the pointer, and the length of the component is stored in
the length member.
If the pointer contains the address of the user-supplied buffer, the
length member must contain the size of the buffer. InternetCrackUrl
copies the component into the buffer, and the length member is set to
the length of the copied component, minus 1 for the trailing string
terminator. For InternetCrackUrl to work properly, the size of the
URL_COMPONENTS structure, in bytes, must be stored in the
dwStructSize member. Note Do not use InternetCrackUrl on "file://"
URLs that contain spaces, because the value returned in the
dwUrlPathLength member of the URL_COMPONENTS structure pointed to by
lpUrlComponents is too large. This is only the case, however, with
"file://" URLs that contain space characters. Like all other aspects
of the WinINet API, this function cannot be safely called from within
DllMain or the constructors and destructors of global objects. Note
WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines InternetCrackUrl as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
InternetCreateUrlW
Creates a URL from its component parts. (Unicode)
%group
Win32 wininet
%prm
lpUrlComponents, dwFlags, lpszUrl, lpdwUrlLength
lpUrlComponents : [var] Pointer to a URL_COMPONENTS structure that contains the components from which to create the URL.
dwFlags : [int] 
lpszUrl : [wstr] Pointer to a buffer that receives the URL.
lpdwUrlLength : [var] Pointer to a variable that specifies the size of the URL lpszUrl buffer, in TCHARs. When the function returns, this parameter receives the size of the URL string, excluding the NULL terminator. If GetLastError returns ERROR_INSUFFICIENT_BUFFER, this parameter receives the number of bytes required to hold the created URL.
%inst
Creates a URL from its component parts. (Unicode)

[戻り値]
Returns TRUE if the function succeeds, or FALSE otherwise. To get
extended error information, call GetLastError.

[備考]
When specifying scheme in the URL_COMPONENTS structure passed to
lpUrlComponents, if lpszScheme is not NULL it will be used for the
scheme. If lpszScheme is NULL, the scheme can be specified using the
INTERNET_SCHEME enumeration by setting nScheme to the required
INTERNET_SCHEME or INTERNET_SCHEME_DEFAULT. Note WinINet does not
support server implementations. In addition, it should not be used
from a service. For server implementations or services use Microsoft
Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines InternetCreateUrl as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
InternetDial
The InternetDial function (wininet.h) initiates a connection to the Internet using a modem.
%group
Win32 wininet
%prm
hwndParent, lpszConnectoid, dwFlags, lpdwConnection, dwReserved
hwndParent : [intptr] Handle to the parent window.
lpszConnectoid : [str] Pointer to a null-terminated string that specifies the name of the dial-up connection to be used. If this parameter contains the empty string (""), the user chooses the connection. If this parameter is NULL, the function connects to the autodial connection.
dwFlags : [int] 
lpdwConnection : [var] Pointer to a variable that specifies the connection number. This number is a unique identifier for the connection that can be used in other functions, such as InternetHangUp.
dwReserved : [int] This parameter is reserved and must be NULL.
%inst
The InternetDial function (wininet.h) initiates a connection to the
Internet using a modem.

[戻り値]
Returns ERROR_SUCCESS if successful, or an error value otherwise. The
error code can be one of the following values.
This doc was truncated.

[備考]
InternetDial does not support double-dial connections, SmartCard
authentication, or connections that require registry-based
certification. Note Starting on Windows Vista and Windows Server
2008, the WinINet dial-up functions use the RAS functions to
establish a dial-up connection. WinINet supports the functionality
documented in the RasDialDlg function. Like all other aspects of the
WinINet API, this function cannot be safely called from within
DllMain or the constructors and destructors of global objects. Note
WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).


%index
InternetEnumPerSiteCookieDecisionW
The InternetEnumPerSiteCookieDecisionW (Unicode) function (wininet.h) retrieves the domains and cookie settings of websites with set site-specific cookie regulations.
%group
Win32 wininet
%prm
pszSiteName, pcSiteNameSize, pdwDecision, dwIndex
pszSiteName : [wstr] An LPSTR that receives a string specifying a website domain.
pcSiteNameSize : [var] A pointer to an unsigned long that specifies the size of the pcSiteNameSize parameter provided to the InternetEnumPerSiteCookieDecision function when it is called. When InternetEnumPerSiteCookieDecision returns, pcSiteNameSize receives the actual length of the domain string returned in pszSiteName.
pdwDecision : [var] Pointer to an unsigned long that receives the InternetCookieState enumeration value corresponding to pszSiteName.
dwIndex : [int] An unsigned long that specifies the index of the website and corresponding cookie setting to retrieve.
%inst
The InternetEnumPerSiteCookieDecisionW (Unicode) function (wininet.h)
retrieves the domains and cookie settings of websites with set
site-specific cookie regulations.

[戻り値]
TRUE if the function retrieved the cookie setting for the given
domain; otherwise, false. FALSE.

[備考]
InternetEnumPerSiteCookieDecision should be initially called with
dwIndex equal to 0. Incrementing the dwIndex parameter steps through
the list of websites and cookie settings. The end of the list is
reached when InternetEnumPerSiteCookieDecision returns FALSE and
produces the wininet error, ERROR_NO_MORE_ITEMS. Like all other
aspects of the WinINet API, this function cannot be safely called
from within DllMain or the constructors and destructors of global
objects. Note WinINet does not support server implementations. In
addition, it should not be used from a service. For server
implementations or services use Microsoft Windows HTTP Services
(WinHTTP).
> [!NOTE] > The wininet.h header defines
InternetEnumPerSiteCookieDecision as an alias which automatically
selects the ANSI or Unicode version of this function based on the
definition of the UNICODE preprocessor constant. Mixing usage of the
encoding-neutral alias with code that not encoding-neutral can lead
to mismatches that result in compilation or runtime errors. For more
information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
InternetErrorDlg
Displays a dialog box for the error that is passed to InternetErrorDlg, if an appropriate dialog box exists.
%group
Win32 wininet
%prm
hWnd, hRequest, dwError, dwFlags, lppvData
hWnd : [intptr] Handle to the parent window for any needed dialog box. If no dialog box is needed and FLAGS_ERROR_UI_FLAGS_NO_UI is passed to dwFlags, then this parameter can be NULL.
hRequest : [intptr] Handle to the Internet connection used in the call to HttpSendRequest.
dwError : [int] 
dwFlags : [int] 
lppvData : [var] Pointer  to the address of a data structure. The structure can be different for each error that needs to be handled.
%inst
Displays a dialog box for the error that is passed to
InternetErrorDlg, if an appropriate dialog box exists.

[戻り値]
Returns one of the following values, or an error value otherwise.
This doc was truncated.

[備考]
This doc was truncated.


%index
InternetFindNextFileW
Continues a file search started as a result of a previous call to FtpFindFirstFile.Windows?XP and Windows Server?2003?R2 and earlier:??Or continues a file search as a result of a previous call to GopherFindFirstFile. (Unicode)
%group
Win32 wininet
%prm
hFind, lpvFindData
hFind : [intptr] Handle returned from either FtpFindFirstFile or InternetOpenUrl (directories only). Windows?XP and Windows Server?2003?R2 and earlier:??Also a handle returned from GopherFindFirstFile.
lpvFindData : [intptr] Pointer to the buffer that receives information about the  file or directory. The format of the information placed in the buffer depends on the protocol in use. The FTP protocol returns a WIN32_FIND_DATA structure. Windows?XP and Windows Server?2003?R2 and earlier:??The Gopher protocol returns a GOPHER_FIND_DATA structure.
%inst
Continues a file search started as a result of a previous call to
FtpFindFirstFile.Windows XP and Windows Server 2003 R2 and earlier:
Or continues a file search as a result of a previous call to
GopherFindFirstFile. (Unicode)

[戻り値]
Returns TRUE if the function succeeds, or FALSE otherwise. To get
extended error information, call GetLastError. If the function finds
no matching files, GetLastError returns ERROR_NO_MORE_FILES.

[備考]
Note WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines InternetFindNextFile as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
InternetFortezzaCommand
(no summary)
%group
Win32 wininet
%prm
dwCommand, hwnd, dwReserved
dwCommand : [int] 
hwnd : [intptr] 
dwReserved : [int] 
%inst



%index
InternetFreeCookies
Frees an array of INTERNET_COOKIE2 structures.
%group
Win32 wininet
%prm
pCookies, dwCookieCount
pCookies : [var] Pointer to an array of [**INTERNET\_COOKIE2**](ns-wininet-internet_cookie2.md) structures.
dwCookieCount : [int] The number of structures in the array.
%inst
Frees an array of INTERNET_COOKIE2 structures.

[備考]
> [!NOTE] > WinINet does not support server implementations. In
addition, it should not be used from a service. For server
implementations or services use [Microsoft Windows HTTP Services
(WinHTTP)](/windows/desktop/winhttp/winhttp-start-page).


%index
InternetFreeProxyInfoList
(no summary)
%group
Win32 wininet
%prm
pProxyInfoList
pProxyInfoList : [var] 
%inst



%index
InternetGetConnectedState
The InternetGetConnectedState function (wininet.h) retrieves the connected state of the local system and is not recommended for use.
%group
Win32 wininet
%prm
lpdwFlags, dwReserved
lpdwFlags : [var] 
dwReserved : [int] This parameter is reserved and must be 0.
%inst
The InternetGetConnectedState function (wininet.h) retrieves the
connected state of the local system and is not recommended for use.

[戻り値]
Returns TRUE if there is an active modem or a LAN Internet
connection, or FALSE if there is no Internet connection, or if all
possible Internet connections are not currently active. For more
information, see the Remarks section. When InternetGetConnectedState
returns FALSE, the application can call GetLastError to retrieve the
error code.

[備考]
A return value of TRUE from InternetGetConnectedState indicates that
at least one connection to the Internet is available. It does not
guarantee that a connection to a specific host can be established.
Applications should always check for errors returned from API calls
that connect to a server. InternetCheckConnection can be called to
determine if a connection to a specific destination can be
established. A return value of TRUE indicates that either the modem
connection is active, or a LAN connection is active and a proxy is
properly configured for the LAN. A return value of FALSE indicates
that neither the modem nor the LAN is connected. If FALSE is
returned, the INTERNET_CONNECTION_CONFIGURED flag may be set to
indicate that autodial is configured to "always dial" but is not
currently active. If autodial is not configured, the function returns
FALSE. Like all other aspects of the WinINet API, this function
cannot be safely called from within DllMain or the constructors and
destructors of global objects. Note WinINet does not support server
implementations. In addition, it should not be used from a service.
For server implementations or services use Microsoft Windows HTTP
Services (WinHTTP).


%index
InternetGetConnectedStateEx
The InternetGetConnectedStateEx function (wininet.h) retrieves the connected state of the specified Internet connection and is not recommended for use.
%group
Win32 wininet
%prm
lpdwFlags, lpszConnectionName, dwNameLen, dwReserved
lpdwFlags : [var] 
lpszConnectionName : [str] Pointer to a string value that receives the connection name.
dwNameLen : [int] Size of the lpszConnectionName string, in TCHARs.
dwReserved : [int] This parameter is reserved and must be NULL.
%inst
The InternetGetConnectedStateEx function (wininet.h) retrieves the
connected state of the specified Internet connection and is not
recommended for use.

[戻り値]
Returns TRUE if there is an Internet connection, or FALSE if there is
no Internet connection, or if all possible Internet connections are
not currently active. For more information, see the Remarks section.
When InternetGetConnectedState returns FALSE, the application can
call GetLastError to retrieve the error code.

[備考]
A return value of TRUE from InternetGetConnectedState indicates that
at least one connection to the Internet is available. It does not
guarantee that a connection to a specific host can be established.
Applications should always check for errors returned from API calls
that connect to a server. InternetCheckConnection can be called to
determine if a connection to a specific destination can be
established. A return value of TRUE indicates that either the modem
connection is active, or a LAN connection is active and a proxy is
properly configured for the LAN. A return value of FALSE indicates
that neither the modem nor the LAN is connected. If FALSE is
returned, the INTERNET_CONNECTION_CONFIGURED flag may be set to
indicate that autodial is configured to "always dial" but is not
currently active. If autodial is not configured, the function returns
FALSE. Like all other aspects of the WinINet API, this function
cannot be safely called from within DllMain or the constructors and
destructors of global objects. Note WinINet does not support server
implementations. In addition, it should not be used from a service.
For server implementations or services use Microsoft Windows HTTP
Services (WinHTTP).


%index
InternetGetCookieW
Retrieves the cookie for the specified URL. (Unicode)
%group
Win32 wininet
%prm
lpszUrl, lpszCookieName, lpszCookieData, lpdwSize
lpszUrl : [wstr] A pointer to a null-terminated string that specifies the URL for which cookies are to be retrieved.
lpszCookieName : [wstr] Not implemented.
lpszCookieData : [wstr] A pointer to a buffer that receives the cookie data. This parameter can be NULL.
lpdwSize : [var] A pointer to a variable that specifies the size of the lpszCookieData parameter buffer, in TCHARs. If the function succeeds, the buffer receives the amount of data copied to the lpszCookieData buffer. If lpszCookieData is NULL, this parameter receives a value that specifies the size of the buffer necessary to copy all the cookie data, expressed as a byte count.
%inst
Retrieves the cookie for the specified URL. (Unicode)

[戻り値]
If the function succeeds, the function returns TRUE.
If the function fails, it returns FALSE. To get extended error data,
call GetLastError. The following error values apply to
InternetGetCookie.
This doc was truncated.

[備考]
InternetGetCookie does not require a call to InternetOpen.
InternetGetCookie checks in the windows\cookies directory for
persistent cookies that have an expiration date set sometime in the
future. InternetGetCookie also searches memory for any session
cookies, that is, cookies that do not have an expiration date that
were created in the same process by InternetSetCookie, because these
cookies are not written to any files. Rules for creating cookie files
are internal to the system and can change in the future. As noted in
HTTP Cookies, InternetGetCookie does not return cookies that the
server marked as non-scriptable with the "HttpOnly" attribute in the
Set-Cookie header. Like all other aspects of the WinINet API, this
function cannot be safely called from within DllMain or the
constructors and destructors of global objects. Note WinINet does not
support server implementations. In addition, it should not be used
from a service. For server implementations or services use Microsoft
Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines InternetGetCookie as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
InternetGetCookieExW
Retrieves data stored in cookies associated with a specified URL. (Unicode)
%group
Win32 wininet
%prm
lpszUrl, lpszCookieName, lpszCookieData, lpdwSize, dwFlags, lpReserved
lpszUrl : [wstr] A pointer to a null-terminated string that contains the URL with which the cookie to retrieve is associated. This parameter cannot be NULL or InternetGetCookieEx fails and returns an  ERROR_INVALID_PARAMETER error.
lpszCookieName : [wstr] A pointer to a null-terminated string that contains the name of the cookie to retrieve. This name is case-sensitive.
lpszCookieData : [wstr] A pointer to a buffer to receive the cookie data.
lpdwSize : [var] A pointer to a DWORD variable. On entry, the variable must contain the size, in TCHARs, of the buffer pointed to by the pchCookieData parameter. On exit, if the function is successful, this variable contains the number of TCHARs of cookie data copied into the buffer. If NULL was passed as the lpszCookieData parameter, or if the function fails with an error of ERROR_INSUFFICIENT_BUFFER, the variable contains the size, in BYTEs, of buffer required to receive the cookie data. This parameter cannot be NULL or InternetGetCookieEx fails and returns an  ERROR_INVALID_PARAMETER error.
dwFlags : [int] 
lpReserved : [intptr] Reserved for future use. Set to NULL.
%inst
Retrieves data stored in cookies associated with a specified URL.
(Unicode)

[戻り値]
If the function succeeds, the function returns TRUE.
If the function fails, it returns FALSE. To get a specific error
value, call GetLastError. If NULL is passed to lpszCookieData, the
call will succeed and the function will not set
ERROR_INSUFFICIENT_BUFFER.
The following error codes may be set by this function.
This doc was truncated.

[備考]
Note WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines InternetGetCookieEx as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
InternetGetCookieEx2
Retrieves one or more cookies associated with the specified URL.
%group
Win32 wininet
%prm
pcwszUrl, pcwszCookieName, dwFlags, ppCookies, pdwCookieCount
pcwszUrl : [wstr] The URL for which to retrieve cookies.
pcwszCookieName : [wstr] The name of the cookie to retrieve. May be NULL.
dwFlags : [int] Flags of the cookie to retrieve. The following flags are available. | Value | Meaning | |-------|---------| | INTERNET_COOKIE_THIRD_PARTY | Retrieve cookies as a third party, causing first-party-only cookies to be excluded. | | INTERNET_COOKIE_NON_SCRIPT | Indicate that this query was not triggered via JavaScript, allowing retrieval of HTTP-only cookies. | | INTERNET_COOKIE_SAME_SITE_LEVEL_CROSS_SITE | Retrieve cookies as if in a cross site context, excluding cookies with the SameSite property set. | | INTERNET_FLAG_RESTRICTED_ZONE | Retrieve only cookies that would be allowed if the specified URL were untrusted; that is, if it belonged to the URLZONE_UNTRUSTED zone. |
ppCookies : [var] Pointer that receives an array of [INTERNET\_COOKIE2](ns-wininet-internet_cookie2.md) structures. The returned array must be freed by [InternetFreeCookies](nf-wininet-internetfreecookies.md).
pdwCookieCount : [var] Pointer to a DWORD that receives the number of structures in the array.
%inst
Retrieves one or more cookies associated with the specified URL.

[戻り値]
Returns ERROR_SUCCESS if successful, or a [system error
code](/windows/desktop/debug/system-error-codes) on failure.

[備考]
> [!NOTE] > WinINet does not support server implementations. In
addition, it should not be used from a service. For server
implementations or services use [Microsoft Windows HTTP Services
(WinHTTP)](/windows/desktop/winhttp/winhttp-start-page).


%index
InternetGetLastResponseInfoW
Retrieves the last error description or server response on the thread calling this function. (Unicode)
%group
Win32 wininet
%prm
lpdwError, lpszBuffer, lpdwBufferLength
lpdwError : [var] Pointer to a variable that receives an error message pertaining to the operation that failed.
lpszBuffer : [wstr] Pointer to a buffer that receives the error text.
lpdwBufferLength : [var] Pointer to a variable that contains the size of the lpszBuffer buffer, in TCHARs. When the function returns, this parameter contains the size of the string written to the buffer, not including the terminating zero.
%inst
Retrieves the last error description or server response on the thread
calling this function. (Unicode)

[戻り値]
Returns TRUE if error text was successfully written to the buffer, or
FALSE otherwise. To get extended error information, call
GetLastError. If the buffer is too small to hold all the error text,
GetLastError returns ERROR_INSUFFICIENT_BUFFER, and the
lpdwBufferLength parameter contains the minimum buffer size required
to return all the error text.

[備考]
The FTP protocols can return additional text information along with
most errors. This extended error information can be retrieved by
using the InternetGetLastResponseInfo function whenever GetLastError
returns ERROR_INTERNET_EXTENDED_ERROR (occurring after an
unsuccessful function call). The buffer pointed to by lpszBuffer must
be large enough to hold both the error string and a zero terminator
at the end of the string. However, note that the value returned in
lpdwBufferLength does not include the terminating zero.
InternetGetLastResponseInfo can be called multiple times until
another function is called on this thread. When another function is
called, the internal buffer that is storing the last response
information is cleared. Like all other aspects of the WinINet API,
this function cannot be safely called from within DllMain or the
constructors and destructors of global objects. Note WinINet does not
support server implementations. In addition, it should not be used
from a service. For server implementations or services use Microsoft
Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines InternetGetLastResponseInfo
as an alias which automatically selects the ANSI or Unicode version
of this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
InternetGetPerSiteCookieDecisionW
Retrieves a decision on cookies for a given domain. (Unicode)
%group
Win32 wininet
%prm
pchHostName, pResult
pchHostName : [wstr] An LPCTSTR that points to a string containing a domain.
pResult : [var] A pointer to an unsigned long that contains one of the InternetCookieState enumeration values.
%inst
Retrieves a decision on cookies for a given domain. (Unicode)

[戻り値]
Returns TRUE if the decision was retrieved and FALSE otherwise.

[備考]
A return value of FALSE may indicate that the domain pchHostName does
not have any site-specific cookie regulations.
WinINet minimizes the domain specified in the pchHostName parameter
and sets the cookie policy on the minimum legal domain. For example,
if the specified host name is widgets.microsoft.com, the policy is
set on the minimized host name microsoft.com. Like all other aspects
of the WinINet API, this function cannot be safely called from within
DllMain or the constructors and destructors of global objects. Note
WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines
InternetGetPerSiteCookieDecision as an alias which automatically
selects the ANSI or Unicode version of this function based on the
definition of the UNICODE preprocessor constant. Mixing usage of the
encoding-neutral alias with code that not encoding-neutral can lead
to mismatches that result in compilation or runtime errors. For more
information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
InternetGetProxyForUrl
(no summary)
%group
Win32 wininet
%prm
hInternet, pcwszUrl, pProxyInfoList
hInternet : [intptr] 
pcwszUrl : [wstr] 
pProxyInfoList : [var] 
%inst



%index
InternetGetSecurityInfoByURL
(no summary)
%group
Win32 wininet
%prm
lpszURL, ppCertChain, pdwSecureFlags
lpszURL : [str] 
ppCertChain : [var] 
pdwSecureFlags : [var] 
%inst



%index
InternetGetSecurityInfoByURLA
(no summary)
%group
Win32 wininet
%prm
lpszURL, ppCertChain, pdwSecureFlags
lpszURL : [str] 
ppCertChain : [var] 
pdwSecureFlags : [var] 
%inst



%index
InternetGetSecurityInfoByURLW
(no summary)
%group
Win32 wininet
%prm
lpszURL, ppCertChain, pdwSecureFlags
lpszURL : [wstr] 
ppCertChain : [var] 
pdwSecureFlags : [var] 
%inst



%index
InternetGoOnline
The InternetGoOnline function (wininet.h) prompts the user for permission to initiate connection to a URL.
%group
Win32 wininet
%prm
lpszURL, hwndParent, dwFlags
lpszURL : [str] Pointer to a null-terminated string that specifies the URL of the website for the connection.
hwndParent : [intptr] Handle to the parent window.
dwFlags : [int] This parameter can be zero or the following flag.
%inst
The InternetGoOnline function (wininet.h) prompts the user for
permission to initiate connection to a URL.

[戻り値]
If the function succeeds, it returns TRUE.
If the function fails, it returns FALSE. Applications can call
GetLastError to retrieve the error code. If the functions fails, it
can return the following error code:
This doc was truncated.

[備考]
Note WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).


%index
InternetHangUp
The InternetHangUp function (wininet.h) instructs the modem to disconnect from the Internet.
%group
Win32 wininet
%prm
dwConnection, dwReserved
dwConnection : [int] Connection number of  the connection to be disconnected.
dwReserved : [int] This parameter is reserved and must be 0.
%inst
The InternetHangUp function (wininet.h) instructs the modem to
disconnect from the Internet.

[戻り値]
Returns ERROR_SUCCESS if successful, or an error value otherwise.

[備考]
Note WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).


%index
InternetInitializeAutoProxyDll
The InternetInitializeAutoProxyDll function (wininet.h) is one of two WinINet functions named InternetInitializeAutoProxyDll.
%group
Win32 wininet
%prm
dwReserved
dwReserved : [int] This parameter is reserved and must be 0.
%inst
The InternetInitializeAutoProxyDll function (wininet.h) is one of two
WinINet functions named InternetInitializeAutoProxyDll.

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get extended error
information, call GetLastError.

[備考]
Because the InternetInitializeAutoProxyDll function takes time to
complete its operation, it should not be called from a UI thread.
Like all other aspects of the WinINet API, this function cannot be
safely called from within DllMain or the constructors and destructors
of global objects. Note WinINet does not support server
implementations. In addition, it should not be used from a service.
For server implementations or services use Microsoft Windows HTTP
Services (WinHTTP).


%index
InternetLockRequestFile
Places a lock on the file that is being used.
%group
Win32 wininet
%prm
hInternet, lphLockRequestInfo
hInternet : [intptr] Handle returned by the FtpOpenFile, GopherOpenFile, HttpOpenRequest, or InternetOpenUrl function.
lphLockRequestInfo : [intptr] Pointer to a handle that receives the lock request handle.
%inst
Places a lock on the file that is being used.

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get a specific
error message, call GetLastError.

[備考]
If the HINTERNET handle passed to hInternet was created using
INTERNET_FLAG_NO_CACHE_WRITE or INTERNET_FLAG_DONT_CACHE, the
function creates a temporary file with the extension .tmp, unless it
is an HTTPS resource. If the handle was created using
INTERNET_FLAG_NO_CACHE_WRITE or INTERNET_FLAG_DONT_CACHE and it is
accessing an HTTPS resource, InternetLockRequestFile fails. Like all
other aspects of the WinINet API, this function cannot be safely
called from within DllMain or the constructors and destructors of
global objects. Note WinINet does not support server implementations.
In addition, it should not be used from a service. For server
implementations or services use Microsoft Windows HTTP Services
(WinHTTP).


%index
InternetOpenW
アプリケーションによる WinINet 関数の使用を初期化する。(Unicode)
%group
Win32 wininet
%prm
lpszAgent, dwAccessType, lpszProxy, lpszProxyBypass, dwFlags
lpszAgent : [wstr] WinINet 関数を呼び出すアプリ名または主体名を指定する NULL 終端文字列へのポインタ。HTTP の user agent として使用される。
dwAccessType : [int] 
lpszProxy : [wstr] dwAccessType が INTERNET_OPEN_TYPE_PROXY のときに使用するプロキシサーバー名を指定する NULL 終端文字列へのポインタ。空文字列は使わないこと。WinINet は HTTP の CERN 型プロキシと FTP の TIS FTP ゲートウェイのみ認識する。IE がインストールされていれば SOCKS プロキシも対応。それ以外の dwAccessType では無視され NULL 可。
lpszProxyBypass : [wstr] INTERNET_OPEN_TYPE_PROXY 時にプロキシ経由しないホスト名/IP アドレスのリスト(セミコロン区切り、ワイルドカード可)を指定する NULL 終端文字列へのポインタ。空文字列は使わないこと。"<local>" マクロを指定するとピリオドを含まないホスト名をバイパスする。既定で WinINet は "localhost"、"loopback"、"127.0.0.1"、"[::1]" のプロキシをバイパスする。"<-loopback>" マクロでローカルコンピュータをバイパスリストから除外できる (IE9)。それ以外の dwAccessType では無視され NULL 可。
dwFlags : [int] 
%inst
アプリケーションによる WinINet 関数の使用を初期化する。(Unicode)

[戻り値]
成功時はアプリが後続の WinINet 関数に渡す有効なハンドルを返す。失敗時は NULL。特定のエラーメッセージは
GetLastError で取得する。

[備考]
InternetOpen はアプリケーションが最初に呼ぶ WinINet 関数。インターネット DLL
に内部データ構造を初期化させ後続呼び出しに備えさせる。使用終了時は InternetCloseHandle
でハンドルと関連リソースを解放する。複数回呼び出しも可能だが通常 1 回で十分。使用後は InternetCloseHandle
で閉じる。WinINet はサービスやサーバー実装から使用すべきでない。
> [!NOTE] > wininet.h は UNICODE マクロに応じて InternetOpen を ANSI/Unicode
版のエイリアスとして定義する。


%index
InternetOpenUrlW
完全な FTP または HTTP URL で指定されたリソースを開く。(Unicode)
%group
Win32 wininet
%prm
hInternet, lpszUrl, lpszHeaders, dwHeadersLength, dwFlags, dwContext
hInternet : [intptr] 現在のインターネットセッションへのハンドル。InternetOpen が返したハンドルである必要がある。
lpszUrl : [wstr] 読み取り開始する URL を指定する NULL 終端文字列変数へのポインタ。ftp:、http:、https: で始まる URL のみサポート。
lpszHeaders : [wstr] HTTP サーバーに送るヘッダを指定する NULL 終端文字列へのポインタ。詳細は HttpSendRequest の lpszHeaders を参照。
dwHeadersLength : [int] 追加ヘッダのサイズ(TCHAR 単位)。-1L で lpszHeaders が NULL でない場合、NULL 終端とみなして計算する。
dwFlags : [int] 
dwContext : [int] 返されたハンドルと共にコールバックに渡されるアプリケーション定義値を指定する変数へのポインタ。
%inst
完全な FTP または HTTP URL で指定されたリソースを開く。(Unicode)

[戻り値]
接続成功時は URL への有効なハンドル、失敗時は NULL を返す。特定のエラーメッセージは GetLastError
で取得する。アクセス拒否の原因は InternetGetLastResponseInfo で取得する。

[備考]
相対 URL とベース URL が空白で区切られている URL の場合、先に InternetCanonicalizeUrl
を呼び出すこと。WinINet がサポートするプロトコルのデータを取得するための汎用関数で、プロトコルの詳細にアクセスする必要がなく
URL 対応データのみ必要な場合に便利。URL 文字列を解析しサーバーに接続し、URL
で識別されるデータのダウンロード準備をする。InternetReadFile(ファイル)または
InternetFindNextFile(ディレクトリ)で URL データを取得できる。InternetConnect
を先に呼ぶ必要はない。使用後は InternetCloseHandle で閉じる。WinINet
はサービスやサーバー実装から使用すべきでない。
> [!NOTE] > wininet.h は UNICODE マクロに応じて InternetOpenUrl を
ANSI/Unicode 版のエイリアスとして定義する。


%index
InternetQueryDataAvailable
Queries the server to determine the amount of data available.
%group
Win32 wininet
%prm
hFile, lpdwNumberOfBytesAvailable, dwFlags, dwContext
hFile : [intptr] Handle returned by the InternetOpenUrl, FtpOpenFile, GopherOpenFile, or HttpOpenRequest function.
lpdwNumberOfBytesAvailable : [var] Pointer to a variable that receives the number of available bytes. May be NULL.
dwFlags : [int] This parameter is reserved and must be 0.
dwContext : [int] This parameter is reserved and must be 0.
%inst
Queries the server to determine the amount of data available.

[戻り値]
Returns TRUE if the function succeeds, or FALSE otherwise. To get
extended error information, call GetLastError. If the function finds
no matching files, GetLastError returns ERROR_NO_MORE_FILES.

[備考]
This function returns the number of bytes of data that are available
to be read immediately by a subsequent call to InternetReadFile. If
there is currently no data available and the end of the file has not
been reached, the request waits until data becomes available. The
amount of data remaining will not be recalculated until all available
data indicated by the call to InternetQueryDataAvailable is read. For
HINTERNET handles created by HttpOpenRequest and sent by
HttpSendRequestEx, a call to HttpEndRequest must be made on the
handle before InternetQueryDataAvailable can be used. Like all other
aspects of the WinINet API, this function cannot be safely called
from within DllMain or the constructors and destructors of global
objects. Note WinINet does not support server implementations. In
addition, it should not be used from a service. For server
implementations or services use Microsoft Windows HTTP Services
(WinHTTP).


%index
InternetQueryFortezzaStatus
(no summary)
%group
Win32 wininet
%prm
pdwStatus, dwReserved
pdwStatus : [var] 
dwReserved : [int] 
%inst



%index
InternetQueryOptionW
Queries an Internet option on the specified handle. (Unicode)
%group
Win32 wininet
%prm
hInternet, dwOption, lpBuffer, lpdwBufferLength
hInternet : [intptr] Handle on which to query information.
dwOption : [int] Internet option to be queried. This can be one of the Option Flags values.
lpBuffer : [intptr] Pointer to a buffer that receives the option setting. Strings returned by InternetQueryOption are globally allocated, so the calling application must  free them when it  is finished using them.
lpdwBufferLength : [var] Pointer to a variable that contains the size of lpBuffer, in bytes.  When InternetQueryOption returns, lpdwBufferLength specifies the size of the data placed into lpBuffer. If GetLastError returns ERROR_INSUFFICIENT_BUFFER, this parameter points to the number of bytes required to hold the requested information.
%inst
Queries an Internet option on the specified handle. (Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get a specific
error message, call GetLastError.

[備考]
GetLastError will return the ERROR_INVALID_PARAMETER if an option
flag that is invalid for the specified handle type is passed to the
dwOption parameter. For more information, see Setting and Retrieving
Internet Options. Like all other aspects of the WinINet API, this
function cannot be safely called from within DllMain or the
constructors and destructors of global objects. Note WinINet does not
support server implementations. In addition, it should not be used
from a service. For server implementations or services use Microsoft
Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines InternetQueryOption as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
InternetReadFile
InternetOpenUrl、FtpOpenFile、HttpOpenRequest が返したハンドルからデータを読み取る。
%group
Win32 wininet
%prm
hFile, lpBuffer, dwNumberOfBytesToRead, lpdwNumberOfBytesRead
hFile : [intptr] InternetOpenUrl、FtpOpenFile、HttpOpenRequest から返されたハンドル。
lpBuffer : [intptr] データを受け取るバッファへのポインタ。
dwNumberOfBytesToRead : [int] 読み取るバイト数。
lpdwNumberOfBytesRead : [var] 読み取ったバイト数を受け取る変数へのポインタ。作業前に 0 に設定される。
%inst
InternetOpenUrl、FtpOpenFile、HttpOpenRequest が返したハンドルからデータを読み取る。

[戻り値]
成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。必要に応じて
InternetGetLastResponseInfo も使う。

[備考]
基本的な ReadFile とほぼ同じだが、いくつかの違いがある。通常 HINTERNET
ハンドルから順次バイトストリームとしてデータを取得する。読み取るバイト数を dwNumberOfBytesToRead で指定し、データは
lpBuffer に返される。全データ取得には TRUE かつ lpdwNumberOfBytesRead が 0
になるまで繰り返し呼ぶ必要がある。これはキャッシュ更新にも重要。InternetOpenUrl で取得したハンドルの場合、WinINet
は FTP ディレクトリリストなどを HTML ストリームに変換する。バッファが小さすぎて 1 行の HTML が入らない場合
ERROR_INSUFFICIENT_BUFFER を返す。非同期実行中に完了しなかった場合は FALSE を返し
GetLastError が ERROR_IO_PENDING を返す。完了時は InternetStatusCallback が
INTERNET_STATUS_REQUEST_COMPLETE で呼ばれる。WinINet はサービス実装では使用しないこと。


%index
InternetReadFileExW
Reads data from a handle opened by the InternetOpenUrl or HttpOpenRequest function. (Unicode)
%group
Win32 wininet
%prm
hFile, lpBuffersOut, dwFlags, dwContext
hFile : [intptr] Handle returned by the InternetOpenUrl or HttpOpenRequest function.
lpBuffersOut : [var] Pointer to an INTERNET_BUFFERS structure that receives the data downloaded.
dwFlags : [int] 
dwContext : [int] A caller supplied context value used for asynchronous operations.
%inst
Reads data from a handle opened by the InternetOpenUrl or
HttpOpenRequest function. (Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get extended error
information, call GetLastError. An application can also use
InternetGetLastResponseInfo when necessary.

[備考]
Note WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines InternetReadFileEx as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
InternetSecurityProtocolToStringW
(no summary)
%group
Win32 wininet
%prm
dwProtocol, lpstr, lpdwstrLength, dwReserved
dwProtocol : [int] 
lpstr : [wstr] 
lpdwstrLength : [var] 
dwReserved : [int] 
%inst



%index
InternetSetCookieW
Creates a cookie associated with the specified URL. (InternetSetCookieW)
%group
Win32 wininet
%prm
lpszUrl, lpszCookieName, lpszCookieData
lpszUrl : [wstr] Pointer to a null-terminated string that specifies the URL for which the cookie should be set.
lpszCookieName : [wstr] Pointer to a null-terminated string that specifies the name to be associated with the cookie data. If this parameter is NULL, no name is associated with the cookie.
lpszCookieData : [wstr] Pointer to the actual data to be associated with the URL.
%inst
Creates a cookie associated with the specified URL.
(InternetSetCookieW)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get a specific
error message, call GetLastError.

[備考]
Cookies created by InternetSetCookie without an expiration date are
stored in memory and are available only in the same process that
created them. Cookies that include an expiration date are stored in
the windows\cookies directory. Creating a new cookie might cause a
dialog box to appear on the screen asking the user if they want to
allow or disallow cookies from this site based on the privacy
settings for the user.
Caution InternetSetCookie will unconditionally create a cookie even
if “Block all cookies” is set in Internet Explorer. This behavior can
be viewed as a breach of privacy even though such cookies are not
subsequently sent back to servers while the “Block all cookies”
setting is active. Applications should use InternetSetCookieEx to
correctly honor the user's privacy settings. For more cookie
internals, see
http://blogs.msdn.com/ieinternals/archive/2009/08/20/WinINET-IE-Cookie-Internals-FAQ.aspx.
Like all other aspects of the WinINet API, this function cannot be
safely called from within DllMain or the constructors and destructors
of global objects. Note WinINet does not support server
implementations. In addition, it should not be used from a service.
For server implementations or services use Microsoft Windows HTTP
Services (WinHTTP).
> [!NOTE] > The wininet.h header defines InternetSetCookie as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
InternetSetCookieExW
The InternetSetCookieEx function creates a cookie with a specified name that is associated with a specified URL. This function differs from the InternetSetCookie function by being able to create third-party cookies. (Unicode)
%group
Win32 wininet
%prm
lpszUrl, lpszCookieName, lpszCookieData, dwFlags, dwReserved
lpszUrl : [wstr] Pointer to a null-terminated string that contains the URL for which the cookie should be set. If this pointer is NULL, InternetSetCookieEx fails with an ERROR_INVALID_PARAMETER error.
lpszCookieName : [wstr] Pointer to a null-terminated string that  contains the name to associate with this cookie. If this pointer is NULL, then no name is associated with the cookie.
lpszCookieData : [wstr] Pointer to a null-terminated string that contains the data to be associated with the new cookie. If this pointer is NULL, InternetSetCookieEx fails with an ERROR_INVALID_PARAMETER error.
dwFlags : [int] Flags that control how the function retrieves cookie data:
dwReserved : [int] NULL, or contains a pointer to a Platform-for-Privacy-Protection (P3P) header to be associated with the cookie.
%inst
The InternetSetCookieEx function creates a cookie with a specified
name that is associated with a specified URL. This function differs
from the InternetSetCookie function by being able to create
third-party cookies. (Unicode)

[戻り値]
Returns a member of the InternetCookieState enumeration if
successful, or FALSE if the function fails. On failure, if a call to
GetLastError returns ERROR_NOT_ENOUGH_MEMORY, insufficient system
memory was available.

[備考]
Note WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines InternetSetCookieEx as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
InternetSetCookieEx2
Creates a cookie associated with the specified URL. (InternetSetCookieEx2)
%group
Win32 wininet
%prm
pcwszUrl, pCookie, pcwszP3PPolicy, dwFlags, pdwCookieState
pcwszUrl : [wstr] The URL for which to set the cookie.
pCookie : [var] Pointer to an [INTERNET\_COOKIE2](ns-wininet-internet_cookie2.md) structure containing the cookie data.
pcwszP3PPolicy : [wstr] String containing the Platform-for-Privacy-Protection (P3P) policy for the cookie. May be NULL.
dwFlags : [int] Flags for the cookie to be set. The following flags are available. | Value | Meaning | |-------|---------| | INTERNET_COOKIE_THIRD_PARTY | Set this cookie in a third-party context. | | INTERNET_COOKIE_PROMPT_REQUIRED | Show a UI prompt for the user to accept or reject this cookie. | | INTERNET_COOKIE_EVALUATE_P3P | Evaluate the provided P3P policy for this cookie. This will evaluate default policy when *pcwszP3PPolicy* is NULL. | | INTERNET_COOKIE_NON_SCRIPT | Indicate that this cookie is not being set via JavaScript, allowing HTTP-only cookies to be set. | | INTERNET_COOKIE_APPLY_HOST_ONLY | Apply host-only policy to this cookie. If the domain attribute is not set, then this cookie will be marked host-only. |
pdwCookieState : [var] Pointer to a DWORD that receives the result of setting the cookie. For a list of possible values, see [InternetCookieState](/windows/win32/api/wininet/ne-wininet-internetcookiestate).
%inst
Creates a cookie associated with the specified URL.
(InternetSetCookieEx2)

[戻り値]
Returns ERROR_SUCCESS if successful, or a [system error
code](/windows/desktop/debug/system-error-codes) on failure.

[備考]
> [!NOTE] > WinINet does not support server implementations. In
addition, it should not be used from a service. For server
implementations or services use [Microsoft Windows HTTP Services
(WinHTTP)](/windows/desktop/winhttp/winhttp-start-page).


%index
InternetSetDialState
The InternetSetDialState function (wininet.h) is not supported, is obsolete, and should not be used.
%group
Win32 wininet
%prm
lpszConnectoid, dwState, dwReserved
lpszConnectoid : [str] Unused.
dwState : [int] Unused.
dwReserved : [int] Unused.
%inst
The InternetSetDialState function (wininet.h) is not supported, is
obsolete, and should not be used.

[戻り値]
This function does not return a value.

[備考]
Note WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).


%index
InternetSetFilePointer
Sets a file position for InternetReadFile. This is a synchronous call; however, subsequent calls to InternetReadFile might block or return pending if the data is not available from the cache and the server does not support random access.
%group
Win32 wininet
%prm
hFile, lDistanceToMove, lpDistanceToMoveHigh, dwMoveMethod, dwContext
hFile : [intptr] Handle returned from a previous call to InternetOpenUrl (on an HTTP or HTTPS URL) or HttpOpenRequest (using the GET or HEAD HTTP verb and passed to HttpSendRequest or HttpSendRequestEx). This handle must not have been created with the INTERNET_FLAG_DONT_CACHE or INTERNET_FLAG_NO_CACHE_WRITE value set.
lDistanceToMove : [int] The low order 32-bits of a signed 64-bit number of bytes to move the file pointer. Internet Explorer?7 and earlier:??InternetSetFilePointer used to move the pointer only within the bounds of  a LONG. When calling this older version of the function, lpDistanceToMoveHigh is reserved and should be set to 0. A positive value moves the pointer forward in the file; a negative value moves it backward.
lpDistanceToMoveHigh : [var] A pointer to the high order 32-bits of the signed 64-bit distance to move. If you do not need the high order 32-bits, this pointer must  be set to NULL.  When not NULL, this parameter also receives the high order DWORD of the new value of the file pointer. A positive value moves the pointer forward in the file; a negative value moves it backward.Internet Explorer?7 and earlier:??InternetSetFilePointer used to move the pointer only within the bounds of  a LONG. When calling this older version of the function, lpDistanceToMoveHigh is reserved and should be set to 0.
dwMoveMethod : [int] 
dwContext : [int] This parameter is reserved and must be 0.
%inst
Sets a file position for InternetReadFile. This is a synchronous
call; however, subsequent calls to InternetReadFile might block or
return pending if the data is not available from the cache and the
server does not support random access.

[戻り値]
I the function succeeds, it returns the current file position. A
return value of INVALID_SET_FILE_POINTER indicates a potential
failure and needs to be followed by be a call to GetLastError. Since
INVALID_SET_FILE_POINTER is a valid value for the low-order DWORD of
the new file pointer, the caller must check both the return value of
the function and the error code returned by GetLastError to determine
whether or not an error has occurred. If an error has occurred, the
return value of InternetSetFilePointer is INVALID_SET_FILE_POINTER
and GetLastError returns a value other than NO_ERROR. If the function
succeeds and lpDistanceToMoveHigh is NULL, the return value is the
low-order DWORD of the new file pointer. Note that if the function
returns a value other than INVALID_SET_FILE_POINTER, the call to
InternetSetFilePointer has succeeded and there is no need to call
GetLastError. If the function succeeds and lpDistanceToMoveHigh is
not NULL, the return value is the lower-order DWORD of the new file
pointer and lpDistanceToMoveHigh contains the high order DWORD of the
new file pointer. If a new file pointer is a negative value, the
function fails, the file pointer is not moved, and the code returned
by GetLastError is ERROR_NEGATIVE_SEEK. If lpDistanceToMoveHigh is
NULL and the new file position does not fit in a 32-bit value the
function fails and returns INVALID_SET_FILE_POINTER.

[備考]
This function cannot be used once the end of the file has been
reached by InternetReadFile. For HINTERNET handles created by
HttpOpenRequest and sent by HttpSendRequestEx, a call to
HttpEndRequest must be made on the handle before
InternetSetFilePointer is used. InternetSetFilePointer cannot be used
reliably if the content length is unknown. Like all other aspects of
the WinINet API, this function cannot be safely called from within
DllMain or the constructors and destructors of global objects.
InternetSetFilePointer has changed over time. In Internet Explorer 7
and earlier, it used to move the pointer only within the bounds of a
LONG. When calling this older version of the function,
lDistanceToMove contains the entire value. A positive value moves the
pointer forward in the file; a negative value moves it backward.
lpDistanceToMoveHigh is reserved and is set to 0. In current
versions, lpDistanceToMoveHigh is a significant value and where any
negative value would be indicated. Note WinINet does not support
server implementations. In addition, it should not be used from a
service. For server implementations or services use Microsoft Windows
HTTP Services (WinHTTP).


%index
InternetSetOptionW
インターネットオプションを設定する。(Unicode)
%group
Win32 wininet
%prm
hInternet, dwOption, lpBuffer, dwBufferLength
hInternet : [intptr] 情報を設定するハンドル。
dwOption : [int] 設定するインターネットオプション。Option Flags のいずれかの値。
lpBuffer : [intptr] オプション設定値を含むバッファへのポインタ。
dwBufferLength : [int] lpBuffer バッファのサイズ。文字列を含む場合は TCHAR 単位、それ以外はバイト単位。
%inst
インターネットオプションを設定する。(Unicode)

[戻り値]
成功時は TRUE、失敗時は FALSE。特定のエラーメッセージは GetLastError で取得する。

[備考]
GetLastError は設定できないオプションに対して ERROR_INVALID_PARAMETER を返す。詳細は Setting
and Retrieving Internet Options を参照。WinINet はサービスから使用すべきでない。
> [!NOTE] > wininet.h は UNICODE マクロに応じて InternetSetOption を
ANSI/Unicode 版のエイリアスとして定義する。


%index
InternetSetOptionExW
Not supported.Implemented only as a stub that calls the InternetSetOption function; InternetSetOptionEx has no functionality of its own. Do not use this function at this time. (Unicode)
%group
Win32 wininet
%prm
hInternet, dwOption, lpBuffer, dwBufferLength, dwFlags
hInternet : [intptr] Unused.
dwOption : [int] Unused.
lpBuffer : [intptr] Unused.
dwBufferLength : [int] Unused.
dwFlags : [int] Unused.
%inst
Not supported.Implemented only as a stub that calls the
InternetSetOption function; InternetSetOptionEx has no functionality
of its own. Do not use this function at this time. (Unicode)

[戻り値]
This function does not return a value.

[備考]
Note WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines InternetSetOptionEx as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
InternetSetPerSiteCookieDecisionW
Sets a decision on cookies for a given domain. (Unicode)
%group
Win32 wininet
%prm
pchHostName, dwDecision
pchHostName : [wstr] An LPCTSTR that points to a string containing a domain.
dwDecision : [int] A value of type DWORD that contains one of the InternetCookieState enumeration values.
%inst
Sets a decision on cookies for a given domain. (Unicode)

[戻り値]
Returns TRUE if the decision is set and FALSE otherwise.

[備考]
WinINet minimizes the domain specified in the pchHostName parameter
and sets the cookie policy on the minimum legal domain. For example,
if the specified host name is widgets.microsoft.com, the policy is
set on the minimized host name microsoft.com. Like all other aspects
of the WinINet API, this function cannot be safely called from within
DllMain or the constructors and destructors of global objects. Note
WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines
InternetSetPerSiteCookieDecision as an alias which automatically
selects the ANSI or Unicode version of this function based on the
definition of the UNICODE preprocessor constant. Mixing usage of the
encoding-neutral alias with code that not encoding-neutral can lead
to mismatches that result in compilation or runtime errors. For more
information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
InternetShowSecurityInfoByURL
(no summary)
%group
Win32 wininet
%prm
lpszURL, hwndParent
lpszURL : [str] 
hwndParent : [intptr] 
%inst



%index
InternetShowSecurityInfoByURLA
(no summary)
%group
Win32 wininet
%prm
lpszURL, hwndParent
lpszURL : [str] 
hwndParent : [intptr] 
%inst



%index
InternetShowSecurityInfoByURLW
(no summary)
%group
Win32 wininet
%prm
lpszURL, hwndParent
lpszURL : [wstr] 
hwndParent : [intptr] 
%inst



%index
InternetTimeFromSystemTime
The InternetTimeFromSystemTime function (wininet.h) formats a date and time according to the HTTP version 1.0 specification.
%group
Win32 wininet
%prm
pst, dwRFC, lpszTime, cbTime
pst : [var] Pointer to a SYSTEMTIME structure that contains the date and time to format.
dwRFC : [int] RFC format used. Currently, the only valid format is INTERNET_RFC1123_FORMAT.
lpszTime : [str] Pointer to a string buffer that receives the formatted date and time. The buffer should be of size INTERNET_RFC1123_BUFSIZE.
cbTime : [int] Size of the lpszTime buffer, in bytes.
%inst
The InternetTimeFromSystemTime function (wininet.h) formats a date
and time according to the HTTP version 1.0 specification.

[戻り値]
Returns TRUE if the function succeeds, or FALSE otherwise. To get
extended error information, call GetLastError.

[備考]
Note WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).


%index
InternetTimeToSystemTime
The InternetTimeToSystemTime function (wininet.h) converts an HTTP time/date string to a SYSTEMTIME structure.
%group
Win32 wininet
%prm
lpszTime, pst, dwReserved
lpszTime : [str] Pointer to a null-terminated string that specifies the date/time to  be converted.
pst : [var] Pointer to a SYSTEMTIME structure that receives the converted time.
dwReserved : [int] This parameter is reserved and must be 0.
%inst
The InternetTimeToSystemTime function (wininet.h) converts an HTTP
time/date string to a SYSTEMTIME structure.

[戻り値]
Returns TRUE if the string was converted, or FALSE otherwise. To get
extended error information, call GetLastError.

[備考]
Note WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).


%index
InternetUnlockRequestFile
Unlocks a file that was locked using InternetLockRequestFile.
%group
Win32 wininet
%prm
hLockRequestInfo
hLockRequestInfo : [intptr] Handle to a lock request that was returned by InternetLockRequestFile.
%inst
Unlocks a file that was locked using InternetLockRequestFile.

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get a specific
error message, call GetLastError.

[備考]
Note WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).


%index
InternetWriteFile
Writes data to an open Internet file.
%group
Win32 wininet
%prm
hFile, lpBuffer, dwNumberOfBytesToWrite, lpdwNumberOfBytesWritten
hFile : [intptr] Handle returned from a previous call to FtpOpenFile or an HINTERNET handle sent by HttpSendRequestEx.
lpBuffer : [intptr] Pointer to a buffer that contains the data to be written to the file.
dwNumberOfBytesToWrite : [int] Number of bytes to be written to the file.
lpdwNumberOfBytesWritten : [var] Pointer to a variable that receives the number of bytes written to the file. InternetWriteFile sets this value to zero before doing any work or error checking.
%inst
Writes data to an open Internet file.

[戻り値]
Returns TRUE if the function succeeds, or FALSE otherwise. To get
extended error information, call GetLastError. An application can
also use InternetGetLastResponseInfo when necessary.

[備考]
When the application is sending data, it must call
InternetCloseHandle to end the data transfer. Like all other aspects
of the WinINet API, this function cannot be safely called from within
DllMain or the constructors and destructors of global objects. Note
WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).


%index
InternetWriteFileExW
(no summary)
%group
Win32 wininet
%prm
hFile, lpBuffersIn, dwFlags, dwContext
hFile : [intptr] 
lpBuffersIn : [var] 
dwFlags : [int] 
dwContext : [int] 
%inst



%index
IsHostInProxyBypassList
(no summary)
%group
Win32 wininet
%prm
tScheme, lpszHost, cchHost
tScheme : [int] 
lpszHost : [str] 
cchHost : [int] 
%inst



%index
IsUrlCacheEntryExpiredW
(no summary)
%group
Win32 wininet
%prm
lpszUrlName, dwFlags, pftLastModified
lpszUrlName : [wstr] 
dwFlags : [int] 
pftLastModified : [var] 
%inst



%index
LoadUrlCacheContent
(no summary)
%group
Win32 wininet
%prm

%inst



%index
ParseX509EncodedCertificateForListBoxEntry
(no summary)
%group
Win32 wininet
%prm
lpCert, cbCert, lpszListBoxEntry, lpdwListBoxEntry
lpCert : [var] 
cbCert : [int] 
lpszListBoxEntry : [str] 
lpdwListBoxEntry : [var] 
%inst



%index
PrivacyGetZonePreferenceW
The PrivacyGetZonePreferenceW (Unicode) function (wininet.h) retrieves the privacy settings for a given URLZONE and PrivacyType.
%group
Win32 wininet
%prm
dwZone, dwType, pdwTemplate, pszBuffer, pdwBufferLength
dwZone : [int] A value of type DWORD that specifies the URLZONE for which privacy settings are being retrieved.
dwType : [int] A value of type DWORD that specifies the PrivacyType for which privacy settings are being retrieved.
pdwTemplate : [var] An LPDWORD that returns a pointer to a DWORD containing which of the PrivacyTemplates is in use for this dwZone and dwType.
pszBuffer : [wstr] An  LPWSTR that points to a buffer containing a LPCWSTR representing a string version of the pdwTemplate or a customized string if the pdwTemplate is set to PRIVACY_TEMPLATE_CUSTOM. See PrivacySetZonePreferenceW for a description of a customized privacy preferences string.
pdwBufferLength : [var] An LPDWORD that contains the buffer length in characters. If the buffer length is not sufficient, PrivacyGetZonePreferenceW returns with this parameter set to the number of characters required and with a return value of ERROR_MORE_DATA.
%inst
The PrivacyGetZonePreferenceW (Unicode) function (wininet.h)
retrieves the privacy settings for a given URLZONE and PrivacyType.

[戻り値]
Returns zero if successful. Otherwise, one of the Error Messages
defined in winerr.h is returned.

[備考]
These privacy settings for the Internet zone are found on the Privacy
tab of the Internet Options dialog box. Like all other aspects of the
WinINet API, this function cannot be safely called from within
DllMain or the constructors and destructors of global objects. Note
WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).


%index
PrivacySetZonePreferenceW
The PrivacySetZonePreferenceW (Unicode) function (wininet.h) sets the privacy settings for a given URLZONE and PrivacyType.
%group
Win32 wininet
%prm
dwZone, dwType, dwTemplate, pszPreference
dwZone : [int] Value of type DWORD that specifies the URLZONE for which privacy settings are being set.
dwType : [int] Value of type DWORD that specifies the PrivacyType for which privacy settings are being set.
dwTemplate : [int] Value of type DWORD that specifies which of the privacy templates is to be used to set the privacy settings.
pszPreference : [wstr] If dwTemplate is set to PRIVACY_TEMPLATE_CUSTOM, this parameter is the string representation of the custom preferences. Otherwise, it should be set to NULL. A description of this string representation is included in the Remarks section.
%inst
The PrivacySetZonePreferenceW (Unicode) function (wininet.h) sets the
privacy settings for a given URLZONE and PrivacyType.

[戻り値]
Returns zero if successful. Otherwise, one of the errors defined in
winerr.h is returned.

[備考]
These privacy settings for the Internet zone are found on the Privacy
tab of the Internet Options dialog box. Setting the privacy options
for the URLZONE_INTERNET involves setting the privacy templates for
both PrivacyTypes. The slider on the Privacy Menu in Internet Options
only moves if privacy is set for both PrivacyTypes. Custom privacy
preferences for a given URLZONE and PrivacyType can be set through
the pszPreference parameter. The pszPreference parameter can contain
a series of rules separated by white space describing the privacy
preferences. It is important to note that the rules themselves cannot
contain white space. The pszPreference has the following structure
where there can be multiple logical rules: <signature> <logical-rule>
<special-rule>. Currently, the signature must be set to
IE6-P3PSettings/V1:. Logical rules have the following format:
/<expression>=<decision>/. An expression is a Boolean statement
composed of compact policy tokens using the operators & (logical AND)
and ! (logical NOT). The compact policy token is case-sensitive. (For
more information on Platform for Privacy Preferences (P3P) privacy
policies and compact policy tokens, see the W3C: Platform for Privacy
Preferences (P3P) Project specification.) The decision is a single
lowercase character that defines the action to take on the cookie
whose compact policy contains the specified token(s). The following
table lists valid decision characters.
This doc was truncated.


%index
ReadUrlCacheEntryStream
Reads the cached data from a stream that has been opened using the RetrieveUrlCacheEntryStream function.
%group
Win32 wininet
%prm
hUrlCacheStream, dwLocation, lpBuffer, lpdwLen, Reserved
hUrlCacheStream : [intptr] Handle that was returned by the RetrieveUrlCacheEntryStream function.
dwLocation : [int] Offset to be read from.
lpBuffer : [intptr] Pointer to a buffer that receives the data.
lpdwLen : [var] Pointer to a  variable that specifies the size of the lpBuffer buffer, in bytes. When the function returns, the variable contains the number of bytes copied to the buffer, or the required size of the buffer, in bytes.
Reserved : [int] This parameter is reserved and must be 0.
%inst
Reads the cached data from a stream that has been opened using the
RetrieveUrlCacheEntryStream function.

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get extended error
information, call GetLastError.

[備考]
If the buffer size is not sufficient, GetLastError returns
ERROR_INSUFFICIENT_BUFFER and sets lpdwLen to the size necessary to
contain all the information. Like all other aspects of the WinINet
API, this function cannot be safely called from within DllMain or the
constructors and destructors of global objects. Note WinINet does not
support server implementations. In addition, it should not be used
from a service. For server implementations or services use Microsoft
Windows HTTP Services (WinHTTP).


%index
ReadUrlCacheEntryStreamEx
(no summary)
%group
Win32 wininet
%prm
hUrlCacheStream, qwLocation, lpBuffer, lpdwLen
hUrlCacheStream : [intptr] 
qwLocation : [int64] 
lpBuffer : [intptr] 
lpdwLen : [var] 
%inst



%index
RegisterUrlCacheNotification
(no summary)
%group
Win32 wininet
%prm
hWnd, uMsg, gid, dwOpsFilter, dwReserved
hWnd : [intptr] 
uMsg : [int] 
gid : [int64] 
dwOpsFilter : [int] 
dwReserved : [int] 
%inst



%index
ResumeSuspendedDownload
The ResumeSuspendedDownload function resumes a request that is suspended by a user interface dialog box.
%group
Win32 wininet
%prm
hRequest, dwResultCode
hRequest : [intptr] Handle of the request that is suspended by a user interface dialog box.
dwResultCode : [int] The error result returned from InternetErrorDlg, or zero if a different dialog  is  invoked.
%inst
The ResumeSuspendedDownload function resumes a request that is
suspended by a user interface dialog box.

[戻り値]
Returns TRUE if successful; otherwise FALSE. Call GetLastError for
extended error information.

[備考]
Applications that use WinINet functions asynchronously can call
ResumeSuspendedDownload to resume a request that is suspended by a
user interface dialog box. For example, call ResumeSuspendedDownload
after a call to InternetErrorDlg, or in an InternetStatusCallback
function when the lpvStatusInformation parameter equals
INTERNET_STATUS_USER_INPUT_REQUIRED. The following code example shows
you how to use the ResumeSuspendedDownload function in a callback.
Like all other aspects of the WinINet API, this function cannot be
safely called from within DllMain or the constructors and destructors
of global objects. Note WinINet does not support server
implementations. In addition, it should not be used from a service.
For server implementations or services use Microsoft Windows HTTP
Services (WinHTTP).


%index
RetrieveUrlCacheEntryFileW
Locks the cache entry file associated with the specified URL. (Unicode)
%group
Win32 wininet
%prm
lpszUrlName, lpCacheEntryInfo, lpcbCacheEntryInfo, dwReserved
lpszUrlName : [wstr] Pointer to a string that contains the URL of the resource associated with the cache entry. This must be a unique name. The name string should not contain any escape characters.
lpCacheEntryInfo : [var] Pointer to a cache entry information buffer. If the buffer is not sufficient, this function returns ERROR_INSUFFICIENT_BUFFER and sets lpdwCacheEntryInfoBufferSize to the number of bytes required.
lpcbCacheEntryInfo : [var] Pointer to an unsigned long integer variable that specifies the size of the lpCacheEntryInfo buffer, in bytes. When the function returns, the variable contains the size, in bytes, of the actual buffer used or the number of bytes required to retrieve the cache entry file. The caller should check the return value in this parameter. If the return size is less than or equal to the size passed in, all the relevant data has been returned.
dwReserved : [int] This parameter is reserved and must be 0.
%inst
Locks the cache entry file associated with the specified URL.
(Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get extended error
information, call GetLastError. Possible error values include:
This doc was truncated.

[備考]
RetrieveUrlCacheEntryFile does not do any URL parsing, so a URL
containing an anchor (#) will not be found in the cache, even if the
resource is cached. For example, if the URL
http://adatum.com/example.htm#sample was passed, the function would
return ERROR_FILE_NOT_FOUND even if http://adatum.com/example.htm is
in the cache. The file is locked for the caller when it is retrieved;
the caller should unlock the file after the caller is finished with
the file. The cache manager automatically unlocks the files after a
certain interval. While the file is locked, the cache manager will
not remove the file from the cache. It is important to note that this
function may or may not perform efficiently, depending on the
internal implementation of the cache. For instance, if the URL data
is stored in a packed file that contains data for other URLs, the
cache will make a copy of the data to a file in a temporary directory
maintained by the cache. The cache will eventually delete the copy.
It is recommended that this function be used only in situations where
a file name is needed to launch an application.
RetrieveUrlCacheEntryStream and associated stream functions should be
used in most cases. Like all other aspects of the WinINet API, this
function cannot be safely called from within DllMain or the
constructors and destructors of global objects. Note WinINet does not
support server implementations. In addition, it should not be used
from a service. For server implementations or services use Microsoft
Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines RetrieveUrlCacheEntryFile as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
RetrieveUrlCacheEntryStreamW
Provides the most efficient and implementation-independent way to access the cache data. (Unicode)
%group
Win32 wininet
%prm
lpszUrlName, lpCacheEntryInfo, lpcbCacheEntryInfo, fRandomRead, dwReserved
lpszUrlName : [wstr] Pointer to a null-terminated string that contains the source name of the cache entry. This must be a unique name. The name string should not contain any escape characters.
lpCacheEntryInfo : [var] Pointer to an INTERNET_CACHE_ENTRY_INFO structure that receives information about the cache entry.
lpcbCacheEntryInfo : [var] Pointer to a variable that specifies the size, in bytes, of the lpCacheEntryInfo buffer. When the function returns, the variable receives the number of bytes copied to the buffer or the required size, in bytes, of the buffer. Note that this buffer size must accommodate both the INTERNET_CACHE_ENTRY_INFO structure and the associated strings that are stored immediately following it.
fRandomRead : [int] Whether the stream is open for random access. Set the flag to TRUE to open the stream for random access.
dwReserved : [int] This parameter is reserved and must be 0.
%inst
Provides the most efficient and implementation-independent way to
access the cache data. (Unicode)

[戻り値]
If the function succeeds, the function returns a valid handle for use
in the ReadUrlCacheEntryStream and UnlockUrlCacheEntryStream
functions. If the function fails, it returns NULL. To get extended
error information, call GetLastError. Possible error values include
the following.
This doc was truncated.

[備考]
RetrieveUrlCacheEntryStream does not do any URL parsing, so a URL
containing an anchor (#) will not be found in the cache, even if the
resource is cached. For example, if the URL
http://adatum.com/example.htm#sample is passed, the function returns
ERROR_FILE_NOT_FOUND even if http://adatum.com/example.htm is in the
cache. Cache clients that do not need URL data in the form of a file
should use this function to access the data for a particular URL.
Like all other aspects of the WinINet API, this function cannot be
safely called from within DllMain or the constructors and destructors
of global objects. Note WinINet does not support server
implementations. In addition, it should not be used from a service.
For server implementations or services use Microsoft Windows HTTP
Services (WinHTTP).
> [!NOTE] > The wininet.h header defines RetrieveUrlCacheEntryStream
as an alias which automatically selects the ANSI or Unicode version
of this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
RunOnceUrlCache
(no summary)
%group
Win32 wininet
%prm
hwnd, hinst, lpszCmd, nCmdShow
hwnd : [intptr] 
hinst : [intptr] 
lpszCmd : [str] 
nCmdShow : [int] 
%inst



%index
SetUrlCacheConfigInfoW
(no summary)
%group
Win32 wininet
%prm
lpCacheConfigInfo, dwFieldControl
lpCacheConfigInfo : [var] 
dwFieldControl : [int] 
%inst



%index
SetUrlCacheEntryGroup
The SetUrlCacheEntryGroup function (wininet.h) adds entries to or removes entries from a cache group.
%group
Win32 wininet
%prm
lpszUrlName, dwFlags, GroupId, pbGroupAttributes, cbGroupAttributes, lpReserved
lpszUrlName : [str] Pointer to a null-terminated string value that specifies the URL of the cached resource.
dwFlags : [int] 
GroupId : [int64] Identifier of the cache group that the entry will be added to or removed from.
pbGroupAttributes : [var] This parameter is reserved and must be NULL.
cbGroupAttributes : [int] This parameter is reserved and must be 0.
lpReserved : [intptr] This parameter is reserved and must be NULL.
%inst
The SetUrlCacheEntryGroup function (wininet.h) adds entries to or
removes entries from a cache group.

[戻り値]
Returns TRUE if successful, or FALSE otherwise.

[備考]
A cache entry can belong to more than one cache group. Like all other
aspects of the WinINet API, this function cannot be safely called
from within DllMain or the constructors and destructors of global
objects. Note WinINet does not support server implementations. In
addition, it should not be used from a service. For server
implementations or services use Microsoft Windows HTTP Services
(WinHTTP).


%index
SetUrlCacheEntryInfoW
Sets the specified members of the INTERNET_CACHE_ENTRY_INFO structure. (Unicode)
%group
Win32 wininet
%prm
lpszUrlName, lpCacheEntryInfo, dwFieldControl
lpszUrlName : [wstr] Pointer to a null-terminated string that specifies the name of the cache entry. The name string should not contain any escape characters.
lpCacheEntryInfo : [var] Pointer to an INTERNET_CACHE_ENTRY_INFO structure containing the values to be assigned to the cache entry designated by lpszUrlName.
dwFieldControl : [int] 
%inst
Sets the specified members of the INTERNET_CACHE_ENTRY_INFO
structure. (Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get extended error
information, call GetLastError. Possible error values include the
following.
This doc was truncated.

[備考]
Note WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines SetUrlCacheEntryInfo as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
SetUrlCacheGroupAttributeW
Sets the attribute information of the specified cache group. (Unicode)
%group
Win32 wininet
%prm
gid, dwFlags, dwAttributes, lpGroupInfo, lpReserved
gid : [int64] Identifier of the cache group.
dwFlags : [int] This parameter is reserved and must be 0.
dwAttributes : [int] 
lpGroupInfo : [var] Pointer to an INTERNET_CACHE_GROUP_INFO structure that specifies the attribute information to be stored.
lpReserved : [intptr] This parameter is reserved and must be NULL.
%inst
Sets the attribute information of the specified cache group.
(Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get specific error
information, call GetLastError.

[備考]
Note WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines SetUrlCacheGroupAttribute as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
SetUrlCacheHeaderData
(no summary)
%group
Win32 wininet
%prm
nIdx, dwData
nIdx : [int] 
dwData : [int] 
%inst



%index
ShowClientAuthCerts
(no summary)
%group
Win32 wininet
%prm
hWndParent
hWndParent : [intptr] 
%inst



%index
ShowSecurityInfo
(no summary)
%group
Win32 wininet
%prm
hWndParent, pSecurityInfo
hWndParent : [intptr] 
pSecurityInfo : [var] 
%inst



%index
ShowX509EncodedCertificate
(no summary)
%group
Win32 wininet
%prm
hWndParent, lpCert, cbCert
hWndParent : [intptr] 
lpCert : [var] 
cbCert : [int] 
%inst



%index
UnlockUrlCacheEntryFile
The UnlockUrlCacheEntryFile function (wininet.h) unlocks the cache entry that was locked while the file was retrieved for use from the cache.
%group
Win32 wininet
%prm
lpszUrlName, dwReserved
lpszUrlName : [str] Pointer to a null-terminated string that specifies the source name of the cache entry that is being unlocked. The name string should not contain any escape characters.
dwReserved : [int] This parameter is reserved and must be 0.
%inst
The UnlockUrlCacheEntryFile function (wininet.h) unlocks the cache
entry that was locked while the file was retrieved for use from the
cache.

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get extended error
information, call GetLastError. ERROR_FILE_NOT_FOUND indicates that
the cache entry specified by the source name is not found in the
cache storage.

[備考]
The application should not access the file after calling this
function. When this function returns, the cache manager is free to
delete the cache entry. Like all other aspects of the WinINet API,
this function cannot be safely called from within DllMain or the
constructors and destructors of global objects. Note WinINet does not
support server implementations. In addition, it should not be used
from a service. For server implementations or services use Microsoft
Windows HTTP Services (WinHTTP).


%index
UnlockUrlCacheEntryStream
Closes the stream that has been retrieved using the RetrieveUrlCacheEntryStream function.
%group
Win32 wininet
%prm
hUrlCacheStream, Reserved
hUrlCacheStream : [intptr] Handle that was returned by the RetrieveUrlCacheEntryStream function.
Reserved : [int] This parameter is reserved and must be NULL.
%inst
Closes the stream that has been retrieved using the
RetrieveUrlCacheEntryStream function.

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get extended error
information, call GetLastError.

[備考]
Note WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).


%index
UpdateUrlCacheContentPath
(no summary)
%group
Win32 wininet
%prm
szNewPath
szNewPath : [str] 
%inst



%index
UrlCacheCheckEntriesExist
(no summary)
%group
Win32 wininet
%prm
rgpwszUrls, cEntries, rgfExist
rgpwszUrls : [var] 
cEntries : [int] 
rgfExist : [var] 
%inst



%index
UrlCacheCloseEntryHandle
(no summary)
%group
Win32 wininet
%prm
hEntryFile
hEntryFile : [intptr] 
%inst



%index
UrlCacheContainerSetEntryMaximumAge
(no summary)
%group
Win32 wininet
%prm
pwszPrefix, dwEntryMaxAge
pwszPrefix : [wstr] 
dwEntryMaxAge : [int] 
%inst



%index
UrlCacheCreateContainer
(no summary)
%group
Win32 wininet
%prm
pwszName, pwszPrefix, pwszDirectory, ullLimit, dwOptions
pwszName : [wstr] 
pwszPrefix : [wstr] 
pwszDirectory : [wstr] 
ullLimit : [int64] 
dwOptions : [int] 
%inst



%index
UrlCacheFindFirstEntry
(no summary)
%group
Win32 wininet
%prm
pwszPrefix, dwFlags, dwFilter, GroupId, pCacheEntryInfo, phFind
pwszPrefix : [wstr] 
dwFlags : [int] 
dwFilter : [int] 
GroupId : [int64] 
pCacheEntryInfo : [var] 
phFind : [intptr] 
%inst



%index
UrlCacheFindNextEntry
(no summary)
%group
Win32 wininet
%prm
hFind, pCacheEntryInfo
hFind : [intptr] 
pCacheEntryInfo : [var] 
%inst



%index
UrlCacheFreeEntryInfo
(no summary)
%group
Win32 wininet
%prm
pCacheEntryInfo
pCacheEntryInfo : [var] 
%inst



%index
UrlCacheFreeGlobalSpace
(no summary)
%group
Win32 wininet
%prm
ullTargetSize, dwFilter
ullTargetSize : [int64] 
dwFilter : [int] 
%inst



%index
UrlCacheGetContentPaths
(no summary)
%group
Win32 wininet
%prm
pppwszDirectories, pcDirectories
pppwszDirectories : [var] 
pcDirectories : [var] 
%inst



%index
UrlCacheGetEntryInfo
(no summary)
%group
Win32 wininet
%prm
hAppCache, pcwszUrl, pCacheEntryInfo
hAppCache : [intptr] 
pcwszUrl : [wstr] 
pCacheEntryInfo : [var] 
%inst



%index
UrlCacheGetGlobalCacheSize
(no summary)
%group
Win32 wininet
%prm
dwFilter, pullSize, pullLimit
dwFilter : [int] 
pullSize : [var] 
pullLimit : [var] 
%inst



%index
UrlCacheGetGlobalLimit
(no summary)
%group
Win32 wininet
%prm
limitType, pullLimit
limitType : [int] 
pullLimit : [var] 
%inst



%index
UrlCacheReadEntryStream
(no summary)
%group
Win32 wininet
%prm
hUrlCacheStream, ullLocation, pBuffer, dwBufferLen, pdwBufferLen
hUrlCacheStream : [intptr] 
ullLocation : [int64] 
pBuffer : [intptr] 
dwBufferLen : [int] 
pdwBufferLen : [var] 
%inst



%index
UrlCacheReloadSettings
(no summary)
%group
Win32 wininet
%prm

%inst



%index
UrlCacheRetrieveEntryFile
(no summary)
%group
Win32 wininet
%prm
hAppCache, pcwszUrl, pCacheEntryInfo, phEntryFile
hAppCache : [intptr] 
pcwszUrl : [wstr] 
pCacheEntryInfo : [var] 
phEntryFile : [var] 
%inst



%index
UrlCacheRetrieveEntryStream
(no summary)
%group
Win32 wininet
%prm
hAppCache, pcwszUrl, fRandomRead, pCacheEntryInfo, phEntryStream
hAppCache : [intptr] 
pcwszUrl : [wstr] 
fRandomRead : [int] 
pCacheEntryInfo : [var] 
phEntryStream : [var] 
%inst



%index
UrlCacheServer
(no summary)
%group
Win32 wininet
%prm

%inst



%index
UrlCacheSetGlobalLimit
(no summary)
%group
Win32 wininet
%prm
limitType, ullLimit
limitType : [int] 
ullLimit : [int64] 
%inst



%index
UrlCacheUpdateEntryExtraData
(no summary)
%group
Win32 wininet
%prm
hAppCache, pcwszUrl, pbExtraData, cbExtraData
hAppCache : [intptr] 
pcwszUrl : [wstr] 
pbExtraData : [var] 
cbExtraData : [int] 
%inst


