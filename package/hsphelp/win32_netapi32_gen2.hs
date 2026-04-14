; ============================================================
;   netapi32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
NetApiBufferFree
The NetApiBufferFree function frees the memory that the NetApiBufferAllocate function allocates. Applications should also call NetApiBufferFree to free the memory that other network management functions use internally to return information.
%group
Win32 netapi32
%prm
Buffer
Buffer : [intptr] A pointer to a buffer returned previously by another network management function or memory allocated by calling the NetApiBufferAllocate function.
%inst
The NetApiBufferFree function frees the memory that the
NetApiBufferAllocate function allocates. Applications should also
call NetApiBufferFree to free the memory that other network
management functions use internally to return information.

[戻り値]
If the function succeeds, the return value is NERR_Success. If the
function fails, the return value is a system error code. For a list
of error codes, see System Error Codes.

[備考]
The NetApiBufferFree function is used to free memory used by network
management functions. This function is used in two cases:
This doc was truncated.


%index
NetShareEnum
Retrieves information about each shared resource on a server.
%group
Win32 netapi32
%prm
servername, level, bufptr, prefmaxlen, entriesread, totalentries, resume_handle
servername : [wstr] Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is NULL, the local computer is used.
level : [int] 
bufptr : [var] Pointer to the buffer that receives the data. The format of this data depends on the value of the level parameter.
prefmaxlen : [int] Specifies the preferred maximum length of returned data, in bytes. If you specify MAX_PREFERRED_LENGTH, the function allocates the amount of memory required for the data. If you specify another value in this parameter, it can restrict the number of bytes that the function returns. If the buffer size is insufficient to hold all entries, the function returns ERROR_MORE_DATA. For more information, see Network Management Function Buffers and Network Management Function Buffer Lengths.
entriesread : [var] Pointer to a value that receives the count of elements actually enumerated.
totalentries : [var] Pointer to a value that receives the total number of entries that could have been enumerated. Note that applications should consider this value only as a hint.
resume_handle : [var] Pointer to a value that contains a resume handle which is used to continue an existing share search. The handle should be zero on the first call and left unchanged for subsequent calls. If resume_handle is NULL, then no resume handle is stored.
%inst
Retrieves information about each shared resource on a server.

[戻り値]
If the function succeeds, the return value is NERR_Success. If the
function fails, the return value is a system error code. For a list
of error codes, see System Error Codes.

[備考]
This function applies only to Server Message Block (SMB) shares. For
other types of shares, such as Distributed File System (DFS) or
WebDAV shares, use Windows Networking (WNet) functions, which support
all types of shares. For interactive users (users who are logged on
locally to the machine), no special group membership is required to
execute the NetShareEnum function. For non-interactive users,
Administrator, Power User, Print Operator, or Server Operator group
membership is required to successfully execute the NetShareEnum
function at levels 2, 502, and 503. No special group membership is
required for level 0 or level 1 calls. Windows Server 2022: For
non-interactive users, Administrator, Access Control Assistance
Operators, or Server Operator group membership is required to
successfully execute the NetShareEnum function at levels 2, 502, and
503. Windows Server 2003 and Windows XP: For all users,
Administrator, Power User, Print Operator, or Server Operator group
membership is required to successfully execute the NetShareEnum
function at levels 2 and 502. To retrieve a value that indicates
whether a share is the root volume in a DFS tree structure, you must
call the NetShareGetInfo function and specify information level 1005.
If you are programming for Active Directory, you may be able to call
certain Active Directory Service Interface (ADSI) methods to achieve
the same functionality you can achieve by calling the network
management share functions. For more information, see IADsFileShare.


%index
NetShareGetInfo
Retrieves information about a particular shared resource on a server.
%group
Win32 netapi32
%prm
servername, netname, level, bufptr
servername : [wstr] Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is NULL, the local computer is used.
netname : [wstr] Pointer to a string that specifies the name of the share for which to return information.
level : [int] 
bufptr : [var] Pointer to the buffer that receives the data. The format of this data depends on the value of the level parameter. For more information, see Network Management Function Buffers.
%inst
Retrieves information about a particular shared resource on a server.

[戻り値]
If the function succeeds, the return value is NERR_Success. If the
function fails, the return value can be one of the following error
codes.
This doc was truncated.

[備考]
This function applies only to Server Message Block (SMB) shares. For
other types of shares, such as Distributed File System (DFS) or
WebDAV shares, use Windows Networking (WNet) functions, which support
all types of shares. For interactive users (users who are logged on
locally to the machine), no special group membership is required to
execute the NetShareGetInfo function. For non-interactive users,
Administrator, Power User, Print Operator, or Server Operator group
membership is required to successfully execute the NetShareEnum
function at levels 2, 502, and 503. No special group membership is
required for level 0 or level 1 calls. Windows Server 2003 and
Windows XP: For all users, Administrator, Power User, Print Operator,
or Server Operator group membership is required to successfully
execute the NetShareGetInfo function at levels 2 and 502. If you are
programming for Active Directory, you may be able to call certain
Active Directory Service Interface (ADSI) methods to achieve the same
functionality you can achieve by calling the network management share
functions. For more information, see IADsFileShare. If 503 is
specified for the level parameter, the remote server specified in the
shi503_servername member of the SHARE_INFO_503 structure must have
been bound to a transport protocol using the NetServerTransportAddEx
function. In the call to NetServerTransportAddEx, either 2 or 3 must
have been specified for the level parameter, and the
SVTI2_SCOPED_NAME flag must have been specified in the
SERVER_TRANSPORT_INFO_2 structure for the transport protocol.


%index
NetUserGetInfo
The NetUserGetInfo function retrieves information about a particular user account on a server.
%group
Win32 netapi32
%prm
servername, username, level, bufptr
servername : [wstr] A pointer to a constant string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is NULL, the local computer is used.
username : [wstr] A pointer to a constant string that specifies the name of the user account for which to return information. For more information, see the following Remarks section.
level : [int] 
bufptr : [var] A pointer to the buffer that receives the data. The format of this data depends on the value of the level parameter. This buffer is allocated by the system and must be freed using the NetApiBufferFree function. For more information, see Network Management Function Buffers and Network Management Function Buffer Lengths.
%inst
The NetUserGetInfo function retrieves information about a particular
user account on a server.

[戻り値]
If the function succeeds, the return value is NERR_Success. If the
function fails, the return value can be one of the following error
codes.
This doc was truncated.

[備考]
If you are programming for Active Directory, you may be able to call
certain Active Directory Service Interface (ADSI) methods to achieve
the same functionality you can achieve by calling the network
management user functions. For more information, see IADsUser and
IADsComputer. If you call this function on a domain controller that
is running Active Directory, access is allowed or denied based on the
access control list (ACL) for the securable object. The default ACL
permits all authenticated users and members of the "Pre-Windows 2000
compatible access" group to view the information. If you call this
function on a member server or workstation, all authenticated users
can view the information. For information about anonymous access and
restricting anonymous access on these platforms, see Security
Requirements for the Network Management Functions. For more
information on ACLs, ACEs, and access tokens, see Access Control
Model. The security descriptor of the User object is used to perform
the access check for this function. User account names are limited to
20 characters and group names are limited to 256 characters. In
addition, account names cannot be terminated by a period and they
cannot include commas or any of the following printable characters:
", /, \, [, ], :, |, <, >, +, =, ;, ?, *. Names also cannot include
characters in the range 1-31, which are nonprintable. If the
information level specified in the level parameter is set to 24, the
servername parameter specified must resolve to the local computer. If
the servername resolves to a remote computer or to a domain
controller, the NetUserGetInfo function will fail.


%index
NetWkstaGetInfo
The NetWkstaGetInfo function returns information about the configuration of a workstation.
%group
Win32 netapi32
%prm
servername, level, bufptr
servername : [wstr] Pointer to a string that specifies the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is NULL, the local computer is used.
level : [int] 
bufptr : [var] Pointer to the buffer that receives the data. The format of this data depends on the value of the level parameter. This buffer is allocated by the system and must be freed using the NetApiBufferFree function. For more information, see Network Management Function Buffers and Network Management Function Buffer Lengths.
%inst
The NetWkstaGetInfo function returns information about the
configuration of a workstation.

[戻り値]
If the function succeeds, the return value is NERR_Success. If the
function fails, the return value can be one of the following error
codes.
This doc was truncated.

[備考]
Windows Server 2003 and Windows XP: If you call this function on a
domain controller that is running Active Directory, access is allowed
or denied based on the ACL for the securable object. To enable
anonymous access, the user Anonymous must be a member of the
"Pre-Windows 2000 compatible access" group. This is because anonymous
tokens do not include the Everyone group SID by default. If you call
this function on a member server or workstation, all authenticated
users can view the information. Anonymous access is also permitted if
the EveryoneIncludesAnonymous policy setting allows anonymous access.
Anonymous access is always permitted for level 100. If you call this
function at level 101, authenticated users can view the information.
Members of the Administrators, and the Server, System and Print
Operator local groups can view information at levels 102 and 502. For
more information about restricting anonymous access, see Security
Requirements for the Network Management Functions. For more
information on ACLs, ACEs, and access tokens, see Access Control
Model. Windows 2000: If you call this function on a domain controller
that is running Active Directory, access is allowed or denied based
on the access control list (ACL) for the securable object. The
default ACL permits all authenticated users and members of the "
Pre-Windows 2000 compatible access" group to view the information. By
default, the "Pre-Windows 2000 compatible access" group includes
Everyone as a member. This enables anonymous access to the
information if the system allows anonymous access. If you call this
function on a member server or workstation, all authenticated users
can view the information. Anonymous access is also permitted if the
RestrictAnonymous policy setting allows anonymous access. To compile
an application that uses this function, define the _WIN32_WINNT macro
as 0x0400 or later. For more information,see Using the Windows
Headers.

