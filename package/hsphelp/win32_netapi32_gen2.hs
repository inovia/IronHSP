; ============================================================
;   netapi32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
NetAccessAdd
Not supported. (NetAccessAdd)
%group
Win32 netapi32
%prm
servername, level, buf, parm_err
servername : [wstr] Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is NULL, the local computer is used.
level : [int] Specifies the information level of the data. This parameter can be the following value.
buf : [var] Pointer to the buffer that contains the access information structure.
parm_err : [var] Specifies the size, in bytes, of the buffer pointed to by the pbBuffer parameter.
%inst
Not supported. (NetAccessAdd)

[戻り値]
If the function succeeds, the return value is NERR_Success. If the
function fails, the return value is a system error code. For a list
of error codes, see System Error Codes.

[備考]
This function requires User level security to be enabled.


%index
NetAccessDel
Not supported. (NetAccessDel)
%group
Win32 netapi32
%prm
servername, resource
servername : [wstr] Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is NULL, the local computer is used.
resource : [wstr] Pointer to a string that contains the name of the network resource for which to remove the access control list.
%inst
Not supported. (NetAccessDel)

[戻り値]
If the function succeeds, the return value is NERR_Success. If the
function fails, the return value is a system error code. For a list
of error codes, see System Error Codes.

[備考]
This function requires Admin privilege to successfully execute on a
computer that has local security enabled.


%index
NetAccessEnum
Not supported. (NetAccessEnum)
%group
Win32 netapi32
%prm
servername, BasePath, Recursive, level, bufptr, prefmaxlen, entriesread, totalentries, resume_handle
servername : [wstr] Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is NULL, the local computer is used.
BasePath : [wstr] Pointer to a string that contains a base pathname for the resource. A NULL pointer or NULL string means no base path is to be used. The path can be specified as a universal naming convention (UNC) pathname.
Recursive : [int] Specifies a flag that enables or disables recursive searching. If this parameter is equal to zero, the NetAccessEnum function returns entries for the resource named as the base path by the pszBasePath parameter, and for the resources directly below that base path. If this parameter is nonzero, the function returns entries for all access control lists (ACLs) that have pszBasePath at the beginning of the resource name.
level : [int] 
bufptr : [var] Pointer to the buffer that receives the access information structure. The format of this data depends on the value of the sLevel parameter.
prefmaxlen : [int] Specifies the size, in bytes, of the buffer pointed to by the pbBuffer parameter.
entriesread : [var] Pointer to an unsigned short integer that receives the count of elements actually enumerated. The count is valid only if the NetAccessEnum function returns NERR_Success or ERROR_MORE_DATA.
totalentries : [var] Pointer to an unsigned short integer that receives the total number of entries that could have been enumerated. The count is valid only if the NetAccessEnum function returns NERR_Success or ERROR_MORE_DATA.
resume_handle : [var] TBD
%inst
Not supported. (NetAccessEnum)

[戻り値]
If the function succeeds, the return value is NERR_Success. If the
function fails, the return value is a system error code. For a list
of error codes, see System Error Codes.

[備考]
This function requires Admin privilege to successfully execute on a
computer that has local security enabled.


%index
NetAccessGetInfo
Not supported. (NetAccessGetInfo)
%group
Win32 netapi32
%prm
servername, resource, level, bufptr
servername : [wstr] Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is NULL, the local computer is used.
resource : [wstr] 
level : [int] Pointer to the buffer that receives the access information structure. The format of this data depends on the value of the sLevel parameter.
bufptr : [var] Specifies the size, in bytes, of the buffer pointed to by the pbBuffer parameter.
%inst
Not supported. (NetAccessGetInfo)

[戻り値]
If the function succeeds, the return value is NERR_Success. If the
function fails, the return value is a system error code. For a list
of error codes, see System Error Codes.

[備考]
This function requires Admin privilege to successfully execute on a
computer that has local security enabled.


%index
NetAccessGetUserPerms
Not supported. (NetAccessGetUserPerms)
%group
Win32 netapi32
%prm
servername, UGname, resource, Perms
servername : [wstr] Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is NULL, the local computer is used.
UGname : [wstr] Pointer to a string that specifies the name of the user or group to query.
resource : [wstr] Pointer to a string that contains the name of the network resource to query.
Perms : [var] Pointer to an unsigned short integer that receives the user permissions for the specified resource.
%inst
Not supported. (NetAccessGetUserPerms)

[戻り値]
If the function succeeds, the return value is NERR_Success. If the
function fails, the return value is a system error code. For a list
of error codes, see System Error Codes.

[備考]
This function requires Admin privilege to successfully execute on a
computer that has local security enabled. When users request their
own access permissions, no special privilege is required.


%index
NetAccessSetInfo
Not supported. (NetAccessSetInfo)
%group
Win32 netapi32
%prm
servername, resource, level, buf, parm_err
servername : [wstr] Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is NULL, the local computer is used.
resource : [wstr] Pointer to a string that contains the name of the network resource to modify.
level : [int] Specifies the information level of the data. This parameter can be the following value.
buf : [var] Pointer to the buffer that contains the access information structure. The format of this data depends on the value of the sLevel parameter.
parm_err : [var] TBD
%inst
Not supported. (NetAccessSetInfo)

[戻り値]
If the function succeeds, the return value is NERR_Success. If the
function fails, the return value is a system error code. For a list
of error codes, see System Error Codes.

[備考]
This function requires Admin privilege to successfully execute on a
computer that has local security enabled.


%index
NetAlertRaise
The NetAlertRaise function notifies all registered clients when a particular event occurs.
%group
Win32 netapi32
%prm
AlertType, Buffer, BufferSize
AlertType : [wstr] A pointer to a constant string that specifies the alert class (type of alert) to raise. This parameter can be one of the following predefined values, or a user-defined alert class for network applications. The event name for an alert can be any text string.
Buffer : [intptr] A pointer to the data to send to the clients listening for the interrupting message. The data should begin with a fixed-length STD_ALERT structure followed by additional message data in one ADMIN_OTHER_INFO, ERRLOG_OTHER_INFO, PRINT_OTHER_INFO, or USER_OTHER_INFO structure. Finally, the buffer should include any required variable-length information. For more information, see the code sample in the following Remarks section.
BufferSize : [int] The size, in bytes, of the message buffer.
%inst
The NetAlertRaise function notifies all registered clients when a
particular event occurs.

[戻り値]
If the function succeeds, the return value is NERR_Success. If the
function fails, the return value is a system error code and a can be
one of the following error codes. For a list of all possible error
codes, see System Error Codes.
This doc was truncated.

[備考]
No special group membership is required to successfully execute the
NetAlertRaise function. The alerter service must be running on the
client computer when you call the NetAlertRaise function, or the
function fails with ERROR_FILE_NOT_FOUND.


%index
NetAlertRaiseEx
The NetAlertRaiseEx function notifies all registered clients when a particular event occurs. You can call this extended function to simplify the sending of an alert message because NetAlertRaiseEx does not require that you specify a STD_ALERT structure.
%group
Win32 netapi32
%prm
AlertType, VariableInfo, VariableInfoSize, ServiceName
AlertType : [wstr] A pointer to a constant string that specifies the alert class (type of alert) to raise. This parameter can be one of the following predefined values, or a user-defined alert class for network applications. (The event name for an alert can be any text string.)
VariableInfo : [intptr] A pointer to the data to send to the clients listening for the interrupting message. The data should consist of one ADMIN_OTHER_INFO, ERRLOG_OTHER_INFO, PRINT_OTHER_INFO, or USER_OTHER_INFO structure followed by any required variable-length information. For more information, see the code sample in the following Remarks section.
VariableInfoSize : [int] The number of bytes of variable information in the buffer pointed to by the VariableInfo parameter.
ServiceName : [wstr] A pointer to a constant string that specifies the name of the service raising the interrupting message.
%inst
The NetAlertRaiseEx function notifies all registered clients when a
particular event occurs. You can call this extended function to
simplify the sending of an alert message because NetAlertRaiseEx does
not require that you specify a STD_ALERT structure.

[戻り値]
If the function succeeds, the return value is NERR_Success. If the
function fails, the return value is a system error code and a can be
one of the following error codes. For a list of all possible error
codes, see System Error Codes.
This doc was truncated.

[備考]
No special group membership is required to successfully execute the
NetAlertRaiseEx function. The alerter service must be running on the
client computer when you call the NetAlertRaiseEx function, or the
function fails with ERROR_FILE_NOT_FOUND.


%index
NetAuditClear
The NetAuditClear function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use event logging.
%group
Win32 netapi32
%prm
server, backupfile, service
server : [wstr] 
backupfile : [wstr] 
service : [wstr] 
%inst
The NetAuditClear function is obsolete. It is included for
compatibility with 16-bit versions of Windows. Other applications
should use event logging.


%index
NetAuditRead
The NetAuditRead function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use event logging.
%group
Win32 netapi32
%prm
server, service, auditloghandle, offset, reserved1, reserved2, offsetflag, bufptr, prefmaxlen, bytesread, totalavailable
server : [wstr] 
service : [wstr] 
auditloghandle : [var] 
offset : [int] 
reserved1 : [var] 
reserved2 : [int] 
offsetflag : [int] 
bufptr : [var] 
prefmaxlen : [int] 
bytesread : [var] 
totalavailable : [var] 
%inst
The NetAuditRead function is obsolete. It is included for
compatibility with 16-bit versions of Windows. Other applications
should use event logging.


%index
NetAuditWrite
The NetAuditWrite function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use event logging.
%group
Win32 netapi32
%prm
type, buf, numbytes, service, reserved
type : [int] 
buf : [var] 
numbytes : [int] 
service : [wstr] 
reserved : [var] 
%inst
The NetAuditWrite function is obsolete. It is included for
compatibility with 16-bit versions of Windows. Other applications
should use event logging.


%index
NetConfigGet
The NetConfigGet function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use the registry.
%group
Win32 netapi32
%prm
server, component, parameter, bufptr
server : [wstr] TBD
component : [wstr] TBD
parameter : [wstr] TBD
bufptr : [var] TBD
%inst
The NetConfigGet function is obsolete. It is included for
compatibility with 16-bit versions of Windows. Other applications
should use the registry.


%index
NetConfigGetAll
The NetConfigGetAll function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use the registry.
%group
Win32 netapi32
%prm
server, component, bufptr
server : [wstr] TBD
component : [wstr] TBD
bufptr : [var] TBD
%inst
The NetConfigGetAll function is obsolete. It is included for
compatibility with 16-bit versions of Windows. Other applications
should use the registry.


%index
NetConfigSet
The NetConfigSet function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use the registry.
%group
Win32 netapi32
%prm
server, reserved1, component, level, reserved2, buf, reserved3
server : [wstr] TBD
reserved1 : [wstr] TBD
component : [wstr] TBD
level : [int] TBD
reserved2 : [int] TBD
buf : [var] TBD
reserved3 : [int] TBD
%inst
The NetConfigSet function is obsolete. It is included for
compatibility with 16-bit versions of Windows. Other applications
should use the registry.


%index
NetErrorLogClear
The NetErrorLogClear function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use event logging.
%group
Win32 netapi32
%prm
UncServerName, BackupFile, Reserved
UncServerName : [wstr] TBD
BackupFile : [wstr] TBD
Reserved : [var] TBD
%inst
The NetErrorLogClear function is obsolete. It is included for
compatibility with 16-bit versions of Windows. Other applications
should use event logging.


%index
NetErrorLogRead
The NetErrorLogRead function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use event logging.
%group
Win32 netapi32
%prm
UncServerName, Reserved1, ErrorLogHandle, Offset, Reserved2, Reserved3, OffsetFlag, BufPtr, PrefMaxSize, BytesRead, TotalAvailable
UncServerName : [wstr] TBD
Reserved1 : [wstr] TBD
ErrorLogHandle : [var] TBD
Offset : [int] TBD
Reserved2 : [var] TBD
Reserved3 : [int] TBD
OffsetFlag : [int] TBD
BufPtr : [var] TBD
PrefMaxSize : [int] TBD
BytesRead : [var] TBD
TotalAvailable : [var] TBD
%inst
The NetErrorLogRead function is obsolete. It is included for
compatibility with 16-bit versions of Windows. Other applications
should use event logging.


%index
NetErrorLogWrite
The NetErrorLogWrite function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use event logging.
%group
Win32 netapi32
%prm
Reserved1, Code, Component, Buffer, NumBytes, MsgBuf, StrCount, Reserved2
Reserved1 : [var] TBD
Code : [int] TBD
Component : [wstr] TBD
Buffer : [var] TBD
NumBytes : [int] TBD
MsgBuf : [var] TBD
StrCount : [int] TBD
Reserved2 : [var] TBD
%inst
The NetErrorLogWrite function is obsolete. It is included for
compatibility with 16-bit versions of Windows. Other applications
should use event logging.


%index
NetMessageBufferSend
The NetMessageBufferSend function sends a buffer of information to a registered message alias.
%group
Win32 netapi32
%prm
servername, msgname, fromname, buf, buflen
servername : [wstr] Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is NULL, the local computer is used.
msgname : [wstr] Pointer to a constant string that specifies the message alias to which the message buffer should be sent.
fromname : [wstr] Pointer to a constant string specifying who the message is from. If this parameter is NULL, the message is sent from the local computer name.
buf : [var] Pointer to a buffer that contains the message text. For more information, see Network Management Function Buffers.
buflen : [int] Specifies a value that contains the length, in bytes, of the message text pointed to by the buf parameter.
%inst
The NetMessageBufferSend function sends a buffer of information to a
registered message alias.

[戻り値]
If the function succeeds, the return value is NERR_Success. If the
function fails, the return value can be one of the following error
codes.
This doc was truncated.

[備考]
If you call this function on a domain controller that is running
Active Directory, access is allowed or denied based on the access
control list (ACL) for the securable object. The default ACL permits
only Domain Admins and Account Operators to call this function. On a
member server or workstation, only Administrators and Server
Operators can call this function. For more information, see Security
Requirements for the Network Management Functions. For more
information on ACLs and ACEs, see Access Control Model.


%index
NetMessageNameAdd
The NetMessageNameAdd function registers a message alias in the message name table. The function requires that the messenger service be started.
%group
Win32 netapi32
%prm
servername, msgname
servername : [wstr] Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is NULL, the local computer is used.
msgname : [wstr] Pointer to a constant string that specifies the message alias to add. The string cannot be more than 15 characters long.
%inst
The NetMessageNameAdd function registers a message alias in the
message name table. The function requires that the messenger service
be started.

[戻り値]
If the function succeeds, the return value is NERR_Success. If the
function fails, the return value can be one of the following error
codes.
This doc was truncated.

[備考]
Only members of the Administrators local group can successfully
execute the NetMessageNameAdd function on a remote server. The
forward action flag is no longer a parameter to the LAN Manager
2.xNetMessageNameAdd function because message forwarding is no longer
supported. If the NetMessageNameAdd function detects that a forwarded
version of msgname exists on the network, the function will fail with
error NERR_Already_Exists.


%index
NetMessageNameDel
The NetMessageNameDel function deletes a message alias in the message name table. The function requires that the messenger service be started.
%group
Win32 netapi32
%prm
servername, msgname
servername : [wstr] Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is NULL, the local computer is used.
msgname : [wstr] Pointer to a constant string that specifies the message alias to delete. The string cannot be more than 15 characters long.
%inst
The NetMessageNameDel function deletes a message alias in the message
name table. The function requires that the messenger service be
started.

[戻り値]
If the function succeeds, the return value is NERR_Success. If the
function fails, the return value can be one of the following error
codes.
This doc was truncated.

[備考]
Only members of the Administrators local group can successfully
execute the NetMessageNameDel function on a remote server.


%index
NetMessageNameEnum
The NetMessageNameEnum function lists the message aliases that receive messages on a specified computer. The function requires that the messenger service be started.
%group
Win32 netapi32
%prm
servername, level, bufptr, prefmaxlen, entriesread, totalentries, resume_handle
servername : [wstr] Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is NULL, the local computer is used.
level : [int] 
bufptr : [var] Pointer to the buffer that receives the data. The format of this data depends on the value of the level parameter. This buffer is allocated by the system and must be freed using the NetApiBufferFree function. Note that you must free the buffer even if the function fails with ERROR_MORE_DATA.
prefmaxlen : [int] Specifies the preferred maximum length of the returned data, in bytes. If you specify MAX_PREFERRED_LENGTH, the function allocates the amount of memory required for the data. If you specify another value in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns ERROR_MORE_DATA. For more information, see Network Management Function Buffers and Network Management Function Buffer Lengths.
entriesread : [var] Pointer to a value that receives the count of elements actually enumerated.
totalentries : [var] Pointer to a value that receives the total number of entries that could have been enumerated from the current resume position. Note that applications should consider this value only as a hint.
resume_handle : [var] Pointer to a value that contains a resume handle which is used to continue an existing message alias search. The handle should be zero on the first call and left unchanged for subsequent calls. If resume_handle is NULL, no resume handle is stored.
%inst
The NetMessageNameEnum function lists the message aliases that
receive messages on a specified computer. The function requires that
the messenger service be started.

[戻り値]
If the function succeeds, the return value is NERR_Success. If the
function fails, the return value can be one of the following error
codes.
This doc was truncated.

[備考]
Only members of the Administrators local group can successfully
execute the NetMessageNameEnum function on a remote server. To
retrieve information about a particular message alias in the message
name table, you can call the NetMessageNameGetInfo function.


%index
NetMessageNameGetInfo
The NetMessageNameGetInfo function retrieves information about a particular message alias in the message name table. The function requires that the messenger service be started.
%group
Win32 netapi32
%prm
servername, msgname, level, bufptr
servername : [wstr] Pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is NULL, the local computer is used.
msgname : [wstr] Pointer to a constant string that specifies the message alias for which to return information.
level : [int] 
bufptr : [var] Pointer to the buffer that receives the data. The format of this data depends on the value of the level parameter. This buffer is allocated by the system and must be freed using the NetApiBufferFree function. For more information, see Network Management Function Buffers and Network Management Function Buffer Lengths.
%inst
The NetMessageNameGetInfo function retrieves information about a
particular message alias in the message name table. The function
requires that the messenger service be started.

[戻り値]
If the function succeeds, the return value is NERR_Success. If the
function fails, the return value can be one of the following error
codes.
This doc was truncated.

[備考]
Only members of the Administrators local group can successfully
execute the NetMessageNameGetInfo function on a remote server. To
list all the message aliases in a message name table, you can call
the NetMessageNameEnum function.


%index
NetReplExportDirAdd
(no summary)
%group
Win32 netapi32
%prm
servername, level, buf, parm_err
servername : [wstr] 
level : [int] 
buf : [var] 
parm_err : [var] 
%inst



%index
NetReplExportDirDel
(no summary)
%group
Win32 netapi32
%prm
servername, dirname
servername : [wstr] 
dirname : [wstr] 
%inst



%index
NetReplExportDirEnum
(no summary)
%group
Win32 netapi32
%prm
servername, level, bufptr, prefmaxlen, entriesread, totalentries, resumehandle
servername : [wstr] 
level : [int] 
bufptr : [var] 
prefmaxlen : [int] 
entriesread : [var] 
totalentries : [var] 
resumehandle : [var] 
%inst



%index
NetReplExportDirGetInfo
(no summary)
%group
Win32 netapi32
%prm
servername, dirname, level, bufptr
servername : [wstr] 
dirname : [wstr] 
level : [int] 
bufptr : [var] 
%inst



%index
NetReplExportDirLock
(no summary)
%group
Win32 netapi32
%prm
servername, dirname
servername : [wstr] 
dirname : [wstr] 
%inst



%index
NetReplExportDirSetInfo
(no summary)
%group
Win32 netapi32
%prm
servername, dirname, level, buf, parm_err
servername : [wstr] 
dirname : [wstr] 
level : [int] 
buf : [var] 
parm_err : [var] 
%inst



%index
NetReplExportDirUnlock
(no summary)
%group
Win32 netapi32
%prm
servername, dirname, unlockforce
servername : [wstr] 
dirname : [wstr] 
unlockforce : [int] 
%inst



%index
NetReplGetInfo
(no summary)
%group
Win32 netapi32
%prm
servername, level, bufptr
servername : [wstr] 
level : [int] 
bufptr : [var] 
%inst



%index
NetReplImportDirAdd
(no summary)
%group
Win32 netapi32
%prm
servername, level, buf, parm_err
servername : [wstr] 
level : [int] 
buf : [var] 
parm_err : [var] 
%inst



%index
NetReplImportDirDel
(no summary)
%group
Win32 netapi32
%prm
servername, dirname
servername : [wstr] 
dirname : [wstr] 
%inst



%index
NetReplImportDirEnum
(no summary)
%group
Win32 netapi32
%prm
servername, level, bufptr, prefmaxlen, entriesread, totalentries, resumehandle
servername : [wstr] 
level : [int] 
bufptr : [var] 
prefmaxlen : [int] 
entriesread : [var] 
totalentries : [var] 
resumehandle : [var] 
%inst



%index
NetReplImportDirGetInfo
(no summary)
%group
Win32 netapi32
%prm
servername, dirname, level, bufptr
servername : [wstr] 
dirname : [wstr] 
level : [int] 
bufptr : [var] 
%inst



%index
NetReplImportDirLock
(no summary)
%group
Win32 netapi32
%prm
servername, dirname
servername : [wstr] 
dirname : [wstr] 
%inst



%index
NetReplImportDirUnlock
(no summary)
%group
Win32 netapi32
%prm
servername, dirname, unlockforce
servername : [wstr] 
dirname : [wstr] 
unlockforce : [int] 
%inst



%index
NetReplSetInfo
(no summary)
%group
Win32 netapi32
%prm
servername, level, buf, parm_err
servername : [wstr] 
level : [int] 
buf : [var] 
parm_err : [var] 
%inst



%index
NetServerEnum
The NetServerEnum function lists all servers of the specified type that are visible in a domain.
%group
Win32 netapi32
%prm
servername, level, bufptr, prefmaxlen, entriesread, totalentries, servertype, domain, resume_handle
servername : [wstr] Reserved; must be NULL.
level : [int] 
bufptr : [var] A pointer to the buffer that receives the data. The format of this data depends on the value of the level parameter. This buffer is allocated by the system and must be freed using the NetApiBufferFree function. Note that you must free the buffer even if the function fails with ERROR_MORE_DATA.
prefmaxlen : [int] The preferred maximum length of returned data, in bytes. If you specify MAX_PREFERRED_LENGTH, the function allocates the amount of memory required for the data. If you specify another value in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns ERROR_MORE_DATA. For more information, see Network Management Function Buffers and Network Management Function Buffer Lengths.
entriesread : [var] A pointer to a value that receives the count of elements actually enumerated.
totalentries : [var] A pointer to a value that receives the total number of visible servers and workstations on the network. Note that applications should consider this value only as a hint.
servertype : [int] 
domain : [wstr] A pointer to a constant string that specifies the name of the domain for which a list of servers is to be returned. The domain name must be a NetBIOS domain name (for example, microsoft). The NetServerEnum function does not support DNS-style names (for example, microsoft.com). If this parameter is NULL, the primary domain is implied.
resume_handle : [var] Reserved; must be set to zero.
%inst
The NetServerEnum function lists all servers of the specified type
that are visible in a domain.

[戻り値]
If the function succeeds, the return value is NERR_Success. If the
function fails, the return value can be one of the following error
codes:
This doc was truncated.

[備考]
The NetServerEnum function is used to list all servers of the
specified type that are visible in a domain. For example, an
application can call NetServerEnum to list all domain controllers
only or all servers that run instances of SQL server only. An
application combine the bit masks for various server types in the
servertype parameter to list several types. For example, a value of
SV_TYPE_WORKSTATION | SVTYPE_SERVER (0x00000003) combines the bit
masks for SV_TYPE_WORKSTATION (0x00000001) and SV_TYPE_SERVER
(0x00000002). If you require more information for a specific server,
call the WNetEnumResource function. No special group membership is
required to successfully execute the NetServerEnum function. If you
specify the value SV_TYPE_LOCAL_LIST_ONLY, the NetServerEnum function
returns the list of servers that the browser maintains internally.
This has meaning only on the master browser (or on a computer that
has been the master browser in the past). The master browser is the
computer that currently has rights to determine which computers can
be servers or workstations on the network. If there are no servers
found that match the types specified in the servertype parameter, the
NetServerEnum function returns the bufptr parameter as NULL and DWORD
values pointed to by the entriesread and totalentries parameters are
set to zero. The NetServerEnum function depends on the browser
service being installed and running. If no browser servers are found,
then NetServerEnum fails with ERROR_NO_BROWSER_SERVERS_FOUND. If you
are programming for Active Directory, you may be able to call certain
Active Directory Service Interface (ADSI) methods to achieve the same
function you can achieve by calling the network management server
functions. For more information, see IADsComputer.


%index
NetServiceControl
The NetServiceControl function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use the service functions.
%group
Win32 netapi32
%prm
servername, service, opcode, arg, bufptr
servername : [wstr] 
service : [wstr] 
opcode : [int] 
arg : [int] 
bufptr : [var] 
%inst
The NetServiceControl function is obsolete. It is included for
compatibility with 16-bit versions of Windows. Other applications
should use the service functions.


%index
NetServiceEnum
The NetServiceEnum function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use the service functions.
%group
Win32 netapi32
%prm
servername, level, bufptr, prefmaxlen, entriesread, totalentries, resume_handle
servername : [wstr] 
level : [int] 
bufptr : [var] 
prefmaxlen : [int] 
entriesread : [var] 
totalentries : [var] 
resume_handle : [var] 
%inst
The NetServiceEnum function is obsolete. It is included for
compatibility with 16-bit versions of Windows. Other applications
should use the service functions.


%index
NetServiceGetInfo
The NetServiceGetInfo function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use the service functions.
%group
Win32 netapi32
%prm
servername, service, level, bufptr
servername : [wstr] 
service : [wstr] 
level : [int] 
bufptr : [var] 
%inst
The NetServiceGetInfo function is obsolete. It is included for
compatibility with 16-bit versions of Windows. Other applications
should use the service functions.


%index
NetServiceInstall
The NetServiceInstall function is obsolete. It is included for compatibility with 16-bit versions of Windows. Other applications should use the service functions.
%group
Win32 netapi32
%prm
servername, service, argc, argv, bufptr
servername : [wstr] 
service : [wstr] 
argc : [int] 
argv : [var] 
bufptr : [var] 
%inst
The NetServiceInstall function is obsolete. It is included for
compatibility with 16-bit versions of Windows. Other applications
should use the service functions.


%index
NetStatisticsGet
Retrieves operating statistics for a service. Currently, only the workstation and server services are supported.
%group
Win32 netapi32
%prm
ServerName, Service, Level, Options, Buffer
ServerName : [var] Pointer to a string that specifies the DNS or NetBIOS name of the server on which the function is to execute. If this parameter is NULL, the local computer is used.
Service : [var] Pointer to a string that specifies the name of the service about which to get the statistics. Only the values SERVICE_SERVER and SERVICE_WORKSTATION are currently allowed.
Level : [int] Specifies the information level of the data. This parameter can be the following value.
Options : [int] This parameter must be zero.
Buffer : [var] Pointer to the buffer that receives the data. The format of this data depends on the value of the level parameter. This buffer is allocated by the system and must be freed using the NetApiBufferFree function. For more information, see Network Management Function Buffers and Network Management Function Buffer Lengths.
%inst
Retrieves operating statistics for a service. Currently, only the
workstation and server services are supported.

[戻り値]
If the function succeeds, the return value is NERR_Success. If the
function fails, the return value is a system error code. For a list
of error codes, see System Error Codes.

[備考]
No special group membership is required to obtain workstation
statistics. Only members of the Administrators or Server Operators
local group can successfully execute the NetStatisticsGet function on
a remote server.


%index
NetWkstaGetInfo
NetWkstaGetInfo 関数はワークステーションの構成情報を返す。
%group
Win32 netapi32
%prm
servername, level, bufptr
servername : [wstr] 実行対象のリモートサーバーの DNS/NetBIOS 名を指定する文字列へのポインタ。NULL ならローカル。
level : [int] 
bufptr : [var] データを受け取るバッファへのポインタ。形式は level に依存する。バッファはシステムが確保するため NetApiBufferFree で解放する必要がある。
%inst
NetWkstaGetInfo 関数はワークステーションの構成情報を返す。

[戻り値]
成功時は NERR_Success、失敗時は以下のエラーコードのいずれかを返す。
（以下省略）

[備考]
Windows Server 2003/Windows XP: Active Directory
上のドメインコントローラで呼び出した場合、ACL に基づきアクセスが判定される。匿名アクセスを可能にするには "Pre-Windows
2000 compatible access" グループに Anonymous が含まれている必要がある。level 100
は常に匿名アクセス可能。level 101 は認証済みユーザーが閲覧可能。level 102 および 502 は
Administrators、Server、System、Print Operator
ローカルグループメンバが閲覧可能。本関数を使うアプリケーションは _WIN32_WINNT を 0x0400
以上に定義してコンパイルすること。


%index
NetWkstaSetInfo
The NetWkstaSetInfo function configures a workstation with information that remains in effect after the system has been reinitialized.
%group
Win32 netapi32
%prm
servername, level, buffer, parm_err
servername : [wstr] A pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is NULL, the local computer is used.
level : [int] 
buffer : [var] A pointer to the buffer that specifies the data. The format of this data depends on the value of the level parameter. For more information, see Network Management Function Buffers.
parm_err : [var] A pointer to a value that receives the index of the first member of the workstation information structure that causes the ERROR_INVALID_PARAMETER error. If this parameter is NULL, the index is not returned on error. For more information, see the Remarks section.
%inst
The NetWkstaSetInfo function configures a workstation with
information that remains in effect after the system has been
reinitialized.

[戻り値]
If the function succeeds, the return value is NERR_Success. If the
function fails, the return value can be one of the following error
codes.
This doc was truncated.

[備考]
Only members of the Administrators group can successfully execute the
NetWkstaSetInfo function on a remote server. The NetWkstaSetInfo
function calls the workstation service on the local system or a
remote system. Only a limited number of members of the WKSTA_INFO_502
structure can actually be changed using the NetWkstaSetInfo function.
No errors are returned if a member is set that is ignored by the
workstation service. The workstation service is primarily configured
using settings in the registry. The NetWkstaUserSetInfo function can
be used instead of the NetWkstaSetInfo function to set configuration
information on the local system. The NetWkstaUserSetInfo function
calls the Local Security Authority (LSA). If the NetWkstaSetInfo
function returns ERROR_INVALID_PARAMETER, you can use the parm_err
parameter to indicate the first member of the workstation information
structure that is invalid. (A workstation information structure
begins with WKSTA_INFO_ and its format is specified by the level
parameter.) The following table lists the values that can be returned
in the parm_err parameter and the corresponding structure member that
is in error. (The prefix wki*_ indicates that the member can begin
with multiple prefixes, for example, wki100_ or wki402_.)
This doc was truncated.

