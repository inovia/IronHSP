; ============================================================
;   advapi32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
FreeSid
Frees a security identifier (SID) previously allocated by using the AllocateAndInitializeSid function.
%group
Win32 advapi32
%prm
pSid
pSid : [int] A pointer to the SID structure to free.
%inst
Frees a security identifier (SID) previously allocated by using the
AllocateAndInitializeSid function.

[戻り値]
If the function succeeds, the function returns NULL. If the function
fails, it returns a pointer to the SID structure represented by the
pSid parameter.


%index
CreateProcessAsUserW
Creates a new process and its primary thread. The new process runs in the security context of the user represented by the specified token. (Unicode)
%group
Win32 advapi32
%prm
hToken, lpApplicationName, lpCommandLine, lpProcessAttributes, lpThreadAttributes, bInheritHandles, dwCreationFlags, lpEnvironment, lpCurrentDirectory, lpStartupInfo, lpProcessInformation
hToken : [intptr] A handle to the primary token that represents a user. The handle must have the TOKEN_QUERY, TOKEN_DUPLICATE, and TOKEN_ASSIGN_PRIMARY access rights. For more information, see Access Rights for Access-Token Objects. The user represented by the token must have read and execute access to the application specified by the lpApplicationName or the lpCommandLine parameter.
lpApplicationName : [wstr] The name of the module to be executed. This module can be a Windows-based application. It can be some other type of module (for example, MS-DOS or OS/2) if the appropriate subsystem is available on the local computer.
lpCommandLine : [wstr] The command line to be executed. The maximum length of this string is 32K characters. If lpApplicationName is NULL, the module name portion of lpCommandLine is limited to MAX_PATH characters. The Unicode version of this function, CreateProcessAsUserW, can modify the contents of this string. Therefore, this parameter cannot be a pointer to read-only memory (such as a const variable or a literal string). If this parameter is a constant string, the function may cause an access violation. The lpCommandLine parameter can be NULL. In that case, the function uses the string pointed to by lpApplicationName as the command line. If both lpApplicationName and lpCommandLine are non-NULL, *lpApplicationName specifies the module to execute, and *lpCommandLine specifies the command line. The new process can use GetCommandLine to retrieve the entire command line. Console processes written in C can use the argc and argv arguments to parse the command line. Because argv[0] is the module name, C programmers generally repeat the module name as the first token in the command line. If lpApplicationName is NULL, the first white space?delimited token of the command line specifies the module name. If you are using a long file name that contains a space, use quoted strings to indicate where the file name ends and the arguments begin (see the explanation for the lpApplicationName parameter). If the file name does not contain an extension, .exe is appended. Therefore, if the file name extension is .com, this parameter must include the .com extension. If the file name ends in a period (.) with no extension, or if the file name contains a path, .exe is not appended. If the file name does not contain a directory path, the system searches for the executable file in the following sequence:
lpProcessAttributes : [var] A pointer to a SECURITY_ATTRIBUTES structure that specifies a security descriptor for the new process object and determines whether child processes can inherit the returned handle to the process. If lpProcessAttributes is NULL or lpSecurityDescriptor is NULL, the process gets a default security descriptor and the handle cannot be inherited. The default security descriptor is that of the user referenced in the hToken parameter. This security descriptor may not allow access for the caller, in which case the process may not be opened again after it is run. The process handle is valid and will continue to have full access rights.
lpThreadAttributes : [var] A pointer to a SECURITY_ATTRIBUTES structure that specifies a security descriptor for the new thread object and determines whether child processes can inherit the returned handle to the thread. If lpThreadAttributes is NULL or lpSecurityDescriptor is NULL, the thread gets a default security descriptor and the handle cannot be inherited. The default security descriptor is that of the user referenced in the hToken parameter. This security descriptor may not allow access for the caller.
bInheritHandles : [int] If this parameter is TRUE, each inheritable handle in the calling process is inherited by the new process. If the parameter is FALSE, the handles are not inherited. Note that inherited handles have the same value and access rights as the original handles. For additional discussion of inheritable handles, see Remarks. Terminal Services:??You cannot inherit handles across sessions. Additionally, if this parameter is TRUE, you must create the process in the same session as the caller. Protected Process Light (PPL) processes:??The generic handle inheritance is blocked when a PPL process creates a non-PPL process since PROCESS_DUP_HANDLE is not allowed from a non-PPL process to a PPL process. See Process Security and Access Rights
dwCreationFlags : [int] The flags that control the priority class and the creation of the process. For a list of values, see Process Creation Flags.
lpEnvironment : [intptr] A pointer to an environment block for the new process. If this parameter is NULL, the new process uses the environment of the calling process.
lpCurrentDirectory : [wstr] The full path to the current directory for the process. The string can also specify a UNC path. If this parameter is NULL, the new process will have the same current drive and directory as the calling process. (This feature is provided primarily for shells that need to start an application and specify its initial drive and working directory.)
lpStartupInfo : [var] A pointer to a STARTUPINFO or STARTUPINFOEX structure. The user must have full access to both the specified window station and desktop. If you want the process to be interactive, specify winsta0\default. If the lpDesktop member is NULL, the new process inherits the desktop and window station of its parent process. If this member is an empty string, "", the new process connects to a window station using the rules described in Process Connection to a Window Station. To set extended attributes, use a STARTUPINFOEX structure and specify EXTENDED_STARTUPINFO_PRESENT in the dwCreationFlags parameter. Handles in STARTUPINFO or STARTUPINFOEX must be closed with CloseHandle when they are no longer needed. Important??The caller is responsible for ensuring that the standard handle fields in STARTUPINFO contain valid handle values. These fields are copied unchanged to the child process without validation, even when the dwFlags member specifies STARTF_USESTDHANDLES. Incorrect values can cause the child process to misbehave or crash. Use the Application Verifier runtime verification tool to detect invalid handles.
lpProcessInformation : [var] A pointer to a PROCESS_INFORMATION structure that receives identification information about the new process.
%inst
Creates a new process and its primary thread. The new process runs in
the security context of the user represented by the specified token.
(Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. Note that the function returns before
the process has finished initialization. If a required DLL cannot be
located or fails to initialize, the process is terminated. To get the
termination status of a process, call GetExitCodeProcess.

[備考]
CreateProcessAsUser must be able to open the primary token of the
calling process with the TOKEN_DUPLICATE and TOKEN_IMPERSONATE access
rights. By default, CreateProcessAsUser creates the new process on a
noninteractive window station with a desktop that is not visible and
cannot receive user input. To enable user interaction with the new
process, you must specify the name of the default interactive window
station and desktop, "winsta0\default", in the lpDesktop member of
the STARTUPINFO structure. In addition, before calling
CreateProcessAsUser, you must change the discretionary access control
list (DACL) of both the default interactive window station and the
default desktop. The DACLs for the window station and desktop must
grant access to the user or the logon session represented by the
hToken parameter. CreateProcessAsUser does not load the specified
user's profile into the HKEY_USERS registry key. Therefore, to access
the information in the HKEY_CURRENT_USER registry key, you must load
the user's profile information into HKEY_USERS with the
LoadUserProfile function before calling CreateProcessAsUser. Be sure
to call UnloadUserProfile after the new process exits. If the
lpEnvironment parameter is NULL, the new process inherits the
environment of the calling process. CreateProcessAsUser does not
automatically modify the environment block to include environment
variables specific to the user represented by hToken. For example,
the USERNAME and USERDOMAIN variables are inherited from the calling
process if lpEnvironment is NULL. It is your responsibility to
prepare the environment block for the new process and specify it in
lpEnvironment. The CreateProcessWithLogonW and
CreateProcessWithTokenW functions are similar to CreateProcessAsUser,
except that the caller does not need to call the LogonUser function
to authenticate the user and get a token. CreateProcessAsUser allows
you to access the specified directory and executable image in the
security context of the caller or the target user. By default,
CreateProcessAsUser accesses the directory and executable image in
the security context of the caller. In this case, if the caller does
not have access to the directory and executable image, the function
fails. To access the directory and executable image using the
security context of the target user, specify hToken in a call to the
ImpersonateLoggedOnUser function before calling CreateProcessAsUser.
The process is assigned a process identifier. The identifier is valid
until the process terminates. It can be used to identify the process,
or specified in the OpenProcess function to open a handle to the
process. The initial thread in the process is also assigned a thread
identifier. It can be specified in the OpenThread function to open a
handle to the thread. The identifier is valid until the thread
terminates and can be used to uniquely identify the thread within the
system. These identifiers are returned in the PROCESS_INFORMATION
structure. The calling thread can use the WaitForInputIdle function
to wait until the new process has finished its initialization and is
waiting for user input with no input pending. This can be useful for
synchronization between parent and child processes, because
CreateProcessAsUser returns without waiting for the new process to
finish its initialization. For example, the creating process would
use WaitForInputIdle before trying to find a window associated with
the new process. The preferred way to shut down a process is by using
the ExitProcess function, because this function sends notification of
approaching termination to all DLLs attached to the process. Other
means of shutting down a process do not notify the attached DLLs.
Note that when a thread calls ExitProcess, other threads of the
process are terminated without an opportunity to execute any
additional code (including the thread termination code of attached
DLLs). For more information, see Terminating a Process. By default,
passing TRUE as the value of the bInheritHandles parameter causes all
inheritable handles to be inherited by the new process. This can be
problematic for applications which create processes from multiple
threads simultaneously yet desire each process to inherit different
handles. Applications can use the UpdateProcThreadAttributeList
function with the PROC_THREAD_ATTRIBUTE_HANDLE_LIST parameter to
provide a list of handles to be inherited by a particular process.
Security Remarks The lpApplicationName parameter can be NULL, in
which case the executable name must be the first white
space?delimited string in lpCommandLine. If the executable or path
name has a space in it, there is a risk that a different executable
could be run because of the way the function parses spaces. The
following example is dangerous because the function will attempt to
run "Program.exe", if it exists, instead of "MyApp.exe".
This doc was truncated.


%index
RegCloseKey
指定したレジストリキーへのハンドルを閉じる。
%group
Win32 advapi32
%prm
hKey
hKey : [intptr] 閉じるオープンキーへのハンドル。RegCreateKeyEx、RegCreateKeyTransacted、RegOpenKeyEx、RegOpenKeyTransacted、RegConnectRegistry のいずれかで開かれたものでなければならない。
%inst
指定したレジストリキーへのハンドルを閉じる。

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS。失敗した場合は Winerror.h で定義された 0
以外のエラーコード。FORMAT_MESSAGE_FROM_SYSTEM フラグで FormatMessage
を呼ぶことで一般的な説明が得られる。

[備考]

指定されたキーのハンドルは閉じた後は無効となるため使用してはならない。キーハンドルは必要以上に長く開いたままにすべきでない。RegCloseKey
は戻る前に必ずしもレジストリに情報を書き込まない。キャッシュがディスクにフラッシュされるまで数秒かかることがある。明示的に書き込む必要がある場合は
RegFlushKey を使えるが、多くのシステムリソースを消費するので必要時のみ呼ぶこと。


%index
RegCopyTreeW
Copies the specified registry key, along with its values and subkeys, to the specified destination key. (Unicode)
%group
Win32 advapi32
%prm
hKeySrc, lpSubKey, hKeyDest
hKeySrc : [intptr] A handle to an open registry key. The key must have been opened with the KEY_READ access right. For more information, see Registry Key Security and Access Rights.
lpSubKey : [wstr] The name of the key. This key must be a subkey of the key identified by the hKeySrc parameter. This parameter can also be NULL.
hKeyDest : [intptr] A handle to the destination key. The calling process  must have KEY_CREATE_SUB_KEY access to the key.
%inst
Copies the specified registry key, along with its values and subkeys,
to the specified destination key. (Unicode)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
Winerror.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error.

[備考]
This function also copies the security descriptor for the key. To
compile an application that uses this function, define _WIN32_WINNT
as 0x0600 or later. For more information, see Using the Windows
Headers.
> [!NOTE] > The winreg.h header defines RegCopyTree as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
RegCreateKeyExW
指定したレジストリキーを作成する。キーが既に存在する場合は開く。キー名は大文字小文字を区別しない。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey, Reserved, lpClass, dwOptions, samDesired, lpSecurityAttributes, phkResult, lpdwDisposition
hKey : [intptr] オープン中のレジストリキーへのハンドル。呼び出し元プロセスはキーへの KEY_CREATE_SUB_KEY アクセス権を持っている必要がある。RegCreateKeyEx または RegOpenKeyEx で返されたハンドル、または HKEY_CLASSES_ROOT、HKEY_CURRENT_CONFIG、HKEY_CURRENT_USER、HKEY_LOCAL_MACHINE、HKEY_USERS のいずれか。
lpSubKey : [wstr] この関数が開くか作成するサブキーの名前。hKey で識別されるキーのサブキーでなければならず、レジストリツリーで最大 32 レベルまで深くできる。空文字列へのポインタの場合、phkResult は hKey で指定されたキーへの新しいハンドルを受け取る。NULL にしてはならない。
Reserved : [int] このパラメータは予約されており 0 でなければならない。
lpClass : [wstr] このキーのユーザー定義クラスタイプ。無視される場合がある。NULL を指定できる。
dwOptions : [int] 
samDesired : [int] 作成するキーのアクセス権を指定するマスク。詳細は Registry Key Security and Access Rights を参照。
lpSecurityAttributes : [var] 返されたハンドルが子プロセスに継承可能かを決定する SECURITY_ATTRIBUTES 構造体へのポインタ。NULL の場合、ハンドルは継承されない。
phkResult : [intptr] 開かれたまたは作成されたキーへのハンドルを受け取る変数へのポインタ。定義済みキーでない場合、使用後は RegCloseKey を呼び出す。
lpdwDisposition : [var] ディスポジション値を受け取る変数へのポインタ。
%inst
指定したレジストリキーを作成する。キーが既に存在する場合は開く。キー名は大文字小文字を区別しない。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS。失敗した場合は Winerror.h で定義された 0 以外のエラーコード。

[備考]
RegCreateKeyEx が作成するキーには値がない。アプリケーションは RegSetValueEx
でキー値を設定できる。RegCreateKeyEx は指定パス内に存在しないキーをすべて作成するため、1
回の呼び出しで複数レベルのキーを作成できる。HKEY_USERS または HKEY_LOCAL_MACHINE
の直接の子は作成できない。サービスやアプリケーションが複数ユーザーを偽装する場合、HKEY_CURRENT_USER とともに使用せず
RegOpenCurrentUser を使うこと。一部のレジストリキーへのアクセスはリダイレクトされる(Registry
Virtualization)。


%index
RegDeleteKeyExW
Deletes a subkey and its values from the specified platform-specific view of the registry. (Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey, samDesired, Reserved
hKey : [intptr] A handle to an open registry key. The access rights of this key do not affect the delete operation. For more information about access rights, see Registry Key Security and Access Rights. This handle is returned by the RegCreateKeyEx or RegOpenKeyEx function, or it can be one of the following predefined keys: HKEY_CLASSES_ROOT HKEY_CURRENT_CONFIG HKEY_CURRENT_USER HKEY_LOCAL_MACHINE HKEY_USERS
lpSubKey : [wstr] The name of the key to be deleted. This key must be a subkey of the key specified by the value of the hKey parameter. The  function opens the subkey with the DELETE access right. Key names are not case sensitive. The value of this parameter cannot be NULL.
samDesired : [int] An access mask the specifies the platform-specific view of the registry.
Reserved : [int] This parameter is reserved and must be zero.
%inst
Deletes a subkey and its values from the specified platform-specific
view of the registry. (Unicode)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
Winerror.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error.

[備考]
A deleted key is not removed until the last handle to it is closed.
On WOW64, 32-bit applications view a registry tree that is separate
from the registry tree that 64-bit applications view. This function
enables an application to delete an entry in the alternate registry
view. The subkey to be deleted must not have subkeys. To delete a key
and all its subkeys, you need to enumerate the subkeys and delete
them individually. To delete keys recursively, use the RegDeleteTree
or SHDeleteKey function. If the function succeeds, RegDeleteKeyEx
removes the specified key from the registry. The entire key,
including all of its values, is removed. > [!NOTE] > On legacy
versions of Windows, this API is also exposed by kernel32.dll.
> [!NOTE] > The winreg.h header defines RegDeleteKeyEx as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
RegDeleteTreeW
Deletes the subkeys and values of the specified key recursively. (Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey
hKey : [intptr] A handle to an open registry key. The key must have been opened with the following access rights: DELETE, KEY_ENUMERATE_SUB_KEYS, and KEY_QUERY_VALUE. For more information, see Registry Key Security and Access Rights. This handle is returned by the RegCreateKeyEx, RegCreateKeyTransacted, RegOpenKeyEx, or RegOpenKeyTransacted function, or it can be one of the following Predefined Keys: HKEY_CLASSES_ROOT HKEY_CURRENT_CONFIG HKEY_CURRENT_USER HKEY_LOCAL_MACHINE HKEY_USERS
lpSubKey : [wstr] The name of the key. This key must be a subkey of the key identified by the hKey parameter. If this parameter is NULL, the subkeys and values of hKey are deleted.
%inst
Deletes the subkeys and values of the specified key recursively.
(Unicode)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
Winerror.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error.

[備考]
If the key has values, it must be opened with KEY_SET_VALUE or this
function will fail with ERROR_ACCESS_DENIED. To compile an
application that uses this function, define _WIN32_WINNT as 0x0600 or
later. For more information, see Using the Windows Headers.
> [!NOTE] > On legacy versions of Windows, this API is also exposed
by kernel32.dll. > [!NOTE] > The winreg.h header defines
RegDeleteTree as an alias which automatically selects the ANSI or
Unicode version of this function based on the definition of the
UNICODE preprocessor constant. Mixing usage of the encoding-neutral
alias with code that not encoding-neutral can lead to mismatches that
result in compilation or runtime errors. For more information, see
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
RegDeleteValueW
指定されたレジストリキーから名前付き値を削除する。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpValueName
hKey : [intptr] オープン中のレジストリキーへのハンドル。KEY_SET_VALUE アクセス権で開かれている必要がある。
lpValueName : [wstr] 削除するレジストリ値。NULL または空文字列の場合、RegSetValue で設定された値が削除される。
%inst
指定されたレジストリキーから名前付き値を削除する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS。失敗した場合は Winerror.h で定義された 0 以外のエラーコード。

[備考]
winreg.h ヘッダは UNICODE プリプロセッサ定数の定義に基づいて RegDeleteValue を ANSI/Unicode
版のエイリアスとして定義する。


%index
RegDisablePredefinedCacheEx
Disables handle caching for all predefined registry handles for the current process.
%group
Win32 advapi32
%prm

%inst
Disables handle caching for all predefined registry handles for the
current process.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a system error code.

[備考]
This function does not work on a remote computer. Services that
change impersonation should call this function before using any of
the predefined handles. For example, any access of HKEY_CURRENT_USER
after this function is called results in open and close operations
being performed on HKEY_USERS\SID_of_current_user, or on
HKEY_USERS\.DEFAULT if the current user's hive is not loaded. For
more information on SIDs, see Security Identifiers.


%index
RegEnumKeyExW
指定されたオープンレジストリキーのサブキーを列挙する。1 回の呼び出しにつき 1 つのサブキーの情報を取得する。(Unicode)
%group
Win32 advapi32
%prm
hKey, dwIndex, lpName, lpcchName, lpReserved, lpClass, lpcchClass, lpftLastWriteTime
hKey : [intptr] オープン中のレジストリキーへのハンドル。KEY_ENUMERATE_SUB_KEYS アクセス権で開かれている必要がある。RegCreateKeyEx 等で取得したもの、または定義済みキーのいずれか。
dwIndex : [int] 取得するサブキーのインデックス。最初の呼び出しでは 0、その後の呼び出しではインクリメントする。サブキーは順序付けされていないので新しいサブキーは任意のインデックスを持つ。
lpName : [wstr] サブキー名(終端 NULL を含む)を受け取るバッファへのポインタ。関数はサブキー名のみをバッファにコピーし、完全なキー階層はコピーしない。失敗時は何もコピーされない。
lpcchName : [var] lpName バッファのサイズ(終端 NULL を含む文字数)を指定する変数へのポインタ。成功時、終端 NULL を含まない文字数が格納される。必要なバッファサイズは RegQueryInfoKey で取得できる。
lpReserved : [var] このパラメータは予約されており NULL でなければならない。
lpClass : [wstr] 列挙されたサブキーのユーザー定義クラスを受け取るバッファへのポインタ。NULL を指定可能。
lpcchClass : [var] lpClass バッファのサイズ(終端 NULL を含む文字数)を指定する変数へのポインタ。成功時は終端 NULL を含まない格納文字数。lpClass が NULL の場合のみ NULL を指定可能。
lpftLastWriteTime : [var] 列挙されたサブキーが最後に書き込まれた時刻を受け取る FILETIME 構造体へのポインタ。NULL を指定可能。
%inst
指定されたオープンレジストリキーのサブキーを列挙する。1 回の呼び出しにつき 1 つのサブキーの情報を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS。失敗した場合はシステムエラーコード。サブキーがもうない場合は
ERROR_NO_MORE_ITEMS。lpName バッファが小さすぎる場合は ERROR_MORE_DATA。

[備考]
サブキーを列挙するには最初 dwIndex を 0 にして呼び、ERROR_NO_MORE_ITEMS
が返るまでインクリメントしながら呼び出す。列挙中に列挙対象キーを変更する他のレジストリ関数を呼ばないこと。一部のレジストリキーへのアクセスはリダイレクトされる点に注意。


%index
RegEnumValueW
指定されたオープンレジストリキーの値を列挙する。呼び出しごとに 1 つのインデックス付きの値名とデータブロックをキーからコピーする。(Unicode)
%group
Win32 advapi32
%prm
hKey, dwIndex, lpValueName, lpcchValueName, lpReserved, lpType, lpData, lpcbData
hKey : [intptr] オープン中のレジストリキーへのハンドル。KEY_QUERY_VALUE アクセス権で開かれている必要がある。
dwIndex : [int] 取得する値のインデックス。最初の呼び出しでは 0 で、以降インクリメントする。値は順序付けされていないので新しい値は任意のインデックスを持つ。
lpValueName : [wstr] 値の名前(NULL 終端文字列)を受け取るバッファへのポインタ。終端 NULL を含められる大きさが必要。
lpcchValueName : [var] lpValueName バッファのサイズ(文字単位)を指定する変数へのポインタ。戻り時、終端 NULL を含まない格納文字数。レジストリ値名は 32,767 バイトに制限されている。
lpReserved : [var] このパラメータは予約されており NULL でなければならない。
lpType : [var] 指定された値に格納されているデータタイプを示すコードを受け取る変数へのポインタ。タイプコードが不要なら NULL を指定可能。
lpData : [var] 値エントリのデータを受け取るバッファへのポインタ。データが不要なら NULL 可。
lpcbData : [var] lpData が指すバッファのサイズ(バイト単位)を指定する変数へのポインタ。戻り時、バッファに格納されたバイト数を受け取る。lpData が NULL の場合のみ NULL 可。REG_SZ、REG_MULTI_SZ、REG_EXPAND_SZ の場合、終端 NULL 分が含まれる。バッファが小さすぎる場合 ERROR_MORE_DATA が返り、必要サイズが格納される。
%inst
指定されたオープンレジストリキーの値を列挙する。呼び出しごとに 1
つのインデックス付きの値名とデータブロックをキーからコピーする。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS。失敗した場合はシステムエラーコード。値がもうない場合は
ERROR_NO_MORE_ITEMS。lpData バッファが小さすぎる場合は ERROR_MORE_DATA。

[備考]
値を列挙するには最初 dwIndex を 0 にして呼び、ERROR_NO_MORE_ITEMS
が返るまでインクリメントしながら呼び出す。列挙中に照会中のキーを変更するレジストリ関数を呼ばないこと。REG_SZ、REG_MULTI_SZ、REG_EXPAND_SZ
の場合、文字列が正しく NULL 終端されていない可能性があるので、使用前に確認する。名前とデータの最大サイズは
RegQueryInfoKey で取得できる。


%index
RegFlushKey
Writes all the attributes of the specified open registry key into the registry.
%group
Win32 advapi32
%prm
hKey
hKey : [intptr] A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see Registry Key Security and Access Rights.
%inst
Writes all the attributes of the specified open registry key into the
registry.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
Winerror.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error.

[備考]
Calling RegFlushKey is an expensive operation that significantly
affects system-wide performance as it consumes disk bandwidth and
blocks modifications to all keys by all processes in the registry
hive that is being flushed until the flush operation completes.
RegFlushKey should only be called explicitly when an application must
guarantee that registry changes are persisted to disk immediately
after modification. All modifications made to keys are visible to
other processes without the need to flush them to disk.
Alternatively, the registry has a 'lazy flush' mechanism that flushes
registry modifications to disk at regular intervals of time. In
addition to this regular flush operation, registry changes are also
flushed to disk at system shutdown. Allowing the 'lazy flush' to
flush registry changes is the most efficient way to manage registry
writes to the registry store on disk. The RegFlushKey function
returns only when all the data for the hive that contains the
specified key has been written to the registry store on disk. The
RegFlushKey function writes out the data for other keys in the hive
that have been modified since the last lazy flush or system start.
After RegFlushKey returns, use RegCloseKey to close the handle to the
registry key.


%index
RegGetKeySecurity
Retrieves a copy of the security descriptor protecting the specified open registry key.
%group
Win32 advapi32
%prm
hKey, SecurityInformation, pSecurityDescriptor, lpcbSecurityDescriptor
hKey : [intptr] A handle to an open key for which to retrieve the security descriptor.
SecurityInformation : [int] A SECURITY_INFORMATION value that indicates the requested security information.
pSecurityDescriptor : [int] A pointer to a buffer that receives a copy of the requested security descriptor.
lpcbSecurityDescriptor : [var] A pointer to a variable that specifies the size, in bytes, of the buffer pointed to by the pSecurityDescriptor parameter. When the function returns, the variable contains the number of bytes written to the buffer.
%inst
Retrieves a copy of the security descriptor protecting the specified
open registry key.

[戻り値]
If the function succeeds, the function returns ERROR_SUCCESS.
If the function fails, it returns a nonzero error code defined in
WinError.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error.

[備考]
If the buffer specified by the pSecurityDescriptor parameter is too
small, the function returns ERROR_INSUFFICIENT_BUFFER and the
lpcbSecurityDescriptor parameter contains the number of bytes
required for the requested security descriptor. To read the owner,
group, or discretionary access control list (DACL) from the key's
security descriptor, the calling process must have been granted
READ_CONTROL access when the handle was opened. To get READ_CONTROL
access, the caller must be the owner of the key or the key's DACL
must grant the access. To read the system access control list (SACL)
from the security descriptor, the calling process must have been
granted ACCESS_SYSTEM_SECURITY access when the key was opened. The
correct way to get this access is to enable the SE_SECURITY_NAME
privilege in the caller's current token, open the handle for
ACCESS_SYSTEM_SECURITY access, and then disable the privilege.


%index
RegGetValueW
Retrieves the type and data for the specified registry value. (Unicode)
%group
Win32 advapi32
%prm
hkey, lpSubKey, lpValue, dwFlags, pdwType, pvData, pcbData
hkey : [intptr] A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see Registry Key Security and Access Rights.
lpSubKey : [wstr] The path of a registry key relative to the key specified by the *hkey* parameter. The registry value will be retrieved from this subkey. The path is not case sensitive. If this parameter is **NULL** or an empty string, "", the value will be read from the key specified by *hkey* itself.
lpValue : [wstr] The name of the registry value. If this parameter is **NULL** or an empty string, "", the function retrieves the type and data for the key's unnamed or default value, if any. Keys do not automatically have an unnamed or default value, and unnamed values can be of any type. For more information, see [Registry Element Size Limits](/windows/win32/sysinfo/registry-element-size-limits).
dwFlags : [int] 
pdwType : [var] A pointer to a variable that receives a code indicating the type of data stored in the specified value. For a list of the possible type codes, see Registry Value Types. This parameter can be NULL if the type is not required.
pvData : [intptr] A pointer to a buffer that receives the value's data. This parameter can be NULL if the data is not required. If the data is a string, the function checks for a terminating null character. If one is not found, the string is stored with a null terminator if the buffer is large enough to accommodate the extra character. Otherwise, the function fails and returns ERROR_MORE_DATA.
pcbData : [var] A pointer to a variable that specifies the size of the buffer pointed to by the pvData parameter, in bytes. When the function returns, this variable contains the size of the data copied to pvData.
%inst
Retrieves the type and data for the specified registry value.
(Unicode)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a system error code. If the
pvData buffer is too small to receive the value, the function returns
ERROR_MORE_DATA. If the lpValue registry value does not exist, the
function returns ERROR_FILE_NOT_FOUND. If dwFlags specifies a
combination of both RRF_SUBKEY_WOW6464KEY and RRF_SUBKEY_WOW6432KEY,
the function returns ERROR_INVALID_PARAMETER.

[備考]
An application typically calls RegEnumValue to determine the value
names and then RegGetValue to retrieve the data for the names. If the
data has the REG_SZ, REG_MULTI_SZ or REG_EXPAND_SZ type, and the ANSI
version of this function is used (either by explicitly calling
RegGetValueA or by not defining UNICODE before including the
Windows.h file), this function converts the stored Unicode string to
an ANSI string before copying it to the buffer pointed to by pvData.
When calling this function with hkey set to the HKEY_PERFORMANCE_DATA
handle and a value string of a specified object, the returned data
structure sometimes has unrequested objects. Do not be surprised;
this is normal behavior. You should always expect to walk the
returned data structure to look for the requested object. Note that
operations that access certain registry keys are redirected. For more
information, see Registry Virtualization and 32-bit and 64-bit
Application Data in the Registry. To compile an application that uses
this function, define _WIN32_WINNT as 0x0600 or later. For more
information, see Using the Windows Headers.
> [!NOTE] > The winreg.h header defines RegGetValue as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
RegLoadKeyW
Creates a subkey under HKEY_USERS or HKEY_LOCAL_MACHINE and loads the data from the specified registry hive into that subkey. (Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey, lpFile
hKey : [intptr] A handle to the key where the subkey will be created. This can be a handle returned by a call to RegConnectRegistry, or one of the following predefined handles:
lpSubKey : [wstr] The name of the key to be created under hKey. This subkey is where the registration information from the file will be loaded.
lpFile : [wstr] The name of the  file containing the registry data. This file must be a local file that was created with the RegSaveKey function. If this file does not exist, a file is created with the specified name.
%inst
Creates a subkey under HKEY_USERS or HKEY_LOCAL_MACHINE and loads the
data from the specified registry hive into that subkey. (Unicode)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
Winerror.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error.

[備考]
There are two registry hive file formats. Registry hives created on
current operating systems typically cannot be loaded by earlier ones.
If hKey is a handle returned by RegConnectRegistry, then the path
specified in lpFile is relative to the remote computer. The calling
process must have the SE_RESTORE_NAME and SE_BACKUP_NAME privileges
on the computer in which the registry resides. For more information,
see Running with Special Privileges. To load a hive without requiring
these special privileges, use the RegLoadAppKey function.
> [!NOTE] > The winreg.h header defines RegLoadKey as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
RegLoadMUIStringW
Loads the specified string from the specified key and subkey. (Unicode)
%group
Win32 advapi32
%prm
hKey, pszValue, pszOutBuf, cbOutBuf, pcbData, Flags, pszDirectory
hKey : [intptr] A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see Registry Key Security and Access Rights. This handle is returned by the RegCreateKeyEx or RegOpenKeyEx function. It can also be one of the following predefined keys: HKEY_CLASSES_ROOT HKEY_CURRENT_CONFIG HKEY_CURRENT_USER HKEY_LOCAL_MACHINE HKEY_USERS
pszValue : [wstr] The name of the registry value.
pszOutBuf : [wstr] A pointer to a buffer that receives the string. Strings of the following form receive special handling: @[path]\dllname,-strID The string with identifier strID is loaded from dllname; the path is optional. If the pszDirectory parameter is not NULL, the directory is prepended to the path specified in the registry data. Note that dllname can contain environment variables to be expanded.
cbOutBuf : [int] The size of the pszOutBuf buffer, in bytes.
pcbData : [var] A pointer to a variable that receives the size of the data copied to the pszOutBuf buffer, in bytes. If the buffer is not large enough to hold the data, the function returns ERROR_MORE_DATA and stores the required buffer size in the variable pointed to by pcbData. In this case, the contents of the buffer are undefined.
Flags : [int] This parameter can be 0 or the following value.
pszDirectory : [wstr] The directory path.
%inst
Loads the specified string from the specified key and subkey.
(Unicode)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a system error code. If the
pcbData buffer is too small to receive the string, the function
returns ERROR_MORE_DATA. The ANSI version of this function returns
ERROR_CALL_NOT_IMPLEMENTED.

[備考]
The RegLoadMUIString function is supported only for Unicode. Although
both Unicode (W) and ANSI (A) versions of this function are declared,
the RegLoadMUIStringA function returns ERROR_CALL_NOT_IMPLEMENTED.
Applications should explicitly call RegLoadMUIStringW or specify
Unicode as the character set in platform invoke (PInvoke) calls. To
compile an application that uses this function, define _WIN32_WINNT
as 0x0600 or later. For more information, see Using the Windows
Headers.
> [!NOTE] > The winreg.h header defines RegLoadMUIString as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
RegNotifyChangeKeyValue
Notifies the caller about changes to the attributes or contents of a specified registry key.
%group
Win32 advapi32
%prm
hKey, bWatchSubtree, dwNotifyFilter, hEvent, fAsynchronous
hKey : [intptr] A handle to an open registry key. This handle is returned by the RegCreateKeyEx or RegOpenKeyEx function. It can also be one of the following predefined keys:
bWatchSubtree : [int] If this parameter is TRUE, the function reports changes in the specified key and its subkeys. If the parameter is FALSE, the function reports changes only in the specified key.
dwNotifyFilter : [int] 
hEvent : [intptr] A handle to an event. If the fAsynchronous parameter is TRUE, the function returns immediately and changes are reported by signaling this event. If fAsynchronous is FALSE, hEvent is ignored.
fAsynchronous : [int] If this parameter is TRUE, the function returns immediately and reports changes by signaling the specified event. If this parameter is FALSE, the function does not return until a change has occurred.
%inst
Notifies the caller about changes to the attributes or contents of a
specified registry key.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
Winerror.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error.

[備考]
This function detects a single change. After the caller receives a
notification event, it should call the function again to receive the
next notification. Note On Windows NT, Windows 2000, and Windows XP
calling RegNotifyChangeKeyValue for a particular key handle causes
change notifications to continue to occur for as long as the key
handle is valid. This causes a second call to RegNotifyChangeKeyValue
to return immediately, if any changes have occurred in the interim
period between the first and second calls. If the API is being used
asynchronously, the passed event handle will be signaled immediately
if any interim changes have occurred. This function cannot be used to
detect changes to the registry that result from using the
RegRestoreKey function. If the specified key is closed, the event is
signaled. This means that an application should not depend on the key
being open after returning from a wait operation on the event. The
REG_NOTIFY_THREAD_AGNOSTIC flag introduced in Windows 8 enables the
use of RegNotifyChangeKeyValue for ThreadPool threads. If the thread
that called RegNotifyChangeKeyValue exits, the event is signaled. To
continue to monitor additional changes in the value of the key, call
RegNotifyChangeKeyValue again from another thread.
With the exception of RegNotifyChangeKeyValue calls with
REG_NOTIFY_THREAD_AGNOSTIC set, this function must be called on
persistent threads. If the calling thread is from a thread pool and
it is not persistent, the event is signaled every time the thread
terminates, not just when there is a registry change. To ensure
accurate results, run the thread pool work in a persistent thread by
using the SetThreadpoolCallbackPersistent function, or create your
own thread using the CreateThread function. (For the original thread
pool API, specify WT_EXECUTEINPERSISTENTTHREAD using the
QueueUserWorkItem function.) This function should not be called
multiple times with the same value for the hKey but different values
for the bWatchSubtree and dwNotifyFilter parameters. The function
will succeed but the changes will be ignored. To change the watch
parameters, you must first close the key handle by calling
RegCloseKey, reopen the key handle by calling RegOpenKeyEx, and then
call RegNotifyChangeKeyValue with the new parameters. Each time a
process calls RegNotifyChangeKeyValue with the same set of
parameters, it establishes another wait operation, creating a
resource leak. Therefore, check that you are not calling
RegNotifyChangeKeyValue with the same parameters until the previous
wait operation has completed. To monitor registry operations in more
detail, see Registry. Windows XP/2000: When RegNotifyChangeKeyValue
is called for a particular key handle, change notifications occur for
as long as the key handle is valid. This causes a second call to
RegNotifyChangeKeyValue to return immediately, if any changes occur
in the interim between the first and second calls. If the function is
being used asynchronously, the passed event handle will be signaled
immediately if any changes occur in the interim.


%index
RegOpenCurrentUser
Retrieves a handle to the HKEY_CURRENT_USER key for the user the current thread is impersonating.
%group
Win32 advapi32
%prm
samDesired, phkResult
samDesired : [int] A mask that specifies the desired access rights to the key. The function fails if the security descriptor of the key does not permit the requested access for the calling process. For more information, see Registry Key Security and Access Rights.
phkResult : [intptr] A pointer to a variable that receives a handle to the opened key. When you no longer need the returned handle, call the RegCloseKey function to close it.
%inst
Retrieves a handle to the HKEY_CURRENT_USER key for the user the
current thread is impersonating.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
Winerror.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error.

[備考]
The HKEY_CURRENT_USER key maps to the root of the current user's
branch in the HKEY_USERS key. It is cached for all threads in a
process. Therefore, this value does not change when another user's
profile is loaded. RegOpenCurrentUser uses the thread's token to
access the appropriate key, or the default if the profile is not
loaded.


%index
RegOpenKeyExW
指定したレジストリキーを開く。キー名は大文字小文字を区別しない。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey, ulOptions, samDesired, phkResult
hKey : [intptr] オープン中のレジストリキーへのハンドル。RegCreateKeyEx または RegOpenKeyEx で取得したもの、または HKEY_CLASSES_ROOT、HKEY_CURRENT_CONFIG、HKEY_CURRENT_USER、HKEY_LOCAL_MACHINE、HKEY_USERS のいずれか。
lpSubKey : [wstr] 開くレジストリサブキーの名前。キー名は大文字小文字を区別しない。NULL または空文字列で hKey が定義済みキーの場合、システムは定義済みキーをリフレッシュし phkResult は hKey と同じハンドルを受け取る。
ulOptions : [int] キーを開く際のオプション。0 または次のいずれかを指定する:
samDesired : [int] 開くキーに対する希望アクセス権を指定するマスク。キーのセキュリティ記述子が要求アクセスを許可しない場合、関数は失敗する。
phkResult : [intptr] 開かれたキーへのハンドルを受け取る変数へのポインタ。定義済みキーでない場合、使用後は RegCloseKey を呼ぶ。
%inst
指定したレジストリキーを開く。キー名は大文字小文字を区別しない。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS。失敗した場合は Winerror.h で定義された 0 以外のエラーコード。

[備考]
RegCreateKeyEx
とは異なり、指定されたキーが存在しない場合でもキーを作成しない。一部のレジストリ操作はキーのセキュリティ記述子に対してアクセスチェックを行う点に注意。サービスやアプリケーションが複数ユーザーを偽装する場合は
HKEY_CURRENT_USER と一緒に使わず RegOpenCurrentUser を使うこと。


%index
RegOpenUserClassesRoot
Retrieves a handle to the HKEY_CLASSES_ROOT key for a specified user. The user is identified by an access token.
%group
Win32 advapi32
%prm
hToken, dwOptions, samDesired, phkResult
hToken : [intptr] A handle to a primary or impersonation access token that identifies the user of interest. This can be a token handle returned by a call to LogonUser, CreateRestrictedToken, DuplicateToken, DuplicateTokenEx, OpenProcessToken, or OpenThreadToken functions.
dwOptions : [int] This parameter is reserved and must be zero.
samDesired : [int] A mask that specifies the desired access rights to the key. The function fails if the security descriptor of the key does not permit the requested access for the calling process. For more information, see Registry Key Security and Access Rights.
phkResult : [intptr] A pointer to a variable that receives a handle to the opened key. When you no longer need the returned handle, call the RegCloseKey function to close it.
%inst
Retrieves a handle to the HKEY_CLASSES_ROOT key for a specified user.
The user is identified by an access token.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
Winerror.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error.

[備考]
The RegOpenUserClassesRoot function enables you to retrieve the
merged HKEY_CLASSES_ROOT information for users other than the
interactive user. For example, the server component of a
client/server application could use RegOpenUserClassesRoot to
retrieve the merged information for a client. RegOpenUserClassesRoot
fails if the user profile for the specified user is not loaded. When
a user logs on interactively, the system automatically loads the
user's profile. For other users, you can call the LoadUserProfile
function to load the user's profile. However, LoadUserProfile can be
very time-consuming, so do not call it for this purpose unless it is
absolutely necessary to have the user's merged HKEY_CLASSES_ROOT
information. Applications running in the security context of the
interactively logged-on user do not need to use
RegOpenUserClassesRoot. These applications can call the RegOpenKeyEx
function to retrieve a merged view of the HKEY_CLASSES_ROOT key for
the interactive user.


%index
RegQueryInfoKeyW
指定されたレジストリキーに関する情報を取得する。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpClass, lpcchClass, lpReserved, lpcSubKeys, lpcbMaxSubKeyLen, lpcbMaxClassLen, lpcValues, lpcbMaxValueNameLen, lpcbMaxValueLen, lpcbSecurityDescriptor, lpftLastWriteTime
hKey : [intptr] オープン中のレジストリキーへのハンドル。KEY_QUERY_VALUE アクセス権で開かれている必要がある。
lpClass : [wstr] キーのユーザー定義クラスを受け取るバッファへのポインタ。NULL を指定可能。
lpcchClass : [var] lpClass バッファのサイズ(終端 NULL を含む文字数)を指定する変数へのポインタ。関数が戻ると、バッファに格納されたクラス文字列のサイズ(終端 NULL を含まない)が格納される。バッファが小さければ ERROR_MORE_DATA を返す。
lpReserved : [var] このパラメータは予約されており NULL でなければならない。
lpcSubKeys : [var] 指定されたキーが含むサブキーの数を受け取る変数へのポインタ。NULL を指定可能。
lpcbMaxSubKeyLen : [var] キーのサブキーの最も長い名前のサイズ(終端 NULL を含まない Unicode 文字数)を受け取る変数へのポインタ。NULL を指定可能。
lpcbMaxClassLen : [var] サブキークラスを指定する最も長い文字列のサイズ(終端 NULL を含まない Unicode 文字数)を受け取る変数へのポインタ。NULL を指定可能。
lpcValues : [var] キーに関連付けられた値の数を受け取る変数へのポインタ。NULL を指定可能。
lpcbMaxValueNameLen : [var] キーの最も長い値名のサイズ(終端 NULL を含まない Unicode 文字数)を受け取る変数へのポインタ。NULL を指定可能。
lpcbMaxValueLen : [var] キーの値の中で最も長いデータコンポーネントのサイズ(バイト単位)を受け取る変数へのポインタ。NULL を指定可能。
lpcbSecurityDescriptor : [var] キーのセキュリティ記述子のサイズ(バイト単位)を受け取る変数へのポインタ。NULL を指定可能。
lpftLastWriteTime : [var] 最終書き込み時刻を受け取る FILETIME 構造体へのポインタ。NULL を指定可能。
%inst
指定されたレジストリキーに関する情報を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS。失敗した場合はシステムエラーコード。lpClass
バッファがクラス名を受け取るには小さすぎる場合は ERROR_MORE_DATA。

[備考]
winreg.h ヘッダは RegQueryInfoKey を UNICODE プリプロセッサ定数に基づく ANSI/Unicode
版のエイリアスとして定義する。


%index
RegQueryValueExW
オープンレジストリキーに関連付けられた指定された値名のタイプとデータを取得する。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpValueName, lpReserved, lpType, lpData, lpcbData
hKey : [intptr] オープン中のレジストリキーへのハンドル。KEY_QUERY_VALUE アクセス権で開かれている必要がある。
lpValueName : [wstr] レジストリ値の名前。
lpReserved : [var] このパラメータは予約されており NULL でなければならない。
lpType : [var] 指定された値に格納されているデータタイプを示すコードを受け取る変数へのポインタ。タイプコードが不要なら NULL 可。
lpData : [var] 値のデータを受け取るバッファへのポインタ。データが不要なら NULL 可。
lpcbData : [var] lpData が指すバッファのサイズ(バイト単位)を指定する変数へのポインタ。関数が戻ると、コピーされたデータサイズが格納される。
%inst
オープンレジストリキーに関連付けられた指定された値名のタイプとデータを取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS。失敗した場合はシステムエラーコード。lpData バッファが小さすぎる場合は
ERROR_MORE_DATA。指定された値が存在しない場合は ERROR_FILE_NOT_FOUND。

[備考]
通常、アプリケーションは RegEnumValue で値名を決定した後、RegQueryValueEx
でデータを取得する。REG_SZ、REG_MULTI_SZ、REG_EXPAND_SZ の場合、文字列が正しく NULL
終端されていない可能性があるため、使用前に確認する(REG_MULTI_SZ は 2 つの終端 NULL が必要)。RegGetValue
は必要に応じて NULL 終端を追加する。ANSI 版を使う場合、内部格納の Unicode 文字列を ANSI
に変換してからコピーする。HKEY_PERFORMANCE_DATA
を照会すると、要求していないオブジェクトが返されることがある(通常動作)。


%index
RegRestoreKeyW
Reads the registry information in a specified file and copies it over the specified key. This registry information may be in the form of a key and multiple levels of subkeys. (Unicode)
%group
Win32 advapi32
%prm
hKey, lpFile, dwFlags
hKey : [intptr] A handle to an open registry key. This handle is returned by the RegCreateKeyEx or RegOpenKeyEx function. It can also be one of the following predefined keys:
lpFile : [wstr] The name of the file with the registry information. This file is typically created by using the RegSaveKey function.
dwFlags : [int] 
%inst
Reads the registry information in a specified file and copies it over
the specified key. This registry information may be in the form of a
key and multiple levels of subkeys. (Unicode)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
Winerror.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error.

[備考]
There are two different registry hive file formats. Registry hives
created on current operating systems typically cannot be loaded by
earlier ones. If any subkeys of the hKey parameter are open,
RegRestoreKey fails. The calling process must have the
SE_RESTORE_NAME and SE_BACKUP_NAME privileges on the computer in
which the registry resides. For more information, see Running with
Special Privileges. This function replaces the keys and values below
the specified key with the keys and values that are subsidiary to the
top-level key in the file, no matter what the name of the top-level
key in the file might be. For example, hKey might identify a key A
with subkeys B and C, while the lpFile parameter specifies a file
containing key X with subkeys Y and Z. After a call to RegRestoreKey,
the registry would contain key A with subkeys Y and Z. The value
entries of A would be replaced by the value entries of X. The new
information in the file specified by lpFile overwrites the contents
of the key specified by the hKey parameter, except for the key name.
If hKey represents a key in a remote computer, the path described by
lpFile is relative to the remote computer.
> [!NOTE] > The winreg.h header defines RegRestoreKey as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
RegSaveKeyExW
Saves the specified key and all of its subkeys and values to a registry file, in the specified format. (Unicode)
%group
Win32 advapi32
%prm
hKey, lpFile, lpSecurityAttributes, Flags
hKey : [intptr] A handle to an open registry key. This function does not support the HKEY_CLASSES_ROOT predefined key.
lpFile : [wstr] The name of the file in which the specified key and subkeys are to be saved. If the file already exists, the function fails.
lpSecurityAttributes : [var] A pointer to a SECURITY_ATTRIBUTES structure that specifies a security descriptor for the new file. If lpSecurityAttributes is NULL, the file gets a default security descriptor. The ACLs in a default security descriptor for a file are inherited from its parent directory.
Flags : [int] 
%inst
Saves the specified key and all of its subkeys and values to a
registry file, in the specified format. (Unicode)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
Winerror.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error. If more than one of the possible values listed above for the
Flags parameter is specified in one call to this function?for
example, if two or more values are OR'ed? or if REG_NO_COMPRESSION is
specified and hKey specifies a key that is not the root of a hive,
this function returns ERROR_INVALID_PARAMETER.

[備考]
Unlike RegSaveKey, this function does not support the
HKEY_CLASSES_ROOT predefined key. If hKey represents a key on a
remote computer, the path described by lpFile is relative to the
remote computer. The RegSaveKeyEx function saves only nonvolatile
keys. It does not save volatile keys. A key is made volatile or
nonvolatile at its creation; see RegCreateKeyEx. You can use the file
created by RegSaveKeyEx in subsequent calls to the RegLoadKey,
RegReplaceKey, or RegRestoreKey function. If RegSaveKeyEx fails
partway through its operation, the file will be corrupt and
subsequent calls to RegLoadKey, RegReplaceKey, or RegRestoreKey for
the file will fail. Using RegSaveKeyEx together with RegRestoreKey to
copy subtrees in the registry is not recommended. This method does
not trigger notifications and can invalidate handles used by other
applications. Instead, use the SHCopyKey function or the RegCopyTree
function. The calling process must have the SE_BACKUP_NAME privilege
enabled. For more information, see Running with Special Privileges.
> [!NOTE] > The winreg.h header defines RegSaveKeyEx as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
RegSetKeySecurity
Sets the security of an open registry key.
%group
Win32 advapi32
%prm
hKey, SecurityInformation, pSecurityDescriptor
hKey : [intptr] A handle to an open key for which the security descriptor is set.
SecurityInformation : [int] A set of bit flags that indicate the type of security information to set. This parameter can be a combination of the SECURITY_INFORMATION bit flags.
pSecurityDescriptor : [int] A pointer to a SECURITY_DESCRIPTOR structure that specifies the security attributes to set for the specified key.
%inst
Sets the security of an open registry key.

[戻り値]
If the function succeeds, the function returns ERROR_SUCCESS.
If the function fails, it returns a nonzero error code defined in
WinError.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error.

[備考]
If hKey is one of the predefined keys, use the RegCloseKey function
to close the predefined key to ensure that the new security
information is in effect the next time the predefined key is
referenced.


%index
RegSetValueExW
レジストリキー配下の指定された値のデータとタイプを設定する。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpValueName, Reserved, dwType, lpData, cbData
hKey : [intptr] オープン中のレジストリキーへのハンドル。KEY_SET_VALUE アクセス権で開かれている必要がある。RegCreateKeyEx 等で取得したもの、または定義済みキーのいずれか。
lpValueName : [wstr] 設定する値の名前。キーにない場合は追加される。NULL または空文字列の場合、キーの名前なし/既定値のタイプとデータを設定する。
Reserved : [int] このパラメータは予約されており 0 でなければならない。
dwType : [int] lpData が指すデータタイプ。指定可能なタイプは Registry Value Types を参照。
lpData : [var] 保存するデータ。REG_SZ のような文字列ベースのタイプでは NULL 終端されていなければならない。REG_MULTI_SZ は 2 つの終端 NULL が必要。NULL 値を示す場合は cbData を 0 にする必要がある。
cbData : [int] lpData が指す情報のサイズ(バイト単位)。REG_SZ、REG_EXPAND_SZ、REG_MULTI_SZ の場合、終端 NULL のサイズを含めなければならない。
%inst
レジストリキー配下の指定された値のデータとタイプを設定する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS。失敗した場合は Winerror.h で定義された 0 以外のエラーコード。

[備考]
値サイズは利用可能メモリに制限されるが、大きな値を保存するとパフォーマンスに影響する。長い値(2,048
バイト超)はファイルとして保存し、レジストリにはパスのみを保存すべきである。アイコン、ビットマップ、実行ファイルなどはファイルとして保存すること。REG_SZ/REG_MULTI_SZ/REG_EXPAND_SZ
で ANSI 版を使う場合、lpData は ANSI 文字列で、レジストリに保存される前に Unicode
に変換される。RegSetKeyValue の方が便利な場合がある。


%index
RegUnLoadKeyW
Unloads the specified registry key and its subkeys from the registry. (Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey
hKey : [intptr] A handle to the registry key to be unloaded. This parameter can be a handle returned by a call to RegConnectRegistry function or one of the following predefined handles: * HKEY_LOCAL_MACHINE * HKEY_USERS
lpSubKey : [wstr] The name of the subkey to be unloaded. The key referred to by the lpSubKey parameter must have been created by using the RegLoadKey function.
%inst
Unloads the specified registry key and its subkeys from the registry.
(Unicode)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
Winerror.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error.

[備考]
This function removes a hive from the registry but does not modify
the file containing the registry information. A hive is a discrete
body of keys, subkeys, and values that is rooted at the top of the
registry hierarchy. The calling process must have the SE_RESTORE_NAME
and SE_BACKUP_NAME privileges on the computer in which the registry
resides. For more information, see Running with Special Privileges.
> [!NOTE] > The winreg.h header defines RegUnLoadKey as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
AbortSystemShutdownW
Stops a system shutdown that has been initiated. (Unicode)
%group
Win32 advapi32
%prm
lpMachineName
lpMachineName : [wstr] The network name of the computer where the shutdown is to be stopped. If lpMachineName is NULL or an empty string, the function stops the shutdown on the local computer.
%inst
Stops a system shutdown that has been initiated. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The InitiateSystemShutdown and InitiateSystemShutdownEx functions
display a dialog box that notifies the user that the system is
shutting down. During the shutdown time-out period, the
AbortSystemShutdown function can prevent the system from shutting
down. Windows Server 2003 and Windows XP with SP1: If the computer to
be shut down is a Terminal Services server, the system displays a
dialog box to all local and remote users warning them that shutdown
has been initiated. If shutdown is prevented by AbortSystemShutdown,
the system displays dialog box to the users informing them that the
server is no longer shutting down. To stop the local computer from
shutting down, the calling process must have the SE_SHUTDOWN_NAME
privilege. To stop a remote computer from shutting down, the calling
process must have the SE_REMOTE_SHUTDOWN_NAME privilege on the remote
computer. By default, users can enable the SE_SHUTDOWN_NAME privilege
on the computer they are logged onto, and administrators can enable
the SE_REMOTE_SHUTDOWN_NAME privilege on remote computers. For more
information, see Running with Special Privileges. Common reasons for
failure include an invalid computer name, an inaccessible computer,
or insufficient privilege.


%index
AccessCheck
Determines whether a security descriptor grants a specified set of access rights to the client identified by an access token. (AccessCheck)
%group
Win32 advapi32
%prm
pSecurityDescriptor, ClientToken, DesiredAccess, GenericMapping, PrivilegeSet, PrivilegeSetLength, GrantedAccess, AccessStatus
pSecurityDescriptor : [int] A pointer to a SECURITY_DESCRIPTOR structure against which access is checked.
ClientToken : [intptr] A handle to an impersonation token that represents the client that is attempting to gain access. The handle must have TOKEN_QUERY access to the token; otherwise, the function fails with ERROR_ACCESS_DENIED.
DesiredAccess : [int] Access mask that specifies the access rights to check. This mask must have been mapped by the MapGenericMask function to contain no generic access rights.
GenericMapping : [var] A pointer to the GENERIC_MAPPING structure associated with the object for which access is being checked.
PrivilegeSet : [var] A pointer to a PRIVILEGE_SET structure that receives the privileges used to perform the access validation. If no privileges were used, the function sets the PrivilegeCount member to zero.
PrivilegeSetLength : [var] Specifies the size, in bytes, of the buffer pointed to by the PrivilegeSet parameter.
GrantedAccess : [var] A pointer to an access mask that receives the granted access rights. If AccessStatus is set to FALSE, the function sets the access mask to zero. If the function fails, it does not set the access mask.
AccessStatus : [var] A pointer to a variable that receives the results of the access check. If the security descriptor allows the requested access rights to the client identified by the access token, AccessStatus is set to TRUE. Otherwise, AccessStatus is set to FALSE, and you can call GetLastError to get extended error information.
%inst
Determines whether a security descriptor grants a specified set of
access rights to the client identified by an access token.
(AccessCheck)

[戻り値]
If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. To get extended
error information, call GetLastError.

[備考]
For more information, see the How AccessCheck Works overview. The
AccessCheck function compares the specified security descriptor with
the specified access token and indicates, in the AccessStatus
parameter, whether access is granted or denied. If access is granted,
the requested access mask becomes the object's granted access mask.
If the security descriptor's DACL is NULL, the AccessStatus parameter
returns TRUE, which indicates that the client has the requested
access. The AccessCheck function fails with
ERROR_INVALID_SECURITY_DESCR if the security descriptor does not
contain owner and group SIDs. The AccessCheck function does not
generate an audit. If your application requires audits for access
checks, use functions such as AccessCheckAndAuditAlarm,
AccessCheckByTypeAndAuditAlarm,
AccessCheckByTypeResultListAndAuditAlarm, or
AccessCheckByTypeResultListAndAuditAlarmByHandle, instead of
AccessCheck.


%index
AccessCheckAndAuditAlarmW
Determines whether a security descriptor grants a specified set of access rights to the client being impersonated by the calling thread.
%group
Win32 advapi32
%prm
SubsystemName, HandleId, ObjectTypeName, ObjectName, SecurityDescriptor, DesiredAccess, GenericMapping, ObjectCreation, GrantedAccess, AccessStatus, pfGenerateOnClose
SubsystemName : [wstr] A pointer to a null-terminated string specifying the name of the subsystem calling the function. This string appears in any audit message that the function generates.
HandleId : [intptr] A pointer to a unique value representing the client's handle to the object. If the access is denied, the system ignores this value.
ObjectTypeName : [wstr] A pointer to a null-terminated string specifying the type of object being created or accessed. This string appears in any audit message that the function generates.
ObjectName : [wstr] A pointer to a null-terminated string specifying the name of the object being created or accessed. This string appears in any audit message that the function generates.
SecurityDescriptor : [int] A pointer to the SECURITY_DESCRIPTOR structure against which access is checked.
DesiredAccess : [int] Access mask that specifies the access rights to check. This mask must have been mapped by the MapGenericMask function to contain no generic access rights. If this parameter is MAXIMUM_ALLOWED, the function sets the GrantedAccess access mask to indicate the maximum access rights the security descriptor allows the client.
GenericMapping : [var] A pointer to the GENERIC_MAPPING structure associated with the object for which access is being checked.
ObjectCreation : [int] Specifies a flag that determines whether the calling application will create a new object when access is granted. A value of TRUE indicates the application will create a new object. A value of FALSE indicates the application will open an existing object.
GrantedAccess : [var] A pointer to an access mask that receives the granted access rights. If AccessStatus is set to FALSE, the function sets the access mask to zero. If the function fails, it does not set the access mask.
AccessStatus : [var] A pointer to a variable that receives the results of the access check. If the security descriptor allows the requested access rights to the client, AccessStatus is set to TRUE. Otherwise, AccessStatus is set to FALSE.
pfGenerateOnClose : [var] A pointer to a flag set by the audit-generation routine when the function returns. Pass this flag to the ObjectCloseAuditAlarm function when the object handle is closed.
%inst
Determines whether a security descriptor grants a specified set of
access rights to the client being impersonated by the calling thread.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
For more information, see the How AccessCheck Works overview. The
AccessCheckAndAuditAlarm function requires the calling process to
have the SE_AUDIT_NAME privilege enabled. The test for this privilege
is performed against the primary token of the calling process, not
the impersonation token of the thread. The AccessCheckAndAuditAlarm
function fails if the calling thread is not impersonating a client.


%index
AccessCheckByType
Determines whether a security descriptor grants a specified set of access rights to the client identified by an access token. (AccessCheckByType)
%group
Win32 advapi32
%prm
pSecurityDescriptor, PrincipalSelfSid, ClientToken, DesiredAccess, ObjectTypeList, ObjectTypeListLength, GenericMapping, PrivilegeSet, PrivilegeSetLength, GrantedAccess, AccessStatus
pSecurityDescriptor : [int] A pointer to a SECURITY_DESCRIPTOR structure against which access is checked.
PrincipalSelfSid : [int] A pointer to a security identifier (SID). If the security descriptor is associated with an object that represents a principal (for example, a user object), the PrincipalSelfSid parameter should be the SID of the object. When evaluating access, this SID logically replaces the SID in any access control entry  containing the well-known PRINCIPAL_SELF SID (S-1-5-10). For information about well-known SIDs, see Well-known SIDs.
ClientToken : [intptr] A handle to an impersonation token that represents the client attempting to gain access. The handle must have TOKEN_QUERY access to the token; otherwise, the function fails with ERROR_ACCESS_DENIED.
DesiredAccess : [int] Access mask that specifies the access rights to check. This mask must have been mapped by the MapGenericMask function to contain no generic access rights.
ObjectTypeList : [var] A pointer to an array of OBJECT_TYPE_LIST structures that identify the hierarchy of object types for which to check access. Each element in the array specifies a GUID that identifies the object type and a value indicating the level of the object type in the hierarchy of object types. The array should not have two elements with the same GUID.
ObjectTypeListLength : [int] Specifies the number of elements in the ObjectTypeList array.
GenericMapping : [var] A pointer to the GENERIC_MAPPING structure associated with the object for which access is being checked. The GenericAll member of the  GENERIC_MAPPING structure should contain all the access rights that can be granted by the resource manager, including STANDARD_RIGHTS_ALL and all of the rights that are set in the GenericRead, GenericWrite, and GenericExecute members.
PrivilegeSet : [var] A pointer to a PRIVILEGE_SET structure that receives the privileges used to perform the access validation. If no privileges were used, the function sets the PrivilegeCount member to zero.
PrivilegeSetLength : [var] Specifies the size, in bytes, of the buffer pointed to by the PrivilegeSet parameter.
GrantedAccess : [var] A pointer to an access mask that receives the granted access rights. If AccessStatus is set to FALSE, the function sets the access mask to zero. If the function fails, it does not set the access mask.
AccessStatus : [var] A pointer to a variable that receives the results of the access check. If the security descriptor allows the requested access rights to the client identified by the access token, AccessStatus is set to TRUE. Otherwise, AccessStatus is set to FALSE, and you can call GetLastError to get extended error information.
%inst
Determines whether a security descriptor grants a specified set of
access rights to the client identified by an access token.
(AccessCheckByType)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
For more information, see the How AccessCheck Works overview. The
AccessCheckByType function compares the specified security descriptor
with the specified access token and indicates, in the AccessStatus
parameter, whether access is granted or denied. The ObjectTypeList
array does not necessarily represent the entire defined object.
Rather, it represents that subset of the object for which to check
access. For instance, to check access to two properties in a property
set, specify an object type list with four elements: the object
itself at level zero, the property set at level 1, and the two
properties at level 2. The AccessCheckByType function evaluates ACEs
that apply to the object itself and object-specific ACEs for the
object types listed in the ObjectTypeList array. The function ignores
object-specific ACEs for object types not listed in the
ObjectTypeList array. Thus, the results returned in the AccessStatus
parameter indicate the access allowed to the subset of the object
defined by the ObjectTypeList parameter, not to the entire object.
For more information about how a hierarchy of ACEs controls access to
an object and its subobjects, see ACEs to Control Access to an
Object's Properties. If the security descriptor's DACL is NULL, the
AccessStatus parameter returns TRUE, indicating that the client has
the requested access. If the security descriptor does not contain
owner and group SIDs, AccessCheckByType fails with
ERROR_INVALID_SECURITY_DESCR.


%index
AccessCheckByTypeAndAuditAlarmW
Determines whether a security descriptor grants a specified set of access rights to the client being impersonated by the calling thread. (AccessCheckByTypeAndAuditAlarmW)
%group
Win32 advapi32
%prm
SubsystemName, HandleId, ObjectTypeName, ObjectName, SecurityDescriptor, PrincipalSelfSid, DesiredAccess, AuditType, Flags, ObjectTypeList, ObjectTypeListLength, GenericMapping, ObjectCreation, GrantedAccess, AccessStatus, pfGenerateOnClose
SubsystemName : [wstr] A pointer to a null-terminated string that specifies the name of the subsystem calling the function. This string appears in any audit message that the function generates.
HandleId : [intptr] A pointer to a unique value that represents the client's handle to the object. If the access is denied, the system ignores this value.
ObjectTypeName : [wstr] A pointer to a null-terminated string that specifies the type of object being created or accessed. This string appears in any audit message that the function generates.
ObjectName : [wstr] A pointer to a null-terminated string that specifies the name of the object being created or accessed. This string appears in any audit message that the function generates.
SecurityDescriptor : [int] A pointer to a SECURITY_DESCRIPTOR structure against which access is checked.
PrincipalSelfSid : [int] A pointer to a security identifier (SID). If the security descriptor is associated with an object that represents a principal (for example, a user object), the PrincipalSelfSid parameter should be the SID of the object. When evaluating access, this SID logically replaces the SID in any ACE containing the well-known PRINCIPAL_SELF SID (S-1-5-10). For information about well-known SIDs, see Well-known SIDs. If the protected object does not represent a principal, set this parameter to NULL.
DesiredAccess : [int] An access mask that specifies the access rights to check. This mask must have been mapped by the MapGenericMask function to contain no generic access rights. If this parameter is MAXIMUM_ALLOWED, the function sets the GrantedAccess access mask to indicate the maximum access rights the security descriptor allows the client.
AuditType : [int] The type of audit to be generated. This can be one of the values from the AUDIT_EVENT_TYPE enumeration type.
Flags : [int] A flag that controls the function's behavior if the calling process does not have the SE_AUDIT_NAME privilege enabled. If the AUDIT_ALLOW_NO_PRIVILEGE flag is set, the function performs the access check without generating audit messages when the privilege is not enabled. If this parameter is zero, the function fails if the privilege is not enabled.
ObjectTypeList : [var] A pointer to an array of OBJECT_TYPE_LIST structures that identify the hierarchy of object types for which to check access. Each element in the array specifies a GUID that identifies the object type and a value that indicates the level of the object type in the hierarchy of object types. The array should not have two elements with the same GUID. The array must have at least one element. The first element in the array must be at level zero and identify the object itself. The array can have only one level zero element. The second element is a subobject, such as a property set, at level 1. Following each level 1 entry are subordinate entries for the level 2 through 4 subobjects. Thus, the levels for the elements in the array might be {0, 1, 2, 2, 1, 2, 3}. If the object type list is out of order, AccessCheckByTypeAndAuditAlarm fails and GetLastError returns ERROR_INVALID_PARAMETER.
ObjectTypeListLength : [int] The number of elements in the ObjectTypeList array.
GenericMapping : [var] A pointer to the GENERIC_MAPPING structure associated with the object for which access is being checked.
ObjectCreation : [int] A flag that determines whether the calling application will create a new object when access is granted. A value of TRUE indicates the application will create a new object. A value of FALSE indicates the application will open an existing object.
GrantedAccess : [var] A pointer to an access mask that receives the granted access rights. If AccessStatus is set to FALSE, the function sets the access mask to zero. If the function fails, it does not set the access mask.
AccessStatus : [var] A pointer to a variable that receives the results of the access check. If the security descriptor allows the requested access rights to the client, AccessStatus is set to TRUE. Otherwise, AccessStatus is set to FALSE and you can call GetLastError to get extended error information.
pfGenerateOnClose : [var] A pointer to a flag set by the audit-generation routine when the function returns. Pass this flag to the ObjectCloseAuditAlarm function when the object handle is closed.
%inst
Determines whether a security descriptor grants a specified set of
access rights to the client being impersonated by the calling thread.
(AccessCheckByTypeAndAuditAlarmW)

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. To get extended error information,
call GetLastError.

[備考]
For more information, see the How AccessCheck Works overview. If the
PrincipalSelfSid and ObjectTypeList parameters are NULL, the
AuditType parameter is AuditEventObjectAccess, and the Flags
parameter is zero, AccessCheckByTypeAndAuditAlarm performs in the
same way as the AccessCheckAndAuditAlarm function. The ObjectTypeList
array does not necessarily represent the entire defined object.
Rather, it represents that subset of the object for which to check
access. For instance, to check access to two properties in a property
set, specify an object type list with four elements: the object
itself at level zero, the property set at level 1, and the two
properties at level 2. The AccessCheckByTypeAndAuditAlarm function
evaluates ACEs that apply to the object itself and object-specific
ACEs for the object types listed in the ObjectTypeList array. The
function ignores object-specific ACEs for object types not listed in
the ObjectTypeList array. Thus, the results returned in the
AccessStatus parameter indicate the access allowed to the subset of
the object defined by the ObjectTypeList parameter, not to the entire
object. For more information about how a hierarchy of ACEs controls
access to an object and its subobjects, see ACEs to Control Access to
an Object's Properties. To generate audit messages in the security
event log, the calling process must have the SE_AUDIT_NAME privilege
enabled. The system checks for this privilege in the primary token of
the calling process, not the impersonation token of the thread. If
the Flags parameter includes the AUDIT_ALLOW_NO_PRIVILEGE flag, the
function performs the access check without generating audit messages
when the privilege is not enabled. The AccessCheckByTypeAndAuditAlarm
function fails if the calling thread is not impersonating a client.
If the security descriptor does not contain owner and group SIDs,
AccessCheckByTypeAndAuditAlarm fails with
ERROR_INVALID_SECURITY_DESCR.


%index
AccessCheckByTypeResultList
Determines whether a security descriptor grants a specified set of access rights to the client identified by an access token. (AccessCheckByTypeResultList)
%group
Win32 advapi32
%prm
pSecurityDescriptor, PrincipalSelfSid, ClientToken, DesiredAccess, ObjectTypeList, ObjectTypeListLength, GenericMapping, PrivilegeSet, PrivilegeSetLength, GrantedAccessList, AccessStatusList
pSecurityDescriptor : [int] A pointer to a SECURITY_DESCRIPTOR structure against which access is checked.
PrincipalSelfSid : [int] A pointer to a security identifier (SID). If the security descriptor is associated with an object that represents a principal (for example, a user object), the PrincipalSelfSid parameter should be the SID of the object. When evaluating access, this SID logically replaces the SID in any access control entry (ACE) that contains the well-known PRINCIPAL_SELF SID (S-1-5-10). For information about well-known SIDs, see Well-known SIDs.
ClientToken : [intptr] A handle to an impersonation token that represents the client attempting to gain access. The handle must have TOKEN_QUERY access to the token; otherwise, the function fails with ERROR_ACCESS_DENIED.
DesiredAccess : [int] An access mask that specifies the access rights to check. This mask must have been mapped by the MapGenericMask function to contain no generic access rights.
ObjectTypeList : [var] A pointer to an array of OBJECT_TYPE_LIST structures that identify the hierarchy of object types for which to check access. Each element in the array specifies a GUID that identifies the object type and a value that indicates the level of the object type in the hierarchy of object types. The array should not have two elements with the same GUID.
ObjectTypeListLength : [int] The number of elements in the ObjectTypeList array. This is also the number of elements in the arrays pointed to by the GrantedAccessList and AccessStatusList parameters.
GenericMapping : [var] A pointer to the GENERIC_MAPPING structure associated with the object for which access is being checked.
PrivilegeSet : [var] A pointer to a PRIVILEGE_SET structure that receives the privileges used to perform the access validation. If no privileges were used, the function sets the PrivilegeCount member to zero.
PrivilegeSetLength : [var] The size, in bytes, of the buffer pointed to by the PrivilegeSet parameter.
GrantedAccessList : [var] A pointer to an array of access masks. The function sets each access mask to indicate the access rights granted to the corresponding element in the object type list. If the function fails, it does not set the access masks.
AccessStatusList : [var] A pointer to an array of status codes for the corresponding elements in the object type list. The function sets an element to zero to indicate success or a nonzero value to indicate the specific error during the access check. If the function fails, it does not set any of the elements in the array.
%inst
Determines whether a security descriptor grants a specified set of
access rights to the client identified by an access token.
(AccessCheckByTypeResultList)

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. To get extended error information,
call GetLastError.

[備考]
For more information, see the How AccessCheck Works overview. The
AccessCheckByTypeResultList function compares the specified security
descriptor with the specified access token and indicates, in the
AccessStatusList parameter, whether access is granted or denied for
each of the elements in the object types list. The ObjectTypeList
array does not necessarily represent the entire defined object.
Rather, it represents that subset of the object for which to check
access. For instance, to check access to two properties in a property
set, specify an object type list with four elements: the object
itself at level zero, the property set at level 1, and the two
properties at level 2. The AccessCheckByTypeResultList function
evaluates ACEs that apply to the object itself and object-specific
ACEs for the object types listed in the ObjectTypeList array. The
function ignores object-specific ACEs for object types not listed in
the ObjectTypeList array. Thus, the results returned for element zero
in the AccessStatusList parameter indicate the access allowed to the
subset of the object defined by the ObjectTypeList parameter, not to
the entire object. For more information about how a hierarchy of ACEs
controls access to an object and its subobjects, see ACEs to Control
Access to an Object's Properties. If the security descriptor's
discretionary access control list (DACL) is NULL, the function grants
the requested access to all of the elements in the object type list.
If the security descriptor does not contain owner and group SIDs,
AccessCheckByTypeResultList fails with ERROR_INVALID_SECURITY_DESCR.


%index
AccessCheckByTypeResultListAndAuditAlarmW
Determines whether a security descriptor grants a specified set of access rights to the client being impersonated by the calling thread. (AccessCheckByTypeResultListAndAuditAlarmW)
%group
Win32 advapi32
%prm
SubsystemName, HandleId, ObjectTypeName, ObjectName, SecurityDescriptor, PrincipalSelfSid, DesiredAccess, AuditType, Flags, ObjectTypeList, ObjectTypeListLength, GenericMapping, ObjectCreation, GrantedAccessList, AccessStatusList, pfGenerateOnClose
SubsystemName : [wstr] A pointer to a null-terminated string that specifies the name of the subsystem calling the function. This string appears in any audit message that the function generates.
HandleId : [intptr] A pointer to a unique value that represents the client's handle to the object. If the access is denied, the system ignores this value.
ObjectTypeName : [wstr] A pointer to a null-terminated string that specifies the type of object being created or accessed. This string appears in any audit message that the function generates.
ObjectName : [wstr] A pointer to a null-terminated string that specifies the name of the object being created or accessed. This string appears in any audit message that the function generates.
SecurityDescriptor : [int] A pointer to a SECURITY_DESCRIPTOR structure against which access is checked.
PrincipalSelfSid : [int] A pointer to a security identifier (SID). If the security descriptor is associated with an object that represents a principal (for example, a user object), the PrincipalSelfSid parameter should be the SID of the object. When evaluating access, this SID logically replaces the SID in any ACE that contains the well-known PRINCIPAL_SELF SID (S-1-5-10). For information about well-known SIDs, see Well-known SIDs. Set this parameter to NULL if the protected object does not represent a principal.
DesiredAccess : [int] An access mask that specifies the access rights to check. This mask must have been mapped by the MapGenericMask function so that it contains no generic access rights. If this parameter is MAXIMUM_ALLOWED, the function sets the access mask in GrantedAccess to indicate the maximum access rights the security descriptor allows the client.
AuditType : [int] The type of audit to be generated. This can be one of the values from the AUDIT_EVENT_TYPE enumeration type.
Flags : [int] A flag that controls the function's behavior if the calling process does not have the SE_AUDIT_NAME privilege enabled. If the AUDIT_ALLOW_NO_PRIVILEGE flag is set, the function performs the access check without generating audit messages when the privilege is not enabled. If this parameter is zero, the function fails if the privilege is not enabled.
ObjectTypeList : [var] A pointer to an array of OBJECT_TYPE_LIST structures that identify the hierarchy of object types for which to check access. Each element in the array specifies a GUID that identifies the object type and a value that indicates the level of the object type in the hierarchy of object types. The array should not have two elements with the same GUID. The array must have at least one element. The first element in the array must be at level zero and identify the object itself. The array can have only one level zero element. The second element is a subobject, such as a property set, at level 1. Following each level 1 entry are subordinate entries for the level 2 through 4 subobjects. Thus, the levels for the elements in the array might be {0, 1, 2, 2, 1, 2, 3}. If the object type list is out of order, AccessCheckByTypeResultListAndAuditAlarm fails, and GetLastError returns ERROR_INVALID_PARAMETER.
ObjectTypeListLength : [int] The number of elements in the ObjectTypeList array.
GenericMapping : [var] A pointer to the GENERIC_MAPPING structure associated with the object for which access is being checked.
ObjectCreation : [int] A flag that determines whether the calling application will create a new object when access is granted. A value of TRUE indicates the application will create a new object. A value of FALSE indicates the application will open an existing object.
GrantedAccessList : [var] 
AccessStatusList : [var] A pointer to an array of status codes for the corresponding elements in the object type list. The function sets an element to zero to indicate success or to a nonzero value to indicate the specific error during the access check. If the function fails, it does not set any of the elements in the array.
pfGenerateOnClose : [var] A pointer to a flag set by the audit-generation routine when the function returns. Pass this flag to the ObjectCloseAuditAlarm function when the object handle is closed.
%inst
Determines whether a security descriptor grants a specified set of
access rights to the client being impersonated by the calling thread.
(AccessCheckByTypeResultListAndAuditAlarmW)

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. To get extended error information,
call GetLastError.

[備考]
For more information, see the How AccessCheck Works overview. The
AccessCheckByTypeResultListAndAuditAlarm function is a combination of
the AccessCheckByTypeResultList and AccessCheckAndAuditAlarm
functions. The ObjectTypeList array does not necessarily represent
the entire defined object. Rather, it represents that subset of the
object for which to check access. For instance, to check access to
two properties in a property set, specify an object type list with
four elements: the object itself at level zero, the property set at
level 1, and the two properties at level 2. The
AccessCheckByTypeResultListAndAuditAlarm function evaluates ACEs that
apply to the object itself and object-specific ACEs for the object
types listed in the ObjectTypeList array. The function ignores
object-specific ACEs for object types not listed in the
ObjectTypeList array. For more information about how a hierarchy of
ACEs controls access to an object and its subobjects, see ACEs to
Control Access to an Object's Properties. To generate audit messages
in the security event log, the calling process must have the
SE_AUDIT_NAME privilege enabled. The system checks for this privilege
in the primary token of the calling process, not the impersonation
token of the thread. If the Flags parameter includes the
AUDIT_ALLOW_NO_PRIVILEGE flag, the function performs the access check
without generating audit messages when the privilege is not enabled.
The AccessCheckByTypeResultListAndAuditAlarm function fails if the
calling thread is not impersonating a client. If the security
descriptor does not contain owner and group SIDs,
AccessCheckByTypeResultListAndAuditAlarm fails with
ERROR_INVALID_SECURITY_DESCR.


%index
AccessCheckByTypeResultListAndAuditAlarmByHandleW
The AccessCheckByTypeResultListAndAuditAlarmByHandleW (Unicode) function (securitybaseapi.h) determines whether a security descriptor grants access rights to the client that the calling thread is impersonating.
%group
Win32 advapi32
%prm
SubsystemName, HandleId, ClientToken, ObjectTypeName, ObjectName, SecurityDescriptor, PrincipalSelfSid, DesiredAccess, AuditType, Flags, ObjectTypeList, ObjectTypeListLength, GenericMapping, ObjectCreation, GrantedAccessList, AccessStatusList, pfGenerateOnClose
SubsystemName : [wstr] A pointer to a null-terminated string that specifies the name of the subsystem calling the function. This string appears in any audit message that the function generates.
HandleId : [intptr] A pointer to a unique value that represents the client's handle to the object. If the access is denied, the system ignores this value.
ClientToken : [intptr] A handle to a token object that represents the client that requested the operation. This handle must be obtained through a communication session layer, such as a local named pipe, to prevent possible security policy violations. The caller must have TOKEN_QUERY access for the specified token.
ObjectTypeName : [wstr] A pointer to a null-terminated string that specifies the type of object being created or accessed. This string appears in any audit message that the function generates.
ObjectName : [wstr] A pointer to a null-terminated string that specifies the name of the object being created or accessed. This string appears in any audit message that the function generates.
SecurityDescriptor : [int] A pointer to a SECURITY_DESCRIPTOR structure against which access is checked.
PrincipalSelfSid : [int] A pointer to a SID. If the security descriptor is associated with an object that represents a principal (for example, a user object), the PrincipalSelfSid parameter should be the SID of the object. When evaluating access, this SID logically replaces the SID in any ACE containing the well-known PRINCIPAL_SELF SID (S-1-5-10). For information about well-known SIDs, see Well-known SIDs. Set this parameter to NULL if the protected object does not represent a principal.
DesiredAccess : [int] An access mask that specifies the access rights to check. This mask must have been mapped by the MapGenericMask function so that it contains no generic access rights. If this parameter is MAXIMUM_ALLOWED, the function sets the access mask in GrantedAccess to indicate the maximum access rights the security descriptor allows the client.
AuditType : [int] The type of audit to be generated. This can be one of the values from the AUDIT_EVENT_TYPE enumeration type.
Flags : [int] A flag that controls the function's behavior if the calling process does not have the SE_AUDIT_NAME privilege enabled. If the AUDIT_ALLOW_NO_PRIVILEGE flag is set, the function performs the access check without generating audit messages when the privilege is not enabled. If this parameter is zero, the function fails if the privilege is not enabled.
ObjectTypeList : [var] A pointer to an array of OBJECT_TYPE_LIST structures that identify the hierarchy of object types for which to check access. Each element in the array specifies a GUID that identifies the object type and a value that indicates the level of the object type in the hierarchy of object types. The array should not have two elements with the same GUID. The array must have at least one element. The first element in the array must be at level zero and identify the object itself. The array can have only one level zero element. The second element is a subobject, such as a property set, at level 1. Following each level 1 entry are subordinate entries for the level 2 through 4 subobjects. Thus, the levels for the elements in the array might be {0, 1, 2, 2, 1, 2, 3}. If the object type list is out of order, AccessCheckByTypeResultListAndAuditAlarmByHandle fails, and GetLastError returns ERROR_INVALID_PARAMETER.
ObjectTypeListLength : [int] The number of elements in the ObjectTypeList array.
GenericMapping : [var] A pointer to the GENERIC_MAPPING structure associated with the object for which access is being checked.
ObjectCreation : [int] A flag that determines whether the calling application will create a new object when access is granted. A value of TRUE indicates the application will create a new object. A value of FALSE indicates the application will open an existing object.
GrantedAccessList : [var] 
AccessStatusList : [var] A pointer to an array of status codes for the corresponding elements in the object type list. The function sets an element to zero to indicate success or to a nonzero value to indicate the specific error during the access check. If the function fails, it does not set any of the elements in the array.
pfGenerateOnClose : [var] A pointer to a flag set by the audit-generation routine when the function returns. Pass this flag to the ObjectCloseAuditAlarm function when the object handle is closed.
%inst
The AccessCheckByTypeResultListAndAuditAlarmByHandleW (Unicode)
function (securitybaseapi.h) determines whether a security descriptor
grants access rights to the client that the calling thread is
impersonating.

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. To get extended error information,
call GetLastError.

[備考]
For more information, see the How AccessCheck Works overview. Like
AccessCheckByTypeResultListAndAuditAlarm, the
AccessCheckByTypeResultListAndAuditAlarmByHandle function is a
combination of the AccessCheckByTypeResultList and
AccessCheckAndAuditAlarm functions. However,
AccessCheckByTypeResultListAndAuditAlarmByHandle also requires a
client token handle to provide security information on the client.
The ObjectTypeList array does not necessarily represent the entire
defined object. Rather, it represents that subset of the object for
which to check access. For instance, to check access to two
properties in a property set, specify an object type list with four
elements: the object itself at level zero, the property set at level
1, and the two properties at level 2. The
AccessCheckByTypeResultListAndAuditAlarmByHandle function evaluates
ACEs that apply to the object itself and object-specific ACEs for the
object types listed in the ObjectTypeList array. The function ignores
object-specific ACEs for object types not listed in the
ObjectTypeList array. For more information about how a hierarchy of
ACEs controls access to an object and its subobjects, see ACEs to
Control Access to an Object's Properties. To generate audit messages
in the security event log, the calling process must have the
SE_AUDIT_NAME privilege enabled. The system checks for this privilege
in the primary token of the calling process, not the impersonation
token of the thread. If the Flags parameter includes the
AUDIT_ALLOW_NO_PRIVILEGE flag, the function performs the access check
without generating audit messages when the privilege is not enabled.
The AccessCheckByTypeResultListAndAuditAlarmByHandle function fails
if the calling thread is not impersonating a client. If the security
descriptor does not contain owner and group SIDs,
AccessCheckByTypeResultListAndAuditAlarmByHandle fails with
ERROR_INVALID_SECURITY_DESCR.


%index
AddAccessAllowedAce
Adds an access-allowed access control entry (ACE) to an access control list (ACL). The access is granted to a specified security identifier (SID).
%group
Win32 advapi32
%prm
pAcl, dwAceRevision, AccessMask, pSid
pAcl : [var] A pointer to an ACL. This function adds an access-allowed ACE to the end of this ACL. The ACE is in the form of an ACCESS_ALLOWED_ACE structure.
dwAceRevision : [int] Specifies the revision level of the ACL being modified.
AccessMask : [int] Specifies the mask of access rights to be granted to the specified SID.
pSid : [int] A pointer to the SID  representing a user, group, or logon account being granted access.
%inst
Adds an access-allowed access control entry (ACE) to an access
control list (ACL). The access is granted to a specified security
identifier (SID).

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The following are possible error
values.
This doc was truncated.

[備考]
The addition of an access-allowed ACE to an ACL is the most common
form of ACL modification. The AddAccessAllowedAce and
AddAccessDeniedAce functions add a new ACE to the end of the list of
ACEs for the ACL. These functions do not automatically place the new
ACE in the proper canonical order. It is the caller's responsibility
to ensure that the ACL is in canonical order by adding ACEs in the
proper sequence. The ACE_HEADER structure placed in the ACE by the
AddAccessAllowedAce function specifies a type and size, but provides
no inheritance and no ACE flags.


%index
AddAccessAllowedAceEx
Adds an access-allowed access control entry (ACE) to the end of a discretionary access control list (DACL). (AddAccessAllowedAceEx)
%group
Win32 advapi32
%prm
pAcl, dwAceRevision, AceFlags, AccessMask, pSid
pAcl : [var] A pointer to a DACL. The AddAccessAllowedAceEx function adds an access-allowed ACE to the end of this DACL. The ACE is in the form of an ACCESS_ALLOWED_ACE structure.
dwAceRevision : [int] Specifies the revision level of the DACL being modified. This value can be ACL_REVISION or ACL_REVISION_DS. Use ACL_REVISION_DS if the DACL contains object-specific ACEs.
AceFlags : [int] A set of bit flags that control ACE inheritance. The function sets these flags in the AceFlags member of the
AccessMask : [int] A set of bit flags that use the ACCESS_MASK format. These flags specify the access rights that the new ACE allows for the specified security identifier (SID).
pSid : [int] A pointer to a SID that identifies the user, group, or logon session to which the new ACE allows access.
%inst
Adds an access-allowed access control entry (ACE) to the end of a
discretionary access control list (DACL). (AddAccessAllowedAceEx)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The following are possible error
values.
This doc was truncated.

[備考]
The caller must ensure that ACEs are added to the DACL in the correct
order. For more information, see Order of ACEs in a DACL.


%index
AddAccessAllowedObjectAce
Adds an access-allowed access control entry (ACE) to the end of a discretionary access control list (DACL). (AddAccessAllowedObjectAce)
%group
Win32 advapi32
%prm
pAcl, dwAceRevision, AceFlags, AccessMask, ObjectTypeGuid, InheritedObjectTypeGuid, pSid
pAcl : [var] A pointer to a DACL. The AddAccessAllowedObjectAce function adds an access-allowed ACE to the end of this DACL. The ACE is in the form of an ACCESS_ALLOWED_OBJECT_ACE structure.
dwAceRevision : [int] Specifies the revision level of the DACL being modified. This value must be ACL_REVISION_DS. If the DACL's revision level is lower than ACL_REVISION_DS, the function changes it to ACL_REVISION_DS.
AceFlags : [int] A set of bit flags that control ACE inheritance. The function sets these flags in the AceFlags member of the
AccessMask : [int] A set of bit flags that use the ACCESS_MASK format. These flags specify the access rights that the new ACE allows for the specified security identifier (SID).
ObjectTypeGuid : [var] A pointer to a GUID structure that identifies the type of object, property set, or property protected by the new ACE. If this parameter is NULL, the new ACE protects the object to which the DACL is assigned.
InheritedObjectTypeGuid : [var] A pointer to a GUID structure that identifies the type of object that can inherit the new ACE. If this parameter is non-NULL, only the specified object type can inherit the ACE. If NULL, any type of child object can inherit the ACE. In either case, inheritance is also controlled by the value of the AceFlags parameter, as well as by any protection against inheritance placed on the child objects.
pSid : [int] A pointer to a SID that identifies the user, group, or logon session to which the new ACE allows access.
%inst
Adds an access-allowed access control entry (ACE) to the end of a
discretionary access control list (DACL). (AddAccessAllowedObjectAce)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The following are possible error
values.
This doc was truncated.

[備考]
If both ObjectTypeGuid and InheritedObjectTypeGuid are NULL, use the
AddAccessAllowedAceEx function rather than AddAccessAllowedObjectAce.
This is suggested because an ACCESS_ALLOWED_ACE is smaller and more
efficient than an ACCESS_ALLOWED_OBJECT_ACE. The caller must ensure
that ACEs are added to the DACL in the correct order. For more
information, see Order of ACEs in a DACL.


%index
AddAccessDeniedAce
Adds an access-denied access control entry (ACE) to an access control list (ACL). The access is denied to a specified security identifier (SID).
%group
Win32 advapi32
%prm
pAcl, dwAceRevision, AccessMask, pSid
pAcl : [var] A pointer to an ACL . This function adds an access-denied ACE to the end of this ACL. The ACE is in the form of an ACCESS_DENIED_ACE structure.
dwAceRevision : [int] Specifies the revision level of the ACL being modified.
AccessMask : [int] Specifies the mask of access rights being denied to the specified SID.
pSid : [int] A pointer to the SID structure representing the user, group, or logon account being denied access.
%inst
Adds an access-denied access control entry (ACE) to an access control
list (ACL). The access is denied to a specified security identifier
(SID).

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The following are possible error
values.
This doc was truncated.

[備考]
The AddAccessAllowedAce and AddAccessDeniedAce functions add a new
ACE to the end of the list of ACEs for the ACL. These functions do
not automatically place the new ACE in the proper canonical order. It
is the caller's responsibility to ensure that the ACL is in canonical
order by adding ACEs in the proper sequence. The ACE_HEADER structure
placed in the ACE by the AddAccessDeniedAce function specifies a type
and size, but provides no ACE flags. The ACE added by
AddAccessDeniedAce is not inheritable.


%index
AddAccessDeniedAceEx
Adds an access-denied access control entry (ACE) to the end of a discretionary access control list (DACL).
%group
Win32 advapi32
%prm
pAcl, dwAceRevision, AceFlags, AccessMask, pSid
pAcl : [var] A pointer to a DACL. The AddAccessDeniedAceEx function adds an access-denied ACE to the end of this DACL. The ACE is in the form of an ACCESS_DENIED_ACE structure.
dwAceRevision : [int] Specifies the revision level of the DACL being modified. This value can be ACL_REVISION or ACL_REVISION_DS. Use ACL_REVISION_DS if the DACL contains object-specific ACEs.
AceFlags : [int] A set of bit flags that control ACE inheritance. The function sets these flags in the AceFlags member of the
AccessMask : [int] A set of bit flags that use the ACCESS_MASK format to specify the access rights that the new ACE denies to the specified security identifier (SID).
pSid : [int] A pointer to a SID  that identifies the user, group, or logon session to which the new ACE denies access.
%inst
Adds an access-denied access control entry (ACE) to the end of a
discretionary access control list (DACL).

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The following are possible error
values.
This doc was truncated.

[備考]
Although the AddAccessDeniedAceEx function adds the new ACE to the
end of the DACL, access-denied ACEs should appear at the beginning of
a DACL. The caller must ensure that ACEs are added to the DACL in the
correct order. For more information, see Order of ACEs in a DACL.


%index
AddAccessDeniedObjectAce
Adds an access-denied access control entry (ACE) to the end of a discretionary access control list (DACL). The new ACE can deny access to an object, or to a property set or property on an object.
%group
Win32 advapi32
%prm
pAcl, dwAceRevision, AceFlags, AccessMask, ObjectTypeGuid, InheritedObjectTypeGuid, pSid
pAcl : [var] A pointer to a DACL. The AddAccessDeniedObjectAce function adds an access-denied ACE to the end of this DACL. The ACE is in the form of an ACCESS_DENIED_OBJECT_ACE structure.
dwAceRevision : [int] Specifies the revision level of the DACL being modified. This value must be ACL_REVISION_DS. If the DACL's revision level is lower than ACL_REVISION_DS, the function changes it to ACL_REVISION_DS.
AceFlags : [int] A set of bit flags that control ACE inheritance. The function sets these flags in the AceFlags member of the
AccessMask : [int] A set of bit flags that use the ACCESS_MASK format to specify the access rights that the new ACE denies to the specified security identifier (SID).
ObjectTypeGuid : [var] A pointer to a GUID structure that identifies the type of object, property set, or property protected by the new ACE. If this parameter is NULL, the new ACE protects the object to which the ACL is assigned.
InheritedObjectTypeGuid : [var] A pointer to a GUID structure that identifies the type of object that can inherit the new ACE. If this parameter is non-NULL, only the specified object type can inherit the ACE. If NULL, any type of child object can inherit the ACE. In either case, inheritance is also controlled by the value of the AceFlags parameter, as well as by any protection against inheritance placed on the child objects.
pSid : [int] A pointer to a SID  that identifies the user, group, or logon session to which the new ACE allows access.
%inst
Adds an access-denied access control entry (ACE) to the end of a
discretionary access control list (DACL). The new ACE can deny access
to an object, or to a property set or property on an object.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The following are possible error
values.
This doc was truncated.

[備考]
If both ObjectTypeGuid and InheritedObjectTypeGuid are NULL, use the
AddAccessDeniedAceEx function rather than AddAccessDeniedObjectAce.
This is suggested because an ACCESS_DENIED_ACE is smaller and more
efficient than an ACCESS_DENIED_OBJECT_ACE. Although the
AddAccessDeniedObjectAce function adds the new ACE to the end of the
ACL, access-denied ACEs should appear at the beginning of an ACL. The
caller must ensure that ACEs are added to the DACL in the correct
order. For more information, see Order of ACEs in a DACL.


%index
AddAce
Adds one or more access control entries (ACEs) to a specified access control list (ACL).
%group
Win32 advapi32
%prm
pAcl, dwAceRevision, dwStartingAceIndex, pAceList, nAceListLength
pAcl : [var] A pointer to an ACL. This function adds an ACE to this ACL.
dwAceRevision : [int] Specifies the revision level of the ACL being modified.
dwStartingAceIndex : [int] Specifies the position in the ACL's list of ACEs at which to add new ACEs. A value of zero inserts the ACEs at the beginning of the list. A value of MAXDWORD appends the ACEs to the end of the list.
pAceList : [intptr] A pointer to a list of one or more ACEs to be added to the specified ACL. The ACEs in the list must be stored contiguously.
nAceListLength : [int] Specifies the size, in bytes, of the input buffer pointed to by the pAceList parameter.
%inst
Adds one or more access control entries (ACEs) to a specified access
control list (ACL).

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The following are possible error
values.
This doc was truncated.

[備考]
Applications frequently use the FindFirstFreeAce and GetAce functions
when using the AddAce function to manipulate an ACL. In addition, the
ACL_SIZE_INFORMATION structure retrieved by the GetAclInformation
function contains the size of the ACL and the number of ACEs it
contains.


%index
AddAuditAccessAce
Adds a system-audit access control entry (ACE) to a system access control list (ACL). The access of a specified security identifier (SID) is audited.
%group
Win32 advapi32
%prm
pAcl, dwAceRevision, dwAccessMask, pSid, bAuditSuccess, bAuditFailure
pAcl : [var] A pointer to an ACL. This function adds a system-audit ACE to this ACL. The ACE is in the form of a SYSTEM_AUDIT_ACE structure.
dwAceRevision : [int] Specifies the revision level of the ACL being modified.
dwAccessMask : [int] Specifies the mask of access rights to be audited for the specified SID.
pSid : [int] A pointer to the SID representing the process whose access is being audited.
bAuditSuccess : [int] Specifies whether successful access attempts are to be audited. Set this flag to TRUE to enable auditing; otherwise, set it to FALSE.
bAuditFailure : [int] Specifies whether unsuccessful access attempts are to be audited. Set this flag to TRUE to enable auditing; otherwise, set it to FALSE.
%inst
Adds a system-audit access control entry (ACE) to a system access
control list (ACL). The access of a specified security identifier
(SID) is audited.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The following are possible error
values.
This doc was truncated.

[備考]
The ACE_HEADER structure placed in the ACE by the AddAuditAccessAce
function specifies a type and size, but provides no ACE flags.


%index
AddAuditAccessAceEx
Adds a system-audit access control entry (ACE) to the end of a system access control list (SACL). (AddAuditAccessAceEx)
%group
Win32 advapi32
%prm
pAcl, dwAceRevision, AceFlags, dwAccessMask, pSid, bAuditSuccess, bAuditFailure
pAcl : [var] A pointer to a SACL. The AddAuditAccessAceEx function adds a system-audit ACE to this SACL. The ACE is in the form of a SYSTEM_AUDIT_ACE structure.
dwAceRevision : [int] Specifies the revision level of the SACL being modified. This value can be ACL_REVISION or ACL_REVISION_DS. Use ACL_REVISION_DS if the SACL contains object-specific ACEs.
AceFlags : [int] 
dwAccessMask : [int] A set of bit flags that use the ACCESS_MASK format to specify the access rights that the new ACE audits for the specified security identifier (SID).
pSid : [int] A pointer to a SID that identifies the user, group, or logon session for which the new ACE audits access.
bAuditSuccess : [int] Specifies whether successful uses of the specified access rights cause the system to generate an audit record in the security event log. If this flag is TRUE or if the AceFlags parameter specifies the SUCCESSFUL_ACCESS_ACE_FLAG flag, the system records successful access attempts; otherwise, it does not.
bAuditFailure : [int] Specifies whether failed attempts to use the specified access rights cause the system to generate an audit record in the security event log. If this flag is TRUE or if the AceFlags parameter specifies the FAILED_ACCESS_ACE_FLAG flag, the system records failed access attempts; otherwise, it does not.
%inst
Adds a system-audit access control entry (ACE) to the end of a system
access control list (SACL). (AddAuditAccessAceEx)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The following are possible error
values.
This doc was truncated.


%index
AddAuditAccessObjectAce
Adds a system-audit access control entry (ACE) to the end of a system access control list (SACL). (AddAuditAccessObjectAce)
%group
Win32 advapi32
%prm
pAcl, dwAceRevision, AceFlags, AccessMask, ObjectTypeGuid, InheritedObjectTypeGuid, pSid, bAuditSuccess, bAuditFailure
pAcl : [var] A pointer to a SACL. The AddAuditAccessObjectAce function adds a system-audit ACE to the end of this SACL. The ACE is in the form of a SYSTEM_AUDIT_OBJECT_ACE structure.
dwAceRevision : [int] Specifies the revision level of the SACL being modified. This value must be ACL_REVISION_DS. If the SACL's revision level is lower than ACL_REVISION_DS, the function changes it to ACL_REVISION_DS.
AceFlags : [int] A set of bit flags that control ACE inheritance and the type of access attempts to audit. The function sets these flags in the AceFlags member of the
AccessMask : [int] An ACCESS_MASK that specifies the access rights that the new ACE audits for the specified security identifier (SID).
ObjectTypeGuid : [var] A pointer to a GUID structure that identifies the type of object, property set, or property protected by the new ACE. If this parameter is NULL, the new ACE protects the object to which the ACL is assigned.
InheritedObjectTypeGuid : [var] A pointer to a GUID structure that identifies the type of object that can inherit the new ACE. If this parameter is non-NULL, only the specified object type can inherit the ACE. If NULL, any type of child object can inherit the ACE. In either case, inheritance is also controlled by the value of the AceFlags parameter, as well as by any protection against inheritance placed on the child objects.
pSid : [int] A pointer to a SID that identifies the user, group, or logon session for which the new ACE audits access.
bAuditSuccess : [int] Specifies whether successful uses of the specified access rights cause the system to generate an audit record in the security event log. If this flag is TRUE or if the AceFlags parameter specifies the SUCCESSFUL_ACCESS_ACE_FLAG flag, the system records successful access attempts; otherwise, it does not.
bAuditFailure : [int] Specifies whether failed attempts to use the specified access rights cause the system to generate an audit record in the security event log. If this flag is TRUE or if the AceFlags parameter specifies the FAILED_ACCESS_ACE_FLAG flag, the system records failed access attempts; otherwise, it does not.
%inst
Adds a system-audit access control entry (ACE) to the end of a system
access control list (SACL). (AddAuditAccessObjectAce)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The following are possible error
values.
This doc was truncated.

[備考]
If both ObjectTypeGuid and InheritedObjectTypeGuid are NULL, use the
AddAuditAccessAceEx function rather than AddAuditAccessObjectAce.
This is suggested because a SYSTEM_AUDIT_ACE is smaller and more
efficient than a SYSTEM_AUDIT_OBJECT_ACE.


%index
AddConditionalAce
Adds a conditional access control entry (ACE) to the specified access control list (ACL).
%group
Win32 advapi32
%prm
pAcl, dwAceRevision, AceFlags, AceType, AccessMask, pSid, ConditionStr, ReturnLength
pAcl : [var] A pointer to an ACL. This function adds an ACE to this ACL. The value of this parameter cannot be NULL.
dwAceRevision : [int] Specifies the revision level of the ACL being modified. This value can be ACL_REVISION or ACL_REVISION_DS. Use ACL_REVISION_DS if the ACL contains object-specific ACEs.
AceFlags : [int] A set of bit flags that control ACE inheritance. The function sets these flags in the AceFlags member of the
AceType : [int] The type of the ACE.
AccessMask : [int] Specifies the mask of access rights to be granted to the specified SID.
pSid : [int] A pointer to the SID  that represents a user, group, or logon account being granted access.
ConditionStr : [wstr] A string that specifies the conditional statement to be evaluated for the ACE.
ReturnLength : [var] The size, in bytes, of the ACL. If the buffer specified by the pACL parameter is not of sufficient size, the value of this parameter is the required size.
%inst
Adds a conditional access control entry (ACE) to the specified access
control list (ACL).

[戻り値]
If the function succeeds, it returns TRUE. If the function fails, it
returns FALSE. For extended error information, call GetLastError. The
following are possible error values.
This doc was truncated.


%index
AddUsersToEncryptedFile
Adds user keys to the specified encrypted file.
%group
Win32 advapi32
%prm
lpFileName, pEncryptionCertificates
lpFileName : [wstr] The name of the encrypted file.
pEncryptionCertificates : [var] A pointer to an ENCRYPTION_CERTIFICATE_LIST structure that contains the list of new user keys to be added to the file.
%inst
Adds user keys to the specified encrypted file.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a system error code. For a
complete list of error codes, see System Error Codes or the header
file WinError.h.

[備考]
Starting with Windows 8 and Windows Server 2012, this function is
supported by the following technologies.
This doc was truncated.


%index
AdjustTokenGroups
Enables or disables groups already present in the specified access token. Access to TOKEN_ADJUST_GROUPS is required to enable or disable groups in an access token.
%group
Win32 advapi32
%prm
TokenHandle, ResetToDefault, NewState, BufferLength, PreviousState, ReturnLength
TokenHandle : [intptr] A handle to the access token that contains the groups to be enabled or disabled. The handle must have TOKEN_ADJUST_GROUPS access to the token. If the PreviousState parameter is not NULL, the handle must also have TOKEN_QUERY access.
ResetToDefault : [int] Boolean value that indicates whether the groups are to be set to their default enabled and disabled states. If this value is TRUE, the groups are set to their default states and the NewState parameter is ignored. If this value is FALSE, the groups are set according to the information pointed to by the NewState parameter.
NewState : [var] A pointer to a TOKEN_GROUPS structure that contains the groups to be enabled or disabled. If the ResetToDefault parameter is FALSE, the function sets each of the groups to the value of that group's SE_GROUP_ENABLED attribute in the TOKEN_GROUPS structure. If ResetToDefault is TRUE, this parameter is ignored.
BufferLength : [int] The size, in bytes, of the buffer pointed to by the PreviousState parameter. This parameter can be zero if the PreviousState parameter is NULL.
PreviousState : [var] A pointer to a buffer that receives a TOKEN_GROUPS structure containing the previous state of any groups the function modifies. That is, if a group has been modified by this function, the group and its previous state are contained in the TOKEN_GROUPS structure referenced by PreviousState. If the GroupCount member of TOKEN_GROUPS is zero, then no groups have been changed by this function. This parameter can be NULL.
ReturnLength : [var] A pointer to a variable that receives the actual number of bytes needed for the buffer pointed to by the PreviousState parameter. This parameter can be NULL and is ignored if PreviousState is NULL.
%inst
Enables or disables groups already present in the specified access
token. Access to TOKEN_ADJUST_GROUPS is required to enable or disable
groups in an access token.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The information retrieved in the PreviousState parameter is formatted
as a TOKEN_GROUPS structure. This means a pointer to the buffer can
be passed as the NewState parameter in a subsequent call to the
AdjustTokenGroups function, restoring the original state of the
groups. The NewState parameter can list groups to be changed that are
not present in the access token. This does not affect the successful
modification of the groups in the token. The AdjustTokenGroups
function cannot disable groups with the SE_GROUP_MANDATORY attribute
in the TOKEN_GROUPS structure. Use CreateRestrictedToken instead. You
cannot enable a group that has the SE_GROUP_USE_FOR_DENY_ONLY
attribute.


%index
AdjustTokenPrivileges
Enables or disables privileges in the specified access token. Enabling or disabling privileges in an access token requires TOKEN_ADJUST_PRIVILEGES access.
%group
Win32 advapi32
%prm
TokenHandle, DisableAllPrivileges, NewState, BufferLength, PreviousState, ReturnLength
TokenHandle : [intptr] A handle to the access token that contains the privileges to be modified. The handle must have TOKEN_ADJUST_PRIVILEGES access to the token. If the PreviousState parameter is not NULL, the handle must also have TOKEN_QUERY access.
DisableAllPrivileges : [int] Specifies whether the function disables all of the token's privileges. If this value is TRUE, the function disables all privileges and ignores the NewState parameter. If it is FALSE, the function modifies privileges based on the information pointed to by the NewState parameter.
NewState : [var] A pointer to a TOKEN_PRIVILEGES structure that specifies an array of privileges and their attributes. If the DisableAllPrivileges parameter is FALSE, the  AdjustTokenPrivileges  function enables, disables, or removes these privileges for the token. The following table describes the action taken by the AdjustTokenPrivileges function, based on the privilege attribute.
BufferLength : [int] Specifies the size, in bytes, of the buffer pointed to by the PreviousState parameter. This parameter can be zero if the PreviousState parameter is NULL.
PreviousState : [var] A pointer to a buffer that the function fills with a TOKEN_PRIVILEGES structure that contains the previous state of any privileges that the function modifies.  That is, if a privilege has been modified by this function, the privilege and its previous state are contained in the TOKEN_PRIVILEGES structure referenced by PreviousState. If the PrivilegeCount member of TOKEN_PRIVILEGES is zero, then no privileges have been changed by this function. This parameter can be NULL.
ReturnLength : [var] A pointer to a variable that receives the required size, in bytes, of the buffer pointed to by the PreviousState parameter. This parameter can be NULL if PreviousState is NULL.
%inst
Enables or disables privileges in the specified access token.
Enabling or disabling privileges in an access token requires
TOKEN_ADJUST_PRIVILEGES access.

[戻り値]
If the function succeeds, the return value is nonzero. To determine
whether the function adjusted all of the specified privileges, call
GetLastError, which returns one of the following values when the
function succeeds:
This doc was truncated.

[備考]
The AdjustTokenPrivileges function cannot add new privileges to the
access token. It can only enable or disable the token's existing
privileges. To determine the token's privileges, call the
GetTokenInformation function. The NewState parameter can specify
privileges that the token does not have, without causing the function
to fail. In this case, the function adjusts the privileges that the
token does have and ignores the other privileges so that the function
succeeds. Call the GetLastError function to determine whether the
function adjusted all of the specified privileges. The PreviousState
parameter indicates the privileges that were adjusted. The
PreviousState parameter retrieves a TOKEN_PRIVILEGES structure that
contains the original state of the adjusted privileges. To restore
the original state, pass the PreviousState pointer as the NewState
parameter in a subsequent call to the AdjustTokenPrivileges function.


%index
AllocateAndInitializeSid
Allocates and initializes a security identifier (SID) with up to eight subauthorities.
%group
Win32 advapi32
%prm
pIdentifierAuthority, nSubAuthorityCount, nSubAuthority0, nSubAuthority1, nSubAuthority2, nSubAuthority3, nSubAuthority4, nSubAuthority5, nSubAuthority6, nSubAuthority7, pSid
pIdentifierAuthority : [var] A pointer to a SID_IDENTIFIER_AUTHORITY structure. This structure provides the top-level identifier authority value to set in the SID.
nSubAuthorityCount : [int] Specifies the number of subauthorities to place in the SID. This parameter also identifies how many of the subauthority parameters have meaningful values. This parameter must contain a value from 1 to 8.
nSubAuthority0 : [int] Subauthority value to place in the SID.
nSubAuthority1 : [int] Subauthority value to place in the SID.
nSubAuthority2 : [int] Subauthority value to place in the SID.
nSubAuthority3 : [int] Subauthority value to place in the SID.
nSubAuthority4 : [int] Subauthority value to place in the SID.
nSubAuthority5 : [int] Subauthority value to place in the SID.
nSubAuthority6 : [int] Subauthority value to place in the SID.
nSubAuthority7 : [int] Subauthority value to place in the SID.
pSid : [var] A pointer to a variable that receives the pointer to the allocated and initialized SID structure.
%inst
Allocates and initializes a security identifier (SID) with up to
eight subauthorities.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
A SID allocated with the AllocateAndInitializeSid function must be
freed by using the FreeSid function. This function creates a SID with
a 32-bit RID value. For applications that require longer RID values,
use CreateWellKnownSid.


%index
AllocateLocallyUniqueId
Allocates a locally unique identifier (LUID).
%group
Win32 advapi32
%prm
Luid
Luid : [var] A pointer to a LUID structure that receives the allocated LUID.
%inst
Allocates a locally unique identifier (LUID).

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The allocated LUID is unique to the local system only, and uniqueness
is guaranteed only until the system is next restarted. The allocated
LUID is guaranteed to be nonzero if this function succeeds.


%index
AreAllAccessesGranted
Checks whether a set of requested access rights has been granted. The access rights are represented as bit flags in an access mask.
%group
Win32 advapi32
%prm
GrantedAccess, DesiredAccess
GrantedAccess : [int] An access mask that specifies the access rights that have been granted.
DesiredAccess : [int] An access mask that specifies the access rights that have been requested. This mask must have been mapped from generic to specific and standard access rights, usually by calling the MapGenericMask function.
%inst
Checks whether a set of requested access rights has been granted. The
access rights are represented as bit flags in an access mask.

[戻り値]
If all requested access rights have been granted, the return value is
nonzero. If not all requested access rights have been granted, the
return value is zero.

[備考]
The AreAllAccessesGranted function is commonly used by a server
application to check the access rights of a client attempting to gain
access to an object. When the bits set in the DesiredAccess parameter
match the bits set in the GrantedAccess parameter, all requested
rights have been granted.


%index
AreAnyAccessesGranted
Tests whether any of a set of requested access rights has been granted. The access rights are represented as bit flags in an access mask.
%group
Win32 advapi32
%prm
GrantedAccess, DesiredAccess
GrantedAccess : [int] Specifies the granted access mask.
DesiredAccess : [int] Specifies the access mask to be requested. This mask must have been mapped from generic to specific and standard access rights, usually by calling the MapGenericMask function.
%inst
Tests whether any of a set of requested access rights has been
granted. The access rights are represented as bit flags in an access
mask.

[戻り値]
If any of the requested access rights have been granted, the return
value is nonzero. If none of the requested access rights have been
granted, the return value is zero.

[備考]
The AreAnyAccessesGranted function is often used by a server
application to check the access rights of a client attempting to gain
access to an object. When any of the bits set in the DesiredAccess
parameter match the bits set in the GrantedAccess parameter, at least
one of the requested access rights has been granted.


%index
AuditComputeEffectivePolicyBySid
Computes the effective audit policy for one or more subcategories for the specified security principal. The function computes effective audit policy by combining system audit policy with per-user policy.
%group
Win32 advapi32
%prm
pSid, pSubCategoryGuids, dwPolicyCount, ppAuditPolicy
pSid : [int] A pointer to the SID structure associated with the principal for which to compute effective audit policy. Per-user policy for group SIDs is not currently supported.
pSubCategoryGuids : [var] A pointer to an array of GUID values that specify the subcategories for which to compute effective audit policy. For a list of defined subcategories, see Auditing Constants.
dwPolicyCount : [int] The number of elements in each of the pSubCategoryGuids and ppAuditPolicy arrays.
ppAuditPolicy : [var] A pointer to a single buffer that contains both an array of pointers to AUDIT_POLICY_INFORMATION structures and the structures themselves. The AUDIT_POLICY_INFORMATION structures specify the effective audit policy for the subcategories specified by the pSubCategoryGuids array. When you have finished using this buffer, free it by calling the AuditFree function.
%inst
Computes the effective audit policy for one or more subcategories for
the specified security principal. The function computes effective
audit policy by combining system audit policy with per-user policy.

[戻り値]
If the function succeeds, it returns TRUE. If the function fails, it
returns FALSE. To get extended error information, call GetLastError.
GetLastError may return one of the following error codes defined in
WinError.h.
This doc was truncated.

[備考]
To successfully call this function, the caller must have
SeSecurityPrivilege or have AUDIT_QUERY_SYSTEM_POLICY and
AUDIT_QUERY_USER_POLICY access on the Audit security object.


%index
AuditComputeEffectivePolicyByToken
Computes the effective audit policy for one or more subcategories for the security principal associated with the specified token. The function computes effective audit policy by combining system audit policy with per-user policy.
%group
Win32 advapi32
%prm
hTokenHandle, pSubCategoryGuids, dwPolicyCount, ppAuditPolicy
hTokenHandle : [intptr] A handle to the access token associated with the principal for which to compute effective audit policy. The token must have been opened with TOKEN_QUERY access. Per-user policy for group SIDs is not currently supported.
pSubCategoryGuids : [var] A pointer to an array of GUID values that specify the subcategories for which to compute effective audit policy. For a list of defined subcategories, see Auditing Constants.
dwPolicyCount : [int] The number of elements in each of the pSubCategoryGuids and ppAuditPolicy arrays.
ppAuditPolicy : [var] A pointer to a single buffer that contains both an array of pointers to AUDIT_POLICY_INFORMATION structures and the structures themselves. The AUDIT_POLICY_INFORMATION structures specify the effective audit policy for the subcategories specified by the pSubCategoryGuids array. When you have finished using this buffer, free it by calling the AuditFree function.
%inst
Computes the effective audit policy for one or more subcategories for
the security principal associated with the specified token. The
function computes effective audit policy by combining system audit
policy with per-user policy.

[戻り値]
If the function succeeds, it returns TRUE. If the function fails, it
returns FALSE. To get extended error information, call GetLastError.
GetLastError may return one of the following error codes defined in
WinError.h.
This doc was truncated.

[備考]
To successfully call this function, the caller must have
SeSecurityPrivilege or have both AUDIT_QUERY_SYSTEM_POLICY and
AUDIT_QUERY_USER_POLICY access on the Audit security object.


%index
AuditEnumerateCategories
Enumerates the available audit-policy categories.
%group
Win32 advapi32
%prm
ppAuditCategoriesArray, pdwCountReturned
ppAuditCategoriesArray : [var] A pointer to a single buffer that contains both an array of pointers to GUID structures and the structures themselves. The GUID structures specify the audit-policy categories available on the computer. When you have finished using this buffer, free it by calling the AuditFree function.
pdwCountReturned : [var] A pointer to the number of elements in the ppAuditCategoriesArray array.
%inst
Enumerates the available audit-policy categories.

[戻り値]
If the function succeeds, it returns TRUE. If the function fails, it
returns FALSE. To get extended error information, call GetLastError.


%index
AuditEnumeratePerUserPolicy
Enumerates users for whom per-user auditing policy is specified.
%group
Win32 advapi32
%prm
ppAuditSidArray
ppAuditSidArray : [var] A pointer to a single buffer that contains both an array of pointers to POLICY_AUDIT_SID_ARRAY structures and the structures themselves. The POLICY_AUDIT_SID_ARRAY structures specify the users for whom per-user audit policy is specified. When you have finished using this buffer, free it by calling the AuditFree function.
%inst
Enumerates users for whom per-user auditing policy is specified.

[戻り値]
If the function succeeds, it returns TRUE. If the function fails, it
returns FALSE. To get extended error information, call GetLastError.
GetLastError may return one of the following error codes defined in
WinError.h.
This doc was truncated.

[備考]
To successfully call this function, the caller must have
SeSecurityPrivilege or have AUDIT_ENUMERATE_USERS access on the Audit
security object.


%index
AuditEnumerateSubCategories
Enumerates the available audit-policy subcategories.
%group
Win32 advapi32
%prm
pAuditCategoryGuid, bRetrieveAllSubCategories, ppAuditSubCategoriesArray, pdwCountReturned
pAuditCategoryGuid : [var] The GUID of an audit-policy category for which subcategories are enumerated. If the value of the bRetrieveAllSubCategories parameter is TRUE, this parameter is ignored.
bRetrieveAllSubCategories : [int] TRUE to enumerate all audit-policy subcategories; FALSE to enumerate only the subcategories of the audit-policy category specified by the pAuditCategoryGuid parameter.
ppAuditSubCategoriesArray : [var] A pointer to a single buffer that contains both an array of pointers to GUID structures and the structures themselves. The GUID structures specify the audit-policy subcategories available on the computer. When you have finished using this buffer, free it by calling the AuditFree function.
pdwCountReturned : [var] A pointer to the number of audit-policy subcategories returned in the ppAuditSubCategoriesArray array.
%inst
Enumerates the available audit-policy subcategories.

[戻り値]
If the function succeeds, it returns TRUE. If the function fails, it
returns FALSE. To get extended error information, call GetLastError.


%index
AuditFree
Frees the memory allocated by audit functions for the specified buffer.
%group
Win32 advapi32
%prm
Buffer
Buffer : [intptr] A pointer to the buffer to free.
%inst
Frees the memory allocated by audit functions for the specified
buffer.


%index
AuditLookupCategoryGuidFromCategoryId
Retrieves a GUID structure that represents the specified audit-policy category.
%group
Win32 advapi32
%prm
AuditCategoryId, pAuditCategoryGuid
AuditCategoryId : [int] An element of the POLICY_AUDIT_EVENT_TYPE enumeration that specifies an audit-policy category.
pAuditCategoryGuid : [var] A pointer to a GUID structure that represents the audit-policy category specified by the  AuditCategoryId
%inst
Retrieves a GUID structure that represents the specified audit-policy
category.

[戻り値]
If the function succeeds, it returns TRUE. If the function fails, it
returns FALSE. To get extended error information, call GetLastError.


%index
AuditLookupCategoryIdFromCategoryGuid
Retrieves an element of the POLICY_AUDIT_EVENT_TYPE enumeration that represents the specified audit-policy category.
%group
Win32 advapi32
%prm
pAuditCategoryGuid, pAuditCategoryId
pAuditCategoryGuid : [var] A pointer to a GUID structure that specifies an audit-policy category.
pAuditCategoryId : [var] A pointer to an element of the POLICY_AUDIT_EVENT_TYPE enumeration that represents the audit-policy category specified by the pAuditCategoryGuid parameter.
%inst
Retrieves an element of the POLICY_AUDIT_EVENT_TYPE enumeration that
represents the specified audit-policy category.

[戻り値]
If the function succeeds, it returns TRUE. If the function fails, it
returns FALSE. To get extended error information, call GetLastError.


%index
AuditLookupCategoryNameW
Retrieves the display name of the specified audit-policy category. (Unicode)
%group
Win32 advapi32
%prm
pAuditCategoryGuid, ppszCategoryName
pAuditCategoryGuid : [var] A pointer to a GUID structure that specifies an audit-policy category.
ppszCategoryName : [var] The address of a pointer to a null-terminated string that contains the display name of the audit-policy category specified by the pAuditCategoryGuid function. When you have finished using this string, free it by calling the AuditFree function.
%inst
Retrieves the display name of the specified audit-policy category.
(Unicode)

[戻り値]
If the function succeeds, it returns TRUE. If the function fails, it
returns FALSE. To get extended error information, call GetLastError.

[備考]
> [!NOTE] > The ntsecapi.h header defines AuditLookupCategoryName as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
AuditLookupSubCategoryNameW
Retrieves the display name of the specified audit-policy subcategory. (Unicode)
%group
Win32 advapi32
%prm
pAuditSubCategoryGuid, ppszSubCategoryName
pAuditSubCategoryGuid : [var] A pointer to a GUID structure that specifies an audit-policy subcategory.
ppszSubCategoryName : [var] The address of a pointer to a null-terminated string that contains the display name of the audit-policy subcategory specified by the pAuditSubCategoryGuid parameter. When you have finished using this string, free it by calling the AuditFree function.
%inst
Retrieves the display name of the specified audit-policy subcategory.
(Unicode)

[戻り値]
If the function succeeds, it returns TRUE. If the function fails, it
returns FALSE. To get extended error information, call GetLastError.

[備考]
> [!NOTE] > The ntsecapi.h header defines AuditLookupSubCategoryName
as an alias which automatically selects the ANSI or Unicode version
of this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
AuditQueryGlobalSaclW
Retrieves a global system access control list (SACL) that delegates access to the audit messages. (Unicode)
%group
Win32 advapi32
%prm
ObjectTypeName, Acl
ObjectTypeName : [wstr] A pointer to a null-terminated string specifying the type of object being accessed. This parameter must be either "File" or "Key", depending on whether the object is a file or registry. This string appears in any audit message that the function generates.
Acl : [var] A pointer to an ACL structure that contains the SACL information.  This should be freed later by calling the LocalFree function.
%inst
Retrieves a global system access control list (SACL) that delegates
access to the audit messages. (Unicode)

[戻り値]
If the function succeeds, it returns TRUE. If the function fails, it
returns FALSE. To get extended error information, call GetLastError.
GetLastError may return one of the following error codes defined in
WinError.h.
This doc was truncated.

[備考]
To successfully call this function, the caller must have
SeSecurityPrivilege.
> [!NOTE] > The ntsecapi.h header defines AuditQueryGlobalSacl as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
AuditQueryPerUserPolicy
Retrieves per-user audit policy in one or more audit-policy subcategories for the specified principal.
%group
Win32 advapi32
%prm
pSid, pSubCategoryGuids, dwPolicyCount, ppAuditPolicy
pSid : [int] A pointer to the SID structure associated with the principal for which to query  audit policy. Per-user policy for group SIDs is not currently supported.
pSubCategoryGuids : [var] A pointer to an array of GUID values that specify the subcategories for which to query audit policy. For a list of defined audit-policy subcategories, see Auditing Constants.
dwPolicyCount : [int] The number of elements in each of the pSubCategoryGuids and ppAuditPolicy arrays.
ppAuditPolicy : [var] A pointer to a single buffer that contains both an array of pointers to AUDIT_POLICY_INFORMATION structures and the structures themselves. The AUDIT_POLICY_INFORMATION structures specify the per-user audit policy for the subcategories specified by the pSubCategoryGuids array. When you have finished using this buffer, free it by calling the AuditFree function.
%inst
Retrieves per-user audit policy in one or more audit-policy
subcategories for the specified principal.

[戻り値]
If the function succeeds, it returns TRUE. If the function fails, it
returns FALSE. To get extended error information, call GetLastError.
GetLastError may return one of the following error codes defined in
WinError.h.
This doc was truncated.

[備考]
To successfully call this function, the caller must have
SeSecurityPrivilege or have AUDIT_QUERY_USER_POLICY access on the
Audit security object.


%index
AuditQuerySecurity
Retrieves security descriptor that delegates access to audit policy.
%group
Win32 advapi32
%prm
SecurityInformation, ppSecurityDescriptor
SecurityInformation : [int] A SECURITY_INFORMATION value that specifies which parts of the security descriptor this function sets. Only SACL_SECURITY_INFORMATION and DACL_SECURITY_INFORMATION are supported. Any other values are ignored. If neither SACL_SECURITY_INFORMATION nor DACL_SECURITY_INFORMATION is specified, this function fails and returns ERROR_INVALID_PARAMETER.
ppSecurityDescriptor : [var] The address of a pointer to a well-formed SECURITY_DESCRIPTOR structure that controls access to the Audit security object.
%inst
Retrieves security descriptor that delegates access to audit policy.

[戻り値]
If the function succeeds, it returns TRUE. If the function fails, it
returns FALSE. To get extended error information, call GetLastError.
GetLastError may return one of the following error codes defined in
WinError.h.
This doc was truncated.

[備考]
To successfully call this function, the caller must have
SeSecurityPrivilege.


%index
AuditQuerySystemPolicy
Retrieves system audit policy for one or more audit-policy subcategories.
%group
Win32 advapi32
%prm
pSubCategoryGuids, dwPolicyCount, ppAuditPolicy
pSubCategoryGuids : [var] A pointer to an array of GUID values that specify the subcategories for which to query audit policy. For a list of defined audit-policy subcategories, see Auditing Constants.
dwPolicyCount : [int] The number of elements in each of the pSubCategoryGuids and ppAuditPolicy arrays.
ppAuditPolicy : [var] A pointer to a single buffer that contains both an array of pointers to AUDIT_POLICY_INFORMATION structures and the structures themselves. The AUDIT_POLICY_INFORMATION structures specify the system audit policy for the subcategories specified by the pSubCategoryGuids array. When you have finished using this buffer, free it by calling the AuditFree function.
%inst
Retrieves system audit policy for one or more audit-policy
subcategories.

[戻り値]
If the function succeeds, it returns TRUE. If the function fails, it
returns FALSE. To get extended error information, call GetLastError.
GetLastError may return one of the following error codes defined in
WinError.h.
This doc was truncated.

[備考]
To successfully call this function, the caller must have
SeSecurityPrivilege or have AUDIT_QUERY_SYSTEM_POLICY access on the
audit security object.


%index
AuditSetGlobalSaclW
Sets a global system access control list (SACL) that delegates access to the audit messages. (Unicode)
%group
Win32 advapi32
%prm
ObjectTypeName, Acl
ObjectTypeName : [wstr] A pointer to a null-terminated string specifying the type of object being created or accessed. For setting the global SACL on files, this should be set to "File" and  for setting the global SACL on registry, this should be set to "Key". This string appears in any audit message that the function generates.
Acl : [var] A pointer to an ACL structure.
%inst
Sets a global system access control list (SACL) that delegates access
to the audit messages. (Unicode)

[戻り値]
If the function succeeds, it returns TRUE. If the function fails, it
returns FALSE. To get extended error information, call GetLastError.
GetLastError may return one of the following error codes defined in
WinError.h.
This doc was truncated.

[備考]
To successfully call this function, the caller must have
SeSecurityPrivilege.
> [!NOTE] > The ntsecapi.h header defines AuditSetGlobalSacl as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
AuditSetPerUserPolicy
Sets per-user audit policy in one or more audit subcategories for the specified principal.
%group
Win32 advapi32
%prm
pSid, pAuditPolicy, dwPolicyCount
pSid : [int] A pointer to the SID structure associated with the principal for which to set  audit policy. Per-user policy for group SIDs is not currently supported.
pAuditPolicy : [var] A pointer to an array of AUDIT_POLICY_INFORMATION structures. Each structure specifies per-user audit policy for one audit subcategory. The AuditCategoryGuid member of these structures is ignored.
dwPolicyCount : [int] The number of elements in the pAuditPolicy array.
%inst
Sets per-user audit policy in one or more audit subcategories for the
specified principal.

[戻り値]
If the function succeeds, it returns TRUE. If the function fails, it
returns FALSE. To get extended error information, call GetLastError.
GetLastError may return one of the following error codes defined in
WinError.h.
This doc was truncated.

[備考]
To successfully call this function, the caller must have
SeSecurityPrivilege or have AUDIT_SET_USER_POLICY access on the Audit
security object.


%index
AuditSetSecurity
Sets a security descriptor that delegates access to audit policy.
%group
Win32 advapi32
%prm
SecurityInformation, pSecurityDescriptor
SecurityInformation : [int] A SECURITY_INFORMATION value that specifies which parts of the security descriptor this function sets. Only SACL_SECURITY_INFORMATION and DACL_SECURITY_INFORMATION are supported. Any other values are ignored. If neither SACL_SECURITY_INFORMATION nor DACL_SECURITY_INFORMATION is specified, this function fails and returns ERROR_INVALID_PARAMETER.
pSecurityDescriptor : [int] A pointer to a well-formed SECURITY_DESCRIPTOR structure that controls access to the Audit security object. If this parameter is NULL, the function fails and returns ERROR_INVALID_PARAMETER.
%inst
Sets a security descriptor that delegates access to audit policy.

[戻り値]
If the function succeeds, it returns TRUE. If the function fails, it
returns FALSE. To get extended error information, call GetLastError.
GetLastError may return one of the following error codes defined in
WinError.h.
This doc was truncated.

[備考]
To successfully call this function, the caller must have
SeSecurityPrivilege.


%index
AuditSetSystemPolicy
Sets system audit policy for one or more audit-policy subcategories.
%group
Win32 advapi32
%prm
pAuditPolicy, dwPolicyCount
pAuditPolicy : [var] A pointer to an array of AUDIT_POLICY_INFORMATION structures. Each structure specifies system audit policy for one audit-policy subcategory. The AuditCategoryGuid member of these structures is ignored.
dwPolicyCount : [int] The number of elements in the pAuditPolicy array.
%inst
Sets system audit policy for one or more audit-policy subcategories.

[戻り値]
If the function succeeds, it returns TRUE. If the function fails, it
returns FALSE. To get extended error information, call GetLastError.
GetLastError may return one of the following error codes defined in
WinError.h.
This doc was truncated.

[備考]
To successfully call this function, the caller must have
SeSecurityPrivilege or have AUDIT_SET_SYSTEM_POLICY access on the
Audit security object.


%index
BackupEventLogW
Saves the specified event log to a backup file. (Unicode)
%group
Win32 advapi32
%prm
hEventLog, lpBackupFileName
hEventLog : [intptr] A handle to the open event log. The OpenEventLog function returns this handle.
lpBackupFileName : [wstr] The absolute or relative path of the backup file.
%inst
Saves the specified event log to a backup file. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. To get extended
error information, call GetLastError.

[備考]
The BackupEventLog function fails with the ERROR_PRIVILEGE_NOT_HELD
error if the user does not have the SE_BACKUP_NAME privilege.
> [!NOTE] > The winbase.h header defines BackupEventLog as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
BuildExplicitAccessWithNameW
Initializes an EXPLICIT_ACCESS structure with data specified by the caller. The trustee is identified by a name string. (Unicode)
%group
Win32 advapi32
%prm
pExplicitAccess, pTrusteeName, AccessPermissions, AccessMode, Inheritance
pExplicitAccess : [var] A pointer to an EXPLICIT_ACCESS structure to initialize. The BuildExplicitAccessWithName function does not allocate any memory. This parameter cannot be NULL.
pTrusteeName : [wstr] A pointer to a null-terminated string that contains the name of the trustee for the ptstrName member of the TRUSTEE structure. The BuildExplicitAccessWithName function sets the other members of the TRUSTEE structure as follows.
AccessPermissions : [int] Specifies an access mask for the grfAccessPermissions member of the EXPLICIT_ACCESS structure. The mask is a set of bit flags that use the ACCESS_MASK format to specify the access rights that an ACE allows, denies, or audits for the trustee. The functions that use the EXPLICIT_ACCESS structure do not convert, interpret, or validate the bits in this mask.
AccessMode : [int] Specifies an access mode for the grfAccessMode member of the EXPLICIT_ACCESS structure. The access mode indicates whether the access control entry (ACE) allows, denies, or audits the specified rights. For a discretionary access control list (DACL), this parameter can be one of the values from the ACCESS_MODE enumeration. For a system access control list (SACL), this parameter can be a combination of ACCESS_MODE values.
Inheritance : [int] Specifies an inheritance type for the grfInheritance member of the EXPLICIT_ACCESS structure. This value is a set of bit flags that determine whether other containers or objects can inherit the ACE from the primary object to which the ACL is attached. The value of this member corresponds to the inheritance portion (low-order byte) of the AceFlags member of the
%inst
Initializes an EXPLICIT_ACCESS structure with data specified by the
caller. The trustee is identified by a name string. (Unicode)

[備考]
> [!NOTE] > The aclapi.h header defines BuildExplicitAccessWithName
as an alias which automatically selects the ANSI or Unicode version
of this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
BuildImpersonateExplicitAccessWithNameW
(no summary)
%group
Win32 advapi32
%prm
pExplicitAccess, pTrusteeName, pTrustee, AccessPermissions, AccessMode, Inheritance
pExplicitAccess : [var] 
pTrusteeName : [wstr] 
pTrustee : [var] 
AccessPermissions : [int] 
AccessMode : [int] 
Inheritance : [int] 
%inst



%index
BuildImpersonateTrusteeW
(no summary)
%group
Win32 advapi32
%prm
pTrustee, pImpersonateTrustee
pTrustee : [var] 
pImpersonateTrustee : [var] 
%inst



%index
BuildSecurityDescriptorW
Allocates and initializes a new security descriptor. (Unicode)
%group
Win32 advapi32
%prm
pOwner, pGroup, cCountOfAccessEntries, pListOfAccessEntries, cCountOfAuditEntries, pListOfAuditEntries, pOldSD, pSizeNewSD, pNewSD
pOwner : [var] A pointer to a TRUSTEE structure that identifies the owner for the new security descriptor. If the structure uses the TRUSTEE_IS_NAME form, BuildSecurityDescriptor looks up the security identifier (SID) associated with the specified trustee name.
pGroup : [var] A pointer to a TRUSTEE structure that identifies the primary group SID for the new security descriptor. If the structure uses the TRUSTEE_IS_NAME form, BuildSecurityDescriptor looks up the SID associated with the specified trustee name.
cCountOfAccessEntries : [int] The number of EXPLICIT_ACCESS structures in the pListOfAccessEntries array.
pListOfAccessEntries : [var] A pointer to an array of EXPLICIT_ACCESS structures that describe access control information for the discretionary access control list (DACL) of the new security descriptor. The function creates the new DACL by merging the information in the array with the DACL in pOldSD, if any. If pOldSD is NULL, or if the DACL in pOldSD is NULL, the function creates a new DACL based solely on the information in the array. For a description of the rules for creating an ACL from an array of EXPLICIT_ACCESS structures, see the SetEntriesInAcl function.
cCountOfAuditEntries : [int] The number of EXPLICIT_ACCESS structures in the pListOfAuditEntries array.
pListOfAuditEntries : [var] A pointer to an array of EXPLICIT_ACCESS structures that describe audit control information for the SACL of the new security descriptor. The function creates the new SACL by merging the information in the array with the SACL in pOldSD, if any. If pOldSD is NULL, or the SACL in pOldSD is NULL, the function creates a new SACL based solely on the information in the array.
pOldSD : [int] A pointer to an existing self-relative SECURITY_DESCRIPTOR structure and its associated security information. The function builds the new security descriptor by merging the specified owner, group, access control, and audit-control information with the information in this security descriptor. This parameter can be NULL.
pSizeNewSD : [var] A pointer to a variable that receives the size, in bytes, of the security descriptor.
pNewSD : [var] A pointer to a variable that receives a pointer to the new security descriptor. The function allocates memory for the new security descriptor. You must call the LocalFree function to free the returned buffer.
%inst
Allocates and initializes a new security descriptor. (Unicode)

[戻り値]
If the function succeeds, the function returns ERROR_SUCCESS.
If the function fails, it returns a nonzero error code defined in
WinError.h.

[備考]
The BuildSecurityDescriptor function is intended for trusted servers
that implement or expose security on their own objects. The function
uses self-relative security descriptors suitable for serializing into
a stream and storing to disk, as a trusted server might require.
> [!NOTE] > The aclapi.h header defines BuildSecurityDescriptor as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
BuildTrusteeWithNameW
Initializes a TRUSTEE structure. The caller specifies the trustee name. The function sets other members of the structure to default values. (Unicode)
%group
Win32 advapi32
%prm
pTrustee, pName
pTrustee : [var] A pointer to a TRUSTEE structure to initialize. The BuildTrusteeWithName function does not allocate any memory. If this parameter is NULL or a pointer that is not valid, the results are undefined.
pName : [wstr] A pointer to a null-terminated string that contains the name of the trustee for the ptstrName member of the TRUSTEE structure. The BuildTrusteeWithName function sets the other members of the TRUSTEE structure as follows.
%inst
Initializes a TRUSTEE structure. The caller specifies the trustee
name. The function sets other members of the structure to default
values. (Unicode)

[備考]
> [!NOTE] > The aclapi.h header defines BuildTrusteeWithName as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
BuildTrusteeWithObjectsAndNameW
Initializes a TRUSTEE structure with the object-specific access control entry (ACE) information and initializes the remaining members of the structure to default values. The caller also specifies the name of the trustee. (Unicode)
%group
Win32 advapi32
%prm
pTrustee, pObjName, ObjectType, ObjectTypeName, InheritedObjectTypeName, Name
pTrustee : [var] A pointer to a TRUSTEE structure that will be initialized by this function. If the value of this parameter is NULL or a pointer that is not valid, the results are undefined.
pObjName : [var] A pointer to an OBJECTS_AND_NAME structure that contains information about the trustee and the securable object.
ObjectType : [int] A pointer to an SE_OBJECT_TYPE enumeration that contains information about the type of securable object.
ObjectTypeName : [wstr] A pointer to a string that specifies the name that corresponds to the ObjectType GUID to be added to the TRUSTEE structure returned in the pTrustee parameter. This function determines the ObjectType GUID that corresponds to this name.
InheritedObjectTypeName : [wstr] A pointer to a string that specifies the name that corresponds to the InheritedObjectType GUID to be added to the TRUSTEE structure returned in the pTrustee parameter. This function determines the InheritedObjectType GUID that corresponds to this name.
Name : [wstr] A pointer to a string that specifies the name used to identify the trustee.
%inst
Initializes a TRUSTEE structure with the object-specific access
control entry (ACE) information and initializes the remaining members
of the structure to default values. The caller also specifies the
name of the trustee. (Unicode)

[備考]
This function does not allocate memory for the TRUSTEE and
OBJECTS_AND_NAME structures. For more information about
object-specific ACEs, see Object-specific ACEs.
> [!NOTE] > The aclapi.h header defines
BuildTrusteeWithObjectsAndName as an alias which automatically
selects the ANSI or Unicode version of this function based on the
definition of the UNICODE preprocessor constant. Mixing usage of the
encoding-neutral alias with code that not encoding-neutral can lead
to mismatches that result in compilation or runtime errors. For more
information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
BuildTrusteeWithObjectsAndSidW
Initializes a TRUSTEE structure with the object-specific access control entry (ACE) information and initializes the remaining members of the structure to default values. (Unicode)
%group
Win32 advapi32
%prm
pTrustee, pObjSid, pObjectGuid, pInheritedObjectGuid, pSid
pTrustee : [var] A pointer to a TRUSTEE structure to initialize. The BuildTrusteeWithObjectsAndSid function does not allocate any memory. If this parameter is NULL or a pointer that is not valid, the results are undefined.
pObjSid : [var] A pointer to an OBJECTS_AND_SID structure that contains information about the trustee and the securable object.
pObjectGuid : [var] A pointer to a GUID structure that describes the ObjectType GUID to be added to the TRUSTEE structure.
pInheritedObjectGuid : [var] A pointer to a GUID structure that describes the InheritedObjectType GUID to be added to the TRUSTEE structure.
pSid : [int] A pointer to a SID structure that identifies the trustee.
%inst
Initializes a TRUSTEE structure with the object-specific access
control entry (ACE) information and initializes the remaining members
of the structure to default values. (Unicode)

[備考]
This function does not allocate memory for the TRUSTEE and
OBJECTS_AND_SID structures. For more information about
object-specific ACEs, see Object-specific ACEs.
> [!NOTE] > The aclapi.h header defines BuildTrusteeWithObjectsAndSid
as an alias which automatically selects the ANSI or Unicode version
of this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
BuildTrusteeWithSidW
Initializes a TRUSTEE structure. The caller specifies the security identifier (SID) of the trustee. The function sets other members of the structure to default values and does not look up the name associated with the SID. (Unicode)
%group
Win32 advapi32
%prm
pTrustee, pSid
pTrustee : [var] A pointer to a TRUSTEE structure to initialize. The BuildTrusteeWithSid function does not allocate any memory. If this parameter is NULL or a pointer that is not valid, the results are undefined.
pSid : [int] A pointer to a SID structure that identifies the trustee. The BuildTrusteeWithSid function assigns this pointer to the ptstrName member of the TRUSTEE structure. The function sets the other members of the TRUSTEE structure as follows.
%inst
Initializes a TRUSTEE structure. The caller specifies the security
identifier (SID) of the trustee. The function sets other members of
the structure to default values and does not look up the name
associated with the SID. (Unicode)

[備考]
> [!NOTE] > The aclapi.h header defines BuildTrusteeWithSid as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CloseServiceHandle
Closes a handle to a service control manager or service object.
%group
Win32 advapi32
%prm
hSCObject
hSCObject : [intptr] A handle to the service control manager object or the service object to close. Handles to service control manager objects are returned by the OpenSCManager function, and handles to service objects are returned by either the OpenService or CreateService function.
%inst
Closes a handle to a service control manager or service object.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The following error code can be set
by the service control manager. Other error codes can be set by
registry functions that are called by the service control manager.
This doc was truncated.

[備考]
The CloseServiceHandle function does not destroy the service control
manager object referred to by the handle. A service control manager
object cannot be destroyed. A service object can be destroyed by
calling the DeleteService function.


%index
ChangeServiceConfigW
Changes the configuration parameters of a service. (Unicode)
%group
Win32 advapi32
%prm
hService, dwServiceType, dwStartType, dwErrorControl, lpBinaryPathName, lpLoadOrderGroup, lpdwTagId, lpDependencies, lpServiceStartName, lpPassword, lpDisplayName
hService : [intptr] A handle to the service. This handle is returned by the OpenService or CreateService function and must have the SERVICE_CHANGE_CONFIG access right. For more information, see Service Security and Access Rights.
dwServiceType : [int] The type of service. Specify SERVICE_NO_CHANGE if you are not changing the existing service type; otherwise, specify one of the following service types.
dwStartType : [int] 
dwErrorControl : [int] 
lpBinaryPathName : [wstr] The fully qualified path to the service binary file. Specify NULL if you are not changing the existing path. If the path contains a space, it must be quoted so that it is correctly interpreted. For example, "d:\\my share\\myservice.exe" should be specified as "\"d:\\my share\\myservice.exe\"".
lpLoadOrderGroup : [wstr] The  name of the load ordering group of which this service is a member. Specify NULL if you are not changing the existing group. Specify an empty string if the service does not belong to a group.
lpdwTagId : [var] A pointer to a variable that receives a tag value that is unique in the group specified in the lpLoadOrderGroup parameter. Specify NULL if you are not changing the existing tag.
lpDependencies : [wstr] A pointer to a double null-terminated array of null-separated names of services or load ordering groups that the system must start before this service can be started. (Dependency on a group means that this service can run if at least one member of the group is running after an attempt to start all members of the group.) Specify NULL if you are not changing the existing dependencies. Specify an empty string if the service has no dependencies.
lpServiceStartName : [wstr] The name of the account under which the service should run. Specify NULL if you are not changing the existing account name. If the service type is SERVICE_WIN32_OWN_PROCESS, use an account name in the form DomainName\UserName. The service process will be logged on as this user. If the account belongs to the built-in domain, you can specify .\UserName (note that the corresponding C/C++ string is ".\\UserName"). For more information, see Service User Accounts and the warning in the Remarks section.
lpPassword : [wstr] The password to the account name specified by the lpServiceStartName parameter. Specify NULL if you are not changing the existing password. Specify an empty string if the account has no password or if the service runs in the LocalService, NetworkService, or LocalSystem account. For more information, see Service Record List.
lpDisplayName : [wstr] The display name to be used by applications to identify the service for its users. Specify NULL if you are not changing the existing display name; otherwise, this string has a maximum length of 256 characters. The name is case-preserved in the service control manager. Display name comparisons are always case-insensitive. This parameter can specify a localized string using the following format: @[path\]dllname,-strID The string with identifier strID is loaded from dllname; the path is optional. For more information, see RegLoadMUIString. Windows Server?2003 and Windows?XP:??Localized strings are not supported until Windows?Vista.
%inst
Changes the configuration parameters of a service. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The following error codes may be set
by the service control manager. Other error codes may be set by the
registry functions that are called by the service control manager.
This doc was truncated.

[備考]
The ChangeServiceConfig function changes the configuration
information for the specified service in the service control manager
database. You can obtain the current configuration information by
using the QueryServiceConfig function. If the configuration is
changed for a service that is running, with the exception of
lpDisplayName, the changes do not take effect until the service is
stopped. To update the credentials without having to restart the
service, use the LsaCallAuthenticationPackage function. Security
Remarks Setting the lpServiceStartName parameter changes the logon
account of the service. This can cause problems. If you have
registered a service principal name (SPN), it would now be registered
on the wrong account. Similarly, if you have used an ACE to grant
access to a service, it would now grant access to the wrong account.


%index
ChangeServiceConfig2A
Changes the optional configuration parameters of a service. (ANSI)
%group
Win32 advapi32
%prm
hService, dwInfoLevel, lpInfo
hService : [intptr] A handle to the service. This handle is returned by the OpenService or CreateService function and must have the SERVICE_CHANGE_CONFIG access right. For more information, see Service Security and Access Rights.
dwInfoLevel : [int] 
lpInfo : [intptr] A pointer to the new value to be set for the configuration information. The format of this data depends on the value of the dwInfoLevel parameter. If this value is NULL, the information remains unchanged.
%inst
Changes the optional configuration parameters of a service. (ANSI)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The ChangeServiceConfig2 function changes the optional configuration
information for the specified service in the service control manager
database. You can obtain the current optional configuration
information by using the QueryServiceConfig2 function. You cannot set
the SERVICE_CONFIG_FAILURE_ACTIONS value for a service that shares
the service control manager's process. This includes all services
whose executable image is "Services.exe". You can change and query
additional configuration information using the ChangeServiceConfig
and QueryServiceConfig functions, respectively. If a service is
configured to restart after it finishes with an error, the service
control manager queues the restart action to occur after the
specified time delay. A queued restart action cannot be canceled. If
the service is manually restarted and then stopped before the queued
restart action occurs, the service will restart unexpectedly when the
time delay elapses. The service must be explicitly disabled to
prevent it from restarting. The SERVICE_CONFIG_LAUNCH_PROTECTED value
can be used to launch the service as protected. In order to launch
the service as protected, the service must be signed with a special
certificate.
SERVICE_CONFIG_LAUNCH_PROTECTED example:
This doc was truncated.


%index
ChangeServiceConfig2W
Changes the optional configuration parameters of a service. (Unicode)
%group
Win32 advapi32
%prm
hService, dwInfoLevel, lpInfo
hService : [intptr] A handle to the service. This handle is returned by the OpenService or CreateService function and must have the SERVICE_CHANGE_CONFIG access right. For more information, see Service Security and Access Rights.
dwInfoLevel : [int] 
lpInfo : [intptr] A pointer to the new value to be set for the configuration information. The format of this data depends on the value of the dwInfoLevel parameter. If this value is NULL, the information remains unchanged.
%inst
Changes the optional configuration parameters of a service. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The ChangeServiceConfig2 function changes the optional configuration
information for the specified service in the service control manager
database. You can obtain the current optional configuration
information by using the QueryServiceConfig2 function. You cannot set
the SERVICE_CONFIG_FAILURE_ACTIONS value for a service that shares
the service control manager's process. This includes all services
whose executable image is "Services.exe". You can change and query
additional configuration information using the ChangeServiceConfig
and QueryServiceConfig functions, respectively. If a service is
configured to restart after it finishes with an error, the service
control manager queues the restart action to occur after the
specified time delay. A queued restart action cannot be canceled. If
the service is manually restarted and then stopped before the queued
restart action occurs, the service will restart unexpectedly when the
time delay elapses. The service must be explicitly disabled to
prevent it from restarting. The SERVICE_CONFIG_LAUNCH_PROTECTED value
can be used to launch the service as protected. In order to launch
the service as protected, the service must be signed with a special
certificate.
SERVICE_CONFIG_LAUNCH_PROTECTED example:
This doc was truncated.


%index
CheckForHiberboot
(no summary)
%group
Win32 advapi32
%prm
pHiberboot, bClearFlag
pHiberboot : [var] 
bClearFlag : [int] 
%inst



%index
CheckTokenMembership
Determines whether a specified security identifier (SID) is enabled in an access token.
%group
Win32 advapi32
%prm
TokenHandle, SidToCheck, IsMember
TokenHandle : [intptr] A handle to an access token. The handle must have TOKEN_QUERY access to the token. The token must be an impersonation token.
SidToCheck : [int] A pointer to a SID structure. The CheckTokenMembership function checks for the presence of this SID in the user and group SIDs of the access token.
IsMember : [var] A pointer to a variable that receives the results of the check. If the SID is present and has the SE_GROUP_ENABLED attribute, IsMember returns TRUE; otherwise, it returns FALSE.
%inst
Determines whether a specified security identifier (SID) is enabled
in an access token.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The CheckTokenMembership function simplifies the process of
determining whether a SID is both present and enabled in an access
token. Even if a SID is present in the token, the system may not use
the SID in an access check. The SID may be disabled or have the
SE_GROUP_USE_FOR_DENY_ONLY attribute. The system uses only enabled
SIDs to grant access when performing an access check. For more
information, see SID Attributes in an Access Token. If TokenHandle is
a restricted token, or if TokenHandle is NULL and the current
effective token of the calling thread is a restricted token,
CheckTokenMembership also checks whether the SID is present in the
list of restricting SIDs.


%index
ClearEventLogW
Clears the specified event log, and optionally saves the current copy of the log to a backup file. (Unicode)
%group
Win32 advapi32
%prm
hEventLog, lpBackupFileName
hEventLog : [intptr] A handle to the event log to be cleared. The OpenEventLog function returns this handle.
lpBackupFileName : [wstr] The absolute or relative path of the backup file. If this file already exists, the function fails.
%inst
Clears the specified event log, and optionally saves the current copy
of the log to a backup file. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The ClearEventLog function can fail
if the event log is empty or the backup file already exists.

[備考]
After this function returns, any handles that reference the cleared
event log cannot be used to read the log.
> [!NOTE] > The winbase.h header defines ClearEventLog as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CloseEncryptedFileRaw
Closes an encrypted file after a backup or restore operation, and frees associated system resources.
%group
Win32 advapi32
%prm
pvContext
pvContext : [intptr] A pointer to a system-defined context block. The OpenEncryptedFileRaw function returns the context block.
%inst
Closes an encrypted file after a backup or restore operation, and
frees associated system resources.

[備考]
The CloseEncryptedFileRaw function frees allocated system resources
such as the system-defined context block and closes the file. The
BackupRead and BackupWrite functions handle backup and restore of
unencrypted files. In Windows 8, Windows Server 2012, and later, this
function is supported by the following technologies.
This doc was truncated.


%index
CloseEventLog
Closes the specified event log. (CloseEventLog)
%group
Win32 advapi32
%prm
hEventLog
hEventLog : [intptr] A handle to the event log to be closed. The OpenEventLog or OpenBackupEventLog function returns this handle.
%inst
Closes the specified event log. (CloseEventLog)

[戻り値]
If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. To get extended
error information, call GetLastError.


%index
CloseThreadWaitChainSession
Closes the specified WCT session and cancels any outstanding asynchronous operations.
%group
Win32 advapi32
%prm
WctHandle
WctHandle : [intptr] A handle to the WCT session created by the OpenThreadWaitChainSession function.
%inst
Closes the specified WCT session and cancels any outstanding
asynchronous operations.

[備考]
If the WCT session was opened in asynchronous mode (with
WCT_ASYNC_OPEN_FLAG), the function cancels any outstanding operations
after their callback functions have been called and returned, and
then it returns.


%index
CloseTrace
The CloseTrace function closes a trace processing session that was created with OpenTrace.
%group
Win32 advapi32
%prm
TraceHandle
TraceHandle : [int] Handle to the trace processing session to close. The [OpenTrace](/windows/win32/api/evntrace/nf-evntrace-opentracea) function returns this handle.
%inst
The CloseTrace function closes a trace processing session that was
created with OpenTrace.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is one of the [system error
codes](/windows/win32/debug/system-error-codes). The following are
some common errors and their causes. - **ERROR_INVALID_HANDLE** One
of the following is true: - _TraceHandle_ is **0**. - _TraceHandle_
is **INVALID_PROCESSTRACE_HANDLE**. - _TraceHandle_ is not a valid
handle. - **ERROR_BUSY** Prior to Windows Vista, you cannot close the
trace until the
[ProcessTrace](/windows/win32/api/evntrace/nf-evntrace-processtrace)
function completes. - **ERROR_CTX_CLOSE_PENDING** The call was
successful. The
[ProcessTrace](/windows/win32/api/evntrace/nf-evntrace-processtrace)
function will stop after it has processed all real-time events in its
buffers (it will not receive any new events).

[備考]
Consumers call this function to close a trace handle returned by
**OpenTrace**. > [!Important] > Do not use this function to close the
trace handle returned by > **StartTrace**. If you are processing
events from a log file, you call this function only after the
[ProcessTrace](/windows/win32/api/evntrace/nf-evntrace-processtrace)
function returns. However, if you are processing real-time events,
you can call this function before **ProcessTrace** returns. (Another
way to stop trace processing is to return FALSE from
[BufferCallback](/windows/win32/api/evntrace/nc-evntrace-pevent_trace_buffer_callbacka).)
If you call this function before **ProcessTrace** returns, the
**CloseTrace** function returns ERROR_CTX_CLOSE_PENDING. The
ERROR_CTX_CLOSE_PENDING code indicates that the **CloseTrace**
function call was successful; the **ProcessTrace** function will stop
processing events after it processes all previously-queued events
(**ProcessTrace** will not receive any new events after you call the
**CloseTrace** function). You can call the **CloseTrace** function
from your [BufferCallback](/windows/desktop/ETW/buffercallback),
[EventCallback](/windows/desktop/ETW/eventcallback), or
[EventClassCallback](/windows/desktop/ETW/eventclasscallback)
callback. > **Prior to Windows Vista:** You can call **CloseTrace**
only after >
[ProcessTrace](/windows/win32/api/evntrace/nf-evntrace-processtrace)
returns.


%index
CommandLineFromMsiDescriptor
(no summary)
%group
Win32 advapi32
%prm
Descriptor, CommandLine, CommandLineLength
Descriptor : [wstr] 
CommandLine : [wstr] 
CommandLineLength : [var] 
%inst



%index
ControlService
Sends a control code to a service. (ControlService)
%group
Win32 advapi32
%prm
hService, dwControl, lpServiceStatus
hService : [intptr] A handle to the service. This handle is returned by the OpenService or CreateService function. The access rights required for this handle depend on the dwControl code requested.
dwControl : [int] This parameter can be one of the following control codes.
lpServiceStatus : [var] A pointer to a SERVICE_STATUS structure that receives the latest service status information. The information returned reflects the most recent status that the service reported to the service control manager.
%inst
Sends a control code to a service. (ControlService)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The following error codes can be set
by the service control manager. Other error codes can be set by the
registry functions that are called by the service control manager.
This doc was truncated.

[備考]
The ControlService function asks the Service Control Manager (SCM) to
send the requested control code to the service. The SCM sends the
code if the service has specified that it will accept the code, and
is in a state in which a control code can be sent to it. The SCM
processes service control notifications in a serial fashion?it will
wait for one service to complete processing a service control
notification before sending the next one. Because of this, a call to
ControlService will block for 30 seconds if any service is busy
handling a control code. If the busy service still has not returned
from its handler function when the timeout expires, ControlService
fails with ERROR_SERVICE_REQUEST_TIMEOUT. To stop and start a service
requires a security descriptor that allows you to do so. The default
security descriptor allows the LocalSystem account, and members of
the Administrators and Power Users groups to stop and start services.
To change the security descriptor of a service, see Modifying the
DACL for a Service. The QueryServiceStatusEx function returns a
SERVICE_STATUS_PROCESS structure whose dwCurrentState and
dwControlsAccepted members indicate the current state and controls
accepted by a running service. All running services accept the
SERVICE_CONTROL_INTERROGATE control code by default. Drivers do not
accept control codes other than SERVICE_CONTROL_STOP and
SERVICE_CONTROL_INTERROGATE. Each service specifies the other control
codes that it accepts when it calls the SetServiceStatus function to
report its status. A service should always accept these codes when it
is running, no matter what it is doing. The following table shows the
action of the SCM in each of the possible service states.
This doc was truncated.


%index
ControlServiceExW
Sends a control code to a service. (ControlServiceExW)
%group
Win32 advapi32
%prm
hService, dwControl, dwInfoLevel, pControlParams
hService : [intptr] A handle to the service. This handle is returned by the OpenService or CreateService function. The access rights required for this handle depend on the dwControl code requested.
dwControl : [int] This parameter can be one of the following control codes.
dwInfoLevel : [int] The information level for the service control parameters. This parameter must be set to SERVICE_CONTROL_STATUS_REASON_INFO (1).
pControlParams : [intptr] A pointer to the service control parameters. If dwInfoLevel is SERVICE_CONTROL_STATUS_REASON_INFO, this member is a pointer to a SERVICE_CONTROL_STATUS_REASON_PARAMS structure.
%inst
Sends a control code to a service. (ControlServiceExW)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The following error codes can be set
by the service control manager. Other error codes can be set by the
registry functions that are called by the service control manager.
This doc was truncated.

[備考]
The ControlServiceEx function asks the Service Control Manager (SCM)
to send the requested control code to the service. The SCM sends the
code if the service has specified that it will accept the code, and
is in a state in which a control code can be sent to it. The SCM
processes service control notifications in a serial fashion ? it
waits for one service to complete processing a service control
notification before sending the next one. Because of this, a call to
ControlServiceEx blocks for 30 seconds if any service is busy
handling a control code. If the busy service still has not returned
from its handler function when the timeout expires, ControlServiceEx
fails with ERROR_SERVICE_REQUEST_TIMEOUT. To stop and start a service
requires a security descriptor that allows you to do so. The default
security descriptor allows the LocalSystem account, and members of
the Administrators and Power Users groups to stop and start services.
To change the security descriptor of a service, see Modifying the
DACL for a Service. The QueryServiceStatusEx function returns a
SERVICE_STATUS_PROCESS structure whose dwCurrentState and
dwControlsAccepted members indicate the current state and controls
accepted by a running service. All running services accept the
SERVICE_CONTROL_INTERROGATE control code by default. Drivers do not
accept control codes other than SERVICE_CONTROL_STOP and
SERVICE_CONTROL_INTERROGATE. Each service specifies the other control
codes that it accepts when it calls the SetServiceStatus function to
report its status. A service should always accept these codes when it
is running, no matter what it is doing. The following table shows the
action of the SCM in each of the possible service states.
This doc was truncated.


%index
ControlTraceW
The ControlTraceW (Unicode) function (evntrace.h) flushes, queries, updates, or stops the specified event tracing session.
%group
Win32 advapi32
%prm
TraceHandle, InstanceName, Properties, ControlCode
TraceHandle : [int] Handle to an event tracing session, or 0. You must specify a non-zero _TraceHandle_ if _InstanceName_ is **NULL**. ETW ignores the handle if _InstanceName_ is not **NULL**. The [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracew) function returns this handle when a new trace is started. To obtain the handle of an existing trace, use **ControlTrace** to query the trace properties based on the trace's name and then get the handle from the **Wnode.HistoricalContext** field of the returned `EVENT_TRACE_PROPERTIES` data.
InstanceName : [wstr] Name of an event tracing session, or **NULL**. You must specify _InstanceName_ if _TraceHandle_ is 0. To specify the NT Kernel Logger session, set _InstanceName_ to **KERNEL_LOGGER_NAME**.
Properties : [var] Pointer to an initialized [EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties) structure. This structure should be zeroed-out before setting any fields. If _ControlCode_ specifies **EVENT_TRACE_CONTROL_STOP**, **EVENT_TRACE_CONTROL_QUERY** or **EVENT_TRACE_CONTROL_FLUSH**, you only need to set the **Wnode.BufferSize**, **Wnode.Guid**, **LoggerNameOffset**, and **LogFileNameOffset** members of the [EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties) structure. If the session is a private session, you also need to set **LogFileMode**. You can use the maximum session name (1024 characters) and maximum log file name (1024 characters) lengths to calculate the buffer size and offsets if not known. If _ControlCode_ specifies **EVENT_TRACE_CONTROL_UPDATE**, on input, the members must specify the new values for the properties to update. On output, _Properties_ contains the properties and statistics for the event tracing session. You can update the following properties. - **EnableFlags**: Set this member to 0 to disable all system providers. Set this to a non-zero value to specify the system providers that you want to enable or keep enabled. This may be non-zero only for [system loggers](/windows/win32/api/evntrace/nf-evntrace-starttracew#system-loggers). - **FlushTimer**: Set this member if you want to change the time to wait before flushing buffers. If this member is 0, the member is not updated. - **LogFileNameOffset**: Set this member if you want to switch to another log file or to flush a buffering-mode trace to a new log file. If this member is 0, the file name is not updated. If the offset is not zero and you do not change the log file name, the function returns an error. - **LogFileMode**: Set this member if you want to turn **EVENT_TRACE_REAL_TIME_MODE** on and off. To turn real time consuming off, set this member to 0. To turn real time consuming on (creating a session that records to disk as well as delivering events in real-time), set this member to **EVENT_TRACE_REAL_TIME_MODE** and it will be OR'd with the current modes. - **MaximumBuffers**: Set this member if you want to change the maximum number of buffers that ETW uses. If this member is 0, the member is not updated. For private logger sessions, you can update only the **LogFileNameOffset** and **FlushTimer** members. If you are using a newly initialized [EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties) structure, zero-out the structure, then set **Wnode.BufferSize**, **Wnode.Guid**, and **Wnode.Flags**, and the values you want to update. If you are reusing a **EVENT_TRACE_PROPERTIES** structure (i.e. using a structure that you previously passed to [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracew) or **ControlTrace**), be sure to set the **LogFileNameOffset** member to 0 unless you are changing the log file name, and be sure to set [EVENT_TRACE_PROPERTIES.Wnode.Flags](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties) to **WNODE_FLAG_TRACED_GUID**. > **Starting with Windows?10, version 1703:** For better performance in cross > process scenarios, you can now pass filtering information to **ControlTrace** > for system wide private loggers. You will need to use the > [EVENT_TRACE_PROPERTIES_V2](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties_v2) > structure to include filtering information. See > [Configuring and Starting a Private Logger Session](/windows/win32/etw/configuring-and-starting-a-private-logger-session) > for more details.
ControlCode : [int] 
%inst
The ControlTraceW (Unicode) function (evntrace.h) flushes, queries,
updates, or stops the specified event tracing session.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is one of the [system error
codes](/windows/win32/debug/system-error-codes). The following are
some common errors and their causes. - **ERROR_BAD_LENGTH** One of
the following is true: - The **Wnode.BufferSize** member of
_Properties_ specifies an incorrect size. - _Properties_ does not
have sufficient space allocated to hold a copy of the session name
and log file name (if used). - **ERROR_INVALID_PARAMETER** One of the
following is true: - _Properties_ is **NULL**. - _InstanceName_ and
_TraceHandle_ are both **NULL**. - _InstanceName_ is **NULL** and
_TraceHandle_ is not a valid handle. - The **LogFileNameOffset**
member of _Properties_ is not valid. - The **LoggerNameOffset**
member of _Properties_ is not valid. - The **LogFileMode** member of
_Properties_ specifies a combination of flags that is not valid. -
The **Wnode.Guid** member of _Properties_ is
**SystemTraceControlGuid**, but the _InstanceName_ parameter is not
`KERNEL_LOGGER_NAME`. - **ERROR_BAD_PATHNAME** Another session is
already using the file name specified by the **LogFileNameOffset**
member of the _Properties_ structure. - **ERROR_MORE_DATA** The
buffer for
[EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties)
is too small to hold all the information for the session. If you do
not need the session's property information, you can ignore this
error. If you receive this error when stopping the session, ETW will
have already stopped the session before generating this error. -
**ERROR_ACCESS_DENIED** Only users running with elevated
administrative privileges, users in the Performance Log Users group,
and services running as LocalSystem, LocalService, NetworkService can
control event tracing sessions. To grant a restricted user the
ability to control trace sessions, add them to the Performance Log
Users group. Only users with administrative privileges and services
running as LocalSystem can control an NT Kernel Logger session.
**Windows XP and Windows 2000:** Anyone can control a trace session.
- **ERROR_WMI_INSTANCE_NOT_FOUND** The given session is not running.
- **ERROR_ACTIVE_CONNECTIONS** When returned from a
EVENT_TRACE_CONTROL_STOP call, this indicates that the session is
already in the process of stopping.

[備考]
Event trace controllers call this function. This function supersedes
the
[FlushTrace](/windows/win32/api/evntrace/nf-evntrace-flushtracew),
[QueryTrace](/windows/win32/api/evntrace/nf-evntrace-querytracew),
[StopTrace](/windows/win32/api/evntrace/nf-evntrace-stoptracew), and
[UpdateTrace](/windows/win32/api/evntrace/nf-evntrace-updatetracew)
functions. > [!NOTE] > The evntrace.h header defines ControlTrace as
an alias which > automatically selects the ANSI or Unicode version of
this function based on > the definition of the UNICODE preprocessor
constant. Mixing usage of the > encoding-neutral alias with code that
not encoding-neutral can lead to > mismatches that result in
compilation or runtime errors. For more information, > see >
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ConvertSecurityDescriptorToStringSecurityDescriptorW
Converts a security descriptor to a string format. You can use the string format to store or transmit the security descriptor. (Unicode)
%group
Win32 advapi32
%prm
SecurityDescriptor, RequestedStringSDRevision, SecurityInformation, StringSecurityDescriptor, StringSecurityDescriptorLen
SecurityDescriptor : [int] A pointer to the security descriptor to convert. The security descriptor can be in absolute or self-relative format.
RequestedStringSDRevision : [int] Specifies the revision level of the output StringSecurityDescriptor string. Currently this value must be SDDL_REVISION_1.
SecurityInformation : [int] Specifies a combination of the SECURITY_INFORMATION bit flags to indicate the components of the security descriptor to include in the output string. The BACKUP_SECURITY_INFORMATION flag is not applicable to this function. If the BACKUP_SECURITY_INFORMATION flag is passed in, the SecurityInformation parameter returns TRUE with null string output.
StringSecurityDescriptor : [var] A pointer to a variable that receives a pointer to a null-terminated security descriptor string. For a description of the string format, see Security Descriptor String Format. To free the returned buffer, call the LocalFree function.
StringSecurityDescriptorLen : [var] A pointer to a variable that receives the size, in TCHARs, of the security descriptor string returned in the StringSecurityDescriptor buffer. This parameter can be NULL if you do not need to retrieve the size. The size represents the size of the buffer in WCHARs, not the number of WCHARs in the string.
%inst
Converts a security descriptor to a string format. You can use the
string format to store or transmit the security descriptor. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The GetLastError function may return
one of the following error codes.
This doc was truncated.

[備考]
If the DACL is NULL, and the SE_DACL_PRESENT control bit is set in
the input security descriptor, the function fails. If the DACL is
NULL, and the SE_DACL_PRESENT control bit is not set in the input
security descriptor, the resulting security descriptor string does
not have a D: component. For more information, see Security
Descriptor String Format.
> [!NOTE] > The sddl.h header defines
ConvertSecurityDescriptorToStringSecurityDescriptor as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ConvertSidToStringSidW
Converts a security identifier (SID) to a string format suitable for display, storage, or transmission. (Unicode)
%group
Win32 advapi32
%prm
Sid, StringSid
Sid : [int] A pointer to the SID structure to be converted.
StringSid : [var] A pointer to a variable that receives a pointer to a null-terminated SID string. To free the returned buffer, call the LocalFree function.
%inst
Converts a security identifier (SID) to a string format suitable for
display, storage, or transmission. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The GetLastError function may return
one of the following error codes.
This doc was truncated.

[備考]
The ConvertSidToStringSid function uses the standard S-R-I-S-S…
format for SID strings. For more information about SID string
notation, see SID Components.
> [!NOTE] > The sddl.h header defines ConvertSidToStringSid as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ConvertStringSecurityDescriptorToSecurityDescriptorW
Converts a string-format security descriptor into a valid, functional security descriptor. (Unicode)
%group
Win32 advapi32
%prm
StringSecurityDescriptor, StringSDRevision, SecurityDescriptor, SecurityDescriptorSize
StringSecurityDescriptor : [wstr] A pointer to a null-terminated string containing the string-format security descriptor to convert.
StringSDRevision : [int] Specifies the revision level of the StringSecurityDescriptor string. Currently this value must be SDDL_REVISION_1.
SecurityDescriptor : [var] A pointer to a variable that receives a pointer to the converted security descriptor. The returned security descriptor is self-relative. To free the returned buffer, call the LocalFree function. To convert the security descriptor to an absolute security descriptor, use the MakeAbsoluteSD function.
SecurityDescriptorSize : [var] A pointer to a variable that receives the size, in bytes, of the converted security descriptor. This parameter can be NULL.
%inst
Converts a string-format security descriptor into a valid, functional
security descriptor. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. GetLastError may return one of the
following error codes.
This doc was truncated.

[備考]
If ace_type is ACCESS_ALLOWED_OBJECT_ACE_TYPE and neither object_guid
nor inherit_object_guid has a GUID specified, then
ConvertStringSecurityDescriptorToSecurityDescriptor converts ace_type
to ACCESS_ALLOWED_ACE_TYPE. For information about the ace_type,
object_guid, and inherit_object_guid fields, see Ace Strings.
> [!NOTE] > The sddl.h header defines
ConvertStringSecurityDescriptorToSecurityDescriptor as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ConvertStringSidToSidW
Converts a string-format security identifier (SID) into a valid, functional SID. You can use this function to retrieve a SID that the ConvertSidToStringSid function converted to string format. (Unicode)
%group
Win32 advapi32
%prm
StringSid, Sid
StringSid : [wstr] A pointer to a null-terminated string containing the string-format SID to convert.
Sid : [var] A pointer to a variable that receives a pointer to the converted SID. To free the returned buffer, call the LocalFree function.
%inst
Converts a string-format security identifier (SID) into a valid,
functional SID. You can use this function to retrieve a SID that the
ConvertSidToStringSid function converted to string format. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The GetLastError function may return
one of the following error codes.
This doc was truncated.

[備考]
> [!NOTE] > The sddl.h header defines ConvertStringSidToSid as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ConvertToAutoInheritPrivateObjectSecurity
Converts a security descriptor and its access control lists (ACLs) to a format that supports automatic propagation of inheritable access control entries (ACEs).
%group
Win32 advapi32
%prm
ParentDescriptor, CurrentSecurityDescriptor, NewSecurityDescriptor, ObjectType, IsDirectoryObject, GenericMapping
ParentDescriptor : [int] A pointer to the security descriptor for the parent container of the object. If there is no parent container, this parameter is NULL.
CurrentSecurityDescriptor : [int] A pointer to the current security descriptor of the object.
NewSecurityDescriptor : [var] A pointer to a variable that receives a pointer to the newly allocated self-relative security descriptor. It is the caller's responsibility to call the DestroyPrivateObjectSecurity function to free this security descriptor.
ObjectType : [var] A pointer to a GUID structure that identifies the type of object associated with the CurrentSecurityDescriptor parameter. If the object does not have a GUID, this parameter must be NULL.
IsDirectoryObject : [int] If TRUE, the new object is a container and can contain other objects. If FALSE, the new object is not a container.
GenericMapping : [var] A pointer to a GENERIC_MAPPING structure that specifies the mapping from each generic right to specific rights for the object.
%inst
Converts a security descriptor and its access control lists (ACLs) to
a format that supports automatic propagation of inheritable access
control entries (ACEs).

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. To get extended error information,
call GetLastError.

[備考]
The ConvertToAutoInheritPrivateObjectSecurity function attempts to
determine whether the ACEs in the discretionary access control list
(DACL) and system access control list (SACL) of the current security
descriptor were inherited from the parent security descriptor. The
function passes the ParentDescriptor parameter to the
CreatePrivateObjectSecurityEx function to get ACLs that contain only
inherited ACEs. Then it compares these ACEs to the ACEs in the
original security descriptor to determine which of the original ACEs
were inherited. The ACEs do not need to match one-to-one. For
instance, an ACE that allows read and write access to a trustee can
be equivalent to two ACEs: an ACE that allows read access and an ACE
that allows write access. Any ACEs in the original security
descriptor that are equivalent to the ACEs inherited from the parent
security descriptor are marked with the INHERITED_ACE flag and added
to the new security descriptor. All other ACEs in the original
security descriptor are added to the new security descriptor as
noninherited ACEs. If the original DACL does not have any inherited
ACEs, the function sets the SE_DACL_PROTECTED flag in the control
bits of the new security descriptor. Similarly, the SE_SACL_PROTECTED
flag is set if none of the ACEs in the SACL is inherited. For DACLs
that have inherited ACEs, the function reorders the ACEs into two
groups. The first group has ACEs that were directly applied to the
object. The second group has inherited ACEs. This ordering ensures
that noninherited ACEs have precedence over inherited ACEs. For more
information, see Order of ACEs in a DACL. The function sets the
SE_DACL_AUTO_INHERITED and SE_SACL_AUTO_INHERITED flags in the
control bits of the new security descriptor. The function does not
change the ordering of access-allowed ACEs in relation to
access-denied ACEs in the DACL because to do so would change the
semantics of the resulting security descriptor. If the function
cannot convert the DACL without changing the semantics, it leaves the
DACL unchanged and sets the SE_DACL_PROTECTED flag. The new security
descriptor has the same owner and primary group as the original
security descriptor. The new security descriptor is equivalent to the
original security descriptor, so the caller needs no access rights or
privileges to update the security descriptor to the new format. This
function works with ACL_REVISION and ACL_REVISION_DS ACLs.


%index
CopySid
Copies a security identifier (SID) to a buffer.
%group
Win32 advapi32
%prm
nDestinationSidLength, pDestinationSid, pSourceSid
nDestinationSidLength : [int] Specifies the length, in bytes, of the buffer receiving the copy of the SID.
pDestinationSid : [int] A pointer to a buffer that receives a copy of the source SID structure.
pSourceSid : [int] A pointer to a SID structure that the function copies to the buffer pointed to by the pDestinationSid parameter.
%inst
Copies a security identifier (SID) to a buffer.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
An application can use the CopySid function to make a copy of a SID
in an access token (for example, in a TOKEN_GROUPS structure) to use
in an access control entry (ACE).


%index
CreatePrivateObjectSecurity
Allocates and initializes a self-relative security descriptor for a new private object. A protected server calls this function when it creates a new private object.
%group
Win32 advapi32
%prm
ParentDescriptor, CreatorDescriptor, NewDescriptor, IsDirectoryObject, Token, GenericMapping
ParentDescriptor : [int] A pointer to the security descriptor for the parent directory in which a new object is being created. If there is no parent directory, this parameter can be NULL.
CreatorDescriptor : [int] A pointer to a security descriptor provided by the creator of the object. If the object's creator does not explicitly pass security information for the new object, this parameter is intended to be NULL.
NewDescriptor : [var] A pointer to a variable that receives a pointer to the newly allocated self-relative security descriptor. The caller must call the DestroyPrivateObjectSecurity function to free this security descriptor.
IsDirectoryObject : [int] Specifies whether the new object is a container. A value of TRUE indicates the object contains other objects, such as a directory.
Token : [intptr] A handle to the access token for the client process on whose behalf the object is being created. If this is an impersonation token, it must be at SecurityIdentification level or higher. For a full description of the SecurityIdentification impersonation level, see the SECURITY_IMPERSONATION_LEVEL enumerated type.
GenericMapping : [var] A pointer to a GENERIC_MAPPING structure that specifies the mapping from each generic right to specific rights for the object.
%inst
Allocates and initializes a self-relative security descriptor for a
new private object. A protected server calls this function when it
creates a new private object.

[戻り値]
If the function succeeds, the function returns nonzero.
If the function fails, it returns zero. To get extended error
information, call GetLastError.

[備考]
If a system access control list (SACL) is specified in the
SECURITY_DESCRIPTOR specified by the CreatorDescriptor parameter, the
Token parameter must have the SE_SECURITY_NAME privilege enabled. The
CreatePrivateObjectSecurity function checks this privilege and may
generate audits during the process.


%index
CreatePrivateObjectSecurityEx
Allocates and initializes a self-relative security descriptor for a new private object created by the resource manager calling this function. (CreatePrivateObjectSecurityEx)
%group
Win32 advapi32
%prm
ParentDescriptor, CreatorDescriptor, NewDescriptor, ObjectType, IsContainerObject, AutoInheritFlags, Token, GenericMapping
ParentDescriptor : [int] A pointer to the security descriptor for the parent container of the object. If there is no parent container, this parameter is NULL.
CreatorDescriptor : [int] A pointer to a security descriptor provided by the creator of the object. If the object's creator does not explicitly pass security information for the new object, this parameter can be NULL. Alternatively, this parameter can point to a default security descriptor.
NewDescriptor : [var] A pointer to a variable that receives a pointer to the newly allocated self-relative security descriptor. When you have finished using the security descriptor, free it by calling the DestroyPrivateObjectSecurity function.
ObjectType : [var] A pointer to a GUID structure that identifies the type of object associated with NewDescriptor. If the object does not have a GUID, set ObjectType to NULL.
IsContainerObject : [int] Specifies whether the new object can contain other objects. A value of TRUE indicates that the new object is a container. A value of FALSE indicates that the new object is not a container.
AutoInheritFlags : [int] 
Token : [intptr] A handle to the access token for the client process on whose behalf the object is being created. If this is an impersonation token, it must be at SecurityIdentification level or higher. For a full description of the SecurityIdentification impersonation level, see the SECURITY_IMPERSONATION_LEVEL enumerated type.
GenericMapping : [var] A pointer to a GENERIC_MAPPING structure that specifies the mapping from each generic right to specific rights for the object.
%inst
Allocates and initializes a self-relative security descriptor for a
new private object created by the resource manager calling this
function. (CreatePrivateObjectSecurityEx)

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. To get extended error information,
call GetLastError. Some of the extended error codes and their
meanings are listed in the following table.
This doc was truncated.

[備考]
The CreatePrivateObjectSecurity function is identical to calling the
CreatePrivateObjectSecurityEx function with ObjectType set to NULL
and AutoInheritFlags set to zero. The AutoInheritFlags parameter is
distinct from the similarly named bits in the Control member of the
SECURITY_DESCRIPTOR structure. For an explanation of the control
bits, see SECURITY_DESCRIPTOR_CONTROL. If AutoInheritFlags specifies
the SEF_DACL_AUTO_INHERIT bit, the function applies the following
rules to the DACL in the new security descriptor:
This doc was truncated.


%index
CreatePrivateObjectSecurityWithMultipleInheritance
Allocates and initializes a self-relative security descriptor for a new private object created by the resource manager calling this function. (CreatePrivateObjectSecurityWithMultipleInheritance)
%group
Win32 advapi32
%prm
ParentDescriptor, CreatorDescriptor, NewDescriptor, ObjectTypes, GuidCount, IsContainerObject, AutoInheritFlags, Token, GenericMapping
ParentDescriptor : [int] A pointer to the security descriptor for the parent container of the object. If there is no parent container, this parameter is NULL.
CreatorDescriptor : [int] A pointer to a security descriptor provided by the creator of the object. If the object's creator does not explicitly pass security information for the new object, this parameter can be NULL. Alternatively, this parameter can point to a default security descriptor.
NewDescriptor : [var] A pointer to a variable to receive a pointer to the newly allocated self-relative security descriptor. When you have finished using the security descriptor, free it by calling the DestroyPrivateObjectSecurity function.
ObjectTypes : [var] An array of pointers to GUID structures that identify the object types or classes of the object associated with NewDescriptor. For Active Directory objects, this array contains pointers to the class GUIDs of the object's structural class and all attached auxiliary classes. Set ObjectTypes to NULL if the object does not have a GUID.
GuidCount : [int] The number of GUIDs present in the ObjectTypes parameter.
IsContainerObject : [int] Specifies whether the new object can contain other objects. A value of TRUE indicates that the new object is a container. A value of FALSE indicates that the new object is not a container.
AutoInheritFlags : [int] 
Token : [intptr] A handle to the access token for the client process on whose behalf the object is being created. If this is an impersonation token, it must be at SecurityIdentification level or higher. For a full description of the SecurityIdentification impersonation level, see the SECURITY_IMPERSONATION_LEVEL enumerated type.
GenericMapping : [var] A pointer to a GENERIC_MAPPING structure that specifies the mapping from each generic right to specific rights for the object.
%inst
Allocates and initializes a self-relative security descriptor for a
new private object created by the resource manager calling this
function. (CreatePrivateObjectSecurityWithMultipleInheritance)

[戻り値]
If the function succeeds, the function returns a nonzero value. If
the function fails, it returns zero. Call GetLastError for extended
error information. Some extended error codes and their meanings are
listed in the following table.
This doc was truncated.

[備考]
The CreatePrivateObjectSecurityEx function is identical to calling
the CreatePrivateObjectSecurityWithMultipleInheritance function with
a single GUID in ObjectTypes. The AutoInheritFlags are distinct from
the similarly named bits in the Control member of the
SECURITY_DESCRIPTOR structure. For an explanation of the control
bits, see SECURITY_DESCRIPTOR_CONTROL. If AutoInheritFlags specifies
the SEF_DACL_AUTO_INHERIT bit, the function applies the following
rules to the DACL in the new security descriptor:
This doc was truncated.


%index
CreateProcessWithLogonW
Creates a new process and its primary thread. Then the new process runs the specified executable file in the security context of the specified credentials (user, domain, and password). It can optionally load the user profile for a specified user.
%group
Win32 advapi32
%prm
lpUsername, lpDomain, lpPassword, dwLogonFlags, lpApplicationName, lpCommandLine, dwCreationFlags, lpEnvironment, lpCurrentDirectory, lpStartupInfo, lpProcessInformation
lpUsername : [wstr] The name of the user. This is the name of the user account to log on to. If you use the UPN format, user@DNS_domain_name, the lpDomain parameter must be NULL.
lpDomain : [wstr] The name of the domain or server whose account database contains the lpUsername account. If this parameter is NULL, the user name must be specified in UPN format.
lpPassword : [wstr] The clear-text password for the lpUsername account.
dwLogonFlags : [int] 
lpApplicationName : [wstr] The name of the module to be executed. This module can be a Windows-based application. It can be some other type of module (for example, MS-DOS or OS/2) if the appropriate subsystem is available on the local computer.
lpCommandLine : [wstr] The command line to be executed. The maximum length of this string is 1024 characters. If lpApplicationName is NULL, the module name portion of lpCommandLine is limited to MAX_PATH characters. The function can modify the contents of this string. Therefore, this parameter cannot be a pointer to read-only memory (such as a const variable or a literal string). If this parameter is a constant string, the function may cause an access violation. The lpCommandLine parameter can be NULL, and the function uses the string pointed to by lpApplicationName as the command line. If both lpApplicationName and lpCommandLine are non-NULL, *lpApplicationName specifies the module to execute, and *lpCommandLine specifies the command line. The new process can use GetCommandLine to retrieve the entire command line. Console processes written in C can use the argc and argv arguments to parse the command line. Because argv[0] is the module name, C programmers typically repeat the module name as the first token in the command line. If lpApplicationName is NULL, the first white space?delimited token of the command line specifies the module name. If you are using a long file name that contains a space, use quoted strings to indicate where the file name ends and the arguments begin (see the explanation for the lpApplicationName parameter). If the file name does not contain an extension, .exe is appended. Therefore, if the file name extension is .com, this parameter must include the .com extension. If the file name ends in a period  with no extension, or if the file name contains a path, .exe is not appended. If the file name does not contain a directory path, the system searches for the executable file in the following sequence:
dwCreationFlags : [int] The flags that control how the process is created. The CREATE_DEFAULT_ERROR_MODE, CREATE_NEW_CONSOLE, and CREATE_NEW_PROCESS_GROUP flags are enabled by default. For a list of values, see Process Creation Flags.
lpEnvironment : [intptr] A pointer to an environment block for the new process. If this parameter is NULL, the new process uses an environment created from the profile of the user specified by lpUsername.
lpCurrentDirectory : [wstr] The full path to the current directory for the process. The string can also specify a UNC path. If this parameter is NULL, the new process has the same current drive and directory as the calling process. This feature is provided primarily for shells that need to start an application, and specify its initial drive and working directory.
lpStartupInfo : [var] A pointer to a STARTUPINFO structure.
lpProcessInformation : [var] A pointer to a PROCESS_INFORMATION structure that receives identification information for the new process, including a handle to the process.
%inst
Creates a new process and its primary thread. Then the new process
runs the specified executable file in the security context of the
specified credentials (user, domain, and password). It can optionally
load the user profile for a specified user.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is 0 (zero). To get extended error
information, call GetLastError. Note that the function returns before
the process has finished initialization. If a required DLL cannot be
located or fails to initialize, the process is terminated. To get the
termination status of a process, call GetExitCodeProcess.

[備考]
By default, CreateProcessWithLogonW does not load the specified user
profile into the HKEY_USERS registry key. This means that access to
information in the HKEY_CURRENT_USER registry key may not produce
results that are consistent with a normal interactive logon. It is
your responsibility to load the user registry hive into HKEY_USERS
before calling CreateProcessWithLogonW, by using LOGON_WITH_PROFILE,
or by calling the LoadUserProfile function. If the lpEnvironment
parameter is NULL, the new process uses an environment block created
from the profile of the user specified by lpUserName. If the
HOMEDRIVE and HOMEPATH variables are not set, CreateProcessWithLogonW
modifies the environment block to use the drive and path of the
user's working directory. When created, the new process and thread
handles receive full access rights (PROCESS_ALL_ACCESS and
THREAD_ALL_ACCESS). For either handle, if a security descriptor is
not provided, the handle can be used in any function that requires an
object handle of that type. When a security descriptor is provided,
an access check is performed on all subsequent uses of the handle
before access is granted. If access is denied, the requesting process
cannot use the handle to gain access to the process or thread. To
retrieve a security token, pass the process handle in the
PROCESS_INFORMATION structure to the OpenProcessToken function. The
process is assigned a process identifier. The identifier is valid
until the process terminates. It can be used to identify the process,
or it can be specified in the OpenProcess function to open a handle
to the process. The initial thread in the process is also assigned a
thread identifier. It can be specified in the OpenThread function to
open a handle to the thread. The identifier is valid until the thread
terminates and can be used to uniquely identify the thread within the
system. These identifiers are returned in PROCESS_INFORMATION. The
calling thread can use the WaitForInputIdle function to wait until
the new process has completed its initialization and is waiting for
user input with no input pending. This can be useful for
synchronization between parent and child processes, because
CreateProcessWithLogonW returns without waiting for the new process
to finish its initialization. For example, the creating process would
use WaitForInputIdle before trying to find a window that is
associated with the new process. The preferred way to shut down a
process is by using the ExitProcess function, because this function
sends notification of approaching termination to all DLLs attached to
the process. Other means of shutting down a process do not notify the
attached DLLs. Note that when a thread calls ExitProcess, other
threads of the process are terminated without an opportunity to
execute any additional code (including the thread termination code of
attached DLLs). For more information, see Terminating a Process.
CreateProcessWithLogonW accesses the specified directory and
executable image in the security context of the target user. If the
executable image is on a network and a network drive letter is
specified in the path, the network drive letter is not available to
the target user, as network drive letters can be assigned for each
logon. If a network drive letter is specified, this function fails.
If the executable image is on a network, use the UNC path. There is a
limit to the number of child processes that can be created by this
function and run simultaneously. For example, on Windows XP, this
limit is MAXIMUM_WAIT_OBJECTS*4. However, you may not be able to
create this many processes due to system-wide quota limits. Windows
XP with SP2,Windows Server 2003, or later: You cannot call
CreateProcessWithLogonW from a process that is running under the
"LocalSystem" account, because the function uses the logon SID in the
caller token, and the token for the "LocalSystem" account does not
contain this SID. As an alternative, use the CreateProcessAsUser and
LogonUser functions. To compile an application that uses this
function, define _WIN32_WINNT as 0x0500 or later. For more
information, see Using the Windows Headers. Security Remarks The
lpApplicationName parameter can be NULL, and the executable name must
be the first white space?delimited string in lpCommandLine. If the
executable or path name has a space in it, there is a risk that a
different executable could be run because of the way the function
parses spaces. Avoid the following example, because the function
attempts to run "Program.exe", if it exists, instead of "MyApp.exe".
This doc was truncated.


%index
CreateProcessWithTokenW
Creates a new process and its primary thread. The new process runs in the security context of the specified token. It can optionally load the user profile for the specified user.
%group
Win32 advapi32
%prm
hToken, dwLogonFlags, lpApplicationName, lpCommandLine, dwCreationFlags, lpEnvironment, lpCurrentDirectory, lpStartupInfo, lpProcessInformation
hToken : [intptr] A handle to the primary token that represents a user. The handle must have the TOKEN_QUERY, TOKEN_DUPLICATE, and TOKEN_ASSIGN_PRIMARY access rights. For more information, see Access Rights for Access-Token Objects. The user represented by the token must have read and execute access to the application specified by the lpApplicationName or the lpCommandLine parameter.
dwLogonFlags : [int] 
lpApplicationName : [wstr] The name of the module to be executed. This module can be a Windows-based application. It can be some other type of module (for example, MS-DOS or OS/2) if the appropriate subsystem is available on the local computer.
lpCommandLine : [wstr] The command line to be executed.
dwCreationFlags : [int] The flags that control how the process is created. The CREATE_DEFAULT_ERROR_MODE, CREATE_NEW_CONSOLE, and CREATE_NEW_PROCESS_GROUP flags are enabled by default. For a list of values, see Process Creation Flags.
lpEnvironment : [intptr] A pointer to an environment block for the new process. If this parameter is NULL, the new process uses an environment created from the profile of the user specified by lpUsername.
lpCurrentDirectory : [wstr] The full path to the current directory for the process. The string can also specify a UNC path. If this parameter is NULL, the new process will have the same current drive and directory as the calling process. (This feature is provided primarily for shells that need to start an application and specify its initial drive and working directory.)
lpStartupInfo : [var] A pointer to a STARTUPINFO or STARTUPINFOEX structure.
lpProcessInformation : [var] A pointer to a PROCESS_INFORMATION structure that receives identification information for the new process, including a handle to the process.
%inst
Creates a new process and its primary thread. The new process runs in
the security context of the specified token. It can optionally load
the user profile for the specified user.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. Note that the function returns before
the process has finished initialization. If a required DLL cannot be
located or fails to initialize, the process is terminated. To get the
termination status of a process, call GetExitCodeProcess.

[備考]
By default, CreateProcessWithTokenW does not load the specified
user's profile into the HKEY_USERS registry key. This means that
access to information in the HKEY_CURRENT_USER registry key may not
produce results consistent with a normal interactive logon. It is
your responsibility to load the user's registry hive into HKEY_USERS
by either using LOGON_WITH_PROFILE, or by calling the LoadUserProfile
function before calling this function. If the lpEnvironment parameter
is NULL, the new process uses an environment block created from the
profile of the user specified by lpUserName. If the HOMEDRIVE and
HOMEPATH variables are not set, CreateProcessWithTokenW modifies the
environment block to use the drive and path of the user's working
directory. When created, the new process and thread handles receive
full access rights (PROCESS_ALL_ACCESS and THREAD_ALL_ACCESS). For
either handle, if a security descriptor is not provided, the handle
can be used in any function that requires an object handle of that
type. When a security descriptor is provided, an access check is
performed on all subsequent uses of the handle before access is
granted. If access is denied, the requesting process cannot use the
handle to gain access to the process or thread. To retrieve a
security token, pass the process handle in the PROCESS_INFORMATION
structure to the OpenProcessToken function. The process is assigned a
process identifier. The identifier is valid until the process
terminates. It can be used to identify the process, or specified in
the OpenProcess function to open a handle to the process. The initial
thread in the process is also assigned a thread identifier. It can be
specified in the OpenThread function to open a handle to the thread.
The identifier is valid until the thread terminates and can be used
to uniquely identify the thread within the system. These identifiers
are returned in PROCESS_INFORMATION. The calling thread can use the
WaitForInputIdle function to wait until the new process has finished
its initialization and is waiting for user input with no input
pending. This can be useful for synchronization between parent and
child processes, because CreateProcessWithTokenW returns without
waiting for the new process to finish its initialization. For
example, the creating process would use WaitForInputIdle before
trying to find a window associated with the new process. The
preferred way to shut down a process is by using the ExitProcess
function, because this function sends notification of approaching
termination to all DLLs attached to the process. Other means of
shutting down a process do not notify the attached DLLs. Note that
when a thread calls ExitProcess, other threads of the process are
terminated without an opportunity to execute any additional code
(including the thread termination code of attached DLLs). For more
information, see Terminating a Process. To compile an application
that uses this function, define _WIN32_WINNT as 0x0500 or later. For
more information, see Using the Windows Headers. Security Remarks The
lpApplicationName parameter can be NULL, in which case the executable
name must be the first white space?delimited string in lpCommandLine.
If the executable or path name has a space in it, there is a risk
that a different executable could be run because of the way the
function parses spaces. The following example is dangerous because
the function will attempt to run "Program.exe", if it exists, instead
of "MyApp.exe".
This doc was truncated.


%index
CreateRestrictedToken
Creates a new access token that is a restricted version of an existing access token. The restricted token can have disabled security identifiers (SIDs), deleted privileges, and a list of restricting SIDs.
%group
Win32 advapi32
%prm
ExistingTokenHandle, Flags, DisableSidCount, SidsToDisable, DeletePrivilegeCount, PrivilegesToDelete, RestrictedSidCount, SidsToRestrict, NewTokenHandle
ExistingTokenHandle : [intptr] A handle to a primary or impersonation token. The token can also be a restricted token. The handle must have TOKEN_DUPLICATE access to the token.
Flags : [int] 
DisableSidCount : [int] Specifies the number of entries in the SidsToDisable array.
SidsToDisable : [var] A pointer to an array of SID_AND_ATTRIBUTES structures that specify the deny-only SIDs in the restricted token. The system uses a deny-only SID to deny access to a securable object. The absence of a deny-only SID does not allow access.
DeletePrivilegeCount : [int] Specifies the number of entries in the PrivilegesToDelete array.
PrivilegesToDelete : [var] A pointer to an array of LUID_AND_ATTRIBUTES structures that specify the privileges to delete in the restricted token.
RestrictedSidCount : [int] Specifies the number of entries in the SidsToRestrict array.
SidsToRestrict : [var] A pointer to an array of SID_AND_ATTRIBUTES structures that specify a list of restricting SIDs for the new token. If the existing token is a restricted token, the list of restricting SIDs for the new token is the intersection of this array and the list of restricting SIDs for the existing token. No check is performed to remove duplicate SIDs that were placed on the SidsToRestrict parameter. Duplicate SIDs allow a restricted token to have redundant information in the restricting SID list.
NewTokenHandle : [intptr] A pointer to a variable that receives a handle to the new restricted token. This handle has the same access rights as ExistingTokenHandle. The new token is the same type, primary or impersonation, as the existing token. The handle returned in NewTokenHandle can be duplicated.
%inst
Creates a new access token that is a restricted version of an
existing access token. The restricted token can have disabled
security identifiers (SIDs), deleted privileges, and a list of
restricting SIDs.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The CreateRestrictedToken function can restrict the token in the
following ways:
This doc was truncated.


%index
CreateServiceW
Creates a service object and adds it to the specified service control manager database. (Unicode)
%group
Win32 advapi32
%prm
hSCManager, lpServiceName, lpDisplayName, dwDesiredAccess, dwServiceType, dwStartType, dwErrorControl, lpBinaryPathName, lpLoadOrderGroup, lpdwTagId, lpDependencies, lpServiceStartName, lpPassword
hSCManager : [intptr] A handle to the service control manager database. This handle is returned by the OpenSCManager function and must have the SC_MANAGER_CREATE_SERVICE access right. For more information, see Service Security and Access Rights.
lpServiceName : [wstr] The name of the service to install. The maximum string length is 256 characters. The service control manager database preserves the case of the characters, but service name comparisons are always case insensitive. Forward-slash (/) and backslash (\\) are not valid service name characters.
lpDisplayName : [wstr] The display name to be used by user interface programs to identify the service. This string has a maximum length of 256 characters. The name is case-preserved in the service control manager. Display name comparisons are always case-insensitive.
dwDesiredAccess : [int] The access to the service. Before granting the requested access, the system checks the access token of the calling process. For a list of values, see Service Security and Access Rights.
dwServiceType : [int] 
dwStartType : [int] 
dwErrorControl : [int] 
lpBinaryPathName : [wstr] The fully qualified path to the service binary file. If the path contains a space, it must be quoted so that it is correctly interpreted. For example, "d:\\my share\\myservice.exe" should be specified as "\"d:\\my share\\myservice.exe\"".
lpLoadOrderGroup : [wstr] The names of the load ordering group of which this service is a member. Specify NULL or an empty string if the service does not belong to a group.
lpdwTagId : [var] A pointer to a variable that receives a tag value that is unique in the group specified in the lpLoadOrderGroup parameter. Specify NULL if you are not changing the existing tag.
lpDependencies : [wstr] A pointer to a double null-terminated array of null-separated names of services or load ordering groups that the system must start before this service. Specify NULL or an empty string if the service has no dependencies. Dependency on a group means that this service can run if at least one member of the group is running after an attempt to start all members of the group.
lpServiceStartName : [wstr] The name of the account under which the service should run. If the service type is SERVICE_WIN32_OWN_PROCESS, use an account name in the form DomainName\UserName. The service process will be logged on as this user. If the account belongs to the built-in domain, you can specify .\UserName.
lpPassword : [wstr] The password to the account name specified by the lpServiceStartName parameter. Specify an empty string if the account has no password or if the service runs in the LocalService, NetworkService, or LocalSystem account. For more information, see Service Record List.
%inst
Creates a service object and adds it to the specified service control
manager database. (Unicode)

[戻り値]
If the function succeeds, the return value is a handle to the
service. If the function fails, the return value is NULL. To get
extended error information, call GetLastError. The following error
codes can be set by the service control manager. Other error codes
can be set by the registry functions that are called by the service
control manager.
This doc was truncated.

[備考]
The CreateService function creates a service object and installs it
in the service control manager database by creating a key with the
same name as the service under the following registry
key:HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services
Information specified by CreateService, ChangeServiceConfig, and
ChangeServiceConfig2 is saved as values under this key. The following
are examples of values stored for a service.
This doc was truncated.


%index
CreateWellKnownSid
Creates a SID for predefined aliases.
%group
Win32 advapi32
%prm
WellKnownSidType, DomainSid, pSid, cbSid
WellKnownSidType : [int] Member of the WELL_KNOWN_SID_TYPE enumeration that specifies what the SID will identify.
DomainSid : [int] A pointer to a SID that identifies the domain to use when creating the SID. Pass NULL to use the local computer.
pSid : [int] A pointer to memory where CreateWellKnownSid will store the new SID.
cbSid : [var] A pointer to a DWORD that contains the number of bytes available at pSid. The CreateWellKnownSid function stores the number of bytes actually used at this location.
%inst
Creates a SID for predefined aliases.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. For extended error
information, call GetLastError.


%index
CredDeleteW
Deletes a credential from the user's credential set. (Unicode)
%group
Win32 advapi32
%prm
TargetName, Type, Flags
TargetName : [wstr] Pointer to a null-terminated string that contains the name of the credential to delete.
Type : [int] Type of the credential to delete. Must be one of the CRED_TYPE_* defined types. For a list of the defined types, see the Type member of the CREDENTIAL structure. If the value of this parameter is CRED_TYPE_DOMAIN_EXTENDED, this function can delete a credential that specifies a user name when there are multiple credentials for the same target. The value of the TargetName parameter must specify the user name as Target|UserName.
Flags : [int] Reserved and must be zero.
%inst
Deletes a credential from the user's credential set. (Unicode)

[戻り値]
The function returns TRUE on success and FALSE on failure. The
GetLastError function can be called to get a more specific status
code. The following status codes can be returned:
This doc was truncated.

[備考]
> [!NOTE] > The wincred.h header defines CredDelete as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CredEnumerateW
Enumerates the credentials from the user's credential set. (Unicode)
%group
Win32 advapi32
%prm
Filter, Flags, Count, Credential
Filter : [wstr] Pointer to a null-terminated string that contains the filter for the returned credentials. Only credentials with a TargetName matching the filter will be returned. The filter specifies a name prefix followed by an asterisk. For instance, the filter "FRED*" will return all credentials with a TargetName beginning with the string "FRED".
Flags : [int] 
Count : [var] Count of the credentials returned in the Credentials array.
Credential : [var] Pointer to an array of pointers to credentials. The returned credential is a single allocated block. Any pointers contained within the buffer are pointers to locations within this single allocated block. The single returned buffer must be freed by calling CredFree.
%inst
Enumerates the credentials from the user's credential set. (Unicode)

[戻り値]
The function returns TRUE on success and FALSE on failure. The
GetLastError function can be called to get a more specific status
code. The following status codes can be returned.
This doc was truncated.

[備考]
> [!NOTE] > The wincred.h header defines CredEnumerate as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CredFindBestCredentialW
Searches the Credentials Management (CredMan) database for the set of generic credentials that are associated with the current logon session and that best match the specified target resource. (Unicode)
%group
Win32 advapi32
%prm
TargetName, Type, Flags, Credential
TargetName : [wstr] A pointer to a null-terminated string that contains the name of the target resource for which to find credentials.
Type : [int] The type of credentials to search for. Currently, this function supports only CRED_TYPE_GENERIC.
Flags : [int] Reserved.
Credential : [var] The address of a pointer to a CREDENTIAL structure that specifies the set of credentials this function finds. When you have finished using this structure, free it by calling the CredFree function.
%inst
Searches the Credentials Management (CredMan) database for the set of
generic credentials that are associated with the current logon
session and that best match the specified target resource. (Unicode)

[戻り値]
If the function succeeds, it returns TRUE. If the function fails, it
returns FALSE. To get extended error information, call GetLastError.

[備考]
> [!NOTE] > The wincred.h header defines CredFindBestCredential as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CredFree
The CredFree function frees a buffer returned by any of the credentials management functions.
%group
Win32 advapi32
%prm
Buffer
Buffer : [intptr] Pointer to the buffer to be freed.
%inst
The CredFree function frees a buffer returned by any of the
credentials management functions.


%index
CredGetSessionTypes
The CredGetSessionTypes function returns the maximum persistence supported by the current logon session. A separate maximum persistence is returned for each credential type.
%group
Win32 advapi32
%prm
MaximumPersistCount, MaximumPersist
MaximumPersistCount : [int] Number of elements in the MaximumPersist array. Use CRED_TYPE_MAXIMUM to return all of the currently defined credential types.
MaximumPersist : [var] Pointer to an array to return the persistence values in. The passed in array should be MaximumPersistCount elements long. On return, each element specifies the maximum persistence supported by the corresponding credential type. The caller should use one of the following defines to index into the array:
%inst
The CredGetSessionTypes function returns the maximum persistence
supported by the current logon session. A separate maximum
persistence is returned for each credential type.

[戻り値]
This function returns TRUE on success and FALSE on failure. The
GetLastError function can be called to get a more specific status
code. The following status code can be returned:
ERROR_NO_SUCH_LOGON_SESSION The logon session does not exist or there
is no credential set associated with this logon session. Network
logon sessions do not have an associated credential set.


%index
CredGetTargetInfoW
The CredGetTargetInfo function retrieves all known target name information for the named target computer. (Unicode)
%group
Win32 advapi32
%prm
TargetName, Flags, TargetInfo
TargetName : [wstr] Pointer to a null-terminated string that contains the name of the target computer for which information is to be retrieved.
Flags : [int] Flags controlling the operation of the function. The following flag can be used:
TargetInfo : [var] Pointer to a single allocated block buffer to contain the target information. At least one of the returned members of TargetInfo will be non-NULL. Any pointers contained within the buffer are pointers to locations within this single allocated block. The single returned buffer must be freed by calling CredFree.
%inst
The CredGetTargetInfo function retrieves all known target name
information for the named target computer. (Unicode)

[戻り値]
The function returns TRUE on success and FALSE on failure. The
GetLastError function can be called to get a more specific status
code. The following status code can be returned:
This doc was truncated.

[備考]
> [!NOTE] > The wincred.h header defines CredGetTargetInfo as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CredIsMarshaledCredentialW
Determines whether a specified user name string is a marshaled credential previously marshaled by CredMarshalCredential. (Unicode)
%group
Win32 advapi32
%prm
MarshaledCredential
MarshaledCredential : [wstr] Pointer to a null-terminated string that contains the marshaled credential.
%inst
Determines whether a specified user name string is a marshaled
credential previously marshaled by CredMarshalCredential. (Unicode)

[戻り値]
This function returns TRUE if MarshaledCredential is a marshaled
credential and FALSE if it is not.

[備考]
> [!NOTE] > The wincred.h header defines CredIsMarshaledCredential as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CredIsProtectedW
Specifies whether the specified credentials are encrypted by a previous call to the CredProtect function. (Unicode)
%group
Win32 advapi32
%prm
pszProtectedCredentials, pProtectionType
pszProtectedCredentials : [wstr] A pointer to a null-terminated string that specifies the credentials to test.
pProtectionType : [var] A pointer to a value from the CRED_PROTECTION_TYPE enumeration that specifies whether the credentials specified in the pszProtectedCredentials parameter are protected.
%inst
Specifies whether the specified credentials are encrypted by a
previous call to the CredProtect function. (Unicode)

[戻り値]
TRUE if the function succeeds; otherwise, FALSE. For extended error
information, call the GetLastError function.

[備考]
> [!NOTE] > The wincred.h header defines CredIsProtected as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CredMarshalCredentialW
The CredMarshalCredential function transforms a credential into a text string. (Unicode)
%group
Win32 advapi32
%prm
CredType, Credential, MarshaledCredential
CredType : [int] Type of the credential to marshal.
Credential : [intptr] Credential to marshal.
MarshaledCredential : [var] Pointer to a null-terminated string that contains the marshaled credential. The caller should free the returned buffer using CredFree.
%inst
The CredMarshalCredential function transforms a credential into a
text string. (Unicode)

[戻り値]
This function returns TRUE on success and FALSE on failure. The
GetLastError function can be called to get a more specific status
code. The following status code can be returned:
ERROR_INVALID_PARAMETER CredType is not valid.

[備考]
> [!NOTE] > The wincred.h header defines CredMarshalCredential as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CredProtectW
Encrypts the specified credentials so that only the current security context can decrypt them. (Unicode)
%group
Win32 advapi32
%prm
fAsSelf, pszCredentials, cchCredentials, pszProtectedCredentials, pcchMaxChars, ProtectionType
fAsSelf : [int] Set to TRUE to specify that the credentials are encrypted in the security context of the current process. Set to FALSE to specify that credentials are encrypted in the security context of the calling thread security context.
pszCredentials : [wstr] A pointer to a string that specifies the credentials to encrypt. The function encrypts the number of characters provided in the cchCredentials parameter.
cchCredentials : [int] The size, in characters, of the pszCredentials buffer.
pszProtectedCredentials : [wstr] A pointer to a string that, on output, receives the encrypted credentials.
pcchMaxChars : [var] The size, in characters of the pszProtectedCredentials buffer. On output, if the pszProtectedCredentials is not of sufficient size to receive the encrypted credentials, this parameter specifies the required size, in characters, of the pszProtectedCredentials buffer.
ProtectionType : [var] A pointer to a CRED_PROTECTION_TYPE enumeration type that, on output, specifies the type of protection provided.
%inst
Encrypts the specified credentials so that only the current security
context can decrypt them. (Unicode)

[戻り値]
TRUE if the function succeeds; otherwise, FALSE. For extended error
information, call the GetLastError function.

[備考]
Note that the output of the CredProtect function is not integrity
protected, so if the output is modified, the CredUnprotect function
is not updated and may produce incorrect results.
> [!NOTE] > The wincred.h header defines CredProtect as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CredReadW
Reads a credential from the user's credential set. (Unicode)
%group
Win32 advapi32
%prm
TargetName, Type, Flags, Credential
TargetName : [wstr] Pointer to a null-terminated string that contains the name of the credential to read.
Type : [int] Type of the credential to read. Type must be one of the CRED_TYPE_* defined types.
Flags : [int] Currently reserved and must be zero.
Credential : [var] Pointer to a single allocated block buffer to return the credential. Any pointers contained within the buffer are pointers to locations within this single allocated block. The single returned buffer must be freed by calling CredFree.
%inst
Reads a credential from the user's credential set. (Unicode)

[戻り値]
The function returns TRUE on success and FALSE on failure. The
GetLastError function can be called to get a more specific status
code. The following status codes can be returned:
This doc was truncated.

[備考]
If the value of the Type member of the CREDENTIAL structure specified
by the Credential parameter is CRED_TYPE_DOMAIN_EXTENDED, a namespace
must be specified in the target name. This function can return only
one credential of the specified type.
> [!NOTE] > The wincred.h header defines CredRead as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CredReadDomainCredentialsW
Reads the domain credentials from the user's credential set. (Unicode)
%group
Win32 advapi32
%prm
TargetInfo, Flags, Count, Credential
TargetInfo : [var] Target information that identifies the target server. At least one of the naming members must not be NULL: NetbiosServerName, DnsServerName, NetbiosDomainName, DnsDomainName or DnsTreeName.
Flags : [int] Flags controlling the operation of the function.
Count : [var] Count of the credentials returned in the Credentials array.
Credential : [var] Pointer to an array of pointers to credentials. The most specific existing credential matching the TargetInfo is returned. If credentials of various types (for example, CRED_TYPE_DOMAIN_PASSWORD and CRED_TYPE_DOMAIN_CERTIFICATE credentials) exist, one of each type is returned. If a connection were to be made to the named target, this most-specific credential would be used.
%inst
Reads the domain credentials from the user's credential set.
(Unicode)

[戻り値]
The function returns TRUE on success and FALSE on failure. The
GetLastError function can be called to get a more specific status
code. The following status codes can be returned:
This doc was truncated.

[備考]
This function returns the most specific credentials matching the
naming parameters. For instance, if there is a credential that
matches the target server name and a credential that matches the
target domain name, only the server specific credential is returned.
This is the credential that would be used. The following list
specifies the order (from most specific to least specific) of what
credential is returned if more than one matches:
This doc was truncated.


%index
CredRenameW
CredRename is no longer supported. (Unicode)
%group
Win32 advapi32
%prm
OldTargetName, NewTargetName, Type, Flags
OldTargetName : [wstr] Pointer to a null-terminated string that contains the current name of the credential to be renamed.
NewTargetName : [wstr] Pointer to a null-terminated string that contains the new name for the credential.
Type : [int] Type of the credential to rename. Must be one of the CRED_TYPE_* defines.
Flags : [int] Flags to control the operation of the function. Currently reserved and must be zero.
%inst
CredRename is no longer supported. (Unicode)

[戻り値]
The function returns TRUE on success and FALSE on failure. The
GetLastError function can be called to get a more specific status
code. The following status codes can be returned:
This doc was truncated.

[備考]
> [!NOTE] > The wincred.h header defines CredRename as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CredUnmarshalCredentialW
The CredUnmarshalCredential function transforms a marshaled credential back into its original form. (Unicode)
%group
Win32 advapi32
%prm
MarshaledCredential, CredType, Credential
MarshaledCredential : [wstr] Pointer to a null-terminated string that contains the marshaled credential.
CredType : [var] Type of credential specified by MarshaledCredential.
Credential : [var] Pointer to the unmarshaled credential. If CredType returns CertCredential, the returned pointer is to a CERT_CREDENTIAL_INFO structure. If CredType returns UsernameTargetCredential, the returned pointer is to a USERNAME_TARGET_CREDENTIAL_INFO structure. The caller should free the returned buffer using CredFree.
%inst
The CredUnmarshalCredential function transforms a marshaled
credential back into its original form. (Unicode)

[戻り値]
This function returns TRUE on success and FALSE on failure. The
GetLastError function can be called to get a more specific status
code. The following status code can be returned:
ERROR_INVALID_PARAMETER MarshaledCredential is not valid.

[備考]
> [!NOTE] > The wincred.h header defines CredUnmarshalCredential as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CredUnprotectW
Decrypts credentials that were previously encrypted by using the CredProtect function. (Unicode)
%group
Win32 advapi32
%prm
fAsSelf, pszProtectedCredentials, cchProtectedCredentials, pszCredentials, pcchMaxChars
fAsSelf : [int] Set to TRUE to specify that the credentials were encrypted in the security context of the current process. Set to FALSE to specify that credentials were encrypted in the security context of the calling thread security context.
pszProtectedCredentials : [wstr] A pointer to a string that specifies the encrypted credentials.
cchProtectedCredentials : [int] The size, in characters, of the pszProtectedCredentials buffer.
pszCredentials : [wstr] A pointer to a string that, on output, receives the decrypted credentials.
pcchMaxChars : [var] The size, in characters of the pszCredentials buffer. On output, if the pszCredentials is not of sufficient size to receive the encrypted credentials, this parameter specifies the required size, in characters, of the pszCredentials buffer.
%inst
Decrypts credentials that were previously encrypted by using the
CredProtect function. (Unicode)

[戻り値]
TRUE if the function succeeds; otherwise, FALSE. For extended error
information, call the GetLastError function. The following table
shows common values for the GetLastError function.
This doc was truncated.

[備考]
> [!NOTE] > The wincred.h header defines CredUnprotect as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CredWriteW
Creates a new credential or modifies an existing credential in the user's credential set. (Unicode)
%group
Win32 advapi32
%prm
Credential, Flags
Credential : [var] A pointer to the CREDENTIAL structure to be written.
Flags : [int] Flags that control the function's operation. The following flag is defined.
%inst
Creates a new credential or modifies an existing credential in the
user's credential set. (Unicode)

[戻り値]
If the function succeeds, the function returns TRUE. If the function
fails, it returns FALSE. Call the GetLastError function to get a more
specific status code. The following status codes can be returned.
Other smart card errors can be returned when writing a
CRED_TYPE_CERTIFICATE credential.
This doc was truncated.

[備考]
This function creates a credential if a credential with the specified
TargetName and Type does not exist. If a credential with the
specified TargetName and Type exists, the new specified credential
replaces the existing one. When this function writes a
CRED_TYPE_CERTIFICATE credential, the Credential->CredentialBlob
member specifies the PIN protecting the private key of the
certificate specified by the Credential->UserName member. The
credential manager does not maintain the PIN. Rather, the PIN is
passed to the cryptographic service provider (CSP) indicated on the
certificate for later use by the CSP and the authentication packages.
The CSP defines the lifetime of the PIN. Most CSPs flush the PIN when
the smart card removal from the smart card reader. If the value of
the Type member of the CREDENTIAL structure specified by the
Credential parameter is CRED_TYPE_DOMAIN_EXTENDED, a namespace must
be specified in the target name. This function does not support
writing to target names that contain wildcards.
> [!NOTE] > The wincred.h header defines CredWrite as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CredWriteDomainCredentialsW
Writes domain credentials to the user's credential set. (Unicode)
%group
Win32 advapi32
%prm
TargetInfo, Credential, Flags
TargetInfo : [var] Identifies the target server. At least one of the naming members must be non-NULL and can be NetbiosServerName, DnsServerName, NetbiosDomainName, DnsDomainName, or DnsTreeName.
Credential : [var] Credential to be written.
Flags : [int] Flags to control the operation of the API. The following flag is defined.
%inst
Writes domain credentials to the user's credential set. (Unicode)

[戻り値]
If the function succeeds, the function returns TRUE. If the function
fails, it returns FALSE. Call the GetLastError function to get a more
specific status code. The following status codes can be returned.
Other smart card errors can be returned when writing a
CRED_TYPE_CERTIFICATE credential.
This doc was truncated.

[備考]
When this function writes a CRED_TYPE_CERTIFICATE credential, the
Credential->CredentialBlob member specifies the PIN that protects the
private key of the certificate specified by the Credential->UserName.
The credential manager does not maintain the PIN. Rather, the PIN is
passed to the CSP of the certificate for later use by the CSP and
authentication packages. The CSP defines the lifetime of the PIN. For
instance, most CSPs flush the PIN upon smart card removal.
CredWriteDomainCredentials differs from CredWrite in that it handles
the idiosyncrasies of domain (CRED_TYPE_DOMAIN_PASSWORD or
CRED_TYPE_DOMAIN_CERTIFICATE) credentials. Domain credentials contain
more than one target member. If the value of the Type member of the
CREDENTIAL structure specified by the Credential parameter is
CRED_TYPE_DOMAIN_EXTENDED, a namespace must be specified in the
target name.
> [!NOTE] > The wincred.h header defines CredWriteDomainCredentials
as an alias which automatically selects the ANSI or Unicode version
of this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CryptAcquireContextW
Used to acquire a handle to a particular key container within a particular cryptographic service provider (CSP). This returned handle is used in calls to CryptoAPI functions that use the selected CSP. (Unicode)
%group
Win32 advapi32
%prm
phProv, szContainer, szProvider, dwProvType, dwFlags
phProv : [var] A pointer to a handle of a CSP. When you have finished using the CSP, release the handle by calling the CryptReleaseContext function.
szContainer : [wstr] The key container name. This is a null-terminated string that identifies the key container to the CSP. This name is independent of the method used to store the keys. Some CSPs store their key containers internally (in hardware), some use the system registry, and others use the file system. In most cases, when dwFlags is set to CRYPT_VERIFYCONTEXT, pszContainer must be set to NULL. However, for hardware-based CSPs, such as a smart card CSP, can be access publicly available information in the specfied container. For more information about the usage of the pszContainer parameter, see Remarks.
szProvider : [wstr] A null-terminated string that contains the name of the CSP to be used.
dwProvType : [int] Specifies the type of provider to acquire. Defined provider types are discussed in Cryptographic Provider Types.
dwFlags : [int] One or more of the following flags. Note, most applications should set the **CRYPT_VERIFYCONTEXT** flag unless they need to create digital signatures or decrypt messages.
%inst
Used to acquire a handle to a particular key container within a
particular cryptographic service provider (CSP). This returned handle
is used in calls to CryptoAPI functions that use the selected CSP.
(Unicode)

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError. The error codes prefaced by NTE are
generated by the particular CSP being used. Some possible error codes
defined in Winerror.h follow.
This doc was truncated.

[備考]
The pszContainer parameter specifies the name of the container that
is used to hold the key. Each container can contain one key. If you
specify the name of an existing container when creating keys, the new
key will overwrite a previous one. The combination of the CSP name
and the key container name uniquely identifies a single key on the
system. If one application tries to modify a key container while
another application is using it, unpredictable behavior may result.
If you set the pszContainer parameter to NULL, the default key
container name is used. When the Microsoft software CSPs are called
in this manner, a new container is created each time the
CryptAcquireContext function is called. However, different CSPs may
behave differently in this regard. In particular, a CSP may have a
single default container that is shared by all applications accessing
the CSP. Therefore, applications must not use the default key
container to store private keys. Instead, either prevent key storage
by passing the CRYPT_VERIFYCONTEXT flag in the dwFlags parameter, or
use an application-specific container that is unlikely to be used by
another application. An application can obtain the name of the key
container in use by using the CryptGetProvParam function to read the
PP_CONTAINER value. For performance reasons, we recommend that you
set the pszContainer parameter to NULL and the dwFlags parameter to
CRYPT_VERIFYCONTEXT in all situations where you do not require a
persisted key. In particular, consider setting the pszContainer
parameter to NULL and the dwFlags parameter to CRYPT_VERIFYCONTEXT
for the following scenarios:
This doc was truncated.


%index
CryptContextAddRef
Adds one to the reference count of an HCRYPTPROV cryptographic service provider (CSP) handle.
%group
Win32 advapi32
%prm
hProv, pdwReserved, dwFlags
hProv : [int] HCRYPTPROV handle for which the reference count is being incremented. This handle must have already been created using CryptAcquireContext.
pdwReserved : [var] Reserved for future use and must be NULL.
dwFlags : [int] Reserved for future use and must be zero.
%inst
Adds one to the reference count of an HCRYPTPROV cryptographic
service provider (CSP) handle.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. One possible error code is the
following.
This doc was truncated.

[備考]
This function increases the reference count on a HCRYPTPROV handle so
that multiple calls to CryptReleaseContext are required to actually
release the handle.


%index
CryptCreateHash
Initiates the hashing of a stream of data. It creates and returns to the calling application a handle to a cryptographic service provider (CSP) hash object.
%group
Win32 advapi32
%prm
hProv, Algid, hKey, dwFlags, phHash
hProv : [int] A handle to a CSP created by a call to CryptAcquireContext.
Algid : [int] An ALG_ID value that identifies  the hash algorithm to use. Valid values for this parameter vary, depending on the CSP that is used. For a list of default algorithms, see  Remarks.
hKey : [int] If the type of hash algorithm is a keyed hash, such as the Hash-Based Message Authentication Code (HMAC) or Message Authentication Code (MAC) algorithm, the key for the hash is passed in this parameter. For nonkeyed algorithms, this parameter must be set to zero. For keyed algorithms, the key must be to a block cipher key, such as RC2, that has a cipher mode of Cipher Block Chaining (CBC).
dwFlags : [int] The following flag value is defined.
phHash : [var] The address to which the function copies a handle to the new hash object. When you have finished using the hash object, release the handle by calling the CryptDestroyHash function.
%inst
Initiates the hashing of a stream of data. It creates and returns to
the calling application a handle to a cryptographic service provider
(CSP) hash object.

[戻り値]
If the function succeeds, the function returns TRUE. If the function
fails, it returns FALSE. For extended error information, call
GetLastError. The error codes prefaced by NTE are generated by the
particular CSP you are using. The following table shows some of the
possible error codes.
This doc was truncated.

[備考]
For a list of Microsoft service providers and the algorithms they
implement, see Microsoft Cryptographic Service Providers. The
computation of the actual hash is done with the CryptHashData and
CryptHashSessionKey functions. These require a handle to the hash
object. After all the data has been added to the hash object, any of
the following operations can be performed:
This doc was truncated.


%index
CryptDecrypt
Decrypts data previously encrypted by using the CryptEncrypt function.
%group
Win32 advapi32
%prm
hKey, hHash, Final, dwFlags, pbData, pdwDataLen
hKey : [int] A handle to the key to use for the decryption. An application obtains this handle by using either the CryptGenKey or CryptImportKey function.
hHash : [int] A handle to a hash object. If data is to be decrypted and hashed simultaneously, a handle to a hash object is passed in this parameter. The hash value is updated with the decrypted plaintext. This option is useful when simultaneously decrypting and verifying a signature.
Final : [int] A Boolean value that specifies whether this is the last section in a series being decrypted. This value is TRUE if this is the last or only block. If this is not the last block, this value is FALSE. For more information, see  Remarks.
dwFlags : [int] The following flag values are defined.
pbData : [var] A pointer to a buffer that contains the data to be decrypted. After the decryption has been performed, the plaintext is placed back into this same buffer.
pdwDataLen : [var] A pointer to a DWORD value that indicates the length of the pbData buffer. Before calling this function, the calling application sets the DWORD value to the number of bytes to be decrypted. Upon return, the DWORD value contains the number of bytes of the decrypted plaintext.
%inst
Decrypts data previously encrypted by using the CryptEncrypt
function.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE).
If the function fails, it returns zero (FALSE). For extended error
information, call GetLastError. The error codes prefaced by NTE are
generated by the particular CSP being used. Some possible error codes
follow.
This doc was truncated.

[備考]
If a large amount of data is to be decrypted, it can be done in
sections by calling CryptDecrypt repeatedly. The Final parameter must
be set to TRUE only on the last call to CryptDecrypt, so that the
decryption engine can properly finish the decryption process. The
following extra actions are performed when Final is TRUE:
This doc was truncated.


%index
CryptDeriveKey
Generates cryptographic session keys derived from a base data value.
%group
Win32 advapi32
%prm
hProv, Algid, hBaseData, dwFlags, phKey
hProv : [int] A HCRYPTPROV handle of a CSP created by a call to CryptAcquireContext.
Algid : [int] An ALG_ID structure that identifies the symmetric encryption algorithm for which the key is to be generated. The algorithms available will most likely be different for each CSP. For more information about which algorithm identifier is used by the different providers for the key specs AT_KEYEXCHANGE and AT_SIGNATURE, see ALG_ID. For more information about ALG_ID values to use with the Microsoft Base Cryptographic Provider, see Base Provider Algorithms. For more information about ALG_ID values to use with the Microsoft Strong Cryptographic Provider or the Microsoft Enhanced Cryptographic Provider, see Enhanced Provider Algorithms.
hBaseData : [int] A handle to a hash object that has been fed the exact base data. To obtain this handle, an application must first create a hash object with CryptCreateHash and then add the base data to the hash object with CryptHashData. This process is described in detail in Hashes and Digital Signatures.
dwFlags : [int] Specifies the type of key generated. The sizes of a session key can be set when the key is generated. The key size, representing the length of the key modulus in bits, is set with the upper 16 bits of this parameter. Thus, if a 128-bit RC4 session key is to be generated, the value 0x00800000 is combined with any other dwFlags predefined value with a bitwise-OR operation. Due to changing export control restrictions, the default CSP and default key length may change between operating system releases. It is important that both the encryption and decryption use the same CSP and that the key length be explicitly set using the dwFlags parameter to ensure interoperability on different operating system platforms. The lower 16 bits of this parameter can be zero or you can specify one or more of the following flags by using the bitwise-OR operator to combine them.
phKey : [var] A pointer to  a HCRYPTKEY variable to receive the address of the handle of the newly generated key. When you have finished using the key, release the handle by calling the CryptDestroyKey function.
%inst
Generates cryptographic session keys derived from a base data value.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError. The error codes prefaced by "NTE" are
generated by the particular CSP being used. Some possible error codes
are listed in the following table.
This doc was truncated.

[備考]
When keys are generated for symmetric block ciphers, the key by
default is set up in cipher block chaining (CBC) mode with an
initialization vector of zero. This cipher mode provides a good
default method for bulk-encrypting data. To change these parameters,
use the CryptSetKeyParam function. The CryptDeriveKey function
completes the hash. After CryptDeriveKey has been called, no more
data can be added to the hash. Additional calls to CryptHashData or
CryptHashSessionKey fail. After the application is done with the
hash, CryptDestroyHash must be called to destroy the hash object. To
choose an appropriate key length, the following methods are
recommended.
This doc was truncated.


%index
CryptDestroyHash
Destroys the hash object referenced by the hHash parameter.
%group
Win32 advapi32
%prm
hHash
hHash : [int] The handle of the hash object to be destroyed.
%inst
Destroys the hash object referenced by the hHash parameter.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. For extended error
information, call GetLastError. The error codes prefaced by "NTE" are
generated by the particular cryptographic service provider (CSP) you
are using. Some possible error codes follow.
This doc was truncated.

[備考]
When a hash object is destroyed, many CSPs overwrite the memory in
the CSP where the hash object was held. The CSP memory is then freed.
There should be a one-to-one correspondence between calls to
CryptCreateHash and CryptDestroyHash. All hash objects that have been
created by using a specific CSP must be destroyed before that CSP
handle is released with the CryptReleaseContext function.


%index
CryptDestroyKey
Releases the handle referenced by the hKey parameter.
%group
Win32 advapi32
%prm
hKey
hKey : [int] The handle of the key to be destroyed.
%inst
Releases the handle referenced by the hKey parameter.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. For extended error
information, call GetLastError. The error codes prefaced by "NTE" are
generated by the particular CSP being used. Some possible error codes
are listed in the following table.
This doc was truncated.

[備考]
Keys take up both operating system's memory space and the CSP's
memory space. Some CSPs are implemented in hardware with limited
memory resources. Applications must destroy all keys with the
CryptDestroyKey function when they are finished with them. All key
handles that have been created or imported by using a specific CSP
must be destroyed before that CSP handle is released with the
CryptReleaseContext function.


%index
CryptDuplicateHash
Makes an exact copy of a hash to the point when the duplication is done.
%group
Win32 advapi32
%prm
hHash, pdwReserved, dwFlags, phHash
hHash : [int] Handle of the hash to be duplicated.
pdwReserved : [var] Reserved for future use and must be zero.
dwFlags : [int] Reserved for future use and must be zero.
phHash : [var] Address of the handle of the duplicated hash. When you have finished using the hash, release the handle by calling the CryptDestroyHash function.
%inst
Makes an exact copy of a hash to the point when the duplication is
done.

[戻り値]
If the function succeeds, the function returns TRUE. If the function
fails, it returns FALSE. For extended error information, call
GetLastError. The error code prefaced by "NTE" is generated by the
particular cryptographic service provider (CSP) that you are using.
Some possible error codes follow.
This doc was truncated.

[備考]
CryptDuplicateHash makes a copy of a hash and the exact state of the
hash. This function might be used if a calling application needed to
generate two hashes but both hashes had to start with some common
data hashed. For example, a hash might be created, the common data
hashed, a duplicate made with the CryptDuplicateHash function, and
then the data unique to each hash would be added. The
CryptDestroyHash function must be called to destroy any hashes that
are created with CryptDuplicateHash. Destroying the original hash
does not cause the duplicate hash to be destroyed. After a duplicate
hash is made, it is separate from the original hash. There is no
shared state between the two hashes.


%index
CryptDuplicateKey
Makes an exact copy of a key and the state of the key.
%group
Win32 advapi32
%prm
hKey, pdwReserved, dwFlags, phKey
hKey : [int] A handle to the key to be duplicated.
pdwReserved : [var] Reserved for future use and must be NULL.
dwFlags : [int] Reserved for future use and must be zero.
phKey : [var] Address of the handle to the duplicated key. When you have finished using the key, release the handle by calling the CryptDestroyKey function.
%inst
Makes an exact copy of a key and the state of the key.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. The error code prefaced by "NTE" is
generated by the particular CSP being used. Some possible error codes
are listed in the following table.
This doc was truncated.

[備考]
CryptDuplicateKey makes a copy of a key and the exact state of the
key. One scenario when this function can be used is when an
application needs to encrypt two separate messages with the same key
but with different salt values. The original key is generated and
then a duplicate key is made by using the CryptDuplicateKey function.
The different salt values are then set on the original and duplicate
keys with separate calls to the CryptSetKeyParam function.
CryptDestroyKey must be called to destroy any keys that are created
by using CryptDuplicateKey. Destroying the original key does not
cause the duplicate key to be destroyed. After a duplicate key is
made, it is separate from the original key. There is no shared state
between the two keys.


%index
CryptEncrypt
Encrypts data. The algorithm used to encrypt the data is designated by the key held by the CSP module and is referenced by the hKey parameter.
%group
Win32 advapi32
%prm
hKey, hHash, Final, dwFlags, pbData, pdwDataLen, dwBufLen
hKey : [int] A handle to the encryption key. An application obtains this handle by using either the CryptGenKey or the CryptImportKey function. The key specifies the encryption algorithm used.
hHash : [int] A handle to a hash object. If data is to be hashed and encrypted simultaneously, a handle to a hash object can be passed in the hHash parameter. The hash value is updated with the plaintext passed in. This option is useful when generating signed and encrypted text. Before calling CryptEncrypt, the application must obtain a handle to the hash object by calling the CryptCreateHash function. After the encryption is complete, the hash value can be obtained by using the CryptGetHashParam function, or the hash can be signed by using the CryptSignHash function. If no hash is to be done, this parameter must be NULL.
Final : [int] A Boolean value that specifies whether this is the last section in a series being encrypted. Final is set to TRUE for the last or only block and to FALSE if there are more blocks to be encrypted. For more information, see  Remarks.
dwFlags : [int] The following dwFlags value is defined but reserved for future use.
pbData : [var] A pointer to a buffer that contains the plaintext to be encrypted.  The plaintext in this buffer is overwritten with the ciphertext created by this function. The pdwDataLen parameter points to a variable that contains the length, in bytes, of the plaintext. The dwBufLen parameter contains the total size, in bytes, of this buffer. If this parameter contains NULL, this function will calculate the required size for the ciphertext and place that in the value pointed to by the pdwDataLen parameter.
pdwDataLen : [var] A pointer to a DWORD value that , on entry, contains the length, in bytes, of the plaintext in the pbData buffer. On exit, this DWORD contains the length, in bytes, of the ciphertext written to the pbData buffer. If the buffer allocated for pbData is not large enough to hold the encrypted data, GetLastError returns ERROR_MORE_DATA and stores the required buffer size, in bytes, in the DWORD value pointed to by pdwDataLen. If pbData is NULL, no error is returned, and the function stores the size of the encrypted data, in bytes, in the DWORD value pointed to by pdwDataLen. This allows an application to determine the correct buffer size. When a block cipher is used, this data length must be a multiple of the block size unless this is the final section of data to be encrypted and the Final parameter is TRUE.
dwBufLen : [int] Specifies the total size, in bytes, of the input pbData buffer. Note that, depending on the algorithm used, the encrypted text can be larger than the original plaintext. In this case, the pbData buffer needs to be large enough to contain the encrypted text and any padding. As a rule, if a stream cipher is used, the ciphertext is the same size as the plaintext. If a block cipher is used, the ciphertext is up to a block length larger than the plaintext.
%inst
Encrypts data. The algorithm used to encrypt the data is designated
by the key held by the CSP module and is referenced by the hKey
parameter.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE).
If the function fails, it returns zero (FALSE). For extended error
information, call GetLastError. The error codes prefaced by NTE are
generated by the particular CSP being used. Some possible error codes
follow.
This doc was truncated.

[備考]
If a large amount of data is to be encrypted, it can be done in
sections by calling CryptEncrypt repeatedly. The Final parameter must
be set to TRUE on the last call to CryptEncrypt, so that the
encryption engine can properly finish the encryption process. The
following extra actions are performed when Final is TRUE:
This doc was truncated.


%index
CryptEnumProviderTypesW
Retrieves the first or next types of cryptographic service provider (CSP) supported on the computer. (Unicode)
%group
Win32 advapi32
%prm
dwIndex, pdwReserved, dwFlags, pdwProvType, szTypeName, pcbTypeName
dwIndex : [int] Index of the next provider type to be enumerated.
pdwReserved : [var] Reserved for future use and must be NULL.
dwFlags : [int] Reserved for future use and must be zero.
pdwProvType : [var] Address of the DWORD value designating the enumerated provider type.
szTypeName : [wstr] A pointer to a buffer that receives the data from the enumerated provider type. This is a string including the terminating NULL character. Some provider types do not have display names, and in this case no name is returned and the returned value pointed to by pcbTypeName is zero.
pcbTypeName : [var] A pointer to a DWORD value specifying the size, in bytes, of the buffer pointed to by the pszTypeName parameter. When the function returns, the DWORD value contains the number of bytes stored or to be stored in the buffer. Some provider types do not have display names, and in this case no name is returned and the returned value pointed to by pcbTypeName is zero.
%inst
Retrieves the first or next types of cryptographic service provider
(CSP) supported on the computer. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. The error codes prefaced by NTE are
generated by the particular CSP being used. Some possible error codes
follow.
This doc was truncated.

[備考]
This function enumerates the provider types available on a computer.
Providers for any specific provider type can be enumerated using
CryptEnumProviders.


%index
CryptEnumProvidersW
Important??This API is deprecated. (CryptEnumProvidersW)
%group
Win32 advapi32
%prm
dwIndex, pdwReserved, dwFlags, pdwProvType, szProvName, pcbProvName
dwIndex : [int] Index of the next provider to be enumerated.
pdwReserved : [var] Reserved for future use and must be NULL.
dwFlags : [int] Reserved for future use and must be zero.
pdwProvType : [var] Address of the DWORD value designating the type of the enumerated provider.
szProvName : [wstr] A pointer to a buffer that receives the data from the enumerated provider. This is a string including the terminating null character. This parameter can be NULL to set the size of the name for memory allocation purposes. For more information, see Retrieving Data of Unknown Length.
pcbProvName : [var] A pointer to a DWORD value specifying the size, in bytes, of the buffer pointed to by the pszProvName parameter. When the function returns, the DWORD value contains the number of bytes stored in the buffer. Note??When processing the data returned in the buffer, applications must use the actual size of the data returned. The actual size can be slightly smaller than the size of the buffer specified on input. (On input, buffer sizes are usually specified large enough to ensure that the largest possible output data fits in the buffer.) On output, the variable pointed to by this parameter is updated to reflect the actual size of the data copied to the buffer.
%inst
Important This API is deprecated. (CryptEnumProvidersW)

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. The error codes prefaced by NTE are
generated by the particular CSP being used. Some possible error codes
follow.
This doc was truncated.

[備考]
This function enumerates the providers available on a computer. The
provider types can be enumerated by using CryptEnumProviderTypes.


%index
CryptExportKey
Exports a cryptographic key or a key pair from a cryptographic service provider (CSP) in a secure manner.
%group
Win32 advapi32
%prm
hKey, hExpKey, dwBlobType, dwFlags, pbData, pdwDataLen
hKey : [int] A handle to the key to be exported.
hExpKey : [int] A handle to a cryptographic key of the destination user. The key data within the exported key BLOB is encrypted using this key. This ensures that only the destination user is able to make use of the key BLOB.  Both hExpKey and hKey must come from the same CSP.
dwBlobType : [int] Specifies the type of key BLOB to be exported in pbData. This must be one of the following constants as discussed in Cryptographic Key Storage and Exchange.
dwFlags : [int] 
pbData : [var] A pointer to a buffer that receives the key BLOB data. The format of this BLOB varies depending on the BLOB type requested in the dwBlobType parameter. For the format for PRIVATEKEYBLOBs, PUBLICKEYBLOBs, and SIMPLEBLOBs, see Base Provider Key BLOBs. If this parameter is NULL, the required buffer size is placed in the value pointed to by the pdwDataLen parameter. For more information, see Retrieving Data of Unknown Length.
pdwDataLen : [var] A pointer to a DWORD value that, on entry, contains the size, in bytes, of the buffer pointed to by the pbData parameter. When the function returns, this value contains the number of bytes stored in the buffer. Note??When processing the data returned in the buffer, applications must use the actual size of the data returned. The actual size can be slightly smaller than the size of the buffer specified on input. On input, buffer sizes are usually specified large enough to ensure that the largest possible output data fits in the buffer. On output, the variable pointed to by this parameter is updated to reflect the actual size of the data copied to the buffer. ? To retrieve the required size of the pbData buffer, pass NULL for pbData. The required buffer size will be placed in the value pointed to by this parameter.
%inst
Exports a cryptographic key or a key pair from a cryptographic
service provider (CSP) in a secure manner.

[戻り値]
If the function succeeds, the function returns nonzero (TRUE). If the
function fails, it returns zero (FALSE). For extended error
information, call GetLastError. The error codes prefaced by "NTE" are
generated by the particular CSP being used. The following table shows
some of the possible error codes.
This doc was truncated.

[備考]
For any of the DES key permutations that use a PLAINTEXTKEYBLOB, only
the full key size, including parity bit, may be exported. The
following key sizes are supported.
This doc was truncated.


%index
CryptGenKey
Generates a random cryptographic session key or a public/private key pair. A handle to the key or key pair is returned in phKey. This handle can then be used as needed with any CryptoAPI function that requires a key handle.
%group
Win32 advapi32
%prm
hProv, Algid, dwFlags, phKey
hProv : [int] A handle to a cryptographic service provider (CSP) created by a call to CryptAcquireContext.
Algid : [int] An ALG_ID value that identifies the algorithm for which the key is to be generated. Values for this parameter vary depending on the CSP used. For ALG_ID values to use with the Microsoft Base Cryptographic Provider, see Base Provider Algorithms. For ALG_ID values to use with the Microsoft Strong Cryptographic Provider or the Microsoft Enhanced Cryptographic Provider, see Enhanced Provider Algorithms.
dwFlags : [int] Specifies the type of key generated. The sizes of a session key, RSA signature key, and RSA key exchange keys can be set when the key is generated. The key size, representing the length of the key modulus in bits, is set with the upper 16 bits of this parameter. Thus, if a 2,048-bit RSA signature key is to be generated, the value 0x08000000 is combined with any other dwFlags predefined value with a bitwise-OR operation. The upper 16 bits of 0x08000000 is 0x0800, or decimal 2,048. The RSA1024BIT_KEY value can be used to specify a 1024-bit RSA key. Due to changing export control restrictions, the default CSP and default key length may change between operating system versions. It is important that both the encryption and decryption use the same CSP and that the key length be explicitly set using the dwFlags parameter to ensure interoperability on different operating system platforms. In particular, the default RSA Full Cryptographic Service Provider is the Microsoft RSA Strong Cryptographic Provider. The default DSS Signature Diffie-Hellman Cryptographic Service Provider is the Microsoft Enhanced DSS Diffie-Hellman Cryptographic Provider. Each of these CSPs has a default 128-bit symmetric key length for RC2 and RC4 and a 1,024-bit default key length for public key algorithms. If the upper 16 bits is zero, the default key size is generated. If a key larger than the maximum or smaller than the minimum is specified, the call fails with the ERROR_INVALID_PARAMETER code. The following table lists minimum, default, and maximum signature and exchange key lengths beginning with Windows?XP.
phKey : [var] Address to which the function copies the handle of the newly generated key. When you have finished  using the key, delete  the handle to the key by calling the CryptDestroyKey function.
%inst
Generates a random cryptographic session key or a public/private key
pair. A handle to the key or key pair is returned in phKey. This
handle can then be used as needed with any CryptoAPI function that
requires a key handle.

[戻り値]
Returns nonzero if successful or zero otherwise. For extended error
information, call GetLastError. The error codes prefaced by "NTE" are
generated by the particular CSP being used. Some possible error codes
are listed in the following table.
This doc was truncated.

[備考]
If keys are generated for symmetric block ciphers, the key, by
default, is set up in cipher block chaining (CBC) mode with an
initialization vector of zero. This cipher mode provides a good
default method for bulk encrypting data. To change these parameters,
use the CryptSetKeyParam function. To choose an appropriate key
length, the following methods are recommended:
This doc was truncated.


%index
CryptGenRandom
Fills a buffer with cryptographically random bytes.
%group
Win32 advapi32
%prm
hProv, dwLen, pbBuffer
hProv : [int] Handle of a cryptographic service provider (CSP) created by a call to CryptAcquireContext.
dwLen : [int] Number of bytes of random data to be generated.
pbBuffer : [var] Buffer to receive the returned data. This buffer must be at least dwLen bytes in length.
%inst
Fills a buffer with cryptographically random bytes.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. The error codes prefaced by "NTE" are
generated by the particular CSP being used. Some possible error codes
are listed in the following table.
This doc was truncated.

[備考]
The data produced by this function is cryptographically random. It is
far more random than the data generated by the typical random number
generator such as the one shipped with your C compiler. This function
is often used to generate random initialization vectors and salt
values. Software random number generators work in fundamentally the
same way. They start with a random number, known as the seed, and
then use an algorithm to generate a pseudo-random sequence of bits
based on it. The most difficult part of this process is to get a seed
that is truly random. This is usually based on user input latency, or
the jitter from one or more hardware components. With Microsoft CSPs,
CryptGenRandom uses the same random number generator used by other
security components. This allows numerous processes to contribute to
a system-wide seed. CryptoAPI stores an intermediate random seed with
every user. To form the seed for the random number generator, a
calling application supplies bits it might have?for instance, mouse
or keyboard timing input?that are then combined with both the stored
seed and various system data and user data such as the process ID and
thread ID, the system clock, the system time, the system counter,
memory status, free disk clusters, the hashed user environment block.
This result is used to seed the pseudorandom number generator (PRNG).
In Windows Vista with Service Pack 1 (SP1) and later, an
implementation of the AES counter-mode based PRNG specified in NIST
Special Publication 800-90 is used. In Windows Vista, Windows Storage
Server 2003, and Windows XP, the PRNG specified in Federal
Information Processing Standard (FIPS) 186-2 is used. If an
application has access to a good random source, it can fill the
pbBuffer buffer with some random data before calling CryptGenRandom.
The CSP then uses this data to further randomize its internal seed.
It is acceptable to omit the step of initializing the pbBuffer buffer
before calling CryptGenRandom.


%index
CryptGetDefaultProviderW
Finds the default cryptographic service provider (CSP) of a specified provider type for the local computer or current user. (Unicode)
%group
Win32 advapi32
%prm
dwProvType, pdwReserved, dwFlags, pszProvName, pcbProvName
dwProvType : [int] The provider type for which the default CSP name is to be found. Defined provider types are  as follows:
pdwReserved : [var] This parameter is reserved for future use and must be NULL.
dwFlags : [int] The following flag values are defined.
pszProvName : [wstr] A pointer to a null-terminated character string buffer to receive the name of the default CSP. To find the size of the buffer for memory allocation purposes, this parameter can be NULL. For more information, see Retrieving Data of Unknown Length.
pcbProvName : [var] A pointer to a DWORD value that specifies the size, in bytes, of the buffer pointed to by the pszProvName parameter. When the function returns, the DWORD value contains the number of bytes stored or to be stored in the buffer. Note??When processing the data returned in the buffer, applications must use the actual size of the data returned. The actual size can be slightly smaller than the size of the buffer specified on input. (On input, buffer sizes are usually specified large enough to ensure that the largest possible output data fits in the buffer.) On output, the variable pointed to by this parameter is updated to reflect the actual size of the data copied to the buffer.
%inst
Finds the default cryptographic service provider (CSP) of a specified
provider type for the local computer or current user. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero (TRUE).
If the function fails, the return value is zero (FALSE). For extended
error information, call GetLastError. The error code prefaced by NTE
is generated by the particular CSP being used. Possible error codes
include the following.
This doc was truncated.

[備考]
This function determines which installed CSP is currently set as the
default for the local computer or current user. This information is
often displayed to the user.


%index
CryptGetHashParam
Retrieves data that governs the operations of a hash object.
%group
Win32 advapi32
%prm
hHash, dwParam, pbData, pdwDataLen, dwFlags
hHash : [int] Handle of the hash object to be queried.
dwParam : [int] Query type. This parameter can be set to one of the following queries.
pbData : [var] A pointer to a buffer that receives the specified value data. The form of this data varies, depending on the value number.
pdwDataLen : [var] A pointer to a DWORD value specifying the size, in bytes, of the pbData buffer. When the function returns, the DWORD value contains the number of bytes stored in the buffer.
dwFlags : [int] Reserved for future use and must be zero.
%inst
Retrieves data that governs the operations of a hash object.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. For extended error information,
call GetLastError. The error codes prefaced by "NTE" are generated by
the particular CSP you are using. Some possible error codes follow.
This doc was truncated.


%index
CryptGetKeyParam
Retrieves data that governs the operations of a key.
%group
Win32 advapi32
%prm
hKey, dwParam, pbData, pdwDataLen, dwFlags
hKey : [int] The handle of the key being queried.
dwParam : [int] Specifies the type of query being made.
pbData : [var] A pointer to a buffer that receives the data. The form of this data depends on the value of dwParam. If the size of  this buffer is not known, the required size can be retrieved at run time by passing NULL for this parameter and setting the value pointed to by pdwDataLen to zero. This function will place the required size of the buffer, in bytes, in the value pointed to by pdwDataLen. For more information, see Retrieving Data of Unknown Length.
pdwDataLen : [var] A pointer to a DWORD value that, on entry, contains the size, in bytes, of the buffer pointed to by the pbData parameter. When the function returns, the DWORD value contains the number of bytes stored in the buffer. Note??When processing the data returned in the buffer, applications must use the actual size of the data returned. The actual size may be slightly smaller than the size of the buffer specified on input. On input, buffer sizes are sometimes specified large enough to ensure that the largest possible output data fits in the buffer. On output, the variable pointed to by this parameter is updated to reflect the actual size of the data copied to the buffer.
dwFlags : [int] This parameter is reserved for future use and must be set to zero.
%inst
Retrieves data that governs the operations of a key.

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. For extended error information, call
GetLastError. The error codes prefaced by "NTE" are generated by the
particular CSP being used. Some possible error codes include the
following.
This doc was truncated.


%index
CryptGetProvParam
Retrieves parameters that govern the operations of a cryptographic service provider (CSP).
%group
Win32 advapi32
%prm
hProv, dwParam, pbData, pdwDataLen, dwFlags
hProv : [int] A handle of the CSP target of the query. This handle must have been created by using the CryptAcquireContext function.
dwParam : [int] The nature of the query. The following queries are defined.
pbData : [var] A pointer to a buffer to receive the data. The form of this data varies depending on the value of dwParam. When dwParam is set to PP_USE_HARDWARE_RNG, pbData must be set to NULL. This parameter can be NULL to set the size of this information for memory allocation purposes. For more information, see Retrieving Data of Unknown Length.
pdwDataLen : [var] A pointer to a DWORD value that specifies the size, in bytes, of the buffer pointed to by the pbData parameter. When the function returns, the DWORD value contains the number of bytes stored or to be stored in the buffer. Note??When processing the data returned in the buffer, applications must use the actual size of the data returned. The actual size can be slightly smaller than the size of the buffer specified on input. (On input, buffer sizes are usually specified large enough to ensure that the largest possible output data fits in the buffer.) On output, the variable pointed to by this parameter is updated to reflect the actual size of the data copied to the buffer. If PP_ENUMALGS, or PP_ENUMALGS_EX is set, the pdwDataLen parameter works somewhat differently. If pbData is NULL or the value pointed to by pdwDataLen is too small, the value returned in this parameter is the size of the largest item in the enumeration list instead of the size of the item currently being read. If PP_ENUMCONTAINERS is set, the first call to the function returns the size of the maximum key-container allowed by the current provider. This is in contrast to other possible behaviors, like returning the length of the longest existing container, or the length of the current container. Subsequent enumerating calls will not change the dwLen parameter. For each enumerated container, the caller can determine the length of the null-terminated string programmatically, if desired. If one of the enumeration values is read and the pbData parameter is NULL, the CRYPT_FIRST flag must be specified for the size information to be correctly retrieved.
dwFlags : [int] If dwParam is PP_KEYSET_SEC_DESCR, the security descriptor on the key container where the keys are stored is retrieved. For this case, dwFlags is used to pass in the SECURITY_INFORMATION bit flags that indicate the requested security information, as defined in the Platform SDK. SECURITY_INFORMATION bit flags can be combined with a bitwise-OR operation.
%inst
Retrieves parameters that govern the operations of a cryptographic
service provider (CSP).

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. The error codes prefaced by NTE are
generated by the particular CSP being used. Some possible error codes
follow.
This doc was truncated.

[備考]
This function must not be used on a thread of a multithreaded
program. The following values are returned in pbData if dwParam is
PP_IMPTYPE.
This doc was truncated.


%index
CryptGetUserKey
Retrieves a handle of one of a user's two public/private key pairs.
%group
Win32 advapi32
%prm
hProv, dwKeySpec, phUserKey
hProv : [int] HCRYPTPROV handle of a cryptographic service provider (CSP) created by a call to CryptAcquireContext.
dwKeySpec : [int] Identifies the private key to use from the key container. It can be AT_KEYEXCHANGE or AT_SIGNATURE.
phUserKey : [var] A pointer to the HCRYPTKEY handle of the retrieved keys. When you have finished using the key, delete the handle by calling the CryptDestroyKey function.
%inst
Retrieves a handle of one of a user's two public/private key pairs.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. The error codes prefaced by "NTE" are
generated by the particular CSP being used. Some possible error codes
follow.
This doc was truncated.


%index
CryptHashData
Adds data to a specified hash object.
%group
Win32 advapi32
%prm
hHash, pbData, dwDataLen, dwFlags
hHash : [int] Handle of the hash object.
pbData : [var] A pointer to a buffer that contains the data to be added to the hash object.
dwDataLen : [int] Number of bytes of data to be added. This must be zero if the CRYPT_USERDATA flag is set.
dwFlags : [int] The following flag values are defined.
%inst
Adds data to a specified hash object.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. For extended error information,
call GetLastError. The error codes prefaced by "NTE" are generated by
the particular CSP you are using. Some possible error codes follow.
This doc was truncated.


%index
CryptHashSessionKey
Computes the cryptographic hash of a session key object.
%group
Win32 advapi32
%prm
hHash, hKey, dwFlags
hHash : [int] A handle to the hash object.
hKey : [int] A handle to the key object to be hashed.
dwFlags : [int] The following flag value is defined.
%inst
Computes the cryptographic hash of a session key object.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. For extended error information,
call GetLastError. The error codes prefaced by "NTE" are generated by
the particular CSP you are using. Some possible error codes follow.
This doc was truncated.


%index
CryptImportKey
Transfers a cryptographic key from a key BLOB into a cryptographic service provider (CSP).
%group
Win32 advapi32
%prm
hProv, pbData, dwDataLen, hPubKey, dwFlags, phKey
hProv : [int] The handle of a CSP obtained with the CryptAcquireContext function.
pbData : [var] A BYTE array that contains a PUBLICKEYSTRUC BLOB header followed by the encrypted key. This key BLOB is created by the CryptExportKey function, either in this application or by another application possibly running on a different computer.
dwDataLen : [int] Contains the length, in bytes, of the key BLOB.
hPubKey : [int] A handle to the cryptographic key that decrypts the key stored in pbData.  This key must come from the same CSP to which hProv refers. The meaning of this parameter differs depending on the CSP type and the type of key BLOB being imported:
dwFlags : [int] Currently used only when a public/private key pair in the form of a PRIVATEKEYBLOB is imported into the CSP.
phKey : [var] A pointer to a HCRYPTKEY value that receives the handle of the imported key. When you have finished using the key, release the handle by calling the CryptDestroyKey function.
%inst
Transfers a cryptographic key from a key BLOB into a cryptographic
service provider (CSP).

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. For extended error information, call
GetLastError. Error codes prefaced by "NTE" are generated by the
particular CSP being used. Some possible error codes follow.
This doc was truncated.

[備考]
When importing a Hash-Based Message Authentication Code (HMAC) key,
the caller must identify the imported key as a PLAINTEXTKEYBLOB type
and set the appropriate algorithm identifier in the aiKeyAlg field of
the PUBLICKEYSTRUC BLOB header. The CryptImportKey function can be
used to import a plaintext key for symmetric algorithms; however, we
recommend that, for ease of use, you use the CryptGenKey function
instead. When you import a plaintext key, the structure of the key
BLOB that is passed in the pbData parameter is a PLAINTEXTKEYBLOB.
You can use the PLAINTEXTKEYBLOB type with any algorithm or type of
key combination supported by the CSP in use. For an example of
importing a plaintext key, see Example C Program: Importing a
Plaintext Key. The following example shows how you can set the header
fields.
This doc was truncated.


%index
CryptReleaseContext
Releases the handle of a cryptographic service provider (CSP) and a key container.
%group
Win32 advapi32
%prm
hProv, dwFlags
hProv : [int] Handle of a cryptographic service provider (CSP) created by a call to CryptAcquireContext.
dwFlags : [int] Reserved for future use and must be zero. If dwFlags is not set to zero, this function returns FALSE but the CSP is released.
%inst
Releases the handle of a cryptographic service provider (CSP) and a
key container.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. Some possible error codes are listed
in the following table.
This doc was truncated.

[備考]
After this function has been called, the CSP session is finished and
all existing session keys and hash objects created by using the hProv
handle are no longer valid. In practice, all of these objects should
be destroyed with calls to CryptDestroyKey and CryptDestroyHash
before CryptReleaseContext is called.


%index
CryptSetHashParam
Customizes the operations of a hash object, including setting up initial hash contents and selecting a specific hashing algorithm.
%group
Win32 advapi32
%prm
hHash, dwParam, pbData, dwFlags
hHash : [int] A handle to the hash object on which to set parameters.
dwParam : [int] 
pbData : [var] A value data buffer. Place the value data in this buffer before calling CryptSetHashParam. The form of this data varies, depending on the value number.
dwFlags : [int] This parameter is reserved for future use and must be set to zero.
%inst
Customizes the operations of a hash object, including setting up
initial hash contents and selecting a specific hashing algorithm.

[戻り値]
If the function succeeds, the function returns TRUE. If the function
fails, it returns FALSE. For extended error information, call
GetLastError. The error codes prefaced by "NTE" are generated by the
particular CSP you are using. Some possible error codes follow.
This doc was truncated.

[備考]
Occasionally, a hash value that has been generated elsewhere must be
signed. This can be done by using the following sequence of
operations:
This doc was truncated.


%index
CryptSetKeyParam
Customizes various aspects of a session key's operations.
%group
Win32 advapi32
%prm
hKey, dwParam, pbData, dwFlags
hKey : [int] A handle to the key for which values are to be set.
dwParam : [int] The following tables contain predefined values that can be used.
pbData : [var] A pointer to a buffer initialized with the value to be set before calling CryptSetKeyParam. The form of this data varies depending on the value of dwParam.
dwFlags : [int] Used only when dwParam is KP_ALGID. The dwFlags parameter is used to pass in flag values for the enabled key. The dwFlags parameter can hold values such as the key size and the other flag values allowed when generating the same type of key with CryptGenKey. For information about allowable flag values, see CryptGenKey.
%inst
Customizes various aspects of a session key's operations.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. The error codes prefaced by "NTE" are
generated by the particular CSP being used. Some possible error codes
follow.
This doc was truncated.

[備考]
If the KP_Q, KP_P, or KP_X parameters are set on a PREGEN
Diffie-Hellman or DSS key, the key lengths must be compatible with
the key length set using the upper 16 bits of the dwFlags parameter
when the key was created using CryptGenKey. If no key length was set
in CryptGenKey, the default key length was used. This will create an
error if a nondefault key length is used to set P, Q, or X.


%index
CryptSetProvParam
Customizes the operations of a cryptographic service provider (CSP). This function is commonly used to set a security descriptor on the key container associated with a CSP to control access to the private keys in that key container.
%group
Win32 advapi32
%prm
hProv, dwParam, pbData, dwFlags
hProv : [int] The handle of a CSP for which to set values. This handle must have already been created by using the CryptAcquireContext function.
dwParam : [int] 
pbData : [var] A pointer to a data buffer that contains the value to be set as a provider parameter. The form of this data varies depending on the dwParam value. If dwParam contains PP_USE_HARDWARE_RNG, this parameter must be NULL.
dwFlags : [int] If dwParam contains PP_KEYSET_SEC_DESCR, dwFlags contains the SECURITY_INFORMATION applicable bit flags, as defined in the Platform SDK. Key-container security is handled by using SetFileSecurity and GetFileSecurity. These bit flags can be combined by using a bitwise-OR operation. For more information, see CryptGetProvParam. If dwParam is PP_USE_HARDWARE_RNG or PP_DELETEKEY, dwFlags must be set to zero.
%inst
Customizes the operations of a cryptographic service provider (CSP).
This function is commonly used to set a security descriptor on the
key container associated with a CSP to control access to the private
keys in that key container.

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. The error codes prefaced by "NTE" are
generated by the particular CSP being used. Error codes include the
following.
This doc was truncated.


%index
CryptSetProviderW
Specifies the current user's default cryptographic service provider (CSP). (Unicode)
%group
Win32 advapi32
%prm
pszProvName, dwProvType
pszProvName : [wstr] Name of the new default CSP. The named CSP must be installed on the computer. For a list of available cryptographic providers, see Cryptographic Provider Names.
dwProvType : [int] Provider type of the CSP specified by pszProvName.
%inst
Specifies the current user's default cryptographic service provider
(CSP). (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. Some possible error codes are listed
in the following table.
This doc was truncated.

[備考]
Typical applications do not specify a CSP name when calling
CryptAcquireContext; however, an application does have the option of
selecting a specific CSP. This gives a user the freedom to select a
CSP with an appropriate level of security. Since calling
CryptSetProvider determines the CSP of a specified type used by all
applications that run from that point on, this function must not be
called without users' consent.
> [!NOTE] > The wincrypt.h header defines CryptSetProvider as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CryptSetProviderExW
Specifies the default cryptographic service provider (CSP) of a specified provider type for the local computer or current user. (Unicode)
%group
Win32 advapi32
%prm
pszProvName, dwProvType, pdwReserved, dwFlags
pszProvName : [wstr] The name of the new default CSP. This must be a CSP installed on the computer. For a list of available cryptographic providers, see Cryptographic Provider Names.
dwProvType : [int] The provider type of the CSP specified by pszProvName.
pdwReserved : [var] This parameter is reserved for future use and must be NULL.
dwFlags : [int] The following flag values are defined.
%inst
Specifies the default cryptographic service provider (CSP) of a
specified provider type for the local computer or current user.
(Unicode)

[戻り値]
If the function succeeds, the return value is nonzero (TRUE). If the
function fails, the return value is zero (FALSE). For extended error
information, call GetLastError. Possible error codes include those
shown in the following table.
This doc was truncated.

[備考]
Most applications do not specify a CSP name when calling the
CryptAcquireContext function; however, an application can specify a
CSP name and thereby select a CSP with an appropriate level of
security. Because calls to CryptSetProviderEx determine the CSP of a
specified type used by all applications from that point on,
CryptSetProviderEx must never be called without a user's consent.
> [!NOTE] > The wincrypt.h header defines CryptSetProviderEx as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CryptSignHashW
Signs data. (CryptSignHashW)
%group
Win32 advapi32
%prm
hHash, dwKeySpec, szDescription, dwFlags, pbSignature, pdwSigLen
hHash : [int] Handle of the hash object to be signed.
dwKeySpec : [int] Identifies the private key to use from the provider's container. It can be AT_KEYEXCHANGE or AT_SIGNATURE.
szDescription : [wstr] This parameter is no longer used and must be set to NULL to prevent security vulnerabilities. However, it is still supported for backward compatibility in the Microsoft Base Cryptographic Provider.
dwFlags : [int] The following flag values are defined.
pbSignature : [var] A pointer to a buffer receiving the signature data.
pdwSigLen : [var] A pointer to a DWORD value that specifies the size, in bytes, of the pbSignature buffer. When the function returns, the DWORD value contains the number of bytes stored in the buffer.
%inst
Signs data. (CryptSignHashW)

[戻り値]
If the function succeeds, the function returns TRUE. If the function
fails, it returns FALSE. For extended error information, call
GetLastError. The error codes prefaced by "NTE" are generated by the
particular CSP you are using. Some possible error codes follow.
This doc was truncated.

[備考]
Before calling this function, the CryptCreateHash function must be
called to get a handle to a hash object. The CryptHashData or
CryptHashSessionKey function is then used to add the data or session
keys to the hash object. The CryptSignHash function completes the
hash. While the DSS CSP supports hashing with both the MD5 and the
SHA hash algorithms, the DSS CSP only supports signing SHA hashes.
After this function is called, no more data can be added to the hash.
Additional calls to CryptHashData or CryptHashSessionKey fail. After
the application finishes using the hash, destroy the hash object by
calling the CryptDestroyHash function. By default, the Microsoft RSA
providers use the PKCS #1 padding method for the signature. The hash
OID in the DigestInfo element of the signature is automatically set
to the algorithm OID associated with the hash object. Using the
CRYPT_NOHASHOID flag will cause this OID to be omitted from the
signature. Occasionally, a hash value that has been generated
elsewhere must be signed. This can be done by using the following
sequence of operations:
This doc was truncated.


%index
CryptVerifySignatureW
Verifies the signature of a hash object. (Unicode)
%group
Win32 advapi32
%prm
hHash, pbSignature, dwSigLen, hPubKey, szDescription, dwFlags
hHash : [int] A handle to the hash object to verify.
pbSignature : [var] The address of the signature data to be verified.
dwSigLen : [int] The number of bytes in the pbSignature signature data.
hPubKey : [int] A handle to the public key to use to authenticate the signature. This public key must belong to the key pair that was originally used to create the digital signature.
szDescription : [wstr] This parameter should no longer be used and must be set to NULL to prevent security vulnerabilities. However, it is still supported for backward compatibility in the Microsoft Base Cryptographic Provider.
dwFlags : [int] The following flag values are defined.
%inst
Verifies the signature of a hash object. (Unicode)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. For extended error information,
call GetLastError. The error codes prefaced by "NTE" are generated by
the particular CSP you are using. Some possible error codes follow.
This doc was truncated.

[備考]
The CryptVerifySignature function completes the hash. After this
call, no more data can be added to the hash. Additional calls to
CryptHashData or CryptHashSessionKey fail. After the application is
done with the hash, CryptDestroyHash should be called to destroy the
hash object. If you generate a signature by using the .NET Framework
APIs and try to verify it by using the CryptVerifySignature function,
the function will fail and GetLastError will return
NTE_BAD_SIGNATURE. This is due to the different byte orders between
the native Win32 API and the .NET Framework API. The native
cryptography API uses little-endian byte order while the .NET
Framework API uses big-endian byte order. If you are verifying a
signature generated by using a .NET Framework API, you must swap the
order of signature bytes before calling the CryptVerifySignature
function to verify the signature.


%index
DecryptFileW
Decrypts an encrypted file or directory. (Unicode)
%group
Win32 advapi32
%prm
lpFileName, dwReserved
lpFileName : [wstr] The name of the file or directory to be decrypted. The caller must have the FILE_READ_DATA, FILE_WRITE_DATA, FILE_READ_ATTRIBUTES, FILE_WRITE_ATTRIBUTES, and SYNCHRONIZE access rights. For more information, see File Security and Access Rights.
dwReserved : [int] Reserved; must be zero.
%inst
Decrypts an encrypted file or directory. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The DecryptFile function requires exclusive access to the file being
decrypted, and will fail if another process is using the file. If the
file is not encrypted, DecryptFile simply returns a nonzero value,
which indicates success. If lpFileName specifies a read-only file,
the function fails and GetLastError returns ERROR_FILE_READ_ONLY. If
lpFileName specifies a directory that contains a read-only file, the
functions succeeds but the directory is not decrypted. In Windows 8,
Windows Server 2012, and later, this function is supported by the
following technologies.
This doc was truncated.


%index
DeleteAce
Deletes an access control entry (ACE) from an access control list (ACL).
%group
Win32 advapi32
%prm
pAcl, dwAceIndex
pAcl : [var] A pointer to an ACL. The ACE specified by the dwAceIndex parameter is removed from this ACL.
dwAceIndex : [int] The ACE to delete. A value of zero corresponds to the first ACE in the ACL, a value of one to the second ACE, and so on.
%inst
Deletes an access control entry (ACE) from an access control list
(ACL).

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
An application can use the ACL_SIZE_INFORMATION structure retrieved
by the GetAclInformation function to discover the size of the ACL and
the number of ACEs it contains. The GetAce function retrieves
information about an individual ACE.


%index
DeleteService
Marks the specified service for deletion from the service control manager database.
%group
Win32 advapi32
%prm
hService
hService : [intptr] A handle to the service. This handle is returned by the OpenService or CreateService function, and it must have the DELETE access right. For more information, see Service Security and Access Rights.
%inst
Marks the specified service for deletion from the service control
manager database.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The following error codes may be set
by the service control manager. Others may be set by the registry
functions that are called by the service control manager.
This doc was truncated.

[備考]
The DeleteService function marks a service for deletion from the
service control manager database. The database entry is not removed
until all open handles to the service have been closed by calls to
the CloseServiceHandle function, and the service is not running. A
running service is stopped by a call to the ControlService function
with the SERVICE_CONTROL_STOP control code. If the service cannot be
stopped, the database entry is removed when the system is restarted.
The service control manager deletes the service by deleting the
service key and its subkeys from the registry.


%index
DeregisterEventSource
Closes the specified event log. (DeregisterEventSource)
%group
Win32 advapi32
%prm
hEventLog
hEventLog : [intptr] A handle to the event log. The RegisterEventSource function returns this handle.
%inst
Closes the specified event log. (DeregisterEventSource)

[戻り値]
If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. To get extended
error information, call GetLastError.


%index
DestroyPrivateObjectSecurity
Deletes a private object's security descriptor.
%group
Win32 advapi32
%prm
ObjectDescriptor
ObjectDescriptor : [var] A pointer to a pointer to the SECURITY_DESCRIPTOR structure to be deleted. This security descriptor must have been created by a call to the CreatePrivateObjectSecurity function.
%inst
Deletes a private object's security descriptor.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
DuplicateEncryptionInfoFile
Copies the EFS metadata from one file or directory to another.
%group
Win32 advapi32
%prm
SrcFileName, DstFileName, dwCreationDistribution, dwAttributes, lpSecurityAttributes
SrcFileName : [wstr] The name of the file or directory from which the EFS metadata is to be copied. This source file or directory must be encrypted.
DstFileName : [wstr] The name of the file or directory to which the EFS metadata is to be copied.
dwCreationDistribution : [int] Describes how the destination file or directory identified by the DstFileName parameter value is to be opened. The following are the valid values of this parameter.
dwAttributes : [int] The file attributes of the destination file or directory. The FILE_READ_ONLY attribute is currently not processed by this function.
lpSecurityAttributes : [var] A pointer to a SECURITY_ATTRIBUTES structure that specifies the security attributes of the destination file or directory, if it does not already exist. If you specify NULL, the file or directory gets a default security descriptor. The ACLs in the default security descriptor for a file or directory are inherited from its parent directory.
%inst
Copies the EFS metadata from one file or directory to another.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a system error code. For a
complete list of error codes, see System Error Codes or the header
file WinError.h.

[備考]
Exclusive access to the destination file or directory is required by
EFS for the call to this function. If this access is not provided,
this function will fail. The caller should have the EFS key for the
source file or directory, and at least the READ_ATTRIBUTE ACL for the
source file or directory. The specified source and destination file
or directories should reside on the same computer; otherwise, an
error will be returned. In Windows 8 and Windows Server 2012, this
function is supported by the following technologies.
This doc was truncated.


%index
DuplicateToken
Creates a new access token that duplicates one already in existence.
%group
Win32 advapi32
%prm
ExistingTokenHandle, ImpersonationLevel, DuplicateTokenHandle
ExistingTokenHandle : [intptr] A handle to an access token opened with TOKEN_DUPLICATE access.
ImpersonationLevel : [int] Specifies a SECURITY_IMPERSONATION_LEVEL enumerated type that supplies the impersonation level of the new token.
DuplicateTokenHandle : [intptr] A pointer to a variable that receives a handle to the duplicate token. This handle has TOKEN_IMPERSONATE and TOKEN_QUERY access to the new token. When you have finished using the new token, call the CloseHandle function to close the token handle.
%inst
Creates a new access token that duplicates one already in existence.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The DuplicateToken function creates an impersonation token, which you
can use in functions such as SetThreadToken and
ImpersonateLoggedOnUser. The token created by DuplicateToken cannot
be used in the CreateProcessAsUser function, which requires a primary
token. To create a token that you can pass to CreateProcessAsUser,
use the DuplicateTokenEx function.


%index
DuplicateTokenEx
Creates a new access token that duplicates an existing token. This function can create either a primary token or an impersonation token.
%group
Win32 advapi32
%prm
hExistingToken, dwDesiredAccess, lpTokenAttributes, ImpersonationLevel, TokenType, phNewToken
hExistingToken : [intptr] A handle to an access token opened with TOKEN_DUPLICATE access.
dwDesiredAccess : [int] Specifies the requested access rights for the new token. The DuplicateTokenEx function compares the requested access rights with the existing token's discretionary access control list (DACL) to determine which rights are granted or denied. To request the same access rights as the existing token, specify zero. To request all access rights that are valid for the caller, specify MAXIMUM_ALLOWED.
lpTokenAttributes : [var] A pointer to a SECURITY_ATTRIBUTES structure that specifies a security descriptor for the new token and determines whether child processes can inherit the token. If lpTokenAttributes is NULL, the token gets a default security descriptor and the handle cannot be inherited. If the security descriptor contains a system access control list (SACL), the token gets ACCESS_SYSTEM_SECURITY access right, even if it was not requested in dwDesiredAccess. To set the owner in the security descriptor for the new token, the caller's process token must have the SE_RESTORE_NAME privilege set.
ImpersonationLevel : [int] Specifies a value from the SECURITY_IMPERSONATION_LEVEL enumeration that indicates the impersonation level of the new token.
TokenType : [int] 
phNewToken : [intptr] A pointer to a HANDLE variable that receives the new token. When you have finished using the new token, call the CloseHandle function to close the token handle.
%inst
Creates a new access token that duplicates an existing token. This
function can create either a primary token or an impersonation token.

[戻り値]
If the function succeeds, the function returns a nonzero value. If
the function fails, it returns zero. To get extended error
information, call GetLastError.

[備考]
The DuplicateTokenEx function allows you to create a primary token
that you can use in the CreateProcessAsUser function. This allows a
server application that is impersonating a client to create a process
that has the security context of the client. Note that the
DuplicateToken function can create only impersonation tokens, which
are not valid for CreateProcessAsUser. The following is a typical
scenario for using DuplicateTokenEx to create a primary token. A
server application creates a thread that calls one of the
impersonation functions, such as ImpersonateNamedPipeClient, to
impersonate a client. The impersonating thread then calls the
OpenThreadToken function to get its own token, which is an
impersonation token that has the security context of the client. The
thread specifies this impersonation token in a call to
DuplicateTokenEx, specifying the TokenPrimary flag. The
DuplicateTokenEx function creates a primary token that has the
security context of the client.


%index
EnableTrace
A trace session controller calls EnableTrace to configure how an ETW event provider logs events to a trace session. The EnableTraceEx2 function supersedes this function.
%group
Win32 advapi32
%prm
Enable, EnableFlag, EnableLevel, ControlGuid, TraceHandle
Enable : [int] Set to 1 to enable receiving events from the provider or to adjust the settings used when receiving events from the provider (e.g. to change level and keywords). Set to 0 to disable receiving events from the provider.
EnableFlag : [int] 32-bit bitmask of keywords that determine the categories of events that you want the provider to write. The provider typically writes an event if the event's keyword bits match **any** of the bits set in this value or if the event has no keyword bits set, in addition to meeting the _EnableLevel_ critera. > [!Note] > EventRegister-based providers support 64-bit keywords. Use > **EnableTraceEx2** to enable providers using a 64-bit _MatchAnyKeyword_ mask.
EnableLevel : [int] A value that indicates the maximum level of events that you want the provider to write. The provider typically writes an event if the event's level is less than or equal to this value, in addition to meeting the _EnableFlag_ criteria. This value should be in the range 1 to 255. Microsoft defines the semantics of levels 1-5 as shown below. Lower values indicate more-severe events. Each value of _EnableLevel_ enables the specified level and all more-severe levels. For example, if you specify `TRACE_LEVEL_WARNING`, your consumer will receive warning, error, and critical events. | Value                           | Meaning                                    | | ------------------------------- | ------------------------------------------ | | **TRACE_LEVEL_CRITICAL** (1)    | Abnormal exit or termination events        | | **TRACE_LEVEL_ERROR** (2)       | Severe error events                        | | **TRACE_LEVEL_WARNING** (3)     | Warning events such as allocation failures | | **TRACE_LEVEL_INFORMATION** (4) | Non-error informational events             | | **TRACE_LEVEL_VERBOSE** (5)     | Detailed diagnostic events                 | The `TRACE_LEVEL` constants are defined in _evntrace.h_. Equivalent `WINMETA_LEVEL` constants are defined in _winmeta.h_.
ControlGuid : [var] The control GUID (provider ID) of the event provider that you want to enable or disable.
TraceHandle : [int] Handle of the event tracing session for which you are configuring the provider. The [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracea) function returns this handle when a new trace is started. To obtain the handle of an existing trace, use [ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew) to query the trace properties based on the trace's name and then get the handle from the **Wnode.HistoricalContext** field of the returned `EVENT_TRACE_PROPERTIES` data.
%inst
A trace session controller calls EnableTrace to configure how an ETW
event provider logs events to a trace session. The EnableTraceEx2
function supersedes this function.

[戻り値]
If the function is successful, the return value is ERROR_SUCCESS. If
the function fails, the return value is one of the [system error
codes](/windows/win32/debug/system-error-codes). The following are
some common errors and their causes. - **ERROR_INVALID_PARAMETER**
One of the following is true: - _ControlGuid_ is **NULL**. -
_TraceHandle_ is **NULL**. - **ERROR_INVALID_FUNCTION** You cannot
change the enable flags and level when the provider is not
registered. - **ERROR_WMI_GUID_NOT_FOUND** The provider is not
registered. Occurs when KB307331 or Windows 2000 Service Pack 4 is
installed and the provider is not registered. To avoid this error,
the provider must first be registered. -
**ERROR_NO_SYSTEM_RESOURCES** Exceeded the number of trace sessions
that can enable the provider. - **ERROR_ACCESS_DENIED** Only users
with administrative privileges, users in the `Performance Log Users`
group, and services running as `LocalSystem`, `LocalService`, or
`NetworkService` can enable event providers to a cross-process
session. To grant a restricted user the ability to enable an event
provider, add them to the `Performance Log Users` group or see
[EventAccessControl](/windows/desktop/api/evntcons/nf-evntcons-eventaccesscontrol).
**Windows XP and Windows 2000:** Anyone can enable an event provider.

[備考]
Event trace controllers call this function to configure the event
providers that write events to the session. For example, a controller
might call this function to begin collecting events from a provider,
to adjust the level or keywords of the events being collected from a
provider, or to stop collecting events from a provider. This function
is obsolete. For additional functionality, new code should use
[EnableTraceEx2](/windows/win32/api/evntrace/nf-evntrace-enabletraceex2).
The following two function calls are equivalent:
This doc was truncated.


%index
EnableTraceEx
A trace session controller calls EnableTraceEx to configure how an ETW event provider logs events to a trace session. The EnableTraceEx2 function supersedes this function.
%group
Win32 advapi32
%prm
ProviderId, SourceId, TraceHandle, IsEnabled, Level, MatchAnyKeyword, MatchAllKeyword, EnableProperty, EnableFilterDesc
ProviderId : [var] The provider ID (control GUID) of the event provider that you want to configure.
SourceId : [var] A GUID that can uniquely identify the source of this configuration request, or **NULL** if no source identity is needed (equivalent to setting _SourceId_ to `&GUID_NULL`). If specified, this value is used as the _SourceId_ parameter when invoking the provider's [EnableCallback](/windows/win32/api/evntprov/nc-evntprov-penablecallback). > [!Note] > There is not always a direct mapping between a call to **EnableTrace** > and a corresponding call to the provider's **EnableCallback**. For example, if > **EnableTrace** is called for a provider that has not yet been registered, the > call to **EnableCallback** will be deferred until the registration occurs, and > if a trace consumer session is stopped, ETW will invoke **EnableCallback** > even though there was no corresponding call to **EnableTrace**. In such cases, > **EnableTrace** will be invoked with _SourceId_ set to **GUID_NULL**.
TraceHandle : [int] Handle of the event tracing session for which you are configuring the provider. The [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracea) function returns this handle when a new trace is started. To obtain the handle of an existing trace, use [ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew) to query the trace properties based on the trace's name and then get the handle from the **Wnode.HistoricalContext** field of the returned `EVENT_TRACE_PROPERTIES` data.
IsEnabled : [int] Set to 1 to enable receiving events from the provider or to adjust the settings used when receiving events from the provider (e.g. to change level and keywords). Set to 0 to disable receiving events from the provider.
Level : [int] A value that indicates the maximum level of events that you want the provider to write. The provider typically writes an event if the event's level is less than or equal to this value, in addition to meeting the _MatchAnyKeyword_ and _MatchAllKeyword_ criteria. Microsoft defines the semantics of levels 1-5 as shown below. Lower values indicate more-severe events. Each value of _EnableLevel_ enables the specified level and all more-severe levels. For example, if you specify `TRACE_LEVEL_WARNING`, your consumer will receive warning, error, and critical events. | Value                           | Meaning                                    | | ------------------------------- | ------------------------------------------ | | **TRACE_LEVEL_CRITICAL** (1)    | Abnormal exit or termination events        | | **TRACE_LEVEL_ERROR** (2)       | Severe error events                        | | **TRACE_LEVEL_WARNING** (3)     | Warning events such as allocation failures | | **TRACE_LEVEL_INFORMATION** (4) | Non-error informational events             | | **TRACE_LEVEL_VERBOSE** (5)     | Detailed diagnostic events                 | The `TRACE_LEVEL` constants are defined in _evntrace.h_. Equivalent `WINMETA_LEVEL` constants are defined in _winmeta.h_.
MatchAnyKeyword : [int64] 64-bit bitmask of keywords that determine the categories of events that you want the provider to write. The provider typically writes an event if the event's keyword bits match **any** of the bits set in this value or if the event has no keyword bits set, in addition to meeting the _Level_ and _MatchAllKeyword_ criteria.
MatchAllKeyword : [int64] 64-bit bitmask of keywords that restricts the events that you want the provider to write. The provider typically writes an event if the event's keyword bits match **all** of the bits set in this value or if the event has no keyword bits set, in addition to meeting the _Level_ and _MatchAnyKeyword_ criteria. This value is frequently set to 0.
EnableProperty : [int] Flags specifying special behaviors that the ETW runtime should enable when collecting events from this provider. To enable special behaviors, specify one or more of the following flags. Otherwise, set _EnableProperty_ to 0. > [!Note] > Several of these flags indicate that ETW should include extra > information into each event. The data is written to the > [extended data item](/windows/win32/api/evntcons/ns-evntcons-event_header_extended_data_item) > section of the event. | Value                                      | Meaning                                                                 | | ------------------------------------------ | ----------------------------------------------------------------------- | | **EVENT_ENABLE_PROPERTY_SID**              | Include the security identifier (SID) of the user in the extended data. | | **EVENT_ENABLE_PROPERTY_TS_ID**            | Include the terminal session identifier in the extended data.           | | **EVENT_ENABLE_PROPERTY_IGNORE_KEYWORD_0** | The trace session should not record events that have a keyword of 0.    |
EnableFilterDesc : [var] An [EVENT_FILTER_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_filter_descriptor) structure that points to the filter data. The provider uses this to filter data to prevent events that do not match the filter criteria from being written to the session. The provider determines the layout of the data and how it applies the filter to the event's data. A session can pass only one filter to the provider. A session can call the [TdhEnumerateProviderFilters](/windows/desktop/api/tdh/nf-tdh-tdhenumerateproviderfilters) function to look up the filters for which a provider has registered support.
%inst
A trace session controller calls EnableTraceEx to configure how an
ETW event provider logs events to a trace session. The EnableTraceEx2
function supersedes this function.

[戻り値]
If the function is successful, the return value is ERROR_SUCCESS. If
the function fails, the return value is one of the [system error
codes](/windows/win32/debug/system-error-codes). The following are
some common errors and their causes. - **ERROR_INVALID_PARAMETER**
One of the following is true: - _ProviderId_ is **NULL**. -
_TraceHandle_ is **NULL**. - **ERROR_INVALID_FUNCTION** You cannot
update the level when the provider is not registered. -
**ERROR_NO_SYSTEM_RESOURCES** Exceeded the number of trace sessions
that can enable the provider. - **ERROR_ACCESS_DENIED** Only users
with administrative privileges, users in the `Performance Log Users`
group, and services running as `LocalSystem`, `LocalService`, or
`NetworkService` can enable event providers to a cross-process
session. To grant a restricted user the ability to enable an event
provider, add them to the `Performance Log Users` group or see
[EventAccessControl](/windows/desktop/api/evntcons/nf-evntcons-eventaccesscontrol).
**Windows XP and Windows 2000:** Anyone can enable an event provider.

[備考]
Event trace controllers call this function to configure the event
providers that write events to the session. For example, a controller
might call this function to begin collecting events from a provider,
to adjust the level or keywords of the events being collected from a
provider, or to stop collecting events from a provider. This function
is obsolete. For additional functionality, new code should use
[EnableTraceEx2](/windows/win32/api/evntrace/nf-evntrace-enabletraceex2).
In most cases, a call to **EnableTraceEx** can be converted to
**EnableTraceEx2** as follows:
This doc was truncated.


%index
EnableTraceEx2
A trace session controller calls EnableTraceEx2 to configure how an ETW event provider logs events to a trace session.
%group
Win32 advapi32
%prm
TraceHandle, ProviderId, ControlCode, Level, MatchAnyKeyword, MatchAllKeyword, Timeout, EnableParameters
TraceHandle : [int] Handle of the event tracing session for which you are configuring the provider. The [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracea) function returns this handle when a new trace is started. To obtain the handle of an existing trace, use [ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew) to query the trace properties based on the trace's name and then get the handle from the **Wnode.HistoricalContext** field of the returned `EVENT_TRACE_PROPERTIES` data.
ProviderId : [var] The provider ID (control GUID) of the event provider that you want to configure.
ControlCode : [int] You can specify one of the following control codes: | Value                                   | Meaning                                                                                               | | --------------------------------------- | ----------------------------------------------------------------------------------------------------- | | **EVENT_CONTROL_CODE_DISABLE_PROVIDER** | Update the session configuration so that the session does not receive events from the provider.       | | **EVENT_CONTROL_CODE_ENABLE_PROVIDER**  | Update the session configuration so that the session receives the requested events from the provider. | | **EVENT_CONTROL_CODE_CAPTURE_STATE**    | Requests that the provider log its state information.                                                 |
Level : [int] A value that indicates the maximum level of events that you want the provider to write. The provider typically writes an event if the event's level is less than or equal to this value, in addition to meeting the _MatchAnyKeyword_ and _MatchAllKeyword_ criteria. Microsoft defines the semantics of levels 1-5 as shown below. Lower values indicate more-severe events. Each value of _Level_ enables the specified level and all more-severe levels. For example, if you specify `TRACE_LEVEL_WARNING`, your consumer will receive warning, error, and critical events. | Value                           | Meaning                                    | | ------------------------------- | ------------------------------------------ | | **TRACE_LEVEL_CRITICAL** (1)    | Abnormal exit or termination events        | | **TRACE_LEVEL_ERROR** (2)       | Severe error events                        | | **TRACE_LEVEL_WARNING** (3)     | Warning events such as allocation failures | | **TRACE_LEVEL_INFORMATION** (4) | Non-error informational events             | | **TRACE_LEVEL_VERBOSE** (5)     | Detailed diagnostic events                 | The `TRACE_LEVEL` constants are defined in _evntrace.h_. Equivalent `WINMETA_LEVEL` constants are defined in _winmeta.h_.
MatchAnyKeyword : [int64] 64-bit bitmask of keywords that determine the categories of events that you want the provider to write. The provider typically writes an event if the event's keyword bits match **any** of the bits set in this value or if the event has no keyword bits set, in addition to meeting the _Level_ and _MatchAllKeyword_ criteria.
MatchAllKeyword : [int64] 64-bit bitmask of keywords that restricts the events that you want the provider to write. The provider typically writes an event if the event's keyword bits match **all** of the bits set in this value or if the event has no keyword bits set, in addition to meeting the _Level_ and _MatchAnyKeyword_ criteria. This value is frequently set to 0.
Timeout : [int] If _Timeout_ is 0, this function will start configuring the provider asynchronously and will return immediately (i.e. it will return without waiting for provider callbacks to complete). Otherwise, this function will start configuring the provider and will then begin waiting for the configuration to complete, including waiting for all provider callbacks to complete. If configuration completes before the specified timeout, this function will return **ERROR_SUCCESS**. Otherwise, this function will return **ERROR_TIMEOUT**. To wait forever, set to **INFINITE**.
EnableParameters : [var] The trace parameters used to enable the provider. For details, see [ENABLE_TRACE_PARAMETERS](/windows/win32/api/evntrace/ns-evntrace-enable_trace_parameters).
%inst
A trace session controller calls EnableTraceEx2 to configure how an
ETW event provider logs events to a trace session.

[戻り値]
If the function is successful, the return value is **ERROR_SUCCESS**.
If the function fails, the return value is one of the [system error
codes](/windows/win32/debug/system-error-codes). The following are
some common errors and their causes. - **ERROR_INVALID_PARAMETER** A
parameter is incorrect. This can occur if any of the following are
true: - The _ProviderId_ is **NULL**. - The _TraceHandle_ is **0**. -
**ERROR_TIMEOUT** The timeout value expired before the enable
callback completed. For details, see the _Timeout_ parameter. -
**ERROR_INVALID_FUNCTION** You cannot update the level when the
provider is not registered. - **ERROR_NO_SYSTEM_RESOURCES** Exceeded
the number of trace sessions that can enable the provider. -
**ERROR_ACCESS_DENIED** Only users with administrative privileges,
users in the `Performance Log Users` group, and services running as
`LocalSystem`, `LocalService`, or `NetworkService` can enable event
providers to a cross-process session. To grant a restricted user the
ability to enable an event provider, add them to the `Performance Log
Users` group or see
[EventAccessControl](/windows/desktop/api/evntcons/nf-evntcons-eventaccesscontrol).
**Windows XP and Windows 2000:** Anyone can enable an event provider.

[備考]
Event trace controllers call this function to configure the event
providers that write events to the session. For example, a controller
might call this function to begin collecting events from a provider,
to adjust the level or keywords of the events being collected from a
provider, or to stop collecting events from a provider. The
enablement behavior for a provider depends on which APIs the provider
uses. - A provider that uses
[RegisterTraceGuids](/windows/win32/api/evntrace/nf-evntrace-registertraceguidsa)
(e.g. a provider using TMF-based WPP or MOF) uses the legacy
enablement system (sometimes called "classic ETW"). When a legacy
provider is enabled or reconfigured for a session, the ETW runtime
notifies the provider and provides access to the level, the low 32
bits of the MatchAnyKeyword mask, and the session ID. The provider
then uses its own logic to decide which events should be enabled and
sends those events directly to the specified session. The event data
sent to ETW at runtime includes the event's decode GUID and message
ID but does not include the event's control GUID, level or keywords.
ETW verifies that the provider has the necessary permissions and then
adds the event data to the specified session. - Because the events
are sent directly to a specific session with no control GUID, level
or keyword information, ETW cannot perform any additional filtering
or routing for providers that use the legacy enablement system. Each
event can be routed to no more than one session. - A provider that
uses
[EventRegister](/windows/win32/api/evntprov/nf-evntprov-eventregister)
(e.g. a manifest-based provider or a TraceLogging provider) uses the
modern enablement system (sometimes called "crimson ETW"). When a
modern provider is enabled or reconfigured for a session, the ETW
runtime notifies the provider with the level, the 64-bit
MatchAnyKeyword mask, the 64-bit MatchAllKeyword mask, and any custom
provider-side filtering data specified by the trace controller. The
provider then uses its own logic to decide which events should be
enabled, though most providers just duplicate the logic of
[EventProviderEnabled](/windows/win32/api/evntprov/nf-evntprov-eventproviderenabled).
The provider sends the enabled events to ETW for routing. The event
data sent to ETW includes the event's control GUID, message ID,
level, and keywords. ETW then performs additional filtering as
appropriate, routing the event to the appropriate session(s). -
Because the events are sent to ETW with descriptive information, ETW
can perform additional filtering and routing before adding the event
to the session. Events can be routed to more than one session if
appropriate. For providers that use the modern enablement system
(i.e. providers using **EventRegister**), ETW supports several
features that can be requested by the trace session controller via
**EnableTraceEx2** _EnableParameters_. (See
[EVENT_FILTER_DESCRIPTOR](/windows/win32/api/evntprov/ns-evntprov-event_filter_descriptor)
for details.) - **Schematized filtering** - This is the traditional
filtering setup, also called provider-side filtering. The controller
defines a custom set of filters as a binary object that is passed to
the provider in
[EnableCallback](/windows/win32/api/evntprov/nc-evntprov-penablecallback)
_FilterData_. It is incumbent on the controller and provider to
define and interpret these filters. The provider can then use the
[EventWriteEx](/windows/win32/api/evntprov/nf-evntprov-eventwriteex)
_Filter_ parameter to indicate sessions to which an event should not
be sent due to the provider-side filtering. This requires a close
coupling of the controller and provider since the type and format of
the binary object of what can be filtered is not defined. The
[TdhEnumerateProviderFilters](/windows/desktop/api/tdh/nf-tdh-tdhenumerateproviderfilters)
function can be used to retrieve the filters defined in a manifest. -
**Scope filtering** - Certain providers are enabled or not enabled to
a session based on whether or not they meet the criteria specified by
the scope filters. There are several types of scope filters that
allow filtering based on the process ID (PID), executable filename,
the app ID, and the app package name. This feature is supported on
Windows 8.1, Windows Server 2012 R2, and later. - **Stackwalk
filtering** - This notifies ETW to only perform a stack walk for a
given set of event IDs or (for TraceLogging events) event names. This
feature is supported on Windows 8.1, Windows Server 2012 R2, and
later. - **Attribute filtering** - For manifest providers, events can
be filtered based on event attributes such as level, keyword, event
ID, or event name. - **Event payload filtering** - For manifest
providers, events can be filtered on-the-fly based on whether or not
they satisfy a logical expression based on one or more predicates. >
[!Note] > Even though ETW supports powerful payload and attribute
filtering, > events should primarily be filtered based scope filters
or via control GUID, > level, and keyword. Providers usually perform
control GUID, level, and keyword > filtering directly in the
provider's code before the event is generated or > sent to ETW. In
most providers, events that are disabled by level or keyword > have
almost no impact on system performance. Similarly, providers disabled
by > scope filters are have almost no impact on system performance.
Other kinds of > filtering (based on payload or attributes other than
level and keyword) are > usually performed after the provider has
generated the event and sent it to > the ETW runtime, meaning the
event has impact on system performance (the CPU > time spent
preparing the event and sending it to ETW) even if the ETW >
filtering determines that the event should not be recorded by any
sessions. > This kind of filtering is only effective in reducing
trace data volume and is > not as effective for reducing trace CPU
overhead. Every time **EnableTraceEx2** is called, the filters for
the provider in that session are replaced by the new parameters
defined by the parameters passed to the **EnableTraceEx2** function.
Multiple filters passed in a single **EnableTraceEx2** call can be
combined with an additive effect, but filters passed in a subsequent
call will replace the previous set of filters. To disable filtering
and thereby enable all providers/events in the logging session, call
**EnableTraceEx2** with the _EnableParameters_ parameter pointing at
an
[ENABLE_TRACE_PARAMETERS](/windows/win32/api/evntrace/ns-evntrace-enable_trace_parameters)
structure with the **FilterDescCount** member set to 0. Each filter
passed to the **EnableTraceEx2** function is specified by a **Type**
member in the
[EVENT_FILTER_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_filter_descriptor).
An array of **EVENT_FILTER_DESCRIPTOR** structures is passed in the
[ENABLE_TRACE_PARAMETERS](/windows/win32/api/evntrace/ns-evntrace-enable_trace_parameters)
structure passed in the **EnableParameters** parameter to the
**EnableTraceEx2** function. Each type of filter (a specific **Type**
member) may only appear once in a call to the **EnableTraceEx2**
function. Some filter types allow multiple conditions to be included
in a single filter. The maximum number of filters that can be
included in a call to **EnableTraceEx2** is set by
**MAX_EVENT_FILTERS_COUNT** (defined in the _Evntprov.h_ header file;
value may change in future versions of the Windows SDK). Each filter
type has its own size or entity limits based on the specific **Type**
member in the
[EVENT_FILTER_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_filter_descriptor)
structure. The list below indicates these limits. -
**EVENT_FILTER_TYPE_SCHEMATIZED** - Filter size limit:
**MAX_EVENT_FILTER_DATA_SIZE** (1024) - Number of elements allowed:
Defined by provider and controller - **EVENT_FILTER_TYPE_PID** -
Filter size limit: **MAX_EVENT_FILTER_DATA_SIZE** (1024) - Number of
elements allowed: **MAX_EVENT_FILTER_PID_COUNT** (8) -
**EVENT_FILTER_TYPE_EXECUTABLE_NAME** - Filter size limit:
**MAX_EVENT_FILTER_DATA_SIZE** (1024) - Number of elements allowed: A
single string that can contain multiple executable file names
separated by semicolons. - **EVENT_FILTER_TYPE_PACKAGE_ID** - Filter
size limit: **MAX_EVENT_FILTER_DATA_SIZE** (1024) - Number of
elements allowed: A single string that can contain multiple package
IDs separated by semicolons. - **EVENT_FILTER_TYPE_PACKAGE_APP_ID** -
Filter size limit: **MAX_EVENT_FILTER_DATA_SIZE** (1024) - Number of
elements allowed: A single string that can contain multiple package
relative app IDs (PRAIDs) separated by semicolons. -
**EVENT_FILTER_TYPE_PAYLOAD** - Filter size limit:
**MAX_EVENT_FILTER_PAYLOAD_SIZE** (4096) - Number of elements
allowed: 1 - **EVENT_FILTER_TYPE_EVENT_ID** - Filter size limit: Not
defined - Number of elements allowed:
**MAX_EVENT_FILTER_EVENT_ID_COUNT** (64) -
**EVENT_FILTER_TYPE_STACKWALK** - Filter size limit: Not defined -
Number of elements allowed: **MAX_EVENT_FILTER_EVENT_ID_COUNT** (64)
Keywords define event categories. For example, if the provider
defines InitializationKeyword = `0x1` (keyword bit 0),
FileOperationKeyword = `0x2` (keyword bit 1), and CalculationKeyword
= `0x4` (keyword bit 2), you can set _MatchAnyKeyword_ to
(InitializationKeyword | CalculationKeyword) = 5 to receive
initialization and calculation events but not file events. When used
with modern
([manifest-based](/windows/desktop/ETW/about-event-tracing) or
[TraceLogging](/windows/desktop/tracelogging/trace-logging-about))
providers, a _MatchAnyKeyword_ value of `0` is treated the same as a
_MatchAnyKeyword_ value of `0xFFFFFFFFFFFFFFFF`, i.e. it enables all
event keywords. However, this behavior does not apply to legacy ([MOF
or TMF-based WPP](/windows/desktop/ETW/about-event-tracing))
providers. To enable all event keywords from a legacy provider, set
_MatchAnyKeyword_ to `0xFFFFFFFF`. To enable all event keywords from
both legacy and modern providers, set _MatchAnyKeyword_ to
`0xFFFFFFFFFFFFFFFF`. If an event's keyword is zero, the provider
will write the event to the session regardless of the
_MatchAnyKeyword_ and _MatchAllKeyword_ masks. (This behavior can be
disabled by using the
[EVENT_ENABLE_PROPERTY_IGNORE_KEYWORD_0](/windows/win32/api/evntrace/ns-evntrace-enable_trace_parameters)
flag.) To indicate that you wish to enable a Provider Group, use the
`EVENT_ENABLE_PROPERTY_PROVIDER_GROUP` flag on the **EnableProperty**
member of _EnableParameters_. When you call **EnableTraceEx2**, the
provider may or may not already be registered. If the provider is
already registered, ETW calls the provider's callback function (if
any), and the session begins receiving events. If the provider is not
already registered, ETW will call the provider's callback function
(if any) immediately after the provider registers and the session
will then begin receiving events. If the provider is not already
registered, the provider's callback function will not receive the
source ID. If the provider is registered and already enabled to your
session, you can call **EnableTraceEx2** again to update the _Level_,
_MatchAnyKeyword_, _MatchAllKeyword_ parameters and the
**EnableProperty** and **EnableFilterDesc** members of
_EnableParameters_. On Windows 8.1, Windows Server 2012 R2, and
later, event payload, scope, and stack walk filters can be used by
the **EnableTraceEx2** function and the
[ENABLE_TRACE_PARAMETERS](/windows/win32/api/evntrace/ns-evntrace-enable_trace_parameters)
and
[EVENT_FILTER_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_filter_descriptor)
structures to filter on specific conditions in a logger session. For
more information on event payload filters, see the
[TdhCreatePayloadFilter](/windows/desktop/api/tdh/nf-tdh-tdhcreatepayloadfilter),
and
[TdhAggregatePayloadFilters](/windows/desktop/api/tdh/nf-tdh-tdhaggregatepayloadfilters)
functions and the **ENABLE_TRACE_PARAMETERS**,
**EVENT_FILTER_DESCRIPTOR**, and
[PAYLOAD_FILTER_PREDICATE](/windows/desktop/api/tdh/ns-tdh-payload_filter_predicate)
structures. Special system trace provider events cannot be enabled or
disabled by **EnableTraceEx2**. They can only be enabled via the
_EnableFlags_ field of
[EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties)
when the trace is first started by
[StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracea).
Starting with Windows 11, [system trace provider events can be
enabled using EnableTraceEx2](/windows/win32/etw/system-providers).
Up to eight trace sessions can enable and receive events from the
same modern
([manifest-based](/windows/desktop/ETW/about-event-tracing) or
[TraceLogging](/windows/desktop/tracelogging/trace-logging-about))
provider. However, only one trace session can enable a legacy (MOF,
TMF-based WPP) provider. If more than one session tries to enable a
legacy provider, the first session would stop receiving events when
the second session enables the same provider. For example, if Session
A enabled a legacy provider and then Session B enabled the same
provider, only Session B would receive events from that provider. A
provider remains enabled for the session until the session disables
the provider. If the application that started the session ends
without disabling the provider, the provider remains enabled. To
determine the level and keywords used to enable a manifest-based
provider, use one of the following commands: - logman query providers
_provider-name_ - wevtutil gp _provider-name_ For classic providers,
it is up to the provider to document and make available to potential
controllers the severity levels or enable flags that it supports. If
the provider wants to be enabled by any controller, the provider
should accept 0 for the severity level and enable flags and interpret
0 as a request to perform default logging (whatever that may be). If
you use **EnableTraceEx2** to enable a classic provider, the
following translation occurs: - The _Level_ parameter is the same as
setting the _EnableLevel_ parameter in
[EnableTrace](/windows/desktop/ETW/enabletrace). - The
_MatchAnyKeyword_ is the same as setting the _EnableFlag_ parameter
in [EnableTrace](/windows/desktop/ETW/enabletrace) except that the
keyword value is truncated from a 64-bit value to a 32-bit value. -
In the [ControlCallback](/windows/desktop/ETW/controlcallback)
callback, the provider can call
[GetTraceEnableLevel](/windows/desktop/ETW/gettraceenablelevel) to
get the level and
[GetTraceEnableFlags](/windows/desktop/ETW/gettraceenableflags) to
get the enable flag. - The other parameter are not used.


%index
EncryptFileW
Encrypts a file or directory. (Unicode)
%group
Win32 advapi32
%prm
lpFileName
lpFileName : [wstr] The name of the file or directory to be encrypted. The caller must have the FILE_READ_DATA, FILE_WRITE_DATA, FILE_READ_ATTRIBUTES, FILE_WRITE_ATTRIBUTES, and SYNCHRONIZE access rights. For more information, see File Security and Access Rights.
%inst
Encrypts a file or directory. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The EncryptFile function requires exclusive access to the file being
encrypted, and will fail if another process is using the file. If the
file is already encrypted, EncryptFile simply returns a nonzero
value, which indicates success. If the file is compressed,
EncryptFile will decompress the file before encrypting it. If
lpFileName specifies a read-only file, the function fails and
GetLastError returns ERROR_FILE_READ_ONLY. If lpFileName specifies a
directory that contains a read-only file, the functions succeeds but
the directory is not encrypted. To decrypt an encrypted file, use the
DecryptFile function. In Windows 8, Windows Server 2012, and later,
this function is supported by the following technologies.
This doc was truncated.


%index
EncryptionDisable
Disables or enables encryption of the specified directory and the files in it.
%group
Win32 advapi32
%prm
DirPath, Disable
DirPath : [wstr] The name of the directory for which to enable or disable encryption.
Disable : [int] Indicates whether to disable encryption (TRUE) or enable it (FALSE).
%inst
Disables or enables encryption of the specified directory and the
files in it.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Under normal circumstances, EncryptFile will not encrypt files and
directories with the FILE_ATTRIBUTE_SYSTEM attribute set. It is
possible to override the FILE_ATTRIBUTE_SYSTEM attribute and encrypt
files. Also, if a file or directory is marked with the
FILE_ATTRIBUTE_SYSTEM attribute, it will normally be invisible to the
user in directory listings and Windows Explorer directory windows.
EncryptionDisable disables encryption of directories and files. It
does not affect the visibility of files with the
FILE_ATTRIBUTE_SYSTEM attribute set.
If TRUE is passed in, EncryptionDisable will write the following to
the Desktop.ini file in the directory (creating it if necessary):
This doc was truncated.


%index
EnumDependentServicesW
Retrieves the name and status of each service that depends on the specified service. (Unicode)
%group
Win32 advapi32
%prm
hService, dwServiceState, lpServices, cbBufSize, pcbBytesNeeded, lpServicesReturned
hService : [intptr] A handle to the service. This handle is returned by the OpenService or CreateService function, and it must have the SERVICE_ENUMERATE_DEPENDENTS access right. For more information, see Service Security and Access Rights.
dwServiceState : [int] 
lpServices : [var] A pointer to an array of ENUM_SERVICE_STATUS structures that receives the name and service status information for each dependent service in the database. The buffer must be large enough to hold the structures, plus the strings to which their members point. The order of the services in this array is the reverse of the start order of the services. In other words, the first service in the array is the one that would be started last, and the last service in the array is the one that would be started first. The maximum size of this array is 64,000 bytes. To determine the required size, specify NULL for this parameter and 0 for the cbBufSize parameter. The function will fail and GetLastError will return ERROR_MORE_DATA. The pcbBytesNeeded parameter will receive the required size.
cbBufSize : [int] The size of the buffer pointed to by the lpServices parameter, in bytes.
pcbBytesNeeded : [var] A pointer to a variable that receives the number of bytes needed to store the array of service entries. The variable only receives this value if the buffer pointed to by lpServices is too small, indicated by function failure and the ERROR_MORE_DATA error; otherwise, the contents of pcbBytesNeeded are undefined.
lpServicesReturned : [var] A pointer to a variable that receives the number of service entries returned.
%inst
Retrieves the name and status of each service that depends on the
specified service. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The following error codes may be set
by the service control manager. Other error codes may be set by the
registry functions that are called by the service control manager.
This doc was truncated.

[備考]
The returned services entries are ordered in the reverse order of the
start order, with group order taken into account. If you need to stop
the dependent services, you can use the order of entries written to
the lpServices buffer to stop the dependent services in the proper
order.


%index
EnumDynamicTimeZoneInformation
Enumerates DYNAMIC_TIME_ZONE_INFORMATION entries stored in the registry.
%group
Win32 advapi32
%prm
dwIndex, lpTimeZoneInformation
dwIndex : [int] Index value that represents the location of a DYNAMIC_TIME_ZONE_INFORMATION entry.
lpTimeZoneInformation : [var] Specifies settings for  a time zone and dynamic daylight saving time.
%inst
Enumerates DYNAMIC_TIME_ZONE_INFORMATION entries stored in the
registry.

[戻り値]
This function returns DWORD. Possible return values include: | Value
| Description |
|-------------------------|---------------------------------------------------|
| ERROR_SUCCESS | The operation succeeded. | | ERROR_NO_MORE_ITEMS |
No more data is available for the given index. | |
ERROR_INVALID_PARAMETER | A parameter is invalid. | | Any other value
| The operation failed. |

[備考]
The following example demonstrates looping through the potential
timezones until **ERROR_NO_MORE_ITEMS** is returned, indicating that
there are no more time zone entries in the registry.
This doc was truncated.


%index
EnumServicesStatusW
Enumerates services in the specified service control manager database. The name and status of each service are provided. (Unicode)
%group
Win32 advapi32
%prm
hSCManager, dwServiceType, dwServiceState, lpServices, cbBufSize, pcbBytesNeeded, lpServicesReturned, lpResumeHandle
hSCManager : [intptr] A handle to the service control manager database. This handle is returned by the OpenSCManager function, and must have the SC_MANAGER_ENUMERATE_SERVICE access right. For more information, see Service Security and Access Rights.
dwServiceType : [int] 
dwServiceState : [int] 
lpServices : [var] A pointer to a buffer that contains an array of ENUM_SERVICE_STATUS structures that receive the name and service status information for each service in the database. The buffer must be large enough to hold the structures, plus the strings to which their members point. The maximum size of this array is 256K bytes. To determine the required size, specify NULL for this parameter and 0 for the cbBufSize parameter. The function will fail and GetLastError will return ERROR_INSUFFICIENT_BUFFER. The pcbBytesNeeded parameter will receive the required size. Windows Server?2003 and Windows?XP:??The maximum size of this array is 64K bytes. This limit was increased as of Windows Server?2003 with SP1 and Windows?XP with SP2.
cbBufSize : [int] The size of the buffer pointed to by the lpServices parameter, in bytes.
pcbBytesNeeded : [var] A pointer to a variable that receives the number of bytes needed to return the remaining service entries, if the buffer is too small.
lpServicesReturned : [var] A pointer to a variable that receives the number of service entries returned.
lpResumeHandle : [var] A pointer to a variable that, on input, specifies the starting point of enumeration. You must set this value to zero the first time this function is called. On output, this value is zero if the function succeeds. However, if the function returns zero and the GetLastError function returns ERROR_MORE_DATA, this value is used to indicate the next service entry to be read when the function is called to retrieve the additional data.
%inst
Enumerates services in the specified service control manager
database. The name and status of each service are provided. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. To get extended
error information, call GetLastError. The following error codes can
be set by the service control manager. Other error codes can be set
by the registry functions that are called by the service control
manager.
This doc was truncated.

[備考]
> [!NOTE] > The winsvc.h header defines EnumServicesStatus as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
EnumServicesStatusExW
Enumerates services in the specified service control manager database. The name and status of each service are provided, along with additional data based on the specified information level. (Unicode)
%group
Win32 advapi32
%prm
hSCManager, InfoLevel, dwServiceType, dwServiceState, lpServices, cbBufSize, pcbBytesNeeded, lpServicesReturned, lpResumeHandle, pszGroupName
hSCManager : [intptr] A handle to the service control manager database. This handle is returned by the OpenSCManager function, and must have the SC_MANAGER_ENUMERATE_SERVICE access right. For more information, see Service Security and Access Rights.
InfoLevel : [int] The service attributes that are to be returned. Use SC_ENUM_PROCESS_INFO to retrieve the name and service status information for each service in the database. The lpServices parameter is a pointer to a buffer that receives an array of ENUM_SERVICE_STATUS_PROCESS structures. The buffer must be large enough to hold the structures as well as the strings to which their members point. Currently, no other information levels are defined.
dwServiceType : [int] 
dwServiceState : [int] 
lpServices : [var] A pointer to the buffer that receives the status information. The format of this data depends on the value of the InfoLevel parameter. The maximum size of this array is 256K bytes. To determine the required size, specify NULL for this parameter and 0 for the cbBufSize parameter. The function will fail and GetLastError will return ERROR_MORE_DATA. The pcbBytesNeeded parameter will receive the required size. Windows Server?2003 and Windows?XP:??The maximum size of this array is 64K bytes. This limit was increased as of Windows Server?2003 with SP1 and Windows?XP with SP2.
cbBufSize : [int] The size of the buffer pointed to by the lpServices parameter, in bytes.
pcbBytesNeeded : [var] A pointer to a variable that receives the number of bytes needed to return the remaining service entries, if the buffer is too small.
lpServicesReturned : [var] A pointer to a variable that receives the number of service entries returned.
lpResumeHandle : [var] A pointer to a variable that, on input, specifies the starting point of enumeration. You must set this value to zero the first time the EnumServicesStatusEx function is called. On output, this value is zero if the function succeeds. However, if the function returns zero and the GetLastError function returns ERROR_MORE_DATA, this value indicates the next service entry to be read when the EnumServicesStatusEx function is called to retrieve the additional data.
pszGroupName : [wstr] The load-order group name. If this parameter is a string, the only services enumerated are those that belong to the group that has the name specified by the string. If this parameter is an empty string, only services that do not belong to any group are enumerated. If this parameter is NULL, group membership is ignored and all services are enumerated.
%inst
Enumerates services in the specified service control manager
database. The name and status of each service are provided, along
with additional data based on the specified information level.
(Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The following errors may be returned.
This doc was truncated.

[備考]
If the caller does not have the SERVICE_QUERY_STATUS access right to
a service, the service is silently omitted from the list of services
returned to the client.
> [!NOTE] > The winsvc.h header defines EnumServicesStatusEx as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
EnumerateTraceGuids
Retrieves information about event trace providers that are currently running on the computer. The EnumerateTraceGuidsEx function supersedes this function.
%group
Win32 advapi32
%prm
GuidPropertiesArray, PropertyArrayCount, GuidCount
GuidPropertiesArray : [var] An array of pointers to [TRACE_GUID_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-trace_guid_properties) structures. Each pointer in the array must point at a buffer with room to store a **TRACE_GUID_PROPERTIES** structure.
PropertyArrayCount : [int] Number of pointers in the _GuidPropertiesArray_ array.
GuidCount : [var] Receives the actual number of event tracing providers registered on the computer.
%inst
Retrieves information about event trace providers that are currently
running on the computer. The EnumerateTraceGuidsEx function
supersedes this function.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is one of the [system error
codes](/windows/win32/debug/system-error-codes). The following are
some common errors and their causes. - **ERROR_INVALID_PARAMETER**
One of the following is true: - _PropertyArrayCount_ is zero -
_GuidPropertiesArray_ is **NULL** - **ERROR_MORE_DATA** The property
array is too small to receive information for all registered
providers (_GuidCount_ is greater than _PropertyArrayCount_). The
function fills _GuidPropertiesArray_ with the number of structures
specified in _PropertyArrayCount_.

[備考]
This function returns information about event trace providers that
have been started (via
[RegisterTraceGuids](/windows/win32/api/evntrace/nf-evntrace-registertraceguidsa),
[EventRegister](/windows/win32/api/evntprov/nf-evntprov-eventregister))
and have not yet been stopped. > [!Note] > To get information about
provider manifests that have been registered > on the system (i.e.
manifests registered via `wevtutil`), use >
[TdhEnumerateProviders](/windows/win32/api/tdh/nf-tdh-tdhenumerateproviders).
You can use the
[TRACE_GUID_PROPERTIES](ns-evntrace-trace_guid_properties.md).LoggerId
member to determine which session most recently enabled the provider
if **TRACE_GUID_PROPERTIES.IsEnable** is **TRUE**. The list will not
include the SystemTraceProvider providers.


%index
EnumerateTraceGuidsEx
Retrieves information about event trace providers that are currently running on the computer.
%group
Win32 advapi32
%prm
TraceQueryInfoClass, InBuffer, InBufferSize, OutBuffer, OutBufferSize, ReturnLength
TraceQueryInfoClass : [int] Determines the type of information to return. For possible values, see the [TRACE_QUERY_INFO_CLASS](/windows/win32/api/evntrace/ne-evntrace-trace_query_info_class) enumeration.
InBuffer : [intptr] GUID of the provider or provider group whose information you want to retrieve. Specify the GUID only if _TraceQueryInfoClass_ is **TraceGuidQueryInfo** or **TraceGroupQueryInfo**.
InBufferSize : [int] Size, in bytes, of the data _InBuffer_.
OutBuffer : [intptr] Application-allocated buffer that contains the enumerated information. The format of the information depends on the value of _TraceQueryInfoClass_.
OutBufferSize : [int] Size, in bytes, of the _OutBuffer_ buffer. If the function succeeds, the _ReturnLength_ parameter receives the size of the buffer used. If the buffer is too small, the function returns `ERROR_INSUFFICIENT_BUFFER` and the _ReturnLength_ parameter receives the required buffer size. If the buffer size is zero on input, no data is returned in the buffer and the _ReturnLength_ parameter receives the required buffer size.
ReturnLength : [var] Actual size of the data in _OutBuffer_, in bytes.
%inst
Retrieves information about event trace providers that are currently
running on the computer.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is one of the [system error
codes](/windows/win32/debug/system-error-codes). The following are
some common errors and their causes. - **ERROR_INVALID_PARAMETER**
One of the parameters is not valid. - **ERROR_INSUFFICIENT_BUFFER**
The _OutBuffer_ buffer is too small to receive information for all
registered providers. Reallocate the buffer using the size returned
in _ReturnLength_.

[備考]
This function returns information about event trace providers that
have been started (via
[RegisterTraceGuids](/windows/win32/api/evntrace/nf-evntrace-registertraceguidsa)
or
[EventRegister](/windows/win32/api/evntprov/nf-evntprov-eventregister))
and have not yet been stopped. > [!Note] > To get information about
provider manifests that have been registered > on the system (i.e.
manifests registered via `wevtutil`), use >
[TdhEnumerateProviders](/windows/win32/api/tdh/nf-tdh-tdhenumerateproviders).
If _TraceQueryInfoClass_ is **TraceGuidQueryInfo**, ETW returns the
data in a
[TRACE_GUID_INFO](/windows/win32/api/evntrace/ns-evntrace-trace_guid_info)
block that is a header to the information. The info block contains a
[TRACE_PROVIDER_INSTANCE_INFO](/windows/win32/api/evntrace/ns-evntrace-trace_provider_instance_info)
block for each provider that uses the same GUID. Each instance info
block contains a
[TRACE_ENABLE_INFO](/windows/win32/api/evntrace/ns-evntrace-trace_enable_info)
structure for each session that enabled the provider.


%index
EqualDomainSid
Determines whether two SIDs are from the same domain.
%group
Win32 advapi32
%prm
pSid1, pSid2, pfEqual
pSid1 : [int] A pointer to one of the two SIDs to compare. This SID must be either an account domain SID or a BUILTIN SID.
pSid2 : [int] A pointer to one of the two SIDs to compare. This SID must be either an account domain SID or a BUILTIN SID.
pfEqual : [var] A pointer to a BOOL that EqualDomainSid sets to TRUE if the domains of the two SIDs are equal or FALSE if they are not equal. This value cannot be NULL.
%inst
Determines whether two SIDs are from the same domain.

[戻り値]
If both SIDs are account domain SIDs and/or BUILTIN SIDs, the return
value is nonzero. In addition, *pfEqual is set to TRUE if the domains
of the two SIDs are equal; otherwise *pfEqual is set to FALSE. If one
or more of the SIDS is neither an account domain SID nor a BUILTIN
SID, then the return value is FALSE. To get extended error
information, call GetLastError. GetLastError returns
ERROR_NON_DOMAIN_SID if either SID is not an account domain SID or
BUILTIN SID.


%index
EqualPrefixSid
Tests two security-identifier (SID) prefix values for equality. A SID prefix is the entire SID except for the last subauthority value.
%group
Win32 advapi32
%prm
pSid1, pSid2
pSid1 : [int] A pointer to the first SID structure to compare. This structure is assumed to be valid.
pSid2 : [int] A pointer to the second SID structure to compare. This structure is assumed to be valid.
%inst
Tests two security-identifier (SID) prefix values for equality. A SID
prefix is the entire SID except for the last subauthority value.

[戻り値]
If the SID prefixes are equal, the return value is nonzero. If the
SID prefixes are not equal, the return value is zero. To get extended
error information, call GetLastError.

[備考]
The EqualPrefixSid function enables a server application in one
domain to verify an attempt by a user to log on to another domain.
For example, if a user attempts to log on to RemoteDomain from a
workstation in LocalDomain, the server for LocalDomain can request
the SIDs for the user and the user's groups from RemoteDomain. The
domain controller for RemoteDomain responds with the relevant SIDs.
All SIDs for a specified domain have the same prefix. When the server
receives the user's SIDs, the server can call the EqualPrefixSid
function for each SID, comparing the user or group SID against the
SID for RemoteDomain. If any of the SID prefixes are not equal, the
server refuses the logon attempt. It is advisable to modify the SID
for a domain before comparing it with a group or user SID. If the SID
for RemoteDomain is S-1?1234?8, each group or user SID for that
domain has S-1?1234?8 as its prefix. To compare the SIDs by using the
EqualPrefixSid function, an application copies the domain SID and
adds any subauthority (RID) value to the copy, thereby creating a SID
in the form S-1?1234?8?0. The application then uses the modified
domain SID as a template against which the group and user SIDs are
compared.


%index
EqualSid
Tests two security identifier (SID) values for equality. Two SIDs must match exactly to be considered equal.
%group
Win32 advapi32
%prm
pSid1, pSid2
pSid1 : [int] A pointer to the first SID structure to compare. This structure is assumed to be valid.
pSid2 : [int] A pointer to the second SID structure to compare. This structure is assumed to be valid.
%inst
Tests two security identifier (SID) values for equality. Two SIDs
must match exactly to be considered equal.

[戻り値]
If the SID structures are equal, the return value is nonzero. If the
SID structures are not equal, the return value is zero. To get
extended error information, call GetLastError. If either SID
structure is not valid, the return value is undefined.


%index
EventAccessControl
Adds or modifies the permissions of the specified provider or session.
%group
Win32 advapi32
%prm
Guid, Operation, Sid, Rights, AllowOrDeny
Guid : [var] GUID that uniquely identifies the provider or session whose permissions you want to add or modify.
Operation : [int] Type of operation to perform, for example, add a DACL to the session's GUID or provider's GUID. For possible values, see the EVENTSECURITYOPERATION enumeration.
Sid : [int] The security identifier (SID) of the user  or group to whom you want to grant or deny permissions.
Rights : [int] You can specify one or more of the following permissions:
AllowOrDeny : [int] If TRUE, grant the user permissions to the session or provider; otherwise, deny permissions. This value is ignored if the value of Operation is EventSecuritySetSACL or EventSecurityAddSACL.
%inst
Adds or modifies the permissions of the specified provider or
session.

[戻り値]
Returns ERROR_SUCCESS if successful.

[備考]
By default, only the administrator of the computer, users in the
Performance Log Users group, and services running as LocalSystem,
LocalService, NetworkService can control trace sessions and provide
and consume event data. Only users with administrative privileges and
services running as LocalSystem can start and control an NT Kernel
Logger session. Windows Server 2003: Only users with administrator
privileges can control trace sessions and consume event data; any
user can provide event data. Windows XP and Windows 2000: Any user
can control trace sessions and provide and consume event data. Users
with administrator privileges can control trace sessions if the tool
that they use to control the session is started from a Command Prompt
window that is opened with Run as administrator.... To grant a
restricted user the ability to control trace sessions, you can add
them to the Performance Log Users group or call this function to
grant them permission. For example, you can grant user A permission
to start and stop a trace session and grant user B permission to only
query the session. To restrict who can log events to the session, see
the TRACELOG_LOG_EVENT permission. The ACL on the log file determines
who can consume event data from the log file. To consume events from
a session in real-time, you must grant the user
TRACELOG_ACCESS_REALTIME permission or the user must be a member of
the Performance Log Users group. You can also specify the provider's
GUID to restrict who can register the provider and who can enable the
provider.


%index
EventAccessQuery
Retrieves the permissions for the specified controller or provider.
%group
Win32 advapi32
%prm
Guid, Buffer, BufferSize
Guid : [var] GUID that uniquely identifies the provider or session.
Buffer : [int] Application-allocated buffer that will contain the security descriptor of the controller or provider.
BufferSize : [var] Size of the security descriptor buffer, in bytes. If the function succeeds, this parameter receives the size of the buffer used. If the buffer is too small, the function returns ERROR_MORE_DATA and this parameter receives the required buffer size. If the buffer size is zero on input, no data is returned in the buffer and this parameter receives the required buffer size.
%inst
Retrieves the permissions for the specified controller or provider.

[戻り値]
Returns ERROR_SUCCESS if successful. The function returns the
following return code if an error occurs:
This doc was truncated.

[備考]
If the GUID does not exist in the registry, ETW returns the default
permissions for a provider or controller. For details on specifying
the GUID in the registry, see EventAccessControl. For information on
accessing the components of the security descriptor, see Getting
Information from an ACL, the GetSecurityDescriptorDacl,
GetSecurityDescriptorSacl, and GetAce functions, and the ACE
structure.


%index
EventAccessRemove
Removes the permissions defined in the registry for the specified provider or session.
%group
Win32 advapi32
%prm
Guid
Guid : [var] GUID that uniquely identifies the provider or session whose permissions you want to remove from the registry.
%inst
Removes the permissions defined in the registry for the specified
provider or session.

[戻り値]
Returns ERROR_SUCCESS if successful.

[備考]
After removing the permission from the registry, the default
permissions apply to the provider or session. For details on the
default permissions, see EventAccessControl.


%index
FileEncryptionStatusW
Retrieves the encryption status of the specified file. (Unicode)
%group
Win32 advapi32
%prm
lpFileName, lpStatus
lpFileName : [wstr] The name of the file.
lpStatus : [var] A pointer to a variable that receives the encryption status of the file. This parameter can be one of the following values.
%inst
Retrieves the encryption status of the specified file. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
In Windows 8 and Windows Server 2012, this function is supported by
the following technologies.
This doc was truncated.


%index
FindFirstFreeAce
Retrieves a pointer to the first free byte in an access control list (ACL).
%group
Win32 advapi32
%prm
pAcl, pAce
pAcl : [var] A pointer to an ACL.
pAce : [var] The address of a pointer to the first free position in the ACL created when the function returns. If the ACL is not valid, this parameter is NULL. If the ACL is full, this parameter points to the byte immediately following the ACL.
%inst
Retrieves a pointer to the first free byte in an access control list
(ACL).

[戻り値]
If the function succeeds, the function returns nonzero.
If the function fails, it returns zero. To get extended error
information, call GetLastError.


%index
FlushTraceW
The FlushTraceW (Unicode) function (evntrace.h) causes an event tracing session to immediately deliver buffered events for the specified session.
%group
Win32 advapi32
%prm
TraceHandle, InstanceName, Properties
TraceHandle : [int] Handle to the event tracing session to be flushed, or 0. You must specify a non-zero _TraceHandle_ if _InstanceName_ is **NULL**. This parameter will be used only if _InstanceName_ is **NULL**. The handle is returned by the [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracew).
InstanceName : [wstr] Name of the event tracing session to be flushed, or **NULL**. You must specify _InstanceName_ if _TraceHandle_ is 0. To specify the NT Kernel Logger session, set _InstanceName_ to **KERNEL_LOGGER_NAME**.
Properties : [var] Pointer to an initialized [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) structure. If you are using a newly initialized structure, you only need to set the **Wnode.BufferSize**, **Wnode.Guid**, **LoggerNameOffset**, and **LogFileNameOffset** members of the structure. You can use the maximum session name (1024 characters) and maximum log file name (1024 characters) lengths to calculate the buffer size and offsets if not known. On output, the structure receives the property settings and session statistics of the event tracing session, which reflect the state of the session after the flush.
%inst
The FlushTraceW (Unicode) function (evntrace.h) causes an event
tracing session to immediately deliver buffered events for the
specified session.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is one of the [system error
codes](/windows/win32/debug/system-error-codes). The following table
includes some common errors and their causes. -
**ERROR_INVALID_PARAMETER** One of the following is true: -
_Properties_ is **NULL**. - _InstanceName_ and _TraceHandle_ are both
**NULL**. - _InstanceName_ is **NULL** and _TraceHandle_ is not a
valid handle. - **ERROR_BAD_LENGTH** One of the following is true: -
The **Wnode.BufferSize** member of _Properties_ specifies an
incorrect size. - _Properties_ does not have sufficient space
allocated to hold a copy of the session name and log file name (if
used). - **ERROR_ACCESS_DENIED** Only users with administrative
privileges, users in the Performance Log Users group, and services
running as LocalSystem, LocalService, NetworkService can control
event tracing sessions. To grant a restricted user the ability to
control trace sessions, add them to the Performance Log Users group.
**Windows XP and Windows 2000:** Anyone can control a trace session.

[備考]
Event trace controllers call this function. This function is
obsolete. Instead, use
[ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew)
with _ControlCode_ set to **EVENT_TRACE_CONTROL_FLUSH**. This
function can be used with an in-memory session (a session started
with the **EVENT_TRACE_BUFFERING_MODE** flag) to write the data from
the trace to a file. You do not normally need to flush file-based or
real-time sessions because ETW will automatically flush a buffer when
it is full (i.e. when it does not have room for the next event), when
the trace session's FlushTimer expires, or when the trace session is
closed. Do not call **FlushTrace** from DllMain (may cause deadlock).
> [!NOTE] > The evntrace.h header defines FlushTrace as an alias
which > automatically selects the ANSI or Unicode version of this
function based on > the definition of the UNICODE preprocessor
constant. Mixing usage of the > encoding-neutral alias with code that
not encoding-neutral can lead to > mismatches that result in
compilation or runtime errors. For more information, > see >
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
FreeEncryptedFileMetadata
(no summary)
%group
Win32 advapi32
%prm
pbMetadata
pbMetadata : [var] 
%inst



%index
FreeEncryptionCertificateHashList
Frees a certificate hash list.
%group
Win32 advapi32
%prm
pUsers
pUsers : [var] A pointer to a certificate hash list structure, ENCRYPTION_CERTIFICATE_HASH_LIST, which was returned by the QueryUsersOnEncryptedFile or QueryRecoveryAgentsOnEncryptedFile function.
%inst
Frees a certificate hash list.

[備考]
ReFS: This function is not supported.


%index
FreeInheritedFromArray
Frees memory allocated by the GetInheritanceSource function.
%group
Win32 advapi32
%prm
pInheritArray, AceCnt, pfnArray
pInheritArray : [var] A pointer to the array of INHERITED_FROM structures returned by GetInheritanceSource.
AceCnt : [int] Number of entries in pInheritArray.
pfnArray : [var] Unused. Set to NULL.
%inst
Frees memory allocated by the GetInheritanceSource function.

[戻り値]
If the function succeeds, the function returns ERROR_SUCCESS. If the
function fails, it returns a nonzero error code defined in
WinError.h.


%index
GetAce
Obtains a pointer to an access control entry (ACE) in an access control list (ACL).
%group
Win32 advapi32
%prm
pAcl, dwAceIndex, pAce
pAcl : [var] A pointer to an ACL that contains the ACE to be retrieved.
dwAceIndex : [int] The index of the ACE to be retrieved. A value of zero corresponds to the first ACE in the ACL, a value of one to the second ACE, and so on.
pAce : [var] A pointer to a pointer that the function sets to the address of the ACE.
%inst
Obtains a pointer to an access control entry (ACE) in an access
control list (ACL).

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. To get extended error information,
call GetLastError.


%index
GetAclInformation
Retrieves information about an access control list (ACL).
%group
Win32 advapi32
%prm
pAcl, pAclInformation, nAclInformationLength, dwAclInformationClass
pAcl : [var] A pointer to an ACL. The function retrieves information about this ACL. If a null value is passed, the function causes an access violation.
pAclInformation : [intptr] A pointer to a buffer to receive the requested information. The structure that is placed into the buffer depends on the information class requested in the dwAclInformationClass parameter.
nAclInformationLength : [int] The size, in bytes, of the buffer pointed to by the pAclInformation parameter.
dwAclInformationClass : [int] A value of the ACL_INFORMATION_CLASS enumeration that indicates the class of information requested. This parameter can be one of two values from this enumeration:
%inst
Retrieves information about an access control list (ACL).

[戻り値]
If the function succeeds, the function returns nonzero.
If the function fails, it returns zero. To get extended error
information, call GetLastError.


%index
GetAuditedPermissionsFromAclW
Retrieves the audited access rights for a specified trustee. (Unicode)
%group
Win32 advapi32
%prm
pacl, pTrustee, pSuccessfulAuditedRights, pFailedAuditRights
pacl : [var] A pointer to an ACL structure from which to get the trustee's audited access rights.
pTrustee : [var] A pointer to a TRUSTEE structure that identifies the trustee. A trustee can be a user, group, or program (such as a Windows service). You can use a name or a security identifier (SID) to identify a trustee. For information about SID structures, see SID.
pSuccessfulAuditedRights : [var] A pointer to an ACCESS_MASK structure that receives the successful audit mask for rights audited for the trustee specified by the pTrustee parameter. The system generates an audit record when the trustee successfully uses any of these access rights.
pFailedAuditRights : [var] A pointer to an ACCESS_MASK structure that receives the failed audit mask for rights audited for the trustee specified by the pTrustee parameter. The system generates an audit record when the trustee fails in an attempt to use any of these rights.
%inst
Retrieves the audited access rights for a specified trustee.
(Unicode)

[戻り値]
If the function succeeds, the function returns ERROR_SUCCESS. If the
function fails, it returns a nonzero error code defined in
WinError.h.

[備考]
The GetAuditedPermissionsFromAcl function checks all system-audit
ACEs in the ACL to determine the audited rights for the trustee. For
all ACEs that specify audited rights for a group,
GetAuditedPermissionsFromAcl enumerates the members of the group to
determine whether the trustee is a member. The function returns an
error if it cannot enumerate the members of a group.
> [!NOTE] > The aclapi.h header defines GetAuditedPermissionsFromAcl
as an alias which automatically selects the ANSI or Unicode version
of this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetCurrentHwProfileW
Retrieves information about the current hardware profile for the local computer. (Unicode)
%group
Win32 advapi32
%prm
lpHwProfileInfo
lpHwProfileInfo : [var] A pointer to an HW_PROFILE_INFO structure that receives information about the current hardware profile.
%inst
Retrieves information about the current hardware profile for the
local computer. (Unicode)

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The GetCurrentHwProfile function retrieves the display name and
globally unique identifier (GUID) string for the hardware profile.
The function also retrieves the reported docking state for portable
computers with docking stations. The system generates a GUID for each
hardware profile and stores it as a string in the registry. You can
use GetCurrentHwProfile to retrieve the GUID string to use as a
registry subkey under your application's configuration settings key
in HKEY_CURRENT_USER. This enables you to store each user's settings
for each hardware profile. For example, the Colors control panel
application could use the subkey to store each user's color
preferences for different hardware profiles, such as profiles for the
docked and undocked states. Applications that use this functionality
can check the current hardware profile when they start up, and update
their settings accordingly. Applications can also update their
settings when a system device message, such as DBT_CONFIGCHANGED,
indicates that the hardware profile has changed. To compile an
application that uses this function, define the _WIN32_WINNT macro as
0x0400 or later. For more information, see Using the Windows Headers.


%index
GetDynamicTimeZoneInformationEffectiveYears
Gets a range, expressed in years, for which a DYNAMIC_TIME_ZONE_INFORMATION has valid entries.
%group
Win32 advapi32
%prm
lpTimeZoneInformation, FirstYear, LastYear
lpTimeZoneInformation : [var] Specifies settings for  a time zone and dynamic daylight saving time.
FirstYear : [var] The year that marks the beginning of the range to pass to GetTimeZoneInformationForYear.
LastYear : [var] The year that marks the end of the range to pass to GetTimeZoneInformationForYear.
%inst
Gets a range, expressed in years, for which a
DYNAMIC_TIME_ZONE_INFORMATION has valid entries.

[戻り値]
This doc was truncated.


%index
GetEffectiveRightsFromAclW
Retrieves the effective access rights that an ACL structure grants to a specified trustee. The trustee's effective access rights are the access rights that the ACL grants to the trustee or to any groups of which the trustee is a member. (Unicode)
%group
Win32 advapi32
%prm
pacl, pTrustee, pAccessRights
pacl : [var] A pointer to an ACL structure from which to get the trustee's effective access rights.
pTrustee : [var] A pointer to a TRUSTEE structure that identifies the trustee. A trustee can be a user, group, or program (such as a Windows service). You can use a name or a security identifier (SID) to identify a trustee.
pAccessRights : [var] A pointer to an ACCESS_MASK variable that receives the effective access rights of the trustee.
%inst
Retrieves the effective access rights that an ACL structure grants to
a specified trustee. The trustee's effective access rights are the
access rights that the ACL grants to the trustee or to any groups of
which the trustee is a member. (Unicode)

[戻り値]
If the function succeeds, the function returns ERROR_SUCCESS. If the
function fails, it returns a nonzero error code defined in
WinError.h.

[備考]
The GetEffectiveRightsFromAcl function checks all access-allowed and
access-denied access control entries (ACEs) in the access control
list (ACL) to determine the effective rights for the trustee. For all
ACEs that allow or deny rights to a group, GetEffectiveRightsFromAcl
enumerates the members of the group to determine whether the trustee
is a member. The function returns an error if it cannot enumerate the
members of a group. A trustee's group rights are enumerated by
GetEffectiveRightsFromAcl on the local computer, even if the trustee
is accessing objects on a remote computer. This function does not
evaluate group rights on remote computers. The
GetEffectiveRightsFromAcl function does not consider the following:
This doc was truncated.


%index
GetEncryptedFileMetadata
(no summary)
%group
Win32 advapi32
%prm
lpFileName, pcbMetadata, ppbMetadata
lpFileName : [wstr] 
pcbMetadata : [var] 
ppbMetadata : [var] 
%inst



%index
GetEventLogInformation
Retrieves information about the specified event log.
%group
Win32 advapi32
%prm
hEventLog, dwInfoLevel, lpBuffer, cbBufSize, pcbBytesNeeded
hEventLog : [intptr] A handle to the event log. The OpenEventLog or RegisterEventSource function returns this handle.
dwInfoLevel : [int] The level of event log information to return. This parameter can be the following value.
lpBuffer : [intptr] An application-allocated buffer that receives the event log information. The format of this data depends on the value of the dwInfoLevel parameter.
cbBufSize : [int] The size of the lpBuffer buffer, in bytes.
pcbBytesNeeded : [var] The function sets this parameter to the required buffer size for the requested information, regardless of whether the function succeeds. Use this value if the function fails with ERROR_INSUFFICIENT_BUFFER to allocate a buffer of the correct size.
%inst
Retrieves information about the specified event log.

[戻り値]
If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. To get extended
error information, call GetLastError.


%index
GetExplicitEntriesFromAclW
Retrieves an array of structures that describe the access control entries (ACEs) in an access control list (ACL). (Unicode)
%group
Win32 advapi32
%prm
pacl, pcCountOfExplicitEntries, pListOfExplicitEntries
pacl : [var] A pointer to an ACL structure from which to get ACE information.
pcCountOfExplicitEntries : [var] A pointer to a variable that receives the number of EXPLICIT_ACCESS structures returned in the pListOfExplicitEntries array.
pListOfExplicitEntries : [var] A pointer to a variable that receives a pointer to an array of EXPLICIT_ACCESS structures that describe the ACEs in the ACL. If the function succeeds, you must call the LocalFree function to free the returned buffer.
%inst
Retrieves an array of structures that describe the access control
entries (ACEs) in an access control list (ACL). (Unicode)

[戻り値]
If the function succeeds, the function returns ERROR_SUCCESS. If the
function fails, it returns a nonzero error code defined in
WinError.h.

[備考]
Each entry in the array of EXPLICIT_ACCESS structures describes
access control information from an ACE for a trustee. A trustee can
be a user, group, or program (such as a Windows service). Each
EXPLICIT_ACCESS structure specifies a set of access rights and an
access mode flag that indicates whether the ACE allows, denies, or
audits the specified rights. For a discretionary access control list
(DACL), the access mode flag can be either GRANT_ACCESS or
DENY_ACCESS. For information about these values, see ACCESS_MODE. For
a system access control list (SACL), the access mode flag can be
SET_AUDIT_ACCESS, SET_AUDIT_FAILURE, or both. For information about
these values, see ACCESS_MODE.
> [!NOTE] > The aclapi.h header defines GetExplicitEntriesFromAcl as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetFileSecurityW
Obtains specified information about the security of a file or directory. The information obtained is constrained by the caller's access rights and privileges. (GetFileSecurityW)
%group
Win32 advapi32
%prm
lpFileName, RequestedInformation, pSecurityDescriptor, nLength, lpnLengthNeeded
lpFileName : [wstr] A pointer to a null-terminated string that specifies the file or directory for which security information is retrieved.
RequestedInformation : [int] A SECURITY_INFORMATION value that identifies the security information being requested.
pSecurityDescriptor : [int] A pointer to a buffer that receives a copy of the security descriptor of the object specified by the lpFileName parameter. The calling process must have permission to view the specified aspects of the object's security status. The SECURITY_DESCRIPTOR structure is returned in self-relative security descriptor format.
nLength : [int] Specifies the size, in bytes, of the buffer pointed to by the pSecurityDescriptor parameter.
lpnLengthNeeded : [var] A pointer to the variable that receives the number of bytes necessary to store the complete security descriptor. If the returned number of bytes is less than or equal to nLength, the entire security descriptor is returned in the output buffer; otherwise, none of the descriptor is returned.
%inst
Obtains specified information about the security of a file or
directory. The information obtained is constrained by the caller's
access rights and privileges. (GetFileSecurityW)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
To read the owner, group, or DACL from the security descriptor for
the specified file or directory, the DACL for the file or directory
must grant READ_CONTROL access to the caller, or the caller must be
the owner of the file or directory. To read the SACL of a file or
directory, the SE_SECURITY_NAME privilege must be enabled for the
calling process.


%index
GetInheritanceSourceW
Returns information about the source of inherited access control entries (ACEs) in an access control list (ACL). (Unicode)
%group
Win32 advapi32
%prm
pObjectName, ObjectType, SecurityInfo, Container, pObjectClassGuids, GuidCount, pAcl, pfnArray, pGenericMapping, pInheritArray
pObjectName : [wstr] A pointer to the name of the object that uses the ACL to be checked.
ObjectType : [int] The type of object indicated by pObjectName. The possible values are SE_FILE_OBJECT, SE_REGISTRY_KEY, SE_DS_OBJECT, and SE_DS_OBJECT_ALL.
SecurityInfo : [int] The type of ACL used with the object. The possible values are DACL_SECURITY_INFORMATION or SACL_SECURITY_INFORMATION.
Container : [int] TRUE if the object is a container object or FALSE if the object is a leaf object. Note that the only leaf object is SE_FILE_OBJECT.
pObjectClassGuids : [var] Optional list of GUIDs that identify the object types or names associated with pObjectName. This may be NULL if the object manager only supports one object class or has no GUID associated with the object class.
GuidCount : [int] Number of GUIDs pointed to by pObjectClassGuids.
pAcl : [var] The ACL for the object.
pfnArray : [var] Reserved. Set this parameter to NULL.
pGenericMapping : [var] The mapping of generic rights to specific rights for the object.
pInheritArray : [var] A pointer to an array of INHERITED_FROM structures that the GetInheritanceSource function fills with the inheritance information. The caller must allocate enough memory for an entry for each ACE in the ACL.
%inst
Returns information about the source of inherited access control
entries (ACEs) in an access control list (ACL). (Unicode)

[戻り値]
If the function succeeds, the function returns ERROR_SUCCESS. If the
function fails, it returns a nonzero error code defined in
WinError.h.

[備考]
The GetInheritanceSource function allocates memory for the names
returned in the INHERITED_FROM structure. When the function has
finished using this memory, the calling program must free it by
calling FreeInheritedFromArray. Note that the caller must provide
memory for the array itself. If the caller allocated the memory, the
caller must free that memory after calling FreeInheritedFromArray.
This function does not handle race conditions. If your thread calls
this function at the approximate time that another thread changes the
object's security descriptor, then this function could fail.
> [!NOTE] > The aclapi.h header defines GetInheritanceSource as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetKernelObjectSecurity
Retrieves a copy of the security descriptor that protects a kernel object.
%group
Win32 advapi32
%prm
Handle, RequestedInformation, pSecurityDescriptor, nLength, lpnLengthNeeded
Handle : [intptr] A handle to a kernel object.
RequestedInformation : [int] Specifies a SECURITY_INFORMATION value that identifies the security information being requested.
pSecurityDescriptor : [int] A pointer to a buffer the function fills with a copy of the security descriptor of the specified object. The calling process must have the right to view the specified aspects of the object's security status. The SECURITY_DESCRIPTOR structure is returned in self-relative format.
nLength : [int] Specifies the size, in bytes, of the buffer pointed to by the pSecurityDescriptor parameter.
lpnLengthNeeded : [var] A pointer to a variable that receives the number of bytes required for the buffer pointed to by the pSecurityDescriptor parameter. If this variable's value is greater than the value of the nLength parameter when the function returns, none of the security descriptor is copied to the buffer.
%inst
Retrieves a copy of the security descriptor that protects a kernel
object.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
To read the owner, group, or DACL from the kernel object's security
descriptor, the calling process must have been granted READ_CONTROL
access when the handle was opened. To get READ_CONTROL access, the
caller must be the owner of the object or the object's DACL must
grant the access. To read the SACL from the security descriptor, the
calling process must have been granted ACCESS_SYSTEM_SECURITY access
when the handle was opened. The proper way to get this access is to
enable the SE_SECURITY_NAME privilege in the caller's current token,
open the handle for ACCESS_SYSTEM_SECURITY access, and then disable
the privilege.


%index
GetLengthSid
Returns the length, in bytes, of a valid security identifier (SID).
%group
Win32 advapi32
%prm
pSid
pSid : [int] A pointer to the SID structure whose length is returned. The structure is assumed to be valid.
%inst
Returns the length, in bytes, of a valid security identifier (SID).

[戻り値]
If the SID structure is valid, the return value is the length, in
bytes, of the SID structure. If the SID structure is not valid, the
return value is undefined. Before calling GetLengthSid, pass the SID
to the IsValidSid function to verify that the SID is valid.


%index
GetLocalManagedApplicationData
(no summary)
%group
Win32 advapi32
%prm
ProductCode, DisplayName, SupportUrl
ProductCode : [wstr] 
DisplayName : [var] 
SupportUrl : [var] 
%inst



%index
GetLocalManagedApplications
The GetLocalManagedApplications function can be run on the target computer to get a list of managed applications on that computer.
%group
Win32 advapi32
%prm
bUserApps, pdwApps, prgLocalApps
bUserApps : [int] A value that, if TRUE, the prgLocalApps parameter contains a list of managed applications that applies to the user.  If the value of this parameter is FALSE, the prgLocalApps parameter contains a list of managed applications that applies to the local computer.
pdwApps : [var] The address of a DWORD that specifies the number of applications in the list returned by prgLocalApps.
prgLocalApps : [var] The address of an array that contains the list of managed applications. You must call LocalFree to free this array when its contents are no longer required. This parameter cannot be null. The list is returned as a LOCALMANAGEDAPPLICATION structure.
%inst
The GetLocalManagedApplications function can be run on the target
computer to get a list of managed applications on that computer.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS.
Otherwise, the function returns one of the system error codes. For a
complete list of error codes, see System Error Codes or the header
file WinError.h.


%index
GetManagedApplicationCategories
The GetManagedApplicationCategories function gets a list of application categories for a domain. The list is the same for all users in the domain.
%group
Win32 advapi32
%prm
dwReserved, pAppCategory
dwReserved : [int] This parameter is reserved. Its value must be 0.
pAppCategory : [var] A APPCATEGORYINFOLIST structure that contains a list of application categories. This structure must be freed by calling LocalFree  when the list is no longer required.
%inst
The GetManagedApplicationCategories function gets a list of
application categories for a domain. The list is the same for all
users in the domain.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS.
Otherwise, the function returns one of the system error codes. For a
complete list of error codes, see System Error Codes or the header
file WinError.h.

[備考]
The structure returned by GetManagedApplicationCategories must be
freed by calling LocalFree when the list is no longer required.


%index
GetManagedApplications
The GetManagedApplications function gets a list of applications that are displayed in the Add pane of Add/Remove Programs (ARP) for a specified user context.
%group
Win32 advapi32
%prm
pCategory, dwQueryFlags, dwInfoLevel, pdwApps, prgManagedApps
pCategory : [var] A pointer to a GUID that specifies the  category of applications to be listed. If pCategory is not null, dwQueryFlags must   contain MANAGED_APPS_FROMCATEGORY. If pCategory is null, dwQueryFlags cannot contain MANAGED_APPS_FROMCATEGORY.
dwQueryFlags : [int] 
dwInfoLevel : [int] This parameter must be MANAGED_APPS_INFOLEVEL_DEFAULT.
pdwApps : [var] The count of applications in the list returned by this function.
prgManagedApps : [var] This parameter is a pointer to an array of MANAGEDAPPLICATION structures. This array contains the list of applications listed in the Add pane of  Add/Remove Programs (ARP). You must call LocalFree to free the array when they array is no longer required.
%inst
The GetManagedApplications function gets a list of applications that
are displayed in the Add pane of Add/Remove Programs (ARP) for a
specified user context.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS.
Otherwise, the function returns one of the system error codes. For a
complete list of error codes, see System Error Codes or the header
file WinError.h.


%index
GetMultipleTrusteeW
(no summary)
%group
Win32 advapi32
%prm
pTrustee
pTrustee : [var] 
%inst



%index
GetMultipleTrusteeOperationW
(no summary)
%group
Win32 advapi32
%prm
pTrustee
pTrustee : [var] 
%inst



%index
GetNamedSecurityInfoW
Retrieves a copy of the security descriptor for an object specified by name. (Unicode)
%group
Win32 advapi32
%prm
pObjectName, ObjectType, SecurityInfo, ppsidOwner, ppsidGroup, ppDacl, ppSacl, ppSecurityDescriptor
pObjectName : [wstr] A pointer to a null-terminated string that specifies the name of the object from which to retrieve security information. For descriptions of the string formats for the different object types, see SE_OBJECT_TYPE.
ObjectType : [int] Specifies a value from the SE_OBJECT_TYPE enumeration that indicates the type of object named by the pObjectName parameter.
SecurityInfo : [int] A set of bit flags that indicate the type of security information to retrieve. This parameter can be a combination of the SECURITY_INFORMATION bit flags.
ppsidOwner : [var] A pointer to a variable that receives a pointer to the owner SID in the security descriptor returned in ppSecurityDescriptor or NULL if the security descriptor has no owner SID. The returned pointer is valid only if you set the OWNER_SECURITY_INFORMATION flag. Also, this parameter can be NULL if you do not need the owner SID.
ppsidGroup : [var] A pointer to a variable that receives a pointer to the primary group SID in the returned security descriptor or NULL if  the security descriptor has no group SID. The returned pointer is valid only if you set the GROUP_SECURITY_INFORMATION flag. Also, this parameter can be NULL if you do not need the group SID.
ppDacl : [var] A pointer to a variable that receives a pointer to the DACL in the returned security descriptor or NULL if the security descriptor has no DACL. The returned pointer is valid only if you set the DACL_SECURITY_INFORMATION flag. Also, this parameter can be NULL if you do not need the DACL.
ppSacl : [var] A pointer to a variable that receives a pointer to the SACL in the returned security descriptor  or NULL if the security descriptor has no SACL. The returned pointer is valid only if you set the SACL_SECURITY_INFORMATION flag. Also, this parameter can be NULL if you do not need the SACL.
ppSecurityDescriptor : [var] A pointer to a variable that receives a pointer to the security descriptor of the object. When you have finished using the pointer,  free the returned buffer by calling the LocalFree function. This parameter is required if any one of the ppsidOwner, ppsidGroup, ppDacl, or ppSacl parameters is not NULL.
%inst
Retrieves a copy of the security descriptor for an object specified
by name. (Unicode)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
WinError.h.

[備考]
If any of the ppsidOwner, ppsidGroup, ppDacl, or ppSacl parameters
are non-NULL, and the SecurityInfo parameter specifies that they be
retrieved from the object, those parameters will point to the
corresponding parameters in the security descriptor returned in
ppSecurityDescriptor. If the security descriptor does not contain the
requested information, the corresponding parameter will be set to
NULL. To read the owner, group, or DACL from the object's security
descriptor, the object's DACL must grant READ_CONTROL access to the
caller, or the caller must be the owner of the object. To read the
system access control list of the object, the SE_SECURITY_NAME
privilege must be enabled for the calling process. For information
about the security implications of enabling privileges, see Running
with Special Privileges. You can use the GetNamedSecurityInfo
function with the following types of objects:
This doc was truncated.


%index
GetNumberOfEventLogRecords
Retrieves the number of records in the specified event log.
%group
Win32 advapi32
%prm
hEventLog, NumberOfRecords
hEventLog : [intptr] A handle to the open event log. The OpenEventLog or OpenBackupEventLog function returns this handle.
NumberOfRecords : [var] A pointer to a variable that receives the number of records in the specified event log.
%inst
Retrieves the number of records in the specified event log.

[戻り値]
If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. To get extended
error information, call GetLastError.

[備考]
The oldest record in an event log is not necessarily record number 1.
To determine the oldest record number in an event log, use the
GetOldestEventLogRecord function.


%index
GetOldestEventLogRecord
Retrieves the absolute record number of the oldest record in the specified event log.
%group
Win32 advapi32
%prm
hEventLog, OldestRecord
hEventLog : [intptr] A handle to the open event log. The OpenEventLog or OpenBackupEventLog function returns this handle.
OldestRecord : [var] A pointer to a variable that receives the absolute record number of the oldest record in the specified event log.
%inst
Retrieves the absolute record number of the oldest record in the
specified event log.

[戻り値]
If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. To get extended
error information, call GetLastError.

[備考]
The oldest record in an event log is not necessarily record number 1.
For more information, see Event Log Records.


%index
GetPrivateObjectSecurity
Retrieves information from a private object's security descriptor.
%group
Win32 advapi32
%prm
ObjectDescriptor, SecurityInformation, ResultantDescriptor, DescriptorLength, ReturnLength
ObjectDescriptor : [int] A pointer to a SECURITY_DESCRIPTOR structure. This is the security descriptor to be queried.
SecurityInformation : [int] A set of bit flags that indicate the parts of the security descriptor to retrieve. This parameter can be a combination of the SECURITY_INFORMATION bit flags.
ResultantDescriptor : [int] A pointer to a buffer that receives a copy of the requested information from the specified security descriptor. The SECURITY_DESCRIPTOR structure is returned in self-relative format.
DescriptorLength : [int] Specifies the size, in bytes, of the buffer pointed to by the ResultantDescriptor parameter.
ReturnLength : [var] A pointer to a variable the function sets to zero if the descriptor is copied successfully. If the buffer is too small for the security descriptor, this variable receives the number of bytes required. If this variable's value is greater than the value of the DescriptorLength parameter when the function returns, the function returns FALSE and none of the security descriptor is copied to the buffer.
%inst
Retrieves information from a private object's security descriptor.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
This function is intended for use by resource managers only. To
implement the standard access control semantics for updating security
descriptors, a resource manager should verify that the following
conditions are met before calling GetPrivateObjectSecurity:
This doc was truncated.


%index
GetSecurityDescriptorControl
Retrieves a security descriptor control and revision information.
%group
Win32 advapi32
%prm
pSecurityDescriptor, pControl, lpdwRevision
pSecurityDescriptor : [int] A pointer to a SECURITY_DESCRIPTOR structure whose control and revision information the function retrieves.
pControl : [var] A pointer to a SECURITY_DESCRIPTOR_CONTROL structure that receives the security descriptor's control information.
lpdwRevision : [var] A pointer to a variable that receives the security descriptor's revision value. This value is always set, even when GetSecurityDescriptorControl returns an error.
%inst
Retrieves a security descriptor control and revision information.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
GetSecurityDescriptorDacl
Retrieves a pointer to the discretionary access control list (DACL) in a specified security descriptor.
%group
Win32 advapi32
%prm
pSecurityDescriptor, lpbDaclPresent, pDacl, lpbDaclDefaulted
pSecurityDescriptor : [int] A pointer to the SECURITY_DESCRIPTOR structure that contains the DACL. The function retrieves a pointer to it.
lpbDaclPresent : [var] A pointer to a value that indicates the presence of a DACL in the specified security descriptor. If lpbDaclPresent is TRUE, the security descriptor contains a DACL, and the remaining output parameters in this function receive valid values. If lpbDaclPresent is FALSE, the security descriptor does not contain a DACL, and the remaining output parameters do not receive valid values. A value of TRUE for lpbDaclPresent does not mean that pDacl is not NULL.  That is, lpbDaclPresent can be TRUE while pDacl is NULL, meaning that a NULL DACL is in effect.   A NULL DACL implicitly allows all access to an object and is not the same as an empty DACL. An empty DACL permits no access to an object.  For information about creating a proper DACL, see Creating a DACL.
pDacl : [var] A pointer to a pointer to an access control list (ACL). If a DACL exists, the function sets the pointer pointed to by pDacl to the address of the security descriptor's DACL. If a DACL does not exist, no value is stored.
lpbDaclDefaulted : [var] A pointer to a flag set to the value of the SE_DACL_DEFAULTED flag in the SECURITY_DESCRIPTOR_CONTROL structure if a DACL exists for the security descriptor. If this flag is TRUE, the DACL was retrieved by a default mechanism; if FALSE, the DACL was explicitly specified by a user.
%inst
Retrieves a pointer to the discretionary access control list (DACL)
in a specified security descriptor.

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. To get extended error information,
call GetLastError.


%index
GetSecurityDescriptorGroup
Retrieves the primary group information from a security descriptor.
%group
Win32 advapi32
%prm
pSecurityDescriptor, pGroup, lpbGroupDefaulted
pSecurityDescriptor : [int] A pointer to a SECURITY_DESCRIPTOR structure whose primary group information the function retrieves.
pGroup : [var] A pointer to a pointer to a security identifier (SID) that identifies the primary group when the function returns. If the security descriptor does not contain a primary group, the function sets the pointer pointed to by pGroup to NULL and ignores the remaining output parameter, lpbGroupDefaulted. If the security descriptor contains a primary group, the function sets the pointer pointed to by pGroup to the address of the security descriptor's group SID and provides a valid value for the variable pointed to by lpbGroupDefaulted.
lpbGroupDefaulted : [var] A pointer to a flag that is set to the value of the SE_GROUP_DEFAULTED flag in the SECURITY_DESCRIPTOR_CONTROL structure when the function returns. If the value stored in the variable pointed to by the pGroup parameter is NULL, no value is set.
%inst
Retrieves the primary group information from a security descriptor.

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. To get extended error information,
call GetLastError.


%index
GetSecurityDescriptorLength
Returns the length, in bytes, of a structurally valid security descriptor. The length includes the length of all associated structures.
%group
Win32 advapi32
%prm
pSecurityDescriptor
pSecurityDescriptor : [int] A pointer to the SECURITY_DESCRIPTOR structure whose length the function returns. The pointer is assumed to be valid.
%inst
Returns the length, in bytes, of a structurally valid security
descriptor. The length includes the length of all associated
structures.

[戻り値]
If the function succeeds, the function returns the length, in bytes,
of the SECURITY_DESCRIPTOR structure. If the SECURITY_DESCRIPTOR
structure is not valid, the return value is undefined.

[備考]
The minimum length of a security descriptor is
SECURITY_DESCRIPTOR_MIN_LENGTH. A security descriptor of this length
has no associated security identifiers (SIDs) or access control lists
(ACLs).


%index
GetSecurityDescriptorOwner
Retrieves the owner information from a security descriptor.
%group
Win32 advapi32
%prm
pSecurityDescriptor, pOwner, lpbOwnerDefaulted
pSecurityDescriptor : [int] A pointer to a SECURITY_DESCRIPTOR structure whose owner information the function retrieves.
pOwner : [var] A pointer to a pointer to a security identifier (SID) that identifies the owner when the function returns. If the security descriptor does not contain an owner, the function sets the pointer pointed to by pOwner to NULL and ignores the remaining output parameter, lpbOwnerDefaulted. If the security descriptor contains an owner, the function sets the pointer pointed to by pOwner to the address of the security descriptor's owner SID and provides a valid value for the variable pointed to by lpbOwnerDefaulted.
lpbOwnerDefaulted : [var] A pointer to a flag that is set to the value of the SE_OWNER_DEFAULTED flag in the SECURITY_DESCRIPTOR_CONTROL structure when the function returns. If the value stored in the variable pointed to by the pOwner parameter is NULL, no value is set.
%inst
Retrieves the owner information from a security descriptor.

[戻り値]
If the function succeeds, the function returns nonzero.
If the function fails, it returns zero. To get extended error
information, call GetLastError.


%index
GetSecurityDescriptorRMControl
Retrieves the resource manager control bits.
%group
Win32 advapi32
%prm
SecurityDescriptor, RMControl
SecurityDescriptor : [int] A pointer to a SECURITY_DESCRIPTOR structure that contains the resource manager control bits. The value of the Control member is set to SE_RM_CONTROL_VALID.
RMControl : [var] A pointer to a buffer that receives the resource manager control bits.
%inst
Retrieves the resource manager control bits.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the following value is returned.
This doc was truncated.

[備考]
The resource manager control bits are eight bits in the Sbz1 member
of the SECURITY_DESCRIPTOR structure that contains information
specific to the resource manager accessing the structure. These bits
should be accessed only through the GetSecurityDescriptorRMControl
and SetSecurityDescriptorRMControl functions.


%index
GetSecurityDescriptorSacl
Retrieves a pointer to the system access control list (SACL) in a specified security descriptor.
%group
Win32 advapi32
%prm
pSecurityDescriptor, lpbSaclPresent, pSacl, lpbSaclDefaulted
pSecurityDescriptor : [int] A pointer to the SECURITY_DESCRIPTOR structure that contains the SACL to which the function retrieves a pointer.
lpbSaclPresent : [var] A pointer to a flag the function sets to indicate the presence of a SACL in the specified security descriptor. If this parameter is TRUE, the security descriptor contains a SACL, and the remaining output parameters in this function receive valid values. If this parameter is FALSE, the security descriptor does not contain a SACL, and the remaining output parameters do not receive valid values.
pSacl : [var] A pointer to a pointer to an access control list (ACL). If a SACL exists, the function sets the pointer pointed to by pSacl to the address of the security descriptor's SACL. If a SACL does not exist, no value is stored.
lpbSaclDefaulted : [var] A pointer to a flag that is set to the value of the SE_SACL_DEFAULTED flag in the SECURITY_DESCRIPTOR_CONTROL structure if a SACL exists for the security descriptor.
%inst
Retrieves a pointer to the system access control list (SACL) in a
specified security descriptor.

[戻り値]
If the function succeeds, the function returns nonzero.
If the function fails, it returns zero. To get extended error
information, call GetLastError.


%index
GetSecurityInfo
Retrieves a copy of the security descriptor for an object specified by a handle.
%group
Win32 advapi32
%prm
handle, ObjectType, SecurityInfo, ppsidOwner, ppsidGroup, ppDacl, ppSacl, ppSecurityDescriptor
handle : [intptr] A handle to the object from which to retrieve security information.
ObjectType : [int] SE_OBJECT_TYPE enumeration value that indicates the type of object.
SecurityInfo : [int] A set of bit flags that indicate the type of security information to retrieve. This parameter can be a combination of the SECURITY_INFORMATION bit flags.
ppsidOwner : [var] A pointer to a variable that receives a pointer to the owner SID in the security descriptor returned in ppSecurityDescriptor. The returned pointer is valid only if you set the OWNER_SECURITY_INFORMATION flag. This parameter can be NULL if you do not need the owner SID.
ppsidGroup : [var] A pointer to a variable that receives a pointer to the primary group SID in the returned security descriptor. The returned pointer is valid only if you set the GROUP_SECURITY_INFORMATION flag. This parameter can be NULL if you do not need the group SID.
ppDacl : [var] A pointer to a variable that receives a pointer to the DACL in the returned security descriptor. The returned pointer is valid only if you set the DACL_SECURITY_INFORMATION flag. This parameter can be NULL if you do not need the DACL.
ppSacl : [var] A pointer to a variable that receives a pointer to the SACL in the returned security descriptor. The returned pointer is valid only if you set the SACL_SECURITY_INFORMATION flag. This parameter can be NULL if you do not need the SACL.
ppSecurityDescriptor : [var] A pointer to a variable that receives a pointer to the security descriptor of the object. When you have finished using the pointer,  free the returned buffer by calling the LocalFree function. This parameter is required if any one of the ppsidOwner, ppsidGroup, ppDacl, or ppSacl parameters is not NULL.
%inst
Retrieves a copy of the security descriptor for an object specified
by a handle.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
WinError.h.

[備考]
If the ppsidOwner, ppsidGroup, ppDacl, and ppSacl parameters are
non-NULL, and the SecurityInfo parameter specifies that they be
retrieved from the object, those parameters will point to the
corresponding parameters in the security descriptor returned in
ppSecurityDescriptor. To read the owner, group, or DACL from the
object's security descriptor, the calling process must have been
granted READ_CONTROL access when the handle was opened. To get
READ_CONTROL access, the caller must be the owner of the object or
the object's DACL must grant the access. To read the SACL from the
security descriptor, the calling process must have been granted
ACCESS_SYSTEM_SECURITY access when the handle was opened. The proper
way to get this access is to enable the SE_SECURITY_NAME privilege in
the caller's current token, open the handle for
ACCESS_SYSTEM_SECURITY access, and then disable the privilege. For
information about the security implications of enabling privileges,
see Running with Special Privileges. You can use the GetSecurityInfo
function with the following types of objects:
This doc was truncated.


%index
GetServiceDisplayNameW
Retrieves the display name of the specified service. (Unicode)
%group
Win32 advapi32
%prm
hSCManager, lpServiceName, lpDisplayName, lpcchBuffer
hSCManager : [intptr] A handle to the service control manager database, as returned by the OpenSCManager function.
lpServiceName : [wstr] The service name. This name is the same as the service's registry key name. It is best to choose a name that is less than 256 characters.
lpDisplayName : [wstr] A pointer to a buffer that receives the service's display name. If the function fails, this buffer will contain an empty string. The maximum size of this array is 4K bytes. To determine the required size, specify NULL for this parameter and 0 for the lpcchBuffer parameter. The function will fail and GetLastError will return ERROR_INSUFFICIENT_BUFFER. The lpcchBuffer parameter will receive the required size. This parameter can specify a localized string using the following format: @[path\]dllname,-strID The string with identifier strID is loaded from dllname; the path is optional. For more information, see RegLoadMUIString. Windows Server?2003 and Windows?XP:??Localized strings are not supported until Windows?Vista.
lpcchBuffer : [var] A pointer to a variable that specifies the size of the buffer pointed to by lpDisplayName, in TCHARs.
%inst
Retrieves the display name of the specified service. (Unicode)

[戻り値]
If the functions succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
There are two names for a service: the service name and the display
name. The service name is the name of the service's key in the
registry. The display name is a user-friendly name that appears in
the Services control panel application, and is used with the NET
START command. To map the service name to the display name, use the
GetServiceDisplayName function. To map the display name to the
service name, use the GetServiceKeyName function.
> [!NOTE] > The winsvc.h header defines GetServiceDisplayName as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetServiceKeyNameW
Retrieves the service name of the specified service. (Unicode)
%group
Win32 advapi32
%prm
hSCManager, lpDisplayName, lpServiceName, lpcchBuffer
hSCManager : [intptr] A handle to the computer's service control manager database, as returned by OpenSCManager.
lpDisplayName : [wstr] The service display name. This string has a maximum length of 256 characters.
lpServiceName : [wstr] A pointer to a buffer that receives the service name. If the function fails, this buffer will contain an empty string. The maximum size of this array is 4K bytes. To determine the required size, specify NULL for this parameter and 0 for the lpcchBuffer parameter. The function will fail and GetLastError will return ERROR_INSUFFICIENT_BUFFER. The lpcchBuffer parameter will receive the required size.
lpcchBuffer : [var] A pointer to variable that specifies the size of the buffer pointed to by the lpServiceName parameter, in TCHARs. When the function returns, this parameter contains the size of the service name, in TCHARs, excluding the null-terminating character. If the buffer pointed to by lpServiceName is too small to contain the service name, the function stores no data in it. When the function returns, lpcchBuffer contains the size of the service name, excluding the NULL terminator.
%inst
Retrieves the service name of the specified service. (Unicode)

[戻り値]
If the functions succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
There are two names for a service: the service name and the display
name. The service name is the name of the service's key in the
registry. The display name is a user-friendly name that appears in
the Services control panel application, and is used with the NET
START command. Both names are specified with the CreateService
function and can be modified with the ChangeServiceConfig function.
Information specified for a service is stored in a key with the same
name as the service name under the
HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\ServiceName
registry key. To map the service name to the display name, use the
GetServiceDisplayName function. To map the display name to the
service name, use the GetServiceKeyName function.
> [!NOTE] > The winsvc.h header defines GetServiceKeyName as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetSidIdentifierAuthority
Returns a pointer to the SID_IDENTIFIER_AUTHORITY structure in a specified security identifier (SID).
%group
Win32 advapi32
%prm
pSid
pSid : [int] A pointer to the SID structure for which a pointer to the SID_IDENTIFIER_AUTHORITY structure is returned. This function does not handle SID structures that are not valid. Call the IsValidSid function to verify that the SID structure is valid before you call this function.
%inst
Returns a pointer to the SID_IDENTIFIER_AUTHORITY structure in a
specified security identifier (SID).

[戻り値]
If the function succeeds, the return value is a pointer to the
SID_IDENTIFIER_AUTHORITY structure for the specified SID structure.
If the function fails, the return value is undefined. The function
fails if the SID structure pointed to by the pSid parameter is not
valid. To get extended error information, call GetLastError.

[備考]
This function uses a 32-bit RID value. For applications that require
a larger RID value, use CreateWellKnownSid and related functions.


%index
GetSidLengthRequired
Returns the length, in bytes, of the buffer required to store a SID with a specified number of subauthorities.
%group
Win32 advapi32
%prm
nSubAuthorityCount
nSubAuthorityCount : [int] Specifies the number of subauthorities to be stored in the SID structure.
%inst
Returns the length, in bytes, of the buffer required to store a SID
with a specified number of subauthorities.

[戻り値]
The return value is the length, in bytes, of the buffer required to
store the SID structure. This function cannot fail.

[備考]
The SID structure specified in nSubAuthorityCount uses a 32-bit RID
value. For applications that require longer RID values, use
CreateWellKnownSid and related functions.


%index
GetSidSubAuthority
Returns a pointer to a specified subauthority in a security identifier (SID). The subauthority value is a relative identifier (RID).
%group
Win32 advapi32
%prm
pSid, nSubAuthority
pSid : [int] A pointer to the SID structure from which a pointer to a subauthority is to be returned. This function does not handle SID structures that are not valid. Call the IsValidSid function to verify that the SID structure is valid before you call this function.
nSubAuthority : [int] Specifies an index value identifying the subauthority array element whose address the function will return. The function performs no validation tests on this value. An application can call the GetSidSubAuthorityCount function to discover the range of acceptable values.
%inst
Returns a pointer to a specified subauthority in a security
identifier (SID). The subauthority value is a relative identifier
(RID).

[戻り値]
If the function succeeds, the return value is a pointer to the
specified SID subauthority. To get extended error information, call
GetLastError. If the function fails, the return value is undefined.
The function fails if the specified SID structure is not valid or if
the index value specified by the nSubAuthority parameter is out of
bounds.

[備考]
The SID structure specified in pSid uses a 32-bit RID value. For
applications that require longer RID values, use CreateWellKnownSid
and related functions.


%index
GetSidSubAuthorityCount
Returns a pointer to the member in a security identifier (SID) structure that contains the subauthority count.
%group
Win32 advapi32
%prm
pSid
pSid : [int] A pointer to the SID structure from which a pointer to the subauthority count is returned. This function does not handle SID structures that are not valid. Call the IsValidSid function to verify that the SID structure is valid before you call this function.
%inst
Returns a pointer to the member in a security identifier (SID)
structure that contains the subauthority count.

[戻り値]
If the function succeeds, the return value is a pointer to the
subauthority count for the specified SID structure. If the function
fails, the return value is undefined. The function fails if the
specified SID structure is not valid. To get extended error
information, call GetLastError.

[備考]
The SID structure specified in pSid uses a 32-bit value. For
applications that require longer RID values, use CreateWellKnownSid
and related functions.


%index
GetThreadWaitChain
Retrieves the wait chain for the specified thread.
%group
Win32 advapi32
%prm
WctHandle, Context, Flags, ThreadId, NodeCount, NodeInfoArray, IsCycle
WctHandle : [intptr] A handle to the WCT session created by the OpenThreadWaitChainSession function.
Context : [int] A pointer to an application-defined context structure to be passed to the callback function for an asynchronous session.
Flags : [int] 
ThreadId : [int] The identifier of the thread.
NodeCount : [var] On input, a number from 1 to WCT_MAX_NODE_COUNT that specifies the number of nodes in the wait chain. On return, the number of nodes retrieved. If the array cannot contain all the nodes of the wait chain, the function fails, GetLastError returns ERROR_MORE_DATA, and this parameter receives the number of array elements required to contain all the nodes. For asynchronous sessions, check the value that is passed to the callback function. Do not free the variable until the callback function has returned.
NodeInfoArray : [var] An array of WAITCHAIN_NODE_INFO structures that receives the wait chain. For asynchronous sessions, check the value that is passed to the callback function. Do not free the array until the callback function has returned.
IsCycle : [var] If the function detects a deadlock, this variable is set to TRUE; otherwise, it is set to FALSE. For asynchronous sessions, check the value that is passed to the callback function. Do not free the variable until the callback function has returned.
%inst
Retrieves the wait chain for the specified thread.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To retrieve extended error
information, call GetLastError.
This doc was truncated.

[備考]
If the session is asynchronous, the function returns FALSE and
GetLastError returns ERROR_IO_PENDING. To obtain the results, see the
WaitChainCallback callback function. If the specified thread is not
blocked or is blocked on an unsupported synchronization element, the
function returns a single item in NodeInfoArray. The caller must have
the SE_DEBUG_NAME privilege. If the caller has insufficient
privileges, the function fails if the first thread cannot be
accessed. Otherwise, the last node in the array will have its
ObjectStatus member set to WctStatusNoAcces. If any subset of nodes
in the array forms a cycle, the function sets the IsCycle parameter
to TRUE. Wait chain information is dynamic; it was correct when the
function was called but may be out-of-date by the time it is reviewed
by the caller.


%index
GetTokenInformation
Retrieves a specified type of information about an access token. The calling process must have appropriate access rights to obtain the information.
%group
Win32 advapi32
%prm
TokenHandle, TokenInformationClass, TokenInformation, TokenInformationLength, ReturnLength
TokenHandle : [intptr] A handle to an access token from which information is retrieved. If TokenInformationClass specifies TokenSource, the handle must have TOKEN_QUERY_SOURCE access. For all other TokenInformationClass values, the handle must have TOKEN_QUERY access.
TokenInformationClass : [int] Specifies a value from the TOKEN_INFORMATION_CLASS enumerated type to identify the type of information the function retrieves. Any callers who check the TokenIsAppContainer and have it return 0 should also verify that the caller token is not an identify level impersonation token. If the current token is not an app container but is an identity level token, you should return AccessDenied.
TokenInformation : [intptr] A pointer to a buffer the function fills with the requested information. The structure put into this buffer depends upon the type of information specified by the TokenInformationClass parameter.
TokenInformationLength : [int] Specifies the size, in bytes, of the buffer pointed to by the TokenInformation parameter. If TokenInformation is NULL, this parameter must be zero.
ReturnLength : [var] A pointer to a variable that receives the number of bytes needed for the buffer pointed to by the TokenInformation parameter. If this value is larger than the value specified in the TokenInformationLength parameter, the function fails and stores no data in the buffer. If the value of the TokenInformationClass parameter is TokenDefaultDacl and the token has no default DACL, the function sets the variable pointed to by ReturnLength to sizeof(TOKEN_DEFAULT_DACL) and sets the DefaultDacl member of the TOKEN_DEFAULT_DACL structure to NULL.
%inst
Retrieves a specified type of information about an access token. The
calling process must have appropriate access rights to obtain the
information.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
GetTrusteeFormW
Retrieves the trustee name from the specified TRUSTEE structure. This value indicates whether the structure uses a name string or a security identifier (SID) to identify the trustee. (Unicode)
%group
Win32 advapi32
%prm
pTrustee
pTrustee : [var] A pointer to a TRUSTEE structure.
%inst
Retrieves the trustee name from the specified TRUSTEE structure. This
value indicates whether the structure uses a name string or a
security identifier (SID) to identify the trustee. (Unicode)

[戻り値]
The return value is one of the constants from the TRUSTEE_FORM
enumeration.

[備考]
> [!NOTE] > The aclapi.h header defines GetTrusteeForm as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetTrusteeNameW
Retrieves the trustee name from the specified TRUSTEE structure. (Unicode)
%group
Win32 advapi32
%prm
pTrustee
pTrustee : [var] A pointer to a TRUSTEE structure.
%inst
Retrieves the trustee name from the specified TRUSTEE structure.
(Unicode)

[戻り値]
If the TrusteeForm member of the TRUSTEE structure is
TRUSTEE_IS_NAME, the return value is the pointer assigned to the
ptstrName member of the structure. If the TrusteeForm member is
TRUSTEE_IS_SID, the return value is NULL. The function does not look
up the name associated with a security identifier (SID).

[備考]
The GetTrusteeName function does not allocate any memory.
> [!NOTE] > The aclapi.h header defines GetTrusteeName as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetTrusteeTypeW
Retrieves the trustee type from the specified TRUSTEE structure. This value indicates whether the trustee is a user, a group, or the trustee type is unknown. (Unicode)
%group
Win32 advapi32
%prm
pTrustee
pTrustee : [var] A pointer to a TRUSTEE structure.
%inst
Retrieves the trustee type from the specified TRUSTEE structure. This
value indicates whether the trustee is a user, a group, or the
trustee type is unknown. (Unicode)

[戻り値]
The return value is one of the constants from the TRUSTEE_TYPE
enumeration.

[備考]
> [!NOTE] > The aclapi.h header defines GetTrusteeType as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetUserNameW
Retrieves the name of the user associated with the current thread. (Unicode)
%group
Win32 advapi32
%prm
lpBuffer, pcbBuffer
lpBuffer : [wstr] A pointer to the buffer to receive the user's logon name. If this buffer is not large enough to contain the entire user name, the function fails. A buffer size of (UNLEN + 1) characters will hold the maximum length user name including the terminating null character. UNLEN is defined in Lmcons.h.
pcbBuffer : [var] On input, this variable specifies the size of the lpBuffer buffer, in TCHARs. On output, the variable receives the number of TCHARs copied to the buffer, including the terminating null character.
%inst
Retrieves the name of the user associated with the current thread.
(Unicode)

[戻り値]
If the function succeeds, the return value is a nonzero value, and
the variable pointed to by lpnSize contains the number of TCHARs
copied to the buffer specified by lpBuffer, including the terminating
null character. If the function fails, the return value is zero. To
get extended error information, call GetLastError.

[備考]
If the current thread is impersonating another client, the
GetUserName function returns the user name of the client that the
thread is impersonating. If GetUserName is called from a process that
is running under the "NETWORK SERVICE" account, the string returned
in lpBuffer may be different depending on the version of Windows. On
Windows XP, the "NETWORK SERVICE" string is returned. On Windows
Vista, the “<HOSTNAME>$” string is returned.


%index
GetWindowsAccountDomainSid
Receives a security identifier (SID) and returns a SID representing the domain of that SID.
%group
Win32 advapi32
%prm
pSid, pDomainSid, cbDomainSid
pSid : [int] A pointer to the SID to examine.
pDomainSid : [int] Pointer that GetWindowsAccountDomainSid fills with a pointer to a SID representing the domain.
cbDomainSid : [var] A pointer to a DWORD that GetWindowsAccountDomainSid fills with the size of the domain SID, in bytes.
%inst
Receives a security identifier (SID) and returns a SID representing
the domain of that SID.

[戻り値]
Returns TRUE if successful. Otherwise, returns FALSE. For extended
error information, call GetLastError.


%index
ImpersonateAnonymousToken
Enables the specified thread to impersonate the system's anonymous logon token.
%group
Win32 advapi32
%prm
ThreadHandle
ThreadHandle : [intptr] A handle to the thread to impersonate the system's anonymous logon token. The thread handle must have the THREAD_IMPERSONATE access right in order for the thread to impersonate the system's anonymous logon token. To grant such access, the thread must be opened by calling OpenThread with the desired access right to THREAD_IMPERSONATE.
%inst
Enables the specified thread to impersonate the system's anonymous
logon token.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. An error of ACCESS_DENIED might
indicate that the token is for a restricted process. Use
[OpenProcessToken](/windows/win32/api/processthreadsapi/nf-processthreadsapi-openprocesstoken)
and
[IsTokenRestricted](/windows/win32/api/securitybaseapi/nf-securitybaseapi-istokenrestricted)
to check if the process is restricted. ACCESS_DENIED is also returned
if the thread handle lacks right access to THREAD_IMPERSONATE.

[備考]
Anonymous tokens do not include the "Everyone" Group SID unless the
system default has been overridden by setting the
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\EveryoneIncludesAnonymous
registry value to DWORD=1. To cancel the impersonation, call
RevertToSelf.


%index
ImpersonateLoggedOnUser
Lets the calling thread impersonate the security context of a logged-on user. The user is represented by a token handle.
%group
Win32 advapi32
%prm
hToken
hToken : [intptr] A handle to a primary or impersonation access token that represents a logged-on user. This can be a token handle returned by a call to LogonUser, CreateRestrictedToken, DuplicateToken, DuplicateTokenEx, OpenProcessToken, or OpenThreadToken functions. If hToken is a handle to a primary token, the token must have TOKEN_QUERY and TOKEN_DUPLICATE access. If hToken is a handle to an impersonation token, the token must have TOKEN_QUERY and TOKEN_IMPERSONATE access.
%inst
Lets the calling thread impersonate the security context of a
logged-on user. The user is represented by a token handle.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The impersonation lasts until the thread exits or until it calls
RevertToSelf. The calling thread does not need to have any particular
privileges to call ImpersonateLoggedOnUser. If the call to
ImpersonateLoggedOnUser fails, the client connection is not
impersonated and the client request is made in the security context
of the process. If the process is running as a highly privileged
account, such as LocalSystem, or as a member of an administrative
group, the user may be able to perform actions they would otherwise
be disallowed. Therefore, it is important to always check the return
value of the call, and if it fails, raise an error; do not continue
execution of the client request. All impersonate functions, including
ImpersonateLoggedOnUser allow the requested impersonation if one of
the following is true:
This doc was truncated.


%index
ImpersonateNamedPipeClient
Impersonates a named-pipe client application.
%group
Win32 advapi32
%prm
hNamedPipe
hNamedPipe : [intptr] A handle to a named pipe.
%inst
Impersonates a named-pipe client application.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The ImpersonateNamedPipeClient function allows the server end of a
named pipe to impersonate the client end. When this function is
called, the named-pipe file system changes the thread of the calling
process to start impersonating the security context of the last
message read from the pipe. Only the server end of the pipe can call
this function. The server can call the RevertToSelf function when the
impersonation is complete. Important If the
ImpersonateNamedPipeClient function fails, the client is not
impersonated, and all subsequent client requests are made in the
security context of the process that called the function. If the
calling process is running as a privileged account, it can perform
actions that the client would not be allowed to perform. To avoid
security risks, the calling process should always check the return
value. If the return value indicates that the function call failed,
no client requests should be executed. All impersonate functions,
including ImpersonateNamedPipeClient allow the requested
impersonation if one of the following is true:
This doc was truncated.


%index
ImpersonateSelf
Obtains an access token that impersonates the security context of the calling process. The token is assigned to the calling thread.
%group
Win32 advapi32
%prm
ImpersonationLevel
ImpersonationLevel : [int] Specifies a SECURITY_IMPERSONATION_LEVEL enumerated type that supplies the impersonation level of the new token.
%inst
Obtains an access token that impersonates the security context of the
calling process. The token is assigned to the calling thread.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The ImpersonateSelf function is used for tasks such as enabling a
privilege for a single thread rather than for the entire process or
for changing the default discretionary access control list (DACL) for
a single thread. The server can call the RevertToSelf function when
the impersonation is complete. For this function to succeed, the DACL
protecting the process token must grant the TOKEN_DUPLICATE right to
itself.


%index
InitializeAcl
Initializes a new ACL structure.
%group
Win32 advapi32
%prm
pAcl, nAclLength, dwAclRevision
pAcl : [var] A pointer to an ACL structure  to be initialized by this function. Allocate memory for pAcl before calling this function.
nAclLength : [int] The length, in bytes, of the buffer pointed to by the pAcl parameter. This value must be large enough to contain the ACL header and all of the access control entries (ACEs) to be stored in the ACL. In addition, this value must be DWORD-aligned. For more information about calculating the size of an ACL, see Remarks.
dwAclRevision : [int] The revision level of the ACL structure being created.
%inst
Initializes a new ACL structure.

[戻り値]
If the function succeeds, the function returns nonzero.
If the function fails, it returns zero. To get extended error
information, call GetLastError.

[備考]
The InitializeAcl function creates an empty ACL structure; the ACL
contains no ACEs. Applying an empty ACL to an object denies all
access to that object. The initial size of the ACL depends on the
number of ACEs you plan to add to the ACL before you use it. For
example, if the ACL is to contain an ACE for a user and group, you
would initialize the ACL based on two ACEs. For details about
modifying an existing ACL, see Modifying the ACLs of an Object. To
calculate the initial size of an ACL, add the following together, and
then align the result to the nearest DWORD:
This doc was truncated.


%index
InitializeSecurityDescriptor
Initializes a new security descriptor.
%group
Win32 advapi32
%prm
pSecurityDescriptor, dwRevision
pSecurityDescriptor : [int] A pointer to a SECURITY_DESCRIPTOR structure that the function initializes.
dwRevision : [int] The revision level to assign to the security descriptor. This parameter must be SECURITY_DESCRIPTOR_REVISION.
%inst
Initializes a new security descriptor.

[戻り値]
If the function succeeds, the function returns nonzero.
If the function fails, it returns zero. To get extended error
information, call GetLastError.

[備考]
The InitializeSecurityDescriptor function initializes a security
descriptor in absolute format, rather than self-relative format. The
InitializeSecurityDescriptor function initializes a security
descriptor to have no system access control list (SACL), no
discretionary access control list (DACL), no owner, no primary group,
and all control flags set to FALSE (NULL). Thus, except for its
revision level, it is empty.


%index
InitializeSid
Initializes a security identifier (SID).
%group
Win32 advapi32
%prm
Sid, pIdentifierAuthority, nSubAuthorityCount
Sid : [int] A pointer to a SID structure to be initialized.
pIdentifierAuthority : [var] A pointer to a SID_IDENTIFIER_AUTHORITY structure to set in the SID structure.
nSubAuthorityCount : [int] Specifies the number of subauthorities to set in the SID. Values of the subauthority must be set separately, as described in the following Remarks section.
%inst
Initializes a security identifier (SID).

[戻り値]
If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. To get extended
error information, call GetLastError.

[備考]
Although the InitializeSid function sets the number of subauthorities
for the SID, it does not set the subauthority values. This must be
done separately, using functions such as GetSidSubAuthority. An
application can use the AllocateAndInitializeSid function to
initialize a SID and set its subauthority values. This function uses
a 32-bit RID value. For applications that require a larger RID value,
use CreateWellKnownSid.


%index
InitiateShutdownW
Initiates a shutdown and restart of the specified computer, and restarts any applications that have been registered for restart. (Unicode)
%group
Win32 advapi32
%prm
lpMachineName, lpMessage, dwGracePeriod, dwShutdownFlags, dwReason
lpMachineName : [wstr] The name of the computer to be shut down. If the value of this parameter is NULL, the local computer is shut down.
lpMessage : [wstr] The message to be displayed in the interactive shutdown dialog box.
dwGracePeriod : [int] The number of seconds to wait before shutting down the computer. If the value of this parameter is zero, the computer is shut down immediately. This value is limited to MAX_SHUTDOWN_TIMEOUT. If the value of this parameter is greater than zero, and the dwShutdownFlags parameter specifies the flag SHUTDOWN_GRACE_OVERRIDE, the function fails and returns the error code ERROR_BAD_ARGUMENTS.
dwShutdownFlags : [int] One or more bit flags that specify options for the shutdown. The following values are defined.
dwReason : [int] The reason for initiating the shutdown. This parameter must be one of the system shutdown reason codes. If this parameter is zero, the default is an undefined shutdown that is logged as "No title for this reason could be found". By default, it is also an unplanned shutdown. Depending on how the system is configured, an unplanned shutdown triggers the creation of a file that contains the system state information, which can delay shutdown. Therefore, do not use zero for this parameter.
%inst
Initiates a shutdown and restart of the specified computer, and
restarts any applications that have been registered for restart.
(Unicode)

[戻り値]
If the function succeeds, it returns ERROR_SUCCESS. If the function
fails, it returns one of the following error codes.
This doc was truncated.

[備考]
To shut down the local computer, the calling thread must have the
SE_SHUTDOWN_NAME privilege. To shut down a remote computer, the
calling thread must have the SE_REMOTE_SHUTDOWN_NAME privilege on the
remote computer. By default, users can enable the SE_SHUTDOWN_NAME
privilege on the computer they are logged onto, and administrators
can enable the SE_REMOTE_SHUTDOWN_NAME privilege on remote computers.
For more information, see Running with Special Privileges. Common
reasons for failure include an invalid or inaccessible computer name
or insufficient privilege. The error ERROR_SHUTDOWN_IN_PROGRESS is
returned if a shutdown is already in progress on the specified
computer. The error ERROR_NOT_READY can be returned if fast-user
switching is enabled but no user is logged on. A non-zero return
value does not mean the logoff was or will be successful. The
shutdown is an asynchronous process, and it can occur long after the
API call has returned, or not at all. Even if the timeout value is
zero, the shutdown can still be aborted by applications, services, or
even the system. The non-zero return value indicates that the
validation of the rights and parameters was successful and that the
system accepted the shutdown request.
> [!NOTE] > The winreg.h header defines InitiateShutdown as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
InitiateSystemShutdownW
Initiates a shutdown and optional restart of the specified computer. (Unicode)
%group
Win32 advapi32
%prm
lpMachineName, lpMessage, dwTimeout, bForceAppsClosed, bRebootAfterShutdown
lpMachineName : [wstr] The network name of the computer to be shut down. If lpMachineName is NULL or an empty string, the function shuts down the local computer.
lpMessage : [wstr] The  message to be displayed in the shutdown dialog box. This parameter can be NULL if no message is required. Windows Server?2003 and Windows?XP:??This string is also stored as a comment in the event log entry. Windows Server?2003 and Windows?XP with SP1:??The string is limited to 3072 TCHARs.
dwTimeout : [int] The length of time that the shutdown dialog box should be displayed, in seconds. While this dialog box is displayed, the shutdown can be stopped by the AbortSystemShutdown function. If dwTimeout is not zero, InitiateSystemShutdown displays a dialog box on the specified computer. The dialog box displays the name of the user who called the function, displays the message specified by the lpMessage parameter, and prompts the user to log off. The dialog box beeps when it is created and remains on top of other windows in the system. The dialog box can be moved but not closed. A timer counts down the remaining time before a forced shutdown. If dwTimeout is zero, the computer shuts down without displaying the dialog box, and the shutdown cannot be stopped by AbortSystemShutdown. Windows Server?2003 and Windows?XP with SP1:??The time-out value is limited to MAX_SHUTDOWN_TIMEOUT seconds. Windows Server?2003 and Windows?XP with SP1:??If the computer to be shut down is a Terminal Services server, the system displays a dialog box to all local and remote users warning them that shutdown has been initiated. The dialog box includes who requested the shutdown, the display message (see lpMessage), and how much time there is until the server is shut down.
bForceAppsClosed : [int] If this parameter is TRUE, applications with unsaved changes are to be forcibly closed. Note that this can result in data loss. If this parameter is FALSE, the system displays a dialog box instructing the user to close the applications.
bRebootAfterShutdown : [int] If this parameter is TRUE, the computer is to restart immediately after shutting down. If this parameter is FALSE, the system flushes all caches to disk  and  safely powers down the system.
%inst
Initiates a shutdown and optional restart of the specified computer.
(Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
To shut down the local computer, the calling thread must have the
SE_SHUTDOWN_NAME privilege. To shut down a remote computer, the
calling thread must have the SE_REMOTE_SHUTDOWN_NAME privilege on the
remote computer. By default, users can enable the SE_SHUTDOWN_NAME
privilege on the computer they are logged onto, and administrators
can enable the SE_REMOTE_SHUTDOWN_NAME privilege on remote computers.
For more information, see Running with Special Privileges. Common
reasons for failure include an invalid or inaccessible computer name
or insufficient privilege. The error ERROR_SHUTDOWN_IN_PROGRESS is
returned if a shutdown is already in progress on the specified
computer. The error ERROR_NOT_READY can be returned if fast-user
switching is enabled but no user is logged on. A non-zero return
value does not mean the logoff was or will be successful. The
shutdown is an asynchronous process, and it can occur long after the
API call has returned, or not at all. Even if the timeout value is
zero, the shutdown can still be aborted by applications, services or
even the system. The non-zero return value indicates that the
validation of the rights and parameters was successful and that the
system accepted the shutdown request. When this function is called,
the caller must specify whether or not applications with unsaved
changes should be forcibly closed. If the caller chooses not to force
these applications closed, and an application with unsaved changes is
running on the console session, the shutdown will remain in progress
until the user logged into the console session aborts the shutdown,
saves changes, closes the application, or forces the application to
close. During this period, the shutdown may not be aborted except by
the console user, and another shutdown may not be initiated. Note
that calling this function with the value of the bForceAppsClosed
parameter set to TRUE avoids this situation. Remember that doing this
may result in loss of data. Windows Server 2003 and Windows XP: If
the computer is locked and the bForceAppsClosed parameter is FALSE,
the last error code is ERROR_MACHINE_LOCKED. If the system is not
ready to handle the request, the last error code is ERROR_NOT_READY.
The application should wait a short while and retry the call. For
example, the system can be unready to initiate a shutdown, and return
ERROR_NOT_READY, if the shutdown request comes at the same time a
user tries to log onto the system. In this case, the application
should wait a short while and retry the call.


%index
InitiateSystemShutdownExW
Initiates a shutdown and optional restart of the specified computer, and optionally records the reason for the shutdown. (Unicode)
%group
Win32 advapi32
%prm
lpMachineName, lpMessage, dwTimeout, bForceAppsClosed, bRebootAfterShutdown, dwReason
lpMachineName : [wstr] The network name of the computer to be shut down. If lpMachineName is NULL or an empty string, the function shuts down the local computer.
lpMessage : [wstr] The message to be displayed in the shutdown dialog box. This parameter can be NULL if no message is required.
dwTimeout : [int] The length of time that the shutdown dialog box should be displayed, in seconds. While this dialog box is displayed, shutdown can be stopped by the AbortSystemShutdown function.
bForceAppsClosed : [int] If this parameter is TRUE, applications with unsaved changes are to be forcibly closed. If this parameter is FALSE, the system displays a dialog box instructing the user to close the applications.
bRebootAfterShutdown : [int] If this parameter is TRUE, the computer is to restart immediately after shutting down. If this parameter is FALSE, the system flushes all caches to disk  and  safely powers down the system.
dwReason : [int] The reason for initiating the shutdown. This parameter must be one of the system shutdown reason codes.
%inst
Initiates a shutdown and optional restart of the specified computer,
and optionally records the reason for the shutdown. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
To shut down the local computer, the calling thread must have the
SE_SHUTDOWN_NAME privilege. To shut down a remote computer, the
calling thread must have the SE_REMOTE_SHUTDOWN_NAME privilege on the
remote computer. By default, users can enable the SE_SHUTDOWN_NAME
privilege on the computer they are logged onto, and administrators
can enable the SE_REMOTE_SHUTDOWN_NAME privilege on remote computers.
For more information, see Running with Special Privileges. Common
reasons for failure include an invalid or inaccessible computer name
or insufficient privilege. The error ERROR_SHUTDOWN_IN_PROGRESS is
returned if a shutdown is already in progress on the specified
computer. The error ERROR_NOT_READY can be returned if fast-user
switching is enabled but no user is logged on. A non-zero return
value does not mean the logoff was or will be successful. The
shutdown is an asynchronous process, and it can occur long after the
API call has returned, or not at all. Even if the timeout value is
zero, the shutdown can still be aborted by applications, services, or
even the system. The non-zero return value indicates that the
validation of the rights and parameters was successful and that the
system accepted the shutdown request. When this function is called,
the caller must specify whether or not applications with unsaved
changes should be forcibly closed. If the caller chooses not to force
these applications to close and an application with unsaved changes
is running on the console session, the shutdown will remain in
progress until the user logged into the console session aborts the
shutdown, saves changes, closes the application, or forces the
application to close. During this period the shutdown may not be
aborted except by the console user, and another shutdown may not be
initiated. Note that calling this function with the value of the
bForceAppsClosed parameter set to TRUE avoids this situation.
Remember that doing this may result in loss of data. Windows Server
2003 and Windows XP: If the computer is locked and the
bForceAppsClosed parameter is FALSE, the last error code is
ERROR_MACHINE_LOCKED. If the system is not ready to handle the
request, the last error code is ERROR_NOT_READY. The application
should wait a short while and retry the call. For example, the system
can be unready to initiate a shutdown, and return ERROR_NOT_READY, if
the shutdown request comes at the same time a user tries to log onto
the system. In this case, the application should wait a short while
and retry the call.
> [!NOTE] > The winreg.h header defines InitiateSystemShutdownEx as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
InstallApplication
The InstallApplication function can install applications that have been deployed to target users that belong to a domain.
%group
Win32 advapi32
%prm
pInstallInfo
pInstallInfo : [var] A pointer to a INSTALLDATA structure that specifies the application to install.
%inst
The InstallApplication function can install applications that have
been deployed to target users that belong to a domain.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS.
Otherwise, the function returns one of the system error codes. For a
complete list of error codes, see System Error Codes or the header
file WinError.h.

[備考]
The InstallApplication function can only install applications that
have been deployed by using Group Policy. A domain administrator can
deploy applications to target users by using the user configuration
section of Group Policy Objects (GPO). The target user must belong to
the target domain and the GPO must apply to this user in the target
domain. The InstallApplication function installs applications
according to standard Group Policy inheritance rules. If the same
application is deployed in multiple GPOs, the function installs the
version of the application deployed in the highest precedence GPO.
After an application has been installed for a user, it is not visible
to other users on the computer. This is standard for applications
that are deployed through user group policy. The InstallApplication
function can install deployed applications that use Windows Installer
(.msi files) or software installation settings (.zap files) to handle
setup and installation. The InstallApplication function can install
applications that use a Windows Installer package for their
installation. In this case, the user calling InstallApplication is
not required to have administrator privileges. The system can install
the application because the Windows Installer is a trusted
application deployed by a domain administrator. The user that
receives the application must have access to the location of the .msi
files. Remove applications installed using .msi files by calling the
Windows Installer function MsiConfigureProduct to uninstall the
application. Then call UninstallApplication to inform the system that
the application is no longer managed on the client by Group Policy.
UninstallApplication should be called even if the uninstall fails
because this enables the system to keep the Resultant Set of Policy
(RSoP) accurate. The InstallApplication function can also install
applications that use setup applications based on software
installation settings (.zap files). The user that receives the
application must have access to the location of the .zap files. A
.zap file is a text file similar to an .ini file, which enables
Windows to publish an application (for example, Setup.exe) for
installation with Add or Remove Programs. To publish applications
that do not use the Windows Installer, you must create a .zap file,
copy the .zap file to the software distribution point servers, and
then use Group Policy?based software deployment to publish the
application for users. If the application is deployed using .zap
files, the user installing the application must have privileges on
the machine to install the software. You cannot use .zap files for
assigned applications. Remove applications using software
installation settings (.zap files) by calling the uninstall function
or a command specific for the installation application. For
information about using installation applications other than the
Windows Installer see article 231747, "How to Publish non-MSI
Programs with .zap Files," in the Microsoft Knowledge Base.


%index
IsTextUnicode
Determines if a buffer is likely to contain a form of Unicode text.
%group
Win32 advapi32
%prm
lpv, iSize, lpiResult
lpv : [intptr] Pointer to the input buffer to examine.
iSize : [int] Size, in bytes, of the input buffer indicated by lpv.
lpiResult : [var] On input, pointer to the tests to apply to the input buffer text. On output, this parameter receives the results of the specified tests: 1 if the contents of the buffer pass a test, 0 for failure. Only flags that are set upon input to the function are significant upon output. If lpiResult is NULL, the function uses all available tests to determine if the data in the buffer is likely to be Unicode text.
%inst
Determines if a buffer is likely to contain a form of Unicode text.

[戻り値]
Returns a nonzero value if the data in the buffer passes the
specified tests. The function returns 0 if the data in the buffer
does not pass the specified tests.

[備考]
This function uses various statistical and deterministic methods to
make its determination, under the control of flags passed in the
lpiResult parameter. When the function returns, the results of such
tests are reported using the same parameter. The
IS_TEXT_UNICODE_STATISTICS and IS_TEXT_UNICODE_REVERSE_STATISTICS
tests use statistical analysis. These tests are not foolproof. The
statistical tests assume certain amounts of variation between low and
high bytes in a string, and some ASCII strings can slip through. For
example, if lpv indicates the ASCII string 0x41, 0x0A, 0x0D, 0x1D
(A\n\r^Z), the string passes the IS_TEXT_UNICODE_STATISTICS test,
although failure would be preferable.


%index
IsTokenRestricted
Indicates whether a token contains a list of restricted security identifiers (SIDs).
%group
Win32 advapi32
%prm
TokenHandle
TokenHandle : [intptr] A handle to an access token to test.
%inst
Indicates whether a token contains a list of restricted security
identifiers (SIDs).

[戻り値]
If the token contains a list of restricting SIDs, the return value is
nonzero. If the token does not contain a list of restricting SIDs,
the return value is zero. If an error occurs, the return value is
zero. To get extended error information, call GetLastError.

[備考]
The CreateRestrictedToken function can restrict a token by disabling
SIDs, deleting privileges, and specifying a list of restricting SIDs.
The IsTokenRestricted function checks only for the list of
restricting SIDs. If a token does not have any restricting SIDs,
IsTokenRestricted returns FALSE, even though the token was created by
a call to CreateRestrictedToken.


%index
IsTokenUntrusted
(no summary)
%group
Win32 advapi32
%prm
TokenHandle
TokenHandle : [intptr] 
%inst



%index
IsValidAcl
Validates an access control list (ACL).
%group
Win32 advapi32
%prm
pAcl
pAcl : [var] A pointer to an ACL structure validated by this function. This value must not be NULL.
%inst
Validates an access control list (ACL).

[戻り値]
If the ACL is valid, the function returns nonzero.
If the ACL is not valid, the function returns zero. There is no
extended error information for this function; do not call
GetLastError.

[備考]
This function checks the revision level of the ACL and verifies that
the number of access control entries (ACEs) specified in the AceCount
member of the ACL structure fits the space specified by the AclSize
member of the ACL structure. If pAcl is NULL, the application will
fail with an access violation.


%index
IsValidSecurityDescriptor
Determines whether the components of a security descriptor are valid.
%group
Win32 advapi32
%prm
pSecurityDescriptor
pSecurityDescriptor : [int] A pointer to a SECURITY_DESCRIPTOR structure that the function validates.
%inst
Determines whether the components of a security descriptor are valid.

[戻り値]
If the components of the security descriptor are valid, the return
value is nonzero. If any of the components of the security descriptor
are not valid, the return value is zero. There is no extended error
information for this function; do not call GetLastError.

[備考]
The IsValidSecurityDescriptor function checks the validity of the
components that are present in the security descriptor. It does not
verify whether certain components are present nor does it verify the
contents of the individual ACE or ACL.


%index
IsValidSid
Validates a security identifier (SID) by verifying that the revision number is within a known range, and that the number of subauthorities is less than the maximum.
%group
Win32 advapi32
%prm
pSid
pSid : [int] A pointer to the SID structure to validate. This parameter cannot be NULL.
%inst
Validates a security identifier (SID) by verifying that the revision
number is within a known range, and that the number of subauthorities
is less than the maximum.

[戻り値]
If the SID structure is valid, the return value is nonzero. If the
SID structure is not valid, the return value is zero. There is no
extended error information for this function; do not call
GetLastError.

[備考]
If pSid is NULL, the application will fail with an access violation.


%index
IsWellKnownSid
Compares a SID to a well-known SID and returns TRUE if they match.
%group
Win32 advapi32
%prm
pSid, WellKnownSidType
pSid : [int] A pointer to the SID to test.
WellKnownSidType : [int] Member of the WELL_KNOWN_SID_TYPE enumeration to compare with the SID at pSid.
%inst
Compares a SID to a well-known SID and returns TRUE if they match.

[戻り値]
Returns TRUE if the SID at pSid matches the well-known SID indicated
by WellKnownSidType. Otherwise, returns FALSE.


%index
LockServiceDatabase
Requests ownership of the service control manager (SCM) database lock. Only one process can own the lock at any specified time.
%group
Win32 advapi32
%prm
hSCManager
hSCManager : [intptr] A handle to the SCM database. This handle is returned by the OpenSCManager function, and must have the SC_MANAGER_LOCK access right. For more information, see Service Security and Access Rights.
%inst
Requests ownership of the service control manager (SCM) database
lock. Only one process can own the lock at any specified time.

[戻り値]
If the function succeeds, the return value is a lock to the specified
SCM database. If the function fails, the return value is NULL. To get
extended error information, call GetLastError. The following error
codes can be set by the SCM. Other error codes can be set by registry
functions that are called by the SCM.
This doc was truncated.

[備考]
A lock is a protocol used by setup and configuration programs and the
SCM to serialize access to the service tree in the registry. The only
time the SCM requests ownership of the lock is when it is starting a
service. A program that acquires the SCM database lock and fails to
release it prevents the SCM from starting other services. Because of
the severity of this issue, processes are no longer allowed to lock
the database. For compatibility with older applications, the
LockServiceDatabase function returns a lock but has no other effect.
Windows Server 2003 and Windows XP: Acquiring the SCM database lock
prevents the SCM from starting a service until the lock is released.
For example, a program that must configure several related services
before any of them starts could call LockServiceDatabase before
configuring the first service. Alternatively, it could ensure that
none of the services are started until the configuration has been
completed. A call to the StartService function to start a service in
a locked database fails. No other SCM functions are affected by a
lock. The lock is held until the SC_LOCK handle is specified in a
subsequent call to the UnlockServiceDatabase function. If a process
that owns a lock terminates, the SCM automatically cleans up and
releases ownership of the lock. Failing to release the lock can cause
system problems. A process that acquires the lock should release it
as soon as possible.


%index
LogonUserW
The Win32 LogonUser function attempts to log a user on to the local computer. LogonUser returns a handle to a user token that you can use to impersonate user. (Unicode)
%group
Win32 advapi32
%prm
lpszUsername, lpszDomain, lpszPassword, dwLogonType, dwLogonProvider, phToken
lpszUsername : [wstr] A pointer to a null-terminated string that specifies the name of the user. This is the name of the user account to log on to. If you use the user principal name (UPN) format, User@DNSDomainName, the lpszDomain parameter must be NULL.
lpszDomain : [wstr] A pointer to a null-terminated string that specifies the name of the domain or server whose account database contains the lpszUsername account. If this parameter is NULL, the user name must be specified in UPN format. If this parameter is ".", the function validates the account by using only the local account database.
lpszPassword : [wstr] A pointer to a null-terminated string that specifies the plaintext password for the user account specified by lpszUsername.  When you have finished using the password, clear the password from memory by calling the SecureZeroMemory function. For more information about protecting passwords, see Handling Passwords.
dwLogonType : [int] 
dwLogonProvider : [int] 
phToken : [intptr] A pointer to a handle variable that receives a handle to a token that represents the specified user. You can use the returned handle in calls to the ImpersonateLoggedOnUser function. In most cases, the returned handle is a primary token that you can use in calls to the CreateProcessAsUser function. However, if you specify the LOGON32_LOGON_NETWORK flag, LogonUser returns an impersonation token that you cannot use in CreateProcessAsUser unless you call DuplicateTokenEx to convert it to a primary token. When you no longer need this handle, close it by calling the CloseHandle function.
%inst
The Win32 LogonUser function attempts to log a user on to the local
computer. LogonUser returns a handle to a user token that you can use
to impersonate user. (Unicode)

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. To get extended error information,
call GetLastError.

[備考]
The LOGON32_LOGON_NETWORK logon type is fastest, but it has the
following limitations:
This doc was truncated.


%index
LogonUserExW
The LogonUserEx function attempts to log a user on to the local computer. (Unicode)
%group
Win32 advapi32
%prm
lpszUsername, lpszDomain, lpszPassword, dwLogonType, dwLogonProvider, phToken, ppLogonSid, ppProfileBuffer, pdwProfileLength, pQuotaLimits
lpszUsername : [wstr] A pointer to a null-terminated string that specifies the name of the user. This is the name of the user account to log on to. If you use the user principal name (UPN) format, user@DNS_domain_name, the lpszDomain parameter must be NULL.
lpszDomain : [wstr] A pointer to a null-terminated string that specifies the name of the domain or server whose account database contains the lpszUsername account. If this parameter is NULL, the user name must be specified in UPN format. If this parameter is ".", the function validates the account by using only the local account database.
lpszPassword : [wstr] A pointer to a null-terminated string that specifies the plaintext password for the user account specified by lpszUsername.  When you have finished using the password, clear the password from memory by calling the SecureZeroMemory function. For more information about protecting passwords, see Handling Passwords.
dwLogonType : [int] 
dwLogonProvider : [int] 
phToken : [intptr] A pointer to a handle variable that receives a handle to a token that represents the specified user. You can use the returned handle in calls to the ImpersonateLoggedOnUser function. In most cases, the returned handle is a primary token that you can use in calls to the CreateProcessAsUser function. However, if you specify the LOGON32_LOGON_NETWORK flag, LogonUserEx returns an impersonation token that you cannot use in CreateProcessAsUser unless you call DuplicateTokenEx to convert the impersonation token to a primary token. When you no longer need this handle, close it by calling the CloseHandle function.
ppLogonSid : [var] A pointer to a pointer to a security identifier (SID) that receives the SID of the user logged on. When you have finished using the SID, free it by calling the LocalFree function.
ppProfileBuffer : [var] A pointer to a pointer that receives the address of a buffer that contains the logged on user's profile.
pdwProfileLength : [var] A pointer to a DWORD that receives the length of the profile buffer.
pQuotaLimits : [var] A pointer to a QUOTA_LIMITS structure that receives information about the quotas for the logged on user.
%inst
The LogonUserEx function attempts to log a user on to the local
computer. (Unicode)

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. To get extended error information,
call GetLastError.

[備考]
The LOGON32_LOGON_NETWORK logon type is fastest, but it has the
following limitations:
This doc was truncated.


%index
LookupAccountNameW
Accepts the name of a system and an account as input. It retrieves a security identifier (SID) for the account and the name of the domain on which the account was found. (Unicode)
%group
Win32 advapi32
%prm
lpSystemName, lpAccountName, Sid, cbSid, ReferencedDomainName, cchReferencedDomainName, peUse
lpSystemName : [wstr] A pointer to a null-terminated character string that specifies the name of the system. This string can be the name of a remote computer. If this string is NULL, the account name translation begins on the local system. If the name cannot be resolved on the local system, this function will try to resolve the name using domain controllers trusted by the local system. Generally, specify a value for  lpSystemName only when the  account is in an untrusted domain and the   name of a computer in that domain is known.
lpAccountName : [wstr] A pointer to a null-terminated string that specifies the account name. Use a fully qualified string in the domain_name\user_name format to ensure that LookupAccountName finds the account in the desired domain.
Sid : [int] A pointer to a buffer that receives the SID structure that corresponds to the account name pointed to by the lpAccountName parameter. If this parameter is NULL, cbSid must be zero.
cbSid : [var] A pointer to a variable. On input, this value specifies the size, in bytes, of the Sid buffer. If the function fails because the buffer is too small or if cbSid is zero, this variable receives the required buffer size.
ReferencedDomainName : [wstr] A pointer to a buffer that receives the name of the domain where the account name is found. For computers that are not joined to a domain, this buffer receives the computer name. If this parameter is NULL, the function returns the required buffer size.
cchReferencedDomainName : [var] A pointer to a variable. On input, this value specifies the size, in TCHARs, of the ReferencedDomainName buffer. If the function fails because the buffer is too small, this variable receives the required buffer size, including the terminating null character. If the ReferencedDomainName parameter is NULL, this parameter must be zero.
peUse : [var] A pointer to a SID_NAME_USE enumerated type that indicates the type of the account when the function returns.
%inst
Accepts the name of a system and an account as input. It retrieves a
security identifier (SID) for the account and the name of the domain
on which the account was found. (Unicode)

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. For extended error information, call
GetLastError.

[備考]
The LookupAccountName function attempts to find a SID for the
specified name by first checking a list of well-known SIDs. If the
name does not correspond to a well-known SID, the function checks
built-in and administratively defined local accounts. Next, the
function checks the primary domain. If the name is not found there,
trusted domains are checked. Use fully qualified account names (for
example, domain_name\user_name) instead of isolated names (for
example, user_name). Fully qualified names are unambiguous and
provide better performance when the lookup is performed. This
function also supports fully qualified DNS names (for example,
example.example.com\user_name) and user principal names (UPN) (for
example, someone@example.com). In addition to looking up local
accounts, local domain accounts, and explicitly trusted domain
accounts, LookupAccountName can look up the name for any account in
any domain in the forest.
> [!NOTE] > The winbase.h header defines LookupAccountName as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
LookupAccountSidW
Accepts a security identifier (SID) as input. It retrieves the name of the account for this SID and the name of the first domain on which this SID is found. (Unicode)
%group
Win32 advapi32
%prm
lpSystemName, Sid, Name, cchName, ReferencedDomainName, cchReferencedDomainName, peUse
lpSystemName : [wstr] A pointer to a null-terminated character string that specifies the target computer. This string can be the name of a remote computer. If this parameter is NULL, the account name translation begins on the local system. If the name cannot be resolved on the local system, this function will try to resolve the name using domain controllers trusted by the local system. Generally, specify a value for  lpSystemName only when the  account is in an untrusted domain and the   name of a computer in that domain is known.
Sid : [int] A pointer to the SID to look up.
Name : [wstr] A pointer to a buffer that receives a null-terminated string that contains the account name that corresponds to the lpSid parameter.
cchName : [var] On input, specifies the size, in TCHARs, of the lpName buffer. If the function fails because the buffer is too small or if cchName is zero, cchName receives the required buffer size, including the terminating null character.
ReferencedDomainName : [wstr] A pointer to a buffer that receives a null-terminated string that contains the name of the domain where the account name was found. On a server, the domain name returned for most accounts in the security database of the local computer is the name of the domain for which the server is a domain controller.
cchReferencedDomainName : [var] On input, specifies the size, in TCHARs, of the lpReferencedDomainName buffer. If the function fails because the buffer is too small or if cchReferencedDomainName is zero, cchReferencedDomainName receives the required buffer size, including the terminating null character.
peUse : [var] A pointer to a variable that receives a SID_NAME_USE value that indicates the type of the account.
%inst
Accepts a security identifier (SID) as input. It retrieves the name
of the account for this SID and the name of the first domain on which
this SID is found. (Unicode)

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. To get extended error information,
call GetLastError.

[備考]
The LookupAccountSid function attempts to find a name for the
specified SID by first checking a list of well-known SIDs. If the
supplied SID does not correspond to a well-known SID, the function
checks built-in and administratively defined local accounts. Next,
the function checks the primary domain. Security identifiers not
recognized by the primary domain are checked against the trusted
domains that correspond to their SID prefixes. If the function cannot
find an account name for the SID, GetLastError returns
ERROR_NONE_MAPPED. This can occur if a network time-out prevents the
function from finding the name. It also occurs for SIDs that have no
corresponding account name, such as a logon SID that identifies a
logon session. In addition to looking up SIDs for local accounts,
local domain accounts, and explicitly trusted domain accounts,
LookupAccountSid can look up SIDs for any account in any domain in
the forest, including SIDs that appear only in the SIDhistory field
of an account in the forest. The SIDhistory field stores former SIDs
of an account that has been moved from another domain. To look up a
SID, LookupAccountSid queries the global catalog of the forest.


%index
LookupPrivilegeDisplayNameW
Retrieves the display name that represents a specified privilege. (Unicode)
%group
Win32 advapi32
%prm
lpSystemName, lpName, lpDisplayName, cchDisplayName, lpLanguageId
lpSystemName : [wstr] A pointer to a null-terminated string that specifies the name of the system on which the  privilege name is retrieved. If a null string is specified, the function attempts to find the display name on the local system.
lpName : [wstr] A pointer to a null-terminated string that specifies the name of the privilege, as defined in Winnt.h. For example, this parameter could specify the constant, SE_REMOTE_SHUTDOWN_NAME, or its corresponding string, "SeRemoteShutdownPrivilege". For a list of values, see Privilege Constants.
lpDisplayName : [wstr] A pointer to a buffer that receives a null-terminated string that specifies the privilege display name. For example, if the lpName parameter is SE_REMOTE_SHUTDOWN_NAME, the privilege display name is "Force shutdown from a remote system."
cchDisplayName : [var] A pointer to a variable that specifies the size, in TCHARs, of the lpDisplayName buffer. When the function returns, this parameter contains the length of the privilege display name, not including the terminating null character. If the buffer pointed to by the lpDisplayName parameter is too small, this variable contains the required size.
lpLanguageId : [var] A pointer to a variable that receives the language identifier for the returned display name.
%inst
Retrieves the display name that represents a specified privilege.
(Unicode)

[戻り値]
If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. To get extended
error information, call GetLastError.

[備考]
The LookupPrivilegeDisplayName function retrieves display names only
for the privileges specified in the Defined Privileges section of
Winnt.h.
> [!NOTE] > The winbase.h header defines LookupPrivilegeDisplayName
as an alias which automatically selects the ANSI or Unicode version
of this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
LookupPrivilegeNameW
Retrieves the name that corresponds to the privilege represented on a specific system by a specified locally unique identifier (LUID). (Unicode)
%group
Win32 advapi32
%prm
lpSystemName, lpLuid, lpName, cchName
lpSystemName : [wstr] A pointer to a null-terminated string that specifies the name of the system on which the privilege name is retrieved. If a null string is specified, the function attempts to find the privilege name on the local system.
lpLuid : [var] A pointer to the LUID by which the privilege is known on the target system.
lpName : [wstr] A pointer to a buffer that receives a null-terminated string that represents the privilege name. For example, this string could be "SeSecurityPrivilege".
cchName : [var] A pointer to a variable that specifies the size, in a TCHAR value, of the lpName buffer. When the function returns, this parameter contains the length of the privilege name, not including the terminating null character. If the buffer pointed to by the lpName parameter is too small, this variable contains the required size.
%inst
Retrieves the name that corresponds to the privilege represented on a
specific system by a specified locally unique identifier (LUID).
(Unicode)

[戻り値]
If the function succeeds, the function returns nonzero.
If the function fails, it returns zero. To get extended error
information, call GetLastError.

[備考]
The LookupPrivilegeName function supports only the privileges
specified in the Defined Privileges section of Winnt.h. For a list of
values, see Privilege Constants.
> [!NOTE] > The winbase.h header defines LookupPrivilegeName as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
LookupPrivilegeValueW
Retrieves the locally unique identifier (LUID) used on a specified system to locally represent the specified privilege name. (Unicode)
%group
Win32 advapi32
%prm
lpSystemName, lpName, lpLuid
lpSystemName : [wstr] A pointer to a null-terminated string that specifies the name of the system on which the privilege name is retrieved. If a null string is specified, the function attempts to find the privilege name on the local system.
lpName : [wstr] A pointer to a null-terminated string that specifies the name of the privilege, as defined in the Winnt.h header file. For example, this parameter could specify the constant, SE_SECURITY_NAME, or its corresponding string, "SeSecurityPrivilege".
lpLuid : [var] A pointer to a variable that receives the LUID by which the privilege is known on the system specified by the lpSystemName parameter.
%inst
Retrieves the locally unique identifier (LUID) used on a specified
system to locally represent the specified privilege name. (Unicode)

[戻り値]
If the function succeeds, the function returns nonzero.
If the function fails, it returns zero. To get extended error
information, call GetLastError.

[備考]
The LookupPrivilegeValue function supports only the privileges
specified in the Defined Privileges section of Winnt.h. For a list of
values, see Privilege Constants.


%index
LookupSecurityDescriptorPartsW
Retrieves security information from a self-relative security descriptor. (Unicode)
%group
Win32 advapi32
%prm
ppOwner, ppGroup, pcCountOfAccessEntries, ppListOfAccessEntries, pcCountOfAuditEntries, ppListOfAuditEntries, pSD
ppOwner : [var] A pointer to a variable that receives a pointer to a TRUSTEE structure. The function looks up the name associated with the owner security identifier (SID)  in the pSD security descriptor, and returns a pointer to the name in the ptstrName member of the TRUSTEE structure. The function sets the TrusteeForm member to TRUSTEE_IS_NAME.
ppGroup : [var] A pointer to a variable that receives a pointer to a TRUSTEE structure. The function looks up the name associated with the primary group SID of the security descriptor, and returns a pointer to the name in the ptstrName member of the TRUSTEE structure. The function sets the TrusteeForm member to TRUSTEE_IS_NAME.
pcCountOfAccessEntries : [var] A pointer to a ULONG that receives the number of EXPLICIT_ACCESS structures returned in the pListOfAccessEntries array. This parameter can be NULL only if the pListOfAccessEntries parameter is also NULL.
ppListOfAccessEntries : [var] A pointer to a variable that receives a pointer to an array of EXPLICIT_ACCESS structures that describe the access control entries (ACEs) in the discretionary access control list (DACL) of the security descriptor. The TRUSTEE structure in these EXPLICIT_ACCESS structures use the TRUSTEE_IS_NAME form. For a description of how an array of EXPLICIT_ACCESS structures describes the ACEs in an access control list (ACL), see the GetExplicitEntriesFromAcl function. If this parameter is NULL, the cCountOfAccessEntries parameter must also be NULL.
pcCountOfAuditEntries : [var] A pointer to a ULONG that receives the number of EXPLICIT_ACCESS structures returned in the pListOfAuditEntries array. This parameter can be NULL only if the pListOfAuditEntries parameter is also NULL.
ppListOfAuditEntries : [var] A pointer to a variable that receives a pointer to an array of EXPLICIT_ACCESS structures that describe the ACEs in the system access control list (SACL) of the security descriptor. The TRUSTEE structure in these EXPLICIT_ACCESS structures uses the TRUSTEE_IS_NAME form. If this parameter is NULL, the cCountOfAuditEntries parameter must also be NULL.
pSD : [int] A pointer to an existing self-relative security descriptor from which the function retrieves security information.
%inst
Retrieves security information from a self-relative security
descriptor. (Unicode)

[戻り値]
If the function succeeds, the function returns ERROR_SUCCESS. If the
function fails, it returns a nonzero error code defined in
WinError.h.

[備考]
The LookupSecurityDescriptorParts function retrieves the names of the
owner and primary group of the security descriptor. This function
also returns descriptions of the ACEs in the DACL and audit-control
entries in the SACL of the security descriptor. The parameters other
than pSD can be NULL if you are not interested in the information. If
you do not want information about the DACL, both pListOfAccessEntries
and cCountOfAuditEntries must be NULL. If you do not want information
about the SACL, both pListOfAuditEntries and cCountOfAuditEntries
must be NULL. Similarly, if you do want DACL or SACL information,
both of the corresponding parameters must not be NULL. When you have
finished using any of the buffers returned by the pOwner, pGroup,
pListOfAccessEntries, or pListOfAuditEntries parameters, free them by
calling the LocalFree function. The LookupSecurityDescriptorParts
function is intended for trusted servers that implement or expose
security on their own objects. The function works with a
self-relative security descriptor suitable for serializing into a
stream and storing to disk, as a trusted server might require.
> [!NOTE] > The aclapi.h header defines LookupSecurityDescriptorParts
as an alias which automatically selects the ANSI or Unicode version
of this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
LsaClose
The LsaClose function closes a handle to a Policy or TrustedDomain object.
%group
Win32 advapi32
%prm
ObjectHandle
ObjectHandle : [intptr] A handle to a Policy object returned by the LsaOpenPolicy function or to a TrustedDomain object returned by the LsaOpenTrustedDomainByName function. Following the completion of this call, the handle is no longer valid.
%inst
The LsaClose function closes a handle to a Policy or TrustedDomain
object.

[戻り値]
If the function succeeds, the return value is STATUS_SUCCESS. If the
function fails, the return value is an NTSTATUS code. For more
information, see LSA Policy Function Return Values. You can use the
LsaNtStatusToWinError function to convert the NTSTATUS code to a
Windows error code.


%index
LsaAddAccountRights
Assigns one or more privileges to an account.
%group
Win32 advapi32
%prm
PolicyHandle, AccountSid, UserRights, CountOfRights
PolicyHandle : [intptr] A handle to a Policy object. The handle must have the POLICY_LOOKUP_NAMES access right. If the account identified by the AccountSid parameter does not exist, the handle must have the POLICY_CREATE_ACCOUNT access right. For more information, see Opening a Policy Object Handle.
AccountSid : [int] Pointer to the SID of the account to which the function assigns privileges.
UserRights : [var] Pointer to an array of LSA_UNICODE_STRING structures. Each structure contains the name of a privilege to add to the account. For a list of privilege names, see Privilege Constants.
CountOfRights : [int] Specifies the number of elements in the UserRights array.
%inst
Assigns one or more privileges to an account.

[戻り値]
If the function succeeds, the return value is STATUS_SUCCESS. If the
function fails, the return value is an NTSTATUS code, which can be
the following value or one of the LSA Policy Function Return Values.
This doc was truncated.

[備考]
If you specify privileges already granted to the account, they are
ignored. For an example that demonstrates calling this function, see
Managing Account Permissions.


%index
LsaCreateTrustedDomainEx
The LsaCreateTrustedDomainEx function establishes a new trusted domain by creating a new TrustedDomain object.
%group
Win32 advapi32
%prm
PolicyHandle, TrustedDomainInformation, AuthenticationInformation, DesiredAccess, TrustedDomainHandle
PolicyHandle : [intptr] A handle to a Policy object. For the object to be created, the caller must have permission to create children on the System container. For information about policy object handles, see Opening a Policy Object Handle.
TrustedDomainInformation : [var] Pointer to a TRUSTED_DOMAIN_INFORMATION_EX structure that contains the name and SID of the new trusted domain.
AuthenticationInformation : [var] Pointer to a TRUSTED_DOMAIN_AUTH_INFORMATION structure that contains authentication information for the new trusted domain.
DesiredAccess : [int] An ACCESS_MASK structure that specifies the accesses to be granted for the new trusted domain.
TrustedDomainHandle : [intptr] Receives the LSA policy handle of the remote trusted domain. You can pass this handle into LSA function calls to manage the LSA policy of the trusted domain.
%inst
The LsaCreateTrustedDomainEx function establishes a new trusted
domain by creating a new TrustedDomain object.

[戻り値]
If the function succeeds, the function returns STATUS_SUCCESS. If the
function fails, it returns an NTSTATUS code, which can be one of the
following values or one of the LSA Policy Function Return Values.
This doc was truncated.

[備考]
LsaCreateTrustedDomainEx does not check whether the specified domain
name matches the specified SID or whether the SID and name represent
an actual domain.


%index
LsaDeleteTrustedDomain
The LsaDeleteTrustedDomain function removes a trusted domain from the list of trusted domains for a system and deletes the associated TrustedDomain object.
%group
Win32 advapi32
%prm
PolicyHandle, TrustedDomainSid
PolicyHandle : [intptr] A handle to a Policy object. For more information, see Opening a Policy Object Handle.
TrustedDomainSid : [int] Pointer to the SID of the trusted domain to be removed.
%inst
The LsaDeleteTrustedDomain function removes a trusted domain from the
list of trusted domains for a system and deletes the associated
TrustedDomain object.

[戻り値]
If the function succeeds, the return value is STATUS_SUCCESS. If the
function fails, the return value is an NTSTATUS code. For more
information, see LSA Policy Function Return Values. You can use the
LsaNtStatusToWinError function to convert the NTSTATUS code to a
Windows error code.


%index
LsaEnumerateAccountRights
The LsaEnumerateAccountRights function enumerates the privileges assigned to an account.
%group
Win32 advapi32
%prm
PolicyHandle, AccountSid, UserRights, CountOfRights
PolicyHandle : [intptr] A handle to a Policy object. The handle must have the POLICY_LOOKUP_NAMES access right. For more information, see Opening a Policy Object Handle.
AccountSid : [int] Pointer to the SID of the account for which to enumerate privileges.
UserRights : [var] Receives a pointer to an array of LSA_UNICODE_STRING structures. Each structure contains the name of a privilege held by the account. For a list of privilege names, see Privilege Constants When you no longer need the information, pass the returned pointer to LsaFreeMemory.
CountOfRights : [var] Pointer to a variable that receives the number of privileges in the UserRights array.
%inst
The LsaEnumerateAccountRights function enumerates the privileges
assigned to an account.

[戻り値]
If at least one account right is found, the function succeeds and
returns STATUS_SUCCESS. If no account rights are found or if the
function fails for any other reason, the function returns an NTSTATUS
code such as FILE_NOT_FOUND. For more information, see LSA Policy
Function Return Values. Use the LsaNtStatusToWinError function to
convert the NTSTATUS code to a Windows error code.


%index
LsaEnumerateAccountsWithUserRight
Returns the accounts in the database of a Local Security Authority (LSA) Policy object that hold a specified privilege.
%group
Win32 advapi32
%prm
PolicyHandle, UserRight, Buffer, CountReturned
PolicyHandle : [intptr] A handle to a Policy object. The handle must have POLICY_LOOKUP_NAMES and POLICY_VIEW_LOCAL_INFORMATION user rights. For more information, see Opening a Policy Object Handle.
UserRight : [var] Pointer to an LSA_UNICODE_STRING structure that specifies the name of a privilege. For a list of privileges, see Privilege Constants and Account Rights Constants.
Buffer : [var] Pointer to a variable that receives a pointer to an array of LSA_ENUMERATION_INFORMATION structures. The Sid member of each structure is a pointer to the security identifier (SID) of an account that holds the specified privilege.
CountReturned : [var] Pointer to a variable that receives the number of entries returned in the EnumerationBuffer parameter.
%inst
Returns the accounts in the database of a Local Security Authority
(LSA) Policy object that hold a specified privilege.

[戻り値]
If the function succeeds, the function returns STATUS_SUCCESS. If the
function fails, it returns an NTSTATUS code, which can be one of the
following values or one of the LSA Policy Function Return Values.
This doc was truncated.


%index
LsaEnumerateTrustedDomains
The LsaEnumerateTrustedDomains function retrieves the names and SIDs of domains trusted to authenticate logon credentials.
%group
Win32 advapi32
%prm
PolicyHandle, EnumerationContext, Buffer, PreferedMaximumLength, CountReturned
PolicyHandle : [intptr] A handle to a Policy object. The handle must have the POLICY_VIEW_LOCAL_INFORMATION access right. For more information, see Opening a Policy Object Handle.
EnumerationContext : [var] Pointer to an enumeration handle that enables you to make multiple calls to enumerate all the trusted domains. On the first call to LsaEnumerateTrustedDomains, EnumerationContext must point to a variable that has been initialized to zero. On subsequent calls to LsaEnumerateTrustedDomains, EnumerationContext must point to the enumeration handle returned by the previous call.
Buffer : [var] Receives a pointer to an array of LSA_TRUST_INFORMATION structures that contain the names and SIDs of one or more trusted domains.
PreferedMaximumLength : [int] Specifies the preferred maximum size, in bytes, of the returned buffer. This information is approximate; the actual number of bytes returned may be greater than this value.
CountReturned : [var] Pointer to a variable that receives the number of elements returned in the Buffer parameter.
%inst
The LsaEnumerateTrustedDomains function retrieves the names and SIDs
of domains trusted to authenticate logon credentials.

[戻り値]
If the function is successful, the return value is one of the
following NTSTATUS values.
This doc was truncated.

[備考]
For domains with domain controllers running only Windows NT 4.0 or
earlier versions of Windows NT, LsaEnumerateTrustedDomains returns a
list of all trusted domains. In releases of Windows NT up to and
including release 4.0, all trusted domains are directly trusted. In
Windows XP and Windows 2000 mixed-mode domains, domain controllers
may be running Windows XP, Windows 2000, or Windows NT. Therefore, in
mixed-mode domains, some trusted domains are directly trusted and
others are indirectly trusted. When enumerating the trusted domains
of a system in a mixed-mode domain, LsaEnumerateTrustedDomains
returns only directly trusted domains. In contrast, Windows XP and
Windows 2000 native-mode domains contain only Windows 2000 domain
controllers, even though there may be members in the domain running
Windows NT 4.0 or earlier versions. When enumerating the trusted
domains of a system in a native-mode Windows XP and Windows 2000
domain, LsaEnumerateTrustedDomains returns both directly trusted and
indirectly trusted domains. Retrieving all trust information may
require more than a single LsaEnumerateTrustedDomains call. You can
use the EnumerationContext parameter to make multiple calls, as
follows: On the first call, set the variable pointed to by
EnumerationContext to zero. If LsaEnumerateTrustedDomains returns
STATUS_SUCCESS or STATUS_MORE_ENTRIES, call the function again,
passing in the EnumerationContext value returned by the previous
call. The enumeration is complete when the function returns
STATUS_NO_MORE_ENTRIES.


%index
LsaEnumerateTrustedDomainsEx
Returns information about the domains trusted by the local system.
%group
Win32 advapi32
%prm
PolicyHandle, EnumerationContext, Buffer, PreferedMaximumLength, CountReturned
PolicyHandle : [intptr] A handle to a Policy object. This call requires POLICY_VIEW_LOCAL_INFORMATION access to the Policy object. For more information, see Opening a Policy Object Handle.
EnumerationContext : [var] A pointer to an LSA_ENUMERATION_HANDLE that you can use to make multiple calls to LsaEnumerateTrustedDomainsEx  to retrieve all of the trusted domain information. For more information, see Remarks.
Buffer : [var] Pointer to a buffer that receives a list of TRUSTED_DOMAIN_INFORMATION_EX structures that contain information about the enumerated trusted domains.
PreferedMaximumLength : [int] Preferred maximum length, in bytes, of returned data. This is not a hard upper limit, but serves as a guide. Due to data conversion between systems with different natural data sizes, the actual amount of data returned may be greater than this value.
CountReturned : [var] Pointer to a LONG that receives the number of trusted domain objects returned.
%inst
Returns information about the domains trusted by the local system.

[戻り値]
If the function succeeds, the function returns STATUS_SUCCESS. If the
function fails, it returns an NTSTATUS code, which can be one of the
following values or one of the LSA Policy Function Return Values.
This doc was truncated.

[備考]
Retrieving all trust information may require more than a single
LsaEnumerateTrustedDomainsEx call. To use the EnumerationContext
parameter to make multiple calls
This doc was truncated.


%index
LsaFreeMemory
The LsaFreeMemory function frees memory allocated for an output buffer by an LSA function call.
%group
Win32 advapi32
%prm
Buffer
Buffer : [intptr] Pointer to memory buffer that was allocated by an LSA function call. If LsaFreeMemory is successful, this buffer is freed.
%inst
The LsaFreeMemory function frees memory allocated for an output
buffer by an LSA function call.

[戻り値]
If the function succeeds, the return value is STATUS_SUCCESS. If the
function fails, the return value is an NTSTATUS code, which can be
the following value or one of the LSA Policy Function Return Values.
This doc was truncated.


%index
LsaGetAppliedCAPIDs
Returns an array of central access policies (CAPs) identifiers (CAPIDs) of all the CAPs applied on a specific computer.
%group
Win32 advapi32
%prm
SystemName, CAPIDs, CAPIDCount
SystemName : [var] A pointer to an LSA_UNICODE_STRING structure that contains the name of the specific computer. The name can have the form of "ComputerName" or "\\ComputerName". If this parameter is NULL, then the function returns the CAPIDs of the local computer.
CAPIDs : [var] A pointer to a variable that receives an array of pointers to CAPIDs that identify the CAPs available on the specified computer. When you have finished using the CAPIDs, call the LsaFreeMemory function on each element in the array and the entire array.
CAPIDCount : [var] A pointer to a variable that receives the number of CAPs that are available on the specified computer. The array returned in the CAPIDs parameter contains the same number of elements as the CAPIDCount parameter.
%inst
Returns an array of central access policies (CAPs) identifiers
(CAPIDs) of all the CAPs applied on a specific computer.

[戻り値]
If the function succeeds, the return value is STATUS_SUCCESS. If the
function fails, the return value is one of the LSA Policy Function
Return Values. You can use the LsaNtStatusToWinError function to
convert the NTSTATUS code to a Windows error code.

[備考]
For specific details about the central access policies, you can query
the attributes of the central access policy object in the Active
Directory on the specified computer's domain controller. Look for the
object whose msAuthz-CentralAccessPolicyID attribute matches one of
the returned CAPIDs.


%index
LsaLookupNames
Retrieves the security identifiers (SIDs) that correspond to an array of user, group, or local group names.
%group
Win32 advapi32
%prm
PolicyHandle, Count, Names, ReferencedDomains, Sids
PolicyHandle : [intptr] A handle to a Policy object. The handle must have the POLICY_LOOKUP_NAMES access right. For more information, see Opening a Policy Object Handle.
Count : [int] Specifies the number of names in the Names array. This is also the number of entries returned in the Sids array. This value must be less than or equal to 1000.
Names : [var] Pointer to an array of LSA_UNICODE_STRING structures that contain the names to look up. The strings in these structures can be the names of user, group, or local group accounts, or the names of domains. Domain names can be DNS domain names or NetBIOS domain names.
ReferencedDomains : [var] Receives a pointer to an LSA_REFERENCED_DOMAIN_LIST structure. The Domains member of this structure is an array that contains an entry for each domain in which a name was found. The DomainIndex member of each entry in the Sids array is the index of the Domains array entry for the domain in which the name was found.
Sids : [var] Receives a pointer to an array of LSA_TRANSLATED_SID structures. Each entry in the Sids array contains the SID information for the corresponding entry in the Names array.
%inst
Retrieves the security identifiers (SIDs) that correspond to an array
of user, group, or local group names.

[戻り値]
If the function succeeds, the function returns one of the following
NTSTATUS values.
This doc was truncated.

[備考]
> [!WARNING] >Use fully qualified account names (for example,
domain_name\user_name) instead of isolated names (for example,
user_name). Fully qualified names are unambiguous and provide better
performance when the lookup is performed. This function also supports
fully qualified DNS names (for example,
example.example.com\user_name) and user principal names (UPN) (for
example, someone@example.com). > [!WARNING] >For more information
about the limitations of isolated names, please refer to the
LsaLookupNames2 documentation. The LsaLookupNames function uses the
following algorithm to translate account names. To translate names
This doc was truncated.


%index
LsaLookupNames2
Retrieves the security identifiers (SIDs) for specified account names. LsaLookupNames2 can look up the SID for any account in any domain in a Windows forest.
%group
Win32 advapi32
%prm
PolicyHandle, Flags, Count, Names, ReferencedDomains, Sids
PolicyHandle : [intptr] A handle to a Policy object. The handle must have the POLICY_LOOKUP_NAMES access right. For more information, see Opening a Policy Object Handle.
Flags : [int] Values that control the behavior of this function. The following value is currently defined.
Count : [int] Specifies the number of names in the Names array. This is also the number of entries returned in the Sids array.
Names : [var] Pointer to an array of LSA_UNICODE_STRING structures that contain the names to look up. These strings can be the names of user, group, or local group accounts, or the names of domains. Domain names can be DNS domain names or NetBIOS domain names.
ReferencedDomains : [var] Receives a pointer to an LSA_REFERENCED_DOMAIN_LIST structure. The Domains member of this structure is an array that contains an entry for each domain in which a name was found. The DomainIndex member of each entry in the Sids array is the index of the Domains array entry for the domain in which the name was found. When you have finished using the returned pointer, free it by calling the LsaFreeMemory function. This memory must be freed even when the function fails with the either of the error codes STATUS_NONE_MAPPED or STATUS_SOME_NOT_MAPPED
Sids : [var] Receives a pointer to an array of LSA_TRANSLATED_SID2 structures. Each entry in the Sids array contains the SID information for the corresponding entry in the Names array.
%inst
Retrieves the security identifiers (SIDs) for specified account
names. LsaLookupNames2 can look up the SID for any account in any
domain in a Windows forest.

[戻り値]
If the function succeeds, the function returns one of the following
NTSTATUS values.
This doc was truncated.

[備考]
Use fully qualified account names (for example, DomainName\UserName)
instead of isolated names (for example, UserName). Fully qualified
names are unambiguous and provide better performance when the lookup
is performed. This function also supports fully qualified DNS names
(for example, Example.Example.com\UserName) and user principal names
(UPN) (for example, Someone@Example.com). Translation of isolated
names introduces the possibility of name collisions because the same
name may be used in multiple domains. The LsaLookupNames2 function
uses the following algorithm to translate isolated names. To
translate isolated names
This doc was truncated.


%index
LsaLookupSids
Looks up the names that correspond to an array of security identifiers (SIDs). If LsaLookupSids cannot find a name that corresponds to a SID, the function returns the SID in character form.
%group
Win32 advapi32
%prm
PolicyHandle, Count, Sids, ReferencedDomains, Names
PolicyHandle : [intptr] A handle to a Policy object. This handle must have the POLICY_LOOKUP_NAMES access right. For more information, see Opening a Policy Object Handle.
Count : [int] Specifies the number of SIDs in the Sids array. This is also the number of entries returned in the Names array. This value must be less than or equal to 20480.
Sids : [var] Pointer to an array of SID pointers to look up. The SIDs can be well-known SIDs, user, group, or local group account SIDs, or domain SIDs.
ReferencedDomains : [var] Receives a pointer to a pointer to a LSA_REFERENCED_DOMAIN_LIST structure. The Domains member of this structure is an array that contains an entry for each domain in which a SID was found. The entry for each domain contains the SID and flat name of the domain. For Windows domains, the flat name is the NetBIOS name. For links with non?Windows domains, the flat name is the identifying name of that domain, or it is NULL.
Names : [var] Receives a pointer to an array of LSA_TRANSLATED_NAME structures. Each entry in the Names array contains the name information for the corresponding entry in the Sids array. For account SIDs, the Name member of each structure contains the isolated name of the account. For domain SIDs, the Name member is not valid.
%inst
Looks up the names that correspond to an array of security
identifiers (SIDs). If LsaLookupSids cannot find a name that
corresponds to a SID, the function returns the SID in character form.

[戻り値]
If the function succeeds, the return value is one of the following
NTSTATUS values.
This doc was truncated.

[備考]
For account SIDs, the string returned in the Name member is the
isolated name of the account (for example, user_name). If you need
the composite name of the account (for example, Acctg\user_name), get
the domain name from the ReferencedDomains buffer and append a
backslash and the isolated name. If the LsaLookupSids function cannot
translate a SID, the function uses the following algorithm:
This doc was truncated.


%index
LsaLookupSids2
Looks up the names that correspond to an array of security identifiers (SIDs) and supports Internet provider identities. If LsaLookupSids2 cannot find a name that corresponds to a SID, the function returns the SID in character form.
%group
Win32 advapi32
%prm
PolicyHandle, LookupOptions, Count, Sids, ReferencedDomains, Names
PolicyHandle : [intptr] A handle to a Policy object. This handle must have the POLICY_LOOKUP_NAMES access right. For more information, see Opening a Policy Object Handle.
LookupOptions : [int] Flags that modify the lookup behavior.
Count : [int] Specifies the number of SIDs in the Sids array. This is also the number of entries returned in the Names array. This value must be less than or equal to 20480.
Sids : [var] Pointer to an array of SID pointers to look up. The SIDs can be well-known SIDs, user, group, or local group account SIDs, or domain SIDs.
ReferencedDomains : [var] Receives a pointer to a pointer to a LSA_REFERENCED_DOMAIN_LIST structure. The Domains member of this structure is an array that contains an entry for each domain in which a SID was found. The entry for each domain contains the SID and flat name of the domain. For Windows domains, the flat name is the NetBIOS name. For links with non?Windows domains, the flat name is the identifying name of that domain, or it is NULL.
Names : [var] Receives a pointer to an array of LSA_TRANSLATED_NAME structures. Each entry in the Names array contains the name information for the corresponding entry in the Sids array. For account SIDs, the Name member of each structure contains the isolated name of the account. For domain SIDs, the Name member is not valid.
%inst
Looks up the names that correspond to an array of security
identifiers (SIDs) and supports Internet provider identities. If
LsaLookupSids2 cannot find a name that corresponds to a SID, the
function returns the SID in character form.

[戻り値]
If the function succeeds, the return value is one of the following
NTSTATUS values.
This doc was truncated.

[備考]
The flag LSA_LOOKUP_PREFER_INTERNET_NAMES should be used for internet
accounts such as MicrosoftAccount and Azure Active Directory
accounts. When this flag is specified then SID-Name lookup returns
the UPN of the account in the form MicrosoftAccount\foo@outlook.com
or AzureAD\foo@contoso.com. For Microsoft Accounts both the local SAM
SID and the internet SID result in the UPN being returned if this
flag is specified. If LSA_LOOKUP_PREFER_INTERNET_NAMES is not
specified then for AAD accounts the NT4 style name of the form
AzureAD\foo is returned. The NT4 style name is machine specific and
its usage should be carefully evaluated and if possible should be
avoided. For MicrosoftAccounts if LSA_LOOKUP_PREFER_INTERNET_NAMES is
not specified then the local SID of the account translates to the
local SAM name, and the internet SID translates to the UPN name. For
account SIDs, the string returned in the Name member is the isolated
name of the account (for example, user_name). If you need the
composite name of the account (for example, Acctg\user_name), get the
domain name from the ReferencedDomains buffer and append a backslash
and the isolated name. If the LsaLookupSids2 function cannot
translate a SID, the function uses the following algorithm:
This doc was truncated.


%index
LsaNtStatusToWinError
The LsaNtStatusToWinError function converts an NTSTATUS code returned by an LSA function to a Windows error code.
%group
Win32 advapi32
%prm
Status
Status : [intptr] An NTSTATUS code returned by an LSA function call. This value will be converted to a System error code.
%inst
The LsaNtStatusToWinError function converts an NTSTATUS code returned
by an LSA function to a Windows error code.

[戻り値]
The return value is the Windows error code that corresponds to the
Status parameter. If there is no corresponding Windows error code,
the return value is ERROR_MR_MID_NOT_FOUND.


%index
LsaOpenPolicy
Opens a handle to the Policy object on a local or remote system.
%group
Win32 advapi32
%prm
SystemName, ObjectAttributes, DesiredAccess, PolicyHandle
SystemName : [var] A pointer to an LSA_UNICODE_STRING structure that contains the name of the target system. The name can have the form "ComputerName" or "\\ComputerName". If this parameter is NULL, the function opens the Policy object on the local system.
ObjectAttributes : [var] A pointer to an LSA_OBJECT_ATTRIBUTES structure that specifies the connection attributes. The structure members are not used; initialize them to NULL or zero.
DesiredAccess : [int] An ACCESS_MASK that specifies the requested access rights. The function fails if the DACL of the target system does not allow the caller the requested access. To determine the access rights that you need, see the documentation for the LSA functions with which you want to use the policy handle.
PolicyHandle : [intptr] A pointer to an LSA_HANDLE variable that receives a handle to the Policy object. When you no longer need this handle, pass it to the LsaClose function to close it.
%inst
Opens a handle to the Policy object on a local or remote system.

[戻り値]
If the function succeeds, the function returns STATUS_SUCCESS. If the
function fails, it returns an NTSTATUS code. For more information,
see LSA Policy Function Return Values. You can use the
LsaNtStatusToWinError function to convert the NTSTATUS code to a
Windows error code.

[備考]
To administer the local security policy of a local or remote system,
you must call the LsaOpenPolicy function to establish a session with
that system's LSA subsystem. LsaOpenPolicy connects to the LSA of the
target system and returns a handle to the Policy object of that
system. You can use this handle in subsequent LSA function calls to
administer the local security policy information of the target
system. For an example that demonstrates calling this function see
Opening a Policy Object Handle.


%index
LsaOpenTrustedDomainByName
The LsaOpenTrustedDomainByName function opens the LSA policy handle of a remote trusted domain. You can pass this handle into LSA function calls in order to set or query the LSA policy of the remote machine.
%group
Win32 advapi32
%prm
PolicyHandle, TrustedDomainName, DesiredAccess, TrustedDomainHandle
PolicyHandle : [intptr] A handle to a Policy object. This is the policy handle of the local machine. For more information, see Opening a Policy Object Handle.
TrustedDomainName : [var] Name of the trusted domain. This name can be either the flat name, or the Domain Name System (DNS) domain name.
DesiredAccess : [int] An ACCESS_MASK structure that specifies the access permissions requested on the remote trusted domain object.
TrustedDomainHandle : [intptr] Pointer that receives the address of the LSA policy handle of the remote trusted domain. You can pass this handle into LSA function calls in order to query and manage the LSA policy of the remote machine.
%inst
The LsaOpenTrustedDomainByName function opens the LSA policy handle
of a remote trusted domain. You can pass this handle into LSA
function calls in order to set or query the LSA policy of the remote
machine.

[戻り値]
If the function succeeds, the return value is STATUS_SUCCESS. If the
function fails, the return value is an NTSTATUS code, which can be
one of the following values or one of the LSA Policy Function Return
Values.
This doc was truncated.


%index
LsaQueryCAPs
Returns the Central Access Policies (CAPs) for the specified IDs.
%group
Win32 advapi32
%prm
CAPIDs, CAPIDCount, CAPs, CAPCount
CAPIDs : [var] A pointer to a variable that contains an array of pointers to CAPIDs that identify the CAPs being queried.
CAPIDCount : [int] The number of IDs in the CAPIDs parameter.
CAPs : [var] Receives a pointer to an array of pointers to CENTRAL_ACCESS_POLICY structures representing the queried CAPs.
CAPCount : [var] The number of CENTRAL_ACCESS_POLICY structure pointers returned in the CAPs parameter.
%inst
Returns the Central Access Policies (CAPs) for the specified IDs.

[戻り値]
If the function succeeds, the return value is STATUS_SUCCESS. If the
function fails, the return value is an NTSTATUS code, which can be
one of the LSA Policy Function Return Values.


%index
LsaQueryDomainInformationPolicy
Retrieves domain information from the Policyobject.
%group
Win32 advapi32
%prm
PolicyHandle, InformationClass, Buffer
PolicyHandle : [intptr] A handle to the Policy object for the system.
InformationClass : [int] POLICY_DOMAIN_INFORMATION_CLASS enumeration that specifies the information to be returned from the  Policy object. The following table shows the possible values.
Buffer : [var] Pointer to a buffer that receives the requested information.
%inst
Retrieves domain information from the Policyobject.

[戻り値]
If the function succeeds, the return value is STATUS_SUCCESS. If the
function fails, the return value is an NTSTATUS code, which can be
the following value or one of the LSA Policy Function Return Values.
This doc was truncated.

[備考]
The POLICY_VIEW_LOCAL_INFORMATION access type is required to retrieve
domain information from the Policy object. For more information, see
Policy Object Access Rights.


%index
LsaQueryForestTrustInformation
Retrieves forest trust information for the specified Local Security Authority?TrustedDomain object.
%group
Win32 advapi32
%prm
PolicyHandle, TrustedDomainName, ForestTrustInfo
PolicyHandle : [intptr] A handle to the Policy object for the system.
TrustedDomainName : [var] Pointer to an LSA_UNICODE_STRING structure that contains the name of the TrustedDomain object for which to retrieve forest trust information.
ForestTrustInfo : [var] Pointer to an LSA_FOREST_TRUST_INFORMATION structure that returns the forest trust information for the TrustedDomain object specified by the TrustedDomainName parameter.
%inst
Retrieves forest trust information for the specified Local Security
Authority?TrustedDomain object.

[戻り値]
If the function succeeds, the return value is STATUS_SUCCESS. If the
function fails, the return value is an NTSTATUS code, which can be
one of the following values or one of the LSA Policy Function Return
Values.
This doc was truncated.

[備考]
Access to this function is protected by a securable object.


%index
LsaQueryForestTrustInformation2
(no summary)
%group
Win32 advapi32
%prm
PolicyHandle, TrustedDomainName, HighestRecordType, ForestTrustInfo
PolicyHandle : [intptr] 
TrustedDomainName : [var] 
HighestRecordType : [int] 
ForestTrustInfo : [var] 
%inst



%index
LsaQueryInformationPolicy
Retrieves information about a Policy object.
%group
Win32 advapi32
%prm
PolicyHandle, InformationClass, Buffer
PolicyHandle : [intptr] A handle to a Policy object. The required access rights for this handle depend on the value of the InformationClass parameter. For more information, see Opening a Policy Object Handle.
InformationClass : [int] 
Buffer : [var] Pointer to a variable that receives a pointer to a structure containing the requested information. The type of structure depends on the value of the InformationClass parameter.
%inst
Retrieves information about a Policy object.

[戻り値]
If the LsaQueryInformationPolicy function succeeds, the return value
is STATUS_SUCCESS. If the function fails, the return value is an
NTSTATUS code. For more information, see LSA Policy Function Return
Values. You can use the LsaNtStatusToWinError function to convert the
NTSTATUS code to a Windows error code.

[備考]
For an example that demonstrates calling this function see Managing
Policy Information.


%index
LsaQueryTrustedDomainInfo
The LsaQueryTrustedDomainInfo function retrieves information about a trusted domain.
%group
Win32 advapi32
%prm
PolicyHandle, TrustedDomainSid, InformationClass, Buffer
PolicyHandle : [intptr] A handle to the Policy object of a domain controller that has a trust relationship with the domain identified by the TrustedDomainSid parameter. The handle must have the POLICY_VIEW_LOCAL_INFORMATION access right. For more information, see Opening a Policy Object Handle.
TrustedDomainSid : [int] Pointer to the SID of the trusted domain to query.
InformationClass : [int] 
Buffer : [var] A pointer to a buffer that receives a pointer to a structure that contains the requested information. The type of structure depends on the value of the InformationClass parameter.
%inst
The LsaQueryTrustedDomainInfo function retrieves information about a
trusted domain.

[戻り値]
If the function succeeds, the function returns STATUS_SUCCESS. If the
function fails, it returns an NTSTATUS value that indicates the
error. For more information, see LSA Policy Function Return Values.
You can use the LsaNtStatusToWinError function to convert the
NTSTATUS value to a Windows error code.


%index
LsaQueryTrustedDomainInfoByName
The LsaQueryTrustedDomainInfoByName function returns information about a trusted domain.
%group
Win32 advapi32
%prm
PolicyHandle, TrustedDomainName, InformationClass, Buffer
PolicyHandle : [intptr] A handle to a Policy object. This handle must have the POLICY_VIEW_LOCAL_INFORMATION access right. For more information, see Opening a Policy Object Handle.
TrustedDomainName : [var] String that contains the name of the trusted domain. This can either be the domain name or the flat name.
InformationClass : [int] 
Buffer : [var] Receives a pointer to the returned buffer that contains the requested information. The format and content of this buffer depend on the information class. For example, if InformationClass is set to TrustedDomainInformationEx, Buffer receives a pointer to a TRUSTED_DOMAIN_INFORMATION_EX structure. For more information, see TRUSTED_INFORMATION_CLASS.
%inst
The LsaQueryTrustedDomainInfoByName function returns information
about a trusted domain.

[戻り値]
If the function succeeds, the function returns STATUS_SUCCESS. If the
function fails, it returns an NTSTATUS value, which can be one of the
following values or one of the LSA Policy Function Return Values.
This doc was truncated.


%index
LsaRemoveAccountRights
Removes one or more privileges from an account.
%group
Win32 advapi32
%prm
PolicyHandle, AccountSid, AllRights, UserRights, CountOfRights
PolicyHandle : [intptr] A handle to a Policy object. The handle must have the POLICY_LOOKUP_NAMES access right. For more information, see Opening a Policy Object Handle.
AccountSid : [int] Pointer to the security identifier (SID) of the account from which the privileges are removed.
AllRights : [int] If TRUE, the function removes all privileges and deletes the account. In this case, the function ignores the UserRights parameter. If FALSE, the function removes the privileges specified by the UserRights parameter.
UserRights : [var] Pointer to an array of LSA_UNICODE_STRING structures. Each structure contains the name of a privilege to be removed from the account. For a list of privilege names, see Privilege Constants.
CountOfRights : [int] Specifies the number of elements in the UserRights array.
%inst
Removes one or more privileges from an account.

[戻り値]
If the function succeeds, the return value is STATUS_SUCCESS. If the
function fails, the return value is an NTSTATUS code, which can be
one of the following values or one of the LSA Policy Function Return
Values.
This doc was truncated.


%index
LsaRetrievePrivateData
Do not use the LSA private data functions. Instead, use the CryptProtectData and CryptUnprotectData functions. (LsaRetrievePrivateData)
%group
Win32 advapi32
%prm
PolicyHandle, KeyName, PrivateData
PolicyHandle : [intptr] A handle to a Policy object. The handle must have the POLICY_GET_PRIVATE_INFORMATION access right. For more information, see Opening a Policy Object Handle.
KeyName : [var] Pointer to an LSA_UNICODE_STRING structure that contains the name of the key under which the private data is stored. To create a specialized object, add one of the following prefixes to the key name.
PrivateData : [var] Pointer to a variable that receives a pointer to an LSA_UNICODE_STRING structure that contains the private data. When you no longer need the information, pass the returned pointer to LsaFreeMemory.
%inst
Do not use the LSA private data functions. Instead, use the
CryptProtectData and CryptUnprotectData functions.
(LsaRetrievePrivateData)

[戻り値]
If the function succeeds, the function returns STATUS_SUCCESS. If the
function fails, it returns an NTSTATUS value, which can be the
following value or one of the LSA Policy Function Return Values.
This doc was truncated.

[備考]
You must run this process "As Administrator" or the call fails with
ERROR_ACCESS_DENIED.


%index
LsaSetCAPs
(no summary)
%group
Win32 advapi32
%prm
CAPDNs, CAPDNCount, Flags
CAPDNs : [var] 
CAPDNCount : [int] 
Flags : [int] 
%inst



%index
LsaSetDomainInformationPolicy
Sets domain information to the Policyobject.
%group
Win32 advapi32
%prm
PolicyHandle, InformationClass, Buffer
PolicyHandle : [intptr] A handle to the Policy object for the system.
InformationClass : [int] POLICY_DOMAIN_INFORMATION_CLASS enumeration that specifies the information to be set to the  Policy object. The following table shows the possible values.
Buffer : [intptr] Pointer to a buffer that contains  the  information to set to the  Policy object.
%inst
Sets domain information to the Policyobject.

[戻り値]
If the function succeeds, the return value is STATUS_SUCCESS. If the
function fails, the return value is an NTSTATUS code, which can be
the following value or one of the LSA Policy Function Return Values.
This doc was truncated.

[備考]
The POLICY_TRUST_ADMIN access type is required to set domain
information to the Policy object. For more information, see Policy
Object Access Rights.


%index
LsaSetForestTrustInformation
Sets the forest trust information for a specified Local Security Authority?TrustedDomain object.
%group
Win32 advapi32
%prm
PolicyHandle, TrustedDomainName, ForestTrustInfo, CheckOnly, CollisionInfo
PolicyHandle : [intptr] A handle to the Policy object for the system.
TrustedDomainName : [var] Pointer to an LSA_UNICODE_STRING structure that contains the name of the TrustedDomain object to which to set the forest trust information specified by the ForestTrustInfo parameter.
ForestTrustInfo : [var] Pointer to an LSA_FOREST_TRUST_INFORMATION structure that contains the forest trust information to set to the TrustedDomain object specified by the TrustedDomainName parameter.
CheckOnly : [int] Boolean value that specifies whether changes to the TrustedDomain object are persisted. If this value is TRUE, this function will check for collisions with the specified parameters but will not set the  forest trust information specified by the ForestTrustInfo parameter to the TrustedDomain object specified by the TrustedDomainName parameter. If this value is FALSE, the forest trust information will be set to the  TrustedDomain object.
CollisionInfo : [var] Pointer to a pointer to an LSA_FOREST_TRUST_COLLISION_INFORMATION structure that returns information about any collisions that occurred.
%inst
Sets the forest trust information for a specified Local Security
Authority?TrustedDomain object.

[戻り値]
If the function succeeds, the return value is STATUS_SUCCESS. If the
function fails, the return value is an NTSTATUS code, which can be
one of the following values or one of the LSA Policy Function Return
Values.
This doc was truncated.


%index
LsaSetForestTrustInformation2
(no summary)
%group
Win32 advapi32
%prm
PolicyHandle, TrustedDomainName, HighestRecordType, ForestTrustInfo, CheckOnly, CollisionInfo
PolicyHandle : [intptr] 
TrustedDomainName : [var] 
HighestRecordType : [int] 
ForestTrustInfo : [var] 
CheckOnly : [int] 
CollisionInfo : [var] 
%inst



%index
LsaSetInformationPolicy
Modifies information in a Policy object.
%group
Win32 advapi32
%prm
PolicyHandle, InformationClass, Buffer
PolicyHandle : [intptr] A handle to a Policy object. The required access rights for this handle depend on the value of the InformationClass parameter. For more information, see Opening a Policy Object Handle.
InformationClass : [int] 
Buffer : [intptr] Pointer to a structure containing the information to set. The type of structure depends on the value of the InformationClass parameter.
%inst
Modifies information in a Policy object.

[戻り値]
If the function succeeds, the return value is STATUS_SUCCESS. If the
function fails, the return value is an NTSTATUS code. For more
information, see LSA Policy Function Return Values. You can use the
LsaNtStatusToWinError function to convert the NTSTATUS code to a
Windows error code.


%index
LsaSetTrustedDomainInfoByName
The LsaSetTrustedDomainInfoByName function sets values for a TrustedDomain object.
%group
Win32 advapi32
%prm
PolicyHandle, TrustedDomainName, InformationClass, Buffer
PolicyHandle : [intptr] A handle to a Policy object. The security descriptor of the trusted domain object determines whether the caller's changes are accepted. For information about policy object handles, see Opening a Policy Object Handle.
TrustedDomainName : [var] Name of the trusted domain to set values for. This can either be the domain name or the flat name.
InformationClass : [int] 
Buffer : [intptr] Pointer to a structure that contains the information to set. The type of structure depends on the value of the InformationClass parameter.
%inst
The LsaSetTrustedDomainInfoByName function sets values for a
TrustedDomain object.

[戻り値]
If the function succeeds, the return value is STATUS_SUCCESS. If the
function fails, the return value is an NTSTATUS code. For more
information, see the "LSA Policy Function Return Values" section of
Security Management Return Values. You can use the
LsaNtStatusToWinError function to convert the NTSTATUS code to a
Windows error code.


%index
LsaSetTrustedDomainInformation
The LsaSetTrustedDomainInformation function modifies a Policy object's information about a trusted domain.
%group
Win32 advapi32
%prm
PolicyHandle, TrustedDomainSid, InformationClass, Buffer
PolicyHandle : [intptr] A handle to the Policy object of a domain controller. The required user rights for this handle depend on the value of the InformationClass parameter. For more information, see Opening a Policy Object Handle.
TrustedDomainSid : [int] Pointer to the SID of the trusted domain whose information is modified. If the InformationClass parameter is set to TrustedDomainNameInformation, this parameter must point to the SID of the domain to add to the list of trusted domains.
InformationClass : [int] 
Buffer : [intptr] Pointer to a structure containing the information to set. The type of structure depends on the value of the InformationClass parameter.
%inst
The LsaSetTrustedDomainInformation function modifies a Policy
object's information about a trusted domain.

[戻り値]
If the function succeeds, the return value is STATUS_SUCCESS. If the
function fails, the return value is an NTSTATUS code. For more
information, see LSA Policy Function Return Values. You can use the
LsaNtStatusToWinError function to convert the NTSTATUS code to a
Windows error code.


%index
LsaStorePrivateData
Do not use the LSA private data functions. Instead, use the CryptProtectData and CryptUnprotectData functions. (LsaStorePrivateData)
%group
Win32 advapi32
%prm
PolicyHandle, KeyName, PrivateData
PolicyHandle : [intptr] A handle to a Policy object. The handle must have the POLICY_CREATE_SECRET access right if this is the first time data is being stored under the key specified by the KeyName parameter. For more information, see Opening a Policy Object Handle.
KeyName : [var] Pointer to an LSA_UNICODE_STRING structure containing the name of the key under which the private data is stored.
PrivateData : [var] Pointer to an LSA_UNICODE_STRING structure containing the private data to store. The function encrypts this data before storing it. If this parameter is NULL, the function deletes any private data stored under the key and deletes the key. Subsequent attempts to retrieve data from the key will return the STATUS_OBJECT_NAME_NOT_FOUND error code.
%inst
Do not use the LSA private data functions. Instead, use the
CryptProtectData and CryptUnprotectData functions.
(LsaStorePrivateData)

[戻り値]
If the function succeeds, the return value is STATUS_SUCCESS. If the
function fails, the return value is an NTSTATUS code. For more
information, see LSA Policy Function Return Values. You can use the
LsaNtStatusToWinError function to convert the NTSTATUS code to a
Windows error code.

[備考]
The LsaStorePrivateData function can be used by server applications
to store client and machine passwords. As described in Private Data
Object, private data objects include three specialized types: local,
global, and machine. Specialized objects are identified by a prefix
in the key name: "L$" for local objects, "G$" for global objects, and
"M$" for machine objects. Local objects cannot be accessed remotely.
Machine objects can be accessed only by the operating system. In
addition to these prefixes, the following values also indicate local
or machine objects. These values are supported for backward
compatibility and should not be used when you create new local or
machine objects. The key name of local private data objects may also
be "$machine.acc", "SAC", "SAI", "SANSC", or start with
"RasDialParms" or "RasCredentials". The key name for machine objects
may also start with, "NL$" or "_sc_". Private data objects which do
not use any of the preceding key name conventions can be accessed
remotely and are not replicated to other domains. The data stored by
the LsaStorePrivateData function is not absolutely protected.
However, the data is encrypted before being stored, and the key has a
DACL that allows only the creator and administrators to read the
data. Use the LsaRetrievePrivateData function to retrieve the value
stored by LsaStorePrivateData.


%index
MSChapSrvChangePassword
Changes the password of a user account.
%group
Win32 advapi32
%prm
ServerName, UserName, LmOldPresent, LmOldOwfPassword, LmNewOwfPassword, NtOldOwfPassword, NtNewOwfPassword
ServerName : [wstr] A pointer to a null-terminated Unicode string that specifies the Universal Naming Convention (UNC) name of the server on which to operate. If this parameter is NULL, the function operates on the local computer.
UserName : [wstr] A pointer to a null-terminated Unicode string that specifies the name of the user whose password is being changed.
LmOldPresent : [int] A BOOLEAN that specifies whether the password designated by LmOldOwfPassword is valid. LmOldPresent is FALSE if the LmOldOwfPassword password is greater than 128-bits in length, and therefore cannot be represented by a Lan Manager (LM) one-way function (OWF) password. Otherwise, it is TRUE.
LmOldOwfPassword : [var] A pointer to a LM_OWF_PASSWORD structure that contains the OWF of the user's current LM  password. This parameter is ignored if LmOldPresent is FALSE.
LmNewOwfPassword : [var] A pointer to a LM_OWF_PASSWORD structure that contains the OWF of the user's new LM password.
NtOldOwfPassword : [var] A pointer to a NT_OWF_PASSWORD structure that contains the OWF of the user's current NT password.
NtNewOwfPassword : [var] A pointer to a NT_OWF_PASSWORD structure that contains the OWF of the user's new NT password.
%inst
Changes the password of a user account.

[戻り値]
If the function succeeds, the return value is STATUS_SUCCESS
(0x00000000). If the function fails, the return value is one of the
following error codes from ntstatus.h.
This doc was truncated.

[備考]
The value specified by LmNewOwfPassword must always contain a valid
OWF. If the new password is greater than 128-bits long, and therefore
cannot be represented by a LAN Manager (LM) password, then
LmNewOwfPassword should be the LM OWF of a NULL password. This
function allows users to change their own passwords only if they have
the access: USER_CHANGE_PASSWORD. This function fails with
STATUS_PASSWORD_RESTRICTION if the attempt to change the password
conflicts with an administrative password restriction.


%index
MSChapSrvChangePassword2
The MSChapSrvChangePassword2 function changes the password of a user account while supporting mutual encryption.
%group
Win32 advapi32
%prm
ServerName, UserName, NewPasswordEncryptedWithOldNt, OldNtOwfPasswordEncryptedWithNewNt, LmPresent, NewPasswordEncryptedWithOldLm, OldLmOwfPasswordEncryptedWithNewLmOrNt
ServerName : [wstr] A pointer to a null-terminated Unicode string that specifies the Universal Naming Convention (UNC) name of the server on which to operate. If this parameter is NULL, the function operates on the local computer.
UserName : [wstr] A pointer to a null-terminated Unicode string that specifies the name of the user whose password is being changed.
NewPasswordEncryptedWithOldNt : [var] A pointer to a SAMPR_ENCRYPTED_USER_PASSWORD structure that contains the new clear text password encrypted using the current NT one-way function (OWF) password hash as the encryption key. Note??Use  the NewPasswordEncryptedWithOldNtPasswordHash() function as defined in RFC 2433, section A.11 to calculate the cipher for NewPasswordEncryptedWithOldNt.
OldNtOwfPasswordEncryptedWithNewNt : [var] A pointer to an ENCRYPTED_NT_OWF_PASSWORD structure that contains the old NT OWF password hash encrypted using the new NT OWF password hash as the encryption key.
LmPresent : [int] A BOOLEAN that specifies if the current Lan Manager (LM) or NT OWF password hashes are used as the encryption keys to generate the NewPasswordEncryptedWithOldNt and OldNtOwfPasswordEncryptedWithNewNt ciphers. If TRUE, the  LM OWF password hashes are used rather than the NT OWF password hashes.
NewPasswordEncryptedWithOldLm : [var] A pointer to a SAMPR_ENCRYPTED_USER_PASSWORD structure that contains the new clear text password encrypted using the current LM OWF password hash. Note??Use  the NewPasswordEncryptedWithOldLmPasswordHash() function as defined in RFC 2433, section A.15 to calculate the cipher for NewPasswordEncryptedWithOldLm.
OldLmOwfPasswordEncryptedWithNewLmOrNt : [var] A pointer to a ENCRYPTED_LM_OWF_PASSWORD structure that contains the current LM OWF password hash encrypted using the new LM OWF password hash.
%inst
The MSChapSrvChangePassword2 function changes the password of a user
account while supporting mutual encryption.

[戻り値]
If the function succeeds, the return value is STATUS_SUCCESS
(0x00000000). If the function fails, the return value is one of the
following error codes from ntstatus.h.
This doc was truncated.

[備考]
This function allows users to change their own passwords only if they
have the access: USER_CHANGE_PASSWORD. This function fails with
STATUS_PASSWORD_RESTRICTION if the attempt to change the password
conflicts with an administrative password restriction.


%index
MakeAbsoluteSD
Creates a security descriptor in absolute format by using a security descriptor in self-relative format as a template.
%group
Win32 advapi32
%prm
pSelfRelativeSecurityDescriptor, pAbsoluteSecurityDescriptor, lpdwAbsoluteSecurityDescriptorSize, pDacl, lpdwDaclSize, pSacl, lpdwSaclSize, pOwner, lpdwOwnerSize, pPrimaryGroup, lpdwPrimaryGroupSize
pSelfRelativeSecurityDescriptor : [int] A pointer to a SECURITY_DESCRIPTOR structure in self-relative format. The function creates an absolute-format version of this security descriptor without modifying the original security descriptor.
pAbsoluteSecurityDescriptor : [int] A pointer to a buffer that the function fills with the main body of an absolute-format security descriptor. This information is formatted as a SECURITY_DESCRIPTOR structure.
lpdwAbsoluteSecurityDescriptorSize : [var] A pointer to a variable that specifies the size of the buffer pointed to by the pAbsoluteSD parameter. If the buffer is not large enough for the security descriptor, the function fails and sets this variable to the minimum required size.
pDacl : [var] A pointer to a buffer the function fills with the discretionary access control list (DACL) of the absolute-format security descriptor. The main body of the absolute-format security descriptor references this pointer.
lpdwDaclSize : [var] A pointer to a variable that specifies the size of the buffer pointed to by the pDacl parameter. If the buffer is not large enough for the access control list (ACL), the function fails and sets this variable to the minimum required size.
pSacl : [var] A pointer to a buffer the function fills with the system access control list (SACL) of the absolute-format security descriptor. The main body of the absolute-format security descriptor references this pointer.
lpdwSaclSize : [var] A pointer to a variable that specifies the size of the buffer pointed to by the pSacl parameter. If the buffer is not large enough for the ACL, the function fails and sets this variable to the minimum required size.
pOwner : [int] A pointer to a buffer the function fills with the security identifier (SID) of the owner of the absolute-format security descriptor. The main body of the absolute-format security descriptor references this pointer.
lpdwOwnerSize : [var] A pointer to a variable that specifies the size of the buffer pointed to by the pOwner parameter. If the buffer is not large enough for the SID, the function fails and sets this variable to the minimum required size.
pPrimaryGroup : [int] A pointer to a buffer the function fills with the SID of the absolute-format security descriptor's primary group. The main body of the absolute-format security descriptor references this pointer.
lpdwPrimaryGroupSize : [var] A pointer to a variable that specifies the size of the buffer pointed to by the pPrimaryGroup parameter. If the buffer is not large enough for the SID, the function fails and sets this variable to the minimum required size.
%inst
Creates a security descriptor in absolute format by using a security
descriptor in self-relative format as a template.

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. To get extended error information,
call GetLastError. Possible return codes include, but are not limited
to, the following.
This doc was truncated.

[備考]
A security descriptor in absolute format contains pointers to the
information it contains, rather than the information itself. A
security descriptor in self-relative format contains the information
in a contiguous block of memory. In a self-relative security
descriptor, a SECURITY_DESCRIPTOR structure always starts the
information, but the security descriptor's other components can
follow the structure in any order. Instead of using memory addresses,
the components of the self-relative security descriptor are
identified by offsets from the beginning of the security descriptor.
This format is useful when a security descriptor must be stored on a
floppy disk or transmitted by means of a communications protocol. A
server that copies secured objects to various media can use the
MakeAbsoluteSD function to create an absolute security descriptor
from a self-relative security descriptor and the MakeSelfRelativeSD
function to create a self-relative security descriptor from an
absolute security descriptor.


%index
MakeSelfRelativeSD
Creates a security descriptor in self-relative format by using a security descriptor in absolute format as a template.
%group
Win32 advapi32
%prm
pAbsoluteSecurityDescriptor, pSelfRelativeSecurityDescriptor, lpdwBufferLength
pAbsoluteSecurityDescriptor : [int] A pointer to a SECURITY_DESCRIPTOR structure in absolute format. The function creates a version of this security descriptor in self-relative format without modifying the original.
pSelfRelativeSecurityDescriptor : [int] A pointer to a buffer the function fills with a security descriptor in self-relative format.
lpdwBufferLength : [var] A pointer to a variable specifying the size of the buffer pointed to by the pSelfRelativeSD parameter. If the buffer is not large enough for the security descriptor, the function fails and sets this variable to the minimum required size.
%inst
Creates a security descriptor in self-relative format by using a
security descriptor in absolute format as a template.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. Possible return codes include, but
are not limited to, the following.
This doc was truncated.

[備考]
A security descriptor in absolute format contains pointers to the
information it contains, rather than containing the information
itself. A security descriptor in self-relative format contains the
information in a contiguous block of memory. In a self-relative
security descriptor, a SECURITY_DESCRIPTOR structure always starts
the information, but the security descriptor's other components can
follow the structure in any order. Instead of using memory addresses,
the components of the security descriptor are identified by offsets
from the beginning of the security descriptor. This format is useful
when a security descriptor must be stored on a floppy disk or
transmitted by means of a communications protocol. A server that
copies secured objects to various media can use the
MakeSelfRelativeSD function to create a self-relative security
descriptor from an absolute security descriptor and the
MakeAbsoluteSD function to create an absolute security descriptor
from a self-relative security descriptor.


%index
MapGenericMask
Maps the generic access rights in an access mask to specific and standard access rights. The function applies a mapping supplied in a GENERIC_MAPPING structure.
%group
Win32 advapi32
%prm
AccessMask, GenericMapping
AccessMask : [var] A pointer to an access mask.
GenericMapping : [var] A pointer to a GENERIC_MAPPING structure specifying a mapping of generic access types to specific and standard access types.
%inst
Maps the generic access rights in an access mask to specific and
standard access rights. The function applies a mapping supplied in a
GENERIC_MAPPING structure.

[備考]
After calling the MapGenericMask function, the access mask pointed to
by the AccessMask parameter has none of its generic bits
(GenericRead, GenericWrite, GenericExecute, or GenericAll) or
undefined bits set, although it can have other bits set. If bits
other than the generic bits are provided on input, this function does
not clear them.


%index
NotifyBootConfigStatus
Reports the boot status to the service control manager. It is used by boot verification programs.
%group
Win32 advapi32
%prm
BootAcceptable
BootAcceptable : [int] If the value is TRUE, the system saves the configuration as the last-known good configuration. If the value is FALSE, the system immediately reboots, using the previously saved last-known good configuration.
%inst
Reports the boot status to the service control manager. It is used by
boot verification programs.

[戻り値]
If the BootAcceptable parameter is FALSE, the function does not
return. If the last-known good configuration was successfully saved,
the return value is nonzero. If an error occurs, the return value is
zero. To get extended error information, call GetLastError. The
following error codes may be set by the service control manager.
Other error codes may be set by the registry functions that are
called by the service control manager to set parameters in the
configuration registry.
This doc was truncated.

[備考]
Saving the configuration of a running system with this function is an
acceptable method for saving the last-known good configuration. If
the boot configuration is unacceptable, use this function to reboot
the system using the existing last-known good configuration. This
function call requires the caller's token to have permission to
acquire the SC_MANAGER_MODIFY_BOOT_CONFIG access right. For more
information, see Service Security and Access Rights.


%index
NotifyChangeEventLog
Enables an application to receive notification when an event is written to the specified event log.
%group
Win32 advapi32
%prm
hEventLog, hEvent
hEventLog : [intptr] A handle to an event log. The OpenEventLog  function returns this handle.
hEvent : [intptr] A handle to a manual-reset or auto-reset event object. Use the CreateEvent function to create the event object.
%inst
Enables an application to receive notification when an event is
written to the specified event log.

[戻り値]
If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. To get extended
error information, call GetLastError.

[備考]
The NotifyChangeEventLog function does not work with remote handles.
If the hEventLog parameter is the handle to an event log on a remote
computer, NotifyChangeEventLog returns zero, and GetLastError returns
ERROR_INVALID_HANDLE. If the thread is not waiting on the event when
the system calls PulseEvent, the thread will not receive the
notification. Therefore, you should create a separate thread to wait
for notifications. The system will continue to notify you of changes
until you close the handle to the event log. To close the event log,
use the CloseEventLog or DeregisterEventSource function.


%index
NotifyServiceStatusChangeW
Enables an application to receive notification when the specified service is created or deleted or when its status changes. (Unicode)
%group
Win32 advapi32
%prm
hService, dwNotifyMask, pNotifyBuffer
hService : [intptr] A handle to the service or the service control manager. Handles to services are returned by the OpenService or CreateService function and must have the SERVICE_QUERY_STATUS access right. Handles to the service control manager are returned by the OpenSCManager function and must have the SC_MANAGER_ENUMERATE_SERVICE access right. For more information, see Service Security and Access Rights. There can only be one outstanding notification request per service.
dwNotifyMask : [int] 
pNotifyBuffer : [var] A pointer to a SERVICE_NOTIFY structure that contains notification information, such as a pointer to the callback function. This structure must remain valid until the callback function is invoked or the calling thread cancels the notification request. Do not make multiple calls to NotifyServiceStatusChange with the same buffer parameter until the callback function from the first call has finished with the buffer or the first notification request has been canceled. Otherwise, there is no guarantee which version of the buffer the callback function will receive. Windows?Vista:??The address of the callback function must be within the address range of a loaded module. Therefore, the callback function cannot be code that is generated at run time (such as managed code generated by the JIT compiler) or native code that is decompressed at run time. This restriction was removed in Windows Server?2008 and Windows?Vista with SP1.
%inst
Enables an application to receive notification when the specified
service is created or deleted or when its status changes. (Unicode)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
service has been marked for deletion, the return value is
ERROR_SERVICE_MARKED_FOR_DELETE and the handle to the service must be
closed. If service notification is lagging too far behind the system
state, the function returns ERROR_SERVICE_NOTIFY_CLIENT_LAGGING. In
this case, the client should close the handle to the SCM, open a new
handle, and call this function again. If the function fails, the
return value is one of the system error codes.

[備考]
The NotifyServiceStatusChange function can be used to receive
notifications about service applications. It cannot be used to
receive notifications about driver services. When the service status
changes, the system invokes the specified callback function as an
asynchronous procedure call (APC) queued to the calling thread. The
calling thread must enter an alertable wait (for example, by calling
the SleepEx function) to receive notification. For more information,
see Asynchronous Procedure Calls. If the service is already in any of
the requested states when NotifyServiceStatusChange is called, the
callback function is queued immediately. If the service state has not
changed by the next time the function is called with the same service
and state, the callback function is not queued immediately; the
callback function is queued the next time the service enters the
requested state. The NotifyServiceStatusChange function calls the
OpenThread function on the calling thread with the THREAD_SET_CONTEXT
access right. If the calling thread does not have this access right,
NotifyServiceStatusChange fails. If the calling thread is
impersonating another user, it may not have sufficient permission to
set context. It is more efficient to call NotifyServiceStatusChange
from a thread that performs a wait than to create an additional
thread. After the callback function is invoked, the caller must call
NotifyServiceStatusChange to receive additional notifications. Note
that certain functions in the Windows API, including
NotifyServiceStatusChange and other SCM functions, use remote
procedure calls (RPC); these functions might perform an alertable
wait operation, so they are not safe to call from within the callback
function. Instead, the callback function should save the notification
parameters and perform any additional work outside the callback. To
cancel outstanding notifications, close the service handle using the
CloseServiceHandle function. After CloseServiceHandle succeeds, no
more notification APCs will be queued. If the calling thread exits
without closing the service handle or waiting until the APC is
generated, a memory leak can occur. Important If the calling thread
is in a DLL and the DLL is unloaded before the thread receives the
notification or calls CloseServiceHandle, the notification will cause
unpredictable results and might cause the process to stop responding.
> [!NOTE] > The winsvc.h header defines NotifyServiceStatusChange as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ObjectCloseAuditAlarmW
Generates an audit message in the security event log when a handle to a private object is deleted. (ObjectCloseAuditAlarmW)
%group
Win32 advapi32
%prm
SubsystemName, HandleId, GenerateOnClose
SubsystemName : [wstr] A pointer to a null-terminated string specifying the name of the subsystem calling the function. This string appears in any audit message that the function generates.
HandleId : [intptr] A unique value representing the client's handle to the object. This should be the same value that was passed to the AccessCheckAndAuditAlarm or ObjectOpenAuditAlarm function.
GenerateOnClose : [int] Specifies a flag set by a call to the AccessCheckAndAuditAlarm or ObjectCloseAuditAlarm function when the object handle is created. If this flag is TRUE, the function generates an audit message. If it is FALSE, the function does not generate an audit message.
%inst
Generates an audit message in the security event log when a handle to
a private object is deleted. (ObjectCloseAuditAlarmW)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The ObjectCloseAuditAlarm function requires the calling application
to have the SE_AUDIT_NAME privilege enabled. The test for this
privilege is always performed against the primary token of the
calling process, allowing the calling process to impersonate a client


%index
ObjectDeleteAuditAlarmW
The ObjectDeleteAuditAlarmW (Unicode) function (securitybaseapi.h) generates audit messages when an object is deleted.
%group
Win32 advapi32
%prm
SubsystemName, HandleId, GenerateOnClose
SubsystemName : [wstr] A pointer to a null-terminated string specifying the name of the subsystem calling the function. This string appears in any audit message that the function generates.
HandleId : [intptr] Specifies a unique value representing the client's handle to the object. This must be the same value that was passed to the AccessCheckAndAuditAlarm or ObjectOpenAuditAlarm function.
GenerateOnClose : [int] Specifies a flag set by a call to the AccessCheckAndAuditAlarm or ObjectOpenAuditAlarm function when the object handle is created.
%inst
The ObjectDeleteAuditAlarmW (Unicode) function (securitybaseapi.h)
generates audit messages when an object is deleted.

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The ObjectDeleteAuditAlarm function requires the calling application
to have the SE_AUDIT_NAME privilege enabled. The test for this
privilege is always performed against the primary token of the
calling process, allowing the calling process to impersonate a
client.


%index
ObjectOpenAuditAlarmW
Generates audit messages when a client application attempts to gain access to an object or to create a new one. (ObjectOpenAuditAlarmW)
%group
Win32 advapi32
%prm
SubsystemName, HandleId, ObjectTypeName, ObjectName, pSecurityDescriptor, ClientToken, DesiredAccess, GrantedAccess, Privileges, ObjectCreation, AccessGranted, GenerateOnClose
SubsystemName : [wstr] A pointer to a null-terminated string specifying the name of the subsystem calling the function. This string appears in any audit message that the function generates.
HandleId : [intptr] A pointer to a unique value representing the client's handle to the object. If the access is denied, this parameter is ignored. For cross-platform compatibility, the value addressed by this pointer must be sizeof(LPVOID) bytes long.
ObjectTypeName : [wstr] A pointer to a null-terminated string specifying the type of object to which the client is requesting access. This string appears in any audit message that the function generates.
ObjectName : [wstr] A pointer to a null-terminated string specifying the name of the object to which the client is requesting access. This string appears in any audit message that the function generates.
pSecurityDescriptor : [int] A pointer to the SECURITY_DESCRIPTOR structure for the object being accessed.
ClientToken : [intptr] Identifies an access token representing the client requesting the operation. This handle must be obtained by opening the token of a thread impersonating the client. The token must be open for TOKEN_QUERY access.
DesiredAccess : [int] Specifies the desired access mask. This mask must have been previously mapped by the MapGenericMask function to contain no generic access rights.
GrantedAccess : [int] Specifies an access mask indicating which access rights are granted. This access mask is intended to be the same value set by one of the access-checking functions in its GrantedAccess parameter. Examples of access-checking functions include AccessCheckAndAuditAlarm and AccessCheck.
Privileges : [var] A pointer to a PRIVILEGE_SET structure that specifies the set of privileges required for the access attempt. This parameter can be NULL.
ObjectCreation : [int] Specifies a flag that determines whether the application creates a new object when access is granted. When this value is TRUE, the application creates a new object; when it is FALSE, the application opens an existing object.
AccessGranted : [int] Specifies a flag indicating whether access was granted or denied in a previous call to an access-checking function, such as AccessCheck. If access was granted, this value is TRUE. If not, it is FALSE.
GenerateOnClose : [var] A pointer to a flag set by the audit-generation routine when the function returns. This value must be passed to the ObjectCloseAuditAlarm function when the object handle is closed.
%inst
Generates audit messages when a client application attempts to gain
access to an object or to create a new one. (ObjectOpenAuditAlarmW)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The ObjectOpenAuditAlarm function requires the calling application to
have the SE_AUDIT_NAME privilege enabled. The test for this privilege
is always performed against the primary token of the calling process,
not the impersonation token of the thread. This allows the calling
process to impersonate a client during the call.


%index
ObjectPrivilegeAuditAlarmW
Generates an audit message in the security event log.  (ObjectPrivilegeAuditAlarmW)
%group
Win32 advapi32
%prm
SubsystemName, HandleId, ClientToken, DesiredAccess, Privileges, AccessGranted
SubsystemName : [wstr] A pointer to a null-terminated string specifying the name of the subsystem calling the function. This string appears in the audit message.
HandleId : [intptr] A pointer to a unique value representing the client's handle to the object.
ClientToken : [intptr] Identifies an access token representing the client that requested the operation. This handle must have been obtained by opening the token of a thread impersonating the client. The token must be open for TOKEN_QUERY access. The function uses this token to get the identity of the client for the audit message.
DesiredAccess : [int] Specifies an access mask indicating the privileged access types being used or whose use is being attempted. The access mask can be mapped by the MapGenericMask function so it does not contain any generic access types.
Privileges : [var] A pointer to a PRIVILEGE_SET structure containing the privileges that the client attempted to use. The names of the privileges appear in the audit message.
AccessGranted : [int] Indicates whether the client's attempt to use the privileges was successful. If this value is TRUE, the audit message indicates success. If this value is FALSE, the audit message indicates failure.
%inst
Generates an audit message in the security event log.
(ObjectPrivilegeAuditAlarmW)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The ObjectPrivilegeAuditAlarm function does not check the client's
access to the object or check the client's access token to determine
whether the privileges are held or enabled. Typically, you call the
PrivilegeCheck function to determine whether the specified privileges
are enabled in the access token, call the AccessCheck function to
check the client's access to the object, and then call
ObjectPrivilegeAuditAlarm to log the results. The
ObjectPrivilegeAuditAlarm function requires the calling process to
have SE_AUDIT_NAME privilege enabled. The test for this privilege is
always performed against the primary token of the calling process,
not the impersonation token of the thread. This allows the calling
process to impersonate a client during the call.


%index
OpenBackupEventLogW
Opens a handle to a backup event log created by the BackupEventLog function. (Unicode)
%group
Win32 advapi32
%prm
lpUNCServerName, lpFileName
lpUNCServerName : [wstr] The Universal Naming Convention (UNC) name of the remote server on which this operation is to be performed. If this parameter is NULL, the local computer is used.
lpFileName : [wstr] The full path of the backup file.
%inst
Opens a handle to a backup event log created by the BackupEventLog
function. (Unicode)

[戻り値]
If the function succeeds, the return value is a handle to the backup
event log.
If the function fails, the return value is NULL. To get extended
error information, call GetLastError.

[備考]
If the backup filename specifies a remote server, the lpUNCServerName
parameter must be NULL. When this function is used on Windows Vista
and later computers, only backup event logs that were saved with the
BackupEventLog function on Windows Vista and later computers can be
opened.
> [!NOTE] > The winbase.h header defines OpenBackupEventLog as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
OpenEncryptedFileRawW
Opens an encrypted file in order to backup (export) or restore (import) the file. (Unicode)
%group
Win32 advapi32
%prm
lpFileName, ulFlags, pvContext
lpFileName : [wstr] The name of the file to be opened. The string must consist of characters from the Windows character set.
ulFlags : [int] The operation to be performed. This parameter may be one of the following values.
pvContext : [var] The address of a  context block that must be presented in subsequent calls to ReadEncryptedFileRaw, WriteEncryptedFileRaw, or CloseEncryptedFileRaw.  Do not modify it.
%inst
Opens an encrypted file in order to backup (export) or restore
(import) the file. (Unicode)

[戻り値]
If the function succeeds, it returns ERROR_SUCCESS. If the function
fails, it returns a nonzero error code defined in WinError.h. You can
use FormatMessage with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a
generic text description of the error.

[備考]
The caller must either have read or write access to the file, or it
must have backup privilege SeBackupPrivilege on the machine on which
the files reside in order for the call to succeed. To back up an
encrypted file, call OpenEncryptedFileRaw to open the file and then
call ReadEncryptedFileRaw. When the backup is complete, call
CloseEncryptedFileRaw. To restore an encrypted file, call
OpenEncryptedFileRaw, specifying CREATE_FOR_IMPORT in the ulFlags
parameter, and then call WriteEncryptedFileRaw once. When the
operation is completed, call CloseEncryptedFileRaw.
OpenEncryptedFileRaw fails if lpFileName exceeds MAX_PATH characters
when opening an encrypted file on a remote machine. If the caller
does not have access to the key for the file, the caller needs
SeBackupPrivilege to export encrypted files or SeRestorePrivilege to
import encrypted files.
The BackupRead and BackupWrite functions handle backup and restore of
unencrypted files. In Windows 8, Windows Server 2012, and later, this
function is supported by the following technologies.
This doc was truncated.


%index
OpenEventLogW
Opens a handle to the specified event log. (Unicode)
%group
Win32 advapi32
%prm
lpUNCServerName, lpSourceName
lpUNCServerName : [wstr] The Universal Naming Convention (UNC) name of the remote server on which the event log is to be opened. If this parameter is NULL, the local computer is used.
lpSourceName : [wstr] The name of the log. If you specify a custom log and it cannot be found, the event logging service opens the Application log; however, there will be no associated message or category string file.
%inst
Opens a handle to the specified event log. (Unicode)

[戻り値]
If the function succeeds, the return value is the handle to an event
log.
If the function fails, the return value is NULL. To get extended
error information, call GetLastError.

[備考]
To close the handle to the event log, use the CloseEventLog function.


%index
OpenProcessToken
Opens the access token associated with a process.
%group
Win32 advapi32
%prm
ProcessHandle, DesiredAccess, TokenHandle
ProcessHandle : [intptr] A handle to the process whose access token is opened. The process must have the PROCESS_QUERY_LIMITED_INFORMATION access permission. See [Process Security and Access Rights](/windows/win32/procthread/process-security-and-access-rights) for more info.
DesiredAccess : [int] Specifies an access mask that specifies the requested types of access to the access token. These requested access types are compared with the discretionary access control list (DACL) of the token to determine which accesses are granted or denied.
TokenHandle : [intptr] A pointer to a handle that identifies the newly opened access token when the function returns.
%inst
Opens the access token associated with a process.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
To get a handle to an elevated process from within a non-elevated
process, both processes must be started from the same account. If the
process being checked was started by a different account, the
checking process needs to have the SE_DEBUG_NAME privilege enabled.
See [Privilege Constants
(Authorization)](/windows/win32/secauthz/privilege-constants) for
more info. To close the access token handle returned through the
TokenHandle parameter, call CloseHandle.


%index
OpenSCManagerW
Establishes a connection to the service control manager on the specified computer and opens the specified service control manager database. (Unicode)
%group
Win32 advapi32
%prm
lpMachineName, lpDatabaseName, dwDesiredAccess
lpMachineName : [wstr] The name of the target computer. If the pointer is NULL or points to an empty string, the function connects to the service control manager on the local computer.
lpDatabaseName : [wstr] The name of the service control manager database. This parameter should be set to SERVICES_ACTIVE_DATABASE. If it is NULL, the SERVICES_ACTIVE_DATABASE database is opened by default.
dwDesiredAccess : [int] The access to the service control manager. For a list of access rights, see Service Security and Access Rights.
%inst
Establishes a connection to the service control manager on the
specified computer and opens the specified service control manager
database. (Unicode)

[戻り値]
If the function succeeds, the return value is a handle to the
specified service control manager database. If the function fails,
the return value is NULL. To get extended error information, call
GetLastError. The following error codes can be set by the SCM. Other
error codes can be set by the registry functions that are called by
the SCM.
This doc was truncated.

[備考]
When a process uses the OpenSCManager function to open a handle to a
service control manager database, the system performs a security
check before granting the requested access. For more information, see
Service Security and Access Rights. If the current user does not have
proper access when connecting to a service on another computer, the
OpenSCManager function call fails. To connect to a service remotely,
call the LogonUser function with LOGON32_LOGON_NEW_CREDENTIALS and
then call ImpersonateLoggedOnUser before calling OpenSCManager. For
more information about connecting to services remotely, see Services
and RPC/TCP. Only processes with Administrator privileges are able to
open a database handle that can be used by the CreateService
function. The returned handle is only valid for the process that
called the OpenSCManager function. It can be closed by calling the
CloseServiceHandle function.


%index
OpenServiceW
Opens an existing service. (Unicode)
%group
Win32 advapi32
%prm
hSCManager, lpServiceName, dwDesiredAccess
hSCManager : [intptr] A handle to the service control manager database. The OpenSCManager function returns this handle. For more information, see Service Security and Access Rights.
lpServiceName : [wstr] The name of the service to be opened. This is the name specified by the lpServiceName parameter of the CreateService function when the service object was created, not the service display name that is shown by user interface applications to identify the service. The maximum string length is 256 characters. The service control manager database preserves the case of the characters, but service name comparisons are always case insensitive. Forward-slash (/) and backslash (\\) are invalid service name characters.
dwDesiredAccess : [int] The access to the service. For a list of access rights, see Service Security and Access Rights.
%inst
Opens an existing service. (Unicode)

[戻り値]
If the function succeeds, the return value is a handle to the
service. If the function fails, the return value is NULL. To get
extended error information, call GetLastError. The following error
codes can be set by the service control manager. Others can be set by
the registry functions that are called by the service control
manager.
This doc was truncated.

[備考]
The returned handle is only valid for the process that called
OpenService. It can be closed by calling the CloseServiceHandle
function. To use OpenService, no privileges are required aside from
SC_MANAGER_CONNECT.


%index
OpenThreadToken
Opens the access token associated with a thread.
%group
Win32 advapi32
%prm
ThreadHandle, DesiredAccess, OpenAsSelf, TokenHandle
ThreadHandle : [intptr] A handle to the thread whose access token is opened.
DesiredAccess : [int] Specifies an access mask that specifies the requested types of access to the access token. These requested access types are reconciled against the token's discretionary access control list (DACL) to determine which accesses are granted or denied.
OpenAsSelf : [int] TRUE if the access check is to be made against the  process-level security context. FALSE if the access check is to be made against the current security context of the thread calling the OpenThreadToken function. The OpenAsSelf parameter allows the caller of this function to open the access token of a specified thread when the caller is impersonating a token at SecurityIdentification level. Without this parameter, the calling thread cannot open the access token on the specified thread because it is impossible to open executive-level objects by using the SecurityIdentification impersonation level.
TokenHandle : [intptr] A pointer to a variable that receives the handle to the newly opened access token.
%inst
Opens the access token associated with a thread.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. If the token has the anonymous
impersonation level, the token will not be opened and OpenThreadToken
sets ERROR_CANT_OPEN_ANONYMOUS as the error.

[備考]
Tokens with the anonymous impersonation level cannot be opened. Close
the access token handle returned through the TokenHandle parameter by
calling CloseHandle.


%index
OpenThreadWaitChainSession
Creates a new WCT session.
%group
Win32 advapi32
%prm
Flags, callback
Flags : [int] 
callback : [int] If the session is asynchronous, this parameter can be a pointer to a WaitChainCallback callback function.
%inst
Creates a new WCT session.

[戻り値]
If the function succeeds, the return value is a handle to the newly
created session. If the function fails, the return value is NULL. To
get extended error information, call GetLastError.

[備考]
When you have finished using the session, call the
CloseThreadWaitChainSession function.


%index
OpenTraceW
The OpenTraceW (Unicode) function (evntrace.h) opens an ETW trace processing handle for consuming events from an ETW real-time trace session or an ETW log file.
%group
Win32 advapi32
%prm
Logfile
Logfile : [var] Pointer to an [EVENT_TRACE_LOGFILE](/windows/win32/api/evntrace/ns-evntrace-event_trace_logfilew) structure. The structure specifies the source from which to consume events (from an ETW log file or a real-time ETW session) and specifies the callbacks the consumer wants to use to receive the events. On success, **OpenTrace** will update the structure with information from the opened file or session.
%inst
The OpenTraceW (Unicode) function (evntrace.h) opens an ETW trace
processing handle for consuming events from an ETW real-time trace
session or an ETW log file.

[戻り値]
If the function succeeds, it returns the trace processing handle. The
handle should be closed using
[CloseTrace](/windows/win32/api/evntrace/nf-evntrace-closetrace). If
the function fails, it returns **INVALID_PROCESSTRACE_HANDLE**.
(**INVALID_PROCESSTRACE_HANDLE** is equivalent to
`(UINT64)UINTPTR_MAX`.) > [!Note] > Prior to Windows Vista, OpenTrace
returned `UINT64_MAX` in case of > failure. If your code supports
both older operating systems (Windows XP or > Windows Server 2003)
and newer versions of Windows (Windows Vista and later), > you must
determine the operating system on which you are running and compare >
the return value to the appropriate value. | Operating system |
Process Type | Value indicating failure | | ---------------------- |
------------- | -------------------------------------------- | |
Prior to Windows Vista | 32- or 64-bit | `0XFFFFFFFFFFFFFFFF` =
`UINT64_MAX` | | Windows Vista or later | 32-bit |
`0x00000000FFFFFFFF` = `(UINT64)UINTPTR_MAX` | | Windows Vista or
later | 64-bit | `0XFFFFFFFFFFFFFFFF` = `(UINT64)UINTPTR_MAX` | If
the function fails, you can use the
[GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
function to obtain extended error information. The following are some
common errors and their causes. - **ERROR_INVALID_PARAMETER** The
_Logfile_ parameter is **NULL**. - **ERROR_BAD_PATHNAME** If you did
not specify the **LoggerName** member of
[EVENT_TRACE_LOGFILE](/windows/win32/api/evntrace/ns-evntrace-event_trace_logfilew),
you must specify a valid log file name. - **ERROR_ACCESS_DENIED**
Only users with administrative privileges, users in the Performance
Log Users group, and services running as LocalSystem, LocalService,
NetworkService can consume events in real time. To grant a restricted
user the ability to consume events in real time, add them to the
Performance Log Users group. **Windows XP and Windows 2000:** Anyone
can consume real time events.

[備考]
Trace consumers call this function to open a trace processing
session. After calling **OpenTrace**, call the
[ProcessTrace](/windows/win32/api/evntrace/nf-evntrace-processtrace)
function to process the events. When you have finished processing
events, call the
[CloseTrace](/windows/win32/api/evntrace/nf-evntrace-closetrace)
function to close the trace processing handle.


%index
OperationEnd
Notifies the system that the application is about to end an operation.
%group
Win32 advapi32
%prm
OperationEndParams
OperationEndParams : [var] An _OPERATION_END_PARAMETERS structure that specifies VERSION, OPERATION_ID and FLAGS.
%inst
Notifies the system that the application is about to end an
operation.

[戻り値]
TRUE for all valid parameters and FALSE otherwise. To get extended
error information, call GetLastError.

[備考]
The version of the _OPERATION_END_PARAMETERS structure is defined as
OPERATION_API_VERSION in the Windows SDK. The OperationEnd function
is safe to call on any thread.


%index
OperationStart
Notifies the system that the application is about to start an operation.
%group
Win32 advapi32
%prm
OperationStartParams
OperationStartParams : [var] An _OPERATION_START_PARAMETERS structure that specifies VERSION, OPERATION_ID and FLAGS.
%inst
Notifies the system that the application is about to start an
operation.

[戻り値]
TRUE for all valid parameters and FALSE otherwise. To get extended
error information, call GetLastError.

[備考]
The version of the _OPERATION_START_PARAMETERS structure is defined
as OPERATION_API_VERSION in the Windows SDK. Because the
OperationStart function is synchronous, it can take several seconds
to return. This should be avoided in UI threads for the best
responsiveness. There is a single instance of the operation recorder
in a process. Although the operation recorder APIs can be called from
multiple threads within the process, all calls act on the single
instance. Application launch tracing lasts for the first 10 second of
the process lifetime. OperationStart should be called after the end
of application launch tracing by the system. Every call to
OperationStart must be followed by a call to OperationEnd. Otherwise,
the operation trace will be discarded after about 10s. The maximum
number of operations that can be recorded on a given system is
configurable. If this maximum is exceeded, the least recently used
prefetch files are replaced. On Windows 8, this functionality
requires the Superfetch service to be enabled. Windows 8 will have
the service enabled by default. For Windows Server 2012, this
prefetching functionality needs to be enabled and disabled as
required. This can be done using CIM based PowerShell cmdlets. The
prefetcher functionality can be exposed using the CIM class of the
CIM_PrefetcherService.


%index
PerfAddCounters
Adds performance counter specifications to the specified query.
%group
Win32 advapi32
%prm
hQuery, pCounters, cbCounters
hQuery : [intptr] A handle to the query to which you want to add performance counter specifications.
pCounters : [var] A pointer to the performance counter specifications that you want to add.
cbCounters : [int] The size of the buffer that the pCounters parameter specifies, in bytes.
%inst
Adds performance counter specifications to the specified query.

[戻り値]
If the function succeeds, it returns ERROR_SUCCESS.
If the function fails, the return value is a system error code.

[備考]
The pCounters parameter should point to a sequence of
PERF_COUNTER_IDENTIFIER blocks. Each PERF_COUNTER_IDENTIFIER block
consists of a PERF_COUNTER_IDENTIFIER structure, optionally followed
by a null-terminated UTF-16LE instance name string, followed by
padding that makes the size of the block a multiple of 8 bytes. For
each PERF_COUNTER_IDENTIFIER block:
This doc was truncated.


%index
PerfCloseQueryHandle
Closes a query handle that you opened by calling PerfOpenQueryHandle.
%group
Win32 advapi32
%prm
hQuery
hQuery : [intptr] A handle to the query that you want to close
%inst
Closes a query handle that you opened by calling PerfOpenQueryHandle.

[戻り値]
If the function succeeds, it returns ERROR_SUCCESS.
If the function fails, the return value is a system error code.


%index
PerfDeleteCounters
Removes the specified performance counter specifications from the specified query.
%group
Win32 advapi32
%prm
hQuery, pCounters, cbCounters
hQuery : [intptr] A handle to the query from which you want to remove performance counter specifications.
pCounters : [var] A pointer to the performance counter specifications that you want to remove.
cbCounters : [int] The size of the buffer that the pCounters parameter specifies, in bytes.
%inst
Removes the specified performance counter specifications from the
specified query.

[戻り値]
If the function succeeds, it returns ERROR_SUCCESS.
If the function fails, the return value is a system error code.

[備考]
The pCounters parameter should point to a sequence of
PERF_COUNTER_IDENTIFIER blocks. Each PERF_COUNTER_IDENTIFIER block
consists of a PERF_COUNTER_IDENTIFIER structure, optionally followed
by a null-terminated UTF-16LE instance name string, followed by
padding that makes the size of the block a multiple of 8 bytes.
Configure each PERF_COUNTER_IDENTIFIER block in the same way as
described in the Remarks for PerfAddCounters.
PerfDeleteCounters attempts to remove one counter specification from
the query for each PERF_COUNTER_IDENTIFIER block, and updates the
Status member of the PERF_COUNTER_IDENTIFIER structure in each block
with the result of the attempt.


%index
PerfEnumerateCounterSet
Gets the counter set identifiers of the counter sets that are registered on the specified system. Counter set identifiers are globally unique identifiers (GUIDs).
%group
Win32 advapi32
%prm
szMachine, pCounterSetIds, cCounterSetIds, pcCounterSetIdsActual
szMachine : [wstr] The name of the machine for which to get the counter set identifiers. If NULL, the function retrieves the counter set identifiers for the local machine.
pCounterSetIds : [var] A pointer to a buffer that has enough space to receive the number of GUIDs that the cCounterSetIds parameter specifies. May be NULL if cCounterSetIds is 0.
cCounterSetIds : [int] The size of the buffer that the pCounterSetIds parameter specifies, measured in GUIDs.
pcCounterSetIdsActual : [var] The size of the buffer actually required to get the counter set identifiers. The meaning depends on the value that the function returns.
%inst
Gets the counter set identifiers of the counter sets that are
registered on the specified system. Counter set identifiers are
globally unique identifiers (GUIDs).

[戻り値]
This doc was truncated.


%index
PerfEnumerateCounterSetInstances
Gets the names and identifiers of the active instances of a counter set on the specified system.
%group
Win32 advapi32
%prm
szMachine, pCounterSetId, pInstances, cbInstances, pcbInstancesActual
szMachine : [wstr] The name of the machine for which to get the information about the active instances of the counter set  that the pCounterSet parameter specifies. If NULL, the function retrieves information about the active instances of the specified counter set for the local machine.
pCounterSetId : [var] The counter set identifier of the counter set for which you want to get the information about of the active instances.
pInstances : [var] Pointer to a buffer that is large enough to receive the amount of data that the cbInstances parameter specifies. May be NULL if cbInstances is 0.
cbInstances : [int] The size of the buffer that the  pInstances parameter specifies,  in bytes.
pcbInstancesActual : [var] The size of the buffer actually required to get the information about of the active instances. The meaning depends on the value that the function returns.
%inst
Gets the names and identifiers of the active instances of a counter
set on the specified system.

[戻り値]
This doc was truncated.

[備考]
The information about the active instances of the specified counter
set is written to the buffer that pInstances specifies as a sequence
of PERF_INSTANCE_HEADER blocks. The size in bytes of the sequence of
blocks is written to pcbInstancesActual. Each PERF_INSTANCE_HEADER
block consists of a PERF_INSTANCE_HEADER structure, immediately
followed by a null-terminated UTF-16LE instance name, followed by
padding so that the size of the PERF_INSTANCE_HEADER block is a
multiple of 8 bytes.


%index
PerfOpenQueryHandle
Creates a handle that references a query on the specified system. A query is a list of counter specifications.
%group
Win32 advapi32
%prm
szMachine, phQuery
szMachine : [wstr] The name of the machine for which you want to get the query handle.
phQuery : [intptr] The handle to the query. Call PerfCloseQueryHandle to close ths handle when you no longer need it.
%inst
Creates a handle that references a query on the specified system. A
query is a list of counter specifications.

[戻り値]
If the function succeeds, it returns ERROR_SUCCESS.
If the function fails, the return value is a system error code.

[備考]
Use PerfAddCounters and PerfDeleteCounters to add or remove counter
specifications to the list. Use PerfQueryCounterInfo to get the
counter specifications currently in the list and to determine the
indexes at which the data for each counter will be returned by
PerfQueryCounterData. Use PerfQueryCounterData to retrieve the values
of the counters that match the counter specifications.


%index
PerfQueryCounterData
Gets the values of the performance counters that match the counter specifications in the specified query.
%group
Win32 advapi32
%prm
hQuery, pCounterBlock, cbCounterBlock, pcbCounterBlockActual
hQuery : [intptr] A handle to a query for the counter specifications of the performance counters for which you want to get the values.
pCounterBlock : [var] A pointer to a buffer that has enough space to receive the amount of  data that the cbCounterBlock parameter specifies, in bytes. May be NULL if cbCounterBlock is 0.
cbCounterBlock : [int] The size of the buffer that the pCounterBlock parameter specifies, in bytes.
pcbCounterBlockActual : [var] The size of the buffer actually required to get the performance counter values. The meaning depends on the value that the function returns.
%inst
Gets the values of the performance counters that match the counter
specifications in the specified query.

[戻り値]
This doc was truncated.

[備考]
The information about the performance counter values is written to
the buffer that pCounterBlock specifies as a PERF_DATA_HEADER block,
which consists PERF_DATA_HEADER structure followed by a sequence of
PERF_COUNTER_HEADER blocks.


%index
PerfQueryCounterInfo
Gets the counter specifications in the specified query.
%group
Win32 advapi32
%prm
hQuery, pCounters, cbCounters, pcbCountersActual
hQuery : [intptr] A handle to the query for which you want to get the counter specifications
pCounters : [var] Pointer to a buffer that is large enough to hold the amount of data that the cbCounters parameter specifies, in bytes. May be NULL if cbCounters is 0.
cbCounters : [int] The size of the pCounters buffer, in bytes.
pcbCountersActual : [var] The size of the buffer actually required to get the counter specifications. The meaning depends on the value that the function returns.
%inst
Gets the counter specifications in the specified query.

[戻り値]
This doc was truncated.

[備考]
The information about the counter specifications is written to the
buffer that pCounters specifies as a sequence of
PERF_COUNTER_IDENTIFIER blocks. The size in bytes of the sequence of
blocks is written to pcbCountersActual. Each PERF_COUNTER_IDENTIFIER
block consists of a PERF_COUNTER_IDENTIFIER structure, optionally
followed by a null-terminated UTF-16LE instance name, followed by
padding so that the size of the PERF_COUNTER_IDENTIFIER block is a
multiple of 8 bytes. The size of each block, including the
PERF_COUNTER_IDENTIFIER structure, instance name, and padding, is
determined by the Size member of the PERF_COUNTER_IDENTIFIER
structure, which will be a multiple of 8 bytes.


%index
PerfQueryCounterSetRegistrationInfo
Gets information about a counter set on the specified system.
%group
Win32 advapi32
%prm
szMachine, pCounterSetId, requestCode, requestLangId, pbRegInfo, cbRegInfo, pcbRegInfoActual
szMachine : [wstr] The name of the machine for which to get the information about the counter set  that the pCounterSet parameter specifies. If NULL, the function retrieves information about the specified counter set for the local machine.
pCounterSetId : [var] The counter set identifier of the counter set for which you want to get information.
requestCode : [int] The type of information that you want to get about the counter set. See PerfRegInfoType for a list of possible values.
requestLangId : [int] The preferred locale identifier for the strings that contain the requested information if requestCode is PERF_REG_COUNTERSET_NAME_STRING, PERF_REG_COUNTERSET_HELP_STRING, PERF_REG_COUNTER_NAME_STRINGS, or PERF_REG_COUNTER_HELP_STRINGS. The counter identifier of the counter for which you want data, if requestCode is PERF_REG_COUNTER_STRUCT. Set to 0 for all other values of requestCode.
pbRegInfo : [var] Pointer to a buffer that is large enough to receive the amount of data that the cbRegInfo parameter specifies, in bytes. May be NULL if cbRegInfo is 0.
cbRegInfo : [int] The size of the buffer that the pbRegInfo parameter specifies, in bytes.
pcbRegInfoActual : [var] The size of the buffer actually required to get the information about the counter set. The meaning depends on the value that the function returns.
%inst
Gets information about a counter set on the specified system.

[戻り値]
This doc was truncated.

[備考]
See PerfRegInfoType for the types of data that you can request and
the formats of the data provided for each type of request.


%index
PrivilegeCheck
Determines whether a specified set of privileges are enabled in an access token.
%group
Win32 advapi32
%prm
ClientToken, RequiredPrivileges, pfResult
ClientToken : [intptr] A handle to an access token representing a client process. This handle must have been obtained by opening the token of a thread impersonating the client. The token must be open for TOKEN_QUERY access.
RequiredPrivileges : [var] A pointer to a PRIVILEGE_SET structure. The Privilege member of this structure is an array of LUID_AND_ATTRIBUTES structures. Before calling PrivilegeCheck, use the Privilege array to indicate the set of privileges to check. Set the Control member to PRIVILEGE_SET_ALL_NECESSARY if all of the privileges must be enabled; or set it to zero if it is sufficient that any one of the privileges be enabled.
pfResult : [var] A pointer to a value the function sets to indicate whether any or all of the specified privileges are enabled in the access token. If the Control member of the PRIVILEGE_SET structure specifies PRIVILEGE_SET_ALL_NECESSARY, this value is TRUE only if all the privileges are enabled; otherwise, this value is TRUE if any of the privileges are enabled.
%inst
Determines whether a specified set of privileges are enabled in an
access token.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
An access token contains a list of the privileges held by the account
associated with the token. These privileges can be enabled or
disabled; most are disabled by default. The PrivilegeCheck function
checks only for enabled privileges. To get a list of all the enabled
and disabled privileges held by an access token, call the
GetTokenInformation function. To enable or disable a set of
privileges in an access token, call the AdjustTokenPrivileges
function.


%index
PrivilegedServiceAuditAlarmW
Generates an audit message in the security event log.  (PrivilegedServiceAuditAlarmW)
%group
Win32 advapi32
%prm
SubsystemName, ServiceName, ClientToken, Privileges, AccessGranted
SubsystemName : [wstr] A pointer to a null-terminated string specifying the name of the subsystem calling the function. This information appears in the security event log record.
ServiceName : [wstr] A pointer to a null-terminated string specifying the name of the privileged subsystem service. This information appears in the security event log record.
ClientToken : [intptr] Identifies an access token representing the client that requested the operation. This handle must have been obtained by opening the token of a thread impersonating the client. The token must be open for TOKEN_QUERY access. The function uses this token to get the identity of the client for the security event log record.
Privileges : [var] A pointer to a PRIVILEGE_SET structure containing the privileges that the client attempted to use. The names of the privileges appear in the security event log record.
AccessGranted : [int] Indicates whether the client's attempt to use the privileges was successful. If this value is TRUE, the security event log record indicates success. If this value is FALSE, the security event log record indicates failure.
%inst
Generates an audit message in the security event log.
(PrivilegedServiceAuditAlarmW)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The PrivilegedServiceAuditAlarm function does not check the client's
access token to determine whether the privileges are held or enabled.
Typically, you first call the PrivilegeCheck function to determine
whether the specified privileges are enabled in the access token, and
then call PrivilegedServiceAuditAlarm to log the results. The
PrivilegedServiceAuditAlarm function requires the calling process to
have SE_AUDIT_NAME privilege enabled. The test for this privilege is
always performed against the primary token of the calling process.
This allows the calling process to impersonate a client during the
call.


%index
ProcessTrace
Delivers events from one or more trace processing sessions to the consumer.
%group
Win32 advapi32
%prm
HandleArray, HandleCount, StartTime, EndTime
HandleArray : [var] Pointer to an array of trace processing session handles obtained from earlier calls to the [OpenTrace](/windows/win32/api/evntrace/nf-evntrace-opentracea) function. The array can contain up to 64 handles to file processing sessions or it can contain one handle to a real-time processing session. The array cannot contain both file processing session handles and real-time processing session handles.
HandleCount : [int] Number of elements in _HandleArray_.
StartTime : [var] Pointer to an optional [FILETIME](/windows/win32/api/minwinbase/ns-minwinbase-filetime) structure that specifies the beginning time period for which you want to receive events. The function does not deliver events with timestamps prior to _StartTime_.
EndTime : [var] Pointer to an optional [FILETIME](/windows/win32/api/minwinbase/ns-minwinbase-filetime) structure that specifies the ending time period for which you want to receive events. The function does not deliver events with timestamps after _EndTime_. **Windows Server?2003:** This value is ignored for real-time event delivery.
%inst
Delivers events from one or more trace processing sessions to the
consumer.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is one of the [system error
codes](/windows/win32/debug/system-error-codes). The following are
some common errors and their causes. - **ERROR_BAD_LENGTH**
_HandleCount_ is not valid or the number of handles is greater than
64. - **ERROR_INVALID_HANDLE** An element of _HandleArray_ is not a
valid event tracing session handle. - **ERROR_INVALID_TIME**
_EndTime_ is less than _StartTime_. - **ERROR_INVALID_PARAMETER**
_HandleArray_ is **NULL**, contains both file processing sessions and
real-time processing sessions, or contains more than one real-time
processing session. - **ERROR_NOACCESS** An exception occurred in one
of the callback functions that receives the events. -
**ERROR_CANCELLED** Indicates the consumer canceled processing by
returning **FALSE** in their
[BufferCallback](/windows/win32/api/evntrace/nc-evntrace-pevent_trace_buffer_callbacka)
function. - **ERROR_WMI_INSTANCE_NOT_FOUND** The trace collection
session from which you are trying to consume events in real time is
not running or does not have the real-time trace mode enabled.

[備考]
Trace consumers call this function to process the events from one or
more trace processing sessions. This function blocks until processing
ends. Before calling **ProcessTrace**, use
[OpenTrace](/windows/win32/api/evntrace/nf-evntrace-opentracea) to
open handles to trace processing sessions. The **ProcessTrace**
function delivers the events from the sessions by invoking the
consumer's
[BufferCallback](/windows/win32/api/evntrace/nc-evntrace-pevent_trace_buffer_callbacka),
[EventCallback](/windows/win32/api/evntrace/nc-evntrace-pevent_callback),
and
[EventRecordCallback](/windows/win32/api/evntrace/nc-evntrace-pevent_record_callback)
callback functions. The **ProcessTrace** function attempts to deliver
events in order based on the event's timestamp (i.e. it tries to
deliver events oldest to newest). In certain cases, **ProcessTrace**
might deliver events out of order. - If the clock used for the event
timestamps is adjusted backwards during trace collection, the
delivery order of the events is unpredictable. To avoid this issue,
[use the QPC clock](/windows/win32/etw/wnode-header) instead of the
system time clock when collecting the trace. - If multiple events are
collected with the same timestamp on different CPUs, the delivery
order of the events is unpredictable. - If an event has an invalid
timestamp (e.g. due to file corruption), the delivery order of that
event and other events in the trace may be unpredictable. The
**ProcessTrace** function blocks the thread until it delivers all
events, the
[BufferCallback](/windows/win32/api/evntrace/nc-evntrace-pevent_trace_buffer_callbacka)
function returns **FALSE**, or you call
[CloseTrace](/windows/win32/api/evntrace/nf-evntrace-closetrace). In
addition, if the consumer is consuming events in real time, the
**ProcessTrace** function returns after the controller stops the
trace session. (Note that there may be a delay of several seconds
before the function returns.) **Windows Server 2003:** You can call
[CloseTrace](/windows/win32/api/evntrace/nf-evntrace-closetrace) only
after **ProcessTrace** returns.


%index
QueryAllTracesW
The QueryAllTracesW (Unicode) function (evntrace.h) function retrieves the properties and statistics for all event tracing sessions that the caller can query.
%group
Win32 advapi32
%prm
PropertyArray, PropertyArrayCount, LoggerCount
PropertyArray : [var] An array of pointers to [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) structures that receive session properties and statistics for the event tracing sessions. You only need to set the **Wnode.BufferSize**, **LoggerNameOffset** , and **LogFileNameOffset** members of the [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) structure. The other members should all be set to zero.
PropertyArrayCount : [int] Number of structures in the _PropertyArray_ array. This value must be less than or equal to 64, the maximum number of event tracing sessions that ETW supports. **Windows 10:** _PropertyArrayCount_ may be larger than 64 and some systems may support more than 64 tracing sessions.
LoggerCount : [var] Actual number of event tracing sessions started on the computer.
%inst
The QueryAllTracesW (Unicode) function (evntrace.h) function
retrieves the properties and statistics for all event tracing
sessions that the caller can query.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is one of the [system error
codes](/windows/win32/debug/system-error-codes). The following are
some common errors and their causes. - **ERROR_INVALID_PARAMETER**
One of the following is true: - _PropertyArrayCount_ is zero or
greater than the maximum number of supported sessions -
_PropertyArray_ is **NULL** - **ERROR_MORE_DATA** The property array
is too small to receive information for all sessions (_SessionCount_
is greater than _PropertyArrayCount_). The function fills the
property array with the number of property structures specified in
_PropertyArrayCount_.

[備考]
Event trace controllers call this function. This function retrieves
the trace sessions that the caller has permissions to query. Users
running with elevated administrative privileges, users in the
Performance Log Users group, and services running as LocalSystem,
LocalService, NetworkService can view all tracing sessions. This
function does not return private logging sessions. To retrieve
information for a single session, use the
[ControlTrace](/windows/desktop/ETW/controltrace) function and set
the _ControlCode_ parameter to **EVENT_TRACE_CONTROL_QUERY**.


%index
QueryRecoveryAgentsOnEncryptedFile
Retrieves a list of recovery agents for the specified file.
%group
Win32 advapi32
%prm
lpFileName, pRecoveryAgents
lpFileName : [wstr] The name of the file.
pRecoveryAgents : [var] A pointer to a ENCRYPTION_CERTIFICATE_HASH_LIST structure that receives a list of recovery agents.
%inst
Retrieves a list of recovery agents for the specified file.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a system error code. For a
complete list of error codes, see System Error Codes or the header
file WinError.h.

[備考]
When the list of recovery agents is no longer needed, free it by
calling the FreeEncryptionCertificateHashList function. In Windows 8,
Windows Server 2012, and later, this function is supported by the
following technologies.
This doc was truncated.


%index
QuerySecurityAccessMask
Creates an access mask that represents the access permissions necessary to query the specified object security information.
%group
Win32 advapi32
%prm
SecurityInformation, DesiredAccess
SecurityInformation : [int] A SECURITY_INFORMATION structure that specifies the security information to be queried.
DesiredAccess : [var] A pointer to the access mask that this function creates.
%inst
Creates an access mask that represents the access permissions
necessary to query the specified object security information.


%index
QueryServiceConfigW
Retrieves the configuration parameters of the specified service. (Unicode)
%group
Win32 advapi32
%prm
hService, lpServiceConfig, cbBufSize, pcbBytesNeeded
hService : [intptr] A handle to the service. This handle is returned by the OpenService or CreateService function, and it must have the SERVICE_QUERY_CONFIG access right. For more information, see Service Security and Access Rights.
lpServiceConfig : [var] A pointer to a buffer that receives the service configuration information. The format of the data is a QUERY_SERVICE_CONFIG structure. The maximum size of this array is 8K bytes. To determine the required size, specify NULL for this parameter and 0 for the cbBufSize parameter. The function will fail and GetLastError will return ERROR_INSUFFICIENT_BUFFER. The pcbBytesNeeded parameter will receive the required size.
cbBufSize : [int] The size of the buffer pointed to by the lpServiceConfig parameter, in bytes.
pcbBytesNeeded : [var] A pointer to a variable that receives the number of bytes needed to store all the configuration information, if the function fails with ERROR_INSUFFICIENT_BUFFER.
%inst
Retrieves the configuration parameters of the specified service.
(Unicode)

[戻り値]
If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. To get extended
error information, call GetLastError. The following error codes can
be set by the service control manager. Others can be set by the
registry functions that are called by the service control manager.
This doc was truncated.

[備考]
The QueryServiceConfig function returns the service configuration
information kept in the registry for a particular service. This
configuration information is first set by a service control program
using the CreateService function. This information may have been
updated by a service configuration program using the
ChangeServiceConfig function. If the service was running when the
configuration information was last changed, the information returned
by QueryServiceConfig will not reflect the current configuration of
the service. Instead, it will reflect the configuration of the
service when it is next run. The DisplayName key is an exception to
this. When the DisplayName key is changed, it takes effect
immediately, regardless of whether the service is running.


%index
QueryServiceConfig2A
Retrieves the optional configuration parameters of the specified service. (ANSI)
%group
Win32 advapi32
%prm
hService, dwInfoLevel, lpBuffer, cbBufSize, pcbBytesNeeded
hService : [intptr] A handle to the service. This handle is returned by the OpenService or CreateService function and must have the SERVICE_QUERY_CONFIG access right. For more information, see Service Security and Access Rights.
dwInfoLevel : [int] 
lpBuffer : [var] A pointer to the buffer that receives the service configuration information. The format of this data depends on the value of the dwInfoLevel parameter. The maximum size of this array is 8K bytes. To determine the required size, specify NULL for this parameter and 0 for the cbBufSize parameter. The function fails and GetLastError returns ERROR_INSUFFICIENT_BUFFER. The pcbBytesNeeded parameter receives the needed size.
cbBufSize : [int] The size of the structure pointed to by the lpBuffer parameter, in bytes.
pcbBytesNeeded : [var] A pointer to a variable that receives the number of bytes required to store the configuration information, if the function fails with  ERROR_INSUFFICIENT_BUFFER.
%inst
Retrieves the optional configuration parameters of the specified
service. (ANSI)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The following error codes can be set
by the service control manager. Others can be set by the registry
functions that are called by the service control manager.
This doc was truncated.

[備考]
The QueryServiceConfig2 function returns the optional configuration
information stored in the service control manager database for the
specified service. You can change this configuration information by
using the ChangeServiceConfig2 function. You can change and query
additional configuration information using the ChangeServiceConfig
and QueryServiceConfig functions, respectively.


%index
QueryServiceConfig2W
Retrieves the optional configuration parameters of the specified service. (Unicode)
%group
Win32 advapi32
%prm
hService, dwInfoLevel, lpBuffer, cbBufSize, pcbBytesNeeded
hService : [intptr] A handle to the service. This handle is returned by the OpenService or CreateService function and must have the SERVICE_QUERY_CONFIG access right. For more information, see Service Security and Access Rights.
dwInfoLevel : [int] 
lpBuffer : [var] A pointer to the buffer that receives the service configuration information. The format of this data depends on the value of the dwInfoLevel parameter. The maximum size of this array is 8K bytes. To determine the required size, specify NULL for this parameter and 0 for the cbBufSize parameter. The function fails and GetLastError returns ERROR_INSUFFICIENT_BUFFER. The pcbBytesNeeded parameter receives the needed size.
cbBufSize : [int] The size of the structure pointed to by the lpBuffer parameter, in bytes.
pcbBytesNeeded : [var] A pointer to a variable that receives the number of bytes required to store the configuration information, if the function fails with  ERROR_INSUFFICIENT_BUFFER.
%inst
Retrieves the optional configuration parameters of the specified
service. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The following error codes can be set
by the service control manager. Others can be set by the registry
functions that are called by the service control manager.
This doc was truncated.

[備考]
The QueryServiceConfig2 function returns the optional configuration
information stored in the service control manager database for the
specified service. You can change this configuration information by
using the ChangeServiceConfig2 function. You can change and query
additional configuration information using the ChangeServiceConfig
and QueryServiceConfig functions, respectively.


%index
QueryServiceDynamicInformation
Retrieves dynamic information related to the current service start.
%group
Win32 advapi32
%prm
hServiceStatus, dwInfoLevel, ppDynamicInfo
hServiceStatus : [intptr] A service status handle provided by RegisterServiceCtrlHandlerEx
dwInfoLevel : [int] Indicates the information level.
ppDynamicInfo : [var] A dynamic information buffer. If this parameter is valid, the callback function must free the          buffer after use with the LocalFree function.
%inst
Retrieves dynamic information related to the current service start.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. When this happens the GetLastError
function should be called to retrieve the error code.


%index
QueryServiceLockStatusW
Retrieves the lock status of the specified service control manager database. (Unicode)
%group
Win32 advapi32
%prm
hSCManager, lpLockStatus, cbBufSize, pcbBytesNeeded
hSCManager : [intptr] A handle to the service control manager database. The OpenSCManager function returns this handle, which must have the SC_MANAGER_QUERY_LOCK_STATUS access right. For more information, see Service Security and Access Rights.
lpLockStatus : [var] A pointer to a QUERY_SERVICE_LOCK_STATUS structure that receives the lock status of the specified database is returned, plus the strings to which its members point.
cbBufSize : [int] The size of the buffer pointed to by the lpLockStatus parameter, in bytes.
pcbBytesNeeded : [var] A pointer to a variable that receives the number of bytes needed to return all the lock status information, if the function fails.
%inst
Retrieves the lock status of the specified service control manager
database. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The following error codes can be set
by the service control manager. Other error codes can be set by the
registry functions that are called by the service control manager.
This doc was truncated.

[備考]
The QueryServiceLockStatus function returns a
QUERY_SERVICE_LOCK_STATUS structure that indicates whether the
specified database is locked. If the database is locked, the
structure provides the account name of the user that owns the lock
and the length of time that the lock has been held. A process calls
the LockServiceDatabase function to acquire ownership of a service
control manager database lock and the UnlockServiceDatabase function
to release the lock.
> [!NOTE] > The winsvc.h header defines QueryServiceLockStatus as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
QueryServiceObjectSecurity
Retrieves a copy of the security descriptor associated with a service object.
%group
Win32 advapi32
%prm
hService, dwSecurityInformation, lpSecurityDescriptor, cbBufSize, pcbBytesNeeded
hService : [intptr] A handle to the service control manager or the service. Handles to the service control manager are returned by the OpenSCManager function, and handles to a service are returned by either the OpenService or CreateService function. The handle must have the READ_CONTROL access right.
dwSecurityInformation : [int] A set of bit flags that indicate the type of security information to retrieve. This parameter can be a combination of the SECURITY_INFORMATION bit flags, with the exception that this function does not support the LABEL_SECURITY_INFORMATION value.
lpSecurityDescriptor : [int] A pointer to a buffer that receives a copy of the security descriptor of the specified service object. The calling process must have the appropriate access to view the specified aspects of the  security descriptor of the object. The SECURITY_DESCRIPTOR structure is returned in self-relative format.
cbBufSize : [int] The size of the buffer pointed to by the lpSecurityDescriptor parameter, in bytes. The largest size allowed is 8 kilobytes.
pcbBytesNeeded : [var] A pointer to a variable that receives the number of bytes needed to return the requested security descriptor information, if the function fails.
%inst
Retrieves a copy of the security descriptor associated with a service
object.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The following error codes may be set
by the service control manager. Other error codes may be set by the
registry functions that are called by the service control manager.
This doc was truncated.

[備考]
When a service is created, the service control manager assigns a
default security descriptor to the service object. To retrieve a copy
of the security descriptor for a service object, call the
QueryServiceObjectSecurity function. To change the security
descriptor, call the SetServiceObjectSecurity function. For a
description of the default security descriptor for a service object,
see Service Security and Access Rights. To read the owner, group, or
DACL from the security descriptor of the service object, the calling
process must have been granted READ_CONTROL access when the handle
was opened. To get READ_CONTROL access, the caller must be the owner
of the object or the DACL of the object must grant the access. To
read the SACL from the security descriptor, the calling process must
have been granted ACCESS_SYSTEM_SECURITY access when the handle was
opened. The correct way to get this access is to enable the
SE_SECURITY_NAME privilege in the caller's current token, open the
handle for ACCESS_SYSTEM_SECURITY access, and then disable the
privilege.


%index
QueryServiceStatus
Retrieves the current status of the specified service.
%group
Win32 advapi32
%prm
hService, lpServiceStatus
hService : [intptr] A handle to the service. This handle is returned by the OpenService or the CreateService function, and it must have the SERVICE_QUERY_STATUS access right. For more information, see Service Security and Access Rights.
lpServiceStatus : [var] A pointer to a SERVICE_STATUS structure that receives the status information.
%inst
Retrieves the current status of the specified service.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The following error codes can be set
by the service control manager. Other error codes can be set by the
registry functions that are called by the service control manager.
This doc was truncated.

[備考]
The QueryServiceStatus function returns the most recent service
status information reported to the service control manager. If the
service just changed its status, it may not have updated the service
control manager yet.


%index
QueryServiceStatusEx
Retrieves the current status of the specified service based on the specified information level.
%group
Win32 advapi32
%prm
hService, InfoLevel, lpBuffer, cbBufSize, pcbBytesNeeded
hService : [intptr] A handle to the service. This handle is returned by the CreateService or OpenService function, and it must have the SERVICE_QUERY_STATUS access right. For more information, see Service Security and Access Rights.
InfoLevel : [int] The service attributes to be returned. Use SC_STATUS_PROCESS_INFO to retrieve the service status information. The lpBuffer parameter is a pointer to a SERVICE_STATUS_PROCESS structure.
lpBuffer : [var] A pointer to the buffer that receives the status information. The format of this data depends on the value of the InfoLevel parameter. The maximum size of this array is 8K bytes. To determine the required size, specify NULL for this parameter and 0 for the cbBufSize parameter. The function will fail and GetLastError will return ERROR_INSUFFICIENT_BUFFER. The pcbBytesNeeded parameter will receive the required size.
cbBufSize : [int] The size of the buffer pointed to by the lpBuffer parameter, in bytes.
pcbBytesNeeded : [var] A pointer to a variable that receives the number of bytes needed to store all status information, if the function fails with ERROR_INSUFFICIENT_BUFFER.
%inst
Retrieves the current status of the specified service based on the
specified information level.

[戻り値]
If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. To get extended
error information, call GetLastError. The following errors can be
returned.
This doc was truncated.

[備考]
The QueryServiceStatusEx function returns the most recent service
status information reported to the service control manager. If the
service just changed its status, it may not have updated the service
control manager yet. The process identifier returned in the
SERVICE_STATUS_PROCESS structure is valid provided that the state of
the service is one of SERVICE_RUNNING, SERVICE_PAUSE_PENDING,
SERVICE_PAUSED, or SERVICE_CONTINUE_PENDING. If the service is in a
SERVICE_START_PENDING or SERVICE_STOP_PENDING state, however, the
process identifier may not be valid, and if the service is in the
SERVICE_STOPPED state, it is never valid.


%index
QueryTraceW
The QueryTraceW (Unicode) function (evntrace.h) retrieves the property settings and session statistics for the specified event tracing session.
%group
Win32 advapi32
%prm
TraceHandle, InstanceName, Properties
TraceHandle : [int] Handle to the event tracing session to be queried, or 0. You must specify a non-zero _TraceHandle_ if _InstanceName_ is **NULL**. This parameter will be used only if _InstanceName_ is **NULL**. The handle is returned by the [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracew).
InstanceName : [wstr] Name of the event tracing session to be queried, or **NULL**. You must specify _InstanceName_ if _TraceHandle_ is 0. To specify the NT Kernel Logger session, set _InstanceName_ to **KERNEL_LOGGER_NAME**.
Properties : [var] Pointer to an initialized [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) structure. You only need to set the **Wnode.BufferSize** member of the [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) structure. You can use the maximum session name (1024 characters) and maximum log file name (1024 characters) lengths to calculate the buffer size and offsets if not known. On output, the structure members contain the property settings and session statistics for the event tracing session. **Starting with Windows?10, version 1703:** For better performance in cross process scenarios, you can now pass filtering into **QueryTrace** for system wide private loggers. You will need to pass in the new [EVENT_TRACE_PROPERTIES_V2](/windows/desktop/ETW/event-trace-properties-v2) structure to include filtering information. See [Configuring and Starting a Private Logger Session](/windows/desktop/ETW/configuring-and-starting-a-private-logger-session) for more details.
%inst
The QueryTraceW (Unicode) function (evntrace.h) retrieves the
property settings and session statistics for the specified event
tracing session.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is one of the [system error
codes](/windows/win32/debug/system-error-codes). The following are
some common errors and their causes. - **ERROR_BAD_LENGTH** One of
the following is true: - The **Wnode.BufferSize** member of
_Properties_ specifies an incorrect size. - _Properties_ does not
have sufficient space allocated to hold a copy of the session name
and log file name (if used). - **ERROR_INVALID_PARAMETER** One of the
following is true: - _Properties_ is **NULL**. - _InstanceName_ and
_TraceHandle_ are both **NULL**. - _InstanceName_ is **NULL** and
_TraceHandle_ is not a valid handle. - **ERROR_ACCESS_DENIED** Only
users running with elevated administrative privileges, users in the
Performance Log Users group, and services running as LocalSystem,
LocalService, NetworkService can query event tracing sessions. To
grant a restricted user the ability to query trace sessions, add them
to the Performance Log Users group or see
[EventAccessControl](/windows/desktop/api/evntcons/nf-evntcons-eventaccesscontrol).
**Windows XP and Windows 2000:** Anyone can control a trace session.
- **ERROR_WMI_INSTANCE_NOT_FOUND** The given session is not running.

[備考]
Event trace controllers call this function. This function is
obsolete. Instead, use
[ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew)
with _ControlCode_ set to **EVENT_TRACE_CONTROL_QUERY**. > [!NOTE] >
The evntrace.h header defines QueryTrace as an alias which >
automatically selects the ANSI or Unicode version of this function
based on > the definition of the UNICODE preprocessor constant.
Mixing usage of the > encoding-neutral alias with code that not
encoding-neutral can lead to > mismatches that result in compilation
or runtime errors. For more information, > see > [Conventions for
Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
QueryTraceProcessingHandle
Retrieves information about an ETW trace processing session opened by OpenTrace.
%group
Win32 advapi32
%prm
ProcessingHandle, InformationClass, InBuffer, InBufferSize, OutBuffer, OutBufferSize, ReturnLength
ProcessingHandle : [int] A valid handle created with [OpenTrace](/windows/win32/api/evntrace/nf-evntrace-opentracea) that the data should be queried from.
InformationClass : [int] An [ETW_PROCESS_HANDLE_INFO_TYPE](/windows/win32/api/evntrace/ne-evntrace-etw_process_handle_info_type) value that specifies what kind of operation will be done on the handle.
InBuffer : [intptr] Reserved for future use. May be null.
InBufferSize : [int] Size in bytes of the _InBuffer_.
OutBuffer : [intptr] Buffer provided by the caller to receive output data.
OutBufferSize : [int] Size in bytes of _OutBuffer._
ReturnLength : [var] The size in bytes of the data that the API wrote into _OutBuffer_. Used for variable length returns.
%inst
Retrieves information about an ETW trace processing session opened by
OpenTrace.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is one of the [system error
codes](/windows/win32/debug/system-error-codes).


%index
QueryUsersOnEncryptedFile
Retrieves a list of users for the specified file.
%group
Win32 advapi32
%prm
lpFileName, pUsers
lpFileName : [wstr] The name of the file.
pUsers : [var] A pointer to a ENCRYPTION_CERTIFICATE_HASH_LIST structure that receives the list of users.
%inst
Retrieves a list of users for the specified file.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a system error code. For a
complete list of error codes, see System Error Codes or the header
file WinError.h.

[備考]
When the list of users is no longer needed, call the
FreeEncryptionCertificateHashList function to free the list. In
Windows 8, Windows Server 2012, and later, this function is supported
by the following technologies.
This doc was truncated.


%index
ReadEncryptedFileRaw
Backs up (export) encrypted files.
%group
Win32 advapi32
%prm
pfExportCallback, pvCallbackContext, pvContext
pfExportCallback : [int] A pointer to the export callback function. The system calls the callback function multiple times, each time passing a block of the file's data to the callback function until the entire file has been read. For more information, see ExportCallback.
pvCallbackContext : [intptr] A pointer to an application-defined and allocated context block. The system passes this pointer to the callback function as a parameter so that the callback function can have access to application-specific data. This can be a structure and can contain any data the application needs, such as the handle to the file that will contain the backup copy of the encrypted file.
pvContext : [intptr] A pointer to a system-defined context block. The context block is returned by the OpenEncryptedFileRaw function. Do not modify it.
%inst
Backs up (export) encrypted files.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, it returns a nonzero error code defined in
WinError.h. You can use FormatMessage with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic text description of
the error.

[備考]
The file being backed up is not decrypted; it is backed up in its
encrypted state. To back up an encrypted file, call
OpenEncryptedFileRaw to open the file. Then call
ReadEncryptedFileRaw, passing it the address of an
application-defined export callback function. The system calls this
callback function multiple times until the entire file's contents
have been read and backed up. When the backup is complete, call
CloseEncryptedFileRaw to free resources and close the file. See
ExportCallback for details about how to declare the export callback
function. To restore an encrypted file, call OpenEncryptedFileRaw,
specifying CREATE_FOR_IMPORT in the ulFlags parameter. Then call
WriteEncryptedFileRaw, passing it the address of an
application-defined import callback function. The system calls this
callback function multiple times until the entire file's contents
have been read and restored. When the restore is complete, call
CloseEncryptedFileRaw to free resources and close the file. See
ImportCallback for details about how to declare the import callback
function. This function is intended for the backup of only encrypted
files; see BackupRead for backup of unencrypted files. In Windows 8,
Windows Server 2012, and later, this function is supported by the
following technologies.
This doc was truncated.


%index
ReadEventLogW
Reads the specified number of entries from the specified event log. (Unicode)
%group
Win32 advapi32
%prm
hEventLog, dwReadFlags, dwRecordOffset, lpBuffer, nNumberOfBytesToRead, pnBytesRead, pnMinNumberOfBytesNeeded
hEventLog : [intptr] A handle to the event log to be read. The OpenEventLog function returns this handle.
dwReadFlags : [int] 
dwRecordOffset : [int] The record number of the log-entry at which the read operation should start. This parameter is ignored unless dwReadFlags includes the EVENTLOG_SEEK_READ flag.
lpBuffer : [intptr] An application-allocated buffer that will receive one or more EVENTLOGRECORD structures. This parameter cannot be NULL, even if the nNumberOfBytesToRead parameter is zero.
nNumberOfBytesToRead : [int] The size of the lpBuffer buffer, in bytes. This function will read as many log entries as will fit in the buffer; the function will not return partial entries.
pnBytesRead : [var] A pointer to a variable that receives the number of bytes read by the function.
pnMinNumberOfBytesNeeded : [var] A pointer to a variable that receives the required size of the lpBuffer buffer. This value is valid only this function returns zero and GetLastError returns ERROR_INSUFFICIENT_BUFFER.
%inst
Reads the specified number of entries from the specified event log.
(Unicode)

[戻り値]
If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. To get extended
error information, call GetLastError.

[備考]
When this function returns successfully, the read position in the
event log is adjusted by the number of records read. Note The
configured file name for this source may also be the configured file
name for other sources (several sources can exist as subkeys under a
single log). Therefore, this function may return events that were
logged by more than one source.


%index
RegConnectRegistryW
Establishes a connection to a predefined registry key on another computer. (Unicode)
%group
Win32 advapi32
%prm
lpMachineName, hKey, phkResult
lpMachineName : [wstr] The name of the remote computer. The string has the following form:
hKey : [intptr] A predefined registry handle. This parameter can be one of the following predefined keys on the remote computer.
phkResult : [intptr] A pointer to a variable that receives a key handle identifying the predefined handle on the remote computer.
%inst
Establishes a connection to a predefined registry key on another
computer. (Unicode)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
Winerror.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error.

[備考]
RegConnectRegistry requires the Remote Registry service to be running
on the remote computer. By default, this service is configured to be
started manually. To configure the Remote Registry service to start
automatically, run Services.msc and change the Startup Type of the
service to Automatic. Windows Server 2003 and Windows XP/2000: The
Remote Registry service is configured to start automatically by
default. When a handle returned by RegConnectRegistry is no longer
needed, it should be closed by calling RegCloseKey. If the computer
is joined to a workgroup and the "Force network logons using local
accounts to authenticate as Guest" policy is enabled, the function
fails. Note that this policy is enabled by default if the computer is
joined to a workgroup. If the current user does not have proper
access to the remote computer, the call to RegConnectRegistry fails.
To connect to a remote registry, call LogonUser with
LOGON32_LOGON_NEW_CREDENTIALS and ImpersonateLoggedOnUser before
calling RegConnectRegistry. Windows 2000: One possible workaround is
to establish a session to an administrative share such as IPC$ using
a different set of credentials. To specify credentials other than
those of the current user, use the WNetAddConnection2 function to
connect to the share. When you have finished accessing the registry,
cancel the connection. Windows XP Home Edition: You cannot use this
function to connect to a remote computer running Windows XP Home
Edition. This function does work with the name of the local computer
even if it is running Windows XP Home Edition because this bypasses
the authentication layer.
> [!NOTE] > The winreg.h header defines RegConnectRegistry as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
RegConnectRegistryExW
(no summary)
%group
Win32 advapi32
%prm
lpMachineName, hKey, Flags, phkResult
lpMachineName : [wstr] 
hKey : [intptr] 
Flags : [int] 
phkResult : [intptr] 
%inst



%index
RegCreateKeyW
Creates the specified registry key. If the key already exists in the registry, the function opens it. (Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey, phkResult
hKey : [intptr] A handle to an open registry key. The calling process  must have KEY_CREATE_SUB_KEY access to the key. For more information, see Registry Key Security and Access Rights.
lpSubKey : [wstr] The name of a key that this function opens or creates. This key must be a subkey of the key identified by the hKey parameter.
phkResult : [intptr] A pointer to a variable that receives a handle to the opened or created key. If the key is not one of the predefined registry keys, call the RegCloseKey function after you have finished using the handle.
%inst
Creates the specified registry key. If the key already exists in the
registry, the function opens it. (Unicode)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
Winerror.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error.

[備考]
An application cannot create a key that is a direct child of
HKEY_USERS or HKEY_LOCAL_MACHINE. An application can create subkeys
in lower levels of the HKEY_USERS or HKEY_LOCAL_MACHINE trees. If
your service or application impersonates different users, do not use
this function with HKEY_CURRENT_USER. Instead, call the
RegOpenCurrentUser function. The RegCreateKey function creates all
missing keys in the specified path. An application can take advantage
of this behavior to create several keys at once. For example, an
application can create a subkey four levels deep at the same time as
the three preceding subkeys by specifying a string of the following
form for the lpSubKey parameter: subkey1\subkey2\subkey3\subkey4 Note
that this behavior will result in creation of unwanted keys if an
existing key in the path is spelled incorrectly.
> [!NOTE] > The winreg.h header defines RegCreateKey as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
RegCreateKeyTransactedW
Creates the specified registry key and associates it with a transaction. (Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey, Reserved, lpClass, dwOptions, samDesired, lpSecurityAttributes, phkResult, lpdwDisposition, hTransaction, pExtendedParemeter
hKey : [intptr] A handle to an open registry key. The calling process  must have KEY_CREATE_SUB_KEY access to the key. For more information, see Registry Key Security and Access Rights. Access for key creation is checked against the security descriptor of the registry key, not the access mask specified when the handle was obtained. Therefore, even if hKey was opened with a samDesired of KEY_READ, it   can be used in operations that create keys if allowed by its security descriptor. This handle is returned by the RegCreateKeyTransacted or RegOpenKeyTransacted function, or it can be one of the following predefined keys:
lpSubKey : [wstr] The name of a subkey that this function opens or creates. The subkey specified must be a subkey of the key identified by the hKey parameter; it can be up to 32 levels deep in the registry tree. For more information on key names, see Structure of the Registry. If lpSubKey is a pointer to an empty string, phkResult receives a new handle to the key specified by hKey. This parameter cannot be NULL.
Reserved : [int] This parameter is reserved and must be zero.
lpClass : [wstr] The user-defined class of this key. This parameter may be ignored. This parameter can be NULL.
dwOptions : [int] 
samDesired : [int] A mask that specifies the access rights for the key to be created. For more information, see Registry Key Security and Access Rights.
lpSecurityAttributes : [var] A pointer to a SECURITY_ATTRIBUTES structure that determines whether the returned handle can be inherited by child processes. If lpSecurityAttributes is NULL, the handle cannot be inherited.
phkResult : [intptr] A pointer to a variable that receives a handle to the opened or created key. If the key is not one of the predefined registry keys, call the RegCloseKey function after you have finished using the handle.
lpdwDisposition : [var] A pointer to a variable that receives one of the following disposition values.
hTransaction : [intptr] A handle to an active transaction. This handle is returned by the CreateTransaction function.
pExtendedParemeter : [intptr] This parameter is reserved and must be NULL.
%inst
Creates the specified registry key and associates it with a
transaction. (Unicode)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
Winerror.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error.

[備考]
When a key is created using this function, subsequent operations on
the key are transacted. If a non-transacted operation is performed on
the key before the transaction is committed, the transaction is
rolled back. After a transaction is committed or rolled back, you
must re-open the key using RegCreateKeyTransacted or
RegOpenKeyTransacted with an active transaction handle to make
additional operations transacted. For more information about
transactions, see Kernel Transaction Manager. Note that subsequent
operations on subkeys of this key are not automatically transacted.
Therefore, RegDeleteKeyEx does not perform a transacted delete
operation. Instead, use the RegDeleteKeyTransacted function to
perform a transacted delete operation. The key that the
RegCreateKeyTransacted function creates has no values. An application
can use the RegSetValueEx function to set key values. The
RegCreateKeyTransacted function creates all missing keys in the
specified path. An application can take advantage of this behavior to
create several keys at once. For example, an application can create a
subkey four levels deep at the same time as the three preceding
subkeys by specifying a string of the following form for the lpSubKey
parameter: subkey1\subkey2\subkey3\subkey4 Note that this behavior
will result in creation of unwanted keys if an existing key in the
path is spelled incorrectly. An application cannot create a key that
is a direct child of HKEY_USERS or HKEY_LOCAL_MACHINE. An application
can create subkeys in lower levels of the HKEY_USERS or
HKEY_LOCAL_MACHINE trees.
> [!NOTE] > The winreg.h header defines RegCreateKeyTransacted as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
RegDeleteKeyW
サブキーとその値を削除する。(Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey
hKey : [intptr] オープン中のレジストリキーへのハンドル。このキーのアクセス権は削除操作に影響しない。RegCreateKeyEx または RegOpenKeyEx で取得したもの、または HKEY_CLASSES_ROOT、HKEY_CURRENT_CONFIG、HKEY_CURRENT_USER、HKEY_LOCAL_MACHINE、HKEY_USERS のいずれか。
lpSubKey : [wstr] 削除するキーの名前。hKey で識別されるキーのサブキーでなければならず、サブキーを持っていてはならない。NULL にしてはならない。関数は DELETE アクセス権でサブキーを開く。キー名は大文字小文字を区別しない。
%inst
サブキーとその値を削除する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は ERROR_SUCCESS。失敗した場合は Winerror.h で定義された 0 以外のエラーコード。

[備考]

削除されたキーは、最後のハンドルが閉じられるまで実際には削除されない。削除対象サブキーはサブキーを持っていてはならない。キーとそのサブキーをすべて削除するには、サブキーを列挙して個別に削除する必要があるか、RegDeleteTree
または SHDeleteKey を使う。


%index
RegDeleteKeyTransactedW
Deletes a subkey and its values from the specified platform-specific view of the registry as a transacted operation. (Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey, samDesired, Reserved, hTransaction, pExtendedParameter
hKey : [intptr] A handle to an open registry key. The access rights of this key do not affect the delete operation. For more information about access rights, see Registry Key Security and Access Rights. This handle is returned by the RegCreateKeyEx, RegCreateKeyTransacted, RegOpenKeyEx, or RegOpenKeyTransacted function. It can also be one of the following predefined keys: HKEY_CLASSES_ROOT HKEY_CURRENT_CONFIG HKEY_CURRENT_USER HKEY_LOCAL_MACHINE HKEY_USERS
lpSubKey : [wstr] The name of the key to be deleted. This key must be a subkey of the key specified by the value of the hKey parameter. The  function opens the subkey with the DELETE access right. Key names are not case sensitive. The value of this parameter cannot be NULL.
samDesired : [int] An access mask the specifies the platform-specific view of the registry.
Reserved : [int] This parameter is reserved and must be zero.
hTransaction : [intptr] A handle to an active transaction. This handle is returned by the CreateTransaction function.
pExtendedParameter : [intptr] This parameter is reserved and must be NULL.
%inst
Deletes a subkey and its values from the specified platform-specific
view of the registry as a transacted operation. (Unicode)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
Winerror.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error.

[備考]
A deleted key is not removed until the last handle to it is closed.
On WOW64, 32-bit applications view a registry tree that is separate
from the registry tree that 64-bit applications view. This function
enables an application to delete an entry in the alternate registry
view. The subkey to be deleted must not have subkeys. To delete a key
and all its subkeys, you need to enumerate the subkeys and delete
them individually. To delete keys recursively, use the RegDeleteTree
or SHDeleteKey function. If the function succeeds,
RegDeleteKeyTransacted removes the specified key from the registry.
The entire key, including all of its values, is removed. To remove
the entire tree as a transacted operation, use the RegDeleteTree
function with a handle returned from RegCreateKeyTransacted or
RegOpenKeyTransacted.
> [!NOTE] > The winreg.h header defines RegDeleteKeyTransacted as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
RegDeleteKeyValueW
Removes the specified value from the specified registry key and subkey. (Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey, lpValueName
hKey : [intptr] A handle to an open registry key. The key must have been opened with the KEY_SET_VALUE access right. For more information, see Registry Key Security and Access Rights.
lpSubKey : [wstr] The name of the registry key. This key must be a subkey of the key identified by the hKey parameter.
lpValueName : [wstr] The registry value to be removed from the key.
%inst
Removes the specified value from the specified registry key and
subkey. (Unicode)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
Winerror.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error.

[備考]
To compile an application that uses this function, define
_WIN32_WINNT as 0x0600 or later. For more information, see Using the
Windows Headers.
> [!NOTE] > On legacy versions of Windows, this API is also exposed
by kernel32.dll.
> [!NOTE] > The winreg.h header defines RegDeleteKeyValue as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
RegDisablePredefinedCache
Disables handle caching of the predefined registry handle for HKEY_CURRENT_USER for the current process.
%group
Win32 advapi32
%prm

%inst
Disables handle caching of the predefined registry handle for
HKEY_CURRENT_USER for the current process.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a system error code.

[備考]
Any access of HKEY_CURRENT_USER after this function is called will
result in operations being performed on
HKEY_USERS\SID_of_current_user, or on HKEY_USERS\.DEFAULT if the
current user's hive is not loaded. For more information on SIDs, see
Security Identifiers.


%index
RegDisableReflectionKey
Disables registry reflection for the specified key. Disabling reflection for a key does not affect reflection of any subkeys.
%group
Win32 advapi32
%prm
hBase
hBase : [intptr] A handle to an open registry key. This handle is returned by the RegCreateKeyEx, RegCreateKeyTransacted, RegOpenKeyEx, or RegOpenKeyTransacted function; it cannot specify a key on a remote computer. If the key is not on the reflection list, the function succeeds but has no effect. For more information, see Registry Redirector and Registry Reflection.
%inst
Disables registry reflection for the specified key. Disabling
reflection for a key does not affect reflection of any subkeys.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
Winerror.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error.

[備考]
On WOW64, 32-bit applications view a registry tree that is separate
from the registry tree that 64-bit applications view. Registry
reflection copies specific registry keys and values between the two
views. To restore registry reflection for a disabled key, use the
RegEnableReflectionKey function.


%index
RegEnableReflectionKey
Restores registry reflection for the specified disabled key. Restoring reflection for a key does not affect reflection of any subkeys.
%group
Win32 advapi32
%prm
hBase
hBase : [intptr] A handle to the registry key that was previously disabled using the RegDisableReflectionKey function. This handle is returned by the RegCreateKeyEx, RegCreateKeyTransacted, RegOpenKeyEx, or RegOpenKeyTransacted function; it cannot specify a key on a remote computer. If the key is not on the reflection list, this function succeeds but has no effect. For more information, see Registry Redirector and Registry Reflection.
%inst
Restores registry reflection for the specified disabled key.
Restoring reflection for a key does not affect reflection of any
subkeys.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
Winerror.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error.

[備考]
On WOW64, 32-bit applications view a registry tree that is separate
from the registry tree that 64-bit applications view. Registry
reflection copies specific registry keys and values between the two
views.


%index
RegEnumKeyW
Enumerates the subkeys of the specified open registry key. (RegEnumKeyW)
%group
Win32 advapi32
%prm
hKey, dwIndex, lpName, cchName
hKey : [intptr] A handle to an open registry key. The key must have been opened with the KEY_ENUMERATE_SUB_KEYS access right. For more information, see Registry Key Security and Access Rights.
dwIndex : [int] The index of the subkey of hKey to be retrieved. This value should be zero for the first call to the RegEnumKey function and then incremented for subsequent calls.
lpName : [wstr] A pointer to a buffer that receives the name of the subkey, including the terminating null character. This function copies only the name of the subkey, not the full key hierarchy, to the buffer.
cchName : [int] The size of the buffer pointed to by the lpName parameter, in TCHARs. To determine the required buffer size, use the RegQueryInfoKey function to determine the size of the largest subkey for the key identified by the hKey parameter.
%inst
Enumerates the subkeys of the specified open registry key.
(RegEnumKeyW)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a system error code. If there are
no more subkeys available, the function returns ERROR_NO_MORE_ITEMS.
If the lpName buffer is too small to receive the name of the key, the
function returns ERROR_MORE_DATA.

[備考]
To enumerate subkeys, an application should initially call the
RegEnumKey function with the dwIndex parameter set to zero. The
application should then increment the dwIndex parameter and call the
RegEnumKey function until there are no more subkeys (meaning the
function returns ERROR_NO_MORE_ITEMS). The application can also set
dwIndex to the index of the last key on the first call to the
function and decrement the index until the subkey with index 0 is
enumerated. To retrieve the index of the last subkey, use the
RegQueryInfoKey. While an application is using the RegEnumKey
function, it should not make calls to any registration functions that
might change the key being queried.
> [!NOTE] > The winreg.h header defines RegEnumKey as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
RegLoadAppKeyW
Loads the specified registry hive as an application hive. (Unicode)
%group
Win32 advapi32
%prm
lpFile, phkResult, samDesired, dwOptions, Reserved
lpFile : [wstr] The name of the  hive file. This hive must have been created with the RegSaveKey or RegSaveKeyEx function. If the  file does not exist, an empty hive file is created with the specified name.
phkResult : [intptr] Pointer to the handle for the root key of the loaded hive. The only way to access keys in the hive is through this handle. The registry will prevent an application from accessing keys in this hive using an absolute path to the key. As a result, it is not possible to navigate to this hive through the registry's namespace.
samDesired : [int] A mask that specifies the access rights requested for the returned root key. For more information, see Registry Key Security and Access Rights.
dwOptions : [int] If this parameter is REG_PROCESS_APPKEY, the hive cannot be loaded again  while it is loaded by the caller. This prevents access to this registry hive by another caller.
Reserved : [int] This parameter is reserved.
%inst
Loads the specified registry hive as an application hive. (Unicode)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
Winerror.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error.

[備考]
Unlike RegLoadKey, RegLoadAppKey does not load the hive under
HKEY_LOCAL_MACHINE or HKEY_USERS. Instead, the hive is loaded under a
special root that cannot be enumerated. As a result, there is no way
to enumerate hives currently loaded by RegLoadAppKey. All operations
on hives loaded by RegLoadAppKey have to be performed relative to the
handle returned in phkResult.
If two processes are required to perform operations on the same hive,
each process must call RegLoadAppKey to retrieve a handle. During the
RegLoadAppKey operation, the registry will verify if the file has
already been loaded. If it has been loaded, the registry will return
a handle to the previously loaded hive rather than re-loading the
hive.
All keys inside the hive must have the same security descriptor,
otherwise the function will fail. This security descriptor must grant
the caller the access specified by the samDesired parameter or the
function will fail. You cannot use the RegSetKeySecurity function on
any key inside the hive. In Windows 8 and later, each process can
call RegLoadAppKey to load multiple hives. In Windows 7 and earlier,
each process can load only one hive using RegLoadAppKey at a time.
Any hive loaded using RegLoadAppKey is automatically unloaded when
all handles to the keys inside the hive are closed using RegCloseKey.
To compile an application that uses this function, define
_WIN32_WINNT as 0x0600 or later. For more information, see Using the
Windows Headers.
> [!NOTE] > The winreg.h header defines RegLoadAppKey as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
RegOpenKeyW
Opens the specified registry key. (Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey, phkResult
hKey : [intptr] A handle to an open registry key. This handle is returned by the RegCreateKeyEx or RegOpenKeyEx function, or it can be one of the following predefined keys: * HKEY_CLASSES_ROOT * HKEY_CURRENT_CONFIG * HKEY_CURRENT_USER * HKEY_LOCAL_MACHINE * HKEY_USERS
lpSubKey : [wstr] The name of the registry key to be opened. This key must be a subkey of the key identified by the hKey parameter. Key names are not case sensitive. If this parameter is NULL or a pointer to an empty string, the function returns the same handle that was passed in. For more information, see Registry Element Size Limits.
phkResult : [intptr] A pointer to a variable that receives a handle to the opened key. If the key is not one of the predefined registry keys, call the RegCloseKey function after you have finished using the handle.
%inst
Opens the specified registry key. (Unicode)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
Winerror.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error.

[備考]
The RegOpenKey function uses the default security access mask to open
a key. If opening the key requires a different access right, the
function fails, returning ERROR_ACCESS_DENIED. An application should
use the RegOpenKeyEx function to specify an access mask in this
situation. RegOpenKey does not create the specified key if the key
does not exist in the database. If your service or application
impersonates different users, do not use this function with
HKEY_CURRENT_USER. Instead, call the RegOpenCurrentUser function.
> [!NOTE] > The winreg.h header defines RegOpenKey as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
RegOpenKeyTransactedW
Opens the specified registry key and associates it with a transaction. (Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey, ulOptions, samDesired, phkResult, hTransaction, pExtendedParemeter
hKey : [intptr] A handle to an open registry key. This handle is returned by the RegCreateKeyEx, RegCreateKeyTransacted, RegOpenKeyEx, or RegOpenKeyTransacted function. It can also be one of the following predefined keys: HKEY_CLASSES_ROOT HKEY_CURRENT_USER HKEY_LOCAL_MACHINE HKEY_USERS
lpSubKey : [wstr] The name of the registry subkey to be opened. Key names are not case sensitive. If the lpSubKey parameter is NULL or a pointer to an empty string, and if hKey is a predefined key, then the system refreshes the predefined key, and phkResult receives the same hKey handle passed into the function. Otherwise, phkResult receives a new handle to the opened key. For more information, see Registry Element Size Limits.
ulOptions : [int] This parameter is reserved and must be zero.
samDesired : [int] A mask that specifies the desired access rights to the key. The function fails if the security descriptor of the key does not permit the requested access for the calling process. For more information, see Registry Key Security and Access Rights.
phkResult : [intptr] A pointer to a variable that receives a handle to the opened key. If the key is not one of the predefined registry keys, call the RegCloseKey function after you have finished using the handle.
hTransaction : [intptr] A handle to an active transaction. This handle is returned by the CreateTransaction function.
pExtendedParemeter : [intptr] This parameter is reserved and must be NULL.
%inst
Opens the specified registry key and associates it with a
transaction. (Unicode)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
Winerror.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error.

[備考]
When a key is opened using this function, subsequent operations on
the key are transacted. If a non-transacted operation is performed on
the key before the transaction is committed, the transaction is
rolled back. After a transaction is committed or rolled back, you
must re-open the key using the RegCreateKeyTransacted or
RegOpenKeyTransacted function with an active transaction handle to
make additional operations transacted. For more information about
transactions, see Kernel Transaction Manager. Note that subsequent
operations on subkeys of this key are not automatically transacted.
Therefore, the RegDeleteKeyEx function does not perform a transacted
delete operation. Instead, use the RegDeleteKeyTransacted function to
perform a transacted delete operation. Unlike the
RegCreateKeyTransacted function, the RegOpenKeyTransacted function
does not create the specified key if the key does not exist in the
registry. If your service or application impersonates different
users, do not use this function with HKEY_CURRENT_USER. Instead, call
the RegOpenCurrentUser function. If the key returned in phkResult is
a predefined registry key, it is not included in the provided
transaction. A single registry key can be opened only 65,534 times.
When attempting the 65,535th open operation, this function fails with
ERROR_NO_SYSTEM_RESOURCES.
> [!NOTE] > The winreg.h header defines RegOpenKeyTransacted as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
RegOverridePredefKey
Maps a predefined registry key to the specified registry key.
%group
Win32 advapi32
%prm
hKey, hNewHKey
hKey : [intptr] A handle to one of the following predefined keys: - HKEY_CLASSES_ROOT - HKEY_CURRENT_CONFIG - HKEY_CURRENT_USER - HKEY_LOCAL_MACHINE - HKEY_PERFORMANCE_DATA - HKEY_USERS
hNewHKey : [intptr] A handle to an open registry key. This handle is returned by the RegCreateKeyEx or RegOpenKeyEx function. It cannot be one of the predefined keys. The function maps hKey to refer to the hNewHKey key. This affects only the calling process. If hNewHKey is NULL, the function restores the default mapping of the predefined key.
%inst
Maps a predefined registry key to the specified registry key.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
Winerror.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error.

[備考]
The RegOverridePredefKey function is intended for software
installation programs. It allows them to remap a predefined key, load
a DLL component that will be installed on the system, call an entry
point in the DLL, and examine the changes to the registry that the
component attempted to make. The installation program can then write
those changes to the locations intended by the DLL, or make changes
to the data before writing it. For example, consider an installation
program that installs an ActiveX control as part of an application
installation. The installation program needs to call the control's
DllRegisterServer entry point to enable the control to register
itself. Before this call, the installation program can call
RegOverridePredefKey to remap HKEY_CLASSES_ROOT to a temporary key
such as HKEY_CURRENT_USER\TemporaryInstall\DllRegistration. It then
calls DllRegisterServer, which causes the ActiveX control to write
its registry entries to the temporary key. The installation program
then calls RegOverridePredefKey again to restore the original mapping
of HKEY_CLASSES_ROOT. The installation program can modify the keys
written to the temporary key, if necessary, before copying them to
the original HKEY_CLASSES_ROOT. After the call to
RegOverridePredefKey, you can safely call RegCloseKey to close the
hNewHKey handle. The system maintains its own reference to hNewHKey.


%index
RegQueryMultipleValuesW
Retrieves the type and data for a list of value names associated with an open registry key. (Unicode)
%group
Win32 advapi32
%prm
hKey, val_list, num_vals, lpValueBuf, ldwTotsize
hKey : [intptr] A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see Registry Key Security and Access Rights.
val_list : [var] A pointer to an array of [VALENT](./ns-winreg-valentw.md) structures that describe one or more value entries. On input, the ve_valuename member of each structure must contain a pointer to the name of a value to retrieve. The function fails if any of the specified values do not exist in the specified key.
num_vals : [int] The number of elements in the val_list array.
lpValueBuf : [wstr] A pointer to a buffer. If the function succeeds, the buffer receives the data for each value.
ldwTotsize : [var] A pointer to a variable that specifies the size of the buffer pointed to by the lpValueBuf parameter, in bytes. If the function succeeds, ldwTotsize receives the number of bytes copied to the buffer. If the function fails because the buffer is too small, ldwTotsize receives the required size, in bytes.
%inst
Retrieves the type and data for a list of value names associated with
an open registry key. (Unicode)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is one of the following error codes.
This doc was truncated.

[備考]
The RegQueryMultipleValues function allows an application to query
one or more values of a static or dynamic key. If the target key is a
static key, the system provides all of the values in an atomic
fashion. To prevent excessive serialization, the aggregate data
returned by the function cannot exceed one megabyte. If the target
key is a dynamic key, its provider must provide all the values in an
atomic fashion. This means the provider should fill the results
buffer synchronously, providing a consistent view of all the values
in the buffer while avoiding excessive serialization. The provider
can provide at most one megabyte of total output data during an
atomic call to this function. RegQueryMultipleValues is supported
remotely; that is, the hKey parameter passed to the function can
refer to a remote computer.
> [!NOTE] > The winreg.h header defines RegQueryMultipleValues as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
RegQueryReflectionKey
Determines whether reflection has been disabled or enabled for the specified key.
%group
Win32 advapi32
%prm
hBase, bIsReflectionDisabled
hBase : [intptr] A handle to the registry key. This handle is returned by the RegCreateKeyEx, RegCreateKeyTransacted, RegOpenKeyEx, or RegOpenKeyTransacted function; it cannot specify a key on a remote computer.
bIsReflectionDisabled : [var] A value that indicates whether reflection has been disabled through RegDisableReflectionKey or enabled through RegEnableReflectionKey.
%inst
Determines whether reflection has been disabled or enabled for the
specified key.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
Winerror.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error.

[備考]
On WOW64, 32-bit applications view a registry tree that is separate
from the registry tree that 64-bit applications view. Registry
reflection copies specific registry keys and values between the two
views. To disable registry reflection, use the
RegDisableReflectionKey function. To restore reflection for a
disabled key, use the RegEnableReflectionKey function.


%index
RegQueryValueW
Retrieves the data associated with the default or unnamed value of a specified registry key. The data must be a null-terminated string. (Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey, lpData, lpcbData
hKey : [intptr] A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see Registry Key Security and Access Rights.
lpSubKey : [wstr] The name of the subkey of the hKey parameter for which the default value is retrieved. Key names are not case sensitive. If this parameter is NULL or points to an empty string, the function retrieves the default value for the key identified by hKey. For more information, see Registry Element Size Limits.
lpData : [wstr] A pointer to a buffer that receives the default value of the specified key.
lpcbData : [var] A pointer to a variable that specifies the size of the buffer pointed to by the lpValue parameter, in bytes. When the function returns, this variable contains the size of the data copied to lpValue, including any terminating null characters.
%inst
Retrieves the data associated with the default or unnamed value of a
specified registry key. The data must be a null-terminated string.
(Unicode)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a system error code. If the
lpValue buffer is too small to receive the value, the function
returns ERROR_MORE_DATA.

[備考]
If the ANSI version of this function is used (either by explicitly
calling RegQueryValueA or by not defining UNICODE before including
the Windows.h file), this function converts the stored Unicode string
to an ANSI string before copying it to the buffer specified by the
lpValue parameter. If the data has the REG_SZ, REG_MULTI_SZ or
REG_EXPAND_SZ type, the string may not have been stored with the
proper null-terminating characters. Therefore, even if the function
returns ERROR_SUCCESS, the application should ensure that the string
is properly terminated before using it; otherwise, it may overwrite a
buffer. (Note that REG_MULTI_SZ strings should have two
null-terminating characters.) Note that operations that access
certain registry keys are redirected. For more information, see
Registry Virtualization and 32-bit and 64-bit Application Data in the
Registry.
> [!NOTE] > The winreg.h header defines RegQueryValue as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
RegRenameKey
Changes the name of the specified registry key. (RegRenameKey)
%group
Win32 advapi32
%prm
hKey, lpSubKeyName, lpNewKeyName
hKey : [intptr] A handle to the key to be renamed. The handle must be opened with the KEY_WRITE access right. For more information, see [Registry Key Security and Access Rights](/windows/win32/SysInfo/registry-key-security-and-access-rights). This handle is returned by the [RegCreateKeyEx](nf-winreg-regcreatekeyexa.md) or [RegOpenKeyEx](nf-winreg-regopenkeyexa.md) function, or it can be one of the following [Predefined Keys](/windows/win32/SysInfo/predefined-keys): * HKEY_CLASSES_ROOT * HKEY_CURRENT_CONFIG * HKEY_CURRENT_USER * HKEY_LOCAL_MACHINE * HKEY_USERS
lpSubKeyName : [wstr] The name of the subkey to be renamed. This key must be a subkey of the key identified by the *hKey* parameter. This parameter can also be **NULL**, in which case the key identified by the *hKey* parameter will be renamed.
lpNewKeyName : [wstr] The new name of the key. The new name must not already exist.
%inst
Changes the name of the specified registry key. (RegRenameKey)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
Winerror.h. You can use the
[FormatMessage](/windows/desktop/api/winbase/nf-winbase-formatmessage)
function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic
description of the error. An error code of STATUS_ACCESS_DENIED
indicates that the caller does not have the necessary access rights
to the specified registry key or subkeys.

[備考]
This function can be used to rename an entire registry subtree. The
caller must have KEY_CREATE_SUB_KEY access to the parent of the
specified key and DELETE access to the entire subtree being renamed.


%index
RegReplaceKeyW
Replaces the file backing a registry key and all its subkeys with another file, so that when the system is next started, the key and subkeys will have the values stored in the new file. (Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey, lpNewFile, lpOldFile
hKey : [intptr] A handle to an open registry key. This handle is returned by the RegCreateKeyEx or RegOpenKeyEx function, or it can be one of the following predefined keys:
lpSubKey : [wstr] The name of the registry key whose subkeys and values are to be replaced. If the key exists, it must be a subkey of the key identified by the hKey parameter. If the subkey does not exist, it is created. This parameter can be NULL.
lpNewFile : [wstr] The name of the file with the registry information. This file is typically created by using the RegSaveKey function.
lpOldFile : [wstr] The name of the file that receives a backup copy of the registry information being replaced.
%inst
Replaces the file backing a registry key and all its subkeys with
another file, so that when the system is next started, the key and
subkeys will have the values stored in the new file. (Unicode)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
Winerror.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error.

[備考]
There are two different registry hive file formats. Registry hives
created on current operating systems typically cannot be loaded by
earlier ones. The file specified by the lpNewFile parameter remains
open until the system is restarted. If hKey is a handle returned by
RegConnectRegistry, then the paths specified in lpNewFile and
lpOldFile are relative to the remote computer. The calling process
must have the SE_RESTORE_NAME and SE_BACKUP_NAME privileges on the
computer in which the registry resides. For more information, see
Running with Special Privileges.
> [!NOTE] > The winreg.h header defines RegReplaceKey as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
RegSaveKeyW
Saves the specified key and all of its subkeys and values to a new file, in the standard format. (Unicode)
%group
Win32 advapi32
%prm
hKey, lpFile, lpSecurityAttributes
hKey : [intptr] A handle to an open registry key. This handle is returned by the RegCreateKeyEx or RegOpenKeyEx function, or it can be one of the following predefined keys:
lpFile : [wstr] The name of the file in which the specified key and subkeys are to be saved. If the file already exists, the function fails.
lpSecurityAttributes : [var] A pointer to a SECURITY_ATTRIBUTES structure that specifies a security descriptor for the new file. If lpSecurityAttributes is NULL, the file gets a default security descriptor. The ACLs in a default security descriptor for a file are inherited from its parent directory.
%inst
Saves the specified key and all of its subkeys and values to a new
file, in the standard format. (Unicode)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
Winerror.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error. If the file already exists, the function fails with the
ERROR_ALREADY_EXISTS error.

[備考]
If hKey represents a key on a remote computer, the path described by
lpFile is relative to the remote computer. The RegSaveKey function
saves only nonvolatile keys. It does not save volatile keys. A key is
made volatile or nonvolatile at its creation; see RegCreateKeyEx. You
can use the file created by RegSaveKey in subsequent calls to the
RegLoadKey, RegReplaceKey, or RegRestoreKey functions. If RegSaveKey
fails part way through its operation, the file will be corrupt and
subsequent calls to RegLoadKey, RegReplaceKey, or RegRestoreKey for
the file will fail. Using RegSaveKey together with RegRestoreKey to
copy subtrees in the registry is not recommended. This method does
not trigger notifications and can invalidate handles used by other
applications. Instead, use the SHCopyKey function or the RegCopyTree
function. The calling process must have the SE_BACKUP_NAME privilege
enabled. For more information, see Running with Special Privileges.
> [!NOTE] > The winreg.h header defines RegSaveKey as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
RegSetKeyValueW
Sets the data for the specified value in the specified registry key and subkey. (Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey, lpValueName, dwType, lpData, cbData
hKey : [intptr] A handle to an open registry key. The key must have been opened with the KEY_SET_VALUE access right. For more information, see Registry Key Security and Access Rights.
lpSubKey : [wstr] The name of the subkey relative to the key identified by hKey. If the subkey does not exist, it is created as a non-volatile key with a default security descriptor. If this parameter is NULL, then the value is created in the key specified by hKey.
lpValueName : [wstr] The name of the registry value whose data is to be updated.
dwType : [int] The type of data pointed to by the lpData parameter. For a list of the possible types, see Registry Value Types.
lpData : [intptr] The data to be stored with the specified value name. For string-based types, such as REG_SZ, the string must be null-terminated. With the REG_MULTI_SZ data type, the string must be terminated with two null characters.
cbData : [int] The size of the information pointed to by the lpData parameter, in bytes. If the data is of type REG_SZ, REG_EXPAND_SZ, or REG_MULTI_SZ, cbData must include the size of the terminating null character or characters.
%inst
Sets the data for the specified value in the specified registry key
and subkey. (Unicode)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
Winerror.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error.

[備考]
To compile an application that uses this function, define
_WIN32_WINNT as 0x0600 or later. For more information, see Using the
Windows Headers.
> [!NOTE] > The winreg.h header defines RegSetKeyValue as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
RegSetValueW
Sets the data for the default or unnamed value of a specified registry key. The data must be a text string. (Unicode)
%group
Win32 advapi32
%prm
hKey, lpSubKey, dwType, lpData, cbData
hKey : [intptr] A handle to an open registry key. The key must have been opened with the KEY_SET_VALUE access right. For more information, see Registry Key Security and Access Rights.
lpSubKey : [wstr] The name of a subkey of the hKey parameter. The function sets the default value of the specified subkey. If lpSubKey does not exist, the function creates it. Key names are not case sensitive. If this parameter is NULL or points to an empty string, the function sets the default value of the key identified by hKey. For more information, see Registry Element Size Limits.
dwType : [int] The type of information to be stored. This parameter must be the REG_SZ type. To store other data types, use the RegSetValueEx function.
lpData : [wstr] The data to be stored. This parameter cannot be NULL.
cbData : [int] This parameter is ignored. The function calculates this value based on the size of the data in the lpData parameter.
%inst
Sets the data for the default or unnamed value of a specified
registry key. The data must be a text string. (Unicode)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a nonzero error code defined in
Winerror.h. You can use the FormatMessage function with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the
error.

[備考]
If the key specified by the lpSubKey parameter does not exist, the
RegSetValue function creates it. If the ANSI version of this function
is used (either by explicitly calling RegSetValueA or by not defining
UNICODE before including the Windows.h file), the lpData parameter
must be an ANSI character string. The string is converted to Unicode
before it is stored in the registry.
> [!NOTE] > The winreg.h header defines RegSetValue as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
RegisterEventSourceW
Retrieves a registered handle to the specified event log. (Unicode)
%group
Win32 advapi32
%prm
lpUNCServerName, lpSourceName
lpUNCServerName : [wstr] The Universal Naming Convention (UNC) name of the remote server on which this operation is to be performed. If this parameter is NULL, the local computer is used.
lpSourceName : [wstr] The name of the event source whose handle is to be retrieved. The source name must be a subkey of a log under the Eventlog registry key. Note that the Security log is for system use only. Note??This string must not contain characters prohibited in XML Attributes, with the exception of XML Escape sequences such as &lt; or &gt;.
%inst
Retrieves a registered handle to the specified event log. (Unicode)

[戻り値]
If the function succeeds, the return value is a handle to the event
log.
If the function fails, the return value is NULL. To get extended
error information, call GetLastError. The function returns
ERROR_ACCESS_DENIED if lpSourceName specifies the Security event log.

[備考]
If the source name cannot be found, the event logging service uses
the Application log. Although events will be reported , the events
will not include descriptions because there are no message and
category message files for looking up descriptions related to the
event identifiers. To close the handle to the event log, use the
DeregisterEventSource function.


%index
RegisterServiceCtrlHandlerW
Registers a function to handle service control requests. (Unicode)
%group
Win32 advapi32
%prm
lpServiceName, lpHandlerProc
lpServiceName : [wstr] The name of the service run by the calling thread. This is the service name that the service control program specified in the CreateService function when creating the service.
lpHandlerProc : [int] A pointer to the handler function to be registered. For more information, see Handler.
%inst
Registers a function to handle service control requests. (Unicode)

[戻り値]
If the function succeeds, the return value is a service status
handle. If the function fails, the return value is zero. To get
extended error information, call GetLastError. The following error
codes can be set by the service control manager.
This doc was truncated.

[備考]
The ServiceMain function of a new service should immediately call the
RegisterServiceCtrlHandler function to register a control handler
function with the control dispatcher. This enables the control
dispatcher to invoke the specified function when it receives control
requests for this service. For a list of possible control codes, see
Handler. The threads of the calling process can use the service
status handle returned by this function to identify the service in
subsequent calls to the SetServiceStatus function. The
RegisterServiceCtrlHandler function must be called before the first
SetServiceStatus call because RegisterServiceCtrlHandler returns a
service status handle for the caller to use so that no other service
can inadvertently set this service status. In addition, the control
handler must be in place to receive control requests by the time the
service specifies the controls it accepts through the
SetServiceStatus function. When the control handler function is
invoked with a control request, the service must call
SetServiceStatus to report status to the service control manager only
if the service status has changed, such as when the service is
processing stop or shutdown controls. If the service status has not
changed, the service should not report status to the service control
manager. The service status handle does not have to be closed.


%index
RegisterServiceCtrlHandlerExW
Registers a function to handle extended service control requests. (Unicode)
%group
Win32 advapi32
%prm
lpServiceName, lpHandlerProc, lpContext
lpServiceName : [wstr] The name of the service run by the calling thread. This is the service name that the service control program specified in the CreateService function when creating the service.
lpHandlerProc : [int] A pointer to the handler function to be registered. For more information, see HandlerEx.
lpContext : [intptr] Any user-defined data. This parameter, which is passed to the handler function, can help identify the service when multiple services share a process.
%inst
Registers a function to handle extended service control requests.
(Unicode)

[戻り値]
If the function succeeds, the return value is a service status
handle. If the function fails, the return value is zero. To get
extended error information, call GetLastError. The following error
codes can be set by the service control manager.
This doc was truncated.

[備考]
The ServiceMain function of a new service should immediately call the
RegisterServiceCtrlHandlerEx function to register a control handler
function with the control dispatcher. This enables the control
dispatcher to invoke the specified function when it receives control
requests for this service. For a list of possible control codes, see
HandlerEx. The threads of the calling process can use the service
status handle returned by this function to identify the service in
subsequent calls to the SetServiceStatus function. The
RegisterServiceCtrlHandlerEx function must be called before the first
SetServiceStatus call because RegisterServiceCtrlHandlerEx returns a
service status handle for the caller to use so that no other service
can inadvertently set this service status. In addition, the control
handler must be in place to receive control requests by the time the
service specifies the controls it accepts through the
SetServiceStatus function. When the control handler function is
invoked with a control request, the service must call
SetServiceStatus to report status to the service control manager only
if the service status has changed, such as when the service is
processing stop or shutdown controls. If the service status has not
changed, the service should not report status to the service control
manager. The service status handle does not have to be closed.
> [!NOTE] > The winsvc.h header defines RegisterServiceCtrlHandlerEx
as an alias which automatically selects the ANSI or Unicode version
of this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
RegisterWaitChainCOMCallback
Register COM callback functions for WCT.
%group
Win32 advapi32
%prm
CallStateCallback, ActivationStateCallback
CallStateCallback : [int] The address of the CoGetCallState function.
ActivationStateCallback : [int] The address of the CoGetActivationState function.
%inst
Register COM callback functions for WCT.

[備考]
If a thread is blocked on a COM call, WCT can retrieve COM ownership
information using these callback functions. If this function is
callback multiple times, only the last addresses retrieved are used.


%index
RemoveUsersFromEncryptedFile
Removes specified certificate hashes from a specified file.
%group
Win32 advapi32
%prm
lpFileName, pHashes
lpFileName : [wstr] The name of the file.
pHashes : [var] A pointer to an ENCRYPTION_CERTIFICATE_HASH_LIST structure that contains a list of certificate hashes to be removed from the file.
%inst
Removes specified certificate hashes from a specified file.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a system error code. For a
complete list of error codes, see System Error Codes or the header
file WinError.h.

[備考]
The RemoveUsersFromEncryptedFile function removes the specified
certificate hashes if they exist in the specified file. If any of the
certificate hashes are not found in the specified file, they are
ignored and no error code is returned. Starting with Windows 8 and
Windows Server 2012, this function is supported by the following
technologies.
This doc was truncated.


%index
ReportEventW
Writes an entry at the end of the specified event log. (Unicode)
%group
Win32 advapi32
%prm
hEventLog, wType, wCategory, dwEventID, lpUserSid, wNumStrings, dwDataSize, lpStrings, lpRawData
hEventLog : [intptr] A handle to the event log. The RegisterEventSource function returns this handle. As of Windows?XP with SP2, this parameter cannot be a handle to the Security log. To write an event to the Security log, use the AuthzReportSecurityEvent function.
wType : [int] 
wCategory : [int] The event category. This is source-specific information; the category can have any value. For more information, see Event Categories.
dwEventID : [int] The event identifier. The event identifier specifies the entry in the message file associated with the event source. For more information, see Event Identifiers.
lpUserSid : [int] A pointer to the current user's security identifier. This parameter can be NULL if the security identifier is not required.
wNumStrings : [int] The number of insert strings in the array pointed to by the lpStrings parameter. A value of zero indicates that no strings are present.
dwDataSize : [int] The number of bytes of event-specific raw (binary) data to write to the log. If this parameter is zero, no event-specific data is present.
lpStrings : [var] A pointer to a buffer containing an array of null-terminated strings that are merged into the message before Event Viewer displays the string to the user. This parameter must be a valid pointer (or NULL), even if wNumStrings is zero. Each string is limited to 31,839  characters. Prior to Windows?Vista:??Each string is limited to 32K characters.
lpRawData : [intptr] A pointer to the buffer containing the binary data. This parameter must be a valid pointer (or NULL), even if the dwDataSize parameter is zero.
%inst
Writes an entry at the end of the specified event log. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero, indicating
that the entry was written to the log.
If the function fails, the return value is zero. To get extended
error information, call GetLastError, which returns one of the
following extended error codes.
This doc was truncated.

[備考]
This function is used to log an event. The entry is written to the
end of the configured log for the source identified by the hEventLog
parameter. The ReportEvent function adds the time, the entry's
length, and the offsets before storing the entry in the log. To
enable the function to add the user name, you must supply the user's
SID in the lpUserSid parameter. There are different size limits on
the size of the message data that can be logged depending on the
version of Windows used by both the client where the application is
run and the server where the message is logged. The server is
determined by the lpUNCServerName parameter passed to the
RegisterEventSource function. Different errors are returned when the
size limit is exceeded that depend on the version of Windows. If the
string that you log contains %n, where n is an integer value (for
example, %1), the event viewer treats it as an insertion string.
Because an IPv6 address can contain this character sequence, you must
provide a format specifier (!S!) to log an event message that
contains an IPv6 address. This specifier tells the formatting code to
use the string literally and not perform any further expansions (for
example, "my IPv6 address is: %1!S!").


%index
RevertToSelf
Terminates the impersonation of a client application.
%group
Win32 advapi32
%prm

%inst
Terminates the impersonation of a client application.

[戻り値]
If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. To get extended
error information, call GetLastError.

[備考]
A process should call the RevertToSelf function after finishing any
impersonation begun by using the DdeImpersonateClient,
ImpersonateDdeClientWindow, ImpersonateLoggedOnUser,
ImpersonateNamedPipeClient, ImpersonateSelf,
ImpersonateAnonymousToken or SetThreadToken function. An RPC server
that used the RpcImpersonateClient function to impersonate a client
must call the RpcRevertToSelf or RpcRevertToSelfEx to end the
impersonation. If RevertToSelf fails, your application continues to
run in the context of the client, which is not appropriate. You
should shut down the process if RevertToSelf fails.


%index
SaferCloseLevel
Closes a SAFER_LEVEL_HANDLE that was opened by using the SaferIdentifyLevel function or the SaferCreateLevel function.
%group
Win32 advapi32
%prm
hLevelHandle
hLevelHandle : [intptr] The SAFER_LEVEL_HANDLE to be closed.
%inst
Closes a SAFER_LEVEL_HANDLE that was opened by using the
SaferIdentifyLevel function or the SaferCreateLevel function.

[戻り値]
TRUE if the function succeeds; otherwise, FALSE. For extended error
information, call GetLastError.


%index
SaferComputeTokenFromLevel
Restricts a token using restrictions specified by a SAFER_LEVEL_HANDLE.
%group
Win32 advapi32
%prm
LevelHandle, InAccessToken, OutAccessToken, dwFlags, lpReserved
LevelHandle : [intptr] SAFER_LEVEL_HANDLE that contains the restrictions to place on the input token. Do not pass handles with a LevelId of SAFER_LEVELID_FULLYTRUSTED or SAFER_LEVELID_DISALLOWED to this function. This is because SAFER_LEVELID_FULLYTRUSTED is unrestricted and SAFER_LEVELID_DISALLOWED does not contain a token.
InAccessToken : [intptr] Token to be restricted. If this parameter is NULL, the token of the current thread will be used. If the current thread does not contain a token, the token of the current process is used.
OutAccessToken : [intptr] The resulting restricted token.
dwFlags : [int] 
lpReserved : [intptr] If the SAFER_TOKEN_COMPARE_ONLY  flag is set, this parameter, on output, specifies the result of the token comparison. The output value is an LPDWORD. A value of ?1 indicates that the resulting token would be less privileged than the token specified by the InAccessToken parameter. If the SAFER_TOKEN_WANT_FLAGS flag is set, and the SAFER_TOKEN_COMPARE_ONLY flag is not set, this parameter is an LPDWORD value that specifies the flags used to create the restricted token.
%inst
Restricts a token using restrictions specified by a
SAFER_LEVEL_HANDLE.

[戻り値]
TRUE if the function succeeds; otherwise, FALSE. For extended
information, call GetLastError.


%index
SaferCreateLevel
Opens a SAFER_LEVEL_HANDLE.
%group
Win32 advapi32
%prm
dwScopeId, dwLevelId, OpenFlags, pLevelHandle, lpReserved
dwScopeId : [int] The scope of the level to be created. The following table shows the possible values.
dwLevelId : [int] The level of the handle to be opened. The following table shows the possible values.
OpenFlags : [int] This can be the following value.
pLevelHandle : [intptr] The returned SAFER_LEVEL_HANDLE. When you have finished using the handle, close it by calling the SaferCloseLevel function.
lpReserved : [intptr] This parameter is reserved for future use. Set it to NULL.
%inst
Opens a SAFER_LEVEL_HANDLE.

[戻り値]
Returns nonzero if successful or zero otherwise.
For extended error information, call GetLastError.


%index
SaferGetLevelInformation
Retrieves information about a policy level.
%group
Win32 advapi32
%prm
LevelHandle, dwInfoType, lpQueryBuffer, dwInBufferSize, lpdwOutBufferSize
LevelHandle : [intptr] The handle of the level to be queried.
dwInfoType : [int] A SAFER_OBJECT_INFO_CLASS enumeration value that specifies the type of object information that should be returned.  The specified value determines the size and type of the lpQueryBuffer parameter. The following table shows the possible values.
lpQueryBuffer : [intptr] A buffer to contain the results of the query. For the type of the returned information for each possible value of the dwInfoType parameter, see the dwInfoType parameter.
dwInBufferSize : [int] The size of the lpQueryBuffer parameter in bytes.
lpdwOutBufferSize : [var] A pointer to return the output size of the lpQueryBuffer parameter.
%inst
Retrieves information about a policy level.

[戻り値]
TRUE if the function succeeds; otherwise, FALSE. For extended error
information, call GetLastError.


%index
SaferGetPolicyInformation
Gets information about a policy.
%group
Win32 advapi32
%prm
dwScopeId, SaferPolicyInfoClass, InfoBufferSize, InfoBuffer, InfoBufferRetSize, lpReserved
dwScopeId : [int] The scope of the query. The following table shows the possible values.
SaferPolicyInfoClass : [int] A SAFER_POLICY_INFO_CLASS  enumeration value  that specifies the type of policy information that should be returned. The specified value determines the size and type of the InfoBuffer parameter. The following table shows the possible values.
InfoBufferSize : [int] The size, in bytes, of the InfoBuffer parameter.
InfoBuffer : [intptr] A buffer to contain the results of the query. The size and type of the returned information is determined by the SaferPolicyInfoClass parameter. For the type of the returned information for each possible value of the SaferPolicyInfoClass parameter, see the SaferPolicyInfoClass parameter.
InfoBufferRetSize : [var] The number of bytes in the InfoBuffer parameter that were filled with policy information.
lpReserved : [intptr] Reserved for future use. This parameter should be set to NULL.
%inst
Gets information about a policy.

[戻り値]
TRUE if the function succeeds; otherwise, FALSE. For extended error
information, call GetLastError.


%index
SaferIdentifyLevel
Retrieves information about a level.
%group
Win32 advapi32
%prm
dwNumProperties, pCodeProperties, pLevelHandle, lpReserved
dwNumProperties : [int] Number of SAFER_CODE_PROPERTIES structures in the pCodeproperties  parameter.
pCodeProperties : [var] Array of SAFER_CODE_PROPERTIES structures. Each structure contains a code file to be checked and the  criteria used to check the file.
pLevelHandle : [intptr] The returned SAFER_LEVEL_HANDLE. When you have finished using the handle, close it by calling the SaferCloseLevel function.
lpReserved : [intptr] Reserved for future use. Should be set to NULL. Beginning with Windows?8 and Windows Server?2012 SRP_POLICY_APPX is defined as Windows Store app.
%inst
Retrieves information about a level.

[戻り値]
TRUE if a SAFER_LEVEL_HANDLE was opened; otherwise, FALSE. For
extended error information, call GetLastError.


%index
SaferRecordEventLogEntry
Saves messages to an event log.
%group
Win32 advapi32
%prm
hLevel, szTargetPath, lpReserved
hLevel : [intptr] SAFER_LEVEL_HANDLE that contains the details of the rule to send to the event log.
szTargetPath : [wstr] Path of the file that attempted to run.
lpReserved : [intptr] Reserved for future use. This parameter should be set to NULL.
%inst
Saves messages to an event log.

[戻り値]
TRUE if the function succeeds; otherwise, FALSE. For extended error
information, call GetLastError.

[備考]
If SaferIdentifyLevel returns a SAFER_LEVEL_HANDLE with a LevelId
that is anything other than SAFER_LEVELID_FULLYTRUSTED (0x40000),
SaferRecordEventLogEntry can be called to facilitate troubleshooting.
For example, clicking a button in excel.exe might attempt to launch
another process that is not fully trusted. This might display an
obscure error message because the program remapped the error returned
from CreateProcess. To ease troubleshooting, some Safer functions
call SaferRecordEventLogEntry to send an event to the event log.


%index
SaferSetLevelInformation
Sets the information about a policy level.
%group
Win32 advapi32
%prm
LevelHandle, dwInfoType, lpQueryBuffer, dwInBufferSize
LevelHandle : [intptr] The handle of the level to be set.
dwInfoType : [int] A SAFER_OBJECT_INFO_CLASS enumeration value that specifies the type of object information that should be set.  The specified value determines the size and type of the lpQueryBuffer parameter. The following table shows the possible values.
lpQueryBuffer : [intptr] A buffer to contain the results of the query. For the type of the returned information for each possible value of the dwInfoType parameter, see the dwInfoType parameter.
dwInBufferSize : [int] The size, in bytes, of the lpQueryBuffer parameter.
%inst
Sets the information about a policy level.

[戻り値]
TRUE if the function succeeds; otherwise, FALSE. For extended error
information, call GetLastError.


%index
SaferSetPolicyInformation
Sets the global policy controls.
%group
Win32 advapi32
%prm
dwScopeId, SaferPolicyInfoClass, InfoBufferSize, InfoBuffer, lpReserved
dwScopeId : [int] The scope of the query. The following table shows the possible values.
SaferPolicyInfoClass : [int] A SAFER_POLICY_INFO_CLASS  enumeration value  that specifies the type of policy information that should be set. The specified value determines the size and type of the InfoBuffer parameter. The following table shows the possible values.
InfoBufferSize : [int] The size, in bytes, of the InfoBuffer parameter.
InfoBuffer : [intptr] A buffer to contain the results of the query. The size and type of the returned information is determined by the SaferPolicyInfoClass parameter. For the type of the returned information for each possible value of the SaferPolicyInfoClass parameter, see the SaferPolicyInfoClass parameter.
lpReserved : [intptr] Reserved for future use. This parameter should be set to NULL.
%inst
Sets the global policy controls.

[戻り値]
TRUE if the function succeeds; otherwise, FALSE. For extended error
information, call GetLastError.


%index
SaferiIsExecutableFileType
Determines whether a specified file is an executable file.
%group
Win32 advapi32
%prm
szFullPathname, bFromShellExecute
szFullPathname : [wstr] Pointer to a null-terminated Unicode character string for the name of the file. The path is optional because only the file name extension is evaluated. The evaluation of the file name extension is not case-sensitive. This parameter cannot be NULL or an empty string, and the specified file must include a file name extension.
bFromShellExecute : [int] Boolean value that determines whether .exe files are treated as executable files for the file type evaluation. Set this value to TRUE to omit .exe files from the evaluation or to FALSE to include them.
%inst
Determines whether a specified file is an executable file.

[戻り値]
If the function successfully recognizes the file name's extension as
an executable file type, the return value is TRUE. If the function
fails, or if szFullPath identifies a file name with a nonexecutable
extension, the function returns FALSE.

[備考]
The following file name extensions are examples of executable file
types. This is not a complete list.
This doc was truncated.


%index
SetAclInformation
Sets information about an access control list (ACL).
%group
Win32 advapi32
%prm
pAcl, pAclInformation, nAclInformationLength, dwAclInformationClass
pAcl : [var] A pointer to an ACL. The function sets information in this ACL.
pAclInformation : [intptr] A pointer to a buffer that contains the information to be set. This must be a pointer to an ACL_REVISION_INFORMATION structure.
nAclInformationLength : [int] The size, in bytes, of the buffer pointed to by the pAclInfo parameter.
dwAclInformationClass : [int] An ACL_INFORMATION_CLASS enumerated type that gives the class of information requested.
%inst
Sets information about an access control list (ACL).

[戻り値]
If the function succeeds, the function returns nonzero.
If the function fails, it returns zero. To get extended error
information, call GetLastError.


%index
SetEncryptedFileMetadata
(no summary)
%group
Win32 advapi32
%prm
lpFileName, pbOldMetadata, pbNewMetadata, pOwnerHash, dwOperation, pCertificatesAdded
lpFileName : [wstr] 
pbOldMetadata : [var] 
pbNewMetadata : [var] 
pOwnerHash : [var] 
dwOperation : [int] 
pCertificatesAdded : [var] 
%inst



%index
SetEntriesInAclW
Creates a new access control list (ACL) by merging new access control or audit control information into an existing ACL structure. (Unicode)
%group
Win32 advapi32
%prm
cCountOfExplicitEntries, pListOfExplicitEntries, OldAcl, NewAcl
cCountOfExplicitEntries : [int] The number of EXPLICIT_ACCESS structures in the pListOfExplicitEntries array.
pListOfExplicitEntries : [var] A pointer to an array of EXPLICIT_ACCESS structures that describe the access control information to merge into the existing ACL.
OldAcl : [var] A pointer to the existing ACL. This parameter can be NULL, in which case, the function creates a new ACL based on the EXPLICIT_ACCESS entries.
NewAcl : [var] A pointer to a variable that receives a pointer to the new ACL. If the function succeeds, you must call the LocalFree function to free the returned buffer.
%inst
Creates a new access control list (ACL) by merging new access control
or audit control information into an existing ACL structure.
(Unicode)

[戻り値]
If the function succeeds, the function returns ERROR_SUCCESS. If the
function fails, it returns a nonzero error code defined in
WinError.h.

[備考]
Each entry in the array of EXPLICIT_ACCESS structures specifies
access control or audit control information for a specified trustee.
A trustee can be a user, group, or other security identifier (SID)
value, such as a logon identifier or logon type (for instance, a
Windows service or batch job). You can use a name or a SID to
identify a trustee. You can use the SetEntriesInAcl function to
modify the list of access control entries (ACEs) in a discretionary
access control list (DACL) or a system access control list (SACL).
Note that SetEntriesInAcl does not prevent you from mixing access
control and audit control information in the same ACL; however, the
resulting ACL will contain meaningless entries. For a DACL, the
grfAccessMode member of the EXPLICIT_ACCESS structure specifies
whether to allow, deny, or revoke access rights for the trustee. This
member can specify one of the following values:
This doc was truncated.


%index
SetFileSecurityW
The SetFileSecurityW (Unicode) function (securitybaseapi.h) sets the security of a file or directory object.
%group
Win32 advapi32
%prm
lpFileName, SecurityInformation, pSecurityDescriptor
lpFileName : [wstr] A pointer to a null-terminated string that specifies the file or directory for which security is set. Note that security applied to a directory is not inherited by its children.
SecurityInformation : [int] Specifies a SECURITY_INFORMATION structure that identifies the contents of the security descriptor pointed to by the pSecurityDescriptor parameter.
pSecurityDescriptor : [int] A pointer to a SECURITY_DESCRIPTOR structure.
%inst
The SetFileSecurityW (Unicode) function (securitybaseapi.h) sets the
security of a file or directory object.

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. To get extended error information,
call GetLastError.

[備考]
The SetFileSecurity function is successful only if the following
conditions are met:
This doc was truncated.


%index
SetKernelObjectSecurity
Sets the security of a kernel object.
%group
Win32 advapi32
%prm
Handle, SecurityInformation, SecurityDescriptor
Handle : [intptr] A handle to a kernel object for which security information is set.
SecurityInformation : [int] A set of bit flags that indicate the type of security information to set. This parameter can be a combination of the SECURITY_INFORMATION bit flags.
SecurityDescriptor : [int] A pointer to a SECURITY_DESCRIPTOR structure that contains the new security information.
%inst
Sets the security of a kernel object.

[戻り値]
If the function succeeds, the function returns nonzero.
If the function fails, it returns zero. To get extended error
information, call GetLastError.


%index
SetNamedSecurityInfoW
Sets specified security information in the security descriptor of a specified object. (Unicode)
%group
Win32 advapi32
%prm
pObjectName, ObjectType, SecurityInfo, psidOwner, psidGroup, pDacl, pSacl
pObjectName : [wstr] A pointer to a null-terminated string that specifies the name of the object for which to set security information. This can be the name of a local or remote file or directory on an NTFS file system, network share, registry key, semaphore, event, mutex, file mapping, or waitable timer.
ObjectType : [int] A value of the SE_OBJECT_TYPE enumeration that indicates the type of object named by the pObjectName parameter.
SecurityInfo : [int] A set of bit flags that indicate the type of security information to set. This parameter can be a combination of the SECURITY_INFORMATION bit flags.
psidOwner : [int] A pointer to a SID structure that identifies the owner of the object. If the caller does not have the SeRestorePrivilege constant (see Privilege Constants), this SID must be contained in the caller's token, and must have the SE_GROUP_OWNER permission enabled. The SecurityInfo parameter must include the OWNER_SECURITY_INFORMATION flag. To set the owner, the caller must have WRITE_OWNER access to the object or have the SE_TAKE_OWNERSHIP_NAME privilege enabled. If you are not setting the owner SID, this parameter can be NULL.
psidGroup : [int] A pointer to a SID that identifies the primary group of the object. The SecurityInfo parameter must include the GROUP_SECURITY_INFORMATION flag. If you are not setting the primary group SID, this parameter can be NULL.
pDacl : [var] A pointer to the new DACL for the object. The SecurityInfo parameter must include the DACL_SECURITY_INFORMATION flag. The caller must have WRITE_DAC access to the object or be the owner of the object. If you are not setting the DACL, this parameter can be NULL.
pSacl : [var] A pointer to the new SACL for the object. The SecurityInfo parameter must include any of the following flags: SACL_SECURITY_INFORMATION, LABEL_SECURITY_INFORMATION, ATTRIBUTE_SECURITY_INFORMATION, SCOPE_SECURITY_INFORMATION, or BACKUP_SECURITY_INFORMATION.
%inst
Sets specified security information in the security descriptor of a
specified object. (Unicode)

[戻り値]
If the function succeeds, the function returns ERROR_SUCCESS. If the
function fails, it returns a nonzero error code defined in
WinError.h.

[備考]
If you are setting the discretionary access control list (DACL) or
any elements in the system access control list (SACL) of an object,
the system automatically propagates any inheritable access control
entries (ACEs) to existing child objects, according to the rules of
inheritance. You can use the SetNamedSecurityInfo function with the
following types of objects:
This doc was truncated.


%index
SetPrivateObjectSecurity
Modifies a private object's security descriptor.
%group
Win32 advapi32
%prm
SecurityInformation, ModificationDescriptor, ObjectsSecurityDescriptor, GenericMapping, Token
SecurityInformation : [int] Indicates the parts of the security descriptor to set. This value can be a combination of the SECURITY_INFORMATION bit flags.
ModificationDescriptor : [int] A pointer to a SECURITY_DESCRIPTOR structure. The parts of this security descriptor indicated by the SecurityInformation parameter are applied to the ObjectsSecurityDescriptor security descriptor.
ObjectsSecurityDescriptor : [var] A pointer to a pointer to a SECURITY_DESCRIPTOR structure. This security descriptor must be in self-relative form. **The memory for the security descriptor must be allocated from the process heap (GetProcessHeap) with the HeapAlloc function.**
GenericMapping : [var] A pointer to a GENERIC_MAPPING structure that specifies the specific and standard access rights that correspond to each of the generic access rights.
Token : [intptr] A handle to the access token for the client on whose behalf the private object's security is being modified. This parameter is required to ensure that the client has provided a legitimate value for a new owner security identifier (SID). The token must be open for TOKEN_QUERY access.
%inst
Modifies a private object's security descriptor.

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. To get extended error information,
call GetLastError.

[備考]
This function is intended for use by resource managers only. To
implement the standard access control semantics for updating security
descriptors, a resource manager should verify that the following
conditions are met before calling SetPrivateObjectSecurity:
This doc was truncated.


%index
SetPrivateObjectSecurityEx
Modifies the security descriptor of a private object maintained by the resource manager calling this function.
%group
Win32 advapi32
%prm
SecurityInformation, ModificationDescriptor, ObjectsSecurityDescriptor, AutoInheritFlags, GenericMapping, Token
SecurityInformation : [int] The parts of the security descriptor to set. This value can be a combination of the SECURITY_INFORMATION bit flags.
ModificationDescriptor : [int] A pointer to a SECURITY_DESCRIPTOR structure. The parts of this security descriptor indicated by the SecurityInformation parameter are applied to the ObjectsSecurityDescriptor security descriptor.
ObjectsSecurityDescriptor : [var] A pointer to a pointer to a SECURITY_DESCRIPTOR structure. This security descriptor must be in self-relative form. **The memory for the security descriptor must be allocated from the process heap (GetProcessHeap) with the HeapAlloc function.**
AutoInheritFlags : [int] 
GenericMapping : [var] A pointer to a GENERIC_MAPPING structure that specifies the specific and standard access rights that correspond to each of the generic access rights.
Token : [intptr] Identifies the access token for the client on whose behalf the private object's security is being modified. This parameter is required to ensure that the client has provided a legitimate value for a new owner security identifier (SID). The token must be open for TOKEN_QUERY access.
%inst
Modifies the security descriptor of a private object maintained by
the resource manager calling this function.

[戻り値]
If the function succeeds, the function returns nonzero.
If the function fails, it returns zero. To get extended error
information, call GetLastError.

[備考]
If the AutoInheritFlags parameter is zero, SetPrivateObjectSecurityEx
is identical to the SetPrivateObjectSecurity function. This function
is intended for use by resource managers only. To implement the
standard Windows access control semantics for updating security
descriptors, a resource manager should verify that the following
conditions are met before calling SetPrivateObjectSecurityEx:
This doc was truncated.


%index
SetSecurityAccessMask
Creates an access mask that represents the access permissions necessary to set the specified object security information.
%group
Win32 advapi32
%prm
SecurityInformation, DesiredAccess
SecurityInformation : [int] A SECURITY_INFORMATION structure that specifies the security information to be set.
DesiredAccess : [var] A pointer to the access mask that this function creates.
%inst
Creates an access mask that represents the access permissions
necessary to set the specified object security information.


%index
SetSecurityDescriptorControl
Sets the control bits of a security descriptor. The function can set only the control bits that relate to automatic inheritance of ACEs.
%group
Win32 advapi32
%prm
pSecurityDescriptor, ControlBitsOfInterest, ControlBitsToSet
pSecurityDescriptor : [int] A pointer to a SECURITY_DESCRIPTOR structure whose control and revision information are set.
ControlBitsOfInterest : [int] A SECURITY_DESCRIPTOR_CONTROL mask that indicates the control bits to set.
ControlBitsToSet : [int] A SECURITY_DESCRIPTOR_CONTROL mask that indicates the new values for the control bits specified by the ControlBitsOfInterest mask.
%inst
Sets the control bits of a security descriptor. The function can set
only the control bits that relate to automatic inheritance of ACEs.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The SetSecurityDescriptorControl function specifies the control bit
or bits to modify, and whether the bits are on or off.


%index
SetSecurityDescriptorDacl
Sets information in a discretionary access control list (DACL). If a DACL is already present in the security descriptor, the DACL is replaced.
%group
Win32 advapi32
%prm
pSecurityDescriptor, bDaclPresent, pDacl, bDaclDefaulted
pSecurityDescriptor : [int] A pointer to the SECURITY_DESCRIPTOR structure to which the function adds the DACL. This security descriptor must be in absolute format, meaning that its members must be pointers to other structures, rather than offsets to contiguous data.
bDaclPresent : [int] A flag that indicates the presence of a DACL in the security descriptor. If this parameter is TRUE, the function sets the SE_DACL_PRESENT flag in the SECURITY_DESCRIPTOR_CONTROL structure and uses the values in the pDacl and bDaclDefaulted parameters. If this parameter is FALSE, the function clears the SE_DACL_PRESENT flag, and pDacl and bDaclDefaulted are ignored.
pDacl : [var] A pointer to an ACL structure that specifies the DACL for the security descriptor. If this parameter is NULL, a NULL DACL is assigned to the security descriptor, which allows all access to the object. The DACL is referenced by, not copied into, the security descriptor.
bDaclDefaulted : [int] A flag that indicates the source of the DACL. If this flag is TRUE, the DACL has been retrieved by some default mechanism. If FALSE, the DACL has been explicitly specified by a user. The function stores this value in the SE_DACL_DEFAULTED flag of the SECURITY_DESCRIPTOR_CONTROL structure. If this parameter is not specified, the SE_DACL_DEFAULTED flag is cleared.
%inst
Sets information in a discretionary access control list (DACL). If a
DACL is already present in the security descriptor, the DACL is
replaced.

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. To get extended error information,
call GetLastError.

[備考]
There is an important difference between an empty and a nonexistent
DACL. When a DACL is empty, it contains no access control entries
(ACEs); therefore, no access rights are explicitly granted. As a
result, access to the object is implicitly denied. When an object has
no DACL (when the pDacl parameter is NULL), no protection is assigned
to the object, and all access requests are granted. To help maintain
security, restrict access by using a DACL. There are three possible
outcomes in different configurations of the bDaclPresent flag and the
pDacl parameter:
This doc was truncated.


%index
SetSecurityDescriptorGroup
Sets the primary group information of an absolute-format security descriptor, replacing any primary group information already present in the security descriptor.
%group
Win32 advapi32
%prm
pSecurityDescriptor, pGroup, bGroupDefaulted
pSecurityDescriptor : [int] A pointer to the SECURITY_DESCRIPTOR structure whose primary group is set by this function. The function replaces any existing primary group with the new primary group.
pGroup : [int] A pointer to a SID structure for the security descriptor's new primary group. The SID structure is referenced by, not copied into, the security descriptor. If this parameter is NULL, the function clears the security descriptor's primary group information. This marks the security descriptor as having no primary group.
bGroupDefaulted : [int] Indicates whether the primary group information was derived from a default mechanism. If this value is TRUE, it is default information, and the function stores this value as the SE_GROUP_DEFAULTED flag in the SECURITY_DESCRIPTOR_CONTROL structure. If this parameter is zero, the SE_GROUP_DEFAULTED flag is cleared.
%inst
Sets the primary group information of an absolute-format security
descriptor, replacing any primary group information already present
in the security descriptor.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
SetSecurityDescriptorOwner
Sets the owner information of an absolute-format security descriptor. It replaces any owner information already present in the security descriptor.
%group
Win32 advapi32
%prm
pSecurityDescriptor, pOwner, bOwnerDefaulted
pSecurityDescriptor : [int] A pointer to the SECURITY_DESCRIPTOR structure whose owner is set by this function. The function replaces any existing owner with the new owner.
pOwner : [int] A pointer to a SID structure for the security descriptor's new primary owner. The SID structure is referenced by, not copied into, the security descriptor. If this parameter is NULL, the function clears the security descriptor's owner information. This marks the security descriptor as having no owner.
bOwnerDefaulted : [int] Indicates whether the owner information is derived from a default mechanism. If this value is TRUE, it is default information. The function stores this value as the SE_OWNER_DEFAULTED flag in the SECURITY_DESCRIPTOR_CONTROL structure. If this parameter is zero, the SE_OWNER_DEFAULTED flag is cleared.
%inst
Sets the owner information of an absolute-format security descriptor.
It replaces any owner information already present in the security
descriptor.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
SetSecurityDescriptorRMControl
Sets the resource manager control bits in the SECURITY_DESCRIPTOR structure.
%group
Win32 advapi32
%prm
SecurityDescriptor, RMControl
SecurityDescriptor : [int] A pointer to a SECURITY_DESCRIPTOR structure that contains the resource manager control bits.
RMControl : [var] A pointer to the bitfield value that the resource manager control bits in the SECURITY_DESCRIPTOR structure will be set to. If the value of this parameter is NULL, the resource manager control bits will be cleared.
%inst
Sets the resource manager control bits in the SECURITY_DESCRIPTOR
structure.

[戻り値]
The return value is ERROR_SUCCESS.

[備考]
The resource manager control bits are eight bits in the Sbz1 member
of the SECURITY_INFORMATION structure that contains information
specific to the resource manager accessing the structure. These bits
should be accessed only through the GetSecurityDescriptorRMControl
and SetSecurityDescriptorRMControl functions.


%index
SetSecurityDescriptorSacl
Sets information in a system access control list (SACL). If there is already a SACL present in the security descriptor, it is replaced.
%group
Win32 advapi32
%prm
pSecurityDescriptor, bSaclPresent, pSacl, bSaclDefaulted
pSecurityDescriptor : [int] A pointer to the SECURITY_DESCRIPTOR structure to which the function adds the SACL. This security descriptor must be in absolute format, meaning that its members must be pointers to other structures, rather than offsets to contiguous data.
bSaclPresent : [int] Indicates the presence of a SACL in the security descriptor. If this parameter is TRUE, the function sets the SE_SACL_PRESENT flag in the SECURITY_DESCRIPTOR_CONTROL structure and uses the values in the pSacl and bSaclDefaulted parameters. If it is FALSE, the function does not set the SE_SACL_PRESENT flag, and pSacl and bSaclDefaulted are ignored.
pSacl : [var] A pointer to an ACL structure that specifies the SACL for the security descriptor. If this parameter is NULL, a NULL SACL is assigned to the security descriptor. The SACL is referenced by, not copied into, the security descriptor.
bSaclDefaulted : [int] Indicates the source of the SACL. If this flag is TRUE, the SACL has been retrieved by some default mechanism. If it is FALSE, the SACL has been explicitly specified by a user. The function stores this value in the SE_SACL_DEFAULTED flag of the SECURITY_DESCRIPTOR_CONTROL structure. If this parameter is not specified, the SE_SACL_DEFAULTED flag is cleared.
%inst
Sets information in a system access control list (SACL). If there is
already a SACL present in the security descriptor, it is replaced.

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. To get extended error information,
call GetLastError.


%index
SetSecurityInfo
Sets specified security information in the security descriptor of a specified object. The caller identifies the object by a handle.
%group
Win32 advapi32
%prm
handle, ObjectType, SecurityInfo, psidOwner, psidGroup, pDacl, pSacl
handle : [intptr] A handle to the object for which to set security information.
ObjectType : [int] A member of the SE_OBJECT_TYPE enumeration that indicates the type of object identified by the handle parameter.
SecurityInfo : [int] A set of bit flags that indicate the type of security information to set. This parameter can be a combination of the SECURITY_INFORMATION bit flags.
psidOwner : [int] A pointer to a SID that identifies the owner of the object. The SID must be one that can be assigned as the owner SID of a security descriptor. The SecurityInfo parameter must include the OWNER_SECURITY_INFORMATION flag. This parameter can be NULL if you are not setting the owner SID.
psidGroup : [int] A pointer to a SID that identifies the primary group of the object. The SecurityInfo parameter must include the GROUP_SECURITY_INFORMATION flag. This parameter can be NULL if you are not setting the primary group SID.
pDacl : [var] A pointer to the new DACL for the object. This parameter is ignored unless the value of the SecurityInfo parameter includes the DACL_SECURITY_INFORMATION flag.  If the value of the SecurityInfo parameter includes the DACL_SECURITY_INFORMATION flag and the value of this parameter is set to NULL, full access to the object is granted to everyone. For information about null DACLs, see Creating a DACL.
pSacl : [var] A pointer to the new SACL for the object. The SecurityInfo parameter must include any of the following flags: SACL_SECURITY_INFORMATION, LABEL_SECURITY_INFORMATION, ATTRIBUTE_SECURITY_INFORMATION, SCOPE_SECURITY_INFORMATION, or BACKUP_SECURITY_INFORMATION. If setting SACL_SECURITY_INFORMATION or SCOPE_SECURITY_INFORMATION, the caller must have the SE_SECURITY_NAME privilege enabled. This parameter can be NULL if you are not setting the SACL.
%inst
Sets specified security information in the security descriptor of a
specified object. The caller identifies the object by a handle.

[戻り値]
If the function succeeds, the function returns ERROR_SUCCESS. If the
function fails, it returns a nonzero error code defined in
WinError.h.

[備考]
If you are setting the discretionary access control list (DACL) or
any elements in the system access control list (SACL) of an object,
the system automatically propagates any inheritable access control
entries (ACEs) to existing child objects, according to the ACE
inheritance rules.
You can use the SetSecurityInfo function with the following types of
objects:
This doc was truncated.


%index
SetServiceBits
Registers a service type with the service control manager and the Server service.
%group
Win32 advapi32
%prm
hServiceStatus, dwServiceBits, bSetBitsOn, bUpdateImmediately
hServiceStatus : [intptr] A handle to the status information structure for the service. A service obtains the handle by calling the RegisterServiceCtrlHandlerEx function.
dwServiceBits : [int] The service type.
bSetBitsOn : [int] If this value is TRUE, the bits in dwServiceBit are to be set. If this value is FALSE, the bits are to be cleared.
bUpdateImmediately : [int] If this value is TRUE, the Server service is to perform an immediate update. If this value is FALSE, the update is not be performed immediately.
%inst
Registers a service type with the service control manager and the
Server service.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
SetServiceObjectSecurity
Sets the security descriptor of a service object.
%group
Win32 advapi32
%prm
hService, dwSecurityInformation, lpSecurityDescriptor
hService : [intptr] A handle to the service. This handle is returned by the OpenService or CreateService function. The access required for this handle depends on the security information specified in the dwSecurityInformation parameter.
dwSecurityInformation : [int] 
lpSecurityDescriptor : [int] A pointer to a SECURITY_DESCRIPTOR structure that contains the new security information.
%inst
Sets the security descriptor of a service object.

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. To get extended error information,
call GetLastError. The following error codes can be set by the
service control manager. Other error codes can be set by the registry
functions that are called by the service control manager.
This doc was truncated.

[備考]
The SetServiceObjectSecurity function sets the specified portions of
the security descriptor of the service object based on the
information specified in the lpSecurityDescriptor buffer. This
function replaces any or all of the security information associated
with the service object, according to the flags set in the
dwSecurityInformation parameter and subject to the access rights of
the calling process. When a service is created, the service control
manager assigns a default security descriptor to the service object.
To retrieve a copy of the security descriptor for a service object,
call the QueryServiceObjectSecurity function. For a description of
the default security descriptor for a service object, see Service
Security and Access Rights. Note that granting certain access to
untrusted users (such as SERVICE_CHANGE_CONFIG or SERVICE_STOP) can
allow them to interfere with the execution of your service and
possibly allow them to run applications under the LocalSystem
account.


%index
SetServiceStatus
Updates the service control manager's status information for the calling service.
%group
Win32 advapi32
%prm
hServiceStatus, lpServiceStatus
hServiceStatus : [intptr] A handle to the status information structure for the current service. This handle is returned by the RegisterServiceCtrlHandlerEx function.
lpServiceStatus : [var] A pointer to the SERVICE_STATUS structure the contains the latest status information for the calling service.
%inst
Updates the service control manager's status information for the
calling service.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The following error codes can be set
by the service control manager. Other error codes can be set by the
registry functions that are called by the service control manager.
This doc was truncated.

[備考]
A ServiceMain function first calls the RegisterServiceCtrlHandlerEx
function to get the service's SERVICE_STATUS_HANDLE. Then it
immediately calls the SetServiceStatus function to notify the service
control manager that its status is SERVICE_START_PENDING. During
initialization, the service can provide updated status to indicate
that it is making progress but it needs more time. A common bug is
for the service to have the main thread perform the initialization
while a separate thread continues to call SetServiceStatus to prevent
the service control manager from marking it as hung. However, if the
main thread hangs, then the service start ends up in an infinite loop
because the worker thread continues to report that the main thread is
making progress. After processing a control request, the service's
Handler function must call SetServiceStatus if the service status
changes to report its new status to the service control manager. It
is only necessary to do so when the service is changing state, such
as when it is processing stop or shutdown controls. A service can
also use this function at any time from any thread of the service to
notify the service control manager of state changes, such as when the
service must stop due to a recoverable error. A service can call this
function only after it has called RegisterServiceCtrlHandlerEx to get
a service status handle. If a service calls SetServiceStatus with the
dwCurrentState member set to SERVICE_STOPPED and the dwWin32ExitCode
member set to a nonzero value, the following entry is written into
the System event log:
This doc was truncated.


%index
SetThreadToken
Assigns an impersonation token to a thread. The function can also cause a thread to stop using an impersonation token.
%group
Win32 advapi32
%prm
Thread, Token
Thread : [intptr] A pointer to a handle to the thread to which the function assigns the impersonation token.
Token : [intptr] A handle to the impersonation token to assign to the thread. This handle must have been opened with TOKEN_IMPERSONATE access rights. For more information, see Access Rights for Access-Token Objects.
%inst
Assigns an impersonation token to a thread. The function can also
cause a thread to stop using an impersonation token.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
When using the SetThreadToken function to impersonate, you must have
the impersonate privileges and make sure that the SetThreadToken
function succeeds before calling the RevertToSelf function.


%index
SetTokenInformation
Sets various types of information for a specified access token.
%group
Win32 advapi32
%prm
TokenHandle, TokenInformationClass, TokenInformation, TokenInformationLength
TokenHandle : [intptr] A handle to the access token for which information is to be set.
TokenInformationClass : [int] A value from the TOKEN_INFORMATION_CLASS enumerated type that identifies the type of information the function sets. The valid values from TOKEN_INFORMATION_CLASS are described in the TokenInformation parameter.
TokenInformation : [intptr] A pointer to a buffer that contains the information set in the access token. The structure of this buffer depends on the type of information specified by the TokenInformationClass parameter.
TokenInformationLength : [int] Specifies the length, in bytes, of the buffer pointed to by TokenInformation.
%inst
Sets various types of information for a specified access token.

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. To get extended error information,
call GetLastError.

[備考]
To set privilege information, an application can call the
AdjustTokenPrivileges function. To set a token's groups, an
application can call the AdjustTokenGroups function. Token-type
information can be set only when an access token is created.


%index
SetUserFileEncryptionKey
Sets the user's current key to the specified certificate.
%group
Win32 advapi32
%prm
pEncryptionCertificate
pEncryptionCertificate : [var] A pointer to a certificate that will be the user's key. This parameter is a pointer to an ENCRYPTION_CERTIFICATE structure.
%inst
Sets the user's current key to the specified certificate.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is a system error code. For a
complete list of error codes, see System Error Codes or the header
file WinError.h.

[備考]
In Windows 8 and Windows Server 2012, this function is supported by
the following technologies.
This doc was truncated.


%index
SetUserFileEncryptionKeyEx
(no summary)
%group
Win32 advapi32
%prm
pEncryptionCertificate, dwCapabilities, dwFlags, pvReserved
pEncryptionCertificate : [var] 
dwCapabilities : [int] 
dwFlags : [int] 
pvReserved : [intptr] 
%inst



%index
StartServiceW
Starts a service. (Unicode)
%group
Win32 advapi32
%prm
hService, dwNumServiceArgs, lpServiceArgVectors
hService : [intptr] A handle to the service. This handle is returned by the OpenService or CreateService function, and it must have the SERVICE_START access right. For more information, see Service Security and Access Rights.
dwNumServiceArgs : [int] The number of strings in the lpServiceArgVectors array. If lpServiceArgVectors is NULL, this parameter can be zero.
lpServiceArgVectors : [var] The null-terminated strings to be passed to the ServiceMain function for the service as arguments. If there are no arguments, this parameter can be NULL. Otherwise, the first argument (lpServiceArgVectors[0]) is the name of the service, followed by any additional arguments (lpServiceArgVectors[1] through lpServiceArgVectors[dwNumServiceArgs-1]). Driver services do not receive these arguments.
%inst
Starts a service. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The following error codes can be set
by the service control manager. Others can be set by the registry
functions that are called by the service control manager.
This doc was truncated.

[備考]
When a driver service is started, the StartService function does not
return until the device driver has finished initializing. When a
service is started, the Service Control Manager (SCM) spawns the
service process, if necessary. If the specified service shares a
process with other services, the required process may already exist.
The StartService function does not wait for the first status update
from the new service, because it can take a while. Instead, it
returns when the SCM receives notification from the service control
dispatcher that the ServiceMain thread for this service was created
successfully. The SCM sets the following default status values before
returning from StartService:
This doc was truncated.


%index
StartServiceCtrlDispatcherW
Connects the main thread of a service process to the service control manager, which causes the thread to be the service control dispatcher thread for the calling process. (Unicode)
%group
Win32 advapi32
%prm
lpServiceStartTable
lpServiceStartTable : [var] A pointer to an array of SERVICE_TABLE_ENTRY structures containing one entry for each service that can execute in the calling process. The members of the last entry in the table must have NULL values to designate the end of the table.
%inst
Connects the main thread of a service process to the service control
manager, which causes the thread to be the service control dispatcher
thread for the calling process. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The following error code can be set
by the service control manager. Other error codes can be set by the
registry functions that are called by the service control manager.
This doc was truncated.

[備考]
When the service control manager starts a service process, it waits
for the process to call the StartServiceCtrlDispatcher function. The
main thread of a service process should make this call as soon as
possible after it starts up (within 30 seconds). If
StartServiceCtrlDispatcher succeeds, it connects the calling thread
to the service control manager and does not return until all running
services in the process have entered the SERVICE_STOPPED state. The
service control manager uses this connection to send control and
service start requests to the main thread of the service process. The
main thread acts as a dispatcher by invoking the appropriate
HandlerEx function to handle control requests, or by creating a new
thread to execute the appropriate ServiceMain function when a new
service is started. The lpServiceTable parameter contains an entry
for each service that can run in the calling process. Each entry
specifies the ServiceMain function for that service. For
SERVICE_WIN32_SHARE_PROCESS services, each entry must contain the
name of a service. This name is the service name that was specified
by the CreateService function when the service was installed. For
SERVICE_WIN32_OWN_PROCESS services, the service name in the table
entry is ignored. If a service runs in its own process, the main
thread of the service process should immediately call
StartServiceCtrlDispatcher. All initialization tasks are done in the
service's ServiceMain function when the service is started. If
multiple services share a process and some common process-wide
initialization needs to be done before any ServiceMain function is
called, the main thread can do the work before calling
StartServiceCtrlDispatcher, as long as it takes less than 30 seconds.
Otherwise, another thread must be created to do the process-wide
initialization, while the main thread calls
StartServiceCtrlDispatcher and becomes the service control
dispatcher. Any service-specific initialization should still be done
in the individual service main functions. Services should not attempt
to display a user interface directly. For more information, see
Interactive Services.


%index
StartTraceW
The StartTrace function starts an event tracing session. (Unicode)
%group
Win32 advapi32
%prm
TraceHandle, InstanceName, Properties
TraceHandle : [var] Receives the handle to the event tracing session for subsequent use with APIs such as [ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew). Do not use this handle if the function fails. Do not compare the session handle to INVALID_HANDLE_VALUE. The session handle is 0 if the handle is not valid.
InstanceName : [wstr] Null-terminated string that contains the name of the event tracing session. The session name is limited to 1,024 characters, is case-insensitive, and must be unique. > [!Important] > Use a descriptive name for your session so that the session's > ownership and usage can be determined from the session name. Do not use a GUID > or other non-deterministic or non-descriptive value. Do not append random > digits to make your session name unique. ETW sessions are a limited resource > so your component should not be starting multiple sessions. If your > component's session is already running when your component starts, your > component should clean up the orphaned session rather than creating a second > session. This function copies the session name that you provide to the offset that the **LoggerNameOffset** member of _Properties_ points to.
Properties : [var] Pointer to an [EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties) structure that specifies the behavior of the session. The following are key members of the structure to set: - **Wnode.BufferSize** - **Wnode.Guid** - **Wnode.ClientContext** - **Wnode.Flags** - **LogFileMode** - **LogFileNameOffset** - **LoggerNameOffset** Depending on the type of log file you choose to create, you may also need to specify a value for **MaximumFileSize**. See the Remarks section for more information on setting the _Properties_ parameter and the behavior of the session. **Starting with Windows?10, version 1703:** For better performance in cross process scenarios, you can now pass filtering in to **StartTrace** when starting system wide private loggers. You will need to pass in the new [EVENT_TRACE_PROPERTIES_V2](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties_v2) structure to include filtering information. See [Configuring and Starting a Private Logger Session](/windows/win32/etw/configuring-and-starting-a-private-logger-session) for more details.
%inst
The StartTrace function starts an event tracing session. (Unicode)

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is one of the [system error
codes](/windows/win32/debug/system-error-codes). The following are
some common errors and their causes. - **ERROR_BAD_LENGTH** One of
the following is true: - The **Wnode.BufferSize** member of
_Properties_ specifies an incorrect size. - _Properties_ does not
have sufficient space allocated to hold a copy of _InstanceName_. -
**ERROR_INVALID_PARAMETER** One of the following is true: -
_Properties_ is **NULL**. - _TraceHandle_ is **NULL**. - The
**LogFileNameOffset** member of _Properties_ is not valid. - The
**LoggerNameOffset** member of _Properties_ is not valid. - The
**LogFileMode** member of _Properties_ specifies a combination of
flags that is not valid. - The **Wnode.Guid** member is
**SystemTraceControlGuid**, but the _InstanceName_ parameter is not
**KERNEL_LOGGER_NAME**. - **ERROR_ALREADY_EXISTS** A session with the
same name or GUID is already running. - **ERROR_BAD_PATHNAME** You
can receive this error for one of the following reasons: - Another
session is already using the file name specified by the
**LogFileNameOffset** member of the _Properties_ structure. - Both
**LogFileMode** and **LogFileNameOffset** are zero. -
**ERROR_DISK_FULL** There is not enough free space on the drive for
the log file. This occurs if: - **MaximumFileSize** is nonzero and
there is not **MaximumFileSize** bytes available for the log file -
the drive is a system drive and there is not an additional 200 MB
available - **MaximumFileSize** is zero and there is not an
additional 200 MB available Choose a drive with more space, or
decrease the size specified in **MaximumFileSize** (if used). -
**ERROR_ACCESS_DENIED** Only users with administrative privileges,
users in the Performance Log Users group, and services running as
LocalSystem, LocalService, NetworkService can control event tracing
sessions. To grant a restricted user the ability to control trace
sessions, add them to the Performance Log Users group. Only users
with administrative privileges and services running as LocalSystem
can control an NT Kernel Logger session. If the user is a member of
the Performance Log Users group, they may not have permission to
create the log file in the specified folder. -
**ERROR_NO_SYSTEM_RESOURCES** One of the following is true: - The
logging session uses the **EVENT_TRACE_SYSTEM_LOGGER_MODE** flag and
the maximum number of system loggers (8) has been reached. - The
maximum number of logging sessions on the system has been reached. No
new loggers can be created until a logging session has been stopped.
On most systems, the maximum number of logging sessions is 64. You
can change the maximum number of logging sessions for a system by
editing the **REG_DWORD** key at
`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI@EtwMaxLoggers`.
Permissible values are 32 through 256, inclusive. A reboot is
required for any change to take effect. Note that Loggers use system
resources. Increasing the number of loggers on the system will come
at a performance cost if those slots are filled. This limit exists to
prevent excessive use of system resources. > [!Important] > The limit
should only be manually adjusted by a system > administrator to
enable specific scenarios. The EtwMaxLoggers setting must > not be
automatically modified by a program or driver. Prior to Windows 10,
version 1709, this is a fixed cap of 64 loggers for non-private
loggers.

[備考]
Event trace controllers call this function. The session remains
active until the session is stopped, the computer is restarted, an
I/O error occurs, or the maximum file size is reached for
non-circular logs. To stop an event tracing session, call the
[ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew)
function and set the _ControlCode_ parameter to
**EVENT_TRACE_CONTROL_STOP**. You cannot start more than one session
with the same session GUID (as specified by `Properties.Wnode.Guid`).
In most cases, you will set `Properties.Wnode.Guid` to all-zero (i.e.
**GUID_NULL**) to allow the ETW system to generate a new GUID for the
session. To specify a private logger session, set **Wnode.Guid**
member of _Properties_ to the provider's control GUID, not the
private logger session's control GUID. The provider must have
registered the GUID before you call **StartTrace**. You do not use
this function to start a global logger session (deprecated). For
details on starting a global logger session, see [Configuring and
Starting the Global Logger
Session](/windows/win32/etw/configuring-and-starting-the-global-logger-session).


%index
StopTraceW
The StopTraceW (Unicode) function (evntrace.h) stops the specified event tracing session. The ControlTrace function supersedes this function.
%group
Win32 advapi32
%prm
TraceHandle, InstanceName, Properties
TraceHandle : [int] Handle to the event tracing session to be stopped, or 0. You must specify a non-zero _TraceHandle_ if _InstanceName_ is **NULL**. This parameter will be used only if _InstanceName_ is **NULL**. The handle is returned by the [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracew).
InstanceName : [wstr] Name of the event tracing session to be stopped, or **NULL**. You must specify _InstanceName_ if _TraceHandle_ is 0. To specify the NT Kernel Logger session, set _InstanceName_ to **KERNEL_LOGGER_NAME**.
Properties : [var] Pointer to an [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) structure that receives the final properties and statistics for the session. If you are using a newly initialized structure, you only need to set the **Wnode.BufferSize**, **Wnode.Guid**, **LoggerNameOffset**, and **LogFileNameOffset** members of the structure. You can use the maximum session name (1024 characters) and maximum log file name (1024 characters) lengths to calculate the buffer size and offsets if not known. **Starting with Windows?10, version 1703:** For better performance in cross process scenarios, you can now pass filtering in to **StopTrace** for system wide private loggers. You will need to pass in the new [EVENT_TRACE_PROPERTIES_V2](/windows/desktop/ETW/event-trace-properties-v2) structure to include filtering information. See [Configuring and Starting a Private Logger Session](/windows/desktop/ETW/configuring-and-starting-a-private-logger-session) for more details.
%inst
The StopTraceW (Unicode) function (evntrace.h) stops the specified
event tracing session. The ControlTrace function supersedes this
function.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is one of the [system error
codes](/windows/win32/debug/system-error-codes). The following are
some common errors and their causes. - **ERROR_BAD_LENGTH** One of
the following is true: - The **Wnode.BufferSize** member of
_Properties_ specifies an incorrect size. - _Properties_ does not
have sufficient space allocated to hold a copy of the session name
and log file name (if used). - **ERROR_INVALID_PARAMETER** One of the
following is true: - _Properties_ is **NULL**. - _InstanceName_ and
_TraceHandle_ are both **NULL**. - _InstanceName_ is **NULL** and
_TraceHandle_ is not a valid handle. - **ERROR_ACCESS_DENIED** Only
users with administrative privileges, users in the Performance Log
Users group, and services running as LocalSystem, LocalService,
NetworkService can control event tracing sessions. To grant a
restricted user the ability to control trace sessions, add them to
the Performance Log Users group. **Windows XP and Windows 2000:**
Anyone can control a trace session.

[備考]
Event trace controllers call this function. This function is
obsolete. Instead, use
[ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew)
with _ControlCode_ set to **EVENT_TRACE_CONTROL_STOP**. If
**LogFileMode** contains **EVENT_TRACE_FILE_MODE_PREALLOCATE**,
[StartTrace](/windows/desktop/ETW/starttrace) extends the log file to
**MaximumFileSize** bytes. The file occupies the entire space during
logging, for both circular and sequential logs. When you stop the
logger, the log file is reduced to the size needed. Do not call
**StopTrace** from DllMain (may cause deadlock). > [!NOTE] > The
evntrace.h header defines StopTrace as an alias which > automatically
selects the ANSI or Unicode version of this function based on > the
definition of the UNICODE preprocessor constant. Mixing usage of the
> encoding-neutral alias with code that not encoding-neutral can lead
to > mismatches that result in compilation or runtime errors. For
more information, > see > [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
TraceSetInformation
Configures event tracing session settings.
%group
Win32 advapi32
%prm
SessionHandle, InformationClass, TraceInformation, InformationLength
SessionHandle : [int] Handle of the event tracing session to be configured. The [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracea) function returns this handle when a new trace is started. To obtain the handle of an existing trace, use [ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew) to query the trace properties based on the trace's name and then get the handle from the **Wnode.HistoricalContext** field of the returned `EVENT_TRACE_PROPERTIES` data.
InformationClass : [int] The information class to enable or disable. The information that the class captures is included in the extended data section of the event. For a list of information classes that you can enable, see the [TRACE_QUERY_INFO_CLASS](/windows/win32/api/evntrace/ne-evntrace-trace_query_info_class) enumeration.
TraceInformation : [intptr] A pointer to information class specific data. The information class determines the contents of this parameter.
InformationLength : [int] The size, in bytes, of the data in the _TraceInformation_ buffer.
%inst
Configures event tracing session settings.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is one of the following error codes.
- **ERROR_BAD_LENGTH** The program issued a command but the command
length is incorrect. This error is returned if the
_InformationLength_ parameter is less than a minimum size. -
**ERROR_INVALID_PARAMETER** The parameter is incorrect. -
**ERROR_NOT_SUPPORTED** The request is not supported. - **Other** Use
[FormatMessage](/windows/desktop/api/winbase/nf-winbase-formatmessage)
to obtain the message string for the returned error.

[備考]
Call this function after calling
[StartTrace](/windows/desktop/ETW/starttrace). If the
_InformationClass_ parameter is set to **TraceStackTracingInfo**,
calling this function enables stack tracing of the specified kernel
events. Subsequent calls to this function overwrites the previous
list of kernel events for which stack tracing is enabled. To disable
stack tracing, call this function with _InformationClass_ set to
**TraceStackTracingInfo** and _InformationLength_ set to 0. The
extended data section of the event will include the call stack. The
[StackWalk_Event](/windows/desktop/ETW/stackwalk-event) MOF class
defines the layout of the extended data. Typically, on 64-bit
computers, you cannot capture the kernel stack in certain contexts
when page faults are not allowed. To enable walking the kernel stack
on x64, set the `DisablePagingExecutive` Memory Management registry
value to 1. The `DisablePagingExecutive` registry value is located
under the following registry key:
`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session
Manager\Memory Management`. This should only be done for temporary
diagnosis purposes because it increases memory usage of the system.


%index
TreeResetNamedSecurityInfoW
Resets specified security information in the security descriptor of a specified tree of objects. (Unicode)
%group
Win32 advapi32
%prm
pObjectName, ObjectType, SecurityInfo, pOwner, pGroup, pDacl, pSacl, KeepExplicit, fnProgress, ProgressInvokeSetting, Args
pObjectName : [wstr] Pointer to a null-terminated string that specifies the name of the root node object for the objects  that are to receive updated security information. Supported objects are registry keys and file objects. For descriptions of the string formats for the different object types, see SE_OBJECT_TYPE.
ObjectType : [int] A value of the SE_OBJECT_TYPE  enumeration  that indicates the type of object named by the pObjectName parameter. The supported values are SE_REGISTRY_KEY and SE_FILE_OBJECT, for registry keys and file objects, respectively.
SecurityInfo : [int] A set of bit flags that indicate the type of security information to reset. This parameter can be a combination of the SECURITY_INFORMATION bit flags.
pOwner : [int] A pointer to a SID structure that identifies the owner of the object. The SID must be one that can be assigned as the owner SID of a security descriptor. The SecurityInfo parameter must include the OWNER_SECURITY_INFORMATION flag. To set the owner, the caller must have WRITE_OWNER access to each object, including the root object. If you are not setting the owner SID, this parameter can be NULL.
pGroup : [int] A pointer to a SID structure that identifies the primary group of the object. The SecurityInfo parameter must include the GROUP_SECURITY_INFORMATION flag.  To set the group, the caller must have WRITE_OWNER access to each object, including the root object. If you are not setting the primary group SID, this parameter can be NULL.
pDacl : [var] A pointer to an access control list (ACL) structure that represents the new DACL for the objects being reset. The SecurityInfo parameter must include the DACL_SECURITY_INFORMATION flag. The caller must have READ_CONTROL and WRITE_DAC access to each  object, including the root object. If you are not setting the DACL, this parameter can be NULL.
pSacl : [var] A pointer to an ACL structure that represents the new SACL for the objects being reset.  The SecurityInfo parameter must include any of the following flags: SACL_SECURITY_INFORMATION, LABEL_SECURITY_INFORMATION, ATTRIBUTE_SECURITY_INFORMATION, SCOPE_SECURITY_INFORMATION, or BACKUP_SECURITY_INFORMATION. If setting SACL_SECURITY_INFORMATION or SCOPE_SECURITY_INFORMATION, the caller must have the SE_SECURITY_NAME privilege enabled. If you are not setting the SACL, this parameter can be NULL.
KeepExplicit : [int] Boolean value that defines whether explicitly defined ACEs are kept or deleted for the sub-tree. If  KeepExplicit is TRUE, then explicitly defined ACEs are kept for each subtree DACL and SACL, and inherited ACEs are replaced by the inherited ACEs from pDacl and pSacl.  If  KeepExplicit is FALSE, then explicitly defined ACEs for each subtree DACL and SACL are deleted before the inherited ACEs are replaced by the inherited ACEs from pDacl and pSacl.
fnProgress : [int] A pointer to the function used to track the progress of the TreeResetNamedSecurityInfo function. The prototype of the progress function is:
ProgressInvokeSetting : [int] A value of the PROG_INVOKE_SETTING enumeration that specifies the initial setting for the progress function.
Args : [intptr] A pointer to a VOID for progress function arguments specified by the caller.
%inst
Resets specified security information in the security descriptor of a
specified tree of objects. (Unicode)

[戻り値]
If the function succeeds, the function returns ERROR_SUCCESS. If the
function fails, it returns an error code defined in WinError.h.

[備考]
Setting a NULL owner, group, DACL, or SACL is not supported by this
function. If the caller does not contain the proper privileges and
permissions to support the requested owner, group, DACL, and SACL
updates, then none of the updates are performed. This function is
similar to the TreeSetNamedSecurityInfo function:
This doc was truncated.


%index
TreeSetNamedSecurityInfoW
Sets specified security information in the security descriptor of a specified tree of objects. (Unicode)
%group
Win32 advapi32
%prm
pObjectName, ObjectType, SecurityInfo, pOwner, pGroup, pDacl, pSacl, dwAction, fnProgress, ProgressInvokeSetting, Args
pObjectName : [wstr] Pointer to a null-terminated string that specifies the name of the root node object for the objects  that are to receive updated security information. Supported objects are registry keys and file objects. For descriptions of the string formats for the different object types, see SE_OBJECT_TYPE.
ObjectType : [int] A value of the SE_OBJECT_TYPE  enumeration  that indicates the type of object named by the pObjectName parameter. The supported values are SE_REGISTRY_KEY and SE_FILE_OBJECT, for registry keys and file objects, respectively.
SecurityInfo : [int] A set of bit flags that indicate the type of security information to set. This parameter can be a combination of the SECURITY_INFORMATION bit flags.
pOwner : [int] A pointer to a SID structure that identifies the owner of the object. The SID must be one that can be assigned as the owner SID of a security descriptor. The SecurityInfo parameter must include the OWNER_SECURITY_INFORMATION flag. To set the owner, the caller must have WRITE_OWNER access to each object, including the root object. If you are not setting the owner SID, this parameter can be NULL.
pGroup : [int] A pointer to a SID structure that identifies the primary group of the object. The SecurityInfo parameter must include the GROUP_SECURITY_INFORMATION flag.  To set the group, the caller must have WRITE_OWNER access to each object, including the root object. If you are not setting the primary group SID, this parameter can be NULL.
pDacl : [var] A pointer to an access control list (ACL) structure that represents the new DACL for the objects being reset. The SecurityInfo parameter must include the DACL_SECURITY_INFORMATION flag. The caller must have READ_CONTROL and WRITE_DAC access to each  object, including the root object. If you are not setting the DACL, this parameter can be NULL.
pSacl : [var] A pointer to an ACL structure that represents the new SACL for the objects being reset. The SecurityInfo parameter must include any of the following flags: SACL_SECURITY_INFORMATION, LABEL_SECURITY_INFORMATION, ATTRIBUTE_SECURITY_INFORMATION, SCOPE_SECURITY_INFORMATION, or BACKUP_SECURITY_INFORMATION. If setting SACL_SECURITY_INFORMATION or SCOPE_SECURITY_INFORMATION, the caller must have the SE_SECURITY_NAME privilege enabled. If you are not setting the SACL, this parameter can be NULL.
dwAction : [int] 
fnProgress : [int] A pointer to the function used to track the progress of the TreeSetNamedSecurityInfo function. The prototype of the progress function is:
ProgressInvokeSetting : [int] A value of the PROG_INVOKE_SETTING enumeration that specifies the initial setting for the progress function.
Args : [intptr] A pointer to a VOID for progress function arguments specified by the caller.
%inst
Sets specified security information in the security descriptor of a
specified tree of objects. (Unicode)

[戻り値]
If the function succeeds, the function returns ERROR_SUCCESS. If the
function fails, it returns an error code defined in WinError.h.

[備考]
Setting a NULL owner, group, DACL, or SACL is not supported by this
function. If the caller does not contain the proper privileges and
permissions to support the requested owner, group, DACL, and SACL
updates, then none of the updates is performed. This function
provides the same functionality as the SetNamedSecurityInfo function
when the value of the dwAction parameter is set to TREE_SEC_INFO_SET,
the value of the ProgressInvokeSetting parameter is set to
ProgressInvokePrePostError, and the function pointed to by the
fnProgress parameter sets the value of its pInvokeSetting parameter
to ProgressInvokePrePostError. This function is similar to the
TreeResetNamedSecurityInfo function:
This doc was truncated.


%index
UninstallApplication
The UninstallApplication function uninstalls a group policy application that handles setup and installation using Windows Installer .msi files.
%group
Win32 advapi32
%prm
ProductCode, dwStatus
ProductCode : [wstr] The Windows Installer product code of the product being uninstalled. The product code of the application should be provided in the form of  a Windows Installer GUID as a string with braces.
dwStatus : [int] The status of the uninstall attempt. The dwStatus parameter is the Windows success code of the uninstall attempt returned by MsiConfigureProduct.  The system can use this to ensure that the  Resultant Set of Policy (RSoP) indicates whether the uninstall failed or succeeded.
%inst
The UninstallApplication function uninstalls a group policy
application that handles setup and installation using Windows
Installer .msi files.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS.
Otherwise, the function returns one of the system error codes. For a
complete list of error codes, see System Error Codes or the header
file WinError.h.

[備考]
Remove a group policy application that uses .msi files by calling the
Windows Installer function MsiConfigureProduct to uninstall the
application. Then call UninstallApplication to inform the system that
the application is no longer managed on the client by Group Policy.
UninstallApplication should be called even if the uninstall fails
because this enables the system to keep the Resultant Set of Policy
(RSoP) accurate. Remove applications installed using software
installation settings (.zap files) by calling the uninstall function
or command specific for the installation application. For information
about using installation applications other than the Windows
Installer see article 231747, "How to Publish non-MSI Programs with
.zap Files," in the Microsoft Knowledge Base.


%index
UnlockServiceDatabase
Unlocks a service control manager database by releasing the specified lock.
%group
Win32 advapi32
%prm
ScLock
ScLock : [intptr] The lock, which is obtained from a previous call to the LockServiceDatabase function.
%inst
Unlocks a service control manager database by releasing the specified
lock.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. The following error codes can be set
by the service control manager. Other error codes can be set by the
registry functions that are called by the service control manager.
This doc was truncated.


%index
UpdateTraceW
The UpdateTraceW (Unicode) function (evntrace.h) updates the property setting of the specified event tracing session.
%group
Win32 advapi32
%prm
TraceHandle, InstanceName, Properties
TraceHandle : [int] Handle to the event tracing session to be updated, or 0. You must specify a non-zero _TraceHandle_ if _InstanceName_ is **NULL**. This parameter will be used only if _InstanceName_ is **NULL**. The handle is returned by the [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracew).
InstanceName : [wstr] Name of the event tracing session to be updated, or **NULL**. You must specify _InstanceName_ if _TraceHandle_ is 0. To specify the NT Kernel Logger session, set _InstanceName_ to **KERNEL_LOGGER_NAME**.
Properties : [var] Pointer to an initialized [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) structure. On input, the members must specify the new values for the properties to update. For information on which properties you can update, see Remarks. On output, the structure members contains the updated settings and statistics for the event tracing session.
%inst
The UpdateTraceW (Unicode) function (evntrace.h) updates the property
setting of the specified event tracing session.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, the return value is one of the [system error
codes](/windows/win32/debug/system-error-codes). The following table
includes some common errors and their causes. - **ERROR_BAD_LENGTH**
The **BufferSize** member of the **Wnode** member of _Properties_
specifies an incorrect size. - **ERROR_INVALID_PARAMETER** One of the
following is true: - _Properties_ is **NULL**. - _InstanceName_ and
_TraceHandle_ are both **NULL**. - _InstanceName_ is **NULL** and
_TraceHandle_ is not a valid handle. - The **LogFileNameOffset**
member of _Properties_ is not valid. - The **LoggerNameOffset**
member of _Properties_ is not valid. **Windows Server 2003 and
Windows XP:** The **Guid** member of the **Wnode** structure is
SystemTraceControlGuid, but the _InstanceName_ parameter is not
KERNEL_LOGGER_NAME. - **ERROR_ACCESS_DENIED** Only users with
administrative privileges, users in the Performance Log Users group,
and services running as LocalSystem, LocalService, NetworkService can
control event tracing sessions. To grant a restricted user the
ability to control trace sessions, add them to the Performance Log
Users group. **Windows XP and Windows 2000:** Anyone can control a
trace session.

[備考]
Event trace controllers call this function. This function is
obsolete. Instead, use
[ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew)
with _ControlCode_ set to **EVENT_TRACE_CONTROL_UPDATE**. On input,
the members must specify the new values for the properties to update.
You can update the following properties. - **EnableFlags**: Set this
member to 0 to disable all kernel providers. Otherwise, you must
specify the kernel providers that you want to enable or keep enabled.
Applies only to system logger sessions. - **FlushTimer**: Set this
member if you want to change the time to wait before flushing
buffers. If this member is 0, the member is not updated. -
**LogFileNameOffset**: Set this member if you want to switch to
another log file. If this member is 0, the file name is not updated.
If the offset is not zero and you do not change the log file name,
the function returns an error. - **LogFileMode**: Set this member if
you want to turn **EVENT_TRACE_REAL_TIME_MODE** on and off. To turn
real time consuming off, set this member to 0. To turn real time
consuming on, set this member to **EVENT_TRACE_REAL_TIME_MODE** and
it will be OR'd with the current modes. - **MaximumBuffers**: Set set
this member if you want to change the maximum number of buffers that
ETW uses. If this member is 0, the member is not updated. For private
logger sessions, you can only update **LogFileNameOffset** and
**FlushTimer**. If you are using a newly initialized
[EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties)
structure, the only members you need to specify, other than the
members you are updating, are **Wnode.BufferSize**, **Wnode.Guid**,
and **Wnode.Flags**. If you use the property structure you passed to
[StartTrace](/windows/desktop/ETW/starttrace), make sure the
**LogFileNameOffset** member is 0 unless you are changing the log
file name. If you call the
[ControlTrace](/windows/desktop/ETW/controltrace) function to query
the current session properties and then update those properties to
update the session, make sure you set **LogFileNameOffset** to 0
(unless you are changing the log file name) and set
[EVENT_TRACE_PROPERTIES.Wnode.Flags](/windows/desktop/ETW/event-trace-properties)
to **WNODE_FLAG_TRACED_GUID**. To obtain the property settings and
session statistics for an event tracing session, call the
[ControlTrace](/windows/desktop/ETW/controltrace) function.


%index
WaitServiceState
(no summary)
%group
Win32 advapi32
%prm
hService, dwNotify, dwTimeout, hCancelEvent
hService : [intptr] 
dwNotify : [int] 
dwTimeout : [int] 
hCancelEvent : [intptr] 
%inst



%index
WriteEncryptedFileRaw
Restores (import) encrypted files.
%group
Win32 advapi32
%prm
pfImportCallback, pvCallbackContext, pvContext
pfImportCallback : [int] A pointer to the import callback function. The system calls the callback function multiple times, each time passing a buffer that will be filled by the callback function with a portion of backed-up file's data. When the callback function signals that the entire file has been processed, it tells the system that the restore operation is finished. For more information, see ImportCallback.
pvCallbackContext : [intptr] A pointer to an application-defined and allocated context block. The system passes this pointer to the callback function as a parameter so that the callback function can have access to application-specific data. This can be a structure and can contain any data the application needs, such as the handle to the file that will contain the backup copy of the encrypted file.
pvContext : [intptr] A pointer to a system-defined context block. The context block is returned by the OpenEncryptedFileRaw function. Do not modify it.
%inst
Restores (import) encrypted files.

[戻り値]
If the function succeeds, the return value is ERROR_SUCCESS. If the
function fails, it returns a nonzero error code defined in
WinError.h. You can use FormatMessage with the
FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic text description of
the error.

[備考]
The file being restored is not decrypted; it is restored in its
encrypted state. To back up an encrypted file, call
OpenEncryptedFileRaw to open the file. Then call
ReadEncryptedFileRaw, passing it the address of an
application-defined export callback function. The system calls this
callback function multiple times until the entire file's contents
have been read and backed up. When the backup is complete, call
CloseEncryptedFileRaw to free resources and close the file. See
ExportCallback for details about how to declare the export callback
function. To restore an encrypted file, call OpenEncryptedFileRaw,
specifying CREATE_FOR_IMPORT in the ulFlags parameter. Then call
WriteEncryptedFileRaw, passing it the address of an
application-defined import callback function. The system calls this
callback function multiple times until the entire file's contents
have been read and restored. When the restore is complete, call
CloseEncryptedFileRaw to free resources and close the file. See
ImportCallback for details about how to declare the export callback
function. If the file is a sparse file that was backed up from a
volume with a smaller sparse allocation unit size than the volume it
is being restored to, the sparse blocks in the middle of the file may
not properly align with the larger blocks and the function call would
fail and set an ERROR_INVALID_PARAMETER last error code. The sparse
allocation unit size is either 16 clusters or 64 KB, whichever is
smaller. This function is intended for restoring only encrypted
files; see BackupWrite for restoring unencrypted files. In Windows 8,
Windows Server 2012, and later, this function is supported by the
following technologies.
This doc was truncated.

