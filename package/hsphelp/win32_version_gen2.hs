; ============================================================
;   version.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
GetFileVersionInfoW
Retrieves version information for the specified file. (GetFileVersionInfoW)
%group
Win32 version
%prm
lptstrFilename, dwHandle, dwLen, lpData
lptstrFilename : [wstr] Type: LPCTSTR The name of the file. If a full path is not specified, the function uses the search sequence specified by the  LoadLibrary function.
dwHandle : [int] Type: DWORD This parameter is ignored.
dwLen : [int] Type: DWORD The size, in bytes, of the buffer pointed to by the lpData parameter. Call the GetFileVersionInfoSize function first to determine the size, in bytes, of a file's version information. The dwLen member should be equal to or greater than that value. If the buffer pointed to by lpData is not large enough, the function truncates the file's version information to the size of the buffer.
lpData : [intptr] Type: LPVOID Pointer to a buffer that receives the file-version information. You can use this value in a subsequent call to the VerQueryValue function to retrieve data from the buffer.
%inst
Retrieves version information for the specified file.
(GetFileVersionInfoW)

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
File version info has fixed and non-fixed part. The fixed part
contains information like version number. The non-fixed part contains
things like strings. In the past GetFileVersionInfo was taking
version information from the binary (exe/dll). Currently, it is
querying fixed version from language neutral file (exe/dll) and the
non-fixed part from mui file, merges them and returns to the user. If
the given binary does not have a mui file then behavior is as in
previous version. Call the GetFileVersionInfoSize function before
calling the GetFileVersionInfo function. To retrieve information from
the file-version information buffer, use the VerQueryValue function.
> [!NOTE] > The winver.h header defines GetFileVersionInfo as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetFileVersionInfoSizeW
Determines whether the operating system can retrieve version information for a specified file. If version information is available, GetFileVersionInfoSize returns the size, in bytes, of that information. (Unicode)
%group
Win32 version
%prm
lptstrFilename, lpdwHandle
lptstrFilename : [wstr] Type: LPCTSTR The name of the file of interest. The function uses the search sequence specified by the  LoadLibrary function.
lpdwHandle : [var] Type: LPDWORD A pointer to a variable that the function sets to zero.
%inst
Determines whether the operating system can retrieve version
information for a specified file. If version information is
available, GetFileVersionInfoSize returns the size, in bytes, of that
information. (Unicode)

[戻り値]
Type: DWORD If the function succeeds, the return value is the size,
in bytes, of the file's version information. If the function fails,
the return value is zero. To get extended error information, call
GetLastError.

[備考]
Call the GetFileVersionInfoSize function before calling the
GetFileVersionInfo function. The size returned by
GetFileVersionInfoSize indicates the buffer size required for the
version information returned by GetFileVersionInfo.
> [!NOTE] > The winver.h header defines GetFileVersionInfoSize as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
VerQueryValueW
Retrieves specified version information from the specified version-information resource. (Unicode)
%group
Win32 version
%prm
pBlock, lpSubBlock, lplpBuffer, puLen
pBlock : [intptr] Type: LPCVOID The version-information resource returned by the GetFileVersionInfo function.
lpSubBlock : [wstr] Type: LPCTSTR The version-information value to be retrieved. The string must consist of names separated by backslashes (\\) and it must have one of the following forms.
lplpBuffer : [var] Type: LPVOID* When this method returns, contains the address of a pointer to the requested version information in the buffer pointed to by pBlock. The memory pointed to by lplpBuffer is freed when the associated pBlock memory is freed.
puLen : [var] Type: PUINT When this method returns, contains a pointer to the size of the requested data pointed to by lplpBuffer: for version information values, the length in characters of the string stored at lplpBuffer; for translation array values, the size in bytes of the array stored at lplpBuffer; and for root block, the size in bytes of the structure.
%inst
Retrieves specified version information from the specified
version-information resource. (Unicode)

[戻り値]
Type: BOOL If the specified version-information structure exists, and
version information is available, the return value is nonzero. If the
address of the length buffer is zero, no value is available for the
specified version-information name. If the specified name does not
exist or the specified resource is not valid, the return value is
zero.

[備考]
This function works on 16-, 32-, and 64-bit file images. The
following are predefined version information Unicode strings.
This doc was truncated.

