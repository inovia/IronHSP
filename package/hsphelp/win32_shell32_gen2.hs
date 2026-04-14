; ============================================================
;   shell32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
AssocGetDetailsOfPropKey
Retrieves the value for a given property key using the file association information provided by the Namespace Extensions.
%group
Win32 shell32
%prm
psf, pidl, pkey, pv, pfFoundPropKey
psf : [var] Type: IShellFolder* A pointer to the shell folder for which the details of the property key of the file association are being retrieved.
pidl : [var] Type: PCUITEMID_CHILD The PIDL of the child item for which the file associations are being requested.
pkey : [var] Type: PROPERTYKEY* A pointer to the property key that is being retrieved.
pv : [var] Type: VARIANT* When this function returns, contains the details of the given property key.
pfFoundPropKey : [var] Type: BOOL* When this function returns, contains a flag that is TRUE if the property key was found, otherwise FALSE.
%inst
Retrieves the value for a given property key using the file
association information provided by the Namespace Extensions.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
This function is to be used only by implementers of IShellFolder
Namespace Extensions. Other calling applications should use
IShellFolder2::GetDetailsEx to get a value for a PROPERTYKEY. This
function is to be used by implementers of IShellFolder Namespace
Extensions. The provided namespace extension must support the use of
this API in one of the following three ways.
This doc was truncated.


%index
CDefFolderMenu_Create2
Creates a context menu for a selected group of file folder objects.
%group
Win32 shell32
%prm
pidlFolder, hwnd, cidl, apidl, psf, pfn, nKeys, ahkeys, ppcm
pidlFolder : [var] Type: PCIDLIST_ABSOLUTE An ITEMIDLIST structure for the parent folder. This value can be NULL.
hwnd : [intptr] Type: HWND A handle to the parent window. This value can be NULL.
cidl : [int] Type: UINT The number of ITEMIDLIST structures in the array pointed to by apidl.
apidl : [var] Type: PCUITEMID_CHILD_ARRAY* A pointer to an array of ITEMIDLIST structures, one for each item that is selected.
psf : [var] Type: IShellFolder* A pointer to the parent folder's IShellFolder interface. This IShellFolder must support the IDataObject interface. If it does not, CDefFolderMenu_Create2 fails and returns E_NOINTERFACE. This value can be NULL.
pfn : [int] Type: LPFNDFMCALLBACK The LPFNDFMCALLBACK callback object. This value can be NULL if the callback object is not needed.
nKeys : [int] Type: UINT The number of registry keys in the array pointed to by ahkeys.
ahkeys : [intptr] Type: const HKEY* A pointer to an array of registry keys that specify the context menu handlers used with the menu's entries. For more information on context menu handlers, see Creating Context Menu Handlers. This array can contain a maximum of 16 registry keys.
ppcm : [var] Type: IContextMenu** The address of an IContextMenu interface pointer that, when this function returns successfully, points to the IContextMenu object that represents the context menu.
%inst
Creates a context menu for a selected group of file folder objects.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
CIDLData_CreateFromIDArray
CIDLData_CreateFromIDArray may be altered or unavailable.
%group
Win32 shell32
%prm
pidlFolder, cidl, apidl, ppdtobj
pidlFolder : [var] Type: PCIDLIST_ABSOLUTE A fully qualified IDLIST for the root of the items specified in apidl.
cidl : [int] Type: UINT The number of entries in the apidl array.
apidl : [var] Type: PCUIDLIST_RELATIVE_ARRAY The array of item IDs relative to pidlFolder. Typically, apidl is an array of child IDs and pidlFolder is a full PIDL for those items. However, pidlFolder can be a null PIDL (desktop IDLISTs). In that case, apidl can contain fully qualified ID lists.
ppdtobj : [var] Type: IDataObject** The address to a pointer to the object that implements IDataObject.
%inst
CIDLData_CreateFromIDArray may be altered or unavailable.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
The data object created by this function offers the Shell clipboard
format identifier CFSTR_SHELLIDLIST. This data object also supports
IDataObject::SetData calls to pick up other clipboard formats.


%index
CommandLineToArgvW
Parses a Unicode command line string and returns an array of pointers to the command line arguments, along with a count of such arguments, in a way that is similar to the standard C run-time argv and argc values.
%group
Win32 shell32
%prm
lpCmdLine, pNumArgs
lpCmdLine : [wstr] Type: LPCWSTR Pointer to a null-terminated Unicode string that contains the full command line. If this parameter is an empty string the function returns the path to the current executable file.
pNumArgs : [var] Type: int* Pointer to an int that receives the number of array elements returned, similar to argc.
%inst
Parses a Unicode command line string and returns an array of pointers
to the command line arguments, along with a count of such arguments,
in a way that is similar to the standard C run-time argv and argc
values.

[戻り値]
Type: LPWSTR* A pointer to an array of LPWSTR values, similar to
argv.
If the function fails, the return value is NULL. To get extended
error information, call GetLastError.

[備考]
The address returned by CommandLineToArgvW is the address of the
first element in an array of LPWSTR values; the number of pointers in
this array is indicated by pNumArgs. Each pointer to a
null-terminated Unicode string represents an individual argument
found on the command line. CommandLineToArgvW allocates a block of
contiguous memory for pointers to the argument strings, and for the
argument strings themselves; the calling application must free the
memory used by the argument list when it is no longer needed. To free
the memory, use a single call to the LocalFree function. For more
information about the argv and argc argument convention, see Argument
Definitions and Parsing C Command-Line Arguments. The GetCommandLineW
function can be used to get a command line string that is suitable
for use as the lpCmdLine parameter. This function accepts command
lines that contain a program name; the program name can be enclosed
in quotation marks or not. CommandLineToArgvW has a special
interpretation of backslash characters when they are followed by a
quotation mark character ("). This interpretation assumes that any
preceding argument is a valid file system path, or else it may behave
unpredictably. This special interpretation controls the "in quotes"
mode tracked by the parser. When this mode is off, whitespace
terminates the current argument. When on, whitespace is added to the
argument like all other characters.
This doc was truncated.


%index
DAD_AutoScroll
Scrolls the window while an image is being dragged.
%group
Win32 shell32
%prm
hwnd, pad, pptNow
hwnd : [intptr] Type: HWND A handle to the window being scrolled.
pad : [var] Type: AUTO_SCROLL_DATA* A pointer to the AUTO_SCROLL_DATA structure.
pptNow : [var] Type: const POINT* A pointer to the current scroll coordinates.
%inst
Scrolls the window while an image is being dragged.

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise.

[備考]
The function is successful and the window scrolls only when the bFull
parameter of the AUTO_SCROLL_DATA structure is TRUE. Each time this
function is called, as long as bFull is FALSE, the iNextSample
parameter is incremented by 1 and the current scroll coordinates and
time are returned in the AUTO_SCROLL_DATA structure. When iNextSample
is equal to NUM_POINTS, bFull is set to TRUE, the function succeeds,
and the window scrolls.


%index
DAD_DragEnterEx
Locks updates to the specified window during a drag operation and displays the drag image at the specified position within the window. (DAD_DragEnterEx)
%group
Win32 shell32
%prm
hwndTarget, ptStart
hwndTarget : [intptr] Type: HWND A handle to the window that owns the drag image.
ptStart : [int] Type: const POINT The coordinates at which to begin displaying the drag image. The coordinates are relative to the upper-left corner of the window, not the client area.
%inst
Locks updates to the specified window during a drag operation and
displays the drag image at the specified position within the window.
(DAD_DragEnterEx)

[戻り値]
Type: BOOL Returns TRUE if successful, or FALSE otherwise.


%index
DAD_DragEnterEx2
Locks updates to the specified window during a drag-and-drop operation and displays the drag image at the specified position within the window.
%group
Win32 shell32
%prm
hwndTarget, ptStart, pdtObject
hwndTarget : [intptr] Type: HWND A handle to the window that owns the drag image.
ptStart : [int] Type: const POINT Specifies the coordinates at which to begin displaying the drag image. The coordinates are relative to the upper-left corner of the window, not the client area.
pdtObject : [var] Type: IDataObject* A pointer to the IDataObject interface on the data object. This data object contains the data being transferred in the drag-and-drop operation. If the drop occurs, this data object will be incorporated into the target. This parameter may be NULL.
%inst
Locks updates to the specified window during a drag-and-drop
operation and displays the drag image at the specified position
within the window.

[戻り値]
Type: BOOL Returns TRUE if successful, FALSE otherwise.


%index
DAD_DragLeave
Unlocks the window locked by the DAD_DragEnterEx function.
%group
Win32 shell32
%prm

%inst
Unlocks the window locked by the DAD_DragEnterEx function.

[戻り値]
Type: BOOL Returns SUCCEEDED if successful, or FALSE otherwise.


%index
DAD_DragMove
Moves the image that is being dragged during a drag-and-drop operation.
%group
Win32 shell32
%prm
pt
pt : [int] Type: POINT The coordinates at which to display the drag image. The coordinates are relative to the upper-left corner of the window, not the client area.
%inst
Moves the image that is being dragged during a drag-and-drop
operation.

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise.


%index
DAD_SetDragImage
Sets the drag image.
%group
Win32 shell32
%prm
him, pptOffset
him : [intptr] Type: HIMAGELIST A handle to an image list. This parameter uses the zero index in the ImageList.
pptOffset : [var] Type: POINT* A pointer to the coordinates used as the hot spot for dragging the image. The coordinates are relative to upper-left corner of the image.
%inst
Sets the drag image.

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise.

[備考]
You can clear the drag image by setting the him parameter to -1 and
the pptOffset parameter to NULL. The image must have been set within
the same thread.


%index
DAD_ShowDragImage
Shows or hides the image being dragged. (DAD_ShowDragImage)
%group
Win32 shell32
%prm
fShow
fShow : [int] Type: BOOL A value that specifies whether to show or hide the image being dragged.
%inst
Shows or hides the image being dragged. (DAD_ShowDragImage)

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise.

[備考]
This function works on locked windows. It does not work on layered
windows.


%index
DoEnvironmentSubstW
Parses an input string that contains references to one or more environment variables and replaces them with their fully expanded values. (Unicode)
%group
Win32 shell32
%prm
pszSrc, cchSrc
pszSrc : [wstr] Type: LPTSTR A pointer to a null-terminated string that contains references to one or more environment variables, each in the following form. Case is ignored.
cchSrc : [int] Type: UINT The size, in characters, of the buffer pointed to by pszSrc. Note that the buffer must be large enough to hold the returned string.
%inst
Parses an input string that contains references to one or more
environment variables and replaces them with their fully expanded
values. (Unicode)

[戻り値]
Type: DWORD If the expanded string fits in the buffer, TRUE is
returned in the HIWORD and the length, in characters, of the new
pszSrc is returned in the LOWORD.
If the expanded string is too large for the buffer, FALSE is returned
in the HIWORD and cchSrc in the LOWORD.

[備考]
Parameters must contain valid, non-NULL values. You must validate
these values. Failure to do so can provide unexpected results.
Because the string that is returned in pszSrc will typically be
longer than the input string, make sure that the buffer is large
enough to hold the expanded version of the string. The allotted size
of the cchSrc buffer for ANSI strings must be one larger than the
buffer for a Unicode string. When dealing with ANSI strings, use the
formula buffer size = string length + terminating null character + 1
to determine the minimum correct buffer size. Because environment
variables can be added by the user or applications, the complete list
is system-dependent. The following environment variables are standard
and are available to both interactive applications and services.
This doc was truncated.


%index
DragAcceptFiles
ウィンドウがドロップされたファイルを受け付けるかを登録する。
%group
Win32 shell32
%prm
hWnd, fAccept
hWnd : [intptr] 型: HWND ドロップされたファイルを受け付けるかどうかを登録するウィンドウの識別子。
fAccept : [int] 型: BOOL hWnd で識別されるウィンドウがドロップされたファイルを受け付けるかを示す値。TRUE で受け付け、FALSE で受け付けを中止する。
%inst
ウィンドウがドロップされたファイルを受け付けるかを登録する。

[備考]
fAccept に TRUE を指定して DragAcceptFiles を呼び出したアプリケーションは、ファイルマネージャからの
WM_DROPFILES メッセージを処理できることを示す。


%index
DragFinish
アプリケーションへファイル名を転送するためにシステムが割り当てたメモリを解放する。
%group
Win32 shell32
%prm
hDrop
hDrop : [intptr] 型: HDROP ドロップされたファイルを記述する構造体の識別子。このハンドルは WM_DROPFILES メッセージの wParam から取得する。
%inst
アプリケーションへファイル名を転送するためにシステムが割り当てたメモリを解放する。


%index
DragQueryFileW
ドラッグアンドドロップ操作の結果としてドロップされたファイル名を取得する。(Unicode)
%group
Win32 shell32
%prm
hDrop, iFile, lpszFile, cch
hDrop : [intptr] 型: HDROP ドロップされたファイル名を含む構造体の識別子。
iFile : [int] 型: UINT 照会するファイルのインデックス。0xFFFFFFFF の場合はドロップされたファイル総数を返す。0 から総数の間の値なら対応するインデックスのファイル名を lpszFile にコピーする。
lpszFile : [wstr] 型: LPTSTR ドロップされたファイル名を受け取るバッファのアドレス。NULL 終端文字列。NULL を指定すると必要なバッファサイズ(文字単位)を返す。
cch : [int] 型: UINT lpszFile バッファのサイズ(文字単位)。
%inst
ドラッグアンドドロップ操作の結果としてドロップされたファイル名を取得する。(Unicode)

[戻り値]
型: UINT 0 以外の値は成功を示す。ファイル名をバッファにコピーした場合、戻り値は終端 NULL
を含まないコピーされた文字数。iFile が 0xFFFFFFFF の場合、戻り値はドロップされたファイル数。iFile が 0
から総数の間で lpszFile が NULL の場合、戻り値は必要なバッファサイズ(文字単位、終端 NULL を含まない)。

[備考]
shellapi.h ヘッダは UNICODE プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動選択するエイリアスとして DragQueryFile
を定義している。エンコーディング非中立なコードでエイリアスを混用するとコンパイル時または実行時エラーを招く可能性がある。


%index
DragQueryPoint
ドラッグアンドドロップ操作でファイルがドロップされた時点のマウスポインタ位置を取得する。
%group
Win32 shell32
%prm
hDrop, ppt
hDrop : [intptr] 型: HDROP ドロップされたファイルを記述するドロップ構造体のハンドル。
ppt : [var] 型: POINT* 関数が成功した場合にファイルがドロップされた時のマウスポインタ座標を受け取る POINT 構造体へのポインタ。
%inst
ドラッグアンドドロップ操作でファイルがドロップされた時点のマウスポインタ位置を取得する。

[戻り値]
型: BOOL ウィンドウのクライアント領域内でドロップされた場合は TRUE、そうでなければ FALSE。

[備考]
座標が返されるウィンドウは WM_DROPFILES メッセージを受信したウィンドウ。


%index
DriveType
The DriveType function determines the drive type based on the drive number. (DriveType function)
%group
Win32 shell32
%prm
iDrive
iDrive : [int] Type: int The number of the drive that you want to test. "A:" corresponds to 0, "B:" to 1, and so on.
%inst
The DriveType function determines the drive type based on the drive
number. (DriveType function)

[戻り値]
Type: int Returns one of the following values.
This doc was truncated.

[備考]
DriveType is equivalent to calling RealDriveType. RealDriveType is
the preferred function.


%index
DuplicateIcon
Creates a duplicate of a specified icon.
%group
Win32 shell32
%prm
hInst, hIcon
hInst : [intptr] Type: HINSTANCE
hIcon : [intptr] Type: HICON Handle to the icon to be duplicated.
%inst
Creates a duplicate of a specified icon.

[戻り値]
Type: HICON If successful, the function returns the handle to the new
icon that was created; otherwise, NULL.

[備考]
When it is no longer needed, the caller is responsible for freeing
the icon handle returned by DuplicateIcon by calling the DestroyIcon
function.


%index
ExtractAssociatedIconW
Gets a handle to an icon stored as a resource in a file or an icon stored in a file's associated executable file. (Unicode)
%group
Win32 shell32
%prm
hInst, pszIconPath, piIcon
hInst : [intptr] Type: HINSTANCE A handle to the instance of the calling application.
pszIconPath : [wstr] Type: LPTSTR Pointer to a string that, on entry, specifies the full path and file name of the file that contains the icon. The function extracts the icon handle from that file, or from an executable file associated with that file.
piIcon : [var] Type: LPWORD Pointer to a WORD value that, on entry, specifies the index of the icon whose handle is to be obtained.
%inst
Gets a handle to an icon stored as a resource in a file or an icon
stored in a file's associated executable file. (Unicode)

[戻り値]
Type: HICON If the function succeeds, the return value is an icon
handle. If the icon is extracted from an associated executable file,
the function stores the full path and file name of the executable
file in the string pointed to by lpIconPath, and stores the icon's
identifier in the WORD pointed to by lpiIcon.
If the function fails, the return value is NULL.

[備考]
When it is no longer needed, the caller is responsible for freeing
the icon handle returned by ExtractAssociatedIcon by calling the
DestroyIcon function. The ExtractAssociatedIcon function first looks
for the indexed icon in the file specified by lpIconPath. If the
function cannot obtain the icon handle from that file, and the file
has an associated executable file, it looks in that executable file
for an icon. Associations with executable files are based on file
name extensions and are stored in the per-user part of the registry.
> [!NOTE] > The shellapi.h header defines ExtractAssociatedIcon as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ExtractAssociatedIconExW
ExtractAssociatedIconEx may be altered or unavailable. (Unicode)
%group
Win32 shell32
%prm
hInst, pszIconPath, piIconIndex, piIconId
hInst : [intptr] Type: HINSTANCE The handle of the module from which to extract the icon.
pszIconPath : [wstr] Type: LPTSTR Pointer to a string that, on entry, specifies the full path and file name of the file that contains the icon. The function extracts the icon handle from that file, or from an executable file associated with that file.
piIconIndex : [var] Type: LPWORD Pointer to a WORD value that, on entry, specifies the index of the icon whose handle is to be obtained.
piIconId : [var] Type: LPWORD Pointer to a WORD value that, on entry, specifies the ID of the icon whose handle is to be obtained.
%inst
ExtractAssociatedIconEx may be altered or unavailable. (Unicode)

[戻り値]
Type: HICON Returns the icon's handle if successful, otherwise NULL.

[備考]
The icon handle returned by this function must be released by calling
DestroyIcon when it is no longer needed.
> [!NOTE] > The shellapi.h header defines ExtractAssociatedIconEx as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ExtractIconW
指定された実行ファイル、DLL、またはアイコンファイルからアイコンのハンドルを取得する。大/小アイコンハンドルの配列を取得するには ExtractIconEx を使う。(Unicode)
%group
Win32 shell32
%prm
hInst, pszExeFileName, nIconIndex
hInst : [intptr] 型: HINSTANCE 関数を呼び出すアプリケーションのインスタンスへのハンドル。
pszExeFileName : [wstr] 型: LPCTSTR 実行ファイル、DLL、またはアイコンファイルの名前を指定する NULL 終端文字列へのポインタ。
nIconIndex : [int] 型: UINT 取得するアイコンの 0 ベースインデックス。0 なら最初のアイコンのハンドルを返す。
%inst
指定された実行ファイル、DLL、またはアイコンファイルからアイコンのハンドルを取得する。大/小アイコンハンドルの配列を取得するには
ExtractIconEx を使う。(Unicode)

[戻り値]
型: HICON 戻り値はアイコンへのハンドル。指定ファイルが実行ファイル、DLL、アイコンファイルのいずれでもない場合は
1。アイコンが見つからない場合は NULL。

[備考]
不要になったら DestroyIcon を呼んで ExtractIcon で取得したアイコンハンドルを破棄すること。shellapi.h
ヘッダは UNICODE プリプロセッサ定数に基づき ExtractIcon を ANSI/Unicode 版のエイリアスとして定義する。


%index
ExtractIconExW
The ExtractIconEx function creates an array of handles to large or small icons extracted from the specified executable file, DLL, or icon file. (Unicode)
%group
Win32 shell32
%prm
lpszFile, nIconIndex, phiconLarge, phiconSmall, nIcons
lpszFile : [wstr] Type: LPCTSTR Pointer to a null-terminated string that specifies the name of an executable file, DLL, or icon file from which icons will be extracted.
nIconIndex : [int] Type: int Specifies the zero-based index of the first icon to extract. For example, if this value is zero, the function extracts the first icon in the specified file.
phiconLarge : [intptr] Type: HICON* Pointer to an array of icon handles that receives handles to the large icons extracted from the file. If this parameter is NULL, no large icons are extracted from the file.
phiconSmall : [intptr] Type: HICON* Pointer to an array of icon handles that receives handles to the small icons extracted from the file. If this parameter is NULL, no small icons are extracted from the file.
nIcons : [int] Type: UINT The number of icons to extract from the file.
%inst
The ExtractIconEx function creates an array of handles to large or
small icons extracted from the specified executable file, DLL, or
icon file. (Unicode)

[戻り値]
Type: **UINT** If the *nIconIndex* parameter is -1 and both the
*phiconLarge* and *phiconSmall* parameters are **NULL**, then the
return value is the number of icons contained in the specified file.
If the *nIconIndex* parameter is any value other than -1 and either
*phiconLarge* or *phiconSmall* is not **NULL**, the return value is
the number of icons successfully extracted from the file. > [!NOTE] >
If the function encounters an error, it returns **UINT_MAX**. In this
case, you can call
[GetLastError](../errhandlingapi/nf-errhandlingapi-getlasterror.md)
to retrieve the error code. For example, this function returns
**UINT_MAX** if the file specified by *lpszFile* cannot be found
while the *nIconIndex* parameter is any value other than -1 and
either *phiconLarge* or *phiconSmall* is not **NULL**. In this case,
**GetLastError** returns **ERROR_FILE_NOT_FOUND** (2).

[備考]
When they are no longer needed, you must destroy all icons extracted
by ExtractIconEx by calling the DestroyIcon function. To retrieve the
dimensions of the large and small icons, use this function with the
SM_CXICON, SM_CYICON, SM_CXSMICON, and SM_CYSMICON flags.
> [!NOTE] > The shellapi.h header defines ExtractIconEx as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
FindExecutableW
Retrieves the name of and handle to the executable (.exe) file associated with a specific document file. (Unicode)
%group
Win32 shell32
%prm
lpFile, lpDirectory, lpResult
lpFile : [wstr] Type: LPCTSTR The address of a null-terminated string that specifies a file name. This file should be a document.
lpDirectory : [wstr] Type: LPCTSTR The address of a null-terminated string that specifies the default directory. This value can be NULL.
lpResult : [wstr] Type: LPTSTR The address of a buffer that receives the file name of the associated executable file. This file name is a null-terminated string that specifies the executable file started when an "open" by association is run on the file specified in the lpFile parameter. Put simply, this is the application that is launched when the document file is directly double-clicked or when Open is chosen from the file's shortcut menu. This parameter must contain a valid non-null value and is assumed to be of length MAX_PATH. Responsibility for validating the value is left to the programmer.
%inst
Retrieves the name of and handle to the executable (.exe) file
associated with a specific document file. (Unicode)

[戻り値]
Type: HINSTANCE Returns a value greater than 32 if successful, or a
value less than or equal to 32 representing an error.
The following table lists possible error values.
This doc was truncated.

[備考]
Use FindExecutable for documents. If you want to retrieve the path of
an executable file, use the following:
This doc was truncated.


%index
GetCurrentProcessExplicitAppUserModelID
Retrieves the application-defined, explicit Application User Model ID (AppUserModelID) for the current process.
%group
Win32 shell32
%prm
AppID
AppID : [var] Type: PWSTR* A pointer that receives the address of the AppUserModelID assigned to the process. The caller is responsible for freeing this string with CoTaskMemFree when it is no longer needed.
%inst
Retrieves the application-defined, explicit Application User Model ID
(AppUserModelID) for the current process.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
The AppUserModelID retrieved by this function was set earlier through
SetCurrentProcessExplicitAppUserModelID. An application can only
retrieve an AppUserModelID that has been explicitly set.
System-assigned default AppUserModelIDs cannot be retrieved. If the
application requires knowledge of its AppUserModelID it should set
one explicitly.


%index
GetFileNameFromBrowse
The GetFileNameFromBrowse function creates an Open dialog box so that the user can specify the drive, directory, and name of a file to open.
%group
Win32 shell32
%prm
hwnd, pszFilePath, cchFilePath, pszWorkingDir, pszDefExt, pszFilters, pszTitle
hwnd : [intptr] Type: HWND A handle to the window that owns the dialog box. This member can be any valid window handle, or it can be NULL if the dialog box has no owner.
pszFilePath : [wstr] Type: PWSTR A null-terminated Unicode string that contains a file name used to initialize the File Name edit control. This string corresponds to the OPENFILENAME structure's lpstrFile member and is used in exactly the same way.
cchFilePath : [int] Type: UINT The number of characters in pszFilePath, including the terminating null character.
pszWorkingDir : [wstr] Type: PCWSTR The fully qualified file path of the initial directory. This string corresponds to the OPENFILENAME structure's lpstrInitialDir member and is used in exactly the same way.
pszDefExt : [wstr] Type: PCWSTR A null-terminated Unicode string that contains the default file name extension. This extension is added to pszFilePath if the user does not specify an extension. The string should not contain any '.' characters. If this string is NULL and the user fails to type an extension, no extension is appended.
pszFilters : [wstr] Type: PCWSTR A null-terminated Unicode string that defines the filter. This string corresponds to the OPENFILENAME structure's lpstrFilter member and is used in exactly the same way.
pszTitle : [wstr] Type: PCWSTR A null-terminated Unicode string that is placed in the title bar of the dialog box. If this value is NULL, the system uses the default title.
%inst
The GetFileNameFromBrowse function creates an Open dialog box so that
the user can specify the drive, directory, and name of a file to
open.

[戻り値]
Type: BOOL If the user specifies a file name and clicks OK, the
return value is TRUE. The buffer that pszFilePath points to contains
the full path and file name that the user specifies. If the user
cancels or closes the Open dialog box or an error occurs, the return
value is FALSE.


%index
ILAppendID
Appends or prepends an SHITEMID structure to an ITEMIDLIST structure.
%group
Win32 shell32
%prm
pidl, pmkid, fAppend
pidl : [var] Type: PIDLIST_RELATIVE A pointer to an ITEMIDLIST structure. When the function returns, the SHITEMID structure specified by pmkid is appended or prepended.
pmkid : [var] Type: LPSHITEMID A pointer to a SHITEMID structure to be appended or prepended to pidl.
fAppend : [int] Type: BOOL Value that is set to TRUE to append pmkid to pidl. Set this value to FALSE to prepend pmkid to pidl.
%inst
Appends or prepends an SHITEMID structure to an ITEMIDLIST structure.

[戻り値]
Type: PIDLIST_RELATIVE Returns the ITEMIDLIST structure specified by
pidl, with pmkid appended or prepended. Returns NULL on failure.


%index
ILClone
Clones an ITEMIDLIST structure.
%group
Win32 shell32
%prm
pidl
pidl : [var] Type: PCUIDLIST_RELATIVE A pointer to the ITEMIDLIST structure to be cloned.
%inst
Clones an ITEMIDLIST structure.

[戻り値]
Type: PIDLIST_RELATIVE Returns a pointer to a copy of the ITEMIDLIST
structure pointed to by pidl.

[備考]
When you are finished with the cloned ITEMIDLIST structure, release
it with ILFree to avoid memory leaks.


%index
ILCloneFirst
Clones the first SHITEMID structure in an ITEMIDLIST structure.
%group
Win32 shell32
%prm
pidl
pidl : [var] Type: PCUIDLIST_RELATIVE A pointer to the ITEMIDLIST structure that you want to clone.
%inst
Clones the first SHITEMID structure in an ITEMIDLIST structure.

[戻り値]
Type: PITEMID_CHILD A pointer to an ITEMIDLIST structure that
contains the first SHITEMID structure from the ITEMIDLIST structure
specified by pidl. Returns NULL on failure.


%index
ILCombine
Combines two ITEMIDLIST structures.
%group
Win32 shell32
%prm
pidl1, pidl2
pidl1 : [var] Type: PCIDLIST_ABSOLUTE A pointer to the first ITEMIDLIST structure.
pidl2 : [var] Type: PCUIDLIST_RELATIVE A pointer to the second ITEMIDLIST structure. This structure is appended to the structure pointed to by pidl1.
%inst
Combines two ITEMIDLIST structures.

[戻り値]
Type: PIDLIST_ABSOLUTE Returns an ITEMIDLIST containing the combined
structures. If you set either pidl1 or pidl2 to NULL, the returned
ITEMIDLIST structure is a clone of the non-NULL parameter. Returns
NULL if pidl1 and pidl2 are both set to NULL.


%index
ILCreateFromPathW
The ILCreateFromPathW (Unicode) function returns the ITEMIDLIST structure associated with a specified file path.
%group
Win32 shell32
%prm
pszPath
pszPath : [wstr] Type: PCTSTR A pointer to a null-terminated Unicode string that contains the path. This string should be no more than MAX_PATH characters in length, including the terminating null character.
%inst
The ILCreateFromPathW (Unicode) function returns the ITEMIDLIST
structure associated with a specified file path.

[戻り値]
Type: PIDLIST_ABSOLUTE Returns a pointer to an ITEMIDLIST structure
that corresponds to the path.

[備考]
Call ILFree to release the ITEMIDLIST when you are finished with it.
> [!NOTE] > The shlobj_core.h header defines ILCreateFromPath as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ILFindChild
Determines whether a specified ITEMIDLIST structure is the child of another ITEMIDLIST structure.
%group
Win32 shell32
%prm
pidlParent, pidlChild
pidlParent : [var] Type: PCIDLIST_ABSOLUTE A pointer to the parent ITEMIDLIST structure.
pidlChild : [var] Type: PCIDLIST_ABSOLUTE A pointer to the child ITEMIDLIST structure.
%inst
Determines whether a specified ITEMIDLIST structure is the child of
another ITEMIDLIST structure.

[戻り値]
Type: PUIDLIST_RELATIVE Returns a pointer to the child's simple
ITEMIDLIST structure if pidlChild is a child of pidlParent. The
returned structure consists of pidlChild, minus the SHITEMID
structures that make up pidlParent. Returns NULL if pidlChild is not
a child of pidlParent. Note The returned pointer is a pointer into
the existing parent structure. It is an alias for pidlChild. No new
memory is allocated in association with the returned pointer. It is
not the caller's responsibility to free the returned value.


%index
ILFindLastID
Returns a pointer to the last SHITEMID structure in an ITEMIDLIST structure.
%group
Win32 shell32
%prm
pidl
pidl : [var] Type: PCUIDLIST_RELATIVE A pointer to an ITEMIDLIST structure.
%inst
Returns a pointer to the last SHITEMID structure in an ITEMIDLIST
structure.

[戻り値]
Type: PUITEMID_CHILD A pointer to the last SHITEMID structure in
pidl.

[備考]
This function does not clone the last item, so you do not have to
call ILFree to release the returned pointer.


%index
ILFree
Frees an ITEMIDLIST structure allocated by the Shell.
%group
Win32 shell32
%prm
pidl
pidl : [var] Type: PIDLIST_RELATIVE A pointer to the ITEMIDLIST structure to be freed. This parameter can be NULL.
%inst
Frees an ITEMIDLIST structure allocated by the Shell.

[備考]
ILFree is often used with ITEMIDLIST structures allocated by one of
the other IL functions, but it can be used to free any such structure
returned by the Shell?for example, the ITEMIDLIST structure returned
by SHBrowseForFolder or used in a call to SHGetFolderLocation. Note
When using Windows 2000 or later, use CoTaskMemFree rather than
ILFree. ITEMIDLIST structures are always allocated with the Component
Object Model (COM) task allocator on those platforms.


%index
ILGetNext
Retrieves the next SHITEMID structure in an ITEMIDLIST structure. (ILGetNext)
%group
Win32 shell32
%prm
pidl
pidl : [var] Type: PCUIDLIST_RELATIVE A pointer to a particular SHITEMID structure in a larger ITEMIDLIST structure.
%inst
Retrieves the next SHITEMID structure in an ITEMIDLIST structure.
(ILGetNext)

[戻り値]
Type: PUIDLIST_RELATIVE Returns a pointer to the SHITEMID structure
that follows the one specified by pidl. Returns NULL if pidl points
to the last SHITEMID structure.


%index
ILGetSize
Returns the size, in bytes, of an ITEMIDLIST structure.
%group
Win32 shell32
%prm
pidl
pidl : [var] Type: PCUIDLIST_RELATIVE A pointer to an ITEMIDLIST structure.
%inst
Returns the size, in bytes, of an ITEMIDLIST structure.

[戻り値]
Type: UINT The size of the ITEMIDLIST structure specified by pidl, in
bytes.


%index
ILIsEqual
Tests whether two ITEMIDLIST structures are equal in a binary comparison.
%group
Win32 shell32
%prm
pidl1, pidl2
pidl1 : [var] Type: PCIDLIST_ABSOLUTE The first ITEMIDLIST structure.
pidl2 : [var] Type: PCIDLIST_ABSOLUTE The second ITEMIDLIST structure.
%inst
Tests whether two ITEMIDLIST structures are equal in a binary
comparison.

[戻り値]
Type: BOOL Returns TRUE if the two structures are equal, FALSE
otherwise.

[備考]
ILIsEqual performs a binary comparison of the item data. It is
possible for two ITEMIDLIST structures to differ at the binary level
while referring to the same item. IShellFolder::CompareIDs should be
used to perform a non-binary comparison.


%index
ILIsParent
Tests whether an ITEMIDLIST structure is the parent of another ITEMIDLIST structure.
%group
Win32 shell32
%prm
pidl1, pidl2, fImmediate
pidl1 : [var] Type: PCIDLIST_ABSOLUTE A pointer to an ITEMIDLIST (PIDL) structure that specifies the parent. This must be an absolute PIDL.
pidl2 : [var] Type: PCIDLIST_ABSOLUTE A pointer to an ITEMIDLIST (PIDL) structure that specifies the child. This must be an absolute PIDL.
fImmediate : [int] Type: BOOL A Boolean value that is set to TRUE to test for immediate parents of pidl2, or FALSE to test for any parents of pidl2.
%inst
Tests whether an ITEMIDLIST structure is the parent of another
ITEMIDLIST structure.

[戻り値]
Type: BOOL Returns TRUE if pidl1 is a parent of pidl2. If fImmediate
is set to TRUE, the function only returns TRUE if pidl1 is the
immediate parent of pidl2. Otherwise, the function returns FALSE.


%index
ILLoadFromStreamEx
This function may be altered or unavailable.
%group
Win32 shell32
%prm
pstm, pidl
pstm : [var] Type: IStream* A pointer to the IStream interface from which the absolute ITEMIDLIST loads.
pidl : [var] Type: PIDLIST_ABSOLUTE* When this method returns and succeeds, contains the resulting absolute ITEMIDLIST. If it fails, contains NULL.
%inst
This function may be altered or unavailable.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
For use where STRICT_TYPED_ITEMIDS is defined.


%index
ILRemoveLastID
Removes the last SHITEMID structure from an ITEMIDLIST structure.
%group
Win32 shell32
%prm
pidl
pidl : [var] Type: PUIDLIST_RELATIVE A pointer to the ITEMIDLIST structure to be shortened. When the function returns, this variable points to the shortened structure.
%inst
Removes the last SHITEMID structure from an ITEMIDLIST structure.

[戻り値]
Type: BOOL Returns TRUE if successful, FALSE otherwise.


%index
ILSaveToStream
Saves an ITEMIDLIST structure to a stream.
%group
Win32 shell32
%prm
pstm, pidl
pstm : [var] Type: IStream * A pointer to the IStream interface where the ITEMIDLIST is saved.
pidl : [var] Type: PCUIDLIST_RELATIVE A pointer to the ITEMIDLIST structure to be saved.
%inst
Saves an ITEMIDLIST structure to a stream.

[戻り値]
Type: HRESULT Returns S_OK if successful, or a COM error value
otherwise.

[備考]
The stream must be opened for writing, or ILSaveToStream returns an
error.


%index
InitNetworkAddressControl
Initializes the network address control window class.
%group
Win32 shell32
%prm

%inst
Initializes the network address control window class.

[戻り値]
Type: BOOL TRUE if the initialization succeeded; or FALSE otherwise.

[備考]
The network address control looks like an edit control and offers the
additional functionality of network address verification. The control
uses a balloon tip to display error messages. This function
initializes class WC_NETADDRESS. If this function returns TRUE, the
control can be created.


%index
IsLFNDriveW
(no summary)
%group
Win32 shell32
%prm
pszPath
pszPath : [wstr] 
%inst



%index
IsNetDrive
Tests whether a drive is a network drive.
%group
Win32 shell32
%prm
iDrive
iDrive : [int] Type: int An integer that indicates which drive letter you want to test. Set it to 0 for  A:, 1 for B:, and so on.
%inst
Tests whether a drive is a network drive.

[戻り値]
Type: int This function returns one of the following values.
This doc was truncated.


%index
IsUserAnAdmin
IsUserAnAdmin may be altered or unavailable.
%group
Win32 shell32
%prm

%inst
IsUserAnAdmin may be altered or unavailable.

[戻り値]
Type: BOOL Returns TRUE if the user is a member of the
Administrator's group; otherwise, FALSE.

[備考]
This function is a wrapper for CheckTokenMembership. It is
recommended to call that function directly to determine Administrator
group status rather than calling IsUserAnAdmin.


%index
OpenRegStream
OpenRegStream may be altered or unavailable. Instead, use SHOpenRegStream2 or SHOpenRegStream.
%group
Win32 shell32
%prm
hkey, pszSubkey, pszValue, grfMode
hkey : [intptr] Type: HKEY A handle to the key that is currently open.
pszSubkey : [wstr] Type: PCWSTR A null-terminated Unicode string that specifies the name of the subkey.
pszValue : [wstr] Type: PCWSTR A null-terminated Unicode string that specifies the value to be accessed.
grfMode : [int] Type: DWORD
%inst
OpenRegStream may be altered or unavailable. Instead, use
SHOpenRegStream2 or SHOpenRegStream.

[戻り値]
Type: IStream* Returns the address of an IStream interface if
successful, or NULL otherwise.


%index
PathCleanupSpec
PathCleanupSpec may be altered or unavailable.
%group
Win32 shell32
%prm
pszDir, pszSpec
pszDir : [wstr] Type: PCWSTR A pointer to a null-terminated buffer that contains the fully qualified path of the directory that will contain the file or directory named at pszSpec. The path must not exceed MAX_PATH characters in length, including the terminating null character. This path is not altered.
pszSpec : [wstr] Type: PWSTR A pointer to a null-terminated buffer that contains the file or directory name to be cleaned. In the case of a file, include the file's extension. Note that because '\' is considered an invalid character and will be removed, this buffer cannot contain a path more than one directory deep.
%inst
PathCleanupSpec may be altered or unavailable.

[戻り値]
Type: int Returns one or more of the following values.
This doc was truncated.

[備考]
The following are considered invalid characters in all names.
This doc was truncated.


%index
PathGetShortPath
PathGetShortPath may be altered or unavailable.
%group
Win32 shell32
%prm
pszLongPath
pszLongPath : [wstr] Type: PWSTR A pointer to a null-terminated, Unicode string that contains the long path. When the function returns, it contains the equivalent short path.
%inst
PathGetShortPath may be altered or unavailable.


%index
PathIsExe
PathIsExe may be altered or unavailable.
%group
Win32 shell32
%prm
pszPath
pszPath : [wstr] Type: PCWSTR A pointer to a null-terminated, Unicode string that contains the file path, which includes the name of the file.
%inst
PathIsExe may be altered or unavailable.

[戻り値]
Type: BOOL Returns TRUE if the file name extension is .cmd, .bat,
.pif, .scf, .exe, .com, or .scr; otherwise, FALSE.


%index
PathIsSlowW
PathIsSlow may be altered or unavailable. (Unicode)
%group
Win32 shell32
%prm
pszFile, dwAttr
pszFile : [wstr] Type: LPCTSTR A pointer to a null-terminated string that contains the fully qualified path of the file.
dwAttr : [int] Type: DWORD The file attributes, if known; otherwise, pass ?1 and this function gets the attributes by calling GetFileAttributes. See GetFileAttributes for a list of file attributes.
%inst
PathIsSlow may be altered or unavailable. (Unicode)

[戻り値]
Type: BOOL Returns TRUE if the connection is high-latency; otherwise,
FALSE.

[備考]
A path is considered slow if the MultinetGetConnectionPerformance
function returns a dwSpeed of 400 or less in its NETCONNECTINFOSTRUCT
structure?this is the speed of the media to the network resource, in
100 bits-per-second (bps)?or if FILE_ATTRIBUTE_OFFLINE is set on the
file. Note that network conditions can impact function performance
time.
> [!NOTE] > The shlobj.h header defines PathIsSlow as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
PathMakeUniqueName
Creates a unique path name from a template.
%group
Win32 shell32
%prm
pszUniqueName, cchMax, pszTemplate, pszLongPlate, pszDir
pszUniqueName : [wstr] Type: PWSTR A buffer that receives a null-terminated Unicode string that contains the unique path name. It should be at least MAX_PATH characters in length.
cchMax : [int] Type: UINT The number of characters in the buffer pointed to by pszUniqueName.
pszTemplate : [wstr] Type: PCWSTR A null-terminated Unicode string that contains a template that is used to construct the unique name. This template is used for drives that require file names with the 8.3 format. This string should be no more than MAX_PATH characters in length, including the terminating null character.
pszLongPlate : [wstr] Type: PCWSTR A null-terminated Unicode string that contains a template that is used to construct the unique name. This template is used for drives that support long file names. This string should be no more than MAX_PATH characters in length, including the terminating null character.
pszDir : [wstr] Type: PCWSTR A null-terminated string that contains the directory in which the new file resides. This string should be no more than MAX_PATH characters in length, including the terminating null character.
%inst
Creates a unique path name from a template.

[戻り値]
Type: BOOL Returns TRUE if successful; otherwise, FALSE.

[備考]
This function generates a new unique file name based on the templates
specified by pszTemplate, for drives that require the 8.3 format, and
pszLongPlate for drives that support long file names. For example, if
you specify "My New Filename" for pszLongPlate, PathMakeUniqueName
returns names such as "My New Filename (1)", "My New Filename (2)",
and so on.


%index
PathQualify
(no summary)
%group
Win32 shell32
%prm
psz
psz : [wstr] 
%inst



%index
PathResolve
PathResolve may be altered or unavailable.
%group
Win32 shell32
%prm
pszPath, dirs, fFlags
pszPath : [wstr] Type: PWSTR A null-terminated Unicode string that contains the path to resolve. When the function returns, the string contains the corresponding fully qualified path. This buffer should be at least MAX_PATH characters long.
dirs : [var] Type: PZPCWSTR A pointer to an optional null-terminated array of directories to be searched first in the case that the path cannot be resolved from pszPath. This value can be NULL.
fFlags : [int] Type: UINT Flags that specify how the function operates.
%inst
PathResolve may be altered or unavailable.

[戻り値]
Type: int Returns TRUE, unless PRF_VERIFYEXISTS is set. If that flag
is set, the function returns TRUE if the file is verified to exist
and FALSE otherwise. It also sets an ERROR_FILE_NOT_FOUND error code
that you can retrieve by calling GetLastError.

[備考]
A FALSE return value does not necessarily mean that the file does not
exist. It might mean that the function is simply unable to find the
file from the supplied information. If PathResolve cannot resolve the
path specified in pszPath, it calls PathFindOnPath using pszPath and
dirs as the parameters.


%index
PathYetAnotherMakeUniqueName
Creates a unique filename based on an existing filename.
%group
Win32 shell32
%prm
pszUniqueName, pszPath, pszShort, pszFileSpec
pszUniqueName : [wstr] Type: PWSTR A string buffer that receives a null-terminated Unicode string that contains the fully qualified path of the unique file name. This buffer should be at least MAX_PATH characters long to avoid causing a buffer overrun.
pszPath : [wstr] Type: PCWSTR A null-terminated Unicode string that contains the fully qualified path of folder that will contain the new file. If pszShort is set to NULL, this string must contain a full destination path, ending with the long file name that the new file name will be base on.
pszShort : [wstr] Type: PCWSTR A null-terminated Unicode string that contains the short file name that the unique name will be based on. Set this value to NULL to create a name based on the long file name.
pszFileSpec : [wstr] Type: PCWSTR A null-terminated Unicode string that contains the long file name that the unique name will be based on.
%inst
Creates a unique filename based on an existing filename.

[戻り値]
Type: BOOL Returns TRUE if a unique name was successfully created;
otherwise FALSE.

[備考]
If the generated path exceeds MAX_PATH characters, this function may
return a truncated string in PathYetAnotherMakeUniqueName. In that
case, the function returns FALSE.


%index
PickIconDlg
PickIconDlg may be altered or unavailable.
%group
Win32 shell32
%prm
hwnd, pszIconPath, cchIconPath, piIconIndex
hwnd : [intptr] Type: HWND The handle of the parent window. This value can be NULL.
pszIconPath : [wstr] Type: PWSTR A pointer to a string that contains the null-terminated, fully qualified path of the default resource that contains the icons. If the user chooses a different resource in the dialog, this buffer contains the path of that file when the function returns. This buffer should be at least MAX_PATH characters in length, or the returned path may be truncated. You should verify that the path is valid before using it.
cchIconPath : [int] Type: UINT The number of characters in pszIconPath, including the terminating NULL character.
piIconIndex : [var] Type: int* A pointer to an integer that on entry specifies the index of the initial selection and, when this function returns successfully, receives the index of the icon that was selected.
%inst
PickIconDlg may be altered or unavailable.

[戻り値]
Type: int Returns 1 if successful; otherwise, 0.


%index
PifMgr_CloseProperties
Closes application properties that were opened with PifMgr_OpenProperties.
%group
Win32 shell32
%prm
hProps, flOpt
hProps : [intptr] Type: HANDLE A handle to the application's properties. This parameter should be set to the value that is returned by PifMgr_OpenProperties.
flOpt : [int] Type: UINT A flag that specifies how the function operates.
%inst
Closes application properties that were opened with
PifMgr_OpenProperties.

[戻り値]
Type: int Returns NULL if successful. If unsuccessful, the functions
returns the handle to the application properties that was passed as
hProps.


%index
PifMgr_GetProperties
Returns a specified block of data from a .pif file.
%group
Win32 shell32
%prm
hProps, pszGroup, lpProps, cbProps, flOpt
hProps : [intptr] Type: HANDLE A handle to an application's properties. This parameter should be set to the value that is returned by PifMgr_OpenProperties.
pszGroup : [str] Type: PCSTR A null-terminated string that contains the property group name. It can be one of the following, or any other name that corresponds to a valid .pif extension.
lpProps : [intptr] Type: void* When this function returns, contains a pointer to a PROPPRG structure.
cbProps : [int] Type: int The size of the buffer, in bytes, pointed to by lpProps.
flOpt : [int] Type: UINT Set this parameter to GETPROPS_NONE.
%inst
Returns a specified block of data from a .pif file.

[戻り値]
Type: int Returns NULL if successful. If unsuccessful, the function
returns the handle to the application properties that were passed as
hProps.

[備考]
If the block is a "named" block, it must be the name of a linked
extension inside the .pif file. This can be any predefined name (such
as, "WINDOWS 386 3.0") or the name of your own block. You can create
your own named data blocks using PifMgr_SetProperties. Named data can
also be thought of as raw data, because it is returned to the calling
application as it is, without translation. The size of a named block
can be determined by calling PifMgr_GetProperties with cbProps set to
0. No data is copied, but the size of the requested block is
returned. All named blocks can be enumerated by setting pszGroup to
NULL. lpProps must be a pointer to a 16-byte buffer to contain the
requested block name, and cbProps must be set to the zero-based block
index. The return value is the size of the block, or zero if the
block is not found. If you request an unnamed property block by
setting the selector of the name parameter to NULL, and the offset is
a property group ordinal, then the associated structure is returned.
For example, PifMgr_GetProperties(GROUP_TSK) returns a predefined
structure that contains all the task-related information in a format
that is independent of the .pif file. This is a valuable service
because it relieves calling applications from dealing with .pif files
that contain a wide variety of sections (known as .pif extensions),
when only one is required.


%index
PifMgr_OpenProperties
Opens the .pif file associated with a Microsoft MS-DOS application, and returns a handle to the application's properties.
%group
Win32 shell32
%prm
pszApp, pszPIF, hInf, flOpt
pszApp : [wstr] Type: PCWSTR A null-terminated Unicode string that contains the application's name.
pszPIF : [wstr] Type: PCWSTR A null-terminated Unicode string that contains the name of the .pif file.
hInf : [int] Type: UINT A handle to the application's .inf file. Set this value to zero if there is no .inf file. Set this value to -1 to prevent the .inf file from being processed.
flOpt : [int] Type: UINT A flag that controls how the function operates.
%inst
Opens the .pif file associated with a Microsoft MS-DOS application,
and returns a handle to the application's properties.

[戻り値]
Type: HANDLE Returns a handle to the application's properties. Use
this handle when you call the related .pif functions.

[備考]
You should not think of PifMgr_OpenProperties as a function that
opens a file somewhere. The .pif file does not remain open after this
call. It is more useful to think of the function as a property
structure allocator that you can initialize using disk data. The
primary reason why this function fails is because of low memory or
inability to open the specified .pif file. If no .pif file exists,
the function still allocates a data block in memory and initializes
it with data from _Default.pif or its internal defaults. If the
function looks for a .pif file name but does not find it, it
constructs a name and saves it in its internal .pif data structure.
This guarantees that if PifMgr_SetProperties is called, the data is
saved to disk. If the function does not find the .pif file, it
searches for it in the following order.
This doc was truncated.


%index
PifMgr_SetProperties
Assigns values to a block of data from a .pif file.
%group
Win32 shell32
%prm
hProps, pszGroup, lpProps, cbProps, flOpt
hProps : [intptr] Type: HANDLE A handle to the application's properties. This parameter should be set to the value that is returned by PifMgr_OpenProperties.
pszGroup : [str] Type: PCSTR A null-terminated ANSI string containing the property group name. It can be one of the following, or any other name that corresponds to a valid .pif extension.
lpProps : [intptr] Type: const void* A property group record buffer that holds the data.
cbProps : [int] Type: int The size of the buffer, in bytes, pointed to by lpProps.
flOpt : [int] Type: UINT Always SETPROPS_NONE.
%inst
Assigns values to a block of data from a .pif file.

[戻り値]
Type: int Returns the amount of information transferred, in bytes.
Returns zero if the group cannot be found or an error occurs.


%index
ReadCabinetState
ReadCabinetState may be altered or unavailable.
%group
Win32 shell32
%prm
pcs, cLength
pcs : [var] Type: CABINETSTATE* When this function returns, contains a pointer to a CABINETSTATE structure that contains either information pulled from the registry or default information.
cLength : [int] Type: int The size of the structure pointed to by pcs, in bytes.
%inst
ReadCabinetState may be altered or unavailable.

[戻り値]
Type: BOOL Returns TRUE if the returned structure contains
information from the registry. Returns FALSE if the structure
contains default information.


%index
RealDriveType
RealDriveType may be altered or unavailable.
%group
Win32 shell32
%prm
iDrive, fOKToHitNet
iDrive : [int] Type: int The number of the drive that you want to test. "A:" corresponds to 0, "B:" to 1, and so on.
fOKToHitNet : [int] Type: BOOL Reserved. Must be set to 0.
%inst
RealDriveType may be altered or unavailable.

[戻り値]
Type: int Returns one of the following values.
This doc was truncated.


%index
RestartDialog
Displays a dialog box that prompts the user to restart Windows. When the user clicks the button, the function calls ExitWindowsEx to attempt to restart Windows.
%group
Win32 shell32
%prm
hwnd, pszPrompt, dwReturn
hwnd : [intptr] Type: HWND A handle to the parent window.
pszPrompt : [wstr] Type: PCWSTR A null-terminated Unicode string that contains the text that displays in the dialog box which prompts the user.
dwReturn : [int] Type: DWORD The flags that specify the type of shutdown.
%inst
Displays a dialog box that prompts the user to restart Windows. When
the user clicks the button, the function calls ExitWindowsEx to
attempt to restart Windows.

[戻り値]
Type: int Returns the identifier of the button that was pressed to
close the dialog box.


%index
RestartDialogEx
Displays a dialog box that asks the user to restart Windows. When the user clicks the button, the function calls ExitWindowsEx to attempt to restart Windows.
%group
Win32 shell32
%prm
hwnd, pszPrompt, dwReturn, dwReasonCode
hwnd : [intptr] Type: HWND A handle to the parent window.
pszPrompt : [wstr] Type: PCWSTR A null-terminated string that contains the text that displays in the dialog box to prompt the user.
dwReturn : [int] Type: DWORD The flags that specify the type of shutdown.
dwReasonCode : [int] Type: DWORD Windows XP:Specifies the reason for initiating the shutdown. For more information, see System Shutdown Reason Codes.
%inst
Displays a dialog box that asks the user to restart Windows. When the
user clicks the button, the function calls ExitWindowsEx to attempt
to restart Windows.

[戻り値]
Type: int Returns the identifier of the button that was pressed to
close the dialog box.


%index
SHAddDefaultPropertiesByExt
Adds default properties to the property store as registered for the specified file extension.
%group
Win32 shell32
%prm
pszExt, pPropStore
pszExt : [wstr] Type: PCWSTR A pointer to a null-terminated, Unicode string that specifies the extension.
pPropStore : [var] Type: IPropertyStore* A pointer to the IPropertyStore interface that defines the default properties to add.
%inst
Adds default properties to the property store as registered for the
specified file extension.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
The list of properties used to set a default value comes from the
SetDefaultsFor registry value of the ProgID for the file association
of the specified file extension. The list is prefixed by "prop:" and
contains the canonical names of the properties to set the default
value, such as: "prop:System.Author;System.Document.DateCreated". The
possible properties for this list are System.Author,
System.Document.DateCreated, and System.Photo.DateTaken. If the
SetDefaultsFor value does not exist on the ProgID, this function uses
the default found on the SetDefaultsFor value of HKEY_CLASSES_ROOT\*.
System.Author has the value of the user that performed the action.
System.Document.DateCreated and System.Photo.DateTaken use the
current date. These three properties are the only ones for which the
system provides special defaults. Note that there are several types
of properties:
This doc was truncated.


%index
SHDestroyPropSheetExtArray
Frees property sheet handlers that are pointed to an array created by SHCreatePropSheetExtArray.
%group
Win32 shell32
%prm
hpsxa
hpsxa : [intptr] Type: HPSXA The handle of the array that contains pointers to the property sheet handlers to destroy.
%inst
Frees property sheet handlers that are pointed to an array created by
SHCreatePropSheetExtArray.


%index
SHAddFromPropSheetExtArray
Adds pages to a property sheet extension array created by SHCreatePropSheetExtArray.
%group
Win32 shell32
%prm
hpsxa, lpfnAddPage, lParam
hpsxa : [intptr] Type: HPSXA The array of property sheet handlers returned by SHCreatePropSheetExtArray.
lpfnAddPage : [int] Type: LPFNADDPROPSHEETPAGE A pointer to an AddPropSheetPageProc callback function. It is called once for each property sheet handler. The callback function then returns the information needed to add a page to the handler's property sheet.
lParam : [intptr] Type: LPARAM A pointer to application-defined data. This data is passed to the callback function specified by lpfnAddPage.
%inst
Adds pages to a property sheet extension array created by
SHCreatePropSheetExtArray.

[戻り値]
Type: UINT Returns the number of pages actually added.

[備考]
This function should be called only once for the property sheet
extension array named in hpsxa. This function calls each extension's
IShellPropSheetExt::AddPages method. See that page for further
details.


%index
SHAddToRecentDocs
Notifies the system that an item has been accessed, for the purposes of tracking those items used most recently and most frequently. This function can also be used to clear all usage data.
%group
Win32 shell32
%prm
uFlags, pv
uFlags : [int] Type: UINT A value from the SHARD enumeration that indicates the form of the information pointed to by the pv parameter.
pv : [intptr] Type: LPCVOID A pointer to data that identifies the item that has been accessed. The item can be specified in this parameter in one of the following forms:
%inst
Notifies the system that an item has been accessed, for the purposes
of tracking those items used most recently and most frequently. This
function can also be used to clear all usage data.

[備考]
The usage statistics gathered through calls to this method are used
to determine lists of items accessed most recently and most
frequently. These lists are seen in the Start menu and, in Windows 7
and later, in an application's Jump List. When this method is called,
it affects the following areas:
This doc was truncated.


%index
SHAlloc
Allocates memory from the Shell's heap.
%group
Win32 shell32
%prm
cb
cb : [int] Type: SIZE_T The number of bytes of memory to allocate.
%inst
Allocates memory from the Shell's heap.

[戻り値]
Type: LPVOID A pointer to the allocated memory.

[備考]
You can free this memory by calling SHFree.


%index
SHAssocEnumHandlers
Returns an enumeration object for a specified set of file name extension handlers.
%group
Win32 shell32
%prm
pszExtra, afFilter, ppEnumHandler
pszExtra : [wstr] Type: PCWSTR A pointer to a null-terminated buffer that contains a single file type extension, for instance ".jpg". Only handlers associated with the given extension are enumerated. This parameter may not be **NULL**.
afFilter : [int] Type: ASSOC_FILTER
ppEnumHandler : [var] Type: IEnumAssocHandlers** When this method returns, contains the address of a pointer to an IEnumAssocHandlers object.
%inst
Returns an enumeration object for a specified set of file name
extension handlers.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHAssocEnumHandlersForProtocolByApplication
Gets an enumeration interface that provides access to handlers associated with a given protocol.
%group
Win32 shell32
%prm
protocol, riid, enumHandlers
protocol : [wstr] Type: PCWSTR Pointer to a string that specifies the protocol.
riid : [var] Type: REFIID A reference to the IID of the interface to retrieve through enumHandlers, typically IID_IEnumAssocHandlers.
enumHandlers : [var] Type: void** When this method returns, contains the interface pointer requested in riid. This is typically IEnumAssocHandlers.
%inst
Gets an enumeration interface that provides access to handlers
associated with a given protocol.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
It is recommended that you use the IID_PPV_ARGS macro, defined in
Objbase.h, to package the riid and enumHandlers parameters. This
macro provides the correct IID based on the interface pointed to by
the value in enumHandlers, which eliminates the possibility of a
coding error.


%index
SHBindToFolderIDListParent
Given a Shell namespace item specified in the form of a folder, and an item identifier list relative to that folder, this function binds to the parent of the namespace item and optionally returns a pointer to the final component of the item identifier list.
%group
Win32 shell32
%prm
psfRoot, pidl, riid, ppv, ppidlLast
psfRoot : [var] Type: IShellFolder* A pointer to a Shell folder object. If psfRoot is NULL, indicates that the IDList passed is relative to the desktop.
pidl : [var] Type: PCUIDLIST_RELATIVE A PIDL to bind to, relative to psfRoot. If psfRoot is NULL, this is an absolute IDList relative to the desktop folder.
riid : [var] Type: REFIID Reference to the desired interface ID. This is typically IID_IShellFolder or IID_IShellFolder2, but can be anything supported by the target folder.
ppv : [var] Type: void** When this function returns, contains the interface pointer requested in riid. This is typically IShellFolder or IShellFolder2, but can be anything supported by the target folder.
ppidlLast : [var] Type: PCUITEMID_CHILD* A pointer to the last ID of the pidl parameter, and is a child ID relative to the parent folder returned in ppv. This value can be NULL.
%inst
Given a Shell namespace item specified in the form of a folder, and
an item identifier list relative to that folder, this function binds
to the parent of the namespace item and optionally returns a pointer
to the final component of the item identifier list.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
Note Calling the SHBindToFolderIDListParent function is equivalent to
calling the SHBindToFolderIDListParentEx function with NULL as the
bind context.


%index
SHBindToFolderIDListParentEx
Extends the SHBindToFolderIDListParent function by allowing the caller to specify a bind context.
%group
Win32 shell32
%prm
psfRoot, pidl, ppbc, riid, ppv, ppidlLast
psfRoot : [var] Type: IShellFolder* A pointer to a Shell folder object. If psfRoot is NULL, indicates that the IDList passed is relative to the desktop.
pidl : [var] Type: PCUIDLIST_RELATIVE A PIDL to bind to, relative to psfRoot. If psfRoot is NULL, this is an absolute IDList relative to the desktop folder.
ppbc : [var] Type: IBindCtx* A pointer to IBindCtx interface on a bind context object to be used during this operation. If this parameter is not used, set it to NULL, which is equivalent to calling the SHBindToFolderIDListParent function. Because support for pbc is optional for folder object implementations, some folders may not support the use of bind contexts.
riid : [var] Type: REFIID Reference to the desired interface ID. This is typically IID_IShellFolder or IID_IShellFolder2, but can be anything supported by the target folder.
ppv : [var] Type: void** When this function returns, contains the interface pointer requested in riid. This is typically IShellFolder or IShellFolder2, but can be anything supported by the target folder.
ppidlLast : [var] Type: PCUITEMID_CHILD* A pointer to the last ID of the pidl parameter, and is a child ID relative to the parent folder returned in ppv. This value can be NULL.
%inst
Extends the SHBindToFolderIDListParent function by allowing the
caller to specify a bind context.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHBindToObject
Retrieves and binds to a specified object by using the Shell namespace IShellFolder::BindToObject method.
%group
Win32 shell32
%prm
psf, pidl, pbc, riid, ppv
psf : [var] Type: IShellFolder* A pointer to IShellFolder. This parameter can be NULL.   If psf is NULL,  this indicates parameter pidl is relative to the desktop. In this case, pidl must specify an absolute ITEMIDLIST.
pidl : [var] Type: PCUIDLIST_RELATIVE A pointer to a constant ITEMIDLIST to bind to that is relative to psf. If psf is NULL, this is an absolute ITEMIDLIST relative to the desktop folder.
pbc : [var] Type: IBindCtx* A pointer to IBindCtx interface on a bind context object to be used during this operation. If this parameter is not used, set it to NULL. Because support for pbc is optional for folder object implementations, some folders may not support the use of bind contexts.
riid : [var] Type: REFIID Identifier of the interface to return.
ppv : [var] Type: void** When this method returns, contains the interface pointer as specified in riid to the bound object. If an error occurs, contains a NULL pointer.
%inst
Retrieves and binds to a specified object by using the Shell
namespace IShellFolder::BindToObject method.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
Note This is a helper function that gets the desktop object by
calling SHGetDesktopFolder.


%index
SHBindToParent
Takes a pointer to a fully qualified item identifier list (PIDL), and returns a specified interface pointer on the parent object.
%group
Win32 shell32
%prm
pidl, riid, ppv, ppidlLast
pidl : [var] Type: PCIDLIST_ABSOLUTE The item's PIDL.
riid : [var] Type: REFIID The REFIID of one of the interfaces exposed by the item's parent object.
ppv : [var] Type: VOID** A pointer to the interface specified by riid. You must release the object when you are finished.
ppidlLast : [var] Type: PCUITEMID_CHILD* The item's PIDL relative to the parent folder. This PIDL can be used with many of the methods supported by the parent folder's interfaces. If you set ppidlLast to NULL, the PIDL is not returned.
%inst
Takes a pointer to a fully qualified item identifier list (PIDL), and
returns a specified interface pointer on the parent object.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHBrowseForFolderW
ユーザが Shell フォルダを選択できるダイアログボックスを表示する。(Unicode)
%group
Win32 shell32
%prm
lpbi
lpbi : [var] 型: LPBROWSEINFO ダイアログボックスの表示に使用する情報を含む BROWSEINFO 構造体へのポインタ。
%inst
ユーザが Shell フォルダを選択できるダイアログボックスを表示する。(Unicode)

[戻り値]
型: PIDLIST_ABSOLUTE 名前空間のルートからの選択フォルダの位置を指定する PIDL
を返す。ユーザがキャンセルボタンを押した場合は NULL。
返される PIDL はフォルダ自体ではなくフォルダショートカットの場合があることに注意。

[備考]
Windows Vista 以降では SHBrowseForFolder ではなく IFileDialog を
FOS_PICKFOLDERS オプションで使うことが推奨される。SHBrowseForFolder を呼び出す前に COM
を初期化する必要がある。CoInitializeEx で初期化する場合、dwCoInit に
COINIT_APARTMENTTHREADED を設定する。COINIT_MULTITHREADED で初期化した COM で
BIF_USENEWUI や BIF_NEWDIALOGSTYLE を使うと失敗する。返される IDList は
CoTaskMemFree で解放する。
（以下省略）


%index
SHCLSIDFromString
Takes the string form of a class identifier (CLSID) and creates the corresponding CLSID.
%group
Win32 shell32
%prm
psz, pclsid
psz : [wstr] Type: PCWSTR A Unicode string that contains the CLSID in the format, {xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}.
pclsid : [var] Type: CLSID* A pointer to a CLSID value that, when this function returns successfully, receives the converted string as a CLSID.
%inst
Takes the string form of a class identifier (CLSID) and creates the
corresponding CLSID.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHChangeNotification_Lock
Locks the shared memory associated with a Shell change notification event.
%group
Win32 shell32
%prm
hChange, dwProcId, pppidl, plEvent
hChange : [intptr] Type: HANDLE A handle to a window received as a wParam in the specified Shell change notification message.
dwProcId : [int] Type: DWORD The process ID (lParam in the message callback).
pppidl : [var] Type: PIDLIST_ABSOLUTE** The address of a pointer to a PIDLIST_ABSOLUTE that, when this function returns successfully, receives the list of affected PIDLs.
plEvent : [var] Type: LONG* A pointer to a LONG value that, when this function returns successfully, receives the Shell change notification ID of the event that took place.
%inst
Locks the shared memory associated with a Shell change notification
event.

[戻り値]
Type: HANDLE Returns a handle (HLOCK) to the locked memory. Pass this
value to SHChangeNotification_Unlock when finished.


%index
SHChangeNotification_Unlock
Unlocks shared memory for a change notification.
%group
Win32 shell32
%prm
hLock
hLock : [intptr] Type: HANDLE A handle to the memory lock. This is the handle returned by SHChangeNotification_Lock when it locked the memory.
%inst
Unlocks shared memory for a change notification.

[戻り値]
Type: BOOL Returns TRUE on success; otherwise, FALSE.


%index
SHChangeNotify
アプリケーションが実行したイベントをシステムに通知する。Shell に影響する可能性があるアクションを実行した場合に使用すべき。
%group
Win32 shell32
%prm
wEventId, uFlags, dwItem1, dwItem2
wEventId : [int] 型: LONG
uFlags : [int] 型: UINT
dwItem1 : [intptr] 型: LPCVOID オプション。イベント依存の 1 番目の値。
dwItem2 : [intptr] 型: LPCVOID オプション。イベント依存の 2 番目の値。
%inst
アプリケーションが実行したイベントをシステムに通知する。Shell に影響する可能性があるアクションを実行した場合に使用すべき。

[備考]
新しいハンドラを登録するアプリケーションは SHCNE_ASSOCCHANGED フラグで SHChangeNotify
を呼び、Shell
にアイコンとサムネイルキャッシュの無効化を指示しなければならない。アイコンオーバーレイハンドラは再ロードされない。dwItem1 と
dwItem2 が指す文字列は ANSI または Unicode のいずれか。


%index
SHChangeNotifyDeregister
Unregisters the client's window process from receiving SHChangeNotify messages.
%group
Win32 shell32
%prm
ulID
ulID : [int] Type: ULONG A value of type ULONG that specifies the registration ID returned by SHChangeNotifyRegister.
%inst
Unregisters the client's window process from receiving SHChangeNotify
messages.

[戻り値]
Type: BOOL Returns TRUE if the specified client was found and
removed; otherwise FALSE.

[備考]
See the Change Notify Watcher Sample in the Windows Software
Development Kit (SDK) for a full example that demonstrates the use of
this function. The NTSHChangeNotifyDeregister function, which is no
longer available for use as of Windows Vista, was equivalent to
SHChangeNotifyDeregister.


%index
SHChangeNotifyRegister
Registers a window to receive notifications from the file system or Shell, if the file system supports notifications.
%group
Win32 shell32
%prm
hwnd, fSources, fEvents, wMsg, cEntries, pshcne
hwnd : [intptr] Type: HWND A handle to the window that receives the change or notification messages.
fSources : [int] Type: int
fEvents : [int] Type: LONG Change notification events for which to receive notification. See the SHCNE flags listed in SHChangeNotify for possible values.
wMsg : [int] Type: UINT Message to be posted to the window procedure.
cEntries : [int] Type: int Number of entries in the pshcne array.
pshcne : [var] Type: const SHChangeNotifyEntry* Array of SHChangeNotifyEntry structures that contain the notifications. This array should always be set to one when calling SHChangeNotifyRegister or SHChangeNotifyDeregister will not work properly.
%inst
Registers a window to receive notifications from the file system or
Shell, if the file system supports notifications.

[戻り値]
Type: ULONG Returns a positive integer registration ID. Returns 0 if
out of memory or in response to invalid parameters.

[備考]
See the Change Notify Watcher Sample in the Windows Software
Development Kit (SDK) for a full example that demonstrates the use of
this function. When a change notification event is raised, the
message indicated by wMsg is delivered to the window specified by the
hwnd parameter.
This doc was truncated.


%index
SHChangeNotifyRegisterThread
Enables asynchronous register and deregister of a thread.
%group
Win32 shell32
%prm
status
status : [int] Type: SCNRT_STATUS Indicates whether the function is being used to register or deregister the thread. One of the values of SCNRT_STATUS.
%inst
Enables asynchronous register and deregister of a thread.


%index
SHCloneSpecialIDList
SHCloneSpecialIDList may be altered or unavailable. Instead, use SHGetSpecialFolderLocation.
%group
Win32 shell32
%prm
hwnd, csidl, fCreate
hwnd : [intptr] Type: HWND Reserved.
csidl : [int] Type: int A CSIDL value that identifies the folder of interest.
fCreate : [int] Type: BOOL A value of type BOOL that indicates if the folder should be created if it does not already exist. If  fCreate is TRUE, the folder is created. If it is FALSE, the folder is not created.
%inst
SHCloneSpecialIDList may be altered or unavailable. Instead, use
SHGetSpecialFolderLocation.

[戻り値]
Type: PIDLIST_ABSOLUTE Returns a pointer to the ITEMIDLIST structure
of a special folder specified by csidl. The function creates the
folder if fCreate is TRUE.

[備考]
When finished, you should free the pointer to the cloned folder with
ILFree.


%index
SHCoCreateInstance
SHCoCreateInstance may be altered or unavailable. Instead, use CoCreateInstance.
%group
Win32 shell32
%prm
pszCLSID, pclsid, pUnkOuter, riid, ppv
pszCLSID : [wstr] Type: PCWSTR A pointer to a string to convert to a CLSID. If NULL, pclsid is used as the CLSID.
pclsid : [var] Type: const CLSID* The CLSID to create.
pUnkOuter : [var] Type: IUnknown* A pointer to outer IUnknown. Used for aggregation.
riid : [var] Type: REFIID A reference to the IID of the interface to retrieve through ppv.
ppv : [var] Type: void** When this function returns successfully, receives the interface pointer requested in riid.
%inst
SHCoCreateInstance may be altered or unavailable. Instead, use
CoCreateInstance.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
We recommend that you use the IID_PPV_ARGS macro, defined in
Objbase.h, to package the riid and ppv parameters. This macro
provides the correct IID based on the interface pointed to by the
value in ppv, which eliminates the possibility of a coding error in
riid that could lead to unexpected results.


%index
SHCreateAssociationRegistration
Creates an IApplicationAssociationRegistration object based on the stock implementation of the interface provided by Windows.
%group
Win32 shell32
%prm
riid, ppv
riid : [var] Type: REFIID A reference to the IID of the requested interface.
ppv : [var] Type: void** When this function returns, contains the address of a pointer to the IApplicationAssociationRegistration object.
%inst
Creates an IApplicationAssociationRegistration object based on the
stock implementation of the interface provided by Windows.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHCreateDataObject
Creates a data object in a parent folder.
%group
Win32 shell32
%prm
pidlFolder, cidl, apidl, pdtInner, riid, ppv
pidlFolder : [var] Type: PCIDLIST_ABSOLUTE A pointer to an ITEMIDLIST (PIDL) of the parent folder that contains the data object.
cidl : [int] Type: UINT The number of file objects or subfolders specified in the apidl parameter.
apidl : [var] Type: PCUITEMID_CHILD_ARRAY An array of pointers to constant ITEMIDLIST structures, each of which uniquely identifies a file object or subfolder relative to the parent folder. Each item identifier list must contain exactly one SHITEMID structure followed by a terminating zero.
pdtInner : [var] Type: IDataObject* A pointer to interface IDataObject. This parameter can be NULL. Specify pdtInner only if the data object created needs to support additional FORMATETC  clipboard formats beyond the default formats it is assigned at creation.  Alternatively, provide support for populating the created data object using non-default clipboard formats by calling method IDataObject::SetData and specifying the format in the FORMATETC structure passed in parameter pFormatetc.
riid : [var] Type: REFIID A reference to the IID of the interface to retrieve through ppv. This must be IID_IDataObject.
ppv : [var] Type: void** When this method returns successfully, contains the IDataObject interface pointer requested in riid.
%inst
Creates a data object in a parent folder.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
This function is typically called when implementing method
IShellFolder::GetUIObjectOf. When an interface pointer of interface
ID IID_IDataObject is requested (using parameter riid), the
implementer can return the interface pointer on the object created
with SHCreateDataObject in response. This function supports the
CFSTR_SHELLIDLIST (also known as HIDA) clipboard format and also has
generic support for arbitrary clipboard formats through
IDataObject::SetData. For more information on clipboard formats, see
Shell Clipboard Formats. The new data object is intended to be used
in operations such as drag-and-drop, in which the data is stored in
the clipboard with a given format. We recommend that you use the
IID_PPV_ARGS macro, defined in Objbase.h, to package the riid and ppv
parameters. This macro provides the correct IID based on the
interface pointed to by the value in ppv, which eliminates the
possibility of a coding error in riid that could lead to unexpected
results.


%index
SHCreateDefaultContextMenu
Creates an object that represents the Shell's default context menu implementation.
%group
Win32 shell32
%prm
pdcm, riid, ppv
pdcm : [var] Type: const DEFCONTEXTMENU* A pointer to a constant DEFCONTEXTMENU structure.
riid : [var] Type: REFIID Reference to the interface ID of the interface on which to base the object. This is typically the IID of IContextMenu, IContextMenu2, or IContextMenu3.
ppv : [var] Type: void** When this method returns, contains the interface pointer requested in riid.
%inst
Creates an object that represents the Shell's default context menu
implementation.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
This function is typically used in the implementation of
IShellFolder::GetUIObjectOf. GetUIObjectOf creates a context menu
that merges IContextMenu handlers specified by the DEFCONTEXTMENU
structure, and can optionally provide default context menu verb
implementations such as open, explore, delete, and copy. The
operation of this function is controlled by the input specified in
the DEFCONTEXTMENU structure.The APICDefFolderMenu_Create2 is another
way to construct the default context menu implementation. It is less
expressive than SHCreateDefaultContextMenu but it exists in platforms
prior to Windows Vista.


%index
SHCreateDefaultExtractIcon
Creates a standard icon extractor, whose defaults can be further configured via the IDefaultExtractIconInit interface.
%group
Win32 shell32
%prm
riid, ppv
riid : [var] Type: REFIID A reference to interface ID.
ppv : [var] Type: void** The address of IDefaultExtractIconInit interface pointer.
%inst
Creates a standard icon extractor, whose defaults can be further
configured via the IDefaultExtractIconInit interface.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
The intended usage for this function is as follows:
This doc was truncated.


%index
SHCreateDefaultPropertiesOp
Creates a file operation that sets the default properties on the Shell item that have not already been set.
%group
Win32 shell32
%prm
psi, ppFileOp
psi : [var] Type: IShellItem* A pointer to the source shell item. See IShellItem.
ppFileOp : [var] Type: IFileOperation** The address of the IFileOperation interface pointer.
%inst
Creates a file operation that sets the default properties on the
Shell item that have not already been set.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
The list of properties to set a default value comes from the
SetDefaultsFor registry entry under the ProgID for the file
association of the item. The list is prefixed by prop: and contains
the canonical names of the properties to set the default value, for
example, prop:System.Author;System.Document.DateCreated. The possible
properties for this list are System.Author,
System.Document.DateCreated, and System.Photo.DateTaken. If the
SetDefaultsFor entry does not exist on the ProgID, this function uses
the default found on the SetDefaultsFor entry of HKEY_CLASSES_ROOT\*.


%index
SHCreateDirectory
Creates a new file system folder.
%group
Win32 shell32
%prm
hwnd, pszPath
hwnd : [intptr] Type: HWND A handle to a parent window. This parameter can be set to NULL if no user interface is displayed.
pszPath : [wstr] Type: PCWSTR A pointer to a null-terminated Unicode string that contains the fully qualified path of the directory. This string should have no more than MAX_PATH characters, including the terminating null character.
%inst
Creates a new file system folder.

[戻り値]
Type: int Returns ERROR_SUCCESS if successful. If the operation
fails, other error codes can be returned, including those listed
here. For values not specifically listed, see System Error Codes.
This doc was truncated.

[備考]
This function creates a file system folder whose fully qualified path
is given by pszPath. If one or more of the intermediate folders do
not exist, it creates them. To set security attributes on a new
folder, use SHCreateDirectoryEx.


%index
SHCreateDirectoryExW
Creates a new file system folder, with optional security attributes. (Unicode)
%group
Win32 shell32
%prm
hwnd, pszPath, psa
hwnd : [intptr] Type: HWND A handle to a parent window. This parameter can be set to NULL if no user interface will be displayed.
pszPath : [wstr] Type: LPCTSTR A pointer to a null-terminated string specifying the fully qualified path of the directory. This string is of maximum length of 248 characters, including the terminating null character.
psa : [var] Type: const SECURITY_ATTRIBUTES* A pointer to a SECURITY_ATTRIBUTES structure with the directory's security attribute. Set this parameter to NULL if no security attributes need to be set.
%inst
Creates a new file system folder, with optional security attributes.
(Unicode)

[戻り値]
Type: int Returns ERROR_SUCCESS if successful. If the operation
fails, other error codes can be returned, including those listed
here. For values not specifically listed, see System Error Codes.
This doc was truncated.

[備考]
This function creates a file system folder whose fully qualified path
is given by pszPath. If one or more of the intermediate folders do
not exist, they are created as well. SHCreateDirectoryEx also
verifies that the files are visible. If they are not visible, expect
one of the following:
This doc was truncated.


%index
SHCreateFileExtractIconW
SHCreateFileExtractIcon may be altered or unavailable. (Unicode)
%group
Win32 shell32
%prm
pszFile, dwFileAttributes, riid, ppv
pszFile : [wstr] Type: LPCTSTR A pointer to a null-terminated string that specifies the file system object. The buffer must not exceed MAX_PATH characters in length.
dwFileAttributes : [int] Type: DWORD A combination of one or more file attribute flags (FILE_ATTRIBUTE_* values as defined in Winnt.h) that specify the type of object.
riid : [var] Type: REFIID Reference to the desired interface ID of the icon extractor interface to create. This must be either IID_IExtractIconA or IID_IExtractIconW.
ppv : [var] Type: void** When this function returns, contains the interface pointer requested in riid. This is typically IExtractIcon.
%inst
SHCreateFileExtractIcon may be altered or unavailable. (Unicode)

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHCreateItemFromIDList
Creates and initializes a Shell item object from a pointer to an item identifier list (PIDL). The resulting shell item object supports the IShellItem interface.
%group
Win32 shell32
%prm
pidl, riid, ppv
pidl : [var] Type: PCIDLIST_ABSOLUTE The source PIDL.
riid : [var] Type: REFIID A reference to the IID of the requested interface.
ppv : [var] Type: void** When this function returns, contains the interface pointer requested in riid.  This will typically be IShellItem or IShellItem2.
%inst
Creates and initializes a Shell item object from a pointer to an item
identifier list (PIDL). The resulting shell item object supports the
IShellItem interface.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHCreateItemFromParsingName
Creates and initializes a Shell item object from a parsing name.
%group
Win32 shell32
%prm
pszPath, pbc, riid, ppv
pszPath : [wstr] Type: PCWSTR A pointer to a display name.
pbc : [var] Type: IBindCtx* Optional. A pointer to a bind context used to pass parameters as inputs and outputs to the parsing function. These passed parameters are often specific to the data source and are documented by the data source owners. For example, the file system data source accepts the name being parsed (as a WIN32_FIND_DATA structure), using the STR_FILE_SYS_BIND_DATA bind context parameter.
riid : [var] Type: REFIID A reference to the IID of the interface to retrieve through ppv, typically IID_IShellItem or IID_IShellItem2.
ppv : [var] Type: void** When this method returns successfully, contains the interface pointer requested in riid. This is typically IShellItem or IShellItem2.
%inst
Creates and initializes a Shell item object from a parsing name.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
We recommend that you use the IID_PPV_ARGS macro, defined in
Objbase.h, to package the riid and ppv parameters. This macro
provides the correct IID based on the interface pointed to by the
value in ppv, which eliminates the possibility of a coding error in
riid that could lead to unexpected results.


%index
SHCreateItemFromRelativeName
Creates and initializes a Shell item object from a relative parsing name.
%group
Win32 shell32
%prm
psiParent, pszName, pbc, riid, ppv
psiParent : [var] Type: IShellItem* A pointer to the parent Shell item.
pszName : [wstr] Type: PCWSTR A pointer to a null-terminated, Unicode string that specifies a display name that is relative to the psiParent.
pbc : [var] Type: IBindCtx* A pointer to a bind context that controls the parsing operation. This parameter can be NULL.
riid : [var] Type: REFIID A reference to an interface ID.
ppv : [var] Type: void** When this function returns, contains the interface pointer requested in riid.  This will usually be IShellItem or IShellItem2.
%inst
Creates and initializes a Shell item object from a relative parsing
name.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHCreateItemInKnownFolder
Creates a Shell item object for a single file that exists inside a known folder.
%group
Win32 shell32
%prm
kfid, dwKFFlags, pszItem, riid, ppv
kfid : [var] Type: REFKNOWNFOLDERID A reference to the KNOWNFOLDERID, a GUID that identifies the folder that contains the item.
dwKFFlags : [int] Type: DWORD Flags that specify special options in the object retrieval. This value can be 0; otherwise, one or more of the KNOWN_FOLDER_FLAG values.
pszItem : [wstr] Type: PCWSTR A pointer to a null-terminated buffer that contains the file name of the new item as a Unicode string. This parameter can also be NULL. In this case, an IShellItem that represents the known folder itself is created.
riid : [var] Type: REFIID A reference to the IID of the interface that represents the item, retrieved through ppv. This value is typically IID_IShellItem or IID_IShellItem2.
ppv : [var] Type: void** When this function returns successfully, contains the interface pointer requested in riid. This is typically IShellItem or IShellItem2.
%inst
Creates a Shell item object for a single file that exists inside a
known folder.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHCreateItemWithParent
Create a Shell item, given a parent folder and a child item ID.
%group
Win32 shell32
%prm
pidlParent, psfParent, pidl, riid, ppvItem
pidlParent : [var] Type: PCIDLIST_ABSOLUTE The IDList of the parent folder of the item being created; the IDList of psfParent. This parameter can be NULL, if psfParent is specified.
psfParent : [var] Type: IShellFolder* A pointer to IShellFolder interface that specifies the shell data source of the child item specified by the pidl.This parameter can be NULL, if pidlParent is specified.
pidl : [var] Type: PCUITEMID_CHILD A child item ID relative to its parent folder specified by psfParent or pidlParent.
riid : [var] Type: REFIID A reference to an interface ID.
ppvItem : [var] Type: void** When this function returns, contains the interface pointer requested in riid.  This will typically be IShellItem or IShellItem2.
%inst
Create a Shell item, given a parent folder and a child item ID.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHCreatePropSheetExtArray
SHCreatePropSheetExtArray may be altered or unavailable.
%group
Win32 shell32
%prm
hKey, pszSubKey, max_iface
hKey : [intptr] Type: HKEY The registry root key that contains the subkey with the property sheet extension handlers. For instance, HKEY_LOCAL_MACHINE.
pszSubKey : [wstr] Type: PCWSTR A pointer to a null-terminated string specifying the name of the subkey that contains shellex\PropertySheetHandlers. For example, if  hkey specifies HKEY_LOCAL_MACHINE and pszSubkey specifies "Software\Microsoft\Windows\CurrentVersion\Controls Folder\Display", this function returns property sheet extension handlers using the following subkey:
max_iface : [int] Type: UINT The maximum number of property sheet handlers to be returned.
%inst
SHCreatePropSheetExtArray may be altered or unavailable.

[戻り値]
Type: HPSXA Returns a handle to an array of property sheet handlers.
Pass this value to SHAddFromPropSheetExtArray. You do not access this
value directly.

[備考]
When you are finished with the returned HPSXA handle, destroy it by
calling SHDestroyPropSheetExtArray. This function loads up to
max_iface property sheet extensions into an array that is then passed
to SHAddFromPropSheetExtArray.


%index
SHCreateQueryCancelAutoPlayMoniker
Deprecated. Creates a QueryCancelAutoPlay class moniker, which can then be used to register the IQueryCancelAutoPlay handler in the running object table (ROT).
%group
Win32 shell32
%prm
ppmoniker
ppmoniker : [var] Type: IMoniker** The address of a IMoniker interface pointer that, when this function returns successfully, receives the QueryCancelAutoPlay class moniker. If this function call fails, this value is NULL.
%inst
Deprecated. Creates a QueryCancelAutoPlay class moniker, which can
then be used to register the IQueryCancelAutoPlay handler in the
running object table (ROT).

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
If successful, SHCreateQueryCancelAutoPlayMoniker calls the
interface's AddRef method and increments the reference count. When
you are finished, call the interface's Release method to release.


%index
SHCreateShellItem
Creates an IShellItem object.
%group
Win32 shell32
%prm
pidlParent, psfParent, pidl, ppsi
pidlParent : [var] Type: PCIDLIST_ABSOLUTE A PIDL to the parent. This value can be NULL.
psfParent : [var] Type: IShellFolder* A pointer to the parent IShellFolder. This value can be NULL.
pidl : [var] Type: PCUITEMID_CHILD A PIDL to the requested item. If parent information is not included in pidlParent or psfParent, this must be an absolute PIDL.
ppsi : [var] Type: IShellItem** When this method returns, contains the interface pointer to the new IShellItem.
%inst
Creates an IShellItem object.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
SHCreateShellItem creates an object that represents a Shell namespace
item. The caller must provide parent information in pidlParent or
psfParent; alternatively, the caller can provide an absolute IDList
in the pidl parameter. There are three valid calling patterns for
this function:
This doc was truncated.


%index
SHCreateShellItemArray
Creates a Shell item array object.
%group
Win32 shell32
%prm
pidlParent, psf, cidl, ppidl, ppsiItemArray
pidlParent : [var] Type: PCIDLIST_ABSOLUTE The ID list of the parent folder of the items specified in ppidl. If psf is specified, this parameter can be NULL. If this pidlParent is not specified, it is computed from the psf parameter using IPersistFolder2.
psf : [var] Type: IShellFolder* The Shell data source object that is the parent of the child items specified in ppidl. If pidlParent is specified, this parameter can be NULL.
cidl : [int] Type: UINT The number of elements in the array specified by ppidl.
ppidl : [var] Type: PCUITEMID_CHILD_ARRAY The list of child item IDs for which the array is being created. This value can be NULL.
ppsiItemArray : [var] Type: IShellItemArray** When this function returns, contains the address of an IShellItemArray interface pointer.
%inst
Creates a Shell item array object.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHCreateShellItemArrayFromDataObject
Creates a Shell item array object from a data object.
%group
Win32 shell32
%prm
pdo, riid, ppv
pdo : [var] Type: IDataObject* A pointer to IDataObject interface.
riid : [var] Type: REFIID A reference to the desired interface ID.
ppv : [var] Type: void** When this method returns, contains the interface pointer requested in riid. This is typically IShellItemArray.
%inst
Creates a Shell item array object from a data object.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
This function is useful for Shell extensions that implement
IShellExtInit and are passed a data object to the
IShellExtInit::Initialize method; for example, context menu handlers.
This API lets you convert the data object into a Shell item that the
handler can consume. It is recommend that handlers use a Shell item
array rather than clipboard formats like CF_HDROP and
CFSTR_SHELLIDLIST (also known as HIDA) as it leads to simpler code
and allows some performance improvements. The resulting shell item
array holds a reference to the source data object. Therefore, that
data object must remain valid for the lifetime of the shell item
array. Notably, the data objects passed to IDropTarget methods are no
longer valid after the drop operation completes.


%index
SHCreateShellItemArrayFromIDLists
Creates a Shell item array object from a list of ITEMIDLIST structures.
%group
Win32 shell32
%prm
cidl, rgpidl, ppsiItemArray
cidl : [int] Type: UINT The number of elements in the array.
rgpidl : [var] Type: PCIDLIST_ABSOLUTE_ARRAY A list of cidl constant pointers to ITEMIDLIST structures.
ppsiItemArray : [var] Type: IShellItemArray** When this function returns, contains an IShellItemArray interface pointer.
%inst
Creates a Shell item array object from a list of ITEMIDLIST
structures.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHCreateShellItemArrayFromShellItem
Creates an array of one element from a single Shell item.
%group
Win32 shell32
%prm
psi, riid, ppv
psi : [var] Type: IShellItem* Pointer to IShellItem object that represents the item.
riid : [var] Type: REFIID A reference to the IID of the interface to retrieve through ppv, typically IID_IShellItemArray.
ppv : [var] Type: void** When this method returns, contains the interface pointer requested in riid. This is typically a pointer to an IShellItemArray.
%inst
Creates an array of one element from a single Shell item.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
This function creates a one-element array from a single item. To
create an array from the contents of a folder, use
SHCreateShellItemArray.


%index
SHCreateStdEnumFmtEtc
SHCreateStdEnumFmtEtc may be altered or unavailable.
%group
Win32 shell32
%prm
cfmt, afmt, ppenumFormatEtc
cfmt : [int] Type: UINT The number of entries in the afmt array.
afmt : [var] Type: const FORMATETC[] An array of FORMATETC structures that specifies the clipboard formats of interest.
ppenumFormatEtc : [var] Type: IEnumFORMATETC** When this function returns successfully, receives an IEnumFORMATETC interface pointer. Receives NULL on failure.
%inst
SHCreateStdEnumFmtEtc may be altered or unavailable.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHDefExtractIconW
Provides a default handler to extract an icon from a file. (Unicode)
%group
Win32 shell32
%prm
pszIconFile, iIndex, uFlags, phiconLarge, phiconSmall, nIconSize
pszIconFile : [wstr] Type: LPCTSTR A pointer to a null-terminated buffer that contains the path and name of the file from which the icon is extracted.
iIndex : [int] Type: int The location of the icon within the file named in pszIconFile. If this is a positive number, it refers to the zero-based position of the icon in the file. For instance, 0 refers to the 1st icon in the resource file and 2 refers to the 3rd. If this is a negative number, it refers to the icon's resource ID.
uFlags : [int] Type: UINT A flag that controls the icon extraction.
phiconLarge : [intptr] Type: HICON* A pointer to an HICON that, when this function returns successfully, receives the handle of the large version of the icon specified in the LOWORD of nIconSize. This value can be NULL.
phiconSmall : [intptr] Type: HICON* A pointer to an HICON that, when this function returns successfully, receives the handle of the small version of the icon specified in the HIWORD of nIconSize.
nIconSize : [int] Type: UINT A value that contains the large icon size in its LOWORD and the small icon size in its HIWORD. Size is measured in pixels. Pass 0 to specify default large and small sizes.
%inst
Provides a default handler to extract an icon from a file. (Unicode)

[戻り値]
Type: HRESULT This function can return one of these values.
This doc was truncated.

[備考]
It is the responsibility of the caller to free the icon resources
created through this function when they are no longer needed. This
can be done through the DestroyIcon function.
> [!NOTE] > The shlobj_core.h header defines SHDefExtractIcon as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
SHDoDragDrop
Executes a drag-and-drop operation. Supports drag source creation on demand, as well as drag images.
%group
Win32 shell32
%prm
hwnd, pdata, pdsrc, dwEffect, pdwEffect
hwnd : [intptr] Type: HWND The handle of the window used to obtain the drag image. This value can be NULL. See Remarks for more details.
pdata : [var] Type: IDataObject* A pointer to the IDataObject interface on a data object that contains the data being dragged.
pdsrc : [var] Type: IDropSource* A pointer to an implementation of the IDropSource interface, which is used to communicate with the source during the drag operation.
dwEffect : [int] Type: DWORD The effects that the source allows in the drag-and-drop operation. The most significant effect is whether the drag-and-drop operation permits a move. For a list of possible values, see DROPEFFECT.
pdwEffect : [var] Type: DWORD* A pointer to a value that indicates how the drag-and-drop operation affected the source data. The pdwEffect parameter is set only if the operation is not canceled. For a list of possible values, see DROPEFFECT.
%inst
Executes a drag-and-drop operation. Supports drag source creation on
demand, as well as drag images.

[戻り値]
Type: HRESULT This function supports the standard return value
E_OUTOFMEMORY, as well as the following values:
This doc was truncated.

[備考]
As of Windows Vista, if a drag image is not already stored in the
data object pdtobj and a drag image cannot be obtained from the
window specified by hwnd, the Shell provides a generic drag image. A
drag image can fail to be obtained from the specified window either
because hwnd is NULL or the specified window does not support the
DI_GETDRAGIMAGE message.


%index
SHEmptyRecycleBinW
Empties the Recycle Bin on the specified drive. (Unicode)
%group
Win32 shell32
%prm
hwnd, pszRootPath, dwFlags
hwnd : [intptr] Type: HWND A handle to the parent window of any dialog boxes that might be displayed during the operation. This parameter can be NULL.
pszRootPath : [wstr] Type: LPCTSTR The address of a null-terminated string of maximum length MAX_PATH that contains the path of the root drive on which the Recycle Bin is located. This parameter can contain the address of a string formatted with the drive, folder, and subfolder names, for example c:\windows\system\. It can also contain an empty string or NULL. If this value is an empty string or NULL, all Recycle Bins on all drives will be emptied.
dwFlags : [int] Type: DWORD
%inst
Empties the Recycle Bin on the specified drive. (Unicode)

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
> [!NOTE] > The shellapi.h header defines SHEmptyRecycleBin as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
SHEnumerateUnreadMailAccountsW
Enumerates the user accounts that have unread email. (Unicode)
%group
Win32 shell32
%prm
hKeyUser, dwIndex, pszMailAddress, cchMailAddress
hKeyUser : [intptr] Type: HKEY A valid HKEY for a given user.
dwIndex : [int] Type: DWORD The index of the user account.
pszMailAddress : [wstr] Type: LPTSTR A pointer to a Unicode string that specifies the email address of an account belonging to the specified user.
cchMailAddress : [int] Type: int The number of characters in the email address.
%inst
Enumerates the user accounts that have unread email. (Unicode)

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
The hKeyUser parameter is the HKEY for the root of the user's
information, for example HKEY_CURRENT_USER, or any key enumerated
under HKEY_USERS.
> [!NOTE] > The shellapi.h header defines
SHEnumerateUnreadMailAccounts as an alias which automatically selects
the ANSI or Unicode version of this function based on the definition
of the UNICODE preprocessor constant. Mixing usage of the
encoding-neutral alias with code that not encoding-neutral can lead
to mismatches that result in compilation or runtime errors. For more
information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
SHEvaluateSystemCommandTemplate
Enforces strict validation of parameters used in a call to CreateProcess or ShellExecute.
%group
Win32 shell32
%prm
pszCmdTemplate, ppszApplication, ppszCommandLine, ppszParameters
pszCmdTemplate : [wstr] Type: PCWSTR A command line, which may or may not include parameters. If the parameters are substitution parameters, then SHEvaluateSystemCommandTemplate should be called before parameters have been replaced.
ppszApplication : [var] Type: PWSTR* A pointer to the verified path to the application. This value should be passed as the lpApplication parameter in a call to CreateProcess or as the lpFile parameter in a call to ShellExecute. This resource is allocated using CoTaskMemAlloc, and it is the responsibility of the caller to free the resource when it is no longer needed by calling CoTaskMemFree.
ppszCommandLine : [var] Type: PWSTR* A pointer to a command-line string template to be used in a call to CreateProcess. Command-line parameters should be specified based on this template, and then passed as the lpCommandLine parameter to CreateProcess. It is guaranteed to be of a form that PathGetArgs can always read correctly. This resource is allocated using CoTaskMemAlloc, and it is the responsibility of the caller to free the resource when it is no longer needed by calling CoTaskMemFree.
ppszParameters : [var] Type: PWSTR* A pointer to a command-line string template to be used in a call to ShellExecute. Command-line parameters should be specified based on this template, and then passed as the lpParameters parameter to ShellExecute. This parameter is identical to calling PathGetArgs. This resource is allocated using CoTaskMemAlloc, and it is the responsibility of the caller to free the resource when it is no longer needed by calling CoTaskMemFree.
%inst
Enforces strict validation of parameters used in a call to
CreateProcess or ShellExecute.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
This function is used when a calling process needs the deterministic
behavior from a command template, regardless of execution context. It
ignores the current process state, such as the %PATH%,
GetCurrentDirectory, and parent process directory. This function is
used when the command is hard-coded. This function is used by
ShellExecute when handling file associations from HKEY_CLASSES_ROOT.
The purpose of this function is to reduce CreateProcess command-line
exploits. It is not designed for processing user input and if used
for that purpose can generate unexpected failures.


%index
SHFindFiles
SHFindFiles may be altered or unavailable.
%group
Win32 shell32
%prm
pidlFolder, pidlSaveFile
pidlFolder : [var] Type: PCIDLIST_ABSOLUTE The folder from which to start the search. This folder appears in the Look in: box in the Search window. This folder and all of its subfolders are searched unless users choose other options in the Search window's More Advanced Options. This value can be NULL.
pidlSaveFile : [var] Type: PCIDLIST_ABSOLUTE This parameter is not used and must be set to NULL. Windows Server?2003 and Windows?XP:??A saved search file (.fnd) to load. You can save search parameters to a .fnd file after the search is begun. This value can be NULL.
%inst
SHFindFiles may be altered or unavailable.

[戻り値]
Type: BOOL Returns TRUE if successful in displaying the Search
window; otherwise FALSE.


%index
SHFind_InitMenuPopup
SHFind_InitMenuPopup may be altered or unavailable.
%group
Win32 shell32
%prm
hmenu, hwndOwner, idCmdFirst, idCmdLast
hmenu : [intptr] Type: HMENU The handle of the popup menu.
hwndOwner : [intptr] Type: HWND The handle of the popup menu's owner window. This value can be NULL.
idCmdFirst : [int] Type: UINT The ID of the first menu item.
idCmdLast : [int] Type: UINT The ID of the last menu item.
%inst
SHFind_InitMenuPopup may be altered or unavailable.

[戻り値]
Type: IContextMenu* If successful, returns an IContextMenu pointer.
On failure, returns NULL.


%index
SHFlushSFCache
SHFlushSFCache may be altered or unavailable.
%group
Win32 shell32
%prm

%inst
SHFlushSFCache may be altered or unavailable.

[備考]
SHFlushSFCache is called when the path to a special folder is
changed. This ensures that the updated path stored in the registry is
used rather than the cached value. For more information on special
folders, see the Special Folders and CSIDLs section of Getting a
Folder's ID.


%index
SHFormatDrive
SHFormatDrive may be altered or unavailable.
%group
Win32 shell32
%prm
hwnd, drive, fmtID, options
hwnd : [intptr] Type: HWND The handle of the parent window of the dialog box. The Format dialog box must have a parent window; therefore, this parameter cannot be NULL.
drive : [int] Type: UINT The drive to format. The value of this parameter represents a letter drive starting at 0 for the A: drive. For example, a value of 2 stands for the C: drive.
fmtID : [int] Type: UINT The ID of the physical format. Only the following flag is currently defined.
options : [int] Type: UINT
%inst
SHFormatDrive may be altered or unavailable.

[戻り値]
Type: DWORD Returns the format ID of the last successful format or
one of the following values. The LOWORD of this value can be passed
on subsequent calls as the fmtID parameter to repeat the last format.
This doc was truncated.

[備考]
The format is controlled by the dialog box interface. That is, the
user must click the OK button to actually begin the format?the format
cannot be started programmatically.


%index
SHFree
Frees the memory allocated by SHAlloc.
%group
Win32 shell32
%prm
pv
pv : [intptr] Type: void* A pointer to the memory allocated by SHAlloc.
%inst
Frees the memory allocated by SHAlloc.


%index
SHFreeNameMappings
Frees a file name mapping object that was retrieved by the SHFileOperation function.
%group
Win32 shell32
%prm
hNameMappings
hNameMappings : [intptr] Type: HANDLE A handle to the file name mapping object to be freed.
%inst
Frees a file name mapping object that was retrieved by the
SHFileOperation function.


%index
SHGetAttributesFromDataObject
SHGetAttributesFromDataObject may be altered or unavailable.
%group
Win32 shell32
%prm
pdo, dwAttributeMask, pdwAttributes, pcItems
pdo : [var] Type: IDataObject* The data object from which to retrieve the information.
dwAttributeMask : [int] Type: DWORD One or more of the SFGAO flags that indicate which pieces of information the calling application wants to retrieve.
pdwAttributes : [var] Type: DWORD* A pointer to a DWORD value that, when this function returns successfully, receives one or more SFGAO flags that indicate the attributes, among those requested, that are common to all items in pdo. This pointer can be NULL if this information is not needed.
pcItems : [var] Type: UINT* A pointer to a UINT that, when this function returns successfully, receives the number of PIDLs in the data object pointed to by pdo. This pointer can be NULL if this information is not needed.
%inst
SHGetAttributesFromDataObject may be altered or unavailable.

[戻り値]
Type: HRESULT This function can return one of these values.
This doc was truncated.


%index
SHGetDataFromIDListW
Retrieves extended property data from a relative identifier list. (Unicode)
%group
Win32 shell32
%prm
psf, pidl, nFormat, pv, cb
psf : [var] Type: IShellFolder* The address of the parent IShellFolder interface. This must be the immediate parent of the ITEMIDLIST structure referenced by the pidl parameter.
pidl : [var] Type: PCUITEMID_CHILD A pointer to an ITEMIDLIST structure that identifies the object relative to the folder specified in psf.
nFormat : [int] Type: int
pv : [intptr] Type: void* A pointer to a buffer that, when this function returns successfully, receives the requested data. The format of this buffer is determined by nFormat. If nFormat is SHGDFIL_NETRESOURCE, there are two possible cases. If the buffer is large enough, the net resource's string information (fields for the network name, local name, provider, and comments) will be placed into the buffer. If the buffer is not large enough, only the net resource structure will be placed into the buffer and the string information pointers will be NULL.
cb : [int] Type: int Size of the buffer at pv, in bytes.
%inst
Retrieves extended property data from a relative identifier list.
(Unicode)

[戻り値]
Type: HRESULT Returns S_OK if successful, or E_INVALIDARG otherwise.

[備考]
This function extracts only information that is present in the
pointer to an item identifier list (PIDL). Since the content of a
PIDL depends on the folder object that created the PIDL, there is no
guarantee that all requested information will be available. In
addition, the information that is returned reflects the state of the
object at the time the PIDL was created. The current state of the
object could be different. For example, if you set nFormat to
SHGDFIL_FINDDATA, the function might assign meaningful values to only
some of the members of the WIN32_FIND_DATA structure. The remaining
members will be set to zero. To retrieve complete current information
on a file system file or folder, use standard file system functions
such as GetFileTime or FindFirstFile. E_INVALIDARG is returned if the
psf, pidl, pv, or cb parameter does not match the nFormat parameter,
or if nFormat is not one of the specific SHGDFIL_ values shown above.
> [!NOTE] > The shlobj_core.h header defines SHGetDataFromIDList as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
SHGetDesktopFolder
Retrieves the IShellFolder interface for the desktop folder, which is the root of the Shell's namespace.
%group
Win32 shell32
%prm
ppshf
ppshf : [var] Type: IShellFolder** When this method returns, receives an IShellFolder interface pointer for the desktop folder. The calling application is responsible for eventually freeing the interface by calling its IUnknown::Release method.
%inst
Retrieves the IShellFolder interface for the desktop folder, which is
the root of the Shell's namespace.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHGetDiskFreeSpaceExW
Retrieves disk space information for a disk volume. (Unicode)
%group
Win32 shell32
%prm
pszDirectoryName, pulFreeBytesAvailableToCaller, pulTotalNumberOfBytes, pulTotalNumberOfFreeBytes
pszDirectoryName : [wstr] Type: LPCTSTR A null-terminated string that specifies the volume for which size information is retrieved. This can be a drive letter, UNC name, or the path of a folder. You cannot use NULL to represent the current drive.
pulFreeBytesAvailableToCaller : [var] Type: ULARGE_INTEGER* Pointer to a value that receives the number of bytes on the volume available to the calling application. If the operating system implements per-user quotas, this value may be less than the total number of free bytes on the volume.
pulTotalNumberOfBytes : [var] Type: ULARGE_INTEGER* Pointer to a value that receives the total size of the volume, in bytes.
pulTotalNumberOfFreeBytes : [var] Type: ULARGE_INTEGER* Pointer to a value that receives the number of bytes of free space on the volume.
%inst
Retrieves disk space information for a disk volume. (Unicode)

[戻り値]
Type: BOOL Returns TRUE if successful, FALSE otherwise.

[備考]
The similarly named function SHGetDiskFreeSpace is merely an alias
for SHGetDiskFreeSpaceEx. When you call SHGetDiskFreeSpace you
actually call this function. This function calls the
GetDiskFreeSpaceEx function if it is available on the operating
system. If GetDiskFreeSpaceEx is not available, it is emulated by
calling the GetDiskFreeSpace function and manipulating the return
values. For additional information, see the documentation for
GetDiskFreeSpaceEx.
> [!NOTE] > The shellapi.h header defines SHGetDiskFreeSpaceEx as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
SHGetDriveMedia
Returns the type of media that is in the given drive.
%group
Win32 shell32
%prm
pszDrive, pdwMediaContent
pszDrive : [wstr] Type: PCWSTR The drive in which to check the media type.
pdwMediaContent : [var] Type: DWORD* A pointer to the type of media in the given drive. A combination of ARCONTENT flags.
%inst
Returns the type of media that is in the given drive.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHGetFolderLocation
Deprecated. Retrieves the path of a folder as an ITEMIDLIST structure.
%group
Win32 shell32
%prm
hwnd, csidl, hToken, dwFlags, ppidl
hwnd : [intptr] Type: HWND Reserved.
csidl : [int] Type: int A CSIDL value that identifies the folder to be located. The folders associated with the CSIDLs might not exist on a particular system.
hToken : [intptr] Type: HANDLE An access token that can be used to represent a particular user. It is usually set to NULL, but it may be needed when there are multiple users for those folders that are treated as belonging to a single user. The most commonly used folder of this type is My Documents. The calling application is responsible for correct impersonation when hToken is non-NULL. It must have appropriate security privileges for the particular user, and the user's registry hive must be currently mounted. See Access Control for further discussion of access control issues.
dwFlags : [int] Type: DWORD
ppidl : [var] Type: PIDLIST_ABSOLUTE* The address of a pointer to an item identifier list structure that specifies the folder's location relative to the root of the namespace (the desktop). The ppidl parameter is set to NULL on failure. The calling application is responsible for freeing this resource by calling ILFree.
%inst
Deprecated. Retrieves the path of a folder as an ITEMIDLIST
structure.

[戻り値]
Type: HRESULT Returns S_OK if successful, or an error value
otherwise, including the following:
This doc was truncated.

[備考]
Note As of Windows Vista, this function is merely a wrapper for
SHGetKnownFolderIDList. The CSIDL value is translated to its
associated KNOWNFOLDERID and SHGetKnownFolderIDList is called. New
applications should use the known folder system rather than the older
CSIDL system, which is supported only for backward compatibility. The
SHGetFolderLocation, SHGetFolderPath, SHGetSpecialFolderLocation, and
SHGetSpecialFolderPath functions are the preferred ways to obtain
handles to folders on systems earlier than Windows Vista. Functions
such as ExpandEnvironmentStrings that use the environment variable
names directly, in the form %VariableName%, may not be reliable. This
function is a superset of SHGetSpecialFolderLocation, included with
earlier versions of the Shell.


%index
SHGetFolderPathW
非推奨。(SHGetFolderPathW)
%group
Win32 shell32
%prm
hwnd, csidl, hToken, dwFlags, pszPath
hwnd : [intptr] 型: HWND 予約。
csidl : [int] 型: int パスを取得するフォルダを識別する CSIDL 値。実フォルダのみ有効。仮想フォルダを指定した場合は失敗する。CSIDL_FLAG_CREATE と組み合わせることでフォルダ作成を強制できる。
hToken : [intptr] 型: HANDLE 特定のユーザを表すアクセストークン。通常は NULL を指定するが、複数ユーザで共有されるが単一ユーザに属するとして扱われるフォルダ(Documents など)では非 NULL 値を割り当てる必要がある場合がある。-1 を指定すると Default User を示す。
dwFlags : [int] 型: DWORD 返されるパスを指定するフラグ。ユーザまたは管理者によりリダイレクトされた現在値(SHGFP_TYPE_CURRENT)または既定値(SHGFP_TYPE_DEFAULT)を取得できる。
pszPath : [wstr] 型: LPWSTR パスを受け取る長さ MAX_PATH の NULL 終端文字列へのポインタ。エラーまたは S_FALSE が返される場合は空になる。末尾にバックスラッシュは付かない。
%inst
非推奨。(SHGetFolderPathW)

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外は HRESULT エラーコード。

[備考]
この関数は SHGetSpecialFolderPath のスーパーセットであり、一部の CSIDL 値がサポートされる。
（以下省略）


%index
SHGetFolderPathAndSubDirW
Gets the path of a folder and appends a user-provided subfolder path. (Unicode)
%group
Win32 shell32
%prm
hwnd, csidl, hToken, dwFlags, pszSubDir, pszPath
hwnd : [intptr] Type: HWND Reserved.
csidl : [int] Type: int A CSIDL value that identifies the folder whose path is to be retrieved. Only real folders are valid. If a virtual folder is specified, this function fails. You can force creation of a folder with SHGetFolderPathAndSubDir by combining the folder's CSIDL with CSIDL_FLAG_CREATE.
hToken : [intptr] Type: HANDLE An access token that represents a particular user. For systems earlier than Windows?2000, set this value to NULL. For later systems, hToken is usually, but not always, set to NULL. You might need to assign a value to hToken for those folders that can have multiple users but are treated as belonging to a single user. The most commonly used folder of this type is My Documents.
dwFlags : [int] Type: DWORD Specifies whether the path to be returned is the actual path of the folder or the default path. This value is used in cases where the folder associated with a CSIDL value may be moved or renamed by the user.
pszSubDir : [wstr] Type: LPCTSTR A pointer to the subpath to be appended to the folder's path. This is a null-terminated string of length MAX_PATH. If you are not creating a new directory, this must be an existing subdirectory or the function returns an error. This value can be NULL if no subpath is to be appended.
pszPath : [wstr] Type: LPTSTR When this function returns, this value points to the directory path and appended subpath. This is a null-terminated string of length MAX_PATH. This string is empty when the function returns an error code.
%inst
Gets the path of a folder and appends a user-provided subfolder path.
(Unicode)

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
> [!NOTE] > The shlobj_core.h header defines SHGetFolderPathAndSubDir
as an alias which automatically selects the ANSI or Unicode version
of this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
SHGetIDListFromObject
Retrieves the pointer to an item identifier list (PIDL) of an object.
%group
Win32 shell32
%prm
punk, ppidl
punk : [var] Type: IUnknown* A pointer to the IUnknown of the object from which to get the PIDL.
ppidl : [var] Type: PIDLIST_ABSOLUTE* When this function returns, contains a pointer to the PIDL of the given object.
%inst
Retrieves the pointer to an item identifier list (PIDL) of an object.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHGetIconOverlayIndexW
Returns the index of the overlay icon in the system image list. (Unicode)
%group
Win32 shell32
%prm
pszIconPath, iIconIndex
pszIconPath : [wstr] Type: LPCTSTR A pointer to a null-terminated string of maximum length MAX_PATH that contains the fully qualified path of the file that contains the icon.
iIconIndex : [int] Type: int The icon's index in the file pointed to by pszIconPath. To request a standard overlay icon, set pszIconPath to NULL, and iIconIndex to one of the following:
%inst
Returns the index of the overlay icon in the system image list.
(Unicode)

[戻り値]
Type: int Returns the index of the overlay icon in the system image
list if successful, or -1 otherwise.

[備考]
Icon overlays are part of the system image list. They have two
identifiers. The first is a one-based overlay index that identifies
the overlay relative to other overlays in the image list. The other
is an image index that identifies the actual image. These two indexes
are equivalent to the values that you assign to the iOverlay and
iImage parameters, respectively, when you add an icon overlay to a
private image list with ImageList_SetOverlayImage.
SHGetIconOverlayIndex returns the overlay index. To convert an
overlay index to its equivalent image index, call INDEXTOOVERLAYMASK.
Note After the image has been loaded into the system image list
during initialization, it cannot be changed. The file name and index
specified by pszIconPath and iIconIndex are used only to identify the
icon overlay. SHGetIconOverlayIndex cannot be used to modify the
system image list.
> [!NOTE] > The shlobj_core.h header defines SHGetIconOverlayIndex as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
SHGetImageList
Retrieves an image list.
%group
Win32 shell32
%prm
iImageList, riid, ppvObj
iImageList : [int] Type: int
riid : [var] Type: REFIID Reference to the image list interface identifier, normally IID_IImageList.
ppvObj : [var] Type: void** When this method returns, contains the interface pointer requested in riid. This is typically IImageList.
%inst
Retrieves an image list.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
The IImageList pointer type, such as that returned in the ppv
parameter, can be cast as an HIMAGELIST as needed; for example, for
use in a list view. Conversely, an HIMAGELIST can be cast as a
pointer to an IImageList. As of Windows Vista, SHIL_SMALL,
SHIL_LARGE, and SHIL_EXTRALARGE scale with dots per inch (dpi) if the
process is marked as dpi-aware. To set these types to be dpi-aware,
call SetProcessDPIAware. SHIL_JUMBO is fixed at 256 pixels regardless
of the dpi-aware setting.


%index
SHGetInstanceExplorer
Retrieves an interface that allows hosted Shell extensions and other components to prevent their host process from closing prematurely.
%group
Win32 shell32
%prm
ppunk
ppunk : [var] Type: IUnknown** When this function returns successfully, contains the address of the host process' IUnknown interface pointer. This is a free-threaded interface used to prevent the host process from terminating. If the function call fails, this value is set to NULL.
%inst
Retrieves an interface that allows hosted Shell extensions and other
components to prevent their host process from closing prematurely.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
There are a number of components, such as Shell extension handlers,
that are implemented as DLLs and run in a host process such as
Windows Explorer (Explorer.exe) or Internet Explorer (Iexplore.exe).
Typically, when the user closes the host process, the component is
shut down immediately as well. Such an abrupt termination can create
problems for some components. For example, if a component is using a
background thread to download data or run user-interface functions,
it might need additional time to safely shut itself down.
SHGetInstanceExplorer allows components that run in a host process to
hold a reference on the host process. SHGetInstanceExplorer
increments the host's reference count and returns a pointer to the
host's IUnknown interface. By holding that reference, a component can
prevent the host process from closing prematurely. After the
component has completed its necessary processing, it should call
(*ppunk)->Release to release the host's reference and allow the
process to terminate. Note If SHGetInstanceExplorer is successful,
the component must release the host's reference when it is no longer
needed. Otherwise, all resources associated with the process will
remain in memory. The IUnknown interface pointed to by *ppunk can
only be used to release this reference. Components cannot use
(*ppunk)->QueryInterface to request other interface pointers.
SHGetInstanceExplorer succeeds only if it is called from from an
application which had previously called SHSetInstanceExplorer to set
a process reference.


%index
SHGetItemFromDataObject
Creates an IShellItem or related object based on an item specified by an IDataObject.
%group
Win32 shell32
%prm
pdtobj, dwFlags, riid, ppv
pdtobj : [var] Type: IDataObject* A pointer to the source IDataObject instance.
dwFlags : [int] Type: DATAOBJ_GET_ITEM_FLAGS One or more values from the DATAOBJ_GET_ITEM_FLAGS enumeration to specify options regarding the target object. This value can be 0.
riid : [var] Type: REFIID A reference to the IID of the interface to retrieve through ppv, typically IID_IShellItem.
ppv : [var] Type: void** When this method returns, contains the interface pointer requested in riid. This is typically IShellItem.
%inst
Creates an IShellItem or related object based on an item specified by
an IDataObject.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
It is recommended that you use the IID_PPV_ARGS macro, defined in
Objbase.h, to package the riid and ppv parameters. This macro
provides the correct IID based on the interface pointed to by the
value in ppv, which eliminates the possibility of a coding error.


%index
SHGetItemFromObject
Retrieves an IShellItem for an object.
%group
Win32 shell32
%prm
punk, riid, ppv
punk : [var] Type: IUnknown* A pointer to the IUnknown of the object.
riid : [var] Type: REFIID Reference to the desired IID.
ppv : [var] Type: void** When this method returns, contains the interface pointer requested in riid. This is typically IShellItem or a related interface.
%inst
Retrieves an IShellItem for an object.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
From the standpoint of performance, this method is preferred to
SHGetIDListFromObject in those cases where the IDList is already
bound to a folder.


%index
SHGetKnownFolderIDList
Retrieves the path of a known folder as an ITEMIDLIST structure.
%group
Win32 shell32
%prm
rfid, dwFlags, hToken, ppidl
rfid : [var] Type: REFKNOWNFOLDERID A reference to the KNOWNFOLDERID that identifies the folder. The folders associated with the known folder IDs might not exist on a particular system.
dwFlags : [int] Type: DWORD Flags that specify special retrieval options. This value can be 0; otherwise, it is one or more of the KNOWN_FOLDER_FLAG values.
hToken : [intptr] Type: HANDLE An access token used to represent a particular user. This parameter is usually set to NULL, in which case the function tries to access the current user's instance of the folder. However, you may need to assign a value to hToken for those folders that can have multiple users but are treated as belonging to a single user. The most commonly used folder of this type is Documents. The calling application is responsible for correct impersonation when hToken is non-null. It must have appropriate security privileges for the particular user, including TOKEN_QUERY and TOKEN_IMPERSONATE, and the user's registry hive must be currently mounted. See Access Control for further discussion of access control issues. Assigning the hToken parameter a value of -1 indicates the Default User. This allows clients of SHGetKnownFolderIDList to find folder locations (such as the Desktop folder) for the Default User. The Default User user profile is duplicated when any new user account is created, and includes special folders such as Documents and Desktop. Any items added to the Default User folder also appear in any new user account. Note that access to the Default User folders requires administrator privileges.
ppidl : [var] Type: PIDLIST_ABSOLUTE* When this method returns, contains a pointer to the PIDL of the folder. This parameter is passed uninitialized. The caller is responsible for freeing the returned PIDL when it is no longer needed by calling ILFree.
%inst
Retrieves the path of a known folder as an ITEMIDLIST structure.

[戻り値]
Type: HRESULT Returns S_OK if successful, or an error value
otherwise, including the following:
This doc was truncated.

[備考]
This function replaces SHGetFolderLocation. That older function is
now simply a wrapper for SHGetKnownFolderIDList. Callers using this
function must have at least User privileges. Some known folders, for
example, the Documents folder, are per-user. Each user has a
different path for the Documents folder. If hToken is NULL, the API
tries to access the current user's instance of the folder. If hToken
is a valid user token, the API tries to impersonate the user using
this token, and attempts to access that user's instance of the
folder.


%index
SHGetKnownFolderItem
Retrieves an IShellItem object that represents a known folder.
%group
Win32 shell32
%prm
rfid, flags, hToken, riid, ppv
rfid : [var] Type: REFKNOWNFOLDERID A reference to the KNOWNFOLDERID, a GUID that identifies the folder that contains the item.
flags : [int] Type: KNOWN_FOLDER_FLAG Flags that specify special options used in the retrieval of the known folder IShellItem. This value can be KF_FLAG_DEFAULT; otherwise, one or more of the KNOWN_FOLDER_FLAG values.
hToken : [intptr] Type: HANDLE An access token used to represent a particular user. This parameter is usually set to NULL, in which case the function tries to access the current user's instance of the folder. However, you may need to assign a value to hToken for those folders that can have multiple users but are treated as belonging to a single user. The most commonly used folder of this type is Documents.
riid : [var] Type: REFIID A reference to the IID of the interface that represents the item, usually IID_IShellItem or IID_IShellItem2.
ppv : [var] Type: void** When this method returns, contains the interface pointer requested in riid.
%inst
Retrieves an IShellItem object that represents a known folder.

[戻り値]
Type: HRESULT Returns S_OK if successful, or an error value
otherwise, including the following:
This doc was truncated.

[備考]
The caller of this function must have Administrator privileges. To
call this function on public known folders, the caller must have
Administrator privileges. For per-user known folders the caller only
requires User privileges. Some of the known folders, for example, the
Documents folder, are per-user. Every user has a different path for
their Documents folder. If hToken is NULL, the API tries to access
the calling application's instance of the folder, which is that of
the current user. If hToken is a valid user token, the API tries to
impersonate the user using this token and tries to access that user's
instance. This function cannot be called on folders of type
KF_CATEGORY_FIXED and KF_CATEGORY_VIRTUAL. To call this function on a
folder of type KF_CATEGORY_COMMON, the calling application must be
running with elevated privileges.


%index
SHGetKnownFolderPath
フォルダの KNOWNFOLDERID で識別される既知フォルダの完全パスを取得する。
%group
Win32 shell32
%prm
rfid, dwFlags, hToken, ppszPath
rfid : [var] 型: REFKNOWNFOLDERID フォルダを識別する KNOWNFOLDERID への参照。
dwFlags : [int] 型: DWORD 特別な取得オプションを指定するフラグ。0、または KNOWN_FOLDER_FLAG 値の 1 つ以上。
hToken : [intptr] 型: HANDLE 特定のユーザを表すアクセストークン。NULL(最も一般的)の場合は現在のユーザのフォルダを要求する。
ppszPath : [var] 型: PWSTR* メソッドから戻るとき、既知フォルダのパスを指定する NULL 終端 Unicode 文字列へのポインタのアドレスを含む。呼び出し元は成功/失敗を問わず CoTaskMemFree で解放する責任がある。末尾にバックスラッシュは付かない。
%inst
フォルダの KNOWNFOLDERID で識別される既知フォルダの完全パスを取得する。

[戻り値]
型: HRESULT 成功した場合は S_OK、それ以外はエラー値を返す。
（以下省略）

[備考]
この関数は SHGetFolderPath を置き換える。SHGetFolderPath は現在 SHGetKnownFolderPath
の単なるラッパーである。


%index
SHGetLocalizedName
Retrieves the localized name of a file in a Shell folder.
%group
Win32 shell32
%prm
pszPath, pszResModule, cch, pidsRes
pszPath : [wstr] Type: PCWSTR A pointer to a string that specifies the fully qualified path of the file.
pszResModule : [wstr] Type: PWSTR When this function returns, contains a pointer to a string resource that specifies the localized version of the file name.
cch : [int] Type: UINT When this function returns, contains the size of the string, in WCHARs, at pszResModule.
pidsRes : [var] Type: int* When this function returns, contains a pointer to the ID of the localized file name in the resource file.
%inst
Retrieves the localized name of a file in a Shell folder.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHGetMalloc
Retrieves a pointer to the Shell's IMalloc interface.
%group
Win32 shell32
%prm
ppMalloc
ppMalloc : [var] Type: LPMALLOC* The address of a pointer that receives the Shell's IMalloc interface pointer.
%inst
Retrieves a pointer to the Shell's IMalloc interface.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
SHGetMalloc was introduced in Windows 95 and Microsoft Windows NT
4.0, but as of Windows 2000 it is no longer necessary. In its place,
programs can call the equivalent (and easier to use) CoTaskMemAlloc
and CoTaskMemFree. If you find an older reference document that
suggests or even requires the use of SHGetMalloc, it is acceptable
and encouraged to use CoTaskMemAlloc and CoTaskMemFree instead.


%index
SHGetNameFromIDList
Retrieves the display name of an item identified by its IDList.
%group
Win32 shell32
%prm
pidl, sigdnName, ppszName
pidl : [var] Type: PCIDLIST_ABSOLUTE A PIDL that identifies the item.
sigdnName : [int] Type: SIGDN A value from the SIGDN enumeration that specifies the type of display name to retrieve.
ppszName : [var] Type: PWSTR* A value that, when this function returns successfully, receives the address of a pointer to the retrieved display name.
%inst
Retrieves the display name of an item identified by its IDList.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
It is the responsibility of the caller to free the string pointed to
by ppszName when it is no longer needed. Call CoTaskMemFree on
*ppszName to free the memory.


%index
SHGetNewLinkInfoW
Creates a name for a new shortcut based on the shortcut's proposed target. This function does not create the shortcut, just the name. (Unicode)
%group
Win32 shell32
%prm
pszLinkTo, pszDir, pszName, pfMustCopy, uFlags
pszLinkTo : [wstr] Type: LPCTSTR A pointer to the path and file name of the shortcut's target. If uFlags does not contain the SHGNLI_PIDL value, this parameter is the address of a null-terminated string that contains the target. If uFlags contains the SHGNLI_PIDL value, this parameter is a PIDL that represents the target.
pszDir : [wstr] Type: LPCTSTR A pointer to a null-terminated string that contains the path of the folder in which the shortcut would be created.
pszName : [wstr] Type: LPTSTR A pointer to a string that receives the null-terminated path and file name for the shortcut. This buffer is assumed to be at least MAX_PATH characters in size.
pfMustCopy : [var] Type: BOOL* The address of a BOOL value that receives a flag indicating whether the shortcut would be copied. When a shortcut to another shortcut is created, the Shell simply copies the target shortcut and modifies that copied shortcut appropriately. This parameter receives a nonzero value if the target specified in pszLinkTo specifies a shortcut that will cause the target shortcut to be copied. This parameter receives zero if the target does not specify a shortcut that would be copied.
uFlags : [int] Type: UINT
%inst
Creates a name for a new shortcut based on the shortcut's proposed
target. This function does not create the shortcut, just the name.
(Unicode)

[戻り値]
Type: BOOL Returns TRUE if successful; otherwise, FALSE.

[備考]
SHGetNewLinkInfo determines whether the destination file system
supports long file names. If it does, a long file name is used for
the shortcut name. If the destination file system does not support
long file names, the shortcut name is returned in an 8.3 format.
> [!NOTE] > The shellapi.h header defines SHGetNewLinkInfo as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
SHGetPathFromIDListW
アイテム識別子リストをファイルシステムパスに変換する。(Unicode)
%group
Win32 shell32
%prm
pidl, pszPath
pidl : [var] 型: PCIDLIST_ABSOLUTE 名前空間のルート(デスクトップ)からのファイルまたはディレクトリ位置を指定するアイテム識別子リストのアドレス。
pszPath : [wstr] 型: LPTSTR ファイルシステムパスを受け取るバッファのアドレス。少なくとも MAX_PATH 文字サイズが必要。
%inst
アイテム識別子リストをファイルシステムパスに変換する。(Unicode)

[戻り値]
型: BOOL 成功した場合は TRUE、それ以外は FALSE。

[備考]
pidl が指定する位置がファイルシステムの一部でない場合、この関数は失敗する。pidl がショートカットを指定する場合、pszPath
はショートカット自体へのパスを含み、ターゲットへのパスではない。


%index
SHGetPathFromIDListEx
Converts an item identifier list to a file system path. This function extends SHGetPathFromIDList by allowing you to set the initial size of the string buffer and declare the options below.
%group
Win32 shell32
%prm
pidl, pszPath, cchPath, uOpts
pidl : [var] Type: PCIDLIST_ABSOLUTE A pointer to an item identifier list that specifies a file or directory location relative to the root of the namespace (the desktop).
pszPath : [wstr] Type: PWSTR When this function is called it is passed a null-terminated, Unicode buffer to receive the file system path. This buffer is of size cchPath.
cchPath : [int] Type: DWORD The size of the buffer pointed to by pszPath, in characters.
uOpts : [int] Type: GPFIDL_FLAGS These flags determine the type of path returned.
%inst
Converts an item identifier list to a file system path. This function
extends SHGetPathFromIDList by allowing you to set the initial size
of the string buffer and declare the options below.

[戻り値]
Type: BOOL Returns TRUE if successful; otherwise, FALSE.

[備考]
Except for UNC printer names, if the location specified by the pidl
parameter is not part of the file system, this function fails. If the
pidl parameter specifies a shortcut, the pszPath contains the path to
the shortcut, not to the shortcut's target.


%index
SHGetPropertyStoreForWindow
Retrieves an object that represents a specific window's collection of properties, which allows those properties to be queried or set.
%group
Win32 shell32
%prm
hwnd, riid, ppv
hwnd : [intptr] Type: HWND A handle to the window whose properties are being retrieved.
riid : [var] Type: REFIID A reference to the IID of the property store object to retrieve through ppv. This is typically IID_IPropertyStore.
ppv : [var] Type: void** When this function returns, contains the interface pointer requested in riid. This is typically IPropertyStore.
%inst
Retrieves an object that represents a specific window's collection of
properties, which allows those properties to be queried or set.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
An application can use this function to obtain access to a window's
property store so that it can set an explicit Application User Model
ID (AppUserModelID) in the System.AppUserModel.ID property. A
window's properties must be removed before the window is closed. If
this is not done, the resources used by those properties are not
returned to the system. A property is removed by setting it to the
PROPVARIANT type VT_EMPTY. When a call is made to
IPropertyStore::SetValue on the object retrieved through ppv, the
properties and values are immediately stored on the window.
Therefore, no call to IPropertyStore::Commit is needed. No error
occurs if it is called, but it has no effect. An application sets
AppUserModelIDs on individual windows to control the application's
taskbar grouping and Jump List contents. For instance, a suite
application might want to provide a different taskbar button for each
of its subfeatures, with the windows relating to that subfeature
grouped under that button. Without window-level AppUserModelIDs,
those windows would all be grouped together under the main process.
Applications should also use this property store to set these
relaunch properties so that the system can return the application to
that state.
This doc was truncated.


%index
SHGetPropertyStoreFromIDList
Retrieves an object that supports IPropertyStore or related interfaces from a pointer to an item identifier list (PIDL).
%group
Win32 shell32
%prm
pidl, flags, riid, ppv
pidl : [var] Type: PCIDLIST_ABSOLUTE A pointer to an item ID list.
flags : [int] Type: GETPROPERTYSTOREFLAGS One or more values from the GETPROPERTYSTOREFLAGS constants. This parameter can also be NULL.
riid : [var] Type: REFIID A reference to the desired interface ID.
ppv : [var] Type: void** When this function returns, contains the interface pointer requested in riid. This is typically IPropertyStore or a related interface.
%inst
Retrieves an object that supports IPropertyStore or related
interfaces from a pointer to an item identifier list (PIDL).


%index
SHGetPropertyStoreFromParsingName
Returns a property store for an item, given a path or parsing name.
%group
Win32 shell32
%prm
pszPath, pbc, flags, riid, ppv
pszPath : [wstr] Type: PCWSTR A pointer to a null-terminated Unicode string that specifies the item path.
pbc : [var] Type: IBindCtx* A pointer to a IBindCtx object, which provides access to a bind context. This value can be NULL.
flags : [int] Type: GETPROPERTYSTOREFLAGS One or more values from the GETPROPERTYSTOREFLAGS constants. This parameter can also be NULL.
riid : [var] Type: REFIID A reference to the desired interface ID.
ppv : [var] Type: void** When this function returns, contains the interface pointer requested in riid. This is typically IPropertyStore or a related interface.
%inst
Returns a property store for an item, given a path or parsing name.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHGetRealIDL
SHGetRealIDL may be altered or unavailable.
%group
Win32 shell32
%prm
psf, pidlSimple, ppidlReal
psf : [var] Type: IShellFolder* A pointer to an instance of IShellFolder whose simple PIDL is to be converted.
pidlSimple : [var] Type: PCUITEMID_CHILD The simple PIDL to be converted.
ppidlReal : [var] Type: PITEMID_CHILD* When this method returns, contains a pointer to the full converted PIDL. If the function fails, this parameter is set to NULL.
%inst
SHGetRealIDL may be altered or unavailable.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHGetSetFolderCustomSettings
SHGetSetFolderCustomSettings may be altered or unavailable.
%group
Win32 shell32
%prm
pfcs, pszPath, dwReadWrite
pfcs : [var] Type: LPSHFOLDERCUSTOMSETTINGS A pointer to a SHFOLDERCUSTOMSETTINGS structure that provides or receives the custom folder settings.
pszPath : [wstr] Type: PCTSTR A pointer to a null-terminated Unicode string that contains the path to the folder. The length of  pszPath must be MAX_PATH or less, including the terminating null character.
dwReadWrite : [int] Type: DWORD
%inst
SHGetSetFolderCustomSettings may be altered or unavailable.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
Only Unicode strings are supported. Windows Server 2003 and Windows
XP: SHGetSetFolderCustomSettings supports both ANSI and Unicode
strings.


%index
SHGetSetSettings
SHGetSetSettings may be altered or unavailable.
%group
Win32 shell32
%prm
lpss, dwMask, bSet
lpss : [var] Type: LPSHELLSTATE A pointer to a SHELLSTATE structure that provides or receives the Shell state settings.
dwMask : [int] Type: DWORD One or more of the SSF flags that indicate which settings should be set or retrieved.
bSet : [int] Type: BOOL TRUE to indicate that the contents of lpss should be used to set the Shell settings, FALSE to indicate that the Shell settings should be retrieved to lpss.
%inst
SHGetSetSettings may be altered or unavailable.


%index
SHGetSettings
Retrieves the current Shell option settings.
%group
Win32 shell32
%prm
psfs, dwMask
psfs : [var] Type: LPSHELLFLAGSTATE The address of a SHELLFLAGSTATE structure that receives the Shell option settings.
dwMask : [int] Type: DWORD
%inst
Retrieves the current Shell option settings.


%index
SHGetSpecialFolderLocation
SHGetSpecialFolderLocation is not supported and may be altered or unavailable in the future. Instead, use SHGetFolderLocation.
%group
Win32 shell32
%prm
hwnd, csidl, ppidl
hwnd : [intptr] Type: HWND Reserved.
csidl : [int] Type: int A CSIDL value that identifies the folder of interest.
ppidl : [var] Type: PIDLIST_ABSOLUTE* A PIDL specifying the folder's location relative to the root of the namespace (the desktop). It is the responsibility of the calling application to free the returned IDList by using CoTaskMemFree.
%inst
SHGetSpecialFolderLocation is not supported and may be altered or
unavailable in the future. Instead, use SHGetFolderLocation.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHGetSpecialFolderPathW
SHGetSpecialFolderPath はサポートされていない。代わりに SHGetFolderPath を使う。(Unicode)
%group
Win32 shell32
%prm
hwnd, pszPath, csidl, fCreate
hwnd : [intptr] 型: HWND 予約。
pszPath : [wstr] 型: LPTSTR 指定フォルダのドライブとパスを受け取る NULL 終端文字列へのポインタ。少なくとも MAX_PATH 文字サイズが必要。
csidl : [int] 型: int 対象フォルダを識別する CSIDL。仮想フォルダを指定した場合は失敗する。
fCreate : [int] 型: BOOL 存在しない場合にフォルダを作成するかを示す。非 0 なら作成する、0 なら作成しない。
%inst
SHGetSpecialFolderPath はサポートされていない。代わりに SHGetFolderPath を使う。(Unicode)

[戻り値]
型: BOOL 成功した場合は TRUE、それ以外は FALSE。

[備考]
この関数を使うには Microsoft Internet Explorer 4.0 Desktop Update
がインストールされている必要がある。shlobj_core.h は SHGetSpecialFolderPath を UNICODE
に基づく ANSI/Unicode 版のエイリアスとして定義する。


%index
SHGetTemporaryPropertyForItem
Retrieves the temporary property for the given item. A temporary property is a read/write store that holds properties only for the lifetime of the IShellItem object, rather than being persisted back into the item.
%group
Win32 shell32
%prm
psi, propkey, ppropvar
psi : [var] Type: IShellItem* A pointer to the item for which the temporary property is to be retrieved.
propkey : [var] Type: REFPROPERTYKEY The property key.
ppropvar : [var] Type: PROPVARIANT* A pointer to the temporary property for the item.
%inst
Retrieves the temporary property for the given item. A temporary
property is a read/write store that holds properties only for the
lifetime of the IShellItem object, rather than being persisted back
into the item.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHGetUnreadMailCountW
Retrieves a specified user's unread message count for any or all email accounts. (Unicode)
%group
Win32 shell32
%prm
hKeyUser, pszMailAddress, pdwCount, pFileTime, pszShellExecuteCommand, cchShellExecuteCommand
hKeyUser : [intptr] Type: HKEY A valid HKEY for a given user. This parameter should be NULL if the function is called in a user's environment, in which case HKEY_CURRENT_USER is used. This parameter should be NULL if the function is called from the SYSTEM context, in which case HKEY_USERS\{SID} is used.
pszMailAddress : [wstr] Type: LPCTSTR A pointer to a string in Unicode that specifies the email address of an account belonging to the specified user. When this parameter is NULL, pdwCount returns the total count of unread messages for all accounts owned by the designated user.
pdwCount : [var] Type: DWORD* Pointer to a DWORD value which receives the unread message count.
pFileTime : [var] Type: FILETIME* A pointer to a FILETIME structure.  The use of this parameter is determined by whether pszMailAddress is NULL. If pszMailAddress is NULL, then this parameter is treated as an [in] parameter, which specifies a filter, so that only unread mail newer than the specified time appears. If pszMailAddress is not NULL, then this parameter is treated as an [out] parameter, which points to a FILETIME structure into which the function places the timestamp of the last SHSetUnreadMailCount call for the specified user and email account.
pszShellExecuteCommand : [wstr] Type: LPCTSTR A pointer to a string that returns the ShellExecute command statement passed into the last SHSetUnreadMailCount call for the specified user and email account. This command string starts the email application that owns the account referenced by pszMailAddress. If the ShellExecute command is not required, this parameter can be NULL. If pszMailAddress is NULL, this parameter is ignored and must be NULL.
cchShellExecuteCommand : [int] Type: int The maximum size, in characters, of the ShellExecute command buffer pointed to by pszShellExecuteCommand. This parameter must be zero for total counts when pszMailAddress is NULL. It can also be NULL whenever the ShellExecute command string is not required.
%inst
Retrieves a specified user's unread message count for any or all
email accounts. (Unicode)

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHHandleUpdateImage
SHHandleUpdateImage may be altered or unavailable.
%group
Win32 shell32
%prm
pidlExtra
pidlExtra : [var] Type: PCIDLIST_ABSOLUTE The index in the system image list that has changed, specified in the pidl2 parameter of IShellChangeNotify::OnChange.
%inst
SHHandleUpdateImage may be altered or unavailable.

[戻り値]
Type: int Returns -1 on failure or the index of the changed image
list entry on success.

[備考]
Use SHHandleUpdateImage only when the pidl2 parameter received by
your change notification callback is non-NULL.


%index
SHILCreateFromPath
SHILCreateFromPath may be altered or unavailable.
%group
Win32 shell32
%prm
pszPath, ppidl, rgfInOut
pszPath : [wstr] Type: PCWSTR A pointer to a null-terminated string of maximum length MAX_PATH containing the path to be converted.
ppidl : [var] Type: PIDLIST_ABSOLUTE* The path in pszPath expressed as a PIDL.
rgfInOut : [var] Type: DWORD* A pointer to a DWORD value that, on entry, indicates any attributes of the folder named in pszPath that the calling application would like to retrieve along with the PIDL. On exit, this value contains those requested attributes. For a list of possible attribute flags for this parameter, see IShellFolder::GetAttributesOf.
%inst
SHILCreateFromPath may be altered or unavailable.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHInvokePrinterCommandW
Executes a command on a printer object. (Unicode)
%group
Win32 shell32
%prm
hwnd, uAction, lpBuf1, lpBuf2, fModal
hwnd : [intptr] Type: HWND The handle of the parent window of any windows or dialog boxes that are created during the operation.
uAction : [int] Type: UINT
lpBuf1 : [wstr] Type: LPCTSTR Pointer to a null-terminated string that contains additional information for the printer command. The information contained in this parameter depends upon the value of uAction.
lpBuf2 : [wstr] Type: LPCTSTR Pointer to a null-terminated string that contains additional information for the printer command. The information contained in this parameter depends upon the value of uAction.
fModal : [int] Type: BOOL TRUE to specify that SHInvokePrinterCommand should not return until the command is completed; FALSE if the function should return as soon as the command is initialized.
%inst
Executes a command on a printer object. (Unicode)

[戻り値]
Type: BOOL Returns TRUE if successful; otherwise, FALSE.

[備考]
When a printer name is specified by lpBuf1, the name can either be
the name of a local printer or the server and share name of a network
printer. When specifying a network printer name, the name must be
specified in this format:
This doc was truncated.


%index
SHIsFileAvailableOffline
Determines whether a file or folder is available for offline use. This function also determines whether the file would be opened from the network, from the local Offline Files cache, or from both locations.
%group
Win32 shell32
%prm
pwszPath, pdwStatus
pwszPath : [wstr] Type: PCWSTR A pointer to a string value that specifies the full path to a network file or directory. This path does not need to be in UNC form. If pszPath is not a network path, the function returns E_INVALIDARG.
pdwStatus : [var] Type: LPDWORD A pointer to a variable of type DWORD that receives one or more of the following flags if the function succeeds.
%inst
Determines whether a file or folder is available for offline use.
This function also determines whether the file would be opened from
the network, from the local Offline Files cache, or from both
locations.

[戻り値]
Type: HRESULT This function can return one of these values.
This doc was truncated.

[備考]
If pszPath is a directory, SHIsFileAvailableOffline will not return
the OFFLINE_STATUS_INCOMPLETE flag. If SHIsFileAvailableOffline
returns both OFFLINE_STATUS_LOCAL and OFFLINE_STATUS_REMOTE, the file
or directory is open in both places. This is common when the server
is online.


%index
SHLimitInputEdit
Sets limits on valid characters for an edit control.
%group
Win32 shell32
%prm
hwndEdit, psf
hwndEdit : [intptr] Type: HWND The handle of the edit control.
psf : [var] Type: IShellFolder* An IShellFolder interface pointer. This object must also implement IItemNameLimits, which supplies a list of invalid characters and a maximum name length.
%inst
Sets limits on valid characters for an edit control.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHLoadInProc
Creates an instance of the specified object class from within the context of the Shell's process. Windows?Vista and later:\_This function has been disabled and returns E_NOTIMPL.
%group
Win32 shell32
%prm
rclsid
rclsid : [var] Type: REFCLSID The CLSID of the object class to be created.
%inst
Creates an instance of the specified object class from within the
context of the Shell's process. Windows Vista and later:\_This
function has been disabled and returns E_NOTIMPL.

[戻り値]
Type: HRESULT Returns S_OK if successful, or an error value
otherwise. In Windows Vista and later versions, always returns
E_NOTIMPL.

[備考]
Note This function is available through Windows XP Service Pack 2
(SP2) and Windows Server 2003. It is not available in later versions
of Windows, including Windows Vista. This function creates the
requested object instance by calling the CoCreateInstance function
and immediately releasing the returned object. The associated DLL is
unloaded according to standard Component Object Model (COM) rules
when it returns S_OK from its DllCanUnloadNow function.


%index
SHLoadNonloadedIconOverlayIdentifiers
Signals the Shell that during the next operation requiring overlay information, it should load icon overlay identifiers that either failed creation or were not present for creation at startup. Identifiers that have already been loaded are not affected.
%group
Win32 shell32
%prm

%inst
Signals the Shell that during the next operation requiring overlay
information, it should load icon overlay identifiers that either
failed creation or were not present for creation at startup.
Identifiers that have already been loaded are not affected.

[戻り値]
Type: HRESULT Always returns S_OK.

[備考]
A call to SHLoadNonloadedIconOverlayIdentifiers does not result in
the immediate loading of a Shell extension, nor does it cause an icon
overlay handler to be loaded. A call to
SHLoadNonloadedIconOverlayIdentifiers results in a situation such
that the next code to ask for icon overlay information triggers a
comparison of icon overlays in the registry to those that are already
loaded. If an icon overlay is newly registered and the system has not
already reached its upper limit of fifteen icon overlays, the new
overlay is loaded. SHLoadNonloadedIconOverlayIdentifiers alone does
not load a new icon overlay; you also need to trigger an action that
uses the overlay, such as a refresh of a Windows Explorer view. For
more information, see How to Implement Icon Overlay Handlers.


%index
SHMapPIDLToSystemImageListIndex
SHMapPIDLToSystemImageListIndex may be altered or unavailable.
%group
Win32 shell32
%prm
pshf, pidl, piIndexSel
pshf : [var] Type: IShellFolder* An IShellFolder interface pointer for the folder that contains the item.
pidl : [var] Type: PCUITEMID_CHILD A pointer to the item's ITEMIDLIST structure.
piIndexSel : [var] Type: int* A pointer to an int that, when this function returns successfully, receives the index of the item's open icon in the system image list. If the item does not have a special open icon then the index of its normal icon is returned. If the open icon exists and cannot be obtained, then the value pointed to by piIndex is set to -1. This parameter can be NULL if the calling application is not interested in the open icon.
%inst
SHMapPIDLToSystemImageListIndex may be altered or unavailable.

[戻り値]
Type: int Returns the index of the item's normal icon in the system
image list if successful, or -1 otherwise.


%index
SHMultiFileProperties
Displays a merged property sheet for a set of files. Property values common to all the files are shown while those that differ display the string (multiple values).
%group
Win32 shell32
%prm
pdtobj, dwFlags
pdtobj : [var] Type: IDataObject* A pointer to a data object that supplies the PIDLs of all of the files for which to display the merged property sheet. The data object must use the CFSTR_SHELLIDLIST clipboard format. The parent folder's implementation of IShellFolder::GetDisplayNameOf must return a fully qualified file system path for each item in response to the SHGDN_FORPARSING flag.
dwFlags : [int] Type: DWORD Reserved. Must be set to 0.
%inst
Displays a merged property sheet for a set of files. Property values
common to all the files are shown while those that differ display the
string (multiple values).

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHObjectProperties
SHObjectProperties may be altered or unavailable.
%group
Win32 shell32
%prm
hwnd, shopObjectType, pszObjectName, pszPropertyPage
hwnd : [intptr] Type: HWND The handle of the parent window of the dialog box. This value can be NULL.
shopObjectType : [int] Type: DWORD A flag value that specifies the type of object.
pszObjectName : [wstr] Type: PCWSTR A null-terminated Unicode string that contains the object name. The contents of the string are determined by the flag set in shopObjectType.
pszPropertyPage : [wstr] Type: PCWSTR A null-terminated Unicode string that contains the name of the property sheet page to be opened initially. Set this parameter to NULL to specify the default page.
%inst
SHObjectProperties may be altered or unavailable.

[戻り値]
Type: BOOL TRUE if the command is successfully invoked; otherwise,
FALSE.


%index
SHOpenFolderAndSelectItems
Opens a Windows Explorer window with specified items in a particular folder selected.
%group
Win32 shell32
%prm
pidlFolder, cidl, apidl, dwFlags
pidlFolder : [var] Type: PCIDLIST_ABSOLUTE A pointer to a fully qualified item ID list that specifies the folder.
cidl : [int] Type: UINT A count of items in the selection array, apidl. If cidl is zero, then pidlFolder must point to a fully specified ITEMIDLIST describing a single item to select. This function opens the parent folder and selects that item.
apidl : [var] Type: PCUITEMID_CHILD_ARRAY A pointer to an array of PIDL structures, each of which is an item to select in the target folder referenced by pidlFolder.
dwFlags : [int] Type: DWORD The optional flags. Under Windows?XP this parameter is ignored. In Windows?Vista, the following flags are defined.
%inst
Opens a Windows Explorer window with specified items in a particular
folder selected.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
CoInitialize or CoInitializeEx must be called before using
SHOpenFolderAndSelectItems. Not doing so causes
SHOpenFolderAndSelectItems to fail.


%index
SHOpenWithDialog
Displays the Open With dialog box.
%group
Win32 shell32
%prm
hwndParent, poainfo
hwndParent : [intptr] Type: HWND The handle of the parent window. This value can be NULL.
poainfo : [var] Type: const OPENASINFO* A pointer to an OPENASINFO structure, which specifies the contents of the resulting dialog.
%inst
Displays the Open With dialog box.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
Starting in Windows 10, the OAIF_ALLOW_REGISTRATION,
OAIF_FORCE_REGISTRATION, and OAIF_HIDE_REGISTRATION flags will be
ignored by SHOpenWithDialog. The Open With dialog box can no longer
be used to change the default program used to open a file extension.
You can only use SHOpenWithDialog to open a single file. If
SHOpenWithDialog is called without passing OAIF_EXEC, the user will
receive a dialog that informs them that they can change the default
programs used to open file extensions in their Settings.


%index
SHParseDisplayName
Translates a Shell namespace object's display name into an item identifier list and returns the attributes of the object. This function is the preferred method to convert a string to a pointer to an item identifier list (PIDL).
%group
Win32 shell32
%prm
pszName, pbc, ppidl, sfgaoIn, psfgaoOut
pszName : [wstr] Type: LPCWSTR A pointer to a zero-terminated wide string that contains the display name to parse.
pbc : [var] Type: IBindCtx* A bind context that controls the parsing operation. This parameter is normally set to NULL.
ppidl : [var] Type: PIDLIST_ABSOLUTE* The address of a pointer to a variable of type ITEMIDLIST that receives the item identifier list for the object. If an error occurs, then this parameter is set to NULL.
sfgaoIn : [int] Type: SFGAOF A ULONG value that specifies the attributes to query. To query for one or more attributes, initialize this parameter with the flags that represent the attributes of interest. For a list of available SFGAO flags, see IShellFolder::GetAttributesOf.
psfgaoOut : [var] Type: SFGAOF* A pointer to a ULONG. On return, those attributes that are true for the object and were requested in sfgaoIn are set. An object's attribute flags can be zero or a combination of SFGAO flags. For a list of available SFGAO flags, see IShellFolder::GetAttributesOf.
%inst
Translates a Shell namespace object's display name into an item
identifier list and returns the attributes of the object. This
function is the preferred method to convert a string to a pointer to
an item identifier list (PIDL).

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
You should call this function from a background thread. Failure to do
so could cause the UI to stop responding.


%index
SHPathPrepareForWriteW
Checks to see if the path exists. (Unicode)
%group
Win32 shell32
%prm
hwnd, punkEnableModless, pszPath, dwFlags
hwnd : [intptr] Type: HWND A handle to a window that specifies the parent window to be used for any user interface windows that must be created. If set to NULL, user interface windows are not created.
punkEnableModless : [var] Type: IUnknown* A pointer to an IUnknown interface that specifies the IOleInPlaceActiveObject object that implements the EnableModeless method.
pszPath : [wstr] Type: LPCTSTR A pointer to a null-terminated string of maximum length MAX_PATH that specifies the path to be verified as valid for writing. This can be a UNC or file drive path.
dwFlags : [int] Type: DWORD
%inst
Checks to see if the path exists. (Unicode)

[戻り値]
Type: HRESULT Returns S_OK if the path is available, or an error code
otherwise. Note that a return value of S_OK does not mean that the
medium is writable; it simply means that the path is available.

[備考]
The primary use of this function is for a program to check a path
before using it and display the necessary user interface to prompt
the user. For example, if the disk in drive A: were missing, a window
that prompts the user to insert the disk would appear.
> [!NOTE] > The shlobj_core.h header defines SHPathPrepareForWrite as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
SHPropStgCreate
Ensures proper handling of code page retrieval or assignment for the requested property set operation.
%group
Win32 shell32
%prm
psstg, fmtid, pclsid, grfFlags, grfMode, dwDisposition, ppstg, puCodePage
psstg : [var] Type: IPropertySetStorage* A pointer to an IPropertySetStorage interface.
fmtid : [var] Type: REFFMTID A property set ID to open. The values for this parameter can be either one of those defined in Predefined Property Set Format Identifiers or any other FMTID that you register.
pclsid : [var] Type: const CLSID* A pointer to the CLSID associated with the set. This parameter can be NULL.
grfFlags : [int] Type: DWORD One or more members of the PROPSETFLAG enumeration that determine how the property set is created and opened. All sets containing ANSI bytes should be created with PROPSETFLAG_ANSI, otherwise PROPSETFLAG_DEFAULT.
grfMode : [int] Type: DWORD The flags from the STGM enumeration that indicate conditions for creating and deleting the object and access modes for the object. Must contain STGM_DIRECT | STGM_SHARE_EXCLUSIVE.
dwDisposition : [int] Type: DWORD
ppstg : [var] Type: IPropertyStorage** When this method returns, contains an IPropertyStorage interface pointer.
puCodePage : [var] Type: UINT* When this method returns, contains the address of the code page ID for the set.
%inst
Ensures proper handling of code page retrieval or assignment for the
requested property set operation.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHPropStgReadMultiple
Wraps the IPropertyStorage::ReadMultiple function to ensure that ANSI and Unicode translations are handled properly for deprecated property sets.
%group
Win32 shell32
%prm
pps, uCodePage, cpspec, rgpspec, rgvar
pps : [var] Type: IPropertyStorage* An IPropertyStorage interface pointer that identifies the property store.
uCodePage : [int] Type: UINT A code page value for ANSI string properties.
cpspec : [int] Type: ULONG A count of properties being read.
rgpspec : [var] Type: PROPSPEC const[] An array of properties to be read.
rgvar : [var] Type: PROPVARIANT[] An array of PROPVARIANT types that, when this function returns successfully, receives the property values.
%inst
Wraps the IPropertyStorage::ReadMultiple function to ensure that ANSI
and Unicode translations are handled properly for deprecated property
sets.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHPropStgWriteMultiple
Wraps the IPropertyStorage::WriteMultiple function to ensure that ANSI and Unicode translations are handled properly for deprecated property sets.
%group
Win32 shell32
%prm
pps, puCodePage, cpspec, rgpspec, rgvar, propidNameFirst
pps : [var] Type: IPropertyStorage* An IPropertyStorage interface pointer that identifies the property store.
puCodePage : [var] Type: UINT* A pointer to the code page value for ANSI string properties.
cpspec : [int] Type: ULONG A count of properties being set.
rgpspec : [var] Type: PROPSPEC const[] An array of PROPSPEC structures that contain the property information to be set.
rgvar : [var] Type: PROPVARIANT[] An array of PROPVARIANT types to set the property values.
propidNameFirst : [int] Type: PROPID The minimum value for property identifiers when they must be allocated. The value should be greater than or equal to PID_FIRST_USABLE.
%inst
Wraps the IPropertyStorage::WriteMultiple function to ensure that
ANSI and Unicode translations are handled properly for deprecated
property sets.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHQueryUserNotificationState
Checks the state of the computer for the current user to determine whether sending a notification is appropriate.
%group
Win32 shell32
%prm
pquns
pquns : [var] Type: QUERY_USER_NOTIFICATION_STATE* When this function returns, contains a pointer to one of the values of the QUERY_USER_NOTIFICATION_STATE enumeration.
%inst
Checks the state of the computer for the current user to determine
whether sending a notification is appropriate.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
Applications should call SHQueryUserNotificationState and test the
return value before displaying any notification UI that is similar to
the balloon notifications generated by Shell_NotifyIcon.
Notifications should only be displayed if this API returns
QNS_ACCEPTS_NOTIFICATIONS. This informs the application whether the
user is running processes that should not be interrupted. Top-level
windows receive a WM_SETTINGCHANGE message when the user turns
presentation settings on or off, and also when the user's session is
locked or unlocked. Note that there are no notifications sent when
the user starts or stops a full-screen application. If this function
returns QUNS_QUIET_TIME, notifications should be displayed only if
critical.


%index
SHRemoveLocalizedName
Removes the localized name of a file in a Shell folder.
%group
Win32 shell32
%prm
pszPath
pszPath : [wstr] Type: PCWSTR A pointer to a null-terminated, Unicode string that specifies the fully qualified path of the target file.
%inst
Removes the localized name of a file in a Shell folder.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
When a display name string is set by SHSetLocalizedName, Windows
Explorer uses that string for display instead of the file name. The
path to the file is unchanged. Applications can use the
IShellFolder::GetDisplayNameOf method to get the display (localized)
name through with the SIGDN_NORMALDISPLAY flag and the parsing
(non-localized) name with SIGDN_DESKTOPABSOLUTEPARSING. Calling
SHRemoveLocalizedName makes the display name identical to the parsing
name.


%index
SHReplaceFromPropSheetExtArray
Requests each property sheet in a property sheet extension array to replace pages. Each page is allowed up to one replacement.
%group
Win32 shell32
%prm
hpsxa, uPageID, lpfnReplaceWith, lParam
hpsxa : [intptr] Type: HPSXA A property sheet array handle (HPSXA) returned from a call to SHCreatePropSheetExtArray.
uPageID : [int] Type: UINT The ID of the page to replace.
lpfnReplaceWith : [int] Type: LPFNADDPROPSHEETPAGE A pointer to an AddPropSheetPageProc function used by the property sheet extension to add a page to a property sheet.
lParam : [intptr] Type: LPARAM An application-defined value.
%inst
Requests each property sheet in a property sheet extension array to
replace pages. Each page is allowed up to one replacement.

[戻り値]
Type: UINT The number of replacements actually performed.


%index
SHResolveLibrary
Resolves all locations in a library, even those locations that have been moved or renamed.
%group
Win32 shell32
%prm
psiLibrary
psiLibrary : [var] Type: IShellItem* A pointer to an IShellItem object that represents the library.
%inst
Resolves all locations in a library, even those locations that have
been moved or renamed.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
This function can block the calling thread for as long as it takes to
resolve all the locations in the specified library. Because it blocks
the thread from which it is called, it should not be called from a
thread that also handles user interface interactions. This function
resolves all locations in the specified library in a single call. To
resolve an individual location in a library, see the
IShellLibrary::ResolveFolder method or the
SHResolveFolderPathInLibrary function.


%index
SHRestricted
SHRestricted may be altered or unavailable.
%group
Win32 shell32
%prm
rest
rest : [int] Type: RESTRICTIONS Specifies one of the flags described in the RESTRICTIONS enumerated type.
%inst
SHRestricted may be altered or unavailable.

[戻り値]
Type: DWORD Returns nonzero if the specified restriction is in
effect, or zero otherwise.


%index
SHSetDefaultProperties
Applies the default set of properties on a Shell item.
%group
Win32 shell32
%prm
hwnd, psi, dwFileOpFlags, pfops
hwnd : [intptr] Type: HWND A handle to the item's parent window, which receives error notifications. This value can be NULL.
psi : [var] Type: IShellItem* A pointer to the IShellItem object that represents the item.
dwFileOpFlags : [int] Type: DWORD Flags that customize the operation. See IFileOperation::SetOperationFlags for flag values.
pfops : [var] Type: IFileOperationProgressSink* A pointer to an IFileOperationProgressSink object used to follow the progress of the operation. See IFileOperation::Advise for details. This value can be NULL.
%inst
Applies the default set of properties on a Shell item.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
The list of properties to set a default value comes from the
SetDefaultsFor registry entry under the ProgID for the file
association of the item. The list is prefixed by "prop:" and contains
the canonical names of the properties to set the default value, for
example, "prop:System.Author;System.Document.DateCreated". The
possible properties for this list are System.Author,
System.Document.DateCreated, and System.Photo.DateTaken. If the
SetDefaultsFor entry does not exist on the ProgID, this function uses
the default found on the SetDefaultsFor entry of HKEY_CLASSES_ROOT\*.


%index
SHSetFolderPathW
Deprecated. Assigns a new path to a system folder identified by its CSIDL. (Unicode)
%group
Win32 shell32
%prm
csidl, hToken, dwFlags, pszPath
csidl : [int] Type: int A CSIDL value that identifies the folder whose path is to be set. Only physical folders are valid. If a virtual folder is specified, this function fails. Add the CSIDL_FLAG_DONT_UNEXPAND value to the CSIDL to ensure that the string is written to the registry exactly as provided. If the CSIDL_FLAG_DONT_UNEXPAND flag is not included, portions of the path may be replaced by environment strings, such as %USERPROFILE%.
hToken : [intptr] Type: HANDLE An access token that can be used to represent a particular user. This parameter is usually set to NULL, in which case the function tries to access the current user's instance of the folder. However, you may need to assign a value to hToken for those folders that can have multiple users but are treated as belonging to a single user. The most commonly used folder of this type is Documents. The calling application is responsible for correct impersonation when hToken is non-null. It must have appropriate security privileges for the particular user, including TOKEN_QUERY and TOKEN_IMPERSONATE, and the user's registry hive must be currently mounted. See Access Control for further discussion of access control issues.
dwFlags : [int] Type: DWORD Reserved. Must be set to 0.
pszPath : [wstr] Type: LPCTSTR A pointer to a null-terminated string of length MAX_PATH that contains the folder's new path. This value cannot be NULL, and the string cannot be of zero length.
%inst
Deprecated. Assigns a new path to a system folder identified by its
CSIDL. (Unicode)

[戻り値]
Type: HRESULT Returns standard HRESULT codes, including the
following:
This doc was truncated.

[備考]
Note As of Windows Vista, this function is merely a wrapper for
SHSetKnownFolderPath. The CSIDL value is translated to its associated
KNOWNFOLDERID and SHSetKnownFolderPath is called. New applications
should use the known folder system rather than the older CSIDL
system, which is supported only for backward compatibility.
SHSetFolderPath is not exported by name from Shell32.dll. To use the
function, you must call GetProcAddress with ordinal 231 for
SHSetFolderPathA (for ANSI strings) or ordinal 232 for
SHSetFolderPathW (for Unicode strings) to obtain a function pointer.
It is recommended that the paths be expressed as Unicode strings
because folder names might contain Unicode characters not expressible
in ANSI.
> [!NOTE] > The shlobj_core.h header defines SHSetFolderPath as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
SHSetInstanceExplorer
Provides an interface that allows hosted Shell extensions and other components to prevent their host process from closing prematurely.
%group
Win32 shell32
%prm
punk
punk : [var] Type: IUnknown* A pointer to a free-threaded IUnknown. Components can use this interface (through SHGetInstanceExplorer) to prevent the host process from terminating. This value can be NULL, in which case the process reference is no longer made available to components.
%inst
Provides an interface that allows hosted Shell extensions and other
components to prevent their host process from closing prematurely.

[備考]
Windows Explorer and Internet Explorer can use SHSetInstanceExplorer
to allow components such as Shell extensions to extend the lifetime
of the process. Other applications can also use SHSetInstanceExplorer
to allow for the same capability. For instance, the browser message
loop and the proxy desktop use SHSetInstanceExplorer to let other
threads extend their lifetime. Applications other than Windows
Explorer and Internet Explorer that call this function might
encounter compatibility problems because some components use
SHGetInstanceExplorer to detect whether they are being hosted from
within Windows Explorer or Internet Explorer. The interface pointer
passed to SHSetInstanceExplorer must reference a free-threaded
object. Each time a component calls SHGetInstanceExplorer, the system
calls the AddRef method before returning the interface pointer to the
calling component. The component then calls the IUnknown::Release
method when processing is complete. The process that calls
SHSetInstanceExplorer must not terminate while the reference count of
the provided interface pointer is nonzero. For further information on
how components use the process references, see SHGetInstanceExplorer.


%index
SHSetKnownFolderPath
Redirects a known folder to a new location.
%group
Win32 shell32
%prm
rfid, dwFlags, hToken, pszPath
rfid : [var] Type: REFKNOWNFOLDERID A GUID that identifies the known folder.
dwFlags : [int] Type: DWORD Either 0 or the following value.
hToken : [intptr] Type: HANDLE An access token used to represent a particular user. This parameter is usually set to NULL, in which case the function tries to access the current user's instance of the folder. However, you may need to assign a value to hToken for those folders that can have multiple users but are treated as belonging to a single user. The most commonly used folder of this type is Documents.
pszPath : [wstr] Type: PCWSTR A pointer to the folder's new path. This is a null-terminated Unicode string of length MAX_PATH. This path cannot be of zero length.
%inst
Redirects a known folder to a new location.

[戻り値]
Type: HRESULT Returns S_OK if successful, or an error value
otherwise, including the following:
This doc was truncated.

[備考]
This function replaces SHSetFolderPath. That older function is now
simply a wrapper for SHSetKnownFolderPath. The caller of this
function must have Administrator privileges. To call this function on
public known folders, the caller must have Administrator privileges.
For per-user known folders the caller only requires User privileges.
Some of the known folders, for example, the Documents folder, are
per-user. Every user has a different path for their Documents folder.
If hToken is NULL, the API tries to access the calling application's
instance of the folder, which is that of the current user. If hToken
is a valid user token, the API tries to impersonate the user using
this token and tries to access that user's instance. This function
cannot be called on folders of type KF_CATEGORY_FIXED and
KF_CATEGORY_VIRTUAL. To call this function on a folder of type
KF_CATEGORY_COMMON, the calling application must be running with
elevated privileges.


%index
SHSetLocalizedName
Sets the localized name of a file in a Shell folder.
%group
Win32 shell32
%prm
pszPath, pszResModule, idsRes
pszPath : [wstr] Type: PCWSTR A pointer to a string that specifies the fully qualified path of the target file.
pszResModule : [wstr] Type: PCWSTR A pointer to a string resource that specifies the localized version of the file name.
idsRes : [int] Type: int An integer ID that specifies the localized file name in the string resource.
%inst
Sets the localized name of a file in a Shell folder.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
When this string is set, Explorer displays this string instead of the
file name. The path to the file is unchanged.
Applications can get the display (localized) name with
IShellFolder::GetDisplayNameOf with the SIGDN_NORMALDISPLAY flag and
the parsing (non-localized) name with IShellItem::GetDisplayName
using the SIGDN_DESKTOPABSOLUTEPARSING flag. Calling
SHRemoveLocalizedName makes the display name identical to the parsing
name.


%index
SHSetTemporaryPropertyForItem
Sets a temporary property for the specified item. A temporary property is kept in a read/write store that holds properties only for the lifetime of the IShellItem object, instead of writing them back into the item.
%group
Win32 shell32
%prm
psi, propkey, propvar
psi : [var] Type: IShellItem* A pointer to the item on which the temporary property is to be set.
propkey : [var] Type: REFPROPERTYKEY Reference to the PROPERTYKEY that identifies the temporary property that is being set.
propvar : [var] Type: REFPROPVARIANT Reference to a PROPVARIANT that contains the value of the temporary property.
%inst
Sets a temporary property for the specified item. A temporary
property is kept in a read/write store that holds properties only for
the lifetime of the IShellItem object, instead of writing them back
into the item.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
A temporary value can only be read with SHGetTemporaryPropertyForItem
or by passing GPS_TEMPORARY to IShellItem2::GetPropertyStore.


%index
SHSetUnreadMailCountW
Stores the current user's unread message count for a specified email account in the registry. (Unicode)
%group
Win32 shell32
%prm
pszMailAddress, dwCount, pszShellExecuteCommand
pszMailAddress : [wstr] Type: LPCTSTR A pointer to a string in Unicode that contains the current user's full email address.
dwCount : [int] Type: DWORD The number of unread messages.
pszShellExecuteCommand : [wstr] Type: LPCTSTR A pointer to a string in Unicode that contains the full text of a command that can be passed to ShellExecute. This command should start the email application that owns the account referenced by pszMailAddress.
%inst
Stores the current user's unread message count for a specified email
account in the registry. (Unicode)

[戻り値]
Type: HRESULT HRESULT, which includes the following possible values.
This doc was truncated.

[備考]
When this function updates the registry, the new registry entry is
automatically stamped with the current time and date. If this
function is called by different independent software vendors (ISVs)
that specify the same email name, only the last call is saved. That
is, calls to this function overwrite any previously saved value for
the same email address, even if the calls are made by different ISVs.
It is recommended that the count of unread messages be set only for
the main Inbox of the users account. Mail in sub-folders such as
Drafts or Deleted Items should be ignored. It is important that email
clients do not set the number of unread messages to 0 when the
application exits, because this causes the number of unread messages
to be erroneously reported as 0. Because this function uses
HKEY_CURRENT_USER, it should not be called by a system process
impersonating a user.


%index
SHShellFolderView_Message
SHShellFolderView_Message may be altered or unavailable.
%group
Win32 shell32
%prm
hwndMain, uMsg, lParam
hwndMain : [intptr] Type: HWND A handle to the window that receives the message.
uMsg : [int] Type: UINT The message to send. The following is a list of possible messages.
lParam : [intptr] Type: LPARAM Contents of this value depend on the message passed in uMsg. See individual message topics for more information.
%inst
SHShellFolderView_Message may be altered or unavailable.

[戻り値]
Type: LRESULT The return value depends on the message passed in uMsg.
See individual message topics for more information.


%index
SHShowManageLibraryUI
Shows the library management dialog box, which enables users to manage the library folders and default save location.
%group
Win32 shell32
%prm
psiLibrary, hwndOwner, pszTitle, pszInstruction, lmdOptions
psiLibrary : [var] Type: IShellItem* A pointer to an IShellItem object that represents the library that is to be managed.
hwndOwner : [intptr] Type: HWND The handle for the window that owns the library management dialog box. The value of this parameter can be NULL.
pszTitle : [wstr] Type: LPCWSTR A pointer to the title for the library management dialog. To display the generic title string, set the value of this parameter to NULL.
pszInstruction : [wstr] Type: LPCWSTR A pointer to a help string to display below the title string in the library management dialog box. To display the generic help string, set the value of this parameter to NULL.
lmdOptions : [int] Type: LIBRARYMANAGEDIALOGOPTIONS A value from the LIBRARYMANAGEDIALOGOPTIONS enumeration that specifies the behavior of the management dialog box.
%inst
Shows the library management dialog box, which enables users to
manage the library folders and default save location.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
SHSimpleIDListFromPath
Deprecated. Returns a pointer to an ITEMIDLIST structure when passed a path.
%group
Win32 shell32
%prm
pszPath
pszPath : [wstr] Type: PCWSTR A pointer to a null-terminated string that contains the path to be converted to a PIDL.
%inst
Deprecated. Returns a pointer to an ITEMIDLIST structure when passed
a path.

[戻り値]
Type: PIDLIST_ABSOLUTE Returns a pointer to an ITEMIDLIST structure
if successful, or NULL otherwise.

[備考]
Prior to Windows 7, this function was declared in Shlobj.h. In
Windows 7 and later versions, it is declared in Shobjidl.h. Note This
function is available through Windows 7 and Windows Server 2003. It
is possible that it will not be present in future versions of
Windows. An alternative to this function is as follows:
This doc was truncated.


%index
SHStartNetConnectionDialogW
SHStartNetConnectionDialog may be altered or unavailable. (Unicode)
%group
Win32 shell32
%prm
hwnd, pszRemoteName, dwType
hwnd : [intptr] Type: HWND A handle to the parent window.
pszRemoteName : [wstr] Type: LPCTSTR A pointer to a null-terminated character string that specifies the remote network name. This value can be set to NULL.
dwType : [int] Type: DWORD
%inst
SHStartNetConnectionDialog may be altered or unavailable. (Unicode)

[戻り値]
Type: HRESULT Always returns S_OK.

[備考]
> [!NOTE] > The shlobj_core.h header defines
SHStartNetConnectionDialog as an alias which automatically selects
the ANSI or Unicode version of this function based on the definition
of the UNICODE preprocessor constant. Mixing usage of the
encoding-neutral alias with code that not encoding-neutral can lead
to mismatches that result in compilation or runtime errors. For more
information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
SHTestTokenMembership
Uses CheckTokenMembership to test whether the given token is a member of the local group with the specified RID.
%group
Win32 shell32
%prm
hToken, ulRID
hToken : [intptr] Type: HANDLE A handle to the token. This value can be NULL.
ulRID : [int] Type: ULONG The RID of the local group for which membership is tested.
%inst
Uses CheckTokenMembership to test whether the given token is a member
of the local group with the specified RID.

[戻り値]
Type: BOOL Returns TRUE on success, FALSE on failure.

[備考]
This function wraps CheckTokenMembership and only checks local
groups.


%index
SHUpdateImageW
Notifies the Shell that an image in the system image list has changed. (Unicode)
%group
Win32 shell32
%prm
pszHashItem, iIndex, uFlags, iImageIndex
pszHashItem : [wstr] Type: LPCTSTR A pointer to a string value that specifies the fully qualified path of the file that contains the icon. Use the path that is returned in the buffer pointed to by the szIconFile parameter of IExtractIcon::GetIconLocation.
iIndex : [int] Type: int An integer that specifies the zero-based index of the icon in the file specified by pszHashItem. Use the value that is pointed to by the piIndex parameter of IExtractIcon::GetIconLocation.
uFlags : [int] Type: UINT An unsigned integer that specifies the flags that determine the icon attributes. Set uFlags to the value that is pointed to by the pwFlags parameter of IExtractIcon::GetIconLocation. The flags that are relevant to SHUpdateImage are GIL_NOTFILENAME and GIL_SIMULATEDOC.
iImageIndex : [int] Type: int An integer that specifies the index in the system image list of the icon that is being updated.
%inst
Notifies the Shell that an image in the system image list has
changed. (Unicode)

[備考]
If you do not know the index in the system image list of the icon
that you want to update, use SHGetFileInfo with the uFlags parameter
set to SHGFI_SYSICONINDEX. You must use IExtractIcon::GetIconLocation
with the parameters of the old icon that needs to be updated, not
those of the new icon you want to replace it with.
> [!NOTE] > The shlobj_core.h header defines SHUpdateImage as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
SHValidateUNC
SHValidateUNC may be altered or unavailable.
%group
Win32 shell32
%prm
hwndOwner, pszFile, fConnect
hwndOwner : [intptr] Type: HWND Handle of the parent window, used to display UI. If this is not needed, this value can be set to NULL.
pszFile : [wstr] Type: PWSTR A pointer to a null-terminated Unicode string that specifies the UNC path to validate. Note: This string must not be a constant string.
fConnect : [int] Type: UINT
%inst
SHValidateUNC may be altered or unavailable.

[戻り値]
Type: BOOL Returns TRUE if the UNC path exists; FALSE if the UNC path
does not exist or if some other failure occurred.


%index
SetCurrentProcessExplicitAppUserModelID
Specifies a unique application-defined Application User Model ID (AppUserModelID) that identifies the current process to the taskbar. This identifier allows an application to group its associated processes and windows under a single taskbar button.
%group
Win32 shell32
%prm
AppID
AppID : [wstr] Type: PCWSTR Pointer to the AppUserModelID to assign to the current process.
%inst
Specifies a unique application-defined Application User Model ID
(AppUserModelID) that identifies the current process to the taskbar.
This identifier allows an application to group its associated
processes and windows under a single taskbar button.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
This method must be called during an application's initial startup
routine before the application presents any UI or makes any
manipulation of its Jump Lists. This includes any call to
SHAddToRecentDocs.


%index
ShellAboutW
Displays a ShellAbout dialog box. (Unicode)
%group
Win32 shell32
%prm
hWnd, szApp, szOtherStuff, hIcon
hWnd : [intptr] Type: HWND A window handle to a parent window. This parameter can be NULL.
szApp : [wstr] Type: LPCTSTR A pointer to a null-terminated string that contains text to be displayed in the title bar of the ShellAbout dialog box and on the first line of the dialog box after the text "Microsoft". If the text contains a separator (#) that divides it into two parts, the function displays the first part in the title bar and the second part on the first line after the text "Microsoft".
szOtherStuff : [wstr] Type: LPCTSTR A pointer to a null-terminated string that contains text to be displayed in the dialog box after the version and copyright information. This parameter can be NULL.
hIcon : [intptr] Type: HICON The handle of an icon that the function displays in the dialog box. This parameter can be NULL, in which case the function displays the Windows icon.
%inst
Displays a ShellAbout dialog box. (Unicode)

[戻り値]
Type: int TRUE if successful; otherwise, FALSE.

[備考]
Note that the ShellAbout function dialog box uses text and a default
icon that are specific to Windows. To see an example of a ShellAbout
dialog box, choose About Windows from the Help menu drop-down list in
Windows Explorer.
> [!NOTE] > The shellapi.h header defines ShellAbout as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ShellExecuteW
指定されたファイルに対する操作を実行する。(ShellExecuteW)
%group
Win32 shell32
%prm
hwnd, lpOperation, lpFile, lpParameters, lpDirectory, nShowCmd
hwnd : [intptr] 型: HWND UI やエラーメッセージを表示するための親ウィンドウへのハンドル。ウィンドウに関連しない操作の場合は NULL を指定可能。
lpOperation : [wstr] 型: LPCTSTR 実行するアクション(verb)を指定する NULL 終端文字列へのポインタ。使用可能な verb はファイルやフォルダによって異なる。一般にオブジェクトのショートカットメニューから使用可能なアクションが verb として使える。
lpFile : [wstr] 型: LPCTSTR 指定された verb を実行するファイルまたはオブジェクトを指定する NULL 終端文字列へのポインタ。Shell 名前空間オブジェクトを指定するには完全修飾 parse name を渡す。すべての verb がすべてのオブジェクトでサポートされるわけではない。
lpParameters : [wstr] 型: LPCTSTR lpFile が実行ファイルの場合、アプリケーションに渡すパラメータを指定する NULL 終端文字列へのポインタ。書式は呼び出される verb に依存する。lpFile がドキュメントファイルの場合は NULL にすべき。
lpDirectory : [wstr] 型: LPCTSTR アクションの既定(作業)ディレクトリを指定する NULL 終端文字列へのポインタ。NULL の場合、現在の作業ディレクトリが使用される。
nShowCmd : [int] 型: INT アプリケーションを開くときにどのように表示するかを指定するフラグ。lpFile がドキュメントファイルの場合、フラグは単に関連アプリケーションに渡される。ShowWindow の nCmdShow パラメータに指定可能な任意の値。
%inst
指定されたファイルに対する操作を実行する。(ShellExecuteW)

[戻り値]
型: HINSTANCE 関数が成功した場合、32 より大きい値を返す。失敗した場合はエラーを示す値を返す。戻り値は 16 ビット
Windows アプリケーションとの後方互換性のため HINSTANCE としてキャストされるが、真の HINSTANCE
ではない。INT_PTR にキャストして 32 またはエラーコードと比較できる。
（以下省略）

[備考]
ShellExecute は Shell 拡張(データソース、コンテキストメニューハンドラ、verb
実装)に実行を委譲できるため、ShellExecute 呼び出し前に COM を初期化すべきである。一部の Shell 拡張は STA
を要求する。
（以下省略）


%index
Shell_GetCachedImageIndex
Shell_GetCachedImageIndex may be altered or unavailable.
%group
Win32 shell32
%prm
pwszIconPath, iIconIndex, uIconFlags
pwszIconPath : [wstr] Type: PCWSTR A pointer to a buffer that contains the path to the image file.
iIconIndex : [int] Type: int The index of the image within the file named at pwszIconPath.
uIconFlags : [int] Type: UINT Not used.
%inst
Shell_GetCachedImageIndex may be altered or unavailable.

[戻り値]
Type: int Returns the index of the image, or ?1 on failure.

[備考]
The Shell_GetCachedImageIndexA and Shell_GetCachedImageIndexW
versions of this function were added in Windows Vista. For Unicode
strings, call either Shell_GetCachedImageIndexW or
Shell_GetCachedImageIndex. For ANSI strings, you must call
Shell_GetCachedImageIndexA explicitly. Windows Server 2003 and
Windows XP: Only Shell_GetCachedImageIndex is supported.
Shell_GetCachedImageIndex requires a Unicode string.


%index
Shell_GetImageLists
Retrieves system image lists for large and small icons.
%group
Win32 shell32
%prm
phiml, phimlSmall
phiml : [intptr] Type: HIMAGELIST* A pointer to the handle of an image list which, on success, receives the system image list for large (32 x 32) icons.
phimlSmall : [intptr] Type: HIMAGELIST* A pointer to the handle of an image list which, on success, receives the system image list for small (16 x 16) icons.
%inst
Retrieves system image lists for large and small icons.

[戻り値]
Type: BOOL Returns TRUE on success. On failure, returns FALSE and the
image lists pointed to by phiml and phimlSmall are unchanged.

[備考]
Important The image lists retrieved through this function are global
system image lists; do not call ImageList_Destroy using them.


%index
Shell_MergeMenus
Shell_MergeMenus may be altered or unavailable.
%group
Win32 shell32
%prm
hmDst, hmSrc, uInsert, uIDAdjust, uIDAdjustMax, uFlags
hmDst : [intptr] Type: HMENU The destination menu to which hmSrc is added.
hmSrc : [intptr] Type: HMENU The source menu which is added to hmDst.
uInsert : [int] Type: UINT The point in hmDst after which the entries in hmSrc are inserted.
uIDAdjust : [int] Type: UINT This number is added to each menu's ID to give an adjusted ID. Set to 0 for no adjustment. The value for uIDAdjust would typically be the number of items in hmDst. This number can be obtained using the GetMenuItemCount.
uIDAdjustMax : [int] Type: UINT The maximum adjusted ID to add to the menu. Any adjusted ID greater than this value is not added. To allow all IDs, set this parameter to 0xFFFF.
uFlags : [int] Type: ULONG One or more of the following flags.
%inst
Shell_MergeMenus may be altered or unavailable.

[戻り値]
Type: UINT Returns the next open ID at the end of the menu (the
maximum adjusted ID + 1).


%index
SignalFileOpen
SignalFileOpen may be altered or unavailable.
%group
Win32 shell32
%prm
pidl
pidl : [var] Type: PCIDLIST_ABSOLUTE A PIDL that specifies the file.
%inst
SignalFileOpen may be altered or unavailable.

[戻り値]
Type: BOOL Returns TRUE if successful; otherwise FALSE.


%index
StgMakeUniqueName
Creates a unique name for a stream or storage object from a template.
%group
Win32 shell32
%prm
pstgParent, pszFileSpec, grfMode, riid, ppv
pstgParent : [var] Type: IStorage* A pointer to an IStorage object.
pszFileSpec : [wstr] Type: PCWSTR The format or template for the name of the stream or storage object.
grfMode : [int] Type: DWORD The access mode to use when opening the stream or storage object. For more information and descriptions of the possible values, see STGM Constants.
riid : [var] Type: REFIID A reference to the IID of the interface to retrieve through ppv, typically IID_IStorage or IID_IStream.
ppv : [var] Type: void** When this method returns, contains the interface pointer requested in riid. This is typically IStorage or IStream.
%inst
Creates a unique name for a stream or storage object from a template.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
It is recommended that you use the IID_PPV_ARGS macro, defined in
Objbase.h, to package the riid and ppv parameters. This macro
provides the correct IID based on the interface pointed to by the
value in ppv, which eliminates the possibility of a coding error.


%index
Win32DeleteFile
Win32DeleteFile may be altered or unavailable.
%group
Win32 shell32
%prm
pszPath
pszPath : [wstr] Type: PCWSTR A pointer to a buffer that contains the full name of the file to delete.
%inst
Win32DeleteFile may be altered or unavailable.

[戻り値]
Type: BOOL TRUE if the file was successfully deleted; otherwise
FALSE.


%index
WriteCabinetState
WriteCabinetState may be altered or unavailable.
%group
Win32 shell32
%prm
pcs
pcs : [var] Type: CABINETSTATE* A pointer to a CABINETSTATE structure that holds the values to be set.
%inst
WriteCabinetState may be altered or unavailable.

[戻り値]
Type: BOOL TRUE if successful; otherwise, FALSE.

