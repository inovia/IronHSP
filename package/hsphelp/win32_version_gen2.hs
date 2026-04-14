; ============================================================
;   version.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
GetFileVersionInfoW
指定ファイルのバージョン情報を取得する。(GetFileVersionInfoW)
%group
Win32 version
%prm
lptstrFilename, dwHandle, dwLen, lpData
lptstrFilename : [wstr] 型: LPCTSTR ファイル名。フルパス指定でない場合は LoadLibrary と同じ検索順序を使う。
dwHandle : [int] 型: DWORD このパラメータは無視される。
dwLen : [int] 型: DWORD lpData が指すバッファのサイズ(バイト単位)。先に GetFileVersionInfoSize を呼んで必要サイズを求めること。不十分なサイズを渡すと関数はバージョン情報を切り詰める。
lpData : [intptr] 型: LPVOID ファイルバージョン情報を受け取るバッファへのポインタ。後で VerQueryValue に渡してデータを取り出せる。
%inst
指定ファイルのバージョン情報を取得する。(GetFileVersionInfoW)

[戻り値]
型: BOOL 成功時は 0 以外、失敗時は 0 を返す。拡張エラー情報は GetLastError で取得する。

[備考]
ファイルバージョン情報には固定部と非固定部がある。固定部にはバージョン番号などが含まれ、非固定部には文字列などが含まれる。かつてはバイナリ
(exe/dll) からバージョン情報を取得していたが、現在は言語中立ファイルから固定部を、mui
ファイルから非固定部を取得してマージする。対象バイナリに mui ファイルがない場合は従来と同じ動作。呼び出し前に
GetFileVersionInfoSize を呼ぶこと。取得後のバッファから情報を取り出すには VerQueryValue を使う。
> [!NOTE] > winver.h は UNICODE マクロに応じて GetFileVersionInfo を
ANSI/Unicode 版のエイリアスとして定義する。


%index
GetFileVersionInfoExW
Retrieves version information for the specified file. (GetFileVersionInfoExW)
%group
Win32 version
%prm
dwFlags, lpwstrFilename, dwHandle, dwLen, lpData
dwFlags : [int] Type: DWORD Controls the MUI?DLLs (if any) from which the version resource is extracted. The value of this flag must match the flags passed to the corresponding GetFileVersionInfoSizeEx call, which was used to determine the buffer size that is passed in the dwLen parameter. Zero or more of the following flags.
lpwstrFilename : [wstr] Type: LPCTSTR The name of the file. If a full path is not specified, the function uses the search sequence specified by the LoadLibrary function.
dwHandle : [int] Type: DWORD This parameter is ignored.
dwLen : [int] Type: DWORD The size, in bytes, of the buffer pointed to by the lpData parameter.
lpData : [intptr] Type: LPVOID When this function returns, contains a pointer to a buffer that contains the file-version information. You can use this value in a subsequent call to the VerQueryValue function to retrieve data from the buffer.
%inst
Retrieves version information for the specified file.
(GetFileVersionInfoExW)

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Call the GetFileVersionInfoSizeEx function before calling the
GetFileVersionInfoEx function. To retrieve information from the
file-version information buffer, use the VerQueryValue function.
> [!NOTE] > The winver.h header defines GetFileVersionInfoEx as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetFileVersionInfoSizeW
OS が指定ファイルのバージョン情報を取得できるかを判定し、取得可能ならそのサイズ(バイト単位)を返す。(Unicode)
%group
Win32 version
%prm
lptstrFilename, lpdwHandle
lptstrFilename : [wstr] 型: LPCTSTR 対象ファイルの名前。LoadLibrary と同じ検索順序を使う。
lpdwHandle : [var] 型: LPDWORD 関数が 0 に設定する変数へのポインタ。
%inst
OS が指定ファイルのバージョン情報を取得できるかを判定し、取得可能ならそのサイズ(バイト単位)を返す。(Unicode)

[戻り値]
型: DWORD 成功時はファイルのバージョン情報サイズ(バイト単位)を返す。失敗時は 0。拡張エラー情報は GetLastError
で取得する。

[備考]
GetFileVersionInfo を呼ぶ前に本関数を呼ぶこと。返されたサイズは GetFileVersionInfo
に必要なバッファサイズを示す。
> [!NOTE] > winver.h は UNICODE マクロに応じて GetFileVersionInfoSize を
ANSI/Unicode 版のエイリアスとして定義する。


%index
GetFileVersionInfoSizeExW
Determines whether the operating system can retrieve version information for a specified file. If version information is available, GetFileVersionInfoSizeEx returns the size, in bytes, of that information. (Unicode)
%group
Win32 version
%prm
dwFlags, lpwstrFilename, lpdwHandle
dwFlags : [int] Type: DWORD Controls which MUI?DLLs (if any) from which the version resource is extracted. Zero or more of the following flags.
lpwstrFilename : [wstr] Type: LPCTSTR The name of the file of interest. The function uses the search sequence specified by the  LoadLibrary function.
lpdwHandle : [var] Type: LPDWORD When this function returns, contains a pointer to a variable that is set to zero because this function sets it to zero. This parameter exists for historical reasons.
%inst
Determines whether the operating system can retrieve version
information for a specified file. If version information is
available, GetFileVersionInfoSizeEx returns the size, in bytes, of
that information. (Unicode)

[戻り値]
Type: DWORD If the function succeeds, the return value is the size,
in bytes, of the file's version information.
If the function fails, the return value is zero. To get extended
error information, call GetLastError.

[備考]
Call the GetFileVersionInfoSizeEx function before calling the
GetFileVersionInfoEx function. The size returned by
GetFileVersionInfoSizeEx indicates the buffer size required for the
version information returned by GetFileVersionInfoEx.
> [!NOTE] > The winver.h header defines GetFileVersionInfoSizeEx as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
VerFindFileW
Determines where to install a file based on whether it locates another version of the file in the system. The values VerFindFile returns in the specified buffers are used in a subsequent call to the VerInstallFile function. (Unicode)
%group
Win32 version
%prm
uFlags, szFileName, szWinDir, szAppDir, szCurDir, puCurDirLen, szDestDir, puDestDirLen
uFlags : [int] Type: DWORD This parameter can be the following value. All other bits are reserved.
szFileName : [wstr] Type: LPCTSTR The name of the file to be installed. Include only the file name and extension, not a path.
szWinDir : [wstr] Type: LPCTSTR The directory in which Windows is running or will be run. This string is returned by the  GetWindowsDirectory function.
szAppDir : [wstr] Type: LPCTSTR The directory where the installation program is installing a set of related files. If the installation program is installing an application, this is the directory where the application will reside. This parameter also points to the application's current directory unless otherwise specified.
szCurDir : [wstr] Type: LPWSTR A buffer that receives the path to a current version of the file being installed. The path is a zero-terminated string. If a current version is not installed, the buffer will contain a zero-length string. The buffer should be at least _MAX_PATH characters long, although this is not required.
puCurDirLen : [var] Type: PUINT The length of the szCurDir  buffer. This pointer must not be NULL. When the function returns, lpuCurDirLen contains the size, in characters, of the data returned in szCurDir, including the terminating null character. If the buffer is too small to contain all the data, lpuCurDirLen will be the size of the buffer required to hold the path.
szDestDir : [wstr] Type: LPTSTR A buffer that receives the path to the installation location recommended by VerFindFile. The path is a zero-terminated string. The buffer should be at least _MAX_PATH characters long, although this is not required.
puDestDirLen : [var] Type: PUINT A pointer to a variable that specifies the length of the szDestDir buffer. This pointer must not be NULL. When the function returns, lpuDestDirLen contains the size, in characters, of the data returned in szDestDir, including the terminating null character. If the buffer is too small to contain all the data, lpuDestDirLen will be the size of the buffer needed to hold the path.
%inst
Determines where to install a file based on whether it locates
another version of the file in the system. The values VerFindFile
returns in the specified buffers are used in a subsequent call to the
VerInstallFile function. (Unicode)

[戻り値]
Type: DWORD The return value is a bitmask that indicates the status
of the file. It can be one or more of the following values. All other
values are reserved.
This doc was truncated.

[備考]
This function works on 16-, 32-, and 64-bit file images. VerFindFile
searches for a copy of the specified file by using the OpenFile
function. However, it determines the system directory from the
specified Windows directory, or searches the path. If the dwFlags
parameter indicates that the file is private to this application (not
VFFF_ISSHAREDFILE), VerFindFile recommends installing the file in the
application's directory. Otherwise, if the system is running a shared
copy of the system, the function recommends installing the file in
the Windows directory. If the system is running a private copy of the
system, the function recommends installing the file in the system
directory.
> [!NOTE] > The winver.h header defines VerFindFile as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
VerInstallFileW
Installs the specified file based on information returned from the VerFindFile function. VerInstallFile decompresses the file, if necessary, assigns a unique filename, and checks for errors, such as outdated files. (Unicode)
%group
Win32 version
%prm
uFlags, szSrcFileName, szDestFileName, szSrcDir, szDestDir, szCurDir, szTmpFile, puTmpFileLen
uFlags : [int] Type: DWORD
szSrcFileName : [wstr] Type: LPCTSTR The name of the file to be installed. This is the filename in the directory pointed to by the szSrcDir parameter; the filename can include only the filename and extension, not a path.
szDestFileName : [wstr] Type: LPCTSTR The name VerInstallFile will give the new file upon installation. This file name may be different from the filename in the szSrcFileName directory. The new name should include only the file name and extension, not a path.
szSrcDir : [wstr] Type: LPCTSTR The name of the directory where the file can be found.
szDestDir : [wstr] Type: LPCTSTR The name of the directory where the file should be installed. VerFindFile returns this value in its szDestDir parameter.
szCurDir : [wstr] Type: LPCTSTR The name of the directory where a preexisting version of this file can be found. VerFindFile returns this value in its szCurDir parameter.
szTmpFile : [wstr] Type: LPTSTR The name of a temporary copy of the source file. The buffer should be at least _MAX_PATH characters long, although this is not required, and should be empty on input.
puTmpFileLen : [var] Type: PUINT The length of the szTmpFile buffer. This pointer must not be NULL. When the function returns, lpuTmpFileLen receives the size, in characters, of the data returned in szTmpFile, including the terminating null character. If the buffer is too small to contain all the data, lpuTmpFileLen will be the size of the buffer required to hold the data.
%inst
Installs the specified file based on information returned from the
VerFindFile function. VerInstallFile decompresses the file, if
necessary, assigns a unique filename, and checks for errors, such as
outdated files. (Unicode)

[戻り値]
Type: DWORD The return value is a bitmask that indicates exceptions.
It can be one or more of the following values. All other values are
reserved.
This doc was truncated.

[備考]
This function works on 16-, 32-, and 64-bit file images.
VerInstallFile copies the file from the source directory to the
destination directory. If szCurDir indicates that a previous version
of the file exists on the system, VerInstallFile compares the files'
version stamp information. If the previously installed version of the
file is more recent than the new version, or if the files' attributes
are significantly different, for example, if they are in different
languages, then VerInstallFile returns with one or more recoverable
error codes. VerInstallFile leaves the temporary file in the
destination directory. The application can either override the error
or delete the temporary file. If the application overrides the error,
VerInstallFile deletes the previously installed version and renames
the temporary file with the original filename.
> [!NOTE] > The winver.h header defines VerInstallFile as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
VerQueryValueW
指定のバージョン情報リソースから指定の情報を取得する。(Unicode)
%group
Win32 version
%prm
pBlock, lpSubBlock, lplpBuffer, puLen
pBlock : [intptr] 型: LPCVOID GetFileVersionInfo が返したバージョン情報リソース。
lpSubBlock : [wstr] 型: LPCTSTR 取得するバージョン情報の値。バックスラッシュ (\\) で区切られた名前で構成する。
lplpBuffer : [var] 型: LPVOID* 復帰時、pBlock 内の要求バージョン情報へのポインタを受け取る。pBlock のメモリ解放時に一緒に解放される。
puLen : [var] 型: PUINT 復帰時、lplpBuffer が指すデータのサイズを受け取る。バージョン情報値の場合は文字列の文字数、翻訳配列値の場合は配列のバイト数、ルートブロックの場合は構造体のバイト数。
%inst
指定のバージョン情報リソースから指定の情報を取得する。(Unicode)

[戻り値]
型: BOOL 指定のバージョン情報構造体が存在し情報が取得できれば 0 以外、長さバッファのアドレスが 0
であれば該当名前用の値が存在しない。指定名前が存在しない/リソースが無効の場合は 0 を返す。

[備考]
本関数は 16/32/64 ビットファイルイメージで動作する。定義済みバージョン情報 Unicode 文字列は以下の通り。
（以下省略）

