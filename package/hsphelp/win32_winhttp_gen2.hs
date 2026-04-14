; ============================================================
;   winhttp.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
WinHttpAddRequestHeaders
Adds one or more HTTP request headers to the HTTP request handle. (WinHttpAddRequestHeaders)
%group
Win32 winhttp
%prm
hRequest, lpszHeaders, dwHeadersLength, dwModifiers
hRequest : [intptr] A HINTERNET handle returned by a call to the WinHttpOpenRequest function.
lpszHeaders : [wstr] A pointer to a string variable that contains the headers to append to the request. Each header except the last must be terminated by a carriage return/line feed (CR/LF).
dwHeadersLength : [int] An unsigned long integer value that contains the length, in characters, of pwszHeaders. If this parameter is -1L, the function assumes that pwszHeaders is zero-terminated (ASCIIZ), and the length is computed.
dwModifiers : [int] An unsigned long integer value that contains the flags used to modify the semantics of this function. Can be one or more of the following flags.
%inst
Adds one or more HTTP request headers to the HTTP request handle.
(WinHttpAddRequestHeaders)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. For extended error
information, call GetLastError. Among the error codes returned are
the following.
This doc was truncated.

[備考]
Headers are transferred across redirects. This can be a security
issue. To avoid having headers transferred when a redirect occurs,
use the WINHTTP_STATUS_CALLBACK callback to correct the specific
headers when a redirect occurs. Even when WinHTTP is used in
asynchronous mode (that is, when WINHTTP_FLAG_ASYNC has been set in
WinHttpOpen), this function operates synchronously. The return value
indicates success or failure. To get extended error information, call
GetLastError. The WinHttpAddRequestHeaders function appends
additional free-format headers to the HTTP request handle and is
intended for use by sophisticated clients that require detailed
control over the exact request sent to the HTTP server. The name and
value of request headers added with this function are validated.
Headers must be well formed. For more information about valid HTTP
headers, see RFC 2616. If an invalid header is used, this function
fails and GetLastError returns ERROR_INVALID_PARAMETER. The invalid
header is not added. If you are sending a Date: request header, you
can use the WinHttpTimeFromSystemTime function to create structure
for the header. For basic WinHttpAddRequestHeaders, the application
can pass in multiple headers in a single buffer. An application can
also use WinHttpSendRequest to add additional headers to the HTTP
request handle before sending a request. Note For more information,
see Run-Time Requirements.


%index
WinHttpCloseHandle
The WinHttpCloseHandle function closes a single **HINTERNET** handle.
%group
Win32 winhttp
%prm
hInternet
hInternet : [intptr] A valid **HINTERNET** handle (see [HINTERNET Handles in WinHTTP](/windows/win32/winhttp/hinternet-handles-in-winhttp)) to be closed.
%inst
The WinHttpCloseHandle function closes a single **HINTERNET** handle.

[戻り値]
**TRUE** if the handle is successfully closed, otherwise **FALSE**.
To get extended error information, call GetLastError. Among the error
codes returned are the following.
This doc was truncated.

[備考]
Even when WinHTTP is used in asynchronous mode (that is, when
WINHTTP_FLAG_ASYNC has been set in WinHttpOpen), this function
operates synchronously. The return value indicates success or
failure. To get extended error information, call GetLastError. If
there is a status callback registered for the handle being closed and
the handle was created with a non-NULL context value, a
WINHTTP_CALLBACK_STATUS_HANDLE_CLOSING callback is made. This is the
last callback made from the handle and indicates that the handle is
being destroyed. An application can terminate an in-progress
asynchronous request by closing the HINTERNET request handle using
WinHttpCloseHandle. Keep the following points in mind:
This doc was truncated.


%index
WinHttpConnect
The WinHttpConnect function specifies the initial target server of an HTTP request and returns an HINTERNET connection handle to an HTTP session for that initial target.
%group
Win32 winhttp
%prm
hSession, pswzServerName, nServerPort, dwReserved
hSession : [intptr] Valid HINTERNET WinHTTP session handle returned by a previous call to WinHttpOpen.
pswzServerName : [wstr] Pointer to a null-terminated string that contains the host name of an HTTP server. Alternately, the string can contain the IP address of the site in ASCII, for example, 10.0.1.45. Note that WinHttp does not accept international host names without converting them first to Punycode. For more information, see Handling Internationalized Domain Names (IDNs).
nServerPort : [int] 
dwReserved : [int] This parameter is reserved and must be 0.
%inst
The WinHttpConnect function specifies the initial target server of an
HTTP request and returns an HINTERNET connection handle to an HTTP
session for that initial target.

[戻り値]
Returns a valid connection handle to the HTTP session if the
connection is successful, or NULL otherwise. To retrieve extended
error information, call GetLastError. Among the error codes returned
are the following.
This doc was truncated.

[備考]
Even when WinHTTP is used in asynchronous mode (that is, when
WINHTTP_FLAG_ASYNC has been set in WinHttpOpen), this function
operates synchronously. The return value indicates success or
failure. To get extended error information, call GetLastError. After
the calling application has finished using the HINTERNET handle
returned by WinHttpConnect, it must be closed using the
WinHttpCloseHandle function. WinHttpConnect specifies the target HTTP
server, however a response can come from another server if the
request was redirected. You can determine the URL of the server
sending the response by calling WinHttpQueryOption with the
WINHTTP_OPTION_URL flag. Note For Windows XP and Windows 2000, see
the Run-Time Requirements section of the WinHttp start page.


%index
WinHttpOpen
Initializes, for an application, the use of WinHTTP functions and returns a WinHTTP-session handle.
%group
Win32 winhttp
%prm
pszAgentW, dwAccessType, pszProxyW, pszProxyBypassW, dwFlags
pszAgentW : [wstr] A pointer to a string variable that contains the name of the application or entity calling the WinHTTP functions. This name is used as the user agent in the HTTP protocol.
dwAccessType : [int] 
pszProxyW : [wstr] A pointer to a string variable that contains the name of the proxy server to use when proxy access is specified by setting dwAccessType to WINHTTP_ACCESS_TYPE_NAMED_PROXY. The WinHTTP functions recognize only CERN type proxies for HTTP. If dwAccessType is not set to WINHTTP_ACCESS_TYPE_NAMED_PROXY, this parameter must be set to WINHTTP_NO_PROXY_NAME.
pszProxyBypassW : [wstr] A pointer to a string variable that contains an optional semicolon delimited list of host names or IP addresses, or both, that should not be routed through the proxy when dwAccessType is set to WINHTTP_ACCESS_TYPE_NAMED_PROXY. The list can contain wildcard characters. Do not use an empty string, because the WinHttpOpen function uses it as the proxy bypass list. If this parameter specifies the "<local>" macro in the list as the only entry, this function bypasses any host name that does not contain a period. If dwAccessType is not set to WINHTTP_ACCESS_TYPE_NAMED_PROXY, this parameter must be set to WINHTTP_NO_PROXY_BYPASS.
dwFlags : [int] Unsigned long integer value that contains the flags that indicate various options affecting the behavior of this function. This parameter can have the following value.
%inst
Initializes, for an application, the use of WinHTTP functions and
returns a WinHTTP-session handle.

[戻り値]
Returns a valid session handle if successful, or NULL otherwise. To
retrieve extended error information, call GetLastError. Among the
error codes returned are the following.
This doc was truncated.

[備考]
We strongly recommend that you use WinHTTP in asynchronous mode (that
is, when WINHTTP_FLAG_ASYNC has been set in WinHttpOpen, so that
usage of the returned HINTERNET become asynchronous). The return
value indicates success or failure. To retrieve extended error
information, call GetLastError. The WinHttpOpen function is the first
of the WinHTTP functions called by an application. It initializes
internal WinHTTP data structures and prepares for future calls from
the application. When the application finishes using the WinHTTP
functions, it must call WinHttpCloseHandle to free the session handle
and any associated resources. The application can make any number of
calls to WinHttpOpen, though a single call is normally sufficient.
Each call to WinHttpOpen opens a new session context. Because user
data is not shared between multiple session contexts, an application
that makes requests on behalf of multiple users should create a
separate session for each user, so as not to share user-specific
cookies and authentication state. The application should define
separate behaviors for each WinHttpOpen instance, such as different
proxy servers configured for each. After the calling application has
finished using the HINTERNET handle returned by WinHttpOpen, it must
be closed using the WinHttpCloseHandle function. Note For Windows XP
and Windows 2000, see Run-Time Requirements.


%index
WinHttpOpenRequest
The WinHttpOpenRequest function creates an HTTP request handle.
%group
Win32 winhttp
%prm
hConnect, pwszVerb, pwszObjectName, pwszVersion, pwszReferrer, ppwszAcceptTypes, dwFlags
hConnect : [intptr] HINTERNET connection handle to an HTTP session returned by WinHttpConnect.
pwszVerb : [wstr] Pointer to a string that contains the HTTP verb to use in the request. If this parameter is NULL, the function uses GET as the HTTP verb. Note??This string should be all uppercase. Many servers treat HTTP verbs as case-sensitive, and the Internet Engineering Task Force (IETF)  Requests for Comments (RFCs) spell these verbs using uppercase characters only.
pwszObjectName : [wstr] Pointer to a string that contains the name of the target resource of the specified HTTP verb. This is generally a file name, an executable module, or a search specifier.
pwszVersion : [wstr] Pointer to a string that contains the HTTP version. If this parameter is NULL, the function uses HTTP/1.1.
pwszReferrer : [wstr] Pointer to a string that specifies the URL of the document from which the URL in the request pwszObjectName was obtained. If this parameter is set to WINHTTP_NO_REFERER, no referring document is specified.
ppwszAcceptTypes : [var] Pointer to a null-terminated array of string pointers that specifies media types accepted by the client. If this parameter is set to WINHTTP_DEFAULT_ACCEPT_TYPES, no types are accepted by the client. Typically, servers handle a lack of accepted types as indication that the client accepts only documents of type "text/*"; that is, only text documents?no pictures or other binary files. For a list of valid media types, see Media Types defined by IANA at http://www.iana.org/assignments/media-types/.
dwFlags : [int] 
%inst
The WinHttpOpenRequest function creates an HTTP request handle.

[戻り値]
Returns a valid HTTP request handle if successful, or NULL if not.
For extended error information, call GetLastError. Among the error
codes returned are the following.
This doc was truncated.

[備考]
The return value indicates success or failure. To get extended error
information, call GetLastError. The WinHttpOpenRequest function
creates a new HTTP request handle and stores the specified parameters
in that handle. An HTTP request handle holds a request to send to an
HTTP server and contains all RFC822/MIME/HTTP headers to be sent as
part of the request. If pwszVerb is set to "HEAD", the Content-Length
header is ignored. If a status callback function has been installed
with WinHttpSetStatusCallback, then a
WINHTTP_CALLBACK_STATUS_HANDLE_CREATED notification indicates that
WinHttpOpenRequest has created a request handle. After the calling
application finishes using the HINTERNET handle returned by
WinHttpOpenRequest, it must be closed using the WinHttpCloseHandle
function. Note For Windows XP and Windows 2000, see the Run-Time
Requirements section of the WinHttp start page.


%index
WinHttpQueryDataAvailable
Returns the amount of data, in bytes, available to be read with WinHttpReadData.
%group
Win32 winhttp
%prm
hRequest, lpdwNumberOfBytesAvailable
hRequest : [intptr] A valid HINTERNET handle returned by WinHttpOpenRequest. WinHttpReceiveResponse must have been called for this handle and have completed before WinHttpQueryDataAvailable is called.
lpdwNumberOfBytesAvailable : [var] A pointer to an unsigned long integer variable that receives the number of available bytes. When WinHTTP is used in asynchronous mode, always set this parameter to NULL and retrieve data in the callback function; not doing so can cause a memory fault.
%inst
Returns the amount of data, in bytes, available to be read with
WinHttpReadData.

[戻り値]
Returns TRUE if the function succeeds, or FALSE otherwise. To get
extended error data, call GetLastError. Among the error codes
returned are the following.
This doc was truncated.

[備考]
Even when WinHTTP is used in asynchronous mode (that is, when
WINHTTP_FLAG_ASYNC has been set in WinHttpOpen), this function can
operate either synchronously or asynchronously. If it returns FALSE,
it failed and you can call GetLastError to get extended error
information. If it returns TRUE, use the
WINHTTP_CALLBACK_STATUS_DATA_AVAILABLE completion to determine
whether this function was successful and the value of the parameters.
The WINHTTP_CALLBACK_STATUS_REQUEST_ERROR completion indicates that
the operation completed asynchronously, but failed. Warning When
WinHTTP is used in asynchronous mode, always set the
lpdwNumberOfBytesAvailable parameter to NULL and retrieve the bytes
available in the callback function; otherwise, a memory fault can
occur. This function returns the number of bytes of data that are
available to read immediately by a subsequent call to
WinHttpReadData. If no data is available and the end of the file has
not been reached, one of two things happens. If the session is
synchronous, the request waits until data becomes available. If the
session is asynchronous, the function returns TRUE, and when data
becomes available, calls the callback function with
WINHTTP_STATUS_CALLBACK_DATA_AVAILABLE and indicates the number of
bytes immediately available to read by calling WinHttpReadData. The
amount of data that remains is not recalculated until all available
data indicated by the call to WinHttpQueryDataAvailable is read. Use
the return value of WinHttpReadData to determine when a response has
been completely read. Important Do not use the return value of
WinHttpQueryDataAvailable to determine whether the end of a response
has been reached, because not all servers terminate responses
properly, and an improperly terminated response causes
WinHttpQueryDataAvailable to anticipate more data. For HINTERNET
handles created by the WinHttpOpenRequest function and sent by
WinHttpSendRequest, a call to WinHttpReceiveResponse must be made on
the handle before WinHttpQueryDataAvailable can be used. If a status
callback function has been installed with WinHttpSetStatusCallback,
then those of the following notifications that have been set in the
dwNotificationFlags parameter of WinHttpSetStatusCallback indicate
progress in checking for available data:
This doc was truncated.


%index
WinHttpQueryHeaders
The WinHttpQueryHeaders function retrieves header information associated with an HTTP request.
%group
Win32 winhttp
%prm
hRequest, dwInfoLevel, pwszName, lpBuffer, lpdwBufferLength, lpdwIndex
hRequest : [intptr] HINTERNET request handle returned by WinHttpOpenRequest. WinHttpReceiveResponse must have been called for this handle and have completed before WinHttpQueryHeaders is called.
dwInfoLevel : [int] Value of type DWORD that specifies a combination of attribute and modifier flags listed on the Query Info Flags page. These attribute and modifier flags indicate that the information is being requested and how it is to be formatted.
pwszName : [wstr] Pointer to a string that contains the header name. If the flag in dwInfoLevel is not WINHTTP_QUERY_CUSTOM, set this parameter to WINHTTP_HEADER_NAME_BY_INDEX.
lpBuffer : [intptr] Pointer to the buffer that receives the information. Setting this parameter to WINHTTP_NO_OUTPUT_BUFFER causes this function to return FALSE.  Calling GetLastError then returns ERROR_INSUFFICIENT_BUFFER and lpdwBufferLength contains the number of bytes required to hold the requested information.
lpdwBufferLength : [var] Pointer to a value of type DWORD that specifies the length of the data buffer, in bytes. When the function returns, this parameter contains the pointer to a value that specifies the length of the information written to the buffer. When the function returns strings, the following rules apply.
lpdwIndex : [var] Pointer to a zero-based header index used to enumerate multiple headers with the same name. When calling the function, this parameter is the index of the specified header to return. When the function returns, this parameter is the index of the next header. If the next index cannot be found, ERROR_WINHTTP_HEADER_NOT_FOUND is returned. Set this parameter to WINHTTP_NO_HEADER_INDEX to specify that only the first occurrence of a header should be returned.
%inst
The WinHttpQueryHeaders function retrieves header information
associated with an HTTP request.

[戻り値]
Returns TRUE if successful, or FALSE otherwise. To get extended error
information, call GetLastError. Among the error codes returned are
the following.
This doc was truncated.

[備考]
Even when WinHTTP is used in asynchronous mode (that is, when
WINHTTP_FLAG_ASYNC has been set in WinHttpOpen), this function
operates synchronously. The return value indicates success or
failure. To get extended error information, call GetLastError. By
default WinHttpQueryHeaders returns a string. However, you can
request data in the form of a SYSTEMTIME structure or DWORD by
including the appropriate modifier flag in dwInfoLevel. The following
table shows the possible data types that WinHttpQueryHeaders can
return along with the modifier flag that you use to select that data
type.
This doc was truncated.


%index
WinHttpReadData
The WinHttpReadData function reads data from a handle opened by the WinHttpOpenRequest function.
%group
Win32 winhttp
%prm
hRequest, lpBuffer, dwNumberOfBytesToRead, lpdwNumberOfBytesRead
hRequest : [intptr] Valid HINTERNET handle returned from a previous call to WinHttpOpenRequest. WinHttpReceiveResponse or WinHttpQueryDataAvailable must have been called for this handle and must have completed before WinHttpReadData is called. Although calling WinHttpReadData immediately after completion of WinHttpReceiveResponse avoids the expense of a buffer copy, doing so requires that the application use a fixed-length buffer for reading.
lpBuffer : [intptr] Pointer to a buffer that receives the data read. Make sure that this buffer remains valid until WinHttpReadData has completed.
dwNumberOfBytesToRead : [int] Unsigned long integer value that contains the number of bytes to read.
lpdwNumberOfBytesRead : [var] Pointer to an unsigned long integer variable that receives the number of bytes read. WinHttpReadData sets this value to zero before doing any work or error checking.  When using WinHTTP asynchronously, always set this parameter to NULL and retrieve the information in the callback function; not doing so can cause a memory fault.
%inst
The WinHttpReadData function reads data from a handle opened by the
WinHttpOpenRequest function.

[戻り値]
Returns TRUE if successful, or FALSE otherwise. For extended error
information, call GetLastError. The following table identifies the
error codes that are returned.
This doc was truncated.

[備考]
Starting in Windows Vista and Windows Server 2008, WinHttp enables
applications to perform chunked transfer encoding on data sent to the
server. When the Transfer-Encoding header is present on the WinHttp
response, WinHttpReadData strips the chunking information before
giving the data to the application. Even when WinHTTP is used in
asynchronous mode (that is, when WINHTTP_FLAG_ASYNC has been set in
WinHttpOpen), this function can operate either synchronously or
asynchronously. If this function returns FALSE, this function failed
and you can call GetLastError to get extended error information. If
this function returns TRUE, use the
WINHTTP_CALLBACK_STATUS_READ_COMPLETE completion to determine whether
this function was successful and the value of the parameters. The
WINHTTP_CALLBACK_STATUS_REQUEST_ERROR completion indicates that the
operation completed asynchronously, but failed. Warning When WinHTTP
is used in asynchronous mode, always set the lpdwNumberOfBytesRead
parameter to NULL and retrieve the bytes read in the callback
function; otherwise, a memory fault can occur. When the read buffer
is very small, WinHttpReadData might complete synchronously. If the
WINHTTP_CALLBACK_STATUS_READ_COMPLETE completion triggers another
call to WinHttpReadData, the situation can result in a stack
overflow. In general, it is best to use a read buffer that is
comparable in size, or larger than the internal read buffer used by
WinHTTP, which is 8 KB. If you are using WinHttpReadData
synchronously, and the return value is TRUE and the number of bytes
read is zero, the transfer has been completed and there are no more
bytes to read on the handle. This is analogous to reaching
end-of-file in a local file. If you are using the function
asynchronously, the WINHTTP_CALLBACK_STATUS_READ_COMPLETE callback is
called with the dwStatusInformationLength parameter set to zero when
the end of a response is found. WinHttpReadData tries to fill the
buffer pointed to by lpBuffer until there is no more data available
from the response. If sufficient data has not arrived from the
server, the buffer is not filled. For HINTERNET handles created by
the WinHttpOpenRequest function and sent by WinHttpSendRequest, a
call to WinHttpReceiveResponse must be made on the handle before
WinHttpReadData can be used. Single byte characters retrieved with
WinHttpReadData are not converted to multi-byte characters. When the
read buffer is very small, WinHttpReadData may complete
synchronously, and if the WINHTTP_CALLBACK_STATUS_READ_COMPLETE
completion then triggers another call to WinHttpReadData, a stack
overflow can result. It is best to use a read buffer that is 8
Kilobytes or larger in size. If sufficient data has not arrived from
the server, WinHttpReadData does not entirely fill the buffer pointed
to by lpBuffer. The buffer must be large enough at least to hold the
HTTP headers on the first read, and when reading HTML encoded
directory entries, it must be large enough to hold at least one
complete entry. If a status callback function has been installed by
using WinHttpSetStatusCallback, then those of the following
notifications that have been set in the dwNotificationFlags parameter
of WinHttpSetStatusCallback indicate progress in checking for
available data:
This doc was truncated.


%index
WinHttpReceiveResponse
The WinHttpReceiveResponse function waits to receive the response to an HTTP request initiated by WinHttpSendRequest.
%group
Win32 winhttp
%prm
hRequest, lpReserved
hRequest : [intptr] HINTERNET handle returned by WinHttpOpenRequest and sent by WinHttpSendRequest.  Wait until WinHttpSendRequest has completed for this handle before calling  WinHttpReceiveResponse.
lpReserved : [intptr] This parameter is reserved and must be NULL.
%inst
The WinHttpReceiveResponse function waits to receive the response to
an HTTP request initiated by WinHttpSendRequest.

[戻り値]
Returns TRUE if successful, or FALSE otherwise. For extended error
information, call GetLastError. Among the error codes returned are
the following.
This doc was truncated.

[備考]
Even when WinHTTP is used in asynchronous mode (that is, when
WINHTTP_FLAG_ASYNC has been set in WinHttpOpen), this function can
operate either synchronously or asynchronously. If this function
returns FALSE, this function failed and you can call GetLastError to
get extended error information. If this function returns TRUE, the
application should expect either the
WINHTTP_CALLBACK_STATUS_HEADERS_AVAILABLE completion callback,
indicating success, or the WINHTTP_CALLBACK_STATUS_REQUEST_ERROR
completion callback, indicating that the operation completed
asynchronously, but failed. If a status callback function has been
installed with WinHttpSetStatusCallback, then those of the following
notifications that have been set in the dwNotificationFlags parameter
of WinHttpSetStatusCallback indicate progress in receiving the
response:
This doc was truncated.


%index
WinHttpSendRequest
Sends the specified request to the HTTP server. (WinHttpSendRequest)
%group
Win32 winhttp
%prm
hRequest, lpszHeaders, dwHeadersLength, lpOptional, dwOptionalLength, dwTotalLength, dwContext
hRequest : [intptr] An HINTERNET handle returned by WinHttpOpenRequest.
lpszHeaders : [wstr] A pointer to a string  that contains the additional headers to append to the request. This parameter can be WINHTTP_NO_ADDITIONAL_HEADERS if there are no additional headers to append.
dwHeadersLength : [int] An unsigned long integer value that contains the length, in characters, of the additional headers. If this parameter is -1L and pwszHeaders is not NULL, this function assumes that pwszHeaders is null-terminated, and the length is calculated.
lpOptional : [intptr] A pointer to a buffer that contains any optional data to send immediately after the request headers. This parameter is generally used for POST and PUT operations. The optional data can be the resource or data posted to the server. This parameter can be WINHTTP_NO_REQUEST_DATA if there is no optional data to send. If the dwOptionalLength parameter is 0, this parameter is ignored and set to NULL. This buffer must remain available until the request handle is closed or the call to WinHttpReceiveResponse has completed.
dwOptionalLength : [int] An unsigned long integer value that contains the length, in bytes, of the optional data. This parameter can be zero if there is no optional data to send. This parameter must contain a valid length when the lpOptional parameter is not NULL. Otherwise, lpOptional is ignored and set to NULL.
dwTotalLength : [int] An unsigned long integer value that contains the length, in bytes, of the total data sent.  This parameter specifies the Content-Length header of the request.  If the value of this parameter is greater than the length specified by dwOptionalLength, then WinHttpWriteData can be used to send additional data. dwTotalLength must not change between calls to WinHttpSendRequest for the same request.  If dwTotalLength needs to be changed, the caller should create a new request.
dwContext : [int] A pointer to a pointer-sized variable that contains an application-defined value that is passed, with the request handle, to any callback functions.
%inst
Sends the specified request to the HTTP server. (WinHttpSendRequest)

[戻り値]
Returns TRUE if successful, or FALSE otherwise. For extended error
information, call GetLastError. Error codes are listed in the
following table.
This doc was truncated.

[備考]
Even when WinHTTP is used in asynchronous mode, that is, when
WINHTTP_FLAG_ASYNC has been set in WinHttpOpen, this function can
operate either synchronously or asynchronously. In either case, if
the request is sent successfully, the application is called back with
the completion status set to
WINHTTP_CALLBACK_STATUS_SENDREQUEST_COMPLETE. The
WINHTTP_CALLBACK_STATUS_REQUEST_ERROR completion indicates that the
operation completed asynchronously, but failed. Upon receiving the
WINHTTP_CALLBACK_STATUS_SENDREQUEST_COMPLETE status callback, the
application can start to receive a response from the server with
WinHttpReceiveResponse. Before then, no other asynchronous functions
can be called, otherwise, ERROR_WINHTTP_INCORRECT_HANDLE_STATE is
returned. An application must not delete or alter the buffer pointed
to by lpOptional until the request handle is closed or the call to
WinHttpReceiveResponse has completed, because an authentication
challenge or redirect that required the optional data could be
encountered in the course of receiving the response. If the operation
must be aborted with WinHttpCloseHandle, the application must keep
the buffer valid until it receives the callback
WINHTTP_CALLBACK_STATUS_REQUEST_ERROR with an
ERROR_WINHTTP_OPERATION_CANCELLED error code. If WinHTTP is used
synchronously, that is, when WINHTP_FLAG_ASYNC was not set in
WinHttpOpen, an application is not called with a completion status
even if a callback function is registered. While in this mode, the
application can call WinHttpReceiveResponse when WinHttpSendRequest
returns. The WinHttpSendRequest function sends the specified request
to the HTTP server and allows the client to specify additional
headers to send along with the request. This function also lets the
client specify optional data to send to the HTTP server immediately
following the request headers. This feature is generally used for
write operations such as PUT and POST. An application can use the
same HTTP request handle in multiple calls to WinHttpSendRequest to
re-send the same request, but the application must read all data
returned from the previous call before calling this function again.
The name and value of request headers added with this function are
validated. Headers must be well formed. For more information about
valid HTTP headers, see RFC 2616. If an invalid header is used, this
function fails and GetLastError returns ERROR_INVALID_PARAMETER. The
invalid header is not added. Windows 2000: When sending requests from
multiple threads, there may be a significant decrease in network and
CPU performance. Windows XP and Windows 2000: See Run-Time
Requirements. WinHttpSetStatusCallback If a status callback function
has been installed with WinHttpSetStatusCallback, then those of the
following notifications that have been set in the dwNotificationFlags
parameter of WinHttpSetStatusCallback indicate the progress in
sending the request:
This doc was truncated.


%index
WinHttpSetOption
The WinHttpSetOption function sets an Internet option.
%group
Win32 winhttp
%prm
hInternet, dwOption, lpBuffer, dwBufferLength
hInternet : [intptr] The HINTERNET handle on which to set data. Be aware  that this can be either a Session handle or a Request handle, depending on what option is being set. For more information about how to determine which handle is appropriate to use in setting a particular option, see the  Option Flags.
dwOption : [int] An unsigned long integer value that contains the Internet option to set. This can be one of the Option Flags values.
lpBuffer : [intptr] A pointer to a buffer that contains the option setting.
dwBufferLength : [int] Unsigned long integer value that contains the length of the lpBuffer buffer. The length of the buffer is specified in characters for the following options; for all other options, the length is specified in bytes.
%inst
The WinHttpSetOption function sets an Internet option.

[戻り値]
Returns TRUE if successful, or FALSE otherwise. For extended error
information, call GetLastError. Among the error codes returned are
the following:
This doc was truncated.

[備考]
Credentials passed to WinHttpSetOption could be unexpectedly sent in
plaintext. It is strongly recommended that you use
WinHttpQueryAuthSchemes and WinHttpSetCredentials instead of
WinHttpSetOption for setting credentials. Note When using Passport
authentication, however, a WinHTTP application responding to a 407
status code must use WinHttpSetOption to provide proxy credentials
rather than WinHttpSetCredentials. This is only true when using
Passport authentication; in all other circumstances, use
WinHttpSetCredentials. Even when WinHTTP is used in asynchronous mode
(that is, when WINHTTP_FLAG_ASYNC has been set in WinHttpOpen), this
function operates synchronously. The return value indicates success
or failure. To get extended error information, call GetLastError.
GetLastError returns the error ERROR_INVALID_PARAMETER if an option
flag is specified that cannot be set. For more information and code
examples that show the use of WinHttpSetOption, see Authentication in
WinHTTP. Note For Windows XP and Windows 2000, see the Run-Time
Requirements section of the WinHttp start page.

