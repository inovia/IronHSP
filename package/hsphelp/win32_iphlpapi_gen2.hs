; ============================================================
;   iphlpapi.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
AddIPAddress
The AddIPAddress function adds the specified IPv4 address to the specified adapter.
%group
Win32 iphlpapi
%prm
Address, IpMask, IfIndex, NTEContext, NTEInstance
Address : [int] The IPv4 address to add to the adapter, in the form of an IPAddr structure.
IpMask : [int] The subnet mask for the IPv4 address specified in the Address parameter.   The IPMask parameter uses the same format as an IPAddr structure.
IfIndex : [int] The index of the adapter on which to add the IPv4 address.
NTEContext : [var] A pointer to a ULONG variable. On successful return, this parameter points to the Net Table Entry (NTE) context for the IPv4 address that was added. The caller can later use this context in a call to the DeleteIPAddress function.
NTEInstance : [var] A pointer to a ULONG variable. On successful return, this parameter points to the NTE instance for the IPv4 address that was added.
%inst
The AddIPAddress function adds the specified IPv4 address to the
specified adapter.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The AddIPAddress function is used to add a new IPv4 address entry on
a local computer. The IPv4 address added by the AddIPAddress function
is not persistent. The IPv4 address exists only as long as the
adapter object exists. Restarting the computer destroys the IPv4
address, as does manually resetting the network interface card (NIC).
Also, certain PnP events may destroy the address. To create an IPv4
address that persists, the EnableStatic method of the
Win32_NetworkAdapterConfiguration Class in the Windows Management
Instrumentation (WMI) controls may be used. The netsh commands can
also be used to create a persistent IPv4 address. For more
information, please see the documentation on Netsh.exe in the Windows
Sockets documentation. On Windows Server 2003, Windows XP, and
Windows 2000, if the IPv4 address in the Address parameter already
exists on the network, the AddIPAddress function returns NO_ERROR and
the IPv4 address added is 0.0.0.0. On Windows Vista and later, if the
IPv4 address passed in the Address parameter already exists on the
network, the AddIPAddress function returns NO_ERROR and the duplicate
IPv4 address is added with the IP_DAD_STATE member in the
IP_ADAPTER_UNICAST_ADDRESS structure set to IpDadStateDuplicate. An
IPv4 address that is added using the AddIPAddress function can later
be deleted by calling the DeleteIPAddress function passing the
NTEContext parameter returned by the AddIPAddress function. For
information about the IPAddr and IPMask data types, see Windows Data
Types. To convert an IPv4 address between dotted decimal notation and
IPAddr format, use the inet_addr and inet_ntoa functions. On Windows
Vista and later, the CreateUnicastIpAddressEntry function can be used
to add a new unicast IPv4 or IPv6 address entry on a local computer.


%index
CancelIPChangeNotify
Cancels notification of IPv4 address and route changes previously requested with successful calls to the NotifyAddrChange or NotifyRouteChange functions.
%group
Win32 iphlpapi
%prm
notifyOverlapped
notifyOverlapped : [var] A pointer to the OVERLAPPED structure used in the previous call to NotifyAddrChange  or NotifyRouteChange.
%inst
Cancels notification of IPv4 address and route changes previously
requested with successful calls to the NotifyAddrChange or
NotifyRouteChange functions.

[備考]
The CancelIPChangeNotify function deregisters for a change
notification previously requested for IPv4 address or route changes
on a local computer. These requests to register for notification are
made by calling the NotifyAddrChange or NotifyRouteChange functions.
The OVERLAPPED structure used in the previous call to one of these
notification functions is passed to CancelIPChangeNotify function in
the notifyOverlapped parameter to deregister for notifications. The
CancelIPChangeNotify can return FALSE if no notification request was
found or an invalid notifyOverlapped parameter was passed.


%index
UnregisterInterfaceTimestampConfigChange
Cancels notifications about timestamp capability changes by unregistering the callback function you registered in a call to [**RegisterInterfaceTimestampConfigChange**](/windows/win32/api/iphlpapi/nf-iphlpapi-registerinterfacetimestampconfigchange).
%group
Win32 iphlpapi
%prm
NotificationHandle
NotificationHandle : [intptr] Type: \_In\_ **HIFTIMESTAMPCHANGE** The handle that was returned by [**RegisterInterfaceTimestampConfigChange**](/windows/win32/api/iphlpapi/nf-iphlpapi-registerinterfacetimestampconfigchange). This identifies the registration to be canceled.
%inst
Cancels notifications about timestamp capability changes by
unregistering the callback function you registered in a call to
[**RegisterInterfaceTimestampConfigChange**](/windows/win32/api/iphlpapi/nf-iphlpapi-registerinterfacetimestampconfigchange).

[戻り値]
Type: **[DWORD](/windows/win32/winprog/windows-data-types)** A
**DWORD** return code indicating success or failure.


%index
CancelIfTimestampConfigChange
This function is reserved for system use, and you should not call it from your code. (CancelIfTimestampConfigChange)
%group
Win32 iphlpapi
%prm
NotificationHandle
NotificationHandle : [intptr] Reserved.
%inst
This function is reserved for system use, and you should not call it
from your code. (CancelIfTimestampConfigChange)

[戻り値]
This function does not return a value.


%index
CancelMibChangeNotify2
Deregisters for change notifications for IP interface changes, IP address changes, IP route changes, Teredo port changes, and when the unicast IP address table is stable and can be retrieved.
%group
Win32 iphlpapi
%prm
NotificationHandle
NotificationHandle : [intptr] The handle returned from a notification registration or retrieval function to indicate which notification to cancel.
%inst
Deregisters for change notifications for IP interface changes, IP
address changes, IP route changes, Teredo port changes, and when the
unicast IP address table is stable and can be retrieved.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The CancelMibChangeNotify2 function is defined on Windows Vista and
later. The CancelMibChangeNotify2 function deregisters for a change
notification previously requested for IP interface changes, IP
address changes, IP route changes, or Teredo port changes on a local
computer. These requests are made by calling NotifyIpInterfaceChange,
NotifyUnicastIpAddressChange, NotifyRouteChange2, or
NotifyTeredoPortChange. The CancelMibChangeNotify2 function also
cancels a previous request to be notified when the unicast IP address
table is stable on a local computer and can be retrieved. This
request is made by calling the NotifyStableUnicastIpAddressTable
function. The NotificationHandle parameter returned to these
notification functions is passed to CancelMibChangeNotify2 to
deregister for notifications or cancel a pending request to retrieve
the stable unicast IP address table. An application cannot make a
call to the CancelMibChangeNotify2 function from the context of the
thread which is currently executing the notification callback
function for the same NotificationHandle parameter. Otherwise, the
thread executing that callback will result in deadlock. So the
CancelMibChangeNotify2 function must not be called directly as part
of the notification callback routine. In a more general situation, a
thread that executes the CancelMibChangeNotify2 function cannot own a
resource on which the thread that executes a notification callback
operation would wait because it would result in a similar deadlock.
The CancelMibChangeNotify2 function should be called from a different
thread, on which the thread that receives the notification callback
doesn’t have dependencies on.


%index
CaptureInterfaceHardwareCrossTimestamp
Retrieves cross timestamp info for a network adapter.
%group
Win32 iphlpapi
%prm
InterfaceLuid, CrossTimestamp
InterfaceLuid : [var] Type: \_In\_ **CONST [NET_LUID](/windows/win32/api/ifdef/ns-ifdef-net_luid_lh)\*** The network locally unique identifier (LUID) of the network adapter from which a cross timestamp is to be retrieved.
CrossTimestamp : [var] Type: \_Inout\_ **[PINTERFACE_HARDWARE_CROSSTIMESTAMP](/windows/win32/api/iphlpapi/ns-iphlpapi-interface_hardware_crosstimestamp)** The timestamp is returned by the network adapter in the form of an [**INTERFACE_HARDWARE_CROSSTIMESTAMP**](/windows/win32/api/iphlpapi/ns-iphlpapi-interface_hardware_crosstimestamp) object.
%inst
Retrieves cross timestamp info for a network adapter.

[戻り値]
Type: **[DWORD](/windows/win32/winprog/windows-data-types)** A
**DWORD** return code indicating success or failure.


%index
ConvertCompartmentGuidToId
(no summary)
%group
Win32 iphlpapi
%prm
CompartmentGuid, CompartmentId
CompartmentGuid : [var] 
CompartmentId : [var] 
%inst



%index
ConvertCompartmentIdToGuid
(no summary)
%group
Win32 iphlpapi
%prm
CompartmentId, CompartmentGuid
CompartmentId : [int] 
CompartmentGuid : [var] 
%inst



%index
ConvertInterfaceAliasToLuid
Converts an interface alias name for a network interface to the locally unique identifier (LUID) for the interface.
%group
Win32 iphlpapi
%prm
InterfaceAlias, InterfaceLuid
InterfaceAlias : [wstr] A pointer to a NULL-terminated Unicode string containing the alias name of the network interface.
InterfaceLuid : [var] A pointer to the NET_LUID for this interface.
%inst
Converts an interface alias name for a network interface to the
locally unique identifier (LUID) for the interface.

[戻り値]
On success, ConvertInterfaceAliasToLuid returns NO_ERROR. Any nonzero
return value indicates failure and a NULL is returned in the
InterfaceLuid parameter.
This doc was truncated.

[備考]
The ConvertInterfaceAliasToLuid function is available on Windows
Vista and later. The ConvertInterfaceAliasToLuid function is protocol
independent and works with network interfaces for both the IPv6 and
IPv4 protocol.


%index
ConvertInterfaceGuidToLuid
Converts a globally unique identifier (GUID) for a network interface to the locally unique identifier (LUID) for the interface.
%group
Win32 iphlpapi
%prm
InterfaceGuid, InterfaceLuid
InterfaceGuid : [var] A pointer to a GUID for a network interface.
InterfaceLuid : [var] A pointer to the NET_LUID for this interface.
%inst
Converts a globally unique identifier (GUID) for a network interface
to the locally unique identifier (LUID) for the interface.

[戻り値]
On success, ConvertInterfaceGuidToLuid returns NO_ERROR. Any nonzero
return value indicates failure and a NULL is returned in the
InterfaceLuid parameter.
This doc was truncated.

[備考]
The ConvertInterfaceGuidToLuid function is available on Windows Vista
and later. The ConvertInterfaceGuidToLuid function is protocol
independent and works with network interfaces for both the IPv6 and
IPv4 protocol.


%index
ConvertInterfaceIndexToLuid
Converts a local index for a network interface to the locally unique identifier (LUID) for the interface.
%group
Win32 iphlpapi
%prm
InterfaceIndex, InterfaceLuid
InterfaceIndex : [int] The local index  value for a network interface.
InterfaceLuid : [var] A pointer to the NET_LUID for this interface.
%inst
Converts a local index for a network interface to the locally unique
identifier (LUID) for the interface.

[戻り値]
On success, ConvertInterfaceIndexToLuid returns NO_ERROR. Any nonzero
return value indicates failure and a NULL is returned in the
InterfaceLuid parameter.
This doc was truncated.

[備考]
The ConvertInterfaceIndexToLuid function is available on Windows
Vista and later. The ConvertInterfaceIndexToLuid function is protocol
independent and works with network interfaces for both the IPv6 and
IPv4 protocol.


%index
ConvertInterfaceLuidToAlias
Converts a locally unique identifier (LUID) for a network interface to an interface alias.
%group
Win32 iphlpapi
%prm
InterfaceLuid, InterfaceAlias, Length
InterfaceLuid : [var] A pointer to a NET_LUID for a network interface.
InterfaceAlias : [wstr] A pointer to a buffer to hold the NULL-terminated Unicode string containing the alias name of the network interface when the function returns successfully.
Length : [int] The length, in characters, of the buffer pointed to by the InterfaceAlias parameter. This value must be large enough to accommodate the alias name of the network interface and the terminating NULL character.  The maximum required length is NDIS_IF_MAX_STRING_SIZE + 1.
%inst
Converts a locally unique identifier (LUID) for a network interface
to an interface alias.

[戻り値]
On success, ConvertInterfaceLuidToAlias returns NO_ERROR. Any nonzero
return value indicates failure.
This doc was truncated.

[備考]
The ConvertInterfaceLuidToAlias function is available on Windows
Vista and later. The ConvertInterfaceLuidToAlias function is protocol
independent and works with network interfaces for both the IPv6 and
IPv4 protocol. The maximum length of the alias name for a network
interface, NDIS_IF_MAX_STRING_SIZE, without the terminating NULL is
declared in the Ntddndis.h header file. The NDIS_IF_MAX_STRING_SIZE
is defined to be the IF_MAX_STRING_SIZE constant defined in the
Ifdef.h header file. The Ntddndis.h and Ifdef.h header files are
automatically included in the Netioapi.h header file which is
automatically included by the Iphlpapi.h header file. The Ntddndis.h,
Ifdef.h, and Netioapi.h header files should never be used directly.


%index
ConvertInterfaceLuidToGuid
Converts a locally unique identifier (LUID) for a network interface to a globally unique identifier (GUID) for the interface.
%group
Win32 iphlpapi
%prm
InterfaceLuid, InterfaceGuid
InterfaceLuid : [var] A pointer to a NET_LUID for a network interface.
InterfaceGuid : [var] A pointer to the GUID for this interface.
%inst
Converts a locally unique identifier (LUID) for a network interface
to a globally unique identifier (GUID) for the interface.

[戻り値]
On success, ConvertInterfaceLuidToGuid returns NO_ERROR. Any nonzero
return value indicates failure and a NULL is returned in the
InterfaceGuid parameter.
This doc was truncated.

[備考]
The ConvertInterfaceLuidToGuid function is available on Windows Vista
and later. The ConvertInterfaceLuidToGuid function is protocol
independent and works with network interfaces for both the IPv6 and
IPv4 protocol.


%index
ConvertInterfaceLuidToIndex
Converts a locally unique identifier (LUID) for a network interface to the local index for the interface.
%group
Win32 iphlpapi
%prm
InterfaceLuid, InterfaceIndex
InterfaceLuid : [var] A pointer to a NET_LUID for a network interface.
InterfaceIndex : [var] The local index  value for the interface.
%inst
Converts a locally unique identifier (LUID) for a network interface
to the local index for the interface.

[戻り値]
On success, ConvertInterfaceLuidToIndex returns NO_ERROR. Any nonzero
return value indicates failure and a NET_IFINDEX_UNSPECIFIED is
returned in the InterfaceIndex parameter.
This doc was truncated.

[備考]
The ConvertInterfaceLuidToIndex function is available on Windows
Vista and later. The ConvertInterfaceLuidToIndex function is protocol
independent and works with network interfaces for both the IPv6 and
IPv4 protocol.


%index
ConvertInterfaceLuidToNameW
Converts a locally unique identifier (LUID) for a network interface to the Unicode interface name.
%group
Win32 iphlpapi
%prm
InterfaceLuid, InterfaceName, Length
InterfaceLuid : [var] A pointer to a NET_LUID for a network interface.
InterfaceName : [wstr] A pointer to a buffer to hold the NULL-terminated Unicode string containing the interface name when the function returns successfully.
Length : [int] The number of characters in the array pointed to by the InterfaceName parameter. This value must be large enough to accommodate the interface name and the terminating null character.  The maximum required length is NDIS_IF_MAX_STRING_SIZE + 1.
%inst
Converts a locally unique identifier (LUID) for a network interface
to the Unicode interface name.

[戻り値]
On success, ConvertInterfaceLuidToNameW returns NETIO_ERROR_SUCCESS.
Any nonzero return value indicates failure.
This doc was truncated.

[備考]
The ConvertInterfaceLuidToNameW function is available on Windows
Vista and later. The ConvertInterfaceLuidToNameW function is protocol
independent and works with network interfaces for both the IPv6 and
IPv4 protocol. The ConvertInterfaceLuidToNameW converts a network
interface LUID to a Unicode interface name. The
ConvertInterfaceLuidToNameA converts an ANSI interface name to a
LUID. The maximum length of an interface name,
NDIS_IF_MAX_STRING_SIZE, without the terminating NULL is declared in
the Ntddndis.h header file. The NDIS_IF_MAX_STRING_SIZE is defined to
be the IF_MAX_STRING_SIZE constant defined in the Ifdef.h header
file. The Ntddndis.h and Ifdef.h header files are automatically
included in the Netioapi.h header file which is automatically
included by the Iphlpapi.h header file. The Ntddndis.h, Ifdef.h, and
Netioapi.h header files should never be used directly.


%index
ConvertInterfaceNameToLuidW
Converts a Unicode network interface name to the locally unique identifier (LUID) for the interface.
%group
Win32 iphlpapi
%prm
InterfaceName, InterfaceLuid
InterfaceName : [wstr] A pointer to a NULL-terminated Unicode string containing the network interface name.
InterfaceLuid : [var] A pointer to the NET_LUID for this interface.
%inst
Converts a Unicode network interface name to the locally unique
identifier (LUID) for the interface.

[戻り値]
On success, ConvertInterfaceNameToLuidW returns NETIO_ERROR_SUCCESS.
Any nonzero return value indicates failure.
This doc was truncated.

[備考]
The ConvertInterfaceNameToLuidW function is available on Windows
Vista and later. The ConvertInterfaceNameToLuidW function is protocol
independent and works with network interfaces for both the IPv6 and
IPv4 protocol. The ConvertInterfaceNameToLuidW converts a Unicode
interface name to a LUID. The ConvertInterfaceNameToLuidA converts an
ANSI interface name to a LUID. The maximum length of an interface
name, NDIS_IF_MAX_STRING_SIZE, without the terminating NULL is
declared in the Ntddndis.h header file. The NDIS_IF_MAX_STRING_SIZE
is defined to be the IF_MAX_STRING_SIZE constant defined in the
Ifdef.h header file. The Ntddndis.h and Ifdef.h header files are
automatically included in the Netioapi.h header file which is
automatically included by the Iphlpapi.h header file. The Ntddndis.h,
Ifdef.h, and Netioapi.h header files should never be used directly.


%index
ConvertIpv4MaskToLength
Converts an IPv4 subnet mask to an IPv4 prefix length.
%group
Win32 iphlpapi
%prm
Mask, MaskLength
Mask : [int] The IPv4 subnet mask.
MaskLength : [var] A pointer to a UINT8 value to hold the IPv4 prefix length, in bits, when the function returns successfully.
%inst
Converts an IPv4 subnet mask to an IPv4 prefix length.

[戻り値]
On success, ConvertIpv4MaskToLength returns NO_ERROR. Any nonzero
return value indicates failure.
This doc was truncated.

[備考]
The ConvertIpv4MaskToLength function is available on Windows Vista
and later.


%index
ConvertLengthToIpv4Mask
Converts an IPv4 prefix length to an IPv4 subnet mask.
%group
Win32 iphlpapi
%prm
MaskLength, Mask
MaskLength : [int] The IPv4 prefix length, in bits.
Mask : [var] A pointer to a LONG value to hold the IPv4 subnet mask when the function returns successfully.
%inst
Converts an IPv4 prefix length to an IPv4 subnet mask.

[戻り値]
On success, ConvertLengthToIpv4Mask returns NO_ERROR. Any nonzero
return value indicates failure and the Mask parameter is set to
INADDR_NONE defined in the Ws2def.h header file.
This doc was truncated.

[備考]
The ConvertLengthToIpv4Mask function is available on Windows Vista
and later.


%index
CreateAnycastIpAddressEntry
Adds a new anycast IP address entry on the local computer.
%group
Win32 iphlpapi
%prm
Row
Row : [var] A pointer to a MIB_ANYCASTIPADDRESS_ROW structure entry for an anycast IP address entry.
%inst
Adds a new anycast IP address entry on the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The CreateAnycastIpAddressEntry function is defined on Windows Vista
and later. The CreateAnycastIpAddressEntry function is used to add a
new anycast IP address entry on a local computer. The Address member
in the MIB_ANYCASTIPADDRESS_ROW structure pointed to by the Row
parameter must be initialized to a valid unicast IPv4 or IPv6 address
and family. In addition, at least one of the following members in the
MIB_ANYCASTIPADDRESS_ROW structure pointed to the Row parameter must
be initialized to the interface: the InterfaceLuid or InterfaceIndex.
The fields are used in the order listed above. So if the
InterfaceLuid is specified, then this member is used to determine the
interface on which to add the unicast IP address. If no value was set
for the InterfaceLuid member (the values of this member was set to
zero), then the InterfaceIndex member is next used to determine the
interface. The ScopeId member of the MIB_ANYCASTIPADDRESS_ROW
structure pointed to by the Row is ignored when the
CreateAnycastIpAddressEntry function is called. The ScopeId member is
automatically determined by the interface on which the address is
added. The CreateAnycastIpAddressEntry function will fail if the
anycast IP address passed in the Address member of the
MIB_ANYCASTIPADDRESS_ROW pointed to by the Row parameter is a
duplicate of an existing anycast IP address on the interface. The
CreateAnycastIpAddressEntry function can only be called by a user
logged on as a member of the Administrators group. If
CreateAnycastIpAddressEntry is called by a user that is not a member
of the Administrators group, the function call will fail and
ERROR_ACCESS_DENIED is returned. This function can also fail because
of user account control (UAC) on Windows Vista and later. If an
application that contains this function is executed by a user logged
on as a member of the Administrators group other than the built-in
Administrator, this call will fail unless the application has been
marked in the manifest file with a requestedExecutionLevel set to
requireAdministrator. If the application lacks this manifest file, a
user logged on as a member of the Administrators group other than the
built-in Administrator must then be executing the application in an
enhanced shell as the built-in Administrator (RunAs administrator)
for this function to succeed.


%index
CreateIpForwardEntry
The CreateIpForwardEntry function creates a route in the local computer's IPv4 routing table.
%group
Win32 iphlpapi
%prm
pRoute
pRoute : [var] A pointer to a MIB_IPFORWARDROW structure that specifies the information for the new route. The caller must specify values for all members of this structure. The caller must specify MIB_IPPROTO_NETMGMT for the dwForwardProto member of MIB_IPFORWARDROW.
%inst
The CreateIpForwardEntry function creates a route in the local
computer's IPv4 routing table.

[戻り値]
The function returns NO_ERROR (zero) if the function is successful.
If the function fails, the return value is one of the following error
codes.
This doc was truncated.

[備考]
The dwForwardProto member of MIB_IPFORWARDROW structure pointed to by
the route parameter must be set to MIB_IPPROTO_NETMGMT otherwise
CreateIpForwardEntry will fail. Routing protocol identifiers are used
to identify route information for the specified routing protocol. For
example, MIB_IPPROTO_NETMGMT is used to identify route information
for IP routing set through network management such as the Dynamic
Host Configuration Protocol (DHCP), the Simple Network Management
Protocol (SNMP), or by calls to the CreateIpForwardEntry,
DeleteIpForwardEntry, or SetIpForwardEntry functions. On Windows
Vista and Windows Server 2008, the route metric specified in the
dwForwardMetric1 member of the MIB_IPFORWARDROW structure pointed to
by pRoute parameter represents a combination of the route metric
added to the interface metric specified in the Metric member of the
MIB_IPINTERFACE_ROW structure of the associated interface. So the
dwForwardMetric1 member of the MIB_IPFORWARDROW structure should be
equal to or greater than Metric member of the associated
MIB_IPINTERFACE_ROW structure. If an application would like to set
the route metric to 0, then the dwForwardMetric1 member of the
MIB_IPFORWARDROW structure should be set equal to the value of the
interface metric specified in the Metric member of the associated
MIB_IPINTERFACE_ROW structure. An application can retrieve the
interface metric by calling the GetIpInterfaceEntry function. On
Windows Vista and Windows Server 2008, the CreateIpForwardEntry only
works on interfaces with a single sub-interface (where the interface
LUID and subinterface LUID are the same). The dwForwardIfIndex member
of the MIB_IPFORWARDROW structure specifies the interface. A number
of members of the MIB_IPFORWARDROW structure pointed to by the route
parameter are not currently used by CreateIpForwardEntry. These
members include dwForwardPolicy, dwForwardType, dwForwardAge,
dwForwardNextHopAS, dwForwardMetric2, dwForwardMetric3,
dwForwardMetric4, and dwForwardMetric5. A new route created by
CreateIpForwardEntry will automatically have a default value for
dwForwardAge of INFINITE. To modify an existing route in the IPv4
routing table, use the SetIpForwardEntry function. To retrieve the
IPv4 routing table, call the GetIpForwardTable function. On Windows
Vista and later, the CreateIpForwardEntry function can only be called
by a user logged on as a member of the Administrators group. If
CreateIpForwardEntry is called by a user that is not a member of the
Administrators group, the function call will fail and
ERROR_ACCESS_DENIED is returned. The CreateIpForwardEntry function
can also fail because of user account control (UAC) on Windows Vista
and later. If an application that contains this function is executed
by a user logged on as a member of the Administrators group other
than the built-in Administrator, this call will fail unless the
application has been marked in the manifest file with a
requestedExecutionLevel set to requireAdministrator. If the
application lacks this manifest file, a user logged on as a member of
the Administrators group other than the built-in Administrator must
then be executing the application in an enhanced shell as the
built-in Administrator (RunAs administrator) for this function to
succeed.
Note On Windows NT 4.0 and Windows 2000 and later, this function
executes a privileged operation. For this function to execute
successfully, the caller must be logged on as a member of the
Administrators group or the NetworkConfigurationOperators group.


%index
CreateIpForwardEntry2
Creates a new IP route entry on the local computer.
%group
Win32 iphlpapi
%prm
Row
Row : [var] A pointer to a MIB_IPFORWARD_ROW2 structure entry for an IP route entry.
%inst
Creates a new IP route entry on the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The CreateIpForwardEntry2 function is defined on Windows Vista and
later. The CreateIpForwardEntry2 function is used to add a new
neighbor IP address entry on a local computer. The
InitializeIpForwardEntry function should be used to initialize the
members of a MIB_IPFORWARD_ROW2 structure entry with default values.
An application can then change the members in the MIB_IPFORWARD_ROW2
entry it wishes to modify, and then call the CreateIpForwardEntry2
function. The DestinationPrefix member in the MIB_IPFORWARD_ROW2
structure pointed to by the Row parameter must be initialized to a
valid IPv4 or IPv6 address prefix. The NextHop member in the
MIB_IPFORWARD_ROW2 structure pointed to by the Row parameter must be
initialized to a valid IPv4 or IPv6 address and family. In addition,
at least one of the following members in the MIB_IPFORWARD_ROW2
structure pointed to the Row parameter must be initialized to the
interface: the InterfaceLuid or InterfaceIndex. The fields are used
in the order listed above. So if the InterfaceLuid is specified, then
this member is used to determine the interface on which to add the IP
route entry. If no value was set for the InterfaceLuid member (the
values of this member was set to zero), then the InterfaceIndex
member is next used to determine the interface. The route metric
offset specified in the Metric member of the MIB_IPFORWARD_ROW2
structure pointed to by Row parameter represents only part of the
complete route metric. The complete metric is a combination of this
route metric offset added to the interface metric specified in the
Metric member of the MIB_IPINTERFACE_ROW structure of the associated
interface. An application can retrieve the interface metric by
calling the GetIpInterfaceEntry function. The Age and Origin members
of the MIB_IPFORWARD_ROW2 structure pointed to by the Row are ignored
when the CreateIpForwardEntry2 function is called. These members are
set by the network stack and cannot be set using the
CreateIpForwardEntry2 function. The CreateIpForwardEntry2 function
will fail if the DestinationPrefix and NextHop members of the
MIB_IPFORWARD_ROW2 pointed to by the Row parameter are a duplicate of
an existing IP route entry on the interface specified in the
InterfaceLuid or InterfaceIndex members. The CreateIpForwardEntry2
function can only be called by a user logged on as a member of the
Administrators group. If CreateIpForwardEntry2 is called by a user
that is not a member of the Administrators group, the function call
will fail and ERROR_ACCESS_DENIED is returned. This function can also
fail because of user account control (UAC) on Windows Vista and
later. If an application that contains this function is executed by a
user logged on as a member of the Administrators group other than the
built-in Administrator, this call will fail unless the application
has been marked in the manifest file with a requestedExecutionLevel
set to requireAdministrator. If the application lacks this manifest
file, a user logged on as a member of the Administrators group other
than the built-in Administrator must then be executing the
application in an enhanced shell as the built-in Administrator (RunAs
administrator) for this function to succeed.


%index
CreateIpNetEntry
The CreateIpNetEntry function creates an Address Resolution Protocol (ARP) entry in the ARP table on the local computer.
%group
Win32 iphlpapi
%prm
pArpEntry
pArpEntry : [var] A pointer to a MIB_IPNETROW structure that specifies information for the new entry. The caller must specify values for all members of this structure.
%inst
The CreateIpNetEntry function creates an Address Resolution Protocol
(ARP) entry in the ARP table on the local computer.

[戻り値]
The function returns NO_ERROR (zero) if the function is successful.
If the function fails, the return value is one of the following error
codes.
This doc was truncated.

[備考]
To modify an existing ARP entry, use the SetIpNetEntry function. To
retrieve the ARP table, call the GetIpNetTable function. To delete an
existing ARP entry, call the DeleteIpNetEntry. On Windows Vista and
later, the CreateIpNetEntry function can only be called by a user
logged on as a member of the Administrators group. If
CreateIpNetEntry is called by a user that is not a member of the
Administrators group, the function call will fail and
ERROR_ACCESS_DENIED is returned. The CreateIpNetEntry function can
also fail because of user account control (UAC) on Windows Vista
later. If an application that contains this function is executed by a
user logged on as a member of the Administrators group other than the
built-in Administrator, this call will fail unless the application
has been marked in the manifest file with a requestedExecutionLevel
set to requireAdministrator. If the application lacks this manifest
file, a user logged on as a member of the Administrators group other
than the built-in Administrator must then be executing the
application in an enhanced shell as the built-in Administrator (RunAs
administrator) for this function to succeed.
Note On Windows NT 4.0 and Windows 2000 and later, this function
executes a privileged operation. For this function to execute
successfully, the caller must be logged on as a member of the
Administrators group or the NetworkConfigurationOperators group.


%index
CreateIpNetEntry2
Creates a new neighbor IP address entry on the local computer.
%group
Win32 iphlpapi
%prm
Row
Row : [var] A pointer to a MIB_IPNET_ROW2 structure entry for a neighbor IP address entry.
%inst
Creates a new neighbor IP address entry on the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The CreateIpNetEntry2 function is defined on Windows Vista and later.
The CreateIpNetEntry2 function is used to add a new neighbor IP
address entry on a local computer. The Address member in the
MIB_IPNET_ROW2 structure pointed to by the Row parameter must be
initialized to a valid unicast, anycast, or multicast IPv4 or IPv6
address and family. The PhysicalAddress and PhysicalAddressLength
members in the MIB_IPNET_ROW2 structure pointed to by the Row
parameter must be initialized to a valid physical address. In
addition, at least one of the following members in the MIB_IPNET_ROW2
structure pointed to the Row parameter must be initialized to the
interface: the InterfaceLuid or InterfaceIndex. The fields are used
in the order listed above. So if the InterfaceLuid is specified, then
this member is used to determine the interface on which to add the
unicast IP address. If no value was set for the InterfaceLuid member
(the values of this member was set to zero), then the InterfaceIndex
member is next used to determine the interface. The CreateIpNetEntry2
function will fail if the IP address passed in the Address member of
the MIB_IPNET_ROW2 pointed to by the Row parameter is a duplicate of
an existing neighbor IP address on the interface. The
CreateIpNetEntry2 function can only be called by a user logged on as
a member of the Administrators group. If CreateIpNetEntry2 is called
by a user that is not a member of the Administrators group, the
function call will fail and ERROR_ACCESS_DENIED is returned. This
function can also fail because of user account control (UAC) on
Windows Vista and later. If an application that contains this
function is executed by a user logged on as a member of the
Administrators group other than the built-in Administrator, this call
will fail unless the application has been marked in the manifest file
with a requestedExecutionLevel set to requireAdministrator. If the
application lacks this manifest file, a user logged on as a member of
the Administrators group other than the built-in Administrator must
then be executing the application in an enhanced shell as the
built-in Administrator (RunAs administrator) for this function to
succeed.


%index
CreatePersistentTcpPortReservation
Creates a persistent TCP port reservation for a consecutive block of TCP ports on the local computer.
%group
Win32 iphlpapi
%prm
StartPort, NumberOfPorts, Token
StartPort : [int] The starting TCP port number in network byte order.
NumberOfPorts : [int] The number of TCP port numbers to reserve.
Token : [var] A pointer to a port reservation token that is returned if the function succeeds.
%inst
Creates a persistent TCP port reservation for a consecutive block of
TCP ports on the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The CreatePersistentTcpPortReservation function is defined on Windows
Vista and later. The CreatePersistentTcpPortReservation function is
used to add a persistent reservation for a block of TCP ports.
Applications and services which need to reserve ports fall into two
categories. The first category includes components which need a
particular port as part of their operation. Such components will
generally prefer to specify their required port at installation time
(in an application manifest, for example). The second category
includes components which need any available port or block of ports
at runtime. These two categories correspond to specific and wildcard
port reservation requests. Specific reservation requests may be
persistent or runtime, while wildcard port reservation requests are
only supported at runtime. The CreatePersistentTcpPortReservation
function provides the ability for an application or service to
reserve a persistent block of TCP ports. Persistent TCP port
reservations are recorded in a persistent store for the TCP module in
Windows. A caller obtains a persistent port reservation by specifying
how many ports are required and whether a specific range is needed.
If the request can be satisfied, the
CreatePersistentTcpPortReservation function returns a unique opaque
ULONG64 token, which subsequently identifies the reservation. A
persistent TCP port reservation may be released by calling the
DeletePersistentTcpPortReservation function. Note that the token for
a given persistent TCP port reservation may change each time the
system is restarted.
Windows does not implement inter-component security for persistent
reservations obtained using these functions. This means that if a
component is granted the ability to obtain any persistent port
reservations, that component automatically gains the ability to
consume any persistent port reservations granted to any other
component on the system. Process-level security is enforced for
runtime reservations, but such control cannot be extended to
persistent port reservations created using the
CreatePersistentTcpPortReservation or
CreatePersistentUdpPortReservation function.
Once a persistent TCP port reservation has been obtained, an
application can request port assignments from the TCP port
reservation by opening a TCP socket, then calling the WSAIoctl
function specifying the SIO_ASSOCIATE_PORT_RESERVATION IOCTL and
passing the reservation token before issuing a call to the bind
function on the socket. The SIO_ACQUIRE_PORT_RESERVATION IOCTL can be
used to request a runtime reservation for a block of TCP or UDP
ports. For runtime port reservations, the port pool requires that
reservations be consumed from the process on whose socket the
reservation was granted. Runtime port reservations last only as long
as the lifetime of the socket on which the
SIO_ACQUIRE_PORT_RESERVATION IOCTL was called. In contrast,
persistent port reservations created using the
CreatePersistentTcpPortReservation function may be consumed by any
process with the ability to obtain persistent reservations.
The CreatePersistentTcpPortReservation function can only be called by
a user logged on as a member of the Administrators group. If
CreatePersistentTcpPortReservation is called by a user that is not a
member of the Administrators group, the function call will fail and
ERROR_ACCESS_DENIED is returned. This function can also fail because
of user account control (UAC) on Windows Vista and later. If an
application that contains this function is executed by a user logged
on as a member of the Administrators group other than the built-in
Administrator, this call will fail unless the application has been
marked in the manifest file with a requestedExecutionLevel set to
requireAdministrator. If the application lacks this manifest file, a
user logged on as a member of the Administrators group other than the
built-in Administrator must then be executing the application in an
enhanced shell as the built-in Administrator (RunAs administrator)
for this function to succeed.


%index
CreatePersistentUdpPortReservation
Creates a persistent UDP port reservation for a consecutive block of UDP ports on the local computer.
%group
Win32 iphlpapi
%prm
StartPort, NumberOfPorts, Token
StartPort : [int] The starting UDP port number in network byte order.
NumberOfPorts : [int] The number of UDP port numbers to reserve.
Token : [var] A pointer to a port reservation token that is returned if the function succeeds.
%inst
Creates a persistent UDP port reservation for a consecutive block of
UDP ports on the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The CreatePersistentUdpPortReservation function is defined on Windows
Vista and later. The CreatePersistentUdpPortReservation function is
used to add a persistent reservation for a block of UDP ports.
Applications and services which need to reserve ports fall into two
categories. The first category includes components which need a
particular port as part of their operation. Such components will
generally prefer to specify their required port at installation time
(in an application manifest, for example). The second category
includes components which need any available port or block of ports
at runtime. These two categories correspond to specific and wildcard
port reservation requests. Specific reservation requests may be
persistent or runtime, while wildcard port reservation requests are
only supported at runtime. The CreatePersistentUdpPortReservation
function provides the ability for an application or service to
reserve persistently a block of UDP ports. Persistent TCP
reservations are recorded in a persistent store for the UDP module in
Windows. A caller obtains a persistent port reservation by specifying
how many ports are required and whether a specific range is needed.
If the request can be satisfied, the
CreatePersistentUdpPortReservation function returns a unique opaque
ULONG64 token, which subsequently identifies the reservation. A
persistent UDP port reservation may be released by calling the
DeletePersistentUdpPortReservation function. Note that the token for
a given persistent UDP port reservation may change each time the
system is restarted.
Windows does not implement inter-component security for persistent
reservations obtained using these functions. This means that if a
component is granted the ability to obtain any persistent port
reservations, that component automatically gains the ability to
consume any persistent port reservations granted to any other
component on the system. Process-level security is enforced for
runtime reservations, but such control cannot be extended to
persistent reservations created using the created using the
CreatePersistentTcpPortReservation or
CreatePersistentUdpPortReservation function.
Once a persistent UDP port reservation has been obtained, an
application can request port assignments from the UDP port
reservation by opening a UDP socket, then calling the WSAIoctl
function specifying the SIO_ASSOCIATE_PORT_RESERVATION IOCTL and
passing the reservation token before issuing a call to the bind
function on the socket. The SIO_ACQUIRE_PORT_RESERVATION IOCTL can be
used to request a runtime reservation for a block of TCP or UDP
ports. For runtime port reservations, the port pool requires that
reservations be consumed from the process on whose socket the
reservation was granted. Runtime port reservations last only as long
as the lifetime of the socket on which the
SIO_ACQUIRE_PORT_RESERVATION IOCTL was called. In contrast,
persistent port reservations created using the
CreatePersistentUdpPortReservation function may be consumed by any
process with the ability to obtain persistent reservations.
The CreatePersistentUdpPortReservation function can only be called by
a user logged on as a member of the Administrators group. If
CreatePersistentUdpPortReservation is called by a user that is not a
member of the Administrators group, the function call will fail and
ERROR_ACCESS_DENIED is returned. This function can also fail because
of user account control (UAC) on Windows Vista and later. If an
application that contains this function is executed by a user logged
on as a member of the Administrators group other than the built-in
Administrator, this call will fail unless the application has been
marked in the manifest file with a requestedExecutionLevel set to
requireAdministrator. If the application lacks this manifest file, a
user logged on as a member of the Administrators group other than the
built-in Administrator must then be executing the application in an
enhanced shell as the built-in Administrator (RunAs administrator)
for this function to succeed.


%index
CreateProxyArpEntry
The CreateProxyArpEnry function creates a Proxy Address Resolution Protocol (PARP) entry on the local computer for the specified IPv4 address.
%group
Win32 iphlpapi
%prm
dwAddress, dwMask, dwIfIndex
dwAddress : [int] The IPv4 address for which this computer acts as a proxy.
dwMask : [int] The subnet mask for the IPv4 address specified in dwAddress.
dwIfIndex : [int] The index of the interface on which to proxy ARP for the IPv4 address identified by dwAddress. In other words, when an ARP request for dwAddress is received on this interface, the local computer responds with the physical address of this interface. If this interface is of a type that does not support ARP, such as PPP, then the call fails.
%inst
The CreateProxyArpEnry function creates a Proxy Address Resolution
Protocol (PARP) entry on the local computer for the specified IPv4
address.

[戻り値]
The function returns NO_ERROR (zero) if the function is successful.
If the function fails, the return value is one of the following error
codes.
This doc was truncated.

[備考]
To retrieve the ARP table, call the GetIpNetTable function. To delete
an existing PARP entry, call the DeleteProxyArpEntry. On Windows
Vista and later, the CreateProxyArpEnry function can only be called
by a user logged on as a member of the Administrators group. If
CreateProxyArpEnry is called by a user that is not a member of the
Administrators group, the function call will fail and
ERROR_ACCESS_DENIED is returned. This function can also fail because
of user account control (UAC) on Windows Vista and later. If an
application that contains this function is executed by a user logged
on as a member of the Administrators group other than the built-in
Administrator, this call will fail unless the application has been
marked in the manifest file with a requestedExecutionLevel set to
requireAdministrator. If the application on Windows Vista and later
lacks this manifest file, a user logged on as a member of the
Administrators group other than the built-in Administrator must then
be executing the application in an enhanced shell as the built-in
Administrator (RunAs administrator) for this function to succeed.
Note This function executes a privileged operation. For this function
to execute successfully, the caller must be logged on as a member of
the Administrators group or the NetworkConfigurationOperators group.


%index
CreateSortedAddressPairs
Takes a supplied list of potential IP destination addresses, pairs the destination addresses with the host machine's local IP addresses, and sorts the pairs according to which address pair is best suited for communication between the two peers.
%group
Win32 iphlpapi
%prm
SourceAddressList, SourceAddressCount, DestinationAddressList, DestinationAddressCount, AddressSortOptions, SortedAddressPairList, SortedAddressPairCount
SourceAddressList : [var] Must be NULL. Reserved for future use.
SourceAddressCount : [int] Must be 0. Reserved for future use.
DestinationAddressList : [var] A pointer to an array of SOCKADDR_IN6 structures that contain a list of potential IPv6 destination addresses. Any IPv4 addresses must be represented in the IPv4-mapped IPv6 address format which enables an IPv6 only application to communicate with an IPv4 node.
DestinationAddressCount : [int] The number of destination addresses pointed to by the DestinationAddressList parameter.
AddressSortOptions : [int] Reserved for future use.
SortedAddressPairList : [var] A pointer to store an array of SOCKADDR_IN6_PAIR structures that contain a list of pairs of IPv6 addresses sorted in the preferred order of communication, if the function call is successful.
SortedAddressPairCount : [var] A pointer to store the number of address pairs pointed to by the SortedAddressPairList parameter, if the function call is successful.
%inst
Takes a supplied list of potential IP destination addresses, pairs
the destination addresses with the host machine's local IP addresses,
and sorts the pairs according to which address pair is best suited
for communication between the two peers.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The CreateSortedAddressPairs function is defined on Windows Vista and
later. The CreateSortedAddressPairs function takes a list of source
and destination IPv6 addresses, and returns a list of pairs of
addresses in sorted order. The list is sorted by which address pair
is best suited for communication between the source and destination
address. The list of source addresses pointed to by the
SourceAddressList is currently reserved for future and must be a NULL
pointer. The SourceAddressCount is currently reserved for future and
must be zero. The CreateSortedAddressPairs function currently uses
all of the host machine's local addresses for the source address
list.
The list of destination addresses is pointed to by the
DestinationAddressList parameter. The list of destination addresses
is an array of SOCKADDR_IN6 structures. Any IPv4 addresses must be
represented in the IPv4-mapped IPv6 address format which enables an
IPv6 only application to communicate with an IPv4 node. For more
information on the IPv4-mapped IPv6 address format, see Dual-Stack
Sockets. The DestinationAddressCount parameter contains the number of
destination addresses pointed to by the DestinationAddressList
parameter. The CreateSortedAddressPairs function supports a maximum
of 500 destination addresses. If the CreateSortedAddressPairs
function is successful, the SortedAddressPairList parameter points to
an array of SOCKADDR_IN6_PAIR structures that contain the sorted
address pairs. When this returned list is no longer required, free
the memory used by the list by calling the FreeMibTable function.


%index
CreateUnicastIpAddressEntry
Adds a new unicast IP address entry on the local computer.
%group
Win32 iphlpapi
%prm
Row
Row : [var] A pointer to a MIB_UNICASTIPADDRESS_ROW structure entry for a unicast IP address entry.
%inst
Adds a new unicast IP address entry on the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The CreateUnicastIpAddressEntry function is defined on Windows Vista
and later. The CreateUnicastIpAddressEntry function is used to add a
new unicast IP address entry on a local computer. The unicast IP
address added by the CreateUnicastIpAddressEntry function is not
persistent. The IP address exists only as long as the adapter object
exists. Restarting the computer destroys the IP address, as does
manually resetting the network interface card (NIC). Also, certain
PnP events may destroy the address. To create an IPv4 address that
persists, the EnableStatic method of the
Win32_NetworkAdapterConfiguration Class in the Windows Management
Instrumentation (WMI) controls may be used. The netsh command can
also be used to create a persistent IPv4 or IPv6 address. For more
information, please see the documentation on Netsh.exe in the Windows
Sockets documentation. The InitializeUnicastIpAddressEntry function
should be used to initialize the members of a
MIB_UNICASTIPADDRESS_ROW structure entry with default values. An
application can then change the members in the
MIB_UNICASTIPADDRESS_ROW entry it wishes to modify, and then call the
CreateUnicastIpAddressEntry function. The Address member in the
MIB_UNICASTIPADDRESS_ROW structure pointed to by the Row parameter
must be initialized to a valid unicast IPv4 or IPv6 address. The
si_family member of the SOCKADDR_INET structure in the Address member
must be initialized to either AF_INET or AF_INET6 and the related
Ipv4 or Ipv6 member of the SOCKADDR_INET structure must be set to a
valid unicast IP address. In addition, at least one of the following
members in the MIB_UNICASTIPADDRESS_ROW structure pointed to the Row
parameter must be initialized to the interface: the InterfaceLuid or
InterfaceIndex. The fields are used in the order listed above. So if
the InterfaceLuid is specified, then this member is used to determine
the interface on which to add the unicast IP address. If no value was
set for the InterfaceLuid member (the values of this member was set
to zero), then the InterfaceIndex member is next used to determine
the interface. If the OnLinkPrefixLength member of the
MIB_UNICASTIPADDRESS_ROW pointed to by the Row parameter is set to
255, then CreateUnicastIpAddressEntry will add the new unicast IP
address with the OnLinkPrefixLength member set equal to the length of
the IP address. So for a unicast IPv4 address, the OnLinkPrefixLength
is set to 32 and the OnLinkPrefixLength is set to 128 for a unicast
IPv6 address. If this would result in the incorrect subnet mask for
an IPv4 address or the incorrect link prefix for an IPv6 address,
then the application should set this member to the correct value
before calling CreateUnicastIpAddressEntry. If a unicast IP address
is created with the OnLinkPrefixLength member set incorrectly, then
the IP address may be changed by calling SetUnicastIpAddressEntry
with the OnLinkPrefixLength member set to the correct value. The
DadState, ScopeId, and CreationTimeStamp members of the
MIB_UNICASTIPADDRESS_ROW structure pointed to by the Row are ignored
when the CreateUnicastIpAddressEntry function is called. These
members are set by the network stack. The ScopeId member is
automatically determined by the interface on which the address is
added. Beginning in Windows 10, if DadState is set to
IpDadStatePreferred in the MIB_UNICASTIPADDRESS_ROW structure when
calling CreateUnicastIpAddressEntry, the stack will set the initial
DAD state of the address to “preferred” instead of “tentative” and
will do optimistic DAD for the address. The
CreateUnicastIpAddressEntry function will fail if the unicast IP
address passed in the Address member of the MIB_UNICASTIPADDRESS_ROW
pointed to by the Row parameter is a duplicate of an existing unicast
IP address on the interface. Note that a loopback IP address can only
be added to a loopback interface using the
CreateUnicastIpAddressEntry function. The unicast IP address passed
in the Address member of the MIB_UNICASTIPADDRESS_ROW pointed to by
the Row parameter is not usable immediately. The IP address is usable
after the duplicate address detection process has completed
successfully. It can take several seconds for the duplicate address
detection process to complete since IP packets need to be sent and
potential responses must be awaited. For IPv6, the duplicate address
detection process typically takes about a second. For IPv4, the
duplicate address detection process typically takes about three
seconds. If an application that needs to know when an IP address is
usable after a call to the CreateUnicastIpAddressEntry function,
there are two methods that can be used. One method uses polling and
the GetUnicastIpAddressEntry function. The second method calls one of
the notification functions, NotifyAddrChange,
NotifyIpInterfaceChange, or NotifyUnicastIpAddressChange to set up an
asynchronous notification for when an address changes. The following
method describes how to use the GetUnicastIpAddressEntry and polling.
After the call to the CreateUnicastIpAddressEntry function returns
successfully, pause for one to three seconds (depending on whether an
IPv6 or IPv4 address is being created) to allow time for the
successful completion of the duplication address detection process.
Then call the GetUnicastIpAddressEntry function to retrieve the
updated MIB_UNICASTIPADDRESS_ROW structure and examine the value of
the DadState member. If the value of the DadState member is set to
IpDadStatePreferred, the IP address is now usable. If the value of
the DadState member is set to IpDadStateTentative, then duplicate
address detection has not yet completed. In this case, call the
GetUnicastIpAddressEntry function again every half a second while the
DadState member is still set to IpDadStateTentative. If the value of
the DadState member returns with some value other than
IpDadStatePreferred or IpDadStateTentative, duplicate address
detection has failed and the IP address is not usable. The following
method describes how to use an appropriate notification function.
After the call to the CreateUnicastIpAddressEntry function returns
successfully, call the NotifyUnicastIpAddressChange function to
register to be notified of changes to either IPv6 or IPv4 unicast IP
addresses, depending on the type of IP address being created. When a
notification is received for the IP address being created, call the
GetUnicastIpAddressEntry function to retrieve the DadState member. If
the value of the DadState member is set to IpDadStatePreferred, the
IP address is now usable. If the value of the DadState member is set
to IpDadStateTentative, then duplicate address detection has not yet
completed and the application needs to wait for future notifications.
If the value of the DadState member returns with some value other
than IpDadStatePreferred or IpDadStateTentative, duplicate address
detection has failed and the IP address is not usable. If during the
duplicate address detection process the media is disconnected and
then reconnected, the duplicate address detection process is
restarted. So it is possible for the time to complete the process to
increase beyond the typical 1 second value for IPv6 or 3 second value
for IPv4. The CreateUnicastIpAddressEntry function can only be called
by a user logged on as a member of the Administrators group. If
CreateUnicastIpAddressEntry is called by a user that is not a member
of the Administrators group, the function call will fail and
ERROR_ACCESS_DENIED is returned. This function can also fail because
of user account control (UAC) on Windows Vista and later. If an
application that contains this function is executed by a user logged
on as a member of the Administrators group other than the built-in
Administrator, this call will fail unless the application has been
marked in the manifest file with a requestedExecutionLevel set to
requireAdministrator. If the application on lacks this manifest file,
a user logged on as a member of the Administrators group other than
the built-in Administrator must then be executing the application in
an enhanced shell as the built-in Administrator (RunAs administrator)
for this function to succeed.


%index
DeleteAnycastIpAddressEntry
Deletes an existing anycast IP address entry on the local computer.
%group
Win32 iphlpapi
%prm
Row
Row : [var] A pointer to a MIB_ANYCASTIPADDRESS_ROW  structure entry for an existing anycast IP address entry to delete from the local computer.
%inst
Deletes an existing anycast IP address entry on the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The DeleteAnycastIpAddressEntry function is defined on Windows Vista
and later. The DeleteAnycastIpAddressEntry function is used to delete
an existing MIB_ANYCASTIPADDRESS_ROW structure entry on the local
computer. On input, the Address member in the
MIB_ANYCASTIPADDRESS_ROW structure pointed to by the Row parameter
must be set to a valid unicast IPv4 or IPv6 address and family. In
addition, at least one of the following members in the
MIB_ANYCASTIPADDRESS_ROW structure pointed to the Row parameter must
be initialized: the InterfaceLuid or InterfaceIndex. The fields are
used in the order listed above. So if the InterfaceLuid is specified,
then this member is used to determine the interface. If no value was
set for the InterfaceLuid member (the values of this member was set
to zero), then the InterfaceIndex member is next used to determine
the interface. If the function is successful, the existing IP address
represented by the Row parameter was deleted. The
GetAnycastIpAddressTable function can be called to enumerate the
anycast IP address entries on a local computer. The
GetAnycastIpAddressEntry function can be called to retrieve a
specific existing anycast IP address entry. The
DeleteAnycastIpAddressEntry function can only be called by a user
logged on as a member of the Administrators group. If
DeleteAnycastIpAddressEntry is called by a user that is not a member
of the Administrators group, the function call will fail and
ERROR_ACCESS_DENIED is returned. This function can also fail because
of user account control (UAC) on Windows Vista and later. If an
application that contains this function is executed by a user logged
on as a member of the Administrators group other than the built-in
Administrator, this call will fail unless the application has been
marked in the manifest file with a requestedExecutionLevel set to
requireAdministrator. If the application lacks this manifest file, a
user logged on as a member of the Administrators group other than the
built-in Administrator must then be executing the application in an
enhanced shell as the built-in Administrator (RunAs administrator)
for this function to succeed.


%index
DeleteIPAddress
The DeleteIPAddress function deletes an IP address previously added using AddIPAddress.
%group
Win32 iphlpapi
%prm
NTEContext
NTEContext : [int] The Net Table Entry (NTE) context for the IP address. This context was returned by the previous call to AddIPAddress.
%inst
The DeleteIPAddress function deletes an IP address previously added
using AddIPAddress.

[戻り値]
The function returns NO_ERROR (zero) if the function is successful.
If the function fails, the return value is one of the following error
codes.
This doc was truncated.

[備考]
On Windows Vista and later, the DeleteIPAddress function can only be
called by a user logged on as a member of the Administrators group.
If DeleteIPAddress is called by a user that is not a member of the
Administrators group, the function call will fail and
ERROR_ACCESS_DENIED is returned. This function can also fail because
of user account control (UAC) on Windows Vista and later. If an
application that contains this function is executed by a user logged
on as a member of the Administrators group other than the built-in
Administrator, this call will fail unless the application has been
marked in the manifest file with a requestedExecutionLevel set to
requireAdministrator. If the application on Windows Vista and later
lacks this manifest file, a user logged on as a member of the
Administrators group other than the built-in Administrator must then
be executing the application in an enhanced shell as the built-in
Administrator (RunAs administrator) for this function to succeed.
Note On Windows NT 4.0 and Windows 2000 and later, this function
executes a privileged operation. For this function to execute
successfully, the caller must be logged on as a member of the
Administrators group or the NetworkConfigurationOperators group.


%index
DeleteIpForwardEntry
Deletes an existing route in the local computer's IPv4 routing table.
%group
Win32 iphlpapi
%prm
pRoute
pRoute : [var] A pointer to an MIB_IPFORWARDROW structure. This structure specifies information that identifies the route to delete. The caller must specify values for the dwForwardIfIndex, dwForwardDest, dwForwardMask, dwForwardNextHop,  and dwForwardProto members of the structure.
%inst
Deletes an existing route in the local computer's IPv4 routing table.

[戻り値]
The function returns NO_ERROR (zero) if the routine is successful. If
the function fails, the return value is one of the following error
codes.
This doc was truncated.

[備考]
The dwForwardProto member of MIB_IPFORWARDROW structure pointer to by
the route parameter must be set to MIB_IPPROTO_NETMGMT otherwise
DeleteIpForwardEntry will fail. Routing protocol identifiers are used
to identify route information for the specified routing protocol. For
example, MIB_IPPROTO_NETMGMT is used to identify route information
for IP routing set through network management such as the Dynamic
Host Configuration Protocol (DHCP), the Simple Network Management
Protocol (SNMP), or by calls to the CreateIpForwardEntry,
DeleteIpForwardEntry , or SetIpForwardEntry functions. On Windows
Vista and Windows Server 2008, the DeleteIpForwardEntry only works on
interfaces with a single sub-interface (where the interface LUID and
subinterface LUID are the same). The dwForwardIfIndex member of the
MIB_IPFORWARDROW structure specifies the interface. A number of
members of the MIB_IPFORWARDROW structure pointed to by the route
parameter are not currently used by CreateIpForwardEntry. These
members include dwForwardPolicy, dwForwardType, dwForwardAge,
dwForwardNextHopAS, dwForwardMetric1, dwForwardMetric2,
dwForwardMetric3, dwForwardMetric4, and dwForwardMetric5. To modify
an existing route in the IPv4 routing table, use the
SetIpForwardEntry function. To retrieve the IPv4 routing table, call
the GetIpForwardTable function. On Windows Vista and later, the
DeleteIpForwardEntry function can only be called by a user logged on
as a member of the Administrators group. If DeleteIpForwardEntry is
called by a user that is not a member of the Administrators group,
the function call will fail and ERROR_ACCESS_DENIED is returned. The
DeleteIpForwardEntry function can also fail because of user account
control (UAC) on Windows Vista and later. If an application that
contains this function is executed by a user logged on as a member of
the Administrators group other than the built-in Administrator, this
call will fail unless the application has been marked in the manifest
file with a requestedExecutionLevel set to requireAdministrator. If
the application lacks this manifest file, a user logged on as a
member of the Administrators group other than the built-in
Administrator must then be executing the application in an enhanced
shell as the built-in Administrator (RunAs administrator) for this
function to succeed.
Note On Windows NT 4.0 and Windows 2000 and later, this function
executes a privileged operation. For this function to execute
successfully, the caller must be logged on as a member of the
Administrators group or the NetworkConfigurationOperators group.


%index
DeleteIpForwardEntry2
Deletes an IP route entry on the local computer.
%group
Win32 iphlpapi
%prm
Row
Row : [var] A pointer to a MIB_IPFORWARD_ROW2 structure entry for an IP route entry. On successful return, this entry will be deleted.
%inst
Deletes an IP route entry on the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The DeleteIpForwardEntry2 function is defined on Windows Vista and
later. The DeleteIpForwardEntry2 function is used to delete a
MIB_IPFORWARD_ROW2 structure entry. On input, the DestinationPrefix
member in the MIB_IPFORWARD_ROW2 structure pointed to by the Row
parameter must be initialized to a valid IPv4 or IPv6 address prefix
and family. On input, the NextHop member in the MIB_IPFORWARD_ROW2
structure pointed to by the Row parameter must be initialized to a
valid IPv4 or IPv6 address and family. In addition, at least one of
the following members in the MIB_IPFORWARD_ROW2 structure pointed to
the Row parameter must be initialized: the InterfaceLuid or
InterfaceIndex. The fields are used in the order listed above. So if
the InterfaceLuid is specified, then this member is used to determine
the interface. If no value was set for the InterfaceLuid member (the
values of this member was set to zero), then the InterfaceIndex
member is next used to determine the interface. On output when the
call is successful, DeleteIpForwardEntry2 deletes the IP route entry.
The DeleteIpForwardEntry2 function will fail if the DestinationPrefix
and NextHop members of the MIB_IPFORWARD_ROW2 pointed to by the Row
parameter do not match an existing IP route entry on the interface
specified in the InterfaceLuid or InterfaceIndex members. The
GetIpForwardTable2 function can be called to enumerate the IP route
entries on a local computer. The DeleteIpForwardEntry2 function can
only be called by a user logged on as a member of the Administrators
group. If DeleteIpForwardEntry2 is called by a user that is not a
member of the Administrators group, the function call will fail and
ERROR_ACCESS_DENIED is returned. This function can also fail because
of user account control (UAC) on Windows Vista and later. If an
application that contains this function is executed by a user logged
on as a member of the Administrators group other than the built-in
Administrator, this call will fail unless the application has been
marked in the manifest file with a requestedExecutionLevel set to
requireAdministrator. If the application lacks this manifest file, a
user logged on as a member of the Administrators group other than the
built-in Administrator must then be executing the application in an
enhanced shell as the built-in Administrator (RunAs administrator)
for this function to succeed.


%index
DeleteIpNetEntry
The DeleteIpNetEntry function deletes an ARP entry from the ARP table on the local computer.
%group
Win32 iphlpapi
%prm
pArpEntry
pArpEntry : [var] A pointer to a MIB_IPNETROW structure. The information in this structure specifies the entry to delete. The caller must specify values for at least the dwIndex and dwAddr members of this structure.
%inst
The DeleteIpNetEntry function deletes an ARP entry from the ARP table
on the local computer.

[戻り値]
The function returns NO_ERROR (zero) if the function is successful.
If the function fails, the return value is one of the following error
codes.
This doc was truncated.

[備考]
To retrieve the ARP table, call the GetIpNetTable function. On
Windows Vista and later, the DeleteIpNetEntry function can only be
called by a user logged on as a member of the Administrators group.
If DeleteIpNetEntry is called by a user that is not a member of the
Administrators group, the function call will fail and
ERROR_ACCESS_DENIED is returned. The DeleteIpNetEntry function can
also fail because of user account control (UAC) on Windows Vista and
later. If an application that contains this function is executed by a
user logged on as a member of the Administrators group other than the
built-in Administrator, this call will fail unless the application
has been marked in the manifest file with a requestedExecutionLevel
set to requireAdministrator. If the application lacks this manifest
file, a user logged on as a member of the Administrators group other
than the built-in Administrator must then be executing the
application in an enhanced shell as the built-in Administrator (RunAs
administrator) for this function to succeed.
Note On Windows NT 4.0 and Windows 2000 and later, this function
executes a privileged operation. For this function to execute
successfully, the caller must be logged on as a member of the
Administrators group or the NetworkConfigurationOperators group.


%index
DeleteIpNetEntry2
Deletes a neighbor IP address entry on the local computer.
%group
Win32 iphlpapi
%prm
Row
Row : [var] A pointer to a MIB_IPNET_ROW2 structure entry for a neighbor IP address entry. On successful return, this entry will be deleted.
%inst
Deletes a neighbor IP address entry on the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The DeleteIpNetEntry2 function is defined on Windows Vista and later.
The DeleteIpNetEntry2 function is used to delete a MIB_IPNET_ROW2
structure entry. On input, the Address member in the MIB_IPNET_ROW2
structure pointed to by the Row parameter must be initialized to a
valid neighbor IPv4 or IPv6 address and family. In addition, at least
one of the following members in the MIB_IPNET_ROW2 structure pointed
to the Row parameter must be initialized: the InterfaceLuid or
InterfaceIndex. The fields are used in the order listed above. So if
the InterfaceLuid is specified, then this member is used to determine
the interface. If no value was set for the InterfaceLuid member (the
values of this member was set to zero), then the InterfaceIndex
member is next used to determine the interface. On output when the
call is successful, DeleteIpNetEntry2 deletes the neighbor IP
address. The GetIpNetTable2 function can be called to enumerate the
neighbor IP address entries on a local computer. The
DeleteIpNetEntry2 function can only be called by a user logged on as
a member of the Administrators group. If DeleteIpNetEntry2 is called
by a user that is not a member of the Administrators group, the
function call will fail and ERROR_ACCESS_DENIED is returned. This
function can also fail because of user account control (UAC) on
Windows Vista and later. If an application that contains this
function is executed by a user logged on as a member of the
Administrators group other than the built-in Administrator, this call
will fail unless the application has been marked in the manifest file
with a requestedExecutionLevel set to requireAdministrator. If the
application lacks this manifest file, a user logged on as a member of
the Administrators group other than the built-in Administrator must
then be executing the application in an enhanced shell as the
built-in Administrator (RunAs administrator) for this function to
succeed.


%index
DeletePersistentTcpPortReservation
Deletes a persistent TCP port reservation for a consecutive block of TCP ports on the local computer. (DeletePersistentTcpPortReservation)
%group
Win32 iphlpapi
%prm
StartPort, NumberOfPorts
StartPort : [int] The starting TCP port number in network byte order.
NumberOfPorts : [int] The number of TCP port numbers to delete.
%inst
Deletes a persistent TCP port reservation for a consecutive block of
TCP ports on the local computer. (DeletePersistentTcpPortReservation)

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The DeletePersistentTcpPortReservation function is defined on Windows
Vista and later. The DeletePersistentTcpPortReservation function is
used to delete a persistent reservation for a block of TCP ports. The
DeletePersistentTcpPortReservation function can only be called by a
user logged on as a member of the Administrators group. If
DeletePersistentTcpPortReservation is called by a user that is not a
member of the Administrators group, the function call will fail and
ERROR_ACCESS_DENIED is returned. This function can also fail because
of user account control (UAC) on Windows Vista and later. If an
application that contains this function is executed by a user logged
on as a member of the Administrators group other than the built-in
Administrator, this call will fail unless the application has been
marked in the manifest file with a requestedExecutionLevel set to
requireAdministrator. If the application lacks this manifest file, a
user logged on as a member of the Administrators group other than the
built-in Administrator must then be executing the application in an
enhanced shell as the built-in Administrator (RunAs administrator)
for this function to succeed.


%index
DeletePersistentUdpPortReservation
Deletes a persistent TCP port reservation for a consecutive block of TCP ports on the local computer. (DeletePersistentUdpPortReservation)
%group
Win32 iphlpapi
%prm
StartPort, NumberOfPorts
StartPort : [int] The starting UDP port number in network byte order.
NumberOfPorts : [int] The number of UDP port numbers to delete.
%inst
Deletes a persistent TCP port reservation for a consecutive block of
TCP ports on the local computer. (DeletePersistentUdpPortReservation)

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The DeletePersistentUdpPortReservation function is defined on Windows
Vista and later. The DeletePersistentUdpPortReservation function is
used to delete a persistent reservation for a block of UDP ports. The
DeletePersistentUdpPortReservation function can only be called by a
user logged on as a member of the Administrators group. If
DeletePersistentUdpPortReservation is called by a user that is not a
member of the Administrators group, the function call will fail and
ERROR_ACCESS_DENIED is returned. This function can also fail because
of user account control (UAC) on Windows Vista and later. If an
application that contains this function is executed by a user logged
on as a member of the Administrators group other than the built-in
Administrator, this call will fail unless the application has been
marked in the manifest file with a requestedExecutionLevel set to
requireAdministrator. If the application lacks this manifest file, a
user logged on as a member of the Administrators group other than the
built-in Administrator must then be executing the application in an
enhanced shell as the built-in Administrator (RunAs administrator)
for this function to succeed.


%index
DeleteProxyArpEntry
The DeleteProxyArpEntry function deletes the PARP entry on the local computer specified by the dwAddress and dwIfIndex parameters.
%group
Win32 iphlpapi
%prm
dwAddress, dwMask, dwIfIndex
dwAddress : [int] The IPv4 address for which this computer is acting as a proxy.
dwMask : [int] The subnet mask for the IPv4 address specified in the dwAddress parameter.
dwIfIndex : [int] The index of the interface on which this computer is supporting proxy ARP for the IP address specified by the dwAddress parameter.
%inst
The DeleteProxyArpEntry function deletes the PARP entry on the local
computer specified by the dwAddress and dwIfIndex parameters.

[戻り値]
The function returns NO_ERROR (zero) if the function is successful.
If the function fails, the return value is one of the following error
codes.
This doc was truncated.

[備考]
To retrieve the ARP table, call the GetIpNetTable function. On
Windows Vista and later, the DeleteProxyArpEntry function can only be
called by a user logged on as a member of the Administrators group.
If DeleteProxyArpEntry is called by a user that is not a member of
the Administrators group, the function call will fail and
ERROR_ACCESS_DENIED is returned. This function can also fail because
of user account control (UAC) on Windows Vista and later. If an
application that contains this function is executed by a user logged
on as a member of the Administrators group other than the built-in
Administrator, this call will fail unless the application has been
marked in the manifest file with a requestedExecutionLevel set to
requireAdministrator. If the application on Windows Vista and later
lacks this manifest file, a user logged on as a member of the
Administrators group other than the built-in Administrator must then
be executing the application in an enhanced shell as the built-in
Administrator (RunAs administrator) for this function to succeed.
Note This function executes a privileged operation. For this function
to execute successfully, the caller must be logged on as a member of
the Administrators group or the NetworkConfigurationOperators group.


%index
DeleteUnicastIpAddressEntry
Deletes an existing unicast IP address entry on the local computer.
%group
Win32 iphlpapi
%prm
Row
Row : [var] A pointer to a MIB_UNICASTIPADDRESS_ROW structure entry for an existing unicast IP address entry to delete from the local computer.
%inst
Deletes an existing unicast IP address entry on the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The DeleteUnicastIpAddressEntry function is defined on Windows Vista
and later. The DeleteUnicastIpAddressEntry function is used to delete
an existing MIB_UNICASTIPADDRESS_ROW structure entry on the local
computer. On input, the Address member in the
MIB_UNICASTIPADDRESS_ROW structure pointed to by the Row parameter
must be set to a valid unicast IPv4 or IPv6 address and family. In
addition, at least one of the following members in the
MIB_UNICASTIPADDRESS_ROW structure pointed to the Row parameter must
be initialized: the InterfaceLuid or InterfaceIndex. The fields are
used in the order listed above. So if the InterfaceLuid is specified,
then this member is used to determine the interface. If no value was
set for the InterfaceLuid member (the values of this member was set
to zero), then the InterfaceIndex member is next used to determine
the interface. If the function is successful, the existing IP address
represented by the Row parameter was deleted. The
GetUnicastIpAddressTable function can be called to enumerate the
unicast IP address entries on a local computer. The
GetUnicastIpAddressEntry function can be called to retrieve a
specific existing unicast IP address entry. The
DeleteUnicastIpAddressEntry function can only be called by a user
logged on as a member of the Administrators group. If
DeleteUnicastIpAddressEntry is called by a user that is not a member
of the Administrators group, the function call will fail and
ERROR_ACCESS_DENIED is returned. This function can also fail because
of user account control (UAC) on Windows Vista and later. If an
application that contains this function is executed by a user logged
on as a member of the Administrators group other than the built-in
Administrator, this call will fail unless the application has been
marked in the manifest file with a requestedExecutionLevel set to
requireAdministrator. If the application lacks this manifest file, a
user logged on as a member of the Administrators group other than the
built-in Administrator must then be executing the application in an
enhanced shell as the built-in Administrator (RunAs administrator)
for this function to succeed.


%index
DisableMediaSense
The DisableMediaSense function disables the media sensing capability of the TCP/IP stack on a local computer.
%group
Win32 iphlpapi
%prm
pHandle, pOverLapped
pHandle : [intptr] A pointer to a variable that is used to store a handle. If the pOverlapped parameter is not NULL, this variable will be used internally to store a handle required to call the IP driver and disable the media sensing capability. An application should not use the value pointed to by this variable. This handle is for internal use and should not be closed.
pOverLapped : [var] A pointer to an OVERLAPPED structure. Except for the hEvent member, all members of this structure must be set to zero. The hEvent member requires a handle to a valid event object. Use the CreateEvent function to create this event object.
%inst
The DisableMediaSense function disables the media sensing capability
of the TCP/IP stack on a local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
If the pHandle or pOverlapped parameters are NULL, the
DisableMediaSense function is executed synchronously. If both the
pHandle and pOverlapped parameters are not NULL, the
DisableMediaSense function is executed asynchronously using the
OVERLAPPED structure pointed to by the pOverlapped parameter. The
DisableMediaSense function does not complete until the
RestoreMediaSense function is called later to restore the media
sensing capability. Until then, an I/O request packet (IRP) remains
queued up. Alternatively, when the process that called
DisableMediaSense exits, the IRP is canceled and a cancel routine is
called that would again restore the media sensing capability.
To call DisableMediaSense synchronously, an application needs to
create a separate thread for this call. Otherwise it would keep
waiting for IRP completion and the function will block. To call
DisableMediaSense asynchronously, an application needs to allocate an
OVERLAPPED structure. Except for the hEvent member, all members of
this structure must be set to zero. The hEvent member requires a
handle to a valid event object. Use the CreateEvent function to
create this event. When called asynchronously, DisableMediaSense
always returns ERROR_IO_PENDING. The IRP will be completed only when
RestoreMediaSense is called later. Use the CloseHandle function to
close the handle to the event object when it is no longer needed. The
system closes the handle automatically when the process terminates.
The event object is destroyed when its last handle has been closed.
On Windows Server 2003and Windows XP, the TCP/IP stack implements a
policy of deleting all IP addresses on an interface in response to a
media sense disconnect event from an underlying network interface. If
a network switch or hub that the local computer is connected to is
powered off, or a network cable is disconnected, the network
interface will deliver disconnection events. IP configuration
information associated with the network interface is lost. As a
result, the TCP/IP stack implements a policy of hiding disconnected
interfaces so these interfaces and their associated IP addresses do
not show up in configuration information retrieved through IP helper.
This policy prevents some applications from easily detecting that a
network interface is merely disconnected, rather than removed from
the system. This behavior does not normally impact a local client
computer if it is using DHCP requests to a DHCP server for IP
configuration information. But this can have a serious impact on
server computers, particularly computers used as part of clusters.
The DisableMediaSense function can be used to temporarily disable the
media sensing capability for these cases. At some later time, the
RestoreMediaSense function would be called to restore the media
sensing capability. The following registry setting is related to the
DisableMediaSense and RestoreMediaSense functions:

System\CurrentControlSet\Services\Tcpip\Parameters\DisableDHCPMediaSense
There is an internal flag in Windows that is set if this registry key
exists when the machine first boots up. The same internal flag also
gets set and reset by calling DisableMediaSense and
RestoreMediaSense. However with registry setting, you need to reboot
the machine for the changes to take place.
The TCP/IP stack on Windows Vista and later was changed to not hide
disconnected interfaces when a disconnect event occurs. So on Windows
Vista and later, the DisableMediaSense and RestoreMediaSense
functions don't do anything and always returns NO_ERROR.


%index
EnableRouter
The EnableRouter function turns on IPv4 forwarding on the local computer. EnableRouter also increments a reference count that tracks the number of requests to enable IPv4 forwarding.
%group
Win32 iphlpapi
%prm
pHandle, pOverlapped
pHandle : [intptr] A pointer to a handle. This parameter is currently unused.
pOverlapped : [var] A pointer to an OVERLAPPED structure. Except for the hEvent member, all members of this structure should be set to zero. The hEvent member should contain a handle to a valid event object. Use the CreateEvent function to create this event object.
%inst
The EnableRouter function turns on IPv4 forwarding on the local
computer. EnableRouter also increments a reference count that tracks
the number of requests to enable IPv4 forwarding.

[戻り値]
If the EnableRouter function succeeds, the return value is
ERROR_IO_PENDING. If the function fails, use FormatMessage to obtain
the message string for the returned error.
This doc was truncated.

[備考]
The EnableRouter function is specific to IPv4 forwarding. If the
process that calls EnableRouter terminates without calling
UnenableRouter, the system decrements the reference count that tracks
the number of requests to enable IPv4 forwarding as though the
process had called UnenableRouter.


%index
FlushIpNetTable
The FlushIpNetTable function deletes all ARP entries for the specified interface from the ARP table on the local computer.
%group
Win32 iphlpapi
%prm
dwIfIndex
dwIfIndex : [int] The index of the interface for which to delete all ARP entries.
%inst
The FlushIpNetTable function deletes all ARP entries for the
specified interface from the ARP table on the local computer.

[戻り値]
The function returns NO_ERROR (zero) if the function is successful.
If the function fails, the return value is one of the following error
codes.
This doc was truncated.

[備考]
To retrieve the ARP table, call the GetIpNetTable function. On
Windows Vista and later, the FlushIpNetTable function can only be
called by a user logged on as a member of the Administrators group.
If FlushIpNetTable is called by a user that is not a member of the
Administrators group, the function call will fail and
ERROR_ACCESS_DENIED is returned. This function can also fail because
of user account control (UAC) on Windows Vista and later. If an
application that contains this function is executed by a user logged
on as a member of the Administrators group other than the built-in
Administrator, this call will fail unless the application has been
marked in the manifest file with a requestedExecutionLevel set to
requireAdministrator. If the application on Windows Vista and later
lacks this manifest file, a user logged on as a member of the
Administrators group other than the built-in Administrator must then
be executing the application in an enhanced shell as the built-in
Administrator (RunAs administrator) for this function to succeed.
Note This function executes a privileged operation. For this function
to execute successfully, the caller must be logged on as a member of
the Administrators group or the NetworkConfigurationOperators group.


%index
FlushIpNetTable2
The FlushIpNetTable2 function flushes the IP neighbor table on the local computer.
%group
Win32 iphlpapi
%prm
Family, InterfaceIndex
Family : [int] The address family to flush. Possible values for the address family are listed in the Winsock2.h header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, AF_INET and PF_INET), so either constant can be used. On the Windows SDK released for Windows?Vista and later, the organization of header files has changed and possible values for this member are defined in the Ws2def.h header file. Note that the Ws2def.h header file is automatically included in Winsock2.h, and should never be used directly. The values currently supported are AF_INET, AF_INET6, and AF_UNSPEC.
InterfaceIndex : [int] The interface index.  If the index is specified, flush the neighbor IP address entries on a specific interface, otherwise flush the neighbor IP address entries on all the interfaces. To ignore the interface, set this parameter to zero.
%inst
The FlushIpNetTable2 function flushes the IP neighbor table on the
local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The FlushIpNetTable2 function is defined on Windows Vista and later.
The FlushIpNetTable2 function flushes or deletes the neighbor IP
addresses on a local system. The Family parameter can be used to
limit neighbor IP addresses to delete to a particular IP address
family. If neighbor IP addresses for both IPv4 and IPv6 should be
deleted, set the Family parameter to AF_UNSPEC. The InterfaceIndex
parameter can be used to limit neighbor IP addresses to delete to a
particular interface. If neighbor IP addresses for all interfaces
should be deleted, set the InterfaceIndex parameter to zero. The
Family parameter must be initialized to either AF_INET, AF_INET6, or
AF_UNSPEC. The FlushIpNetTable2 function can only be called by a user
logged on as a member of the Administrators group. If
FlushIpNetTable2 is called by a user that is not a member of the
Administrators group, the function call will fail and
ERROR_ACCESS_DENIED is returned. This function can also fail because
of user account control (UAC) on Windows Vista and later. If an
application that contains this function is executed by a user logged
on as a member of the Administrators group other than the built-in
Administrator, this call will fail unless the application has been
marked in the manifest file with a requestedExecutionLevel set to
requireAdministrator. If the application lacks this manifest file, a
user logged on as a member of the Administrators group other than the
built-in Administrator must then be executing the application in an
enhanced shell as the built-in Administrator (RunAs administrator)
for this function to succeed.


%index
FlushIpPathTable
The FlushIpPathTable function flushes the IP path table on the local computer.
%group
Win32 iphlpapi
%prm
Family
Family : [int] The address family to flush. Possible values for the address family are listed in the Winsock2.h header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, AF_INET and PF_INET), so either constant can be used. On the Windows SDK released for Windows?Vista and later, the organization of header files has changed and possible values for this member are defined in the Ws2def.h header file. Note that the Ws2def.h header file is automatically included in Winsock2.h, and should never be used directly. The values currently supported are AF_INET, AF_INET6, and AF_UNSPEC.
%inst
The FlushIpPathTable function flushes the IP path table on the local
computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The FlushIpPathTable function is defined on Windows Vista and later.
The FlushIpPathTable function flushes or deletes the IP path entries
on a local system. The Family parameter can be used to limit the IP
path entries to delete to a particular IP address family. If IP path
entries for both IPv4 and IPv6 should be deleted, set the Family
parameter to AF_UNSPEC. The Family parameter must be initialized to
either AF_INET, AF_INET6, or AF_UNSPEC. The FlushIpPathTable function
can only be called by a user logged on as a member of the
Administrators group. If FlushIpPathTable is called by a user that is
not a member of the Administrators group, the function call will fail
and ERROR_ACCESS_DENIED is returned. This function can also fail
because of user account control (UAC) on Windows Vista and later. If
an application that contains this function is executed by a user
logged on as a member of the Administrators group other than the
built-in Administrator, this call will fail unless the application
has been marked in the manifest file with a requestedExecutionLevel
set to requireAdministrator. If the application lacks this manifest
file, a user logged on as a member of the Administrators group other
than the built-in Administrator must then be executing the
application in an enhanced shell as the built-in Administrator (RunAs
administrator) for this function to succeed.


%index
FreeDnsSettings
(no summary)
%group
Win32 iphlpapi
%prm
Settings
Settings : [var] 
%inst



%index
FreeInterfaceDnsSettings
Frees the settings object returned by [GetInterfaceDnsSettings](/windows/win32/api/netioapi/nf-netioapi-getinterfacednssettings).
%group
Win32 iphlpapi
%prm
Settings
Settings : [var] 
%inst
Frees the settings object returned by
[GetInterfaceDnsSettings](/windows/win32/api/netioapi/nf-netioapi-getinterfacednssettings).


%index
FreeMibTable
Frees the buffer allocated by the functions that return tables of network interfaces, addresses, and routes (GetIfTable2 and GetAnycastIpAddressTable, for example).
%group
Win32 iphlpapi
%prm
Memory
Memory : [intptr] A pointer to the buffer to free.
%inst
Frees the buffer allocated by the functions that return tables of
network interfaces, addresses, and routes (GetIfTable2 and
GetAnycastIpAddressTable, for example).

[戻り値]
This function does not return a value.

[備考]
The FreeMibTable function is defined on Windows Vista and later. The
FreeMibTable function is used to free the internal buffers used by
various functions to retrieve tables of interfaces, addresses, and
routes. When these tables are no longer needed, then FreeMibTable
should be called to release the memory used by these tables.


%index
GetAdapterIndex
The GetAdapterIndex function obtains the index of an adapter, given its name.
%group
Win32 iphlpapi
%prm
AdapterName, IfIndex
AdapterName : [wstr] A pointer to a Unicode string that specifies the name of the adapter.
IfIndex : [var] A pointer to a ULONG variable that points to the index of the adapter.
%inst
The GetAdapterIndex function obtains the index of an adapter, given
its name.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, use FormatMessage to obtain the message string for
the returned error.

[備考]
Until an adapter is fully disabled, the GetAdapterIndex function
reports the adapter as present. For example, the NotifyAddrChange
function may indicate a recently disabled adapter's IP address is
removed, but GetAdapterIndex continues to report an adapter index
until the process of disabling the adapter is complete. When one or
more adapters are present on the system, GetAdapterIndex returns
ERROR_DEV_NOT_EXIST when the adapter being queried does not exist.
When no adapters are present, the GetAdapterIndex function returns
ERROR_NO_DATA. The adapter index may change when an adapter is
disabled and then enabled, or under other circumstances, and should
not be considered persistent.


%index
GetAdapterOrderMap
The GetAdapterOrderMap function obtains an adapter order map that indicates priority for interfaces on the local computer.
%group
Win32 iphlpapi
%prm

%inst
The GetAdapterOrderMap function obtains an adapter order map that
indicates priority for interfaces on the local computer.

[戻り値]
Returns an IP_ADAPTER_ORDER_MAP structure filled with adapter
priority information. See the IP_ADAPTER_ORDER_MAP structure for more
information.

[備考]
Interface indices appear in the order specified in the Adapters and
Bindings dialog box in the Advanced Settings property sheet. This
ordering is used as a tie breaker controlling the sequence in which
interfaces are used on multihomed systems for situations including
route selection, DNS name resolution, and other network related
operations. This function should not be called directly. Instead, use
the IP_ADAPTER_INFO structure returned in a GetAdaptersInfo function
call. Note The caller is responsible for calling the LocalFree
function to free the array returned by GetAdapterOrderMap.


%index
GetAdaptersAddresses
Retrieves the addresses associated with the adapters on the local computer.
%group
Win32 iphlpapi
%prm
Family, Flags, Reserved, AdapterAddresses, SizePointer
Family : [int] 
Flags : [int] The type of addresses to retrieve. The possible values are defined in the Iptypes.h header file. Note that the Iptypes.h header file is automatically included in Iphlpapi.h, and should never be used directly.
Reserved : [intptr] This parameter is not currently used, but is reserved for future system use. The calling application should pass NULL for this parameter.
AdapterAddresses : [var] A pointer to a buffer that contains a linked list of IP_ADAPTER_ADDRESSES structures on successful return.
SizePointer : [var] A pointer to a variable that specifies the size of the buffer pointed to by AdapterAddresses.
%inst
Retrieves the addresses associated with the adapters on the local
computer.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS (defined
to the same value as NO_ERROR). If the function fails, the return
value is one of the following error codes.
This doc was truncated.

[備考]
The GetAdaptersAddresses function can retrieve information for IPv4
and IPv6 addresses. Addresses are returned as a linked list of
IP_ADAPTER_ADDRESSES structures in the buffer pointed to by the
AdapterAddresses parameter. The application that calls the
GetAdaptersAddresses function must allocate the amount of memory
needed to return the IP_ADAPTER_ADDRESSES structures pointed to by
the AdapterAddresses parameter. When these returned structures are no
longer required, the application should free the memory allocated.
This can be accomplished by calling the HeapAlloc function to
allocate memory and later calling the HeapFree function to free the
allocated memory, as shown in the example code. Other memory
allocation and free functions can be used as long as the same family
of functions are used for both the allocation and the free function.
GetAdaptersAddresses is implemented only as a synchronous function
call. The GetAdaptersAddresses function requires a significant amount
of network resources and time to complete since all of the low-level
network interface tables must be traversed. One method that can be
used to determine the memory needed to return the
IP_ADAPTER_ADDRESSES structures pointed to by the AdapterAddresses
parameter is to pass too small a buffer size as indicated in the
SizePointer parameter in the first call to the GetAdaptersAddresses
function, so the function will fail with ERROR_BUFFER_OVERFLOW. When
the return value is ERROR_BUFFER_OVERFLOW, the SizePointer parameter
returned points to the required size of the buffer to hold the
adapter information. Note that it is possible for the buffer size
required for the IP_ADAPTER_ADDRESSES structures pointed to by the
AdapterAddresses parameter to change between subsequent calls to the
GetAdaptersAddresses function if an adapter address is added or
removed. However, this method of using the GetAdaptersAddresses
function is strongly discouraged. This method requires calling the
GetAdaptersAddresses function multiple times. The recommended method
of calling the GetAdaptersAddresses function is to pre-allocate a
15KB working buffer pointed to by the AdapterAddresses parameter. On
typical computers, this dramatically reduces the chances that the
GetAdaptersAddresses function returns ERROR_BUFFER_OVERFLOW, which
would require calling GetAdaptersAddresses function multiple times.
The example code illustrates this method of use. In versions prior to
Windows 10, the order in which adapters appear in the list returned
by this function can be controlled from the Network Connections
folder: select the Advanced Settings menu item from the Advanced
menu. Starting with Windows 10, the order in which adapters appear in
the list is determined by the IPv4 or IPv6 route metric. If the
GAA_FLAG_INCLUDE_ALL_INTERFACES is set, then all NDIS adapters will
be retrieved even those addresses associated with adapters not bound
to an address family specified in the Family parameter. When this
flag is not set, then only the addresses that are bound to an adapter
enabled for the address family specified in the Family parameter are
returned. The size of the IP_ADAPTER_ADDRESSES structure was changed
on Windows XP with Service Pack 1 (SP1) and later. Several additional
members were added to this structure. The size of the
IP_ADAPTER_ADDRESSES structure was also changed on Windows Vista and
later. A number of additional members were added to this structure.
The size of the IP_ADAPTER_ADDRESSES structure also changed on
Windows Vista with Service Pack 1 (SP1)and later and onWindows Server
2008 and later. One additional member was added to this structure.
The Length member of the IP_ADAPTER_ADDRESSES structure returned in
the linked list of structures in the buffer pointed to by the
AdapterAddresses parameter should be used to determine which version
of the IP_ADAPTER_ADDRESSES structure is being used. The
GetIpAddrTable function retrieves the interface?to?IPv4 address
mapping table on a local computer and returns this information in an
MIB_IPADDRTABLE structure. On the Platform Software Development Kit
(SDK) released for Windows Server 2003 and earlier, the return value
for the GetAdaptersAddresses function was defined as a DWORD, rather
than a ULONG. The SOCKET_ADDRESS structure is used in the
IP_ADAPTER_ADDRESSES structure pointed to by the AdapterAddresses
parameter. On the Microsoft Windows Software Development Kit (SDK)
released for Windows Vista and later, the organization of header
files has changed and the SOCKET_ADDRESS structure is defined in the
Ws2def.h header file which is automatically included by the
Winsock2.h header file. On the Platform SDK released for Windows
Server 2003 and Windows XP, the SOCKET_ADDRESS structure is declared
in the Winsock2.h header file. In order to use the
IP_ADAPTER_ADDRESSES structure, the Winsock2.h header file must be
included before the Iphlpapi.h header file.


%index
GetAdaptersInfo
The GetAdaptersInfo function retrieves adapter information for the local computer.
%group
Win32 iphlpapi
%prm
AdapterInfo, SizePointer
AdapterInfo : [var] A pointer to a buffer that receives a linked list of IP_ADAPTER_INFO structures.
SizePointer : [var] A pointer to a ULONG variable that specifies the size of the buffer pointed to by the pAdapterInfo parameter. If this size is insufficient to hold the adapter information, GetAdaptersInfo fills in this variable with the required size, and returns an error code of ERROR_BUFFER_OVERFLOW.
%inst
The GetAdaptersInfo function retrieves adapter information for the
local computer.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS (defined
to the same value as NO_ERROR). If the function fails, the return
value is one of the following error codes.
This doc was truncated.

[備考]
The GetAdaptersInfo function can retrieve information only for IPv4
addresses. In versions prior to Windows 10, the order in which
adapters appear in the list returned by this function can be
controlled from the Network Connections folder: select the Advanced
Settings menu item from the Advanced menu. Starting with Windows 10,
the order is unspecified. The GetAdaptersInfo and GetInterfaceInfo
functions do not return information about the IPv4 loopback
interface. Information on the loopback interface is returned by the
GetIpAddrTable function. On Windows XP and later: The list of
adapters returned by GetAdaptersInfo includes unidirectional
adapters. To generate a list of adapters that can both send and
receive data, call GetUniDirectionalAdapterInfo, and exclude the
returned adapters from the list returned by GetAdaptersInfo.


%index
GetAnycastIpAddressEntry
Retrieves information for an existing anycast IP address entry on the local computer.
%group
Win32 iphlpapi
%prm
Row
Row : [var] A pointer to a MIB_ANYCASTIPADDRESS_ROW structure entry for an anycast IP address entry. On successful return, this structure will be updated with the properties for an existing anycast IP address.
%inst
Retrieves information for an existing anycast IP address entry on the
local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetAnycastIpAddressEntry function is defined on Windows Vista and
later. The GetAnycastIpAddressEntry function is used to retrieve an
existing MIB_ANYCASTIPADDRESS_ROW structure entry. On input, the
Address member in the MIB_ANYCASTIPADDRESS_ROW structure pointed to
by the Row parameter must be initialized to a valid anycast IPv4 or
IPv6 address and family. In addition, at least one of the following
members in the MIB_ANYCASTIPADDRESS_ROW structure pointed to the Row
parameter must be initialized: the InterfaceLuid or InterfaceIndex.
The fields are used in the order listed above. So if the
InterfaceLuid is specified, then this member is used to determine the
interface. If no value is set for the InterfaceLuid member (the value
of this member is set to zero), then the InterfaceIndex member is
next used to determine the interface. On output when the call is
successful, GetAnycastIpAddressEntry retrieves the other properties
for the anycast IP address and fills out the MIB_ANYCASTIPADDRESS_ROW
structure pointed to by the Row parameter. The
GetAnycastIpAddressTable function can be called to enumerate the
anycast IP address entries on a local computer.


%index
GetAnycastIpAddressTable
Retrieves the anycast IP address table on the local computer.
%group
Win32 iphlpapi
%prm
Family, Table
Family : [int] The address family to retrieve. Possible values for the address family are listed in the Winsock2.h header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, AF_INET and PF_INET), so either constant can be used. On the Windows SDK released for Windows?Vista and later, the organization of header files has changed and possible values for this member are defined in the Ws2def.h header file. Note that the Ws2def.h header file is automatically included in Winsock2.h, and should never be used directly. The values currently supported are AF_INET, AF_INET6, and AF_UNSPEC.
Table : [var] A pointer to a MIB_ANYCASTIPADDRESS_TABLE structure that contains a table of anycast IP address entries on the local computer.
%inst
Retrieves the anycast IP address table on the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetAnycastIpAddressTable function is defined on Windows Vista and
later. The GetAnycastIpAddressTable function enumerates the anycast
IP addresses on a local system and returns this information in a
MIB_ANYCASTIPADDRESS_TABLE structure. The anycast IP address entries
are returned in a MIB_ANYCASTIPADDRESS_TABLE structure in the buffer
pointed to by the Table parameter. The MIB_ANYCASTIPADDRESS_TABLE
structure contains an anycast IP address entry count and an array of
MIB_ANYCASTIPADDRESS_ROW structures for each anycast IP address
entry. When these returned structures are no longer required, free
the memory by calling the FreeMibTable. The Family parameter must be
initialized to either AF_INET, AF_INET6, or AF_UNSPEC. Note that the
returned MIB_ANYCASTIPADDRESS_TABLE structure pointed to by the Table
parameter may contain padding for alignment between the NumEntries
member and the first MIB_ANYCASTIPADDRESS_ROW array entry in the
Table member of the MIB_ANYCASTIPADDRESS_TABLE structure. Padding for
alignment may also be present between the MIB_ANYCASTIPADDRESS_ROW
array entries. Any access to a MIB_ANYCASTIPADDRESS_ROW array entry
should assume padding may exist.


%index
GetBestInterface
The GetBestInterface function retrieves the index of the interface that has the best route to the specified IPv4 address.
%group
Win32 iphlpapi
%prm
dwDestAddr, pdwBestIfIndex
dwDestAddr : [int] The destination IPv4 address for which to retrieve the interface that has the best route, in the form of an IPAddr structure.
pdwBestIfIndex : [var] A pointer to a DWORD variable that receives the index of the interface that has the best route to the IPv4 address specified by dwDestAddr.
%inst
The GetBestInterface function retrieves the index of the interface
that has the best route to the specified IPv4 address.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetBestInterface function only works with IPv4 addresses. For use
with IPv6 addresses, the GetBestInterfaceEx must be used. For
information about the IPAddr data type, see Windows Data Types. To
convert an IP address between dotted decimal notation and IPAddr
format, use the inet_addr and inet_ntoa functions. On Windows Vista
and later, the pdwBestIfIndex parameter is treated internally by IP
Helper as a pointer to a NET_IFINDEX datatype.


%index
GetBestInterfaceEx
The GetBestInterfaceEx function retrieves the index of the interface that has the best route to the specified IPv4 or IPv6 address.
%group
Win32 iphlpapi
%prm
pDestAddr, pdwBestIfIndex
pDestAddr : [var] The destination IPv6 or IPv4 address for which to retrieve the interface with the best route, in the form of a sockaddr structure.
pdwBestIfIndex : [var] A pointer to the index of the interface with the best route to the IPv6 or IPv4 address specified by pDestAddr.
%inst
The GetBestInterfaceEx function retrieves the index of the interface
that has the best route to the specified IPv4 or IPv6 address.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetBestInterfaceEx function differs from the GetBestInterface
function in that it can be used with either IPv4 or IPv6 addresses.
The Family member of the sockaddr structure pointed to by the
pDestAddr parameter must be set to one of the following values:
AF_INET or AF_INET6. On Windows Vista and later, the pdwBestIfIndex
parameter is treated internally by IP Helper as a pointer to a
NET_IFINDEX datatype.


%index
GetBestRoute
The GetBestRoute function retrieves the best route to the specified destination IP address.
%group
Win32 iphlpapi
%prm
dwDestAddr, dwSourceAddr, pBestRoute
dwDestAddr : [int] Destination IP address for which to obtain the best route.
dwSourceAddr : [int] Source IP address. This IP address corresponds to an interface on the local computer. If multiple best routes to the destination address exist, the function selects the route that uses this interface.
pBestRoute : [var] Pointer to a MIB_IPFORWARDROW structure containing the best route for the IP address specified by dwDestAddr.
%inst
The GetBestRoute function retrieves the best route to the specified
destination IP address.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, use FormatMessage to obtain the message string for
the returned error.


%index
GetBestRoute2
Retrieves the IP route entry on the local computer for the best route to the specified destination IP address.
%group
Win32 iphlpapi
%prm
InterfaceLuid, InterfaceIndex, SourceAddress, DestinationAddress, AddressSortOptions, BestRoute, BestSourceAddress
InterfaceLuid : [var] The locally unique identifier (LUID) to specify the network interface associated with an IP route entry.
InterfaceIndex : [int] The local index value to specify the network interface associated with an IP route entry. This index value may change when a network adapter is disabled and then enabled, or under other circumstances, and should not be considered persistent.
SourceAddress : [var] The source IP address. This parameter may be omitted and passed as a NULL pointer.
DestinationAddress : [var] The destination IP address.
AddressSortOptions : [int] A set of options that affect how IP addresses are sorted. This parameter is not currently used.
BestRoute : [var] A pointer to the MIB_IPFORWARD_ROW2 for the best route from the source IP address to the destination IP address.
BestSourceAddress : [var] A pointer to the best source IP address.
%inst
Retrieves the IP route entry on the local computer for the best route
to the specified destination IP address.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetBestRoute2 function is defined on Windows Vista and later. The
GetBestRoute2 function is used to retrieve a MIB_IPFORWARD_ROW2
structure entry for the best route from a source IP address to a
destination IP address. On input, the DestinationAddress parameter
must be initialized to a valid IPv4 or IPv6 address and family. On
input, the SourceAddress parameter may be initialized to the
preferred IPv4 or IPv6 address and family. In addition, at least one
of the following parameters must be initialized: the InterfaceLuid or
InterfaceIndex. The parameters are used in the order listed above. So
if the InterfaceLuid is specified, then this member is used to
determine the interface. If no value was set for the InterfaceLuid
member (the values of this member was set to zero), then the
InterfaceIndex member is next used to determine the interface. On
output when the call is successful, GetBestRoute2 retrieves and
MIB_IPFORWARD_ROW2 structure for the best route from the source IP
address the destination IP address.


%index
GetCurrentThreadCompartmentId
Reserved for future use. Do not use this function. (GetCurrentThreadCompartmentId)
%group
Win32 iphlpapi
%prm

%inst
Reserved for future use. Do not use this function.
(GetCurrentThreadCompartmentId)


%index
GetCurrentThreadCompartmentScope
(no summary)
%group
Win32 iphlpapi
%prm
CompartmentScope, CompartmentId
CompartmentScope : [var] 
CompartmentId : [var] 
%inst



%index
GetDefaultCompartmentId
The GetDefaultCompartmentId function retrieves the default network routing compartment identifier for the local computer.
%group
Win32 iphlpapi
%prm

%inst
The GetDefaultCompartmentId function retrieves the default network
routing compartment identifier for the local computer.

[戻り値]
If the function succeeds, the return value is the default Compartment
ID. If the function fails, the return value is one of the following
error codes.
This doc was truncated.


%index
GetDnsSettings
(no summary)
%group
Win32 iphlpapi
%prm
Settings
Settings : [var] 
%inst



%index
GetExtendedTcpTable
Retrieves a table that contains a list of TCP endpoints available to the application.
%group
Win32 iphlpapi
%prm
pTcpTable, pdwSize, bOrder, ulAf, TableClass, Reserved
pTcpTable : [intptr] A pointer to the table structure that contains the filtered TCP endpoints available to the application. For information about how to determine the type of table returned based on specific input parameter combinations, see the Remarks section later in this document.
pdwSize : [var] The estimated size of the structure returned in pTcpTable, in bytes. If this value is set too small, ERROR_INSUFFICIENT_BUFFER is returned by this function, and this field will contain the correct size of the structure.
bOrder : [int] A value that specifies whether the TCP connection table should be sorted. If this parameter is set to TRUE, the TCP endpoints in the table are sorted in ascending order, starting with the lowest local IP address. If this parameter is set to FALSE, the TCP endpoints in the table appear in the order in which they were retrieved.
ulAf : [int] The version of IP used by the TCP endpoints.
TableClass : [int] The type of the TCP table structure to retrieve. This parameter can be one of the values from the TCP_TABLE_CLASS enumeration. On the Windows SDK released for Windows?Vista and later, the organization of header files has changed and the TCP_TABLE_CLASS enumeration is defined in the Iprtrmib.h header file, not in the Iphlpapi.h header file. The TCP_TABLE_CLASS enumeration value is combined with the value of the ulAf parameter to determine the extended TCP information to retrieve.
Reserved : [int] Reserved. This value must be zero.
%inst
Retrieves a table that contains a list of TCP endpoints available to
the application.

[戻り値]
If the call is successful, the value NO_ERROR is returned. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The table type returned by this function depends on the specific
combination of the ulAf parameter and the TableClass parameter. When
the ulAf parameter is set to AF_INET, the following table indicates
the TCP table type to retrieve in the structure pointed to by the
pTcpTable parameter for each possible TableClass value.
This doc was truncated.


%index
GetExtendedUdpTable
Retrieves a table that contains a list of UDP endpoints available to the application.
%group
Win32 iphlpapi
%prm
pUdpTable, pdwSize, bOrder, ulAf, TableClass, Reserved
pUdpTable : [intptr] A pointer to the table structure that contains the filtered UDP endpoints available to the application.   For information about how to determine the type of table returned based on specific input parameter combinations, see the Remarks section later in this document.
pdwSize : [var] The estimated size of the structure returned in pUdpTable, in bytes. If this value is set too small, ERROR_INSUFFICIENT_BUFFER is returned by this function, and this field will contain the correct size of the structure.
bOrder : [int] A value that specifies whether the UDP endpoint table should be sorted. If this parameter is set to TRUE, the UDP endpoints in the table are sorted in ascending order, starting with the lowest local IP address. If this parameter is set to FALSE, the UDP endpoints in the table appear in the order in which they were retrieved.
ulAf : [int] The version of IP used by the UDP endpoint.
TableClass : [int] The type of the UDP table structure to retrieve.  This parameter can be one of the values from the UDP_TABLE_CLASS enumeration. On the Windows SDK released for Windows?Vista and later, the organization of header files has changed and the UDP_TABLE_CLASS enumeration  is defined in the Iprtrmib.h header file, not in the Iphlpapi.h header file. The UDP_TABLE_CLASS enumeration value is combined with the value of the ulAf parameter to determine the extended UDP information to retrieve.
Reserved : [int] Reserved. This value must be zero.
%inst
Retrieves a table that contains a list of UDP endpoints available to
the application.

[戻り値]
If the call is successful, the value NO_ERROR is returned. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The table type returned by this function depends on the specific
combination of the ulAf parameter and the TableClass parameter. When
the ulAf parameter is set to AF_INET, the following table indicates
the UDP table type to retrieve in the structure pointed to by the
pUdpTable parameter for each possible TableClass value.
This doc was truncated.


%index
GetFriendlyIfIndex
Takes an interface index and returns a backward-compatible interface index, that is, an index that uses only the lower 24 bits.
%group
Win32 iphlpapi
%prm
IfIndex
IfIndex : [int] The interface index from which the backward-compatible or "friendly" interface index is derived.
%inst
Takes an interface index and returns a backward-compatible interface
index, that is, an index that uses only the lower 24 bits.

[戻り値]
A backward-compatible interface index that uses only the lower 24
bits.


%index
GetIcmpStatistics
The GetIcmpStatistics function retrieves the Internet Control Message Protocol (ICMP) for IPv4 statistics for the local computer.
%group
Win32 iphlpapi
%prm
Statistics
Statistics : [var] A pointer to a MIB_ICMP structure that receives the ICMP statistics for the local computer.
%inst
The GetIcmpStatistics function retrieves the Internet Control Message
Protocol (ICMP) for IPv4 statistics for the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetIcmpStatistics function returns the ICMP statistics for IPv4
on the local computer. On Windows XP and later, the GetIpStatisticsEx
can be used to obtain the ICMP statistics for either IPv4 or IPv6 on
the local computer.


%index
GetIcmpStatisticsEx
The GetIcmpStatisticsEx function retrieves Internet Control Message Protocol (ICMP) statistics for the local computer. The GetIcmpStatisticsEx function is capable of retrieving IPv6 ICMP statistics.
%group
Win32 iphlpapi
%prm
Statistics, Family
Statistics : [var] A pointer to a MIB_ICMP_EX structure that contains ICMP statistics for the local computer.
Family : [int] The protocol family for which to retrieve ICMP statistics. Must be one of the following:
%inst
The GetIcmpStatisticsEx function retrieves Internet Control Message
Protocol (ICMP) statistics for the local computer. The
GetIcmpStatisticsEx function is capable of retrieving IPv6 ICMP
statistics.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetIpStatisticsEx can be used to obtain the ICMP statistics for
either IPv4 or IPv6 on the local computer. The GetIcmpStatistics
function returns the ICMP statistics for only IPv4 on the local
computer.


%index
GetIfEntry
The GetIfEntry function retrieves information for the specified interface on the local computer.
%group
Win32 iphlpapi
%prm
pIfRow
pIfRow : [var] A pointer to a MIB_IFROW structure that, on successful return, receives information for an interface on the local computer. On input, set the dwIndex member of MIB_IFROW to the index of the interface for which to retrieve information. The value for the dwIndex must be retrieved by a previous call to the GetIfTable, GetIfTable2, or GetIfTable2Ex function.
%inst
The GetIfEntry function retrieves information for the specified
interface on the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetIfEntry function retrieves information for an interface on a
local computer. The dwIndex member in the MIB_IFROW structure pointed
to by the pIfRow parameter must be initialized to a valid network
interface index retrieved by a previous call to the GetIfTable,
GetIfTable2, or GetIfTable2Ex function. The GetIfEntry function will
fail if the dwIndex member of the MIB_IFROW pointed to by the pIfRow
parameter does not match an existing interface index on the local
computer.


%index
GetIfEntry2
Retrieves information for the specified interface on the local computer.
%group
Win32 iphlpapi
%prm
Row
Row : [var] A pointer to a MIB_IF_ROW2 structure that, on successful return, receives information for an interface on the local computer. On input, the InterfaceLuid or the InterfaceIndex member of the MIB_IF_ROW2 must be set to the interface for which to retrieve information.
%inst
Retrieves information for the specified interface on the local
computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetIfEntry2 function is defined on Windows Vista and later. On
input, at least one of the following members in the MIB_IF_ROW2
structure passed in the Row parameter must be initialized:
InterfaceLuid or InterfaceIndex. The fields are used in the order
listed above. So if the InterfaceLuid is specified, then this member
is used to determine the interface. If no value was set for the
InterfaceLuid member (the value of this member was set to zero), then
the InterfaceIndex member is next used to determine the interface. On
output, the remaining fields of the MIB_IF_ROW2 structure pointed to
by the Row parameter are filled in. Note that the Netioapi.h header
file is automatically included in Iphlpapi.h header file, and should
never be used directly.


%index
GetIfEntry2Ex
Retrieves the specified level of information for the specified interface on the local computer.
%group
Win32 iphlpapi
%prm
Level, Row
Level : [int] The level of interface information to retrieve. This parameter can be one of the values from the MIB_IF_ENTRY_LEVEL enumeration type defined in the Netioapi.h header file.
Row : [var] A pointer to a MIB_IF_ROW2 structure that, on successful return, receives information for an interface on the local computer. On input, the InterfaceLuid or the InterfaceIndex member of the MIB_IF_ROW2 must be set to the interface for which to retrieve information.
%inst
Retrieves the specified level of information for the specified
interface on the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetIfEntry2Ex function retrieves information for a specified
interface on a local system and returns this information in a pointer
to a MIB_IF_ROW2 structure. GetIfEntry2Ex is an enhanced version of
the GetIfEntry2 function that allows selecting the level of interface
information to retrieve. On input, at least one of the following
members in the MIB_IF_ROW2 structure passed in the Row parameter must
be initialized: InterfaceLuid or InterfaceIndex. The fields are used
in the order listed above. So if the InterfaceLuid is specified, then
this member is used to determine the interface. If no value was set
for the InterfaceLuid member (the value of this member was set to
zero), then the InterfaceIndex member is next used to determine the
interface. On output, the remaining fields of the MIB_IF_ROW2
structure pointed to by the Row parameter are filled in. Note that
the Netioapi.h header file is automatically included in Iphlpapi.h
header file, and should never be used directly.


%index
GetIfStackTable
Retrieves a table of network interface stack row entries that specify the relationship of the network interfaces on an interface stack.
%group
Win32 iphlpapi
%prm
Table
Table : [var] A pointer to a buffer that receives the table of interface stack row entries in a MIB_IFSTACK_TABLE structure.
%inst
Retrieves a table of network interface stack row entries that specify
the relationship of the network interfaces on an interface stack.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetIfStackTable function is defined on Windows Vista and later.
The GetIfStackTable function enumerates the physical and logical
network interfaces on an interface stack on a local system and
returns this information in a MIB_IFSTACK_TABLE structure. Interface
stack entries are returned in a MIB_IFSTACK_TABLE structure in the
buffer pointed to by the Table parameter. The MIB_IFSTACK_TABLE
structure contains an interface stack entry count and an array of
MIB_IFSTACK_ROW structures for each interface stack entry. The
relationship between the interfaces in the interface stack is that
the interface with index in the HigherLayerInterfaceIndex member of
the MIB_IFSTACK_ROW structure is immediately above the interface with
index in the LowerLayerInterfaceIndex member of the MIB_IFSTACK_ROW
structure. Memory is allocated by the GetIfStackTable function for
the MIB_IFSTACK_TABLE structure and the MIB_IFSTACK_ROW entries in
this structure. When these returned structures are no longer
required, free the memory by calling the FreeMibTable. Note that the
returned MIB_IFSTACK_TABLE structure pointed to by the Table
parameter may contain padding for alignment between the NumEntries
member and the first MIB_IFSTACK_ROW array entry in the Table member
of the MIB_IFSTACK_TABLE structure. Padding for alignment may also be
present between the MIB_IFSTACK_ROW array entries. Any access to a
MIB_IFSTACK_ROW array entry should assume padding may exist.


%index
GetIfTable
The GetIfTable function retrieves the MIB-II interface table.
%group
Win32 iphlpapi
%prm
pIfTable, pdwSize, bOrder
pIfTable : [var] A pointer to a buffer that receives the interface table as a MIB_IFTABLE structure.
pdwSize : [var] On input, specifies the size in bytes of the buffer pointed to by the pIfTable parameter. On output, if the buffer is not large enough to hold the returned interface table, the function sets this parameter equal to the required buffer size in bytes.
bOrder : [int] A Boolean value that specifies whether the returned interface table should be sorted in ascending order by interface index. If this parameter is TRUE, the table is sorted.
%inst
The GetIfTable function retrieves the MIB-II interface table.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetIfTable function enumerates physical interfaces on a local
system and returns this information in a MIB_IFTABLE structure. The
physical interfaces include the software loopback interface. The
GetIfTable2 and GetIfTable2Ex functions available on Windows Vista
and later are an enhanced version of the GetIfTable function that
enumerate both the physical and logical interfaces on a local system.
Logical interfaces include various WAN Miniport interfaces used for
L2TP, PPTP, PPOE, and other tunnel encapsulations. Interfaces are
returned in a MIB_IFTABLE structure in the buffer pointed to by the
pIfTable parameter. The MIB_IFTABLE structure contains an interface
count and an array of MIB_IFROW structures for each interface. Note
that the returned MIB_IFTABLE structure pointed to by the pIfTable
parameter may contain padding for alignment between the dwNumEntries
member and the first MIB_IFROW array entry in the table member of the
MIB_IFTABLE structure. Padding for alignment may also be present
between the MIB_IFROW array entries. Any access to a MIB_IFROW array
entry should assume padding may exist.


%index
GetIfTable2
Retrieves the MIB-II interface table. (GetIfTable2)
%group
Win32 iphlpapi
%prm
Table
Table : [var] A pointer to a buffer that receives the table of interfaces in a MIB_IF_TABLE2 structure.
%inst
Retrieves the MIB-II interface table. (GetIfTable2)

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetIfTable2 function enumerates the logical and physical
interfaces on a local system and returns this information in a
MIB_IF_TABLE2 structure. GetIfTable2 is an enhanced version of the
GetIfTable function. A similar GetIfTable2Ex function can be used to
specify the level of interfaces to return. Calling the GetIfTable2Ex
function with the Level parameter set to MibIfTableNormal retrieves
the same results as calling the GetIfTable2 function. Interfaces are
returned in a MIB_IF_TABLE2 structure in the buffer pointed to by the
Table parameter. The MIB_IF_TABLE2 structure contains an interface
count and an array of MIB_IF_ROW2 structures for each interface.
Memory is allocated by the GetIfTable2 function for the MIB_IF_TABLE2
structure and the MIB_IF_ROW2 entries in this structure. When these
returned structures are no longer required, free the memory by
calling the FreeMibTable. Note that the returned MIB_IF_TABLE2
structure pointed to by the Table parameter may contain padding for
alignment between the NumEntries member and the first MIB_IF_ROW2
array entry in the Table member of the MIB_IF_TABLE2 structure.
Padding for alignment may also be present between the MIB_IF_ROW2
array entries. Any access to a MIB_IF_ROW2 array entry should assume
padding may exist.


%index
GetIfTable2Ex
Retrieves the MIB-II interface table. (GetIfTable2Ex)
%group
Win32 iphlpapi
%prm
Level, Table
Level : [int] The level of interface information to retrieve. This parameter can be one of the values from the MIB_IF_TABLE_LEVEL enumeration type defined in the Netioapi.h header file.
Table : [var] A pointer to a buffer that receives the table of interfaces in a MIB_IF_TABLE2 structure.
%inst
Retrieves the MIB-II interface table. (GetIfTable2Ex)

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetIfTable2Ex function enumerates the logical and physical
interfaces on a local system and returns this information in a
MIB_IF_TABLE2 structure. GetIfTable2Ex is an enhanced version of the
GetIfTable function that allows selecting the level of interface
information to retrieve. A similar GetIfTable2 function can also be
used to retrieve interfaces. but does not allow specifying the level
of interfaces to return. Calling the GetIfTable2Ex function with the
Level parameter set to MibIfTableNormal retrieves the same results as
calling the GetIfTable2 function. Interfaces are returned in a
MIB_IF_TABLE2 structure in the buffer pointed to by the Table
parameter. The MIB_IF_TABLE2 structure contains an interface count
and an array of MIB_IF_ROW2 structures for each interface. Memory is
allocated by the GetIfTable2 function for the MIB_IF_TABLE2 structure
and the MIB_IF_ROW2 entries in this structure. When these returned
structures are no longer required, free the memory by calling the
FreeMibTable. All interfaces including NDIS intermediate driver
interfaces and NDIS filter driver interfaces are returned for either
of the possible values for the Level parameter. The setting for the
Level parameter affects how statistics and state members of the
MIB_IF_ROW2 structure in the MIB_IF_TABLE2 structure pointed to by
the Table parameter for the interface are returned. For example, a
network interface card (NIC) will have a NDIS miniport driver. An
NDIS intermediate driver can be installed to interface between
upper-level protocol drivers and NDIS miniport drivers. An NDIS
filter driver (LWF) can be attached on top of the NDIS intermediate
driver. Assume that the NIC reports the MediaConnectState member of
the MIB_IF_ROW2 structure as MediaConnectStateConnected but NDIS
filter driver modifies the state and reports the state as
MediaConnectStateDisconnected. When the interface information is
queried with Level parameter set to MibIfTableNormal, the state at
the top of the filter stack, that is MediaConnectStateDisconnected is
reported. When the interface is queried with the Level parameter set
to MibIfTableRaw, the state at the interface level directly, that is
MediaConnectStateConnected is returned.
Note that the returned MIB_IF_TABLE2 structure pointed to by the
Table parameter may contain padding for alignment between the
NumEntries member and the first MIB_IF_ROW2 array entry in the Table
member of the MIB_IF_TABLE2 structure. Padding for alignment may also
be present between the MIB_IF_ROW2 array entries. Any access to a
MIB_IF_ROW2 array entry should assume padding may exist.


%index
GetInterfaceCurrentTimestampCapabilities
This function is reserved for system use, and you should not call it from your code. (GetInterfaceCurrentTimestampCapabilities)
%group
Win32 iphlpapi
%prm
InterfaceLuid, TimestampCapabilites
InterfaceLuid : [var] Reserved.
TimestampCapabilites : [var] Reserved.
%inst
This function is reserved for system use, and you should not call it
from your code. (GetInterfaceCurrentTimestampCapabilities)

[戻り値]
Reserved.


%index
GetInterfaceDnsSettings
Retrieves the DNS settings from the interface specified in the *Interface* parameter.
%group
Win32 iphlpapi
%prm
Interface, Settings
Interface : [int] Type: \_In\_ **[GUID](/windows/win32/api/guiddef/ns-guiddef-guid)** The **GUID** of the COM interface that the settings refer to.
Settings : [var] Type: \_Inout\_ const **[DNS_INTERFACE_SETTINGS](ns-netioapi-dns_interface_settings.md)\*** **GetInterfaceDnsSettings** populates all the settings in this structure. You should set only the *Version* member; the *Flags* field must be empty. If you set the *Version* member to **DNS_INTERFACE_SETTINGS_VERSION1**, then the *Settings* parameter must point to a valid [**DNS_INTERFACE_SETTINGS**](ns-netioapi-dns_interface_settings.md) structure. If you set the *Version* member to **DNS_INTERFACE_SETTINGS_VERSION3**, then the *Settings* parameter must point to a valid [**DNS_INTERFACE_SETTINGS3**](/windows/win32/api/netioapi/ns-netioapi-dns_interface_settings3) structure.
%inst
Retrieves the DNS settings from the interface specified in the
*Interface* parameter.

[戻り値]
Returns **NO_ERROR** if successful. A non-zero return value indicates
failure.


%index
GetInterfaceHardwareTimestampCapabilities
This function is reserved for system use, and you should not call it from your code. (GetInterfaceHardwareTimestampCapabilities)
%group
Win32 iphlpapi
%prm
InterfaceLuid, TimestampCapabilites
InterfaceLuid : [var] Reserved.
TimestampCapabilites : [var] Reserved.
%inst
This function is reserved for system use, and you should not call it
from your code. (GetInterfaceHardwareTimestampCapabilities)

[戻り値]
Reserved.


%index
GetInterfaceInfo
The GetInterfaceInfo function obtains the list of the network interface adapters with IPv4 enabled on the local system.
%group
Win32 iphlpapi
%prm
pIfTable, dwOutBufLen
pIfTable : [var] A pointer to a buffer that specifies an IP_INTERFACE_INFO structure that receives the list of adapters. This buffer must be allocated by the caller.
dwOutBufLen : [var] A pointer to a DWORD variable that specifies the size of the buffer pointed to by pIfTable parameter to receive the IP_INTERFACE_INFO structure. If this size is insufficient to hold the IPv4 interface information, GetInterfaceInfo fills in this variable with the required size, and returns an error code of ERROR_INSUFFICIENT_BUFFER.
%inst
The GetInterfaceInfo function obtains the list of the network
interface adapters with IPv4 enabled on the local system.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetInterfaceInfo function is specific to network adapters with
IPv4 enabled. The function returns an IP_INTERFACE_INFO structure
pointed to by the pIfTable parameter that contains the number of
network adapters with IPv4 enabled on the local system and an array
of IP_ADAPTER_INDEX_MAP structures with information on each network
adapter with IPv4 enabled. The IP_INTERFACE_INFO structure returned
by GetInterfaceInfo contains at least one IP_ADAPTER_INDEX_MAP
structure even if the NumAdapters member of the IP_INTERFACE_INFO
structure indicates that no network adapters with IPv4 are enabled.
When the NumAdapters member of the IP_INTERFACE_INFO structure
returned by GetInterfaceInfo is zero, the value of the members of the
single IP_ADAPTER_INDEX_MAP structure returned in the
IP_INTERFACE_INFO structure is undefined. If the GetInterfaceInfo
function is called with too small a buffer to retrieve the IPv4
interface information (the dwOutBufLen parameter indicates that the
buffer pointed to by the pIfTable parameter is too small), the
function returns ERROR_INSUFFICIENT_BUFFER. The required size is
returned in the DWORD variable pointed to by the dwOutBufLen
parameter. The correct way to use the GetInterfaceInfo function is to
call this function twice. In the first call, pass a NULL pointer in
the pIfTable parameter and zero in the variable pointed to by the
dwOutBufLen parameter. The call will fail with
ERROR_INSUFFICIENT_BUFFER and the required size for this buffer is
returned in the DWORD variable pointed to by the dwOutBufLen
parameter. A buffer can then be allocated of the required size using
the value pointed by the dwOutBufLen. Then the GetInterfaceInfo
function can be called a second time with a pointer to this buffer
passed in the pIfTable parameter and the length of the buffer set to
the size of this buffer. The GetAdaptersInfo and GetInterfaceInfo
functions do not return information about the loopback interface.
Information on the loopback interface is returned by the
GetIpAddrTable function. On Windows Vista and later, the Name member
of the IP_ADAPTER_INDEX_MAP structure returned in the
IP_INTERFACE_INFO structure may be a Unicode string of the GUID for
the network interface (the string begins with the '{' character).


%index
GetInvertedIfStackTable
Retrieves a table of inverted network interface stack row entries that specify the relationship of the network interfaces on an interface stack.
%group
Win32 iphlpapi
%prm
Table
Table : [var] A pointer to a buffer that receives the table of inverted interface stack row entries in a MIB_INVERTEDIFSTACK_TABLE structure.
%inst
Retrieves a table of inverted network interface stack row entries
that specify the relationship of the network interfaces on an
interface stack.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetInvertedIfStackTable function is defined on Windows Vista and
later. The GetInvertedIfStackTable function enumerates the physical
and logical network interfaces on an interface stack on a local
system and returns this information in an inverted form in the
MIB_INVERTEDIFSTACK_TABLE structure. Interface stack entries are
returned in a MIB_INVERTEDIFSTACK_TABLE structure in the buffer
pointed to by the Table parameter. The MIB_INVERTEDIFSTACK_TABLE
structure contains an interface stack entry count and an array of
MIB_INVERTEDIFSTACK_ROW structures for each interface stack entry.
The relationship between the interfaces in the interface stack is
that the interface with index in the HigherLayerInterfaceIndex member
of the MIB_INVERTEDIFSTACK_ROW structure is immediately above the
interface with index in the LowerLayerInterfaceIndex member of the
MIB_INVERTEDIFSTACK_ROW structure. Memory is allocated by the
GetInvertedIfStackTable function for the MIB_INVERTEDIFSTACK_TABLE
structure and the MIB_INVERTEDIFSTACK_ROW entries in this structure.
When these returned structures are no longer required, free the
memory by calling the FreeMibTable. Note that the returned
MIB_INVERTEDIFSTACK_TABLE structure pointed to by the Table parameter
may contain padding for alignment between the NumEntries member and
the first MIB_INVERTEDIFSTACK_ROW array entry in the Table member of
the MIB_INVERTEDIFSTACK_TABLE structure. Padding for alignment may
also be present between the MIB_INVERTEDIFSTACK_ROW array entries.
Any access to a MIB_INVERTEDIFSTACK_ROW array entry should assume
padding may exist.


%index
GetIpAddrTable
The GetIpAddrTable function retrieves the interface?to?IPv4 address mapping table.
%group
Win32 iphlpapi
%prm
pIpAddrTable, pdwSize, bOrder
pIpAddrTable : [var] A pointer to a buffer that receives the interface?to?IPv4 address mapping table as a MIB_IPADDRTABLE structure.
pdwSize : [var] On input, specifies the size in bytes  of the buffer pointed to by the pIpAddrTable parameter.
bOrder : [int] If this parameter is TRUE, then the returned mapping table is sorted in ascending order by IPv4 address. The sorting is performed in network byte order. For example, 10.0.0.255 comes immediately before 10.0.1.0.
%inst
The GetIpAddrTable function retrieves the interface?to?IPv4 address
mapping table.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetIpAddrTable function retrieves the interface?to?IPv4 address
mapping table on a local computer and returns this information in an
MIB_IPADDRTABLE structure. The IPv4 addresses returned by the
GetIpAddrTable function are affected by the status of the network
interfaces on a local computer. Manually resetting a network
interface card (NIC) and certain PnP events may result in an IP
address being removed or changed. On Windows Server 2003 and Windows
XP, the IPv4 addresses returned by the GetIpAddrTable function are
also affected if the media sensing capability of the TCP/IP stack on
a local computer has been disabled by calling the DisableMediaSense
function. When media sensing has been disabled, the GetIpAddrTable
function may return IPv4 addresses associated with disconnected
interfaces. These Ipv4 addresses for disconnected interfaces are not
valid for use. On Windows Server 2008 and Windows Vista, the IPv4
addresses returned by the GetIpAddrTable function are not affected by
the media sensing capability of the TCP/IP stack on a local computer.
The GetIpAddrTable function returns only valid IPv4 addresses. The
GetAdaptersAddresses function available on Windows XP can be used to
retrieve both IPv6 and IPv4 addresses and interface information. The
MIB_IPADDRTABLE structure returned by the GetIpAddrTable function may
contain padding for alignment between the dwNumEntries member and the
first MIB_IPADDRROW array entry in the table member. Padding for
alignment may also be present between the MIB_IPADDRROW array entries
in the table member. Any access to a MIB_IPADDRROW array entry should
assume padding may exist.
On the Microsoft Windows Software Development Kit (SDK) released for
Windows Vista and later, the organization of header files has changed
and the MIB_IPADDRROW is defined in the Ipmib.h header file not in
the Iprtrmib.h header file. Note that the Ipmib.h header file is
automatically included in Iprtrmib.h which is automatically included
in the Iphlpapi.h header file. The Ipmib.h and Iprtrmib.h header
files should never be used directly.


%index
GetIpErrorString
The GetIpErrorString function retrieves an IP Helper error string.
%group
Win32 iphlpapi
%prm
ErrorCode, Buffer, Size
ErrorCode : [int] The error code to be retrieved. The possible values for this parameter are defined in the Ipexport.h header file.
Buffer : [wstr] A pointer to the buffer that contains the error code string if the function returns with NO_ERROR.
Size : [var] A pointer to a DWORD that specifies the length, in characters, of the buffer pointed to by Buffer parameter, excluding the terminating null (i.e. the size of Buffer in characters, minus one).
%inst
The GetIpErrorString function retrieves an IP Helper error string.

[戻り値]
Returns NO_ERROR upon success. If the function fails, use
FormatMessage to obtain the message string for the returned error.

[備考]
The GetIpErrorString function can be used to retrieve an IP Helper
error string for an IP error code. The IP_STATUS error code passed in
the ErrorCode parameter is returned in the Status member of the
ICMP_ECHO_REPLY, ICMP_ECHO_REPLY32, and ICMPV6_ECHO_REPLY structures
used by the ICMP and ICMPv6 functions. The functions that use these
structures include Icmp6ParseReplies, Icmp6SendEcho2,
IcmpParseReplies, IcmpSendEcho, IcmpSendEcho2, and IcmpSendEcho2Ex.
The syntax for the GetIpErrorString function was slightly changed on
the Microsoft Windows Software Development Kit (SDK) released for
Windows Vista and later. The data type for the Buffer parameter was
changed from PWCHAR to PWSTR.


%index
GetIpForwardEntry2
Retrieves information for an IP route entry on the local computer.
%group
Win32 iphlpapi
%prm
Row
Row : [var] A pointer to a MIB_IPFORWARD_ROW2 structure entry for an IP route entry. On successful return, this structure will be updated with the properties for the IP route entry.
%inst
Retrieves information for an IP route entry on the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetIpForwardEntry2 function is defined on Windows Vista and
later. The GetIpForwardEntry2 function is used to retrieve a
MIB_IPFORWARD_ROW2 structure entry. On input, the DestinationPrefix
member in the MIB_IPFORWARD_ROW2 structure pointed to by the Row
parameter must be initialized to a valid IPv4 or IPv6 address prefix
and family. On input, the NextHop member in the MIB_IPFORWARD_ROW2
structure pointed to by the Row parameter must be initialized to a
valid IPv4 or IPv6 address and family. In addition, at least one of
the following members in the MIB_IPFORWARD_ROW2 structure pointed to
the Row parameter must be initialized: the InterfaceLuid or
InterfaceIndex. The fields are used in the order listed above. So if
the InterfaceLuid is specified, then this member is used to determine
the interface. If no value was set for the InterfaceLuid member (the
values of this member was set to zero), then the InterfaceIndex
member is next used to determine the interface. On output when the
call is successful, GetIpForwardEntry2 retrieves the other properties
for the IP route entry and fills out the MIB_IPFORWARD_ROW2 structure
pointed to by the Row parameter. The route metric offset specified in
the Metric member of the MIB_IPFORWARD_ROW2 structure pointed to by
Row parameter represents only part of the complete route metric. The
complete metric is a combination of this route metric added to the
interface metric specified in the Metric member of the
MIB_IPINTERFACE_ROW structure of the associated interface. An
application can retrieve the interface metric by calling the
GetIpInterfaceEntry function. The GetIpForwardTable2 function can be
called to enumerate the IP route entries on a local computer.


%index
GetIpForwardTable
The GetIpForwardTable function retrieves the IPv4 routing table.
%group
Win32 iphlpapi
%prm
pIpForwardTable, pdwSize, bOrder
pIpForwardTable : [var] A pointer to a buffer that receives the IPv4 routing table as a MIB_IPFORWARDTABLE structure.
pdwSize : [var] On input, specifies the size in bytes  of the buffer pointed to by the pIpForwardTable parameter.
bOrder : [int] A Boolean value that specifies whether the returned table should be sorted. If this parameter is TRUE, the table is sorted in the order of:
%inst
The GetIpForwardTable function retrieves the IPv4 routing table.

[戻り値]
If the function succeeds, the return value is NO_ERROR (zero). If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The dwForwardProto member of the MIB_IPFORWARDROW structure specifies
the protocol or routing mechanism that generated the route. See
Protocol Identifiers for a list of possible protocols and routing
mechanisms. The dwForwardDest, dwForwardMask, and dwForwardNextHop
members of the MIB_IPFORWARDROW structure represent an IPv4 address
in network byte order. An IPv4 address of 0.0.0.0 in the
dwForwardDest member of the MIB_IPFORWARDROW structure is considered
a default route. The MIB_IPFORWARDTABLE may contain multiple
MIB_IPFORWARDROW entries with the dwForwardDest member set to 0.0.0.0
when there are multiple network adapters installed. When dwForwardAge
is set to INFINITE, the route will not be removed based on a timeout
value. Any other value for dwForwardAge specifies the number of
seconds since the route was added or modified in the network routing
table.
On Windows Server 2003 or Windows 2000 Server when the Routing and
Remote Access Service (RRAS) is running, the MIB_IPFORWARDROW entries
returned have the dwForwardType and dwForwardAge members set to zero.
On Windows Vista and Windows Server 2008, the route metric specified
in the dwForwardMetric1 member of the MIB_IPFORWARDROW structure
represents a combination of the route metric added to the interface
metric specified in the Metric member of the MIB_IPINTERFACE_ROW
structure of the associated interface. So the dwForwardMetric1 member
of the MIB_IPFORWARDROW structure should be equal to or greater than
Metric member of the associated MIB_IPINTERFACE_ROW structure. If an
application would like to set the route metric to 0 on Windows Vista
and Windows Server 2008, then the dwForwardMetric1 member of the
MIB_IPFORWARDROW structure should be set equal to the value of the
interface metric specified in the Metric member of the associated
MIB_IPINTERFACE_ROW structure. An application can retrieve the
interface metric by calling the GetIpInterfaceEntry function. A
number of members of the MIB_IPFORWARDROW structure entries returned
by GetIpForwardTable are not currently used by IPv4 routing. These
members include dwForwardPolicy, dwForwardNextHopAS,
dwForwardMetric2, dwForwardMetric3, dwForwardMetric4, and
dwForwardMetric5.


%index
GetIpForwardTable2
The GetIpForwardTable2 function retrieves the IP route entries on the local computer.
%group
Win32 iphlpapi
%prm
Family, Table
Family : [int] The address family to retrieve. Possible values for the address family are listed in the Winsock2.h header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, AF_INET and PF_INET), so either constant can be used. On the Windows SDK released for Windows?Vista and later, the organization of header files has changed and possible values for this member are defined in the Ws2def.h header file. Note that the Ws2def.h header file is automatically included in Winsock2.h, and should never be used directly. The values currently supported are AF_INET, AF_INET6, and AF_UNSPEC.
Table : [var] A pointer to a MIB_IPFORWARD_TABLE2 structure that contains a table of IP route entries on the local computer.
%inst
The GetIpForwardTable2 function retrieves the IP route entries on the
local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetIpForwardTable2 function is defined on Windows Vista and
later. The GetIpForwardTable2 function enumerates the IP route
entries on a local system and returns this information in a
MIB_IPFORWARD_TABLE2 structure. The IP route entries are returned in
a MIB_IPFORWARD_TABLE2 structure in the buffer pointed to by the
Table parameter. The MIB_IPFORWARD_TABLE2 structure contains an IP
route entry count and an array of MIB_IPFORWARD_ROW2 structures for
each IP route entry. When these returned structures are no longer
required, free the memory by calling the FreeMibTable. The Family
parameter must be initialized to either AF_INET, AF_INET6, or
AF_UNSPEC. Note that the returned MIB_IPFORWARD_TABLE2 structure
pointed to by the Table parameter may contain padding for alignment
between the NumEntries member and the first MIB_IPFORWARD_ROW2 array
entry in the Table member of the MIB_IPFORWARD_TABLE2 structure.
Padding for alignment may also be present between the
MIB_IPFORWARD_ROW2 array entries. Any access to a MIB_IPFORWARD_ROW2
array entry should assume padding may exist.


%index
GetIpInterfaceEntry
Retrieves IP information for the specified interface on the local computer.
%group
Win32 iphlpapi
%prm
Row
Row : [var] A pointer to a MIB_IPINTERFACE_ROW structure that, on successful return, receives information for an interface on the local computer. On input, the InterfaceLuid or InterfaceIndex member of the MIB_IPINTERFACE_ROW must be set to the interface for which to retrieve information.
%inst
Retrieves IP information for the specified interface on the local
computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetIpInterfaceEntry function is defined on Windows Vista and
later. On input, the Family member in the MIB_IPINTERFACE_ROW
structure pointed to by the Row parameter must be initialized to
either AF_INET or AF_INET6. In addition on input, at least one of the
following members in the MIB_IPINTERFACE_ROW structure pointed to the
Row parameter must be initialized: the InterfaceLuid or
InterfaceIndex. The fields are used in the order listed above. So if
the InterfaceLuid is specified, then this member is used to determine
the interface. If no value was set for the InterfaceLuid member (the
values of this member was set to zero), then the InterfaceIndex
member is next used to determine the interface. On output, the
InterfaceLuid member of the MIB_IPINTERFACE_ROW structure pointed to
by the Row parameter is filled in if the InterfaceIndex was
specified. The other members of MIB_IPINTERFACE_ROW structure pointed
to by the Row parameter are also filled in. The
InitializeIpInterfaceEntry function must be used to initialize the
fields of a MIB_IPINTERFACE_ROW structure entry with default values.
An application can then change the fields in the MIB_IPINTERFACE_ROW
entry it wishes to modify, and then call the SetIpInterfaceEntry
function. Unprivileged simultaneous access to multiple networks of
different security requirements creates a security hole and allows an
unprivileged application to accidentally relay data between the two
networks. A typical example is simultaneous access to a virtual
private network (VPN) and the Internet. Windows Server 2003 and
Windows XP use a weak host model, where RAS prevents such
simultaneous access by increasing the route metric of all default
routes over other interfaces. Thus all traffic is routed through the
VPN interface, disrupting other network connectivity. On Windows
Vista and later, a strong host model is used by default. If a source
IP address is specified in the route lookup using GetBestRoute2 or
GetBestRoute, the route lookup is restricted to the interface of the
source IP address. The route metric modification by RAS has no effect
as the list of potential routes does not even have the route for the
VPN interface thereby allowing traffic to the Internet. The
DisableDefaultRoutes member of the MIB_IPINTERFACE_ROW can be used to
disable using the default route on an interface. This member can be
used as a security measure by VPN clients to restrict split tunneling
when split tunneling is not required by the VPN client. A VPN client
can call the SetIpInterfaceEntry function to set the
DisableDefaultRoutes member to TRUE when required. A VPN client can
query the current state of the DisableDefaultRoutes member by calling
the GetIpInterfaceEntry function.


%index
GetIpInterfaceTable
Retrieves the IP interface entries on the local computer.
%group
Win32 iphlpapi
%prm
Family, Table
Family : [int] The address family of IP interfaces to retrieve. Possible values for the address family are listed in the Winsock2.h header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, AF_INET and PF_INET), so either constant can be used. On Windows?Vista and later as well as on the Windows SDK, the organization of header files has changed and possible values for this member are defined in the Ws2def.h header file. Note that the Ws2def.h header file is automatically included in Winsock2.h, and should never be used directly. The values currently supported are AF_INET, AF_INET6, and AF_UNSPEC.
Table : [var] A pointer to a buffer that receives the table of IP interface entries in a MIB_IPINTERFACE_TABLE structure.
%inst
Retrieves the IP interface entries on the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetIpInterfaceTable function is defined on Windows Vista and
later. The GetIpInterfaceTable function enumerates the IP interfaces
on a local system and returns this information in an
MIB_IPINTERFACE_TABLE structure. IP interface entries are returned in
a MIB_IPINTERFACE_TABLE structure in the buffer pointed to by the
Table parameter. The MIB_IPINTERFACE_TABLE structure contains an IP
interface entry count and an array of MIB_IPINTERFACE_ROW structures
for each IP interface entry. When these returned structures are no
longer required, free the memory by calling the FreeMibTable. The
Family parameter must be initialized to either AF_INET or AF_INET6.
Note that the returned MIB_IPINTERFACE_TABLE structure pointed to by
the Table parameter may contain padding for alignment between the
NumEntries member and the first MIB_IPINTERFACE_ROW array entry in
the Table member of the MIB_IPINTERFACE_TABLE structure. Padding for
alignment may also be present between the MIB_IPINTERFACE_ROW array
entries. Any access to a MIB_IPINTERFACE_ROW array entry should
assume padding may exist.


%index
GetIpNetEntry2
Retrieves information for a neighbor IP address entry on the local computer.
%group
Win32 iphlpapi
%prm
Row
Row : [var] A pointer to a MIB_IPNET_ROW2 structure entry for a neighbor IP address entry. On successful return, this structure will be updated with the properties for neighbor IP address.
%inst
Retrieves information for a neighbor IP address entry on the local
computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetIpNetEntry2 function is defined on Windows Vista and later.
The GetIpNetEntry2 function is used to retrieve a MIB_IPNET_ROW2
structure entry. On input, the Address member in the MIB_IPNET_ROW2
structure pointed to by the Row parameter must be initialized to a
valid neighbor IPv4 or IPv6 address and family. In addition, at least
one of the following members in the MIB_IPNET_ROW2 structure pointed
to the Row parameter must be initialized: the InterfaceLuid or
InterfaceIndex. The fields are used in the order listed above. So if
the InterfaceLuid is specified, then this member is used to determine
the interface. If no value was set for the InterfaceLuid member (the
values of this member was set to zero), then the InterfaceIndex
member is next used to determine the interface. On output when the
call is successful, GetIpNetEntry2 retrieves the other properties for
the neighbor IP address and fills out the MIB_IPNET_ROW2 structure
pointed to by the Row parameter. The GetIpNetTable2 function can be
called to enumerate the neighbor IP address entries on a local
computer.


%index
GetIpNetTable
The GetIpNetTable function retrieves the IPv4 to physical address mapping table.
%group
Win32 iphlpapi
%prm
IpNetTable, SizePointer, Order
IpNetTable : [var] A pointer to a buffer that receives the IPv4 to physical address mapping table as a MIB_IPNETTABLE structure.
SizePointer : [var] On input, specifies the size in bytes of the buffer pointed to by the pIpNetTable parameter. On output, if the buffer is not large enough to hold the returned mapping table, the function sets this parameter equal to the required buffer size in bytes.
Order : [int] A Boolean value that specifies whether the returned mapping table should be sorted in ascending order by IP address. If this parameter is TRUE, the table is sorted.
%inst
The GetIpNetTable function retrieves the IPv4 to physical address
mapping table.

[戻り値]
If the function succeeds, the return value is NO_ERROR or
ERROR_NO_DATA. If the function fails or does not return any data, the
return value is one of the following error codes.
This doc was truncated.

[備考]
The GetIpNetTable function enumerates the Address Resolution Protocol
(ARP) entries for IPv4 on a local system from the IPv4 to physical
address mapping table and returns this information in a
MIB_IPNETTABLE structure. The IPv4 address entries are returned in a
MIB_IPNETTABLE structure in the buffer pointed to by the pIpNetTable
parameter. The MIB_IPNETTABLE structure contains a count of ARP
entries and an array of MIB_IPNETROW structures for each IPv4 address
entry. Note that the returned MIB_IPNETTABLE structure pointed to by
the pIpNetTable parameter may contain padding for alignment between
the dwNumEntries member and the first MIB_IPNETROW array entry in the
table member of the MIB_IPNETTABLE structure. Padding for alignment
may also be present between the MIB_IPNETROW array entries. Any
access to a MIB_IPNETROW array entry should assume padding may exist.
on Windows Vista and later, the GetIpNetTable2 function can be used
to retrieve the neighbor IP addresses for both IPv6 and IPv4.


%index
GetIpNetTable2
The GetIpNetTable2 function retrieves the IP neighbor table on the local computer.
%group
Win32 iphlpapi
%prm
Family, Table
Family : [int] The address family to retrieve. Possible values for the address family are listed in the Winsock2.h header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, AF_INET and PF_INET), so either constant can be used. On the Windows SDK released for Windows?Vista and later, the organization of header files has changed and possible values for this member are defined in the Ws2def.h header file. Note that the Ws2def.h header file is automatically included in Winsock2.h, and should never be used directly. The values currently supported are AF_INET, AF_INET6, and AF_UNSPEC.
Table : [var] A pointer to a MIB_IPNET_TABLE2 structure that contains a table of neighbor IP address entries on the local computer.
%inst
The GetIpNetTable2 function retrieves the IP neighbor table on the
local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR or
ERROR_NOT_FOUND. If the function fails or returns no data, the return
value is one of the following error codes.
This doc was truncated.

[備考]
The GetIpNetTable2 function is defined on Windows Vista and later.
The GetIpNetTable2 function enumerates the neighbor IP addresses on a
local system and returns this information in a MIB_IPNET_TABLE2
structure. The neighbor IP address entries are returned in a
MIB_IPNET_TABLE2 structure in the buffer pointed to by the Table
parameter. The MIB_IPNET_TABLE2 structure contains a neighbor IP
address entry count and an array of MIB_IPNET_ROW2 structures for
each neighbor IP address entry. When these returned structures are no
longer required, free the memory by calling the FreeMibTable. The
Family parameter must be initialized to either AF_INET, AF_INET6, or
AF_UNSPEC. Note that the returned MIB_IPNET_TABLE2 structure pointed
to by the Table parameter may contain padding for alignment between
the NumEntries member and the first MIB_IPNET_ROW2 array entry in the
Table member of the MIB_IPNET_TABLE2 structure. Padding for alignment
may also be present between the MIB_IPNET_ROW2 array entries. Any
access to a MIB_IPNET_ROW2 array entry should assume padding may
exist.


%index
GetIpNetworkConnectionBandwidthEstimates
Retrieves historical bandwidth estimates for a network connection on the specified interface.
%group
Win32 iphlpapi
%prm
InterfaceIndex, AddressFamily, BandwidthEstimates
InterfaceIndex : [int] The local index value for the network interface. This index value may change when a network adapter is disabled and then enabled, or under other circumstances, and should not be considered persistent.
AddressFamily : [int] The address family. Possible values for the address family are listed in the Ws2def.h header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, AF_INET and PF_INET), so either constant can be used. Note that the Ws2def.h header file is automatically included in Winsock2.h, and should never be used directly. The values currently supported are AF_INET or AF_INET6, which are the Internet address family formats for IPv4 and IPv6.
BandwidthEstimates : [var] A pointer to a buffer that returns the historical bandwidth estimates maintained for the point of attachment to which the interface is currently connected.
%inst
Retrieves historical bandwidth estimates for a network connection on
the specified interface.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetIpNetworkConnectionBandwidthEstimates function is defined on
Windows 8 and later. On input, the AddressFamily parameter must be
initialized to either AF_INET or AF_INET6. In addition on input, the
InterfaceIndex parameter must be initialized with the specified
interface index. A value must be set for the InterfaceIndex parameter
(the value of this parameter must not be set to zero). On output, the
MIB_IP_NETWORK_CONNECTION_BANDWIDTH_ESTIMATES structure pointed to by
the BandwidthEstimates parameter is filled in if the AddressFamily
and InterfaceIndex parameters were specified. The
GetIpNetworkConnectionBandwidthEstimates function returns historical
estimates of available bandwidth at the point of attachment (the
first hop) for use by an application. The estimates are intended as a
guide to tune performance parameters and the application should
maintain thresholds and differentiate behavior for low and high
bandwidth situations. It is possible that the true available
bandwidth changes over time as more bandwidth is consumed by devices
competing on the same network. So applications should be prepared to
handle cases where the available bandwidth drops below historical
limits reported by the GetIpNetworkConnectionBandwidthEstimates
function. It is possible that the TCP/IP stack has not built up any
estimates for the given interface, in a particular or both
directions. In this case the estimate returned will be zero. The
application should be prepared to handle such cases by picking
reasonable defaults and fine tuning if required. The Netioapi.h
header file is automatically included by the Iphlpapi.h header file.
The Netioapi.h header file should never be used directly.


%index
GetIpPathEntry
Retrieves information for a IP path entry on the local computer.
%group
Win32 iphlpapi
%prm
Row
Row : [var] A pointer to a MIB_IPPATH_ROW structure entry for a IP path entry. On successful return, this structure will be updated with the properties for IP path entry.
%inst
Retrieves information for a IP path entry on the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetIpPathEntry function is defined on Windows Vista and later.
The GetIpPathEntry function is used to retrieve a MIB_IPPATH_ROW
structure entry. On input, the Destination member in the
MIB_IPPATH_ROW structure pointed to by the Row parameter must be
initialized to a valid IPv4 or IPv6 address and family. The address
family specified in Source member in the MIB_IPPATH_ROW structure
must also either match the destination IP address family specified in
the Destination member or the address family in the Source member
must be specified as AF_UNSPEC. In addition , at least one of the
following members in the MIB_IPPATH_ROW structure pointed to the Row
parameter must be initialized: the InterfaceLuid or InterfaceIndex.
The fields are used in the order listed above. So if the
InterfaceLuid is specified, then this member is used to determine the
interface. If no value is set for the InterfaceLuid member (the
values of this member is set to zero), then the InterfaceIndex member
is next used to determine the interface. On output when the call is
successful, GetIpPathEntry retrieves the other properties for the IP
path entry and fills out the MIB_IPPATH_ROW structure pointed to by
the Row parameter. The GetIpPathTable function can be called to
enumerate the IP path entries on a local computer.


%index
GetIpPathTable
The GetIpPathTable function retrieves the IP path table on the local computer.
%group
Win32 iphlpapi
%prm
Family, Table
Family : [int] The address family to retrieve. Possible values for the address family are listed in the Winsock2.h header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, AF_INET and PF_INET), so either constant can be used. On the Windows SDK released for Windows?Vista and later, the organization of header files has changed and possible values for this member are defined in the Ws2def.h header file. Note that the Ws2def.h header file is automatically included in Winsock2.h, and should never be used directly. The values currently supported are AF_INET, AF_INET6, and AF_UNSPEC.
Table : [var] A pointer to a MIB_IPPATH_TABLE structure that contains a table of IP path entries on the local computer.
%inst
The GetIpPathTable function retrieves the IP path table on the local
computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetIpPathTable function is defined on Windows Vista and later.
The GetIpPathTable function enumerates the IP path entries on a local
system and returns this information in a MIB_IPPATH_TABLE structure.
The IP path entries are returned in a MIB_IPPATH_TABLE structure in
the buffer pointed to by the Table parameter. The MIB_IPPATH_TABLE
structure contains an IP path entry count and an array of
MIB_IPPATH_ROW structures for each IP path entry. When these returned
structures are no longer required, free the memory by calling the
FreeMibTable. The Family parameter must be initialized to either
AF_INET, AF_INET6, or AF_UNSPEC. Note that the returned
MIB_IPPATH_TABLE structure pointed to by the Table parameter may
contain padding for alignment between the NumEntries member and the
first MIB_IPPATH_ROW array entry in the Table member of the
MIB_IPPATH_TABLE structure. Padding for alignment may also be present
between the MIB_IPPATH_ROW array entries. Any access to a
MIB_IPPATH_ROW array entry should assume padding may exist.


%index
GetIpStatistics
The GetIpStatistics function retrieves the IP statistics for the current computer.
%group
Win32 iphlpapi
%prm
Statistics
Statistics : [var] A pointer to a MIB_IPSTATS structure that receives the IP statistics for the local computer.
%inst
The GetIpStatistics function retrieves the IP statistics for the
current computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetIpStatistics function returns the statistics for IPv4 on the
current computer. On Windows XP and later, the GetIpStatisticsEx can
be used to obtain the IP statistics for either IPv4 or IPv6.


%index
GetIpStatisticsEx
The GetIpStatisticsEx function retrieves the Internet Protocol (IP) statistics for the current computer.
%group
Win32 iphlpapi
%prm
Statistics, Family
Statistics : [var] A pointer to a MIB_IPSTATS structure that receives the IP statistics for the local computer.
Family : [int] 
%inst
The GetIpStatisticsEx function retrieves the Internet Protocol (IP)
statistics for the current computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetIpStatisticsEx can be used to obtain the IP statistics for
either IPv4 or IPv6 on the local computer. The GetIpStatistics
function returns the statistics for only IPv4 on the local computer.


%index
GetJobCompartmentId
(no summary)
%group
Win32 iphlpapi
%prm
JobHandle
JobHandle : [intptr] 
%inst



%index
GetMulticastIpAddressEntry
Retrieves information for an existing multicast IP address entry on the local computer.
%group
Win32 iphlpapi
%prm
Row
Row : [var] A pointer to a MIB_MULTICASTIPADDRESS_ROW structure entry for a multicast IP address entry. On successful return, this structure will be updated with the properties for an existing multicast IP address.
%inst
Retrieves information for an existing multicast IP address entry on
the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetMulticastIpAddressEntry function is defined on Windows Vista
and later. The GetMulticastIpAddressEntry function is used to
retrieve an existing MIB_MULTICASTIPADDRESS_ROW structure entry. On
input, the Address member in the MIB_MULTICASTIPADDRESS_ROW structure
pointed to by the Row parameter must be initialized to a valid
multicast IPv4 or IPv6 address and family. In addition, at least one
of the following members in the MIB_MULTICASTIPADDRESS_ROW structure
pointed to the Row parameter must be initialized: the InterfaceLuid
or InterfaceIndex. The fields are used in the order listed above. So
if the InterfaceLuid is specified, then this member is used to
determine the interface. If no value is set for the InterfaceLuid
member (the value of this member is set to zero), then the
InterfaceIndex member is next used to determine the interface. On
output when the call is successful, GetMulticastIpAddressEntry
retrieves the other properties for the multicast IP address and fills
out the MIB_MULTICASTIPADDRESS_ROW structure pointed to by the Row
parameter. The GetMulticastIpAddressTable function can be called to
enumerate the multicast IP address entries on a local computer.


%index
GetMulticastIpAddressTable
Retrieves the multicast IP address table on the local computer.
%group
Win32 iphlpapi
%prm
Family, Table
Family : [int] The address family to retrieve. Possible values for the address family are listed in the Winsock2.h header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, AF_INET and PF_INET), so either constant can be used. On the Windows SDK released for Windows?Vista and later, the organization of header files has changed and possible values for this member are defined in the Ws2def.h header file. Note that the Ws2def.h header file is automatically included in Winsock2.h, and should never be used directly. The values currently supported are AF_INET, AF_INET6, and AF_UNSPEC.
Table : [var] A pointer to a MIB_MULTICASTIPADDRESS_TABLE structure that contains a table of anycast IP address entries on the local computer.
%inst
Retrieves the multicast IP address table on the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetMulticastIpAddressTable function is defined on Windows Vista
and later. The GetMulticastIpAddressTable function enumerates the
multicast IP addresses on a local system and returns this information
in a MIB_MULTICASTIPADDRESS_TABLE structure. The multicast IP address
entries are returned in a MIB_MULTICASTIPADDRESS_TABLE structure in
the buffer pointed to by the Table parameter. The
MIB_MULTICASTIPADDRESS_TABLE structure contains a multicast IP
address entry count and an array of MIB_MULTICASTIPADDRESS_ROW
structures for each multicast IP address entry. When these returned
structures are no longer required, free the memory by calling the
FreeMibTable. The Family parameter must be initialized to either
AF_INET, AF_INET6, or AF_UNSPEC. Note that the returned
MIB_MULTICASTIPADDRESS_TABLE structure pointed to by the Table
parameter may contain padding for alignment between the NumEntries
member and the first MIB_MULTICASTIPADDRESS_ROW array entry in the
Table member of the MIB_MULTICASTIPADDRESS_TABLE structure. Padding
for alignment may also be present between the
MIB_MULTICASTIPADDRESS_ROW array entries. Any access to a
MIB_MULTICASTIPADDRESS_ROW array entry should assume padding may
exist.


%index
GetNetworkConnectivityHint
Retrieves the aggregate level and cost of network connectivity that an application or service is likely to experience.
%group
Win32 iphlpapi
%prm
ConnectivityHint
ConnectivityHint : [var] A pointer to a value of type [NL_NETWORK_CONNECTIVITY_HINT](../nldef/ns-nldef-nl_network_connectivity_hint.md). The function sets this value to the aggregate connectivity level and cost hints.
%inst
Retrieves the aggregate level and cost of network connectivity that
an application or service is likely to experience.

[戻り値]
In user mode, returns **NO_ERROR** on success, and a Win32 error code
on failure. In kernel mode, returns **STATUS_SUCCESS** on success,
and an NTSTATUS error code on failure.


%index
GetNetworkConnectivityHintForInterface
Retrieves the level and cost of network connectivity for the specified interface.
%group
Win32 iphlpapi
%prm
InterfaceIndex, ConnectivityHint
InterfaceIndex : [int] A value of type **NET_IFINDEX** representing the index of the interface for which to retrieve connectivity information.
ConnectivityHint : [var] A pointer to a value of type [NL_NETWORK_CONNECTIVITY_HINT](../nldef/ns-nldef-nl_network_connectivity_hint.md). The function sets this value to the connectivity level and cost hints for the specified interface.
%inst
Retrieves the level and cost of network connectivity for the
specified interface.

[戻り値]
In user mode, returns **NO_ERROR** on success, and a Win32 error code
on failure. In kernel mode, returns **STATUS_SUCCESS** on success,
and an NTSTATUS error code on failure.


%index
GetNetworkInformation
Reserved for future use. Do not use this function. (GetNetworkInformation)
%group
Win32 iphlpapi
%prm
NetworkGuid, CompartmentId, SiteId, NetworkName, Length
NetworkGuid : [var] Reserved.
CompartmentId : [var] Reserved.
SiteId : [var] Reserved.
NetworkName : [wstr] Reserved.
Length : [int] Reserved.
%inst
Reserved for future use. Do not use this function.
(GetNetworkInformation)


%index
GetNetworkParams
The GetNetworkParams function retrieves network parameters for the local computer.
%group
Win32 iphlpapi
%prm
pFixedInfo, pOutBufLen
pFixedInfo : [var] A pointer to a buffer that contains a FIXED_INFO structure that receives the network parameters for the local computer, if the function was successful. This buffer must be allocated by the caller prior to calling the GetNetworkParams function.
pOutBufLen : [var] A pointer to a ULONG variable that specifies the size of the FIXED_INFO structure. If this size is insufficient to hold the information, GetNetworkParams fills in this variable with the required size, and returns an error code of ERROR_BUFFER_OVERFLOW.
%inst
The GetNetworkParams function retrieves network parameters for the
local computer.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetNetworkParams function is used to retrieve network parameters
for the local computer. Network parameters are returned in a
FIXED_INFO structure. The memory for the FIXED_INFO structure must be
allocated by the application. It is the responsibility of the
application to free this memory when it is no longer needed. In the
Microsoft Windows Software Development Kit (SDK), the
FIXED_INFO_WIN2KSP1 structure is defined. When compiling an
application if the target platform is Windows 2000 with Service Pack
1 (SP1) and later (NTDDI_VERSION >= NTDDI_WIN2KSP1, _WIN32_WINNT >=
0x0501, or WINVER >= 0x0501), the FIXED_INFO_WIN2KSP1 struct is
typedefed to the FIXED_INFO structure. When compiling an application
if the target platform is not Windows 2000 with SP1 and later, the
FIXED_INFO structure is undefined. The GetNetworkParams function and
the FIXED_INFO structure are supported on Windows 98and later. But to
build an application for a target platform earlier than Windows 2000
with Service Pack 1 (SP1), an earlier version of the Platform
Software Development Kit (SDK) must be used.


%index
GetNumberOfInterfaces
The GetNumberOfInterfaces functions retrieves the number of interfaces on the local computer.
%group
Win32 iphlpapi
%prm
pdwNumIf
pdwNumIf : [var] Pointer to a DWORD variable that receives the number of interfaces on the local computer.
%inst
The GetNumberOfInterfaces functions retrieves the number of
interfaces on the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, use FormatMessage to obtain the message string for
the returned error.

[備考]
The GetNumberOfInterfaces function returns the number of interfaces
on the local computer, including the loopback interface. This number
is one more than the number of adapters returned by the
GetAdaptersInfo and GetInterfaceInfo functions because these
functions do not return information about the loopback interface.


%index
GetOwnerModuleFromPidAndInfo
(no summary)
%group
Win32 iphlpapi
%prm
ulPid, pInfo, Class, pBuffer, pdwSize
ulPid : [int] 
pInfo : [var] 
Class : [int] 
pBuffer : [intptr] 
pdwSize : [var] 
%inst



%index
GetOwnerModuleFromTcp6Entry
Retrieves data about the module that issued the context bind for a specific IPv6 TCP endpoint in a MIB table row.
%group
Win32 iphlpapi
%prm
pTcpEntry, Class, pBuffer, pdwSize
pTcpEntry : [var] A pointer to a MIB_TCP6ROW_OWNER_MODULE structure that contains the IPv6 TCP endpoint entry used to obtain the owner module.
Class : [int] A TCPIP_OWNER_MODULE_INFO_CLASS enumeration value that indicates the type of data to obtain regarding the owner module. The TCPIP_OWNER_MODULE_INFO_CLASS enumeration is defined in the Iprtrmib.h header file. This parameter must be set to TCPIP_OWNER_MODULE_INFO_BASIC.
pBuffer : [intptr] A pointer to a buffer that contains a TCPIP_OWNER_MODULE_BASIC_INFO structure with the owner module data. The type of data returned in this buffer is indicated by the value of the Class parameter. The following structures are used for the data in Buffer when  Class is set to the corresponding value.
pdwSize : [var] The estimated size of the structure returned in Buffer, in bytes. If this value is set too small, ERROR_INSUFFICIENT_BUFFER is returned by this function, and this field will contain the correct structure size.
%inst
Retrieves data about the module that issued the context bind for a
specific IPv6 TCP endpoint in a MIB table row.

[戻り値]
If the function call is successful, the value NO_ERROR is returned.
If the function fails, the return value is one of the following error
codes.
This doc was truncated.

[備考]
The Buffer parameter contains not only a structure with pointers to
specific data, for example, pointers to the zero-terminated strings
that contain the name and path of the owner module, but the actual
data itself; that is the name and path strings. Therefore, when
calculating the size of the buffer, ensure that you have enough space
for both the structure as well as the data the members of the
structure point to. The resolution of TCP table entries to owner
modules is a best practice. In a few cases, the owner module name
returned in the TCPIP_OWNER_MODULE_BASIC_INFO structure can be a
process name (such as "svchost.exe"), a service name (such as "RPC"),
or a component name (such as "timer.dll"). For computers running on
Windows Vista or later, the pModuleName and pModulePath members of
the TCPIP_OWNER_MODULE_BASIC_INFO retrieved by
GetOwnerModuleFromTcpEntry function may point to an empty string for
some TCP connections. Applications that start TCP connections located
in the Windows system folder (C:\Windows\System32, by default) are
considered protected. If the GetOwnerModuleFromTcpEntry function is
called by a user that is not a member of the Administrators group,
the function call will succeed but the pModuleName and pModulePath
members will point to memory that contains an empty string for the
TCP connections started by protected applications. For computers
running on Windows Vista or later, accessing the pModuleName and
pModulePath members of the TCPIP_OWNER_MODULE_BASIC_INFO structure is
limited by user account control (UAC). If an application that calls
this function is executed by a user logged on as a member of the
Administrators group other than the built-in Administrator, this call
will succeed but access to these members returns an empty string
unless the application has been marked in the manifest file with a
requestedExecutionLevel set to requireAdministrator. If the
application on Windows Vista or later lacks this manifest file, a
user logged on as a member of the Administrators group other than the
built-in Administrator must then be executing the application in an
enhanced shell as the built-in Administrator (RunAs administrator)
for access to the protected pModuleName and pModulePath members to be
allowed.


%index
GetOwnerModuleFromTcpEntry
Retrieves data about the module that issued the context bind for a specific IPv4 TCP endpoint in a MIB table row.
%group
Win32 iphlpapi
%prm
pTcpEntry, Class, pBuffer, pdwSize
pTcpEntry : [var] A pointer to a MIB_TCPROW_OWNER_MODULE structure that contains the IPv4 TCP endpoint entry used to obtain the owner module.
Class : [int] A TCPIP_OWNER_MODULE_INFO_CLASS enumeration value that indicates the type of data to obtain regarding the owner module. The TCPIP_OWNER_MODULE_INFO_CLASS enumeration is defined in the Iprtrmib.h header file. This parameter must be set to TCPIP_OWNER_MODULE_INFO_BASIC.
pBuffer : [intptr] A pointer a buffer that contains a TCPIP_OWNER_MODULE_BASIC_INFO structure with the owner module data. The type of data returned in this buffer is indicated by the value of the Class parameter. The following structures are used for the data in Buffer when  Class is set to the corresponding value.
pdwSize : [var] The estimated size, in  bytes, of the structure returned in Buffer. If this value is set too small, ERROR_INSUFFICIENT_BUFFER is returned by this function, and this field will contain the correct size of the buffer. The size required is the size of the corresponding structure plus an additional number of bytes equal to the length of data pointed to in the structure (for example, the name and path strings).
%inst
Retrieves data about the module that issued the context bind for a
specific IPv4 TCP endpoint in a MIB table row.

[戻り値]
If the function call is successful, the value NO_ERROR is returned.
If the function fails, the return value is one of the following error
codes.
This doc was truncated.

[備考]
The Buffer parameter contains not only a structure with pointers to
specific data, for example, pointers to the zero-terminated strings
that contain the name and path of the owner module, but the actual
data itself; that is the name and path strings. Therefore, when
calculating the buffer size, ensure that you have enough space for
both the structure as well as the data the members of the structure
point to. The resolution of TCP table entries to owner modules is a
best practice. In a few cases, the owner module name returned in the
TCPIP_OWNER_MODULE_BASIC_INFO structure can be a process name, such
as "svchost.exe", a service name (such as "RPC"), or a component
name, such as "timer.dll". For computers running on Windows Vista or
later, the pModuleName and pModulePath members of the
TCPIP_OWNER_MODULE_BASIC_INFO retrieved by GetOwnerModuleFromTcpEntry
function may point to an empty string for some TCP connections.
Applications that start TCP connections located in the Windows system
folder (C:\Windows\System32, by default) are considered protected. If
the GetOwnerModuleFromTcpEntry function is called by a user that is
not a member of the Administrators group, the function call will
succeed but the pModuleName and pModulePath members will point to
memory that contains an empty string for the TCP connections started
by protected applications. For computers running on Windows Vista or
later, accessing the pModuleName and pModulePath members of the
TCPIP_OWNER_MODULE_BASIC_INFO structure is limited by user account
control (UAC). If an application that calls this function is executed
by a user logged on as a member of the Administrators group other
than the built-in Administrator, this call will succeed but access to
these members returns an empty string unless the application has been
marked in the manifest file with a requestedExecutionLevel set to
requireAdministrator. If the application on Windows Vista or later
lacks this manifest file, a user logged on as a member of the
Administrators group other than the built-in Administrator must then
be executing the application in an enhanced shell as the built-in
Administrator (RunAs administrator) for access to the protected
pModuleName and pModulePath members to be allowed.


%index
GetOwnerModuleFromUdp6Entry
Retrieves data about the module that issued the context bind for a specific IPv6 UDP endpoint in a MIB table row.
%group
Win32 iphlpapi
%prm
pUdpEntry, Class, pBuffer, pdwSize
pUdpEntry : [var] A pointer to a MIB_UDP6ROW_OWNER_MODULE structure that contains the IPv6 UDP endpoint entry used to obtain the owner module.
Class : [int] TCPIP_OWNER_MODULE_INFO_CLASS enumeration value that indicates the type of data to obtain regarding the owner module.
pBuffer : [intptr] The buffer that contains a TCPIP_OWNER_MODULE_BASIC_INFO structure with the owner module data. The type of data returned in this buffer is indicated by the value of the Class parameter. The following structures are used for the data in Buffer when  Class is set to the corresponding value.
pdwSize : [var] The estimated size, in bytes, of the structure returned in Buffer. If this value is set too small, ERROR_INSUFFICIENT_BUFFER is returned by this function, and this field will contain the correct size of the structure.
%inst
Retrieves data about the module that issued the context bind for a
specific IPv6 UDP endpoint in a MIB table row.

[戻り値]
If the call is successful, the value NO_ERROR is returned. Otherwise,
the following error is returned.
This doc was truncated.

[備考]
The Buffer parameter contains not only a structure with pointers to
specific data, for example, pointers to the zero-terminated strings
that contain the name and path of the owner module, but the actual
data itself; that is the name and path strings. Therefore, when
calculating the buffer size, ensure that you have enough space for
both the structure as well as the data the members of the structure
point to. The resolution of UDP table entries to owner modules is a
best practice. In a few cases, the owner module name returned in the
TCPIP_OWNER_MODULE_BASIC_INFO structure can be a process name, such
as "svchost.exe", a service name, such as "RPC", or a component name,
such as "timer.dll". For computers running on Windows Vista or later,
accessing the pModuleName and pModulePath members of the
TCPIP_OWNER_MODULE_BASIC_INFO structure is limited by user account
control (UAC). If an application that calls this function is executed
by a user logged on as a member of the Administrators group other
than the built-in Administrator, this call will succeed but access to
these members returns an empty string unless the application has been
marked in the manifest file with a requestedExecutionLevel set to
requireAdministrator. If the application on Windows Vista or later
lacks this manifest file, a user logged on as a member of the
Administrators group other than the built-in Administrator must then
be executing the application in an enhanced shell as the built-in
Administrator (RunAs administrator) for access to the protected
pModuleName and pModulePath members to be allowed.


%index
GetOwnerModuleFromUdpEntry
Retrieves data about the module that issued the context bind for a specific IPv4 UDP endpoint in a MIB table row.
%group
Win32 iphlpapi
%prm
pUdpEntry, Class, pBuffer, pdwSize
pUdpEntry : [var] A pointer to a MIB_UDPROW_OWNER_MODULE structure that contains the IPv4 UDP endpoint entry used to obtain the owner module.
Class : [int] A TCPIP_OWNER_MODULE_INFO_CLASS enumeration value that indicates the type of data to obtain regarding the owner module.
pBuffer : [intptr] The buffer that contains a TCPIP_OWNER_MODULE_BASIC_INFO structure with the owner module data. The type of data returned in this buffer is indicated by the value of the Class parameter. The following structures are used for the data in Buffer when  Class is set to the corresponding value.
pdwSize : [var] The estimated size, in bytes, of the structure returned in Buffer. If this value is set too small, ERROR_INSUFFICIENT_BUFFER is returned by this function, and this field will contain the correct structure size.
%inst
Retrieves data about the module that issued the context bind for a
specific IPv4 UDP endpoint in a MIB table row.

[戻り値]
If the call is successful, the value NO_ERROR is returned. Otherwise,
the following error is returned.
This doc was truncated.

[備考]
The Buffer parameter contains not only a structure with pointers to
specific data, for example, pointers to the zero-terminated strings
that contain the name and path of the owner module, but also the
actual data itself; that is the name and path strings. Therefore,
when calculating the buffer size, ensure that you have enough space
for both the structure as well as the data the members of the
structure point to. The resolution of UDP table entries to owner
modules is a best practice. In a few cases, the owner module name
returned in the TCPIP_OWNER_MODULE_BASIC_INFO structure can be a
process name, such as "svchost.exe", a service name, such as "RPC",
or a component name, such as "timer.dll". For computers running on
Windows Vista or later, accessing the pModuleName and pModulePath
members of the TCPIP_OWNER_MODULE_BASIC_INFO structure is limited by
user account control (UAC). If an application that calls this
function is executed by a user logged on as a member of the
Administrators group other than the built-in Administrator, this call
will succeed but access to these members returns an empty string
unless the application has been marked in the manifest file with a
requestedExecutionLevel set to requireAdministrator. If the
application on Windows Vista or later lacks this manifest file, a
user logged on as a member of the Administrators group other than the
built-in Administrator must then be executing the application in an
enhanced shell as the built-in Administrator (RunAs administrator)
for access to the protected pModuleName and pModulePath members to be
allowed.


%index
GetPerAdapterInfo
The GetPerAdapterInfo function retrieves information about the adapter corresponding to the specified interface.
%group
Win32 iphlpapi
%prm
IfIndex, pPerAdapterInfo, pOutBufLen
IfIndex : [int] Index of an interface. The GetPerAdapterInfo function retrieves information for the adapter corresponding to this interface.
pPerAdapterInfo : [var] Pointer to an IP_PER_ADAPTER_INFO structure that receives information about the adapter.
pOutBufLen : [var] Pointer to a ULONG variable that specifies the size of the IP_PER_ADAPTER_INFO structure. If this size is insufficient to hold the information, GetPerAdapterInfo fills in this variable with the required size, and returns an error code of ERROR_BUFFER_OVERFLOW.
%inst
The GetPerAdapterInfo function retrieves information about the
adapter corresponding to the specified interface.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
An adapter index may change when the adapter is disabled and then
enabled, or under other circumstances, and should not be considered
persistent.


%index
GetPerTcp6ConnectionEStats
Retrieves extended statistics for an IPv6 TCP connection.
%group
Win32 iphlpapi
%prm
Row, EstatsType, Rw, RwVersion, RwSize, Ros, RosVersion, RosSize, Rod, RodVersion, RodSize
Row : [var] A pointer to a MIB_TCP6ROW structure for an IPv6 TCP connection.
EstatsType : [int] The type of extended statistics for TCP requested. This parameter determines the data and format of information that is returned in the Rw, Rod, and Ros parameters if the call is successful. This parameter can be one of the values from the TCP_ESTATS_TYPE enumeration type defined in the Tcpestats.h header file.
Rw : [var] A pointer to a buffer to receive the read/write information. This parameter may be a NULL pointer if an application does not want to retrieve read/write information for the TCP connection.
RwVersion : [int] The version of the read/write information requested. The current supported value is a version of zero.
RwSize : [int] The size, in bytes, of the buffer pointed to by Rw parameter.
Ros : [var] A pointer to a buffer to receive read-only static information. This parameter may be a NULL pointer if an application does not want to retrieve read-only static information for the TCP connection.
RosVersion : [int] The version of the read-only static information requested. The current supported value is a version of zero.
RosSize : [int] The size, in bytes, of the buffer pointed to by the Ros parameter.
Rod : [var] A pointer to a buffer to receive read-only dynamic information. This parameter may be a NULL pointer if an application does not want to retrieve read-only dynamic information  for the TCP connection.
RodVersion : [int] The version of the read-only dynamic information requested. The current supported value is a version of zero..
RodSize : [int] The size, in bytes, of the buffer pointed to by the Rod parameter.
%inst
Retrieves extended statistics for an IPv6 TCP connection.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetPerTcp6ConnectionEStats function is defined on Windows Vista
and later. The GetPerTcp6ConnectionEStats function is designed to use
TCP to diagnose performance problems in both the network and the
application. If a network based application is performing poorly, TCP
can determine if the bottleneck is in the sender, the receiver or the
network itself. If the bottleneck is in the network, TCP can provide
specific information about its nature.
The GetPerTcp6ConnectionEStats function retrieves extended statistics
for the IPv6 TCP connection passed in the Row parameter. The type of
extended statistics that is retrieved is specified in the EstatsType
parameter. Extended statistics on this TCP connection must have
previously been enabled by calls to the SetPerTcp6ConnectionEStats
function for all TCP_ESTATS_TYPE values except when
TcpConnectionEstatsSynOpts is passed in the EstatsType parameter. The
GetTcp6Table function is used to retrieve the IPv6 TCP connection
table on the local computer. This function returns a MIB_TCP6TABLE
structure that contain an array of MIB_TCP6ROW entries. The Row
parameter passed to the GetPerTcp6ConnectionEStats function must be
an entry for an existing IPv6 TCP connection. The only version of TCP
connection statistics currently supported is version zero. So the
RwVersion, RosVersion, and RodVersion parameters passed to
GetPerTcp6ConnectionEStats should be set to 0. For information on
extended TCP statistics on an IPv4 connection, see the
GetPerTcpConnectionEStats and SetPerTcpConnectionEStats functions.
The SetPerTcp6ConnectionEStats function can only be called by a user
logged on as a member of the Administrators group. If
SetPerTcp6ConnectionEStats is called by a user that is not a member
of the Administrators group, the function call will fail and
ERROR_ACCESS_DENIED is returned. This function can also fail because
of user account control (UAC) on Windows Vista and later. If an
application that contains this function is executed by a user logged
on as a member of the Administrators group other than the built-in
Administrator, this call will fail unless the application has been
marked in the manifest file with a requestedExecutionLevel set to
requireAdministrator. If the application lacks this manifest file, a
user logged on as a member of the Administrators group other than the
built-in Administrator must then be executing the application in an
enhanced shell as the built-in Administrator (RunAs administrator)
for this function to succeed. The caller of
**GetPerTcp6ConnectionEStats** should check the *EnableCollection*
field in the returned *Rw* struct, and if it is not `TRUE`, then the
caller should ignore the data in the *Ros* and *Rod* structs. If
*EnableCollection* is set to `FALSE`, then the data returned in *Ros*
and *Rod* are undefined. For example, one condition under which this
can happen is when you're using **GetPerTcp6ConnectionEStats** to
retrieve extended statistics for an IPv6 TCP connection, and you've
previously called
[SetPerTcp6ConnectionEStats](./nf-iphlpapi-setpertcp6connectionestats.md)
to enable extended statistics. If the **SetPerTcp6ConnectionEStats**
call fails then subsequent calls to **GetPerTcp6ConnectionEStats**
will return meaningless random data, and not extended TCP statistics.
You can observe that example by running the example below as both an
administrator, and as a normal user.


%index
GetPerTcpConnectionEStats
Retrieves extended statistics for an IPv4 TCP connection.
%group
Win32 iphlpapi
%prm
Row, EstatsType, Rw, RwVersion, RwSize, Ros, RosVersion, RosSize, Rod, RodVersion, RodSize
Row : [var] A pointer to a MIB_TCPROW structure for an IPv4 TCP connection.
EstatsType : [int] The type of extended statistics for TCP requested. This parameter determines the data and format of information that is returned in the Rw, Rod, and Ros parameters if the call is successful. This parameter can be one of the values from the TCP_ESTATS_TYPE enumeration type defined in the Tcpestats.h header file.
Rw : [var] A pointer to a buffer to receive the read/write information. This parameter may be a NULL pointer if an application does not want to retrieve read/write information for the TCP connection.
RwVersion : [int] The version of the read/write information requested. The current supported value is a version of zero.
RwSize : [int] The size, in bytes, of the buffer pointed to by Rw parameter.
Ros : [var] A pointer to a buffer to receive read-only static information. This parameter may be a NULL pointer if an application does not want to retrieve read-only static information for the TCP connection.
RosVersion : [int] The version of the read-only static information requested. The current supported value is a version of zero.
RosSize : [int] The size, in bytes, of the buffer pointed to by the Ros parameter.
Rod : [var] A pointer to a buffer to receive read-only dynamic information. This parameter may be a NULL pointer if an application does not want to retrieve read-only dynamic information  for the TCP connection.
RodVersion : [int] The version of the read-only dynamic information requested. The current supported value is a version of zero.
RodSize : [int] The size, in bytes, of the buffer pointed to by the Rod parameter.
%inst
Retrieves extended statistics for an IPv4 TCP connection.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetPerTcpConnectionEStats function is defined on Windows Vista
and later. The GetPerTcpConnectionEStats function is designed to use
TCP to diagnose performance problems in both the network and the
application. If a network based application is performing poorly, TCP
can determine if the bottleneck is in the sender, the receiver or the
network itself. If the bottleneck is in the network, TCP can provide
specific information about its nature.
The GetPerTcpConnectionEStats function retrieves extended statistics
for the IPv4 TCP connection passed in the Row parameter. The type of
extended statistics that is retrieved is specified in the EstatsType
parameter. Extended statistics on this TCP connection must have
previously been enabled by calls to the SetPerTcpConnectionEStats
function for all TCP_ESTATS_TYPE values except when
TcpConnectionEstatsSynOpts is passed in the EstatsType parameter. The
GetTcpTable function is used to retrieve the IPv4 TCP connection
table on the local computer. This function returns a MIB_TCPTABLE
structure that contain an array of MIB_TCPROW entries. The Row
parameter passed to the GetPerTcpConnectionEStats function must be an
entry for an existing IPv4 TCP connection. The only version of TCP
connection statistics currently supported is version zero. So the
RwVersion, RosVersion, and RodVersion parameters passed to
GetPerTcpConnectionEStats should be set to 0. For information on
extended TCP statistics on an IPv6 connection, see the
GetPerTcp6ConnectionEStats and SetPerTcp6ConnectionEStats functions.
The SetPerTcpConnectionEStats function can only be called by a user
logged on as a member of the Administrators group. If
SetPerTcpConnectionEStats is called by a user that is not a member of
the Administrators group, the function call will fail and
ERROR_ACCESS_DENIED is returned. This function can also fail because
of user account control (UAC) on Windows Vista and later. If an
application that contains this function is executed by a user logged
on as a member of the Administrators group other than the built-in
Administrator, this call will fail unless the application has been
marked in the manifest file with a requestedExecutionLevel set to
requireAdministrator. If the application lacks this manifest file, a
user logged on as a member of the Administrators group other than the
built-in Administrator must then be executing the application in an
enhanced shell as the built-in Administrator (RunAs administrator)
for this function to succeed. The caller of
**GetPerTcpConnectionEStats** should check the *EnableCollection*
field in the returned *Rw* struct, and if it is not `TRUE`, then the
caller should ignore the data in the *Ros* and *Rod* structs. If
*EnableCollection* is set to `FALSE`, then the data returned in *Ros*
and *Rod* are undefined. For example, one condition under which this
can happen is when you're using **GetPerTcpConnectionEStats** to
retrieve extended statistics for an IPv4 TCP connection, and you've
previously called
[SetPerTcpConnectionEStats](./nf-iphlpapi-setpertcpconnectionestats.md)
to enable extended statistics. If the **SetPerTcpConnectionEStats**
call fails then subsequent calls to **GetPerTcpConnectionEStats**
will return meaningless random data, and not extended TCP statistics.
You can observe that example by running the example below as both an
administrator, and as a normal user.


%index
GetRTTAndHopCount
The GetRTTAndHopCount function determines the round-trip time (RTT) and hop count to the specified destination.
%group
Win32 iphlpapi
%prm
DestIpAddress, HopCount, MaxHops, RTT
DestIpAddress : [int] IP address of the destination for which to determine the RTT and hop count, in the form of an IPAddr structure.
HopCount : [var] Pointer to a ULONG variable. This variable receives the hop count to the destination specified by the DestIpAddress parameter.
MaxHops : [int] Maximum number of hops to search for the destination. If the number of hops to the destination exceeds this number, the function terminates the search and returns FALSE.
RTT : [var] Round-trip time, in milliseconds, to the destination specified by DestIpAddress.
%inst
The GetRTTAndHopCount function determines the round-trip time (RTT)
and hop count to the specified destination.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. Call GetLastError to obtain the
error code for the failure.

[備考]
For information about the IPAddr data type, see Windows Data Types.
To convert an IP address between dotted decimal notation and IPAddr
format, use the inet_addr and inet_ntoa functions.


%index
GetSessionCompartmentId
Reserved for future use. Do not use this function. (GetSessionCompartmentId)
%group
Win32 iphlpapi
%prm
SessionId
SessionId : [int] Reserved.
%inst
Reserved for future use. Do not use this function.
(GetSessionCompartmentId)


%index
GetTcp6Table
Retrieves the TCP connection table for IPv6. (GetTcp6Table)
%group
Win32 iphlpapi
%prm
TcpTable, SizePointer, Order
TcpTable : [var] A pointer to a buffer that receives the TCP connection table for IPv6 as a MIB_TCP6TABLE structure.
SizePointer : [var] On input, specifies the size in bytes of the buffer pointed to by the TcpTable parameter. On output, if the buffer is not large enough to hold the returned TCP connection table, the function sets this parameter equal to the required buffer size in bytes.
Order : [int] A Boolean value that specifies whether the TCP connection table should be sorted. If this parameter is TRUE, the table is sorted in ascending order, starting with the lowest local IP address.  If this parameter is FALSE, the table appears in the order in which they were retrieved. The following values are compared (as listed) when ordering the TCP endpoints:
%inst
Retrieves the TCP connection table for IPv6. (GetTcp6Table)

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetTcp6Table function is defined on Windows Vista and later.


%index
GetTcp6Table2
Retrieves the TCP connection table for IPv6. (GetTcp6Table2)
%group
Win32 iphlpapi
%prm
TcpTable, SizePointer, Order
TcpTable : [var] A pointer to a buffer that receives the TCP connection table for IPv6 as a MIB_TCP6TABLE2 structure.
SizePointer : [var] On input, specifies the size of the buffer pointed to by the TcpTable parameter.
Order : [int] A value that specifies whether the TCP connection table should be sorted. If this parameter is TRUE, the table is sorted in ascending order, starting with the lowest local IP address.  If this parameter is FALSE, the table appears in the order in which they were retrieved. The following values are compared (as listed) when ordering the TCP endpoints:
%inst
Retrieves the TCP connection table for IPv6. (GetTcp6Table2)

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetTcp6Table2 function is defined on Windows Vista and later. The
GetTcp6Table2 function is an enhanced version of the GetTcp6Table
function that also retrieves information on the TCP offload state of
the TCP connection.


%index
GetTcpStatistics
The GetTcpStatistics function retrieves the TCP statistics for the local computer.
%group
Win32 iphlpapi
%prm
Statistics
Statistics : [var] A pointer to a MIB_TCPSTATS structure that receives the TCP statistics for the local computer.
%inst
The GetTcpStatistics function retrieves the TCP statistics for the
local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetTcpStatistics function returns the TCP statistics for IPv4 on
the current computer. On Windows XP and later, the GetTcpStatisticsEx
can be used to obtain the TCP statistics for either IPv4 or IPv6.


%index
GetTcpStatisticsEx
The GetTcpStatisticsEx function retrieves the Transmission Control Protocol (TCP) statistics for the current computer.
%group
Win32 iphlpapi
%prm
Statistics, Family
Statistics : [var] A pointer to a MIB_TCPSTATS structure that receives the TCP statistics for the local computer.
Family : [int] 
%inst
The GetTcpStatisticsEx function retrieves the Transmission Control
Protocol (TCP) statistics for the current computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.


%index
GetTcpStatisticsEx2
The GetTcpStatisticsEx2 function retrieves the Transmission Control Protocol (TCP) statistics for the current computer.
%group
Win32 iphlpapi
%prm
Statistics, Family
Statistics : [var] A pointer to a MIB_TCPSTATS2 structure that receives the TCP statistics for the local computer.
Family : [int] 
%inst
The GetTcpStatisticsEx2 function retrieves the Transmission Control
Protocol (TCP) statistics for the current computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.


%index
GetTcpTable
Retrieves the IPv4 TCP connection table. (GetTcpTable)
%group
Win32 iphlpapi
%prm
TcpTable, SizePointer, Order
TcpTable : [var] A pointer to a buffer that receives the TCP connection table as a MIB_TCPTABLE structure.
SizePointer : [var] On input, specifies the size in  bytes  of the buffer pointed to by the pTcpTable parameter. On output, if the buffer is not large enough to hold the returned connection table, the function sets this parameter equal to the required buffer size in bytes. On the Windows SDK released for Windows?Vista and later, the data type for this parameter is changed to a PULONG which is equivalent to a PDWORD.
Order : [int] A Boolean value that specifies whether the TCP connection table should be sorted. If this parameter is TRUE, the table is sorted in the order of:
%inst
Retrieves the IPv4 TCP connection table. (GetTcpTable)

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
On the Windows SDK released for Windows Vista and later, the return
value from the GetTcpTable function is changed to a data type of
ULONG which is equivalent to a DWORD.


%index
GetTcpTable2
Retrieves the IPv4 TCP connection table. (GetTcpTable2)
%group
Win32 iphlpapi
%prm
TcpTable, SizePointer, Order
TcpTable : [var] A pointer to a buffer that receives the TCP connection table as a MIB_TCPTABLE2 structure.
SizePointer : [var] On input, specifies the size of the buffer pointed to by the TcpTable parameter.
Order : [int] A value that specifies whether the TCP connection table should be sorted. If this parameter is TRUE, the table is sorted in the order of:
%inst
Retrieves the IPv4 TCP connection table. (GetTcpTable2)

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetTcpTable2 function is defined on Windows Vista and later. The
GetTcpTable2 function is an enhanced version of the GetTcpTable
function that also retrieves information on the TCP offload state of
the TCP connection.


%index
GetTeredoPort
Retrieves the dynamic UDP port number used by the Teredo client on the local computer.
%group
Win32 iphlpapi
%prm
Port
Port : [var] A pointer to the  UDP port number. On successful return, this parameter will be filled with the port number used by the Teredo client.
%inst
Retrieves the dynamic UDP port number used by the Teredo client on
the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetTeredoPort function is defined on Windows Vista and later. The
GetTeredoPort function retrieves the current UDP port number used by
the Teredo client for the Teredo service port. The Teredo port is
dynamic and can change any time the Teredo client is restarted on the
local computer. An application can register to be notified when the
Teredo service port changes by calling the NotifyTeredoPortChange
function. The Teredo client also uses static UDP port 3544 for
listening to multicast traffic sent on multicast IPv4 address
224.0.0.253 as defined in RFC 4380. For more information, see
http://www.ietf.org/rfc/rfc4380.txt. The GetTeredoPort function is
used primarily by firewall applications in order to configure the
appropriate exceptions to allow incoming and outgoing Teredo traffic.


%index
GetUdp6Table
Retrieves the IPv6 User Datagram Protocol (UDP) listener table.
%group
Win32 iphlpapi
%prm
Udp6Table, SizePointer, Order
Udp6Table : [var] A pointer to a buffer that receives the IPv6 UDP listener table as a MIB_UDP6TABLE structure.
SizePointer : [var] On input, specifies the size in bytes of the buffer pointed to by the Udp6Table parameter.
Order : [int] A Boolean value that specifies whether the returned UDP listener table should be sorted. If this parameter is TRUE, the table is sorted in the order of:
%inst
Retrieves the IPv6 User Datagram Protocol (UDP) listener table.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetUdp6Table function is defined on Windows Vista and later.


%index
GetUdpStatistics
The GetUdpStatistics function retrieves the User Datagram Protocol (UDP) statistics for the local computer.
%group
Win32 iphlpapi
%prm
Stats
Stats : [var] Pointer to a MIB_UDPSTATS structure that receives the UDP statistics for the local computer.
%inst
The GetUdpStatistics function retrieves the User Datagram Protocol
(UDP) statistics for the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, use FormatMessage to obtain the message string for
the returned error.

[備考]
Windows Server 2003 and Windows XP: Use the GetUdpStatisticsEx
function to obtain the UDP statistics for the IPv6 protocol.


%index
GetUdpStatisticsEx
The GetUdpStatisticsEx function retrieves the User Datagram Protocol (UDP) statistics for the current computer.
%group
Win32 iphlpapi
%prm
Statistics, Family
Statistics : [var] A pointer to a MIB_UDPSTATS structure that receives the UDP statistics for the local computer.
Family : [int] 
%inst
The GetUdpStatisticsEx function retrieves the User Datagram Protocol
(UDP) statistics for the current computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.


%index
GetUdpStatisticsEx2
The GetUdpStatisticsEx2 function retrieves the User Datagram Protocol (UDP) statistics for the current computer.
%group
Win32 iphlpapi
%prm
Statistics, Family
Statistics : [var] A pointer to a MIB_UDPSTATS2 structure that receives the UDP statistics for the local computer.
Family : [int] 
%inst
The GetUdpStatisticsEx2 function retrieves the User Datagram Protocol
(UDP) statistics for the current computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.


%index
GetUdpTable
Retrieves the IPv4 User Datagram Protocol (UDP) listener table.
%group
Win32 iphlpapi
%prm
UdpTable, SizePointer, Order
UdpTable : [var] A pointer to a buffer that receives the IPv4 UDP listener table as a MIB_UDPTABLE structure.
SizePointer : [var] On input, specifies the size in bytes of the buffer pointed to by the UdpTable parameter.
Order : [int] A Boolean value that specifies whether the returned UDP listener table should be sorted. If this parameter is TRUE, the table is sorted in the order of:
%inst
Retrieves the IPv4 User Datagram Protocol (UDP) listener table.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
On the Windows SDK released for Windows Vista and later, the return
value from the GetUdpTable function is changed to a data type of
ULONG which is equivalent to a DWORD.


%index
GetUniDirectionalAdapterInfo
The GetUniDirectionalAdapterInfo function retrieves information about the unidirectional adapters installed on the local computer. A unidirectional adapter is an adapter that can receive datagrams, but not transmit them.
%group
Win32 iphlpapi
%prm
pIPIfInfo, dwOutBufLen
pIPIfInfo : [var] Pointer to an IP_UNIDIRECTIONAL_ADAPTER_ADDRESS structure that receives information about the unidirectional adapters installed on the local computer.
dwOutBufLen : [var] Pointer to a ULONG variable that receives the size of the structure pointed to by the pIPIfInfo parameter.
%inst
The GetUniDirectionalAdapterInfo function retrieves information about
the unidirectional adapters installed on the local computer. A
unidirectional adapter is an adapter that can receive datagrams, but
not transmit them.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, use FormatMessage to obtain the message string for
the returned error.


%index
GetUnicastIpAddressEntry
Retrieves information for an existing unicast IP address entry on the local computer.
%group
Win32 iphlpapi
%prm
Row
Row : [var] A pointer to a MIB_UNICASTIPADDRESS_ROW structure entry for a unicast IP address entry. On successful return, this structure will be updated with the properties for an existing unicast IP address.
%inst
Retrieves information for an existing unicast IP address entry on the
local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetUnicastIpAddressEntry function is defined on Windows Vista and
later. The GetUnicastIpAddressEntry function is normally used to
retrieve an existing MIB_UNICASTIPADDRESS_ROW structure entry to be
modified. An application can then change the members in the
MIB_UNICASTIPADDRESS_ROW entry it wishes to modify, and then call the
SetUnicastIpAddressEntry function. On input, the Address member in
the MIB_UNICASTIPADDRESS_ROW structure pointed to by the Row
parameter must be initialized to a valid unicast IPv4 or IPv6
address. The si_family member of the SOCKADDR_INET structure in the
Address member must be initialized to either AF_INET or AF_INET6 and
the related Ipv4 or Ipv6 member of the SOCKADDR_INET structure must
be set to a valid unicast IP address. In addition, at least one of
the following members in the MIB_UNICASTIPADDRESS_ROW structure
pointed to the Row parameter must be initialized: the InterfaceLuid
or InterfaceIndex. The fields are used in the order listed above. So
if the InterfaceLuid is specified, then this member is used to
determine the interface. If no value is set for the InterfaceLuid
member (the value of this member is set to zero), then the
InterfaceIndex member is next used to determine the interface. On
output when the call is successful, GetUnicastIpAddressEntry
retrieves the other properties for the unicast IP address and fills
out the MIB_UNICASTIPADDRESS_ROW structure pointed to by the Row
parameter. The GetUnicastIpAddressTable function can be called to
enumerate the unicast IP address entries on a local computer.


%index
GetUnicastIpAddressTable
Retrieves the unicast IP address table on the local computer.
%group
Win32 iphlpapi
%prm
Family, Table
Family : [int] The address family to retrieve. Possible values for the address family are listed in the Winsock2.h header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, AF_INET and PF_INET), so either constant can be used. On the Windows SDK released for Windows?Vista and later, the organization of header files has changed and possible values for this member are defined in the Ws2def.h header file. Note that the Ws2def.h header file is automatically included in Winsock2.h, and should never be used directly. The values currently supported are AF_INET, AF_INET6, and AF_UNSPEC.
Table : [var] A pointer to a MIB_UNICASTIPADDRESS_TABLE structure that contains a table of unicast IP address entries on the local computer.
%inst
Retrieves the unicast IP address table on the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The GetUnicastIpAddressTable function is defined on Windows Vista and
later. The GetUnicastIpAddressTable function enumerates the unicast
IP addresses on a local system and returns this information in an
MIB_UNICASTIPADDRESS_TABLE structure. The unicast IP address entries
are returned in a MIB_UNICASTIPADDRESS_TABLE structure in the buffer
pointed to by the Table parameter. The MIB_UNICASTIPADDRESS_TABLE
structure contains a unicast IP address entry count and an array of
MIB_UNICASTIPADDRESS_ROW structures for each unicast IP address
entry. When these returned structures are no longer required, free
the memory by calling the FreeMibTable. The Family parameter must be
initialized to either AF_INET, AF_INET6, or AF_UNSPEC. Note that the
returned MIB_UNICASTIPADDRESS_TABLE structure pointed to by the Table
parameter may contain padding for alignment between the NumEntries
member and the first MIB_UNICASTIPADDRESS_ROW array entry in the
Table member of the MIB_UNICASTIPADDRESS_TABLE structure. Padding for
alignment may also be present between the MIB_UNICASTIPADDRESS_ROW
array entries. Any access to a MIB_UNICASTIPADDRESS_ROW array entry
should assume padding may exist.


%index
Icmp6CreateFile
The Icmp6CreateFile function opens a handle on which IPv6 ICMP echo requests can be issued.
%group
Win32 iphlpapi
%prm

%inst
The Icmp6CreateFile function opens a handle on which IPv6 ICMP echo
requests can be issued.

[戻り値]
The Icmp6CreateFile function returns an open handle on success. On
failure, the function returns INVALID_HANDLE_VALUE. Call the
GetLastError function for extended error information.

[備考]
The Icmp6CreateFile function opens a handle on which IPv6 ICMP echo
requests can be issued. The Icmp6SendEcho2 function is used to send
the IPv6 ICMP echo requests. The Icmp6ParseReplies function is used
to parse the IPv6 ICMP replies. The IcmpCloseHandle function is used
to close the ICMP handle opened by the Icmp6CreateFile function. For
IPv4, use the IcmpCreateFile function. For IPv4, use the
IcmpCreateFile, IcmpSendEcho, IcmpSendEcho2, IcmpSendEcho2Ex, and
IcmpParseReplies functions. Note that the include directive for
Iphlpapi.h header file must be placed before the Icmpapi.h header
file.


%index
Icmp6ParseReplies
The Icmp6ParseReplies function parses the reply buffer provided and returns an IPv6 ICMPv6 echo response reply if found.
%group
Win32 iphlpapi
%prm
ReplyBuffer, ReplySize
ReplyBuffer : [intptr] A pointer to the buffer passed to the Icmp6SendEcho2 function. This parameter is points to an ICMPV6_ECHO_REPLY structure to hold the response.
ReplySize : [int] The size, in bytes, of the buffer pointed to by the ReplyBuffer parameter.
%inst
The Icmp6ParseReplies function parses the reply buffer provided and
returns an IPv6 ICMPv6 echo response reply if found.

[戻り値]
The Icmp6ParseReplies function returns 1 on success. In this case,
the Status member in the ICMPV6_ECHO_REPLY structure pointed to by
the ReplyBuffer parameter will be either IP_SUCCESS if the target
node responded or IP_TTL_EXPIRED_TRANSIT. If the return value is
zero, extended error information is available through GetLastError.
This doc was truncated.

[備考]
The Icmp6ParseReplies function is used by IPv6 to parse replies that
result from an ICMPv6 echo request. The Icmp6ParseReplies function
parses a reply buffer previously passed to the Icmp6SendEcho2
function. Use the Icmp6ParseReplies function only with the
Icmp6SendEcho2 function. The Icmp6ParseReplies function cannot be
used on a reply buffer previously passed to IcmpSendEcho or
IcmpSendEcho2 for IPv4. For IPv4, use the IcmpCreateFile,
IcmpSendEcho, IcmpSendEcho2, IcmpSendEcho2Ex, and IcmpParseReplies
functions. Note that the include directive for Iphlpapi.h header file
must be placed before the Icmpapi.h header file.


%index
Icmp6SendEcho2
The Icmp6SendEcho2 function sends an IPv6 ICMPv6 echo request and returns either immediately (if Event or ApcRoutine is non-NULL) or returns after the specified time-out. The ReplyBuffer contains the IPv6 ICMPv6 echo response, if any.
%group
Win32 iphlpapi
%prm
IcmpHandle, Event, ApcRoutine, ApcContext, SourceAddress, DestinationAddress, RequestData, RequestSize, RequestOptions, ReplyBuffer, ReplySize, Timeout
IcmpHandle : [intptr] The open handle returned by Icmp6CreateFile.
Event : [intptr] An event to be signaled whenever an ICMPv6 response arrives. If this parameter is specified, it requires a handle to a valid event object. Use the CreateEvent or CreateEventEx function to create this event object. For more information on using events, see Event Objects.
ApcRoutine : [int] The routine that is called when the calling thread is in an alertable thread and  an ICMPv6 reply arrives. On Windows?Vista and later, PIO_APC_ROUTINE_DEFINED must be defined to force the datatype for this parameter to PIO_APC_ROUTINE rather than FARPROC. On Windows Server?2003 and Windows?XP, PIO_APC_ROUTINE_DEFINED must not be defined to force the datatype for this parameter to FARPROC.
ApcContext : [intptr] An optional parameter passed to the callback routine specified in the  ApcRoutine parameter whenever an ICMPv6 response arrives or an error occurs.
SourceAddress : [var] The IPv6 source address on which to issue the echo request, in the form of a sockaddr structure.
DestinationAddress : [var] The IPv6 destination address of the echo request, in the form of a sockaddr structure.
RequestData : [intptr] A pointer to a buffer that contains data to send in the request.
RequestSize : [int] The size, in bytes, of the request data buffer pointed to by the RequestData parameter.
RequestOptions : [var] A pointer to the IPv6 header options for the request, in the form of an IP_OPTION_INFORMATION structure. On a 64-bit platform, this parameter is in the form for an IP_OPTION_INFORMATION32 structure. This parameter may be NULL if no IP header options need to be specified. Note??On Windows Server?2003 and Windows?XP, the RequestOptions parameter is not optional and must not be NULL and only the Ttl and Flags members are used.
ReplyBuffer : [intptr] A pointer to a buffer to hold replies to the request. Upon return, the buffer contains an ICMPV6_ECHO_REPLY structure followed by the message body from the ICMPv6 echo response reply data. The buffer must be large enough to hold at least one ICMPV6_ECHO_REPLY structure plus the number of bytes of data specified in the RequestSize parameter. This buffer should also be large enough to also hold 8 more bytes of data (the size of an ICMP error message) plus space for an IO_STATUS_BLOCK structure.
ReplySize : [int] The size, in bytes,  of the reply buffer pointed to by the ReplyBuffer parameter. This buffer should be large enough to hold at least one ICMPV6_ECHO_REPLY structure plus RequestSize bytes of data. This buffer should also be large enough to also hold 8 more bytes of data (the size of an ICMP error message) plus space for an IO_STATUS_BLOCK structure.
Timeout : [int] The time, in milliseconds, to wait for replies. This parameter is only used if the Icmp6SendEcho2 function is called synchronously. So this parameter is not used if either the ApcRoutine or Event parameter are not NULL.
%inst
The Icmp6SendEcho2 function sends an IPv6 ICMPv6 echo request and
returns either immediately (if Event or ApcRoutine is non-NULL) or
returns after the specified time-out. The ReplyBuffer contains the
IPv6 ICMPv6 echo response, if any.

[戻り値]
When called synchronously, the Icmp6SendEcho2 function returns the
number of replies received and stored in ReplyBuffer. If the return
value is zero, call GetLastError for extended error information. When
called asynchronously, the Icmp6SendEcho2 function returns
ERROR_IO_PENDING to indicate the operation is in progress. The
results can be retrieved later when the event specified in the Event
parameter signals or the callback function in the ApcRoutine
parameter is called. If the return value is zero, call GetLastError
for extended error information. If the function fails, the extended
error code returned by GetLastError can be one of the following
values.
This doc was truncated.

[備考]
The Icmp6SendEcho2 function is called synchronously if the ApcRoutine
or Event parameters are NULL. When called synchronously, the return
value contains the number of replies received and stored in
ReplyBuffer after waiting for the time specified in the Timeout
parameter. If the return value is zero, call GetLastError for
extended error information. The Icmp6SendEcho2 function is called
asynchronously when either the ApcRoutine or Event parameters are
specified. When called asynchronously, the ReplyBuffer and ReplySize
parameters are required to accept the response. ICMP response data is
copied to the ReplyBuffer provided and the application is signaled
(when the Event parameter is specified) or the callback function is
called (when the ApcRoutine parameter is specified). The application
must parse the data pointed to by ReplyBuffer parameter using the
Icmp6ParseReplies function. If the Event parameter is specified, the
Icmp6SendEcho2 function is called asynchronously. The event specified
in the Event parameter is signaled whenever an ICMPv6 response
arrives. Use the CreateEvent function to create this event object. If
the ApcRoutine parameter is specified, the Icmp6SendEcho2 function is
called asynchronously. The ApcRoutine parameter should point to a
user-defined callback function. The callback function specified in
the ApcRoutine parameter is called whenever an ICMPv6 response
arrives. The invocation of the callback function specified in the
ApcRoutine parameter is serialized. If both the Event and ApcRoutine
parameters are specified, the event specified in the Event parameter
is signaled whenever an ICMPv6 response arrives, but the callback
function specified in the ApcRoutine parameter is ignored . On
Windows Vista and later, any application that calls Icmp6SendEcho2
function asynchronously using the ApcRoutine parameter must define
PIO_APC_ROUTINE_DEFINED to force the datatype for the ApcRoutine
parameter to PIO_APC_ROUTINE rather than FARPROC. Note
PIO_APC_ROUTINE_DEFINED must be defined before the Icmpapi.h header
file is included.
On Windows Vista and later, the callback function pointed to by the
ApcRoutine must be defined as a function of type VOID with the
following syntax:
This doc was truncated.


%index
IcmpCloseHandle
The IcmpCloseHandle function closes a handle opened by a call to the IcmpCreateFile or Icmp6CreateFile functions.
%group
Win32 iphlpapi
%prm
IcmpHandle
IcmpHandle : [intptr] The handle to close. This handle must have been returned by a call to IcmpCreateFile or Icmp6CreateFile.
%inst
The IcmpCloseHandle function closes a handle opened by a call to the
IcmpCreateFile or Icmp6CreateFile functions.

[戻り値]
If the handle is closed successfully the return value is TRUE,
otherwise FALSE. Call the GetLastError function for extended error
information.

[備考]
The IcmpCloseHandle function is exported from the Icmp.dll on Windows
2000. The IcmpCloseHandle function is exported from the Iphlpapi.dll
on Windows XP and later. Windows version checking is not recommended
to use this function. Applications requiring portability with this
function across Windows 2000, Windows XP, Windows Server 2003 and
later Windows versions should not statically link to either the
Icmp.lib or the Iphlpapi.lib file. Instead, the application should
check for the presence of IcmpCloseHandle in the Iphlpapi.dll with
calls to LoadLibrary and GetProcAddress. Failing that, the
application should check for the presence of IcmpCloseHandle in the
Icmp.dll with calls to LoadLibrary and GetProcAddress. Note that the
include directive for Iphlpapi.h header file must be placed before
the Icmpapi.h header file.


%index
IcmpCreateFile
The IcmpCreateFile function opens a handle on which IPv4 ICMP echo requests can be issued.
%group
Win32 iphlpapi
%prm

%inst
The IcmpCreateFile function opens a handle on which IPv4 ICMP echo
requests can be issued.

[戻り値]
The IcmpCreateFile function returns an open handle on success. On
failure, the function returns INVALID_HANDLE_VALUE. Call the
GetLastError function for extended error information.

[備考]
The IcmpCreateFile function is exported from the Icmp.dll on Windows
2000. The IcmpCreateFile function is exported from the Iphlpapi.dll
on Windows XP and later. Windows version checking is not recommended
to use this function. Applications requiring portability with this
function across Windows 2000, Windows XP, Windows Server 2003 and
later Windows versions should not statically link to either the
Icmp.lib or the Iphlpapi.lib file. Instead, the application should
check for the presence of IcmpCreateFile in the Iphlpapi.dll with
calls to LoadLibrary and GetProcAddress. Failing that, the
application should check for the presence of IcmpCreateFile in the
Icmp.dll with calls to LoadLibrary and GetProcAddress. For IPv6, use
the Icmp6CreateFile, Icmp6SendEcho2, and Icmp6ParseReplies functions.
Note that the include directive for Iphlpapi.h header file must be
placed before the Icmpapi.h header file.


%index
IcmpParseReplies
Parses the reply buffer provided and returns the number of ICMP echo request responses found.
%group
Win32 iphlpapi
%prm
ReplyBuffer, ReplySize
ReplyBuffer : [intptr] The buffer passed to IcmpSendEcho2. This is rewritten to hold an array of ICMP_ECHO_REPLY structures, its type is PICMP_ECHO_REPLY. On a 64-bit platform, this buffer is rewritten to hold an array of ICMP_ECHO_REPLY32 structures, its type is PICMP_ECHO_REPLY32.
ReplySize : [int] The size, in bytes, of the buffer pointed to by the ReplyBuffer parameter.
%inst
Parses the reply buffer provided and returns the number of ICMP echo
request responses found.

[戻り値]
The IcmpParseReplies function returns the number of ICMP responses
found on success. The function returns zero on error. Call
GetLastError for additional error information.

[備考]
The IcmpParseReplies function should not be used on a reply buffer
previously passed to IcmpSendEcho. The IcmpSendEcho function parses
that buffer before returning to the user. Use this function only with
IcmpSendEcho2. The IcmpParseReplies function is exported from the
Icmp.dll on Windows 2000. The IcmpParseReplies function is exported
from the Iphlpapi.dll on Windows XP and later. Windows version
checking is not recommended to use this function. Applications
requiring portability with this function across Windows 2000, Windows
XP, Windows Server 2003 and later Windows versions should not
statically link to either the Icmp.lib or the Iphlpapi.lib file.
Instead, the application should check for the presence of
IcmpParseReplies in the Iphlpapi.dll with calls to LoadLibrary and
GetProcAddress. Failing that, the application should check for the
presence of IcmpParseReplies in the Icmp.dll with calls to
LoadLibrary and GetProcAddress. Note that the include directive for
Iphlpapi.h header file must be placed before the Icmpapi.h header
file.


%index
IcmpSendEcho
The IcmpSendEcho function sends an IPv4 ICMP echo request and returns any echo response replies. The call returns when the time-out has expired or the reply buffer is filled.
%group
Win32 iphlpapi
%prm
IcmpHandle, DestinationAddress, RequestData, RequestSize, RequestOptions, ReplyBuffer, ReplySize, Timeout
IcmpHandle : [intptr] The open handle returned by the IcmpCreateFile function.
DestinationAddress : [int] The IPv4 destination address of the echo request, in the form of an IPAddr structure.
RequestData : [intptr] A pointer to a buffer that contains data to send in the request.
RequestSize : [int] The size, in bytes, of the request data buffer pointed to by the RequestData parameter.
RequestOptions : [var] A pointer to the IP header options for the request, in the form of an IP_OPTION_INFORMATION structure. On a 64-bit platform, this parameter is in the form for an IP_OPTION_INFORMATION32 structure. This parameter may be NULL if no IP header options need to be specified.
ReplyBuffer : [intptr] A buffer to hold any replies to the echo request. Upon return, the buffer contains an array of ICMP_ECHO_REPLY structures followed by the options and data for the replies. The buffer should be large enough to hold at least one ICMP_ECHO_REPLY structure plus RequestSize bytes of data.
ReplySize : [int] The allocated size, in bytes,  of the reply buffer. The buffer should be large enough to hold at least one ICMP_ECHO_REPLY structure plus RequestSize bytes of data. This buffer should also be large enough to also hold 8 more bytes of data (the size of an ICMP error message).
Timeout : [int] The time, in milliseconds, to wait for replies.
%inst
The IcmpSendEcho function sends an IPv4 ICMP echo request and returns
any echo response replies. The call returns when the time-out has
expired or the reply buffer is filled.

[戻り値]
The IcmpSendEcho function returns the number of ICMP_ECHO_REPLY
structures stored in the ReplyBuffer. The status of each reply is
contained in the structure. If the return value is zero, call
GetLastError for additional error information. If the function fails,
the extended error code returned by GetLastError can be one of the
following values.
This doc was truncated.

[備考]
The IcmpSendEcho function send an ICMP echo request to the specified
address and returns the number of replies received and stored in
ReplyBuffer. The IcmpSendEcho function is a synchronous function and
returns after waiting for the time specified in the Timeout parameter
for a response. If the return value is zero, call GetLastError for
extended error information. The IcmpSendEcho2 and IcmpSendEcho2Ex
functions are enhanced version of IcmpSendEcho that support
asynchronous operation. The IcmpSendEcho2Ex function also allows the
source IP address to be specified. This feature is useful on
computers with multiple network interfaces. For IPv6, use the
Icmp6CreateFile, Icmp6SendEcho2, and Icmp6ParseReplies functions. The
IcmpSendEcho function is exported from the Icmp.dll on Windows 2000.
The IcmpSendEcho function is exported from the Iphlpapi.dll on
Windows XP and later. Windows version checking is not recommended to
use this function. Applications requiring portability with this
function across Windows 2000, Windows XP, Windows Server 2003 and
later Windows versions should not statically link to either the
Icmp.lib or the Iphlpapi.lib file. Instead, the application should
check for the presence of IcmpSendEcho in the Iphlpapi.dll with calls
to LoadLibrary and GetProcAddress. Failing that, the application
should check for the presence of IcmpSendEcho in the Icmp.dll with
calls to LoadLibrary and GetProcAddress. Note that the include
directive for Iphlpapi.h header file must be placed before the
Icmpapi.h header file.


%index
IcmpSendEcho2
The **IcmpSendEcho2** function sends an IPv4 ICMP echo request, and returns either immediately (if *Event* or *ApcRoutine* is non-**NULL**), or returns after the specified time-out. The *ReplyBuffer* contains the ICMP echo responses, if any.
%group
Win32 iphlpapi
%prm
IcmpHandle, Event, ApcRoutine, ApcContext, DestinationAddress, RequestData, RequestSize, RequestOptions, ReplyBuffer, ReplySize, Timeout
IcmpHandle : [intptr] The open handle returned by the [ICMPCreateFile](/windows/win32/api/icmpapi/nf-icmpapi-icmpcreatefile) function.
Event : [intptr] An event to be signaled (at most once) when an ICMP response arrives. If this parameter is specified, then it requires a handle to a valid event object. Use the [CreateEvent](/windows/win32/api/synchapi/nf-synchapi-createeventa) or [CreateEventEx](/windows/win32/api/synchapi/nf-synchapi-createeventexa) function to create this event object. For more information on using events, see [Event objects](/windows/win32/Sync/event-objects).
ApcRoutine : [int] The routine that's called when the calling thread is in an alertable thread, and an ICMPv4 reply arrives. **PIO_APC_ROUTINE_DEFINED** must be defined in order to force the datatype for this parameter to **PIO_APC_ROUTINE** rather than **FARPROC**.
ApcContext : [intptr] An optional parameter passed to the callback routine specified in the *ApcRoutine* parameter (at most once) when an ICMP response arrives, or an error occurs.
DestinationAddress : [int] The IPv4 destination of the echo request, in the form of an [IPAddr](/windows/win32/api/inaddr/ns-inaddr-in_addr) structure.
RequestData : [intptr] A pointer to a buffer that contains data to send in the request.
RequestSize : [int] The size, in bytes, of the request data buffer pointed to by the *RequestData* parameter.
RequestOptions : [var] A pointer to the IP header options for the request, in the form of an [IP_OPTION_INFORMATION](/windows/win32/api/ipexport/ns-ipexport-ip_option_information) structure. This parameter may be **NULL** if no IP header options need to be specified.
ReplyBuffer : [intptr] A pointer to a buffer to hold any replies to the request. Upon return, the buffer contains an array of [ICMP_ECHO_REPLY](/windows/win32/api/ipexport/ns-ipexport-icmp_echo_reply) structures followed by options and data. The buffer must be large enough to hold at least one **ICMP_ECHO_REPLY** structure, plus *RequestSize* bytes of data, plus an additional 8 bytes of data (the size of an ICMP error message).
ReplySize : [int] The allocated size, in bytes, of the reply buffer. The buffer must be large enough to hold at least one **ICMP_ECHO_REPLY** structure, plus *RequestSize* bytes of data, plus an additional 8 bytes of data (the size of an ICMP error message).
Timeout : [int] The time in milliseconds to wait for replies.
%inst
The **IcmpSendEcho2** function sends an IPv4 ICMP echo request, and
returns either immediately (if *Event* or *ApcRoutine* is
non-**NULL**), or returns after the specified time-out. The
*ReplyBuffer* contains the ICMP echo responses, if any.

[戻り値]
When called synchronously, the **IcmpSendEcho2** function returns the
number of replies received and stored in *ReplyBuffer*. If the return
value is zero, then for extended error information call
[GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
When called asynchronously, the **IcmpSendEcho2** function returns
zero. A subsequent call to
[GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
returns extended error code **ERROR_IO_PENDING** to indicate that the
operation is in progress. The results can be retrieved later when the
event specified in the *Event* parameter signals, or the callback
function in the *ApcRoutine* parameter is called. If the return value
is zero, then for extended error information call
[GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
If the function fails, then the extended error code returned by
**GetLastError** can be one of the following values. |Return
code|Description| |-|-| |**ERROR_INVALID_PARAMETER**|An invalid
parameter was passed to the function. This error is returned if the
*IcmpHandle* parameter contains an invalid handle. This error can
also be returned if the *ReplySize* parameter specifies a value less
than the size of an
[ICMP_ECHO_REPLY](/windows/win32/api/ipexport/ns-ipexport-icmp_echo_reply)
structure.| |**ERROR_IO_PENDING**|The operation is in progress. This
value is returned by a successful asynchronous call to
**IcmpSendEcho2**, and is not an indication of an error.|
|**ERROR_NOT_ENOUGH_MEMORY**|Not enough memory is available to
complete the operation.| |**ERROR_NOT_SUPPORTED**|The request is not
supported. This error is returned if no IPv4 stack is on the local
computer.| |**IP_BUF_TOO_SMALL**|The size of the *ReplyBuffer*
specified in the *ReplySize* parameter was too small.| |**Other**|Use
[FormatMessage](/windows/win32/api/winbase/nf-winbase-formatmessage)
to obtain the message string for the returned error.|

[備考]
The **IcmpSendEcho2** function is called synchronously if the
*ApcRoutine* or *Event* parameters are **NULL**. When called
synchronously, the return value contains the number of replies
received and stored in *ReplyBuffer* after waiting for the time
specified in the *Timeout* parameter. If the return value is zero,
then for extended error information call
[GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
The **IcmpSendEcho2** function is called asynchronously when either
the *ApcRoutine* or *Event* parameters are specified. When called
asynchronously, the *ReplyBuffer* and *ReplySize* parameters are
required to accept the response. ICMP response data is copied to the
*ReplyBuffer* provided, and the application is signaled (when the
*Event* parameter is specified) or the callback function is called
(when the *ApcRoutine* parameter is specified). The application must
parse the data pointed to by *ReplyBuffer* parameter using the
[IcmpParseReplies](/windows/win32/api/icmpapi/nf-icmpapi-icmpparsereplies)
function. If the *Event* parameter is specified, then the
**IcmpSendEcho2** function is called asynchronously. The event
specified in the *Event* parameter is signaled (at most once) when an
ICMP response arrives. Use the
[CreateEvent](/windows/win32/api/synchapi/nf-synchapi-createeventa)
or
[CreateEventEx](/windows/win32/api/synchapi/nf-synchapi-createeventexa)
function to create this event object. If the *ApcRoutine* parameter
is specified, then the **IcmpSendEcho2** function is called
asynchronously. The *ApcRoutine* parameter should point to a
user-defined callback function. The callback function specified in
the *ApcRoutine* parameter is called (at most once) when an ICMP
response arrives. The invocation of the callback function specified
in the *ApcRoutine* parameter is serialized. If both the *Event* and
*ApcRoutine* parameters are specified, then the event specified in
the *Event* parameter is signaled (at most once) when an ICMP
response arrives, but the callback function specified in the
*ApcRoutine* parameter is ignored. Any application that calls
**IcmpSendEcho2** function asynchronously using the *ApcRoutine*
parameter must define **PIO_APC_ROUTINE_DEFINED** to force the
datatype for the *ApcRoutine* parameter to **PIO_APC_ROUTINE** rather
than **FARPROC**. > [!NOTE] > **PIO_APC_ROUTINE_DEFINED** must be
defined before the *Icmpapi.h* header file is included. The callback
function pointed to by the *ApcRoutine* must be defined as a function
of type **VOID** with the following syntax:
This doc was truncated.


%index
IcmpSendEcho2Ex
Sends an IPv4 ICMP echo request and returns either immediately (if Event or ApcRoutine is non-NULL) or returns after the specified time-out. The ReplyBuffer contains the ICMP responses, if any.
%group
Win32 iphlpapi
%prm
IcmpHandle, Event, ApcRoutine, ApcContext, SourceAddress, DestinationAddress, RequestData, RequestSize, RequestOptions, ReplyBuffer, ReplySize, Timeout
IcmpHandle : [intptr] An open handle returned by the ICMPCreateFile function.
Event : [intptr] An event to be signaled whenever an ICMP response arrives. If this parameter is specified, it requires a handle to a valid event object. Use the CreateEvent or CreateEventEx function to create this event object. For more information on using events, see Event Objects.
ApcRoutine : [int] The routine that is called when the calling thread is in an alertable thread and  an ICMP reply arrives. PIO_APC_ROUTINE_DEFINED must be defined to force the datatype for this parameter to PIO_APC_ROUTINE rather than FARPROC.
ApcContext : [intptr] An optional parameter passed to the callback routine specified in the  ApcRoutine parameter whenever an ICMP response arrives or an error occurs.
SourceAddress : [int] The IPv4 source address on which to issue the echo request. This address is in the form of an IPAddr structure.
DestinationAddress : [int] The IPv4 destination address for the echo request. This address is in the form of an IPAddr structure.
RequestData : [intptr] A pointer to a buffer that contains data to send in the request.
RequestSize : [int] The size, in bytes, of the request data buffer pointed to by the RequestData parameter.
RequestOptions : [var] A pointer to the IP header options for the request, in the form of an IP_OPTION_INFORMATION structure. On a 64-bit platform, this parameter is in the form for an IP_OPTION_INFORMATION32 structure. This parameter may be NULL if no IP header options need to be specified.
ReplyBuffer : [intptr] A pointer to a buffer to hold any replies to the request. Upon return, the buffer contains an array of ICMP_ECHO_REPLY structures followed by options and data. The buffer must be large enough to hold at least one ICMP_ECHO_REPLY structure plus RequestSize bytes of data. This buffer should also be large enough to also hold 8 more bytes of data (the size of an ICMP error message) plus space for an IO_STATUS_BLOCK structure.
ReplySize : [int] The allocated size, in bytes,  of the reply buffer. The buffer should be large enough to hold at least one ICMP_ECHO_REPLY structure plus RequestSize bytes of data. This buffer should also be large enough to also hold 8 more bytes of data (the size of an ICMP error message) plus space for an IO_STATUS_BLOCK structure.
Timeout : [int] The time, in milliseconds, to wait for replies.
%inst
Sends an IPv4 ICMP echo request and returns either immediately (if
Event or ApcRoutine is non-NULL) or returns after the specified
time-out. The ReplyBuffer contains the ICMP responses, if any.

[戻り値]
When called synchronously, the IcmpSendEcho2Ex function returns the
number of replies received and stored in ReplyBuffer. If the return
value is zero, call GetLastError for extended error information. When
called asynchronously, the IcmpSendEcho2Ex function returns
ERROR_IO_PENDING to indicate the operation is in progress. The
results can be retrieved later when the event specified in the Event
parameter signals or the callback function in the ApcRoutine
parameter is called. If the return value is zero, call GetLastError
for extended error information. If the function fails, the extended
error code returned by GetLastError can be one of the following
values.
This doc was truncated.

[備考]
The IcmpSendEcho2Ex function is available on Windows Server 2008 and
later. The IcmpSendEcho2Ex function is an enhanced version of the
IcmpSendEcho2 function that allows the user to specify the IPv4
source address on which to issue the ICMP request. The
IcmpSendEcho2Ex function is useful in cases where a computer has
multiple network interfaces. The IcmpSendEcho2Ex function is called
synchronously if the ApcRoutine or Event parameters are NULL. When
called synchronously, the return value contains the number of replies
received and stored in ReplyBuffer after waiting for the time
specified in the Timeout parameter. If the return value is zero, call
GetLastError for extended error information. The IcmpSendEcho2Ex
function is called asynchronously when either the ApcRoutine or Event
parameters are specified. When called asynchronously, the ReplyBuffer
and ReplySize parameters are required to accept the response. ICMP
response data is copied to the ReplyBuffer provided and the
application is signaled (when the Event parameter is specified) or
the callback function is called (when the ApcRoutine parameter is
specified). The application must parse the data pointed to by
ReplyBuffer parameter using the IcmpParseReplies function. If the
Event parameter is specified, the IcmpSendEcho2Ex function is called
asynchronously. The event specified in the Event parameter is
signaled whenever an ICMP response arrives. Use the CreateEvent
function to create this event object. If the ApcRoutine parameter is
specified, the IcmpSendEcho2Ex function is called asynchronously. The
ApcRoutine parameter should point to a user-defined callback
function. The callback function specified in the ApcRoutine parameter
is called whenever an ICMP response arrives. The invocation of the
callback function specified in the ApcRoutine parameter is
serialized. If both the Event and ApcRoutine parameters are
specified, the event specified in the Event parameter is signaled
whenever an ICMP response arrives, but the callback function
specified in the ApcRoutine parameter is ignored . Any application
that calls the IcmpSendEcho2Ex function asynchronously using the
ApcRoutine parameter must define PIO_APC_ROUTINE_DEFINED to force the
datatype for the ApcRoutine parameter to PIO_APC_ROUTINE rather than
FARPROC. Note PIO_APC_ROUTINE_DEFINED must be defined before the
Icmpapi.h header file is included.
The callback function pointed to by the ApcRoutine must be defined as
a function of type VOID with the following syntax:
This doc was truncated.


%index
InitializeIpForwardEntry
Initializes a MIB_IPFORWARD_ROW2 structure with default values for an IP route entry on the local computer.
%group
Win32 iphlpapi
%prm
Row
Row : [var] On entry, a pointer to a MIB_IPFORWARD_ROW2 structure entry for an IP route entry. On return, the  MIB_IPFORWARD_ROW2 structure pointed to by this parameter is initialized with default values for an IP route entry.
%inst
Initializes a MIB_IPFORWARD_ROW2 structure with default values for an
IP route entry on the local computer.

[戻り値]
This function does not return a value.

[備考]
The InitializeIpForwardEntry function is defined on Windows Vista and
later. The InitializeIpForwardEntry function must be used to
initialize the members of a MIB_IPFORWARD_ROW2 structure entry with
default values for an IP route entry for later use with the
CreateIpForwardEntry2 function. On input, InitializeIpForwardEntry
must be passed a new MIB_IPFORWARD_ROW2 structure to initialize. On
output, the ValidLifetime and PreferredLifetime members of the
MIB_IPFORWARD_ROW2 structure pointed to by Row parameter will be
initialized to infinite and the Loopback, AutoconfigureAddress,
Publish, and Immortal members will be initialized to TRUE. In
addition, the SitePrefixLength, Metric, and Protocol members are set
to an illegal value and other fields are initialized to zero. After
calling InitializeIpForwardEntry, an application can then change the
members in the MIB_IPFORWARD_ROW2 entry it wishes to modify, and then
call the CreateIpForwardEntry2 to add the new IP route entry to the
local computer.


%index
InitializeIpInterfaceEntry
Initializes the members of an MIB_IPINTERFACE_ROW entry with default values.
%group
Win32 iphlpapi
%prm
Row
Row : [var] A pointer to a MIB_IPINTERFACE_ROW structure to initialize. On successful return, the fields in this parameter are initialized with default information for an interface on the local computer.
%inst
Initializes the members of an MIB_IPINTERFACE_ROW entry with default
values.

[戻り値]
This function does not return a value.

[備考]
The InitializeIpInterfaceEntry function is defined on Windows Vista
and later. On output, the Family member in the MIB_IPINTERFACE_ROW
structure pointed to by the Row parameter will be initialized to
either AF_UNSPEC, the InterfaceLuid member in the MIB_IPINTERFACE_ROW
structure will be initialized to an unspecified value, and other
fields are initialized to zero. The InitializeIpInterfaceEntry
function must be used to initialize the fields of a
MIB_IPINTERFACE_ROW structure entry with default values. An
application can then change the fields in the MIB_IPINTERFACE_ROW
entry it wishes to modify, and then call the SetIpInterfaceEntry
function.


%index
InitializeUnicastIpAddressEntry
Initializes a MIB_UNICASTIPADDRESS_ROW structure with default values for a unicast IP address entry on the local computer.
%group
Win32 iphlpapi
%prm
Row
Row : [var] On entry, a pointer to a MIB_UNICASTIPADDRESS_ROW structure entry for a unicast IP address entry. On return, the  MIB_UNICASTIPADDRESS_ROW structure pointed to by this parameter is initialized with default values for a unicast IP address.
%inst
Initializes a MIB_UNICASTIPADDRESS_ROW structure with default values
for a unicast IP address entry on the local computer.

[戻り値]
This function does not return a value.

[備考]
The InitializeUnicastIpAddressEntry function is defined on Windows
Vista and later. The InitializeUnicastIpAddressEntry function must be
used to initialize the members of a MIB_UNICASTIPADDRESS_ROW
structure entry with default values for a unicast IP address for
later use with the CreateUnicastIpAddressEntry function. On input,
InitializeUnicastIpAddressEntry must be passed a new
MIB_UNICASTIPADDRESS_ROW structure to initialize. On output, the
PrefixOrigin member of the MIB_UNICASTIPADDRESS_ROW structure pointed
to by Row parameter the will be initialized to
IpPrefixOriginUnchanged, the SuffixOrigin member will be initialized
to IpSuffixOriginUnchanged, and the OnLinkPrefixLength member will be
initialized to an illegal value. In addition, the PreferredLifetime
and ValidLifetime members are set to infinite, the SkipAsSource
member is set to FALSE, and other fields are initialized to zero.
After calling InitializeUnicastIpAddressEntry, an application can
then change the members in the MIB_UNICASTIPADDRESS_ROW entry it
wishes to modify, and then call the CreateUnicastIpAddressEntry to
add the new unicast IP address to the local computer.


%index
IpReleaseAddress
The IpReleaseAddress function releases an IPv4 address previously obtained through the Dynamic Host Configuration Protocol (DHCP).
%group
Win32 iphlpapi
%prm
AdapterInfo
AdapterInfo : [var] A pointer to an IP_ADAPTER_INDEX_MAP structure that specifies the adapter associated with the IPv4 address to release.
%inst
The IpReleaseAddress function releases an IPv4 address previously
obtained through the Dynamic Host Configuration Protocol (DHCP).

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, use FormatMessage to obtain the message string for
the returned error.
This doc was truncated.

[備考]
The IpReleaseAddress function is specific to IPv4 and releases only
an IPv4 address previously obtained through the Dynamic Host
Configuration Protocol (DHCP). The Name member of the
IP_ADAPTER_INDEX_MAP structure pointed to by the AdapterInfo
parameter is the only member used to determine the DHCP address to
release. An array of IP_ADAPTER_INDEX_MAP structures is returned in
the IP_INTERFACE_INFO structure by the GetInterfaceInfo function. The
IP_INTERFACE_INFO structure returned by GetInterfaceInfo contains at
least one IP_ADAPTER_INDEX_MAP structure even if the NumAdapters
member of the IP_INTERFACE_INFO structure indicates that no network
adapters with IPv4 are enabled. When the NumAdapters member of the
IP_INTERFACE_INFO structure returned by GetInterfaceInfo is zero, the
value of the members of the single IP_ADAPTER_INDEX_MAP structure
returned in the IP_INTERFACE_INFO structure is undefined. If the Name
member of the IP_ADAPTER_INDEX_MAP structure pointed to by the
AdapterInfo parameter is NULL, the IpReleaseAddress function returns
ERROR_INVALID_PARAMETER. There are no functions available for
releasing or renewing an IPv6 address. This can only be done by
executing the Ipconfig command:
ipconfig /release6 ipconfig /renew6


%index
IpRenewAddress
The IpRenewAddressfunction renews a lease on an IPv4 address previously obtained through Dynamic Host Configuration Protocol (DHCP).
%group
Win32 iphlpapi
%prm
AdapterInfo
AdapterInfo : [var] A pointer to an IP_ADAPTER_INDEX_MAP structure that specifies the adapter associated with the IP address to renew.
%inst
The IpRenewAddressfunction renews a lease on an IPv4 address
previously obtained through Dynamic Host Configuration Protocol
(DHCP).

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, use FormatMessage to obtain the message string for
the returned error.
This doc was truncated.

[備考]
The IpRenewAddress function is specific to IPv4 and renews only an
IPv4 address previously obtained through the Dynamic Host
Configuration Protocol (DHCP). The Name member of the
IP_ADAPTER_INDEX_MAP structure pointed to by the AdapterInfo
parameter is the only member used to determine the DHCP address to
renew. An array of IP_ADAPTER_INDEX_MAP structures are returned in
the IP_INTERFACE_INFO structure by the GetInterfaceInfo function. The
IP_INTERFACE_INFO structure returned by GetInterfaceInfo contains at
least one IP_ADAPTER_INDEX_MAP structure even if the NumAdapters
member of the IP_INTERFACE_INFO structure indicates that no network
adapters with IPv4 are enabled. When the NumAdapters member of the
IP_INTERFACE_INFO structure returned by GetInterfaceInfo is zero, the
value of the members of the single IP_ADAPTER_INDEX_MAP structure
returned in the IP_INTERFACE_INFO structure is undefined. If the Name
member of the IP_ADAPTER_INDEX_MAP structure pointed to by the
AdapterInfo parameter is NULL, the IpRenewAddress function returns
ERROR_INVALID_PARAMETER. There are no functions available for
releasing or renewing an IPv6 address. This can only be done by
executing the Ipconfig command:
ipconfig /release6 ipconfig /renew6


%index
LookupPersistentTcpPortReservation
Looks up the token for a persistent TCP port reservation for a consecutive block of TCP ports on the local computer.
%group
Win32 iphlpapi
%prm
StartPort, NumberOfPorts, Token
StartPort : [int] The starting TCP port number in network byte order.
NumberOfPorts : [int] The number of TCP port numbers  that were reserved.
Token : [var] A pointer to a port reservation token that is returned if the function succeeds.
%inst
Looks up the token for a persistent TCP port reservation for a
consecutive block of TCP ports on the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The LookupPersistentTcpPortReservation function is defined on Windows
Vista and later. The LookupPersistentTcpPortReservation function is
used to lookup the token for a persistent reservation for a block of
TCP ports. A persistent reservation for a block of TCP ports is
created by a call to the CreatePersistentTcpPortReservation function.
The StartPort or NumberOfPorts parameters passed to the
LookupPersistentTcpPortReservation function must match the values
used when the persistent reservation for a block of TCP ports was
created by the CreatePersistentTcpPortReservation function. If the
LookupPersistentTcpPortReservation function succeeds, the Token
parameter returned will point to the token for the persistent port
reservation for the block of TCP ports. Note that the token for a
given persistent reservation for a block of TCP ports may change each
time the system is restarted.
An application can request port assignments from the TCP port
reservation by opening a TCP socket, then calling the WSAIoctl
function specifying the SIO_ASSOCIATE_PORT_RESERVATION IOCTL and
passing the reservation token before issuing a call to the bind
function on the socket.


%index
LookupPersistentUdpPortReservation
Looks up the token for a persistent UDP port reservation for a consecutive block of TCP ports on the local computer.
%group
Win32 iphlpapi
%prm
StartPort, NumberOfPorts, Token
StartPort : [int] The starting UDP port number in network byte order.
NumberOfPorts : [int] The number of UDP port numbers that were reserved.
Token : [var] A pointer to a port reservation token that is returned if the function succeeds.
%inst
Looks up the token for a persistent UDP port reservation for a
consecutive block of TCP ports on the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The LookupPersistentUdpPortReservation function is defined on Windows
Vista and later. The LookupPersistentUdpPortReservation function is
used to lookup the token for a persistent reservation for a block of
UDP ports. A persistent reservation for a block of UDP ports is
created by a call to the CreatePersistentUdpPortReservation function.
The StartPort or NumberOfPorts parameters passed to the
LookupPersistentUdpPortReservation function must match the values
used when the persistent reservation for a block of TCP ports was
created by the CreatePersistentUdpPortReservation function. If the
LookupPersistentUdpPortReservation function succeeds, the Token
parameter returned will point to the token for the persistent port
reservation for the block of UDP ports. Note that the token for a
given persistent reservation for a block of TCP ports may change each
time the system is restarted.
An application can request port assignments from the UDP port
reservation by opening a UDP socket, then calling the WSAIoctl
function specifying the SIO_ASSOCIATE_PORT_RESERVATION IOCTL and
passing the reservation token before issuing a call to the bind
function on the socket.


%index
NhpAllocateAndGetInterfaceInfoFromStack
The NhpAllocateAndGetInterfaceInfoFromStack function obtains adapter information about the local computer.
%group
Win32 iphlpapi
%prm
ppTable, pdwCount, bOrder, hHeap, dwFlags
ppTable : [var] An array of IP_INTERFACE_NAME_INFO structures that contains information about each adapter on the local system. The array contains one element for each adapter on the system.
pdwCount : [var] The number of elements in the ppTable array.
bOrder : [int] When TRUE, elements in the ppTable array are sorted by increasing index value.
hHeap : [intptr] A handle that specifies the heap from which ppTable should be allocated. This parameter can be the process heap returned by a call to the GetProcessHeap function, or a private heap created by a call to the HeapCreate function.
dwFlags : [int] A set of flags to be passed to the HeapAlloc function when allocating memory for ppTable. See the HeapAlloc function for more information.
%inst
The NhpAllocateAndGetInterfaceInfoFromStack function obtains adapter
information about the local computer.

[戻り値]
Returns ERROR_SUCCESS upon successful completion.

[備考]
In the Microsoft Windows Software Development Kit (SDK), the
NhpAllocateAndGetInterfaceInfoFromStack function is defined on
Windows 2000 with Service Pack 1 (SP1) and later. When compiling an
application, if the target platform is Windows 2000 with SP1 and
later (NTDDI_VERSION >= NTDDI_WIN2KSP1, _WIN32_WINNT >= 0x0500, or
WINVER >= 0x0500), the NhpAllocateAndGetInterfaceInfoFromStack is
defined.


%index
NotifyAddrChange
The NotifyAddrChange function causes a notification to be sent to the caller whenever a change occurs in the table that maps IPv4 addresses to interfaces.
%group
Win32 iphlpapi
%prm
Handle, overlapped
Handle : [intptr] A pointer to a HANDLE variable that receives a file handle for use in a subsequent call to the GetOverlappedResult function. Warning??Do not close this handle, and do not associate it with a completion port.
overlapped : [var] A pointer to an OVERLAPPED structure that  notifies the caller of any changes in the table that maps IP addresses to interfaces.
%inst
The NotifyAddrChange function causes a notification to be sent to the
caller whenever a change occurs in the table that maps IPv4 addresses
to interfaces.

[戻り値]
If the function succeeds, the return value is NO_ERROR if the caller
specifies NULL for the Handle and overlapped parameters. If the
caller specifies non-NULL parameters, the return value for success is
ERROR_IO_PENDING. If the function fails, use FormatMessage to obtain
the message string for the returned error.
This doc was truncated.

[備考]
The
This doc was truncated.


%index
NotifyIfTimestampConfigChange
This function is reserved for system use, and you should not call it from your code. (NotifyIfTimestampConfigChange)
%group
Win32 iphlpapi
%prm
CallerContext, Callback, NotificationHandle
CallerContext : [intptr] Reserved.
Callback : [int] Reserved.
NotificationHandle : [intptr] Reserved.
%inst
This function is reserved for system use, and you should not call it
from your code. (NotifyIfTimestampConfigChange)

[戻り値]
Reserved.


%index
NotifyIpInterfaceChange
Registers to be notified for changes to all IP interfaces, IPv4 interfaces, or IPv6 interfaces on a local computer.
%group
Win32 iphlpapi
%prm
Family, Callback, CallerContext, InitialNotification, NotificationHandle
Family : [int] The address family on which to register for change notifications. Possible values for the address family are listed in the Winsock2.h header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, AF_INET and PF_INET), so either constant can be used. On the Windows SDK released for Windows?Vista and later, the organization of header files has changed and possible values for this member are defined in the Ws2def.h header file. Note that the Ws2def.h header file is automatically included in Winsock2.h, and should never be used directly. The values currently supported are AF_INET, AF_INET6, and AF_UNSPEC.
Callback : [int] A pointer to the function to call when a change occurs. This function will be invoked when an interface notification is received.
CallerContext : [intptr] A user context passed to the callback function specified in the Callback parameter when an interface notification is received.
InitialNotification : [int] A value that indicates whether the callback should be invoked immediately after registration for change notification completes. This initial notification does not indicate a change occurred to an IP interface. The purpose of this parameter to provide confirmation that the callback is registered.
NotificationHandle : [intptr] A pointer used to return a handle that can be later used to deregister the change notification. On success, a notification handle is returned in this parameter. If an error occurs, NULL is returned.
%inst
Registers to be notified for changes to all IP interfaces, IPv4
interfaces, or IPv6 interfaces on a local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The NotifyIpInterfaceChange function is defined on Windows Vista and
later. The Family parameter must be set to either AF_INET, AF_INET6,
or AF_UNSPEC. The invocation of the callback function specified in
the Callback parameter is serialized. The callback function should be
defined as a function of type VOID. The parameters passed to the
callback function include the following:
This doc was truncated.


%index
NotifyNetworkConnectivityHintChange
Registers an application-defined callback function, to be called when the aggregate network connectivity level and cost hints change.
%group
Win32 iphlpapi
%prm
Callback, CallerContext, InitialNotification, NotificationHandle
Callback : [int] A function pointer of type [PNETWORK_CONNECTIVITY_HINT_CHANGE_CALLBACK](./nc-netioapi-pnetwork_connectivity_hint_change_callback.md), which points to your application-defined callback function. The callback function will be invoked when a network connectivity level or cost change occurs.
CallerContext : [intptr] The user-specific caller context. This context will be supplied to the callback function.
InitialNotification : [int] `True` if an initialization notification should be provided, otherwise `false`.
NotificationHandle : [intptr] A pointer to a **HANDLE**. The function sets the value to a handle to the notification registration.
%inst
Registers an application-defined callback function, to be called when
the aggregate network connectivity level and cost hints change.

[戻り値]
If the function succeeds, the return value is **NO_ERROR**.
Otherwise, an error code is returned.

[備考]
To deregister for change notifications, call the
**CancelMibChangeNotify2** function, passing the *NotificationHandle*
parameter returned by **NotifyNetworkConnectivityHintChange**.


%index
NotifyRouteChange
The NotifyRouteChange function causes a notification to be sent to the caller whenever a change occurs in the IPv4 routing table.
%group
Win32 iphlpapi
%prm
Handle, overlapped
Handle : [intptr] A pointer to a HANDLE variable that receives a handle to use in asynchronous notification.
overlapped : [var] A pointer to an OVERLAPPED structure that  notifies the caller of any changes in the routing table.
%inst
The NotifyRouteChange function causes a notification to be sent to
the caller whenever a change occurs in the IPv4 routing table.

[戻り値]
If the function succeeds, the return value is NO_ERROR if the caller
specifies NULL for the Handle and overlapped parameters. If the
caller specifies non-NULL parameters, the return value for success is
ERROR_IO_PENDING. If the function fails, use FormatMessage to obtain
the message string for the returned error.
This doc was truncated.

[備考]
The
This doc was truncated.


%index
NotifyRouteChange2
Registers to be notified for changes to IP route entries on a local computer.
%group
Win32 iphlpapi
%prm
AddressFamily, Callback, CallerContext, InitialNotification, NotificationHandle
AddressFamily : [int] The address family on which to register for change notifications. Possible values for the address family are listed in the Winsock2.h header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, AF_INET and PF_INET), so either constant can be used. On the Windows SDK released for Windows?Vista and later, the organization of header files has changed and possible values for this member are defined in the Ws2def.h header file. Note that the Ws2def.h header file is automatically included in Winsock2.h, and should never be used directly. The values currently supported are AF_INET, AF_INET6, and AF_UNSPEC.
Callback : [int] A pointer to the function to call when a change occurs. This function will be invoked when an IP route notification is received.
CallerContext : [intptr] A user context passed to the callback function specified in the Callback parameter when an IP route notification is received.
InitialNotification : [int] A value that indicates whether the callback should be invoked immediately after registration for change notification completes. This initial notification does not indicate a change occurred to an IP route entry. The purpose of this parameter to provide confirmation that the callback is registered.
NotificationHandle : [intptr] A pointer used to return a handle that can be later used to deregister the change notification. On success, a notification handle is returned in this parameter. If an error occurs, NULL is returned.
%inst
Registers to be notified for changes to IP route entries on a local
computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The NotifyRouteChange2 function is defined on Windows Vista and
later. The Family parameter must be set to either AF_INET, AF_INET6,
or AF_UNSPEC. The invocation of the callback function specified in
the Callback parameter is serialized. The callback function should be
defined as a function of type VOID. The parameters passed to the
callback function include the following:
This doc was truncated.


%index
NotifyStableUnicastIpAddressTable
Retrieves the stable unicast IP address table on a local computer.
%group
Win32 iphlpapi
%prm
Family, Table, CallerCallback, CallerContext, NotificationHandle
Family : [int] The address family to retrieve. Possible values for the address family are listed in the Winsock2.h header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, AF_INET and PF_INET), so either constant can be used. On the Windows SDK released for Windows?Vista and later, the organization of header files has changed and possible values for this member are defined in the Ws2def.h header file. Note that the Ws2def.h header file is automatically included in Winsock2.h, and should never be used directly. The values currently supported are AF_INET, AF_INET6, and AF_UNSPEC.
Table : [var] A pointer to a MIB_UNICASTIPADDRESS_TABLE structure. When NotifyStableUnicastIpAddressTable is successful, this parameter returns the stable unicast IP address table on the local computer. When NotifyStableUnicastIpAddressTable returns ERROR_IO_PENDING indicating that the I/O request is pending, then the  stable unicast IP address table is returned to the function in the CallerCallback  parameter.
CallerCallback : [int] A pointer to the function to call with the stable unicast IP address table. This function will be invoked if NotifyStableUnicastIpAddressTable returns ERROR_IO_PENDING, indicating that the I/O request is pending.
CallerContext : [intptr] A user context passed to the callback function specified in the CallerCallback parameter when the stable unicast IP address table si available.
NotificationHandle : [intptr] A pointer used to return a handle that can be used to cancel the request to retrieve the stable unicast IP address table. This parameter is returned if  the return value from NotifyStableUnicastIpAddressTable is ERROR_IO_PENDING indicating that the I/O request is pending.
%inst
Retrieves the stable unicast IP address table on a local computer.

[戻り値]
If the function succeeds immediately, the return value is NO_ERROR
and the stable unicast IP table is returned in the Table parameter.
If the I/O request is pending, the function returns ERROR_IO_PENDING
and the function pointed to by the CallerCallback parameter is called
when the I/O request has completed with the stable unicast IP address
table. If the function fails, the return value is one of the
following error codes.
This doc was truncated.

[備考]
The NotifyStableUnicastIpAddressTable function is defined on Windows
Vista and later. If the NotifyStableUnicastIpAddressTable function
succeeds immediately, the return value is NO_ERROR and the stable
unicast IP table is returned in the Table parameter. The calling
application should free the memory pointed to by the Table parameter
using the FreeMibTable function when the MIB_UNICASTIPADDRESS_TABLE
information is no longer needed. All unicast IP addresses except
dial-on-demand addresses are considered stable only if they are in
the preferred state. For a normal unicast IP address entry, this
would correspond to a DadState member of the MIB_UNICASTIPADDRESS_ROW
for the IP address set to IpDadStatePreferred. Every dial-on-demand
address defines its own stability metric. Currently the only
dial-on-demand address considered by this function is the unicast IP
address used by the Teredo client on the local computer. The Family
parameter must be set to either AF_INET, AF_INET6, or AF_UNSPEC. When
NotifyStableUnicastIpAddressTable is successful and returns NO_ERROR,
the Table parameter returns the stable unicast IP address table on
the local computer. When NotifyStableUnicastIpAddressTable returns
ERROR_IO_PENDING indicating that the I/O request is pending, then the
stable unicast IP address table is returned to the function in the
CallerCallback parameter. The NotifyStableUnicastIpAddressTable
function is used primarily by applications that use the Teredo
client. If the unicast IP address used by Teredo is available on the
local computer but not in the stable (qualified) state,
NotifyStableUnicastIpAddressTable returns ERROR_IO_PENDING and the
stable unicast IP address table is eventually returned by calling the
function in the CallerCallback parameter. If the Teredo address is
not available or is in the stable state and the other unicast IP
addresses are in a stable state, then the function in the
CallerCallback parameter will never be invoked. The callback function
specified in the CallerCallback parameter should be defined as a
function of type VOID. The parameters passed to the callback function
include the following:
This doc was truncated.


%index
NotifyTeredoPortChange
Registers to be notified for changes to the UDP port number used by the Teredo client for the Teredo service port on a local computer.
%group
Win32 iphlpapi
%prm
Callback, CallerContext, InitialNotification, NotificationHandle
Callback : [int] A pointer to the function to call when a Teredo client port change occurs. This function will be invoked when a Teredo port change notification is received.
CallerContext : [intptr] A user context passed to the callback function specified in the Callback parameter when a Teredo port change  notification is received.
InitialNotification : [int] A value that indicates whether the callback should be invoked immediately after registration for change notification completes. This initial notification does not indicate a change occurred to the Teredo client port. The purpose of this parameter to provide confirmation that the callback is registered.
NotificationHandle : [intptr] A pointer used to return a handle that can be later used to deregister the change notification. On success, a notification handle is returned in this parameter. If an error occurs, NULL is returned.
%inst
Registers to be notified for changes to the UDP port number used by
the Teredo client for the Teredo service port on a local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The NotifyTeredoPortChange function is defined on Windows Vista and
later. The GetTeredoPort function can be used to retrieve the initial
UDP port number used by the Teredo client for the Teredo service
port. The Teredo port is dynamic and can change any time the Teredo
client is restarted on the local computer. An application can
register to be notified when the Teredo service port changes by
calling the NotifyTeredoPortChange function. The invocation of the
callback function specified in the Callback parameter is serialized.
The callback function should be defined as a function of type VOID.
The parameters passed to the callback function include the following:
This doc was truncated.


%index
NotifyUnicastIpAddressChange
Registers to be notified for changes to all unicast IP interfaces, unicast IPv4 addresses, or unicast IPv6 addresses on a local computer.
%group
Win32 iphlpapi
%prm
Family, Callback, CallerContext, InitialNotification, NotificationHandle
Family : [int] The address family on which to register for change notifications. Possible values for the address family are listed in the Winsock2.h header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, AF_INET and PF_INET), so either constant can be used. On the Windows SDK released for Windows?Vista and later, the organization of header files has changed and possible values for this member are defined in the Ws2def.h header file. Note that the Ws2def.h header file is automatically included in Winsock2.h, and should never be used directly. The values currently supported are AF_INET, AF_INET6, and AF_UNSPEC.
Callback : [int] A pointer to the function to call when a change occurs. This function will be invoked when a unicast IP address notification is received.
CallerContext : [intptr] A user context passed to the callback function specified in the Callback parameter when an interface notification is received.
InitialNotification : [int] A value that indicates whether the callback should be invoked immediately after registration for change notification completes. This initial notification does not indicate a change occurred to a unicast IP address. The purpose of this parameter to provide confirmation that the callback is registered.
NotificationHandle : [intptr] A pointer used to return a handle that can be later used to deregister the change notification. On success, a notification handle is returned in this parameter. If an error occurs, NULL is returned.
%inst
Registers to be notified for changes to all unicast IP interfaces,
unicast IPv4 addresses, or unicast IPv6 addresses on a local
computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The NotifyUnicastIpAddressChange function is defined on Windows Vista
and later. The Family parameter must be set to either AF_INET,
AF_INET6, or AF_UNSPEC. The invocation of the callback function
specified in the Callback parameter is serialized. The callback
function should be defined as a function of type VOID. The parameters
passed to the callback function include the following:
This doc was truncated.


%index
ParseNetworkString
Parses the input network string and checks whether it is a legal representation of the specified IP network string type. If the string matches a type and its specification, the function can optionally return the parsed result.
%group
Win32 iphlpapi
%prm
NetworkString, Types, AddressInfo, PortNumber, PrefixLength
NetworkString : [wstr] A pointer to the NULL-terminated network string to parse.
Types : [int] The type of IP network string to parse. This parameter consists of one of network string types as defined in the Iphlpapi.h header file.
AddressInfo : [var] On success, the function returns a pointer to a NET_ADDRESS_INFO structure that contains the parsed IP address information if a NULL pointer was not passed in this parameter.
PortNumber : [var] On success, the function returns a pointer to the parsed network port in host order if a NULL pointer was not passed in this parameter. If a network port was not present in the NetworkString parameter, then a pointer to a value of zero is returned.
PrefixLength : [var] On success, the function returns a pointer to the parsed prefix length if a NULL pointer was not passed in this parameter. If a prefix was not present in the NetworkString parameter, then a pointer to a value of -1 is returned.
%inst
Parses the input network string and checks whether it is a legal
representation of the specified IP network string type. If the string
matches a type and its specification, the function can optionally
return the parsed result.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The ParseNetworkString function parses the input network string
passed in the NetworkString parameter and checks whether it is a
legal representation of one of the string types as specified in the
Types argument. If the string matches a type and its specification,
the function succeeds and can optionally return the parsed result to
the caller in the optional AddressInfo, PortNumber, and PrefixLength
parameters when these parameters are not NULL pointers. The
ParseNetworkString function can parse representations of IPv4 or IPv6
addresses, services, and networks, as well as named Internet
addresses and services using DNS names.
The
[NET_ADDRESS_INFO](/windows/desktop/api/iphlpapi/ns-iphlpapi-net_address_info)
structure pointed to by the AddressInfo parameter. The SOCKADDR_IN
and SOCKADDR structures are defined in the Ws2def.h header file which
is automatically included by the Winsock2.h header file. The
SOCKADDR_IN6 structure is defined in the Ws2ipdef.h header file which
is automatically included by the Ws2tcpip.h header file. In order to
use the ParseNetworkString function and the NET_ADDRESS_INFO
structure, the Winsock2.h and Ws2tcpip.h header files must be
included before the Iphlpapi.h header file.


%index
PfAddFiltersToInterface
(no summary)
%group
Win32 iphlpapi
%prm
ih, cInFilters, pfiltIn, cOutFilters, pfiltOut, pfHandle
ih : [intptr] 
cInFilters : [int] 
pfiltIn : [var] 
cOutFilters : [int] 
pfiltOut : [var] 
pfHandle : [var] 
%inst



%index
PfAddGlobalFilterToInterface
(no summary)
%group
Win32 iphlpapi
%prm
pInterface, gfFilter
pInterface : [intptr] 
gfFilter : [int] 
%inst



%index
PfBindInterfaceToIPAddress
(no summary)
%group
Win32 iphlpapi
%prm
pInterface, pfatType, IPAddress
pInterface : [intptr] 
pfatType : [int] 
IPAddress : [var] 
%inst



%index
PfBindInterfaceToIndex
(no summary)
%group
Win32 iphlpapi
%prm
pInterface, dwIndex, pfatLinkType, LinkIPAddress
pInterface : [intptr] 
dwIndex : [int] 
pfatLinkType : [int] 
LinkIPAddress : [var] 
%inst



%index
PfCreateInterface
(no summary)
%group
Win32 iphlpapi
%prm
dwName, inAction, outAction, bUseLog, bMustBeUnique, ppInterface
dwName : [int] 
inAction : [int] 
outAction : [int] 
bUseLog : [int] 
bMustBeUnique : [int] 
ppInterface : [var] 
%inst



%index
PfDeleteInterface
(no summary)
%group
Win32 iphlpapi
%prm
pInterface
pInterface : [intptr] 
%inst



%index
PfDeleteLog
(no summary)
%group
Win32 iphlpapi
%prm

%inst



%index
PfGetInterfaceStatistics
(no summary)
%group
Win32 iphlpapi
%prm
pInterface, ppfStats, pdwBufferSize, fResetCounters
pInterface : [intptr] 
ppfStats : [var] 
pdwBufferSize : [var] 
fResetCounters : [int] 
%inst



%index
PfMakeLog
(no summary)
%group
Win32 iphlpapi
%prm
hEvent
hEvent : [intptr] 
%inst



%index
PfRebindFilters
(no summary)
%group
Win32 iphlpapi
%prm
pInterface, pLateBindInfo
pInterface : [intptr] 
pLateBindInfo : [var] 
%inst



%index
PfRemoveFilterHandles
(no summary)
%group
Win32 iphlpapi
%prm
pInterface, cFilters, pvHandles
pInterface : [intptr] 
cFilters : [int] 
pvHandles : [var] 
%inst



%index
PfRemoveFiltersFromInterface
(no summary)
%group
Win32 iphlpapi
%prm
ih, cInFilters, pfiltIn, cOutFilters, pfiltOut
ih : [intptr] 
cInFilters : [int] 
pfiltIn : [var] 
cOutFilters : [int] 
pfiltOut : [var] 
%inst



%index
PfRemoveGlobalFilterFromInterface
(no summary)
%group
Win32 iphlpapi
%prm
pInterface, gfFilter
pInterface : [intptr] 
gfFilter : [int] 
%inst



%index
PfSetLogBuffer
(no summary)
%group
Win32 iphlpapi
%prm
pbBuffer, dwSize, dwThreshold, dwEntries, pdwLoggedEntries, pdwLostEntries, pdwSizeUsed
pbBuffer : [var] 
dwSize : [int] 
dwThreshold : [int] 
dwEntries : [int] 
pdwLoggedEntries : [var] 
pdwLostEntries : [var] 
pdwSizeUsed : [var] 
%inst



%index
PfTestPacket
(no summary)
%group
Win32 iphlpapi
%prm
pInInterface, pOutInterface, cBytes, pbPacket, ppAction
pInInterface : [intptr] 
pOutInterface : [intptr] 
cBytes : [int] 
pbPacket : [var] 
ppAction : [var] 
%inst



%index
PfUnBindInterface
(no summary)
%group
Win32 iphlpapi
%prm
pInterface
pInterface : [intptr] 
%inst



%index
ResolveIpNetEntry2
Resolves the physical address for a neighbor IP address entry on the local computer. (ResolveIpNetEntry2)
%group
Win32 iphlpapi
%prm
Row, SourceAddress
Row : [var] A pointer to a MIB_IPNET_ROW2 structure entry for a neighbor IP address entry. On successful return, this structure will be updated with the properties for neighbor IP address.
SourceAddress : [var] A pointer to a an optional source IP address used to select the interface to send the requests on for the neighbor IP address entry.
%inst
Resolves the physical address for a neighbor IP address entry on the
local computer. (ResolveIpNetEntry2)

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The ResolveIpNetEntry2 function is defined on Windows Vista and
later. The ResolveIpNetEntry2 function is used to resolve the
physical address for a neighbor IP address entry on a local computer.
This function flushes any existing neighbor entry that matches the IP
address on the interface and then resolves the physical address (MAC)
address by sending ARP requests for an IPv4 address or neighbor
solicitation requests for an IPv6 address. If the SourceAddress
parameter is specified, the ResolveIpNetEntry2 function will select
the interface with this source IP address to send the requests on. If
the SourceAddress parameter is not specified (NULL was passed in this
parameter), the ResolveIpNetEntry2 function will automatically select
the best interface to send the requests on.
The Address member in the MIB_IPNET_ROW2 structure pointed to by the
Row parameter must be initialized to a valid IPv4 or IPv6 address and
family. In addition, at least one of the following members in the
MIB_IPNET_ROW2 structure pointed to the Row parameter must be
initialized to the interface: the InterfaceLuid or InterfaceIndex.
The fields are used in the order listed above. So if the
InterfaceLuid is specified, then this member is used to determine the
interface on which to add the unicast IP address. If no value was set
for the InterfaceLuid member (the values of this member was set to
zero), then the InterfaceIndex member is next used to determine the
interface. If the IP address passed in the Address member of the
MIB_IPNET_ROW2 pointed to by the Row parameter is a duplicate of an
existing neighbor IP address on the interface, the ResolveIpNetEntry2
function will flush the existing entry before resolving the IP
address. On output when the call is successful, ResolveIpNetEntry2
retrieves the other properties for the neighbor IP address and fills
out the MIB_IPNET_ROW2 structure pointed to by the Row parameter. The
PhysicalAddress and PhysicalAddressLength members in the
MIB_IPNET_ROW2 structure pointed to by the Row parameter will be
initialized to a valid physical address.


%index
ResolveNeighbor
Resolves the physical address for a neighbor IP address entry on the local computer. (ResolveNeighbor)
%group
Win32 iphlpapi
%prm
NetworkAddress, PhysicalAddress, PhysicalAddressLength
NetworkAddress : [var] A pointer to a   SOCKADDR structure that contains the neighbor IP address entry and address family.
PhysicalAddress : [intptr] A pointer to a byte array buffer that will receive the physical address that corresponds to the IP address specified by the NetworkAddress parameter if the function is successful. The length of the byte array is passed in the PhysicalAddressLength parameter.
PhysicalAddressLength : [var] On input, this parameter specifies the maximum length, in bytes, of the buffer passed in the PhysicalAddress parameter to receive the physical address. If the function is successful, this parameter will receive the length of the physical address returned in the buffer pointed to by the PhysicalAddress parameter. If ERROR_BUFFER_OVERFLOW is returned, this parameter contains the number of bytes required to hold the physical address.
%inst
Resolves the physical address for a neighbor IP address entry on the
local computer. (ResolveNeighbor)

[戻り値]
The ResolveNeighbor function always fails and returns the following
error code.
This doc was truncated.


%index
RestoreMediaSense
The RestoreMediaSense function restores the media sensing capability of the TCP/IP stack on a local computer on which the DisableMediaSense function was previously called.
%group
Win32 iphlpapi
%prm
pOverlapped, lpdwEnableCount
pOverlapped : [var] A pointer to an OVERLAPPED structure. Except for the hEvent member, all members of this structure must be set to zero. The hEvent member should contain a handle to a valid event object. Use the CreateEvent function to create this event object.
lpdwEnableCount : [var] An optional pointer to a DWORD variable that receives the number of references remaining if the RestoreMediaSense function succeeds. The variable is also used by the EnableRouter and UnenableRouter functions.
%inst
The RestoreMediaSense function restores the media sensing capability
of the TCP/IP stack on a local computer on which the
DisableMediaSense function was previously called.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
If the pOverlapped parameter is NULL, the RestoreMediaSense function
is executed synchronously. If the pOverlapped parameter is not NULL,
the RestoreMediaSense function is executed asynchronously using the
OVERLAPPED structure pointed to by the pOverlapped parameter. The
DisableMediaSense function does not complete until the
RestoreMediaSense function is called later to restore the media
sensing capability. Until then, an I/O request packet (IRP) remains
queued up. Alternatively, when the process that called
DisableMediaSense exits, the IRP is canceled and a cancel routine is
called that would again restore the media sensing capability.
To call RestoreMediaSense synchronously, an application needs to pass
a NULL pointer in the pOverlapped parameter. When RestoreMediaSense
is called synchronously, the function returns when the I/O request
packet (IRP) to restore the media sense has completed. To call
RestoreMediaSense asynchronously, an application needs to allocate an
OVERLAPPED structure. Except for the hEvent member, all members of
this structure must be set to zero. The hEvent member requires a
handle to a valid event object. Use the CreateEvent function to
create this event. When called asynchronously, RestoreMediaSense can
return return ERROR_IO_PENDING. The IRP completes when the media
sensing capability has been restored. Use the CloseHandle function to
close the handle to the event object when it is no longer needed. The
system closes the handle automatically when the process terminates.
The event object is destroyed when its last handle has been closed.
If DisableMediaSense was not called prior to calling
RestoreMediaSense, then RestoreMediaSense returns
ERROR_INVALID_PARAMETER. On Windows Server 2003and Windows XP, the
TCP/IP stack implements a policy of deleting all IP addresses on an
interface in response to a media sense disconnect event from an
underlying network interface. If a network switch or hub that the
local computer is connected to is powered off, or a network cable is
disconnected, the network interface will deliver disconnection
events. IP configuration information associated with the network
interface is lost. As a result, the TCP/IP stack implements a policy
of hiding disconnected interfaces so these interfaces and their
associated IP addresses do not show up in configuration information
retrieved through IP helper. This policy prevents some applications
from easily detecting that a network interface is merely
disconnected, rather than removed from the system. This behavior does
not normally impact a local client computer if it is using DHCP
requests to a DHCP server for IP configuration information. But this
can have a serious impact on server computers, particularly computers
used as part of clusters. The DisableMediaSense function can be used
to temporarily disable the media sense capability for these cases. At
some later time, the RestoreMediaSense function would be called to
restore the media sensing capability. The following registry setting
is related to the DisableMediaSense and RestoreMediaSense functions:

System\CurrentControlSet\Services\Tcpip\Parameters\DisableDHCPMediaSense
There is an internal flag in Windows that is set if this registry key
exists when the machine first boots up. The same internal flag also
gets set and reset by calling DisableMediaSense and
RestoreMediaSense. However with registry setting, you need to reboot
the machine for the changes to take place.
The TCP/IP stack on Windows Vista and later was changed to not hide
disconnected interfaces when a disconnect event occurs. So on Windows
Vista and later, the DisableMediaSense and RestoreMediaSense
functions don't do anything and always returns NO_ERROR.


%index
SendARP
The SendARP function sends an Address Resolution Protocol (ARP) request to obtain the physical address that corresponds to the specified destination IPv4 address.
%group
Win32 iphlpapi
%prm
DestIP, SrcIP, pMacAddr, PhyAddrLen
DestIP : [int] The destination IPv4 address, in the form of an IPAddr structure. The ARP request attempts to obtain the physical address that corresponds to this IPv4 address.
SrcIP : [int] The source IPv4 address of the sender, in the form of an IPAddr structure. This parameter is optional and is used to select the interface to send the request on for the ARP entry. The caller may specify zero corresponding to the INADDR_ANY IPv4 address for this parameter.
pMacAddr : [intptr] A pointer to an array of ULONG variables. This array must have at least two ULONG elements to hold an  Ethernet or token ring physical address. The first six bytes of this array receive the physical address that corresponds to the IPv4 address specified by the DestIP parameter.
PhyAddrLen : [var] On input, a pointer to a ULONG value that specifies the maximum buffer size, in bytes, the application has set aside to receive the physical address or MAC address. The buffer size should be at least 6 bytes for an Ethernet or token ring physical address The buffer to receive the physical address is pointed to by the pMacAddr parameter. On successful output, this parameter points to a value that specifies the number of bytes written to the buffer pointed to by the pMacAddr.
%inst
The SendARP function sends an Address Resolution Protocol (ARP)
request to obtain the physical address that corresponds to the
specified destination IPv4 address.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The SendARP function is used to request the physical hardware address
(sometimes referred to as the MAC address) that corresponds to a
specified destination IPv4 address. If the information requested is
not in the ARP table on the local computer, then the SendARP function
will cause an ARP request to be sent to obtain the physical address.
If the function is successful, the physical address that corresponds
to the specified destination IPv4 address is returned in the array
pointed to by the pMacAddr parameter. The physical address of an IPv4
address is only available if the destination IPv4 address is on the
local subnet (the IPv4 address can be reached directly without going
through any routers). The SendARP function will fail if the
destination IPv4 address is not on the local subnet. If the SendARP
function is successful on Windows Vista and later, the ARP table on
the local computer is updated with the results. If the SendARP
function is successful on Windows Server 2003 and earlier, the ARP
table on the local computer is not affected. The SendARP function on
Windows Vista and later returns different error return values than
the SendARP function on Windows Server 2003 and earlier. On Windows
Vista and later, a NULL pointer passed as the pMacAddr or PhyAddrLen
parameter to the SendARP function causes an access violation and the
application is terminated. If an error occurs on Windows Vista and
later and ERROR_BAD_NET_NAME, ERROR_BUFFER_OVERFLOW, or
ERROR_NOT_FOUND is returned, the ULONG value pointed to by the
PhyAddrLen parameter is set to zero. If the ULONG value pointed to by
the PhyAddrLen parameter is less than 6 on Windows Vista and later,
SendARP function returns ERROR_BUFFER_OVERFLOW indicating the buffer
to receive the physical address is too small. If the SrcIp parameter
specifies an IPv4 address that is not an interface on the local
computer, the SendARP function on Windows Vista and later returns
ERROR_NOT_FOUND. On Windows Server 2003 and earlier, a NULL pointer
passed as the pMacAddr or PhyAddrLen parameter to the SendARP
function returns ERROR_INVALID_PARAMETER. If an error occurs on
Windows Server 2003 and earlier and ERROR_GEN_FAILURE or
ERROR_INVALID_USER_BUFFER is returned, the ULONG value pointed to by
the PhyAddrLen parameter is set to zero. If the ULONG value pointed
to by the PhyAddrLen parameter is less than 6 on Windows Server 2003
and earlier, the SendARP function does not return an error but only
returns part of the hardware address in the array pointed to by the
pMacAddr parameter. So if the value pointed to by the PhyAddrLen
parameter is 4, then only the first 4 bytes of the hardware address
are returned in the array pointed to by the pMacAddr parameter. If
the SrcIp parameter specifies an IPv4 address that is not an
interface on the local computer, the SendARP function on Windows
Server 2003 and earlier ignores the SrcIp parameter and uses an IPv4
address on the local computer for the source IPv4 address. The
GetIpNetTable function retrieves the ARP table on the local computer
that maps IPv4 addresses to physical addresses. The CreateIpNetEntry
function creates an ARP entry in the ARP table on the local computer.
The DeleteIpNetEntry function deletes an ARP entry from the ARP table
on the local computer. The SetIpNetEntry function modifies an
existing ARP entry in the ARP table on the local computer. The
FlushIpNetTable function deletes all ARP entries for the specified
interface from the ARP table on the local computer.
On Windows Vista and later, the ResolveIpNetEntry2 function can used
to replace the SendARP function. An ARP request is sent if the
Address member of the MIB_IPNET_ROW2 structure passed to the
ResolveIpNetEntry2 function is an IPv4 address. On Windows Vista, a
new group of functions can be used to access, modify, and delete the
ARP table entries when the Address member of the MIB_IPNET_ROW2
structure passed to these functions is an IPv4 address. The new
functions include the following: GetIpNetTable2, CreateIpNetEntry2,
DeleteIpNetEntry2, FlushIpNetTable2, and SetIpNetEntry2. For
information about the IPAddr data type, see Windows Data Types. To
convert an IP address between dotted decimal notation and IPAddr
format, use the inet_addr and inet_ntoa functions.


%index
SetCurrentThreadCompartmentId
Reserved for future use. Do not use this function. (SetCurrentThreadCompartmentId)
%group
Win32 iphlpapi
%prm
CompartmentId
CompartmentId : [int] Reserved.
%inst
Reserved for future use. Do not use this function.
(SetCurrentThreadCompartmentId)


%index
SetCurrentThreadCompartmentScope
(no summary)
%group
Win32 iphlpapi
%prm
CompartmentScope
CompartmentScope : [int] 
%inst



%index
SetDnsSettings
(no summary)
%group
Win32 iphlpapi
%prm
Settings
Settings : [var] 
%inst



%index
SetIfEntry
The SetIfEntry function sets the administrative status of an interface.
%group
Win32 iphlpapi
%prm
pIfRow
pIfRow : [var] A pointer to a
%inst
The SetIfEntry function sets the administrative status of an
interface.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The SetIfEntry function is used to set the administrative status of
an interface on a local computer. The dwIndex member in the MIB_IFROW
structure pointed to by the pIfRow parameter must be initialized to
the interface index.
The SetIfEntry function will fail if the dwIndex member of the
MIB_IFROW pointed to by the pIfRow parameter does not match an
existing interface on the local computer. On Windows Vista and later,
the SetIfEntry function can only be called by a user logged on as a
member of the Administrators group. If SetIfEntry is called by a user
that is not a member of the Administrators group, the function call
will fail and ERROR_ACCESS_DENIED is returned. The SetIfEntry
function can also fail because of user account control (UAC) on
Windows Vista and later. If an application that contains this
function is executed by a user logged on as a member of the
Administrators group other than the built-in Administrator, this call
will fail unless the application has been marked in the manifest file
with a requestedExecutionLevel set to requireAdministrator. If the
application lacks this manifest file, a user logged on as a member of
the Administrators group other than the built-in Administrator must
then be executing the application in an enhanced shell as the
built-in Administrator (RunAs administrator) for this function to
succeed.
Note On Windows NT 4.0 and Windows 2000 and later, this function
executes a privileged operation. For this function to execute
successfully, the caller must be logged on as a member of the
Administrators group or the NetworkConfigurationOperators group.


%index
SetInterfaceDnsSettings
Sets the per-interface DNS settings specified in the *Settings* parameter.
%group
Win32 iphlpapi
%prm
Interface, Settings
Interface : [int] Type: \_In\_ **[GUID](/windows/win32/api/guiddef/ns-guiddef-guid)** The **GUID** of the COM interface that the settings refer to.
Settings : [var] Type: \_In\_ const **[DNS_INTERFACE_SETTINGS](ns-netioapi-dns_interface_settings.md)\*** A pointer to a **DNS_INTERFACE_SETTINGS**-type structure that contains the DNS interface settings. If this parameter points to a **DNS_INTERFACE_SETTINGS** structure, then the **DNS_INTERFACE_SETTINGS::Version** member must be set to **DNS_INTERFACE_SETTINGS_VERSION1**. If this parameter points to a **DNS_INTERFACE_SETTINGS3** structure, then the version must to be set to **DNS_INTERFACE_SETTINGS_VERSION3**. You must set appropriately all the desired options in the **DNS_INTERFACE_SETTINGS::Flags** field, and populate only the fields for which an option was set. You must zero out all other fields that don't have a corresponding option.
%inst
Sets the per-interface DNS settings specified in the *Settings*
parameter.

[戻り値]
Returns **NO_ERROR** if successful. A non-zero return value indicates
failure.


%index
SetIpForwardEntry
The SetIpForwardEntry function modifies an existing route in the local computer's IPv4 routing table.
%group
Win32 iphlpapi
%prm
pRoute
pRoute : [var] A pointer to a MIB_IPFORWARDROW structure that specifies the new information for the existing route. The caller must specify MIB_IPPROTO_NETMGMT for the dwForwardProto member of this structure. The caller must also specify values for the dwForwardIfIndex, dwForwardDest, dwForwardMask, dwForwardNextHop, and dwForwardPolicy members of the structure.
%inst
The SetIpForwardEntry function modifies an existing route in the
local computer's IPv4 routing table.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The dwForwardProto member of MIB_IPFORWARDROW structure pointed to by
the route parameter must be set to MIB_IPPROTO_NETMGMT otherwise
SetIpForwardEntry will fail. Routing protocol identifiers are used to
identify route information for the specified routing protocol. For
example, MIB_IPPROTO_NETMGMT is used to identify route information
for IP routing set through network management such as the Dynamic
Host Configuration Protocol (DHCP), the Simple Network Management
Protocol (SNMP), or by calls to the CreateIpForwardEntry,
DeleteIpForwardEntry, or SetIpForwardEntry functions. On Windows
Vista and Windows Server 2008, the route metric specified in the
dwForwardMetric1 member of the MIB_IPFORWARDROW structure pointed to
by pRoute parameter represents a combination of the route metric
added to the interface metric specified in the Metric member of the
MIB_IPINTERFACE_ROW structure of the associated interface. So the
dwForwardMetric1 member of the MIB_IPFORWARDROW structure should be
equal to or greater than Metric member of the associated
MIB_IPINTERFACE_ROW structure. If an application would like to set
the route metric to 0, then the dwForwardMetric1 member of the
MIB_IPFORWARDROW structure should be set equal to the value of the
interface metric specified in the Metric member of the associated
MIB_IPINTERFACE_ROW structure. An application can retrieve the
interface metric by calling the GetIpInterfaceEntry function. On
Windows Vista and Windows Server 2008, the SetIpForwardEntry function
only works on interfaces with a single sub-interface (where the
interface LUID and subinterface LUID are the same). The
dwForwardIfIndex member of the MIB_IPFORWARDROW structure specifies
the interface. The dwForwardAge member the MIB_IPFORWARDROW structure
pointed to by the route parameter is not currently used by
SetIpForwardEntry. The dwForwardAge member is used only if the
Routing and Remote Access Service (RRAS)is running, and then only for
routes of type MIB_IPPROTO_NETMGMT as defined on the Protocol
Identifiers reference page. When dwForwardAge is set to INFINITE, the
route will not be removed based on a timeout value. Any other value
for dwForwardAge specifies the number of seconds until the TCP/IP
stack will remove the route from the network routing table. A route
modified by SetIpForwardEntry will automatically have a default value
for dwForwardAge of INFINITE. A number of members of the
MIB_IPFORWARDROW structure pointed to by the route parameter are not
currently used by SetIpForwardEntry. These members include
dwForwardPolicy, dwForwardType, dwForwardAge, dwForwardNextHopAS,
dwForwardMetric1, dwForwardMetric2, dwForwardMetric3,
dwForwardMetric4, and dwForwardMetric5. To create a new route in the
IP routing table, use the CreateIpForwardEntry function. To retrieve
the IP routing table, call the GetIpForwardTable function. On Windows
Vista and later, the SetIpForwardEntry function can only be called by
a user logged on as a member of the Administrators group. If
SetIpForwardEntry is called by a user that is not a member of the
Administrators group, the function call will fail and
ERROR_ACCESS_DENIED is returned. This function can also fail because
of user account control (UAC) on Windows Vista and later. If an
application that contains this function is executed by a user logged
on as a member of the Administrators group other than the built-in
Administrator, this call will fail unless the application has been
marked in the manifest file with a requestedExecutionLevel set to
requireAdministrator. If the application lacks this manifest file, a
user logged on as a member of the Administrators group other than the
built-in Administrator must then be executing the application in an
enhanced shell as the built-in Administrator (RunAs administrator)
for this function to succeed.
Note On Windows NT 4.0 and Windows 2000 and later, this function
executes a privileged operation. For this function to execute
successfully, the caller must be logged on as a member of the
Administrators group or the NetworkConfigurationOperators group.


%index
SetIpForwardEntry2
Sets the properties of an IP route entry on the local computer.
%group
Win32 iphlpapi
%prm
Route
Route : [var] A pointer to a MIB_IPFORWARD_ROW2 structure entry for an IP route entry. The DestinationPrefix member of the MIB_IPFORWARD_ROW2 must be set to a valid IP destination prefix, the NextHop member of the MIB_IPFORWARD_ROW2 must be set to a valid IP address family and IP address,   and the InterfaceLuid or the  InterfaceIndex member of the MIB_IPFORWARD_ROW2 must be specified.
%inst
Sets the properties of an IP route entry on the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The SetIpForwardEntry2 function is defined on Windows Vista and
later. The SetIpForwardEntry2 function is used to set the properties
for an existing IP route entry on a local computer. The
DestinationPrefix member in the MIB_IPFORWARD_ROW2 structure pointed
to by the Route parameter must be initialized to a valid IP address
prefix and family. The NextHop member in the MIB_IPFORWARD_ROW2
structure pointed to by the Route parameter must be initialized to a
valid IP address and family. In addition, at least one of the
following members in the MIB_IPFORWARD_ROW2 structure pointed to the
Route parameter must be initialized to the interface: the
InterfaceLuid or InterfaceIndex. The fields are used in the order
listed above. So if the InterfaceLuid is specified, then this member
is used to determine the interface on which to add the unicast IP
address. If no value was set for the InterfaceLuid member (the values
of this member was set to zero), then the InterfaceIndex member is
next used to determine the interface. The route metric offset
specified in the Metric member of the MIB_IPFORWARD_ROW2 structure
pointed to by Route parameter represents only part of the complete
route metric. The complete metric is a combination of this route
metric offset added to the interface metric specified in the Metric
member of the MIB_IPINTERFACE_ROW structure of the associated
interface. An application can retrieve the interface metric by
calling the GetIpInterfaceEntry function. The Age and Origin members
of the MIB_IPFORWARD_ROW2 structure pointed to by the Row are ignored
when the SetIpForwardEntry2 function is called. These members are set
by the network stack and cannot be changed using the
SetIpForwardEntry2 function. The SetIpForwardEntry2 function will
fail if the DestinationPrefix and NextHop members of the
MIB_IPFORWARD_ROW2 pointed to by the Route parameter do not match an
IP route entry on the interface specified. The SetIpForwardEntry2
function can only be called by a user logged on as a member of the
Administrators group. If SetIpForwardEntry2 is called by a user that
is not a member of the Administrators group, the function call will
fail and ERROR_ACCESS_DENIED is returned. The SetIpForwardEntry2
function can also fail because of user account control (UAC) on
Windows Vista and later. If an application that contains this
function is executed by a user logged on as a member of the
Administrators group other than the built-in Administrator, this call
will fail unless the application has been marked in the manifest file
with a requestedExecutionLevel set to requireAdministrator. If the
application lacks this manifest file, a user logged on as a member of
the Administrators group other than the built-in Administrator must
then be executing the application in an enhanced shell as the
built-in Administrator (RunAs administrator) for this function to
succeed.


%index
SetIpInterfaceEntry
Sets the properties of an IP interface on the local computer.
%group
Win32 iphlpapi
%prm
Row
Row : [var] A pointer to a MIB_IPINTERFACE_ROW structure entry for an interface. On input, the Family member of the MIB_IPINTERFACE_ROW must be set to AF_INET6 or AF_INET  and the InterfaceLuid or the  InterfaceIndex member of the MIB_IPINTERFACE_ROW must be specified. On a successful return, the InterfaceLuid member of the MIB_IPINTERFACE_ROW is filled in if InterfaceIndex member of the MIB_IPINTERFACE_ROW entry was specified.
%inst
Sets the properties of an IP interface on the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The SetIpInterfaceEntry function is defined on Windows Vista and
later. The SetIpInterfaceEntry function can is used to modify an
existing IP interface entry. On input, the Family member in the
MIB_IPINTERFACE_ROW structure pointed to by the Row parameter must be
initialized to either AF_INET or AF_INET6. In addition on input, at
least one of the following members in the MIB_IPINTERFACE_ROW
structure pointed to the Row parameter must be initialized: the
InterfaceLuid or InterfaceIndex. The fields are used in the order
listed above. So if the InterfaceLuid is specified, then this member
is used to determine the interface. If no value was set for the
InterfaceLuid member (the values of this member was set to zero),
then the InterfaceIndex member is next used to determine the
interface. On output, the InterfaceLuid member of the
MIB_IPINTERFACE_ROW structure pointed to by the Row parameter is
filled in if the InterfaceIndex was specified. The MaxReassemblySize,
MinRouterAdvertisementInterval, MaxRouterAdvertisementInterval ,
Connected, SupportsWakeUpPatterns, SupportsNeighborDiscovery,
SupportsRouterDiscovery, ReachableTime, TransmitOffload, and
ReceiveOffload members of the MIB_IPINTERFACE_ROW structure pointed
to by the Row are ignored when the SetIpInterfaceEntry function is
called. These members are set by the network stack and cannot be
changed using the SetIpInterfaceEntry function. An application would
typically call the GetIpInterfaceTable function to retrieve the IP
interface entries on the local computer or call the
GetIpInterfaceEntry function to retrieve just the IP interface entry
to modify. The MIB_IPINTERFACE_ROW structure for the specific IP
interface entry could then be modified and a pointer to this
structure passed to the SetIpInterfaceEntry function in the Row
parameter. However for IPv4, an application must not try to modify
the SitePrefixLength member of the MIB_IPINTERFACE_ROW structure. For
IPv4, the SitePrefixLength member must be set to 0. Another possible
method to modify an existing IP interface entry is to use
InitializeIpInterfaceEntry function to initialize the fields of a
MIB_IPINTERFACE_ROW structure entry with default values. Then set the
Family member and either the InterfaceIndex or InterfaceLuid members
in the MIB_IPINTERFACE_ROW structure pointed to by the Row parameter
to match the IP interface to change. An application can then change
the fields in the MIB_IPINTERFACE_ROW entry it wishes to modify, and
then call the SetIpInterfaceEntry function. However for IPv4, an
application must not try to modify the SitePrefixLength member of the
MIB_IPINTERFACE_ROW structure. For IPv4, the SitePrefixLength member
must be set to 0. Caution must be used with this approach because the
only way to determine all of the fields being changed would be to
compare the fields in the MIB_IPINTERFACE_ROW of the specific IP
interface entry with fields set by the InitializeIpInterfaceEntry
function when a MIB_IPINTERFACE_ROW is initialized to default values.
Unprivileged simultaneous access to multiple networks of different
security requirements creates a security hole and allows an
unprivileged application to accidentally relay data between the two
networks. A typical example is simultaneous access to a virtual
private network (VPN) and the Internet. Windows Server 2003 and
Windows XP use a weak host model, where RAS prevents such
simultaneous access by increasing the route metric of all default
routes over other interfaces. Thus all traffic is routed through the
VPN interface, disrupting other network connectivity. On Windows
Vista and later, a strong host model is used by default. If a source
IP address is specified in the route lookup using GetBestRoute2 or
GetBestRoute, the route lookup is restricted to the interface of the
source IP address. The route metric modification by RAS has no effect
as the list of potential routes does not even have the route for the
VPN interface thereby allowing traffic to the Internet. The
DisableDefaultRoutes member of the MIB_IPINTERFACE_ROW can be used to
disable using the default route on an interface. This member can be
used as a security measure by VPN clients to restrict split tunneling
when split tunneling is not required by the VPN client. A VPN client
can call the SetIpInterfaceEntry function to set the
DisableDefaultRoutes member to TRUE when required. A VPN client can
query the current state of the DisableDefaultRoutes member by calling
the GetIpInterfaceEntry function. The The SetIpInterfaceEntry
function can only be called by a user logged on as a member of the
Administrators group. If SetIpInterfaceEntry is called by a user that
is not a member of the Administrators group, the function call will
fail and ERROR_ACCESS_DENIED is returned. This function can also fail
because of user account control (UAC) on Windows Vista and later. If
an application that contains this function is executed by a user
logged on as a member of the Administrators group other than the
built-in Administrator, this call will fail unless the application
has been marked in the manifest file with a requestedExecutionLevel
set to requireAdministrator. If the application lacks this manifest
file, a user logged on as a member of the Administrators group other
than the built-in Administrator must then be executing the
application in an enhanced shell as the built-in Administrator (RunAs
administrator) for this function to succeed.


%index
SetIpNetEntry
The SetIpNetEntry function modifies an existing ARP entry in the ARP table on the local computer.
%group
Win32 iphlpapi
%prm
pArpEntry
pArpEntry : [var] A pointer to a MIB_IPNETROW structure. The information in this structure specifies the entry to modify and the new information for the entry. The caller must specify values for all members of this structure.
%inst
The SetIpNetEntry function modifies an existing ARP entry in the ARP
table on the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
On Windows Vista and later , the SetIpNetEntry function can only be
called by a user logged on as a member of the Administrators group.
If SetIpNetEntry is called by a user that is not a member of the
Administrators group, the function call will fail and
ERROR_ACCESS_DENIED is returned. The SetIpNetEntry function can also
fail because of user account control (UAC) on Windows Vista and
later. If an application that contains this function is executed by a
user logged on as a member of the Administrators group other than the
built-in Administrator, this call will fail unless the application
has been marked in the manifest file with a requestedExecutionLevel
set to requireAdministrator. If the application lacks this manifest
file, a user logged on as a member of the Administrators group other
than the built-in Administrator must then be executing the
application in an enhanced shell as the built-in Administrator (RunAs
administrator) for this function to succeed.
Note On Windows NT 4.0 and Windows 2000 and later, this function
executes a privileged operation. For this function to execute
successfully, the caller must be logged on as a member of the
Administrators group or the NetworkConfigurationOperators group.


%index
SetIpNetEntry2
Sets the physical address of an existing neighbor IP address entry on the local computer.
%group
Win32 iphlpapi
%prm
Row
Row : [var] A pointer to a MIB_IPNET_ROW2 structure entry for a neighbor IP address entry.
%inst
Sets the physical address of an existing neighbor IP address entry on
the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The SetIpNetEntry2 function is defined on Windows Vista and later.
The SetIpNetEntry2 function is used to set the physical address for
an existing neighbor IP address entry on a local computer. The
Address member in the MIB_IPNET_ROW2 structure pointed to by the Row
parameter must be initialized to a valid unicast, anycast, or
multicast IPv4 or IPv6 address and family. The PhysicalAddress and
PhysicalAddressLength members in the MIB_IPNET_ROW2 structure pointed
to by the Row parameter must be initialized to a valid physical
address. In addition, at least one of the following members in the
MIB_IPNET_ROW2 structure pointed to the Row parameter must be
initialized to the interface: the InterfaceLuid or InterfaceIndex.
The fields are used in the order listed above. So if the
InterfaceLuid is specified, then this member is used to determine the
interface on which to add the unicast IP address. If no value was set
for the InterfaceLuid member (the values of this member was set to
zero), then the InterfaceIndex member is next used to determine the
interface. The SetIpNetEntry2 function will fail if the IP address
passed in the Address member of the MIB_IPNET_ROW2 pointed to by the
Row parameter is not an existing neighbor IP address on the interface
specified. The SetIpNetEntry2 function can only be called by a user
logged on as a member of the Administrators group. If SetIpNetEntry2
is called by a user that is not a member of the Administrators group,
the function call will fail and ERROR_ACCESS_DENIED is returned. The
SetIpNetEntry2 function can also fail because of user account control
(UAC) on Windows Vista and later. If an application that contains
this function is executed by a user logged on as a member of the
Administrators group other than the built-in Administrator, this call
will fail unless the application has been marked in the manifest file
with a requestedExecutionLevel set to requireAdministrator. If the
application lacks this manifest file, a user logged on as a member of
the Administrators group other than the built-in Administrator must
then be executing the application in an enhanced shell as the
built-in Administrator (RunAs administrator) for this function to
succeed.


%index
SetIpStatistics
The SetIpStatistics function toggles IP forwarding on or off and sets the default time-to-live (TTL) value for the local computer.
%group
Win32 iphlpapi
%prm
pIpStats
pIpStats : [var] A pointer to a MIB_IPSTATS structure. The caller should set the dwForwarding and dwDefaultTTL members of this structure to the new values. To keep one of the members at its current value, use MIB_USE_CURRENT_TTL or MIB_USE_CURRENT_FORWARDING.
%inst
The SetIpStatistics function toggles IP forwarding on or off and sets
the default time-to-live (TTL) value for the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
To set only the default TTL, the caller can also use the SetIpTTL
function. On Windows Vista and later, the SetIpStatistics function
can only be called by a user logged on as a member of the
Administrators group. If SetIpStatistics is called by a user that is
not a member of the Administrators group, the function call will fail
and ERROR_ACCESS_DENIED is returned. The SetIpStatistics function can
also fail because of user account control (UAC) on Windows Vista and
later. If an application that contains this function is executed by a
user logged on as a member of the Administrators group other than the
built-in Administrator, this call will fail unless the application
has been marked in the manifest file with a requestedExecutionLevel
set to requireAdministrator. If the application lacks this manifest
file, a user logged on as a member of the Administrators group other
than the built-in Administrator must then be executing the
application in an enhanced shell as the built-in Administrator (RunAs
administrator) for this function to succeed.
Note On Windows NT 4.0 and Windows 2000 and later, this function
executes a privileged operation. For this function to execute
successfully, the caller must be logged on as a member of the
Administrators group or the NetworkConfigurationOperators group.


%index
SetIpStatisticsEx
Toggles IP forwarding on or off and sets the default time-to-live (TTL) value for the local computer.
%group
Win32 iphlpapi
%prm
Statistics, Family
Statistics : [var] A pointer to a MIB_IPSTATS structure. The caller should set the dwForwarding and dwDefaultTTL members of this structure to the new values. To keep one of the members at its current value, use MIB_USE_CURRENT_TTL or MIB_USE_CURRENT_FORWARDING.
Family : [int] The address family for which forwarding and TTL is to be set. Possible values for the address family are listed in the Winsock2.h header file. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, AF_INET and PF_INET), so either constant can be used. On the Windows SDK released for Windows?Vista and later, the organization of header files has changed and possible values for this member are defined in the Ws2def.h header file. Note that the Ws2def.h header file is automatically included in Winsock2.h, and should never be used directly. The values currently supported are AF_INET, and AF_INET6.
%inst
Toggles IP forwarding on or off and sets the default time-to-live
(TTL) value for the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
To set only the default TTL, the caller can also use the SetIpTTL
function. The SetIpStatisticsEx function can only be called by a user
logged on as a member of the Administrators group. If
SetIpStatisticsEx is called by a user that is not a member of the
Administrators group, the function call will fail and
ERROR_ACCESS_DENIED is returned. The SetIpStatisticsEx function can
also fail because of user account control (UAC) on Windows Vista and
later. If an application that contains this function is executed by a
user logged on as a member of the Administrators group other than the
built-in Administrator, this call will fail unless the application
has been marked in the manifest file with a requestedExecutionLevel
set to requireAdministrator. If the application on lacks this
manifest file, a user logged on as a member of the Administrators
group other than the built-in Administrator must then be executing
the application in an enhanced shell as the built-in Administrator
(RunAs administrator) for this function to succeed.


%index
SetIpTTL
The SetIpTTL function sets the default time-to-live (TTL) value for the local computer.
%group
Win32 iphlpapi
%prm
nTTL
nTTL : [int] The new TTL value for the local computer.
%inst
The SetIpTTL function sets the default time-to-live (TTL) value for
the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The default TTL can also be set using the SetIpStatistics function.
On Windows Vista and later, the SetIpTTL function can only be called
by a user logged on as a member of the Administrators group. If
SetIpTTL is called by a user that is not a member of the
Administrators group, the function call will fail and
ERROR_ACCESS_DENIED is returned. The SetIpStatistics function can
also fail because of user account control (UAC) on Windows Vista and
later. If an application that contains this function is executed by a
user logged on as a member of the Administrators group other than the
built-in Administrator, this call will fail unless the application
has been marked in the manifest file with a requestedExecutionLevel
set to requireAdministrator. If the application lacks this manifest
file, a user logged on as a member of the Administrators group other
than the built-in Administrator must then be executing the
application in an enhanced shell as the built-in Administrator (RunAs
administrator) for this function to succeed.
Note On Windows NT 4.0 and Windows 2000 and later, this function
executes a privileged operation. For this function to execute
successfully, the caller must be logged on as a member of the
Administrators group or the NetworkConfigurationOperators group.


%index
SetJobCompartmentId
(no summary)
%group
Win32 iphlpapi
%prm
JobHandle, CompartmentId
JobHandle : [intptr] 
CompartmentId : [int] 
%inst



%index
SetNetworkInformation
Reserved for future use. Do not use this function. (SetNetworkInformation)
%group
Win32 iphlpapi
%prm
NetworkGuid, CompartmentId, NetworkName
NetworkGuid : [var] Reserved.
CompartmentId : [int] Reserved.
NetworkName : [wstr] Reserved.
%inst
Reserved for future use. Do not use this function.
(SetNetworkInformation)


%index
SetPerTcp6ConnectionEStats
Sets a value in the read/write information for an IPv6 TCP connection. This function is used to enable or disable extended statistics for an IPv6 TCP connection.
%group
Win32 iphlpapi
%prm
Row, EstatsType, Rw, RwVersion, RwSize, Offset
Row : [var] A pointer to a MIB_TCP6ROW structure for an IPv6 TCP connection.
EstatsType : [int] The type of extended statistics for TCP to set. This parameter determines the data and format of information that is expected in the Rw parameter. This parameter can be one of the values from the TCP_ESTATS_TYPE enumeration type defined in the Tcpestats.h header file.
Rw : [var] A pointer to a buffer that contains the read/write information to set. The buffer should contain a value from the TCP_BOOLEAN_OPTIONAL enumeration for each structure member that specifies how each member should be updated.
RwVersion : [int] The version of the read/write information to be set. This parameter should be set to zero for Windows?Vista, Windows Server?2008, and Windows?7.
RwSize : [int] The size, in bytes, of the buffer pointed to by the Rw parameter.
Offset : [int] The offset, in bytes, to the member in the structure pointed to by the Rw parameter to be set.  This parameter is currently unused and must be set to zero.
%inst
Sets a value in the read/write information for an IPv6 TCP
connection. This function is used to enable or disable extended
statistics for an IPv6 TCP connection.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The SetPerTcp6ConnectionEStats function is defined on Windows Vista
and later. The SetPerTcp6ConnectionEStats function is used to enable
or disable extended statistics for the IPv6 TCP connection passed in
the Row parameter. Extended statistics on a TCP connection are
disabled by default. The SetPerTcp6ConnectionEStats function is used
to set the value of a member in the read/write information for
extended statistics for an IPv6 TCP connection. The type and format
of the structure to be set is specified by the EstatsType parameter.
The Rw parameter contains a pointer to the structure being passed.
The member to set in this structure is specified by the Offset
parameter. All members in the structure pointed to by Rw parameter
must be specified. The only version of TCP connection statistics
currently supported is version zero. So the RwVersion parameter
passed to SetPerTcp6ConnectionEStats should be set to 0. The
structure pointed to by the Rw parameter passed this function depends
on the enumeration value passed in the EstatsType parameter. The
following table below indicates the structure type that should be
passed in the Rw parameter for each possible EstatsType parameter
type.
This doc was truncated.


%index
SetPerTcpConnectionEStats
Sets a value in the read/write information for an IPv4 TCP connection. This function is used to enable or disable extended statistics for an IPv4 TCP connection.
%group
Win32 iphlpapi
%prm
Row, EstatsType, Rw, RwVersion, RwSize, Offset
Row : [var] A pointer to a MIB_TCPROW structure for an IPv4 TCP connection.
EstatsType : [int] The type of extended statistics for TCP to set. This parameter determines the data and format of information that is expected in the Rw parameter. This parameter can be one of the values from the TCP_ESTATS_TYPE enumeration type defined in the Tcpestats.h header file.
Rw : [var] A pointer to a buffer that contains the read/write information to set. The buffer should contain a value from the TCP_BOOLEAN_OPTIONAL enumeration for each structure member that specifies how each member should be updated.
RwVersion : [int] The version of the read/write information to be set. This parameter should be set to zero for Windows?Vista, Windows Server?2008, and Windows?7.
RwSize : [int] The size, in bytes, of the buffer pointed to by the Rw parameter.
Offset : [int] The offset, in bytes, to the member in the structure pointed to by the Rw parameter to be set. This parameter is currently unused and must be set to zero.
%inst
Sets a value in the read/write information for an IPv4 TCP
connection. This function is used to enable or disable extended
statistics for an IPv4 TCP connection.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The SetPerTcpConnectionEStats function is defined on Windows Vista
and later. The SetPerTcpConnectionEStats function is used to enable
or disable extended statistics on an IPv4 TCP connection passed in
the Row parameter. Extended statistics on a TCP connection are
disabled by default. The SetPerTcpConnectionEStats function is used
to set the value of a member in the read/write information for
extended statistics for an IPv4 TCP connection. The type and format
of the structure to be set is specified by the EstatsType parameter.
The Rw parameter contains a pointer to the structure being passed.
All members in the structure pointed to by Rw parameter must be
specified. The only version of TCP connection statistics currently
supported is version zero. So the RwVersion parameter passed to
SetPerTcpConnectionEStats should be set to 0. The structure pointed
to by the Rw parameter passed this function depends on the
enumeration value passed in the EstatsType parameter. The following
table below indicates the structure type that should be passed in the
Rw parameter for each possible EstatsType parameter type.
This doc was truncated.


%index
SetSessionCompartmentId
Reserved for future use. Do not use this function. (SetSessionCompartmentId)
%group
Win32 iphlpapi
%prm
SessionId, CompartmentId
SessionId : [int] Reserved.
CompartmentId : [int] Reserved.
%inst
Reserved for future use. Do not use this function.
(SetSessionCompartmentId)


%index
SetTcpEntry
The SetTcpEntry function sets the state of a TCP connection.
%group
Win32 iphlpapi
%prm
pTcpRow
pTcpRow : [var] A pointer to a MIB_TCPROW structure. This structure specifies information to identify the TCP connection to modify. It also specifies the new state for the TCP connection. The caller must specify values for all the members in this structure.
%inst
The SetTcpEntry function sets the state of a TCP connection.

[戻り値]
The function returns NO_ERROR (zero) if the function is successful.
If the function fails, the return value is one of the following error
codes.
This doc was truncated.

[備考]
Currently, the only state to which a TCP connection can be set is
MIB_TCP_STATE_DELETE_TCB. On Windows Vista and later, the SetTcpEntry
function can only be called by a user logged on as a member of the
Administrators group. If SetTcpEntry is called by a user that is not
a member of the Administrators group, the function call will fail and
ERROR_ACCESS_DENIED is returned. The SetTcpEntry function can also
fail because of user account control (UAC) on Windows Vista and
later. If an application that contains this function is executed by a
user logged on as a member of the Administrators group other than the
built-in Administrator, this call will fail unless the application
has been marked in the manifest file with a requestedExecutionLevel
set to requireAdministrator. If the application lacks this manifest
file, a user logged on as a member of the Administrators group other
than the built-in Administrator must then be executing the
application in an enhanced shell as the built-in Administrator (RunAs
administrator) for this function to succeed.


%index
SetUnicastIpAddressEntry
Sets the properties of an existing unicast IP address entry on the local computer.
%group
Win32 iphlpapi
%prm
Row
Row : [var] A pointer to a MIB_UNICASTIPADDRESS_ROW structure entry for an existing unicast IP address entry.
%inst
Sets the properties of an existing unicast IP address entry on the
local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The SetUnicastIpAddressEntry function is defined on Windows Vista and
later. The GetUnicastIpAddressEntry function is normally used to
retrieve an existing MIB_UNICASTIPADDRESS_ROW structure entry to be
modified. An application can then change the members in the
MIB_UNICASTIPADDRESS_ROW entry it wishes to modify, and then call the
SetUnicastIpAddressEntry function. An application may call the
InitializeUnicastIpAddressEntry function to initialize the members of
a MIB_UNICASTIPADDRESS_ROW structure entry with default values before
making changes. However, the application would normally save either
the InterfaceLuid or InterfaceIndex member before calling
InitializeUnicastIpAddressEntry and restore one of these members
after the call. The Address member in the MIB_UNICASTIPADDRESS_ROW
structure pointed to by the Row parameter must be initialized to a
valid unicast IPv4 or IPv6 address and family. In addition, at least
one of the following members in the MIB_UNICASTIPADDRESS_ROW
structure pointed to the Row parameter must be initialized: the
InterfaceLuid or InterfaceIndex. The fields are used in the order
listed above. So if the InterfaceLuid is specified, then this member
is used to determine the interface. If no value was set for the
InterfaceLuid member (the values of this member was set to zero),
then the InterfaceIndex member is next used to determine the
interface. If the OnLinkPrefixLength member of the
MIB_UNICASTIPADDRESS_ROW pointed to by the Row parameter is set to
255, then SetUnicastIpAddressEntry will set the unicast IP address
properties so that the OnLinkPrefixLength member is equal to the
length of the IP address. So for a unicast IPv4 address, the
OnLinkPrefixLength is set to 32 and the OnLinkPrefixLength is set to
128 for a unicast IPv6 address. If this would result in the incorrect
subnet mask for an IPv4 address or the incorrect link prefix for an
IPv6 address, then the application should set this member to the
correct value before calling SetUnicastIpAddressEntry. The DadState,
ScopeId, and CreationTimeStamp members of the
MIB_UNICASTIPADDRESS_ROW structure pointed to by the Row are ignored
when the SetUnicastIpAddressEntry function is called. These members
are set by the network stack and cannot be changed using the
SetUnicastIpAddressEntry function. The ScopeId member is
automatically determined by the interface on which the address was
added. The SetUnicastIpAddressEntry function can only be called by a
user logged on as a member of the Administrators group. If
SetUnicastIpAddressEntry is called by a user that is not a member of
the Administrators group, the function call will fail and
ERROR_ACCESS_DENIED is returned. The SetUnicastIpAddressEntry
function can also fail because of user account control (UAC) on
Windows Vista and later. If an application that contains this
function is executed by a user logged on as a member of the
Administrators group other than the built-in Administrator, this call
will fail unless the application has been marked in the manifest file
with a requestedExecutionLevel set to requireAdministrator. If the
application lacks this manifest file, a user logged on as a member of
the Administrators group other than the built-in Administrator must
then be executing the application in an enhanced shell as the
built-in Administrator (RunAs administrator) for this function to
succeed.


%index
UnenableRouter
The UnenableRouter function decrements the reference count that tracks the number of requests to enable IPv4 forwarding. When this reference count reaches zero, UnenableRouter turns off IPv4 forwarding on the local computer.
%group
Win32 iphlpapi
%prm
pOverlapped, lpdwEnableCount
pOverlapped : [var] A pointer to an OVERLAPPED structure. This structure should be the same as the one used in the call to the EnableRouter function.
lpdwEnableCount : [var] An optional pointer to a DWORD variable. This variable receives the number of references remaining.
%inst
The UnenableRouter function decrements the reference count that
tracks the number of requests to enable IPv4 forwarding. When this
reference count reaches zero, UnenableRouter turns off IPv4
forwarding on the local computer.

[戻り値]
If the function succeeds, the return value is NO_ERROR. If the
function fails, use FormatMessage to obtain the message string for
the returned error.

[備考]
The UnenableRouter function is specific to IPv4 forwarding. Each call
that a process makes to UnenableRouter must correspond to a previous
call to EnableRouter by the same process. The system returns an error
on extraneous calls to UnenableRouter. As a result, a given process
is not able to decrement the reference count that tracks the number
of requests for enabling IPv4 forwarding for another process. Also,
if IPv4 forwarding was enabled by a given process, it cannot be
disabled by a different process. It is not possible to accurately
determine the reference count that tracks the number of requests for
enabling IPv4 forwarding since there might be other outstanding
EnableRouter requests. So the value returned for the lpdwEnableCount
parameter is always a large count equal to ULONG_MAX/2.
If the process that calls EnableRouter terminates without calling
UnenableRouter, the system decrements the reference count that tracks
requests to enable IPv4 forwarding as though the process had called
UnenableRouter. After calling the UnenableRouter, use the CloseHandle
call to close the handle to the event object in the OVERLAPPED
structure.

