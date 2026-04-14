; ============================================================
;   wtsapi32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
WTSCloseServer
Closes an open handle to a Remote Desktop Session Host (RD?Session Host) server.
%group
Win32 wtsapi32
%prm
hServer
hServer : [intptr] A handle to an RD?Session Host server opened by a call to the WTSOpenServer or WTSOpenServerEx function. Do not pass WTS_CURRENT_SERVER_HANDLE for this parameter.
%inst
Closes an open handle to a Remote Desktop Session Host (RD Session
Host) server.

[備考]
Call the WTSCloseServer function as part of your program's clean-up
routine to close all the server handles opened by calls to the
WTSOpenServer or WTSOpenServerEx function. After the handle has been
closed, it cannot be used with any other WTS APIs.


%index
WTSConnectSessionW
Connects a Remote Desktop Services session to an existing session on the local computer. (Unicode)
%group
Win32 wtsapi32
%prm
LogonId, TargetLogonId, pPassword, bWait
LogonId : [int] The logon ID of the session to connect to. The user of that session must have permissions to connect to an existing session. The output of this session will be routed to the session identified by the TargetLogonId parameter. This can be LOGONID_CURRENT to use the current session.
TargetLogonId : [int] The logon ID of the session to receive the output of the session represented by the LogonId parameter. The output of the session identified by the LogonId parameter will be routed to this session. This can be LOGONID_CURRENT to use the current session.
pPassword : [wstr] A pointer to the password for the user account that is specified in the LogonId parameter. The value of pPassword can be an empty string if the caller is logged on using the same domain name and user name as the logon ID. The value of pPassword cannot be NULL.
bWait : [int] Indicates whether the operation is synchronous. Specify TRUE to wait for the operation to complete, or FALSE to return immediately.
%inst
Connects a Remote Desktop Services session to an existing session on
the local computer. (Unicode)

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Either the LogonId or TargetLogonId parameter can be LOGONID_CURRENT,
but not both.
> [!NOTE] > The wtsapi32.h header defines WTSConnectSession as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
WTSCreateListenerW
Creates a new Remote Desktop Services listener or configures an existing listener. (Unicode)
%group
Win32 wtsapi32
%prm
hServer, pReserved, Reserved, pListenerName, pBuffer, flag
hServer : [intptr] A handle to an RD?Session Host server. Always set this  parameter to WTS_CURRENT_SERVER_HANDLE.
pReserved : [intptr] This parameter is reserved. Always set this parameter to NULL.
Reserved : [int] This parameter is reserved. Always set this parameter to zero.
pListenerName : [wstr] A pointer to a null-terminated string that contains the name of the listener to create or configure.
pBuffer : [var] A pointer to a WTSLISTENERCONFIG structure that contains configuration information for the listener.
flag : [int] 
%inst
Creates a new Remote Desktop Services listener or configures an
existing listener. (Unicode)

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call the GetLastError function.

[備考]
This function creates or configures a listener that uses Remote
Desktop Protocol (RDP). Always set the version member of the
WTSLISTENERCONFIG structure that is pointed to by the pBuffer
parameter to one. This function does not create or configure the
security descriptor of the listener. When you call this function to
create a new listener, the function assigns the default security
descriptor to the new listener. To modify the security descriptor,
call the WTSSetListenerSecurity function. For more information about
security descriptors, see SECURITY_DESCRIPTOR. This function does not
validate the settings for the new listener. Be sure that the settings
are valid before calling this function.
> [!NOTE] > The wtsapi32.h header defines WTSCreateListener as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
WTSDisconnectSession
Disconnects the logged-on user from the specified Remote Desktop Services session without closing the session.
%group
Win32 wtsapi32
%prm
hServer, SessionId, bWait
hServer : [intptr] A handle to an RD?Session Host server. Specify a handle opened by the WTSOpenServer or WTSOpenServerEx function, or specify WTS_CURRENT_SERVER_HANDLE to indicate the RD?Session Host server on which your application is running.
SessionId : [int] A Remote Desktop Services session identifier. To indicate the current session, specify WTS_CURRENT_SESSION. To retrieve the identifiers of all sessions on a specified RD?Session Host server, use the WTSEnumerateSessions function. To be able to disconnect another user's session, you need to have the Disconnect permission. For more information, see Remote Desktop Services Permissions. To modify permissions on a session, use the Remote Desktop Services Configuration administrative tool. To disconnect sessions running on a virtual machine hosted on a RD?Virtualization Host server, you must be a member of the Administrators group on the RD?Virtualization Host server.
bWait : [int] Indicates whether the operation is synchronous. Specify TRUE to wait for the operation to complete, or FALSE to return immediately.
%inst
Disconnects the logged-on user from the specified Remote Desktop
Services session without closing the session.

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
WTSEnableChildSessions
Enables or disables Child Sessions.
%group
Win32 wtsapi32
%prm
bEnable
bEnable : [int] Indicates whether to enable or disable child sessions. Pass TRUE if child sessions are to be enabled or FALSE otherwise.
%inst
Enables or disables Child Sessions.

[戻り値]
Returns nonzero if the function succeeds or zero otherwise.

[備考]
For more information about child sessions, see Child Sessions.


%index
WTSEnumerateListenersW
Enumerates all the Remote Desktop Services listeners on a Remote Desktop Session Host (RD?Session Host) server. (Unicode)
%group
Win32 wtsapi32
%prm
hServer, pReserved, Reserved, pListeners, pCount
hServer : [intptr] A handle to an RD?Session Host server. Always set this  parameter to WTS_CURRENT_SERVER_HANDLE.
pReserved : [intptr] This parameter is reserved. Always set this parameter to NULL.
Reserved : [int] This parameter is reserved. Always set this parameter to zero.
pListeners : [var] A pointer to an array of WTSLISTENERNAME variables that receive the names of the listeners.
pCount : [var] A pointer to a DWORD variable that contains the number of listener names in the array referenced by the pListeners parameter. If the number of listener names is unknown, pass pListeners as NULL. The function will return the number of  WTSLISTENERNAME variables necessary to allocate for the array pointed to by the pListeners parameter.
%inst
Enumerates all the Remote Desktop Services listeners on a Remote
Desktop Session Host (RD Session Host) server. (Unicode)

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
This function returns all listeners currently running on the server,
including listeners that do not support Remote Desktop Protocol
(RDP). If the number of listeners is unknown, you can call this
function with pListeners set to NULL. The function will then return,
in the pCount parameter, the number of WTSLISTENERNAME variables
necessary to receive all the listeners. Allocate the array for
pListeners based on this number, and then call the function again,
setting pListeners to the newly allocated array and pCount to the
number returned by the first call.
> [!NOTE] > The wtsapi32.h header defines WTSEnumerateListeners as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
WTSEnumerateProcessesW
Retrieves information about the active processes on a specified Remote Desktop Session Host (RD?Session Host) server. (Unicode)
%group
Win32 wtsapi32
%prm
hServer, Reserved, Version, ppProcessInfo, pCount
hServer : [intptr] Handle to an RD?Session Host server. Specify a handle opened by the WTSOpenServer function, or specify WTS_CURRENT_SERVER_HANDLE to indicate the RD?Session Host server on which your application is running.
Reserved : [int] Reserved; must be zero.
Version : [int] Specifies the version of the enumeration request. Must be 1.
ppProcessInfo : [var] Pointer to a variable that receives a pointer to an array of WTS_PROCESS_INFO structures. Each structure in the array contains information about an active process on the specified RD?Session Host server. To free the returned buffer, call the WTSFreeMemory function.
pCount : [var] Pointer to a variable that receives the number of WTS_PROCESS_INFO structures returned in the ppProcessInfo buffer.
%inst
Retrieves information about the active processes on a specified
Remote Desktop Session Host (RD Session Host) server. (Unicode)

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The caller must be a member of the Administrators group to enumerate
processes that are running under a different user's context.
> [!NOTE] > The wtsapi32.h header defines WTSEnumerateProcesses as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
WTSEnumerateProcessesExW
Retrieves information about the active processes on the specified Remote Desktop Session Host (RD?Session Host) server or Remote Desktop Virtualization Host (RD?Virtualization Host) server. (Unicode)
%group
Win32 wtsapi32
%prm
hServer, pLevel, SessionId, ppProcessInfo, pCount
hServer : [intptr] A handle to an RD?Session Host server. Specify a handle opened by the WTSOpenServer function, or specify WTS_CURRENT_SERVER_HANDLE to indicate the server on which your application is running.
pLevel : [var] A pointer to a DWORD variable that, on input, specifies the type of information  to return. To return an array of WTS_PROCESS_INFO structures, specify zero. To return an array of WTS_PROCESS_INFO_EX structures, specify one. If you do not specify a valid value for this parameter, on output, WTSEnumerateProcessesEx sets this parameter to one and returns an error. Otherwise, on output, WTSEnumerateProcessesEx does not change the value of this parameter.
SessionId : [int] The session  for which to enumerate processes. To enumerate processes for all sessions on the server,  specify WTS_ANY_SESSION.
ppProcessInfo : [var] A pointer to a variable that receives a pointer to an array of WTS_PROCESS_INFO or WTS_PROCESS_INFO_EX structures. The type of structure is determined by the value passed to the pLevel parameter. Each structure in the array contains information about an active process. When you have finished using the array, free it by calling the WTSFreeMemoryEx function. You should also set the pointer to NULL.
pCount : [var] A pointer to a variable that receives the number of structures returned in the buffer referenced by the ppProcessInfo parameter.
%inst
Retrieves information about the active processes on the specified
Remote Desktop Session Host (RD Session Host) server or Remote
Desktop Virtualization Host (RD Virtualization Host) server.
(Unicode)

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call the GetLastError function.

[備考]
The caller must be a member of the Administrators group to enumerate
processes that are running under another user session.
> [!NOTE] > The wtsapi32.h header defines WTSEnumerateProcessesEx as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
WTSEnumerateServersW
Returns a list of all Remote Desktop Session Host (RD?Session Host) servers within the specified domain. (Unicode)
%group
Win32 wtsapi32
%prm
pDomainName, Reserved, Version, ppServerInfo, pCount
pDomainName : [wstr] Pointer to the name of the domain to be queried. If the value of this parameter is NULL, the specified domain is the current domain.
Reserved : [int] Reserved. The value of this parameter must be 0.
Version : [int] Version of the enumeration request. The value of the parameter must be 1.
ppServerInfo : [var] Points to an array of WTS_SERVER_INFO structures, which contains the returned results of the enumeration. After use, the memory used by this buffer should be freed by calling WTSFreeMemory.
pCount : [var] Pointer to a variable that receives the number of WTS_SERVER_INFO structures returned in the ppServerInfo buffer.
%inst
Returns a list of all Remote Desktop Session Host (RD Session Host)
servers within the specified domain. (Unicode)

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
This function will not work if NetBT is disabled.
> [!NOTE] > The wtsapi32.h header defines WTSEnumerateServers as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
WTSEnumerateSessionsW
Retrieves a list of sessions on a Remote Desktop Session Host (RD?Session Host) server. (Unicode)
%group
Win32 wtsapi32
%prm
hServer, Reserved, Version, ppSessionInfo, pCount
hServer : [intptr] A handle to the RD?Session Host server. Note??You can use the WTSOpenServer or WTSOpenServerEx functions to retrieve a handle to a specific server, or  WTS_CURRENT_SERVER_HANDLE to use the RD?Session Host server that hosts your application.
Reserved : [int] This parameter is reserved. It must be zero.
Version : [int] The version of the enumeration request. This parameter must be 1.
ppSessionInfo : [var] A pointer to an array of WTS_SESSION_INFO structures that represent the retrieved sessions. To free the returned buffer, call the WTSFreeMemory function.
pCount : [var] A pointer to the number of WTS_SESSION_INFO structures returned in the ppSessionInfo parameter.
%inst
Retrieves a list of sessions on a Remote Desktop Session Host (RD
Session Host) server. (Unicode)

[戻り値]
Returns zero if this function fails. If this function succeeds, a
nonzero value is returned. To get extended error information, call
GetLastError.

[備考]
> [!NOTE] > The wtsapi32.h header defines WTSEnumerateSessions as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
WTSEnumerateSessionsExW
Retrieves a list of sessions on a specified Remote Desktop Session Host (RD?Session Host) server or Remote Desktop Virtualization Host (RD?Virtualization Host) server. (Unicode)
%group
Win32 wtsapi32
%prm
hServer, pLevel, Filter, ppSessionInfo, pCount
hServer : [intptr] A handle to the target server. Specify a handle returned by the WTSOpenServer or WTSOpenServerEx function. To enumerate sessions on  the RD?Session Host server on which the application is running, specify WTS_CURRENT_SERVER_HANDLE.
pLevel : [var] This parameter is reserved. Always set this parameter to one. On output, WTSEnumerateSessionsEx does not change the value of this parameter.
Filter : [int] This parameter is reserved. Always set this parameter to zero.
ppSessionInfo : [var] A pointer to a PWTS_SESSION_INFO_1 variable that receives a pointer to an array of WTS_SESSION_INFO_1 structures. Each structure in the array contains information about a session on the specified RD?Session Host server. If you obtained a handle to an RD?Virtualization Host server by calling the WTSOpenServerEx function, the array contains information about sessions on virtual machines on the server. When you have finished using the array, free it by calling the WTSFreeMemoryEx function. You should also set the pointer to NULL.
pCount : [var] A pointer to a DWORD variable that receives the number of WTS_SESSION_INFO_1 structures returned in the ppSessionInfo buffer.
%inst
Retrieves a list of sessions on a specified Remote Desktop Session
Host (RD Session Host) server or Remote Desktop Virtualization Host
(RD Virtualization Host) server. (Unicode)

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call the GetLastError function.

[備考]
To obtain information about sessions running on virtual machines on
an RD Virtualization Host server, you must obtain the handle by
calling the WTSOpenServerEx function. To free the returned buffer,
call the WTSFreeMemoryEx function and set the WTSClassType parameter
to WTSTypeSessionInfoLevel1. To enumerate a session, you need to have
the Query Information permission for that session. For more
information, see Remote Desktop Services Permissions. To modify
permissions on a session, use the Remote Desktop Services
Configuration administrative tool. To enumerate sessions running on a
virtual machine hosted on an RD Virtualization Host server, you must
be a member of the Administrators group on the RD Virtualization Host
server.
> [!NOTE] > The wtsapi32.h header defines WTSEnumerateSessionsEx as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
WTSFreeMemory
Frees memory allocated by a Remote Desktop Services function.
%group
Win32 wtsapi32
%prm
pMemory
pMemory : [intptr] Pointer to the memory to free.
%inst
Frees memory allocated by a Remote Desktop Services function.

[備考]
Several Remote Desktop Services functions allocate buffers to return
information. Use the WTSFreeMemory function to free these buffers.


%index
WTSFreeMemoryExW
Frees memory that contains WTS_PROCESS_INFO_EX or WTS_SESSION_INFO_1 structures allocated by a Remote Desktop Services function. (Unicode)
%group
Win32 wtsapi32
%prm
WTSTypeClass, pMemory, NumberOfEntries
WTSTypeClass : [int] A value of the WTS_TYPE_CLASS enumeration type that specifies the type of structures contained in the buffer referenced by the pMemory parameter.
pMemory : [intptr] A pointer to the buffer to free.
NumberOfEntries : [int] The number of elements in the buffer referenced by the pMemory parameter.
%inst
Frees memory that contains WTS_PROCESS_INFO_EX or WTS_SESSION_INFO_1
structures allocated by a Remote Desktop Services function. (Unicode)

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call the GetLastError function.

[備考]
Several Remote Desktop Services functions allocate buffers to return
information. To free buffers that contain WTS_PROCESS_INFO_EX or
WTS_SESSION_INFO_1 structures, you must call the WTSFreeMemoryEx
function. To free other buffers, you can call either the
WTSFreeMemory function or the WTSFreeMemoryEx function.
> [!NOTE] > The wtsapi32.h header defines WTSFreeMemoryEx as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
WTSGetChildSessionId
Retrieves the child session identifier, if present.
%group
Win32 wtsapi32
%prm
pSessionId
pSessionId : [var] The address of a ULONG variable that receives the child session identifier. This will be (ULONG)?1 if there is no child session for the current session.
%inst
Retrieves the child session identifier, if present.

[戻り値]
Returns nonzero if the function succeeds or zero otherwise.

[備考]
For more information about child sessions, see Child Sessions.


%index
WTSGetListenerSecurityW
Retrieves the security descriptor of a Remote Desktop Services listener. (Unicode)
%group
Win32 wtsapi32
%prm
hServer, pReserved, Reserved, pListenerName, SecurityInformation, pSecurityDescriptor, nLength, lpnLengthNeeded
hServer : [intptr] A handle to an RD?Session Host server. Always set this  parameter to WTS_CURRENT_SERVER_HANDLE.
pReserved : [intptr] This parameter is reserved. Always set this parameter to NULL.
Reserved : [int] This parameter is reserved. Always set this parameter to zero.
pListenerName : [wstr] A pointer to a null-terminated string that contains the name of the listener.
SecurityInformation : [int] A SECURITY_INFORMATION value that specifies the security information  to retrieve. Always enable the  DACL_SECURITY_INFORMATION and SACL_SECURITY_INFORMATION flags. For more information about possible values, see SECURITY_INFORMATION.
pSecurityDescriptor : [int] A pointer to a SECURITY_DESCRIPTOR structure that receives the security information associated with  the listener referenced by the pListenerName parameter. The SECURITY_DESCRIPTOR structure is returned in self-relative format. For more information about possible values, see SECURITY_DESCRIPTOR.
nLength : [int] The size, in bytes, of the SECURITY_DESCRIPTOR structure referenced by the pSecurityDescriptor parameter.
lpnLengthNeeded : [var] A pointer to a variable that receives the number of bytes required to store the complete security descriptor. If this number is less than or equal to the value of the nLength parameter, the security descriptor is copied to the SECURITY_DESCRIPTOR structure referenced by the pSecurityDescriptor parameter; otherwise, no action is taken.
%inst
Retrieves the security descriptor of a Remote Desktop Services
listener. (Unicode)

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call the GetLastError function.

[備考]
If the number of bytes needed for the buffer that receives the
SECURITY_DESCRIPTOR structure is unknown, you can call this method
with nLength set to zero. The method will then return, in the
lpnLengthNeeded parameter, the number of bytes required for the
buffer. Allocate the buffer based on this number, and then call the
method again, setting pSecurityDescriptor to the newly allocated
buffer and nLength to the number returned by the first call.
> [!NOTE] > The wtsapi32.h header defines WTSGetListenerSecurity as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
WTSIsChildSessionsEnabled
Determines whether child sessions are enabled.
%group
Win32 wtsapi32
%prm
pbEnabled
pbEnabled : [var] The address of a BOOL variable that receives a nonzero value if child sessions are enabled or zero otherwise.
%inst
Determines whether child sessions are enabled.

[戻り値]
Returns nonzero if the function succeeds or zero otherwise.

[備考]
For more information about child sessions, see Child Sessions.


%index
WTSLogoffSession
Logs off a specified Remote Desktop Services session.
%group
Win32 wtsapi32
%prm
hServer, SessionId, bWait
hServer : [intptr] A handle to an RD?Session Host server. Specify a handle opened by the WTSOpenServer or WTSOpenServerEx function, or specify WTS_CURRENT_SERVER_HANDLE to indicate the RD?Session Host server on which your application is running.
SessionId : [int] A Remote Desktop Services session identifier. To indicate the current session, specify WTS_CURRENT_SESSION. You can use the WTSEnumerateSessions function to retrieve the identifiers of all sessions on a specified RD?Session Host server. To be able to log off another user's session, you need to have the Reset permission. For more information, see Remote Desktop Services Permissions. To modify permissions on a session, use the Remote Desktop Services Configuration administrative tool. To log off sessions running on a virtual machine hosted on a RD?Virtualization Host server, you must be a member of the Administrators group on the RD?Virtualization Host server.
bWait : [int] Indicates whether the operation is synchronous. If bWait is TRUE, the function returns when the session is logged off. If bWait is FALSE, the function returns immediately. To verify that the session has been logged off, specify the session identifier in a call to the WTSQuerySessionInformation function. WTSQuerySessionInformation returns zero if the session is logged off.
%inst
Logs off a specified Remote Desktop Services session.

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
WTSOpenServerW
Opens a handle to the specified Remote Desktop Session Host (RD?Session Host) server. (Unicode)
%group
Win32 wtsapi32
%prm
pServerName
pServerName : [wstr] Pointer to a null-terminated string specifying the NetBIOS name of the RD?Session Host server.
%inst
Opens a handle to the specified Remote Desktop Session Host (RD
Session Host) server. (Unicode)

[戻り値]
If the function succeeds, the return value is a handle to the
specified server. If the function fails, it returns a handle that is
not valid. You can test the validity of the handle by using it in
another function call.

[備考]
When you have finished using the handle returned by WTSOpenServer,
release it by calling the WTSCloseServer function. You do not need to
open a handle for operations performed on the RD Session Host server
on which your application is running. Use the constant
WTS_CURRENT_SERVER_HANDLE instead.
> [!NOTE] > The wtsapi32.h header defines WTSOpenServer as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
WTSOpenServerExW
Opens a handle to the specified Remote Desktop Session Host (RD?Session Host) server or Remote Desktop Virtualization Host (RD?Virtualization Host) server. (Unicode)
%group
Win32 wtsapi32
%prm
pServerName
pServerName : [wstr] A pointer to a null-terminated string that contains the NetBIOS name of the server.
%inst
Opens a handle to the specified Remote Desktop Session Host (RD
Session Host) server or Remote Desktop Virtualization Host (RD
Virtualization Host) server. (Unicode)

[戻り値]
If the function succeeds, the return value is a handle to the
specified server. If the function fails, it returns an invalid
handle. You can test the validity of the handle by using it in
another function call.

[備考]
If the server specified by the pServerName parameter is an RD Session
Host server, the behavior of this function is identical to that of
the WTSOpenServer function. To work with sessions running on virtual
machines on the RD Virtualization Host server on which the calling
application is running, specify WTS_CURRENT_SERVER_NAME for the
pServerName parameter. When you have finished using the handle
returned by this function, release it by calling the WTSCloseServer
function.
> [!NOTE] > The wtsapi32.h header defines WTSOpenServerEx as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
WTSQueryListenerConfigW
Retrieves configuration information for a Remote Desktop Services listener. (Unicode)
%group
Win32 wtsapi32
%prm
hServer, pReserved, Reserved, pListenerName, pBuffer
hServer : [intptr] A handle to an RD?Session Host server. Always set this  parameter to WTS_CURRENT_SERVER_HANDLE.
pReserved : [intptr] This parameter is reserved. Always set this parameter to NULL.
Reserved : [int] This parameter is reserved. Always set this parameter to zero.
pListenerName : [wstr] A pointer to a null-terminated string that contains the name of the listener to query.
pBuffer : [var] A pointer to a WTSLISTENERCONFIG structure that receives the  retrieved listener configuration information.
%inst
Retrieves configuration information for a Remote Desktop Services
listener. (Unicode)

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call the GetLastError function.

[備考]
This function does not retrieve the security descriptor for the
listener. To retrieve the security descriptor, call the
WTSGetListenerSecurity function.
> [!NOTE] > The wtsapi32.h header defines WTSQueryListenerConfig as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
WTSQuerySessionInformationW
Retrieves session information for the specified session on the specified Remote Desktop Session Host (RD?Session Host) server. (Unicode)
%group
Win32 wtsapi32
%prm
hServer, SessionId, WTSInfoClass, ppBuffer, pBytesReturned
hServer : [intptr] A handle to an RD?Session Host server. Specify a handle opened by the WTSOpenServer function, or specify WTS_CURRENT_SERVER_HANDLE to indicate the RD?Session Host server on which your application is running.
SessionId : [int] A Remote Desktop Services session identifier. To indicate the session in which the calling application is running (or the current session) specify WTS_CURRENT_SESSION. Only specify WTS_CURRENT_SESSION when obtaining session information on the local server. If WTS_CURRENT_SESSION is specified when querying session information on a remote server, the returned session information will be inconsistent. Do not use the returned data. You can use the WTSEnumerateSessions function to retrieve the identifiers of all sessions on a specified RD?Session Host server. To query information for another user's session, you must have Query Information permission. For more information, see Remote Desktop Services Permissions. To modify permissions on a session, use the Remote Desktop Services Configuration administrative tool.
WTSInfoClass : [int] A value of the WTS_INFO_CLASS enumeration that indicates the type of session information to retrieve in a call to the WTSQuerySessionInformation function.
ppBuffer : [var] A pointer to a variable that receives a pointer to the requested information. The format and contents of the data depend on the information class specified in the WTSInfoClass parameter. To free the returned buffer, call the WTSFreeMemory function.
pBytesReturned : [var] A pointer to a variable that receives the size, in bytes, of the data returned in ppBuffer.
%inst
Retrieves session information for the specified session on the
specified Remote Desktop Session Host (RD Session Host) server.
(Unicode)

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
To retrieve the session ID for the current session when Remote
Desktop Services is running, call WTSQuerySessionInformation and
specify WTS_CURRENT_SESSION for the SessionId parameter and
WTSSessionId for the WTSInfoClass parameter. The session ID will be
returned in the ppBuffer parameter. If Remote Desktop Services is not
running, calls to WTSQuerySessionInformation fail. In this situation,
you can retrieve the current session ID by calling the
ProcessIdToSessionId function. To determine whether your application
is running on the physical console, you must specify
WTS_CURRENT_SESSION for the SessionId parameter, and
WTSClientProtocolType as the WTSInfoClass parameter. If ppBuffer is
"0", the session is attached to the physical console.
> [!NOTE] > The wtsapi32.h header defines WTSQuerySessionInformation
as an alias which automatically selects the ANSI or Unicode version
of this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
WTSQueryUserConfigW
Retrieves configuration information for the specified user on the specified domain controller or Remote Desktop Session Host (RD?Session Host) server. (Unicode)
%group
Win32 wtsapi32
%prm
pServerName, pUserName, WTSConfigClass, ppBuffer, pBytesReturned
pServerName : [wstr] Pointer to a null-terminated string containing the name of a domain controller or an RD?Session Host server. Specify WTS_CURRENT_SERVER_NAME to indicate the RD?Session Host server on which your application is running.
pUserName : [wstr] Pointer to a null-terminated string containing the user name to query. To retrieve the default user settings for the RD?Session Host server, set this parameter to NULL. Windows Server?2008 and Windows?Vista:??Setting this parameter to NULL returns an error.
WTSConfigClass : [int] Specifies the type of information to retrieve. This parameter can be one of the values from the WTS_CONFIG_CLASS enumeration type. The documentation for WTS_CONFIG_CLASS describes the format of the data returned in ppBuffer for each of the information types.
ppBuffer : [var] Pointer to a variable that receives a pointer to the requested information. The format and contents of the data depend on the information class specified in the WTSConfigClass parameter. To free the returned buffer, call the WTSFreeMemory function.
pBytesReturned : [var] Pointer to a variable that receives the size, in bytes, of the data returned in ppBuffer.
%inst
Retrieves configuration information for the specified user on the
specified domain controller or Remote Desktop Session Host (RD
Session Host) server. (Unicode)

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The WTSQueryUserConfig and WTSSetUserConfig functions are passed a
server name instead of a handle because user account information
often resides on a domain controller. To set user configuration
information, use the primary domain controller. You can call the
NetGetDCName function to get the name of the primary domain
controller. To query user configuration information, you can use the
NetGetAnyDCName function to get the name of a primary or backup
domain controller. Any domain controller can set or query user
configuration information. Use the DsGetDcName function to retrieve
the name of a domain controller.
> [!NOTE] > The wtsapi32.h header defines WTSQueryUserConfig as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
WTSQueryUserToken
Obtains the primary access token of the logged-on user specified by the session ID.
%group
Win32 wtsapi32
%prm
SessionId, phToken
SessionId : [int] A Remote Desktop Services session identifier. Any program running in the context of a service will have a session identifier of zero (0). You can use the WTSEnumerateSessions function to retrieve the identifiers of all sessions on a specified RD?Session Host server. To be able to query information for another user's session, you need to have the Query Information permission. For more information, see Remote Desktop Services Permissions. To modify permissions on a session, use the Remote Desktop Services Configuration administrative tool.
phToken : [intptr] If the function succeeds, receives a pointer to the token handle for the logged-on user. Note that you must call the CloseHandle function to close this handle.
%inst
Obtains the primary access token of the logged-on user specified by
the session ID.

[戻り値]
If the function succeeds, the return value is a nonzero value, and
the phToken parameter points to the primary token of the user. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
For information about primary tokens, see Access Tokens. For more
information about account privileges, see Remote Desktop Services
Permissions and Authorization Constants. See LocalSystem account for
information about the privileges associated with that account.


%index
WTSRegisterSessionNotification
Registers the specified window to receive session change notifications. (WTSRegisterSessionNotification)
%group
Win32 wtsapi32
%prm
hWnd, dwFlags
hWnd : [intptr] Handle of the window to receive session change notifications.
dwFlags : [int] Specifies which session notifications are to be received. This parameter can be one of the following values.
%inst
Registers the specified window to receive session change
notifications. (WTSRegisterSessionNotification)

[戻り値]
If the function succeeds, the return value is TRUE. Otherwise, it is
FALSE. To get extended error information, call GetLastError.

[備考]
If this function is called before the dependent services of Remote
Desktop Services have started, an RPC_S_INVALID_BINDING error code
may be returned. When the Global\\TermSrvReadyEvent global event is
set, all dependent services have started and this function can be
successfully called. Session change notifications are sent in the
form of a WM_WTSSESSION_CHANGE message. These notifications are sent
only to the windows that have registered for them using this
function. When a window no longer requires these notifications, it
must call WTSUnRegisterSessionNotification before being destroyed.
For every call to this function, there must be a corresponding call
to WTSUnRegisterSessionNotification. If the window handle passed in
this function is already registered, the value of the dwFlags
parameter is ignored. To receive session change notifications from a
service, use the HandlerEx function.


%index
WTSRegisterSessionNotificationEx
Registers the specified window to receive session change notifications. (WTSRegisterSessionNotificationEx)
%group
Win32 wtsapi32
%prm
hServer, hWnd, dwFlags
hServer : [intptr] Handle of the server returned from WTSOpenServer or WTS_CURRENT_SERVER.
hWnd : [intptr] Handle of the window to receive session change notifications.
dwFlags : [int] Specifies which session notifications are to be received. This parameter can only be NOTIFY_FOR_THIS_SESSION if hServer is a remote server.
%inst
Registers the specified window to receive session change
notifications. (WTSRegisterSessionNotificationEx)

[戻り値]
If the function succeeds, the return value is TRUE. Otherwise, it is
FALSE. To get extended error information, call GetLastError.

[備考]
If this function is called before the dependent services of Remote
Desktop Services have started, an RPC_S_INVALID_BINDING error code
may be returned. When the "Global\\TermSrvReadyEvent" global event is
set, all dependent services have started and this function can be
successfully called. Session change notifications are sent in the
form of a WM_WTSSESSION_CHANGE message. These notifications are sent
only to the windows that have registered for them using this
function. When a window no longer requires these notifications, it
must call WTSUnRegisterSessionNotificationEx before being destroyed.
For every call to this function, there must be a corresponding call
to WTSUnRegisterSessionNotificationEx. If the window handle passed in
this function is already registered, the value of the dwFlags
parameter is ignored. To receive session change notifications from a
service, use the HandlerEx function.


%index
WTSSendMessageW
Displays a message box on the client desktop of a specified Remote Desktop Services session. (Unicode)
%group
Win32 wtsapi32
%prm
hServer, SessionId, pTitle, TitleLength, pMessage, MessageLength, Style, Timeout, pResponse, bWait
hServer : [intptr] A handle to an RD?Session Host server. Specify a handle opened by the WTSOpenServer function, or specify WTS_CURRENT_SERVER_HANDLE to indicate the RD?Session Host server on which your application is running.
SessionId : [int] A Remote Desktop Services session identifier. To indicate the current session, specify WTS_CURRENT_SESSION. You can use the WTSEnumerateSessions function to retrieve the identifiers of all sessions on a specified RD?Session Host server. To send a message to another user's session, you need to have the Message permission. For more information, see Remote Desktop Services Permissions. To modify permissions on a session, use the Remote Desktop Services Configuration administrative tool.
pTitle : [wstr] A pointer to a null-terminated string for the title bar of the message box.
TitleLength : [int] The length, in bytes, of the title bar string.
pMessage : [wstr] A pointer to a null-terminated string that contains the message to display.
MessageLength : [int] The length, in bytes, of the message string.
Style : [int] The contents and behavior of the message box. This value is typically MB_OK. For a complete list of values, see the uType parameter of the MessageBox function.
Timeout : [int] The time, in seconds, that the WTSSendMessage function waits for the user's response. If the user does not respond within the time-out interval, the pResponse parameter returns IDTIMEOUT. If the Timeout parameter is zero, WTSSendMessage waits indefinitely for the user to respond.
pResponse : [var] 
bWait : [int] If TRUE, WTSSendMessage does not return until the user responds or the time-out interval elapses. If the Timeout parameter is zero, the function does not return until the user responds. If FALSE, the function returns immediately and the pResponse parameter returns IDASYNC. Use this method for simple information messages (such as print job?notification messages) that do not need to return the user's response to the calling program.
%inst
Displays a message box on the client desktop of a specified Remote
Desktop Services session. (Unicode)

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
> [!NOTE] > The wtsapi32.h header defines WTSSendMessage as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
WTSSetListenerSecurityW
Configures the security descriptor of a Remote Desktop Services listener. (Unicode)
%group
Win32 wtsapi32
%prm
hServer, pReserved, Reserved, pListenerName, SecurityInformation, pSecurityDescriptor
hServer : [intptr] A handle to an RD?Session Host server. Always set this  parameter to WTS_CURRENT_SERVER_HANDLE.
pReserved : [intptr] This parameter is reserved. Always set this parameter to NULL.
Reserved : [int] This parameter is reserved. Always set this parameter to zero.
pListenerName : [wstr] A pointer to a null-terminated string that contains the name of the listener.
SecurityInformation : [int] A SECURITY_INFORMATION value that specifies the security information  to set. Always enable the  DACL_SECURITY_INFORMATION and SACL_SECURITY_INFORMATION flags. For more information about possible values, see SECURITY_INFORMATION.
pSecurityDescriptor : [int] A pointer to a SECURITY_DESCRIPTOR structure that contains the security information associated with the listener. For more information about possible values, see SECURITY_DESCRIPTOR. For information about STANDARD_RIGHTS_REQUIRED, see Standard Access Rights.
%inst
Configures the security descriptor of a Remote Desktop Services
listener. (Unicode)

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call the GetLastError function.

[備考]
> [!NOTE] > The wtsapi32.h header defines WTSSetListenerSecurity as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
WTSSetRenderHint
Used by an application that is displaying content that can be optimized for displaying in a remote session to identify the region of a window that is the actual content.
%group
Win32 wtsapi32
%prm
pRenderHintID, hwndOwner, renderHintType, cbHintDataLength, pHintData
pRenderHintID : [var] The address of a value that identifies the rendering hint affected by this call. If a new hint is being created, this value must contain zero. This function will return a unique rendering hint identifier which is used for subsequent calls, such as clearing the hint.
hwndOwner : [intptr] The handle of window linked to lifetime of the rendering hint. This window is used in situations where a hint target is removed without the hint being explicitly cleared.
renderHintType : [int] Specifies the type of hint represented by this call.
cbHintDataLength : [int] The size, in BYTEs, of the pHintData buffer.
pHintData : [var] Additional data for the hint. The format of this data is dependent upon the value passed in the renderHintType parameter.
%inst
Used by an application that is displaying content that can be
optimized for displaying in a remote session to identify the region
of a window that is the actual content.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
WTSSetUserConfigW
Modifies configuration information for the specified user on the specified domain controller or Remote Desktop Session Host (RD?Session Host) server. (Unicode)
%group
Win32 wtsapi32
%prm
pServerName, pUserName, WTSConfigClass, pBuffer, DataLength
pServerName : [wstr] Pointer to a null-terminated string containing the name of a domain controller or RD?Session Host server. Specify WTS_CURRENT_SERVER_NAME to indicate the RD?Session Host server on which your application is running.
pUserName : [wstr] Pointer to a null-terminated string containing the name of the user whose configuration is being set.
WTSConfigClass : [int] Specifies the type of information to set for the user. This parameter can be one of the values from the WTS_CONFIG_CLASS enumeration type. The documentation for WTS_CONFIG_CLASS describes the format of the data specified in ppBuffer for each of the information types.
pBuffer : [wstr] Pointer to the data used to modify the specified user's configuration.
DataLength : [int] Size, in TCHARs, of the pBuffer buffer.
%inst
Modifies configuration information for the specified user on the
specified domain controller or Remote Desktop Session Host (RD
Session Host) server. (Unicode)

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The WTSQueryUserConfig and WTSSetUserConfig functions are passed a
server name instead of a handle because user account information
often resides on a domain controller. To set user configuration
information, use the primary domain controller. You can call the
NetGetDCName function to get the name of the primary domain
controller. To query user configuration information, you can use the
NetGetAnyDCName function to get the name of a primary or backup
domain controller. Any domain controller can set or query user
configuration information. Use the DsGetDcName function to retrieve
the name of a domain controller. If the value of the WTSConfigClass
parameter corresponds to an integer value in the WTS_CONFIG_CLASS
enumeration, define the value to be set as a DWORD. Then cast the
value to an LPWSTR in the call to WTSSetUserConfig, as in the
following example:
This doc was truncated.


%index
WTSShutdownSystem
Shuts down (and optionally restarts) the specified Remote Desktop Session Host (RD?Session Host) server.
%group
Win32 wtsapi32
%prm
hServer, ShutdownFlag
hServer : [intptr] Handle to an RD?Session Host server. Specify a handle opened by the WTSOpenServer function, or specify WTS_CURRENT_SERVER_HANDLE to indicate the RD?Session Host server on which your application is running.
ShutdownFlag : [int] 
%inst
Shuts down (and optionally restarts) the specified Remote Desktop
Session Host (RD Session Host) server.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
A system shutdown terminates all users and active programs. The
following steps occur during shutdown.
This doc was truncated.


%index
WTSStartRemoteControlSessionW
Starts the remote control of another Remote Desktop Services session. You must call this function from a remote session. (Unicode)
%group
Win32 wtsapi32
%prm
pTargetServerName, TargetLogonId, HotkeyVk, HotkeyModifiers
pTargetServerName : [wstr] A pointer to the name of the server where the session that you want remote control of exists.
TargetLogonId : [int] The logon ID of the session that you want remote control of.
HotkeyVk : [int] The virtual-key code that represents the key to press to stop remote control of the session. The key that is defined in this parameter is used with the  HotkeyModifiers parameter.
HotkeyModifiers : [int] The virtual modifier that represents the key to press to stop remote control of the session. The virtual modifier is used with the HotkeyVk parameter. For example, if the WTSStartRemoteControlSession function is called with HotkeyVk set to VK_MULTIPLY and HotkeyModifiers set to REMOTECONTROL_KBDCTRL_HOTKEY, the user who has remote control of the target session can press CTRL + * to stop remote control of the session and return to their own session.
%inst
Starts the remote control of another Remote Desktop Services session.
You must call this function from a remote session. (Unicode)

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
> [!NOTE] > The wtsapi32.h header defines
WTSStartRemoteControlSession as an alias which automatically selects
the ANSI or Unicode version of this function based on the definition
of the UNICODE preprocessor constant. Mixing usage of the
encoding-neutral alias with code that not encoding-neutral can lead
to mismatches that result in compilation or runtime errors. For more
information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
WTSStopRemoteControlSession
Stops a remote control session.
%group
Win32 wtsapi32
%prm
LogonId
LogonId : [int] The logon ID of the session that you want to stop the remote control of.
%inst
Stops a remote control session.

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
WTSTerminateProcess
Terminates the specified process on the specified Remote Desktop Session Host (RD?Session Host) server.
%group
Win32 wtsapi32
%prm
hServer, ProcessId, ExitCode
hServer : [intptr] Handle to an RD?Session Host server. Specify a handle opened by the WTSOpenServer function, or specify WTS_CURRENT_SERVER_HANDLE to indicate the RD?Session Host server on which your application is running.
ProcessId : [int] Specifies the process identifier of the process to terminate.
ExitCode : [int] Specifies the exit code for the terminated process.
%inst
Terminates the specified process on the specified Remote Desktop
Session Host (RD Session Host) server.

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
WTSUnRegisterSessionNotification
Unregisters the specified window so that it receives no further session change notifications. (WTSUnRegisterSessionNotification)
%group
Win32 wtsapi32
%prm
hWnd
hWnd : [intptr] Handle of the window to be unregistered from receiving session notifications.
%inst
Unregisters the specified window so that it receives no further
session change notifications. (WTSUnRegisterSessionNotification)

[戻り値]
If the function succeeds, the return value is TRUE. Otherwise, it is
FALSE. To get extended error information, call GetLastError.

[備考]
This function must be called once for every call to the
WTSRegisterSessionNotification function.


%index
WTSUnRegisterSessionNotificationEx
Unregisters the specified window so that it receives no further session change notifications. (WTSUnRegisterSessionNotificationEx)
%group
Win32 wtsapi32
%prm
hServer, hWnd
hServer : [intptr] Handle of the server returned from WTSOpenServer or WTS_CURRENT_SERVER.
hWnd : [intptr] Handle of the window to be unregistered from receiving session notifications.
%inst
Unregisters the specified window so that it receives no further
session change notifications. (WTSUnRegisterSessionNotificationEx)

[戻り値]
If the function succeeds, the return value is TRUE. Otherwise, it is
FALSE. To get extended error information, call GetLastError.

[備考]
This function must be called once for every call to the
WTSRegisterSessionNotificationEx function.


%index
WTSVirtualChannelClose
Closes an open virtual channel handle.
%group
Win32 wtsapi32
%prm
hChannelHandle
hChannelHandle : [intptr] Handle to a virtual channel opened by the WTSVirtualChannelOpen function.
%inst
Closes an open virtual channel handle.

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
WTSVirtualChannelOpen
Opens a handle to the server end of a specified virtual channel.
%group
Win32 wtsapi32
%prm
hServer, SessionId, pVirtualName
hServer : [intptr] This parameter must be WTS_CURRENT_SERVER_HANDLE.
SessionId : [int] A Remote Desktop Services session identifier. To indicate the current session, specify WTS_CURRENT_SESSION. You can use the WTSEnumerateSessions function to retrieve the identifiers of all sessions on a specified RD?Session Host server. To open a virtual channel on another user's session, you need to have permission from the Virtual Channel. For more information, see Remote Desktop Services Permissions. To modify permissions on a session, use the Remote Desktop Services Configuration administrative tool.
pVirtualName : [str] A pointer to a null-terminated string containing the virtual channel name. Note that this is an ANSI string even when UNICODE is defined. The virtual channel name consists of one to CHANNEL_NAME_LEN characters, not including the terminating null.
%inst
Opens a handle to the server end of a specified virtual channel.

[戻り値]
If the function succeeds, the return value is a handle to the
specified virtual channel. If the function fails, the return value is
NULL. To get extended error information, call GetLastError.

[備考]
When you have finished using the handle, release it by calling the
WTSVirtualChannelClose function. For an example that shows how to
gain access to a virtual channel file handle that can be used for
asynchronous I/O, see WTSVirtualChannelQuery. If you try to use this
function to open the same virtual channel multiple times, it can
cause a 10-second delay and disrupt the established channel.


%index
WTSVirtualChannelOpenEx
Creates a virtual channel in a manner similar to WTSVirtualChannelOpen.
%group
Win32 wtsapi32
%prm
SessionId, pVirtualName, flags
SessionId : [int] A Remote Desktop Services session identifier. To indicate the current session, specify WTS_CURRENT_SESSION. You can use the WTSEnumerateSessions function to retrieve the identifiers of all sessions on a specified RD?Session Host server. To be able to open a virtual channel on another user's session, you must have the Virtual Channels permission. For more information, see Remote Desktop Services Permissions. To modify permissions on a session, use the Remote Desktop Services Configuration administrative tool.
pVirtualName : [str] In the case of an SVC, points to a null-terminated string that contains the virtual channel name. The length of an SVC name is limited to CHANNEL_NAME_LEN characters, not including the terminating null. In the case of a DVC, points to a null-terminated string that contains the endpoint name of the listener. The length of a DVC name is limited to MAX_PATH characters.
flags : [int] To open the channel as an SVC, specify zero for this parameter. To open the channel as a DVC, specify WTS_CHANNEL_OPTION_DYNAMIC. When opening a DVC, you can specify a priority setting for the data that is being transferred by specifying one of the WTS_CHANNEL_OPTION_DYNAMIC_PRI_XXX values in combination with the WTS_CHANNEL_OPTION_DYNAMIC value.
%inst
Creates a virtual channel in a manner similar to
WTSVirtualChannelOpen.

[戻り値]
NULL on error with GetLastError set.


%index
WTSVirtualChannelPurgeInput
Deletes all queued input data sent from the client to the server on a specified virtual channel.
%group
Win32 wtsapi32
%prm
hChannelHandle
hChannelHandle : [intptr] Handle to a virtual channel opened by the WTSVirtualChannelOpen function.
%inst
Deletes all queued input data sent from the client to the server on a
specified virtual channel.

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
WTSVirtualChannelPurgeOutput
Deletes all queued output data sent from the server to the client on a specified virtual channel.
%group
Win32 wtsapi32
%prm
hChannelHandle
hChannelHandle : [intptr] Handle to a virtual channel opened by the WTSVirtualChannelOpen function.
%inst
Deletes all queued output data sent from the server to the client on
a specified virtual channel.

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
WTSVirtualChannelQuery
Returns information about a specified virtual channel.
%group
Win32 wtsapi32
%prm
hChannelHandle, param1, ppBuffer, pBytesReturned
hChannelHandle : [intptr] Handle to a virtual channel opened by the WTSVirtualChannelOpen function.
param1 : [int] 
ppBuffer : [var] Pointer to a buffer that receives the requested information.
pBytesReturned : [var] Pointer to a variable that receives the number of bytes returned in the ppBuffer parameter.
%inst
Returns information about a specified virtual channel.

[戻り値]
If the function succeeds, the return value is a nonzero value. Call
the WTSFreeMemory function with the value returned in the ppBuffer
parameter to free the temporary memory allocated by
WTSVirtualChannelQuery.
If the function fails, the return value is zero. To get extended
error information, call GetLastError.

[備考]
The following example shows how to gain access to a virtual channel
file handle that can be used for asynchronous I/O. First the code
opens a virtual channel by using a call to the WTSVirtualChannelOpen
function. Then the code calls the WTSVirtualChannelQuery function,
specifying the WTSVirtualFileHandle virtual class type.
WTSVirtualChannelQuery returns a file handle that you can use to
perform asynchronous (overlapped) read and write operations. Finally,
the code frees the memory allocated by WTSVirtualChannelQuery with a
call to the WTSFreeMemory function, and closes the virtual channel
with a call to the WTSVirtualChannelClose function. Note that you
should not explicitly close the file handle obtained by calling
WTSVirtualChannelQuery. This is because WTSVirtualChannelClose closes
the file handle.
This doc was truncated.


%index
WTSVirtualChannelRead
Reads data from the server end of a virtual channel.
%group
Win32 wtsapi32
%prm
hChannelHandle, TimeOut, Buffer, BufferSize, pBytesRead
hChannelHandle : [intptr] Handle to a virtual channel opened by the WTSVirtualChannelOpen function.
TimeOut : [int] Specifies the time-out, in milliseconds. If TimeOut is zero, WTSVirtualChannelRead returns immediately if there is no data to read. If TimeOut is INFINITE (defined in Winbase.h), the function waits indefinitely until there is data to read.
Buffer : [str] Pointer to a buffer that receives a chunk of data read from the server end of the virtual channel. The maximum amount of data that the server can receive in a single WTSVirtualChannelRead call is CHANNEL_CHUNK_LENGTH bytes. If the client's VirtualChannelWrite call writes a larger block of data, the server must make multiple WTSVirtualChannelRead calls. In certain cases, Remote Desktop Services places a CHANNEL_PDU_HEADER structure at the beginning of each chunk of data read by the WTSVirtualChannelRead function. This will occur if the client DLL sets the CHANNEL_OPTION_SHOW_PROTOCOL option when it calls the VirtualChannelInit function to initialize the virtual channel. This will also occur if the channel is a dynamic virtual channel written to by using the IWTSVirtualChannel::Write method. Otherwise, the buffer receives only the data written in the VirtualChannelWrite call.
BufferSize : [int] Specifies the size, in bytes, of Buffer. If the chunk of data in Buffer will be preceded by a CHANNEL_PDU_HEADER structure, the value of this parameter should be at least CHANNEL_PDU_LENGTH. Otherwise, the value of this parameter should be at least CHANNEL_CHUNK_LENGTH.
pBytesRead : [var] Pointer to a variable that receives the number of bytes read.
%inst
Reads data from the server end of a virtual channel.

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Note WTSVirtualChannelRead is not thread safe. To access a virtual
channel from multiple threads, or to do asynchronous IO through a
virtual channel, use WTSVirtualChannelQuery with
WTSVirtualFileHandle.


%index
WTSVirtualChannelWrite
Writes data to the server end of a virtual channel.
%group
Win32 wtsapi32
%prm
hChannelHandle, Buffer, Length, pBytesWritten
hChannelHandle : [intptr] Handle to a virtual channel opened by the WTSVirtualChannelOpen function.
Buffer : [str] Pointer to a buffer containing the data to write to the virtual channel.
Length : [int] Specifies the size, in bytes, of the data to write.
pBytesWritten : [var] Pointer to a variable that receives the number of bytes written.
%inst
Writes data to the server end of a virtual channel.

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Note WTSVirtualChannelWrite is not thread safe. To access a virtual
channel from multiple threads, or to do asynchronous IO through a
virtual channel, use WTSVirtualChannelQuery with
WTSVirtualFileHandle.


%index
WTSWaitSystemEvent
Waits for a Remote Desktop Services event before returning to the caller.
%group
Win32 wtsapi32
%prm
hServer, EventMask, pEventFlags
hServer : [intptr] Handle to an RD?Session Host server. Specify a handle opened by the WTSOpenServer function, or specify WTS_CURRENT_SERVER_HANDLE to indicate the RD?Session Host server on which your application is running.
EventMask : [int] Bitmask that specifies the set of events to wait for. This mask can be WTS_EVENT_FLUSH to cause all pending
pEventFlags : [var] Pointer to a variable that receives a bitmask of the event or events that occurred. The returned mask can be a combination of the values from the previous list, or it can be WTS_EVENT_NONE if the wait terminated because of a WTSWaitSystemEvent call with WTS_EVENT_FLUSH.
%inst
Waits for a Remote Desktop Services event before returning to the
caller.

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

