; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    dbghelp.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __dbghelp_gen2_as__
#define global __dbghelp_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "dbghelp.dll"
; winmdroot.Foundation.BOOL DbgHelpCreateUserDump(winmdroot.Foundation.PCSTR FileName, delegate *unmanaged[Stdcall]<uint,void**,uint*,void*,global::Windows.Win32.Foundation.BOOL> Callback, [Optional] void* UserData)
#cfunc global DbgHelpCreateUserDump "DbgHelpCreateUserDump" str, int, intptr

; winmdroot.Foundation.BOOL EnumDirTree(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.PCSTR RootPath, winmdroot.Foundation.PCSTR InputPathName, winmdroot.Foundation.PSTR OutputPathBuffer, delegate *unmanaged[Stdcall]<winmdroot.Foundation.PCSTR,void*,global::Windows.Win32.Foundation.BOOL> cb, [Optional] void* data)
#cfunc global EnumDirTree "EnumDirTree" intptr, str, str, str, int, intptr

; winmdroot.Foundation.BOOL EnumerateLoadedModules64(winmdroot.Foundation.HANDLE hProcess, delegate *unmanaged[Stdcall]<winmdroot.Foundation.PCSTR,ulong,uint,void*,global::Windows.Win32.Foundation.BOOL> EnumLoadedModulesCallback, [Optional] void* UserContext)
#cfunc global EnumerateLoadedModules64 "EnumerateLoadedModules64" intptr, int, intptr

; winmdroot.Foundation.BOOL EnumerateLoadedModulesEx(winmdroot.Foundation.HANDLE hProcess, delegate *unmanaged[Stdcall]<winmdroot.Foundation.PCSTR,ulong,uint,void*,global::Windows.Win32.Foundation.BOOL> EnumLoadedModulesCallback, [Optional] void* UserContext)
#cfunc global EnumerateLoadedModulesEx "EnumerateLoadedModulesEx" intptr, int, intptr

; winmdroot.Foundation.BOOL EnumerateLoadedModulesW64(winmdroot.Foundation.HANDLE hProcess, delegate *unmanaged[Stdcall]<winmdroot.Foundation.PCWSTR,ulong,uint,void*,global::Windows.Win32.Foundation.BOOL> EnumLoadedModulesCallback, [Optional] void* UserContext)
#cfunc global EnumerateLoadedModulesW64 "EnumerateLoadedModulesW64" intptr, int, intptr

; winmdroot.Foundation.HANDLE FindDebugInfoFile(winmdroot.Foundation.PCSTR FileName, winmdroot.Foundation.PCSTR SymbolPath, winmdroot.Foundation.PSTR DebugFilePath)
#cfunc global FindDebugInfoFile "FindDebugInfoFile" str, str, str

; winmdroot.Foundation.HANDLE FindDebugInfoFileEx(winmdroot.Foundation.PCSTR FileName, winmdroot.Foundation.PCSTR SymbolPath, winmdroot.Foundation.PSTR DebugFilePath, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HANDLE,winmdroot.Foundation.PCSTR,void*,global::Windows.Win32.Foundation.BOOL> Callback, [Optional] void* CallerData)
#cfunc global FindDebugInfoFileEx "FindDebugInfoFileEx" str, str, str, int, intptr

; winmdroot.Foundation.HANDLE FindExecutableImage(winmdroot.Foundation.PCSTR FileName, winmdroot.Foundation.PCSTR SymbolPath, winmdroot.Foundation.PSTR ImageFilePath)
#cfunc global FindExecutableImage "FindExecutableImage" str, str, str

; winmdroot.Foundation.HANDLE FindExecutableImageEx(winmdroot.Foundation.PCSTR FileName, winmdroot.Foundation.PCSTR SymbolPath, winmdroot.Foundation.PSTR ImageFilePath, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HANDLE,winmdroot.Foundation.PCSTR,void*,global::Windows.Win32.Foundation.BOOL> Callback, [Optional] void* CallerData)
#cfunc global FindExecutableImageEx "FindExecutableImageEx" str, str, str, int, intptr

; winmdroot.Foundation.BOOL FindFileInPath(winmdroot.Foundation.HANDLE hprocess, winmdroot.Foundation.PCSTR SearchPathA, winmdroot.Foundation.PCSTR FileName, void* id, uint two, uint three, uint flags, winmdroot.Foundation.PSTR FilePath)
#cfunc global FindFileInPath "FindFileInPath" intptr, str, str, intptr, int, int, int, str

; winmdroot.Foundation.BOOL FindFileInSearchPath(winmdroot.Foundation.HANDLE hprocess, winmdroot.Foundation.PCSTR SearchPathA, winmdroot.Foundation.PCSTR FileName, uint one, uint two, uint three, winmdroot.Foundation.PSTR FilePath)
#cfunc global FindFileInSearchPath "FindFileInSearchPath" intptr, str, str, int, int, int, str

; uint GetSymLoadError()
#cfunc global GetSymLoadError "GetSymLoadError"

; uint GetTimestampForLoadedLibrary(winmdroot.Foundation.HMODULE Module)
#cfunc global GetTimestampForLoadedLibrary "GetTimestampForLoadedLibrary" intptr

; void* ImageDirectoryEntryToData(void* Base, winmdroot.Foundation.BOOLEAN MappedAsImage, winmdroot.System.Diagnostics.Debug.IMAGE_DIRECTORY_ENTRY DirectoryEntry, uint* Size)
#cfunc global ImageDirectoryEntryToData "ImageDirectoryEntryToData" intptr, int, int, var

; void* ImageDirectoryEntryToDataEx(void* Base, winmdroot.Foundation.BOOLEAN MappedAsImage, winmdroot.System.Diagnostics.Debug.IMAGE_DIRECTORY_ENTRY DirectoryEntry, uint* Size, [Optional] winmdroot.System.Diagnostics.Debug.IMAGE_SECTION_HEADER** FoundHeader)
#cfunc global ImageDirectoryEntryToDataEx "ImageDirectoryEntryToDataEx" intptr, int, int, var, var

; winmdroot.System.Diagnostics.Debug.API_VERSION* ImagehlpApiVersion()
#cfunc global ImagehlpApiVersion "ImagehlpApiVersion"

; winmdroot.System.Diagnostics.Debug.API_VERSION* ImagehlpApiVersionEx(winmdroot.System.Diagnostics.Debug.API_VERSION* AppVersion)
#cfunc global ImagehlpApiVersionEx "ImagehlpApiVersionEx" var

; winmdroot.Foundation.BOOL MakeSureDirectoryPathExists(winmdroot.Foundation.PCSTR DirPath)
#cfunc global MakeSureDirectoryPathExists "MakeSureDirectoryPathExists" str

; winmdroot.Foundation.BOOL RangeMapAddPeImageSections(void* RmapHandle, winmdroot.Foundation.PCWSTR ImageName, void* MappedImage, uint MappingBytes, ulong ImageBase, ulong UserTag, uint MappingFlags)
#cfunc global RangeMapAddPeImageSections "RangeMapAddPeImageSections" intptr, wstr, intptr, int, int64, int64, int

; void* RangeMapCreate()
#cfunc global RangeMapCreate "RangeMapCreate"

; void RangeMapFree([Optional] void* RmapHandle)
#func global RangeMapFree "RangeMapFree" intptr

; winmdroot.Foundation.BOOL RangeMapRead(void* RmapHandle, ulong Offset, void* Buffer, uint RequestBytes, uint Flags, [Optional] uint* DoneBytes)
#cfunc global RangeMapRead "RangeMapRead" intptr, int64, intptr, int, int, var

; winmdroot.Foundation.BOOL RangeMapRemove(void* RmapHandle, ulong UserTag)
#cfunc global RangeMapRemove "RangeMapRemove" intptr, int64

; winmdroot.Foundation.BOOL RangeMapWrite(void* RmapHandle, ulong Offset, void* Buffer, uint RequestBytes, uint Flags, [Optional] uint* DoneBytes)
#cfunc global RangeMapWrite "RangeMapWrite" intptr, int64, intptr, int, int, var

; void RemoveInvalidModuleList(winmdroot.Foundation.HANDLE hProcess)
#func global RemoveInvalidModuleList "RemoveInvalidModuleList" intptr

; winmdroot.Foundation.BOOL ReportSymbolLoadSummary(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.PCWSTR pLoadModule, winmdroot.System.Diagnostics.Debug.DBGHELP_DATA_REPORT_STRUCT* pSymbolData)
#cfunc global ReportSymbolLoadSummary "ReportSymbolLoadSummary" intptr, wstr, var

; winmdroot.Foundation.BOOL SearchTreeForFile(winmdroot.Foundation.PCSTR RootPath, winmdroot.Foundation.PCSTR InputPathName, winmdroot.Foundation.PSTR OutputPathBuffer)
#cfunc global SearchTreeForFile "SearchTreeForFile" str, str, str

; void SetCheckUserInterruptShared(delegate *unmanaged[Stdcall]<uint> lpStartAddress)
#func global SetCheckUserInterruptShared "SetCheckUserInterruptShared" int

; void SetSymLoadError(uint error)
#func global SetSymLoadError "SetSymLoadError" int

; winmdroot.Foundation.BOOL StackWalk64(uint MachineType, winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.HANDLE hThread, winmdroot.System.Diagnostics.Debug.STACKFRAME64* StackFrame, void* ContextRecord, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HANDLE,ulong,void*,uint,uint*,global::Windows.Win32.Foundation.BOOL> ReadMemoryRoutine, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HANDLE,ulong,void*> FunctionTableAccessRoutine, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HANDLE,ulong,ulong> GetModuleBaseRoutine, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HANDLE,global::Windows.Win32.Foundation.HANDLE,winmdroot.System.Diagnostics.Debug.ADDRESS64*,ulong> TranslateAddress)
#cfunc global StackWalk64 "StackWalk64" int, intptr, intptr, var, intptr, int, int, int, int

; winmdroot.Foundation.BOOL StackWalkEx(uint MachineType, winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.HANDLE hThread, winmdroot.System.Diagnostics.Debug.STACKFRAME_EX* StackFrame, void* ContextRecord, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HANDLE,ulong,void*,uint,uint*,global::Windows.Win32.Foundation.BOOL> ReadMemoryRoutine, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HANDLE,ulong,void*> FunctionTableAccessRoutine, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HANDLE,ulong,ulong> GetModuleBaseRoutine, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HANDLE,global::Windows.Win32.Foundation.HANDLE,winmdroot.System.Diagnostics.Debug.ADDRESS64*,ulong> TranslateAddress, uint Flags)
#cfunc global StackWalkEx "StackWalkEx" int, intptr, intptr, var, intptr, int, int, int, int, int

; winmdroot.Foundation.BOOL SymAddSourceStream(winmdroot.Foundation.HANDLE hProcess, ulong Base, winmdroot.Foundation.PCSTR StreamFile, [Optional] byte* Buffer, nuint Size)
#cfunc global SymAddSourceStream "SymAddSourceStream" intptr, int64, str, var, int

; winmdroot.Foundation.BOOL SymAddSymbol(winmdroot.Foundation.HANDLE hProcess, ulong BaseOfDll, winmdroot.Foundation.PCSTR Name, ulong Address, uint Size, uint Flags)
#cfunc global SymAddSymbol "SymAddSymbol" intptr, int64, str, int64, int, int

; uint SymAddrIncludeInlineTrace(winmdroot.Foundation.HANDLE hProcess, ulong Address)
#cfunc global SymAddrIncludeInlineTrace "SymAddrIncludeInlineTrace" intptr, int64

; winmdroot.Foundation.BOOL SymCleanup(winmdroot.Foundation.HANDLE hProcess)
#cfunc global SymCleanup "SymCleanup" intptr

; uint SymCompareInlineTrace(winmdroot.Foundation.HANDLE hProcess, ulong Address1, uint InlineContext1, ulong RetAddress1, ulong Address2, ulong RetAddress2)
#cfunc global SymCompareInlineTrace "SymCompareInlineTrace" intptr, int64, int, int64, int64, int64

; winmdroot.Foundation.BOOL SymDeleteSymbol(winmdroot.Foundation.HANDLE hProcess, ulong BaseOfDll, winmdroot.Foundation.PCSTR Name, ulong Address, uint Flags)
#cfunc global SymDeleteSymbol "SymDeleteSymbol" intptr, int64, str, int64, int

; winmdroot.Foundation.BOOL SymEnumLines(winmdroot.Foundation.HANDLE hProcess, ulong Base, winmdroot.Foundation.PCSTR Obj, winmdroot.Foundation.PCSTR File, delegate *unmanaged[Stdcall]<winmdroot.System.Diagnostics.Debug.SRCCODEINFO*,void*,global::Windows.Win32.Foundation.BOOL> EnumLinesCallback, [Optional] void* UserContext)
#cfunc global SymEnumLines "SymEnumLines" intptr, int64, str, str, int, intptr

; winmdroot.Foundation.BOOL SymEnumProcesses(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HANDLE,void*,global::Windows.Win32.Foundation.BOOL> EnumProcessesCallback, void* UserContext)
#cfunc global SymEnumProcesses "SymEnumProcesses" int, intptr

; winmdroot.Foundation.BOOL SymEnumSourceFileTokens(winmdroot.Foundation.HANDLE hProcess, ulong Base, delegate *unmanaged[Stdcall]<void*,nuint,global::Windows.Win32.Foundation.BOOL> Callback)
#cfunc global SymEnumSourceFileTokens "SymEnumSourceFileTokens" intptr, int64, int

; winmdroot.Foundation.BOOL SymEnumSourceFiles(winmdroot.Foundation.HANDLE hProcess, ulong ModBase, winmdroot.Foundation.PCSTR Mask, delegate *unmanaged[Stdcall]<winmdroot.System.Diagnostics.Debug.SOURCEFILE*,void*,global::Windows.Win32.Foundation.BOOL> cbSrcFiles, [Optional] void* UserContext)
#cfunc global SymEnumSourceFiles "SymEnumSourceFiles" intptr, int64, str, int, intptr

; winmdroot.Foundation.BOOL SymEnumSourceLines(winmdroot.Foundation.HANDLE hProcess, ulong Base, winmdroot.Foundation.PCSTR Obj, winmdroot.Foundation.PCSTR File, uint Line, uint Flags, delegate *unmanaged[Stdcall]<winmdroot.System.Diagnostics.Debug.SRCCODEINFO*,void*,global::Windows.Win32.Foundation.BOOL> EnumLinesCallback, [Optional] void* UserContext)
#cfunc global SymEnumSourceLines "SymEnumSourceLines" intptr, int64, str, str, int, int, int, intptr

; winmdroot.Foundation.BOOL SymEnumSym(winmdroot.Foundation.HANDLE hProcess, ulong BaseOfDll, delegate *unmanaged[Stdcall]<global::Windows.Win32.System.Diagnostics.Debug.SYMBOL_INFO*,uint,void*,global::Windows.Win32.Foundation.BOOL> EnumSymbolsCallback, [Optional] void* UserContext)
#cfunc global SymEnumSym "SymEnumSym" intptr, int64, int, intptr

; winmdroot.Foundation.BOOL SymEnumSymbols(winmdroot.Foundation.HANDLE hProcess, ulong BaseOfDll, winmdroot.Foundation.PCSTR Mask, delegate *unmanaged[Stdcall]<global::Windows.Win32.System.Diagnostics.Debug.SYMBOL_INFO*,uint,void*,global::Windows.Win32.Foundation.BOOL> EnumSymbolsCallback, [Optional] void* UserContext)
#cfunc global SymEnumSymbols "SymEnumSymbols" intptr, int64, str, int, intptr

; winmdroot.Foundation.BOOL SymEnumSymbolsEx(winmdroot.Foundation.HANDLE hProcess, ulong BaseOfDll, winmdroot.Foundation.PCSTR Mask, delegate *unmanaged[Stdcall]<global::Windows.Win32.System.Diagnostics.Debug.SYMBOL_INFO*,uint,void*,global::Windows.Win32.Foundation.BOOL> EnumSymbolsCallback, [Optional] void* UserContext, uint Options)
#cfunc global SymEnumSymbolsEx "SymEnumSymbolsEx" intptr, int64, str, int, intptr, int

; winmdroot.Foundation.BOOL SymEnumSymbolsForAddr(winmdroot.Foundation.HANDLE hProcess, ulong Address, delegate *unmanaged[Stdcall]<global::Windows.Win32.System.Diagnostics.Debug.SYMBOL_INFO*,uint,void*,global::Windows.Win32.Foundation.BOOL> EnumSymbolsCallback, [Optional] void* UserContext)
#cfunc global SymEnumSymbolsForAddr "SymEnumSymbolsForAddr" intptr, int64, int, intptr

; winmdroot.Foundation.BOOL SymEnumTypes(winmdroot.Foundation.HANDLE hProcess, ulong BaseOfDll, delegate *unmanaged[Stdcall]<global::Windows.Win32.System.Diagnostics.Debug.SYMBOL_INFO*,uint,void*,global::Windows.Win32.Foundation.BOOL> EnumSymbolsCallback, [Optional] void* UserContext)
#cfunc global SymEnumTypes "SymEnumTypes" intptr, int64, int, intptr

; winmdroot.Foundation.BOOL SymEnumTypesByName(winmdroot.Foundation.HANDLE hProcess, ulong BaseOfDll, winmdroot.Foundation.PCSTR mask, delegate *unmanaged[Stdcall]<global::Windows.Win32.System.Diagnostics.Debug.SYMBOL_INFO*,uint,void*,global::Windows.Win32.Foundation.BOOL> EnumSymbolsCallback, [Optional] void* UserContext)
#cfunc global SymEnumTypesByName "SymEnumTypesByName" intptr, int64, str, int, intptr

; winmdroot.Foundation.BOOL SymEnumerateModules64(winmdroot.Foundation.HANDLE hProcess, delegate *unmanaged[Stdcall]<winmdroot.Foundation.PCSTR,ulong,void*,global::Windows.Win32.Foundation.BOOL> EnumModulesCallback, [Optional] void* UserContext)
#cfunc global SymEnumerateModules64 "SymEnumerateModules64" intptr, int, intptr

; winmdroot.Foundation.BOOL SymEnumerateModulesW64(winmdroot.Foundation.HANDLE hProcess, delegate *unmanaged[Stdcall]<winmdroot.Foundation.PCWSTR,ulong,void*,global::Windows.Win32.Foundation.BOOL> EnumModulesCallback, [Optional] void* UserContext)
#cfunc global SymEnumerateModulesW64 "SymEnumerateModulesW64" intptr, int, intptr

; winmdroot.Foundation.BOOL SymEnumerateSymbols64(winmdroot.Foundation.HANDLE hProcess, ulong BaseOfDll, delegate *unmanaged[Stdcall]<winmdroot.Foundation.PCSTR,ulong,uint,void*,global::Windows.Win32.Foundation.BOOL> EnumSymbolsCallback, [Optional] void* UserContext)
#cfunc global SymEnumerateSymbols64 "SymEnumerateSymbols64" intptr, int64, int, intptr

; winmdroot.Foundation.BOOL SymEnumerateSymbolsW64(winmdroot.Foundation.HANDLE hProcess, ulong BaseOfDll, delegate *unmanaged[Stdcall]<winmdroot.Foundation.PCWSTR,ulong,uint,void*,global::Windows.Win32.Foundation.BOOL> EnumSymbolsCallback, [Optional] void* UserContext)
#cfunc global SymEnumerateSymbolsW64 "SymEnumerateSymbolsW64" intptr, int64, int, intptr

; winmdroot.Foundation.HANDLE SymFindDebugInfoFile(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.PCSTR FileName, winmdroot.Foundation.PSTR DebugFilePath, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HANDLE,winmdroot.Foundation.PCSTR,void*,global::Windows.Win32.Foundation.BOOL> Callback, [Optional] void* CallerData)
#cfunc global SymFindDebugInfoFile "SymFindDebugInfoFile" intptr, str, str, int, intptr

; winmdroot.Foundation.HANDLE SymFindExecutableImage(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.PCSTR FileName, winmdroot.Foundation.PSTR ImageFilePath, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HANDLE,winmdroot.Foundation.PCSTR,void*,global::Windows.Win32.Foundation.BOOL> Callback, void* CallerData)
#cfunc global SymFindExecutableImage "SymFindExecutableImage" intptr, str, str, int, intptr

; winmdroot.Foundation.BOOL SymFindFileInPath(winmdroot.Foundation.HANDLE hprocess, winmdroot.Foundation.PCSTR SearchPathA, winmdroot.Foundation.PCSTR FileName, [Optional] void* id, uint two, uint three, winmdroot.System.Diagnostics.Debug.SYM_FIND_ID_OPTION flags, winmdroot.Foundation.PSTR FoundFile, delegate *unmanaged[Stdcall]<winmdroot.Foundation.PCSTR,void*,global::Windows.Win32.Foundation.BOOL> callback, [Optional] void* context)
#cfunc global SymFindFileInPath "SymFindFileInPath" intptr, str, str, intptr, int, int, int, str, int, intptr

; winmdroot.Foundation.BOOL SymFromAddr(winmdroot.Foundation.HANDLE hProcess, ulong Address, [Optional] ulong* Displacement, winmdroot.System.Diagnostics.Debug.SYMBOL_INFO* Symbol)
#cfunc global SymFromAddr "SymFromAddr" intptr, int64, var, var

; winmdroot.Foundation.BOOL SymFromIndex(winmdroot.Foundation.HANDLE hProcess, ulong BaseOfDll, uint Index, winmdroot.System.Diagnostics.Debug.SYMBOL_INFO* Symbol)
#cfunc global SymFromIndex "SymFromIndex" intptr, int64, int, var

; winmdroot.Foundation.BOOL SymFromInlineContext(winmdroot.Foundation.HANDLE hProcess, ulong Address, uint InlineContext, [Optional] ulong* Displacement, winmdroot.System.Diagnostics.Debug.SYMBOL_INFO* Symbol)
#cfunc global SymFromInlineContext "SymFromInlineContext" intptr, int64, int, var, var

; winmdroot.Foundation.BOOL SymFromName(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.PCSTR Name, winmdroot.System.Diagnostics.Debug.SYMBOL_INFO* Symbol)
#cfunc global SymFromName "SymFromName" intptr, str, var

; winmdroot.Foundation.BOOL SymFromToken(winmdroot.Foundation.HANDLE hProcess, ulong Base, uint Token, winmdroot.System.Diagnostics.Debug.SYMBOL_INFO* Symbol)
#cfunc global SymFromToken "SymFromToken" intptr, int64, int, var

; void* SymFunctionTableAccess64(winmdroot.Foundation.HANDLE hProcess, ulong AddrBase)
#cfunc global SymFunctionTableAccess64 "SymFunctionTableAccess64" intptr, int64

; void* SymFunctionTableAccess64AccessRoutines(winmdroot.Foundation.HANDLE hProcess, ulong AddrBase, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HANDLE,ulong,void*,uint,uint*,global::Windows.Win32.Foundation.BOOL> ReadMemoryRoutine, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HANDLE,ulong,ulong> GetModuleBaseRoutine)
#cfunc global SymFunctionTableAccess64AccessRoutines "SymFunctionTableAccess64AccessRoutines" intptr, int64, int, int

; winmdroot.Foundation.BOOL SymGetExtendedOption(winmdroot.System.Diagnostics.Debug.IMAGEHLP_EXTENDED_OPTIONS option)
#cfunc global SymGetExtendedOption "SymGetExtendedOption" int

; uint SymGetFileLineOffsets64(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.PCSTR ModuleName, winmdroot.Foundation.PCSTR FileName, ulong* Buffer, uint BufferLines)
#cfunc global SymGetFileLineOffsets64 "SymGetFileLineOffsets64" intptr, str, str, var, int

; winmdroot.Foundation.PSTR SymGetHomeDirectory(uint type, winmdroot.Foundation.PSTR dir, nuint size)
#cfunc global SymGetHomeDirectory "SymGetHomeDirectory" int, str, int

; winmdroot.Foundation.BOOL SymGetLineFromAddr64(winmdroot.Foundation.HANDLE hProcess, ulong qwAddr, uint* pdwDisplacement, winmdroot.System.Diagnostics.Debug.IMAGEHLP_LINE64* Line64)
#cfunc global SymGetLineFromAddr64 "SymGetLineFromAddr64" intptr, int64, var, var

; winmdroot.Foundation.BOOL SymGetLineFromAddrW64(winmdroot.Foundation.HANDLE hProcess, ulong dwAddr, uint* pdwDisplacement, winmdroot.System.Diagnostics.Debug.IMAGEHLP_LINEW64* Line)
#cfunc global SymGetLineFromAddrW64 "SymGetLineFromAddrW64" intptr, int64, var, var

; winmdroot.Foundation.BOOL SymGetLineFromInlineContext(winmdroot.Foundation.HANDLE hProcess, ulong qwAddr, uint InlineContext, ulong qwModuleBaseAddress, uint* pdwDisplacement, winmdroot.System.Diagnostics.Debug.IMAGEHLP_LINE64* Line64)
#cfunc global SymGetLineFromInlineContext "SymGetLineFromInlineContext" intptr, int64, int, int64, var, var

; winmdroot.Foundation.BOOL SymGetLineFromName64(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.PCSTR ModuleName, winmdroot.Foundation.PCSTR FileName, uint dwLineNumber, int* plDisplacement, winmdroot.System.Diagnostics.Debug.IMAGEHLP_LINE64* Line)
#cfunc global SymGetLineFromName64 "SymGetLineFromName64" intptr, str, str, int, var, var

; winmdroot.Foundation.BOOL SymGetLineFromNameW64(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.PCWSTR ModuleName, winmdroot.Foundation.PCWSTR FileName, uint dwLineNumber, int* plDisplacement, winmdroot.System.Diagnostics.Debug.IMAGEHLP_LINEW64* Line)
#cfunc global SymGetLineFromNameW64 "SymGetLineFromNameW64" intptr, wstr, wstr, int, var, var

; winmdroot.Foundation.BOOL SymGetLineNext64(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.Diagnostics.Debug.IMAGEHLP_LINE64* Line)
#cfunc global SymGetLineNext64 "SymGetLineNext64" intptr, var

; winmdroot.Foundation.BOOL SymGetLineNextW64(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.Diagnostics.Debug.IMAGEHLP_LINEW64* Line)
#cfunc global SymGetLineNextW64 "SymGetLineNextW64" intptr, var

; winmdroot.Foundation.BOOL SymGetLinePrev64(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.Diagnostics.Debug.IMAGEHLP_LINE64* Line)
#cfunc global SymGetLinePrev64 "SymGetLinePrev64" intptr, var

; winmdroot.Foundation.BOOL SymGetLinePrevW64(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.Diagnostics.Debug.IMAGEHLP_LINEW64* Line)
#cfunc global SymGetLinePrevW64 "SymGetLinePrevW64" intptr, var

; ulong SymGetModuleBase64(winmdroot.Foundation.HANDLE hProcess, ulong qwAddr)
#cfunc global SymGetModuleBase64 "SymGetModuleBase64" intptr, int64

; winmdroot.Foundation.BOOL SymGetModuleInfo64(winmdroot.Foundation.HANDLE hProcess, ulong qwAddr, winmdroot.System.Diagnostics.Debug.IMAGEHLP_MODULE64* ModuleInfo)
#cfunc global SymGetModuleInfo64 "SymGetModuleInfo64" intptr, int64, var

; winmdroot.Foundation.BOOL SymGetModuleInfoW64(winmdroot.Foundation.HANDLE hProcess, ulong qwAddr, winmdroot.System.Diagnostics.Debug.IMAGEHLP_MODULEW64* ModuleInfo)
#cfunc global SymGetModuleInfoW64 "SymGetModuleInfoW64" intptr, int64, var

; winmdroot.Foundation.BOOL SymGetOmaps(winmdroot.Foundation.HANDLE hProcess, ulong BaseOfDll, winmdroot.System.Diagnostics.Debug.OMAP** OmapTo, ulong* cOmapTo, winmdroot.System.Diagnostics.Debug.OMAP** OmapFrom, ulong* cOmapFrom)
#cfunc global SymGetOmaps "SymGetOmaps" intptr, int64, var, var, var, var

; uint SymGetOptions()
#cfunc global SymGetOptions "SymGetOptions"

; winmdroot.Foundation.BOOL SymGetScope(winmdroot.Foundation.HANDLE hProcess, ulong BaseOfDll, uint Index, winmdroot.System.Diagnostics.Debug.SYMBOL_INFO* Symbol)
#cfunc global SymGetScope "SymGetScope" intptr, int64, int, var

; winmdroot.Foundation.BOOL SymGetSearchPath(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.PSTR SearchPathA, uint SearchPathLength)
#cfunc global SymGetSearchPath "SymGetSearchPath" intptr, str, int

; winmdroot.Foundation.BOOL SymGetSourceFile(winmdroot.Foundation.HANDLE hProcess, ulong Base, winmdroot.Foundation.PCSTR Params, winmdroot.Foundation.PCSTR FileSpec, winmdroot.Foundation.PSTR FilePath, uint Size)
#cfunc global SymGetSourceFile "SymGetSourceFile" intptr, int64, str, str, str, int

; winmdroot.Foundation.BOOL SymGetSourceFileChecksum(winmdroot.Foundation.HANDLE hProcess, ulong Base, winmdroot.Foundation.PCSTR FileSpec, uint* pCheckSumType, byte* pChecksum, uint checksumSize, uint* pActualBytesWritten)
#cfunc global SymGetSourceFileChecksum "SymGetSourceFileChecksum" intptr, int64, str, var, var, int, var

; winmdroot.Foundation.BOOL SymGetSourceFileFromToken(winmdroot.Foundation.HANDLE hProcess, void* Token, winmdroot.Foundation.PCSTR Params, winmdroot.Foundation.PSTR FilePath, uint Size)
#cfunc global SymGetSourceFileFromToken "SymGetSourceFileFromToken" intptr, intptr, str, str, int

; winmdroot.Foundation.BOOL SymGetSourceFileToken(winmdroot.Foundation.HANDLE hProcess, ulong Base, winmdroot.Foundation.PCSTR FileSpec, void** Token, uint* Size)
#cfunc global SymGetSourceFileToken "SymGetSourceFileToken" intptr, int64, str, var, var

; winmdroot.Foundation.BOOL SymGetSourceVarFromToken(winmdroot.Foundation.HANDLE hProcess, void* Token, winmdroot.Foundation.PCSTR Params, winmdroot.Foundation.PCSTR VarName, winmdroot.Foundation.PSTR Value, uint Size)
#cfunc global SymGetSourceVarFromToken "SymGetSourceVarFromToken" intptr, intptr, str, str, str, int

; winmdroot.Foundation.BOOL SymGetSymFromAddr64(winmdroot.Foundation.HANDLE hProcess, ulong qwAddr, [Optional] ulong* pdwDisplacement, winmdroot.System.Diagnostics.Debug.IMAGEHLP_SYMBOL64* Symbol)
#cfunc global SymGetSymFromAddr64 "SymGetSymFromAddr64" intptr, int64, var, var

; winmdroot.Foundation.BOOL SymGetSymFromName64(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.PCSTR Name, winmdroot.System.Diagnostics.Debug.IMAGEHLP_SYMBOL64* Symbol)
#cfunc global SymGetSymFromName64 "SymGetSymFromName64" intptr, str, var

; winmdroot.Foundation.BOOL SymGetSymNext64(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.Diagnostics.Debug.IMAGEHLP_SYMBOL64* Symbol)
#cfunc global SymGetSymNext64 "SymGetSymNext64" intptr, var

; winmdroot.Foundation.BOOL SymGetSymPrev64(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.Diagnostics.Debug.IMAGEHLP_SYMBOL64* Symbol)
#cfunc global SymGetSymPrev64 "SymGetSymPrev64" intptr, var

; winmdroot.Foundation.BOOL SymGetSymbolFile(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.PCSTR SymPath, winmdroot.Foundation.PCSTR ImageFile, uint Type, winmdroot.Foundation.PSTR SymbolFile, nuint cSymbolFile, winmdroot.Foundation.PSTR DbgFile, nuint cDbgFile)
#cfunc global SymGetSymbolFile "SymGetSymbolFile" intptr, str, str, int, str, int, str, int

; winmdroot.Foundation.BOOL SymGetTypeFromName(winmdroot.Foundation.HANDLE hProcess, ulong BaseOfDll, winmdroot.Foundation.PCSTR Name, winmdroot.System.Diagnostics.Debug.SYMBOL_INFO* Symbol)
#cfunc global SymGetTypeFromName "SymGetTypeFromName" intptr, int64, str, var

; winmdroot.Foundation.BOOL SymGetTypeInfo(winmdroot.Foundation.HANDLE hProcess, ulong ModBase, uint TypeId, winmdroot.System.Diagnostics.Debug.IMAGEHLP_SYMBOL_TYPE_INFO GetType, void* pInfo)
#cfunc global SymGetTypeInfo "SymGetTypeInfo" intptr, int64, int, int, intptr

; winmdroot.Foundation.BOOL SymGetTypeInfoEx(winmdroot.Foundation.HANDLE hProcess, ulong ModBase, winmdroot.System.Diagnostics.Debug.IMAGEHLP_GET_TYPE_INFO_PARAMS* Params)
#cfunc global SymGetTypeInfoEx "SymGetTypeInfoEx" intptr, int64, var

; winmdroot.Foundation.BOOL SymGetUnwindInfo(winmdroot.Foundation.HANDLE hProcess, ulong Address, [Optional] void* Buffer, uint* Size)
#cfunc global SymGetUnwindInfo "SymGetUnwindInfo" intptr, int64, intptr, var

; winmdroot.Foundation.BOOL SymInitialize(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.PCSTR UserSearchPath, winmdroot.Foundation.BOOL fInvadeProcess)
#cfunc global SymInitialize "SymInitialize" intptr, str, int

; ulong SymLoadModule64(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.HANDLE hFile, winmdroot.Foundation.PCSTR ImageName, winmdroot.Foundation.PCSTR ModuleName, ulong BaseOfDll, uint SizeOfDll)
#cfunc global SymLoadModule64 "SymLoadModule64" intptr, intptr, str, str, int64, int

; ulong SymLoadModuleEx(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.HANDLE hFile, winmdroot.Foundation.PCSTR ImageName, winmdroot.Foundation.PCSTR ModuleName, ulong BaseOfDll, uint DllSize, [Optional] winmdroot.System.Diagnostics.Debug.MODLOAD_DATA* Data, winmdroot.System.Diagnostics.Debug.SYM_LOAD_FLAGS Flags)
#cfunc global SymLoadModuleEx "SymLoadModuleEx" intptr, intptr, str, str, int64, int, var, int

; winmdroot.Foundation.BOOL SymMatchFileName(winmdroot.Foundation.PCSTR FileName, winmdroot.Foundation.PCSTR Match, [Optional] winmdroot.Foundation.PSTR* FileNameStop, [Optional] winmdroot.Foundation.PSTR* MatchStop)
#cfunc global SymMatchFileName "SymMatchFileName" str, str, var, var

; winmdroot.Foundation.BOOL SymMatchString(winmdroot.Foundation.PCSTR @string, winmdroot.Foundation.PCSTR expression, winmdroot.Foundation.BOOL fCase)
#cfunc global SymMatchString "SymMatchString" int, str, int

; winmdroot.Foundation.BOOL SymNext(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.Diagnostics.Debug.SYMBOL_INFO* si)
#cfunc global SymNext "SymNext" intptr, var

; winmdroot.Foundation.BOOL SymPrev(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.Diagnostics.Debug.SYMBOL_INFO* si)
#cfunc global SymPrev "SymPrev" intptr, var

; winmdroot.Foundation.BOOL SymQueryInlineTrace(winmdroot.Foundation.HANDLE hProcess, ulong StartAddress, uint StartContext, ulong StartRetAddress, ulong CurAddress, uint* CurContext, uint* CurFrameIndex)
#cfunc global SymQueryInlineTrace "SymQueryInlineTrace" intptr, int64, int, int64, int64, var, var

; winmdroot.Foundation.BOOL SymRefreshModuleList(winmdroot.Foundation.HANDLE hProcess)
#cfunc global SymRefreshModuleList "SymRefreshModuleList" intptr

; winmdroot.Foundation.BOOL SymRegisterCallback64(winmdroot.Foundation.HANDLE hProcess, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HANDLE,uint,ulong,ulong,global::Windows.Win32.Foundation.BOOL> CallbackFunction, ulong UserContext)
#cfunc global SymRegisterCallback64 "SymRegisterCallback64" intptr, int, int64

; winmdroot.Foundation.BOOL SymRegisterCallbackW64(winmdroot.Foundation.HANDLE hProcess, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HANDLE,uint,ulong,ulong,global::Windows.Win32.Foundation.BOOL> CallbackFunction, ulong UserContext)
#cfunc global SymRegisterCallbackW64 "SymRegisterCallbackW64" intptr, int, int64

; winmdroot.Foundation.BOOL SymRegisterFunctionEntryCallback64(winmdroot.Foundation.HANDLE hProcess, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HANDLE,ulong,ulong,void*> CallbackFunction, ulong UserContext)
#cfunc global SymRegisterFunctionEntryCallback64 "SymRegisterFunctionEntryCallback64" intptr, int, int64

; winmdroot.Foundation.BOOL SymSearch(winmdroot.Foundation.HANDLE hProcess, ulong BaseOfDll, uint Index, uint SymTag, winmdroot.Foundation.PCSTR Mask, ulong Address, delegate *unmanaged[Stdcall]<global::Windows.Win32.System.Diagnostics.Debug.SYMBOL_INFO*,uint,void*,global::Windows.Win32.Foundation.BOOL> EnumSymbolsCallback, [Optional] void* UserContext, uint Options)
#cfunc global SymSearch "SymSearch" intptr, int64, int, int, str, int64, int, intptr, int

; winmdroot.Foundation.BOOL SymSetContext(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.Diagnostics.Debug.IMAGEHLP_STACK_FRAME* StackFrame, [Optional] void* Context)
#cfunc global SymSetContext "SymSetContext" intptr, var, intptr

; winmdroot.Foundation.BOOL SymSetExtendedOption(winmdroot.System.Diagnostics.Debug.IMAGEHLP_EXTENDED_OPTIONS option, winmdroot.Foundation.BOOL value)
#cfunc global SymSetExtendedOption "SymSetExtendedOption" int, int

; winmdroot.Foundation.PSTR SymSetHomeDirectory(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.PCSTR dir)
#cfunc global SymSetHomeDirectory "SymSetHomeDirectory" intptr, str

; uint SymSetOptions(uint SymOptions)
#cfunc global SymSetOptions "SymSetOptions" int

; winmdroot.Foundation.BOOL SymSetParentWindow(winmdroot.Foundation.HWND hwnd)
#cfunc global SymSetParentWindow "SymSetParentWindow" intptr

; winmdroot.Foundation.BOOL SymSetScopeFromAddr(winmdroot.Foundation.HANDLE hProcess, ulong Address)
#cfunc global SymSetScopeFromAddr "SymSetScopeFromAddr" intptr, int64

; winmdroot.Foundation.BOOL SymSetScopeFromIndex(winmdroot.Foundation.HANDLE hProcess, ulong BaseOfDll, uint Index)
#cfunc global SymSetScopeFromIndex "SymSetScopeFromIndex" intptr, int64, int

; winmdroot.Foundation.BOOL SymSetScopeFromInlineContext(winmdroot.Foundation.HANDLE hProcess, ulong Address, uint InlineContext)
#cfunc global SymSetScopeFromInlineContext "SymSetScopeFromInlineContext" intptr, int64, int

; winmdroot.Foundation.BOOL SymSetSearchPath(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.PCSTR SearchPathA)
#cfunc global SymSetSearchPath "SymSetSearchPath" intptr, str

; winmdroot.Foundation.PCSTR SymSrvDeltaName(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.PCSTR SymPath, winmdroot.Foundation.PCSTR Type, winmdroot.Foundation.PCSTR File1, winmdroot.Foundation.PCSTR File2)
#cfunc global SymSrvDeltaName "SymSrvDeltaName" intptr, str, str, str, str

; winmdroot.Foundation.BOOL SymSrvGetFileIndexInfo(winmdroot.Foundation.PCSTR File, winmdroot.System.Diagnostics.Debug.SYMSRV_INDEX_INFO* Info, uint Flags)
#cfunc global SymSrvGetFileIndexInfo "SymSrvGetFileIndexInfo" str, var, int

; winmdroot.Foundation.BOOL SymSrvGetFileIndexString(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.PCSTR SrvPath, winmdroot.Foundation.PCSTR File, winmdroot.Foundation.PSTR Index, nuint Size, uint Flags)
#cfunc global SymSrvGetFileIndexString "SymSrvGetFileIndexString" intptr, str, str, str, int, int

; winmdroot.Foundation.BOOL SymSrvGetFileIndexes(winmdroot.Foundation.PCSTR File, global::System.Guid* Id, uint* Val1, [Optional] uint* Val2, uint Flags)
#cfunc global SymSrvGetFileIndexes "SymSrvGetFileIndexes" str, var, var, var, int

; winmdroot.Foundation.PCSTR SymSrvGetSupplement(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.PCSTR SymPath, winmdroot.Foundation.PCSTR Node, winmdroot.Foundation.PCSTR File)
#cfunc global SymSrvGetSupplement "SymSrvGetSupplement" intptr, str, str, str

; winmdroot.Foundation.BOOL SymSrvIsStore(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.PCSTR path)
#cfunc global SymSrvIsStore "SymSrvIsStore" intptr, str

; winmdroot.Foundation.PCSTR SymSrvStoreFile(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.PCSTR SrvPath, winmdroot.Foundation.PCSTR File, winmdroot.System.Diagnostics.Debug.SYM_SRV_STORE_FILE_FLAGS Flags)
#cfunc global SymSrvStoreFile "SymSrvStoreFile" intptr, str, str, int

; winmdroot.Foundation.PCSTR SymSrvStoreSupplement(winmdroot.Foundation.HANDLE hProcess, winmdroot.Foundation.PCSTR SrvPath, winmdroot.Foundation.PCSTR Node, winmdroot.Foundation.PCSTR File, uint Flags)
#cfunc global SymSrvStoreSupplement "SymSrvStoreSupplement" intptr, str, str, str, int

; winmdroot.Foundation.BOOL SymUnDName64(winmdroot.System.Diagnostics.Debug.IMAGEHLP_SYMBOL64* sym, winmdroot.Foundation.PSTR UnDecName, uint UnDecNameLength)
#cfunc global SymUnDName64 "SymUnDName64" var, str, int

; winmdroot.Foundation.BOOL SymUnloadModule64(winmdroot.Foundation.HANDLE hProcess, ulong BaseOfDll)
#cfunc global SymUnloadModule64 "SymUnloadModule64" intptr, int64

; uint UnDecorateSymbolName(winmdroot.Foundation.PCSTR name, winmdroot.Foundation.PSTR outputString, uint maxStringLength, uint flags)
#cfunc global UnDecorateSymbolName "UnDecorateSymbolName" str, str, int, int

#endif
