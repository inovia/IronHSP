; ============================================================
;   psapi.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
EnumProcesses
Retrieves the process identifier for each process object in the system.
%group
Win32 psapi
%prm
lpidProcess, cb, lpcbNeeded
lpidProcess : [var] A pointer to an array that receives the list of process identifiers.
cb : [int] The size of the pProcessIds array, in bytes.
lpcbNeeded : [var] The number of bytes returned in the pProcessIds array.
%inst
Retrieves the process identifier for each process object in the
system.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
It is a good idea to use a large array, because it is hard to predict
how many processes there will be at the time you call EnumProcesses.
To determine how many processes were enumerated, divide the
lpcbNeeded value by sizeof(DWORD). There is no indication given when
the buffer is too small to store all process identifiers. Therefore,
if lpcbNeeded equals cb, consider retrying the call with a larger
array. To obtain process handles for the processes whose identifiers
you have just obtained, call the OpenProcess function. Starting with
Windows 7 and Windows Server 2008 R2, Psapi.h establishes version
numbers for the PSAPI functions. The PSAPI version number affects the
name used to call the function and the library that a program must
load. If PSAPI_VERSION is 2 or greater, this function is defined as
K32EnumProcesses in Psapi.h and exported in Kernel32.lib and
Kernel32.dll. If PSAPI_VERSION is 1, this function is defined as
EnumProcesses in Psapi.h and exported in Psapi.lib and Psapi.dll as a
wrapper that calls K32EnumProcesses. Programs that must run on
earlier versions of Windows as well as Windows 7 and later versions
should always call this function as EnumProcesses. To ensure correct
resolution of symbols, add Psapi.lib to the TARGETLIBS macro and
compile the program with ?DPSAPI_VERSION=1. To use run-time dynamic
linking, load Psapi.dll.


%index
EnumProcessModules
Retrieves a handle for each module in the specified process.
%group
Win32 psapi
%prm
hProcess, lphModule, cb, lpcbNeeded
hProcess : [intptr] A handle to the process.
lphModule : [intptr] An array that receives the list of module handles.
cb : [int] The size of the lphModule array, in bytes.
lpcbNeeded : [var] The number of bytes required to store all module handles in the lphModule array.
%inst
Retrieves a handle for each module in the specified process.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The EnumProcessModules function is primarily designed for use by
debuggers and similar applications that must extract module
information from another process. If the module list in the target
process is corrupted or not yet initialized, or if the module list
changes during the function call as a result of DLLs being loaded or
unloaded, EnumProcessModules may fail or return incorrect
information. It is a good idea to specify a large array of HMODULE
values, because it is hard to predict how many modules there will be
in the process at the time you call EnumProcessModules. To determine
if the lphModule array is too small to hold all module handles for
the process, compare the value returned in lpcbNeeded with the value
specified in cb. If lpcbNeeded is greater than cb, increase the size
of the array and call EnumProcessModules again. To determine how many
modules were enumerated by the call to EnumProcessModules, divide the
resulting value in the lpcbNeeded parameter by sizeof(HMODULE). The
EnumProcessModules function does not retrieve handles for modules
that were loaded with the LOAD_LIBRARY_AS_DATAFILE or similar flags.
For more information, see LoadLibraryEx. Do not call CloseHandle on
any of the handles returned by this function. The information comes
from a snapshot, so there are no resources to be freed. If this
function is called from a 32-bit application running on WOW64, it can
only enumerate the modules of a 32-bit process. If the process is a
64-bit process, this function fails and the last error code is
ERROR_PARTIAL_COPY (299). To take a snapshot of specified processes
and the heaps, modules, and threads used by these processes, use the
CreateToolhelp32Snapshot function. Starting with Windows 7 and
Windows Server 2008 R2, Psapi.h establishes version numbers for the
PSAPI functions. The PSAPI version number affects the name used to
call the function and the library that a program must load. If
PSAPI_VERSION is 2 or greater, this function is defined as
K32EnumProcessModules in Psapi.h and exported in Kernel32.lib and
Kernel32.dll. If PSAPI_VERSION is 1, this function is defined as
EnumProcessModules in Psapi.h and exported in Psapi.lib and Psapi.dll
as a wrapper that calls K32EnumProcessModules. Programs that must run
on earlier versions of Windows as well as Windows 7 and later
versions should always call this function as EnumProcessModules. To
ensure correct resolution of symbols, add Psapi.lib to the TARGETLIBS
macro and compile the program with -DPSAPI_VERSION=1. To use run-time
dynamic linking, load Psapi.dll.


%index
GetModuleBaseNameW
Retrieves the base name of the specified module. (Unicode)
%group
Win32 psapi
%prm
hProcess, hModule, lpBaseName, nSize
hProcess : [intptr] A handle to the process that contains the module. The handle must have the PROCESS_QUERY_INFORMATION and PROCESS_VM_READ access rights. For more information, see Process Security and Access Rights.
hModule : [intptr] A handle to the module. If this parameter is NULL, this function  returns the name of the file used to create the calling process.
lpBaseName : [wstr] A pointer to the buffer that receives the base name of the module. If the base name is longer than maximum number of characters specified by the nSize parameter, the base name is truncated.
nSize : [int] The size of the lpBaseName buffer, in characters.
%inst
Retrieves the base name of the specified module. (Unicode)

[戻り値]
If the function succeeds, the return value specifies the length of
the string copied to the buffer, in characters. If the function
fails, the return value is zero. To get extended error information,
call GetLastError.

[備考]
The GetModuleBaseName function is primarily designed for use by
debuggers and similar applications that must extract module
information from another process. If the module list in the target
process is corrupted or is not yet initialized, or if the module list
changes during the function call as a result of DLLs being loaded or
unloaded, GetModuleBaseName may fail or return incorrect information.
To retrieve the base name of a module in the current process, use the
GetModuleFileName function to retrieve the full module name and then
use a function call such as strrchr(szmodulename, '\\') to scan to
the beginning of the base name within the module name string. This is
more efficient and more reliable than calling GetModuleBaseName with
a handle to the current process.
To retrieve the base name of the main executable module for a remote
process, use the GetProcessImageFileName or QueryFullProcessImageName
function to retrieve the module name and then use the strrchr
function as described in the previous paragraph. This is more
efficient and more reliable than calling GetModuleBaseName with a
NULL module handle.
The GetModuleBaseName function does not retrieve the base name for
modules that were loaded with the LOAD_LIBRARY_AS_DATAFILE flag. For
more information, see LoadLibraryEx. Starting with Windows 7 and
Windows Server 2008 R2, Psapi.h establishes version numbers for the
PSAPI functions. The PSAPI version number affects the name used to
call the function and the library that a program must load. If
PSAPI_VERSION is 2 or greater, this function is defined as
K32GetModuleBaseName in Psapi.h and exported in Kernel32.lib and
Kernel32.dll. If PSAPI_VERSION is 1, this function is defined as
GetModuleBaseName in Psapi.h and exported in Psapi.lib and Psapi.dll
as a wrapper that calls K32GetModuleBaseName. Programs that must run
on earlier versions of Windows as well as Windows 7 and later
versions should always call this function as GetModuleBaseName. To
ensure correct resolution of symbols, add Psapi.lib to the TARGETLIBS
macro and compile the program with -DPSAPI_VERSION=1. To use run-time
dynamic linking, load Psapi.dll.


%index
GetModuleFileNameExW
Retrieves the fully qualified path for the file containing the specified module. (Unicode)
%group
Win32 psapi
%prm
hProcess, hModule, lpFilename, nSize
hProcess : [intptr] A handle to the process that contains the module. The handle must have the PROCESS_QUERY_INFORMATION and PROCESS_VM_READ access rights. For more information, see Process Security and Access Rights. Windows 10 and later, Windows Server 2016 and later: If the hModule parameter is NULL, then the handle requires only PROCESS_QUERY_LIMITED_INFORMATION access rights. The GetModuleFileNameEx function does not retrieve the path for modules  that were loaded using the LOAD_LIBRARY_AS_DATAFILE flag. For more information, see LoadLibraryEx.
hModule : [intptr] A handle to the module. If this parameter is NULL, GetModuleFileNameEx returns the path of the executable file of the process specified in hProcess.
lpFilename : [wstr] A pointer to a buffer that receives the fully qualified path to the module. If the size of the file name is larger than the value of the nSize parameter, the function succeeds but the file name is truncated and null-terminated.
nSize : [int] The size of the lpFilename buffer, in characters.
%inst
Retrieves the fully qualified path for the file containing the
specified module. (Unicode)

[戻り値]
If the function succeeds, the return value specifies the length of
the string copied to the buffer. If the function fails, the return
value is zero. To get extended error information, call GetLastError.

[備考]
The GetModuleFileNameEx function is primarily designed for use by
debuggers and similar applications that must extract module
information from another process. If the module list in the target
process is corrupted or is not yet initialized, or if the module list
changes during the function call as a result of DLLs being loaded or
unloaded, GetModuleFileNameEx may fail or return incorrect
information. To retrieve the name of a module in the current process,
use the GetModuleFileName function. This is more efficient and more
reliable than calling GetModuleFileNameEx with a handle to the
current process. To retrieve the name of the main executable module
for a remote process, use the GetProcessImageFileName or
QueryFullProcessImageName function. This is more efficient and more
reliable than calling the GetModuleFileNameEx function with a NULL
module handle. Starting with Windows 7 and Windows Server 2008 R2,
Psapi.h establishes version numbers for the PSAPI functions. The
PSAPI version number affects the name used to call the function and
the library that a program must load. If PSAPI_VERSION is 2 or
greater, this function is defined as K32GetModuleFileNameEx in
Psapi.h and exported in Kernel32.lib and Kernel32.dll. If
PSAPI_VERSION is 1, this function is defined as GetModuleFileNameEx
in Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that
calls K32GetModuleFileNameEx. Programs that must run on earlier
versions of Windows as well as Windows 7 and later versions should
always call this function as GetModuleFileNameEx. To ensure correct
resolution of symbols, add Psapi.lib to the TARGETLIBS macro and
compile the program with -DPSAPI_VERSION=1. To use run-time dynamic
linking, load Psapi.dll.


%index
GetProcessImageFileNameW
Retrieves the name of the executable file for the specified process. (Unicode)
%group
Win32 psapi
%prm
hProcess, lpImageFileName, nSize
hProcess : [intptr] A handle to the process. The handle must have the PROCESS_QUERY_INFORMATION  or PROCESS_QUERY_LIMITED_INFORMATION access right. For more information, see Process Security and Access Rights. Windows Server?2003 and Windows?XP:??The handle must have the PROCESS_QUERY_INFORMATION access right.
lpImageFileName : [wstr] A pointer to a buffer that receives the full path to the executable file.
nSize : [int] The size of the lpImageFileName buffer, in characters.
%inst
Retrieves the name of the executable file for the specified process.
(Unicode)

[戻り値]
If the function succeeds, the return value specifies the length of
the string copied to the buffer. If the function fails, the return
value is zero. To get extended error information, call GetLastError.

[備考]
The file Psapi.dll is installed in the %windir%\System32 directory.
If there is another copy of this DLL on your computer, it can lead to
the following error when running applications on your system: "The
procedure entry point GetProcessImageFileName could not be located in
the dynamic link library PSAPI.DLL." To work around this problem,
locate any versions that are not in the %windir%\System32 directory
and delete or rename them, then restart. The GetProcessImageFileName
function returns the path in device form, rather than drive letters.
For example, the file name C:\Windows\System32\Ctype.nls would look
as follows in device form:
\Device\Harddisk0\Partition1\Windows\System32\Ctype.nls To retrieve
the module name of the current process, use the GetModuleFileName
function with a NULL module handle. This is more efficient than
calling the GetProcessImageFileName function with a handle to the
current process. To retrieve the name of the main executable module
for a remote process in win32 path format, use the
QueryFullProcessImageName function. Starting with Windows 7 and
Windows Server 2008 R2, Psapi.h establishes version numbers for the
PSAPI functions. The PSAPI version number affects the name used to
call the function and the library that a program must load. If
PSAPI_VERSION is 2 or greater, this function is defined as
K32GetProcessImageFileName in Psapi.h and exported in Kernel32.lib
and Kernel32.dll. If PSAPI_VERSION is 1, this function is defined as
GetProcessImageFileName in Psapi.h and exported in Psapi.lib and
Psapi.dll as a wrapper that calls K32GetProcessImageFileName.
Programs that must run on earlier versions of Windows as well as
Windows 7 and later versions should always call this function as
GetProcessImageFileName. To ensure correct resolution of symbols, add
Psapi.lib to the TARGETLIBS macro and compile the program with
-DPSAPI_VERSION=1. To use run-time dynamic linking, load Psapi.dll.
> [!NOTE] > The psapi.h header defines GetProcessImageFileName as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetProcessMemoryInfo
Retrieves information about the memory usage of the specified process.
%group
Win32 psapi
%prm
Process, ppsmemCounters, cb
Process : [intptr] A handle to the process. The handle must have the **PROCESS_QUERY_INFORMATION** or **PROCESS_QUERY_LIMITED_INFORMATION** access right. For more information, see Process Security and Access Rights. **Windows Server 2003 and Windows XP:** The handle must have the **PROCESS_QUERY_INFORMATION** and **PROCESS_VM_READ** access rights.
ppsmemCounters : [var] A pointer to the PROCESS_MEMORY_COUNTERS or PROCESS_MEMORY_COUNTERS_EX structure that receives information about the memory usage of the process.
cb : [int] The size of the ppsmemCounters structure, in bytes.
%inst
Retrieves information about the memory usage of the specified
process.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Starting with Windows 7 and Windows Server 2008 R2, Psapi.h
establishes version numbers for the PSAPI functions. The PSAPI
version number affects the name used to call the function and the
library that a program must load. If **PSAPI_VERSION** is 2 or
greater, this function is defined as **K32GetProcessMemoryInfo** in
Psapi.h and exported in Kernel32.lib and Kernel32.dll. If
**PSAPI_VERSION** is 1, this function is defined as
**GetProcessMemoryInfo** in Psapi.h and exported in Psapi.lib and
Psapi.dll as a wrapper that calls **K32GetProcessMemoryInfo**.
Programs that must run on earlier versions of Windows as well as
Windows 7 and later versions should always call this function as
**GetProcessMemoryInfo**. To ensure correct resolution of symbols,
add Psapi.lib to the **TARGETLIBS** macro and compile the program
with **-DPSAPI_VERSION=1**. To use run-time dynamic linking, load
Psapi.dll.

