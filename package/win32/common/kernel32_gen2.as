; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    kernel32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __kernel32_gen2_as__
#define global __kernel32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "kernel32.dll"
; winmdroot.Foundation.BOOL CloseHandle(winmdroot.Foundation.HANDLE hObject)
#cfunc global CloseHandle "CloseHandle" intptr

; winmdroot.Foundation.BOOL ActivateActCtx(winmdroot.Foundation.HANDLE hActCtx, nuint* lpCookie)
#cfunc global ActivateActCtx "ActivateActCtx" intptr, var

; ushort AddAtom(winmdroot.Foundation.PCWSTR lpString)
#cfunc global AddAtomW "AddAtomW" wstr

; winmdroot.Foundation.BOOL AddConsoleAlias(winmdroot.Foundation.PWSTR Source, winmdroot.Foundation.PWSTR Target, winmdroot.Foundation.PWSTR ExeName)
#cfunc global AddConsoleAliasW "AddConsoleAliasW" wstr, wstr, wstr

; winmdroot.Foundation.BOOL AddIntegrityLabelToBoundaryDescriptor(winmdroot.Foundation.HANDLE* BoundaryDescriptor, winmdroot.Security.PSID IntegrityLabel)
#cfunc global AddIntegrityLabelToBoundaryDescriptor "AddIntegrityLabelToBoundaryDescriptor" intptr, int

; void AddRefActCtx(winmdroot.Foundation.HANDLE hActCtx)
#func global AddRefActCtx "AddRefActCtx" intptr

; winmdroot.Foundation.BOOL AddResourceAttributeAce(winmdroot.Security.ACL* pAcl, winmdroot.Security.ACE_REVISION dwAceRevision, winmdroot.Security.ACE_FLAGS AceFlags, uint AccessMask, winmdroot.Security.PSID pSid, winmdroot.Security.CLAIM_SECURITY_ATTRIBUTES_INFORMATION* pAttributeInfo, uint* pReturnLength)
#cfunc global AddResourceAttributeAce "AddResourceAttributeAce" var, int, int, int, int, var, var

; winmdroot.Foundation.BOOL AddSIDToBoundaryDescriptor(winmdroot.Foundation.HANDLE* BoundaryDescriptor, winmdroot.Security.PSID RequiredSid)
#cfunc global AddSIDToBoundaryDescriptor "AddSIDToBoundaryDescriptor" intptr, int

; winmdroot.Foundation.BOOL AddScopedPolicyIDAce(winmdroot.Security.ACL* pAcl, winmdroot.Security.ACE_REVISION dwAceRevision, winmdroot.Security.ACE_FLAGS AceFlags, uint AccessMask, winmdroot.Security.PSID pSid)
#cfunc global AddScopedPolicyIDAce "AddScopedPolicyIDAce" var, int, int, int, int

; winmdroot.Foundation.BOOL AddSecureMemoryCacheCallback(delegate *unmanaged[Stdcall]<void*,nuint,global::Windows.Win32.Foundation.BOOLEAN> pfnCallBack)
#cfunc global AddSecureMemoryCacheCallback "AddSecureMemoryCacheCallback" int

; winmdroot.Foundation.BOOL AdjustCalendarDate(winmdroot.Globalization.CALDATETIME* lpCalDateTime, winmdroot.Globalization.CALDATETIME_DATEUNIT calUnit, int amount)
#cfunc global AdjustCalendarDate "AdjustCalendarDate" var, int, int

; winmdroot.Foundation.BOOL AllocConsole()
#cfunc global AllocConsole "AllocConsole"

; winmdroot.Foundation.BOOL AllocateUserPhysicalPages(winmdroot.Foundation.HANDLE hProcess, nuint* NumberOfPages, nuint* PageArray)
#cfunc global AllocateUserPhysicalPages "AllocateUserPhysicalPages" intptr, var, var

; winmdroot.Foundation.BOOL AllocateUserPhysicalPagesNuma(winmdroot.Foundation.HANDLE hProcess, nuint* NumberOfPages, nuint* PageArray, uint nndPreferred)
#cfunc global AllocateUserPhysicalPagesNuma "AllocateUserPhysicalPagesNuma" intptr, var, var, int

; void ApplicationRecoveryFinished(winmdroot.Foundation.BOOL bSuccess)
#func global ApplicationRecoveryFinished "ApplicationRecoveryFinished" int

; winmdroot.Foundation.HRESULT ApplicationRecoveryInProgress(winmdroot.Foundation.BOOL* pbCancelled)
#cfunc global ApplicationRecoveryInProgress "ApplicationRecoveryInProgress" var

; winmdroot.Foundation.BOOL AreFileApisANSI()
#cfunc global AreFileApisANSI "AreFileApisANSI"

; winmdroot.Foundation.BOOL AssignProcessToJobObject(winmdroot.Foundation.HANDLE hJob, winmdroot.Foundation.HANDLE hProcess)
#cfunc global AssignProcessToJobObject "AssignProcessToJobObject" intptr, intptr

; winmdroot.Foundation.BOOL AttachConsole(uint dwProcessId)
#cfunc global AttachConsole "AttachConsole" int

; winmdroot.Foundation.BOOL BackupRead(winmdroot.Foundation.HANDLE hFile, byte* lpBuffer, uint nNumberOfBytesToRead, uint* lpNumberOfBytesRead, winmdroot.Foundation.BOOL bAbort, winmdroot.Foundation.BOOL bProcessSecurity, void** lpContext)
#cfunc global BackupRead "BackupRead" intptr, var, int, var, int, int, var

; winmdroot.Foundation.BOOL BackupSeek(winmdroot.Foundation.HANDLE hFile, uint dwLowBytesToSeek, uint dwHighBytesToSeek, uint* lpdwLowByteSeeked, uint* lpdwHighByteSeeked, void** lpContext)
#cfunc global BackupSeek "BackupSeek" intptr, int, int, var, var, var

; winmdroot.Foundation.BOOL BackupWrite(winmdroot.Foundation.HANDLE hFile, byte* lpBuffer, uint nNumberOfBytesToWrite, uint* lpNumberOfBytesWritten, winmdroot.Foundation.BOOL bAbort, winmdroot.Foundation.BOOL bProcessSecurity, void** lpContext)
#cfunc global BackupWrite "BackupWrite" intptr, var, int, var, int, int, var

; winmdroot.Foundation.BOOL Beep(uint dwFreq, uint dwDuration)
#cfunc global Beep "Beep" int, int

; winmdroot.Foundation.HANDLE BeginUpdateResource(winmdroot.Foundation.PCWSTR pFileName, winmdroot.Foundation.BOOL bDeleteExistingResources)
#cfunc global BeginUpdateResourceW "BeginUpdateResourceW" wstr, int

; winmdroot.Foundation.BOOL BindIoCompletionCallback(winmdroot.Foundation.HANDLE FileHandle, delegate *unmanaged[Stdcall]<uint,uint,global::System.Threading.NativeOverlapped*,void> Function, uint Flags)
#cfunc global BindIoCompletionCallback "BindIoCompletionCallback" intptr, int, int

; winmdroot.Foundation.BOOL BuildCommDCBA(winmdroot.Foundation.PCSTR lpDef, winmdroot.Devices.Communication.DCB* lpDCB)
#cfunc global BuildCommDCBA "BuildCommDCBA" str, var

; winmdroot.Foundation.BOOL BuildCommDCBAndTimeouts(winmdroot.Foundation.PCWSTR lpDef, winmdroot.Devices.Communication.DCB* lpDCB, winmdroot.Devices.Communication.COMMTIMEOUTS* lpCommTimeouts)
#cfunc global BuildCommDCBAndTimeoutsW "BuildCommDCBAndTimeoutsW" wstr, var, var

; winmdroot.Foundation.BOOL BuildCommDCBW(winmdroot.Foundation.PCWSTR lpDef, winmdroot.Devices.Communication.DCB* lpDCB)
#cfunc global BuildCommDCBW "BuildCommDCBW" wstr, var

; winmdroot.Foundation.BOOL CallNamedPipeW(winmdroot.Foundation.PCWSTR lpNamedPipeName, [Optional] void* lpInBuffer, uint nInBufferSize, [Optional] void* lpOutBuffer, uint nOutBufferSize, uint* lpBytesRead, uint nTimeOut)
#cfunc global CallNamedPipeW "CallNamedPipeW" wstr, intptr, int, intptr, int, var, int

; winmdroot.Foundation.BOOL CallbackMayRunLong(winmdroot.System.Threading.PTP_CALLBACK_INSTANCE pci)
#cfunc global CallbackMayRunLong "CallbackMayRunLong" intptr

; winmdroot.Foundation.BOOL CancelDeviceWakeupRequest(winmdroot.Foundation.HANDLE hDevice)
#cfunc global CancelDeviceWakeupRequest "CancelDeviceWakeupRequest" intptr

; winmdroot.Foundation.BOOL CancelIo(winmdroot.Foundation.HANDLE hFile)
#cfunc global CancelIo "CancelIo" intptr

; winmdroot.Foundation.BOOL CancelIoEx(winmdroot.Foundation.HANDLE hFile, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped)
#cfunc global CancelIoEx "CancelIoEx" intptr, var

; winmdroot.Foundation.BOOL CancelSynchronousIo(winmdroot.Foundation.HANDLE hThread)
#cfunc global CancelSynchronousIo "CancelSynchronousIo" intptr

; winmdroot.Foundation.BOOL CancelTimerQueueTimer(winmdroot.Foundation.HANDLE TimerQueue, winmdroot.Foundation.HANDLE Timer)
#cfunc global CancelTimerQueueTimer "CancelTimerQueueTimer" intptr, intptr

; winmdroot.Foundation.BOOL CancelWaitableTimer(winmdroot.Foundation.HANDLE hTimer)
#cfunc global CancelWaitableTimer "CancelWaitableTimer" intptr

; winmdroot.Foundation.BOOL ChangeTimerQueueTimer(winmdroot.Foundation.HANDLE TimerQueue, winmdroot.Foundation.HANDLE Timer, uint DueTime, uint Period)
#cfunc global ChangeTimerQueueTimer "ChangeTimerQueueTimer" intptr, intptr, int, int

; winmdroot.Foundation.BOOL CheckNameLegalDOS8Dot3A(winmdroot.Foundation.PCSTR lpName, winmdroot.Foundation.PSTR lpOemName, uint OemNameSize, [Optional] winmdroot.Foundation.BOOL* pbNameContainsSpaces, winmdroot.Foundation.BOOL* pbNameLegal)
#cfunc global CheckNameLegalDOS8Dot3A "CheckNameLegalDOS8Dot3A" str, str, int, var, var

; winmdroot.Foundation.BOOL CheckNameLegalDOS8Dot3W(winmdroot.Foundation.PCWSTR lpName, winmdroot.Foundation.PSTR lpOemName, uint OemNameSize, [Optional] winmdroot.Foundation.BOOL* pbNameContainsSpaces, winmdroot.Foundation.BOOL* pbNameLegal)
#cfunc global CheckNameLegalDOS8Dot3W "CheckNameLegalDOS8Dot3W" wstr, str, int, var, var

; winmdroot.Foundation.BOOL CheckRemoteDebuggerPresent(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.BOOL* pbDebuggerPresent)
#cfunc global CheckRemoteDebuggerPresent "CheckRemoteDebuggerPresent" intptr, var

; winmdroot.Foundation.BOOL CheckTokenCapability(winmdroot.Foundation.HANDLE TokenHandle, winmdroot.Security.PSID CapabilitySidToCheck, winmdroot.Foundation.BOOL* HasCapability)
#cfunc global CheckTokenCapability "CheckTokenCapability" intptr, int, var

; winmdroot.Foundation.BOOL CheckTokenMembershipEx(winmdroot.Foundation.HANDLE TokenHandle, winmdroot.Security.PSID SidToCheck, uint Flags, winmdroot.Foundation.BOOL* IsMember)
#cfunc global CheckTokenMembershipEx "CheckTokenMembershipEx" intptr, int, int, var

; winmdroot.Foundation.BOOL ClearCommBreak(winmdroot.Foundation.HANDLE hFile)
#cfunc global ClearCommBreak "ClearCommBreak" intptr

; winmdroot.Foundation.BOOL ClearCommError(winmdroot.Foundation.HANDLE hFile, [Optional] winmdroot.Devices.Communication.CLEAR_COMM_ERROR_FLAGS* lpErrors, [Optional] winmdroot.Devices.Communication.COMSTAT* lpStat)
#cfunc global ClearCommError "ClearCommError" intptr, var, var

; winmdroot.Foundation.BOOLEAN ClosePrivateNamespace(winmdroot.Foundation.HANDLE Handle, uint Flags)
#cfunc global ClosePrivateNamespace "ClosePrivateNamespace" intptr, int

; void ClosePseudoConsole(winmdroot.System.Console.HPCON hPC)
#func global ClosePseudoConsole "ClosePseudoConsole" intptr

; winmdroot.Foundation.BOOL CommConfigDialog(winmdroot.Foundation.PCWSTR lpszName, winmdroot.Foundation.HWND hWnd, winmdroot.Devices.Communication.COMMCONFIG* lpCC)
#cfunc global CommConfigDialogW "CommConfigDialogW" wstr, intptr, var

; int CompareFileTime(global::System.Runtime.InteropServices.ComTypes.FILETIME* lpFileTime1, global::System.Runtime.InteropServices.ComTypes.FILETIME* lpFileTime2)
#cfunc global CompareFileTime "CompareFileTime" var, var

; winmdroot.Globalization.COMPARESTRING_RESULT CompareStringW(uint Locale, uint dwCmpFlags, winmdroot.Foundation.PCWSTR lpString1, int cchCount1, winmdroot.Foundation.PCWSTR lpString2, int cchCount2)
#cfunc global CompareStringW "CompareStringW" int, int, wstr, int, wstr, int

; winmdroot.Globalization.COMPARESTRING_RESULT CompareStringEx(winmdroot.Foundation.PCWSTR lpLocaleName, winmdroot.Globalization.COMPARE_STRING_FLAGS dwCmpFlags, winmdroot.Foundation.PCWSTR lpString1, int cchCount1, winmdroot.Foundation.PCWSTR lpString2, int cchCount2, [Optional] winmdroot.Globalization.NLSVERSIONINFO* lpVersionInformation, [Optional] void* lpReserved, winmdroot.Foundation.LPARAM lParam)
#cfunc global CompareStringEx "CompareStringEx" wstr, int, wstr, int, wstr, int, var, intptr, intptr

; winmdroot.Globalization.COMPARESTRING_RESULT CompareStringOrdinal(winmdroot.Foundation.PCWSTR lpString1, int cchCount1, winmdroot.Foundation.PCWSTR lpString2, int cchCount2, winmdroot.Foundation.BOOL bIgnoreCase)
#cfunc global CompareStringOrdinal "CompareStringOrdinal" wstr, int, wstr, int, int

; winmdroot.Foundation.BOOL ConnectNamedPipe(winmdroot.Foundation.HANDLE hNamedPipe, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped)
#cfunc global ConnectNamedPipe "ConnectNamedPipe" intptr, var

; winmdroot.Foundation.BOOL ContinueDebugEvent(uint dwProcessId, uint dwThreadId, winmdroot.Foundation.NTSTATUS dwContinueStatus)
#cfunc global ContinueDebugEvent "ContinueDebugEvent" int, int, intptr

; winmdroot.Foundation.BOOL ConvertCalDateTimeToSystemTime(winmdroot.Globalization.CALDATETIME* lpCalDateTime, winmdroot.Foundation.SYSTEMTIME* lpSysTime)
#cfunc global ConvertCalDateTimeToSystemTime "ConvertCalDateTimeToSystemTime" var, var

; uint ConvertDefaultLocale(uint Locale)
#cfunc global ConvertDefaultLocale "ConvertDefaultLocale" int

; winmdroot.Foundation.BOOL ConvertFiberToThread()
#cfunc global ConvertFiberToThread "ConvertFiberToThread"

; winmdroot.Foundation.BOOL ConvertSystemTimeToCalDateTime(winmdroot.Foundation.SYSTEMTIME* lpSysTime, uint calId, winmdroot.Globalization.CALDATETIME* lpCalDateTime)
#cfunc global ConvertSystemTimeToCalDateTime "ConvertSystemTimeToCalDateTime" var, int, var

; void* ConvertThreadToFiber([Optional] void* lpParameter)
#cfunc global ConvertThreadToFiber "ConvertThreadToFiber" intptr

; void* ConvertThreadToFiberEx([Optional] void* lpParameter, uint dwFlags)
#cfunc global ConvertThreadToFiberEx "ConvertThreadToFiberEx" intptr, int

; winmdroot.Foundation.BOOL CopyFile(winmdroot.Foundation.PCWSTR lpExistingFileName, winmdroot.Foundation.PCWSTR lpNewFileName, winmdroot.Foundation.BOOL bFailIfExists)
#cfunc global CopyFileW "CopyFileW" wstr, wstr, int

; winmdroot.Foundation.HRESULT CopyFile2(winmdroot.Foundation.PCWSTR pwszExistingFileName, winmdroot.Foundation.PCWSTR pwszNewFileName, [Optional] winmdroot.Storage.FileSystem.COPYFILE2_EXTENDED_PARAMETERS* pExtendedParameters)
#cfunc global CopyFile2 "CopyFile2" wstr, wstr, var

; winmdroot.Foundation.BOOL CopyFileEx(winmdroot.Foundation.PCWSTR lpExistingFileName, winmdroot.Foundation.PCWSTR lpNewFileName, delegate *unmanaged[Stdcall]<long,long,long,long,uint,global::Windows.Win32.Storage.FileSystem.LPPROGRESS_ROUTINE_CALLBACK_REASON,global::Windows.Win32.Foundation.HANDLE,global::Windows.Win32.Foundation.HANDLE,void*,uint> lpProgressRoutine, [Optional] void* lpData, [Optional] winmdroot.Foundation.BOOL* pbCancel, uint dwCopyFlags)
#cfunc global CopyFileExW "CopyFileExW" wstr, wstr, int, intptr, var, int

; winmdroot.Foundation.BOOL CopyFileTransacted(winmdroot.Foundation.PCWSTR lpExistingFileName, winmdroot.Foundation.PCWSTR lpNewFileName, delegate *unmanaged[Stdcall]<long,long,long,long,uint,global::Windows.Win32.Storage.FileSystem.LPPROGRESS_ROUTINE_CALLBACK_REASON,global::Windows.Win32.Foundation.HANDLE,global::Windows.Win32.Foundation.HANDLE,void*,uint> lpProgressRoutine, [Optional] void* lpData, [Optional] winmdroot.Foundation.BOOL* pbCancel, uint dwCopyFlags, winmdroot.Foundation.HANDLE hTransaction)
#cfunc global CopyFileTransactedW "CopyFileTransactedW" wstr, wstr, int, intptr, var, int, intptr

; int CopyLZFile(int hfSource, int hfDest)
#cfunc global CopyLZFile "CopyLZFile" int, int

; winmdroot.Foundation.BOOL FreeLibrary(winmdroot.Foundation.HMODULE hLibModule)
#cfunc global FreeLibrary "FreeLibrary" intptr

; winmdroot.Foundation.HANDLE CreateActCtx(winmdroot.System.ApplicationInstallationAndServicing.ACTCTXW* pActCtx)
#cfunc global CreateActCtxW "CreateActCtxW" var

; winmdroot.Foundation.HANDLE CreateBoundaryDescriptorW(winmdroot.Foundation.PCWSTR Name, uint Flags)
#cfunc global CreateBoundaryDescriptorW "CreateBoundaryDescriptorW" wstr, int

; winmdroot.Foundation.HANDLE CreateConsoleScreenBuffer(uint dwDesiredAccess, uint dwShareMode, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes, uint dwFlags, [Optional] void* lpScreenBufferData)
#cfunc global CreateConsoleScreenBuffer "CreateConsoleScreenBuffer" int, int, var, int, intptr

; winmdroot.Foundation.BOOL CreateDirectory(winmdroot.Foundation.PCWSTR lpPathName, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes)
#cfunc global CreateDirectoryW "CreateDirectoryW" wstr, var

; winmdroot.Foundation.BOOL CreateDirectoryEx(winmdroot.Foundation.PCWSTR lpTemplateDirectory, winmdroot.Foundation.PCWSTR lpNewDirectory, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes)
#cfunc global CreateDirectoryExW "CreateDirectoryExW" wstr, wstr, var

; winmdroot.Foundation.BOOL CreateDirectoryTransacted(winmdroot.Foundation.PCWSTR lpTemplateDirectory, winmdroot.Foundation.PCWSTR lpNewDirectory, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes, winmdroot.Foundation.HANDLE hTransaction)
#cfunc global CreateDirectoryTransactedW "CreateDirectoryTransactedW" wstr, wstr, var, intptr

; winmdroot.Foundation.HANDLE CreateEvent([Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpEventAttributes, winmdroot.Foundation.BOOL bManualReset, winmdroot.Foundation.BOOL bInitialState, winmdroot.Foundation.PCWSTR lpName)
#cfunc global CreateEventW "CreateEventW" var, int, int, wstr

; winmdroot.Foundation.HANDLE CreateEventEx([Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpEventAttributes, winmdroot.Foundation.PCWSTR lpName, winmdroot.System.Threading.CREATE_EVENT dwFlags, uint dwDesiredAccess)
#cfunc global CreateEventExW "CreateEventExW" var, wstr, int, int

; void* CreateFiber(nuint dwStackSize, delegate *unmanaged[Stdcall]<void*,void> lpStartAddress, [Optional] void* lpParameter)
#cfunc global CreateFiber "CreateFiber" int, int, intptr

; void* CreateFiberEx(nuint dwStackCommitSize, nuint dwStackReserveSize, uint dwFlags, delegate *unmanaged[Stdcall]<void*,void> lpStartAddress, [Optional] void* lpParameter)
#cfunc global CreateFiberEx "CreateFiberEx" int, int, int, int, intptr

; winmdroot.Foundation.HANDLE CreateFile(winmdroot.Foundation.PCWSTR lpFileName, uint dwDesiredAccess, winmdroot.Storage.FileSystem.FILE_SHARE_MODE dwShareMode, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes, winmdroot.Storage.FileSystem.FILE_CREATION_DISPOSITION dwCreationDisposition, winmdroot.Storage.FileSystem.FILE_FLAGS_AND_ATTRIBUTES dwFlagsAndAttributes, winmdroot.Foundation.HANDLE hTemplateFile)
#cfunc global CreateFileW "CreateFileW" wstr, int, int, var, int, int, intptr

; winmdroot.Foundation.HANDLE CreateFile2(winmdroot.Foundation.PCWSTR lpFileName, uint dwDesiredAccess, winmdroot.Storage.FileSystem.FILE_SHARE_MODE dwShareMode, winmdroot.Storage.FileSystem.FILE_CREATION_DISPOSITION dwCreationDisposition, [Optional] winmdroot.Storage.FileSystem.CREATEFILE2_EXTENDED_PARAMETERS* pCreateExParams)
#cfunc global CreateFile2 "CreateFile2" wstr, int, int, int, var

; winmdroot.Foundation.HANDLE CreateFileMapping(winmdroot.Foundation.HANDLE hFile, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpFileMappingAttributes, winmdroot.System.Memory.PAGE_PROTECTION_FLAGS flProtect, uint dwMaximumSizeHigh, uint dwMaximumSizeLow, winmdroot.Foundation.PCWSTR lpName)
#cfunc global CreateFileMappingW "CreateFileMappingW" intptr, var, int, int, int, wstr

; winmdroot.Foundation.HANDLE CreateFileMappingNuma(winmdroot.Foundation.HANDLE hFile, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpFileMappingAttributes, winmdroot.System.Memory.PAGE_PROTECTION_FLAGS flProtect, uint dwMaximumSizeHigh, uint dwMaximumSizeLow, winmdroot.Foundation.PCWSTR lpName, uint nndPreferred)
#cfunc global CreateFileMappingNumaW "CreateFileMappingNumaW" intptr, var, int, int, int, wstr, int

; winmdroot.Foundation.HANDLE CreateFileTransacted(winmdroot.Foundation.PCWSTR lpFileName, uint dwDesiredAccess, winmdroot.Storage.FileSystem.FILE_SHARE_MODE dwShareMode, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes, winmdroot.Storage.FileSystem.FILE_CREATION_DISPOSITION dwCreationDisposition, winmdroot.Storage.FileSystem.FILE_FLAGS_AND_ATTRIBUTES dwFlagsAndAttributes, winmdroot.Foundation.HANDLE hTemplateFile, winmdroot.Foundation.HANDLE hTransaction, [Optional] winmdroot.Storage.FileSystem.TXFS_MINIVERSION* pusMiniVersion, [Optional] void* lpExtendedParameter)
#cfunc global CreateFileTransactedW "CreateFileTransactedW" wstr, int, int, var, int, int, intptr, intptr, var, intptr

; winmdroot.Foundation.BOOL CreateHardLink(winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Foundation.PCWSTR lpExistingFileName, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes)
#cfunc global CreateHardLinkW "CreateHardLinkW" wstr, wstr, var

; winmdroot.Foundation.BOOL CreateHardLinkTransacted(winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Foundation.PCWSTR lpExistingFileName, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes, winmdroot.Foundation.HANDLE hTransaction)
#cfunc global CreateHardLinkTransactedW "CreateHardLinkTransactedW" wstr, wstr, var, intptr

; winmdroot.Foundation.HANDLE CreateIoCompletionPort(winmdroot.Foundation.HANDLE FileHandle, winmdroot.Foundation.HANDLE ExistingCompletionPort, nuint CompletionKey, uint NumberOfConcurrentThreads)
#cfunc global CreateIoCompletionPort "CreateIoCompletionPort" intptr, intptr, int, int

; winmdroot.Foundation.HANDLE CreateJobObject([Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpJobAttributes, winmdroot.Foundation.PCWSTR lpName)
#cfunc global CreateJobObjectW "CreateJobObjectW" var, wstr

; winmdroot.Foundation.BOOL CreateJobSet(uint NumJob, winmdroot.System.JobObjects.JOB_SET_ARRAY* UserJobSet, uint Flags)
#cfunc global CreateJobSet "CreateJobSet" int, var, int

; winmdroot.Foundation.HANDLE CreateMailslot(winmdroot.Foundation.PCWSTR lpName, uint nMaxMessageSize, uint lReadTimeout, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes)
#cfunc global CreateMailslotW "CreateMailslotW" wstr, int, int, var

; winmdroot.Foundation.HANDLE CreateMemoryResourceNotification(winmdroot.System.Memory.MEMORY_RESOURCE_NOTIFICATION_TYPE NotificationType)
#cfunc global CreateMemoryResourceNotification "CreateMemoryResourceNotification" int

; winmdroot.Foundation.HANDLE CreateMutex([Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpMutexAttributes, winmdroot.Foundation.BOOL bInitialOwner, winmdroot.Foundation.PCWSTR lpName)
#cfunc global CreateMutexW "CreateMutexW" var, int, wstr

; winmdroot.Foundation.HANDLE CreateMutexEx([Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpMutexAttributes, winmdroot.Foundation.PCWSTR lpName, uint dwFlags, uint dwDesiredAccess)
#cfunc global CreateMutexExW "CreateMutexExW" var, wstr, int, int

; winmdroot.Foundation.HANDLE CreateNamedPipeW(winmdroot.Foundation.PCWSTR lpName, winmdroot.Storage.FileSystem.FILE_FLAGS_AND_ATTRIBUTES dwOpenMode, winmdroot.System.Pipes.NAMED_PIPE_MODE dwPipeMode, uint nMaxInstances, uint nOutBufferSize, uint nInBufferSize, uint nDefaultTimeOut, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes)
#cfunc global CreateNamedPipeW "CreateNamedPipeW" wstr, int, int, int, int, int, int, var

; winmdroot.Foundation.BOOL CreatePipe(winmdroot.Foundation.HANDLE* hReadPipe, winmdroot.Foundation.HANDLE* hWritePipe, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpPipeAttributes, uint nSize)
#cfunc global CreatePipe "CreatePipe" intptr, intptr, var, int

; winmdroot.Foundation.HANDLE CreatePrivateNamespaceW([Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpPrivateNamespaceAttributes, void* lpBoundaryDescriptor, winmdroot.Foundation.PCWSTR lpAliasPrefix)
#cfunc global CreatePrivateNamespaceW "CreatePrivateNamespaceW" var, intptr, wstr

; winmdroot.Foundation.BOOL CreateProcess(winmdroot.Foundation.PCWSTR lpApplicationName, winmdroot.Foundation.PWSTR lpCommandLine, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpProcessAttributes, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpThreadAttributes, winmdroot.Foundation.BOOL bInheritHandles, winmdroot.System.Threading.PROCESS_CREATION_FLAGS dwCreationFlags, [Optional] void* lpEnvironment, winmdroot.Foundation.PCWSTR lpCurrentDirectory, winmdroot.System.Threading.STARTUPINFOW* lpStartupInfo, winmdroot.System.Threading.PROCESS_INFORMATION* lpProcessInformation)
#cfunc global CreateProcessW "CreateProcessW" wstr, wstr, var, var, int, int, intptr, wstr, var, var

; winmdroot.Foundation.HRESULT CreatePseudoConsole(winmdroot.System.Console.COORD size, winmdroot.Foundation.HANDLE hInput, winmdroot.Foundation.HANDLE hOutput, uint dwFlags, winmdroot.System.Console.HPCON* phPC)
#cfunc global CreatePseudoConsole "CreatePseudoConsole" var, intptr, intptr, int, intptr

; winmdroot.Foundation.HANDLE CreateRemoteThread(winmdroot.Foundation.HANDLE hProcess, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpThreadAttributes, nuint dwStackSize, delegate *unmanaged[Stdcall]<void*,uint> lpStartAddress, [Optional] void* lpParameter, uint dwCreationFlags, [Optional] uint* lpThreadId)
#cfunc global CreateRemoteThread "CreateRemoteThread" intptr, var, int, int, intptr, int, var

; winmdroot.Foundation.HANDLE CreateSemaphore([Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSemaphoreAttributes, int lInitialCount, int lMaximumCount, winmdroot.Foundation.PCWSTR lpName)
#cfunc global CreateSemaphoreW "CreateSemaphoreW" var, int, int, wstr

; winmdroot.Foundation.HANDLE CreateSemaphoreEx([Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSemaphoreAttributes, int lInitialCount, int lMaximumCount, winmdroot.Foundation.PCWSTR lpName, uint dwFlags, uint dwDesiredAccess)
#cfunc global CreateSemaphoreExW "CreateSemaphoreExW" var, int, int, wstr, int, int

; winmdroot.Foundation.BOOLEAN CreateSymbolicLink(winmdroot.Foundation.PCWSTR lpSymlinkFileName, winmdroot.Foundation.PCWSTR lpTargetFileName, winmdroot.Storage.FileSystem.SYMBOLIC_LINK_FLAGS dwFlags)
#cfunc global CreateSymbolicLinkW "CreateSymbolicLinkW" wstr, wstr, int

; winmdroot.Foundation.BOOLEAN CreateSymbolicLinkTransacted(winmdroot.Foundation.PCWSTR lpSymlinkFileName, winmdroot.Foundation.PCWSTR lpTargetFileName, winmdroot.Storage.FileSystem.SYMBOLIC_LINK_FLAGS dwFlags, winmdroot.Foundation.HANDLE hTransaction)
#cfunc global CreateSymbolicLinkTransactedW "CreateSymbolicLinkTransactedW" wstr, wstr, int, intptr

; uint CreateTapePartition(winmdroot.Foundation.HANDLE hDevice, winmdroot.Storage.FileSystem.CREATE_TAPE_PARTITION_METHOD dwPartitionMethod, uint dwCount, uint dwSize)
#cfunc global CreateTapePartition "CreateTapePartition" intptr, int, int, int

; winmdroot.Foundation.HANDLE CreateThread([Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpThreadAttributes, nuint dwStackSize, delegate *unmanaged[Stdcall]<void*,uint> lpStartAddress, [Optional] void* lpParameter, winmdroot.System.Threading.THREAD_CREATION_FLAGS dwCreationFlags, [Optional] uint* lpThreadId)
#cfunc global CreateThread "CreateThread" var, int, int, intptr, int, var

; void CloseThreadpool(winmdroot.System.Threading.PTP_POOL ptpp)
#func global CloseThreadpool "CloseThreadpool" intptr

; winmdroot.System.Threading.PTP_POOL CreateThreadpool([Optional] void* reserved)
#cfunc global CreateThreadpool "CreateThreadpool" intptr

; void CloseThreadpoolCleanupGroup(winmdroot.System.Threading.PTP_CLEANUP_GROUP ptpcg)
#func global CloseThreadpoolCleanupGroup "CloseThreadpoolCleanupGroup" intptr

; winmdroot.System.Threading.PTP_CLEANUP_GROUP CreateThreadpoolCleanupGroup()
#cfunc global CreateThreadpoolCleanupGroup "CreateThreadpoolCleanupGroup"

; void CloseThreadpoolIo(winmdroot.System.Threading.PTP_IO pio)
#func global CloseThreadpoolIo "CloseThreadpoolIo" intptr

; winmdroot.System.Threading.PTP_IO CreateThreadpoolIo(winmdroot.Foundation.HANDLE fl, delegate *unmanaged[Stdcall]<global::Windows.Win32.System.Threading.PTP_CALLBACK_INSTANCE,void*,void*,uint,nuint,global::Windows.Win32.System.Threading.PTP_IO,void> pfnio, [Optional] void* pv, [Optional] winmdroot.System.Threading.TP_CALLBACK_ENVIRON_V3* pcbe)
#cfunc global CreateThreadpoolIo "CreateThreadpoolIo" intptr, int, intptr, var

; void CloseThreadpoolTimer(winmdroot.System.Threading.PTP_TIMER pti)
#func global CloseThreadpoolTimer "CloseThreadpoolTimer" intptr

; winmdroot.System.Threading.PTP_TIMER CreateThreadpoolTimer(delegate *unmanaged[Stdcall]<global::Windows.Win32.System.Threading.PTP_CALLBACK_INSTANCE,void*,global::Windows.Win32.System.Threading.PTP_TIMER,void> pfnti, [Optional] void* pv, [Optional] winmdroot.System.Threading.TP_CALLBACK_ENVIRON_V3* pcbe)
#cfunc global CreateThreadpoolTimer "CreateThreadpoolTimer" int, intptr, var

; void CloseThreadpoolWait(winmdroot.System.Threading.PTP_WAIT pwa)
#func global CloseThreadpoolWait "CloseThreadpoolWait" intptr

; winmdroot.System.Threading.PTP_WAIT CreateThreadpoolWait(delegate *unmanaged[Stdcall]<global::Windows.Win32.System.Threading.PTP_CALLBACK_INSTANCE,void*,global::Windows.Win32.System.Threading.PTP_WAIT,uint,void> pfnwa, [Optional] void* pv, [Optional] winmdroot.System.Threading.TP_CALLBACK_ENVIRON_V3* pcbe)
#cfunc global CreateThreadpoolWait "CreateThreadpoolWait" int, intptr, var

; void CloseThreadpoolWork(winmdroot.System.Threading.PTP_WORK pwk)
#func global CloseThreadpoolWork "CloseThreadpoolWork" intptr

; winmdroot.System.Threading.PTP_WORK CreateThreadpoolWork(delegate *unmanaged[Stdcall]<global::Windows.Win32.System.Threading.PTP_CALLBACK_INSTANCE,void*,global::Windows.Win32.System.Threading.PTP_WORK,void> pfnwk, [Optional] void* pv, [Optional] winmdroot.System.Threading.TP_CALLBACK_ENVIRON_V3* pcbe)
#cfunc global CreateThreadpoolWork "CreateThreadpoolWork" int, intptr, var

; winmdroot.Foundation.HANDLE CreateTimerQueue()
#cfunc global CreateTimerQueue "CreateTimerQueue"

; winmdroot.Foundation.BOOL CreateTimerQueueTimer(winmdroot.Foundation.HANDLE* phNewTimer, winmdroot.Foundation.HANDLE TimerQueue, delegate *unmanaged[Stdcall]<void*,global::Windows.Win32.Foundation.BOOLEAN,void> Callback, [Optional] void* Parameter, uint DueTime, uint Period, winmdroot.System.Threading.WORKER_THREAD_FLAGS Flags)
#cfunc global CreateTimerQueueTimer "CreateTimerQueueTimer" intptr, intptr, int, intptr, int, int, int

; winmdroot.Foundation.HANDLE CreateToolhelp32Snapshot(winmdroot.System.Diagnostics.ToolHelp.CREATE_TOOLHELP_SNAPSHOT_FLAGS dwFlags, uint th32ProcessID)
#cfunc global CreateToolhelp32Snapshot "CreateToolhelp32Snapshot" int, int

; winmdroot.Foundation.BOOL CreateUmsCompletionList(void** UmsCompletionList)
#cfunc global CreateUmsCompletionList "CreateUmsCompletionList" var

; winmdroot.Foundation.BOOL CreateUmsThreadContext(void** lpUmsThread)
#cfunc global CreateUmsThreadContext "CreateUmsThreadContext" var

; winmdroot.Foundation.HANDLE CreateWaitableTimer([Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpTimerAttributes, winmdroot.Foundation.BOOL bManualReset, winmdroot.Foundation.PCWSTR lpTimerName)
#cfunc global CreateWaitableTimerW "CreateWaitableTimerW" var, int, wstr

; winmdroot.Foundation.HANDLE CreateWaitableTimerEx([Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpTimerAttributes, winmdroot.Foundation.PCWSTR lpTimerName, uint dwFlags, uint dwDesiredAccess)
#cfunc global CreateWaitableTimerExW "CreateWaitableTimerExW" var, wstr, int, int

; winmdroot.Foundation.BOOL DeactivateActCtx(uint dwFlags, nuint ulCookie)
#cfunc global DeactivateActCtx "DeactivateActCtx" int, int

; winmdroot.Foundation.BOOL DebugActiveProcess(uint dwProcessId)
#cfunc global DebugActiveProcess "DebugActiveProcess" int

; winmdroot.Foundation.BOOL DebugActiveProcessStop(uint dwProcessId)
#cfunc global DebugActiveProcessStop "DebugActiveProcessStop" int

; void DebugBreak()
#func global DebugBreak "DebugBreak"

; winmdroot.Foundation.BOOL DebugBreakProcess(winmdroot.Foundation.HANDLE Process)
#cfunc global DebugBreakProcess "DebugBreakProcess" intptr

; winmdroot.Foundation.BOOL DebugSetProcessKillOnExit(winmdroot.Foundation.BOOL KillOnExit)
#cfunc global DebugSetProcessKillOnExit "DebugSetProcessKillOnExit" int

; winmdroot.Foundation.BOOL DefineDosDevice(winmdroot.Storage.FileSystem.DEFINE_DOS_DEVICE_FLAGS dwFlags, winmdroot.Foundation.PCWSTR lpDeviceName, winmdroot.Foundation.PCWSTR lpTargetPath)
#cfunc global DefineDosDeviceW "DefineDosDeviceW" int, wstr, wstr

; ushort DeleteAtom(ushort nAtom)
#cfunc global DeleteAtom "DeleteAtom" int

; void DeleteBoundaryDescriptor(winmdroot.Foundation.HANDLE BoundaryDescriptor)
#func global DeleteBoundaryDescriptor "DeleteBoundaryDescriptor" intptr

; void DeleteFiber(void* lpFiber)
#func global DeleteFiber "DeleteFiber" intptr

; winmdroot.Foundation.BOOL DeleteFile(winmdroot.Foundation.PCWSTR lpFileName)
#cfunc global DeleteFileW "DeleteFileW" wstr

; winmdroot.Foundation.BOOL DeleteFileTransacted(winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Foundation.HANDLE hTransaction)
#cfunc global DeleteFileTransactedW "DeleteFileTransactedW" wstr, intptr

; winmdroot.Foundation.BOOL DeleteSynchronizationBarrier(winmdroot.System.Threading.SYNCHRONIZATION_BARRIER* lpBarrier)
#cfunc global DeleteSynchronizationBarrier "DeleteSynchronizationBarrier" var

; winmdroot.Foundation.BOOL DeleteTimerQueue(winmdroot.Foundation.HANDLE TimerQueue)
#cfunc global DeleteTimerQueue "DeleteTimerQueue" intptr

; winmdroot.Foundation.BOOL DeleteTimerQueueEx(winmdroot.Foundation.HANDLE TimerQueue, winmdroot.Foundation.HANDLE CompletionEvent)
#cfunc global DeleteTimerQueueEx "DeleteTimerQueueEx" intptr, intptr

; winmdroot.Foundation.BOOL DeleteTimerQueueTimer(winmdroot.Foundation.HANDLE TimerQueue, winmdroot.Foundation.HANDLE Timer, winmdroot.Foundation.HANDLE CompletionEvent)
#cfunc global DeleteTimerQueueTimer "DeleteTimerQueueTimer" intptr, intptr, intptr

; winmdroot.Foundation.BOOL DeleteUmsCompletionList(void* UmsCompletionList)
#cfunc global DeleteUmsCompletionList "DeleteUmsCompletionList" intptr

; winmdroot.Foundation.BOOL DeleteUmsThreadContext(void* UmsThread)
#cfunc global DeleteUmsThreadContext "DeleteUmsThreadContext" intptr

; winmdroot.Foundation.BOOL DeleteVolumeMountPoint(winmdroot.Foundation.PCWSTR lpszVolumeMountPoint)
#cfunc global DeleteVolumeMountPointW "DeleteVolumeMountPointW" wstr

; winmdroot.Foundation.BOOL DequeueUmsCompletionListItems(void* UmsCompletionList, uint WaitTimeOut, void** UmsThreadList)
#cfunc global DequeueUmsCompletionListItems "DequeueUmsCompletionListItems" intptr, int, var

; winmdroot.Foundation.BOOL DeviceIoControl(winmdroot.Foundation.HANDLE hDevice, uint dwIoControlCode, [Optional] void* lpInBuffer, uint nInBufferSize, [Optional] void* lpOutBuffer, uint nOutBufferSize, [Optional] uint* lpBytesReturned, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped)
#cfunc global DeviceIoControl "DeviceIoControl" intptr, int, intptr, int, intptr, int, var, var

; winmdroot.Foundation.BOOL DisableThreadLibraryCalls(winmdroot.Foundation.HMODULE hLibModule)
#cfunc global DisableThreadLibraryCalls "DisableThreadLibraryCalls" intptr

; uint DisableThreadProfiling(winmdroot.Foundation.HANDLE PerformanceDataHandle)
#cfunc global DisableThreadProfiling "DisableThreadProfiling" intptr

; winmdroot.Foundation.BOOL DisconnectNamedPipe(winmdroot.Foundation.HANDLE hNamedPipe)
#cfunc global DisconnectNamedPipe "DisconnectNamedPipe" intptr

; winmdroot.Foundation.BOOL DnsHostnameToComputerName(winmdroot.Foundation.PCWSTR Hostname, winmdroot.Foundation.PWSTR ComputerName, uint* nSize)
#cfunc global DnsHostnameToComputerNameW "DnsHostnameToComputerNameW" wstr, wstr, var

; winmdroot.Foundation.BOOL DnsHostnameToComputerNameExW(winmdroot.Foundation.PCWSTR Hostname, winmdroot.Foundation.PWSTR ComputerName, uint* nSize)
#cfunc global DnsHostnameToComputerNameExW "DnsHostnameToComputerNameExW" wstr, wstr, var

; winmdroot.Foundation.BOOL DosDateTimeToFileTime(ushort wFatDate, ushort wFatTime, global::System.Runtime.InteropServices.ComTypes.FILETIME* lpFileTime)
#cfunc global DosDateTimeToFileTime "DosDateTimeToFileTime" int, int, var

; winmdroot.Foundation.BOOL DuplicateHandle(winmdroot.Foundation.HANDLE hSourceProcessHandle, winmdroot.Foundation.HANDLE hSourceHandle, winmdroot.Foundation.HANDLE hTargetProcessHandle, winmdroot.Foundation.HANDLE* lpTargetHandle, uint dwDesiredAccess, winmdroot.Foundation.BOOL bInheritHandle, winmdroot.Foundation.DUPLICATE_HANDLE_OPTIONS dwOptions)
#cfunc global DuplicateHandle "DuplicateHandle" intptr, intptr, intptr, intptr, int, int, int

; uint EnableThreadProfiling(winmdroot.Foundation.HANDLE ThreadHandle, uint Flags, ulong HardwareCounters, winmdroot.Foundation.HANDLE* PerformanceDataHandle)
#cfunc global EnableThreadProfiling "EnableThreadProfiling" intptr, int, int64, intptr

; winmdroot.Foundation.BOOL EndUpdateResource(winmdroot.Foundation.HANDLE hUpdate, winmdroot.Foundation.BOOL fDiscard)
#cfunc global EndUpdateResourceW "EndUpdateResourceW" intptr, int

; winmdroot.Foundation.BOOL EnterSynchronizationBarrier(winmdroot.System.Threading.SYNCHRONIZATION_BARRIER* lpBarrier, uint dwFlags)
#cfunc global EnterSynchronizationBarrier "EnterSynchronizationBarrier" var, int

; winmdroot.Foundation.BOOL EnterUmsSchedulingMode(winmdroot.System.Threading.UMS_SCHEDULER_STARTUP_INFO* SchedulerStartupInfo)
#cfunc global EnterUmsSchedulingMode "EnterUmsSchedulingMode" var

; winmdroot.Foundation.BOOL EnumCalendarInfo(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.BOOL> lpCalInfoEnumProc, uint Locale, uint Calendar, uint CalType)
#cfunc global EnumCalendarInfoW "EnumCalendarInfoW" int, int, int, int

; winmdroot.Foundation.BOOL EnumCalendarInfoEx(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,uint,global::Windows.Win32.Foundation.BOOL> lpCalInfoEnumProcEx, uint Locale, uint Calendar, uint CalType)
#cfunc global EnumCalendarInfoExW "EnumCalendarInfoExW" int, int, int, int

; winmdroot.Foundation.BOOL EnumCalendarInfoExEx(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,uint,global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.BOOL> pCalInfoEnumProcExEx, winmdroot.Foundation.PCWSTR lpLocaleName, uint Calendar, winmdroot.Foundation.PCWSTR lpReserved, uint CalType, winmdroot.Foundation.LPARAM lParam)
#cfunc global EnumCalendarInfoExEx "EnumCalendarInfoExEx" int, wstr, int, wstr, int, intptr

; winmdroot.Foundation.BOOL EnumDateFormats(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.BOOL> lpDateFmtEnumProc, uint Locale, uint dwFlags)
#cfunc global EnumDateFormatsW "EnumDateFormatsW" int, int, int

; winmdroot.Foundation.BOOL EnumDateFormatsEx(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,uint,global::Windows.Win32.Foundation.BOOL> lpDateFmtEnumProcEx, uint Locale, uint dwFlags)
#cfunc global EnumDateFormatsExW "EnumDateFormatsExW" int, int, int

; winmdroot.Foundation.BOOL EnumDateFormatsExEx(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,uint,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.BOOL> lpDateFmtEnumProcExEx, winmdroot.Foundation.PCWSTR lpLocaleName, winmdroot.Globalization.ENUM_DATE_FORMATS_FLAGS dwFlags, winmdroot.Foundation.LPARAM lParam)
#cfunc global EnumDateFormatsExEx "EnumDateFormatsExEx" int, wstr, int, intptr

; winmdroot.Foundation.BOOL EnumLanguageGroupLocales(delegate *unmanaged[Stdcall]<uint,uint,global::Windows.Win32.Foundation.PWSTR,nint,global::Windows.Win32.Foundation.BOOL> lpLangGroupLocaleEnumProc, uint LanguageGroup, uint dwFlags, nint lParam)
#cfunc global EnumLanguageGroupLocalesW "EnumLanguageGroupLocalesW" int, int, int, int

; winmdroot.Foundation.BOOL EnumResourceLanguages(winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.PCWSTR lpType, winmdroot.Foundation.PCWSTR lpName, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HMODULE,winmdroot.Foundation.PCWSTR,winmdroot.Foundation.PCWSTR,ushort,nint,global::Windows.Win32.Foundation.BOOL> lpEnumFunc, nint lParam)
#cfunc global EnumResourceLanguagesW "EnumResourceLanguagesW" intptr, wstr, wstr, int, int

; winmdroot.Foundation.BOOL EnumResourceLanguagesEx(winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.PCWSTR lpType, winmdroot.Foundation.PCWSTR lpName, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HMODULE,winmdroot.Foundation.PCWSTR,winmdroot.Foundation.PCWSTR,ushort,nint,global::Windows.Win32.Foundation.BOOL> lpEnumFunc, nint lParam, uint dwFlags, ushort LangId)
#cfunc global EnumResourceLanguagesExW "EnumResourceLanguagesExW" intptr, wstr, wstr, int, int, int, int

; winmdroot.Foundation.BOOL EnumResourceNamesW(winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.PCWSTR lpType, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HMODULE,winmdroot.Foundation.PCWSTR,global::Windows.Win32.Foundation.PWSTR,nint,global::Windows.Win32.Foundation.BOOL> lpEnumFunc, nint lParam)
#cfunc global EnumResourceNamesW "EnumResourceNamesW" intptr, wstr, int, int

; winmdroot.Foundation.BOOL EnumResourceNamesEx(winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.PCWSTR lpType, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HMODULE,winmdroot.Foundation.PCWSTR,global::Windows.Win32.Foundation.PWSTR,nint,global::Windows.Win32.Foundation.BOOL> lpEnumFunc, nint lParam, uint dwFlags, ushort LangId)
#cfunc global EnumResourceNamesExW "EnumResourceNamesExW" intptr, wstr, int, int, int, int

; winmdroot.Foundation.BOOL EnumResourceTypes(winmdroot.Foundation.HMODULE hModule, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HMODULE,global::Windows.Win32.Foundation.PWSTR,nint,global::Windows.Win32.Foundation.BOOL> lpEnumFunc, nint lParam)
#cfunc global EnumResourceTypesW "EnumResourceTypesW" intptr, int, int

; winmdroot.Foundation.BOOL EnumResourceTypesEx(winmdroot.Foundation.HMODULE hModule, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HMODULE,global::Windows.Win32.Foundation.PWSTR,nint,global::Windows.Win32.Foundation.BOOL> lpEnumFunc, nint lParam, uint dwFlags, ushort LangId)
#cfunc global EnumResourceTypesExW "EnumResourceTypesExW" intptr, int, int, int, int

; winmdroot.Foundation.BOOL EnumSystemCodePages(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.BOOL> lpCodePageEnumProc, winmdroot.Globalization.ENUM_SYSTEM_CODE_PAGES_FLAGS dwFlags)
#cfunc global EnumSystemCodePagesW "EnumSystemCodePagesW" int, int

; uint EnumSystemFirmwareTables(winmdroot.System.SystemInformation.FIRMWARE_TABLE_PROVIDER FirmwareTableProviderSignature, [Optional] byte* pFirmwareTableEnumBuffer, uint BufferSize)
#cfunc global EnumSystemFirmwareTables "EnumSystemFirmwareTables" int, var, int

; winmdroot.Foundation.BOOL EnumSystemGeoID(uint GeoClass, int ParentGeoId, delegate *unmanaged[Stdcall]<int,global::Windows.Win32.Foundation.BOOL> lpGeoEnumProc)
#cfunc global EnumSystemGeoID "EnumSystemGeoID" int, int, int

; winmdroot.Foundation.BOOL EnumSystemGeoNames(uint geoClass, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.BOOL> geoEnumProc, winmdroot.Foundation.LPARAM data)
#cfunc global EnumSystemGeoNames "EnumSystemGeoNames" int, int, intptr

; winmdroot.Foundation.BOOL EnumSystemLanguageGroups(delegate *unmanaged[Stdcall]<uint,global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.PWSTR,uint,nint,global::Windows.Win32.Foundation.BOOL> lpLanguageGroupEnumProc, winmdroot.Globalization.ENUM_SYSTEM_LANGUAGE_GROUPS_FLAGS dwFlags, nint lParam)
#cfunc global EnumSystemLanguageGroupsW "EnumSystemLanguageGroupsW" int, int, int

; winmdroot.Foundation.BOOL EnumSystemLocales(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.BOOL> lpLocaleEnumProc, uint dwFlags)
#cfunc global EnumSystemLocalesW "EnumSystemLocalesW" int, int

; winmdroot.Foundation.BOOL EnumSystemLocalesEx(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,uint,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.BOOL> lpLocaleEnumProcEx, uint dwFlags, winmdroot.Foundation.LPARAM lParam, [Optional] void* lpReserved)
#cfunc global EnumSystemLocalesEx "EnumSystemLocalesEx" int, int, intptr, intptr

; winmdroot.Foundation.BOOL EnumTimeFormats(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.BOOL> lpTimeFmtEnumProc, uint Locale, winmdroot.Globalization.TIME_FORMAT_FLAGS dwFlags)
#cfunc global EnumTimeFormatsW "EnumTimeFormatsW" int, int, int

; winmdroot.Foundation.BOOL EnumTimeFormatsEx(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.BOOL> lpTimeFmtEnumProcEx, winmdroot.Foundation.PCWSTR lpLocaleName, uint dwFlags, winmdroot.Foundation.LPARAM lParam)
#cfunc global EnumTimeFormatsEx "EnumTimeFormatsEx" int, wstr, int, intptr

; winmdroot.Foundation.BOOL EnumUILanguages(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,nint,global::Windows.Win32.Foundation.BOOL> lpUILanguageEnumProc, uint dwFlags, nint lParam)
#cfunc global EnumUILanguagesW "EnumUILanguagesW" int, int, int

; uint EraseTape(winmdroot.Foundation.HANDLE hDevice, winmdroot.Storage.FileSystem.ERASE_TAPE_TYPE dwEraseType, winmdroot.Foundation.BOOL bImmediate)
#cfunc global EraseTape "EraseTape" intptr, int, int

; winmdroot.Foundation.BOOL EscapeCommFunction(winmdroot.Foundation.HANDLE hFile, winmdroot.Devices.Communication.ESCAPE_COMM_FUNCTION dwFunc)
#cfunc global EscapeCommFunction "EscapeCommFunction" intptr, int

; winmdroot.Foundation.BOOL ExecuteUmsThread(void* UmsThread)
#cfunc global ExecuteUmsThread "ExecuteUmsThread" intptr

; void ExitProcess(uint uExitCode)
#func global ExitProcess "ExitProcess" int

; uint ExpandEnvironmentStrings(winmdroot.Foundation.PCWSTR lpSrc, winmdroot.Foundation.PWSTR lpDst, uint nSize)
#cfunc global ExpandEnvironmentStringsW "ExpandEnvironmentStringsW" wstr, wstr, int

; void ExpungeConsoleCommandHistoryW(winmdroot.Foundation.PWSTR ExeName)
#func global ExpungeConsoleCommandHistoryW "ExpungeConsoleCommandHistoryW" wstr

; void FatalAppExitW(uint uAction, winmdroot.Foundation.PCWSTR lpMessageText)
#func global FatalAppExitW "FatalAppExitW" int, wstr

; void FatalExit(int ExitCode)
#func global FatalExit "FatalExit" int

; winmdroot.Foundation.BOOL FileTimeToDosDateTime(global::System.Runtime.InteropServices.ComTypes.FILETIME* lpFileTime, ushort* lpFatDate, ushort* lpFatTime)
#cfunc global FileTimeToDosDateTime "FileTimeToDosDateTime" var, var, var

; winmdroot.Foundation.BOOL FileTimeToLocalFileTime(global::System.Runtime.InteropServices.ComTypes.FILETIME* lpFileTime, global::System.Runtime.InteropServices.ComTypes.FILETIME* lpLocalFileTime)
#cfunc global FileTimeToLocalFileTime "FileTimeToLocalFileTime" var, var

; winmdroot.Foundation.BOOL FileTimeToSystemTime(global::System.Runtime.InteropServices.ComTypes.FILETIME* lpFileTime, winmdroot.Foundation.SYSTEMTIME* lpSystemTime)
#cfunc global FileTimeToSystemTime "FileTimeToSystemTime" var, var

; winmdroot.Foundation.BOOL FillConsoleOutputAttribute(winmdroot.Foundation.HANDLE hConsoleOutput, ushort wAttribute, uint nLength, winmdroot.System.Console.COORD dwWriteCoord, uint* lpNumberOfAttrsWritten)
#cfunc global FillConsoleOutputAttribute "FillConsoleOutputAttribute" intptr, int, int, var, var

; winmdroot.Foundation.BOOL FillConsoleOutputCharacter(winmdroot.Foundation.HANDLE hConsoleOutput, char cCharacter, uint nLength, winmdroot.System.Console.COORD dwWriteCoord, uint* lpNumberOfCharsWritten)
#cfunc global FillConsoleOutputCharacterW "FillConsoleOutputCharacterW" intptr, int, int, var, var

; winmdroot.Foundation.BOOL FindActCtxSectionGuid(uint dwFlags, [Optional] global::System.Guid* lpExtensionGuid, uint ulSectionId, [Optional] global::System.Guid* lpGuidToFind, winmdroot.System.ApplicationInstallationAndServicing.ACTCTX_SECTION_KEYED_DATA* ReturnedData)
#cfunc global FindActCtxSectionGuid "FindActCtxSectionGuid" int, var, int, var, var

; winmdroot.Foundation.BOOL FindActCtxSectionString(uint dwFlags, [Optional] global::System.Guid* lpExtensionGuid, uint ulSectionId, winmdroot.Foundation.PCWSTR lpStringToFind, winmdroot.System.ApplicationInstallationAndServicing.ACTCTX_SECTION_KEYED_DATA* ReturnedData)
#cfunc global FindActCtxSectionStringW "FindActCtxSectionStringW" int, var, int, wstr, var

; ushort FindAtom(winmdroot.Foundation.PCWSTR lpString)
#cfunc global FindAtomW "FindAtomW" wstr

; winmdroot.Foundation.BOOL FindClose(winmdroot.Foundation.HANDLE hFindFile)
#cfunc global FindClose "FindClose" intptr

; winmdroot.Foundation.BOOL FindCloseChangeNotification(winmdroot.Foundation.HANDLE hChangeHandle)
#cfunc global FindCloseChangeNotification "FindCloseChangeNotification" intptr

; winmdroot.Foundation.HANDLE FindFirstChangeNotification(winmdroot.Foundation.PCWSTR lpPathName, winmdroot.Foundation.BOOL bWatchSubtree, winmdroot.Storage.FileSystem.FILE_NOTIFY_CHANGE dwNotifyFilter)
#cfunc global FindFirstChangeNotificationW "FindFirstChangeNotificationW" wstr, int, int

; winmdroot.Foundation.HANDLE FindFirstFile(winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Storage.FileSystem.WIN32_FIND_DATAW* lpFindFileData)
#cfunc global FindFirstFileW "FindFirstFileW" wstr, var

; winmdroot.Foundation.HANDLE FindFirstFileEx(winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Storage.FileSystem.FINDEX_INFO_LEVELS fInfoLevelId, void* lpFindFileData, winmdroot.Storage.FileSystem.FINDEX_SEARCH_OPS fSearchOp, [Optional] void* lpSearchFilter, winmdroot.Storage.FileSystem.FIND_FIRST_EX_FLAGS dwAdditionalFlags)
#cfunc global FindFirstFileExW "FindFirstFileExW" wstr, int, intptr, int, intptr, int

; winmdroot.Foundation.HANDLE FindFirstFileName(winmdroot.Foundation.PCWSTR lpFileName, uint dwFlags, uint* StringLength, winmdroot.Foundation.PWSTR LinkName)
#cfunc global FindFirstFileNameW "FindFirstFileNameW" wstr, int, var, wstr

; winmdroot.Foundation.HANDLE FindFirstFileNameTransacted(winmdroot.Foundation.PCWSTR lpFileName, uint dwFlags, uint* StringLength, winmdroot.Foundation.PWSTR LinkName, winmdroot.Foundation.HANDLE hTransaction)
#cfunc global FindFirstFileNameTransactedW "FindFirstFileNameTransactedW" wstr, int, var, wstr, intptr

; winmdroot.Foundation.HANDLE FindFirstFileTransacted(winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Storage.FileSystem.FINDEX_INFO_LEVELS fInfoLevelId, void* lpFindFileData, winmdroot.Storage.FileSystem.FINDEX_SEARCH_OPS fSearchOp, [Optional] void* lpSearchFilter, uint dwAdditionalFlags, winmdroot.Foundation.HANDLE hTransaction)
#cfunc global FindFirstFileTransactedW "FindFirstFileTransactedW" wstr, int, intptr, int, intptr, int, intptr

; winmdroot.Foundation.HANDLE FindFirstStreamTransacted(winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Storage.FileSystem.STREAM_INFO_LEVELS InfoLevel, void* lpFindStreamData, uint dwFlags, winmdroot.Foundation.HANDLE hTransaction)
#cfunc global FindFirstStreamTransactedW "FindFirstStreamTransactedW" wstr, int, intptr, int, intptr

; winmdroot.Foundation.HANDLE FindFirstVolume(winmdroot.Foundation.PWSTR lpszVolumeName, uint cchBufferLength)
#cfunc global FindFirstVolumeW "FindFirstVolumeW" wstr, int

; winmdroot.Foundation.HANDLE FindFirstVolumeMountPoint(winmdroot.Foundation.PCWSTR lpszRootPathName, winmdroot.Foundation.PWSTR lpszVolumeMountPoint, uint cchBufferLength)
#cfunc global FindFirstVolumeMountPointW "FindFirstVolumeMountPointW" wstr, wstr, int

; int FindNLSString(uint Locale, uint dwFindNLSStringFlags, winmdroot.Foundation.PCWSTR lpStringSource, int cchSource, winmdroot.Foundation.PCWSTR lpStringValue, int cchValue, [Optional] int* pcchFound)
#cfunc global FindNLSString "FindNLSString" int, int, wstr, int, wstr, int, var

; int FindNLSStringEx(winmdroot.Foundation.PCWSTR lpLocaleName, uint dwFindNLSStringFlags, winmdroot.Foundation.PCWSTR lpStringSource, int cchSource, winmdroot.Foundation.PCWSTR lpStringValue, int cchValue, [Optional] int* pcchFound, [Optional] winmdroot.Globalization.NLSVERSIONINFO* lpVersionInformation, [Optional] void* lpReserved, winmdroot.Foundation.LPARAM sortHandle)
#cfunc global FindNLSStringEx "FindNLSStringEx" wstr, int, wstr, int, wstr, int, var, var, intptr, intptr

; winmdroot.Foundation.BOOL FindNextChangeNotification(winmdroot.Foundation.HANDLE hChangeHandle)
#cfunc global FindNextChangeNotification "FindNextChangeNotification" intptr

; winmdroot.Foundation.BOOL FindNextFile(winmdroot.Foundation.HANDLE hFindFile, winmdroot.Storage.FileSystem.WIN32_FIND_DATAW* lpFindFileData)
#cfunc global FindNextFileW "FindNextFileW" intptr, var

; winmdroot.Foundation.BOOL FindNextFileName(winmdroot.Foundation.HANDLE hFindStream, uint* StringLength, winmdroot.Foundation.PWSTR LinkName)
#cfunc global FindNextFileNameW "FindNextFileNameW" intptr, var, wstr

; winmdroot.Foundation.BOOL FindNextVolume(winmdroot.Foundation.HANDLE hFindVolume, winmdroot.Foundation.PWSTR lpszVolumeName, uint cchBufferLength)
#cfunc global FindNextVolumeW "FindNextVolumeW" intptr, wstr, int

; winmdroot.Foundation.BOOL FindNextVolumeMountPoint(winmdroot.Foundation.HANDLE hFindVolumeMountPoint, winmdroot.Foundation.PWSTR lpszVolumeMountPoint, uint cchBufferLength)
#cfunc global FindNextVolumeMountPointW "FindNextVolumeMountPointW" intptr, wstr, int

; winmdroot.Foundation.HRSRC FindResourceW(winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.PCWSTR lpName, winmdroot.Foundation.PCWSTR lpType)
#cfunc global FindResourceW "FindResourceW" intptr, wstr, wstr

; winmdroot.Foundation.HRSRC FindResourceExW(winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.PCWSTR lpType, winmdroot.Foundation.PCWSTR lpName, ushort wLanguage)
#cfunc global FindResourceExW "FindResourceExW" intptr, wstr, wstr, int

; int FindStringOrdinal(uint dwFindStringOrdinalFlags, winmdroot.Foundation.PCWSTR lpStringSource, int cchSource, winmdroot.Foundation.PCWSTR lpStringValue, int cchValue, winmdroot.Foundation.BOOL bIgnoreCase)
#cfunc global FindStringOrdinal "FindStringOrdinal" int, wstr, int, wstr, int, int

; winmdroot.Foundation.BOOL FindVolumeClose(winmdroot.Foundation.HANDLE hFindVolume)
#cfunc global FindVolumeClose "FindVolumeClose" intptr

; winmdroot.Foundation.BOOL FindVolumeMountPointClose(winmdroot.Foundation.HANDLE hFindVolumeMountPoint)
#cfunc global FindVolumeMountPointClose "FindVolumeMountPointClose" intptr

; uint FlsAlloc(delegate *unmanaged[Stdcall]<void*,void> lpCallback)
#cfunc global FlsAlloc "FlsAlloc" int

; winmdroot.Foundation.BOOL FlsFree(uint dwFlsIndex)
#cfunc global FlsFree "FlsFree" int

; void* FlsGetValue(uint dwFlsIndex)
#cfunc global FlsGetValue "FlsGetValue" int

; winmdroot.Foundation.BOOL FlsSetValue(uint dwFlsIndex, [Optional] void* lpFlsData)
#cfunc global FlsSetValue "FlsSetValue" int, intptr

; winmdroot.Foundation.BOOL FlushConsoleInputBuffer(winmdroot.Foundation.HANDLE hConsoleInput)
#cfunc global FlushConsoleInputBuffer "FlushConsoleInputBuffer" intptr

; winmdroot.Foundation.BOOL FlushFileBuffers(winmdroot.Foundation.HANDLE hFile)
#cfunc global FlushFileBuffers "FlushFileBuffers" intptr

; winmdroot.Foundation.BOOL FlushInstructionCache(winmdroot.Foundation.HANDLE hProcess, [Optional] void* lpBaseAddress, nuint dwSize)
#cfunc global FlushInstructionCache "FlushInstructionCache" intptr, intptr, int

; winmdroot.Foundation.BOOL FlushViewOfFile(void* lpBaseAddress, nuint dwNumberOfBytesToFlush)
#cfunc global FlushViewOfFile "FlushViewOfFile" intptr, int

; int FoldString(winmdroot.Globalization.FOLD_STRING_MAP_FLAGS dwMapFlags, winmdroot.Foundation.PCWSTR lpSrcStr, int cchSrc, winmdroot.Foundation.PWSTR lpDestStr, int cchDest)
#cfunc global FoldStringW "FoldStringW" int, wstr, int, wstr, int

; uint FormatMessage(winmdroot.System.Diagnostics.Debug.FORMAT_MESSAGE_OPTIONS dwFlags, [Optional] void* lpSource, uint dwMessageId, uint dwLanguageId, winmdroot.Foundation.PWSTR lpBuffer, uint nSize, [Optional] sbyte** Arguments)
#cfunc global FormatMessageW "FormatMessageW" int, intptr, int, int, wstr, int, var

; winmdroot.Foundation.BOOL FreeConsole()
#cfunc global FreeConsole "FreeConsole"

; winmdroot.Foundation.BOOL FreeEnvironmentStrings(winmdroot.Foundation.PZZWSTR penv)
#cfunc global FreeEnvironmentStringsW "FreeEnvironmentStringsW" int

; void FreeLibraryAndExitThread(winmdroot.Foundation.HMODULE hLibModule, uint dwExitCode)
#func global FreeLibraryAndExitThread "FreeLibraryAndExitThread" intptr, int

; void FreeMemoryJobObject(void* Buffer)
#func global FreeMemoryJobObject "FreeMemoryJobObject" intptr

; winmdroot.Foundation.HGLOBAL GlobalFree(winmdroot.Foundation.HGLOBAL hMem)
#cfunc global GlobalFree "GlobalFree" int

; winmdroot.Foundation.BOOL FreeResource(winmdroot.Foundation.HGLOBAL hResData)
#cfunc global FreeResource "FreeResource" int

; winmdroot.Foundation.BOOL FreeUserPhysicalPages(winmdroot.Foundation.HANDLE hProcess, nuint* NumberOfPages, nuint* PageArray)
#cfunc global FreeUserPhysicalPages "FreeUserPhysicalPages" intptr, var, var

; winmdroot.Foundation.BOOL GenerateConsoleCtrlEvent(uint dwCtrlEvent, uint dwProcessGroupId)
#cfunc global GenerateConsoleCtrlEvent "GenerateConsoleCtrlEvent" int, int

; uint GetACP()
#cfunc global GetACP "GetACP"

; uint GetActiveProcessorCount(ushort GroupNumber)
#cfunc global GetActiveProcessorCount "GetActiveProcessorCount" int

; ushort GetActiveProcessorGroupCount()
#cfunc global GetActiveProcessorGroupCount "GetActiveProcessorGroupCount"

; winmdroot.Foundation.BOOL GetAppContainerAce(winmdroot.Security.ACL* Acl, uint StartingAceIndex, void** AppContainerAce, [Optional] uint* AppContainerAceIndex)
#cfunc global GetAppContainerAce "GetAppContainerAce" var, int, var, var

; winmdroot.Foundation.BOOL GetAppContainerNamedObjectPath(winmdroot.Foundation.HANDLE Token, winmdroot.Security.PSID AppContainerSid, uint ObjectPathLength, winmdroot.Foundation.PWSTR ObjectPath, uint* ReturnLength)
#cfunc global GetAppContainerNamedObjectPath "GetAppContainerNamedObjectPath" intptr, int, int, wstr, var

; winmdroot.Foundation.HRESULT GetApplicationRecoveryCallback(winmdroot.Foundation.HANDLE hProcess, delegate *unmanaged[Stdcall]<void*,uint>* pRecoveryCallback, [Optional] void** ppvParameter, [Optional] uint* pdwPingInterval, [Optional] uint* pdwFlags)
#cfunc global GetApplicationRecoveryCallback "GetApplicationRecoveryCallback" intptr, var, var, var, var

; winmdroot.Foundation.HRESULT GetApplicationRestartSettings(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.PWSTR pwzCommandline, uint* pcchSize, [Optional] uint* pdwFlags)
#cfunc global GetApplicationRestartSettings "GetApplicationRestartSettings" intptr, wstr, var, var

; uint GetAtomName(ushort nAtom, winmdroot.Foundation.PWSTR lpBuffer, int nSize)
#cfunc global GetAtomNameW "GetAtomNameW" int, wstr, int

; winmdroot.Foundation.BOOL GetBinaryType(winmdroot.Foundation.PCWSTR lpApplicationName, uint* lpBinaryType)
#cfunc global GetBinaryTypeW "GetBinaryTypeW" wstr, var

; winmdroot.Foundation.BOOL GetCPInfo(uint CodePage, winmdroot.Globalization.CPINFO* lpCPInfo)
#cfunc global GetCPInfo "GetCPInfo" int, var

; winmdroot.Foundation.BOOL GetCPInfoEx(uint CodePage, uint dwFlags, winmdroot.Globalization.CPINFOEXW* lpCPInfoEx)
#cfunc global GetCPInfoExW "GetCPInfoExW" int, int, var

; winmdroot.Foundation.BOOL GetCachedSigningLevel(winmdroot.Foundation.HANDLE File, uint* Flags, uint* SigningLevel, [Optional] byte* Thumbprint, [Optional] uint* ThumbprintSize, [Optional] uint* ThumbprintAlgorithm)
#cfunc global GetCachedSigningLevel "GetCachedSigningLevel" intptr, var, var, var, var, var

; winmdroot.Foundation.BOOL GetCalendarDateFormatEx(winmdroot.Foundation.PCWSTR lpszLocale, uint dwFlags, winmdroot.Globalization.CALDATETIME* lpCalDateTime, winmdroot.Foundation.PCWSTR lpFormat, winmdroot.Foundation.PWSTR lpDateStr, int cchDate)
#cfunc global GetCalendarDateFormatEx "GetCalendarDateFormatEx" wstr, int, var, wstr, wstr, int

; int GetCalendarInfo(uint Locale, uint Calendar, uint CalType, winmdroot.Foundation.PWSTR lpCalData, int cchData, [Optional] uint* lpValue)
#cfunc global GetCalendarInfoW "GetCalendarInfoW" int, int, int, wstr, int, var

; int GetCalendarInfoEx(winmdroot.Foundation.PCWSTR lpLocaleName, uint Calendar, winmdroot.Foundation.PCWSTR lpReserved, uint CalType, winmdroot.Foundation.PWSTR lpCalData, int cchData, [Optional] uint* lpValue)
#cfunc global GetCalendarInfoEx "GetCalendarInfoEx" wstr, int, wstr, int, wstr, int, var

; winmdroot.Foundation.BOOL GetCalendarSupportedDateRange(uint Calendar, winmdroot.Globalization.CALDATETIME* lpCalMinDateTime, winmdroot.Globalization.CALDATETIME* lpCalMaxDateTime)
#cfunc global GetCalendarSupportedDateRange "GetCalendarSupportedDateRange" int, var, var

; winmdroot.Foundation.BOOL GetCommConfig(winmdroot.Foundation.HANDLE hCommDev, [Optional] winmdroot.Devices.Communication.COMMCONFIG* lpCC, uint* lpdwSize)
#cfunc global GetCommConfig "GetCommConfig" intptr, var, var

; winmdroot.Foundation.BOOL GetCommMask(winmdroot.Foundation.HANDLE hFile, winmdroot.Devices.Communication.COMM_EVENT_MASK* lpEvtMask)
#cfunc global GetCommMask "GetCommMask" intptr, var

; winmdroot.Foundation.BOOL GetCommModemStatus(winmdroot.Foundation.HANDLE hFile, winmdroot.Devices.Communication.MODEM_STATUS_FLAGS* lpModemStat)
#cfunc global GetCommModemStatus "GetCommModemStatus" intptr, var

; winmdroot.Foundation.BOOL GetCommProperties(winmdroot.Foundation.HANDLE hFile, winmdroot.Devices.Communication.COMMPROP* lpCommProp)
#cfunc global GetCommProperties "GetCommProperties" intptr, var

; winmdroot.Foundation.BOOL GetCommState(winmdroot.Foundation.HANDLE hFile, winmdroot.Devices.Communication.DCB* lpDCB)
#cfunc global GetCommState "GetCommState" intptr, var

; winmdroot.Foundation.BOOL GetCommTimeouts(winmdroot.Foundation.HANDLE hFile, winmdroot.Devices.Communication.COMMTIMEOUTS* lpCommTimeouts)
#cfunc global GetCommTimeouts "GetCommTimeouts" intptr, var

; winmdroot.Foundation.PCWSTR GetCommandLineW()
#cfunc global GetCommandLineW "GetCommandLineW"

; uint GetCompressedFileSize(winmdroot.Foundation.PCWSTR lpFileName, [Optional] uint* lpFileSizeHigh)
#cfunc global GetCompressedFileSizeW "GetCompressedFileSizeW" wstr, var

; uint GetCompressedFileSizeTransacted(winmdroot.Foundation.PCWSTR lpFileName, [Optional] uint* lpFileSizeHigh, winmdroot.Foundation.HANDLE hTransaction)
#cfunc global GetCompressedFileSizeTransactedW "GetCompressedFileSizeTransactedW" wstr, var, intptr

; winmdroot.Foundation.BOOL GetComputerName(winmdroot.Foundation.PWSTR lpBuffer, uint* nSize)
#cfunc global GetComputerNameW "GetComputerNameW" wstr, var

; winmdroot.Foundation.BOOL GetComputerNameEx(winmdroot.System.SystemInformation.COMPUTER_NAME_FORMAT NameType, winmdroot.Foundation.PWSTR lpBuffer, uint* nSize)
#cfunc global GetComputerNameExW "GetComputerNameExW" int, wstr, var

; uint GetConsoleAlias(winmdroot.Foundation.PWSTR Source, winmdroot.Foundation.PWSTR TargetBuffer, uint TargetBufferLength, winmdroot.Foundation.PWSTR ExeName)
#cfunc global GetConsoleAliasW "GetConsoleAliasW" wstr, wstr, int, wstr

; uint GetConsoleAliasExes(winmdroot.Foundation.PWSTR ExeNameBuffer, uint ExeNameBufferLength)
#cfunc global GetConsoleAliasExesW "GetConsoleAliasExesW" wstr, int

; uint GetConsoleAliasExesLengthW()
#cfunc global GetConsoleAliasExesLengthW "GetConsoleAliasExesLengthW"

; uint GetConsoleAliases(winmdroot.Foundation.PWSTR AliasBuffer, uint AliasBufferLength, winmdroot.Foundation.PWSTR ExeName)
#cfunc global GetConsoleAliasesW "GetConsoleAliasesW" wstr, int, wstr

; uint GetConsoleAliasesLengthW(winmdroot.Foundation.PWSTR ExeName)
#cfunc global GetConsoleAliasesLengthW "GetConsoleAliasesLengthW" wstr

; uint GetConsoleCP()
#cfunc global GetConsoleCP "GetConsoleCP"

; uint GetConsoleCommandHistoryW(winmdroot.Foundation.PWSTR Commands, uint CommandBufferLength, winmdroot.Foundation.PWSTR ExeName)
#cfunc global GetConsoleCommandHistoryW "GetConsoleCommandHistoryW" wstr, int, wstr

; uint GetConsoleCommandHistoryLengthW(winmdroot.Foundation.PWSTR ExeName)
#cfunc global GetConsoleCommandHistoryLengthW "GetConsoleCommandHistoryLengthW" wstr

; winmdroot.Foundation.BOOL GetConsoleCursorInfo(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.System.Console.CONSOLE_CURSOR_INFO* lpConsoleCursorInfo)
#cfunc global GetConsoleCursorInfo "GetConsoleCursorInfo" intptr, var

; winmdroot.Foundation.BOOL GetConsoleDisplayMode(uint* lpModeFlags)
#cfunc global GetConsoleDisplayMode "GetConsoleDisplayMode" var

; winmdroot.System.Console.COORD GetConsoleFontSize(winmdroot.Foundation.HANDLE hConsoleOutput, uint nFont)
#cfunc global GetConsoleFontSize "GetConsoleFontSize" intptr, int

; winmdroot.Foundation.BOOL GetConsoleHistoryInfo(winmdroot.System.Console.CONSOLE_HISTORY_INFO* lpConsoleHistoryInfo)
#cfunc global GetConsoleHistoryInfo "GetConsoleHistoryInfo" var

; winmdroot.Foundation.BOOL GetConsoleMode(winmdroot.Foundation.HANDLE hConsoleHandle, winmdroot.System.Console.CONSOLE_MODE* lpMode)
#cfunc global GetConsoleMode "GetConsoleMode" intptr, var

; uint GetConsoleOriginalTitle(winmdroot.Foundation.PWSTR lpConsoleTitle, uint nSize)
#cfunc global GetConsoleOriginalTitleW "GetConsoleOriginalTitleW" wstr, int

; uint GetConsoleOutputCP()
#cfunc global GetConsoleOutputCP "GetConsoleOutputCP"

; uint GetConsoleProcessList(uint* lpdwProcessList, uint dwProcessCount)
#cfunc global GetConsoleProcessList "GetConsoleProcessList" var, int

; winmdroot.Foundation.BOOL GetConsoleScreenBufferInfo(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.System.Console.CONSOLE_SCREEN_BUFFER_INFO* lpConsoleScreenBufferInfo)
#cfunc global GetConsoleScreenBufferInfo "GetConsoleScreenBufferInfo" intptr, var

; winmdroot.Foundation.BOOL GetConsoleScreenBufferInfoEx(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.System.Console.CONSOLE_SCREEN_BUFFER_INFOEX* lpConsoleScreenBufferInfoEx)
#cfunc global GetConsoleScreenBufferInfoEx "GetConsoleScreenBufferInfoEx" intptr, var

; winmdroot.Foundation.BOOL GetConsoleSelectionInfo(winmdroot.System.Console.CONSOLE_SELECTION_INFO* lpConsoleSelectionInfo)
#cfunc global GetConsoleSelectionInfo "GetConsoleSelectionInfo" var

; uint GetConsoleTitle(winmdroot.Foundation.PWSTR lpConsoleTitle, uint nSize)
#cfunc global GetConsoleTitleW "GetConsoleTitleW" wstr, int

; winmdroot.Foundation.HWND GetConsoleWindow()
#cfunc global GetConsoleWindow "GetConsoleWindow"

; int GetCurrencyFormat(uint Locale, uint dwFlags, winmdroot.Foundation.PCWSTR lpValue, [Optional] winmdroot.Globalization.CURRENCYFMTW* lpFormat, winmdroot.Foundation.PWSTR lpCurrencyStr, int cchCurrency)
#cfunc global GetCurrencyFormatW "GetCurrencyFormatW" int, int, wstr, var, wstr, int

; int GetCurrencyFormatEx(winmdroot.Foundation.PCWSTR lpLocaleName, uint dwFlags, winmdroot.Foundation.PCWSTR lpValue, [Optional] winmdroot.Globalization.CURRENCYFMTW* lpFormat, winmdroot.Foundation.PWSTR lpCurrencyStr, int cchCurrency)
#cfunc global GetCurrencyFormatEx "GetCurrencyFormatEx" wstr, int, wstr, var, wstr, int

; winmdroot.Foundation.BOOL GetCurrentActCtx(winmdroot.Foundation.HANDLE* lphActCtx)
#cfunc global GetCurrentActCtx "GetCurrentActCtx" intptr

; winmdroot.Foundation.BOOL GetCurrentConsoleFont(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.Foundation.BOOL bMaximumWindow, winmdroot.System.Console.CONSOLE_FONT_INFO* lpConsoleCurrentFont)
#cfunc global GetCurrentConsoleFont "GetCurrentConsoleFont" intptr, int, var

; winmdroot.Foundation.BOOL GetCurrentConsoleFontEx(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.Foundation.BOOL bMaximumWindow, winmdroot.System.Console.CONSOLE_FONT_INFOEX* lpConsoleCurrentFontEx)
#cfunc global GetCurrentConsoleFontEx "GetCurrentConsoleFontEx" intptr, int, var

; uint GetCurrentDirectoryW(uint nBufferLength, winmdroot.Foundation.PWSTR lpBuffer)
#cfunc global GetCurrentDirectoryW "GetCurrentDirectoryW" int, wstr

; winmdroot.Foundation.HANDLE GetCurrentProcess()
#cfunc global GetCurrentProcess "GetCurrentProcess"

; uint GetCurrentProcessId()
#cfunc global GetCurrentProcessId "GetCurrentProcessId"

; winmdroot.Foundation.HANDLE GetCurrentThread()
#cfunc global GetCurrentThread "GetCurrentThread"

; uint GetCurrentThreadId()
#cfunc global GetCurrentThreadId "GetCurrentThreadId"

; void* GetCurrentUmsThread()
#cfunc global GetCurrentUmsThread "GetCurrentUmsThread"

; int GetDateFormat(uint Locale, uint dwFlags, [Optional] winmdroot.Foundation.SYSTEMTIME* lpDate, winmdroot.Foundation.PCWSTR lpFormat, winmdroot.Foundation.PWSTR lpDateStr, int cchDate)
#cfunc global GetDateFormatW "GetDateFormatW" int, int, var, wstr, wstr, int

; int GetDateFormatEx(winmdroot.Foundation.PCWSTR lpLocaleName, winmdroot.Globalization.ENUM_DATE_FORMATS_FLAGS dwFlags, [Optional] winmdroot.Foundation.SYSTEMTIME* lpDate, winmdroot.Foundation.PCWSTR lpFormat, winmdroot.Foundation.PWSTR lpDateStr, int cchDate, winmdroot.Foundation.PCWSTR lpCalendar)
#cfunc global GetDateFormatEx "GetDateFormatEx" wstr, int, var, wstr, wstr, int, wstr

; winmdroot.Foundation.BOOL GetDefaultCommConfig(winmdroot.Foundation.PCWSTR lpszName, winmdroot.Devices.Communication.COMMCONFIG* lpCC, uint* lpdwSize)
#cfunc global GetDefaultCommConfigW "GetDefaultCommConfigW" wstr, var, var

; winmdroot.Foundation.BOOL GetDevicePowerState(winmdroot.Foundation.HANDLE hDevice, winmdroot.Foundation.BOOL* pfOn)
#cfunc global GetDevicePowerState "GetDevicePowerState" intptr, var

; winmdroot.Foundation.BOOL GetDiskFreeSpace(winmdroot.Foundation.PCWSTR lpRootPathName, [Optional] uint* lpSectorsPerCluster, [Optional] uint* lpBytesPerSector, [Optional] uint* lpNumberOfFreeClusters, [Optional] uint* lpTotalNumberOfClusters)
#cfunc global GetDiskFreeSpaceW "GetDiskFreeSpaceW" wstr, var, var, var, var

; winmdroot.Foundation.BOOL GetDiskFreeSpaceEx(winmdroot.Foundation.PCWSTR lpDirectoryName, [Optional] ulong* lpFreeBytesAvailableToCaller, [Optional] ulong* lpTotalNumberOfBytes, [Optional] ulong* lpTotalNumberOfFreeBytes)
#cfunc global GetDiskFreeSpaceExW "GetDiskFreeSpaceExW" wstr, var, var, var

; uint GetDllDirectory(uint nBufferLength, winmdroot.Foundation.PWSTR lpBuffer)
#cfunc global GetDllDirectoryW "GetDllDirectoryW" int, wstr

; uint GetDriveTypeW(winmdroot.Foundation.PCWSTR lpRootPathName)
#cfunc global GetDriveTypeW "GetDriveTypeW" wstr

; int GetDurationFormat(uint Locale, uint dwFlags, [Optional] winmdroot.Foundation.SYSTEMTIME* lpDuration, ulong ullDuration, winmdroot.Foundation.PCWSTR lpFormat, winmdroot.Foundation.PWSTR lpDurationStr, int cchDuration)
#cfunc global GetDurationFormat "GetDurationFormat" int, int, var, int64, wstr, wstr, int

; int GetDurationFormatEx(winmdroot.Foundation.PCWSTR lpLocaleName, uint dwFlags, [Optional] winmdroot.Foundation.SYSTEMTIME* lpDuration, ulong ullDuration, winmdroot.Foundation.PCWSTR lpFormat, winmdroot.Foundation.PWSTR lpDurationStr, int cchDuration)
#cfunc global GetDurationFormatEx "GetDurationFormatEx" wstr, int, var, int64, wstr, wstr, int

; uint GetDynamicTimeZoneInformation(winmdroot.System.Time.DYNAMIC_TIME_ZONE_INFORMATION* pTimeZoneInformation)
#cfunc global GetDynamicTimeZoneInformation "GetDynamicTimeZoneInformation" var

; winmdroot.Foundation.PSTR GetEnvironmentStrings()
#cfunc global GetEnvironmentStrings "GetEnvironmentStrings"

; uint GetEnvironmentVariable(winmdroot.Foundation.PCWSTR lpName, winmdroot.Foundation.PWSTR lpBuffer, uint nSize)
#cfunc global GetEnvironmentVariableW "GetEnvironmentVariableW" wstr, wstr, int

; uint GetErrorMode()
#cfunc global GetErrorMode "GetErrorMode"

; winmdroot.Foundation.BOOL GetExitCodeProcess(winmdroot.Foundation.HANDLE hProcess, uint* lpExitCode)
#cfunc global GetExitCodeProcess "GetExitCodeProcess" intptr, var

; winmdroot.Foundation.BOOL GetExitCodeThread(winmdroot.Foundation.HANDLE hThread, uint* lpExitCode)
#cfunc global GetExitCodeThread "GetExitCodeThread" intptr, var

; int GetExpandedName(winmdroot.Foundation.PWSTR lpszSource, winmdroot.Foundation.PWSTR lpszBuffer)
#cfunc global GetExpandedNameW "GetExpandedNameW" wstr, wstr

; uint GetFileAttributes(winmdroot.Foundation.PCWSTR lpFileName)
#cfunc global GetFileAttributesW "GetFileAttributesW" wstr

; winmdroot.Foundation.BOOL GetFileAttributesEx(winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Storage.FileSystem.GET_FILEEX_INFO_LEVELS fInfoLevelId, void* lpFileInformation)
#cfunc global GetFileAttributesExW "GetFileAttributesExW" wstr, int, intptr

; winmdroot.Foundation.BOOL GetFileAttributesTransacted(winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Storage.FileSystem.GET_FILEEX_INFO_LEVELS fInfoLevelId, void* lpFileInformation, winmdroot.Foundation.HANDLE hTransaction)
#cfunc global GetFileAttributesTransactedW "GetFileAttributesTransactedW" wstr, int, intptr, intptr

; winmdroot.Foundation.BOOL GetFileBandwidthReservation(winmdroot.Foundation.HANDLE hFile, uint* lpPeriodMilliseconds, uint* lpBytesPerPeriod, winmdroot.Foundation.BOOL* pDiscardable, uint* lpTransferSize, uint* lpNumOutstandingRequests)
#cfunc global GetFileBandwidthReservation "GetFileBandwidthReservation" intptr, var, var, var, var, var

; winmdroot.Foundation.BOOL GetFileInformationByHandle(winmdroot.Foundation.HANDLE hFile, winmdroot.Storage.FileSystem.BY_HANDLE_FILE_INFORMATION* lpFileInformation)
#cfunc global GetFileInformationByHandle "GetFileInformationByHandle" intptr, var

; winmdroot.Foundation.BOOL GetFileInformationByHandleEx(winmdroot.Foundation.HANDLE hFile, winmdroot.Storage.FileSystem.FILE_INFO_BY_HANDLE_CLASS FileInformationClass, void* lpFileInformation, uint dwBufferSize)
#cfunc global GetFileInformationByHandleEx "GetFileInformationByHandleEx" intptr, int, intptr, int

; winmdroot.Foundation.BOOL GetFileMUIInfo(uint dwFlags, winmdroot.Foundation.PCWSTR pcwszFilePath, [Optional] winmdroot.Globalization.FILEMUIINFO* pFileMUIInfo, uint* pcbFileMUIInfo)
#cfunc global GetFileMUIInfo "GetFileMUIInfo" int, wstr, var, var

; winmdroot.Foundation.BOOL GetFileMUIPath(uint dwFlags, winmdroot.Foundation.PCWSTR pcwszFilePath, winmdroot.Foundation.PWSTR pwszLanguage, uint* pcchLanguage, winmdroot.Foundation.PWSTR pwszFileMUIPath, uint* pcchFileMUIPath, ulong* pululEnumerator)
#cfunc global GetFileMUIPath "GetFileMUIPath" int, wstr, wstr, var, wstr, var, var

; uint GetFileSize(winmdroot.Foundation.HANDLE hFile, [Optional] uint* lpFileSizeHigh)
#cfunc global GetFileSize "GetFileSize" intptr, var

; winmdroot.Foundation.BOOL GetFileSizeEx(winmdroot.Foundation.HANDLE hFile, long* lpFileSize)
#cfunc global GetFileSizeEx "GetFileSizeEx" intptr, var

; winmdroot.Foundation.BOOL GetFileTime(winmdroot.Foundation.HANDLE hFile, [Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* lpCreationTime, [Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* lpLastAccessTime, [Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* lpLastWriteTime)
#cfunc global GetFileTime "GetFileTime" intptr, var, var, var

; winmdroot.Storage.FileSystem.FILE_TYPE GetFileType(winmdroot.Foundation.HANDLE hFile)
#cfunc global GetFileType "GetFileType" intptr

; uint GetFinalPathNameByHandle(winmdroot.Foundation.HANDLE hFile, winmdroot.Foundation.PWSTR lpszFilePath, uint cchFilePath, winmdroot.Storage.FileSystem.GETFINALPATHNAMEBYHANDLE_FLAGS dwFlags)
#cfunc global GetFinalPathNameByHandleW "GetFinalPathNameByHandleW" intptr, wstr, int, int

; uint GetFirmwareEnvironmentVariable(winmdroot.Foundation.PCWSTR lpName, winmdroot.Foundation.PCWSTR lpGuid, [Optional] void* pBuffer, uint nSize)
#cfunc global GetFirmwareEnvironmentVariableW "GetFirmwareEnvironmentVariableW" wstr, wstr, intptr, int

; uint GetFirmwareEnvironmentVariableEx(winmdroot.Foundation.PCWSTR lpName, winmdroot.Foundation.PCWSTR lpGuid, [Optional] void* pBuffer, uint nSize, [Optional] uint* pdwAttribubutes)
#cfunc global GetFirmwareEnvironmentVariableExW "GetFirmwareEnvironmentVariableExW" wstr, wstr, intptr, int, var

; winmdroot.Foundation.BOOL GetFirmwareType(winmdroot.System.SystemInformation.FIRMWARE_TYPE* FirmwareType)
#cfunc global GetFirmwareType "GetFirmwareType" var

; uint GetFullPathName(winmdroot.Foundation.PCWSTR lpFileName, uint nBufferLength, winmdroot.Foundation.PWSTR lpBuffer, [Optional] winmdroot.Foundation.PWSTR* lpFilePart)
#cfunc global GetFullPathNameW "GetFullPathNameW" wstr, int, wstr, var

; uint GetFullPathNameTransacted(winmdroot.Foundation.PCWSTR lpFileName, uint nBufferLength, winmdroot.Foundation.PWSTR lpBuffer, [Optional] winmdroot.Foundation.PWSTR* lpFilePart, winmdroot.Foundation.HANDLE hTransaction)
#cfunc global GetFullPathNameTransactedW "GetFullPathNameTransactedW" wstr, int, wstr, var, intptr

; int GetGeoInfo(int Location, winmdroot.Globalization.SYSGEOTYPE GeoType, winmdroot.Foundation.PWSTR lpGeoData, int cchData, ushort LangId)
#cfunc global GetGeoInfoW "GetGeoInfoW" int, int, wstr, int, int

; int GetGeoInfoEx(winmdroot.Foundation.PWSTR location, winmdroot.Globalization.SYSGEOTYPE geoType, winmdroot.Foundation.PWSTR geoData, int geoDataCount)
#cfunc global GetGeoInfoEx "GetGeoInfoEx" wstr, int, wstr, int

; winmdroot.Foundation.BOOL GetHandleInformation(winmdroot.Foundation.HANDLE hObject, uint* lpdwFlags)
#cfunc global GetHandleInformation "GetHandleInformation" intptr, var

; nuint GetLargePageMinimum()
#cfunc global GetLargePageMinimum "GetLargePageMinimum"

; winmdroot.System.Console.COORD GetLargestConsoleWindowSize(winmdroot.Foundation.HANDLE hConsoleOutput)
#cfunc global GetLargestConsoleWindowSize "GetLargestConsoleWindowSize" intptr

; void GetLocalTime(winmdroot.Foundation.SYSTEMTIME* lpSystemTime)
#func global GetLocalTime "GetLocalTime" var

; int GetLocaleInfo(uint Locale, uint LCType, winmdroot.Foundation.PWSTR lpLCData, int cchData)
#cfunc global GetLocaleInfoW "GetLocaleInfoW" int, int, wstr, int

; int GetLocaleInfoEx(winmdroot.Foundation.PCWSTR lpLocaleName, uint LCType, winmdroot.Foundation.PWSTR lpLCData, int cchData)
#cfunc global GetLocaleInfoEx "GetLocaleInfoEx" wstr, int, wstr, int

; uint GetLogicalDriveStrings(uint nBufferLength, winmdroot.Foundation.PWSTR lpBuffer)
#cfunc global GetLogicalDriveStringsW "GetLogicalDriveStringsW" int, wstr

; uint GetLogicalDrives()
#cfunc global GetLogicalDrives "GetLogicalDrives"

; winmdroot.Foundation.BOOL GetLogicalProcessorInformation([Optional] winmdroot.System.SystemInformation.SYSTEM_LOGICAL_PROCESSOR_INFORMATION* Buffer, uint* ReturnedLength)
#cfunc global GetLogicalProcessorInformation "GetLogicalProcessorInformation" var, var

; uint GetLongPathName(winmdroot.Foundation.PCWSTR lpszShortPath, winmdroot.Foundation.PWSTR lpszLongPath, uint cchBuffer)
#cfunc global GetLongPathNameW "GetLongPathNameW" wstr, wstr, int

; uint GetLongPathNameTransacted(winmdroot.Foundation.PCWSTR lpszShortPath, winmdroot.Foundation.PWSTR lpszLongPath, uint cchBuffer, winmdroot.Foundation.HANDLE hTransaction)
#cfunc global GetLongPathNameTransactedW "GetLongPathNameTransactedW" wstr, wstr, int, intptr

; winmdroot.Foundation.BOOL GetMailslotInfo(winmdroot.Foundation.HANDLE hMailslot, [Optional] uint* lpMaxMessageSize, [Optional] uint* lpNextSize, [Optional] uint* lpMessageCount, [Optional] uint* lpReadTimeout)
#cfunc global GetMailslotInfo "GetMailslotInfo" intptr, var, var, var, var

; uint GetMaximumProcessorCount(ushort GroupNumber)
#cfunc global GetMaximumProcessorCount "GetMaximumProcessorCount" int

; ushort GetMaximumProcessorGroupCount()
#cfunc global GetMaximumProcessorGroupCount "GetMaximumProcessorGroupCount"

; winmdroot.Foundation.BOOL GetMemoryErrorHandlingCapabilities(uint* Capabilities)
#cfunc global GetMemoryErrorHandlingCapabilities "GetMemoryErrorHandlingCapabilities" var

; uint GetModuleFileName(winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.PWSTR lpFilename, uint nSize)
#cfunc global GetModuleFileNameW "GetModuleFileNameW" intptr, wstr, int

; winmdroot.Foundation.HMODULE GetModuleHandle(winmdroot.Foundation.PCWSTR lpModuleName)
#cfunc global GetModuleHandleW "GetModuleHandleW" wstr

; winmdroot.Foundation.BOOL GetModuleHandleEx(uint dwFlags, winmdroot.Foundation.PCWSTR lpModuleName, winmdroot.Foundation.HMODULE* phModule)
#cfunc global GetModuleHandleExW "GetModuleHandleExW" int, wstr, intptr

; winmdroot.Foundation.BOOL GetNLSVersion(uint Function, uint Locale, winmdroot.Globalization.NLSVERSIONINFO* lpVersionInformation)
#cfunc global GetNLSVersion "GetNLSVersion" int, int, var

; winmdroot.Foundation.BOOL GetNLSVersionEx(uint function, winmdroot.Foundation.PCWSTR lpLocaleName, winmdroot.Globalization.NLSVERSIONINFOEX* lpVersionInformation)
#cfunc global GetNLSVersionEx "GetNLSVersionEx" int, wstr, var

; winmdroot.Foundation.BOOL GetNamedPipeClientComputerNameW(winmdroot.Foundation.HANDLE Pipe, winmdroot.Foundation.PWSTR ClientComputerName, uint ClientComputerNameLength)
#cfunc global GetNamedPipeClientComputerNameW "GetNamedPipeClientComputerNameW" intptr, wstr, int

; winmdroot.Foundation.BOOL GetNamedPipeClientProcessId(winmdroot.Foundation.HANDLE Pipe, uint* ClientProcessId)
#cfunc global GetNamedPipeClientProcessId "GetNamedPipeClientProcessId" intptr, var

; winmdroot.Foundation.BOOL GetNamedPipeClientSessionId(winmdroot.Foundation.HANDLE Pipe, uint* ClientSessionId)
#cfunc global GetNamedPipeClientSessionId "GetNamedPipeClientSessionId" intptr, var

; winmdroot.Foundation.BOOL GetNamedPipeHandleStateW(winmdroot.Foundation.HANDLE hNamedPipe, [Optional] winmdroot.System.Pipes.NAMED_PIPE_MODE* lpState, [Optional] uint* lpCurInstances, [Optional] uint* lpMaxCollectionCount, [Optional] uint* lpCollectDataTimeout, winmdroot.Foundation.PWSTR lpUserName, uint nMaxUserNameSize)
#cfunc global GetNamedPipeHandleStateW "GetNamedPipeHandleStateW" intptr, var, var, var, var, wstr, int

; winmdroot.Foundation.BOOL GetNamedPipeServerProcessId(winmdroot.Foundation.HANDLE Pipe, uint* ServerProcessId)
#cfunc global GetNamedPipeServerProcessId "GetNamedPipeServerProcessId" intptr, var

; winmdroot.Foundation.BOOL GetNamedPipeServerSessionId(winmdroot.Foundation.HANDLE Pipe, uint* ServerSessionId)
#cfunc global GetNamedPipeServerSessionId "GetNamedPipeServerSessionId" intptr, var

; void GetNativeSystemInfo(winmdroot.System.SystemInformation.SYSTEM_INFO* lpSystemInfo)
#func global GetNativeSystemInfo "GetNativeSystemInfo" var

; void* GetNextUmsListItem(void* UmsContext)
#cfunc global GetNextUmsListItem "GetNextUmsListItem" intptr

; winmdroot.Foundation.BOOL GetNumaAvailableMemoryNode(byte Node, ulong* AvailableBytes)
#cfunc global GetNumaAvailableMemoryNode "GetNumaAvailableMemoryNode" int, var

; winmdroot.Foundation.BOOL GetNumaAvailableMemoryNodeEx(ushort Node, ulong* AvailableBytes)
#cfunc global GetNumaAvailableMemoryNodeEx "GetNumaAvailableMemoryNodeEx" int, var

; winmdroot.Foundation.BOOL GetNumaHighestNodeNumber(uint* HighestNodeNumber)
#cfunc global GetNumaHighestNodeNumber "GetNumaHighestNodeNumber" var

; winmdroot.Foundation.BOOL GetNumaNodeNumberFromHandle(winmdroot.Foundation.HANDLE hFile, ushort* NodeNumber)
#cfunc global GetNumaNodeNumberFromHandle "GetNumaNodeNumberFromHandle" intptr, var

; winmdroot.Foundation.BOOL GetNumaNodeProcessorMask(byte Node, ulong* ProcessorMask)
#cfunc global GetNumaNodeProcessorMask "GetNumaNodeProcessorMask" int, var

; winmdroot.Foundation.BOOL GetNumaNodeProcessorMaskEx(ushort Node, winmdroot.System.SystemInformation.GROUP_AFFINITY* ProcessorMask)
#cfunc global GetNumaNodeProcessorMaskEx "GetNumaNodeProcessorMaskEx" int, var

; winmdroot.Foundation.BOOL GetNumaProcessorNode(byte Processor, byte* NodeNumber)
#cfunc global GetNumaProcessorNode "GetNumaProcessorNode" int, var

; winmdroot.Foundation.BOOL GetNumaProcessorNodeEx(winmdroot.System.Kernel.PROCESSOR_NUMBER* Processor, ushort* NodeNumber)
#cfunc global GetNumaProcessorNodeEx "GetNumaProcessorNodeEx" var, var

; winmdroot.Foundation.BOOL GetNumaProximityNode(uint ProximityId, byte* NodeNumber)
#cfunc global GetNumaProximityNode "GetNumaProximityNode" int, var

; winmdroot.Foundation.BOOL GetNumaProximityNodeEx(uint ProximityId, ushort* NodeNumber)
#cfunc global GetNumaProximityNodeEx "GetNumaProximityNodeEx" int, var

; int GetNumberFormat(uint Locale, uint dwFlags, winmdroot.Foundation.PCWSTR lpValue, [Optional] winmdroot.Globalization.NUMBERFMTW* lpFormat, winmdroot.Foundation.PWSTR lpNumberStr, int cchNumber)
#cfunc global GetNumberFormatW "GetNumberFormatW" int, int, wstr, var, wstr, int

; int GetNumberFormatEx(winmdroot.Foundation.PCWSTR lpLocaleName, uint dwFlags, winmdroot.Foundation.PCWSTR lpValue, [Optional] winmdroot.Globalization.NUMBERFMTW* lpFormat, winmdroot.Foundation.PWSTR lpNumberStr, int cchNumber)
#cfunc global GetNumberFormatEx "GetNumberFormatEx" wstr, int, wstr, var, wstr, int

; winmdroot.Foundation.BOOL GetNumberOfConsoleInputEvents(winmdroot.Foundation.HANDLE hConsoleInput, uint* lpNumberOfEvents)
#cfunc global GetNumberOfConsoleInputEvents "GetNumberOfConsoleInputEvents" intptr, var

; winmdroot.Foundation.BOOL GetNumberOfConsoleMouseButtons(uint* lpNumberOfMouseButtons)
#cfunc global GetNumberOfConsoleMouseButtons "GetNumberOfConsoleMouseButtons" var

; uint GetOEMCP()
#cfunc global GetOEMCP "GetOEMCP"

; winmdroot.Foundation.BOOL GetOverlappedResult(winmdroot.Foundation.HANDLE hFile, global::System.Threading.NativeOverlapped* lpOverlapped, uint* lpNumberOfBytesTransferred, winmdroot.Foundation.BOOL bWait)
#cfunc global GetOverlappedResult "GetOverlappedResult" intptr, var, var, int

; winmdroot.Foundation.BOOL GetPhysicallyInstalledSystemMemory(ulong* TotalMemoryInKilobytes)
#cfunc global GetPhysicallyInstalledSystemMemory "GetPhysicallyInstalledSystemMemory" var

; uint GetPriorityClass(winmdroot.Foundation.HANDLE hProcess)
#cfunc global GetPriorityClass "GetPriorityClass" intptr

; int GetPrivateProfileIntW(winmdroot.Foundation.PCWSTR lpAppName, winmdroot.Foundation.PCWSTR lpKeyName, int nDefault, winmdroot.Foundation.PCWSTR lpFileName)
#cfunc global GetPrivateProfileIntW "GetPrivateProfileIntW" wstr, wstr, int, wstr

; uint GetPrivateProfileSectionW(winmdroot.Foundation.PCWSTR lpAppName, winmdroot.Foundation.PWSTR lpReturnedString, uint nSize, winmdroot.Foundation.PCWSTR lpFileName)
#cfunc global GetPrivateProfileSectionW "GetPrivateProfileSectionW" wstr, wstr, int, wstr

; uint GetPrivateProfileSectionNamesW(winmdroot.Foundation.PWSTR lpszReturnBuffer, uint nSize, winmdroot.Foundation.PCWSTR lpFileName)
#cfunc global GetPrivateProfileSectionNamesW "GetPrivateProfileSectionNamesW" wstr, int, wstr

; uint GetPrivateProfileString(winmdroot.Foundation.PCWSTR lpAppName, winmdroot.Foundation.PCWSTR lpKeyName, winmdroot.Foundation.PCWSTR lpDefault, winmdroot.Foundation.PWSTR lpReturnedString, uint nSize, winmdroot.Foundation.PCWSTR lpFileName)
#cfunc global GetPrivateProfileStringW "GetPrivateProfileStringW" wstr, wstr, wstr, wstr, int, wstr

; winmdroot.Foundation.BOOL GetPrivateProfileStructW(winmdroot.Foundation.PCWSTR lpszSection, winmdroot.Foundation.PCWSTR lpszKey, [Optional] void* lpStruct, uint uSizeStruct, winmdroot.Foundation.PCWSTR szFile)
#cfunc global GetPrivateProfileStructW "GetPrivateProfileStructW" wstr, wstr, intptr, int, wstr

; winmdroot.Foundation.FARPROC GetProcAddress(winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.PCSTR lpProcName)
#cfunc global GetProcAddress "GetProcAddress" intptr, str

; winmdroot.Foundation.BOOL GetProcessAffinityMask(winmdroot.Foundation.HANDLE hProcess, nuint* lpProcessAffinityMask, nuint* lpSystemAffinityMask)
#cfunc global GetProcessAffinityMask "GetProcessAffinityMask" intptr, var, var

; winmdroot.Foundation.BOOL GetProcessDEPPolicy(winmdroot.Foundation.HANDLE hProcess, uint* lpFlags, winmdroot.Foundation.BOOL* lpPermanent)
#cfunc global GetProcessDEPPolicy "GetProcessDEPPolicy" intptr, var, var

; winmdroot.Foundation.BOOL GetProcessGroupAffinity(winmdroot.Foundation.HANDLE hProcess, ushort* GroupCount, ushort* GroupArray)
#cfunc global GetProcessGroupAffinity "GetProcessGroupAffinity" intptr, var, var

; winmdroot.Foundation.BOOL GetProcessHandleCount(winmdroot.Foundation.HANDLE hProcess, uint* pdwHandleCount)
#cfunc global GetProcessHandleCount "GetProcessHandleCount" intptr, var

; winmdroot.Foundation.HANDLE GetProcessHeap()
#cfunc global GetProcessHeap "GetProcessHeap"

; uint GetProcessHeaps(uint NumberOfHeaps, winmdroot.Foundation.HANDLE* ProcessHeaps)
#cfunc global GetProcessHeaps "GetProcessHeaps" int, intptr

; uint GetProcessId(winmdroot.Foundation.HANDLE Process)
#cfunc global GetProcessId "GetProcessId" intptr

; uint GetProcessIdOfThread(winmdroot.Foundation.HANDLE Thread)
#cfunc global GetProcessIdOfThread "GetProcessIdOfThread" intptr

; winmdroot.Foundation.BOOL GetProcessInformation(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.Threading.PROCESS_INFORMATION_CLASS ProcessInformationClass, void* ProcessInformation, uint ProcessInformationSize)
#cfunc global GetProcessInformation "GetProcessInformation" intptr, int, intptr, int

; winmdroot.Foundation.BOOL GetProcessIoCounters(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.Threading.IO_COUNTERS* lpIoCounters)
#cfunc global GetProcessIoCounters "GetProcessIoCounters" intptr, var

; winmdroot.Foundation.BOOL GetProcessPreferredUILanguages(uint dwFlags, uint* pulNumLanguages, winmdroot.Foundation.PZZWSTR pwszLanguagesBuffer, uint* pcchLanguagesBuffer)
#cfunc global GetProcessPreferredUILanguages "GetProcessPreferredUILanguages" int, var, int, var

; winmdroot.Foundation.BOOL GetProcessPriorityBoost(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.BOOL* pDisablePriorityBoost)
#cfunc global GetProcessPriorityBoost "GetProcessPriorityBoost" intptr, var

; winmdroot.Foundation.BOOL GetProcessShutdownParameters(uint* lpdwLevel, uint* lpdwFlags)
#cfunc global GetProcessShutdownParameters "GetProcessShutdownParameters" var, var

; winmdroot.Foundation.BOOL GetProcessTimes(winmdroot.Foundation.HANDLE hProcess, global::System.Runtime.InteropServices.ComTypes.FILETIME* lpCreationTime, global::System.Runtime.InteropServices.ComTypes.FILETIME* lpExitTime, global::System.Runtime.InteropServices.ComTypes.FILETIME* lpKernelTime, global::System.Runtime.InteropServices.ComTypes.FILETIME* lpUserTime)
#cfunc global GetProcessTimes "GetProcessTimes" intptr, var, var, var, var

; uint GetProcessVersion(uint ProcessId)
#cfunc global GetProcessVersion "GetProcessVersion" int

; winmdroot.Foundation.BOOL GetProcessWorkingSetSize(winmdroot.Foundation.HANDLE hProcess, nuint* lpMinimumWorkingSetSize, nuint* lpMaximumWorkingSetSize)
#cfunc global GetProcessWorkingSetSize "GetProcessWorkingSetSize" intptr, var, var

; winmdroot.Foundation.BOOL GetProcessWorkingSetSizeEx(winmdroot.Foundation.HANDLE hProcess, nuint* lpMinimumWorkingSetSize, nuint* lpMaximumWorkingSetSize, uint* Flags)
#cfunc global GetProcessWorkingSetSizeEx "GetProcessWorkingSetSizeEx" intptr, var, var, var

; winmdroot.Foundation.BOOL GetProductInfo(uint dwOSMajorVersion, uint dwOSMinorVersion, uint dwSpMajorVersion, uint dwSpMinorVersion, winmdroot.System.SystemInformation.OS_PRODUCT_TYPE* pdwReturnedProductType)
#cfunc global GetProductInfo "GetProductInfo" int, int, int, int, var

; uint GetProfileIntW(winmdroot.Foundation.PCWSTR lpAppName, winmdroot.Foundation.PCWSTR lpKeyName, int nDefault)
#cfunc global GetProfileIntW "GetProfileIntW" wstr, wstr, int

; uint GetProfileSectionW(winmdroot.Foundation.PCWSTR lpAppName, winmdroot.Foundation.PWSTR lpReturnedString, uint nSize)
#cfunc global GetProfileSectionW "GetProfileSectionW" wstr, wstr, int

; uint GetProfileStringW(winmdroot.Foundation.PCWSTR lpAppName, winmdroot.Foundation.PCWSTR lpKeyName, winmdroot.Foundation.PCWSTR lpDefault, winmdroot.Foundation.PWSTR lpReturnedString, uint nSize)
#cfunc global GetProfileStringW "GetProfileStringW" wstr, wstr, wstr, wstr, int

; winmdroot.Foundation.BOOL GetQueuedCompletionStatus(winmdroot.Foundation.HANDLE CompletionPort, uint* lpNumberOfBytesTransferred, nuint* lpCompletionKey, global::System.Threading.NativeOverlapped** lpOverlapped, uint dwMilliseconds)
#cfunc global GetQueuedCompletionStatus "GetQueuedCompletionStatus" intptr, var, var, var, int

; winmdroot.Foundation.BOOL GetQueuedCompletionStatusEx(winmdroot.Foundation.HANDLE CompletionPort, winmdroot.System.IO.OVERLAPPED_ENTRY* lpCompletionPortEntries, uint ulCount, uint* ulNumEntriesRemoved, uint dwMilliseconds, winmdroot.Foundation.BOOL fAlertable)
#cfunc global GetQueuedCompletionStatusEx "GetQueuedCompletionStatusEx" intptr, var, int, var, int, int

; uint GetShortPathName(winmdroot.Foundation.PCWSTR lpszLongPath, winmdroot.Foundation.PWSTR lpszShortPath, uint cchBuffer)
#cfunc global GetShortPathNameW "GetShortPathNameW" wstr, wstr, int

; void GetStartupInfoW(winmdroot.System.Threading.STARTUPINFOW* lpStartupInfo)
#func global GetStartupInfoW "GetStartupInfoW" var

; winmdroot.Foundation.HANDLE GetStdHandle(winmdroot.System.Console.STD_HANDLE nStdHandle)
#cfunc global GetStdHandle "GetStdHandle" int

; int GetStringScripts(uint dwFlags, winmdroot.Foundation.PCWSTR lpString, int cchString, winmdroot.Foundation.PWSTR lpScripts, int cchScripts)
#cfunc global GetStringScripts "GetStringScripts" int, wstr, int, wstr, int

; winmdroot.Foundation.BOOL GetStringType(uint dwInfoType, winmdroot.Foundation.PCWSTR lpSrcStr, int cchSrc, ushort* lpCharType)
#cfunc global GetStringTypeW "GetStringTypeW" int, wstr, int, var

; winmdroot.Foundation.BOOL GetStringTypeEx(uint Locale, uint dwInfoType, winmdroot.Foundation.PCWSTR lpSrcStr, int cchSrc, ushort* lpCharType)
#cfunc global GetStringTypeExW "GetStringTypeExW" int, int, wstr, int, var

; winmdroot.System.SystemInformation.DEP_SYSTEM_POLICY_TYPE GetSystemDEPPolicy()
#cfunc global GetSystemDEPPolicy "GetSystemDEPPolicy"

; uint GetSystemDefaultLCID()
#cfunc global GetSystemDefaultLCID "GetSystemDefaultLCID"

; ushort GetSystemDefaultLangID()
#cfunc global GetSystemDefaultLangID "GetSystemDefaultLangID"

; int GetSystemDefaultLocaleName(winmdroot.Foundation.PWSTR lpLocaleName, int cchLocaleName)
#cfunc global GetSystemDefaultLocaleName "GetSystemDefaultLocaleName" wstr, int

; ushort GetSystemDefaultUILanguage()
#cfunc global GetSystemDefaultUILanguage "GetSystemDefaultUILanguage"

; uint GetSystemDirectory(winmdroot.Foundation.PWSTR lpBuffer, uint uSize)
#cfunc global GetSystemDirectoryW "GetSystemDirectoryW" wstr, int

; winmdroot.Foundation.BOOL GetSystemFileCacheSize(nuint* lpMinimumFileCacheSize, nuint* lpMaximumFileCacheSize, uint* lpFlags)
#cfunc global GetSystemFileCacheSize "GetSystemFileCacheSize" var, var, var

; uint GetSystemFirmwareTable(winmdroot.System.SystemInformation.FIRMWARE_TABLE_PROVIDER FirmwareTableProviderSignature, uint FirmwareTableID, [Optional] byte* pFirmwareTableBuffer, uint BufferSize)
#cfunc global GetSystemFirmwareTable "GetSystemFirmwareTable" int, int, var, int

; void GetSystemInfo(winmdroot.System.SystemInformation.SYSTEM_INFO* lpSystemInfo)
#func global GetSystemInfo "GetSystemInfo" var

; winmdroot.Foundation.BOOL GetSystemPowerStatus(winmdroot.System.Power.SYSTEM_POWER_STATUS* lpSystemPowerStatus)
#cfunc global GetSystemPowerStatus "GetSystemPowerStatus" var

; winmdroot.Foundation.BOOL GetSystemPreferredUILanguages(uint dwFlags, uint* pulNumLanguages, winmdroot.Foundation.PZZWSTR pwszLanguagesBuffer, uint* pcchLanguagesBuffer)
#cfunc global GetSystemPreferredUILanguages "GetSystemPreferredUILanguages" int, var, int, var

; winmdroot.Foundation.BOOL GetSystemRegistryQuota([Optional] uint* pdwQuotaAllowed, [Optional] uint* pdwQuotaUsed)
#cfunc global GetSystemRegistryQuota "GetSystemRegistryQuota" var, var

; void GetSystemTime(winmdroot.Foundation.SYSTEMTIME* lpSystemTime)
#func global GetSystemTime "GetSystemTime" var

; winmdroot.Foundation.BOOL GetSystemTimeAdjustment(uint* lpTimeAdjustment, uint* lpTimeIncrement, winmdroot.Foundation.BOOL* lpTimeAdjustmentDisabled)
#cfunc global GetSystemTimeAdjustment "GetSystemTimeAdjustment" var, var, var

; void GetSystemTimeAsFileTime(global::System.Runtime.InteropServices.ComTypes.FILETIME* lpSystemTimeAsFileTime)
#func global GetSystemTimeAsFileTime "GetSystemTimeAsFileTime" var

; void GetSystemTimePreciseAsFileTime(global::System.Runtime.InteropServices.ComTypes.FILETIME* lpSystemTimeAsFileTime)
#func global GetSystemTimePreciseAsFileTime "GetSystemTimePreciseAsFileTime" var

; winmdroot.Foundation.BOOL GetSystemTimes([Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* lpIdleTime, [Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* lpKernelTime, [Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* lpUserTime)
#cfunc global GetSystemTimes "GetSystemTimes" var, var, var

; uint GetSystemWindowsDirectory(winmdroot.Foundation.PWSTR lpBuffer, uint uSize)
#cfunc global GetSystemWindowsDirectoryW "GetSystemWindowsDirectoryW" wstr, int

; uint GetSystemWow64Directory(winmdroot.Foundation.PWSTR lpBuffer, uint uSize)
#cfunc global GetSystemWow64DirectoryW "GetSystemWow64DirectoryW" wstr, int

; uint GetTapeParameters(winmdroot.Foundation.HANDLE hDevice, winmdroot.Storage.FileSystem.GET_TAPE_DRIVE_PARAMETERS_OPERATION dwOperation, uint* lpdwSize, void* lpTapeInformation)
#cfunc global GetTapeParameters "GetTapeParameters" intptr, int, var, intptr

; uint GetTapePosition(winmdroot.Foundation.HANDLE hDevice, winmdroot.Storage.FileSystem.TAPE_POSITION_TYPE dwPositionType, uint* lpdwPartition, uint* lpdwOffsetLow, uint* lpdwOffsetHigh)
#cfunc global GetTapePosition "GetTapePosition" intptr, int, var, var, var

; uint GetTapeStatus(winmdroot.Foundation.HANDLE hDevice)
#cfunc global GetTapeStatus "GetTapeStatus" intptr

; uint GetTempFileName(winmdroot.Foundation.PCWSTR lpPathName, winmdroot.Foundation.PCWSTR lpPrefixString, uint uUnique, winmdroot.Foundation.PWSTR lpTempFileName)
#cfunc global GetTempFileNameW "GetTempFileNameW" wstr, wstr, int, wstr

; uint GetTempPath(uint nBufferLength, winmdroot.Foundation.PWSTR lpBuffer)
#cfunc global GetTempPathW "GetTempPathW" int, wstr

; uint GetThreadErrorMode()
#cfunc global GetThreadErrorMode "GetThreadErrorMode"

; winmdroot.Foundation.BOOL GetThreadGroupAffinity(winmdroot.Foundation.HANDLE hThread, winmdroot.System.SystemInformation.GROUP_AFFINITY* GroupAffinity)
#cfunc global GetThreadGroupAffinity "GetThreadGroupAffinity" intptr, var

; winmdroot.Foundation.BOOL GetThreadIOPendingFlag(winmdroot.Foundation.HANDLE hThread, winmdroot.Foundation.BOOL* lpIOIsPending)
#cfunc global GetThreadIOPendingFlag "GetThreadIOPendingFlag" intptr, var

; uint GetThreadId(winmdroot.Foundation.HANDLE Thread)
#cfunc global GetThreadId "GetThreadId" intptr

; winmdroot.Foundation.BOOL GetThreadIdealProcessorEx(winmdroot.Foundation.HANDLE hThread, winmdroot.System.Kernel.PROCESSOR_NUMBER* lpIdealProcessor)
#cfunc global GetThreadIdealProcessorEx "GetThreadIdealProcessorEx" intptr, var

; winmdroot.Foundation.BOOL GetThreadInformation(winmdroot.Foundation.HANDLE hThread, winmdroot.System.Threading.THREAD_INFORMATION_CLASS ThreadInformationClass, void* ThreadInformation, uint ThreadInformationSize)
#cfunc global GetThreadInformation "GetThreadInformation" intptr, int, intptr, int

; uint GetThreadLocale()
#cfunc global GetThreadLocale "GetThreadLocale"

; winmdroot.Foundation.BOOL GetThreadPreferredUILanguages(uint dwFlags, uint* pulNumLanguages, winmdroot.Foundation.PZZWSTR pwszLanguagesBuffer, uint* pcchLanguagesBuffer)
#cfunc global GetThreadPreferredUILanguages "GetThreadPreferredUILanguages" int, var, int, var

; int GetThreadPriority(winmdroot.Foundation.HANDLE hThread)
#cfunc global GetThreadPriority "GetThreadPriority" intptr

; winmdroot.Foundation.BOOL GetThreadPriorityBoost(winmdroot.Foundation.HANDLE hThread, winmdroot.Foundation.BOOL* pDisablePriorityBoost)
#cfunc global GetThreadPriorityBoost "GetThreadPriorityBoost" intptr, var

; winmdroot.Foundation.BOOL GetThreadSelectorEntry(winmdroot.Foundation.HANDLE hThread, uint dwSelector, winmdroot.System.Diagnostics.Debug.LDT_ENTRY* lpSelectorEntry)
#cfunc global GetThreadSelectorEntry "GetThreadSelectorEntry" intptr, int, var

; winmdroot.Foundation.BOOL GetThreadTimes(winmdroot.Foundation.HANDLE hThread, global::System.Runtime.InteropServices.ComTypes.FILETIME* lpCreationTime, global::System.Runtime.InteropServices.ComTypes.FILETIME* lpExitTime, global::System.Runtime.InteropServices.ComTypes.FILETIME* lpKernelTime, global::System.Runtime.InteropServices.ComTypes.FILETIME* lpUserTime)
#cfunc global GetThreadTimes "GetThreadTimes" intptr, var, var, var, var

; ushort GetThreadUILanguage()
#cfunc global GetThreadUILanguage "GetThreadUILanguage"

; uint GetTickCount()
#cfunc global GetTickCount "GetTickCount"

; ulong GetTickCount64()
#cfunc global GetTickCount64 "GetTickCount64"

; int GetTimeFormat(uint Locale, uint dwFlags, [Optional] winmdroot.Foundation.SYSTEMTIME* lpTime, winmdroot.Foundation.PCWSTR lpFormat, winmdroot.Foundation.PWSTR lpTimeStr, int cchTime)
#cfunc global GetTimeFormatW "GetTimeFormatW" int, int, var, wstr, wstr, int

; int GetTimeFormatEx(winmdroot.Foundation.PCWSTR lpLocaleName, winmdroot.Globalization.TIME_FORMAT_FLAGS dwFlags, [Optional] winmdroot.Foundation.SYSTEMTIME* lpTime, winmdroot.Foundation.PCWSTR lpFormat, winmdroot.Foundation.PWSTR lpTimeStr, int cchTime)
#cfunc global GetTimeFormatEx "GetTimeFormatEx" wstr, int, var, wstr, wstr, int

; uint GetTimeZoneInformation(winmdroot.System.Time.TIME_ZONE_INFORMATION* lpTimeZoneInformation)
#cfunc global GetTimeZoneInformation "GetTimeZoneInformation" var

; winmdroot.Foundation.BOOL GetTimeZoneInformationForYear(ushort wYear, [Optional] winmdroot.System.Time.DYNAMIC_TIME_ZONE_INFORMATION* pdtzi, winmdroot.System.Time.TIME_ZONE_INFORMATION* ptzi)
#cfunc global GetTimeZoneInformationForYear "GetTimeZoneInformationForYear" int, var, var

; winmdroot.Foundation.BOOL GetUILanguageInfo(uint dwFlags, winmdroot.Foundation.PCZZWSTR pwmszLanguage, winmdroot.Foundation.PZZWSTR pwszFallbackLanguages, [Optional] uint* pcchFallbackLanguages, uint* pAttributes)
#cfunc global GetUILanguageInfo "GetUILanguageInfo" int, int, int, var, var

; winmdroot.Foundation.BOOL GetUmsCompletionListEvent(void* UmsCompletionList, winmdroot.Foundation.HANDLE* UmsCompletionEvent)
#cfunc global GetUmsCompletionListEvent "GetUmsCompletionListEvent" intptr, intptr

; winmdroot.Foundation.BOOL GetUmsSystemThreadInformation(winmdroot.Foundation.HANDLE ThreadHandle, winmdroot.System.Threading.UMS_SYSTEM_THREAD_INFORMATION* SystemThreadInfo)
#cfunc global GetUmsSystemThreadInformation "GetUmsSystemThreadInformation" intptr, var

; int GetUserDefaultGeoName(winmdroot.Foundation.PWSTR geoName, int geoNameCount)
#cfunc global GetUserDefaultGeoName "GetUserDefaultGeoName" wstr, int

; uint GetUserDefaultLCID()
#cfunc global GetUserDefaultLCID "GetUserDefaultLCID"

; ushort GetUserDefaultLangID()
#cfunc global GetUserDefaultLangID "GetUserDefaultLangID"

; int GetUserDefaultLocaleName(winmdroot.Foundation.PWSTR lpLocaleName, int cchLocaleName)
#cfunc global GetUserDefaultLocaleName "GetUserDefaultLocaleName" wstr, int

; ushort GetUserDefaultUILanguage()
#cfunc global GetUserDefaultUILanguage "GetUserDefaultUILanguage"

; int GetUserGeoID(winmdroot.Globalization.SYSGEOCLASS GeoClass)
#cfunc global GetUserGeoID "GetUserGeoID" int

; winmdroot.Foundation.BOOL GetUserPreferredUILanguages(uint dwFlags, uint* pulNumLanguages, winmdroot.Foundation.PZZWSTR pwszLanguagesBuffer, uint* pcchLanguagesBuffer)
#cfunc global GetUserPreferredUILanguages "GetUserPreferredUILanguages" int, var, int, var

; uint GetVersion()
#cfunc global GetVersion "GetVersion"

; winmdroot.Foundation.BOOL GetVersionEx(winmdroot.System.SystemInformation.OSVERSIONINFOW* lpVersionInformation)
#cfunc global GetVersionExW "GetVersionExW" var

; winmdroot.Foundation.BOOL GetVolumeInformation(winmdroot.Foundation.PCWSTR lpRootPathName, winmdroot.Foundation.PWSTR lpVolumeNameBuffer, uint nVolumeNameSize, [Optional] uint* lpVolumeSerialNumber, [Optional] uint* lpMaximumComponentLength, [Optional] uint* lpFileSystemFlags, winmdroot.Foundation.PWSTR lpFileSystemNameBuffer, uint nFileSystemNameSize)
#cfunc global GetVolumeInformationW "GetVolumeInformationW" wstr, wstr, int, var, var, var, wstr, int

; winmdroot.Foundation.BOOL GetVolumeInformationByHandle(winmdroot.Foundation.HANDLE hFile, winmdroot.Foundation.PWSTR lpVolumeNameBuffer, uint nVolumeNameSize, [Optional] uint* lpVolumeSerialNumber, [Optional] uint* lpMaximumComponentLength, [Optional] uint* lpFileSystemFlags, winmdroot.Foundation.PWSTR lpFileSystemNameBuffer, uint nFileSystemNameSize)
#cfunc global GetVolumeInformationByHandleW "GetVolumeInformationByHandleW" intptr, wstr, int, var, var, var, wstr, int

; winmdroot.Foundation.BOOL GetVolumeNameForVolumeMountPoint(winmdroot.Foundation.PCWSTR lpszVolumeMountPoint, winmdroot.Foundation.PWSTR lpszVolumeName, uint cchBufferLength)
#cfunc global GetVolumeNameForVolumeMountPointW "GetVolumeNameForVolumeMountPointW" wstr, wstr, int

; winmdroot.Foundation.BOOL GetVolumePathName(winmdroot.Foundation.PCWSTR lpszFileName, winmdroot.Foundation.PWSTR lpszVolumePathName, uint cchBufferLength)
#cfunc global GetVolumePathNameW "GetVolumePathNameW" wstr, wstr, int

; winmdroot.Foundation.BOOL GetVolumePathNamesForVolumeName(winmdroot.Foundation.PCWSTR lpszVolumeName, winmdroot.Foundation.PZZWSTR lpszVolumePathNames, uint cchBufferLength, uint* lpcchReturnLength)
#cfunc global GetVolumePathNamesForVolumeNameW "GetVolumePathNamesForVolumeNameW" wstr, int, int, var

; uint GetWindowsDirectory(winmdroot.Foundation.PWSTR lpBuffer, uint uSize)
#cfunc global GetWindowsDirectoryW "GetWindowsDirectoryW" wstr, int

; uint GetWriteWatch(uint dwFlags, void* lpBaseAddress, nuint dwRegionSize, [Optional] void** lpAddresses, [Optional] nuint* lpdwCount, [Optional] uint* lpdwGranularity)
#cfunc global GetWriteWatch "GetWriteWatch" int, intptr, int, var, var, var

; ushort GlobalAddAtom(winmdroot.Foundation.PCWSTR lpString)
#cfunc global GlobalAddAtomW "GlobalAddAtomW" wstr

; ushort GlobalAddAtomEx(winmdroot.Foundation.PCWSTR lpString, uint Flags)
#cfunc global GlobalAddAtomExW "GlobalAddAtomExW" wstr, int

; winmdroot.Foundation.HGLOBAL GlobalAlloc(winmdroot.System.Memory.GLOBAL_ALLOC_FLAGS uFlags, nuint dwBytes)
#cfunc global GlobalAlloc "GlobalAlloc" int, int

; nuint GlobalCompact(uint dwMinFree)
#cfunc global GlobalCompact "GlobalCompact" int

; ushort GlobalDeleteAtom(ushort nAtom)
#cfunc global GlobalDeleteAtom "GlobalDeleteAtom" int

; ushort GlobalFindAtom(winmdroot.Foundation.PCWSTR lpString)
#cfunc global GlobalFindAtomW "GlobalFindAtomW" wstr

; void GlobalFix(winmdroot.Foundation.HGLOBAL hMem)
#func global GlobalFix "GlobalFix" int

; uint GlobalFlags(winmdroot.Foundation.HGLOBAL hMem)
#cfunc global GlobalFlags "GlobalFlags" int

; uint GlobalGetAtomName(ushort nAtom, winmdroot.Foundation.PWSTR lpBuffer, int nSize)
#cfunc global GlobalGetAtomNameW "GlobalGetAtomNameW" int, wstr, int

; winmdroot.Foundation.HGLOBAL GlobalHandle(void* pMem)
#cfunc global GlobalHandle "GlobalHandle" intptr

; void* GlobalLock(winmdroot.Foundation.HGLOBAL hMem)
#cfunc global GlobalLock "GlobalLock" int

; void GlobalMemoryStatus(winmdroot.System.SystemInformation.MEMORYSTATUS* lpBuffer)
#func global GlobalMemoryStatus "GlobalMemoryStatus" var

; winmdroot.Foundation.BOOL GlobalMemoryStatusEx(winmdroot.System.SystemInformation.MEMORYSTATUSEX* lpBuffer)
#cfunc global GlobalMemoryStatusEx "GlobalMemoryStatusEx" var

; winmdroot.Foundation.HGLOBAL GlobalReAlloc(winmdroot.Foundation.HGLOBAL hMem, nuint dwBytes, uint uFlags)
#cfunc global GlobalReAlloc "GlobalReAlloc" int, int, int

; nuint GlobalSize(winmdroot.Foundation.HGLOBAL hMem)
#cfunc global GlobalSize "GlobalSize" int

; winmdroot.Foundation.BOOL GlobalUnWire(winmdroot.Foundation.HGLOBAL hMem)
#cfunc global GlobalUnWire "GlobalUnWire" int

; void GlobalUnfix(winmdroot.Foundation.HGLOBAL hMem)
#func global GlobalUnfix "GlobalUnfix" int

; winmdroot.Foundation.BOOL GlobalUnlock(winmdroot.Foundation.HGLOBAL hMem)
#cfunc global GlobalUnlock "GlobalUnlock" int

; void* GlobalWire(winmdroot.Foundation.HGLOBAL hMem)
#cfunc global GlobalWire "GlobalWire" int

; winmdroot.Foundation.BOOL Heap32First(winmdroot.System.Diagnostics.ToolHelp.HEAPENTRY32* lphe, uint th32ProcessID, nuint th32HeapID)
#cfunc global Heap32First "Heap32First" var, int, int

; winmdroot.Foundation.BOOL Heap32ListFirst(winmdroot.Foundation.HANDLE hSnapshot, winmdroot.System.Diagnostics.ToolHelp.HEAPLIST32* lphl)
#cfunc global Heap32ListFirst "Heap32ListFirst" intptr, var

; winmdroot.Foundation.BOOL Heap32ListNext(winmdroot.Foundation.HANDLE hSnapshot, winmdroot.System.Diagnostics.ToolHelp.HEAPLIST32* lphl)
#cfunc global Heap32ListNext "Heap32ListNext" intptr, var

; winmdroot.Foundation.BOOL Heap32Next(winmdroot.System.Diagnostics.ToolHelp.HEAPENTRY32* lphe)
#cfunc global Heap32Next "Heap32Next" var

; nuint HeapCompact(winmdroot.Foundation.HANDLE hHeap, winmdroot.System.Memory.HEAP_FLAGS dwFlags)
#cfunc global HeapCompact "HeapCompact" intptr, int

; winmdroot.Foundation.HANDLE HeapCreate(winmdroot.System.Memory.HEAP_FLAGS flOptions, nuint dwInitialSize, nuint dwMaximumSize)
#cfunc global HeapCreate "HeapCreate" int, int, int

; winmdroot.Foundation.BOOL HeapDestroy(winmdroot.Foundation.HANDLE hHeap)
#cfunc global HeapDestroy "HeapDestroy" intptr

; winmdroot.Foundation.BOOL HeapFree(winmdroot.Foundation.HANDLE hHeap, winmdroot.System.Memory.HEAP_FLAGS dwFlags, [Optional] void* lpMem)
#cfunc global HeapFree "HeapFree" intptr, int, intptr

; winmdroot.Foundation.BOOL HeapLock(winmdroot.Foundation.HANDLE hHeap)
#cfunc global HeapLock "HeapLock" intptr

; winmdroot.Foundation.BOOL HeapQueryInformation(winmdroot.Foundation.HANDLE HeapHandle, winmdroot.System.Memory.HEAP_INFORMATION_CLASS HeapInformationClass, [Optional] void* HeapInformation, nuint HeapInformationLength, [Optional] nuint* ReturnLength)
#cfunc global HeapQueryInformation "HeapQueryInformation" intptr, int, intptr, int, var

; winmdroot.Foundation.BOOL HeapSetInformation(winmdroot.Foundation.HANDLE HeapHandle, winmdroot.System.Memory.HEAP_INFORMATION_CLASS HeapInformationClass, [Optional] void* HeapInformation, nuint HeapInformationLength)
#cfunc global HeapSetInformation "HeapSetInformation" intptr, int, intptr, int

; winmdroot.Foundation.BOOL HeapSummary(winmdroot.Foundation.HANDLE hHeap, uint dwFlags, winmdroot.System.Memory.HEAP_SUMMARY* lpSummary)
#cfunc global HeapSummary "HeapSummary" intptr, int, var

; winmdroot.Foundation.BOOL HeapUnlock(winmdroot.Foundation.HANDLE hHeap)
#cfunc global HeapUnlock "HeapUnlock" intptr

; winmdroot.Foundation.BOOL HeapValidate(winmdroot.Foundation.HANDLE hHeap, winmdroot.System.Memory.HEAP_FLAGS dwFlags, [Optional] void* lpMem)
#cfunc global HeapValidate "HeapValidate" intptr, int, intptr

; winmdroot.Foundation.BOOL HeapWalk(winmdroot.Foundation.HANDLE hHeap, winmdroot.System.Memory.PROCESS_HEAP_ENTRY* lpEntry)
#cfunc global HeapWalk "HeapWalk" intptr, var

; int IdnToNameprepUnicode(uint dwFlags, winmdroot.Foundation.PCWSTR lpUnicodeCharStr, int cchUnicodeChar, winmdroot.Foundation.PWSTR lpNameprepCharStr, int cchNameprepChar)
#cfunc global IdnToNameprepUnicode "IdnToNameprepUnicode" int, wstr, int, wstr, int

; winmdroot.Foundation.BOOL InitAtomTable(uint nSize)
#cfunc global InitAtomTable "InitAtomTable" int

; winmdroot.Foundation.BOOL InitializeCriticalSectionAndSpinCount(winmdroot.System.Threading.CRITICAL_SECTION* lpCriticalSection, uint dwSpinCount)
#cfunc global InitializeCriticalSectionAndSpinCount "InitializeCriticalSectionAndSpinCount" var, int

; winmdroot.Foundation.BOOL InitializeCriticalSectionEx(winmdroot.System.Threading.CRITICAL_SECTION* lpCriticalSection, uint dwSpinCount, uint Flags)
#cfunc global InitializeCriticalSectionEx "InitializeCriticalSectionEx" var, int, int

; winmdroot.Foundation.BOOL InitializeSynchronizationBarrier(winmdroot.System.Threading.SYNCHRONIZATION_BARRIER* lpBarrier, int lTotalThreads, int lSpinCount)
#cfunc global InitializeSynchronizationBarrier "InitializeSynchronizationBarrier" var, int, int

; winmdroot.Foundation.BOOL IsBadCodePtr(winmdroot.Foundation.FARPROC lpfn)
#cfunc global IsBadCodePtr "IsBadCodePtr" var

; winmdroot.Foundation.BOOL IsBadHugeReadPtr([Optional] void* lp, nuint ucb)
#cfunc global IsBadHugeReadPtr "IsBadHugeReadPtr" intptr, int

; winmdroot.Foundation.BOOL IsBadHugeWritePtr([Optional] void* lp, nuint ucb)
#cfunc global IsBadHugeWritePtr "IsBadHugeWritePtr" intptr, int

; winmdroot.Foundation.BOOL IsBadReadPtr([Optional] void* lp, nuint ucb)
#cfunc global IsBadReadPtr "IsBadReadPtr" intptr, int

; winmdroot.Foundation.BOOL IsBadStringPtrW(winmdroot.Foundation.PCWSTR lpsz, nuint ucchMax)
#cfunc global IsBadStringPtrW "IsBadStringPtrW" wstr, int

; winmdroot.Foundation.BOOL IsBadWritePtr([Optional] void* lp, nuint ucb)
#cfunc global IsBadWritePtr "IsBadWritePtr" intptr, int

; winmdroot.Foundation.BOOL IsCalendarLeapYear(uint calId, uint year, uint era)
#cfunc global IsCalendarLeapYear "IsCalendarLeapYear" int, int, int

; winmdroot.Foundation.BOOL IsDBCSLeadByte(byte TestChar)
#cfunc global IsDBCSLeadByte "IsDBCSLeadByte" int

; winmdroot.Foundation.BOOL IsDBCSLeadByteEx(uint CodePage, byte TestChar)
#cfunc global IsDBCSLeadByteEx "IsDBCSLeadByteEx" int, int

; winmdroot.Foundation.BOOL IsDebuggerPresent()
#cfunc global IsDebuggerPresent "IsDebuggerPresent"

; winmdroot.Foundation.BOOL IsNLSDefinedString(uint Function, uint dwFlags, winmdroot.Globalization.NLSVERSIONINFO* lpVersionInformation, winmdroot.Foundation.PCWSTR lpString, int cchStr)
#cfunc global IsNLSDefinedString "IsNLSDefinedString" int, int, var, wstr, int

; winmdroot.Foundation.BOOL IsNativeVhdBoot(winmdroot.Foundation.BOOL* NativeVhdBoot)
#cfunc global IsNativeVhdBoot "IsNativeVhdBoot" var

; winmdroot.Foundation.BOOL IsNormalizedString(winmdroot.Globalization.NORM_FORM NormForm, winmdroot.Foundation.PCWSTR lpString, int cwLength)
#cfunc global IsNormalizedString "IsNormalizedString" int, wstr, int

; winmdroot.Foundation.BOOL IsProcessInJob(winmdroot.Foundation.HANDLE ProcessHandle, winmdroot.Foundation.HANDLE JobHandle, winmdroot.Foundation.BOOL* Result)
#cfunc global IsProcessInJob "IsProcessInJob" intptr, intptr, var

; winmdroot.Foundation.BOOL IsProcessorFeaturePresent(winmdroot.System.Threading.PROCESSOR_FEATURE_ID ProcessorFeature)
#cfunc global IsProcessorFeaturePresent "IsProcessorFeaturePresent" int

; winmdroot.Foundation.BOOL IsSystemResumeAutomatic()
#cfunc global IsSystemResumeAutomatic "IsSystemResumeAutomatic"

; winmdroot.Foundation.BOOL IsThreadAFiber()
#cfunc global IsThreadAFiber "IsThreadAFiber"

; winmdroot.Foundation.BOOL IsValidCodePage(uint CodePage)
#cfunc global IsValidCodePage "IsValidCodePage" int

; winmdroot.Foundation.BOOL IsValidLanguageGroup(uint LanguageGroup, winmdroot.Globalization.ENUM_SYSTEM_LANGUAGE_GROUPS_FLAGS dwFlags)
#cfunc global IsValidLanguageGroup "IsValidLanguageGroup" int, int

; winmdroot.Foundation.BOOL IsValidLocale(uint Locale, winmdroot.Globalization.IS_VALID_LOCALE_FLAGS dwFlags)
#cfunc global IsValidLocale "IsValidLocale" int, int

; winmdroot.Foundation.BOOL IsValidLocaleName(winmdroot.Foundation.PCWSTR lpLocaleName)
#cfunc global IsValidLocaleName "IsValidLocaleName" wstr

; uint IsValidNLSVersion(uint function, winmdroot.Foundation.PCWSTR lpLocaleName, winmdroot.Globalization.NLSVERSIONINFOEX* lpVersionInformation)
#cfunc global IsValidNLSVersion "IsValidNLSVersion" int, wstr, var

; winmdroot.Foundation.BOOL IsWow64Process(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.BOOL* Wow64Process)
#cfunc global IsWow64Process "IsWow64Process" intptr, var

; winmdroot.Foundation.BOOL K32EmptyWorkingSet(winmdroot.Foundation.HANDLE hProcess)
#cfunc global K32EmptyWorkingSet "K32EmptyWorkingSet" intptr

; winmdroot.Foundation.BOOL K32EnumDeviceDrivers(void** lpImageBase, uint cb, uint* lpcbNeeded)
#cfunc global K32EnumDeviceDrivers "K32EnumDeviceDrivers" var, int, var

; winmdroot.Foundation.BOOL K32EnumPageFilesW(delegate *unmanaged[Stdcall]<void*,winmdroot.System.ProcessStatus.ENUM_PAGE_FILE_INFORMATION*,winmdroot.Foundation.PCWSTR,global::Windows.Win32.Foundation.BOOL> pCallBackRoutine, void* pContext)
#cfunc global K32EnumPageFilesW "K32EnumPageFilesW" int, intptr

; winmdroot.Foundation.BOOL K32EnumProcessModules(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.HMODULE* lphModule, uint cb, uint* lpcbNeeded)
#cfunc global K32EnumProcessModules "K32EnumProcessModules" intptr, intptr, int, var

; winmdroot.Foundation.BOOL K32EnumProcessModulesEx(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.HMODULE* lphModule, uint cb, uint* lpcbNeeded, uint dwFilterFlag)
#cfunc global K32EnumProcessModulesEx "K32EnumProcessModulesEx" intptr, intptr, int, var, int

; winmdroot.Foundation.BOOL K32EnumProcesses(uint* lpidProcess, uint cb, uint* lpcbNeeded)
#cfunc global K32EnumProcesses "K32EnumProcesses" var, int, var

; uint K32GetDeviceDriverBaseNameW(void* ImageBase, winmdroot.Foundation.PWSTR lpBaseName, uint nSize)
#cfunc global K32GetDeviceDriverBaseNameW "K32GetDeviceDriverBaseNameW" intptr, wstr, int

; uint K32GetDeviceDriverFileNameW(void* ImageBase, winmdroot.Foundation.PWSTR lpFilename, uint nSize)
#cfunc global K32GetDeviceDriverFileNameW "K32GetDeviceDriverFileNameW" intptr, wstr, int

; uint K32GetMappedFileNameW(winmdroot.Foundation.HANDLE hProcess, void* lpv, winmdroot.Foundation.PWSTR lpFilename, uint nSize)
#cfunc global K32GetMappedFileNameW "K32GetMappedFileNameW" intptr, intptr, wstr, int

; uint K32GetModuleBaseNameW(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.PWSTR lpBaseName, uint nSize)
#cfunc global K32GetModuleBaseNameW "K32GetModuleBaseNameW" intptr, intptr, wstr, int

; uint K32GetModuleFileNameExW(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.PWSTR lpFilename, uint nSize)
#cfunc global K32GetModuleFileNameExW "K32GetModuleFileNameExW" intptr, intptr, wstr, int

; winmdroot.Foundation.BOOL K32GetModuleInformation(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.HMODULE hModule, winmdroot.System.ProcessStatus.MODULEINFO* lpmodinfo, uint cb)
#cfunc global K32GetModuleInformation "K32GetModuleInformation" intptr, intptr, var, int

; winmdroot.Foundation.BOOL K32GetPerformanceInfo(winmdroot.System.ProcessStatus.PERFORMANCE_INFORMATION* pPerformanceInformation, uint cb)
#cfunc global K32GetPerformanceInfo "K32GetPerformanceInfo" var, int

; uint K32GetProcessImageFileNameW(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.PWSTR lpImageFileName, uint nSize)
#cfunc global K32GetProcessImageFileNameW "K32GetProcessImageFileNameW" intptr, wstr, int

; winmdroot.Foundation.BOOL K32GetProcessMemoryInfo(winmdroot.Foundation.HANDLE Process, winmdroot.System.ProcessStatus.PROCESS_MEMORY_COUNTERS* ppsmemCounters, uint cb)
#cfunc global K32GetProcessMemoryInfo "K32GetProcessMemoryInfo" intptr, var, int

; winmdroot.Foundation.BOOL K32GetWsChanges(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.ProcessStatus.PSAPI_WS_WATCH_INFORMATION* lpWatchInfo, uint cb)
#cfunc global K32GetWsChanges "K32GetWsChanges" intptr, var, int

; winmdroot.Foundation.BOOL K32GetWsChangesEx(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.ProcessStatus.PSAPI_WS_WATCH_INFORMATION_EX* lpWatchInfoEx, uint* cb)
#cfunc global K32GetWsChangesEx "K32GetWsChangesEx" intptr, var, var

; winmdroot.Foundation.BOOL K32InitializeProcessForWsWatch(winmdroot.Foundation.HANDLE hProcess)
#cfunc global K32InitializeProcessForWsWatch "K32InitializeProcessForWsWatch" intptr

; winmdroot.Foundation.BOOL K32QueryWorkingSet(winmdroot.Foundation.HANDLE hProcess, void* pv, uint cb)
#cfunc global K32QueryWorkingSet "K32QueryWorkingSet" intptr, intptr, int

; winmdroot.Foundation.BOOL K32QueryWorkingSetEx(winmdroot.Foundation.HANDLE hProcess, void* pv, uint cb)
#cfunc global K32QueryWorkingSetEx "K32QueryWorkingSetEx" intptr, intptr, int

; int LCIDToLocaleName(uint Locale, winmdroot.Foundation.PWSTR lpName, int cchName, uint dwFlags)
#cfunc global LCIDToLocaleName "LCIDToLocaleName" int, wstr, int, int

; int LCMapString(uint Locale, uint dwMapFlags, winmdroot.Foundation.PCWSTR lpSrcStr, int cchSrc, winmdroot.Foundation.PWSTR lpDestStr, int cchDest)
#cfunc global LCMapStringW "LCMapStringW" int, int, wstr, int, wstr, int

; int LCMapStringEx(winmdroot.Foundation.PCWSTR lpLocaleName, uint dwMapFlags, winmdroot.Foundation.PCWSTR lpSrcStr, int cchSrc, winmdroot.Foundation.PWSTR lpDestStr, int cchDest, [Optional] winmdroot.Globalization.NLSVERSIONINFO* lpVersionInformation, [Optional] void* lpReserved, winmdroot.Foundation.LPARAM sortHandle)
#cfunc global LCMapStringEx "LCMapStringEx" wstr, int, wstr, int, wstr, int, var, intptr, intptr

; void LZClose(int hFile)
#func global LZClose "LZClose" int

; int LZCopy(int hfSource, int hfDest)
#cfunc global LZCopy "LZCopy" int, int

; void LZDone()
#func global LZDone "LZDone"

; int LZInit(int hfSource)
#cfunc global LZInit "LZInit" int

; int LZOpenFileW(winmdroot.Foundation.PWSTR lpFileName, winmdroot.Storage.FileSystem.OFSTRUCT* lpReOpenBuf, winmdroot.Storage.FileSystem.LZOPENFILE_STYLE wStyle)
#cfunc global LZOpenFileW "LZOpenFileW" wstr, var, int

; int LZRead(int hFile, winmdroot.Foundation.PSTR lpBuffer, int cbRead)
#cfunc global LZRead "LZRead" int, str, int

; int LZSeek(int hFile, int lOffset, int iOrigin)
#cfunc global LZSeek "LZSeek" int, int, int

; int LZStart()
#cfunc global LZStart "LZStart"

; winmdroot.Foundation.HMODULE LoadLibrary(winmdroot.Foundation.PCWSTR lpLibFileName)
#cfunc global LoadLibraryW "LoadLibraryW" wstr

; winmdroot.Foundation.HMODULE LoadLibraryEx(winmdroot.Foundation.PCWSTR lpLibFileName, winmdroot.Foundation.HANDLE hFile, winmdroot.System.LibraryLoader.LOAD_LIBRARY_FLAGS dwFlags)
#cfunc global LoadLibraryExW "LoadLibraryExW" wstr, intptr, int

; uint LoadModule(winmdroot.Foundation.PCSTR lpModuleName, void* lpParameterBlock)
#cfunc global LoadModule "LoadModule" str, intptr

; winmdroot.Foundation.HMODULE LoadPackagedLibrary(winmdroot.Foundation.PCWSTR lpwLibFileName, uint Reserved)
#cfunc global LoadPackagedLibrary "LoadPackagedLibrary" wstr, int

; winmdroot.Foundation.HGLOBAL LoadResource(winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.HRSRC hResInfo)
#cfunc global LoadResource "LoadResource" intptr, intptr

; winmdroot.Foundation.HLOCAL LocalFree(winmdroot.Foundation.HLOCAL hMem)
#cfunc global LocalFree "LocalFree" int

; winmdroot.Foundation.HLOCAL LocalAlloc(winmdroot.System.Memory.LOCAL_ALLOC_FLAGS uFlags, nuint uBytes)
#cfunc global LocalAlloc "LocalAlloc" int, int

; nuint LocalCompact(uint uMinFree)
#cfunc global LocalCompact "LocalCompact" int

; winmdroot.Foundation.BOOL LocalFileTimeToFileTime(global::System.Runtime.InteropServices.ComTypes.FILETIME* lpLocalFileTime, global::System.Runtime.InteropServices.ComTypes.FILETIME* lpFileTime)
#cfunc global LocalFileTimeToFileTime "LocalFileTimeToFileTime" var, var

; uint LocalFlags(winmdroot.Foundation.HLOCAL hMem)
#cfunc global LocalFlags "LocalFlags" int

; winmdroot.Foundation.HLOCAL LocalHandle(void* pMem)
#cfunc global LocalHandle "LocalHandle" intptr

; void* LocalLock(winmdroot.Foundation.HLOCAL hMem)
#cfunc global LocalLock "LocalLock" int

; winmdroot.Foundation.HLOCAL LocalReAlloc(winmdroot.Foundation.HLOCAL hMem, nuint uBytes, uint uFlags)
#cfunc global LocalReAlloc "LocalReAlloc" int, int, int

; nuint LocalShrink(winmdroot.Foundation.HLOCAL hMem, uint cbNewSize)
#cfunc global LocalShrink "LocalShrink" int, int

; nuint LocalSize(winmdroot.Foundation.HLOCAL hMem)
#cfunc global LocalSize "LocalSize" int

; winmdroot.Foundation.BOOL LocalUnlock(winmdroot.Foundation.HLOCAL hMem)
#cfunc global LocalUnlock "LocalUnlock" int

; uint LocaleNameToLCID(winmdroot.Foundation.PCWSTR lpName, uint dwFlags)
#cfunc global LocaleNameToLCID "LocaleNameToLCID" wstr, int

; winmdroot.Foundation.BOOL LockFile(winmdroot.Foundation.HANDLE hFile, uint dwFileOffsetLow, uint dwFileOffsetHigh, uint nNumberOfBytesToLockLow, uint nNumberOfBytesToLockHigh)
#cfunc global LockFile "LockFile" intptr, int, int, int, int

; winmdroot.Foundation.BOOL LockFileEx(winmdroot.Foundation.HANDLE hFile, winmdroot.Storage.FileSystem.LOCK_FILE_FLAGS dwFlags, uint dwReserved, uint nNumberOfBytesToLockLow, uint nNumberOfBytesToLockHigh, global::System.Threading.NativeOverlapped* lpOverlapped)
#cfunc global LockFileEx "LockFileEx" intptr, int, int, int, int, var

; void* LockResource(winmdroot.Foundation.HGLOBAL hResData)
#cfunc global LockResource "LockResource" int

; winmdroot.Foundation.BOOL MapUserPhysicalPages(void* VirtualAddress, nuint NumberOfPages, [Optional] nuint* PageArray)
#cfunc global MapUserPhysicalPages "MapUserPhysicalPages" intptr, int, var

; winmdroot.Foundation.BOOL MapUserPhysicalPagesScatter(void** VirtualAddresses, nuint NumberOfPages, [Optional] nuint* PageArray)
#cfunc global MapUserPhysicalPagesScatter "MapUserPhysicalPagesScatter" var, int, var

; winmdroot.System.Memory.MEMORY_MAPPED_VIEW_ADDRESS MapViewOfFile(winmdroot.Foundation.HANDLE hFileMappingObject, winmdroot.System.Memory.FILE_MAP dwDesiredAccess, uint dwFileOffsetHigh, uint dwFileOffsetLow, nuint dwNumberOfBytesToMap)
#cfunc global MapViewOfFile "MapViewOfFile" intptr, int, int, int, int

; winmdroot.System.Memory.MEMORY_MAPPED_VIEW_ADDRESS MapViewOfFileEx(winmdroot.Foundation.HANDLE hFileMappingObject, winmdroot.System.Memory.FILE_MAP dwDesiredAccess, uint dwFileOffsetHigh, uint dwFileOffsetLow, nuint dwNumberOfBytesToMap, [Optional] void* lpBaseAddress)
#cfunc global MapViewOfFileEx "MapViewOfFileEx" intptr, int, int, int, int, intptr

; winmdroot.System.Memory.MEMORY_MAPPED_VIEW_ADDRESS MapViewOfFileExNuma(winmdroot.Foundation.HANDLE hFileMappingObject, winmdroot.System.Memory.FILE_MAP dwDesiredAccess, uint dwFileOffsetHigh, uint dwFileOffsetLow, nuint dwNumberOfBytesToMap, [Optional] void* lpBaseAddress, uint nndPreferred)
#cfunc global MapViewOfFileExNuma "MapViewOfFileExNuma" intptr, int, int, int, int, intptr, int

; winmdroot.Foundation.BOOL Module32First(winmdroot.Foundation.HANDLE hSnapshot, winmdroot.System.Diagnostics.ToolHelp.MODULEENTRY32* lpme)
#cfunc global Module32First "Module32First" intptr, var

; winmdroot.Foundation.BOOL Module32Next(winmdroot.Foundation.HANDLE hSnapshot, winmdroot.System.Diagnostics.ToolHelp.MODULEENTRY32* lpme)
#cfunc global Module32Next "Module32Next" intptr, var

; winmdroot.Foundation.BOOL MoveFile(winmdroot.Foundation.PCWSTR lpExistingFileName, winmdroot.Foundation.PCWSTR lpNewFileName)
#cfunc global MoveFileW "MoveFileW" wstr, wstr

; winmdroot.Foundation.BOOL MoveFileEx(winmdroot.Foundation.PCWSTR lpExistingFileName, winmdroot.Foundation.PCWSTR lpNewFileName, winmdroot.Storage.FileSystem.MOVE_FILE_FLAGS dwFlags)
#cfunc global MoveFileExW "MoveFileExW" wstr, wstr, int

; winmdroot.Foundation.BOOL MoveFileTransacted(winmdroot.Foundation.PCWSTR lpExistingFileName, winmdroot.Foundation.PCWSTR lpNewFileName, delegate *unmanaged[Stdcall]<long,long,long,long,uint,global::Windows.Win32.Storage.FileSystem.LPPROGRESS_ROUTINE_CALLBACK_REASON,global::Windows.Win32.Foundation.HANDLE,global::Windows.Win32.Foundation.HANDLE,void*,uint> lpProgressRoutine, [Optional] void* lpData, winmdroot.Storage.FileSystem.MOVE_FILE_FLAGS dwFlags, winmdroot.Foundation.HANDLE hTransaction)
#cfunc global MoveFileTransactedW "MoveFileTransactedW" wstr, wstr, int, intptr, int, intptr

; winmdroot.Foundation.BOOL MoveFileWithProgress(winmdroot.Foundation.PCWSTR lpExistingFileName, winmdroot.Foundation.PCWSTR lpNewFileName, delegate *unmanaged[Stdcall]<long,long,long,long,uint,global::Windows.Win32.Storage.FileSystem.LPPROGRESS_ROUTINE_CALLBACK_REASON,global::Windows.Win32.Foundation.HANDLE,global::Windows.Win32.Foundation.HANDLE,void*,uint> lpProgressRoutine, [Optional] void* lpData, winmdroot.Storage.FileSystem.MOVE_FILE_FLAGS dwFlags)
#cfunc global MoveFileWithProgressW "MoveFileWithProgressW" wstr, wstr, int, intptr, int

; int MulDiv(int nNumber, int nNumerator, int nDenominator)
#cfunc global MulDiv "MulDiv" int, int, int

; int MultiByteToWideChar(uint CodePage, winmdroot.Globalization.MULTI_BYTE_TO_WIDE_CHAR_FLAGS dwFlags, winmdroot.Foundation.PCSTR lpMultiByteStr, int cbMultiByte, winmdroot.Foundation.PWSTR lpWideCharStr, int cchWideChar)
#cfunc global MultiByteToWideChar "MultiByteToWideChar" int, int, str, int, wstr, int

; winmdroot.Foundation.BOOL NeedCurrentDirectoryForExePathW(winmdroot.Foundation.PCWSTR ExeName)
#cfunc global NeedCurrentDirectoryForExePathW "NeedCurrentDirectoryForExePathW" wstr

; int NormalizeString(winmdroot.Globalization.NORM_FORM NormForm, winmdroot.Foundation.PCWSTR lpSrcString, int cwSrcLength, winmdroot.Foundation.PWSTR lpDstString, int cwDstLength)
#cfunc global NormalizeString "NormalizeString" int, wstr, int, wstr, int

; winmdroot.Foundation.BOOL NotifyUILanguageChange(uint dwFlags, winmdroot.Foundation.PCWSTR pcwstrNewLanguage, winmdroot.Foundation.PCWSTR pcwstrPreviousLanguage, uint dwReserved, [Optional] uint* pdwStatusRtrn)
#cfunc global NotifyUILanguageChange "NotifyUILanguageChange" int, wstr, wstr, int, var

; winmdroot.Foundation.BOOL OOBEComplete(winmdroot.Foundation.BOOL* isOOBEComplete)
#cfunc global OOBEComplete "OOBEComplete" var

; winmdroot.Foundation.HANDLE OpenEvent(winmdroot.System.Threading.SYNCHRONIZATION_ACCESS_RIGHTS dwDesiredAccess, winmdroot.Foundation.BOOL bInheritHandle, winmdroot.Foundation.PCWSTR lpName)
#cfunc global OpenEventW "OpenEventW" int, int, wstr

; int OpenFile(winmdroot.Foundation.PCSTR lpFileName, winmdroot.Storage.FileSystem.OFSTRUCT* lpReOpenBuff, uint uStyle)
#cfunc global OpenFile "OpenFile" str, var, int

; winmdroot.Foundation.HANDLE OpenFileById(winmdroot.Foundation.HANDLE hVolumeHint, winmdroot.Storage.FileSystem.FILE_ID_DESCRIPTOR* lpFileId, uint dwDesiredAccess, winmdroot.Storage.FileSystem.FILE_SHARE_MODE dwShareMode, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes, winmdroot.Storage.FileSystem.FILE_FLAGS_AND_ATTRIBUTES dwFlagsAndAttributes)
#cfunc global OpenFileById "OpenFileById" intptr, var, int, int, var, int

; winmdroot.Foundation.HANDLE OpenFileMapping(uint dwDesiredAccess, winmdroot.Foundation.BOOL bInheritHandle, winmdroot.Foundation.PCWSTR lpName)
#cfunc global OpenFileMappingW "OpenFileMappingW" int, int, wstr

; winmdroot.Foundation.HANDLE OpenJobObject(uint dwDesiredAccess, winmdroot.Foundation.BOOL bInheritHandle, winmdroot.Foundation.PCWSTR lpName)
#cfunc global OpenJobObjectW "OpenJobObjectW" int, int, wstr

; winmdroot.Foundation.HANDLE OpenMutex(winmdroot.System.Threading.SYNCHRONIZATION_ACCESS_RIGHTS dwDesiredAccess, winmdroot.Foundation.BOOL bInheritHandle, winmdroot.Foundation.PCWSTR lpName)
#cfunc global OpenMutexW "OpenMutexW" int, int, wstr

; winmdroot.Foundation.HANDLE OpenPrivateNamespaceW(void* lpBoundaryDescriptor, winmdroot.Foundation.PCWSTR lpAliasPrefix)
#cfunc global OpenPrivateNamespaceW "OpenPrivateNamespaceW" intptr, wstr

; winmdroot.Foundation.HANDLE OpenProcess(winmdroot.System.Threading.PROCESS_ACCESS_RIGHTS dwDesiredAccess, winmdroot.Foundation.BOOL bInheritHandle, uint dwProcessId)
#cfunc global OpenProcess "OpenProcess" int, int, int

; winmdroot.Foundation.HANDLE OpenSemaphore(winmdroot.System.Threading.SYNCHRONIZATION_ACCESS_RIGHTS dwDesiredAccess, winmdroot.Foundation.BOOL bInheritHandle, winmdroot.Foundation.PCWSTR lpName)
#cfunc global OpenSemaphoreW "OpenSemaphoreW" int, int, wstr

; winmdroot.Foundation.HANDLE OpenThread(winmdroot.System.Threading.THREAD_ACCESS_RIGHTS dwDesiredAccess, winmdroot.Foundation.BOOL bInheritHandle, uint dwThreadId)
#cfunc global OpenThread "OpenThread" int, int, int

; winmdroot.Foundation.HANDLE OpenWaitableTimer(winmdroot.System.Threading.SYNCHRONIZATION_ACCESS_RIGHTS dwDesiredAccess, winmdroot.Foundation.BOOL bInheritHandle, winmdroot.Foundation.PCWSTR lpTimerName)
#cfunc global OpenWaitableTimerW "OpenWaitableTimerW" int, int, wstr

; void OutputDebugStringW(winmdroot.Foundation.PCWSTR lpOutputString)
#func global OutputDebugStringW "OutputDebugStringW" wstr

; winmdroot.Foundation.BOOL PeekConsoleInput(winmdroot.Foundation.HANDLE hConsoleInput, winmdroot.System.Console.INPUT_RECORD* lpBuffer, uint nLength, uint* lpNumberOfEventsRead)
#cfunc global PeekConsoleInputW "PeekConsoleInputW" intptr, var, int, var

; winmdroot.Foundation.BOOL PeekNamedPipe(winmdroot.Foundation.HANDLE hNamedPipe, [Optional] void* lpBuffer, uint nBufferSize, [Optional] uint* lpBytesRead, [Optional] uint* lpTotalBytesAvail, [Optional] uint* lpBytesLeftThisMessage)
#cfunc global PeekNamedPipe "PeekNamedPipe" intptr, intptr, int, var, var, var

; winmdroot.Foundation.BOOL PostQueuedCompletionStatus(winmdroot.Foundation.HANDLE CompletionPort, uint dwNumberOfBytesTransferred, nuint dwCompletionKey, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped)
#cfunc global PostQueuedCompletionStatus "PostQueuedCompletionStatus" intptr, int, int, var

; winmdroot.Foundation.BOOL PowerClearRequest(winmdroot.Foundation.HANDLE PowerRequest, winmdroot.System.Power.POWER_REQUEST_TYPE RequestType)
#cfunc global PowerClearRequest "PowerClearRequest" intptr, int

; winmdroot.Foundation.HANDLE PowerCreateRequest(winmdroot.System.Threading.REASON_CONTEXT* Context)
#cfunc global PowerCreateRequest "PowerCreateRequest" var

; winmdroot.Foundation.BOOL PowerSetRequest(winmdroot.Foundation.HANDLE PowerRequest, winmdroot.System.Power.POWER_REQUEST_TYPE RequestType)
#cfunc global PowerSetRequest "PowerSetRequest" intptr, int

; uint PrepareTape(winmdroot.Foundation.HANDLE hDevice, winmdroot.Storage.FileSystem.PREPARE_TAPE_OPERATION dwOperation, winmdroot.Foundation.BOOL bImmediate)
#cfunc global PrepareTape "PrepareTape" intptr, int, int

; winmdroot.Foundation.BOOL Process32First(winmdroot.Foundation.HANDLE hSnapshot, winmdroot.System.Diagnostics.ToolHelp.PROCESSENTRY32* lppe)
#cfunc global Process32First "Process32First" intptr, var

; winmdroot.Foundation.BOOL Process32Next(winmdroot.Foundation.HANDLE hSnapshot, winmdroot.System.Diagnostics.ToolHelp.PROCESSENTRY32* lppe)
#cfunc global Process32Next "Process32Next" intptr, var

; winmdroot.Foundation.BOOL ProcessIdToSessionId(uint dwProcessId, uint* pSessionId)
#cfunc global ProcessIdToSessionId "ProcessIdToSessionId" int, var

; winmdroot.Foundation.BOOL PulseEvent(winmdroot.Foundation.HANDLE hEvent)
#cfunc global PulseEvent "PulseEvent" intptr

; winmdroot.Foundation.BOOL PurgeComm(winmdroot.Foundation.HANDLE hFile, winmdroot.Devices.Communication.PURGE_COMM_FLAGS dwFlags)
#cfunc global PurgeComm "PurgeComm" intptr, int

; winmdroot.Foundation.BOOL QueryActCtx(uint dwFlags, winmdroot.Foundation.HANDLE hActCtx, [Optional] void* pvSubInstance, uint ulInfoClass, [Optional] void* pvBuffer, nuint cbBuffer, [Optional] nuint* pcbWrittenOrRequired)
#cfunc global QueryActCtxW "QueryActCtxW" int, intptr, intptr, int, intptr, int, var

; winmdroot.Foundation.BOOL QueryActCtxSettings(uint dwFlags, winmdroot.Foundation.HANDLE hActCtx, winmdroot.Foundation.PCWSTR settingsNameSpace, winmdroot.Foundation.PCWSTR settingName, winmdroot.Foundation.PWSTR pvBuffer, nuint dwBuffer, [Optional] nuint* pdwWrittenOrRequired)
#cfunc global QueryActCtxSettingsW "QueryActCtxSettingsW" int, intptr, wstr, wstr, wstr, int, var

; uint QueryDosDevice(winmdroot.Foundation.PCWSTR lpDeviceName, winmdroot.Foundation.PWSTR lpTargetPath, uint ucchMax)
#cfunc global QueryDosDeviceW "QueryDosDeviceW" wstr, wstr, int

; winmdroot.Foundation.BOOL QueryFullProcessImageName(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.Threading.PROCESS_NAME_FORMAT dwFlags, winmdroot.Foundation.PWSTR lpExeName, uint* lpdwSize)
#cfunc global QueryFullProcessImageNameW "QueryFullProcessImageNameW" intptr, int, wstr, var

; winmdroot.Foundation.BOOL QueryIdleProcessorCycleTime(uint* BufferLength, [Optional] ulong* ProcessorIdleCycleTime)
#cfunc global QueryIdleProcessorCycleTime "QueryIdleProcessorCycleTime" var, var

; winmdroot.Foundation.BOOL QueryIdleProcessorCycleTimeEx(ushort Group, uint* BufferLength, [Optional] ulong* ProcessorIdleCycleTime)
#cfunc global QueryIdleProcessorCycleTimeEx "QueryIdleProcessorCycleTimeEx" int, var, var

; winmdroot.Foundation.BOOL QueryInformationJobObject(winmdroot.Foundation.HANDLE hJob, winmdroot.System.JobObjects.JOBOBJECTINFOCLASS JobObjectInformationClass, void* lpJobObjectInformation, uint cbJobObjectInformationLength, [Optional] uint* lpReturnLength)
#cfunc global QueryInformationJobObject "QueryInformationJobObject" intptr, int, intptr, int, var

; uint QueryIoRateControlInformationJobObject(winmdroot.Foundation.HANDLE hJob, winmdroot.Foundation.PCWSTR VolumeName, winmdroot.System.JobObjects.JOBOBJECT_IO_RATE_CONTROL_INFORMATION** InfoBlocks, uint* InfoBlockCount)
#cfunc global QueryIoRateControlInformationJobObject "QueryIoRateControlInformationJobObject" intptr, wstr, var, var

; winmdroot.Foundation.BOOL QueryMemoryResourceNotification(winmdroot.Foundation.HANDLE ResourceNotificationHandle, winmdroot.Foundation.BOOL* ResourceState)
#cfunc global QueryMemoryResourceNotification "QueryMemoryResourceNotification" intptr, var

; winmdroot.Foundation.BOOL QueryPerformanceCounter(long* lpPerformanceCount)
#cfunc global QueryPerformanceCounter "QueryPerformanceCounter" var

; winmdroot.Foundation.BOOL QueryPerformanceFrequency(long* lpFrequency)
#cfunc global QueryPerformanceFrequency "QueryPerformanceFrequency" var

; winmdroot.Foundation.BOOL QueryProcessAffinityUpdateMode(winmdroot.Foundation.HANDLE hProcess, [Optional] winmdroot.System.Threading.PROCESS_AFFINITY_AUTO_UPDATE_FLAGS* lpdwFlags)
#cfunc global QueryProcessAffinityUpdateMode "QueryProcessAffinityUpdateMode" intptr, var

; winmdroot.Foundation.BOOL QueryProcessCycleTime(winmdroot.Foundation.HANDLE ProcessHandle, ulong* CycleTime)
#cfunc global QueryProcessCycleTime "QueryProcessCycleTime" intptr, var

; winmdroot.Foundation.BOOL QueryThreadCycleTime(winmdroot.Foundation.HANDLE ThreadHandle, ulong* CycleTime)
#cfunc global QueryThreadCycleTime "QueryThreadCycleTime" intptr, var

; uint QueryThreadProfiling(winmdroot.Foundation.HANDLE ThreadHandle, winmdroot.Foundation.BOOLEAN* Enabled)
#cfunc global QueryThreadProfiling "QueryThreadProfiling" intptr, var

; winmdroot.Foundation.BOOL QueryThreadpoolStackInformation(winmdroot.System.Threading.PTP_POOL ptpp, winmdroot.System.Threading.TP_POOL_STACK_INFORMATION* ptpsi)
#cfunc global QueryThreadpoolStackInformation "QueryThreadpoolStackInformation" intptr, var

; winmdroot.Foundation.BOOL QueryUmsThreadInformation(void* UmsThread, winmdroot.System.Threading.UMS_THREAD_INFO_CLASS UmsThreadInfoClass, void* UmsThreadInformation, uint UmsThreadInformationLength, [Optional] uint* ReturnLength)
#cfunc global QueryUmsThreadInformation "QueryUmsThreadInformation" intptr, int, intptr, int, var

; winmdroot.Foundation.BOOL QueryUnbiasedInterruptTime(ulong* UnbiasedTime)
#cfunc global QueryUnbiasedInterruptTime "QueryUnbiasedInterruptTime" var

; uint QueueUserAPC(delegate *unmanaged[Stdcall]<nuint,void> pfnAPC, winmdroot.Foundation.HANDLE hThread, nuint dwData)
#cfunc global QueueUserAPC "QueueUserAPC" int, intptr, int

; winmdroot.Foundation.BOOL QueueUserWorkItem(delegate *unmanaged[Stdcall]<void*,uint> Function, [Optional] void* Context, winmdroot.System.Threading.WORKER_THREAD_FLAGS Flags)
#cfunc global QueueUserWorkItem "QueueUserWorkItem" int, intptr, int

; void RaiseException(uint dwExceptionCode, uint dwExceptionFlags, uint nNumberOfArguments, [Optional] nuint* lpArguments)
#func global RaiseException "RaiseException" int, int, int, var

; winmdroot.Foundation.HANDLE ReOpenFile(winmdroot.Foundation.HANDLE hOriginalFile, uint dwDesiredAccess, winmdroot.Storage.FileSystem.FILE_SHARE_MODE dwShareMode, winmdroot.Storage.FileSystem.FILE_FLAGS_AND_ATTRIBUTES dwFlagsAndAttributes)
#cfunc global ReOpenFile "ReOpenFile" intptr, int, int, int

; winmdroot.Foundation.BOOL ReadConsole(winmdroot.Foundation.HANDLE hConsoleInput, void* lpBuffer, uint nNumberOfCharsToRead, uint* lpNumberOfCharsRead, [Optional] winmdroot.System.Console.CONSOLE_READCONSOLE_CONTROL* pInputControl)
#cfunc global ReadConsoleW "ReadConsoleW" intptr, intptr, int, var, var

; winmdroot.Foundation.BOOL ReadConsoleInput(winmdroot.Foundation.HANDLE hConsoleInput, winmdroot.System.Console.INPUT_RECORD* lpBuffer, uint nLength, uint* lpNumberOfEventsRead)
#cfunc global ReadConsoleInputW "ReadConsoleInputW" intptr, var, int, var

; winmdroot.Foundation.BOOL ReadConsoleOutput(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.System.Console.CHAR_INFO* lpBuffer, winmdroot.System.Console.COORD dwBufferSize, winmdroot.System.Console.COORD dwBufferCoord, winmdroot.System.Console.SMALL_RECT* lpReadRegion)
#cfunc global ReadConsoleOutputW "ReadConsoleOutputW" intptr, var, var, var, var

; winmdroot.Foundation.BOOL ReadConsoleOutputAttribute(winmdroot.Foundation.HANDLE hConsoleOutput, ushort* lpAttribute, uint nLength, winmdroot.System.Console.COORD dwReadCoord, uint* lpNumberOfAttrsRead)
#cfunc global ReadConsoleOutputAttribute "ReadConsoleOutputAttribute" intptr, var, int, var, var

; winmdroot.Foundation.BOOL ReadConsoleOutputCharacter(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.Foundation.PWSTR lpCharacter, uint nLength, winmdroot.System.Console.COORD dwReadCoord, uint* lpNumberOfCharsRead)
#cfunc global ReadConsoleOutputCharacterW "ReadConsoleOutputCharacterW" intptr, wstr, int, var, var

; winmdroot.Foundation.BOOL ReadDirectoryChanges(winmdroot.Foundation.HANDLE hDirectory, void* lpBuffer, uint nBufferLength, winmdroot.Foundation.BOOL bWatchSubtree, winmdroot.Storage.FileSystem.FILE_NOTIFY_CHANGE dwNotifyFilter, [Optional] uint* lpBytesReturned, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped, delegate *unmanaged[Stdcall]<uint,uint,global::System.Threading.NativeOverlapped*,void> lpCompletionRoutine)
#cfunc global ReadDirectoryChangesW "ReadDirectoryChangesW" intptr, intptr, int, int, int, var, var, int

; winmdroot.Foundation.BOOL ReadDirectoryChangesEx(winmdroot.Foundation.HANDLE hDirectory, void* lpBuffer, uint nBufferLength, winmdroot.Foundation.BOOL bWatchSubtree, winmdroot.Storage.FileSystem.FILE_NOTIFY_CHANGE dwNotifyFilter, [Optional] uint* lpBytesReturned, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped, delegate *unmanaged[Stdcall]<uint,uint,global::System.Threading.NativeOverlapped*,void> lpCompletionRoutine, winmdroot.Storage.FileSystem.READ_DIRECTORY_NOTIFY_INFORMATION_CLASS ReadDirectoryNotifyInformationClass)
#cfunc global ReadDirectoryChangesExW "ReadDirectoryChangesExW" intptr, intptr, int, int, int, var, var, int, int

; winmdroot.Foundation.BOOL ReadFile(winmdroot.Foundation.HANDLE hFile, [Optional] byte* lpBuffer, uint nNumberOfBytesToRead, [Optional] uint* lpNumberOfBytesRead, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped)
#cfunc global ReadFile "ReadFile" intptr, var, int, var, var

; winmdroot.Foundation.BOOL ReadFileEx(winmdroot.Foundation.HANDLE hFile, [Optional] byte* lpBuffer, uint nNumberOfBytesToRead, global::System.Threading.NativeOverlapped* lpOverlapped, delegate *unmanaged[Stdcall]<uint,uint,global::System.Threading.NativeOverlapped*,void> lpCompletionRoutine)
#cfunc global ReadFileEx "ReadFileEx" intptr, var, int, var, int

; winmdroot.Foundation.BOOL ReadFileScatter(winmdroot.Foundation.HANDLE hFile, winmdroot.Storage.FileSystem.FILE_SEGMENT_ELEMENT* aSegmentArray, uint nNumberOfBytesToRead, [Optional] uint* lpReserved, global::System.Threading.NativeOverlapped* lpOverlapped)
#cfunc global ReadFileScatter "ReadFileScatter" intptr, var, int, var, var

; winmdroot.Foundation.BOOL ReadProcessMemory(winmdroot.Foundation.HANDLE hProcess, void* lpBaseAddress, void* lpBuffer, nuint nSize, [Optional] nuint* lpNumberOfBytesRead)
#cfunc global ReadProcessMemory "ReadProcessMemory" intptr, intptr, intptr, int, var

; uint ReadThreadProfilingData(winmdroot.Foundation.HANDLE PerformanceDataHandle, uint Flags, winmdroot.System.Performance.HardwareCounterProfiling.PERFORMANCE_DATA* PerformanceData)
#cfunc global ReadThreadProfilingData "ReadThreadProfilingData" intptr, int, var

; winmdroot.Foundation.HRESULT RegisterApplicationRecoveryCallback(delegate *unmanaged[Stdcall]<void*,uint> pRecoveyCallback, [Optional] void* pvParameter, uint dwPingInterval, uint dwFlags)
#cfunc global RegisterApplicationRecoveryCallback "RegisterApplicationRecoveryCallback" int, intptr, int, int

; winmdroot.Foundation.HRESULT RegisterApplicationRestart(winmdroot.Foundation.PCWSTR pwzCommandline, winmdroot.System.Recovery.REGISTER_APPLICATION_RESTART_FLAGS dwFlags)
#cfunc global RegisterApplicationRestart "RegisterApplicationRestart" wstr, int

; void* RegisterBadMemoryNotification(delegate *unmanaged[Stdcall]<void> Callback)
#cfunc global RegisterBadMemoryNotification "RegisterBadMemoryNotification" int

; winmdroot.Foundation.BOOL RegisterWaitForSingleObject(winmdroot.Foundation.HANDLE* phNewWaitObject, winmdroot.Foundation.HANDLE hObject, delegate *unmanaged[Stdcall]<void*,global::Windows.Win32.Foundation.BOOLEAN,void> Callback, [Optional] void* Context, uint dwMilliseconds, winmdroot.System.Threading.WORKER_THREAD_FLAGS dwFlags)
#cfunc global RegisterWaitForSingleObject "RegisterWaitForSingleObject" intptr, intptr, int, intptr, int, int

; winmdroot.Foundation.BOOL RegisterWaitUntilOOBECompleted(delegate *unmanaged[Stdcall]<void*,void> OOBECompletedCallback, [Optional] void* CallbackContext, void** WaitHandle)
#cfunc global RegisterWaitUntilOOBECompleted "RegisterWaitUntilOOBECompleted" int, intptr, var

; void ReleaseActCtx(winmdroot.Foundation.HANDLE hActCtx)
#func global ReleaseActCtx "ReleaseActCtx" intptr

; winmdroot.Foundation.BOOL ReleaseMutex(winmdroot.Foundation.HANDLE hMutex)
#cfunc global ReleaseMutex "ReleaseMutex" intptr

; winmdroot.Foundation.BOOL ReleaseSemaphore(winmdroot.Foundation.HANDLE hSemaphore, int lReleaseCount, [Optional] int* lpPreviousCount)
#cfunc global ReleaseSemaphore "ReleaseSemaphore" intptr, int, var

; winmdroot.Foundation.BOOL RemoveDirectory(winmdroot.Foundation.PCWSTR lpPathName)
#cfunc global RemoveDirectoryW "RemoveDirectoryW" wstr

; winmdroot.Foundation.BOOL RemoveDirectoryTransacted(winmdroot.Foundation.PCWSTR lpPathName, winmdroot.Foundation.HANDLE hTransaction)
#cfunc global RemoveDirectoryTransactedW "RemoveDirectoryTransactedW" wstr, intptr

; winmdroot.Foundation.BOOL RemoveSecureMemoryCacheCallback(delegate *unmanaged[Stdcall]<void*,nuint,global::Windows.Win32.Foundation.BOOLEAN> pfnCallBack)
#cfunc global RemoveSecureMemoryCacheCallback "RemoveSecureMemoryCacheCallback" int

; winmdroot.Foundation.BOOL ReplaceFile(winmdroot.Foundation.PCWSTR lpReplacedFileName, winmdroot.Foundation.PCWSTR lpReplacementFileName, winmdroot.Foundation.PCWSTR lpBackupFileName, winmdroot.Storage.FileSystem.REPLACE_FILE_FLAGS dwReplaceFlags, [Optional] void* lpExclude, [Optional] void* lpReserved)
#cfunc global ReplaceFileW "ReplaceFileW" wstr, wstr, wstr, int, intptr, intptr

; winmdroot.Foundation.BOOL ReplacePartitionUnit(winmdroot.Foundation.PWSTR TargetPartition, winmdroot.Foundation.PWSTR SparePartition, uint Flags)
#cfunc global ReplacePartitionUnit "ReplacePartitionUnit" wstr, wstr, int

; winmdroot.Foundation.BOOL RequestDeviceWakeup(winmdroot.Foundation.HANDLE hDevice)
#cfunc global RequestDeviceWakeup "RequestDeviceWakeup" intptr

; winmdroot.Foundation.BOOL RequestWakeupLatency(winmdroot.System.Power.LATENCY_TIME latency)
#cfunc global RequestWakeupLatency "RequestWakeupLatency" int

; winmdroot.Foundation.BOOL ResetEvent(winmdroot.Foundation.HANDLE hEvent)
#cfunc global ResetEvent "ResetEvent" intptr

; uint ResetWriteWatch(void* lpBaseAddress, nuint dwRegionSize)
#cfunc global ResetWriteWatch "ResetWriteWatch" intptr, int

; winmdroot.Foundation.HRESULT ResizePseudoConsole(winmdroot.System.Console.HPCON hPC, winmdroot.System.Console.COORD size)
#cfunc global ResizePseudoConsole "ResizePseudoConsole" intptr, var

; int ResolveLocaleName(winmdroot.Foundation.PCWSTR lpNameToResolve, winmdroot.Foundation.PWSTR lpLocaleName, int cchLocaleName)
#cfunc global ResolveLocaleName "ResolveLocaleName" wstr, wstr, int

; uint ResumeThread(winmdroot.Foundation.HANDLE hThread)
#cfunc global ResumeThread "ResumeThread" intptr

; ushort RtlCaptureStackBackTrace(uint FramesToSkip, uint FramesToCapture, void** BackTrace, [Optional] uint* BackTraceHash)
#cfunc global RtlCaptureStackBackTrace "RtlCaptureStackBackTrace" int, int, var, var

; nuint RtlCompareMemory(void* Source1, void* Source2, nuint Length)
#cfunc global RtlCompareMemory "RtlCompareMemory" intptr, intptr, int

; void* RtlPcToFileHeader(void* PcValue, void** BaseOfImage)
#cfunc global RtlPcToFileHeader "RtlPcToFileHeader" intptr, var

; void RtlRaiseException(winmdroot.System.Diagnostics.Debug.EXCEPTION_RECORD* ExceptionRecord)
#func global RtlRaiseException "RtlRaiseException" var

; void RtlUnwind([Optional] void* TargetFrame, [Optional] void* TargetIp, [Optional] winmdroot.System.Diagnostics.Debug.EXCEPTION_RECORD* ExceptionRecord, void* ReturnValue)
#func global RtlUnwind "RtlUnwind" intptr, intptr, var, intptr

; winmdroot.Foundation.BOOL ScrollConsoleScreenBuffer(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.System.Console.SMALL_RECT* lpScrollRectangle, [Optional] winmdroot.System.Console.SMALL_RECT* lpClipRectangle, winmdroot.System.Console.COORD dwDestinationOrigin, winmdroot.System.Console.CHAR_INFO* lpFill)
#cfunc global ScrollConsoleScreenBufferW "ScrollConsoleScreenBufferW" intptr, var, var, var, var

; uint SearchPath(winmdroot.Foundation.PCWSTR lpPath, winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Foundation.PCWSTR lpExtension, uint nBufferLength, winmdroot.Foundation.PWSTR lpBuffer, [Optional] winmdroot.Foundation.PWSTR* lpFilePart)
#cfunc global SearchPathW "SearchPathW" wstr, wstr, wstr, int, wstr, var

; winmdroot.Foundation.BOOL SetCachedSigningLevel(winmdroot.Foundation.HANDLE* SourceFiles, uint SourceFileCount, uint Flags, winmdroot.Foundation.HANDLE TargetFile)
#cfunc global SetCachedSigningLevel "SetCachedSigningLevel" intptr, int, int, intptr

; winmdroot.Foundation.BOOL SetCalendarInfo(uint Locale, uint Calendar, uint CalType, winmdroot.Foundation.PCWSTR lpCalData)
#cfunc global SetCalendarInfoW "SetCalendarInfoW" int, int, int, wstr

; winmdroot.Foundation.BOOL SetCommBreak(winmdroot.Foundation.HANDLE hFile)
#cfunc global SetCommBreak "SetCommBreak" intptr

; winmdroot.Foundation.BOOL SetCommConfig(winmdroot.Foundation.HANDLE hCommDev, winmdroot.Devices.Communication.COMMCONFIG* lpCC, uint dwSize)
#cfunc global SetCommConfig "SetCommConfig" intptr, var, int

; winmdroot.Foundation.BOOL SetCommMask(winmdroot.Foundation.HANDLE hFile, winmdroot.Devices.Communication.COMM_EVENT_MASK dwEvtMask)
#cfunc global SetCommMask "SetCommMask" intptr, int

; winmdroot.Foundation.BOOL SetCommState(winmdroot.Foundation.HANDLE hFile, winmdroot.Devices.Communication.DCB* lpDCB)
#cfunc global SetCommState "SetCommState" intptr, var

; winmdroot.Foundation.BOOL SetCommTimeouts(winmdroot.Foundation.HANDLE hFile, winmdroot.Devices.Communication.COMMTIMEOUTS* lpCommTimeouts)
#cfunc global SetCommTimeouts "SetCommTimeouts" intptr, var

; winmdroot.Foundation.BOOL SetComputerName(winmdroot.Foundation.PCWSTR lpComputerName)
#cfunc global SetComputerNameW "SetComputerNameW" wstr

; winmdroot.Foundation.BOOL SetComputerNameEx(winmdroot.System.SystemInformation.COMPUTER_NAME_FORMAT NameType, winmdroot.Foundation.PCWSTR lpBuffer)
#cfunc global SetComputerNameExW "SetComputerNameExW" int, wstr

; winmdroot.Foundation.BOOL SetComputerNameEx2W(winmdroot.System.SystemInformation.COMPUTER_NAME_FORMAT NameType, uint Flags, winmdroot.Foundation.PCWSTR lpBuffer)
#cfunc global SetComputerNameEx2W "SetComputerNameEx2W" int, int, wstr

; winmdroot.Foundation.BOOL SetConsoleActiveScreenBuffer(winmdroot.Foundation.HANDLE hConsoleOutput)
#cfunc global SetConsoleActiveScreenBuffer "SetConsoleActiveScreenBuffer" intptr

; winmdroot.Foundation.BOOL SetConsoleCP(uint wCodePageID)
#cfunc global SetConsoleCP "SetConsoleCP" int

; winmdroot.Foundation.BOOL SetConsoleCtrlHandler(delegate *unmanaged[Stdcall]<uint,global::Windows.Win32.Foundation.BOOL> HandlerRoutine, winmdroot.Foundation.BOOL Add)
#cfunc global SetConsoleCtrlHandler "SetConsoleCtrlHandler" int, int

; winmdroot.Foundation.BOOL SetConsoleCursorInfo(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.System.Console.CONSOLE_CURSOR_INFO* lpConsoleCursorInfo)
#cfunc global SetConsoleCursorInfo "SetConsoleCursorInfo" intptr, var

; winmdroot.Foundation.BOOL SetConsoleCursorPosition(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.System.Console.COORD dwCursorPosition)
#cfunc global SetConsoleCursorPosition "SetConsoleCursorPosition" intptr, var

; winmdroot.Foundation.BOOL SetConsoleDisplayMode(winmdroot.Foundation.HANDLE hConsoleOutput, uint dwFlags, [Optional] winmdroot.System.Console.COORD* lpNewScreenBufferDimensions)
#cfunc global SetConsoleDisplayMode "SetConsoleDisplayMode" intptr, int, var

; winmdroot.Foundation.BOOL SetConsoleHistoryInfo(winmdroot.System.Console.CONSOLE_HISTORY_INFO* lpConsoleHistoryInfo)
#cfunc global SetConsoleHistoryInfo "SetConsoleHistoryInfo" var

; winmdroot.Foundation.BOOL SetConsoleMode(winmdroot.Foundation.HANDLE hConsoleHandle, winmdroot.System.Console.CONSOLE_MODE dwMode)
#cfunc global SetConsoleMode "SetConsoleMode" intptr, int

; winmdroot.Foundation.BOOL SetConsoleNumberOfCommandsW(uint Number, winmdroot.Foundation.PWSTR ExeName)
#cfunc global SetConsoleNumberOfCommandsW "SetConsoleNumberOfCommandsW" int, wstr

; winmdroot.Foundation.BOOL SetConsoleOutputCP(uint wCodePageID)
#cfunc global SetConsoleOutputCP "SetConsoleOutputCP" int

; winmdroot.Foundation.BOOL SetConsoleScreenBufferInfoEx(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.System.Console.CONSOLE_SCREEN_BUFFER_INFOEX* lpConsoleScreenBufferInfoEx)
#cfunc global SetConsoleScreenBufferInfoEx "SetConsoleScreenBufferInfoEx" intptr, var

; winmdroot.Foundation.BOOL SetConsoleScreenBufferSize(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.System.Console.COORD dwSize)
#cfunc global SetConsoleScreenBufferSize "SetConsoleScreenBufferSize" intptr, var

; winmdroot.Foundation.BOOL SetConsoleTextAttribute(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.System.Console.CONSOLE_CHARACTER_ATTRIBUTES wAttributes)
#cfunc global SetConsoleTextAttribute "SetConsoleTextAttribute" intptr, int

; winmdroot.Foundation.BOOL SetConsoleTitle(winmdroot.Foundation.PCWSTR lpConsoleTitle)
#cfunc global SetConsoleTitleW "SetConsoleTitleW" wstr

; winmdroot.Foundation.BOOL SetConsoleWindowInfo(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.Foundation.BOOL bAbsolute, winmdroot.System.Console.SMALL_RECT* lpConsoleWindow)
#cfunc global SetConsoleWindowInfo "SetConsoleWindowInfo" intptr, int, var

; winmdroot.Foundation.BOOL SetCurrentConsoleFontEx(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.Foundation.BOOL bMaximumWindow, winmdroot.System.Console.CONSOLE_FONT_INFOEX* lpConsoleCurrentFontEx)
#cfunc global SetCurrentConsoleFontEx "SetCurrentConsoleFontEx" intptr, int, var

; winmdroot.Foundation.BOOL SetCurrentDirectoryW(winmdroot.Foundation.PCWSTR lpPathName)
#cfunc global SetCurrentDirectoryW "SetCurrentDirectoryW" wstr

; winmdroot.Foundation.BOOL SetDefaultCommConfig(winmdroot.Foundation.PCWSTR lpszName, winmdroot.Devices.Communication.COMMCONFIG* lpCC, uint dwSize)
#cfunc global SetDefaultCommConfigW "SetDefaultCommConfigW" wstr, var, int

; winmdroot.Foundation.BOOL SetDllDirectory(winmdroot.Foundation.PCWSTR lpPathName)
#cfunc global SetDllDirectoryW "SetDllDirectoryW" wstr

; winmdroot.Foundation.BOOL SetDynamicTimeZoneInformation(winmdroot.System.Time.DYNAMIC_TIME_ZONE_INFORMATION* lpTimeZoneInformation)
#cfunc global SetDynamicTimeZoneInformation "SetDynamicTimeZoneInformation" var

; winmdroot.Foundation.BOOL SetEndOfFile(winmdroot.Foundation.HANDLE hFile)
#cfunc global SetEndOfFile "SetEndOfFile" intptr

; winmdroot.Foundation.BOOL SetEnvironmentStringsW(winmdroot.Foundation.PZZWSTR NewEnvironment)
#cfunc global SetEnvironmentStringsW "SetEnvironmentStringsW" int

; winmdroot.Foundation.BOOL SetEnvironmentVariable(winmdroot.Foundation.PCWSTR lpName, winmdroot.Foundation.PCWSTR lpValue)
#cfunc global SetEnvironmentVariableW "SetEnvironmentVariableW" wstr, wstr

; winmdroot.System.Diagnostics.Debug.THREAD_ERROR_MODE SetErrorMode(winmdroot.System.Diagnostics.Debug.THREAD_ERROR_MODE uMode)
#cfunc global SetErrorMode "SetErrorMode" int

; winmdroot.Foundation.BOOL SetEvent(winmdroot.Foundation.HANDLE hEvent)
#cfunc global SetEvent "SetEvent" intptr

; void SetFileApisToANSI()
#func global SetFileApisToANSI "SetFileApisToANSI"

; void SetFileApisToOEM()
#func global SetFileApisToOEM "SetFileApisToOEM"

; winmdroot.Foundation.BOOL SetFileAttributes(winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Storage.FileSystem.FILE_FLAGS_AND_ATTRIBUTES dwFileAttributes)
#cfunc global SetFileAttributesW "SetFileAttributesW" wstr, int

; winmdroot.Foundation.BOOL SetFileAttributesTransacted(winmdroot.Foundation.PCWSTR lpFileName, uint dwFileAttributes, winmdroot.Foundation.HANDLE hTransaction)
#cfunc global SetFileAttributesTransactedW "SetFileAttributesTransactedW" wstr, int, intptr

; winmdroot.Foundation.BOOL SetFileBandwidthReservation(winmdroot.Foundation.HANDLE hFile, uint nPeriodMilliseconds, uint nBytesPerPeriod, winmdroot.Foundation.BOOL bDiscardable, uint* lpTransferSize, uint* lpNumOutstandingRequests)
#cfunc global SetFileBandwidthReservation "SetFileBandwidthReservation" intptr, int, int, int, var, var

; winmdroot.Foundation.BOOL SetFileCompletionNotificationModes(winmdroot.Foundation.HANDLE FileHandle, byte Flags)
#cfunc global SetFileCompletionNotificationModes "SetFileCompletionNotificationModes" intptr, int

; winmdroot.Foundation.BOOL SetFileInformationByHandle(winmdroot.Foundation.HANDLE hFile, winmdroot.Storage.FileSystem.FILE_INFO_BY_HANDLE_CLASS FileInformationClass, void* lpFileInformation, uint dwBufferSize)
#cfunc global SetFileInformationByHandle "SetFileInformationByHandle" intptr, int, intptr, int

; winmdroot.Foundation.BOOL SetFileIoOverlappedRange(winmdroot.Foundation.HANDLE FileHandle, byte* OverlappedRangeStart, uint Length)
#cfunc global SetFileIoOverlappedRange "SetFileIoOverlappedRange" intptr, var, int

; uint SetFilePointer(winmdroot.Foundation.HANDLE hFile, int lDistanceToMove, [Optional] int* lpDistanceToMoveHigh, winmdroot.Storage.FileSystem.SET_FILE_POINTER_MOVE_METHOD dwMoveMethod)
#cfunc global SetFilePointer "SetFilePointer" intptr, int, var, int

; winmdroot.Foundation.BOOL SetFilePointerEx(winmdroot.Foundation.HANDLE hFile, long liDistanceToMove, [Optional] long* lpNewFilePointer, winmdroot.Storage.FileSystem.SET_FILE_POINTER_MOVE_METHOD dwMoveMethod)
#cfunc global SetFilePointerEx "SetFilePointerEx" intptr, int64, var, int

; winmdroot.Foundation.BOOL SetFileShortName(winmdroot.Foundation.HANDLE hFile, winmdroot.Foundation.PCWSTR lpShortName)
#cfunc global SetFileShortNameW "SetFileShortNameW" intptr, wstr

; winmdroot.Foundation.BOOL SetFileTime(winmdroot.Foundation.HANDLE hFile, [Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* lpCreationTime, [Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* lpLastAccessTime, [Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* lpLastWriteTime)
#cfunc global SetFileTime "SetFileTime" intptr, var, var, var

; winmdroot.Foundation.BOOL SetFileValidData(winmdroot.Foundation.HANDLE hFile, long ValidDataLength)
#cfunc global SetFileValidData "SetFileValidData" intptr, int64

; winmdroot.Foundation.BOOL SetFirmwareEnvironmentVariable(winmdroot.Foundation.PCWSTR lpName, winmdroot.Foundation.PCWSTR lpGuid, [Optional] void* pValue, uint nSize)
#cfunc global SetFirmwareEnvironmentVariableW "SetFirmwareEnvironmentVariableW" wstr, wstr, intptr, int

; winmdroot.Foundation.BOOL SetFirmwareEnvironmentVariableEx(winmdroot.Foundation.PCWSTR lpName, winmdroot.Foundation.PCWSTR lpGuid, [Optional] void* pValue, uint nSize, uint dwAttributes)
#cfunc global SetFirmwareEnvironmentVariableExW "SetFirmwareEnvironmentVariableExW" wstr, wstr, intptr, int, int

; uint SetHandleCount(uint uNumber)
#cfunc global SetHandleCount "SetHandleCount" int

; winmdroot.Foundation.BOOL SetHandleInformation(winmdroot.Foundation.HANDLE hObject, uint dwMask, winmdroot.Foundation.HANDLE_FLAGS dwFlags)
#cfunc global SetHandleInformation "SetHandleInformation" intptr, int, int

; winmdroot.Foundation.BOOL SetInformationJobObject(winmdroot.Foundation.HANDLE hJob, winmdroot.System.JobObjects.JOBOBJECTINFOCLASS JobObjectInformationClass, void* lpJobObjectInformation, uint cbJobObjectInformationLength)
#cfunc global SetInformationJobObject "SetInformationJobObject" intptr, int, intptr, int

; uint SetIoRateControlInformationJobObject(winmdroot.Foundation.HANDLE hJob, winmdroot.System.JobObjects.JOBOBJECT_IO_RATE_CONTROL_INFORMATION* IoRateControlInfo)
#cfunc global SetIoRateControlInformationJobObject "SetIoRateControlInformationJobObject" intptr, var

; void SetLastError(winmdroot.Foundation.WIN32_ERROR dwErrCode)
#func global SetLastError "SetLastError" int

; winmdroot.Foundation.BOOL SetLocalTime(winmdroot.Foundation.SYSTEMTIME* lpSystemTime)
#cfunc global SetLocalTime "SetLocalTime" var

; winmdroot.Foundation.BOOL SetLocaleInfo(uint Locale, uint LCType, winmdroot.Foundation.PCWSTR lpLCData)
#cfunc global SetLocaleInfoW "SetLocaleInfoW" int, int, wstr

; winmdroot.Foundation.BOOL SetMailslotInfo(winmdroot.Foundation.HANDLE hMailslot, uint lReadTimeout)
#cfunc global SetMailslotInfo "SetMailslotInfo" intptr, int

; winmdroot.Foundation.BOOL SetMessageWaitingIndicator(winmdroot.Foundation.HANDLE hMsgIndicator, uint ulMsgCount)
#cfunc global SetMessageWaitingIndicator "SetMessageWaitingIndicator" intptr, int

; winmdroot.Foundation.BOOL SetNamedPipeHandleState(winmdroot.Foundation.HANDLE hNamedPipe, [Optional] winmdroot.System.Pipes.NAMED_PIPE_MODE* lpMode, [Optional] uint* lpMaxCollectionCount, [Optional] uint* lpCollectDataTimeout)
#cfunc global SetNamedPipeHandleState "SetNamedPipeHandleState" intptr, var, var, var

; winmdroot.Foundation.BOOL SetPriorityClass(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.Threading.PROCESS_CREATION_FLAGS dwPriorityClass)
#cfunc global SetPriorityClass "SetPriorityClass" intptr, int

; winmdroot.Foundation.BOOL SetProcessAffinityMask(winmdroot.Foundation.HANDLE hProcess, nuint dwProcessAffinityMask)
#cfunc global SetProcessAffinityMask "SetProcessAffinityMask" intptr, int

; winmdroot.Foundation.BOOL SetProcessAffinityUpdateMode(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.Threading.PROCESS_AFFINITY_AUTO_UPDATE_FLAGS dwFlags)
#cfunc global SetProcessAffinityUpdateMode "SetProcessAffinityUpdateMode" intptr, int

; winmdroot.Foundation.BOOL SetProcessDEPPolicy(winmdroot.System.Threading.PROCESS_DEP_FLAGS dwFlags)
#cfunc global SetProcessDEPPolicy "SetProcessDEPPolicy" int

; winmdroot.Foundation.BOOL SetProcessInformation(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.Threading.PROCESS_INFORMATION_CLASS ProcessInformationClass, void* ProcessInformation, uint ProcessInformationSize)
#cfunc global SetProcessInformation "SetProcessInformation" intptr, int, intptr, int

; winmdroot.Foundation.BOOL SetProcessPreferredUILanguages(uint dwFlags, winmdroot.Foundation.PCZZWSTR pwszLanguagesBuffer, [Optional] uint* pulNumLanguages)
#cfunc global SetProcessPreferredUILanguages "SetProcessPreferredUILanguages" int, int, var

; winmdroot.Foundation.BOOL SetProcessPriorityBoost(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.BOOL bDisablePriorityBoost)
#cfunc global SetProcessPriorityBoost "SetProcessPriorityBoost" intptr, int

; winmdroot.Foundation.BOOL SetProcessShutdownParameters(uint dwLevel, uint dwFlags)
#cfunc global SetProcessShutdownParameters "SetProcessShutdownParameters" int, int

; winmdroot.Foundation.BOOL SetProcessWorkingSetSize(winmdroot.Foundation.HANDLE hProcess, nuint dwMinimumWorkingSetSize, nuint dwMaximumWorkingSetSize)
#cfunc global SetProcessWorkingSetSize "SetProcessWorkingSetSize" intptr, int, int

; winmdroot.Foundation.BOOL SetProcessWorkingSetSizeEx(winmdroot.Foundation.HANDLE hProcess, nuint dwMinimumWorkingSetSize, nuint dwMaximumWorkingSetSize, winmdroot.System.Memory.SETPROCESSWORKINGSETSIZEEX_FLAGS Flags)
#cfunc global SetProcessWorkingSetSizeEx "SetProcessWorkingSetSizeEx" intptr, int, int, int

; winmdroot.Foundation.BOOL SetSearchPathMode(uint Flags)
#cfunc global SetSearchPathMode "SetSearchPathMode" int

; winmdroot.Foundation.BOOL SetStdHandle(winmdroot.System.Console.STD_HANDLE nStdHandle, winmdroot.Foundation.HANDLE hHandle)
#cfunc global SetStdHandle "SetStdHandle" int, intptr

; winmdroot.Foundation.BOOL SetStdHandleEx(winmdroot.System.Console.STD_HANDLE nStdHandle, winmdroot.Foundation.HANDLE hHandle, [Optional] winmdroot.Foundation.HANDLE* phPrevValue)
#cfunc global SetStdHandleEx "SetStdHandleEx" int, intptr, intptr

; winmdroot.Foundation.BOOL SetSystemFileCacheSize(nuint MinimumFileCacheSize, nuint MaximumFileCacheSize, uint Flags)
#cfunc global SetSystemFileCacheSize "SetSystemFileCacheSize" int, int, int

; winmdroot.Foundation.BOOL SetSystemPowerState(winmdroot.Foundation.BOOL fSuspend, winmdroot.Foundation.BOOL fForce)
#cfunc global SetSystemPowerState "SetSystemPowerState" int, int

; winmdroot.Foundation.BOOL SetSystemTime(winmdroot.Foundation.SYSTEMTIME* lpSystemTime)
#cfunc global SetSystemTime "SetSystemTime" var

; winmdroot.Foundation.BOOL SetSystemTimeAdjustment(uint dwTimeAdjustment, winmdroot.Foundation.BOOL bTimeAdjustmentDisabled)
#cfunc global SetSystemTimeAdjustment "SetSystemTimeAdjustment" int, int

; uint SetTapeParameters(winmdroot.Foundation.HANDLE hDevice, winmdroot.Storage.FileSystem.TAPE_INFORMATION_TYPE dwOperation, void* lpTapeInformation)
#cfunc global SetTapeParameters "SetTapeParameters" intptr, int, intptr

; uint SetTapePosition(winmdroot.Foundation.HANDLE hDevice, winmdroot.Storage.FileSystem.TAPE_POSITION_METHOD dwPositionMethod, uint dwPartition, uint dwOffsetLow, uint dwOffsetHigh, winmdroot.Foundation.BOOL bImmediate)
#cfunc global SetTapePosition "SetTapePosition" intptr, int, int, int, int, int

; nuint SetThreadAffinityMask(winmdroot.Foundation.HANDLE hThread, nuint dwThreadAffinityMask)
#cfunc global SetThreadAffinityMask "SetThreadAffinityMask" intptr, int

; winmdroot.Foundation.BOOL SetThreadErrorMode(winmdroot.System.Diagnostics.Debug.THREAD_ERROR_MODE dwNewMode, [Optional] winmdroot.System.Diagnostics.Debug.THREAD_ERROR_MODE* lpOldMode)
#cfunc global SetThreadErrorMode "SetThreadErrorMode" int, var

; winmdroot.System.Power.EXECUTION_STATE SetThreadExecutionState(winmdroot.System.Power.EXECUTION_STATE esFlags)
#cfunc global SetThreadExecutionState "SetThreadExecutionState" int

; winmdroot.Foundation.BOOL SetThreadGroupAffinity(winmdroot.Foundation.HANDLE hThread, winmdroot.System.SystemInformation.GROUP_AFFINITY* GroupAffinity, [Optional] winmdroot.System.SystemInformation.GROUP_AFFINITY* PreviousGroupAffinity)
#cfunc global SetThreadGroupAffinity "SetThreadGroupAffinity" intptr, var, var

; uint SetThreadIdealProcessor(winmdroot.Foundation.HANDLE hThread, uint dwIdealProcessor)
#cfunc global SetThreadIdealProcessor "SetThreadIdealProcessor" intptr, int

; winmdroot.Foundation.BOOL SetThreadIdealProcessorEx(winmdroot.Foundation.HANDLE hThread, winmdroot.System.Kernel.PROCESSOR_NUMBER* lpIdealProcessor, [Optional] winmdroot.System.Kernel.PROCESSOR_NUMBER* lpPreviousIdealProcessor)
#cfunc global SetThreadIdealProcessorEx "SetThreadIdealProcessorEx" intptr, var, var

; winmdroot.Foundation.BOOL SetThreadInformation(winmdroot.Foundation.HANDLE hThread, winmdroot.System.Threading.THREAD_INFORMATION_CLASS ThreadInformationClass, void* ThreadInformation, uint ThreadInformationSize)
#cfunc global SetThreadInformation "SetThreadInformation" intptr, int, intptr, int

; winmdroot.Foundation.BOOL SetThreadLocale(uint Locale)
#cfunc global SetThreadLocale "SetThreadLocale" int

; winmdroot.Foundation.BOOL SetThreadPreferredUILanguages(uint dwFlags, winmdroot.Foundation.PCZZWSTR pwszLanguagesBuffer, [Optional] uint* pulNumLanguages)
#cfunc global SetThreadPreferredUILanguages "SetThreadPreferredUILanguages" int, int, var

; winmdroot.Foundation.BOOL SetThreadPriority(winmdroot.Foundation.HANDLE hThread, winmdroot.System.Threading.THREAD_PRIORITY nPriority)
#cfunc global SetThreadPriority "SetThreadPriority" intptr, int

; winmdroot.Foundation.BOOL SetThreadPriorityBoost(winmdroot.Foundation.HANDLE hThread, winmdroot.Foundation.BOOL bDisablePriorityBoost)
#cfunc global SetThreadPriorityBoost "SetThreadPriorityBoost" intptr, int

; winmdroot.Foundation.BOOL SetThreadStackGuarantee(uint* StackSizeInBytes)
#cfunc global SetThreadStackGuarantee "SetThreadStackGuarantee" var

; ushort SetThreadUILanguage(ushort LangId)
#cfunc global SetThreadUILanguage "SetThreadUILanguage" int

; winmdroot.Foundation.BOOL SetThreadpoolStackInformation(winmdroot.System.Threading.PTP_POOL ptpp, winmdroot.System.Threading.TP_POOL_STACK_INFORMATION* ptpsi)
#cfunc global SetThreadpoolStackInformation "SetThreadpoolStackInformation" intptr, var

; winmdroot.Foundation.BOOL SetThreadpoolThreadMinimum(winmdroot.System.Threading.PTP_POOL ptpp, uint cthrdMic)
#cfunc global SetThreadpoolThreadMinimum "SetThreadpoolThreadMinimum" intptr, int

; winmdroot.Foundation.BOOL SetTimeZoneInformation(winmdroot.System.Time.TIME_ZONE_INFORMATION* lpTimeZoneInformation)
#cfunc global SetTimeZoneInformation "SetTimeZoneInformation" var

; winmdroot.Foundation.HANDLE SetTimerQueueTimer(winmdroot.Foundation.HANDLE TimerQueue, delegate *unmanaged[Stdcall]<void*,global::Windows.Win32.Foundation.BOOLEAN,void> Callback, [Optional] void* Parameter, uint DueTime, uint Period, winmdroot.Foundation.BOOL PreferIo)
#cfunc global SetTimerQueueTimer "SetTimerQueueTimer" intptr, int, intptr, int, int, int

; winmdroot.Foundation.BOOL SetUmsThreadInformation(void* UmsThread, winmdroot.System.Threading.UMS_THREAD_INFO_CLASS UmsThreadInfoClass, void* UmsThreadInformation, uint UmsThreadInformationLength)
#cfunc global SetUmsThreadInformation "SetUmsThreadInformation" intptr, int, intptr, int

; winmdroot.Foundation.BOOL SetUserGeoID(int GeoId)
#cfunc global SetUserGeoID "SetUserGeoID" int

; winmdroot.Foundation.BOOL SetUserGeoName(winmdroot.Foundation.PWSTR geoName)
#cfunc global SetUserGeoName "SetUserGeoName" wstr

; winmdroot.Foundation.BOOL SetVolumeLabel(winmdroot.Foundation.PCWSTR lpRootPathName, winmdroot.Foundation.PCWSTR lpVolumeName)
#cfunc global SetVolumeLabelW "SetVolumeLabelW" wstr, wstr

; winmdroot.Foundation.BOOL SetVolumeMountPoint(winmdroot.Foundation.PCWSTR lpszVolumeMountPoint, winmdroot.Foundation.PCWSTR lpszVolumeName)
#cfunc global SetVolumeMountPointW "SetVolumeMountPointW" wstr, wstr

; winmdroot.Foundation.BOOL SetWaitableTimer(winmdroot.Foundation.HANDLE hTimer, long* lpDueTime, int lPeriod, delegate *unmanaged[Stdcall]<void*,uint,uint,void> pfnCompletionRoutine, [Optional] void* lpArgToCompletionRoutine, winmdroot.Foundation.BOOL fResume)
#cfunc global SetWaitableTimer "SetWaitableTimer" intptr, var, int, int, intptr, int

; winmdroot.Foundation.BOOL SetupComm(winmdroot.Foundation.HANDLE hFile, uint dwInQueue, uint dwOutQueue)
#cfunc global SetupComm "SetupComm" intptr, int, int

; winmdroot.Foundation.WAIT_EVENT SignalObjectAndWait(winmdroot.Foundation.HANDLE hObjectToSignal, winmdroot.Foundation.HANDLE hObjectToWaitOn, uint dwMilliseconds, winmdroot.Foundation.BOOL bAlertable)
#cfunc global SignalObjectAndWait "SignalObjectAndWait" intptr, intptr, int, int

; uint SizeofResource(winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.HRSRC hResInfo)
#cfunc global SizeofResource "SizeofResource" intptr, intptr

; void Sleep(uint dwMilliseconds)
#func global Sleep "Sleep" int

; uint SleepEx(uint dwMilliseconds, winmdroot.Foundation.BOOL bAlertable)
#cfunc global SleepEx "SleepEx" int, int

; uint SuspendThread(winmdroot.Foundation.HANDLE hThread)
#cfunc global SuspendThread "SuspendThread" intptr

; void SwitchToFiber(void* lpFiber)
#func global SwitchToFiber "SwitchToFiber" intptr

; winmdroot.Foundation.BOOL SwitchToThread()
#cfunc global SwitchToThread "SwitchToThread"

; winmdroot.Foundation.BOOL SystemTimeToFileTime(winmdroot.Foundation.SYSTEMTIME* lpSystemTime, global::System.Runtime.InteropServices.ComTypes.FILETIME* lpFileTime)
#cfunc global SystemTimeToFileTime "SystemTimeToFileTime" var, var

; winmdroot.Foundation.BOOL SystemTimeToTzSpecificLocalTime([Optional] winmdroot.System.Time.TIME_ZONE_INFORMATION* lpTimeZoneInformation, winmdroot.Foundation.SYSTEMTIME* lpUniversalTime, winmdroot.Foundation.SYSTEMTIME* lpLocalTime)
#cfunc global SystemTimeToTzSpecificLocalTime "SystemTimeToTzSpecificLocalTime" var, var, var

; winmdroot.Foundation.BOOL TerminateJobObject(winmdroot.Foundation.HANDLE hJob, uint uExitCode)
#cfunc global TerminateJobObject "TerminateJobObject" intptr, int

; winmdroot.Foundation.BOOL TerminateProcess(winmdroot.Foundation.HANDLE hProcess, uint uExitCode)
#cfunc global TerminateProcess "TerminateProcess" intptr, int

; winmdroot.Foundation.BOOL TerminateThread(winmdroot.Foundation.HANDLE hThread, uint dwExitCode)
#cfunc global TerminateThread "TerminateThread" intptr, int

; winmdroot.Foundation.BOOL Thread32First(winmdroot.Foundation.HANDLE hSnapshot, winmdroot.System.Diagnostics.ToolHelp.THREADENTRY32* lpte)
#cfunc global Thread32First "Thread32First" intptr, var

; winmdroot.Foundation.BOOL Thread32Next(winmdroot.Foundation.HANDLE hSnapshot, winmdroot.System.Diagnostics.ToolHelp.THREADENTRY32* lpte)
#cfunc global Thread32Next "Thread32Next" intptr, var

; uint TlsAlloc()
#cfunc global TlsAlloc "TlsAlloc"

; winmdroot.Foundation.BOOL TlsFree(uint dwTlsIndex)
#cfunc global TlsFree "TlsFree" int

; void* TlsGetValue(uint dwTlsIndex)
#cfunc global TlsGetValue "TlsGetValue" int

; winmdroot.Foundation.BOOL TlsSetValue(uint dwTlsIndex, [Optional] void* lpTlsValue)
#cfunc global TlsSetValue "TlsSetValue" int, intptr

; winmdroot.Foundation.BOOL Toolhelp32ReadProcessMemory(uint th32ProcessID, void* lpBaseAddress, void* lpBuffer, nuint cbRead, nuint* lpNumberOfBytesRead)
#cfunc global Toolhelp32ReadProcessMemory "Toolhelp32ReadProcessMemory" int, intptr, intptr, int, var

; winmdroot.Foundation.BOOL TransactNamedPipe(winmdroot.Foundation.HANDLE hNamedPipe, [Optional] void* lpInBuffer, uint nInBufferSize, [Optional] void* lpOutBuffer, uint nOutBufferSize, uint* lpBytesRead, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped)
#cfunc global TransactNamedPipe "TransactNamedPipe" intptr, intptr, int, intptr, int, var, var

; winmdroot.Foundation.BOOL TransmitCommChar(winmdroot.Foundation.HANDLE hFile, winmdroot.Foundation.CHAR cChar)
#cfunc global TransmitCommChar "TransmitCommChar" intptr, int

; winmdroot.Foundation.BOOL TrySubmitThreadpoolCallback(delegate *unmanaged[Stdcall]<global::Windows.Win32.System.Threading.PTP_CALLBACK_INSTANCE,void*,void> pfns, [Optional] void* pv, [Optional] winmdroot.System.Threading.TP_CALLBACK_ENVIRON_V3* pcbe)
#cfunc global TrySubmitThreadpoolCallback "TrySubmitThreadpoolCallback" int, intptr, var

; winmdroot.Foundation.BOOL TzSpecificLocalTimeToSystemTime([Optional] winmdroot.System.Time.TIME_ZONE_INFORMATION* lpTimeZoneInformation, winmdroot.Foundation.SYSTEMTIME* lpLocalTime, winmdroot.Foundation.SYSTEMTIME* lpUniversalTime)
#cfunc global TzSpecificLocalTimeToSystemTime "TzSpecificLocalTimeToSystemTime" var, var, var

; winmdroot.Foundation.BOOL UmsThreadYield(void* SchedulerParam)
#cfunc global UmsThreadYield "UmsThreadYield" intptr

; winmdroot.Foundation.BOOL UnlockFile(winmdroot.Foundation.HANDLE hFile, uint dwFileOffsetLow, uint dwFileOffsetHigh, uint nNumberOfBytesToUnlockLow, uint nNumberOfBytesToUnlockHigh)
#cfunc global UnlockFile "UnlockFile" intptr, int, int, int, int

; winmdroot.Foundation.BOOL UnlockFileEx(winmdroot.Foundation.HANDLE hFile, uint dwReserved, uint nNumberOfBytesToUnlockLow, uint nNumberOfBytesToUnlockHigh, global::System.Threading.NativeOverlapped* lpOverlapped)
#cfunc global UnlockFileEx "UnlockFileEx" intptr, int, int, int, var

; winmdroot.Foundation.BOOL UnmapViewOfFile(winmdroot.System.Memory.MEMORY_MAPPED_VIEW_ADDRESS lpBaseAddress)
#cfunc global UnmapViewOfFile "UnmapViewOfFile" int

; winmdroot.Foundation.HRESULT UnregisterApplicationRecoveryCallback()
#cfunc global UnregisterApplicationRecoveryCallback "UnregisterApplicationRecoveryCallback"

; winmdroot.Foundation.HRESULT UnregisterApplicationRestart()
#cfunc global UnregisterApplicationRestart "UnregisterApplicationRestart"

; winmdroot.Foundation.BOOL UnregisterBadMemoryNotification(void* RegistrationHandle)
#cfunc global UnregisterBadMemoryNotification "UnregisterBadMemoryNotification" intptr

; winmdroot.Foundation.BOOL UnregisterWait(winmdroot.Foundation.HANDLE WaitHandle)
#cfunc global UnregisterWait "UnregisterWait" intptr

; winmdroot.Foundation.BOOL UnregisterWaitEx(winmdroot.Foundation.HANDLE WaitHandle, winmdroot.Foundation.HANDLE CompletionEvent)
#cfunc global UnregisterWaitEx "UnregisterWaitEx" intptr, intptr

; winmdroot.Foundation.BOOL UnregisterWaitUntilOOBECompleted(void* WaitHandle)
#cfunc global UnregisterWaitUntilOOBECompleted "UnregisterWaitUntilOOBECompleted" intptr

; winmdroot.Foundation.BOOL UpdateCalendarDayOfWeek(winmdroot.Globalization.CALDATETIME* lpCalDateTime)
#cfunc global UpdateCalendarDayOfWeek "UpdateCalendarDayOfWeek" var

; winmdroot.Foundation.BOOL UpdateResource(winmdroot.Foundation.HANDLE hUpdate, winmdroot.Foundation.PCWSTR lpType, winmdroot.Foundation.PCWSTR lpName, ushort wLanguage, [Optional] void* lpData, uint cb)
#cfunc global UpdateResourceW "UpdateResourceW" intptr, wstr, wstr, int, intptr, int

; uint VerLanguageNameW(uint wLang, winmdroot.Foundation.PWSTR szLang, uint cchLang)
#cfunc global VerLanguageNameW "VerLanguageNameW" int, wstr, int

; winmdroot.Foundation.BOOL VerifyScripts(uint dwFlags, winmdroot.Foundation.PCWSTR lpLocaleScripts, int cchLocaleScripts, winmdroot.Foundation.PCWSTR lpTestScripts, int cchTestScripts)
#cfunc global VerifyScripts "VerifyScripts" int, wstr, int, wstr, int

; winmdroot.Foundation.BOOL VerifyVersionInfo(winmdroot.System.SystemInformation.OSVERSIONINFOEXW* lpVersionInformation, winmdroot.System.SystemInformation.VER_FLAGS dwTypeMask, ulong dwlConditionMask)
#cfunc global VerifyVersionInfoW "VerifyVersionInfoW" var, int, int64

; void* VirtualAlloc([Optional] void* lpAddress, nuint dwSize, winmdroot.System.Memory.VIRTUAL_ALLOCATION_TYPE flAllocationType, winmdroot.System.Memory.PAGE_PROTECTION_FLAGS flProtect)
#cfunc global VirtualAlloc "VirtualAlloc" intptr, int, int, int

; void* VirtualAllocEx(winmdroot.Foundation.HANDLE hProcess, [Optional] void* lpAddress, nuint dwSize, winmdroot.System.Memory.VIRTUAL_ALLOCATION_TYPE flAllocationType, winmdroot.System.Memory.PAGE_PROTECTION_FLAGS flProtect)
#cfunc global VirtualAllocEx "VirtualAllocEx" intptr, intptr, int, int, int

; void* VirtualAllocExNuma(winmdroot.Foundation.HANDLE hProcess, [Optional] void* lpAddress, nuint dwSize, winmdroot.System.Memory.VIRTUAL_ALLOCATION_TYPE flAllocationType, uint flProtect, uint nndPreferred)
#cfunc global VirtualAllocExNuma "VirtualAllocExNuma" intptr, intptr, int, int, int, int

; winmdroot.Foundation.BOOL VirtualFree(void* lpAddress, nuint dwSize, winmdroot.System.Memory.VIRTUAL_FREE_TYPE dwFreeType)
#cfunc global VirtualFree "VirtualFree" intptr, int, int

; winmdroot.Foundation.BOOL VirtualFreeEx(winmdroot.Foundation.HANDLE hProcess, void* lpAddress, nuint dwSize, winmdroot.System.Memory.VIRTUAL_FREE_TYPE dwFreeType)
#cfunc global VirtualFreeEx "VirtualFreeEx" intptr, intptr, int, int

; winmdroot.Foundation.BOOL VirtualLock(void* lpAddress, nuint dwSize)
#cfunc global VirtualLock "VirtualLock" intptr, int

; winmdroot.Foundation.BOOL VirtualProtect(void* lpAddress, nuint dwSize, winmdroot.System.Memory.PAGE_PROTECTION_FLAGS flNewProtect, winmdroot.System.Memory.PAGE_PROTECTION_FLAGS* lpflOldProtect)
#cfunc global VirtualProtect "VirtualProtect" intptr, int, int, var

; winmdroot.Foundation.BOOL VirtualProtectEx(winmdroot.Foundation.HANDLE hProcess, void* lpAddress, nuint dwSize, winmdroot.System.Memory.PAGE_PROTECTION_FLAGS flNewProtect, winmdroot.System.Memory.PAGE_PROTECTION_FLAGS* lpflOldProtect)
#cfunc global VirtualProtectEx "VirtualProtectEx" intptr, intptr, int, int, var

; winmdroot.Foundation.BOOL VirtualUnlock(void* lpAddress, nuint dwSize)
#cfunc global VirtualUnlock "VirtualUnlock" intptr, int

; uint WTSGetActiveConsoleSessionId()
#cfunc global WTSGetActiveConsoleSessionId "WTSGetActiveConsoleSessionId"

; winmdroot.Foundation.BOOL WaitCommEvent(winmdroot.Foundation.HANDLE hFile, winmdroot.Devices.Communication.COMM_EVENT_MASK* lpEvtMask, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped)
#cfunc global WaitCommEvent "WaitCommEvent" intptr, var, var

; winmdroot.Foundation.BOOL WaitForDebugEvent(winmdroot.System.Diagnostics.Debug.DEBUG_EVENT* lpDebugEvent, uint dwMilliseconds)
#cfunc global WaitForDebugEvent "WaitForDebugEvent" var, int

; winmdroot.Foundation.WAIT_EVENT WaitForMultipleObjects(uint nCount, winmdroot.Foundation.HANDLE* lpHandles, winmdroot.Foundation.BOOL bWaitAll, uint dwMilliseconds)
#cfunc global WaitForMultipleObjects "WaitForMultipleObjects" int, intptr, int, int

; winmdroot.Foundation.WAIT_EVENT WaitForMultipleObjectsEx(uint nCount, winmdroot.Foundation.HANDLE* lpHandles, winmdroot.Foundation.BOOL bWaitAll, uint dwMilliseconds, winmdroot.Foundation.BOOL bAlertable)
#cfunc global WaitForMultipleObjectsEx "WaitForMultipleObjectsEx" int, intptr, int, int, int

; winmdroot.Foundation.WAIT_EVENT WaitForSingleObject(winmdroot.Foundation.HANDLE hHandle, uint dwMilliseconds)
#cfunc global WaitForSingleObject "WaitForSingleObject" intptr, int

; winmdroot.Foundation.WAIT_EVENT WaitForSingleObjectEx(winmdroot.Foundation.HANDLE hHandle, uint dwMilliseconds, winmdroot.Foundation.BOOL bAlertable)
#cfunc global WaitForSingleObjectEx "WaitForSingleObjectEx" intptr, int, int

; winmdroot.Foundation.BOOL WaitNamedPipeW(winmdroot.Foundation.PCWSTR lpNamedPipeName, uint nTimeOut)
#cfunc global WaitNamedPipeW "WaitNamedPipeW" wstr, int

; winmdroot.Foundation.HRESULT WerGetFlags(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.ErrorReporting.WER_FAULT_REPORTING* pdwFlags)
#cfunc global WerGetFlags "WerGetFlags" intptr, var

; winmdroot.Foundation.HRESULT WerRegisterAdditionalProcess(uint processId, uint captureExtraInfoForThreadId)
#cfunc global WerRegisterAdditionalProcess "WerRegisterAdditionalProcess" int, int

; winmdroot.Foundation.HRESULT WerRegisterAppLocalDump(winmdroot.Foundation.PCWSTR localAppDataRelativePath)
#cfunc global WerRegisterAppLocalDump "WerRegisterAppLocalDump" wstr

; winmdroot.Foundation.HRESULT WerRegisterCustomMetadata(winmdroot.Foundation.PCWSTR key, winmdroot.Foundation.PCWSTR value)
#cfunc global WerRegisterCustomMetadata "WerRegisterCustomMetadata" wstr, wstr

; winmdroot.Foundation.HRESULT WerRegisterExcludedMemoryBlock(void* address, uint size)
#cfunc global WerRegisterExcludedMemoryBlock "WerRegisterExcludedMemoryBlock" intptr, int

; winmdroot.Foundation.HRESULT WerRegisterFile(winmdroot.Foundation.PCWSTR pwzFile, winmdroot.System.ErrorReporting.WER_REGISTER_FILE_TYPE regFileType, winmdroot.System.ErrorReporting.WER_FILE dwFlags)
#cfunc global WerRegisterFile "WerRegisterFile" wstr, int, int

; winmdroot.Foundation.HRESULT WerRegisterMemoryBlock(void* pvAddress, uint dwSize)
#cfunc global WerRegisterMemoryBlock "WerRegisterMemoryBlock" intptr, int

; winmdroot.Foundation.HRESULT WerRegisterRuntimeExceptionModule(winmdroot.Foundation.PCWSTR pwszOutOfProcessCallbackDll, void* pContext)
#cfunc global WerRegisterRuntimeExceptionModule "WerRegisterRuntimeExceptionModule" wstr, intptr

; winmdroot.Foundation.HRESULT WerSetFlags(winmdroot.System.ErrorReporting.WER_FAULT_REPORTING dwFlags)
#cfunc global WerSetFlags "WerSetFlags" int

; winmdroot.Foundation.HRESULT WerUnregisterAdditionalProcess(uint processId)
#cfunc global WerUnregisterAdditionalProcess "WerUnregisterAdditionalProcess" int

; winmdroot.Foundation.HRESULT WerUnregisterAppLocalDump()
#cfunc global WerUnregisterAppLocalDump "WerUnregisterAppLocalDump"

; winmdroot.Foundation.HRESULT WerUnregisterCustomMetadata(winmdroot.Foundation.PCWSTR key)
#cfunc global WerUnregisterCustomMetadata "WerUnregisterCustomMetadata" wstr

; winmdroot.Foundation.HRESULT WerUnregisterExcludedMemoryBlock(void* address)
#cfunc global WerUnregisterExcludedMemoryBlock "WerUnregisterExcludedMemoryBlock" intptr

; winmdroot.Foundation.HRESULT WerUnregisterFile(winmdroot.Foundation.PCWSTR pwzFilePath)
#cfunc global WerUnregisterFile "WerUnregisterFile" wstr

; winmdroot.Foundation.HRESULT WerUnregisterMemoryBlock(void* pvAddress)
#cfunc global WerUnregisterMemoryBlock "WerUnregisterMemoryBlock" intptr

; winmdroot.Foundation.HRESULT WerUnregisterRuntimeExceptionModule(winmdroot.Foundation.PCWSTR pwszOutOfProcessCallbackDll, void* pContext)
#cfunc global WerUnregisterRuntimeExceptionModule "WerUnregisterRuntimeExceptionModule" wstr, intptr

; int WideCharToMultiByte(uint CodePage, uint dwFlags, winmdroot.Foundation.PCWSTR lpWideCharStr, int cchWideChar, winmdroot.Foundation.PSTR lpMultiByteStr, int cbMultiByte, winmdroot.Foundation.PCSTR lpDefaultChar, [Optional] winmdroot.Foundation.BOOL* lpUsedDefaultChar)
#cfunc global WideCharToMultiByte "WideCharToMultiByte" int, int, wstr, int, str, int, str, var

; uint WinExec(winmdroot.Foundation.PCSTR lpCmdLine, uint uCmdShow)
#cfunc global WinExec "WinExec" str, int

; winmdroot.Foundation.BOOL WriteConsole(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.Foundation.PCWSTR lpBuffer, uint nNumberOfCharsToWrite, [Optional] uint* lpNumberOfCharsWritten, [Optional] void* lpReserved)
#cfunc global WriteConsoleW "WriteConsoleW" intptr, wstr, int, var, intptr

; winmdroot.Foundation.BOOL WriteConsoleInput(winmdroot.Foundation.HANDLE hConsoleInput, winmdroot.System.Console.INPUT_RECORD* lpBuffer, uint nLength, uint* lpNumberOfEventsWritten)
#cfunc global WriteConsoleInputW "WriteConsoleInputW" intptr, var, int, var

; winmdroot.Foundation.BOOL WriteConsoleOutput(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.System.Console.CHAR_INFO* lpBuffer, winmdroot.System.Console.COORD dwBufferSize, winmdroot.System.Console.COORD dwBufferCoord, winmdroot.System.Console.SMALL_RECT* lpWriteRegion)
#cfunc global WriteConsoleOutputW "WriteConsoleOutputW" intptr, var, var, var, var

; winmdroot.Foundation.BOOL WriteConsoleOutputAttribute(winmdroot.Foundation.HANDLE hConsoleOutput, ushort* lpAttribute, uint nLength, winmdroot.System.Console.COORD dwWriteCoord, uint* lpNumberOfAttrsWritten)
#cfunc global WriteConsoleOutputAttribute "WriteConsoleOutputAttribute" intptr, var, int, var, var

; winmdroot.Foundation.BOOL WriteConsoleOutputCharacter(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.Foundation.PCWSTR lpCharacter, uint nLength, winmdroot.System.Console.COORD dwWriteCoord, uint* lpNumberOfCharsWritten)
#cfunc global WriteConsoleOutputCharacterW "WriteConsoleOutputCharacterW" intptr, wstr, int, var, var

; winmdroot.Foundation.BOOL WriteFile(winmdroot.Foundation.HANDLE hFile, [Optional] byte* lpBuffer, uint nNumberOfBytesToWrite, [Optional] uint* lpNumberOfBytesWritten, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped)
#cfunc global WriteFile "WriteFile" intptr, var, int, var, var

; winmdroot.Foundation.BOOL WriteFileEx(winmdroot.Foundation.HANDLE hFile, [Optional] byte* lpBuffer, uint nNumberOfBytesToWrite, global::System.Threading.NativeOverlapped* lpOverlapped, delegate *unmanaged[Stdcall]<uint,uint,global::System.Threading.NativeOverlapped*,void> lpCompletionRoutine)
#cfunc global WriteFileEx "WriteFileEx" intptr, var, int, var, int

; winmdroot.Foundation.BOOL WriteFileGather(winmdroot.Foundation.HANDLE hFile, winmdroot.Storage.FileSystem.FILE_SEGMENT_ELEMENT* aSegmentArray, uint nNumberOfBytesToWrite, [Optional] uint* lpReserved, global::System.Threading.NativeOverlapped* lpOverlapped)
#cfunc global WriteFileGather "WriteFileGather" intptr, var, int, var, var

; winmdroot.Foundation.BOOL WritePrivateProfileSection(winmdroot.Foundation.PCWSTR lpAppName, winmdroot.Foundation.PCWSTR lpString, winmdroot.Foundation.PCWSTR lpFileName)
#cfunc global WritePrivateProfileSectionW "WritePrivateProfileSectionW" wstr, wstr, wstr

; winmdroot.Foundation.BOOL WritePrivateProfileString(winmdroot.Foundation.PCWSTR lpAppName, winmdroot.Foundation.PCWSTR lpKeyName, winmdroot.Foundation.PCWSTR lpString, winmdroot.Foundation.PCWSTR lpFileName)
#cfunc global WritePrivateProfileStringW "WritePrivateProfileStringW" wstr, wstr, wstr, wstr

; winmdroot.Foundation.BOOL WritePrivateProfileStruct(winmdroot.Foundation.PCWSTR lpszSection, winmdroot.Foundation.PCWSTR lpszKey, [Optional] void* lpStruct, uint uSizeStruct, winmdroot.Foundation.PCWSTR szFile)
#cfunc global WritePrivateProfileStructW "WritePrivateProfileStructW" wstr, wstr, intptr, int, wstr

; winmdroot.Foundation.BOOL WriteProcessMemory(winmdroot.Foundation.HANDLE hProcess, void* lpBaseAddress, void* lpBuffer, nuint nSize, [Optional] nuint* lpNumberOfBytesWritten)
#cfunc global WriteProcessMemory "WriteProcessMemory" intptr, intptr, intptr, int, var

; winmdroot.Foundation.BOOL WriteProfileSection(winmdroot.Foundation.PCWSTR lpAppName, winmdroot.Foundation.PCWSTR lpString)
#cfunc global WriteProfileSectionW "WriteProfileSectionW" wstr, wstr

; winmdroot.Foundation.BOOL WriteProfileString(winmdroot.Foundation.PCWSTR lpAppName, winmdroot.Foundation.PCWSTR lpKeyName, winmdroot.Foundation.PCWSTR lpString)
#cfunc global WriteProfileStringW "WriteProfileStringW" wstr, wstr, wstr

; uint WriteTapemark(winmdroot.Foundation.HANDLE hDevice, winmdroot.Storage.FileSystem.TAPEMARK_TYPE dwTapemarkType, uint dwTapemarkCount, winmdroot.Foundation.BOOL bImmediate)
#cfunc global WriteTapemark "WriteTapemark" intptr, int, int, int

; winmdroot.Foundation.BOOL ZombifyActCtx(winmdroot.Foundation.HANDLE hActCtx)
#cfunc global ZombifyActCtx "ZombifyActCtx" intptr

; winmdroot.Foundation.PWSTR lstrcatW(winmdroot.Foundation.PWSTR lpString1, winmdroot.Foundation.PCWSTR lpString2)
#cfunc global lstrcatW "lstrcatW" wstr, wstr

; int lstrcmpW(winmdroot.Foundation.PCWSTR lpString1, winmdroot.Foundation.PCWSTR lpString2)
#cfunc global lstrcmpW "lstrcmpW" wstr, wstr

; int lstrcmpiW(winmdroot.Foundation.PCWSTR lpString1, winmdroot.Foundation.PCWSTR lpString2)
#cfunc global lstrcmpiW "lstrcmpiW" wstr, wstr

; winmdroot.Foundation.PWSTR lstrcpyW(winmdroot.Foundation.PWSTR lpString1, winmdroot.Foundation.PCWSTR lpString2)
#cfunc global lstrcpyW "lstrcpyW" wstr, wstr

; winmdroot.Foundation.PWSTR lstrcpynW(winmdroot.Foundation.PWSTR lpString1, winmdroot.Foundation.PCWSTR lpString2, int iMaxLength)
#cfunc global lstrcpynW "lstrcpynW" wstr, wstr, int

; int lstrlenW(winmdroot.Foundation.PCWSTR lpString)
#cfunc global lstrlenW "lstrlenW" wstr

#endif
