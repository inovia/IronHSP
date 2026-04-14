; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    wtsapi32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __wtsapi32_gen2_as__
#define __wtsapi32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "wtsapi32.dll"
; void WTSCloseServer(winmdroot.Foundation.HANDLE hServer)
#func WTSCloseServer "WTSCloseServer" intptr

; winmdroot.Foundation.BOOL WTSConnectSession(uint LogonId, uint TargetLogonId, winmdroot.Foundation.PWSTR pPassword, winmdroot.Foundation.BOOL bWait)
#cfunc WTSConnectSessionW "WTSConnectSessionW" int, int, wstr, int

; winmdroot.Foundation.BOOL WTSCreateListener(winmdroot.Foundation.HANDLE hServer, void* pReserved, uint Reserved, winmdroot.Foundation.PWSTR pListenerName, winmdroot.System.RemoteDesktop.WTSLISTENERCONFIGW* pBuffer, uint flag)
#cfunc WTSCreateListenerW "WTSCreateListenerW" intptr, intptr, int, wstr, var, int

; winmdroot.Foundation.BOOL WTSDisconnectSession(winmdroot.Foundation.HANDLE hServer, uint SessionId, winmdroot.Foundation.BOOL bWait)
#cfunc WTSDisconnectSession "WTSDisconnectSession" intptr, int, int

; winmdroot.Foundation.BOOL WTSEnableChildSessions(winmdroot.Foundation.BOOL bEnable)
#cfunc WTSEnableChildSessions "WTSEnableChildSessions" int

; winmdroot.Foundation.BOOL WTSEnumerateListeners(winmdroot.Foundation.HANDLE hServer, void* pReserved, uint Reserved, [Optional] ushort** pListeners, uint* pCount)
#cfunc WTSEnumerateListenersW "WTSEnumerateListenersW" intptr, intptr, int, var, var

; winmdroot.Foundation.BOOL WTSEnumerateProcesses(winmdroot.Foundation.HANDLE hServer, uint Reserved, uint Version, winmdroot.System.RemoteDesktop.WTS_PROCESS_INFOW** ppProcessInfo, uint* pCount)
#cfunc WTSEnumerateProcessesW "WTSEnumerateProcessesW" intptr, int, int, var, var

; winmdroot.Foundation.BOOL WTSEnumerateProcessesEx(winmdroot.Foundation.HANDLE hServer, uint* pLevel, uint SessionId, winmdroot.Foundation.PWSTR* ppProcessInfo, uint* pCount)
#cfunc WTSEnumerateProcessesExW "WTSEnumerateProcessesExW" intptr, var, int, var, var

; winmdroot.Foundation.BOOL WTSEnumerateServers(winmdroot.Foundation.PWSTR pDomainName, uint Reserved, uint Version, winmdroot.System.RemoteDesktop.WTS_SERVER_INFOW** ppServerInfo, uint* pCount)
#cfunc WTSEnumerateServersW "WTSEnumerateServersW" wstr, int, int, var, var

; winmdroot.Foundation.BOOL WTSEnumerateSessions(winmdroot.Foundation.HANDLE hServer, uint Reserved, uint Version, winmdroot.System.RemoteDesktop.WTS_SESSION_INFOW** ppSessionInfo, uint* pCount)
#cfunc WTSEnumerateSessionsW "WTSEnumerateSessionsW" intptr, int, int, var, var

; winmdroot.Foundation.BOOL WTSEnumerateSessionsEx(winmdroot.Foundation.HANDLE hServer, uint* pLevel, uint Filter, winmdroot.System.RemoteDesktop.WTS_SESSION_INFO_1W** ppSessionInfo, uint* pCount)
#cfunc WTSEnumerateSessionsExW "WTSEnumerateSessionsExW" intptr, var, int, var, var

; void WTSFreeMemory(void* pMemory)
#func WTSFreeMemory "WTSFreeMemory" intptr

; winmdroot.Foundation.BOOL WTSFreeMemoryEx(winmdroot.System.RemoteDesktop.WTS_TYPE_CLASS WTSTypeClass, void* pMemory, uint NumberOfEntries)
#cfunc WTSFreeMemoryExW "WTSFreeMemoryExW" int, intptr, int

; winmdroot.Foundation.BOOL WTSGetChildSessionId(uint* pSessionId)
#cfunc WTSGetChildSessionId "WTSGetChildSessionId" var

; winmdroot.Foundation.BOOL WTSGetListenerSecurity(winmdroot.Foundation.HANDLE hServer, void* pReserved, uint Reserved, winmdroot.Foundation.PWSTR pListenerName, winmdroot.Security.OBJECT_SECURITY_INFORMATION SecurityInformation, winmdroot.Security.PSECURITY_DESCRIPTOR pSecurityDescriptor, uint nLength, uint* lpnLengthNeeded)
#cfunc WTSGetListenerSecurityW "WTSGetListenerSecurityW" intptr, intptr, int, wstr, int, int, int, var

; winmdroot.Foundation.BOOL WTSIsChildSessionsEnabled(winmdroot.Foundation.BOOL* pbEnabled)
#cfunc WTSIsChildSessionsEnabled "WTSIsChildSessionsEnabled" var

; winmdroot.Foundation.BOOL WTSLogoffSession(winmdroot.Foundation.HANDLE hServer, uint SessionId, winmdroot.Foundation.BOOL bWait)
#cfunc WTSLogoffSession "WTSLogoffSession" intptr, int, int

; winmdroot.Foundation.HANDLE WTSOpenServerW(winmdroot.Foundation.PWSTR pServerName)
#cfunc WTSOpenServerW "WTSOpenServerW" wstr

; winmdroot.Foundation.HANDLE WTSOpenServerExW(winmdroot.Foundation.PWSTR pServerName)
#cfunc WTSOpenServerExW "WTSOpenServerExW" wstr

; winmdroot.Foundation.BOOL WTSQueryListenerConfig(winmdroot.Foundation.HANDLE hServer, void* pReserved, uint Reserved, winmdroot.Foundation.PWSTR pListenerName, winmdroot.System.RemoteDesktop.WTSLISTENERCONFIGW* pBuffer)
#cfunc WTSQueryListenerConfigW "WTSQueryListenerConfigW" intptr, intptr, int, wstr, var

; winmdroot.Foundation.BOOL WTSQuerySessionInformation(winmdroot.Foundation.HANDLE hServer, uint SessionId, winmdroot.System.RemoteDesktop.WTS_INFO_CLASS WTSInfoClass, winmdroot.Foundation.PWSTR* ppBuffer, uint* pBytesReturned)
#cfunc WTSQuerySessionInformationW "WTSQuerySessionInformationW" intptr, int, int, var, var

; winmdroot.Foundation.BOOL WTSQueryUserConfig(winmdroot.Foundation.PWSTR pServerName, winmdroot.Foundation.PWSTR pUserName, winmdroot.System.RemoteDesktop.WTS_CONFIG_CLASS WTSConfigClass, winmdroot.Foundation.PWSTR* ppBuffer, uint* pBytesReturned)
#cfunc WTSQueryUserConfigW "WTSQueryUserConfigW" wstr, wstr, int, var, var

; winmdroot.Foundation.BOOL WTSQueryUserToken(uint SessionId, winmdroot.Foundation.HANDLE* phToken)
#cfunc WTSQueryUserToken "WTSQueryUserToken" int, intptr

; winmdroot.Foundation.BOOL WTSRegisterSessionNotification(winmdroot.Foundation.HWND hWnd, uint dwFlags)
#cfunc WTSRegisterSessionNotification "WTSRegisterSessionNotification" intptr, int

; winmdroot.Foundation.BOOL WTSRegisterSessionNotificationEx(winmdroot.Foundation.HANDLE hServer, winmdroot.Foundation.HWND hWnd, uint dwFlags)
#cfunc WTSRegisterSessionNotificationEx "WTSRegisterSessionNotificationEx" intptr, intptr, int

; winmdroot.Foundation.BOOL WTSSendMessage(winmdroot.Foundation.HANDLE hServer, uint SessionId, winmdroot.Foundation.PWSTR pTitle, uint TitleLength, winmdroot.Foundation.PWSTR pMessage, uint MessageLength, winmdroot.UI.WindowsAndMessaging.MESSAGEBOX_STYLE Style, uint Timeout, winmdroot.UI.WindowsAndMessaging.MESSAGEBOX_RESULT* pResponse, winmdroot.Foundation.BOOL bWait)
#cfunc WTSSendMessageW "WTSSendMessageW" intptr, int, wstr, int, wstr, int, int, int, var, int

; winmdroot.Foundation.BOOL WTSSetListenerSecurity(winmdroot.Foundation.HANDLE hServer, void* pReserved, uint Reserved, winmdroot.Foundation.PWSTR pListenerName, winmdroot.Security.OBJECT_SECURITY_INFORMATION SecurityInformation, winmdroot.Security.PSECURITY_DESCRIPTOR pSecurityDescriptor)
#cfunc WTSSetListenerSecurityW "WTSSetListenerSecurityW" intptr, intptr, int, wstr, int, int

; winmdroot.Foundation.HRESULT WTSSetRenderHint(ulong* pRenderHintID, winmdroot.Foundation.HWND hwndOwner, uint renderHintType, uint cbHintDataLength, [Optional] byte* pHintData)
#cfunc WTSSetRenderHint "WTSSetRenderHint" var, intptr, int, int, var

; winmdroot.Foundation.BOOL WTSSetUserConfig(winmdroot.Foundation.PWSTR pServerName, winmdroot.Foundation.PWSTR pUserName, winmdroot.System.RemoteDesktop.WTS_CONFIG_CLASS WTSConfigClass, winmdroot.Foundation.PWSTR pBuffer, uint DataLength)
#cfunc WTSSetUserConfigW "WTSSetUserConfigW" wstr, wstr, int, wstr, int

; winmdroot.Foundation.BOOL WTSShutdownSystem(winmdroot.Foundation.HANDLE hServer, uint ShutdownFlag)
#cfunc WTSShutdownSystem "WTSShutdownSystem" intptr, int

; winmdroot.Foundation.BOOL WTSStartRemoteControlSession(winmdroot.Foundation.PWSTR pTargetServerName, uint TargetLogonId, byte HotkeyVk, ushort HotkeyModifiers)
#cfunc WTSStartRemoteControlSessionW "WTSStartRemoteControlSessionW" wstr, int, int, int

; winmdroot.Foundation.BOOL WTSStopRemoteControlSession(uint LogonId)
#cfunc WTSStopRemoteControlSession "WTSStopRemoteControlSession" int

; winmdroot.Foundation.BOOL WTSTerminateProcess(winmdroot.Foundation.HANDLE hServer, uint ProcessId, uint ExitCode)
#cfunc WTSTerminateProcess "WTSTerminateProcess" intptr, int, int

; winmdroot.Foundation.BOOL WTSUnRegisterSessionNotification(winmdroot.Foundation.HWND hWnd)
#cfunc WTSUnRegisterSessionNotification "WTSUnRegisterSessionNotification" intptr

; winmdroot.Foundation.BOOL WTSUnRegisterSessionNotificationEx(winmdroot.Foundation.HANDLE hServer, winmdroot.Foundation.HWND hWnd)
#cfunc WTSUnRegisterSessionNotificationEx "WTSUnRegisterSessionNotificationEx" intptr, intptr

; winmdroot.Foundation.BOOL WTSVirtualChannelClose(winmdroot.Foundation.HANDLE hChannelHandle)
#cfunc WTSVirtualChannelClose "WTSVirtualChannelClose" intptr

; winmdroot.Foundation.HANDLE WTSVirtualChannelOpen(winmdroot.Foundation.HANDLE hServer, uint SessionId, winmdroot.Foundation.PSTR pVirtualName)
#cfunc WTSVirtualChannelOpen "WTSVirtualChannelOpen" intptr, int, str

; winmdroot.Foundation.HANDLE WTSVirtualChannelOpenEx(uint SessionId, winmdroot.Foundation.PSTR pVirtualName, uint flags)
#cfunc WTSVirtualChannelOpenEx "WTSVirtualChannelOpenEx" int, str, int

; winmdroot.Foundation.BOOL WTSVirtualChannelPurgeInput(winmdroot.Foundation.HANDLE hChannelHandle)
#cfunc WTSVirtualChannelPurgeInput "WTSVirtualChannelPurgeInput" intptr

; winmdroot.Foundation.BOOL WTSVirtualChannelPurgeOutput(winmdroot.Foundation.HANDLE hChannelHandle)
#cfunc WTSVirtualChannelPurgeOutput "WTSVirtualChannelPurgeOutput" intptr

; winmdroot.Foundation.BOOL WTSVirtualChannelQuery(winmdroot.Foundation.HANDLE hChannelHandle, winmdroot.System.RemoteDesktop.WTS_VIRTUAL_CLASS param1, void** ppBuffer, uint* pBytesReturned)
#cfunc WTSVirtualChannelQuery "WTSVirtualChannelQuery" intptr, int, var, var

; winmdroot.Foundation.BOOL WTSVirtualChannelRead(winmdroot.Foundation.HANDLE hChannelHandle, uint TimeOut, winmdroot.Foundation.PSTR Buffer, uint BufferSize, uint* pBytesRead)
#cfunc WTSVirtualChannelRead "WTSVirtualChannelRead" intptr, int, str, int, var

; winmdroot.Foundation.BOOL WTSVirtualChannelWrite(winmdroot.Foundation.HANDLE hChannelHandle, winmdroot.Foundation.PSTR Buffer, uint Length, uint* pBytesWritten)
#cfunc WTSVirtualChannelWrite "WTSVirtualChannelWrite" intptr, str, int, var

; winmdroot.Foundation.BOOL WTSWaitSystemEvent(winmdroot.Foundation.HANDLE hServer, uint EventMask, uint* pEventFlags)
#cfunc WTSWaitSystemEvent "WTSWaitSystemEvent" intptr, int, var

#endif
