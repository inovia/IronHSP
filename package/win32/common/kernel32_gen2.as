; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    kernel32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __kernel32_gen2_as__
#define __kernel32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "kernel32.dll"
; winmdroot.Foundation.BOOL CloseHandle(winmdroot.Foundation.HANDLE hObject)
#cfunc CloseHandle "CloseHandle" intptr

; winmdroot.Foundation.BOOL ActivateActCtx(winmdroot.Foundation.HANDLE hActCtx, nuint* lpCookie)
#cfunc ActivateActCtx "ActivateActCtx" intptr, var

; ushort AddAtom(winmdroot.Foundation.PCWSTR lpString)
#cfunc AddAtomW "AddAtomW" wstr

; winmdroot.Foundation.BOOL AddConsoleAlias(winmdroot.Foundation.PWSTR Source, winmdroot.Foundation.PWSTR Target, winmdroot.Foundation.PWSTR ExeName)
#cfunc AddConsoleAliasW "AddConsoleAliasW" wstr, wstr, wstr

; winmdroot.Foundation.BOOL AddIntegrityLabelToBoundaryDescriptor(winmdroot.Foundation.HANDLE* BoundaryDescriptor, winmdroot.Security.PSID IntegrityLabel)
#cfunc AddIntegrityLabelToBoundaryDescriptor "AddIntegrityLabelToBoundaryDescriptor" intptr, int

; void AddRefActCtx(winmdroot.Foundation.HANDLE hActCtx)
#func AddRefActCtx "AddRefActCtx" intptr

; winmdroot.Foundation.BOOL AddResourceAttributeAce(winmdroot.Security.ACL* pAcl, winmdroot.Security.ACE_REVISION dwAceRevision, winmdroot.Security.ACE_FLAGS AceFlags, uint AccessMask, winmdroot.Security.PSID pSid, winmdroot.Security.CLAIM_SECURITY_ATTRIBUTES_INFORMATION* pAttributeInfo, uint* pReturnLength)
#cfunc AddResourceAttributeAce "AddResourceAttributeAce" var, int, int, int, int, var, var

; winmdroot.Foundation.BOOL AddSIDToBoundaryDescriptor(winmdroot.Foundation.HANDLE* BoundaryDescriptor, winmdroot.Security.PSID RequiredSid)
#cfunc AddSIDToBoundaryDescriptor "AddSIDToBoundaryDescriptor" intptr, int

; winmdroot.Foundation.BOOL AddScopedPolicyIDAce(winmdroot.Security.ACL* pAcl, winmdroot.Security.ACE_REVISION dwAceRevision, winmdroot.Security.ACE_FLAGS AceFlags, uint AccessMask, winmdroot.Security.PSID pSid)
#cfunc AddScopedPolicyIDAce "AddScopedPolicyIDAce" var, int, int, int, int

; winmdroot.Foundation.BOOL AddSecureMemoryCacheCallback(delegate *unmanaged[Stdcall]<void*,nuint,global::Windows.Win32.Foundation.BOOLEAN> pfnCallBack)
#cfunc AddSecureMemoryCacheCallback "AddSecureMemoryCacheCallback" int

; winmdroot.Foundation.BOOL AdjustCalendarDate(winmdroot.Globalization.CALDATETIME* lpCalDateTime, winmdroot.Globalization.CALDATETIME_DATEUNIT calUnit, int amount)
#cfunc AdjustCalendarDate "AdjustCalendarDate" var, int, int

; winmdroot.Foundation.BOOL AllocConsole()
#cfunc AllocConsole "AllocConsole"

; winmdroot.Foundation.BOOL AllocateUserPhysicalPages(winmdroot.Foundation.HANDLE hProcess, nuint* NumberOfPages, nuint* PageArray)
#cfunc AllocateUserPhysicalPages "AllocateUserPhysicalPages" intptr, var, var

; winmdroot.Foundation.BOOL AllocateUserPhysicalPagesNuma(winmdroot.Foundation.HANDLE hProcess, nuint* NumberOfPages, nuint* PageArray, uint nndPreferred)
#cfunc AllocateUserPhysicalPagesNuma "AllocateUserPhysicalPagesNuma" intptr, var, var, int

; void ApplicationRecoveryFinished(winmdroot.Foundation.BOOL bSuccess)
#func ApplicationRecoveryFinished "ApplicationRecoveryFinished" int

; winmdroot.Foundation.HRESULT ApplicationRecoveryInProgress(winmdroot.Foundation.BOOL* pbCancelled)
#cfunc ApplicationRecoveryInProgress "ApplicationRecoveryInProgress" var

; winmdroot.Foundation.BOOL AreFileApisANSI()
#cfunc AreFileApisANSI "AreFileApisANSI"

; winmdroot.Foundation.BOOL AssignProcessToJobObject(winmdroot.Foundation.HANDLE hJob, winmdroot.Foundation.HANDLE hProcess)
#cfunc AssignProcessToJobObject "AssignProcessToJobObject" intptr, intptr

; winmdroot.Foundation.BOOL AttachConsole(uint dwProcessId)
#cfunc AttachConsole "AttachConsole" int

; winmdroot.Foundation.BOOL BackupRead(winmdroot.Foundation.HANDLE hFile, byte* lpBuffer, uint nNumberOfBytesToRead, uint* lpNumberOfBytesRead, winmdroot.Foundation.BOOL bAbort, winmdroot.Foundation.BOOL bProcessSecurity, void** lpContext)
#cfunc BackupRead "BackupRead" intptr, var, int, var, int, int, var

; winmdroot.Foundation.BOOL BackupSeek(winmdroot.Foundation.HANDLE hFile, uint dwLowBytesToSeek, uint dwHighBytesToSeek, uint* lpdwLowByteSeeked, uint* lpdwHighByteSeeked, void** lpContext)
#cfunc BackupSeek "BackupSeek" intptr, int, int, var, var, var

; winmdroot.Foundation.BOOL BackupWrite(winmdroot.Foundation.HANDLE hFile, byte* lpBuffer, uint nNumberOfBytesToWrite, uint* lpNumberOfBytesWritten, winmdroot.Foundation.BOOL bAbort, winmdroot.Foundation.BOOL bProcessSecurity, void** lpContext)
#cfunc BackupWrite "BackupWrite" intptr, var, int, var, int, int, var

; winmdroot.Foundation.BOOL Beep(uint dwFreq, uint dwDuration)
#cfunc Beep "Beep" int, int

; winmdroot.Foundation.HANDLE BeginUpdateResource(winmdroot.Foundation.PCWSTR pFileName, winmdroot.Foundation.BOOL bDeleteExistingResources)
#cfunc BeginUpdateResourceW "BeginUpdateResourceW" wstr, int

; winmdroot.Foundation.BOOL BindIoCompletionCallback(winmdroot.Foundation.HANDLE FileHandle, delegate *unmanaged[Stdcall]<uint,uint,global::System.Threading.NativeOverlapped*,void> Function, uint Flags)
#cfunc BindIoCompletionCallback "BindIoCompletionCallback" intptr, int, int

; winmdroot.Foundation.BOOL BuildCommDCBA(winmdroot.Foundation.PCSTR lpDef, winmdroot.Devices.Communication.DCB* lpDCB)
#cfunc BuildCommDCBA "BuildCommDCBA" str, var

; winmdroot.Foundation.BOOL BuildCommDCBAndTimeouts(winmdroot.Foundation.PCWSTR lpDef, winmdroot.Devices.Communication.DCB* lpDCB, winmdroot.Devices.Communication.COMMTIMEOUTS* lpCommTimeouts)
#cfunc BuildCommDCBAndTimeoutsW "BuildCommDCBAndTimeoutsW" wstr, var, var

; winmdroot.Foundation.BOOL BuildCommDCBW(winmdroot.Foundation.PCWSTR lpDef, winmdroot.Devices.Communication.DCB* lpDCB)
#cfunc BuildCommDCBW "BuildCommDCBW" wstr, var

; winmdroot.Foundation.BOOL CallNamedPipeW(winmdroot.Foundation.PCWSTR lpNamedPipeName, [Optional] void* lpInBuffer, uint nInBufferSize, [Optional] void* lpOutBuffer, uint nOutBufferSize, uint* lpBytesRead, uint nTimeOut)
#cfunc CallNamedPipeW "CallNamedPipeW" wstr, intptr, int, intptr, int, var, int

; winmdroot.Foundation.BOOL CallbackMayRunLong(winmdroot.System.Threading.PTP_CALLBACK_INSTANCE pci)
#cfunc CallbackMayRunLong "CallbackMayRunLong" intptr

; winmdroot.Foundation.BOOL CancelDeviceWakeupRequest(winmdroot.Foundation.HANDLE hDevice)
#cfunc CancelDeviceWakeupRequest "CancelDeviceWakeupRequest" intptr

; winmdroot.Foundation.BOOL CancelIo(winmdroot.Foundation.HANDLE hFile)
#cfunc CancelIo "CancelIo" intptr

; winmdroot.Foundation.BOOL CancelIoEx(winmdroot.Foundation.HANDLE hFile, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped)
#cfunc CancelIoEx "CancelIoEx" intptr, var

; winmdroot.Foundation.BOOL CancelSynchronousIo(winmdroot.Foundation.HANDLE hThread)
#cfunc CancelSynchronousIo "CancelSynchronousIo" intptr

; winmdroot.Foundation.BOOL CancelTimerQueueTimer(winmdroot.Foundation.HANDLE TimerQueue, winmdroot.Foundation.HANDLE Timer)
#cfunc CancelTimerQueueTimer "CancelTimerQueueTimer" intptr, intptr

; winmdroot.Foundation.BOOL CancelWaitableTimer(winmdroot.Foundation.HANDLE hTimer)
#cfunc CancelWaitableTimer "CancelWaitableTimer" intptr

; winmdroot.Foundation.BOOL ChangeTimerQueueTimer(winmdroot.Foundation.HANDLE TimerQueue, winmdroot.Foundation.HANDLE Timer, uint DueTime, uint Period)
#cfunc ChangeTimerQueueTimer "ChangeTimerQueueTimer" intptr, intptr, int, int

; winmdroot.Foundation.BOOL CheckNameLegalDOS8Dot3A(winmdroot.Foundation.PCSTR lpName, winmdroot.Foundation.PSTR lpOemName, uint OemNameSize, [Optional] winmdroot.Foundation.BOOL* pbNameContainsSpaces, winmdroot.Foundation.BOOL* pbNameLegal)
#cfunc CheckNameLegalDOS8Dot3A "CheckNameLegalDOS8Dot3A" str, str, int, var, var

; winmdroot.Foundation.BOOL CheckNameLegalDOS8Dot3W(winmdroot.Foundation.PCWSTR lpName, winmdroot.Foundation.PSTR lpOemName, uint OemNameSize, [Optional] winmdroot.Foundation.BOOL* pbNameContainsSpaces, winmdroot.Foundation.BOOL* pbNameLegal)
#cfunc CheckNameLegalDOS8Dot3W "CheckNameLegalDOS8Dot3W" wstr, str, int, var, var

; winmdroot.Foundation.BOOL CheckRemoteDebuggerPresent(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.BOOL* pbDebuggerPresent)
#cfunc CheckRemoteDebuggerPresent "CheckRemoteDebuggerPresent" intptr, var

; winmdroot.Foundation.BOOL CheckTokenCapability(winmdroot.Foundation.HANDLE TokenHandle, winmdroot.Security.PSID CapabilitySidToCheck, winmdroot.Foundation.BOOL* HasCapability)
#cfunc CheckTokenCapability "CheckTokenCapability" intptr, int, var

; winmdroot.Foundation.BOOL CheckTokenMembershipEx(winmdroot.Foundation.HANDLE TokenHandle, winmdroot.Security.PSID SidToCheck, uint Flags, winmdroot.Foundation.BOOL* IsMember)
#cfunc CheckTokenMembershipEx "CheckTokenMembershipEx" intptr, int, int, var

; winmdroot.Foundation.BOOL ClearCommBreak(winmdroot.Foundation.HANDLE hFile)
#cfunc ClearCommBreak "ClearCommBreak" intptr

; winmdroot.Foundation.BOOL ClearCommError(winmdroot.Foundation.HANDLE hFile, [Optional] winmdroot.Devices.Communication.CLEAR_COMM_ERROR_FLAGS* lpErrors, [Optional] winmdroot.Devices.Communication.COMSTAT* lpStat)
#cfunc ClearCommError "ClearCommError" intptr, var, var

; winmdroot.Foundation.BOOLEAN ClosePrivateNamespace(winmdroot.Foundation.HANDLE Handle, uint Flags)
#cfunc ClosePrivateNamespace "ClosePrivateNamespace" intptr, int

; void ClosePseudoConsole(winmdroot.System.Console.HPCON hPC)
#func ClosePseudoConsole "ClosePseudoConsole" intptr

; winmdroot.Foundation.BOOL CommConfigDialog(winmdroot.Foundation.PCWSTR lpszName, winmdroot.Foundation.HWND hWnd, winmdroot.Devices.Communication.COMMCONFIG* lpCC)
#cfunc CommConfigDialogW "CommConfigDialogW" wstr, intptr, var

; int CompareFileTime(global::System.Runtime.InteropServices.ComTypes.FILETIME* lpFileTime1, global::System.Runtime.InteropServices.ComTypes.FILETIME* lpFileTime2)
#cfunc CompareFileTime "CompareFileTime" var, var

; winmdroot.Globalization.COMPARESTRING_RESULT CompareStringW(uint Locale, uint dwCmpFlags, winmdroot.Foundation.PCWSTR lpString1, int cchCount1, winmdroot.Foundation.PCWSTR lpString2, int cchCount2)
#cfunc CompareStringW "CompareStringW" int, int, wstr, int, wstr, int

; winmdroot.Globalization.COMPARESTRING_RESULT CompareStringEx(winmdroot.Foundation.PCWSTR lpLocaleName, winmdroot.Globalization.COMPARE_STRING_FLAGS dwCmpFlags, winmdroot.Foundation.PCWSTR lpString1, int cchCount1, winmdroot.Foundation.PCWSTR lpString2, int cchCount2, [Optional] winmdroot.Globalization.NLSVERSIONINFO* lpVersionInformation, [Optional] void* lpReserved, winmdroot.Foundation.LPARAM lParam)
#cfunc CompareStringEx "CompareStringEx" wstr, int, wstr, int, wstr, int, var, intptr, intptr

; winmdroot.Globalization.COMPARESTRING_RESULT CompareStringOrdinal(winmdroot.Foundation.PCWSTR lpString1, int cchCount1, winmdroot.Foundation.PCWSTR lpString2, int cchCount2, winmdroot.Foundation.BOOL bIgnoreCase)
#cfunc CompareStringOrdinal "CompareStringOrdinal" wstr, int, wstr, int, int

; winmdroot.Foundation.BOOL ConnectNamedPipe(winmdroot.Foundation.HANDLE hNamedPipe, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped)
#cfunc ConnectNamedPipe "ConnectNamedPipe" intptr, var

; winmdroot.Foundation.BOOL ContinueDebugEvent(uint dwProcessId, uint dwThreadId, winmdroot.Foundation.NTSTATUS dwContinueStatus)
#cfunc ContinueDebugEvent "ContinueDebugEvent" int, int, intptr

; winmdroot.Foundation.BOOL ConvertCalDateTimeToSystemTime(winmdroot.Globalization.CALDATETIME* lpCalDateTime, winmdroot.Foundation.SYSTEMTIME* lpSysTime)
#cfunc ConvertCalDateTimeToSystemTime "ConvertCalDateTimeToSystemTime" var, var

; uint ConvertDefaultLocale(uint Locale)
#cfunc ConvertDefaultLocale "ConvertDefaultLocale" int

; winmdroot.Foundation.BOOL ConvertFiberToThread()
#cfunc ConvertFiberToThread "ConvertFiberToThread"

; winmdroot.Foundation.BOOL ConvertSystemTimeToCalDateTime(winmdroot.Foundation.SYSTEMTIME* lpSysTime, uint calId, winmdroot.Globalization.CALDATETIME* lpCalDateTime)
#cfunc ConvertSystemTimeToCalDateTime "ConvertSystemTimeToCalDateTime" var, int, var

; void* ConvertThreadToFiber([Optional] void* lpParameter)
#cfunc ConvertThreadToFiber "ConvertThreadToFiber" intptr

; void* ConvertThreadToFiberEx([Optional] void* lpParameter, uint dwFlags)
#cfunc ConvertThreadToFiberEx "ConvertThreadToFiberEx" intptr, int

; winmdroot.Foundation.BOOL CopyFile(winmdroot.Foundation.PCWSTR lpExistingFileName, winmdroot.Foundation.PCWSTR lpNewFileName, winmdroot.Foundation.BOOL bFailIfExists)
#cfunc CopyFileW "CopyFileW" wstr, wstr, int

; winmdroot.Foundation.HRESULT CopyFile2(winmdroot.Foundation.PCWSTR pwszExistingFileName, winmdroot.Foundation.PCWSTR pwszNewFileName, [Optional] winmdroot.Storage.FileSystem.COPYFILE2_EXTENDED_PARAMETERS* pExtendedParameters)
#cfunc CopyFile2 "CopyFile2" wstr, wstr, var

; winmdroot.Foundation.BOOL CopyFileEx(winmdroot.Foundation.PCWSTR lpExistingFileName, winmdroot.Foundation.PCWSTR lpNewFileName, delegate *unmanaged[Stdcall]<long,long,long,long,uint,global::Windows.Win32.Storage.FileSystem.LPPROGRESS_ROUTINE_CALLBACK_REASON,global::Windows.Win32.Foundation.HANDLE,global::Windows.Win32.Foundation.HANDLE,void*,uint> lpProgressRoutine, [Optional] void* lpData, [Optional] winmdroot.Foundation.BOOL* pbCancel, uint dwCopyFlags)
#cfunc CopyFileExW "CopyFileExW" wstr, wstr, int, intptr, var, int

; winmdroot.Foundation.BOOL CopyFileTransacted(winmdroot.Foundation.PCWSTR lpExistingFileName, winmdroot.Foundation.PCWSTR lpNewFileName, delegate *unmanaged[Stdcall]<long,long,long,long,uint,global::Windows.Win32.Storage.FileSystem.LPPROGRESS_ROUTINE_CALLBACK_REASON,global::Windows.Win32.Foundation.HANDLE,global::Windows.Win32.Foundation.HANDLE,void*,uint> lpProgressRoutine, [Optional] void* lpData, [Optional] winmdroot.Foundation.BOOL* pbCancel, uint dwCopyFlags, winmdroot.Foundation.HANDLE hTransaction)
#cfunc CopyFileTransactedW "CopyFileTransactedW" wstr, wstr, int, intptr, var, int, intptr

; int CopyLZFile(int hfSource, int hfDest)
#cfunc CopyLZFile "CopyLZFile" int, int

; winmdroot.Foundation.BOOL FreeLibrary(winmdroot.Foundation.HMODULE hLibModule)
#cfunc FreeLibrary "FreeLibrary" intptr

; winmdroot.Foundation.HANDLE CreateActCtx(winmdroot.System.ApplicationInstallationAndServicing.ACTCTXW* pActCtx)
#cfunc CreateActCtxW "CreateActCtxW" var

; winmdroot.Foundation.HANDLE CreateBoundaryDescriptorW(winmdroot.Foundation.PCWSTR Name, uint Flags)
#cfunc CreateBoundaryDescriptorW "CreateBoundaryDescriptorW" wstr, int

; winmdroot.Foundation.HANDLE CreateConsoleScreenBuffer(uint dwDesiredAccess, uint dwShareMode, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes, uint dwFlags, [Optional] void* lpScreenBufferData)
#cfunc CreateConsoleScreenBuffer "CreateConsoleScreenBuffer" int, int, var, int, intptr

; winmdroot.Foundation.BOOL CreateDirectory(winmdroot.Foundation.PCWSTR lpPathName, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes)
#cfunc CreateDirectoryW "CreateDirectoryW" wstr, var

; winmdroot.Foundation.BOOL CreateDirectoryEx(winmdroot.Foundation.PCWSTR lpTemplateDirectory, winmdroot.Foundation.PCWSTR lpNewDirectory, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes)
#cfunc CreateDirectoryExW "CreateDirectoryExW" wstr, wstr, var

; winmdroot.Foundation.BOOL CreateDirectoryTransacted(winmdroot.Foundation.PCWSTR lpTemplateDirectory, winmdroot.Foundation.PCWSTR lpNewDirectory, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes, winmdroot.Foundation.HANDLE hTransaction)
#cfunc CreateDirectoryTransactedW "CreateDirectoryTransactedW" wstr, wstr, var, intptr

; winmdroot.Foundation.HANDLE CreateEvent([Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpEventAttributes, winmdroot.Foundation.BOOL bManualReset, winmdroot.Foundation.BOOL bInitialState, winmdroot.Foundation.PCWSTR lpName)
#cfunc CreateEventW "CreateEventW" var, int, int, wstr

; winmdroot.Foundation.HANDLE CreateEventEx([Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpEventAttributes, winmdroot.Foundation.PCWSTR lpName, winmdroot.System.Threading.CREATE_EVENT dwFlags, uint dwDesiredAccess)
#cfunc CreateEventExW "CreateEventExW" var, wstr, int, int

; void* CreateFiber(nuint dwStackSize, delegate *unmanaged[Stdcall]<void*,void> lpStartAddress, [Optional] void* lpParameter)
#cfunc CreateFiber "CreateFiber" int, int, intptr

; void* CreateFiberEx(nuint dwStackCommitSize, nuint dwStackReserveSize, uint dwFlags, delegate *unmanaged[Stdcall]<void*,void> lpStartAddress, [Optional] void* lpParameter)
#cfunc CreateFiberEx "CreateFiberEx" int, int, int, int, intptr

; winmdroot.Foundation.HANDLE CreateFile(winmdroot.Foundation.PCWSTR lpFileName, uint dwDesiredAccess, winmdroot.Storage.FileSystem.FILE_SHARE_MODE dwShareMode, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes, winmdroot.Storage.FileSystem.FILE_CREATION_DISPOSITION dwCreationDisposition, winmdroot.Storage.FileSystem.FILE_FLAGS_AND_ATTRIBUTES dwFlagsAndAttributes, winmdroot.Foundation.HANDLE hTemplateFile)
#cfunc CreateFileW "CreateFileW" wstr, int, int, var, int, int, intptr

; winmdroot.Foundation.HANDLE CreateFile2(winmdroot.Foundation.PCWSTR lpFileName, uint dwDesiredAccess, winmdroot.Storage.FileSystem.FILE_SHARE_MODE dwShareMode, winmdroot.Storage.FileSystem.FILE_CREATION_DISPOSITION dwCreationDisposition, [Optional] winmdroot.Storage.FileSystem.CREATEFILE2_EXTENDED_PARAMETERS* pCreateExParams)
#cfunc CreateFile2 "CreateFile2" wstr, int, int, int, var

; winmdroot.Foundation.HANDLE CreateFileMapping(winmdroot.Foundation.HANDLE hFile, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpFileMappingAttributes, winmdroot.System.Memory.PAGE_PROTECTION_FLAGS flProtect, uint dwMaximumSizeHigh, uint dwMaximumSizeLow, winmdroot.Foundation.PCWSTR lpName)
#cfunc CreateFileMappingW "CreateFileMappingW" intptr, var, int, int, int, wstr

; winmdroot.Foundation.HANDLE CreateFileMappingNuma(winmdroot.Foundation.HANDLE hFile, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpFileMappingAttributes, winmdroot.System.Memory.PAGE_PROTECTION_FLAGS flProtect, uint dwMaximumSizeHigh, uint dwMaximumSizeLow, winmdroot.Foundation.PCWSTR lpName, uint nndPreferred)
#cfunc CreateFileMappingNumaW "CreateFileMappingNumaW" intptr, var, int, int, int, wstr, int

; winmdroot.Foundation.HANDLE CreateFileTransacted(winmdroot.Foundation.PCWSTR lpFileName, uint dwDesiredAccess, winmdroot.Storage.FileSystem.FILE_SHARE_MODE dwShareMode, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes, winmdroot.Storage.FileSystem.FILE_CREATION_DISPOSITION dwCreationDisposition, winmdroot.Storage.FileSystem.FILE_FLAGS_AND_ATTRIBUTES dwFlagsAndAttributes, winmdroot.Foundation.HANDLE hTemplateFile, winmdroot.Foundation.HANDLE hTransaction, [Optional] winmdroot.Storage.FileSystem.TXFS_MINIVERSION* pusMiniVersion, [Optional] void* lpExtendedParameter)
#cfunc CreateFileTransactedW "CreateFileTransactedW" wstr, int, int, var, int, int, intptr, intptr, var, intptr

; winmdroot.Foundation.BOOL CreateHardLink(winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Foundation.PCWSTR lpExistingFileName, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes)
#cfunc CreateHardLinkW "CreateHardLinkW" wstr, wstr, var

; winmdroot.Foundation.BOOL CreateHardLinkTransacted(winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Foundation.PCWSTR lpExistingFileName, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes, winmdroot.Foundation.HANDLE hTransaction)
#cfunc CreateHardLinkTransactedW "CreateHardLinkTransactedW" wstr, wstr, var, intptr

; winmdroot.Foundation.HANDLE CreateIoCompletionPort(winmdroot.Foundation.HANDLE FileHandle, winmdroot.Foundation.HANDLE ExistingCompletionPort, nuint CompletionKey, uint NumberOfConcurrentThreads)
#cfunc CreateIoCompletionPort "CreateIoCompletionPort" intptr, intptr, int, int

; winmdroot.Foundation.HANDLE CreateJobObject([Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpJobAttributes, winmdroot.Foundation.PCWSTR lpName)
#cfunc CreateJobObjectW "CreateJobObjectW" var, wstr

; winmdroot.Foundation.BOOL CreateJobSet(uint NumJob, winmdroot.System.JobObjects.JOB_SET_ARRAY* UserJobSet, uint Flags)
#cfunc CreateJobSet "CreateJobSet" int, var, int

; winmdroot.Foundation.HANDLE CreateMailslot(winmdroot.Foundation.PCWSTR lpName, uint nMaxMessageSize, uint lReadTimeout, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes)
#cfunc CreateMailslotW "CreateMailslotW" wstr, int, int, var

; winmdroot.Foundation.HANDLE CreateMemoryResourceNotification(winmdroot.System.Memory.MEMORY_RESOURCE_NOTIFICATION_TYPE NotificationType)
#cfunc CreateMemoryResourceNotification "CreateMemoryResourceNotification" int

; winmdroot.Foundation.HANDLE CreateMutex([Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpMutexAttributes, winmdroot.Foundation.BOOL bInitialOwner, winmdroot.Foundation.PCWSTR lpName)
#cfunc CreateMutexW "CreateMutexW" var, int, wstr

; winmdroot.Foundation.HANDLE CreateMutexEx([Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpMutexAttributes, winmdroot.Foundation.PCWSTR lpName, uint dwFlags, uint dwDesiredAccess)
#cfunc CreateMutexExW "CreateMutexExW" var, wstr, int, int

; winmdroot.Foundation.HANDLE CreateNamedPipeW(winmdroot.Foundation.PCWSTR lpName, winmdroot.Storage.FileSystem.FILE_FLAGS_AND_ATTRIBUTES dwOpenMode, winmdroot.System.Pipes.NAMED_PIPE_MODE dwPipeMode, uint nMaxInstances, uint nOutBufferSize, uint nInBufferSize, uint nDefaultTimeOut, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes)
#cfunc CreateNamedPipeW "CreateNamedPipeW" wstr, int, int, int, int, int, int, var

; winmdroot.Foundation.BOOL CreatePipe(winmdroot.Foundation.HANDLE* hReadPipe, winmdroot.Foundation.HANDLE* hWritePipe, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpPipeAttributes, uint nSize)
#cfunc CreatePipe "CreatePipe" intptr, intptr, var, int

; winmdroot.Foundation.HANDLE CreatePrivateNamespaceW([Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpPrivateNamespaceAttributes, void* lpBoundaryDescriptor, winmdroot.Foundation.PCWSTR lpAliasPrefix)
#cfunc CreatePrivateNamespaceW "CreatePrivateNamespaceW" var, intptr, wstr

; winmdroot.Foundation.BOOL CreateProcess(winmdroot.Foundation.PCWSTR lpApplicationName, winmdroot.Foundation.PWSTR lpCommandLine, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpProcessAttributes, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpThreadAttributes, winmdroot.Foundation.BOOL bInheritHandles, winmdroot.System.Threading.PROCESS_CREATION_FLAGS dwCreationFlags, [Optional] void* lpEnvironment, winmdroot.Foundation.PCWSTR lpCurrentDirectory, winmdroot.System.Threading.STARTUPINFOW* lpStartupInfo, winmdroot.System.Threading.PROCESS_INFORMATION* lpProcessInformation)
#cfunc CreateProcessW "CreateProcessW" wstr, wstr, var, var, int, int, intptr, wstr, var, var

; winmdroot.Foundation.HRESULT CreatePseudoConsole(winmdroot.System.Console.COORD size, winmdroot.Foundation.HANDLE hInput, winmdroot.Foundation.HANDLE hOutput, uint dwFlags, winmdroot.System.Console.HPCON* phPC)
#cfunc CreatePseudoConsole "CreatePseudoConsole" var, intptr, intptr, int, intptr

; winmdroot.Foundation.HANDLE CreateRemoteThread(winmdroot.Foundation.HANDLE hProcess, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpThreadAttributes, nuint dwStackSize, delegate *unmanaged[Stdcall]<void*,uint> lpStartAddress, [Optional] void* lpParameter, uint dwCreationFlags, [Optional] uint* lpThreadId)
#cfunc CreateRemoteThread "CreateRemoteThread" intptr, var, int, int, intptr, int, var

; winmdroot.Foundation.HANDLE CreateSemaphore([Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSemaphoreAttributes, int lInitialCount, int lMaximumCount, winmdroot.Foundation.PCWSTR lpName)
#cfunc CreateSemaphoreW "CreateSemaphoreW" var, int, int, wstr

; winmdroot.Foundation.HANDLE CreateSemaphoreEx([Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSemaphoreAttributes, int lInitialCount, int lMaximumCount, winmdroot.Foundation.PCWSTR lpName, uint dwFlags, uint dwDesiredAccess)
#cfunc CreateSemaphoreExW "CreateSemaphoreExW" var, int, int, wstr, int, int

; winmdroot.Foundation.BOOLEAN CreateSymbolicLink(winmdroot.Foundation.PCWSTR lpSymlinkFileName, winmdroot.Foundation.PCWSTR lpTargetFileName, winmdroot.Storage.FileSystem.SYMBOLIC_LINK_FLAGS dwFlags)
#cfunc CreateSymbolicLinkW "CreateSymbolicLinkW" wstr, wstr, int

; winmdroot.Foundation.BOOLEAN CreateSymbolicLinkTransacted(winmdroot.Foundation.PCWSTR lpSymlinkFileName, winmdroot.Foundation.PCWSTR lpTargetFileName, winmdroot.Storage.FileSystem.SYMBOLIC_LINK_FLAGS dwFlags, winmdroot.Foundation.HANDLE hTransaction)
#cfunc CreateSymbolicLinkTransactedW "CreateSymbolicLinkTransactedW" wstr, wstr, int, intptr

; uint CreateTapePartition(winmdroot.Foundation.HANDLE hDevice, winmdroot.Storage.FileSystem.CREATE_TAPE_PARTITION_METHOD dwPartitionMethod, uint dwCount, uint dwSize)
#cfunc CreateTapePartition "CreateTapePartition" intptr, int, int, int

; winmdroot.Foundation.HANDLE CreateThread([Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpThreadAttributes, nuint dwStackSize, delegate *unmanaged[Stdcall]<void*,uint> lpStartAddress, [Optional] void* lpParameter, winmdroot.System.Threading.THREAD_CREATION_FLAGS dwCreationFlags, [Optional] uint* lpThreadId)
#cfunc CreateThread "CreateThread" var, int, int, intptr, int, var

; void CloseThreadpool(winmdroot.System.Threading.PTP_POOL ptpp)
#func CloseThreadpool "CloseThreadpool" intptr

; winmdroot.System.Threading.PTP_POOL CreateThreadpool([Optional] void* reserved)
#cfunc CreateThreadpool "CreateThreadpool" intptr

; void CloseThreadpoolCleanupGroup(winmdroot.System.Threading.PTP_CLEANUP_GROUP ptpcg)
#func CloseThreadpoolCleanupGroup "CloseThreadpoolCleanupGroup" intptr

; winmdroot.System.Threading.PTP_CLEANUP_GROUP CreateThreadpoolCleanupGroup()
#cfunc CreateThreadpoolCleanupGroup "CreateThreadpoolCleanupGroup"

; void CloseThreadpoolIo(winmdroot.System.Threading.PTP_IO pio)
#func CloseThreadpoolIo "CloseThreadpoolIo" intptr

; winmdroot.System.Threading.PTP_IO CreateThreadpoolIo(winmdroot.Foundation.HANDLE fl, delegate *unmanaged[Stdcall]<global::Windows.Win32.System.Threading.PTP_CALLBACK_INSTANCE,void*,void*,uint,nuint,global::Windows.Win32.System.Threading.PTP_IO,void> pfnio, [Optional] void* pv, [Optional] winmdroot.System.Threading.TP_CALLBACK_ENVIRON_V3* pcbe)
#cfunc CreateThreadpoolIo "CreateThreadpoolIo" intptr, int, intptr, var

; void CloseThreadpoolTimer(winmdroot.System.Threading.PTP_TIMER pti)
#func CloseThreadpoolTimer "CloseThreadpoolTimer" intptr

; winmdroot.System.Threading.PTP_TIMER CreateThreadpoolTimer(delegate *unmanaged[Stdcall]<global::Windows.Win32.System.Threading.PTP_CALLBACK_INSTANCE,void*,global::Windows.Win32.System.Threading.PTP_TIMER,void> pfnti, [Optional] void* pv, [Optional] winmdroot.System.Threading.TP_CALLBACK_ENVIRON_V3* pcbe)
#cfunc CreateThreadpoolTimer "CreateThreadpoolTimer" int, intptr, var

; void CloseThreadpoolWait(winmdroot.System.Threading.PTP_WAIT pwa)
#func CloseThreadpoolWait "CloseThreadpoolWait" intptr

; winmdroot.System.Threading.PTP_WAIT CreateThreadpoolWait(delegate *unmanaged[Stdcall]<global::Windows.Win32.System.Threading.PTP_CALLBACK_INSTANCE,void*,global::Windows.Win32.System.Threading.PTP_WAIT,uint,void> pfnwa, [Optional] void* pv, [Optional] winmdroot.System.Threading.TP_CALLBACK_ENVIRON_V3* pcbe)
#cfunc CreateThreadpoolWait "CreateThreadpoolWait" int, intptr, var

; void CloseThreadpoolWork(winmdroot.System.Threading.PTP_WORK pwk)
#func CloseThreadpoolWork "CloseThreadpoolWork" intptr

; winmdroot.System.Threading.PTP_WORK CreateThreadpoolWork(delegate *unmanaged[Stdcall]<global::Windows.Win32.System.Threading.PTP_CALLBACK_INSTANCE,void*,global::Windows.Win32.System.Threading.PTP_WORK,void> pfnwk, [Optional] void* pv, [Optional] winmdroot.System.Threading.TP_CALLBACK_ENVIRON_V3* pcbe)
#cfunc CreateThreadpoolWork "CreateThreadpoolWork" int, intptr, var

; winmdroot.Foundation.HANDLE CreateTimerQueue()
#cfunc CreateTimerQueue "CreateTimerQueue"

; winmdroot.Foundation.BOOL CreateTimerQueueTimer(winmdroot.Foundation.HANDLE* phNewTimer, winmdroot.Foundation.HANDLE TimerQueue, delegate *unmanaged[Stdcall]<void*,global::Windows.Win32.Foundation.BOOLEAN,void> Callback, [Optional] void* Parameter, uint DueTime, uint Period, winmdroot.System.Threading.WORKER_THREAD_FLAGS Flags)
#cfunc CreateTimerQueueTimer "CreateTimerQueueTimer" intptr, intptr, int, intptr, int, int, int

; winmdroot.Foundation.HANDLE CreateToolhelp32Snapshot(winmdroot.System.Diagnostics.ToolHelp.CREATE_TOOLHELP_SNAPSHOT_FLAGS dwFlags, uint th32ProcessID)
#cfunc CreateToolhelp32Snapshot "CreateToolhelp32Snapshot" int, int

; winmdroot.Foundation.BOOL CreateUmsCompletionList(void** UmsCompletionList)
#cfunc CreateUmsCompletionList "CreateUmsCompletionList" var

; winmdroot.Foundation.BOOL CreateUmsThreadContext(void** lpUmsThread)
#cfunc CreateUmsThreadContext "CreateUmsThreadContext" var

; winmdroot.Foundation.HANDLE CreateWaitableTimer([Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpTimerAttributes, winmdroot.Foundation.BOOL bManualReset, winmdroot.Foundation.PCWSTR lpTimerName)
#cfunc CreateWaitableTimerW "CreateWaitableTimerW" var, int, wstr

; winmdroot.Foundation.HANDLE CreateWaitableTimerEx([Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpTimerAttributes, winmdroot.Foundation.PCWSTR lpTimerName, uint dwFlags, uint dwDesiredAccess)
#cfunc CreateWaitableTimerExW "CreateWaitableTimerExW" var, wstr, int, int

; winmdroot.Foundation.BOOL DeactivateActCtx(uint dwFlags, nuint ulCookie)
#cfunc DeactivateActCtx "DeactivateActCtx" int, int

; winmdroot.Foundation.BOOL DebugActiveProcess(uint dwProcessId)
#cfunc DebugActiveProcess "DebugActiveProcess" int

; winmdroot.Foundation.BOOL DebugActiveProcessStop(uint dwProcessId)
#cfunc DebugActiveProcessStop "DebugActiveProcessStop" int

; void DebugBreak()
#func DebugBreak "DebugBreak"

; winmdroot.Foundation.BOOL DebugBreakProcess(winmdroot.Foundation.HANDLE Process)
#cfunc DebugBreakProcess "DebugBreakProcess" intptr

; winmdroot.Foundation.BOOL DebugSetProcessKillOnExit(winmdroot.Foundation.BOOL KillOnExit)
#cfunc DebugSetProcessKillOnExit "DebugSetProcessKillOnExit" int

; winmdroot.Foundation.BOOL DefineDosDevice(winmdroot.Storage.FileSystem.DEFINE_DOS_DEVICE_FLAGS dwFlags, winmdroot.Foundation.PCWSTR lpDeviceName, winmdroot.Foundation.PCWSTR lpTargetPath)
#cfunc DefineDosDeviceW "DefineDosDeviceW" int, wstr, wstr

; ushort DeleteAtom(ushort nAtom)
#cfunc DeleteAtom "DeleteAtom" int

; void DeleteBoundaryDescriptor(winmdroot.Foundation.HANDLE BoundaryDescriptor)
#func DeleteBoundaryDescriptor "DeleteBoundaryDescriptor" intptr

; void DeleteFiber(void* lpFiber)
#func DeleteFiber "DeleteFiber" intptr

; winmdroot.Foundation.BOOL DeleteFile(winmdroot.Foundation.PCWSTR lpFileName)
#cfunc DeleteFileW "DeleteFileW" wstr

; winmdroot.Foundation.BOOL DeleteFileTransacted(winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Foundation.HANDLE hTransaction)
#cfunc DeleteFileTransactedW "DeleteFileTransactedW" wstr, intptr

; winmdroot.Foundation.BOOL DeleteSynchronizationBarrier(winmdroot.System.Threading.SYNCHRONIZATION_BARRIER* lpBarrier)
#cfunc DeleteSynchronizationBarrier "DeleteSynchronizationBarrier" var

; winmdroot.Foundation.BOOL DeleteTimerQueue(winmdroot.Foundation.HANDLE TimerQueue)
#cfunc DeleteTimerQueue "DeleteTimerQueue" intptr

; winmdroot.Foundation.BOOL DeleteTimerQueueEx(winmdroot.Foundation.HANDLE TimerQueue, winmdroot.Foundation.HANDLE CompletionEvent)
#cfunc DeleteTimerQueueEx "DeleteTimerQueueEx" intptr, intptr

; winmdroot.Foundation.BOOL DeleteTimerQueueTimer(winmdroot.Foundation.HANDLE TimerQueue, winmdroot.Foundation.HANDLE Timer, winmdroot.Foundation.HANDLE CompletionEvent)
#cfunc DeleteTimerQueueTimer "DeleteTimerQueueTimer" intptr, intptr, intptr

; winmdroot.Foundation.BOOL DeleteUmsCompletionList(void* UmsCompletionList)
#cfunc DeleteUmsCompletionList "DeleteUmsCompletionList" intptr

; winmdroot.Foundation.BOOL DeleteUmsThreadContext(void* UmsThread)
#cfunc DeleteUmsThreadContext "DeleteUmsThreadContext" intptr

; winmdroot.Foundation.BOOL DeleteVolumeMountPoint(winmdroot.Foundation.PCWSTR lpszVolumeMountPoint)
#cfunc DeleteVolumeMountPointW "DeleteVolumeMountPointW" wstr

; winmdroot.Foundation.BOOL DequeueUmsCompletionListItems(void* UmsCompletionList, uint WaitTimeOut, void** UmsThreadList)
#cfunc DequeueUmsCompletionListItems "DequeueUmsCompletionListItems" intptr, int, var

; winmdroot.Foundation.BOOL DeviceIoControl(winmdroot.Foundation.HANDLE hDevice, uint dwIoControlCode, [Optional] void* lpInBuffer, uint nInBufferSize, [Optional] void* lpOutBuffer, uint nOutBufferSize, [Optional] uint* lpBytesReturned, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped)
#cfunc DeviceIoControl "DeviceIoControl" intptr, int, intptr, int, intptr, int, var, var

; winmdroot.Foundation.BOOL DisableThreadLibraryCalls(winmdroot.Foundation.HMODULE hLibModule)
#cfunc DisableThreadLibraryCalls "DisableThreadLibraryCalls" intptr

; uint DisableThreadProfiling(winmdroot.Foundation.HANDLE PerformanceDataHandle)
#cfunc DisableThreadProfiling "DisableThreadProfiling" intptr

; winmdroot.Foundation.BOOL DisconnectNamedPipe(winmdroot.Foundation.HANDLE hNamedPipe)
#cfunc DisconnectNamedPipe "DisconnectNamedPipe" intptr

; winmdroot.Foundation.BOOL DnsHostnameToComputerName(winmdroot.Foundation.PCWSTR Hostname, winmdroot.Foundation.PWSTR ComputerName, uint* nSize)
#cfunc DnsHostnameToComputerNameW "DnsHostnameToComputerNameW" wstr, wstr, var

; winmdroot.Foundation.BOOL DnsHostnameToComputerNameExW(winmdroot.Foundation.PCWSTR Hostname, winmdroot.Foundation.PWSTR ComputerName, uint* nSize)
#cfunc DnsHostnameToComputerNameExW "DnsHostnameToComputerNameExW" wstr, wstr, var

; winmdroot.Foundation.BOOL DosDateTimeToFileTime(ushort wFatDate, ushort wFatTime, global::System.Runtime.InteropServices.ComTypes.FILETIME* lpFileTime)
#cfunc DosDateTimeToFileTime "DosDateTimeToFileTime" int, int, var

; winmdroot.Foundation.BOOL DuplicateHandle(winmdroot.Foundation.HANDLE hSourceProcessHandle, winmdroot.Foundation.HANDLE hSourceHandle, winmdroot.Foundation.HANDLE hTargetProcessHandle, winmdroot.Foundation.HANDLE* lpTargetHandle, uint dwDesiredAccess, winmdroot.Foundation.BOOL bInheritHandle, winmdroot.Foundation.DUPLICATE_HANDLE_OPTIONS dwOptions)
#cfunc DuplicateHandle "DuplicateHandle" intptr, intptr, intptr, intptr, int, int, int

; uint EnableThreadProfiling(winmdroot.Foundation.HANDLE ThreadHandle, uint Flags, ulong HardwareCounters, winmdroot.Foundation.HANDLE* PerformanceDataHandle)
#cfunc EnableThreadProfiling "EnableThreadProfiling" intptr, int, int64, intptr

; winmdroot.Foundation.BOOL EndUpdateResource(winmdroot.Foundation.HANDLE hUpdate, winmdroot.Foundation.BOOL fDiscard)
#cfunc EndUpdateResourceW "EndUpdateResourceW" intptr, int

; winmdroot.Foundation.BOOL EnterSynchronizationBarrier(winmdroot.System.Threading.SYNCHRONIZATION_BARRIER* lpBarrier, uint dwFlags)
#cfunc EnterSynchronizationBarrier "EnterSynchronizationBarrier" var, int

; winmdroot.Foundation.BOOL EnterUmsSchedulingMode(winmdroot.System.Threading.UMS_SCHEDULER_STARTUP_INFO* SchedulerStartupInfo)
#cfunc EnterUmsSchedulingMode "EnterUmsSchedulingMode" var

; winmdroot.Foundation.BOOL EnumCalendarInfo(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.BOOL> lpCalInfoEnumProc, uint Locale, uint Calendar, uint CalType)
#cfunc EnumCalendarInfoW "EnumCalendarInfoW" int, int, int, int

; winmdroot.Foundation.BOOL EnumCalendarInfoEx(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,uint,global::Windows.Win32.Foundation.BOOL> lpCalInfoEnumProcEx, uint Locale, uint Calendar, uint CalType)
#cfunc EnumCalendarInfoExW "EnumCalendarInfoExW" int, int, int, int

; winmdroot.Foundation.BOOL EnumCalendarInfoExEx(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,uint,global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.BOOL> pCalInfoEnumProcExEx, winmdroot.Foundation.PCWSTR lpLocaleName, uint Calendar, winmdroot.Foundation.PCWSTR lpReserved, uint CalType, winmdroot.Foundation.LPARAM lParam)
#cfunc EnumCalendarInfoExEx "EnumCalendarInfoExEx" int, wstr, int, wstr, int, intptr

; winmdroot.Foundation.BOOL EnumDateFormats(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.BOOL> lpDateFmtEnumProc, uint Locale, uint dwFlags)
#cfunc EnumDateFormatsW "EnumDateFormatsW" int, int, int

; winmdroot.Foundation.BOOL EnumDateFormatsEx(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,uint,global::Windows.Win32.Foundation.BOOL> lpDateFmtEnumProcEx, uint Locale, uint dwFlags)
#cfunc EnumDateFormatsExW "EnumDateFormatsExW" int, int, int

; winmdroot.Foundation.BOOL EnumDateFormatsExEx(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,uint,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.BOOL> lpDateFmtEnumProcExEx, winmdroot.Foundation.PCWSTR lpLocaleName, winmdroot.Globalization.ENUM_DATE_FORMATS_FLAGS dwFlags, winmdroot.Foundation.LPARAM lParam)
#cfunc EnumDateFormatsExEx "EnumDateFormatsExEx" int, wstr, int, intptr

; winmdroot.Foundation.BOOL EnumLanguageGroupLocales(delegate *unmanaged[Stdcall]<uint,uint,global::Windows.Win32.Foundation.PWSTR,nint,global::Windows.Win32.Foundation.BOOL> lpLangGroupLocaleEnumProc, uint LanguageGroup, uint dwFlags, nint lParam)
#cfunc EnumLanguageGroupLocalesW "EnumLanguageGroupLocalesW" int, int, int, int

; winmdroot.Foundation.BOOL EnumResourceLanguages(winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.PCWSTR lpType, winmdroot.Foundation.PCWSTR lpName, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HMODULE,winmdroot.Foundation.PCWSTR,winmdroot.Foundation.PCWSTR,ushort,nint,global::Windows.Win32.Foundation.BOOL> lpEnumFunc, nint lParam)
#cfunc EnumResourceLanguagesW "EnumResourceLanguagesW" intptr, wstr, wstr, int, int

; winmdroot.Foundation.BOOL EnumResourceLanguagesEx(winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.PCWSTR lpType, winmdroot.Foundation.PCWSTR lpName, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HMODULE,winmdroot.Foundation.PCWSTR,winmdroot.Foundation.PCWSTR,ushort,nint,global::Windows.Win32.Foundation.BOOL> lpEnumFunc, nint lParam, uint dwFlags, ushort LangId)
#cfunc EnumResourceLanguagesExW "EnumResourceLanguagesExW" intptr, wstr, wstr, int, int, int, int

; winmdroot.Foundation.BOOL EnumResourceNamesW(winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.PCWSTR lpType, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HMODULE,winmdroot.Foundation.PCWSTR,global::Windows.Win32.Foundation.PWSTR,nint,global::Windows.Win32.Foundation.BOOL> lpEnumFunc, nint lParam)
#cfunc EnumResourceNamesW "EnumResourceNamesW" intptr, wstr, int, int

; winmdroot.Foundation.BOOL EnumResourceNamesEx(winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.PCWSTR lpType, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HMODULE,winmdroot.Foundation.PCWSTR,global::Windows.Win32.Foundation.PWSTR,nint,global::Windows.Win32.Foundation.BOOL> lpEnumFunc, nint lParam, uint dwFlags, ushort LangId)
#cfunc EnumResourceNamesExW "EnumResourceNamesExW" intptr, wstr, int, int, int, int

; winmdroot.Foundation.BOOL EnumResourceTypes(winmdroot.Foundation.HMODULE hModule, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HMODULE,global::Windows.Win32.Foundation.PWSTR,nint,global::Windows.Win32.Foundation.BOOL> lpEnumFunc, nint lParam)
#cfunc EnumResourceTypesW "EnumResourceTypesW" intptr, int, int

; winmdroot.Foundation.BOOL EnumResourceTypesEx(winmdroot.Foundation.HMODULE hModule, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HMODULE,global::Windows.Win32.Foundation.PWSTR,nint,global::Windows.Win32.Foundation.BOOL> lpEnumFunc, nint lParam, uint dwFlags, ushort LangId)
#cfunc EnumResourceTypesExW "EnumResourceTypesExW" intptr, int, int, int, int

; winmdroot.Foundation.BOOL EnumSystemCodePages(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.BOOL> lpCodePageEnumProc, winmdroot.Globalization.ENUM_SYSTEM_CODE_PAGES_FLAGS dwFlags)
#cfunc EnumSystemCodePagesW "EnumSystemCodePagesW" int, int

; uint EnumSystemFirmwareTables(winmdroot.System.SystemInformation.FIRMWARE_TABLE_PROVIDER FirmwareTableProviderSignature, [Optional] byte* pFirmwareTableEnumBuffer, uint BufferSize)
#cfunc EnumSystemFirmwareTables "EnumSystemFirmwareTables" int, var, int

; winmdroot.Foundation.BOOL EnumSystemGeoID(uint GeoClass, int ParentGeoId, delegate *unmanaged[Stdcall]<int,global::Windows.Win32.Foundation.BOOL> lpGeoEnumProc)
#cfunc EnumSystemGeoID "EnumSystemGeoID" int, int, int

; winmdroot.Foundation.BOOL EnumSystemGeoNames(uint geoClass, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.BOOL> geoEnumProc, winmdroot.Foundation.LPARAM data)
#cfunc EnumSystemGeoNames "EnumSystemGeoNames" int, int, intptr

; winmdroot.Foundation.BOOL EnumSystemLanguageGroups(delegate *unmanaged[Stdcall]<uint,global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.PWSTR,uint,nint,global::Windows.Win32.Foundation.BOOL> lpLanguageGroupEnumProc, winmdroot.Globalization.ENUM_SYSTEM_LANGUAGE_GROUPS_FLAGS dwFlags, nint lParam)
#cfunc EnumSystemLanguageGroupsW "EnumSystemLanguageGroupsW" int, int, int

; winmdroot.Foundation.BOOL EnumSystemLocales(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.BOOL> lpLocaleEnumProc, uint dwFlags)
#cfunc EnumSystemLocalesW "EnumSystemLocalesW" int, int

; winmdroot.Foundation.BOOL EnumSystemLocalesEx(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,uint,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.BOOL> lpLocaleEnumProcEx, uint dwFlags, winmdroot.Foundation.LPARAM lParam, [Optional] void* lpReserved)
#cfunc EnumSystemLocalesEx "EnumSystemLocalesEx" int, int, intptr, intptr

; winmdroot.Foundation.BOOL EnumTimeFormats(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.BOOL> lpTimeFmtEnumProc, uint Locale, winmdroot.Globalization.TIME_FORMAT_FLAGS dwFlags)
#cfunc EnumTimeFormatsW "EnumTimeFormatsW" int, int, int

; winmdroot.Foundation.BOOL EnumTimeFormatsEx(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.BOOL> lpTimeFmtEnumProcEx, winmdroot.Foundation.PCWSTR lpLocaleName, uint dwFlags, winmdroot.Foundation.LPARAM lParam)
#cfunc EnumTimeFormatsEx "EnumTimeFormatsEx" int, wstr, int, intptr

; winmdroot.Foundation.BOOL EnumUILanguages(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,nint,global::Windows.Win32.Foundation.BOOL> lpUILanguageEnumProc, uint dwFlags, nint lParam)
#cfunc EnumUILanguagesW "EnumUILanguagesW" int, int, int

; uint EraseTape(winmdroot.Foundation.HANDLE hDevice, winmdroot.Storage.FileSystem.ERASE_TAPE_TYPE dwEraseType, winmdroot.Foundation.BOOL bImmediate)
#cfunc EraseTape "EraseTape" intptr, int, int

; winmdroot.Foundation.BOOL EscapeCommFunction(winmdroot.Foundation.HANDLE hFile, winmdroot.Devices.Communication.ESCAPE_COMM_FUNCTION dwFunc)
#cfunc EscapeCommFunction "EscapeCommFunction" intptr, int

; winmdroot.Foundation.BOOL ExecuteUmsThread(void* UmsThread)
#cfunc ExecuteUmsThread "ExecuteUmsThread" intptr

; void ExitProcess(uint uExitCode)
#func ExitProcess "ExitProcess" int

; uint ExpandEnvironmentStrings(winmdroot.Foundation.PCWSTR lpSrc, winmdroot.Foundation.PWSTR lpDst, uint nSize)
#cfunc ExpandEnvironmentStringsW "ExpandEnvironmentStringsW" wstr, wstr, int

; void ExpungeConsoleCommandHistoryW(winmdroot.Foundation.PWSTR ExeName)
#func ExpungeConsoleCommandHistoryW "ExpungeConsoleCommandHistoryW" wstr

; void FatalAppExitW(uint uAction, winmdroot.Foundation.PCWSTR lpMessageText)
#func FatalAppExitW "FatalAppExitW" int, wstr

; void FatalExit(int ExitCode)
#func FatalExit "FatalExit" int

; winmdroot.Foundation.BOOL FileTimeToDosDateTime(global::System.Runtime.InteropServices.ComTypes.FILETIME* lpFileTime, ushort* lpFatDate, ushort* lpFatTime)
#cfunc FileTimeToDosDateTime "FileTimeToDosDateTime" var, var, var

; winmdroot.Foundation.BOOL FileTimeToLocalFileTime(global::System.Runtime.InteropServices.ComTypes.FILETIME* lpFileTime, global::System.Runtime.InteropServices.ComTypes.FILETIME* lpLocalFileTime)
#cfunc FileTimeToLocalFileTime "FileTimeToLocalFileTime" var, var

; winmdroot.Foundation.BOOL FileTimeToSystemTime(global::System.Runtime.InteropServices.ComTypes.FILETIME* lpFileTime, winmdroot.Foundation.SYSTEMTIME* lpSystemTime)
#cfunc FileTimeToSystemTime "FileTimeToSystemTime" var, var

; winmdroot.Foundation.BOOL FillConsoleOutputAttribute(winmdroot.Foundation.HANDLE hConsoleOutput, ushort wAttribute, uint nLength, winmdroot.System.Console.COORD dwWriteCoord, uint* lpNumberOfAttrsWritten)
#cfunc FillConsoleOutputAttribute "FillConsoleOutputAttribute" intptr, int, int, var, var

; winmdroot.Foundation.BOOL FillConsoleOutputCharacter(winmdroot.Foundation.HANDLE hConsoleOutput, char cCharacter, uint nLength, winmdroot.System.Console.COORD dwWriteCoord, uint* lpNumberOfCharsWritten)
#cfunc FillConsoleOutputCharacterW "FillConsoleOutputCharacterW" intptr, int, int, var, var

; winmdroot.Foundation.BOOL FindActCtxSectionGuid(uint dwFlags, [Optional] global::System.Guid* lpExtensionGuid, uint ulSectionId, [Optional] global::System.Guid* lpGuidToFind, winmdroot.System.ApplicationInstallationAndServicing.ACTCTX_SECTION_KEYED_DATA* ReturnedData)
#cfunc FindActCtxSectionGuid "FindActCtxSectionGuid" int, var, int, var, var

; winmdroot.Foundation.BOOL FindActCtxSectionString(uint dwFlags, [Optional] global::System.Guid* lpExtensionGuid, uint ulSectionId, winmdroot.Foundation.PCWSTR lpStringToFind, winmdroot.System.ApplicationInstallationAndServicing.ACTCTX_SECTION_KEYED_DATA* ReturnedData)
#cfunc FindActCtxSectionStringW "FindActCtxSectionStringW" int, var, int, wstr, var

; ushort FindAtom(winmdroot.Foundation.PCWSTR lpString)
#cfunc FindAtomW "FindAtomW" wstr

; winmdroot.Foundation.BOOL FindClose(winmdroot.Foundation.HANDLE hFindFile)
#cfunc FindClose "FindClose" intptr

; winmdroot.Foundation.BOOL FindCloseChangeNotification(winmdroot.Foundation.HANDLE hChangeHandle)
#cfunc FindCloseChangeNotification "FindCloseChangeNotification" intptr

; winmdroot.Foundation.HANDLE FindFirstChangeNotification(winmdroot.Foundation.PCWSTR lpPathName, winmdroot.Foundation.BOOL bWatchSubtree, winmdroot.Storage.FileSystem.FILE_NOTIFY_CHANGE dwNotifyFilter)
#cfunc FindFirstChangeNotificationW "FindFirstChangeNotificationW" wstr, int, int

; winmdroot.Foundation.HANDLE FindFirstFile(winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Storage.FileSystem.WIN32_FIND_DATAW* lpFindFileData)
#cfunc FindFirstFileW "FindFirstFileW" wstr, var

; winmdroot.Foundation.HANDLE FindFirstFileEx(winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Storage.FileSystem.FINDEX_INFO_LEVELS fInfoLevelId, void* lpFindFileData, winmdroot.Storage.FileSystem.FINDEX_SEARCH_OPS fSearchOp, [Optional] void* lpSearchFilter, winmdroot.Storage.FileSystem.FIND_FIRST_EX_FLAGS dwAdditionalFlags)
#cfunc FindFirstFileExW "FindFirstFileExW" wstr, int, intptr, int, intptr, int

; winmdroot.Foundation.HANDLE FindFirstFileName(winmdroot.Foundation.PCWSTR lpFileName, uint dwFlags, uint* StringLength, winmdroot.Foundation.PWSTR LinkName)
#cfunc FindFirstFileNameW "FindFirstFileNameW" wstr, int, var, wstr

; winmdroot.Foundation.HANDLE FindFirstFileNameTransacted(winmdroot.Foundation.PCWSTR lpFileName, uint dwFlags, uint* StringLength, winmdroot.Foundation.PWSTR LinkName, winmdroot.Foundation.HANDLE hTransaction)
#cfunc FindFirstFileNameTransactedW "FindFirstFileNameTransactedW" wstr, int, var, wstr, intptr

; winmdroot.Foundation.HANDLE FindFirstFileTransacted(winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Storage.FileSystem.FINDEX_INFO_LEVELS fInfoLevelId, void* lpFindFileData, winmdroot.Storage.FileSystem.FINDEX_SEARCH_OPS fSearchOp, [Optional] void* lpSearchFilter, uint dwAdditionalFlags, winmdroot.Foundation.HANDLE hTransaction)
#cfunc FindFirstFileTransactedW "FindFirstFileTransactedW" wstr, int, intptr, int, intptr, int, intptr

; winmdroot.Foundation.HANDLE FindFirstStreamTransacted(winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Storage.FileSystem.STREAM_INFO_LEVELS InfoLevel, void* lpFindStreamData, uint dwFlags, winmdroot.Foundation.HANDLE hTransaction)
#cfunc FindFirstStreamTransactedW "FindFirstStreamTransactedW" wstr, int, intptr, int, intptr

; winmdroot.Foundation.HANDLE FindFirstVolume(winmdroot.Foundation.PWSTR lpszVolumeName, uint cchBufferLength)
#cfunc FindFirstVolumeW "FindFirstVolumeW" wstr, int

; winmdroot.Foundation.HANDLE FindFirstVolumeMountPoint(winmdroot.Foundation.PCWSTR lpszRootPathName, winmdroot.Foundation.PWSTR lpszVolumeMountPoint, uint cchBufferLength)
#cfunc FindFirstVolumeMountPointW "FindFirstVolumeMountPointW" wstr, wstr, int

; int FindNLSString(uint Locale, uint dwFindNLSStringFlags, winmdroot.Foundation.PCWSTR lpStringSource, int cchSource, winmdroot.Foundation.PCWSTR lpStringValue, int cchValue, [Optional] int* pcchFound)
#cfunc FindNLSString "FindNLSString" int, int, wstr, int, wstr, int, var

; int FindNLSStringEx(winmdroot.Foundation.PCWSTR lpLocaleName, uint dwFindNLSStringFlags, winmdroot.Foundation.PCWSTR lpStringSource, int cchSource, winmdroot.Foundation.PCWSTR lpStringValue, int cchValue, [Optional] int* pcchFound, [Optional] winmdroot.Globalization.NLSVERSIONINFO* lpVersionInformation, [Optional] void* lpReserved, winmdroot.Foundation.LPARAM sortHandle)
#cfunc FindNLSStringEx "FindNLSStringEx" wstr, int, wstr, int, wstr, int, var, var, intptr, intptr

; winmdroot.Foundation.BOOL FindNextChangeNotification(winmdroot.Foundation.HANDLE hChangeHandle)
#cfunc FindNextChangeNotification "FindNextChangeNotification" intptr

; winmdroot.Foundation.BOOL FindNextFile(winmdroot.Foundation.HANDLE hFindFile, winmdroot.Storage.FileSystem.WIN32_FIND_DATAW* lpFindFileData)
#cfunc FindNextFileW "FindNextFileW" intptr, var

; winmdroot.Foundation.BOOL FindNextFileName(winmdroot.Foundation.HANDLE hFindStream, uint* StringLength, winmdroot.Foundation.PWSTR LinkName)
#cfunc FindNextFileNameW "FindNextFileNameW" intptr, var, wstr

; winmdroot.Foundation.BOOL FindNextVolume(winmdroot.Foundation.HANDLE hFindVolume, winmdroot.Foundation.PWSTR lpszVolumeName, uint cchBufferLength)
#cfunc FindNextVolumeW "FindNextVolumeW" intptr, wstr, int

; winmdroot.Foundation.BOOL FindNextVolumeMountPoint(winmdroot.Foundation.HANDLE hFindVolumeMountPoint, winmdroot.Foundation.PWSTR lpszVolumeMountPoint, uint cchBufferLength)
#cfunc FindNextVolumeMountPointW "FindNextVolumeMountPointW" intptr, wstr, int

; winmdroot.Foundation.HRSRC FindResourceW(winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.PCWSTR lpName, winmdroot.Foundation.PCWSTR lpType)
#cfunc FindResourceW "FindResourceW" intptr, wstr, wstr

; winmdroot.Foundation.HRSRC FindResourceExW(winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.PCWSTR lpType, winmdroot.Foundation.PCWSTR lpName, ushort wLanguage)
#cfunc FindResourceExW "FindResourceExW" intptr, wstr, wstr, int

; int FindStringOrdinal(uint dwFindStringOrdinalFlags, winmdroot.Foundation.PCWSTR lpStringSource, int cchSource, winmdroot.Foundation.PCWSTR lpStringValue, int cchValue, winmdroot.Foundation.BOOL bIgnoreCase)
#cfunc FindStringOrdinal "FindStringOrdinal" int, wstr, int, wstr, int, int

; winmdroot.Foundation.BOOL FindVolumeClose(winmdroot.Foundation.HANDLE hFindVolume)
#cfunc FindVolumeClose "FindVolumeClose" intptr

; winmdroot.Foundation.BOOL FindVolumeMountPointClose(winmdroot.Foundation.HANDLE hFindVolumeMountPoint)
#cfunc FindVolumeMountPointClose "FindVolumeMountPointClose" intptr

; uint FlsAlloc(delegate *unmanaged[Stdcall]<void*,void> lpCallback)
#cfunc FlsAlloc "FlsAlloc" int

; winmdroot.Foundation.BOOL FlsFree(uint dwFlsIndex)
#cfunc FlsFree "FlsFree" int

; void* FlsGetValue(uint dwFlsIndex)
#cfunc FlsGetValue "FlsGetValue" int

; winmdroot.Foundation.BOOL FlsSetValue(uint dwFlsIndex, [Optional] void* lpFlsData)
#cfunc FlsSetValue "FlsSetValue" int, intptr

; winmdroot.Foundation.BOOL FlushConsoleInputBuffer(winmdroot.Foundation.HANDLE hConsoleInput)
#cfunc FlushConsoleInputBuffer "FlushConsoleInputBuffer" intptr

; winmdroot.Foundation.BOOL FlushFileBuffers(winmdroot.Foundation.HANDLE hFile)
#cfunc FlushFileBuffers "FlushFileBuffers" intptr

; winmdroot.Foundation.BOOL FlushInstructionCache(winmdroot.Foundation.HANDLE hProcess, [Optional] void* lpBaseAddress, nuint dwSize)
#cfunc FlushInstructionCache "FlushInstructionCache" intptr, intptr, int

; winmdroot.Foundation.BOOL FlushViewOfFile(void* lpBaseAddress, nuint dwNumberOfBytesToFlush)
#cfunc FlushViewOfFile "FlushViewOfFile" intptr, int

; int FoldString(winmdroot.Globalization.FOLD_STRING_MAP_FLAGS dwMapFlags, winmdroot.Foundation.PCWSTR lpSrcStr, int cchSrc, winmdroot.Foundation.PWSTR lpDestStr, int cchDest)
#cfunc FoldStringW "FoldStringW" int, wstr, int, wstr, int

; uint FormatMessage(winmdroot.System.Diagnostics.Debug.FORMAT_MESSAGE_OPTIONS dwFlags, [Optional] void* lpSource, uint dwMessageId, uint dwLanguageId, winmdroot.Foundation.PWSTR lpBuffer, uint nSize, [Optional] sbyte** Arguments)
#cfunc FormatMessageW "FormatMessageW" int, intptr, int, int, wstr, int, var

; winmdroot.Foundation.BOOL FreeConsole()
#cfunc FreeConsole "FreeConsole"

; winmdroot.Foundation.BOOL FreeEnvironmentStrings(winmdroot.Foundation.PZZWSTR penv)
#cfunc FreeEnvironmentStringsW "FreeEnvironmentStringsW" int

; void FreeLibraryAndExitThread(winmdroot.Foundation.HMODULE hLibModule, uint dwExitCode)
#func FreeLibraryAndExitThread "FreeLibraryAndExitThread" intptr, int

; void FreeMemoryJobObject(void* Buffer)
#func FreeMemoryJobObject "FreeMemoryJobObject" intptr

; winmdroot.Foundation.HGLOBAL GlobalFree(winmdroot.Foundation.HGLOBAL hMem)
#cfunc GlobalFree "GlobalFree" int

; winmdroot.Foundation.BOOL FreeResource(winmdroot.Foundation.HGLOBAL hResData)
#cfunc FreeResource "FreeResource" int

; winmdroot.Foundation.BOOL FreeUserPhysicalPages(winmdroot.Foundation.HANDLE hProcess, nuint* NumberOfPages, nuint* PageArray)
#cfunc FreeUserPhysicalPages "FreeUserPhysicalPages" intptr, var, var

; winmdroot.Foundation.BOOL GenerateConsoleCtrlEvent(uint dwCtrlEvent, uint dwProcessGroupId)
#cfunc GenerateConsoleCtrlEvent "GenerateConsoleCtrlEvent" int, int

; uint GetACP()
#cfunc GetACP "GetACP"

; uint GetActiveProcessorCount(ushort GroupNumber)
#cfunc GetActiveProcessorCount "GetActiveProcessorCount" int

; ushort GetActiveProcessorGroupCount()
#cfunc GetActiveProcessorGroupCount "GetActiveProcessorGroupCount"

; winmdroot.Foundation.BOOL GetAppContainerAce(winmdroot.Security.ACL* Acl, uint StartingAceIndex, void** AppContainerAce, [Optional] uint* AppContainerAceIndex)
#cfunc GetAppContainerAce "GetAppContainerAce" var, int, var, var

; winmdroot.Foundation.BOOL GetAppContainerNamedObjectPath(winmdroot.Foundation.HANDLE Token, winmdroot.Security.PSID AppContainerSid, uint ObjectPathLength, winmdroot.Foundation.PWSTR ObjectPath, uint* ReturnLength)
#cfunc GetAppContainerNamedObjectPath "GetAppContainerNamedObjectPath" intptr, int, int, wstr, var

; winmdroot.Foundation.HRESULT GetApplicationRecoveryCallback(winmdroot.Foundation.HANDLE hProcess, delegate *unmanaged[Stdcall]<void*,uint>* pRecoveryCallback, [Optional] void** ppvParameter, [Optional] uint* pdwPingInterval, [Optional] uint* pdwFlags)
#cfunc GetApplicationRecoveryCallback "GetApplicationRecoveryCallback" intptr, var, var, var, var

; winmdroot.Foundation.HRESULT GetApplicationRestartSettings(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.PWSTR pwzCommandline, uint* pcchSize, [Optional] uint* pdwFlags)
#cfunc GetApplicationRestartSettings "GetApplicationRestartSettings" intptr, wstr, var, var

; uint GetAtomName(ushort nAtom, winmdroot.Foundation.PWSTR lpBuffer, int nSize)
#cfunc GetAtomNameW "GetAtomNameW" int, wstr, int

; winmdroot.Foundation.BOOL GetBinaryType(winmdroot.Foundation.PCWSTR lpApplicationName, uint* lpBinaryType)
#cfunc GetBinaryTypeW "GetBinaryTypeW" wstr, var

; winmdroot.Foundation.BOOL GetCPInfo(uint CodePage, winmdroot.Globalization.CPINFO* lpCPInfo)
#cfunc GetCPInfo "GetCPInfo" int, var

; winmdroot.Foundation.BOOL GetCPInfoEx(uint CodePage, uint dwFlags, winmdroot.Globalization.CPINFOEXW* lpCPInfoEx)
#cfunc GetCPInfoExW "GetCPInfoExW" int, int, var

; winmdroot.Foundation.BOOL GetCachedSigningLevel(winmdroot.Foundation.HANDLE File, uint* Flags, uint* SigningLevel, [Optional] byte* Thumbprint, [Optional] uint* ThumbprintSize, [Optional] uint* ThumbprintAlgorithm)
#cfunc GetCachedSigningLevel "GetCachedSigningLevel" intptr, var, var, var, var, var

; winmdroot.Foundation.BOOL GetCalendarDateFormatEx(winmdroot.Foundation.PCWSTR lpszLocale, uint dwFlags, winmdroot.Globalization.CALDATETIME* lpCalDateTime, winmdroot.Foundation.PCWSTR lpFormat, winmdroot.Foundation.PWSTR lpDateStr, int cchDate)
#cfunc GetCalendarDateFormatEx "GetCalendarDateFormatEx" wstr, int, var, wstr, wstr, int

; int GetCalendarInfo(uint Locale, uint Calendar, uint CalType, winmdroot.Foundation.PWSTR lpCalData, int cchData, [Optional] uint* lpValue)
#cfunc GetCalendarInfoW "GetCalendarInfoW" int, int, int, wstr, int, var

; int GetCalendarInfoEx(winmdroot.Foundation.PCWSTR lpLocaleName, uint Calendar, winmdroot.Foundation.PCWSTR lpReserved, uint CalType, winmdroot.Foundation.PWSTR lpCalData, int cchData, [Optional] uint* lpValue)
#cfunc GetCalendarInfoEx "GetCalendarInfoEx" wstr, int, wstr, int, wstr, int, var

; winmdroot.Foundation.BOOL GetCalendarSupportedDateRange(uint Calendar, winmdroot.Globalization.CALDATETIME* lpCalMinDateTime, winmdroot.Globalization.CALDATETIME* lpCalMaxDateTime)
#cfunc GetCalendarSupportedDateRange "GetCalendarSupportedDateRange" int, var, var

; winmdroot.Foundation.BOOL GetCommConfig(winmdroot.Foundation.HANDLE hCommDev, [Optional] winmdroot.Devices.Communication.COMMCONFIG* lpCC, uint* lpdwSize)
#cfunc GetCommConfig "GetCommConfig" intptr, var, var

; winmdroot.Foundation.BOOL GetCommMask(winmdroot.Foundation.HANDLE hFile, winmdroot.Devices.Communication.COMM_EVENT_MASK* lpEvtMask)
#cfunc GetCommMask "GetCommMask" intptr, var

; winmdroot.Foundation.BOOL GetCommModemStatus(winmdroot.Foundation.HANDLE hFile, winmdroot.Devices.Communication.MODEM_STATUS_FLAGS* lpModemStat)
#cfunc GetCommModemStatus "GetCommModemStatus" intptr, var

; winmdroot.Foundation.BOOL GetCommProperties(winmdroot.Foundation.HANDLE hFile, winmdroot.Devices.Communication.COMMPROP* lpCommProp)
#cfunc GetCommProperties "GetCommProperties" intptr, var

; winmdroot.Foundation.BOOL GetCommState(winmdroot.Foundation.HANDLE hFile, winmdroot.Devices.Communication.DCB* lpDCB)
#cfunc GetCommState "GetCommState" intptr, var

; winmdroot.Foundation.BOOL GetCommTimeouts(winmdroot.Foundation.HANDLE hFile, winmdroot.Devices.Communication.COMMTIMEOUTS* lpCommTimeouts)
#cfunc GetCommTimeouts "GetCommTimeouts" intptr, var

; winmdroot.Foundation.PCWSTR GetCommandLineW()
#cfunc GetCommandLineW "GetCommandLineW"

; uint GetCompressedFileSize(winmdroot.Foundation.PCWSTR lpFileName, [Optional] uint* lpFileSizeHigh)
#cfunc GetCompressedFileSizeW "GetCompressedFileSizeW" wstr, var

; uint GetCompressedFileSizeTransacted(winmdroot.Foundation.PCWSTR lpFileName, [Optional] uint* lpFileSizeHigh, winmdroot.Foundation.HANDLE hTransaction)
#cfunc GetCompressedFileSizeTransactedW "GetCompressedFileSizeTransactedW" wstr, var, intptr

; winmdroot.Foundation.BOOL GetComputerName(winmdroot.Foundation.PWSTR lpBuffer, uint* nSize)
#cfunc GetComputerNameW "GetComputerNameW" wstr, var

; winmdroot.Foundation.BOOL GetComputerNameEx(winmdroot.System.SystemInformation.COMPUTER_NAME_FORMAT NameType, winmdroot.Foundation.PWSTR lpBuffer, uint* nSize)
#cfunc GetComputerNameExW "GetComputerNameExW" int, wstr, var

; uint GetConsoleAlias(winmdroot.Foundation.PWSTR Source, winmdroot.Foundation.PWSTR TargetBuffer, uint TargetBufferLength, winmdroot.Foundation.PWSTR ExeName)
#cfunc GetConsoleAliasW "GetConsoleAliasW" wstr, wstr, int, wstr

; uint GetConsoleAliasExes(winmdroot.Foundation.PWSTR ExeNameBuffer, uint ExeNameBufferLength)
#cfunc GetConsoleAliasExesW "GetConsoleAliasExesW" wstr, int

; uint GetConsoleAliasExesLengthW()
#cfunc GetConsoleAliasExesLengthW "GetConsoleAliasExesLengthW"

; uint GetConsoleAliases(winmdroot.Foundation.PWSTR AliasBuffer, uint AliasBufferLength, winmdroot.Foundation.PWSTR ExeName)
#cfunc GetConsoleAliasesW "GetConsoleAliasesW" wstr, int, wstr

; uint GetConsoleAliasesLengthW(winmdroot.Foundation.PWSTR ExeName)
#cfunc GetConsoleAliasesLengthW "GetConsoleAliasesLengthW" wstr

; uint GetConsoleCP()
#cfunc GetConsoleCP "GetConsoleCP"

; uint GetConsoleCommandHistoryW(winmdroot.Foundation.PWSTR Commands, uint CommandBufferLength, winmdroot.Foundation.PWSTR ExeName)
#cfunc GetConsoleCommandHistoryW "GetConsoleCommandHistoryW" wstr, int, wstr

; uint GetConsoleCommandHistoryLengthW(winmdroot.Foundation.PWSTR ExeName)
#cfunc GetConsoleCommandHistoryLengthW "GetConsoleCommandHistoryLengthW" wstr

; winmdroot.Foundation.BOOL GetConsoleCursorInfo(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.System.Console.CONSOLE_CURSOR_INFO* lpConsoleCursorInfo)
#cfunc GetConsoleCursorInfo "GetConsoleCursorInfo" intptr, var

; winmdroot.Foundation.BOOL GetConsoleDisplayMode(uint* lpModeFlags)
#cfunc GetConsoleDisplayMode "GetConsoleDisplayMode" var

; winmdroot.System.Console.COORD GetConsoleFontSize(winmdroot.Foundation.HANDLE hConsoleOutput, uint nFont)
#cfunc GetConsoleFontSize "GetConsoleFontSize" intptr, int

; winmdroot.Foundation.BOOL GetConsoleHistoryInfo(winmdroot.System.Console.CONSOLE_HISTORY_INFO* lpConsoleHistoryInfo)
#cfunc GetConsoleHistoryInfo "GetConsoleHistoryInfo" var

; winmdroot.Foundation.BOOL GetConsoleMode(winmdroot.Foundation.HANDLE hConsoleHandle, winmdroot.System.Console.CONSOLE_MODE* lpMode)
#cfunc GetConsoleMode "GetConsoleMode" intptr, var

; uint GetConsoleOriginalTitle(winmdroot.Foundation.PWSTR lpConsoleTitle, uint nSize)
#cfunc GetConsoleOriginalTitleW "GetConsoleOriginalTitleW" wstr, int

; uint GetConsoleOutputCP()
#cfunc GetConsoleOutputCP "GetConsoleOutputCP"

; uint GetConsoleProcessList(uint* lpdwProcessList, uint dwProcessCount)
#cfunc GetConsoleProcessList "GetConsoleProcessList" var, int

; winmdroot.Foundation.BOOL GetConsoleScreenBufferInfo(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.System.Console.CONSOLE_SCREEN_BUFFER_INFO* lpConsoleScreenBufferInfo)
#cfunc GetConsoleScreenBufferInfo "GetConsoleScreenBufferInfo" intptr, var

; winmdroot.Foundation.BOOL GetConsoleScreenBufferInfoEx(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.System.Console.CONSOLE_SCREEN_BUFFER_INFOEX* lpConsoleScreenBufferInfoEx)
#cfunc GetConsoleScreenBufferInfoEx "GetConsoleScreenBufferInfoEx" intptr, var

; winmdroot.Foundation.BOOL GetConsoleSelectionInfo(winmdroot.System.Console.CONSOLE_SELECTION_INFO* lpConsoleSelectionInfo)
#cfunc GetConsoleSelectionInfo "GetConsoleSelectionInfo" var

; uint GetConsoleTitle(winmdroot.Foundation.PWSTR lpConsoleTitle, uint nSize)
#cfunc GetConsoleTitleW "GetConsoleTitleW" wstr, int

; winmdroot.Foundation.HWND GetConsoleWindow()
#cfunc GetConsoleWindow "GetConsoleWindow"

; int GetCurrencyFormat(uint Locale, uint dwFlags, winmdroot.Foundation.PCWSTR lpValue, [Optional] winmdroot.Globalization.CURRENCYFMTW* lpFormat, winmdroot.Foundation.PWSTR lpCurrencyStr, int cchCurrency)
#cfunc GetCurrencyFormatW "GetCurrencyFormatW" int, int, wstr, var, wstr, int

; int GetCurrencyFormatEx(winmdroot.Foundation.PCWSTR lpLocaleName, uint dwFlags, winmdroot.Foundation.PCWSTR lpValue, [Optional] winmdroot.Globalization.CURRENCYFMTW* lpFormat, winmdroot.Foundation.PWSTR lpCurrencyStr, int cchCurrency)
#cfunc GetCurrencyFormatEx "GetCurrencyFormatEx" wstr, int, wstr, var, wstr, int

; winmdroot.Foundation.BOOL GetCurrentActCtx(winmdroot.Foundation.HANDLE* lphActCtx)
#cfunc GetCurrentActCtx "GetCurrentActCtx" intptr

; winmdroot.Foundation.BOOL GetCurrentConsoleFont(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.Foundation.BOOL bMaximumWindow, winmdroot.System.Console.CONSOLE_FONT_INFO* lpConsoleCurrentFont)
#cfunc GetCurrentConsoleFont "GetCurrentConsoleFont" intptr, int, var

; winmdroot.Foundation.BOOL GetCurrentConsoleFontEx(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.Foundation.BOOL bMaximumWindow, winmdroot.System.Console.CONSOLE_FONT_INFOEX* lpConsoleCurrentFontEx)
#cfunc GetCurrentConsoleFontEx "GetCurrentConsoleFontEx" intptr, int, var

; uint GetCurrentDirectoryW(uint nBufferLength, winmdroot.Foundation.PWSTR lpBuffer)
#cfunc GetCurrentDirectoryW "GetCurrentDirectoryW" int, wstr

; winmdroot.Foundation.HANDLE GetCurrentProcess()
#cfunc GetCurrentProcess "GetCurrentProcess"

; uint GetCurrentProcessId()
#cfunc GetCurrentProcessId "GetCurrentProcessId"

; winmdroot.Foundation.HANDLE GetCurrentThread()
#cfunc GetCurrentThread "GetCurrentThread"

; uint GetCurrentThreadId()
#cfunc GetCurrentThreadId "GetCurrentThreadId"

; void* GetCurrentUmsThread()
#cfunc GetCurrentUmsThread "GetCurrentUmsThread"

; int GetDateFormat(uint Locale, uint dwFlags, [Optional] winmdroot.Foundation.SYSTEMTIME* lpDate, winmdroot.Foundation.PCWSTR lpFormat, winmdroot.Foundation.PWSTR lpDateStr, int cchDate)
#cfunc GetDateFormatW "GetDateFormatW" int, int, var, wstr, wstr, int

; int GetDateFormatEx(winmdroot.Foundation.PCWSTR lpLocaleName, winmdroot.Globalization.ENUM_DATE_FORMATS_FLAGS dwFlags, [Optional] winmdroot.Foundation.SYSTEMTIME* lpDate, winmdroot.Foundation.PCWSTR lpFormat, winmdroot.Foundation.PWSTR lpDateStr, int cchDate, winmdroot.Foundation.PCWSTR lpCalendar)
#cfunc GetDateFormatEx "GetDateFormatEx" wstr, int, var, wstr, wstr, int, wstr

; winmdroot.Foundation.BOOL GetDefaultCommConfig(winmdroot.Foundation.PCWSTR lpszName, winmdroot.Devices.Communication.COMMCONFIG* lpCC, uint* lpdwSize)
#cfunc GetDefaultCommConfigW "GetDefaultCommConfigW" wstr, var, var

; winmdroot.Foundation.BOOL GetDevicePowerState(winmdroot.Foundation.HANDLE hDevice, winmdroot.Foundation.BOOL* pfOn)
#cfunc GetDevicePowerState "GetDevicePowerState" intptr, var

; winmdroot.Foundation.BOOL GetDiskFreeSpace(winmdroot.Foundation.PCWSTR lpRootPathName, [Optional] uint* lpSectorsPerCluster, [Optional] uint* lpBytesPerSector, [Optional] uint* lpNumberOfFreeClusters, [Optional] uint* lpTotalNumberOfClusters)
#cfunc GetDiskFreeSpaceW "GetDiskFreeSpaceW" wstr, var, var, var, var

; winmdroot.Foundation.BOOL GetDiskFreeSpaceEx(winmdroot.Foundation.PCWSTR lpDirectoryName, [Optional] ulong* lpFreeBytesAvailableToCaller, [Optional] ulong* lpTotalNumberOfBytes, [Optional] ulong* lpTotalNumberOfFreeBytes)
#cfunc GetDiskFreeSpaceExW "GetDiskFreeSpaceExW" wstr, var, var, var

; uint GetDllDirectory(uint nBufferLength, winmdroot.Foundation.PWSTR lpBuffer)
#cfunc GetDllDirectoryW "GetDllDirectoryW" int, wstr

; uint GetDriveTypeW(winmdroot.Foundation.PCWSTR lpRootPathName)
#cfunc GetDriveTypeW "GetDriveTypeW" wstr

; int GetDurationFormat(uint Locale, uint dwFlags, [Optional] winmdroot.Foundation.SYSTEMTIME* lpDuration, ulong ullDuration, winmdroot.Foundation.PCWSTR lpFormat, winmdroot.Foundation.PWSTR lpDurationStr, int cchDuration)
#cfunc GetDurationFormat "GetDurationFormat" int, int, var, int64, wstr, wstr, int

; int GetDurationFormatEx(winmdroot.Foundation.PCWSTR lpLocaleName, uint dwFlags, [Optional] winmdroot.Foundation.SYSTEMTIME* lpDuration, ulong ullDuration, winmdroot.Foundation.PCWSTR lpFormat, winmdroot.Foundation.PWSTR lpDurationStr, int cchDuration)
#cfunc GetDurationFormatEx "GetDurationFormatEx" wstr, int, var, int64, wstr, wstr, int

; uint GetDynamicTimeZoneInformation(winmdroot.System.Time.DYNAMIC_TIME_ZONE_INFORMATION* pTimeZoneInformation)
#cfunc GetDynamicTimeZoneInformation "GetDynamicTimeZoneInformation" var

; winmdroot.Foundation.PSTR GetEnvironmentStrings()
#cfunc GetEnvironmentStrings "GetEnvironmentStrings"

; uint GetEnvironmentVariable(winmdroot.Foundation.PCWSTR lpName, winmdroot.Foundation.PWSTR lpBuffer, uint nSize)
#cfunc GetEnvironmentVariableW "GetEnvironmentVariableW" wstr, wstr, int

; uint GetErrorMode()
#cfunc GetErrorMode "GetErrorMode"

; winmdroot.Foundation.BOOL GetExitCodeProcess(winmdroot.Foundation.HANDLE hProcess, uint* lpExitCode)
#cfunc GetExitCodeProcess "GetExitCodeProcess" intptr, var

; winmdroot.Foundation.BOOL GetExitCodeThread(winmdroot.Foundation.HANDLE hThread, uint* lpExitCode)
#cfunc GetExitCodeThread "GetExitCodeThread" intptr, var

; int GetExpandedName(winmdroot.Foundation.PWSTR lpszSource, winmdroot.Foundation.PWSTR lpszBuffer)
#cfunc GetExpandedNameW "GetExpandedNameW" wstr, wstr

; uint GetFileAttributes(winmdroot.Foundation.PCWSTR lpFileName)
#cfunc GetFileAttributesW "GetFileAttributesW" wstr

; winmdroot.Foundation.BOOL GetFileAttributesEx(winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Storage.FileSystem.GET_FILEEX_INFO_LEVELS fInfoLevelId, void* lpFileInformation)
#cfunc GetFileAttributesExW "GetFileAttributesExW" wstr, int, intptr

; winmdroot.Foundation.BOOL GetFileAttributesTransacted(winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Storage.FileSystem.GET_FILEEX_INFO_LEVELS fInfoLevelId, void* lpFileInformation, winmdroot.Foundation.HANDLE hTransaction)
#cfunc GetFileAttributesTransactedW "GetFileAttributesTransactedW" wstr, int, intptr, intptr

; winmdroot.Foundation.BOOL GetFileBandwidthReservation(winmdroot.Foundation.HANDLE hFile, uint* lpPeriodMilliseconds, uint* lpBytesPerPeriod, winmdroot.Foundation.BOOL* pDiscardable, uint* lpTransferSize, uint* lpNumOutstandingRequests)
#cfunc GetFileBandwidthReservation "GetFileBandwidthReservation" intptr, var, var, var, var, var

; winmdroot.Foundation.BOOL GetFileInformationByHandle(winmdroot.Foundation.HANDLE hFile, winmdroot.Storage.FileSystem.BY_HANDLE_FILE_INFORMATION* lpFileInformation)
#cfunc GetFileInformationByHandle "GetFileInformationByHandle" intptr, var

; winmdroot.Foundation.BOOL GetFileInformationByHandleEx(winmdroot.Foundation.HANDLE hFile, winmdroot.Storage.FileSystem.FILE_INFO_BY_HANDLE_CLASS FileInformationClass, void* lpFileInformation, uint dwBufferSize)
#cfunc GetFileInformationByHandleEx "GetFileInformationByHandleEx" intptr, int, intptr, int

; winmdroot.Foundation.BOOL GetFileMUIInfo(uint dwFlags, winmdroot.Foundation.PCWSTR pcwszFilePath, [Optional] winmdroot.Globalization.FILEMUIINFO* pFileMUIInfo, uint* pcbFileMUIInfo)
#cfunc GetFileMUIInfo "GetFileMUIInfo" int, wstr, var, var

; winmdroot.Foundation.BOOL GetFileMUIPath(uint dwFlags, winmdroot.Foundation.PCWSTR pcwszFilePath, winmdroot.Foundation.PWSTR pwszLanguage, uint* pcchLanguage, winmdroot.Foundation.PWSTR pwszFileMUIPath, uint* pcchFileMUIPath, ulong* pululEnumerator)
#cfunc GetFileMUIPath "GetFileMUIPath" int, wstr, wstr, var, wstr, var, var

; uint GetFileSize(winmdroot.Foundation.HANDLE hFile, [Optional] uint* lpFileSizeHigh)
#cfunc GetFileSize "GetFileSize" intptr, var

; winmdroot.Foundation.BOOL GetFileSizeEx(winmdroot.Foundation.HANDLE hFile, long* lpFileSize)
#cfunc GetFileSizeEx "GetFileSizeEx" intptr, var

; winmdroot.Foundation.BOOL GetFileTime(winmdroot.Foundation.HANDLE hFile, [Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* lpCreationTime, [Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* lpLastAccessTime, [Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* lpLastWriteTime)
#cfunc GetFileTime "GetFileTime" intptr, var, var, var

; winmdroot.Storage.FileSystem.FILE_TYPE GetFileType(winmdroot.Foundation.HANDLE hFile)
#cfunc GetFileType "GetFileType" intptr

; uint GetFinalPathNameByHandle(winmdroot.Foundation.HANDLE hFile, winmdroot.Foundation.PWSTR lpszFilePath, uint cchFilePath, winmdroot.Storage.FileSystem.GETFINALPATHNAMEBYHANDLE_FLAGS dwFlags)
#cfunc GetFinalPathNameByHandleW "GetFinalPathNameByHandleW" intptr, wstr, int, int

; uint GetFirmwareEnvironmentVariable(winmdroot.Foundation.PCWSTR lpName, winmdroot.Foundation.PCWSTR lpGuid, [Optional] void* pBuffer, uint nSize)
#cfunc GetFirmwareEnvironmentVariableW "GetFirmwareEnvironmentVariableW" wstr, wstr, intptr, int

; uint GetFirmwareEnvironmentVariableEx(winmdroot.Foundation.PCWSTR lpName, winmdroot.Foundation.PCWSTR lpGuid, [Optional] void* pBuffer, uint nSize, [Optional] uint* pdwAttribubutes)
#cfunc GetFirmwareEnvironmentVariableExW "GetFirmwareEnvironmentVariableExW" wstr, wstr, intptr, int, var

; winmdroot.Foundation.BOOL GetFirmwareType(winmdroot.System.SystemInformation.FIRMWARE_TYPE* FirmwareType)
#cfunc GetFirmwareType "GetFirmwareType" var

; uint GetFullPathName(winmdroot.Foundation.PCWSTR lpFileName, uint nBufferLength, winmdroot.Foundation.PWSTR lpBuffer, [Optional] winmdroot.Foundation.PWSTR* lpFilePart)
#cfunc GetFullPathNameW "GetFullPathNameW" wstr, int, wstr, var

; uint GetFullPathNameTransacted(winmdroot.Foundation.PCWSTR lpFileName, uint nBufferLength, winmdroot.Foundation.PWSTR lpBuffer, [Optional] winmdroot.Foundation.PWSTR* lpFilePart, winmdroot.Foundation.HANDLE hTransaction)
#cfunc GetFullPathNameTransactedW "GetFullPathNameTransactedW" wstr, int, wstr, var, intptr

; int GetGeoInfo(int Location, winmdroot.Globalization.SYSGEOTYPE GeoType, winmdroot.Foundation.PWSTR lpGeoData, int cchData, ushort LangId)
#cfunc GetGeoInfoW "GetGeoInfoW" int, int, wstr, int, int

; int GetGeoInfoEx(winmdroot.Foundation.PWSTR location, winmdroot.Globalization.SYSGEOTYPE geoType, winmdroot.Foundation.PWSTR geoData, int geoDataCount)
#cfunc GetGeoInfoEx "GetGeoInfoEx" wstr, int, wstr, int

; winmdroot.Foundation.BOOL GetHandleInformation(winmdroot.Foundation.HANDLE hObject, uint* lpdwFlags)
#cfunc GetHandleInformation "GetHandleInformation" intptr, var

; nuint GetLargePageMinimum()
#cfunc GetLargePageMinimum "GetLargePageMinimum"

; winmdroot.System.Console.COORD GetLargestConsoleWindowSize(winmdroot.Foundation.HANDLE hConsoleOutput)
#cfunc GetLargestConsoleWindowSize "GetLargestConsoleWindowSize" intptr

; void GetLocalTime(winmdroot.Foundation.SYSTEMTIME* lpSystemTime)
#func GetLocalTime "GetLocalTime" var

; int GetLocaleInfo(uint Locale, uint LCType, winmdroot.Foundation.PWSTR lpLCData, int cchData)
#cfunc GetLocaleInfoW "GetLocaleInfoW" int, int, wstr, int

; int GetLocaleInfoEx(winmdroot.Foundation.PCWSTR lpLocaleName, uint LCType, winmdroot.Foundation.PWSTR lpLCData, int cchData)
#cfunc GetLocaleInfoEx "GetLocaleInfoEx" wstr, int, wstr, int

; uint GetLogicalDriveStrings(uint nBufferLength, winmdroot.Foundation.PWSTR lpBuffer)
#cfunc GetLogicalDriveStringsW "GetLogicalDriveStringsW" int, wstr

; uint GetLogicalDrives()
#cfunc GetLogicalDrives "GetLogicalDrives"

; winmdroot.Foundation.BOOL GetLogicalProcessorInformation([Optional] winmdroot.System.SystemInformation.SYSTEM_LOGICAL_PROCESSOR_INFORMATION* Buffer, uint* ReturnedLength)
#cfunc GetLogicalProcessorInformation "GetLogicalProcessorInformation" var, var

; uint GetLongPathName(winmdroot.Foundation.PCWSTR lpszShortPath, winmdroot.Foundation.PWSTR lpszLongPath, uint cchBuffer)
#cfunc GetLongPathNameW "GetLongPathNameW" wstr, wstr, int

; uint GetLongPathNameTransacted(winmdroot.Foundation.PCWSTR lpszShortPath, winmdroot.Foundation.PWSTR lpszLongPath, uint cchBuffer, winmdroot.Foundation.HANDLE hTransaction)
#cfunc GetLongPathNameTransactedW "GetLongPathNameTransactedW" wstr, wstr, int, intptr

; winmdroot.Foundation.BOOL GetMailslotInfo(winmdroot.Foundation.HANDLE hMailslot, [Optional] uint* lpMaxMessageSize, [Optional] uint* lpNextSize, [Optional] uint* lpMessageCount, [Optional] uint* lpReadTimeout)
#cfunc GetMailslotInfo "GetMailslotInfo" intptr, var, var, var, var

; uint GetMaximumProcessorCount(ushort GroupNumber)
#cfunc GetMaximumProcessorCount "GetMaximumProcessorCount" int

; ushort GetMaximumProcessorGroupCount()
#cfunc GetMaximumProcessorGroupCount "GetMaximumProcessorGroupCount"

; winmdroot.Foundation.BOOL GetMemoryErrorHandlingCapabilities(uint* Capabilities)
#cfunc GetMemoryErrorHandlingCapabilities "GetMemoryErrorHandlingCapabilities" var

; uint GetModuleFileName(winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.PWSTR lpFilename, uint nSize)
#cfunc GetModuleFileNameW "GetModuleFileNameW" intptr, wstr, int

; winmdroot.Foundation.HMODULE GetModuleHandle(winmdroot.Foundation.PCWSTR lpModuleName)
#cfunc GetModuleHandleW "GetModuleHandleW" wstr

; winmdroot.Foundation.BOOL GetModuleHandleEx(uint dwFlags, winmdroot.Foundation.PCWSTR lpModuleName, winmdroot.Foundation.HMODULE* phModule)
#cfunc GetModuleHandleExW "GetModuleHandleExW" int, wstr, intptr

; winmdroot.Foundation.BOOL GetNLSVersion(uint Function, uint Locale, winmdroot.Globalization.NLSVERSIONINFO* lpVersionInformation)
#cfunc GetNLSVersion "GetNLSVersion" int, int, var

; winmdroot.Foundation.BOOL GetNLSVersionEx(uint function, winmdroot.Foundation.PCWSTR lpLocaleName, winmdroot.Globalization.NLSVERSIONINFOEX* lpVersionInformation)
#cfunc GetNLSVersionEx "GetNLSVersionEx" int, wstr, var

; winmdroot.Foundation.BOOL GetNamedPipeClientComputerNameW(winmdroot.Foundation.HANDLE Pipe, winmdroot.Foundation.PWSTR ClientComputerName, uint ClientComputerNameLength)
#cfunc GetNamedPipeClientComputerNameW "GetNamedPipeClientComputerNameW" intptr, wstr, int

; winmdroot.Foundation.BOOL GetNamedPipeClientProcessId(winmdroot.Foundation.HANDLE Pipe, uint* ClientProcessId)
#cfunc GetNamedPipeClientProcessId "GetNamedPipeClientProcessId" intptr, var

; winmdroot.Foundation.BOOL GetNamedPipeClientSessionId(winmdroot.Foundation.HANDLE Pipe, uint* ClientSessionId)
#cfunc GetNamedPipeClientSessionId "GetNamedPipeClientSessionId" intptr, var

; winmdroot.Foundation.BOOL GetNamedPipeHandleStateW(winmdroot.Foundation.HANDLE hNamedPipe, [Optional] winmdroot.System.Pipes.NAMED_PIPE_MODE* lpState, [Optional] uint* lpCurInstances, [Optional] uint* lpMaxCollectionCount, [Optional] uint* lpCollectDataTimeout, winmdroot.Foundation.PWSTR lpUserName, uint nMaxUserNameSize)
#cfunc GetNamedPipeHandleStateW "GetNamedPipeHandleStateW" intptr, var, var, var, var, wstr, int

; winmdroot.Foundation.BOOL GetNamedPipeServerProcessId(winmdroot.Foundation.HANDLE Pipe, uint* ServerProcessId)
#cfunc GetNamedPipeServerProcessId "GetNamedPipeServerProcessId" intptr, var

; winmdroot.Foundation.BOOL GetNamedPipeServerSessionId(winmdroot.Foundation.HANDLE Pipe, uint* ServerSessionId)
#cfunc GetNamedPipeServerSessionId "GetNamedPipeServerSessionId" intptr, var

; void GetNativeSystemInfo(winmdroot.System.SystemInformation.SYSTEM_INFO* lpSystemInfo)
#func GetNativeSystemInfo "GetNativeSystemInfo" var

; void* GetNextUmsListItem(void* UmsContext)
#cfunc GetNextUmsListItem "GetNextUmsListItem" intptr

; winmdroot.Foundation.BOOL GetNumaAvailableMemoryNode(byte Node, ulong* AvailableBytes)
#cfunc GetNumaAvailableMemoryNode "GetNumaAvailableMemoryNode" int, var

; winmdroot.Foundation.BOOL GetNumaAvailableMemoryNodeEx(ushort Node, ulong* AvailableBytes)
#cfunc GetNumaAvailableMemoryNodeEx "GetNumaAvailableMemoryNodeEx" int, var

; winmdroot.Foundation.BOOL GetNumaHighestNodeNumber(uint* HighestNodeNumber)
#cfunc GetNumaHighestNodeNumber "GetNumaHighestNodeNumber" var

; winmdroot.Foundation.BOOL GetNumaNodeNumberFromHandle(winmdroot.Foundation.HANDLE hFile, ushort* NodeNumber)
#cfunc GetNumaNodeNumberFromHandle "GetNumaNodeNumberFromHandle" intptr, var

; winmdroot.Foundation.BOOL GetNumaNodeProcessorMask(byte Node, ulong* ProcessorMask)
#cfunc GetNumaNodeProcessorMask "GetNumaNodeProcessorMask" int, var

; winmdroot.Foundation.BOOL GetNumaNodeProcessorMaskEx(ushort Node, winmdroot.System.SystemInformation.GROUP_AFFINITY* ProcessorMask)
#cfunc GetNumaNodeProcessorMaskEx "GetNumaNodeProcessorMaskEx" int, var

; winmdroot.Foundation.BOOL GetNumaProcessorNode(byte Processor, byte* NodeNumber)
#cfunc GetNumaProcessorNode "GetNumaProcessorNode" int, var

; winmdroot.Foundation.BOOL GetNumaProcessorNodeEx(winmdroot.System.Kernel.PROCESSOR_NUMBER* Processor, ushort* NodeNumber)
#cfunc GetNumaProcessorNodeEx "GetNumaProcessorNodeEx" var, var

; winmdroot.Foundation.BOOL GetNumaProximityNode(uint ProximityId, byte* NodeNumber)
#cfunc GetNumaProximityNode "GetNumaProximityNode" int, var

; winmdroot.Foundation.BOOL GetNumaProximityNodeEx(uint ProximityId, ushort* NodeNumber)
#cfunc GetNumaProximityNodeEx "GetNumaProximityNodeEx" int, var

; int GetNumberFormat(uint Locale, uint dwFlags, winmdroot.Foundation.PCWSTR lpValue, [Optional] winmdroot.Globalization.NUMBERFMTW* lpFormat, winmdroot.Foundation.PWSTR lpNumberStr, int cchNumber)
#cfunc GetNumberFormatW "GetNumberFormatW" int, int, wstr, var, wstr, int

; int GetNumberFormatEx(winmdroot.Foundation.PCWSTR lpLocaleName, uint dwFlags, winmdroot.Foundation.PCWSTR lpValue, [Optional] winmdroot.Globalization.NUMBERFMTW* lpFormat, winmdroot.Foundation.PWSTR lpNumberStr, int cchNumber)
#cfunc GetNumberFormatEx "GetNumberFormatEx" wstr, int, wstr, var, wstr, int

; winmdroot.Foundation.BOOL GetNumberOfConsoleInputEvents(winmdroot.Foundation.HANDLE hConsoleInput, uint* lpNumberOfEvents)
#cfunc GetNumberOfConsoleInputEvents "GetNumberOfConsoleInputEvents" intptr, var

; winmdroot.Foundation.BOOL GetNumberOfConsoleMouseButtons(uint* lpNumberOfMouseButtons)
#cfunc GetNumberOfConsoleMouseButtons "GetNumberOfConsoleMouseButtons" var

; uint GetOEMCP()
#cfunc GetOEMCP "GetOEMCP"

; winmdroot.Foundation.BOOL GetOverlappedResult(winmdroot.Foundation.HANDLE hFile, global::System.Threading.NativeOverlapped* lpOverlapped, uint* lpNumberOfBytesTransferred, winmdroot.Foundation.BOOL bWait)
#cfunc GetOverlappedResult "GetOverlappedResult" intptr, var, var, int

; winmdroot.Foundation.BOOL GetPhysicallyInstalledSystemMemory(ulong* TotalMemoryInKilobytes)
#cfunc GetPhysicallyInstalledSystemMemory "GetPhysicallyInstalledSystemMemory" var

; uint GetPriorityClass(winmdroot.Foundation.HANDLE hProcess)
#cfunc GetPriorityClass "GetPriorityClass" intptr

; int GetPrivateProfileIntW(winmdroot.Foundation.PCWSTR lpAppName, winmdroot.Foundation.PCWSTR lpKeyName, int nDefault, winmdroot.Foundation.PCWSTR lpFileName)
#cfunc GetPrivateProfileIntW "GetPrivateProfileIntW" wstr, wstr, int, wstr

; uint GetPrivateProfileSectionW(winmdroot.Foundation.PCWSTR lpAppName, winmdroot.Foundation.PWSTR lpReturnedString, uint nSize, winmdroot.Foundation.PCWSTR lpFileName)
#cfunc GetPrivateProfileSectionW "GetPrivateProfileSectionW" wstr, wstr, int, wstr

; uint GetPrivateProfileSectionNamesW(winmdroot.Foundation.PWSTR lpszReturnBuffer, uint nSize, winmdroot.Foundation.PCWSTR lpFileName)
#cfunc GetPrivateProfileSectionNamesW "GetPrivateProfileSectionNamesW" wstr, int, wstr

; uint GetPrivateProfileString(winmdroot.Foundation.PCWSTR lpAppName, winmdroot.Foundation.PCWSTR lpKeyName, winmdroot.Foundation.PCWSTR lpDefault, winmdroot.Foundation.PWSTR lpReturnedString, uint nSize, winmdroot.Foundation.PCWSTR lpFileName)
#cfunc GetPrivateProfileStringW "GetPrivateProfileStringW" wstr, wstr, wstr, wstr, int, wstr

; winmdroot.Foundation.BOOL GetPrivateProfileStructW(winmdroot.Foundation.PCWSTR lpszSection, winmdroot.Foundation.PCWSTR lpszKey, [Optional] void* lpStruct, uint uSizeStruct, winmdroot.Foundation.PCWSTR szFile)
#cfunc GetPrivateProfileStructW "GetPrivateProfileStructW" wstr, wstr, intptr, int, wstr

; winmdroot.Foundation.FARPROC GetProcAddress(winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.PCSTR lpProcName)
#cfunc GetProcAddress "GetProcAddress" intptr, str

; winmdroot.Foundation.BOOL GetProcessAffinityMask(winmdroot.Foundation.HANDLE hProcess, nuint* lpProcessAffinityMask, nuint* lpSystemAffinityMask)
#cfunc GetProcessAffinityMask "GetProcessAffinityMask" intptr, var, var

; winmdroot.Foundation.BOOL GetProcessDEPPolicy(winmdroot.Foundation.HANDLE hProcess, uint* lpFlags, winmdroot.Foundation.BOOL* lpPermanent)
#cfunc GetProcessDEPPolicy "GetProcessDEPPolicy" intptr, var, var

; winmdroot.Foundation.BOOL GetProcessGroupAffinity(winmdroot.Foundation.HANDLE hProcess, ushort* GroupCount, ushort* GroupArray)
#cfunc GetProcessGroupAffinity "GetProcessGroupAffinity" intptr, var, var

; winmdroot.Foundation.BOOL GetProcessHandleCount(winmdroot.Foundation.HANDLE hProcess, uint* pdwHandleCount)
#cfunc GetProcessHandleCount "GetProcessHandleCount" intptr, var

; winmdroot.Foundation.HANDLE GetProcessHeap()
#cfunc GetProcessHeap "GetProcessHeap"

; uint GetProcessHeaps(uint NumberOfHeaps, winmdroot.Foundation.HANDLE* ProcessHeaps)
#cfunc GetProcessHeaps "GetProcessHeaps" int, intptr

; uint GetProcessId(winmdroot.Foundation.HANDLE Process)
#cfunc GetProcessId "GetProcessId" intptr

; uint GetProcessIdOfThread(winmdroot.Foundation.HANDLE Thread)
#cfunc GetProcessIdOfThread "GetProcessIdOfThread" intptr

; winmdroot.Foundation.BOOL GetProcessInformation(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.Threading.PROCESS_INFORMATION_CLASS ProcessInformationClass, void* ProcessInformation, uint ProcessInformationSize)
#cfunc GetProcessInformation "GetProcessInformation" intptr, int, intptr, int

; winmdroot.Foundation.BOOL GetProcessIoCounters(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.Threading.IO_COUNTERS* lpIoCounters)
#cfunc GetProcessIoCounters "GetProcessIoCounters" intptr, var

; winmdroot.Foundation.BOOL GetProcessPreferredUILanguages(uint dwFlags, uint* pulNumLanguages, winmdroot.Foundation.PZZWSTR pwszLanguagesBuffer, uint* pcchLanguagesBuffer)
#cfunc GetProcessPreferredUILanguages "GetProcessPreferredUILanguages" int, var, int, var

; winmdroot.Foundation.BOOL GetProcessPriorityBoost(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.BOOL* pDisablePriorityBoost)
#cfunc GetProcessPriorityBoost "GetProcessPriorityBoost" intptr, var

; winmdroot.Foundation.BOOL GetProcessShutdownParameters(uint* lpdwLevel, uint* lpdwFlags)
#cfunc GetProcessShutdownParameters "GetProcessShutdownParameters" var, var

; winmdroot.Foundation.BOOL GetProcessTimes(winmdroot.Foundation.HANDLE hProcess, global::System.Runtime.InteropServices.ComTypes.FILETIME* lpCreationTime, global::System.Runtime.InteropServices.ComTypes.FILETIME* lpExitTime, global::System.Runtime.InteropServices.ComTypes.FILETIME* lpKernelTime, global::System.Runtime.InteropServices.ComTypes.FILETIME* lpUserTime)
#cfunc GetProcessTimes "GetProcessTimes" intptr, var, var, var, var

; uint GetProcessVersion(uint ProcessId)
#cfunc GetProcessVersion "GetProcessVersion" int

; winmdroot.Foundation.BOOL GetProcessWorkingSetSize(winmdroot.Foundation.HANDLE hProcess, nuint* lpMinimumWorkingSetSize, nuint* lpMaximumWorkingSetSize)
#cfunc GetProcessWorkingSetSize "GetProcessWorkingSetSize" intptr, var, var

; winmdroot.Foundation.BOOL GetProcessWorkingSetSizeEx(winmdroot.Foundation.HANDLE hProcess, nuint* lpMinimumWorkingSetSize, nuint* lpMaximumWorkingSetSize, uint* Flags)
#cfunc GetProcessWorkingSetSizeEx "GetProcessWorkingSetSizeEx" intptr, var, var, var

; winmdroot.Foundation.BOOL GetProductInfo(uint dwOSMajorVersion, uint dwOSMinorVersion, uint dwSpMajorVersion, uint dwSpMinorVersion, winmdroot.System.SystemInformation.OS_PRODUCT_TYPE* pdwReturnedProductType)
#cfunc GetProductInfo "GetProductInfo" int, int, int, int, var

; uint GetProfileIntW(winmdroot.Foundation.PCWSTR lpAppName, winmdroot.Foundation.PCWSTR lpKeyName, int nDefault)
#cfunc GetProfileIntW "GetProfileIntW" wstr, wstr, int

; uint GetProfileSectionW(winmdroot.Foundation.PCWSTR lpAppName, winmdroot.Foundation.PWSTR lpReturnedString, uint nSize)
#cfunc GetProfileSectionW "GetProfileSectionW" wstr, wstr, int

; uint GetProfileStringW(winmdroot.Foundation.PCWSTR lpAppName, winmdroot.Foundation.PCWSTR lpKeyName, winmdroot.Foundation.PCWSTR lpDefault, winmdroot.Foundation.PWSTR lpReturnedString, uint nSize)
#cfunc GetProfileStringW "GetProfileStringW" wstr, wstr, wstr, wstr, int

; winmdroot.Foundation.BOOL GetQueuedCompletionStatus(winmdroot.Foundation.HANDLE CompletionPort, uint* lpNumberOfBytesTransferred, nuint* lpCompletionKey, global::System.Threading.NativeOverlapped** lpOverlapped, uint dwMilliseconds)
#cfunc GetQueuedCompletionStatus "GetQueuedCompletionStatus" intptr, var, var, var, int

; winmdroot.Foundation.BOOL GetQueuedCompletionStatusEx(winmdroot.Foundation.HANDLE CompletionPort, winmdroot.System.IO.OVERLAPPED_ENTRY* lpCompletionPortEntries, uint ulCount, uint* ulNumEntriesRemoved, uint dwMilliseconds, winmdroot.Foundation.BOOL fAlertable)
#cfunc GetQueuedCompletionStatusEx "GetQueuedCompletionStatusEx" intptr, var, int, var, int, int

; uint GetShortPathName(winmdroot.Foundation.PCWSTR lpszLongPath, winmdroot.Foundation.PWSTR lpszShortPath, uint cchBuffer)
#cfunc GetShortPathNameW "GetShortPathNameW" wstr, wstr, int

; void GetStartupInfoW(winmdroot.System.Threading.STARTUPINFOW* lpStartupInfo)
#func GetStartupInfoW "GetStartupInfoW" var

; winmdroot.Foundation.HANDLE GetStdHandle(winmdroot.System.Console.STD_HANDLE nStdHandle)
#cfunc GetStdHandle "GetStdHandle" int

; int GetStringScripts(uint dwFlags, winmdroot.Foundation.PCWSTR lpString, int cchString, winmdroot.Foundation.PWSTR lpScripts, int cchScripts)
#cfunc GetStringScripts "GetStringScripts" int, wstr, int, wstr, int

; winmdroot.Foundation.BOOL GetStringType(uint dwInfoType, winmdroot.Foundation.PCWSTR lpSrcStr, int cchSrc, ushort* lpCharType)
#cfunc GetStringTypeW "GetStringTypeW" int, wstr, int, var

; winmdroot.Foundation.BOOL GetStringTypeEx(uint Locale, uint dwInfoType, winmdroot.Foundation.PCWSTR lpSrcStr, int cchSrc, ushort* lpCharType)
#cfunc GetStringTypeExW "GetStringTypeExW" int, int, wstr, int, var

; winmdroot.System.SystemInformation.DEP_SYSTEM_POLICY_TYPE GetSystemDEPPolicy()
#cfunc GetSystemDEPPolicy "GetSystemDEPPolicy"

; uint GetSystemDefaultLCID()
#cfunc GetSystemDefaultLCID "GetSystemDefaultLCID"

; ushort GetSystemDefaultLangID()
#cfunc GetSystemDefaultLangID "GetSystemDefaultLangID"

; int GetSystemDefaultLocaleName(winmdroot.Foundation.PWSTR lpLocaleName, int cchLocaleName)
#cfunc GetSystemDefaultLocaleName "GetSystemDefaultLocaleName" wstr, int

; ushort GetSystemDefaultUILanguage()
#cfunc GetSystemDefaultUILanguage "GetSystemDefaultUILanguage"

; uint GetSystemDirectory(winmdroot.Foundation.PWSTR lpBuffer, uint uSize)
#cfunc GetSystemDirectoryW "GetSystemDirectoryW" wstr, int

; winmdroot.Foundation.BOOL GetSystemFileCacheSize(nuint* lpMinimumFileCacheSize, nuint* lpMaximumFileCacheSize, uint* lpFlags)
#cfunc GetSystemFileCacheSize "GetSystemFileCacheSize" var, var, var

; uint GetSystemFirmwareTable(winmdroot.System.SystemInformation.FIRMWARE_TABLE_PROVIDER FirmwareTableProviderSignature, uint FirmwareTableID, [Optional] byte* pFirmwareTableBuffer, uint BufferSize)
#cfunc GetSystemFirmwareTable "GetSystemFirmwareTable" int, int, var, int

; void GetSystemInfo(winmdroot.System.SystemInformation.SYSTEM_INFO* lpSystemInfo)
#func GetSystemInfo "GetSystemInfo" var

; winmdroot.Foundation.BOOL GetSystemPowerStatus(winmdroot.System.Power.SYSTEM_POWER_STATUS* lpSystemPowerStatus)
#cfunc GetSystemPowerStatus "GetSystemPowerStatus" var

; winmdroot.Foundation.BOOL GetSystemPreferredUILanguages(uint dwFlags, uint* pulNumLanguages, winmdroot.Foundation.PZZWSTR pwszLanguagesBuffer, uint* pcchLanguagesBuffer)
#cfunc GetSystemPreferredUILanguages "GetSystemPreferredUILanguages" int, var, int, var

; winmdroot.Foundation.BOOL GetSystemRegistryQuota([Optional] uint* pdwQuotaAllowed, [Optional] uint* pdwQuotaUsed)
#cfunc GetSystemRegistryQuota "GetSystemRegistryQuota" var, var

; void GetSystemTime(winmdroot.Foundation.SYSTEMTIME* lpSystemTime)
#func GetSystemTime "GetSystemTime" var

; winmdroot.Foundation.BOOL GetSystemTimeAdjustment(uint* lpTimeAdjustment, uint* lpTimeIncrement, winmdroot.Foundation.BOOL* lpTimeAdjustmentDisabled)
#cfunc GetSystemTimeAdjustment "GetSystemTimeAdjustment" var, var, var

; void GetSystemTimeAsFileTime(global::System.Runtime.InteropServices.ComTypes.FILETIME* lpSystemTimeAsFileTime)
#func GetSystemTimeAsFileTime "GetSystemTimeAsFileTime" var

; void GetSystemTimePreciseAsFileTime(global::System.Runtime.InteropServices.ComTypes.FILETIME* lpSystemTimeAsFileTime)
#func GetSystemTimePreciseAsFileTime "GetSystemTimePreciseAsFileTime" var

; winmdroot.Foundation.BOOL GetSystemTimes([Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* lpIdleTime, [Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* lpKernelTime, [Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* lpUserTime)
#cfunc GetSystemTimes "GetSystemTimes" var, var, var

; uint GetSystemWindowsDirectory(winmdroot.Foundation.PWSTR lpBuffer, uint uSize)
#cfunc GetSystemWindowsDirectoryW "GetSystemWindowsDirectoryW" wstr, int

; uint GetSystemWow64Directory(winmdroot.Foundation.PWSTR lpBuffer, uint uSize)
#cfunc GetSystemWow64DirectoryW "GetSystemWow64DirectoryW" wstr, int

; uint GetTapeParameters(winmdroot.Foundation.HANDLE hDevice, winmdroot.Storage.FileSystem.GET_TAPE_DRIVE_PARAMETERS_OPERATION dwOperation, uint* lpdwSize, void* lpTapeInformation)
#cfunc GetTapeParameters "GetTapeParameters" intptr, int, var, intptr

; uint GetTapePosition(winmdroot.Foundation.HANDLE hDevice, winmdroot.Storage.FileSystem.TAPE_POSITION_TYPE dwPositionType, uint* lpdwPartition, uint* lpdwOffsetLow, uint* lpdwOffsetHigh)
#cfunc GetTapePosition "GetTapePosition" intptr, int, var, var, var

; uint GetTapeStatus(winmdroot.Foundation.HANDLE hDevice)
#cfunc GetTapeStatus "GetTapeStatus" intptr

; uint GetTempFileName(winmdroot.Foundation.PCWSTR lpPathName, winmdroot.Foundation.PCWSTR lpPrefixString, uint uUnique, winmdroot.Foundation.PWSTR lpTempFileName)
#cfunc GetTempFileNameW "GetTempFileNameW" wstr, wstr, int, wstr

; uint GetTempPath(uint nBufferLength, winmdroot.Foundation.PWSTR lpBuffer)
#cfunc GetTempPathW "GetTempPathW" int, wstr

; uint GetThreadErrorMode()
#cfunc GetThreadErrorMode "GetThreadErrorMode"

; winmdroot.Foundation.BOOL GetThreadGroupAffinity(winmdroot.Foundation.HANDLE hThread, winmdroot.System.SystemInformation.GROUP_AFFINITY* GroupAffinity)
#cfunc GetThreadGroupAffinity "GetThreadGroupAffinity" intptr, var

; winmdroot.Foundation.BOOL GetThreadIOPendingFlag(winmdroot.Foundation.HANDLE hThread, winmdroot.Foundation.BOOL* lpIOIsPending)
#cfunc GetThreadIOPendingFlag "GetThreadIOPendingFlag" intptr, var

; uint GetThreadId(winmdroot.Foundation.HANDLE Thread)
#cfunc GetThreadId "GetThreadId" intptr

; winmdroot.Foundation.BOOL GetThreadIdealProcessorEx(winmdroot.Foundation.HANDLE hThread, winmdroot.System.Kernel.PROCESSOR_NUMBER* lpIdealProcessor)
#cfunc GetThreadIdealProcessorEx "GetThreadIdealProcessorEx" intptr, var

; winmdroot.Foundation.BOOL GetThreadInformation(winmdroot.Foundation.HANDLE hThread, winmdroot.System.Threading.THREAD_INFORMATION_CLASS ThreadInformationClass, void* ThreadInformation, uint ThreadInformationSize)
#cfunc GetThreadInformation "GetThreadInformation" intptr, int, intptr, int

; uint GetThreadLocale()
#cfunc GetThreadLocale "GetThreadLocale"

; winmdroot.Foundation.BOOL GetThreadPreferredUILanguages(uint dwFlags, uint* pulNumLanguages, winmdroot.Foundation.PZZWSTR pwszLanguagesBuffer, uint* pcchLanguagesBuffer)
#cfunc GetThreadPreferredUILanguages "GetThreadPreferredUILanguages" int, var, int, var

; int GetThreadPriority(winmdroot.Foundation.HANDLE hThread)
#cfunc GetThreadPriority "GetThreadPriority" intptr

; winmdroot.Foundation.BOOL GetThreadPriorityBoost(winmdroot.Foundation.HANDLE hThread, winmdroot.Foundation.BOOL* pDisablePriorityBoost)
#cfunc GetThreadPriorityBoost "GetThreadPriorityBoost" intptr, var

; winmdroot.Foundation.BOOL GetThreadSelectorEntry(winmdroot.Foundation.HANDLE hThread, uint dwSelector, winmdroot.System.Diagnostics.Debug.LDT_ENTRY* lpSelectorEntry)
#cfunc GetThreadSelectorEntry "GetThreadSelectorEntry" intptr, int, var

; winmdroot.Foundation.BOOL GetThreadTimes(winmdroot.Foundation.HANDLE hThread, global::System.Runtime.InteropServices.ComTypes.FILETIME* lpCreationTime, global::System.Runtime.InteropServices.ComTypes.FILETIME* lpExitTime, global::System.Runtime.InteropServices.ComTypes.FILETIME* lpKernelTime, global::System.Runtime.InteropServices.ComTypes.FILETIME* lpUserTime)
#cfunc GetThreadTimes "GetThreadTimes" intptr, var, var, var, var

; ushort GetThreadUILanguage()
#cfunc GetThreadUILanguage "GetThreadUILanguage"

; uint GetTickCount()
#cfunc GetTickCount "GetTickCount"

; ulong GetTickCount64()
#cfunc GetTickCount64 "GetTickCount64"

; int GetTimeFormat(uint Locale, uint dwFlags, [Optional] winmdroot.Foundation.SYSTEMTIME* lpTime, winmdroot.Foundation.PCWSTR lpFormat, winmdroot.Foundation.PWSTR lpTimeStr, int cchTime)
#cfunc GetTimeFormatW "GetTimeFormatW" int, int, var, wstr, wstr, int

; int GetTimeFormatEx(winmdroot.Foundation.PCWSTR lpLocaleName, winmdroot.Globalization.TIME_FORMAT_FLAGS dwFlags, [Optional] winmdroot.Foundation.SYSTEMTIME* lpTime, winmdroot.Foundation.PCWSTR lpFormat, winmdroot.Foundation.PWSTR lpTimeStr, int cchTime)
#cfunc GetTimeFormatEx "GetTimeFormatEx" wstr, int, var, wstr, wstr, int

; uint GetTimeZoneInformation(winmdroot.System.Time.TIME_ZONE_INFORMATION* lpTimeZoneInformation)
#cfunc GetTimeZoneInformation "GetTimeZoneInformation" var

; winmdroot.Foundation.BOOL GetTimeZoneInformationForYear(ushort wYear, [Optional] winmdroot.System.Time.DYNAMIC_TIME_ZONE_INFORMATION* pdtzi, winmdroot.System.Time.TIME_ZONE_INFORMATION* ptzi)
#cfunc GetTimeZoneInformationForYear "GetTimeZoneInformationForYear" int, var, var

; winmdroot.Foundation.BOOL GetUILanguageInfo(uint dwFlags, winmdroot.Foundation.PCZZWSTR pwmszLanguage, winmdroot.Foundation.PZZWSTR pwszFallbackLanguages, [Optional] uint* pcchFallbackLanguages, uint* pAttributes)
#cfunc GetUILanguageInfo "GetUILanguageInfo" int, int, int, var, var

; winmdroot.Foundation.BOOL GetUmsCompletionListEvent(void* UmsCompletionList, winmdroot.Foundation.HANDLE* UmsCompletionEvent)
#cfunc GetUmsCompletionListEvent "GetUmsCompletionListEvent" intptr, intptr

; winmdroot.Foundation.BOOL GetUmsSystemThreadInformation(winmdroot.Foundation.HANDLE ThreadHandle, winmdroot.System.Threading.UMS_SYSTEM_THREAD_INFORMATION* SystemThreadInfo)
#cfunc GetUmsSystemThreadInformation "GetUmsSystemThreadInformation" intptr, var

; int GetUserDefaultGeoName(winmdroot.Foundation.PWSTR geoName, int geoNameCount)
#cfunc GetUserDefaultGeoName "GetUserDefaultGeoName" wstr, int

; uint GetUserDefaultLCID()
#cfunc GetUserDefaultLCID "GetUserDefaultLCID"

; ushort GetUserDefaultLangID()
#cfunc GetUserDefaultLangID "GetUserDefaultLangID"

; int GetUserDefaultLocaleName(winmdroot.Foundation.PWSTR lpLocaleName, int cchLocaleName)
#cfunc GetUserDefaultLocaleName "GetUserDefaultLocaleName" wstr, int

; ushort GetUserDefaultUILanguage()
#cfunc GetUserDefaultUILanguage "GetUserDefaultUILanguage"

; int GetUserGeoID(winmdroot.Globalization.SYSGEOCLASS GeoClass)
#cfunc GetUserGeoID "GetUserGeoID" int

; winmdroot.Foundation.BOOL GetUserPreferredUILanguages(uint dwFlags, uint* pulNumLanguages, winmdroot.Foundation.PZZWSTR pwszLanguagesBuffer, uint* pcchLanguagesBuffer)
#cfunc GetUserPreferredUILanguages "GetUserPreferredUILanguages" int, var, int, var

; uint GetVersion()
#cfunc GetVersion "GetVersion"

; winmdroot.Foundation.BOOL GetVersionEx(winmdroot.System.SystemInformation.OSVERSIONINFOW* lpVersionInformation)
#cfunc GetVersionExW "GetVersionExW" var

; winmdroot.Foundation.BOOL GetVolumeInformation(winmdroot.Foundation.PCWSTR lpRootPathName, winmdroot.Foundation.PWSTR lpVolumeNameBuffer, uint nVolumeNameSize, [Optional] uint* lpVolumeSerialNumber, [Optional] uint* lpMaximumComponentLength, [Optional] uint* lpFileSystemFlags, winmdroot.Foundation.PWSTR lpFileSystemNameBuffer, uint nFileSystemNameSize)
#cfunc GetVolumeInformationW "GetVolumeInformationW" wstr, wstr, int, var, var, var, wstr, int

; winmdroot.Foundation.BOOL GetVolumeInformationByHandle(winmdroot.Foundation.HANDLE hFile, winmdroot.Foundation.PWSTR lpVolumeNameBuffer, uint nVolumeNameSize, [Optional] uint* lpVolumeSerialNumber, [Optional] uint* lpMaximumComponentLength, [Optional] uint* lpFileSystemFlags, winmdroot.Foundation.PWSTR lpFileSystemNameBuffer, uint nFileSystemNameSize)
#cfunc GetVolumeInformationByHandleW "GetVolumeInformationByHandleW" intptr, wstr, int, var, var, var, wstr, int

; winmdroot.Foundation.BOOL GetVolumeNameForVolumeMountPoint(winmdroot.Foundation.PCWSTR lpszVolumeMountPoint, winmdroot.Foundation.PWSTR lpszVolumeName, uint cchBufferLength)
#cfunc GetVolumeNameForVolumeMountPointW "GetVolumeNameForVolumeMountPointW" wstr, wstr, int

; winmdroot.Foundation.BOOL GetVolumePathName(winmdroot.Foundation.PCWSTR lpszFileName, winmdroot.Foundation.PWSTR lpszVolumePathName, uint cchBufferLength)
#cfunc GetVolumePathNameW "GetVolumePathNameW" wstr, wstr, int

; winmdroot.Foundation.BOOL GetVolumePathNamesForVolumeName(winmdroot.Foundation.PCWSTR lpszVolumeName, winmdroot.Foundation.PZZWSTR lpszVolumePathNames, uint cchBufferLength, uint* lpcchReturnLength)
#cfunc GetVolumePathNamesForVolumeNameW "GetVolumePathNamesForVolumeNameW" wstr, int, int, var

; uint GetWindowsDirectory(winmdroot.Foundation.PWSTR lpBuffer, uint uSize)
#cfunc GetWindowsDirectoryW "GetWindowsDirectoryW" wstr, int

; uint GetWriteWatch(uint dwFlags, void* lpBaseAddress, nuint dwRegionSize, [Optional] void** lpAddresses, [Optional] nuint* lpdwCount, [Optional] uint* lpdwGranularity)
#cfunc GetWriteWatch "GetWriteWatch" int, intptr, int, var, var, var

; ushort GlobalAddAtom(winmdroot.Foundation.PCWSTR lpString)
#cfunc GlobalAddAtomW "GlobalAddAtomW" wstr

; ushort GlobalAddAtomEx(winmdroot.Foundation.PCWSTR lpString, uint Flags)
#cfunc GlobalAddAtomExW "GlobalAddAtomExW" wstr, int

; winmdroot.Foundation.HGLOBAL GlobalAlloc(winmdroot.System.Memory.GLOBAL_ALLOC_FLAGS uFlags, nuint dwBytes)
#cfunc GlobalAlloc "GlobalAlloc" int, int

; nuint GlobalCompact(uint dwMinFree)
#cfunc GlobalCompact "GlobalCompact" int

; ushort GlobalDeleteAtom(ushort nAtom)
#cfunc GlobalDeleteAtom "GlobalDeleteAtom" int

; ushort GlobalFindAtom(winmdroot.Foundation.PCWSTR lpString)
#cfunc GlobalFindAtomW "GlobalFindAtomW" wstr

; void GlobalFix(winmdroot.Foundation.HGLOBAL hMem)
#func GlobalFix "GlobalFix" int

; uint GlobalFlags(winmdroot.Foundation.HGLOBAL hMem)
#cfunc GlobalFlags "GlobalFlags" int

; uint GlobalGetAtomName(ushort nAtom, winmdroot.Foundation.PWSTR lpBuffer, int nSize)
#cfunc GlobalGetAtomNameW "GlobalGetAtomNameW" int, wstr, int

; winmdroot.Foundation.HGLOBAL GlobalHandle(void* pMem)
#cfunc GlobalHandle "GlobalHandle" intptr

; void* GlobalLock(winmdroot.Foundation.HGLOBAL hMem)
#cfunc GlobalLock "GlobalLock" int

; void GlobalMemoryStatus(winmdroot.System.SystemInformation.MEMORYSTATUS* lpBuffer)
#func GlobalMemoryStatus "GlobalMemoryStatus" var

; winmdroot.Foundation.BOOL GlobalMemoryStatusEx(winmdroot.System.SystemInformation.MEMORYSTATUSEX* lpBuffer)
#cfunc GlobalMemoryStatusEx "GlobalMemoryStatusEx" var

; winmdroot.Foundation.HGLOBAL GlobalReAlloc(winmdroot.Foundation.HGLOBAL hMem, nuint dwBytes, uint uFlags)
#cfunc GlobalReAlloc "GlobalReAlloc" int, int, int

; nuint GlobalSize(winmdroot.Foundation.HGLOBAL hMem)
#cfunc GlobalSize "GlobalSize" int

; winmdroot.Foundation.BOOL GlobalUnWire(winmdroot.Foundation.HGLOBAL hMem)
#cfunc GlobalUnWire "GlobalUnWire" int

; void GlobalUnfix(winmdroot.Foundation.HGLOBAL hMem)
#func GlobalUnfix "GlobalUnfix" int

; winmdroot.Foundation.BOOL GlobalUnlock(winmdroot.Foundation.HGLOBAL hMem)
#cfunc GlobalUnlock "GlobalUnlock" int

; void* GlobalWire(winmdroot.Foundation.HGLOBAL hMem)
#cfunc GlobalWire "GlobalWire" int

; winmdroot.Foundation.BOOL Heap32First(winmdroot.System.Diagnostics.ToolHelp.HEAPENTRY32* lphe, uint th32ProcessID, nuint th32HeapID)
#cfunc Heap32First "Heap32First" var, int, int

; winmdroot.Foundation.BOOL Heap32ListFirst(winmdroot.Foundation.HANDLE hSnapshot, winmdroot.System.Diagnostics.ToolHelp.HEAPLIST32* lphl)
#cfunc Heap32ListFirst "Heap32ListFirst" intptr, var

; winmdroot.Foundation.BOOL Heap32ListNext(winmdroot.Foundation.HANDLE hSnapshot, winmdroot.System.Diagnostics.ToolHelp.HEAPLIST32* lphl)
#cfunc Heap32ListNext "Heap32ListNext" intptr, var

; winmdroot.Foundation.BOOL Heap32Next(winmdroot.System.Diagnostics.ToolHelp.HEAPENTRY32* lphe)
#cfunc Heap32Next "Heap32Next" var

; nuint HeapCompact(winmdroot.Foundation.HANDLE hHeap, winmdroot.System.Memory.HEAP_FLAGS dwFlags)
#cfunc HeapCompact "HeapCompact" intptr, int

; winmdroot.Foundation.HANDLE HeapCreate(winmdroot.System.Memory.HEAP_FLAGS flOptions, nuint dwInitialSize, nuint dwMaximumSize)
#cfunc HeapCreate "HeapCreate" int, int, int

; winmdroot.Foundation.BOOL HeapDestroy(winmdroot.Foundation.HANDLE hHeap)
#cfunc HeapDestroy "HeapDestroy" intptr

; winmdroot.Foundation.BOOL HeapFree(winmdroot.Foundation.HANDLE hHeap, winmdroot.System.Memory.HEAP_FLAGS dwFlags, [Optional] void* lpMem)
#cfunc HeapFree "HeapFree" intptr, int, intptr

; winmdroot.Foundation.BOOL HeapLock(winmdroot.Foundation.HANDLE hHeap)
#cfunc HeapLock "HeapLock" intptr

; winmdroot.Foundation.BOOL HeapQueryInformation(winmdroot.Foundation.HANDLE HeapHandle, winmdroot.System.Memory.HEAP_INFORMATION_CLASS HeapInformationClass, [Optional] void* HeapInformation, nuint HeapInformationLength, [Optional] nuint* ReturnLength)
#cfunc HeapQueryInformation "HeapQueryInformation" intptr, int, intptr, int, var

; winmdroot.Foundation.BOOL HeapSetInformation(winmdroot.Foundation.HANDLE HeapHandle, winmdroot.System.Memory.HEAP_INFORMATION_CLASS HeapInformationClass, [Optional] void* HeapInformation, nuint HeapInformationLength)
#cfunc HeapSetInformation "HeapSetInformation" intptr, int, intptr, int

; winmdroot.Foundation.BOOL HeapSummary(winmdroot.Foundation.HANDLE hHeap, uint dwFlags, winmdroot.System.Memory.HEAP_SUMMARY* lpSummary)
#cfunc HeapSummary "HeapSummary" intptr, int, var

; winmdroot.Foundation.BOOL HeapUnlock(winmdroot.Foundation.HANDLE hHeap)
#cfunc HeapUnlock "HeapUnlock" intptr

; winmdroot.Foundation.BOOL HeapValidate(winmdroot.Foundation.HANDLE hHeap, winmdroot.System.Memory.HEAP_FLAGS dwFlags, [Optional] void* lpMem)
#cfunc HeapValidate "HeapValidate" intptr, int, intptr

; winmdroot.Foundation.BOOL HeapWalk(winmdroot.Foundation.HANDLE hHeap, winmdroot.System.Memory.PROCESS_HEAP_ENTRY* lpEntry)
#cfunc HeapWalk "HeapWalk" intptr, var

; int IdnToNameprepUnicode(uint dwFlags, winmdroot.Foundation.PCWSTR lpUnicodeCharStr, int cchUnicodeChar, winmdroot.Foundation.PWSTR lpNameprepCharStr, int cchNameprepChar)
#cfunc IdnToNameprepUnicode "IdnToNameprepUnicode" int, wstr, int, wstr, int

; winmdroot.Foundation.BOOL InitAtomTable(uint nSize)
#cfunc InitAtomTable "InitAtomTable" int

; winmdroot.Foundation.BOOL InitializeCriticalSectionAndSpinCount(winmdroot.System.Threading.CRITICAL_SECTION* lpCriticalSection, uint dwSpinCount)
#cfunc InitializeCriticalSectionAndSpinCount "InitializeCriticalSectionAndSpinCount" var, int

; winmdroot.Foundation.BOOL InitializeCriticalSectionEx(winmdroot.System.Threading.CRITICAL_SECTION* lpCriticalSection, uint dwSpinCount, uint Flags)
#cfunc InitializeCriticalSectionEx "InitializeCriticalSectionEx" var, int, int

; winmdroot.Foundation.BOOL InitializeSynchronizationBarrier(winmdroot.System.Threading.SYNCHRONIZATION_BARRIER* lpBarrier, int lTotalThreads, int lSpinCount)
#cfunc InitializeSynchronizationBarrier "InitializeSynchronizationBarrier" var, int, int

; winmdroot.Foundation.BOOL IsBadCodePtr(winmdroot.Foundation.FARPROC lpfn)
#cfunc IsBadCodePtr "IsBadCodePtr" var

; winmdroot.Foundation.BOOL IsBadHugeReadPtr([Optional] void* lp, nuint ucb)
#cfunc IsBadHugeReadPtr "IsBadHugeReadPtr" intptr, int

; winmdroot.Foundation.BOOL IsBadHugeWritePtr([Optional] void* lp, nuint ucb)
#cfunc IsBadHugeWritePtr "IsBadHugeWritePtr" intptr, int

; winmdroot.Foundation.BOOL IsBadReadPtr([Optional] void* lp, nuint ucb)
#cfunc IsBadReadPtr "IsBadReadPtr" intptr, int

; winmdroot.Foundation.BOOL IsBadStringPtrW(winmdroot.Foundation.PCWSTR lpsz, nuint ucchMax)
#cfunc IsBadStringPtrW "IsBadStringPtrW" wstr, int

; winmdroot.Foundation.BOOL IsBadWritePtr([Optional] void* lp, nuint ucb)
#cfunc IsBadWritePtr "IsBadWritePtr" intptr, int

; winmdroot.Foundation.BOOL IsCalendarLeapYear(uint calId, uint year, uint era)
#cfunc IsCalendarLeapYear "IsCalendarLeapYear" int, int, int

; winmdroot.Foundation.BOOL IsDBCSLeadByte(byte TestChar)
#cfunc IsDBCSLeadByte "IsDBCSLeadByte" int

; winmdroot.Foundation.BOOL IsDBCSLeadByteEx(uint CodePage, byte TestChar)
#cfunc IsDBCSLeadByteEx "IsDBCSLeadByteEx" int, int

; winmdroot.Foundation.BOOL IsDebuggerPresent()
#cfunc IsDebuggerPresent "IsDebuggerPresent"

; winmdroot.Foundation.BOOL IsNLSDefinedString(uint Function, uint dwFlags, winmdroot.Globalization.NLSVERSIONINFO* lpVersionInformation, winmdroot.Foundation.PCWSTR lpString, int cchStr)
#cfunc IsNLSDefinedString "IsNLSDefinedString" int, int, var, wstr, int

; winmdroot.Foundation.BOOL IsNativeVhdBoot(winmdroot.Foundation.BOOL* NativeVhdBoot)
#cfunc IsNativeVhdBoot "IsNativeVhdBoot" var

; winmdroot.Foundation.BOOL IsNormalizedString(winmdroot.Globalization.NORM_FORM NormForm, winmdroot.Foundation.PCWSTR lpString, int cwLength)
#cfunc IsNormalizedString "IsNormalizedString" int, wstr, int

; winmdroot.Foundation.BOOL IsProcessInJob(winmdroot.Foundation.HANDLE ProcessHandle, winmdroot.Foundation.HANDLE JobHandle, winmdroot.Foundation.BOOL* Result)
#cfunc IsProcessInJob "IsProcessInJob" intptr, intptr, var

; winmdroot.Foundation.BOOL IsProcessorFeaturePresent(winmdroot.System.Threading.PROCESSOR_FEATURE_ID ProcessorFeature)
#cfunc IsProcessorFeaturePresent "IsProcessorFeaturePresent" int

; winmdroot.Foundation.BOOL IsSystemResumeAutomatic()
#cfunc IsSystemResumeAutomatic "IsSystemResumeAutomatic"

; winmdroot.Foundation.BOOL IsThreadAFiber()
#cfunc IsThreadAFiber "IsThreadAFiber"

; winmdroot.Foundation.BOOL IsValidCodePage(uint CodePage)
#cfunc IsValidCodePage "IsValidCodePage" int

; winmdroot.Foundation.BOOL IsValidLanguageGroup(uint LanguageGroup, winmdroot.Globalization.ENUM_SYSTEM_LANGUAGE_GROUPS_FLAGS dwFlags)
#cfunc IsValidLanguageGroup "IsValidLanguageGroup" int, int

; winmdroot.Foundation.BOOL IsValidLocale(uint Locale, winmdroot.Globalization.IS_VALID_LOCALE_FLAGS dwFlags)
#cfunc IsValidLocale "IsValidLocale" int, int

; winmdroot.Foundation.BOOL IsValidLocaleName(winmdroot.Foundation.PCWSTR lpLocaleName)
#cfunc IsValidLocaleName "IsValidLocaleName" wstr

; uint IsValidNLSVersion(uint function, winmdroot.Foundation.PCWSTR lpLocaleName, winmdroot.Globalization.NLSVERSIONINFOEX* lpVersionInformation)
#cfunc IsValidNLSVersion "IsValidNLSVersion" int, wstr, var

; winmdroot.Foundation.BOOL IsWow64Process(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.BOOL* Wow64Process)
#cfunc IsWow64Process "IsWow64Process" intptr, var

; winmdroot.Foundation.BOOL K32EmptyWorkingSet(winmdroot.Foundation.HANDLE hProcess)
#cfunc K32EmptyWorkingSet "K32EmptyWorkingSet" intptr

; winmdroot.Foundation.BOOL K32EnumDeviceDrivers(void** lpImageBase, uint cb, uint* lpcbNeeded)
#cfunc K32EnumDeviceDrivers "K32EnumDeviceDrivers" var, int, var

; winmdroot.Foundation.BOOL K32EnumPageFilesW(delegate *unmanaged[Stdcall]<void*,winmdroot.System.ProcessStatus.ENUM_PAGE_FILE_INFORMATION*,winmdroot.Foundation.PCWSTR,global::Windows.Win32.Foundation.BOOL> pCallBackRoutine, void* pContext)
#cfunc K32EnumPageFilesW "K32EnumPageFilesW" int, intptr

; winmdroot.Foundation.BOOL K32EnumProcessModules(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.HMODULE* lphModule, uint cb, uint* lpcbNeeded)
#cfunc K32EnumProcessModules "K32EnumProcessModules" intptr, intptr, int, var

; winmdroot.Foundation.BOOL K32EnumProcessModulesEx(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.HMODULE* lphModule, uint cb, uint* lpcbNeeded, uint dwFilterFlag)
#cfunc K32EnumProcessModulesEx "K32EnumProcessModulesEx" intptr, intptr, int, var, int

; winmdroot.Foundation.BOOL K32EnumProcesses(uint* lpidProcess, uint cb, uint* lpcbNeeded)
#cfunc K32EnumProcesses "K32EnumProcesses" var, int, var

; uint K32GetDeviceDriverBaseNameW(void* ImageBase, winmdroot.Foundation.PWSTR lpBaseName, uint nSize)
#cfunc K32GetDeviceDriverBaseNameW "K32GetDeviceDriverBaseNameW" intptr, wstr, int

; uint K32GetDeviceDriverFileNameW(void* ImageBase, winmdroot.Foundation.PWSTR lpFilename, uint nSize)
#cfunc K32GetDeviceDriverFileNameW "K32GetDeviceDriverFileNameW" intptr, wstr, int

; uint K32GetMappedFileNameW(winmdroot.Foundation.HANDLE hProcess, void* lpv, winmdroot.Foundation.PWSTR lpFilename, uint nSize)
#cfunc K32GetMappedFileNameW "K32GetMappedFileNameW" intptr, intptr, wstr, int

; uint K32GetModuleBaseNameW(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.PWSTR lpBaseName, uint nSize)
#cfunc K32GetModuleBaseNameW "K32GetModuleBaseNameW" intptr, intptr, wstr, int

; uint K32GetModuleFileNameExW(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.PWSTR lpFilename, uint nSize)
#cfunc K32GetModuleFileNameExW "K32GetModuleFileNameExW" intptr, intptr, wstr, int

; winmdroot.Foundation.BOOL K32GetModuleInformation(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.HMODULE hModule, winmdroot.System.ProcessStatus.MODULEINFO* lpmodinfo, uint cb)
#cfunc K32GetModuleInformation "K32GetModuleInformation" intptr, intptr, var, int

; winmdroot.Foundation.BOOL K32GetPerformanceInfo(winmdroot.System.ProcessStatus.PERFORMANCE_INFORMATION* pPerformanceInformation, uint cb)
#cfunc K32GetPerformanceInfo "K32GetPerformanceInfo" var, int

; uint K32GetProcessImageFileNameW(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.PWSTR lpImageFileName, uint nSize)
#cfunc K32GetProcessImageFileNameW "K32GetProcessImageFileNameW" intptr, wstr, int

; winmdroot.Foundation.BOOL K32GetProcessMemoryInfo(winmdroot.Foundation.HANDLE Process, winmdroot.System.ProcessStatus.PROCESS_MEMORY_COUNTERS* ppsmemCounters, uint cb)
#cfunc K32GetProcessMemoryInfo "K32GetProcessMemoryInfo" intptr, var, int

; winmdroot.Foundation.BOOL K32GetWsChanges(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.ProcessStatus.PSAPI_WS_WATCH_INFORMATION* lpWatchInfo, uint cb)
#cfunc K32GetWsChanges "K32GetWsChanges" intptr, var, int

; winmdroot.Foundation.BOOL K32GetWsChangesEx(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.ProcessStatus.PSAPI_WS_WATCH_INFORMATION_EX* lpWatchInfoEx, uint* cb)
#cfunc K32GetWsChangesEx "K32GetWsChangesEx" intptr, var, var

; winmdroot.Foundation.BOOL K32InitializeProcessForWsWatch(winmdroot.Foundation.HANDLE hProcess)
#cfunc K32InitializeProcessForWsWatch "K32InitializeProcessForWsWatch" intptr

; winmdroot.Foundation.BOOL K32QueryWorkingSet(winmdroot.Foundation.HANDLE hProcess, void* pv, uint cb)
#cfunc K32QueryWorkingSet "K32QueryWorkingSet" intptr, intptr, int

; winmdroot.Foundation.BOOL K32QueryWorkingSetEx(winmdroot.Foundation.HANDLE hProcess, void* pv, uint cb)
#cfunc K32QueryWorkingSetEx "K32QueryWorkingSetEx" intptr, intptr, int

; int LCIDToLocaleName(uint Locale, winmdroot.Foundation.PWSTR lpName, int cchName, uint dwFlags)
#cfunc LCIDToLocaleName "LCIDToLocaleName" int, wstr, int, int

; int LCMapString(uint Locale, uint dwMapFlags, winmdroot.Foundation.PCWSTR lpSrcStr, int cchSrc, winmdroot.Foundation.PWSTR lpDestStr, int cchDest)
#cfunc LCMapStringW "LCMapStringW" int, int, wstr, int, wstr, int

; int LCMapStringEx(winmdroot.Foundation.PCWSTR lpLocaleName, uint dwMapFlags, winmdroot.Foundation.PCWSTR lpSrcStr, int cchSrc, winmdroot.Foundation.PWSTR lpDestStr, int cchDest, [Optional] winmdroot.Globalization.NLSVERSIONINFO* lpVersionInformation, [Optional] void* lpReserved, winmdroot.Foundation.LPARAM sortHandle)
#cfunc LCMapStringEx "LCMapStringEx" wstr, int, wstr, int, wstr, int, var, intptr, intptr

; void LZClose(int hFile)
#func LZClose "LZClose" int

; int LZCopy(int hfSource, int hfDest)
#cfunc LZCopy "LZCopy" int, int

; void LZDone()
#func LZDone "LZDone"

; int LZInit(int hfSource)
#cfunc LZInit "LZInit" int

; int LZOpenFileW(winmdroot.Foundation.PWSTR lpFileName, winmdroot.Storage.FileSystem.OFSTRUCT* lpReOpenBuf, winmdroot.Storage.FileSystem.LZOPENFILE_STYLE wStyle)
#cfunc LZOpenFileW "LZOpenFileW" wstr, var, int

; int LZRead(int hFile, winmdroot.Foundation.PSTR lpBuffer, int cbRead)
#cfunc LZRead "LZRead" int, str, int

; int LZSeek(int hFile, int lOffset, int iOrigin)
#cfunc LZSeek "LZSeek" int, int, int

; int LZStart()
#cfunc LZStart "LZStart"

; winmdroot.Foundation.HMODULE LoadLibrary(winmdroot.Foundation.PCWSTR lpLibFileName)
#cfunc LoadLibraryW "LoadLibraryW" wstr

; winmdroot.Foundation.HMODULE LoadLibraryEx(winmdroot.Foundation.PCWSTR lpLibFileName, winmdroot.Foundation.HANDLE hFile, winmdroot.System.LibraryLoader.LOAD_LIBRARY_FLAGS dwFlags)
#cfunc LoadLibraryExW "LoadLibraryExW" wstr, intptr, int

; uint LoadModule(winmdroot.Foundation.PCSTR lpModuleName, void* lpParameterBlock)
#cfunc LoadModule "LoadModule" str, intptr

; winmdroot.Foundation.HMODULE LoadPackagedLibrary(winmdroot.Foundation.PCWSTR lpwLibFileName, uint Reserved)
#cfunc LoadPackagedLibrary "LoadPackagedLibrary" wstr, int

; winmdroot.Foundation.HGLOBAL LoadResource(winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.HRSRC hResInfo)
#cfunc LoadResource "LoadResource" intptr, intptr

; winmdroot.Foundation.HLOCAL LocalFree(winmdroot.Foundation.HLOCAL hMem)
#cfunc LocalFree "LocalFree" int

; winmdroot.Foundation.HLOCAL LocalAlloc(winmdroot.System.Memory.LOCAL_ALLOC_FLAGS uFlags, nuint uBytes)
#cfunc LocalAlloc "LocalAlloc" int, int

; nuint LocalCompact(uint uMinFree)
#cfunc LocalCompact "LocalCompact" int

; winmdroot.Foundation.BOOL LocalFileTimeToFileTime(global::System.Runtime.InteropServices.ComTypes.FILETIME* lpLocalFileTime, global::System.Runtime.InteropServices.ComTypes.FILETIME* lpFileTime)
#cfunc LocalFileTimeToFileTime "LocalFileTimeToFileTime" var, var

; uint LocalFlags(winmdroot.Foundation.HLOCAL hMem)
#cfunc LocalFlags "LocalFlags" int

; winmdroot.Foundation.HLOCAL LocalHandle(void* pMem)
#cfunc LocalHandle "LocalHandle" intptr

; void* LocalLock(winmdroot.Foundation.HLOCAL hMem)
#cfunc LocalLock "LocalLock" int

; winmdroot.Foundation.HLOCAL LocalReAlloc(winmdroot.Foundation.HLOCAL hMem, nuint uBytes, uint uFlags)
#cfunc LocalReAlloc "LocalReAlloc" int, int, int

; nuint LocalShrink(winmdroot.Foundation.HLOCAL hMem, uint cbNewSize)
#cfunc LocalShrink "LocalShrink" int, int

; nuint LocalSize(winmdroot.Foundation.HLOCAL hMem)
#cfunc LocalSize "LocalSize" int

; winmdroot.Foundation.BOOL LocalUnlock(winmdroot.Foundation.HLOCAL hMem)
#cfunc LocalUnlock "LocalUnlock" int

; uint LocaleNameToLCID(winmdroot.Foundation.PCWSTR lpName, uint dwFlags)
#cfunc LocaleNameToLCID "LocaleNameToLCID" wstr, int

; winmdroot.Foundation.BOOL LockFile(winmdroot.Foundation.HANDLE hFile, uint dwFileOffsetLow, uint dwFileOffsetHigh, uint nNumberOfBytesToLockLow, uint nNumberOfBytesToLockHigh)
#cfunc LockFile "LockFile" intptr, int, int, int, int

; winmdroot.Foundation.BOOL LockFileEx(winmdroot.Foundation.HANDLE hFile, winmdroot.Storage.FileSystem.LOCK_FILE_FLAGS dwFlags, uint dwReserved, uint nNumberOfBytesToLockLow, uint nNumberOfBytesToLockHigh, global::System.Threading.NativeOverlapped* lpOverlapped)
#cfunc LockFileEx "LockFileEx" intptr, int, int, int, int, var

; void* LockResource(winmdroot.Foundation.HGLOBAL hResData)
#cfunc LockResource "LockResource" int

; winmdroot.Foundation.BOOL MapUserPhysicalPages(void* VirtualAddress, nuint NumberOfPages, [Optional] nuint* PageArray)
#cfunc MapUserPhysicalPages "MapUserPhysicalPages" intptr, int, var

; winmdroot.Foundation.BOOL MapUserPhysicalPagesScatter(void** VirtualAddresses, nuint NumberOfPages, [Optional] nuint* PageArray)
#cfunc MapUserPhysicalPagesScatter "MapUserPhysicalPagesScatter" var, int, var

; winmdroot.System.Memory.MEMORY_MAPPED_VIEW_ADDRESS MapViewOfFile(winmdroot.Foundation.HANDLE hFileMappingObject, winmdroot.System.Memory.FILE_MAP dwDesiredAccess, uint dwFileOffsetHigh, uint dwFileOffsetLow, nuint dwNumberOfBytesToMap)
#cfunc MapViewOfFile "MapViewOfFile" intptr, int, int, int, int

; winmdroot.System.Memory.MEMORY_MAPPED_VIEW_ADDRESS MapViewOfFileEx(winmdroot.Foundation.HANDLE hFileMappingObject, winmdroot.System.Memory.FILE_MAP dwDesiredAccess, uint dwFileOffsetHigh, uint dwFileOffsetLow, nuint dwNumberOfBytesToMap, [Optional] void* lpBaseAddress)
#cfunc MapViewOfFileEx "MapViewOfFileEx" intptr, int, int, int, int, intptr

; winmdroot.System.Memory.MEMORY_MAPPED_VIEW_ADDRESS MapViewOfFileExNuma(winmdroot.Foundation.HANDLE hFileMappingObject, winmdroot.System.Memory.FILE_MAP dwDesiredAccess, uint dwFileOffsetHigh, uint dwFileOffsetLow, nuint dwNumberOfBytesToMap, [Optional] void* lpBaseAddress, uint nndPreferred)
#cfunc MapViewOfFileExNuma "MapViewOfFileExNuma" intptr, int, int, int, int, intptr, int

; winmdroot.Foundation.BOOL Module32First(winmdroot.Foundation.HANDLE hSnapshot, winmdroot.System.Diagnostics.ToolHelp.MODULEENTRY32* lpme)
#cfunc Module32First "Module32First" intptr, var

; winmdroot.Foundation.BOOL Module32Next(winmdroot.Foundation.HANDLE hSnapshot, winmdroot.System.Diagnostics.ToolHelp.MODULEENTRY32* lpme)
#cfunc Module32Next "Module32Next" intptr, var

; winmdroot.Foundation.BOOL MoveFile(winmdroot.Foundation.PCWSTR lpExistingFileName, winmdroot.Foundation.PCWSTR lpNewFileName)
#cfunc MoveFileW "MoveFileW" wstr, wstr

; winmdroot.Foundation.BOOL MoveFileEx(winmdroot.Foundation.PCWSTR lpExistingFileName, winmdroot.Foundation.PCWSTR lpNewFileName, winmdroot.Storage.FileSystem.MOVE_FILE_FLAGS dwFlags)
#cfunc MoveFileExW "MoveFileExW" wstr, wstr, int

; winmdroot.Foundation.BOOL MoveFileTransacted(winmdroot.Foundation.PCWSTR lpExistingFileName, winmdroot.Foundation.PCWSTR lpNewFileName, delegate *unmanaged[Stdcall]<long,long,long,long,uint,global::Windows.Win32.Storage.FileSystem.LPPROGRESS_ROUTINE_CALLBACK_REASON,global::Windows.Win32.Foundation.HANDLE,global::Windows.Win32.Foundation.HANDLE,void*,uint> lpProgressRoutine, [Optional] void* lpData, winmdroot.Storage.FileSystem.MOVE_FILE_FLAGS dwFlags, winmdroot.Foundation.HANDLE hTransaction)
#cfunc MoveFileTransactedW "MoveFileTransactedW" wstr, wstr, int, intptr, int, intptr

; winmdroot.Foundation.BOOL MoveFileWithProgress(winmdroot.Foundation.PCWSTR lpExistingFileName, winmdroot.Foundation.PCWSTR lpNewFileName, delegate *unmanaged[Stdcall]<long,long,long,long,uint,global::Windows.Win32.Storage.FileSystem.LPPROGRESS_ROUTINE_CALLBACK_REASON,global::Windows.Win32.Foundation.HANDLE,global::Windows.Win32.Foundation.HANDLE,void*,uint> lpProgressRoutine, [Optional] void* lpData, winmdroot.Storage.FileSystem.MOVE_FILE_FLAGS dwFlags)
#cfunc MoveFileWithProgressW "MoveFileWithProgressW" wstr, wstr, int, intptr, int

; int MulDiv(int nNumber, int nNumerator, int nDenominator)
#cfunc MulDiv "MulDiv" int, int, int

; int MultiByteToWideChar(uint CodePage, winmdroot.Globalization.MULTI_BYTE_TO_WIDE_CHAR_FLAGS dwFlags, winmdroot.Foundation.PCSTR lpMultiByteStr, int cbMultiByte, winmdroot.Foundation.PWSTR lpWideCharStr, int cchWideChar)
#cfunc MultiByteToWideChar "MultiByteToWideChar" int, int, str, int, wstr, int

; winmdroot.Foundation.BOOL NeedCurrentDirectoryForExePathW(winmdroot.Foundation.PCWSTR ExeName)
#cfunc NeedCurrentDirectoryForExePathW "NeedCurrentDirectoryForExePathW" wstr

; int NormalizeString(winmdroot.Globalization.NORM_FORM NormForm, winmdroot.Foundation.PCWSTR lpSrcString, int cwSrcLength, winmdroot.Foundation.PWSTR lpDstString, int cwDstLength)
#cfunc NormalizeString "NormalizeString" int, wstr, int, wstr, int

; winmdroot.Foundation.BOOL NotifyUILanguageChange(uint dwFlags, winmdroot.Foundation.PCWSTR pcwstrNewLanguage, winmdroot.Foundation.PCWSTR pcwstrPreviousLanguage, uint dwReserved, [Optional] uint* pdwStatusRtrn)
#cfunc NotifyUILanguageChange "NotifyUILanguageChange" int, wstr, wstr, int, var

; winmdroot.Foundation.BOOL OOBEComplete(winmdroot.Foundation.BOOL* isOOBEComplete)
#cfunc OOBEComplete "OOBEComplete" var

; winmdroot.Foundation.HANDLE OpenEvent(winmdroot.System.Threading.SYNCHRONIZATION_ACCESS_RIGHTS dwDesiredAccess, winmdroot.Foundation.BOOL bInheritHandle, winmdroot.Foundation.PCWSTR lpName)
#cfunc OpenEventW "OpenEventW" int, int, wstr

; int OpenFile(winmdroot.Foundation.PCSTR lpFileName, winmdroot.Storage.FileSystem.OFSTRUCT* lpReOpenBuff, uint uStyle)
#cfunc OpenFile "OpenFile" str, var, int

; winmdroot.Foundation.HANDLE OpenFileById(winmdroot.Foundation.HANDLE hVolumeHint, winmdroot.Storage.FileSystem.FILE_ID_DESCRIPTOR* lpFileId, uint dwDesiredAccess, winmdroot.Storage.FileSystem.FILE_SHARE_MODE dwShareMode, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes, winmdroot.Storage.FileSystem.FILE_FLAGS_AND_ATTRIBUTES dwFlagsAndAttributes)
#cfunc OpenFileById "OpenFileById" intptr, var, int, int, var, int

; winmdroot.Foundation.HANDLE OpenFileMapping(uint dwDesiredAccess, winmdroot.Foundation.BOOL bInheritHandle, winmdroot.Foundation.PCWSTR lpName)
#cfunc OpenFileMappingW "OpenFileMappingW" int, int, wstr

; winmdroot.Foundation.HANDLE OpenJobObject(uint dwDesiredAccess, winmdroot.Foundation.BOOL bInheritHandle, winmdroot.Foundation.PCWSTR lpName)
#cfunc OpenJobObjectW "OpenJobObjectW" int, int, wstr

; winmdroot.Foundation.HANDLE OpenMutex(winmdroot.System.Threading.SYNCHRONIZATION_ACCESS_RIGHTS dwDesiredAccess, winmdroot.Foundation.BOOL bInheritHandle, winmdroot.Foundation.PCWSTR lpName)
#cfunc OpenMutexW "OpenMutexW" int, int, wstr

; winmdroot.Foundation.HANDLE OpenPrivateNamespaceW(void* lpBoundaryDescriptor, winmdroot.Foundation.PCWSTR lpAliasPrefix)
#cfunc OpenPrivateNamespaceW "OpenPrivateNamespaceW" intptr, wstr

; winmdroot.Foundation.HANDLE OpenProcess(winmdroot.System.Threading.PROCESS_ACCESS_RIGHTS dwDesiredAccess, winmdroot.Foundation.BOOL bInheritHandle, uint dwProcessId)
#cfunc OpenProcess "OpenProcess" int, int, int

; winmdroot.Foundation.HANDLE OpenSemaphore(winmdroot.System.Threading.SYNCHRONIZATION_ACCESS_RIGHTS dwDesiredAccess, winmdroot.Foundation.BOOL bInheritHandle, winmdroot.Foundation.PCWSTR lpName)
#cfunc OpenSemaphoreW "OpenSemaphoreW" int, int, wstr

; winmdroot.Foundation.HANDLE OpenThread(winmdroot.System.Threading.THREAD_ACCESS_RIGHTS dwDesiredAccess, winmdroot.Foundation.BOOL bInheritHandle, uint dwThreadId)
#cfunc OpenThread "OpenThread" int, int, int

; winmdroot.Foundation.HANDLE OpenWaitableTimer(winmdroot.System.Threading.SYNCHRONIZATION_ACCESS_RIGHTS dwDesiredAccess, winmdroot.Foundation.BOOL bInheritHandle, winmdroot.Foundation.PCWSTR lpTimerName)
#cfunc OpenWaitableTimerW "OpenWaitableTimerW" int, int, wstr

; void OutputDebugStringW(winmdroot.Foundation.PCWSTR lpOutputString)
#func OutputDebugStringW "OutputDebugStringW" wstr

; winmdroot.Foundation.BOOL PeekConsoleInput(winmdroot.Foundation.HANDLE hConsoleInput, winmdroot.System.Console.INPUT_RECORD* lpBuffer, uint nLength, uint* lpNumberOfEventsRead)
#cfunc PeekConsoleInputW "PeekConsoleInputW" intptr, var, int, var

; winmdroot.Foundation.BOOL PeekNamedPipe(winmdroot.Foundation.HANDLE hNamedPipe, [Optional] void* lpBuffer, uint nBufferSize, [Optional] uint* lpBytesRead, [Optional] uint* lpTotalBytesAvail, [Optional] uint* lpBytesLeftThisMessage)
#cfunc PeekNamedPipe "PeekNamedPipe" intptr, intptr, int, var, var, var

; winmdroot.Foundation.BOOL PostQueuedCompletionStatus(winmdroot.Foundation.HANDLE CompletionPort, uint dwNumberOfBytesTransferred, nuint dwCompletionKey, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped)
#cfunc PostQueuedCompletionStatus "PostQueuedCompletionStatus" intptr, int, int, var

; winmdroot.Foundation.BOOL PowerClearRequest(winmdroot.Foundation.HANDLE PowerRequest, winmdroot.System.Power.POWER_REQUEST_TYPE RequestType)
#cfunc PowerClearRequest "PowerClearRequest" intptr, int

; winmdroot.Foundation.HANDLE PowerCreateRequest(winmdroot.System.Threading.REASON_CONTEXT* Context)
#cfunc PowerCreateRequest "PowerCreateRequest" var

; winmdroot.Foundation.BOOL PowerSetRequest(winmdroot.Foundation.HANDLE PowerRequest, winmdroot.System.Power.POWER_REQUEST_TYPE RequestType)
#cfunc PowerSetRequest "PowerSetRequest" intptr, int

; uint PrepareTape(winmdroot.Foundation.HANDLE hDevice, winmdroot.Storage.FileSystem.PREPARE_TAPE_OPERATION dwOperation, winmdroot.Foundation.BOOL bImmediate)
#cfunc PrepareTape "PrepareTape" intptr, int, int

; winmdroot.Foundation.BOOL Process32First(winmdroot.Foundation.HANDLE hSnapshot, winmdroot.System.Diagnostics.ToolHelp.PROCESSENTRY32* lppe)
#cfunc Process32First "Process32First" intptr, var

; winmdroot.Foundation.BOOL Process32Next(winmdroot.Foundation.HANDLE hSnapshot, winmdroot.System.Diagnostics.ToolHelp.PROCESSENTRY32* lppe)
#cfunc Process32Next "Process32Next" intptr, var

; winmdroot.Foundation.BOOL ProcessIdToSessionId(uint dwProcessId, uint* pSessionId)
#cfunc ProcessIdToSessionId "ProcessIdToSessionId" int, var

; winmdroot.Foundation.BOOL PulseEvent(winmdroot.Foundation.HANDLE hEvent)
#cfunc PulseEvent "PulseEvent" intptr

; winmdroot.Foundation.BOOL PurgeComm(winmdroot.Foundation.HANDLE hFile, winmdroot.Devices.Communication.PURGE_COMM_FLAGS dwFlags)
#cfunc PurgeComm "PurgeComm" intptr, int

; winmdroot.Foundation.BOOL QueryActCtx(uint dwFlags, winmdroot.Foundation.HANDLE hActCtx, [Optional] void* pvSubInstance, uint ulInfoClass, [Optional] void* pvBuffer, nuint cbBuffer, [Optional] nuint* pcbWrittenOrRequired)
#cfunc QueryActCtxW "QueryActCtxW" int, intptr, intptr, int, intptr, int, var

; winmdroot.Foundation.BOOL QueryActCtxSettings(uint dwFlags, winmdroot.Foundation.HANDLE hActCtx, winmdroot.Foundation.PCWSTR settingsNameSpace, winmdroot.Foundation.PCWSTR settingName, winmdroot.Foundation.PWSTR pvBuffer, nuint dwBuffer, [Optional] nuint* pdwWrittenOrRequired)
#cfunc QueryActCtxSettingsW "QueryActCtxSettingsW" int, intptr, wstr, wstr, wstr, int, var

; uint QueryDosDevice(winmdroot.Foundation.PCWSTR lpDeviceName, winmdroot.Foundation.PWSTR lpTargetPath, uint ucchMax)
#cfunc QueryDosDeviceW "QueryDosDeviceW" wstr, wstr, int

; winmdroot.Foundation.BOOL QueryFullProcessImageName(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.Threading.PROCESS_NAME_FORMAT dwFlags, winmdroot.Foundation.PWSTR lpExeName, uint* lpdwSize)
#cfunc QueryFullProcessImageNameW "QueryFullProcessImageNameW" intptr, int, wstr, var

; winmdroot.Foundation.BOOL QueryIdleProcessorCycleTime(uint* BufferLength, [Optional] ulong* ProcessorIdleCycleTime)
#cfunc QueryIdleProcessorCycleTime "QueryIdleProcessorCycleTime" var, var

; winmdroot.Foundation.BOOL QueryIdleProcessorCycleTimeEx(ushort Group, uint* BufferLength, [Optional] ulong* ProcessorIdleCycleTime)
#cfunc QueryIdleProcessorCycleTimeEx "QueryIdleProcessorCycleTimeEx" int, var, var

; winmdroot.Foundation.BOOL QueryInformationJobObject(winmdroot.Foundation.HANDLE hJob, winmdroot.System.JobObjects.JOBOBJECTINFOCLASS JobObjectInformationClass, void* lpJobObjectInformation, uint cbJobObjectInformationLength, [Optional] uint* lpReturnLength)
#cfunc QueryInformationJobObject "QueryInformationJobObject" intptr, int, intptr, int, var

; uint QueryIoRateControlInformationJobObject(winmdroot.Foundation.HANDLE hJob, winmdroot.Foundation.PCWSTR VolumeName, winmdroot.System.JobObjects.JOBOBJECT_IO_RATE_CONTROL_INFORMATION** InfoBlocks, uint* InfoBlockCount)
#cfunc QueryIoRateControlInformationJobObject "QueryIoRateControlInformationJobObject" intptr, wstr, var, var

; winmdroot.Foundation.BOOL QueryMemoryResourceNotification(winmdroot.Foundation.HANDLE ResourceNotificationHandle, winmdroot.Foundation.BOOL* ResourceState)
#cfunc QueryMemoryResourceNotification "QueryMemoryResourceNotification" intptr, var

; winmdroot.Foundation.BOOL QueryPerformanceCounter(long* lpPerformanceCount)
#cfunc QueryPerformanceCounter "QueryPerformanceCounter" var

; winmdroot.Foundation.BOOL QueryPerformanceFrequency(long* lpFrequency)
#cfunc QueryPerformanceFrequency "QueryPerformanceFrequency" var

; winmdroot.Foundation.BOOL QueryProcessAffinityUpdateMode(winmdroot.Foundation.HANDLE hProcess, [Optional] winmdroot.System.Threading.PROCESS_AFFINITY_AUTO_UPDATE_FLAGS* lpdwFlags)
#cfunc QueryProcessAffinityUpdateMode "QueryProcessAffinityUpdateMode" intptr, var

; winmdroot.Foundation.BOOL QueryProcessCycleTime(winmdroot.Foundation.HANDLE ProcessHandle, ulong* CycleTime)
#cfunc QueryProcessCycleTime "QueryProcessCycleTime" intptr, var

; winmdroot.Foundation.BOOL QueryThreadCycleTime(winmdroot.Foundation.HANDLE ThreadHandle, ulong* CycleTime)
#cfunc QueryThreadCycleTime "QueryThreadCycleTime" intptr, var

; uint QueryThreadProfiling(winmdroot.Foundation.HANDLE ThreadHandle, winmdroot.Foundation.BOOLEAN* Enabled)
#cfunc QueryThreadProfiling "QueryThreadProfiling" intptr, var

; winmdroot.Foundation.BOOL QueryThreadpoolStackInformation(winmdroot.System.Threading.PTP_POOL ptpp, winmdroot.System.Threading.TP_POOL_STACK_INFORMATION* ptpsi)
#cfunc QueryThreadpoolStackInformation "QueryThreadpoolStackInformation" intptr, var

; winmdroot.Foundation.BOOL QueryUmsThreadInformation(void* UmsThread, winmdroot.System.Threading.UMS_THREAD_INFO_CLASS UmsThreadInfoClass, void* UmsThreadInformation, uint UmsThreadInformationLength, [Optional] uint* ReturnLength)
#cfunc QueryUmsThreadInformation "QueryUmsThreadInformation" intptr, int, intptr, int, var

; winmdroot.Foundation.BOOL QueryUnbiasedInterruptTime(ulong* UnbiasedTime)
#cfunc QueryUnbiasedInterruptTime "QueryUnbiasedInterruptTime" var

; uint QueueUserAPC(delegate *unmanaged[Stdcall]<nuint,void> pfnAPC, winmdroot.Foundation.HANDLE hThread, nuint dwData)
#cfunc QueueUserAPC "QueueUserAPC" int, intptr, int

; winmdroot.Foundation.BOOL QueueUserWorkItem(delegate *unmanaged[Stdcall]<void*,uint> Function, [Optional] void* Context, winmdroot.System.Threading.WORKER_THREAD_FLAGS Flags)
#cfunc QueueUserWorkItem "QueueUserWorkItem" int, intptr, int

; void RaiseException(uint dwExceptionCode, uint dwExceptionFlags, uint nNumberOfArguments, [Optional] nuint* lpArguments)
#func RaiseException "RaiseException" int, int, int, var

; winmdroot.Foundation.HANDLE ReOpenFile(winmdroot.Foundation.HANDLE hOriginalFile, uint dwDesiredAccess, winmdroot.Storage.FileSystem.FILE_SHARE_MODE dwShareMode, winmdroot.Storage.FileSystem.FILE_FLAGS_AND_ATTRIBUTES dwFlagsAndAttributes)
#cfunc ReOpenFile "ReOpenFile" intptr, int, int, int

; winmdroot.Foundation.BOOL ReadConsole(winmdroot.Foundation.HANDLE hConsoleInput, void* lpBuffer, uint nNumberOfCharsToRead, uint* lpNumberOfCharsRead, [Optional] winmdroot.System.Console.CONSOLE_READCONSOLE_CONTROL* pInputControl)
#cfunc ReadConsoleW "ReadConsoleW" intptr, intptr, int, var, var

; winmdroot.Foundation.BOOL ReadConsoleInput(winmdroot.Foundation.HANDLE hConsoleInput, winmdroot.System.Console.INPUT_RECORD* lpBuffer, uint nLength, uint* lpNumberOfEventsRead)
#cfunc ReadConsoleInputW "ReadConsoleInputW" intptr, var, int, var

; winmdroot.Foundation.BOOL ReadConsoleOutput(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.System.Console.CHAR_INFO* lpBuffer, winmdroot.System.Console.COORD dwBufferSize, winmdroot.System.Console.COORD dwBufferCoord, winmdroot.System.Console.SMALL_RECT* lpReadRegion)
#cfunc ReadConsoleOutputW "ReadConsoleOutputW" intptr, var, var, var, var

; winmdroot.Foundation.BOOL ReadConsoleOutputAttribute(winmdroot.Foundation.HANDLE hConsoleOutput, ushort* lpAttribute, uint nLength, winmdroot.System.Console.COORD dwReadCoord, uint* lpNumberOfAttrsRead)
#cfunc ReadConsoleOutputAttribute "ReadConsoleOutputAttribute" intptr, var, int, var, var

; winmdroot.Foundation.BOOL ReadConsoleOutputCharacter(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.Foundation.PWSTR lpCharacter, uint nLength, winmdroot.System.Console.COORD dwReadCoord, uint* lpNumberOfCharsRead)
#cfunc ReadConsoleOutputCharacterW "ReadConsoleOutputCharacterW" intptr, wstr, int, var, var

; winmdroot.Foundation.BOOL ReadDirectoryChanges(winmdroot.Foundation.HANDLE hDirectory, void* lpBuffer, uint nBufferLength, winmdroot.Foundation.BOOL bWatchSubtree, winmdroot.Storage.FileSystem.FILE_NOTIFY_CHANGE dwNotifyFilter, [Optional] uint* lpBytesReturned, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped, delegate *unmanaged[Stdcall]<uint,uint,global::System.Threading.NativeOverlapped*,void> lpCompletionRoutine)
#cfunc ReadDirectoryChangesW "ReadDirectoryChangesW" intptr, intptr, int, int, int, var, var, int

; winmdroot.Foundation.BOOL ReadDirectoryChangesEx(winmdroot.Foundation.HANDLE hDirectory, void* lpBuffer, uint nBufferLength, winmdroot.Foundation.BOOL bWatchSubtree, winmdroot.Storage.FileSystem.FILE_NOTIFY_CHANGE dwNotifyFilter, [Optional] uint* lpBytesReturned, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped, delegate *unmanaged[Stdcall]<uint,uint,global::System.Threading.NativeOverlapped*,void> lpCompletionRoutine, winmdroot.Storage.FileSystem.READ_DIRECTORY_NOTIFY_INFORMATION_CLASS ReadDirectoryNotifyInformationClass)
#cfunc ReadDirectoryChangesExW "ReadDirectoryChangesExW" intptr, intptr, int, int, int, var, var, int, int

; winmdroot.Foundation.BOOL ReadFile(winmdroot.Foundation.HANDLE hFile, [Optional] byte* lpBuffer, uint nNumberOfBytesToRead, [Optional] uint* lpNumberOfBytesRead, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped)
#cfunc ReadFile "ReadFile" intptr, var, int, var, var

; winmdroot.Foundation.BOOL ReadFileEx(winmdroot.Foundation.HANDLE hFile, [Optional] byte* lpBuffer, uint nNumberOfBytesToRead, global::System.Threading.NativeOverlapped* lpOverlapped, delegate *unmanaged[Stdcall]<uint,uint,global::System.Threading.NativeOverlapped*,void> lpCompletionRoutine)
#cfunc ReadFileEx "ReadFileEx" intptr, var, int, var, int

; winmdroot.Foundation.BOOL ReadFileScatter(winmdroot.Foundation.HANDLE hFile, winmdroot.Storage.FileSystem.FILE_SEGMENT_ELEMENT* aSegmentArray, uint nNumberOfBytesToRead, [Optional] uint* lpReserved, global::System.Threading.NativeOverlapped* lpOverlapped)
#cfunc ReadFileScatter "ReadFileScatter" intptr, var, int, var, var

; winmdroot.Foundation.BOOL ReadProcessMemory(winmdroot.Foundation.HANDLE hProcess, void* lpBaseAddress, void* lpBuffer, nuint nSize, [Optional] nuint* lpNumberOfBytesRead)
#cfunc ReadProcessMemory "ReadProcessMemory" intptr, intptr, intptr, int, var

; uint ReadThreadProfilingData(winmdroot.Foundation.HANDLE PerformanceDataHandle, uint Flags, winmdroot.System.Performance.HardwareCounterProfiling.PERFORMANCE_DATA* PerformanceData)
#cfunc ReadThreadProfilingData "ReadThreadProfilingData" intptr, int, var

; winmdroot.Foundation.HRESULT RegisterApplicationRecoveryCallback(delegate *unmanaged[Stdcall]<void*,uint> pRecoveyCallback, [Optional] void* pvParameter, uint dwPingInterval, uint dwFlags)
#cfunc RegisterApplicationRecoveryCallback "RegisterApplicationRecoveryCallback" int, intptr, int, int

; winmdroot.Foundation.HRESULT RegisterApplicationRestart(winmdroot.Foundation.PCWSTR pwzCommandline, winmdroot.System.Recovery.REGISTER_APPLICATION_RESTART_FLAGS dwFlags)
#cfunc RegisterApplicationRestart "RegisterApplicationRestart" wstr, int

; void* RegisterBadMemoryNotification(delegate *unmanaged[Stdcall]<void> Callback)
#cfunc RegisterBadMemoryNotification "RegisterBadMemoryNotification" int

; winmdroot.Foundation.BOOL RegisterWaitForSingleObject(winmdroot.Foundation.HANDLE* phNewWaitObject, winmdroot.Foundation.HANDLE hObject, delegate *unmanaged[Stdcall]<void*,global::Windows.Win32.Foundation.BOOLEAN,void> Callback, [Optional] void* Context, uint dwMilliseconds, winmdroot.System.Threading.WORKER_THREAD_FLAGS dwFlags)
#cfunc RegisterWaitForSingleObject "RegisterWaitForSingleObject" intptr, intptr, int, intptr, int, int

; winmdroot.Foundation.BOOL RegisterWaitUntilOOBECompleted(delegate *unmanaged[Stdcall]<void*,void> OOBECompletedCallback, [Optional] void* CallbackContext, void** WaitHandle)
#cfunc RegisterWaitUntilOOBECompleted "RegisterWaitUntilOOBECompleted" int, intptr, var

; void ReleaseActCtx(winmdroot.Foundation.HANDLE hActCtx)
#func ReleaseActCtx "ReleaseActCtx" intptr

; winmdroot.Foundation.BOOL ReleaseMutex(winmdroot.Foundation.HANDLE hMutex)
#cfunc ReleaseMutex "ReleaseMutex" intptr

; winmdroot.Foundation.BOOL ReleaseSemaphore(winmdroot.Foundation.HANDLE hSemaphore, int lReleaseCount, [Optional] int* lpPreviousCount)
#cfunc ReleaseSemaphore "ReleaseSemaphore" intptr, int, var

; winmdroot.Foundation.BOOL RemoveDirectory(winmdroot.Foundation.PCWSTR lpPathName)
#cfunc RemoveDirectoryW "RemoveDirectoryW" wstr

; winmdroot.Foundation.BOOL RemoveDirectoryTransacted(winmdroot.Foundation.PCWSTR lpPathName, winmdroot.Foundation.HANDLE hTransaction)
#cfunc RemoveDirectoryTransactedW "RemoveDirectoryTransactedW" wstr, intptr

; winmdroot.Foundation.BOOL RemoveSecureMemoryCacheCallback(delegate *unmanaged[Stdcall]<void*,nuint,global::Windows.Win32.Foundation.BOOLEAN> pfnCallBack)
#cfunc RemoveSecureMemoryCacheCallback "RemoveSecureMemoryCacheCallback" int

; winmdroot.Foundation.BOOL ReplaceFile(winmdroot.Foundation.PCWSTR lpReplacedFileName, winmdroot.Foundation.PCWSTR lpReplacementFileName, winmdroot.Foundation.PCWSTR lpBackupFileName, winmdroot.Storage.FileSystem.REPLACE_FILE_FLAGS dwReplaceFlags, [Optional] void* lpExclude, [Optional] void* lpReserved)
#cfunc ReplaceFileW "ReplaceFileW" wstr, wstr, wstr, int, intptr, intptr

; winmdroot.Foundation.BOOL ReplacePartitionUnit(winmdroot.Foundation.PWSTR TargetPartition, winmdroot.Foundation.PWSTR SparePartition, uint Flags)
#cfunc ReplacePartitionUnit "ReplacePartitionUnit" wstr, wstr, int

; winmdroot.Foundation.BOOL RequestDeviceWakeup(winmdroot.Foundation.HANDLE hDevice)
#cfunc RequestDeviceWakeup "RequestDeviceWakeup" intptr

; winmdroot.Foundation.BOOL RequestWakeupLatency(winmdroot.System.Power.LATENCY_TIME latency)
#cfunc RequestWakeupLatency "RequestWakeupLatency" int

; winmdroot.Foundation.BOOL ResetEvent(winmdroot.Foundation.HANDLE hEvent)
#cfunc ResetEvent "ResetEvent" intptr

; uint ResetWriteWatch(void* lpBaseAddress, nuint dwRegionSize)
#cfunc ResetWriteWatch "ResetWriteWatch" intptr, int

; winmdroot.Foundation.HRESULT ResizePseudoConsole(winmdroot.System.Console.HPCON hPC, winmdroot.System.Console.COORD size)
#cfunc ResizePseudoConsole "ResizePseudoConsole" intptr, var

; int ResolveLocaleName(winmdroot.Foundation.PCWSTR lpNameToResolve, winmdroot.Foundation.PWSTR lpLocaleName, int cchLocaleName)
#cfunc ResolveLocaleName "ResolveLocaleName" wstr, wstr, int

; uint ResumeThread(winmdroot.Foundation.HANDLE hThread)
#cfunc ResumeThread "ResumeThread" intptr

; ushort RtlCaptureStackBackTrace(uint FramesToSkip, uint FramesToCapture, void** BackTrace, [Optional] uint* BackTraceHash)
#cfunc RtlCaptureStackBackTrace "RtlCaptureStackBackTrace" int, int, var, var

; nuint RtlCompareMemory(void* Source1, void* Source2, nuint Length)
#cfunc RtlCompareMemory "RtlCompareMemory" intptr, intptr, int

; void* RtlPcToFileHeader(void* PcValue, void** BaseOfImage)
#cfunc RtlPcToFileHeader "RtlPcToFileHeader" intptr, var

; void RtlRaiseException(winmdroot.System.Diagnostics.Debug.EXCEPTION_RECORD* ExceptionRecord)
#func RtlRaiseException "RtlRaiseException" var

; void RtlUnwind([Optional] void* TargetFrame, [Optional] void* TargetIp, [Optional] winmdroot.System.Diagnostics.Debug.EXCEPTION_RECORD* ExceptionRecord, void* ReturnValue)
#func RtlUnwind "RtlUnwind" intptr, intptr, var, intptr

; winmdroot.Foundation.BOOL ScrollConsoleScreenBuffer(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.System.Console.SMALL_RECT* lpScrollRectangle, [Optional] winmdroot.System.Console.SMALL_RECT* lpClipRectangle, winmdroot.System.Console.COORD dwDestinationOrigin, winmdroot.System.Console.CHAR_INFO* lpFill)
#cfunc ScrollConsoleScreenBufferW "ScrollConsoleScreenBufferW" intptr, var, var, var, var

; uint SearchPath(winmdroot.Foundation.PCWSTR lpPath, winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Foundation.PCWSTR lpExtension, uint nBufferLength, winmdroot.Foundation.PWSTR lpBuffer, [Optional] winmdroot.Foundation.PWSTR* lpFilePart)
#cfunc SearchPathW "SearchPathW" wstr, wstr, wstr, int, wstr, var

; winmdroot.Foundation.BOOL SetCachedSigningLevel(winmdroot.Foundation.HANDLE* SourceFiles, uint SourceFileCount, uint Flags, winmdroot.Foundation.HANDLE TargetFile)
#cfunc SetCachedSigningLevel "SetCachedSigningLevel" intptr, int, int, intptr

; winmdroot.Foundation.BOOL SetCalendarInfo(uint Locale, uint Calendar, uint CalType, winmdroot.Foundation.PCWSTR lpCalData)
#cfunc SetCalendarInfoW "SetCalendarInfoW" int, int, int, wstr

; winmdroot.Foundation.BOOL SetCommBreak(winmdroot.Foundation.HANDLE hFile)
#cfunc SetCommBreak "SetCommBreak" intptr

; winmdroot.Foundation.BOOL SetCommConfig(winmdroot.Foundation.HANDLE hCommDev, winmdroot.Devices.Communication.COMMCONFIG* lpCC, uint dwSize)
#cfunc SetCommConfig "SetCommConfig" intptr, var, int

; winmdroot.Foundation.BOOL SetCommMask(winmdroot.Foundation.HANDLE hFile, winmdroot.Devices.Communication.COMM_EVENT_MASK dwEvtMask)
#cfunc SetCommMask "SetCommMask" intptr, int

; winmdroot.Foundation.BOOL SetCommState(winmdroot.Foundation.HANDLE hFile, winmdroot.Devices.Communication.DCB* lpDCB)
#cfunc SetCommState "SetCommState" intptr, var

; winmdroot.Foundation.BOOL SetCommTimeouts(winmdroot.Foundation.HANDLE hFile, winmdroot.Devices.Communication.COMMTIMEOUTS* lpCommTimeouts)
#cfunc SetCommTimeouts "SetCommTimeouts" intptr, var

; winmdroot.Foundation.BOOL SetComputerName(winmdroot.Foundation.PCWSTR lpComputerName)
#cfunc SetComputerNameW "SetComputerNameW" wstr

; winmdroot.Foundation.BOOL SetComputerNameEx(winmdroot.System.SystemInformation.COMPUTER_NAME_FORMAT NameType, winmdroot.Foundation.PCWSTR lpBuffer)
#cfunc SetComputerNameExW "SetComputerNameExW" int, wstr

; winmdroot.Foundation.BOOL SetComputerNameEx2W(winmdroot.System.SystemInformation.COMPUTER_NAME_FORMAT NameType, uint Flags, winmdroot.Foundation.PCWSTR lpBuffer)
#cfunc SetComputerNameEx2W "SetComputerNameEx2W" int, int, wstr

; winmdroot.Foundation.BOOL SetConsoleActiveScreenBuffer(winmdroot.Foundation.HANDLE hConsoleOutput)
#cfunc SetConsoleActiveScreenBuffer "SetConsoleActiveScreenBuffer" intptr

; winmdroot.Foundation.BOOL SetConsoleCP(uint wCodePageID)
#cfunc SetConsoleCP "SetConsoleCP" int

; winmdroot.Foundation.BOOL SetConsoleCtrlHandler(delegate *unmanaged[Stdcall]<uint,global::Windows.Win32.Foundation.BOOL> HandlerRoutine, winmdroot.Foundation.BOOL Add)
#cfunc SetConsoleCtrlHandler "SetConsoleCtrlHandler" int, int

; winmdroot.Foundation.BOOL SetConsoleCursorInfo(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.System.Console.CONSOLE_CURSOR_INFO* lpConsoleCursorInfo)
#cfunc SetConsoleCursorInfo "SetConsoleCursorInfo" intptr, var

; winmdroot.Foundation.BOOL SetConsoleCursorPosition(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.System.Console.COORD dwCursorPosition)
#cfunc SetConsoleCursorPosition "SetConsoleCursorPosition" intptr, var

; winmdroot.Foundation.BOOL SetConsoleDisplayMode(winmdroot.Foundation.HANDLE hConsoleOutput, uint dwFlags, [Optional] winmdroot.System.Console.COORD* lpNewScreenBufferDimensions)
#cfunc SetConsoleDisplayMode "SetConsoleDisplayMode" intptr, int, var

; winmdroot.Foundation.BOOL SetConsoleHistoryInfo(winmdroot.System.Console.CONSOLE_HISTORY_INFO* lpConsoleHistoryInfo)
#cfunc SetConsoleHistoryInfo "SetConsoleHistoryInfo" var

; winmdroot.Foundation.BOOL SetConsoleMode(winmdroot.Foundation.HANDLE hConsoleHandle, winmdroot.System.Console.CONSOLE_MODE dwMode)
#cfunc SetConsoleMode "SetConsoleMode" intptr, int

; winmdroot.Foundation.BOOL SetConsoleNumberOfCommandsW(uint Number, winmdroot.Foundation.PWSTR ExeName)
#cfunc SetConsoleNumberOfCommandsW "SetConsoleNumberOfCommandsW" int, wstr

; winmdroot.Foundation.BOOL SetConsoleOutputCP(uint wCodePageID)
#cfunc SetConsoleOutputCP "SetConsoleOutputCP" int

; winmdroot.Foundation.BOOL SetConsoleScreenBufferInfoEx(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.System.Console.CONSOLE_SCREEN_BUFFER_INFOEX* lpConsoleScreenBufferInfoEx)
#cfunc SetConsoleScreenBufferInfoEx "SetConsoleScreenBufferInfoEx" intptr, var

; winmdroot.Foundation.BOOL SetConsoleScreenBufferSize(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.System.Console.COORD dwSize)
#cfunc SetConsoleScreenBufferSize "SetConsoleScreenBufferSize" intptr, var

; winmdroot.Foundation.BOOL SetConsoleTextAttribute(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.System.Console.CONSOLE_CHARACTER_ATTRIBUTES wAttributes)
#cfunc SetConsoleTextAttribute "SetConsoleTextAttribute" intptr, int

; winmdroot.Foundation.BOOL SetConsoleTitle(winmdroot.Foundation.PCWSTR lpConsoleTitle)
#cfunc SetConsoleTitleW "SetConsoleTitleW" wstr

; winmdroot.Foundation.BOOL SetConsoleWindowInfo(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.Foundation.BOOL bAbsolute, winmdroot.System.Console.SMALL_RECT* lpConsoleWindow)
#cfunc SetConsoleWindowInfo "SetConsoleWindowInfo" intptr, int, var

; winmdroot.Foundation.BOOL SetCurrentConsoleFontEx(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.Foundation.BOOL bMaximumWindow, winmdroot.System.Console.CONSOLE_FONT_INFOEX* lpConsoleCurrentFontEx)
#cfunc SetCurrentConsoleFontEx "SetCurrentConsoleFontEx" intptr, int, var

; winmdroot.Foundation.BOOL SetCurrentDirectoryW(winmdroot.Foundation.PCWSTR lpPathName)
#cfunc SetCurrentDirectoryW "SetCurrentDirectoryW" wstr

; winmdroot.Foundation.BOOL SetDefaultCommConfig(winmdroot.Foundation.PCWSTR lpszName, winmdroot.Devices.Communication.COMMCONFIG* lpCC, uint dwSize)
#cfunc SetDefaultCommConfigW "SetDefaultCommConfigW" wstr, var, int

; winmdroot.Foundation.BOOL SetDllDirectory(winmdroot.Foundation.PCWSTR lpPathName)
#cfunc SetDllDirectoryW "SetDllDirectoryW" wstr

; winmdroot.Foundation.BOOL SetDynamicTimeZoneInformation(winmdroot.System.Time.DYNAMIC_TIME_ZONE_INFORMATION* lpTimeZoneInformation)
#cfunc SetDynamicTimeZoneInformation "SetDynamicTimeZoneInformation" var

; winmdroot.Foundation.BOOL SetEndOfFile(winmdroot.Foundation.HANDLE hFile)
#cfunc SetEndOfFile "SetEndOfFile" intptr

; winmdroot.Foundation.BOOL SetEnvironmentStringsW(winmdroot.Foundation.PZZWSTR NewEnvironment)
#cfunc SetEnvironmentStringsW "SetEnvironmentStringsW" int

; winmdroot.Foundation.BOOL SetEnvironmentVariable(winmdroot.Foundation.PCWSTR lpName, winmdroot.Foundation.PCWSTR lpValue)
#cfunc SetEnvironmentVariableW "SetEnvironmentVariableW" wstr, wstr

; winmdroot.System.Diagnostics.Debug.THREAD_ERROR_MODE SetErrorMode(winmdroot.System.Diagnostics.Debug.THREAD_ERROR_MODE uMode)
#cfunc SetErrorMode "SetErrorMode" int

; winmdroot.Foundation.BOOL SetEvent(winmdroot.Foundation.HANDLE hEvent)
#cfunc SetEvent "SetEvent" intptr

; void SetFileApisToANSI()
#func SetFileApisToANSI "SetFileApisToANSI"

; void SetFileApisToOEM()
#func SetFileApisToOEM "SetFileApisToOEM"

; winmdroot.Foundation.BOOL SetFileAttributes(winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Storage.FileSystem.FILE_FLAGS_AND_ATTRIBUTES dwFileAttributes)
#cfunc SetFileAttributesW "SetFileAttributesW" wstr, int

; winmdroot.Foundation.BOOL SetFileAttributesTransacted(winmdroot.Foundation.PCWSTR lpFileName, uint dwFileAttributes, winmdroot.Foundation.HANDLE hTransaction)
#cfunc SetFileAttributesTransactedW "SetFileAttributesTransactedW" wstr, int, intptr

; winmdroot.Foundation.BOOL SetFileBandwidthReservation(winmdroot.Foundation.HANDLE hFile, uint nPeriodMilliseconds, uint nBytesPerPeriod, winmdroot.Foundation.BOOL bDiscardable, uint* lpTransferSize, uint* lpNumOutstandingRequests)
#cfunc SetFileBandwidthReservation "SetFileBandwidthReservation" intptr, int, int, int, var, var

; winmdroot.Foundation.BOOL SetFileCompletionNotificationModes(winmdroot.Foundation.HANDLE FileHandle, byte Flags)
#cfunc SetFileCompletionNotificationModes "SetFileCompletionNotificationModes" intptr, int

; winmdroot.Foundation.BOOL SetFileInformationByHandle(winmdroot.Foundation.HANDLE hFile, winmdroot.Storage.FileSystem.FILE_INFO_BY_HANDLE_CLASS FileInformationClass, void* lpFileInformation, uint dwBufferSize)
#cfunc SetFileInformationByHandle "SetFileInformationByHandle" intptr, int, intptr, int

; winmdroot.Foundation.BOOL SetFileIoOverlappedRange(winmdroot.Foundation.HANDLE FileHandle, byte* OverlappedRangeStart, uint Length)
#cfunc SetFileIoOverlappedRange "SetFileIoOverlappedRange" intptr, var, int

; uint SetFilePointer(winmdroot.Foundation.HANDLE hFile, int lDistanceToMove, [Optional] int* lpDistanceToMoveHigh, winmdroot.Storage.FileSystem.SET_FILE_POINTER_MOVE_METHOD dwMoveMethod)
#cfunc SetFilePointer "SetFilePointer" intptr, int, var, int

; winmdroot.Foundation.BOOL SetFilePointerEx(winmdroot.Foundation.HANDLE hFile, long liDistanceToMove, [Optional] long* lpNewFilePointer, winmdroot.Storage.FileSystem.SET_FILE_POINTER_MOVE_METHOD dwMoveMethod)
#cfunc SetFilePointerEx "SetFilePointerEx" intptr, int64, var, int

; winmdroot.Foundation.BOOL SetFileShortName(winmdroot.Foundation.HANDLE hFile, winmdroot.Foundation.PCWSTR lpShortName)
#cfunc SetFileShortNameW "SetFileShortNameW" intptr, wstr

; winmdroot.Foundation.BOOL SetFileTime(winmdroot.Foundation.HANDLE hFile, [Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* lpCreationTime, [Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* lpLastAccessTime, [Optional] global::System.Runtime.InteropServices.ComTypes.FILETIME* lpLastWriteTime)
#cfunc SetFileTime "SetFileTime" intptr, var, var, var

; winmdroot.Foundation.BOOL SetFileValidData(winmdroot.Foundation.HANDLE hFile, long ValidDataLength)
#cfunc SetFileValidData "SetFileValidData" intptr, int64

; winmdroot.Foundation.BOOL SetFirmwareEnvironmentVariable(winmdroot.Foundation.PCWSTR lpName, winmdroot.Foundation.PCWSTR lpGuid, [Optional] void* pValue, uint nSize)
#cfunc SetFirmwareEnvironmentVariableW "SetFirmwareEnvironmentVariableW" wstr, wstr, intptr, int

; winmdroot.Foundation.BOOL SetFirmwareEnvironmentVariableEx(winmdroot.Foundation.PCWSTR lpName, winmdroot.Foundation.PCWSTR lpGuid, [Optional] void* pValue, uint nSize, uint dwAttributes)
#cfunc SetFirmwareEnvironmentVariableExW "SetFirmwareEnvironmentVariableExW" wstr, wstr, intptr, int, int

; uint SetHandleCount(uint uNumber)
#cfunc SetHandleCount "SetHandleCount" int

; winmdroot.Foundation.BOOL SetHandleInformation(winmdroot.Foundation.HANDLE hObject, uint dwMask, winmdroot.Foundation.HANDLE_FLAGS dwFlags)
#cfunc SetHandleInformation "SetHandleInformation" intptr, int, int

; winmdroot.Foundation.BOOL SetInformationJobObject(winmdroot.Foundation.HANDLE hJob, winmdroot.System.JobObjects.JOBOBJECTINFOCLASS JobObjectInformationClass, void* lpJobObjectInformation, uint cbJobObjectInformationLength)
#cfunc SetInformationJobObject "SetInformationJobObject" intptr, int, intptr, int

; uint SetIoRateControlInformationJobObject(winmdroot.Foundation.HANDLE hJob, winmdroot.System.JobObjects.JOBOBJECT_IO_RATE_CONTROL_INFORMATION* IoRateControlInfo)
#cfunc SetIoRateControlInformationJobObject "SetIoRateControlInformationJobObject" intptr, var

; void SetLastError(winmdroot.Foundation.WIN32_ERROR dwErrCode)
#func SetLastError "SetLastError" int

; winmdroot.Foundation.BOOL SetLocalTime(winmdroot.Foundation.SYSTEMTIME* lpSystemTime)
#cfunc SetLocalTime "SetLocalTime" var

; winmdroot.Foundation.BOOL SetLocaleInfo(uint Locale, uint LCType, winmdroot.Foundation.PCWSTR lpLCData)
#cfunc SetLocaleInfoW "SetLocaleInfoW" int, int, wstr

; winmdroot.Foundation.BOOL SetMailslotInfo(winmdroot.Foundation.HANDLE hMailslot, uint lReadTimeout)
#cfunc SetMailslotInfo "SetMailslotInfo" intptr, int

; winmdroot.Foundation.BOOL SetMessageWaitingIndicator(winmdroot.Foundation.HANDLE hMsgIndicator, uint ulMsgCount)
#cfunc SetMessageWaitingIndicator "SetMessageWaitingIndicator" intptr, int

; winmdroot.Foundation.BOOL SetNamedPipeHandleState(winmdroot.Foundation.HANDLE hNamedPipe, [Optional] winmdroot.System.Pipes.NAMED_PIPE_MODE* lpMode, [Optional] uint* lpMaxCollectionCount, [Optional] uint* lpCollectDataTimeout)
#cfunc SetNamedPipeHandleState "SetNamedPipeHandleState" intptr, var, var, var

; winmdroot.Foundation.BOOL SetPriorityClass(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.Threading.PROCESS_CREATION_FLAGS dwPriorityClass)
#cfunc SetPriorityClass "SetPriorityClass" intptr, int

; winmdroot.Foundation.BOOL SetProcessAffinityMask(winmdroot.Foundation.HANDLE hProcess, nuint dwProcessAffinityMask)
#cfunc SetProcessAffinityMask "SetProcessAffinityMask" intptr, int

; winmdroot.Foundation.BOOL SetProcessAffinityUpdateMode(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.Threading.PROCESS_AFFINITY_AUTO_UPDATE_FLAGS dwFlags)
#cfunc SetProcessAffinityUpdateMode "SetProcessAffinityUpdateMode" intptr, int

; winmdroot.Foundation.BOOL SetProcessDEPPolicy(winmdroot.System.Threading.PROCESS_DEP_FLAGS dwFlags)
#cfunc SetProcessDEPPolicy "SetProcessDEPPolicy" int

; winmdroot.Foundation.BOOL SetProcessInformation(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.Threading.PROCESS_INFORMATION_CLASS ProcessInformationClass, void* ProcessInformation, uint ProcessInformationSize)
#cfunc SetProcessInformation "SetProcessInformation" intptr, int, intptr, int

; winmdroot.Foundation.BOOL SetProcessPreferredUILanguages(uint dwFlags, winmdroot.Foundation.PCZZWSTR pwszLanguagesBuffer, [Optional] uint* pulNumLanguages)
#cfunc SetProcessPreferredUILanguages "SetProcessPreferredUILanguages" int, int, var

; winmdroot.Foundation.BOOL SetProcessPriorityBoost(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.BOOL bDisablePriorityBoost)
#cfunc SetProcessPriorityBoost "SetProcessPriorityBoost" intptr, int

; winmdroot.Foundation.BOOL SetProcessShutdownParameters(uint dwLevel, uint dwFlags)
#cfunc SetProcessShutdownParameters "SetProcessShutdownParameters" int, int

; winmdroot.Foundation.BOOL SetProcessWorkingSetSize(winmdroot.Foundation.HANDLE hProcess, nuint dwMinimumWorkingSetSize, nuint dwMaximumWorkingSetSize)
#cfunc SetProcessWorkingSetSize "SetProcessWorkingSetSize" intptr, int, int

; winmdroot.Foundation.BOOL SetProcessWorkingSetSizeEx(winmdroot.Foundation.HANDLE hProcess, nuint dwMinimumWorkingSetSize, nuint dwMaximumWorkingSetSize, winmdroot.System.Memory.SETPROCESSWORKINGSETSIZEEX_FLAGS Flags)
#cfunc SetProcessWorkingSetSizeEx "SetProcessWorkingSetSizeEx" intptr, int, int, int

; winmdroot.Foundation.BOOL SetSearchPathMode(uint Flags)
#cfunc SetSearchPathMode "SetSearchPathMode" int

; winmdroot.Foundation.BOOL SetStdHandle(winmdroot.System.Console.STD_HANDLE nStdHandle, winmdroot.Foundation.HANDLE hHandle)
#cfunc SetStdHandle "SetStdHandle" int, intptr

; winmdroot.Foundation.BOOL SetStdHandleEx(winmdroot.System.Console.STD_HANDLE nStdHandle, winmdroot.Foundation.HANDLE hHandle, [Optional] winmdroot.Foundation.HANDLE* phPrevValue)
#cfunc SetStdHandleEx "SetStdHandleEx" int, intptr, intptr

; winmdroot.Foundation.BOOL SetSystemFileCacheSize(nuint MinimumFileCacheSize, nuint MaximumFileCacheSize, uint Flags)
#cfunc SetSystemFileCacheSize "SetSystemFileCacheSize" int, int, int

; winmdroot.Foundation.BOOL SetSystemPowerState(winmdroot.Foundation.BOOL fSuspend, winmdroot.Foundation.BOOL fForce)
#cfunc SetSystemPowerState "SetSystemPowerState" int, int

; winmdroot.Foundation.BOOL SetSystemTime(winmdroot.Foundation.SYSTEMTIME* lpSystemTime)
#cfunc SetSystemTime "SetSystemTime" var

; winmdroot.Foundation.BOOL SetSystemTimeAdjustment(uint dwTimeAdjustment, winmdroot.Foundation.BOOL bTimeAdjustmentDisabled)
#cfunc SetSystemTimeAdjustment "SetSystemTimeAdjustment" int, int

; uint SetTapeParameters(winmdroot.Foundation.HANDLE hDevice, winmdroot.Storage.FileSystem.TAPE_INFORMATION_TYPE dwOperation, void* lpTapeInformation)
#cfunc SetTapeParameters "SetTapeParameters" intptr, int, intptr

; uint SetTapePosition(winmdroot.Foundation.HANDLE hDevice, winmdroot.Storage.FileSystem.TAPE_POSITION_METHOD dwPositionMethod, uint dwPartition, uint dwOffsetLow, uint dwOffsetHigh, winmdroot.Foundation.BOOL bImmediate)
#cfunc SetTapePosition "SetTapePosition" intptr, int, int, int, int, int

; nuint SetThreadAffinityMask(winmdroot.Foundation.HANDLE hThread, nuint dwThreadAffinityMask)
#cfunc SetThreadAffinityMask "SetThreadAffinityMask" intptr, int

; winmdroot.Foundation.BOOL SetThreadErrorMode(winmdroot.System.Diagnostics.Debug.THREAD_ERROR_MODE dwNewMode, [Optional] winmdroot.System.Diagnostics.Debug.THREAD_ERROR_MODE* lpOldMode)
#cfunc SetThreadErrorMode "SetThreadErrorMode" int, var

; winmdroot.System.Power.EXECUTION_STATE SetThreadExecutionState(winmdroot.System.Power.EXECUTION_STATE esFlags)
#cfunc SetThreadExecutionState "SetThreadExecutionState" int

; winmdroot.Foundation.BOOL SetThreadGroupAffinity(winmdroot.Foundation.HANDLE hThread, winmdroot.System.SystemInformation.GROUP_AFFINITY* GroupAffinity, [Optional] winmdroot.System.SystemInformation.GROUP_AFFINITY* PreviousGroupAffinity)
#cfunc SetThreadGroupAffinity "SetThreadGroupAffinity" intptr, var, var

; uint SetThreadIdealProcessor(winmdroot.Foundation.HANDLE hThread, uint dwIdealProcessor)
#cfunc SetThreadIdealProcessor "SetThreadIdealProcessor" intptr, int

; winmdroot.Foundation.BOOL SetThreadIdealProcessorEx(winmdroot.Foundation.HANDLE hThread, winmdroot.System.Kernel.PROCESSOR_NUMBER* lpIdealProcessor, [Optional] winmdroot.System.Kernel.PROCESSOR_NUMBER* lpPreviousIdealProcessor)
#cfunc SetThreadIdealProcessorEx "SetThreadIdealProcessorEx" intptr, var, var

; winmdroot.Foundation.BOOL SetThreadInformation(winmdroot.Foundation.HANDLE hThread, winmdroot.System.Threading.THREAD_INFORMATION_CLASS ThreadInformationClass, void* ThreadInformation, uint ThreadInformationSize)
#cfunc SetThreadInformation "SetThreadInformation" intptr, int, intptr, int

; winmdroot.Foundation.BOOL SetThreadLocale(uint Locale)
#cfunc SetThreadLocale "SetThreadLocale" int

; winmdroot.Foundation.BOOL SetThreadPreferredUILanguages(uint dwFlags, winmdroot.Foundation.PCZZWSTR pwszLanguagesBuffer, [Optional] uint* pulNumLanguages)
#cfunc SetThreadPreferredUILanguages "SetThreadPreferredUILanguages" int, int, var

; winmdroot.Foundation.BOOL SetThreadPriority(winmdroot.Foundation.HANDLE hThread, winmdroot.System.Threading.THREAD_PRIORITY nPriority)
#cfunc SetThreadPriority "SetThreadPriority" intptr, int

; winmdroot.Foundation.BOOL SetThreadPriorityBoost(winmdroot.Foundation.HANDLE hThread, winmdroot.Foundation.BOOL bDisablePriorityBoost)
#cfunc SetThreadPriorityBoost "SetThreadPriorityBoost" intptr, int

; winmdroot.Foundation.BOOL SetThreadStackGuarantee(uint* StackSizeInBytes)
#cfunc SetThreadStackGuarantee "SetThreadStackGuarantee" var

; ushort SetThreadUILanguage(ushort LangId)
#cfunc SetThreadUILanguage "SetThreadUILanguage" int

; winmdroot.Foundation.BOOL SetThreadpoolStackInformation(winmdroot.System.Threading.PTP_POOL ptpp, winmdroot.System.Threading.TP_POOL_STACK_INFORMATION* ptpsi)
#cfunc SetThreadpoolStackInformation "SetThreadpoolStackInformation" intptr, var

; winmdroot.Foundation.BOOL SetThreadpoolThreadMinimum(winmdroot.System.Threading.PTP_POOL ptpp, uint cthrdMic)
#cfunc SetThreadpoolThreadMinimum "SetThreadpoolThreadMinimum" intptr, int

; winmdroot.Foundation.BOOL SetTimeZoneInformation(winmdroot.System.Time.TIME_ZONE_INFORMATION* lpTimeZoneInformation)
#cfunc SetTimeZoneInformation "SetTimeZoneInformation" var

; winmdroot.Foundation.HANDLE SetTimerQueueTimer(winmdroot.Foundation.HANDLE TimerQueue, delegate *unmanaged[Stdcall]<void*,global::Windows.Win32.Foundation.BOOLEAN,void> Callback, [Optional] void* Parameter, uint DueTime, uint Period, winmdroot.Foundation.BOOL PreferIo)
#cfunc SetTimerQueueTimer "SetTimerQueueTimer" intptr, int, intptr, int, int, int

; winmdroot.Foundation.BOOL SetUmsThreadInformation(void* UmsThread, winmdroot.System.Threading.UMS_THREAD_INFO_CLASS UmsThreadInfoClass, void* UmsThreadInformation, uint UmsThreadInformationLength)
#cfunc SetUmsThreadInformation "SetUmsThreadInformation" intptr, int, intptr, int

; winmdroot.Foundation.BOOL SetUserGeoID(int GeoId)
#cfunc SetUserGeoID "SetUserGeoID" int

; winmdroot.Foundation.BOOL SetUserGeoName(winmdroot.Foundation.PWSTR geoName)
#cfunc SetUserGeoName "SetUserGeoName" wstr

; winmdroot.Foundation.BOOL SetVolumeLabel(winmdroot.Foundation.PCWSTR lpRootPathName, winmdroot.Foundation.PCWSTR lpVolumeName)
#cfunc SetVolumeLabelW "SetVolumeLabelW" wstr, wstr

; winmdroot.Foundation.BOOL SetVolumeMountPoint(winmdroot.Foundation.PCWSTR lpszVolumeMountPoint, winmdroot.Foundation.PCWSTR lpszVolumeName)
#cfunc SetVolumeMountPointW "SetVolumeMountPointW" wstr, wstr

; winmdroot.Foundation.BOOL SetWaitableTimer(winmdroot.Foundation.HANDLE hTimer, long* lpDueTime, int lPeriod, delegate *unmanaged[Stdcall]<void*,uint,uint,void> pfnCompletionRoutine, [Optional] void* lpArgToCompletionRoutine, winmdroot.Foundation.BOOL fResume)
#cfunc SetWaitableTimer "SetWaitableTimer" intptr, var, int, int, intptr, int

; winmdroot.Foundation.BOOL SetupComm(winmdroot.Foundation.HANDLE hFile, uint dwInQueue, uint dwOutQueue)
#cfunc SetupComm "SetupComm" intptr, int, int

; winmdroot.Foundation.WAIT_EVENT SignalObjectAndWait(winmdroot.Foundation.HANDLE hObjectToSignal, winmdroot.Foundation.HANDLE hObjectToWaitOn, uint dwMilliseconds, winmdroot.Foundation.BOOL bAlertable)
#cfunc SignalObjectAndWait "SignalObjectAndWait" intptr, intptr, int, int

; uint SizeofResource(winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.HRSRC hResInfo)
#cfunc SizeofResource "SizeofResource" intptr, intptr

; void Sleep(uint dwMilliseconds)
#func Sleep "Sleep" int

; uint SleepEx(uint dwMilliseconds, winmdroot.Foundation.BOOL bAlertable)
#cfunc SleepEx "SleepEx" int, int

; uint SuspendThread(winmdroot.Foundation.HANDLE hThread)
#cfunc SuspendThread "SuspendThread" intptr

; void SwitchToFiber(void* lpFiber)
#func SwitchToFiber "SwitchToFiber" intptr

; winmdroot.Foundation.BOOL SwitchToThread()
#cfunc SwitchToThread "SwitchToThread"

; winmdroot.Foundation.BOOL SystemTimeToFileTime(winmdroot.Foundation.SYSTEMTIME* lpSystemTime, global::System.Runtime.InteropServices.ComTypes.FILETIME* lpFileTime)
#cfunc SystemTimeToFileTime "SystemTimeToFileTime" var, var

; winmdroot.Foundation.BOOL SystemTimeToTzSpecificLocalTime([Optional] winmdroot.System.Time.TIME_ZONE_INFORMATION* lpTimeZoneInformation, winmdroot.Foundation.SYSTEMTIME* lpUniversalTime, winmdroot.Foundation.SYSTEMTIME* lpLocalTime)
#cfunc SystemTimeToTzSpecificLocalTime "SystemTimeToTzSpecificLocalTime" var, var, var

; winmdroot.Foundation.BOOL TerminateJobObject(winmdroot.Foundation.HANDLE hJob, uint uExitCode)
#cfunc TerminateJobObject "TerminateJobObject" intptr, int

; winmdroot.Foundation.BOOL TerminateProcess(winmdroot.Foundation.HANDLE hProcess, uint uExitCode)
#cfunc TerminateProcess "TerminateProcess" intptr, int

; winmdroot.Foundation.BOOL TerminateThread(winmdroot.Foundation.HANDLE hThread, uint dwExitCode)
#cfunc TerminateThread "TerminateThread" intptr, int

; winmdroot.Foundation.BOOL Thread32First(winmdroot.Foundation.HANDLE hSnapshot, winmdroot.System.Diagnostics.ToolHelp.THREADENTRY32* lpte)
#cfunc Thread32First "Thread32First" intptr, var

; winmdroot.Foundation.BOOL Thread32Next(winmdroot.Foundation.HANDLE hSnapshot, winmdroot.System.Diagnostics.ToolHelp.THREADENTRY32* lpte)
#cfunc Thread32Next "Thread32Next" intptr, var

; uint TlsAlloc()
#cfunc TlsAlloc "TlsAlloc"

; winmdroot.Foundation.BOOL TlsFree(uint dwTlsIndex)
#cfunc TlsFree "TlsFree" int

; void* TlsGetValue(uint dwTlsIndex)
#cfunc TlsGetValue "TlsGetValue" int

; winmdroot.Foundation.BOOL TlsSetValue(uint dwTlsIndex, [Optional] void* lpTlsValue)
#cfunc TlsSetValue "TlsSetValue" int, intptr

; winmdroot.Foundation.BOOL Toolhelp32ReadProcessMemory(uint th32ProcessID, void* lpBaseAddress, void* lpBuffer, nuint cbRead, nuint* lpNumberOfBytesRead)
#cfunc Toolhelp32ReadProcessMemory "Toolhelp32ReadProcessMemory" int, intptr, intptr, int, var

; winmdroot.Foundation.BOOL TransactNamedPipe(winmdroot.Foundation.HANDLE hNamedPipe, [Optional] void* lpInBuffer, uint nInBufferSize, [Optional] void* lpOutBuffer, uint nOutBufferSize, uint* lpBytesRead, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped)
#cfunc TransactNamedPipe "TransactNamedPipe" intptr, intptr, int, intptr, int, var, var

; winmdroot.Foundation.BOOL TransmitCommChar(winmdroot.Foundation.HANDLE hFile, winmdroot.Foundation.CHAR cChar)
#cfunc TransmitCommChar "TransmitCommChar" intptr, int

; winmdroot.Foundation.BOOL TrySubmitThreadpoolCallback(delegate *unmanaged[Stdcall]<global::Windows.Win32.System.Threading.PTP_CALLBACK_INSTANCE,void*,void> pfns, [Optional] void* pv, [Optional] winmdroot.System.Threading.TP_CALLBACK_ENVIRON_V3* pcbe)
#cfunc TrySubmitThreadpoolCallback "TrySubmitThreadpoolCallback" int, intptr, var

; winmdroot.Foundation.BOOL TzSpecificLocalTimeToSystemTime([Optional] winmdroot.System.Time.TIME_ZONE_INFORMATION* lpTimeZoneInformation, winmdroot.Foundation.SYSTEMTIME* lpLocalTime, winmdroot.Foundation.SYSTEMTIME* lpUniversalTime)
#cfunc TzSpecificLocalTimeToSystemTime "TzSpecificLocalTimeToSystemTime" var, var, var

; winmdroot.Foundation.BOOL UmsThreadYield(void* SchedulerParam)
#cfunc UmsThreadYield "UmsThreadYield" intptr

; winmdroot.Foundation.BOOL UnlockFile(winmdroot.Foundation.HANDLE hFile, uint dwFileOffsetLow, uint dwFileOffsetHigh, uint nNumberOfBytesToUnlockLow, uint nNumberOfBytesToUnlockHigh)
#cfunc UnlockFile "UnlockFile" intptr, int, int, int, int

; winmdroot.Foundation.BOOL UnlockFileEx(winmdroot.Foundation.HANDLE hFile, uint dwReserved, uint nNumberOfBytesToUnlockLow, uint nNumberOfBytesToUnlockHigh, global::System.Threading.NativeOverlapped* lpOverlapped)
#cfunc UnlockFileEx "UnlockFileEx" intptr, int, int, int, var

; winmdroot.Foundation.BOOL UnmapViewOfFile(winmdroot.System.Memory.MEMORY_MAPPED_VIEW_ADDRESS lpBaseAddress)
#cfunc UnmapViewOfFile "UnmapViewOfFile" int

; winmdroot.Foundation.HRESULT UnregisterApplicationRecoveryCallback()
#cfunc UnregisterApplicationRecoveryCallback "UnregisterApplicationRecoveryCallback"

; winmdroot.Foundation.HRESULT UnregisterApplicationRestart()
#cfunc UnregisterApplicationRestart "UnregisterApplicationRestart"

; winmdroot.Foundation.BOOL UnregisterBadMemoryNotification(void* RegistrationHandle)
#cfunc UnregisterBadMemoryNotification "UnregisterBadMemoryNotification" intptr

; winmdroot.Foundation.BOOL UnregisterWait(winmdroot.Foundation.HANDLE WaitHandle)
#cfunc UnregisterWait "UnregisterWait" intptr

; winmdroot.Foundation.BOOL UnregisterWaitEx(winmdroot.Foundation.HANDLE WaitHandle, winmdroot.Foundation.HANDLE CompletionEvent)
#cfunc UnregisterWaitEx "UnregisterWaitEx" intptr, intptr

; winmdroot.Foundation.BOOL UnregisterWaitUntilOOBECompleted(void* WaitHandle)
#cfunc UnregisterWaitUntilOOBECompleted "UnregisterWaitUntilOOBECompleted" intptr

; winmdroot.Foundation.BOOL UpdateCalendarDayOfWeek(winmdroot.Globalization.CALDATETIME* lpCalDateTime)
#cfunc UpdateCalendarDayOfWeek "UpdateCalendarDayOfWeek" var

; winmdroot.Foundation.BOOL UpdateResource(winmdroot.Foundation.HANDLE hUpdate, winmdroot.Foundation.PCWSTR lpType, winmdroot.Foundation.PCWSTR lpName, ushort wLanguage, [Optional] void* lpData, uint cb)
#cfunc UpdateResourceW "UpdateResourceW" intptr, wstr, wstr, int, intptr, int

; uint VerLanguageNameW(uint wLang, winmdroot.Foundation.PWSTR szLang, uint cchLang)
#cfunc VerLanguageNameW "VerLanguageNameW" int, wstr, int

; winmdroot.Foundation.BOOL VerifyScripts(uint dwFlags, winmdroot.Foundation.PCWSTR lpLocaleScripts, int cchLocaleScripts, winmdroot.Foundation.PCWSTR lpTestScripts, int cchTestScripts)
#cfunc VerifyScripts "VerifyScripts" int, wstr, int, wstr, int

; winmdroot.Foundation.BOOL VerifyVersionInfo(winmdroot.System.SystemInformation.OSVERSIONINFOEXW* lpVersionInformation, winmdroot.System.SystemInformation.VER_FLAGS dwTypeMask, ulong dwlConditionMask)
#cfunc VerifyVersionInfoW "VerifyVersionInfoW" var, int, int64

; void* VirtualAlloc([Optional] void* lpAddress, nuint dwSize, winmdroot.System.Memory.VIRTUAL_ALLOCATION_TYPE flAllocationType, winmdroot.System.Memory.PAGE_PROTECTION_FLAGS flProtect)
#cfunc VirtualAlloc "VirtualAlloc" intptr, int, int, int

; void* VirtualAllocEx(winmdroot.Foundation.HANDLE hProcess, [Optional] void* lpAddress, nuint dwSize, winmdroot.System.Memory.VIRTUAL_ALLOCATION_TYPE flAllocationType, winmdroot.System.Memory.PAGE_PROTECTION_FLAGS flProtect)
#cfunc VirtualAllocEx "VirtualAllocEx" intptr, intptr, int, int, int

; void* VirtualAllocExNuma(winmdroot.Foundation.HANDLE hProcess, [Optional] void* lpAddress, nuint dwSize, winmdroot.System.Memory.VIRTUAL_ALLOCATION_TYPE flAllocationType, uint flProtect, uint nndPreferred)
#cfunc VirtualAllocExNuma "VirtualAllocExNuma" intptr, intptr, int, int, int, int

; winmdroot.Foundation.BOOL VirtualFree(void* lpAddress, nuint dwSize, winmdroot.System.Memory.VIRTUAL_FREE_TYPE dwFreeType)
#cfunc VirtualFree "VirtualFree" intptr, int, int

; winmdroot.Foundation.BOOL VirtualFreeEx(winmdroot.Foundation.HANDLE hProcess, void* lpAddress, nuint dwSize, winmdroot.System.Memory.VIRTUAL_FREE_TYPE dwFreeType)
#cfunc VirtualFreeEx "VirtualFreeEx" intptr, intptr, int, int

; winmdroot.Foundation.BOOL VirtualLock(void* lpAddress, nuint dwSize)
#cfunc VirtualLock "VirtualLock" intptr, int

; winmdroot.Foundation.BOOL VirtualProtect(void* lpAddress, nuint dwSize, winmdroot.System.Memory.PAGE_PROTECTION_FLAGS flNewProtect, winmdroot.System.Memory.PAGE_PROTECTION_FLAGS* lpflOldProtect)
#cfunc VirtualProtect "VirtualProtect" intptr, int, int, var

; winmdroot.Foundation.BOOL VirtualProtectEx(winmdroot.Foundation.HANDLE hProcess, void* lpAddress, nuint dwSize, winmdroot.System.Memory.PAGE_PROTECTION_FLAGS flNewProtect, winmdroot.System.Memory.PAGE_PROTECTION_FLAGS* lpflOldProtect)
#cfunc VirtualProtectEx "VirtualProtectEx" intptr, intptr, int, int, var

; winmdroot.Foundation.BOOL VirtualUnlock(void* lpAddress, nuint dwSize)
#cfunc VirtualUnlock "VirtualUnlock" intptr, int

; uint WTSGetActiveConsoleSessionId()
#cfunc WTSGetActiveConsoleSessionId "WTSGetActiveConsoleSessionId"

; winmdroot.Foundation.BOOL WaitCommEvent(winmdroot.Foundation.HANDLE hFile, winmdroot.Devices.Communication.COMM_EVENT_MASK* lpEvtMask, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped)
#cfunc WaitCommEvent "WaitCommEvent" intptr, var, var

; winmdroot.Foundation.BOOL WaitForDebugEvent(winmdroot.System.Diagnostics.Debug.DEBUG_EVENT* lpDebugEvent, uint dwMilliseconds)
#cfunc WaitForDebugEvent "WaitForDebugEvent" var, int

; winmdroot.Foundation.WAIT_EVENT WaitForMultipleObjects(uint nCount, winmdroot.Foundation.HANDLE* lpHandles, winmdroot.Foundation.BOOL bWaitAll, uint dwMilliseconds)
#cfunc WaitForMultipleObjects "WaitForMultipleObjects" int, intptr, int, int

; winmdroot.Foundation.WAIT_EVENT WaitForMultipleObjectsEx(uint nCount, winmdroot.Foundation.HANDLE* lpHandles, winmdroot.Foundation.BOOL bWaitAll, uint dwMilliseconds, winmdroot.Foundation.BOOL bAlertable)
#cfunc WaitForMultipleObjectsEx "WaitForMultipleObjectsEx" int, intptr, int, int, int

; winmdroot.Foundation.WAIT_EVENT WaitForSingleObject(winmdroot.Foundation.HANDLE hHandle, uint dwMilliseconds)
#cfunc WaitForSingleObject "WaitForSingleObject" intptr, int

; winmdroot.Foundation.WAIT_EVENT WaitForSingleObjectEx(winmdroot.Foundation.HANDLE hHandle, uint dwMilliseconds, winmdroot.Foundation.BOOL bAlertable)
#cfunc WaitForSingleObjectEx "WaitForSingleObjectEx" intptr, int, int

; winmdroot.Foundation.BOOL WaitNamedPipeW(winmdroot.Foundation.PCWSTR lpNamedPipeName, uint nTimeOut)
#cfunc WaitNamedPipeW "WaitNamedPipeW" wstr, int

; winmdroot.Foundation.HRESULT WerGetFlags(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.ErrorReporting.WER_FAULT_REPORTING* pdwFlags)
#cfunc WerGetFlags "WerGetFlags" intptr, var

; winmdroot.Foundation.HRESULT WerRegisterAdditionalProcess(uint processId, uint captureExtraInfoForThreadId)
#cfunc WerRegisterAdditionalProcess "WerRegisterAdditionalProcess" int, int

; winmdroot.Foundation.HRESULT WerRegisterAppLocalDump(winmdroot.Foundation.PCWSTR localAppDataRelativePath)
#cfunc WerRegisterAppLocalDump "WerRegisterAppLocalDump" wstr

; winmdroot.Foundation.HRESULT WerRegisterCustomMetadata(winmdroot.Foundation.PCWSTR key, winmdroot.Foundation.PCWSTR value)
#cfunc WerRegisterCustomMetadata "WerRegisterCustomMetadata" wstr, wstr

; winmdroot.Foundation.HRESULT WerRegisterExcludedMemoryBlock(void* address, uint size)
#cfunc WerRegisterExcludedMemoryBlock "WerRegisterExcludedMemoryBlock" intptr, int

; winmdroot.Foundation.HRESULT WerRegisterFile(winmdroot.Foundation.PCWSTR pwzFile, winmdroot.System.ErrorReporting.WER_REGISTER_FILE_TYPE regFileType, winmdroot.System.ErrorReporting.WER_FILE dwFlags)
#cfunc WerRegisterFile "WerRegisterFile" wstr, int, int

; winmdroot.Foundation.HRESULT WerRegisterMemoryBlock(void* pvAddress, uint dwSize)
#cfunc WerRegisterMemoryBlock "WerRegisterMemoryBlock" intptr, int

; winmdroot.Foundation.HRESULT WerRegisterRuntimeExceptionModule(winmdroot.Foundation.PCWSTR pwszOutOfProcessCallbackDll, void* pContext)
#cfunc WerRegisterRuntimeExceptionModule "WerRegisterRuntimeExceptionModule" wstr, intptr

; winmdroot.Foundation.HRESULT WerSetFlags(winmdroot.System.ErrorReporting.WER_FAULT_REPORTING dwFlags)
#cfunc WerSetFlags "WerSetFlags" int

; winmdroot.Foundation.HRESULT WerUnregisterAdditionalProcess(uint processId)
#cfunc WerUnregisterAdditionalProcess "WerUnregisterAdditionalProcess" int

; winmdroot.Foundation.HRESULT WerUnregisterAppLocalDump()
#cfunc WerUnregisterAppLocalDump "WerUnregisterAppLocalDump"

; winmdroot.Foundation.HRESULT WerUnregisterCustomMetadata(winmdroot.Foundation.PCWSTR key)
#cfunc WerUnregisterCustomMetadata "WerUnregisterCustomMetadata" wstr

; winmdroot.Foundation.HRESULT WerUnregisterExcludedMemoryBlock(void* address)
#cfunc WerUnregisterExcludedMemoryBlock "WerUnregisterExcludedMemoryBlock" intptr

; winmdroot.Foundation.HRESULT WerUnregisterFile(winmdroot.Foundation.PCWSTR pwzFilePath)
#cfunc WerUnregisterFile "WerUnregisterFile" wstr

; winmdroot.Foundation.HRESULT WerUnregisterMemoryBlock(void* pvAddress)
#cfunc WerUnregisterMemoryBlock "WerUnregisterMemoryBlock" intptr

; winmdroot.Foundation.HRESULT WerUnregisterRuntimeExceptionModule(winmdroot.Foundation.PCWSTR pwszOutOfProcessCallbackDll, void* pContext)
#cfunc WerUnregisterRuntimeExceptionModule "WerUnregisterRuntimeExceptionModule" wstr, intptr

; int WideCharToMultiByte(uint CodePage, uint dwFlags, winmdroot.Foundation.PCWSTR lpWideCharStr, int cchWideChar, winmdroot.Foundation.PSTR lpMultiByteStr, int cbMultiByte, winmdroot.Foundation.PCSTR lpDefaultChar, [Optional] winmdroot.Foundation.BOOL* lpUsedDefaultChar)
#cfunc WideCharToMultiByte "WideCharToMultiByte" int, int, wstr, int, str, int, str, var

; uint WinExec(winmdroot.Foundation.PCSTR lpCmdLine, uint uCmdShow)
#cfunc WinExec "WinExec" str, int

; winmdroot.Foundation.BOOL WriteConsole(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.Foundation.PCWSTR lpBuffer, uint nNumberOfCharsToWrite, [Optional] uint* lpNumberOfCharsWritten, [Optional] void* lpReserved)
#cfunc WriteConsoleW "WriteConsoleW" intptr, wstr, int, var, intptr

; winmdroot.Foundation.BOOL WriteConsoleInput(winmdroot.Foundation.HANDLE hConsoleInput, winmdroot.System.Console.INPUT_RECORD* lpBuffer, uint nLength, uint* lpNumberOfEventsWritten)
#cfunc WriteConsoleInputW "WriteConsoleInputW" intptr, var, int, var

; winmdroot.Foundation.BOOL WriteConsoleOutput(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.System.Console.CHAR_INFO* lpBuffer, winmdroot.System.Console.COORD dwBufferSize, winmdroot.System.Console.COORD dwBufferCoord, winmdroot.System.Console.SMALL_RECT* lpWriteRegion)
#cfunc WriteConsoleOutputW "WriteConsoleOutputW" intptr, var, var, var, var

; winmdroot.Foundation.BOOL WriteConsoleOutputAttribute(winmdroot.Foundation.HANDLE hConsoleOutput, ushort* lpAttribute, uint nLength, winmdroot.System.Console.COORD dwWriteCoord, uint* lpNumberOfAttrsWritten)
#cfunc WriteConsoleOutputAttribute "WriteConsoleOutputAttribute" intptr, var, int, var, var

; winmdroot.Foundation.BOOL WriteConsoleOutputCharacter(winmdroot.Foundation.HANDLE hConsoleOutput, winmdroot.Foundation.PCWSTR lpCharacter, uint nLength, winmdroot.System.Console.COORD dwWriteCoord, uint* lpNumberOfCharsWritten)
#cfunc WriteConsoleOutputCharacterW "WriteConsoleOutputCharacterW" intptr, wstr, int, var, var

; winmdroot.Foundation.BOOL WriteFile(winmdroot.Foundation.HANDLE hFile, [Optional] byte* lpBuffer, uint nNumberOfBytesToWrite, [Optional] uint* lpNumberOfBytesWritten, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped)
#cfunc WriteFile "WriteFile" intptr, var, int, var, var

; winmdroot.Foundation.BOOL WriteFileEx(winmdroot.Foundation.HANDLE hFile, [Optional] byte* lpBuffer, uint nNumberOfBytesToWrite, global::System.Threading.NativeOverlapped* lpOverlapped, delegate *unmanaged[Stdcall]<uint,uint,global::System.Threading.NativeOverlapped*,void> lpCompletionRoutine)
#cfunc WriteFileEx "WriteFileEx" intptr, var, int, var, int

; winmdroot.Foundation.BOOL WriteFileGather(winmdroot.Foundation.HANDLE hFile, winmdroot.Storage.FileSystem.FILE_SEGMENT_ELEMENT* aSegmentArray, uint nNumberOfBytesToWrite, [Optional] uint* lpReserved, global::System.Threading.NativeOverlapped* lpOverlapped)
#cfunc WriteFileGather "WriteFileGather" intptr, var, int, var, var

; winmdroot.Foundation.BOOL WritePrivateProfileSection(winmdroot.Foundation.PCWSTR lpAppName, winmdroot.Foundation.PCWSTR lpString, winmdroot.Foundation.PCWSTR lpFileName)
#cfunc WritePrivateProfileSectionW "WritePrivateProfileSectionW" wstr, wstr, wstr

; winmdroot.Foundation.BOOL WritePrivateProfileString(winmdroot.Foundation.PCWSTR lpAppName, winmdroot.Foundation.PCWSTR lpKeyName, winmdroot.Foundation.PCWSTR lpString, winmdroot.Foundation.PCWSTR lpFileName)
#cfunc WritePrivateProfileStringW "WritePrivateProfileStringW" wstr, wstr, wstr, wstr

; winmdroot.Foundation.BOOL WritePrivateProfileStruct(winmdroot.Foundation.PCWSTR lpszSection, winmdroot.Foundation.PCWSTR lpszKey, [Optional] void* lpStruct, uint uSizeStruct, winmdroot.Foundation.PCWSTR szFile)
#cfunc WritePrivateProfileStructW "WritePrivateProfileStructW" wstr, wstr, intptr, int, wstr

; winmdroot.Foundation.BOOL WriteProcessMemory(winmdroot.Foundation.HANDLE hProcess, void* lpBaseAddress, void* lpBuffer, nuint nSize, [Optional] nuint* lpNumberOfBytesWritten)
#cfunc WriteProcessMemory "WriteProcessMemory" intptr, intptr, intptr, int, var

; winmdroot.Foundation.BOOL WriteProfileSection(winmdroot.Foundation.PCWSTR lpAppName, winmdroot.Foundation.PCWSTR lpString)
#cfunc WriteProfileSectionW "WriteProfileSectionW" wstr, wstr

; winmdroot.Foundation.BOOL WriteProfileString(winmdroot.Foundation.PCWSTR lpAppName, winmdroot.Foundation.PCWSTR lpKeyName, winmdroot.Foundation.PCWSTR lpString)
#cfunc WriteProfileStringW "WriteProfileStringW" wstr, wstr, wstr

; uint WriteTapemark(winmdroot.Foundation.HANDLE hDevice, winmdroot.Storage.FileSystem.TAPEMARK_TYPE dwTapemarkType, uint dwTapemarkCount, winmdroot.Foundation.BOOL bImmediate)
#cfunc WriteTapemark "WriteTapemark" intptr, int, int, int

; winmdroot.Foundation.BOOL ZombifyActCtx(winmdroot.Foundation.HANDLE hActCtx)
#cfunc ZombifyActCtx "ZombifyActCtx" intptr

; winmdroot.Foundation.PWSTR lstrcatW(winmdroot.Foundation.PWSTR lpString1, winmdroot.Foundation.PCWSTR lpString2)
#cfunc lstrcatW "lstrcatW" wstr, wstr

; int lstrcmpW(winmdroot.Foundation.PCWSTR lpString1, winmdroot.Foundation.PCWSTR lpString2)
#cfunc lstrcmpW "lstrcmpW" wstr, wstr

; int lstrcmpiW(winmdroot.Foundation.PCWSTR lpString1, winmdroot.Foundation.PCWSTR lpString2)
#cfunc lstrcmpiW "lstrcmpiW" wstr, wstr

; winmdroot.Foundation.PWSTR lstrcpyW(winmdroot.Foundation.PWSTR lpString1, winmdroot.Foundation.PCWSTR lpString2)
#cfunc lstrcpyW "lstrcpyW" wstr, wstr

; winmdroot.Foundation.PWSTR lstrcpynW(winmdroot.Foundation.PWSTR lpString1, winmdroot.Foundation.PCWSTR lpString2, int iMaxLength)
#cfunc lstrcpynW "lstrcpynW" wstr, wstr, int

; int lstrlenW(winmdroot.Foundation.PCWSTR lpString)
#cfunc lstrlenW "lstrlenW" wstr

#endif
