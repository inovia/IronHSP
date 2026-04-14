; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    advapi32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __advapi32_gen2_as__
#define global __advapi32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "advapi32.dll"
; void* FreeSid(winmdroot.Security.PSID pSid)
#cfunc global FreeSid "FreeSid" int

; winmdroot.Foundation.BOOL CreateProcessAsUser(winmdroot.Foundation.HANDLE hToken, winmdroot.Foundation.PCWSTR lpApplicationName, winmdroot.Foundation.PWSTR lpCommandLine, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpProcessAttributes, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpThreadAttributes, winmdroot.Foundation.BOOL bInheritHandles, winmdroot.System.Threading.PROCESS_CREATION_FLAGS dwCreationFlags, [Optional] void* lpEnvironment, winmdroot.Foundation.PCWSTR lpCurrentDirectory, winmdroot.System.Threading.STARTUPINFOW* lpStartupInfo, winmdroot.System.Threading.PROCESS_INFORMATION* lpProcessInformation)
#cfunc global CreateProcessAsUserW "CreateProcessAsUserW" intptr, wstr, wstr, var, var, int, int, intptr, wstr, var, var

; winmdroot.Foundation.WIN32_ERROR RegCloseKey(winmdroot.System.Registry.HKEY hKey)
#cfunc global RegCloseKey "RegCloseKey" intptr

; winmdroot.Foundation.WIN32_ERROR RegCopyTreeW(winmdroot.System.Registry.HKEY hKeySrc, winmdroot.Foundation.PCWSTR lpSubKey, winmdroot.System.Registry.HKEY hKeyDest)
#cfunc global RegCopyTreeW "RegCopyTreeW" intptr, wstr, intptr

; winmdroot.Foundation.WIN32_ERROR RegCreateKeyExW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpSubKey, uint Reserved, winmdroot.Foundation.PWSTR lpClass, winmdroot.System.Registry.REG_OPEN_CREATE_OPTIONS dwOptions, winmdroot.System.Registry.REG_SAM_FLAGS samDesired, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes, winmdroot.System.Registry.HKEY* phkResult, [Optional] winmdroot.System.Registry.REG_CREATE_KEY_DISPOSITION* lpdwDisposition)
#cfunc global RegCreateKeyExW "RegCreateKeyExW" intptr, wstr, int, wstr, int, int, var, intptr, var

; winmdroot.Foundation.WIN32_ERROR RegDeleteKeyExW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpSubKey, uint samDesired, uint Reserved)
#cfunc global RegDeleteKeyExW "RegDeleteKeyExW" intptr, wstr, int, int

; winmdroot.Foundation.WIN32_ERROR RegDeleteTreeW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpSubKey)
#cfunc global RegDeleteTreeW "RegDeleteTreeW" intptr, wstr

; winmdroot.Foundation.WIN32_ERROR RegDeleteValueW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpValueName)
#cfunc global RegDeleteValueW "RegDeleteValueW" intptr, wstr

; winmdroot.Foundation.WIN32_ERROR RegDisablePredefinedCacheEx()
#cfunc global RegDisablePredefinedCacheEx "RegDisablePredefinedCacheEx"

; winmdroot.Foundation.WIN32_ERROR RegEnumKeyExW(winmdroot.System.Registry.HKEY hKey, uint dwIndex, winmdroot.Foundation.PWSTR lpName, uint* lpcchName, [Optional] uint* lpReserved, winmdroot.Foundation.PWSTR lpClass, [Optional] uint* lpcchClass, [Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* lpftLastWriteTime)
#cfunc global RegEnumKeyExW "RegEnumKeyExW" intptr, int, wstr, var, var, wstr, var, var

; winmdroot.Foundation.WIN32_ERROR RegEnumValueW(winmdroot.System.Registry.HKEY hKey, uint dwIndex, winmdroot.Foundation.PWSTR lpValueName, uint* lpcchValueName, [Optional] uint* lpReserved, [Optional] uint* lpType, [Optional] byte* lpData, [Optional] uint* lpcbData)
#cfunc global RegEnumValueW "RegEnumValueW" intptr, int, wstr, var, var, var, var, var

; winmdroot.Foundation.WIN32_ERROR RegFlushKey(winmdroot.System.Registry.HKEY hKey)
#cfunc global RegFlushKey "RegFlushKey" intptr

; winmdroot.Foundation.WIN32_ERROR RegGetKeySecurity(winmdroot.System.Registry.HKEY hKey, winmdroot.Security.OBJECT_SECURITY_INFORMATION SecurityInformation, winmdroot.Security.PSECURITY_DESCRIPTOR pSecurityDescriptor, uint* lpcbSecurityDescriptor)
#cfunc global RegGetKeySecurity "RegGetKeySecurity" intptr, int, int, var

; winmdroot.Foundation.WIN32_ERROR RegGetValueW(winmdroot.System.Registry.HKEY hkey, winmdroot.Foundation.PCWSTR lpSubKey, winmdroot.Foundation.PCWSTR lpValue, winmdroot.System.Registry.REG_ROUTINE_FLAGS dwFlags, [Optional] winmdroot.System.Registry.REG_VALUE_TYPE* pdwType, [Optional] void* pvData, [Optional] uint* pcbData)
#cfunc global RegGetValueW "RegGetValueW" intptr, wstr, wstr, int, var, intptr, var

; winmdroot.Foundation.WIN32_ERROR RegLoadKeyW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpSubKey, winmdroot.Foundation.PCWSTR lpFile)
#cfunc global RegLoadKeyW "RegLoadKeyW" intptr, wstr, wstr

; winmdroot.Foundation.WIN32_ERROR RegLoadMUIStringW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR pszValue, winmdroot.Foundation.PWSTR pszOutBuf, uint cbOutBuf, [Optional] uint* pcbData, uint Flags, winmdroot.Foundation.PCWSTR pszDirectory)
#cfunc global RegLoadMUIStringW "RegLoadMUIStringW" intptr, wstr, wstr, int, var, int, wstr

; winmdroot.Foundation.WIN32_ERROR RegNotifyChangeKeyValue(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.BOOL bWatchSubtree, winmdroot.System.Registry.REG_NOTIFY_FILTER dwNotifyFilter, winmdroot.Foundation.HANDLE hEvent, winmdroot.Foundation.BOOL fAsynchronous)
#cfunc global RegNotifyChangeKeyValue "RegNotifyChangeKeyValue" intptr, int, int, intptr, int

; winmdroot.Foundation.WIN32_ERROR RegOpenCurrentUser(uint samDesired, winmdroot.System.Registry.HKEY* phkResult)
#cfunc global RegOpenCurrentUser "RegOpenCurrentUser" int, intptr

; winmdroot.Foundation.WIN32_ERROR RegOpenKeyExW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpSubKey, uint ulOptions, winmdroot.System.Registry.REG_SAM_FLAGS samDesired, winmdroot.System.Registry.HKEY* phkResult)
#cfunc global RegOpenKeyExW "RegOpenKeyExW" intptr, wstr, int, int, intptr

; winmdroot.Foundation.WIN32_ERROR RegOpenUserClassesRoot(winmdroot.Foundation.HANDLE hToken, uint dwOptions, uint samDesired, winmdroot.System.Registry.HKEY* phkResult)
#cfunc global RegOpenUserClassesRoot "RegOpenUserClassesRoot" intptr, int, int, intptr

; winmdroot.Foundation.WIN32_ERROR RegQueryInfoKeyW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PWSTR lpClass, [Optional] uint* lpcchClass, [Optional] uint* lpReserved, [Optional] uint* lpcSubKeys, [Optional] uint* lpcbMaxSubKeyLen, [Optional] uint* lpcbMaxClassLen, [Optional] uint* lpcValues, [Optional] uint* lpcbMaxValueNameLen, [Optional] uint* lpcbMaxValueLen, [Optional] uint* lpcbSecurityDescriptor, [Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* lpftLastWriteTime)
#cfunc global RegQueryInfoKeyW "RegQueryInfoKeyW" intptr, wstr, var, var, var, var, var, var, var, var, var, var

; winmdroot.Foundation.WIN32_ERROR RegQueryValueExW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpValueName, [Optional] uint* lpReserved, [Optional] winmdroot.System.Registry.REG_VALUE_TYPE* lpType, [Optional] byte* lpData, [Optional] uint* lpcbData)
#cfunc global RegQueryValueExW "RegQueryValueExW" intptr, wstr, var, var, var, var

; winmdroot.Foundation.WIN32_ERROR RegRestoreKey(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpFile, uint dwFlags)
#cfunc global RegRestoreKeyW "RegRestoreKeyW" intptr, wstr, int

; winmdroot.Foundation.WIN32_ERROR RegSaveKeyExW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpFile, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes, winmdroot.System.Registry.REG_SAVE_FORMAT Flags)
#cfunc global RegSaveKeyExW "RegSaveKeyExW" intptr, wstr, var, int

; winmdroot.Foundation.WIN32_ERROR RegSetKeySecurity(winmdroot.System.Registry.HKEY hKey, winmdroot.Security.OBJECT_SECURITY_INFORMATION SecurityInformation, winmdroot.Security.PSECURITY_DESCRIPTOR pSecurityDescriptor)
#cfunc global RegSetKeySecurity "RegSetKeySecurity" intptr, int, int

; winmdroot.Foundation.WIN32_ERROR RegSetValueExW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpValueName, uint Reserved, winmdroot.System.Registry.REG_VALUE_TYPE dwType, [Optional] byte* lpData, uint cbData)
#cfunc global RegSetValueExW "RegSetValueExW" intptr, wstr, int, int, var, int

; winmdroot.Foundation.WIN32_ERROR RegUnLoadKeyW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpSubKey)
#cfunc global RegUnLoadKeyW "RegUnLoadKeyW" intptr, wstr

; winmdroot.Foundation.BOOL AbortSystemShutdown(winmdroot.Foundation.PWSTR lpMachineName)
#cfunc global AbortSystemShutdownW "AbortSystemShutdownW" wstr

; winmdroot.Foundation.BOOL AccessCheck(winmdroot.Security.PSECURITY_DESCRIPTOR pSecurityDescriptor, winmdroot.Foundation.HANDLE ClientToken, uint DesiredAccess, winmdroot.Security.GENERIC_MAPPING* GenericMapping, [Optional] winmdroot.Security.PRIVILEGE_SET* PrivilegeSet, uint* PrivilegeSetLength, uint* GrantedAccess, winmdroot.Foundation.BOOL* AccessStatus)
#cfunc global AccessCheck "AccessCheck" int, intptr, int, var, var, var, var, var

; winmdroot.Foundation.BOOL AccessCheckAndAuditAlarmW(winmdroot.Foundation.PCWSTR SubsystemName, [Optional] void* HandleId, winmdroot.Foundation.PWSTR ObjectTypeName, winmdroot.Foundation.PWSTR ObjectName, winmdroot.Security.PSECURITY_DESCRIPTOR SecurityDescriptor, uint DesiredAccess, winmdroot.Security.GENERIC_MAPPING* GenericMapping, winmdroot.Foundation.BOOL ObjectCreation, uint* GrantedAccess, winmdroot.Foundation.BOOL* AccessStatus, winmdroot.Foundation.BOOL* pfGenerateOnClose)
#cfunc global AccessCheckAndAuditAlarmW "AccessCheckAndAuditAlarmW" wstr, intptr, wstr, wstr, int, int, var, int, var, var, var

; winmdroot.Foundation.BOOL AccessCheckByType(winmdroot.Security.PSECURITY_DESCRIPTOR pSecurityDescriptor, winmdroot.Security.PSID PrincipalSelfSid, winmdroot.Foundation.HANDLE ClientToken, uint DesiredAccess, [Optional] winmdroot.Security.OBJECT_TYPE_LIST* ObjectTypeList, uint ObjectTypeListLength, winmdroot.Security.GENERIC_MAPPING* GenericMapping, [Optional] winmdroot.Security.PRIVILEGE_SET* PrivilegeSet, uint* PrivilegeSetLength, uint* GrantedAccess, winmdroot.Foundation.BOOL* AccessStatus)
#cfunc global AccessCheckByType "AccessCheckByType" int, int, intptr, int, var, int, var, var, var, var, var

; winmdroot.Foundation.BOOL AccessCheckByTypeAndAuditAlarmW(winmdroot.Foundation.PCWSTR SubsystemName, void* HandleId, winmdroot.Foundation.PCWSTR ObjectTypeName, winmdroot.Foundation.PCWSTR ObjectName, winmdroot.Security.PSECURITY_DESCRIPTOR SecurityDescriptor, winmdroot.Security.PSID PrincipalSelfSid, uint DesiredAccess, winmdroot.Security.AUDIT_EVENT_TYPE AuditType, uint Flags, [Optional] winmdroot.Security.OBJECT_TYPE_LIST* ObjectTypeList, uint ObjectTypeListLength, winmdroot.Security.GENERIC_MAPPING* GenericMapping, winmdroot.Foundation.BOOL ObjectCreation, uint* GrantedAccess, winmdroot.Foundation.BOOL* AccessStatus, winmdroot.Foundation.BOOL* pfGenerateOnClose)
#cfunc global AccessCheckByTypeAndAuditAlarmW "AccessCheckByTypeAndAuditAlarmW" wstr, intptr, wstr, wstr, int, int, int, int, int, var, int, var, int, var, var, var

; winmdroot.Foundation.BOOL AccessCheckByTypeResultList(winmdroot.Security.PSECURITY_DESCRIPTOR pSecurityDescriptor, winmdroot.Security.PSID PrincipalSelfSid, winmdroot.Foundation.HANDLE ClientToken, uint DesiredAccess, [Optional] winmdroot.Security.OBJECT_TYPE_LIST* ObjectTypeList, uint ObjectTypeListLength, winmdroot.Security.GENERIC_MAPPING* GenericMapping, [Optional] winmdroot.Security.PRIVILEGE_SET* PrivilegeSet, uint* PrivilegeSetLength, uint* GrantedAccessList, uint* AccessStatusList)
#cfunc global AccessCheckByTypeResultList "AccessCheckByTypeResultList" int, int, intptr, int, var, int, var, var, var, var, var

; winmdroot.Foundation.BOOL AccessCheckByTypeResultListAndAuditAlarmW(winmdroot.Foundation.PCWSTR SubsystemName, void* HandleId, winmdroot.Foundation.PCWSTR ObjectTypeName, winmdroot.Foundation.PCWSTR ObjectName, winmdroot.Security.PSECURITY_DESCRIPTOR SecurityDescriptor, winmdroot.Security.PSID PrincipalSelfSid, uint DesiredAccess, winmdroot.Security.AUDIT_EVENT_TYPE AuditType, uint Flags, [Optional] winmdroot.Security.OBJECT_TYPE_LIST* ObjectTypeList, uint ObjectTypeListLength, winmdroot.Security.GENERIC_MAPPING* GenericMapping, winmdroot.Foundation.BOOL ObjectCreation, uint* GrantedAccessList, uint* AccessStatusList, winmdroot.Foundation.BOOL* pfGenerateOnClose)
#cfunc global AccessCheckByTypeResultListAndAuditAlarmW "AccessCheckByTypeResultListAndAuditAlarmW" wstr, intptr, wstr, wstr, int, int, int, int, int, var, int, var, int, var, var, var

; winmdroot.Foundation.BOOL AccessCheckByTypeResultListAndAuditAlarmByHandleW(winmdroot.Foundation.PCWSTR SubsystemName, void* HandleId, winmdroot.Foundation.HANDLE ClientToken, winmdroot.Foundation.PCWSTR ObjectTypeName, winmdroot.Foundation.PCWSTR ObjectName, winmdroot.Security.PSECURITY_DESCRIPTOR SecurityDescriptor, winmdroot.Security.PSID PrincipalSelfSid, uint DesiredAccess, winmdroot.Security.AUDIT_EVENT_TYPE AuditType, uint Flags, [Optional] winmdroot.Security.OBJECT_TYPE_LIST* ObjectTypeList, uint ObjectTypeListLength, winmdroot.Security.GENERIC_MAPPING* GenericMapping, winmdroot.Foundation.BOOL ObjectCreation, uint* GrantedAccessList, uint* AccessStatusList, winmdroot.Foundation.BOOL* pfGenerateOnClose)
#cfunc global AccessCheckByTypeResultListAndAuditAlarmByHandleW "AccessCheckByTypeResultListAndAuditAlarmByHandleW" wstr, intptr, intptr, wstr, wstr, int, int, int, int, int, var, int, var, int, var, var, var

; winmdroot.Foundation.BOOL AddAccessAllowedAce(winmdroot.Security.ACL* pAcl, winmdroot.Security.ACE_REVISION dwAceRevision, uint AccessMask, winmdroot.Security.PSID pSid)
#cfunc global AddAccessAllowedAce "AddAccessAllowedAce" var, int, int, int

; winmdroot.Foundation.BOOL AddAccessAllowedAceEx(winmdroot.Security.ACL* pAcl, winmdroot.Security.ACE_REVISION dwAceRevision, winmdroot.Security.ACE_FLAGS AceFlags, uint AccessMask, winmdroot.Security.PSID pSid)
#cfunc global AddAccessAllowedAceEx "AddAccessAllowedAceEx" var, int, int, int, int

; winmdroot.Foundation.BOOL AddAccessAllowedObjectAce(winmdroot.Security.ACL* pAcl, winmdroot.Security.ACE_REVISION dwAceRevision, winmdroot.Security.ACE_FLAGS AceFlags, uint AccessMask, [Optional] global::System.Guid* ObjectTypeGuid, [Optional] global::System.Guid* InheritedObjectTypeGuid, winmdroot.Security.PSID pSid)
#cfunc global AddAccessAllowedObjectAce "AddAccessAllowedObjectAce" var, int, int, int, var, var, int

; winmdroot.Foundation.BOOL AddAccessDeniedAce(winmdroot.Security.ACL* pAcl, winmdroot.Security.ACE_REVISION dwAceRevision, uint AccessMask, winmdroot.Security.PSID pSid)
#cfunc global AddAccessDeniedAce "AddAccessDeniedAce" var, int, int, int

; winmdroot.Foundation.BOOL AddAccessDeniedAceEx(winmdroot.Security.ACL* pAcl, winmdroot.Security.ACE_REVISION dwAceRevision, winmdroot.Security.ACE_FLAGS AceFlags, uint AccessMask, winmdroot.Security.PSID pSid)
#cfunc global AddAccessDeniedAceEx "AddAccessDeniedAceEx" var, int, int, int, int

; winmdroot.Foundation.BOOL AddAccessDeniedObjectAce(winmdroot.Security.ACL* pAcl, winmdroot.Security.ACE_REVISION dwAceRevision, winmdroot.Security.ACE_FLAGS AceFlags, uint AccessMask, [Optional] global::System.Guid* ObjectTypeGuid, [Optional] global::System.Guid* InheritedObjectTypeGuid, winmdroot.Security.PSID pSid)
#cfunc global AddAccessDeniedObjectAce "AddAccessDeniedObjectAce" var, int, int, int, var, var, int

; winmdroot.Foundation.BOOL AddAce(winmdroot.Security.ACL* pAcl, winmdroot.Security.ACE_REVISION dwAceRevision, uint dwStartingAceIndex, void* pAceList, uint nAceListLength)
#cfunc global AddAce "AddAce" var, int, int, intptr, int

; winmdroot.Foundation.BOOL AddAuditAccessAce(winmdroot.Security.ACL* pAcl, winmdroot.Security.ACE_REVISION dwAceRevision, uint dwAccessMask, winmdroot.Security.PSID pSid, winmdroot.Foundation.BOOL bAuditSuccess, winmdroot.Foundation.BOOL bAuditFailure)
#cfunc global AddAuditAccessAce "AddAuditAccessAce" var, int, int, int, int, int

; winmdroot.Foundation.BOOL AddAuditAccessAceEx(winmdroot.Security.ACL* pAcl, winmdroot.Security.ACE_REVISION dwAceRevision, winmdroot.Security.ACE_FLAGS AceFlags, uint dwAccessMask, winmdroot.Security.PSID pSid, winmdroot.Foundation.BOOL bAuditSuccess, winmdroot.Foundation.BOOL bAuditFailure)
#cfunc global AddAuditAccessAceEx "AddAuditAccessAceEx" var, int, int, int, int, int, int

; winmdroot.Foundation.BOOL AddAuditAccessObjectAce(winmdroot.Security.ACL* pAcl, winmdroot.Security.ACE_REVISION dwAceRevision, winmdroot.Security.ACE_FLAGS AceFlags, uint AccessMask, [Optional] global::System.Guid* ObjectTypeGuid, [Optional] global::System.Guid* InheritedObjectTypeGuid, winmdroot.Security.PSID pSid, winmdroot.Foundation.BOOL bAuditSuccess, winmdroot.Foundation.BOOL bAuditFailure)
#cfunc global AddAuditAccessObjectAce "AddAuditAccessObjectAce" var, int, int, int, var, var, int, int, int

; winmdroot.Foundation.BOOL AddConditionalAce(winmdroot.Security.ACL* pAcl, winmdroot.Security.ACE_REVISION dwAceRevision, winmdroot.Security.ACE_FLAGS AceFlags, byte AceType, uint AccessMask, winmdroot.Security.PSID pSid, winmdroot.Foundation.PWSTR ConditionStr, uint* ReturnLength)
#cfunc global AddConditionalAce "AddConditionalAce" var, int, int, int, int, int, wstr, var

; uint AddUsersToEncryptedFile(winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Storage.FileSystem.ENCRYPTION_CERTIFICATE_LIST* pEncryptionCertificates)
#cfunc global AddUsersToEncryptedFile "AddUsersToEncryptedFile" wstr, var

; winmdroot.Foundation.BOOL AdjustTokenGroups(winmdroot.Foundation.HANDLE TokenHandle, winmdroot.Foundation.BOOL ResetToDefault, [Optional] winmdroot.Security.TOKEN_GROUPS* NewState, uint BufferLength, [Optional] winmdroot.Security.TOKEN_GROUPS* PreviousState, [Optional] uint* ReturnLength)
#cfunc global AdjustTokenGroups "AdjustTokenGroups" intptr, int, var, int, var, var

; winmdroot.Foundation.BOOL AdjustTokenPrivileges(winmdroot.Foundation.HANDLE TokenHandle, winmdroot.Foundation.BOOL DisableAllPrivileges, [Optional] winmdroot.Security.TOKEN_PRIVILEGES* NewState, uint BufferLength, [Optional] winmdroot.Security.TOKEN_PRIVILEGES* PreviousState, [Optional] uint* ReturnLength)
#cfunc global AdjustTokenPrivileges "AdjustTokenPrivileges" intptr, int, var, int, var, var

; winmdroot.Foundation.BOOL AllocateAndInitializeSid(winmdroot.Security.SID_IDENTIFIER_AUTHORITY* pIdentifierAuthority, byte nSubAuthorityCount, uint nSubAuthority0, uint nSubAuthority1, uint nSubAuthority2, uint nSubAuthority3, uint nSubAuthority4, uint nSubAuthority5, uint nSubAuthority6, uint nSubAuthority7, winmdroot.Security.PSID* pSid)
#cfunc global AllocateAndInitializeSid "AllocateAndInitializeSid" var, int, int, int, int, int, int, int, int, int, var

; winmdroot.Foundation.BOOL AllocateLocallyUniqueId(winmdroot.Foundation.LUID* Luid)
#cfunc global AllocateLocallyUniqueId "AllocateLocallyUniqueId" var

; winmdroot.Foundation.BOOL AreAllAccessesGranted(uint GrantedAccess, uint DesiredAccess)
#cfunc global AreAllAccessesGranted "AreAllAccessesGranted" int, int

; winmdroot.Foundation.BOOL AreAnyAccessesGranted(uint GrantedAccess, uint DesiredAccess)
#cfunc global AreAnyAccessesGranted "AreAnyAccessesGranted" int, int

; winmdroot.Foundation.BOOLEAN AuditComputeEffectivePolicyBySid(winmdroot.Security.PSID pSid, global::System.Guid* pSubCategoryGuids, uint dwPolicyCount, winmdroot.Security.Authentication.Identity.AUDIT_POLICY_INFORMATION** ppAuditPolicy)
#cfunc global AuditComputeEffectivePolicyBySid "AuditComputeEffectivePolicyBySid" int, var, int, var

; winmdroot.Foundation.BOOLEAN AuditComputeEffectivePolicyByToken(winmdroot.Foundation.HANDLE hTokenHandle, global::System.Guid* pSubCategoryGuids, uint dwPolicyCount, winmdroot.Security.Authentication.Identity.AUDIT_POLICY_INFORMATION** ppAuditPolicy)
#cfunc global AuditComputeEffectivePolicyByToken "AuditComputeEffectivePolicyByToken" intptr, var, int, var

; winmdroot.Foundation.BOOLEAN AuditEnumerateCategories(global::System.Guid** ppAuditCategoriesArray, uint* pdwCountReturned)
#cfunc global AuditEnumerateCategories "AuditEnumerateCategories" var, var

; winmdroot.Foundation.BOOLEAN AuditEnumeratePerUserPolicy(winmdroot.Security.Authentication.Identity.POLICY_AUDIT_SID_ARRAY** ppAuditSidArray)
#cfunc global AuditEnumeratePerUserPolicy "AuditEnumeratePerUserPolicy" var

; winmdroot.Foundation.BOOLEAN AuditEnumerateSubCategories([Optional] global::System.Guid* pAuditCategoryGuid, winmdroot.Foundation.BOOLEAN bRetrieveAllSubCategories, global::System.Guid** ppAuditSubCategoriesArray, uint* pdwCountReturned)
#cfunc global AuditEnumerateSubCategories "AuditEnumerateSubCategories" var, int, var, var

; void AuditFree(void* Buffer)
#func global AuditFree "AuditFree" intptr

; winmdroot.Foundation.BOOLEAN AuditLookupCategoryGuidFromCategoryId(winmdroot.Security.Authentication.Identity.POLICY_AUDIT_EVENT_TYPE AuditCategoryId, global::System.Guid* pAuditCategoryGuid)
#cfunc global AuditLookupCategoryGuidFromCategoryId "AuditLookupCategoryGuidFromCategoryId" int, var

; winmdroot.Foundation.BOOLEAN AuditLookupCategoryIdFromCategoryGuid(global::System.Guid* pAuditCategoryGuid, winmdroot.Security.Authentication.Identity.POLICY_AUDIT_EVENT_TYPE* pAuditCategoryId)
#cfunc global AuditLookupCategoryIdFromCategoryGuid "AuditLookupCategoryIdFromCategoryGuid" var, var

; winmdroot.Foundation.BOOLEAN AuditLookupCategoryName(global::System.Guid* pAuditCategoryGuid, winmdroot.Foundation.PWSTR* ppszCategoryName)
#cfunc global AuditLookupCategoryNameW "AuditLookupCategoryNameW" var, var

; winmdroot.Foundation.BOOLEAN AuditLookupSubCategoryName(global::System.Guid* pAuditSubCategoryGuid, winmdroot.Foundation.PWSTR* ppszSubCategoryName)
#cfunc global AuditLookupSubCategoryNameW "AuditLookupSubCategoryNameW" var, var

; winmdroot.Foundation.BOOLEAN AuditQueryGlobalSacl(winmdroot.Foundation.PCWSTR ObjectTypeName, winmdroot.Security.ACL** Acl)
#cfunc global AuditQueryGlobalSaclW "AuditQueryGlobalSaclW" wstr, var

; winmdroot.Foundation.BOOLEAN AuditQueryPerUserPolicy(winmdroot.Security.PSID pSid, global::System.Guid* pSubCategoryGuids, uint dwPolicyCount, winmdroot.Security.Authentication.Identity.AUDIT_POLICY_INFORMATION** ppAuditPolicy)
#cfunc global AuditQueryPerUserPolicy "AuditQueryPerUserPolicy" int, var, int, var

; winmdroot.Foundation.BOOLEAN AuditQuerySecurity(winmdroot.Security.OBJECT_SECURITY_INFORMATION SecurityInformation, winmdroot.Security.PSECURITY_DESCRIPTOR* ppSecurityDescriptor)
#cfunc global AuditQuerySecurity "AuditQuerySecurity" int, var

; winmdroot.Foundation.BOOLEAN AuditQuerySystemPolicy(global::System.Guid* pSubCategoryGuids, uint dwPolicyCount, winmdroot.Security.Authentication.Identity.AUDIT_POLICY_INFORMATION** ppAuditPolicy)
#cfunc global AuditQuerySystemPolicy "AuditQuerySystemPolicy" var, int, var

; winmdroot.Foundation.BOOLEAN AuditSetGlobalSacl(winmdroot.Foundation.PCWSTR ObjectTypeName, [Optional] winmdroot.Security.ACL* Acl)
#cfunc global AuditSetGlobalSaclW "AuditSetGlobalSaclW" wstr, var

; winmdroot.Foundation.BOOLEAN AuditSetPerUserPolicy(winmdroot.Security.PSID pSid, winmdroot.Security.Authentication.Identity.AUDIT_POLICY_INFORMATION* pAuditPolicy, uint dwPolicyCount)
#cfunc global AuditSetPerUserPolicy "AuditSetPerUserPolicy" int, var, int

; winmdroot.Foundation.BOOLEAN AuditSetSecurity(winmdroot.Security.OBJECT_SECURITY_INFORMATION SecurityInformation, winmdroot.Security.PSECURITY_DESCRIPTOR pSecurityDescriptor)
#cfunc global AuditSetSecurity "AuditSetSecurity" int, int

; winmdroot.Foundation.BOOLEAN AuditSetSystemPolicy(winmdroot.Security.Authentication.Identity.AUDIT_POLICY_INFORMATION* pAuditPolicy, uint dwPolicyCount)
#cfunc global AuditSetSystemPolicy "AuditSetSystemPolicy" var, int

; winmdroot.Foundation.BOOL BackupEventLog(winmdroot.Foundation.HANDLE hEventLog, winmdroot.Foundation.PCWSTR lpBackupFileName)
#cfunc global BackupEventLogW "BackupEventLogW" intptr, wstr

; void BuildExplicitAccessWithNameW(winmdroot.Security.Authorization.EXPLICIT_ACCESS_W* pExplicitAccess, winmdroot.Foundation.PWSTR pTrusteeName, uint AccessPermissions, winmdroot.Security.Authorization.ACCESS_MODE AccessMode, winmdroot.Security.ACE_FLAGS Inheritance)
#func global BuildExplicitAccessWithNameW "BuildExplicitAccessWithNameW" var, wstr, int, int, int

; void BuildImpersonateExplicitAccessWithNameW(winmdroot.Security.Authorization.EXPLICIT_ACCESS_W* pExplicitAccess, winmdroot.Foundation.PWSTR pTrusteeName, [Optional] winmdroot.Security.Authorization.TRUSTEE_W* pTrustee, uint AccessPermissions, winmdroot.Security.Authorization.ACCESS_MODE AccessMode, uint Inheritance)
#func global BuildImpersonateExplicitAccessWithNameW "BuildImpersonateExplicitAccessWithNameW" var, wstr, var, int, int, int

; void BuildImpersonateTrusteeW(winmdroot.Security.Authorization.TRUSTEE_W* pTrustee, [Optional] winmdroot.Security.Authorization.TRUSTEE_W* pImpersonateTrustee)
#func global BuildImpersonateTrusteeW "BuildImpersonateTrusteeW" var, var

; winmdroot.Foundation.WIN32_ERROR BuildSecurityDescriptorW([Optional] winmdroot.Security.Authorization.TRUSTEE_W* pOwner, [Optional] winmdroot.Security.Authorization.TRUSTEE_W* pGroup, uint cCountOfAccessEntries, [Optional] winmdroot.Security.Authorization.EXPLICIT_ACCESS_W* pListOfAccessEntries, uint cCountOfAuditEntries, [Optional] winmdroot.Security.Authorization.EXPLICIT_ACCESS_W* pListOfAuditEntries, winmdroot.Security.PSECURITY_DESCRIPTOR pOldSD, uint* pSizeNewSD, winmdroot.Security.PSECURITY_DESCRIPTOR* pNewSD)
#cfunc global BuildSecurityDescriptorW "BuildSecurityDescriptorW" var, var, int, var, int, var, int, var, var

; void BuildTrusteeWithNameW(winmdroot.Security.Authorization.TRUSTEE_W* pTrustee, winmdroot.Foundation.PWSTR pName)
#func global BuildTrusteeWithNameW "BuildTrusteeWithNameW" var, wstr

; void BuildTrusteeWithObjectsAndNameW(winmdroot.Security.Authorization.TRUSTEE_W* pTrustee, [Optional] winmdroot.Security.Authorization.OBJECTS_AND_NAME_W* pObjName, winmdroot.Security.Authorization.SE_OBJECT_TYPE ObjectType, winmdroot.Foundation.PWSTR ObjectTypeName, winmdroot.Foundation.PWSTR InheritedObjectTypeName, winmdroot.Foundation.PWSTR Name)
#func global BuildTrusteeWithObjectsAndNameW "BuildTrusteeWithObjectsAndNameW" var, var, int, wstr, wstr, wstr

; void BuildTrusteeWithObjectsAndSidW(winmdroot.Security.Authorization.TRUSTEE_W* pTrustee, [Optional] winmdroot.Security.Authorization.OBJECTS_AND_SID* pObjSid, [Optional] global::System.Guid* pObjectGuid, [Optional] global::System.Guid* pInheritedObjectGuid, winmdroot.Security.PSID pSid)
#func global BuildTrusteeWithObjectsAndSidW "BuildTrusteeWithObjectsAndSidW" var, var, var, var, int

; void BuildTrusteeWithSidW(winmdroot.Security.Authorization.TRUSTEE_W* pTrustee, winmdroot.Security.PSID pSid)
#func global BuildTrusteeWithSidW "BuildTrusteeWithSidW" var, int

; winmdroot.Foundation.BOOL CloseServiceHandle(winmdroot.System.Services.SC_HANDLE hSCObject)
#cfunc global CloseServiceHandle "CloseServiceHandle" intptr

; winmdroot.Foundation.BOOL ChangeServiceConfig(winmdroot.System.Services.SC_HANDLE hService, winmdroot.System.Services.ENUM_SERVICE_TYPE dwServiceType, winmdroot.System.Services.SERVICE_START_TYPE dwStartType, winmdroot.System.Services.SERVICE_ERROR dwErrorControl, winmdroot.Foundation.PCWSTR lpBinaryPathName, winmdroot.Foundation.PCWSTR lpLoadOrderGroup, [Optional] uint* lpdwTagId, winmdroot.Foundation.PCWSTR lpDependencies, winmdroot.Foundation.PCWSTR lpServiceStartName, winmdroot.Foundation.PCWSTR lpPassword, winmdroot.Foundation.PCWSTR lpDisplayName)
#cfunc global ChangeServiceConfigW "ChangeServiceConfigW" intptr, int, int, int, wstr, wstr, var, wstr, wstr, wstr, wstr

; winmdroot.Foundation.BOOL ChangeServiceConfig2A(winmdroot.System.Services.SC_HANDLE hService, winmdroot.System.Services.SERVICE_CONFIG dwInfoLevel, [Optional] void* lpInfo)
#cfunc global ChangeServiceConfig2A "ChangeServiceConfig2A" intptr, int, intptr

; winmdroot.Foundation.BOOL ChangeServiceConfig2W(winmdroot.System.Services.SC_HANDLE hService, winmdroot.System.Services.SERVICE_CONFIG dwInfoLevel, [Optional] void* lpInfo)
#cfunc global ChangeServiceConfig2W "ChangeServiceConfig2W" intptr, int, intptr

; uint CheckForHiberboot(winmdroot.Foundation.BOOLEAN* pHiberboot, winmdroot.Foundation.BOOLEAN bClearFlag)
#cfunc global CheckForHiberboot "CheckForHiberboot" var, int

; winmdroot.Foundation.BOOL CheckTokenMembership(winmdroot.Foundation.HANDLE TokenHandle, winmdroot.Security.PSID SidToCheck, winmdroot.Foundation.BOOL* IsMember)
#cfunc global CheckTokenMembership "CheckTokenMembership" intptr, int, var

; winmdroot.Foundation.BOOL ClearEventLog(winmdroot.Foundation.HANDLE hEventLog, winmdroot.Foundation.PCWSTR lpBackupFileName)
#cfunc global ClearEventLogW "ClearEventLogW" intptr, wstr

; void CloseEncryptedFileRaw(void* pvContext)
#func global CloseEncryptedFileRaw "CloseEncryptedFileRaw" intptr

; winmdroot.Foundation.BOOL CloseEventLog(winmdroot.Foundation.HANDLE hEventLog)
#cfunc global CloseEventLog "CloseEventLog" intptr

; void CloseThreadWaitChainSession(void* WctHandle)
#func global CloseThreadWaitChainSession "CloseThreadWaitChainSession" intptr

; winmdroot.Foundation.WIN32_ERROR CloseTrace(winmdroot.System.Diagnostics.Etw.PROCESSTRACE_HANDLE TraceHandle)
#cfunc global CloseTrace "CloseTrace" int

; uint CommandLineFromMsiDescriptor(winmdroot.Foundation.PWSTR Descriptor, winmdroot.Foundation.PWSTR CommandLine, uint* CommandLineLength)
#cfunc global CommandLineFromMsiDescriptor "CommandLineFromMsiDescriptor" wstr, wstr, var

; winmdroot.Foundation.BOOL ControlService(winmdroot.System.Services.SC_HANDLE hService, uint dwControl, winmdroot.System.Services.SERVICE_STATUS* lpServiceStatus)
#cfunc global ControlService "ControlService" intptr, int, var

; winmdroot.Foundation.BOOL ControlServiceEx(winmdroot.System.Services.SC_HANDLE hService, uint dwControl, uint dwInfoLevel, void* pControlParams)
#cfunc global ControlServiceExW "ControlServiceExW" intptr, int, int, intptr

; winmdroot.Foundation.WIN32_ERROR ControlTraceW(winmdroot.System.Diagnostics.Etw.CONTROLTRACE_HANDLE TraceHandle, winmdroot.Foundation.PCWSTR InstanceName, winmdroot.System.Diagnostics.Etw.EVENT_TRACE_PROPERTIES* Properties, winmdroot.System.Diagnostics.Etw.EVENT_TRACE_CONTROL ControlCode)
#cfunc global ControlTraceW "ControlTraceW" int, wstr, var, int

; winmdroot.Foundation.BOOL ConvertSecurityDescriptorToStringSecurityDescriptor(winmdroot.Security.PSECURITY_DESCRIPTOR SecurityDescriptor, uint RequestedStringSDRevision, winmdroot.Security.OBJECT_SECURITY_INFORMATION SecurityInformation, winmdroot.Foundation.PWSTR* StringSecurityDescriptor, [Optional] uint* StringSecurityDescriptorLen)
#cfunc global ConvertSecurityDescriptorToStringSecurityDescriptorW "ConvertSecurityDescriptorToStringSecurityDescriptorW" int, int, int, var, var

; winmdroot.Foundation.BOOL ConvertSidToStringSid(winmdroot.Security.PSID Sid, winmdroot.Foundation.PWSTR* StringSid)
#cfunc global ConvertSidToStringSidW "ConvertSidToStringSidW" int, var

; winmdroot.Foundation.BOOL ConvertStringSecurityDescriptorToSecurityDescriptor(winmdroot.Foundation.PCWSTR StringSecurityDescriptor, uint StringSDRevision, winmdroot.Security.PSECURITY_DESCRIPTOR* SecurityDescriptor, [Optional] uint* SecurityDescriptorSize)
#cfunc global ConvertStringSecurityDescriptorToSecurityDescriptorW "ConvertStringSecurityDescriptorToSecurityDescriptorW" wstr, int, var, var

; winmdroot.Foundation.BOOL ConvertStringSidToSid(winmdroot.Foundation.PCWSTR StringSid, winmdroot.Security.PSID* Sid)
#cfunc global ConvertStringSidToSidW "ConvertStringSidToSidW" wstr, var

; winmdroot.Foundation.BOOL ConvertToAutoInheritPrivateObjectSecurity(winmdroot.Security.PSECURITY_DESCRIPTOR ParentDescriptor, winmdroot.Security.PSECURITY_DESCRIPTOR CurrentSecurityDescriptor, winmdroot.Security.PSECURITY_DESCRIPTOR* NewSecurityDescriptor, [Optional] global::System.Guid* ObjectType, winmdroot.Foundation.BOOLEAN IsDirectoryObject, winmdroot.Security.GENERIC_MAPPING* GenericMapping)
#cfunc global ConvertToAutoInheritPrivateObjectSecurity "ConvertToAutoInheritPrivateObjectSecurity" int, int, var, var, int, var

; winmdroot.Foundation.BOOL CopySid(uint nDestinationSidLength, winmdroot.Security.PSID pDestinationSid, winmdroot.Security.PSID pSourceSid)
#cfunc global CopySid "CopySid" int, int, int

; winmdroot.Foundation.BOOL CreatePrivateObjectSecurity(winmdroot.Security.PSECURITY_DESCRIPTOR ParentDescriptor, winmdroot.Security.PSECURITY_DESCRIPTOR CreatorDescriptor, winmdroot.Security.PSECURITY_DESCRIPTOR* NewDescriptor, winmdroot.Foundation.BOOL IsDirectoryObject, winmdroot.Foundation.HANDLE Token, winmdroot.Security.GENERIC_MAPPING* GenericMapping)
#cfunc global CreatePrivateObjectSecurity "CreatePrivateObjectSecurity" int, int, var, int, intptr, var

; winmdroot.Foundation.BOOL CreatePrivateObjectSecurityEx(winmdroot.Security.PSECURITY_DESCRIPTOR ParentDescriptor, winmdroot.Security.PSECURITY_DESCRIPTOR CreatorDescriptor, winmdroot.Security.PSECURITY_DESCRIPTOR* NewDescriptor, [Optional] global::System.Guid* ObjectType, winmdroot.Foundation.BOOL IsContainerObject, winmdroot.Security.SECURITY_AUTO_INHERIT_FLAGS AutoInheritFlags, winmdroot.Foundation.HANDLE Token, winmdroot.Security.GENERIC_MAPPING* GenericMapping)
#cfunc global CreatePrivateObjectSecurityEx "CreatePrivateObjectSecurityEx" int, int, var, var, int, int, intptr, var

; winmdroot.Foundation.BOOL CreatePrivateObjectSecurityWithMultipleInheritance(winmdroot.Security.PSECURITY_DESCRIPTOR ParentDescriptor, winmdroot.Security.PSECURITY_DESCRIPTOR CreatorDescriptor, winmdroot.Security.PSECURITY_DESCRIPTOR* NewDescriptor, [Optional] global::System.Guid** ObjectTypes, uint GuidCount, winmdroot.Foundation.BOOL IsContainerObject, winmdroot.Security.SECURITY_AUTO_INHERIT_FLAGS AutoInheritFlags, winmdroot.Foundation.HANDLE Token, winmdroot.Security.GENERIC_MAPPING* GenericMapping)
#cfunc global CreatePrivateObjectSecurityWithMultipleInheritance "CreatePrivateObjectSecurityWithMultipleInheritance" int, int, var, var, int, int, int, intptr, var

; winmdroot.Foundation.BOOL CreateProcessWithLogon(winmdroot.Foundation.PCWSTR lpUsername, winmdroot.Foundation.PCWSTR lpDomain, winmdroot.Foundation.PCWSTR lpPassword, winmdroot.System.Threading.CREATE_PROCESS_LOGON_FLAGS dwLogonFlags, winmdroot.Foundation.PCWSTR lpApplicationName, winmdroot.Foundation.PWSTR lpCommandLine, winmdroot.System.Threading.PROCESS_CREATION_FLAGS dwCreationFlags, [Optional] void* lpEnvironment, winmdroot.Foundation.PCWSTR lpCurrentDirectory, winmdroot.System.Threading.STARTUPINFOW* lpStartupInfo, winmdroot.System.Threading.PROCESS_INFORMATION* lpProcessInformation)
#cfunc global CreateProcessWithLogonW "CreateProcessWithLogonW" wstr, wstr, wstr, int, wstr, wstr, int, intptr, wstr, var, var

; winmdroot.Foundation.BOOL CreateProcessWithToken(winmdroot.Foundation.HANDLE hToken, winmdroot.System.Threading.CREATE_PROCESS_LOGON_FLAGS dwLogonFlags, winmdroot.Foundation.PCWSTR lpApplicationName, winmdroot.Foundation.PWSTR lpCommandLine, winmdroot.System.Threading.PROCESS_CREATION_FLAGS dwCreationFlags, [Optional] void* lpEnvironment, winmdroot.Foundation.PCWSTR lpCurrentDirectory, winmdroot.System.Threading.STARTUPINFOW* lpStartupInfo, winmdroot.System.Threading.PROCESS_INFORMATION* lpProcessInformation)
#cfunc global CreateProcessWithTokenW "CreateProcessWithTokenW" intptr, int, wstr, wstr, int, intptr, wstr, var, var

; winmdroot.Foundation.BOOL CreateRestrictedToken(winmdroot.Foundation.HANDLE ExistingTokenHandle, winmdroot.Security.CREATE_RESTRICTED_TOKEN_FLAGS Flags, uint DisableSidCount, [Optional] winmdroot.Security.SID_AND_ATTRIBUTES* SidsToDisable, uint DeletePrivilegeCount, [Optional] winmdroot.Security.LUID_AND_ATTRIBUTES* PrivilegesToDelete, uint RestrictedSidCount, [Optional] winmdroot.Security.SID_AND_ATTRIBUTES* SidsToRestrict, winmdroot.Foundation.HANDLE* NewTokenHandle)
#cfunc global CreateRestrictedToken "CreateRestrictedToken" intptr, int, int, var, int, var, int, var, intptr

; winmdroot.System.Services.SC_HANDLE CreateService(winmdroot.System.Services.SC_HANDLE hSCManager, winmdroot.Foundation.PCWSTR lpServiceName, winmdroot.Foundation.PCWSTR lpDisplayName, uint dwDesiredAccess, winmdroot.System.Services.ENUM_SERVICE_TYPE dwServiceType, winmdroot.System.Services.SERVICE_START_TYPE dwStartType, winmdroot.System.Services.SERVICE_ERROR dwErrorControl, winmdroot.Foundation.PCWSTR lpBinaryPathName, winmdroot.Foundation.PCWSTR lpLoadOrderGroup, [Optional] uint* lpdwTagId, winmdroot.Foundation.PCWSTR lpDependencies, winmdroot.Foundation.PCWSTR lpServiceStartName, winmdroot.Foundation.PCWSTR lpPassword)
#cfunc global CreateServiceW "CreateServiceW" intptr, wstr, wstr, int, int, int, int, wstr, wstr, var, wstr, wstr, wstr

; winmdroot.Foundation.BOOL CreateWellKnownSid(winmdroot.Security.WELL_KNOWN_SID_TYPE WellKnownSidType, winmdroot.Security.PSID DomainSid, winmdroot.Security.PSID pSid, uint* cbSid)
#cfunc global CreateWellKnownSid "CreateWellKnownSid" int, int, int, var

; winmdroot.Foundation.BOOL CredDelete(winmdroot.Foundation.PCWSTR TargetName, winmdroot.Security.Credentials.CRED_TYPE Type, uint Flags)
#cfunc global CredDeleteW "CredDeleteW" wstr, int, int

; winmdroot.Foundation.BOOL CredEnumerate(winmdroot.Foundation.PCWSTR Filter, winmdroot.Security.Credentials.CRED_ENUMERATE_FLAGS Flags, uint* Count, winmdroot.Security.Credentials.CREDENTIALW*** Credential)
#cfunc global CredEnumerateW "CredEnumerateW" wstr, int, var, var

; winmdroot.Foundation.BOOL CredFindBestCredential(winmdroot.Foundation.PCWSTR TargetName, uint Type, uint Flags, winmdroot.Security.Credentials.CREDENTIALW** Credential)
#cfunc global CredFindBestCredentialW "CredFindBestCredentialW" wstr, int, int, var

; void CredFree(void* Buffer)
#func global CredFree "CredFree" intptr

; winmdroot.Foundation.BOOL CredGetSessionTypes(uint MaximumPersistCount, uint* MaximumPersist)
#cfunc global CredGetSessionTypes "CredGetSessionTypes" int, var

; winmdroot.Foundation.BOOL CredGetTargetInfo(winmdroot.Foundation.PCWSTR TargetName, uint Flags, winmdroot.Security.Credentials.CREDENTIAL_TARGET_INFORMATIONW** TargetInfo)
#cfunc global CredGetTargetInfoW "CredGetTargetInfoW" wstr, int, var

; winmdroot.Foundation.BOOL CredIsMarshaledCredentialW(winmdroot.Foundation.PCWSTR MarshaledCredential)
#cfunc global CredIsMarshaledCredentialW "CredIsMarshaledCredentialW" wstr

; winmdroot.Foundation.BOOL CredIsProtected(winmdroot.Foundation.PWSTR pszProtectedCredentials, winmdroot.Security.Credentials.CRED_PROTECTION_TYPE* pProtectionType)
#cfunc global CredIsProtectedW "CredIsProtectedW" wstr, var

; winmdroot.Foundation.BOOL CredMarshalCredential(winmdroot.Security.Credentials.CRED_MARSHAL_TYPE CredType, void* Credential, winmdroot.Foundation.PWSTR* MarshaledCredential)
#cfunc global CredMarshalCredentialW "CredMarshalCredentialW" int, intptr, var

; winmdroot.Foundation.BOOL CredProtect(winmdroot.Foundation.BOOL fAsSelf, winmdroot.Foundation.PWSTR pszCredentials, uint cchCredentials, winmdroot.Foundation.PWSTR pszProtectedCredentials, uint* pcchMaxChars, [Optional] winmdroot.Security.Credentials.CRED_PROTECTION_TYPE* ProtectionType)
#cfunc global CredProtectW "CredProtectW" int, wstr, int, wstr, var, var

; winmdroot.Foundation.BOOL CredRead(winmdroot.Foundation.PCWSTR TargetName, winmdroot.Security.Credentials.CRED_TYPE Type, uint Flags, winmdroot.Security.Credentials.CREDENTIALW** Credential)
#cfunc global CredReadW "CredReadW" wstr, int, int, var

; winmdroot.Foundation.BOOL CredReadDomainCredentials(winmdroot.Security.Credentials.CREDENTIAL_TARGET_INFORMATIONW* TargetInfo, uint Flags, uint* Count, winmdroot.Security.Credentials.CREDENTIALW*** Credential)
#cfunc global CredReadDomainCredentialsW "CredReadDomainCredentialsW" var, int, var, var

; winmdroot.Foundation.BOOL CredRename(winmdroot.Foundation.PCWSTR OldTargetName, winmdroot.Foundation.PCWSTR NewTargetName, winmdroot.Security.Credentials.CRED_TYPE Type, uint Flags)
#cfunc global CredRenameW "CredRenameW" wstr, wstr, int, int

; winmdroot.Foundation.BOOL CredUnmarshalCredential(winmdroot.Foundation.PCWSTR MarshaledCredential, winmdroot.Security.Credentials.CRED_MARSHAL_TYPE* CredType, void** Credential)
#cfunc global CredUnmarshalCredentialW "CredUnmarshalCredentialW" wstr, var, var

; winmdroot.Foundation.BOOL CredUnprotect(winmdroot.Foundation.BOOL fAsSelf, winmdroot.Foundation.PWSTR pszProtectedCredentials, uint cchProtectedCredentials, winmdroot.Foundation.PWSTR pszCredentials, uint* pcchMaxChars)
#cfunc global CredUnprotectW "CredUnprotectW" int, wstr, int, wstr, var

; winmdroot.Foundation.BOOL CredWrite(winmdroot.Security.Credentials.CREDENTIALW* Credential, uint Flags)
#cfunc global CredWriteW "CredWriteW" var, int

; winmdroot.Foundation.BOOL CredWriteDomainCredentials(winmdroot.Security.Credentials.CREDENTIAL_TARGET_INFORMATIONW* TargetInfo, winmdroot.Security.Credentials.CREDENTIALW* Credential, uint Flags)
#cfunc global CredWriteDomainCredentialsW "CredWriteDomainCredentialsW" var, var, int

; winmdroot.Foundation.BOOL CryptAcquireContext(nuint* phProv, winmdroot.Foundation.PCWSTR szContainer, winmdroot.Foundation.PCWSTR szProvider, uint dwProvType, uint dwFlags)
#cfunc global CryptAcquireContextW "CryptAcquireContextW" var, wstr, wstr, int, int

; winmdroot.Foundation.BOOL CryptContextAddRef(nuint hProv, [Optional] uint* pdwReserved, uint dwFlags)
#cfunc global CryptContextAddRef "CryptContextAddRef" int, var, int

; winmdroot.Foundation.BOOL CryptCreateHash(nuint hProv, winmdroot.Security.Cryptography.ALG_ID Algid, nuint hKey, uint dwFlags, nuint* phHash)
#cfunc global CryptCreateHash "CryptCreateHash" int, int, int, int, var

; winmdroot.Foundation.BOOL CryptDecrypt(nuint hKey, nuint hHash, winmdroot.Foundation.BOOL Final, uint dwFlags, byte* pbData, uint* pdwDataLen)
#cfunc global CryptDecrypt "CryptDecrypt" int, int, int, int, var, var

; winmdroot.Foundation.BOOL CryptDeriveKey(nuint hProv, winmdroot.Security.Cryptography.ALG_ID Algid, nuint hBaseData, uint dwFlags, nuint* phKey)
#cfunc global CryptDeriveKey "CryptDeriveKey" int, int, int, int, var

; winmdroot.Foundation.BOOL CryptDestroyHash(nuint hHash)
#cfunc global CryptDestroyHash "CryptDestroyHash" int

; winmdroot.Foundation.BOOL CryptDestroyKey(nuint hKey)
#cfunc global CryptDestroyKey "CryptDestroyKey" int

; winmdroot.Foundation.BOOL CryptDuplicateHash(nuint hHash, [Optional] uint* pdwReserved, uint dwFlags, nuint* phHash)
#cfunc global CryptDuplicateHash "CryptDuplicateHash" int, var, int, var

; winmdroot.Foundation.BOOL CryptDuplicateKey(nuint hKey, [Optional] uint* pdwReserved, uint dwFlags, nuint* phKey)
#cfunc global CryptDuplicateKey "CryptDuplicateKey" int, var, int, var

; winmdroot.Foundation.BOOL CryptEncrypt(nuint hKey, nuint hHash, winmdroot.Foundation.BOOL Final, uint dwFlags, [Optional] byte* pbData, uint* pdwDataLen, uint dwBufLen)
#cfunc global CryptEncrypt "CryptEncrypt" int, int, int, int, var, var, int

; winmdroot.Foundation.BOOL CryptEnumProviderTypes(uint dwIndex, [Optional] uint* pdwReserved, uint dwFlags, uint* pdwProvType, winmdroot.Foundation.PWSTR szTypeName, uint* pcbTypeName)
#cfunc global CryptEnumProviderTypesW "CryptEnumProviderTypesW" int, var, int, var, wstr, var

; winmdroot.Foundation.BOOL CryptEnumProviders(uint dwIndex, [Optional] uint* pdwReserved, uint dwFlags, uint* pdwProvType, winmdroot.Foundation.PWSTR szProvName, uint* pcbProvName)
#cfunc global CryptEnumProvidersW "CryptEnumProvidersW" int, var, int, var, wstr, var

; winmdroot.Foundation.BOOL CryptExportKey(nuint hKey, nuint hExpKey, uint dwBlobType, winmdroot.Security.Cryptography.CRYPT_KEY_FLAGS dwFlags, [Optional] byte* pbData, uint* pdwDataLen)
#cfunc global CryptExportKey "CryptExportKey" int, int, int, int, var, var

; winmdroot.Foundation.BOOL CryptGenKey(nuint hProv, winmdroot.Security.Cryptography.ALG_ID Algid, winmdroot.Security.Cryptography.CRYPT_KEY_FLAGS dwFlags, nuint* phKey)
#cfunc global CryptGenKey "CryptGenKey" int, int, int, var

; winmdroot.Foundation.BOOL CryptGenRandom(nuint hProv, uint dwLen, byte* pbBuffer)
#cfunc global CryptGenRandom "CryptGenRandom" int, int, var

; winmdroot.Foundation.BOOL CryptGetDefaultProvider(uint dwProvType, [Optional] uint* pdwReserved, uint dwFlags, winmdroot.Foundation.PWSTR pszProvName, uint* pcbProvName)
#cfunc global CryptGetDefaultProviderW "CryptGetDefaultProviderW" int, var, int, wstr, var

; winmdroot.Foundation.BOOL CryptGetHashParam(nuint hHash, uint dwParam, [Optional] byte* pbData, uint* pdwDataLen, uint dwFlags)
#cfunc global CryptGetHashParam "CryptGetHashParam" int, int, var, var, int

; winmdroot.Foundation.BOOL CryptGetKeyParam(nuint hKey, winmdroot.Security.Cryptography.CRYPT_KEY_PARAM_ID dwParam, [Optional] byte* pbData, uint* pdwDataLen, uint dwFlags)
#cfunc global CryptGetKeyParam "CryptGetKeyParam" int, int, var, var, int

; winmdroot.Foundation.BOOL CryptGetProvParam(nuint hProv, uint dwParam, [Optional] byte* pbData, uint* pdwDataLen, uint dwFlags)
#cfunc global CryptGetProvParam "CryptGetProvParam" int, int, var, var, int

; winmdroot.Foundation.BOOL CryptGetUserKey(nuint hProv, uint dwKeySpec, nuint* phUserKey)
#cfunc global CryptGetUserKey "CryptGetUserKey" int, int, var

; winmdroot.Foundation.BOOL CryptHashData(nuint hHash, byte* pbData, uint dwDataLen, uint dwFlags)
#cfunc global CryptHashData "CryptHashData" int, var, int, int

; winmdroot.Foundation.BOOL CryptHashSessionKey(nuint hHash, nuint hKey, uint dwFlags)
#cfunc global CryptHashSessionKey "CryptHashSessionKey" int, int, int

; winmdroot.Foundation.BOOL CryptImportKey(nuint hProv, byte* pbData, uint dwDataLen, nuint hPubKey, winmdroot.Security.Cryptography.CRYPT_KEY_FLAGS dwFlags, nuint* phKey)
#cfunc global CryptImportKey "CryptImportKey" int, var, int, int, int, var

; winmdroot.Foundation.BOOL CryptReleaseContext(nuint hProv, uint dwFlags)
#cfunc global CryptReleaseContext "CryptReleaseContext" int, int

; winmdroot.Foundation.BOOL CryptSetHashParam(nuint hHash, winmdroot.Security.Cryptography.CRYPT_SET_HASH_PARAM dwParam, byte* pbData, uint dwFlags)
#cfunc global CryptSetHashParam "CryptSetHashParam" int, int, var, int

; winmdroot.Foundation.BOOL CryptSetKeyParam(nuint hKey, winmdroot.Security.Cryptography.CRYPT_KEY_PARAM_ID dwParam, byte* pbData, uint dwFlags)
#cfunc global CryptSetKeyParam "CryptSetKeyParam" int, int, var, int

; winmdroot.Foundation.BOOL CryptSetProvParam(nuint hProv, winmdroot.Security.Cryptography.CRYPT_SET_PROV_PARAM_ID dwParam, byte* pbData, uint dwFlags)
#cfunc global CryptSetProvParam "CryptSetProvParam" int, int, var, int

; winmdroot.Foundation.BOOL CryptSetProvider(winmdroot.Foundation.PCWSTR pszProvName, uint dwProvType)
#cfunc global CryptSetProviderW "CryptSetProviderW" wstr, int

; winmdroot.Foundation.BOOL CryptSetProviderEx(winmdroot.Foundation.PCWSTR pszProvName, uint dwProvType, [Optional] uint* pdwReserved, uint dwFlags)
#cfunc global CryptSetProviderExW "CryptSetProviderExW" wstr, int, var, int

; winmdroot.Foundation.BOOL CryptSignHash(nuint hHash, uint dwKeySpec, winmdroot.Foundation.PCWSTR szDescription, uint dwFlags, [Optional] byte* pbSignature, uint* pdwSigLen)
#cfunc global CryptSignHashW "CryptSignHashW" int, int, wstr, int, var, var

; winmdroot.Foundation.BOOL CryptVerifySignature(nuint hHash, byte* pbSignature, uint dwSigLen, nuint hPubKey, winmdroot.Foundation.PCWSTR szDescription, uint dwFlags)
#cfunc global CryptVerifySignatureW "CryptVerifySignatureW" int, var, int, int, wstr, int

; winmdroot.Foundation.BOOL DecryptFile(winmdroot.Foundation.PCWSTR lpFileName, uint dwReserved)
#cfunc global DecryptFileW "DecryptFileW" wstr, int

; winmdroot.Foundation.BOOL DeleteAce(winmdroot.Security.ACL* pAcl, uint dwAceIndex)
#cfunc global DeleteAce "DeleteAce" var, int

; winmdroot.Foundation.BOOL DeleteService(winmdroot.System.Services.SC_HANDLE hService)
#cfunc global DeleteService "DeleteService" intptr

; winmdroot.Foundation.BOOL DeregisterEventSource(winmdroot.Foundation.HANDLE hEventLog)
#cfunc global DeregisterEventSource "DeregisterEventSource" intptr

; winmdroot.Foundation.BOOL DestroyPrivateObjectSecurity(winmdroot.Security.PSECURITY_DESCRIPTOR* ObjectDescriptor)
#cfunc global DestroyPrivateObjectSecurity "DestroyPrivateObjectSecurity" var

; uint DuplicateEncryptionInfoFile(winmdroot.Foundation.PCWSTR SrcFileName, winmdroot.Foundation.PCWSTR DstFileName, uint dwCreationDistribution, uint dwAttributes, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes)
#cfunc global DuplicateEncryptionInfoFile "DuplicateEncryptionInfoFile" wstr, wstr, int, int, var

; winmdroot.Foundation.BOOL DuplicateToken(winmdroot.Foundation.HANDLE ExistingTokenHandle, winmdroot.Security.SECURITY_IMPERSONATION_LEVEL ImpersonationLevel, winmdroot.Foundation.HANDLE* DuplicateTokenHandle)
#cfunc global DuplicateToken "DuplicateToken" intptr, int, intptr

; winmdroot.Foundation.BOOL DuplicateTokenEx(winmdroot.Foundation.HANDLE hExistingToken, winmdroot.Security.TOKEN_ACCESS_MASK dwDesiredAccess, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpTokenAttributes, winmdroot.Security.SECURITY_IMPERSONATION_LEVEL ImpersonationLevel, winmdroot.Security.TOKEN_TYPE TokenType, winmdroot.Foundation.HANDLE* phNewToken)
#cfunc global DuplicateTokenEx "DuplicateTokenEx" intptr, int, var, int, int, intptr

; winmdroot.Foundation.WIN32_ERROR EnableTrace(uint Enable, uint EnableFlag, uint EnableLevel, global::System.Guid* ControlGuid, winmdroot.System.Diagnostics.Etw.CONTROLTRACE_HANDLE TraceHandle)
#cfunc global EnableTrace "EnableTrace" int, int, int, var, int

; winmdroot.Foundation.WIN32_ERROR EnableTraceEx(global::System.Guid* ProviderId, [Optional] global::System.Guid* SourceId, winmdroot.System.Diagnostics.Etw.CONTROLTRACE_HANDLE TraceHandle, uint IsEnabled, byte Level, ulong MatchAnyKeyword, ulong MatchAllKeyword, uint EnableProperty, [Optional] winmdroot.System.Diagnostics.Etw.EVENT_FILTER_DESCRIPTOR* EnableFilterDesc)
#cfunc global EnableTraceEx "EnableTraceEx" var, var, int, int, int, int64, int64, int, var

; winmdroot.Foundation.WIN32_ERROR EnableTraceEx2(winmdroot.System.Diagnostics.Etw.CONTROLTRACE_HANDLE TraceHandle, global::System.Guid* ProviderId, uint ControlCode, byte Level, ulong MatchAnyKeyword, ulong MatchAllKeyword, uint Timeout, [Optional] winmdroot.System.Diagnostics.Etw.ENABLE_TRACE_PARAMETERS* EnableParameters)
#cfunc global EnableTraceEx2 "EnableTraceEx2" int, var, int, int, int64, int64, int, var

; winmdroot.Foundation.BOOL EncryptFile(winmdroot.Foundation.PCWSTR lpFileName)
#cfunc global EncryptFileW "EncryptFileW" wstr

; winmdroot.Foundation.BOOL EncryptionDisable(winmdroot.Foundation.PCWSTR DirPath, winmdroot.Foundation.BOOL Disable)
#cfunc global EncryptionDisable "EncryptionDisable" wstr, int

; winmdroot.Foundation.BOOL EnumDependentServices(winmdroot.System.Services.SC_HANDLE hService, winmdroot.System.Services.ENUM_SERVICE_STATE dwServiceState, [Optional] winmdroot.System.Services.ENUM_SERVICE_STATUSW* lpServices, uint cbBufSize, uint* pcbBytesNeeded, uint* lpServicesReturned)
#cfunc global EnumDependentServicesW "EnumDependentServicesW" intptr, int, var, int, var, var

; uint EnumDynamicTimeZoneInformation(uint dwIndex, winmdroot.System.Time.DYNAMIC_TIME_ZONE_INFORMATION* lpTimeZoneInformation)
#cfunc global EnumDynamicTimeZoneInformation "EnumDynamicTimeZoneInformation" int, var

; winmdroot.Foundation.BOOL EnumServicesStatus(winmdroot.System.Services.SC_HANDLE hSCManager, winmdroot.System.Services.ENUM_SERVICE_TYPE dwServiceType, winmdroot.System.Services.ENUM_SERVICE_STATE dwServiceState, [Optional] winmdroot.System.Services.ENUM_SERVICE_STATUSW* lpServices, uint cbBufSize, uint* pcbBytesNeeded, uint* lpServicesReturned, [Optional] uint* lpResumeHandle)
#cfunc global EnumServicesStatusW "EnumServicesStatusW" intptr, int, int, var, int, var, var, var

; winmdroot.Foundation.BOOL EnumServicesStatusEx(winmdroot.System.Services.SC_HANDLE hSCManager, winmdroot.System.Services.SC_ENUM_TYPE InfoLevel, winmdroot.System.Services.ENUM_SERVICE_TYPE dwServiceType, winmdroot.System.Services.ENUM_SERVICE_STATE dwServiceState, [Optional] byte* lpServices, uint cbBufSize, uint* pcbBytesNeeded, uint* lpServicesReturned, [Optional] uint* lpResumeHandle, winmdroot.Foundation.PCWSTR pszGroupName)
#cfunc global EnumServicesStatusExW "EnumServicesStatusExW" intptr, int, int, int, var, int, var, var, var, wstr

; winmdroot.Foundation.WIN32_ERROR EnumerateTraceGuids(winmdroot.System.Diagnostics.Etw.TRACE_GUID_PROPERTIES** GuidPropertiesArray, uint PropertyArrayCount, uint* GuidCount)
#cfunc global EnumerateTraceGuids "EnumerateTraceGuids" var, int, var

; winmdroot.Foundation.WIN32_ERROR EnumerateTraceGuidsEx(winmdroot.System.Diagnostics.Etw.TRACE_QUERY_INFO_CLASS TraceQueryInfoClass, [Optional] void* InBuffer, uint InBufferSize, [Optional] void* OutBuffer, uint OutBufferSize, uint* ReturnLength)
#cfunc global EnumerateTraceGuidsEx "EnumerateTraceGuidsEx" int, intptr, int, intptr, int, var

; winmdroot.Foundation.BOOL EqualDomainSid(winmdroot.Security.PSID pSid1, winmdroot.Security.PSID pSid2, winmdroot.Foundation.BOOL* pfEqual)
#cfunc global EqualDomainSid "EqualDomainSid" int, int, var

; winmdroot.Foundation.BOOL EqualPrefixSid(winmdroot.Security.PSID pSid1, winmdroot.Security.PSID pSid2)
#cfunc global EqualPrefixSid "EqualPrefixSid" int, int

; winmdroot.Foundation.BOOL EqualSid(winmdroot.Security.PSID pSid1, winmdroot.Security.PSID pSid2)
#cfunc global EqualSid "EqualSid" int, int

; uint EventAccessControl(global::System.Guid* Guid, uint Operation, winmdroot.Security.PSID Sid, uint Rights, winmdroot.Foundation.BOOLEAN AllowOrDeny)
#cfunc global EventAccessControl "EventAccessControl" var, int, int, int, int

; uint EventAccessQuery(global::System.Guid* Guid, winmdroot.Security.PSECURITY_DESCRIPTOR Buffer, uint* BufferSize)
#cfunc global EventAccessQuery "EventAccessQuery" var, int, var

; uint EventAccessRemove(global::System.Guid* Guid)
#cfunc global EventAccessRemove "EventAccessRemove" var

; winmdroot.Foundation.BOOL FileEncryptionStatus(winmdroot.Foundation.PCWSTR lpFileName, uint* lpStatus)
#cfunc global FileEncryptionStatusW "FileEncryptionStatusW" wstr, var

; winmdroot.Foundation.BOOL FindFirstFreeAce(winmdroot.Security.ACL* pAcl, void** pAce)
#cfunc global FindFirstFreeAce "FindFirstFreeAce" var, var

; winmdroot.Foundation.WIN32_ERROR FlushTraceW(winmdroot.System.Diagnostics.Etw.CONTROLTRACE_HANDLE TraceHandle, winmdroot.Foundation.PCWSTR InstanceName, winmdroot.System.Diagnostics.Etw.EVENT_TRACE_PROPERTIES* Properties)
#cfunc global FlushTraceW "FlushTraceW" int, wstr, var

; void FreeEncryptedFileMetadata(byte* pbMetadata)
#func global FreeEncryptedFileMetadata "FreeEncryptedFileMetadata" var

; void FreeEncryptionCertificateHashList(winmdroot.Storage.FileSystem.ENCRYPTION_CERTIFICATE_HASH_LIST* pUsers)
#func global FreeEncryptionCertificateHashList "FreeEncryptionCertificateHashList" var

; winmdroot.Foundation.WIN32_ERROR FreeInheritedFromArray(winmdroot.Security.Authorization.INHERITED_FROMW* pInheritArray, ushort AceCnt, [Optional] winmdroot.Security.Authorization.FN_OBJECT_MGR_FUNCTS* pfnArray)
#cfunc global FreeInheritedFromArray "FreeInheritedFromArray" var, int, var

; winmdroot.Foundation.BOOL GetAce(winmdroot.Security.ACL* pAcl, uint dwAceIndex, void** pAce)
#cfunc global GetAce "GetAce" var, int, var

; winmdroot.Foundation.BOOL GetAclInformation(winmdroot.Security.ACL* pAcl, void* pAclInformation, uint nAclInformationLength, winmdroot.Security.ACL_INFORMATION_CLASS dwAclInformationClass)
#cfunc global GetAclInformation "GetAclInformation" var, intptr, int, int

; winmdroot.Foundation.WIN32_ERROR GetAuditedPermissionsFromAclW(winmdroot.Security.ACL* pacl, winmdroot.Security.Authorization.TRUSTEE_W* pTrustee, uint* pSuccessfulAuditedRights, uint* pFailedAuditRights)
#cfunc global GetAuditedPermissionsFromAclW "GetAuditedPermissionsFromAclW" var, var, var, var

; winmdroot.Foundation.BOOL GetCurrentHwProfile(winmdroot.System.WindowsProgramming.HW_PROFILE_INFOW* lpHwProfileInfo)
#cfunc global GetCurrentHwProfileW "GetCurrentHwProfileW" var

; uint GetDynamicTimeZoneInformationEffectiveYears(winmdroot.System.Time.DYNAMIC_TIME_ZONE_INFORMATION* lpTimeZoneInformation, uint* FirstYear, uint* LastYear)
#cfunc global GetDynamicTimeZoneInformationEffectiveYears "GetDynamicTimeZoneInformationEffectiveYears" var, var, var

; winmdroot.Foundation.WIN32_ERROR GetEffectiveRightsFromAclW(winmdroot.Security.ACL* pacl, winmdroot.Security.Authorization.TRUSTEE_W* pTrustee, uint* pAccessRights)
#cfunc global GetEffectiveRightsFromAclW "GetEffectiveRightsFromAclW" var, var, var

; uint GetEncryptedFileMetadata(winmdroot.Foundation.PCWSTR lpFileName, uint* pcbMetadata, byte** ppbMetadata)
#cfunc global GetEncryptedFileMetadata "GetEncryptedFileMetadata" wstr, var, var

; winmdroot.Foundation.BOOL GetEventLogInformation(winmdroot.Foundation.HANDLE hEventLog, uint dwInfoLevel, void* lpBuffer, uint cbBufSize, uint* pcbBytesNeeded)
#cfunc global GetEventLogInformation "GetEventLogInformation" intptr, int, intptr, int, var

; winmdroot.Foundation.WIN32_ERROR GetExplicitEntriesFromAclW(winmdroot.Security.ACL* pacl, uint* pcCountOfExplicitEntries, winmdroot.Security.Authorization.EXPLICIT_ACCESS_W** pListOfExplicitEntries)
#cfunc global GetExplicitEntriesFromAclW "GetExplicitEntriesFromAclW" var, var, var

; winmdroot.Foundation.BOOL GetFileSecurityW(winmdroot.Foundation.PCWSTR lpFileName, uint RequestedInformation, winmdroot.Security.PSECURITY_DESCRIPTOR pSecurityDescriptor, uint nLength, uint* lpnLengthNeeded)
#cfunc global GetFileSecurityW "GetFileSecurityW" wstr, int, int, int, var

; winmdroot.Foundation.WIN32_ERROR GetInheritanceSourceW(winmdroot.Foundation.PWSTR pObjectName, winmdroot.Security.Authorization.SE_OBJECT_TYPE ObjectType, winmdroot.Security.OBJECT_SECURITY_INFORMATION SecurityInfo, winmdroot.Foundation.BOOL Container, [Optional] global::System.Guid** pObjectClassGuids, uint GuidCount, winmdroot.Security.ACL* pAcl, [Optional] winmdroot.Security.Authorization.FN_OBJECT_MGR_FUNCTS* pfnArray, winmdroot.Security.GENERIC_MAPPING* pGenericMapping, winmdroot.Security.Authorization.INHERITED_FROMW* pInheritArray)
#cfunc global GetInheritanceSourceW "GetInheritanceSourceW" wstr, int, int, int, var, int, var, var, var, var

; winmdroot.Foundation.BOOL GetKernelObjectSecurity(winmdroot.Foundation.HANDLE Handle, uint RequestedInformation, winmdroot.Security.PSECURITY_DESCRIPTOR pSecurityDescriptor, uint nLength, uint* lpnLengthNeeded)
#cfunc global GetKernelObjectSecurity "GetKernelObjectSecurity" intptr, int, int, int, var

; uint GetLengthSid(winmdroot.Security.PSID pSid)
#cfunc global GetLengthSid "GetLengthSid" int

; void GetLocalManagedApplicationData(winmdroot.Foundation.PWSTR ProductCode, winmdroot.Foundation.PWSTR* DisplayName, winmdroot.Foundation.PWSTR* SupportUrl)
#func global GetLocalManagedApplicationData "GetLocalManagedApplicationData" wstr, var, var

; uint GetLocalManagedApplications(winmdroot.Foundation.BOOL bUserApps, uint* pdwApps, winmdroot.System.GroupPolicy.LOCALMANAGEDAPPLICATION** prgLocalApps)
#cfunc global GetLocalManagedApplications "GetLocalManagedApplications" int, var, var

; uint GetManagedApplicationCategories(uint dwReserved, winmdroot.UI.Shell.APPCATEGORYINFOLIST* pAppCategory)
#cfunc global GetManagedApplicationCategories "GetManagedApplicationCategories" int, var

; uint GetManagedApplications(global::System.Guid* pCategory, uint dwQueryFlags, uint dwInfoLevel, uint* pdwApps, winmdroot.System.GroupPolicy.MANAGEDAPPLICATION** prgManagedApps)
#cfunc global GetManagedApplications "GetManagedApplications" var, int, int, var, var

; winmdroot.Security.Authorization.TRUSTEE_W* GetMultipleTrusteeW([Optional] winmdroot.Security.Authorization.TRUSTEE_W* pTrustee)
#cfunc global GetMultipleTrusteeW "GetMultipleTrusteeW" var

; winmdroot.Security.Authorization.MULTIPLE_TRUSTEE_OPERATION GetMultipleTrusteeOperationW([Optional] winmdroot.Security.Authorization.TRUSTEE_W* pTrustee)
#cfunc global GetMultipleTrusteeOperationW "GetMultipleTrusteeOperationW" var

; winmdroot.Foundation.WIN32_ERROR GetNamedSecurityInfoW(winmdroot.Foundation.PCWSTR pObjectName, winmdroot.Security.Authorization.SE_OBJECT_TYPE ObjectType, winmdroot.Security.OBJECT_SECURITY_INFORMATION SecurityInfo, [Optional] winmdroot.Security.PSID* ppsidOwner, [Optional] winmdroot.Security.PSID* ppsidGroup, [Optional] winmdroot.Security.ACL** ppDacl, [Optional] winmdroot.Security.ACL** ppSacl, winmdroot.Security.PSECURITY_DESCRIPTOR* ppSecurityDescriptor)
#cfunc global GetNamedSecurityInfoW "GetNamedSecurityInfoW" wstr, int, int, var, var, var, var, var

; winmdroot.Foundation.BOOL GetNumberOfEventLogRecords(winmdroot.Foundation.HANDLE hEventLog, uint* NumberOfRecords)
#cfunc global GetNumberOfEventLogRecords "GetNumberOfEventLogRecords" intptr, var

; winmdroot.Foundation.BOOL GetOldestEventLogRecord(winmdroot.Foundation.HANDLE hEventLog, uint* OldestRecord)
#cfunc global GetOldestEventLogRecord "GetOldestEventLogRecord" intptr, var

; winmdroot.Foundation.BOOL GetPrivateObjectSecurity(winmdroot.Security.PSECURITY_DESCRIPTOR ObjectDescriptor, winmdroot.Security.OBJECT_SECURITY_INFORMATION SecurityInformation, winmdroot.Security.PSECURITY_DESCRIPTOR ResultantDescriptor, uint DescriptorLength, uint* ReturnLength)
#cfunc global GetPrivateObjectSecurity "GetPrivateObjectSecurity" int, int, int, int, var

; winmdroot.Foundation.BOOL GetSecurityDescriptorControl(winmdroot.Security.PSECURITY_DESCRIPTOR pSecurityDescriptor, ushort* pControl, uint* lpdwRevision)
#cfunc global GetSecurityDescriptorControl "GetSecurityDescriptorControl" int, var, var

; winmdroot.Foundation.BOOL GetSecurityDescriptorDacl(winmdroot.Security.PSECURITY_DESCRIPTOR pSecurityDescriptor, winmdroot.Foundation.BOOL* lpbDaclPresent, winmdroot.Security.ACL** pDacl, winmdroot.Foundation.BOOL* lpbDaclDefaulted)
#cfunc global GetSecurityDescriptorDacl "GetSecurityDescriptorDacl" int, var, var, var

; winmdroot.Foundation.BOOL GetSecurityDescriptorGroup(winmdroot.Security.PSECURITY_DESCRIPTOR pSecurityDescriptor, winmdroot.Security.PSID* pGroup, winmdroot.Foundation.BOOL* lpbGroupDefaulted)
#cfunc global GetSecurityDescriptorGroup "GetSecurityDescriptorGroup" int, var, var

; uint GetSecurityDescriptorLength(winmdroot.Security.PSECURITY_DESCRIPTOR pSecurityDescriptor)
#cfunc global GetSecurityDescriptorLength "GetSecurityDescriptorLength" int

; winmdroot.Foundation.BOOL GetSecurityDescriptorOwner(winmdroot.Security.PSECURITY_DESCRIPTOR pSecurityDescriptor, winmdroot.Security.PSID* pOwner, winmdroot.Foundation.BOOL* lpbOwnerDefaulted)
#cfunc global GetSecurityDescriptorOwner "GetSecurityDescriptorOwner" int, var, var

; uint GetSecurityDescriptorRMControl(winmdroot.Security.PSECURITY_DESCRIPTOR SecurityDescriptor, byte* RMControl)
#cfunc global GetSecurityDescriptorRMControl "GetSecurityDescriptorRMControl" int, var

; winmdroot.Foundation.BOOL GetSecurityDescriptorSacl(winmdroot.Security.PSECURITY_DESCRIPTOR pSecurityDescriptor, winmdroot.Foundation.BOOL* lpbSaclPresent, winmdroot.Security.ACL** pSacl, winmdroot.Foundation.BOOL* lpbSaclDefaulted)
#cfunc global GetSecurityDescriptorSacl "GetSecurityDescriptorSacl" int, var, var, var

; winmdroot.Foundation.WIN32_ERROR GetSecurityInfo(winmdroot.Foundation.HANDLE handle, winmdroot.Security.Authorization.SE_OBJECT_TYPE ObjectType, winmdroot.Security.OBJECT_SECURITY_INFORMATION SecurityInfo, [Optional] winmdroot.Security.PSID* ppsidOwner, [Optional] winmdroot.Security.PSID* ppsidGroup, [Optional] winmdroot.Security.ACL** ppDacl, [Optional] winmdroot.Security.ACL** ppSacl, [Optional] winmdroot.Security.PSECURITY_DESCRIPTOR* ppSecurityDescriptor)
#cfunc global GetSecurityInfo "GetSecurityInfo" intptr, int, int, var, var, var, var, var

; winmdroot.Foundation.BOOL GetServiceDisplayName(winmdroot.System.Services.SC_HANDLE hSCManager, winmdroot.Foundation.PCWSTR lpServiceName, winmdroot.Foundation.PWSTR lpDisplayName, uint* lpcchBuffer)
#cfunc global GetServiceDisplayNameW "GetServiceDisplayNameW" intptr, wstr, wstr, var

; winmdroot.Foundation.BOOL GetServiceKeyName(winmdroot.System.Services.SC_HANDLE hSCManager, winmdroot.Foundation.PCWSTR lpDisplayName, winmdroot.Foundation.PWSTR lpServiceName, uint* lpcchBuffer)
#cfunc global GetServiceKeyNameW "GetServiceKeyNameW" intptr, wstr, wstr, var

; winmdroot.Security.SID_IDENTIFIER_AUTHORITY* GetSidIdentifierAuthority(winmdroot.Security.PSID pSid)
#cfunc global GetSidIdentifierAuthority "GetSidIdentifierAuthority" int

; uint GetSidLengthRequired(byte nSubAuthorityCount)
#cfunc global GetSidLengthRequired "GetSidLengthRequired" int

; uint* GetSidSubAuthority(winmdroot.Security.PSID pSid, uint nSubAuthority)
#cfunc global GetSidSubAuthority "GetSidSubAuthority" int, int

; byte* GetSidSubAuthorityCount(winmdroot.Security.PSID pSid)
#cfunc global GetSidSubAuthorityCount "GetSidSubAuthorityCount" int

; winmdroot.Foundation.BOOL GetThreadWaitChain(void* WctHandle, nuint Context, winmdroot.System.Diagnostics.Debug.WAIT_CHAIN_THREAD_OPTIONS Flags, uint ThreadId, uint* NodeCount, winmdroot.System.Diagnostics.Debug.WAITCHAIN_NODE_INFO* NodeInfoArray, winmdroot.Foundation.BOOL* IsCycle)
#cfunc global GetThreadWaitChain "GetThreadWaitChain" intptr, int, int, int, var, var, var

; winmdroot.Foundation.BOOL GetTokenInformation(winmdroot.Foundation.HANDLE TokenHandle, winmdroot.Security.TOKEN_INFORMATION_CLASS TokenInformationClass, [Optional] void* TokenInformation, uint TokenInformationLength, uint* ReturnLength)
#cfunc global GetTokenInformation "GetTokenInformation" intptr, int, intptr, int, var

; winmdroot.Security.Authorization.TRUSTEE_FORM GetTrusteeFormW(winmdroot.Security.Authorization.TRUSTEE_W* pTrustee)
#cfunc global GetTrusteeFormW "GetTrusteeFormW" var

; winmdroot.Foundation.PWSTR GetTrusteeNameW(winmdroot.Security.Authorization.TRUSTEE_W* pTrustee)
#cfunc global GetTrusteeNameW "GetTrusteeNameW" var

; winmdroot.Security.Authorization.TRUSTEE_TYPE GetTrusteeTypeW([Optional] winmdroot.Security.Authorization.TRUSTEE_W* pTrustee)
#cfunc global GetTrusteeTypeW "GetTrusteeTypeW" var

; winmdroot.Foundation.BOOL GetUserName(winmdroot.Foundation.PWSTR lpBuffer, uint* pcbBuffer)
#cfunc global GetUserNameW "GetUserNameW" wstr, var

; winmdroot.Foundation.BOOL GetWindowsAccountDomainSid(winmdroot.Security.PSID pSid, winmdroot.Security.PSID pDomainSid, uint* cbDomainSid)
#cfunc global GetWindowsAccountDomainSid "GetWindowsAccountDomainSid" int, int, var

; winmdroot.Foundation.BOOL ImpersonateAnonymousToken(winmdroot.Foundation.HANDLE ThreadHandle)
#cfunc global ImpersonateAnonymousToken "ImpersonateAnonymousToken" intptr

; winmdroot.Foundation.BOOL ImpersonateLoggedOnUser(winmdroot.Foundation.HANDLE hToken)
#cfunc global ImpersonateLoggedOnUser "ImpersonateLoggedOnUser" intptr

; winmdroot.Foundation.BOOL ImpersonateNamedPipeClient(winmdroot.Foundation.HANDLE hNamedPipe)
#cfunc global ImpersonateNamedPipeClient "ImpersonateNamedPipeClient" intptr

; winmdroot.Foundation.BOOL ImpersonateSelf(winmdroot.Security.SECURITY_IMPERSONATION_LEVEL ImpersonationLevel)
#cfunc global ImpersonateSelf "ImpersonateSelf" int

; winmdroot.Foundation.BOOL InitializeAcl(winmdroot.Security.ACL* pAcl, uint nAclLength, winmdroot.Security.ACE_REVISION dwAclRevision)
#cfunc global InitializeAcl "InitializeAcl" var, int, int

; winmdroot.Foundation.BOOL InitializeSecurityDescriptor(winmdroot.Security.PSECURITY_DESCRIPTOR pSecurityDescriptor, uint dwRevision)
#cfunc global InitializeSecurityDescriptor "InitializeSecurityDescriptor" int, int

; winmdroot.Foundation.BOOL InitializeSid(winmdroot.Security.PSID Sid, winmdroot.Security.SID_IDENTIFIER_AUTHORITY* pIdentifierAuthority, byte nSubAuthorityCount)
#cfunc global InitializeSid "InitializeSid" int, var, int

; uint InitiateShutdownW(winmdroot.Foundation.PWSTR lpMachineName, winmdroot.Foundation.PWSTR lpMessage, uint dwGracePeriod, winmdroot.System.Shutdown.SHUTDOWN_FLAGS dwShutdownFlags, winmdroot.System.Shutdown.SHUTDOWN_REASON dwReason)
#cfunc global InitiateShutdownW "InitiateShutdownW" wstr, wstr, int, int, int

; winmdroot.Foundation.BOOL InitiateSystemShutdown(winmdroot.Foundation.PWSTR lpMachineName, winmdroot.Foundation.PWSTR lpMessage, uint dwTimeout, winmdroot.Foundation.BOOL bForceAppsClosed, winmdroot.Foundation.BOOL bRebootAfterShutdown)
#cfunc global InitiateSystemShutdownW "InitiateSystemShutdownW" wstr, wstr, int, int, int

; winmdroot.Foundation.BOOL InitiateSystemShutdownEx(winmdroot.Foundation.PWSTR lpMachineName, winmdroot.Foundation.PWSTR lpMessage, uint dwTimeout, winmdroot.Foundation.BOOL bForceAppsClosed, winmdroot.Foundation.BOOL bRebootAfterShutdown, winmdroot.System.Shutdown.SHUTDOWN_REASON dwReason)
#cfunc global InitiateSystemShutdownExW "InitiateSystemShutdownExW" wstr, wstr, int, int, int, int

; uint InstallApplication(winmdroot.System.GroupPolicy.INSTALLDATA* pInstallInfo)
#cfunc global InstallApplication "InstallApplication" var

; winmdroot.Foundation.BOOL IsTextUnicode(void* lpv, int iSize, [Optional] winmdroot.Globalization.IS_TEXT_UNICODE_RESULT* lpiResult)
#cfunc global IsTextUnicode "IsTextUnicode" intptr, int, var

; winmdroot.Foundation.BOOL IsTokenRestricted(winmdroot.Foundation.HANDLE TokenHandle)
#cfunc global IsTokenRestricted "IsTokenRestricted" intptr

; winmdroot.Foundation.BOOL IsTokenUntrusted(winmdroot.Foundation.HANDLE TokenHandle)
#cfunc global IsTokenUntrusted "IsTokenUntrusted" intptr

; winmdroot.Foundation.BOOL IsValidAcl(winmdroot.Security.ACL* pAcl)
#cfunc global IsValidAcl "IsValidAcl" var

; winmdroot.Foundation.BOOL IsValidSecurityDescriptor(winmdroot.Security.PSECURITY_DESCRIPTOR pSecurityDescriptor)
#cfunc global IsValidSecurityDescriptor "IsValidSecurityDescriptor" int

; winmdroot.Foundation.BOOL IsValidSid(winmdroot.Security.PSID pSid)
#cfunc global IsValidSid "IsValidSid" int

; winmdroot.Foundation.BOOL IsWellKnownSid(winmdroot.Security.PSID pSid, winmdroot.Security.WELL_KNOWN_SID_TYPE WellKnownSidType)
#cfunc global IsWellKnownSid "IsWellKnownSid" int, int

; void* LockServiceDatabase(winmdroot.System.Services.SC_HANDLE hSCManager)
#cfunc global LockServiceDatabase "LockServiceDatabase" intptr

; winmdroot.Foundation.BOOL LogonUser(winmdroot.Foundation.PCWSTR lpszUsername, winmdroot.Foundation.PCWSTR lpszDomain, winmdroot.Foundation.PCWSTR lpszPassword, winmdroot.Security.LOGON32_LOGON dwLogonType, winmdroot.Security.LOGON32_PROVIDER dwLogonProvider, winmdroot.Foundation.HANDLE* phToken)
#cfunc global LogonUserW "LogonUserW" wstr, wstr, wstr, int, int, intptr

; winmdroot.Foundation.BOOL LogonUserEx(winmdroot.Foundation.PCWSTR lpszUsername, winmdroot.Foundation.PCWSTR lpszDomain, winmdroot.Foundation.PCWSTR lpszPassword, winmdroot.Security.LOGON32_LOGON dwLogonType, winmdroot.Security.LOGON32_PROVIDER dwLogonProvider, [Optional] winmdroot.Foundation.HANDLE* phToken, [Optional] winmdroot.Security.PSID* ppLogonSid, [Optional] void** ppProfileBuffer, [Optional] uint* pdwProfileLength, [Optional] winmdroot.Security.QUOTA_LIMITS* pQuotaLimits)
#cfunc global LogonUserExW "LogonUserExW" wstr, wstr, wstr, int, int, intptr, var, var, var, var

; winmdroot.Foundation.BOOL LookupAccountName(winmdroot.Foundation.PCWSTR lpSystemName, winmdroot.Foundation.PCWSTR lpAccountName, winmdroot.Security.PSID Sid, uint* cbSid, winmdroot.Foundation.PWSTR ReferencedDomainName, uint* cchReferencedDomainName, winmdroot.Security.SID_NAME_USE* peUse)
#cfunc global LookupAccountNameW "LookupAccountNameW" wstr, wstr, int, var, wstr, var, var

; winmdroot.Foundation.BOOL LookupAccountSid(winmdroot.Foundation.PCWSTR lpSystemName, winmdroot.Security.PSID Sid, winmdroot.Foundation.PWSTR Name, uint* cchName, winmdroot.Foundation.PWSTR ReferencedDomainName, uint* cchReferencedDomainName, winmdroot.Security.SID_NAME_USE* peUse)
#cfunc global LookupAccountSidW "LookupAccountSidW" wstr, int, wstr, var, wstr, var, var

; winmdroot.Foundation.BOOL LookupPrivilegeDisplayName(winmdroot.Foundation.PCWSTR lpSystemName, winmdroot.Foundation.PCWSTR lpName, winmdroot.Foundation.PWSTR lpDisplayName, uint* cchDisplayName, uint* lpLanguageId)
#cfunc global LookupPrivilegeDisplayNameW "LookupPrivilegeDisplayNameW" wstr, wstr, wstr, var, var

; winmdroot.Foundation.BOOL LookupPrivilegeName(winmdroot.Foundation.PCWSTR lpSystemName, winmdroot.Foundation.LUID* lpLuid, winmdroot.Foundation.PWSTR lpName, uint* cchName)
#cfunc global LookupPrivilegeNameW "LookupPrivilegeNameW" wstr, var, wstr, var

; winmdroot.Foundation.BOOL LookupPrivilegeValue(winmdroot.Foundation.PCWSTR lpSystemName, winmdroot.Foundation.PCWSTR lpName, winmdroot.Foundation.LUID* lpLuid)
#cfunc global LookupPrivilegeValueW "LookupPrivilegeValueW" wstr, wstr, var

; winmdroot.Foundation.WIN32_ERROR LookupSecurityDescriptorPartsW([Optional] winmdroot.Security.Authorization.TRUSTEE_W** ppOwner, [Optional] winmdroot.Security.Authorization.TRUSTEE_W** ppGroup, [Optional] uint* pcCountOfAccessEntries, winmdroot.Security.Authorization.EXPLICIT_ACCESS_W** ppListOfAccessEntries, [Optional] uint* pcCountOfAuditEntries, winmdroot.Security.Authorization.EXPLICIT_ACCESS_W** ppListOfAuditEntries, winmdroot.Security.PSECURITY_DESCRIPTOR pSD)
#cfunc global LookupSecurityDescriptorPartsW "LookupSecurityDescriptorPartsW" var, var, var, var, var, var, int

; winmdroot.Foundation.NTSTATUS LsaClose(winmdroot.Security.Authentication.Identity.LSA_HANDLE ObjectHandle)
#cfunc global LsaClose "LsaClose" intptr

; winmdroot.Foundation.NTSTATUS LsaAddAccountRights(winmdroot.Security.Authentication.Identity.LSA_HANDLE PolicyHandle, winmdroot.Security.PSID AccountSid, winmdroot.Security.Authentication.Identity.LSA_UNICODE_STRING* UserRights, uint CountOfRights)
#cfunc global LsaAddAccountRights "LsaAddAccountRights" intptr, int, var, int

; winmdroot.Foundation.NTSTATUS LsaCreateTrustedDomainEx(winmdroot.Security.Authentication.Identity.LSA_HANDLE PolicyHandle, winmdroot.Security.Authentication.Identity.TRUSTED_DOMAIN_INFORMATION_EX* TrustedDomainInformation, winmdroot.Security.Authentication.Identity.TRUSTED_DOMAIN_AUTH_INFORMATION* AuthenticationInformation, uint DesiredAccess, winmdroot.Security.Authentication.Identity.LSA_HANDLE* TrustedDomainHandle)
#cfunc global LsaCreateTrustedDomainEx "LsaCreateTrustedDomainEx" intptr, var, var, int, intptr

; winmdroot.Foundation.NTSTATUS LsaDeleteTrustedDomain(winmdroot.Security.Authentication.Identity.LSA_HANDLE PolicyHandle, winmdroot.Security.PSID TrustedDomainSid)
#cfunc global LsaDeleteTrustedDomain "LsaDeleteTrustedDomain" intptr, int

; winmdroot.Foundation.NTSTATUS LsaEnumerateAccountRights(winmdroot.Security.Authentication.Identity.LSA_HANDLE PolicyHandle, winmdroot.Security.PSID AccountSid, winmdroot.Security.Authentication.Identity.LSA_UNICODE_STRING** UserRights, uint* CountOfRights)
#cfunc global LsaEnumerateAccountRights "LsaEnumerateAccountRights" intptr, int, var, var

; winmdroot.Foundation.NTSTATUS LsaEnumerateAccountsWithUserRight(winmdroot.Security.Authentication.Identity.LSA_HANDLE PolicyHandle, [Optional] winmdroot.Security.Authentication.Identity.LSA_UNICODE_STRING* UserRight, void** Buffer, uint* CountReturned)
#cfunc global LsaEnumerateAccountsWithUserRight "LsaEnumerateAccountsWithUserRight" intptr, var, var, var

; winmdroot.Foundation.NTSTATUS LsaEnumerateTrustedDomains(winmdroot.Security.Authentication.Identity.LSA_HANDLE PolicyHandle, uint* EnumerationContext, void** Buffer, uint PreferedMaximumLength, uint* CountReturned)
#cfunc global LsaEnumerateTrustedDomains "LsaEnumerateTrustedDomains" intptr, var, var, int, var

; winmdroot.Foundation.NTSTATUS LsaEnumerateTrustedDomainsEx(winmdroot.Security.Authentication.Identity.LSA_HANDLE PolicyHandle, uint* EnumerationContext, void** Buffer, uint PreferedMaximumLength, uint* CountReturned)
#cfunc global LsaEnumerateTrustedDomainsEx "LsaEnumerateTrustedDomainsEx" intptr, var, var, int, var

; winmdroot.Foundation.NTSTATUS LsaFreeMemory([Optional] void* Buffer)
#cfunc global LsaFreeMemory "LsaFreeMemory" intptr

; winmdroot.Foundation.NTSTATUS LsaGetAppliedCAPIDs([Optional] winmdroot.Security.Authentication.Identity.LSA_UNICODE_STRING* SystemName, winmdroot.Security.PSID** CAPIDs, uint* CAPIDCount)
#cfunc global LsaGetAppliedCAPIDs "LsaGetAppliedCAPIDs" var, var, var

; winmdroot.Foundation.NTSTATUS LsaLookupNames(winmdroot.Security.Authentication.Identity.LSA_HANDLE PolicyHandle, uint Count, winmdroot.Security.Authentication.Identity.LSA_UNICODE_STRING* Names, winmdroot.Security.Authentication.Identity.LSA_REFERENCED_DOMAIN_LIST** ReferencedDomains, winmdroot.Security.Authentication.Identity.LSA_TRANSLATED_SID** Sids)
#cfunc global LsaLookupNames "LsaLookupNames" intptr, int, var, var, var

; winmdroot.Foundation.NTSTATUS LsaLookupNames2(winmdroot.Security.Authentication.Identity.LSA_HANDLE PolicyHandle, uint Flags, uint Count, winmdroot.Security.Authentication.Identity.LSA_UNICODE_STRING* Names, winmdroot.Security.Authentication.Identity.LSA_REFERENCED_DOMAIN_LIST** ReferencedDomains, winmdroot.Security.Authentication.Identity.LSA_TRANSLATED_SID2** Sids)
#cfunc global LsaLookupNames2 "LsaLookupNames2" intptr, int, int, var, var, var

; winmdroot.Foundation.NTSTATUS LsaLookupSids(winmdroot.Security.Authentication.Identity.LSA_HANDLE PolicyHandle, uint Count, winmdroot.Security.PSID* Sids, winmdroot.Security.Authentication.Identity.LSA_REFERENCED_DOMAIN_LIST** ReferencedDomains, winmdroot.Security.Authentication.Identity.LSA_TRANSLATED_NAME** Names)
#cfunc global LsaLookupSids "LsaLookupSids" intptr, int, var, var, var

; winmdroot.Foundation.NTSTATUS LsaLookupSids2(winmdroot.Security.Authentication.Identity.LSA_HANDLE PolicyHandle, uint LookupOptions, uint Count, winmdroot.Security.PSID* Sids, winmdroot.Security.Authentication.Identity.LSA_REFERENCED_DOMAIN_LIST** ReferencedDomains, winmdroot.Security.Authentication.Identity.LSA_TRANSLATED_NAME** Names)
#cfunc global LsaLookupSids2 "LsaLookupSids2" intptr, int, int, var, var, var

; uint LsaNtStatusToWinError(winmdroot.Foundation.NTSTATUS Status)
#cfunc global LsaNtStatusToWinError "LsaNtStatusToWinError" intptr

; winmdroot.Foundation.NTSTATUS LsaOpenPolicy([Optional] winmdroot.Security.Authentication.Identity.LSA_UNICODE_STRING* SystemName, winmdroot.Security.Authentication.Identity.LSA_OBJECT_ATTRIBUTES* ObjectAttributes, uint DesiredAccess, winmdroot.Security.Authentication.Identity.LSA_HANDLE* PolicyHandle)
#cfunc global LsaOpenPolicy "LsaOpenPolicy" var, var, int, intptr

; winmdroot.Foundation.NTSTATUS LsaOpenTrustedDomainByName(winmdroot.Security.Authentication.Identity.LSA_HANDLE PolicyHandle, winmdroot.Security.Authentication.Identity.LSA_UNICODE_STRING* TrustedDomainName, uint DesiredAccess, winmdroot.Security.Authentication.Identity.LSA_HANDLE* TrustedDomainHandle)
#cfunc global LsaOpenTrustedDomainByName "LsaOpenTrustedDomainByName" intptr, var, int, intptr

; winmdroot.Foundation.NTSTATUS LsaQueryCAPs([Optional] winmdroot.Security.PSID* CAPIDs, uint CAPIDCount, winmdroot.Security.Authentication.Identity.CENTRAL_ACCESS_POLICY** CAPs, uint* CAPCount)
#cfunc global LsaQueryCAPs "LsaQueryCAPs" var, int, var, var

; winmdroot.Foundation.NTSTATUS LsaQueryDomainInformationPolicy(winmdroot.Security.Authentication.Identity.LSA_HANDLE PolicyHandle, winmdroot.Security.Authentication.Identity.POLICY_DOMAIN_INFORMATION_CLASS InformationClass, void** Buffer)
#cfunc global LsaQueryDomainInformationPolicy "LsaQueryDomainInformationPolicy" intptr, int, var

; winmdroot.Foundation.NTSTATUS LsaQueryForestTrustInformation(winmdroot.Security.Authentication.Identity.LSA_HANDLE PolicyHandle, winmdroot.Security.Authentication.Identity.LSA_UNICODE_STRING* TrustedDomainName, winmdroot.Security.Authentication.Identity.LSA_FOREST_TRUST_INFORMATION** ForestTrustInfo)
#cfunc global LsaQueryForestTrustInformation "LsaQueryForestTrustInformation" intptr, var, var

; winmdroot.Foundation.NTSTATUS LsaQueryForestTrustInformation2(winmdroot.Security.Authentication.Identity.LSA_HANDLE PolicyHandle, winmdroot.Security.Authentication.Identity.LSA_UNICODE_STRING* TrustedDomainName, winmdroot.Security.Authentication.Identity.LSA_FOREST_TRUST_RECORD_TYPE HighestRecordType, winmdroot.Security.Authentication.Identity.LSA_FOREST_TRUST_INFORMATION2** ForestTrustInfo)
#cfunc global LsaQueryForestTrustInformation2 "LsaQueryForestTrustInformation2" intptr, var, int, var

; winmdroot.Foundation.NTSTATUS LsaQueryInformationPolicy(winmdroot.Security.Authentication.Identity.LSA_HANDLE PolicyHandle, winmdroot.Security.Authentication.Identity.POLICY_INFORMATION_CLASS InformationClass, void** Buffer)
#cfunc global LsaQueryInformationPolicy "LsaQueryInformationPolicy" intptr, int, var

; winmdroot.Foundation.NTSTATUS LsaQueryTrustedDomainInfo(winmdroot.Security.Authentication.Identity.LSA_HANDLE PolicyHandle, winmdroot.Security.PSID TrustedDomainSid, winmdroot.Security.Authentication.Identity.TRUSTED_INFORMATION_CLASS InformationClass, void** Buffer)
#cfunc global LsaQueryTrustedDomainInfo "LsaQueryTrustedDomainInfo" intptr, int, int, var

; winmdroot.Foundation.NTSTATUS LsaQueryTrustedDomainInfoByName(winmdroot.Security.Authentication.Identity.LSA_HANDLE PolicyHandle, winmdroot.Security.Authentication.Identity.LSA_UNICODE_STRING* TrustedDomainName, winmdroot.Security.Authentication.Identity.TRUSTED_INFORMATION_CLASS InformationClass, void** Buffer)
#cfunc global LsaQueryTrustedDomainInfoByName "LsaQueryTrustedDomainInfoByName" intptr, var, int, var

; winmdroot.Foundation.NTSTATUS LsaRemoveAccountRights(winmdroot.Security.Authentication.Identity.LSA_HANDLE PolicyHandle, winmdroot.Security.PSID AccountSid, winmdroot.Foundation.BOOLEAN AllRights, [Optional] winmdroot.Security.Authentication.Identity.LSA_UNICODE_STRING* UserRights, uint CountOfRights)
#cfunc global LsaRemoveAccountRights "LsaRemoveAccountRights" intptr, int, int, var, int

; winmdroot.Foundation.NTSTATUS LsaRetrievePrivateData(winmdroot.Security.Authentication.Identity.LSA_HANDLE PolicyHandle, winmdroot.Security.Authentication.Identity.LSA_UNICODE_STRING* KeyName, winmdroot.Security.Authentication.Identity.LSA_UNICODE_STRING** PrivateData)
#cfunc global LsaRetrievePrivateData "LsaRetrievePrivateData" intptr, var, var

; winmdroot.Foundation.NTSTATUS LsaSetCAPs([Optional] winmdroot.Security.Authentication.Identity.LSA_UNICODE_STRING* CAPDNs, uint CAPDNCount, uint Flags)
#cfunc global LsaSetCAPs "LsaSetCAPs" var, int, int

; winmdroot.Foundation.NTSTATUS LsaSetDomainInformationPolicy(winmdroot.Security.Authentication.Identity.LSA_HANDLE PolicyHandle, winmdroot.Security.Authentication.Identity.POLICY_DOMAIN_INFORMATION_CLASS InformationClass, [Optional] void* Buffer)
#cfunc global LsaSetDomainInformationPolicy "LsaSetDomainInformationPolicy" intptr, int, intptr

; winmdroot.Foundation.NTSTATUS LsaSetForestTrustInformation(winmdroot.Security.Authentication.Identity.LSA_HANDLE PolicyHandle, winmdroot.Security.Authentication.Identity.LSA_UNICODE_STRING* TrustedDomainName, winmdroot.Security.Authentication.Identity.LSA_FOREST_TRUST_INFORMATION* ForestTrustInfo, winmdroot.Foundation.BOOLEAN CheckOnly, winmdroot.Security.Authentication.Identity.LSA_FOREST_TRUST_COLLISION_INFORMATION** CollisionInfo)
#cfunc global LsaSetForestTrustInformation "LsaSetForestTrustInformation" intptr, var, var, int, var

; winmdroot.Foundation.NTSTATUS LsaSetForestTrustInformation2(winmdroot.Security.Authentication.Identity.LSA_HANDLE PolicyHandle, winmdroot.Security.Authentication.Identity.LSA_UNICODE_STRING* TrustedDomainName, winmdroot.Security.Authentication.Identity.LSA_FOREST_TRUST_RECORD_TYPE HighestRecordType, winmdroot.Security.Authentication.Identity.LSA_FOREST_TRUST_INFORMATION2* ForestTrustInfo, winmdroot.Foundation.BOOLEAN CheckOnly, winmdroot.Security.Authentication.Identity.LSA_FOREST_TRUST_COLLISION_INFORMATION** CollisionInfo)
#cfunc global LsaSetForestTrustInformation2 "LsaSetForestTrustInformation2" intptr, var, int, var, int, var

; winmdroot.Foundation.NTSTATUS LsaSetInformationPolicy(winmdroot.Security.Authentication.Identity.LSA_HANDLE PolicyHandle, winmdroot.Security.Authentication.Identity.POLICY_INFORMATION_CLASS InformationClass, void* Buffer)
#cfunc global LsaSetInformationPolicy "LsaSetInformationPolicy" intptr, int, intptr

; winmdroot.Foundation.NTSTATUS LsaSetTrustedDomainInfoByName(winmdroot.Security.Authentication.Identity.LSA_HANDLE PolicyHandle, winmdroot.Security.Authentication.Identity.LSA_UNICODE_STRING* TrustedDomainName, winmdroot.Security.Authentication.Identity.TRUSTED_INFORMATION_CLASS InformationClass, void* Buffer)
#cfunc global LsaSetTrustedDomainInfoByName "LsaSetTrustedDomainInfoByName" intptr, var, int, intptr

; winmdroot.Foundation.NTSTATUS LsaSetTrustedDomainInformation(winmdroot.Security.Authentication.Identity.LSA_HANDLE PolicyHandle, winmdroot.Security.PSID TrustedDomainSid, winmdroot.Security.Authentication.Identity.TRUSTED_INFORMATION_CLASS InformationClass, void* Buffer)
#cfunc global LsaSetTrustedDomainInformation "LsaSetTrustedDomainInformation" intptr, int, int, intptr

; winmdroot.Foundation.NTSTATUS LsaStorePrivateData(winmdroot.Security.Authentication.Identity.LSA_HANDLE PolicyHandle, winmdroot.Security.Authentication.Identity.LSA_UNICODE_STRING* KeyName, [Optional] winmdroot.Security.Authentication.Identity.LSA_UNICODE_STRING* PrivateData)
#cfunc global LsaStorePrivateData "LsaStorePrivateData" intptr, var, var

; uint MSChapSrvChangePassword(winmdroot.Foundation.PWSTR ServerName, winmdroot.Foundation.PWSTR UserName, winmdroot.Foundation.BOOLEAN LmOldPresent, winmdroot.System.PasswordManagement.LM_OWF_PASSWORD* LmOldOwfPassword, winmdroot.System.PasswordManagement.LM_OWF_PASSWORD* LmNewOwfPassword, winmdroot.System.PasswordManagement.LM_OWF_PASSWORD* NtOldOwfPassword, winmdroot.System.PasswordManagement.LM_OWF_PASSWORD* NtNewOwfPassword)
#cfunc global MSChapSrvChangePassword "MSChapSrvChangePassword" wstr, wstr, int, var, var, var, var

; uint MSChapSrvChangePassword2(winmdroot.Foundation.PWSTR ServerName, winmdroot.Foundation.PWSTR UserName, winmdroot.System.PasswordManagement.SAMPR_ENCRYPTED_USER_PASSWORD* NewPasswordEncryptedWithOldNt, winmdroot.System.PasswordManagement.ENCRYPTED_LM_OWF_PASSWORD* OldNtOwfPasswordEncryptedWithNewNt, winmdroot.Foundation.BOOLEAN LmPresent, winmdroot.System.PasswordManagement.SAMPR_ENCRYPTED_USER_PASSWORD* NewPasswordEncryptedWithOldLm, winmdroot.System.PasswordManagement.ENCRYPTED_LM_OWF_PASSWORD* OldLmOwfPasswordEncryptedWithNewLmOrNt)
#cfunc global MSChapSrvChangePassword2 "MSChapSrvChangePassword2" wstr, wstr, var, var, int, var, var

; winmdroot.Foundation.BOOL MakeAbsoluteSD(winmdroot.Security.PSECURITY_DESCRIPTOR pSelfRelativeSecurityDescriptor, winmdroot.Security.PSECURITY_DESCRIPTOR pAbsoluteSecurityDescriptor, uint* lpdwAbsoluteSecurityDescriptorSize, [Optional] winmdroot.Security.ACL* pDacl, uint* lpdwDaclSize, [Optional] winmdroot.Security.ACL* pSacl, uint* lpdwSaclSize, winmdroot.Security.PSID pOwner, uint* lpdwOwnerSize, winmdroot.Security.PSID pPrimaryGroup, uint* lpdwPrimaryGroupSize)
#cfunc global MakeAbsoluteSD "MakeAbsoluteSD" int, int, var, var, var, var, var, int, var, int, var

; winmdroot.Foundation.BOOL MakeSelfRelativeSD(winmdroot.Security.PSECURITY_DESCRIPTOR pAbsoluteSecurityDescriptor, winmdroot.Security.PSECURITY_DESCRIPTOR pSelfRelativeSecurityDescriptor, uint* lpdwBufferLength)
#cfunc global MakeSelfRelativeSD "MakeSelfRelativeSD" int, int, var

; void MapGenericMask(uint* AccessMask, winmdroot.Security.GENERIC_MAPPING* GenericMapping)
#func global MapGenericMask "MapGenericMask" var, var

; winmdroot.Foundation.BOOL NotifyBootConfigStatus(winmdroot.Foundation.BOOL BootAcceptable)
#cfunc global NotifyBootConfigStatus "NotifyBootConfigStatus" int

; winmdroot.Foundation.BOOL NotifyChangeEventLog(winmdroot.Foundation.HANDLE hEventLog, winmdroot.Foundation.HANDLE hEvent)
#cfunc global NotifyChangeEventLog "NotifyChangeEventLog" intptr, intptr

; uint NotifyServiceStatusChangeW(winmdroot.System.Services.SC_HANDLE hService, winmdroot.System.Services.SERVICE_NOTIFY dwNotifyMask, winmdroot.System.Services.SERVICE_NOTIFY_2W* pNotifyBuffer)
#cfunc global NotifyServiceStatusChangeW "NotifyServiceStatusChangeW" intptr, int, var

; winmdroot.Foundation.BOOL ObjectCloseAuditAlarmW(winmdroot.Foundation.PCWSTR SubsystemName, void* HandleId, winmdroot.Foundation.BOOL GenerateOnClose)
#cfunc global ObjectCloseAuditAlarmW "ObjectCloseAuditAlarmW" wstr, intptr, int

; winmdroot.Foundation.BOOL ObjectDeleteAuditAlarmW(winmdroot.Foundation.PCWSTR SubsystemName, void* HandleId, winmdroot.Foundation.BOOL GenerateOnClose)
#cfunc global ObjectDeleteAuditAlarmW "ObjectDeleteAuditAlarmW" wstr, intptr, int

; winmdroot.Foundation.BOOL ObjectOpenAuditAlarmW(winmdroot.Foundation.PCWSTR SubsystemName, void* HandleId, winmdroot.Foundation.PWSTR ObjectTypeName, winmdroot.Foundation.PWSTR ObjectName, winmdroot.Security.PSECURITY_DESCRIPTOR pSecurityDescriptor, winmdroot.Foundation.HANDLE ClientToken, uint DesiredAccess, uint GrantedAccess, [Optional] winmdroot.Security.PRIVILEGE_SET* Privileges, winmdroot.Foundation.BOOL ObjectCreation, winmdroot.Foundation.BOOL AccessGranted, winmdroot.Foundation.BOOL* GenerateOnClose)
#cfunc global ObjectOpenAuditAlarmW "ObjectOpenAuditAlarmW" wstr, intptr, wstr, wstr, int, intptr, int, int, var, int, int, var

; winmdroot.Foundation.BOOL ObjectPrivilegeAuditAlarmW(winmdroot.Foundation.PCWSTR SubsystemName, void* HandleId, winmdroot.Foundation.HANDLE ClientToken, uint DesiredAccess, winmdroot.Security.PRIVILEGE_SET* Privileges, winmdroot.Foundation.BOOL AccessGranted)
#cfunc global ObjectPrivilegeAuditAlarmW "ObjectPrivilegeAuditAlarmW" wstr, intptr, intptr, int, var, int

; winmdroot.Foundation.HANDLE OpenBackupEventLog(winmdroot.Foundation.PCWSTR lpUNCServerName, winmdroot.Foundation.PCWSTR lpFileName)
#cfunc global OpenBackupEventLogW "OpenBackupEventLogW" wstr, wstr

; uint OpenEncryptedFileRawW(winmdroot.Foundation.PCWSTR lpFileName, uint ulFlags, void** pvContext)
#cfunc global OpenEncryptedFileRawW "OpenEncryptedFileRawW" wstr, int, var

; winmdroot.Foundation.HANDLE OpenEventLog(winmdroot.Foundation.PCWSTR lpUNCServerName, winmdroot.Foundation.PCWSTR lpSourceName)
#cfunc global OpenEventLogW "OpenEventLogW" wstr, wstr

; winmdroot.Foundation.BOOL OpenProcessToken(winmdroot.Foundation.HANDLE ProcessHandle, winmdroot.Security.TOKEN_ACCESS_MASK DesiredAccess, winmdroot.Foundation.HANDLE* TokenHandle)
#cfunc global OpenProcessToken "OpenProcessToken" intptr, int, intptr

; winmdroot.System.Services.SC_HANDLE OpenSCManager(winmdroot.Foundation.PCWSTR lpMachineName, winmdroot.Foundation.PCWSTR lpDatabaseName, uint dwDesiredAccess)
#cfunc global OpenSCManagerW "OpenSCManagerW" wstr, wstr, int

; winmdroot.System.Services.SC_HANDLE OpenService(winmdroot.System.Services.SC_HANDLE hSCManager, winmdroot.Foundation.PCWSTR lpServiceName, uint dwDesiredAccess)
#cfunc global OpenServiceW "OpenServiceW" intptr, wstr, int

; winmdroot.Foundation.BOOL OpenThreadToken(winmdroot.Foundation.HANDLE ThreadHandle, winmdroot.Security.TOKEN_ACCESS_MASK DesiredAccess, winmdroot.Foundation.BOOL OpenAsSelf, winmdroot.Foundation.HANDLE* TokenHandle)
#cfunc global OpenThreadToken "OpenThreadToken" intptr, int, int, intptr

; void* OpenThreadWaitChainSession(winmdroot.System.Diagnostics.Debug.OPEN_THREAD_WAIT_CHAIN_SESSION_FLAGS Flags, delegate *unmanaged[Stdcall]<void*,nuint,uint,uint*,global::Windows.Win32.System.Diagnostics.Debug.WAITCHAIN_NODE_INFO*,global::Windows.Win32.Foundation.BOOL*,void> callback)
#cfunc global OpenThreadWaitChainSession "OpenThreadWaitChainSession" int, int

; winmdroot.System.Diagnostics.Etw.PROCESSTRACE_HANDLE OpenTrace(winmdroot.System.Diagnostics.Etw.EVENT_TRACE_LOGFILEW* Logfile)
#cfunc global OpenTraceW "OpenTraceW" var

; winmdroot.Foundation.BOOL OperationEnd(winmdroot.Storage.OperationRecorder.OPERATION_END_PARAMETERS* OperationEndParams)
#cfunc global OperationEnd "OperationEnd" var

; winmdroot.Foundation.BOOL OperationStart(winmdroot.Storage.OperationRecorder.OPERATION_START_PARAMETERS* OperationStartParams)
#cfunc global OperationStart "OperationStart" var

; uint PerfAddCounters(winmdroot.Foundation.HANDLE hQuery, winmdroot.System.Performance.PERF_COUNTER_IDENTIFIER* pCounters, uint cbCounters)
#cfunc global PerfAddCounters "PerfAddCounters" intptr, var, int

; uint PerfCloseQueryHandle(winmdroot.Foundation.HANDLE hQuery)
#cfunc global PerfCloseQueryHandle "PerfCloseQueryHandle" intptr

; uint PerfDeleteCounters(winmdroot.Foundation.HANDLE hQuery, winmdroot.System.Performance.PERF_COUNTER_IDENTIFIER* pCounters, uint cbCounters)
#cfunc global PerfDeleteCounters "PerfDeleteCounters" intptr, var, int

; uint PerfEnumerateCounterSet(winmdroot.Foundation.PCWSTR szMachine, [Optional] global::System.Guid* pCounterSetIds, uint cCounterSetIds, uint* pcCounterSetIdsActual)
#cfunc global PerfEnumerateCounterSet "PerfEnumerateCounterSet" wstr, var, int, var

; uint PerfEnumerateCounterSetInstances(winmdroot.Foundation.PCWSTR szMachine, global::System.Guid* pCounterSetId, [Optional] winmdroot.System.Performance.PERF_INSTANCE_HEADER* pInstances, uint cbInstances, uint* pcbInstancesActual)
#cfunc global PerfEnumerateCounterSetInstances "PerfEnumerateCounterSetInstances" wstr, var, var, int, var

; uint PerfOpenQueryHandle(winmdroot.Foundation.PCWSTR szMachine, winmdroot.Foundation.HANDLE* phQuery)
#cfunc global PerfOpenQueryHandle "PerfOpenQueryHandle" wstr, intptr

; uint PerfQueryCounterData(winmdroot.Foundation.HANDLE hQuery, [Optional] winmdroot.System.Performance.PERF_DATA_HEADER* pCounterBlock, uint cbCounterBlock, uint* pcbCounterBlockActual)
#cfunc global PerfQueryCounterData "PerfQueryCounterData" intptr, var, int, var

; uint PerfQueryCounterInfo(winmdroot.Foundation.HANDLE hQuery, [Optional] winmdroot.System.Performance.PERF_COUNTER_IDENTIFIER* pCounters, uint cbCounters, uint* pcbCountersActual)
#cfunc global PerfQueryCounterInfo "PerfQueryCounterInfo" intptr, var, int, var

; uint PerfQueryCounterSetRegistrationInfo(winmdroot.Foundation.PCWSTR szMachine, global::System.Guid* pCounterSetId, winmdroot.System.Performance.PerfRegInfoType requestCode, uint requestLangId, [Optional] byte* pbRegInfo, uint cbRegInfo, uint* pcbRegInfoActual)
#cfunc global PerfQueryCounterSetRegistrationInfo "PerfQueryCounterSetRegistrationInfo" wstr, var, int, int, var, int, var

; winmdroot.Foundation.BOOL PrivilegeCheck(winmdroot.Foundation.HANDLE ClientToken, winmdroot.Security.PRIVILEGE_SET* RequiredPrivileges, winmdroot.Foundation.BOOL* pfResult)
#cfunc global PrivilegeCheck "PrivilegeCheck" intptr, var, var

; winmdroot.Foundation.BOOL PrivilegedServiceAuditAlarmW(winmdroot.Foundation.PCWSTR SubsystemName, winmdroot.Foundation.PCWSTR ServiceName, winmdroot.Foundation.HANDLE ClientToken, winmdroot.Security.PRIVILEGE_SET* Privileges, winmdroot.Foundation.BOOL AccessGranted)
#cfunc global PrivilegedServiceAuditAlarmW "PrivilegedServiceAuditAlarmW" wstr, wstr, intptr, var, int

; winmdroot.Foundation.WIN32_ERROR ProcessTrace(winmdroot.System.Diagnostics.Etw.PROCESSTRACE_HANDLE* HandleArray, uint HandleCount, [Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* StartTime, [Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* EndTime)
#cfunc global ProcessTrace "ProcessTrace" var, int, var, var

; winmdroot.Foundation.WIN32_ERROR QueryAllTracesW(winmdroot.System.Diagnostics.Etw.EVENT_TRACE_PROPERTIES** PropertyArray, uint PropertyArrayCount, uint* LoggerCount)
#cfunc global QueryAllTracesW "QueryAllTracesW" var, int, var

; uint QueryRecoveryAgentsOnEncryptedFile(winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Storage.FileSystem.ENCRYPTION_CERTIFICATE_HASH_LIST** pRecoveryAgents)
#cfunc global QueryRecoveryAgentsOnEncryptedFile "QueryRecoveryAgentsOnEncryptedFile" wstr, var

; void QuerySecurityAccessMask(winmdroot.Security.OBJECT_SECURITY_INFORMATION SecurityInformation, uint* DesiredAccess)
#func global QuerySecurityAccessMask "QuerySecurityAccessMask" int, var

; winmdroot.Foundation.BOOL QueryServiceConfig(winmdroot.System.Services.SC_HANDLE hService, [Optional] winmdroot.System.Services.QUERY_SERVICE_CONFIGW* lpServiceConfig, uint cbBufSize, uint* pcbBytesNeeded)
#cfunc global QueryServiceConfigW "QueryServiceConfigW" intptr, var, int, var

; winmdroot.Foundation.BOOL QueryServiceConfig2A(winmdroot.System.Services.SC_HANDLE hService, winmdroot.System.Services.SERVICE_CONFIG dwInfoLevel, [Optional] byte* lpBuffer, uint cbBufSize, uint* pcbBytesNeeded)
#cfunc global QueryServiceConfig2A "QueryServiceConfig2A" intptr, int, var, int, var

; winmdroot.Foundation.BOOL QueryServiceConfig2W(winmdroot.System.Services.SC_HANDLE hService, winmdroot.System.Services.SERVICE_CONFIG dwInfoLevel, [Optional] byte* lpBuffer, uint cbBufSize, uint* pcbBytesNeeded)
#cfunc global QueryServiceConfig2W "QueryServiceConfig2W" intptr, int, var, int, var

; winmdroot.Foundation.BOOL QueryServiceDynamicInformation(winmdroot.System.Services.SERVICE_STATUS_HANDLE hServiceStatus, uint dwInfoLevel, void** ppDynamicInfo)
#cfunc global QueryServiceDynamicInformation "QueryServiceDynamicInformation" intptr, int, var

; winmdroot.Foundation.BOOL QueryServiceLockStatus(winmdroot.System.Services.SC_HANDLE hSCManager, [Optional] winmdroot.System.Services.QUERY_SERVICE_LOCK_STATUSW* lpLockStatus, uint cbBufSize, uint* pcbBytesNeeded)
#cfunc global QueryServiceLockStatusW "QueryServiceLockStatusW" intptr, var, int, var

; winmdroot.Foundation.BOOL QueryServiceObjectSecurity(winmdroot.System.Services.SC_HANDLE hService, uint dwSecurityInformation, winmdroot.Security.PSECURITY_DESCRIPTOR lpSecurityDescriptor, uint cbBufSize, uint* pcbBytesNeeded)
#cfunc global QueryServiceObjectSecurity "QueryServiceObjectSecurity" intptr, int, int, int, var

; winmdroot.Foundation.BOOL QueryServiceStatus(winmdroot.System.Services.SC_HANDLE hService, winmdroot.System.Services.SERVICE_STATUS* lpServiceStatus)
#cfunc global QueryServiceStatus "QueryServiceStatus" intptr, var

; winmdroot.Foundation.BOOL QueryServiceStatusEx(winmdroot.System.Services.SC_HANDLE hService, winmdroot.System.Services.SC_STATUS_TYPE InfoLevel, [Optional] byte* lpBuffer, uint cbBufSize, uint* pcbBytesNeeded)
#cfunc global QueryServiceStatusEx "QueryServiceStatusEx" intptr, int, var, int, var

; winmdroot.Foundation.WIN32_ERROR QueryTraceW(winmdroot.System.Diagnostics.Etw.CONTROLTRACE_HANDLE TraceHandle, winmdroot.Foundation.PCWSTR InstanceName, winmdroot.System.Diagnostics.Etw.EVENT_TRACE_PROPERTIES* Properties)
#cfunc global QueryTraceW "QueryTraceW" int, wstr, var

; winmdroot.Foundation.WIN32_ERROR QueryTraceProcessingHandle(winmdroot.System.Diagnostics.Etw.PROCESSTRACE_HANDLE ProcessingHandle, winmdroot.System.Diagnostics.Etw.ETW_PROCESS_HANDLE_INFO_TYPE InformationClass, [Optional] void* InBuffer, uint InBufferSize, [Optional] void* OutBuffer, uint OutBufferSize, uint* ReturnLength)
#cfunc global QueryTraceProcessingHandle "QueryTraceProcessingHandle" int, int, intptr, int, intptr, int, var

; uint QueryUsersOnEncryptedFile(winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Storage.FileSystem.ENCRYPTION_CERTIFICATE_HASH_LIST** pUsers)
#cfunc global QueryUsersOnEncryptedFile "QueryUsersOnEncryptedFile" wstr, var

; uint ReadEncryptedFileRaw(delegate *unmanaged[Stdcall]<byte*,void*,uint,uint> pfExportCallback, [Optional] void* pvCallbackContext, void* pvContext)
#cfunc global ReadEncryptedFileRaw "ReadEncryptedFileRaw" int, intptr, intptr

; winmdroot.Foundation.BOOL ReadEventLog(winmdroot.Foundation.HANDLE hEventLog, winmdroot.System.EventLog.READ_EVENT_LOG_READ_FLAGS dwReadFlags, uint dwRecordOffset, void* lpBuffer, uint nNumberOfBytesToRead, uint* pnBytesRead, uint* pnMinNumberOfBytesNeeded)
#cfunc global ReadEventLogW "ReadEventLogW" intptr, int, int, intptr, int, var, var

; winmdroot.Foundation.WIN32_ERROR RegConnectRegistryW(winmdroot.Foundation.PCWSTR lpMachineName, winmdroot.System.Registry.HKEY hKey, winmdroot.System.Registry.HKEY* phkResult)
#cfunc global RegConnectRegistryW "RegConnectRegistryW" wstr, intptr, intptr

; int RegConnectRegistryExW(winmdroot.Foundation.PCWSTR lpMachineName, winmdroot.System.Registry.HKEY hKey, uint Flags, winmdroot.System.Registry.HKEY* phkResult)
#cfunc global RegConnectRegistryExW "RegConnectRegistryExW" wstr, intptr, int, intptr

; winmdroot.Foundation.WIN32_ERROR RegCreateKeyW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpSubKey, winmdroot.System.Registry.HKEY* phkResult)
#cfunc global RegCreateKeyW "RegCreateKeyW" intptr, wstr, intptr

; winmdroot.Foundation.WIN32_ERROR RegCreateKeyTransactedW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpSubKey, uint Reserved, winmdroot.Foundation.PWSTR lpClass, winmdroot.System.Registry.REG_OPEN_CREATE_OPTIONS dwOptions, winmdroot.System.Registry.REG_SAM_FLAGS samDesired, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes, winmdroot.System.Registry.HKEY* phkResult, [Optional] winmdroot.System.Registry.REG_CREATE_KEY_DISPOSITION* lpdwDisposition, winmdroot.Foundation.HANDLE hTransaction, [Optional] void* pExtendedParemeter)
#cfunc global RegCreateKeyTransactedW "RegCreateKeyTransactedW" intptr, wstr, int, wstr, int, int, var, intptr, var, intptr, intptr

; winmdroot.Foundation.WIN32_ERROR RegDeleteKeyW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpSubKey)
#cfunc global RegDeleteKeyW "RegDeleteKeyW" intptr, wstr

; winmdroot.Foundation.WIN32_ERROR RegDeleteKeyTransactedW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpSubKey, uint samDesired, uint Reserved, winmdroot.Foundation.HANDLE hTransaction, [Optional] void* pExtendedParameter)
#cfunc global RegDeleteKeyTransactedW "RegDeleteKeyTransactedW" intptr, wstr, int, int, intptr, intptr

; winmdroot.Foundation.WIN32_ERROR RegDeleteKeyValueW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpSubKey, winmdroot.Foundation.PCWSTR lpValueName)
#cfunc global RegDeleteKeyValueW "RegDeleteKeyValueW" intptr, wstr, wstr

; winmdroot.Foundation.WIN32_ERROR RegDisablePredefinedCache()
#cfunc global RegDisablePredefinedCache "RegDisablePredefinedCache"

; winmdroot.Foundation.WIN32_ERROR RegDisableReflectionKey(winmdroot.System.Registry.HKEY hBase)
#cfunc global RegDisableReflectionKey "RegDisableReflectionKey" intptr

; winmdroot.Foundation.WIN32_ERROR RegEnableReflectionKey(winmdroot.System.Registry.HKEY hBase)
#cfunc global RegEnableReflectionKey "RegEnableReflectionKey" intptr

; winmdroot.Foundation.WIN32_ERROR RegEnumKeyW(winmdroot.System.Registry.HKEY hKey, uint dwIndex, winmdroot.Foundation.PWSTR lpName, uint cchName)
#cfunc global RegEnumKeyW "RegEnumKeyW" intptr, int, wstr, int

; winmdroot.Foundation.WIN32_ERROR RegLoadAppKeyW(winmdroot.Foundation.PCWSTR lpFile, winmdroot.System.Registry.HKEY* phkResult, uint samDesired, uint dwOptions, uint Reserved)
#cfunc global RegLoadAppKeyW "RegLoadAppKeyW" wstr, intptr, int, int, int

; winmdroot.Foundation.WIN32_ERROR RegOpenKeyW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpSubKey, winmdroot.System.Registry.HKEY* phkResult)
#cfunc global RegOpenKeyW "RegOpenKeyW" intptr, wstr, intptr

; winmdroot.Foundation.WIN32_ERROR RegOpenKeyTransactedW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpSubKey, uint ulOptions, winmdroot.System.Registry.REG_SAM_FLAGS samDesired, winmdroot.System.Registry.HKEY* phkResult, winmdroot.Foundation.HANDLE hTransaction, [Optional] void* pExtendedParemeter)
#cfunc global RegOpenKeyTransactedW "RegOpenKeyTransactedW" intptr, wstr, int, int, intptr, intptr, intptr

; winmdroot.Foundation.WIN32_ERROR RegOverridePredefKey(winmdroot.System.Registry.HKEY hKey, winmdroot.System.Registry.HKEY hNewHKey)
#cfunc global RegOverridePredefKey "RegOverridePredefKey" intptr, intptr

; winmdroot.Foundation.WIN32_ERROR RegQueryMultipleValuesW(winmdroot.System.Registry.HKEY hKey, winmdroot.System.Registry.VALENTW* val_list, uint num_vals, winmdroot.Foundation.PWSTR lpValueBuf, [Optional] uint* ldwTotsize)
#cfunc global RegQueryMultipleValuesW "RegQueryMultipleValuesW" intptr, var, int, wstr, var

; winmdroot.Foundation.WIN32_ERROR RegQueryReflectionKey(winmdroot.System.Registry.HKEY hBase, winmdroot.Foundation.BOOL* bIsReflectionDisabled)
#cfunc global RegQueryReflectionKey "RegQueryReflectionKey" intptr, var

; winmdroot.Foundation.WIN32_ERROR RegQueryValueW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpSubKey, winmdroot.Foundation.PWSTR lpData, [Optional] int* lpcbData)
#cfunc global RegQueryValueW "RegQueryValueW" intptr, wstr, wstr, var

; winmdroot.Foundation.WIN32_ERROR RegRenameKey(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpSubKeyName, winmdroot.Foundation.PCWSTR lpNewKeyName)
#cfunc global RegRenameKey "RegRenameKey" intptr, wstr, wstr

; winmdroot.Foundation.WIN32_ERROR RegReplaceKeyW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpSubKey, winmdroot.Foundation.PCWSTR lpNewFile, winmdroot.Foundation.PCWSTR lpOldFile)
#cfunc global RegReplaceKeyW "RegReplaceKeyW" intptr, wstr, wstr, wstr

; winmdroot.Foundation.WIN32_ERROR RegSaveKeyW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpFile, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes)
#cfunc global RegSaveKeyW "RegSaveKeyW" intptr, wstr, var

; winmdroot.Foundation.WIN32_ERROR RegSetKeyValueW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpSubKey, winmdroot.Foundation.PCWSTR lpValueName, uint dwType, [Optional] void* lpData, uint cbData)
#cfunc global RegSetKeyValueW "RegSetKeyValueW" intptr, wstr, wstr, int, intptr, int

; winmdroot.Foundation.WIN32_ERROR RegSetValueW(winmdroot.System.Registry.HKEY hKey, winmdroot.Foundation.PCWSTR lpSubKey, winmdroot.System.Registry.REG_VALUE_TYPE dwType, winmdroot.Foundation.PCWSTR lpData, uint cbData)
#cfunc global RegSetValueW "RegSetValueW" intptr, wstr, int, wstr, int

; winmdroot.Foundation.HANDLE RegisterEventSource(winmdroot.Foundation.PCWSTR lpUNCServerName, winmdroot.Foundation.PCWSTR lpSourceName)
#cfunc global RegisterEventSourceW "RegisterEventSourceW" wstr, wstr

; winmdroot.System.Services.SERVICE_STATUS_HANDLE RegisterServiceCtrlHandler(winmdroot.Foundation.PCWSTR lpServiceName, delegate *unmanaged[Stdcall]<uint,void> lpHandlerProc)
#cfunc global RegisterServiceCtrlHandlerW "RegisterServiceCtrlHandlerW" wstr, int

; winmdroot.System.Services.SERVICE_STATUS_HANDLE RegisterServiceCtrlHandlerEx(winmdroot.Foundation.PCWSTR lpServiceName, delegate *unmanaged[Stdcall]<uint,uint,void*,void*,uint> lpHandlerProc, [Optional] void* lpContext)
#cfunc global RegisterServiceCtrlHandlerExW "RegisterServiceCtrlHandlerExW" wstr, int, intptr

; void RegisterWaitChainCOMCallback(delegate *unmanaged[Stdcall]<int,uint*,global::Windows.Win32.Foundation.HRESULT> CallStateCallback, delegate *unmanaged[Stdcall]<global::System.Guid,uint,uint*,global::Windows.Win32.Foundation.HRESULT> ActivationStateCallback)
#func global RegisterWaitChainCOMCallback "RegisterWaitChainCOMCallback" int, int

; uint RemoveUsersFromEncryptedFile(winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Storage.FileSystem.ENCRYPTION_CERTIFICATE_HASH_LIST* pHashes)
#cfunc global RemoveUsersFromEncryptedFile "RemoveUsersFromEncryptedFile" wstr, var

; winmdroot.Foundation.BOOL ReportEvent(winmdroot.Foundation.HANDLE hEventLog, winmdroot.System.EventLog.REPORT_EVENT_TYPE wType, ushort wCategory, uint dwEventID, winmdroot.Security.PSID lpUserSid, ushort wNumStrings, uint dwDataSize, [Optional] winmdroot.Foundation.PCWSTR* lpStrings, [Optional] void* lpRawData)
#cfunc global ReportEventW "ReportEventW" intptr, int, int, int, int, int, int, var, intptr

; winmdroot.Foundation.BOOL RevertToSelf()
#cfunc global RevertToSelf "RevertToSelf"

; winmdroot.Foundation.BOOL SaferCloseLevel(winmdroot.Security.SAFER_LEVEL_HANDLE hLevelHandle)
#cfunc global SaferCloseLevel "SaferCloseLevel" intptr

; winmdroot.Foundation.BOOL SaferComputeTokenFromLevel(winmdroot.Security.SAFER_LEVEL_HANDLE LevelHandle, winmdroot.Foundation.HANDLE InAccessToken, winmdroot.Foundation.HANDLE* OutAccessToken, winmdroot.Security.AppLocker.SAFER_COMPUTE_TOKEN_FROM_LEVEL_FLAGS dwFlags, [Optional] void* lpReserved)
#cfunc global SaferComputeTokenFromLevel "SaferComputeTokenFromLevel" intptr, intptr, intptr, int, intptr

; winmdroot.Foundation.BOOL SaferCreateLevel(uint dwScopeId, uint dwLevelId, uint OpenFlags, winmdroot.Security.SAFER_LEVEL_HANDLE* pLevelHandle, [Optional] void* lpReserved)
#cfunc global SaferCreateLevel "SaferCreateLevel" int, int, int, intptr, intptr

; winmdroot.Foundation.BOOL SaferGetLevelInformation(winmdroot.Security.SAFER_LEVEL_HANDLE LevelHandle, winmdroot.Security.AppLocker.SAFER_OBJECT_INFO_CLASS dwInfoType, [Optional] void* lpQueryBuffer, uint dwInBufferSize, uint* lpdwOutBufferSize)
#cfunc global SaferGetLevelInformation "SaferGetLevelInformation" intptr, int, intptr, int, var

; winmdroot.Foundation.BOOL SaferGetPolicyInformation(uint dwScopeId, winmdroot.Security.AppLocker.SAFER_POLICY_INFO_CLASS SaferPolicyInfoClass, uint InfoBufferSize, void* InfoBuffer, uint* InfoBufferRetSize, [Optional] void* lpReserved)
#cfunc global SaferGetPolicyInformation "SaferGetPolicyInformation" int, int, int, intptr, var, intptr

; winmdroot.Foundation.BOOL SaferIdentifyLevel(uint dwNumProperties, [Optional] winmdroot.Security.AppLocker.SAFER_CODE_PROPERTIES_V2* pCodeProperties, winmdroot.Security.SAFER_LEVEL_HANDLE* pLevelHandle, [Optional] void* lpReserved)
#cfunc global SaferIdentifyLevel "SaferIdentifyLevel" int, var, intptr, intptr

; winmdroot.Foundation.BOOL SaferRecordEventLogEntry(winmdroot.Security.SAFER_LEVEL_HANDLE hLevel, winmdroot.Foundation.PCWSTR szTargetPath, [Optional] void* lpReserved)
#cfunc global SaferRecordEventLogEntry "SaferRecordEventLogEntry" intptr, wstr, intptr

; winmdroot.Foundation.BOOL SaferSetLevelInformation(winmdroot.Security.SAFER_LEVEL_HANDLE LevelHandle, winmdroot.Security.AppLocker.SAFER_OBJECT_INFO_CLASS dwInfoType, void* lpQueryBuffer, uint dwInBufferSize)
#cfunc global SaferSetLevelInformation "SaferSetLevelInformation" intptr, int, intptr, int

; winmdroot.Foundation.BOOL SaferSetPolicyInformation(uint dwScopeId, winmdroot.Security.AppLocker.SAFER_POLICY_INFO_CLASS SaferPolicyInfoClass, uint InfoBufferSize, void* InfoBuffer, [Optional] void* lpReserved)
#cfunc global SaferSetPolicyInformation "SaferSetPolicyInformation" int, int, int, intptr, intptr

; winmdroot.Foundation.BOOL SaferiIsExecutableFileType(winmdroot.Foundation.PCWSTR szFullPathname, winmdroot.Foundation.BOOLEAN bFromShellExecute)
#cfunc global SaferiIsExecutableFileType "SaferiIsExecutableFileType" wstr, int

; winmdroot.Foundation.BOOL SetAclInformation(winmdroot.Security.ACL* pAcl, void* pAclInformation, uint nAclInformationLength, winmdroot.Security.ACL_INFORMATION_CLASS dwAclInformationClass)
#cfunc global SetAclInformation "SetAclInformation" var, intptr, int, int

; uint SetEncryptedFileMetadata(winmdroot.Foundation.PCWSTR lpFileName, [Optional] byte* pbOldMetadata, byte* pbNewMetadata, winmdroot.Storage.FileSystem.ENCRYPTION_CERTIFICATE_HASH* pOwnerHash, uint dwOperation, [Optional] winmdroot.Storage.FileSystem.ENCRYPTION_CERTIFICATE_HASH_LIST* pCertificatesAdded)
#cfunc global SetEncryptedFileMetadata "SetEncryptedFileMetadata" wstr, var, var, var, int, var

; winmdroot.Foundation.WIN32_ERROR SetEntriesInAclW(uint cCountOfExplicitEntries, [Optional] winmdroot.Security.Authorization.EXPLICIT_ACCESS_W* pListOfExplicitEntries, [Optional] winmdroot.Security.ACL* OldAcl, winmdroot.Security.ACL** NewAcl)
#cfunc global SetEntriesInAclW "SetEntriesInAclW" int, var, var, var

; winmdroot.Foundation.BOOL SetFileSecurityW(winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Security.OBJECT_SECURITY_INFORMATION SecurityInformation, winmdroot.Security.PSECURITY_DESCRIPTOR pSecurityDescriptor)
#cfunc global SetFileSecurityW "SetFileSecurityW" wstr, int, int

; winmdroot.Foundation.BOOL SetKernelObjectSecurity(winmdroot.Foundation.HANDLE Handle, winmdroot.Security.OBJECT_SECURITY_INFORMATION SecurityInformation, winmdroot.Security.PSECURITY_DESCRIPTOR SecurityDescriptor)
#cfunc global SetKernelObjectSecurity "SetKernelObjectSecurity" intptr, int, int

; winmdroot.Foundation.WIN32_ERROR SetNamedSecurityInfoW(winmdroot.Foundation.PWSTR pObjectName, winmdroot.Security.Authorization.SE_OBJECT_TYPE ObjectType, winmdroot.Security.OBJECT_SECURITY_INFORMATION SecurityInfo, winmdroot.Security.PSID psidOwner, winmdroot.Security.PSID psidGroup, [Optional] winmdroot.Security.ACL* pDacl, [Optional] winmdroot.Security.ACL* pSacl)
#cfunc global SetNamedSecurityInfoW "SetNamedSecurityInfoW" wstr, int, int, int, int, var, var

; winmdroot.Foundation.BOOL SetPrivateObjectSecurity(winmdroot.Security.OBJECT_SECURITY_INFORMATION SecurityInformation, winmdroot.Security.PSECURITY_DESCRIPTOR ModificationDescriptor, winmdroot.Security.PSECURITY_DESCRIPTOR* ObjectsSecurityDescriptor, winmdroot.Security.GENERIC_MAPPING* GenericMapping, winmdroot.Foundation.HANDLE Token)
#cfunc global SetPrivateObjectSecurity "SetPrivateObjectSecurity" int, int, var, var, intptr

; winmdroot.Foundation.BOOL SetPrivateObjectSecurityEx(winmdroot.Security.OBJECT_SECURITY_INFORMATION SecurityInformation, winmdroot.Security.PSECURITY_DESCRIPTOR ModificationDescriptor, winmdroot.Security.PSECURITY_DESCRIPTOR* ObjectsSecurityDescriptor, winmdroot.Security.SECURITY_AUTO_INHERIT_FLAGS AutoInheritFlags, winmdroot.Security.GENERIC_MAPPING* GenericMapping, winmdroot.Foundation.HANDLE Token)
#cfunc global SetPrivateObjectSecurityEx "SetPrivateObjectSecurityEx" int, int, var, int, var, intptr

; void SetSecurityAccessMask(winmdroot.Security.OBJECT_SECURITY_INFORMATION SecurityInformation, uint* DesiredAccess)
#func global SetSecurityAccessMask "SetSecurityAccessMask" int, var

; winmdroot.Foundation.BOOL SetSecurityDescriptorControl(winmdroot.Security.PSECURITY_DESCRIPTOR pSecurityDescriptor, winmdroot.Security.SECURITY_DESCRIPTOR_CONTROL ControlBitsOfInterest, winmdroot.Security.SECURITY_DESCRIPTOR_CONTROL ControlBitsToSet)
#cfunc global SetSecurityDescriptorControl "SetSecurityDescriptorControl" int, int, int

; winmdroot.Foundation.BOOL SetSecurityDescriptorDacl(winmdroot.Security.PSECURITY_DESCRIPTOR pSecurityDescriptor, winmdroot.Foundation.BOOL bDaclPresent, [Optional] winmdroot.Security.ACL* pDacl, winmdroot.Foundation.BOOL bDaclDefaulted)
#cfunc global SetSecurityDescriptorDacl "SetSecurityDescriptorDacl" int, int, var, int

; winmdroot.Foundation.BOOL SetSecurityDescriptorGroup(winmdroot.Security.PSECURITY_DESCRIPTOR pSecurityDescriptor, winmdroot.Security.PSID pGroup, winmdroot.Foundation.BOOL bGroupDefaulted)
#cfunc global SetSecurityDescriptorGroup "SetSecurityDescriptorGroup" int, int, int

; winmdroot.Foundation.BOOL SetSecurityDescriptorOwner(winmdroot.Security.PSECURITY_DESCRIPTOR pSecurityDescriptor, winmdroot.Security.PSID pOwner, winmdroot.Foundation.BOOL bOwnerDefaulted)
#cfunc global SetSecurityDescriptorOwner "SetSecurityDescriptorOwner" int, int, int

; uint SetSecurityDescriptorRMControl(winmdroot.Security.PSECURITY_DESCRIPTOR SecurityDescriptor, [Optional] byte* RMControl)
#cfunc global SetSecurityDescriptorRMControl "SetSecurityDescriptorRMControl" int, var

; winmdroot.Foundation.BOOL SetSecurityDescriptorSacl(winmdroot.Security.PSECURITY_DESCRIPTOR pSecurityDescriptor, winmdroot.Foundation.BOOL bSaclPresent, [Optional] winmdroot.Security.ACL* pSacl, winmdroot.Foundation.BOOL bSaclDefaulted)
#cfunc global SetSecurityDescriptorSacl "SetSecurityDescriptorSacl" int, int, var, int

; winmdroot.Foundation.WIN32_ERROR SetSecurityInfo(winmdroot.Foundation.HANDLE handle, winmdroot.Security.Authorization.SE_OBJECT_TYPE ObjectType, winmdroot.Security.OBJECT_SECURITY_INFORMATION SecurityInfo, winmdroot.Security.PSID psidOwner, winmdroot.Security.PSID psidGroup, [Optional] winmdroot.Security.ACL* pDacl, [Optional] winmdroot.Security.ACL* pSacl)
#cfunc global SetSecurityInfo "SetSecurityInfo" intptr, int, int, int, int, var, var

; winmdroot.Foundation.BOOL SetServiceBits(winmdroot.System.Services.SERVICE_STATUS_HANDLE hServiceStatus, uint dwServiceBits, winmdroot.Foundation.BOOL bSetBitsOn, winmdroot.Foundation.BOOL bUpdateImmediately)
#cfunc global SetServiceBits "SetServiceBits" intptr, int, int, int

; winmdroot.Foundation.BOOL SetServiceObjectSecurity(winmdroot.System.Services.SC_HANDLE hService, winmdroot.Security.OBJECT_SECURITY_INFORMATION dwSecurityInformation, winmdroot.Security.PSECURITY_DESCRIPTOR lpSecurityDescriptor)
#cfunc global SetServiceObjectSecurity "SetServiceObjectSecurity" intptr, int, int

; winmdroot.Foundation.BOOL SetServiceStatus(winmdroot.System.Services.SERVICE_STATUS_HANDLE hServiceStatus, winmdroot.System.Services.SERVICE_STATUS* lpServiceStatus)
#cfunc global SetServiceStatus "SetServiceStatus" intptr, var

; winmdroot.Foundation.BOOL SetThreadToken([Optional] winmdroot.Foundation.HANDLE* Thread, winmdroot.Foundation.HANDLE Token)
#cfunc global SetThreadToken "SetThreadToken" intptr, intptr

; winmdroot.Foundation.BOOL SetTokenInformation(winmdroot.Foundation.HANDLE TokenHandle, winmdroot.Security.TOKEN_INFORMATION_CLASS TokenInformationClass, void* TokenInformation, uint TokenInformationLength)
#cfunc global SetTokenInformation "SetTokenInformation" intptr, int, intptr, int

; uint SetUserFileEncryptionKey([Optional] winmdroot.Storage.FileSystem.ENCRYPTION_CERTIFICATE* pEncryptionCertificate)
#cfunc global SetUserFileEncryptionKey "SetUserFileEncryptionKey" var

; uint SetUserFileEncryptionKeyEx([Optional] winmdroot.Storage.FileSystem.ENCRYPTION_CERTIFICATE* pEncryptionCertificate, uint dwCapabilities, uint dwFlags, [Optional] void* pvReserved)
#cfunc global SetUserFileEncryptionKeyEx "SetUserFileEncryptionKeyEx" var, int, int, intptr

; winmdroot.Foundation.BOOL StartService(winmdroot.System.Services.SC_HANDLE hService, uint dwNumServiceArgs, [Optional] winmdroot.Foundation.PCWSTR* lpServiceArgVectors)
#cfunc global StartServiceW "StartServiceW" intptr, int, var

; winmdroot.Foundation.BOOL StartServiceCtrlDispatcher(winmdroot.System.Services.SERVICE_TABLE_ENTRYW* lpServiceStartTable)
#cfunc global StartServiceCtrlDispatcherW "StartServiceCtrlDispatcherW" var

; winmdroot.Foundation.WIN32_ERROR StartTraceW(winmdroot.System.Diagnostics.Etw.CONTROLTRACE_HANDLE* TraceHandle, winmdroot.Foundation.PCWSTR InstanceName, winmdroot.System.Diagnostics.Etw.EVENT_TRACE_PROPERTIES* Properties)
#cfunc global StartTraceW "StartTraceW" var, wstr, var

; winmdroot.Foundation.WIN32_ERROR StopTraceW(winmdroot.System.Diagnostics.Etw.CONTROLTRACE_HANDLE TraceHandle, winmdroot.Foundation.PCWSTR InstanceName, winmdroot.System.Diagnostics.Etw.EVENT_TRACE_PROPERTIES* Properties)
#cfunc global StopTraceW "StopTraceW" int, wstr, var

; winmdroot.Foundation.WIN32_ERROR TraceSetInformation(winmdroot.System.Diagnostics.Etw.CONTROLTRACE_HANDLE SessionHandle, winmdroot.System.Diagnostics.Etw.TRACE_QUERY_INFO_CLASS InformationClass, void* TraceInformation, uint InformationLength)
#cfunc global TraceSetInformation "TraceSetInformation" int, int, intptr, int

; winmdroot.Foundation.WIN32_ERROR TreeResetNamedSecurityInfoW(winmdroot.Foundation.PWSTR pObjectName, winmdroot.Security.Authorization.SE_OBJECT_TYPE ObjectType, winmdroot.Security.OBJECT_SECURITY_INFORMATION SecurityInfo, winmdroot.Security.PSID pOwner, winmdroot.Security.PSID pGroup, [Optional] winmdroot.Security.ACL* pDacl, [Optional] winmdroot.Security.ACL* pSacl, winmdroot.Foundation.BOOL KeepExplicit, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,uint,global::Windows.Win32.Security.Authorization.PROG_INVOKE_SETTING*,void*,global::Windows.Win32.Foundation.BOOL,void> fnProgress, winmdroot.Security.Authorization.PROG_INVOKE_SETTING ProgressInvokeSetting, [Optional] void* Args)
#cfunc global TreeResetNamedSecurityInfoW "TreeResetNamedSecurityInfoW" wstr, int, int, int, int, var, var, int, int, int, intptr

; winmdroot.Foundation.WIN32_ERROR TreeSetNamedSecurityInfoW(winmdroot.Foundation.PWSTR pObjectName, winmdroot.Security.Authorization.SE_OBJECT_TYPE ObjectType, winmdroot.Security.OBJECT_SECURITY_INFORMATION SecurityInfo, winmdroot.Security.PSID pOwner, winmdroot.Security.PSID pGroup, [Optional] winmdroot.Security.ACL* pDacl, [Optional] winmdroot.Security.ACL* pSacl, winmdroot.Security.Authorization.TREE_SEC_INFO dwAction, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,uint,global::Windows.Win32.Security.Authorization.PROG_INVOKE_SETTING*,void*,global::Windows.Win32.Foundation.BOOL,void> fnProgress, winmdroot.Security.Authorization.PROG_INVOKE_SETTING ProgressInvokeSetting, [Optional] void* Args)
#cfunc global TreeSetNamedSecurityInfoW "TreeSetNamedSecurityInfoW" wstr, int, int, int, int, var, var, int, int, int, intptr

; uint UninstallApplication(winmdroot.Foundation.PWSTR ProductCode, uint dwStatus)
#cfunc global UninstallApplication "UninstallApplication" wstr, int

; winmdroot.Foundation.BOOL UnlockServiceDatabase(void* ScLock)
#cfunc global UnlockServiceDatabase "UnlockServiceDatabase" intptr

; winmdroot.Foundation.WIN32_ERROR UpdateTraceW(winmdroot.System.Diagnostics.Etw.CONTROLTRACE_HANDLE TraceHandle, winmdroot.Foundation.PCWSTR InstanceName, winmdroot.System.Diagnostics.Etw.EVENT_TRACE_PROPERTIES* Properties)
#cfunc global UpdateTraceW "UpdateTraceW" int, wstr, var

; uint WaitServiceState(winmdroot.System.Services.SC_HANDLE hService, uint dwNotify, uint dwTimeout, winmdroot.Foundation.HANDLE hCancelEvent)
#cfunc global WaitServiceState "WaitServiceState" intptr, int, int, intptr

; uint WriteEncryptedFileRaw(delegate *unmanaged[Stdcall]<byte*,void*,uint*,uint> pfImportCallback, [Optional] void* pvCallbackContext, void* pvContext)
#cfunc global WriteEncryptedFileRaw "WriteEncryptedFileRaw" int, intptr, intptr

#endif
