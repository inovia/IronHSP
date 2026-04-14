; ============================================================
;   dbghelp.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
DbgHelpCreateUserDump
(no summary)
%group
Win32 dbghelp
%prm
FileName, Callback, UserData
FileName : [str] 
Callback : [int] 
UserData : [intptr] 
%inst



%index
EnumDirTree
The EnumDirTree function (dbghelp.h) enumerates all occurrences of the specified file in the specified directory tree.
%group
Win32 dbghelp
%prm
hProcess, RootPath, InputPathName, OutputPathBuffer, cb, data
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
RootPath : [str] The path where the function should begin searching for the file.
InputPathName : [str] The name of the file to be found. You can specify a partial path.
OutputPathBuffer : [str] A pointer to a buffer that receives the full path of the file. If the function fails or does not find a matching file, this buffer will still contain the last full path that was found. This parameter is optional and can be NULL.
cb : [int] An application-defined callback function, or NULL. For more information, see EnumDirTreeProc.
data : [intptr] The user-defined data or NULL. This value is passed to the callback function.
%inst
The EnumDirTree function (dbghelp.h) enumerates all occurrences of
the specified file in the specified directory tree.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
The search can be canceled if you register a
SymRegisterCallbackProc64 callback function. For every file
operation, EnumDirTree calls this callback function with
CBA_DEFERRED_SYMBOL_LOAD_CANCEL. If the callback function returns
TRUE, EnumDirTree cancels the search. All DbgHelp functions, such as
this one, are single threaded. Therefore, calls from more than one
thread to this function will likely result in unexpected behavior or
memory corruption. To avoid this, you must synchronize all concurrent
calls from more than one thread to this function. To call the Unicode
version of this function, define DBGHELP_TRANSLATE_TCHAR.


%index
EnumerateLoadedModules64
Enumerates the loaded modules for the specified process. (EnumerateLoadedModules64)
%group
Win32 dbghelp
%prm
hProcess, EnumLoadedModulesCallback, UserContext
hProcess : [intptr] A handle to the process whose modules will be enumerated.
EnumLoadedModulesCallback : [int] An application-defined callback function. For more information, see EnumerateLoadedModulesProc64.
UserContext : [intptr] Optional user-defined data. This value is passed to the callback function.
%inst
Enumerates the loaded modules for the specified process.
(EnumerateLoadedModules64)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function. To call the Unicode version of this
function, EnumerateLoadedModulesW64, define DBGHELP_TRANSLATE_TCHAR.
EnumerateLoadedModulesW64 is defined as follows in DbgHelp.h.
This doc was truncated.


%index
EnumerateLoadedModulesEx
The EnumerateLoadedModulesEx function (dbghelp.h) enumerates the loaded modules for the specified process.
%group
Win32 dbghelp
%prm
hProcess, EnumLoadedModulesCallback, UserContext
hProcess : [intptr] A handle to the process whose modules will be enumerated.
EnumLoadedModulesCallback : [int] An application-defined callback function. For more information, see EnumerateLoadedModulesProc64.
UserContext : [intptr] Optional user-defined data. This value is passed to the callback function.
%inst
The EnumerateLoadedModulesEx function (dbghelp.h) enumerates the
loaded modules for the specified process.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function. To call the Unicode version of this
function, define DBGHELP_TRANSLATE_TCHAR.


%index
EnumerateLoadedModulesW64
Enumerates the loaded modules for the specified process. (EnumerateLoadedModulesW64)
%group
Win32 dbghelp
%prm
hProcess, EnumLoadedModulesCallback, UserContext
hProcess : [intptr] A handle to the process whose modules will be enumerated.
EnumLoadedModulesCallback : [int] An application-defined callback function. For more information, see EnumerateLoadedModulesProc64.
UserContext : [intptr] Optional user-defined data. This value is passed to the callback function.
%inst
Enumerates the loaded modules for the specified process.
(EnumerateLoadedModulesW64)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function. To call the Unicode version of this
function, EnumerateLoadedModulesW64, define DBGHELP_TRANSLATE_TCHAR.
EnumerateLoadedModulesW64 is defined as follows in DbgHelp.h.
This doc was truncated.


%index
FindDebugInfoFile
Locates a debug (.dbg) file.
%group
Win32 dbghelp
%prm
FileName, SymbolPath, DebugFilePath
FileName : [str] The name of the .dbg file that is desired. You can use a partial path.
SymbolPath : [str] The path where symbol files are located. This can be multiple paths separated by semicolons. To retrieve the symbol path, use the SymGetSearchPath function.
DebugFilePath : [str] A pointer to a buffer that receives the full path of the .dbg file.
%inst
Locates a debug (.dbg) file.

[戻り値]
If the function succeeds, the return value is an open handle to the
.dbg file. If the function fails, the return value is NULL. To
retrieve extended error information, call GetLastError.

[備考]
The FindDebugInfoFile function is used to locate a .dbg file. This
function is provided so the search can be conducted in several
different directories through a single function call. The SymbolPath
parameter can contain multiple paths, with each separated by a
semicolon (;). When multiple paths are specified, the function
searches each directory for the file. Subdirectories are not
searched. When the file is located, the search stops. Thus, be sure
to specify SymbolPath with the paths in the correct order. All
DbgHelp functions, such as this one, are single threaded. Therefore,
calls from more than one thread to this function will likely result
in unexpected behavior or memory corruption. To avoid this, you must
synchronize all concurrent calls from more than one thread to this
function.


%index
FindDebugInfoFileEx
The FindDebugInfoFileEx function (dbghelp.h) locates the specified debug (.dbg) file.
%group
Win32 dbghelp
%prm
FileName, SymbolPath, DebugFilePath, Callback, CallerData
FileName : [str] The name of the .dbg file to locate. You can use a partial path.
SymbolPath : [str] The path where symbol files are located. This can be multiple paths separated by semicolons. To retrieve the symbol path, use the SymGetSearchPath function.
DebugFilePath : [str] A pointer to a buffer that receives the full path of the .dbg file.
Callback : [int] An application-defined callback function that verifies whether the correct file was found or the function should continue its search. For more information, see FindDebugInfoFileProc.
CallerData : [intptr] Optional user-defined data to pass to the callback function.
%inst
The FindDebugInfoFileEx function (dbghelp.h) locates the specified
debug (.dbg) file.

[戻り値]
If the function succeeds, the return value is an open handle to the
.dbg file. If the function fails, the return value is NULL. To
retrieve extended error information, call GetLastError.

[備考]
The FindDebugInfoFileEx function is used to locate a .dbg file. This
function is provided so the search can be conducted in several
different directories through a single function call. The SymbolPath
parameter can contain multiple paths, with each separated by a
semicolon (;). When multiple paths are specified, the function
searches each specified directory for the file. When the file is
located, the search stops. Thus, be sure to specify SymbolPath with
the paths in the correct order. If the file name specified does not
include a .dbg extension, FindDebugInfoFileEx searches for the file
in the following sequence:
This doc was truncated.


%index
FindExecutableImage
Locates an executable file.
%group
Win32 dbghelp
%prm
FileName, SymbolPath, ImageFilePath
FileName : [str] The name of the symbol file to be located. This parameter can be a partial path.
SymbolPath : [str] The path where symbol files are located. This can be multiple paths separated by semicolons. To retrieve the symbol path, use the SymGetSearchPath function.
ImageFilePath : [str] A pointer to a buffer that receives the full path of the executable file.
%inst
Locates an executable file.

[戻り値]
If the function succeeds, the return value is an open handle to the
executable file. If the function fails, the return value is NULL. To
retrieve extended error information, call GetLastError.

[備考]
The FindExecutableImage function is provided so executable files can
be located in several different directories through a single function
call. The SymbolPath parameter can contain multiple paths, with each
separated by a semicolon (;). When multiple paths are specified, the
function searches each directory tree for the executable file. When
the file is located, the search stops. Thus, be sure to specify
SymbolPath with the paths in the correct order. All DbgHelp
functions, such as this one, are single threaded. Therefore, calls
from more than one thread to this function will likely result in
unexpected behavior or memory corruption. To avoid this, you must
synchronize all concurrent calls from more than one thread to this
function.


%index
FindExecutableImageEx
The FindExecutableImageEx function (dbghelp.h) locates the specified executable file.
%group
Win32 dbghelp
%prm
FileName, SymbolPath, ImageFilePath, Callback, CallerData
FileName : [str] The name of the symbol file to be located. This parameter can be a partial path.
SymbolPath : [str] The path where symbol files are located. This string can contain multiple paths separated by semicolons. To retrieve the symbol path, use the SymGetSearchPath function.
ImageFilePath : [str] A pointer to a buffer that receives the full path of the executable file.
Callback : [int] An application-defined callback function that verifies whether the correct executable file was found, or whether the function should continue its search. For more information, see FindExecutableImageProc.
CallerData : [intptr] Optional user-defined data for the callback function. This parameter can be NULL.
%inst
The FindExecutableImageEx function (dbghelp.h) locates the specified
executable file.

[戻り値]
If the function succeeds, the return value is an open handle to the
executable file. If the function fails, the return value is NULL. To
retrieve extended error information, call GetLastError.

[備考]
The FindExecutableImageEx function is provided so executable files
can be found in several different directories by using a single
function call. If the SymbolPath parameter contains multiple paths,
the function searches each specified directory tree for the
executable file. When the file is found, the search stops. Thus, be
sure to specify SymbolPath with the paths in the correct order. All
DbgHelp functions, such as this one, are single threaded. Therefore,
calls from more than one thread to this function will likely result
in unexpected behavior or memory corruption. To avoid this, you must
synchronize all concurrent calls from more than one thread to this
function. To call the Unicode version of this function, define
DBGHELP_TRANSLATE_TCHAR.


%index
FindFileInPath
(no summary)
%group
Win32 dbghelp
%prm
hprocess, SearchPathA, FileName, id, two, three, flags, FilePath
hprocess : [intptr] 
SearchPathA : [str] 
FileName : [str] 
id : [intptr] 
two : [int] 
three : [int] 
flags : [int] 
FilePath : [str] 
%inst



%index
FindFileInSearchPath
(no summary)
%group
Win32 dbghelp
%prm
hprocess, SearchPathA, FileName, one, two, three, FilePath
hprocess : [intptr] 
SearchPathA : [str] 
FileName : [str] 
one : [int] 
two : [int] 
three : [int] 
FilePath : [str] 
%inst



%index
GetSymLoadError
Gets the last symbol load error.
%group
Win32 dbghelp
%prm

%inst
Gets the last symbol load error.

[戻り値]
The last symbol load error.


%index
GetTimestampForLoadedLibrary
Retrieves the time stamp of a loaded image.
%group
Win32 dbghelp
%prm
Module
Module : [intptr] The base address of an image that is mapped into memory by a call to the MapViewOfFile function.
%inst
Retrieves the time stamp of a loaded image.

[戻り値]
If the function succeeds, the return value is the time stamp from the
image. If the function fails, the return value is zero. To retrieve
extended error information, call GetLastError.

[備考]
The time stamp for an image is initially set by the linker, but it
can be modified by operations such as rebasing. The value is
represented in the number of seconds elapsed since midnight
(00:00:00), January 1, 1970, Universal Coordinated Time, according to
the system clock. The time stamp can be printed using the C run-time
(CRT) function ctime. All DbgHelp Functions, such as this one, are
single threaded. Therefore, calls from more than one thread to this
function will likely result in unexpected behavior or memory
corruption. To avoid this, you must synchronize all concurrent calls
from more than one thread to this function.


%index
ImageDirectoryEntryToData
Obtains access to image-specific data.
%group
Win32 dbghelp
%prm
Base, MappedAsImage, DirectoryEntry, Size
Base : [intptr] The base address of the image.
MappedAsImage : [int] If this parameter is TRUE, the file is mapped by the system as an image. If the flag is FALSE, the file is mapped as a data file by the MapViewOfFile function.
DirectoryEntry : [int] 
Size : [var] A pointer to a variable that receives the size of the data for the directory entry, in bytes.
%inst
Obtains access to image-specific data.

[戻り値]
If the function succeeds, the return value is a pointer to the
directory entry's data. If the function fails, the return value is
NULL. To retrieve extended error information, call GetLastError.

[備考]
The ImageDirectoryEntryToData function is used to obtain access to
image-specific data. All DbgHelp functions, such as this one, are
single threaded. Therefore, calls from more than one thread to this
function will likely result in unexpected behavior or memory
corruption. To avoid this, you must synchronize all concurrent calls
from more than one thread to this function.


%index
ImageDirectoryEntryToDataEx
Locates a directory entry within the image header and returns the address of the data for the directory entry. This function returns the section header for the data located, if one exists.
%group
Win32 dbghelp
%prm
Base, MappedAsImage, DirectoryEntry, Size, FoundHeader
Base : [intptr] The base address of the image or data file.
MappedAsImage : [int] If the flag is TRUE, the file is mapped by the system as an image. If this flag is FALSE, the file is mapped as a data file by the MapViewOfFile function.
DirectoryEntry : [int] 
Size : [var] A pointer to a variable that receives the size of the data for the directory entry that is located.
FoundHeader : [var] A pointer to an IMAGE_SECTION_HEADER structure that receives the data. If the section header does not exist, this parameter is NULL.
%inst
Locates a directory entry within the image header and returns the
address of the data for the directory entry. This function returns
the section header for the data located, if one exists.

[戻り値]
If the function succeeds, the return value is a pointer to the data
for the directory entry. If the function fails, the return value is
NULL. To retrieve extended error information, call GetLastError. All
DbgHelp functions, such as this one, are single threaded. Therefore,
calls from more than one thread to this function will likely result
in unexpected behavior or memory corruption. To avoid this, you must
synchronize all concurrent calls from more than one thread to this
function.


%index
ImagehlpApiVersion
Retrieves the version information of the DbgHelp library installed on the system.
%group
Win32 dbghelp
%prm

%inst
Retrieves the version information of the DbgHelp library installed on
the system.

[戻り値]
The return value is a pointer to an API_VERSION structure.

[備考]
Use the information in the API_VERSION structure to determine whether
the version of the library installed on the system is compatible with
the version of the library used by the application. Although the
library functions are backward compatible, functions introduced in
one version are obviously not available in earlier versions. All
DbgHelp functions, such as this one, are single threaded. Therefore,
calls from more than one thread to this function will likely result
in unexpected behavior or memory corruption. To avoid this, you must
synchronize all concurrent calls from more than one thread to this
function.


%index
ImagehlpApiVersionEx
Modifies the version information of the library used by the application.
%group
Win32 dbghelp
%prm
AppVersion
AppVersion : [var] A pointer to an API_VERSION structure that contains valid version information for your application.
%inst
Modifies the version information of the library used by the
application.

[戻り値]
The return value is a pointer to an API_VERSION structure.

[備考]
Use the ImagehlpApiVersionEx function to indicate the version of the
library with which the application was built. The library uses this
information to ensure compatibility. For example, consider walking
through kernel-mode callback stack frames (User and GDI exist in
kernel mode). If you call ImagehlpApiVersionEx to set the Revision
member to version 4 or later, the StackWalk64 function will continue
through a callback stack frame. Otherwise, if you set Revision to a
version earlier than 4, StackWalk64 will stop at the kernel
transition. All DbgHelp functions, such as this one, are single
threaded. Therefore, calls from more than one thread to this function
will likely result in unexpected behavior or memory corruption. To
avoid this, you must synchronize all concurrent calls from more than
one thread to this function.


%index
MakeSureDirectoryPathExists
Creates all the directories in the specified path, beginning with the root.
%group
Win32 dbghelp
%prm
DirPath
DirPath : [str] A valid path name. If the final component of the path is a directory, not a file name, the string must end with a backslash (\\) character.
%inst
Creates all the directories in the specified path, beginning with the
root.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
Each directory specified is created, if it does not already exist. If
only some of the directories are created, the function will return
FALSE. This function does not support Unicode strings. To specify a
Unicode path, use the SHCreateDirectoryEx function. All DbgHelp
functions, such as this one, are single threaded. Therefore, calls
from more than one thread to this function will likely result in
unexpected behavior or memory corruption. To avoid this, you must
synchronize all concurrent calls from more than one thread to this
function.


%index
RangeMapAddPeImageSections
(no summary)
%group
Win32 dbghelp
%prm
RmapHandle, ImageName, MappedImage, MappingBytes, ImageBase, UserTag, MappingFlags
RmapHandle : [intptr] 
ImageName : [wstr] 
MappedImage : [intptr] 
MappingBytes : [int] 
ImageBase : [int64] 
UserTag : [int64] 
MappingFlags : [int] 
%inst



%index
RangeMapCreate
(no summary)
%group
Win32 dbghelp
%prm

%inst



%index
RangeMapFree
(no summary)
%group
Win32 dbghelp
%prm
RmapHandle
RmapHandle : [intptr] 
%inst



%index
RangeMapRead
(no summary)
%group
Win32 dbghelp
%prm
RmapHandle, Offset, Buffer, RequestBytes, Flags, DoneBytes
RmapHandle : [intptr] 
Offset : [int64] 
Buffer : [intptr] 
RequestBytes : [int] 
Flags : [int] 
DoneBytes : [var] 
%inst



%index
RangeMapRemove
(no summary)
%group
Win32 dbghelp
%prm
RmapHandle, UserTag
RmapHandle : [intptr] 
UserTag : [int64] 
%inst



%index
RangeMapWrite
(no summary)
%group
Win32 dbghelp
%prm
RmapHandle, Offset, Buffer, RequestBytes, Flags, DoneBytes
RmapHandle : [intptr] 
Offset : [int64] 
Buffer : [intptr] 
RequestBytes : [int] 
Flags : [int] 
DoneBytes : [var] 
%inst



%index
RemoveInvalidModuleList
(no summary)
%group
Win32 dbghelp
%prm
hProcess
hProcess : [intptr] 
%inst



%index
ReportSymbolLoadSummary
(no summary)
%group
Win32 dbghelp
%prm
hProcess, pLoadModule, pSymbolData
hProcess : [intptr] 
pLoadModule : [wstr] 
pSymbolData : [var] 
%inst



%index
SearchTreeForFile
The SearchTreeForFile function (dbghelp.h) searches a directory tree for a specified file.
%group
Win32 dbghelp
%prm
RootPath, InputPathName, OutputPathBuffer
RootPath : [str] The path where the function should begin searching for the file.
InputPathName : [str] The file for which the function will search. You can use a partial path.
OutputPathBuffer : [str] A pointer to a buffer that receives the full path to the file that is found. This string is not modified if the return value is FALSE.
%inst
The SearchTreeForFile function (dbghelp.h) searches a directory tree
for a specified file.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
The function searches for the file specified by the InputPathName
parameter beginning at the path specified in the RootPath parameter.
The maximum path depth that is allowed in the RootPath is 32
directories. When the function finds the file in the directory tree,
it places the full path to the file in the buffer specified by the
OutputPathBuffer parameter. The underlying file system specifies the
order of the subdirectory search. The search can be canceled if you
register a SymRegisterCallbackProc64 callback function. For every
directory searched, SearchTreeForFile calls this callback function
with CBA_DEFERRED_SYMBOL_LOAD_CANCEL. If the callback function
returns TRUE, SearchTreeForFile cancels the search. This function
triggers one CBA_DEFERRED_SYMBOL_LOAD_CANCEL event per directory
searched. This allows the caller to cancel the search. All DbgHelp
functions, such as this one, are single threaded. Therefore, calls
from more than one thread to this function will likely result in
unexpected behavior or memory corruption. To avoid this, you must
synchronize all concurrent calls from more than one thread to this
function. To call the Unicode version of this function, define
DBGHELP_TRANSLATE_TCHAR.


%index
SetCheckUserInterruptShared
(no summary)
%group
Win32 dbghelp
%prm
lpStartAddress
lpStartAddress : [int] 
%inst



%index
SetSymLoadError
Sets a symbol load error.
%group
Win32 dbghelp
%prm
error
error : [int] A symbol load error.
%inst
Sets a symbol load error.

[戻り値]
This function does not return a value.


%index
StackWalk64
スタックトレースを取得する。(StackWalk64)
%group
Win32 dbghelp
%prm
MachineType, hProcess, hThread, StackFrame, ContextRecord, ReadMemoryRoutine, FunctionTableAccessRoutine, GetModuleBaseRoutine, TranslateAddress
MachineType : [int] スタックトレース対象コンピュータのアーキテクチャ種別。以下のいずれかを指定できる。
hProcess : [intptr] スタックトレース対象プロセスのハンドル。ReadMemoryRoutine に有効なコールバックを渡す場合は必ずしも有効なプロセスハンドルである必要はなく、StackWalk64 呼び出し全体で一意かつ一貫していればトークンでもよい。シンボルハンドラと併用する場合は各関数呼び出しで同じプロセスハンドルを使うこと。
hThread : [intptr] スタックトレース対象スレッドのハンドル。ReadMemoryRoutine に有効なコールバックを渡す場合、必ずしも有効なスレッドハンドルである必要はない。
StackFrame : [var] STACKFRAME64 構造体へのポインタ。成功時、次のフレームの情報を受け取る。
ContextRecord : [intptr] CONTEXT 構造体へのポインタ。MachineType が IMAGE_FILE_MACHINE_I386 でない場合に必須。有効なコンテキストレコードを渡すと StackWalk64 が処理できる状況の幅が広がる。このコンテキストは変更される可能性があるため、変更されたくないコンテキストは渡さないこと。
ReadMemoryRoutine : [int] メモリ読み取りサービスを提供するコールバックルーチン。プロセスのアドレス空間からメモリを読むときに呼ばれる。NULL を渡すと既定のルーチンが使われ、その場合 hProcess は有効なプロセスハンドルでなければならない。
FunctionTableAccessRoutine : [int] プロセスのランタイム関数テーブルへのアクセスを提供するコールバックルーチン。通常 SymFunctionTableAccess64 を渡せばよい。
GetModuleBaseRoutine : [int] 任意の仮想アドレスに対するモジュールベースを提供するコールバック。通常 SymGetModuleBase64 を渡せばよい。
TranslateAddress : [int] 16 ビットアドレス変換用コールバック。ほとんどの呼び出し元は NULL を渡せばよい。
%inst
スタックトレースを取得する。(StackWalk64)

[戻り値]
成功時は TRUE、失敗時は FALSE を返す。StackWalk64 は通常 last error を設定しないことに注意。

[備考]
StackWalk64
はスタックトレース取得のための移植可能な方法を提供する。自前実装よりも本関数の利用が推奨される。StackFrame の
AddrPC、AddrFrame、AddrStack メンバーが初期化されていない場合、初回呼び出しは失敗する。DbgHelp
のすべての関数と同様、本関数は単一スレッドでのみ動作するため、複数スレッドからの呼び出しは同期が必要。本関数は従来の StackWalk
を置き換えるものである。
（以下省略）


%index
StackWalkEx
Obtains a stack trace. (StackWalkEx)
%group
Win32 dbghelp
%prm
MachineType, hProcess, hThread, StackFrame, ContextRecord, ReadMemoryRoutine, FunctionTableAccessRoutine, GetModuleBaseRoutine, TranslateAddress, Flags
MachineType : [int] The architecture type of the computer for which the stack trace is generated. This parameter can be one of the following values.
hProcess : [intptr] A handle to the process for which the stack trace is generated. If the caller supplies a valid callback pointer for the ReadMemoryRoutine parameter, then this value does not have to be a valid process handle. It can be a token that is unique and consistently the same for all calls to the StackWalkEx function. If the symbol handler is used with StackWalkEx, use the same process handles for the calls to each function.
hThread : [intptr] A handle to the thread for which the stack trace is generated. If the caller supplies a valid callback pointer for the ReadMemoryRoutine parameter, then this value does not have to be a valid thread handle. It can be a token that is unique and consistently the same for all calls to the StackWalkEx function.
StackFrame : [var] A pointer to a STACKFRAME_EX structure. This structure receives information for the next frame, if the function call succeeds.
ContextRecord : [intptr] A pointer to a CONTEXT structure. This parameter is required only when the MachineType parameter is not IMAGE_FILE_MACHINE_I386. However, it is recommended that this parameter contain a valid context record. This allows StackWalkEx to handle a greater variety of situations. This context may be modified, so do not pass a context record that should not be modified.
ReadMemoryRoutine : [int] A callback routine that provides memory read services. When the StackWalkEx function needs to read memory from the process's address space, the ReadProcessMemoryProc64 callback is used. If this parameter is NULL, then the function uses a default routine. In this case, the hProcess parameter must be a valid process handle. If this parameter is not NULL, the application should implement and register a symbol handler callback function that handles CBA_READ_MEMORY.
FunctionTableAccessRoutine : [int] A callback routine that provides access to the run-time function table for the process. This parameter is required because the StackWalkEx function does not have access to the process's run-time function table. For more information, see FunctionTableAccessProc64. The symbol handler provides functions that load and access the run-time table. If these functions are used, then SymFunctionTableAccess64 can be passed as a valid parameter.
GetModuleBaseRoutine : [int] A callback routine that provides a module base for any given virtual address. This parameter is required. For more information, see GetModuleBaseProc64. The symbol handler provides functions that load and maintain module information. If these functions are used, then SymGetModuleBase64 can be passed as a valid parameter.
TranslateAddress : [int] A callback routine that provides address translation for 16-bit addresses. For more information, see TranslateAddressProc64. Most callers of StackWalkEx can safely pass NULL for this parameter.
Flags : [int] A combination of zero or more flags.
%inst
Obtains a stack trace. (StackWalkEx)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. Note that StackWalkEx generally
does not set the last error code.

[備考]
The StackWalkEx function provides a portable method for obtaining a
stack trace. Using the StackWalkEx function is recommended over
writing your own function because of all the complexities associated
with stack walking on platforms. In addition, there are compiler
options that cause the stack to appear differently, depending on how
the module is compiled. By using this function, your application has
a portable stack trace that continues to work as the compiler and
operating system change. The first call to this function will fail if
the AddrPC, AddrFrame, and AddrStack members of the STACKFRAME64
structure passed in the StackFrame parameter are not initialized. All
DbgHelp functions, such as this one, are single threaded. Therefore,
calls from more than one thread to this function will likely result
in unexpected behavior or memory corruption. To avoid this, you must
synchronize all concurrent calls from more than one thread to this
function.


%index
SymAddSourceStream
The SymAddSourceStream function (dbghelp.h) adds the stream to the specified module for use by the Source Server.
%group
Win32 dbghelp
%prm
hProcess, Base, StreamFile, Buffer, Size
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
Base : [int64] The base address of the module.
StreamFile : [str] A null-terminated string that contains the absolute or relative path to a file that contains the source indexing stream. Can be NULL if Buffer is not NULL.
Buffer : [var] A buffer that contains the source indexing stream. Can be NULL if StreamFile is not NULL.
Size : [int] Size, in bytes, of the Buffer buffer.
%inst
The SymAddSourceStream function (dbghelp.h) adds the stream to the
specified module for use by the Source Server.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
SymAddSourceStream adds a stream of data formatted for use by the
source Server to a designated module. The caller can pass the stream
either as a buffer in the Buffer parameter or a file in the
StreamFile parameter. If both parameters are filled, then the
function uses the Buffer parameter. If both parameters are NULL, then
the function returns FALSE and the last-error code is set to
ERROR_INVALID_PARAMETER. It is important to note that
SymAddSourceStream does not add the stream to any corresponding PDB
in order to persist the data. This function is used by those
programmatically implementing their own debuggers in scenarios in
which a PDB is not available.


%index
SymAddSymbol
The SymAddSymbol function (dbghelp.h) adds a virtual symbol to the specified module.
%group
Win32 dbghelp
%prm
hProcess, BaseOfDll, Name, Address, Size, Flags
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
BaseOfDll : [int64] The base address of the module.
Name : [str] The name of the symbol. The maximum size of a symbol name is MAX_SYM_NAME characters.
Address : [int64] The address of the symbol. This address must be within the address range of the specified module.
Size : [int] The size of the symbol, in bytes. This parameter is optional.
Flags : [int] This parameter is unused.
%inst
The SymAddSymbol function (dbghelp.h) adds a virtual symbol to the
specified module.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function. To call the Unicode version of this
function, define DBGHELP_TRANSLATE_TCHAR.


%index
SymAddrIncludeInlineTrace
Indicates whether the specified address is within an inline frame.
%group
Win32 dbghelp
%prm
hProcess, Address
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
Address : [int64] The address.
%inst
Indicates whether the specified address is within an inline frame.

[戻り値]
Returns zero if the address is not within an inline frame.


%index
SymCleanup
プロセスハンドルに関連付けられたすべてのリソースを解放する。
%group
Win32 dbghelp
%prm
hProcess
hProcess : [intptr] 元々 SymInitialize に渡したプロセスハンドル。
%inst
プロセスハンドルに関連付けられたすべてのリソースを解放する。

[戻り値]
成功時は TRUE、失敗時は FALSE を返す。拡張エラー情報は GetLastError で取得する。

[備考]
本関数を呼び出さないとメモリおよびリソースのリークにつながる。DbgHelp
の他関数同様、本関数は単一スレッドでのみ動作する。プロセス起動時に 1 回 SymInitialize を呼び、終了時に 1 回
SymCleanup を呼ぶのが正しい使い方。


%index
SymCompareInlineTrace
Compares two inline traces.
%group
Win32 dbghelp
%prm
hProcess, Address1, InlineContext1, RetAddress1, Address2, RetAddress2
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
Address1 : [int64] The first address to be compared.
InlineContext1 : [int] The inline context for the first trace to be compared.
RetAddress1 : [int64] The return address of the first trace to be compared.
Address2 : [int64] The second address to be compared.
RetAddress2 : [int64] The return address of the second trace to be compared.
%inst
Compares two inline traces.

[戻り値]
Indicates the result of the comparison.
This doc was truncated.


%index
SymDeleteSymbol
The SymDeleteSymbol function (dbghelp.h) deletes a virtual symbol from the specified module.
%group
Win32 dbghelp
%prm
hProcess, BaseOfDll, Name, Address, Flags
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
BaseOfDll : [int64] The base address of the module.
Name : [str] The name of the symbol.
Address : [int64] The address of the symbol. This address must be within the address range of the specified module.
Flags : [int] This parameter is unused.
%inst
The SymDeleteSymbol function (dbghelp.h) deletes a virtual symbol
from the specified module.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function. To call the Unicode version of this
function, define DBGHELP_TRANSLATE_TCHAR.


%index
SymEnumLines
The SymEnumLines function (dbghelp.h) enumerates all lines in the specified module.
%group
Win32 dbghelp
%prm
hProcess, Base, Obj, File, EnumLinesCallback, UserContext
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
Base : [int64] The base address of the module.
Obj : [str] The name of an .obj file within the module. The scope of the enumeration is limited to this file. If this parameter is NULL or an empty string, all .obj files are searched.
File : [str] A wildcard expression that indicates the names of the source files to be searched. If this parameter is NULL or an empty string, all files are searched.
EnumLinesCallback : [int] A SymEnumLinesProc callback function that receives the line information.
UserContext : [intptr] A user-defined value that is passed to the callback function, or NULL. This parameter is typically used by an application to pass a pointer to a data structure that provides context for the callback function.
%inst
The SymEnumLines function (dbghelp.h) enumerates all lines in the
specified module.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
This function is supported for PDB information only. If you have COFF
information, try using one of the SymGetLineXXX functions. All
DbgHelp functions, such as this one, are single threaded. Therefore,
calls from more than one thread to this function will likely result
in unexpected behavior or memory corruption. To avoid this, you must
synchronize all concurrent calls from more than one thread to this
function. To call the Unicode version of this function, define
DBGHELP_TRANSLATE_TCHAR.


%index
SymEnumProcesses
Enumerates each process that has called the SymInitialize function.
%group
Win32 dbghelp
%prm
EnumProcessesCallback, UserContext
EnumProcessesCallback : [int] A SymEnumProcessesProc callback function that receives the process information.
UserContext : [intptr] A user-defined value that is passed to the callback function, or NULL. This parameter is typically used by an application to pass a pointer to a data structure that provides context for the callback function.
%inst
Enumerates each process that has called the SymInitialize function.

[戻り値]
If the function succeeds, the return value is TRUE.
If the function fails, the return value is FALSE. To retrieve
extended error information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function.


%index
SymEnumSourceFileTokens
Enumerates all individual entries in a module's source server data, if available.
%group
Win32 dbghelp
%prm
hProcess, Base, Callback
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
Base : [int64] The base address of the module.
Callback : [int] A SymEnumSourceFileTokensProc callback function that receives the symbol information.
%inst
Enumerates all individual entries in a module's source server data,
if available.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
Some modules have PDB files with source server information detailing
the version control information for each of the source files used to
create each individual module. An application can use this function
to enumerate the data for every source file that was "source
indexed". All DbgHelp functions, such as this one, are single
threaded. Therefore, calls from more than one thread to this function
will likely result in unexpected behavior or memory corruption. To
avoid this, you must synchronize all concurrent calls from more than
one thread to this function.


%index
SymEnumSourceFiles
The SymEnumSourceFiles function (dbghelp.h) enumerates all source files in a process.
%group
Win32 dbghelp
%prm
hProcess, ModBase, Mask, cbSrcFiles, UserContext
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
ModBase : [int64] The base address of the module. If this value is zero and Mask contains an exclamation point (!), the function looks across modules. If this value is zero and Mask does not contain an exclamation point, the function uses the scope established by the SymSetContext function.
Mask : [str] A wildcard expression that indicates the names of the source files to be enumerated. To specify a module name, use the !mod syntax. If this parameter is NULL, the function will enumerate all files.
cbSrcFiles : [int] Pointer to a SymEnumSourceFilesProc callback function that receives the source file information.
UserContext : [intptr] User-defined value that is passed to the callback function, or NULL. This parameter is typically used by an application to pass a pointer to a data structure that provides context for the callback function.
%inst
The SymEnumSourceFiles function (dbghelp.h) enumerates all source
files in a process.

[戻り値]
If the function succeeds, the return value is TRUE.
If the function fails, the return value is FALSE. To retrieve
extended error information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function.


%index
SymEnumSourceLines
The SymEnumSourceLines function (dbghelp.h) enumerates all source lines in a module.
%group
Win32 dbghelp
%prm
hProcess, Base, Obj, File, Line, Flags, EnumLinesCallback, UserContext
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
Base : [int64] The base address of the module.
Obj : [str] The name of an .obj file within the module. The scope of the enumeration is limited to this file. If this parameter is NULL or an empty string, all .obj files are searched.
File : [str] A wildcard expression that indicates the names of the source files to be searched. If this parameter is NULL or an empty string, all files are searched.
Line : [int] The line number of a line within the module. The scope of the enumeration is limited to this line. If this parameter is 0, all lines are searched.
Flags : [int] If this parameter is ESLFLAG_FULLPATH, the function matches the full path in the File parameter.
EnumLinesCallback : [int] A SymEnumLinesProc callback function that receives the line information.
UserContext : [intptr] A user-defined value that is passed to the callback function, or NULL. This parameter is typically used by an application to pass a pointer to a data structure that provides context for the callback function.
%inst
The SymEnumSourceLines function (dbghelp.h) enumerates all source
lines in a module.

[戻り値]
If the function succeeds, the return value is TRUE.
If the function fails, the return value is FALSE. To retrieve
extended error information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function.


%index
SymEnumSym
(no summary)
%group
Win32 dbghelp
%prm
hProcess, BaseOfDll, EnumSymbolsCallback, UserContext
hProcess : [intptr] 
BaseOfDll : [int64] 
EnumSymbolsCallback : [int] 
UserContext : [intptr] 
%inst



%index
SymEnumSymbols
The SymEnumSymbols function (dbghelp.h) enumerates all symbols in a process.
%group
Win32 dbghelp
%prm
hProcess, BaseOfDll, Mask, EnumSymbolsCallback, UserContext
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
BaseOfDll : [int64] The base address of the module. If this value is zero and Mask contains an exclamation point (!), the function looks across modules. If this value is zero and Mask does not contain an exclamation point, the function uses the scope established by the SymSetContext function.
Mask : [str] A wildcard string that indicates the names of the symbols to be enumerated. The text can optionally contain the wildcards, "*" and "?". To specify a specific module or set of modules, begin the text with a wildcard string specifying the module, followed by an exclamation point. When specifying a module, BaseOfDll is ignored.
EnumSymbolsCallback : [int] A SymEnumSymbolsProc callback function that receives the symbol information.
UserContext : [intptr] A user-defined value that is passed to the callback function, or NULL. This parameter is typically used by an application to pass a pointer to a data structure that provides context for the callback function.
%inst
The SymEnumSymbols function (dbghelp.h) enumerates all symbols in a
process.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function. To call the Unicode version of this
function, define DBGHELP_TRANSLATE_TCHAR.


%index
SymEnumSymbolsEx
The SymEnumSymbolsEx function (dbghelp.h) enumerates all symbols in a process.
%group
Win32 dbghelp
%prm
hProcess, BaseOfDll, Mask, EnumSymbolsCallback, UserContext, Options
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
BaseOfDll : [int64] The base address of the module. If this value is zero and Mask contains an exclamation point (!), the function looks across modules. If this value is zero and Mask does not contain an exclamation point, the function uses the scope established by the SymSetContext function.
Mask : [str] A wildcard string that indicates the names of the symbols to be enumerated. The text can optionally contain the wildcards, "*" and "?". To specify a specific module or set of modules, begin the text with a wildcard string specifying the module, followed by an exclamation point. When specifying a module, BaseOfDll is ignored.
EnumSymbolsCallback : [int] A SymEnumSymbolsProc callback function that receives the symbol information.
UserContext : [intptr] A user-defined value that is passed to the callback function, or NULL. This parameter is typically used by an application to pass a pointer to a data structure that provides context for the callback function.
Options : [int] Indicates possible options.
%inst
The SymEnumSymbolsEx function (dbghelp.h) enumerates all symbols in a
process.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.


%index
SymEnumSymbolsForAddr
The SymEnumSymbolsForAddr function (dbghelp.h) enumerates the symbols for the specified address.
%group
Win32 dbghelp
%prm
hProcess, Address, EnumSymbolsCallback, UserContext
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
Address : [int64] The address for which symbols are to be located. The address does not have to be on a symbol boundary. If the address comes after the beginning of a symbol and before the end of the symbol (the beginning of the symbol plus the symbol size), the function will find the symbol.
EnumSymbolsCallback : [int] An application-defined callback function. This function is called for every symbol found at Address. For more information, see SymEnumSymbolsProc.
UserContext : [intptr] Optional user-defined data. This value is passed to the callback function.
%inst
The SymEnumSymbolsForAddr function (dbghelp.h) enumerates the symbols
for the specified address.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function. To call the Unicode version of this
function, define DBGHELP_TRANSLATE_TCHAR.


%index
SymEnumTypes
The SymEnumTypes function (dbghelp.h) enumerates all user-defined types.
%group
Win32 dbghelp
%prm
hProcess, BaseOfDll, EnumSymbolsCallback, UserContext
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
BaseOfDll : [int64] The base address of the module.
EnumSymbolsCallback : [int] A pointer to an SymEnumSymbolsProc callback function that receives the symbol information.
UserContext : [intptr] A user-defined value to be passed to the callback function, or NULL. This parameter is typically used by an application to pass a pointer to a data structure that provides context information for the callback function.
%inst
The SymEnumTypes function (dbghelp.h) enumerates all user-defined
types.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function. To call the Unicode version of this
function, define DBGHELP_TRANSLATE_TCHAR.


%index
SymEnumTypesByName
The SymEnumTypesByName function (dbghelp.h) enumerates all user-defined types.
%group
Win32 dbghelp
%prm
hProcess, BaseOfDll, mask, EnumSymbolsCallback, UserContext
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
BaseOfDll : [int64] The base address of the module.
mask : [str] A wildcard expression that indicates the names of the symbols to be enumerated. To specify a module name, use the !mod syntax.
EnumSymbolsCallback : [int] A pointer to an SymEnumSymbolsProc callback function that receives the symbol information.
UserContext : [intptr] A user-defined value to be passed to the callback function, or NULL. This parameter is typically used by an application to pass a pointer to a data structure that provides context information for the callback function.
%inst
The SymEnumTypesByName function (dbghelp.h) enumerates all
user-defined types.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function. To call the Unicode version of this
function, define DBGHELP_TRANSLATE_TCHAR.


%index
SymEnumerateModules64
Enumerates all modules that have been loaded for the process by the SymLoadModule64 or SymLoadModuleEx function. (SymEnumerateModules64)
%group
Win32 dbghelp
%prm
hProcess, EnumModulesCallback, UserContext
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
EnumModulesCallback : [int] The enumeration callback function. This function is called once per module. For more information, see SymEnumerateModulesProc64.
UserContext : [intptr] A user-defined value or NULL. This value is simply passed to the callback function. Normally, this parameter is used by an application to pass a pointer to a data structure that lets the callback function establish some type of context.
%inst
Enumerates all modules that have been loaded for the process by the
SymLoadModule64 or SymLoadModuleEx function. (SymEnumerateModules64)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
The SymEnumerateModules64 function enumerates all modules that have
been loaded for the process by SymLoadModule64, even if the symbol
loading is deferred. The enumeration callback function is called once
for each module and is passed the module information. All DbgHelp
functions, such as this one, are single threaded. Therefore, calls
from more than one thread to this function will likely result in
unexpected behavior or memory corruption. To avoid this, you must
synchronize all concurrent calls from more than one thread to this
function. To call the Unicode version of this function, define
DBGHELP_TRANSLATE_TCHAR. SymEnumerateModulesW64 is defined as follows
in Dbghelp.h.
This doc was truncated.


%index
SymEnumerateModulesW64
Enumerates all modules that have been loaded for the process by the SymLoadModule64 or SymLoadModuleEx function. (SymEnumerateModulesW64)
%group
Win32 dbghelp
%prm
hProcess, EnumModulesCallback, UserContext
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
EnumModulesCallback : [int] The enumeration callback function. This function is called once per module. For more information, see SymEnumerateModulesProc64.
UserContext : [intptr] A user-defined value or NULL. This value is simply passed to the callback function. Normally, this parameter is used by an application to pass a pointer to a data structure that lets the callback function establish some type of context.
%inst
Enumerates all modules that have been loaded for the process by the
SymLoadModule64 or SymLoadModuleEx function. (SymEnumerateModulesW64)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
The SymEnumerateModules64 function enumerates all modules that have
been loaded for the process by SymLoadModule64, even if the symbol
loading is deferred. The enumeration callback function is called once
for each module and is passed the module information. All DbgHelp
functions, such as this one, are single threaded. Therefore, calls
from more than one thread to this function will likely result in
unexpected behavior or memory corruption. To avoid this, you must
synchronize all concurrent calls from more than one thread to this
function. To call the Unicode version of this function, define
DBGHELP_TRANSLATE_TCHAR. SymEnumerateModulesW64 is defined as follows
in Dbghelp.h.
This doc was truncated.


%index
SymEnumerateSymbols64
Enumerates all the symbols for a specified module. (SymEnumerateSymbols64)
%group
Win32 dbghelp
%prm
hProcess, BaseOfDll, EnumSymbolsCallback, UserContext
hProcess : [intptr] A handle to the process. This handle must have been previously passed to the SymInitialize function.
BaseOfDll : [int64] The base address of the module for which symbols are to be enumerated.
EnumSymbolsCallback : [int] The callback function that receives the symbol information. For more information, see SymEnumerateSymbolsProc64.
UserContext : [intptr] A user-defined value or NULL. This value is passed to the callback function. Typically, this parameter is used by an application to pass a pointer to a data structure that enables the callback function establish some type of context.
%inst
Enumerates all the symbols for a specified module.
(SymEnumerateSymbols64)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
The SymEnumerateSymbols64 function enumerates all the symbols for the
specified module. The module information is located by the BaseOfDll
parameter. The callback function is called once per symbol and is
passed the information for each symbol. All DbgHelp functions, such
as this one, are single threaded. Therefore, calls from more than one
thread to this function will likely result in unexpected behavior or
memory corruption. To avoid this, you must synchronize all concurrent
calls from more than one thread to this function. The Unicode version
of this function, SymEnumerateSymbolsW64 is defined as follows in
Dbghelp.h.
This doc was truncated.


%index
SymEnumerateSymbolsW64
Enumerates all the symbols for a specified module. (SymEnumerateSymbolsW64)
%group
Win32 dbghelp
%prm
hProcess, BaseOfDll, EnumSymbolsCallback, UserContext
hProcess : [intptr] A handle to the process. This handle must have been previously passed to the SymInitialize function.
BaseOfDll : [int64] The base address of the module for which symbols are to be enumerated.
EnumSymbolsCallback : [int] The callback function that receives the symbol information. For more information, see SymEnumerateSymbolsProc64.
UserContext : [intptr] A user-defined value or NULL. This value is passed to the callback function. Typically, this parameter is used by an application to pass a pointer to a data structure that enables the callback function establish some type of context.
%inst
Enumerates all the symbols for a specified module.
(SymEnumerateSymbolsW64)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
The SymEnumerateSymbols64 function enumerates all the symbols for the
specified module. The module information is located by the BaseOfDll
parameter. The callback function is called once per symbol and is
passed the information for each symbol. All DbgHelp functions, such
as this one, are single threaded. Therefore, calls from more than one
thread to this function will likely result in unexpected behavior or
memory corruption. To avoid this, you must synchronize all concurrent
calls from more than one thread to this function. The Unicode version
of this function, SymEnumerateSymbolsW64 is defined as follows in
Dbghelp.h.
This doc was truncated.


%index
SymFindDebugInfoFile
The SymFindDebugInfoFile function (dbghelp.h) locates a .dbg file in the process search path.
%group
Win32 dbghelp
%prm
hProcess, FileName, DebugFilePath, Callback, CallerData
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
FileName : [str] The name of the .dbg file. You can use a partial path.
DebugFilePath : [str] The fully qualified path of the .dbg file. This buffer must be at least MAX_PATH characters.
Callback : [int] An application-defined callback function that verifies whether the correct file was found or the function should continue its search. For more information, see FindDebugInfoFileProc.
CallerData : [intptr] A user-defined value or NULL. This value is simply passed to the callback function. This parameter is typically used by an application to pass a pointer to a data structure that provides some context for the callback function.
%inst
The SymFindDebugInfoFile function (dbghelp.h) locates a .dbg file in
the process search path.

[戻り値]
If the function succeeds, the return value is an open handle to the
.dbg file. If the function fails, the return value is NULL. To
retrieve extended error information, call GetLastError.

[備考]
This function uses the search path set using the SymInitialize or
SymSetSearchPath function. All DbgHelp functions, such as this one,
are single threaded. Therefore, calls from more than one thread to
this function will likely result in unexpected behavior or memory
corruption. To avoid this, you must synchronize all concurrent calls
from more than one thread to this function. To call the Unicode
version of this function, define DBGHELP_TRANSLATE_TCHAR.


%index
SymFindExecutableImage
The SymFindExecutableImage function (dbghelp.h) locates an executable file in the process search path.
%group
Win32 dbghelp
%prm
hProcess, FileName, ImageFilePath, Callback, CallerData
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
FileName : [str] The name of the executable file. You can use a partial path.
ImageFilePath : [str] The fully qualified path of the executable file. This buffer must be at least MAX_PATH characters.
Callback : [int] An application-defined callback function that verifies whether the correct executable file was found, or whether the function should continue its search. For more information, see FindExecutableImageProc.
CallerData : [intptr] A user-defined value or NULL. This value is simply passed to the callback function. This parameter is typically used by an application to pass a pointer to a data structure that provides some context for the callback function.
%inst
The SymFindExecutableImage function (dbghelp.h) locates an executable
file in the process search path.

[戻り値]
If the function succeeds, the return value is an open handle to the
executable file. If the function fails, the return value is NULL. To
retrieve extended error information, call GetLastError.

[備考]
This function uses the search path set using the SymInitialize or
SymSetSearchPath function. All DbgHelp functions, such as this one,
are single threaded. Therefore, calls from more than one thread to
this function will likely result in unexpected behavior or memory
corruption. To avoid this, you must synchronize all concurrent calls
from more than one thread to this function. To call the Unicode
version of this function, define DBGHELP_TRANSLATE_TCHAR.


%index
SymFindFileInPath
The SymFindFileInPath function (dbghelp.h) locates a symbol file or executable image.
%group
Win32 dbghelp
%prm
hprocess, SearchPathA, FileName, id, two, three, flags, FoundFile, callback, context
hprocess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
SearchPathA : [str] 
FileName : [str] The name of the file. You can specify a path; however, only the file name is used.
id : [intptr] The first of three identifying parameters (see Remarks).
two : [int] The second of three identifying parameters (see Remarks).
three : [int] The third of three identifying parameters (see Remarks).
flags : [int] 
FoundFile : [str] A pointer to a buffer that receives the fully qualified path to the symbol file. This buffer must be at least MAX_PATH characters.
callback : [int] A SymFindFileInPathProc callback function.
context : [intptr] A user-defined value or NULL. This value is simply passed to the callback function. This parameter is typically used by an application to pass a pointer to a data structure that provides some context for the callback function.
%inst
The SymFindFileInPath function (dbghelp.h) locates a symbol file or
executable image.

[戻り値]
If the server locates a valid symbol file, it returns TRUE;
otherwise, it returns FALSE and GetLastError returns a value that
indicates why the symbol file was not returned.

[備考]
The identifying parameters are filled in as follows:
This doc was truncated.


%index
SymFromAddr
SymFromAddr 関数 (dbghelp.h) は指定アドレスに対するシンボル情報を取得する。
%group
Win32 dbghelp
%prm
hProcess, Address, Displacement, Symbol
hProcess : [intptr] プロセスのハンドル。事前に SymInitialize に渡したハンドルでなければならない。
Address : [int64] シンボルを特定したいアドレス。シンボル境界上になくても、シンボル範囲内であれば見つかる。
Displacement : [var] シンボル先頭からのオフセット、または 0。
Symbol : [var] シンボル情報を受け取る SYMBOL_INFO 構造体へのポインタ。シンボル名は可変長であるため、末尾に続く名前用に十分大きいバッファを確保し、MaxNameLen に確保バイト数を設定しておくこと。
%inst
SymFromAddr 関数 (dbghelp.h) は指定アドレスに対するシンボル情報を取得する。

[戻り値]
成功時は TRUE、失敗時は FALSE を返す。拡張エラー情報は GetLastError で取得する。

[備考]
DbgHelp の関数はすべて単一スレッドで動作するため、複数スレッドからの呼び出しは同期が必要。Unicode 版を使うには
DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymFromIndex
The SymFromIndex function (dbghelp.h) retrieves symbol information for the specified index.
%group
Win32 dbghelp
%prm
hProcess, BaseOfDll, Index, Symbol
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
BaseOfDll : [int64] The base address of the module.
Index : [int] A unique value for the symbol.
Symbol : [var] A pointer to a SYMBOL_INFO structure that provides information about the symbol.
%inst
The SymFromIndex function (dbghelp.h) retrieves symbol information
for the specified index.

[戻り値]
If the function succeeds, the return value is TRUE.
If the function fails, the return value is FALSE. To retrieve
extended error information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function.


%index
SymFromInlineContext
The SymFromInlineContext function (dbghelp.h) retrieves symbol information for the specified address and inline context.
%group
Win32 dbghelp
%prm
hProcess, Address, InlineContext, Displacement, Symbol
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
Address : [int64] The address for which a symbol should be located. The address does not have to be on a symbol boundary. If the address comes after the beginning of a symbol and before the end of the symbol, the symbol is found.
InlineContext : [int] The inline context for which a symbol should be located.
Displacement : [var] The displacement from the beginning of the symbol, or zero.
Symbol : [var] A pointer to a SYMBOL_INFO structure that provides information about the symbol. The symbol name is variable in length; therefore this buffer must be large enough to hold the name stored at the end of the SYMBOL_INFO structure. Be sure to set the MaxNameLen member to the number of bytes reserved for the name.
%inst
The SymFromInlineContext function (dbghelp.h) retrieves symbol
information for the specified address and inline context.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.


%index
SymFromName
The SymFromName function (dbghelp.h) retrieves symbol information for the specified name.
%group
Win32 dbghelp
%prm
hProcess, Name, Symbol
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
Name : [str] The name of the symbol to be located.
Symbol : [var] A pointer to a SYMBOL_INFO structure that provides information about the symbol.
%inst
The SymFromName function (dbghelp.h) retrieves symbol information for
the specified name.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function. To call the Unicode version of this
function, define DBGHELP_TRANSLATE_TCHAR.


%index
SymFromToken
The SymFromToken function (dbghelp.h) retrieves symbol information for the specified managed code token.
%group
Win32 dbghelp
%prm
hProcess, Base, Token, Symbol
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
Base : [int64] The base address of the managed code module.
Token : [int] The managed code token.
Symbol : [var] A pointer to a SYMBOL_INFO structure that provides information about the symbol.
%inst
The SymFromToken function (dbghelp.h) retrieves symbol information
for the specified managed code token.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function. To call the Unicode version of this
function, define DBGHELP_TRANSLATE_TCHAR.


%index
SymFunctionTableAccess64
Retrieves the function table entry for the specified address. (SymFunctionTableAccess64)
%group
Win32 dbghelp
%prm
hProcess, AddrBase
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
AddrBase : [int64] The base address for which function table information is required.
%inst
Retrieves the function table entry for the specified address.
(SymFunctionTableAccess64)

[戻り値]
If the function succeeds, the return value is a pointer to the
function table entry. If the function fails, the return value is
NULL. To retrieve extended error information, call GetLastError.

[備考]
The type of pointer returned is specific to the image from which
symbols are loaded. x86: If the image is for an x86 system, this is a
pointer to an FPO_DATA structure. x64: If the image is for an x64
system, this is a pointer to an _IMAGE_RUNTIME_FUNCTION_ENTRY
structure. All DbgHelp functions, such as this one, are single
threaded. Therefore, calls from more than one thread to this function
will likely result in unexpected behavior or memory corruption. To
avoid this, you must synchronize all concurrent calls from more than
one thread to this function. This function supersedes the
SymFunctionTableAccess function. For more information, see Updated
Platform Support. SymFunctionTableAccess is defined as follows in
Dbghelp.h.
This doc was truncated.


%index
SymFunctionTableAccess64AccessRoutines
Finds a function table entry or frame pointer omission (FPO) record for an address.
%group
Win32 dbghelp
%prm
hProcess, AddrBase, ReadMemoryRoutine, GetModuleBaseRoutine
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
AddrBase : [int64] The base address for which function table information is required.
ReadMemoryRoutine : [int] Pointer to a read memory callback function.
GetModuleBaseRoutine : [int] Pointer to a get module base callback function.
%inst
Finds a function table entry or frame pointer omission (FPO) record
for an address.


%index
SymGetExtendedOption
Gets whether the specified extended symbol option on or off.
%group
Win32 dbghelp
%prm
option
option : [int] The extended symbol option to check. The following are valid values.
%inst
Gets whether the specified extended symbol option on or off.

[戻り値]
The value of the specified symbol option.


%index
SymGetFileLineOffsets64
Locates line information for the specified module and file name.
%group
Win32 dbghelp
%prm
hProcess, ModuleName, FileName, Buffer, BufferLines
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
ModuleName : [str] The name of the module in which  lines are to be located. If this parameter is NULL, the function searches all modules.
FileName : [str] The name of the file in which lines are to be located.
Buffer : [var] An array of offsets for each line. The offset for the line n is stored in element n-1. Array elements for lines that do not have line information are left unchanged.
BufferLines : [int] The size of the Buffer array, in elements.
%inst
Locates line information for the specified module and file name.

[戻り値]
If the function succeeds, the return value is the highest line number
found. This value is zero if no line information was found. If the
function fails, the return value is LINE_ERROR. To retrieve extended
error information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function.


%index
SymGetHomeDirectory
The SymGetHomeDirectory function (dbghelp.h) retrieves the home directory used by Dbghelp.
%group
Win32 dbghelp
%prm
type, dir, size
type : [int] 
dir : [str] A pointer to a string that receives the directory.
size : [int] The size of the output buffer, in characters.
%inst
The SymGetHomeDirectory function (dbghelp.h) retrieves the home
directory used by Dbghelp.

[戻り値]
If the function succeeds, the return value is a pointer to the dir
parameter. If the function fails, the return value is NULL. To
retrieve extended error information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function. To call the Unicode version of this
function, define DBGHELP_TRANSLATE_TCHAR.


%index
SymGetLineFromAddr64
指定アドレスに対するソース行を特定する。(SymGetLineFromAddr64)
%group
Win32 dbghelp
%prm
hProcess, qwAddr, pdwDisplacement, Line64
hProcess : [intptr] 元々 SymInitialize に渡したプロセスハンドル。
qwAddr : [int64] 行を特定したいアドレス。行境界上にある必要はなく、行範囲内であれば見つかる。
pdwDisplacement : [var] 行先頭からのバイト単位のオフセット、または 0。
Line64 : [var] IMAGEHLP_LINE64 構造体へのポインタ。
%inst
指定アドレスに対するソース行を特定する。(SymGetLineFromAddr64)

[戻り値]
成功時は TRUE、失敗時は FALSE を返す。拡張エラー情報は GetLastError で取得する。

[備考]
呼び出し元は Line バッファを適切に確保し、IMAGEHLP_LINE64
構造体の必要なメンバを事前に設定する必要がある。返されたバッファは他の関数で再利用される可能性があるため、返されたデータはすぐに別のバッファへコピーすること。DbgHelp
の関数同様、単一スレッドでのみ動作する。Unicode 版を使うには DBGHELP_TRANSLATE_TCHAR を定義する。
（以下省略）


%index
SymGetLineFromAddrW64
Locates the source line for the specified address. (SymGetLineFromAddrW64)
%group
Win32 dbghelp
%prm
hProcess, dwAddr, pdwDisplacement, Line
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
dwAddr : [int64] The address for which a line should be located. It is not necessary for the address to be on a line boundary. If the address appears after the beginning of a line and before the end of the line, the line is found.
pdwDisplacement : [var] The displacement in bytes from the beginning of the line, or zero.
Line : [var] A pointer to an IMAGEHLP_LINE64 structure.
%inst
Locates the source line for the specified address.
(SymGetLineFromAddrW64)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
The caller must allocate the Line buffer properly and fill in the
required members of the IMAGEHLP_LINE64 structure before calling
SymGetLineFromAddr64. This function returns a pointer to a buffer
that may be reused by another function. Therefore, be sure to copy
the data returned to another buffer immediately. All DbgHelp
functions, such as this one, are single threaded. Therefore, calls
from more than one thread to this function will likely result in
unexpected behavior or memory corruption. To avoid this, you must
synchronize all concurrent calls from more than one thread to this
function. To call the Unicode version of this function, define
DBGHELP_TRANSLATE_TCHAR. SymGetLineFromAddrW64 is defined as follows
in Dbghelp.h.
This doc was truncated.


%index
SymGetLineFromInlineContext
The SymGetLineFromInlineContext function (dbghelp.h) locates the source line for the specified inline context.
%group
Win32 dbghelp
%prm
hProcess, qwAddr, InlineContext, qwModuleBaseAddress, pdwDisplacement, Line64
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
qwAddr : [int64] The address for which a line should be located. It is not necessary for the address to be on a line boundary. If the address appears after the beginning of a line and before the end of the line, the line is found.
InlineContext : [int] The inline context.
qwModuleBaseAddress : [int64] The base address of the module.
pdwDisplacement : [var] The displacement in bytes from the beginning of the line, or zero.
Line64 : [var] A pointer to an IMAGEHLP_LINE64 structure.
%inst
The SymGetLineFromInlineContext function (dbghelp.h) locates the
source line for the specified inline context.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
The caller must allocate the Line buffer properly and fill in the
required members of the IMAGEHLP_LINE64 structure before calling
SymGetLineFromInlineContext. This function returns a pointer to a
buffer that may be reused by another function. Therefore, be sure to
copy the data returned to another buffer immediately. All DbgHelp
functions, such as this one, are single threaded. Therefore, calls
from more than one thread to this function will likely result in
unexpected behavior or memory corruption. To avoid this, you must
synchronize all concurrent calls from more than one thread to this
function. To call the Unicode version of this function, define
DBGHELP_TRANSLATE_TCHAR. SymGetLineFromInlineContext is defined as
follows in Dbghelp.h.
This doc was truncated.


%index
SymGetLineFromName64
Locates a source line for the specified module, file name, and line number. (SymGetLineFromName64)
%group
Win32 dbghelp
%prm
hProcess, ModuleName, FileName, dwLineNumber, plDisplacement, Line
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
ModuleName : [str] The name of the module in which a line is to be located.
FileName : [str] The name of the file in which a line is to be located. If the application has more than one source file with this name, be sure to specify a full path.
dwLineNumber : [int] The line number to be located.
plDisplacement : [var] The displacement in bytes from the beginning of the line, or zero.
Line : [var] A pointer to an IMAGEHLP_LINE64 structure.
%inst
Locates a source line for the specified module, file name, and line
number. (SymGetLineFromName64)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
The caller must allocate the Line buffer properly and fill in the
required members of the IMAGEHLP_LINE64 structure before calling
SymGetLineFromName64. Before calling this function, ensure that the
symbols are initialized correctly by first calling SymInitialize,
SymSetOptions, and SymLoadModule64. This function returns a pointer
to a buffer that may be reused by another function. Therefore, be
sure to copy the data returned to another buffer immediately. All
DbgHelp functions, such as this one, are single threaded. Therefore,
calls from more than one thread to this function will likely result
in unexpected behavior or memory corruption. To avoid this, you must
synchronize all concurrent calls from more than one thread to this
function. To call the Unicode version of this function, define
DBGHELP_TRANSLATE_TCHAR. SymGetLineFromNameW64 is defined as follows
in Dbghelp.h.
This doc was truncated.


%index
SymGetLineFromNameW64
Locates a source line for the specified module, file name, and line number. (SymGetLineFromNameW64)
%group
Win32 dbghelp
%prm
hProcess, ModuleName, FileName, dwLineNumber, plDisplacement, Line
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
ModuleName : [wstr] The name of the module in which a line is to be located.
FileName : [wstr] The name of the file in which a line is to be located. If the application has more than one source file with this name, be sure to specify a full path.
dwLineNumber : [int] The line number to be located.
plDisplacement : [var] The displacement in bytes from the beginning of the line, or zero.
Line : [var] A pointer to an IMAGEHLP_LINE64 structure.
%inst
Locates a source line for the specified module, file name, and line
number. (SymGetLineFromNameW64)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
The caller must allocate the Line buffer properly and fill in the
required members of the IMAGEHLP_LINE64 structure before calling
SymGetLineFromName64. Before calling this function, ensure that the
symbols are initialized correctly by first calling SymInitialize,
SymSetOptions, and SymLoadModule64. This function returns a pointer
to a buffer that may be reused by another function. Therefore, be
sure to copy the data returned to another buffer immediately. All
DbgHelp functions, such as this one, are single threaded. Therefore,
calls from more than one thread to this function will likely result
in unexpected behavior or memory corruption. To avoid this, you must
synchronize all concurrent calls from more than one thread to this
function. To call the Unicode version of this function, define
DBGHELP_TRANSLATE_TCHAR. SymGetLineFromNameW64 is defined as follows
in Dbghelp.h.
This doc was truncated.


%index
SymGetLineNext64
Retrieves the line information for the next source line. (SymGetLineNext64)
%group
Win32 dbghelp
%prm
hProcess, Line
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
Line : [var] A pointer to an IMAGEHLP_LINE64 structure that contains the line information.
%inst
Retrieves the line information for the next source line.
(SymGetLineNext64)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
The SymGetLineNext64 function requires that the IMAGEHLP_LINE64
structure have valid data, presumably obtained from a call to the
SymGetLineFromAddr64 or SymGetLineFromName64 function. This structure
receives the line information for the next line in sequence. This
function returns a pointer to a buffer that may be reused by another
function. Therefore, be sure to copy the data returned to another
buffer immediately. All DbgHelp functions, such as this one, are
single threaded. Therefore, calls from more than one thread to this
function will likely result in unexpected behavior or memory
corruption. To avoid this, you must synchronize all concurrent calls
from more than one thread to this function. To call the Unicode
version of this function, define DBGHELP_TRANSLATE_TCHAR.
SymGetLineNextW64 is defined as follows in Dbghelp.h.
This doc was truncated.


%index
SymGetLineNextW64
Retrieves the line information for the next source line. (SymGetLineNextW64)
%group
Win32 dbghelp
%prm
hProcess, Line
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
Line : [var] A pointer to an IMAGEHLP_LINE64 structure that contains the line information.
%inst
Retrieves the line information for the next source line.
(SymGetLineNextW64)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
The SymGetLineNext64 function requires that the IMAGEHLP_LINE64
structure have valid data, presumably obtained from a call to the
SymGetLineFromAddr64 or SymGetLineFromName64 function. This structure
receives the line information for the next line in sequence. This
function returns a pointer to a buffer that may be reused by another
function. Therefore, be sure to copy the data returned to another
buffer immediately. All DbgHelp functions, such as this one, are
single threaded. Therefore, calls from more than one thread to this
function will likely result in unexpected behavior or memory
corruption. To avoid this, you must synchronize all concurrent calls
from more than one thread to this function. To call the Unicode
version of this function, define DBGHELP_TRANSLATE_TCHAR.
SymGetLineNextW64 is defined as follows in Dbghelp.h.
This doc was truncated.


%index
SymGetLinePrev64
Retrieves the line information for the previous source line. (SymGetLinePrev64)
%group
Win32 dbghelp
%prm
hProcess, Line
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
Line : [var] A pointer to an IMAGEHLP_LINE64 structure.
%inst
Retrieves the line information for the previous source line.
(SymGetLinePrev64)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
The SymGetLinePrev64 function requires that the IMAGEHLP_LINE64
structure have valid data, presumably obtained from a call to the
SymGetLineFromAddr64 or SymGetLineFromName64 function. This structure
is filled with the line information for the previous line in
sequence. This function returns a pointer to a buffer that may be
reused by another function. Therefore, be sure to copy the data
returned to another buffer immediately. All DbgHelp functions, such
as this one, are single threaded. Therefore, calls from more than one
thread to this function will likely result in unexpected behavior or
memory corruption. To avoid this, you must synchronize all concurrent
calls from more than one thread to this function. To call the Unicode
version of this function, define DBGHELP_TRANSLATE_TCHAR.
SymGetLinePrevW64 is defined as follows in DbgHelp.h.
This doc was truncated.


%index
SymGetLinePrevW64
Retrieves the line information for the previous source line. (SymGetLinePrevW64)
%group
Win32 dbghelp
%prm
hProcess, Line
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
Line : [var] A pointer to an IMAGEHLP_LINE64 structure.
%inst
Retrieves the line information for the previous source line.
(SymGetLinePrevW64)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
The SymGetLinePrev64 function requires that the IMAGEHLP_LINE64
structure have valid data, presumably obtained from a call to the
SymGetLineFromAddr64 or SymGetLineFromName64 function. This structure
is filled with the line information for the previous line in
sequence. This function returns a pointer to a buffer that may be
reused by another function. Therefore, be sure to copy the data
returned to another buffer immediately. All DbgHelp functions, such
as this one, are single threaded. Therefore, calls from more than one
thread to this function will likely result in unexpected behavior or
memory corruption. To avoid this, you must synchronize all concurrent
calls from more than one thread to this function. To call the Unicode
version of this function, define DBGHELP_TRANSLATE_TCHAR.
SymGetLinePrevW64 is defined as follows in DbgHelp.h.
This doc was truncated.


%index
SymGetModuleBase64
Retrieves the base address of the module that contains the specified address. (SymGetModuleBase64)
%group
Win32 dbghelp
%prm
hProcess, qwAddr
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
qwAddr : [int64] The virtual address that is contained in one of the modules loaded by the SymLoadModule64 function.
%inst
Retrieves the base address of the module that contains the specified
address. (SymGetModuleBase64)

[戻り値]
If the function succeeds, the return value is a nonzero virtual
address. The value is the base address of the module containing the
address specified by the dwAddr parameter. If the function fails, the
return value is zero. To retrieve extended error information, call
GetLastError.

[備考]
The module table is searched for a module that contains dwAddr. The
module is located based on the load address and size of each module.
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function. This function supersedes the
SymGetModuleBase function. For more information, see Updated Platform
Support. SymGetModuleBase is defined as follows in DbgHelp.h.
This doc was truncated.


%index
SymGetModuleInfo64
Retrieves the module information of the specified module. (SymGetModuleInfo64)
%group
Win32 dbghelp
%prm
hProcess, qwAddr, ModuleInfo
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
qwAddr : [int64] The virtual address that is contained in one of the modules loaded by the SymLoadModule64 function.
ModuleInfo : [var] A pointer to an IMAGEHLP_MODULE64 structure. The SizeOfStruct member must be set to the size of the IMAGEHLP_MODULE64 structure. An invalid value will result in an error.
%inst
Retrieves the module information of the specified module.
(SymGetModuleInfo64)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
The module table is searched for a module that contains the dwAddr.
The module is located based on the load address and size of each
module. If a valid module is found, the ModuleInfo parameter is
filled with the information about the module. The size of the
IMAGEHLP_MODULE64 structure used by this function has changed over
the years. If a version of DbgHelp.dll is called that is older than
the DbgHelp.h used to compile the calling code, then this function
may fail with an error code of ERROR_INVALID_PARAMETER. This most
commonly occurs when the system version
(%WinDir%\System32\DbgHelp.dll) is called. Code that calls the system
version of DbgHelp.dll must be compiled using the appropriate SDK for
that Windows release or the SDK for a previous release. The
recommended model is to redistribute the required version of
DbgHelp.dll along with the calling software. This allows the caller
to use the most robust versions of DbgHelp.dll as well as a
simplifying upgrades. The most recent version of DbgHelp.dll can
always be found in the Debugging Tools for Windows package. As a
general rule, code that is compiled to work with older versions will
always work with newer versions. All DbgHelp functions, such as this
one, are single threaded. Therefore, calls from more than one thread
to this function will likely result in unexpected behavior or memory
corruption. To avoid this, you must synchronize all concurrent calls
from more than one thread to this function. To call the Unicode
version of this function, define DBGHELP_TRANSLATE_TCHAR.
SymGetModuleInfoW64 is defined as follows in DbgHelp.h.
This doc was truncated.


%index
SymGetModuleInfoW64
Retrieves the module information of the specified module. (SymGetModuleInfoW64)
%group
Win32 dbghelp
%prm
hProcess, qwAddr, ModuleInfo
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
qwAddr : [int64] The virtual address that is contained in one of the modules loaded by the SymLoadModule64 function.
ModuleInfo : [var] A pointer to an IMAGEHLP_MODULEW64 structure. The SizeOfStruct member must be set to the size of the IMAGEHLP_MODULEW64 structure. An invalid value will result in an error.
%inst
Retrieves the module information of the specified module.
(SymGetModuleInfoW64)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
The module table is searched for a module that contains the dwAddr.
The module is located based on the load address and size of each
module. If a valid module is found, the ModuleInfo parameter is
filled with the information about the module. The size of the
IMAGEHLP_MODULEW64 structure used by this function has changed over
the years. If a version of DbgHelp.dll is called that is older than
the DbgHelp.h used to compile the calling code, then this function
may fail with an error code of ERROR_INVALID_PARAMETER. This most
commonly occurs when the system version
(%WinDir%\System32\DbgHelp.dll) is called. Code that calls the system
version of DbgHelp.dll must be compiled using the appropriate SDK for
that Windows release or the SDK for a previous release. The
recommended model is to redistribute the required version of
DbgHelp.dll along with the calling software. This allows the caller
to use the most robust versions of DbgHelp.dll as well as a
simplifying upgrades. The most recent version of DbgHelp.dll can
always be found in the Debugging Tools for Windows package. As a
general rule, code that is compiled to work with older versions will
always work with newer versions. All DbgHelp functions, such as this
one, are single threaded. Therefore, calls from more than one thread
to this function will likely result in unexpected behavior or memory
corruption. To avoid this, you must synchronize all concurrent calls
from more than one thread to this function. To call the Unicode
version of this function, define DBGHELP_TRANSLATE_TCHAR.
SymGetModuleInfoW64 is defined as follows in DbgHelp.h.
This doc was truncated.


%index
SymGetOmaps
Retrieves the omap tables within a loaded module.
%group
Win32 dbghelp
%prm
hProcess, BaseOfDll, OmapTo, cOmapTo, OmapFrom, cOmapFrom
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
BaseOfDll : [int64] The base address of the module.
OmapTo : [var] An array of address map entries to the new image layout taken from the original layout. For details on the map entries, see the OMAP structure.
cOmapTo : [var] The number of entries in the OmapTo array.
OmapFrom : [var] An array of address map entries from the new image layout to the original layout (as described by the debug symbols). For details on the map entries, see the OMAP structure.
cOmapFrom : [var] The number of entries in the OmapFrom array.
%inst
Retrieves the omap tables within a loaded module.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails (the omap is not found), the return value is FALSE. To retrieve
extended error information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function.


%index
SymGetOptions
Retrieves the current option mask.
%group
Win32 dbghelp
%prm

%inst
Retrieves the current option mask.

[戻り値]
The function returns the current options that have been set. Zero is
a valid value and indicates that all options are turned off.

[備考]
These options can be changed several times while the library is in
use by an application. Any option change affects all future calls to
the symbol handler. The return value is the combination of the
following values that have been set using the SymSetOptions function.
This doc was truncated.


%index
SymGetScope
The SymGetScope function (dbghelp.h) retrieves the scope for the specified index.
%group
Win32 dbghelp
%prm
hProcess, BaseOfDll, Index, Symbol
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
BaseOfDll : [int64] The base address of the module.
Index : [int] A unique value for the symbol.
Symbol : [var] A pointer to a SYMBOL_INFO structure. The Scope member contains the scope.
%inst
The SymGetScope function (dbghelp.h) retrieves the scope for the
specified index.

[戻り値]
If the function succeeds, the return value is TRUE.
If the function fails, the return value is FALSE. To retrieve
extended error information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function.


%index
SymGetSearchPath
The SymGetSearchPath function (dbghelp.h) retrieves the symbol search path for the specified process.
%group
Win32 dbghelp
%prm
hProcess, SearchPathA, SearchPathLength
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
SearchPathA : [str] 
SearchPathLength : [int] The size of the SearchPath buffer, in characters.
%inst
The SymGetSearchPath function (dbghelp.h) retrieves the symbol search
path for the specified process.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
The SymGetSearchPath function copies the symbol search path for the
specified process into the SearchPath buffer. If the function fails,
the contents of the buffer are undefined. To specify a symbol search
path for the process, use the SymSetSearchPath function. All DbgHelp
functions, such as this one, are single threaded. Therefore, calls
from more than one thread to this function will likely result in
unexpected behavior or memory corruption. To avoid this, you must
synchronize all concurrent calls from more than one thread to this
function. To call the Unicode version of this function, define
DBGHELP_TRANSLATE_TCHAR.


%index
SymGetSourceFile
The SymGetSourceFile function (dbghelp.h) retrieves the specified source file from the source server.
%group
Win32 dbghelp
%prm
hProcess, Base, Params, FileSpec, FilePath, Size
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
Base : [int64] The base address of the module.
Params : [str] This parameter is unused.
FileSpec : [str] The name of the source file.
FilePath : [str] A pointer to a buffer that receives the fully qualified path of the source file.
Size : [int] The size of the FilePath buffer, in characters.
%inst
The SymGetSourceFile function (dbghelp.h) retrieves the specified
source file from the source server.

[戻り値]
If the function succeeds, the return value is TRUE.
If the function fails, the return value is FALSE. To retrieve
extended error information, call GetLastError.

[備考]
To control which directory receives the source files, use the
SymSetHomeDirectory function. All DbgHelp functions, such as this
one, are single threaded. Therefore, calls from more than one thread
to this function will likely result in unexpected behavior or memory
corruption. To avoid this, you must synchronize all concurrent calls
from more than one thread to this function. To call the Unicode
version of this function, define DBGHELP_TRANSLATE_TCHAR.


%index
SymGetSourceFileChecksum
The SymGetSourceFileChecksum function (dbghelp.h) retrieves the specified source file checksum from the source server.
%group
Win32 dbghelp
%prm
hProcess, Base, FileSpec, pCheckSumType, pChecksum, checksumSize, pActualBytesWritten
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
Base : [int64] The base address of the module.
FileSpec : [str] The name of the source file.
pCheckSumType : [var] On success, points to the checksum type.
pChecksum : [var] pointer to a buffer that receives the checksum. If NULL, then when the call returns pActualBytesWritten returns the number of bytes required.
checksumSize : [int] The size of the pChecksum buffer, in bytes.
pActualBytesWritten : [var] Pointer to the actual bytes written in the buffer.
%inst
The SymGetSourceFileChecksum function (dbghelp.h) retrieves the
specified source file checksum from the source server.

[戻り値]
If the function succeeds, the return value is TRUE.
If the function fails, the return value is FALSE. To retrieve
extended error information, call GetLastError.


%index
SymGetSourceFileFromToken
The SymGetSourceFileFromToken function (dbghelp.h) retrieves the source file associated with the specified token from the source server.
%group
Win32 dbghelp
%prm
hProcess, Token, Params, FilePath, Size
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
Token : [intptr] A pointer to the token.
Params : [str] This parameter is unused.
FilePath : [str] A pointer to a buffer that receives the fully qualified path of the source file.
Size : [int] The size of the FilePath buffer, in characters.
%inst
The SymGetSourceFileFromToken function (dbghelp.h) retrieves the
source file associated with the specified token from the source
server.

[戻り値]
If the function succeeds, the return value is TRUE.
If the function fails, the return value is FALSE. To retrieve
extended error information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function. To call the Unicode version of this
function, define DBGHELP_TRANSLATE_TCHAR.


%index
SymGetSourceFileToken
The SymGetSourceFileToken function (dbghelp.h) retrieves token for the specified source file from the source server.
%group
Win32 dbghelp
%prm
hProcess, Base, FileSpec, Token, Size
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
Base : [int64] The base address of the module.
FileSpec : [str] The name of the source file.
Token : [var] A pointer to a buffer that receives the token.
Size : [var] The size of the Token buffer, in bytes.
%inst
The SymGetSourceFileToken function (dbghelp.h) retrieves token for
the specified source file from the source server.

[戻り値]
If the function succeeds, the return value is TRUE.
If the function fails, the return value is FALSE. To retrieve
extended error information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function. To call the Unicode version of this
function, define DBGHELP_TRANSLATE_TCHAR.


%index
SymGetSourceVarFromToken
The SymGetSourceVarFromToken function (dbghelp.h) retrieves the value associated with the specified variable name from the Source Server token.
%group
Win32 dbghelp
%prm
hProcess, Token, Params, VarName, Value, Size
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
Token : [intptr] A pointer to the token.
Params : [str] This parameter is unused.
VarName : [str] The name of the variable token whose value you want to retrieve.
Value : [str] A pointer to a buffer that receives the value associated with the variable token specified in the VarName parameter.
Size : [int] The size of the Value buffer, in characters.
%inst
The SymGetSourceVarFromToken function (dbghelp.h) retrieves the value
associated with the specified variable name from the Source Server
token.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function. To call the Unicode version of this
function, define DBGHELP_TRANSLATE_TCHAR.


%index
SymGetSymFromAddr64
Locates the symbol for the specified address. (SymGetSymFromAddr64)
%group
Win32 dbghelp
%prm
hProcess, qwAddr, pdwDisplacement, Symbol
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
qwAddr : [int64] The address for which a symbol is to be located. The address does not have to be on a symbol boundary. If the address comes after the beginning of a symbol and before the end of the symbol (the beginning of the symbol plus the symbol size), the symbol is found.
pdwDisplacement : [var] The displacement from the beginning of the symbol, or zero.
Symbol : [var] A pointer to an IMAGEHLP_SYMBOL64 structure.
%inst
Locates the symbol for the specified address. (SymGetSymFromAddr64)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
The SymGetSymFromAddr64 function locates the symbol for a specified
address. The modules are searched for the one the address belongs to.
When the module is found, its symbol table is searched for a match.
When the symbol is found, the symbol information is copied into the
Symbol buffer provided by the caller. The caller must allocate the
Symbol buffer properly and fill in the required parameters in the
IMAGEHLP_SYMBOL64 structure before calling SymGetSymFromAddr64. All
DbgHelp functions, such as this one, are single threaded. Therefore,
calls from more than one thread to this function will likely result
in unexpected behavior or memory corruption. To avoid this, you must
synchronize all concurrent calls from more than one thread to this
function. This function supersedes the SymGetSymFromAddr function.
For more information, see Updated Platform Support. SymGetSymFromAddr
is defined as follows in Dbghelp.h.
This doc was truncated.


%index
SymGetSymFromName64
Locates a symbol for the specified name. (SymGetSymFromName64)
%group
Win32 dbghelp
%prm
hProcess, Name, Symbol
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
Name : [str] The symbol name for which a symbol is to be located.
Symbol : [var] A pointer to an IMAGEHLP_SYMBOL64 structure.
%inst
Locates a symbol for the specified name. (SymGetSymFromName64)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
The SymGetSymFromName64 function is used to locate a symbol for a
specified name. The name can contain a module prefix that isolates
the symbol search to a single module's symbol table. The module
prefix is in the form of "module!". The "!" character is the
delimiter between the module name and the symbol name. If there is no
module prefix, then the search is performed on each module's symbol
table in a linear manner, beginning with the first module that is
loaded. Using the module prefix is preferable for two reasons. First,
the symbol search occurs much faster. Second, when deferred symbol
loading is turned on, the search causes symbols to be loaded for each
module that is searched. When the symbol is found, the symbol
information is copied into the Symbol buffer provided by the caller.
The caller must allocate the Symbol buffer properly and fill in the
required parameters in the IMAGEHLP_SYMBOL64 structure before calling
SymGetSymFromName64. All DbgHelp functions, such as this one, are
single threaded. Therefore, calls from more than one thread to this
function will likely result in unexpected behavior or memory
corruption. To avoid this, you must synchronize all concurrent calls
from more than one thread to this function. This function supersedes
the SymGetSymFromName function. For more information, see Updated
Platform Support. SymGetSymFromName is defined as follows in
Dbghelp.h.
This doc was truncated.


%index
SymGetSymNext64
Retrieves the symbol information for the next symbol. (SymGetSymNext64)
%group
Win32 dbghelp
%prm
hProcess, Symbol
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
Symbol : [var] A pointer to an IMAGEHLP_SYMBOL64 structure.
%inst
Retrieves the symbol information for the next symbol.
(SymGetSymNext64)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
The SymGetSymNext64 function requires that the IMAGEHLP_SYMBOL64
structure have valid data, presumably obtained from a call to the
SymGetSymFromAddr64 or SymGetSymFromName64 function. This structure
is filled with the symbol information for the next symbol in sequence
by virtual address. All DbgHelp functions, such as this one, are
single threaded. Therefore, calls from more than one thread to this
function will likely result in unexpected behavior or memory
corruption. To avoid this, you must synchronize all concurrent calls
from more than one thread to this function. To call the Unicode
version of this function, define DBGHELP_TRANSLATE_TCHAR.
SymGetSymNextW64 is defined as follows in DbgHelp.h.
This doc was truncated.


%index
SymGetSymPrev64
Retrieves the symbol information for the previous symbol. (SymGetSymPrev64)
%group
Win32 dbghelp
%prm
hProcess, Symbol
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
Symbol : [var] A pointer to an IMAGEHLP_SYMBOL64 structure.
%inst
Retrieves the symbol information for the previous symbol.
(SymGetSymPrev64)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
The SymGetSymPrev64 function requires the IMAGEHLP_SYMBOL64 structure
to have valid data, presumably obtained from a call to the
SymGetSymFromAddr64 or SymGetSymFromName64 function. This structure
is filled in with the symbol information for the previous symbol in
sequence by virtual address. All DbgHelp functions, such as this one,
are single threaded. Therefore, calls from more than one thread to
this function will likely result in unexpected behavior or memory
corruption. To avoid this, you must synchronize all concurrent calls
from more than one thread to this function. To call the Unicode
version of this function, define DBGHELP_TRANSLATE_TCHAR.
SymGetSymPrevW64 is defined as follows in DbgHelp.h.
This doc was truncated.


%index
SymGetSymbolFile
The SymGetSymbolFile function (dbghelp.h) locates a symbol file in the specified symbol path.
%group
Win32 dbghelp
%prm
hProcess, SymPath, ImageFile, Type, SymbolFile, cSymbolFile, DbgFile, cDbgFile
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function. If this handle is 0, SymPath cannot be NULL. Use this option to load a symbol file without calling SymInitialize or SymCleanup.
SymPath : [str] The symbol path. If this parameter is NULL or an empty string, the function uses the symbol path set using the SymInitialize or SymSetSearchPath function.
ImageFile : [str] The name of the image  file.
Type : [int] 
SymbolFile : [str] A pointer to a null-terminated string that receives the name of the symbol file.
cSymbolFile : [int] The size of the SymbolFile buffer, in characters.
DbgFile : [str] A pointer to a buffer that receives the fully qualified path to the symbol file. This buffer must be at least MAX_PATH characters.
cDbgFile : [int] The size of the DbgFile buffer, in characters.
%inst
The SymGetSymbolFile function (dbghelp.h) locates a symbol file in
the specified symbol path.

[戻り値]
If the server locates a valid symbol file, it returns TRUE;
otherwise, it returns FALSE and GetLastError returns a value that
indicates why the symbol file was not returned.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function. To call the Unicode version of this
function, define DBGHELP_TRANSLATE_TCHAR.


%index
SymGetTypeFromName
The SymGetTypeFromName function (dbghelp.h) retrieves a type index for the specified type name.
%group
Win32 dbghelp
%prm
hProcess, BaseOfDll, Name, Symbol
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
BaseOfDll : [int64] The base address of the module.
Name : [str] The name of the type.
Symbol : [var] A pointer to a SYMBOL_INFO structure. The TypeIndex member contains the type index.
%inst
The SymGetTypeFromName function (dbghelp.h) retrieves a type index
for the specified type name.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
To retrieve information about the type, pass the type index to the
SymGetTypeInfo function. All DbgHelp functions, such as this one, are
single threaded. Therefore, calls from more than one thread to this
function will likely result in unexpected behavior or memory
corruption. To avoid this, you must synchronize all concurrent calls
from more than one thread to this function. To call the Unicode
version of this function, define DBGHELP_TRANSLATE_TCHAR.


%index
SymGetTypeInfo
Retrieves type information for the specified type index.
%group
Win32 dbghelp
%prm
hProcess, ModBase, TypeId, GetType, pInfo
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
ModBase : [int64] The base address of the module.
TypeId : [int] The type index. (A number of functions return a type index in the TypeIndex member of the SYMBOL_INFO structure.)
GetType : [int] The information type. This parameter can be one of more of the values from the IMAGEHLP_SYMBOL_TYPE_INFO enumeration type.
pInfo : [intptr] The data. The format of the data depends on the value of the GetType parameter.
%inst
Retrieves type information for the specified type index.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
For more details on the type information, see the documentation for
the PDB format. All DbgHelp functions, such as this one, are single
threaded. Therefore, calls from more than one thread to this function
will likely result in unexpected behavior or memory corruption. To
avoid this, you must synchronize all concurrent calls from more than
one thread to this function.


%index
SymGetTypeInfoEx
Retrieves multiple pieces of type information.
%group
Win32 dbghelp
%prm
hProcess, ModBase, Params
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
ModBase : [int64] The base address of the module.
Params : [var] A pointer to an IMAGEHLP_GET_TYPE_INFO_PARAMS structure that specifies input and output information for the query.
%inst
Retrieves multiple pieces of type information.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function.


%index
SymGetUnwindInfo
(no summary)
%group
Win32 dbghelp
%prm
hProcess, Address, Buffer, Size
hProcess : [intptr] 
Address : [int64] 
Buffer : [intptr] 
Size : [var] 
%inst



%index
SymInitialize
SymInitialize 関数 (dbghelp.h) はプロセスのシンボルハンドラを初期化する。
%group
Win32 dbghelp
%prm
hProcess, UserSearchPath, fInvadeProcess
hProcess : [intptr] 呼び出し元を識別するハンドル。一意で 0 以外であればよく、必ずしもプロセスハンドルである必要はない。プロセスハンドルを使う場合は正しいものを渡すこと。デバッガであればデバッグ対象プロセスのハンドルを使うこと。GetCurrentProcess で得たハンドルは使わないこと。複数コンポーネントが同時に dbghelp を使っているときに予期しない結果を招く可能性がある。NULL は不可。
UserSearchPath : [str] シンボルファイル検索用のパス。複数パスはセミコロン (;) で区切る。NULL を渡すと以下のソースからシンボルパスを構築しようとする:
fInvadeProcess : [int] TRUE の場合、プロセス内のロード済みモジュールを列挙して各モジュールに対して実質的に SymLoadModule64 を呼び出す。
%inst
SymInitialize 関数 (dbghelp.h) はプロセスのシンボルハンドラを初期化する。

[戻り値]
成功時は TRUE、失敗時は FALSE を返す。拡張エラー情報は GetLastError で取得する。

[備考]
SymInitialize はプロセスのシンボルハンドラを初期化する。SymInitialize
に渡すハンドルは、そのプロセスで呼び出す他のシンボルハンドラ関数すべてに同じ値を渡す必要がある。使用後は SymCleanup
を呼んで関連リソースを解放すること。UserSearchPath
に指定したパスに対してはサブディレクトリまで再帰的に検索されるため、ルートを指定するとドライブ全体を検索することになり時間がかかる。プロセス実行可能ファイルのあるディレクトリは自動的には検索パスに含まれない。含めたい場合は
GetModuleFileNameEx を呼んでパスを取得し UserSearchPath に追加する。SymInitialize
を再度呼ぶ前に必ず SymCleanup を呼ぶこと。fInvadeProcess が TRUE
の呼び出しでモジュール一覧を再ロードしたい場合は SymRefreshModuleList を使用する。DbgHelp
の関数は単一スレッドで動作する。Unicode 版を使うには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymLoadModule64
Loads the symbol table. (SymLoadModule64)
%group
Win32 dbghelp
%prm
hProcess, hFile, ImageName, ModuleName, BaseOfDll, SizeOfDll
hProcess : [intptr] A handle to the process. This handle must have been previously passed to the SymInitialize function.
hFile : [intptr] A handle to the file for the executable image. This argument is used mostly by debuggers, where the debugger passes the file handle obtained from a debugging event. A value of NULL indicates that hFile is not used.
ImageName : [str] The name of the executable image. This name can contain a partial path, a full path, or no path at all. If the file cannot be located by the name provided, the symbol search path is used.
ModuleName : [str] A shortcut name for the module. If the pointer value is NULL, the library creates a name using the base name of the symbol file.
BaseOfDll : [int64] The load address of the module. If the value is zero, the library obtains the load address from the symbol file. The load address contained in the symbol file is not necessarily the actual load address. Debuggers and other applications having an actual load address should use the real load address when calling this function. If the image is a .pdb file, this parameter cannot be zero.
SizeOfDll : [int] The size of the module, in bytes. If the value is zero, the library obtains the size from the symbol file. The size contained in the symbol file is not necessarily the actual size. Debuggers and other applications having an actual size should use the real size when calling this function. If the image is a .pdb file, this parameter cannot be zero.
%inst
Loads the symbol table. (SymLoadModule64)

[戻り値]
If the function succeeds, the return value is the base address of the
loaded module. If the function fails, the return value is zero. To
retrieve extended error information, call GetLastError. If the module
is already loaded, the return value is zero and GetLastError returns
ERROR_SUCCESS.

[備考]
The symbol handler creates an entry for the module and if the
deferred symbol loading option is turned off, an attempt is made to
load the symbols. If deferred symbol loading is enabled, the module
is marked as deferred and the symbols are not loaded until a
reference is made to a symbol in the module. To unload the symbol
table, use the SymUnloadModule64 function. All DbgHelp functions,
such as this one, are single threaded. Therefore, calls from more
than one thread to this function will likely result in unexpected
behavior or memory corruption. To avoid this, you must synchronize
all concurrent calls from more than one thread to this function. This
function supersedes the SymLoadModule function. For more information,
see Updated Platform Support. SymLoadModule is defined as follows in
DbgHelp.h.
This doc was truncated.


%index
SymLoadModuleEx
The SymLoadModuleEx function (dbghelp.h) loads the symbol table for the specified module.
%group
Win32 dbghelp
%prm
hProcess, hFile, ImageName, ModuleName, BaseOfDll, DllSize, Data, Flags
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
hFile : [intptr] A handle to the file for the executable image. This argument is used mostly by debuggers, where the debugger passes the file handle obtained from a debugging event. A value of NULL indicates that hFile is not used.
ImageName : [str] The name of the executable image. This name can contain a partial path, a full path, or no path at all. If the file cannot be located by the name provided, the symbol search path is used.
ModuleName : [str] A shortcut name for the module. If the pointer value is NULL, the library creates a name using the base name of the symbol file.
BaseOfDll : [int64] The load address of the module. If the value is zero, the library obtains the load address from the symbol file. The load address contained in the symbol file is not necessarily the actual load address. Debuggers and other applications having an actual load address should use the real load address when calling this function. If the image is a .pdb file, this parameter cannot be zero.
DllSize : [int] The size of the module, in bytes. If the value is zero, the library obtains the size from the symbol file. The size contained in the symbol file is not necessarily the actual size. Debuggers and other applications having an actual size should use the real size when calling this function. If the image is a .pdb file, this parameter cannot be zero.
Data : [var] A pointer to a MODLOAD_DATA structure that represents headers other than the standard PE header. This parameter is optional and can be NULL.
Flags : [int] 
%inst
The SymLoadModuleEx function (dbghelp.h) loads the symbol table for
the specified module.

[戻り値]
If the function succeeds, the return value is the base address of the
loaded module. If the function fails, the return value is zero. To
retrieve extended error information, call GetLastError. If the module
is already loaded, the return value is zero and GetLastError returns
ERROR_SUCCESS.

[備考]
The symbol handler creates an entry for the module and if the
deferred symbol loading option is turned off, an attempt is made to
load the symbols. If deferred symbol loading is enabled, the module
is marked as deferred and the symbols are not loaded until a
reference is made to a symbol in the module. Therefore, you should
always call the SymGetModuleInfo64 function after calling
SymLoadModuleEx. To unload the symbol table, use the
SymUnloadModule64 function. All DbgHelp functions, such as this one,
are single threaded. Therefore, calls from more than one thread to
this function will likely result in unexpected behavior or memory
corruption. To avoid this, you must synchronize all concurrent calls
from more than one thread to this function. To call the Unicode
version of this function, define DBGHELP_TRANSLATE_TCHAR.


%index
SymMatchFileName
The SymMatchFileName function (dbghelp.h) compares a string to a file name and path.
%group
Win32 dbghelp
%prm
FileName, Match, FileNameStop, MatchStop
FileName : [str] The file name to be compared to the Match parameter.
Match : [str] The string to be compared to the FileName parameter.
FileNameStop : [var] A pointer to a string buffer that receives a pointer to the location in FileName where matching stopped. For a complete match, this value can be one character before FileName. This value can also be NULL.
MatchStop : [var] A pointer to a string buffer that receives a pointer to the location in Match where matching stopped. For a complete match, this value may be one character before Match. This value may be NULL.
%inst
The SymMatchFileName function (dbghelp.h) compares a string to a file
name and path.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
Because the match string can be a suffix of the complete file name,
this function can be used to match a plain file name to a fully
qualified file name. Matching begins from the end of both strings and
proceeds backward. Matching is case-insensitive and equates a
backslash (\\) with a forward slash (/). All DbgHelp functions, such
as this one, are single threaded. Therefore, calls from more than one
thread to this function will likely result in unexpected behavior or
memory corruption. To avoid this, you must synchronize all concurrent
calls from more than one thread to this function. To call the Unicode
version of this function, define DBGHELP_TRANSLATE_TCHAR.


%index
SymMatchString
The SymMatchString function (dbghelp.h) compares the specified string to the specified wildcard expression.
%group
Win32 dbghelp
%prm
string, expression, fCase
string : [int] 
expression : [str] The wildcard expression to compare to the string parameter.  The wildcard expression supports the inclusion of the * and ? characters.  * matches any string and ? matches any single character.
fCase : [int] A variable that indicates whether or not the comparison is to be case sensitive.
%inst
The SymMatchString function (dbghelp.h) compares the specified string
to the specified wildcard expression.

[戻り値]
If the function succeeds, the return value is TRUE.
If the function fails, the return value is FALSE. To retrieve
extended error information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function.


%index
SymNext
The SymNext function (dbghelp.h) retrieves symbol information for the next symbol.
%group
Win32 dbghelp
%prm
hProcess, si
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
si : [var] A pointer to a SYMBOL_INFO structure that provides information about the current symbol. Upon return, the structure contains information about the next symbol.
%inst
The SymNext function (dbghelp.h) retrieves symbol information for the
next symbol.

[戻り値]
If the function succeeds, the return value is TRUE.
If the function fails, the return value is FALSE. To retrieve
extended error information, call GetLastError.

[備考]
This function requires that the SYMBOL_INFO structure have valid data
for the current symbol. The next symbol is the symbol with the
virtual address that is next in the sequence. All DbgHelp functions,
such as this one, are single threaded. Therefore, calls from more
than one thread to this function will likely result in unexpected
behavior or memory corruption. To avoid this, you must synchronize
all concurrent calls from more than one thread to this function. To
call the Unicode version of this function, define
DBGHELP_TRANSLATE_TCHAR.


%index
SymPrev
The SymPrev function (dbghelp.h) retrieves symbol information for the previous symbol.
%group
Win32 dbghelp
%prm
hProcess, si
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
si : [var] A pointer to a SYMBOL_INFO structure that provides information about the current symbol. Upon return, the structure contains information about the previous symbol.
%inst
The SymPrev function (dbghelp.h) retrieves symbol information for the
previous symbol.

[戻り値]
If the function succeeds, the return value is TRUE.
If the function fails, the return value is FALSE. To retrieve
extended error information, call GetLastError.

[備考]
This function requires that the SYMBOL_INFO structure have valid data
for the current symbol. The previous symbol is the symbol with a
virtual address that immediately precedes this symbol. All DbgHelp
functions, such as this one, are single threaded. Therefore, calls
from more than one thread to this function will likely result in
unexpected behavior or memory corruption. To avoid this, you must
synchronize all concurrent calls from more than one thread to this
function. To call the Unicode version of this function, define
DBGHELP_TRANSLATE_TCHAR.


%index
SymQueryInlineTrace
Queries an inline trace.
%group
Win32 dbghelp
%prm
hProcess, StartAddress, StartContext, StartRetAddress, CurAddress, CurContext, CurFrameIndex
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
StartAddress : [int64] The start address.
StartContext : [int] Contains the context of the start of block.
StartRetAddress : [int64] Contains the return address of the start of the current block/
CurAddress : [int64] Contains the current address.
CurContext : [var] Address of a DWORD that receives the current context.
CurFrameIndex : [var] If the function succeeds, the return value is TRUE. If the function fails, the return value is FALSE. To retrieve extended error information, call GetLastError.
%inst
Queries an inline trace.

[備考]
Either the StartAddress or StartRetAddress parameters must be within
the same function scope as the CurAddress parameter. The former
indicates a step-over within the same function and the latter
indicates a step-over from StartAddress.


%index
SymRefreshModuleList
Refreshes the module list for the process.
%group
Win32 dbghelp
%prm
hProcess
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
%inst
Refreshes the module list for the process.

[戻り値]
If the function succeeds, the return value is TRUE.
If the function fails, the return value is FALSE. To retrieve
extended error information, call GetLastError.

[備考]
This function enumerates the loaded modules for the process and
effectively calls the SymLoadModule64 function for each module. This
same process is performed by SymInitialize if fInvadeProcess is TRUE.
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function.


%index
SymRegisterCallback64
Registers a callback function for use by the symbol handler. (SymRegisterCallback64)
%group
Win32 dbghelp
%prm
hProcess, CallbackFunction, UserContext
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
CallbackFunction : [int] A SymRegisterCallbackProc64 callback function.
UserContext : [int64] A user-defined value or NULL. This value is simply passed to the callback function. Normally, this parameter is used by an application to pass a pointer to a data structure that lets the callback function establish some context.
%inst
Registers a callback function for use by the symbol handler.
(SymRegisterCallback64)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
The SymRegisterCallback64 function lets an application register a
callback function for use by the symbol handler. The symbol handler
calls the registered callback function when there is status or
progress information for the application. All DbgHelp functions, such
as this one, are single threaded. Therefore, calls from more than one
thread to this function will likely result in unexpected behavior or
memory corruption. To avoid this, you must synchronize all concurrent
calls from more than one thread to this function. To call the Unicode
version of this function, define DBGHELP_TRANSLATE_TCHAR.
SymRegisterCallbackW64 is defined as follows in Dbghelp.h.
This doc was truncated.


%index
SymRegisterCallbackW64
Registers a callback function for use by the symbol handler. (SymRegisterCallbackW64)
%group
Win32 dbghelp
%prm
hProcess, CallbackFunction, UserContext
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
CallbackFunction : [int] A SymRegisterCallbackProc64 callback function.
UserContext : [int64] A user-defined value or NULL. This value is simply passed to the callback function. Normally, this parameter is used by an application to pass a pointer to a data structure that lets the callback function establish some context.
%inst
Registers a callback function for use by the symbol handler.
(SymRegisterCallbackW64)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
The SymRegisterCallback64 function lets an application register a
callback function for use by the symbol handler. The symbol handler
calls the registered callback function when there is status or
progress information for the application. All DbgHelp functions, such
as this one, are single threaded. Therefore, calls from more than one
thread to this function will likely result in unexpected behavior or
memory corruption. To avoid this, you must synchronize all concurrent
calls from more than one thread to this function. To call the Unicode
version of this function, define DBGHELP_TRANSLATE_TCHAR.
SymRegisterCallbackW64 is defined as follows in Dbghelp.h.
This doc was truncated.


%index
SymRegisterFunctionEntryCallback64
Registers a callback function for use by the stack walking procedure on Alpha computers. (SymRegisterFunctionEntryCallback64)
%group
Win32 dbghelp
%prm
hProcess, CallbackFunction, UserContext
hProcess : [intptr] A handle to the process that was originally passed to the StackWalk64 function.
CallbackFunction : [int] A SymRegisterFunctionEntryCallbackProc64 callback function.
UserContext : [int64] A user-defined value or NULL. This value is simply passed to the callback function. Normally, this parameter is used by an application to pass a pointer to a data structure that lets the callback function establish some context.
%inst
Registers a callback function for use by the stack walking procedure
on Alpha computers. (SymRegisterFunctionEntryCallback64)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
The SymRegisterFunctionEntryCallback64 function lets an application
register a callback function for use by the stack walking procedure.
The stack walking procedure calls the registered callback function
when it is unable to locate a function table entry for an address. In
most cases, the stack walking procedure locates the function table
entries in the function table of the image containing the address.
However, in situations where the function table entries are not in
the image, this callback allows the debugger to provide the function
table entry from another source. For example, run-time generated code
on Alpha computers can define dynamic function tables to support
exception handling and stack tracing. All DbgHelp functions, such as
this one, are single threaded. Therefore, calls from more than one
thread to this function will likely result in unexpected behavior or
memory corruption. To avoid this, you must synchronize all concurrent
calls from more than one thread to this function. This function
supersedes the SymRegisterFunctionEntryCallback function. For more
information, see Updated Platform Support.
SymRegisterFunctionEntryCallback is defined as follows in Dbghelp.h.
This doc was truncated.


%index
SymSearch
The SymSearch function (dbghelp.h) searches for PDB symbols that meet the specified criteria.
%group
Win32 dbghelp
%prm
hProcess, BaseOfDll, Index, SymTag, Mask, Address, EnumSymbolsCallback, UserContext, Options
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
BaseOfDll : [int64] The base address of the module. If this value is zero and Mask contains an exclamation point (!), the function looks across modules. If this value is zero and Mask does not contain an exclamation point, the function uses the scope established by the SymSetContext function.
Index : [int] A unique value for the symbol.
SymTag : [int] The PDB classification. These values are defined in Dbghelp.h in the SymTagEnum enumeration type. For  descriptions, see the PDB documentation.
Mask : [str] A wildcard expression that indicates the names of the symbols to be enumerated. To specify a module name, use the !mod syntax.
Address : [int64] The address of the symbol.
EnumSymbolsCallback : [int] A SymEnumSymbolsProc callback function that receives the symbol information.
UserContext : [intptr] A user-defined value that is passed to the callback function, or NULL. This parameter is typically used by an application to pass a pointer to a data structure that provides context for the callback function.
Options : [int] The options that control the behavior of this function.
%inst
The SymSearch function (dbghelp.h) searches for PDB symbols that meet
the specified criteria.

[戻り値]
If the function succeeds, the return value is TRUE.
If the function fails, the return value is FALSE. To retrieve
extended error information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function. To call the Unicode version of this
function, define DBGHELP_TRANSLATE_TCHAR.


%index
SymSetContext
Sets context information used by the SymEnumSymbols function. This function only works with PDB symbols.
%group
Win32 dbghelp
%prm
hProcess, StackFrame, Context
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
StackFrame : [var] A pointer to an IMAGEHLP_STACK_FRAME structure that contains frame information.
Context : [intptr] This parameter is ignored.
%inst
Sets context information used by the SymEnumSymbols function. This
function only works with PDB symbols.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
If you call SymSetContext to set the context to its current value,
the function fails but GetLastError returns ERROR_SUCCESS. All
DbgHelp functions, such as this one, are single threaded. Therefore,
calls from more than one thread to this function will likely result
in unexpected behavior or memory corruption. To avoid this, you must
synchronize all concurrent calls from more than one thread to this
function.


%index
SymSetExtendedOption
Turns the specified extended symbol option on or off.
%group
Win32 dbghelp
%prm
option, value
option : [int] The extended symbol option to turn on or off. The following are valid values.
value : [int] The value to set for the specified option, either TRUE or FALSE.
%inst
Turns the specified extended symbol option on or off.

[戻り値]
The previous value of the specified extended option.


%index
SymSetHomeDirectory
The SymSetHomeDirectory function (dbghelp.h) sets the home directory used by Dbghelp.
%group
Win32 dbghelp
%prm
hProcess, dir
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
dir : [str] The home directory. This directory must be writable, otherwise the home directory is the common application directory specified with [CSIDL_COMMON_APPDATA](/windows/win32/shell/csidl). If this parameter is NULL, the function uses the default directory.
%inst
The SymSetHomeDirectory function (dbghelp.h) sets the home directory
used by Dbghelp.

[戻り値]
If the function succeeds, the return value is a pointer to the dir
parameter. If the function fails, the return value is NULL. To
retrieve extended error information, call GetLastError.

[備考]
The default home directory is the directory in which Dbghelp.dll
resides. Dbghelp uses this directory as a basis for other
directories, such as the default downstream store directory (the sym
subdirectory of the home directory). The home directory used for the
default symbol store and the source server cache location is stored
in the DBGHELP_HOMEDIR environment variable. All DbgHelp functions,
such as this one, are single threaded. Therefore, calls from more
than one thread to this function will likely result in unexpected
behavior or memory corruption. To avoid this, you must synchronize
all concurrent calls from more than one thread to this function. To
call the Unicode version of this function, define
DBGHELP_TRANSLATE_TCHAR.


%index
SymSetOptions
Sets the options mask.
%group
Win32 dbghelp
%prm
SymOptions
SymOptions : [int] The symbol options. Zero is a valid value and indicates that all options are turned off. The options values are combined using the OR operator to form a valid options value. The following are valid values.
%inst
Sets the options mask.

[戻り値]
The function returns the current options mask.

[備考]
The options value can be changed any number of times while the
library is in use by an application. The option change affects all
future calls to the symbol handler. To get the current options mask,
call the SymGetOptions function. All DbgHelp functions, such as this
one, are single threaded. Therefore, calls from more than one thread
to this function will likely result in unexpected behavior or memory
corruption. To avoid this, you must synchronize all concurrent calls
from more than one thread to this function.


%index
SymSetParentWindow
Sets the window that the caller will use to display a user interface.
%group
Win32 dbghelp
%prm
hwnd
hwnd : [intptr] A handle to the window.
%inst
Sets the window that the caller will use to display a user interface.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function.


%index
SymSetScopeFromAddr
Sets the local scope to the symbol that matches the specified address.
%group
Win32 dbghelp
%prm
hProcess, Address
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
Address : [int64] The address.
%inst
Sets the local scope to the symbol that matches the specified
address.

[戻り値]
If the function succeeds, the return value is TRUE.
If the function fails, the return value is FALSE. To retrieve
extended error information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function.


%index
SymSetScopeFromIndex
Sets the local scope to the symbol that matches the specified index.
%group
Win32 dbghelp
%prm
hProcess, BaseOfDll, Index
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
BaseOfDll : [int64] The base address of the module.
Index : [int] The unique value for the symbol.
%inst
Sets the local scope to the symbol that matches the specified index.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function.


%index
SymSetScopeFromInlineContext
Sets the local scope to the symbol that matches the specified address and inline context.
%group
Win32 dbghelp
%prm
hProcess, Address, InlineContext
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
Address : [int64] The address.
InlineContext : [int] The inline context.
%inst
Sets the local scope to the symbol that matches the specified address
and inline context.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.


%index
SymSetSearchPath
The SymSetSearchPath function (dbghelp.h) sets the search path for the specified process.
%group
Win32 dbghelp
%prm
hProcess, SearchPathA
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
SearchPathA : [str] 
%inst
The SymSetSearchPath function (dbghelp.h) sets the search path for
the specified process.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
The symbol search path can be changed any number of times while the
library is in use by an application. The change affects all future
calls to the symbol handler. To get the current search path, call the
SymGetSearchPath function. All DbgHelp functions, such as this one,
are single threaded. Therefore, calls from more than one thread to
this function will likely result in unexpected behavior or memory
corruption. To avoid this, you must synchronize all concurrent calls
from more than one thread to this function. To call the Unicode
version of this function, define DBGHELP_TRANSLATE_TCHAR.


%index
SymSrvDeltaName
The SymSrvDeltaName function (dbghelp.h) generates the name for a file that describes the relationship between two versions of the same symbol/image.
%group
Win32 dbghelp
%prm
hProcess, SymPath, Type, File1, File2
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
SymPath : [str] The symbol path. The function uses only the symbol stores described in standard syntax for symbol stores. All other paths are ignored. If this parameter is NULL, the function uses the symbol path set using the SymInitialize or SymSetSearchPath function.
Type : [str] The extension for the generated file name.
File1 : [str] The path of the first version of the symbol or image file.
File2 : [str] The path of the second version of the symbol or image file.
%inst
The SymSrvDeltaName function (dbghelp.h) generates the name for a
file that describes the relationship between two versions of the same
symbol/image.

[戻り値]
If the function succeeds, the return value is the resulting file
name.
If the function fails, the return value is NULL. To retrieve extended
error information, call GetLastError.

[備考]
This function opens the two specified files, reads the indexing
information from the header, and passes this information to the
symbol server so it can create the file name. If you specify the Type
parameter as "xml", the name is the index of File1, followed by a
dash, followed by the index of File2, followed by an .xml extension.
For example: 3F3D5C755000-3F3D647621000.xml This function returns a
pointer to a buffer that may be reused by another function.
Therefore, be sure to copy the data returned to another buffer
immediately. All DbgHelp functions, such as this one, are single
threaded. Therefore, calls from more than one thread to this function
will likely result in unexpected behavior or memory corruption. To
avoid this, you must synchronize all concurrent calls from more than
one thread to this function. To call the Unicode version of this
function, define DBGHELP_TRANSLATE_TCHAR.


%index
SymSrvGetFileIndexInfo
The SymSrvGetFileIndexInfo function (dbghelp.h) retrieves the index information for the specified .pdb, .dbg, or image file.
%group
Win32 dbghelp
%prm
File, Info, Flags
File : [str] The name of the file.
Info : [var] A SYMSRV_INDEX_INFO structure that receives the index information.
Flags : [int] This parameter is reserved for future use.
%inst
The SymSrvGetFileIndexInfo function (dbghelp.h) retrieves the index
information for the specified .pdb, .dbg, or image file.

[戻り値]
If the function succeeds, the return value is TRUE.
If the function fails, the return value is FALSE. To retrieve
extended error information, call GetLastError.

[備考]
This function is not for general use. Those writing utilities for the
management of files in symbol server stores may use to this function
to predict the relative path the symbol server will look for a file.
It is used by srctool.exe to actually populate symbol server stores.
It may also be of use to those looking to find the parameters to feed
the SymFindFileInPath function. All DbgHelp functions, such as this
one, are single threaded. Therefore, calls from more than one thread
to this function will likely result in unexpected behavior or memory
corruption. To avoid this, you must synchronize all concurrent calls
from more than one thread to this function. To call the Unicode
version of this function, define DBGHELP_TRANSLATE_TCHAR.


%index
SymSrvGetFileIndexString
The SymSrvGetFileIndexString function (dbghelp.h) retrieves the index string for the specified .pdb, .dbg, or image file.
%group
Win32 dbghelp
%prm
hProcess, SrvPath, File, Index, Size, Flags
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
SrvPath : [str] The path to the symbol server.
File : [str] The name of the file.
Index : [str] A pointer to a buffer that receives the index string.
Size : [int] The size of the Index buffer, in characters.
Flags : [int] This parameter is reserved for future use.
%inst
The SymSrvGetFileIndexString function (dbghelp.h) retrieves the index
string for the specified .pdb, .dbg, or image file.

[戻り値]
If the function succeeds, the return value is TRUE.
If the function fails, the return value is FALSE. To retrieve
extended error information, call GetLastError.

[備考]
This function is not for general use. Those writing utilities for the
management of files in symbol server stores may use to this function
to predict the relative path the symbol server will look for a file.
It is used by srctool.exe to actually populate symbol server stores.
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function. To call the Unicode version of this
function, define DBGHELP_TRANSLATE_TCHAR.


%index
SymSrvGetFileIndexes
The SymSrvGetFileIndexes function (dbghelp.h) retrieves the indexes for the specified .pdb, .dbg, or image file that would be used to store the file.
%group
Win32 dbghelp
%prm
File, Id, Val1, Val2, Flags
File : [str] The name of the file.
Id : [var] The first of three identifying parameters.
Val1 : [var] The second of three identifying parameters.
Val2 : [var] The third of three identifying parameters.
Flags : [int] This parameter is reserved for future use.
%inst
The SymSrvGetFileIndexes function (dbghelp.h) retrieves the indexes
for the specified .pdb, .dbg, or image file that would be used to
store the file.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To retrieve extended error
information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function. To call the Unicode version of this
function, define DBGHELP_TRANSLATE_TCHAR.


%index
SymSrvGetSupplement
The SymSrvGetSupplement function (dbghelp.h) retrieves the specified file from the supplement for a symbol store.
%group
Win32 dbghelp
%prm
hProcess, SymPath, Node, File
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
SymPath : [str] The symbol path. The function uses only the symbol stores described in standard syntax for symbol stores. All other paths are ignored. If this parameter is NULL, the function uses the symbol path set using the SymInitialize or SymSetSearchPath function.
Node : [str] The symbol file associated with the supplemental file.
File : [str] The name of the file.
%inst
The SymSrvGetSupplement function (dbghelp.h) retrieves the specified
file from the supplement for a symbol store.

[戻り値]
If the function succeeds, the return value is the fully qualified
path for the supplemental file.
If the function fails, the return value is NULL. To retrieve extended
error information, call GetLastError.

[備考]
For more information on supplemental files, see
SymSrvStoreSupplement. This function returns a pointer to a buffer
that may be reused by another function. Therefore, be sure to copy
the data returned to another buffer immediately. All DbgHelp
functions, such as this one, are single threaded. Therefore, calls
from more than one thread to this function will likely result in
unexpected behavior or memory corruption. To avoid this, you must
synchronize all concurrent calls from more than one thread to this
function. To call the Unicode version of this function, define
DBGHELP_TRANSLATE_TCHAR.


%index
SymSrvIsStore
The SymSrvIsStore function (dbghelp.h) determines whether the specified path points to a symbol store.
%group
Win32 dbghelp
%prm
hProcess, path
hProcess : [intptr] The handle of a process that you previously passed to the SymInitialize function. If this parameter is set to  NULL, the function determines only whether the store exists; otherwise, the function determines whether the store exists and contains a process entry for the specified process handle.
path : [str] The path to a symbol store. The path can specify the default symbol store (for example, SRV*), point to an HTTP or HTTPS symbol server, or specify a UNC, absolute, or relative path to the store.
%inst
The SymSrvIsStore function (dbghelp.h) determines whether the
specified path points to a symbol store.

[戻り値]
If the path specifies a symbol store, the function returns TRUE.
Otherwise, it returns FALSE. To get extended error information, call
the GetLastError function.

[備考]
If the path points to the default symbol store (for example, SRV*) or
to an HTTP or HTTPS symbol server, the function assumes the store
exists. If there is a proxy computer between the client computer and
the server, the version of the SymSrv.dll on the proxy cannot be less
than the version that is on the client. All DbgHelp functions, such
as this one, are single threaded. Therefore, calls from more than one
thread to this function will likely result in unexpected behavior or
memory corruption. To avoid this, you must synchronize all concurrent
calls from more than one thread to this function. To call the Unicode
version of this function, define DBGHELP_TRANSLATE_TCHAR.


%index
SymSrvStoreFile
The SymSrvStoreFile function (dbghelp.h) stores a file in the specified symbol store.
%group
Win32 dbghelp
%prm
hProcess, SrvPath, File, Flags
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
SrvPath : [str] The symbol store.
File : [str] The name of the file.
Flags : [int] The flags that control the function.
%inst
The SymSrvStoreFile function (dbghelp.h) stores a file in the
specified symbol store.

[戻り値]
If the function succeeds, the return value is a pointer to a
null-terminated string that specifies the full-qualified path to the
stored file.
If the function fails, the return value is NULL. To retrieve extended
error information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function. This function returns a pointer to a buffer
that may be reused by another function. Therefore, be sure to copy
the data returned to another buffer immediately. To call the Unicode
version of this function, define DBGHELP_TRANSLATE_TCHAR.


%index
SymSrvStoreSupplement
The SymSrvStoreSupplement function (dbghelp.h) stores a file in the specified supplement to a symbol store.
%group
Win32 dbghelp
%prm
hProcess, SrvPath, Node, File, Flags
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
SrvPath : [str] The path to the symbol store.
Node : [str] The symbol file associated with the supplemental file.
File : [str] The name of the file.
Flags : [int] If this parameter is SYMSTOREOPT_COMPRESS, the file is compressed in the symbol store. Currently, there are no other supported values.
%inst
The SymSrvStoreSupplement function (dbghelp.h) stores a file in the
specified supplement to a symbol store.

[戻り値]
If the function succeeds, the return value is the fully qualified
path for the supplemental file.
If the function fails, the return value is NULL. To retrieve extended
error information, call GetLastError.

[備考]
An important use for this function is to store delta files. For more
information, see SymSrvDeltaName. This function returns a pointer to
a buffer that may be reused by another function. Therefore, be sure
to copy the data returned to another buffer immediately. The symbol
server stores supplemental files with the same extension in a common
directory. For example, Sup1.xml would be stored in the following
directory: SymPath\supplement\Node\xml. The administrator of a store
can prevent users from writing supplemental files by creating a
read-only file in the root of the store named Supplement.
Alternatively, the administrator can create the supplement directory
and use ACLs to control access. All DbgHelp functions, such as this
one, are single threaded. Therefore, calls from more than one thread
to this function will likely result in unexpected behavior or memory
corruption. To avoid this, you must synchronize all concurrent calls
from more than one thread to this function. To call the Unicode
version of this function, define DBGHELP_TRANSLATE_TCHAR.


%index
SymUnDName64
Undecorates a decorated C++ symbol name. (SymUnDName64)
%group
Win32 dbghelp
%prm
sym, UnDecName, UnDecNameLength
sym : [var] A pointer to an IMAGEHLP_SYMBOL64 structure that specifies the symbol to be undecorated.
UnDecName : [str] A pointer to a buffer that receives the undecorated name.
UnDecNameLength : [int] The size of the UnDecName buffer, in characters.
%inst
Undecorates a decorated C++ symbol name. (SymUnDName64)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function. This function supersedes the SymUnDName
function. For more information, see Updated Platform Support.
SymUnDName is defined as follows in Dbghelp.h.
This doc was truncated.


%index
SymUnloadModule64
Unloads the symbol table. (SymUnloadModule64)
%group
Win32 dbghelp
%prm
hProcess, BaseOfDll
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
BaseOfDll : [int64] The base address of the module that is to be unloaded.
%inst
Unloads the symbol table. (SymUnloadModule64)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
All DbgHelp functions, such as this one, are single threaded.
Therefore, calls from more than one thread to this function will
likely result in unexpected behavior or memory corruption. To avoid
this, you must synchronize all concurrent calls from more than one
thread to this function. This function supersedes the
SymUnloadedModule function. For more information, see Updated
Platform Support. SymUnloadedModule is defined as follows in
Dbghelp.h.
This doc was truncated.


%index
UnDecorateSymbolName
The UnDecorateSymbolName function (dbghelp.h) undecorates the specified decorated C++ symbol name.
%group
Win32 dbghelp
%prm
name, outputString, maxStringLength, flags
name : [str] The decorated C++ symbol name. This name can be identified by the first character of the name, which is always a question mark (?).
outputString : [str] A pointer to a string buffer that receives the undecorated name.
maxStringLength : [int] The size of the UnDecoratedName buffer, in characters.
flags : [int] The options for how the decorated name is undecorated. This parameter can be zero or more of the following values.
%inst
The UnDecorateSymbolName function (dbghelp.h) undecorates the
specified decorated C++ symbol name.

[戻り値]
If the function succeeds, the return value is the number of
characters in the UnDecoratedName buffer, not including the NULL
terminator. If the function fails, the return value is zero. To
retrieve extended error information, call GetLastError. If the
function fails and returns zero, the content of the UnDecoratedName
buffer is undetermined.

[備考]
To use undecorated symbols, call the SymSetOptions function with the
SYMOPT_UNDNAME option. All DbgHelp functions, such as this one, are
single threaded. Therefore, calls from more than one thread to this
function will likely result in unexpected behavior or memory
corruption. To avoid this, you must synchronize all concurrent calls
from more than one thread to this function. To call the Unicode
version of this function, define DBGHELP_TRANSLATE_TCHAR.

