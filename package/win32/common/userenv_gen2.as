; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    userenv.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __userenv_gen2_as__
#define __userenv_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "userenv.dll"
; winmdroot.Foundation.HRESULT CreateAppContainerProfile(winmdroot.Foundation.PCWSTR pszAppContainerName, winmdroot.Foundation.PCWSTR pszDisplayName, winmdroot.Foundation.PCWSTR pszDescription, [Optional] winmdroot.Security.SID_AND_ATTRIBUTES* pCapabilities, uint dwCapabilityCount, winmdroot.Security.PSID* ppSidAppContainerSid)
#cfunc CreateAppContainerProfile "CreateAppContainerProfile" wstr, wstr, wstr, var, int, var

; winmdroot.Foundation.BOOL CreateEnvironmentBlock(void** lpEnvironment, winmdroot.Foundation.HANDLE hToken, winmdroot.Foundation.BOOL bInherit)
#cfunc CreateEnvironmentBlock "CreateEnvironmentBlock" var, intptr, int

; winmdroot.Foundation.HRESULT CreateProfile(winmdroot.Foundation.PCWSTR pszUserSid, winmdroot.Foundation.PCWSTR pszUserName, winmdroot.Foundation.PWSTR pszProfilePath, uint cchProfilePath)
#cfunc CreateProfile "CreateProfile" wstr, wstr, wstr, int

; winmdroot.Foundation.HRESULT DeleteAppContainerProfile(winmdroot.Foundation.PCWSTR pszAppContainerName)
#cfunc DeleteAppContainerProfile "DeleteAppContainerProfile" wstr

; winmdroot.Foundation.BOOL DeleteProfile(winmdroot.Foundation.PCWSTR lpSidString, winmdroot.Foundation.PCWSTR lpProfilePath, winmdroot.Foundation.PCWSTR lpComputerName)
#cfunc DeleteProfileW "DeleteProfileW" wstr, wstr, wstr

; winmdroot.Foundation.HRESULT DeriveAppContainerSidFromAppContainerName(winmdroot.Foundation.PCWSTR pszAppContainerName, winmdroot.Security.PSID* ppsidAppContainerSid)
#cfunc DeriveAppContainerSidFromAppContainerName "DeriveAppContainerSidFromAppContainerName" wstr, var

; winmdroot.Foundation.HRESULT DeriveRestrictedAppContainerSidFromAppContainerSidAndRestrictedName(winmdroot.Security.PSID psidAppContainerSid, winmdroot.Foundation.PCWSTR pszRestrictedAppContainerName, winmdroot.Security.PSID* ppsidRestrictedAppContainerSid)
#cfunc DeriveRestrictedAppContainerSidFromAppContainerSidAndRestrictedName "DeriveRestrictedAppContainerSidFromAppContainerSidAndRestrictedName" int, wstr, var

; winmdroot.Foundation.BOOL DestroyEnvironmentBlock(void* lpEnvironment)
#cfunc DestroyEnvironmentBlock "DestroyEnvironmentBlock" intptr

; winmdroot.Foundation.HANDLE EnterCriticalPolicySection(winmdroot.Foundation.BOOL bMachine)
#cfunc EnterCriticalPolicySection "EnterCriticalPolicySection" int

; winmdroot.Foundation.BOOL ExpandEnvironmentStringsForUser(winmdroot.Foundation.HANDLE hToken, winmdroot.Foundation.PCWSTR lpSrc, winmdroot.Foundation.PWSTR lpDest, uint dwSize)
#cfunc ExpandEnvironmentStringsForUserW "ExpandEnvironmentStringsForUserW" intptr, wstr, wstr, int

; winmdroot.Foundation.BOOL FreeGPOList(winmdroot.System.GroupPolicy.GROUP_POLICY_OBJECTW* pGPOList)
#cfunc FreeGPOListW "FreeGPOListW" var

; uint GenerateGPNotification(winmdroot.Foundation.BOOL bMachine, winmdroot.Foundation.PCWSTR lpwszMgmtProduct, uint dwMgmtProductOptions)
#cfunc GenerateGPNotification "GenerateGPNotification" int, wstr, int

; winmdroot.Foundation.BOOL GetAllUsersProfileDirectory(winmdroot.Foundation.PWSTR lpProfileDir, uint* lpcchSize)
#cfunc GetAllUsersProfileDirectoryW "GetAllUsersProfileDirectoryW" wstr, var

; winmdroot.Foundation.HRESULT GetAppContainerFolderPath(winmdroot.Foundation.PCWSTR pszAppContainerSid, winmdroot.Foundation.PWSTR* ppszPath)
#cfunc GetAppContainerFolderPath "GetAppContainerFolderPath" wstr, var

; winmdroot.Foundation.HRESULT GetAppContainerRegistryLocation(uint desiredAccess, winmdroot.System.Registry.HKEY* phAppContainerKey)
#cfunc GetAppContainerRegistryLocation "GetAppContainerRegistryLocation" int, intptr

; uint GetAppliedGPOListW(uint dwFlags, winmdroot.Foundation.PCWSTR pMachineName, winmdroot.Security.PSID pSidUser, global::System.Guid* pGuidExtension, winmdroot.System.GroupPolicy.GROUP_POLICY_OBJECTW** ppGPOList)
#cfunc GetAppliedGPOListW "GetAppliedGPOListW" int, wstr, int, var, var

; winmdroot.Foundation.BOOL GetDefaultUserProfileDirectory(winmdroot.Foundation.PWSTR lpProfileDir, uint* lpcchSize)
#cfunc GetDefaultUserProfileDirectoryW "GetDefaultUserProfileDirectoryW" wstr, var

; winmdroot.Foundation.BOOL GetGPOList(winmdroot.Foundation.HANDLE hToken, winmdroot.Foundation.PCWSTR lpName, winmdroot.Foundation.PCWSTR lpHostName, winmdroot.Foundation.PCWSTR lpComputerName, uint dwFlags, winmdroot.System.GroupPolicy.GROUP_POLICY_OBJECTW** pGPOList)
#cfunc GetGPOListW "GetGPOListW" intptr, wstr, wstr, wstr, int, var

; winmdroot.Foundation.BOOL GetProfileType(uint* dwFlags)
#cfunc GetProfileType "GetProfileType" var

; winmdroot.Foundation.BOOL GetProfilesDirectory(winmdroot.Foundation.PWSTR lpProfileDir, uint* lpcchSize)
#cfunc GetProfilesDirectoryW "GetProfilesDirectoryW" wstr, var

; winmdroot.Foundation.BOOL GetUserProfileDirectory(winmdroot.Foundation.HANDLE hToken, winmdroot.Foundation.PWSTR lpProfileDir, uint* lpcchSize)
#cfunc GetUserProfileDirectoryW "GetUserProfileDirectoryW" intptr, wstr, var

; winmdroot.Foundation.BOOL LeaveCriticalPolicySection(winmdroot.Foundation.HANDLE hSection)
#cfunc LeaveCriticalPolicySection "LeaveCriticalPolicySection" intptr

; winmdroot.Foundation.BOOL LoadUserProfile(winmdroot.Foundation.HANDLE hToken, winmdroot.UI.Shell.PROFILEINFOW* lpProfileInfo)
#cfunc LoadUserProfileW "LoadUserProfileW" intptr, var

; uint ProcessGroupPolicyCompleted(global::System.Guid* extensionId, nuint pAsyncHandle, uint dwStatus)
#cfunc ProcessGroupPolicyCompleted "ProcessGroupPolicyCompleted" var, int, int

; uint ProcessGroupPolicyCompletedEx(global::System.Guid* extensionId, nuint pAsyncHandle, uint dwStatus, winmdroot.Foundation.HRESULT RsopStatus)
#cfunc ProcessGroupPolicyCompletedEx "ProcessGroupPolicyCompletedEx" var, int, int, intptr

; winmdroot.Foundation.BOOL RefreshPolicy(winmdroot.Foundation.BOOL bMachine)
#cfunc RefreshPolicy "RefreshPolicy" int

; winmdroot.Foundation.BOOL RefreshPolicyEx(winmdroot.Foundation.BOOL bMachine, uint dwOptions)
#cfunc RefreshPolicyEx "RefreshPolicyEx" int, int

; winmdroot.Foundation.BOOL RegisterGPNotification(winmdroot.Foundation.HANDLE hEvent, winmdroot.Foundation.BOOL bMachine)
#cfunc RegisterGPNotification "RegisterGPNotification" intptr, int

; winmdroot.Foundation.HRESULT RsopAccessCheckByType(winmdroot.Security.PSECURITY_DESCRIPTOR pSecurityDescriptor, winmdroot.Security.PSID pPrincipalSelfSid, void* pRsopToken, uint dwDesiredAccessMask, [Optional] winmdroot.Security.OBJECT_TYPE_LIST* pObjectTypeList, uint ObjectTypeListLength, winmdroot.Security.GENERIC_MAPPING* pGenericMapping, [Optional] winmdroot.Security.PRIVILEGE_SET* pPrivilegeSet, [Optional] uint* pdwPrivilegeSetLength, uint* pdwGrantedAccessMask, winmdroot.Foundation.BOOL* pbAccessStatus)
#cfunc RsopAccessCheckByType "RsopAccessCheckByType" int, int, intptr, int, var, int, var, var, var, var, var

; winmdroot.Foundation.HRESULT RsopFileAccessCheck(winmdroot.Foundation.PWSTR pszFileName, void* pRsopToken, uint dwDesiredAccessMask, uint* pdwGrantedAccessMask, winmdroot.Foundation.BOOL* pbAccessStatus)
#cfunc RsopFileAccessCheck "RsopFileAccessCheck" wstr, intptr, int, var, var

; winmdroot.Foundation.HRESULT RsopResetPolicySettingStatus(uint dwFlags, winmdroot.System.Wmi.IWbemServices* pServices, winmdroot.System.Wmi.IWbemClassObject* pSettingInstance)
#cfunc RsopResetPolicySettingStatus "RsopResetPolicySettingStatus" int, var, var

; winmdroot.Foundation.HRESULT RsopSetPolicySettingStatus(uint dwFlags, winmdroot.System.Wmi.IWbemServices* pServices, winmdroot.System.Wmi.IWbemClassObject* pSettingInstance, uint nInfo, winmdroot.System.GroupPolicy.POLICYSETTINGSTATUSINFO* pStatus)
#cfunc RsopSetPolicySettingStatus "RsopSetPolicySettingStatus" int, var, var, int, var

; winmdroot.Foundation.BOOL UnloadUserProfile(winmdroot.Foundation.HANDLE hToken, winmdroot.Foundation.HANDLE hProfile)
#cfunc UnloadUserProfile "UnloadUserProfile" intptr, intptr

; winmdroot.Foundation.BOOL UnregisterGPNotification(winmdroot.Foundation.HANDLE hEvent)
#cfunc UnregisterGPNotification "UnregisterGPNotification" intptr

#endif
