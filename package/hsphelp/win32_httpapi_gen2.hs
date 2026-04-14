; ============================================================
;   httpapi.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
HttpAddFragmentToCache
The HttpAddFragmentToCache function caches a data fragment with a specified name by which it can be retrieved, or updates data cached under a specified name.
%group
Win32 httpapi
%prm
RequestQueueHandle, UrlPrefix, DataChunk, CachePolicy, Overlapped
RequestQueueHandle : [intptr] Handle to the request queue with which this cache is associated. A request queue is created and its handle returned by a call to the HttpCreateRequestQueue function. Windows Server?2003 with SP1 and Windows?XP with SP2:??The handle to the request queue is created by the HttpCreateHttpHandle function.
UrlPrefix : [wstr] Pointer to a  UrlPrefix string that the application uses in subsequent calls to HttpSendHttpResponse to identify this cache entry. The application must have called HttpAddUrl previously with the same handle as in the ReqQueueHandle parameter, and with  either  this identical UrlPrefix string or a valid prefix of it. Like any UrlPrefix, this string must take the form "scheme://host:port/relativeURI"; for example, `http://www.mysite.com:80/image1.gif`.
DataChunk : [var] Pointer to an HTTP_DATA_CHUNK structure that specifies an entity body data block to cache under the name pointed to by pUrlPrefix.
CachePolicy : [var] Pointer to an HTTP_CACHE_POLICY structure that specifies how this data fragment should be cached.
Overlapped : [var] For asynchronous calls, set pOverlapped to point to an OVERLAPPED structure, or for synchronous calls, set it to NULL.
%inst
The HttpAddFragmentToCache function caches a data fragment with a
specified name by which it can be retrieved, or updates data cached
under a specified name.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function is used asynchronously, a return value of ERROR_IO_PENDING
indicates that the cache request is queued and will complete later
through normal overlapped I/O completion mechanisms. If the function
fails, the return value is one of the following error codes.
This doc was truncated.


%index
HttpAddUrl
Registers a given URL so that requests that match it are routed to a specified HTTP Server API request queue.
%group
Win32 httpapi
%prm
RequestQueueHandle, FullyQualifiedUrl, Reserved
RequestQueueHandle : [intptr] The handle to the request queue to which requests for the specified URL are to be routed. A request queue is created and its handle returned by a call to the HttpCreateRequestQueue function. Windows Server?2003 with SP1 and Windows?XP with SP2:??The handle to the request queue is created by the HttpCreateHttpHandle function.
FullyQualifiedUrl : [wstr] A pointer to a Unicode string that contains a properly formed UrlPrefix string that identifies the URL to be registered.
Reserved : [intptr] Reserved; must be NULL.
%inst
Registers a given URL so that requests that match it are routed to a
specified HTTP Server API request queue.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
As stated in the UrlPrefix Strings topic, the scheme specification of
the UrlPrefix to be registered must be either lower-case "http" or
lower-case "https". No other substring is valid. Also, it is not
possible to register URLs having different schemes on the same port.
That is, "http" and "https" schemes cannot coexist on a port. Also be
aware that HttpAddUrl registers any UrlPrefix passed to it as long as
the string is well-formed. Any validation of existence,
accessibility, ownership, or other characteristic of the specified
URL namespace must be handled by the application. To release the
resources allocated as a result of the registration performed by
HttpAddUrl, make a matching call to the HttpRemoveUrl function when
your application has finished with the namespace involved.


%index
HttpAddUrlToUrlGroup
Adds the specified URL to the URL Group identified by the URL Group ID.
%group
Win32 httpapi
%prm
UrlGroupId, pFullyQualifiedUrl, UrlContext, Reserved
UrlGroupId : [int64] The group ID for the URL group to which requests for the specified URL are routed. The URL group is created by the HttpCreateUrlGroup function.
pFullyQualifiedUrl : [wstr] A pointer to a Unicode string that contains a properly formed UrlPrefix String that identifies the URL to be registered. If you are not running as an administrator, specify a port number greater than 1024, otherwise you may get an ERROR_ACCESS_DENIED error.
UrlContext : [int64] The context that is associated with the URL registered in this call. The URL context is returned in the HTTP_REQUEST structure with every request received on the URL specified in the pFullyQualifiedUrl parameter.
Reserved : [int] Reserved. Must be zero.
%inst
Adds the specified URL to the URL Group identified by the URL Group
ID.

[戻り値]
If the function succeeds, it returns NO_ERROR If the function fails,
it returns one of the following error codes.
This doc was truncated.

[備考]
The HTTP Server API supports existing applications using version 1.0
URL registrations, however, new development with the HTTP Server API
should use HttpAddUrlToUrlGroup; HttpAddUrl should not be used. An
application can add multiple URLs to a URL group using repeated calls
to HttpAddUrlToUrlGroup. Requests that match the specified URL are
routed to the request queue associated with the URL group. For more
information about how the HTTP Server API matches request URLs to
registered URLs, see UrlPrefix Strings.


%index
HttpCancelHttpRequest
The HttpCancelHttpRequest function cancels a specified reqest.
%group
Win32 httpapi
%prm
RequestQueueHandle, RequestId, Overlapped
RequestQueueHandle : [intptr] A handle to the request queue from which the request came.
RequestId : [int64] The ID of the request to be canceled.
Overlapped : [var] For asynchronous calls, set pOverlapped to point to an OVERLAPPED structure; for synchronous calls, set it to NULL.
%inst
The HttpCancelHttpRequest function cancels a specified reqest.

[戻り値]
If the function succeeds, it returns NO_ERROR.

[備考]
When the **HttpCancelHttpRequest** function is used to cancel a
request, the underlying transport connection used for the request
will be closed.


%index
HttpCloseRequestQueue
Closes the handle to the specified request queue created by HttpCreateRequestQueue.
%group
Win32 httpapi
%prm
RequestQueueHandle
RequestQueueHandle : [intptr] The handle to the request queue that is closed. A request queue is created and its handle returned by a call to the HttpCreateRequestQueue function.
%inst
Closes the handle to the specified request queue created by
HttpCreateRequestQueue.

[戻り値]
If the function succeeds, it returns NO_ERROR. If the function fails,
it returns one of the following error codes.
This doc was truncated.

[備考]
Applications should not call CloseHandle on the request queue handle;
instead, they should call HttpCloseRequestQueue to ensure that all
the resources are released.


%index
HttpCloseServerSession
Deletes the server session identified by the server session ID.
%group
Win32 httpapi
%prm
ServerSessionId
ServerSessionId : [int64] The ID of the server session that is closed.
%inst
Deletes the server session identified by the server session ID.

[戻り値]
If the function succeeds, it returns NO_ERROR If the function fails,
it can return one of the following error codes.
This doc was truncated.

[備考]
Applications must call HttpCloseUrlGroup before calling
HttpCloseServerSession to close the all the URL Groups associated
with the server session.


%index
HttpCloseUrlGroup
Closes the URL Group identified by the URL Group ID.
%group
Win32 httpapi
%prm
UrlGroupId
UrlGroupId : [int64] The ID of the URL Group that is deleted.
%inst
Closes the URL Group identified by the URL Group ID.

[戻り値]
If the function succeeds, it returns NO_ERROR. If the function fails,
it returns one of the following error codes.
This doc was truncated.

[備考]
Applications must call HttpCloseUrlGroup before calling
HttpCloseServerSession to close the all URL Groups associated with
the server session.


%index
HttpCreateHttpHandle
Creates an HTTP request queue for the calling application and returns a handle to it.
%group
Win32 httpapi
%prm
RequestQueueHandle, Reserved
RequestQueueHandle : [intptr] A pointer to a variable that receives a handle to the request queue.
Reserved : [int] Reserved. This parameter must be zero.
%inst
Creates an HTTP request queue for the calling application and returns
a handle to it.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The request queue enables the calling application to receive requests
for particular URLs. The calling application uses the HttpAddUrl
function to specify the URL for which it should receive requests. An
application should use a single request queue to receive requests.
Using multiple request queues from a single process does not increase
response time or throughput. When an application has finished
receiving requests, it should call the CloseHandle function to close
the handle.


%index
HttpCreateRequestQueue
Creates a new request queue or opens an existing request queue.
%group
Win32 httpapi
%prm
Version, Name, SecurityAttributes, Flags, RequestQueueHandle
Version : [var] An HTTPAPI_VERSION structure indicating the request queue version. For  version 2.0, declare an instance of the structure and set it to the predefined value HTTPAPI_VERSION_2 before passing it to HttpCreateRequestQueue. The version must be 2.0; HttpCreateRequestQueue does not support  version 1.0 request queues.
Name : [wstr] The name of the request queue. The length, in bytes, cannot exceed MAX_PATH. The optional name parameter allows other processes to access the request queue by name.
SecurityAttributes : [var] A pointer to the SECURITY_ATTRIBUTES structure that contains the  access permissions for the request queue. This parameter must be NULL when opening an existing request queue.
Flags : [int] The flags parameter defines the scope of the request queue. This parameter can be one or more of the following:
RequestQueueHandle : [intptr] A pointer to a variable that receives a handle to the request queue.  This parameter must contain a valid pointer; it cannot be NULL.
%inst
Creates a new request queue or opens an existing request queue.

[戻り値]
If the function succeeds, it returns NO_ERROR If the function fails,
it returns one of the following error codes.
This doc was truncated.

[備考]
The HTTP Server API supports existing applications using the version
1.0 request queues, however, new development with the HTTP Server API
should use HttpCreateRequestQueue to create request queues;
HttpCreateHttpHandle should not be used. The version 2.0 API are only
compatible with the version 2.0 request queues created by
HttpCreateRequestQueue. The HTTP version 2 request queues require
manual configuration; the application must create the URL Groups and
associate one or more URL Group with the request queue by calling
HttpSetUrlGroupProperty with the HttpServerBindingProperty. The
application configures the request queue by calling
HttpSetRequestQueueProperty with the desired configuration in the
Property parameter. For more information about creating and
configuring URL groups, see HttpCreateUrlGroup and
HttpSetUrlGroupProperty. Security attributes may be supplied in
pSecurityAttributes parameter only when the request queue is created.
Only the application that creates the request queue can set Access
Control Lists (ACLs) on the request queue handle to allow processes
(other than the creator application) permission to open, receive
requests, and send responses on the request queue handle. By default,
applications are not allowed to open a request queue unless they have
been granted permission in the ACL. The creator process can
optionally use the HTTP_CREATE_REQUEST_QUEUE_FLAG_CONTROLLER flag to
indicate that it does not want to receive http requests.
HttpCreateRequestQueue allows applications to open an existing
request queue with the HTTP_CREATE_REQUEST_QUEUE_FLAG_OPEN_EXISTING
flag and retrieve the handle to the request queue. Non-controller
applications can use this handle to perform HTTP I/O operations. Only
the application that creates the request queue can set properties on
it by calling the HttpSetRequestQueueProperty. The handle to the
request queue created by HttpCreateRequestQueue must be closed by
calling HttpCloseRequestQueue before the application terminates or
when the session is no longer required. Applications must call
HttpInitialize prior to calling HttpCreateRequestQueue.


%index
HttpCreateServerSession
Creates a server session for the specified version.
%group
Win32 httpapi
%prm
Version, ServerSessionId, Reserved
Version : [var] An HTTPAPI_VERSION structure that indicates the version of the server session. For  version 2.0, declare an instance of the structure and set it to the predefined value HTTPAPI_VERSION_2 before passing it to HttpCreateServerSession. The version must be 2.0; HttpCreateServerSession does not support  version 1.0 request queues.
ServerSessionId : [var] A pointer to the variable that receives the ID of the server session.
Reserved : [int] Reserved. Must be zero.
%inst
Creates a server session for the specified version.

[戻り値]
If the function succeeds, it returns NO_ERROR. If the function fails,
it returns one of the following error codes.
This doc was truncated.

[備考]
Server sessions own a set of URL Groups. They are top-level
configuration containers for configuration information that applies
to all of the URL Groups created under them. For more information
about configuring a server session, see HttpSetServerSessionProperty.
The HTTP Server API does not support asynchronous I/O for server
sessions. When the server session is no longer required, or before
the application terminates, application must delete the server
session by calling HttpCloseServerSession. When a server session is
deleted all of the associated URL Groups are also automatically
deleted.


%index
HttpCreateUrlGroup
Creates a URL Group under the specified server session.
%group
Win32 httpapi
%prm
ServerSessionId, pUrlGroupId, Reserved
ServerSessionId : [int64] The identifier of the server session under which the URL Group is created.
pUrlGroupId : [var] A pointer to the variable that receives the ID of the URL Group.
Reserved : [int] Reserved. Must be zero.
%inst
Creates a URL Group under the specified server session.

[戻り値]
If the function succeeds, it returns NO_ERROR If the function fails,
it returns one of the following error codes.
This doc was truncated.

[備考]
URL Groups are configuration containers for a set of URLs. They are
created under the server session and inherit the configuration
settings of the server session. When a configuration parameter is set
on the URL Group, it overrides the configuration set on the server
session. For more information about the setting configurations for
the URL Group, see HttpSetUrlGroupProperty. After the URL group is
created it must be associated with a request queue to receive
requests. To associate the URL Group with a request queue, the
application calls HttpSetUrlGroupProperty with the
HttpServerBindingProperty property. If this property is not set,
matching requests for the URL Group are not delivered to a request
queue and the HTTP Server API generates a 503 response. The URL Group
association with a request queue is dynamic. The association with the
servers session cannot be changed until either the server session or
the URL Group is deleted. When a server session is deleted all of the
associated URL Groups are also automatically closed. The URL Group is
initially created as an empty group. URLs must be added to the group
by calling HttpAddUrlToUrlGroup.
This doc was truncated.


%index
HttpDeclarePush
Declares a resource-to-subresource relationship to use for an HTTP server push. HTTP.sys then performs an HTTP 2.0 server push for the given resource, if the underlying protocol, connection, client, and policies allow the push operation.
%group
Win32 httpapi
%prm
RequestQueueHandle, RequestId, Verb, Path, Query, Headers
RequestQueueHandle : [intptr] The handle to an HTTP.sys request queue that the  HttpCreateRequestQueue function returned.
RequestId : [int64] The opaque identifier of the request that is declaring the push operation. The request must be from the specified queue handle.
Verb : [int] The HTTP verb to use for the push operation. The HTTP.sys push operation only supports HttpVerbGET and HttpVerbHEAD.
Path : [wstr] The path portion of the URL for the resource being pushed.
Query : [str] The query portion of the URL for the resource being pushed. This          string should not include the leading question mark (?).
Headers : [var] The request headers for the push operation. You should not provide a Host header, because HTTP.sys automatically generates the correct Host information.  HTTP.sys does not support cross-origin push operations, so HTTP.sys  enforces and generates Host information that matches the original client-initiated request. The push request is not allowed to have an entity body, so you cannot include a non-zero Content-Length  header or any Transfer-Encoding header.
%inst
Declares a resource-to-subresource relationship to use for an HTTP
server push. HTTP.sys then performs an HTTP 2.0 server push for the
given resource, if the underlying protocol, connection, client, and
policies allow the push operation.

[戻り値]
If the function succeeds, it returns NO_ERROR. If the function fails,
it returns a system error code defined in WinError.h.

[備考]
You should call HttpDeclarePush before you send any response bytes
that would cause the client to discover the subresource itself.
Failure to observe this order results in a race between the server
that is pushing the resource and the client that is retrieving the
resources, which can waste bandwidth. The server application should
only use HttpDeclarePush to push resources that the server
application is highly confident are needed and not already cached by
the client. If the server application pushes other resources,
unnecessary use of bandwidth and CPU may occur.


%index
HttpDelegateRequestEx
Delegates a request from the source request queue to the target request queue.
%group
Win32 httpapi
%prm
RequestQueueHandle, DelegateQueueHandle, RequestId, DelegateUrlGroupId, PropertyInfoSetSize, PropertyInfoSet
RequestQueueHandle : [intptr] Type: \_In\_ **[HANDLE](/windows/win32/winprog/windows-data-types)** A handle to the source request queue.
DelegateQueueHandle : [intptr] Type: \_In\_ **[HANDLE](/windows/win32/winprog/windows-data-types)** A handle to the target request queue.
RequestId : [int64] Type: \_In\_ **HTTP_REQUEST_ID** A unique request ID received with [HttpReceiveHttpRequest](/windows/win32/api/http/nf-http-httpreceivehttprequest).
DelegateUrlGroupId : [int64] Type: \_In\_ **HTTP_URL_GROUP_ID** The url group id of the target url group.
PropertyInfoSetSize : [int] Type: \_In\_ **[ULONG](/windows/win32/winprog/windows-data-types)** The number of entries in the *PropertyInfoSet* array.
PropertyInfoSet : [var] Type: \_In\_ [**PHTTP_DELEGATE_REQUEST_PROPERTY_INFO](/windows/win32/api/http/ns-http-http_delegate_request_property_info)** An array of properties to be set on request when delegating.
%inst
Delegates a request from the source request queue to the target
request queue.

[戻り値]
A **[ULONG](/windows/win32/winprog/windows-data-types)** containing
an
[NTSTATUS](/openspecs/windows_protocols/ms-erref/87fba13e-bf06-450e-83b1-9241dc81e781)
completion status.


%index
HttpDeleteServiceConfiguration
Deletes specified data, such as IP addresses or SSL Certificates, from the HTTP Server API configuration store, one record at a time.
%group
Win32 httpapi
%prm
ServiceHandle, ConfigId, pConfigInformation, ConfigInformationLength, pOverlapped
ServiceHandle : [intptr] This parameter is reserved and must be zero.
ConfigId : [int] Type of configuration. This parameter is one of the  values in the HTTP_SERVICE_CONFIG_ID enumeration.
pConfigInformation : [intptr] Pointer to a buffer that contains data required for the type of configuration specified in the ConfigId parameter.
ConfigInformationLength : [int] Size, in bytes, of the pConfigInformation buffer.
pOverlapped : [var] Reserved for future asynchronous operation. This parameter must be set to NULL.
%inst
Deletes specified data, such as IP addresses or SSL Certificates,
from the HTTP Server API configuration store, one record at a time.

[戻り値]
If the function succeeds, the function returns NO_ERROR. If the
function fails, it returns one of the following error codes.
This doc was truncated.


%index
HttpFindUrlGroupId
Retrieves a URL group ID for a URL and a request queue.
%group
Win32 httpapi
%prm
FullyQualifiedUrl, RequestQueueHandle, UrlGroupId
FullyQualifiedUrl : [wstr] Type: \_In\_ **[PCWSTR](/windows/win32/winprog/windows-data-types)** The URL whose URL group to query.
RequestQueueHandle : [intptr] Type: \_In\_ **[HANDLE](/windows/win32/winprog/windows-data-types)** The request queue associated with the URL group.
UrlGroupId : [var] Type: \_Out\_ **PHTTP_URL_GROUP_ID** The matching URL group ID.
%inst
Retrieves a URL group ID for a URL and a request queue.

[戻り値]
A **[ULONG](/windows/win32/winprog/windows-data-types)** containing
an
[NTSTATUS](/openspecs/windows_protocols/ms-erref/87fba13e-bf06-450e-83b1-9241dc81e781)
completion status.


%index
HttpFlushResponseCache
Removes from the HTTP Server API cache associated with a given request queue all response fragments that have a name whose site portion matches a specified UrlPrefix.
%group
Win32 httpapi
%prm
RequestQueueHandle, UrlPrefix, Flags, Overlapped
RequestQueueHandle : [intptr] Handle to the request queue with which this cache is associated. A request queue is created and its handle returned by a call to the HttpCreateRequestQueue function. Windows Server?2003 with SP1 and Windows?XP with SP2:??The handle to the request queue is created by the HttpCreateHttpHandle function.
UrlPrefix : [wstr] Pointer to a UrlPrefix string to match against the site portion of fragment names. The application must previously have called HttpAddUrl to add this UrlPrefix or a valid prefix of it to the request queue in question, and then called HttpAddFragmentToCache to cache the associated response fragment.
Flags : [int] This parameter can contain the following flag:
Overlapped : [var] For asynchronous calls, set pOverlapped to point to an OVERLAPPED structure, or for synchronous calls, set it to NULL.
%inst
Removes from the HTTP Server API cache associated with a given
request queue all response fragments that have a name whose site
portion matches a specified UrlPrefix.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function is used asynchronously, a return value of ERROR_IO_PENDING
indicates that the cache request is queued and completes later
through normal overlapped I/O completion mechanisms. If the function
fails, the return value is one of the following error codes.
This doc was truncated.


%index
HttpGetExtension
(no summary)
%group
Win32 httpapi
%prm
Version, Extension, Buffer, BufferSize
Version : [var] 
Extension : [int] 
Buffer : [intptr] 
BufferSize : [int] 
%inst



%index
HttpInitialize
The HttpInitialize function initializes the HTTP Server API driver, starts it, if it has not already been started, and allocates data structures for the calling application to support response-queue creation and other operations.
%group
Win32 httpapi
%prm
Version, Flags, pReserved
Version : [var] HTTP version. This parameter is an HTTPAPI_VERSION structure. For the current version, declare an instance of the structure and set it to the pre-defined value **HTTPAPI_VERSION_1** before passing it to HttpInitialize.
Flags : [int] 
pReserved : [intptr] This parameter is reserved, and must be NULL.
%inst
The HttpInitialize function initializes the HTTP Server API driver,
starts it, if it has not already been started, and allocates data
structures for the calling application to support response-queue
creation and other operations.

[戻り値]
If the function succeeds, then the return value is **NO_ERROR**. If
the function fails, then the return value is one of the following
error codes.
This doc was truncated.

[備考]
Call HttpTerminate when the application completes. All the same flags
that were passed to HttpInitialize in the Flags parameter must also
be passed to HttpTerminate. An application can call HttpInitialize
repeatedly, provided that each call to HttpInitialize is later
matched by a corresponding call to HttpTerminate.


%index
HttpIsFeatureSupported
Checks whether a particular feature is supported.
%group
Win32 httpapi
%prm
FeatureId
FeatureId : [int] Type: \_In\_ **[HTTP_FEATURE_ID](./ne-http-http_feature_id.md)** The identifier of the feature.
%inst
Checks whether a particular feature is supported.

[戻り値]
`TRUE` if the feature is supported, otherwise `FALSE`.


%index
HttpPrepareUrl
Parses, analyzes, and normalizes a non-normalized Unicode or punycode URL so it is safe and valid to use in other HTTP functions.
%group
Win32 httpapi
%prm
Reserved, Flags, Url, PreparedUrl
Reserved : [intptr] Reserved.  Must be NULL.
Flags : [int] Reserved. Must be zero.
Url : [wstr] A pointer to a string that represents the non-normalized Unicode or punycode URL to prepare.
PreparedUrl : [var] On successful output, a pointer to a string that represents the normalized URL. Note??Free PreparedUrl using HeapFree.
%inst
Parses, analyzes, and normalizes a non-normalized Unicode or punycode
URL so it is safe and valid to use in other HTTP functions.

[戻り値]
If the function succeeds, it returns ERROR_SUCCESS. If the function
fails, it returns one of the following or a system error code defined
in WinError.h.


%index
HttpQueryRequestQueueProperty
Queries a property of the request queue identified by the specified handle.
%group
Win32 httpapi
%prm
RequestQueueHandle, Property, PropertyInformation, PropertyInformationLength, Reserved1, ReturnLength, Reserved2
RequestQueueHandle : [intptr] 
Property : [int] A member of the  HTTP_SERVER_PROPERTY enumeration that describes the property type that is set. This can be one of the following:
PropertyInformation : [intptr] A pointer to the buffer that receives the property information.
PropertyInformationLength : [int] The length, in bytes, of the buffer pointed to by the pPropertyInformation parameter.
Reserved1 : [int] Reserved. Must be zero.
ReturnLength : [var] The number, in bytes, returned in the  pPropertyInformation buffer if not NULL. If the output buffer is too small, the call fails with a return value of ERROR_MORE_DATA. The value pointed to by pReturnLength can be used to determine the minimum length of the buffer required for the call to succeed.
Reserved2 : [intptr] This parameter is reserved and must be NULL.
%inst
Queries a property of the request queue identified by the specified
handle.

[戻り値]
If the function succeeds, it returns NO_ERROR. If the function fails,
it returns one of the following error codes.
This doc was truncated.


%index
HttpQueryServerSessionProperty
Queries a server property on the specified server session.
%group
Win32 httpapi
%prm
ServerSessionId, Property, PropertyInformation, PropertyInformationLength, ReturnLength
ServerSessionId : [int64] The server session for which the property setting is returned.
Property : [int] A member of the  HTTP_SERVER_PROPERTY enumeration that describes the property type that is queried. This can be one of the following.
PropertyInformation : [intptr] A pointer to the buffer that receives the property data.
PropertyInformationLength : [int] The length, in bytes, of the buffer pointed to by the pPropertyInformation parameter.
ReturnLength : [var] The number, in  bytes, returned in the  pPropertyInformation buffer. If the output buffer is too small, the call fails with a return value of ERROR_MORE_DATA. The value pointed to by pReturnLength can be used to determine the minimum length of the buffer required for the call to succeed.
%inst
Queries a server property on the specified server session.

[戻り値]
If the function succeeds, it returns NO_ERROR If the function fails,
it returns one of the following error codes.
This doc was truncated.

[備考]
Querying the HttpServerLoggingProperty is not supported. The
pPropertyInformation parameter points to the configuration structure
for the property type that is queried. The PropertyInformationLength
parameter specifies the size, in bytes, of the configuration
structure. For example, when querying the HttpServerTimeoutsProperty
the pPropertyInformation parameter must point to a buffer that is at
least the size of the HTTP_TIMEOUT_LIMIT_INFO structure. To specify
the HttpServerQosProperty property in the pPropertyInformation
parameter, set QosType to HttpQosSettingTypeBandwidth inside the
HTTP_QOS_SETTING_INFO structure, and pass a pointer to this structure
in the parameter.


%index
HttpQueryServiceConfiguration
Retrieves one or more HTTP Server API configuration records.
%group
Win32 httpapi
%prm
ServiceHandle, ConfigId, pInput, InputLength, pOutput, OutputLength, pReturnLength, pOverlapped
ServiceHandle : [intptr] Reserved. Must be zero.
ConfigId : [int] 
pInput : [intptr] A pointer to a structure whose contents further define the query and of the type that correlates with ConfigId in the following table.
InputLength : [int] Size, in bytes, of the pInputConfigInfo buffer.
pOutput : [intptr] A pointer to a buffer in which the query results are returned. The type of this buffer correlates with ConfigId.
OutputLength : [int] Size, in bytes, of the pOutputConfigInfo buffer.
pReturnLength : [var] A pointer to a variable that receives the number of bytes to be written in the output buffer. If the output buffer is too small, the call fails with a return value of ERROR_INSUFFICIENT_BUFFER. The value pointed to by pReturnLength can be used to determine the minimum length the buffer requires for the call to succeed.
pOverlapped : [var] Reserved for asynchronous operation and must be set to NULL.
%inst
Retrieves one or more HTTP Server API configuration records.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.


%index
HttpQueryUrlGroupProperty
Queries a property on the specified URL Group.
%group
Win32 httpapi
%prm
UrlGroupId, Property, PropertyInformation, PropertyInformationLength, ReturnLength
UrlGroupId : [int64] The ID of the URL Group for which the property setting is returned.
Property : [int] A member of the  HTTP_SERVER_PROPERTY enumeration that describes the property type that is queried. This can be one of the following:
PropertyInformation : [intptr] A pointer to the buffer that receives the property information.
PropertyInformationLength : [int] The length, in bytes, of the buffer pointed to by the pPropertyInformation parameter.
ReturnLength : [var] The size, in bytes, returned in the  pPropertyInformation buffer. If the output buffer is too small, the call fails with a return value of ERROR_MORE_DATA. The value pointed to by pReturnLength can be used to determine the minimum length of the buffer required for the call to succeed.
%inst
Queries a property on the specified URL Group.

[戻り値]
If the function succeeds, it returns NO_ERROR. If the function fails,
it returns one of the following error codes.
This doc was truncated.

[備考]
Querying the HttpServerLoggingProperty is not supported.


%index
HttpReadFragmentFromCache
The HttpReadFragmentFromCache function retrieves a response fragment having a specified name from the HTTP Server API cache.
%group
Win32 httpapi
%prm
RequestQueueHandle, UrlPrefix, ByteRange, Buffer, BufferLength, BytesRead, Overlapped
RequestQueueHandle : [intptr] Handle to the request queue with which the specified response fragment is associated. A request queue is created and its handle returned by a call to the HttpCreateRequestQueue function. Windows Server?2003 with SP1 and Windows?XP with SP2:??The handle to the request queue is created by the HttpCreateHttpHandle function.
UrlPrefix : [wstr] Pointer to a UrlPrefix string that contains the name of the fragment to be retrieved. This must match a UrlPrefix string used in a previous successful call to HttpAddFragmentToCache.
ByteRange : [var] Optional pointer to an HTTP_BYTE_RANGE structure that indicates a starting offset in the specified fragment and byte-count to be returned. NULL if not used, in which case the entire fragment is returned.
Buffer : [intptr] Pointer to a buffer into which the function copies the requested fragment.
BufferLength : [int] Size, in bytes, of the pBuffer buffer.
BytesRead : [var] Optional pointer to a variable that receives the number of bytes to be written into the output buffer. If BufferLength is less than this number, the call fails with a return of ERROR_INSUFFICIENT_BUFFER, and the value pointed to by pBytesRead can be used to determine the minimum length of buffer required for the call to succeed.
Overlapped : [var] For asynchronous calls, set pOverlapped to point to an OVERLAPPED structure, or for synchronous calls, set it to NULL.
%inst
The HttpReadFragmentFromCache function retrieves a response fragment
having a specified name from the HTTP Server API cache.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function is used asynchronously, a return value of ERROR_IO_PENDING
indicates that the cache request is queued and completes later
through normal overlapped I/O completion mechanisms. If the function
fails, the return value is one of the following error codes.
This doc was truncated.


%index
HttpReceiveClientCertificate
The HttpReceiveClientCertificate function is used by a server application to retrieve a client SSL certificate or channel binding token (CBT).
%group
Win32 httpapi
%prm
RequestQueueHandle, ConnectionId, Flags, SslClientCertInfo, SslClientCertInfoSize, BytesReceived, Overlapped
RequestQueueHandle : [intptr] A handle to the request queue with which the specified SSL client or CBT is associated. A request queue is created and its handle returned by a call to the HttpCreateRequestQueue function. Windows Server?2003 with SP1 and Windows?XP with SP2:??The handle to the request queue is created by the HttpCreateHttpHandle function.
ConnectionId : [int64] A value that identifies the connection to the client. This value is obtained from the ConnectionId element of an HTTP_REQUEST structure filled in by the HttpReceiveHttpRequest function.
Flags : [int] A value that modifies the behavior of the HttpReceiveClientCertificate function
SslClientCertInfo : [var] If the Flags parameter is 0, then this parameter points to an HTTP_SSL_CLIENT_CERT_INFO structure into which the function writes the requested client certificate information. The buffer pointed to by the pSslClientCertInfo should be sufficiently large enough to hold the HTTP_SSL_CLIENT_CERT_INFO structure plus the value of the CertEncodedSize member of this structure. If the Flags parameter is HTTP_RECEIVE_SECURE_CHANNEL_TOKEN, then this parameter points to an HTTP_REQUEST_CHANNEL_BIND_STATUS structure into which the function writes the requested CBT information. The buffer pointed to by the pSslClientCertInfo should be sufficiently large enough to hold the HTTP_REQUEST_CHANNEL_BIND_STATUS  structure plus the value of the ChannelTokenSize member of this structure.
SslClientCertInfoSize : [int] The size, in bytes, of the buffer pointed to by the pSslClientCertInfo parameter.
BytesReceived : [var] An optional pointer to a variable that receives  the number of bytes to be written to the structure pointed to by pSslClientCertInfo. If not used, set it to NULL.
Overlapped : [var] For asynchronous calls, set pOverlapped to point to an OVERLAPPED structure, or for synchronous calls, set it to NULL.
%inst
The HttpReceiveClientCertificate function is used by a server
application to retrieve a client SSL certificate or channel binding
token (CBT).

[戻り値]
This doc was truncated.

[備考]
The behavior of the HttpReceiveClientCertificate function varies
based on whether a client SSL certificate or a channel binding token
is requested. In the case of a synchronous call to the
HttpReceiveClientCertificate function , the number of bytes received
is returned in the value pointed to by the pBytesReceived parameter.
In the case of an asynchronous call to the
HttpReceiveClientCertificate function, the number of bytes received
is returned by the standard mechanisms used for asynchronous calls.
The lpNumberOfBytesTransferred parameter returned by the
GetOverlappedResult function contains the number of bytes received.


%index
HttpReceiveHttpRequest
Retrieves the next available HTTP request from the specified request queue either synchronously or asynchronously.
%group
Win32 httpapi
%prm
RequestQueueHandle, RequestId, Flags, RequestBuffer, RequestBufferLength, BytesReturned, Overlapped
RequestQueueHandle : [intptr] A handle to the request queue from which to retrieve the next available request. A request queue is created and its handle returned by a call to the HttpCreateRequestQueue function. Windows Server?2003 with SP1 and Windows?XP with SP2:??The handle to the request queue is created by the HttpCreateHttpHandle function.
RequestId : [int64] On the first call to retrieve a request, this parameter should be HTTP_NULL_ID. Then, if more than one call is required to retrieve the entire request, HttpReceiveHttpRequest or HttpReceiveRequestEntityBody can be called with RequestID set to the value returned in the RequestId member of the HTTP_REQUEST structure pointed to by pRequestBuffer.
Flags : [int] 
RequestBuffer : [var] A pointer to a buffer into which the function copies an HTTP_REQUEST structure and entity body for the HTTP request. HTTP_REQUEST.RequestId contains the identifier for this HTTP request, which the application can use in subsequent calls HttpReceiveRequestEntityBody, HttpSendHttpResponse, or HttpSendResponseEntityBody.
RequestBufferLength : [int] Size, in bytes, of the  pRequestBuffer buffer.
BytesReturned : [var] Optional. A pointer to a variable that receives the size, in bytes, of the entity body, or of the remaining part of the entity body.
Overlapped : [var] For asynchronous calls, set pOverlapped to point to an OVERLAPPED structure; for synchronous calls, set it to NULL.
%inst
Retrieves the next available HTTP request from the specified request
queue either synchronously or asynchronously.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function is being used asynchronously, a return value of
ERROR_IO_PENDING indicates that the next request is not yet ready and
will be retrieved later through normal overlapped I/O completion
mechanisms. If the function fails, the return value is one of the
following error codes.
This doc was truncated.

[備考]
More than one call can be required to retrieve a given request. When
the Flags parameter is set to zero, for example,
HttpReceiveHttpRequest only copies the request header structure into
the buffer, and does not attempt to copy any of the entity body. In
this case, the HttpReceiveRequestEntityBody function can be used to
retrieve the entity body, or a second call can be made to
HttpReceiveHttpRequest. Alternatively, the buffer provided by the
application may be insufficiently large to receive all or part of the
request. To be sure of receiving at least part of the request, it is
recommended that an application provide at least a buffer of 4 KB,
which accommodates most HTTP requests. Alternately, authentication
headers, parsed as unknown headers, can add up to 12 KB to that, so
if authentication/authorization is used, a buffer size of at least 16
KB is recommended. If HttpReceiveHttpRequest returns ERROR_MORE_DATA,
the application continues to make additional calls, identifying the
request in each additional call by passing in the
HTTP_REQUEST.RequestId value returned by the first call until
ERROR_HANDLE_EOF is returned. Note The application must examine all
relevant request headers, including content-negotiation headers if
used, and fail the request as appropriate based on the header
content. HttpReceiveHttpRequest ensures only that the header line is
properly terminated and does not contain illegal characters.


%index
HttpReceiveRequestEntityBody
Receives additional entity body data for a specified HTTP request.
%group
Win32 httpapi
%prm
RequestQueueHandle, RequestId, Flags, EntityBuffer, EntityBufferLength, BytesReturned, Overlapped
RequestQueueHandle : [intptr] The handle to the request queue from which to retrieve the specified entity body data. A request queue is created and its handle returned by a call to the HttpCreateRequestQueue function. Windows Server?2003 with SP1 and Windows?XP with SP2:??The handle to the request queue is created by the HttpCreateHttpHandle function.
RequestId : [int64] The identifier of the HTTP request that contains the retrieved entity body. This value is returned in the RequestId member of the HTTP_REQUEST structure by a call to the HttpReceiveHttpRequest function. This value cannot be HTTP_NULL_ID.
Flags : [int] This parameter can be the following flag value. Windows Server?2003 with SP1 and Windows?XP with SP2:??This parameter is reserved and must be zero.
EntityBuffer : [intptr] A pointer to a buffer that receives entity-body data.
EntityBufferLength : [int] The size, in bytes, of the buffer pointed to by the pBuffer parameter.
BytesReturned : [var] Optional. A pointer to a variables that receives the size, in bytes, of the entity body data returned in the pBuffer buffer.
Overlapped : [var] For asynchronous calls, set pOverlapped to point to an OVERLAPPED structure; for synchronous calls, set it to NULL.
%inst
Receives additional entity body data for a specified HTTP request.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function is used asynchronously, a return value of ERROR_IO_PENDING
indicates that the next request is not yet ready and is retrieved
later through normal overlapped I/O completion mechanisms. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
To retrieve an entire entity body, an application is expected to call
HttpReceiveRequestEntityBody, passing in new buffers, until the
function returns ERROR_HANDLE_EOF. As long as a buffer full of
entity-body data is copied successfully and there is still more
entity-body data waiting to be retrieved, the function returns
NO_ERROR.


%index
HttpRemoveUrl
Causes the system to stop routing requests that match a specified UrlPrefix string to a specified request queue.
%group
Win32 httpapi
%prm
RequestQueueHandle, FullyQualifiedUrl
RequestQueueHandle : [intptr] The handle to the request queue from which the URL registration is to be removed. A request queue is created and its handle returned by a call to the HttpCreateRequestQueue function. Windows Server?2003 with SP1 and Windows?XP with SP2:??The handle to the request queue is created by the HttpCreateHttpHandle function.
FullyQualifiedUrl : [wstr] A pointer to a UrlPrefix string  registered to the specified request queue. This string must be identical to the one passed to HttpAddUrl to register the UrlPrefix; even a nomenclature change in an IPv6 address is not accepted.
%inst
Causes the system to stop routing requests that match a specified
UrlPrefix string to a specified request queue.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.


%index
HttpRemoveUrlFromUrlGroup
Removes the specified URL from the group identified by the URL Group ID.
%group
Win32 httpapi
%prm
UrlGroupId, pFullyQualifiedUrl, Flags
UrlGroupId : [int64] The ID of the URL group from which the URL specified in pFullyQualifiedUrl is removed.
pFullyQualifiedUrl : [wstr] A pointer to a Unicode string that contains a properly formed UrlPrefix String that identifies the URL to be removed. When HTTP_URL_FLAG_REMOVE_ALL is passed in the Flags parameter, all of the existing URL registrations for the URL Group identified in UrlGroupId are removed from the group. In this case, pFullyQualifiedUrl must be NULL.
Flags : [int] The URL flags qualifying the URL that is removed. This  can be one of the following flags:
%inst
Removes the specified URL from the group identified by the URL Group
ID.

[戻り値]
If the function succeeds, it returns NO_ERROR. If the function fails,
it returns one of the following error codes.
This doc was truncated.

[備考]
The HTTP Server API supports existing applications using the version
1.0 URL registrations, however, new development with the HTTP Server
API should use HttpRemoveUrlFromUrlGroup; do not use HttpRemoveUrl.
Applications should remove the URL added to the group by
HttpAddUrlToUrlGroup, when the URL is no longer required.


%index
HttpSendHttpResponse
Sends an HTTP response to the specified HTTP request.
%group
Win32 httpapi
%prm
RequestQueueHandle, RequestId, Flags, HttpResponse, CachePolicy, BytesSent, Reserved1, Reserved2, Overlapped, LogData
RequestQueueHandle : [intptr] A handle to the request queue from which the specified request was retrieved. A request queue is created and its handle returned by a call to the HttpCreateRequestQueue function. Windows Server?2003 with SP1 and Windows?XP with SP2:??The handle to the request queue is created by the HttpCreateHttpHandle function.
RequestId : [int64] An identifier of the HTTP request to which this response corresponds. This value is returned in the RequestId member of the HTTP_REQUEST structure by a call to the HttpReceiveHttpRequest function. This value cannot be HTTP_NULL_ID.
Flags : [int] This parameter can be a combination of some of the following flag values.  Those that are mutually exclusive are marked accordingly.
HttpResponse : [var] A pointer to an HTTP_RESPONSE structure that defines the HTTP response.
CachePolicy : [var] A pointer to the HTTP_CACHE_POLICY structure used to cache the response. Windows Server?2003 with SP1 and Windows?XP with SP2:??This parameter is reserved and must be NULL.
BytesSent : [var] Optional. A pointer to a variable that receives the number, in bytes, sent if the function operates synchronously. When making an asynchronous call using pOverlapped, set pBytesSent to NULL. Otherwise, when pOverlapped is set to NULL, pBytesSent must contain a valid memory address and not be set to NULL.
Reserved1 : [intptr] This parameter is reserved and must be NULL.
Reserved2 : [int] This parameter is reserved and must be zero.
Overlapped : [var] For asynchronous calls, set pOverlapped to point to an OVERLAPPED structure; for synchronous calls, set  to NULL. A synchronous call blocks until all response data specified in the pHttpResponse parameter is sent, whereas an asynchronous call immediately returns ERROR_IO_PENDING and the calling application then uses GetOverlappedResult or I/O completion ports to determine when the operation is completed. For more information about using OVERLAPPED structures for synchronization, see Synchronization and Overlapped Input and Output.
LogData : [var] A pointer to the  HTTP_LOG_DATA structure used to log the response. Pass a pointer to the HTTP_LOG_FIELDS_DATA structure and cast it to PHTTP_LOG_DATA. Be aware that even when logging is enabled on a URL Group, or server session, the response will not be logged unless the application supplies the log fields data structure. Windows Server?2003 and Windows?XP with SP2:??This parameter is reserved and must be NULL. Windows?Vista and Windows Server?2008:??This parameter is new for Windows?Vista, and Windows Server?2008
%inst
Sends an HTTP response to the specified HTTP request.

[戻り値]
If the function succeeds, the function returns NO_ERROR. If the
function is used asynchronously, a return value of ERROR_IO_PENDING
indicates that the next request is not yet ready and is retrieved
later through normal overlapped I/O completion mechanisms. If the
function fails, it returns one of the following error codes.
This doc was truncated.

[備考]
The HttpSendHttpResponse function is used to create and send a
response header, and the HttpSendResponseEntityBody function can be
used to send entity-body data as required. If neither a
content-length header nor a transfer-encoding header is included with
the response, the application must indicate the end of the response
by explicitly closing the connection by using the
HTTP_SEND_RESPONSE_DISCONNECT flag. If an application specifies a
"Server:" header in a response, using the HttpHeaderServer identifier
in the HTTP_KNOWN_HEADER structure, that specified value is placed as
the first part of the header, followed by a space and then
"Microsoft-HTTPAPI/1.0". If no server header is specified,
HttpSendHttpResponse supplies "Microsoft-HTTPAPI/1.0" as the server
header. Note The HttpSendHttpResponse and HttpSendResponseEntityBody
function must not be called simultaneously from different threads on
the same RequestId.


%index
HttpSendResponseEntityBody
Sends entity-body data associated with an HTTP response.
%group
Win32 httpapi
%prm
RequestQueueHandle, RequestId, Flags, EntityChunkCount, EntityChunks, BytesSent, Reserved1, Reserved2, Overlapped, LogData
RequestQueueHandle : [intptr] A handle to the request queue from which the specified request was retrieved. A request queue is created and its handle returned by a call to the HttpCreateRequestQueue function. Windows Server?2003 with SP1 and Windows?XP with SP2:??The handle to the request queue is created by the HttpCreateHttpHandle function.
RequestId : [int64] An identifier of the HTTP request to which this response corresponds. This value is returned in the RequestId member of the HTTP_REQUEST structure by a call to the HttpReceiveHttpRequest function. It cannot be HTTP_NULL_ID.
Flags : [int] A parameter that can include  one of the following mutually exclusive flag values.
EntityChunkCount : [int] A number of structures in the array pointed to by pEntityChunks. This count cannot exceed 9999.
EntityChunks : [var] A pointer to an array of HTTP_DATA_CHUNK structures to be sent as entity-body data.
BytesSent : [var] Optional. A pointer to a variable that receives the number, in bytes, sent if the function operates synchronously. When making an asynchronous call using pOverlapped, set pBytesSent to NULL. Otherwise, when pOverlapped is set to NULL, pBytesSent must contain a valid memory address, and not be set to NULL.
Reserved1 : [intptr] This parameter is reserved and must be NULL.
Reserved2 : [int] This parameter is reserved and must be zero.
Overlapped : [var] For asynchronous calls, set pOverlapped to point to an OVERLAPPED structure; for synchronous calls, set it to NULL. A synchronous call blocks until all response data specified in the pEntityChunks parameter is sent, whereas an asynchronous call immediately returns ERROR_IO_PENDING and the calling application then uses GetOverlappedResult or?I/O completion ports to determine when the operation is completed. For more information about using OVERLAPPED structures for synchronization, see Synchronization and Overlapped Input and Output.
LogData : [var] A pointer to the HTTP_LOG_DATA structure used to log the response. Pass a pointer to the HTTP_LOG_FIELDS_DATA structure and cast it to PHTTP_LOG_DATA. Be aware that even when logging is enabled on a URL Group, or server session, the response will not be logged unless the application supplies the log fields data structure. Windows Server?2003 and Windows?XP with SP2:??This parameter is reserved and must be NULL. Windows?Vista and Windows Server?2008:??This parameter is new for Windows?Vista, and Windows Server?2008
%inst
Sends entity-body data associated with an HTTP response.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function is used asynchronously, a return value of ERROR_IO_PENDING
indicates that the next request is not yet ready and is retrieved
later through normal overlapped I/O completion mechanisms. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
If neither a Content-length header nor a Transfer-encoding header is
included in the response headers, the application must indicate the
end of the response by explicitly closing the connection using the
HTTP_SEND_RESPONSE_DISCONNECT flag. Note HttpSendResponseEntityBody
(or HttpSendHttpResponse) and HttpSendResponseEntityBody must not be
called simultaneously from different threads on the same RequestId.


%index
HttpSetRequestQueueProperty
Sets a new property or modifies an existing property on the request queue identified by the specified handle.
%group
Win32 httpapi
%prm
RequestQueueHandle, Property, PropertyInformation, PropertyInformationLength, Reserved1, Reserved2
RequestQueueHandle : [intptr] The handle to the request queue on which the property is set. A request queue is created and its handle returned by a call to the HttpCreateRequestQueue function.
Property : [int] A member of the  HTTP_SERVER_PROPERTY enumeration describing the property type that is set. This must be one of the following:
PropertyInformation : [intptr] A pointer to the buffer that contains the property information.
PropertyInformationLength : [int] The length, in bytes, of the buffer pointed to by the pPropertyInformation parameter.
Reserved1 : [int] Reserved. Must be zero.
Reserved2 : [intptr] Reserved. Must be NULL.
%inst
Sets a new property or modifies an existing property on the request
queue identified by the specified handle.

[戻り値]
If the function succeeds, it returns NO_ERROR. If the function fails,
it returns one of the following error codes.
This doc was truncated.


%index
HttpSetServerSessionProperty
Sets a new server session property or modifies an existing property on the specified server session.
%group
Win32 httpapi
%prm
ServerSessionId, Property, PropertyInformation, PropertyInformationLength
ServerSessionId : [int64] The server session for which the property is set.
Property : [int] A member of the  HTTP_SERVER_PROPERTY enumeration that describes the property type that is set. This can be one of the following.
PropertyInformation : [intptr] A pointer to the buffer that contains the property data.
PropertyInformationLength : [int] The length, in bytes, of the buffer pointed to by the pPropertyInformation parameter.
%inst
Sets a new server session property or modifies an existing property
on the specified server session.

[戻り値]
If the function succeeds, it returns NO_ERROR If the function fails,
it returns one of the following error codes.
This doc was truncated.

[備考]
Server sessions are top level configuration containers for
configuration data that applies to all of the URL groups created
under them. The server session is created with
HttpCreateServerSession. The pPropertyInformation parameter points to
the configuration structure for the property type that is set. The
PropertyInformationLength parameter specifies the size, in bytes, of
the configuration structure. For example, when setting the
HttpServerTimeoutsProperty the pPropertyInformation parameter must
point to a buffer that is at least equal to the size of the
HTTP_TIMEOUT_LIMIT_INFO structure.


%index
HttpSetServiceConfiguration
Creates and sets a configuration record for the HTTP Server API configuration store.
%group
Win32 httpapi
%prm
ServiceHandle, ConfigId, pConfigInformation, ConfigInformationLength, pOverlapped
ServiceHandle : [intptr] Reserved. Must be zero.
ConfigId : [int] 
pConfigInformation : [intptr] A pointer to a buffer that contains the appropriate data to specify the type of record to be set.
ConfigInformationLength : [int] Size, in bytes, of the pConfigInformation buffer.
pOverlapped : [var] This parameter is reserved and must be  NULL.
%inst
Creates and sets a configuration record for the HTTP Server API
configuration store.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The configuration parameters set with HttpSetServiceConfiguration are
applied to all the HTTP Server API applications on the machine, and
persist when the HTTP Server API shuts down, or when the computer is
restarted.


%index
HttpSetUrlGroupProperty
Sets a new property or modifies an existing property on the specified URL Group.
%group
Win32 httpapi
%prm
UrlGroupId, Property, PropertyInformation, PropertyInformationLength
UrlGroupId : [int64] The ID of the URL Group for which the property is set.
Property : [int] A member of the  HTTP_SERVER_PROPERTY enumeration that describes the property type that is modified or set. This can be one of the following:
PropertyInformation : [intptr] A pointer to the buffer that contains the property information.
PropertyInformationLength : [int] The length, in bytes, of the buffer pointed to by the pPropertyInformation parameter.
%inst
Sets a new property or modifies an existing property on the specified
URL Group.

[戻り値]
If the function succeeds, it returns NO_ERROR. If the function fails,
it returns one of the following error codes.
This doc was truncated.

[備考]
After the URL Group is created it must be associated with a request
queue to receive requests. To associate the URL Group with a request
queue, the application calls HttpSetUrlGroupProperty with the
HttpServerBindingProperty property. If this property is not set,
matching requests for the URL Group are not delivered to a request
queue and the HTTP Server API generates a 503 response.


%index
HttpShutdownRequestQueue
Stops queuing requests for the specified request queue process.
%group
Win32 httpapi
%prm
RequestQueueHandle
RequestQueueHandle : [intptr] The handle to the request queue that is shut down. A request queue is created and its handle returned by a call to the HttpCreateRequestQueue function.
%inst
Stops queuing requests for the specified request queue process.

[戻り値]
If the function succeeds, it returns NO_ERROR If the function fails,
it returns one of the following error codes.
This doc was truncated.

[備考]
HttpShutdownRequestQueue cancels outstanding requests and stops all
processing on the request queue process. The following steps are
performed when this function is called:
This doc was truncated.


%index
HttpTerminate
Cleans up resources used by the HTTP Server API to process calls by an application.
%group
Win32 httpapi
%prm
Flags, pReserved
Flags : [int] 
pReserved : [intptr] This parameter is reserved and must be NULL.
%inst
Cleans up resources used by the HTTP Server API to process calls by
an application.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
Every call to HttpInitialize should be matched by a corresponding
call to HttpTerminate. For example, if you call HttpInitialize with
HTTP_INITIALIZE_SERVER, you must call HttpTerminate with
HTTP_INITIALIZE_SERVER. If you call HttpInitialize twice, once with
HTTP_INITIALIZE_SERVER and the second time with
HTTP_INITIALIZE_CONFIG, you can call HttpTerminate one time with both
flags.


%index
HttpUpdateServiceConfiguration
Updates atomically a service configuration parameter that specifies a Transport Layer Security (TLS) certificate in a configuration record within the HTTP Server API configuration store.
%group
Win32 httpapi
%prm
Handle, ConfigId, ConfigInfo, ConfigInfoLength, Overlapped
Handle : [intptr] Reserved and must be  NULL.
ConfigId : [int] 
ConfigInfo : [intptr] A pointer to a buffer that contains the appropriate data to specify the type of record to update. The  following table shows the type of data the buffer contains for the different possible values of the ConfigId parameter.
ConfigInfoLength : [int] The size, in bytes, of the ConfigInfo buffer.
Overlapped : [var] Reserved and must be  NULL.
%inst
Updates atomically a service configuration parameter that specifies a
Transport Layer Security (TLS) certificate in a configuration record
within the HTTP Server API configuration store.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The configuration parameters that you update with
HttpUpdateServiceConfiguration are applied to all the HTTP Server API
applications on the machine, and persist when the HTTP Server API
shuts down, or when the computer is restarted.


%index
HttpWaitForDemandStart
Waits for the arrival of a new request that can be served by a new request queue process.
%group
Win32 httpapi
%prm
RequestQueueHandle, Overlapped
RequestQueueHandle : [intptr] A handle to the request queue on which demand start is registered. A request queue is created and its handle returned by a call to the HttpCreateRequestQueue function.
Overlapped : [var] For asynchronous calls, set pOverlapped to point to an OVERLAPPED structure; for synchronous calls, set it to NULL.
%inst
Waits for the arrival of a new request that can be served by a new
request queue process.

[戻り値]
If the function succeeds, it returns NO_ERROR. If the function fails,
it returns one of the following error codes.
This doc was truncated.

[備考]
Only the controller process can call HttpWaitForDemandStart to
register a demand start notification. The controller process is the
process that created the request queue and indicated that it is a
controller process by passing the
HTTP_CREATE_REQUEST_QUEUE_FLAG_CONTROLLER flag. If a process other
than the controlling process calls HttpWaitForDemandStart, the HTTP
Server API returns ERROR_INVALID_ID_AUTHORITY. HttpWaitForDemandStart
completes when a new request arrives for the specified request queue.
At this time, a controller process can use this API to start a new
worker process to server pending requests. Delayed start of the
worker process allows applications to avoid consuming resources until
they are required. The HTTP Server API allows only one outstanding
notification registered on a request queue at any time. The HTTP
Server API does not enforce limitations on the number of times that
HttpWaitForDemandStart can be called on the same request queue
consecutively. There is no limit on the number of outstanding
processes that are working on the same request queue. The HTTP Server
API supports canceling asynchronous HttpWaitForDemandStart calls.
Applications can use CancelIoEx with the overlapped structure
supplied in the pOverlapped parameter, to cancel an outstanding
HttpWaitForDemandStart call.


%index
HttpWaitForDisconnect
Notifies the application when the connection to an HTTP client is broken for any reason.
%group
Win32 httpapi
%prm
RequestQueueHandle, ConnectionId, Overlapped
RequestQueueHandle : [intptr] A handle to the request queue that handles requests from the specified connection. A request queue is created and its handle returned by a call to the HttpCreateRequestQueue function. Windows Server?2003 with SP1 and Windows?XP with SP2:??The handle to the request queue is created by the HttpCreateHttpHandle function.
ConnectionId : [int64] Identifier for the connection to the client computer. This value is returned in the ConnectionID member of the HTTP_REQUEST structure by a call to the HttpReceiveHttpRequest function.
Overlapped : [var] For asynchronous calls, set pOverlapped to point to an OVERLAPPED structure; for synchronous calls, set it to NULL.
%inst
Notifies the application when the connection to an HTTP client is
broken for any reason.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function is used asynchronously, a return value of ERROR_IO_PENDING
indicates that the next request is not yet ready and is retrieved
later through normal overlapped I/O completion mechanisms. If the
function fails, the return value is one of the following error codes.
This doc was truncated.


%index
HttpWaitForDisconnectEx
This function is an extension to HttpWaitForDisconnect.
%group
Win32 httpapi
%prm
RequestQueueHandle, ConnectionId, Reserved, Overlapped
RequestQueueHandle : [intptr] 
ConnectionId : [int64] 
Reserved : [int] 
Overlapped : [var] 
%inst
This function is an extension to HttpWaitForDisconnect.

