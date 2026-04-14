; ============================================================
;   wininet.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
HttpOpenRequestW
Creates an HTTP request handle. (Unicode)
%group
Win32 wininet
%prm
hConnect, lpszVerb, lpszObjectName, lpszVersion, lpszReferrer, lplpszAcceptTypes, dwFlags, dwContext
hConnect : [intptr] A handle to an HTTP session returned by InternetConnect.
lpszVerb : [wstr] A pointer to a null-terminated string that contains the HTTP verb to use in the request. If this parameter is NULL, the function uses GET as the HTTP verb.
lpszObjectName : [wstr] A pointer to a null-terminated string that contains the name of the target object of the specified HTTP verb. This is generally a file name, an executable module, or a search specifier.
lpszVersion : [wstr] A pointer to a null-terminated string that contains the HTTP version to use in the request. Settings in Internet Explorer will override the value specified in this parameter. If this parameter is NULL, the function uses an HTTP version of 1.1 or 1.0, depending on the value of the Internet Explorer settings.
lpszReferrer : [wstr] A pointer to a null-terminated string that specifies the URL of the document from which the URL in the request (lpszObjectName) was obtained. If this parameter is NULL, no referrer is specified.
lplpszAcceptTypes : [var] A pointer to a null-terminated array of strings that indicates media types accepted by the client. Here is an example. PCTSTR rgpszAcceptTypes[] = {_T("text/*"), NULL}; Failing to properly terminate the array with a NULL pointer will cause a crash. If this parameter is NULL, no types are accepted by the client. Servers generally interpret a lack of accept types to indicate that the client accepts only documents of type "text/*" (that is, only text documents?no pictures or other binary files).
dwFlags : [int] 
dwContext : [int] A pointer to a variable that contains the application-defined value that associates this operation with any application data.
%inst
Creates an HTTP request handle. (Unicode)

[戻り値]
Returns an HTTP request handle if successful, or NULL otherwise. To
retrieve extended error information, call GetLastError.

[備考]
The HttpOpenRequest function creates a new HTTP request handle and
stores the specified parameters in that handle. An HTTP request
handle holds a request to be sent to an HTTP server and contains all
RFC822/MIME/HTTP headers to be sent as part of the request. If a verb
other than "GET" or "POST" is specified, HttpOpenRequest
automatically sets INTERNET_FLAG_NO_CACHE_WRITE and
INTERNET_FLAG_RELOAD for the request. With Microsoft Internet
Explorer 5 and later, if lpszVerb is set to "HEAD", the
Content-Length header is ignored on responses from HTTP/1.1 servers.
On Windows 7, Windows Server 2008 R2, and later, the lpszVersion
parameter is overridden by Internet Explorer settings. The
EnableHttp1_1 is a registry value under
HKLM\Software\Microsoft\InternetExplorer\AdvacnedOptions\HTTP\GENABLE
controlled by Internet Options set in Internet Explorer for the
system. The EnableHttp1_1 value defaults to 1. The HttpOpenRequest
function upgrades any HTTP version less than 1.1 to HTTP version 1.1
if EnableHttp1_1 is set to 1.
After the calling application has finished using the HINTERNET handle
returned by HttpOpenRequest, it must be closed using the
InternetCloseHandle function. Note When a request is sent in
asynchronous mode (the dwFlags parameter of InternetOpen specifies
INTERNET_FLAG_ASYNC), and the dwContext parameter is zero
(INTERNET_NO_CALLBACK), the callback function set with
InternetSetStatusCallback on the request handle will not be invoked,
however, the call will still be performed in asynchronous mode. Like
all other aspects of the WinINet API, this function cannot be safely
called from within DllMain or the constructors and destructors of
global objects. Note WinINet does not support server implementations.
In addition, it should not be used from a service. For server
implementations or services use Microsoft Windows HTTP Services
(WinHTTP).
> [!NOTE] > The wininet.h header defines HttpOpenRequest as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
HttpQueryInfoW
Retrieves header information associated with an HTTP request. (Unicode)
%group
Win32 wininet
%prm
hRequest, dwInfoLevel, lpBuffer, lpdwBufferLength, lpdwIndex
hRequest : [intptr] A handle returned by a call to the HttpOpenRequest or InternetOpenUrl function.
dwInfoLevel : [int] A combination of an attribute to be retrieved and flags that modify the request. For a list of possible attribute and modifier values, see Query Info Flags.
lpBuffer : [intptr] A pointer to a buffer to receive the requested information. This parameter must not be NULL.
lpdwBufferLength : [var] A pointer to a variable that contains, on entry, the size in bytes of the buffer pointed to by lpvBuffer. When the function returns successfully, this variable contains the number of bytes of information written to the buffer. In the case of a string, the byte count does not include the string's terminating null character. When the function fails with an extended error code of ERROR_INSUFFICIENT_BUFFER, the variable pointed to by lpdwBufferLength contains on exit the size, in bytes, of a buffer large enough to receive the requested information. The calling application can then allocate a buffer of this size or larger, and call the function again.
lpdwIndex : [var] A pointer to a zero-based header index used to enumerate multiple headers with the same name. When calling the function, this parameter is the index of the specified header to return. When the function returns, this parameter is the index of the next header. If the next index cannot be found, ERROR_HTTP_HEADER_NOT_FOUND is returned.
%inst
Retrieves header information associated with an HTTP request.
(Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get extended error
information, call GetLastError.

[備考]
You can retrieve the following types of data from
This doc was truncated.


%index
HttpSendRequestW
Sends the specified request to the HTTP server, allowing callers to send extra data beyond what is normally passed to HttpSendRequestEx. (Unicode)
%group
Win32 wininet
%prm
hRequest, lpszHeaders, dwHeadersLength, lpOptional, dwOptionalLength
hRequest : [intptr] A handle returned by a call to the HttpOpenRequest function.
lpszHeaders : [wstr] A pointer to a null-terminated string  that contains the additional headers to be appended to the request. This parameter can be NULL if there are no additional headers to be appended.
dwHeadersLength : [int] The size of the additional headers, in TCHARs. If this parameter is -1L and lpszHeaders is not NULL, the function assumes that lpszHeaders is zero-terminated (ASCIIZ), and the length is calculated. See Remarks for specifics.
lpOptional : [intptr] A pointer to a buffer containing any optional data to be sent immediately after the request headers. This parameter is generally used for POST and PUT operations. The optional data can be the resource or information being posted to the server. This parameter can be NULL if there is no optional data to send.
dwOptionalLength : [int] The size of the optional data, in bytes. This parameter can be zero if there is no optional data to send.
%inst
Sends the specified request to the HTTP server, allowing callers to
send extra data beyond what is normally passed to HttpSendRequestEx.
(Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get extended error
information, call GetLastError.

[備考]
HttpSendRequest sends the specified request to the HTTP server and
allows the client to specify additional headers to send along with
the request. The function also lets the client specify optional data
to send to the HTTP server immediately following the request headers.
This feature is generally used for "write" operations such as PUT and
POST. After the request is sent, the status code and response headers
from the HTTP server are read. These headers are maintained
internally and are available to client applications through the
HttpQueryInfo function. An application can use the same HTTP request
handle in multiple calls to HttpSendRequest, but the application must
read all data returned from the previous call before calling the
function again. In offline mode, HttpSendRequest returns
ERROR_FILE_NOT_FOUND if the resource is not found in the Internet
cache. There are two versions of HttpSendRequest?HttpSendRequestA
(used with ANSI builds) and HttpSendRequestW (used with Unicode
builds). If dwHeadersLength is -1L and lpszHeaders is not NULL, the
following will happen: If HttpSendRequestA is called, the function
assumes that lpszHeaders is zero-terminated (ASCIIZ), and the length
is calculated. If HttpSendRequestW is called, the function fails with
ERROR_INVALID_PARAMETER. Note The HttpSendRequestA function
represents headers as ISO-8859-1 characters not ANSI characters. The
HttpSendRequestW function represents headers as ISO-8859-1 characters
converted to UTF-16LE characters. As a result, it is never safe to
use the HttpSendRequestW function when the headers to be added can
contain non-ASCII characters. Instead, an application can use the
MultiByteToWideChar and WideCharToMultiByte functions with a Codepage
parameter set to 28591 to map between ANSI characters and UTF-16LE
characters. Like all other aspects of the WinINet API, this function
cannot be safely called from within DllMain or the constructors and
destructors of global objects. Note WinINet does not support server
implementations. In addition, it should not be used from a service.
For server implementations or services use Microsoft Windows HTTP
Services (WinHTTP).
> [!NOTE] > The wininet.h header defines HttpSendRequest as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
InternetCloseHandle
Closes a single Internet handle.
%group
Win32 wininet
%prm
hInternet
hInternet : [intptr] Handle to be closed.
%inst
Closes a single Internet handle.

[戻り値]
Returns TRUE if the handle is successfully closed, or FALSE
otherwise. To get extended error information, call GetLastError.

[備考]
The function terminates any pending operations on the handle and
discards any outstanding data.
It is safe to call InternetCloseHandle as long as no API calls are
being made or will be made using the handle. Once an API has returned
ERROR_IO_PENDING, it is safe to call InternetCloseHandle to cancel
that I/O, as long as no subsequent API calls will be issued with the
handle. It is safe to call InternetCloseHandle in a callback for the
handle being closed. If there is a status callback registered for the
handle being closed, and the handle was created with a non-NULL
context value, an INTERNET_STATUS_HANDLE_CLOSING callback will be
made. This indication will be the last callback made from a handle
and indicates that the handle is being destroyed. If asynchronous
requests are pending for the handle or any of its child handles, the
handle cannot be closed immediately, but it will be invalidated. Any
new requests attempted using the handle will return with an
ERROR_INVALID_HANDLE notification. The asynchronous requests will
complete with INTERNET_STATUS_REQUEST_COMPLETE. Applications must be
prepared to receive any INTERNET_STATUS_REQUEST_COMPLETE indications
on the handle before the final INTERNET_STATUS_HANDLE_CLOSING
indication is made, which indicates that the handle is completely
closed. An application can call GetLastError to determine if requests
are pending. If GetLastError returns ERROR_IO_PENDING, there were
outstanding requests when the handle was closed. Like all other
aspects of the WinINet API, this function cannot be safely called
from within DllMain or the constructors and destructors of global
objects. Note WinINet does not support server implementations. In
addition, it should not be used from a service. For server
implementations or services use Microsoft Windows HTTP Services
(WinHTTP).


%index
InternetConnectW
Opens an File Transfer Protocol (FTP) or HTTP session for a given site. (Unicode)
%group
Win32 wininet
%prm
hInternet, lpszServerName, nServerPort, lpszUserName, lpszPassword, dwService, dwFlags, dwContext
hInternet : [intptr] Handle returned by a previous call to InternetOpen.
lpszServerName : [wstr] Pointer to a null-terminated string that specifies the host name of an Internet server. Alternately, the string can contain the IP number of the site, in ASCII dotted-decimal format (for example, 11.0.1.45).
nServerPort : [int] Transmission Control Protocol/Internet Protocol (TCP/IP) port on the server. These flags set only the port that is used. The service is set by the value of
lpszUserName : [wstr] Pointer to a null-terminated string that specifies the name of the user to log on. If this parameter is NULL, the function uses an appropriate default. For the FTP protocol, the default is "anonymous".
lpszPassword : [wstr] Pointer to a null-terminated string that contains the password to use to log on. If both lpszPassword and lpszUsername are NULL, the function uses the default "anonymous" password. In the case of FTP, the default password is the user's email name. If lpszPassword is NULL, but lpszUsername is not NULL, the function uses a blank password.
dwService : [int] 
dwFlags : [int] Options specific to the service used. If dwService is INTERNET_SERVICE_FTP, INTERNET_FLAG_PASSIVE causes the application to use passive FTP semantics.
dwContext : [int] Pointer to a variable that contains an application-defined value that is used to identify the application context for the returned handle in callbacks.
%inst
Opens an File Transfer Protocol (FTP) or HTTP session for a given
site. (Unicode)

[戻り値]
Returns a valid handle to the session if the connection is
successful, or NULL otherwise. To retrieve extended error
information, call GetLastError. An application can also use
InternetGetLastResponseInfo to determine why access to the service
was denied.

[備考]
The following table describes the behavior for the four possible
settings of lpszUsername and lpszPassword.
This doc was truncated.


%index
InternetOpenW
Initializes an application's use of the WinINet functions. (Unicode)
%group
Win32 wininet
%prm
lpszAgent, dwAccessType, lpszProxy, lpszProxyBypass, dwFlags
lpszAgent : [wstr] Pointer to a null-terminated string  that specifies the name of the application or entity calling the WinINet functions. This name is used as the user agent in the HTTP protocol.
dwAccessType : [int] 
lpszProxy : [wstr] Pointer to a null-terminated string  that specifies the name of the proxy server(s) to use when proxy access is specified by setting dwAccessType to INTERNET_OPEN_TYPE_PROXY. Do not use an empty string, because InternetOpen will use it as the proxy name. The WinINet functions recognize only CERN type proxies (HTTP only) and the TIS FTP gateway (FTP only). If Microsoft Internet Explorer is installed, these functions also support SOCKS proxies. FTP requests can be made through a CERN type proxy either by changing them to an HTTP request or by using InternetOpenUrl. If dwAccessType is not set to INTERNET_OPEN_TYPE_PROXY, this parameter is ignored and should be NULL. For more information about listing proxy servers, see the Listing Proxy Servers section of Enabling Internet Functionality.
lpszProxyBypass : [wstr] Pointer to a null-terminated string  that specifies an optional list of host names or IP addresses, or both, that should not be routed through the proxy when dwAccessType is set to INTERNET_OPEN_TYPE_PROXY. The list can contain wildcards. Do not use an empty string, because InternetOpen will use it as the proxy bypass list. If this parameter specifies the "<local>" macro, the function bypasses the proxy for any host name that does not contain a period. By default, WinINet will bypass the proxy for requests that use the host names "localhost", "loopback", "127.0.0.1", or "[::1]". This behavior exists because a remote proxy server typically will not resolve these addresses properly.Internet Explorer?9:??You can remove the local computer from the proxy bypass list using the "<-loopback>" macro.
dwFlags : [int] 
%inst
Initializes an application's use of the WinINet functions. (Unicode)

[戻り値]
Returns a valid handle that the application passes to subsequent
WinINet functions. If InternetOpen fails, it returns NULL. To
retrieve a specific error message, call GetLastError.

[備考]
InternetOpen is the first WinINet function called by an application.
It tells the Internet DLL to initialize internal data structures and
prepare for future calls from the application. When the application
finishes using the Internet functions, it should call
InternetCloseHandle to free the handle and any associated resources.
The application can make any number of calls to InternetOpen, though
a single call is normally sufficient. The application might need to
define separate behaviors for each InternetOpen instance, such as
different proxy servers configured for each. After the calling
application has finished using the HINTERNET handle returned by
InternetOpen, it must be closed using the InternetCloseHandle
function. Like all other aspects of the WinINet API, this function
cannot be safely called from within DllMain or the constructors and
destructors of global objects. Note WinINet does not support server
implementations. In addition, it should not be used from a service.
For server implementations or services use Microsoft Windows HTTP
Services (WinHTTP).
> [!NOTE] > The wininet.h header defines InternetOpen as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
InternetOpenUrlW
Opens a resource specified by a complete FTP or HTTP URL. (Unicode)
%group
Win32 wininet
%prm
hInternet, lpszUrl, lpszHeaders, dwHeadersLength, dwFlags, dwContext
hInternet : [intptr] The handle to the current Internet session. The handle must have been returned by a previous call to InternetOpen.
lpszUrl : [wstr] A pointer to a null-terminated string variable that specifies the URL to begin reading. Only URLs beginning with ftp:, http:, or https: are supported.
lpszHeaders : [wstr] A pointer to a null-terminated string  that specifies the headers to be sent to the HTTP server. For more information, see the description of the lpszHeaders parameter in the HttpSendRequest function.
dwHeadersLength : [int] The size of the additional headers, in TCHARs. If this parameter is -1L and lpszHeaders is not NULL, lpszHeaders is assumed to be zero-terminated (ASCIIZ) and the length is calculated.
dwFlags : [int] 
dwContext : [int] A pointer to a variable that specifies the application-defined value that is passed, along with the returned handle, to any callback functions.
%inst
Opens a resource specified by a complete FTP or HTTP URL. (Unicode)

[戻り値]
Returns a valid handle to the URL if the connection is successfully
established, or NULL if the connection fails. To retrieve a specific
error message, call GetLastError. To determine why access to the
service was denied, call InternetGetLastResponseInfo.

[備考]
Call InternetCanonicalizeUrl first if the URL being used contains a
relative URL and a base URL separated by blank spaces. This is a
general function that an application can use to retrieve data over
any of the protocols that WinINet supports. This function is
especially useful when the application does not need to access the
particulars of a protocol, but only requires the data corresponding
to a URL. The InternetOpenUrl function parses the URL string,
establishes a connection to the server, and prepares to download the
data identified by the URL. The application can then use
InternetReadFile (for files) or InternetFindNextFile (for
directories) to retrieve the URL data. It is not necessary to call
InternetConnect before InternetOpenUrl. Windows XP and Windows Server
2003 R2 and earlier: InternetOpenUrl disables Gopher on ports less
than 1024, except for port 70?the standard Gopher port?and port
105?typically used for Central Services Organization (CSO) name
searches. After the calling application has finished using the
HINTERNET handle returned by InternetOpenUrl, it must be closed using
the InternetCloseHandle function. Note When working in asynchronous
mode (the dwFlags parameter of InternetOpen specifies
INTERNET_FLAG_ASYNC), and the dwContext parameter is zero
(INTERNET_NO_CALLBACK), the callback function set with
InternetSetStatusCallback on the session handle will not be invoked,
however, the call will still be performed in asynchronous mode Like
all other aspects of the WinINet API, this function cannot be safely
called from within DllMain or the constructors and destructors of
global objects. Note WinINet does not support server implementations.
In addition, it should not be used from a service. For server
implementations or services use Microsoft Windows HTTP Services
(WinHTTP).
> [!NOTE] > The wininet.h header defines InternetOpenUrl as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
InternetReadFile
Reads data from a handle opened by the InternetOpenUrl, FtpOpenFile, or HttpOpenRequest function.
%group
Win32 wininet
%prm
hFile, lpBuffer, dwNumberOfBytesToRead, lpdwNumberOfBytesRead
hFile : [intptr] Handle returned from a previous call to InternetOpenUrl, FtpOpenFile, or HttpOpenRequest.
lpBuffer : [intptr] Pointer to a buffer that receives the data.
dwNumberOfBytesToRead : [int] Number of bytes to be read.
lpdwNumberOfBytesRead : [var] Pointer to a variable that receives the number of bytes read. InternetReadFile sets this value to zero before doing any work or error checking.
%inst
Reads data from a handle opened by the InternetOpenUrl, FtpOpenFile,
or HttpOpenRequest function.

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get extended error
information, call GetLastError. An application can also use
InternetGetLastResponseInfo when necessary.

[備考]
InternetReadFile operates much like the base ReadFile function, with
a few exceptions. Typically, InternetReadFile retrieves data from an
HINTERNET handle as a sequential stream of bytes. The amount of data
to be read for each call to InternetReadFile is specified by the
dwNumberOfBytesToRead parameter and the data is returned in the
lpBuffer parameter. A normal read retrieves the specified
dwNumberOfBytesToRead for each call to InternetReadFile until the end
of the file is reached. To ensure all data is retrieved, an
application must continue to call the InternetReadFile function until
the function returns TRUE and the lpdwNumberOfBytesRead parameter
equals zero. This is especially important if the requested data is
written to the cache, because otherwise the cache will not be
properly updated and the file downloaded will not be committed to the
cache. Note that caching happens automatically unless the original
request to open the data stream set the INTERNET_FLAG_NO_CACHE_WRITE
flag. When an application retrieves a handle using InternetOpenUrl,
WinINet attempts to make all data look like a file download, in an
effort to make reading from the Internet easier for the application.
For some types of information, such as FTP file directory listings,
it converts the data to be returned by InternetReadFile to an HTML
stream. It does this on a line-by-line basis. For example, it can
convert an FTP directory listing to a line of HTML and return this
HTML to the application. WinINet attempts to write the HTML to the
lpBuffer buffer a line at a time. If the application's buffer is too
small to fit at least one line of generated HTML, the error code
ERROR_INSUFFICIENT_BUFFER is returned as an indication to the
application that it needs a larger buffer. Also, converted lines
might not completely fill the buffer, so InternetReadFile can return
with less data in lpBuffer than requested. Subsequent reads will
retrieve all the converted HTML. The application must again check
that all data is retrieved as described previously. Like all other
aspects of the WinINet API, this function cannot be safely called
from within DllMain or the constructors and destructors of global
objects. When running asynchronously, if a call to InternetReadFile
does not result in a completed transaction, it will return FALSE and
a subsequent call to GetLastError will return ERROR_IO_PENDING. When
the transaction is completed the InternetStatusCallback specified in
a previous call to InternetSetStatusCallback will be called with
INTERNET_STATUS_REQUEST_COMPLETE. Note WinINet does not support
server implementations. In addition, it should not be used from a
service. For server implementations or services use Microsoft Windows
HTTP Services (WinHTTP).


%index
InternetSetOptionW
Sets an Internet option. (Unicode)
%group
Win32 wininet
%prm
hInternet, dwOption, lpBuffer, dwBufferLength
hInternet : [intptr] Handle on which to set information.
dwOption : [int] Internet option to be set. This can be one of the Option Flags values.
lpBuffer : [intptr] Pointer to a buffer that contains the option setting.
dwBufferLength : [int] Size of the lpBuffer buffer.  If lpBuffer contains a string, the size is in TCHARs.  If lpBuffer contains anything other than a string, the size is in bytes.
%inst
Sets an Internet option. (Unicode)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get a specific
error message, call GetLastError.

[備考]
GetLastError will return the error ERROR_INVALID_PARAMETER if an
option flag that cannot be set is specified. For more information,
see Setting and Retrieving Internet Options. Like all other aspects
of the WinINet API, this function cannot be safely called from within
DllMain or the constructors and destructors of global objects. Note
WinINet does not support server implementations. In addition, it
should not be used from a service. For server implementations or
services use Microsoft Windows HTTP Services (WinHTTP).
> [!NOTE] > The wininet.h header defines InternetSetOption as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).

