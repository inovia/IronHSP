; ============================================================
;   imm32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
ImmDestroyContext
ImmDestroyContext 関数 (immdev.h) は入力コンテキストを解放し関連メモリを解放する。
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst
ImmDestroyContext 関数 (immdev.h) は入力コンテキストを解放し関連メモリを解放する。

[戻り値]
成功時は 0 以外、失敗時は 0 を返す。

[備考]
ImmCreateContext で入力コンテキストを作成したアプリケーションは終了前に本関数で解放する必要がある。ただし呼び出し前に
ImmAssociateContext でスレッド内のウィンドウとの関連付けを解除しておく必要がある。


%index
ImmAssociateContext
ImmAssociateContext 関数 (immdev.h) は指定の入力コンテキストを指定ウィンドウに関連付ける。
%group
Win32 imm32
%prm
param0, param1
param0 : [intptr] 
param1 : [intptr] 
%inst
ImmAssociateContext 関数 (immdev.h) は指定の入力コンテキストを指定ウィンドウに関連付ける。

[戻り値]
以前にそのウィンドウに関連付けられていた入力コンテキストのハンドルを返す。

[備考]

入力コンテキストをウィンドウに関連付ける際、アプリケーションは入力コンテキストを破棄する前に関連付けを解除しなければならない。ハンドルを保存しておき、ウィンドウの既定入力コンテキストに戻すのが一つの方法。


%index
ImmAssociateContextEx
The ImmAssociateContextEx function (immdev.h) changes the association between the input method context and the specified window or its children.
%group
Win32 imm32
%prm
param0, param1, param2
param0 : [intptr] 
param1 : [intptr] 
param2 : [int] 
%inst
The ImmAssociateContextEx function (immdev.h) changes the association
between the input method context and the specified window or its
children.

[戻り値]
Returns TRUE if successful or FALSE otherwise.

[備考]
If the application calls this function with IACE_CHILDREN, the
operating system associates the specified input method context with
child windows of the window indicated by hWnd. It associates the
input method context only with child windows of the thread that
creates hWnd. Any child window that is created after this function
has been called will not be affected. Instead, the default input
method context will be associated with it. If the application calls
this function with IACE_DEFAULT, the operating system restores the
default input method context for the window. In this case, the hIMC
parameter is ignored.


%index
ImmConfigureIMEA
The ImmConfigureIMEA (ANSI) function (immdev.h) displays the configuration dialog box for the IME of the specified input locale identifier.
%group
Win32 imm32
%prm
param0, param1, param2, param3
param0 : [intptr] 
param1 : [intptr] 
param2 : [int] 
param3 : [intptr] 
%inst
The ImmConfigureIMEA (ANSI) function (immdev.h) displays the
configuration dialog box for the IME of the specified input locale
identifier.

[戻り値]
Returns a nonzero value if successful, or 0 otherwise.

[備考]
> [!NOTE] > The immdev.h header defines ImmConfigureIME as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ImmConfigureIMEW
The ImmConfigureIMEW (Unicode) function (immdev.h) displays the configuration dialog box for the IME of the specified input locale identifier.
%group
Win32 imm32
%prm
param0, param1, param2, param3
param0 : [intptr] 
param1 : [intptr] 
param2 : [int] 
param3 : [intptr] 
%inst
The ImmConfigureIMEW (Unicode) function (immdev.h) displays the
configuration dialog box for the IME of the specified input locale
identifier.

[戻り値]
Returns a nonzero value if successful, or 0 otherwise.

[備考]
> [!NOTE] > The immdev.h header defines ImmConfigureIME as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ImmCreateContext
The ImmCreateContext function (immdev.h) creates a new input context, allocating memory for the context and initializing it.
%group
Win32 imm32
%prm

%inst
The ImmCreateContext function (immdev.h) creates a new input context,
allocating memory for the context and initializing it.

[戻り値]
Returns the handle to the new input context if successful, or NULL
otherwise.


%index
ImmCreateIMCC
(no summary)
%group
Win32 imm32
%prm
param0
param0 : [int] 
%inst



%index
ImmCreateSoftKeyboard
(no summary)
%group
Win32 imm32
%prm
param0, param1, param2, param3
param0 : [int] 
param1 : [intptr] 
param2 : [int] 
param3 : [int] 
%inst



%index
ImmDestroyIMCC
(no summary)
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst



%index
ImmDestroySoftKeyboard
(no summary)
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst



%index
ImmDisableIME
The ImmDisableIME function (immdev.h) disables the IME for a thread or for all threads in a process.
%group
Win32 imm32
%prm
param0
param0 : [int] 
%inst
The ImmDisableIME function (immdev.h) disables the IME for a thread
or for all threads in a process.

[戻り値]
Returns TRUE if successful or FALSE otherwise.

[備考]
The application must call this function before the first top-level
window in the thread receives the WM_CREATE message. Thus, the
application must call this function in one of the following places:
This doc was truncated.


%index
ImmDisableLegacyIME
The ImmDisableLegacyIME function (immdev.h) indicates that this thread is a Windows Store app UI thread.
%group
Win32 imm32
%prm

%inst
The ImmDisableLegacyIME function (immdev.h) indicates that this
thread is a Windows Store app UI thread.

[戻り値]
Returns TRUE if successful; otherwise, FALSE.

[備考]
Windows Store app brokers such as explorer.exe should call this
function in Windows Store app UI threads to ensure that only IMEs
that are compatible with Windows Store apps are made available. Those
Windows Store app threads that don't require IME input should call
ImmDisableIME to disable IMM entirely for that thread. The app must
call this function before the first top-level window in the thread
receives the WM_CREATE message. Thus, the app must call this function
in one of the following places:
This doc was truncated.


%index
ImmDisableTextFrameService
The ImmDisableTextFrameService function (immdev.h) is no longer available for use as of Windows?Vista.
%group
Win32 imm32
%prm
idThread
idThread : [int] Identifier of the thread for which to disable the text service. The thread must be in the same process as the application. The application sets this parameter to 0 to disable the service for the current thread. The application sets the parameter to ?1 to disable the service for all threads in the current process.
%inst
The ImmDisableTextFrameService function (immdev.h) is no longer
available for use as of Windows Vista.

[戻り値]
Returns TRUE if successful or FALSE otherwise.

[備考]
An application calls this function if it has a thread that is
incompatible with TSF. Note that TSF functionality is provided to
applications that are not specifically written to use TSF, Input
Method Manager (IMM32), or Active Input Method Manager (AIMM 1.2).
Although an application can be written to use TSF, IMM32, and AIMM
1.2, there can be specific controls within the application that do
not use these technologies. TSF support is provided to these specific
controls as well. This TSF feature is available beginning with
Windows XP when all of these dynamic-link libraries (DLLs) are
loaded: system modules User32.dll, Imm32.dll, and Win32k.sys, and TSF
modules Msctf.dll and Msimtf.dll.


%index
ImmEnumInputContext
The ImmEnumInputContext function (immdev.h) retrieves the input context for the specified thread.
%group
Win32 imm32
%prm
idThread, lpfn, lParam
idThread : [int] 
lpfn : [int] Pointer to the enumeration callback function. For more information, see EnumInputContext.
lParam : [intptr] Application-supplied data. The function passes this data to the callback function.
%inst
The ImmEnumInputContext function (immdev.h) retrieves the input
context for the specified thread.

[戻り値]
Returns TRUE if successful or FALSE otherwise.

[備考]
This function calls the application callback function for each
enumerated input context, and passes the specified lParam value.


%index
ImmEnumRegisterWordW
The ImmEnumRegisterWordW (Unicode) function (immdev.h) enumerates the register strings having the specified reading string, style, and register string.
%group
Win32 imm32
%prm
param0, param1, lpszReading, param3, lpszRegister, param5
param0 : [intptr] 
param1 : [int] 
lpszReading : [wstr] Pointer to the reading string to enumerate. The application sets this parameter to NULL if the function is to enumerate all available reading strings that match the dwStyle and lpszRegister settings.
param3 : [int] 
lpszRegister : [wstr] Pointer to the register string to enumerate. The application sets this parameter to NULL if the function is to enumerate all register strings that match the lpszReading and dwStyle settings.
param5 : [intptr] 
%inst
The ImmEnumRegisterWordW (Unicode) function (immdev.h) enumerates the
register strings having the specified reading string, style, and
register string.

[戻り値]
Returns the last value returned by the callback function, with the
meaning defined by the application. The function returns 0 if it
cannot enumerate the register strings.

[備考]
If dwStyle is set to 0 and both lpszReading and lpszRegister are set
to NULL, this function enumerates all register strings in the IME
dictionary. > [!NOTE] > The immdev.h header defines
ImmEnumRegisterWord as an alias which automatically selects the ANSI
or Unicode version of this function based on the definition of the
UNICODE preprocessor constant. Mixing usage of the encoding-neutral
alias with code that not encoding-neutral can lead to mismatches that
result in compilation or runtime errors. For more information, see
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ImmEscapeW
The ImmEscapeW (Unicode) function (immdev.h) accesses capabilities of particular IMEs that are not available through other IME API functions.
%group
Win32 imm32
%prm
param0, param1, param2, param3
param0 : [intptr] 
param1 : [intptr] 
param2 : [int] 
param3 : [intptr] 
%inst
The ImmEscapeW (Unicode) function (immdev.h) accesses capabilities of
particular IMEs that are not available through other IME API
functions.

[戻り値]
Returns an operation-specific value if successful, or 0 otherwise.

[備考]
When uEscape is set to IME_ESC_QUERY_SUPPORT, lpData indicates the
buffer containing the IME escape value. For example, to see if the
current IME supports IME_ESC_GETHELPFILENAME, your application uses
the following call:
This doc was truncated.


%index
ImmGenerateMessage
(no summary)
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst



%index
ImmGetCandidateListW
The ImmGetCandidateListW (Unicode) function (immdev.h) retrieves a candidate list.
%group
Win32 imm32
%prm
param0, deIndex, lpCandList, dwBufLen
param0 : [intptr] 
deIndex : [int] Zero-based index of the candidate list.
lpCandList : [var] Pointer to a CANDIDATELIST structure in which the function retrieves the candidate list.
dwBufLen : [int] Size, in bytes, of the buffer to receive the candidate list. The application can specify 0 for this parameter if the function is to return the required size of the output buffer only.
%inst
The ImmGetCandidateListW (Unicode) function (immdev.h) retrieves a
candidate list.

[戻り値]
Returns the number of bytes copied to the candidate list buffer if
successful. If the application has supplied 0 for the dwBufLen
parameter, the function returns the size required for the candidate
list buffer. The function returns 0 if it does not succeed.

[備考]
> [!NOTE] > The immdev.h header defines ImmGetCandidateList as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ImmGetCandidateListCountW
The ImmGetCandidateListCountW (Unicode) function (immdev.h) retrieves the size of the candidate lists.
%group
Win32 imm32
%prm
param0, lpdwListCount
param0 : [intptr] 
lpdwListCount : [var] Pointer to the buffer in which this function retrieves the size of the candidate lists.
%inst
The ImmGetCandidateListCountW (Unicode) function (immdev.h) retrieves
the size of the candidate lists.

[戻り値]
Returns the number of bytes required for all candidate lists if
successful, or 0 otherwise.

[備考]
Applications typically call this function in response to an
IMN_OPENCANDIDATE or IMN_CHANGECANDIDATE command.
> [!NOTE] > The immdev.h header defines ImmGetCandidateListCount as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ImmGetCandidateWindow
The ImmGetCandidateWindow function (immdev.h) retrieves information about the candidates window.
%group
Win32 imm32
%prm
param0, param1, lpCandidate
param0 : [intptr] 
param1 : [int] 
lpCandidate : [var] Pointer to a CANDIDATEFORM structure in which this function retrieves information about the candidates window.
%inst
The ImmGetCandidateWindow function (immdev.h) retrieves information
about the candidates window.

[戻り値]
Returns a nonzero value if successful, or 0 otherwise.


%index
ImmGetCompositionFontW
The ImmGetCompositionFontW (Unicode) function (immdev.h) retrieves information about the logical font currently used to display characters in the composition window.
%group
Win32 imm32
%prm
param0, lplf
param0 : [intptr] 
lplf : [var] Pointer to a LOGFONT structure in which this function retrieves the font information.
%inst
The ImmGetCompositionFontW (Unicode) function (immdev.h) retrieves
information about the logical font currently used to display
characters in the composition window.

[戻り値]
Returns a nonzero value if successful, or 0 otherwise.

[備考]
> [!NOTE] > The immdev.h header defines ImmGetCompositionFont as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ImmGetCompositionStringW
ImmGetCompositionStringW (Unicode) 関数 (immdev.h) は組み立て中文字列の情報を取得する。
%group
Win32 imm32
%prm
param0, param1, lpBuf, dwBufLen
param0 : [intptr] 
param1 : [int] 
lpBuf : [intptr] 組み立て中文字列情報を受け取るバッファへのポインタ。
dwBufLen : [int] 出力バッファのサイズ(バイト単位)。Unicode 文字列の場合もバイト単位。0 を渡すと必要サイズを返す。
%inst
ImmGetCompositionStringW (Unicode) 関数 (immdev.h) は組み立て中文字列の情報を取得する。

[戻り値]
出力バッファにコピーされたバイト数を返す。dwBufLen が 0 の場合、終端 NULL
を除いた必要バッファサイズをバイト単位で返す。戻り値は要求情報が Unicode
文字列でも常にバイト単位。失敗時は以下の負のエラーコードのいずれかを返す:
（以下省略）

[備考]
WM_IME_COMPOSITION または WM_IME_STARTCOMPOSITION
メッセージへの応答として呼び出す。ImmReleaseContext を呼ぶと IMM は情報を除去する。注意: SIP
と併用される場合は全角ひらがなと半角カタカナの両方を扱うコードが必要。
> [!NOTE] > immdev.h は UNICODE マクロに応じて ImmGetCompositionString を
ANSI/Unicode 版のエイリアスとして定義する。


%index
ImmGetCompositionWindow
The ImmGetCompositionWindow function (immdev.h) retrieves information about the composition window.
%group
Win32 imm32
%prm
param0, lpCompForm
param0 : [intptr] 
lpCompForm : [var] Pointer to a COMPOSITIONFORM structure in which the function retrieves information about the composition window.
%inst
The ImmGetCompositionWindow function (immdev.h) retrieves information
about the composition window.

[戻り値]
Returns a nonzero value if successful, or 0 otherwise.


%index
ImmGetContext
ImmGetContext 関数 (immdev.h) は指定ウィンドウに関連付けられた入力コンテキストを返す。
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst
ImmGetContext 関数 (immdev.h) は指定ウィンドウに関連付けられた入力コンテキストを返す。

[戻り値]
入力コンテキストのハンドルを返す。

[備考]
アプリケーションはコンテキスト内の情報にアクセスする前に本関数で現在の入力コンテキストを取得するのが定石。使用後は必ず
ImmReleaseContext を呼ぶ。


%index
ImmGetConversionListW
The ImmGetConversionListW (Unicode) function (immdev.h) retrieves the conversion result list of characters or words without generating any IME-related messages.
%group
Win32 imm32
%prm
param0, param1, lpSrc, lpDst, dwBufLen, uFlag
param0 : [intptr] 
param1 : [intptr] 
lpSrc : [wstr] Pointer to a null-terminated character string specifying the source of the list.
lpDst : [var] Pointer to a CANDIDATELIST structure in which the function retrieves the list.
dwBufLen : [int] Size, in bytes, of the output buffer. The application sets this parameter to 0 if the function is to return the buffer size required for the complete conversion result list.
uFlag : [int] 
%inst
The ImmGetConversionListW (Unicode) function (immdev.h) retrieves the
conversion result list of characters or words without generating any
IME-related messages.

[戻り値]
Returns the number of bytes copied to the output buffer. If the
application sets the dwBufLen parameter to 0, the function returns
the size, in bytes, of the required output buffer.

[備考]
> [!NOTE] > The immdev.h header defines ImmGetConversionList as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ImmGetConversionStatus
The ImmGetConversionStatus function (immdev.h) retrieves the current conversion status.
%group
Win32 imm32
%prm
param0, lpfdwConversion, lpfdwSentence
param0 : [intptr] 
lpfdwConversion : [var] Pointer to a variable in which the function retrieves a combination of conversion mode values. For more information, see IME Conversion Mode Values.
lpfdwSentence : [var] Pointer to a variable in which the function retrieves a sentence mode value. For more information, see IME Sentence Mode Values.
%inst
The ImmGetConversionStatus function (immdev.h) retrieves the current
conversion status.

[戻り値]
Returns a nonzero value if successful, or 0 otherwise.

[備考]
Conversion and sentence mode values are set only if the IME supports
those modes.


%index
ImmGetDefaultIMEWnd
ImmGetDefaultIMEWnd 関数 (immdev.h) は IME クラスの既定ウィンドウハンドルを取得する。
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst
ImmGetDefaultIMEWnd 関数 (immdev.h) は IME クラスの既定ウィンドウハンドルを取得する。

[戻り値]
成功時は IME クラスの既定ウィンドウハンドルを返す。失敗時は NULL。

[備考]
OS は各スレッドに対して既定 IME ウィンドウを作成する。作成は IME クラスに基づく。アプリケーションはこのウィンドウに
WM_IME_CONTROL メッセージを送れる。


%index
ImmGetDescriptionW
The ImmGetDescriptionW (Unicode) function (immdev.h) copies the description of the IME to the specified buffer.
%group
Win32 imm32
%prm
param0, lpszDescription, uBufLen
param0 : [intptr] 
lpszDescription : [wstr] Pointer to a buffer in which the function retrieves the null-terminated string describing the IME.
uBufLen : [int] Size, in characters, of the output buffer. The application sets this parameter to 0 if the function is to return the buffer size needed for the complete description, excluding the terminating null character. Windows?NT, Windows?2000, Windows?XP: The size of the buffer is in Unicode characters, each consisting of two bytes. If the parameter is set to 0, the function returns the size of the buffer required in Unicode characters, excluding the Unicode terminating null character.
%inst
The ImmGetDescriptionW (Unicode) function (immdev.h) copies the
description of the IME to the specified buffer.

[戻り値]
Returns the number of characters copied to the output buffer. If the
application sets the uBufLen parameter to 0, the function returns the
size of the buffer required to receive the description. Neither value
includes the terminating null character. For Unicode, the function
returns the number of Unicode characters, not including the Unicode
terminating null character.

[備考]
> [!NOTE] > The immdev.h header defines ImmGetDescription as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ImmGetGuideLineW
The ImmGetGuideLineW (Unicode) function (immdev.h) retrieves information about errors. Applications use the information for user notifications.
%group
Win32 imm32
%prm
param0, dwIndex, lpBuf, dwBufLen
param0 : [intptr] 
dwIndex : [int] 
lpBuf : [wstr] Pointer to a buffer in which the function retrieves the error message string. This parameter contains NULL if dwIndex is not GGL_STRING or GGL_PRIVATE or if dwBufLen is set to 0.
dwBufLen : [int] Size, in bytes, of the output buffer. The application sets this parameter to 0 if the function is to return the buffer size needed to receive the error message string, not including the terminating null character.
%inst
The ImmGetGuideLineW (Unicode) function (immdev.h) retrieves
information about errors. Applications use the information for user
notifications.

[戻り値]
Returns an error level, an error index, or the size of an error
message string, depending on the value of the dwIndex parameter. If
dwIndex is GGL_LEVEL, the return is one of the following values.
This doc was truncated.

[備考]
Applications typically call this function after receiving an
IMN_GUIDELINE command.
> [!NOTE] > The immdev.h header defines ImmGetGuideLine as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ImmGetHotKey
(no summary)
%group
Win32 imm32
%prm
param0, lpuModifiers, lpuVKey, phKL
param0 : [int] 
lpuModifiers : [var] 
lpuVKey : [var] 
phKL : [intptr] 
%inst



%index
ImmGetIMCCLockCount
(no summary)
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst



%index
ImmGetIMCCSize
(no summary)
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst



%index
ImmGetIMCLockCount
(no summary)
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst



%index
ImmGetIMEFileNameW
The ImmGetIMEFileNameW (Unicode) function (immdev.h) retrieves the file name of the IME associated with the specified input locale.
%group
Win32 imm32
%prm
param0, lpszFileName, uBufLen
param0 : [intptr] 
lpszFileName : [wstr] Pointer to a buffer in which the function retrieves the file name. This parameter contains NULL when uBufLen is set to NULL.
uBufLen : [int] Size, in bytes, of the output buffer. The application specifies 0 if the function is to return the buffer size needed to receive the file name, not including the terminating null character. For Unicode, uBufLen specifies the size in Unicode characters, not including the terminating null character.
%inst
The ImmGetIMEFileNameW (Unicode) function (immdev.h) retrieves the
file name of the IME associated with the specified input locale.

[戻り値]
Returns the number of bytes in the file name copied to the output
buffer. If the application sets uBufLen to 0, the function returns
the size of the buffer required for the file name. In either case,
the terminating null character is not included. For Unicode, the
function returns the number of Unicode characters copied into the
output buffer, not including the Unicode terminating null character.

[備考]
In the registry, the operating system stores the file name as the
"IME name value" in the registry key
HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Keyboard
Layouts\HKL.
> [!NOTE] > The immdev.h header defines ImmGetIMEFileName as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ImmGetImeMenuItemsW
The ImmGetImeMenuItemsW (Unicode) function (immdev.h) retrieves the menu items that are registered in the IME menu of a specified input context.
%group
Win32 imm32
%prm
param0, param1, param2, lpImeParentMenu, lpImeMenu, dwSize
param0 : [intptr] 
param1 : [int] 
param2 : [int] 
lpImeParentMenu : [var] Pointer to an IMEMENUITEMINFO structure in which the function retrieves parent menu information. To retrieve information about the submenu items of this parent menu, the application sets the fType member to MFT_SUBMENU. This parameter contains NULL if the function retrieves only top-level menu items.
lpImeMenu : [var] Pointer to an array of IMEMENUITEMINFO structures in which the function retrieves information about the menu items. This parameter contains NULL if the function retrieves the number of registered menu items.
dwSize : [int] Size of the buffer to receive the IMEMENUITEMINFO structure.
%inst
The ImmGetImeMenuItemsW (Unicode) function (immdev.h) retrieves the
menu items that are registered in the IME menu of a specified input
context.

[戻り値]
Returns the number of menu items copied into lpImeMenu. If lpImeMenu
specifies NULL, the function returns the number of registered menu
items in the specified input context.

[備考]
> [!NOTE] > The immdev.h header defines ImmGetImeMenuItems as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ImmGetOpenStatus
The ImmGetOpenStatus function (immdev.h) determines whether the IME is open or closed.
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst
The ImmGetOpenStatus function (immdev.h) determines whether the IME
is open or closed.

[戻り値]
Returns a nonzero value if the IME is open, or 0 otherwise.


%index
ImmGetProperty
The ImmGetProperty function (immdev.h) retrieves the property and capabilities of the IME associated with the specified input locale.
%group
Win32 imm32
%prm
param0, param1
param0 : [intptr] 
param1 : [int] 
%inst
The ImmGetProperty function (immdev.h) retrieves the property and
capabilities of the IME associated with the specified input locale.

[戻り値]
Returns the property or capability value, depending on the value of
the dwIndex parameter. If dwIndex is set to IGP_PROPERTY, the
function returns one or more of the following values:
This doc was truncated.


%index
ImmGetRegisterWordStyleW
The ImmGetRegisterWordStyleW (Unicode) function (immdev.h) retrieves a list of the styles supported by the IME associated with the specified input locale.
%group
Win32 imm32
%prm
param0, nItem, lpStyleBuf
param0 : [intptr] 
nItem : [int] Maximum number of styles that the output buffer can hold. The application sets this parameter to 0 if the function is to count the number of styles available in the IME.
lpStyleBuf : [var] Pointer to a STYLEBUF structure in which the function retrieves the style information.
%inst
The ImmGetRegisterWordStyleW (Unicode) function (immdev.h) retrieves
a list of the styles supported by the IME associated with the
specified input locale.

[戻り値]
Returns the number of styles copied to the buffer. If the application
sets the nItem parameter to 0, the return value is the number of
styles available in the IME.

[備考]
> [!NOTE] > The immdev.h header defines ImmGetRegisterWordStyle as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ImmGetStatusWindowPos
The ImmGetStatusWindowPos function (immdev.h) retrieves the position of the status window.
%group
Win32 imm32
%prm
param0, lpptPos
param0 : [intptr] 
lpptPos : [var] Pointer to a POINT structure in which the function retrieves the position coordinates. These are screen coordinates, relative to the upper left corner of the screen.
%inst
The ImmGetStatusWindowPos function (immdev.h) retrieves the position
of the status window.

[戻り値]
Returns a nonzero value if successful, or 0 otherwise.


%index
ImmGetVirtualKey
The ImmGetVirtualKey function (immdev.h) retrieves the original virtual key value associated with a key input message that the IME has already processed.
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst
The ImmGetVirtualKey function (immdev.h) retrieves the original
virtual key value associated with a key input message that the IME
has already processed.

[戻り値]
If TranslateMessage has been called by the application,
ImmGetVirtualKey returns VK_PROCESSKEY; otherwise, it returns the
virtual key.

[備考]
Although the IME sets the virtual key value to VK_PROCESSKEY after
processing a key input message, an application can recover the
original virtual key value with the ImmGetVirtualKey function. This
function is used only for key input messages containing the
VK_PROCESSKEY value. Applications can only get the original virtual
key by using this function after receiving the WM_KEYDOWN
(VK_PROCESSKEY) message, and before TranslateMessage is called in its
own message loop.


%index
ImmInstallIMEA
The ImmInstallIMEA (ANSI) function (immdev.h) installs an IME.
%group
Win32 imm32
%prm
lpszIMEFileName, lpszLayoutText
lpszIMEFileName : [str] Pointer to a null-terminated string that specifies the full path of the IME.
lpszLayoutText : [str] Pointer to a null-terminated string that specifies the name of the IME and the associated layout text.
%inst
The ImmInstallIMEA (ANSI) function (immdev.h) installs an IME.

[戻り値]
Returns the input locale identifier for the IME.

[備考]
This function is intended to be used by IME setup applications only.
> [!NOTE] > The immdev.h header defines ImmInstallIME as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ImmInstallIMEW
The ImmInstallIMEW (Unicode) function (immdev.h) installs an IME.
%group
Win32 imm32
%prm
lpszIMEFileName, lpszLayoutText
lpszIMEFileName : [wstr] Pointer to a null-terminated string that specifies the full path of the IME.
lpszLayoutText : [wstr] Pointer to a null-terminated string that specifies the name of the IME and the associated layout text.
%inst
The ImmInstallIMEW (Unicode) function (immdev.h) installs an IME.

[戻り値]
Returns the input locale identifier for the IME.

[備考]
This function is intended to be used by IME setup applications only.
> [!NOTE] > The immdev.h header defines ImmInstallIME as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ImmIsIME
ImmIsIME 関数 (immdev.h) は指定の入力ロケールが IME を持つかを判定する。
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst
ImmIsIME 関数 (immdev.h) は指定の入力ロケールが IME を持つかを判定する。

[戻り値]
ロケールが IME を持つ場合 0 以外、そうでなければ 0 を返す。


%index
ImmIsUIMessageW
The ImmIsUIMessageW (Unicode) function (immdev.h) checks for messages intended for the IME window and sends those messages to the window.
%group
Win32 imm32
%prm
param0, param1, param2, param3
param0 : [intptr] 
param1 : [int] 
param2 : [intptr] 
param3 : [intptr] 
%inst
The ImmIsUIMessageW (Unicode) function (immdev.h) checks for messages
intended for the IME window and sends those messages to the window.

[戻り値]
Returns a nonzero value if the message is processed by the IME
window, or 0 otherwise.

[備考]
An application typically uses this function to display a composition
string or candidate list specified by the IME. If hWndIME is NULL,
the function determines if the message is a user interface message.
Windows Me/98: This function has only an ANSI version. To receive
Unicode characters from a Unicode-based IME, the application should
use ImmGetCompositionString.
> [!NOTE] > The immdev.h header defines ImmIsUIMessage as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ImmLockIMC
(no summary)
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst



%index
ImmLockIMCC
(no summary)
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst



%index
ImmNotifyIME
The ImmNotifyIME function (immdev.h) notifies the IME about changes to the status of the input context.
%group
Win32 imm32
%prm
param0, dwAction, dwIndex, dwValue
param0 : [intptr] 
dwAction : [int] 
dwIndex : [int] 
dwValue : [int] Index of a candidate string. The application can set this parameter or ignore it, depending on the value of the dwAction parameter.
%inst
The ImmNotifyIME function (immdev.h) notifies the IME about changes
to the status of the input context.

[戻り値]
Returns nonzero if successful, or 0 otherwise.


%index
ImmReSizeIMCC
(no summary)
%group
Win32 imm32
%prm
param0, param1
param0 : [intptr] 
param1 : [int] 
%inst



%index
ImmRegisterWordW
The ImmRegisterWordW (Unicode) function (immdev.h) registers a string with the dictionary of the IME associated with the specified input locale.
%group
Win32 imm32
%prm
param0, lpszReading, param2, lpszRegister
param0 : [intptr] 
lpszReading : [wstr] Pointer to a null-terminated reading string associated with the string to register.
param2 : [int] 
lpszRegister : [wstr] Pointer to the null-terminated string to register.
%inst
The ImmRegisterWordW (Unicode) function (immdev.h) registers a string
with the dictionary of the IME associated with the specified input
locale.

[戻り値]
Returns a nonzero value if successful, or 0 otherwise.

[備考]
An IME independent software vendor (ISV) can define private styles
for an IME in the IME_REGWORD_STYLE_USER_FIRST and
IME_REGWORD_STYLE_USER_LAST values. For example:
This doc was truncated.


%index
ImmReleaseContext
ImmReleaseContext 関数 (immdev.h) は入力コンテキストを解放し関連メモリのロックを解除する。
%group
Win32 imm32
%prm
param0, param1
param0 : [intptr] 
param1 : [intptr] 
%inst
ImmReleaseContext 関数 (immdev.h) は入力コンテキストを解放し関連メモリのロックを解除する。

[戻り値]
成功時は 0 以外、失敗時は 0 を返す。


%index
ImmRequestMessageW
Generates a WM_IME_REQUEST message. (Unicode)
%group
Win32 imm32
%prm
param0, param1, param2
param0 : [intptr] 
param1 : [intptr] 
param2 : [intptr] 
%inst
Generates a WM_IME_REQUEST message. (Unicode)

[戻り値]
Returns an operation-specific value if successful, or 0 otherwise.

[備考]
IME must use this function instead of sending the WM_IME_REQUEST
message to the application in a call to SendMessage.
> [!NOTE] > The immdev.h header defines ImmRequestMessage as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ImmSetCandidateWindow
ImmSetCandidateWindow 関数 (immdev.h) は候補ウィンドウに関する情報を設定する。
%group
Win32 imm32
%prm
param0, lpCandidate
param0 : [intptr] 
lpCandidate : [var] 候補ウィンドウに関する情報を保持する CANDIDATEFORM 構造体へのポインタ。
%inst
ImmSetCandidateWindow 関数 (immdev.h) は候補ウィンドウに関する情報を設定する。

[戻り値]
成功時は 0 以外、失敗時は 0 を返す。

[備考]
本関数は IMN_SETCANDIDATEPOS コマンドを送信させる。IME とアプリケーション双方から呼ばれる。


%index
ImmSetCompositionFontW
The ImmSetCompositionFontW (Unicode) function (immdev.h) sets the logical font to use to display characters in the composition window.
%group
Win32 imm32
%prm
param0, lplf
param0 : [intptr] 
lplf : [var] Pointer to a LOGFONT structure containing the font information to set.
%inst
The ImmSetCompositionFontW (Unicode) function (immdev.h) sets the
logical font to use to display characters in the composition window.

[戻り値]
Returns a nonzero value if successful, or 0 otherwise.

[備考]
This function causes a IMN_SETCOMPOSITIONFONT command to be sent to
an application. Even if the application never uses the composition
window, it must set the appropriate font to ensure that characters
are displayed properly. This is especially true for vertical writing.
> [!NOTE] > The immdev.h header defines ImmSetCompositionFont as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ImmSetCompositionStringW
The ImmSetCompositionStringW (Unicode) function (immdev.h) sets the characters, attributes, and clauses of the composition and reading strings.
%group
Win32 imm32
%prm
param0, dwIndex, lpComp, dwCompLen, lpRead, dwReadLen
param0 : [intptr] 
dwIndex : [int] 
lpComp : [intptr] Pointer to a buffer containing the information to set for the composition string, as specified by the value of dwIndex.
dwCompLen : [int] Size, in bytes, of the information buffer for the composition string, even if SCS_SETSTR is specified and the buffer contains a Unicode string.
lpRead : [intptr] Pointer to a buffer containing the information to set for the reading string, as specified by the value of dwIndex. The application can set this parameter to NULL.
dwReadLen : [int] Size, in bytes, of the information buffer for the reading string, even if SCS_SETSTR is specified and the buffer contains a Unicode string.
%inst
The ImmSetCompositionStringW (Unicode) function (immdev.h) sets the
characters, attributes, and clauses of the composition and reading
strings.

[戻り値]
Returns a nonzero value if successful, or 0 otherwise.

[備考]
The application can set lpComp, lpRead, or both. If the application
does not specify a value for lpComp, it must set this parameter to
NULL and set dwCompLen to 0. When the application is changing
attributes, all characters in a clause must have the same attribute.
Converted characters must have the attribute ATTR_CONVERTED or
ATTR_TARGET_CONVERTED. Unconverted characters must have the attribute
ATTR_INPUT or ATTR_TARGET_NOTCONVERTED. When the application is
changing clause information, it can change only the target clause,
just affecting one boundary at a time. The target clause has the
attribute ATTR_TARGET_CONVERTED or ATTR_TARGET_NOTCONVERTED. For
additional information about attributes (ATTR_* values), see
Composition String. When the IME completes the changes, it sends a
WM_IME_COMPOSITION message to the application to notify it of the
changes. Windows Me/98, Windows 2000, Windows XP: The
SCS_*CONVERTSTRING values are used for reconversion. They can only be
used for an IME that has the SCS_CAP_SETRECONVERTSTRING property. The
application uses these values as follows:
This doc was truncated.


%index
ImmSetCompositionWindow
ImmSetCompositionWindow 関数 (immdev.h) は組み立て中ウィンドウの位置を設定する。
%group
Win32 imm32
%prm
param0, lpCompForm
param0 : [intptr] 
lpCompForm : [var] 組み立て中ウィンドウの新しい位置など関連情報を保持する COMPOSITIONFORM 構造体へのポインタ。
%inst
ImmSetCompositionWindow 関数 (immdev.h) は組み立て中ウィンドウの位置を設定する。

[戻り値]
成功時は 0 以外、失敗時は 0 を返す。

[備考]
本関数はアプリケーションに IMN_SETCOMPOSITIONWINDOW コマンドを送信させる。


%index
ImmSetConversionStatus
The ImmSetConversionStatus function (immdev.h) sets the current conversion status.
%group
Win32 imm32
%prm
param0, param1, param2
param0 : [intptr] 
param1 : [int] 
param2 : [int] 
%inst
The ImmSetConversionStatus function (immdev.h) sets the current
conversion status.

[戻り値]
Returns a nonzero value if successful, or 0 otherwise.

[備考]
This function sends the IMN_SETCONVERSIONMODE and IMN_SETSENTENCEMODE
commands to the application. Note Beginning with Windows 8: By
default, the input switch is set per user instead of per thread. The
Microsoft IME (Japanese) respects the mode globally, and therefore
ImmSetConversionStatus fails when getting focus.


%index
ImmSetOpenStatus
The ImmSetOpenStatus function (immdev.h) opens or closes the IME.
%group
Win32 imm32
%prm
param0, param1
param0 : [intptr] 
param1 : [int] 
%inst
The ImmSetOpenStatus function (immdev.h) opens or closes the IME.

[戻り値]
Returns a nonzero value if successful, or 0 otherwise.

[備考]
This function causes an IMN_SETOPENSTATUS command to be sent to the
application.


%index
ImmSetStatusWindowPos
The ImmSetStatusWindowPos function (immdev.h) sets the position of the status window.
%group
Win32 imm32
%prm
param0, lpptPos
param0 : [intptr] 
lpptPos : [var] Pointer to a POINT structure containing the new position of the status window, in screen coordinates relative to the upper left corner of the display screen.
%inst
The ImmSetStatusWindowPos function (immdev.h) sets the position of
the status window.

[戻り値]
Returns a nonzero value if successful, or 0 otherwise.

[備考]
This function causes an IMN_SETSTATUSWINDOWPOS command to be sent to
the application.


%index
ImmShowSoftKeyboard
(no summary)
%group
Win32 imm32
%prm
param0, param1
param0 : [intptr] 
param1 : [int] 
%inst



%index
ImmSimulateHotKey
The ImmSimulateHotKey function (immdev.h) simulates the specified IME hot key, causing the same response as if the user presses the hot key in the specified window.
%group
Win32 imm32
%prm
param0, param1
param0 : [intptr] 
param1 : [int] 
%inst
The ImmSimulateHotKey function (immdev.h) simulates the specified IME
hot key, causing the same response as if the user presses the hot key
in the specified window.

[戻り値]
Returns a nonzero value if successful, or 0 otherwise.


%index
ImmUnlockIMC
(no summary)
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst



%index
ImmUnlockIMCC
(no summary)
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst



%index
ImmUnregisterWordW
The ImmUnregisterWordW (Unicode) function (immdev.h) removes a register string from the dictionary of the IME associated with the specified input locale.
%group
Win32 imm32
%prm
param0, lpszReading, param2, lpszUnregister
param0 : [intptr] 
lpszReading : [wstr] Pointer to a null-terminated reading string associated with the string to remove.
param2 : [int] 
lpszUnregister : [wstr] Pointer to a null-terminated string specifying the register string to remove.
%inst
The ImmUnregisterWordW (Unicode) function (immdev.h) removes a
register string from the dictionary of the IME associated with the
specified input locale.

[戻り値]
Returns a nonzero value if successful, or 0 otherwise.

[備考]
> [!NOTE] > The immdev.h header defines ImmUnregisterWord as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).

