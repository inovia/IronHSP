; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    httpapi.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __httpapi_gen2_as__
#define global __httpapi_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "httpapi.dll"
; uint HttpAddFragmentToCache(winmdroot.Foundation.HANDLE RequestQueueHandle, winmdroot.Foundation.PCWSTR UrlPrefix, winmdroot.Networking.HttpServer.HTTP_DATA_CHUNK* DataChunk, winmdroot.Networking.HttpServer.HTTP_CACHE_POLICY* CachePolicy, [Optional] global::System.Threading.NativeOverlapped* Overlapped)
#cfunc global HttpAddFragmentToCache "HttpAddFragmentToCache" intptr, wstr, var, var, var

; uint HttpAddUrl(winmdroot.Foundation.HANDLE RequestQueueHandle, winmdroot.Foundation.PCWSTR FullyQualifiedUrl, [Optional] void* Reserved)
#cfunc global HttpAddUrl "HttpAddUrl" intptr, wstr, intptr

; uint HttpAddUrlToUrlGroup(ulong UrlGroupId, winmdroot.Foundation.PCWSTR pFullyQualifiedUrl, ulong UrlContext, uint Reserved)
#cfunc global HttpAddUrlToUrlGroup "HttpAddUrlToUrlGroup" int64, wstr, int64, int

; uint HttpCancelHttpRequest(winmdroot.Foundation.HANDLE RequestQueueHandle, ulong RequestId, [Optional] global::System.Threading.NativeOverlapped* Overlapped)
#cfunc global HttpCancelHttpRequest "HttpCancelHttpRequest" intptr, int64, var

; uint HttpCloseRequestQueue(winmdroot.Foundation.HANDLE RequestQueueHandle)
#cfunc global HttpCloseRequestQueue "HttpCloseRequestQueue" intptr

; uint HttpCloseServerSession(ulong ServerSessionId)
#cfunc global HttpCloseServerSession "HttpCloseServerSession" int64

; uint HttpCloseUrlGroup(ulong UrlGroupId)
#cfunc global HttpCloseUrlGroup "HttpCloseUrlGroup" int64

; uint HttpCreateHttpHandle(winmdroot.Foundation.HANDLE* RequestQueueHandle, uint Reserved)
#cfunc global HttpCreateHttpHandle "HttpCreateHttpHandle" intptr, int

; uint HttpCreateRequestQueue(winmdroot.Networking.HttpServer.HTTPAPI_VERSION Version, winmdroot.Foundation.PCWSTR Name, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* SecurityAttributes, uint Flags, winmdroot.Foundation.HANDLE* RequestQueueHandle)
#cfunc global HttpCreateRequestQueue "HttpCreateRequestQueue" var, wstr, var, int, intptr

; uint HttpCreateServerSession(winmdroot.Networking.HttpServer.HTTPAPI_VERSION Version, ulong* ServerSessionId, uint Reserved)
#cfunc global HttpCreateServerSession "HttpCreateServerSession" var, var, int

; uint HttpCreateUrlGroup(ulong ServerSessionId, ulong* pUrlGroupId, uint Reserved)
#cfunc global HttpCreateUrlGroup "HttpCreateUrlGroup" int64, var, int

; uint HttpDeclarePush(winmdroot.Foundation.HANDLE RequestQueueHandle, ulong RequestId, winmdroot.Networking.HttpServer.HTTP_VERB Verb, winmdroot.Foundation.PCWSTR Path, winmdroot.Foundation.PCSTR Query, [Optional] winmdroot.Networking.HttpServer.HTTP_REQUEST_HEADERS* Headers)
#cfunc global HttpDeclarePush "HttpDeclarePush" intptr, int64, int, wstr, str, var

; uint HttpDelegateRequestEx(winmdroot.Foundation.HANDLE RequestQueueHandle, winmdroot.Foundation.HANDLE DelegateQueueHandle, ulong RequestId, ulong DelegateUrlGroupId, uint PropertyInfoSetSize, winmdroot.Networking.HttpServer.HTTP_DELEGATE_REQUEST_PROPERTY_INFO* PropertyInfoSet)
#cfunc global HttpDelegateRequestEx "HttpDelegateRequestEx" intptr, intptr, int64, int64, int, var

; uint HttpDeleteServiceConfiguration(winmdroot.Foundation.HANDLE ServiceHandle, winmdroot.Networking.HttpServer.HTTP_SERVICE_CONFIG_ID ConfigId, void* pConfigInformation, uint ConfigInformationLength, [Optional] global::System.Threading.NativeOverlapped* pOverlapped)
#cfunc global HttpDeleteServiceConfiguration "HttpDeleteServiceConfiguration" intptr, int, intptr, int, var

; uint HttpFindUrlGroupId(winmdroot.Foundation.PCWSTR FullyQualifiedUrl, winmdroot.Foundation.HANDLE RequestQueueHandle, ulong* UrlGroupId)
#cfunc global HttpFindUrlGroupId "HttpFindUrlGroupId" wstr, intptr, var

; uint HttpFlushResponseCache(winmdroot.Foundation.HANDLE RequestQueueHandle, winmdroot.Foundation.PCWSTR UrlPrefix, uint Flags, [Optional] global::System.Threading.NativeOverlapped* Overlapped)
#cfunc global HttpFlushResponseCache "HttpFlushResponseCache" intptr, wstr, int, var

; uint HttpGetExtension(winmdroot.Networking.HttpServer.HTTPAPI_VERSION Version, uint Extension, void* Buffer, uint BufferSize)
#cfunc global HttpGetExtension "HttpGetExtension" var, int, intptr, int

; uint HttpInitialize(winmdroot.Networking.HttpServer.HTTPAPI_VERSION Version, winmdroot.Networking.HttpServer.HTTP_INITIALIZE Flags, [Optional] void* pReserved)
#cfunc global HttpInitialize "HttpInitialize" var, int, intptr

; winmdroot.Foundation.BOOL HttpIsFeatureSupported(winmdroot.Networking.HttpServer.HTTP_FEATURE_ID FeatureId)
#cfunc global HttpIsFeatureSupported "HttpIsFeatureSupported" int

; uint HttpPrepareUrl([Optional] void* Reserved, uint Flags, winmdroot.Foundation.PCWSTR Url, winmdroot.Foundation.PWSTR* PreparedUrl)
#cfunc global HttpPrepareUrl "HttpPrepareUrl" intptr, int, wstr, var

; uint HttpQueryRequestQueueProperty(winmdroot.Foundation.HANDLE RequestQueueHandle, winmdroot.Networking.HttpServer.HTTP_SERVER_PROPERTY Property, [Optional] void* PropertyInformation, uint PropertyInformationLength, uint Reserved1, [Optional] uint* ReturnLength, [Optional] void* Reserved2)
#cfunc global HttpQueryRequestQueueProperty "HttpQueryRequestQueueProperty" intptr, int, intptr, int, int, var, intptr

; uint HttpQueryServerSessionProperty(ulong ServerSessionId, winmdroot.Networking.HttpServer.HTTP_SERVER_PROPERTY Property, [Optional] void* PropertyInformation, uint PropertyInformationLength, [Optional] uint* ReturnLength)
#cfunc global HttpQueryServerSessionProperty "HttpQueryServerSessionProperty" int64, int, intptr, int, var

; uint HttpQueryServiceConfiguration(winmdroot.Foundation.HANDLE ServiceHandle, winmdroot.Networking.HttpServer.HTTP_SERVICE_CONFIG_ID ConfigId, [Optional] void* pInput, uint InputLength, [Optional] void* pOutput, uint OutputLength, [Optional] uint* pReturnLength, [Optional] global::System.Threading.NativeOverlapped* pOverlapped)
#cfunc global HttpQueryServiceConfiguration "HttpQueryServiceConfiguration" intptr, int, intptr, int, intptr, int, var, var

; uint HttpQueryUrlGroupProperty(ulong UrlGroupId, winmdroot.Networking.HttpServer.HTTP_SERVER_PROPERTY Property, [Optional] void* PropertyInformation, uint PropertyInformationLength, [Optional] uint* ReturnLength)
#cfunc global HttpQueryUrlGroupProperty "HttpQueryUrlGroupProperty" int64, int, intptr, int, var

; uint HttpReadFragmentFromCache(winmdroot.Foundation.HANDLE RequestQueueHandle, winmdroot.Foundation.PCWSTR UrlPrefix, [Optional] winmdroot.Networking.HttpServer.HTTP_BYTE_RANGE* ByteRange, void* Buffer, uint BufferLength, [Optional] uint* BytesRead, [Optional] global::System.Threading.NativeOverlapped* Overlapped)
#cfunc global HttpReadFragmentFromCache "HttpReadFragmentFromCache" intptr, wstr, var, intptr, int, var, var

; uint HttpReceiveClientCertificate(winmdroot.Foundation.HANDLE RequestQueueHandle, ulong ConnectionId, uint Flags, winmdroot.Networking.HttpServer.HTTP_SSL_CLIENT_CERT_INFO* SslClientCertInfo, uint SslClientCertInfoSize, [Optional] uint* BytesReceived, [Optional] global::System.Threading.NativeOverlapped* Overlapped)
#cfunc global HttpReceiveClientCertificate "HttpReceiveClientCertificate" intptr, int64, int, var, int, var, var

; uint HttpReceiveHttpRequest(winmdroot.Foundation.HANDLE RequestQueueHandle, ulong RequestId, winmdroot.Networking.HttpServer.HTTP_RECEIVE_HTTP_REQUEST_FLAGS Flags, winmdroot.Networking.HttpServer.HTTP_REQUEST_V2* RequestBuffer, uint RequestBufferLength, [Optional] uint* BytesReturned, [Optional] global::System.Threading.NativeOverlapped* Overlapped)
#cfunc global HttpReceiveHttpRequest "HttpReceiveHttpRequest" intptr, int64, int, var, int, var, var

; uint HttpReceiveRequestEntityBody(winmdroot.Foundation.HANDLE RequestQueueHandle, ulong RequestId, uint Flags, void* EntityBuffer, uint EntityBufferLength, [Optional] uint* BytesReturned, [Optional] global::System.Threading.NativeOverlapped* Overlapped)
#cfunc global HttpReceiveRequestEntityBody "HttpReceiveRequestEntityBody" intptr, int64, int, intptr, int, var, var

; uint HttpRemoveUrl(winmdroot.Foundation.HANDLE RequestQueueHandle, winmdroot.Foundation.PCWSTR FullyQualifiedUrl)
#cfunc global HttpRemoveUrl "HttpRemoveUrl" intptr, wstr

; uint HttpRemoveUrlFromUrlGroup(ulong UrlGroupId, winmdroot.Foundation.PCWSTR pFullyQualifiedUrl, uint Flags)
#cfunc global HttpRemoveUrlFromUrlGroup "HttpRemoveUrlFromUrlGroup" int64, wstr, int

; uint HttpSendHttpResponse(winmdroot.Foundation.HANDLE RequestQueueHandle, ulong RequestId, uint Flags, winmdroot.Networking.HttpServer.HTTP_RESPONSE_V2* HttpResponse, [Optional] winmdroot.Networking.HttpServer.HTTP_CACHE_POLICY* CachePolicy, [Optional] uint* BytesSent, [Optional] void* Reserved1, uint Reserved2, [Optional] global::System.Threading.NativeOverlapped* Overlapped, [Optional] winmdroot.Networking.HttpServer.HTTP_LOG_DATA* LogData)
#cfunc global HttpSendHttpResponse "HttpSendHttpResponse" intptr, int64, int, var, var, var, intptr, int, var, var

; uint HttpSendResponseEntityBody(winmdroot.Foundation.HANDLE RequestQueueHandle, ulong RequestId, uint Flags, ushort EntityChunkCount, [Optional] winmdroot.Networking.HttpServer.HTTP_DATA_CHUNK* EntityChunks, [Optional] uint* BytesSent, [Optional] void* Reserved1, uint Reserved2, [Optional] global::System.Threading.NativeOverlapped* Overlapped, [Optional] winmdroot.Networking.HttpServer.HTTP_LOG_DATA* LogData)
#cfunc global HttpSendResponseEntityBody "HttpSendResponseEntityBody" intptr, int64, int, int, var, var, intptr, int, var, var

; uint HttpSetRequestQueueProperty(winmdroot.Foundation.HANDLE RequestQueueHandle, winmdroot.Networking.HttpServer.HTTP_SERVER_PROPERTY Property, void* PropertyInformation, uint PropertyInformationLength, uint Reserved1, [Optional] void* Reserved2)
#cfunc global HttpSetRequestQueueProperty "HttpSetRequestQueueProperty" intptr, int, intptr, int, int, intptr

; uint HttpSetServerSessionProperty(ulong ServerSessionId, winmdroot.Networking.HttpServer.HTTP_SERVER_PROPERTY Property, void* PropertyInformation, uint PropertyInformationLength)
#cfunc global HttpSetServerSessionProperty "HttpSetServerSessionProperty" int64, int, intptr, int

; uint HttpSetServiceConfiguration(winmdroot.Foundation.HANDLE ServiceHandle, winmdroot.Networking.HttpServer.HTTP_SERVICE_CONFIG_ID ConfigId, void* pConfigInformation, uint ConfigInformationLength, [Optional] global::System.Threading.NativeOverlapped* pOverlapped)
#cfunc global HttpSetServiceConfiguration "HttpSetServiceConfiguration" intptr, int, intptr, int, var

; uint HttpSetUrlGroupProperty(ulong UrlGroupId, winmdroot.Networking.HttpServer.HTTP_SERVER_PROPERTY Property, void* PropertyInformation, uint PropertyInformationLength)
#cfunc global HttpSetUrlGroupProperty "HttpSetUrlGroupProperty" int64, int, intptr, int

; uint HttpShutdownRequestQueue(winmdroot.Foundation.HANDLE RequestQueueHandle)
#cfunc global HttpShutdownRequestQueue "HttpShutdownRequestQueue" intptr

; uint HttpTerminate(winmdroot.Networking.HttpServer.HTTP_INITIALIZE Flags, [Optional] void* pReserved)
#cfunc global HttpTerminate "HttpTerminate" int, intptr

; uint HttpUpdateServiceConfiguration(winmdroot.Foundation.HANDLE Handle, winmdroot.Networking.HttpServer.HTTP_SERVICE_CONFIG_ID ConfigId, void* ConfigInfo, uint ConfigInfoLength, [Optional] global::System.Threading.NativeOverlapped* Overlapped)
#cfunc global HttpUpdateServiceConfiguration "HttpUpdateServiceConfiguration" intptr, int, intptr, int, var

; uint HttpWaitForDemandStart(winmdroot.Foundation.HANDLE RequestQueueHandle, [Optional] global::System.Threading.NativeOverlapped* Overlapped)
#cfunc global HttpWaitForDemandStart "HttpWaitForDemandStart" intptr, var

; uint HttpWaitForDisconnect(winmdroot.Foundation.HANDLE RequestQueueHandle, ulong ConnectionId, [Optional] global::System.Threading.NativeOverlapped* Overlapped)
#cfunc global HttpWaitForDisconnect "HttpWaitForDisconnect" intptr, int64, var

; uint HttpWaitForDisconnectEx(winmdroot.Foundation.HANDLE RequestQueueHandle, ulong ConnectionId, uint Reserved, [Optional] global::System.Threading.NativeOverlapped* Overlapped)
#cfunc global HttpWaitForDisconnectEx "HttpWaitForDisconnectEx" intptr, int64, int, var

#endif
