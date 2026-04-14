; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    iphlpapi.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __iphlpapi_gen2_as__
#define __iphlpapi_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "iphlpapi.dll"
; uint AddIPAddress(uint Address, uint IpMask, uint IfIndex, uint* NTEContext, uint* NTEInstance)
#cfunc AddIPAddress "AddIPAddress" int, int, int, var, var

; winmdroot.Foundation.BOOL CancelIPChangeNotify(global::System.Threading.NativeOverlapped* notifyOverlapped)
#cfunc CancelIPChangeNotify "CancelIPChangeNotify" var

; void UnregisterInterfaceTimestampConfigChange(winmdroot.NetworkManagement.IpHelper.HIFTIMESTAMPCHANGE NotificationHandle)
#func UnregisterInterfaceTimestampConfigChange "UnregisterInterfaceTimestampConfigChange" intptr

; void CancelIfTimestampConfigChange(winmdroot.NetworkManagement.IpHelper.HIFTIMESTAMPCHANGE NotificationHandle)
#func CancelIfTimestampConfigChange "CancelIfTimestampConfigChange" intptr

; winmdroot.Foundation.WIN32_ERROR CancelMibChangeNotify2(winmdroot.Foundation.HANDLE NotificationHandle)
#cfunc CancelMibChangeNotify2 "CancelMibChangeNotify2" intptr

; uint CaptureInterfaceHardwareCrossTimestamp(winmdroot.NetworkManagement.Ndis.NET_LUID_LH* InterfaceLuid, winmdroot.NetworkManagement.IpHelper.INTERFACE_HARDWARE_CROSSTIMESTAMP* CrossTimestamp)
#cfunc CaptureInterfaceHardwareCrossTimestamp "CaptureInterfaceHardwareCrossTimestamp" var, var

; winmdroot.Foundation.WIN32_ERROR ConvertCompartmentGuidToId(global::System.Guid* CompartmentGuid, uint* CompartmentId)
#cfunc ConvertCompartmentGuidToId "ConvertCompartmentGuidToId" var, var

; winmdroot.Foundation.WIN32_ERROR ConvertCompartmentIdToGuid(uint CompartmentId, global::System.Guid* CompartmentGuid)
#cfunc ConvertCompartmentIdToGuid "ConvertCompartmentIdToGuid" int, var

; winmdroot.Foundation.WIN32_ERROR ConvertInterfaceAliasToLuid(winmdroot.Foundation.PCWSTR InterfaceAlias, winmdroot.NetworkManagement.Ndis.NET_LUID_LH* InterfaceLuid)
#cfunc ConvertInterfaceAliasToLuid "ConvertInterfaceAliasToLuid" wstr, var

; winmdroot.Foundation.WIN32_ERROR ConvertInterfaceGuidToLuid(global::System.Guid* InterfaceGuid, winmdroot.NetworkManagement.Ndis.NET_LUID_LH* InterfaceLuid)
#cfunc ConvertInterfaceGuidToLuid "ConvertInterfaceGuidToLuid" var, var

; winmdroot.Foundation.WIN32_ERROR ConvertInterfaceIndexToLuid(uint InterfaceIndex, winmdroot.NetworkManagement.Ndis.NET_LUID_LH* InterfaceLuid)
#cfunc ConvertInterfaceIndexToLuid "ConvertInterfaceIndexToLuid" int, var

; winmdroot.Foundation.WIN32_ERROR ConvertInterfaceLuidToAlias(winmdroot.NetworkManagement.Ndis.NET_LUID_LH* InterfaceLuid, winmdroot.Foundation.PWSTR InterfaceAlias, nuint Length)
#cfunc ConvertInterfaceLuidToAlias "ConvertInterfaceLuidToAlias" var, wstr, int

; winmdroot.Foundation.WIN32_ERROR ConvertInterfaceLuidToGuid(winmdroot.NetworkManagement.Ndis.NET_LUID_LH* InterfaceLuid, global::System.Guid* InterfaceGuid)
#cfunc ConvertInterfaceLuidToGuid "ConvertInterfaceLuidToGuid" var, var

; winmdroot.Foundation.WIN32_ERROR ConvertInterfaceLuidToIndex(winmdroot.NetworkManagement.Ndis.NET_LUID_LH* InterfaceLuid, uint* InterfaceIndex)
#cfunc ConvertInterfaceLuidToIndex "ConvertInterfaceLuidToIndex" var, var

; winmdroot.Foundation.WIN32_ERROR ConvertInterfaceLuidToNameW(winmdroot.NetworkManagement.Ndis.NET_LUID_LH* InterfaceLuid, winmdroot.Foundation.PWSTR InterfaceName, nuint Length)
#cfunc ConvertInterfaceLuidToNameW "ConvertInterfaceLuidToNameW" var, wstr, int

; winmdroot.Foundation.WIN32_ERROR ConvertInterfaceNameToLuidW(winmdroot.Foundation.PCWSTR InterfaceName, winmdroot.NetworkManagement.Ndis.NET_LUID_LH* InterfaceLuid)
#cfunc ConvertInterfaceNameToLuidW "ConvertInterfaceNameToLuidW" wstr, var

; winmdroot.Foundation.WIN32_ERROR ConvertIpv4MaskToLength(uint Mask, byte* MaskLength)
#cfunc ConvertIpv4MaskToLength "ConvertIpv4MaskToLength" int, var

; winmdroot.Foundation.WIN32_ERROR ConvertLengthToIpv4Mask(uint MaskLength, uint* Mask)
#cfunc ConvertLengthToIpv4Mask "ConvertLengthToIpv4Mask" int, var

; winmdroot.Foundation.WIN32_ERROR CreateAnycastIpAddressEntry(winmdroot.NetworkManagement.IpHelper.MIB_ANYCASTIPADDRESS_ROW* Row)
#cfunc CreateAnycastIpAddressEntry "CreateAnycastIpAddressEntry" var

; uint CreateIpForwardEntry(winmdroot.NetworkManagement.IpHelper.MIB_IPFORWARDROW* pRoute)
#cfunc CreateIpForwardEntry "CreateIpForwardEntry" var

; winmdroot.Foundation.WIN32_ERROR CreateIpForwardEntry2(winmdroot.NetworkManagement.IpHelper.MIB_IPFORWARD_ROW2* Row)
#cfunc CreateIpForwardEntry2 "CreateIpForwardEntry2" var

; uint CreateIpNetEntry(winmdroot.NetworkManagement.IpHelper.MIB_IPNETROW_LH* pArpEntry)
#cfunc CreateIpNetEntry "CreateIpNetEntry" var

; winmdroot.Foundation.WIN32_ERROR CreateIpNetEntry2(winmdroot.NetworkManagement.IpHelper.MIB_IPNET_ROW2* Row)
#cfunc CreateIpNetEntry2 "CreateIpNetEntry2" var

; uint CreatePersistentTcpPortReservation(ushort StartPort, ushort NumberOfPorts, ulong* Token)
#cfunc CreatePersistentTcpPortReservation "CreatePersistentTcpPortReservation" int, int, var

; uint CreatePersistentUdpPortReservation(ushort StartPort, ushort NumberOfPorts, ulong* Token)
#cfunc CreatePersistentUdpPortReservation "CreatePersistentUdpPortReservation" int, int, var

; uint CreateProxyArpEntry(uint dwAddress, uint dwMask, uint dwIfIndex)
#cfunc CreateProxyArpEntry "CreateProxyArpEntry" int, int, int

; winmdroot.Foundation.WIN32_ERROR CreateSortedAddressPairs([Optional] winmdroot.Networking.WinSock.SOCKADDR_IN6* SourceAddressList, uint SourceAddressCount, winmdroot.Networking.WinSock.SOCKADDR_IN6* DestinationAddressList, uint DestinationAddressCount, uint AddressSortOptions, winmdroot.Networking.WinSock.SOCKADDR_IN6_PAIR** SortedAddressPairList, uint* SortedAddressPairCount)
#cfunc CreateSortedAddressPairs "CreateSortedAddressPairs" var, int, var, int, int, var, var

; winmdroot.Foundation.WIN32_ERROR CreateUnicastIpAddressEntry(winmdroot.NetworkManagement.IpHelper.MIB_UNICASTIPADDRESS_ROW* Row)
#cfunc CreateUnicastIpAddressEntry "CreateUnicastIpAddressEntry" var

; winmdroot.Foundation.WIN32_ERROR DeleteAnycastIpAddressEntry(winmdroot.NetworkManagement.IpHelper.MIB_ANYCASTIPADDRESS_ROW* Row)
#cfunc DeleteAnycastIpAddressEntry "DeleteAnycastIpAddressEntry" var

; uint DeleteIPAddress(uint NTEContext)
#cfunc DeleteIPAddress "DeleteIPAddress" int

; uint DeleteIpForwardEntry(winmdroot.NetworkManagement.IpHelper.MIB_IPFORWARDROW* pRoute)
#cfunc DeleteIpForwardEntry "DeleteIpForwardEntry" var

; winmdroot.Foundation.WIN32_ERROR DeleteIpForwardEntry2(winmdroot.NetworkManagement.IpHelper.MIB_IPFORWARD_ROW2* Row)
#cfunc DeleteIpForwardEntry2 "DeleteIpForwardEntry2" var

; uint DeleteIpNetEntry(winmdroot.NetworkManagement.IpHelper.MIB_IPNETROW_LH* pArpEntry)
#cfunc DeleteIpNetEntry "DeleteIpNetEntry" var

; winmdroot.Foundation.WIN32_ERROR DeleteIpNetEntry2(winmdroot.NetworkManagement.IpHelper.MIB_IPNET_ROW2* Row)
#cfunc DeleteIpNetEntry2 "DeleteIpNetEntry2" var

; uint DeletePersistentTcpPortReservation(ushort StartPort, ushort NumberOfPorts)
#cfunc DeletePersistentTcpPortReservation "DeletePersistentTcpPortReservation" int, int

; uint DeletePersistentUdpPortReservation(ushort StartPort, ushort NumberOfPorts)
#cfunc DeletePersistentUdpPortReservation "DeletePersistentUdpPortReservation" int, int

; uint DeleteProxyArpEntry(uint dwAddress, uint dwMask, uint dwIfIndex)
#cfunc DeleteProxyArpEntry "DeleteProxyArpEntry" int, int, int

; winmdroot.Foundation.WIN32_ERROR DeleteUnicastIpAddressEntry(winmdroot.NetworkManagement.IpHelper.MIB_UNICASTIPADDRESS_ROW* Row)
#cfunc DeleteUnicastIpAddressEntry "DeleteUnicastIpAddressEntry" var

; uint DisableMediaSense(winmdroot.Foundation.HANDLE* pHandle, global::System.Threading.NativeOverlapped* pOverLapped)
#cfunc DisableMediaSense "DisableMediaSense" intptr, var

; uint EnableRouter(winmdroot.Foundation.HANDLE* pHandle, global::System.Threading.NativeOverlapped* pOverlapped)
#cfunc EnableRouter "EnableRouter" intptr, var

; uint FlushIpNetTable(uint dwIfIndex)
#cfunc FlushIpNetTable "FlushIpNetTable" int

; winmdroot.Foundation.WIN32_ERROR FlushIpNetTable2(winmdroot.Networking.WinSock.ADDRESS_FAMILY Family, uint InterfaceIndex)
#cfunc FlushIpNetTable2 "FlushIpNetTable2" int, int

; winmdroot.Foundation.WIN32_ERROR FlushIpPathTable(winmdroot.Networking.WinSock.ADDRESS_FAMILY Family)
#cfunc FlushIpPathTable "FlushIpPathTable" int

; void FreeDnsSettings(winmdroot.NetworkManagement.IpHelper.DNS_SETTINGS* Settings)
#func FreeDnsSettings "FreeDnsSettings" var

; void FreeInterfaceDnsSettings(winmdroot.NetworkManagement.IpHelper.DNS_INTERFACE_SETTINGS* Settings)
#func FreeInterfaceDnsSettings "FreeInterfaceDnsSettings" var

; void FreeMibTable(void* Memory)
#func FreeMibTable "FreeMibTable" intptr

; uint GetAdapterIndex(winmdroot.Foundation.PWSTR AdapterName, uint* IfIndex)
#cfunc GetAdapterIndex "GetAdapterIndex" wstr, var

; winmdroot.NetworkManagement.IpHelper.IP_ADAPTER_ORDER_MAP* GetAdapterOrderMap()
#cfunc GetAdapterOrderMap "GetAdapterOrderMap"

; uint GetAdaptersAddresses(uint Family, winmdroot.NetworkManagement.IpHelper.GET_ADAPTERS_ADDRESSES_FLAGS Flags, [Optional] void* Reserved, [Optional] winmdroot.NetworkManagement.IpHelper.IP_ADAPTER_ADDRESSES_LH* AdapterAddresses, uint* SizePointer)
#cfunc GetAdaptersAddresses "GetAdaptersAddresses" int, int, intptr, var, var

; uint GetAdaptersInfo([Optional] winmdroot.NetworkManagement.IpHelper.IP_ADAPTER_INFO* AdapterInfo, uint* SizePointer)
#cfunc GetAdaptersInfo "GetAdaptersInfo" var, var

; winmdroot.Foundation.WIN32_ERROR GetAnycastIpAddressEntry(winmdroot.NetworkManagement.IpHelper.MIB_ANYCASTIPADDRESS_ROW* Row)
#cfunc GetAnycastIpAddressEntry "GetAnycastIpAddressEntry" var

; winmdroot.Foundation.WIN32_ERROR GetAnycastIpAddressTable(winmdroot.Networking.WinSock.ADDRESS_FAMILY Family, winmdroot.NetworkManagement.IpHelper.MIB_ANYCASTIPADDRESS_TABLE** Table)
#cfunc GetAnycastIpAddressTable "GetAnycastIpAddressTable" int, var

; uint GetBestInterface(uint dwDestAddr, uint* pdwBestIfIndex)
#cfunc GetBestInterface "GetBestInterface" int, var

; uint GetBestInterfaceEx(winmdroot.Networking.WinSock.SOCKADDR* pDestAddr, uint* pdwBestIfIndex)
#cfunc GetBestInterfaceEx "GetBestInterfaceEx" var, var

; uint GetBestRoute(uint dwDestAddr, uint dwSourceAddr, winmdroot.NetworkManagement.IpHelper.MIB_IPFORWARDROW* pBestRoute)
#cfunc GetBestRoute "GetBestRoute" int, int, var

; winmdroot.Foundation.WIN32_ERROR GetBestRoute2([Optional] winmdroot.NetworkManagement.Ndis.NET_LUID_LH* InterfaceLuid, uint InterfaceIndex, [Optional] winmdroot.Networking.WinSock.SOCKADDR_INET* SourceAddress, winmdroot.Networking.WinSock.SOCKADDR_INET* DestinationAddress, uint AddressSortOptions, winmdroot.NetworkManagement.IpHelper.MIB_IPFORWARD_ROW2* BestRoute, winmdroot.Networking.WinSock.SOCKADDR_INET* BestSourceAddress)
#cfunc GetBestRoute2 "GetBestRoute2" var, int, var, var, int, var, var

; winmdroot.Foundation.WIN32_ERROR GetCurrentThreadCompartmentId()
#cfunc GetCurrentThreadCompartmentId "GetCurrentThreadCompartmentId"

; void GetCurrentThreadCompartmentScope(uint* CompartmentScope, uint* CompartmentId)
#func GetCurrentThreadCompartmentScope "GetCurrentThreadCompartmentScope" var, var

; winmdroot.Foundation.WIN32_ERROR GetDefaultCompartmentId()
#cfunc GetDefaultCompartmentId "GetDefaultCompartmentId"

; winmdroot.Foundation.WIN32_ERROR GetDnsSettings(winmdroot.NetworkManagement.IpHelper.DNS_SETTINGS* Settings)
#cfunc GetDnsSettings "GetDnsSettings" var

; uint GetExtendedTcpTable([Optional] void* pTcpTable, uint* pdwSize, winmdroot.Foundation.BOOL bOrder, uint ulAf, winmdroot.NetworkManagement.IpHelper.TCP_TABLE_CLASS TableClass, uint Reserved)
#cfunc GetExtendedTcpTable "GetExtendedTcpTable" intptr, var, int, int, int, int

; uint GetExtendedUdpTable([Optional] void* pUdpTable, uint* pdwSize, winmdroot.Foundation.BOOL bOrder, uint ulAf, winmdroot.NetworkManagement.IpHelper.UDP_TABLE_CLASS TableClass, uint Reserved)
#cfunc GetExtendedUdpTable "GetExtendedUdpTable" intptr, var, int, int, int, int

; uint GetFriendlyIfIndex(uint IfIndex)
#cfunc GetFriendlyIfIndex "GetFriendlyIfIndex" int

; uint GetIcmpStatistics(winmdroot.NetworkManagement.IpHelper.MIB_ICMP* Statistics)
#cfunc GetIcmpStatistics "GetIcmpStatistics" var

; uint GetIcmpStatisticsEx(winmdroot.NetworkManagement.IpHelper.MIB_ICMP_EX_XPSP1* Statistics, uint Family)
#cfunc GetIcmpStatisticsEx "GetIcmpStatisticsEx" var, int

; uint GetIfEntry(winmdroot.NetworkManagement.IpHelper.MIB_IFROW* pIfRow)
#cfunc GetIfEntry "GetIfEntry" var

; winmdroot.Foundation.WIN32_ERROR GetIfEntry2(winmdroot.NetworkManagement.IpHelper.MIB_IF_ROW2* Row)
#cfunc GetIfEntry2 "GetIfEntry2" var

; winmdroot.Foundation.WIN32_ERROR GetIfEntry2Ex(winmdroot.NetworkManagement.IpHelper.MIB_IF_ENTRY_LEVEL Level, winmdroot.NetworkManagement.IpHelper.MIB_IF_ROW2* Row)
#cfunc GetIfEntry2Ex "GetIfEntry2Ex" int, var

; winmdroot.Foundation.WIN32_ERROR GetIfStackTable(winmdroot.NetworkManagement.IpHelper.MIB_IFSTACK_TABLE** Table)
#cfunc GetIfStackTable "GetIfStackTable" var

; uint GetIfTable([Optional] winmdroot.NetworkManagement.IpHelper.MIB_IFTABLE* pIfTable, uint* pdwSize, winmdroot.Foundation.BOOL bOrder)
#cfunc GetIfTable "GetIfTable" var, var, int

; winmdroot.Foundation.WIN32_ERROR GetIfTable2(winmdroot.NetworkManagement.IpHelper.MIB_IF_TABLE2** Table)
#cfunc GetIfTable2 "GetIfTable2" var

; winmdroot.Foundation.WIN32_ERROR GetIfTable2Ex(winmdroot.NetworkManagement.IpHelper.MIB_IF_TABLE_LEVEL Level, winmdroot.NetworkManagement.IpHelper.MIB_IF_TABLE2** Table)
#cfunc GetIfTable2Ex "GetIfTable2Ex" int, var

; uint GetInterfaceCurrentTimestampCapabilities(winmdroot.NetworkManagement.Ndis.NET_LUID_LH* InterfaceLuid, winmdroot.NetworkManagement.IpHelper.INTERFACE_TIMESTAMP_CAPABILITIES* TimestampCapabilites)
#cfunc GetInterfaceCurrentTimestampCapabilities "GetInterfaceCurrentTimestampCapabilities" var, var

; winmdroot.Foundation.WIN32_ERROR GetInterfaceDnsSettings(global::System.Guid Interface, winmdroot.NetworkManagement.IpHelper.DNS_INTERFACE_SETTINGS* Settings)
#cfunc GetInterfaceDnsSettings "GetInterfaceDnsSettings" int, var

; uint GetInterfaceHardwareTimestampCapabilities(winmdroot.NetworkManagement.Ndis.NET_LUID_LH* InterfaceLuid, winmdroot.NetworkManagement.IpHelper.INTERFACE_TIMESTAMP_CAPABILITIES* TimestampCapabilites)
#cfunc GetInterfaceHardwareTimestampCapabilities "GetInterfaceHardwareTimestampCapabilities" var, var

; uint GetInterfaceInfo([Optional] winmdroot.NetworkManagement.IpHelper.IP_INTERFACE_INFO* pIfTable, uint* dwOutBufLen)
#cfunc GetInterfaceInfo "GetInterfaceInfo" var, var

; winmdroot.Foundation.WIN32_ERROR GetInvertedIfStackTable(winmdroot.NetworkManagement.IpHelper.MIB_INVERTEDIFSTACK_TABLE** Table)
#cfunc GetInvertedIfStackTable "GetInvertedIfStackTable" var

; uint GetIpAddrTable([Optional] winmdroot.NetworkManagement.IpHelper.MIB_IPADDRTABLE* pIpAddrTable, uint* pdwSize, winmdroot.Foundation.BOOL bOrder)
#cfunc GetIpAddrTable "GetIpAddrTable" var, var, int

; uint GetIpErrorString(uint ErrorCode, winmdroot.Foundation.PWSTR Buffer, uint* Size)
#cfunc GetIpErrorString "GetIpErrorString" int, wstr, var

; winmdroot.Foundation.WIN32_ERROR GetIpForwardEntry2(winmdroot.NetworkManagement.IpHelper.MIB_IPFORWARD_ROW2* Row)
#cfunc GetIpForwardEntry2 "GetIpForwardEntry2" var

; uint GetIpForwardTable([Optional] winmdroot.NetworkManagement.IpHelper.MIB_IPFORWARDTABLE* pIpForwardTable, uint* pdwSize, winmdroot.Foundation.BOOL bOrder)
#cfunc GetIpForwardTable "GetIpForwardTable" var, var, int

; winmdroot.Foundation.WIN32_ERROR GetIpForwardTable2(winmdroot.Networking.WinSock.ADDRESS_FAMILY Family, winmdroot.NetworkManagement.IpHelper.MIB_IPFORWARD_TABLE2** Table)
#cfunc GetIpForwardTable2 "GetIpForwardTable2" int, var

; winmdroot.Foundation.WIN32_ERROR GetIpInterfaceEntry(winmdroot.NetworkManagement.IpHelper.MIB_IPINTERFACE_ROW* Row)
#cfunc GetIpInterfaceEntry "GetIpInterfaceEntry" var

; winmdroot.Foundation.WIN32_ERROR GetIpInterfaceTable(winmdroot.Networking.WinSock.ADDRESS_FAMILY Family, winmdroot.NetworkManagement.IpHelper.MIB_IPINTERFACE_TABLE** Table)
#cfunc GetIpInterfaceTable "GetIpInterfaceTable" int, var

; winmdroot.Foundation.WIN32_ERROR GetIpNetEntry2(winmdroot.NetworkManagement.IpHelper.MIB_IPNET_ROW2* Row)
#cfunc GetIpNetEntry2 "GetIpNetEntry2" var

; uint GetIpNetTable([Optional] winmdroot.NetworkManagement.IpHelper.MIB_IPNETTABLE* IpNetTable, uint* SizePointer, winmdroot.Foundation.BOOL Order)
#cfunc GetIpNetTable "GetIpNetTable" var, var, int

; winmdroot.Foundation.WIN32_ERROR GetIpNetTable2(winmdroot.Networking.WinSock.ADDRESS_FAMILY Family, winmdroot.NetworkManagement.IpHelper.MIB_IPNET_TABLE2** Table)
#cfunc GetIpNetTable2 "GetIpNetTable2" int, var

; winmdroot.Foundation.WIN32_ERROR GetIpNetworkConnectionBandwidthEstimates(uint InterfaceIndex, winmdroot.Networking.WinSock.ADDRESS_FAMILY AddressFamily, winmdroot.NetworkManagement.IpHelper.MIB_IP_NETWORK_CONNECTION_BANDWIDTH_ESTIMATES* BandwidthEstimates)
#cfunc GetIpNetworkConnectionBandwidthEstimates "GetIpNetworkConnectionBandwidthEstimates" int, int, var

; winmdroot.Foundation.WIN32_ERROR GetIpPathEntry(winmdroot.NetworkManagement.IpHelper.MIB_IPPATH_ROW* Row)
#cfunc GetIpPathEntry "GetIpPathEntry" var

; winmdroot.Foundation.WIN32_ERROR GetIpPathTable(winmdroot.Networking.WinSock.ADDRESS_FAMILY Family, winmdroot.NetworkManagement.IpHelper.MIB_IPPATH_TABLE** Table)
#cfunc GetIpPathTable "GetIpPathTable" int, var

; uint GetIpStatistics(winmdroot.NetworkManagement.IpHelper.MIB_IPSTATS_LH* Statistics)
#cfunc GetIpStatistics "GetIpStatistics" var

; uint GetIpStatisticsEx(winmdroot.NetworkManagement.IpHelper.MIB_IPSTATS_LH* Statistics, uint Family)
#cfunc GetIpStatisticsEx "GetIpStatisticsEx" var, int

; uint GetJobCompartmentId(winmdroot.Foundation.HANDLE JobHandle)
#cfunc GetJobCompartmentId "GetJobCompartmentId" intptr

; winmdroot.Foundation.WIN32_ERROR GetMulticastIpAddressEntry(winmdroot.NetworkManagement.IpHelper.MIB_MULTICASTIPADDRESS_ROW* Row)
#cfunc GetMulticastIpAddressEntry "GetMulticastIpAddressEntry" var

; winmdroot.Foundation.WIN32_ERROR GetMulticastIpAddressTable(winmdroot.Networking.WinSock.ADDRESS_FAMILY Family, winmdroot.NetworkManagement.IpHelper.MIB_MULTICASTIPADDRESS_TABLE** Table)
#cfunc GetMulticastIpAddressTable "GetMulticastIpAddressTable" int, var

; winmdroot.Foundation.WIN32_ERROR GetNetworkConnectivityHint(winmdroot.Networking.WinSock.NL_NETWORK_CONNECTIVITY_HINT* ConnectivityHint)
#cfunc GetNetworkConnectivityHint "GetNetworkConnectivityHint" var

; winmdroot.Foundation.WIN32_ERROR GetNetworkConnectivityHintForInterface(uint InterfaceIndex, winmdroot.Networking.WinSock.NL_NETWORK_CONNECTIVITY_HINT* ConnectivityHint)
#cfunc GetNetworkConnectivityHintForInterface "GetNetworkConnectivityHintForInterface" int, var

; winmdroot.Foundation.WIN32_ERROR GetNetworkInformation(global::System.Guid* NetworkGuid, uint* CompartmentId, uint* SiteId, winmdroot.Foundation.PWSTR NetworkName, uint Length)
#cfunc GetNetworkInformation "GetNetworkInformation" var, var, var, wstr, int

; winmdroot.Foundation.WIN32_ERROR GetNetworkParams([Optional] winmdroot.NetworkManagement.IpHelper.FIXED_INFO_W2KSP1* pFixedInfo, uint* pOutBufLen)
#cfunc GetNetworkParams "GetNetworkParams" var, var

; uint GetNumberOfInterfaces(uint* pdwNumIf)
#cfunc GetNumberOfInterfaces "GetNumberOfInterfaces" var

; uint GetOwnerModuleFromPidAndInfo(uint ulPid, ulong* pInfo, winmdroot.NetworkManagement.IpHelper.TCPIP_OWNER_MODULE_INFO_CLASS Class, void* pBuffer, uint* pdwSize)
#cfunc GetOwnerModuleFromPidAndInfo "GetOwnerModuleFromPidAndInfo" int, var, int, intptr, var

; uint GetOwnerModuleFromTcp6Entry(winmdroot.NetworkManagement.IpHelper.MIB_TCP6ROW_OWNER_MODULE* pTcpEntry, winmdroot.NetworkManagement.IpHelper.TCPIP_OWNER_MODULE_INFO_CLASS Class, void* pBuffer, uint* pdwSize)
#cfunc GetOwnerModuleFromTcp6Entry "GetOwnerModuleFromTcp6Entry" var, int, intptr, var

; uint GetOwnerModuleFromTcpEntry(winmdroot.NetworkManagement.IpHelper.MIB_TCPROW_OWNER_MODULE* pTcpEntry, winmdroot.NetworkManagement.IpHelper.TCPIP_OWNER_MODULE_INFO_CLASS Class, void* pBuffer, uint* pdwSize)
#cfunc GetOwnerModuleFromTcpEntry "GetOwnerModuleFromTcpEntry" var, int, intptr, var

; uint GetOwnerModuleFromUdp6Entry(winmdroot.NetworkManagement.IpHelper.MIB_UDP6ROW_OWNER_MODULE* pUdpEntry, winmdroot.NetworkManagement.IpHelper.TCPIP_OWNER_MODULE_INFO_CLASS Class, void* pBuffer, uint* pdwSize)
#cfunc GetOwnerModuleFromUdp6Entry "GetOwnerModuleFromUdp6Entry" var, int, intptr, var

; uint GetOwnerModuleFromUdpEntry(winmdroot.NetworkManagement.IpHelper.MIB_UDPROW_OWNER_MODULE* pUdpEntry, winmdroot.NetworkManagement.IpHelper.TCPIP_OWNER_MODULE_INFO_CLASS Class, void* pBuffer, uint* pdwSize)
#cfunc GetOwnerModuleFromUdpEntry "GetOwnerModuleFromUdpEntry" var, int, intptr, var

; uint GetPerAdapterInfo(uint IfIndex, [Optional] winmdroot.NetworkManagement.IpHelper.IP_PER_ADAPTER_INFO_W2KSP1* pPerAdapterInfo, uint* pOutBufLen)
#cfunc GetPerAdapterInfo "GetPerAdapterInfo" int, var, var

; uint GetPerTcp6ConnectionEStats(winmdroot.NetworkManagement.IpHelper.MIB_TCP6ROW* Row, winmdroot.NetworkManagement.IpHelper.TCP_ESTATS_TYPE EstatsType, [Optional] byte* Rw, uint RwVersion, uint RwSize, [Optional] byte* Ros, uint RosVersion, uint RosSize, [Optional] byte* Rod, uint RodVersion, uint RodSize)
#cfunc GetPerTcp6ConnectionEStats "GetPerTcp6ConnectionEStats" var, int, var, int, int, var, int, int, var, int, int

; uint GetPerTcpConnectionEStats(winmdroot.NetworkManagement.IpHelper.MIB_TCPROW_LH* Row, winmdroot.NetworkManagement.IpHelper.TCP_ESTATS_TYPE EstatsType, [Optional] byte* Rw, uint RwVersion, uint RwSize, [Optional] byte* Ros, uint RosVersion, uint RosSize, [Optional] byte* Rod, uint RodVersion, uint RodSize)
#cfunc GetPerTcpConnectionEStats "GetPerTcpConnectionEStats" var, int, var, int, int, var, int, int, var, int, int

; winmdroot.Foundation.BOOL GetRTTAndHopCount(uint DestIpAddress, uint* HopCount, uint MaxHops, uint* RTT)
#cfunc GetRTTAndHopCount "GetRTTAndHopCount" int, var, int, var

; winmdroot.Foundation.WIN32_ERROR GetSessionCompartmentId(uint SessionId)
#cfunc GetSessionCompartmentId "GetSessionCompartmentId" int

; uint GetTcp6Table(winmdroot.NetworkManagement.IpHelper.MIB_TCP6TABLE* TcpTable, uint* SizePointer, winmdroot.Foundation.BOOL Order)
#cfunc GetTcp6Table "GetTcp6Table" var, var, int

; uint GetTcp6Table2(winmdroot.NetworkManagement.IpHelper.MIB_TCP6TABLE2* TcpTable, uint* SizePointer, winmdroot.Foundation.BOOL Order)
#cfunc GetTcp6Table2 "GetTcp6Table2" var, var, int

; uint GetTcpStatistics(winmdroot.NetworkManagement.IpHelper.MIB_TCPSTATS_LH* Statistics)
#cfunc GetTcpStatistics "GetTcpStatistics" var

; uint GetTcpStatisticsEx(winmdroot.NetworkManagement.IpHelper.MIB_TCPSTATS_LH* Statistics, uint Family)
#cfunc GetTcpStatisticsEx "GetTcpStatisticsEx" var, int

; uint GetTcpStatisticsEx2(winmdroot.NetworkManagement.IpHelper.MIB_TCPSTATS2* Statistics, uint Family)
#cfunc GetTcpStatisticsEx2 "GetTcpStatisticsEx2" var, int

; uint GetTcpTable([Optional] winmdroot.NetworkManagement.IpHelper.MIB_TCPTABLE* TcpTable, uint* SizePointer, winmdroot.Foundation.BOOL Order)
#cfunc GetTcpTable "GetTcpTable" var, var, int

; uint GetTcpTable2([Optional] winmdroot.NetworkManagement.IpHelper.MIB_TCPTABLE2* TcpTable, uint* SizePointer, winmdroot.Foundation.BOOL Order)
#cfunc GetTcpTable2 "GetTcpTable2" var, var, int

; winmdroot.Foundation.WIN32_ERROR GetTeredoPort(ushort* Port)
#cfunc GetTeredoPort "GetTeredoPort" var

; uint GetUdp6Table([Optional] winmdroot.NetworkManagement.IpHelper.MIB_UDP6TABLE* Udp6Table, uint* SizePointer, winmdroot.Foundation.BOOL Order)
#cfunc GetUdp6Table "GetUdp6Table" var, var, int

; uint GetUdpStatistics(winmdroot.NetworkManagement.IpHelper.MIB_UDPSTATS* Stats)
#cfunc GetUdpStatistics "GetUdpStatistics" var

; uint GetUdpStatisticsEx(winmdroot.NetworkManagement.IpHelper.MIB_UDPSTATS* Statistics, uint Family)
#cfunc GetUdpStatisticsEx "GetUdpStatisticsEx" var, int

; uint GetUdpStatisticsEx2(winmdroot.NetworkManagement.IpHelper.MIB_UDPSTATS2* Statistics, uint Family)
#cfunc GetUdpStatisticsEx2 "GetUdpStatisticsEx2" var, int

; uint GetUdpTable([Optional] winmdroot.NetworkManagement.IpHelper.MIB_UDPTABLE* UdpTable, uint* SizePointer, winmdroot.Foundation.BOOL Order)
#cfunc GetUdpTable "GetUdpTable" var, var, int

; uint GetUniDirectionalAdapterInfo([Optional] winmdroot.NetworkManagement.IpHelper.IP_UNIDIRECTIONAL_ADAPTER_ADDRESS* pIPIfInfo, uint* dwOutBufLen)
#cfunc GetUniDirectionalAdapterInfo "GetUniDirectionalAdapterInfo" var, var

; winmdroot.Foundation.WIN32_ERROR GetUnicastIpAddressEntry(winmdroot.NetworkManagement.IpHelper.MIB_UNICASTIPADDRESS_ROW* Row)
#cfunc GetUnicastIpAddressEntry "GetUnicastIpAddressEntry" var

; winmdroot.Foundation.WIN32_ERROR GetUnicastIpAddressTable(winmdroot.Networking.WinSock.ADDRESS_FAMILY Family, winmdroot.NetworkManagement.IpHelper.MIB_UNICASTIPADDRESS_TABLE** Table)
#cfunc GetUnicastIpAddressTable "GetUnicastIpAddressTable" int, var

; winmdroot.Foundation.HANDLE Icmp6CreateFile()
#cfunc Icmp6CreateFile "Icmp6CreateFile"

; uint Icmp6ParseReplies(void* ReplyBuffer, uint ReplySize)
#cfunc Icmp6ParseReplies "Icmp6ParseReplies" intptr, int

; uint Icmp6SendEcho2(winmdroot.Foundation.HANDLE IcmpHandle, winmdroot.Foundation.HANDLE Event, delegate *unmanaged[Stdcall]<void*,global::Windows.Win32.System.IO.IO_STATUS_BLOCK*,uint,void> ApcRoutine, [Optional] void* ApcContext, winmdroot.Networking.WinSock.SOCKADDR_IN6* SourceAddress, winmdroot.Networking.WinSock.SOCKADDR_IN6* DestinationAddress, void* RequestData, ushort RequestSize, [Optional] winmdroot.NetworkManagement.IpHelper.IP_OPTION_INFORMATION* RequestOptions, void* ReplyBuffer, uint ReplySize, uint Timeout)
#cfunc Icmp6SendEcho2 "Icmp6SendEcho2" intptr, intptr, int, intptr, var, var, intptr, int, var, intptr, int, int

; winmdroot.Foundation.BOOL IcmpCloseHandle(winmdroot.Foundation.HANDLE IcmpHandle)
#cfunc IcmpCloseHandle "IcmpCloseHandle" intptr

; winmdroot.Foundation.HANDLE IcmpCreateFile()
#cfunc IcmpCreateFile "IcmpCreateFile"

; uint IcmpParseReplies(void* ReplyBuffer, uint ReplySize)
#cfunc IcmpParseReplies "IcmpParseReplies" intptr, int

; uint IcmpSendEcho(winmdroot.Foundation.HANDLE IcmpHandle, uint DestinationAddress, void* RequestData, ushort RequestSize, [Optional] winmdroot.NetworkManagement.IpHelper.IP_OPTION_INFORMATION* RequestOptions, void* ReplyBuffer, uint ReplySize, uint Timeout)
#cfunc IcmpSendEcho "IcmpSendEcho" intptr, int, intptr, int, var, intptr, int, int

; uint IcmpSendEcho2(winmdroot.Foundation.HANDLE IcmpHandle, winmdroot.Foundation.HANDLE Event, delegate *unmanaged[Stdcall]<void*,global::Windows.Win32.System.IO.IO_STATUS_BLOCK*,uint,void> ApcRoutine, [Optional] void* ApcContext, uint DestinationAddress, void* RequestData, ushort RequestSize, [Optional] winmdroot.NetworkManagement.IpHelper.IP_OPTION_INFORMATION* RequestOptions, void* ReplyBuffer, uint ReplySize, uint Timeout)
#cfunc IcmpSendEcho2 "IcmpSendEcho2" intptr, intptr, int, intptr, int, intptr, int, var, intptr, int, int

; uint IcmpSendEcho2Ex(winmdroot.Foundation.HANDLE IcmpHandle, winmdroot.Foundation.HANDLE Event, delegate *unmanaged[Stdcall]<void*,global::Windows.Win32.System.IO.IO_STATUS_BLOCK*,uint,void> ApcRoutine, [Optional] void* ApcContext, uint SourceAddress, uint DestinationAddress, void* RequestData, ushort RequestSize, [Optional] winmdroot.NetworkManagement.IpHelper.IP_OPTION_INFORMATION* RequestOptions, void* ReplyBuffer, uint ReplySize, uint Timeout)
#cfunc IcmpSendEcho2Ex "IcmpSendEcho2Ex" intptr, intptr, int, intptr, int, int, intptr, int, var, intptr, int, int

; void InitializeIpForwardEntry(winmdroot.NetworkManagement.IpHelper.MIB_IPFORWARD_ROW2* Row)
#func InitializeIpForwardEntry "InitializeIpForwardEntry" var

; void InitializeIpInterfaceEntry(winmdroot.NetworkManagement.IpHelper.MIB_IPINTERFACE_ROW* Row)
#func InitializeIpInterfaceEntry "InitializeIpInterfaceEntry" var

; void InitializeUnicastIpAddressEntry(winmdroot.NetworkManagement.IpHelper.MIB_UNICASTIPADDRESS_ROW* Row)
#func InitializeUnicastIpAddressEntry "InitializeUnicastIpAddressEntry" var

; uint IpReleaseAddress(winmdroot.NetworkManagement.IpHelper.IP_ADAPTER_INDEX_MAP* AdapterInfo)
#cfunc IpReleaseAddress "IpReleaseAddress" var

; uint IpRenewAddress(winmdroot.NetworkManagement.IpHelper.IP_ADAPTER_INDEX_MAP* AdapterInfo)
#cfunc IpRenewAddress "IpRenewAddress" var

; uint LookupPersistentTcpPortReservation(ushort StartPort, ushort NumberOfPorts, ulong* Token)
#cfunc LookupPersistentTcpPortReservation "LookupPersistentTcpPortReservation" int, int, var

; uint LookupPersistentUdpPortReservation(ushort StartPort, ushort NumberOfPorts, ulong* Token)
#cfunc LookupPersistentUdpPortReservation "LookupPersistentUdpPortReservation" int, int, var

; uint NhpAllocateAndGetInterfaceInfoFromStack(winmdroot.NetworkManagement.IpHelper.IP_INTERFACE_NAME_INFO_W2KSP1** ppTable, uint* pdwCount, winmdroot.Foundation.BOOL bOrder, winmdroot.Foundation.HANDLE hHeap, uint dwFlags)
#cfunc NhpAllocateAndGetInterfaceInfoFromStack "NhpAllocateAndGetInterfaceInfoFromStack" var, var, int, intptr, int

; uint NotifyAddrChange(winmdroot.Foundation.HANDLE* Handle, global::System.Threading.NativeOverlapped* overlapped)
#cfunc NotifyAddrChange "NotifyAddrChange" intptr, var

; uint NotifyIfTimestampConfigChange([Optional] void* CallerContext, delegate *unmanaged[Stdcall]<void*,void> Callback, winmdroot.NetworkManagement.IpHelper.HIFTIMESTAMPCHANGE* NotificationHandle)
#cfunc NotifyIfTimestampConfigChange "NotifyIfTimestampConfigChange" intptr, int, intptr

; winmdroot.Foundation.WIN32_ERROR NotifyIpInterfaceChange(winmdroot.Networking.WinSock.ADDRESS_FAMILY Family, delegate *unmanaged[Stdcall]<void*,global::Windows.Win32.NetworkManagement.IpHelper.MIB_IPINTERFACE_ROW*,global::Windows.Win32.NetworkManagement.IpHelper.MIB_NOTIFICATION_TYPE,void> Callback, [Optional] void* CallerContext, winmdroot.Foundation.BOOLEAN InitialNotification, winmdroot.Foundation.HANDLE* NotificationHandle)
#cfunc NotifyIpInterfaceChange "NotifyIpInterfaceChange" int, int, intptr, int, intptr

; winmdroot.Foundation.WIN32_ERROR NotifyNetworkConnectivityHintChange(delegate *unmanaged[Stdcall]<void*,global::Windows.Win32.Networking.WinSock.NL_NETWORK_CONNECTIVITY_HINT,void> Callback, [Optional] void* CallerContext, winmdroot.Foundation.BOOLEAN InitialNotification, winmdroot.Foundation.HANDLE* NotificationHandle)
#cfunc NotifyNetworkConnectivityHintChange "NotifyNetworkConnectivityHintChange" int, intptr, int, intptr

; uint NotifyRouteChange(winmdroot.Foundation.HANDLE* Handle, global::System.Threading.NativeOverlapped* overlapped)
#cfunc NotifyRouteChange "NotifyRouteChange" intptr, var

; winmdroot.Foundation.WIN32_ERROR NotifyRouteChange2(winmdroot.Networking.WinSock.ADDRESS_FAMILY AddressFamily, delegate *unmanaged[Stdcall]<void*,global::Windows.Win32.NetworkManagement.IpHelper.MIB_IPFORWARD_ROW2*,global::Windows.Win32.NetworkManagement.IpHelper.MIB_NOTIFICATION_TYPE,void> Callback, void* CallerContext, winmdroot.Foundation.BOOLEAN InitialNotification, winmdroot.Foundation.HANDLE* NotificationHandle)
#cfunc NotifyRouteChange2 "NotifyRouteChange2" int, int, intptr, int, intptr

; winmdroot.Foundation.WIN32_ERROR NotifyStableUnicastIpAddressTable(winmdroot.Networking.WinSock.ADDRESS_FAMILY Family, winmdroot.NetworkManagement.IpHelper.MIB_UNICASTIPADDRESS_TABLE** Table, delegate *unmanaged[Stdcall]<void*,global::Windows.Win32.NetworkManagement.IpHelper.MIB_UNICASTIPADDRESS_TABLE*,void> CallerCallback, void* CallerContext, winmdroot.Foundation.HANDLE* NotificationHandle)
#cfunc NotifyStableUnicastIpAddressTable "NotifyStableUnicastIpAddressTable" int, var, int, intptr, intptr

; winmdroot.Foundation.WIN32_ERROR NotifyTeredoPortChange(delegate *unmanaged[Stdcall]<void*,ushort,global::Windows.Win32.NetworkManagement.IpHelper.MIB_NOTIFICATION_TYPE,void> Callback, void* CallerContext, winmdroot.Foundation.BOOLEAN InitialNotification, winmdroot.Foundation.HANDLE* NotificationHandle)
#cfunc NotifyTeredoPortChange "NotifyTeredoPortChange" int, intptr, int, intptr

; winmdroot.Foundation.WIN32_ERROR NotifyUnicastIpAddressChange(winmdroot.Networking.WinSock.ADDRESS_FAMILY Family, delegate *unmanaged[Stdcall]<void*,global::Windows.Win32.NetworkManagement.IpHelper.MIB_UNICASTIPADDRESS_ROW*,global::Windows.Win32.NetworkManagement.IpHelper.MIB_NOTIFICATION_TYPE,void> Callback, [Optional] void* CallerContext, winmdroot.Foundation.BOOLEAN InitialNotification, winmdroot.Foundation.HANDLE* NotificationHandle)
#cfunc NotifyUnicastIpAddressChange "NotifyUnicastIpAddressChange" int, int, intptr, int, intptr

; uint ParseNetworkString(winmdroot.Foundation.PCWSTR NetworkString, uint Types, [Optional] winmdroot.NetworkManagement.IpHelper.NET_ADDRESS_INFO* AddressInfo, [Optional] ushort* PortNumber, [Optional] byte* PrefixLength)
#cfunc ParseNetworkString "ParseNetworkString" wstr, int, var, var, var

; uint PfAddFiltersToInterface(void* ih, uint cInFilters, winmdroot.NetworkManagement.IpHelper.PF_FILTER_DESCRIPTOR* pfiltIn, uint cOutFilters, winmdroot.NetworkManagement.IpHelper.PF_FILTER_DESCRIPTOR* pfiltOut, void** pfHandle)
#cfunc PfAddFiltersToInterface "PfAddFiltersToInterface" intptr, int, var, int, var, var

; uint PfAddGlobalFilterToInterface(void* pInterface, winmdroot.NetworkManagement.IpHelper.GLOBAL_FILTER gfFilter)
#cfunc PfAddGlobalFilterToInterface "PfAddGlobalFilterToInterface" intptr, int

; uint PfBindInterfaceToIPAddress(void* pInterface, winmdroot.NetworkManagement.IpHelper.PFADDRESSTYPE pfatType, byte* IPAddress)
#cfunc PfBindInterfaceToIPAddress "PfBindInterfaceToIPAddress" intptr, int, var

; uint PfBindInterfaceToIndex(void* pInterface, uint dwIndex, winmdroot.NetworkManagement.IpHelper.PFADDRESSTYPE pfatLinkType, byte* LinkIPAddress)
#cfunc PfBindInterfaceToIndex "PfBindInterfaceToIndex" intptr, int, int, var

; uint PfCreateInterface(uint dwName, winmdroot.NetworkManagement.IpHelper.PFFORWARD_ACTION inAction, winmdroot.NetworkManagement.IpHelper.PFFORWARD_ACTION outAction, winmdroot.Foundation.BOOL bUseLog, winmdroot.Foundation.BOOL bMustBeUnique, void** ppInterface)
#cfunc PfCreateInterface "PfCreateInterface" int, int, int, int, int, var

; uint PfDeleteInterface(void* pInterface)
#cfunc PfDeleteInterface "PfDeleteInterface" intptr

; uint PfDeleteLog()
#cfunc PfDeleteLog "PfDeleteLog"

; uint PfGetInterfaceStatistics(void* pInterface, winmdroot.NetworkManagement.IpHelper.PF_INTERFACE_STATS* ppfStats, uint* pdwBufferSize, winmdroot.Foundation.BOOL fResetCounters)
#cfunc PfGetInterfaceStatistics "PfGetInterfaceStatistics" intptr, var, var, int

; uint PfMakeLog(winmdroot.Foundation.HANDLE hEvent)
#cfunc PfMakeLog "PfMakeLog" intptr

; uint PfRebindFilters(void* pInterface, winmdroot.NetworkManagement.IpHelper.PF_LATEBIND_INFO* pLateBindInfo)
#cfunc PfRebindFilters "PfRebindFilters" intptr, var

; uint PfRemoveFilterHandles(void* pInterface, uint cFilters, void** pvHandles)
#cfunc PfRemoveFilterHandles "PfRemoveFilterHandles" intptr, int, var

; uint PfRemoveFiltersFromInterface(void* ih, uint cInFilters, winmdroot.NetworkManagement.IpHelper.PF_FILTER_DESCRIPTOR* pfiltIn, uint cOutFilters, winmdroot.NetworkManagement.IpHelper.PF_FILTER_DESCRIPTOR* pfiltOut)
#cfunc PfRemoveFiltersFromInterface "PfRemoveFiltersFromInterface" intptr, int, var, int, var

; uint PfRemoveGlobalFilterFromInterface(void* pInterface, winmdroot.NetworkManagement.IpHelper.GLOBAL_FILTER gfFilter)
#cfunc PfRemoveGlobalFilterFromInterface "PfRemoveGlobalFilterFromInterface" intptr, int

; uint PfSetLogBuffer(byte* pbBuffer, uint dwSize, uint dwThreshold, uint dwEntries, uint* pdwLoggedEntries, uint* pdwLostEntries, uint* pdwSizeUsed)
#cfunc PfSetLogBuffer "PfSetLogBuffer" var, int, int, int, var, var, var

; uint PfTestPacket(void* pInInterface, void* pOutInterface, uint cBytes, byte* pbPacket, winmdroot.NetworkManagement.IpHelper.PFFORWARD_ACTION* ppAction)
#cfunc PfTestPacket "PfTestPacket" intptr, intptr, int, var, var

; uint PfUnBindInterface(void* pInterface)
#cfunc PfUnBindInterface "PfUnBindInterface" intptr

; winmdroot.Foundation.WIN32_ERROR ResolveIpNetEntry2(winmdroot.NetworkManagement.IpHelper.MIB_IPNET_ROW2* Row, [Optional] winmdroot.Networking.WinSock.SOCKADDR_INET* SourceAddress)
#cfunc ResolveIpNetEntry2 "ResolveIpNetEntry2" var, var

; uint ResolveNeighbor(winmdroot.Networking.WinSock.SOCKADDR* NetworkAddress, void* PhysicalAddress, uint* PhysicalAddressLength)
#cfunc ResolveNeighbor "ResolveNeighbor" var, intptr, var

; uint RestoreMediaSense(global::System.Threading.NativeOverlapped* pOverlapped, [Optional] uint* lpdwEnableCount)
#cfunc RestoreMediaSense "RestoreMediaSense" var, var

; uint SendARP(uint DestIP, uint SrcIP, void* pMacAddr, uint* PhyAddrLen)
#cfunc SendARP "SendARP" int, int, intptr, var

; winmdroot.Foundation.WIN32_ERROR SetCurrentThreadCompartmentId(uint CompartmentId)
#cfunc SetCurrentThreadCompartmentId "SetCurrentThreadCompartmentId" int

; winmdroot.Foundation.WIN32_ERROR SetCurrentThreadCompartmentScope(uint CompartmentScope)
#cfunc SetCurrentThreadCompartmentScope "SetCurrentThreadCompartmentScope" int

; winmdroot.Foundation.WIN32_ERROR SetDnsSettings(winmdroot.NetworkManagement.IpHelper.DNS_SETTINGS* Settings)
#cfunc SetDnsSettings "SetDnsSettings" var

; uint SetIfEntry(winmdroot.NetworkManagement.IpHelper.MIB_IFROW* pIfRow)
#cfunc SetIfEntry "SetIfEntry" var

; winmdroot.Foundation.WIN32_ERROR SetInterfaceDnsSettings(global::System.Guid Interface, winmdroot.NetworkManagement.IpHelper.DNS_INTERFACE_SETTINGS* Settings)
#cfunc SetInterfaceDnsSettings "SetInterfaceDnsSettings" int, var

; uint SetIpForwardEntry(winmdroot.NetworkManagement.IpHelper.MIB_IPFORWARDROW* pRoute)
#cfunc SetIpForwardEntry "SetIpForwardEntry" var

; winmdroot.Foundation.WIN32_ERROR SetIpForwardEntry2(winmdroot.NetworkManagement.IpHelper.MIB_IPFORWARD_ROW2* Route)
#cfunc SetIpForwardEntry2 "SetIpForwardEntry2" var

; winmdroot.Foundation.WIN32_ERROR SetIpInterfaceEntry(winmdroot.NetworkManagement.IpHelper.MIB_IPINTERFACE_ROW* Row)
#cfunc SetIpInterfaceEntry "SetIpInterfaceEntry" var

; uint SetIpNetEntry(winmdroot.NetworkManagement.IpHelper.MIB_IPNETROW_LH* pArpEntry)
#cfunc SetIpNetEntry "SetIpNetEntry" var

; winmdroot.Foundation.WIN32_ERROR SetIpNetEntry2(winmdroot.NetworkManagement.IpHelper.MIB_IPNET_ROW2* Row)
#cfunc SetIpNetEntry2 "SetIpNetEntry2" var

; uint SetIpStatistics(winmdroot.NetworkManagement.IpHelper.MIB_IPSTATS_LH* pIpStats)
#cfunc SetIpStatistics "SetIpStatistics" var

; uint SetIpStatisticsEx(winmdroot.NetworkManagement.IpHelper.MIB_IPSTATS_LH* Statistics, uint Family)
#cfunc SetIpStatisticsEx "SetIpStatisticsEx" var, int

; uint SetIpTTL(uint nTTL)
#cfunc SetIpTTL "SetIpTTL" int

; winmdroot.Foundation.WIN32_ERROR SetJobCompartmentId(winmdroot.Foundation.HANDLE JobHandle, uint CompartmentId)
#cfunc SetJobCompartmentId "SetJobCompartmentId" intptr, int

; winmdroot.Foundation.WIN32_ERROR SetNetworkInformation(global::System.Guid* NetworkGuid, uint CompartmentId, winmdroot.Foundation.PCWSTR NetworkName)
#cfunc SetNetworkInformation "SetNetworkInformation" var, int, wstr

; uint SetPerTcp6ConnectionEStats(winmdroot.NetworkManagement.IpHelper.MIB_TCP6ROW* Row, winmdroot.NetworkManagement.IpHelper.TCP_ESTATS_TYPE EstatsType, byte* Rw, uint RwVersion, uint RwSize, uint Offset)
#cfunc SetPerTcp6ConnectionEStats "SetPerTcp6ConnectionEStats" var, int, var, int, int, int

; uint SetPerTcpConnectionEStats(winmdroot.NetworkManagement.IpHelper.MIB_TCPROW_LH* Row, winmdroot.NetworkManagement.IpHelper.TCP_ESTATS_TYPE EstatsType, byte* Rw, uint RwVersion, uint RwSize, uint Offset)
#cfunc SetPerTcpConnectionEStats "SetPerTcpConnectionEStats" var, int, var, int, int, int

; winmdroot.Foundation.WIN32_ERROR SetSessionCompartmentId(uint SessionId, uint CompartmentId)
#cfunc SetSessionCompartmentId "SetSessionCompartmentId" int, int

; uint SetTcpEntry(winmdroot.NetworkManagement.IpHelper.MIB_TCPROW_LH* pTcpRow)
#cfunc SetTcpEntry "SetTcpEntry" var

; winmdroot.Foundation.WIN32_ERROR SetUnicastIpAddressEntry(winmdroot.NetworkManagement.IpHelper.MIB_UNICASTIPADDRESS_ROW* Row)
#cfunc SetUnicastIpAddressEntry "SetUnicastIpAddressEntry" var

; uint UnenableRouter(global::System.Threading.NativeOverlapped* pOverlapped, [Optional] uint* lpdwEnableCount)
#cfunc UnenableRouter "UnenableRouter" var, var

#endif
