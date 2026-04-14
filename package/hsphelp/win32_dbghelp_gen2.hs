; ============================================================
;   dbghelp.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
StackWalk64
Obtains a stack trace. (StackWalk64)
%group
Win32 dbghelp
%prm
MachineType, hProcess, hThread, StackFrame, ContextRecord, ReadMemoryRoutine, FunctionTableAccessRoutine, GetModuleBaseRoutine, TranslateAddress
MachineType : [int] The architecture type of the computer for which the stack trace is generated. This parameter can be one of the following values.
hProcess : [intptr] A handle to the process for which the stack trace is generated. If the caller supplies a valid callback pointer for the ReadMemoryRoutine parameter, then this value does not have to be a valid process handle. It can be a token that is unique and consistently the same for all calls to the StackWalk64 function. If the symbol handler is used with StackWalk64, use the same process handles for the calls to each function.
hThread : [intptr] A handle to the thread for which the stack trace is generated. If the caller supplies a valid callback pointer for the ReadMemoryRoutine parameter, then this value does not have to be a valid thread handle. It can be a token that is unique and consistently the same for all calls to the StackWalk64 function.
StackFrame : [var] A pointer to a STACKFRAME64 structure. This structure receives information for the next frame, if the function call succeeds.
ContextRecord : [intptr] A pointer to a CONTEXT structure. This parameter is required only when the MachineType parameter is not IMAGE_FILE_MACHINE_I386. However, it is recommended that this parameter contain a valid context record. This allows StackWalk64 to handle a greater variety of situations. This context may be modified, so do not pass a context record that should not be modified.
ReadMemoryRoutine : [int] A callback routine that provides memory read services. When the StackWalk64 function needs to read memory from the process's address space, the ReadProcessMemoryProc64 callback is used. If this parameter is NULL, then the function uses a default routine. In this case, the hProcess parameter must be a valid process handle. If this parameter is not NULL, the application should implement and register a symbol handler callback function that handles CBA_READ_MEMORY.
FunctionTableAccessRoutine : [int] A callback routine that provides access to the run-time function table for the process. This parameter is required because the StackWalk64 function does not have access to the process's run-time function table. For more information, see FunctionTableAccessProc64. The symbol handler provides functions that load and access the run-time table. If these functions are used, then SymFunctionTableAccess64 can be passed as a valid parameter.
GetModuleBaseRoutine : [int] A callback routine that provides a module base for any given virtual address. This parameter is required. For more information, see GetModuleBaseProc64. The symbol handler provides functions that load and maintain module information. If these functions are used, then SymGetModuleBase64 can be passed as a valid parameter.
TranslateAddress : [int] A callback routine that provides address translation for 16-bit addresses. For more information, see TranslateAddressProc64. Most callers of StackWalk64 can safely pass NULL for this parameter.
%inst
Obtains a stack trace. (StackWalk64)

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. Note that StackWalk64 generally
does not set the last error code.

[備考]
The StackWalk64 function provides a portable method for obtaining a
stack trace. Using the StackWalk64 function is recommended over
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
function. This function supersedes the StackWalk function. For more
information, see Updated Platform Support. StackWalk is defined as
follows in DbgHelp.h.
This doc was truncated.


%index
SymCleanup
Deallocates all resources associated with the process handle.
%group
Win32 dbghelp
%prm
hProcess
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
%inst
Deallocates all resources associated with the process handle.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
This function frees all resources associated with the process handle.
Failure to call this function causes memory and resource leaks in the
calling application All DbgHelp functions, such as this one, are
single threaded. Therefore, calls from more than one thread to this
function will likely result in unexpected behavior or memory
corruption. To avoid this, call SymInitialize only when your process
starts and SymCleanup only when your process ends. It is not
necessary for each thread in the process to call these functions.


%index
SymFromAddr
The SymFromAddr function (dbghelp.h) retrieves symbol information for the specified address.
%group
Win32 dbghelp
%prm
hProcess, Address, Displacement, Symbol
hProcess : [intptr] A handle to a process. This handle must have been previously passed to the SymInitialize function.
Address : [int64] The address for which a symbol should be located. The address does not have to be on a symbol boundary. If the address comes after the beginning of a symbol and before the end of the symbol, the symbol is found.
Displacement : [var] The displacement from the beginning of the symbol, or zero.
Symbol : [var] A pointer to a SYMBOL_INFO structure that provides information about the symbol. The symbol name is variable in length; therefore this buffer must be large enough to hold the name stored at the end of the SYMBOL_INFO structure. Be sure to set the MaxNameLen member to the number of bytes reserved for the name.
%inst
The SymFromAddr function (dbghelp.h) retrieves symbol information for
the specified address.

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
SymGetLineFromAddr64
Locates the source line for the specified address. (SymGetLineFromAddr64)
%group
Win32 dbghelp
%prm
hProcess, qwAddr, pdwDisplacement, Line64
hProcess : [intptr] A handle to the process that was originally passed to the SymInitialize function.
qwAddr : [int64] The address for which a line should be located. It is not necessary for the address to be on a line boundary. If the address appears after the beginning of a line and before the end of the line, the line is found.
pdwDisplacement : [var] The displacement in bytes from the beginning of the line, or zero.
Line64 : [var] A pointer to an IMAGEHLP_LINE64 structure.
%inst
Locates the source line for the specified address.
(SymGetLineFromAddr64)

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
SymInitialize
The SymInitialize function (dbghelp.h) initializes the symbol handler for a process.
%group
Win32 dbghelp
%prm
hProcess, UserSearchPath, fInvadeProcess
hProcess : [intptr] A handle that identifies the caller. This value should be unique and nonzero, but need not be a process handle. However, if you do use a process handle, be sure to use the correct handle. If the application is a debugger, use the process handle for the process being debugged. Do not use the handle returned by GetCurrentProcess. The handle used must be unique to avoid sharing a session with another component, and using GetCurrentProcess can have unexpected results when multiple components are attempting to use dbghelp to inspect the current process. Using GetCurrentProcess when debugging another process will also cause functions like SymLoadModuleEx to have unexpected results.
UserSearchPath : [str] The path, or series of paths separated by a semicolon (;), that is used to search for symbol files. If this parameter is NULL, the library attempts to form a symbol path from the following sources:
fInvadeProcess : [int] If this value is TRUE, enumerates the loaded modules for the process and effectively calls the SymLoadModule64 function for each module.
%inst
The SymInitialize function (dbghelp.h) initializes the symbol handler
for a process.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To retrieve extended error
information, call GetLastError.

[備考]
The SymInitialize function is used to initialize the symbol handler
for a process. In the context of the symbol handler, a process is a
convenient object to use when collecting symbol information. Usually,
symbol handlers are used by debuggers and other tools that need to
load symbols for a process being debugged. The handle passed to
SymInitialize must be the same value passed to all other symbol
handler functions called by the process. It is the handle that the
functions use to identify the caller and locate the correct symbol
information. When you have finished using the symbol information,
call the SymCleanup function to deallocate all resources associated
with the process for which symbols are loaded. The search for symbols
files is performed recursively for all paths specified in the
UserSearchPath parameter. Therefore, if you specify the root
directory in a search, the whole drive is searched, which can take
significant time. Note that the directory that contains the
executable file for the process is not automatically part of the
search path. To include this directory in the search path, call the
GetModuleFileNameEx function, then add the path returned to
UserSearchPath. A process that calls SymInitialize should not call it
again unless it calls SymCleanup first. If the call to SymInitialize
set fInvadeProcess to TRUE and you simply need to reload the module
list, use the SymRefreshModuleList function. All DbgHelp functions,
such as this one, are single threaded. Therefore, calls from more
than one thread to this function will likely result in unexpected
behavior or memory corruption. To avoid this, call SymInitialize only
when your process starts and SymCleanup only when your process ends.
It is not necessary for each thread in the process to call these
functions. To call the Unicode version of this function, define
DBGHELP_TRANSLATE_TCHAR.

