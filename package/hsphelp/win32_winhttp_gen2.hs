; ============================================================
;   winhttp.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
WinHttpAddRequestHeaders
HTTP リクエストハンドルに 1 つ以上の HTTP リクエストヘッダを追加する。(WinHttpAddRequestHeaders)
%group
Win32 winhttp
%prm
hRequest, lpszHeaders, dwHeadersLength, dwModifiers
hRequest : [intptr] WinHttpOpenRequest が返した HINTERNET ハンドル。
lpszHeaders : [wstr] リクエストに追加するヘッダ文字列へのポインタ。最後以外の各ヘッダは CR/LF で終端すること。
dwHeadersLength : [int] pwszHeaders の長さ(文字数)。-1L なら NULL 終端とみなし長さが計算される。
dwModifiers : [int] 関数の意味を変更するフラグ群。以下のフラグを 1 つ以上組み合わせられる。
%inst
HTTP リクエストハンドルに 1 つ以上の HTTP リクエストヘッダを追加する。(WinHttpAddRequestHeaders)

[戻り値]
成功時は TRUE、失敗時は FALSE を返す。拡張エラー情報は GetLastError で取得する。主なエラーコードは以下の通り。
（以下省略）

[備考]
ヘッダはリダイレクト間で引き継がれる。これはセキュリティ上の問題になりうるため、WINHTTP_STATUS_CALLBACK
を使用してリダイレクト時に該当ヘッダを修正することが推奨される。非同期モード (WINHTTP_FLAG_ASYNC)
でも本関数は同期動作する。ヘッダ名と値は検証される。不正なヘッダを渡すと本関数は失敗し GetLastError は
ERROR_INVALID_PARAMETER を返す。Date: ヘッダを送るときは WinHttpTimeFromSystemTime
で構造体を作れる。単一呼び出しで複数ヘッダを渡せる。


%index
WinHttpAddRequestHeadersEx
Adds one or more HTTP request headers to an HTTP request handle, allowing you to use separate name/value strings.
%group
Win32 winhttp
%prm
hRequest, dwModifiers, ullFlags, ullExtra, cHeaders, pHeaders
hRequest : [intptr] Type: IN **[HINTERNET](/windows/win32/winhttp/hinternet-handles-in-winhttp)** An **HINTERNET** handle returned by a call to [WinHttpOpenRequest](/windows/win32/api/winhttp/nf-winhttp-winhttpopenrequest).
dwModifiers : [int] Type: IN **[DWORD](/windows/win32/winprog/windows-data-types)** An unsigned long integer value that contains the flags used to modify the semantics of this function. Can be one or more of the following flags.
ullFlags : [int64] Type: IN **[ULONGLONG](/windows/win32/winprog/windows-data-types)** Pass **WINHTTP_EXTENDED_HEADER_FLAG_UNICODE** to indicate that the strings passed in are Unicode strings.
ullExtra : [int64] Type: IN **[ULONGLONG](/windows/win32/winprog/windows-data-types)** Reserved.
cHeaders : [int] Type: IN **[DWORD](/windows/win32/winprog/windows-data-types)** The number of elements in *pHeaders*.
pHeaders : [var] Type: \_In\_reads\_(cHeaders) **[WINHTTP_EXTENDED_HEADER](/windows/win32/api/winhttp/ns-winhttp-winhttp_extended_header)\*** An array of **WINHTTP_EXTENDED_HEADER** structures.
%inst
Adds one or more HTTP request headers to an HTTP request handle,
allowing you to use separate name/value strings.

[戻り値]
A status code indicating the result of the operation. Among the error
codes returned are the following.
This doc was truncated.


%index
WinHttpCheckPlatform
The WinHttpCheckPlatform function determines whether the current platform is supported by this version of Microsoft Windows HTTP Services (WinHTTP).
%group
Win32 winhttp
%prm

%inst
The WinHttpCheckPlatform function determines whether the current
platform is supported by this version of Microsoft Windows HTTP
Services (WinHTTP).

[戻り値]
The return value is TRUE if the platform is supported by Microsoft
Windows HTTP Services (WinHTTP), or FALSE otherwise.

[備考]
This function is useful if your application uses Microsoft Windows
HTTP Services (WinHTTP), but also supports platforms that WinHTTP
does not. Even when WinHTTP is used in asynchronous mode (that is,
when WINHTTP_FLAG_ASYNC has been set in WinHttpOpen), this function
operates synchronously. The return value indicates success or
failure. To get extended error information, call GetLastError.
WinHTTP version 5.1 is an operating-system component of Windows 2000
with Service Pack 3 (SP3) and later (except Datacenter Server),
Windows XP with Service Pack 1 (SP1) and later, and Windows Server
2003. In Windows Server 2003, WinHTTP is a system side-by-side
assembly. For more information, see Run-Time Requirements.


%index
WinHttpCloseHandle
単一の **HINTERNET** ハンドルを閉じる。
%group
Win32 winhttp
%prm
hInternet
hInternet : [intptr] 閉じる有効な **HINTERNET** ハンドル。
%inst
単一の **HINTERNET** ハンドルを閉じる。

[戻り値]
ハンドルが正常に閉じられた場合は **TRUE**、そうでなければ **FALSE**。拡張エラー情報は GetLastError
で取得する。主なエラーコードは以下の通り。
（以下省略）

[備考]
非同期モード (WINHTTP_FLAG_ASYNC)
でも本関数は同期動作する。閉じるハンドルに状態コールバックが登録されており、ハンドルに非 NULL
コンテキスト値が設定されている場合、WINHTTP_CALLBACK_STATUS_HANDLE_CLOSING
コールバックが呼ばれる。これがそのハンドルからの最後のコールバックであり、ハンドルが破棄されることを示す。WinHttpCloseHandle
で進行中の非同期リクエストを中断できる。留意事項は以下の通り:
（以下省略）


%index
WinHttpConnect
HTTP リクエストの初期ターゲットサーバーを指定し、その初期ターゲットに対する HTTP セッション用の HINTERNET 接続ハンドルを返す。
%group
Win32 winhttp
%prm
hSession, pswzServerName, nServerPort, dwReserved
hSession : [intptr] 以前の WinHttpOpen 呼び出しが返した有効な HINTERNET WinHTTP セッションハンドル。
pswzServerName : [wstr] HTTP サーバーのホスト名を含む NULL 終端文字列へのポインタ。ASCII 形式の IP アドレス(例: 10.0.1.45)でもよい。WinHttp は国際化ホスト名を先に Punycode に変換せずに受け付けないので注意。
nServerPort : [int] 
dwReserved : [int] 予約。0 を指定する。
%inst
HTTP リクエストの初期ターゲットサーバーを指定し、その初期ターゲットに対する HTTP セッション用の HINTERNET
接続ハンドルを返す。

[戻り値]
接続成功時は HTTP セッションへの有効な接続ハンドルを返し、それ以外は NULL を返す。拡張エラー情報は GetLastError
で取得する。主なエラーコードは以下の通り。
（以下省略）

[備考]
非同期モードでも同期動作する。戻り値は成否を示す。WinHttpConnect が返した HINTERNET ハンドルは使用後
WinHttpCloseHandle で閉じる必要がある。WinHttpConnect はターゲット HTTP
サーバーを指定するが、リダイレクトされた場合は別のサーバーから応答が来ることがある。応答サーバーの URL は
WinHttpQueryOption を WINHTTP_OPTION_URL フラグで呼び出して取得できる。


%index
WinHttpCrackUrl
The WinHttpCrackUrl function separates a URL into its component parts such as host name and path.
%group
Win32 winhttp
%prm
pwszUrl, dwUrlLength, dwFlags, lpUrlComponents
pwszUrl : [wstr] Pointer to a string that contains the canonical URL to separate. WinHttpCrackUrl does not check this URL for validity or correct format before attempting to crack it.
dwUrlLength : [int] The length of the pwszUrl string, in characters. If dwUrlLength is set to zero, WinHttpCrackUrl assumes that the pwszUrl string is null terminated and  determines the length of the pwszUrl string based on that assumption.
dwFlags : [int] The flags that control the operation. This parameter can be a combination of one or more of the following flags (values can be bitwise OR'd together). Or, the parameter can be 0, which performs no special operations.
lpUrlComponents : [var] Pointer to a URL_COMPONENTS structure that receives the URL components.
%inst
The WinHttpCrackUrl function separates a URL into its component parts
such as host name and path.

[戻り値]
Returns TRUE if the function succeeds, or FALSE otherwise. To get
extended error information, call GetLastError. Among the error codes
returned are the following.
This doc was truncated.

[備考]
Even when WinHTTP is used in asynchronous mode (that is, when
WINHTTP_FLAG_ASYNC has been set in WinHttpOpen), this function
operates synchronously. The return value indicates success or
failure. To get extended error information, call GetLastError. The
required components are indicated by members of the URL_COMPONENTS
structure. Each component has a pointer to the value and has a member
that stores the length of the stored value. If both the value and the
length for a component are equal to zero, that component is not
returned. If the pointer to the value of the component is not NULL
and the value of its corresponding length member is nonzero, the
address of the first character of the corresponding component in the
pwszUrl string is stored in the pointer, and the length of the
component is stored in the length member. If the pointer contains the
address of the user-supplied buffer, the length member must contain
the size of the buffer. The WinHttpCrackUrl function copies the
component into the buffer, and the length member is set to the length
of the copied component, minus 1 for the trailing string terminator.
If a user-supplied buffer is not large enough, WinHttpCrackUrl
returns FALSE, and GetLastError returns ERROR_INSUFFICIENT_BUFFER.
For WinHttpCrackUrl to work properly, the size of the URL_COMPONENTS
structure must be stored in the dwStructSize member of that
structure. If the Internet protocol of the URL passed in for pwszUrl
is not HTTP or HTTPS, then WinHttpCrackUrl returns FALSE and
GetLastError indicates ERROR_WINHTTP_UNRECOGNIZED_SCHEME.
WinHttpCrackUrl does not check the validity or format of a URL before
attempting to crack it. As a result, if a string such as
""http://server?Bad=URL"" is passed in, the function returns
incorrect results. Note For Windows XP and Windows 2000, see the
Run-Time Requirements section of the WinHttp start page.


%index
WinHttpCreateProxyResolver
Creates a handle for use by WinHttpGetProxyForUrlEx.
%group
Win32 winhttp
%prm
hSession, phResolver
hSession : [intptr] Valid HINTERNET WinHTTP session handle returned by a previous call to WinHttpOpen. The session handle must be opened using WINHTTP_FLAG_ASYNC.
phResolver : [var] A pointer to a new handle for use by WinHttpGetProxyForUrlEx.  When finished or cancelling an outstanding operation, close this handle with WinHttpCloseHandle.
%inst
Creates a handle for use by WinHttpGetProxyForUrlEx.

[戻り値]
A status code indicating the result of the operation.
This doc was truncated.


%index
WinHttpCreateUrl
Creates a URL from component parts such as the host name and path.
%group
Win32 winhttp
%prm
lpUrlComponents, dwFlags, pwszUrl, pdwUrlLength
lpUrlComponents : [var] Pointer to a URL_COMPONENTS structure that contains the components from which to create the URL.
dwFlags : [int] 
pwszUrl : [wstr] Pointer to a character buffer that receives the URL as a wide character (Unicode) string.
pdwUrlLength : [var] Pointer to a variable of type unsigned long integer that receives the length of the pwszUrl buffer in wide (Unicode) characters. When the function returns, this parameter receives the length of the URL string wide in characters, minus 1 for the terminating character. If GetLastError returns ERROR_INSUFFICIENT_BUFFER, this parameter receives the number of wide characters required to hold the created URL.
%inst
Creates a URL from component parts such as the host name and path.

[戻り値]
Returns TRUE if the function succeeds, or FALSE otherwise. To get
extended error data, call GetLastError. Among the error codes
returned are the following.
This doc was truncated.

[備考]
Even when WinHTTP is used in asynchronous mode, that is, when
WINHTTP_FLAG_ASYNC has been set in WinHttpOpen, this function
operates synchronously. The return value indicates success or
failure. To get extended error data, call GetLastError. Note For
Windows XP and Windows 2000, see the Run-Time Requirements section of
the WinHttp start page.


%index
WinHttpDetectAutoProxyConfigUrl
Finds the URL for the Proxy Auto-Configuration (PAC) file.
%group
Win32 winhttp
%prm
dwAutoDetectFlags, ppwstrAutoConfigUrl
dwAutoDetectFlags : [int] A data type that specifies what protocols to use to locate the PAC file. If both the DHCP and DNS auto detect flags are set, DHCP is used first; if no PAC URL is discovered using DHCP, then DNS is used.
ppwstrAutoConfigUrl : [var] A data type that returns a pointer to a null-terminated Unicode string that contains the configuration URL that receives the proxy data. You must free the string pointed to by ppwszAutoConfigUrl using the GlobalFree function.
%inst
Finds the URL for the Proxy Auto-Configuration (PAC) file.

[戻り値]
Returns TRUE if successful, or FALSE otherwise. For extended error
information, call GetLastError. Among the error codes returned are
the following.
This doc was truncated.

[備考]
WinHTTP implements the Web Proxy Auto-Discovery (WPAD) protocol,
often referred to as autoproxy. For more information about well-known
locations, see the Discovery Process section of the WPAD protocol
document. Note that because the WinHttpDetectAutoProxyConfigUrl
function takes time to complete its operation, it should not be
called from a UI thread.


%index
WinHttpFreeProxyResult
The WinHttpFreeProxyResult function frees the data retrieved from a previous call to WinHttpGetProxyResult.
%group
Win32 winhttp
%prm
pProxyResult
pProxyResult : [var] A pointer to a WINHTTP_PROXY_RESULT structure retrieved from a previous call to WinHttpGetProxyResult.
%inst
The WinHttpFreeProxyResult function frees the data retrieved from a
previous call to WinHttpGetProxyResult.

[戻り値]
This function does not return a value.

[備考]
Upon completion, all internal members of pProxyResult will be zeroed
and the memory allocated to those members will be freed. If
pProxyResult is an allocated pointer, the caller must free the
pointer.


%index
WinHttpFreeProxyResultEx
(no summary)
%group
Win32 winhttp
%prm
pProxyResultEx
pProxyResultEx : [var] 
%inst



%index
WinHttpFreeProxySettings
(no summary)
%group
Win32 winhttp
%prm
pWinHttpProxySettings
pWinHttpProxySettings : [var] 
%inst



%index
WinHttpGetDefaultProxyConfiguration
Retrieves the default WinHTTP proxy configuration from the registry.
%group
Win32 winhttp
%prm
pProxyInfo
pProxyInfo : [var] A pointer to a variable of type WINHTTP_PROXY_INFO that receives the default proxy configuration.
%inst
Retrieves the default WinHTTP proxy configuration from the registry.

[戻り値]
Returns TRUE if successful or FALSE otherwise. To retrieve a specific
error message, call GetLastError. Error codes returned include the
following.
This doc was truncated.

[備考]
WinHttpGetDefaultProxyConfiguration retrieves the proxy configuration
set by WinHttpSetDefaultProxyConfiguration or ProxyCfg.exe. The
default proxy configuration can be overridden for a WinHTTP session
by calling WinHttpSetOption and specifying the WINHTTP_OPTION_PROXY
flag. WinHttpGetDefaultProxyConfiguration does not retrieve the
configuration for the current session. It retrieves the configuration
specified in the registry. If the registry contains a list of proxy
servers, the dwAccessType member of pProxyInfo is set to
WINHTTP_ACCESS_TYPE_NAMED_PROXY. Otherwise, it is set to
WINHTTP_ACCESS_TYPE_NO_PROXY. WinHttpGetDefaultProxyConfiguration
allocates memory for the string members of pProxyInfo. To free this
memory, call GlobalFree. Even when WinHTTP is used in asynchronous
mode (that is, when WINHTTP_FLAG_ASYNC has been set in WinHttpOpen),
this function operates synchronously. The return value indicates
success or failure. To get extended error information, call
GetLastError. Note For Windows XP and Windows 2000, see the Run-Time
Requirements section of the WinHTTP Start Page.


%index
WinHttpGetIEProxyConfigForCurrentUser
Retrieves the Internet Explorer proxy configuration for the current user.
%group
Win32 winhttp
%prm
pProxyConfig
pProxyConfig : [var] A pointer, on input, to a WINHTTP_CURRENT_USER_IE_PROXY_CONFIG structure. On output, the structure contains the Internet Explorer proxy settings for the current active network connection (for example, LAN, dial-up, or VPN connection).
%inst
Retrieves the Internet Explorer proxy configuration for the current
user.

[戻り値]
Returns TRUE if successful, or FALSE otherwise. For extended error
information, call GetLastError. Among the error codes returned are
the following.
This doc was truncated.

[備考]
In Internet Explorer, the proxy settings are found on the Connections
tab of the Tools / Internet Options menu option. Proxy settings are
configured on a per-connection basis; that is, the proxy settings for
a LAN connection are separate from those for a dial-up or VPN
connection. WinHttpGetIEProxyConfigForCurrentUser returns the proxy
settings for the current active connection. This function is useful
in client applications running in network environments in which the
Web Proxy Auto-Discovery (WPAD) protocol is not implemented (meaning
that no Proxy Auto-Configuration file is available). If a PAC file is
not available, then the WinHttpGetProxyForUrl function fails. The
WinHttpGetIEProxyConfigForCurrentUser function can be used as a
fall-back mechanism to discover a workable proxy configuration by
retrieving the user's proxy configuration in Internet Explorer. This
function should not be used in a service process that does not
impersonate a logged-on user.If the caller does not impersonate a
logged on user, WinHTTP attempts to retrieve the Internet Explorer
settings for the current service process: for example, the local
service or the network service. If the Internet Explorer settings are
not configured for these system accounts, the call to
WinHttpGetIEProxyConfigForCurrentUser will fail. The caller must free
the lpszProxy, lpszProxyBypass and lpszAutoConfigUrl strings in the
WINHTTP_CURRENT_USER_IE_PROXY_CONFIG structure if they are non-NULL.
Use GlobalFree to free the strings.


%index
WinHttpGetProxyForUrl
Retrieves the proxy data for the specified URL. (WinHttpGetProxyForUrl)
%group
Win32 winhttp
%prm
hSession, lpcwszUrl, pAutoProxyOptions, pProxyInfo
hSession : [intptr] The WinHTTP session handle returned by the WinHttpOpen function.
lpcwszUrl : [wstr] A pointer to a null-terminated Unicode string that contains the URL of the HTTP request that the application is preparing to send.
pAutoProxyOptions : [var] A pointer to a WINHTTP_AUTOPROXY_OPTIONS structure that specifies the auto-proxy options to use.
pProxyInfo : [var] A pointer to a WINHTTP_PROXY_INFO structure that receives the proxy setting. This structure is then applied to the request handle using the WINHTTP_OPTION_PROXY option. Free the lpszProxy and lpszProxyBypass strings contained in this structure (if they are non-NULL) using the GlobalFree function.
%inst
Retrieves the proxy data for the specified URL.
(WinHttpGetProxyForUrl)

[戻り値]
If the function succeeds, the function returns TRUE.
If the function fails, it returns FALSE. For extended error data,
call GetLastError. Possible error codes include the folllowing.
This doc was truncated.

[備考]
This function implements the Web Proxy Auto-Discovery (WPAD) protocol
for automatically configuring the proxy settings for an HTTP request.
The WPAD protocol downloads a Proxy Auto-Configuration (PAC) file,
which is a script that identifies the proxy server to use for a given
target URL. PAC files are typically deployed by the IT department
within a corporate network environment. The URL of the PAC file can
either be specified explicitly or WinHttpGetProxyForUrl can be
instructed to automatically discover the location of the PAC file on
the local network. WinHttpGetProxyForUrl supports only
ECMAScript-based PAC files. WinHttpGetProxyForUrl must be called on a
per-URL basis, because the PAC file can return a different proxy
server for different URLs. This is useful because the PAC file
enables an IT department to implement proxy server load balancing by
mapping (hashing) the target URL (specified by the lpcwszUrl
parameter) to a certain proxy in a proxy server array.
WinHttpGetProxyForUrl caches the autoproxy URL and the autoproxy
script when auto-discovery is specified in the dwFlags member of the
pAutoProxyOptions structure. For more information, see Autoproxy
Cache.


%index
WinHttpGetProxyForUrlEx
Retrieves the proxy data for the specified URL. (WinHttpGetProxyForUrlEx)
%group
Win32 winhttp
%prm
hResolver, pcwszUrl, pAutoProxyOptions, pContext
hResolver : [intptr] The WinHTTP resolver handle returned by the WinHttpCreateProxyResolver function.
pcwszUrl : [wstr] A pointer to a null-terminated Unicode string that contains a URL for which proxy information will be determined.
pAutoProxyOptions : [var] A pointer to a WINHTTP_AUTOPROXY_OPTIONS structure that specifies the auto-proxy options to use.
pContext : [int] Context data that will be passed to the completion callback function.
%inst
Retrieves the proxy data for the specified URL.
(WinHttpGetProxyForUrlEx)

[戻り値]
A status code indicating the result of the operation.
This doc was truncated.

[備考]
This function implements the Web Proxy Auto-Discovery (WPAD) protocol
for automatically configuring the proxy settings for an HTTP request.
The WPAD protocol downloads a Proxy Auto-Configuration (PAC) file,
which is a script that identifies the proxy server to use for a given
target URL. PAC files are typically deployed by the IT department
within a corporate network environment. The URL of the PAC file can
either be specified explicitly or WinHttpGetProxyForUrlEx can be
instructed to automatically discover the location of the PAC file on
the local network. WinHttpGetProxyForUrlEx supports only
ECMAScript-based PAC files. WinHttpGetProxyForUrlEx must be called on
a per-URL basis, because the PAC file can return a different proxy
server for different URLs. This is useful because the PAC file
enables an IT department to implement proxy server load balancing by
mapping (hashing) the target URL (specified by the lpcwszUrl
parameter) to a certain proxy in a proxy server array.
WinHttpGetProxyForUrlEx caches the autoproxy URL and the autoproxy
script when auto-discovery is specified in the dwFlags member of the
pAutoProxyOptions structure. For more information, see Autoproxy
Cache. WinHttpGetProxyForUrlEx provides a fully Asynchronous and
cancellable API that WinHttpGetProxyForUrl does not.
WinHttpGetProxyForUrlEx also provides the application with the full
proxy list that was returned by the PAC script allowing the
application to better handle failover to "DIRECT" and to understand
SOCKS if desired. WinHttpGetProxyForUrlEx always executes
asynchronously and returns immediately with ERROR_IO_PENDING on
success. The callback is set by calling WinHttpSetStatusCallback on
the hSession provided by WinHttpOpen. Alternately call
WinHttpSetStatusCallback on the hResolver provided by
WinHttpCreateProxyResolver to have a specific callback for each call.
You must call WinHttpSetStatusCallback before
WinHttpCreateProxyResolver. When calling WinHttpSetStatusCallback,
use WINHTTP_CALLBACK_FLAG_REQUEST_ERROR |
WINHTTP_CALLBACK_FLAG_GETPROXYFORURL_COMPLETE. See
WINHTTP_STATUS_CALLBACK for information on the use of the callback.
Once a callback of status
WINHTTP_CALLBACK_STATUS_GETPROXYFORURL_COMPLETE is returned, the
application can call WinHttpGetProxyResult on the resolver handle
used to issue WinHttpGetProxyForUrlEx to receive the results of that
call.
If the call fails after returning ERROR_IO_PENDING then a callback of
WINHTTP_CALLBACK_STATUS_REQUEST_ERROR will be issued. This function
always executes out-of-process.


%index
WinHttpGetProxyForUrlEx2
(no summary)
%group
Win32 winhttp
%prm
hResolver, pcwszUrl, pAutoProxyOptions, cbInterfaceSelectionContext, pInterfaceSelectionContext, pContext
hResolver : [intptr] 
pcwszUrl : [wstr] 
pAutoProxyOptions : [var] 
cbInterfaceSelectionContext : [int] 
pInterfaceSelectionContext : [var] 
pContext : [int] 
%inst



%index
WinHttpGetProxyResult
The WinHttpGetProxyResult function retrieves the results of a call to WinHttpGetProxyForUrlEx.
%group
Win32 winhttp
%prm
hResolver, pProxyResult
hResolver : [intptr] The resolver handle used to issue a previously completed call to WinHttpGetProxyForUrlEx.
pProxyResult : [var] A pointer to a WINHTTP_PROXY_RESULT structure that contains the results of a previous call to WinHttpGetProxyForUrlEx.  The results must be freed by calling WinHttpFreeProxyResult.
%inst
The WinHttpGetProxyResult function retrieves the results of a call to
WinHttpGetProxyForUrlEx.

[戻り値]
A status code indicating the result of the operation.
This doc was truncated.


%index
WinHttpGetProxyResultEx
(no summary)
%group
Win32 winhttp
%prm
hResolver, pProxyResultEx
hResolver : [intptr] 
pProxyResultEx : [var] 
%inst



%index
WinHttpGetProxySettingsVersion
(no summary)
%group
Win32 winhttp
%prm
hSession, pdwProxySettingsVersion
hSession : [intptr] 
pdwProxySettingsVersion : [var] 
%inst



%index
WinHttpOpen
アプリケーションに対して WinHTTP 関数の使用を初期化し、WinHTTP セッションハンドルを返す。
%group
Win32 winhttp
%prm
pszAgentW, dwAccessType, pszProxyW, pszProxyBypassW, dwFlags
pszAgentW : [wstr] WinHTTP 関数を呼び出すアプリケーション名または主体名を含む文字列へのポインタ。HTTP プロトコルで user agent として使用される。
dwAccessType : [int] 
pszProxyW : [wstr] dwAccessType が WINHTTP_ACCESS_TYPE_NAMED_PROXY のとき使用するプロキシサーバー名を含む文字列へのポインタ。WinHTTP は HTTP 用の CERN 型プロキシのみ認識する。それ以外の dwAccessType では WINHTTP_NO_PROXY_NAME を指定する。
pszProxyBypassW : [wstr] WINHTTP_ACCESS_TYPE_NAMED_PROXY 時にプロキシを経由しないホスト名/IP アドレスのセミコロン区切りリスト(省略可)へのポインタ。ワイルドカード可。空文字列は使わないこと。それ以外の dwAccessType では WINHTTP_NO_PROXY_BYPASS を指定する。
dwFlags : [int] 動作オプションを示すフラグ。以下の値を指定できる。
%inst
アプリケーションに対して WinHTTP 関数の使用を初期化し、WinHTTP セッションハンドルを返す。

[戻り値]
成功時は有効なセッションハンドル、それ以外は NULL を返す。拡張エラー情報は GetLastError
で取得する。主なエラーコードは以下の通り。
（以下省略）

[備考]
非同期モード (WINHTTP_FLAG_ASYNC) での使用が強く推奨される。WinHttpOpen はアプリケーションが最初に呼ぶ
WinHTTP 関数であり、内部データ構造を初期化し以降の呼び出しに備える。使用終了時は WinHttpCloseHandle
でセッションハンドルを解放する必要がある。複数回呼んでも構わないが、通常 1
回で十分。ユーザーデータは複数セッションコンテキスト間で共有されないため、複数ユーザーの代理でリクエストを行うアプリは各ユーザーごとに別セッションを作成すべき。


%index
WinHttpOpenRequest
HTTP リクエストハンドルを作成する。
%group
Win32 winhttp
%prm
hConnect, pwszVerb, pwszObjectName, pwszVersion, pwszReferrer, ppwszAcceptTypes, dwFlags
hConnect : [intptr] WinHttpConnect が返した HTTP セッションへの HINTERNET 接続ハンドル。
pwszVerb : [wstr] 使用する HTTP verb を含む文字列へのポインタ。NULL なら GET を使用する。大文字で書くこと。多くのサーバーは verb を大文字小文字区別するため。
pwszObjectName : [wstr] 指定 HTTP verb のターゲットリソース名を含む文字列へのポインタ。通常はファイル名、実行モジュール、検索指定子。
pwszVersion : [wstr] HTTP バージョンを含む文字列へのポインタ。NULL なら HTTP/1.1 を使用する。
pwszReferrer : [wstr] pwszObjectName の URL の元ドキュメント URL を指定する文字列へのポインタ。WINHTTP_NO_REFERER を指定すると referer は指定されない。
ppwszAcceptTypes : [var] クライアントが受け入れるメディアタイプを指定する NULL 終端文字列ポインタ配列。WINHTTP_DEFAULT_ACCEPT_TYPES の場合、クライアントは何も受け入れない。
dwFlags : [int] 
%inst
HTTP リクエストハンドルを作成する。

[戻り値]
成功時は有効な HTTP リクエストハンドル、失敗時は NULL を返す。拡張エラー情報は GetLastError
で取得する。主なエラーコードは以下の通り。
（以下省略）

[備考]
新しい HTTP リクエストハンドルを作成し指定パラメータを格納する。HTTP リクエストハンドルは HTTP
サーバーに送るリクエストと、リクエストの一部として送られるすべての RFC822/MIME/HTTP ヘッダを保持する。pwszVerb
が "HEAD" の場合、Content-Length ヘッダは無視される。WinHttpSetStatusCallback
で状態コールバックが登録されている場合、WINHTTP_CALLBACK_STATUS_HANDLE_CREATED
通知が行われる。使用後は WinHttpCloseHandle で閉じること。


%index
WinHttpQueryAuthSchemes
The WinHttpQueryAuthSchemes function returns the authorization schemes that are supported by the server.
%group
Win32 winhttp
%prm
hRequest, lpdwSupportedSchemes, lpdwFirstScheme, pdwAuthTarget
hRequest : [intptr] Valid HINTERNET handle returned by WinHttpOpenRequest
lpdwSupportedSchemes : [var] An unsigned integer that specifies a flag that contains the supported authentication schemes.  This parameter can return one or more flags that are identified in the following table.
lpdwFirstScheme : [var] An unsigned integer that specifies a flag that contains the  first authentication scheme listed by the server.  This parameter can return one or more flags that are identified in the following table.
pdwAuthTarget : [var] An unsigned integer that specifies a flag that contains the authentication target.  This parameter can return one or more flags that are identified in the following table.
%inst
The WinHttpQueryAuthSchemes function returns the authorization
schemes that are supported by the server.

[戻り値]
Returns TRUE if successful, or FALSE if unsuccessful. To get extended
error information, call GetLastError. The following table identifies
the error codes that are returned.
This doc was truncated.

[備考]
Even when WinHTTP is used in asynchronous mode (that is, when
WINHTTP_FLAG_ASYNC is set in WinHttpOpen), this function operates
synchronously. The return value indicates success or failure. To get
extended error information, call GetLastError.
WinHttpQueryAuthSchemes cannot be used before calling
WinHttpQueryHeaders. Note For Windows XP and Windows 2000 see the
Run-Time Requirements section of the WinHttp start page.


%index
WinHttpQueryDataAvailable
WinHttpReadData で読み取り可能なデータ量(バイト単位)を返す。
%group
Win32 winhttp
%prm
hRequest, lpdwNumberOfBytesAvailable
hRequest : [intptr] WinHttpOpenRequest が返した有効な HINTERNET ハンドル。WinHttpQueryDataAvailable を呼ぶ前に WinHttpReceiveResponse を完了させておく必要がある。
lpdwNumberOfBytesAvailable : [var] 利用可能バイト数を受け取る ULONG 変数へのポインタ。非同期モードでは必ず NULL にしてコールバックで取得すること。
%inst
WinHttpReadData で読み取り可能なデータ量(バイト単位)を返す。

[戻り値]
成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。主なエラーコードは以下の通り。
（以下省略）

[備考]
非同期モード (WINHTTP_FLAG_ASYNC) でも同期/非同期のどちらでも動作する。FALSE を返した場合は
GetLastError で原因取得。TRUE を返した場合は
WINHTTP_CALLBACK_STATUS_DATA_AVAILABLE 完了コールバックで結果とパラメータを判断する。警告:
非同期モードでは lpdwNumberOfBytesAvailable に必ず NULL
を渡し、コールバック関数内でバイト数を取得すること。そうしないとメモリフォールトが発生する可能性がある。本関数は、次の
WinHttpReadData 呼び出しで即座に読み取れるバイト数を返す。応答終了の判定には WinHttpReadData
の戻り値を使うこと。WinHttpOpenRequest で作成し WinHttpSendRequest
で送信したハンドルでは、WinHttpReceiveResponse を先に呼ぶ必要がある。


%index
WinHttpQueryHeaders
HTTP リクエストに関連するヘッダ情報を取得する。
%group
Win32 winhttp
%prm
hRequest, dwInfoLevel, pwszName, lpBuffer, lpdwBufferLength, lpdwIndex
hRequest : [intptr] WinHttpOpenRequest が返した HINTERNET リクエストハンドル。WinHttpReceiveResponse を完了させておく必要がある。
dwInfoLevel : [int] 属性フラグと修飾フラグの組み合わせ。Query Info Flags を参照。
pwszName : [wstr] ヘッダ名を含む文字列へのポインタ。dwInfoLevel のフラグが WINHTTP_QUERY_CUSTOM でない場合は WINHTTP_HEADER_NAME_BY_INDEX を指定する。
lpBuffer : [intptr] 情報を受け取るバッファへのポインタ。WINHTTP_NO_OUTPUT_BUFFER を指定すると関数は FALSE を返し、GetLastError は ERROR_INSUFFICIENT_BUFFER を返して lpdwBufferLength に必要バイト数を格納する。
lpdwBufferLength : [var] データバッファ長を保持する DWORD へのポインタ。復帰後はバッファに書き込まれた情報のサイズを受け取る。文字列を返す場合のルールは以下の通り。
lpdwIndex : [var] 同名の複数ヘッダを列挙するための 0 始まりのヘッダインデックス。呼び出し時は返したいヘッダのインデックス、復帰時は次のヘッダのインデックスを受け取る。WINHTTP_NO_HEADER_INDEX を指定すると最初の出現のみ返す。
%inst
HTTP リクエストに関連するヘッダ情報を取得する。

[戻り値]
成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。主なエラーコードは以下の通り。
（以下省略）

[備考]
非同期モードでも本関数は同期動作する。既定では文字列を返すが、dwInfoLevel に修飾フラグを付けて SYSTEMTIME や
DWORD として取得することもできる。返せるデータ型と対応フラグは以下の通り。
（以下省略）


%index
WinHttpQueryOption
The WinHttpQueryOption function queries an Internet option on the specified handle.
%group
Win32 winhttp
%prm
hInternet, dwOption, lpBuffer, lpdwBufferLength
hInternet : [intptr] An HINTERNET handle on which to query information. Note that this can be either a Session handle or a Request handle, depending on what option is being queried; see the  Option Flags topic to determine which handle is appropriate to use in querying a particular option.
dwOption : [int] An unsigned long integer value that contains the Internet option to query. This can be one of the Option Flags values.
lpBuffer : [intptr] A pointer to a buffer that receives the option setting. Strings returned by the WinHttpQueryOption function are globally allocated, so the calling application must globally free the string when it finishes using it. Setting this parameter to NULL causes this function to return FALSE.  Calling GetLastError then returns ERROR_INSUFFICIENT_BUFFER and lpdwBufferLength          contains the number of bytes required to hold the requested information.
lpdwBufferLength : [var] A pointer to an unsigned long integer variable that contains the length of lpBuffer, in bytes. When the function returns, the variable receives the length of the data placed into lpBuffer. If GetLastError returns ERROR_INSUFFICIENT_BUFFER, this parameter receives the number of bytes required to hold the requested information.
%inst
The WinHttpQueryOption function queries an Internet option on the
specified handle.

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get a specific
error message, call GetLastError. Among the error codes returned are
the following:
This doc was truncated.

[備考]
Even when WinHTTP is used in asynchronous mode (that is, when
WINHTTP_FLAG_ASYNC has been set in WinHttpOpen), this function
operates synchronously. The return value indicates success or
failure. To get extended error information, call GetLastError.
GetLastError returns the ERROR_INVALID_PARAMETER if an option flag
that is invalid for the specified handle type is passed to the
dwOption parameter. Note For Windows XP and Windows 2000, see the
Run-Time Requirements section of the WinHttp start page.


%index
WinHttpReadData
WinHttpOpenRequest で開いたハンドルからデータを読み取る。
%group
Win32 winhttp
%prm
hRequest, lpBuffer, dwNumberOfBytesToRead, lpdwNumberOfBytesRead
hRequest : [intptr] WinHttpOpenRequest が返した有効な HINTERNET ハンドル。WinHttpReceiveResponse または WinHttpQueryDataAvailable を完了させておく必要がある。
lpBuffer : [intptr] 読み取ったデータを受け取るバッファへのポインタ。WinHttpReadData 完了まで有効である必要がある。
dwNumberOfBytesToRead : [int] 読み取るバイト数。
lpdwNumberOfBytesRead : [var] 読み取ったバイト数を受け取る ULONG 変数へのポインタ。本関数は作業前にこの値を 0 に設定する。非同期モードでは必ず NULL にしてコールバックで取得すること。
%inst
WinHttpOpenRequest で開いたハンドルからデータを読み取る。

[戻り値]
成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。返されるエラーコード一覧は以下の通り。
（以下省略）

[備考]
Windows Vista/Windows Server 2008 以降、WinHttp
はサーバー送信データのチャンク転送エンコードに対応する。Transfer-Encoding
ヘッダが応答にある場合、WinHttpReadData
はチャンク情報を取り除いてからアプリにデータを渡す。非同期モードでも同期/非同期どちらでも動作する。警告: 非同期モードでは
lpdwNumberOfBytesRead に必ず NULL
を渡し、コールバックで取得すること。読み取りバッファが非常に小さいと本関数は同期的に完了することがあり、WINHTTP_CALLBACK_STATUS_READ_COMPLETE
で再度 WinHttpReadData を呼ぶとスタックオーバーフローを招くため、内部バッファと同程度 (8 KB)
以上のバッファを使うのが望ましい。同期モードで TRUE かつ読み取りバイト数 0 の場合は応答終了を意味する。


%index
WinHttpReadProxySettings
(no summary)
%group
Win32 winhttp
%prm
hSession, pcwszConnectionName, fFallBackToDefaultSettings, fSetAutoDiscoverForDefaultSettings, pdwSettingsVersion, pfDefaultSettingsAreReturned, pWinHttpProxySettings
hSession : [intptr] 
pcwszConnectionName : [wstr] 
fFallBackToDefaultSettings : [int] 
fSetAutoDiscoverForDefaultSettings : [int] 
pdwSettingsVersion : [var] 
pfDefaultSettingsAreReturned : [var] 
pWinHttpProxySettings : [var] 
%inst



%index
WinHttpReceiveResponse
WinHttpSendRequest で開始された HTTP リクエストに対する応答受信を待つ。
%group
Win32 winhttp
%prm
hRequest, lpReserved
hRequest : [intptr] WinHttpOpenRequest が返し WinHttpSendRequest で送信した HINTERNET ハンドル。WinHttpSendRequest が完了するまで待ってから呼び出す。
lpReserved : [intptr] 予約。NULL を指定する必要がある。
%inst
WinHttpSendRequest で開始された HTTP リクエストに対する応答受信を待つ。

[戻り値]
成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。主なエラーコードは以下の通り。
（以下省略）

[備考]
非同期モードでは同期/非同期いずれでも動作する。TRUE を返した場合、成功なら
WINHTTP_CALLBACK_STATUS_HEADERS_AVAILABLE、非同期完了の失敗なら
WINHTTP_CALLBACK_STATUS_REQUEST_ERROR コールバックが呼ばれる。進捗通知は以下の通り。
（以下省略）


%index
WinHttpResetAutoProxy
Resets the auto-proxy.
%group
Win32 winhttp
%prm
hSession, dwFlags
hSession : [intptr] A valid HINTERNET WinHTTP session handle returned by a previous call to the WinHttpOpen function.
dwFlags : [int] A set of flags that affects the reset operation.
%inst
Resets the auto-proxy.

[戻り値]
A code indicating the success or failure of the operation.
This doc was truncated.

[備考]
To reset everything, set the dwFlags parameter to include
WINHTTP_RESET_ALL and WINHTTP_RESET_OUT_OF_PROC.
Note If you make subsequent calls to the WinHttpResetAutoProxy
function, there must be at least 30 seconds delay between calls to
reset the state of the auto-proxy. If there is less than 30 seconds,
the WinHttpResetAutoProxy function call may return ERROR_SUCCESS but
the reset won't happen.


%index
WinHttpSendRequest
指定のリクエストを HTTP サーバーに送信する。(WinHttpSendRequest)
%group
Win32 winhttp
%prm
hRequest, lpszHeaders, dwHeadersLength, lpOptional, dwOptionalLength, dwTotalLength, dwContext
hRequest : [intptr] WinHttpOpenRequest が返した HINTERNET ハンドル。
lpszHeaders : [wstr] リクエストに追加するヘッダ文字列へのポインタ。追加ヘッダがなければ WINHTTP_NO_ADDITIONAL_HEADERS を指定する。
dwHeadersLength : [int] 追加ヘッダの長さ(文字単位)。-1L で pwszHeaders が NULL でない場合は NULL 終端とみなして計算する。
lpOptional : [intptr] リクエストヘッダ直後に送信するオプションデータを含むバッファへのポインタ。通常 POST/PUT で使用する。送らない場合は WINHTTP_NO_REQUEST_DATA を指定する。dwOptionalLength が 0 なら無視され NULL に設定される。本バッファはリクエストハンドルが閉じられるか WinHttpReceiveResponse が完了するまで有効である必要がある。
dwOptionalLength : [int] オプションデータの長さ(バイト単位)。送らない場合は 0 を指定する。lpOptional が NULL でない場合は有効な長さを指定する必要がある。
dwTotalLength : [int] 送信する合計データ長(バイト単位)。リクエストの Content-Length ヘッダに設定される。dwOptionalLength を超える場合、WinHttpWriteData で追加データを送信できる。同じリクエストの WinHttpSendRequest 呼び出し間で変更してはならず、必要なら新しいリクエストを作成すること。
dwContext : [int] リクエストハンドルと共にコールバック関数に渡される、アプリケーション定義値を保持するポインタサイズの変数へのポインタ。
%inst
指定のリクエストを HTTP サーバーに送信する。(WinHttpSendRequest)

[戻り値]
成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。エラーコード一覧は以下の通り。
（以下省略）

[備考]
非同期モードでは同期/非同期のどちらでも動作する。いずれの場合も送信成功時
WINHTTP_CALLBACK_STATUS_SENDREQUEST_COMPLETE が呼ばれる。これを受けてから
WinHttpReceiveResponse を呼び、それ以前に他の非同期関数を呼ぶと
ERROR_WINHTTP_INCORRECT_HANDLE_STATE を返す。lpOptional
が指すバッファはリクエストハンドルが閉じられるか WinHttpReceiveResponse
が完了するまで変更/削除しないこと。同期モードでは応答を受信するには WinHttpSendRequest 復帰後に
WinHttpReceiveResponse
を呼べばよい。同じリクエストハンドルで複数回呼び出して同じリクエストを再送できるが、前回の全データを読み終わってから呼び出すこと。


%index
WinHttpSetCredentials
The WinHttpSetCredentials function passes the required authorization credentials to the server.
%group
Win32 winhttp
%prm
hRequest, AuthTargets, AuthScheme, pwszUserName, pwszPassword, pAuthParams
hRequest : [intptr] Valid HINTERNET handle returned by WinHttpOpenRequest.
AuthTargets : [int] An unsigned integer that specifies a flag that contains the authentication target.  Can be one of the  values in the following table.
AuthScheme : [int] An unsigned integer that specifies a flag that contains the authentication scheme.  Must be one of the supported authentication schemes returned from WinHttpQueryAuthSchemes. The following table identifies the possible values.
pwszUserName : [wstr] Pointer to a string that contains a valid user name.
pwszPassword : [wstr] Pointer to a string that contains a valid password.  The password can be blank.
pAuthParams : [intptr] This parameter is reserved and must be NULL.
%inst
The WinHttpSetCredentials function passes the required authorization
credentials to the server.

[戻り値]
Returns TRUE if successful, or FALSE otherwise. For extended error
information, call GetLastError. The following table identifies the
error codes returned.
This doc was truncated.

[備考]
Even when WinHTTP is used in asynchronous mode (that is, when
WINHTTP_FLAG_ASYNC has been set in WinHttpOpen), this function
operates synchronously. The return value indicates success or
failure. To get extended error information, call GetLastError. The
credentials set by WinHttpSetCredentials are only used for a single
request; WinHTTP does not cache these credentials for use in
subsequent requests. As a result, applications must be written so
that they can respond to multiple challenges. If an authenticated
connection is re-used, subsequent requests cannot be challenged, but
your code should be able to respond to a challenge at any point. For
sample code that illustrates the use of WinHttpSetCredentials, see
Authentication in WinHTTP. Note When using Passport authentication
and responding to a 407 status code, a WinHTTP application must use
WinHttpSetOption to provide proxy credentials rather than
WinHttpSetCredentials. This is only true when using Passport
authentication; in all other circumstances, use
WinHttpSetCredentials, because WinHttpSetOption is less secure. Note
For Windows XP and Windows 2000, see the Run-Time Requirements
section of the WinHttp start page.


%index
WinHttpSetDefaultProxyConfiguration
Sets the default WinHTTP proxy configuration in the registry.
%group
Win32 winhttp
%prm
pProxyInfo
pProxyInfo : [var] A pointer to a variable of type WINHTTP_PROXY_INFO that specifies the default proxy configuration.
%inst
Sets the default WinHTTP proxy configuration in the registry.

[戻り値]
Returns TRUE if successful, or FALSE otherwise. For extended error
information, call GetLastError. Among the error codes returned are
the following.
This doc was truncated.

[備考]
The default proxy configuration set by
**WinHttpSetDefaultProxyConfiguration** can be overridden for an
existing WinHTTP session by calling WinHttpSetOption and specifying
the WINHTTP_OPTION_PROXY flag. The default proxy configuration can be
overridden for a new session by specifying the configuration with the
WinHttpOpen function. The *dwAccessType* member of the
WINHTTP_PROXY_INFO structure pointed to by pProxyInfo should be set
to WINHTTP_ACCESS_TYPE_NAMED_PROXY if a proxy is specified.
Otherwise, it should be set to WINHTTP_ACCESS_TYPE_DEFAULT_PROXY. Any
new sessions created after calling this function use the new default
proxy configuration. Even when WinHTTP is used in asynchronous mode
(that is, when WINHTTP_FLAG_ASYNC has been set in WinHttpOpen), this
function operates synchronously. The return value indicates success
or failure. To get extended error information, call GetLastError.
Note For Windows XP and Windows 2000, see the Run-Time Requirements
section of the WinHTTP start page.


%index
WinHttpSetOption
インターネットオプションを設定する。
%group
Win32 winhttp
%prm
hInternet, dwOption, lpBuffer, dwBufferLength
hInternet : [intptr] データを設定する HINTERNET ハンドル。オプションに応じてセッションハンドルでもリクエストハンドルでもよい。
dwOption : [int] 設定するインターネットオプション。Option Flags のいずれかの値。
lpBuffer : [intptr] オプション設定値を含むバッファへのポインタ。
dwBufferLength : [int] lpBuffer バッファの長さ。以下のオプションでは文字単位、それ以外ではバイト単位。
%inst
インターネットオプションを設定する。

[戻り値]
成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。主なエラーコードは以下の通り。
（以下省略）

[備考]
WinHttpSetOption で渡された資格情報は平文で送信される可能性があるため、資格情報設定には
WinHttpQueryAuthSchemes と WinHttpSetCredentials の使用が強く推奨される。Passport
認証で 407 応答に対処する場合のみ、プロキシ資格情報設定に WinHttpSetOption
を使う必要がある。非同期モードでも本関数は同期動作する。GetLastError は設定できないオプションに対しては
ERROR_INVALID_PARAMETER を返す。


%index
WinHttpSetProxySettingsPerUser
(no summary)
%group
Win32 winhttp
%prm
fProxySettingsPerUser
fProxySettingsPerUser : [int] 
%inst



%index
WinHttpSetTimeouts
Sets time-outs involved with HTTP transactions.
%group
Win32 winhttp
%prm
hInternet, nResolveTimeout, nConnectTimeout, nSendTimeout, nReceiveTimeout
hInternet : [intptr] The HINTERNET handle returned by WinHttpOpen or WinHttpOpenRequest.
nResolveTimeout : [int] A value of type integer that specifies the time-out value, in milliseconds, to use for name resolution. If resolution takes longer than this time-out value, the action is canceled. The initial value is zero, meaning no time-out (infinite). Windows?Vista and Windows?XP:??If DNS timeout is specified using NAME_RESOLUTION_TIMEOUT, there is an overhead of one thread per request.
nConnectTimeout : [int] A value of type integer that specifies the time-out value, in milliseconds, to use for server connection requests. If a connection request takes longer than this time-out value, the request is canceled. The initial value is 60,000 (60 seconds). TCP/IP can time out while setting up the socket during the three leg SYN/ACK exchange, regardless of the value of this parameter.
nSendTimeout : [int] A value of type integer that specifies the time-out value, in milliseconds, to use for sending requests. If sending a request takes longer than this time-out value, the send is canceled. The initial value is 30,000 (30 seconds).
nReceiveTimeout : [int] A value of type integer that specifies the time-out value, in milliseconds, to receive a response to a request. If a response takes longer than this time-out value, the request is canceled. The initial value is 30,000 (30 seconds).
%inst
Sets time-outs involved with HTTP transactions.

[戻り値]
Returns TRUE if successful, or FALSE otherwise. For extended error
information, call GetLastError. Among the error codes returned are
the following.
This doc was truncated.

[備考]
Even when WinHTTP is used in asynchronous mode (that is, when
WINHTTP_FLAG_ASYNC has been set in WinHttpOpen), this function
operates synchronously. The return value indicates success or
failure. To get extended error information, call GetLastError. A
value of 0 or -1 sets a time-out to wait infinitely. A value greater
than 0 sets the time-out value in milliseconds. For example, 30,000
would set the time-out to 30 seconds. All negative values other than
-1 cause the function to fail with ERROR_INVALID_PARAMETER. Important
If a small timeout is set using WinHttpSetOption and
WINHTTP_OPTION_RECEIVE_TIMEOUT, it can override the value set with
the dwReceiveTimeout parameter, causing a response to terminate
earlier than expected. To avoid this, do not set a timeout with the
WINHTTP_OPTION_RECEIVE_TIMEOUT option that is smaller than the value
set using dwReceiveTimeout. Note For Windows XP and Windows 2000, see
the Run-Time Requirements section of the WinHTTP start page.


%index
WinHttpTimeFromSystemTime
Formats a date and time according to the HTTP version 1.0 specification. (WinHttpTimeFromSystemTime)
%group
Win32 winhttp
%prm
pst, pwszTime
pst : [var] A pointer to a SYSTEMTIME structure that contains the date and time to format.
pwszTime : [wstr] A pointer to a string buffer that receives the formatted date and time. The buffer should equal to the size, in bytes, of WINHTTP_TIME_FORMAT_BUFSIZE.
%inst
Formats a date and time according to the HTTP version 1.0
specification. (WinHttpTimeFromSystemTime)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get extended error
information, call GetLastError. Error codes include the following.
This doc was truncated.

[備考]
Even when WinHTTP is used in asynchronous mode (that is, when
WINHTTP_FLAG_ASYNC has been set in WinHttpOpen), this function
operates synchronously. The return value indicates success or
failure. To get extended error information, call GetLastError. Note
For Windows XP and Windows 2000, see the Run-Time Requirements
section of the WinHTTP Start Page.


%index
WinHttpTimeToSystemTime
The WinHttpTimeToSystemTime function takes an HTTP time/date string and converts it to a SYSTEMTIME structure.
%group
Win32 winhttp
%prm
pwszTime, pst
pwszTime : [wstr] Pointer to a null-terminated date/time string to convert. This value must use the format defined in section 3.3 of the RFC2616.
pst : [var] Pointer to the SYSTEMTIME structure that receives the converted time.
%inst
The WinHttpTimeToSystemTime function takes an HTTP time/date string
and converts it to a SYSTEMTIME structure.

[戻り値]
Returns TRUE if successful, or FALSE otherwise. For extended error
information, call GetLastError. Among the error codes returned is:
This doc was truncated.

[備考]
Even when WinHTTP is used in asynchronous mode (that is, when
WINHTTP_FLAG_ASYNC has been set in WinHttpOpen), this function
operates synchronously. The return value indicates success or
failure. To get extended error information, call GetLastError. Note
For Windows XP and Windows 2000, see the Run-Time Requirements
section of the WinHttp start page.


%index
WinHttpWebSocketClose
Closes a WebSocket connection.
%group
Win32 winhttp
%prm
hWebSocket, usStatus, pvReason, dwReasonLength
hWebSocket : [intptr] Type: HINTERNET Handle to a WebSocket.Note??WinHttpWebSocketClose does not close this handle. To close the handle, call WinHttpCloseHandle on hWebSocket once it is no longer needed.
usStatus : [int] Type: USHORT A close status code. See WINHTTP_WEB_SOCKET_CLOSE_STATUS for possible values.
pvReason : [intptr] Type: PVOID A detailed reason for the close.
dwReasonLength : [int] Type: DWORD The length of pvReason, in bytes. If pvReason is NULL, this must be 0. This value must be within the range of 0 to 123.
%inst
Closes a WebSocket connection.

[戻り値]
Type: DWORD With the following exception, all error codes indicate
that the underlying TCP connection has been aborted.
This doc was truncated.

[備考]
WinHttpWebSocketClose completely closes a WebSocket connection. To
close the send channel while still leaving the receive channel open,
use WinHttpWebSocketShutdown. It is possible to receive a close frame
during regular receive operations. In this case,
WinHttpWebSocketClose will also send a close frame. The close timer
can be set by the property WINHTTP_OPTION_WEB_SOCKET_CLOSE_TIMEOUT.
The default is 10 seconds.


%index
WinHttpWebSocketCompleteUpgrade
Completes a WebSocket handshake started by WinHttpSendRequest.
%group
Win32 winhttp
%prm
hRequest, pContext
hRequest : [intptr] Type: HINTERNET HTTP request handle used to send a WebSocket handshake.
pContext : [int] Type: DWORD_PTR Context to be associated with the new handle.
%inst
Completes a WebSocket handshake started by WinHttpSendRequest.

[戻り値]
Type: HINTERNET A new WebSocket handle. If NULL, call GetLastError to
determine the cause of failure.

[備考]
WinHttpWebSocketCompleteUpgrade can be called on an open HTTP request
to get a WebSocket handle for performing other WebSocket operations.
The request handle must be marked as a WebSocket upgrade by calling
WinHttpSetOption with WINHTTP_OPTION_UPGRADE_TO_WEB_SOCKET before
sending the request. The caller should check the HTTP status code
returned by the server and call this function only if the status code
was 101. Calling it with any other status code will result in a
failure.


%index
WinHttpWebSocketQueryCloseStatus
Retrieves the close status sent by a server.
%group
Win32 winhttp
%prm
hWebSocket, pusStatus, pvReason, dwReasonLength, pdwReasonLengthConsumed
hWebSocket : [intptr] Type: HINTERNET Handle to a WebSocket
pusStatus : [var] Type: USHORT* A pointer to a close status code that will be filled upon return. See WINHTTP_WEB_SOCKET_CLOSE_STATUS for possible values.
pvReason : [intptr] Type: PVOID A pointer to a buffer that will receive a close reason on return.
dwReasonLength : [int] Type: DWORD The length of the pvReason buffer, in bytes.
pdwReasonLengthConsumed : [var] Type: DWORD* The number of bytes consumed. If pvReason is NULL and dwReasonLength is 0, pdwReasonLengthConsumed will contain the size of the buffer that needs to be allocated by the calling application.
%inst
Retrieves the close status sent by a server.

[戻り値]
Type: DWORD NO_ERROR on success. Otherwise an error code.
This doc was truncated.

[備考]
Call WinHttpWebSocketQueryCloseStatus only after
WinHttpWebSocketClose succeeds or if WinHttpWebSocketReceive returns
WINHTTP_WEB_SOCKET_CLOSE_BUFFER_TYPE. pdwReasonLengthConsumed will
never be greater than 123, so allocating buffer with at least 123
will guarantee that ERROR_INSUFFICIENT_BUFFER will never be returned.


%index
WinHttpWebSocketReceive
Receives data from a WebSocket connection.
%group
Win32 winhttp
%prm
hWebSocket, pvBuffer, dwBufferLength, pdwBytesRead, peBufferType
hWebSocket : [intptr] Type: HINTERNET Handle to a WebSocket.
pvBuffer : [intptr] Type: PVOID Pointer to a buffer to receive the data.
dwBufferLength : [int] Type: DWORD Length of pvBuffer, in bytes.
pdwBytesRead : [var] Type: DWORD* Pointer to a DWORD that receives the number of bytes read from the connection at the end of the operation. This is set only if WinHttpWebSocketReceive returns NO_ERROR and the handle was opened in synchronous mode.
peBufferType : [var] Type: WINHTTP_WEB_SOCKET_BUFFER_TYPE* The type of a returned buffer. This is only set if WinHttpWebSocketReceive returns NO_ERROR and the handle was opened in synchronous mode.
%inst
Receives data from a WebSocket connection.

[戻り値]
Type: DWORD NO_ERROR on success. Otherwise an error code.
This doc was truncated.


%index
WinHttpWebSocketSend
Sends data over a WebSocket connection.
%group
Win32 winhttp
%prm
hWebSocket, eBufferType, pvBuffer, dwBufferLength
hWebSocket : [intptr] Type: HINTERNET Handle to a websocket.
eBufferType : [int] Type: WINHTTP_WEB_SOCKET_BUFFER_TYPE Type of buffer.Note??Do not specify WINHTTP_WEB_SOCKET_CLOSE_BUFFER_TYPE. Use WinHttpWebSocketClose or WinHttpWebSocketShutdown to close the connection.
pvBuffer : [intptr] Type: PVOID Pointer to a buffer containing the data to send. Can be NULL only if dwBufferLength is 0.
dwBufferLength : [int] Type: DWORD Length of pvBuffer.
%inst
Sends data over a WebSocket connection.

[戻り値]
Type: DWORD NO_ERROR on success. Otherwise an error code.
This doc was truncated.


%index
WinHttpWebSocketShutdown
Sends a close frame to a WebSocket server to close the send channel, but leaves the receive channel open.
%group
Win32 winhttp
%prm
hWebSocket, usStatus, pvReason, dwReasonLength
hWebSocket : [intptr] Type: HINTERNET Handle to a WebSocket.Note??WinHttpWebSocketShutdown does not close this handle. To close the handle, call WinHttpCloseHandle on hWebSocket once it is no longer needed.
usStatus : [int] Type: USHORT A close status code. See WINHTTP_WEB_SOCKET_CLOSE_STATUS for possible values.
pvReason : [intptr] Type: PVOID A detailed reason for the close.
dwReasonLength : [int] Type: DWORD The length of pvReason, in bytes. If pvReason is NULL, this must be 0. This value must be within the range of 0 to 123.
%inst
Sends a close frame to a WebSocket server to close the send channel,
but leaves the receive channel open.

[戻り値]
Type: DWORD With the following exception, all error codes indicate
that the underlying TCP connection has been aborted.
This doc was truncated.

[備考]
WinHttpWebSocketShutdown sends a close frame and prevents additional
data from being sent over the WebSocket connection. It does not close
the receive channel. Use WinHttpWebSocketClose when you want to
completely close the connection and prevent any subsequent receive
operations. The application is responsible for receiving the close
frame from the server (through regular receive operations). After
WinHttpWebSocketShutdown is called, the application can call
WinHttpWebSocketClose if it does not want to receive a close frame on
its own and delegate it to the stack.


%index
WinHttpWriteData
The WinHttpWriteData function writes request data to an HTTP server.
%group
Win32 winhttp
%prm
hRequest, lpBuffer, dwNumberOfBytesToWrite, lpdwNumberOfBytesWritten
hRequest : [intptr] Valid HINTERNET handle returned by WinHttpOpenRequest. Wait until WinHttpSendRequest has completed before calling  this function.
lpBuffer : [intptr] Pointer to a buffer that contains the data to be sent to the server. Be sure that this buffer remains valid until after WinHttpWriteData completes.
dwNumberOfBytesToWrite : [int] Unsigned long integer value that contains the number of bytes to be written to the file.
lpdwNumberOfBytesWritten : [var] Pointer to an unsigned long integer variable that receives the number of bytes written to the buffer. The WinHttpWriteData function sets this value to zero before doing any work or error checking.  When using WinHTTP asynchronously, this parameter must be set to NULL and retrieve the information in the callback function. Not doing so can cause a memory fault.
%inst
The WinHttpWriteData function writes request data to an HTTP server.

[戻り値]
Returns TRUE if successful, or FALSE otherwise. For extended error
information, call GetLastError. Among the error codes returned are:
This doc was truncated.

[備考]
Even when WinHTTP is used in asynchronous mode (that is, when
WINHTTP_FLAG_ASYNC has been set in WinHttpOpen), this function can
operate either synchronously or asynchronously. If this function
returns FALSE, you can call GetLastError to get extended error
information. If this function returns TRUE, use the
WINHTTP_CALLBACK_STATUS_WRITE_COMPLETE completion to determine
whether this function was successful and the value of the parameters.
The WINHTTP_CALLBACK_STATUS_REQUEST_ERROR completion indicates that
the operation completed asynchronously, but failed. Warning When
using WinHTTP asynchronously, always set the lpdwNumberOfBytesWritten
parameter to NULL and retrieve the bytes written in the callback
function; otherwise, a memory fault can occur. When the application
is sending data, it can call WinHttpReceiveResponse to end the data
transfer. If WinHttpCloseHandle is called, then the data transfer is
aborted. If a status callback function has been installed with
WinHttpSetStatusCallback, then those of the following notifications
that have been set in the dwNotificationFlags parameter of
WinHttpSetStatusCallback indicate progress in sending data to the
server:
This doc was truncated.


%index
WinHttpWriteProxySettings
(no summary)
%group
Win32 winhttp
%prm
hSession, fForceUpdate, pWinHttpProxySettings
hSession : [intptr] 
fForceUpdate : [int] 
pWinHttpProxySettings : [var] 
%inst


