; ============================================================
;   psapi.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
EmptyWorkingSet
Removes as many pages as possible from the working set of the specified process.
%group
Win32 psapi
%prm
hProcess
hProcess : [intptr] A handle to the process. The handle must have the PROCESS_QUERY_INFORMATION or PROCESS_QUERY_LIMITED_INFORMATION access right and the PROCESS_SET_QUOTA access right. For more information, see Process Security and Access Rights.
%inst
Removes as many pages as possible from the working set of the
specified process.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
You can also empty the working set by calling the
SetProcessWorkingSetSize or SetProcessWorkingSetSizeEx function with
the dwMinimumWorkingSetSize and dwMaximumWorkingSetSize parameters
set to the value (SIZE_T)(-1). Starting with Windows 7 and Windows
Server 2008 R2, Psapi.h establishes version numbers for the PSAPI
functions. The PSAPI version number affects the name used to call the
function and the library that a program must load. If PSAPI_VERSION
is 2 or greater, this function is defined as K32EmptyWorkingSet in
Psapi.h and exported in Kernel32.lib and Kernel32.dll. If
PSAPI_VERSION is 1, this function is defined as K32EmptyWorkingSet in
Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that
calls K32EmptyWorkingSet. Programs that must run on earlier versions
of Windows as well as Windows 7 and later versions should always call
this function as K32EmptyWorkingSet. To ensure correct resolution of
symbols, add Psapi.lib to the TARGETLIBS macro and compile the
program with -DPSAPI_VERSION=1. To use run-time dynamic linking, load
Psapi.dll.


%index
EnumDeviceDrivers
Retrieves the load address for each device driver in the system.
%group
Win32 psapi
%prm
lpImageBase, cb, lpcbNeeded
lpImageBase : [var] An array that receives the list of load addresses for the device drivers.
cb : [int] The size of the lpImageBase array, in bytes. If the array is not large enough to store the load addresses, the lpcbNeeded parameter receives the required size of the array.
lpcbNeeded : [var] The number of bytes returned in the lpImageBase array.
%inst
Retrieves the load address for each device driver in the system.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
To determine how many device drivers were enumerated by the call to
EnumDeviceDrivers, divide the resulting value in the lpcbNeeded
parameter by sizeof(LPVOID). Starting with Windows 7 and Windows
Server 2008 R2, Psapi.h establishes version numbers for the PSAPI
functions. The PSAPI version number affects the name used to call the
function and the library that a program must load. If PSAPI_VERSION
is 2 or greater, this function is defined as K32EnumDeviceDrivers in
Psapi.h and exported in Kernel32.lib and Kernel32.dll. If
PSAPI_VERSION is 1, this function is defined as EnumDeviceDrivers in
Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that
calls K32EnumDeviceDrivers. Programs that must run on earlier
versions of Windows as well as Windows 7 and later versions should
always call this function as EnumDeviceDrivers. To ensure correct
resolution of symbols, add Psapi.lib to the TARGETLIBS macro and
compile the program with ?DPSAPI_VERSION=1. To use run-time dynamic
linking, load Psapi.dll.


%index
EnumPageFilesW
Calls the callback routine for each installed pagefile in the system. (Unicode)
%group
Win32 psapi
%prm
pCallBackRoutine, pContext
pCallBackRoutine : [int] A pointer to the routine called for each pagefile. For more information, see EnumPageFilesProc.
pContext : [intptr] The user-defined data passed to the callback routine.
%inst
Calls the callback routine for each installed pagefile in the system.
(Unicode)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To get extended error information,
call GetLastError.

[備考]
Starting with Windows 7 and Windows Server 2008 R2, Psapi.h
establishes version numbers for the PSAPI functions. The PSAPI
version number affects the name used to call the function and the
library that a program must load. If PSAPI_VERSION is 2 or greater,
this function is defined as K32EnumPageFiles in Psapi.h and exported
in Kernel32.lib and Kernel32.dll. If PSAPI_VERSION is 1, this
function is defined as EnumPageFiles in Psapi.h and exported in
Psapi.lib and Psapi.dll as a wrapper that calls K32EnumPageFiles.
Programs that must run on earlier versions of Windows as well as
Windows 7 and later versions should always call this function as
EnumPageFiles. To ensure correct resolution of symbols, add Psapi.lib
to the TARGETLIBS macro and compile the program with
?DPSAPI_VERSION=1. To use run-time dynamic linking, load Psapi.dll.
> [!NOTE] > The psapi.h header defines EnumPageFiles as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
EnumProcessModules
指定プロセス内の各モジュールのハンドルを取得する。
%group
Win32 psapi
%prm
hProcess, lphModule, cb, lpcbNeeded
hProcess : [intptr] プロセスのハンドル。
lphModule : [intptr] モジュールハンドルのリストを受け取る配列。
cb : [int] lphModule 配列のサイズ(バイト単位)。
lpcbNeeded : [var] すべてのモジュールハンドルを格納するのに必要なバイト数。
%inst
指定プロセス内の各モジュールのハンドルを取得する。

[戻り値]
成功時は 0 以外、失敗時は 0 を返す。拡張エラー情報は GetLastError で取得する。

[備考]

本関数は主にデバッガなど別プロセスのモジュール情報を取得するツール向けに設計されている。対象プロセスのモジュールリストが壊れていたり未初期化、または呼び出し中に
DLL のロード/アンロードで変化した場合は失敗や不正結果を返すことがある。大きな配列を使うのが望ましい。lpcbNeeded > cb
なら配列を拡大して再試行する。32 ビットアプリが WOW64 上で呼び出した場合は 32 ビットプロセスのモジュールしか列挙できず、64
ビットプロセスに対してはエラー (ERROR_PARTIAL_COPY = 299) となる。返されたハンドルに対して
CloseHandle を呼んではならない。PSAPI_VERSION による動作は EnumProcesses と同様。


%index
EnumProcessModulesEx
Retrieves a handle for each module in the specified process that meets the specified filter criteria.
%group
Win32 psapi
%prm
hProcess, lphModule, cb, lpcbNeeded, dwFilterFlag
hProcess : [intptr] A handle to the process.
lphModule : [intptr] An array that receives the list of module handles.
cb : [int] The size of the lphModule array, in bytes.
lpcbNeeded : [var] The number of bytes required to store all module handles in the lphModule array.
dwFilterFlag : [int] 
%inst
Retrieves a handle for each module in the specified process that
meets the specified filter criteria.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The EnumProcessModulesEx function is primarily designed for use by
debuggers and similar applications that must extract module
information from another process. If the module list in the target
process is corrupted or not yet initialized, or if the module list
changes during the function call as a result of DLLs being loaded or
unloaded, EnumProcessModulesEx may fail or return incorrect
information. This function is intended primarily for 64-bit
applications. If the function is called by a 32-bit application
running under WOW64, the dwFilterFlag option is ignored and the
function provides the same results as the EnumProcessModules
function. It is a good idea to specify a large array of HMODULE
values, because it is hard to predict how many modules there will be
in the process at the time you call EnumProcessModulesEx. To
determine if the lphModule array is too small to hold all module
handles for the process, compare the value returned in lpcbNeeded
with the value specified in cb. If lpcbNeeded is greater than cb,
increase the size of the array and call EnumProcessModulesEx again.
To determine how many modules were enumerated by the call to
EnumProcessModulesEx, divide the resulting value in the lpcbNeeded
parameter by sizeof(HMODULE). The EnumProcessModulesEx function does
not retrieve handles for modules that were loaded with the
LOAD_LIBRARY_AS_DATAFILE flag. For more information, see
LoadLibraryEx. Do not call CloseHandle on any of the handles returned
by this function. The information comes from a snapshot, so there are
no resources to be freed. To take a snapshot of specified processes
and the heaps, modules, and threads used by these processes, use the
CreateToolhelp32Snapshot function. Starting with Windows 7 and
Windows Server 2008 R2, Psapi.h establishes version numbers for the
PSAPI functions. The PSAPI version number affects the name used to
call the function and the library that a program must load. If
PSAPI_VERSION is 2 or greater, this function is defined as
K32EnumProcessModulesEx in Psapi.h and exported in Kernel32.lib and
Kernel32.dll. If PSAPI_VERSION is 1, this function is defined as
EnumProcessModulesEx in Psapi.h and exported in Psapi.lib and
Psapi.dll as a wrapper that calls K32EnumProcessModulesEx. Programs
that must run on earlier versions of Windows as well as Windows 7 and
later versions should always call this function as
EnumProcessModulesEx. To ensure correct resolution of symbols, add
Psapi.lib to the TARGETLIBS macro and compile the program with
?DPSAPI_VERSION=1. To use run-time dynamic linking, load Psapi.dll.


%index
EnumProcesses
システム内の各プロセスオブジェクトのプロセス識別子を取得する。
%group
Win32 psapi
%prm
lpidProcess, cb, lpcbNeeded
lpidProcess : [var] プロセス識別子のリストを受け取る配列へのポインタ。
cb : [int] pProcessIds 配列のサイズ(バイト単位)。
lpcbNeeded : [var] pProcessIds 配列に返されたバイト数。
%inst
システム内の各プロセスオブジェクトのプロセス識別子を取得する。

[戻り値]
成功時は 0 以外、失敗時は 0 を返す。拡張エラー情報は GetLastError で取得する。

[備考]
EnumProcesses
呼び出し時に存在するプロセス数を事前予測するのは難しいため、大きな配列を使うのが望ましい。列挙されたプロセス数は lpcbNeeded を
sizeof(DWORD) で割って求める。バッファ不足時の通知はないため、lpcbNeeded が cb
と等しい場合は配列を拡大して再試行を検討する。プロセスハンドル取得には OpenProcess を使用する。Windows 7 /
Windows Server 2008 R2 以降、Psapi.h は PSAPI
関数にバージョン番号を設定した。PSAPI_VERSION が 2 以上では本関数は K32EnumProcesses として定義され
Kernel32 からエクスポートされる。1 の場合は従来通り Psapi.dll の EnumProcesses
として呼び出される。古い Windows との互換が必要なら EnumProcesses
として呼び出し、-DPSAPI_VERSION=1 でコンパイルする。


%index
GetDeviceDriverBaseNameW
Retrieves the base name of the specified device driver. (Unicode)
%group
Win32 psapi
%prm
ImageBase, lpBaseName, nSize
ImageBase : [intptr] The load address of the device driver. This value can be retrieved using the EnumDeviceDrivers function.
lpBaseName : [wstr] A pointer to the buffer that receives the base name of the device driver.
nSize : [int] The size of the lpBaseName buffer, in characters. If the buffer is not large enough to store the base name plus the terminating null character, the string is truncated.
%inst
Retrieves the base name of the specified device driver. (Unicode)

[戻り値]
If the function succeeds, the return value specifies the length of
the string copied to the buffer, not including any terminating null
character. If the function fails, the return value is zero. To get
extended error information, call GetLastError.

[備考]
Starting with Windows 7 and Windows Server 2008 R2, Psapi.h
establishes version numbers for the PSAPI functions. The PSAPI
version number affects the name used to call the function and the
library that a program must load. If PSAPI_VERSION is 2 or greater,
this function is defined as K32GetDeviceDriverBaseName in Psapi.h and
exported in Kernel32.lib and Kernel32.dll. If PSAPI_VERSION is 1,
this function is defined as GetDeviceDriverBaseName in Psapi.h and
exported in Psapi.lib and Psapi.dll as a wrapper that calls
K32GetDeviceDriverBaseName. Programs that must run on earlier
versions of Windows as well as Windows 7 and later versions should
always call this function as GetDeviceDriverBaseName. To ensure
correct resolution of symbols, add Psapi.lib to the TARGETLIBS macro
and compile the program with ?DPSAPI_VERSION=1. To use run-time
dynamic linking, load Psapi.dll.


%index
GetDeviceDriverFileNameW
Retrieves the path available for the specified device driver. (Unicode)
%group
Win32 psapi
%prm
ImageBase, lpFilename, nSize
ImageBase : [intptr] The load address of the device driver.
lpFilename : [wstr] A pointer to the buffer that receives the path to the device driver.
nSize : [int] The size of the lpFilename buffer, in characters. If the buffer is not large enough to store the path plus the terminating null character, the string is truncated.
%inst
Retrieves the path available for the specified device driver.
(Unicode)

[戻り値]
If the function succeeds, the return value specifies the length of
the string copied to the buffer, not including any terminating null
character. If the function fails, the return value is zero. To get
extended error information, call GetLastError.

[備考]
Starting with Windows 7 and Windows Server 2008 R2, Psapi.h
establishes version numbers for the PSAPI functions. The PSAPI
version number affects the name used to call the function and the
library that a program must load. If PSAPI_VERSION is 2 or greater,
this function is defined as K32GetDeviceDriverFileName in Psapi.h and
exported in Kernel32.lib and Kernel32.dll. If PSAPI_VERSION is 1,
this function is defined as GetDeviceDriverFileName in Psapi.h and
exported in Psapi.lib and Psapi.dll as a wrapper that calls
K32GetDeviceDriverFileName. Programs that must run on earlier
versions of Windows as well as Windows 7 and later versions should
always call this function as GetDeviceDriverFileName. To ensure
correct resolution of symbols, add Psapi.lib to the TARGETLIBS macro
and compile the program with ?DPSAPI_VERSION=1. To use run-time
dynamic linking, load Psapi.dll.
> [!NOTE] > The psapi.h header defines GetDeviceDriverFileName as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetMappedFileNameW
Checks whether the specified address is within a memory-mapped file in the address space of the specified process. If so, the function returns the name of the memory-mapped file. (Unicode)
%group
Win32 psapi
%prm
hProcess, lpv, lpFilename, nSize
hProcess : [intptr] A handle to the process. The handle must have the PROCESS_QUERY_INFORMATION access rightF. For more information, see Process Security and Access Rights.
lpv : [intptr] The address to be verified.
lpFilename : [wstr] A pointer to the buffer that receives the name of the memory-mapped file to which the address specified by lpv belongs.
nSize : [int] The size of the lpFilename buffer, in characters.
%inst
Checks whether the specified address is within a memory-mapped file
in the address space of the specified process. If so, the function
returns the name of the memory-mapped file. (Unicode)

[戻り値]
If the function succeeds, the return value specifies the length of
the string copied to the buffer, in characters. If the function
fails, the return value is zero. To get extended error information,
call GetLastError.

[備考]
Starting with Windows 7 and Windows Server 2008 R2, Psapi.h
establishes version numbers for the PSAPI functions. The PSAPI
version number affects the name used to call the function and the
library that a program must load. If PSAPI_VERSION is 2 or greater,
this function is defined as K32GetMappedFileName in Psapi.h and
exported in Kernel32.lib and Kernel32.dll. If PSAPI_VERSION is 1,
this function is defined as GetMappedFileName in Psapi.h and exported
in Psapi.lib and Psapi.dll as a wrapper that calls
K32GetMappedFileName. Programs that must run on earlier versions of
Windows as well as Windows 7 and later versions should always call
this function as GetMappedFileName. To ensure correct resolution of
symbols, add Psapi.lib to the TARGETLIBS macro and compile the
program with -DPSAPI_VERSION=1. To use run-time dynamic linking, load
Psapi.dll. In Windows Server 2012, this function is supported by the
following technologies.
This doc was truncated.


%index
GetModuleBaseNameW
指定モジュールのベース名を取得する。(Unicode)
%group
Win32 psapi
%prm
hProcess, hModule, lpBaseName, nSize
hProcess : [intptr] モジュールを含むプロセスのハンドル。PROCESS_QUERY_INFORMATION と PROCESS_VM_READ アクセス権が必要。
hModule : [intptr] モジュールのハンドル。NULL の場合、呼び出し元プロセスの作成に使われたファイル名を返す。
lpBaseName : [wstr] モジュールのベース名を受け取るバッファへのポインタ。nSize より長い場合は切り詰められる。
nSize : [int] lpBaseName バッファのサイズ(文字単位)。
%inst
指定モジュールのベース名を取得する。(Unicode)

[戻り値]
成功時はバッファにコピーされた文字数を返す。失敗時は 0。拡張エラー情報は GetLastError で取得する。

[備考]
本関数は主にデバッガなど別プロセスのモジュール情報を取得するツール向け。現在のプロセスのモジュールベース名を取得するには
GetModuleFileName + strrchr
の方が効率的で信頼できる。リモートプロセスの主実行モジュールのベース名を取得するには GetProcessImageFileName
または QueryFullProcessImageName を使う方がよい。LOAD_LIBRARY_AS_DATAFILE
でロードされたモジュールには対応しない。PSAPI_VERSION 関連の動作は他の psapi 関数と同様。


%index
GetModuleFileNameExW
指定モジュールを含むファイルの完全修飾パスを取得する。(Unicode)
%group
Win32 psapi
%prm
hProcess, hModule, lpFilename, nSize
hProcess : [intptr] モジュールを含むプロセスのハンドル。PROCESS_QUERY_INFORMATION および PROCESS_VM_READ 権限が必要。Windows 10/Server 2016 以降では、hModule が NULL の場合 PROCESS_QUERY_LIMITED_INFORMATION だけで十分。LOAD_LIBRARY_AS_DATAFILE でロードされたモジュールのパスは取得できない。
hModule : [intptr] モジュールのハンドル。NULL の場合、hProcess に指定したプロセスの実行ファイルのパスを返す。
lpFilename : [wstr] モジュールへの完全修飾パスを受け取るバッファへのポインタ。バッファが小さい場合、ファイル名は切り詰められて NULL 終端される。
nSize : [int] lpFilename バッファのサイズ(文字単位)。
%inst
指定モジュールを含むファイルの完全修飾パスを取得する。(Unicode)

[戻り値]
成功時はバッファにコピーされた文字列長を返す。失敗時は 0。拡張エラー情報は GetLastError で取得する。

[備考]
主にデバッガなど別プロセスのモジュール情報取得用。現プロセスのモジュール名取得には GetModuleFileName
の方が効率的で信頼できる。リモートプロセスの主実行モジュール名取得には GetProcessImageFileName または
QueryFullProcessImageName を使う方がよい。PSAPI_VERSION 関連は他の psapi 関数と同様。


%index
GetModuleInformation
Retrieves information about the specified module in the MODULEINFO structure.
%group
Win32 psapi
%prm
hProcess, hModule, lpmodinfo, cb
hProcess : [intptr] A handle to the process that contains the module. The handle must have the PROCESS_QUERY_INFORMATION and PROCESS_VM_READ access rights. For more information, see Process Security and Access Rights.
hModule : [intptr] A handle to the module.
lpmodinfo : [var] A pointer to the MODULEINFO structure that receives information about the module.
cb : [int] The size of the MODULEINFO structure, in bytes.
%inst
Retrieves information about the specified module in the MODULEINFO
structure.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
To get information for the calling process, pass the handle returned
by GetCurrentProcess. The GetModuleInformation function does not
retrieve information for modules that were loaded with the
LOAD_LIBRARY_AS_DATAFILE flag. For more information, see
LoadLibraryEx. Starting with Windows 7 and Windows Server 2008 R2,
Psapi.h establishes version numbers for the PSAPI functions. The
PSAPI version number affects the name used to call the function and
the library that a program must load. If PSAPI_VERSION is 2 or
greater, this function is defined as K32GetModuleInformation in
Psapi.h and exported in Kernel32.lib and Kernel32.dll. If
PSAPI_VERSION is 1, this function is defined as
K32GetModuleInformation in Psapi.h and exported in Psapi.lib and
Psapi.dll as a wrapper that calls K32GetModuleInformation. Programs
that must run on earlier versions of Windows as well as Windows 7 and
later versions should always call this function as
K32GetModuleInformation. To ensure correct resolution of symbols, add
Psapi.lib to the TARGETLIBS macro and compile the program with
-DPSAPI_VERSION=1. To use run-time dynamic linking, load Psapi.dll.


%index
GetPerformanceInfo
Retrieves the performance values contained in the PERFORMANCE_INFORMATION structure.
%group
Win32 psapi
%prm
pPerformanceInformation, cb
pPerformanceInformation : [var] A pointer to a PERFORMANCE_INFORMATION structure that receives the performance information.
cb : [int] The size of the PERFORMANCE_INFORMATION structure, in bytes.
%inst
Retrieves the performance values contained in the
PERFORMANCE_INFORMATION structure.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To get extended error information,
call GetLastError.

[備考]
Starting with Windows 7 and Windows Server 2008 R2, Psapi.h
establishes version numbers for the PSAPI functions. The PSAPI
version number affects the name used to call the function and the
library that a program must load. If PSAPI_VERSION is 2 or greater,
this function is defined as K32GetPerformanceInfo in Psapi.h and
exported in Kernel32.lib and Kernel32.dll. If PSAPI_VERSION is 1,
this function is defined as GetPerformanceInfo in Psapi.h and
exported in Psapi.lib and Psapi.dll as a wrapper that calls
K32GetPerformanceInfo. Programs that must run on earlier versions of
Windows as well as Windows 7 and later versions should always call
this function as GetPerformanceInfo. To ensure correct resolution of
symbols, add Psapi.lib to the TARGETLIBS macro and compile the
program with ?DPSAPI_VERSION=1. To use run-time dynamic linking, load
Psapi.dll.


%index
GetProcessImageFileNameW
指定プロセスの実行ファイル名を取得する。(Unicode)
%group
Win32 psapi
%prm
hProcess, lpImageFileName, nSize
hProcess : [intptr] プロセスのハンドル。PROCESS_QUERY_INFORMATION または PROCESS_QUERY_LIMITED_INFORMATION アクセス権が必要。Windows Server 2003/Windows XP: PROCESS_QUERY_INFORMATION が必要。
lpImageFileName : [wstr] 実行ファイルへの完全パスを受け取るバッファへのポインタ。
nSize : [int] lpImageFileName バッファのサイズ(文字単位)。
%inst
指定プロセスの実行ファイル名を取得する。(Unicode)

[戻り値]
成功時はバッファにコピーされた文字列長を返す。失敗時は 0。拡張エラー情報は GetLastError で取得する。

[備考]
Psapi.dll は %windir%\System32
にインストールされる。別の場所に複製があるとエントリポイントのエラーが起こるため、対処として別の場所のものを削除/リネームする必要がある。本関数はドライブレターではなくデバイス形式のパスを返す(例:
\Device\Harddisk0\Partition1\... )。現プロセスのモジュール名取得には GetModuleFileName
の方が効率的。Win32 パス形式が必要なら QueryFullProcessImageName を使う。PSAPI_VERSION
関連は他の psapi 関数と同様。
> [!NOTE] > psapi.h は UNICODE マクロに応じて GetProcessImageFileName を
ANSI/Unicode 版のエイリアスとして定義する。


%index
GetProcessMemoryInfo
指定プロセスのメモリ使用情報を取得する。
%group
Win32 psapi
%prm
Process, ppsmemCounters, cb
Process : [intptr] プロセスのハンドル。**PROCESS_QUERY_INFORMATION** または **PROCESS_QUERY_LIMITED_INFORMATION** アクセス権が必要。**Windows Server 2003 および Windows XP:** **PROCESS_QUERY_INFORMATION** と **PROCESS_VM_READ** が必要。
ppsmemCounters : [var] プロセスのメモリ使用情報を受け取る PROCESS_MEMORY_COUNTERS または PROCESS_MEMORY_COUNTERS_EX 構造体へのポインタ。
cb : [int] ppsmemCounters 構造体のサイズ(バイト単位)。
%inst
指定プロセスのメモリ使用情報を取得する。

[戻り値]
成功時は 0 以外、失敗時は 0 を返す。拡張エラー情報は GetLastError で取得する。

[備考]
Windows 7 / Windows Server 2008 R2 以降、Psapi.h は PSAPI
関数にバージョン番号を設定した。**PSAPI_VERSION** が 2 以上では本関数は
**K32GetProcessMemoryInfo** として定義され Kernel32 からエクスポートされる。1 の場合は従来通り
Psapi.dll 経由となる。互換が必要なら **GetProcessMemoryInfo**
として呼び出し、**-DPSAPI_VERSION=1** でコンパイルする。


%index
GetWsChanges
Retrieves information about the pages that have been added to the working set of the specified process since the last time this function or the InitializeProcessForWsWatch function was called.
%group
Win32 psapi
%prm
hProcess, lpWatchInfo, cb
hProcess : [intptr] A handle to the process. The handle must have the PROCESS_QUERY_INFORMATION access right. For more information, see Process Security and Access Rights.
lpWatchInfo : [var] A pointer to a user-allocated buffer that receives an array of PSAPI_WS_WATCH_INFORMATION structures. The array is terminated with a structure whose FaultingPc member is NULL.
cb : [int] The size of the lpWatchInfo buffer, in bytes.
%inst
Retrieves information about the pages that have been added to the
working set of the specified process since the last time this
function or the InitializeProcessForWsWatch function was called.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.
GetLastError returns ERROR_INSUFFICIENT_BUFFER if the lpWatchInfo
buffer is not large enough to contain all the working set change
records; the buffer is returned empty. Reallocate a larger block of
memory for the buffer and call again.

[備考]
The operating system uses one buffer per process to maintain working
set change records. If more than one application (or multiple threads
in the same application) calls this function with the same process
handle, neither application will have a complete accounting of the
working set changes because each call empties the buffer. The
operating system does not record new change records while it is
processing the query (and emptying the buffer). The function sets the
error code to NO_MORE_ENTRIES if a concurrent query is received while
it is processing another query. If the buffer becomes full, no new
records are added to the buffer until this function or the
InitializeProcessForWsWatch function is called. You should call this
method with enough frequency to prevent possible data loss. If
records are lost, the array is terminated with a structure whose
FaultingPc member is NULL and whose FaultingVa member is set to the
number of records that were lost. Windows Server 2003 and Windows XP:
If records are lost, the array is terminated with a structure whose
FaultingPc member is NULL and whose FaultingVa member is 1. Starting
with Windows 7 and Windows Server 2008 R2, Psapi.h establishes
version numbers for the PSAPI functions. The PSAPI version number
affects the name used to call the function and the library that a
program must load. If PSAPI_VERSION is 2 or greater, this function is
defined as K32GetWsChanges in Psapi.h and exported in Kernel32.lib
and Kernel32.dll. If PSAPI_VERSION is 1, this function is defined as
GetWsChanges in Psapi.h and exported in Psapi.lib and Psapi.dll as a
wrapper that calls K32GetWsChanges. Programs that must run on earlier
versions of Windows as well as Windows 7 and later versions should
always call this function as GetWsChanges. To ensure correct
resolution of symbols, add Psapi.lib to the TARGETLIBS macro and
compile the program with -DPSAPI_VERSION=1. To use run-time dynamic
linking, load Psapi.dll.


%index
GetWsChangesEx
Retrieves extended information about the pages that have been added to the working set of the specified process since the last time this function or the InitializeProcessForWsWatch function was called.
%group
Win32 psapi
%prm
hProcess, lpWatchInfoEx, cb
hProcess : [intptr] A handle to the process. The handle must have the PROCESS_QUERY_INFORMATION access right. For more information, see Process Security and Access Rights.
lpWatchInfoEx : [var] A pointer to a user-allocated buffer that receives an array of PSAPI_WS_WATCH_INFORMATION_EX structures. The array is terminated with a structure whose FaultingPc member is NULL.
cb : [var] The size of the lpWatchInfoEx buffer, in bytes.
%inst
Retrieves extended information about the pages that have been added
to the working set of the specified process since the last time this
function or the InitializeProcessForWsWatch function was called.

[戻り値]
If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. To get extended
error information, call the GetLastError function. The GetLastError
function returns ERROR_INSUFFICIENT_BUFFER if the lpWatchInfoEx
buffer is not large enough to contain all the working set change
records; the buffer is returned empty. Reallocate a larger block of
memory for the buffer and call again.

[備考]
The operating system uses one buffer per process to maintain working
set change records. If more than one application (or multiple threads
in the same application) calls this function with the same process
handle, neither application will have a complete accounting of the
working set changes because each call empties the buffer. The
operating system does not record new change records while it is
processing the query (and emptying the buffer). This function sets
the error code to NO_MORE_ENTRIES if a concurrent query is received
while it is processing another query. If the buffer becomes full, no
new records are added to the buffer until this function or the
InitializeProcessForWsWatch function is called. You should call
GetWsChangesEx with enough frequency to prevent possible data loss.
If records are lost, the array is terminated with a structure whose
FaultingPc member is NULL and whose FaultingVa member is set to the
number of records that were lost. Starting with Windows 7 and Windows
Server 2008 R2, Psapi.h establishes version numbers for the PSAPI
functions. The PSAPI version number affects the name used to call the
function and the library that a program must load. If PSAPI_VERSION
is 2 or greater, this function is defined as K32GetWsChangesEx in
Psapi.h and exported in Kernel32.lib and Kernel32.dll. If
PSAPI_VERSION is 1, this function is defined as GetWsChangesEx in
Psapi.h and exported in Psapi.lib and Psapi.dll as a wrapper that
calls K32GetWsChangesEx. Programs that must run on earlier versions
of Windows as well as Windows 7 and later versions should always call
this function as GetWsChangesEx. To ensure correct resolution of
symbols, add Psapi.lib to the TARGETLIBS macro and compile the
program with -DPSAPI_VERSION=1. To use run-time dynamic linking, load
Psapi.dll.


%index
InitializeProcessForWsWatch
Initiates monitoring of the working set of the specified process.
%group
Win32 psapi
%prm
hProcess
hProcess : [intptr] A handle to the process. The handle must have the PROCESS_QUERY_INFORMATION access right. For more information, see Process Security and Access Rights.
%inst
Initiates monitoring of the working set of the specified process.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Starting with Windows 7 and Windows Server 2008 R2, Psapi.h
establishes version numbers for the PSAPI functions. The PSAPI
version number affects the name used to call the function and the
library that a program must load. If PSAPI_VERSION is 2 or greater,
this function is defined as K32InitializeProcessForWsWatch in Psapi.h
and exported in Kernel32.lib and Kernel32.dll. If PSAPI_VERSION is 1,
this function is defined as InitializeProcessForWsWatch in Psapi.h
and exported in Psapi.lib and Psapi.dll as a wrapper that calls
K32InitializeProcessForWsWatch. Programs that must run on earlier
versions of Windows as well as Windows 7 and later versions should
always call this function as InitializeProcessForWsWatch. To ensure
correct resolution of symbols, add Psapi.lib to the TARGETLIBS macro
and compile the program with -DPSAPI_VERSION=1. To use run-time
dynamic linking, load Psapi.dll.


%index
QueryWorkingSet
Retrieves information about the pages currently added to the working set of the specified process.
%group
Win32 psapi
%prm
hProcess, pv, cb
hProcess : [intptr] A handle to the process. The handle must have the PROCESS_QUERY_INFORMATION and PROCESS_VM_READ access rights. For more information, see Process Security and Access Rights.
pv : [intptr] A pointer to the buffer that receives the information. For more information, see PSAPI_WORKING_SET_INFORMATION. If the buffer pointed to by the pv parameter is not large enough to contain all working set entries for the target process, the function fails with ERROR_BAD_LENGTH. In this case, the NumberOfEntries member of the PSAPI_WORKING_SET_INFORMATION structure is set to the required number of entries, but the function does not return information about the working set entries.
cb : [int] The size of the pv buffer, in bytes.
%inst
Retrieves information about the pages currently added to the working
set of the specified process.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Starting with Windows 7 and Windows Server 2008 R2, Psapi.h
establishes version numbers for the PSAPI functions. The PSAPI
version number affects the name used to call the function and the
library that a program must load. If PSAPI_VERSION is 2 or greater,
this function is defined as K32QueryWorkingSet in Psapi.h and
exported in Kernel32.lib and Kernel32.dll. If PSAPI_VERSION is 1,
this function is defined as QueryWorkingSet in Psapi.h and exported
in Psapi.lib and Psapi.dll as a wrapper that calls
K32QueryWorkingSet. Programs that must run on earlier versions of
Windows as well as Windows 7 and later versions should always call
this function as QueryWorkingSet. To ensure correct resolution of
symbols, add Psapi.lib to the TARGETLIBS macro and compile the
program with -DPSAPI_VERSION=1. To use run-time dynamic linking, load
Psapi.dll.


%index
QueryWorkingSetEx
Retrieves extended information about the pages at specific virtual addresses in the address space of the specified process.
%group
Win32 psapi
%prm
hProcess, pv, cb
hProcess : [intptr] A handle to the process. The handle must have the PROCESS_QUERY_INFORMATION access right. For more information, see Process Security and Access Rights.
pv : [intptr] A pointer to an array of PSAPI_WORKING_SET_EX_INFORMATION structures. On input, each item in the array specifies a virtual address of interest. On output, each item in the array receives information about the corresponding virtual page.
cb : [int] The size of the pv buffer, in bytes.
%inst
Retrieves extended information about the pages at specific virtual
addresses in the address space of the specified process.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Unlike the QueryWorkingSet function, which is limited to the working
set of the target process, the QueryWorkingSetEx function can be used
to query addresses that are not in the process working set but are
still part of the process, such as AWE and large pages. Starting with
Windows 7 and Windows Server 2008 R2, Psapi.h establishes version
numbers for the PSAPI functions. The PSAPI version number affects the
name used to call the function and the library that a program must
load. If PSAPI_VERSION is 2 or greater, this function is defined as
K32QueryWorkingSetEx in Psapi.h and exported in Kernel32.lib and
Kernel32.dll. If PSAPI_VERSION is 1, this function is defined as
QueryWorkingSetEx in Psapi.h and exported in Psapi.lib and Psapi.dll
as a wrapper that calls K32QueryWorkingSetEx. Programs that must run
on earlier versions of Windows as well as Windows 7 and later
versions should always call this function as QueryWorkingSetEx. To
ensure correct resolution of symbols, add Psapi.lib to the TARGETLIBS
macro and compile the program with "?DPSAPI_VERSION=1". To use
run-time dynamic linking, load Psapi.dll.

