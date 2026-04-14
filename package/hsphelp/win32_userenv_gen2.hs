; ============================================================
;   userenv.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
CreateEnvironmentBlock
Retrieves the environment variables for the specified user. This block can then be passed to the CreateProcessAsUser function.
%group
Win32 userenv
%prm
lpEnvironment, hToken, bInherit
lpEnvironment : [var] Type: LPVOID* When this function returns, receives a pointer to the new environment block. The environment block is an array of null-terminated Unicode strings. The list ends with two nulls (\0\0).
hToken : [intptr] Type: HANDLE Token for the user, returned from the LogonUser function. If this is a primary token, the token must have TOKEN_QUERY and TOKEN_DUPLICATE access. If the token is an impersonation token, it must have TOKEN_QUERY access. For more information, see Access Rights for Access-Token Objects.
bInherit : [int] Type: BOOL Specifies whether to inherit from the current process' environment. If this value is TRUE, the process inherits the current process' environment. If this value is FALSE, the process does not inherit the current process' environment.
%inst
Retrieves the environment variables for the specified user. This
block can then be passed to the CreateProcessAsUser function.

[戻り値]
Type: BOOL TRUE if successful; otherwise, FALSE. To get extended
error information, call GetLastError.

[備考]
To free the buffer when you have finished with the environment block,
call the DestroyEnvironmentBlock function. If the environment block
is passed to CreateProcessAsUser, you must also specify the
CREATE_UNICODE_ENVIRONMENT flag. After CreateProcessAsUser has
returned, the new process has a copy of the environment block, and
DestroyEnvironmentBlock can be safely called. User-specific
environment variables such as %USERPROFILE% are set only when the
user's profile is loaded. To load a user's profile, call the
LoadUserProfile function.


%index
DestroyEnvironmentBlock
Frees environment variables created by the CreateEnvironmentBlock function.
%group
Win32 userenv
%prm
lpEnvironment
lpEnvironment : [intptr] Type: LPVOID Pointer to the environment block created by CreateEnvironmentBlock. The environment block is an array of null-terminated Unicode strings. The list ends with two nulls (\0\0).
%inst
Frees environment variables created by the CreateEnvironmentBlock
function.

[戻り値]
Type: BOOL TRUE if successful; otherwise, FALSE. To get extended
error information, call GetLastError.


%index
ExpandEnvironmentStringsForUserW
Expands the source string by using the environment block established for the specified user. (Unicode)
%group
Win32 userenv
%prm
hToken, lpSrc, lpDest, dwSize
hToken : [intptr] Type: HANDLE Token for the user, returned from the LogonUser, CreateRestrictedToken, DuplicateToken, OpenProcessToken, or OpenThreadToken function. The token must have TOKEN_IMPERSONATE and TOKEN_QUERY access. In addition, as of Windows?7 the token must also have TOKEN_DUPLICATE access. For more information, see Access Rights for Access-Token Objects.
lpSrc : [wstr] Type: LPCTSTR Pointer to the null-terminated source string to be expanded.
lpDest : [wstr] Type: LPTSTR Pointer to a buffer that receives the expanded strings.
dwSize : [int] Type: DWORD Specifies the size of the lpDest buffer, in TCHARs.
%inst
Expands the source string by using the environment block established
for the specified user. (Unicode)

[戻り値]
Type: BOOL TRUE if successful; otherwise, FALSE. To get extended
error information, call GetLastError.

[備考]
The following is an example source string:
This doc was truncated.


%index
GetUserProfileDirectoryW
Retrieves the path to the root directory of the specified user's profile. (Unicode)
%group
Win32 userenv
%prm
hToken, lpProfileDir, lpcchSize
hToken : [intptr] Type: HANDLE A token for the user, which is returned by the LogonUser, CreateRestrictedToken, DuplicateToken, OpenProcessToken, or  OpenThreadToken function. The token must have TOKEN_QUERY access. For more information, see Access Rights for Access-Token Objects.
lpProfileDir : [wstr] Type: LPTSTR A pointer to a buffer that, when this function returns successfully, receives the path to the specified user's profile directory.
lpcchSize : [var] Type: LPDWORD Specifies the size of the lpProfileDir buffer, in TCHARs.
%inst
Retrieves the path to the root directory of the specified user's
profile. (Unicode)

[戻り値]
Type: BOOL TRUE if successful; otherwise, FALSE. To get extended
error information, call GetLastError.

[備考]
The following is an example of the path returned by
GetUserProfileDirectory in Windows XP:
This doc was truncated.

