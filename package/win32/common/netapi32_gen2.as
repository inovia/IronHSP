; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    netapi32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __netapi32_gen2_as__
#define __netapi32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "netapi32.dll"
; uint NetAccessAdd(winmdroot.Foundation.PCWSTR servername, uint level, byte* buf, [Optional] uint* parm_err)
#cfunc NetAccessAdd "NetAccessAdd" wstr, int, var, var

; uint NetAccessDel(winmdroot.Foundation.PCWSTR servername, winmdroot.Foundation.PCWSTR resource)
#cfunc NetAccessDel "NetAccessDel" wstr, wstr

; uint NetAccessEnum(winmdroot.Foundation.PCWSTR servername, winmdroot.Foundation.PCWSTR BasePath, uint Recursive, uint level, byte** bufptr, uint prefmaxlen, uint* entriesread, uint* totalentries, [Optional] uint* resume_handle)
#cfunc NetAccessEnum "NetAccessEnum" wstr, wstr, int, int, var, int, var, var, var

; uint NetAccessGetInfo(winmdroot.Foundation.PCWSTR servername, winmdroot.Foundation.PCWSTR resource, uint level, byte** bufptr)
#cfunc NetAccessGetInfo "NetAccessGetInfo" wstr, wstr, int, var

; uint NetAccessGetUserPerms(winmdroot.Foundation.PCWSTR servername, winmdroot.Foundation.PCWSTR UGname, winmdroot.Foundation.PCWSTR resource, uint* Perms)
#cfunc NetAccessGetUserPerms "NetAccessGetUserPerms" wstr, wstr, wstr, var

; uint NetAccessSetInfo(winmdroot.Foundation.PCWSTR servername, winmdroot.Foundation.PCWSTR resource, uint level, byte* buf, [Optional] uint* parm_err)
#cfunc NetAccessSetInfo "NetAccessSetInfo" wstr, wstr, int, var, var

; uint NetAlertRaise(winmdroot.Foundation.PCWSTR AlertType, void* Buffer, uint BufferSize)
#cfunc NetAlertRaise "NetAlertRaise" wstr, intptr, int

; uint NetAlertRaiseEx(winmdroot.Foundation.PCWSTR AlertType, void* VariableInfo, uint VariableInfoSize, winmdroot.Foundation.PCWSTR ServiceName)
#cfunc NetAlertRaiseEx "NetAlertRaiseEx" wstr, intptr, int, wstr

; uint NetAuditClear(winmdroot.Foundation.PCWSTR server, winmdroot.Foundation.PCWSTR backupfile, winmdroot.Foundation.PCWSTR service)
#cfunc NetAuditClear "NetAuditClear" wstr, wstr, wstr

; uint NetAuditRead(winmdroot.Foundation.PCWSTR server, winmdroot.Foundation.PCWSTR service, winmdroot.NetworkManagement.NetManagement.HLOG* auditloghandle, uint offset, uint* reserved1, uint reserved2, uint offsetflag, byte** bufptr, uint prefmaxlen, uint* bytesread, uint* totalavailable)
#cfunc NetAuditRead "NetAuditRead" wstr, wstr, var, int, var, int, int, var, int, var, var

; uint NetAuditWrite(uint type, byte* buf, uint numbytes, winmdroot.Foundation.PCWSTR service, byte* reserved)
#cfunc NetAuditWrite "NetAuditWrite" int, var, int, wstr, var

; uint NetConfigGet(winmdroot.Foundation.PCWSTR server, winmdroot.Foundation.PCWSTR component, winmdroot.Foundation.PCWSTR parameter, byte** bufptr)
#cfunc NetConfigGet "NetConfigGet" wstr, wstr, wstr, var

; uint NetConfigGetAll(winmdroot.Foundation.PCWSTR server, winmdroot.Foundation.PCWSTR component, byte** bufptr)
#cfunc NetConfigGetAll "NetConfigGetAll" wstr, wstr, var

; uint NetConfigSet(winmdroot.Foundation.PCWSTR server, winmdroot.Foundation.PCWSTR reserved1, winmdroot.Foundation.PCWSTR component, uint level, uint reserved2, byte* buf, uint reserved3)
#cfunc NetConfigSet "NetConfigSet" wstr, wstr, wstr, int, int, var, int

; uint NetErrorLogClear(winmdroot.Foundation.PCWSTR UncServerName, winmdroot.Foundation.PCWSTR BackupFile, [Optional] byte* Reserved)
#cfunc NetErrorLogClear "NetErrorLogClear" wstr, wstr, var

; uint NetErrorLogRead(winmdroot.Foundation.PCWSTR UncServerName, winmdroot.Foundation.PWSTR Reserved1, winmdroot.NetworkManagement.NetManagement.HLOG* ErrorLogHandle, uint Offset, [Optional] uint* Reserved2, uint Reserved3, uint OffsetFlag, byte** BufPtr, uint PrefMaxSize, uint* BytesRead, uint* TotalAvailable)
#cfunc NetErrorLogRead "NetErrorLogRead" wstr, wstr, var, int, var, int, int, var, int, var, var

; uint NetErrorLogWrite([Optional] byte* Reserved1, uint Code, winmdroot.Foundation.PCWSTR Component, byte* Buffer, uint NumBytes, byte* MsgBuf, uint StrCount, [Optional] byte* Reserved2)
#cfunc NetErrorLogWrite "NetErrorLogWrite" var, int, wstr, var, int, var, int, var

; uint NetMessageBufferSend(winmdroot.Foundation.PCWSTR servername, winmdroot.Foundation.PCWSTR msgname, winmdroot.Foundation.PCWSTR fromname, byte* buf, uint buflen)
#cfunc NetMessageBufferSend "NetMessageBufferSend" wstr, wstr, wstr, var, int

; uint NetMessageNameAdd(winmdroot.Foundation.PCWSTR servername, winmdroot.Foundation.PCWSTR msgname)
#cfunc NetMessageNameAdd "NetMessageNameAdd" wstr, wstr

; uint NetMessageNameDel(winmdroot.Foundation.PCWSTR servername, winmdroot.Foundation.PCWSTR msgname)
#cfunc NetMessageNameDel "NetMessageNameDel" wstr, wstr

; uint NetMessageNameEnum(winmdroot.Foundation.PCWSTR servername, uint level, byte** bufptr, uint prefmaxlen, uint* entriesread, uint* totalentries, uint* resume_handle)
#cfunc NetMessageNameEnum "NetMessageNameEnum" wstr, int, var, int, var, var, var

; uint NetMessageNameGetInfo(winmdroot.Foundation.PCWSTR servername, winmdroot.Foundation.PCWSTR msgname, uint level, byte** bufptr)
#cfunc NetMessageNameGetInfo "NetMessageNameGetInfo" wstr, wstr, int, var

; uint NetReplExportDirAdd(winmdroot.Foundation.PCWSTR servername, uint level, byte* buf, uint* parm_err)
#cfunc NetReplExportDirAdd "NetReplExportDirAdd" wstr, int, var, var

; uint NetReplExportDirDel(winmdroot.Foundation.PCWSTR servername, winmdroot.Foundation.PCWSTR dirname)
#cfunc NetReplExportDirDel "NetReplExportDirDel" wstr, wstr

; uint NetReplExportDirEnum(winmdroot.Foundation.PCWSTR servername, uint level, byte** bufptr, uint prefmaxlen, uint* entriesread, uint* totalentries, uint* resumehandle)
#cfunc NetReplExportDirEnum "NetReplExportDirEnum" wstr, int, var, int, var, var, var

; uint NetReplExportDirGetInfo(winmdroot.Foundation.PCWSTR servername, winmdroot.Foundation.PCWSTR dirname, uint level, byte** bufptr)
#cfunc NetReplExportDirGetInfo "NetReplExportDirGetInfo" wstr, wstr, int, var

; uint NetReplExportDirLock(winmdroot.Foundation.PCWSTR servername, winmdroot.Foundation.PCWSTR dirname)
#cfunc NetReplExportDirLock "NetReplExportDirLock" wstr, wstr

; uint NetReplExportDirSetInfo(winmdroot.Foundation.PCWSTR servername, winmdroot.Foundation.PCWSTR dirname, uint level, byte* buf, uint* parm_err)
#cfunc NetReplExportDirSetInfo "NetReplExportDirSetInfo" wstr, wstr, int, var, var

; uint NetReplExportDirUnlock(winmdroot.Foundation.PCWSTR servername, winmdroot.Foundation.PCWSTR dirname, uint unlockforce)
#cfunc NetReplExportDirUnlock "NetReplExportDirUnlock" wstr, wstr, int

; uint NetReplGetInfo(winmdroot.Foundation.PCWSTR servername, uint level, byte** bufptr)
#cfunc NetReplGetInfo "NetReplGetInfo" wstr, int, var

; uint NetReplImportDirAdd(winmdroot.Foundation.PCWSTR servername, uint level, byte* buf, uint* parm_err)
#cfunc NetReplImportDirAdd "NetReplImportDirAdd" wstr, int, var, var

; uint NetReplImportDirDel(winmdroot.Foundation.PCWSTR servername, winmdroot.Foundation.PCWSTR dirname)
#cfunc NetReplImportDirDel "NetReplImportDirDel" wstr, wstr

; uint NetReplImportDirEnum(winmdroot.Foundation.PCWSTR servername, uint level, byte** bufptr, uint prefmaxlen, uint* entriesread, uint* totalentries, uint* resumehandle)
#cfunc NetReplImportDirEnum "NetReplImportDirEnum" wstr, int, var, int, var, var, var

; uint NetReplImportDirGetInfo(winmdroot.Foundation.PCWSTR servername, winmdroot.Foundation.PCWSTR dirname, uint level, byte** bufptr)
#cfunc NetReplImportDirGetInfo "NetReplImportDirGetInfo" wstr, wstr, int, var

; uint NetReplImportDirLock(winmdroot.Foundation.PCWSTR servername, winmdroot.Foundation.PCWSTR dirname)
#cfunc NetReplImportDirLock "NetReplImportDirLock" wstr, wstr

; uint NetReplImportDirUnlock(winmdroot.Foundation.PCWSTR servername, winmdroot.Foundation.PCWSTR dirname, uint unlockforce)
#cfunc NetReplImportDirUnlock "NetReplImportDirUnlock" wstr, wstr, int

; uint NetReplSetInfo(winmdroot.Foundation.PCWSTR servername, uint level, byte* buf, uint* parm_err)
#cfunc NetReplSetInfo "NetReplSetInfo" wstr, int, var, var

; uint NetServerEnum(winmdroot.Foundation.PCWSTR servername, uint level, byte** bufptr, uint prefmaxlen, uint* entriesread, uint* totalentries, winmdroot.NetworkManagement.NetManagement.NET_SERVER_TYPE servertype, winmdroot.Foundation.PCWSTR domain, [Optional] uint* resume_handle)
#cfunc NetServerEnum "NetServerEnum" wstr, int, var, int, var, var, int, wstr, var

; uint NetServiceControl(winmdroot.Foundation.PCWSTR servername, winmdroot.Foundation.PCWSTR service, uint opcode, uint arg, byte** bufptr)
#cfunc NetServiceControl "NetServiceControl" wstr, wstr, int, int, var

; uint NetServiceEnum(winmdroot.Foundation.PCWSTR servername, uint level, byte** bufptr, uint prefmaxlen, uint* entriesread, uint* totalentries, [Optional] uint* resume_handle)
#cfunc NetServiceEnum "NetServiceEnum" wstr, int, var, int, var, var, var

; uint NetServiceGetInfo(winmdroot.Foundation.PCWSTR servername, winmdroot.Foundation.PCWSTR service, uint level, byte** bufptr)
#cfunc NetServiceGetInfo "NetServiceGetInfo" wstr, wstr, int, var

; uint NetServiceInstall(winmdroot.Foundation.PCWSTR servername, winmdroot.Foundation.PCWSTR service, uint argc, winmdroot.Foundation.PCWSTR* argv, byte** bufptr)
#cfunc NetServiceInstall "NetServiceInstall" wstr, wstr, int, var, var

; uint NetStatisticsGet(sbyte* ServerName, sbyte* Service, uint Level, uint Options, byte** Buffer)
#cfunc NetStatisticsGet "NetStatisticsGet" var, var, int, int, var

; uint NetWkstaGetInfo(winmdroot.Foundation.PWSTR servername, uint level, [Optional] byte** bufptr)
#cfunc NetWkstaGetInfo "NetWkstaGetInfo" wstr, int, var

; uint NetWkstaSetInfo(winmdroot.Foundation.PWSTR servername, uint level, byte* buffer, [Optional] uint* parm_err)
#cfunc NetWkstaSetInfo "NetWkstaSetInfo" wstr, int, var, var

#endif
