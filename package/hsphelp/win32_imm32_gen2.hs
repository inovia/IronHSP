; ============================================================
;   imm32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
ImmDestroyContext
The ImmDestroyContext function (immdev.h) releases the input context and frees associated memory.
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst
The ImmDestroyContext function (immdev.h) releases the input context
and frees associated memory.

[戻り値]
Returns a nonzero value if successful, or 0 otherwise.

[備考]
Any application that creates an input context by using the
ImmCreateContext function must call this function to free the context
before it terminates. However, before calling ImmDestroyContext, the
application must remove the input context from any association with
windows in the thread by using the ImmAssociateContext function.


%index
ImmAssociateContext
The ImmAssociateContext function (immdev.h) associates the specified input context with the specified window.
%group
Win32 imm32
%prm
param0, param1
param0 : [intptr] 
param1 : [intptr] 
%inst
The ImmAssociateContext function (immdev.h) associates the specified
input context with the specified window.

[戻り値]
Returns the handle to the input context previously associated with
the window.

[備考]
When associating an input context with a window, an application must
remove the association before destroying the input context. One way
to do this is to save the handle and reassociate it to the default
input context with the window.


%index
ImmGetCompositionStringW
The ImmGetCompositionStringW (Unicode) function (immdev.h) retrieves information about the composition string.
%group
Win32 imm32
%prm
param0, param1, lpBuf, dwBufLen
param0 : [intptr] 
param1 : [int] 
lpBuf : [intptr] Pointer to a buffer in which the function retrieves the composition string information.
dwBufLen : [int] Size, in bytes, of the output buffer, even if the output is a Unicode string. The application sets this parameter to 0 if the function is to return the size of the required output buffer.
%inst
The ImmGetCompositionStringW (Unicode) function (immdev.h) retrieves
information about the composition string.

[戻り値]
Returns the number of bytes copied to the output buffer. If dwBufLen
is set to 0, the function returns the buffer size, in bytes, required
to receive all requested information, excluding the terminating null
character. The return value is always the size, in bytes, even if the
requested data is a Unicode string. This function returns one of the
following negative error codes if it does not succeed:
This doc was truncated.

[備考]
An application calls this function in response to the
WM_IME_COMPOSITION or WM_IME_STARTCOMPOSITION message. The IMM
removes the information when the application calls the
ImmReleaseContext function. Note You must write code to handle both
full-width Hiragana and half-width Katakana if your application is
used with the Soft Input Panel (SIP).
> [!NOTE] > The immdev.h header defines ImmGetCompositionString as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ImmGetContext
The ImmGetContext function (immdev.h) returns the input context associated with the specified window.
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst
The ImmGetContext function (immdev.h) returns the input context
associated with the specified window.

[戻り値]
Returns the handle to the input context.

[備考]
An application should routinely use this function to retrieve the
current input context before attempting to access information in the
context. The application must call ImmReleaseContext when it is
finished with the input context.


%index
ImmGetDefaultIMEWnd
The ImmGetDefaultIMEWnd function (immdev.h) retrieves the default window handle to the IME class.
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst
The ImmGetDefaultIMEWnd function (immdev.h) retrieves the default
window handle to the IME class.

[戻り値]
Returns the default window handle to the IME class if successful, or
NULL otherwise.

[備考]
The operating system creates a default IME window for every thread.
The window is created based on the IME class. The application can
send the WM_IME_CONTROL message to this window.


%index
ImmIsIME
The ImmIsIME function (immdev.h) determines if the specified input locale has an IME.
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst
The ImmIsIME function (immdev.h) determines if the specified input
locale has an IME.

[戻り値]
Returns a nonzero value if the specified locale has an IME, or 0
otherwise.


%index
ImmReleaseContext
The ImmReleaseContext function (immdev.h) releases the input context and unlocks the memory associated in the input context.
%group
Win32 imm32
%prm
param0, param1
param0 : [intptr] 
param1 : [intptr] 
%inst
The ImmReleaseContext function (immdev.h) releases the input context
and unlocks the memory associated in the input context.

[戻り値]
Returns a nonzero value if successful, or 0 otherwise.


%index
ImmSetCandidateWindow
The ImmSetCandidateWindow function (immdev.h) sets information about the candidates window.
%group
Win32 imm32
%prm
param0, lpCandidate
param0 : [intptr] 
lpCandidate : [var] Pointer to a CANDIDATEFORM structure that contains information about the candidates window.
%inst
The ImmSetCandidateWindow function (immdev.h) sets information about
the candidates window.

[戻り値]
Returns a nonzero value if successful, or 0 otherwise.

[備考]
This function causes an IMN_SETCANDIDATEPOS command to be sent. Both
the IME and the application call this function.


%index
ImmSetCompositionWindow
The ImmSetCompositionWindow function (immdev.h) sets the position of the composition window.
%group
Win32 imm32
%prm
param0, lpCompForm
param0 : [intptr] 
lpCompForm : [var] Pointer to a COMPOSITIONFORM structure that contains the new position and other related information about the composition window.
%inst
The ImmSetCompositionWindow function (immdev.h) sets the position of
the composition window.

[戻り値]
Returns a nonzero value if successful, or 0 otherwise.

[備考]
This function causes an IMN_SETCOMPOSITIONWINDOW command to be sent
to the application.

