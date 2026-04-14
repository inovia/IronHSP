; ============================================================
;   userenv.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
CreateAppContainerProfile
Creates a per-user, per-app profile for Windows Store apps.
%group
Win32 userenv
%prm
pszAppContainerName, pszDisplayName, pszDescription, pCapabilities, dwCapabilityCount, ppSidAppContainerSid
pszAppContainerName : [wstr] The name of the app container. To ensure uniqueness, it is recommended that this string contains the app name as well as the publisher. This string can be up to 64 characters in length.  Further, it must fit into the pattern described by the regular expression "[-_. A-Za-z0-9]+".
pszDisplayName : [wstr] The display name. This string can be up to 512 characters in length.
pszDescription : [wstr] A description for the app container. This string can be up to 2048 characters in length.
pCapabilities : [var] The SIDs that define the requested capabilities.
dwCapabilityCount : [int] The number of SIDs in pCapabilities.
ppSidAppContainerSid : [var] The SID for the profile. This buffer must be freed using the FreeSid function.
%inst
Creates a per-user, per-app profile for Windows Store apps.

[戻り値]
If this function succeeds, it returns a standard HRESULT code,
including the following:
This doc was truncated.

[備考]
A profile contains folders and registry storage that are per-user and
per-app. The folders have ACLs that prevent them from being accessed
by other users and apps. These folders can be accessed by calling
SHGetKnownFolderPath. The function creates a profile for the current
user. To create a profile on behalf of another user, you must
impersonate that user. To create profiles for multiple users of the
same app, you must call CreateAppContainerProfile for each user.


%index
CreateEnvironmentBlock
指定ユーザーの環境変数を取得する。このブロックは CreateProcessAsUser に渡せる。
%group
Win32 userenv
%prm
lpEnvironment, hToken, bInherit
lpEnvironment : [var] 型: LPVOID* 関数復帰時、新しい環境ブロックへのポインタを受け取る。環境ブロックは NULL 終端 Unicode 文字列の配列で、2 つの NULL (\0\0) で終わる。
hToken : [intptr] 型: HANDLE ユーザーのトークン。LogonUser などで取得する。プライマリトークンの場合は TOKEN_QUERY および TOKEN_DUPLICATE アクセスが必要。インパーソネーショントークンなら TOKEN_QUERY のみでよい。
bInherit : [int] 型: BOOL 現プロセスの環境を継承するか。TRUE で継承、FALSE で非継承。
%inst
指定ユーザーの環境変数を取得する。このブロックは CreateProcessAsUser に渡せる。

[戻り値]
型: BOOL 成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。

[備考]
使用後は DestroyEnvironmentBlock でバッファを解放する。CreateProcessAsUser に渡す場合は
CREATE_UNICODE_ENVIRONMENT フラグを必ず指定する。CreateProcessAsUser
から復帰後、新プロセスは環境ブロックのコピーを持つため DestroyEnvironmentBlock
を安全に呼べる。%USERPROFILE% などユーザー固有変数はユーザープロファイルがロードされているときのみ設定されるため、必要なら
LoadUserProfile を呼ぶ。


%index
CreateProfile
Creates a new user profile.
%group
Win32 userenv
%prm
pszUserSid, pszUserName, pszProfilePath, cchProfilePath
pszUserSid : [wstr] Type: LPCWSTR Pointer to the SID of the user as a string.
pszUserName : [wstr] Type: LPCWSTR The user name of the new user. This name is used as the base name for the profile directory.
pszProfilePath : [wstr] Type: LPWSTR When this function returns, contains a pointer to the full path of the profile.
cchProfilePath : [int] Type: DWORD Size of the buffer pointed to by pszProfilePath, in characters.
%inst
Creates a new user profile.

[戻り値]
Type: HRESULT Returns S_OK if successful, or an error value
otherwise, including the following:
This doc was truncated.

[備考]
The caller must have administrator privileges to call this function.


%index
DeleteAppContainerProfile
Deletes the specified per-user, per-app profile.
%group
Win32 userenv
%prm
pszAppContainerName
pszAppContainerName : [wstr] The name given to the profile in the call to the CreateAppContainerProfile function. This string is at most 64 characters in length, and  fits into the pattern described by the regular expression "[-_. A-Za-z0-9]+".
%inst
Deletes the specified per-user, per-app profile.

[戻り値]
If this function succeeds, it returns a standard HRESULT code,
including the following:
This doc was truncated.

[備考]
To ensure the best results, close all file handles in the profile
storage locations before calling the DeleteAppContainerProfile
function. Otherwise, this function may not be able to completely
remove the storage locations for the profile. This function deletes
the profile for the current user. To delete the profile for another
user, you must impersonate that user. If the function fails, the
status of the profile is undetermined, and you should call
DeleteAppContainerProfile again to complete the operation.


%index
DeleteProfileW
Deletes the user profile and all user-related settings from the specified computer. The caller must have administrative privileges to delete a user's profile. (Unicode)
%group
Win32 userenv
%prm
lpSidString, lpProfilePath, lpComputerName
lpSidString : [wstr] Type: LPCTSTR Pointer to a string that specifies the user SID.
lpProfilePath : [wstr] Type: LPCTSTR Pointer to a string that specifies the profile path. If this parameter is NULL, the function obtains the path from the registry.
lpComputerName : [wstr] Type: LPCTSTR Pointer to a string that specifies the name of the computer from which the profile is to be deleted. If this parameter is NULL, the local computer name is used.
%inst
Deletes the user profile and all user-related settings from the
specified computer. The caller must have administrative privileges to
delete a user's profile. (Unicode)

[戻り値]
Type: BOOL TRUE if successful; otherwise, FALSE. To get extended
error information, call GetLastError.

[備考]
DeleteProfile might fail when passed the security identifier (SID) of
the local system account (S-1-5-18).
> [!NOTE] > The userenv.h header defines DeleteProfile as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
DeriveAppContainerSidFromAppContainerName
Gets the SID of the specified profile.
%group
Win32 userenv
%prm
pszAppContainerName, ppsidAppContainerSid
pszAppContainerName : [wstr] The name of the profile.
ppsidAppContainerSid : [var] The SID for the profile. This buffer must be freed using the FreeSid function.
%inst
Gets the SID of the specified profile.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
DeriveRestrictedAppContainerSidFromAppContainerSidAndRestrictedName
DeriveRestrictedAppContainerSidFromAppContainerSidAndRestrictedName is reserved for future use.
%group
Win32 userenv
%prm
psidAppContainerSid, pszRestrictedAppContainerName, ppsidRestrictedAppContainerSid
psidAppContainerSid : [int] Reserved.
pszRestrictedAppContainerName : [wstr] Reserved.
ppsidRestrictedAppContainerSid : [var] Reserved.
%inst
DeriveRestrictedAppContainerSidFromAppContainerSidAndRestrictedName
is reserved for future use.

[戻り値]
Reserved.


%index
DestroyEnvironmentBlock
CreateEnvironmentBlock で作成された環境変数を解放する。
%group
Win32 userenv
%prm
lpEnvironment
lpEnvironment : [intptr] 型: LPVOID CreateEnvironmentBlock で作成された環境ブロックへのポインタ。NULL 終端 Unicode 文字列の配列で、2 つの NULL (\0\0) で終わる。
%inst
CreateEnvironmentBlock で作成された環境変数を解放する。

[戻り値]
型: BOOL 成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。


%index
EnterCriticalPolicySection
The EnterCriticalPolicySection function pauses the application of policy to allow applications to safely read policy settings.
%group
Win32 userenv
%prm
bMachine
bMachine : [int] A value that specifies whether to stop the application of computer policy or user policy. If this value is TRUE, the system stops applying computer policy. If this value is FALSE, the system stops applying user policy.
%inst
The EnterCriticalPolicySection function pauses the application of
policy to allow applications to safely read policy settings.

[戻り値]
If the function succeeds, the return value is a handle to a policy
section. If the function fails, the return value is NULL. To get
extended error information, call the GetLastError function.

[備考]
The maximum amount of time an application can hold a critical section
is 10 minutes. After 10 minutes, the system releases the critical
section and policy can be applied again. To acquire both the computer
and user critical section objects, acquire the user critical section
object before acquiring the computer critical section object. This
will help prevent a deadlock situation. To close the handle, call the
LeaveCriticalPolicySection function. The policy section handle cannot
be used in any other Windows functions.


%index
ExpandEnvironmentStringsForUserW
指定ユーザー用に確立された環境ブロックを使用してソース文字列を展開する。(Unicode)
%group
Win32 userenv
%prm
hToken, lpSrc, lpDest, dwSize
hToken : [intptr] 型: HANDLE ユーザーのトークン。LogonUser、CreateRestrictedToken、DuplicateToken、OpenProcessToken、OpenThreadToken などで取得する。TOKEN_IMPERSONATE、TOKEN_QUERY、Windows 7 以降は TOKEN_DUPLICATE も必要。NULL の場合、環境ブロックはシステム変数のみを含む。
lpSrc : [wstr] 型: LPCTSTR 展開対象の NULL 終端ソース文字列へのポインタ。
lpDest : [wstr] 型: LPTSTR 展開後の文字列を受け取るバッファへのポインタ。
dwSize : [int] 型: DWORD lpDest バッファのサイズ(TCHAR 単位)。
%inst
指定ユーザー用に確立された環境ブロックを使用してソース文字列を展開する。(Unicode)

[戻り値]
型: BOOL 成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。

[備考]
ソース文字列の例は以下の通り。
（以下省略）


%index
FreeGPOListW
The FreeGPOList function frees the specified list of GPOs. (Unicode)
%group
Win32 userenv
%prm
pGPOList
pGPOList : [var] A pointer to the list of GPO structures. This list is returned by the GetGPOList or GetAppliedGPOList function. For more information, see GROUP_POLICY_OBJECT.
%inst
The FreeGPOList function frees the specified list of GPOs. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
> [!NOTE] > The userenv.h header defines FreeGPOList as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GenerateGPNotification
(no summary)
%group
Win32 userenv
%prm
bMachine, lpwszMgmtProduct, dwMgmtProductOptions
bMachine : [int] 
lpwszMgmtProduct : [wstr] 
dwMgmtProductOptions : [int] 
%inst



%index
GetAllUsersProfileDirectoryW
Retrieves the path to the root of the directory that contains program data shared by all users. (Unicode)
%group
Win32 userenv
%prm
lpProfileDir, lpcchSize
lpProfileDir : [wstr] Type: LPTSTR A pointer to a buffer that, when this function returns successfully, receives the path. Set this value to NULL to determine the required size of the buffer, including the terminating null character.
lpcchSize : [var] Type: LPDWORD A pointer to the size of the lpProfileDir buffer, in TCHARs.
%inst
Retrieves the path to the root of the directory that contains program
data shared by all users. (Unicode)

[戻り値]
Type: BOOL TRUE if successful; otherwise, FALSE. To get extended
error information, call GetLastError.

[備考]
The following is an example of the path returned by
GetAllUsersProfileDirectory in Windows XP:
This doc was truncated.


%index
GetAppContainerFolderPath
Gets the path of the local app data folder for the specified app container.
%group
Win32 userenv
%prm
pszAppContainerSid, ppszPath
pszAppContainerSid : [wstr] A pointer to the SID of the app container.
ppszPath : [var] The address of a pointer to a string that, when this function returns successfully, receives the path of the local folder. It is the responsibility of the caller to free this string when it is no longer needed by calling the CoTaskMemFree function.
%inst
Gets the path of the local app data folder for the specified app
container.

[戻り値]
This function returns an HRESULT code, including but not limited to
the following:
This doc was truncated.

[備考]
The path retrieved through this function is the same path that you
would get by calling the SHGetKnownFolderPath function with
FOLDERID_LocalAppData. If a thread token is set, this function uses
the app container for the current user. If no thread token is set,
this function uses the app container associated with the process
identity.


%index
GetAppContainerRegistryLocation
Gets the location of the registry storage associated with an app container.
%group
Win32 userenv
%prm
desiredAccess, phAppContainerKey
desiredAccess : [int] Type: REGSAM The desired registry access.
phAppContainerKey : [intptr] Type: PHKEY A pointer to an HKEY that, when this function returns successfully, receives the registry storage location for the current profile.
%inst
Gets the location of the registry storage associated with an app
container.

[戻り値]
Type: HRESULT This function returns an HRESULT code, including but
not limited to the following:
This doc was truncated.

[備考]
The function gets the registry storage for the current user. To get
the registry storage for another user, you must impersonate that
user.


%index
GetAppliedGPOListW
The GetAppliedGPOList function retrieves the list of GPOs applied for the specified user or computer. (Unicode)
%group
Win32 userenv
%prm
dwFlags, pMachineName, pSidUser, pGuidExtension, ppGPOList
dwFlags : [int] A value that specifies the policy type. This parameter can be the following value.
pMachineName : [wstr] A pointer to the name of the remote computer. The format of the name is "\\computer_name". If this parameter is NULL, the local computer name is used.
pSidUser : [int] A value that specifies the SID of the user. If pMachineName is not NULL and dwFlags specifies user policy, then pSidUser cannot be NULL. If pMachineName is NULL and pSidUser is NULL, the user is the currently logged-on user. If pMachineName is NULL and pSidUser is not NULL, the user is represented by pSidUser on the local computer. For more information, see Security Identifiers.
pGuidExtension : [var] A value that specifies the GUID of the extension.
ppGPOList : [var] A pointer that receives the list of GPO structures. For more information, see GROUP_POLICY_OBJECT.
%inst
The GetAppliedGPOList function retrieves the list of GPOs applied for
the specified user or computer. (Unicode)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS.
Otherwise, the function returns a system error code. For a complete
list of error codes, see System Error Codes or the header file
WinError.h.

[備考]
To free the GPO list when you have finished processing it, call the
FreeGPOList function.
> [!NOTE] > The userenv.h header defines GetAppliedGPOList as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetDefaultUserProfileDirectoryW
Retrieves the path to the root of the default user's profile. (Unicode)
%group
Win32 userenv
%prm
lpProfileDir, lpcchSize
lpProfileDir : [wstr] Type: LPTSTR A pointer to a buffer that, when this function returns successfully, receives the path to the default user's profile directory. Set this value to NULL to determine the required size of the buffer.
lpcchSize : [var] Type: LPDWORD Specifies the size of the lpProfileDir buffer, in TCHARs.
%inst
Retrieves the path to the root of the default user's profile.
(Unicode)

[戻り値]
Type: BOOL TRUE if successful; otherwise, FALSE. To get extended
error information, call GetLastError.

[備考]
The following is an example of the path returned by
GetDefaultUserProfileDirectory in Windows XP:
This doc was truncated.


%index
GetGPOListW
The GetGPOList function retrieves the list of GPOs for the specified user or computer. (Unicode)
%group
Win32 userenv
%prm
hToken, lpName, lpHostName, lpComputerName, dwFlags, pGPOList
hToken : [intptr] A token for the user or computer, returned from the LogonUser, CreateRestrictedToken, DuplicateToken, OpenProcessToken, or OpenThreadToken function. This token must have TOKEN_IMPERSONATE and TOKEN_QUERY access. For more information, see Access Rights for Access-Token Objects and the following Remarks section. If this parameter is NULL, you must supply values for the lpName and lpHostName parameters.
lpName : [wstr] A pointer to the user or computer name, in the fully qualified distinguished name format (for example,  "CN=user, OU=users, DC=contoso, DC=com"). If the hToken parameter is not NULL, this parameter must be NULL.
lpHostName : [wstr] A DNS domain name (preferred) or domain controller name. Domain controller name can be retrieved using the DsGetDcName function, specifying DS_DIRECTORY_SERVICE_REQUIRED in the flags parameter. If the hToken parameter is not NULL, this parameter must be NULL.
lpComputerName : [wstr] A pointer to the name of the computer used to determine the site location. The format of the name is "\\computer_name". If this parameter is NULL, the local computer name is used.
dwFlags : [int] A value that specifies additional flags that are used to control information retrieval. If you specify GPO_LIST_FLAG_MACHINE, the function retrieves policy information for the computer. If you do not specify GPO_LIST_FLAG_MACHINE, the function retrieves policy information for the user. If you specify GPO_LIST_FLAG_SITEONLY the function returns only site information for the computer or user.
pGPOList : [var] A pointer that receives the list of GPO structures. For more information, see GROUP_POLICY_OBJECT.
%inst
The GetGPOList function retrieves the list of GPOs for the specified
user or computer. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The GetGPOList function is intended for use by services acting on
behalf of a user or computer. The service calls this function to
obtain a list of GPOs, then checks each GPO for service-specific
policy. Calling this function with a token provides the most accurate
list. The system can perform access checking for the user or
computer. Calling this function with the user or computer name and
the domain controller name is faster than calling it with a token.
However, if the token is not specified, the system uses the security
access of the caller, which means that the list may not be completely
correct for the intended user or computer. To obtain the most
accurate list of GPOs for a computer when calling GetGPOList, the
caller must have read access to each OU and site in the computer
domain, and also read and apply Group Policy access to all GPOs that
are linked to the sites, domain or OUs of that domain. An example of
a caller would be a service running on the computer whose name is
specified in the lpName parameter. An alternate method of obtaining a
list of GPOs would be to call the RsopCreateSession method of the
RsopPlanningModeProvider WMI class. The method can generate resultant
policy data for a computer or user account in a hypothetical
scenario. Call the FreeGPOList function to free the GPO list when you
have finished processing it. Generally, you should call GetGPOList
with a token when retrieving a list of GPOs for a user as shown in
the following code example.
This doc was truncated.


%index
GetProfileType
Retrieves the type of profile loaded for the current user.
%group
Win32 userenv
%prm
dwFlags
dwFlags : [var] Type: DWORD*
%inst
Retrieves the type of profile loaded for the current user.

[戻り値]
Type: BOOL TRUE if successful; otherwise, FALSE. To get extended
error information, call GetLastError.

[備考]
If the user profile is not already loaded, the function fails. Note
that the caller must have KEY_READ access to HKEY_LOCAL_MACHINE. This
access right is granted by default. For more information, see
Registry Key Security and Access Rights. If the profile type is
PT_ROAMING_PREEXISTING, Explorer will not reinitialize default
programs associations when a profile is loaded on a machine for the
first time.


%index
GetProfilesDirectoryW
Retrieves the path to the root directory where user profiles are stored. (Unicode)
%group
Win32 userenv
%prm
lpProfileDir, lpcchSize
lpProfileDir : [wstr] Type: LPTSTR A pointer to a buffer that, when this function returns successfully, receives the path to the profiles directory. Set this value to NULL to determine the required size of the buffer.
lpcchSize : [var] Type: LPDWORD Specifies the size of the lpProfilesDir buffer, in TCHARs.
%inst
Retrieves the path to the root directory where user profiles are
stored. (Unicode)

[戻り値]
Type: BOOL TRUE if successful; otherwise, FALSE. To get extended
error information, call GetLastError.

[備考]
The following is an example of the path returned by
GetProfilesDirectory in Windows XP:
This doc was truncated.


%index
GetUserProfileDirectoryW
指定ユーザーのプロファイルルートディレクトリへのパスを取得する。(Unicode)
%group
Win32 userenv
%prm
hToken, lpProfileDir, lpcchSize
hToken : [intptr] 型: HANDLE ユーザーのトークン。LogonUser などで取得。TOKEN_QUERY アクセスが必要。
lpProfileDir : [wstr] 型: LPTSTR 成功時、ユーザープロファイルディレクトリへのパスを受け取るバッファへのポインタ。
lpcchSize : [var] 型: LPDWORD lpProfileDir バッファのサイズ(TCHAR 単位)。バッファが小さすぎる場合または lpProfileDir が NULL の場合、失敗し必要サイズ(終端 NULL 含む)を受け取る。
%inst
指定ユーザーのプロファイルルートディレクトリへのパスを取得する。(Unicode)

[戻り値]
型: BOOL 成功時は TRUE、失敗時は FALSE。拡張エラー情報は GetLastError で取得する。

[備考]
Windows XP では、GetUserProfileDirectory が返すパスの例は以下の通り。
（以下省略）


%index
LeaveCriticalPolicySection
The LeaveCriticalPolicySection function resumes the background application of policy. This function closes the handle to the policy section.
%group
Win32 userenv
%prm
hSection
hSection : [intptr] Handle to a policy section, which is returned by the EnterCriticalPolicySection function.
%inst
The LeaveCriticalPolicySection function resumes the background
application of policy. This function closes the handle to the policy
section.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
LoadUserProfileW
Loads the specified user's profile. The profile can be a local user profile or a roaming user profile. (Unicode)
%group
Win32 userenv
%prm
hToken, lpProfileInfo
hToken : [intptr] Type: HANDLE Token for the user, which is returned by the LogonUser, CreateRestrictedToken, DuplicateToken, OpenProcessToken, or OpenThreadToken function. The token must have TOKEN_QUERY, TOKEN_IMPERSONATE, and TOKEN_DUPLICATE access. For more information, see Access Rights for Access-Token Objects.
lpProfileInfo : [var] Type: LPPROFILEINFO Pointer to a PROFILEINFO structure. LoadUserProfile fails and returns ERROR_INVALID_PARAMETER if the dwSize member of the structure is not set to sizeof(PROFILEINFO) or if the lpUserName member is NULL. For more information, see Remarks.
%inst
Loads the specified user's profile. The profile can be a local user
profile or a roaming user profile. (Unicode)

[戻り値]
Type: BOOL TRUE if successful; otherwise, FALSE. To get extended
error information, call GetLastError.
The function fails and returns ERROR_INVALID_PARAMETER if the dwSize
member of the structure at lpProfileInfo is not set to
sizeof(PROFILEINFO) or if the lpUserName member is NULL.

[備考]
When a user logs on interactively, the system automatically loads the
user's profile. If a service or an application impersonates a user,
the system does not load the user's profile. Therefore, the service
or application should load the user's profile with LoadUserProfile.
Services and applications that call LoadUserProfile should check to
see if the user has a roaming profile. If the user has a roaming
profile, specify its path as the lpProfilePath member of PROFILEINFO.
To retrieve the user's roaming profile path, you can call the
NetUserGetInfo function, specifying information level 3 or 4. Upon
successful return, the hProfile member of PROFILEINFO is a registry
key handle opened to the root of the user's hive. It has been opened
with full access (KEY_ALL_ACCESS). If a service that is impersonating
a user needs to read or write to the user's registry file, use this
handle instead of HKEY_CURRENT_USER. Do not close the hProfile
handle. Instead, pass it to the UnloadUserProfile function. This
function closes the handle. You should ensure that all handles to
keys in the user's registry hive are closed. If you do not close all
open registry handles, the user's profile fails to unload. For more
information, see Registry Key Security and Access Rights and Registry
Hives. Note that it is your responsibility to load the user's
registry hive into the HKEY_USERS registry key with the
LoadUserProfile function before you call CreateProcessAsUser. This is
because CreateProcessAsUser does not load the specified user's
profile into HKEY_USERS. This means that access to information in the
HKEY_CURRENT_USER registry key may not produce results consistent
with a normal interactive logon. The calling process must have the
SE_RESTORE_NAME and SE_BACKUP_NAME privileges. For more information,
see Running with Special Privileges. Starting with Windows XP Service
Pack 2 (SP2) and Windows Server 2003, the caller must be an
administrator or the LocalSystem account. It is not sufficient for
the caller to merely impersonate the administrator or LocalSystem
account.
> [!NOTE] > The userenv.h header defines LoadUserProfile as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ProcessGroupPolicyCompleted
The ProcessGroupPolicyCompleted function notifies the system that the specified extension has finished applying policy.
%group
Win32 userenv
%prm
extensionId, pAsyncHandle, dwStatus
extensionId : [var] Specifies the unique GUID that identifies the extension.
pAsyncHandle : [int] Asynchronous completion handle. This handle is passed to the ProcessGroupPolicy function.
dwStatus : [int] Specifies the completion status of asynchronous processing.
%inst
The ProcessGroupPolicyCompleted function notifies the system that the
specified extension has finished applying policy.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS.
Otherwise, the function returns one of the system error codes. For a
complete list of error codes, see System Error Codes or the header
file WinError.h.


%index
ProcessGroupPolicyCompletedEx
The ProcessGroupPolicyCompletedEx function notifies the system that the specified policy extension has finished applying policy. The function also reports the status of Resultant Set of Policy (RSoP) logging.
%group
Win32 userenv
%prm
extensionId, pAsyncHandle, dwStatus, RsopStatus
extensionId : [var] Specifies the unique GUID that identifies the policy extension.
pAsyncHandle : [int] Asynchronous completion handle. This handle is passed to the ProcessGroupPolicyEx callback function.
dwStatus : [int] Specifies the completion status of asynchronous processing of policy.
RsopStatus : [intptr] Specifies an HRESULT return code that indicates the status of RSoP logging.
%inst
The ProcessGroupPolicyCompletedEx function notifies the system that
the specified policy extension has finished applying policy. The
function also reports the status of Resultant Set of Policy (RSoP)
logging.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS.
Otherwise, the function returns one of the system error codes. For a
complete list of error codes, see System Error Codes or the header
file WinError.h.


%index
RefreshPolicy
The RefreshPolicy function causes policy to be applied immediately on the client computer.
%group
Win32 userenv
%prm
bMachine
bMachine : [int] Specifies whether to refresh the computer policy or user policy. If this value is TRUE, the system refreshes the computer policy. If this value is FALSE, the system refreshes the user policy.
%inst
The RefreshPolicy function causes policy to be applied immediately on
the client computer.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
By default, policy is reapplied every 90 minutes.


%index
RefreshPolicyEx
The RefreshPolicyEx function causes policy to be applied immediately on the computer. The extended function allows you to specify the type of policy refresh to apply.
%group
Win32 userenv
%prm
bMachine, dwOptions
bMachine : [int] Specifies whether to refresh the computer policy or user policy. If this value is TRUE, the system refreshes the computer policy. If this value is FALSE, the system refreshes the user policy.
dwOptions : [int] Specifies the type of policy refresh to apply. This parameter can be the following value.
%inst
The RefreshPolicyEx function causes policy to be applied immediately
on the computer. The extended function allows you to specify the type
of policy refresh to apply.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
If you do not need to specify the dwOptions parameter, you can call
the RefreshPolicy function instead. By default, policy is reapplied
every 90 minutes.


%index
RegisterGPNotification
The RegisterGPNotification function enables an application to receive notification when there is a change in policy. When a policy change occurs, the specified event object is set to the signaled state.
%group
Win32 userenv
%prm
hEvent, bMachine
hEvent : [intptr] Handle to an event object. Use the CreateEvent function to create the event object.
bMachine : [int] Specifies the policy change type. If TRUE, computer policy changes are reported. If FALSE, user policy changes are reported.
%inst
The RegisterGPNotification function enables an application to receive
notification when there is a change in policy. When a policy change
occurs, the specified event object is set to the signaled state.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Call the UnregisterGPNotification function to unregister the handle
from receiving policy change notifications. Call the CloseHandle
function to close the handle when it is no longer required. An
application can also receive notifications about policy changes when
a WM_SETTINGCHANGE message is broadcast. In this instance, the wParam
parameter value is 1 if computer policy was applied; it is zero if
user policy was applied. The lParam parameter points to the string
"Policy".


%index
RsopAccessCheckByType
The RSoPAccessCheckByType function determines whether a security descriptor grants a specified set of access rights to the client identified by an RSOPTOKEN.
%group
Win32 userenv
%prm
pSecurityDescriptor, pPrincipalSelfSid, pRsopToken, dwDesiredAccessMask, pObjectTypeList, ObjectTypeListLength, pGenericMapping, pPrivilegeSet, pdwPrivilegeSetLength, pdwGrantedAccessMask, pbAccessStatus
pSecurityDescriptor : [int] Pointer to a SECURITY_DESCRIPTOR against which access on the object is checked.
pPrincipalSelfSid : [int] Pointer to a SID. If the security descriptor is associated with an object that represents a principal (for example, a user object), this parameter should be the SID of the object. When evaluating access, this SID logically replaces the SID in any ACE containing the well-known PRINCIPAL_SELF SID ("S-1-5-10"). For more information, see Security Identifiers and Well-Known SIDs. This parameter should be NULL if the protected object does not represent a principal.
pRsopToken : [intptr] Pointer to a valid RSOPTOKEN representing the client attempting to gain access to the object.
dwDesiredAccessMask : [int] Specifies an access mask that indicates the access rights to check. This mask can contain a combination of generic, standard and specific access rights. For more information, see Access Rights and Access Masks.
pObjectTypeList : [var] Pointer to an array of OBJECT_TYPE_LIST structures that identify the hierarchy of object types for which to check access. Each element in the array specifies a GUID that identifies the object type and a value indicating the level of the object type in the hierarchy of object types. The array should not have two elements with the same GUID. The array must have at least one element. The first element in the array must be at level zero and identify the object itself. The array can have only one level zero element. The second element is a subobject, such as a property set, at level 1. Following each level 1 entry are subordinate entries for the level 2 through 4 subobjects. Thus, the levels for the elements in the array might be {0, 1, 2, 2, 1, 2, 3}. If the object type list is out of order, RSoPAccessCheckByType fails and GetLastError returns ERROR_INVALID_PARAMETER.
ObjectTypeListLength : [int] Specifies the number of elements in the pObjectTypeList array.
pGenericMapping : [var] Pointer to the GENERIC_MAPPING structure associated with the object for which access is being checked.
pPrivilegeSet : [var] This parameter is currently unused.
pdwPrivilegeSetLength : [var] This parameter is currently unused.
pdwGrantedAccessMask : [var] Pointer to an access mask that receives the granted access rights. If the function succeeds, the pbAccessStatus parameter is set to TRUE, and the mask is updated to contain the standard and specific rights granted. If pbAccessStatus is set to FALSE, this parameter is set to zero. If the function fails, the mask is not modified.
pbAccessStatus : [var] Pointer to a variable that receives the results of the access check. If the function succeeds, and the requested set of access rights are granted, this parameter is set to TRUE. Otherwise, this parameter is set to FALSE. If the function fails, the status is not modified.
%inst
The RSoPAccessCheckByType function determines whether a security
descriptor grants a specified set of access rights to the client
identified by an RSOPTOKEN.

[戻り値]
If the function succeeds, the return value is S_OK. Otherwise, the
function returns one of the COM error codes defined in the Platform
SDK header file WinError.h.

[備考]
The RSoPAccessCheckByType function compares the specified security
descriptor with the specified RSOPTOKEN and indicates, in the
pbAccessStatus parameter, whether access is granted or denied.


%index
RsopFileAccessCheck
The RSoPFileAccessCheck function determines whether a file's security descriptor grants a specified set of file access rights to the client identified by an RSOPTOKEN.
%group
Win32 userenv
%prm
pszFileName, pRsopToken, dwDesiredAccessMask, pdwGrantedAccessMask, pbAccessStatus
pszFileName : [wstr] Pointer to the name of the relevant file. The file must already exist.
pRsopToken : [intptr] Pointer to a valid RSOPTOKEN representing the client attempting to gain access to the file.
dwDesiredAccessMask : [int] Specifies an access mask that indicates the access rights to check. This mask can contain a combination of generic, standard, and specific access rights. For more information, see Access Rights and Access Masks.
pdwGrantedAccessMask : [var] Pointer to an access mask that receives the granted access rights. If the function succeeds, the pbAccessStatus parameter is set to TRUE, and the mask is updated to contain the standard and specific rights granted. If pbAccessStatus is set to FALSE, this parameter is set to zero. If the function fails, the mask is not modified.
pbAccessStatus : [var] Pointer to a variable that receives the results of the access check. If the function succeeds, and the requested set of access rights are granted, this parameter is set to TRUE. Otherwise, this parameter is set to FALSE. If the function fails, the status is not modified.
%inst
The RSoPFileAccessCheck function determines whether a file's security
descriptor grants a specified set of file access rights to the client
identified by an RSOPTOKEN.

[戻り値]
If the function succeeds, the return value is S_OK. Otherwise, the
function returns one of the COM error codes defined in the Platform
SDK header file WinError.h.

[備考]
The RSoPFileAccessCheck function indicates, in the pbAccessStatus
parameter, whether access is granted or denied to the client
identified by the RSOPTOKEN. If access is granted, the requested
access mask becomes the object's granted access mask.


%index
RsopResetPolicySettingStatus
The RSoPResetPolicySettingStatus function unlinks the RSOP_PolicySettingStatus instance from its RSOP_PolicySetting instance.
%group
Win32 userenv
%prm
dwFlags, pServices, pSettingInstance
dwFlags : [int] This parameter is currently unused.
pServices : [var] Specifies a WMI services pointer to the RSoP namespace to which the policy data is to be written. This parameter is required.
pSettingInstance : [var] Pointer to an instance of RSOP_PolicySetting containing the policy setting. This parameter is required and can also point to the instance's children.
%inst
The RSoPResetPolicySettingStatus function unlinks the
RSOP_PolicySettingStatus instance from its RSOP_PolicySetting
instance.

[戻り値]
If the function succeeds, the return value is S_OK. Otherwise, the
function returns one of the COM error codes defined in the Platform
SDK header file WinError.h.

[備考]
To link (associate) the RSOP_PolicySettingStatus instance to its
RSOP_PolicySetting instance, you can call the
RSoPSetPolicySettingStatus function.


%index
RsopSetPolicySettingStatus
The RSoPSetPolicySettingStatus function creates an instance of RSOP_PolicySettingStatus and an instance of RSOP_PolicySettingLink. The function links (associates) RSOP_PolicySettingStatus to its RSOP_PolicySetting instance.
%group
Win32 userenv
%prm
dwFlags, pServices, pSettingInstance, nInfo, pStatus
dwFlags : [int] This parameter is currently unused.
pServices : [var] Specifies a WMI services pointer to the RSoP namespace to which the policy data is to be written. This parameter is required.
pSettingInstance : [var] Pointer to an instance of RSOP_PolicySetting containing the policy setting. This parameter is required and can point to the instance's children.
nInfo : [int] Specifies the number of elements in the pStatus array.
pStatus : [var] Pointer to an array of POLICYSETTINGSTATUSINFO structures.
%inst
The RSoPSetPolicySettingStatus function creates an instance of
RSOP_PolicySettingStatus and an instance of RSOP_PolicySettingLink.
The function links (associates) RSOP_PolicySettingStatus to its
RSOP_PolicySetting instance.

[戻り値]
If the function succeeds, the return value is S_OK. Otherwise, the
function returns one of the COM error codes defined in the Platform
SDK header file WinError.h.

[備考]
To unlink an RSOP_PolicySettingStatus instance from its
RSOP_PolicySetting instance, you can call the
RSoPResetPolicySettingStatus function.


%index
UnloadUserProfile
Unloads a user's profile that was loaded by the LoadUserProfile function. The caller must have administrative privileges on the computer. For more information, see the Remarks section of the LoadUserProfile function.
%group
Win32 userenv
%prm
hToken, hProfile
hToken : [intptr] Type: HANDLE Token for the user, returned from the LogonUser, CreateRestrictedToken, DuplicateToken, OpenProcessToken, or OpenThreadToken function. The token must have TOKEN_IMPERSONATE and TOKEN_DUPLICATE access. For more information, see Access Rights for Access-Token Objects.
hProfile : [intptr] Type: HANDLE Handle to the registry key. This value is the hProfile member of the PROFILEINFO structure. For more information see the Remarks section of LoadUserProfile and Registry Key Security and Access Rights.
%inst
Unloads a user's profile that was loaded by the LoadUserProfile
function. The caller must have administrative privileges on the
computer. For more information, see the Remarks section of the
LoadUserProfile function.

[戻り値]
Type: BOOL TRUE if successful; otherwise, FALSE. To get extended
error information, call GetLastError.

[備考]
Before calling UnloadUserProfile you should ensure that all handles
to keys that you have opened in the user's registry hive are closed.
If you do not close all open registry handles, the user's profile
fails to unload. For more information, see Registry Key Security and
Access Rights and Registry Hives. For more information about calling
functions that require administrator privileges, see Running with
Special Privileges.


%index
UnregisterGPNotification
The UnregisterGPNotification function unregisters the specified policy-notification handle from receiving policy change notifications.
%group
Win32 userenv
%prm
hEvent
hEvent : [intptr] Policy-notification handle passed to the RegisterGPNotification function.
%inst
The UnregisterGPNotification function unregisters the specified
policy-notification handle from receiving policy change
notifications.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The caller must call the CloseHandle function to close the handle
when it is no longer needed.

