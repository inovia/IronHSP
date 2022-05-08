;(kernel32.as)
#ifdef __hsp30__
#ifndef __KERNEL32__
#define global __KERNEL32__
#uselib "KERNEL32.DLL"
	#define global AddAtom AddAtomA
	#func global AddAtomA "AddAtomA" sptr
	#func global AddAtomW "AddAtomW" wptr
	#func global AllocConsole "AllocConsole"
	#func global AllocateUserPhysicalPages "AllocateUserPhysicalPages" sptr,sptr,sptr
	#func global AreFileApisANSI "AreFileApisANSI"
	#func global AssignProcessToJobObject "AssignProcessToJobObject" sptr,sptr
	#func global BackupRead "BackupRead" sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global BackupSeek "BackupSeek" sptr,sptr,sptr,sptr,sptr,sptr
	#func global BackupWrite "BackupWrite" sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global Beep "Beep" sptr,sptr
	#define global BeginUpdateResource BeginUpdateResourceA
	#func global BeginUpdateResourceA "BeginUpdateResourceA" sptr,sptr
	#func global BeginUpdateResourceW "BeginUpdateResourceW" wptr,wptr
	#func global BindIoCompletionCallback "BindIoCompletionCallback" sptr,sptr,sptr
	#define global BuildCommDCB BuildCommDCBA
	#func global BuildCommDCBA "BuildCommDCBA" sptr,sptr
	#define global BuildCommDCBAndTimeouts BuildCommDCBAndTimeoutsA
	#func global BuildCommDCBAndTimeoutsA "BuildCommDCBAndTimeoutsA" sptr,sptr,sptr
	#func global BuildCommDCBAndTimeoutsW "BuildCommDCBAndTimeoutsW" wptr,wptr,wptr
	#func global BuildCommDCBW "BuildCommDCBW" wptr,wptr
	#define global CallNamedPipe CallNamedPipeA
	#func global CallNamedPipeA "CallNamedPipeA" sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global CallNamedPipeW "CallNamedPipeW" wptr,wptr,wptr,wptr,wptr,wptr,wptr
	#func global CancelDeviceWakeupRequest "CancelDeviceWakeupRequest" sptr
	#func global CancelIo "CancelIo" sptr
	#func global CancelTimerQueueTimer "CancelTimerQueueTimer" sptr,sptr
	#func global CancelWaitableTimer "CancelWaitableTimer" sptr
	#func global ChangeTimerQueueTimer "ChangeTimerQueueTimer" sptr,sptr,sptr,sptr
	#func global ClearCommBreak "ClearCommBreak" sptr
	#func global ClearCommError "ClearCommError" sptr,sptr,sptr
	#func global CloseHandle "CloseHandle" sptr
	#define global CommConfigDialog CommConfigDialogA
	#func global CommConfigDialogA "CommConfigDialogA" sptr,sptr,sptr
	#func global CommConfigDialogW "CommConfigDialogW" wptr,wptr,wptr
	#func global CompareFileTime "CompareFileTime" sptr,sptr
	#define global CompareString CompareStringA
	#func global CompareStringA "CompareStringA" sptr,sptr,sptr,sptr,sptr,sptr
	#func global CompareStringW "CompareStringW" wptr,wptr,wptr,wptr,wptr,wptr
	#func global ConnectNamedPipe "ConnectNamedPipe" sptr,sptr
	#func global ContinueDebugEvent "ContinueDebugEvent" sptr,sptr,sptr
	#func global ConvertDefaultLocale "ConvertDefaultLocale" sptr
	#func global ConvertThreadToFiber "ConvertThreadToFiber" sptr
	#define global CopyFile CopyFileA
	#func global CopyFileA "CopyFileA" sptr,sptr,sptr
	#define global CopyFileEx CopyFileExA
	#func global CopyFileExA "CopyFileExA" sptr,sptr,sptr,sptr,sptr,sptr
	#func global CopyFileExW "CopyFileExW" wptr,wptr,wptr,wptr,wptr,wptr
	#func global CopyFileW "CopyFileW" wptr,wptr,wptr
	#func global CreateConsoleScreenBuffer "CreateConsoleScreenBuffer" sptr,sptr,sptr,sptr,sptr
	#define global CreateDirectory CreateDirectoryA
	#func global CreateDirectoryA "CreateDirectoryA" sptr,sptr
	#define global CreateDirectoryEx CreateDirectoryExA
	#func global CreateDirectoryExA "CreateDirectoryExA" sptr,sptr,sptr
	#func global CreateDirectoryExW "CreateDirectoryExW" wptr,wptr,wptr
	#func global CreateDirectoryW "CreateDirectoryW" wptr,wptr
	#define global CreateEvent CreateEventA
	#func global CreateEventA "CreateEventA" sptr,sptr,sptr,sptr
	#func global CreateEventW "CreateEventW" wptr,wptr,wptr,wptr
	#func global CreateFiber "CreateFiber" sptr,sptr,sptr
	#define global CreateFile CreateFileA
	#func global CreateFileA "CreateFileA" sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#define global CreateFileMapping CreateFileMappingA
	#func global CreateFileMappingA "CreateFileMappingA" sptr,sptr,sptr,sptr,sptr,sptr
	#func global CreateFileMappingW "CreateFileMappingW" wptr,wptr,wptr,wptr,wptr,wptr
	#func global CreateFileW "CreateFileW" wptr,wptr,wptr,wptr,wptr,wptr,wptr
	#define global CreateHardLink CreateHardLinkA
	#func global CreateHardLinkA "CreateHardLinkA" sptr,sptr,sptr
	#func global CreateHardLinkW "CreateHardLinkW" wptr,wptr,wptr
	#func global CreateIoCompletionPort "CreateIoCompletionPort" sptr,sptr,sptr,sptr
	#define global CreateJobObject CreateJobObjectA
	#func global CreateJobObjectA "CreateJobObjectA" sptr,sptr
	#func global CreateJobObjectW "CreateJobObjectW" wptr,wptr
	#define global CreateMailslot CreateMailslotA
	#func global CreateMailslotA "CreateMailslotA" sptr,sptr,sptr,sptr
	#func global CreateMailslotW "CreateMailslotW" wptr,wptr,wptr,wptr
	#define global CreateMutex CreateMutexA
	#func global CreateMutexA "CreateMutexA" sptr,sptr,sptr
	#func global CreateMutexW "CreateMutexW" wptr,wptr,wptr
	#define global CreateNamedPipe CreateNamedPipeA
	#func global CreateNamedPipeA "CreateNamedPipeA" sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global CreateNamedPipeW "CreateNamedPipeW" wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr
	#func global CreatePipe "CreatePipe" sptr,sptr,sptr,sptr
	#define global CreateProcess CreateProcessA
	#func global CreateProcessA "CreateProcessA" sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global CreateProcessW "CreateProcessW" wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr
	#func global CreateRemoteThread "CreateRemoteThread" sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#define global CreateSemaphore CreateSemaphoreA
	#func global CreateSemaphoreA "CreateSemaphoreA" sptr,sptr,sptr,sptr
	#func global CreateSemaphoreW "CreateSemaphoreW" wptr,wptr,wptr,wptr
	#func global CreateTapePartition "CreateTapePartition" sptr,sptr,sptr,sptr
	#func global CreateThread "CreateThread" sptr,sptr,sptr,sptr,sptr,sptr
	#func global CreateTimerQueue "CreateTimerQueue"
	#func global CreateTimerQueueTimer "CreateTimerQueueTimer" sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global CreateToolhelp32Snapshot "CreateToolhelp32Snapshot" sptr,sptr
	#define global CreateWaitableTimer CreateWaitableTimerA
	#func global CreateWaitableTimerA "CreateWaitableTimerA" sptr,sptr,sptr
	#func global CreateWaitableTimerW "CreateWaitableTimerW" wptr,wptr,wptr
	#func global DebugActiveProcess "DebugActiveProcess" sptr
	#func global DebugBreak "DebugBreak"
	#define global DefineDosDevice DefineDosDeviceA
	#func global DefineDosDeviceA "DefineDosDeviceA" sptr,sptr,sptr
	#func global DefineDosDeviceW "DefineDosDeviceW" wptr,wptr,wptr
	#func global DeleteAtom "DeleteAtom" sptr
	#func global DeleteCriticalSection "DeleteCriticalSection" sptr
	#func global DeleteFiber "DeleteFiber" sptr
	#define global DeleteFile DeleteFileA
	#func global DeleteFileA "DeleteFileA" sptr
	#func global DeleteFileW "DeleteFileW" wptr
	#func global DeleteTimerQueue "DeleteTimerQueue" sptr
	#func global DeleteTimerQueueEx "DeleteTimerQueueEx" sptr,sptr
	#func global DeleteTimerQueueTimer "DeleteTimerQueueTimer" sptr,sptr,sptr
	#define global DeleteVolumeMountPoint DeleteVolumeMountPointA
	#func global DeleteVolumeMountPointA "DeleteVolumeMountPointA" sptr
	#func global DeleteVolumeMountPointW "DeleteVolumeMountPointW" wptr
	#func global DeviceIoControl "DeviceIoControl" sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global DisableThreadLibraryCalls "DisableThreadLibraryCalls" sptr
	#func global DisconnectNamedPipe "DisconnectNamedPipe" sptr
	#define global DnsHostnameToComputerName DnsHostnameToComputerNameA
	#func global DnsHostnameToComputerNameA "DnsHostnameToComputerNameA" sptr,sptr,sptr
	#func global DnsHostnameToComputerNameW "DnsHostnameToComputerNameW" wptr,wptr,wptr
	#func global DosDateTimeToFileTime "DosDateTimeToFileTime" sptr,sptr,sptr
	#func global DuplicateHandle "DuplicateHandle" sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#define global EndUpdateResource EndUpdateResourceA
	#func global EndUpdateResourceA "EndUpdateResourceA" sptr,sptr
	#func global EndUpdateResourceW "EndUpdateResourceW" wptr,wptr
	#func global EnterCriticalSection "EnterCriticalSection" sptr
	#define global EnumCalendarInfo EnumCalendarInfoA
	#func global EnumCalendarInfoA "EnumCalendarInfoA" sptr,sptr,sptr,sptr
	#define global EnumCalendarInfoEx EnumCalendarInfoExA
	#func global EnumCalendarInfoExA "EnumCalendarInfoExA" sptr,sptr,sptr,sptr
	#func global EnumCalendarInfoExW "EnumCalendarInfoExW" wptr,wptr,wptr,wptr
	#func global EnumCalendarInfoW "EnumCalendarInfoW" wptr,wptr,wptr,wptr
	#define global EnumDateFormats EnumDateFormatsA
	#func global EnumDateFormatsA "EnumDateFormatsA" sptr,sptr,sptr
	#define global EnumDateFormatsEx EnumDateFormatsExA
	#func global EnumDateFormatsExA "EnumDateFormatsExA" sptr,sptr,sptr
	#func global EnumDateFormatsExW "EnumDateFormatsExW" wptr,wptr,wptr
	#func global EnumDateFormatsW "EnumDateFormatsW" wptr,wptr,wptr
	#define global EnumLanguageGroupLocales EnumLanguageGroupLocalesA
	#func global EnumLanguageGroupLocalesA "EnumLanguageGroupLocalesA" sptr,sptr,sptr,sptr
	#func global EnumLanguageGroupLocalesW "EnumLanguageGroupLocalesW" wptr,wptr,wptr,wptr
	#define global EnumResourceLanguages EnumResourceLanguagesA
	#func global EnumResourceLanguagesA "EnumResourceLanguagesA" sptr,sptr,sptr,sptr,sptr
	#func global EnumResourceLanguagesW "EnumResourceLanguagesW" wptr,wptr,wptr,wptr,wptr
	#define global EnumResourceNames EnumResourceNamesA
	#func global EnumResourceNamesA "EnumResourceNamesA" sptr,sptr,sptr,sptr
	#func global EnumResourceNamesW "EnumResourceNamesW" wptr,wptr,wptr,wptr
	#define global EnumResourceTypes EnumResourceTypesA
	#func global EnumResourceTypesA "EnumResourceTypesA" sptr,sptr,sptr
	#func global EnumResourceTypesW "EnumResourceTypesW" wptr,wptr,wptr
	#define global EnumSystemCodePages EnumSystemCodePagesA
	#func global EnumSystemCodePagesA "EnumSystemCodePagesA" sptr,sptr
	#func global EnumSystemCodePagesW "EnumSystemCodePagesW" wptr,wptr
	#define global EnumSystemLanguageGroups EnumSystemLanguageGroupsA
	#func global EnumSystemLanguageGroupsA "EnumSystemLanguageGroupsA" sptr,sptr,sptr
	#func global EnumSystemLanguageGroupsW "EnumSystemLanguageGroupsW" wptr,wptr,wptr
	#define global EnumSystemLocales EnumSystemLocalesA
	#func global EnumSystemLocalesA "EnumSystemLocalesA" sptr,sptr
	#func global EnumSystemLocalesW "EnumSystemLocalesW" wptr,wptr
	#define global EnumTimeFormats EnumTimeFormatsA
	#func global EnumTimeFormatsA "EnumTimeFormatsA" sptr,sptr,sptr
	#func global EnumTimeFormatsW "EnumTimeFormatsW" wptr,wptr,wptr
	#define global EnumUILanguages EnumUILanguagesA
	#func global EnumUILanguagesA "EnumUILanguagesA" sptr,sptr,sptr
	#func global EnumUILanguagesW "EnumUILanguagesW" wptr,wptr,wptr
	#func global EraseTape "EraseTape" sptr,sptr,sptr
	#func global EscapeCommFunction "EscapeCommFunction" sptr,sptr
	#func global ExitProcess "ExitProcess" sptr
	#func global ExitThread "ExitThread" sptr
	#define global ExpandEnvironmentStrings ExpandEnvironmentStringsA
	#func global ExpandEnvironmentStringsA "ExpandEnvironmentStringsA" sptr,sptr,sptr
	#func global ExpandEnvironmentStringsW "ExpandEnvironmentStringsW" wptr,wptr,wptr
	#define global FatalAppExit FatalAppExitA
	#func global FatalAppExitA "FatalAppExitA" sptr,sptr
	#func global FatalAppExitW "FatalAppExitW" wptr,wptr
	#func global FatalExit "FatalExit" sptr
	#func global FileTimeToDosDateTime "FileTimeToDosDateTime" sptr,sptr,sptr
	#func global FileTimeToLocalFileTime "FileTimeToLocalFileTime" sptr,sptr
	#func global FileTimeToSystemTime "FileTimeToSystemTime" sptr,sptr
	#func global FillConsoleOutputAttribute "FillConsoleOutputAttribute" sptr,sptr,sptr,sptr,sptr
	#define global FillConsoleOutputCharacter FillConsoleOutputCharacterA
	#func global FillConsoleOutputCharacterA "FillConsoleOutputCharacterA" sptr,sptr,sptr,sptr,sptr
	#func global FillConsoleOutputCharacterW "FillConsoleOutputCharacterW" wptr,wptr,wptr,wptr,wptr
	#define global FindAtom FindAtomA
	#func global FindAtomA "FindAtomA" sptr
	#func global FindAtomW "FindAtomW" wptr
	#func global FindClose "FindClose" sptr
	#func global FindCloseChangeNotification "FindCloseChangeNotification" sptr
	#define global FindFirstChangeNotification FindFirstChangeNotificationA
	#func global FindFirstChangeNotificationA "FindFirstChangeNotificationA" sptr,sptr,sptr
	#func global FindFirstChangeNotificationW "FindFirstChangeNotificationW" wptr,wptr,wptr
	#define global FindFirstFile FindFirstFileA
	#func global FindFirstFileA "FindFirstFileA" sptr,sptr
	#define global FindFirstFileEx FindFirstFileExA
	#func global FindFirstFileExA "FindFirstFileExA" sptr,sptr,sptr,sptr,sptr,sptr
	#func global FindFirstFileExW "FindFirstFileExW" wptr,wptr,wptr,wptr,wptr,wptr
	#func global FindFirstFileW "FindFirstFileW" wptr,wptr
	#define global FindFirstVolume FindFirstVolumeA
	#func global FindFirstVolumeA "FindFirstVolumeA" sptr,sptr
	#define global FindFirstVolumeMountPoint FindFirstVolumeMountPointA
	#func global FindFirstVolumeMountPointA "FindFirstVolumeMountPointA" sptr,sptr,sptr
	#func global FindFirstVolumeMountPointW "FindFirstVolumeMountPointW" wptr,wptr,wptr
	#func global FindFirstVolumeW "FindFirstVolumeW" wptr,wptr
	#func global FindNextChangeNotification "FindNextChangeNotification" sptr
	#define global FindNextFile FindNextFileA
	#func global FindNextFileA "FindNextFileA" sptr,sptr
	#func global FindNextFileW "FindNextFileW" wptr,wptr
	#define global FindNextVolume FindNextVolumeA
	#func global FindNextVolumeA "FindNextVolumeA" sptr,sptr,sptr
	#define global FindNextVolumeMountPoint FindNextVolumeMountPointA
	#func global FindNextVolumeMountPointA "FindNextVolumeMountPointA" sptr,sptr,sptr
	#func global FindNextVolumeMountPointW "FindNextVolumeMountPointW" wptr,wptr,wptr
	#func global FindNextVolumeW "FindNextVolumeW" wptr,wptr,wptr
	#define global FindResource FindResourceA
	#func global FindResourceA "FindResourceA" sptr,sptr,sptr
	#define global FindResourceEx FindResourceExA
	#func global FindResourceExA "FindResourceExA" sptr,sptr,sptr,sptr
	#func global FindResourceExW "FindResourceExW" wptr,wptr,wptr,wptr
	#func global FindResourceW "FindResourceW" wptr,wptr,wptr
	#func global FindVolumeClose "FindVolumeClose" sptr
	#func global FindVolumeMountPointClose "FindVolumeMountPointClose" sptr
	#func global FlushConsoleInputBuffer "FlushConsoleInputBuffer" sptr
	#func global FlushFileBuffers "FlushFileBuffers" sptr
	#func global FlushInstructionCache "FlushInstructionCache" sptr,sptr,sptr
	#func global FlushViewOfFile "FlushViewOfFile" sptr,sptr
	#define global FoldString FoldStringA
	#func global FoldStringA "FoldStringA" sptr,sptr,sptr,sptr,sptr
	#func global FoldStringW "FoldStringW" wptr,wptr,wptr,wptr,wptr
	#define global FormatMessage FormatMessageA
	#func global FormatMessageA "FormatMessageA" sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global FormatMessageW "FormatMessageW" wptr,wptr,wptr,wptr,wptr,wptr,wptr
	#func global FreeConsole "FreeConsole"
	#define global FreeEnvironmentStrings FreeEnvironmentStringsA
	#func global FreeEnvironmentStringsA "FreeEnvironmentStringsA" sptr
	#func global FreeEnvironmentStringsW "FreeEnvironmentStringsW" wptr
	#func global FreeLibrary "FreeLibrary" sptr
	#func global FreeLibraryAndExitThread "FreeLibraryAndExitThread" sptr,sptr
	#func global FreeResource "FreeResource" sptr
	#func global FreeUserPhysicalPages "FreeUserPhysicalPages" sptr,sptr,sptr
	#func global GenerateConsoleCtrlEvent "GenerateConsoleCtrlEvent" sptr,sptr
	#func global GetACP "GetACP"
	#define global GetAtomName GetAtomNameA
	#func global GetAtomNameA "GetAtomNameA" sptr,sptr,sptr
	#func global GetAtomNameW "GetAtomNameW" wptr,wptr,wptr
	#func global GetBinaryType "GetBinaryType" sptr,sptr
	#func global GetBinaryTypeA "GetBinaryTypeA" sptr,sptr
	#func global GetBinaryTypeW "GetBinaryTypeW" wptr,wptr
	#func global GetCPInfo "GetCPInfo" sptr,sptr
	#define global GetCPInfoEx GetCPInfoExA
	#func global GetCPInfoExA "GetCPInfoExA" sptr,sptr,sptr
	#func global GetCPInfoExW "GetCPInfoExW" wptr,wptr,wptr
	#define global GetCalendarInfo GetCalendarInfoA
	#func global GetCalendarInfoA "GetCalendarInfoA" sptr,sptr,sptr,sptr,sptr,sptr
	#func global GetCalendarInfoW "GetCalendarInfoW" wptr,wptr,wptr,wptr,wptr,wptr
	#func global GetCommConfig "GetCommConfig" sptr,sptr,sptr
	#func global GetCommMask "GetCommMask" sptr,sptr
	#func global GetCommModemStatus "GetCommModemStatus" sptr,sptr
	#func global GetCommProperties "GetCommProperties" sptr,sptr
	#func global GetCommState "GetCommState" sptr,sptr
	#func global GetCommTimeouts "GetCommTimeouts" sptr,sptr
	#define global GetCommandLine GetCommandLineA
	#func global GetCommandLineA "GetCommandLineA"
	#func global GetCommandLineW "GetCommandLineW"
	#define global GetCompressedFileSize GetCompressedFileSizeA
	#func global GetCompressedFileSizeA "GetCompressedFileSizeA" sptr,sptr
	#func global GetCompressedFileSizeW "GetCompressedFileSizeW" wptr,wptr
	#define global GetComputerName GetComputerNameA
	#func global GetComputerNameA "GetComputerNameA" sptr,sptr
	#define global GetComputerNameEx GetComputerNameExA
	#func global GetComputerNameExA "GetComputerNameExA" sptr,sptr,sptr
	#func global GetComputerNameExW "GetComputerNameExW" wptr,wptr,wptr
	#func global GetComputerNameW "GetComputerNameW" wptr,wptr
	#func global GetConsoleCP "GetConsoleCP"
	#func global GetConsoleCursorInfo "GetConsoleCursorInfo" sptr,sptr
	#func global GetConsoleMode "GetConsoleMode" sptr,sptr
	#func global GetConsoleOutputCP "GetConsoleOutputCP"
	#func global GetConsoleScreenBufferInfo "GetConsoleScreenBufferInfo" sptr,sptr
	#define global GetConsoleTitle GetConsoleTitleA
	#func global GetConsoleTitleA "GetConsoleTitleA" sptr,sptr
	#func global GetConsoleTitleW "GetConsoleTitleW" wptr,wptr
	#define global GetCurrencyFormat GetCurrencyFormatA
	#func global GetCurrencyFormatA "GetCurrencyFormatA" sptr,sptr,sptr,sptr,sptr,sptr
	#func global GetCurrencyFormatW "GetCurrencyFormatW" wptr,wptr,wptr,wptr,wptr,wptr
	#define global GetCurrentDirectory GetCurrentDirectoryA
	#func global GetCurrentDirectoryA "GetCurrentDirectoryA" sptr,sptr
	#func global GetCurrentDirectoryW "GetCurrentDirectoryW" wptr,wptr
	#func global GetCurrentProcess "GetCurrentProcess"
	#func global GetCurrentProcessId "GetCurrentProcessId"
	#func global GetCurrentThread "GetCurrentThread"
	#func global GetCurrentThreadId "GetCurrentThreadId"
	#define global GetDateFormat GetDateFormatA
	#func global GetDateFormatA "GetDateFormatA" sptr,sptr,sptr,sptr,sptr,sptr
	#func global GetDateFormatW "GetDateFormatW" wptr,wptr,wptr,wptr,wptr,wptr
	#define global GetDefaultCommConfig GetDefaultCommConfigA
	#func global GetDefaultCommConfigA "GetDefaultCommConfigA" sptr,sptr,sptr
	#func global GetDefaultCommConfigW "GetDefaultCommConfigW" wptr,wptr,wptr
	#func global GetDevicePowerState "GetDevicePowerState" sptr,sptr
	#define global GetDiskFreeSpace GetDiskFreeSpaceA
	#func global GetDiskFreeSpaceA "GetDiskFreeSpaceA" sptr,sptr,sptr,sptr,sptr
	#define global GetDiskFreeSpaceEx GetDiskFreeSpaceExA
	#func global GetDiskFreeSpaceExA "GetDiskFreeSpaceExA" sptr,sptr,sptr,sptr
	#func global GetDiskFreeSpaceExW "GetDiskFreeSpaceExW" wptr,wptr,wptr,wptr
	#func global GetDiskFreeSpaceW "GetDiskFreeSpaceW" wptr,wptr,wptr,wptr,wptr
	#define global GetDriveType GetDriveTypeA
	#func global GetDriveTypeA "GetDriveTypeA" sptr
	#func global GetDriveTypeW "GetDriveTypeW" wptr
	#func global GetEnvironmentStrings "GetEnvironmentStrings"
	#func global GetEnvironmentStringsA "GetEnvironmentStringsA"
	#func global GetEnvironmentStringsW "GetEnvironmentStringsW"
	#define global GetEnvironmentVariable GetEnvironmentVariableA
	#func global GetEnvironmentVariableA "GetEnvironmentVariableA" sptr,sptr,sptr
	#func global GetEnvironmentVariableW "GetEnvironmentVariableW" wptr,wptr,wptr
	#func global GetExitCodeProcess "GetExitCodeProcess" sptr,sptr
	#func global GetExitCodeThread "GetExitCodeThread" sptr,sptr
	#define global GetFileAttributes GetFileAttributesA
	#func global GetFileAttributesA "GetFileAttributesA" sptr
	#define global GetFileAttributesEx GetFileAttributesExA
	#func global GetFileAttributesExA "GetFileAttributesExA" sptr,sptr,sptr
	#func global GetFileAttributesExW "GetFileAttributesExW" wptr,wptr,wptr
	#func global GetFileAttributesW "GetFileAttributesW" wptr
	#func global GetFileInformationByHandle "GetFileInformationByHandle" sptr,sptr
	#func global GetFileSize "GetFileSize" sptr,sptr
	#func global GetFileSizeEx "GetFileSizeEx" sptr,sptr
	#func global GetFileTime "GetFileTime" sptr,sptr,sptr,sptr
	#func global GetFileType "GetFileType" sptr
	#define global GetFullPathName GetFullPathNameA
	#func global GetFullPathNameA "GetFullPathNameA" sptr,sptr,sptr,sptr
	#func global GetFullPathNameW "GetFullPathNameW" wptr,wptr,wptr,wptr
	#func global GetHandleInformation "GetHandleInformation" sptr,sptr
	#func global GetLargestConsoleWindowSize "GetLargestConsoleWindowSize" sptr
	#func global GetLastError "GetLastError"
	#func global GetLocalTime "GetLocalTime" sptr
	#define global GetLocaleInfo GetLocaleInfoA
	#func global GetLocaleInfoA "GetLocaleInfoA" sptr,sptr,sptr,sptr
	#func global GetLocaleInfoW "GetLocaleInfoW" wptr,wptr,wptr,wptr
	#define global GetLogicalDriveStrings GetLogicalDriveStringsA
	#func global GetLogicalDriveStringsA "GetLogicalDriveStringsA" sptr,sptr
	#func global GetLogicalDriveStringsW "GetLogicalDriveStringsW" wptr,wptr
	#func global GetLogicalDrives "GetLogicalDrives"
	#define global GetLongPathName GetLongPathNameA
	#func global GetLongPathNameA "GetLongPathNameA" sptr,sptr,sptr
	#func global GetLongPathNameW "GetLongPathNameW" wptr,wptr,wptr
	#func global GetMailslotInfo "GetMailslotInfo" sptr,sptr,sptr,sptr,sptr
	#define global GetModuleFileName GetModuleFileNameA
	#func global GetModuleFileNameA "GetModuleFileNameA" sptr,sptr,sptr
	#func global GetModuleFileNameW "GetModuleFileNameW" wptr,wptr,wptr
	#define global GetModuleHandle GetModuleHandleA
	#func global GetModuleHandleA "GetModuleHandleA" sptr
	#func global GetModuleHandleW "GetModuleHandleW" wptr
	#define global GetNamedPipeHandleState GetNamedPipeHandleStateA
	#func global GetNamedPipeHandleStateA "GetNamedPipeHandleStateA" sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global GetNamedPipeHandleStateW "GetNamedPipeHandleStateW" wptr,wptr,wptr,wptr,wptr,wptr,wptr
	#func global GetNamedPipeInfo "GetNamedPipeInfo" sptr,sptr,sptr,sptr,sptr
	#define global GetNumberFormat GetNumberFormatA
	#func global GetNumberFormatA "GetNumberFormatA" sptr,sptr,sptr,sptr,sptr,sptr
	#func global GetNumberFormatW "GetNumberFormatW" wptr,wptr,wptr,wptr,wptr,wptr
	#func global GetNumberOfConsoleInputEvents "GetNumberOfConsoleInputEvents" sptr,sptr
	#func global GetNumberOfConsoleMouseButtons "GetNumberOfConsoleMouseButtons" sptr
	#func global GetOEMCP "GetOEMCP"
	#func global GetOverlappedResult "GetOverlappedResult" sptr,sptr,sptr,sptr
	#func global GetPriorityClass "GetPriorityClass" sptr
	#define global GetPrivateProfileInt GetPrivateProfileIntA
	#func global GetPrivateProfileIntA "GetPrivateProfileIntA" sptr,sptr,sptr,sptr
	#func global GetPrivateProfileIntW "GetPrivateProfileIntW" wptr,wptr,wptr,wptr
	#define global GetPrivateProfileSection GetPrivateProfileSectionA
	#func global GetPrivateProfileSectionA "GetPrivateProfileSectionA" sptr,sptr,sptr,sptr
	#define global GetPrivateProfileSectionNames GetPrivateProfileSectionNamesA
	#func global GetPrivateProfileSectionNamesA "GetPrivateProfileSectionNamesA" sptr,sptr,sptr
	#func global GetPrivateProfileSectionNamesW "GetPrivateProfileSectionNamesW" wptr,wptr,wptr
	#func global GetPrivateProfileSectionW "GetPrivateProfileSectionW" wptr,wptr,wptr,wptr
	#define global GetPrivateProfileString GetPrivateProfileStringA
	#func global GetPrivateProfileStringA "GetPrivateProfileStringA" sptr,sptr,sptr,sptr,sptr,sptr
	#func global GetPrivateProfileStringW "GetPrivateProfileStringW" wptr,wptr,wptr,wptr,wptr,wptr
	#define global GetPrivateProfileStruct GetPrivateProfileStructA
	#func global GetPrivateProfileStructA "GetPrivateProfileStructA" sptr,sptr,sptr,sptr,sptr
	#func global GetPrivateProfileStructW "GetPrivateProfileStructW" wptr,wptr,wptr,wptr,wptr
	#func global GetProcAddress "GetProcAddress" sptr,sptr
	#func global GetProcessAffinityMask "GetProcessAffinityMask" sptr,sptr,sptr
	#func global GetProcessHeap "GetProcessHeap"
	#func global GetProcessHeaps "GetProcessHeaps" sptr,sptr
	#func global GetProcessIoCounters "GetProcessIoCounters" sptr,sptr
	#func global GetProcessPriorityBoost "GetProcessPriorityBoost" sptr,sptr
	#func global GetProcessShutdownParameters "GetProcessShutdownParameters" sptr,sptr
	#func global GetProcessTimes "GetProcessTimes" sptr,sptr,sptr,sptr,sptr
	#func global GetProcessVersion "GetProcessVersion" sptr
	#func global GetProcessWorkingSetSize "GetProcessWorkingSetSize" sptr,sptr,sptr
	#define global GetProfileInt GetProfileIntA
	#func global GetProfileIntA "GetProfileIntA" sptr,sptr,sptr
	#func global GetProfileIntW "GetProfileIntW" wptr,wptr,wptr
	#define global GetProfileSection GetProfileSectionA
	#func global GetProfileSectionA "GetProfileSectionA" sptr,sptr,sptr
	#func global GetProfileSectionW "GetProfileSectionW" wptr,wptr,wptr
	#define global GetProfileString GetProfileStringA
	#func global GetProfileStringA "GetProfileStringA" sptr,sptr,sptr,sptr,sptr
	#func global GetProfileStringW "GetProfileStringW" wptr,wptr,wptr,wptr,wptr
	#func global GetQueuedCompletionStatus "GetQueuedCompletionStatus" sptr,sptr,sptr,sptr,sptr
	#define global GetShortPathName GetShortPathNameA
	#func global GetShortPathNameA "GetShortPathNameA" sptr,sptr,sptr
	#func global GetShortPathNameW "GetShortPathNameW" wptr,wptr,wptr
	#define global GetStartupInfo GetStartupInfoA
	#func global GetStartupInfoA "GetStartupInfoA" sptr
	#func global GetStartupInfoW "GetStartupInfoW" wptr
	#func global GetStdHandle "GetStdHandle" sptr
	#define global GetStringType GetStringTypeA
	#func global GetStringTypeA "GetStringTypeA" sptr,sptr,sptr,sptr,sptr
	#define global GetStringTypeEx GetStringTypeExA
	#func global GetStringTypeExA "GetStringTypeExA" sptr,sptr,sptr,sptr,sptr
	#func global GetStringTypeExW "GetStringTypeExW" wptr,wptr,wptr,wptr,wptr
	#func global GetStringTypeW "GetStringTypeW" wptr,wptr,wptr,wptr
	#func global GetSystemDefaultLCID "GetSystemDefaultLCID"
	#func global GetSystemDefaultLangID "GetSystemDefaultLangID"
	#func global GetSystemDefaultUILanguage "GetSystemDefaultUILanguage"
	#define global GetSystemDirectory GetSystemDirectoryA
	#func global GetSystemDirectoryA "GetSystemDirectoryA" sptr,sptr
	#func global GetSystemDirectoryW "GetSystemDirectoryW" wptr,wptr
	#func global GetSystemInfo "GetSystemInfo" sptr
	#func global GetSystemPowerStatus "GetSystemPowerStatus" sptr
	#func global GetSystemTime "GetSystemTime" sptr
	#func global GetSystemTimeAdjustment "GetSystemTimeAdjustment" sptr,sptr,sptr
	#func global GetSystemTimeAsFileTime "GetSystemTimeAsFileTime" sptr
	#define global GetSystemWindowsDirectory GetSystemWindowsDirectoryA
	#func global GetSystemWindowsDirectoryA "GetSystemWindowsDirectoryA" sptr,sptr
	#func global GetSystemWindowsDirectoryW "GetSystemWindowsDirectoryW" wptr,wptr
	#func global GetTapeParameters "GetTapeParameters" sptr,sptr,sptr,sptr
	#func global GetTapePosition "GetTapePosition" sptr,sptr,sptr,sptr,sptr
	#func global GetTapeStatus "GetTapeStatus" sptr
	#define global GetTempFileName GetTempFileNameA
	#func global GetTempFileNameA "GetTempFileNameA" sptr,sptr,sptr,sptr
	#func global GetTempFileNameW "GetTempFileNameW" wptr,wptr,wptr,wptr
	#define global GetTempPath GetTempPathA
	#func global GetTempPathA "GetTempPathA" sptr,sptr
	#func global GetTempPathW "GetTempPathW" wptr,wptr
	#func global GetThreadContext "GetThreadContext" sptr,sptr
	#func global GetThreadLocale "GetThreadLocale"
	#func global GetThreadPriority "GetThreadPriority" sptr
	#func global GetThreadPriorityBoost "GetThreadPriorityBoost" sptr,sptr
	#func global GetThreadSelectorEntry "GetThreadSelectorEntry" sptr,sptr,sptr
	#func global GetThreadTimes "GetThreadTimes" sptr,sptr,sptr,sptr,sptr
	#func global GetTickCount "GetTickCount"
	#define global GetTimeFormat GetTimeFormatA
	#func global GetTimeFormatA "GetTimeFormatA" sptr,sptr,sptr,sptr,sptr,sptr
	#func global GetTimeFormatW "GetTimeFormatW" wptr,wptr,wptr,wptr,wptr,wptr
	#func global GetTimeZoneInformation "GetTimeZoneInformation" sptr
	#func global GetUserDefaultLCID "GetUserDefaultLCID"
	#func global GetUserDefaultLangID "GetUserDefaultLangID"
	#func global GetUserDefaultUILanguage "GetUserDefaultUILanguage"
	#func global GetVersion "GetVersion"
	#define global GetVersionEx GetVersionExA
	#func global GetVersionExA "GetVersionExA" sptr
	#func global GetVersionExW "GetVersionExW" wptr
	#define global GetVolumeInformation GetVolumeInformationA
	#func global GetVolumeInformationA "GetVolumeInformationA" sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global GetVolumeInformationW "GetVolumeInformationW" wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr
	#define global GetVolumeNameForVolumeMountPoint GetVolumeNameForVolumeMountPointA
	#func global GetVolumeNameForVolumeMountPointA "GetVolumeNameForVolumeMountPointA" sptr,sptr,sptr
	#func global GetVolumeNameForVolumeMountPointW "GetVolumeNameForVolumeMountPointW" wptr,wptr,wptr
	#define global GetVolumePathName GetVolumePathNameA
	#func global GetVolumePathNameA "GetVolumePathNameA" sptr,sptr,sptr
	#func global GetVolumePathNameW "GetVolumePathNameW" wptr,wptr,wptr
	#define global GetWindowsDirectory GetWindowsDirectoryA
	#func global GetWindowsDirectoryA "GetWindowsDirectoryA" sptr,sptr
	#func global GetWindowsDirectoryW "GetWindowsDirectoryW" wptr,wptr
	#func global GetWriteWatch "GetWriteWatch" sptr,sptr,sptr,sptr,sptr,sptr
	#define global GlobalAddAtom GlobalAddAtomA
	#func global GlobalAddAtomA "GlobalAddAtomA" sptr
	#func global GlobalAddAtomW "GlobalAddAtomW" wptr
	#func global GlobalAlloc "GlobalAlloc" sptr,sptr
	#func global GlobalCompact "GlobalCompact" sptr
	#func global GlobalDeleteAtom "GlobalDeleteAtom" sptr
	#define global GlobalFindAtom GlobalFindAtomA
	#func global GlobalFindAtomA "GlobalFindAtomA" sptr
	#func global GlobalFindAtomW "GlobalFindAtomW" wptr
	#func global GlobalFix "GlobalFix" sptr
	#func global GlobalFlags "GlobalFlags" sptr
	#func global GlobalFree "GlobalFree" sptr
	#define global GlobalGetAtomName GlobalGetAtomNameA
	#func global GlobalGetAtomNameA "GlobalGetAtomNameA" sptr,sptr,sptr
	#func global GlobalGetAtomNameW "GlobalGetAtomNameW" wptr,wptr,wptr
	#func global GlobalHandle "GlobalHandle" sptr
	#func global GlobalLock "GlobalLock" sptr
	#func global GlobalMemoryStatus "GlobalMemoryStatus" sptr
	#func global GlobalMemoryStatusEx "GlobalMemoryStatusEx" sptr
	#func global GlobalReAlloc "GlobalReAlloc" sptr,sptr,sptr
	#func global GlobalSize "GlobalSize" sptr
	#func global GlobalUnWire "GlobalUnWire" sptr
	#func global GlobalUnfix "GlobalUnfix" sptr
	#func global GlobalUnlock "GlobalUnlock" sptr
	#func global GlobalWire "GlobalWire" sptr
	#func global Heap32First "Heap32First" sptr,sptr,sptr
	#func global Heap32ListFirst "Heap32ListFirst" sptr,sptr
	#func global Heap32ListNext "Heap32ListNext" sptr,sptr
	#func global Heap32Next "Heap32Next" sptr
	#func global HeapAlloc "HeapAlloc" sptr,sptr,sptr
	#func global HeapCompact "HeapCompact" sptr,sptr
	#func global HeapCreate "HeapCreate" sptr,sptr,sptr
	#func global HeapDestroy "HeapDestroy" sptr
	#func global HeapFree "HeapFree" sptr,sptr,sptr
	#func global HeapLock "HeapLock" sptr
	#func global HeapReAlloc "HeapReAlloc" sptr,sptr,sptr,sptr
	#func global HeapSize "HeapSize" sptr,sptr,sptr
	#func global HeapUnlock "HeapUnlock" sptr
	#func global HeapValidate "HeapValidate" sptr,sptr,sptr
	#func global HeapWalk "HeapWalk" sptr,sptr
	#func global InitAtomTable "InitAtomTable" sptr
	#func global InitializeCriticalSection "InitializeCriticalSection" sptr
	#func global InitializeCriticalSectionAndSpinCount "InitializeCriticalSectionAndSpinCount" sptr,sptr
	#func global InterlockedCompareExchange "InterlockedCompareExchange" sptr,sptr,sptr
	#func global InterlockedDecrement "InterlockedDecrement" sptr
	#func global InterlockedExchange "InterlockedExchange" sptr,sptr
	#func global InterlockedExchangeAdd "InterlockedExchangeAdd" sptr,sptr
	#func global InterlockedIncrement "InterlockedIncrement" sptr
	#func global IsBadCodePtr "IsBadCodePtr" sptr
	#func global IsBadHugeReadPtr "IsBadHugeReadPtr" sptr,sptr
	#func global IsBadHugeWritePtr "IsBadHugeWritePtr" sptr,sptr
	#func global IsBadReadPtr "IsBadReadPtr" sptr,sptr
	#define global IsBadStringPtr IsBadStringPtrA
	#func global IsBadStringPtrA "IsBadStringPtrA" sptr,sptr
	#func global IsBadStringPtrW "IsBadStringPtrW" wptr,wptr
	#func global IsBadWritePtr "IsBadWritePtr" sptr,sptr
	#func global IsDBCSLeadByte "IsDBCSLeadByte" sptr
	#func global IsDBCSLeadByteEx "IsDBCSLeadByteEx" sptr,sptr
	#func global IsDebuggerPresent "IsDebuggerPresent"
	#func global IsProcessorFeaturePresent "IsProcessorFeaturePresent" sptr
	#func global IsSystemResumeAutomatic "IsSystemResumeAutomatic"
	#func global IsValidCodePage "IsValidCodePage" sptr
	#func global IsValidLanguageGroup "IsValidLanguageGroup" sptr,sptr
	#func global IsValidLocale "IsValidLocale" sptr,sptr
	#define global LCMapString LCMapStringA
	#func global LCMapStringA "LCMapStringA" sptr,sptr,sptr,sptr,sptr,sptr
	#func global LCMapStringW "LCMapStringW" wptr,wptr,wptr,wptr,wptr,wptr
	#func global LeaveCriticalSection "LeaveCriticalSection" sptr
	#define global LoadLibrary LoadLibraryA
	#func global LoadLibraryA "LoadLibraryA" sptr
	#define global LoadLibraryEx LoadLibraryExA
	#func global LoadLibraryExA "LoadLibraryExA" sptr,sptr,sptr
	#func global LoadLibraryExW "LoadLibraryExW" wptr,wptr,wptr
	#func global LoadLibraryW "LoadLibraryW" wptr
	#func global LoadModule "LoadModule" sptr,sptr
	#func global LoadResource "LoadResource" sptr,sptr
	#func global LocalAlloc "LocalAlloc" sptr,sptr
	#func global LocalCompact "LocalCompact" sptr
	#func global LocalFileTimeToFileTime "LocalFileTimeToFileTime" sptr,sptr
	#func global LocalFlags "LocalFlags" sptr
	#func global LocalFree "LocalFree" sptr
	#func global LocalHandle "LocalHandle" sptr
	#func global LocalLock "LocalLock" sptr
	#func global LocalReAlloc "LocalReAlloc" sptr,sptr,sptr
	#func global LocalShrink "LocalShrink" sptr,sptr
	#func global LocalSize "LocalSize" sptr
	#func global LocalUnlock "LocalUnlock" sptr
	#func global LockFile "LockFile" sptr,sptr,sptr,sptr,sptr
	#func global LockFileEx "LockFileEx" sptr,sptr,sptr,sptr,sptr,sptr
	#func global LockResource "LockResource" sptr
	#func global MapUserPhysicalPages "MapUserPhysicalPages" sptr,sptr,sptr
	#func global MapUserPhysicalPagesScatter "MapUserPhysicalPagesScatter" sptr,sptr,sptr
	#func global MapViewOfFile "MapViewOfFile" sptr,sptr,sptr,sptr,sptr
	#func global MapViewOfFileEx "MapViewOfFileEx" sptr,sptr,sptr,sptr,sptr,sptr
	#func global Module32First "Module32First" sptr,sptr
	#func global Module32FirstW "Module32FirstW" wptr,wptr
	#func global Module32Next "Module32Next" sptr,sptr
	#func global Module32NextW "Module32NextW" wptr,wptr
	#define global MoveFile MoveFileA
	#func global MoveFileA "MoveFileA" sptr,sptr
	#define global MoveFileEx MoveFileExA
	#func global MoveFileExA "MoveFileExA" sptr,sptr,sptr
	#func global MoveFileExW "MoveFileExW" wptr,wptr,wptr
	#func global MoveFileW "MoveFileW" wptr,wptr
	#define global MoveFileWithProgress MoveFileWithProgressA
	#func global MoveFileWithProgressA "MoveFileWithProgressA" sptr,sptr,sptr,sptr,sptr
	#func global MoveFileWithProgressW "MoveFileWithProgressW" wptr,wptr,wptr,wptr,wptr
	#func global MulDiv "MulDiv" sptr,sptr,sptr
	#func global MultiByteToWideChar "MultiByteToWideChar" sptr,sptr,sptr,sptr,sptr,sptr
	#define global OpenEvent OpenEventA
	#func global OpenEventA "OpenEventA" sptr,sptr,sptr
	#func global OpenEventW "OpenEventW" wptr,wptr,wptr
	#func global OpenFile "OpenFile" sptr,sptr,sptr
	#define global OpenFileMapping OpenFileMappingA
	#func global OpenFileMappingA "OpenFileMappingA" sptr,sptr,sptr
	#func global OpenFileMappingW "OpenFileMappingW" wptr,wptr,wptr
	#define global OpenJobObject OpenJobObjectA
	#func global OpenJobObjectA "OpenJobObjectA" sptr,sptr,sptr
	#func global OpenJobObjectW "OpenJobObjectW" wptr,wptr,wptr
	#define global OpenMutex OpenMutexA
	#func global OpenMutexA "OpenMutexA" sptr,sptr,sptr
	#func global OpenMutexW "OpenMutexW" wptr,wptr,wptr
	#func global OpenProcess "OpenProcess" sptr,sptr,sptr
	#define global OpenSemaphore OpenSemaphoreA
	#func global OpenSemaphoreA "OpenSemaphoreA" sptr,sptr,sptr
	#func global OpenSemaphoreW "OpenSemaphoreW" wptr,wptr,wptr
	#func global OpenThread "OpenThread" sptr,sptr,sptr
	#define global OpenWaitableTimer OpenWaitableTimerA
	#func global OpenWaitableTimerA "OpenWaitableTimerA" sptr,sptr,sptr
	#func global OpenWaitableTimerW "OpenWaitableTimerW" wptr,wptr,wptr
	#define global OutputDebugString OutputDebugStringA
	#func global OutputDebugStringA "OutputDebugStringA" sptr
	#func global OutputDebugStringW "OutputDebugStringW" wptr
	#define global PeekConsoleInput PeekConsoleInputA
	#func global PeekConsoleInputA "PeekConsoleInputA" sptr,sptr,sptr,sptr
	#func global PeekConsoleInputW "PeekConsoleInputW" wptr,wptr,wptr,wptr
	#func global PeekNamedPipe "PeekNamedPipe" sptr,sptr,sptr,sptr,sptr,sptr
	#func global PostQueuedCompletionStatus "PostQueuedCompletionStatus" sptr,sptr,sptr,sptr
	#func global PrepareTape "PrepareTape" sptr,sptr,sptr
	#func global Process32First "Process32First" sptr,sptr
	#func global Process32FirstW "Process32FirstW" wptr,wptr
	#func global Process32Next "Process32Next" sptr,sptr
	#func global Process32NextW "Process32NextW" wptr,wptr
	#func global ProcessIdToSessionId "ProcessIdToSessionId" sptr,sptr
	#func global PulseEvent "PulseEvent" sptr
	#func global PurgeComm "PurgeComm" sptr,sptr
	#define global QueryDosDevice QueryDosDeviceA
	#func global QueryDosDeviceA "QueryDosDeviceA" sptr,sptr,sptr
	#func global QueryDosDeviceW "QueryDosDeviceW" wptr,wptr,wptr
	#func global QueryInformationJobObject "QueryInformationJobObject" sptr,sptr,sptr,sptr,sptr
	#func global QueryPerformanceCounter "QueryPerformanceCounter" sptr
	#func global QueryPerformanceFrequency "QueryPerformanceFrequency" sptr
	#func global QueueUserAPC "QueueUserAPC" sptr,sptr,sptr
	#func global QueueUserWorkItem "QueueUserWorkItem" sptr,sptr,sptr
	#func global RaiseException "RaiseException" sptr,sptr,sptr,sptr
	#define global ReadConsole ReadConsoleA
	#func global ReadConsoleA "ReadConsoleA" sptr,sptr,sptr,sptr,sptr
	#define global ReadConsoleInput ReadConsoleInputA
	#func global ReadConsoleInputA "ReadConsoleInputA" sptr,sptr,sptr,sptr
	#func global ReadConsoleInputW "ReadConsoleInputW" wptr,wptr,wptr,wptr
	#define global ReadConsoleOutput ReadConsoleOutputA
	#func global ReadConsoleOutputA "ReadConsoleOutputA" sptr,sptr,sptr,sptr,sptr
	#func global ReadConsoleOutputAttribute "ReadConsoleOutputAttribute" sptr,sptr,sptr,sptr,sptr
	#define global ReadConsoleOutputCharacter ReadConsoleOutputCharacterA
	#func global ReadConsoleOutputCharacterA "ReadConsoleOutputCharacterA" sptr,sptr,sptr,sptr,sptr
	#func global ReadConsoleOutputCharacterW "ReadConsoleOutputCharacterW" wptr,wptr,wptr,wptr,wptr
	#func global ReadConsoleOutputW "ReadConsoleOutputW" wptr,wptr,wptr,wptr,wptr
	#func global ReadConsoleW "ReadConsoleW" wptr,wptr,wptr,wptr,wptr
	#func global ReadDirectoryChangesW "ReadDirectoryChangesW" wptr,wptr,wptr,wptr,wptr,wptr,wptr,wptr
	#func global ReadFile "ReadFile" sptr,sptr,sptr,sptr,sptr
	#func global ReadFileEx "ReadFileEx" sptr,sptr,sptr,sptr,sptr
	#func global ReadFileScatter "ReadFileScatter" sptr,sptr,sptr,sptr,sptr
	#func global ReadProcessMemory "ReadProcessMemory" sptr,sptr,sptr,sptr,sptr
	#func global RegisterWaitForSingleObject "RegisterWaitForSingleObject" sptr,sptr,sptr,sptr,sptr,sptr
	#func global RegisterWaitForSingleObjectEx "RegisterWaitForSingleObjectEx" sptr,sptr,sptr,sptr,sptr
	#func global ReleaseMutex "ReleaseMutex" sptr
	#func global ReleaseSemaphore "ReleaseSemaphore" sptr,sptr,sptr
	#define global RemoveDirectory RemoveDirectoryA
	#func global RemoveDirectoryA "RemoveDirectoryA" sptr
	#func global RemoveDirectoryW "RemoveDirectoryW" wptr
	#func global ReplaceFile "ReplaceFile" sptr,sptr,sptr,sptr,sptr,sptr
	#func global ReplaceFileA "ReplaceFileA" sptr,sptr,sptr,sptr,sptr,sptr
	#func global ReplaceFileW "ReplaceFileW" wptr,wptr,wptr,wptr,wptr,wptr
	#func global RequestDeviceWakeup "RequestDeviceWakeup" sptr
	#func global RequestWakeupLatency "RequestWakeupLatency" sptr
	#func global ResetEvent "ResetEvent" sptr
	#func global ResetWriteWatch "ResetWriteWatch" sptr,sptr
	#func global ResumeThread "ResumeThread" sptr
	#func global RtlFillMemory "RtlFillMemory" sptr,sptr,sptr
	#func global RtlMoveMemory "RtlMoveMemory" sptr,sptr,sptr
	#func global RtlUnwind "RtlUnwind" sptr,sptr,sptr,sptr
	#func global RtlZeroMemory "RtlZeroMemory" sptr,sptr
	#define global ScrollConsoleScreenBuffer ScrollConsoleScreenBufferA
	#func global ScrollConsoleScreenBufferA "ScrollConsoleScreenBufferA" sptr,sptr,sptr,sptr,sptr
	#func global ScrollConsoleScreenBufferW "ScrollConsoleScreenBufferW" wptr,wptr,wptr,wptr,wptr
	#define global SearchPath SearchPathA
	#func global SearchPathA "SearchPathA" sptr,sptr,sptr,sptr,sptr,sptr
	#func global SearchPathW "SearchPathW" wptr,wptr,wptr,wptr,wptr,wptr
	#define global SetCalendarInfo SetCalendarInfoA
	#func global SetCalendarInfoA "SetCalendarInfoA" sptr,sptr,sptr,sptr
	#func global SetCalendarInfoW "SetCalendarInfoW" wptr,wptr,wptr,wptr
	#func global SetCommBreak "SetCommBreak" sptr
	#func global SetCommConfig "SetCommConfig" sptr,sptr,sptr
	#func global SetCommMask "SetCommMask" sptr,sptr
	#func global SetCommState "SetCommState" sptr,sptr
	#func global SetCommTimeouts "SetCommTimeouts" sptr,sptr
	#define global SetComputerName SetComputerNameA
	#func global SetComputerNameA "SetComputerNameA" sptr
	#define global SetComputerNameEx SetComputerNameExA
	#func global SetComputerNameExA "SetComputerNameExA" sptr,sptr
	#func global SetComputerNameExW "SetComputerNameExW" wptr,wptr
	#func global SetComputerNameW "SetComputerNameW" wptr
	#func global SetConsoleActiveScreenBuffer "SetConsoleActiveScreenBuffer" sptr
	#func global SetConsoleCP "SetConsoleCP" sptr
	#func global SetConsoleCtrlHandler "SetConsoleCtrlHandler" sptr,sptr
	#func global SetConsoleCursor "SetConsoleCursor" sptr,sptr
	#func global SetConsoleCursorInfo "SetConsoleCursorInfo" sptr,sptr
	#func global SetConsoleCursorPosition "SetConsoleCursorPosition" sptr,sptr
	#func global SetConsoleMode "SetConsoleMode" sptr,sptr
	#func global SetConsoleOutputCP "SetConsoleOutputCP" sptr
	#func global SetConsoleScreenBufferSize "SetConsoleScreenBufferSize" sptr,sptr
	#func global SetConsoleTextAttribute "SetConsoleTextAttribute" sptr,sptr
	#define global SetConsoleTitle SetConsoleTitleA
	#func global SetConsoleTitleA "SetConsoleTitleA" sptr
	#func global SetConsoleTitleW "SetConsoleTitleW" wptr
	#func global SetConsoleWindowInfo "SetConsoleWindowInfo" sptr,sptr,sptr
	#func global SetCriticalSectionSpinCount "SetCriticalSectionSpinCount" sptr,sptr
	#define global SetCurrentDirectory SetCurrentDirectoryA
	#func global SetCurrentDirectoryA "SetCurrentDirectoryA" sptr
	#func global SetCurrentDirectoryW "SetCurrentDirectoryW" wptr
	#define global SetDefaultCommConfig SetDefaultCommConfigA
	#func global SetDefaultCommConfigA "SetDefaultCommConfigA" sptr,sptr,sptr
	#func global SetDefaultCommConfigW "SetDefaultCommConfigW" wptr,wptr,wptr
	#func global SetEndOfFile "SetEndOfFile" sptr
	#define global SetEnvironmentVariable SetEnvironmentVariableA
	#func global SetEnvironmentVariableA "SetEnvironmentVariableA" sptr,sptr
	#func global SetEnvironmentVariableW "SetEnvironmentVariableW" wptr,wptr
	#func global SetErrorMode "SetErrorMode" sptr
#ifdef setevent
	#func global _SetEvent "SetEvent" sptr
#else
	#func global SetEvent "SetEvent" sptr
#endif
	#func global SetFileApisToANSI "SetFileApisToANSI"
	#func global SetFileApisToOEM "SetFileApisToOEM"
	#define global SetFileAttributes SetFileAttributesA
	#func global SetFileAttributesA "SetFileAttributesA" sptr,sptr
	#func global SetFileAttributesW "SetFileAttributesW" wptr,wptr
	#func global SetFilePointer "SetFilePointer" sptr,sptr,sptr,sptr
	#func global SetFilePointerEx "SetFilePointerEx" sptr,sptr,sptr,sptr,sptr
	#func global SetFileTime "SetFileTime" sptr,sptr,sptr,sptr
	#func global SetHandleCount "SetHandleCount" sptr
	#func global SetHandleInformation "SetHandleInformation" sptr,sptr,sptr
	#func global SetInformationJobObject "SetInformationJobObject" sptr,sptr,sptr,sptr
	#func global SetLastError "SetLastError" sptr
	#func global SetLocalTime "SetLocalTime" sptr
	#define global SetLocaleInfo SetLocaleInfoA
	#func global SetLocaleInfoA "SetLocaleInfoA" sptr,sptr,sptr
	#func global SetLocaleInfoW "SetLocaleInfoW" wptr,wptr,wptr
	#func global SetMailslotInfo "SetMailslotInfo" sptr,sptr
	#func global SetMessageWaitingIndicator "SetMessageWaitingIndicator" sptr,sptr
	#func global SetNamedPipeHandleState "SetNamedPipeHandleState" sptr,sptr,sptr,sptr
	#func global SetPriorityClass "SetPriorityClass" sptr,sptr
	#func global SetProcessAffinityMask "SetProcessAffinityMask" sptr,sptr
	#func global SetProcessPriorityBoost "SetProcessPriorityBoost" sptr,sptr
	#func global SetProcessShutdownParameters "SetProcessShutdownParameters" sptr,sptr
	#func global SetProcessWorkingSetSize "SetProcessWorkingSetSize" sptr,sptr,sptr
	#func global SetStdHandle "SetStdHandle" sptr,sptr
	#func global SetSystemPowerState "SetSystemPowerState" sptr,sptr
	#func global SetSystemTime "SetSystemTime" sptr
	#func global SetSystemTimeAdjustment "SetSystemTimeAdjustment" sptr,sptr
	#func global SetTapeParameters "SetTapeParameters" sptr,sptr,sptr
	#func global SetTapePosition "SetTapePosition" sptr,sptr,sptr,sptr,sptr,sptr
	#func global SetThreadAffinityMask "SetThreadAffinityMask" sptr,sptr
	#func global SetThreadContext "SetThreadContext" sptr,sptr
	#func global SetThreadExecutionState "SetThreadExecutionState" sptr
	#func global SetThreadIdealProcessor "SetThreadIdealProcessor" sptr,sptr
	#func global SetThreadLocale "SetThreadLocale" sptr
	#func global SetThreadPriority "SetThreadPriority" sptr,sptr
	#func global SetThreadPriorityBoost "SetThreadPriorityBoost" sptr,sptr
	#func global SetTimeZoneInformation "SetTimeZoneInformation" sptr
	#func global SetTimerQueueTimer "SetTimerQueueTimer" sptr,sptr,sptr,sptr,sptr,sptr
	#func global SetUnhandledExceptionFilter "SetUnhandledExceptionFilter" sptr
	#define global SetVolumeLabel SetVolumeLabelA
	#func global SetVolumeLabelA "SetVolumeLabelA" sptr,sptr
	#func global SetVolumeLabelW "SetVolumeLabelW" wptr,wptr
	#define global SetVolumeMountPoint SetVolumeMountPointA
	#func global SetVolumeMountPointA "SetVolumeMountPointA" sptr,sptr
	#func global SetVolumeMountPointW "SetVolumeMountPointW" wptr,wptr
	#func global SetWaitableTimer "SetWaitableTimer" sptr,sptr,sptr,sptr,sptr,sptr
	#func global SetupComm "SetupComm" sptr,sptr,sptr
	#func global SignalObjectAndWait "SignalObjectAndWait" sptr,sptr,sptr,sptr
	#func global SizeofResource "SizeofResource" sptr,sptr
	#func global Sleep "Sleep" sptr
	#func global SleepEx "SleepEx" sptr,sptr
	#func global SuspendThread "SuspendThread" sptr
	#func global SwitchToFiber "SwitchToFiber" sptr
	#func global SwitchToThread "SwitchToThread"
	#func global SystemTimeToFileTime "SystemTimeToFileTime" sptr,sptr
	#func global SystemTimeToTzSpecificLocalTime "SystemTimeToTzSpecificLocalTime" sptr,sptr,sptr
	#func global TerminateJobObject "TerminateJobObject" sptr,sptr
	#func global TerminateProcess "TerminateProcess" sptr,sptr
	#func global TerminateThread "TerminateThread" sptr,sptr
	#func global Thread32First "Thread32First" sptr,sptr
	#func global Thread32Next "Thread32Next" sptr,sptr
	#func global TlsAlloc "TlsAlloc"
	#func global TlsFree "TlsFree" sptr
	#func global TlsGetValue "TlsGetValue" sptr
	#func global TlsSetValue "TlsSetValue" sptr,sptr
	#func global Toolhelp32ReadProcessMemory "Toolhelp32ReadProcessMemory" sptr,sptr,sptr,sptr,sptr
	#func global TransactNamedPipe "TransactNamedPipe" sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global TransmitCommChar "TransmitCommChar" sptr,sptr
	#func global TryEnterCriticalSection "TryEnterCriticalSection" sptr
	#func global UnhandledExceptionFilter "UnhandledExceptionFilter" sptr
	#func global UnlockFile "UnlockFile" sptr,sptr,sptr,sptr,sptr
	#func global UnlockFileEx "UnlockFileEx" sptr,sptr,sptr,sptr,sptr
	#func global UnmapViewOfFile "UnmapViewOfFile" sptr
	#func global UnregisterWait "UnregisterWait" sptr
	#func global UnregisterWaitEx "UnregisterWaitEx" sptr,sptr
	#define global UpdateResource UpdateResourceA
	#func global UpdateResourceA "UpdateResourceA" sptr,sptr,sptr,sptr,sptr,sptr
	#func global UpdateResourceW "UpdateResourceW" wptr,wptr,wptr,wptr,wptr,wptr
	#define global VerLanguageName VerLanguageNameA
	#func global VerLanguageNameA "VerLanguageNameA" sptr,sptr,sptr
	#func global VerLanguageNameW "VerLanguageNameW" wptr,wptr,wptr
	#func global VerSetConditionMask "VerSetConditionMask" sptr,sptr,sptr,sptr
	#define global VerifyVersionInfo VerifyVersionInfoA
	#func global VerifyVersionInfoA "VerifyVersionInfoA" sptr,sptr,sptr,sptr
	#func global VerifyVersionInfoW "VerifyVersionInfoW" wptr,wptr,wptr,wptr
	#func global VirtualAlloc "VirtualAlloc" sptr,sptr,sptr,sptr
	#func global VirtualAllocEx "VirtualAllocEx" sptr,sptr,sptr,sptr,sptr
	#func global VirtualFree "VirtualFree" sptr,sptr,sptr
	#func global VirtualFreeEx "VirtualFreeEx" sptr,sptr,sptr,sptr
	#func global VirtualLock "VirtualLock" sptr,sptr
	#func global VirtualProtect "VirtualProtect" sptr,sptr,sptr,sptr
	#func global VirtualProtectEx "VirtualProtectEx" sptr,sptr,sptr,sptr,sptr
	#func global VirtualQuery "VirtualQuery" sptr,sptr,sptr
	#func global VirtualQueryEx "VirtualQueryEx" sptr,sptr,sptr,sptr
	#func global VirtualUnlock "VirtualUnlock" sptr,sptr
	#func global WaitCommEvent "WaitCommEvent" sptr,sptr,sptr
	#func global WaitForDebugEvent "WaitForDebugEvent" sptr,sptr
	#func global WaitForMultipleObjects "WaitForMultipleObjects" sptr,sptr,sptr,sptr
	#func global WaitForMultipleObjectsEx "WaitForMultipleObjectsEx" sptr,sptr,sptr,sptr,sptr
	#func global WaitForSingleObject "WaitForSingleObject" sptr,sptr
	#func global WaitForSingleObjectEx "WaitForSingleObjectEx" sptr,sptr,sptr
	#define global WaitNamedPipe WaitNamedPipeA
	#func global WaitNamedPipeA "WaitNamedPipeA" sptr,sptr
	#func global WaitNamedPipeW "WaitNamedPipeW" wptr,wptr
	#func global WideCharToMultiByte "WideCharToMultiByte" sptr,sptr,sptr,sptr,sptr,sptr,sptr,sptr
	#func global WinExec "WinExec" sptr,sptr
	#define global WriteConsole WriteConsoleA
	#func global WriteConsoleA "WriteConsoleA" sptr,sptr,sptr,sptr,sptr
	#define global WriteConsoleInput WriteConsoleInputA
	#func global WriteConsoleInputA "WriteConsoleInputA" sptr,sptr,sptr,sptr
	#func global WriteConsoleInputW "WriteConsoleInputW" wptr,wptr,wptr,wptr
	#define global WriteConsoleOutput WriteConsoleOutputA
	#func global WriteConsoleOutputA "WriteConsoleOutputA" sptr,sptr,sptr,sptr,sptr
	#func global WriteConsoleOutputAttribute "WriteConsoleOutputAttribute" sptr,sptr,sptr,sptr,sptr
	#define global WriteConsoleOutputCharacter WriteConsoleOutputCharacterA
	#func global WriteConsoleOutputCharacterA "WriteConsoleOutputCharacterA" sptr,sptr,sptr,sptr,sptr
	#func global WriteConsoleOutputCharacterW "WriteConsoleOutputCharacterW" wptr,wptr,wptr,wptr,wptr
	#func global WriteConsoleOutputW "WriteConsoleOutputW" wptr,wptr,wptr,wptr,wptr
	#func global WriteConsoleW "WriteConsoleW" wptr,wptr,wptr,wptr,wptr
	#func global WriteFile "WriteFile" sptr,sptr,sptr,sptr,sptr
	#func global WriteFileEx "WriteFileEx" sptr,sptr,sptr,sptr,sptr
	#func global WriteFileGather "WriteFileGather" sptr,sptr,sptr,sptr,sptr
	#define global WritePrivateProfileSection WritePrivateProfileSectionA
	#func global WritePrivateProfileSectionA "WritePrivateProfileSectionA" sptr,sptr,sptr
	#func global WritePrivateProfileSectionW "WritePrivateProfileSectionW" wptr,wptr,wptr
	#define global WritePrivateProfileString WritePrivateProfileStringA
	#func global WritePrivateProfileStringA "WritePrivateProfileStringA" sptr,sptr,sptr,sptr
	#func global WritePrivateProfileStringW "WritePrivateProfileStringW" wptr,wptr,wptr,wptr
	#define global WritePrivateProfileStruct WritePrivateProfileStructA
	#func global WritePrivateProfileStructA "WritePrivateProfileStructA" sptr,sptr,sptr,sptr,sptr
	#func global WritePrivateProfileStructW "WritePrivateProfileStructW" wptr,wptr,wptr,wptr,wptr
	#func global WriteProcessMemory "WriteProcessMemory" sptr,sptr,sptr,sptr,sptr
	#define global WriteProfileSection WriteProfileSectionA
	#func global WriteProfileSectionA "WriteProfileSectionA" sptr,sptr
	#func global WriteProfileSectionW "WriteProfileSectionW" wptr,wptr
	#define global WriteProfileString WriteProfileStringA
	#func global WriteProfileStringA "WriteProfileStringA" sptr,sptr,sptr
	#func global WriteProfileStringW "WriteProfileStringW" wptr,wptr,wptr
	#func global WriteTapemark "WriteTapemark" sptr,sptr,sptr,sptr
	#func global _hread "_hread" sptr,sptr,sptr
	#func global _hwrite "_hwrite" sptr,sptr,sptr
	#func global _lclose "_lclose" sptr
	#func global _lcreat "_lcreat" sptr,sptr
	#func global _llseek "_llseek" sptr,sptr,sptr
	#func global _lopen "_lopen" sptr,sptr
	#func global _lread "_lread" sptr,sptr,sptr
	#func global _lwrite "_lwrite" sptr,sptr,sptr
	#func global lstrcat "lstrcat" sptr,sptr
	#func global lstrcatA "lstrcatA" sptr,sptr
	#func global lstrcatW "lstrcatW" wptr,wptr
	#func global lstrcmp "lstrcmp" sptr,sptr
	#func global lstrcmpA "lstrcmpA" sptr,sptr
	#func global lstrcmpW "lstrcmpW" wptr,wptr
	#func global lstrcmpi "lstrcmpi" sptr,sptr
	#func global lstrcmpiA "lstrcmpiA" sptr,sptr
	#func global lstrcmpiW "lstrcmpiW" wptr,wptr
	#func global lstrcpy "lstrcpy" sptr,sptr
	#func global lstrcpyA "lstrcpyA" sptr,sptr
	#func global lstrcpyW "lstrcpyW" wptr,wptr
	#func global lstrcpyn "lstrcpyn" sptr,sptr,sptr
	#func global lstrcpynA "lstrcpynA" sptr,sptr,sptr
	#func global lstrcpynW "lstrcpynW" wptr,wptr,wptr
	#func global lstrlen "lstrlen" sptr
	#func global lstrlenA "lstrlenA" sptr
	#func global lstrlenW "lstrlenW" wptr
#endif
#endif
