; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    ws2_32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __ws2_32_gen2_as__
#define global __ws2_32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "ws2_32.dll"
; void FreeAddrInfoW([Optional] winmdroot.Networking.WinSock.ADDRINFOW* pAddrInfo)
#func global FreeAddrInfoW "FreeAddrInfoW" var

; void FreeAddrInfoEx([Optional] winmdroot.Networking.WinSock.ADDRINFOEXA* pAddrInfoEx)
#func global FreeAddrInfoEx "FreeAddrInfoEx" var

; int GetAddrInfoW(winmdroot.Foundation.PCWSTR pNodeName, winmdroot.Foundation.PCWSTR pServiceName, [Optional] winmdroot.Networking.WinSock.ADDRINFOW* pHints, winmdroot.Networking.WinSock.ADDRINFOW** ppResult)
#cfunc global GetAddrInfoW "GetAddrInfoW" wstr, wstr, var, var

; int GetAddrInfoExW(winmdroot.Foundation.PCWSTR pName, winmdroot.Foundation.PCWSTR pServiceName, uint dwNameSpace, [Optional] global::System.Guid* lpNspId, [Optional] winmdroot.Networking.WinSock.ADDRINFOEXW* hints, winmdroot.Networking.WinSock.ADDRINFOEXW** ppResult, [Optional] winmdroot.Networking.WinSock.TIMEVAL* timeout, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped, delegate *unmanaged[Stdcall]<uint,uint,global::System.Threading.NativeOverlapped*,void> lpCompletionRoutine, [Optional] winmdroot.Foundation.HANDLE* lpHandle)
#cfunc global GetAddrInfoExW "GetAddrInfoExW" wstr, wstr, int, var, var, var, var, var, int, intptr

; int GetAddrInfoExCancel(winmdroot.Foundation.HANDLE* lpHandle)
#cfunc global GetAddrInfoExCancel "GetAddrInfoExCancel" intptr

; int GetAddrInfoExOverlappedResult(global::System.Threading.NativeOverlapped* lpOverlapped)
#cfunc global GetAddrInfoExOverlappedResult "GetAddrInfoExOverlappedResult" var

; int GetHostName(winmdroot.Foundation.PWSTR name, int namelen)
#cfunc global GetHostNameW "GetHostNameW" wstr, int

; int GetNameInfoW(winmdroot.Networking.WinSock.SOCKADDR* pSockaddr, winmdroot.Networking.WinSock.socklen_t SockaddrLength, winmdroot.Foundation.PWSTR pNodeBuffer, uint NodeBufferSize, winmdroot.Foundation.PWSTR pServiceBuffer, uint ServiceBufferSize, int Flags)
#cfunc global GetNameInfoW "GetNameInfoW" var, int, wstr, int, wstr, int, int

; winmdroot.Foundation.PCWSTR InetNtopW(int Family, void* pAddr, winmdroot.Foundation.PWSTR pStringBuf, nuint StringBufSize)
#cfunc global InetNtopW "InetNtopW" int, intptr, wstr, int

; int InetPtonW(int Family, winmdroot.Foundation.PCWSTR pszAddrString, void* pAddrBuf)
#cfunc global InetPtonW "InetPtonW" int, wstr, intptr

; int SetAddrInfoExW(winmdroot.Foundation.PCWSTR pName, winmdroot.Foundation.PCWSTR pServiceName, [Optional] winmdroot.Networking.WinSock.SOCKET_ADDRESS* pAddresses, uint dwAddressCount, [Optional] winmdroot.System.Com.BLOB* lpBlob, uint dwFlags, uint dwNameSpace, [Optional] global::System.Guid* lpNspId, [Optional] winmdroot.Networking.WinSock.TIMEVAL* timeout, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped, delegate *unmanaged[Stdcall]<uint,uint,global::System.Threading.NativeOverlapped*,void> lpCompletionRoutine, [Optional] winmdroot.Foundation.HANDLE* lpNameHandle)
#cfunc global SetAddrInfoExW "SetAddrInfoExW" wstr, wstr, var, int, var, int, int, var, var, var, int, intptr

; int closesocket(winmdroot.Networking.WinSock.SOCKET s)
#cfunc global closesocket "closesocket" int

; int WPUCompleteOverlappedRequest(winmdroot.Networking.WinSock.SOCKET s, global::System.Threading.NativeOverlapped* lpOverlapped, uint dwError, uint cbTransferred, int* lpErrno)
#cfunc global WPUCompleteOverlappedRequest "WPUCompleteOverlappedRequest" int, var, int, int, var

; winmdroot.Networking.WinSock.SOCKET WSAAccept(winmdroot.Networking.WinSock.SOCKET s, [Optional] winmdroot.Networking.WinSock.SOCKADDR* addr, [Optional] int* addrlen, delegate *unmanaged[Stdcall]<global::Windows.Win32.Networking.WinSock.WSABUF*,global::Windows.Win32.Networking.WinSock.WSABUF*,global::Windows.Win32.Networking.WinSock.QOS*,global::Windows.Win32.Networking.WinSock.QOS*,global::Windows.Win32.Networking.WinSock.WSABUF*,global::Windows.Win32.Networking.WinSock.WSABUF*,uint*,nuint,int> lpfnCondition, nuint dwCallbackData)
#cfunc global WSAAccept "WSAAccept" int, var, var, int, int

; int WSAAddressToString(winmdroot.Networking.WinSock.SOCKADDR* lpsaAddress, uint dwAddressLength, [Optional] winmdroot.Networking.WinSock.WSAPROTOCOL_INFOW* lpProtocolInfo, winmdroot.Foundation.PWSTR lpszAddressString, uint* lpdwAddressStringLength)
#cfunc global WSAAddressToStringW "WSAAddressToStringW" var, int, var, wstr, var

; int WSAAdvertiseProvider(global::System.Guid* puuidProviderId, winmdroot.Networking.WinSock.NSPV2_ROUTINE* pNSPv2Routine)
#cfunc global WSAAdvertiseProvider "WSAAdvertiseProvider" var, var

; winmdroot.Foundation.HANDLE WSAAsyncGetHostByAddr(winmdroot.Foundation.HWND hWnd, uint wMsg, winmdroot.Foundation.PCSTR addr, int len, int type, winmdroot.Foundation.PSTR buf, int buflen)
#cfunc global WSAAsyncGetHostByAddr "WSAAsyncGetHostByAddr" intptr, int, str, int, int, str, int

; winmdroot.Foundation.HANDLE WSAAsyncGetHostByName(winmdroot.Foundation.HWND hWnd, uint wMsg, winmdroot.Foundation.PCSTR name, winmdroot.Foundation.PSTR buf, int buflen)
#cfunc global WSAAsyncGetHostByName "WSAAsyncGetHostByName" intptr, int, str, str, int

; winmdroot.Foundation.HANDLE WSAAsyncGetProtoByName(winmdroot.Foundation.HWND hWnd, uint wMsg, winmdroot.Foundation.PCSTR name, winmdroot.Foundation.PSTR buf, int buflen)
#cfunc global WSAAsyncGetProtoByName "WSAAsyncGetProtoByName" intptr, int, str, str, int

; winmdroot.Foundation.HANDLE WSAAsyncGetProtoByNumber(winmdroot.Foundation.HWND hWnd, uint wMsg, int number, winmdroot.Foundation.PSTR buf, int buflen)
#cfunc global WSAAsyncGetProtoByNumber "WSAAsyncGetProtoByNumber" intptr, int, int, str, int

; winmdroot.Foundation.HANDLE WSAAsyncGetServByName(winmdroot.Foundation.HWND hWnd, uint wMsg, winmdroot.Foundation.PCSTR name, winmdroot.Foundation.PCSTR proto, winmdroot.Foundation.PSTR buf, int buflen)
#cfunc global WSAAsyncGetServByName "WSAAsyncGetServByName" intptr, int, str, str, str, int

; winmdroot.Foundation.HANDLE WSAAsyncGetServByPort(winmdroot.Foundation.HWND hWnd, uint wMsg, int port, winmdroot.Foundation.PCSTR proto, winmdroot.Foundation.PSTR buf, int buflen)
#cfunc global WSAAsyncGetServByPort "WSAAsyncGetServByPort" intptr, int, int, str, str, int

; int WSAAsyncSelect(winmdroot.Networking.WinSock.SOCKET s, winmdroot.Foundation.HWND hWnd, uint wMsg, int lEvent)
#cfunc global WSAAsyncSelect "WSAAsyncSelect" int, intptr, int, int

; int WSACancelAsyncRequest(winmdroot.Foundation.HANDLE hAsyncTaskHandle)
#cfunc global WSACancelAsyncRequest "WSACancelAsyncRequest" intptr

; int WSACancelBlockingCall()
#cfunc global WSACancelBlockingCall "WSACancelBlockingCall"

; int WSACleanup()
#cfunc global WSACleanup "WSACleanup"

; winmdroot.Foundation.BOOL WSACloseEvent(winmdroot.Networking.WinSock.WSAEVENT hEvent)
#cfunc global WSACloseEvent "WSACloseEvent" intptr

; int WSAConnect(winmdroot.Networking.WinSock.SOCKET s, winmdroot.Networking.WinSock.SOCKADDR* name, int namelen, [Optional] winmdroot.Networking.WinSock.WSABUF* lpCallerData, [Optional] winmdroot.Networking.WinSock.WSABUF* lpCalleeData, [Optional] winmdroot.Networking.WinSock.QOS* lpSQOS, [Optional] winmdroot.Networking.WinSock.QOS* lpGQOS)
#cfunc global WSAConnect "WSAConnect" int, var, int, var, var, var, var

; winmdroot.Foundation.BOOL WSAConnectByList(winmdroot.Networking.WinSock.SOCKET s, winmdroot.Networking.WinSock.SOCKET_ADDRESS_LIST* SocketAddress, [Optional] uint* LocalAddressLength, [Optional] winmdroot.Networking.WinSock.SOCKADDR* LocalAddress, [Optional] uint* RemoteAddressLength, [Optional] winmdroot.Networking.WinSock.SOCKADDR* RemoteAddress, [Optional] winmdroot.Networking.WinSock.TIMEVAL* timeout, [Optional] global::System.Threading.NativeOverlapped* Reserved)
#cfunc global WSAConnectByList "WSAConnectByList" int, var, var, var, var, var, var, var

; winmdroot.Foundation.BOOL WSAConnectByName(winmdroot.Networking.WinSock.SOCKET s, winmdroot.Foundation.PWSTR nodename, winmdroot.Foundation.PWSTR servicename, [Optional] uint* LocalAddressLength, [Optional] winmdroot.Networking.WinSock.SOCKADDR* LocalAddress, [Optional] uint* RemoteAddressLength, [Optional] winmdroot.Networking.WinSock.SOCKADDR* RemoteAddress, [Optional] winmdroot.Networking.WinSock.TIMEVAL* timeout, [Optional] global::System.Threading.NativeOverlapped* Reserved)
#cfunc global WSAConnectByNameW "WSAConnectByNameW" int, wstr, wstr, var, var, var, var, var, var

; winmdroot.Networking.WinSock.WSAEVENT WSACreateEvent()
#cfunc global WSACreateEvent "WSACreateEvent"

; int WSADuplicateSocket(winmdroot.Networking.WinSock.SOCKET s, uint dwProcessId, winmdroot.Networking.WinSock.WSAPROTOCOL_INFOW* lpProtocolInfo)
#cfunc global WSADuplicateSocketW "WSADuplicateSocketW" int, int, var

; int WSAEnumNameSpaceProviders(uint* lpdwBufferLength, winmdroot.Networking.WinSock.WSANAMESPACE_INFOW* lpnspBuffer)
#cfunc global WSAEnumNameSpaceProvidersW "WSAEnumNameSpaceProvidersW" var, var

; int WSAEnumNameSpaceProvidersEx(uint* lpdwBufferLength, winmdroot.Networking.WinSock.WSANAMESPACE_INFOEXW* lpnspBuffer)
#cfunc global WSAEnumNameSpaceProvidersExW "WSAEnumNameSpaceProvidersExW" var, var

; int WSAEnumNetworkEvents(winmdroot.Networking.WinSock.SOCKET s, winmdroot.Networking.WinSock.WSAEVENT hEventObject, winmdroot.Networking.WinSock.WSANETWORKEVENTS* lpNetworkEvents)
#cfunc global WSAEnumNetworkEvents "WSAEnumNetworkEvents" int, intptr, var

; int WSAEnumProtocols([Optional] int* lpiProtocols, [Optional] winmdroot.Networking.WinSock.WSAPROTOCOL_INFOW* lpProtocolBuffer, uint* lpdwBufferLength)
#cfunc global WSAEnumProtocolsW "WSAEnumProtocolsW" var, var, var

; int WSAEventSelect(winmdroot.Networking.WinSock.SOCKET s, winmdroot.Networking.WinSock.WSAEVENT hEventObject, int lNetworkEvents)
#cfunc global WSAEventSelect "WSAEventSelect" int, intptr, int

; winmdroot.Networking.WinSock.WSA_ERROR WSAGetLastError()
#cfunc global WSAGetLastError "WSAGetLastError"

; winmdroot.Foundation.BOOL WSAGetOverlappedResult(winmdroot.Networking.WinSock.SOCKET s, global::System.Threading.NativeOverlapped* lpOverlapped, uint* lpcbTransfer, winmdroot.Foundation.BOOL fWait, uint* lpdwFlags)
#cfunc global WSAGetOverlappedResult "WSAGetOverlappedResult" int, var, var, int, var

; winmdroot.Foundation.BOOL WSAGetQOSByName(winmdroot.Networking.WinSock.SOCKET s, winmdroot.Networking.WinSock.WSABUF* lpQOSName, winmdroot.Networking.WinSock.QOS* lpQOS)
#cfunc global WSAGetQOSByName "WSAGetQOSByName" int, var, var

; int WSAGetServiceClassInfo(global::System.Guid* lpProviderId, global::System.Guid* lpServiceClassId, uint* lpdwBufSize, winmdroot.Networking.WinSock.WSASERVICECLASSINFOW* lpServiceClassInfo)
#cfunc global WSAGetServiceClassInfoW "WSAGetServiceClassInfoW" var, var, var, var

; int WSAGetServiceClassNameByClassId(global::System.Guid* lpServiceClassId, winmdroot.Foundation.PWSTR lpszServiceClassName, uint* lpdwBufferLength)
#cfunc global WSAGetServiceClassNameByClassIdW "WSAGetServiceClassNameByClassIdW" var, wstr, var

; int WSAHtonl(winmdroot.Networking.WinSock.SOCKET s, uint hostlong, uint* lpnetlong)
#cfunc global WSAHtonl "WSAHtonl" int, int, var

; int WSAHtons(winmdroot.Networking.WinSock.SOCKET s, ushort hostshort, ushort* lpnetshort)
#cfunc global WSAHtons "WSAHtons" int, int, var

; int WSAInstallServiceClass(winmdroot.Networking.WinSock.WSASERVICECLASSINFOW* lpServiceClassInfo)
#cfunc global WSAInstallServiceClassW "WSAInstallServiceClassW" var

; int WSAIoctl(winmdroot.Networking.WinSock.SOCKET s, uint dwIoControlCode, [Optional] void* lpvInBuffer, uint cbInBuffer, [Optional] void* lpvOutBuffer, uint cbOutBuffer, uint* lpcbBytesReturned, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped, delegate *unmanaged[Stdcall]<uint,uint,global::System.Threading.NativeOverlapped*,uint,void> lpCompletionRoutine)
#cfunc global WSAIoctl "WSAIoctl" int, int, intptr, int, intptr, int, var, var, int

; winmdroot.Foundation.BOOL WSAIsBlocking()
#cfunc global WSAIsBlocking "WSAIsBlocking"

; winmdroot.Networking.WinSock.SOCKET WSAJoinLeaf(winmdroot.Networking.WinSock.SOCKET s, winmdroot.Networking.WinSock.SOCKADDR* name, int namelen, [Optional] winmdroot.Networking.WinSock.WSABUF* lpCallerData, [Optional] winmdroot.Networking.WinSock.WSABUF* lpCalleeData, [Optional] winmdroot.Networking.WinSock.QOS* lpSQOS, [Optional] winmdroot.Networking.WinSock.QOS* lpGQOS, uint dwFlags)
#cfunc global WSAJoinLeaf "WSAJoinLeaf" int, var, int, var, var, var, var, int

; int WSALookupServiceBegin(winmdroot.Networking.WinSock.WSAQUERYSETW* lpqsRestrictions, uint dwControlFlags, winmdroot.Foundation.HANDLE* lphLookup)
#cfunc global WSALookupServiceBeginW "WSALookupServiceBeginW" var, int, intptr

; int WSALookupServiceEnd(winmdroot.Foundation.HANDLE hLookup)
#cfunc global WSALookupServiceEnd "WSALookupServiceEnd" intptr

; int WSALookupServiceNext(winmdroot.Foundation.HANDLE hLookup, uint dwControlFlags, uint* lpdwBufferLength, [Optional] winmdroot.Networking.WinSock.WSAQUERYSETW* lpqsResults)
#cfunc global WSALookupServiceNextW "WSALookupServiceNextW" intptr, int, var, var

; int WSANSPIoctl(winmdroot.Foundation.HANDLE hLookup, uint dwControlCode, [Optional] void* lpvInBuffer, uint cbInBuffer, [Optional] void* lpvOutBuffer, uint cbOutBuffer, uint* lpcbBytesReturned, [Optional] winmdroot.Networking.WinSock.WSACOMPLETION* lpCompletion)
#cfunc global WSANSPIoctl "WSANSPIoctl" intptr, int, intptr, int, intptr, int, var, var

; int WSANtohl(winmdroot.Networking.WinSock.SOCKET s, uint netlong, uint* lphostlong)
#cfunc global WSANtohl "WSANtohl" int, int, var

; int WSANtohs(winmdroot.Networking.WinSock.SOCKET s, ushort netshort, ushort* lphostshort)
#cfunc global WSANtohs "WSANtohs" int, int, var

; int WSAPoll(winmdroot.Networking.WinSock.WSAPOLLFD* fdArray, uint fds, int timeout)
#cfunc global WSAPoll "WSAPoll" var, int, int

; int WSAProviderCompleteAsyncCall(winmdroot.Foundation.HANDLE hAsyncCall, int iRetCode)
#cfunc global WSAProviderCompleteAsyncCall "WSAProviderCompleteAsyncCall" intptr, int

; int WSAProviderConfigChange(winmdroot.Foundation.HANDLE* lpNotificationHandle, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped, delegate *unmanaged[Stdcall]<uint,uint,global::System.Threading.NativeOverlapped*,uint,void> lpCompletionRoutine)
#cfunc global WSAProviderConfigChange "WSAProviderConfigChange" intptr, var, int

; int WSARecv(winmdroot.Networking.WinSock.SOCKET s, winmdroot.Networking.WinSock.WSABUF* lpBuffers, uint dwBufferCount, [Optional] uint* lpNumberOfBytesRecvd, uint* lpFlags, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped, delegate *unmanaged[Stdcall]<uint,uint,global::System.Threading.NativeOverlapped*,uint,void> lpCompletionRoutine)
#cfunc global WSARecv "WSARecv" int, var, int, var, var, var, int

; int WSARecvDisconnect(winmdroot.Networking.WinSock.SOCKET s, [Optional] winmdroot.Networking.WinSock.WSABUF* lpInboundDisconnectData)
#cfunc global WSARecvDisconnect "WSARecvDisconnect" int, var

; int WSARecvFrom(winmdroot.Networking.WinSock.SOCKET s, winmdroot.Networking.WinSock.WSABUF* lpBuffers, uint dwBufferCount, [Optional] uint* lpNumberOfBytesRecvd, uint* lpFlags, [Optional] winmdroot.Networking.WinSock.SOCKADDR* lpFrom, [Optional] int* lpFromlen, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped, delegate *unmanaged[Stdcall]<uint,uint,global::System.Threading.NativeOverlapped*,uint,void> lpCompletionRoutine)
#cfunc global WSARecvFrom "WSARecvFrom" int, var, int, var, var, var, var, var, int

; int WSARemoveServiceClass(global::System.Guid* lpServiceClassId)
#cfunc global WSARemoveServiceClass "WSARemoveServiceClass" var

; winmdroot.Foundation.BOOL WSAResetEvent(winmdroot.Foundation.HANDLE hEvent)
#cfunc global WSAResetEvent "WSAResetEvent" intptr

; int WSASend(winmdroot.Networking.WinSock.SOCKET s, winmdroot.Networking.WinSock.WSABUF* lpBuffers, uint dwBufferCount, [Optional] uint* lpNumberOfBytesSent, uint dwFlags, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped, delegate *unmanaged[Stdcall]<uint,uint,global::System.Threading.NativeOverlapped*,uint,void> lpCompletionRoutine)
#cfunc global WSASend "WSASend" int, var, int, var, int, var, int

; int WSASendDisconnect(winmdroot.Networking.WinSock.SOCKET s, [Optional] winmdroot.Networking.WinSock.WSABUF* lpOutboundDisconnectData)
#cfunc global WSASendDisconnect "WSASendDisconnect" int, var

; int WSASendMsg(winmdroot.Networking.WinSock.SOCKET Handle, winmdroot.Networking.WinSock.WSAMSG* lpMsg, uint dwFlags, [Optional] uint* lpNumberOfBytesSent, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped, delegate *unmanaged[Stdcall]<uint,uint,global::System.Threading.NativeOverlapped*,uint,void> lpCompletionRoutine)
#cfunc global WSASendMsg "WSASendMsg" int, var, int, var, var, int

; int WSASendTo(winmdroot.Networking.WinSock.SOCKET s, winmdroot.Networking.WinSock.WSABUF* lpBuffers, uint dwBufferCount, [Optional] uint* lpNumberOfBytesSent, uint dwFlags, [Optional] winmdroot.Networking.WinSock.SOCKADDR* lpTo, int iTolen, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped, delegate *unmanaged[Stdcall]<uint,uint,global::System.Threading.NativeOverlapped*,uint,void> lpCompletionRoutine)
#cfunc global WSASendTo "WSASendTo" int, var, int, var, int, var, int, var, int

; winmdroot.Foundation.FARPROC WSASetBlockingHook(winmdroot.Foundation.FARPROC lpBlockFunc)
#cfunc global WSASetBlockingHook "WSASetBlockingHook" var

; winmdroot.Foundation.BOOL WSASetEvent(winmdroot.Foundation.HANDLE hEvent)
#cfunc global WSASetEvent "WSASetEvent" intptr

; void WSASetLastError(int iError)
#func global WSASetLastError "WSASetLastError" int

; int WSASetService(winmdroot.Networking.WinSock.WSAQUERYSETW* lpqsRegInfo, winmdroot.Networking.WinSock.WSAESETSERVICEOP essoperation, uint dwControlFlags)
#cfunc global WSASetServiceW "WSASetServiceW" var, int, int

; winmdroot.Networking.WinSock.SOCKET WSASocket(int af, int type, int protocol, [Optional] winmdroot.Networking.WinSock.WSAPROTOCOL_INFOW* lpProtocolInfo, uint g, uint dwFlags)
#cfunc global WSASocketW "WSASocketW" int, int, int, var, int, int

; int WSAStringToAddress(winmdroot.Foundation.PWSTR AddressString, int AddressFamily, [Optional] winmdroot.Networking.WinSock.WSAPROTOCOL_INFOW* lpProtocolInfo, winmdroot.Networking.WinSock.SOCKADDR* lpAddress, int* lpAddressLength)
#cfunc global WSAStringToAddressW "WSAStringToAddressW" wstr, int, var, var, var

; int WSAUnadvertiseProvider(global::System.Guid* puuidProviderId)
#cfunc global WSAUnadvertiseProvider "WSAUnadvertiseProvider" var

; int WSAUnhookBlockingHook()
#cfunc global WSAUnhookBlockingHook "WSAUnhookBlockingHook"

; winmdroot.Foundation.WAIT_EVENT WSAWaitForMultipleEvents(uint cEvents, winmdroot.Foundation.HANDLE* lphEvents, winmdroot.Foundation.BOOL fWaitAll, uint dwTimeout, winmdroot.Foundation.BOOL fAlertable)
#cfunc global WSAWaitForMultipleEvents "WSAWaitForMultipleEvents" int, intptr, int, int, int

; int WSCDeinstallProvider(global::System.Guid* lpProviderId, int* lpErrno)
#cfunc global WSCDeinstallProvider "WSCDeinstallProvider" var, var

; int WSCEnableNSProvider(global::System.Guid* lpProviderId, winmdroot.Foundation.BOOL fEnable)
#cfunc global WSCEnableNSProvider "WSCEnableNSProvider" var, int

; int WSCEnumProtocols([Optional] int* lpiProtocols, [Optional] winmdroot.Networking.WinSock.WSAPROTOCOL_INFOW* lpProtocolBuffer, uint* lpdwBufferLength, int* lpErrno)
#cfunc global WSCEnumProtocols "WSCEnumProtocols" var, var, var, var

; int WSCGetApplicationCategory(winmdroot.Foundation.PCWSTR Path, uint PathLength, winmdroot.Foundation.PCWSTR Extra, uint ExtraLength, uint* pPermittedLspCategories, int* lpErrno)
#cfunc global WSCGetApplicationCategory "WSCGetApplicationCategory" wstr, int, wstr, int, var, var

; int WSCGetProviderInfo(global::System.Guid* lpProviderId, winmdroot.Networking.WinSock.WSC_PROVIDER_INFO_TYPE InfoType, byte* Info, nuint* InfoSize, uint Flags, int* lpErrno)
#cfunc global WSCGetProviderInfo "WSCGetProviderInfo" var, int, var, var, int, var

; int WSCGetProviderPath(global::System.Guid* lpProviderId, winmdroot.Foundation.PWSTR lpszProviderDllPath, int* lpProviderDllPathLen, int* lpErrno)
#cfunc global WSCGetProviderPath "WSCGetProviderPath" var, wstr, var, var

; int WSCInstallNameSpace(winmdroot.Foundation.PWSTR lpszIdentifier, winmdroot.Foundation.PWSTR lpszPathName, uint dwNameSpace, uint dwVersion, global::System.Guid* lpProviderId)
#cfunc global WSCInstallNameSpace "WSCInstallNameSpace" wstr, wstr, int, int, var

; int WSCInstallNameSpaceEx(winmdroot.Foundation.PWSTR lpszIdentifier, winmdroot.Foundation.PWSTR lpszPathName, uint dwNameSpace, uint dwVersion, global::System.Guid* lpProviderId, winmdroot.System.Com.BLOB* lpProviderSpecific)
#cfunc global WSCInstallNameSpaceEx "WSCInstallNameSpaceEx" wstr, wstr, int, int, var, var

; int WSCInstallProvider(global::System.Guid* lpProviderId, winmdroot.Foundation.PCWSTR lpszProviderDllPath, winmdroot.Networking.WinSock.WSAPROTOCOL_INFOW* lpProtocolInfoList, uint dwNumberOfEntries, int* lpErrno)
#cfunc global WSCInstallProvider "WSCInstallProvider" var, wstr, var, int, var

; int WSCSetApplicationCategory(winmdroot.Foundation.PCWSTR Path, uint PathLength, winmdroot.Foundation.PCWSTR Extra, uint ExtraLength, uint PermittedLspCategories, [Optional] uint* pPrevPermLspCat, int* lpErrno)
#cfunc global WSCSetApplicationCategory "WSCSetApplicationCategory" wstr, int, wstr, int, int, var, var

; int WSCSetProviderInfo(global::System.Guid* lpProviderId, winmdroot.Networking.WinSock.WSC_PROVIDER_INFO_TYPE InfoType, byte* Info, nuint InfoSize, uint Flags, int* lpErrno)
#cfunc global WSCSetProviderInfo "WSCSetProviderInfo" var, int, var, int, int, var

; int WSCUnInstallNameSpace(global::System.Guid* lpProviderId)
#cfunc global WSCUnInstallNameSpace "WSCUnInstallNameSpace" var

; int WSCUpdateProvider(global::System.Guid* lpProviderId, winmdroot.Foundation.PCWSTR lpszProviderDllPath, winmdroot.Networking.WinSock.WSAPROTOCOL_INFOW* lpProtocolInfoList, uint dwNumberOfEntries, int* lpErrno)
#cfunc global WSCUpdateProvider "WSCUpdateProvider" var, wstr, var, int, var

; int WSCWriteNameSpaceOrder(global::System.Guid* lpProviderId, uint dwNumberOfEntries)
#cfunc global WSCWriteNameSpaceOrder "WSCWriteNameSpaceOrder" var, int

; int WSCWriteProviderOrder(uint* lpwdCatalogEntryId, uint dwNumberOfEntries)
#cfunc global WSCWriteProviderOrder "WSCWriteProviderOrder" var, int

#endif
