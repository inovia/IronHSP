; ============================================================
;   wlanapi.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
WFDCancelOpenSession
Indicates that the application wants to cancel a pending WFDStartOpenSession function that has not completed.
%group
Win32 wlanapi
%prm
hSessionHandle
hSessionHandle : [intptr] A session handle to a Wi-Fi Direct session to cancel. This is a session handle previously returned by the WFDStartOpenSession function.
%inst
Indicates that the application wants to cancel a pending
WFDStartOpenSession function that has not completed.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WFDCancelOpenSession function is part of Wi-Fi Direct, a new
feature in Windows 8 and Windows Server 2012. Wi-Fi Direct is based
on the development of the Wi-Fi Peer-to-Peer Technical Specification
v1.1 by the Wi-Fi Alliance (see Wi-Fi Alliance Published
Specifications). The goal of the Wi-Fi Peer-to-Peer Technical
Specification is to provide a solution for Wi-Fi device-to-device
connectivity without the need for either a Wireless Access Point
(wireless AP) to setup the connection or the use of the existing
Wi-Fi adhoc (IBSS) mechanism.
A call to the WFDCancelOpenSession function notifies the Wi-Fi Direct
service that the client requests a cancellation of this session. The
WFDCancelOpenSession function does not modify the expected
WFDStartOpenSession behavior. The callback function specified to the
WFDStartOpenSession function will still be called, and the
WFDStartOpenSession function may not be completed immediately. It is
the responsibility of the caller to pass the WFDCancelOpenSession
function a handle in the hSessionHandle parameter that was returned
from call to the WFDStartOpenSession function.


%index
WFDCloseHandle
Closes a handle to the Wi-Fi Direct service.
%group
Win32 wlanapi
%prm
hClientHandle
hClientHandle : [intptr] A client handle to the Wi-Fi Direct service. This handle was  obtained by a previous call to the WFDOpenHandle function.
%inst
Closes a handle to the Wi-Fi Direct service.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WFDCloseHandle function is part of Wi-Fi Direct, a new feature in
Windows 8 and Windows Server 2012. Wi-Fi Direct is based on the
development of the Wi-Fi Peer-to-Peer Technical Specification v1.1 by
the Wi-Fi Alliance (see Wi-Fi Alliance Published Specifications). The
goal of the Wi-Fi Peer-to-Peer Technical Specification is to provide
a solution for Wi-Fi device-to-device connectivity without the need
for either a Wireless Access Point (wireless AP) to setup the
connection or the use of the existing Wi-Fi adhoc (IBSS) mechanism.
In order to use Wi-Fi Direct, an application must first obtain a
handle to the Wi-Fi Direct service by calling the WFDOpenHandle
function. The Wi-Fi Direct (WFD) handle returned by the WFDOpenHandle
function is used for subsequent calls made to the Wi-Fi Direct
service. Once an application is done using the Wi-Fi Direct service,
the application should call the WFDCloseHandle function to signal to
the Wi-Fi Direct service that the application is done using the
service. This allows the Wi-Fi Direct service to release resources
used by the application.


%index
WFDCloseSession
Closes a session after a previously successful call to the WFDStartOpenSession function.
%group
Win32 wlanapi
%prm
hSessionHandle
hSessionHandle : [intptr] A session handle to a Wi-Fi Direct session. This is a session handle previously returned by the WFDStartOpenSession function.
%inst
Closes a session after a previously successful call to the
WFDStartOpenSession function.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WFDCloseSession function is part of Wi-Fi Direct, a new feature
in Windows 8 and Windows Server 2012. Wi-Fi Direct is based on the
development of the Wi-Fi Peer-to-Peer Technical Specification v1.1 by
the Wi-Fi Alliance (see Wi-Fi Alliance Published Specifications). The
goal of the Wi-Fi Peer-to-Peer Technical Specification is to provide
a solution for Wi-Fi device-to-device connectivity without the need
for either a Wireless Access Point (wireless AP) to setup the
connection or the use of the existing Wi-Fi adhoc (IBSS) mechanism.
The WFDCloseSession function queues a future work item to close the
session, so disconnection may not be immediate.
Calling the WFDCloseSession function while a WFDStartOpenSession call
is pending will not close the session.
It is the responsibility of the caller to pass the WFDCloseSession
function a handle in the hSessionHandle parameter that was returned
from a successful asynchronous call to the WFDStartOpenSession
function.
Calling the WFDCloseSession function with a handle that was valid and
has become invalid will yield undefined results.


%index
WFDOpenHandle
Opens a handle to the Wi-Fi Direct service and negotiates a version of the Wi-FI Direct API to use.
%group
Win32 wlanapi
%prm
dwClientVersion, pdwNegotiatedVersion, phClientHandle
dwClientVersion : [int] The highest version of the Wi-Fi Direct API the client supports. For Windows?8 and Windows Server?2012, this parameter should be set to WFD_API_VERSION, constant defined in the Wlanapi.h header file.
pdwNegotiatedVersion : [var] A pointer to a DWORD to received the negotiated version. If the WFDOpenHandle function is successful, the version negotiated with the Wi-Fi Direct Service to be used by this session is returned. This value is usually the highest version supported by both the client and Wi-Fi Direct service.
phClientHandle : [intptr] A pointer to a HANDLE to receive the handle to the Wi-Fi Direct service for this session. If the WFDOpenHandle function is successful, a handle to the Wi-Fi Direct service to use in this session is returned.
%inst
Opens a handle to the Wi-Fi Direct service and negotiates a version
of the Wi-FI Direct API to use.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WFDOpenHandle function is part of Wi-Fi Direct, a new feature in
Windows 8 and Windows Server 2012. Wi-Fi Direct is based on the
development of the Wi-Fi Peer-to-Peer Technical Specification v1.1 by
the Wi-Fi Alliance (see Wi-Fi Alliance Published Specifications). The
goal of the Wi-Fi Peer-to-Peer Technical Specification is to provide
a solution for Wi-Fi device-to-device connectivity without the need
for either a Wireless Access Point (wireless AP) to setup the
connection or the use of the existing Wi-Fi adhoc (IBSS) mechanism.
In order to use Wi-Fi Direct, an application must first obtain a
handle to the Wi-Fi Direct service by calling the WFDOpenHandle
function. The Wi-Fi Direct (WFD) handle returned by the WFDOpenHandle
function is used for subsequent calls made to the Wi-Fi Direct
service. Once an application is done using the Wi-Fi Direct service,
the application should call the WFDCloseHandle function to signal to
the Wi-Fi Direct service that the application is done using the
service. This allows the Wi-Fi Direct service to release resources
used by the application.


%index
WFDOpenLegacySession
Retrieves and applies a stored profile for a Wi-Fi Direct legacy device.
%group
Win32 wlanapi
%prm
hClientHandle, pLegacyMacAddress, phSessionHandle, pGuidSessionInterface
hClientHandle : [intptr] A HANDLE to the Wi-Fi Direct service for this session. This parameter is retrieved using the WFDOpenHandle function.
pLegacyMacAddress : [var] A pointer to Wi-Fi Direct device address of the legacy client device.
phSessionHandle : [intptr] A pointer to a HANDLE to receive the handle to the Wi-Fi Direct service for this session. If the WFDOpenLegacySession function is successful, a handle to the Wi-Fi Direct service to use in this session is returned.
pGuidSessionInterface : [var] A pointer to the GUID of the network interface for this session. If the WFDOpenLegacySession function is successful, a GUID of the network interface on which Wi-Fi Direct session is returned.
%inst
Retrieves and applies a stored profile for a Wi-Fi Direct legacy
device.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WFDOpenLegacySession function is part of Wi-Fi Direct, a new
feature in Windows 8 and Windows Server 2012. Wi-Fi Direct is based
on the development of the Wi-Fi Peer-to-Peer Technical Specification
v1.1 by the Wi-Fi Alliance (see Wi-Fi Alliance Published
Specifications). The goal of the Wi-Fi Peer-to-Peer Technical
Specification is to provide a solution for Wi-Fi device-to-device
connectivity without the need for either a Wireless Access Point
(wireless AP) to setup the connection or the use of the existing
Wi-Fi adhoc (IBSS) mechanism.
In order to use Wi-Fi Direct, an application must first obtain a
handle to the Wi-Fi Direct service by calling the
WFDOpenLegacySession or WFDOpenHandle function. The Wi-Fi Direct
(WFD) handle returned by the WFDOpenHandle function is used for
subsequent calls made to the Wi-Fi Direct service. The
WFDOpenLegacySession function is used to retrieve and apply a stored
profile for a Wi-Fi Direct legacy device. The WFDOpenLegacySession
function retrieves the stored legacy profile for device from the
profile store for the specified legacy device address. This device
address must be obtained from a Device Node created as a result of
the Inbox pairing experience (Legacy WPS Pairing). Once an
application is done using the Wi-Fi Direct service, the application
should call the WFDCloseSession function to close the session and
call the WFDCloseHandle function to signal to the Wi-Fi Direct
service that the application is done using the service. This allows
the Wi-Fi Direct service to release resources used by the
application.


%index
WFDStartOpenSession
Starts an on-demand connection to a specific Wi-Fi Direct device, which has been previously paired through the Windows Pairing experience.
%group
Win32 wlanapi
%prm
hClientHandle, pDeviceAddress, pvContext, pfnCallback, phSessionHandle
hClientHandle : [intptr] A client handle to the Wi-Fi Direct service. This handle was  obtained by a previous call to the WFDOpenHandle function.
pDeviceAddress : [var] A pointer to the target device’s Wi-Fi Direct device address. This is the MAC address of the target Wi-Fi device.
pvContext : [intptr] An optional context pointer which is passed to the callback function specified in the pfnCallback parameter.
pfnCallback : [int] A pointer to the callback function to be called once the WFDStartOpenSession request has completed.
phSessionHandle : [intptr] A handle to this specific Wi-Fi Direct session.
%inst
Starts an on-demand connection to a specific Wi-Fi Direct device,
which has been previously paired through the Windows Pairing
experience.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WFDStartOpenSession function is part of Wi-Fi Direct, a new
feature in Windows 8 and Windows Server 2012. Wi-Fi Direct is based
on the development of the Wi-Fi Peer-to-Peer Technical Specification
v1.1 by the Wi-Fi Alliance (see Wi-Fi Alliance Published
Specifications). The goal of the Wi-Fi Peer-to-Peer Technical
Specification is to provide a solution for Wi-Fi device-to-device
connectivity without the need for either a Wireless Access Point
(wireless AP) to setup the connection or the use of the existing
Wi-Fi adhoc (IBSS) mechanism.
The WFDStartOpenSession function starts an asynchronous operation to
start an on-demand connection to a specific Wi-Fi Direct device. The
target Wi-Fi device must previously have been paired through the
Windows Pairing experience. When the asynchronous operation
completes, the callback function specified in the pfnCallback
parameter is called. If the application attempts to close the handle
to the Wi-Fi Direct service by calling the WFDCloseHandle function
before the WFDStartOpenSession function completes asynchronously, the
WFDCloseHandle function will wait until the WFDStartOpenSession call
is completed.


%index
WFDUpdateDeviceVisibility
Updates device visibility for the Wi-Fi Direct device address for a given installed Wi-Fi Direct device node.
%group
Win32 wlanapi
%prm
pDeviceAddress
pDeviceAddress : [var] A pointer to the Wi-Fi Direct device address of the client device. This device address must be obtained from a Device Node created as a result of the Inbox pairing experience.
%inst
Updates device visibility for the Wi-Fi Direct device address for a
given installed Wi-Fi Direct device node.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WFDUpdateDeviceVisibility function is part of Wi-Fi Direct, a new
feature in Windows 8 and Windows Server 2012. Wi-Fi Direct is based
on the development of the Wi-Fi Peer-to-Peer Technical Specification
v1.1 by the Wi-Fi Alliance (see Wi-Fi Alliance Published
Specifications). The goal of the Wi-Fi Peer-to-Peer Technical
Specification is to provide a solution for Wi-Fi device-to-device
connectivity without the need for either a Wireless Access Point
(wireless AP) to setup the connection or the use of the existing
Wi-Fi adhoc (IBSS) mechanism.
The WFDUpdateDeviceVisibility function will perform a targeted Wi-Fi
Direct discovery, and will update the DEVPKEY_WiFiDirect_IsVisibile
property key on the device node for the given device.


%index
WlanAllocateMemory
Allocates memory.
%group
Win32 wlanapi
%prm
dwMemorySize
dwMemorySize : [int] Amount of  memory being requested, in bytes.
%inst
Allocates memory.

[戻り値]
If the call is successful, the function returns a pointer to the
allocated memory. If the memory could not be allocated for any reason
or if the dwMemorySize parameter is 0, the returned pointer is NULL.
An application can call GetLastError to obtain extended error
information.


%index
WlanCloseHandle
Closes a connection to the server.
%group
Win32 wlanapi
%prm
hClientHandle, pReserved
hClientHandle : [intptr] The client's session handle, which identifies the connection to be closed. This handle was  obtained by a previous call to the WlanOpenHandle function.
pReserved : [intptr] Reserved for future use.  Set this parameter to NULL.
%inst
Closes a connection to the server.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
After a connection has been closed, any attempted use of the closed
handle can cause unexpected errors. Upon closing, all outstanding
notifications are discarded. Do not call WlanCloseHandle from a
callback function. If the client is in the middle of a notification
callback when WlanCloseHandle is called, the function waits for the
callback to finish before returning a value. Calling this function
inside a callback function will result in the call never completing.
If both the callback function and the thread that closes the handle
try to acquire the same lock, a deadlock may occur. In addition, do
not call WlanCloseHandle from the DllMain function in an application
DLL. This could also cause a deadlock.


%index
WlanConnect
Attempts to connect to a specific network.
%group
Win32 wlanapi
%prm
hClientHandle, pInterfaceGuid, pConnectionParameters, pReserved
hClientHandle : [intptr] The client's session handle, returned by a previous call to the WlanOpenHandle function.
pInterfaceGuid : [var] The GUID of the interface to use for the connection.
pConnectionParameters : [var] Pointer to a WLAN_CONNECTION_PARAMETERS structure that specifies the connection type, mode, network profile, SSID that identifies the network, and other parameters. Windows?XP with SP3 and Wireless LAN API for Windows?XP with SP2:??There are some constraints on  the  WLAN_CONNECTION_PARAMETERS members. This means that structures that are valid for   Windows Server?2008 and Windows?Vista may not be valid for Windows?XP with SP3 or Wireless LAN API for Windows?XP with SP2. For a list of constraints, see WLAN_CONNECTION_PARAMETERS.
pReserved : [intptr] Reserved for future use.  Must be set to NULL.
%inst
Attempts to connect to a specific network.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WlanConnect function returns immediately. To be notified when a
connection is established or when no further connections will be
attempted, a client must register for notifications by calling
WlanRegisterNotification. The strProfile member of the
WLAN_CONNECTION_PARAMETERS structure pointed to by
pConnectionParameters specifies the profile to use for connection. If
this profile is an all-user profile, the WlanConnect caller must have
execute access on the profile. Otherwise, the WlanConnect call will
fail with return value ERROR_ACCESS_DENIED. The permissions on an
all-user profile are established when the profile is created or saved
using WlanSetProfile or WlanSaveTemporaryProfile. To perform a
connection operation at the command line, use the netsh wlan connect
command. For more information, see Netsh Commands for Wireless Local
Area Network (wlan). Windows XP with SP3 and Wireless LAN API for
Windows XP with SP2: You can only use WlanConnect to connect to
networks on the preferred network list. To add a network to the
preferred network list, call WlanSetProfile.


%index
WlanDeleteProfile
Deletes a wireless profile for a wireless interface on the local computer.
%group
Win32 wlanapi
%prm
hClientHandle, pInterfaceGuid, strProfileName, pReserved
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
pInterfaceGuid : [var] The GUID of the interface from which to delete the profile.
strProfileName : [wstr] The name of the profile to be deleted. Profile names are case-sensitive. This string must be NULL-terminated. Windows?XP with SP3 and Wireless LAN API for Windows?XP with SP2:??The supplied name must match the profile name derived automatically from the SSID of the network. For an infrastructure network profile, the SSID must be supplied for the profile name. For an ad hoc network profile, the supplied name must be the SSID of the ad hoc network followed by -adhoc.
pReserved : [intptr] Reserved for future use.  Must be set to NULL.
%inst
Deletes a wireless profile for a wireless interface on the local
computer.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WlanDeleteProfile function deletes a wireless profile for a
wireless interface on the local computer. All wireless LAN functions
require an interface GUID for the wireless interface when performing
profile operations. When a wireless interface is removed, its state
is cleared from Wireless LAN Service (WLANSVC) and no profile
operations are possible. The WlanDeleteProfile function can fail with
ERROR_INVALID_PARAMETER if the wireless interface specified in the
pInterfaceGuid parameter for the wireless LAN profile has been
removed from the system (a USB wireless adapter that has been
removed, for example). To delete a profile at the command line, use
the netsh wlan delete profile command. For more information, see
Netsh Commands for Wireless Local Area Network (wlan).


%index
WlanDeviceServiceCommand
Allows an OEM or IHV component to communicate with a device service on a particular wireless LAN interface.
%group
Win32 wlanapi
%prm
hClientHandle, pInterfaceGuid, pDeviceServiceGuid, dwOpCode, dwInBufferSize, pInBuffer, dwOutBufferSize, pOutBuffer, pdwBytesReturned
hClientHandle : [intptr] Type: **[HANDLE](/windows/win32/winprog/windows-data-types)** The client's session handle, obtained by a previous call to the [WlanOpenHandle](./nf-wlanapi-wlanopenhandle.md) function.
pInterfaceGuid : [var] Type: **CONST [GUID](../guiddef/ns-guiddef-guid.md)\*** A pointer to the **GUID** of the wireless LAN interface to be queried. You can determine the **GUID** of each wireless LAN interface enabled on a local computer by using the [WlanEnumInterfaces](./nf-wlanapi-wlanenuminterfaces.md) function.
pDeviceServiceGuid : [var] Type: **[GUID](../guiddef/ns-guiddef-guid.md)\*** The **GUID** identifying the device service for this command.
dwOpCode : [int] Type: **[DWORD](/windows/win32/winprog/windows-data-types)** The operational code identifying the operation to be performed on the device service.
dwInBufferSize : [int] Type: **[DWORD](/windows/win32/winprog/windows-data-types)** The size, in bytes, of the input buffer.
pInBuffer : [intptr] Type: **[PVOID](/windows/win32/winprog/windows-data-types)** A generic buffer for command input.
dwOutBufferSize : [int] Type: **[DWORD](/windows/win32/winprog/windows-data-types)** The size, in bytes, of the output buffer.
pOutBuffer : [intptr] Type: **[PVOID](/windows/win32/winprog/windows-data-types)** A generic buffer for command output.
pdwBytesReturned : [var] Type: **[PDWORD](/windows/win32/winprog/windows-data-types)** The number of bytes returned.
%inst
Allows an OEM or IHV component to communicate with a device service
on a particular wireless LAN interface.

[戻り値]
Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
If the function succeeds, the return value is **ERROR_SUCCESS**. If
the function fails with **ERROR_ACCESS_DENIED**, then the caller
doesn't have sufficient permissions to perform this operation. The
caller needs to either have admin privilege, or needs to be a UMDF
driver.


%index
WlanDisconnect
Disconnects an interface from its current network.
%group
Win32 wlanapi
%prm
hClientHandle, pInterfaceGuid, pReserved
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
pInterfaceGuid : [var] The GUID of the interface to be disconnected.
pReserved : [intptr] Reserved for future use.  Must be set to NULL.
%inst
Disconnects an interface from its current network.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
When the connection was established using WlanConnect, a profile was
specified by the strProfile member of the WLAN_CONNECTION_PARAMETERS
structure pointed to by pConnectionParameters. If that profile was an
all-user profile, the WlanDisconnect caller must have execute access
on the profile. Otherwise, the WlanDisconnect call will fail with
return value ERROR_ACCESS_DENIED. The permissions on an all-user
profile are established when the profile is created or saved using
WlanSetProfile or WlanSaveTemporaryProfile. To perform a
disconnection operation at the command line, use the netsh wlan
disconnect command. For more information, see Netsh Commands for
Wireless Local Area Network (wlan). Windows XP with SP3 and Wireless
LAN API for Windows XP with SP2: WlanDisconnect has the side effect
of modifying the profile associated with the disconnected network. A
network profile becomes an on-demand profile after a WlanDisconnect
call. The Wireless Zero Configuration service will not connect
automatically to a network with an on-demand profile when the network
is in range. Do not call WlanDisconnect before calling WlanConnect
unless you want to change a profile to an on-demand profile. When you
call WlanConnect to establish a network connection, any existing
network connection is dropped automatically.


%index
WlanEnumInterfaces
Enumerates all of the wireless LAN interfaces currently enabled on the local computer.
%group
Win32 wlanapi
%prm
hClientHandle, pReserved, ppInterfaceList
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
pReserved : [intptr] Reserved for future use. This parameter must be set to NULL.
ppInterfaceList : [var] A pointer to storage for a pointer to receive the returned list of wireless LAN interfaces in a WLAN_INTERFACE_INFO_LIST structure. The buffer for the WLAN_INTERFACE_INFO_LIST returned is allocated by the WlanEnumInterfaces function if the call succeeds.
%inst
Enumerates all of the wireless LAN interfaces currently enabled on
the local computer.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WlanEnumInterfaces function allocates memory for the list of
returned interfaces that is returned in the buffer pointed to by the
ppInterfaceList parameter when the function succeeds. The memory used
for the buffer pointed to by ppInterfaceList parameter should be
released by calling the WlanFreeMemory function after the buffer is
no longer needed.


%index
WlanExtractPsdIEDataList
Extracts the proximity service discovery (PSD) information element (IE) data list from raw IE data included in a beacon.
%group
Win32 wlanapi
%prm
hClientHandle, dwIeDataSize, pRawIeData, strFormat, pReserved, ppPsdIEDataList
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
dwIeDataSize : [int] The size, in bytes, of the pRawIeData parameter.
pRawIeData : [var] The raw IE data for all IEs in the list.
strFormat : [wstr] Describes the format of a PSD IE. Only IEs with a matching format are returned.
pReserved : [intptr] Reserved for future use.  Must be set to NULL.
ppPsdIEDataList : [var] A pointer to a PWLAN_RAW_DATA_LIST structure that contains the formatted data list.
%inst
Extracts the proximity service discovery (PSD) information element
(IE) data list from raw IE data included in a beacon.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
For more information about PSD IEs, including a discussion of the
format of an IE, see WlanSetPsdIEDataList.


%index
WlanFreeMemory
Frees memory.
%group
Win32 wlanapi
%prm
pMemory
pMemory : [intptr] Pointer to the memory to be freed.
%inst
Frees memory.

[備考]
If pMemory points to memory that has already been freed, an access
violation or heap corruption may occur. There is a hotfix available
for Wireless LAN API for Windows XP with Service Pack 2 (SP2) that
can help improve the performance of applications that call
WlanFreeMemory and WlanGetAvailableNetworkList many times.


%index
WlanGetAvailableNetworkList
Retrieves the list of available networks on a wireless LAN interface.
%group
Win32 wlanapi
%prm
hClientHandle, pInterfaceGuid, dwFlags, pReserved, ppAvailableNetworkList
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
pInterfaceGuid : [var] A pointer to the GUID of the wireless LAN interface to be queried. The GUID of each wireless LAN interface enabled on a local computer can be determined using the WlanEnumInterfaces function.
dwFlags : [int] A set of flags that control the type of networks returned in the list.  This parameter can be a combination of these possible values.
pReserved : [intptr] Reserved for future use.  This parameter must be set to NULL.
ppAvailableNetworkList : [var] A pointer to storage for a pointer to receive the returned list of visible networks in a WLAN_AVAILABLE_NETWORK_LIST structure. The buffer for the WLAN_AVAILABLE_NETWORK_LIST returned is allocated by the WlanGetAvailableNetworkList function if the call succeeds.
%inst
Retrieves the list of available networks on a wireless LAN interface.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WlanGetAvailableNetworkList function allocates memory for the
list of available networks returned in the buffer pointed to by the
ppAvailableNetworkList parameter when the function succeeds. The
memory used for the buffer pointed to by ppAvailableNetworkList
parameter should be released by calling the WlanFreeMemory function
after the buffer is no longer needed.
There is a hotfix available for Wireless LAN API for Windows XP with
SP2 that can help improve the performance of applications that call
WlanFreeMemory and WlanGetAvailableNetworkList many times.


%index
WlanGetAvailableNetworkList2
(no summary)
%group
Win32 wlanapi
%prm
hClientHandle, pInterfaceGuid, dwFlags, pReserved, ppAvailableNetworkList
hClientHandle : [intptr] 
pInterfaceGuid : [var] 
dwFlags : [int] 
pReserved : [intptr] 
ppAvailableNetworkList : [var] 
%inst



%index
WlanGetFilterList
Retrieves a group policy or user permission list.
%group
Win32 wlanapi
%prm
hClientHandle, wlanFilterListType, pReserved, ppNetworkList
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
wlanFilterListType : [int] A WLAN_FILTER_LIST_TYPE value that specifies the type of filter list.  All user defined and group policy filter lists can be queried.
pReserved : [intptr] Reserved for future use.  Must be set to NULL.
ppNetworkList : [var] Pointer to a DOT11_NETWORK_LIST structure that contains the list of permitted or denied networks.
%inst
Retrieves a group policy or user permission list.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
User permission lists can be set by calling WlanSetFilterList.


%index
WlanGetInterfaceCapability
Retrieves the capabilities of an interface.
%group
Win32 wlanapi
%prm
hClientHandle, pInterfaceGuid, pReserved, ppCapability
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
pInterfaceGuid : [var] The GUID of this interface.
pReserved : [intptr] Reserved for future use.  Must be set to NULL.
ppCapability : [var] A WLAN_INTERFACE_CAPABILITY structure that contains information about the capabilities of the specified interface.
%inst
Retrieves the capabilities of an interface.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The caller is responsible for calling the WlanFreeMemory function to
free the memory allocated to ppCapability.


%index
WlanGetNetworkBssList
Retrieves a list of the basic service set (BSS) entries of the wireless network or networks on a given wireless LAN interface.
%group
Win32 wlanapi
%prm
hClientHandle, pInterfaceGuid, pDot11Ssid, dot11BssType, bSecurityEnabled, pReserved, ppWlanBssList
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
pInterfaceGuid : [var] A pointer to the GUID of the wireless LAN interface to be queried. The GUID of each wireless LAN interface enabled on a local computer can be determined using the WlanEnumInterfaces function.
pDot11Ssid : [var] A pointer to a DOT11_SSID structure that specifies the SSID of the network from which the BSS list is requested.  This parameter is optional. When set to NULL, the returned list contains all of available BSS entries on a wireless LAN interface. If a pointer to a DOT11_SSID structure is specified, the SSID length specified in the uSSIDLength member of DOT11_SSID structure must be less than or equal to DOT11_SSID_MAX_LENGTH defined in the Wlantypes.h header file. In addition, the dot11BssType parameter must be set to either dot11_BSS_type_infrastructure or dot11_BSS_type_independent and the bSecurityEnabled parameter must be specified.
dot11BssType : [int] The BSS type of the network. This parameter is ignored if the SSID of the network for the BSS list is unspecified (the pDot11Ssid parameter is NULL).
bSecurityEnabled : [int] A value that indicates whether security is enabled on the network.  This parameter is only valid when the SSID of the network for the BSS list is specified (the pDot11Ssid parameter is not NULL).
pReserved : [intptr] Reserved for future use.  This parameter must be set to NULL.
ppWlanBssList : [var] A pointer to storage for a pointer to receive the returned list of of BSS entries in a WLAN_BSS_LIST structure. The buffer for the WLAN_BSS_LIST returned is allocated by the WlanGetNetworkBssList function if the call succeeds.
%inst
Retrieves a list of the basic service set (BSS) entries of the
wireless network or networks on a given wireless LAN interface.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WlanGetNetworkBssList function retrieves the basic service set
list for each wireless network or networks accessible on a given
interface. The list of information returned for each wireless network
also contains a list of information elements returned by each access
point for an infrastructure BSS network or a network peer for an
independent BSS network (ad hoc network). The information is returned
as a pointer to an WLAN_BSS_LIST structure in the ppWlanBssList
parameter. The WLAN_BSS_LIST structure contains an item count
followed by an array of WLAN_BSS_ENTRY structure entries. Since the
information returned by the WlanGetNetworkBssList function is sent by
an access point for an infrastructure BSS network or by a network
peer for an independent BSS network (ad hoc network), the information
returned should not be trusted. The ulIeOffset and ulIeSize members
in the WLAN_BSS_ENTRY structure should be used to determine the size
of the information element data blob in the WLAN_BSS_ENTRY structure,
not the data in the information element data blob itself. The
WlanGetNetworkBssList function does not validate that any information
returned in the information element data blob pointed to by the
ulIeOffset member is a valid information element as defined by the
IEEE 802.11 standards for wireless LANs. If the pDot11Ssid parameter
is specified (not NULL), then the dot11BssType parameter specified
must be set to either dot11_BSS_type_infrastructure for an
infrastructure BSS network or dot11_BSS_type_independent for an
independent BSS network (ad hoc network). If the dot11BssType
parameter is set to dot11_BSS_type_any, then the
WlanGetNetworkBssList function returns ERROR_SUCCESS but no BSS
entries will be returned. To return a list of all the infrastructure
BSS networks and independent BSS networks (ad hoc networks) on a
wireless LAN interface, set the pDot11Ssid parameter to NULL. When
the wireless LAN interface is also operating as a Wireless Hosted
Network , the BSS list will contain an entry for the BSS created for
the Wireless Hosted Network.
The WlanGetNetworkBssList function returns ERROR_SUCCESS when an
empty BSS list is returned by the WLAN AutoConfig Service. An
application that calls the WlanGetNetworkBssList function must check
that the dwNumberOfItems member of the WLAN_BSS_LIST pointed to by
the ppWlanBssList parameter is not zero before accessing the
wlanBssEntries[0] member in WLAN_BSS_LIST structure. The
WlanGetNetworkBssList function allocates memory for the basic service
set list that is returned in a buffer pointed to by the ppWlanBssList
parameter when the function succeeds. The memory used for the buffer
pointed to by ppWlanBssList parameter should be released by calling
the WlanFreeMemory function after the buffer is no longer needed.


%index
WlanGetProfile
Retrieves all information about a specified wireless profile.
%group
Win32 wlanapi
%prm
hClientHandle, pInterfaceGuid, strProfileName, pReserved, pstrProfileXml, pdwFlags, pdwGrantedAccess
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
pInterfaceGuid : [var] The GUID of the wireless interface. A list of the GUIDs for wireless interfaces on the local computer can be retrieved using the WlanEnumInterfaces function.
strProfileName : [wstr] The name of the profile. Profile names are case-sensitive. This string must be NULL-terminated. The maximum length of the profile name is 255 characters. This means that the maximum length of this string, including the NULL terminator, is 256 characters. Windows?XP with SP3 and Wireless LAN API for Windows?XP with SP2:??The name of the profile is derived automatically from the SSID of the network. For infrastructure network profiles, the name of the profile is the SSID of the network. For ad hoc network profiles, the name of the profile is the SSID of the ad hoc network followed by -adhoc.
pReserved : [intptr] Reserved for future use.  Must be set to NULL.
pstrProfileXml : [var] A string that is the XML representation of the queried profile. There is no predefined maximum string length.
pdwFlags : [var] On input, a pointer to the address location used to provide additional information about the request. If this parameter is NULL on input, then no information on profile flags will be returned. On output,  a pointer to the address location used to receive profile flags. Windows?XP with SP3 and Wireless LAN API for Windows?XP with SP2:??Per-user profiles are not supported. Set this parameter to NULL.
pdwGrantedAccess : [var] The access mask of the all-user profile.
%inst
Retrieves all information about a specified wireless profile.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
If the WlanGetProfile function succeeds, the wireless profile is
returned in the buffer pointed to by the pstrProfileXml parameter.
The buffer contains a string that is the XML representation of the
queried profile. For a description of the XML representation of the
wireless profile, see WLAN_profile Schema. The caller is responsible
for calling the WlanFreeMemory function to free the memory allocated
for the buffer pointer to by the pstrProfileXml parameter when the
buffer is no longer needed. If pstrProfileXml specifies an all-user
profile, the WlanGetProfile caller must have read access on the
profile. Otherwise, the WlanGetProfile call will fail with a return
value of ERROR_ACCESS_DENIED. The permissions on an all-user profile
are established when the profile is created or saved using
WlanSetProfile or WlanSaveTemporaryProfile. Windows 7: The
keyMaterial element returned in the profile schema pointed to by the
pstrProfileXml may be requested as plaintext if the WlanGetProfile
function is called with the WLAN_PROFILE_GET_PLAINTEXT_KEY flag set
in the value pointed to by the pdwFlags parameter on input. For a WEP
key, both 5 ASCII characters or 10 hexadecimal characters can be used
to set the plaintext key when the profile is created or updated.
However, a WEP profile will be saved with 10 hexadecimal characters
in the key no matter what the original input was used to create the
profile. So in the profile returned by the WlanGetProfile function,
the plaintext WEP key is always returned as 10 hexadecimal
characters.
For the WlanGetProfile call to return the plain text key, the
wlan_secure_get_plaintext_key permissions from the
WLAN_SECURABLE_OBJECT enumerated type must be set on the calling
thread. The DACL must also contain an ACE that grants
WLAN_READ_ACCESS permission to the access token of the calling
thread. By default, the permissions for retrieving the plain text key
is allowed only to the members of the Administrators group on a local
machine.
If the calling thread lacks the required permissions, the
WlanGetProfile function returns the encrypted key in the keyMaterial
element of the profile returned in the buffer pointed to by the
pstrProfileXml parameter. No error is returned if the calling thread
lacks the required permissions. By default, the keyMaterial element
returned in the profile pointed to by the pstrProfileXml is
encrypted. If your process runs in the context of the LocalSystem
account on the same computer, then you can unencrypt key material by
calling the CryptUnprotectData function.
Windows Server 2008 and Windows Vista: The keyMaterial element
returned in the profile schema pointed to by the pstrProfileXml is
always encrypted. If your process runs in the context of the
LocalSystem account, then you can unencrypt key material by calling
the CryptUnprotectData function. Windows XP with SP3 and Wireless LAN
API for Windows XP with SP2: The key material is never encrypted.


%index
WlanGetProfileCustomUserData
Gets the custom user data associated with a wireless profile.
%group
Win32 wlanapi
%prm
hClientHandle, pInterfaceGuid, strProfileName, pReserved, pdwDataSize, ppData
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
pInterfaceGuid : [var] A pointer to the GUID of the wireless LAN interface.
strProfileName : [wstr] The name of the profile with which the custom user data is associated. Profile names are case-sensitive. This string must be NULL-terminated.
pReserved : [intptr] Reserved for future use. Must be set to NULL.
pdwDataSize : [var] The size, in bytes,  of the user data buffer pointed to by the ppData parameter.
ppData : [var] A pointer to the user data.
%inst
Gets the custom user data associated with a wireless profile.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
For every wireless WLAN profile used by the Native Wifi AutoConfig
service, Windows maintains the concept of custom user data. This
custom user data is initially non-existent, but can be set by calling
the WlanSetProfileCustomUserData function. The custom user data gets
reset to empty any time the profile is modified by calling the
WlanSetProfile function. Once custom user data has been set, this
data can be accessed using the WlanGetProfileCustomUserData function.
The caller is responsible for freeing the memory allocated for the
buffer pointed to by the ppData parameter using the WlanFreeMemory
function.


%index
WlanGetProfileList
Retrieves the list of profiles.
%group
Win32 wlanapi
%prm
hClientHandle, pInterfaceGuid, pReserved, ppProfileList
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
pInterfaceGuid : [var] The GUID of the wireless interface. A list of the GUIDs for wireless interfaces on the local computer can be retrieved using the WlanEnumInterfaces function.
pReserved : [intptr] Reserved for future use.  Must be set to NULL.
ppProfileList : [var] A PWLAN_PROFILE_INFO_LIST structure that contains the list of profile information.
%inst
Retrieves the list of profiles.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WlanGetProfileList function returns only the basic information on
the wireless profiles on a wireless interface. The list of wireless
profiles on a wireless interface are retrieved in the preference
order. The WlanSetProfilePosition can be used to change the
preference order for the wireless profiles on a wireless interface.
More detailed information for a wireless profile on a wireless
interface can be retrieved by using the WlanGetProfile function. The
WlanGetProfileCustomUserData function can be used to retrieve custom
user data for a wireless profile on a wireless interface. A list of
the wireless interfaces and associated GUIDs on the local computer
can be retrieved using the WlanEnumInterfaces function. The
WlanGetProfileList function allocates memory for the list of profiles
returned in the buffer pointed to by the ppProfileList parameter. The
caller is responsible for freeing this memory using the
WlanFreeMemory function when this buffer is no longer needed. Windows
XP with SP3 and Wireless LAN API for Windows XP with SP2: Guest
profiles, profiles with Wireless Provisioning Service (WPS)
authentication, and profiles with Wi-Fi Protected Access-None
(WPA-None) authentication are not supported. These types of profiles
are not returned by WlanGetProfileList, even if a profile of this
type appears on the preferred profile list.


%index
WlanGetSecuritySettings
Gets the security settings associated with a configurable object.
%group
Win32 wlanapi
%prm
hClientHandle, SecurableObject, pValueType, pstrCurrentSDDL, pdwGrantedAccess
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
SecurableObject : [int] A WLAN_SECURABLE_OBJECT value that specifies the object to which the security settings apply.
pValueType : [var] A pointer to a WLAN_OPCODE_VALUE_TYPE value that specifies the source of the security settings.
pstrCurrentSDDL : [var] On input, this parameter must be NULL. On output, this parameter receives a pointer to the security descriptor string that specifies the security settings for the object if the function call succeeds. For more information about this string, see WlanSetSecuritySettings function.
pdwGrantedAccess : [var] The access mask of the object.
%inst
Gets the security settings associated with a configurable object.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The caller is responsible for freeing the memory allocated to the
security descriptor string pointed to by the pstrCurrentSDDL
parameter if the function succeeds. When no longer needed, the memory
for the security descriptor string should be freed by calling
WlanFreeMemory function and passing in the pstrCurrentSDDL parameter.


%index
WlanGetSupportedDeviceServices
Retrieves a list of the supported device services on a given wireless LAN interface.
%group
Win32 wlanapi
%prm
hClientHandle, pInterfaceGuid, ppDevSvcGuidList
hClientHandle : [intptr] Type: **[HANDLE](/windows/win32/winprog/windows-data-types)** The client's session handle, obtained by a previous call to the [WlanOpenHandle](./nf-wlanapi-wlanopenhandle.md) function.
pInterfaceGuid : [var] Type: **CONST [GUID](../guiddef/ns-guiddef-guid.md)\*** A pointer to the **GUID** of the wireless LAN interface to be queried. You can determine the **GUID** of each wireless LAN interface enabled on a local computer by using the [WlanEnumInterfaces](./nf-wlanapi-wlanenuminterfaces.md) function.
ppDevSvcGuidList : [var] Type: **[PWLAN_DEVICE_SERVICE_GUID_LIST](./ns-wlanapi-wlan_device_service_guid_list.md)\*** A pointer to storage for a pointer to receive the returned list of device service **GUID**s in a [WLAN_DEVICE_SERVICE_GUID_LIST](./ns-wlanapi-wlan_device_service_guid_list.md) structure. If the call succeeds, then the buffer for the **WLAN_DEVICE_SERVICE_GUID_LIST** returned is allocated by the **WlanGetSupportedDeviceServices** function.
%inst
Retrieves a list of the supported device services on a given wireless
LAN interface.

[戻り値]
Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
If the function succeeds, the return value is **ERROR_SUCCESS**. If
the function fails with **ERROR_ACCESS_DENIED**, then the caller
doesn't have sufficient permissions to perform this operation. The
caller needs to either have admin privilege, or needs to be a UMDF
driver.

[備考]
If the call succeeds, then the **WlanGetSupportedDeviceServices**
function allocates memory for the device services **GUID** list
that's returned in a buffer pointed to by the *ppDevSvcGuidList*
parameter. When you no longer need the buffer pointed to by
*ppDevSvcGuidList*, you should release the memory used for it by
calling the [WlanFreeMemory](./nf-wlanapi-wlanfreememory.md)
function.


%index
WlanHostedNetworkForceStart
Transitions the wireless Hosted Network to the wlan_hosted_network_active state without associating the request with the application's calling handle.
%group
Win32 wlanapi
%prm
hClientHandle, pFailReason, pvReserved
hClientHandle : [intptr] The client's session handle, returned by a previous call to the WlanOpenHandle function.
pFailReason : [var] An optional pointer to a value that receives the failure reason  if the call to the WlanHostedNetworkForceStart function fails. Possible values for the failure reason are from the WLAN_HOSTED_NETWORK_REASON enumeration type defined in the Wlanapi.h  header file.
pvReserved : [intptr] Reserved for future use. This parameter must be NULL.
%inst
Transitions the wireless Hosted Network to the
wlan_hosted_network_active state without associating the request with
the application's calling handle.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WlanHostedNetworkForceStart function is an extension to native
wireless APIs added to support the wireless Hosted Network on Windows
7 and on Windows Server 2008 R2 with the Wireless LAN Service
installed. A client application calls the WlanHostedNetworkForceStart
function to force the start of the wireless Hosted Network by
transitioning the wireless Hosted Network to the
wlan_hosted_network_active state without associating the request with
the application's calling handle. A successful call to the
WlanHostedNetworkForceStart function should eventually be matched by
a call to WlanHostedNetworkForceStop function. Any Hosted Network
state change caused by this function would not be automatically
undone if the calling application closes its calling handle (by
calling WlanCloseHandle with the hClientHandle parameter) or if the
process ends.
The cost of calling the WlanHostedNetworkForceStart function over
calling WlanHostedNetworkStartUsing is the associated privilege
required. An application might call the WlanHostedNetworkForceStart
function after ensuring that an elevated system user accepts the
increased power requirements involved in running the wireless Hosted
Network for extended durations. The WlanHostedNetworkForceStart
function could fail if Hosted Network state is
wlan_hosted_network_unavailable or the caller does not have
sufficient privileges.
This doc was truncated.


%index
WlanHostedNetworkForceStop
Transitions the wireless Hosted Network to the wlan_hosted_network_idle without associating the request with the application's calling handle.
%group
Win32 wlanapi
%prm
hClientHandle, pFailReason, pvReserved
hClientHandle : [intptr] The client's session handle, returned by a previous call to the WlanOpenHandle function.
pFailReason : [var] An optional pointer to a value that receives the failure reason,  if the call to the WlanHostedNetworkForceStop function fails. Possible values for the failure reason are from the WLAN_HOSTED_NETWORK_REASON enumeration type defined in the Wlanapi.h  header file.
pvReserved : [intptr] Reserved for future use. This parameter must be NULL.
%inst
Transitions the wireless Hosted Network to the
wlan_hosted_network_idle without associating the request with the
application's calling handle.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WlanHostedNetworkForceStop function is an extension to native
wireless APIs added to support the wireless Hosted Network on Windows
7 and on Windows Server 2008 R2 with the Wireless LAN Service
installed. A client application calls the WlanHostedNetworkForceStop
function to force the stop the Hosted Network and transition the
wireless Hosted Network to the wlan_hosted_network_idle without
associating the request with the application's calling handle. A
client typically calls the WlanHostedNetworkForceStop function to
match an earlier successful call to the WlanHostedNetworkForceStart
function. The WlanHostedNetworkForceStop function could fail if
Hosted Network state is not wlan_hosted_network_active. Any Hosted
Network state change caused by this function would not be
automatically undone if the calling application closes its calling
handle (by calling WlanCloseHandle with the hClientHandle parameter)
or if the process ends.
An application might call the WlanHostedNetworkForceStop function to
stop the Hosted Network after a previous call to the
WlanHostedNetworkForceStart by an elevated system user that accepted
the increased power requirements involved in running the wireless
Hosted Network for extended durations. Any user can call the
WlanHostedNetworkForceStop function to force the stop of the Hosted
Network. However, the ability to enable the wireless Hosted Network
may be restricted by group policy in a domain. On Windows 7 and
later, the operating system installs a virtual device if a Hosted
Network capable wireless adapter is present on the machine. This
virtual device normally shows up in the “Network Connections Folder”
as ‘Wireless Network Connection 2’ with a Device Name of ‘Microsoft
Virtual WiFi Miniport adapter’ if the computer has a single wireless
network adapter. This virtual device is used exclusively for
performing software access point (SoftAP) connections and is not
present in the list returned by the WlanEnumInterfaces function. The
lifetime of this virtual device is tied to the physical wireless
adapter. If the physical wireless adapter is disabled, this virtual
device will be removed as well. This feature is also available on
Windows Server 2008 R2 with the Wireless LAN Service installed.


%index
WlanHostedNetworkInitSettings
Configures and persists to storage the network connection settings (SSID and maximum number of peers, for example) on the wireless Hosted Network if these settings are not already configured.
%group
Win32 wlanapi
%prm
hClientHandle, pFailReason, pvReserved
hClientHandle : [intptr] The client's session handle, returned by a previous call to the WlanOpenHandle function.
pFailReason : [var] An optional pointer to a value that receives the failure reason  if the call to the WlanHostedNetworkInitSettings function fails. Possible values for the failure reason are from the WLAN_HOSTED_NETWORK_REASON enumeration type defined in the Wlanapi.h  header file.
pvReserved : [intptr] Reserved for future use. This parameter must be NULL.
%inst
Configures and persists to storage the network connection settings
(SSID and maximum number of peers, for example) on the wireless
Hosted Network if these settings are not already configured.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WlanHostedNetworkInitSettings function is an extension to native
wireless APIs added to support the wireless Hosted Network on Windows
7 and on Windows Server 2008 R2 with the Wireless LAN Service
installed. A client application calls the
WlanHostedNetworkInitSettings function to configure and persist to
storage the network connection settings (SSID and maximum number of
peers, for example) on the wireless Hosted Network, if the
connections settings are not already configured. If the network
settings on the wireless Hosted Network settings are already
configured (the WlanHostedNetworkQueryProperty function does not
return ERROR_BAD_CONFIGURATION for the station profile or connection
settings), then this function call returns ERROR_SUCCESS without
changing the configuration of the network connection settings. A
client application should always call the
WlanHostedNetworkInitSettings function before using other Hosted
Network features on the local computer. This function initializes
settings that are required when the wireless Hosted Network is used
for the first time on a local computer. The
WlanHostedNetworkInitSettings function does not change any
configuration if the configuration has already been persisted. So it
is safe to call the WlanHostedNetworkInitSettings function if the
configuration has already been persisted. It is recommended that
applications that use Hosted Network call the
WlanHostedNetworkInitSettings function before using other Hosted
Network functions.
The WlanHostedNetworkInitSettings function computes a random and
readable SSID from the host name and computes a random primary key.
This function also uses sets a value for the maximum number of peers
allowed that defaults to 100. If an application wants to use a
different SSID or a different maximum number of peers, then the
application should call the WlanHostedNetworkSetProperty function to
specifically set these properties used by the wireless Hosted
Network. Any Hosted Network state change caused by this function
would not be automatically undone if the calling application closes
its calling handle (by calling WlanCloseHandle with the hClientHandle
parameter) or if the process ends.
Any user can call the WlanHostedNetworkInitSettings function to
configure and persist to storage network connection settings on the
Hosted Network. If the wireless Hosted Network has already been
configured, this function does nothing and returns ERROR_SUCCESS. On
Windows 7 and later, the operating system installs a virtual device
if a Hosted Network capable wireless adapter is present on the
machine. This virtual device normally shows up in the “Network
Connections Folder” as ‘Wireless Network Connection 2’ with a Device
Name of ‘Microsoft Virtual WiFi Miniport adapter’ if the computer has
a single wireless network adapter. This virtual device is used
exclusively for performing software access point (SoftAP) connections
and is not present in the list returned by the WlanEnumInterfaces
function. The lifetime of this virtual device is tied to the physical
wireless adapter. If the physical wireless adapter is disabled, this
virtual device will be removed as well. This feature is also
available on Windows Server 2008 R2 with the Wireless LAN Service
installed.


%index
WlanHostedNetworkQueryProperty
Queries the current static properties of the wireless Hosted Network.
%group
Win32 wlanapi
%prm
hClientHandle, OpCode, pdwDataSize, ppvData, pWlanOpcodeValueType, pvReserved
hClientHandle : [intptr] The client's session handle, returned by a previous call to the WlanOpenHandle function.
OpCode : [int] The identifier for property to be queried. This identifier can be any of the values in the WLAN_HOSTED_NETWORK_OPCODE enumeration defined in the Wlanapi.h  header file.
pdwDataSize : [var] A pointer to a value that specifies the size, in bytes, of the buffer returned in the ppvData parameter, if the call to the WlanHostedNetworkQueryProperty function succeeds.
ppvData : [var] On input, this parameter must be NULL. On output, this parameter receives a pointer to a buffer returned with the static property requested,  if the call to the WlanHostedNetworkQueryProperty function succeeds.  The data type associated with this buffer depends upon the value of OpCode parameter.
pWlanOpcodeValueType : [var] A pointer to a value that receives the value type of the wireless Hosted Network property,  if the call to the WlanHostedNetworkQueryProperty function succeeds. The returned value is an enumerated type in the WLAN_OPCODE_VALUE_TYPE enumeration defined in the Wlanapi.h  header file.
pvReserved : [intptr] Reserved for future use. This parameter must be NULL.
%inst
Queries the current static properties of the wireless Hosted Network.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WlanHostedNetworkQueryProperty function is an extension to native
wireless APIs added to support the wireless Hosted Network on Windows
7 and on Windows Server 2008 R2 with the Wireless LAN Service
installed. A client application calls the
WlanHostedNetworkQueryProperty function to query the current static
properties of the wireless Hosted Network. This function does not
change the state or properties of the wireless Hosted Network. If the
function succeeds, the ppvData parameter points to a buffer that
contains the requested property. The size of this buffer is returned
in a pointer returned in the pwdDataSize parameter. The
WLAN_OPCODE_VALUE_TYPE is returned in a pointer returned in the
pWlanOpcodeValueType parameter. The memory used for the buffer in the
ppvData parameter that is returned should be released by calling the
WlanFreeMemory function after the buffer is no longer needed. The
data type associated with the buffer pointed to by the ppvData
parameter depends upon the value of OpCode parameter as follows:
This doc was truncated.


%index
WlanHostedNetworkQuerySecondaryKey
Queries the secondary security key that is configured to be used by the wireless Hosted Network.
%group
Win32 wlanapi
%prm
hClientHandle, pdwKeyLength, ppucKeyData, pbIsPassPhrase, pbPersistent, pFailReason, pvReserved
hClientHandle : [intptr] The client's session handle, returned by a previous call to the WlanOpenHandle function.
pdwKeyLength : [var] A pointer to a value that specifies number of valid data bytes in the key data array pointed to by the ppucKeyData parameter, if the call to the WlanHostedNetworkQuerySecondaryKey function succeeds. This key length includes the terminating ‘\0’ if the key is a passphrase.
ppucKeyData : [var] A pointer to a value that receives a pointer to the buffer returned with the secondary security key data,  if the call to the WlanHostedNetworkQuerySecondaryKey function succeeds.
pbIsPassPhrase : [var] A pointer to a Boolean value that indicates if the key data array pointed to by the ppucKeyData parameter is in passphrase format. If this parameter is TRUE, the key data array is in passphrase format. If this parameter is FALSE, the key data array is not in passphrase format.
pbPersistent : [var] A pointer to a Boolean value that indicates if the key data array pointed to by the ppucKeyData parameter is to be stored and reused later or is for one-time use only. If this parameter is TRUE, the key data array is to be stored and reused later. If this parameter is FALSE, the key data array is for one-time use only.
pFailReason : [var] An optional pointer to a value that receives the failure reason,  if the call to the WlanHostedNetworkSetSecondaryKey function fails. Possible values for the failure reason are from the WLAN_HOSTED_NETWORK_REASON enumeration type defined in the Wlanapi.h  header file.
pvReserved : [intptr] Reserved for future use. This parameter must be NULL.
%inst
Queries the secondary security key that is configured to be used by
the wireless Hosted Network.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WlanHostedNetworkQuerySecondaryKey function is an extension to
native wireless APIs added to support the wireless Hosted Network on
Windows 7 and on Windows Server 2008 R2 with the Wireless LAN Service
installed. A client application calls the
WlanHostedNetworkQuerySecondaryKey function to query the secondary
security key that will be used by the wireless Hosted Network. This
function will return the key information including key data, key
length, whether it is a passphrase, and whether it is persistent or
for one-time use. This function does not change the state or
properties of the wireless Hosted Network. The secondary security key
is a passphrase if the value pointed to by the pbIsPassPhrase
parameter is TRUE. The secondary security key is a binary key if the
value pointed to by the pbIsPassPhrase parameter is FALSE.
This doc was truncated.


%index
WlanHostedNetworkQueryStatus
Queries the current status of the wireless Hosted Network.
%group
Win32 wlanapi
%prm
hClientHandle, ppWlanHostedNetworkStatus, pvReserved
hClientHandle : [intptr] The client's session handle, returned by a previous call to the WlanOpenHandle function.
ppWlanHostedNetworkStatus : [var] On input, this parameter must be NULL. On output, this parameter receives a pointer to the current status of the wireless Hosted Network,  if the call to the WlanHostedNetworkQueryStatus function succeeds. The current status is returned in a WLAN_HOSTED_NETWORK_STATUS structure.
pvReserved : [intptr] Reserved for future use. This parameter must be NULL.
%inst
Queries the current status of the wireless Hosted Network.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WlanHostedNetworkQueryStatus function is an extension to native
wireless APIs added to support the wireless Hosted Network on Windows
7 and on Windows Server 2008 R2 with the Wireless LAN Service
installed. A client application calls the
WlanHostedNetworkQueryStatus function to query the current status of
the wireless Hosted Network. This function does not change the state
of the wireless Hosted Network. If the function succeeds, the
ppWlanHostedNetworkStatus parameter points to a
WLAN_HOSTED_NETWORK_STATUS structure with the current status. The
memory used for the WLAN_HOSTED_NETWORK_STATUS structure that is
returned should be freed after use by calling the WlanFreeMemory
function. Any user can call the WlanHostedNetworkQueryStatus function
to query the Hosted Network. However, the ability to enable the
wireless Hosted Network may be restricted by group policy in a
domain. On Windows 7 and later, the operating system installs a
virtual device if a Hosted Network capable wireless adapter is
present on the machine. This virtual device normally shows up in the
“Network Connections Folder” as ‘Wireless Network Connection 2’ with
a Device Name of ‘Microsoft Virtual WiFi Miniport adapter’ if the
computer has a single wireless network adapter. This virtual device
is used exclusively for performing software access point (SoftAP)
connections and is not present in the list returned by the
WlanEnumInterfaces function. The lifetime of this virtual device is
tied to the physical wireless adapter. If the physical wireless
adapter is disabled, this virtual device will be removed as well.
This feature is also available on Windows Server 2008 R2 with the
Wireless LAN Service installed.


%index
WlanHostedNetworkRefreshSecuritySettings
Refreshes the configurable and auto-generated parts of the wireless Hosted Network security settings.
%group
Win32 wlanapi
%prm
hClientHandle, pFailReason, pvReserved
hClientHandle : [intptr] The client's session handle, returned by a previous call to the WlanOpenHandle function.
pFailReason : [var] An optional pointer to a value that receives the failure reason,  if the call to the WlanHostedNetworkRefreshSecuritySettings function fails. Possible values for the failure reason are from the WLAN_HOSTED_NETWORK_REASON enumeration type defined in the Wlanapi.h  header file.
pvReserved : [intptr] Reserved for future use. This parameter must be NULL.
%inst
Refreshes the configurable and auto-generated parts of the wireless
Hosted Network security settings.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WlanHostedNetworkRefreshSecuritySettings function is an extension
to native wireless APIs added to support the wireless Hosted Network
on Windows 7 and on Windows Server 2008 R2 with the Wireless LAN
Service installed. A client application calls the
WlanHostedNetworkRefreshSecuritySettings function to force a refresh
of the configurable and auto-generated parts of the security settings
(the primary key) on the wireless Hosted Network. An application
might call the WlanHostedNetworkRefreshSecuritySettings function
after ensuring that the user accepts the impact of updating the
security settings. In order to succeed, this function must persist
the new settings which would require that Hosted Network state be
transitioned to wlan_hosted_network_idle if it was currently running
(wlan_hosted_network_active). Note Any network clients (PCs or
devices) on the wireless Hosted Network would have to be
re-configured after calling the
WlanHostedNetworkRefreshSecuritySettings function if their continued
usage is a goal. An application would typically call this function in
situations where the user feels that the security of the previous
primary key used for security by the wireless Hosted Network has been
violated. Note that the WlanHostedNetworkRefreshSecuritySettings
function does not change or reset the secondary key. Any Hosted
Network state change caused by this function would not be
automatically undone if the calling application closes its calling
handle (by calling WlanCloseHandle with the hClientHandle parameter)
or if the process ends.
Any user can call the WlanHostedNetworkRefreshSecuritySettings
function to refresh the security settings on the Hosted Network.
However, the ability to enable the wireless Hosted Network may be
restricted by group policy in a domain. On Windows 7 and later, the
operating system installs a virtual device if a Hosted Network
capable wireless adapter is present on the machine. This virtual
device normally shows up in the “Network Connections Folder” as
‘Wireless Network Connection 2’ with a Device Name of ‘Microsoft
Virtual WiFi Miniport adapter’ if the computer has a single wireless
network adapter. This virtual device is used exclusively for
performing software access point (SoftAP) connections and is not
present in the list returned by the WlanEnumInterfaces function. The
lifetime of this virtual device is tied to the physical wireless
adapter. If the physical wireless adapter is disabled, this virtual
device will be removed as well. This feature is also available on
Windows Server 2008 R2 with the Wireless LAN Service installed.


%index
WlanHostedNetworkSetProperty
Sets static properties of the wireless Hosted Network.
%group
Win32 wlanapi
%prm
hClientHandle, OpCode, dwDataSize, pvData, pFailReason, pvReserved
hClientHandle : [intptr] The client's session handle, returned by a previous call to the WlanOpenHandle function.
OpCode : [int] The identifier for the property to be set. This identifier can only be the following values in the WLAN_HOSTED_NETWORK_OPCODE enumeration defined in the Wlanapi.h  header file: * **wlan_hosted_network_opcode_connection_settings** The Hosted Network connection settings. * **wlan_hosted_network_opcode_enable** The Hosted Network enabled flag.
dwDataSize : [int] A value that specifies the size, in bytes, of the buffer pointed to by the pvData parameter.
pvData : [intptr] A pointer to a buffer with the static property to set.  The data type associated with this buffer depends upon the value of OpCode parameter.
pFailReason : [var] An optional pointer to a value that receives the failure reason,  if the call to the WlanHostedNetworkSetProperty function fails. Possible values for the failure reason are from the WLAN_HOSTED_NETWORK_REASON enumeration type defined in the Wlanapi.h  header file.
pvReserved : [intptr] Reserved for future use. This parameter must be NULL.
%inst
Sets static properties of the wireless Hosted Network.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WlanHostedNetworkSetProperty function is an extension to native
wireless APIs added to support the wireless Hosted Network on Windows
7 and on Windows Server 2008 R2 with the Wireless LAN Service
installed. A client application calls the
WlanHostedNetworkSetProperty function to set the current static
properties of the wireless Hosted Network. Any Hosted Network
property change caused by this function would not be automatically
undone if the calling application closes its calling handle (by
calling WlanCloseHandle with the hClientHandle parameter) or if the
process ends.
The data type associated with the buffer pointed to by the pvData
parameter depends upon the value of OpCode parameter as follows:
This doc was truncated.


%index
WlanHostedNetworkSetSecondaryKey
Configures the secondary security key that will be used by the wireless Hosted Network.
%group
Win32 wlanapi
%prm
hClientHandle, dwKeyLength, pucKeyData, bIsPassPhrase, bPersistent, pFailReason, pvReserved
hClientHandle : [intptr] The client's session handle, returned by a previous call to the WlanOpenHandle function.
dwKeyLength : [int] The number of valid data bytes in the key data array pointed to by the pucKeyData parameter. This key length should include the terminating ‘\0’ if the key is a passphrase.
pucKeyData : [var] A pointer to a buffer that contains the key data. The number of valid data bytes in the buffer must be at least the value specified in dwKeyLength parameter.
bIsPassPhrase : [int] A Boolean value that indicates if the key data array pointed to by the pucKeyData parameter is in passphrase format. If this parameter is TRUE, the key data array is in passphrase format. If this parameter is FALSE, the key data array is not in passphrase format.
bPersistent : [int] A Boolean value that indicates if the key data array pointed to by the pucKeyData parameter is to be stored and reused later or is for one-time use only. If this parameter is TRUE, the key data array is to be stored and reused later. If this parameter is FALSE, the key data array is to be used for one session (either the current session or the next session if the Hosted Network is not started).
pFailReason : [var] An optional pointer to a value that receives the failure reason,  if the call to the WlanHostedNetworkSetSecondaryKey function fails. Possible values for the failure reason are from the WLAN_HOSTED_NETWORK_REASON enumeration type defined in the Wlanapi.h  header file.
pvReserved : [intptr] Reserved for future use. This parameter must be NULL.
%inst
Configures the secondary security key that will be used by the
wireless Hosted Network.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WlanHostedNetworkSetSecondaryKey function is an extension to
native wireless APIs added to support the wireless Hosted Network on
Windows 7 and on Windows Server 2008 R2 with the Wireless LAN Service
installed. A client application calls the
WlanHostedNetworkSetSecondaryKey function to configure the secondary
security key that will be used by the wireless Hosted Network. Any
Hosted Network change caused by this function would not be
automatically undone if the calling application closes its calling
handle (by calling WlanCloseHandle with the hClientHandle parameter)
or if the process ends.
Once started, the wireless Hosted Network will allow wireless peers
to associate with this secondary security key in addition to the
primary security key. The secondary security key is always specified
by the user as needed, while the primary security key is generated by
the operating system with greater security strength.
This doc was truncated.


%index
WlanHostedNetworkStartUsing
Starts the wireless Hosted Network.
%group
Win32 wlanapi
%prm
hClientHandle, pFailReason, pvReserved
hClientHandle : [intptr] The client's session handle, returned by a previous call to the WlanOpenHandle function.
pFailReason : [var] An optional pointer to a value that receives the failure reason,  if the call to the WlanHostedNetworkStartUsing function fails. Possible values for the failure reason are from the WLAN_HOSTED_NETWORK_REASON enumeration type defined in the Wlanapi.h  header file.
pvReserved : [intptr] Reserved for future use. This parameter must be NULL.
%inst
Starts the wireless Hosted Network.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WlanHostedNetworkStartUsing function is an extension to native
wireless APIs added to support the wireless Hosted Network on Windows
7 and on Windows Server 2008 R2 with the Wireless LAN Service
installed. A client application calls the WlanHostedNetworkStartUsing
function to start the wireless Hosted Network. Successful calls must
be matched by calls to WlanHostedNetworkStopUsing function. This call
could fail if Hosted Network state is
wlan_hosted_network_unavailable. Any Hosted Network state change
caused by this function would be automatically undone if the calling
application closes its calling handle (by calling WlanCloseHandle
with the hClientHandle parameter) or if the process ends.
Any user can call the WlanHostedNetworkStartUsing function to start
the Hosted Network. However, the ability to enable the wireless
Hosted Network may be restricted by group policy in a domain. On
Windows 7 and later, the operating system installs a virtual device
if a Hosted Network capable wireless adapter is present on the
machine. This virtual device normally shows up in the “Network
Connections Folder” as ‘Wireless Network Connection 2’ with a Device
Name of ‘Microsoft Virtual WiFi Miniport adapter’ if the computer has
a single wireless network adapter. This virtual device is used
exclusively for performing software access point (SoftAP) connections
and is not present in the list returned by the WlanEnumInterfaces
function. The lifetime of this virtual device is tied to the physical
wireless adapter. If the physical wireless adapter is disabled, this
virtual device will be removed as well. This feature is also
available on Windows Server 2008 R2 with the Wireless LAN Service
installed.


%index
WlanHostedNetworkStopUsing
Stops the wireless Hosted Network.
%group
Win32 wlanapi
%prm
hClientHandle, pFailReason, pvReserved
hClientHandle : [intptr] The client's session handle, returned by a previous call to the WlanOpenHandle function.
pFailReason : [var] An optional pointer to a value that receives the failure reason  if the call to the WlanHostedNetworkStopUsing function fails. Possible values for the failure reason are from the WLAN_HOSTED_NETWORK_REASON enumeration type defined in the Wlanapi.h  header file.
pvReserved : [intptr] Reserved for future use. This parameter must be NULL.
%inst
Stops the wireless Hosted Network.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WlanHostedNetworkStopUsing function is an extension to native
wireless APIs added to support the wireless Hosted Network on Windows
7 and on Windows Server 2008 R2 with the Wireless LAN Service
installed. An application calls the WlanHostedNetworkStopUsing
function to stop the Hosted Network. A application calls the
WlanHostedNetworkStopUsing function to match earlier successful calls
to the WlanHostedNetworkStartUsing function. The wireless Hosted
Network will remain active until all applications have called the
WlanHostedNetworkStopUsing function or the WlanHostedNetworkForceStop
function is called to force a stop. When the wireless Hosted Network
has stopped, the state switches to wlan_hosted_network_idle. This
call could also fail if the Hosted Network state changed because of
external events (for example, if the miniport driver for the wireless
interface card becomes unavailable). Any user can call this function
to stop the Hosted Network. However, the ability to enable the
wireless Hosted Network may be restricted by group policy in a
domain. On Windows 7 and later, the operating system installs a
virtual device if a Hosted Network capable wireless adapter is
present on the machine. This virtual device normally shows up in the
“Network Connections Folder” as ‘Wireless Network Connection 2’ with
a Device Name of ‘Microsoft Virtual WiFi Miniport adapter’ if the
computer has a single wireless network adapter. This virtual device
is used exclusively for performing software access point (SoftAP)
connections and is not present in the list returned by the
WlanEnumInterfaces function. The lifetime of this virtual device is
tied to the physical wireless adapter. If the physical wireless
adapter is disabled, this virtual device will be removed as well.
This feature is also available on Windows Server 2008 R2 with the
Wireless LAN Service installed.


%index
WlanIhvControl
Provides a mechanism for independent hardware vendor (IHV) control of WLAN drivers or services.
%group
Win32 wlanapi
%prm
hClientHandle, pInterfaceGuid, Type, dwInBufferSize, pInBuffer, dwOutBufferSize, pOutBuffer, pdwBytesReturned
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
pInterfaceGuid : [var] The GUID of the interface.
Type : [int] A WLAN_IHV_CONTROL_TYPE structure that specifies the type of software bypassed by the IHV control function.
dwInBufferSize : [int] The size, in bytes, of the input buffer.
pInBuffer : [intptr] A generic buffer for driver or service interface input.
dwOutBufferSize : [int] The size, in bytes, of the output buffer.
pOutBuffer : [intptr] A generic buffer for driver or service interface output.
pdwBytesReturned : [var] The number of bytes returned.
%inst
Provides a mechanism for independent hardware vendor (IHV) control of
WLAN drivers or services.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.


%index
WlanOpenHandle
Opens a connection to the server.
%group
Win32 wlanapi
%prm
dwClientVersion, pReserved, pdwNegotiatedVersion, phClientHandle
dwClientVersion : [int] The highest version of the WLAN API that the client supports.
pReserved : [intptr] Reserved for future use.  Must be set to NULL.
pdwNegotiatedVersion : [var] The version of the WLAN API that will be used in this session.  This value is usually the highest version supported by both the client and server.
phClientHandle : [intptr] A handle for the client to use in this session.  This handle is used by other functions throughout the session.
%inst
Opens a connection to the server.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The version number specified by dwClientVersion and
pdwNegotiatedVersion is a composite version number made up of both
major and minor versions. The major version is specified by the
low-order word, and the minor version is specified by the high-order
word. The macros WLAN_API_VERSION_MAJOR(_v) and
WLAN_API_VERSION_MINOR(_v) return the major and minor version numbers
respectively. You can construct a version number using the macro
WLAN_API_MAKE_VERSION(_major, _minor). Windows XP with SP3 and
Wireless LAN API for Windows XP with SP2: WlanOpenHandle will return
an error message if the Wireless Zero Configuration (WZC) service has
not been started or if the WZC service is not responsive.


%index
WlanQueryAutoConfigParameter
Queries for the parameters of the auto configuration service.
%group
Win32 wlanapi
%prm
hClientHandle, OpCode, pReserved, pdwDataSize, ppData, pWlanOpcodeValueType
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
OpCode : [int] A value that specifies the configuration parameter to be queried.
pReserved : [intptr] Reserved for future use.  Must be set to NULL.
pdwDataSize : [var] Specifies the size of the ppData parameter, in bytes.
ppData : [var] Pointer to the memory that contains the queried value for the parameter specified in OpCode. Note??If OpCode is set to wlan_autoconf_opcode_show_denied_networks, then the pointer referenced by ppData may point to an integer value. If the pointer referenced by ppData points to 0, then the integer value should be converted  to the boolean value FALSE. If the pointer referenced by ppData points to a nonzero integer, then the integer value should be converted  to the boolean value TRUE.
pWlanOpcodeValueType : [var] A WLAN_OPCODE_VALUE_TYPE value.
%inst
Queries for the parameters of the auto configuration service.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WlanQueryAutoConfigParameter function queries for the parameters
used by Auto Configuration Module (ACM), the wireless configuration
component supported on Windows Vista and later.


%index
WlanQueryInterface
The WlanQueryInterface function queries various parameters of a specified interface.
%group
Win32 wlanapi
%prm
hClientHandle, pInterfaceGuid, OpCode, pReserved, pdwDataSize, ppData, pWlanOpcodeValueType
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
pInterfaceGuid : [var] The GUID of the interface to be queried.
OpCode : [int] A WLAN_INTF_OPCODE value that specifies the parameter to be queried.  The following table lists the valid constants along with the data type of the parameter in ppData.
pReserved : [intptr] Reserved for future use. Must be set to NULL.
pdwDataSize : [var] The size of the ppData parameter, in bytes.
ppData : [var] Pointer to the memory location that contains the queried value of the parameter specified by the OpCode parameter. Note??If OpCode is set to wlan_intf_opcode_autoconf_enabled, wlan_intf_opcode_background_scan_enabled, or wlan_intf_opcode_media_streaming_mode, then the pointer referenced by ppData may point to an integer value. If the pointer referenced by ppData points to 0, then the integer value should be converted  to the boolean value FALSE. If the pointer referenced by ppData points to a nonzero integer, then the integer value should be converted  to the boolean value TRUE.
pWlanOpcodeValueType : [var] If passed a non-NULL value, points to a WLAN_OPCODE_VALUE_TYPE value that specifies the type of opcode returned. This parameter may be NULL.
%inst
The WlanQueryInterface function queries various parameters of a
specified interface.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.

[備考]
The caller is responsible for using WlanFreeMemory to free the memory
allocated for ppData. When OpCode is set to
wlan_intf_opcode_current_operation_mode, WlanQueryInterface queries
the current operation mode of the wireless interface. For more
information about operation modes, see Native 802.11 Operation Modes.
Two operation modes are supported:
DOT11_OPERATION_MODE_EXTENSIBLE_STATION and
DOT11_OPERATION_MODE_NETWORK_MONITOR. The operation mode constants
are defined in the header file Windot11.h. ppData will point to one
of these two values.


%index
WlanReasonCodeToString
Retrieves a string that describes a specified reason code.
%group
Win32 wlanapi
%prm
dwReasonCode, dwBufferSize, pStringBuffer, pReserved
dwReasonCode : [int] A WLAN_REASON_CODE value of which the string description is requested.
dwBufferSize : [int] The size of the buffer used to store the string, in WCHAR.  If the reason code string is longer than the buffer, it will be truncated and NULL-terminated. If dwBufferSize is larger than the actual amount of memory allocated to pStringBuffer, then an access violation will occur in the calling program.
pStringBuffer : [wstr] Pointer to a buffer that will receive the string. The caller must allocate memory to pStringBuffer before calling WlanReasonCodeToString.
pReserved : [intptr] Reserved for future use.  Must be set to NULL.
%inst
Retrieves a string that describes a specified reason code.

[戻り値]
If the function succeeds, the return value is a pointer to a constant
string. If the function fails, the return value may be one of the
following return codes.
This doc was truncated.


%index
WlanRegisterDeviceServiceNotification
Allows user mode clients with admin privileges, or User-Mode Driver Framework (UMDF) drivers, to register for unsolicited notifications corresponding to device services that they're interested in.
%group
Win32 wlanapi
%prm
hClientHandle, pDevSvcGuidList
hClientHandle : [intptr] Type: **[HANDLE](/windows/win32/winprog/windows-data-types)** The client's session handle, obtained by a previous call to the [WlanOpenHandle](./nf-wlanapi-wlanopenhandle.md) function.
pDevSvcGuidList : [var] Type: **CONST [PWLAN_DEVICE_SERVICE_GUID_LIST](./ns-wlanapi-wlan_device_service_guid_list.md)** An optional pointer to a constant [WLAN_DEVICE_SERVICE_GUID_LIST](./ns-wlanapi-wlan_device_service_guid_list.md) structure representing the device service **GUID**s for which you're interested in receiving notifications. The *dwIndex* member of the structure must have a value less than the value of its *dwNumberOfItems* member; otherwise, an access violation may occur. Every time you call this API, the previous device services list is replaced by the new one. To unregister, set *pDevSvcGuidList* to `nullptr`, or pass a pointer to a **WLAN_DEVICE_SERVICE_GUID_LIST** structure that has the `dwNumberOfItems` member set to 0.
%inst
Allows user mode clients with admin privileges, or User-Mode Driver
Framework (UMDF) drivers, to register for unsolicited notifications
corresponding to device services that they're interested in.

[戻り値]
Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
If the function succeeds, the return value is **ERROR_SUCCESS**. If
the function fails with **ERROR_ACCESS_DENIED**, then the caller
doesn't have sufficient permissions to perform this operation. The
caller needs to either have admin privilege, or needs to be a UMDF
driver.

[備考]
The **WlanRegisterDeviceServiceNotification** function is an
extension to existing native Wi-Fi APIs for WLAN device services. A
client application calls this function to register and unregister
notifications for device services that it is interested in. Any
registration to receive notifications for device services caused by
this function would be automatically undone if the calling
application closes its calling handle (by calling
[WlanCloseHandle](./nf-wlanapi-wlanclosehandle.md) with the
*hClientHandle* parameter), or if the process ends. In order to
receive these notifications, a client needs to call this function
with a valid *pDevSvcGuidList* parameter, and must also call the
[WlanRegisterNotification](./nf-wlanapi-wlanregisternotification.md)
function with a *dwNotifSource* argument of
**WLAN_NOTIFICATION_SOURCE_DEVICE_SERVICE** (which is defined in
`wlanapi.h`). The registration to receive notifications for device
services is in effect until the application closes the client handle
(by calling [WlanCloseHandle](./nf-wlanapi-wlanclosehandle.md) with
the *hClientHandle* parameter), or the process ends, or
**WlanRegisterDeviceServiceNotification** is called with a
*pDevSvcGuidList* argument of `nullptr`, or else has
*dwNumberOfItems* set to 0. When the operating system (OS) receives a
device service notification from an independent hardware vendor (IHV)
driver, and a client has registered for these notifications using
**WlanRegisterDeviceServiceNotification**, the client will receive
them via the
[WLAN_NOTIFICATION_CALLBACK](./nc-wlanapi-wlan_notification_callback.md)
that it had registered through its call to
[WlanRegisterNotification](./nf-wlanapi-wlanregisternotification.md).
This callback will be called for every notification that the client
has received (with a separate buffer for every notification). The
*NotificationSource* member of the
[WLAN_NOTIFICATION_DATA](/previous-versions/windows/desktop/legacy/ms706902(v=vs.85))
structure received by the callback function (that is, the *data*
member) will be set to **WLAN_NOTIFICATION_SOURCE_DEVICE_SERVICE**.
The data blob, the device service **GUID**, and the opcode associated
with this notification will be present in the *pData* member of the
**WLAN_NOTIFICATION_DATA**, which will point to a structure of type
[WLAN_DEVICE_SERVICE_NOTIFICATION_DATA](./ns-wlanapi-wlan_device_service_notification_data.md).
> [!NOTE] > The WLAN service, or the OS, will not check to see
whether the device service **GUID**s that the client registers for
are actually supported by the IHV driver. It is up to the client to
query for supported device services using
[WlanGetSupportedDeviceServices](./nf-wlanapi-wlangetsupporteddeviceservices.md)
API if they need to.


%index
WlanRegisterNotification
Is used to register and unregister notifications on all wireless interfaces.
%group
Win32 wlanapi
%prm
hClientHandle, dwNotifSource, bIgnoreDuplicate, funcCallback, pCallbackContext, pReserved, pdwPrevNotifSource
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
dwNotifSource : [int] The notification sources to be registered. These flags may be combined. When this parameter is set to WLAN_NOTIFICATION_SOURCE_NONE, WlanRegisterNotification unregisters notifications on all wireless interfaces. The possible values for this parameter are defined in the Wlanapi.h and L2cmn.h header files.
bIgnoreDuplicate : [int] Specifies whether duplicate notifications will be ignored.  If set to TRUE, a notification will not be sent to the client if it is identical to the previous one. Windows?XP with SP3 and Wireless LAN API for Windows?XP with SP2:??This parameter is ignored.
funcCallback : [int] A WLAN_NOTIFICATION_CALLBACK  type that defines the type of notification callback function. This parameter can be NULL if the dwNotifSource parameter is set to WLAN_NOTIFICATION_SOURCE_NONE to unregister notifications on all wireless interfaces,
pCallbackContext : [intptr] A pointer to the client context that will be passed to the callback function with the notification.
pReserved : [intptr] Reserved for future use.  Must be set to NULL.
pdwPrevNotifSource : [var] A pointer to the previously registered notification sources.
%inst
Is used to register and unregister notifications on all wireless
interfaces.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WlanRegisterNotification is used by an application to register
and unregister notifications on all wireless interfaces. When
registering for notifications, an application must provide a callback
function pointed to by the funcCallback parameter. The prototype for
this callback function is the WLAN_NOTIFICATION_CALLBACK. This
callback function will receive notifications that have been
registered for in the dwNotifSource parameter passed to the
WlanRegisterNotification function. The callback function is called
with a pointer to a WLAN_NOTIFICATION_DATA structure as the first
parameter that contains detailed information on the notification. The
callback function also receives a second parameter that contains a
pointer to the client context passed in the pCallbackContext
parameter to the WlanRegisterNotification function. The
WlanRegisterNotification function will return an error if
dwNotifSource is a value other than WLAN_NOTIFICATION_SOURCE_NONE and
the client fails to provide a callback function. Once registered, the
callback function will be called whenever a notification is available
until the client unregisters or closes the handle. Any registration
to receive notifications caused by this function would be
automatically undone if the calling application closes its calling
handle (by calling WlanCloseHandle with the hClientHandle parameter)
or if the process ends.
Do not call WlanRegisterNotification from a callback function. If the
client is in the middle of a notification callback when
WlanRegisterNotification is called with dwNotifSource set to
WLAN_NOTIFICATION_SOURCE_NONE (that is, when the client is
unregistering from notifications), WlanRegisterNotification will wait
for the callback to finish before returning a value. Calling this
function inside a callback function will result in the call never
completing. If both the callback function and the thread that
unregisters from notifications try to acquire the same lock, a
deadlock may occur. In addition, do not call WlanRegisterNotification
from the DllMain function in an application DLL. This could also
cause a deadlock. An application can time out and query the current
interface state instead of waiting for a notification. Windows XP
with SP3 and Wireless LAN API for Windows XP with SP2: Notifications
are handled by the Netman service. If the Netman service is disabled
or unavailable, notifications will not be received. If a notification
is not received within a reasonable period of time, an application
should time out and query the current interface state.


%index
WlanRegisterVirtualStationNotification
Is used to register and unregister notifications on a virtual station.
%group
Win32 wlanapi
%prm
hClientHandle, bRegister, pReserved
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
bRegister : [int] A value that specifies whether to receive notifications on a virtual station.
pReserved : [intptr] Reserved for future use. This parameter must be NULL.
%inst
Is used to register and unregister notifications on a virtual
station.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WlanRegisterVirtualStationNotification function is an extension
to native wireless APIs added to support the wireless Hosted Network
on Windows 7 and on Windows Server 2008 R2 with the Wireless LAN
Service installed. A client application calls the
WlanRegisterVirtualStationNotification function is used to register
and unregister notifications on virtual station. Any registration to
receive notifications from a virtual station caused by this function
would be automatically undone if the calling application closes its
calling handle (by calling WlanCloseHandle with the hClientHandle
parameter) or if the process ends.
By default, a application client will not receive notifications on a
virtual station. In order to receive these notifications, a client
needs to call the WlanRegisterVirtualStationNotification function
with the bRegister parameter set to TRUE and must also call the
WlanRegisterNotification function with the dwNotifSource parameter
set to notification sources to be registered. The registration to
receive notifications from a virtual station is in effect until the
application closes the client handle (by calling WlanCloseHandle with
the hClientHandle parameter), the process ends, or the
WlanRegisterVirtualStationNotification function is called with the
bRegister parameter set to FALSE. On Windows 7 and later, the
operating system installs a virtual device if a Hosted Network
capable wireless adapter is present on the machine. This virtual
device normally shows up in the “Network Connections Folder” as
‘Wireless Network Connection 2’ with a Device Name of ‘Microsoft
Virtual WiFi Miniport adapter’ if the computer has a single wireless
network adapter. This virtual device is used exclusively for
performing software access point (SoftAP) connections and is not
present in the list returned by the WlanEnumInterfaces function. The
lifetime of this virtual device is tied to the physical wireless
adapter. If the physical wireless adapter is disabled, this virtual
device will be removed as well. This feature is also available on
Windows Server 2008 R2 with the Wireless LAN Service installed.


%index
WlanRenameProfile
Renames the specified profile.
%group
Win32 wlanapi
%prm
hClientHandle, pInterfaceGuid, strOldProfileName, strNewProfileName, pReserved
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
pInterfaceGuid : [var] The GUID of the interface.
strOldProfileName : [wstr] The profile name to be changed.
strNewProfileName : [wstr] The new name of the profile.
pReserved : [intptr] Reserved for future use. Must be set to NULL.
%inst
Renames the specified profile.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.


%index
WlanSaveTemporaryProfile
Saves a temporary profile to the profile store.
%group
Win32 wlanapi
%prm
hClientHandle, pInterfaceGuid, strProfileName, strAllUserProfileSecurity, dwFlags, bOverWrite, pReserved
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
pInterfaceGuid : [var] The GUID of the interface.
strProfileName : [wstr] The name of the profile to be saved. Profile names are case-sensitive. This string must be NULL-terminated.
strAllUserProfileSecurity : [wstr] Sets the security descriptor string on the all-user profile.  By default, for a new all-user profile, all users have write access on the profile. For more information about profile permissions, see the Remarks section. If dwFlags is set to WLAN_PROFILE_USER, this parameter is ignored. If this parameter is set to NULL for an all-user profile, the default permissions are used. If this parameter is not NULL for an all-user profile, the security descriptor string associated with the profile is created or modified  after the security descriptor object is created and parsed as a string.
dwFlags : [int] Specifies the flags to set on the profile. The flags can be combined.
bOverWrite : [int] Specifies whether this profile is overwriting an existing profile.  If this parameter is FALSE and the profile already exists, the existing profile will not be overwritten and an error will be returned.
pReserved : [intptr] Reserved for future use.  Must be set to NULL.
%inst
Saves a temporary profile to the profile store.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
A temporary profile is the one passed to WlanConnect or generated by
the discovery engine. A network connection can be established using a
temporary profile. Using this API saves the temporary profile and
associated user data to the profile store. A new profile is added at
the top of the list after the group policy profiles. A profile's
position in the list is not changed if an existing profile is
overwritten. All-user profiles have three associated permissions:
read, write, and execute. If a user has read access, the user can
view profile permissions. If a user has execute access, the user has
read access and the user can also connect to and disconnect from a
network using the profile. If a user has write access, the user has
execute access and the user can also modify and delete permissions
associated with a profile. The following describes the procedure for
creating a security descriptor object and parsing it as a string.
This doc was truncated.


%index
WlanScan
Requests a scan for available networks on the indicated interface.
%group
Win32 wlanapi
%prm
hClientHandle, pInterfaceGuid, pDot11Ssid, pIeData, pReserved
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
pInterfaceGuid : [var] The GUID of the interface to be queried. The GUID of each wireless LAN interface enabled on a local computer can be determined using the WlanEnumInterfaces function.
pDot11Ssid : [var] A pointer to a DOT11_SSID structure that specifies the SSID of the network to be scanned. This parameter is optional. When set to NULL, the returned list contains all available networks. Windows?XP with SP3 and Wireless LAN API for Windows?XP with SP2:??This parameter must be NULL.
pIeData : [var] A pointer to an information element to include in probe requests. This parameter points to a WLAN_RAW_DATA structure that may include client provisioning availability information and 802.1X authentication requirements.Windows?XP with SP3 and Wireless LAN API for Windows?XP with SP2:??This parameter must be NULL.
pReserved : [intptr] Reserved for future use. Must be set to NULL.
%inst
Requests a scan for available networks on the indicated interface.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WlanScan function requests that the native 802.11 Wireless LAN
driver scan for available wireless networks. The driver may or may
not send probe requests (an active scan) depending on its
implementation and the values passed in the pDot11Ssid and pIeData
parameters. If the pIeData parameter is not NULL, the driver will
send probe requests during the scan. The probe requests include the
information element (IE) pointed to by the pIeData parameter. For
instance, the Wi-Fi Protected Setup (WPS) IE can be included in the
probe requests to discover WPS-capable access points. The buffer
pointed to by the pIeData parameter must contain the complete IE
starting from the Element ID. The pIeData parameter passed to the
WlanScan function can contain a pointer to an optional WLAN_RAW_DATA
structure that contains a proximity service discovery (PSD) IE data
entry.
This doc was truncated.


%index
WlanSetAutoConfigParameter
Sets parameters for the automatic configuration service.
%group
Win32 wlanapi
%prm
hClientHandle, OpCode, dwDataSize, pData, pReserved
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
OpCode : [int] A WLAN_AUTOCONF_OPCODE value that specifies the parameter to be set. Only some of the opcodes in the WLAN_AUTOCONF_OPCODE enumeration support set operations.
dwDataSize : [int] The size of the pData parameter, in bytes. This parameter must be set to sizeof(BOOL) for a BOOL or sizeof(DWORD) for a DWORD, depending on the value of the OpCode parameter.
pData : [intptr] The value to be set for the parameter specified in OpCode parameter. The pData parameter must point to a boolean or DWORD value, depending on the value of the OpCode parameter. The pData parameter must not be NULL. Note??The pData parameter may point to an integer value when a boolean is required. If pData points to 0, then the value is converted to FALSE. If pData points to a nonzero integer, then the value is converted to TRUE.
pReserved : [intptr] Reserved for future use. Must be set to NULL.
%inst
Sets parameters for the automatic configuration service.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WlanSetAutoConfigParameter function sets parameters used by Auto
Configuration Module (ACM), the wireless configuration component
supported on Windows Vista and later. Depending on the value of the
OpCode parameter, the data pointed to by pData will be converted to a
boolean value before the automatic configuration parameter is set. If
pData points to 0, then the parameter is set to FALSE; otherwise, the
parameter is set to TRUE.


%index
WlanSetFilterList
Sets the permit/deny list.
%group
Win32 wlanapi
%prm
hClientHandle, wlanFilterListType, pNetworkList, pReserved
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
wlanFilterListType : [int] A WLAN_FILTER_LIST_TYPE value that specifies the type of filter list.  The value must be either wlan_filter_list_type_user_permit or wlan_filter_list_type_user_deny.  Group policy-defined lists cannot be set using this function.
pNetworkList : [var] Pointer to a DOT11_NETWORK_LIST structure that contains the list of networks to permit or deny. The dwIndex member of the structure must have a value less than the value of the dwNumberOfItems member of the structure; otherwise, an access violation may occur.
pReserved : [intptr] Reserved for future use.  Must be set to NULL.
%inst
Sets the permit/deny list.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The group policy permit and deny lists take precedence over the
user's permit and deny lists. That means access to a network on the
user's permit list will be denied if the network appears on the group
policy deny list. Similarly, access to a network on the user's deny
list will be permitted if the network appears on the group policy
permit list. Networks that are not on a user list or a group policy
list will be permitted. Denied networks cannot be connected by means
of auto config and will not be included on the visible networks list.
New user permit and deny lists overwrite previous versions of the
user lists. To clear a filter list, set the pNetworkList parameter to
NULL, or pass a pointer to a DOT11_NETWORK_LIST structure that has
the dwNumberOfItems member set to 0. To add all SSIDs to a filter
list, pass a pointer to a DOT11_NETWORK_LIST structure with an
associated DOT11_NETWORK structure that has the uSSIDLength member of
its DOT11_SSID structure set to 0. To add all BSS types to a filter
list, pass a pointer to a DOT11_NETWORK_LIST with an associated
DOT11_NETWORK structure that has its dot11BssType member set to
dot11_BSS_type_any. The netsh wlan add filter and netsh wlan delete
filter commands provide similar functionality at the command line.
For more information, see Netsh Commands for Wireless Local Area
Network (wlan).


%index
WlanSetInterface
Sets user-configurable parameters.
%group
Win32 wlanapi
%prm
hClientHandle, pInterfaceGuid, OpCode, dwDataSize, pData, pReserved
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
pInterfaceGuid : [var] The GUID of the interface to be configured.
OpCode : [int] A WLAN_INTF_OPCODE value that specifies the parameter to be set.  The following table lists the valid constants along with the data type of the parameter in pData.
dwDataSize : [int] The size of the pData parameter, in bytes. If dwDataSize is larger than the actual amount of memory allocated to pData, then an access violation will occur in the calling program.
pData : [intptr] The value to be set as specified by the OpCode parameter. The type of data pointed to by pData must be appropriate for the specified OpCode. Use the table above to determine the type of data to use. Note??If OpCode is set to wlan_intf_opcode_autoconf_enabled, wlan_intf_opcode_background_scan_enabled, or wlan_intf_opcode_media_streaming_mode, then pData may point to an integer value. If pData points to 0, then the value is converted to FALSE. If pData points to a nonzero integer, then the value is converted to TRUE.
pReserved : [intptr] Reserved for future use.  Must be set to NULL.
%inst
Sets user-configurable parameters.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.

[備考]
When OpCode is set to wlan_intf_opcode_current_operation_mode, the
WlanSetInterface function sets the current operation mode of the
wireless interface. For more information about operation modes, see
Native 802.11 Operation Modes. Two operation modes are supported:
DOT11_OPERATION_MODE_EXTENSIBLE_STATION and
DOT11_OPERATION_MODE_NETWORK_MONITOR. The operation mode constants
are defined in the header file Windot11.h. If pData does not point to
one of these values when OpCode is set to
wlan_intf_opcode_current_operation_mode, the WlanSetInterface
function will fail with an error. To enable or disable the automatic
configuration service at the command line, which is functionally
equivalent to calling WlanSetInterface with OpCode set to
wlan_intf_opcode_autoconf_enabled, use the netsh wlan setautoconfig
command. For more information, see Netsh Commands for Wireless Local
Area Network (wlan). The software radio state can be changed by
calling the WlanSetInterface function. The hardware radio state
cannot be changed by calling the WlanSetInterface function. When the
OpCode parameter is set to wlan_intf_opcode_radio_state, the
WlanSetInterface function sets the software radio state of a specific
PHY. The pData parameter must point to a WLAN_PHY_RADIO_STATE
structure with the new radio state values to use. The
dot11HardwareRadioState member of the WLAN_PHY_RADIO_STATE structure
is ignored when the WlanSetInterface function is called with the
OpCode parameter set to wlan_intf_opcode_radio_state and the pData
parameter points to a WLAN_PHY_RADIO_STATE structure. The radio state
of a PHY is off if either the software radio state
(dot11SoftwareRadioState member of the WLAN_PHY_RADIO_STATE
structure) or the hardware radio state (dot11HardwareRadioState
member of the WLAN_PHY_RADIO_STATE structure) is off. Changing the
software radio state of a physical network interface could cause
related changes in the state of the wireless Hosted Network or
virtual wireless adapter radio states. The PHYs of every virtual
wireless adapter are linked. For more information, see the About the
Wireless Hosted Network.


%index
WlanSetProfile
Sets the content of a specific profile.
%group
Win32 wlanapi
%prm
hClientHandle, pInterfaceGuid, dwFlags, strProfileXml, strAllUserProfileSecurity, bOverwrite, pReserved, pdwReasonCode
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
pInterfaceGuid : [var] The GUID of the interface.
dwFlags : [int] The flags to set on the profile. Windows?XP with SP3 and Wireless LAN API for Windows?XP with SP2:??dwFlags must be 0. Per-user profiles are not supported.
strProfileXml : [wstr] Contains the XML representation of the profile. The WLANProfile element is the root profile element. To view sample profiles, see Wireless Profile Samples. There is no predefined maximum string length. Windows?XP with SP3 and Wireless LAN API for Windows?XP with SP2:??The supplied profile must meet the compatibility criteria described in Wireless Profile Compatibility.
strAllUserProfileSecurity : [wstr] Sets the security descriptor string on the all-user profile.  For more information about profile permissions, see the Remarks section. If dwFlags is set to WLAN_PROFILE_USER, this parameter is ignored. If this parameter is set to NULL for a new all-user profile, the security descriptor associated with the  wlan_secure_add_new_all_user_profiles object is used. If the security descriptor has not been modified by a WlanSetSecuritySettings call,  all users have default permissions on a new all-user profile. Call WlanGetSecuritySettings to get the default permissions associated with the   wlan_secure_add_new_all_user_profiles object. If this parameter is set to NULL for an existing all-user profile, the permissions of the profile are not changed. If this parameter is not NULL for an all-user profile, the security descriptor string associated with the profile is created or modified  after the security descriptor object is created and parsed as a string. Windows?XP with SP3 and Wireless LAN API for Windows?XP with SP2:??This parameter must be NULL.
bOverwrite : [int] Specifies whether this profile is overwriting an existing profile.  If this parameter is FALSE and the profile already exists, the existing profile will not be overwritten and an error will be returned.
pReserved : [intptr] Reserved for future use.  Must be set to NULL.
pdwReasonCode : [var] A WLAN_REASON_CODE value that indicates why the profile is not valid.
%inst
Sets the content of a specific profile.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WlanSetProfile function can be used to add a new wireless LAN
profile or replace an existing wireless LAN profile. A new profile is
added at the top of the list after the group policy profiles. A
profile's position in the list is not changed if an existing profile
is overwritten.Windows XP with SP3 and Wireless LAN API for Windows
XP with SP2: Ad hoc profiles appear after the infrastructure profiles
in the profile list. If you create a new ad hoc profile, it is placed
at the top of the ad hoc list, after the group policy and
infrastructure profiles. 802.1X guest profiles, Wireless Provisioning
Service (WPS) profiles, and profiles with Wi-Fi Protected Access-None
(WPA-None) authentication are not supported. That means such a
profile cannot be created, deleted, enumerated, or accessed using
Native Wifi functions. Any such profile already in the preferred
profile list will remain in the list, and its position in the list
relative to other profiles is fixed unless the position of the other
profiles change.
You can call WlanSetProfile on a profile that contains a plaintext
key (that is, a profile with the protected element present and set to
FALSE). Before the profile is saved in the profile store, the key
material is automatically encrypted. When the profile is subsequently
retrieved from the profile store by calling WlanGetProfile, the
encrypted key material is returned.Windows XP with SP3 and Wireless
LAN API for Windows XP with SP2: The key material is never encrypted.
All-user profiles have three associated permissions: read, write, and
execute. If a user has read access, the user can view profile
permissions. If a user has execute access, the user has read access
and the user can also connect to and disconnect from a network using
the profile. If a user has write access, the user has execute access
and the user can also modify and delete permissions associated with a
profile. The following describes the procedure for creating a
security descriptor object and parsing it as a string.
This doc was truncated.


%index
WlanSetProfileCustomUserData
Sets the custom user data associated with a profile.
%group
Win32 wlanapi
%prm
hClientHandle, pInterfaceGuid, strProfileName, dwDataSize, pData, pReserved
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
pInterfaceGuid : [var] The GUID of the interface.
strProfileName : [wstr] The name of the profile associated with the custom user data. Profile names are case-sensitive. This string must be NULL-terminated.
dwDataSize : [int] The size of pData, in bytes.
pData : [var] A pointer to the user data to be set.
pReserved : [intptr] Reserved for future use. Must be set to NULL.
%inst
Sets the custom user data associated with a profile.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
For every wireless WLAN profile used by the Native Wifi AutoConfig
service, Windows maintains the concept of custom user data. This
custom user data is initially non-existent, but can be set by calling
the WlanSetProfileCustomUserData function. The custom user data gets
reset to empty any time the profile is modified by calling the
WlanSetProfile function. Once custom user data has been set, this
data can be accessed using the WlanGetProfileCustomUserData function.
All wireless LAN functions require an interface GUID for the wireless
interface when performing profile operations. When a wireless
interface is removed, its state is cleared from Wireless LAN Service
(WLANSVC) and no profile operations are possible. The
WlanSetProfileCustomUserData function can fail with
ERROR_INVALID_PARAMETER if the wireless interface specified in the
pInterfaceGuid parameter has been removed from the system (a USB
wireless adapter that has been removed, for example).


%index
WlanSetProfileEapUserData
Sets the Extensible Authentication Protocol (EAP) user credentials as specified by raw EAP data.
%group
Win32 wlanapi
%prm
hClientHandle, pInterfaceGuid, strProfileName, eapType, dwFlags, dwEapUserDataSize, pbEapUserData, pReserved
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
pInterfaceGuid : [var] The GUID of the interface.
strProfileName : [wstr] The name of the profile associated with the EAP user data. Profile names are case-sensitive. This string must be NULL-terminated.
eapType : [var] An EAP_METHOD_TYPE structure that contains the method for which the caller is supplying EAP user credentials.
dwFlags : [int] A set of flags that modify the behavior of the function. On Windows?Vista and Windows Server?2008, this parameter is reserved and should be set to zero.
dwEapUserDataSize : [int] The size, in bytes, of the data pointed to by pbEapUserData.
pbEapUserData : [var] A pointer to the raw EAP data used to set the user credentials. On Windows?Vista and Windows Server?2008, this parameter must not be NULL. On Windows?7, Windows Server?2008?R2,  and later, this parameter can be set to NULL to delete the stored credentials for this profile if the dwFlags parameter contains WLAN_SET_EAPHOST_DATA_ALL_USERS  and the dwEapUserDataSize parameter is 0.
pReserved : [intptr] Reserved for future use. Must be set to NULL.
%inst
Sets the Extensible Authentication Protocol (EAP) user credentials as
specified by raw EAP data.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WlanSetProfileEapUserData function sets the EAP user credentials
to use on a profile. On Windows Vista and Windows Server 2008, these
credentials can only be used by the caller. The eapType parameter is
an EAP_METHOD_TYPE structure that contains type, identification, and
author information about an EAP method. The eapType member of the
EAP_METHOD_TYPE structure is an EAP_TYPE structure that contains the
type and vendor identification information for an EAP method.
For more information on the allocation of EAP method types, see
section 6.2 of RFC 3748 published by the IETF. On Windows 7, Windows
Server 2008 R2, and later, the WlanSetProfileEapUserData function is
enhanced. EAP user credentials can be set for all users of a profile
if the dwFlags parameter contains WLAN_SET_EAPHOST_DATA_ALL_USERS.
The EAP user credentials on a profile can also be deleted. To delete
the EAP user credentials on a profile, the pbEapUserData parameter
must be NULL, the dwFlags parameter must equal
WLAN_SET_EAPHOST_DATA_ALL_USERS, and the dwEapUserDataSize parameter
must be 0. All wireless LAN functions require an interface GUID for
the wireless interface when performing profile operations. When a
wireless interface is removed, its state is cleared from Wireless LAN
Service (WLANSVC) and no profile operations are possible. The
WlanSetProfileEapUserData function can fail with
ERROR_INVALID_PARAMETER if the wireless interface specified in the
pInterfaceGuid parameter has been removed from the system (a USB
wireless adapter that has been removed, for example).


%index
WlanSetProfileEapXmlUserData
Sets the Extensible Authentication Protocol (EAP) user credentials as specified by an XML string.
%group
Win32 wlanapi
%prm
hClientHandle, pInterfaceGuid, strProfileName, dwFlags, strEapXmlUserData, pReserved
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
pInterfaceGuid : [var] The GUID of the interface.
strProfileName : [wstr] The name of the profile associated with the EAP user data. Profile names are case-sensitive. This string must be NULL-terminated. Windows?XP with SP3 and Wireless LAN API for Windows?XP with SP2:??The supplied name must match the profile name derived automatically from the SSID of the network. For an infrastructure network profile, the SSID must be supplied for the profile name. For an ad hoc network profile, the supplied name must be the SSID of the ad hoc network followed by -adhoc.
dwFlags : [int] A set of flags that modify the behavior of the function. On Wireless LAN API for Windows?XP with SP2, Windows?XP with SP3,Windows?Vista, and Windows Server?2008, this parameter is reserved and should be set to zero.
strEapXmlUserData : [wstr] A pointer to XML data used to set the user credentials. The XML data must be based on the EAPHost User Credentials schema. To view sample user credential XML data, see EAPHost User Properties.
pReserved : [intptr] Reserved for future use. Must be set to NULL.
%inst
Sets the Extensible Authentication Protocol (EAP) user credentials as
specified by an XML string.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The **WlanSetProfileEapXmlUserData** function sets the EAP user
credentials to use on a profile. This function can be called only on
a profile that uses 802.1X for authentication. On Windows Vista and
Windows Server 2008, these credentials can only be used by the
caller. The eapType parameter is an EAP_METHOD_TYPE structure that
contains type, identification, and author information about an EAP
method. The eapType member of the EAP_METHOD_TYPE structure is an
EAP_TYPE structure that contains the type and vendor identification
information for an EAP method. For more information on the allocation
of EAP method types, see section 6.2 of RFC 3748 published by the
IETF. On Windows 10, Windows Server 2016, and later, the
**WlanSetProfileEapXmlUserData** function is enhanced. EAP user
credentials can be set for all users of a profile if the dwFlags
parameter contains WLAN_SET_EAPHOST_DATA_ALL_USERS. All wireless LAN
functions require an interface GUID for the wireless interface when
performing profile operations. When a wireless interface is removed,
its state is cleared from Wireless LAN Service (WLANSVC) and no
profile operations are possible. The **WlanSetProfileEapXmlUserData**
function can fail with ERROR_INVALID_PARAMETER if the wireless
interface specified in the pInterfaceGuid parameter has been removed
from the system (a USB wireless adapter that has been removed, for
example). The **WlanSetProfileEapXmlUserData** might cause wireless
connection failure when you use **EAP-TTLS** and the API is called
from a 32-bit application running on a 64-bit operating system (OS).
Your application should be built for the same CPU architecture as the
target OS. Windows XP with SP3 and Wireless LAN API for Windows XP
with SP2: This function can only be used for Protected EAP (PEAP)
credentials. It can't be used for other EAP types.


%index
WlanSetProfileList
Sets the preference order of profiles.
%group
Win32 wlanapi
%prm
hClientHandle, pInterfaceGuid, dwItems, strProfileNames, pReserved
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
pInterfaceGuid : [var] The GUID of the interface.
dwItems : [int] The number of profiles in the strProfileNames parameter.
strProfileNames : [var] The names of the profiles in the desired order. Profile names are case-sensitive. This string must be NULL-terminated. Windows?XP with SP3 and Wireless LAN API for Windows?XP with SP2:??The supplied names must match the profile names derived automatically from the SSID of the network. For infrastructure network profiles, the SSID must be supplied for the profile name. For ad hoc network profiles, the supplied name must be the SSID of the ad hoc network followed by -adhoc.
pReserved : [intptr] Reserved for future use.  Must be set to NULL.
%inst
Sets the preference order of profiles.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The WlanSetProfileList function sets the preference order of wireless
LAN profiles for a given wireless interface. The profiles in the list
must be a one-to-one match with the current profiles returned by the
WlanGetProfileList function. The position of group policy profiles
cannot be changed. All wireless LAN functions require an interface
GUID for the wireless interface when performing profile operations.
When a wireless interface is removed, its state is cleared from
Wireless LAN Service (WLANSVC) and no profile operations are
possible. The WlanSetProfileList function can fail with
ERROR_INVALID_PARAMETER if the wireless interface specified in the
pInterfaceGuid parameter has been removed from the system (a USB
wireless adapter that has been removed, for example).


%index
WlanSetProfilePosition
Sets the position of a single, specified profile in the preference list.
%group
Win32 wlanapi
%prm
hClientHandle, pInterfaceGuid, strProfileName, dwPosition, pReserved
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
pInterfaceGuid : [var] The GUID of the interface.
strProfileName : [wstr] The name of the profile. Profile names are case-sensitive. This string must be NULL-terminated. Windows?XP with SP3 and Wireless LAN API for Windows?XP with SP2:??The supplied name must match the profile name derived automatically from the SSID of the network. For an infrastructure network profile, the SSID must be supplied for the profile name. For an ad hoc network profile, the supplied name must be the SSID of the ad hoc network followed by -adhoc.
dwPosition : [int] Indicates the position in the preference list that the profile should be shifted to.  0 (zero) corresponds to the first profile in the list that is returned by the WlanGetProfileList function.
pReserved : [intptr] Reserved for future use.  Must be set to NULL.
%inst
Sets the position of a single, specified profile in the preference
list.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The position of group policy profiles cannot be changed. By default,
only a user logged on as a member of the Administrators group can
change the position of an all-user profile. Call
WlanGetSecuritySettings to determine the actual user rights required
to change the position of an all-user profile. To set the profile
position at the command line, use the netsh wlan set profileorder
command. For more information, see Netsh Commands for Wireless Local
Area Network (wlan). Windows XP with SP3 and Wireless LAN API for
Windows XP with SP2: Ad hoc profiles appear after the infrastructure
profiles in the profile list. If you try to position an ad hoc
profile before an infrastructure profile using
WlanSetProfilePosition, the WlanSetProfilePosition call will succeed
but the Wireless Zero Configuration service will reorder the profile
list such that the ad hoc profile is positioned after all
infrastructure network profiles. Guest profiles, profiles with
Wireless Provisioning Service (WPS) authentication, and profiles with
Wi-Fi Protected Access-None (WPA-None) authentication are not
supported. Any such profile that appears in the preferred profile
list has a fixed position in the profile list. That means its
position cannot be changed using WlanSetProfilePosition and that its
position is not affected by position changes of other profiles. All
wireless LAN functions require an interface GUID for the wireless
interface when performing profile operations. When a wireless
interface is removed, its state is cleared from Wireless LAN Service
(WLANSVC) and no profile operations are possible. The
WlanSetProfilePosition function can fail with ERROR_INVALID_PARAMETER
if the wireless interface specified in the pInterfaceGuid parameter
has been removed from the system (a USB wireless adapter that has
been removed, for example).


%index
WlanSetPsdIEDataList
Sets the proximity service discovery (PSD) information element (IE) data list.
%group
Win32 wlanapi
%prm
hClientHandle, strFormat, pPsdIEDataList, pReserved
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
strFormat : [wstr] The format of a PSD IE in the PSD IE data list passed in the pPsdIEDataList parameter. This is a NULL-terminated URI string that specifies the namespace of the protocol used for discovery.
pPsdIEDataList : [var] A pointer to a WLAN_RAW_DATA_LIST structure that contains the PSD IE data list to be set.
pReserved : [intptr] Reserved for future use.  Must be set to NULL.
%inst
Sets the proximity service discovery (PSD) information element (IE)
data list.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
The Proximity Service Discovery Protocol is a Microsoft proprietary
protocol that allows a client to discover services in its physical
proximity, which is defined by the radio range. The purpose of the
Proximity Service Discovery Protocol is to convey service discovery
information, such as service advertisements, as part of Beacon
frames. Access points (APs) and stations (STAs) that operate in ad
hoc mode periodically broadcast beacon frames. The beacon frame can
contain single or multiple proprietary information elements that
carry discovery information pertaining to the services that the
device offers. A PSD IE is used to transmit compressed information
provided by higher-level discovery protocols for the purpose of
passive discovery. One such higher-level protocol used for discovery
is the WS-Discovery protocol. Any protocol can be used for discovery.
Windows Vista and Windows Server 2008 with the Wireless LAN Service
installed support passive discovery for ad hoc clients, ad hoc
services, and infrastructure clients. This means an ad hoc service
can advertise an available resource or service by transmitting a PSD
IE in one or more beacons. There is no guarantee that this beacon is
received by an ad hoc or infrastructure client. Windows 7 and Windows
Server 2008 R2 with the Wireless LAN Service installed support
passive discovery for ad hoc clients, ad hoc services, and
infrastructure clients in the same way as in Windows Vista. In
addition, the PSD IE is also supported for the wireless Hosted
Network, a software-based wireless access point (AP). Applications on
the local computer where the wireless Hosted Network is to be run may
use the WlanSetPsdIeDataList function to set the PSD IE before
starting the wireless Hosted Network. Once set, the PSD IE will be
included in the beacon and probe response after the wireless Hosted
Network is started.
This doc was truncated.


%index
WlanSetSecuritySettings
Sets the security settings for a configurable object.
%group
Win32 wlanapi
%prm
hClientHandle, SecurableObject, strModifiedSDDL
hClientHandle : [intptr] The client's session handle, obtained by a previous call to the WlanOpenHandle function.
SecurableObject : [int] A WLAN_SECURABLE_OBJECT value that specifies the object to which the security settings will be applied.
strModifiedSDDL : [wstr] A security descriptor string that specifies the new security settings for the object. This string must be NULL-terminated. For more information, see the Remarks section.
%inst
Sets the security settings for a configurable object.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value may be one of the following return
codes.
This doc was truncated.

[備考]
A successful call to the WlanSetSecuritySettings function overrides
the default permissions associated with an object. For more
information about default permissions, see Native Wifi API
Permissions. The following describes the procedure for creating a
security descriptor object and parsing it as a string.
This doc was truncated.

