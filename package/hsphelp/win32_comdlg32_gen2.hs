; ============================================================
;   comdlg32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
CommDlgExtendedError
The CommDlgExtendedError function (commdlg.h) returns a common dialog box error code.
%group
Win32 comdlg32
%prm

%inst
The CommDlgExtendedError function (commdlg.h) returns a common dialog
box error code.

[戻り値]
Type: DWORD If the most recent call to a common dialog box function
succeeded, the return value is undefined. If the common dialog box
function returned FALSE because the user closed or canceled the
dialog box, the return value is zero. Otherwise, the return value is
a nonzero error code. The CommDlgExtendedError function can return
general error codes for any of the common dialog box functions. In
addition, there are error codes that are returned only for a specific
common dialog box. All of these error codes are defined in Cderr.h.
The following general error codes can be returned for any of the
common dialog box functions.
This doc was truncated.


%index
GetFileTitleW
Retrieves the name of the specified file. (Unicode)
%group
Win32 comdlg32
%prm
param0, Buf, cchSize
param0 : [wstr] 
Buf : [wstr] Type: LPTSTR The buffer that receives the name of the file.
cchSize : [int] Type: WORD The length, in characters, of the buffer pointed to by the lpszTitle parameter.
%inst
Retrieves the name of the specified file. (Unicode)

[戻り値]
Type: short If the function succeeds, the return value is zero. If
the file name is invalid, the return value is unknown. If there is an
error, the return value is a negative number. If the buffer pointed
to by the lpszTitle parameter is too small, the return value is a
positive integer that specifies the required buffer size, in
characters. The required buffer size includes the terminating null
character.

[備考]
GetFileTitle should only be called with legal file names; using an
illegal file name has an undefined result. To get the buffer size
needed for the name of a file, call the function with lpszTitle set
to NULL and cchSize set to zero. The function returns the required
size. GetFileTitle returns the string that the system would use to
display the file name to the user. The display name includes an
extension only if that is the user's preference for displaying file
names. This means that the returned string may not accurately
identify the file if it is used in calls to file system functions. If
the lpszTitle buffer is too small, GetFileTitle returns the size
required to hold the display name. However, there is no guaranteed
relationship between the required size and the characters originally
specified in the lpszFile buffer. For example, do not call
GetFileTitle with lpszTitle set to NULL and cchSize set to zero, and
then try to use the return value as an index into the lpszFile
string. You can usually achieve similar results (and superior
performance) with C run-time library functions such as strrchr,
wcsrchr, and _mbsrchr.
> [!NOTE] > The commdlg.h header defines GetFileTitle as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).

