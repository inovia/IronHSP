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

; winmdroot.Foundation.BOOL FreeLibrary(winmdroot.Foundation.HMODULE hLibModule)
#cfunc FreeLibrary "FreeLibrary" intptr

; winmdroot.Foundation.BOOL CopyFile(winmdroot.Foundation.PCWSTR lpExistingFileName, winmdroot.Foundation.PCWSTR lpNewFileName, winmdroot.Foundation.BOOL bFailIfExists)
#cfunc CopyFileW "CopyFileW" wstr, wstr, int

; winmdroot.Foundation.HANDLE CreateEvent([Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpEventAttributes, winmdroot.Foundation.BOOL bManualReset, winmdroot.Foundation.BOOL bInitialState, winmdroot.Foundation.PCWSTR lpName)
#cfunc CreateEventW "CreateEventW" var, int, int, wstr

; winmdroot.Foundation.HANDLE CreateFile(winmdroot.Foundation.PCWSTR lpFileName, uint dwDesiredAccess, winmdroot.Storage.FileSystem.FILE_SHARE_MODE dwShareMode, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpSecurityAttributes, winmdroot.Storage.FileSystem.FILE_CREATION_DISPOSITION dwCreationDisposition, winmdroot.Storage.FileSystem.FILE_FLAGS_AND_ATTRIBUTES dwFlagsAndAttributes, winmdroot.Foundation.HANDLE hTemplateFile)
#cfunc CreateFileW "CreateFileW" wstr, int, int, var, int, int, intptr

; winmdroot.Foundation.HANDLE CreateMutex([Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpMutexAttributes, winmdroot.Foundation.BOOL bInitialOwner, winmdroot.Foundation.PCWSTR lpName)
#cfunc CreateMutexW "CreateMutexW" var, int, wstr

; winmdroot.Foundation.BOOL CreateProcess(winmdroot.Foundation.PCWSTR lpApplicationName, winmdroot.Foundation.PWSTR lpCommandLine, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpProcessAttributes, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpThreadAttributes, winmdroot.Foundation.BOOL bInheritHandles, winmdroot.System.Threading.PROCESS_CREATION_FLAGS dwCreationFlags, [Optional] void* lpEnvironment, winmdroot.Foundation.PCWSTR lpCurrentDirectory, winmdroot.System.Threading.STARTUPINFOW* lpStartupInfo, winmdroot.System.Threading.PROCESS_INFORMATION* lpProcessInformation)
#cfunc CreateProcessW "CreateProcessW" wstr, wstr, var, var, int, int, intptr, wstr, var, var

; winmdroot.Foundation.BOOL DeleteFile(winmdroot.Foundation.PCWSTR lpFileName)
#cfunc DeleteFileW "DeleteFileW" wstr

; winmdroot.Foundation.BOOL FindClose(winmdroot.Foundation.HANDLE hFindFile)
#cfunc FindClose "FindClose" intptr

; winmdroot.Foundation.HANDLE FindFirstFile(winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Storage.FileSystem.WIN32_FIND_DATAW* lpFindFileData)
#cfunc FindFirstFileW "FindFirstFileW" wstr, var

; winmdroot.Foundation.BOOL FindNextFile(winmdroot.Foundation.HANDLE hFindFile, winmdroot.Storage.FileSystem.WIN32_FIND_DATAW* lpFindFileData)
#cfunc FindNextFileW "FindNextFileW" intptr, var

; uint FormatMessage(winmdroot.System.Diagnostics.Debug.FORMAT_MESSAGE_OPTIONS dwFlags, [Optional] void* lpSource, uint dwMessageId, uint dwLanguageId, winmdroot.Foundation.PWSTR lpBuffer, uint nSize, [Optional] sbyte** Arguments)
#cfunc FormatMessageW "FormatMessageW" int, intptr, int, int, wstr, int, var

; uint GetACP()
#cfunc GetACP "GetACP"

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

; uint GetEnvironmentVariable(winmdroot.Foundation.PCWSTR lpName, winmdroot.Foundation.PWSTR lpBuffer, uint nSize)
#cfunc GetEnvironmentVariableW "GetEnvironmentVariableW" wstr, wstr, int

; winmdroot.Foundation.BOOL GetExitCodeProcess(winmdroot.Foundation.HANDLE hProcess, uint* lpExitCode)
#cfunc GetExitCodeProcess "GetExitCodeProcess" intptr, var

; uint GetFileAttributes(winmdroot.Foundation.PCWSTR lpFileName)
#cfunc GetFileAttributesW "GetFileAttributesW" wstr

; uint GetFileSize(winmdroot.Foundation.HANDLE hFile, [Optional] uint* lpFileSizeHigh)
#cfunc GetFileSize "GetFileSize" intptr, var

; void GetLocalTime(winmdroot.Foundation.SYSTEMTIME* lpSystemTime)
#func GetLocalTime "GetLocalTime" var

; uint GetModuleFileName(winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.PWSTR lpFilename, uint nSize)
#cfunc GetModuleFileNameW "GetModuleFileNameW" intptr, wstr, int

; winmdroot.Foundation.HMODULE GetModuleHandle(winmdroot.Foundation.PCWSTR lpModuleName)
#cfunc GetModuleHandleW "GetModuleHandleW" wstr

; uint GetOEMCP()
#cfunc GetOEMCP "GetOEMCP"

; winmdroot.Foundation.FARPROC GetProcAddress(winmdroot.Foundation.HMODULE hModule, winmdroot.Foundation.PCSTR lpProcName)
#cfunc GetProcAddress "GetProcAddress" intptr, str

; void GetSystemTime(winmdroot.Foundation.SYSTEMTIME* lpSystemTime)
#func GetSystemTime "GetSystemTime" var

; uint GetTempPath(uint nBufferLength, winmdroot.Foundation.PWSTR lpBuffer)
#cfunc GetTempPathW "GetTempPathW" int, wstr

; uint GetTickCount()
#cfunc GetTickCount "GetTickCount"

; ulong GetTickCount64()
#cfunc GetTickCount64 "GetTickCount64"

; winmdroot.Foundation.HGLOBAL GlobalFree(winmdroot.Foundation.HGLOBAL hMem)
#cfunc GlobalFree "GlobalFree" int

; winmdroot.Foundation.HGLOBAL GlobalAlloc(winmdroot.System.Memory.GLOBAL_ALLOC_FLAGS uFlags, nuint dwBytes)
#cfunc GlobalAlloc "GlobalAlloc" int, int

; void* GlobalLock(winmdroot.Foundation.HGLOBAL hMem)
#cfunc GlobalLock "GlobalLock" int

; nuint GlobalSize(winmdroot.Foundation.HGLOBAL hMem)
#cfunc GlobalSize "GlobalSize" int

; winmdroot.Foundation.BOOL GlobalUnlock(winmdroot.Foundation.HGLOBAL hMem)
#cfunc GlobalUnlock "GlobalUnlock" int

; void* HeapAlloc(winmdroot.Foundation.HANDLE hHeap, winmdroot.System.Memory.HEAP_FLAGS dwFlags, nuint dwBytes)
#cfunc HeapAlloc "HeapAlloc" intptr, int, int

; winmdroot.Foundation.HANDLE HeapCreate(winmdroot.System.Memory.HEAP_FLAGS flOptions, nuint dwInitialSize, nuint dwMaximumSize)
#cfunc HeapCreate "HeapCreate" int, int, int

; winmdroot.Foundation.BOOL HeapDestroy(winmdroot.Foundation.HANDLE hHeap)
#cfunc HeapDestroy "HeapDestroy" intptr

; winmdroot.Foundation.BOOL HeapFree(winmdroot.Foundation.HANDLE hHeap, winmdroot.System.Memory.HEAP_FLAGS dwFlags, [Optional] void* lpMem)
#cfunc HeapFree "HeapFree" intptr, int, intptr

; winmdroot.Foundation.HMODULE LoadLibrary(winmdroot.Foundation.PCWSTR lpLibFileName)
#cfunc LoadLibraryW "LoadLibraryW" wstr

; winmdroot.Foundation.HMODULE LoadLibraryEx(winmdroot.Foundation.PCWSTR lpLibFileName, winmdroot.Foundation.HANDLE hFile, winmdroot.System.LibraryLoader.LOAD_LIBRARY_FLAGS dwFlags)
#cfunc LoadLibraryExW "LoadLibraryExW" wstr, intptr, int

; winmdroot.Foundation.BOOL MoveFile(winmdroot.Foundation.PCWSTR lpExistingFileName, winmdroot.Foundation.PCWSTR lpNewFileName)
#cfunc MoveFileW "MoveFileW" wstr, wstr

; int MultiByteToWideChar(uint CodePage, winmdroot.Globalization.MULTI_BYTE_TO_WIDE_CHAR_FLAGS dwFlags, winmdroot.Foundation.PCSTR lpMultiByteStr, int cbMultiByte, winmdroot.Foundation.PWSTR lpWideCharStr, int cchWideChar)
#cfunc MultiByteToWideChar "MultiByteToWideChar" int, int, str, int, wstr, int

; winmdroot.Foundation.HANDLE OpenProcess(winmdroot.System.Threading.PROCESS_ACCESS_RIGHTS dwDesiredAccess, winmdroot.Foundation.BOOL bInheritHandle, uint dwProcessId)
#cfunc OpenProcess "OpenProcess" int, int, int

; void OutputDebugStringW(winmdroot.Foundation.PCWSTR lpOutputString)
#func OutputDebugStringW "OutputDebugStringW" wstr

; winmdroot.Foundation.BOOL QueryPerformanceCounter(long* lpPerformanceCount)
#cfunc QueryPerformanceCounter "QueryPerformanceCounter" var

; winmdroot.Foundation.BOOL QueryPerformanceFrequency(long* lpFrequency)
#cfunc QueryPerformanceFrequency "QueryPerformanceFrequency" var

; winmdroot.Foundation.BOOL ReadFile(winmdroot.Foundation.HANDLE hFile, [Optional] byte* lpBuffer, uint nNumberOfBytesToRead, [Optional] uint* lpNumberOfBytesRead, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped)
#cfunc ReadFile "ReadFile" intptr, var, int, var, var

; winmdroot.Foundation.BOOL ReleaseMutex(winmdroot.Foundation.HANDLE hMutex)
#cfunc ReleaseMutex "ReleaseMutex" intptr

; winmdroot.Foundation.BOOL ResetEvent(winmdroot.Foundation.HANDLE hEvent)
#cfunc ResetEvent "ResetEvent" intptr

; winmdroot.Foundation.BOOL SetCurrentDirectoryW(winmdroot.Foundation.PCWSTR lpPathName)
#cfunc SetCurrentDirectoryW "SetCurrentDirectoryW" wstr

; winmdroot.Foundation.BOOL SetEnvironmentVariable(winmdroot.Foundation.PCWSTR lpName, winmdroot.Foundation.PCWSTR lpValue)
#cfunc SetEnvironmentVariableW "SetEnvironmentVariableW" wstr, wstr

; winmdroot.Foundation.BOOL SetEvent(winmdroot.Foundation.HANDLE hEvent)
#cfunc SetEvent "SetEvent" intptr

; winmdroot.Foundation.BOOL SetFileAttributes(winmdroot.Foundation.PCWSTR lpFileName, winmdroot.Storage.FileSystem.FILE_FLAGS_AND_ATTRIBUTES dwFileAttributes)
#cfunc SetFileAttributesW "SetFileAttributesW" wstr, int

; uint SetFilePointer(winmdroot.Foundation.HANDLE hFile, int lDistanceToMove, [Optional] int* lpDistanceToMoveHigh, winmdroot.Storage.FileSystem.SET_FILE_POINTER_MOVE_METHOD dwMoveMethod)
#cfunc SetFilePointer "SetFilePointer" intptr, int, var, int

; void SetLastError(winmdroot.Foundation.WIN32_ERROR dwErrCode)
#func SetLastError "SetLastError" int

; winmdroot.Foundation.BOOL SetLocalTime(winmdroot.Foundation.SYSTEMTIME* lpSystemTime)
#cfunc SetLocalTime "SetLocalTime" var

; void Sleep(uint dwMilliseconds)
#func Sleep "Sleep" int

; winmdroot.Foundation.BOOL TerminateProcess(winmdroot.Foundation.HANDLE hProcess, uint uExitCode)
#cfunc TerminateProcess "TerminateProcess" intptr, int

; void* VirtualAlloc([Optional] void* lpAddress, nuint dwSize, winmdroot.System.Memory.VIRTUAL_ALLOCATION_TYPE flAllocationType, winmdroot.System.Memory.PAGE_PROTECTION_FLAGS flProtect)
#cfunc VirtualAlloc "VirtualAlloc" intptr, int, int, int

; winmdroot.Foundation.BOOL VirtualFree(void* lpAddress, nuint dwSize, winmdroot.System.Memory.VIRTUAL_FREE_TYPE dwFreeType)
#cfunc VirtualFree "VirtualFree" intptr, int, int

; winmdroot.Foundation.BOOL VirtualProtect(void* lpAddress, nuint dwSize, winmdroot.System.Memory.PAGE_PROTECTION_FLAGS flNewProtect, winmdroot.System.Memory.PAGE_PROTECTION_FLAGS* lpflOldProtect)
#cfunc VirtualProtect "VirtualProtect" intptr, int, int, var

; winmdroot.Foundation.WAIT_EVENT WaitForMultipleObjects(uint nCount, winmdroot.Foundation.HANDLE* lpHandles, winmdroot.Foundation.BOOL bWaitAll, uint dwMilliseconds)
#cfunc WaitForMultipleObjects "WaitForMultipleObjects" int, intptr, int, int

; winmdroot.Foundation.WAIT_EVENT WaitForSingleObject(winmdroot.Foundation.HANDLE hHandle, uint dwMilliseconds)
#cfunc WaitForSingleObject "WaitForSingleObject" intptr, int

; int WideCharToMultiByte(uint CodePage, uint dwFlags, winmdroot.Foundation.PCWSTR lpWideCharStr, int cchWideChar, winmdroot.Foundation.PSTR lpMultiByteStr, int cbMultiByte, winmdroot.Foundation.PCSTR lpDefaultChar, [Optional] winmdroot.Foundation.BOOL* lpUsedDefaultChar)
#cfunc WideCharToMultiByte "WideCharToMultiByte" int, int, wstr, int, str, int, str, var

; winmdroot.Foundation.BOOL WriteFile(winmdroot.Foundation.HANDLE hFile, [Optional] byte* lpBuffer, uint nNumberOfBytesToWrite, [Optional] uint* lpNumberOfBytesWritten, [Optional] global::System.Threading.NativeOverlapped* lpOverlapped)
#cfunc WriteFile "WriteFile" intptr, var, int, var, var

#endif
