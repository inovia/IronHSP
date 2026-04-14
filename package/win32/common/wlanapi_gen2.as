; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    wlanapi.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __wlanapi_gen2_as__
#define __wlanapi_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "wlanapi.dll"
; uint WFDCancelOpenSession(winmdroot.Foundation.HANDLE hSessionHandle)
#cfunc WFDCancelOpenSession "WFDCancelOpenSession" intptr

; uint WFDCloseHandle(winmdroot.Foundation.HANDLE hClientHandle)
#cfunc WFDCloseHandle "WFDCloseHandle" intptr

; uint WFDCloseSession(winmdroot.Foundation.HANDLE hSessionHandle)
#cfunc WFDCloseSession "WFDCloseSession" intptr

; uint WFDOpenHandle(uint dwClientVersion, uint* pdwNegotiatedVersion, winmdroot.Foundation.HANDLE* phClientHandle)
#cfunc WFDOpenHandle "WFDOpenHandle" int, var, intptr

; uint WFDOpenLegacySession(winmdroot.Foundation.HANDLE hClientHandle, byte** pLegacyMacAddress, winmdroot.Foundation.HANDLE* phSessionHandle, global::System.Guid* pGuidSessionInterface)
#cfunc WFDOpenLegacySession "WFDOpenLegacySession" intptr, var, intptr, var

; uint WFDStartOpenSession(winmdroot.Foundation.HANDLE hClientHandle, byte** pDeviceAddress, [Optional] void* pvContext, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HANDLE,void*,global::System.Guid,uint,uint,void> pfnCallback, winmdroot.Foundation.HANDLE* phSessionHandle)
#cfunc WFDStartOpenSession "WFDStartOpenSession" intptr, var, intptr, int, intptr

; uint WFDUpdateDeviceVisibility(byte** pDeviceAddress)
#cfunc WFDUpdateDeviceVisibility "WFDUpdateDeviceVisibility" var

; void* WlanAllocateMemory(uint dwMemorySize)
#cfunc WlanAllocateMemory "WlanAllocateMemory" int

; uint WlanCloseHandle(winmdroot.Foundation.HANDLE hClientHandle, [Optional] void* pReserved)
#cfunc WlanCloseHandle "WlanCloseHandle" intptr, intptr

; uint WlanConnect(winmdroot.Foundation.HANDLE hClientHandle, global::System.Guid* pInterfaceGuid, winmdroot.NetworkManagement.WiFi.WLAN_CONNECTION_PARAMETERS* pConnectionParameters, [Optional] void* pReserved)
#cfunc WlanConnect "WlanConnect" intptr, var, var, intptr

; uint WlanDeleteProfile(winmdroot.Foundation.HANDLE hClientHandle, global::System.Guid* pInterfaceGuid, winmdroot.Foundation.PCWSTR strProfileName, [Optional] void* pReserved)
#cfunc WlanDeleteProfile "WlanDeleteProfile" intptr, var, wstr, intptr

; uint WlanDeviceServiceCommand(winmdroot.Foundation.HANDLE hClientHandle, global::System.Guid* pInterfaceGuid, global::System.Guid* pDeviceServiceGuid, uint dwOpCode, uint dwInBufferSize, [Optional] void* pInBuffer, uint dwOutBufferSize, [Optional] void* pOutBuffer, uint* pdwBytesReturned)
#cfunc WlanDeviceServiceCommand "WlanDeviceServiceCommand" intptr, var, var, int, int, intptr, int, intptr, var

; uint WlanDisconnect(winmdroot.Foundation.HANDLE hClientHandle, global::System.Guid* pInterfaceGuid, [Optional] void* pReserved)
#cfunc WlanDisconnect "WlanDisconnect" intptr, var, intptr

; uint WlanEnumInterfaces(winmdroot.Foundation.HANDLE hClientHandle, [Optional] void* pReserved, winmdroot.NetworkManagement.WiFi.WLAN_INTERFACE_INFO_LIST** ppInterfaceList)
#cfunc WlanEnumInterfaces "WlanEnumInterfaces" intptr, intptr, var

; uint WlanExtractPsdIEDataList(winmdroot.Foundation.HANDLE hClientHandle, uint dwIeDataSize, byte* pRawIeData, winmdroot.Foundation.PCWSTR strFormat, [Optional] void* pReserved, winmdroot.NetworkManagement.WiFi.WLAN_RAW_DATA_LIST** ppPsdIEDataList)
#cfunc WlanExtractPsdIEDataList "WlanExtractPsdIEDataList" intptr, int, var, wstr, intptr, var

; void WlanFreeMemory(void* pMemory)
#func WlanFreeMemory "WlanFreeMemory" intptr

; uint WlanGetAvailableNetworkList(winmdroot.Foundation.HANDLE hClientHandle, global::System.Guid* pInterfaceGuid, uint dwFlags, [Optional] void* pReserved, winmdroot.NetworkManagement.WiFi.WLAN_AVAILABLE_NETWORK_LIST** ppAvailableNetworkList)
#cfunc WlanGetAvailableNetworkList "WlanGetAvailableNetworkList" intptr, var, int, intptr, var

; uint WlanGetAvailableNetworkList2(winmdroot.Foundation.HANDLE hClientHandle, global::System.Guid* pInterfaceGuid, uint dwFlags, [Optional] void* pReserved, winmdroot.NetworkManagement.WiFi.WLAN_AVAILABLE_NETWORK_LIST_V2** ppAvailableNetworkList)
#cfunc WlanGetAvailableNetworkList2 "WlanGetAvailableNetworkList2" intptr, var, int, intptr, var

; uint WlanGetFilterList(winmdroot.Foundation.HANDLE hClientHandle, winmdroot.NetworkManagement.WiFi.WLAN_FILTER_LIST_TYPE wlanFilterListType, [Optional] void* pReserved, winmdroot.NetworkManagement.WiFi.DOT11_NETWORK_LIST** ppNetworkList)
#cfunc WlanGetFilterList "WlanGetFilterList" intptr, int, intptr, var

; uint WlanGetInterfaceCapability(winmdroot.Foundation.HANDLE hClientHandle, global::System.Guid* pInterfaceGuid, [Optional] void* pReserved, winmdroot.NetworkManagement.WiFi.WLAN_INTERFACE_CAPABILITY** ppCapability)
#cfunc WlanGetInterfaceCapability "WlanGetInterfaceCapability" intptr, var, intptr, var

; uint WlanGetNetworkBssList(winmdroot.Foundation.HANDLE hClientHandle, global::System.Guid* pInterfaceGuid, [Optional] winmdroot.NetworkManagement.WiFi.DOT11_SSID* pDot11Ssid, winmdroot.NetworkManagement.WiFi.DOT11_BSS_TYPE dot11BssType, winmdroot.Foundation.BOOL bSecurityEnabled, [Optional] void* pReserved, winmdroot.NetworkManagement.WiFi.WLAN_BSS_LIST** ppWlanBssList)
#cfunc WlanGetNetworkBssList "WlanGetNetworkBssList" intptr, var, var, int, int, intptr, var

; uint WlanGetProfile(winmdroot.Foundation.HANDLE hClientHandle, global::System.Guid* pInterfaceGuid, winmdroot.Foundation.PCWSTR strProfileName, [Optional] void* pReserved, winmdroot.Foundation.PWSTR* pstrProfileXml, [Optional] uint* pdwFlags, [Optional] uint* pdwGrantedAccess)
#cfunc WlanGetProfile "WlanGetProfile" intptr, var, wstr, intptr, var, var, var

; uint WlanGetProfileCustomUserData(winmdroot.Foundation.HANDLE hClientHandle, global::System.Guid* pInterfaceGuid, winmdroot.Foundation.PCWSTR strProfileName, [Optional] void* pReserved, uint* pdwDataSize, byte** ppData)
#cfunc WlanGetProfileCustomUserData "WlanGetProfileCustomUserData" intptr, var, wstr, intptr, var, var

; uint WlanGetProfileList(winmdroot.Foundation.HANDLE hClientHandle, global::System.Guid* pInterfaceGuid, [Optional] void* pReserved, winmdroot.NetworkManagement.WiFi.WLAN_PROFILE_INFO_LIST** ppProfileList)
#cfunc WlanGetProfileList "WlanGetProfileList" intptr, var, intptr, var

; uint WlanGetSecuritySettings(winmdroot.Foundation.HANDLE hClientHandle, winmdroot.NetworkManagement.WiFi.WLAN_SECURABLE_OBJECT SecurableObject, [Optional] winmdroot.NetworkManagement.WiFi.WLAN_OPCODE_VALUE_TYPE* pValueType, winmdroot.Foundation.PWSTR* pstrCurrentSDDL, uint* pdwGrantedAccess)
#cfunc WlanGetSecuritySettings "WlanGetSecuritySettings" intptr, int, var, var, var

; uint WlanGetSupportedDeviceServices(winmdroot.Foundation.HANDLE hClientHandle, global::System.Guid* pInterfaceGuid, winmdroot.NetworkManagement.WiFi.WLAN_DEVICE_SERVICE_GUID_LIST** ppDevSvcGuidList)
#cfunc WlanGetSupportedDeviceServices "WlanGetSupportedDeviceServices" intptr, var, var

; uint WlanHostedNetworkForceStart(winmdroot.Foundation.HANDLE hClientHandle, [Optional] winmdroot.NetworkManagement.WiFi.WLAN_HOSTED_NETWORK_REASON* pFailReason, [Optional] void* pvReserved)
#cfunc WlanHostedNetworkForceStart "WlanHostedNetworkForceStart" intptr, var, intptr

; uint WlanHostedNetworkForceStop(winmdroot.Foundation.HANDLE hClientHandle, [Optional] winmdroot.NetworkManagement.WiFi.WLAN_HOSTED_NETWORK_REASON* pFailReason, [Optional] void* pvReserved)
#cfunc WlanHostedNetworkForceStop "WlanHostedNetworkForceStop" intptr, var, intptr

; uint WlanHostedNetworkInitSettings(winmdroot.Foundation.HANDLE hClientHandle, [Optional] winmdroot.NetworkManagement.WiFi.WLAN_HOSTED_NETWORK_REASON* pFailReason, [Optional] void* pvReserved)
#cfunc WlanHostedNetworkInitSettings "WlanHostedNetworkInitSettings" intptr, var, intptr

; uint WlanHostedNetworkQueryProperty(winmdroot.Foundation.HANDLE hClientHandle, winmdroot.NetworkManagement.WiFi.WLAN_HOSTED_NETWORK_OPCODE OpCode, uint* pdwDataSize, void** ppvData, winmdroot.NetworkManagement.WiFi.WLAN_OPCODE_VALUE_TYPE* pWlanOpcodeValueType, [Optional] void* pvReserved)
#cfunc WlanHostedNetworkQueryProperty "WlanHostedNetworkQueryProperty" intptr, int, var, var, var, intptr

; uint WlanHostedNetworkQuerySecondaryKey(winmdroot.Foundation.HANDLE hClientHandle, uint* pdwKeyLength, byte** ppucKeyData, winmdroot.Foundation.BOOL* pbIsPassPhrase, winmdroot.Foundation.BOOL* pbPersistent, [Optional] winmdroot.NetworkManagement.WiFi.WLAN_HOSTED_NETWORK_REASON* pFailReason, [Optional] void* pvReserved)
#cfunc WlanHostedNetworkQuerySecondaryKey "WlanHostedNetworkQuerySecondaryKey" intptr, var, var, var, var, var, intptr

; uint WlanHostedNetworkQueryStatus(winmdroot.Foundation.HANDLE hClientHandle, winmdroot.NetworkManagement.WiFi.WLAN_HOSTED_NETWORK_STATUS** ppWlanHostedNetworkStatus, [Optional] void* pvReserved)
#cfunc WlanHostedNetworkQueryStatus "WlanHostedNetworkQueryStatus" intptr, var, intptr

; uint WlanHostedNetworkRefreshSecuritySettings(winmdroot.Foundation.HANDLE hClientHandle, [Optional] winmdroot.NetworkManagement.WiFi.WLAN_HOSTED_NETWORK_REASON* pFailReason, [Optional] void* pvReserved)
#cfunc WlanHostedNetworkRefreshSecuritySettings "WlanHostedNetworkRefreshSecuritySettings" intptr, var, intptr

; uint WlanHostedNetworkSetProperty(winmdroot.Foundation.HANDLE hClientHandle, winmdroot.NetworkManagement.WiFi.WLAN_HOSTED_NETWORK_OPCODE OpCode, uint dwDataSize, void* pvData, [Optional] winmdroot.NetworkManagement.WiFi.WLAN_HOSTED_NETWORK_REASON* pFailReason, [Optional] void* pvReserved)
#cfunc WlanHostedNetworkSetProperty "WlanHostedNetworkSetProperty" intptr, int, int, intptr, var, intptr

; uint WlanHostedNetworkSetSecondaryKey(winmdroot.Foundation.HANDLE hClientHandle, uint dwKeyLength, byte* pucKeyData, winmdroot.Foundation.BOOL bIsPassPhrase, winmdroot.Foundation.BOOL bPersistent, [Optional] winmdroot.NetworkManagement.WiFi.WLAN_HOSTED_NETWORK_REASON* pFailReason, [Optional] void* pvReserved)
#cfunc WlanHostedNetworkSetSecondaryKey "WlanHostedNetworkSetSecondaryKey" intptr, int, var, int, int, var, intptr

; uint WlanHostedNetworkStartUsing(winmdroot.Foundation.HANDLE hClientHandle, [Optional] winmdroot.NetworkManagement.WiFi.WLAN_HOSTED_NETWORK_REASON* pFailReason, [Optional] void* pvReserved)
#cfunc WlanHostedNetworkStartUsing "WlanHostedNetworkStartUsing" intptr, var, intptr

; uint WlanHostedNetworkStopUsing(winmdroot.Foundation.HANDLE hClientHandle, [Optional] winmdroot.NetworkManagement.WiFi.WLAN_HOSTED_NETWORK_REASON* pFailReason, [Optional] void* pvReserved)
#cfunc WlanHostedNetworkStopUsing "WlanHostedNetworkStopUsing" intptr, var, intptr

; uint WlanIhvControl(winmdroot.Foundation.HANDLE hClientHandle, global::System.Guid* pInterfaceGuid, winmdroot.NetworkManagement.WiFi.WLAN_IHV_CONTROL_TYPE Type, uint dwInBufferSize, void* pInBuffer, uint dwOutBufferSize, [Optional] void* pOutBuffer, uint* pdwBytesReturned)
#cfunc WlanIhvControl "WlanIhvControl" intptr, var, int, int, intptr, int, intptr, var

; uint WlanOpenHandle(uint dwClientVersion, [Optional] void* pReserved, uint* pdwNegotiatedVersion, winmdroot.Foundation.HANDLE* phClientHandle)
#cfunc WlanOpenHandle "WlanOpenHandle" int, intptr, var, intptr

; uint WlanQueryAutoConfigParameter(winmdroot.Foundation.HANDLE hClientHandle, winmdroot.NetworkManagement.WiFi.WLAN_AUTOCONF_OPCODE OpCode, [Optional] void* pReserved, uint* pdwDataSize, void** ppData, [Optional] winmdroot.NetworkManagement.WiFi.WLAN_OPCODE_VALUE_TYPE* pWlanOpcodeValueType)
#cfunc WlanQueryAutoConfigParameter "WlanQueryAutoConfigParameter" intptr, int, intptr, var, var, var

; uint WlanQueryInterface(winmdroot.Foundation.HANDLE hClientHandle, global::System.Guid* pInterfaceGuid, winmdroot.NetworkManagement.WiFi.WLAN_INTF_OPCODE OpCode, [Optional] void* pReserved, uint* pdwDataSize, void** ppData, [Optional] winmdroot.NetworkManagement.WiFi.WLAN_OPCODE_VALUE_TYPE* pWlanOpcodeValueType)
#cfunc WlanQueryInterface "WlanQueryInterface" intptr, var, int, intptr, var, var, var

; uint WlanReasonCodeToString(uint dwReasonCode, uint dwBufferSize, winmdroot.Foundation.PWSTR pStringBuffer, [Optional] void* pReserved)
#cfunc WlanReasonCodeToString "WlanReasonCodeToString" int, int, wstr, intptr

; uint WlanRegisterDeviceServiceNotification(winmdroot.Foundation.HANDLE hClientHandle, [Optional] winmdroot.NetworkManagement.WiFi.WLAN_DEVICE_SERVICE_GUID_LIST* pDevSvcGuidList)
#cfunc WlanRegisterDeviceServiceNotification "WlanRegisterDeviceServiceNotification" intptr, var

; uint WlanRegisterNotification(winmdroot.Foundation.HANDLE hClientHandle, winmdroot.NetworkManagement.WiFi.WLAN_NOTIFICATION_SOURCES dwNotifSource, winmdroot.Foundation.BOOL bIgnoreDuplicate, delegate *unmanaged[Stdcall]<winmdroot.NetworkManagement.WiFi.L2_NOTIFICATION_DATA*,void*,void> funcCallback, [Optional] void* pCallbackContext, [Optional] void* pReserved, [Optional] uint* pdwPrevNotifSource)
#cfunc WlanRegisterNotification "WlanRegisterNotification" intptr, int, int, int, intptr, intptr, var

; uint WlanRegisterVirtualStationNotification(winmdroot.Foundation.HANDLE hClientHandle, winmdroot.Foundation.BOOL bRegister, [Optional] void* pReserved)
#cfunc WlanRegisterVirtualStationNotification "WlanRegisterVirtualStationNotification" intptr, int, intptr

; uint WlanRenameProfile(winmdroot.Foundation.HANDLE hClientHandle, global::System.Guid* pInterfaceGuid, winmdroot.Foundation.PCWSTR strOldProfileName, winmdroot.Foundation.PCWSTR strNewProfileName, [Optional] void* pReserved)
#cfunc WlanRenameProfile "WlanRenameProfile" intptr, var, wstr, wstr, intptr

; uint WlanSaveTemporaryProfile(winmdroot.Foundation.HANDLE hClientHandle, global::System.Guid* pInterfaceGuid, winmdroot.Foundation.PCWSTR strProfileName, winmdroot.Foundation.PCWSTR strAllUserProfileSecurity, uint dwFlags, winmdroot.Foundation.BOOL bOverWrite, [Optional] void* pReserved)
#cfunc WlanSaveTemporaryProfile "WlanSaveTemporaryProfile" intptr, var, wstr, wstr, int, int, intptr

; uint WlanScan(winmdroot.Foundation.HANDLE hClientHandle, global::System.Guid* pInterfaceGuid, [Optional] winmdroot.NetworkManagement.WiFi.DOT11_SSID* pDot11Ssid, [Optional] winmdroot.NetworkManagement.WiFi.WLAN_RAW_DATA* pIeData, [Optional] void* pReserved)
#cfunc WlanScan "WlanScan" intptr, var, var, var, intptr

; uint WlanSetAutoConfigParameter(winmdroot.Foundation.HANDLE hClientHandle, winmdroot.NetworkManagement.WiFi.WLAN_AUTOCONF_OPCODE OpCode, uint dwDataSize, void* pData, [Optional] void* pReserved)
#cfunc WlanSetAutoConfigParameter "WlanSetAutoConfigParameter" intptr, int, int, intptr, intptr

; uint WlanSetFilterList(winmdroot.Foundation.HANDLE hClientHandle, winmdroot.NetworkManagement.WiFi.WLAN_FILTER_LIST_TYPE wlanFilterListType, [Optional] winmdroot.NetworkManagement.WiFi.DOT11_NETWORK_LIST* pNetworkList, [Optional] void* pReserved)
#cfunc WlanSetFilterList "WlanSetFilterList" intptr, int, var, intptr

; uint WlanSetInterface(winmdroot.Foundation.HANDLE hClientHandle, global::System.Guid* pInterfaceGuid, winmdroot.NetworkManagement.WiFi.WLAN_INTF_OPCODE OpCode, uint dwDataSize, void* pData, [Optional] void* pReserved)
#cfunc WlanSetInterface "WlanSetInterface" intptr, var, int, int, intptr, intptr

; uint WlanSetProfile(winmdroot.Foundation.HANDLE hClientHandle, global::System.Guid* pInterfaceGuid, uint dwFlags, winmdroot.Foundation.PCWSTR strProfileXml, winmdroot.Foundation.PCWSTR strAllUserProfileSecurity, winmdroot.Foundation.BOOL bOverwrite, [Optional] void* pReserved, uint* pdwReasonCode)
#cfunc WlanSetProfile "WlanSetProfile" intptr, var, int, wstr, wstr, int, intptr, var

; uint WlanSetProfileCustomUserData(winmdroot.Foundation.HANDLE hClientHandle, global::System.Guid* pInterfaceGuid, winmdroot.Foundation.PCWSTR strProfileName, uint dwDataSize, byte* pData, [Optional] void* pReserved)
#cfunc WlanSetProfileCustomUserData "WlanSetProfileCustomUserData" intptr, var, wstr, int, var, intptr

; uint WlanSetProfileEapUserData(winmdroot.Foundation.HANDLE hClientHandle, global::System.Guid* pInterfaceGuid, winmdroot.Foundation.PCWSTR strProfileName, winmdroot.Security.ExtensibleAuthenticationProtocol.EAP_METHOD_TYPE eapType, winmdroot.NetworkManagement.WiFi.WLAN_SET_EAPHOST_FLAGS dwFlags, uint dwEapUserDataSize, [Optional] byte* pbEapUserData, [Optional] void* pReserved)
#cfunc WlanSetProfileEapUserData "WlanSetProfileEapUserData" intptr, var, wstr, var, int, int, var, intptr

; uint WlanSetProfileEapXmlUserData(winmdroot.Foundation.HANDLE hClientHandle, global::System.Guid* pInterfaceGuid, winmdroot.Foundation.PCWSTR strProfileName, winmdroot.NetworkManagement.WiFi.WLAN_SET_EAPHOST_FLAGS dwFlags, winmdroot.Foundation.PCWSTR strEapXmlUserData, [Optional] void* pReserved)
#cfunc WlanSetProfileEapXmlUserData "WlanSetProfileEapXmlUserData" intptr, var, wstr, int, wstr, intptr

; uint WlanSetProfileList(winmdroot.Foundation.HANDLE hClientHandle, global::System.Guid* pInterfaceGuid, uint dwItems, winmdroot.Foundation.PCWSTR* strProfileNames, [Optional] void* pReserved)
#cfunc WlanSetProfileList "WlanSetProfileList" intptr, var, int, var, intptr

; uint WlanSetProfilePosition(winmdroot.Foundation.HANDLE hClientHandle, global::System.Guid* pInterfaceGuid, winmdroot.Foundation.PCWSTR strProfileName, uint dwPosition, [Optional] void* pReserved)
#cfunc WlanSetProfilePosition "WlanSetProfilePosition" intptr, var, wstr, int, intptr

; uint WlanSetPsdIEDataList(winmdroot.Foundation.HANDLE hClientHandle, winmdroot.Foundation.PCWSTR strFormat, [Optional] winmdroot.NetworkManagement.WiFi.WLAN_RAW_DATA_LIST* pPsdIEDataList, [Optional] void* pReserved)
#cfunc WlanSetPsdIEDataList "WlanSetPsdIEDataList" intptr, wstr, var, intptr

; uint WlanSetSecuritySettings(winmdroot.Foundation.HANDLE hClientHandle, winmdroot.NetworkManagement.WiFi.WLAN_SECURABLE_OBJECT SecurableObject, winmdroot.Foundation.PCWSTR strModifiedSDDL)
#cfunc WlanSetSecuritySettings "WlanSetSecuritySettings" intptr, int, wstr

#endif
