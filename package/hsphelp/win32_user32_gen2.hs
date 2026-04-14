; ============================================================
;   user32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
UnloadKeyboardLayout
入力ロケール識別子(旧称キーボードレイアウト)をアンロードする。
%group
Win32 user32
%prm
hkl
hkl : [intptr] 型: HKL アンロードする入力ロケール識別子。
%inst
入力ロケール識別子(旧称キーボードレイアウト)をアンロードする。

[戻り値]
型: BOOL 成功時は 0 以外、失敗時は 0 を返す。失敗する可能性のある原因は以下の通り。
（以下省略）

[備考]

入力ロケール識別子はキーボードレイアウトより広い概念で、音声認識、IME、その他の入力形式を含む。システム既定の入力ロケール識別子のみがロードされている場合はアンロードできない。先に別の入力ロケール識別子をロードしてから既定をアンロードすること。


%index
ActivateKeyboardLayout
Sets the input locale identifier (formerly called the keyboard layout handle) for the calling thread or the current process. The input locale identifier specifies a locale as well as the physical layout of the keyboard.
%group
Win32 user32
%prm
hkl, Flags
hkl : [intptr] Type: HKL Input locale identifier to be activated.
Flags : [int] Type: UINT
%inst
Sets the input locale identifier (formerly called the keyboard layout
handle) for the calling thread or the current process. The input
locale identifier specifies a locale as well as the physical layout
of the keyboard.

[戻り値]
Type: HKL The return value is of type HKL. If the function succeeds,
the return value is the previous input locale identifier. Otherwise,
it is zero. To get extended error information, use the GetLastError
function.

[備考]
This function only affects the layout for the current process or
thread. This function is not restricted to keyboard layouts. The hkl
parameter is actually an input locale identifier. This is a broader
concept than a keyboard layout, since it can also encompass a
speech-to-text converter, an Input Method Editor (IME), or any other
form of input. Several input locale identifiers can be loaded at any
one time, but only one is active at a time. Loading multiple input
locale identifiers makes it possible to rapidly switch between them.
When multiple IMEs are allowed for each locale, passing an input
locale identifier in which the high word (the device handle) is zero
activates the first IME in the list belonging to the locale. The
KLF_RESET and KLF_SHIFTLOCK flags alter the method by which the Caps
Lock state is turned off. By default, the Caps Lock state is turned
off by hitting the Caps Lock key again. If only KLF_RESET is set, the
default state is reestablished. If KLF_RESET and KLF_SHIFTLOCK are
set, the Caps Lock state is turned off by pressing either Caps Lock
key. This feature is used to conform to local keyboard behavior
standards as well as for personal preferences.


%index
AddClipboardFormatListener
Places the given window in the system-maintained clipboard format listener list.
%group
Win32 user32
%prm
hwnd
hwnd : [intptr] Type: HWND A handle to the window to be placed in the clipboard format listener list.
%inst
Places the given window in the system-maintained clipboard format
listener list.

[戻り値]
Type: BOOL Returns TRUE if successful, FALSE otherwise. Call
GetLastError for additional details.

[備考]
When a window has been added to the clipboard format listener list,
it is posted a WM_CLIPBOARDUPDATE message whenever the contents of
the clipboard have changed.


%index
AdjustWindowRect
Calculates the required size of the window rectangle, based on the desired client-rectangle size. The window rectangle can then be passed to the CreateWindow function to create a window whose client area is the desired size.
%group
Win32 user32
%prm
lpRect, dwStyle, bMenu
lpRect : [var] Type: LPRECT A pointer to a RECT structure that contains the coordinates of the top-left and bottom-right corners of the desired client area. When the function returns, the structure contains the coordinates of the top-left and bottom-right corners of the window to accommodate the desired client area.
dwStyle : [int] Type: DWORD The window style of the window whose required size is to be calculated. Note that you cannot specify the WS_OVERLAPPED style.
bMenu : [int] Type: BOOL Indicates whether the window has a menu.
%inst
Calculates the required size of the window rectangle, based on the
desired client-rectangle size. The window rectangle can then be
passed to the CreateWindow function to create a window whose client
area is the desired size.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
A client rectangle is the smallest rectangle that completely encloses
a client area. A window rectangle is the smallest rectangle that
completely encloses the window, which includes the client area and
the nonclient area. The AdjustWindowRect function does not add extra
space when a menu bar wraps to two or more rows. The AdjustWindowRect
function does not take the WS_VSCROLL or WS_HSCROLL styles into
account. To account for the scroll bars, call the GetSystemMetrics
function with SM_CXVSCROLL or SM_CYHSCROLL.


%index
AdjustWindowRectEx
Calculates the required size of the window rectangle, based on the desired size of the client rectangle. The window rectangle can then be passed to the CreateWindowEx function to create a window whose client area is the desired size.
%group
Win32 user32
%prm
lpRect, dwStyle, bMenu, dwExStyle
lpRect : [var] Type: LPRECT A pointer to a RECT structure that contains the coordinates of the top-left and bottom-right corners of the desired client area. When the function returns, the structure contains the coordinates of the top-left and bottom-right corners of the window to accommodate the desired client area.
dwStyle : [int] Type: DWORD The window style of the window whose required size is to be calculated. Note that you cannot specify the WS_OVERLAPPED style.
bMenu : [int] Type: BOOL Indicates whether the window has a menu.
dwExStyle : [int] Type: DWORD The extended window style of the window whose required size is to be calculated.
%inst
Calculates the required size of the window rectangle, based on the
desired size of the client rectangle. The window rectangle can then
be passed to the CreateWindowEx function to create a window whose
client area is the desired size.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
A client rectangle is the smallest rectangle that completely encloses
a client area. A window rectangle is the smallest rectangle that
completely encloses the window, which includes the client area and
the nonclient area. The AdjustWindowRectEx function does not add
extra space when a menu bar wraps to two or more rows. The
AdjustWindowRectEx function does not take the WS_VSCROLL or
WS_HSCROLL styles into account. To account for the scroll bars, call
the GetSystemMetrics function with SM_CXVSCROLL or SM_CYHSCROLL. This
API is not DPI aware, and should not be used if the calling thread is
per-monitor DPI aware. For the DPI-aware version of this API, see
AdjustWindowsRectExForDPI. For more information on DPI awareness, see
the Windows High DPI documentation.


%index
AdjustWindowRectExForDpi
Calculates the required size of the window rectangle, based on the desired size of the client rectangle and the provided DPI.
%group
Win32 user32
%prm
lpRect, dwStyle, bMenu, dwExStyle, dpi
lpRect : [var] A pointer to a RECT structure that contains the coordinates of the top-left and bottom-right corners of the desired client area. When the function returns, the structure contains the coordinates of the top-left and bottom-right corners of the window to accommodate the desired client area.
dwStyle : [int] The Window Style of the window whose required size is to be calculated. Note that you cannot specify the WS_OVERLAPPED style.
bMenu : [int] Indicates whether the window has a menu.
dwExStyle : [int] The Extended Window Style of the window whose required size is to be calculated.
dpi : [int] The DPI to use for scaling.
%inst
Calculates the required size of the window rectangle, based on the
desired size of the client rectangle and the provided DPI.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
This function returns the same result as AdjustWindowRectEx but
scales it according to an arbitrary DPI you provide if appropriate.


%index
AllowSetForegroundWindow
Enables the specified process to set the foreground window using the SetForegroundWindow function. The calling process must already be able to set the foreground window. For more information, see Remarks later in this topic.
%group
Win32 user32
%prm
dwProcessId
dwProcessId : [int] Type: DWORD The identifier of the process that will be enabled to set the foreground window. If this parameter is ASFW_ANY, all processes will be enabled to set the foreground window.
%inst
Enables the specified process to set the foreground window using the
SetForegroundWindow function. The calling process must already be
able to set the foreground window. For more information, see Remarks
later in this topic.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. The function will fail
if the calling process cannot set the foreground window. To get
extended error information, call GetLastError.

[備考]
The system restricts which processes can set the foreground window.
Normally, a process can set the foreground window by calling the
[**SetForegroundWindow**](nf-winuser-setforegroundwindow.md) function
only if: - All of the following conditions are true: - The calling
process belongs to a desktop application, not a UWP app or a Windows
Store app designed for Windows 8 or 8.1. - The foreground process has
not disabled calls to **SetForegroundWindow** by a previous call to
the
[**LockSetForegroundWindow**](nf-winuser-locksetforegroundwindow.md)
function. - The foreground lock time-out has expired (see
[**SPI_GETFOREGROUNDLOCKTIMEOUT** in
**SystemParametersInfo**](nf-winuser-systemparametersinfoa.md#SPI_GETFOREGROUNDLOCKTIMEOUT)).
- No menus are active. - Additionally, at least one of the following
conditions is true: - The calling process is the foreground process.
- The calling process was started by the foreground process. - There
is currently no foreground window, and thus no foreground process. -
The calling process received the last input event. - Either the
foreground process or the calling process is being debugged. A
process that can set the foreground window can enable another process
to set the foreground window by calling **AllowSetForegroundWindow**.
The process specified by the *dwProcessId* parameter loses the
ability to set the foreground window the next time that either the
user generates input, unless the input is directed at that process,
or the next time a process calls **AllowSetForegroundWindow**, unless
the same process is specified as in the previous call to
**AllowSetForegroundWindow**.


%index
AnimateWindow
Enables you to produce special effects when showing or hiding windows. There are four types of animation:\_roll, slide, collapse or expand, and alpha-blended fade.
%group
Win32 user32
%prm
hWnd, dwTime, dwFlags
hWnd : [intptr] Type: HWND A handle to the window to animate. The calling thread must own this window.
dwTime : [int] Type: DWORD The time it takes to play the animation, in milliseconds. Typically, an animation takes 200 milliseconds to play.
dwFlags : [int] Type: DWORD
%inst
Enables you to produce special effects when showing or hiding
windows. There are four types of animation:\_roll, slide, collapse or
expand, and alpha-blended fade.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. The function will fail
in the following situations:
This doc was truncated.

[備考]
To show or hide a window without special effects, use ShowWindow.
When using slide or roll animation, you must specify the direction.
It can be either AW_HOR_POSITIVE, AW_HOR_NEGATIVE, AW_VER_POSITIVE,
or AW_VER_NEGATIVE. You can combine AW_HOR_POSITIVE or
AW_HOR_NEGATIVE with AW_VER_POSITIVE or AW_VER_NEGATIVE to animate a
window diagonally. The window procedures for the window and its child
windows should handle any WM_PRINT or WM_PRINTCLIENT messages. Dialog
boxes, controls, and common controls already handle WM_PRINTCLIENT.
The default window procedure already handles WM_PRINT. If a child
window is displayed partially clipped, when it is animated it will
have holes where it is clipped. AnimateWindow supports RTL windows.
Avoid animating a window that has a drop shadow because it produces
visually distracting, jerky animations.


%index
AnyPopup
Indicates whether an owned, visible, top-level pop-up, or overlapped window exists on the screen. The function searches the entire screen, not just the calling application's client area.
%group
Win32 user32
%prm

%inst
Indicates whether an owned, visible, top-level pop-up, or overlapped
window exists on the screen. The function searches the entire screen,
not just the calling application's client area.

[戻り値]
Type: BOOL If a pop-up window exists, the return value is nonzero,
even if the pop-up window is completely covered by other windows. If
a pop-up window does not exist, the return value is zero.

[備考]
This function does not detect unowned pop-up windows or windows that
do not have the WS_VISIBLE style bit set.


%index
DestroyMenu
指定したメニューを破棄し、メニューが占有していたメモリを解放する。
%group
Win32 user32
%prm
hMenu
hMenu : [intptr] 型: HMENU 破棄するメニューへのハンドル。
%inst
指定したメニューを破棄し、メニューが占有していたメモリを解放する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報を得るには GetLastError
を呼び出す。

[備考]
アプリケーションは終了前に、ウィンドウに割り当てられていないメニューを DestroyMenu
関数で破棄する必要がある。ウィンドウに割り当てられたメニューはアプリケーション終了時に自動的に破棄される。DestroyMenu
は再帰的で、メニューとそのすべてのサブメニューを破棄する。


%index
AppendMenuW
Appends a new item to the end of the specified menu bar, drop-down menu, submenu, or shortcut menu. You can use this function to specify the content, appearance, and behavior of the menu item. (Unicode)
%group
Win32 user32
%prm
hMenu, uFlags, uIDNewItem, lpNewItem
hMenu : [intptr] Type: HMENU A handle to the menu bar, drop-down menu, submenu, or shortcut menu to be changed.
uFlags : [int] Type: UINT
uIDNewItem : [int] Type: UINT_PTR The identifier of the new menu item or, if the uFlags parameter is set to MF_POPUP, a handle to the drop-down menu or submenu.
lpNewItem : [wstr] Type: LPCTSTR The content of the new menu item. The interpretation of lpNewItem depends on whether the uFlags parameter includes the following values.
%inst
Appends a new item to the end of the specified menu bar, drop-down
menu, submenu, or shortcut menu. You can use this function to specify
the content, appearance, and behavior of the menu item. (Unicode)

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The application must call the DrawMenuBar function whenever a menu
changes, whether the menu is in a displayed window. To get keyboard
accelerators to work with bitmap or owner-drawn menu items, the owner
of the menu must process the WM_MENUCHAR message. For more
information, see Owner-Drawn Menus and the WM_MENUCHAR Message. The
following groups of flags cannot be used together:
This doc was truncated.


%index
AreDpiAwarenessContextsEqual
Determines whether two DPI_AWARENESS_CONTEXT values are identical.
%group
Win32 user32
%prm
dpiContextA, dpiContextB
dpiContextA : [intptr] The first value to compare.
dpiContextB : [intptr] The second value to compare.
%inst
Determines whether two DPI_AWARENESS_CONTEXT values are identical.

[戻り値]
Returns TRUE if the values are equal, otherwise FALSE.

[備考]
A DPI_AWARENESS_CONTEXT contains multiple pieces of information. For
example, it includes both the current and the inherited DPI_AWARENESS
values. AreDpiAwarenessContextsEqual ignores informational flags and
determines if the values are equal. You can't use a direct bitwise
comparison because of these informational flags.


%index
ArrangeIconicWindows
Arranges all the minimized (iconic) child windows of the specified parent window.
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] Type: HWND A handle to the parent window.
%inst
Arranges all the minimized (iconic) child windows of the specified
parent window.

[戻り値]
Type: UINT If the function succeeds, the return value is the height
of one row of icons. If the function fails, the return value is zero.
To get extended error information, call GetLastError.

[備考]
An application that maintains its own minimized child windows can use
the ArrangeIconicWindows function to arrange icons in a parent
window. This function can also arrange icons on the desktop. To
retrieve the window handle to the desktop window, use the
GetDesktopWindow function. An application sends the WM_MDIICONARRANGE
message to the multiple-document interface (MDI) client window to
prompt the client window to arrange its minimized MDI child windows.


%index
AttachThreadInput
Attaches or detaches the input processing mechanism of one thread to that of another thread.
%group
Win32 user32
%prm
idAttach, idAttachTo, fAttach
idAttach : [int] The identifier of the thread to be attached to another thread. The thread to be attached cannot be a system thread.
idAttachTo : [int] The identifier of the thread to which idAttach will be attached. This thread cannot be a system thread.
fAttach : [int] If this parameter is TRUE, the two threads are attached. If the parameter is FALSE, the threads are detached.
%inst
Attaches or detaches the input processing mechanism of one thread to
that of another thread.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. Windows Server 2003 and Windows XP:
There is no extended error information; do not call GetLastError.
This behavior changed as of Windows Vista.

[備考]
By using the AttachThreadInput function, a thread can share its input
states (such as keyboard states and the current focus window) with
another thread. Keyboard and mouse events received by both threads
are processed in the order they were received until the threads are
detached by calling AttachThreadInput a second time and specifying
FALSE for the fAttach parameter. The AttachThreadInput function fails
if either of the specified threads does not have a message queue. The
system creates a thread's message queue when the thread makes its
first call to one of the USER or GDI functions. The AttachThreadInput
function also fails if a journal record hook is installed. Journal
record hooks attach all input queues together. Note that key state,
which can be ascertained by calls to the GetKeyState or
GetKeyboardState function, is reset after a call to
AttachThreadInput. You cannot attach a thread to a thread in another
desktop.


%index
BeginDeferWindowPos
Allocates memory for a multiple-window- position structure and returns the handle to the structure.
%group
Win32 user32
%prm
nNumWindows
nNumWindows : [int] Type: int The initial number of windows for which to store position information. The DeferWindowPos function increases the size of the structure, if necessary.
%inst
Allocates memory for a multiple-window- position structure and
returns the handle to the structure.

[戻り値]
Type: HDWP If the function succeeds, the return value identifies the
multiple-window-position structure. If insufficient system resources
are available to allocate the structure, the return value is NULL. To
get extended error information, call GetLastError.

[備考]
The multiple-window-position structure is an internal structure; an
application cannot access it directly.
DeferWindowPos fills the multiple-window-position structure with
information about the target position for one or more windows about
to be moved. The EndDeferWindowPos function accepts the handle to
this structure and repositions the windows by using the information
stored in the structure. If the system must increase the size of the
multiple-window- position structure beyond the initial size specified
by the nNumWindows parameter but cannot allocate enough memory to do
so, the system fails the entire window positioning sequence
(BeginDeferWindowPos, DeferWindowPos, and EndDeferWindowPos). By
specifying the maximum size needed, an application can detect and
process failure early in the process.


%index
BeginPaint
The BeginPaint function prepares the specified window for painting and fills a PAINTSTRUCT structure with information about the painting.
%group
Win32 user32
%prm
hWnd, lpPaint
hWnd : [intptr] Handle to the window to be repainted.
lpPaint : [var] Pointer to the PAINTSTRUCT structure that will receive painting information.
%inst
The BeginPaint function prepares the specified window for painting
and fills a PAINTSTRUCT structure with information about the
painting.

[戻り値]
If the function succeeds, the return value is the handle to a display
device context for the specified window. If the function fails, the
return value is NULL, indicating that no display device context is
available.

[備考]
The BeginPaint function automatically sets the clipping region of the
device context to exclude any area outside the update region. The
update region is set by the InvalidateRect or InvalidateRgn function
and by the system after sizing, moving, creating, scrolling, or any
other operation that affects the client area. If the update region is
marked for erasing, BeginPaint sends a WM_ERASEBKGND message to the
window. An application should not call BeginPaint except in response
to a WM_PAINT message. Each call to BeginPaint must have a
corresponding call to the EndPaint function. If the caret is in the
area to be painted, BeginPaint automatically hides the caret to
prevent it from being erased. If the window's class has a background
brush, BeginPaint uses that brush to erase the background of the
update region before returning. DPI Virtualization This API does not
participate in DPI virtualization. The output returned is always in
terms of physical pixels.


%index
BlockInput
Blocks keyboard and mouse input events from reaching applications.
%group
Win32 user32
%prm
fBlockIt
fBlockIt : [int] Type: BOOL The function's purpose. If this parameter is TRUE, keyboard and mouse input events are blocked. If this parameter is FALSE, keyboard and mouse events are unblocked. Note that only the thread that blocked input can successfully unblock input.
%inst
Blocks keyboard and mouse input events from reaching applications.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
input is already blocked, the return value is zero. To get extended
error information, call GetLastError.

[備考]
When input is blocked, real physical input from the mouse or keyboard
will not affect the input queue's synchronous key state (reported by
GetKeyState and GetKeyboardState), nor will it affect the
asynchronous key state (reported by GetAsyncKeyState). However, the
thread that is blocking input can affect both of these key states by
calling SendInput. No other thread can do this. The system will
unblock input in the following cases:
This doc was truncated.


%index
BringWindowToTop
Brings the specified window to the top of the Z order. If the window is a top-level window, it is activated. If the window is a child window, the top-level parent window associated with the child window is activated.
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] Type: HWND A handle to the window to bring to the top of the Z order.
%inst
Brings the specified window to the top of the Z order. If the window
is a top-level window, it is activated. If the window is a child
window, the top-level parent window associated with the child window
is activated.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Use the BringWindowToTop function to uncover any window that is
partially or completely obscured by other windows. Calling this
function is similar to calling the SetWindowPos function to change a
window's position in the Z order. BringWindowToTop does not make a
window a top-level window.


%index
BroadcastSystemMessageW
Sends a message to the specified recipients. (BroadcastSystemMessageW)
%group
Win32 user32
%prm
flags, lpInfo, Msg, wParam, lParam
flags : [int] Type: DWORD
lpInfo : [var] Type: LPDWORD A pointer to a variable that contains and receives information about the recipients of the message.
Msg : [int] Type: UINT The message to be sent. For lists of the system-provided messages, see System-Defined Messages.
wParam : [intptr] Type: WPARAM Additional message-specific information.
lParam : [intptr] Type: LPARAM Additional message-specific information.
%inst
Sends a message to the specified recipients.
(BroadcastSystemMessageW)

[戻り値]
Type: long If the function succeeds, the return value is a positive
value. If the function is unable to broadcast the message, the return
value is ?1. If the dwFlags parameter is BSF_QUERY and at least one
recipient returned BROADCAST_QUERY_DENY to the corresponding message,
the return value is zero. To get extended error information, call
GetLastError.

[備考]
If BSF_QUERY is not specified, the function sends the specified
message to all requested recipients, ignoring values returned by
those recipients. The system only does marshalling for system
messages (those in the range 0 to (WM_USER-1)). To send other
messages (those >= WM_USER) to another process, you must do custom
marshalling.


%index
CloseDesktop
Closes an open handle to a desktop object.
%group
Win32 user32
%prm
hDesktop
hDesktop : [intptr] A handle to the desktop to be closed. This can be a handle returned by the CreateDesktop, OpenDesktop, or OpenInputDesktop functions. Do not specify the handle returned by the GetThreadDesktop function.
%inst
Closes an open handle to a desktop object.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The CloseDesktop function will fail if any thread in the calling
process is using the specified desktop handle or if the handle refers
to the initial desktop of the calling process.


%index
BroadcastSystemMessageExW
Sends a message to the specified recipients. (BroadcastSystemMessageExW)
%group
Win32 user32
%prm
flags, lpInfo, Msg, wParam, lParam, pbsmInfo
flags : [int] Type: DWORD
lpInfo : [var] Type: LPDWORD A pointer to a variable that contains and receives information about the recipients of the message.
Msg : [int] Type: UINT The message to be sent. For lists of the system-provided messages, see System-Defined Messages.
wParam : [intptr] Type: WPARAM Additional message-specific information.
lParam : [intptr] Type: LPARAM Additional message-specific information.
pbsmInfo : [var] Type: PBSMINFO A pointer to a BSMINFO structure that contains additional information if the request is denied and dwFlags is set to BSF_QUERY.
%inst
Sends a message to the specified recipients.
(BroadcastSystemMessageExW)

[戻り値]
Type: long If the function succeeds, the return value is a positive
value. If the function is unable to broadcast the message, the return
value is ?1. If the dwFlags parameter is BSF_QUERY and at least one
recipient returned BROADCAST_QUERY_DENY to the corresponding message,
the return value is zero. To get extended error information, call
GetLastError.

[備考]
If BSF_QUERY is not specified, the function sends the specified
message to all requested recipients, ignoring values returned by
those recipients. If the caller's thread is on a desktop other than
that of the window that denied the request, the caller must call
SetThreadDesktop(hdesk) to query anything on that window. Also, the
caller must call CloseDesktop on the returned hdesk handle. The
system only does marshalling for system messages (those in the range
0 to (WM_USER-1)). To send other messages (those >= WM_USER) to
another process, you must do custom marshalling.
> [!NOTE] > The winuser.h header defines BroadcastSystemMessageEx as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CalculatePopupWindowPosition
Calculates an appropriate pop-up window position using the specified anchor point, pop-up window size, flags, and the optional exclude rectangle.
%group
Win32 user32
%prm
anchorPoint, windowSize, flags, excludeRect, popupWindowPosition
anchorPoint : [var] Type: const POINT* The specified anchor point.
windowSize : [var] Type: const SIZE* The specified window size.
flags : [int] Type: UINT Use one of the following flags to specify how the function positions the pop-up window horizontally and vertically. The flags are the same as the vertical and horizontal positioning flags of the TrackPopupMenuEx function.
excludeRect : [var] Type: RECT* A pointer to a structure that specifies the exclude rectangle. It can be NULL.
popupWindowPosition : [var] Type: RECT* A pointer to a structure that specifies the pop-up window position.
%inst
Calculates an appropriate pop-up window position using the specified
anchor point, pop-up window size, flags, and the optional exclude
rectangle.

[戻り値]
Type: BOOL If the function succeeds, it returns TRUE; otherwise, it
returns FALSE. To get extended error information, call GetLastError.

[備考]
TPM_WORKAREA is supported for the TrackPopupMenu and TrackPopupMenuEx
functions.


%index
CallMsgFilterW
Passes the specified message and hook code to the hook procedures associated with the WH_SYSMSGFILTER and WH_MSGFILTER hooks. (Unicode)
%group
Win32 user32
%prm
lpMsg, nCode
lpMsg : [var] Type: LPMSG A pointer to an MSG structure that contains the message to be passed to the hook procedures.
nCode : [int] Type: int An application-defined code used by the hook procedure to determine how to process the message. The code must not have the same value as system-defined hook codes (MSGF_ and HC_) associated with the WH_SYSMSGFILTER and WH_MSGFILTER hooks.
%inst
Passes the specified message and hook code to the hook procedures
associated with the WH_SYSMSGFILTER and WH_MSGFILTER hooks. (Unicode)

[戻り値]
Type: BOOL If the application should process the message further, the
return value is zero. If the application should not process the
message further, the return value is nonzero.

[備考]
The system calls CallMsgFilter to enable applications to examine and
control the flow of messages during internal processing of dialog
boxes, message boxes, menus, and scroll bars, or when the user
activates a different window by pressing the ALT+TAB key combination.
Install this hook procedure by using the SetWindowsHookEx function.


%index
UnhookWindowsHookEx
Removes a hook procedure installed in a hook chain by the SetWindowsHookEx function.
%group
Win32 user32
%prm
hhk
hhk : [intptr] Type: HHOOK A handle to the hook to be removed. This parameter is a hook handle obtained by a previous call to SetWindowsHookEx.
%inst
Removes a hook procedure installed in a hook chain by the
SetWindowsHookEx function.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The hook procedure can be in the state of being called by another
thread even after UnhookWindowsHookEx returns. If the hook procedure
is not being called concurrently, the hook procedure is removed
immediately before UnhookWindowsHookEx returns.


%index
CallNextHookEx
Passes the hook information to the next hook procedure in the current hook chain. A hook procedure can call this function either before or after processing the hook information.
%group
Win32 user32
%prm
hhk, nCode, wParam, lParam
hhk : [intptr] Type: HHOOK This parameter is ignored.
nCode : [int] Type: int The hook code passed to the current hook procedure. The next hook procedure uses this code to determine how to process the hook information.
wParam : [intptr] Type: WPARAM The wParam value passed to the current hook procedure. The meaning of this parameter depends on the type of hook associated with the current hook chain.
lParam : [intptr] Type: LPARAM The lParam value passed to the current hook procedure. The meaning of this parameter depends on the type of hook associated with the current hook chain.
%inst
Passes the hook information to the next hook procedure in the current
hook chain. A hook procedure can call this function either before or
after processing the hook information.

[戻り値]
Type: LRESULT This value is returned by the next hook procedure in
the chain. The current hook procedure must also return this value.
The meaning of the return value depends on the hook type. For more
information, see the descriptions of the individual hook procedures.

[備考]
Hook procedures are installed in chains for particular hook types.
CallNextHookEx calls the next hook in the chain. Calling
CallNextHookEx is optional, but it is highly recommended; otherwise,
other applications that have installed hooks will not receive hook
notifications and may behave incorrectly as a result. You should call
CallNextHookEx unless you absolutely need to prevent the notification
from being seen by other applications.


%index
CallWindowProcW
Passes message information to the specified window procedure. (Unicode)
%group
Win32 user32
%prm
lpPrevWndFunc, hWnd, Msg, wParam, lParam
lpPrevWndFunc : [int] Type: WNDPROC The previous window procedure. If this value is obtained by calling the GetWindowLong function with the nIndex parameter set to GWL_WNDPROC or DWL_DLGPROC, it is actually either the address of a window or dialog box procedure, or a special internal value meaningful only to CallWindowProc.
hWnd : [intptr] Type: HWND A handle to the window procedure to receive the message.
Msg : [int] Type: UINT The message.
wParam : [intptr] Type: WPARAM Additional message-specific information. The contents of this parameter depend on the value of the Msg parameter.
lParam : [intptr] Type: LPARAM Additional message-specific information. The contents of this parameter depend on the value of the Msg parameter.
%inst
Passes message information to the specified window procedure.
(Unicode)

[戻り値]
Type: LRESULT The return value specifies the result of the message
processing and depends on the message sent.

[備考]
Use the CallWindowProc function for window subclassing. Usually, all
windows with the same class share one window procedure. A subclass is
a window or set of windows with the same class whose messages are
intercepted and processed by another window procedure (or procedures)
before being passed to the window procedure of the class. The
SetWindowLong function creates the subclass by changing the window
procedure associated with a particular window, causing the system to
call the new window procedure instead of the previous one. An
application must pass any messages not processed by the new window
procedure to the previous window procedure by calling CallWindowProc.
This allows the application to create a chain of window procedures.
If STRICT is defined, the lpPrevWndFunc parameter has the data type
WNDPROC. The WNDPROC type is declared as follows:
This doc was truncated.


%index
CancelShutdown
(no summary)
%group
Win32 user32
%prm

%inst



%index
CascadeWindows
Cascades the specified child windows of the specified parent window.
%group
Win32 user32
%prm
hwndParent, wHow, lpRect, cKids, lpKids
hwndParent : [intptr] Type: HWND A handle to the parent window. If this parameter is NULL, the desktop window is assumed.
wHow : [int] Type: UINT
lpRect : [var] Type: const RECT* A pointer to a structure that specifies the rectangular area, in client coordinates, within which the windows are arranged. This parameter can be NULL, in which case the client area of the parent window is used.
cKids : [int] Type: UINT The number of elements in the array specified by the lpKids parameter. This parameter is ignored if lpKids is NULL.
lpKids : [intptr] Type: const HWND* An array of handles to the child windows to arrange. If a specified child window is a top-level window with the style WS_EX_TOPMOST or WS_EX_TOOLWINDOW, the child window is not arranged. If this parameter is NULL, all child windows of the specified parent window (or of the desktop window) are arranged.
%inst
Cascades the specified child windows of the specified parent window.

[戻り値]
Type: WORD If the function succeeds, the return value is the number
of windows arranged. If the function fails, the return value is zero.
To get extended error information, call GetLastError.

[備考]
By default, CascadeWindows arranges the windows in the order provided
by the lpKids array, but preserves the Z-Order. If you specify the
MDITILE_ZORDER flag, CascadeWindows arranges the windows in Z order.
Calling CascadeWindows causes all maximized windows to be restored to
their previous size.


%index
ChangeClipboardChain
Removes a specified window from the chain of clipboard viewers.
%group
Win32 user32
%prm
hWndRemove, hWndNewNext
hWndRemove : [intptr] Type: HWND A handle to the window to be removed from the chain. The handle must have been passed to the SetClipboardViewer function.
hWndNewNext : [intptr] Type: HWND A handle to the window that follows the hWndRemove window in the clipboard viewer chain. (This is the handle returned by SetClipboardViewer, unless the sequence was changed in response to a WM_CHANGECBCHAIN message.)
%inst
Removes a specified window from the chain of clipboard viewers.

[戻り値]
Type: BOOL The return value indicates the result of passing the
WM_CHANGECBCHAIN message to the windows in the clipboard viewer
chain. Because a window in the chain typically returns FALSE when it
processes WM_CHANGECBCHAIN, the return value from
ChangeClipboardChain is typically FALSE. If there is only one window
in the chain, the return value is typically TRUE.

[備考]
The window identified by hWndNewNext replaces the hWndRemove window
in the chain. The SetClipboardViewer function sends a
WM_CHANGECBCHAIN message to the first window in the clipboard viewer
chain. For an example, see Removing a Window from the Clipboard
Viewer Chain.


%index
ChangeDisplaySettingsW
The ChangeDisplaySettings function changes the settings of the default display device to the specified graphics mode. (Unicode)
%group
Win32 user32
%prm
lpDevMode, dwFlags
lpDevMode : [var] A pointer to a DEVMODE structure that describes the new graphics mode. If lpDevMode is NULL, all the values currently in the registry will be used for the display setting. Passing NULL for the lpDevMode parameter and 0 for the dwFlags parameter is the easiest way to return to the default mode after a dynamic mode change. The dmSize member of DEVMODE must be initialized to the size, in bytes, of the DEVMODE structure. The dmDriverExtra member of DEVMODE must be initialized to indicate the number of bytes of private driver data following the DEVMODE structure. In addition, you can use any or all of the following members of the DEVMODE structure.
dwFlags : [int] 
%inst
The ChangeDisplaySettings function changes the settings of the
default display device to the specified graphics mode. (Unicode)

[戻り値]
The ChangeDisplaySettings function returns one of the following
values.
This doc was truncated.

[備考]
To ensure that the DEVMODE structure passed to ChangeDisplaySettings
is valid and contains only values supported by the display driver,
use the DEVMODE returned by the EnumDisplaySettings function. When
the display mode is changed dynamically, the WM_DISPLAYCHANGE message
is sent to all running applications with the following message
parameters.
This doc was truncated.


%index
ChangeDisplaySettingsExW
The ChangeDisplaySettingsEx function changes the settings of the specified display device to the specified graphics mode. (Unicode)
%group
Win32 user32
%prm
lpszDeviceName, lpDevMode, hwnd, dwflags, lParam
lpszDeviceName : [wstr] A pointer to a null-terminated string that specifies the display device whose graphics mode will change. Only display device names as returned by EnumDisplayDevices are valid. See EnumDisplayDevices for further information on the names associated with these display devices. The lpszDeviceName parameter can be NULL. A NULL value specifies the default display device. The default device can be determined by calling EnumDisplayDevices and checking for the DISPLAY_DEVICE_PRIMARY_DEVICE flag.
lpDevMode : [var] A pointer to a DEVMODE structure that describes the new graphics mode. If lpDevMode is NULL, all the values currently in the registry will be used for the display setting. Passing NULL for the lpDevMode parameter and 0 for the dwFlags parameter is the easiest way to return to the default mode after a dynamic mode change. The dmSize member must be initialized to the size, in bytes, of the DEVMODE structure. The dmDriverExtra member must be initialized to indicate the number of bytes of private driver data following the DEVMODE structure. In addition, you can use any of the following members of the DEVMODE structure.
hwnd : [intptr] Reserved; must be NULL.
dwflags : [int] 
lParam : [intptr] If dwFlags is CDS_VIDEOPARAMETERS, lParam is a pointer to a VIDEOPARAMETERS structure. Otherwise lParam must be NULL.
%inst
The ChangeDisplaySettingsEx function changes the settings of the
specified display device to the specified graphics mode. (Unicode)

[戻り値]
The ChangeDisplaySettingsEx function returns one of the following
values.
This doc was truncated.

[備考]
To ensure that the DEVMODE structure passed to
ChangeDisplaySettingsEx is valid and contains only values supported
by the display driver, use the DEVMODE returned by the
EnumDisplaySettings function. When adding a display monitor to a
multiple-monitor system programmatically, set DEVMODE.dmFields to
DM_POSITION and specify a position (in DEVMODE.dmPosition) for the
monitor you are adding that is adjacent to at least one pixel of the
display area of an existing monitor. To detach the monitor, set
DEVMODE.dmFields to DM_POSITION but set DEVMODE.dmPelsWidth and
DEVMODE.dmPelsHeight to zero. For more information, see Multiple
Display Monitors. When the display mode is changed dynamically, the
WM_DISPLAYCHANGE message is sent to all running applications with the
following message parameters.
This doc was truncated.


%index
ChangeMenuW
(no summary)
%group
Win32 user32
%prm
hMenu, cmd, lpszNewItem, cmdInsert, flags
hMenu : [intptr] 
cmd : [int] 
lpszNewItem : [wstr] 
cmdInsert : [int] 
flags : [int] 
%inst



%index
ChangeWindowMessageFilter
Adds or removes a message from the User Interface Privilege Isolation (UIPI) message filter.
%group
Win32 user32
%prm
message, dwFlag
message : [int] Type: UINT The message to add to or remove from the filter.
dwFlag : [int] Type: DWORD
%inst
Adds or removes a message from the User Interface Privilege Isolation
(UIPI) message filter.

[戻り値]
Type: BOOL TRUE if successful; otherwise, FALSE. To get extended
error information, call GetLastError.
Note A message can be successfully removed from the filter, but that
is not a guarantee that the message will be blocked. See the Remarks
section for more details.

[備考]
UIPI is a security feature that prevents messages from being received
from a lower integrity level sender. All such messages with a value
above WM_USER are blocked by default. The filter, somewhat contrary
to intuition, is a list of messages that are allowed through.
Therefore, adding a message to the filter allows that message to be
received from a lower integrity sender, while removing a message
blocks that message from being received. Certain messages with a
value less than WM_USER are required to pass through the filter
regardless of the filter setting. You can call this function to
remove one of those messages from the filter and it will return TRUE.
However, the message will still be received by the calling process.
Processes at or below SECURITY_MANDATORY_LOW_RID are not allowed to
change the filter. If those processes call this function, it will
fail. For more information on integrity levels, see Understanding and
Working in Protected Mode Internet Explorer.


%index
ChangeWindowMessageFilterEx
Modifies the User Interface Privilege Isolation (UIPI) message filter for a specified window.
%group
Win32 user32
%prm
hwnd, message, action, pChangeFilterStruct
hwnd : [intptr] Type: HWND A handle to the window whose UIPI message filter is to be modified.
message : [int] Type: UINT The message that the message filter allows through or blocks.
action : [int] Type: DWORD
pChangeFilterStruct : [var] Type: PCHANGEFILTERSTRUCT Optional pointer to a CHANGEFILTERSTRUCT structure.
%inst
Modifies the User Interface Privilege Isolation (UIPI) message filter
for a specified window.

[戻り値]
Type: BOOL If the function succeeds, it returns TRUE; otherwise, it
returns FALSE. To get extended error information, call GetLastError.

[備考]
UIPI is a security feature that prevents messages from being received
from a lower-integrity-level sender. You can use this function to
allow specific messages to be delivered to a window even if the
message originates from a process at a lower integrity level. Unlike
the ChangeWindowMessageFilter function, which controls the process
message filter, the ChangeWindowMessageFilterEx function controls the
window message filter.
An application may use the ChangeWindowMessageFilter function to
allow or block a message in a process-wide manner. If the message is
allowed by either the process message filter or the window message
filter, it will be delivered to the window.
Note that processes at or below SECURITY_MANDATORY_LOW_RID are not
allowed to change the message filter. If those processes call this
function, it will fail and generate the extended error code,
ERROR_ACCESS_DENIED.
Certain messages whose value is smaller than WM_USER are required to
be passed through the filter, regardless of the filter setting. There
will be no effect when you attempt to use this function to allow or
block such messages.


%index
CharLowerW
Converts a character string or a single character to lowercase. If the operand is a character string, the function converts the characters in place. (Unicode)
%group
Win32 user32
%prm
lpsz
lpsz : [wstr] Type: LPTSTR A null-terminated string, or specifies a single character. If the high-order word of this parameter is zero, the low-order word must contain a single character to be converted.
%inst
Converts a character string or a single character to lowercase. If
the operand is a character string, the function converts the
characters in place. (Unicode)

[戻り値]
Type: LPTSTR If the operand is a character string, the function
returns a pointer to the converted string. Because the string is
converted in place, the return value is equal to lpsz. If the operand
is a single character, the return value is a 32-bit value whose
high-order word is zero, and low-order word contains the converted
character. There is no indication of success or failure. Failure is
rare. There is no extended error information for this function; do
not call GetLastError.

[備考]
Note that CharLower always maps uppercase I to lowercase I ("i"),
even when the current language is Turkish or Azerbaijani. If you need
a function that is linguistically sensitive in this respect, call
LCMapString. Conversion to Unicode in the ANSI version of the
function is done with the system default locale in all cases.
> [!NOTE] > The winuser.h header defines CharLower as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CharLowerBuffW
Converts uppercase characters in a buffer to lowercase characters. The function converts the characters in place. (Unicode)
%group
Win32 user32
%prm
lpsz, cchLength
lpsz : [wstr] Type: LPTSTR A buffer containing one or more characters to be processed.
cchLength : [int] Type: DWORD The size, in characters, of the buffer pointed to by lpsz. The function examines each character, and converts uppercase characters to lowercase characters. The function examines the number of characters indicated by cchLength, even if one or more characters are null characters.
%inst
Converts uppercase characters in a buffer to lowercase characters.
The function converts the characters in place. (Unicode)

[戻り値]
Type: DWORD The return value is the number of characters processed.
For example, if CharLowerBuff("Acme of Operating Systems", 10)
succeeds, the return value is 10.

[備考]
Note that CharLowerBuff always maps uppercase I to lowercase I ("i"),
even when the current language is Turkish or Azerbaijani. If you need
a function that is linguistically sensitive in this respect, call
LCMapSting. Conversion to Unicode in the ANSI version of the function
is done with the system default locale in all cases.


%index
CharNextW
Retrieves a pointer to the next character in a string. This function can handle strings consisting of either single- or multi-byte characters. (Unicode)
%group
Win32 user32
%prm
lpsz
lpsz : [wstr] Type: LPCTSTR A character in a null-terminated string.
%inst
Retrieves a pointer to the next character in a string. This function
can handle strings consisting of either single- or multi-byte
characters. (Unicode)

[戻り値]
Type: LPTSTR The return value is a pointer to the next character in
the string, or to the terminating null character if at the end of the
string. If lpsz points to the terminating null character, the return
value is equal to lpsz.

[備考]
When called as an ANSI function, CharNext uses the system default
code-page, whereas CharNextExA specifies a code-page to use. This
function works with default "user" expectations of characters when
dealing with diacritics. For example: A string that contains U+0061
U+030a "LATIN SMALL LETTER A" + COMBINING RING ABOVE" ? which looks
like "?", will advance two code points, not one. A string that
contains U+0061 U+0301 U+0302 U+0303 U+0304 ? which looks like
"a´^~?", will advance five code points, not one, and so on.
> [!NOTE] > The winuser.h header defines CharNext as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CharPrevW
Retrieves a pointer to the preceding character in a string. This function can handle strings consisting of either single- or multi-byte characters. (Unicode)
%group
Win32 user32
%prm
lpszStart, lpszCurrent
lpszStart : [wstr] Type: LPCTSTR The beginning of the string.
lpszCurrent : [wstr] Type: LPCTSTR A character in a null-terminated string.
%inst
Retrieves a pointer to the preceding character in a string. This
function can handle strings consisting of either single- or
multi-byte characters. (Unicode)

[戻り値]
Type: LPTSTR The return value is a pointer to the preceding character
in the string, or to the first character in the string if the
lpszCurrent parameter equals the lpszStart parameter.

[備考]
When called as an ANSI function, CharPrev uses the system default
code-page, whereas CharPrevExA specifies a code-page to use. This
function works with default "user" expectations of characters when
dealing with diacritics. For example: A string that contains U+0061
U+030a "LATIN SMALL LETTER A" + COMBINING RING ABOVE" ? which looks
like "?", will advance two code points, not one. A string that
contains U+0061 U+0301 U+0302 U+0303 U+0304 ? which looks like
"a´^~?", will advance five code points, not one, and so on.
> [!NOTE] > The winuser.h header defines CharPrev as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CharToOemW
Translates a string into the OEM-defined character set.Warning??Do not use. (Unicode)
%group
Win32 user32
%prm
pSrc, pDst
pSrc : [wstr] Type: LPCTSTR The null-terminated string to be translated.
pDst : [str] Type: LPSTR The destination buffer, which receives the translated string. If the CharToOem function is being used as an ANSI function, the string can be translated in place by setting the lpszDst parameter to the same address as the lpszSrc parameter. This cannot be done if CharToOem is being used as a wide-character function.
%inst
Translates a string into the OEM-defined character set.Warning Do not
use. (Unicode)

[戻り値]
Type: BOOL The return value is always nonzero except when you pass
the same address to lpszSrc and lpszDst in the wide-character version
of the function. In this case the function returns zero and
GetLastError returns ERROR_INVALID_ADDRESS.

[備考]
> [!NOTE] > The winuser.h header defines CharToOem as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CharToOemBuffW
Translates a specified number of characters in a string into the OEM-defined character set. (Unicode)
%group
Win32 user32
%prm
lpszSrc, lpszDst, cchDstLength
lpszSrc : [wstr] Type: LPCTSTR The null-terminated string to be translated.
lpszDst : [str] Type: LPSTR The buffer for the translated string. If the CharToOemBuff function is being used as an ANSI function, the string can be translated in place by setting the lpszDst parameter to the same address as the lpszSrc parameter. This cannot be done if CharToOemBuff is being used as a wide-character function.
cchDstLength : [int] Type: DWORD The number of characters to translate in the string identified by the lpszSrc parameter.
%inst
Translates a specified number of characters in a string into the
OEM-defined character set. (Unicode)

[戻り値]
Type: BOOL The return value is always nonzero except when you pass
the same address to lpszSrc and lpszDst in the wide-character version
of the function. In this case the function returns zero and
GetLastError returns ERROR_INVALID_ADDRESS.

[備考]
Unlike the CharToOem function, the CharToOemBuff function does not
stop converting characters when it encounters a null character in the
buffer pointed to by lpszSrc. The CharToOemBuff function converts all
cchDstLength characters.
> [!NOTE] > The winuser.h header defines CharToOemBuff as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CharUpperW
Converts a character string or a single character to uppercase. If the operand is a character string, the function converts the characters in place. (Unicode)
%group
Win32 user32
%prm
lpsz
lpsz : [wstr] Type: LPTSTR A null-terminated string, or a single character. If the high-order word of this parameter is zero, the low-order word must contain a single character to be converted.
%inst
Converts a character string or a single character to uppercase. If
the operand is a character string, the function converts the
characters in place. (Unicode)

[戻り値]
Type: LPTSTR If the operand is a character string, the function
returns a pointer to the converted string. Because the string is
converted in place, the return value is equal to lpsz. If the operand
is a single character, the return value is a 32-bit value whose
high-order word is zero, and low-order word contains the converted
character. There is no indication of success or failure. Failure is
rare. There is no extended error information for this function; do
not call GetLastError.

[備考]
Note that CharUpper always maps lowercase I ("i") to uppercase I,
even when the current language is Turkish or Azerbaijani. If you need
a function that is linguistically sensitive in this respect, call
LCMapString. Conversion to Unicode in the ANSI version of the
function is done with the system default locale in all cases.
> [!NOTE] > The winuser.h header defines CharUpper as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CharUpperBuffW
Converts lowercase characters in a buffer to uppercase characters. The function converts the characters in place. (Unicode)
%group
Win32 user32
%prm
lpsz, cchLength
lpsz : [wstr] Type: LPTSTR A buffer containing one or more characters to be processed.
cchLength : [int] Type: DWORD The size, in characters, of the buffer pointed to by lpsz. The function examines each character, and converts lowercase characters to uppercase characters. The function examines the number of characters indicated by cchLength, even if one or more characters are null characters.
%inst
Converts lowercase characters in a buffer to uppercase characters.
The function converts the characters in place. (Unicode)

[戻り値]
Type: DWORD The return value is the number of characters processed.
For example, if CharUpperBuff("Zenith of API Sets", 10) succeeds, the
return value is 10.

[備考]
Note that CharUpperBuff always maps lowercase I ("i") to uppercase I,
even when the current language is Turkish or Azerbaijani. If you need
a function that is linguistically sensitive in this respect, call
LCMapString. Conversion to Unicode in the ANSI version of the
function is done with the system default locale in all cases.


%index
CheckDlgButton
Changes the check state of a button control.
%group
Win32 user32
%prm
hDlg, nIDButton, uCheck
hDlg : [intptr] Type: HWND A handle to the dialog box that contains the button.
nIDButton : [int] Type: int The identifier of the button to modify.
uCheck : [int] Type: UINT
%inst
Changes the check state of a button control.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The CheckDlgButton function sends a BM_SETCHECK message to the
specified button control in the specified dialog box.


%index
CheckMenuItem
Sets the state of the specified menu item's check-mark attribute to either selected or clear.
%group
Win32 user32
%prm
hMenu, uIDCheckItem, uCheck
hMenu : [intptr] Type: HMENU A handle to the menu of interest.
uIDCheckItem : [int] Type: UINT The menu item whose check-mark attribute is to be set, as determined by the uCheck parameter.
uCheck : [int] Type: UINT The flags that control the interpretation of the uIDCheckItem parameter and the state of the menu item's check-mark attribute. This parameter can be a combination of either MF_BYCOMMAND, or MF_BYPOSITION and MF_CHECKED or MF_UNCHECKED.
%inst
Sets the state of the specified menu item's check-mark attribute to
either selected or clear.

[戻り値]
Type: DWORD The return value specifies the previous state of the menu
item (either MF_CHECKED or MF_UNCHECKED). If the menu item does not
exist, the return value is ?1.

[備考]
An item in a menu bar cannot have a check mark. The uIDCheckItem
parameter identifies a item that opens a submenu or a command item.
For a item that opens a submenu, the uIDCheckItem parameter must
specify the position of the item. For a command item, the
uIDCheckItem parameter can specify either the item's position or its
identifier.


%index
CheckMenuRadioItem
Checks a specified menu item and makes it a radio item. At the same time, the function clears all other menu items in the associated group and clears the radio-item type flag for those items.
%group
Win32 user32
%prm
hmenu, first, last, check, flags
hmenu : [intptr] Type: HMENU A handle to the menu that contains the group of menu items.
first : [int] Type: UINT The identifier or position of the first menu item in the group.
last : [int] Type: UINT The identifier or position of the last menu item in the group.
check : [int] Type: UINT The identifier or position of the menu item to check.
flags : [int] Type: UINT Indicates the meaning of idFirst, idLast, and idCheck. If this parameter is MF_BYCOMMAND, the other parameters specify menu item identifiers. If it is MF_BYPOSITION, the other parameters specify the menu item positions.
%inst
Checks a specified menu item and makes it a radio item. At the same
time, the function clears all other menu items in the associated
group and clears the radio-item type flag for those items.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, use the GetLastError function.

[備考]
The CheckMenuRadioItem function sets the MFT_RADIOCHECK type flag and
the MFS_CHECKED state for the item specified by idCheck and, at the
same time, clears both flags for all other items in the group. The
selected item is displayed using a bullet bitmap instead of a
check-mark bitmap. For more information about menu item type and
state flags, see the MENUITEMINFO structure.


%index
CheckRadioButton
Adds a check mark to (checks) a specified radio button in a group and removes a check mark from (clears) all other radio buttons in the group.
%group
Win32 user32
%prm
hDlg, nIDFirstButton, nIDLastButton, nIDCheckButton
hDlg : [intptr] Type: HWND A handle to the dialog box that contains the radio button.
nIDFirstButton : [int] Type: int The identifier of the first radio button in the group.
nIDLastButton : [int] Type: int The identifier of the last radio button in the group.
nIDCheckButton : [int] Type: int The identifier of the radio button to select.
%inst
Adds a check mark to (checks) a specified radio button in a group and
removes a check mark from (clears) all other radio buttons in the
group.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The CheckRadioButton function sends a BM_SETCHECK message to each of
the radio buttons in the indicated group. The nIDFirstButton and
nIDLastButton parameters specify a range of button identifiers
(normally the resource IDs of the buttons). The position of buttons
in the tab order is irrelevant; if a button forms part of a group,
but has an ID outside the specified range, it is not affected by this
call.


%index
ChildWindowFromPoint
Determines which, if any, of the child windows belonging to a parent window contains the specified point. The search is restricted to immediate child windows. Grandchildren, and deeper descendant windows are not searched.
%group
Win32 user32
%prm
hWndParent, Point
hWndParent : [intptr] Type: HWND A handle to the parent window.
Point : [int] Type: POINT A structure that defines the client coordinates, relative to hWndParent, of the point to be checked.
%inst
Determines which, if any, of the child windows belonging to a parent
window contains the specified point. The search is restricted to
immediate child windows. Grandchildren, and deeper descendant windows
are not searched.

[戻り値]
Type: HWND The return value is a handle to the child window that
contains the point, even if the child window is hidden or disabled.
If the point lies outside the parent window, the return value is
NULL. If the point is within the parent window but not within any
child window, the return value is a handle to the parent window.

[備考]
The system maintains an internal list, containing the handles of the
child windows associated with a parent window. The order of the
handles in the list depends on the Z order of the child windows. If
more than one child window contains the specified point, the system
returns a handle to the first window in the list that contains the
point. ChildWindowFromPoint treats an HTTRANSPARENT area of a
standard control the same as other parts of the control. In contrast,
RealChildWindowFromPoint treats an HTTRANSPARENT area differently; it
returns the child window behind a transparent area of a control. For
example, if the point is in a transparent area of a groupbox,
ChildWindowFromPoint returns the groupbox while
RealChildWindowFromPoint returns the child window behind the
groupbox. However, both APIs return a static field, even though it,
too, returns HTTRANSPARENT.


%index
ChildWindowFromPointEx
Determines which, if any, of the child windows belonging to the specified parent window contains the specified point.
%group
Win32 user32
%prm
hwnd, pt, flags
hwnd : [intptr] Type: HWND A handle to the parent window.
pt : [int] Type: POINT A structure that defines the client coordinates (relative to hwndParent) of the point to be checked.
flags : [int] Type: UINT The child windows to be skipped. This parameter can be one or more of the following values.
%inst
Determines which, if any, of the child windows belonging to the
specified parent window contains the specified point.

[戻り値]
Type: HWND The return value is a handle to the first child window
that contains the point and meets the criteria specified by uFlags.
If the point is within the parent window but not within any child
window that meets the criteria, the return value is a handle to the
parent window. If the point lies outside the parent window or if the
function fails, the return value is NULL.

[備考]
The system maintains an internal list that contains the handles of
the child windows associated with a parent window. The order of the
handles in the list depends on the Z order of the child windows. If
more than one child window contains the specified point, the system
returns a handle to the first window in the list that contains the
point and meets the criteria specified by uFlags.


%index
ClientToScreen
指定した点のクライアント領域座標をスクリーン座標に変換する。
%group
Win32 user32
%prm
hWnd, lpPoint
hWnd : [intptr] 変換に使用するクライアント領域を持つウィンドウへのハンドル。
lpPoint : [var] 変換するクライアント座標を保持する POINT 構造体へのポインタ。成功時は新しいスクリーン座標が格納される。
%inst
指定した点のクライアント領域座標をスクリーン座標に変換する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
POINT
構造体のクライアント領域座標をスクリーン座標に置き換える。スクリーン座標は画面左上隅が基準。ウィンドウのクライアント領域の上にある点は y
が負となり、左にある点は x が負となる。すべての座標はデバイス座標である。


%index
ClipCursor
Confines the cursor to a rectangular area on the screen.
%group
Win32 user32
%prm
lpRect
lpRect : [var] Type: const RECT* A pointer to the structure that contains the screen coordinates of the upper-left and lower-right corners of the confining rectangle. If this parameter is NULL, the cursor is free to move anywhere on the screen.
%inst
Confines the cursor to a rectangular area on the screen.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The cursor is a shared resource. If an application confines the
cursor, it must release the cursor by using ClipCursor before
relinquishing control to another application. The calling process
must have WINSTA_WRITEATTRIBUTES access to the window station.


%index
CloseClipboard
Closes the clipboard.
%group
Win32 user32
%prm

%inst
Closes the clipboard.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
When the window has finished examining or changing the clipboard,
close the clipboard by calling CloseClipboard. This enables other
windows to access the clipboard. Do not place an object on the
clipboard after calling CloseClipboard.


%index
CloseGestureInfoHandle
Closes resources associated with a gesture information handle.
%group
Win32 user32
%prm
hGestureInfo
hGestureInfo : [intptr] The gesture information handle.
%inst
Closes resources associated with a gesture information handle.

[戻り値]
If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. To get extended
error information, use the GetLastError function.

[備考]
If an application processes a WM_GESTURE message, it is responsible
for closing the handle using this function. Failure to do so may
result in process memory leaks.
If the message is passed to DefWindowProc, or is forwarded using one
of the PostMessage or SendMessage classes of API functions, the
handle is transferred with the message and need not be closed by the
application.


%index
CloseTouchInputHandle
Closes a touch input handle, frees process memory associated with it, and invalidates the handle.
%group
Win32 user32
%prm
hTouchInput
hTouchInput : [intptr] The touch input handle received in the LPARAM of a touch message. The function fails with ERROR_INVALID_HANDLE if this handle is not valid. Note that the handle is not valid after it has been used in a successful call to CloseTouchInputHandle or after it has been passed to DefWindowProc, PostMessage, SendMessage or one of their variants.
%inst
Closes a touch input handle, frees process memory associated with it,
and invalidates the handle.

[戻り値]
If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. To get extended
error information, use the GetLastError function.

[備考]
Calling CloseTouchInputHandle will not free memory associated with
values retrieved in a call to GetTouchInputInfo. Values in structures
passed to GetTouchInputInfo will be valid until you delete them.


%index
CloseWindow
Minimizes (but does not destroy) the specified window.
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] Type: HWND A handle to the window to be minimized.
%inst
Minimizes (but does not destroy) the specified window.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
To destroy a window, an application must use the DestroyWindow
function.


%index
CloseWindowStation
Closes an open window station handle.
%group
Win32 user32
%prm
hWinSta
hWinSta : [intptr] A handle to the window station to be closed. This handle is returned by the CreateWindowStation or OpenWindowStation function. Do not specify the handle returned by the GetProcessWindowStation function.
%inst
Closes an open window station handle.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. Windows Server 2003 and Windows
XP/2000: This function does not set the last error code on failure.

[備考]
The CloseWindowStation function will fail if the handle being closed
is for the window station assigned to the calling process.


%index
ConsoleControl
(no summary)
%group
Win32 user32
%prm
Command, ConsoleInformation, ConsoleInformationLength
Command : [int] 
ConsoleInformation : [intptr] 
ConsoleInformationLength : [int] 
%inst



%index
DestroyAcceleratorTable
Destroys an accelerator table.
%group
Win32 user32
%prm
hAccel
hAccel : [intptr] Type: HACCEL A handle to the accelerator table to be destroyed. This handle must have been created by a call to the CreateAcceleratorTable or LoadAccelerators function.
%inst
Destroys an accelerator table.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero.
However, if the table has been loaded more than one call to
LoadAccelerators, the function will return a nonzero value only when
DestroyAcceleratorTable has been called an equal number of times. If
the function fails, the return value is zero.


%index
CopyAcceleratorTableW
Copies the specified accelerator table. This function is used to obtain the accelerator-table data that corresponds to an accelerator-table handle, or to determine the size of the accelerator-table data. (Unicode)
%group
Win32 user32
%prm
hAccelSrc, lpAccelDst, cAccelEntries
hAccelSrc : [intptr] Type: HACCEL A handle to the accelerator table to copy.
lpAccelDst : [var] Type: LPACCEL An array of ACCEL structures that receives the accelerator-table information.
cAccelEntries : [int] Type: int The number of ACCEL structures to copy to the buffer pointed to by the lpAccelDst parameter.
%inst
Copies the specified accelerator table. This function is used to
obtain the accelerator-table data that corresponds to an
accelerator-table handle, or to determine the size of the
accelerator-table data. (Unicode)

[戻り値]
Type: int If lpAccelDst is NULL, the return value specifies the
number of accelerator-table entries in the original table. Otherwise,
it specifies the number of accelerator-table entries that were
copied.

[備考]
> [!NOTE] > The winuser.h header defines CopyAcceleratorTable as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
DestroyIcon
アイコンを破棄し、アイコンが占有していたメモリを解放する。
%group
Win32 user32
%prm
hIcon
hIcon : [intptr] 型: HICON 破棄するアイコンへのハンドル。アイコンは使用中であってはならない。
%inst
アイコンを破棄し、アイコンが占有していたメモリを解放する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報を得るには GetLastError
を呼び出す。

[備考]
DestroyIcon を呼ぶ必要があるのは、次の関数で作成されたアイコンおよびカーソルのみ:
CreateIconFromResourceEx(LR_SHARED
フラグなしで呼ばれた場合)、CreateIconIndirect、CopyIcon。共有アイコンの破棄にこの関数を使用してはならない。共有アイコンはそれをロードしたモジュールがメモリ上に存在する限り有効である。次の関数は共有アイコンを取得する。
（以下省略）


%index
CopyIcon
Copies the specified icon from another module to the current module.
%group
Win32 user32
%prm
hIcon
hIcon : [intptr] Type: HICON A handle to the icon to be copied.
%inst
Copies the specified icon from another module to the current module.

[戻り値]
Type: HICON If the function succeeds, the return value is a handle to
the duplicate icon. If the function fails, the return value is NULL.
To get extended error information, call GetLastError.

[備考]
The CopyIcon function enables an application or DLL to get its own
handle to an icon owned by another module. If the other module is
freed, the application icon will still be able to use the icon.
Before closing, an application must call the DestroyIcon function to
free any system resources associated with the icon.


%index
CopyImage
Creates a new image (icon, cursor, or bitmap) and copies the attributes of the specified image to the new one. If necessary, the function stretches the bits to fit the desired size of the new image.
%group
Win32 user32
%prm
h, type, cx, cy, flags
h : [intptr] Type: HANDLE A handle to the image to be copied.
type : [int] Type: UINT
cx : [int] Type: int The desired width, in pixels, of the image. If this is zero, then the returned image will have the same width as the original hImage.
cy : [int] Type: int The desired height, in pixels, of the image. If this is zero, then the returned image will have the same height as the original hImage.
flags : [int] Type: UINT
%inst
Creates a new image (icon, cursor, or bitmap) and copies the
attributes of the specified image to the new one. If necessary, the
function stretches the bits to fit the desired size of the new image.

[戻り値]
Type: HANDLE If the function succeeds, the return value is the handle
to the newly created image. If the function fails, the return value
is NULL. To get extended error information, call GetLastError.

[備考]
When you are finished using the resource, you can release its
associated memory by calling one of the functions in the following
table.
This doc was truncated.


%index
CopyRect
The CopyRect function copies the coordinates of one rectangle to another.
%group
Win32 user32
%prm
lprcDst, lprcSrc
lprcDst : [var] Pointer to the RECT structure that receives the logical coordinates of the source rectangle.
lprcSrc : [var] Pointer to the RECT structure whose coordinates are to be copied in logical units.
%inst
The CopyRect function copies the coordinates of one rectangle to
another.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
Because applications can use rectangles for different purposes, the
rectangle functions do not use an explicit unit of measure. Instead,
all rectangle coordinates and dimensions are given in signed, logical
values. The mapping mode and the function in which the rectangle is
used determine the units of measure.


%index
CountClipboardFormats
Retrieves the number of different data formats currently on the clipboard.
%group
Win32 user32
%prm

%inst
Retrieves the number of different data formats currently on the
clipboard.

[戻り値]
Type: int If the function succeeds, the return value is the number of
different data formats currently on the clipboard. If the function
fails, the return value is zero. To get extended error information,
call GetLastError.


%index
CreateAcceleratorTableW
Creates an accelerator table. (Unicode)
%group
Win32 user32
%prm
paccel, cAccel
paccel : [var] Type: LPACCEL An array of ACCEL structures that describes the accelerator table.
cAccel : [int] Type: int The number of ACCEL structures in the array. This must be within the range 1 to 32767 or the function will fail.
%inst
Creates an accelerator table. (Unicode)

[戻り値]
Type: HACCEL If the function succeeds, the return value is the handle
to the created accelerator table; otherwise, it is NULL. To get
extended error information, call GetLastError.

[備考]
Before an application closes, it can use the DestroyAcceleratorTable
function to destroy any accelerator tables that it created by using
the CreateAcceleratorTable function.


%index
CreateCaret
Creates a new shape for the system caret and assigns ownership of the caret to the specified window. The caret shape can be a line, a block, or a bitmap.
%group
Win32 user32
%prm
hWnd, hBitmap, nWidth, nHeight
hWnd : [intptr] Type: HWND A handle to the window that owns the caret.
hBitmap : [intptr] Type: HBITMAP A handle to the bitmap that defines the caret shape. If this parameter is NULL, the caret is solid. If this parameter is (HBITMAP) 1, the caret is gray. If this parameter is a bitmap handle, the caret is the specified bitmap. The bitmap handle must have been created by the CreateBitmap, CreateDIBitmap, or LoadBitmap function. If hBitmap is a bitmap handle, CreateCaret ignores the nWidth and nHeight parameters; the bitmap defines its own width and height.
nWidth : [int] Type: int The width of the caret, in logical units. If this parameter is zero, the width is set to the system-defined window border width. If hBitmap is a bitmap handle, CreateCaret ignores this parameter.
nHeight : [int] Type: int The height of the caret, in logical units. If this parameter is zero, the height is set to the system-defined window border height. If hBitmap is a bitmap handle, CreateCaret ignores this parameter.
%inst
Creates a new shape for the system caret and assigns ownership of the
caret to the specified window. The caret shape can be a line, a
block, or a bitmap.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. To get extended
error information, call GetLastError.

[備考]
The nWidth and nHeight parameters specify the caret's width and
height, in logical units; the exact width and height, in pixels,
depend on the window's mapping mode. CreateCaret automatically
destroys the previous caret shape, if any, regardless of the window
that owns the caret. The caret is hidden until the application calls
the ShowCaret function to make the caret visible. The system provides
one caret per queue. A window should create a caret only when it has
the keyboard focus or is active. The window should destroy the caret
before losing the keyboard focus or becoming inactive. DPI
Virtualization This API does not participate in DPI virtualization.
The width and height parameters are interpreted as logical sizes in
terms of the window in question. The calling thread is not taken into
consideration.


%index
DestroyCursor
カーソルを破棄し、カーソルが占有していたメモリを解放する。共有カーソルの破棄にこの関数を使用してはならない。
%group
Win32 user32
%prm
hCursor
hCursor : [intptr] 型: HCURSOR 破棄するカーソルへのハンドル。カーソルは使用中であってはならない。
%inst
カーソルを破棄し、カーソルが占有していたメモリを解放する。共有カーソルの破棄にこの関数を使用してはならない。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報を得るには GetLastError
を呼び出す。

[備考]
DestroyCursor
関数は非共有カーソルを破棄する。この関数で共有カーソルを破棄してはならない。共有カーソルはそれをロードしたモジュールがメモリ上に存在する限り有効である。次の関数は共有カーソルを取得する:
（以下省略）


%index
CreateCursor
Creates a cursor having the specified size, bit patterns, and hot spot.
%group
Win32 user32
%prm
hInst, xHotSpot, yHotSpot, nWidth, nHeight, pvANDPlane, pvXORPlane
hInst : [intptr] Type: HINSTANCE A handle to the current instance of the application creating the cursor.
xHotSpot : [int] Type: int The horizontal position of the cursor's hot spot.
yHotSpot : [int] Type: int The vertical position of the cursor's hot spot.
nWidth : [int] Type: int The width of the cursor, in pixels.
nHeight : [int] Type: int The height of the cursor, in pixels.
pvANDPlane : [intptr] Type: const VOID* An array of bytes that contains the bit values for the AND mask of the cursor, as in a device-dependent monochrome bitmap.
pvXORPlane : [intptr] Type: const VOID* An array of bytes that contains the bit values for the XOR mask of the cursor, as in a device-dependent monochrome bitmap.
%inst
Creates a cursor having the specified size, bit patterns, and hot
spot.

[戻り値]
Type: HCURSOR If the function succeeds, the return value is a handle
to the cursor. If the function fails, the return value is NULL. To
get extended error information, call GetLastError.

[備考]
The nWidth and nHeight parameters must specify a width and height
that are supported by the current display driver, because the system
cannot create cursors of other sizes. To determine the width and
height supported by the display driver, use the GetSystemMetrics
function, specifying the SM_CXCURSOR or SM_CYCURSOR value. Before
closing, an application must call the DestroyCursor function to free
any system resources associated with the cursor. DPI Virtualization
This API does not participate in DPI virtualization. The output
returned is in terms of physical coordinates, and is not affected by
the DPI of the calling thread. Note that the cursor created may still
be scaled to match the DPI of any given window it is drawn into.


%index
CreateDesktopW
Creates a new desktop, associates it with the current window station of the calling process, and assigns it to the calling thread. (Unicode)
%group
Win32 user32
%prm
lpszDesktop, lpszDevice, pDevmode, dwFlags, dwDesiredAccess, lpsa
lpszDesktop : [wstr] The name of the desktop to be created. Desktop names are case-insensitive and may not contain backslash characters (\\).
lpszDevice : [wstr] Reserved; must be NULL.
pDevmode : [var] Reserved; must be NULL.
dwFlags : [int] This parameter can be zero or the following value.
dwDesiredAccess : [int] The access to the desktop. For a list of values, see Desktop Security and Access Rights. This parameter must include the DESKTOP_CREATEWINDOW access right, because internally CreateDesktop uses the handle to create a window.
lpsa : [var] A pointer to a SECURITY_ATTRIBUTES structure that determines whether the returned handle can be inherited by child processes. If lpsa is NULL, the handle cannot be inherited. The lpSecurityDescriptor member of the structure specifies a security descriptor for the new desktop. If this parameter is NULL, the desktop inherits its security descriptor from the parent window station.
%inst
Creates a new desktop, associates it with the current window station
of the calling process, and assigns it to the calling thread.
(Unicode)

[戻り値]
If the function succeeds, the return value is a handle to the newly
created desktop. If the specified desktop already exists, the
function succeeds and returns a handle to the existing desktop. When
you are finished using the handle, call the CloseDesktop function to
close it. If the function fails, the return value is NULL. To get
extended error information, call GetLastError.

[備考]
If the dwDesiredAccess parameter specifies the READ_CONTROL,
WRITE_DAC, or WRITE_OWNER standard access rights, you must also
request the DESKTOP_READOBJECTS and DESKTOP_WRITEOBJECTS access
rights. The number of desktops that can be created is limited by the
size of the system desktop heap, which is 48 MB. Desktop objects use
the heap to store resources. You can increase the number of desktops
that can be created by reducing the default heap reserved for each
desktop in the interactive window station. This value is specified in
the "SharedSection" substring of the following registry value:
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session
Manager\SubSystems\Windows. The default data for this registry value
is as follows: "%SystemRoot%\system32\csrss.exe
ObjectDirectory=\Windows SharedSection=1024,3072,512 Windows=On
SubSystemType=Windows ServerDll=basesrv,1
ServerDll=winsrv:UserServerDllInitialization,3
ServerDll=winsrv:ConServerDllInitialization,2 ProfileControl=Off
MaxRequestThreads=16"
The values for the "SharedSection" substring are described as
follows:
This doc was truncated.


%index
CreateDesktopExW
Creates a new desktop with the specified heap, associates it with the current window station of the calling process, and assigns it to the calling thread. (Unicode)
%group
Win32 user32
%prm
lpszDesktop, lpszDevice, pDevmode, dwFlags, dwDesiredAccess, lpsa, ulHeapSize, pvoid
lpszDesktop : [wstr] The name of the desktop to be created. Desktop names are case-insensitive and may not contain backslash characters (\\).
lpszDevice : [wstr] This parameter is reserved and must be NULL.
pDevmode : [var] This parameter is reserved and must be NULL.
dwFlags : [int] This parameter can be zero or the following value.
dwDesiredAccess : [int] The requested access to the desktop. For a list of values, see Desktop Security and Access Rights.
lpsa : [var] A pointer to a SECURITY_ATTRIBUTES structure that determines whether the returned handle can be inherited by child processes. If lpsa is NULL, the handle cannot be inherited.
ulHeapSize : [int] The size of the desktop heap, in kilobytes.
pvoid : [intptr] This parameter is reserved and must be NULL.
%inst
Creates a new desktop with the specified heap, associates it with the
current window station of the calling process, and assigns it to the
calling thread. (Unicode)

[戻り値]
If the function succeeds, the return value is a handle to the newly
created desktop. If the specified desktop already exists, the
function succeeds and returns a handle to the existing desktop. When
you are finished using the handle, call the CloseDesktop function to
close it. If the function fails, the return value is NULL. To get
extended error information, call GetLastError.

[備考]
If the dwDesiredAccess parameter specifies the READ_CONTROL,
WRITE_DAC, or WRITE_OWNER standard access rights, you must also
request the DESKTOP_READOBJECTS and DESKTOP_WRITEOBJECTS access
rights. The number of desktops that can be created is limited by the
size of the system desktop heap. Desktop objects use the heap to
store resources. You can increase the number of desktops that can be
created by increasing the size of the desktop heap or by reducing the
default heap reserved for each desktop in the interactive window
station. This value is specified in the SharedSection substring of
the following registry value:
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session
Manager\SubSystems\Windows. The default data for this registry value
is as follows: %SystemRoot%\system32\csrss.exe
ObjectDirectory=\Windows SharedSection=1024,3072,512 Windows=On
SubSystemType=Windows ServerDll=basesrv,1
ServerDll=winsrv:UserServerDllInitialization,3
ServerDll=winsrv:ConServerDllInitialization,2 ProfileControl=Off
MaxRequestThreads=16
The values for the SharedSection substring are described as follows:
This doc was truncated.


%index
CreateDialogIndirectParamW
Creates a modeless dialog box from a dialog box template in memory. (Unicode)
%group
Win32 user32
%prm
hInstance, lpTemplate, hWndParent, lpDialogFunc, dwInitParam
hInstance : [intptr] Type: HINSTANCE A handle to the module which contains the dialog box template. If this parameter is NULL, then the current executable is used.
lpTemplate : [var] Type: LPCDLGTEMPLATE The template CreateDialogIndirectParam uses to create the dialog box. A dialog box template consists of a header that describes the dialog box, followed by one or more additional blocks of data that describe each of the controls in the dialog box. The template can use either the standard format or the extended format.
hWndParent : [intptr] Type: HWND A handle to the window that owns the dialog box.
lpDialogFunc : [int] Type: DLGPROC A pointer to the dialog box procedure. For more information about the dialog box procedure, see DialogProc.
dwInitParam : [intptr] Type: LPARAM The value to pass to the dialog box in the lParam parameter of the WM_INITDIALOG message.
%inst
Creates a modeless dialog box from a dialog box template in memory.
(Unicode)

[戻り値]
Type: HWND If the function succeeds, the return value is the window
handle to the dialog box. If the function fails, the return value is
NULL. To get extended error information, call GetLastError.

[備考]
The CreateDialogIndirectParam function uses the CreateWindowEx
function to create the dialog box. CreateDialogIndirectParam then
sends a WM_INITDIALOG message to the dialog box procedure. If the
template specifies the DS_SETFONT or DS_SHELLFONT style, the function
also sends a WM_SETFONT message to the dialog box procedure. The
function displays the dialog box if the template specifies the
WS_VISIBLE style. Finally, CreateDialogIndirectParam returns the
window handle to the dialog box. After CreateDialogIndirectParam
returns, you can use the ShowWindow function to display the dialog
box (if it is not already visible). To destroy the dialog box, use
the DestroyWindow function. To support keyboard navigation and other
dialog box functionality, the message loop for the dialog box must
call the IsDialogMessage function. In a standard dialog box template,
the DLGTEMPLATE structure and each of the DLGITEMTEMPLATE structures
must be aligned on DWORD boundaries. The creation data array that
follows a DLGITEMTEMPLATE structure must also be aligned on a DWORD
boundary. All of the other variable-length arrays in the template
must be aligned on WORD boundaries. In an extended dialog box
template, the DLGTEMPLATEEX header and each of the DLGITEMTEMPLATEEX
control definitions must be aligned on DWORD boundaries. The creation
data array, if any, that follows a DLGITEMTEMPLATEEX structure must
also be aligned on a DWORD boundary. All of the other variable-length
arrays in the template must be aligned on WORD boundaries. All
character strings in the dialog box template, such as titles for the
dialog box and buttons, must be Unicode strings.
> [!NOTE] > The winuser.h header defines CreateDialogIndirectParam as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CreateDialogParamW
Creates a modeless dialog box from a dialog box template resource. (Unicode)
%group
Win32 user32
%prm
hInstance, lpTemplateName, hWndParent, lpDialogFunc, dwInitParam
hInstance : [intptr] Type: HINSTANCE A handle to the module which contains the dialog box template. If this parameter is NULL, then the current executable is used.
lpTemplateName : [wstr] Type: LPCTSTR The dialog box template. This parameter is either the pointer to a null-terminated character string that specifies the name of the dialog box template or an integer value that specifies the resource identifier of the dialog box template. If the parameter specifies a resource identifier, its high-order word must be zero and low-order word must contain the identifier. You can use the MAKEINTRESOURCE macro to create this value.
hWndParent : [intptr] Type: HWND A handle to the window that owns the dialog box.
lpDialogFunc : [int] Type: DLGPROC A pointer to the dialog box procedure. For more information about the dialog box procedure, see DialogProc.
dwInitParam : [intptr] Type: LPARAM The value to be passed to the dialog box procedure in the lParam parameter in the WM_INITDIALOG message.
%inst
Creates a modeless dialog box from a dialog box template resource.
(Unicode)

[戻り値]
Type: HWND If the function succeeds, the return value is the window
handle to the dialog box. If the function fails, the return value is
NULL. To get extended error information, call GetLastError.

[備考]
The CreateDialogParam function uses the CreateWindowEx function to
create the dialog box. CreateDialogParam then sends a WM_INITDIALOG
message (and a WM_SETFONT message if the template specifies the
DS_SETFONT or DS_SHELLFONT style) to the dialog box procedure. The
function displays the dialog box if the template specifies the
WS_VISIBLE style. Finally, CreateDialogParam returns the window
handle of the dialog box. After CreateDialogParam returns, the
application displays the dialog box (if it is not already displayed)
using the ShowWindow function. The application destroys the dialog
box by using the DestroyWindow function. To support keyboard
navigation and other dialog box functionality, the message loop for
the dialog box must call the IsDialogMessage function.
> [!NOTE] > The winuser.h header defines CreateDialogParam as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CreateIcon
Creates an icon that has the specified size, colors, and bit patterns.
%group
Win32 user32
%prm
hInstance, nWidth, nHeight, cPlanes, cBitsPixel, lpbANDbits, lpbXORbits
hInstance : [intptr] Type: HINSTANCE A handle to the instance of the module creating the icon.
nWidth : [int] Type: int The width, in pixels, of the icon.
nHeight : [int] Type: int The height, in pixels, of the icon.
cPlanes : [int] Type: BYTE The number of planes in the XOR bitmask of the icon.
cBitsPixel : [int] Type: BYTE The number of bits-per-pixel in the XOR bitmask of the icon.
lpbANDbits : [var] Type: const BYTE* An array of bytes that contains the bit values for the AND bitmask of the icon. This bitmask describes a monochrome bitmap.
lpbXORbits : [var] Type: const BYTE* An array of bytes that contains the bit values for the XOR bitmask of the icon. This bitmask describes a monochrome or device-dependent color bitmap.
%inst
Creates an icon that has the specified size, colors, and bit
patterns.

[戻り値]
Type: HICON If the function succeeds, the return value is a handle to
an icon. If the function fails, the return value is NULL. To get
extended error information, call GetLastError.

[備考]
For more information about nWidth and nHeight parameters see Icon
Sizes. CreateIcon applies the following truth table to the AND and
XOR bitmasks.
This doc was truncated.


%index
CreateIconFromResource
Creates an icon or cursor from resource bits describing the icon. (CreateIconFromResource)
%group
Win32 user32
%prm
presbits, dwResSize, fIcon, dwVer
presbits : [var] Type: PBYTE The buffer containing the icon or cursor resource bits. These bits are typically loaded by calls to the LookupIconIdFromDirectory, LookupIconIdFromDirectoryEx, and LoadResource functions.
dwResSize : [int] Type: DWORD The size, in bytes, of the set of bits pointed to by the presbits parameter.
fIcon : [int] Type: BOOL Indicates whether an icon or a cursor is to be created. If this parameter is TRUE, an icon is to be created. If it is FALSE, a cursor is to be created.
dwVer : [int] Type: DWORD The version number of the icon or cursor format for the resource bits pointed to by the presbits parameter. The value must be greater than or equal to 0x00020000 and less than or equal to 0x00030000. This parameter is generally set to 0x00030000.
%inst
Creates an icon or cursor from resource bits describing the icon.
(CreateIconFromResource)

[戻り値]
Type: HICON If the function succeeds, the return value is a handle to
the icon or cursor. If the function fails, the return value is NULL.
To get extended error information, call GetLastError.

[備考]
The CreateIconFromResource, CreateIconFromResourceEx,
CreateIconIndirect, GetIconInfo, LookupIconIdFromDirectory, and
LookupIconIdFromDirectoryEx functions allow shell applications and
icon browsers to examine and use resources throughout the system. The
CreateIconFromResource function calls CreateIconFromResourceEx
passing LR_DEFAULTSIZE|LR_SHARED as flags. When you are finished
using the icon, destroy it using the DestroyIcon function.


%index
CreateIconFromResourceEx
Creates an icon or cursor from resource bits describing the icon. (CreateIconFromResourceEx)
%group
Win32 user32
%prm
presbits, dwResSize, fIcon, dwVer, cxDesired, cyDesired, Flags
presbits : [var] Type: PBYTE The icon or cursor resource bits. These bits are typically loaded by calls to the LookupIconIdFromDirectoryEx and LoadResource functions.
dwResSize : [int] Type: DWORD The size, in bytes, of the set of bits pointed to by the pbIconBits parameter.
fIcon : [int] Type: BOOL Indicates whether an icon or a cursor is to be created. If this parameter is TRUE, an icon is to be created. If it is FALSE, a cursor is to be created.
dwVer : [int] Type: DWORD The version number of the icon or cursor format for the resource bits pointed to by the pbIconBits parameter. The value must be greater than or equal to 0x00020000 and less than or equal to 0x00030000. This parameter is generally set to 0x00030000.
cxDesired : [int] Type: int The desired width, in pixels, of the icon or cursor. If this parameter is zero, the function uses the SM_CXICON or SM_CXCURSOR system metric value to set the width.
cyDesired : [int] Type: int The desired height, in pixels, of the icon or cursor. If this parameter is zero, the function uses the SM_CYICON or SM_CYCURSOR system metric value to set the height.
Flags : [int] Type: UINT
%inst
Creates an icon or cursor from resource bits describing the icon.
(CreateIconFromResourceEx)

[戻り値]
Type: HICON If the function succeeds, the return value is a handle to
the icon or cursor. If the function fails, the return value is NULL.
To get extended error information, call GetLastError.

[備考]
The CreateIconFromResource, CreateIconFromResourceEx,
CreateIconIndirect, GetIconInfo, and LookupIconIdFromDirectoryEx
functions allow shell applications and icon browsers to examine and
use resources throughout the system. You should call DestroyIcon for
icons created with CreateIconFromResourceEx.


%index
CreateIconIndirect
Creates an icon or cursor from an ICONINFO structure.
%group
Win32 user32
%prm
piconinfo
piconinfo : [var] Type: PICONINFO A pointer to an ICONINFO structure the function uses to create the icon or cursor.
%inst
Creates an icon or cursor from an ICONINFO structure.

[戻り値]
Type: HICON If the function succeeds, the return value is a handle to
the icon or cursor that is created. If the function fails, the return
value is NULL. To get extended error information, call GetLastError.

[備考]
The system copies the bitmaps in the ICONINFO structure before
creating the icon or cursor. Because the system may temporarily
select the bitmaps in a device context, the hbmMask and hbmColor
members of the ICONINFO structure should not already be selected into
a device context. The application must continue to manage the
original bitmaps and delete them when they are no longer necessary.
When you are finished using the icon, destroy it using the
DestroyIcon function.


%index
CreateMDIWindowW
Creates a multiple-document interface (MDI) child window. (Unicode)
%group
Win32 user32
%prm
lpClassName, lpWindowName, dwStyle, X, Y, nWidth, nHeight, hWndParent, hInstance, lParam
lpClassName : [wstr] Type: LPCTSTR The window class of the MDI child window. The class name must have been registered by a call to the RegisterClassEx function.
lpWindowName : [wstr] Type: LPCTSTR The window name. The system displays the name in the title bar of the child window.
dwStyle : [int] Type: DWORD
X : [int] Type: int The initial horizontal position, in client coordinates, of the MDI child window. If this parameter is CW_USEDEFAULT ((int)0x80000000), the MDI child window is assigned the default horizontal position.
Y : [int] Type: int The initial vertical position, in client coordinates, of the MDI child window. If this parameter is CW_USEDEFAULT, the MDI child window is assigned the default vertical position.
nWidth : [int] Type: int The initial width, in device units, of the MDI child window. If this parameter is CW_USEDEFAULT, the MDI child window is assigned the default width.
nHeight : [int] Type: int The initial height, in device units, of the MDI child window. If this parameter is set to CW_USEDEFAULT, the MDI child window is assigned the default height.
hWndParent : [intptr] Type: HWND A handle to the MDI client window that will be the parent of the new MDI child window.
hInstance : [intptr] Type: HINSTANCE A handle to the instance of the application creating the MDI child window.
lParam : [intptr] Type: LPARAM An application-defined value.
%inst
Creates a multiple-document interface (MDI) child window. (Unicode)

[戻り値]
Type: HWND If the function succeeds, the return value is the handle
to the created window. If the function fails, the return value is
NULL. To get extended error information, call GetLastError.

[備考]
> [!NOTE] > The winuser.h header defines CreateMDIWindow as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CreateMenu
Creates a menu. The menu is initially empty, but it can be filled with menu items by using the InsertMenuItem, AppendMenu, and InsertMenu functions.
%group
Win32 user32
%prm

%inst
Creates a menu. The menu is initially empty, but it can be filled
with menu items by using the InsertMenuItem, AppendMenu, and
InsertMenu functions.

[戻り値]
Type: HMENU If the function succeeds, the return value is a handle to
the newly created menu. If the function fails, the return value is
NULL. To get extended error information, call GetLastError.

[備考]
Resources associated with a menu that is assigned to a window are
freed automatically. If the menu is not assigned to a window, an
application must free system resources associated with the menu
before closing. An application frees menu resources by calling the
DestroyMenu function.


%index
CreatePopupMenu
Creates a drop-down menu, submenu, or shortcut menu.
%group
Win32 user32
%prm

%inst
Creates a drop-down menu, submenu, or shortcut menu.

[戻り値]
Type: HMENU If the function succeeds, the return value is a handle to
the newly created menu. If the function fails, the return value is
NULL. To get extended error information, call GetLastError.

[備考]
The application can add the new menu to an existing menu, or it can
display a shortcut menu by calling the TrackPopupMenuEx or
TrackPopupMenu functions. Resources associated with a menu that is
assigned to a window are freed automatically. If the menu is not
assigned to a window, an application must free system resources
associated with the menu before closing. An application frees menu
resources by calling the DestroyMenu function.


%index
DestroySyntheticPointerDevice
Destroys the specified pointer injection device.
%group
Win32 user32
%prm
device
device : [intptr] A handle to the pointer injection device.
%inst
Destroys the specified pointer injection device.


%index
CreateSyntheticPointerDevice
Configures the pointer injection device for the calling application, and initializes the maximum number of simultaneous pointers that the app can inject.
%group
Win32 user32
%prm
pointerType, maxCount, mode
pointerType : [int] The pointer injection device type. Must be either PT_TOUCH or PT_PEN.
maxCount : [int] The maximum number of contacts.
mode : [int] The contact visualization mode.
%inst
Configures the pointer injection device for the calling application,
and initializes the maximum number of simultaneous pointers that the
app can inject.

[戻り値]
If the function succeeds, the return value is a handle to the pointer
injection device. Otherwise, it returns null. To retrieve extended
error information, call the GetLastError function.


%index
CreateWindowExW
拡張ウィンドウスタイルを持つオーバーラップ、ポップアップ、または子ウィンドウを作成する。それ以外は CreateWindow 関数と同じ。(Unicode)
%group
Win32 user32
%prm
dwExStyle, lpClassName, lpWindowName, dwStyle, X, Y, nWidth, nHeight, hWndParent, hMenu, hInstance, lpParam
dwExStyle : [int] 型: DWORD 作成するウィンドウの拡張ウィンドウスタイル。指定可能な値は Extended Window Styles を参照。
lpClassName : [wstr] 型: LPCTSTR NULL 終端文字列、または以前に RegisterClass もしくは RegisterClassEx を呼び出して作成されたクラスアトム。アトムは lpClassName の下位ワードに配置し、上位ワードは 0 でなければならない。文字列の場合はウィンドウクラス名を指定する。クラス名はクラスを登録したモジュールがウィンドウを作成するモジュールと同一である限り、RegisterClass または RegisterClassEx で登録した任意の名前を指定できる。定義済みのシステムクラス名も指定できる。
lpWindowName : [wstr] 型: LPCTSTR ウィンドウ名。ウィンドウスタイルでタイトルバーが指定されている場合、lpWindowName が指すタイトルがタイトルバーに表示される。ボタン、チェックボックス、静的コントロールなどのコントロールを CreateWindow で作成する場合、lpWindowName でコントロールのテキストを指定する。SS_ICON スタイルの静的コントロールを作成する場合、lpWindowName でアイコン名または識別子を指定する。識別子を指定するには "#num" 構文を使う。
dwStyle : [int] 型: DWORD 作成するウィンドウのスタイル。ウィンドウスタイル値の組み合わせに加え、Remarks セクションに示されたコントロールスタイルを指定できる。
X : [int] 型: int ウィンドウの初期水平位置。オーバーラップまたはポップアップウィンドウの場合、x はウィンドウ左上隅の初期 x 座標(スクリーン座標)。子ウィンドウの場合、x は親ウィンドウクライアント領域の左上隅を基準とした左上隅の x 座標。x に CW_USEDEFAULT を指定すると、システムはウィンドウ左上隅の既定位置を選択し、y パラメータは無視される。CW_USEDEFAULT はオーバーラップウィンドウでのみ有効。ポップアップや子ウィンドウに指定すると x, y は 0 に設定される。
Y : [int] 型: int ウィンドウの初期垂直位置。オーバーラップまたはポップアップウィンドウの場合、y はウィンドウ左上隅の初期 y 座標(スクリーン座標)。子ウィンドウの場合、y は親ウィンドウクライアント領域の左上隅を基準とした子ウィンドウ左上隅の初期 y 座標。リストボックスの場合、y は親ウィンドウクライアント領域の左上隅を基準としたリストボックスクライアント領域の左上隅の初期 y 座標。
nWidth : [int] 型: int ウィンドウの幅(デバイス単位)。オーバーラップウィンドウの場合、nWidth はスクリーン座標による幅、または CW_USEDEFAULT を指定する。CW_USEDEFAULT の場合、システムが既定の幅と高さを選択する。既定の幅は初期 x 座標から画面右端まで、既定の高さは初期 y 座標からアイコン領域上端まで延びる。CW_USEDEFAULT はオーバーラップウィンドウでのみ有効。ポップアップや子ウィンドウに指定すると nWidth と nHeight は 0 に設定される。
nHeight : [int] 型: int ウィンドウの高さ(デバイス単位)。オーバーラップウィンドウの場合、nHeight はスクリーン座標によるウィンドウの高さ。nWidth に CW_USEDEFAULT が指定されている場合、nHeight は無視される。
hWndParent : [intptr] 型: HWND 作成するウィンドウの親または所有者ウィンドウへのハンドル。子ウィンドウや所有されるウィンドウを作成するには有効なウィンドウハンドルを指定する。ポップアップウィンドウではこのパラメータは省略可能。メッセージ専用ウィンドウを作成するには HWND_MESSAGE または既存のメッセージ専用ウィンドウのハンドルを指定する。
hMenu : [intptr] 型: HMENU ウィンドウスタイルに応じてメニューへのハンドルまたは子ウィンドウ識別子を指定する。オーバーラップまたはポップアップウィンドウの場合、hMenu はウィンドウで使用するメニューを識別する。クラスメニューを使用する場合は NULL を指定できる。子ウィンドウの場合、hMenu は子ウィンドウ識別子(ダイアログボックスのコントロールが親に対してイベントを通知するために使用する整数値)を指定する。識別子はアプリケーションが決定し、同じ親を持つすべての子ウィンドウで一意でなければならない。
hInstance : [intptr] 型: HINSTANCE ウィンドウに関連付けるモジュールのインスタンスへのハンドル。
lpParam : [intptr] 型: LPVOID WM_CREATE メッセージの lParam が指す CREATESTRUCT 構造体(lpCreateParams メンバ)を経由してウィンドウに渡される値へのポインタ。このメッセージは CreateWindowEx の戻り前に作成されたウィンドウへ送信される。MDI クライアントウィンドウを作成するために CreateWindow を呼ぶ場合、lpParam は CLIENTCREATESTRUCT 構造体を指す必要がある。MDI クライアントウィンドウが MDI 子ウィンドウを作成する場合は MDICREATESTRUCT 構造体を指す必要がある。追加データが不要なら NULL でもよい。
%inst
拡張ウィンドウスタイルを持つオーバーラップ、ポップアップ、または子ウィンドウを作成する。それ以外は CreateWindow
関数と同じ。(Unicode)

[戻り値]
型: HWND 関数が成功した場合、戻り値は新しいウィンドウへのハンドル。失敗した場合は NULL。拡張エラー情報は
GetLastError で取得する。この関数は通常、次のいずれかの理由で失敗する:
（以下省略）

[備考]
CreateWindowEx 関数は作成中のウィンドウに WM_NCCREATE、WM_NCCALCSIZE、WM_CREATE
メッセージを送信する。作成されたウィンドウが子ウィンドウの場合、既定位置は Z オーダーの最下位。トップレベルウィンドウの場合は Z
オーダーの最上位(ただし、作成されたウィンドウ自身が最前面でない限り、すべての最前面ウィンドウの下)。タスクバーに作成ウィンドウのボタンを表示するかどうかの制御については
Managing Taskbar Buttons を参照。ウィンドウの削除については DestroyWindow
を参照。次の定義済みコントロールクラスを lpClassName に指定できる。対応するコントロールスタイルは dwStyle
に指定できる。
（以下省略）


%index
CreateWindowStationW
Creates a window station object, associates it with the calling process, and assigns it to the current session. (Unicode)
%group
Win32 user32
%prm
lpwinsta, dwFlags, dwDesiredAccess, lpsa
lpwinsta : [wstr] The name of the window station to be created. Window station names are case-insensitive and cannot contain backslash characters (\\). Only members of the Administrators group are allowed to specify a name. If lpwinsta is NULL or an empty string, the system forms a window station name using the logon session identifier for the calling process. To get this name, call the GetUserObjectInformation function.
dwFlags : [int] If this parameter is CWF_CREATE_ONLY and the window station already exists, the call fails. If this flag is not specified and the window station already exists, the function succeeds and returns a new handle to the existing window station. Windows?XP/2000:??This parameter is reserved and must be zero.
dwDesiredAccess : [int] The type of access the returned handle has to the window station. In addition, you can specify any of the standard access rights, such as READ_CONTROL or WRITE_DAC, and a combination of the window station-specific access rights. For more information, see Window Station Security and Access Rights.
lpsa : [var] A pointer to a SECURITY_ATTRIBUTES structure that determines whether the returned handle can be inherited by child processes. If lpsa is NULL, the handle cannot be inherited. The lpSecurityDescriptor member of the structure specifies a security descriptor for the new window station. If lpsa is NULL, the window station (and any desktops created within the window) gets a security descriptor that grants GENERIC_ALL access to all users.
%inst
Creates a window station object, associates it with the calling
process, and assigns it to the current session. (Unicode)

[戻り値]
If the function succeeds, the return value is a handle to the newly
created window station. If the specified window station already
exists, the function succeeds and returns a handle to the existing
window station. If the function fails, the return value is NULL. To
get extended error information, call GetLastError.

[備考]
After you are done with the handle, you must call CloseWindowStation
to free the handle.
> [!NOTE] > The winuser.h header defines CreateWindowStation as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
DdeDisconnect
Terminates a conversation started by either the DdeConnect or DdeConnectList function and invalidates the specified conversation handle.
%group
Win32 user32
%prm
hConv
hConv : [intptr] Type: HCONV A handle to the active conversation to be terminated.
%inst
Terminates a conversation started by either the DdeConnect or
DdeConnectList function and invalidates the specified conversation
handle.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. The DdeGetLastError
function can be used to get the error code, which can be one of the
following values:

[備考]
Any incomplete transactions started before calling DdeDisconnect are
immediately abandoned. The XTYP_DISCONNECT transaction is sent to the
Dynamic Data Exchange (DDE) callback function of the partner in the
conversation. Generally, only client applications must terminate
conversations.


%index
DdeAbandonTransaction
Abandons the specified asynchronous transaction and releases all resources associated with the transaction.
%group
Win32 user32
%prm
idInst, hConv, idTransaction
idInst : [int] Type: DWORD The application instance identifier obtained by a previous call to the DdeInitialize function.
hConv : [intptr] Type: HCONV A handle to the conversation in which the transaction was initiated. If this parameter is 0L, all transactions are abandoned (that is, the idTransaction parameter is ignored).
idTransaction : [int] Type: DWORD The identifier of the transaction to be abandoned. If this parameter is 0L, all active transactions in the specified conversation are abandoned.
%inst
Abandons the specified asynchronous transaction and releases all
resources associated with the transaction.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. The DdeGetLastError
function can be used to get the error code, which can be one of the
following values:

[備考]
Only a Dynamic Data Exchange (DDE) client application should call
DdeAbandonTransaction. If the server application responds to the
transaction after the client has called DdeAbandonTransaction, the
system discards the transaction results. This function has no effect
on synchronous transactions.


%index
DdeFreeDataHandle
Frees a Dynamic Data Exchange (DDE) object and deletes the data handle associated with the object.
%group
Win32 user32
%prm
hData
hData : [intptr] Type: HDDEDATA A handle to the DDE object to be freed. This handle must have been created by a previous call to the DdeCreateDataHandle function or returned by the DdeClientTransaction function.
%inst
Frees a Dynamic Data Exchange (DDE) object and deletes the data
handle associated with the object.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. The DdeGetLastError
function can be used to get the error code, which can be one of the
following values:

[備考]
An application must call DdeFreeDataHandle under the following
circumstances:
This doc was truncated.


%index
DdeAccessData
Provides access to the data in the specified Dynamic Data Exchange (DDE) object. An application must call the DdeUnaccessData function when it has finished accessing the data in the object.
%group
Win32 user32
%prm
hData, pcbDataSize
hData : [intptr] Type: HDDEDATA A handle to the DDE object to be accessed.
pcbDataSize : [var] Type: LPDWORD A pointer to a variable that receives the size, in bytes, of the DDE object identified by the hData parameter. If this parameter is NULL, no size information is returned.
%inst
Provides access to the data in the specified Dynamic Data Exchange
(DDE) object. An application must call the DdeUnaccessData function
when it has finished accessing the data in the object.

[戻り値]
Type: LPBYTE If the function succeeds, the return value is a pointer
to the first byte of data in the DDE object. If the function fails,
the return value is NULL. The DdeGetLastError function can be used to
get the error code, which can be one of the following values:

[備考]
If the hData parameter has not been passed to a Dynamic Data Exchange
Management Library (DDEML) function, an application can use the
pointer returned by DdeAccessData for read-write access to the DDE
object. If hData has already been passed to a DDEML function, the
pointer should be used only for read access to the memory object.


%index
DdeAddData
Adds data to the specified Dynamic Data Exchange (DDE) object.
%group
Win32 user32
%prm
hData, pSrc, cb, cbOff
hData : [intptr] Type: HDDEDATA A handle to the DDE object that receives additional data.
pSrc : [var] Type: LPBYTE The data to be added to the DDE object.
cb : [int] Type: DWORD The length, in bytes, of the data to be added to the DDE object, including the terminating NULL, if the data is a string.
cbOff : [int] Type: DWORD An offset, in bytes, from the beginning of the DDE object. The additional data is copied to the object beginning at this offset.
%inst
Adds data to the specified Dynamic Data Exchange (DDE) object.

[戻り値]
Type: HDDEDATA If the function succeeds, the return value is a new
handle to the DDE object. The new handle is used in all references to
the object. If the function fails, the return value is zero. The
DdeGetLastError function can be used to get the error code, which can
be one of the following values:

[備考]
After a data handle has been used as a parameter in another Dynamic
Data Exchange Management Library function or has been returned by a
DDE callback function, the handle can be used only for read access to
the DDE object identified by the handle. If the amount of memory
originally allocated is less than is needed to hold the added data,
DdeAddData reallocates a global memory object of the appropriate
size.


%index
DdeClientTransaction
Begins a data transaction between a client and a server. Only a Dynamic Data Exchange (DDE) client application can call this function, and the application can use it only after establishing a conversation with the server.
%group
Win32 user32
%prm
pData, cbData, hConv, hszItem, wFmt, wType, dwTimeout, pdwResult
pData : [var] Type: LPBYTE The beginning of the data the client must pass to the server. Optionally, an application can specify the data handle (HDDEDATA) to pass to the server and in that case the cbData parameter should be set to -1. This parameter is required only if the wType parameter is XTYP_EXECUTE or XTYP_POKE. Otherwise, this parameter should be NULL. For the optional usage of this parameter, XTYP_POKE transactions where pData is a data handle, the handle must have been created by a previous call to the DdeCreateDataHandle function, employing the same data format specified in the wFmt parameter.
cbData : [int] Type: DWORD The length, in bytes, of the data pointed to by the pData parameter, including the terminating NULL, if the data is a string. A value of -1 indicates that pData is a data handle that identifies the data being sent.
hConv : [intptr] Type: HCONV A handle to the conversation in which the transaction is to take place.
hszItem : [intptr] Type: HSZ A handle to the data item for which data is being exchanged during the transaction. This handle must have been created by a previous call to the DdeCreateStringHandle function. This parameter is ignored (and should be set to 0L) if the wType parameter is XTYP_EXECUTE.
wFmt : [int] Type: UINT The standard clipboard format in which the data item is being submitted or requested. If the transaction specified by the wType parameter does not pass data or is XTYP_EXECUTE, this parameter should be zero. If the transaction specified by the wType parameter references non-execute DDE data ( XTYP_POKE, XTYP_ADVSTART, XTYP_ADVSTOP, XTYP_REQUEST), the wFmt value must be either a valid predefined (CF_) DDE format or a valid registered clipboard format.
wType : [int] Type: UINT
dwTimeout : [int] Type: DWORD The maximum amount of time, in milliseconds, that the client will wait for a response from the server application in a synchronous transaction. This parameter should be TIMEOUT_ASYNC for asynchronous transactions.
pdwResult : [var] Type: LPDWORD A pointer to a variable that receives the result of the transaction. An application that does not check the result can use NULL for this value. For synchronous transactions, the low-order word of this variable contains any applicable DDE_ flags resulting from the transaction. This provides support for applications dependent on DDE_APPSTATUS bits. It is, however, recommended that applications no longer use these bits because they may not be supported in future versions of the Dynamic Data Exchange Management Library (DDEML). For asynchronous transactions, this variable is filled with a unique transaction identifier for use with the DdeAbandonTransaction function and the XTYP_XACT_COMPLETE transaction.
%inst
Begins a data transaction between a client and a server. Only a
Dynamic Data Exchange (DDE) client application can call this
function, and the application can use it only after establishing a
conversation with the server.

[戻り値]
Type: HDDEDATA If the function succeeds, the return value is a data
handle that identifies the data for successful synchronous
transactions in which the client expects data from the server. The
return value is nonzero for successful asynchronous transactions and
for synchronous transactions in which the client does not expect
data. The return value is zero for all unsuccessful transactions. The
DdeGetLastError function can be used to get the error code, which can
be one of the following values:

[備考]
When an application has finished using the data handle returned by
DdeClientTransaction, the application should free the handle by
calling the DdeFreeDataHandle function. Transactions can be
synchronous or asynchronous. During a synchronous transaction,
DdeClientTransaction does not return until the transaction either
completes successfully or fails. Synchronous transactions cause a
client to enter a modal loop while waiting for various asynchronous
events. Because of this, a client application can still respond to
user input while waiting on a synchronous transaction, but the
application cannot begin a second synchronous transaction because of
the activity associated with the first. DdeClientTransaction fails if
any instance of the same task has a synchronous transaction already
in progress. During an asynchronous transaction, DdeClientTransaction
returns after the transaction has begun, passing a transaction
identifier for reference. When the server's DDE callback function
finishes processing an asynchronous transaction, the system sends an
XTYP_XACT_COMPLETE transaction to the client. This transaction
provides the client with the results of the asynchronous transaction
that it initiated by calling DdeClientTransaction. A client
application can choose to abandon an asynchronous transaction by
calling the DdeAbandonTransaction function.


%index
DdeCmpStringHandles
Compares the values of two string handles. The value of a string handle is not related to the case of the associated string.
%group
Win32 user32
%prm
hsz1, hsz2
hsz1 : [intptr] Type: HSZ A handle to the first string.
hsz2 : [intptr] Type: HSZ A handle to the second string.
%inst
Compares the values of two string handles. The value of a string
handle is not related to the case of the associated string.

[戻り値]
Type: int The return value can be one of the following values.
This doc was truncated.

[備考]
An application that must do a case-sensitive comparison of two string
handles should compare the string handles directly. An application
should use DdeCmpStringHandles for all other comparisons to preserve
the case-insensitive nature of Dynamic Data Exchange (DDE).
DdeCmpStringHandles cannot be used to sort string handles
alphabetically.


%index
DdeConnect
Establishes a conversation with a server application that supports the specified service name and topic name pair. If more than one such server exists, the system selects only one.
%group
Win32 user32
%prm
idInst, hszService, hszTopic, pCC
idInst : [int] Type: DWORD The application instance identifier obtained by a previous call to the DdeInitialize function.
hszService : [intptr] Type: HSZ A handle to the string that specifies the service name of the server application with which a conversation is to be established. This handle must have been created by a previous call to the DdeCreateStringHandle function. If this parameter is 0L, a conversation is established with any available server.
hszTopic : [intptr] Type: HSZ A handle to the string that specifies the name of the topic on which a conversation is to be established. This handle must have been created by a previous call to DdeCreateStringHandle. If this parameter is 0L, a conversation on any topic supported by the selected server is established.
pCC : [var] Type: PCONVCONTEXT A pointer to the CONVCONTEXT structure that contains conversation context information. If this parameter is NULL, the server receives the default CONVCONTEXT structure during the XTYP_CONNECT or XTYP_WILDCONNECT transaction.
%inst
Establishes a conversation with a server application that supports
the specified service name and topic name pair. If more than one such
server exists, the system selects only one.

[戻り値]
Type: HCONV If the function succeeds, the return value is the handle
to the established conversation. If the function fails, the return
value is 0L. The DdeGetLastError function can be used to get the
error code, which can be one of the following values:

[備考]
The client application cannot make assumptions regarding the server
selected. If an instance-specific name is specified in the hszService
parameter, a conversation is established with only the specified
instance. Instance-specific service names are passed to an
application's Dynamic Data Exchange (DDE) callback function during
the XTYP_REGISTER and XTYP_UNREGISTER transactions. All members of
the default CONVCONTEXT structure are set to zero except cb, which
specifies the size of the structure, and iCodePage, which specifies
CP_WINANSI (the default code page) or CP_WINUNICODE, depending on
whether the ANSI or Unicode version of the DdeInitialize function was
called by the client application.


%index
DdeDisconnectList
Destroys the specified conversation list and terminates all conversations associated with the list.
%group
Win32 user32
%prm
hConvList
hConvList : [intptr] Type: HCONVLIST A handle to the conversation list. This handle must have been created by a previous call to the DdeConnectList function.
%inst
Destroys the specified conversation list and terminates all
conversations associated with the list.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. The DdeGetLastError
function can be used to get the error code, which can be one of the
following values:

[備考]
An application can use the DdeDisconnect function to terminate
individual conversations in the list.


%index
DdeConnectList
Establishes a conversation with all server applications that support the specified service name and topic name pair.
%group
Win32 user32
%prm
idInst, hszService, hszTopic, hConvList, pCC
idInst : [int] Type: DWORD The application instance identifier obtained by a previous call to the DdeInitialize function.
hszService : [intptr] Type: HSZ A handle to the string that specifies the service name of the server application with which a conversation is to be established. If this parameter is 0L, the system attempts to establish conversations with all available servers that support the specified topic name.
hszTopic : [intptr] Type: HSZ A handle to the string that specifies the name of the topic on which a conversation is to be established. This handle must have been created by a previous call to the DdeCreateStringHandle function. If this parameter is 0L, the system will attempt to establish conversations on all topics supported by the selected server (or servers).
hConvList : [intptr] Type: HCONVLIST A handle to the conversation list to be enumerated. This parameter should be 0L if a new conversation list is to be established.
pCC : [var] Type: PCONVCONTEXT A pointer to the CONVCONTEXT structure that contains conversation-context information. If this parameter is NULL, the server receives the default CONVCONTEXT structure during the XTYP_CONNECT or XTYP_WILDCONNECT transaction.
%inst
Establishes a conversation with all server applications that support
the specified service name and topic name pair.

[戻り値]
Type: HCONVLIST If the function succeeds, the return value is the
handle to a new conversation list. If the function fails, the return
value is 0L. The handle to the old conversation list is no longer
valid. The DdeGetLastError function can be used to get the error
code, which can be one of the following values:

[備考]
An application must free the conversation list handle returned by the
DdeConnectList function, regardless of whether any conversation
handles within the list are active. To free the handle, an
application can call DdeDisconnectList. All members of the default
CONVCONTEXT structure are set to zero except cb, specifying the size
of the structure, and iCodePage, specifying CP_WINANSI (the default
code page) or CP_WINUNICODE, depending on whether the ANSI or Unicode
version of the DdeInitialize function was called by the client
application.


%index
DdeCreateDataHandle
Creates a Dynamic Data Exchange (DDE) object and fills the object with data from the specified buffer. A DDE application uses this function during transactions that involve passing data to the partner application.
%group
Win32 user32
%prm
idInst, pSrc, cb, cbOff, hszItem, wFmt, afCmd
idInst : [int] Type: DWORD The application instance identifier obtained by a previous call to the DdeInitialize function.
pSrc : [var] Type: LPBYTE The data to be copied to the DDE object. If this parameter is NULL, no data is copied to the object.
cb : [int] Type: DWORD The amount of memory, in bytes, to copy from the buffer pointed to by pSrc. (include the terminating NULL, if the data is a string). If this parameter is zero, the pSrc parameter is ignored.
cbOff : [int] Type: DWORD An offset, in bytes, from the beginning of the buffer pointed to by the pSrc parameter. The data beginning at this offset is copied from the buffer to the DDE object.
hszItem : [intptr] Type: HSZ A handle to the string that specifies the data item corresponding to the DDE object. This handle must have been created by a previous call to the DdeCreateStringHandle function. If the data handle is to be used in an XTYP_EXECUTE transaction, this parameter must be 0L.
wFmt : [int] Type: UINT The standard clipboard format of the data.
afCmd : [int] Type: UINT The creation flags. This parameter can be HDATA_APPOWNED, which specifies that the server application calling the DdeCreateDataHandle function owns the data handle this function creates. This flag enables the application to share the data handle with other DDEML applications rather than creating a separate handle to pass to each application. If this flag is specified, the application must eventually free the shared memory object associated with the handle by using the DdeFreeDataHandle function. If this flag is not specified, the handle becomes invalid in the application that created the handle after the data handle is returned by the application's DDE callback function or is used as a parameter in another DDEML function.
%inst
Creates a Dynamic Data Exchange (DDE) object and fills the object
with data from the specified buffer. A DDE application uses this
function during transactions that involve passing data to the partner
application.

[戻り値]
Type: HDDEDATA If the function succeeds, the return value is a data
handle. If the function fails, the return value is 0L. The
DdeGetLastError function can be used to get the error code, which can
be one of the following values:

[備考]
Any unfilled locations in the DDE object are undefined. After a data
handle has been used as a parameter in another DDEML function or has
been returned by a DDE callback function, the handle can be used only
for read access to the DDE object identified by the handle.


%index
DdeCreateStringHandleW
Creates a handle that identifies the specified string. A Dynamic Data Exchange (DDE) client or server application can pass the string handle as a parameter to other Dynamic Data Exchange Management Library (DDEML) functions. (Unicode)
%group
Win32 user32
%prm
idInst, psz, iCodePage
idInst : [int] Type: DWORD The application instance identifier obtained by a previous call to the DdeInitialize function.
psz : [wstr] Type: LPTSTR The null-terminated string for which a handle is to be created. This string can be up to 255 characters. The reason for this limit is that DDEML string management functions are implemented using atoms.
iCodePage : [int] Type: int The code page to be used to render the string. This value should be either CP_WINANSI (the default code page) or CP_WINUNICODE, depending on whether the ANSI or Unicode version of DdeInitialize was called by the client application.
%inst
Creates a handle that identifies the specified string. A Dynamic Data
Exchange (DDE) client or server application can pass the string
handle as a parameter to other Dynamic Data Exchange Management
Library (DDEML) functions. (Unicode)

[戻り値]
Type: HSZ If the function succeeds, the return value is a string
handle. If the function fails, the return value is 0L. The
DdeGetLastError function can be used to get the error code, which can
be one of the following values:

[備考]
The value of a string handle is not related to the case of the string
it identifies. When an application either creates a string handle or
receives one in the callback function and then uses the
DdeKeepStringHandle function to keep it, the application must free
that string handle when it is no longer needed. An instance-specific
string handle cannot be mapped from string handle to string and back
to string handle. This is shown in the following example, in which
the DdeQueryString function creates a string from a string handle and
DdeCreateStringHandle creates a string handle from that string, but
the two handles are not the same:
This doc was truncated.


%index
DdeEnableCallback
Enables or disables transactions for a specific conversation or for all conversations currently established by the calling application.
%group
Win32 user32
%prm
idInst, hConv, wCmd
idInst : [int] Type: DWORD The application-instance identifier obtained by a previous call to the DdeInitialize function.
hConv : [intptr] Type: HCONV A handle to the conversation to enable or disable. If this parameter is NULL, the function affects all conversations.
wCmd : [int] Type: UINT
%inst
Enables or disables transactions for a specific conversation or for
all conversations currently established by the calling application.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. If the wCmd parameter
is EC_QUERYWAITING, and the application transaction queue contains
one or more unprocessed transactions that are not being processed,
the return value is TRUE; otherwise, it is FALSE. The DdeGetLastError
function can be used to get the error code, which can be one of the
following values:

[備考]
An application can disable transactions for a specific conversation
by returning the CBR_BLOCK return code from its Dynamic Data Exchange
(DDE) callback function. When you reenable the conversation by using
the DdeEnableCallback function, the operating system generates the
same transaction that was in process when the conversation was
disabled. Using the EC_QUERYWAITING flag does not change the enable
state of the conversation and does not cause transactions to be
issued within the context of the call to DdeEnableCallback. If
DdeEnableCallback is called with EC_QUERYWAITING and the function
returns a nonzero, an application should try to quickly allow message
processing, return from its callback, or enable callbacks. Such a
result does not guarantee that subsequent callbacks will be made.
Calling DdeEnableCallback with EC_QUERYWAITING lets an application
with blocked callbacks determine whether there are any transactions
pending on the blocked conversation. Of course, even if such a call
returns zero, an application should always process messages in a
timely manner.


%index
DdeFreeStringHandle
Frees a string handle in the calling application.
%group
Win32 user32
%prm
idInst, hsz
idInst : [int] Type: DWORD The application instance identifier obtained by a previous call to the DdeInitialize function.
hsz : [intptr] Type: HSZ A handle to the string handle to be freed. This handle must have been created by a previous call to the DdeCreateStringHandle function.
%inst
Frees a string handle in the calling application.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero.

[備考]
An application can free string handles it creates with
DdeCreateStringHandle but should not free those that the system
passed to the application's Dynamic Data Exchange (DDE) callback
function or those returned in the CONVINFO structure by the
DdeQueryConvInfo function.


%index
DdeGetData
Copies data from the specified Dynamic Data Exchange (DDE) object to the specified local buffer.
%group
Win32 user32
%prm
hData, pDst, cbMax, cbOff
hData : [intptr] Type: HDDEDATA A handle to the DDE object that contains the data to copy.
pDst : [var] Type: LPBYTE A pointer to the buffer that receives the data. If this parameter is NULL, the DdeGetData function returns the amount of data, in bytes, that would be copied to the buffer.
cbMax : [int] Type: DWORD The maximum amount of data, in bytes, to copy to the buffer pointed to by the pDst parameter. Typically, this parameter specifies the length of the buffer pointed to by pDst.
cbOff : [int] Type: DWORD An offset within the DDE object. Data is copied from the object beginning at this offset.
%inst
Copies data from the specified Dynamic Data Exchange (DDE) object to
the specified local buffer.

[戻り値]
Type: DWORD If the pDst parameter points to a buffer, the return
value is the size, in bytes, of the memory object associated with the
data handle or the size specified in the cbMax parameter, whichever
is lower. If the pDst parameter is NULL, the return value is the
size, in bytes, of the memory object associated with the data handle.
The DdeGetLastError function can be used to get the error code, which
can be one of the following values:


%index
DdeGetLastError
Retrieves the most recent error code set by the failure of a Dynamic Data Exchange Management Library (DDEML) function and resets the error code to DMLERR_NO_ERROR.
%group
Win32 user32
%prm
idInst
idInst : [int] Type: DWORD The application instance identifier obtained by a previous call to the DdeInitialize function.
%inst
Retrieves the most recent error code set by the failure of a Dynamic
Data Exchange Management Library (DDEML) function and resets the
error code to DMLERR_NO_ERROR.

[戻り値]
Type: UINT If the function succeeds, the return value is the last
error code, which can be one of the following values.
This doc was truncated.


%index
DdeImpersonateClient
Impersonates a Dynamic Data Exchange (DDE) client application in a DDE client conversation.
%group
Win32 user32
%prm
hConv
hConv : [intptr] Type: HCONV A handle to the DDE client conversation to be impersonated.
%inst
Impersonates a Dynamic Data Exchange (DDE) client application in a
DDE client conversation.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Impersonation is the ability of a process to take on the security
attributes of another process. When a client in a DDE conversation
requests information from a DDE server, the server impersonates the
client. When the server requests access to an object, the system
verifies the access against the client's security attributes. When
the impersonation is complete, the server normally calls the
RevertToSelf function. Security Considerations If the call to
DdeImpersonateClient fails for any reason, the client is not
impersonated and the client request is made in the security context
of the calling process. If the calling process is running as a highly
privileged account, such as LocalSystem, or as a member of an
administrative group, the user may be able to perform actions that
would otherwise be disallowed. Therefore it is important that you
always check the return value of the call, and if it fails to raise
an error, do not continue execution of the client request.


%index
DdeInitializeW
Registers an application with the Dynamic Data Exchange Management Library (DDEML). An application must call this function before calling any other Dynamic Data Exchange Management Library (DDEML) function. (Unicode)
%group
Win32 user32
%prm
pidInst, pfnCallback, afCmd, ulRes
pidInst : [var] Type: LPDWORD The application instance identifier. At initialization, this parameter should point to 0. If the function succeeds, this parameter points to the instance identifier for the application. This value should be passed as the idInst parameter in all other DDEML functions that require it. If an application uses multiple instances of the DDEML dynamic-link library (DLL), the application should provide a different callback function for each instance. If pidInst points to a nonzero value, reinitialization of the DDEML is implied. In this case, pidInst must point to a valid application-instance identifier.
pfnCallback : [int] Type: PFNCALLBACK A pointer to the application-defined DDE callback function. This function processes DDE transactions sent by the system. For more information, see the DdeCallback callback function.
afCmd : [int] Type: DWORD A set of APPCMD_, CBF_, and MF_ flags. The APPCMD_ flags provide special instructions to DdeInitialize. The CBF_ flags specify filters that prevent specific types of transactions from reaching the callback function. The MF_ flags specify the types of DDE activity that a DDE monitoring application monitors. Using these flags enhances the performance of a DDE application by eliminating unnecessary calls to the callback function.
ulRes : [int] Type: DWORD Reserved; must be set to zero.
%inst
Registers an application with the Dynamic Data Exchange Management
Library (DDEML). An application must call this function before
calling any other Dynamic Data Exchange Management Library (DDEML)
function. (Unicode)

[戻り値]
Type: UINT If the function succeeds, the return value is
DMLERR_NO_ERROR. If the function fails, the return value is one of
the following values:

[備考]
An application that uses multiple instances of the DDEML must not
pass DDEML objects between instances. A DDE monitoring application
should not attempt to perform DDE operations (establish
conversations, issue transactions, and so on) within the context of
the same application instance. A synchronous transaction fails with a
DMLERR_REENTRANCY error if any instance of the same task has a
synchronous transaction already in progress. The
CBF_FAIL_ALLSVRXACTIONS flag causes the DDEML to filter all server
transactions and can be changed by a subsequent call to
DdeInitialize. The APPCMD_CLIENTONLY flag prevents the DDEML from
creating key resources for the server and cannot be changed by a
subsequent call to DdeInitialize. There is an ANSI version and a
Unicode version of DdeInitialize. The version called determines the
type of the window procedures used to control DDE conversations (ANSI
or Unicode), and the default value for the iCodePage member of the
CONVCONTEXT structure (CP_WINANSI or CP_WINUNICODE).
> [!NOTE] > The ddeml.h header defines DdeInitialize as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
DdeKeepStringHandle
Increments the usage count associated with the specified handle.
%group
Win32 user32
%prm
idInst, hsz
idInst : [int] Type: DWORD The application instance identifier obtained by a previous call to the DdeInitialize function.
hsz : [intptr] Type: HSZ A handle to the string handle to be saved.
%inst
Increments the usage count associated with the specified handle.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero.


%index
DdeNameService
Registers or unregisters the service names a Dynamic Data Exchange (DDE) server supports.
%group
Win32 user32
%prm
idInst, hsz1, hsz2, afCmd
idInst : [int] Type: DWORD The application instance identifier obtained by a previous call to the DdeInitialize function.
hsz1 : [intptr] Type: HSZ A handle to the string that specifies the service name the server is registering or unregistering. An application that is unregistering all of its service names should set this parameter to 0L.
hsz2 : [intptr] Type: HSZ Reserved; should be set to 0L.
afCmd : [int] Type: UINT
%inst
Registers or unregisters the service names a Dynamic Data Exchange
(DDE) server supports.

[戻り値]
Type: HDDEDATA If the function succeeds, it returns a nonzero value.
That value is not a true HDDEDATA value, merely a Boolean indicator
of success. The function is typed HDDEDATA to allow for possible
future expansion of the function and a more sophisticated return
value. If the function fails, the return value is 0L. The
DdeGetLastError function can be used to get the error code, which can
be one of the following values:

[備考]
The service name identified by the hsz1 parameter should be a base
name (that is, the name should contain no instance-specific
information). The system generates an instance-specific name and
sends it along with the base name during the XTYP_REGISTER and
XTYP_UNREGISTER transactions. The receiving applications can then
connect to the specific application instance.


%index
DdePostAdvise
Causes the system to send an XTYP_ADVREQ transaction to the calling (server) application's Dynamic Data Exchange (DDE) callback function for each client with an active advise loop on the specified topic and item.
%group
Win32 user32
%prm
idInst, hszTopic, hszItem
idInst : [int] Type: DWORD The application instance identifier obtained by a previous call to the DdeInitialize function.
hszTopic : [intptr] Type: HSZ A handle to a string that specifies the topic name. To send notifications for all topics with active advise loops, an application can set this parameter to 0L.
hszItem : [intptr] Type: HSZ A handle to a string that specifies the item name. To send notifications for all items with active advise loops, an application can set this parameter to 0L.
%inst
Causes the system to send an XTYP_ADVREQ transaction to the calling
(server) application's Dynamic Data Exchange (DDE) callback function
for each client with an active advise loop on the specified topic and
item.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. The DdeGetLastError
function can be used to get the error code, which can be one of the
following values:

[備考]
A server that has nonenumerable topics or items should set the
hszTopic and hszItem parameters to NULL so that the system generates
transactions for all active advise loops. The server's DDE callback
function returns NULL for any advise loops that must not be updated.
If a server calls DdePostAdvise with a topic, item, and format name
set that includes the set currently being handled in an XTYP_ADVREQ
callback, a stack overflow can result.


%index
DdeQueryConvInfo
Retrieves information about a Dynamic Data Exchange (DDE) transaction and about the conversation in which the transaction takes place.
%group
Win32 user32
%prm
hConv, idTransaction, pConvInfo
hConv : [intptr] Type: HCONV A handle to the conversation.
idTransaction : [int] Type: DWORD The transaction. For asynchronous transactions, this parameter should be a transaction identifier returned by the DdeClientTransaction function. For synchronous transactions, this parameter should be QID_SYNC.
pConvInfo : [var] Type: PCONVINFO A pointer to the CONVINFO structure that receives information about the transaction and conversation. The cb member of the CONVINFO structure must specify the length of the buffer allocated for the structure.
%inst
Retrieves information about a Dynamic Data Exchange (DDE) transaction
and about the conversation in which the transaction takes place.

[戻り値]
Type: UINT If the function succeeds, the return value is the number
of bytes copied into the CONVINFO structure. If the function fails,
the return value is FALSE. The DdeGetLastError function can be used
to get the error code, which can be one of the following values:

[備考]
An application should not free a string handle referenced by the
CONVINFO structure. If an application must use one of these string
handles, it should call the DdeKeepStringHandle function to create a
copy of the handle. If the idTransaction parameter is set to
QID_SYNC, the hUser member of the CONVINFO structure is associated
with the conversation and can be used to hold data associated with
the conversation. If idTransaction is the identifier of an
asynchronous transaction, the hUser member is associated only with
the current transaction and is valid only for the duration of the
transaction.


%index
DdeQueryNextServer
Retrieves the next conversation handle in the specified conversation list.
%group
Win32 user32
%prm
hConvList, hConvPrev
hConvList : [intptr] Type: HCONVLIST A handle to the conversation list. This handle must have been created by a previous call to the DdeConnectList function.
hConvPrev : [intptr] Type: HCONV A handle to the conversation handle previously returned by this function. If this parameter is 0L, the function returns the first conversation handle in the list.
%inst
Retrieves the next conversation handle in the specified conversation
list.

[戻り値]
Type: HCONV If the list contains any more conversation handles, the
return value is the next conversation handle in the list; otherwise,
it is 0L.


%index
DdeQueryStringW
Copies text associated with a string handle into a buffer. (Unicode)
%group
Win32 user32
%prm
idInst, hsz, psz, cchMax, iCodePage
idInst : [int] Type: DWORD The application instance identifier obtained by a previous call to the DdeInitialize function.
hsz : [intptr] Type: HSZ A handle to the string to copy. This handle must have been created by a previous call to the DdeCreateStringHandle function.
psz : [wstr] Type: LPTSTR A pointer to a buffer that receives the string. To obtain the length of the string, this parameter should be set to NULL.
cchMax : [int] Type: DWORD The length, in characters, of the buffer pointed to by the psz parameter. For the ANSI version of the function, this is the number of bytes; for the Unicode version, this is the number of characters. If the string is longer than ( cchMax? 1), it will be truncated. If the psz parameter is set to NULL, this parameter is ignored.
iCodePage : [int] Type: int The code page used to render the string. This value should be either CP_WINANSI or CP_WINUNICODE.
%inst
Copies text associated with a string handle into a buffer. (Unicode)

[戻り値]
Type: DWORD If the psz parameter specified a valid pointer, the
return value is the length, in characters, of the returned text (not
including the terminating null character). If the psz parameter
specified a NULL pointer, the return value is the length of the text
associated with the hsz parameter (not including the terminating null
character). If an error occurs, the return value is 0L.

[備考]
The string returned in the buffer is always null-terminated. If the
string is longer than ( cchMax? 1), only the first ( cchMax? 1)
characters of the string are copied. If the psz parameter is NULL,
the DdeQueryString function obtains the length, in bytes, of the
string associated with the string handle. The length does not include
the terminating null character.
> [!NOTE] > The ddeml.h header defines DdeQueryString as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
DdeReconnect
Enables a client Dynamic Data Exchange Management Library (DDEML) application to attempt to reestablish a conversation with a service that has terminated a conversation with the client.
%group
Win32 user32
%prm
hConv
hConv : [intptr] Type: HCONV A handle to the conversation to be reestablished. A client must have obtained the conversation handle by a previous call to the DdeConnect function or from an XTYP_DISCONNECT transaction.
%inst
Enables a client Dynamic Data Exchange Management Library (DDEML)
application to attempt to reestablish a conversation with a service
that has terminated a conversation with the client.

[戻り値]
Type: HCONV If the function succeeds, the return value is the handle
to the reestablished conversation. If the function fails, the return
value is 0L. The DdeGetLastError function can be used to get the
error code, which can be one of the following values:


%index
DdeSetQualityOfService
Specifies the quality of service (QOS) a raw Dynamic Data Exchange (DDE) application desires for future DDE conversations it initiates.
%group
Win32 user32
%prm
hwndClient, pqosNew, pqosPrev
hwndClient : [intptr] Type: HWND A handle to the DDE client window that specifies the source of WM_DDE_INITIATE messages a client will send to start DDE conversations.
pqosNew : [var] Type: const SECURITY_QUALITY_OF_SERVICE* A pointer to a SECURITY_QUALITY_OF_SERVICE structure for the desired quality of service values.
pqosPrev : [var] Type: PSECURITY_QUALITY_OF_SERVICE A pointer to a SECURITY_QUALITY_OF_SERVICE structure that receives the previous quality of service values associated with the window identified by hwndClient. This parameter is optional. If an application has no interest in hwndClient's previous QOS values, it should set pqosPrev to NULL.
%inst
Specifies the quality of service (QOS) a raw Dynamic Data Exchange
(DDE) application desires for future DDE conversations it initiates.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
If a quality of service has not been specified for a client window,
hwndClient, prior to sending a WM_DDE_INITIATE with the wParam set to
hwndClient, the system uses the following default quality of service
values for the client window:
This doc was truncated.


%index
DdeSetUserHandle
Associates an application-defined value with a conversation handle or a transaction identifier. This is useful for simplifying the processing of asynchronous transactions. An application can use the DdeQueryConvInfo function to retrieve this value.
%group
Win32 user32
%prm
hConv, id, hUser
hConv : [intptr] Type: HCONV A handle to the conversation.
id : [int] Type: DWORD The transaction identifier to associate with the value specified by the hUser parameter. An application should set this parameter to QID_SYNC to associate hUser with the conversation identified by the hConv parameter.
hUser : [int] Type: DWORD_PTR The value to be associated with the conversation handle.
%inst
Associates an application-defined value with a conversation handle or
a transaction identifier. This is useful for simplifying the
processing of asynchronous transactions. An application can use the
DdeQueryConvInfo function to retrieve this value.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. The DdeGetLastError
function can be used to get the error code, which can be one of the
following values:


%index
DdeUnaccessData
Unaccesses a Dynamic Data Exchange (DDE) object. An application must call this function after it has finished accessing the object.
%group
Win32 user32
%prm
hData
hData : [intptr] Type: HDDEDATA A handle to the DDE object.
%inst
Unaccesses a Dynamic Data Exchange (DDE) object. An application must
call this function after it has finished accessing the object.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. The DdeGetLastError
function can be used to get the error code, which can be one of the
following values:


%index
DdeUninitialize
Frees all Dynamic Data Exchange Management Library (DDEML) resources associated with the calling application.
%group
Win32 user32
%prm
idInst
idInst : [int] Type: DWORD The application instance identifier obtained by a previous call to the DdeInitialize function.
%inst
Frees all Dynamic Data Exchange Management Library (DDEML) resources
associated with the calling application.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero.

[備考]
DdeUninitialize terminates any conversations currently open for the
application.


%index
DefFrameProcW
Provides default processing for any window messages that the window procedure of a multiple-document interface (MDI) frame window does not process. (Unicode)
%group
Win32 user32
%prm
hWnd, hWndMDIClient, uMsg, wParam, lParam
hWnd : [intptr] Type: HWND A handle to the MDI frame window.
hWndMDIClient : [intptr] Type: HWND A handle to the MDI client window.
uMsg : [int] Type: UINT The message to be processed.
wParam : [intptr] Type: WPARAM Additional message-specific information.
lParam : [intptr] Type: LPARAM Additional message-specific information.
%inst
Provides default processing for any window messages that the window
procedure of a multiple-document interface (MDI) frame window does
not process. (Unicode)

[戻り値]
Type: LRESULT The return value specifies the result of the message
processing and depends on the message. If the hWndMDIClient parameter
is NULL, the return value is the same as for the DefWindowProc
function.

[備考]
When an application's window procedure does not handle a message, it
typically passes the message to the DefWindowProc function to process
the message. MDI applications use the DefFrameProc and
DefMDIChildProc functions instead of DefWindowProc to provide default
message processing. All messages that an application would usually
pass to DefWindowProc (such as nonclient messages and the WM_SETTEXT
message) should be passed to DefFrameProc instead. The DefFrameProc
function also handles the following messages.
This doc was truncated.


%index
DefMDIChildProcW
Provides default processing for any window message that the window procedure of a multiple-document interface (MDI) child window does not process. (Unicode)
%group
Win32 user32
%prm
hWnd, uMsg, wParam, lParam
hWnd : [intptr] Type: HWND A handle to the MDI child window.
uMsg : [int] Type: UINT The message to be processed.
wParam : [intptr] Type: WPARAM Additional message-specific information.
lParam : [intptr] Type: LPARAM Additional message-specific information.
%inst
Provides default processing for any window message that the window
procedure of a multiple-document interface (MDI) child window does
not process. (Unicode)

[戻り値]
Type: LRESULT The return value specifies the result of the message
processing and depends on the message.

[備考]
The DefMDIChildProc function assumes that the parent window of the
MDI child window identified by the hWnd parameter was created with
the MDICLIENT class. When an application's window procedure does not
handle a message, it typically passes the message to the
DefWindowProc function to process the message. MDI applications use
the DefFrameProc and DefMDIChildProc functions instead of
DefWindowProc to provide default message processing. All messages
that an application would usually pass to DefWindowProc (such as
nonclient messages and the WM_SETTEXT message) should be passed to
DefMDIChildProc instead. In addition, DefMDIChildProc also handles
the following messages.
This doc was truncated.


%index
DefRawInputProc
Verifies that the size of the RAWINPUTHEADER structure is correct.
%group
Win32 user32
%prm
paRawInput, nInput, cbSizeHeader
paRawInput : [var] Type: PRAWINPUT* Ignored.
nInput : [int] Type: INT Ignored.
cbSizeHeader : [int] Type: UINT The size, in bytes, of the RAWINPUTHEADER structure.
%inst
Verifies that the size of the RAWINPUTHEADER structure is correct.

[戻り値]
Type: LRESULT If successful, the function returns 0. Otherwise it
returns -1.


%index
DeferWindowPos
Updates the specified multiple-window ? position structure for the specified window.
%group
Win32 user32
%prm
hWinPosInfo, hWnd, hWndInsertAfter, x, y, cx, cy, uFlags
hWinPosInfo : [intptr] Type: HDWP A handle to a multiple-window ? position structure that contains size and position information for one or more windows. This structure is returned by BeginDeferWindowPos or by the most recent call to DeferWindowPos.
hWnd : [intptr] Type: HWND A handle to the window for which update information is stored in the structure. All windows in a multiple-window ? position structure must have the same parent.
hWndInsertAfter : [intptr] Type: HWND
x : [int] Type: int The x-coordinate of the window's upper-left corner.
y : [int] Type: int The y-coordinate of the window's upper-left corner.
cx : [int] Type: int The window's new width, in pixels.
cy : [int] Type: int The window's new height, in pixels.
uFlags : [int] Type: UINT
%inst
Updates the specified multiple-window ? position structure for the
specified window.

[戻り値]
Type: HDWP The return value identifies the updated multiple-window ?
position structure. The handle returned by this function may differ
from the handle passed to the function. The new handle that this
function returns should be passed during the next call to the
DeferWindowPos or EndDeferWindowPos function. If insufficient system
resources are available for the function to succeed, the return value
is NULL. To get extended error information, call GetLastError.

[備考]
If a call to DeferWindowPos fails, the application should abandon the
window-positioning operation and not call EndDeferWindowPos. If
SWP_NOZORDER is not specified, the system places the window
identified by the hWnd parameter in the position following the window
identified by the hWndInsertAfter parameter. If hWndInsertAfter is
NULL or HWND_TOP, the system places the hWnd window at the top of the
Z order. If hWndInsertAfter is set to HWND_BOTTOM, the system places
the hWnd window at the bottom of the Z order. All coordinates for
child windows are relative to the upper-left corner of the parent
window's client area. A window can be made a topmost window either by
setting hWndInsertAfter to the HWND_TOPMOST flag and ensuring that
the SWP_NOZORDER flag is not set, or by setting the window's position
in the Z order so that it is above any existing topmost windows. When
a non-topmost window is made topmost, its owned windows are also made
topmost. Its owners, however, are not changed. If neither the
SWP_NOACTIVATE nor SWP_NOZORDER flag is specified (that is, when the
application requests that a window be simultaneously activated and
its position in the Z order changed), the value specified in
hWndInsertAfter is used only in the following circumstances:
This doc was truncated.


%index
DeleteMenu
Deletes an item from the specified menu. If the menu item opens a menu or submenu, this function destroys the handle to the menu or submenu and frees the memory used by the menu or submenu.
%group
Win32 user32
%prm
hMenu, uPosition, uFlags
hMenu : [intptr] Type: HMENU A handle to the menu to be changed.
uPosition : [int] Type: UINT The menu item to be deleted, as determined by the uFlags parameter.
uFlags : [int] Type: UINT
%inst
Deletes an item from the specified menu. If the menu item opens a
menu or submenu, this function destroys the handle to the menu or
submenu and frees the memory used by the menu or submenu.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The application must call the DrawMenuBar function whenever a menu
changes, whether the menu is in a displayed window.


%index
DeregisterShellHookWindow
Unregisters a specified Shell window that is registered to receive Shell hook messages.
%group
Win32 user32
%prm
hwnd
hwnd : [intptr] Type: HWND A handle to the window to be unregistered. The window was registered with a call to the RegisterShellHookWindow function.
%inst
Unregisters a specified Shell window that is registered to receive
Shell hook messages.

[戻り値]
Type: BOOL TRUE if the function succeeds; FALSE if the function
fails.

[備考]
This function was not included in the SDK headers and libraries until
Windows XP with Service Pack 1 (SP1) and Windows Server 2003. If you
do not have a header file and import library for this function, you
can call the function using LoadLibrary and GetProcAddress.


%index
DestroyCaret
Destroys the caret's current shape, frees the caret from the window, and removes the caret from the screen.
%group
Win32 user32
%prm

%inst
Destroys the caret's current shape, frees the caret from the window,
and removes the caret from the screen.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
DestroyCaret destroys the caret only if a window in the current task
owns the caret. If a window that is not in the current task owns the
caret, DestroyCaret does nothing and returns FALSE. The system
provides one caret per queue. A window should create a caret only
when it has the keyboard focus or is active. The window should
destroy the caret before losing the keyboard focus or becoming
inactive. For an example, see Destroying a Caret


%index
DestroyWindow
指定したウィンドウを破棄する。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND 破棄するウィンドウへのハンドル。
%inst
指定したウィンドウを破棄する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報を得るには GetLastError
を呼び出す。

[備考]
スレッドは DestroyWindow を使って別スレッドが作成したウィンドウを破棄できない。破棄対象が
WS_EX_NOPARENTNOTIFY スタイルを持たない子ウィンドウの場合、親に WM_PARENTNOTIFY
メッセージが送られる。


%index
DialogBoxIndirectParamW
Creates a modal dialog box from a dialog box template in memory. (Unicode)
%group
Win32 user32
%prm
hInstance, hDialogTemplate, hWndParent, lpDialogFunc, dwInitParam
hInstance : [intptr] Type: HINSTANCE A handle to the module that creates the dialog box.
hDialogTemplate : [var] Type: LPCDLGTEMPLATE The template that DialogBoxIndirectParam uses to create the dialog box. A dialog box template consists of a header that describes the dialog box, followed by one or more additional blocks of data that describe each of the controls in the dialog box. The template can use either the standard format or the extended format.
hWndParent : [intptr] Type: HWND A handle to the window that owns the dialog box.
lpDialogFunc : [int] Type: DLGPROC A pointer to the dialog box procedure. For more information about the dialog box procedure, see DialogProc.
dwInitParam : [intptr] Type: LPARAM The value to pass to the dialog box in the lParam parameter of the WM_INITDIALOG message.
%inst
Creates a modal dialog box from a dialog box template in memory.
(Unicode)

[戻り値]
Type: INT_PTR If the function succeeds, the return value is the
nResult parameter specified in the call to the EndDialog function
that was used to terminate the dialog box. If the function fails
because the hWndParent parameter is invalid, the return value is
zero. The function returns zero in this case for compatibility with
previous versions of Windows. If the function fails for any other
reason, the return value is ?1. To get extended error information,
call GetLastError.

[備考]
The DialogBoxIndirectParam function uses the CreateWindowEx function
to create the dialog box. DialogBoxIndirectParam then sends a
WM_INITDIALOG message to the dialog box procedure. If the template
specifies the DS_SETFONT or DS_SHELLFONT style, the function also
sends a WM_SETFONT message to the dialog box procedure. The function
displays the dialog box (regardless of whether the template specifies
the WS_VISIBLE style), disables the owner window, and starts its own
message loop to retrieve and dispatch messages for the dialog box.
When the dialog box procedure calls the EndDialog function,
DialogBoxIndirectParam destroys the dialog box, ends the message
loop, enables the owner window (if previously enabled), and returns
the nResult parameter specified by the dialog box procedure when it
called EndDialog. In a standard dialog box template, the DLGTEMPLATE
structure and each of the DLGITEMTEMPLATE structures must be aligned
on DWORD boundaries. The creation data array that follows a
DLGITEMTEMPLATE structure must also be aligned on a DWORD boundary.
All of the other variable-length arrays in the template must be
aligned on WORD boundaries. In an extended dialog box template, the
DLGTEMPLATEEX header and each of the DLGITEMTEMPLATEEX control
definitions must be aligned on DWORD boundaries. The creation data
array, if any, that follows a DLGITEMTEMPLATEEX structure must also
be aligned on a DWORD boundary. All of the other variable-length
arrays in the template must be aligned on WORD boundaries. All
character strings in the dialog box template, such as titles for the
dialog box and buttons, must be Unicode strings.
> [!NOTE] > The winuser.h header defines DialogBoxIndirectParam as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
DialogBoxParamW
Creates a modal dialog box from a dialog box template resource. (Unicode)
%group
Win32 user32
%prm
hInstance, lpTemplateName, hWndParent, lpDialogFunc, dwInitParam
hInstance : [intptr] Type: HINSTANCE A handle to the module which contains the dialog box template. If this parameter is NULL, then the current executable is used.
lpTemplateName : [wstr] Type: LPCTSTR The dialog box template. This parameter is either the pointer to a null-terminated character string that specifies the name of the dialog box template or an integer value that specifies the resource identifier of the dialog box template. If the parameter specifies a resource identifier, its high-order word must be zero and its low-order word must contain the identifier. You can use the MAKEINTRESOURCE macro to create this value.
hWndParent : [intptr] Type: HWND A handle to the window that owns the dialog box.
lpDialogFunc : [int] Type: DLGPROC A pointer to the dialog box procedure. For more information about the dialog box procedure, see DialogProc.
dwInitParam : [intptr] Type: LPARAM The value to pass to the dialog box in the lParam parameter of the WM_INITDIALOG message.
%inst
Creates a modal dialog box from a dialog box template resource.
(Unicode)

[戻り値]
Type: INT_PTR If the function succeeds, the return value is the value
of the nResult parameter specified in the call to the EndDialog
function used to terminate the dialog box. If the function fails
because the hWndParent parameter is invalid, the return value is
zero. The function returns zero in this case for compatibility with
previous versions of Windows. If the function fails for any other
reason, the return value is ?1. To get extended error information,
call GetLastError.

[備考]
The DialogBoxParam function uses the CreateWindowEx function to
create the dialog box. DialogBoxParam then sends a WM_INITDIALOG
message (and a WM_SETFONT message if the template specifies the
DS_SETFONT or DS_SHELLFONT style) to the dialog box procedure. The
function displays the dialog box (regardless of whether the template
specifies the WS_VISIBLE style), disables the owner window, and
starts its own message loop to retrieve and dispatch messages for the
dialog box. When the dialog box procedure calls the EndDialog
function, DialogBoxParam destroys the dialog box, ends the message
loop, enables the owner window (if previously enabled), and returns
the nResult parameter specified by the dialog box procedure when it
called EndDialog.
> [!NOTE] > The winuser.h header defines DialogBoxParam as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
DisableProcessWindowsGhosting
Disables the window ghosting feature for the calling GUI process. Window ghosting is a Windows Manager feature that lets the user minimize, move, or close the main window of an application that is not responding.
%group
Win32 user32
%prm

%inst
Disables the window ghosting feature for the calling GUI process.
Window ghosting is a Windows Manager feature that lets the user
minimize, move, or close the main window of an application that is
not responding.

[備考]
After calling DisableProcessWindowsGhosting, the ghosting feature is
disabled for the duration of the process.


%index
DispatchMessageW
メッセージをウィンドウプロシージャにディスパッチする。通常は GetMessage で取得したメッセージのディスパッチに使用する。(DispatchMessageW)
%group
Win32 user32
%prm
lpMsg
lpMsg : [var] 型: const MSG* メッセージを格納した構造体へのポインタ。
%inst
メッセージをウィンドウプロシージャにディスパッチする。通常は GetMessage
で取得したメッセージのディスパッチに使用する。(DispatchMessageW)

[戻り値]
型: LRESULT 戻り値はウィンドウプロシージャが返した値を示す。意味はディスパッチされたメッセージによるが、一般には無視される。

[備考]
MSG 構造体には有効なメッセージ値が入っている必要がある。lpmsg が WM_TIMER メッセージを指し、lParam が NULL
でない場合、lParam
はウィンドウプロシージャの代わりに呼び出される関数を指す。ダイアログボックスへの入力メッセージの取得とディスパッチはアプリケーションの責任であり、多くの場合メインメッセージループを使う。キーボードでのコントロール操作を許可するには
IsDialogMessage を呼ぶ必要がある。


%index
DisplayConfigGetDeviceInfo
The DisplayConfigGetDeviceInfo function retrieves display configuration information about the device.
%group
Win32 user32
%prm
requestPacket
requestPacket : [var] A pointer to a DISPLAYCONFIG_DEVICE_INFO_HEADER structure. This structure contains information about the request, which includes the packet type in the type member. The type and size of additional data that DisplayConfigGetDeviceInfo returns after the header structure depend on the packet type.
%inst
The DisplayConfigGetDeviceInfo function retrieves display
configuration information about the device.

[戻り値]
The function returns one of the following return codes.
This doc was truncated.

[備考]
Use the DisplayConfigGetDeviceInfo function to obtain additional
information about a source or target for an adapter, such as the
display name, the preferred display mode, and source device name. The
caller can call DisplayConfigGetDeviceInfo to obtain more friendly
names to display in the user interface. The caller can obtain names
for the adapter, the source, and the target. The caller can also call
DisplayConfigGetDeviceInfo to obtain the best resolution of the
connected display device.


%index
DisplayConfigSetDeviceInfo
The DisplayConfigSetDeviceInfo function sets the properties of a target.
%group
Win32 user32
%prm
setPacket
setPacket : [var] A pointer to a DISPLAYCONFIG_DEVICE_INFO_HEADER structure that contains information to set for the device. The type and size of additional data that DisplayConfigSetDeviceInfo uses for the configuration comes after the header structure. This additional data depends on the packet type, as specified by the type member of DISPLAYCONFIG_DEVICE_INFO_HEADER. For example, if the caller wants to change the boot persistence, that caller allocates and fills a DISPLAYCONFIG_SET_TARGET_PERSISTENCE structure and passes a pointer to this structure in setPacket. Note that the first member of the DISPLAYCONFIG_SET_TARGET_PERSISTENCE structure is the DISPLAYCONFIG_DEVICE_INFO_HEADER.
%inst
The DisplayConfigSetDeviceInfo function sets the properties of a
target.

[戻り値]
The function returns one of the following return codes.
This doc was truncated.

[備考]
DisplayConfigSetDeviceInfo can currently only be used to start and
stop boot persisted force projection on an analog target. For more
information about boot persistence, see Forced Versus Connected
Targets. DisplayConfigSetDeviceInfo can only be used to set
DISPLAYCONFIG_DEVICE_INFO_SET_XXX type of information.
DisplayConfigSetDeviceInfo fails if the type member of
DISPLAYCONFIG_DEVICE_INFO_HEADER is set to one of the
DISPLAYCONFIG_DEVICE_INFO_GET_XXX values.


%index
DlgDirListW
Replaces the contents of a list box with the names of the subdirectories and files in a specified directory. You can filter the list of names by specifying a set of file attributes. The list can optionally include mapped drives. (Unicode)
%group
Win32 user32
%prm
hDlg, lpPathSpec, nIDListBox, nIDStaticPath, uFileType
hDlg : [intptr] Type: HWND A handle to the dialog box that contains the list box.
lpPathSpec : [wstr] Type: LPTSTR A pointer to a buffer containing a null-terminated string that specifies an absolute path, relative path, or filename. An absolute path can begin with a drive letter (for example, d:\) or a UNC name (for example, \\ machinename\ sharename). The function splits the string into a directory and a filename. The function searches the directory for names that match the filename. If the string does not specify a directory, the function searches the current directory. If the string includes a filename, the filename must contain at least one wildcard character (? or *). If the string does not include a filename, the function behaves as if you had specified the asterisk wildcard character (*) as the filename. All names in the specified directory that match the filename and have the attributes specified by the uFileType parameter are added to the list box.
nIDListBox : [int] Type: int The identifier of a list box in the hDlg dialog box. If this parameter is zero, DlgDirList does not try to fill a list box.
nIDStaticPath : [int] Type: int The identifier of a static control in the hDlg dialog box. DlgDirList sets the text of this control to display the current drive and directory. This parameter can be zero if you do not want to display the current drive and directory.
uFileType : [int] Type: UINT
%inst
Replaces the contents of a list box with the names of the
subdirectories and files in a specified directory. You can filter the
list of names by specifying a set of file attributes. The list can
optionally include mapped drives. (Unicode)

[戻り値]
Type: int If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. For example, if the
string specified by lpPathSpec is not a valid path, the function
fails. To get extended error information, call .

[備考]
If lpPathSpec specifies a directory, DlgDirListComboBox changes the
current directory to the specified directory before filling the list
box. The text of the static control identified by the nIDStaticPath
parameter is set to the name of the new current directory. DlgDirList
sends the LB_RESETCONTENT and LB_DIR messages to the list box. If
uFileType includes the DDL_DIRECTORY flag and lpPathSpec specifies a
first-level directory, such as C:\TEMP, the list box will always
include a ".." entry for the root directory. This is true even if the
root directory has hidden or system attributes and the DDL_HIDDEN and
DDL_SYSTEM flags are not specified. The root directory of an NTFS
volume has hidden and system attributes. The directory listing
displays long filenames, if any.


%index
DlgDirListComboBoxW
Replaces the contents of a combo box with the names of the subdirectories and files in a specified directory. You can filter the list of names by specifying a set of file attributes. The list of names can include mapped drive letters. (Unicode)
%group
Win32 user32
%prm
hDlg, lpPathSpec, nIDComboBox, nIDStaticPath, uFiletype
hDlg : [intptr] Type: HWND A handle to the dialog box that contains the combo box.
lpPathSpec : [wstr] Type: LPTSTR A pointer to a buffer containing a null-terminated string that specifies an absolute path, relative path, or file name. An absolute path can begin with a drive letter (for example, d:\) or a UNC name (for example, \\machinename\sharename).
nIDComboBox : [int] Type: int The identifier of a combo box in the hDlg dialog box. If this parameter is zero, DlgDirListComboBox does not try to fill a combo box.
nIDStaticPath : [int] Type: int The identifier of a static control in the hDlg dialog box. DlgDirListComboBox sets the text of this control to display the current drive and directory. This parameter can be zero if you do not want to display the current drive and directory.
uFiletype : [int] Type: UINT
%inst
Replaces the contents of a combo box with the names of the
subdirectories and files in a specified directory. You can filter the
list of names by specifying a set of file attributes. The list of
names can include mapped drive letters. (Unicode)

[戻り値]
Type: int If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. For example, if the
string specified by lpPathSpec is not a valid path, the function
fails. To get extended error information, call GetLastError.

[備考]
If lpPathSpec specifies a directory, DlgDirListComboBox changes the
current directory to the specified directory before filling the combo
box. The text of the static control identified by the nIDStaticPath
parameter is set to the name of the new current directory.
DlgDirListComboBox sends the CB_RESETCONTENT and CB_DIR messages to
the combo box. Microsoft Windows NT 4.0 and later: If uFiletype
includes the DDL_DIRECTORY flag and lpPathSpec specifies a
first-level directory, such as C:\TEMP, the combo box will always
include a ".." entry for the root directory. This is true even if the
root directory has hidden or system attributes and the DDL_HIDDEN and
DDL_SYSTEM flags are not specified. The root directory of an NTFS
volume has hidden and system attributes. Security Warning: Using this
function incorrectly might compromise the security of your program.
Incorrect use of this function includes having lpPathSpec indicate a
non-writable buffer, or a buffer without a null-termination. You
should review the Security Considerations: Microsoft Windows Controls
before continuing. Microsoft Windows NT 4.0 and later: The list
displays long file names, if any. Windows 95 or later: The list
displays short file names (the 8.3 form). You can use the
SHGetFileInfo or GetFullPathName functions to get the corresponding
long file name.
Windows 95 or later: DlgDirListComboBoxW is supported by the
Microsoft Layer for Unicode. To use this, you must add certain files
to your application, as outlined in Microsoft Layer for Unicode on
Windows Me/98/95 Systems.
> [!NOTE] > The winuser.h header defines DlgDirListComboBox as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
DlgDirSelectComboBoxExW
Retrieves the current selection from a combo box filled by using the DlgDirListComboBox function. The selection is interpreted as a drive letter, a file, or a directory name. (Unicode)
%group
Win32 user32
%prm
hwndDlg, lpString, cchOut, idComboBox
hwndDlg : [intptr] Type: HWND A handle to the dialog box that contains the combo box.
lpString : [wstr] Type: LPTSTR A pointer to the buffer that receives the selected path.
cchOut : [int] Type: int The length, in characters, of the buffer pointed to by the lpString parameter.
idComboBox : [int] Type: int The integer identifier of the combo box control in the dialog box.
%inst
Retrieves the current selection from a combo box filled by using the
DlgDirListComboBox function. The selection is interpreted as a drive
letter, a file, or a directory name. (Unicode)

[戻り値]
Type: BOOL If the current selection is a directory name, the return
value is nonzero.
If the current selection is not a directory name, the return value is
zero. To get extended error information, call GetLastError.

[備考]
If the current selection specifies a directory name or drive letter,
the DlgDirSelectComboBoxEx function removes the enclosing square
brackets (and hyphens for drive letters) so the name or letter is
ready to be inserted into a new path or file name. If there is no
selection, the contents of the buffer pointed to by lpString do not
change. The DlgDirSelectComboBoxEx function does not allow more than
one file name to be returned from a combo box. If the string is as
long or longer than the buffer, the buffer contains the truncated
string with a terminating null character. DlgDirSelectComboBoxEx
sends CB_GETCURSEL and CB_GETLBTEXT messages to the combo box. You
can use this function with all three types of combo boxes
(CBS_SIMPLE, CBS_DROPDOWN, and CBS_DROPDOWNLIST). Security Warning:
Improper use of this function can cause problems for your
application. For instance, the nCount parameter should be set
properly for both ANSI and Unicode versions. Failure to do so could
lead to a buffer overflow. You should review Security Considerations:
Microsoft Windows Controls before continuing. Windows 95 or later:
DlgDirSelectComboBoxExW is supported by the Microsoft Layer for
Unicode (MSLU). To use this, you must add certain files to your
application, as outlined in Microsoft Layer for Unicode on Windows
Me/98/95 Systems.
> [!NOTE] > The winuser.h header defines DlgDirSelectComboBoxEx as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
DlgDirSelectExW
Retrieves the current selection from a single-selection list box. It assumes that the list box has been filled by the DlgDirList function and that the selection is a drive letter, filename, or directory name. (Unicode)
%group
Win32 user32
%prm
hwndDlg, lpString, chCount, idListBox
hwndDlg : [intptr] Type: HWND A handle to the dialog box that contains the list box.
lpString : [wstr] Type: LPTSTR A pointer to a buffer that receives the selected path.
chCount : [int] Type: int The length, in TCHARs, of the buffer pointed to by lpString.
idListBox : [int] Type: int The identifier of a list box in the dialog box.
%inst
Retrieves the current selection from a single-selection list box. It
assumes that the list box has been filled by the DlgDirList function
and that the selection is a drive letter, filename, or directory
name. (Unicode)

[戻り値]
Type: BOOL If the current selection is a directory name, the return
value is nonzero. If the current selection is not a directory name,
the return value is zero. To get extended error information, call
GetLastError.

[備考]
The DlgDirSelectEx function copies the selection to the buffer
pointed to by the lpString parameter. If the current selection is a
directory name or drive letter, DlgDirSelectEx removes the enclosing
square brackets (and hyphens, for drive letters), so that the name or
letter is ready to be inserted into a new path. If there is no
selection, lpString does not change. If the string is as long or
longer than the buffer, the buffer will contain the truncated string
with a terminating null character. DlgDirSelectEx sends LB_GETCURSEL
and LB_GETTEXT messages to the list box. The function does not allow
more than one filename to be returned from a list box. The list box
must not be a multiple-selection list box. If it is, this function
does not return a zero value and lpString remains unchanged. Windows
95 or later: DlgDirSelectExW is supported by the Microsoft Layer for
Unicode. To use this, you must add certain files to your application,
as outlined in Microsoft Layer for Unicode on Windows Me/98/95
Systems.


%index
DragDetect
Captures the mouse and tracks its movement until the user releases the left button, presses the ESC key, or moves the mouse outside the drag rectangle around the specified point.
%group
Win32 user32
%prm
hwnd, pt
hwnd : [intptr] Type: HWND A handle to the window receiving mouse input.
pt : [int] Type: POINT Initial position of the mouse, in screen coordinates. The function determines the coordinates of the drag rectangle by using this point.
%inst
Captures the mouse and tracks its movement until the user releases
the left button, presses the ESC key, or moves the mouse outside the
drag rectangle around the specified point.

[戻り値]
Type: BOOL If the user moved the mouse outside of the drag rectangle
while holding down the left button, the return value is nonzero. If
the user did not move the mouse outside of the drag rectangle while
holding down the left button, the return value is zero.

[備考]
The system metrics for the drag rectangle are configurable, allowing
for larger or smaller drag rectangles.


%index
DragObject
(no summary)
%group
Win32 user32
%prm
hwndParent, hwndFrom, fmt, data, hcur
hwndParent : [intptr] 
hwndFrom : [intptr] 
fmt : [int] 
data : [int] 
hcur : [intptr] 
%inst



%index
DrawAnimatedRects
Animates the caption of a window to indicate the opening of an icon or the minimizing or maximizing of a window.
%group
Win32 user32
%prm
hwnd, idAni, lprcFrom, lprcTo
hwnd : [intptr] A handle to the window whose caption should be animated on the screen. The animation will be clipped to the parent of this window.
idAni : [int] The type of animation. This must be IDANI_CAPTION. With the IDANI_CAPTION animation type, the window caption will animate from the position specified by lprcFrom to the position specified by lprcTo. The effect is similar to minimizing or maximizing a window.
lprcFrom : [var] A pointer to a RECT structure specifying the location and size of the icon or minimized window. Coordinates are relative to the clipping window hwnd.
lprcTo : [var] A pointer to a RECT structure specifying the location and size of the restored window. Coordinates are relative to the clipping window hwnd.
%inst
Animates the caption of a window to indicate the opening of an icon
or the minimizing or maximizing of a window.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.


%index
DrawCaption
The DrawCaption function draws a window caption.
%group
Win32 user32
%prm
hwnd, hdc, lprect, flags
hwnd : [intptr] A handle to a window that supplies text and an icon for the window caption.
hdc : [intptr] A handle to a device context. The function draws the window caption into this device context.
lprect : [var] A pointer to a RECT structure that specifies the bounding rectangle for the window caption in logical coordinates.
flags : [int] 
%inst
The DrawCaption function draws a window caption.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.


%index
DrawEdge
The DrawEdge function draws one or more edges of rectangle.
%group
Win32 user32
%prm
hdc, qrc, edge, grfFlags
hdc : [intptr] A handle to the device context.
qrc : [var] A pointer to a RECT structure that contains the logical coordinates of the rectangle.
edge : [int] The type of inner and outer edges to draw. This parameter must be a combination of one inner-border flag and one outer-border flag. The inner-border flags are as follows.
grfFlags : [int] 
%inst
The DrawEdge function draws one or more edges of rectangle.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.


%index
DrawFocusRect
The DrawFocusRect function draws a rectangle in the style used to indicate that the rectangle has the focus.
%group
Win32 user32
%prm
hDC, lprc
hDC : [intptr] A handle to the device context.
lprc : [var] A pointer to a RECT structure that specifies the logical coordinates of the rectangle.
%inst
The DrawFocusRect function draws a rectangle in the style used to
indicate that the rectangle has the focus.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
DrawFocusRect works only in MM_TEXT mode. Because DrawFocusRect is an
XOR function, calling it a second time with the same rectangle
removes the rectangle from the screen. This function draws a
rectangle that cannot be scrolled. To scroll an area containing a
rectangle drawn by this function, call DrawFocusRect to remove the
rectangle from the screen, scroll the area, and then call
DrawFocusRect again to draw the rectangle in the new position.
Windows XP: The focus rectangle can now be thicker than 1 pixel, so
it is more visible for high-resolution, high-density displays and
accessibility needs. This is handled by the SPI_SETFOCUSBORDERWIDTH
and SPI_SETFOCUSBORDERHEIGHT in SystemParametersInfo.


%index
DrawFrameControl
The DrawFrameControl function draws a frame control of the specified type and style.
%group
Win32 user32
%prm
param0, param1, param2, param3
param0 : [intptr] 
param1 : [var] 
param2 : [int] 
param3 : [int] 
%inst
The DrawFrameControl function draws a frame control of the specified
type and style.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
If uType is either DFC_MENU or DFC_BUTTON and uState is not
DFCS_BUTTONPUSH, the frame control is a black-on-white mask (that is,
a black frame control on a white background). In such cases, the
application must pass a handle to a bitmap memory device control. The
application can then use the associated bitmap as the hbmMask
parameter to the MaskBlt function, or it can use the device context
as a parameter to the BitBlt function using ROPs such as SRCAND and
SRCINVERT. DPI Virtualization This API does not participate in DPI
virtualization. The input given is always in terms of physical
pixels, and is not related to the calling context.


%index
DrawIcon
Draws an icon or cursor into the specified device context.
%group
Win32 user32
%prm
hDC, X, Y, hIcon
hDC : [intptr] Type: HDC A handle to the device context into which the icon or cursor will be drawn.
X : [int] Type: int The logical x-coordinate of the upper-left corner of the icon.
Y : [int] Type: int The logical y-coordinate of the upper-left corner of the icon.
hIcon : [intptr] Type: HICON A handle to the icon to be drawn.
%inst
Draws an icon or cursor into the specified device context.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
DrawIcon places the icon's upper-left corner at the location
specified by the X and Y parameters. The location is subject to the
current mapping mode of the device context. DrawIcon draws the icon
or cursor using the width and height specified by the system metric
values for icons; for more information, see GetSystemMetrics.


%index
DrawIconEx
Draws an icon or cursor into the specified device context, performing the specified raster operations, and stretching or compressing the icon or cursor as specified.
%group
Win32 user32
%prm
hdc, xLeft, yTop, hIcon, cxWidth, cyWidth, istepIfAniCur, hbrFlickerFreeDraw, diFlags
hdc : [intptr] Type: HDC A handle to the device context into which the icon or cursor will be drawn.
xLeft : [int] Type: int The logical x-coordinate of the upper-left corner of the icon or cursor.
yTop : [int] Type: int The logical y-coordinate of the upper-left corner of the icon or cursor.
hIcon : [intptr] Type: HICON A handle to the icon or cursor to be drawn. This parameter can identify an animated cursor.
cxWidth : [int] Type: int The logical width of the icon or cursor. If this parameter is zero and the diFlags parameter is DI_DEFAULTSIZE, the function uses the SM_CXICON system metric value to set the width. If this parameter is zero and DI_DEFAULTSIZE is not used, the function uses the actual resource width.
cyWidth : [int] Type: int The logical height of the icon or cursor. If this parameter is zero and the diFlags parameter is DI_DEFAULTSIZE, the function uses the SM_CYICON system metric value to set the width. If this parameter is zero and DI_DEFAULTSIZE is not used, the function uses the actual resource height.
istepIfAniCur : [int] Type: UINT The index of the frame to draw, if hIcon identifies an animated cursor. This parameter is ignored if hIcon does not identify an animated cursor.
hbrFlickerFreeDraw : [intptr] Type: HBRUSH A handle to a brush that the system uses for flicker-free drawing. If hbrFlickerFreeDraw is a valid brush handle, the system creates an offscreen bitmap using the specified brush for the background color, draws the icon or cursor into the bitmap, and then copies the bitmap into the device context identified by hdc. If hbrFlickerFreeDraw is NULL, the system draws the icon or cursor directly into the device context.
diFlags : [int] Type: UINT
%inst
Draws an icon or cursor into the specified device context, performing
the specified raster operations, and stretching or compressing the
icon or cursor as specified.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The DrawIconEx function places the icon's upper-left corner at the
location specified by the xLeft and yTop parameters. The location is
subject to the current mapping mode of the device context. If only
one of the DI_IMAGE and DI_MASK flags is set, then the corresponding
bitmap is drawn with the SRCCOPY raster operation code. If both the
DI_IMAGE and DI_MASK flags are set: * If the icon or cursor is a
32-bit alpha-blended icon or cursor, then the image is drawn with
AC_SRC_OVER blend function and the mask is ignored. * For all other
icons or cursors, the mask is drawn with the SRCAND raster operation
code, and the image is drawn with the SRCINVERT raster operation code
To duplicate DrawIcon (hDC, X, Y, hIcon), call DrawIconEx as follows:
This doc was truncated.


%index
DrawMenuBar
Redraws the menu bar of the specified window. If the menu bar changes after the system has created the window, this function must be called to draw the changed menu bar.
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] Type: HWND A handle to the window whose menu bar is to be redrawn.
%inst
Redraws the menu bar of the specified window. If the menu bar changes
after the system has created the window, this function must be called
to draw the changed menu bar.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
DrawStateW
The DrawState function displays an image and applies a visual effect to indicate a state, such as a disabled or default state. (Unicode)
%group
Win32 user32
%prm
hdc, hbrFore, qfnCallBack, lData, wData, x, y, cx, cy, uFlags
hdc : [intptr] A handle to the device context to draw in.
hbrFore : [intptr] A handle to the brush used to draw the image, if the state specified by the fuFlags parameter is DSS_MONO. This parameter is ignored for other states.
qfnCallBack : [int] A pointer to an application-defined callback function used to render the image. This parameter is required if the image type in fuFlags is DST_COMPLEX. It is optional and can be NULL if the image type is DST_TEXT. For all other image types, this parameter is ignored. For more information about the callback function, see the DrawStateProc function.
lData : [intptr] Information about the image. The meaning of this parameter depends on the image type.
wData : [intptr] Information about the image. The meaning of this parameter depends on the image type. It is, however, zero extended for use with the DrawStateProc function.
x : [int] The horizontal location, in device units, at which to draw the image.
y : [int] The vertical location, in device units, at which to draw the image.
cx : [int] The width of the image, in device units. This parameter is required if the image type is DST_COMPLEX. Otherwise, it can be zero to calculate the width of the image.
cy : [int] The height of the image, in device units. This parameter is required if the image type is DST_COMPLEX. Otherwise, it can be zero to calculate the height of the image.
uFlags : [int] The image type and state. This parameter can be one of the following type values.
%inst
The DrawState function displays an image and applies a visual effect
to indicate a state, such as a disabled or default state. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
> [!NOTE] > The winuser.h header defines DrawState as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
DrawTextW
The DrawText function draws formatted text in the specified rectangle. It formats the text according to the specified method (expanding tabs, justifying characters, breaking lines, and so forth). (DrawTextW)
%group
Win32 user32
%prm
hdc, lpchText, cchText, lprc, format
hdc : [intptr] A handle to the device context.
lpchText : [wstr] A pointer to the string that specifies the text to be drawn. If the nCount parameter is -1, the string must be null-terminated. If uFormat includes DT_MODIFYSTRING, the function could add up to four additional characters to this string. The buffer containing the string should be large enough to accommodate these extra characters.
cchText : [int] The length, in characters, of the string. If nCount is -1, then the lpchText parameter is assumed to be a pointer to a null-terminated string and DrawText computes the character count automatically.
lprc : [var] A pointer to a RECT structure that contains the rectangle (in logical coordinates) in which the text is to be formatted.
format : [int] 
%inst
The DrawText function draws formatted text in the specified
rectangle. It formats the text according to the specified method
(expanding tabs, justifying characters, breaking lines, and so
forth). (DrawTextW)

[戻り値]
If the function succeeds, the return value is the height of the text
in logical units. If DT_VCENTER or DT_BOTTOM is specified, the return
value is the offset from lpRect->top to the bottom of the drawn text
If the function fails, the return value is zero.

[備考]
The DrawText function uses the device context's selected font, text
color, and background color to draw the text. Unless the DT_NOCLIP
format is used, DrawText clips the text so that it does not appear
outside the specified rectangle. Note that text with significant
overhang may be clipped, for example, an initial "W" in the text
string or text that is in italics. All formatting is assumed to have
multiple lines unless the DT_SINGLELINE format is specified. If the
selected font is too large for the specified rectangle, the DrawText
function does not attempt to substitute a smaller font. The text
alignment mode for the device context must include the TA_LEFT,
TA_TOP, and TA_NOUPDATECP flags.
> [!NOTE] > The winuser.h header defines DrawText as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
DrawTextExW
The DrawTextEx function draws formatted text in the specified rectangle. (Unicode)
%group
Win32 user32
%prm
hdc, lpchText, cchText, lprc, format, lpdtp
hdc : [intptr] A handle to the device context in which to draw.
lpchText : [wstr] A pointer to the string that contains the text to draw. If the cchText parameter is -1, the string must be null-terminated. If dwDTFormat includes DT_MODIFYSTRING, the function could add up to four additional characters to this string. The buffer containing the string should be large enough to accommodate these extra characters.
cchText : [int] The length of the string pointed to by lpchText. If cchText is -1, then the lpchText parameter is assumed to be a pointer to a null-terminated string and DrawTextEx computes the character count automatically.
lprc : [var] A pointer to a RECT structure that contains the rectangle, in logical coordinates, in which the text is to be formatted.
format : [int] 
lpdtp : [var] A pointer to a DRAWTEXTPARAMS structure that specifies additional formatting options. This parameter can be NULL.
%inst
The DrawTextEx function draws formatted text in the specified
rectangle. (Unicode)

[戻り値]
If the function succeeds, the return value is the text height in
logical units. If DT_VCENTER or DT_BOTTOM is specified, the return
value is the offset from lprc->top to the bottom of the drawn text If
the function fails, the return value is zero.

[備考]
The DrawTextEx function supports only fonts whose escapement and
orientation are both zero. The text alignment mode for the device
context must include the TA_LEFT, TA_TOP, and TA_NOUPDATECP flags.
> [!NOTE] > The winuser.h header defines DrawTextEx as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
EmptyClipboard
Empties the clipboard and frees handles to data in the clipboard. The function then assigns ownership of the clipboard to the window that currently has the clipboard open.
%group
Win32 user32
%prm

%inst
Empties the clipboard and frees handles to data in the clipboard. The
function then assigns ownership of the clipboard to the window that
currently has the clipboard open.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Before calling EmptyClipboard, an application must open the clipboard
by using the OpenClipboard function. If the application specifies a
NULL window handle when opening the clipboard, EmptyClipboard
succeeds but sets the clipboard owner to NULL. Note that this causes
SetClipboardData to fail.


%index
EnableMenuItem
Enables, disables, or grays the specified menu item.
%group
Win32 user32
%prm
hMenu, uIDEnableItem, uEnable
hMenu : [intptr] Type: HMENU A handle to the menu.
uIDEnableItem : [int] Type: UINT The menu item to be enabled, disabled, or grayed, as determined by the uEnable parameter. This parameter specifies an item in a menu bar, menu, or submenu.
uEnable : [int] Type: UINT
%inst
Enables, disables, or grays the specified menu item.

[戻り値]
Type: BOOL The return value specifies the previous state of the menu
item (it is either MF_DISABLED, MF_ENABLED, or MF_GRAYED). If the
menu item does not exist, the return value is -1.

[備考]
An application must use the MF_BYPOSITION flag to specify the correct
menu handle. If the menu handle to the menu bar is specified, the
top-level menu item (an item in the menu bar) is affected. To set the
state of an item in a drop-down menu or submenu by position, an
application must specify a handle to the drop-down menu or submenu.
When an application specifies the MF_BYCOMMAND flag, the system
checks all items that open submenus in the menu identified by the
specified menu handle. Therefore, unless duplicate menu items are
present, specifying the menu handle to the menu bar is sufficient.
The InsertMenu, InsertMenuItem, LoadMenuIndirect, ModifyMenu, and
SetMenuItemInfo functions can also set the state (enabled, disabled,
or grayed) of a menu item. When you change a window menu, the menu
bar is not immediately updated. To force the update, call
DrawMenuBar.


%index
EnableMouseInPointer
Enables the mouse to act as a pointer input device and send WM_POINTER messages.
%group
Win32 user32
%prm
fEnable
fEnable : [int] TRUE to turn on mouse input support in WM_POINTER.
%inst
Enables the mouse to act as a pointer input device and send
WM_POINTER messages.

[戻り値]
If the function succeeds, the return value is non-zero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
This function can be called only once in the context of a process
lifetime. Prior to the first call, Windows Store apps run with
mouse-in-pointer enabled, as do any desktop applications that consume
mshtml.dll. All other desktop applications run with mouse-in-pointer
disabled. On the first call in the process lifetime, the state is
changed as specified and the call succeeds. On subsequent calls, the
state will not change. If the current state is not equal to the
specified state, the call fails. Call IsMouseInPointerEnabled to
verify the mouse-in-pointer state.


%index
EnableNonClientDpiScaling
In high-DPI displays, enables automatic display scaling of the non-client area portions of the specified top-level window. Must be called during the initialization of that window.
%group
Win32 user32
%prm
hwnd
hwnd : [intptr] The window that should have automatic scaling enabled.
%inst
In high-DPI displays, enables automatic display scaling of the
non-client area portions of the specified top-level window. Must be
called during the initialization of that window.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Calling this function will enable non-client scaling for an
individual top-level window with DPI_AWARENESS_CONTEXT of
DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE. If instead you are not using
per-window awareness, and your entire process is running in
DPI_AWARENESS_PER_MONITOR_AWARE mode, calling this function will
enable non-client scaling in top-level windows in your process. If
neither of those are true, or if you call this method from any other
window, then it will fail and return a value of zero. Non-client
scaling for top-level windows is not enabled by default. You must
call this API to enable it for each individual top-level window for
which you wish to have the non-client area scale automatically. Once
you do, there is no way to disable it. Enabling non-client scaling
means that all the areas drawn by the system for the window will
automatically scale in response to DPI changes on the window. That
includes areas like the caption bar, the scrollbars, and the menu
bar. You want to call EnableNonClientDpiScaling when you want the
operating system to be responsible for rendering these areas
automatically at the correct size based on the DPI of the monitor.
Calling this function enables non-client scaling for top-level
windows only. Child windows are unaffected. This function must be
called from WM_NCCREATE during the initialization of a new window. An
example call might look like this:
This doc was truncated.


%index
EnableScrollBar
The EnableScrollBar function enables or disables one or both scroll bar arrows.
%group
Win32 user32
%prm
hWnd, wSBflags, wArrows
hWnd : [intptr] Type: HWND Handle to a window or a scroll bar control, depending on the value of the wSBflags parameter.
wSBflags : [int] Type: UINT
wArrows : [int] Type: UINT
%inst
The EnableScrollBar function enables or disables one or both scroll
bar arrows.

[戻り値]
Type: BOOL If the arrows are enabled or disabled as specified, the
return value is nonzero. If the arrows are already in the requested
state or an error occurs, the return value is zero. To get extended
error information, call GetLastError.


%index
EnableWindow
Enables or disables mouse and keyboard input to the specified window or control. When input is disabled, the window does not receive input such as mouse clicks and key presses. When input is enabled, the window receives all input.
%group
Win32 user32
%prm
hWnd, bEnable
hWnd : [intptr] Type: HWND A handle to the window to be enabled or disabled.
bEnable : [int] Type: BOOL Indicates whether to enable or disable the window. If this parameter is TRUE, the window is enabled. If the parameter is FALSE, the window is disabled.
%inst
Enables or disables mouse and keyboard input to the specified window
or control. When input is disabled, the window does not receive input
such as mouse clicks and key presses. When input is enabled, the
window receives all input.

[戻り値]
Type: BOOL If the window was previously disabled, the return value is
nonzero. If the window was not previously disabled, the return value
is zero.

[備考]
If the window is being disabled, the system sends a WM_CANCELMODE
message. If the enabled state of a window is changing, the system
sends a WM_ENABLE message after the WM_CANCELMODE message. (These
messages are sent before EnableWindow returns.) If a window is
already disabled, its child windows are implicitly disabled, although
they are not sent a WM_ENABLE message. A window must be enabled
before it can be activated. For example, if an application is
displaying a modeless dialog box and has disabled its main window,
the application must enable the main window before destroying the
dialog box. Otherwise, another window will receive the keyboard focus
and be activated. If a child window is disabled, it is ignored when
the system tries to determine which window should receive mouse
messages. By default, a window is enabled when it is created. To
create a window that is initially disabled, an application can
specify the WS_DISABLED style in the CreateWindow or CreateWindowEx
function. After a window has been created, an application can use
EnableWindow to enable or disable the window. An application can use
this function to enable or disable a control in a dialog box. A
disabled control cannot receive the keyboard focus, nor can a user
gain access to it.


%index
EndDeferWindowPos
Simultaneously updates the position and size of one or more windows in a single screen-refreshing cycle.
%group
Win32 user32
%prm
hWinPosInfo
hWinPosInfo : [intptr] Type: HDWP A handle to a multiple-window ? position structure that contains size and position information for one or more windows. This internal structure is returned by the BeginDeferWindowPos function or by the most recent call to the DeferWindowPos function.
%inst
Simultaneously updates the position and size of one or more windows
in a single screen-refreshing cycle.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The EndDeferWindowPos function sends the WM_WINDOWPOSCHANGING and
WM_WINDOWPOSCHANGED messages to each window identified in the
internal structure.


%index
EndDialog
Destroys a modal dialog box, causing the system to end any processing for the dialog box.
%group
Win32 user32
%prm
hDlg, nResult
hDlg : [intptr] Type: HWND A handle to the dialog box to be destroyed.
nResult : [int] Type: INT_PTR The value to be returned to the application from the function that created the dialog box.
%inst
Destroys a modal dialog box, causing the system to end any processing
for the dialog box.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Dialog boxes created by the DialogBox, DialogBoxParam,
DialogBoxIndirect, and DialogBoxIndirectParam functions must be
destroyed using the EndDialog function. An application calls
EndDialog from within the dialog box procedure; the function must not
be used for any other purpose. A dialog box procedure can call
EndDialog at any time, even during the processing of the
WM_INITDIALOG message. If your application calls the function while
WM_INITDIALOG is being processed, the dialog box is destroyed before
it is shown and before the input focus is set. EndDialog does not
destroy the dialog box immediately. Instead, it sets a flag and
allows the dialog box procedure to return control to the system. The
system checks the flag before attempting to retrieve the next message
from the application queue. If the flag is set, the system ends the
message loop, destroys the dialog box, and uses the value in nResult
as the return value from the function that created the dialog box.


%index
EndMenu
Ends the calling thread's active menu.
%group
Win32 user32
%prm

%inst
Ends the calling thread's active menu.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
If a platform does not support EndMenu, send the owner of the active
menu a WM_CANCELMODE message.


%index
EndPaint
The EndPaint function marks the end of painting in the specified window. This function is required for each call to the BeginPaint function, but only after painting is complete.
%group
Win32 user32
%prm
hWnd, lpPaint
hWnd : [intptr] Handle to the window that has been repainted.
lpPaint : [var] Pointer to a PAINTSTRUCT structure that contains the painting information retrieved by BeginPaint.
%inst
The EndPaint function marks the end of painting in the specified
window. This function is required for each call to the BeginPaint
function, but only after painting is complete.

[戻り値]
The return value is always nonzero.

[備考]
If the caret was hidden by BeginPaint, EndPaint restores the caret to
the screen. EndPaint releases the display device context that
BeginPaint retrieved.


%index
EnumChildWindows
Enumerates the child windows that belong to the specified parent window by passing the handle to each child window, in turn, to an application-defined callback function.
%group
Win32 user32
%prm
hWndParent, lpEnumFunc, lParam
hWndParent : [intptr] Type: HWND A handle to the parent window whose child windows are to be enumerated. If this parameter is NULL, this function is equivalent to EnumWindows.
lpEnumFunc : [int] Type: WNDENUMPROC A pointer to an application-defined callback function. For more information, see EnumChildProc.
lParam : [intptr] Type: LPARAM An application-defined value to be passed to the callback function.
%inst
Enumerates the child windows that belong to the specified parent
window by passing the handle to each child window, in turn, to an
application-defined callback function.

[戻り値]
Type: BOOL The return value is not used.

[備考]
If a child window has created child windows of its own,
EnumChildWindows enumerates those windows as well. A child window
that is moved or repositioned in the Z order during the enumeration
process will be properly enumerated. The function does not enumerate
a child window that is destroyed before being enumerated or that is
created during the enumeration process.


%index
EnumClipboardFormats
Enumerates the data formats currently available on the clipboard.
%group
Win32 user32
%prm
format
format : [int] Type: UINT A clipboard format that is known to be available. To start an enumeration of clipboard formats, set format to zero. When format is zero, the function retrieves the first available clipboard format. For subsequent calls during an enumeration, set format to the result of the previous EnumClipboardFormats call.
%inst
Enumerates the data formats currently available on the clipboard.

[戻り値]
Type: UINT If the function succeeds, the return value is the
clipboard format that follows the specified format, namely the next
available clipboard format. If the function fails, the return value
is zero. To get extended error information, call GetLastError. If the
clipboard is not open, the function fails. If there are no more
clipboard formats to enumerate, the return value is zero. In this
case, the GetLastError function returns the value ERROR_SUCCESS. This
lets you distinguish between function failure and the end of
enumeration.

[備考]
You must open the clipboard before enumerating its formats. Use the
OpenClipboard function to open the clipboard. The
EnumClipboardFormats function fails if the clipboard is not open. The
EnumClipboardFormats function enumerates formats in the order that
they were placed on the clipboard. If you are copying information to
the clipboard, add clipboard objects in order from the most
descriptive clipboard format to the least descriptive clipboard
format. If you are pasting information from the clipboard, retrieve
the first clipboard format that you can handle. That will be the most
descriptive clipboard format that you can handle. The system provides
automatic type conversions for certain clipboard formats. In the case
of such a format, this function enumerates the specified format, then
enumerates the formats to which it can be converted. For more
information, see Standard Clipboard Formats and Synthesized Clipboard
Formats.


%index
EnumDesktopWindows
Enumerates all top-level windows associated with the specified desktop. It passes the handle to each window, in turn, to an application-defined callback function.
%group
Win32 user32
%prm
hDesktop, lpfn, lParam
hDesktop : [intptr] A handle to the desktop whose top-level windows are to be enumerated. This handle is returned by the CreateDesktop, GetThreadDesktop, OpenDesktop, or OpenInputDesktop function, and must have the DESKTOP_READOBJECTS access right. For more information, see Desktop Security and Access Rights. If this parameter is NULL, the current desktop is used.
lpfn : [int] A pointer to an application-defined EnumWindowsProc callback function.
lParam : [intptr] An application-defined value to be passed to the callback function.
%inst
Enumerates all top-level windows associated with the specified
desktop. It passes the handle to each window, in turn, to an
application-defined callback function.

[戻り値]
If the function fails or is unable to perform the enumeration, the
return value is zero. To get extended error information, call
GetLastError. You must ensure that the callback function sets
SetLastError if it fails. Windows Server 2003 and Windows XP/2000: If
there are no windows on the desktop, GetLastError returns
ERROR_INVALID_HANDLE.

[備考]
The EnumDesktopWindows function repeatedly invokes the lpfn callback
function until the last top-level window is enumerated or the
callback function returns FALSE.


%index
EnumDesktopsW
Enumerates all desktops associated with the specified window station of the calling process. The function passes the name of each desktop, in turn, to an application-defined callback function. (Unicode)
%group
Win32 user32
%prm
hwinsta, lpEnumFunc, lParam
hwinsta : [intptr] A handle to the window station whose desktops are to be enumerated. This handle is returned by the CreateWindowStation, GetProcessWindowStation, or OpenWindowStation function, and must have the WINSTA_ENUMDESKTOPS access right. For more information, see Window Station Security and Access Rights. If this parameter is NULL, the current window station is used.
lpEnumFunc : [int] A pointer to an application-defined EnumDesktopProc callback function.
lParam : [intptr] An application-defined value to be passed to the callback function.
%inst
Enumerates all desktops associated with the specified window station
of the calling process. The function passes the name of each desktop,
in turn, to an application-defined callback function. (Unicode)

[戻り値]
If the function succeeds, it returns the nonzero value returned by
the callback function that was pointed to by lpEnumFunc. If the
function is unable to perform the enumeration, the return value is
zero. Call GetLastError to get extended error information. If the
callback function fails, the return value is zero. The callback
function can call SetLastError to set an error code for the caller to
retrieve by calling GetLastError.

[備考]
The EnumDesktops function enumerates only those desktops for which
the calling process has the DESKTOP_ENUMERATE access right. For more
information, see Desktop Security and Access Rights. The EnumDesktops
function repeatedly invokes the lpEnumFunc callback function until
the last desktop is enumerated or the callback function returns
FALSE.
> [!NOTE] > The winuser.h header defines EnumDesktops as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
EnumDisplayDevicesW
The EnumDisplayDevices function lets you obtain information about the display devices in the current session. (Unicode)
%group
Win32 user32
%prm
lpDevice, iDevNum, lpDisplayDevice, dwFlags
lpDevice : [wstr] A pointer to the device name. If NULL, function returns information for the display adapter(s) on the machine, based on iDevNum. For more information, see Remarks.
iDevNum : [int] An index value that specifies the display device of interest. The operating system identifies each display device in the current session with an index value. The index values are consecutive integers, starting at 0. If the current session has three display devices, for example, they are specified by the index values 0, 1, and 2.
lpDisplayDevice : [var] A pointer to a DISPLAY_DEVICE structure that receives information about the display device specified by iDevNum. Before calling EnumDisplayDevices, you must initialize the cb member of DISPLAY_DEVICE to the size, in bytes, of DISPLAY_DEVICE.
dwFlags : [int] Set this flag to EDD_GET_DEVICE_INTERFACE_NAME (0x00000001) to retrieve the device interface name for GUID_DEVINTERFACE_MONITOR, which is registered by the operating system on a per monitor basis. The value is placed in the DeviceID member of the DISPLAY_DEVICE structure returned in lpDisplayDevice. The resulting device interface name can be used with SetupAPI functions and serves as a link between GDI monitor devices and SetupAPI monitor devices.
%inst
The EnumDisplayDevices function lets you obtain information about the
display devices in the current session. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. The function fails if
iDevNum is greater than the largest device index.

[備考]
To query all display devices in the current session, call this
function in a loop, starting with iDevNum set to 0, and incrementing
iDevNum until the function fails. To select all display devices in
the desktop, use only the display devices that have the
DISPLAY_DEVICE_ATTACHED_TO_DESKTOP flag in the DISPLAY_DEVICE
structure. To get information on the display adapter, call
EnumDisplayDevices with lpDevice set to NULL. For example,
DISPLAY_DEVICE.DeviceString contains the adapter name. To obtain
information on a display monitor, first call EnumDisplayDevices with
lpDevice set to NULL. Then call EnumDisplayDevices with lpDevice set
to DISPLAY_DEVICE.DeviceName from the first call to
EnumDisplayDevices and with iDevNum set to zero. Then
DISPLAY_DEVICE.DeviceString is the monitor name. To query all monitor
devices associated with an adapter, call EnumDisplayDevices in a loop
with lpDevice set to the adapter name, iDevNum set to start at 0, and
iDevNum set to increment until the function fails. Note that
DISPLAY_DEVICE.DeviceName changes with each call for monitor
information, so you must save the adapter name. The function fails
when there are no more monitors for the adapter.
> [!NOTE] > The winuser.h header defines EnumDisplayDevices as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
EnumDisplayMonitors
The EnumDisplayMonitors function enumerates display monitors (including invisible pseudo-monitors associated with the mirroring drivers) that intersect a region formed by the intersection of a specified clipping rectangle and the visible region of a device context. EnumDisplayMonitors calls an application-defined MonitorEnumProc callback function once for each monitor that is enumerated. Note that GetSystemMetrics (SM_CMONITORS) counts only the display monitors.
%group
Win32 user32
%prm
hdc, lprcClip, lpfnEnum, dwData
hdc : [intptr] A handle to a display device context that defines the visible region of interest. If this parameter is NULL, the hdcMonitor parameter passed to the callback function will be NULL, and the visible region of interest is the virtual screen that encompasses all the displays on the desktop.
lprcClip : [var] A pointer to a RECT structure that specifies a clipping rectangle. The region of interest is the intersection of the clipping rectangle with the visible region specified by hdc. If hdc is non-NULL, the coordinates of the clipping rectangle are relative to the origin of the hdc. If hdc is NULL, the coordinates are virtual-screen coordinates. This parameter can be NULL if you don't want to clip the region specified by hdc.
lpfnEnum : [int] A pointer to a MonitorEnumProc application-defined callback function.
dwData : [intptr] Application-defined data that EnumDisplayMonitors passes directly to the MonitorEnumProc function.
%inst
The EnumDisplayMonitors function enumerates display monitors
(including invisible pseudo-monitors associated with the mirroring
drivers) that intersect a region formed by the intersection of a
specified clipping rectangle and the visible region of a device
context. EnumDisplayMonitors calls an application-defined
MonitorEnumProc callback function once for each monitor that is
enumerated. Note that GetSystemMetrics (SM_CMONITORS) counts only the
display monitors.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
There are two reasons to call the EnumDisplayMonitors function:
This doc was truncated.


%index
EnumDisplaySettingsW
The EnumDisplaySettings function retrieves information about one of the graphics modes for a display device. To retrieve information for all the graphics modes of a display device, make a series of calls to this function. (Unicode)
%group
Win32 user32
%prm
lpszDeviceName, iModeNum, lpDevMode
lpszDeviceName : [wstr] A pointer to a null-terminated string that specifies the display device about whose graphics mode the function will obtain information. This parameter is either NULL or a DISPLAY_DEVICE.DeviceName returned from EnumDisplayDevices. A NULL value specifies the current display device on the computer on which the calling thread is running.
iModeNum : [int] 
lpDevMode : [var] A pointer to a DEVMODE structure into which the function stores information about the specified graphics mode. Before calling EnumDisplaySettings, set the dmSize member to sizeof(DEVMODE), and set the dmDriverExtra member to indicate the size, in bytes, of the additional space available to receive private driver data. The EnumDisplaySettings function sets values for the following five DEVMODE members:
%inst
The EnumDisplaySettings function retrieves information about one of
the graphics modes for a display device. To retrieve information for
all the graphics modes of a display device, make a series of calls to
this function. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The function fails if iModeNum is greater than the index of the
display device's last graphics mode. As noted in the description of
the iModeNum parameter, you can use this behavior to enumerate all of
a display device's graphics modes. DPI Virtualization This API does
not participate in DPI virtualization. The output given is always in
terms of physical pixels, and is not related to the calling context.
> [!NOTE] > The winuser.h header defines EnumDisplaySettings as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
EnumDisplaySettingsExW
The EnumDisplaySettingsEx function retrieves information about one of the graphics modes for a display device. To retrieve information for all the graphics modes for a display device, make a series of calls to this function. (Unicode)
%group
Win32 user32
%prm
lpszDeviceName, iModeNum, lpDevMode, dwFlags
lpszDeviceName : [wstr] A pointer to a null-terminated string that specifies the display device about which graphics mode the function will obtain information. This parameter is either NULL or a DISPLAY_DEVICE. DeviceName returned from EnumDisplayDevices. A NULL value specifies the current display device on the computer that the calling thread is running on.
iModeNum : [int] 
lpDevMode : [var] A pointer to a DEVMODE structure into which the function stores information about the specified graphics mode. Before calling EnumDisplaySettingsEx, set the dmSize member to sizeof (DEVMODE), and set the dmDriverExtra member to indicate the size, in bytes, of the additional space available to receive private driver data. The EnumDisplaySettingsEx function will populate the dmFields member of the lpDevMode and one or more other members of the DEVMODE structure. To determine which members were set by the call to EnumDisplaySettingsEx, inspect the dmFields bitmask. Some of the fields typically populated by this function include:
dwFlags : [int] This parameter can be the following value.
%inst
The EnumDisplaySettingsEx function retrieves information about one of
the graphics modes for a display device. To retrieve information for
all the graphics modes for a display device, make a series of calls
to this function. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The function fails if iModeNum is greater than the index of the
display device's last graphics mode. As noted in the description of
the iModeNum parameter, you can use this behavior to enumerate all of
a display device's graphics modes. DPI Virtualization This API does
not participate in DPI virtualization. The output given is always in
terms of physical pixels, and is not related to the calling context.
> [!NOTE] > The winuser.h header defines EnumDisplaySettingsEx as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
EnumPropsW
Enumerates all entries in the property list of a window by passing them, one by one, to the specified callback function. EnumProps continues until the last entry is enumerated or the callback function returns FALSE. (Unicode)
%group
Win32 user32
%prm
hWnd, lpEnumFunc
hWnd : [intptr] Type: HWND A handle to the window whose property list is to be enumerated.
lpEnumFunc : [int] Type: PROPENUMPROC A pointer to the callback function. For more information about the callback function, see the PropEnumProc function.
%inst
Enumerates all entries in the property list of a window by passing
them, one by one, to the specified callback function. EnumProps
continues until the last entry is enumerated or the callback function
returns FALSE. (Unicode)

[戻り値]
Type: int The return value specifies the last value returned by the
callback function. It is -1 if the function did not find a property
for enumeration.

[備考]
An application can remove only those properties it has added. It must
not remove properties added by other applications or by the system
itself.
> [!NOTE] > The winuser.h header defines EnumProps as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
EnumPropsExW
Enumerates all entries in the property list of a window by passing them, one by one, to the specified callback function. EnumPropsEx continues until the last entry is enumerated or the callback function returns FALSE. (Unicode)
%group
Win32 user32
%prm
hWnd, lpEnumFunc, lParam
hWnd : [intptr] Type: HWND A handle to the window whose property list is to be enumerated.
lpEnumFunc : [int] Type: PROPENUMPROCEX A pointer to the callback function. For more information about the callback function, see the PropEnumProcEx function.
lParam : [intptr] Type: LPARAM Application-defined data to be passed to the callback function.
%inst
Enumerates all entries in the property list of a window by passing
them, one by one, to the specified callback function. EnumPropsEx
continues until the last entry is enumerated or the callback function
returns FALSE. (Unicode)

[戻り値]
Type: int The return value specifies the last value returned by the
callback function. It is -1 if the function did not find a property
for enumeration.

[備考]
An application can remove only those properties it has added. It must
not remove properties added by other applications or by the system
itself.


%index
EnumThreadWindows
Enumerates all nonchild windows associated with a thread by passing the handle to each window, in turn, to an application-defined callback function.
%group
Win32 user32
%prm
dwThreadId, lpfn, lParam
dwThreadId : [int] Type: DWORD The identifier of the thread whose windows are to be enumerated.
lpfn : [int] Type: WNDENUMPROC A pointer to an application-defined callback function. For more information, see EnumThreadWndProc.
lParam : [intptr] Type: LPARAM An application-defined value to be passed to the callback function.
%inst
Enumerates all nonchild windows associated with a thread by passing
the handle to each window, in turn, to an application-defined
callback function.

[戻り値]
Type: BOOL If the callback function returns TRUE for all windows in
the thread specified by dwThreadId, the return value is TRUE. If the
callback function returns FALSE on any enumerated window, or if there
are no windows found in the thread specified by dwThreadId, the
return value is FALSE.


%index
EnumWindowStationsW
Enumerates all window stations in the current session. The function passes the name of each window station, in turn, to an application-defined callback function. (Unicode)
%group
Win32 user32
%prm
lpEnumFunc, lParam
lpEnumFunc : [int] A pointer to an application-defined EnumWindowStationProc callback function.
lParam : [intptr] An application-defined value to be passed to the callback function.
%inst
Enumerates all window stations in the current session. The function
passes the name of each window station, in turn, to an
application-defined callback function. (Unicode)

[戻り値]
If the function succeeds, it returns the nonzero value returned by
the callback function that was pointed to by lpEnumFunc. If the
function is unable to perform the enumeration, the return value is
zero. Call GetLastError to get extended error information. If the
callback function fails, the return value is zero. The callback
function can call SetLastError to set an error code for the caller to
retrieve by calling GetLastError.

[備考]
The EnumWindowStations function enumerates only those window stations
for which the calling process has the WINSTA_ENUMERATE access right.
For more information, see Window Station Security and Access Rights.
EnumWindowStations repeatedly invokes the lpEnumFunc callback
function until the last window station is enumerated or the callback
function returns FALSE.
> [!NOTE] > The winuser.h header defines EnumWindowStations as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
EnumWindows
Enumerates all top-level windows on the screen by passing the handle to each window, in turn, to an application-defined callback function. EnumWindows continues until the last top-level window is enumerated or the callback function returns FALSE.
%group
Win32 user32
%prm
lpEnumFunc, lParam
lpEnumFunc : [int] Type: WNDENUMPROC A pointer to an application-defined callback function. For more information, see EnumWindowsProc.
lParam : [intptr] Type: LPARAM An application-defined value to be passed to the callback function.
%inst
Enumerates all top-level windows on the screen by passing the handle
to each window, in turn, to an application-defined callback function.
EnumWindows continues until the last top-level window is enumerated
or the callback function returns FALSE.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError. If EnumWindowsProc returns zero, the
return value is also zero. In this case, the callback function should
call SetLastError to obtain a meaningful error code to be returned to
the caller of EnumWindows.

[備考]
The EnumWindows function does not enumerate child windows, with the
exception of a few top-level windows owned by the system that have
the WS_CHILD style. This function is more reliable than calling the
GetWindow function in a loop. An application that calls GetWindow to
perform this task risks being caught in an infinite loop or
referencing a handle to a window that has been destroyed. Note For
Windows 8 and later, EnumWindows enumerates only top-level windows of
desktop apps.


%index
EqualRect
The EqualRect function determines whether the two specified rectangles are equal by comparing the coordinates of their upper-left and lower-right corners.
%group
Win32 user32
%prm
lprc1, lprc2
lprc1 : [var] Pointer to a RECT structure that contains the logical coordinates of the first rectangle.
lprc2 : [var] Pointer to a RECT structure that contains the logical coordinates of the second rectangle.
%inst
The EqualRect function determines whether the two specified
rectangles are equal by comparing the coordinates of their upper-left
and lower-right corners.

[戻り値]
If the two rectangles are identical, the return value is nonzero. If
the two rectangles are not identical, the return value is zero.

[備考]
The EqualRect function does not treat empty rectangles as equal if
their coordinates are different. Because applications can use
rectangles for different purposes, the rectangle functions do not use
an explicit unit of measure. Instead, all rectangle coordinates and
dimensions are given in signed, logical values. The mapping mode and
the function in which the rectangle is used determine the units of
measure.


%index
EvaluateProximityToPolygon
Returns the score of a polygon as the probable touch target (compared to all other polygons that intersect the touch contact area) and an adjusted touch point within the polygon.
%group
Win32 user32
%prm
numVertices, controlPolygon, pHitTestingInput, pProximityEval
numVertices : [int] The number of vertices in the polygon. This value must be greater than or equal to 3. This value indicates the size of the array, as specified by the controlPolygon parameter.
controlPolygon : [var] The array of x-y screen coordinates that define the shape of the UI element. The numVertices parameter specifies the number of coordinates.
pHitTestingInput : [var] The TOUCH_HIT_TESTING_INPUT structure that holds the data for the touch contact area.
pProximityEval : [var] The TOUCH_HIT_TESTING_PROXIMITY_EVALUATION structure that holds the score and adjusted touch-point data.
%inst
Returns the score of a polygon as the probable touch target (compared
to all other polygons that intersect the touch contact area) and an
adjusted touch point within the polygon.

[戻り値]
If this function succeeds, it returns TRUE. Otherwise, it returns
FALSE. To retrieve extended error information, call the GetLastError
function.

[備考]
For consistency with Windows, frameworks that handle
WM_TOUCHHITTESTING should use the following principles for targeting:
This doc was truncated.


%index
EvaluateProximityToRect
Returns the score of a rectangle as the probable touch target, compared to all other rectangles that intersect the touch contact area, and an adjusted touch point within the rectangle.
%group
Win32 user32
%prm
controlBoundingBox, pHitTestingInput, pProximityEval
controlBoundingBox : [var] The RECT structure that defines the bounding box of the UI element.
pHitTestingInput : [var] The TOUCH_HIT_TESTING_INPUT structure that holds the data for the touch contact area.
pProximityEval : [var] The TOUCH_HIT_TESTING_PROXIMITY_EVALUATION structure that holds the score and adjusted touch-point data.
%inst
Returns the score of a rectangle as the probable touch target,
compared to all other rectangles that intersect the touch contact
area, and an adjusted touch point within the rectangle.

[戻り値]
If this function succeeds, it returns TRUE. Otherwise, it returns
FALSE. To retrieve extended error information, call the GetLastError
function.

[備考]
For consistency with Windows, frameworks that handle
WM_TOUCHHITTESTING should use the following principles for targeting:
This doc was truncated.


%index
ExcludeUpdateRgn
The ExcludeUpdateRgn function prevents drawing within invalid areas of a window by excluding an updated region in the window from a clipping region.
%group
Win32 user32
%prm
hDC, hWnd
hDC : [intptr] Handle to the device context associated with the clipping region.
hWnd : [intptr] Handle to the window to update.
%inst
The ExcludeUpdateRgn function prevents drawing within invalid areas
of a window by excluding an updated region in the window from a
clipping region.

[戻り値]
The return value specifies the complexity of the excluded region; it
can be any one of the following values.
This doc was truncated.


%index
ExitWindowsEx
Logs off the interactive user, shuts down the system, or shuts down and restarts the system.
%group
Win32 user32
%prm
uFlags, dwReason
uFlags : [int] 
dwReason : [int] The reason for initiating the shutdown. This parameter must be one of the system shutdown reason codes. If this parameter is zero, the SHTDN_REASON_FLAG_PLANNED reason code  will not be set and therefore the default action is an undefined shutdown that is logged as "No title for this reason could be found". By default, it is also an unplanned shutdown. Depending on how the system is configured, an unplanned shutdown triggers the creation of a file that contains the system state information, which can delay shutdown. Therefore, do not use zero for this parameter.
%inst
Logs off the interactive user, shuts down the system, or shuts down
and restarts the system.

[戻り値]
If the function succeeds, the return value is nonzero. Because the
function executes asynchronously, a nonzero return value indicates
that the shutdown has been initiated. It does not indicate whether
the shutdown will succeed. It is possible that the system, the user,
or another application will abort the shutdown. If the function
fails, the return value is zero. To get extended error information,
call GetLastError.

[備考]
The ExitWindowsEx function returns as soon as it has initiated the
shutdown process. The shutdown or logoff then proceeds
asynchronously. The function is designed to stop all processes in the
caller's logon session. Therefore, if you are not the interactive
user, the function can succeed without actually shutting down the
computer. If you are not the interactive user, use the
InitiateSystemShutdown or InitiateSystemShutdownEx function. A
non-zero return value does not mean the logoff was or will be
successful. The shutdown is an asynchronous process, and it can occur
long after the API call has returned, or not at all. Even if the
timeout value is zero, the shutdown can still be aborted by
applications, services, or even the system. The non-zero return value
indicates that the validation of the rights and parameters was
successful and that the system accepted the shutdown request. When
this function is called, the caller must specify whether or not
applications with unsaved changes should be forcibly closed. If the
caller chooses not to force these applications to close and an
application with unsaved changes is running on the console session,
the shutdown will remain in progress until the user logged into the
console session aborts the shutdown, saves changes, closes the
application, or forces the application to close. During this period,
the shutdown may not be aborted except by the console user, and
another shutdown may not be initiated. Calling this function with the
value of the uFlags parameter set to EWX_FORCE avoids this situation.
Remember that doing this may result in loss of data. To set a
shutdown priority for an application relative to other applications
in the system, use the SetProcessShutdownParameters function. During
a shutdown or log-off operation, running applications are allowed a
specific amount of time to respond to the shutdown request. If this
time expires before all applications have stopped, the system
displays a user interface that allows the user to forcibly shut down
the system or to cancel the shutdown request. If the EWX_FORCE value
is specified, the system forces running applications to stop when the
time expires. If the EWX_FORCEIFHUNG value is specified, the system
forces hung applications to close and does not display the dialog
box. Console processes receive a separate notification message,
CTRL_SHUTDOWN_EVENT or CTRL_LOGOFF_EVENT, as the situation warrants.
A console process routes these messages to its HandlerRoutine
function. ExitWindowsEx sends these notification messages
asynchronously; thus, an application cannot assume that the console
notification messages have been handled when a call to ExitWindowsEx
returns. To shut down or restart the system, the calling process must
use the AdjustTokenPrivileges function to enable the SE_SHUTDOWN_NAME
privilege. For more information, see Running with Special Privileges.


%index
FillRect
指定したブラシを使って矩形を塗りつぶす。左端と上端は含み、右端と下端は含まない。
%group
Win32 user32
%prm
hDC, lprc, hbr
hDC : [intptr] デバイスコンテキストへのハンドル。
lprc : [var] 塗りつぶす矩形の論理座標を含む RECT 構造体へのポインタ。
hbr : [intptr] 矩形を塗りつぶすのに使用するブラシへのハンドル。
%inst
指定したブラシを使って矩形を塗りつぶす。左端と上端は含み、右端と下端は含まない。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
hbr
は論理ブラシへのハンドルまたは色値のいずれか。論理ブラシを指定する場合、CreateHatchBrush、CreatePatternBrush、CreateSolidBrush
のいずれか、または GetStockObject でハンドルを取得する。色値を指定する場合、標準システム色の 1 つ(選択色に 1
を足した値)でなければならない。
（以下省略）


%index
FindWindowW
Retrieves a handle to the top-level window whose class name and window name match the specified strings. This function does not search child windows. This function does not perform a case-sensitive search. (Unicode)
%group
Win32 user32
%prm
lpClassName, lpWindowName
lpClassName : [wstr] Type: LPCTSTR The class name or a class atom created by a previous call to the RegisterClass or RegisterClassEx function. The atom must be in the low-order word of lpClassName; the high-order word must be zero. If lpClassName points to a string, it specifies the window class name. The class name can be any name registered with RegisterClass or RegisterClassEx, or any of the predefined control-class names. If lpClassName is NULL, it finds any window whose title matches the lpWindowName parameter.
lpWindowName : [wstr] Type: LPCTSTR The window name (the window's title). If this parameter is NULL, all window names match.
%inst
Retrieves a handle to the top-level window whose class name and
window name match the specified strings. This function does not
search child windows. This function does not perform a case-sensitive
search. (Unicode)

[戻り値]
Type: HWND If the function succeeds, the return value is a handle to
the window that has the specified class name and window name. If the
function fails, the return value is NULL. To get extended error
information, call GetLastError.

[備考]
If the lpWindowName parameter is not NULL, FindWindow calls the
GetWindowText function to retrieve the window name for comparison.
For a description of a potential problem that can arise, see the
Remarks for GetWindowText.


%index
FindWindowExW
Retrieves a handle to a window whose class name and window name match the specified strings. The function searches child windows, beginning with the one following the specified child window. This function does not perform a case-sensitive search. (Unicode)
%group
Win32 user32
%prm
hWndParent, hWndChildAfter, lpszClass, lpszWindow
hWndParent : [intptr] Type: HWND A handle to the parent window whose child windows are to be searched. If hwndParent is NULL, the function uses the desktop window as the parent window. The function searches among windows that are child windows of the desktop. If hwndParent is HWND_MESSAGE, the function searches all message-only windows.
hWndChildAfter : [intptr] Type: HWND A handle to a child window. The search begins with the next child window in the Z order. The child window must be a direct child window of hwndParent, not just a descendant window. If hwndChildAfter is NULL, the search begins with the first child window of hwndParent. Note that if both hwndParent and hwndChildAfter are NULL, the function searches all top-level and message-only windows.
lpszClass : [wstr] Type: LPCTSTR The class name or a class atom created by a previous call to the RegisterClass or RegisterClassEx function. The atom must be placed in the low-order word of lpszClass; the high-order word must be zero. If lpszClass is a string, it specifies the window class name. The class name can be any name registered with RegisterClass or RegisterClassEx, or any of the predefined control-class names, or it can be MAKEINTATOM(0x8000). In this latter case, 0x8000 is the atom for a menu class. For more information, see the Remarks section of this topic.
lpszWindow : [wstr] Type: LPCTSTR The window name (the window's title). If this parameter is NULL, all window names match.
%inst
Retrieves a handle to a window whose class name and window name match
the specified strings. The function searches child windows, beginning
with the one following the specified child window. This function does
not perform a case-sensitive search. (Unicode)

[戻り値]
Type: HWND If the function succeeds, the return value is a handle to
the window that has the specified class and window names. If the
function fails, the return value is NULL. To get extended error
information, call GetLastError.

[備考]
The FindWindowEx function searches only direct child windows. It does
not search other descendants. If the lpszWindow parameter is not
NULL, FindWindowEx calls the GetWindowText function to retrieve the
window name for comparison. For a description of a potential problem
that can arise, see the Remarks section of GetWindowText. An
application can call this function in the following way.
FindWindowEx( NULL, NULL, MAKEINTATOM(0x8000), NULL ); Note that
0x8000 is the atom for a menu class. When an application calls this
function, the function checks whether a context menu is being
displayed that the application created.
> [!NOTE] > The winuser.h header defines FindWindowEx as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
FlashWindow
Flashes the specified window one time. It does not change the active state of the window.
%group
Win32 user32
%prm
hWnd, bInvert
hWnd : [intptr] A handle to the window to be flashed. The window can be either open or minimized.
bInvert : [int] If this parameter is TRUE, the window is flashed from one state to the other. If it is FALSE, the window is returned to its original state (either active or inactive).
%inst
Flashes the specified window one time. It does not change the active
state of the window.

[戻り値]
The return value specifies the window's state before the call to the
FlashWindow function. If the window caption was drawn as active
before the call, the return value is nonzero. Otherwise, the return
value is zero.

[備考]
Flashing a window means changing the appearance of its caption bar as
if the window were changing from inactive to active status, or vice
versa. (An inactive caption bar changes to an active caption bar; an
active caption bar changes to an inactive caption bar.) Typically, a
window is flashed to inform the user that the window requires
attention but that it does not currently have the keyboard focus. The
FlashWindow function flashes the window only once; for repeated
flashing, the application should create a system timer.


%index
FlashWindowEx
Flashes the specified window. It does not change the active state of the window.
%group
Win32 user32
%prm
pfwi
pfwi : [var] A pointer to a FLASHWINFO structure.
%inst
Flashes the specified window. It does not change the active state of
the window.

[戻り値]
The return value specifies the window's state before the call to the
FlashWindowEx function. If the window caption was drawn as active
before the call, the return value is nonzero. Otherwise, the return
value is zero.

[備考]
Typically, you flash a window to inform the user that the window
requires attention but does not currently have the keyboard focus.
When a window flashes, it appears to change from inactive to active
status. An inactive caption bar changes to an active caption bar; an
active caption bar changes to an inactive caption bar.


%index
FrameRect
指定したブラシを使って矩形の周囲に枠線を描画する。枠線の幅と高さは常に 1 論理単位。
%group
Win32 user32
%prm
hDC, lprc, hbr
hDC : [intptr] 枠を描画するデバイスコンテキストへのハンドル。
lprc : [var] 矩形の左上隅と右下隅の論理座標を含む RECT 構造体へのポインタ。
hbr : [intptr] 枠の描画に使用するブラシへのハンドル。
%inst
指定したブラシを使って矩形の周囲に枠線を描画する。枠線の幅と高さは常に 1 論理単位。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
hbr で指定されるブラシは CreateHatchBrush、CreatePatternBrush、CreateSolidBrush
で作成されているか、GetStockObject で取得されたものでなければならない。RECT の bottom が top
より小さい、または right が left より小さい場合、関数は矩形を描画しない。


%index
FreeDDElParam
Frees the memory specified by the lParam parameter of a posted Dynamic Data Exchange (DDE) message. An application receiving a posted DDE message should call this function after it has used the UnpackDDElParam function to unpack the lParam value.
%group
Win32 user32
%prm
msg, lParam
msg : [int] Type: UINT The posted DDE message.
lParam : [intptr] Type: LPARAM The lParam parameter of the posted DDE message.
%inst
Frees the memory specified by the lParam parameter of a posted
Dynamic Data Exchange (DDE) message. An application receiving a
posted DDE message should call this function after it has used the
UnpackDDElParam function to unpack the lParam value.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero.

[備考]
An application should call this function only for posted DDE
messages. This function frees the memory specified by the lParam
parameter. It does not free the contents of lParam.


%index
GetActiveWindow
呼び出し元スレッドのメッセージキューにアタッチされたアクティブウィンドウへのハンドルを取得する。
%group
Win32 user32
%prm

%inst
呼び出し元スレッドのメッセージキューにアタッチされたアクティブウィンドウへのハンドルを取得する。

[戻り値]
型: HWND 戻り値は呼び出し元スレッドのメッセージキューにアタッチされたアクティブウィンドウへのハンドル。ない場合は NULL。

[備考]
フォアグラウンドウィンドウのハンドルは GetForegroundWindow
で取得できる。別スレッドのメッセージキュー内のアクティブウィンドウのハンドルは GetGUIThreadInfo で取得する。


%index
GetAltTabInfoW
Retrieves status information for the specified window if it is the application-switching (ALT+TAB) window. (Unicode)
%group
Win32 user32
%prm
hwnd, iItem, pati, pszItemText, cchItemText
hwnd : [intptr] Type: HWND A handle to the window for which status information will be retrieved. This window must be the application-switching window.
iItem : [int] Type: int The index of the icon in the application-switching window. If the pszItemText parameter is not NULL, the name of the item is copied to the pszItemText string. If this parameter is ?1, the name of the item is not copied.
pati : [var] Type: PALTTABINFO A pointer to an ALTTABINFO structure to receive the status information. Note that you must set the csSize member to sizeof(ALTTABINFO) before calling this function.
pszItemText : [wstr] Type: LPTSTR The name of the item. If this parameter is NULL, the name of the item is not copied.
cchItemText : [int] Type: UINT The size, in characters, of the pszItemText buffer.
%inst
Retrieves status information for the specified window if it is the
application-switching (ALT+TAB) window. (Unicode)

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The application-switching window enables you to switch to the most
recently used application window. To display the
application-switching window, press ALT+TAB. To select an application
from the list, continue to hold ALT down and press TAB to move
through the list. Add SHIFT to reverse direction through the list.
> [!NOTE] > The winuser.h header defines GetAltTabInfo as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetAncestor
Retrieves the handle to the ancestor of the specified window.
%group
Win32 user32
%prm
hwnd, gaFlags
hwnd : [intptr] Type: HWND A handle to the window whose ancestor is to be retrieved. If this parameter is the desktop window, the function returns NULL.
gaFlags : [int] Type: UINT
%inst
Retrieves the handle to the ancestor of the specified window.

[戻り値]
Type: HWND The return value is the handle to the ancestor window.


%index
GetAsyncKeyState
呼び出し時にキーが押されているかどうか、および前回の GetAsyncKeyState 呼び出し以降に押されたかを判定する。
%group
Win32 user32
%prm
vKey
vKey : [int] 型: int 仮想キーコード。詳細は Virtual Key Codes を参照。左右を区別する定数を使うこともできる。
%inst
呼び出し時にキーが押されているかどうか、および前回の GetAsyncKeyState 呼び出し以降に押されたかを判定する。

[戻り値]
型: SHORT
成功した場合、戻り値はキーが前回の呼び出し以降に押されたか、および現在押されているかを示す。最上位ビットがセットされていればキーは押下中、最下位ビットがセットされていれば前回呼び出し以降に押された。
（以下省略）

[備考]
GetAsyncKeyState
はマウスボタンに対しても動作するが、物理マウスボタンの状態を調べる(論理ボタンではない)。VK_SHIFT、VK_CONTROL、VK_MENU
を vKey に使うと、左右を区別せずに SHIFT/CTRL/ALT の状態を取得する。左右を区別するには
VK_LSHIFT、VK_RSHIFT、VK_LCONTROL、VK_RCONTROL、VK_LMENU、VK_RMENU などを使う。
（以下省略）


%index
GetAutoRotationState
Retrieves an AR_STATE value containing the state of screen auto-rotation for the system, for example whether auto-rotation is supported, and whether it is enabled by the user.
%group
Win32 user32
%prm
pState
pState : [var] Pointer to a location in memory that will receive the current state of auto-rotation for the system.
%inst
Retrieves an AR_STATE value containing the state of screen
auto-rotation for the system, for example whether auto-rotation is
supported, and whether it is enabled by the user.

[戻り値]
TRUE if the method succeeds, otherwise FALSE. See
GetDisplayAutoRotationPreferences for an example of using this
function.


%index
GetAwarenessFromDpiAwarenessContext
Retrieves the DPI_AWARENESS value from a DPI_AWARENESS_CONTEXT.
%group
Win32 user32
%prm
value
value : [intptr] The DPI_AWARENESS_CONTEXT you want to examine.
%inst
Retrieves the DPI_AWARENESS value from a DPI_AWARENESS_CONTEXT.

[戻り値]
The DPI_AWARENESS. If the provided value is null or invalid, this
method will return DPI_AWARENESS_INVALID.

[備考]
A DPI_AWARENESS_CONTEXT contains multiple pieces of information. For
example, it includes both the current and the inherited
DPI_AWARENESS. This method retrieves the DPI_AWARENESS from the
structure.


%index
GetCIMSSM
Retrieves the source of the input message (GetCurrentInputMessageSourceInSendMessage).
%group
Win32 user32
%prm
inputMessageSource
inputMessageSource : [var] The INPUT_MESSAGE_SOURCE structure that holds the device type and the ID of the input message source.
%inst
Retrieves the source of the input message
(GetCurrentInputMessageSourceInSendMessage).

[戻り値]
If this function succeeds, it returns TRUE. Otherwise, it returns
ERROR_INVALID_PARAMETER.
This doc was truncated.

[備考]
GetCIMSSM should be used only when GetCurrentInputMessageSource
returns a device type of IMDT_UNAVAILABLE.


%index
GetCapture
Retrieves a handle to the window (if any) that has captured the mouse. Only one window at a time can capture the mouse; this window receives mouse input whether or not the cursor is within its borders.
%group
Win32 user32
%prm

%inst
Retrieves a handle to the window (if any) that has captured the
mouse. Only one window at a time can capture the mouse; this window
receives mouse input whether or not the cursor is within its borders.

[戻り値]
Type: HWND The return value is a handle to the capture window
associated with the current thread. If no window in the thread has
captured the mouse, the return value is NULL.

[備考]
A NULL return value means the current thread has not captured the
mouse. However, it is possible that another thread or process has
captured the mouse. To get a handle to the capture window on another
thread, use the GetGUIThreadInfo function.


%index
GetCaretBlinkTime
Retrieves the time required to invert the caret's pixels. The user can set this value.
%group
Win32 user32
%prm

%inst
Retrieves the time required to invert the caret's pixels. The user
can set this value.

[戻り値]
Type: UINT If the function succeeds, the return value is the blink
time, in milliseconds.
A return value of INFINITE indicates that the caret does not blink. A
return value is zero indicates that the function has failed. To get
extended error information, call GetLastError.


%index
GetCaretPos
Copies the caret's position to the specified POINT structure.
%group
Win32 user32
%prm
lpPoint
lpPoint : [var] Type: LPPOINT A pointer to the POINT structure that is to receive the client coordinates of the caret.
%inst
Copies the caret's position to the specified POINT structure.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. To get extended
error information, call GetLastError.

[備考]
The caret position is always given in the client coordinates of the
window that contains the caret. DPI Virtualization This API does not
participate in DPI virtualization. The returned values are
interpreted as logical sizes in terms of the window in question. The
calling thread is not taken into consideration.


%index
GetClassInfoW
Retrieves information about a window class. (Unicode)
%group
Win32 user32
%prm
hInstance, lpClassName, lpWndClass
hInstance : [intptr] Type: HINSTANCE A handle to the instance of the application that created the class. To retrieve information about classes defined by the system (such as buttons or list boxes), set this parameter to NULL.
lpClassName : [wstr] Type: LPCTSTR The class name. The name must be that of a preregistered class or a class registered by a previous call to the RegisterClass or RegisterClassEx function. Alternatively, this parameter can be an atom. If so, it must be a class atom created by a previous call to RegisterClass or RegisterClassEx. The atom must be in the low-order word of lpClassName; the high-order word must be zero.
lpWndClass : [var] Type: LPWNDCLASS A pointer to a WNDCLASS structure that receives the information about the class.
%inst
Retrieves information about a window class. (Unicode)

[戻り値]
Type: BOOL If the function finds a matching class and successfully
copies the data, the return value is nonzero. If the function fails,
the return value is zero. To get extended error information, call
GetLastError.

[備考]
> [!NOTE] > The winuser.h header defines GetClassInfo as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetClassInfoExW
Retrieves information about a window class, including a handle to the small icon associated with the window class. The GetClassInfo function does not retrieve a handle to the small icon. (Unicode)
%group
Win32 user32
%prm
hInstance, lpszClass, lpwcx
hInstance : [intptr] Type: HINSTANCE A handle to the instance of the application that created the class. To retrieve information about classes defined by the system (such as buttons or list boxes), set this parameter to NULL.
lpszClass : [wstr] Type: LPCTSTR The class name. The name must be that of a preregistered class or a class registered by a previous call to the RegisterClass or RegisterClassEx function. Alternatively, this parameter can be a class atom created by a previous call to RegisterClass or RegisterClassEx. The atom must be in the low-order word of lpszClass; the high-order word must be zero.
lpwcx : [var] Type: LPWNDCLASSEX A pointer to a WNDCLASSEX structure that receives the information about the class.
%inst
Retrieves information about a window class, including a handle to the
small icon associated with the window class. The GetClassInfo
function does not retrieve a handle to the small icon. (Unicode)

[戻り値]
Type: BOOL If the function finds a matching class and successfully
copies the data, the return value is nonzero. If the function does
not find a matching class and successfully copy the data, the return
value is zero. To get extended error information, call GetLastError.

[備考]
Class atoms are created using the RegisterClass or RegisterClassEx
function, not the GlobalAddAtom function.
> [!NOTE] > The winuser.h header defines GetClassInfoEx as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetClassLongW
Retrieves the specified 32-bit (DWORD) value from the WNDCLASSEX structure associated with the specified window. (Unicode)
%group
Win32 user32
%prm
hWnd, nIndex
hWnd : [intptr] Type: HWND A handle to the window and, indirectly, the class to which the window belongs.
nIndex : [int] Type: int
%inst
Retrieves the specified 32-bit (DWORD) value from the WNDCLASSEX
structure associated with the specified window. (Unicode)

[戻り値]
Type: DWORD If the function succeeds, the return value is the
requested value. If the function fails, the return value is zero. To
get extended error information, call GetLastError.

[備考]
Reserve extra class memory by specifying a nonzero value in the
cbClsExtra member of the WNDCLASSEX structure used with the
RegisterClassEx function.
> [!NOTE] > The winuser.h header defines GetClassLong as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetClassNameW
Retrieves the name of the class to which the specified window belongs. (GetClassNameW)
%group
Win32 user32
%prm
hWnd, lpClassName, nMaxCount
hWnd : [intptr] Type: HWND A handle to the window and, indirectly, the class to which the window belongs.
lpClassName : [wstr] Type: LPTSTR The class name string.
nMaxCount : [int] Type: int The length of the *lpClassName* buffer, in characters. The buffer must be large enough to include the terminating null character; otherwise, the class name string is truncated to `nMaxCount-1` characters.
%inst
Retrieves the name of the class to which the specified window
belongs. (GetClassNameW)

[戻り値]
Type: int If the function succeeds, the return value is the number of
characters copied to the buffer, not including the terminating null
character. If the function fails, the return value is zero. To get
extended error information, call GetLastError.

[備考]
> [!NOTE] > The winuser.h header defines GetClassName as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetClassWord
Retrieves the 16-bit (WORD) value at the specified offset into the extra class memory for the window class to which the specified window belongs.
%group
Win32 user32
%prm
hWnd, nIndex
hWnd : [intptr] Type: HWND A handle to the window and, indirectly, the class to which the window belongs.
nIndex : [int] Type: int The zero-based byte offset of the value to be retrieved. Valid values are in the range zero through the number of bytes of class memory, minus two; for example, if you specified 10 or more bytes of extra class memory, a value of eight would be an index to the fifth 16-bit integer. There is an additional valid value as shown in the following table.
%inst
Retrieves the 16-bit (WORD) value at the specified offset into the
extra class memory for the window class to which the specified window
belongs.

[戻り値]
Type: WORD If the function succeeds, the return value is the
requested 16-bit value. If the function fails, the return value is
zero. To get extended error information, call GetLastError.

[備考]
Reserve extra class memory by specifying a nonzero value in the
cbClsExtra member of the WNDCLASS structure used with the
RegisterClass function.


%index
GetClientRect
ウィンドウのクライアント領域の座標を取得する。
%group
Win32 user32
%prm
hWnd, lpRect
hWnd : [intptr] 型: HWND クライアント座標を取得するウィンドウへのハンドル。
lpRect : [var] 型: LPRECT クライアント座標を受け取る RECT 構造体へのポインタ。left と top は 0。right と bottom はウィンドウの幅と高さを格納する。
%inst
ウィンドウのクライアント領域の座標を取得する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報を得るには GetLastError
を呼び出す。

[備考]
RECT 構造体の規約に従い、返される矩形の右下座標は排他的(exclusive)である。つまり (right, bottom)
のピクセルは矩形のすぐ外側に位置する。


%index
GetClipCursor
Retrieves the screen coordinates of the rectangular area to which the cursor is confined.
%group
Win32 user32
%prm
lpRect
lpRect : [var] Type: LPRECT A pointer to a RECT structure that receives the screen coordinates of the confining rectangle. The structure receives the dimensions of the screen if the cursor is not confined to a rectangle.
%inst
Retrieves the screen coordinates of the rectangular area to which the
cursor is confined.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The cursor is a shared resource. If an application confines the
cursor with the ClipCursor function, it must later release the cursor
by using ClipCursor before relinquishing control to another
application. The calling process must have WINSTA_READATTRIBUTES
access to the window station.


%index
GetClipboardData
Retrieves data from the clipboard in a specified format. The clipboard must have been opened previously.
%group
Win32 user32
%prm
uFormat
uFormat : [int] Type: UINT A clipboard format. For a description of the standard clipboard formats, see Standard Clipboard Formats.
%inst
Retrieves data from the clipboard in a specified format. The
clipboard must have been opened previously.

[戻り値]
Type: HANDLE If the function succeeds, the return value is the handle
to a clipboard object in the specified format. If the function fails,
the return value is NULL. To get extended error information, call
GetLastError.

[備考]
Caution Clipboard data is not trusted. Parse the data carefully
before using it in your application. An application can enumerate the
available formats in advance by using the EnumClipboardFormats
function. The clipboard controls the handle that the GetClipboardData
function returns, not the application. The application should copy
the data immediately. The application must not free the handle nor
leave it locked. The application must not use the handle after the
EmptyClipboard or CloseClipboard function is called, or after the
SetClipboardData function is called with the same clipboard format.
The system performs implicit data format conversions between certain
clipboard formats when an application calls the GetClipboardData
function. For example, if the CF_OEMTEXT format is on the clipboard,
a window can retrieve data in the CF_TEXT format. The format on the
clipboard is converted to the requested format on demand. For more
information, see Synthesized Clipboard Formats.


%index
GetClipboardFormatNameW
Retrieves from the clipboard the name of the specified registered format. The function copies the name to the specified buffer. (Unicode)
%group
Win32 user32
%prm
format, lpszFormatName, cchMaxCount
format : [int] Type: UINT The type of format to be retrieved. This parameter must not specify any of the predefined clipboard formats.
lpszFormatName : [wstr] Type: LPTSTR The buffer that is to receive the format name.
cchMaxCount : [int] Type: int The maximum length, in characters, of the string to be copied to the buffer. If the name exceeds this limit, it is truncated.
%inst
Retrieves from the clipboard the name of the specified registered
format. The function copies the name to the specified buffer.
(Unicode)

[戻り値]
Type: int If the function succeeds, the return value is the length,
in characters, of the string copied to the buffer. If the function
fails, the return value is zero, indicating that the requested format
does not exist or is predefined. To get extended error information,
call GetLastError.

[備考]
Security Considerations Using this function incorrectly might
compromise the security of your program. For example, miscalculating
the proper size of the lpszFormatName buffer, especially when the
application is used in both ANSI and Unicode versions, can cause a
buffer overflow. Also, note that the string is truncated if it is
longer than the cchMaxCount parameter, which can lead to loss of
information.


%index
GetClipboardOwner
Retrieves the window handle of the current owner of the clipboard.
%group
Win32 user32
%prm

%inst
Retrieves the window handle of the current owner of the clipboard.

[戻り値]
Type: HWND If the function succeeds, the return value is the handle
to the window that owns the clipboard. If the clipboard is not owned,
the return value is NULL. To get extended error information, call
GetLastError.

[備考]
The clipboard can still contain data even if the clipboard is not
currently owned. In general, the clipboard owner is the window that
last placed data in clipboard. The EmptyClipboard function assigns
clipboard ownership.


%index
GetClipboardSequenceNumber
Retrieves the clipboard sequence number for the current window station.
%group
Win32 user32
%prm

%inst
Retrieves the clipboard sequence number for the current window
station.

[戻り値]
Type: DWORD The return value is the clipboard sequence number. If you
do not have WINSTA_ACCESSCLIPBOARD access to the window station, the
function returns zero.

[備考]
The system keeps a serial number for the clipboard for each window
station. This number is incremented whenever the contents of the
clipboard change or the clipboard is emptied. You can track this
value to determine whether the clipboard contents have changed and
optimize creating DataObjects. If clipboard rendering is delayed, the
sequence number is not incremented until the changes are rendered.


%index
GetClipboardViewer
Retrieves the handle to the first window in the clipboard viewer chain.
%group
Win32 user32
%prm

%inst
Retrieves the handle to the first window in the clipboard viewer
chain.

[戻り値]
Type: HWND If the function succeeds, the return value is the handle
to the first window in the clipboard viewer chain. If there is no
clipboard viewer, the return value is NULL. To get extended error
information, call GetLastError.


%index
GetComboBoxInfo
Retrieves information about the specified combo box.
%group
Win32 user32
%prm
hwndCombo, pcbi
hwndCombo : [intptr] Type: HWND A handle to the combo box.
pcbi : [var] Type: PCOMBOBOXINFO A pointer to a COMBOBOXINFO structure that receives the information. You must set COMBOBOXINFO.cbSize before calling this function.
%inst
Retrieves information about the specified combo box.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The CB_GETCOMBOBOXINFO message is equivalent to this function.


%index
GetCurrentInputMessageSource
Retrieves the source of the input message.
%group
Win32 user32
%prm
inputMessageSource
inputMessageSource : [var] The INPUT_MESSAGE_SOURCE structure that holds the device type and the ID of the input message source. Note??deviceType in INPUT_MESSAGE_SOURCE is set to   IMDT_UNAVAILABLE when SendMessage is used to inject input (system generated or through messages such as WM_PAINT). This remains true until  SendMessage returns.
%inst
Retrieves the source of the input message.

[戻り値]
If this function succeeds, it returns TRUE. Otherwise, it returns
FALSE. To retrieve extended error information, call the GetLastError
function.


%index
GetCursor
Retrieves a handle to the current cursor.
%group
Win32 user32
%prm

%inst
Retrieves a handle to the current cursor.

[戻り値]
Type: HCURSOR The return value is the handle to the current cursor.
If there is no cursor, the return value is NULL.


%index
GetCursorInfo
Retrieves information about the global cursor.
%group
Win32 user32
%prm
pci
pci : [var] Type: PCURSORINFO A pointer to a CURSORINFO structure that receives the information. Note that you must set the cbSize member to sizeof(CURSORINFO) before calling this function.
%inst
Retrieves information about the global cursor.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
GetCursorPos
マウスカーソルの位置をスクリーン座標で取得する。
%group
Win32 user32
%prm
lpPoint
lpPoint : [var] 型: LPPOINT カーソルのスクリーン座標を受け取る POINT 構造体へのポインタ。
%inst
マウスカーソルの位置をスクリーン座標で取得する。

[戻り値]
型: BOOL 成功した場合は 0 以外、失敗した場合は 0 を返す。拡張エラー情報を得るには GetLastError を呼び出す。

[備考]

カーソル位置は常にスクリーン座標で指定され、カーソルを含むウィンドウのマッピングモードの影響を受けない。呼び出し元プロセスはウィンドウステーションに対する
WINSTA_READATTRIBUTES アクセス権を持っている必要がある。GetCursorPos
呼び出し時、入力デスクトップがカレントデスクトップでなければならない。カレントデスクトップが入力デスクトップかどうかを判定するには
OpenInputDesktop を呼ぶ。そうでなければ、OpenInputDesktop が返す HDESK を指定して
SetThreadDesktop を呼び、そのデスクトップへ切り替える。


%index
GetDC
The GetDC function retrieves a handle to a device context (DC) for the client area of a specified window or for the entire screen.
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] A handle to the window whose DC is to be retrieved. If this value is NULL, GetDC retrieves the DC for the entire screen.
%inst
The GetDC function retrieves a handle to a device context (DC) for
the client area of a specified window or for the entire screen.

[戻り値]
If the function succeeds, the return value is a handle to the DC for
the specified window's client area. If the function fails, the return
value is NULL.

[備考]
The GetDC function retrieves a common, class, or private DC depending
on the class style of the specified window. For class and private
DCs, GetDC leaves the previously assigned attributes unchanged.
However, for common DCs, GetDC assigns default attributes to the DC
each time it is retrieved. For example, the default font is System,
which is a bitmap font. Because of this, the handle to a common DC
returned by GetDC does not tell you what font, color, or brush was
used when the window was drawn. To determine the font, call
GetTextFace. Note that the handle to the DC can only be used by a
single thread at any one time. After painting with a common DC, the
ReleaseDC function must be called to release the DC. Class and
private DCs do not have to be released. ReleaseDC must be called from
the same thread that called GetDC. The number of DCs is limited only
by available memory.


%index
GetDCEx
The GetDCEx function retrieves a handle to a device context (DC) for the client area of a specified window or for the entire screen.
%group
Win32 user32
%prm
hWnd, hrgnClip, flags
hWnd : [intptr] A handle to the window whose DC is to be retrieved. If this value is NULL, GetDCEx retrieves the DC for the entire screen.
hrgnClip : [intptr] A clipping region that may be combined with the visible region of the DC. If the value of flags is DCX_INTERSECTRGN or DCX_EXCLUDERGN, then the operating system assumes ownership of the region and will automatically delete it when it is no longer needed. In this case, the application should not use or delete the region after a successful call to GetDCEx.
flags : [int] 
%inst
The GetDCEx function retrieves a handle to a device context (DC) for
the client area of a specified window or for the entire screen.

[戻り値]
If the function succeeds, the return value is the handle to the DC
for the specified window. If the function fails, the return value is
NULL. An invalid value for the hWnd parameter will cause the function
to fail.

[備考]
Unless the display DC belongs to a window class, the ReleaseDC
function must be called to release the DC after painting. Also,
ReleaseDC must be called from the same thread that called GetDCEx.
The number of DCs is limited only by available memory. The function
returns a handle to a DC that belongs to the window's class if
CS_CLASSDC, CS_OWNDC or CS_PARENTDC was specified as a style in the
WNDCLASS structure when the class was registered.


%index
GetDesktopWindow
Retrieves a handle to the desktop window. The desktop window covers the entire screen. The desktop window is the area on top of which other windows are painted.
%group
Win32 user32
%prm

%inst
Retrieves a handle to the desktop window. The desktop window covers
the entire screen. The desktop window is the area on top of which
other windows are painted.

[戻り値]
Type: HWND The return value is a handle to the desktop window.


%index
GetDialogBaseUnits
Retrieves the system's dialog base units, which are the average width and height of characters in the system font.
%group
Win32 user32
%prm

%inst
Retrieves the system's dialog base units, which are the average width
and height of characters in the system font.

[戻り値]
Type: LONG The function returns the dialog base units. The low-order
word of the return value contains the horizontal dialog box base
unit, and the high-order word contains the vertical dialog box base
unit.

[備考]
The horizontal base unit returned by GetDialogBaseUnits is equal to
the average width, in pixels, of the characters in the system font;
the vertical base unit is equal to the height, in pixels, of the
font. The system font is used only if the dialog box template fails
to specify a font. Most dialog box templates specify a font; as a
result, this function is not useful for most dialog boxes.
For a dialog box that does not use the system font, the base units
are the average width and height, in pixels, of the characters in the
dialog's font. You can use the GetTextMetrics and
GetTextExtentPoint32 functions to calculate these values for a
selected font. However, by using the MapDialogRect function, you can
avoid errors that might result if your calculations differ from those
performed by the system. Each horizontal base unit is equal to 4
horizontal dialog template units; each vertical base unit is equal to
8 vertical dialog template units. Therefore, to convert dialog
template units to pixels, use the following formulas:
This doc was truncated.


%index
GetDialogControlDpiChangeBehavior
Retrieves and per-monitor DPI scaling behavior overrides of a child window in a dialog.
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] The handle for the window to examine.
%inst
Retrieves and per-monitor DPI scaling behavior overrides of a child
window in a dialog.

[戻り値]
The flags set on the given window. If passed an invalid handle, this
function will return zero, and set its last error to
ERROR_INVALID_HANDLE.


%index
GetDialogDpiChangeBehavior
Returns the flags that might have been set on a given dialog by an earlier call to SetDialogDpiChangeBehavior.
%group
Win32 user32
%prm
hDlg
hDlg : [intptr] The handle for the dialog to examine.
%inst
Returns the flags that might have been set on a given dialog by an
earlier call to SetDialogDpiChangeBehavior.

[戻り値]
The flags set on the given dialog. If passed an invalid handle, this
function will return zero, and set its last error to
ERROR_INVALID_HANDLE.

[備考]
It can be difficult to distinguish between a return value of
DDC_DEFAULT and the error case, which is zero. To determine between
the two, it is recommended that you call GetLastError() to check the
error.


%index
GetDisplayAutoRotationPreferences
Retrieves the screen auto-rotation preferences for the current process.
%group
Win32 user32
%prm
pOrientation
pOrientation : [var] Pointer to a location in memory that will receive the current orientation preference setting for the calling process.
%inst
Retrieves the screen auto-rotation preferences for the current
process.

[戻り値]
TRUE if the method succeeds, otherwise FALSE.


%index
GetDisplayConfigBufferSizes
The GetDisplayConfigBufferSizes function retrieves the size of the buffers that are required to call the QueryDisplayConfig function.
%group
Win32 user32
%prm
flags, numPathArrayElements, numModeInfoArrayElements
flags : [int] 
numPathArrayElements : [var] Pointer to a variable that receives the number of elements in the path information table. The pNumPathArrayElements parameter value is then used by a subsequent call to the QueryDisplayConfig function. This parameter cannot be NULL.
numModeInfoArrayElements : [var] Pointer to a variable that receives the number of elements in the mode information table. The pNumModeInfoArrayElements parameter value is then used by a subsequent call to the QueryDisplayConfig function. This parameter cannot be NULL.
%inst
The GetDisplayConfigBufferSizes function retrieves the size of the
buffers that are required to call the QueryDisplayConfig function.

[戻り値]
The function returns one of the following return codes.
This doc was truncated.

[備考]
Given the current display path configuration and the requested flags,
GetDisplayConfigBufferSizes returns the size of the path and mode
tables that are required to store the information.
GetDisplayConfigBufferSizes can return values that are slightly
larger than are actually required because it determines that all
source and target paths are valid; whereas, the driver might place
some restrictions on the possible combinations. As
GetDisplayConfigBufferSizes can only determine the required array
size of that moment in time, it is possible that between calls to
GetDisplayConfigBufferSizes and QueryDisplayConfig the system
configuration has changed and the provided array sizes are no longer
sufficient to store the new path data. If a caller is aware that it
must enable additional sources and targets, the caller can allocate a
larger mode information array than is returned from
GetDisplayConfigBufferSizes so that it has the space to add the
additional source and target modes after calling QueryDisplayConfig
and before calling SetDisplayConfig.


%index
GetDlgCtrlID
Retrieves the identifier of the specified control.
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] Type: HWND A handle to the control.
%inst
Retrieves the identifier of the specified control.

[戻り値]
Type: int If the function succeeds, the return value is the
identifier of the control. If the function fails, the return value is
zero. An invalid value for the hwndCtl parameter, for example, will
cause the function to fail. To get extended error information, call
GetLastError.

[備考]
GetDlgCtrlID accepts child window handles as well as handles of
controls in dialog boxes. An application sets the identifier for a
child window when it creates the window by assigning the identifier
value to the hmenu parameter when calling the CreateWindow or
CreateWindowEx function. Although GetDlgCtrlID may return a value if
hwndCtl is a handle to a top-level window, top-level windows cannot
have identifiers and such a return value is never valid.


%index
GetDlgItem
Retrieves a handle to a control in the specified dialog box.
%group
Win32 user32
%prm
hDlg, nIDDlgItem
hDlg : [intptr] Type: HWND A handle to the dialog box that contains the control.
nIDDlgItem : [int] Type: int The identifier of the control to be retrieved.
%inst
Retrieves a handle to a control in the specified dialog box.

[戻り値]
Type: HWND If the function succeeds, the return value is the window
handle of the specified control. If the function fails, the return
value is NULL, indicating an invalid dialog box handle or a
nonexistent control. To get extended error information, call
GetLastError.

[備考]
You can use the GetDlgItem function with any parent-child window
pair, not just with dialog boxes. As long as the hDlg parameter
specifies a parent window and the child window has a unique
identifier (as specified by the hMenu parameter in the CreateWindow
or CreateWindowEx function that created the child window), GetDlgItem
returns a valid handle to the child window.


%index
GetDlgItemInt
Translates the text of a specified control in a dialog box into an integer value.
%group
Win32 user32
%prm
hDlg, nIDDlgItem, lpTranslated, bSigned
hDlg : [intptr] Type: HWND A handle to the dialog box that contains the control of interest.
nIDDlgItem : [int] Type: int The identifier of the control whose text is to be translated.
lpTranslated : [var] Type: BOOL* Indicates success or failure (TRUE indicates success, FALSE indicates failure). If this parameter is NULL, the function returns no information about success or failure.
bSigned : [int] Type: BOOL Indicates whether the function should examine the text for a minus sign at the beginning and return a signed integer value if it finds one (TRUE specifies this should be done, FALSE that it should not).
%inst
Translates the text of a specified control in a dialog box into an
integer value.

[戻り値]
Type: UINT If the function succeeds, the variable pointed to by
lpTranslated is set to TRUE, and the return value is the translated
value of the control text. If the function fails, the variable
pointed to by lpTranslated is set to FALSE, and the return value is
zero. Note that, because zero is a possible translated value, a
return value of zero does not by itself indicate failure. If
lpTranslated is NULL, the function returns no information about
success or failure. Note that, if the bSigned parameter is TRUE and
there is a minus sign (?) at the beginning of the text, GetDlgItemInt
translates the text into a signed integer value. Otherwise, the
function creates an unsigned integer value. To obtain the proper
value in this case, cast the return value to an int type. To get
extended error information, call GetLastError.

[備考]
The GetDlgItemInt function retrieves the text of the specified
control by sending the control a WM_GETTEXT message. The function
translates the retrieved text by stripping any extra spaces at the
beginning of the text and then converting the decimal digits. The
function stops translating when it reaches the end of the text or
encounters a nonnumeric character. The GetDlgItemInt function returns
zero if the translated value is greater than INT_MAX (for signed
numbers) or UINT_MAX (for unsigned numbers).


%index
GetDlgItemTextW
Retrieves the title or text associated with a control in a dialog box. (Unicode)
%group
Win32 user32
%prm
hDlg, nIDDlgItem, lpString, cchMax
hDlg : [intptr] Type: HWND A handle to the dialog box that contains the control.
nIDDlgItem : [int] Type: int The identifier of the control whose title or text is to be retrieved.
lpString : [wstr] Type: LPTSTR The buffer to receive the title or text.
cchMax : [int] Type: int The maximum length, in characters, of the string to be copied to the buffer pointed to by lpString. If the length of the string, including the null character, exceeds the limit, the string is truncated.
%inst
Retrieves the title or text associated with a control in a dialog
box. (Unicode)

[戻り値]
Type: UINT If the function succeeds, the return value specifies the
number of characters copied to the buffer, not including the
terminating null character. If the function fails, the return value
is zero. To get extended error information, call GetLastError.

[備考]
If the string is as long or longer than the buffer, the buffer will
contain the truncated string with a terminating null character. The
GetDlgItemText function sends a WM_GETTEXT message to the control.


%index
GetDoubleClickTime
Retrieves the current double-click time for the mouse.
%group
Win32 user32
%prm

%inst
Retrieves the current double-click time for the mouse.

[戻り値]
Type: UINT The return value specifies the current double-click time,
in milliseconds. The maximum return value is 5000 milliseconds.


%index
GetDpiAwarenessContextForProcess
(no summary)
%group
Win32 user32
%prm
hProcess
hProcess : [intptr] 
%inst



%index
GetDpiForSystem
Returns the system DPI.
%group
Win32 user32
%prm

%inst
Returns the system DPI.

[戻り値]
The system DPI value.

[備考]
The return value will be dependent based upon the calling context. If
the current thread has a DPI_AWARENESS value of
DPI_AWARENESS_UNAWARE, the return value will be 96. That is because
the current context always assumes a DPI of 96. For any other
DPI_AWARENESS value, the return value will be the actual system DPI.
You should not cache the system DPI, but should use GetDpiForSystem
whenever you need the system DPI value.


%index
GetDpiForWindow
Returns the dots per inch (dpi) value for the specified window.
%group
Win32 user32
%prm
hwnd
hwnd : [intptr] The window that you want to get information about.
%inst
Returns the dots per inch (dpi) value for the specified window.

[戻り値]
The DPI for the window, which depends on the
[DPI_AWARENESS](/windows/win32/api/windef/ne-windef-dpi_awareness) of
the window. See the **Remarks** section for more information. An
invalid *hwnd* value will result in a return value of 0.

[備考]
The following table indicates the return value of GetDpiForWindow
based on the
[DPI_AWARENESS](/windows/win32/api/windef/ne-windef-dpi_awareness) of
the provided *hwnd*.
This doc was truncated.


%index
GetDpiFromDpiAwarenessContext
Retrieves the DPI from a given DPI_AWARENESS_CONTEXT handle. This enables you to determine the DPI of a thread without needed to examine a window created within that thread.
%group
Win32 user32
%prm
value
value : [intptr] The DPI_AWARENESS_CONTEXT handle to examine.
%inst
Retrieves the DPI from a given DPI_AWARENESS_CONTEXT handle. This
enables you to determine the DPI of a thread without needed to
examine a window created within that thread.

[戻り値]
The DPI value associated with the DPI_AWARENESS_CONTEXT handle.

[備考]
DPI_AWARENESS_CONTEXT handles associated with values of
DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE and
DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE_V2 will return a value of 0
for their DPI. This is because the DPI of a per-monitor-aware window
can change, and the actual DPI cannot be returned without the
window's HWND.


%index
GetFocus
Retrieves the handle to the window that has the keyboard focus, if the window is attached to the calling thread's message queue.
%group
Win32 user32
%prm

%inst
Retrieves the handle to the window that has the keyboard focus, if
the window is attached to the calling thread's message queue.

[戻り値]
Type: HWND The return value is the handle to the window with the
keyboard focus. If the calling thread's message queue does not have
an associated window with the keyboard focus, the return value is
NULL.

[備考]
GetFocus returns the window with the keyboard focus for the current
thread's message queue. If GetFocus returns NULL, another thread's
queue may be attached to a window that has the keyboard focus. Use
the GetForegroundWindow function to retrieve the handle to the window
with which the user is currently working. You can associate your
thread's message queue with the windows owned by another thread by
using the AttachThreadInput function. To get the window with the
keyboard focus on the foreground queue or the queue of another
thread, use the GetGUIThreadInfo function.


%index
GetForegroundWindow
フォアグラウンドウィンドウ(ユーザが現在操作しているウィンドウ)へのハンドルを取得する。システムはフォアグラウンドウィンドウを作成したスレッドに他スレッドより若干高い優先度を割り当てる。
%group
Win32 user32
%prm

%inst

フォアグラウンドウィンドウ(ユーザが現在操作しているウィンドウ)へのハンドルを取得する。システムはフォアグラウンドウィンドウを作成したスレッドに他スレッドより若干高い優先度を割り当てる。

[戻り値]
型: HWND 戻り値はフォアグラウンドウィンドウへのハンドル。特定の状況(ウィンドウがアクティベーションを失っているときなど)では
NULL になる場合がある。


%index
GetGUIThreadInfo
Retrieves information about the active window or a specified GUI thread.
%group
Win32 user32
%prm
idThread, pgui
idThread : [int] Type: DWORD The identifier for the thread for which information is to be retrieved. To retrieve this value, use the GetWindowThreadProcessId function. If this parameter is NULL, the function returns information for the foreground thread.
pgui : [var] Type: LPGUITHREADINFO A pointer to a GUITHREADINFO structure that receives information describing the thread. Note that you must set the cbSize member to sizeof(GUITHREADINFO) before calling this function.
%inst
Retrieves information about the active window or a specified GUI
thread.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
This function succeeds even if the active window is not owned by the
calling process. If the specified thread does not exist or have an
input queue, the function will fail. This function is useful for
retrieving out-of-context information about a thread. The information
retrieved is the same as if an application retrieved the information
about itself. For an edit control, the returned rcCaret rectangle
contains the caret plus information on text direction and padding.
Thus, it may not give the correct position of the cursor. The Sans
Serif font uses four characters for the cursor:
This doc was truncated.


%index
GetGestureConfig
Retrieves the configuration for which Windows Touch gesture messages are sent from a window.
%group
Win32 user32
%prm
hwnd, dwReserved, dwFlags, pcIDs, pGestureConfig, cbSize
hwnd : [intptr] A handle to the window to get the gesture configuration from.
dwReserved : [int] This value is reserved and must be set to 0.
dwFlags : [int] A gesture command flag value indicating options for retrieving the gesture configuration.  See Remarks for additional information and supported values.
pcIDs : [var] The size, in number of gesture configuration structures, that is in the pGestureConfig buffer.
pGestureConfig : [var] An array of gesture configuration structures that specify the gesture configuration.
cbSize : [int] The size of the gesture configuration (GESTURECONFIG) structure.
%inst
Retrieves the configuration for which Windows Touch gesture messages
are sent from a window.

[戻り値]
If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. To get extended
error information, use the GetLastError function.

[備考]
Passing a value other than sizeof(GESTURECONFIG) for the cbSize
parameter will cause calls to this function to fail and GetLastError
will return ERROR_INVALID_PARAMETER (87 in decimal).
The following table lists the gesture configuration values:
This doc was truncated.


%index
GetGestureExtraArgs
Retrieves additional information about a gesture from its GESTUREINFO handle.
%group
Win32 user32
%prm
hGestureInfo, cbExtraArgs, pExtraArgs
hGestureInfo : [intptr] The handle to the gesture information that is passed in the lParam of a WM_GESTURE message.
cbExtraArgs : [int] A count of the bytes of data stored in the extra arguments.
pExtraArgs : [var] A pointer to the extra argument information.
%inst
Retrieves additional information about a gesture from its GESTUREINFO
handle.

[戻り値]
If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. To get extended
error information, use the GetLastError function.

[備考]
This function is reserved for future use and should only be used for
testing. Windows 7 gestures do not use extra arguments.


%index
GetGestureInfo
Retrieves a GESTUREINFO structure given a handle to the gesture information.
%group
Win32 user32
%prm
hGestureInfo, pGestureInfo
hGestureInfo : [intptr] The gesture information handle.
pGestureInfo : [var] A pointer to the gesture information structure.
%inst
Retrieves a GESTUREINFO structure given a handle to the gesture
information.

[戻り値]
If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. To get extended
error information, use the GetLastError function.

[備考]
The cbSize member of the GESTUREINFO structure passed in to the
function must be set before the function is called. Otherwise, calls
to GetLastError will return ERROR_INVALID_PARAMETER (87 in decimal).
If an application processes a WM_GESTURE message, it is responsible
for closing the handle using CloseGestureInfoHandle. Failure to do so
may result in process memory leaks.
If the message is passed to DefWindowProc, or is forwarded using one
of the PostMessage or SendMessage classes of API functions, the
handle is transferred with the message and need not be closed by the
application.


%index
GetGuiResources
Retrieves the count of handles to graphical user interface (GUI) objects in use by the specified process.
%group
Win32 user32
%prm
hProcess, uiFlags
hProcess : [intptr] A handle to the process. The handle must refer to a process in the current session, and must have the **PROCESS_QUERY_LIMITED_INFORMATION** access right (see [Process security and access rights](/windows/win32/procthread/process-security-and-access-rights)). If this parameter is the special value **GR_GLOBAL**, then the resource usage is reported across all processes in the current session. **Windows Server?2008, Windows?Vista, Windows Server?2003, and Windows?XP:** The **GR_GLOBAL** value is not supported until Windows?7 and Windows Server?2008?R2. **Windows Server?2003 and Windows?XP:** The handle must have the **PROCESS_QUERY_INFORMATION** access right.
uiFlags : [int] 
%inst
Retrieves the count of handles to graphical user interface (GUI)
objects in use by the specified process.

[戻り値]
If the function succeeds, the return value is the count of handles to
GUI objects in use by the process. If no GUI objects are in use, the
return value is zero. If the function fails, the return value is
zero. To get extended error information, call GetLastError.

[備考]
A process without a graphical user interface does not use GUI
resources, therefore, GetGuiResources will return zero.


%index
GetIconInfo
Retrieves information about the specified icon or cursor.
%group
Win32 user32
%prm
hIcon, piconinfo
hIcon : [intptr] Type: HICON
piconinfo : [var] Type: PICONINFO A pointer to an ICONINFO structure. The function fills in the structure's members.
%inst
Retrieves information about the specified icon or cursor.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero and
the function fills in the members of the specified ICONINFO
structure. If the function fails, the return value is zero. To get
extended error information, call GetLastError.

[備考]
GetIconInfo creates bitmaps for the hbmMask and hbmColor or members
of ICONINFO. The calling application must manage these bitmaps and
delete them when they are no longer necessary. DPI Virtualization
This API does not participate in DPI virtualization. The output
returned is not affected by the DPI of the calling thread.


%index
GetIconInfoExW
Retrieves information about the specified icon or cursor. GetIconInfoEx extends GetIconInfo by using the newer ICONINFOEX structure. (Unicode)
%group
Win32 user32
%prm
hicon, piconinfo
hicon : [intptr] Type: HICON
piconinfo : [var] Type: PICONINFOEX When this method returns, contains a pointer to an ICONINFOEX structure. The function fills in the structure's members.
%inst
Retrieves information about the specified icon or cursor.
GetIconInfoEx extends GetIconInfo by using the newer ICONINFOEX
structure. (Unicode)

[戻り値]
Type: BOOL TRUE indicates success, FALSE indicates failure.

[備考]
GetIconInfoEx creates bitmaps for the hbmMask and hbmColor or members
of ICONINFOEX. The calling application must manage these bitmaps and
delete them when they are no longer necessary. DPI Virtualization
This API does not participate in DPI virtualization. The output
returned is not affected by the DPI of the calling thread. > [!NOTE]
> The winuser.h header defines GetIconInfoEx as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetInputState
Determines whether there are mouse-button or keyboard messages in the calling thread's message queue.
%group
Win32 user32
%prm

%inst
Determines whether there are mouse-button or keyboard messages in the
calling thread's message queue.

[戻り値]
Type: BOOL If the queue contains one or more new mouse-button or
keyboard messages, the return value is nonzero. If there are no new
mouse-button or keyboard messages in the queue, the return value is
zero.


%index
GetKBCodePage
Retrieves the current code page.
%group
Win32 user32
%prm

%inst
Retrieves the current code page.

[戻り値]
Type: UINT The return value is an OEM code-page identifier, or it is
the default identifier if the registry value is not readable. For a
list of OEM code-page identifiers, see Code Page Identifiers.


%index
GetKeyNameTextW
Retrieves a string that represents the name of a key. (Unicode)
%group
Win32 user32
%prm
lParam, lpString, cchSize
lParam : [int] Type: LONG The second parameter of the keyboard message (such as WM_KEYDOWN) to be processed. The function interprets the following bit positions in the lParam. | Bits  | Meaning | |-------|---------| | 16-23 | The scan code. The value depends on the OEM. | | 24    | Indicates whether the key is an extended key, such as the right-hand ALT and CTRL keys that appear on an enhanced 101- or 102-key keyboard. The value is 1 if it is an extended key; otherwise, it is 0. | | 25    | "Do not care" bit. The application calling this function sets this bit to indicate that the function should not distinguish between left and right CTRL and SHIFT keys, for example. | For more detail, see [Keystroke Message Flags](/windows/win32/inputdev/about-keyboard-input#keystroke-message-flags).
lpString : [wstr] Type: LPTSTR The buffer that will receive the key name.
cchSize : [int] Type: int The maximum length, in characters, of the key name, including the terminating null character. (This parameter should be equal to the size of the buffer pointed to by the lpString parameter.)
%inst
Retrieves a string that represents the name of a key. (Unicode)

[戻り値]
Type: int If the function succeeds, a null-terminated string is
copied into the specified buffer, and the return value is the length
of the string, in characters, not counting the terminating null
character. If the function fails, the return value is zero. To get
extended error information, call GetLastError.

[備考]
The format of the key-name string depends on the current keyboard
layout. The keyboard driver maintains a list of names in the form of
character strings for keys with names longer than a single character.
The key name is translated according to the layout of the currently
installed keyboard, thus the function may give different results for
different input locales. The name of a character key is the character
itself. The names of dead keys are spelled out in full. > [!NOTE] >
The winuser.h header defines GetKeyNameText as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetKeyState
指定された仮想キーの状態(押下/解放、トグル状態)を取得する。
%group
Win32 user32
%prm
nVirtKey
nVirtKey : [int] 型: int 仮想キー。A-Z、a-z、0-9 の場合は ASCII 値をセットする。それ以外は仮想キーコードを指定する。
%inst
指定された仮想キーの状態(押下/解放、トグル状態)を取得する。

[戻り値]
型: SHORT 戻り値は指定された仮想キーの状態を示す。
（以下省略）

[備考]

この関数が返すキーの状態は、スレッドがメッセージキューからキーメッセージを読み取るにつれて変化する。この状態はハードウェアレベルの状態を反映しない(そちらは
GetAsyncKeyState で取得する)。キーボード入力メッセージに応答して GetKeyState
を呼ぶと、入力メッセージが生成された時点のキー状態を取得できる。全仮想キーの状態は GetKeyboardState
で取得する。VK_SHIFT、VK_CONTROL、VK_MENU は SHIFT/CTRL/ALT
の左右を区別しない状態を返す。左右を区別するには VK_LSHIFT、VK_RSHIFT などを使う。


%index
GetKeyboardLayout
Retrieves the active input locale identifier (formerly called the keyboard layout).
%group
Win32 user32
%prm
idThread
idThread : [int] Type: DWORD The identifier of the thread to query, or 0 for the current thread.
%inst
Retrieves the active input locale identifier (formerly called the
keyboard layout).

[戻り値]
Type: HKL The return value is the input locale identifier for the
thread. The low word contains a Language Identifier for the input
language and the high word contains a device handle to the physical
layout of the keyboard.

[備考]
The input locale identifier is a broader concept than a keyboard
layout, since it can also encompass a speech-to-text converter, an
Input Method Editor (IME), or any other form of input. Since the
keyboard layout can be dynamically changed, applications that cache
information about the current keyboard layout should process the
WM_INPUTLANGCHANGE message to be informed of changes in the input
language. To get the KLID (keyboard layout ID) of the currently
active HKL, call the GetKeyboardLayoutName. Beginning in Windows 8:
The preferred method to retrieve the language associated with the
current keyboard layout or input method is a call to
Windows.Globalization.Language.CurrentInputMethodLanguageTag. If your
app passes language tags from CurrentInputMethodLanguageTag to any
National Language Support functions, it must first convert the tags
by calling ResolveLocaleName.


%index
GetKeyboardLayoutList
Retrieves the input locale identifiers (formerly called keyboard layout handles) corresponding to the current set of input locales in the system. The function copies the identifiers to the specified buffer.
%group
Win32 user32
%prm
nBuff, lpList
nBuff : [int] Type: int The maximum number of handles that the buffer can hold.
lpList : [intptr] Type: HKL* A pointer to the buffer that receives the array of input locale identifiers.
%inst
Retrieves the input locale identifiers (formerly called keyboard
layout handles) corresponding to the current set of input locales in
the system. The function copies the identifiers to the specified
buffer.

[戻り値]
Type: int If the function succeeds, the return value is the number of
input locale identifiers copied to the buffer or, if nBuff is zero,
the return value is the size, in array elements, of the buffer needed
to receive all current input locale identifiers. If the function
fails, the return value is zero. To get extended error information,
call GetLastError.

[備考]
The input locale identifier is a broader concept than a keyboard
layout, since it can also encompass a speech-to-text converter, an
Input Method Editor (IME), or any other form of input. Beginning in
Windows 8: The preferred method to retrieve the language associated
with the current keyboard layout or input method is a call to
Windows.Globalization.Language.CurrentInputMethodLanguageTag. If your
app passes language tags from CurrentInputMethodLanguageTag to any
National Language Support functions, it must first convert the tags
by calling ResolveLocaleName.


%index
GetKeyboardLayoutNameW
Retrieves the name of the active input locale identifier (formerly called the keyboard layout) for the system. (Unicode)
%group
Win32 user32
%prm
pwszKLID
pwszKLID : [wstr] Type: LPTSTR The buffer (of at least KL_NAMELENGTH characters in length) that receives the name of the input locale identifier, including the terminating null character. This will be a copy of the string provided to the LoadKeyboardLayout function, unless layout substitution took place. For a list of the input layouts that are supplied with Windows, see [Keyboard Identifiers and Input Method Editors for Windows](/windows-hardware/manufacture/desktop/windows-language-pack-default-values).
%inst
Retrieves the name of the active input locale identifier (formerly
called the keyboard layout) for the system. (Unicode)

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The input locale identifier is a broader concept than a keyboard
layout, since it can also encompass a speech-to-text converter, an
Input Method Editor (IME), or any other form of input. Beginning in
Windows 8: The preferred method to retrieve the language associated
with the current keyboard layout or input method is a call to
Windows.Globalization.Language.CurrentInputMethodLanguageTag. If your
app passes language tags from CurrentInputMethodLanguageTag to any
National Language Support functions, it must first convert the tags
by calling ResolveLocaleName.
> [!NOTE] > The winuser.h header defines GetKeyboardLayoutName as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetKeyboardState
Copies the status of the 256 virtual keys to the specified buffer.
%group
Win32 user32
%prm
lpKeyState
lpKeyState : [var] Type: PBYTE The 256-byte array that receives the status data for each virtual key.
%inst
Copies the status of the 256 virtual keys to the specified buffer.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
An application can call this function to retrieve the current status
of all the virtual keys. The status changes as a thread removes
keyboard messages from its message queue. The status does not change
as keyboard messages are posted to the thread's message queue, nor
does it change as keyboard messages are posted to or retrieved from
message queues of other threads. (Exception: Threads that are
connected through AttachThreadInput share the same keyboard state.)
When the function returns, each member of the array pointed to by the
lpKeyState parameter contains status data for a virtual key. If the
high-order bit is 1, the key is down; otherwise, it is up. If the key
is a toggle key, for example CAPS LOCK, then the low-order bit is 1
when the key is toggled and is 0 if the key is untoggled. The
low-order bit is meaningless for non-toggle keys. A toggle key is
said to be toggled when it is turned on. A toggle key's indicator
light (if any) on the keyboard will be on when the key is toggled,
and off when the key is untoggled. To retrieve status information for
an individual key, use the GetKeyState function. To retrieve the
current state for an individual key regardless of whether the
corresponding keyboard message has been retrieved from the message
queue, use the GetAsyncKeyState function. An application can use the
virtual-key code constants VK_SHIFT, VK_CONTROL and VK_MENU as
indices into the array pointed to by lpKeyState. This gives the
status of the SHIFT, CTRL, or ALT keys without distinguishing between
left and right. An application can also use the following virtual-key
code constants as indices to distinguish between the left and right
instances of those keys:
This doc was truncated.


%index
GetKeyboardType
Retrieves information about the current keyboard.
%group
Win32 user32
%prm
nTypeFlag
nTypeFlag : [int] Type: int
%inst
Retrieves information about the current keyboard.

[戻り値]
Type: int If the function succeeds, the return value specifies the
requested information. If the function fails and nTypeFlag is not 1,
the return value is 0; 0 is a valid return value when nTypeFlag is 1
(keyboard subtype). To get extended error information, call
GetLastError.

[備考]
Valid keyboard types are: | Value | Description |
|:-----:|------------------------------------------------------| |
0x4 | Enhanced 101- or 102-key keyboards (and compatibles) | | 0x7 |
Japanese Keyboard | | 0x8 | Korean Keyboard | | 0x51 | Unknown type
or HID keyboard | Keyboard subtypes are original equipment
manufacturer (OEM)-dependent values.


%index
GetLastActivePopup
Determines which pop-up window owned by the specified window was most recently active.
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] Type: HWND A handle to the owner window.
%inst
Determines which pop-up window owned by the specified window was most
recently active.

[戻り値]
Type: HWND The return value identifies the most recently active
pop-up window. The return value is the same as the hWnd parameter, if
any of the following conditions are met:
This doc was truncated.


%index
GetLastInputInfo
Retrieves the time of the last input event.
%group
Win32 user32
%prm
plii
plii : [var] Type: PLASTINPUTINFO A pointer to a LASTINPUTINFO structure that receives the time of the last input event.
%inst
Retrieves the time of the last input event.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero.

[備考]
This function is useful for input idle detection. However,
GetLastInputInfo does not provide system-wide user input information
across all running sessions. Rather, GetLastInputInfo provides
session-specific user input information for only the session that
invoked the function. The tick count when the last input event was
received (see LASTINPUTINFO) is not guaranteed to be incremental. In
some cases, the value might be less than the tick count of a prior
event. For example, this can be caused by a timing gap between the
raw input thread and the desktop thread or an event raised by
SendInput, which supplies its own tick count.


%index
GetLayeredWindowAttributes
Retrieves the opacity and transparency color key of a layered window.
%group
Win32 user32
%prm
hwnd, pcrKey, pbAlpha, pdwFlags
hwnd : [intptr] Type: HWND A handle to the layered window. A layered window is created by specifying WS_EX_LAYERED when creating the window with the CreateWindowEx function or by setting WS_EX_LAYERED using SetWindowLong after the window has been created.
pcrKey : [var] Type: COLORREF* A pointer to a COLORREF value that receives the transparency color key to be used when composing the layered window. All pixels painted by the window in this color will be transparent. This can be NULL if the argument is not needed.
pbAlpha : [var] Type: BYTE* The Alpha value used to describe the opacity of the layered window. Similar to the SourceConstantAlpha member of the BLENDFUNCTION structure. When the variable referred to by pbAlpha is 0, the window is completely transparent. When the variable referred to by pbAlpha is 255, the window is opaque. This can be NULL if the argument is not needed.
pdwFlags : [var] Type: DWORD*
%inst
Retrieves the opacity and transparency color key of a layered window.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
GetLayeredWindowAttributes can be called only if the application has
previously called SetLayeredWindowAttributes on the window. The
function will fail if the layered window was setup with
UpdateLayeredWindow. For more information, see Using Layered Windows.


%index
GetListBoxInfo
Retrieves the number of items per column in a specified list box.
%group
Win32 user32
%prm
hwnd
hwnd : [intptr] Type: HWND A handle to the list box whose number of items per column is to be retrieved.
%inst
Retrieves the number of items per column in a specified list box.

[戻り値]
Type: DWORD The return value is the number of items per column.


%index
GetMenu
Retrieves a handle to the menu assigned to the specified window.
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] Type: HWND A handle to the window whose menu handle is to be retrieved.
%inst
Retrieves a handle to the menu assigned to the specified window.

[戻り値]
Type: HMENU The return value is a handle to the menu. If the
specified window has no menu, the return value is NULL. If the window
is a child window, the return value is undefined.

[備考]
GetMenu does not work on floating menu bars. Floating menu bars are
custom controls that mimic standard menus; they are not menus. To get
the handle on a floating menu bar, use the Active Accessibility APIs.


%index
GetMenuBarInfo
Retrieves information about the specified menu bar.
%group
Win32 user32
%prm
hwnd, idObject, idItem, pmbi
hwnd : [intptr] Type: HWND A handle to the window (menu bar) whose information is to be retrieved.
idObject : [int] Type: LONG
idItem : [int] Type: LONG The item for which to retrieve information. If this parameter is zero, the function retrieves information about the menu itself. If this parameter is 1, the function retrieves information about the first item on the menu, and so on.
pmbi : [var] Type: PMENUBARINFO A pointer to a MENUBARINFO structure that receives the information. Note that you must set the cbSize member to sizeof(MENUBARINFO) before calling this function.
%inst
Retrieves information about the specified menu bar.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
GetMenuCheckMarkDimensions
Retrieves the dimensions of the default check-mark bitmap.
%group
Win32 user32
%prm

%inst
Retrieves the dimensions of the default check-mark bitmap.

[戻り値]
Type: LONG The return value specifies the height and width, in
pixels, of the default check-mark bitmap. The high-order word
contains the height; the low-order word contains the width.


%index
GetMenuContextHelpId
Retrieves the Help context identifier associated with the specified menu.
%group
Win32 user32
%prm
param0
param0 : [intptr] 
%inst
Retrieves the Help context identifier associated with the specified
menu.

[戻り値]
Type: DWORD Returns the Help context identifier if the menu has one,
or zero otherwise.


%index
GetMenuDefaultItem
Determines the default menu item on the specified menu.
%group
Win32 user32
%prm
hMenu, fByPos, gmdiFlags
hMenu : [intptr] Type: HMENU A handle to the menu for which to retrieve the default menu item.
fByPos : [int] Type: UINT Indicates whether to retrieve the menu item's identifier or its position. If this parameter is FALSE, the identifier is returned. Otherwise, the position is returned.
gmdiFlags : [int] Type: UINT
%inst
Determines the default menu item on the specified menu.

[戻り値]
Type: UINT If the function succeeds, the return value is the
identifier or position of the menu item. If the function fails, the
return value is -1. To get extended error information, call
GetLastError.


%index
GetMenuInfo
Retrieves information about a specified menu.
%group
Win32 user32
%prm
param0, param1
param0 : [intptr] 
param1 : [var] 
%inst
Retrieves information about a specified menu.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
GetMenuItemCount
Determines the number of items in the specified menu.
%group
Win32 user32
%prm
hMenu
hMenu : [intptr] Type: HMENU A handle to the menu to be examined.
%inst
Determines the number of items in the specified menu.

[戻り値]
Type: int If the function succeeds, the return value specifies the
number of items in the menu. If the function fails, the return value
is -1. To get extended error information, call GetLastError.


%index
GetMenuItemID
Retrieves the menu item identifier of a menu item located at the specified position in a menu.
%group
Win32 user32
%prm
hMenu, nPos
hMenu : [intptr] Type: HMENU A handle to the menu that contains the item whose identifier is to be retrieved.
nPos : [int] Type: int The zero-based relative position of the menu item whose identifier is to be retrieved.
%inst
Retrieves the menu item identifier of a menu item located at the
specified position in a menu.

[戻り値]
Type: UINT The return value is the identifier of the specified menu
item. If the menu item identifier is NULL or if the specified item
opens a submenu, the return value is -1.


%index
GetMenuItemInfoW
Retrieves information about a menu item. (Unicode)
%group
Win32 user32
%prm
hmenu, item, fByPosition, lpmii
hmenu : [intptr] Type: HMENU A handle to the menu that contains the menu item.
item : [int] Type: UINT The identifier or position of the menu item to get information about. The meaning of this parameter depends on the value of fByPosition.
fByPosition : [int] Type: BOOL The meaning of uItem. If this parameter is FALSE, uItem is a menu item identifier. Otherwise, it is a menu item position. See Accessing Menu Items Programmatically for more information.
lpmii : [var] Type: LPMENUITEMINFO A pointer to a MENUITEMINFO structure that specifies the information to retrieve and receives information about the menu item. Note that you must set the cbSize member to sizeof(MENUITEMINFO) before calling this function.
%inst
Retrieves information about a menu item. (Unicode)

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, use the GetLastError function.

[備考]
To retrieve a menu item of type MFT_STRING, first find the size of
the string by setting the dwTypeData member of MENUITEMINFO to NULL
and then calling GetMenuItemInfo. The value of cch+1 is the size
needed. Then allocate a buffer of this size, place the pointer to the
buffer in dwTypeData, increment cch by one, and then call
GetMenuItemInfo once again to fill the buffer with the string. If the
retrieved menu item is of some other type, then GetMenuItemInfo sets
the dwTypeData member to a value whose type is specified by the
fTypefType member and sets cch to 0.


%index
GetMenuItemRect
Retrieves the bounding rectangle for the specified menu item.
%group
Win32 user32
%prm
hWnd, hMenu, uItem, lprcItem
hWnd : [intptr] Type: HWND A handle to the window containing the menu. If this value is NULL and the hMenu parameter represents a popup menu, the function will find the menu window.
hMenu : [intptr] Type: HMENU A handle to a menu.
uItem : [int] Type: UINT The zero-based position of the menu item.
lprcItem : [var] Type: LPRECT A pointer to a RECT structure that receives the bounding rectangle of the specified menu item expressed in screen coordinates.
%inst
Retrieves the bounding rectangle for the specified menu item.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, use the GetLastError function.

[備考]
In order for the returned rectangle to be meaningful, the menu must
be popped up if a popup menu or attached to a window if a menu bar.
Menu item positions are not determined until the menu is displayed.


%index
GetMenuState
Retrieves the menu flags associated with the specified menu item.
%group
Win32 user32
%prm
hMenu, uId, uFlags
hMenu : [intptr] Type: HMENU A handle to the menu that contains the menu item whose flags are to be retrieved.
uId : [int] Type: UINT The menu item for which the menu flags are to be retrieved, as determined by the uFlags parameter.
uFlags : [int] Type: UINT
%inst
Retrieves the menu flags associated with the specified menu item.

[戻り値]
Type: UINT If the specified item does not exist, the return value is
-1. If the menu item opens a submenu, the low-order byte of the
return value contains the menu flags associated with the item, and
the high-order byte contains the number of items in the submenu
opened by the item. Otherwise, the return value is a mask (Bitwise
OR) of the menu flags. Following are the menu flags associated with
the menu item.
This doc was truncated.

[備考]
It is possible to test an item for a flag value of MF_ENABLED,
MF_STRING, MF_UNCHECKED, or MF_UNHILITE. However, since these values
equate to zero you must use an expression to test for them.
This doc was truncated.


%index
GetMenuStringW
Copies the text string of the specified menu item into the specified buffer. (Unicode)
%group
Win32 user32
%prm
hMenu, uIDItem, lpString, cchMax, flags
hMenu : [intptr] Type: HMENU A handle to the menu.
uIDItem : [int] Type: UINT The menu item to be changed, as determined by the uFlag parameter.
lpString : [wstr] Type: LPTSTR The buffer that receives the null-terminated string. If the string is as long or longer than lpString, the string is truncated and the terminating null character is added. If lpString is NULL, the function returns the length of the menu string.
cchMax : [int] Type: int The maximum length, in characters, of the string to be copied. If the string is longer than the maximum specified in the nMaxCount parameter, the extra characters are truncated. If nMaxCount is 0, the function returns the length of the menu string.
flags : [int] Type: UINT
%inst
Copies the text string of the specified menu item into the specified
buffer. (Unicode)

[戻り値]
Type: int If the function succeeds, the return value specifies the
number of characters copied to the buffer, not including the
terminating null character. If the function fails, the return value
is zero. If the specified item is not of type MIIM_STRING or
MFT_STRING, then the return value is zero.

[備考]
The nMaxCount parameter must be one larger than the number of
characters in the text string to accommodate the terminating null
character. If nMaxCount is 0, the function returns the length of the
menu string. Security Warning The lpString parameter is a TCHAR
buffer, and nMaxCount is the length of the menu string in characters.
Sizing these parameters incorrectly can cause truncation of the
string, leading to possible loss of data.


%index
GetMessageW
呼び出し元スレッドのメッセージキューからメッセージを取得する。取得可能な投稿メッセージが得られるまで、着信送信メッセージを配送する。(GetMessageW)
%group
Win32 user32
%prm
lpMsg, hWnd, wMsgFilterMin, wMsgFilterMax
lpMsg : [var] 型: LPMSG スレッドのメッセージキューからメッセージ情報を受け取る MSG 構造体へのポインタ。
hWnd : [intptr] 型: HWND メッセージを取得するウィンドウへのハンドル。ウィンドウは現在のスレッドに属している必要がある。
wMsgFilterMin : [int] 型: UINT 取得するメッセージ値の最小値。最初のキーボードメッセージを指定するには WM_KEYFIRST (0x0100)、最初のマウスメッセージを指定するには WM_MOUSEFIRST (0x0200) を使う。WM_INPUT メッセージのみを指定するには wMsgFilterMin と wMsgFilterMax の両方に WM_INPUT を指定する。wMsgFilterMin と wMsgFilterMax がともに 0 の場合、GetMessage は範囲フィルタリングを行わずすべてのメッセージを返す。
wMsgFilterMax : [int] 型: UINT 取得するメッセージ値の最大値。最後のキーボードメッセージを指定するには WM_KEYLAST、最後のマウスメッセージを指定するには WM_MOUSELAST を使う。
%inst

呼び出し元スレッドのメッセージキューからメッセージを取得する。取得可能な投稿メッセージが得られるまで、着信送信メッセージを配送する。(GetMessageW)

[戻り値]
型: BOOL 関数が WM_QUIT 以外のメッセージを取得した場合、戻り値は 0 以外。WM_QUIT を取得した場合は
0。エラーの場合は -1。たとえば hWnd が無効なウィンドウハンドル、または lpMsg
が無効なポインタの場合に失敗する。拡張エラー情報を得るには GetLastError を呼び出す。戻り値が 0 以外、0、-1
のいずれにもなりうるため、次のようなコードは避けること:
（以下省略）

[備考]
アプリケーションは通常、戻り値を使ってメインメッセージループを終了しプログラムを抜けるかどうかを判断する。GetMessage は
hWnd パラメータで指定されたウィンドウ(および IsChild
で判定されるその子)に関連付けられたメッセージのうち、wMsgFilterMin と wMsgFilterMax
の範囲内のものを取得する。これらのパラメータで使用できるのは下位ワードのみで、上位ワードはシステム予約である。wMsgFilterMin
と wMsgFilterMax に何を指定しても GetMessage は常に WM_QUIT
メッセージを取得する点に注意。この呼び出し中、システムは保留中のノンキューメッセージ(SendMessage、SendMessageCallback、SendMessageTimeout、SendNotifyMessage
により呼び出し元スレッド所有のウィンドウに送信されたメッセージ)を配送する。その後、指定フィルタに一致する最初のキューメッセージが取得される。システムは内部イベントも処理する場合がある。フィルタが指定されていない場合、メッセージは次の順で処理される:
（以下省略）


%index
GetMessageExtraInfo
Retrieves the extra message information for the current thread. Extra message information is an application- or driver-defined value associated with the current thread's message queue.
%group
Win32 user32
%prm

%inst
Retrieves the extra message information for the current thread. Extra
message information is an application- or driver-defined value
associated with the current thread's message queue.

[戻り値]
Type: LPARAM The return value specifies the extra information. The
meaning of the extra information is device specific.

[備考]
To set a thread's extra message information, use the
SetMessageExtraInfo function.


%index
GetMessagePos
Retrieves the cursor position for the last message retrieved by the GetMessage function.
%group
Win32 user32
%prm

%inst
Retrieves the cursor position for the last message retrieved by the
GetMessage function.

[戻り値]
Type: DWORD The return value specifies the x- and y-coordinates of
the cursor position. The x-coordinate is the low order short and the
y-coordinate is the high-order short.

[備考]
As noted above, the x-coordinate is in the low-order short of the
return value; the y-coordinate is in the high-order short (both
represent signed values because they can take negative values on
systems with multiple monitors). If the return value is assigned to a
variable, you can use the MAKEPOINTS macro to obtain a POINTS
structure from the return value. You can also use the GET_X_LPARAM or
GET_Y_LPARAM macro to extract the x- or y-coordinate. Important Do
not use the LOWORD or HIWORD macros to extract the x- and y-
coordinates of the cursor position because these macros return
incorrect results on systems with multiple monitors. Systems with
multiple monitors can have negative x- and y- coordinates, and LOWORD
and HIWORD treat the coordinates as unsigned quantities.


%index
GetMessageTime
Retrieves the message time for the last message retrieved by the GetMessage function.
%group
Win32 user32
%prm

%inst
Retrieves the message time for the last message retrieved by the
GetMessage function.

[戻り値]
Type: LONG The return value specifies the message time.

[備考]
The return value from the GetMessageTime function does not
necessarily increase between subsequent messages, because the value
wraps to the minimum value for a long integer if the timer count
exceeds the maximum value for a long integer. To calculate time
delays between messages, subtract the time of the first message from
the time of the second message (ignoring overflow) and compare the
result of the subtraction against the desired delay amount.


%index
GetMonitorInfoW
The GetMonitorInfo function retrieves information about a display monitor. (Unicode)
%group
Win32 user32
%prm
hMonitor, lpmi
hMonitor : [intptr] A handle to the display monitor of interest.
lpmi : [var] A pointer to a MONITORINFO or MONITORINFOEX structure that receives information about the specified display monitor. You must set the cbSize member of the structure to sizeof(MONITORINFO) or sizeof(MONITORINFOEX) before calling the GetMonitorInfo function. Doing so lets the function determine the type of structure you are passing to it. The MONITORINFOEX structure is a superset of the MONITORINFO structure. It has one additional member: a string that contains a name for the display monitor. Most applications have no use for a display monitor name, and so can save some bytes by using a MONITORINFO structure.
%inst
The GetMonitorInfo function retrieves information about a display
monitor. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
> [!NOTE] > The winuser.h header defines GetMonitorInfo as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetMouseMovePointsEx
Retrieves a history of up to 64 previous coordinates of the mouse or pen.
%group
Win32 user32
%prm
cbSize, lppt, lpptBuf, nBufPoints, resolution
cbSize : [int] Type: UINT The size, in bytes, of the MOUSEMOVEPOINT structure.
lppt : [var] Type: LPMOUSEMOVEPOINT A pointer to a MOUSEMOVEPOINT structure containing valid mouse coordinates (in screen coordinates). It may also contain a time stamp. The GetMouseMovePointsEx function searches for the point in the mouse coordinates history. If the function finds the point, it returns the last nBufPoints prior to and including the supplied point. If your application supplies a time stamp, the GetMouseMovePointsEx function will use it to differentiate between two equal points that were recorded at different times. An application should call this function using the mouse coordinates received from the WM_MOUSEMOVE message and convert them to screen coordinates.
lpptBuf : [var] Type: LPMOUSEMOVEPOINT A pointer to a buffer that will receive the points. It should be at least cbSize* nBufPoints in size.
nBufPoints : [int] Type: int The number of points to be retrieved.
resolution : [int] Type: DWORD
%inst
Retrieves a history of up to 64 previous coordinates of the mouse or
pen.

[戻り値]
Type: int If the function succeeds, the return value is the number of
points in the buffer. Otherwise, the function returns ?1. For
extended error information, your application can call GetLastError.

[備考]
The system retains the last 64 mouse coordinates and their time
stamps. If your application supplies a mouse coordinate to
GetMouseMovePointsEx and the coordinate exists in the system's mouse
coordinate history, the function retrieves the specified number of
coordinates from the systems' history. You can also supply a time
stamp, which will be used to differentiate between identical points
in the history. The GetMouseMovePointsEx function will return points
that eventually were dispatched not only to the calling thread but
also to other threads. GetMouseMovePointsEx may fail or return
erroneous values in the following cases:
This doc was truncated.


%index
GetNextDlgGroupItem
Retrieves a handle to the first control in a group of controls that precedes (or follows) the specified control in a dialog box.
%group
Win32 user32
%prm
hDlg, hCtl, bPrevious
hDlg : [intptr] Type: HWND A handle to the dialog box to be searched.
hCtl : [intptr] Type: HWND A handle to the control to be used as the starting point for the search. If this parameter is NULL, the function uses the last (or first) control in the dialog box as the starting point for the search.
bPrevious : [int] Type: BOOL Indicates how the function is to search the group of controls in the dialog box. If this parameter is TRUE, the function searches for the previous control in the group. If it is FALSE, the function searches for the next control in the group.
%inst
Retrieves a handle to the first control in a group of controls that
precedes (or follows) the specified control in a dialog box.

[戻り値]
Type: HWND If the function succeeds, the return value is a handle to
the previous (or next) control in the group of controls. If the
function fails, the return value is NULL. To get extended error
information, call GetLastError.

[備考]
The GetNextDlgGroupItem function searches controls in the order (or
reverse order) they were created in the dialog box template. The
first control in the group must have the WS_GROUP style; all other
controls in the group must have been consecutively created and must
not have the WS_GROUP style. When searching for the previous control,
the function returns the first control it locates that is visible and
not disabled. If the control specified by hCtl has the WS_GROUP
style, the function temporarily reverses the search to locate the
first control having the WS_GROUP style, then resumes the search in
the original direction, returning the first control it locates that
is visible and not disabled, or returning hCtl if no such control is
found. When searching for the next control, the function returns the
first control it locates that is visible, not disabled, and does not
have the WS_GROUP style. If it encounters a control having the
WS_GROUP style, the function reverses the search, locates the first
control having the WS_GROUP style, and returns this control if it is
visible and not disabled. Otherwise, the function resumes the search
in the original direction and returns the first control it locates
that is visible and not disabled, or returns hCtl if no such control
is found. If the search for the next control in the group encounters
a window with the WS_EX_CONTROLPARENT style, the system recursively
searches the window's children.


%index
GetNextDlgTabItem
Retrieves a handle to the first control that has the WS_TABSTOP style that precedes (or follows) the specified control.
%group
Win32 user32
%prm
hDlg, hCtl, bPrevious
hDlg : [intptr] Type: HWND A handle to the dialog box to be searched.
hCtl : [intptr] Type: HWND A handle to the control to be used as the starting point for the search. If this parameter is NULL, the function fails.
bPrevious : [int] Type: BOOL Indicates how the function is to search the dialog box. If this parameter is TRUE, the function searches for the previous control in the dialog box. If this parameter is FALSE, the function searches for the next control in the dialog box.
%inst
Retrieves a handle to the first control that has the WS_TABSTOP style
that precedes (or follows) the specified control.

[戻り値]
Type: HWND If the function succeeds, the return value is the window
handle of the previous (or next) control that has the WS_TABSTOP
style set. If the function fails, the return value is NULL. To get
extended error information, call GetLastError.

[備考]
The GetNextDlgTabItem function searches controls in the order (or
reverse order) they were created in the dialog box template. The
function returns the first control it locates that is visible, not
disabled, and has the WS_TABSTOP style. If no such control exists,
the function returns hCtl. If the search for the next control with
the WS_TABSTOP style encounters a window with the WS_EX_CONTROLPARENT
style, the system recursively searches the window's children.


%index
GetOpenClipboardWindow
Retrieves the handle to the window that currently has the clipboard open.
%group
Win32 user32
%prm

%inst
Retrieves the handle to the window that currently has the clipboard
open.

[戻り値]
Type: HWND If the function succeeds, the return value is the handle
to the window that has the clipboard open. If no window has the
clipboard open, the return value is NULL. To get extended error
information, call GetLastError.

[備考]
If an application or DLL specifies a NULL window handle when calling
the OpenClipboard function, the clipboard is opened but is not
associated with a window. In such a case, GetOpenClipboardWindow
returns NULL.


%index
GetParent
指定したウィンドウの親またはオーナーへのハンドルを取得する。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND 親ウィンドウハンドルを取得するウィンドウへのハンドル。
%inst
指定したウィンドウの親またはオーナーへのハンドルを取得する。

[戻り値]
型: HWND ウィンドウが子ウィンドウの場合、戻り値は親ウィンドウへのハンドル。WS_POPUP
スタイルのトップレベルウィンドウの場合、戻り値はオーナーウィンドウへのハンドル。失敗した場合は NULL。拡張エラー情報を得るには
GetLastError を呼び出す。この関数は通常、次のいずれかの理由で失敗する:
（以下省略）

[備考]
ウィンドウのオーナーウィンドウを取得するには、GetParent ではなく GW_OWNER フラグを指定した GetWindow
を使う。オーナーではなく親ウィンドウを取得するには、GetParent ではなく GA_PARENT フラグを指定した
GetAncestor を使う。


%index
GetPhysicalCursorPos
Retrieves the position of the cursor in physical coordinates.
%group
Win32 user32
%prm
lpPoint
lpPoint : [var] Type: LPPOINT The position of the cursor, in physical coordinates.
%inst
Retrieves the position of the cursor in physical coordinates.

[戻り値]
Type: BOOL TRUE if successful; otherwise FALSE.
GetLastError can be called to get more information about any error
that is generated.

[備考]
For a description of the difference between logical coordinates and
physical coordinates, see PhysicalToLogicalPoint.


%index
GetPointerCursorId
Retrieves the cursor identifier associated with the specified pointer.
%group
Win32 user32
%prm
pointerId, cursorId
pointerId : [int] An identifier of the pointer for which to retrieve the cursor identifier.
cursorId : [var] An address of a UINT32 to receive the tablet cursor identifier, if any, associated with the specified pointer.
%inst
Retrieves the cursor identifier associated with the specified
pointer.

[戻り値]
If the function succeeds, the return value is non-zero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Cursor objects represent pointing and selecting devices used with
digitizer devices, most commonly tactile contacts on touch digitizers
and tablet pens on pen digitizers. Physical pens may have multiple
tips (such as normal and eraser ends), with each pen tip representing
a different cursor object. Each cursor object has an associated
cursor identifier. For pointer types that derive from these cursor
objects, an application can use the GetPointerCursorId function to
retrieve the cursor identifier associated with a pointer.


%index
GetPointerDevice
Gets information about the pointer device.
%group
Win32 user32
%prm
device, pointerDevice
device : [intptr] The handle to the device.
pointerDevice : [var] A POINTER_DEVICE_INFO structure that contains information about the pointer device.
%inst
Gets information about the pointer device.

[戻り値]
If this function succeeds, it returns TRUE. Otherwise, it returns
FALSE. To retrieve extended error information, call the GetLastError
function.


%index
GetPointerDeviceCursors
Gets the cursor IDs that are mapped to the cursors associated with a pointer device.
%group
Win32 user32
%prm
device, cursorCount, deviceCursors
device : [intptr] The device handle.
cursorCount : [var] The number of cursors associated with the pointer device.
deviceCursors : [var] An array of POINTER_DEVICE_CURSOR_INFO structures that contain info about the cursors. If NULL, cursorCount returns the number of cursors associated with the pointer device.
%inst
Gets the cursor IDs that are mapped to the cursors associated with a
pointer device.

[戻り値]
TRUE if the function succeeds; otherwise, FALSE. If the function
fails, call the GetLastError function for more information.


%index
GetPointerDeviceProperties
Gets device properties that aren't included in the POINTER_DEVICE_INFO structure.
%group
Win32 user32
%prm
device, propertyCount, pointerProperties
device : [intptr] The pointer device to query properties from. A call to the GetPointerDevices function returns this handle in the POINTER_DEVICE_INFO structure.
propertyCount : [var] The number  of properties. Returns the count that's written or needed if pointerProperties is NULL. If this value is less than the number of properties that the pointer device supports and pointerProperties is not NULL, the function returns the actual number of properties in this variable and fails.
pointerProperties : [var] The array of properties.
%inst
Gets device properties that aren't included in the
POINTER_DEVICE_INFO structure.

[戻り値]
TRUE if the function succeeds; otherwise, FALSE. If the function
fails, call the GetLastError function for more information.


%index
GetPointerDeviceRects
Gets the x and y range for the pointer device (in himetric) and the x and y range (current resolution) for the display that the pointer device is mapped to.
%group
Win32 user32
%prm
device, pointerDeviceRect, displayRect
device : [intptr] The handle to the pointer device.
pointerDeviceRect : [var] The structure for retrieving the device's physical range data.
displayRect : [var] The structure for retrieving the display resolution.
%inst
Gets the x and y range for the pointer device (in himetric) and the x
and y range (current resolution) for the display that the pointer
device is mapped to.

[戻り値]
TRUE if the function succeeds; otherwise, FALSE. If the function
fails, call the GetLastError function for more information.


%index
GetPointerDevices
Gets information about the pointer devices attached to the system.
%group
Win32 user32
%prm
deviceCount, pointerDevices
deviceCount : [var] If pointerDevices is NULL, deviceCount returns the total number of attached pointer devices. Otherwise, deviceCount specifies the number of POINTER_DEVICE_INFO structures pointed to by pointerDevices.
pointerDevices : [var] Array of POINTER_DEVICE_INFO structures for the pointer devices attached to the system. If NULL, the total number of attached pointer devices is returned in deviceCount.
%inst
Gets information about the pointer devices attached to the system.

[戻り値]
If this function succeeds, it returns TRUE. Otherwise, it returns
FALSE. To retrieve extended error information, call the GetLastError
function.

[備考]
Windows 8 supports the following:
This doc was truncated.


%index
GetPointerFrameInfo
Gets the entire frame of information for the specified pointers associated with the current message.
%group
Win32 user32
%prm
pointerId, pointerCount, pointerInfo
pointerId : [int] An identifier of the pointer for which to retrieve frame information.
pointerCount : [var] A pointer to a variable that specifies the count of structures in the buffer to which pointerInfo points. If GetPointerFrameInfo succeeds, pointerCount is updated with the total count of pointers in the frame.
pointerInfo : [var] Address of an array of POINTER_INFO structures to receive the pointer information. This parameter can be NULL if *pointerCount is zero.
%inst
Gets the entire frame of information for the specified pointers
associated with the current message.

[戻り値]
If the function succeeds, the return value is non-zero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Parallel-mode devices may report pointer input in frames, that is,
they may report the state and position of all pointers from that
device in a single input report to the system. Ideally, applications
should view the entire frame as a single input unless the
application-specific requirements dictate otherwise.
GetPointerFrameInfo retrieves the entire pointer input frame
associated with a pointer message. Use GetPointerInfo to retrieve
information for a single pointer associated with a pointer message.
The frame contains only pointers that are currently owned by the same
window as the specified pointer. The information returned by
GetPointerFrameInfo is associated with the most recent pointer
message retrieved by the calling thread. When the next message is
retrieved by the calling thread, the information associated with the
previous message may no longer be available.
If the application does not process pointer input messages as fast as
they are generated, some messages may be coalesced into a
WM_POINTERUPDATE message. Use GetPointerFrameInfoHistory to retrieve
the message history from the most recent WM_POINTERUPDATE message.
Having retrieved the entire frame of information, the application can
then call the SkipPointerFrameMessages function to skip remaining
pointer messages associated with this frame that are pending
retrieval. This saves the application the overhead of retrieving and
processing the remaining messages one by one. However, the
SkipPointerFrameMessages function should be used with care and only
when the caller can be sure that no other entity on the caller’s
thread is expecting to see the remaining pointer messages one by one
as they are retrieved. Note that the information retrieved is
associated with the pointer frame most recently retrieved by the
calling thread. Once the calling thread retrieves its next message,
the information associated with the previous pointer frame may no
longer be available. If the pointer frame contains no additional
pointers besides the specified pointer, this function succeeds and
returns only the information for the specified pointer. If the
information associated with the pointer frame is no longer available,
this function fails with the last error set to ERROR_NO_DATA. If the
calling thread does not own the window (where the input was
originally delivered or where the message was forwarded) to which the
pointer message has been delivered, this function fails with the last
error set to ERROR_ACCESS_DENIED. For apps that have both client and
non-client areas, the input frame can include both client and
non-client data. To differentiate between client and non-client data,
you must perform hit testing on the target window. We recommend the
following if you want to filter data from the input frame:
This doc was truncated.


%index
GetPointerFrameInfoHistory
Gets the entire frame of information (including coalesced input frames) for the specified pointers associated with the current message.
%group
Win32 user32
%prm
pointerId, entriesCount, pointerCount, pointerInfo
pointerId : [int] An identifier of the pointer for which to retrieve frame information.
entriesCount : [var] A pointer to a variable that specifies the count of rows in the two-dimensional array to which pointerInfo points. If GetPointerFrameInfoHistory succeeds, entriesCount is updated with the total count of frames available in the history.
pointerCount : [var] A pointer to a variable that specifies the count of columns in the two-dimensional array to which pointerInfo points. If GetPointerFrameInfoHistory succeeds, pointerCount is updated with the total count of pointers in each frame.
pointerInfo : [var] Address of a two-dimensional array of POINTER_INFO structures to receive the pointer information. This parameter can be NULL if *entriesCount and *pointerCount are both zero. This array is interpreted as POINTER_INFO[*entriesCount][*pointerCount].
%inst
Gets the entire frame of information (including coalesced input
frames) for the specified pointers associated with the current
message.

[戻り値]
If the function succeeds, the return value is non-zero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Parallel-mode devices may report pointer input in frames, that is,
they may report the state and position of all pointers from that
device in a single input report to the system. Ideally, applications
should view the entire frame as a single input unless the
application-specific requirements dictate otherwise. The information
returned by GetPointerFrameInfo is associated with the most recent
pointer message retrieved by the calling thread. When the next
message is retrieved by the calling thread, the information
associated with the previous message may no longer be available. If
the application does not process pointer input messages as fast as
they are generated, some messages may be coalesced into a
WM_POINTERUPDATE message. Use GetPointerFrameInfoHistory to retrieve
the message history (including coalesced input frames) from the most
recent WM_POINTERUPDATE message. Having retrieved the entire frame of
information, the application can then call the
SkipPointerFrameMessages function to skip remaining pointer messages
associated with this frame that are pending retrieval. This saves the
application the overhead of retrieving and processing the remaining
messages one by one. However, the SkipPointerFrameMessages function
should be used with care and only when the caller can be sure that no
other entity on the caller’s thread is expecting to see the remaining
pointer messages one by one as they are retrieved. The frame contains
only pointers that are currently owned by the same window as the
specified pointer. The information retrieved represents a
two-dimensional array with one row for each history entry and one
column for each pointer in the frame. The information retrieved
appears in reverse chronological order, with the most recent entry in
the first row of the returned array. The most recent entry is the
same as that returned by the GetPointerFrameInfo function. If the
count of rows in the buffer provided is insufficient to hold all
available history entries, this function succeeds with the buffer
containing the most recent entries and *entriesCount containing the
total count of entries available.
If the pointer frame contains no additional pointers besides the
specified pointer, this function succeeds and returns only the
information for the specified pointer. If the information associated
with the pointer frame is no longer available, this function fails
with the last error set to ERROR_NO_DATA. If the calling thread does
not own the window (where the input was originally delivered or where
the message was forwarded) to which the pointer message has been
delivered, this function fails with the last error set to
ERROR_ACCESS_DENIED. For apps that have both client and non-client
areas, the input frame can include both client and non-client data.
To differentiate between client and non-client data, you must perform
hit testing on the target window. We recommend the following if you
want to filter data from the input frame:
This doc was truncated.


%index
GetPointerFramePenInfo
Gets the entire frame of pen-based information for the specified pointers (of type PT_PEN) associated with the current message.
%group
Win32 user32
%prm
pointerId, pointerCount, penInfo
pointerId : [int] An identifier of the pointer for which to retrieve frame information.
pointerCount : [var] A pointer to a variable that specifies the count of structures in the buffer to which penInfo points. If GetPointerFramePenInfo succeeds, pointerCount  is updated with the total count of pointers in the frame.
penInfo : [var] Address of an array of POINTER_PEN_INFO structures to receive the pointer information. This parameter can be NULL if *pointerCount is zero.
%inst
Gets the entire frame of pen-based information for the specified
pointers (of type PT_PEN) associated with the current message.

[戻り値]
If the function succeeds, the return value is non-zero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Parallel-mode devices may report pointer input in frames, that is,
they may report the state and position of all pointers from that
device in a single input report to the system. Ideally, applications
should view the entire frame as a single input unless the
application-specific requirements dictate otherwise.
GetPointerFramePenInfo retrieves the entire pointer input frame
associated with a pointer (of type PT_PEN) message. Use
GetPointerPenInfo to retrieve information for a single pointer
associated with a pointer message. The frame contains only pointers
that are currently owned by the same window as the specified pointer.
The information returned by GetPointerFrameInfo is associated with
the most recent pointer message retrieved by the calling thread. When
the next message is retrieved by the calling thread, the information
associated with the previous message may no longer be available.
If the application does not process pointer input messages as fast as
they are generated, some messages may be coalesced into a
WM_POINTERUPDATE message. Use GetPointerFramePenInfoHistory to
retrieve the message history from the most recent WM_POINTERUPDATE
message. Having retrieved the entire frame of information, the
application can then call the SkipPointerFrameMessages function to
skip remaining pointer messages associated with this frame that are
pending retrieval. This saves the application the overhead of
retrieving and processing the remaining messages one by one. However,
the SkipPointerFrameMessages function should be used with care and
only when the caller can be sure that no other entity on the caller’s
thread is expecting to see the remaining pointer messages one by one
as they are retrieved. Note that the information retrieved is
associated with the pointer frame most recently retrieved by the
calling thread. Once the calling thread retrieves its next message,
the information associated with the previous pointer frame may no
longer be available. If the pointer frame contains no additional
pointers besides the specified pointer, this function succeeds and
returns only the information for the specified pointer. If the
information associated with the pointer frame is no longer available,
this function fails with the last error set to ERROR_NO_DATA. If the
calling thread does not own the window to which the pointer message
has been delivered, this function fails with the last error set to
ERROR_ACCESS_DENIED. If the specified pointer is not of type PT_PEN,
this function fails with the last error set to
ERROR_DATATYPE_MISMATCH.
For apps that have both client and non-client areas, the input frame
can include both client and non-client data. To differentiate between
client and non-client data, you must perform hit testing on the
target window. We recommend the following if you want to filter data
from the input frame:
This doc was truncated.


%index
GetPointerFramePenInfoHistory
Gets the entire frame of pen-based information (including coalesced input frames) for the specified pointers (of type PT_PEN) associated with the current message.
%group
Win32 user32
%prm
pointerId, entriesCount, pointerCount, penInfo
pointerId : [int] The identifier of the pointer for which to retrieve frame information.
entriesCount : [var] A pointer to a variable that specifies the count of rows in the two-dimensional array to which penInfo points. If GetPointerFramePenInfoHistory succeeds,  entriesCount is updated with the total count of frames available in the history.
pointerCount : [var] A pointer to a variable that specifies the count of columns in the two-dimensional array to which penInfo points. If GetPointerFramePenInfoHistory succeeds, pointerCount is updated with  the total count of pointers in each frame.
penInfo : [var] Address of a two-dimensional array of POINTER_PEN_INFO structures to receive the pointer information. This parameter can be NULL if *entriesCount and *pointerCount are both zero.
%inst
Gets the entire frame of pen-based information (including coalesced
input frames) for the specified pointers (of type PT_PEN) associated
with the current message.

[戻り値]
If the function succeeds, the return value is non-zero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Parallel-mode devices may report pointer input in frames, that is,
they may report the state and position of all pointers from that
device in a single input report to the system. Ideally, applications
should view the entire frame as a single input unless the
application-specific requirements dictate otherwise. The information
returned by GetPointerFramePenInfo is associated with the most recent
pointer (PT_PEN) message retrieved by the calling thread. When the
next message is retrieved by the calling thread, the information
associated with the previous message may no longer be available. If
the application does not process pointer input messages as fast as
they are generated, some messages may be coalesced into a
WM_POINTERUPDATE message. Use GetPointerFramePenInfoHistory to
retrieve the message history (including coalesced input frames) from
the most recent WM_POINTERUPDATE message. Having retrieved the entire
frame of information, the application can then call the
SkipPointerFrameMessages function to skip remaining pointer messages
associated with this frame that are pending retrieval. This saves the
application the overhead of retrieving and processing the remaining
messages one by one. However, the SkipPointerFrameMessages function
should be used with care and only when the caller can be sure that no
other entity on the caller’s thread is expecting to see the remaining
pointer messages one by one as they are retrieved. The frame contains
only pointers that are currently owned by the same window as the
specified pointer. The information retrieved represents a
two-dimensional array with one row for each history entry and one
column for each pointer in the frame. The information retrieved
appears in reverse chronological order, with the most recent entry in
the first row of the returned array. The most recent entry is the
same as that returned by the GetPointerFramePenInfo function. If the
count of rows in the buffer provided is insufficient to hold all
available history entries, this function succeeds with the buffer
containing the most recent entries and *entriesCount containing the
total count of entries available.
If the pointer frame contains no additional pointers besides the
specified pointer, this function succeeds and returns only the
information for the specified pointer. If the information associated
with the pointer frame is no longer available, this function fails
with the last error set to ERROR_NO_DATA. If the calling thread does
not own the window (where the input was originally delivered or where
the message was forwarded) to which the pointer message has been
delivered, this function fails with the last error set to
ERROR_ACCESS_DENIED. If the specified pointer is not of type PT_PEN,
this function fails with the last error set to
ERROR_DATATYPE_MISMATCH.
For apps that have both client and non-client areas, the input frame
can include both client and non-client data. To differentiate between
client and non-client data, you must perform hit testing on the
target window. We recommend the following if you want to filter data
from the input frame:
This doc was truncated.


%index
GetPointerFrameTouchInfo
Gets the entire frame of touch-based information for the specified pointers (of type PT_TOUCH) associated with the current message.
%group
Win32 user32
%prm
pointerId, pointerCount, touchInfo
pointerId : [int] An identifier of the pointer for which to retrieve frame information.
pointerCount : [var] A pointer to a variable that specifies the count of structures in the buffer to which touchInfo points. If GetPointerFrameTouchInfo succeeds, pointerCount is updated with the total count of pointers in the frame.
touchInfo : [var] Address of an array of POINTER_TOUCH_INFO structures to receive the pointer information. This parameter can be NULL if *pointerCount is zero.
%inst
Gets the entire frame of touch-based information for the specified
pointers (of type PT_TOUCH) associated with the current message.

[戻り値]
If the function succeeds, the return value is non-zero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Parallel-mode devices may report pointer input in frames, that is,
they may report the state and position of all pointers from that
device in a single input report to the system. Ideally, applications
should view the entire frame as a single input unless the
application-specific requirements dictate otherwise.
GetPointerFrameTouchInfo retrieves the entire pointer input frame
associated with a pointer (of type PT_TOUCH) message. Use
GetPointerTouchInfo to retrieve information for a single pointer
associated with a pointer message. The frame contains only pointers
that are currently owned by the same window as the specified pointer.
The information returned by GetPointerFrameTouchInfo is associated
with the most recent pointer message retrieved by the calling thread.
When the next message is retrieved by the calling thread, the
information associated with the previous message may no longer be
available.
If the application does not process pointer input messages as fast as
they are generated, some messages may be coalesced into a
WM_POINTERUPDATE message. Use GetPointerFrameTouchInfoHistory to
retrieve the message history from the most recent WM_POINTERUPDATE
message. Having retrieved the entire frame of information, the
application can then call the SkipPointerFrameMessages function to
skip remaining pointer messages associated with this frame that are
pending retrieval. This saves the application the overhead of
retrieving and processing the remaining messages one by one. However,
the SkipPointerFrameMessages function should be used with care and
only when the caller can be sure that no other entity on the caller’s
thread is expecting to see the remaining pointer messages one by one
as they are retrieved. Note that the information retrieved is
associated with the pointer frame most recently retrieved by the
calling thread. Once the calling thread retrieves its next message,
the information associated with the previous pointer frame may no
longer be available. If the pointer frame contains no additional
pointers besides the specified pointer, this function succeeds and
returns only the information for the specified pointer. If the
information associated with the pointer frame is no longer available,
this function fails with the last error set to ERROR_NO_DATA. If the
calling thread does not own the window to which the pointer message
has been delivered, this function fails with the last error set to
ERROR_ACCESS_DENIED. If the specified pointer is not of type
PT_TOUCH, this function fails with the last error set to
ERROR_DATATYPE_MISMATCH.
For apps that have both client and non-client areas, the input frame
can include both client and non-client data. To differentiate between
client and non-client data, you must perform hit testing on the
target window. We recommend the following if you want to filter data
from the input frame:
This doc was truncated.


%index
GetPointerFrameTouchInfoHistory
Gets the entire frame of touch-based information (including coalesced input frames) for the specified pointers (of type PT_TOUCH) associated with the current message.
%group
Win32 user32
%prm
pointerId, entriesCount, pointerCount, touchInfo
pointerId : [int] An identifier of the pointer for which to retrieve frame information.
entriesCount : [var] A pointer to variable that specifies the count of rows in the two-dimensional array to which touchInfo points. If GetPointerFrameTouchInfoHistory succeeds,  entriesCount is updated with the total count of frames available in the history.
pointerCount : [var] A pointer to a variable that specifies the count of columns in the two-dimensional array to which touchInfo points. If GetPointerFrameTouchInfoHistory succeeds, pointerCount is updated with the total count of pointers in each frame.
touchInfo : [var] Address of a two-dimensional array of POINTER_TOUCH_INFO structures to receive the pointer information. This parameter can be NULL if *entriesCount and *pointerCount are both zero. This array is interpreted as POINTER_TOUCH_INFO[*entriesCount][*pointerCount].
%inst
Gets the entire frame of touch-based information (including coalesced
input frames) for the specified pointers (of type PT_TOUCH)
associated with the current message.

[戻り値]
If the function succeeds, the return value is non-zero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Parallel-mode devices may report pointer input in frames, that is,
they may report the state and position of all pointers from that
device in a single input report to the system. Ideally, applications
should view the entire frame as a single input unless the
application-specific requirements dictate otherwise. The information
returned by GetPointerFrameTouchInfo is associated with the most
recent pointer (PT_TOUCH) message retrieved by the calling thread.
When the next message is retrieved by the calling thread, the
information associated with the previous message may no longer be
available. If the application does not process pointer input messages
as fast as they are generated, some messages may be coalesced into a
WM_POINTERUPDATE message. Use GetPointerFrameTouchInfoHistory to
retrieve the message history (including coalesced input frames) from
the most recent WM_POINTERUPDATE message. Having retrieved the entire
frame of information, the application can then call the
SkipPointerFrameMessages function to skip remaining pointer messages
associated with this frame that are pending retrieval. This saves the
application the overhead of retrieving and processing the remaining
messages one by one. However, the SkipPointerFrameMessages function
should be used with care and only when the caller can be sure that no
other entity on the caller’s thread is expecting to see the remaining
pointer messages one by one as they are retrieved. The frame contains
only pointers that are currently owned by the same window as the
specified pointer. The information retrieved represents a
two-dimensional array with one row for each history entry and one
column for each pointer in the frame. The information retrieved
appears in reverse chronological order, with the most recent entry in
the first row of the returned array. The most recent entry is the
same as that returned by the GetPointerFrameTouchInfo function. If
the count of rows in the buffer provided is insufficient to hold all
available history entries, this function succeeds with the buffer
containing the most recent entries and *entriesCount containing the
total count of entries available.
If the pointer frame contains no additional pointers besides the
specified pointer, this function succeeds and returns only the
information for the specified pointer. If the information associated
with the pointer frame is no longer available, this function fails
with the last error set to ERROR_NO_DATA. If the calling thread does
not own the window (where the input was originally delivered or where
the message was forwarded) to which the pointer message has been
delivered, this function fails with the last error set to
ERROR_ACCESS_DENIED. If the specified pointer is not of type
PT_TOUCH, this function fails with the last error set to
ERROR_DATATYPE_MISMATCH.
For apps that have both client and non-client areas, the input frame
can include both client and non-client data. To differentiate between
client and non-client data, you must perform hit testing on the
target window. We recommend the following if you want to filter data
from the input frame:
This doc was truncated.


%index
GetPointerInfo
Gets the information for the specified pointer associated with the current message.
%group
Win32 user32
%prm
pointerId, pointerInfo
pointerId : [int] The pointer identifier.
pointerInfo : [var] Address of a  POINTER_INFO structure that receives the pointer information.
%inst
Gets the information for the specified pointer associated with the
current message.

[戻り値]
If the function succeeds, the return value is non-zero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
GetPointerInfo retrieves information for a single pointer associated
with a pointer message. Use GetPointerFrameInfo to retrieve frame
information associated with a message for a set of pointers. The
information returned by GetPointerInfo is associated with the most
recent pointer message retrieved by the calling thread. When the next
message is retrieved by the calling thread, the information
associated with the previous message may no longer be available. If
the application does not process pointer input messages as fast as
they are generated, some messages may be coalesced into a
WM_POINTERUPDATE message. Use GetPointerInfoHistory to retrieve the
message history from the most recent WM_POINTERUPDATE message. If the
information associated with the message is no longer available, this
function fails with the last error set to ERROR_NO_DATA. If the
calling thread does not own the window to which the pointer message
has been delivered, this function fails with the last error set to
ERROR_ACCESS_DENIED. Note that this may be the window to which the
input was originally delivered or it may be a window to which the
message was forwarded.


%index
GetPointerInfoHistory
Gets the information associated with the individual inputs, if any, that were coalesced into the current message for the specified pointer.
%group
Win32 user32
%prm
pointerId, entriesCount, pointerInfo
pointerId : [int] An identifier of the pointer for which to retrieve information.
entriesCount : [var] A pointer to a variable that specifies the count of structures in the buffer to which pointerInfo points. If GetPointerInfoHistory succeeds, entriesCount  is updated with the total count of structures available. The total count of structures available is the same as the historyCount field of the POINTER_INFO structure returned by a call to GetPointerInfo.
pointerInfo : [var] Address of an array of POINTER_INFO structures to receive the pointer information. This parameter can be NULL if *entriesCount is zero.
%inst
Gets the information associated with the individual inputs, if any,
that were coalesced into the current message for the specified
pointer.

[戻り値]
If the function succeeds, the return value is non-zero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
If the application does not process pointer input messages as fast as
they are generated, some moves may be coalesced. When an application
receives a coalescable pointer message, it can use the
GetPointerInfoHistory function to retrieve information for all the
individual inputs, if any, that were coalesced into the message. Note
that the information retrieved is associated with the pointer message
most recently retrieved by the calling thread. Once the calling
thread retrieves its next message, the information associated with
the previous message may no longer be available. The information
retrieved appears in reverse chronological order, with the most
recent entry in the first row of the returned array. The most recent
entry is the same as that returned by the GetPointerInfo function. If
the count of rows in the buffer provided is insufficient to hold all
available history entries, this function succeeds with the buffer
containing the most recent entries and *entriesCount containing the
total count of entries available.
If the pointer frame contains no additional pointers besides the
specified pointer, this function succeeds and returns only the
information for the specified pointer. If the information associated
with the pointer frame is no longer available, this function fails
with the last error set to ERROR_NO_DATA. If the calling thread does
not own the window (where the input was originally delivered or where
the message was forwarded) to which the pointer message has been
delivered, this function fails with the last error set to
ERROR_ACCESS_DENIED.


%index
GetPointerInputTransform
Gets one or more transforms for the pointer information coordinates associated with the current message.
%group
Win32 user32
%prm
pointerId, historyCount, inputTransform
pointerId : [int] An identifier of the pointer for which to retrieve information.
historyCount : [int] The number of INPUT_TRANSFORM structures that inputTransform can point to. This value must be no less than 1 and no greater than the value specified in historyCount of the POINTER_INFO structure returned by GetPointerInfo, GetPointerTouchInfo, or GetPointerPenInfo (for a single input transform) or GetPointerInfoHistory, GetPointerTouchInfoHistory, or GetPointerPenInfoHistory (for an array of input transforms). If GetPointerInputTransform succeeds, inputTransform  is updated with the total count of structures available. The total count of structures available is the same as the historyCount field of the POINTER_INFO structure.
inputTransform : [var] Address of an array of INPUT_TRANSFORM structures to receive the transform information. This parameter cannot be NULL.
%inst
Gets one or more transforms for the pointer information coordinates
associated with the current message.

[戻り値]
If the function succeeds, the return value is non-zero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
A consumer of pointer input messages typically uses ScreenToClient or
MapWindowPoints to convert screen coordinates to client coordinates.
If a transform is applied on the message consumer, use
GetPointerInputTransform to retrieve the transform on the message
consumer at the time the input occurred. The inverse of this
transform can then be used to convert pointer input coordinates from
screen coordinates to the client coordinates of the message consumer.
If an input transform is not associated with the input, the
GetPointerInputTransform function fails with the last error set to
ERROR_NO_DATA. Use ScreenToClient or MapWindowPoints instead. The
input transform does not respect any right-to-left layout setting on
the input target. An application that requires adjusted coordinates
for right-to-left layout must perform the right-to-left mirroring or
combine an appropriate mirroring transform with the input transform.
The information returned by GetPointerInputTransform is associated
with the most recent pointer message retrieved by the calling thread.
When the next message is retrieved by the calling thread, the
information associated with the previous message might no longer be
available. If an application calls GetPointerInfo, it can call
GetPointerInputTransform with the same pointer Id and a single
INPUT_TRANSFORM output buffer to get the input transform associated
with the data. If an application calls GetPointerFrameInfo, it can
call GetPointerInputTransform with the same pointer Id and a single
INPUT_TRANSFORM output buffer to get the input transform associated
with the data. The same input transform applies to the entire frame.
If an application calls GetPointerInfoHistory, it can call
GetPointerInputTransform with the same pointer Id and an output
buffer to hold the entries retrieved using GetPointerInfoHistory.
Each input transform in the returned array can be used with the
corresponding entry in the array returned by GetPointerInfoHistory.
If an application calls GetPointerFrameInfoHistory, it can call
GetPointerInputTransform with the same pointer Id and an output
buffer to hold the entries retrieved using GetPointerInfoHistory.
Each input transform in the returned array can be used with the
corresponding frame in the array returned by
GetPointerFrameInfoHistory, with the same input transform being
applied to the entire frame.
If the information associated with the message is no longer
available, this function fails with the last error set to
ERROR_INVALID_PARAMETER. If historyCount contains a value larger than
the historyCount field of the POINTER_INFO structure returned by
GetPointerInfo (or the first POINTER_INFO structure in the array
returned by GetPointerInfoHistory), the function fails with the last
error set to ERROR_INVALID_PARAMETER.


%index
GetPointerPenInfo
Gets the pen-based information for the specified pointer (of type PT_PEN) associated with the current message.
%group
Win32 user32
%prm
pointerId, penInfo
pointerId : [int] An identifier of the pointer for which to retrieve information.
penInfo : [var] Address of a POINTER_PEN_INFO structure to receive the pen-specific pointer information.
%inst
Gets the pen-based information for the specified pointer (of type
PT_PEN) associated with the current message.

[戻り値]
If the function succeeds, the return value is non-zero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
GetPointerPenInfo retrieves information for a single pointer (of type
PT_PEN) associated with a pointer message. Use GetPointerFramePenInfo
to retrieve frame information associated with a message for a set of
pointers. The information returned by GetPointerInfo is associated
with the most recent pointer message retrieved by the calling thread.
When the next message is retrieved by the calling thread, the
information associated with the previous message may no longer be
available. If the application does not process pointer input messages
as fast as they are generated, some messages may be coalesced into a
WM_POINTERUPDATE message. Use GetPointerPenInfoHistory to retrieve
the message history from the most recent WM_POINTERUPDATE message. If
the information associated with the message is no longer available,
this function fails with the last error set to ERROR_NO_DATA. If the
calling thread does not own the window to which the pointer message
has been delivered, this function fails with the last error set to
ERROR_ACCESS_DENIED. Note that this may be the window to which the
input was originally delivered or it may be a window to which the
message was forwarded. If the specified pointer is not of type
PT_PEN, this function fails with the last error set to
ERROR_DATATYPE_MISMATCH.


%index
GetPointerPenInfoHistory
Gets the pen-based information associated with the individual inputs, if any, that were coalesced into the current message for the specified pointer (of type PT_PEN).
%group
Win32 user32
%prm
pointerId, entriesCount, penInfo
pointerId : [int] An identifier of the pointer for which to retrieve information.
entriesCount : [var] A pointer to a variable that specifies the count of structures in the buffer to which penInfo points. If GetPointerPenInfoHistory succeeds, entriesCount is updated with the total count of structures available. The total count of structures available is the same as the historyCount field in the POINTER_PEN_INFO structure returned by a call to  GetPointerPenInfo.
penInfo : [var] Address of an array of POINTER_PEN_INFO structures to receive the pointer information. This parameter can be NULL if *entriesCount is zero.
%inst
Gets the pen-based information associated with the individual inputs,
if any, that were coalesced into the current message for the
specified pointer (of type PT_PEN).

[戻り値]
If the function succeeds, the return value is non-zero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
If the application does not process pointer input messages as fast as
they are generated, some moves may be coalesced. When an application
receives a coalescable pointer (of type PT_PEN) message, it can use
the GetPointerPenInfoHistory function to retrieve information for all
the individual inputs, if any, that were coalesced into the message.
Note that the information retrieved is associated with the pointer
message most recently retrieved by the calling thread. Once the
calling thread retrieves its next message, the information associated
with the previous message may no longer be available. The information
retrieved appears in reverse chronological order, with the most
recent entry in the first row of the returned array. The most recent
entry is the same as that returned by the GetPointerPenInfo function.
If the count of rows in the buffer provided is insufficient to hold
all available history entries, this function succeeds with the buffer
containing the most recent entries and *entriesCount containing the
total count of entries available. If the pointer frame contains no
additional pointers besides the specified pointer, this function
succeeds and returns only the information for the specified pointer.
If the information associated with the pointer frame is no longer
available, this function fails with the last error set to
ERROR_NO_DATA. If the calling thread does not own the window (where
the input was originally delivered or where the message was
forwarded) to which the pointer message has been delivered, this
function fails with the last error set to ERROR_ACCESS_DENIED. If the
specified pointer is not of type PT_PEN, this function fails with the
last error set to ERROR_DATATYPE_MISMATCH.


%index
GetPointerTouchInfo
Gets the touch-based information for the specified pointer (of type PT_TOUCH) associated with the current message.
%group
Win32 user32
%prm
pointerId, touchInfo
pointerId : [int] An identifier of the pointer for which to retrieve information.
touchInfo : [var] Address of a POINTER_TOUCH_INFO structure to receive the touch-specific pointer information.
%inst
Gets the touch-based information for the specified pointer (of type
PT_TOUCH) associated with the current message.

[戻り値]
If the function succeeds, the return value is non-zero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
GetPointerTouchInfo retrieves information for a single pointer (of
type PT_TOUCH) associated with a pointer message. Use
GetPointerFrameTouchInfo to retrieve frame information associated
with a message for a set of pointers. The information returned by
GetPointerTouchInfo is associated with the most recent pointer
message retrieved by the calling thread. When the next message is
retrieved by the calling thread, the information associated with the
previous message may no longer be available. If the application does
not process pointer input messages as fast as they are generated,
some messages may be coalesced into a WM_POINTERUPDATE message. Use
GetPointerTouchInfoHistory to retrieve the message history from the
most recent WM_POINTERUPDATE message. If the information associated
with the message is no longer available, this function fails with the
last error set to ERROR_NO_DATA. If the calling thread does not own
the window to which the pointer message has been delivered, this
function fails with the last error set to ERROR_ACCESS_DENIED. Note
that this may be the window to which the input was originally
delivered or it may be a window to which the message was forwarded.
If the specified pointer is not of type PT_TOUCH, this function fails
with the last error set to ERROR_DATATYPE_MISMATCH.


%index
GetPointerTouchInfoHistory
Gets the touch-based information associated with the individual inputs, if any, that were coalesced into the current message for the specified pointer (of type PT_TOUCH).
%group
Win32 user32
%prm
pointerId, entriesCount, touchInfo
pointerId : [int] An identifier of the pointer for which to retrieve information.
entriesCount : [var] A pointer to a variable that specifies the count of structures in the buffer to which touchInfo points. If GetPointerTouchInfoHistory succeeds, entriesCount is updated with the total count of structures available. The total count of structures available is the same as the historyCount field in the POINTER_INFO structure returned by a call to GetPointerInfo or GetPointerTouchInfo.
touchInfo : [var] Address of an array of POINTER_TOUCH_INFO structures to receive the pointer information. This parameter can be NULL if *entriesCount is zero.
%inst
Gets the touch-based information associated with the individual
inputs, if any, that were coalesced into the current message for the
specified pointer (of type PT_TOUCH).

[戻り値]
If the function succeeds, the return value is non-zero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
If the application does not process pointer input messages as fast as
they are generated, some moves may be coalesced. When an application
receives a coalescable pointer (of type PT_TOUCH) message, it can use
the GetPointerTouchInfoHistory function to retrieve information for
all the individual inputs, if any, that were coalesced into the
message. Note that the information retrieved is associated with the
pointer message most recently retrieved by the calling thread. Once
the calling thread retrieves its next message, the information
associated with the previous message may no longer be available. The
information retrieved appears in reverse chronological order, with
the most recent entry in the first row of the returned array. The
most recent entry is the same as that returned by the
GetPointerTouchInfo function. If the count of rows in the buffer
provided is insufficient to hold all available history entries, this
function succeeds with the buffer containing the most recent entries
and *entriesCount containing the total count of entries available.
If the pointer frame contains no additional pointers besides the
specified pointer, this function succeeds and returns only the
information for the specified pointer. If the information associated
with the pointer frame is no longer available, this function fails
with the last error set to ERROR_NO_DATA. If the calling thread does
not own the window (where the input was originally delivered or where
the message was forwarded) to which the pointer message has been
delivered, this function fails with the last error set to
ERROR_ACCESS_DENIED. If the specified pointer is not of type
PT_TOUCH, this function fails with the last error set to
ERROR_DATATYPE_MISMATCH.


%index
GetPointerType
Retrieves the pointer type for a specified pointer.
%group
Win32 user32
%prm
pointerId, pointerType
pointerId : [int] An identifier of the pointer for which to retrieve pointer type.
pointerType : [var] An address of a POINTER_INPUT_TYPE type to receive a pointer input type.
%inst
Retrieves the pointer type for a specified pointer.

[戻り値]
If the function succeeds, the return value is non-zero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
An application can use the GetPointerType function to determine the
pointer type if it wishes to react differently to pointers of
different types. Note This function will never return with the
generic PT_POINTER type.


%index
GetPriorityClipboardFormat
Retrieves the first available clipboard format in the specified list.
%group
Win32 user32
%prm
paFormatPriorityList, cFormats
paFormatPriorityList : [var] Type: UINT* The clipboard formats, in priority order. For a description of the standard clipboard formats, see Standard Clipboard Formats .
cFormats : [int] Type: int The number of entries in the paFormatPriorityList array. This value must not be greater than the number of entries in the list.
%inst
Retrieves the first available clipboard format in the specified list.

[戻り値]
Type: int If the function succeeds, the return value is the first
clipboard format in the list for which data is available. If the
clipboard is empty, the return value is NULL. If the clipboard
contains data, but not in any of the specified formats, the return
value is ?1. To get extended error information, call GetLastError.


%index
GetProcessDefaultLayout
Retrieves the default layout that is used when windows are created with no parent or owner.
%group
Win32 user32
%prm
pdwDefaultLayout
pdwDefaultLayout : [var] Type: DWORD* The current default process layout. For a list of values, see SetProcessDefaultLayout.
%inst
Retrieves the default layout that is used when windows are created
with no parent or owner.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The layout specifies how text and graphics are laid out in a window;
the default is left to right. The GetProcessDefaultLayout function
lets you know if the default layout has changed, from using
SetProcessDefaultLayout.


%index
GetProcessWindowStation
Retrieves a handle to the current window station for the calling process.
%group
Win32 user32
%prm

%inst
Retrieves a handle to the current window station for the calling
process.

[戻り値]
If the function succeeds, the return value is a handle to the window
station. If the function fails, the return value is NULL. To get
extended error information, call GetLastError.

[備考]
The system associates a window station with a process when the
process is created. A process can use the SetProcessWindowStation
function to change its window station. The calling process can use
the returned handle in calls to the GetUserObjectInformation,
GetUserObjectSecurity, SetUserObjectInformation, and
SetUserObjectSecurity functions. Do not close the handle returned by
this function. A service application is created with an associated
window station and desktop, so there is no need to call a USER or GDI
function to connect the service to a window station and desktop.


%index
GetPropW
Retrieves a data handle from the property list of the specified window. The character string identifies the handle to be retrieved. The string and handle must have been added to the property list by a previous call to the SetProp function. (Unicode)
%group
Win32 user32
%prm
hWnd, lpString
hWnd : [intptr] Type: HWND A handle to the window whose property list is to be searched.
lpString : [wstr] Type: LPCTSTR An atom that identifies a string. If this parameter is an atom, it must have been created by using the GlobalAddAtom function. The atom, a 16-bit value, must be placed in the low-order word of the lpString parameter; the high-order word must be zero.
%inst
Retrieves a data handle from the property list of the specified
window. The character string identifies the handle to be retrieved.
The string and handle must have been added to the property list by a
previous call to the SetProp function. (Unicode)

[戻り値]
Type: HANDLE If the property list contains the string, the return
value is the associated data handle. Otherwise, the return value is
NULL.

[備考]
> [!NOTE] > The winuser.h header defines GetProp as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetQueueStatus
Retrieves the type of messages found in the calling thread's message queue.
%group
Win32 user32
%prm
flags
flags : [int] Type: UINT
%inst
Retrieves the type of messages found in the calling thread's message
queue.

[戻り値]
Type: DWORD The high-order word of the return value indicates the
types of messages currently in the queue. The low-order word
indicates the types of messages that have been added to the queue and
that are still in the queue since the last call to the
GetQueueStatus, GetMessage, or PeekMessage function.

[備考]
The presence of a QS_ flag in the return value does not guarantee
that a subsequent call to the GetMessage or PeekMessage function will
return a message. GetMessage and PeekMessage perform some internal
filtering that may cause the message to be processed internally. For
this reason, the return value from GetQueueStatus should be
considered only a hint as to whether GetMessage or PeekMessage should
be called. The QS_ALLPOSTMESSAGE and QS_POSTMESSAGE flags differ in
when they are cleared. QS_POSTMESSAGE is cleared when you call
GetMessage or PeekMessage, whether or not you are filtering messages.
QS_ALLPOSTMESSAGE is cleared when you call GetMessage or PeekMessage
without filtering messages (wMsgFilterMin and wMsgFilterMax are 0).
This can be useful when you call PeekMessage multiple times to get
messages in different ranges.


%index
GetRawInputBuffer
Performs a buffered read of the raw input data.
%group
Win32 user32
%prm
pData, pcbSize, cbSizeHeader
pData : [var] Type: **PRAWINPUT** A pointer to a buffer of [RAWINPUT](ns-winuser-rawinput.md) structures that contain the raw input data. Buffer should be aligned on a pointer boundary, which is a **DWORD** on 32-bit architectures and a **QWORD** on 64-bit architectures. If **NULL**, size of the first raw input message data (minimum required buffer), in bytes, is returned in \**pcbSize*.
pcbSize : [var] Type: **PUINT** The size, in bytes, of the provided [RAWINPUT](ns-winuser-rawinput.md) buffer.
cbSizeHeader : [int] Type: **UINT** The size, in bytes, of the [RAWINPUTHEADER](ns-winuser-rawinputheader.md) structure.
%inst
Performs a buffered read of the raw input data.

[戻り値]
Type: **UINT** If *pData* is **NULL** and the function is successful,
the return value is zero. If *pData* is not **NULL** and the function
is successful, the return value is the number of
[RAWINPUT](ns-winuser-rawinput.md) structures written to *pData*. If
an error occurs, the return value is (**UINT**)-1. Call
[GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
for the error code.

[備考]
When an application receives raw input, its message queue gets a
[WM_INPUT](/windows/win32/inputdev/wm-input) message and the queue
status flag [QS_RAWINPUT](nf-winuser-getqueuestatus.md) is set. Using
**GetRawInputBuffer**, the raw input data is read in the array of
variable size [RAWINPUT](ns-winuser-rawinput.md) structures and
corresponding [WM_INPUT](/windows/win32/inputdev/wm-input) messages
are removed from the calling thread's message queue. You can call
this method several times with buffer that cannot fit all message's
data until all raw input messages have been read. The
[NEXTRAWINPUTBLOCK](nf-winuser-nextrawinputblock.md) macro allows an
application to traverse an array of
[RAWINPUT](ns-winuser-rawinput.md) structures. If all raw input
messages have been successfully read from message queue then
[QS_RAWINPUT](nf-winuser-getqueuestatus.md) flag is cleared from the
calling thread's message queue status. > [!NOTE] > WOW64: To get the
correct size of the raw input buffer, do not use \**pcbSize*, use
\**pcbSize* \* 8 instead. To ensure **GetRawInputBuffer** behaves
properly on WOW64, you must align the
[RAWINPUT](ns-winuser-rawinput.md) structure by 8 bytes. The
following code shows how to align **RAWINPUT** for WOW64.
This doc was truncated.


%index
GetRawInputData
Retrieves the raw input from the specified device.
%group
Win32 user32
%prm
hRawInput, uiCommand, pData, pcbSize, cbSizeHeader
hRawInput : [intptr] Type: HRAWINPUT A handle to the RAWINPUT structure. This comes from the lParam in WM_INPUT.
uiCommand : [int] Type: UINT
pData : [intptr] Type: LPVOID A pointer to the data that comes from the RAWINPUT structure. This depends on the value of uiCommand. If pData is NULL, the required size of the buffer is returned in *pcbSize.
pcbSize : [var] Type: PUINT The size, in bytes, of the data in pData.
cbSizeHeader : [int] Type: UINT The size, in bytes, of the RAWINPUTHEADER structure.
%inst
Retrieves the raw input from the specified device.

[戻り値]
Type: UINT If pData is NULL and the function is successful, the
return value is 0. If pData is not NULL and the function is
successful, the return value is the number of bytes copied into
pData. If there is an error, the return value is (UINT)-1.

[備考]
GetRawInputData gets the raw input one RAWINPUT structure at a time.
In contrast, GetRawInputBuffer gets an array of RAWINPUT structures.


%index
GetRawInputDeviceInfoW
Retrieves information about the raw input device. (Unicode)
%group
Win32 user32
%prm
hDevice, uiCommand, pData, pcbSize
hDevice : [intptr] Type: HANDLE A handle to the raw input device. This comes from the hDevice member of RAWINPUTHEADER or from GetRawInputDeviceList.
uiCommand : [int] Type: UINT
pData : [intptr] Type: LPVOID A pointer to a buffer that contains the information specified by uiCommand. If uiCommand is RIDI_DEVICEINFO, set the cbSize member of RID_DEVICE_INFO to sizeof(RID_DEVICE_INFO) before calling GetRawInputDeviceInfo.
pcbSize : [var] Type: PUINT The size, in bytes, of the data in pData.
%inst
Retrieves information about the raw input device. (Unicode)

[戻り値]
Type: UINT If successful, this function returns a non-negative number
indicating the number of bytes copied to pData. If pData is not large
enough for the data, the function returns -1. If pData is NULL, the
function returns a value of zero. In both of these cases, pcbSize is
set to the minimum size required for the pData buffer. Call
GetLastError to identify any other errors.

[備考]
> [!NOTE] > The winuser.h header defines GetRawInputDeviceInfo as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetRawInputDeviceList
Enumerates the raw input devices attached to the system.
%group
Win32 user32
%prm
pRawInputDeviceList, puiNumDevices, cbSize
pRawInputDeviceList : [var] Type: PRAWINPUTDEVICELIST An array of RAWINPUTDEVICELIST structures for the devices attached to the system. If NULL, the number of devices are returned in *puiNumDevices.
puiNumDevices : [var] Type: PUINT If pRawInputDeviceList is NULL, the function populates this variable with the number of devices attached to the system; otherwise, this variable specifies the number of RAWINPUTDEVICELIST structures that can be contained in the buffer to which pRawInputDeviceList points. If this value is less than the number of devices attached to the system, the function returns the actual number of devices in this variable and fails with ERROR_INSUFFICIENT_BUFFER. If this value is greater than or equal to the number of devices attached to the system, then the value is unchanged, and the number of devices is reported as the return value.
cbSize : [int] Type: UINT The size of a RAWINPUTDEVICELIST structure, in bytes.
%inst
Enumerates the raw input devices attached to the system.

[戻り値]
Type: UINT If the function is successful, the return value is the
number of devices stored in the buffer pointed to by
pRawInputDeviceList. On any other error, the function returns (UINT)
-1 and GetLastError returns the error indication.

[備考]
The devices returned from this function are the mouse, the keyboard,
and other Human Interface Device (HID) devices. To get more detailed
information about the attached devices, call GetRawInputDeviceInfo
using the hDevice from RAWINPUTDEVICELIST.


%index
GetRawPointerDeviceData
Gets the raw input data from the pointer device.
%group
Win32 user32
%prm
pointerId, historyCount, propertiesCount, pProperties, pValues
pointerId : [int] An identifier of the pointer for which to retrieve information.
historyCount : [int] The pointer history.
propertiesCount : [int] Number of properties to retrieve.
pProperties : [var] Array of POINTER_DEVICE_PROPERTY structures that contain raw data reported by the device.
pValues : [var] The values for pProperties.
%inst
Gets the raw input data from the pointer device.

[戻り値]
TRUE if the function succeeds; otherwise, FALSE. If the function
fails, call the GetLastError function for more information.


%index
GetRegisteredRawInputDevices
Retrieves the information about the raw input devices for the current application.
%group
Win32 user32
%prm
pRawInputDevices, puiNumDevices, cbSize
pRawInputDevices : [var] Type: PRAWINPUTDEVICE An array of RAWINPUTDEVICE structures for the application.
puiNumDevices : [var] Type: PUINT The number of RAWINPUTDEVICE structures in *pRawInputDevices.
cbSize : [int] Type: UINT The size, in bytes, of a RAWINPUTDEVICE structure.
%inst
Retrieves the information about the raw input devices for the current
application.

[戻り値]
Type: UINT If successful, the function returns a non-negative number
that is the number of RAWINPUTDEVICE structures written to the
buffer. If the pRawInputDevices buffer is too small or NULL, the
function sets the last error as ERROR_INSUFFICIENT_BUFFER, returns
-1, and sets puiNumDevices to the required number of devices. If the
function fails for any other reason, it returns -1. For more details,
call GetLastError.

[備考]
To receive raw input from a device, an application must register it
by using RegisterRawInputDevices.


%index
GetScrollBarInfo
The GetScrollBarInfo function retrieves information about the specified scroll bar.
%group
Win32 user32
%prm
hwnd, idObject, psbi
hwnd : [intptr] Type: HWND Handle to a window associated with the scroll bar whose information is to be retrieved. If the idObject parameter is OBJID_CLIENT, hwnd is a handle to a scroll bar control. Otherwise, hwnd is a handle to a window created with WS_VSCROLL and/or WS_HSCROLL style.
idObject : [int] Type: LONG
psbi : [var] Type: PSCROLLBARINFO Pointer to a SCROLLBARINFO structure to receive the information. Before calling GetScrollBarInfo, set the cbSize member to sizeof(SCROLLBARINFO).
%inst
The GetScrollBarInfo function retrieves information about the
specified scroll bar.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
If idObject is OBJID_CLIENT and the window specified by hwnd is not a
system scroll bar control, the system sends the SBM_GETSCROLLBARINFO
message to the window to obtain scroll bar information. This allows
GetScrollBarInfo to operate on a custom control that mimics a scroll
bar. If the window does not handle the SBM_GETSCROLLBARINFO message,
the GetScrollBarInfo function fails.


%index
GetScrollInfo
The GetScrollInfo function retrieves the parameters of a scroll bar, including the minimum and maximum scrolling positions, the page size, and the position of the scroll box (thumb).
%group
Win32 user32
%prm
hwnd, nBar, lpsi
hwnd : [intptr] Type: HWND Handle to a scroll bar control or a window with a standard scroll bar, depending on the value of the fnBar parameter.
nBar : [int] Type: int
lpsi : [var] Type: LPSCROLLINFO Pointer to a SCROLLINFO structure. Before calling GetScrollInfo, set the cbSize member to sizeof(SCROLLINFO), and set the fMask member to specify the scroll bar parameters to retrieve. Before returning, the function copies the specified parameters to the appropriate members of the structure. The
%inst
The GetScrollInfo function retrieves the parameters of a scroll bar,
including the minimum and maximum scrolling positions, the page size,
and the position of the scroll box (thumb).

[戻り値]
Type: BOOL If the function retrieved any values, the return value is
nonzero. If the function does not retrieve any values, the return
value is zero. To get extended error information, call GetLastError.

[備考]
The GetScrollInfo function enables applications to use 32-bit scroll
positions. Although the messages that indicate scroll bar position,
WM_HSCROLL and WM_VSCROLL, provide only 16 bits of position data, the
functions SetScrollInfo and GetScrollInfo provide 32 bits of scroll
bar position data. Thus, an application can call GetScrollInfo while
processing either the WM_HSCROLL or WM_VSCROLL messages to obtain
32-bit scroll bar position data. To get the 32-bit position of the
scroll box (thumb) during a SB_THUMBTRACK request code in a
WM_HSCROLL or WM_VSCROLL message, call GetScrollInfo with the
SIF_TRACKPOS value in the fMask member of the SCROLLINFO structure.
The function returns the tracking position of the scroll box in the
nTrackPos member of the SCROLLINFO structure. This allows you to get
the position of the scroll box as the user moves it. The following
sample code illustrates the technique.
This doc was truncated.


%index
GetScrollPos
The GetScrollPos function retrieves the current position of the scroll box (thumb) in the specified scroll bar.
%group
Win32 user32
%prm
hWnd, nBar
hWnd : [intptr] Type: HWND Handle to a scroll bar control or a window with a standard scroll bar, depending on the value of the nBar parameter.
nBar : [int] Type: int
%inst
The GetScrollPos function retrieves the current position of the
scroll box (thumb) in the specified scroll bar.

[戻り値]
Type: int If the function succeeds, the return value is the current
position of the scroll box. If the function fails, the return value
is zero. To get extended error information, call GetLastError.

[備考]
The GetScrollPos function enables applications to use 32-bit scroll
positions. Although the messages that indicate scroll bar position,
WM_HSCROLL and WM_VSCROLL, are limited to 16 bits of position data,
the functions SetScrollPos, SetScrollRange, GetScrollPos, and
GetScrollRange support 32-bit scroll bar position data. Thus, an
application can call GetScrollPos while processing either the
WM_HSCROLL or WM_VSCROLL messages to obtain 32-bit scroll bar
position data. To get the 32-bit position of the scroll box (thumb)
during a SB_THUMBTRACK request code in a WM_HSCROLL or WM_VSCROLL
message, use the GetScrollInfo function. If the nBar parameter is
SB_CTL and the window specified by the hWnd parameter is not a system
scroll bar control, the system sends the SBM_GETPOS message to the
window to obtain scroll bar information. This allows GetScrollPos to
operate on a custom control that mimics a scroll bar. If the window
does not handle the SBM_GETPOS message, the GetScrollPos function
fails.


%index
GetScrollRange
The GetScrollRange function retrieves the current minimum and maximum scroll box (thumb) positions for the specified scroll bar.
%group
Win32 user32
%prm
hWnd, nBar, lpMinPos, lpMaxPos
hWnd : [intptr] Type: HWND Handle to a scroll bar control or a window with a standard scroll bar, depending on the value of the nBar parameter.
nBar : [int] Type: int
lpMinPos : [var] Type: LPINT Pointer to the integer variable that receives the minimum position.
lpMaxPos : [var] Type: LPINT Pointer to the integer variable that receives the maximum position.
%inst
The GetScrollRange function retrieves the current minimum and maximum
scroll box (thumb) positions for the specified scroll bar.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
If the specified window does not have standard scroll bars or is not
a scroll bar control, the GetScrollRange function copies zero to the
lpMinPos and lpMaxPos parameters. The default range for a standard
scroll bar is 0 through 100. The default range for a scroll bar
control is empty (both values are zero). The messages that indicate
scroll bar position, WM_HSCROLL and WM_VSCROLL, are limited to 16
bits of position data. However, because SetScrollInfo, SetScrollPos,
SetScrollRange, GetScrollInfo, GetScrollPos, and GetScrollRange
support 32-bit scroll bar position data, there is a way to circumvent
the 16-bit barrier of the WM_HSCROLL and WM_VSCROLL messages. See the
GetScrollInfo function for a description of the technique. If the
nBar parameter is SB_CTL and the window specified by the hWnd
parameter is not a system scroll bar control, the system sends the
SBM_GETRANGE message to the window to obtain scroll bar information.
This allows GetScrollRange to operate on a custom control that mimics
a scroll bar. If the window does not handle the SBM_GETRANGE message,
the GetScrollRange function fails.


%index
GetShellWindow
Retrieves a handle to the Shell's desktop window.
%group
Win32 user32
%prm

%inst
Retrieves a handle to the Shell's desktop window.

[戻り値]
Type: HWND The return value is the handle of the Shell's desktop
window. If no Shell process is present, the return value is NULL.


%index
GetSubMenu
Retrieves a handle to the drop-down menu or submenu activated by the specified menu item.
%group
Win32 user32
%prm
hMenu, nPos
hMenu : [intptr] Type: HMENU A handle to the menu.
nPos : [int] Type: int The zero-based relative position in the specified menu of an item that activates a drop-down menu or submenu.
%inst
Retrieves a handle to the drop-down menu or submenu activated by the
specified menu item.

[戻り値]
Type: HMENU If the function succeeds, the return value is a handle to
the drop-down menu or submenu activated by the menu item. If the menu
item does not activate a drop-down menu or submenu, the return value
is NULL.


%index
GetSysColor
Retrieves the current color of the specified display element.
%group
Win32 user32
%prm
nIndex
nIndex : [int] Type: int
%inst
Retrieves the current color of the specified display element.

[戻り値]
Type: DWORD The function returns the red, green, blue (RGB) color
value of the given element. If the nIndex parameter is out of range,
the return value is zero. Because zero is also a valid RGB value, you
cannot use GetSysColor to determine whether a system color is
supported by the current platform. Instead, use the GetSysColorBrush
function, which returns NULL if the color is not supported.

[備考]
To display the component of the RGB value, use the GetRValue,
GetGValue, and GetBValue macros. System colors for monochrome
displays are usually interpreted as shades of gray. To paint with a
system color brush, an application should use
GetSysColorBrush(nIndex), instead of
CreateSolidBrush(GetSysColor(nIndex)), because GetSysColorBrush
returns a cached brush, instead of allocating a new one. Color is an
important visual element of most user interfaces. For guidelines
about using color in your applications, see Color - Win32 and Color
in Windows 11.


%index
GetSysColorBrush
The GetSysColorBrush function retrieves a handle identifying a logical brush that corresponds to the specified color index.
%group
Win32 user32
%prm
nIndex
nIndex : [int] A color index. This value corresponds to the color used to paint one of the window elements. See GetSysColor for system color index values.
%inst
The GetSysColorBrush function retrieves a handle identifying a
logical brush that corresponds to the specified color index.

[戻り値]
The return value identifies a logical brush if the nIndex parameter
is supported by the current platform. Otherwise, it returns NULL.

[備考]
A brush is a bitmap that the system uses to paint the interiors of
filled shapes. An application can retrieve the current system colors
by calling the GetSysColor function. An application can set the
current system colors by calling the SetSysColors function. An
application must not register a window class for a window using a
system brush. To register a window class with a system color, see the
documentation of the hbrBackground member of the WNDCLASS or
WNDCLASSEX structures. System color brushes track changes in system
colors. In other words, when the user changes a system color, the
associated system color brush automatically changes to the new color.
To paint with a system color brush, an application should use
GetSysColorBrush (nIndex) instead of CreateSolidBrush ( GetSysColor
(nIndex)), because GetSysColorBrush returns a cached brush instead of
allocating a new one. System color brushes are owned by the system so
you don't need to destroy them. Although you don't need to delete the
logical brush that GetSysColorBrush returns, no harm occurs by
calling DeleteObject.


%index
GetSystemDpiForProcess
Retrieves the system DPI associated with a given process. This is useful for avoiding compatibility issues that arise from sharing DPI-sensitive information between multiple system-aware processes with different system DPI values.
%group
Win32 user32
%prm
hProcess
hProcess : [intptr] The handle for the process to examine. If this value is null, this API behaves identically to GetDpiForSystem.
%inst
Retrieves the system DPI associated with a given process. This is
useful for avoiding compatibility issues that arise from sharing
DPI-sensitive information between multiple system-aware processes
with different system DPI values.

[戻り値]
The process's system DPI value.

[備考]
The return value will be dependent based upon the process passed as a
parameter. If the specified process has a DPI_AWARENESS value of
DPI_AWARENESS_UNAWARE, the return value will be 96. That is because
the current context always assumes a DPI of 96. For any other
DPI_AWARENESS value, the return value will be the actual system DPI
of the given process.


%index
GetSystemMenu
Enables the application to access the window menu (also known as the system menu or the control menu) for copying and modifying.
%group
Win32 user32
%prm
hWnd, bRevert
hWnd : [intptr] Type: HWND A handle to the window that will own a copy of the window menu.
bRevert : [int] Type: BOOL The action to be taken. If this parameter is FALSE, GetSystemMenu returns a handle to the copy of the window menu currently in use. The copy is initially identical to the window menu, but it can be modified. If this parameter is TRUE, GetSystemMenu resets the window menu back to the default state. The previous window menu, if any, is destroyed.
%inst
Enables the application to access the window menu (also known as the
system menu or the control menu) for copying and modifying.

[戻り値]
Type: HMENU If the bRevert parameter is FALSE, the return value is a
handle to a copy of the window menu. If the bRevert parameter is
TRUE, the return value is NULL.

[備考]
Any window that does not use the GetSystemMenu function to make its
own copy of the window menu receives the standard window menu. The
window menu initially contains items with various identifier values,
such as SC_CLOSE, SC_MOVE, and SC_SIZE. Menu items on the window menu
send WM_SYSCOMMAND messages. All predefined window menu items have
identifier numbers greater than 0xF000. If an application adds
commands to the window menu, it should use identifier numbers less
than 0xF000. The system automatically grays items on the standard
window menu, depending on the situation. The application can perform
its own checking or graying by responding to the WM_INITMENU message
that is sent before any menu is displayed.


%index
GetSystemMetrics
指定されたシステムメトリックまたはシステム構成設定を取得する。
%group
Win32 user32
%prm
nIndex
nIndex : [int] 型: int
%inst
指定されたシステムメトリックまたはシステム構成設定を取得する。

[戻り値]
型: int 関数が成功した場合、戻り値は要求されたシステムメトリックまたは構成設定。失敗した場合は 0。GetLastError
は拡張エラー情報を提供しない。

[備考]
システムメトリックはディスプレイによって異なる場合がある。GetSystemMetrics(SM_CMONITORS)
は可視ディスプレイモニタのみをカウントする。SM_ARRANGE はシステムが最小化ウィンドウを配置する方法を指定する。
（以下省略）


%index
GetSystemMetricsForDpi
Retrieves the specified system metric or system configuration setting taking into account a provided DPI.
%group
Win32 user32
%prm
nIndex, dpi
nIndex : [int] The system metric or configuration setting to be retrieved. See GetSystemMetrics for the possible values.
dpi : [int] The DPI to use for scaling the metric.
%inst
Retrieves the specified system metric or system configuration setting
taking into account a provided DPI.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
This function returns the same result as GetSystemMetrics but scales
it according to an arbitrary DPI you provide if appropriate.


%index
GetTabbedTextExtentW
The GetTabbedTextExtent function computes the width and height of a character string. (Unicode)
%group
Win32 user32
%prm
hdc, lpString, chCount, nTabPositions, lpnTabStopPositions
hdc : [intptr] A handle to the device context.
lpString : [wstr] A pointer to a character string.
chCount : [int] The length of the text string. For the ANSI function it is a BYTE count and for the Unicode function it is a WORD count. Note that for the ANSI function, characters in SBCS code pages take one byte each, while most characters in DBCS code pages take two bytes; for the Unicode function, most currently defined Unicode characters (those in the Basic Multilingual Plane (BMP)) are one WORD while Unicode surrogates are two WORDs.
nTabPositions : [int] The number of tab-stop positions in the array pointed to by the lpnTabStopPositions parameter.
lpnTabStopPositions : [var] A pointer to an array containing the tab-stop positions, in device units. The tab stops must be sorted in increasing order; the smallest x-value should be the first item in the array.
%inst
The GetTabbedTextExtent function computes the width and height of a
character string. (Unicode)

[戻り値]
If the function succeeds, the return value is the dimensions of the
string in logical units. The height is in the high-order word and the
width is in the low-order word. If the function fails, the return
value is 0. GetTabbedTextExtent will fail if hDC is invalid and if
nTabPositions is less than 0.

[備考]
The current clipping region does not affect the width and height
returned by the GetTabbedTextExtent function. Because some devices do
not place characters in regular cell arrays (that is, they kern the
characters), the sum of the extents of the characters in a string may
not be equal to the extent of the string. If the nTabPositions
parameter is zero and the lpnTabStopPositions parameter is NULL, tabs
are expanded to eight times the average character width. If
nTabPositions is 1, the tab stops are separated by the distance
specified by the first value in the array to which
lpnTabStopPositions points.
> [!NOTE] > The winuser.h header defines GetTabbedTextExtent as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetThreadDesktop
Retrieves a handle to the desktop assigned to the specified thread.
%group
Win32 user32
%prm
dwThreadId
dwThreadId : [int] The thread identifier. The GetCurrentThreadId and CreateProcess functions return thread identifiers.
%inst
Retrieves a handle to the desktop assigned to the specified thread.

[戻り値]
If the function succeeds, the return value is a handle to the desktop
associated with the specified thread. You do not need to call the
CloseDesktop function to close the returned handle. If the function
fails, the return value is NULL. To get extended error information,
call GetLastError.

[備考]
The system associates a desktop with a thread when that thread is
created. A thread can use the SetThreadDesktop function to change its
desktop. The desktop associated with a thread must be on the window
station associated with the thread's process. The calling process can
use the returned handle in calls to the GetUserObjectInformation,
GetUserObjectSecurity, SetUserObjectInformation, and
SetUserObjectSecurity functions. A service application is created
with an associated window station and desktop, so there is no need to
call a USER or GDI function to connect the service to a window
station and desktop.


%index
GetThreadDpiAwarenessContext
Gets the DPI_AWARENESS_CONTEXT for the current thread.
%group
Win32 user32
%prm

%inst
Gets the DPI_AWARENESS_CONTEXT for the current thread.

[戻り値]
The current DPI_AWARENESS_CONTEXT for the thread.

[備考]
This method will return the latest DPI_AWARENESS_CONTEXT sent to
SetThreadDpiAwarenessContext. If SetThreadDpiAwarenessContext was
never called for this thread, then the return value will equal the
default DPI_AWARENESS_CONTEXT for the process.


%index
GetThreadDpiHostingBehavior
Retrieves the DPI_HOSTING_BEHAVIOR from the current thread.
%group
Win32 user32
%prm

%inst
Retrieves the DPI_HOSTING_BEHAVIOR from the current thread.

[戻り値]
The DPI_HOSTING_BEHAVIOR of the current thread.

[備考]
This API returns the hosting behavior set by an earlier call of
SetThreadDpiHostingBehavior, or DPI_HOSTING_BEHAVIOR_DEFAULT if no
earlier call has been made.


%index
GetTitleBarInfo
Retrieves information about the specified title bar.
%group
Win32 user32
%prm
hwnd, pti
hwnd : [intptr] Type: HWND A handle to the title bar whose information is to be retrieved.
pti : [var] Type: PTITLEBARINFO A pointer to a TITLEBARINFO structure to receive the information. Note that you must set the cbSize member to sizeof(TITLEBARINFO) before calling this function.
%inst
Retrieves information about the specified title bar.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
GetTopWindow
Examines the Z order of the child windows associated with the specified parent window and retrieves a handle to the child window at the top of the Z order.
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] Type: HWND A handle to the parent window whose child windows are to be examined. If this parameter is NULL, the function returns a handle to the window at the top of the Z order.
%inst
Examines the Z order of the child windows associated with the
specified parent window and retrieves a handle to the child window at
the top of the Z order.

[戻り値]
Type: HWND If the function succeeds, the return value is a handle to
the child window at the top of the Z order. If the specified window
has no child windows, the return value is NULL. To get extended error
information, use the GetLastError function.


%index
GetTouchInputInfo
Retrieves detailed information about touch inputs associated with a particular touch input handle.
%group
Win32 user32
%prm
hTouchInput, cInputs, pInputs, cbSize
hTouchInput : [intptr] The touch input handle received in the LPARAM of a touch message. The function fails with ERROR_INVALID_HANDLE if this handle is not valid. Note that the handle is not valid after it has been used in a successful call to CloseTouchInputHandle or after it has been passed to DefWindowProc, PostMessage, SendMessage or one of their variants.
cInputs : [int] The number of structures in the pInputs array. This should ideally be at least equal to the number of touch points associated with the message as indicated in the message WPARAM. If cInputs is less than the number of touch points, the function will still succeed and populate the pInputs buffer with information about cInputs touch points.
pInputs : [var] A pointer to an array of TOUCHINPUT structures to receive information about the touch points associated with the specified touch input handle.
cbSize : [int] The size, in bytes, of a single TOUCHINPUT structure. If cbSize is not the size of a single TOUCHINPUT structure, the function fails with ERROR_INVALID_PARAMETER.
%inst
Retrieves detailed information about touch inputs associated with a
particular touch input handle.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, use the GetLastError function.

[備考]
Calling CloseTouchInputHandle will not free memory associated with
values retrieved in a call to GetTouchInputInfo. Values in structures
passed to GetTouchInputInfo will be valid until you delete them.


%index
GetUnpredictedMessagePos
Gets pointer data before it has gone through touch prediction processing.
%group
Win32 user32
%prm

%inst
Gets pointer data before it has gone through touch prediction
processing.

[戻り値]
The screen location of the pointer input.

[備考]
By default, touch prediction is activated.


%index
GetUpdateRect
The GetUpdateRect function retrieves the coordinates of the smallest rectangle that completely encloses the update region of the specified window.
%group
Win32 user32
%prm
hWnd, lpRect, bErase
hWnd : [intptr] Handle to the window whose update region is to be retrieved.
lpRect : [var] Pointer to the RECT structure that receives the coordinates, in device units, of the enclosing rectangle. An application can set this parameter to NULL to determine whether an update region exists for the window. If this parameter is NULL, GetUpdateRect returns nonzero if an update region exists, and zero if one does not. This provides a simple and efficient means of determining whether a WM_PAINT message resulted from an invalid area.
bErase : [int] Specifies whether the background in the update region is to be erased. If this parameter is TRUE and the update region is not empty, GetUpdateRect sends a WM_ERASEBKGND message to the specified window to erase the background.
%inst
The GetUpdateRect function retrieves the coordinates of the smallest
rectangle that completely encloses the update region of the specified
window.

[戻り値]
If the update region is not empty, the return value is nonzero. If
there is no update region, the return value is zero.

[備考]
The update rectangle retrieved by the BeginPaint function is
identical to that retrieved by GetUpdateRect.
BeginPaint automatically validates the update region, so any call to
GetUpdateRect made immediately after the call to BeginPaint retrieves
an empty update region.


%index
GetUpdateRgn
The GetUpdateRgn function retrieves the update region of a window by copying it into the specified region. The coordinates of the update region are relative to the upper-left corner of the window (that is, they are client coordinates).
%group
Win32 user32
%prm
hWnd, hRgn, bErase
hWnd : [intptr] Handle to the window with an update region that is to be retrieved.
hRgn : [intptr] Handle to the region to receive the update region.
bErase : [int] Specifies whether the window background should be erased and whether nonclient areas of child windows should be drawn. If this parameter is FALSE, no drawing is done.
%inst
The GetUpdateRgn function retrieves the update region of a window by
copying it into the specified region. The coordinates of the update
region are relative to the upper-left corner of the window (that is,
they are client coordinates).

[戻り値]
The return value indicates the complexity of the resulting region; it
can be one of the following values.
This doc was truncated.

[備考]
The BeginPaint function automatically validates the update region, so
any call to GetUpdateRgn made immediately after the call to
BeginPaint retrieves an empty update region.


%index
GetUpdatedClipboardFormats
Retrieves the currently supported clipboard formats.
%group
Win32 user32
%prm
lpuiFormats, cFormats, pcFormatsOut
lpuiFormats : [var] Type: PUINT An array of clipboard formats. For a description of the standard clipboard formats, see Standard Clipboard Formats.
cFormats : [int] Type: UINT The number of entries in the array pointed to by lpuiFormats.
pcFormatsOut : [var] Type: PUINT The actual number of clipboard formats in the array pointed to by lpuiFormats.
%inst
Retrieves the currently supported clipboard formats.

[戻り値]
Type: BOOL The function returns TRUE if successful; otherwise, FALSE.
Call GetLastError for additional details.


%index
GetUserObjectInformationW
Retrieves information about the specified window station or desktop object. (Unicode)
%group
Win32 user32
%prm
hObj, nIndex, pvInfo, nLength, lpnLengthNeeded
hObj : [intptr] A handle to the window station or desktop object. This handle is returned by the CreateWindowStation, OpenWindowStation, CreateDesktop, or OpenDesktop function.
nIndex : [int] 
pvInfo : [intptr] A pointer to a buffer to receive the object information.
nLength : [int] The size of the buffer pointed to by the pvInfo parameter, in bytes.
lpnLengthNeeded : [var] A pointer to a variable receiving the number of bytes required to store the requested information. If this variable's value is greater than the value of the nLength parameter when the function returns, the function returns FALSE, and none of the information is copied to the pvInfo buffer. If the value of the variable pointed to by lpnLengthNeeded is less than or equal to the value of nLength, the entire information block is copied.
%inst
Retrieves information about the specified window station or desktop
object. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
> [!NOTE] > The winuser.h header defines GetUserObjectInformation as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetUserObjectSecurity
Retrieves security information for the specified user object.
%group
Win32 user32
%prm
hObj, pSIRequested, pSID, nLength, lpnLengthNeeded
hObj : [intptr] A handle to the user object for which to return security information.
pSIRequested : [var] A pointer to a SECURITY_INFORMATION value that specifies the security information being requested.
pSID : [int] A pointer to a SECURITY_DESCRIPTOR structure in self-relative format that contains the requested information when the function returns. This buffer must be aligned on a 4-byte boundary.
nLength : [int] The length, in bytes, of the buffer pointed to by the pSD parameter.
lpnLengthNeeded : [var] A pointer to a variable to receive the number of bytes required to store the complete security descriptor. If this variable's value is greater than the value of the nLength parameter when the function returns, the function returns FALSE and none of the security descriptor is copied to the buffer. Otherwise, the entire security descriptor is copied.
%inst
Retrieves security information for the specified user object.

[戻り値]
If the function succeeds, the function returns nonzero.
If the function fails, it returns zero. To get extended error
information, call GetLastError.

[備考]
To read the owner, group, or discretionary access control list (DACL)
from the user object's security descriptor, the calling process must
have been granted READ_CONTROL access when the handle was opened. To
read the system access control list (SACL) from the security
descriptor, the calling process must have been granted
ACCESS_SYSTEM_SECURITY access when the handle was opened. The correct
way to get this access is to enable the SE_SECURITY_NAME privilege in
the caller's current token, open the handle for
ACCESS_SYSTEM_SECURITY access, and then disable the privilege.


%index
GetWindow
Retrieves a handle to a window that has the specified relationship (Z-Order or owner) to the specified window.
%group
Win32 user32
%prm
hWnd, uCmd
hWnd : [intptr] Type: HWND A handle to a window. The window handle retrieved is relative to this window, based on the value of the uCmd parameter.
uCmd : [int] Type: UINT
%inst
Retrieves a handle to a window that has the specified relationship
(Z-Order or owner) to the specified window.

[戻り値]
Type: HWND If the function succeeds, the return value is a window
handle. If no window exists with the specified relationship to the
specified window, the return value is NULL. To get extended error
information, call GetLastError.

[備考]
The EnumChildWindows function is more reliable than calling GetWindow
in a loop. An application that calls GetWindow to perform this task
risks being caught in an infinite loop or referencing a handle to a
window that has been destroyed.


%index
GetWindowContextHelpId
Retrieves the Help context identifier, if any, associated with the specified window.
%group
Win32 user32
%prm
param0
param0 : [intptr] 
%inst
Retrieves the Help context identifier, if any, associated with the
specified window.

[戻り値]
Type: DWORD Returns the Help context identifier if the window has
one, or zero otherwise.


%index
GetWindowDC
The GetWindowDC function retrieves the device context (DC) for the entire window, including title bar, menus, and scroll bars.
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] A handle to the window with a device context that is to be retrieved. If this value is NULL, GetWindowDC retrieves the device context for the entire screen. If this parameter is NULL, GetWindowDC retrieves the device context for the primary display monitor. To get the device context for other display monitors, use the EnumDisplayMonitors and CreateDC functions.
%inst
The GetWindowDC function retrieves the device context (DC) for the
entire window, including title bar, menus, and scroll bars.

[戻り値]
If the function succeeds, the return value is a handle to a device
context for the specified window. If the function fails, the return
value is NULL, indicating an error or an invalid hWnd parameter.

[備考]
GetWindowDC is intended for special painting effects within a
window's nonclient area. Painting in nonclient areas of any window is
not recommended. The GetSystemMetrics function can be used to
retrieve the dimensions of various parts of the nonclient area, such
as the title bar, menu, and scroll bars. The GetDC function can be
used to retrieve a device context for the entire screen. After
painting is complete, the ReleaseDC function must be called to
release the device context. Not releasing the window device context
has serious effects on painting requested by applications.


%index
GetWindowDisplayAffinity
Retrieves the current display affinity setting, from any process, for a given window.
%group
Win32 user32
%prm
hWnd, pdwAffinity
hWnd : [intptr] Type: HWND A handle to the window.
pdwAffinity : [var] Type: DWORD* A pointer to a variable that receives the display affinity setting. See SetWindowDisplayAffinity for a list of affinity settings and their meanings.
%inst
Retrieves the current display affinity setting, from any process, for
a given window.

[戻り値]
Type: BOOL This function succeeds only when the window is layered and
Desktop Windows Manager is composing the desktop. If this function
succeeds, it returns TRUE; otherwise, it returns FALSE. To get
extended error information, call GetLastError.

[備考]
This function and SetWindowDisplayAffinity are designed to support
the window content protection feature unique to Windows 7. This
feature enables applications to protect their own onscreen window
content from being captured or copied via a specific set of public
operating system features and APIs. However, it works only when the
Desktop Window Manager (DWM) is composing the desktop.
It is important to note that unlike a security feature or an
implementation of Digital Rights Management (DRM), there is no
guarantee that using SetWindowDisplayAffinity and
GetWindowDisplayAffinity, and other necessary functions such as
DwmIsCompositionEnabled, will strictly protect windowed content, as
in the case where someone takes a photograph of the screen.


%index
GetWindowDpiAwarenessContext
Returns the DPI_AWARENESS_CONTEXT associated with a window.
%group
Win32 user32
%prm
hwnd
hwnd : [intptr] The window to query.
%inst
Returns the DPI_AWARENESS_CONTEXT associated with a window.

[戻り値]
The DPI_AWARENESS_CONTEXT for the provided window. If the window is
not valid, the return value is NULL.

[備考]
Important The return value of GetWindowDpiAwarenessContext is not
affected by the DPI_AWARENESS of the current thread. It only
indicates the context of the window specified by the hwnd input
parameter.


%index
GetWindowDpiHostingBehavior
Returns the DPI_HOSTING_BEHAVIOR of the specified window.
%group
Win32 user32
%prm
hwnd
hwnd : [intptr] The handle for the window to examine.
%inst
Returns the DPI_HOSTING_BEHAVIOR of the specified window.

[戻り値]
The DPI_HOSTING_BEHAVIOR of the specified window.

[備考]
This API allows you to examine the hosting behavior of a window after
it has been created. A window's hosting behavior is the hosting
behavior of the thread in which the window was created, as set by a
call to SetThreadDpiHostingBehavior. This is a permanent value and
cannot be changed after the window is created, even if the thread's
hosting behavior is changed.


%index
GetWindowFeedbackSetting
Retrieves the feedback configuration for a window.
%group
Win32 user32
%prm
hwnd, feedback, dwFlags, pSize, config
hwnd : [intptr] The window to check for feedback configuration.
feedback : [int] One of the values from the FEEDBACK_TYPE enumeration.
dwFlags : [int] Specify GWFS_INCLUDE_ANCESTORS to check the parent window chain until a value is found. The default is 0 and indicates that only the specified window will be checked.
pSize : [var] The size of memory region that the config parameter points to. The pSize parameter specifies the size of the configuration data for the feedback type in feedback and must be sizeof(BOOL).
config : [intptr] The configuration data. The config parameter must point to a value of type BOOL.
%inst
Retrieves the feedback configuration for a window.

[戻り値]
Returns TRUE if the specified feedback setting is configured on the
specified window. Otherwise, it returns FALSE (and config won't be
modified).


%index
GetWindowInfo
Retrieves information about the specified window. (GetWindowInfo)
%group
Win32 user32
%prm
hwnd, pwi
hwnd : [intptr] Type: HWND A handle to the window whose information is to be retrieved.
pwi : [var] Type: PWINDOWINFO A pointer to a WINDOWINFO structure to receive the information. Note that you must set the cbSize member to sizeof(WINDOWINFO) before calling this function.
%inst
Retrieves information about the specified window. (GetWindowInfo)

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
GetWindowLongW
Retrieves information about the specified window. (GetWindowLongW)
%group
Win32 user32
%prm
hWnd, nIndex
hWnd : [intptr] Type: HWND A handle to the window and, indirectly, the class to which the window belongs.
nIndex : [int] Type: int
%inst
Retrieves information about the specified window. (GetWindowLongW)

[戻り値]
Type: LONG If the function succeeds, the return value is the
requested value. If the function fails, the return value is zero. To
get extended error information, call GetLastError. If SetWindowLong
has not been called previously, GetWindowLong returns zero for values
in the extra window or class memory.

[備考]
Reserve extra window memory by specifying a nonzero value in the
cbWndExtra member of the WNDCLASSEX structure used with the
RegisterClassEx function.


%index
GetWindowModuleFileNameW
Retrieves the full path and file name of the module associated with the specified window handle. (Unicode)
%group
Win32 user32
%prm
hwnd, pszFileName, cchFileNameMax
hwnd : [intptr] Type: HWND A handle to the window whose module file name is to be retrieved.
pszFileName : [wstr] Type: LPTSTR The path and file name.
cchFileNameMax : [int] Type: UINT The maximum number of characters that can be copied into the lpszFileName buffer.
%inst
Retrieves the full path and file name of the module associated with
the specified window handle. (Unicode)

[戻り値]
Type: UINT The return value is the total number of characters copied
into the buffer.

[備考]
> [!NOTE] > The winuser.h header defines GetWindowModuleFileName as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetWindowPlacement
Retrieves the show state and the restored, minimized, and maximized positions of the specified window.
%group
Win32 user32
%prm
hWnd, lpwndpl
hWnd : [intptr] Type: HWND A handle to the window.
lpwndpl : [var] Type: WINDOWPLACEMENT* A pointer to the WINDOWPLACEMENT structure that receives the show state and position information. Before calling GetWindowPlacement, set the length member to sizeof(WINDOWPLACEMENT). GetWindowPlacement fails if lpwndpl-> length is not set correctly.
%inst
Retrieves the show state and the restored, minimized, and maximized
positions of the specified window.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The flags member of WINDOWPLACEMENT retrieved by this function is
always zero. If the window identified by the hWnd parameter is
maximized, the showCmd member is SW_SHOWMAXIMIZED. If the window is
minimized, showCmd is SW_SHOWMINIMIZED. Otherwise, it is
SW_SHOWNORMAL. The length member of WINDOWPLACEMENT must be set to
sizeof(WINDOWPLACEMENT). If this member is not set correctly, the
function returns FALSE. For additional remarks on the proper use of
window placement coordinates, see WINDOWPLACEMENT.


%index
GetWindowRect
指定したウィンドウの外接矩形の寸法を取得する。寸法は画面左上隅を原点とするスクリーン座標で返される。
%group
Win32 user32
%prm
hWnd, lpRect
hWnd : [intptr] 型: HWND ウィンドウへのハンドル。
lpRect : [var] 型: LPRECT ウィンドウの左上および右下隅のスクリーン座標を受け取る RECT 構造体へのポインタ。
%inst
指定したウィンドウの外接矩形の寸法を取得する。寸法は画面左上隅を原点とするスクリーン座標で返される。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報を得るには GetLastError
を呼び出す。

[備考]
RECT 構造体の規約に従い、返される矩形の右下座標は排他的(exclusive)である。つまり (right, bottom)
のピクセルは矩形のすぐ外側に位置する。GetWindowRect は DPI に対して仮想化されている。Windows Vista
以降、Window Rect にはドロップシャドウが占める領域も含まれる。GetWindowRect
の動作はウィンドウが一度でも表示されたかどうかに依存する。まだ表示されていない場合、GetWindowRect
にはドロップシャドウ領域は含まれない。ドロップシャドウを除いた境界を取得するには、DwmGetWindowAttribute に
DWMWA_EXTENDED_FRAME_BOUNDS を指定する。Window Rect と異なり、DWM Extended Frame
Bounds は DPI 補正されない点に注意。拡張フレーム境界の取得はウィンドウが少なくとも一度表示された後でのみ可能である。


%index
GetWindowRgn
The GetWindowRgn function obtains a copy of the window region of a window.
%group
Win32 user32
%prm
hWnd, hRgn
hWnd : [intptr] Handle to the window whose window region is to be obtained.
hRgn : [intptr] Handle to the region which will be modified to represent the window region.
%inst
The GetWindowRgn function obtains a copy of the window region of a
window.

[戻り値]
The return value specifies the type of the region that the function
obtains. It can be one of the following values.
This doc was truncated.

[備考]
The coordinates of a window's window region are relative to the
upper-left corner of the window, not the client area of the window.
To set the window region of a window, call the SetWindowRgn function.


%index
GetWindowRgnBox
The GetWindowRgnBox function retrieves the dimensions of the tightest bounding rectangle for the window region of a window.
%group
Win32 user32
%prm
hWnd, lprc
hWnd : [intptr] Handle to the window.
lprc : [var] Pointer to a RECT structure that receives the rectangle dimensions, in device units relative to the upper-left corner of the window.
%inst
The GetWindowRgnBox function retrieves the dimensions of the tightest
bounding rectangle for the window region of a window.

[戻り値]
The return value specifies the type of the region that the function
obtains. It can be one of the following values.
This doc was truncated.

[備考]
The window region determines the area within the window where the
system permits drawing. The system does not display any portion of a
window that lies outside of the window region. The coordinates of a
window's window region are relative to the upper-left corner of the
window, not the client area of the window. To set the window region
of a window, call the SetWindowRgn function.


%index
GetWindowTextW
Copies the text of the specified window's title bar (if it has one) into a buffer. If the specified window is a control, the text of the control is copied. However, GetWindowText cannot retrieve the text of a control in another application. (Unicode)
%group
Win32 user32
%prm
hWnd, lpString, nMaxCount
hWnd : [intptr] Type: HWND A handle to the window or control containing the text.
lpString : [wstr] Type: LPTSTR The buffer that will receive the text. If the string is as long or longer than the buffer, the string is truncated and terminated with a null character.
nMaxCount : [int] Type: int The maximum number of characters to copy to the buffer, including the null character. If the text exceeds this limit, it is truncated.
%inst
Copies the text of the specified window's title bar (if it has one)
into a buffer. If the specified window is a control, the text of the
control is copied. However, GetWindowText cannot retrieve the text of
a control in another application. (Unicode)

[戻り値]
Type: int If the function succeeds, the return value is the length,
in characters, of the copied string, not including the terminating
null character. If the window has no title bar or text, if the title
bar is empty, or if the window or control handle is invalid, the
return value is zero. To get extended error information, call
GetLastError. This function cannot retrieve the text of an edit
control in another application.

[備考]
If the target window is owned by the current process, GetWindowText
causes a WM_GETTEXT message to be sent to the specified window or
control. If the target window is owned by another process and has a
caption, GetWindowText retrieves the window caption text. If the
window does not have a caption, the return value is a null string.
This behavior is by design. It allows applications to call
GetWindowText without becoming unresponsive if the process that owns
the target window is not responding. However, if the target window is
not responding and it belongs to the calling application,
GetWindowText will cause the calling application to become
unresponsive. To retrieve the text of a control in another process,
send a WM_GETTEXT message directly instead of calling GetWindowText.


%index
GetWindowTextLengthW
Retrieves the length, in characters, of the specified window's title bar text (if the window has a title bar). (Unicode)
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] Type: HWND A handle to the window or control.
%inst
Retrieves the length, in characters, of the specified window's title
bar text (if the window has a title bar). (Unicode)

[戻り値]
Type: int If the function succeeds, the return value is the length,
in characters, of the text. Under certain conditions, this value
might be greater than the length of the text (see Remarks). If the
window has no text, the return value is zero. Function failure is
indicated by a return value of zero and a GetLastError result that is
nonzero. > [!NOTE] > This function does not clear the most recent
error information. To determine success or failure, clear the most
recent error information by calling SetLastError with 0, then call
GetLastError.

[備考]
If the target window is owned by the current process,
GetWindowTextLength causes a WM_GETTEXTLENGTH message to be sent to
the specified window or control. Under certain conditions, the
GetWindowTextLength function may return a value that is larger than
the actual length of the text. This occurs with certain mixtures of
ANSI and Unicode, and is due to the system allowing for the possible
existence of double-byte character set (DBCS) characters within the
text. The return value, however, will always be at least as large as
the actual length of the text; you can thus always use it to guide
buffer allocation. This behavior can occur when an application uses
both ANSI functions and common dialogs, which use Unicode. It can
also occur when an application uses the ANSI version of
GetWindowTextLength with a window whose window procedure is Unicode,
or the Unicode version of GetWindowTextLength with a window whose
window procedure is ANSI. For more information on ANSI and ANSI
functions, see Conventions for Function Prototypes. To obtain the
exact length of the text, use the WM_GETTEXT, LB_GETTEXT, or
CB_GETLBTEXT messages, or the GetWindowText function.
> [!NOTE] > The winuser.h header defines GetWindowTextLength as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
GetWindowThreadProcessId
Retrieves the identifier of the thread that created the specified window and, optionally, the identifier of the process that created the window.
%group
Win32 user32
%prm
hWnd, lpdwProcessId
hWnd : [intptr] Type: HWND A handle to the window.
lpdwProcessId : [var] Type: LPDWORD A pointer to a variable that receives the process identifier. If this parameter is not NULL, GetWindowThreadProcessId copies the identifier of the process to the variable; otherwise, it does not. If the function fails, the value of the variable is unchanged.
%inst
Retrieves the identifier of the thread that created the specified
window and, optionally, the identifier of the process that created
the window.

[戻り値]
Type: DWORD If the function succeeds, the return value is the
identifier of the thread that created the window. If the window
handle is invalid, the return value is zero. To get extended error
information, call GetLastError.


%index
GetWindowWord
Retrieves the 16-bit (**DWORD**) value at the specified offset into the extra window memor
%group
Win32 user32
%prm
hWnd, nIndex
hWnd : [intptr] A handle to the window and, indirectly, the class to which the window belongs.
nIndex : [int] 
%inst
Retrieves the 16-bit (**DWORD**) value at the specified offset into
the extra window memor

[戻り値]
If the function succeeds, the return value is the requested value. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Reserve extra window memory by specifying a nonzero value in the
cbWndExtra member of the WNDCLASSEX structure used with the
RegisterClassEx function.


%index
GrayStringW
The GrayString function draws gray text at the specified location. (Unicode)
%group
Win32 user32
%prm
hDC, hBrush, lpOutputFunc, lpData, nCount, X, Y, nWidth, nHeight
hDC : [intptr] A handle to the device context.
hBrush : [intptr] A handle to the brush to be used for graying. If this parameter is NULL, the text is grayed with the same brush that was used to draw window text.
lpOutputFunc : [int] A pointer to the application-defined function that will draw the string, or, if TextOut is to be used to draw the string, it is a NULL pointer. For details, see the OutputProc callback function.
lpData : [intptr] A pointer to data to be passed to the output function. If the lpOutputFunc parameter is NULL, lpData must be a pointer to the string to be output.
nCount : [int] The number of characters to be output. If the nCount parameter is zero, GrayString calculates the length of the string (assuming lpData is a pointer to the string). If nCount is 1 and the function pointed to by lpOutputFunc returns FALSE, the image is shown but not grayed.
X : [int] The device x-coordinate of the starting position of the rectangle that encloses the string.
Y : [int] The device y-coordinate of the starting position of the rectangle that encloses the string.
nWidth : [int] The width, in device units, of the rectangle that encloses the string. If this parameter is zero, GrayString calculates the width of the area, assuming lpData is a pointer to the string.
nHeight : [int] The height, in device units, of the rectangle that encloses the string. If this parameter is zero, GrayString calculates the height of the area, assuming lpData is a pointer to the string.
%inst
The GrayString function draws gray text at the specified location.
(Unicode)

[戻り値]
If the string is drawn, the return value is nonzero. If either the
TextOut function or the application-defined output function returned
zero, or there was insufficient memory to create a memory bitmap for
graying, the return value is zero.

[備考]
Without calling GrayString, an application can draw grayed strings on
devices that support a solid gray color. The system color
COLOR_GRAYTEXT is the solid-gray system color used to draw disabled
text. The application can call the GetSysColor function to retrieve
the color value of COLOR_GRAYTEXT. If the color is other than zero
(black), the application can call the SetTextColor function to set
the text color to the color value and then draw the string directly.
If the retrieved color is black, the application must call GrayString
to gray the text.
> [!NOTE] > The winuser.h header defines GrayString as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
HideCaret
Removes the caret from the screen. Hiding a caret does not destroy its current shape or invalidate the insertion point.
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] Type: HWND A handle to the window that owns the caret. If this parameter is NULL, HideCaret searches the current task for the window that owns the caret.
%inst
Removes the caret from the screen. Hiding a caret does not destroy
its current shape or invalidate the insertion point.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
HideCaret hides the caret only if the specified window owns the
caret. If the specified window does not own the caret, HideCaret does
nothing and returns FALSE. Hiding is cumulative. If your application
calls HideCaret five times in a row, it must also call ShowCaret five
times before the caret is displayed. For an example, see Hiding a
Caret.


%index
HiliteMenuItem
Adds or removes highlighting from an item in a menu bar.
%group
Win32 user32
%prm
hWnd, hMenu, uIDHiliteItem, uHilite
hWnd : [intptr] Type: HWND A handle to the window that contains the menu.
hMenu : [intptr] Type: HMENU A handle to the menu bar that contains the item.
uIDHiliteItem : [int] Type: UINT The menu item. This parameter is either the identifier of the menu item or the offset of the menu item in the menu bar, depending on the value of the uHilite parameter.
uHilite : [int] Type: UINT Controls the interpretation of the uItemHilite parameter and indicates whether the menu item is highlighted. This parameter must be a combination of either MF_BYCOMMAND or MF_BYPOSITION and MF_HILITE or MF_UNHILITE.
%inst
Adds or removes highlighting from an item in a menu bar.

[戻り値]
Type: BOOL If the menu item is set to the specified highlight state,
the return value is nonzero. If the menu item is not set to the
specified highlight state, the return value is zero.

[備考]
The MF_HILITE and MF_UNHILITE flags can be used only with the
HiliteMenuItem function; they cannot be used with the ModifyMenu
function.


%index
IMPGetIMEA
(no summary)
%group
Win32 user32
%prm
param0, param1
param0 : [intptr] 
param1 : [var] 
%inst



%index
IMPGetIMEW
(no summary)
%group
Win32 user32
%prm
param0, param1
param0 : [intptr] 
param1 : [var] 
%inst



%index
IMPQueryIMEA
(no summary)
%group
Win32 user32
%prm
param0
param0 : [var] 
%inst



%index
IMPQueryIMEW
(no summary)
%group
Win32 user32
%prm
param0
param0 : [var] 
%inst



%index
IMPSetIMEA
(no summary)
%group
Win32 user32
%prm
param0, param1
param0 : [intptr] 
param1 : [var] 
%inst



%index
IMPSetIMEW
(no summary)
%group
Win32 user32
%prm
param0, param1
param0 : [intptr] 
param1 : [var] 
%inst



%index
ImpersonateDdeClientWindow
Enables a Dynamic Data Exchange (DDE) server application to impersonate a DDE client application's security context. This protects secure server data from unauthorized DDE clients.
%group
Win32 user32
%prm
hWndClient, hWndServer
hWndClient : [intptr] Type: HWND A handle to the DDE client window to be impersonated. The client window must have established a DDE conversation with the server window identified by the hWndServer parameter.
hWndServer : [intptr] Type: HWND A handle to the DDE server window. An application must create the server window before calling this function.
%inst
Enables a Dynamic Data Exchange (DDE) server application to
impersonate a DDE client application's security context. This
protects secure server data from unauthorized DDE clients.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
An application should call the RevertToSelf function to undo the
impersonation set by the ImpersonateDdeClientWindow function. A DDEML
application should use the DdeImpersonateClient function. Security
Considerations Using this function incorrectly might compromise the
security of your program. It is very important to check the return
value of the call. If the function fails for any reason, the client
is not impersonated and any subsequent client request is made in the
security context of the calling process. If the calling process is
running as a highly privileged account, such as LocalSystem or as a
member of an administrative group, the user may be able to perform
actions that would otherwise be disallowed. Therefore, if the call
fails or raises an error do not continue execution of the client
request.


%index
InSendMessage
Determines whether the current window procedure is processing a message that was sent from another thread (in the same process or a different process) by a call to the SendMessage function.
%group
Win32 user32
%prm

%inst
Determines whether the current window procedure is processing a
message that was sent from another thread (in the same process or a
different process) by a call to the SendMessage function.

[戻り値]
Type: BOOL If the window procedure is processing a message sent to it
from another thread using the SendMessage function, the return value
is nonzero. If the window procedure is not processing a message sent
to it from another thread using the SendMessage function, the return
value is zero.


%index
InSendMessageEx
Determines whether the current window procedure is processing a message that was sent from another thread (in the same process or a different process).
%group
Win32 user32
%prm
lpReserved
lpReserved : [intptr] Type: LPVOID Reserved; must be NULL.
%inst
Determines whether the current window procedure is processing a
message that was sent from another thread (in the same process or a
different process).

[戻り値]
Type: DWORD If the message was not sent, the return value is
ISMEX_NOSEND (0x00000000). Otherwise, the return value is one or more
of the following values.
This doc was truncated.

[備考]
To determine if the sender is blocked, use the following test:
fBlocked = ( InSendMessageEx(NULL) & (ISMEX_REPLIED|ISMEX_SEND) ) ==
ISMEX_SEND;


%index
InflateRect
The InflateRect function increases or decreases the width and height of the specified rectangle.
%group
Win32 user32
%prm
lprc, dx, dy
lprc : [var] A pointer to the RECT structure that increases or decreases in size.
dx : [int] The amount to increase or decrease the rectangle width. This parameter must be negative to decrease the width.
dy : [int] The amount to increase or decrease the rectangle height. This parameter must be negative to decrease the height.
%inst
The InflateRect function increases or decreases the width and height
of the specified rectangle.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
Because applications can use rectangles for different purposes, the
rectangle functions do not use an explicit unit of measure. Instead,
all rectangle coordinates and dimensions are given in signed, logical
values. The mapping mode and the function in which the rectangle is
used determine the units of measure.


%index
InheritWindowMonitor
(no summary)
%group
Win32 user32
%prm
hwnd, hwndInherit
hwnd : [intptr] 
hwndInherit : [intptr] 
%inst



%index
InitializeTouchInjection
Configures the touch injection context for the calling application and initializes the maximum number of simultaneous contacts that the app can inject.
%group
Win32 user32
%prm
maxCount, dwMode
maxCount : [int] The maximum number of touch contacts. The maxCount parameter must be greater than 0 and less than or equal to MAX_TOUCH_COUNT (256) as  defined in winuser.h.
dwMode : [int] The contact visualization mode. The dwMode parameter must be   TOUCH_FEEDBACK_DEFAULT, TOUCH_FEEDBACK_INDIRECT, or TOUCH_FEEDBACK_NONE.
%inst
Configures the touch injection context for the calling application
and initializes the maximum number of simultaneous contacts that the
app can inject.

[戻り値]
If the function succeeds, the return value is TRUE. If the function
fails, the return value is FALSE. To get extended error information,
call GetLastError.

[備考]
If TOUCH_FEEDBACK_DEFAULT is set, the injected touch feedback may get
suppressed by the end-user settings in the Pen and Touch control
panel. If TOUCH_FEEDBACK_INDIRECT is set, the injected touch feedback
overrides the end-user settings in the Pen and Touch control panel.
If TOUCH_FEEDBACK_INDIRECT or TOUCH_FEEDBACK_NONE are set, touch
feedback provided by applications and controls may not be affected.


%index
InjectSyntheticPointerInput
Simulates pointer input (pen or touch).
%group
Win32 user32
%prm
device, pointerInfo, count
device : [intptr] A handle to the pointer injection device created by CreateSyntheticPointerDevice.
pointerInfo : [var] An array of [POINTER_TYPE_INFO](ns-winuser-pointer_type_info.md) structures represneting the injected pointers. The type must match the pointerType parameter of the CreateSyntheticPointerDevice call that created the injection device.
count : [int] The number of contacts.
%inst
Simulates pointer input (pen or touch).

[戻り値]
If this function succeeds, it returns TRUE. Otherwise, it returns
FALSE. To retrieve extended error information, call the GetLastError
function.


%index
InjectTouchInput
Simulates touch input.
%group
Win32 user32
%prm
count, contacts
count : [int] The size of the array in contacts. The maximum value for count is specified by the maxCount parameter of the InitializeTouchInjection function.
contacts : [var] Array of POINTER_TOUCH_INFO structures that represents all contacts on the desktop. The  screen coordinates of each contact must be within the bounds of the desktop.
%inst
Simulates touch input.

[戻り値]
If the function succeeds, the return value is non-zero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The injected input is sent to the desktop of the session where the
injection process is running. There are two input states for touch
input injection (interactive and hover) that are indicated by the
following combinations of pointerFlags in contacts:
This doc was truncated.


%index
InsertMenuW
Inserts a new menu item into a menu, moving other items down the menu. (Unicode)
%group
Win32 user32
%prm
hMenu, uPosition, uFlags, uIDNewItem, lpNewItem
hMenu : [intptr] Type: HMENU A handle to the menu to be changed.
uPosition : [int] Type: UINT The menu item before which the new menu item is to be inserted, as determined by the uFlags parameter.
uFlags : [int] Type: UINT Controls the interpretation of the uPosition parameter and the content, appearance, and behavior of the new menu item. This parameter must include one of the following required values.
uIDNewItem : [int] Type: UINT_PTR The identifier of the new menu item or, if the uFlags parameter has the MF_POPUP flag set, a handle to the drop-down menu or submenu.
lpNewItem : [wstr] Type: LPCTSTR The content of the new menu item. The interpretation of lpNewItem depends on whether the uFlags parameter includes the MF_BITMAP, MF_OWNERDRAW, or MF_STRING flag, as follows.
%inst
Inserts a new menu item into a menu, moving other items down the
menu. (Unicode)

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The application must call the DrawMenuBar function whenever a menu
changes, whether the menu is in a displayed window. The following
groups of flags cannot be used together:
This doc was truncated.


%index
InsertMenuItemW
Inserts a new menu item at the specified position in a menu. (Unicode)
%group
Win32 user32
%prm
hmenu, item, fByPosition, lpmi
hmenu : [intptr] Type: HMENU A handle to the menu in which the new menu item is inserted.
item : [int] Type: UINT The identifier or position of the menu item before which to insert the new item. The meaning of this parameter depends on the value of fByPosition.
fByPosition : [int] Type: BOOL Controls the meaning of item. If this parameter is FALSE, item is a menu item identifier. Otherwise, it is a menu item position. See Accessing Menu Items Programmatically for more information.
lpmi : [var] Type: LPCMENUITEMINFO A pointer to a MENUITEMINFO structure that contains information about the new menu item.
%inst
Inserts a new menu item at the specified position in a menu.
(Unicode)

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, use the GetLastError function.

[備考]
The application must call the DrawMenuBar function whenever a menu
changes, whether the menu is in a displayed window. In order for
keyboard accelerators to work with bitmap or owner-drawn menu items,
the owner of the menu must process the WM_MENUCHAR message. See
Owner-Drawn Menus and the WM_MENUCHAR Message for more information.


%index
InternalGetWindowText
Copies the text of the specified window's title bar (if it has one) into a buffer.
%group
Win32 user32
%prm
hWnd, pString, cchMaxCount
hWnd : [intptr] Type: HWND A handle to the window or control containing the text.
pString : [wstr] Type: LPWSTR The buffer that is to receive the text. If the string is as long or longer than the buffer, the string is truncated and terminated with a null character.
cchMaxCount : [int] Type: int The maximum number of characters to be copied to the buffer, including the null character. If the text exceeds this limit, it is truncated.
%inst
Copies the text of the specified window's title bar (if it has one)
into a buffer.

[戻り値]
Type: int If the function succeeds, the return value is the length,
in characters, of the copied string, not including the terminating
null character. If the window has no title bar or text, if the title
bar is empty, or if the window or control handle is invalid, the
return value is zero. To get extended error information, call
GetLastError.

[備考]
This function was not included in the SDK headers and libraries until
Windows XP with Service Pack 1 (SP1) and Windows Server 2003. If you
do not have a header file and import library for this function, you
can call the function using LoadLibrary and GetProcAddress.


%index
IntersectRect
The IntersectRect function calculates the intersection of two source rectangles and places the coordinates of the intersection rectangle into the destination rectangle.
%group
Win32 user32
%prm
lprcDst, lprcSrc1, lprcSrc2
lprcDst : [var] A pointer to the RECT structure that is to receive the intersection of the rectangles pointed to by the lprcSrc1 and lprcSrc2 parameters. This parameter cannot be NULL.
lprcSrc1 : [var] A pointer to the RECT structure that contains the first source rectangle.
lprcSrc2 : [var] A pointer to the RECT structure that contains the second source rectangle.
%inst
The IntersectRect function calculates the intersection of two source
rectangles and places the coordinates of the intersection rectangle
into the destination rectangle.

[戻り値]
If the rectangles intersect, the return value is nonzero. If the
rectangles do not intersect, the return value is zero.

[備考]
Because applications can use rectangles for different purposes, the
rectangle functions do not use an explicit unit of measure. Instead,
all rectangle coordinates and dimensions are given in signed, logical
values. The mapping mode and the function in which the rectangle is
used determine the units of measure.


%index
InvalidateRect
The InvalidateRect function adds a rectangle to the specified window's update region. The update region represents the portion of the window's client area that must be redrawn.
%group
Win32 user32
%prm
hWnd, lpRect, bErase
hWnd : [intptr] A handle to the window whose update region has changed. If this parameter is NULL, the system invalidates and redraws all windows, not just the windows for this application, and sends the WM_ERASEBKGND and WM_NCPAINT messages before the function returns. Setting this parameter to NULL is not recommended.
lpRect : [var] A pointer to a RECT structure that contains the client coordinates of the rectangle to be added to the update region. If this parameter is NULL, the entire client area is added to the update region.
bErase : [int] Specifies whether the background within the update region is to be erased when the update region is processed. If this parameter is TRUE, the background is erased when the BeginPaint function is called. If this parameter is FALSE, the background remains unchanged.
%inst
The InvalidateRect function adds a rectangle to the specified
window's update region. The update region represents the portion of
the window's client area that must be redrawn.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The invalidated areas accumulate in the update region until the
region is processed when the next WM_PAINT message occurs or until
the region is validated by using the ValidateRect or ValidateRgn
function. The system sends a WM_PAINT message to a window whenever
its update region is not empty and there are no other messages in the
application queue for that window. If the bErase parameter is TRUE
for any part of the update region, the background is erased in the
entire region, not just in the specified part.


%index
InvalidateRgn
The InvalidateRgn function invalidates the client area within the specified region by adding it to the current update region of a window.
%group
Win32 user32
%prm
hWnd, hRgn, bErase
hWnd : [intptr] A handle to the window with an update region that is to be modified.
hRgn : [intptr] A handle to the region to be added to the update region. The region is assumed to have client coordinates. If this parameter is NULL, the entire client area is added to the update region.
bErase : [int] Specifies whether the background within the update region should be erased when the update region is processed. If this parameter is TRUE, the background is erased when the BeginPaint function is called. If the parameter is FALSE, the background remains unchanged.
%inst
The InvalidateRgn function invalidates the client area within the
specified region by adding it to the current update region of a
window.

[戻り値]
The return value is always nonzero.

[備考]
Invalidated areas accumulate in the update region until the next
WM_PAINT message is processed or until the region is validated by
using the ValidateRect or ValidateRgn function. The system sends a
WM_PAINT message to a window whenever its update region is not empty
and there are no other messages in the application queue for that
window. The specified region must have been created by using one of
the region functions. If the bErase parameter is TRUE for any part of
the update region, the background in the entire region is erased, not
just in the specified part.


%index
InvertRect
矩形内の各ピクセルの色値に対して論理 NOT 演算を行って、ウィンドウ内の矩形を反転する。
%group
Win32 user32
%prm
hDC, lprc
hDC : [intptr] デバイスコンテキストへのハンドル。
lprc : [var] 反転する矩形の論理座標を含む RECT 構造体へのポインタ。
%inst
矩形内の各ピクセルの色値に対して論理 NOT 演算を行って、ウィンドウ内の矩形を反転する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
モノクロ画面では InvertRect
は白ピクセルを黒に、黒ピクセルを白にする。カラー画面では画面の色生成方式によって反転結果が決まる。同じ矩形に対して InvertRect
を 2 回呼ぶと、画面は元の色に戻る。


%index
IsCharAlphaW
Determines whether a character is an alphabetical character. This determination is based on the semantics of the language selected by the user during setup or through Control Panel. (Unicode)
%group
Win32 user32
%prm
ch
ch : [int] Type: TCHAR The character to be tested.
%inst
Determines whether a character is an alphabetical character. This
determination is based on the semantics of the language selected by
the user during setup or through Control Panel. (Unicode)

[戻り値]
Type: BOOL If the character is alphabetical, the return value is
nonzero. If the character is not alphabetical, the return value is
zero. To get extended error information, call GetLastError.

[備考]
> [!NOTE] > The winuser.h header defines IsCharAlpha as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
IsCharAlphaNumericW
Determines whether a character is either an alphabetical or a numeric character. This determination is based on the semantics of the language selected by the user during setup or through Control Panel. (Unicode)
%group
Win32 user32
%prm
ch
ch : [int] Type: TCHAR The character to be tested.
%inst
Determines whether a character is either an alphabetical or a numeric
character. This determination is based on the semantics of the
language selected by the user during setup or through Control Panel.
(Unicode)

[戻り値]
Type: BOOL If the character is alphanumeric, the return value is
nonzero. If the character is not alphanumeric, the return value is
zero. To get extended error information, call GetLastError.

[備考]
> [!NOTE] > The winuser.h header defines IsCharAlphaNumeric as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
IsCharUpperW
Determines whether a character is uppercase. This determination is based on the semantics of the language selected by the user during setup or through Control Panel. (Unicode)
%group
Win32 user32
%prm
ch
ch : [int] Type: TCHAR The character to be tested.
%inst
Determines whether a character is uppercase. This determination is
based on the semantics of the language selected by the user during
setup or through Control Panel. (Unicode)

[戻り値]
Type: BOOL If the character is uppercase, the return value is
nonzero. If the character is not uppercase, the return value is zero.
To get extended error information, call GetLastError.

[備考]
> [!NOTE] > The winuser.h header defines IsCharUpper as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
IsChild
Determines whether a window is a child window or descendant window of a specified parent window.
%group
Win32 user32
%prm
hWndParent, hWnd
hWndParent : [intptr] Type: HWND A handle to the parent window.
hWnd : [intptr] Type: HWND A handle to the window to be tested.
%inst
Determines whether a window is a child window or descendant window of
a specified parent window.

[戻り値]
Type: BOOL If the window is a child or descendant window of the
specified parent window, the return value is nonzero. If the window
is not a child or descendant window of the specified parent window,
the return value is zero.


%index
IsClipboardFormatAvailable
Determines whether the clipboard contains data in the specified format.
%group
Win32 user32
%prm
format
format : [int] Type: UINT A standard or registered clipboard format. For a description of the standard clipboard formats, see Standard Clipboard Formats .
%inst
Determines whether the clipboard contains data in the specified
format.

[戻り値]
Type: BOOL If the clipboard format is available, the return value is
nonzero. If the clipboard format is not available, the return value
is zero. To get extended error information, call GetLastError.

[備考]
Typically, an application that recognizes only one clipboard format
would call this function when processing the WM_INITMENU or
WM_INITMENUPOPUP message. The application would then enable or
disable the Paste menu item, depending on the return value.
Applications that recognize more than one clipboard format should use
the GetPriorityClipboardFormat function for this purpose.


%index
IsDialogMessageW
Determines whether a message is intended for the specified dialog box and, if it is, processes the message. (Unicode)
%group
Win32 user32
%prm
hDlg, lpMsg
hDlg : [intptr] Type: HWND A handle to the dialog box.
lpMsg : [var] Type: LPMSG A pointer to an MSG structure that contains the message to be checked.
%inst
Determines whether a message is intended for the specified dialog box
and, if it is, processes the message. (Unicode)

[戻り値]
Type: BOOL If the message has been processed, the return value is
nonzero. If the message has not been processed, the return value is
zero.

[備考]
Although the IsDialogMessage function is intended for modeless dialog
boxes, you can use it with any window that contains controls,
enabling the windows to provide the same keyboard selection as is
used in a dialog box. When IsDialogMessage processes a message, it
checks for keyboard messages and converts them into selections for
the corresponding dialog box. For example, the TAB key, when pressed,
selects the next control or group of controls, and the DOWN ARROW
key, when pressed, selects the next control in a group. Because the
IsDialogMessage function performs all necessary translating and
dispatching of messages, a message processed by IsDialogMessage must
not be passed to the TranslateMessage or DispatchMessage function.
IsDialogMessage sends WM_GETDLGCODE messages to the dialog box
procedure to determine which keys should be processed.
IsDialogMessage can send DM_GETDEFID and DM_SETDEFID messages to the
window. These messages are defined in the Winuser.h header file as
WM_USER and WM_USER + 1, so conflicts are possible with
application-defined messages having the same values.
> [!NOTE] > The winuser.h header defines IsDialogMessage as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
IsDlgButtonChecked
The IsDlgButtonChecked function determines whether a button control is checked or whether a three-state button control is checked, unchecked, or indeterminate.
%group
Win32 user32
%prm
hDlg, nIDButton
hDlg : [intptr] Type: HWND A handle to the dialog box that contains the button control.
nIDButton : [int] Type: int The identifier of the button control.
%inst
The IsDlgButtonChecked function determines whether a button control
is checked or whether a three-state button control is checked,
unchecked, or indeterminate.

[戻り値]
Type: UINT The return value from a button created with the
BS_AUTOCHECKBOX, BS_AUTORADIOBUTTON, BS_AUTO3STATE, BS_CHECKBOX,
BS_RADIOBUTTON, or BS_3STATE styles can be one of the values in the
following table. If the button has any other style, the return value
is zero.
This doc was truncated.

[備考]
The IsDlgButtonChecked function sends a BM_GETCHECK message to the
specified button control.


%index
IsGUIThread
Determines whether the calling thread is already a GUI thread. It can also optionally convert the thread to a GUI thread.
%group
Win32 user32
%prm
bConvert
bConvert : [int] Type: BOOL If TRUE and the thread is not a GUI thread, convert the thread to a GUI thread.
%inst
Determines whether the calling thread is already a GUI thread. It can
also optionally convert the thread to a GUI thread.

[戻り値]
Type: BOOL The function returns a nonzero value in the following
situations:
This doc was truncated.


%index
IsHungAppWindow
Determines whether the system considers that a specified application is not responding.
%group
Win32 user32
%prm
hwnd
hwnd : [intptr] Type: HWND A handle to the window to be tested.
%inst
Determines whether the system considers that a specified application
is not responding.

[戻り値]
Type: BOOL The return value is TRUE if the window stops responding;
otherwise, it is FALSE. Ghost windows always return TRUE.

[備考]
The Windows timeout criteria of 5 seconds is subject to change. This
function was not included in the SDK headers and libraries until
Windows XP Service Pack 1 (SP1) and Windows Server 2003. If you do
not have a header file and import library for this function, you can
call the function using LoadLibrary and GetProcAddress.


%index
IsIconic
Determines whether the specified window is minimized (iconic).
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] Type: HWND A handle to the window to be tested.
%inst
Determines whether the specified window is minimized (iconic).

[戻り値]
Type: BOOL If the window is iconic, the return value is nonzero. If
the window is not iconic, the return value is zero.


%index
IsImmersiveProcess
Determines whether the process belongs to a Windows Store app.
%group
Win32 user32
%prm
hProcess
hProcess : [intptr] Target process handle.
%inst
Determines whether the process belongs to a Windows Store app.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
IsMenu
Determines whether a handle is a menu handle.
%group
Win32 user32
%prm
hMenu
hMenu : [intptr] Type: HMENU A handle to be tested.
%inst
Determines whether a handle is a menu handle.

[戻り値]
Type: BOOL If the handle is a menu handle, the return value is
nonzero. If the handle is not a menu handle, the return value is
zero.


%index
IsMouseInPointerEnabled
Indicates whether EnableMouseInPointer is set for the mouse to act as a pointer input device and send WM_POINTER messages.
%group
Win32 user32
%prm

%inst
Indicates whether EnableMouseInPointer is set for the mouse to act as
a pointer input device and send WM_POINTER messages.

[戻り値]
If EnableMouseInPointer is set, the return value is nonzero. If
EnableMouseInPointer is not set, the return value is zero.

[備考]
EnableMouseInPointer can be called only once in the context of a
process lifetime. Prior to the first call, Windows Store apps run
with mouse-in-pointer enabled, as do any desktop applications that
consume mshtml.dll. All other desktop applications run with
mouse-in-pointer disabled. On the first call to EnableMouseInPointer
in the process lifetime, the state is changed as specified and the
call succeeds. On subsequent calls to EnableMouseInPointer, the state
will not change. If the current state is not equal to the specified
state, the call fails. Call IsMouseInPointerEnabled to verify the
mouse-in-pointer state.


%index
IsProcessDPIAware
IsProcessDPIAware may be altered or unavailable. Instead, use GetProcessDPIAwareness.
%group
Win32 user32
%prm

%inst
IsProcessDPIAware may be altered or unavailable. Instead, use
GetProcessDPIAwareness.

[戻り値]
Type: BOOL TRUE if the process is dpi aware; otherwise, FALSE.


%index
IsRectEmpty
The IsRectEmpty function determines whether the specified rectangle is empty.
%group
Win32 user32
%prm
lprc
lprc : [var] Pointer to a RECT structure that contains the logical coordinates of the rectangle.
%inst
The IsRectEmpty function determines whether the specified rectangle
is empty.

[戻り値]
If the rectangle is empty, the return value is nonzero. If the
rectangle is not empty, the return value is zero.

[備考]
Because applications can use rectangles for different purposes, the
rectangle functions do not use an explicit unit of measure. Instead,
all rectangle coordinates and dimensions are given in signed, logical
values. The mapping mode and the function in which the rectangle is
used determine the units of measure.


%index
IsTouchWindow
Checks whether a specified window is touch-capable and, optionally, retrieves the modifier flags set for the window's touch capability.
%group
Win32 user32
%prm
hwnd, pulFlags
hwnd : [intptr] The handle of the window. The function fails with ERROR_ACCESS_DENIED if the calling thread is not on the same desktop as the specified window.
pulFlags : [var] The address of the ULONG variable to receive the modifier flags for the specified window's touch capability.
%inst
Checks whether a specified window is touch-capable and, optionally,
retrieves the modifier flags set for the window's touch capability.

[戻り値]
Returns TRUE if the window supports Windows Touch; returns FALSE if
the window does not support Windows Touch.

[備考]
The following table lists the values for the pulFlags output
parameter.
This doc was truncated.


%index
IsValidDpiAwarenessContext
Determines if a specified DPI_AWARENESS_CONTEXT is valid and supported by the current system.
%group
Win32 user32
%prm
value
value : [intptr] The context that you want to determine if it is supported.
%inst
Determines if a specified DPI_AWARENESS_CONTEXT is valid and
supported by the current system.

[戻り値]
TRUE if the provided context is supported, otherwise FALSE.

[備考]
IsValidDpiAwarenessContext determines the validity of any provided
DPI_AWARENESS_CONTEXT. You should make sure a context is valid before
using SetThreadDpiAwarenessContext to that context. An input value of
NULL is considered to be an invalid context and will result in a
return value of FALSE.


%index
IsWinEventHookInstalled
Determines whether there is an installed WinEvent hook that might be notified of a specified event.
%group
Win32 user32
%prm
event
event : [int] 
%inst
Determines whether there is an installed WinEvent hook that might be
notified of a specified event.

[戻り値]
Type: BOOL If there is a hook to be notified of the specified event,
the return value is TRUE. If there are no hooks to be notified of the
specified event, the return value is FALSE.

[備考]
This method is guaranteed to never return a false negative. If this
method returns FALSE, it means that no hooks in the system would be
notified of the event. However, this method may return a false
positive. In other words, it may return TRUE even though there are no
hooks that would be notified. Thus, it is safe for components to
circumvent some work if this method returns FALSE. Event hooks can be
installed at any time, so server developers should not cache the
return value for long periods of time.


%index
IsWindow
指定したウィンドウハンドルが既存のウィンドウを識別するかを判定する。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND テスト対象のウィンドウへのハンドル。
%inst
指定したウィンドウハンドルが既存のウィンドウを識別するかを判定する。

[戻り値]
型: BOOL ウィンドウハンドルが既存のウィンドウを識別する場合は 0 以外。そうでなければ 0。

[備考]
スレッドは自身が作成していないウィンドウに対して IsWindow
を使用すべきではない。呼び出し後にウィンドウが破棄される可能性があり、さらにウィンドウハンドルは再利用されるため異なるウィンドウを指す可能性がある。


%index
IsWindowArranged
Determines whether the specified window is arranged (that is, whether it's snapped).
%group
Win32 user32
%prm
hwnd
hwnd : [intptr] Type: **HWND** A handle to the window to be tested.
%inst
Determines whether the specified window is arranged (that is, whether
it's snapped).

[戻り値]
Type: **BOOL** A nonzero value if the window is arranged; otherwise,
zero.

[備考]
At this time, this function does not have an associated header file
or library file. Your application can call
[**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya)
with the DLL name (`User32.dll`) to obtain a module handle. It can
then call
[**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress)
with the module handle and the name of this function to get the
function address. A snapped window (see [Snap your
windows](https://support.microsoft.com/windows/snap-your-windows-885a9b1e-a983-a3b1-16cd-c531795e6241))
is considered to be arranged. You should treat arrange as a window
state similar to maximize. Arranged, maximize, and minimize are
mutually exclusive states. An arranged window can be restored to its
original size and position. Restoring a window from minimize can make
a window arranged if the window was arranged before it was minimized.
When calling
[GetWindowPlacement](/windows/win32/api/winuser/nf-winuser-getwindowplacement),
keep in mind that the *showCmd* member on the returned
[WINDOWPLACEMENT](/windows/win32/api/winuser/ns-winuser-windowplacement)
can have a value of **SW_SHOWNORMAL** even if the window is arranged.


%index
IsWindowEnabled
Determines whether the specified window is enabled for mouse and keyboard input.
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] Type: HWND A handle to the window to be tested.
%inst
Determines whether the specified window is enabled for mouse and
keyboard input.

[戻り値]
Type: BOOL If the window is enabled, the return value is nonzero. If
the window is not enabled, the return value is zero.

[備考]
A child window receives input only if it is both enabled and visible.


%index
IsWindowUnicode
Determines whether the specified window is a native Unicode window.
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] Type: HWND A handle to the window to be tested.
%inst
Determines whether the specified window is a native Unicode window.

[戻り値]
Type: BOOL If the window is a native Unicode window, the return value
is nonzero. If the window is not a native Unicode window, the return
value is zero. The window is a native ANSI window.

[備考]
The character set of a window is determined by the use of the
RegisterClass function. If the window class was registered with the
ANSI version of RegisterClass (RegisterClassA), the character set of
the window is ANSI. If the window class was registered with the
Unicode version of RegisterClass (RegisterClassW), the character set
of the window is Unicode. The system does automatic two-way
translation (Unicode to ANSI) for window messages. For example, if an
ANSI window message is sent to a window that uses the Unicode
character set, the system translates that message into a Unicode
message before calling the window procedure. The system calls
IsWindowUnicode to determine whether to translate the message.


%index
IsWindowVisible
指定したウィンドウの可視状態を判定する。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND テスト対象のウィンドウへのハンドル。
%inst
指定したウィンドウの可視状態を判定する。

[戻り値]
型: BOOL 指定ウィンドウ、その親、親の親、…がすべて WS_VISIBLE スタイルを持つ場合は 0 以外。そうでなければ
0。戻り値は WS_VISIBLE スタイルを持つかを示すもので、他のウィンドウに完全に隠されていても 0 以外となりうる。

[備考]
ウィンドウの可視状態は WS_VISIBLE スタイルビットで示される。WS_VISIBLE
が設定されている場合、ウィンドウは表示され、その後の描画が表示される。ただし他のウィンドウに隠されている場合や親によってクリップされている場合は描画が表示されないことがある。


%index
IsWow64Message
Determines whether the last message read from the current thread's queue originated from a WOW64 process.
%group
Win32 user32
%prm

%inst
Determines whether the last message read from the current thread's
queue originated from a WOW64 process.

[戻り値]
The function returns TRUE if the last message read from the current
thread's queue originated from a WOW64 process, and FALSE otherwise.

[備考]
This function is useful to helping you develop 64-bit native
applications that can receive private messages sent from 32-bit
client applications, if the messages are associated with data
structures that contain pointer-dependent data. In these situations,
you can call this function in your 64-bit native application to
determine if the message originated from a WOW64 process and then
thunk the message appropriately.


%index
IsZoomed
Determines whether a window is maximized.
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] Type: HWND A handle to the window to be tested.
%inst
Determines whether a window is maximized.

[戻り値]
Type: BOOL If the window is zoomed, the return value is nonzero. If
the window is not zoomed, the return value is zero.


%index
KillTimer
Destroys the specified timer.
%group
Win32 user32
%prm
hWnd, uIDEvent
hWnd : [intptr] Type: HWND A handle to the window associated with the specified timer. This value must be the same as the hWnd value passed to the SetTimer function that created the timer.
uIDEvent : [int] Type: UINT_PTR The timer to be destroyed. If the window handle passed to SetTimer is valid, this parameter must be the same as the nIDEvent value passed to SetTimer. If the application calls SetTimer with hWnd set to NULL, this parameter must be the timer identifier returned by SetTimer.
%inst
Destroys the specified timer.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The KillTimer function does not remove WM_TIMER messages already
posted to the message queue.


%index
LoadAcceleratorsW
Loads the specified accelerator table. (Unicode)
%group
Win32 user32
%prm
hInstance, lpTableName
hInstance : [intptr] Type: HINSTANCE A handle to the module whose executable file contains the accelerator table to be loaded.
lpTableName : [wstr] Type: LPCTSTR The name of the accelerator table to be loaded. Alternatively, this parameter can specify the resource identifier of an accelerator-table resource in the low-order word and zero in the high-order word. To create this value, use the MAKEINTRESOURCE macro.
%inst
Loads the specified accelerator table. (Unicode)

[戻り値]
Type: HACCEL If the function succeeds, the return value is a handle
to the loaded accelerator table. If the function fails, the return
value is NULL. To get extended error information, call GetLastError.

[備考]
If the accelerator table has not yet been loaded, the function loads
it from the specified executable file. Accelerator tables loaded from
resources are freed automatically when the application terminates.


%index
LoadBitmapW
The LoadBitmap function loads the specified bitmap resource from a module's executable file. (Unicode)
%group
Win32 user32
%prm
hInstance, lpBitmapName
hInstance : [intptr] A handle to the instance of the module whose executable file contains the bitmap to be loaded.
lpBitmapName : [wstr] A pointer to a null-terminated string that contains the name of the bitmap resource to be loaded. Alternatively, this parameter can consist of the resource identifier in the low-order word and zero in the high-order word. The MAKEINTRESOURCE macro can be used to create this value.
%inst
The LoadBitmap function loads the specified bitmap resource from a
module's executable file. (Unicode)

[戻り値]
If the function succeeds, the return value is the handle to the
specified bitmap. If the function fails, the return value is NULL.

[備考]
If the bitmap pointed to by the lpBitmapName parameter does not exist
or there is insufficient memory to load the bitmap, the function
fails. LoadBitmap creates a compatible bitmap of the display, which
cannot be selected to a printer. To load a bitmap that you can select
to a printer, call LoadImage and specify LR_CREATEDIBSECTION to
create a DIB section. A DIB section can be selected to any device. An
application can use the LoadBitmap function to access predefined
bitmaps. To do so, the application must set the hInstance parameter
to NULL and the lpBitmapName parameter to one of the following
values.
This doc was truncated.


%index
LoadCursorW
アプリケーションインスタンスに関連付けられた実行ファイル(.EXE)から指定したカーソルリソースをロードする。(Unicode)
%group
Win32 user32
%prm
hInstance, lpCursorName
hInstance : [intptr] 型: HINSTANCE ロードするカーソルを含む実行ファイルを持つモジュールのインスタンスへのハンドル。
lpCursorName : [wstr] 型: LPCTSTR ロードするカーソルリソースの名前。代わりに、下位ワードにリソース識別子、上位ワードに 0 を指定する形式も使える。MAKEINTRESOURCE マクロでこの値を生成することもできる。定義済みカーソルを使うには hInstance に NULL、lpCursorName に次のいずれかの値を指定する。
%inst
アプリケーションインスタンスに関連付けられた実行ファイル(.EXE)から指定したカーソルリソースをロードする。(Unicode)

[戻り値]
型: HCURSOR 関数が成功した場合、戻り値は新たにロードされたカーソルへのハンドル。失敗した場合は
NULL。拡張エラー情報を得るには GetLastError を呼び出す。

[備考]
LoadCursor
はカーソルリソースがまだロードされていない場合のみロードし、既にロード済みであれば既存リソースのハンドルを返す。lpCursorName
がカーソルリソースへのポインタである場合にのみ有効なカーソルハンドルを返す。lpCursorName
がカーソル以外のリソース(アイコンなど)を指す場合、戻り値は NULL でなくとも有効なカーソルハンドルではない。LoadCursor
は現在の表示デバイスに最も適したカーソルリソースを検索する。カーソルリソースはカラーまたはモノクロビットマップでよい。DPI 仮想化 この
API は DPI 仮想化に参加しない。出力は呼び出しスレッドの DPI の影響を受けない。


%index
LoadCursorFromFileW
Creates a cursor based on data contained in a file. (Unicode)
%group
Win32 user32
%prm
lpFileName
lpFileName : [wstr] Type: LPCTSTR The source of the file data to be used to create the cursor. The data in the file must be in either .CUR or .ANI format. If the high-order word of lpFileName is nonzero, it is a pointer to a string that is a fully qualified name of a file containing cursor data.
%inst
Creates a cursor based on data contained in a file. (Unicode)

[戻り値]
Type: HCURSOR If the function is successful, the return value is a
handle to the new cursor. If the function fails, the return value is
NULL. To get extended error information, call GetLastError.
GetLastError may return the following value.
This doc was truncated.

[備考]
DPI Virtualization This API does not participate in DPI
virtualization. The output returned is not affected by the DPI of the
calling thread.
> [!NOTE] > The winuser.h header defines LoadCursorFromFile as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
LoadIconW
Loads the specified icon resource from the executable (.exe) file associated with an application instance. (Unicode)
%group
Win32 user32
%prm
hInstance, lpIconName
hInstance : [intptr] Type: HINSTANCE A handle to an instance of the module whose executable file contains the icon to be loaded. This parameter must be NULL when a standard icon is being loaded.
lpIconName : [wstr] Type: LPCTSTR The name of the icon resource to be loaded. Alternatively, this parameter can contain the resource identifier in the low-order word and zero in the high-order word. Use the MAKEINTRESOURCE macro to create this value.
%inst
Loads the specified icon resource from the executable (.exe) file
associated with an application instance. (Unicode)

[戻り値]
Type: HICON If the function succeeds, the return value is a handle to
the newly loaded icon. If the function fails, the return value is
NULL. To get extended error information, call GetLastError.

[備考]
LoadIcon loads the icon resource only if it has not been loaded;
otherwise, it retrieves a handle to the existing resource. The
function searches the icon resource for the icon most appropriate for
the current display. The icon resource can be a color or monochrome
bitmap. LoadIcon can only load an icon whose size conforms to the
SM_CXICON and SM_CYICON system metric values. Use the LoadImage
function to load icons of other sizes.
> [!NOTE] > The winuser.h header defines LoadIcon as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
LoadImageW
Loads an icon, cursor, animated cursor, or bitmap. (Unicode)
%group
Win32 user32
%prm
hInst, name, type, cx, cy, fuLoad
hInst : [intptr] Type: HINSTANCE A handle to the module of either a DLL or executable (.exe) that contains the image to be loaded. For more information, see GetModuleHandle. Note that as of  32-bit Windows, an instance handle (HINSTANCE), such as the application instance handle exposed by system function call of WinMain, and a module handle (HMODULE) are the same thing.
name : [wstr] Type: LPCTSTR The image to be loaded. If the hinst parameter is non-NULL and the fuLoad parameter omits LR_LOADFROMFILE, lpszName specifies the image resource in the hinst module. If the image resource is to be loaded by name from the module, the lpszName parameter is a pointer to a null-terminated string that contains the name of the image resource. If the image resource is to be loaded by ordinal from the module, use the MAKEINTRESOURCE macro to convert the image ordinal into a form that can be passed to the LoadImage function. For more information, see the Remarks section below. If the hinst parameter is NULL and the fuLoad parameter omits the LR_LOADFROMFILE value, the lpszName specifies the OEM image to load. The OEM image identifiers are defined in Winuser.h and have the following prefixes.
type : [int] Type: UINT
cx : [int] Type: int The width, in pixels, of the icon or cursor. If this parameter is zero and the fuLoad parameter is LR_DEFAULTSIZE, the function uses the SM_CXICON or SM_CXCURSOR system metric value to set the width. If this parameter is zero and LR_DEFAULTSIZE is not used, the function uses the actual resource width.
cy : [int] Type: int The height, in pixels, of the icon or cursor. If this parameter is zero and the fuLoad parameter is LR_DEFAULTSIZE, the function uses the SM_CYICON or SM_CYCURSOR system metric value to set the height. If this parameter is zero and LR_DEFAULTSIZE is not used, the function uses the actual resource height.
fuLoad : [int] Type: UINT
%inst
Loads an icon, cursor, animated cursor, or bitmap. (Unicode)

[戻り値]
Type: HANDLE If the function succeeds, the return value is the handle
of the newly loaded image. If the function fails, the return value is
NULL. To get extended error information, call GetLastError.

[備考]
If IS_INTRESOURCE(lpszName) is TRUE, then lpszName specifies the
integer identifier of the given resource. Otherwise, it is a pointer
to a null-terminated string. If the first character of the string is
a pound sign (#), then the remaining characters represent a decimal
number that specifies the integer identifier of the resource. For
example, the string "#258" represents the identifier 258. When you
are finished using a bitmap, cursor, or icon you loaded without
specifying the LR_SHARED flag, you can release its associated memory
by calling one of the functions in the following table.
This doc was truncated.


%index
LoadKeyboardLayoutW
Loads a new input locale identifier (formerly called the keyboard layout) into the system. (Unicode)
%group
Win32 user32
%prm
pwszKLID, Flags
pwszKLID : [wstr] Type: LPCTSTR The name of the input locale identifier to load. This name is a string composed of the hexadecimal value of the Language Identifier (low word) and a device identifier (high word). For example, U.S. English has a language identifier of 0x0409, so the primary U.S. English layout is named "00000409". Variants of U.S. English layout (such as the Dvorak layout) are named "00010409", "00020409", and so on. For a list of the input layouts that are supplied with Windows, see [Keyboard Identifiers and Input Method Editors for Windows](/windows-hardware/manufacture/desktop/windows-language-pack-default-values).
Flags : [int] Type: UINT
%inst
Loads a new input locale identifier (formerly called the keyboard
layout) into the system. (Unicode)

[戻り値]
Type: HKL If the function succeeds, the return value is the input
locale identifier corresponding to the name specified in pwszKLID. If
no matching locale is available, the return value is the default
language of the system. If the function fails, the return value is
NULL. This can occur if the layout library is loaded from the
application directory. To get extended error information, call
GetLastError.

[備考]
The input locale identifier is a broader concept than a keyboard
layout, since it can also encompass a speech-to-text converter, an
Input Method Editor (IME), or any other form of input. An application
can and will typically load the default input locale identifier or
IME for a language and can do so by specifying only a string version
of the language identifier. If an application wants to load a
specific locale or IME, it should read the registry to determine the
specific input locale identifier to pass to LoadKeyboardLayout. In
this case, a request to activate the default input locale identifier
for a locale will activate the first matching one. A specific IME
should be activated using an explicit input locale identifier
returned from GetKeyboardLayout or LoadKeyboardLayout. Prior to
Windows 8: This function only affects the layout for the current
process or thread. Beginning in Windows 8: This function affects the
layout for the entire system. > [!NOTE] > The winuser.h header
defines LoadKeyboardLayout as an alias which automatically selects
the ANSI or Unicode version of this function based on the definition
of the UNICODE preprocessor constant. Mixing usage of the
encoding-neutral alias with code that not encoding-neutral can lead
to mismatches that result in compilation or runtime errors. For more
information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
LoadMenuW
Loads the specified menu resource from the executable (.exe) file associated with an application instance. (Unicode)
%group
Win32 user32
%prm
hInstance, lpMenuName
hInstance : [intptr] Type: HINSTANCE A handle to the module containing the menu resource to be loaded.
lpMenuName : [wstr] Type: LPCTSTR The name of the menu resource. Alternatively, this parameter can consist of the resource identifier in the low-order word and zero in the high-order word. To create this value, use the MAKEINTRESOURCE macro.
%inst
Loads the specified menu resource from the executable (.exe) file
associated with an application instance. (Unicode)

[戻り値]
Type: HMENU If the function succeeds, the return value is a handle to
the menu resource. If the function fails, the return value is NULL.
To get extended error information, call GetLastError.

[備考]
The DestroyMenu function is used, before an application closes, to
destroy the menu and free memory that the loaded menu occupied.


%index
LoadMenuIndirectW
Loads the specified menu template in memory. (Unicode)
%group
Win32 user32
%prm
lpMenuTemplate
lpMenuTemplate : [intptr] Type: const MENUTEMPLATE* A pointer to a menu template or an extended menu template. A menu template consists of a MENUITEMTEMPLATEHEADER structure followed by one or more contiguous MENUITEMTEMPLATE structures. An extended menu template consists of a MENUEX_TEMPLATE_HEADER structure followed by one or more contiguous MENUEX_TEMPLATE_ITEM structures.
%inst
Loads the specified menu template in memory. (Unicode)

[戻り値]
Type: HMENU If the function succeeds, the return value is a handle to
the menu. If the function fails, the return value is NULL. To get
extended error information, call GetLastError.

[備考]
For both the ANSI and the Unicode version of this function, the
strings in the MENUITEMTEMPLATE structure must be Unicode strings.
> [!NOTE] > The winuser.h header defines LoadMenuIndirect as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
LoadStringW
Loads a string resource from the executable file associated with a specified module, copies the string into a buffer, and appends a terminating null character. (Unicode)
%group
Win32 user32
%prm
hInstance, uID, lpBuffer, cchBufferMax
hInstance : [intptr] Type: HINSTANCE A handle to an instance of the module whose executable file contains the string resource. To get the handle to the application itself, call the GetModuleHandle function with NULL.
uID : [int] Type: UINT The identifier of the string to be loaded.
lpBuffer : [wstr] Type: LPTSTR The buffer to receive the string (if *cchBufferMax* is non-zero) or a read-only pointer to the string resource itself (if *cchBufferMax* is zero). Must be of sufficient length to hold a pointer (8 bytes).
cchBufferMax : [int] Type: int The size of the buffer, in characters. The string is truncated and null-terminated if it is longer than the number of characters specified. If this parameter is 0, then lpBuffer receives a read-only pointer to the string resource itself.
%inst
Loads a string resource from the executable file associated with a
specified module, copies the string into a buffer, and appends a
terminating null character. (Unicode)

[戻り値]
Type: int If the function succeeds, the return value is one of the
following: - The number of characters copied into the buffer (if
*cchBufferMax* is non-zero), not including the terminating null
character. - The number of characters in the string resource that
*lpBuffer* points to (if *cchBufferMax* is zero). The string resource
is not guaranteed to be null-terminated in the module's resource
table, and you can use this value to determine where the string
resource ends. - Zero if the string resource does not exist. To get
extended error information, call GetLastError.

[備考]
If you pass 0 to *cchBufferMax* to return a read-only pointer to the
string resource in the *lpBuffer* parameter, use the number of
characters in the return value to determine the length of the string
resource. String resources are not guaranteed to be null-terminated
in the module's resource table. However, resource tables can contain
null characters. String resources are stored in blocks of 16 strings,
and any empty slots within a block are indicated by null characters.
Security Remarks Using this function incorrectly can compromise the
security of your application. Incorrect use includes specifying the
wrong size in the nBufferMax parameter. For example, if lpBuffer
points to a buffer szBuffer which is declared as TCHAR szBuffer[100],
then sizeof(szBuffer) gives the size of the buffer in bytes, which
could lead to a buffer overflow for the Unicode version of the
function. Buffer overflow situations are the cause of many security
problems in applications. In this case, using
sizeof(szBuffer)/sizeof(TCHAR) or
sizeof(szBuffer)/sizeof(szBuffer[0]) would give the proper size of
the buffer.


%index
LockSetForegroundWindow
The foreground process can call the LockSetForegroundWindow function to disable calls to the SetForegroundWindow function.
%group
Win32 user32
%prm
uLockCode
uLockCode : [int] Type: UINT
%inst
The foreground process can call the LockSetForegroundWindow function
to disable calls to the SetForegroundWindow function.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The system automatically enables calls to SetForegroundWindow if the
user presses the ALT key or takes some action that causes the system
itself to change the foreground window (for example, clicking a
background window). This function is provided so applications can
prevent other applications from making a foreground change that can
interrupt its interaction with the user.


%index
LockWindowUpdate
The LockWindowUpdate function disables or enables drawing in the specified window. Only one window can be locked at a time.
%group
Win32 user32
%prm
hWndLock
hWndLock : [intptr] The window in which drawing will be disabled. If this parameter is NULL, drawing in the locked window is enabled.
%inst
The LockWindowUpdate function disables or enables drawing in the
specified window. Only one window can be locked at a time.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero, indicating that an error
occurred or another window was already locked.

[備考]
The purpose of the LockWindowUpdate function is to permit drag/drop
feedback to be drawn over a window without interference from the
window itself. The intent is that the window is locked when feedback
is drawn and unlocked when feedback is complete. LockWindowUpdate is
not intended for general-purpose suppression of window redraw. Use
the WM_SETREDRAW message to disable redrawing of a particular window.
If an application with a locked window (or any locked child windows)
calls the GetDC, GetDCEx, or BeginPaint function, the called function
returns a device context with a visible region that is empty. This
will occur until the application unlocks the window by calling
LockWindowUpdate, specifying a value of NULL for hWndLock. If an
application attempts to draw within a locked window, the system
records the extent of the attempted operation in a bounding
rectangle. When the window is unlocked, the system invalidates the
area within this bounding rectangle, forcing an eventual WM_PAINT
message to be sent to the previously locked window and its child
windows. If no drawing has occurred while the window updates were
locked, no area is invalidated. LockWindowUpdate does not make the
specified window invisible and does not clear the WS_VISIBLE style
bit. A locked window cannot be moved.


%index
LockWorkStation
Locks the workstation's display.
%group
Win32 user32
%prm

%inst
Locks the workstation's display.

[戻り値]
If the function succeeds, the return value is nonzero. Because the
function executes asynchronously, a nonzero return value indicates
that the operation has been initiated. It does not indicate whether
the workstation has been successfully locked. If the function fails,
the return value is zero. To get extended error information, call
GetLastError.

[備考]
The LockWorkStation function is callable only by processes running on
the interactive desktop. In addition, the user must be logged on, and
the workstation cannot already be locked. Common reasons the
workstation might not be locked even if the function succeeds include
the following: no user is logged on, the workstation is already
locked, the process is not running on the interactive desktop, or the
request is denied by the Graphical Identification and Authentication
(GINA) DLL. This function has the same result as pressing
Ctrl+Alt+Del and clicking Lock. To unlock the workstation, the user
must log in. There is no function you can call to determine whether
the workstation is locked. To receive a notification when the user
locks the workstation or logs in, use the
WTSRegisterSessionNotification function to receive
WM_WTSSESSION_CHANGE messages. You can use session notifications to
track the desktop state so you know whether it is possible to
interact with the user.


%index
LogicalToPhysicalPoint
Converts the logical coordinates of a point in a window to physical coordinates.
%group
Win32 user32
%prm
hWnd, lpPoint
hWnd : [intptr] Type: HWND A handle to the window whose transform is used for the conversion. Top level windows are fully supported. In the case of child windows, only the area of overlap between the parent and the child window is converted.
lpPoint : [var] Type: LPPOINT A pointer to a POINT structure that specifies the logical coordinates to be converted. The new physical coordinates are copied into this structure if the function succeeds.
%inst
Converts the logical coordinates of a point in a window to physical
coordinates.

[備考]
Windows Vista introduces the concept of physical coordinates. Desktop
Window Manager (DWM) scales non-dots per inch (dpi) aware windows
when the display is high dpi. The window seen on the screen
corresponds to the physical coordinates. The application continues to
work in logical space. Therefore, the application's view of the
window is different from that which appears on the screen. For scaled
windows, logical and physical coordinates are different.
LogicalToPhysicalPoint is a transformation API that can be called by
a process that declares itself as dpi aware. The function uses the
window identified by the hWnd parameter and the logical coordinates
given in the POINT structure to compute the physical coordinates. The
LogicalToPhysicalPoint function replaces the logical coordinates in
the POINT structure with the physical coordinates. The physical
coordinates are relative to the upper-left corner of the screen. The
coordinates have to be inside the client area of hWnd. On all
platforms, LogicalToPhysicalPoint will fail on a window that has
either 0 width or height; an application must first establish a non-0
width and height by calling, for example, MoveWindow. On some
versions of Windows (including Windows 7), LogicalToPhysicalPoint
will still fail if MoveWindow has been called after a call to
ShowWindow with SH_HIDE has hidden the window. In Windows 8,
system?DPI aware applications translate between physical and logical
space using PhysicalToLogicalPoint and LogicalToPhysicalPoint. In
Windows 8.1, the additional virtualization of the system and
inter-process communications means that for the majority of
applications, you do not need these APIs. As a result, in Windows
8.1, PhysicalToLogicalPoint and LogicalToPhysicalPoint no longer
transform points. The system returns all points to an application in
its own coordinate space. This behavior preserves functionality for
the majority of applications, but there are some exceptions in which
you must make changes to ensure that the application works as
expected. In those cases, use PhysicalToLogicalPointForPerMonitorDPI
and LogicalToPhysicalPointForPerMonitorDPI.


%index
LogicalToPhysicalPointForPerMonitorDPI
Converts a point in a window from logical coordinates into physical coordinates, regardless of the dots per inch (dpi) awareness of the caller.
%group
Win32 user32
%prm
hWnd, lpPoint
hWnd : [intptr] A handle to the window whose transform is used for the conversion.
lpPoint : [var] A pointer to a POINT structure that specifies the logical coordinates to be converted. The new physical coordinates are copied into this structure if the function succeeds.
%inst
Converts a point in a window from logical coordinates into physical
coordinates, regardless of the dots per inch (dpi) awareness of the
caller.

[戻り値]
Returns TRUE if successful, or FALSE otherwise.

[備考]
In Windows 8, system?DPI aware applications translated between
physical and logical space using PhysicalToLogicalPoint and
LogicalToPhysicalPoint. In Windows 8.1, the additional virtualization
of the system and inter-process communications means that for the
majority of applications, you do not need these APIs. As a result, in
Windows 8.1, these APIs no longer transform points. The system
returns all points to an application in its own coordinate space.
This behavior preserves functionality for the majority of
applications, but there are some exceptions in which you must make
changes to ensure that the application works as expected. For
example, an application might need to walk the entire window tree of
another process and ask the system for DPI-dependent information
about the window. By default, the system will return the information
based on the DPI awareness of the caller. This is ideal for most
applications. However, the caller might need the information based on
the DPI awareness of the application associated with the window. This
might be necessary because the two applications send DPI-dependent
information between each other directly. In this case, the
application can use LogicalToPhysicalPointForPerMonitorDPI to get
physical coordinates and then use
PhysicalToLogicalPointForPerMonitorDPI to convert the physical
coordinates into logical coordinates based on the DPI-awareness of
the provided HWND. Consider two applications, one has a
PROCESS_DPI_AWARENESS value of PROCESS_DPI_UNAWARE and the other has
a value of PROCESS_PER_MONITOR_AWARE. The PROCESS_DPI_UNAWARE app
creates a window on a single monitor where the scale factor is 200%
(192 DPI). If both apps call GetWindowRect on this window, they will
receive different values. The PROCESS_DPI_UNAWARE app will receive a
rect based on 96 DPI coordinates, while the PROCESS_PER_MONITOR_AWARE
app will receive coordinates matching the actual DPI of the monitor.
If the PROCESS_PER_MONITOR_AWARE needs the rect that the system
returned to the PROCESS_DPI_UNAWARE app, it could call
LogicalToPhysicalPointForPerMonitorDPI for the corners of its rect
and pass in the handle to the PROCESS_DPI_UNAWARE app's window. This
will return points based on the other app's awareness that can be
used to create a rect. Tip Since an application with a
PROCESS_DPI_AWARENESS value of PROCESS_PER_MONITOR_AWARE uses the
actual DPI of the monitor, physical and logical coordinates are the
same for this app.


%index
LookupIconIdFromDirectory
Searches through icon or cursor data for the icon or cursor that best fits the current display device. (LookupIconIdFromDirectory)
%group
Win32 user32
%prm
presbits, fIcon
presbits : [var] Type: PBYTE The icon or cursor directory data. Because this function does not validate the resource data, it causes a general protection (GP) fault or returns an undefined value if presbits is not pointing to valid resource data.
fIcon : [int] Type: BOOL Indicates whether an icon or a cursor is sought. If this parameter is TRUE, the function is searching for an icon; if the parameter is FALSE, the function is searching for a cursor.
%inst
Searches through icon or cursor data for the icon or cursor that best
fits the current display device. (LookupIconIdFromDirectory)

[戻り値]
Type: int If the function succeeds, the return value is an integer
resource identifier for the icon or cursor that best fits the current
display device. If the function fails, the return value is zero. To
get extended error information, call GetLastError.

[備考]
A resource file of type RT_GROUP_ICON (RT_GROUP_CURSOR indicates
cursors) contains icon (or cursor) data in several device-dependent
and device-independent formats. LookupIconIdFromDirectory searches
the resource file for the icon (or cursor) that best fits the current
display device and returns its integer identifier. The FindResource
and FindResourceEx functions use the MAKEINTRESOURCE macro with this
identifier to locate the resource in the module. The icon directory
is loaded from a resource file with resource type RT_GROUP_ICON (or
RT_GROUP_CURSOR for cursors), and an integer resource name for the
specific icon to be loaded. LookupIconIdFromDirectory returns an
integer identifier that is the resource name of the icon that best
fits the current display device. The LoadIcon, LoadCursor, and
LoadImage functions use this function to search the specified
resource data for the icon or cursor that best fits the current
display device.


%index
LookupIconIdFromDirectoryEx
Searches through icon or cursor data for the icon or cursor that best fits the current display device. (LookupIconIdFromDirectoryEx)
%group
Win32 user32
%prm
presbits, fIcon, cxDesired, cyDesired, Flags
presbits : [var] Type: PBYTE The icon or cursor directory data. Because this function does not validate the resource data, it causes a general protection (GP) fault or returns an undefined value if presbits is not pointing to valid resource data.
fIcon : [int] Type: BOOL Indicates whether an icon or a cursor is sought. If this parameter is TRUE, the function is searching for an icon; if the parameter is FALSE, the function is searching for a cursor.
cxDesired : [int] Type: int The desired width, in pixels, of the icon. If this parameter is zero, the function uses the SM_CXICON or SM_CXCURSOR system metric value.
cyDesired : [int] Type: int The desired height, in pixels, of the icon. If this parameter is zero, the function uses the SM_CYICON or SM_CYCURSOR system metric value.
Flags : [int] Type: UINT
%inst
Searches through icon or cursor data for the icon or cursor that best
fits the current display device. (LookupIconIdFromDirectoryEx)

[戻り値]
Type: int If the function succeeds, the return value is an integer
resource identifier for the icon or cursor that best fits the current
display device. If the function fails, the return value is zero. To
get extended error information, call GetLastError.

[備考]
A resource file of type RT_GROUP_ICON (RT_GROUP_CURSOR indicates
cursors) contains icon (or cursor) data in several device-dependent
and device-independent formats. LookupIconIdFromDirectoryEx searches
the resource file for the icon (or cursor) that best fits the current
display device and returns its integer identifier. The FindResource
and FindResourceEx functions use the MAKEINTRESOURCE macro with this
identifier to locate the resource in the module. The icon directory
is loaded from a resource file with resource type RT_GROUP_ICON (or
RT_GROUP_CURSOR for cursors), and an integer resource name for the
specific icon to be loaded. LookupIconIdFromDirectoryEx returns an
integer identifier that is the resource name of the icon that best
fits the current display device. The LoadIcon, LoadImage, and
LoadCursor functions use this function to search the specified
resource data for the icon or cursor that best fits the current
display device.


%index
MapDialogRect
Converts the specified dialog box units to screen units (pixels).
%group
Win32 user32
%prm
hDlg, lpRect
hDlg : [intptr] Type: HWND A handle to a dialog box. This function accepts only handles returned by one of the dialog box creation functions; handles for other windows are not valid.
lpRect : [var] Type: LPRECT A pointer to a RECT structure that contains the dialog box coordinates to be converted.
%inst
Converts the specified dialog box units to screen units (pixels).

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The MapDialogRect function assumes that the initial coordinates in
the RECT structure represent dialog box units. To convert these
coordinates from dialog box units to pixels, the function retrieves
the current horizontal and vertical base units for the dialog box,
then applies the following formulas:
This doc was truncated.


%index
MapVirtualKeyW
Translates (maps) a virtual-key code into a scan code or character value, or translates a scan code into a virtual-key code. (Unicode)
%group
Win32 user32
%prm
uCode, uMapType
uCode : [int] Type: **UINT** The [virtual key code](/windows/desktop/inputdev/virtual-key-codes) or scan code for a key. How this value is interpreted depends on the value of the *uMapType* parameter. **Starting with Windows Vista**, the high byte of the *uCode* value can contain either 0xe0 or 0xe1 to specify the extended scan code.
uMapType : [int] Type: **UINT** The translation to be performed. The value of this parameter depends on the value of the *uCode* parameter. | Value | Meaning | |-------|---------| | **MAPVK\_VK\_TO\_VSC**0 | The *uCode* parameter is a virtual-key code and is translated into a scan code. If it is a virtual-key code that does not distinguish between left- and right-hand keys, the left-hand scan code is returned. If there is no translation, the function returns 0. | | **MAPVK\_VSC\_TO\_VK**1 | The *uCode* parameter is a scan code and is translated into a virtual-key code that does not distinguish between left- and right-hand keys. If there is no translation, the function returns 0. | | **MAPVK\_VK\_TO\_CHAR**2 | The *uCode* parameter is a virtual-key code and is translated into an unshifted character value in the low order word of the return value. Dead keys (diacritics) are indicated by setting the top bit of the return value. If there is no translation, the function returns 0. See Remarks. | | **MAPVK\_VSC\_TO\_VK\_EX**3 | The *uCode* parameter is a scan code and is translated into a virtual-key code that distinguishes between left- and right-hand keys. If there is no translation, the function returns 0. | | **MAPVK\_VK\_TO\_VSC\_EX**4 | **Windows Vista and later:** The *uCode* parameter is a virtual-key code and is translated into a scan code. If it is a virtual-key code that does not distinguish between left- and right-hand keys, the left-hand scan code is returned. If the scan code is an extended scan code, the high byte of the *uCode* value can contain either 0xe0 or 0xe1 to specify the extended scan code. If there is no translation, the function returns 0. |
%inst
Translates (maps) a virtual-key code into a scan code or character
value, or translates a scan code into a virtual-key code. (Unicode)

[戻り値]
Type: **UINT** The return value is either a scan code, a virtual-key
code, or a character value, depending on the value of *uCode* and
*uMapType*. If there is no translation, the return value is zero.

[備考]
To specify a handle to the keyboard layout to use for translating the
specified code, use the
[MapVirtualKeyEx](nf-winuser-mapvirtualkeyexw.md) function. An
application can use **MapVirtualKey** to translate scan codes to the
virtual-key code constants **VK_SHIFT**, **VK_CONTROL**, and
**VK_MENU**, and vice versa. These translations do not distinguish
between the left and right instances of the SHIFT, CTRL, or ALT keys.
An application can get the scan code corresponding to the left or
right instance of one of these keys by calling **MapVirtualKey** with
*uCode* set to one of the following virtual-key code constants: -
**VK\_LSHIFT** - **VK\_RSHIFT** - **VK\_LCONTROL** - **VK\_RCONTROL**
- **VK\_LMENU** - **VK\_RMENU** These left- and right-distinguishing
constants are available to an application only through the
[GetKeyboardState](nf-winuser-getkeyboardstate.md),
[SetKeyboardState](nf-winuser-setkeyboardstate.md),
[GetAsyncKeyState](nf-winuser-getasynckeystate.md),
[GetKeyState](nf-winuser-getkeystate.md),
[MapVirtualKey](nf-winuser-mapvirtualkeyw.md), and
**MapVirtualKeyEx** functions. For list complete table of virtual key
codes, see [Virtual Key
Codes](/windows/win32/inputdev/virtual-key-codes). In
**MAPVK\_VK\_TO\_CHAR** mode [virtual-key
codes](/windows/win32/inputdev/virtual-key-codes), the 'A'..'Z' keys
are translated to upper-case 'A'..'Z' characters regardless of
current keyboard layout. If you want to translate a virtual-key code
to the corresponding character, use the
[ToUnicode](/windows/win32/api/winuser/nf-winuser-tounicode)
function. > [!NOTE] > The winuser.h header defines MapVirtualKey as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
MapVirtualKeyExW
Translates (maps) a virtual-key code into a scan code or character value, or translates a scan code into a virtual-key code. The function translates the codes using the input language and an input locale identifier. (Unicode)
%group
Win32 user32
%prm
uCode, uMapType, dwhkl
uCode : [int] Type: **UINT** The [virtual key code](/windows/desktop/inputdev/virtual-key-codes) or scan code for a key. How this value is interpreted depends on the value of the *uMapType* parameter. **Starting with Windows Vista**, the high byte of the *uCode* value can contain either 0xe0 or 0xe1 to specify the extended scan code.
uMapType : [int] Type: **UINT** The translation to perform. The value of this parameter depends on the value of the uCode parameter. | Value | Meaning | |-------|---------| | **MAPVK\_VK\_TO\_VSC**0 | The *uCode* parameter is a virtual-key code and is translated into a scan code. If it is a virtual-key code that does not distinguish between left- and right-hand keys, the left-hand scan code is returned. If there is no translation, the function returns 0. | | **MAPVK\_VSC\_TO\_VK**1 | The *uCode* parameter is a scan code and is translated into a virtual-key code that does not distinguish between left- and right-hand keys. If there is no translation, the function returns 0. | | **MAPVK\_VK\_TO\_CHAR**2 | The *uCode* parameter is a virtual-key code and is translated into an unshifted character value in the low order word of the return value. Dead keys (diacritics) are indicated by setting the top bit of the return value. If there is no translation, the function returns 0. See Remarks. | | **MAPVK\_VSC\_TO\_VK\_EX**3 | The *uCode* parameter is a scan code and is translated into a virtual-key code that distinguishes between left- and right-hand keys. If there is no translation, the function returns 0. | | **MAPVK\_VK\_TO\_VSC\_EX**4 | **Windows Vista and later:** The *uCode* parameter is a virtual-key code and is translated into a scan code. If it is a virtual-key code that does not distinguish between left- and right-hand keys, the left-hand scan code is returned. If the scan code is an extended scan code, the high byte of the *uCode* value can contain either 0xe0 or 0xe1 to specify the extended scan code. If there is no translation, the function returns 0. |
dwhkl : [intptr] Type: **HKL** Input locale identifier to use for translating the specified code. This parameter can be any input locale identifier previously returned by the [LoadKeyboardLayout](nf-winuser-loadkeyboardlayoutw.md) function.
%inst
Translates (maps) a virtual-key code into a scan code or character
value, or translates a scan code into a virtual-key code. The
function translates the codes using the input language and an input
locale identifier. (Unicode)

[戻り値]
Type: **UINT** The return value is either a scan code, a virtual-key
code, or a character value, depending on the value of *uCode* and
*uMapType*. If there is no translation, the return value is zero.

[備考]
The input locale identifier is a broader concept than a keyboard
layout, since it can also encompass a speech-to-text converter, an
Input Method Editor (IME), or any other form of input. An application
can use **MapVirtualKeyEx** to translate scan codes to the
virtual-key code constants **VK_SHIFT**, **VK_CONTROL**, and
**VK_MENU**, and vice versa. These translations do not distinguish
between the left and right instances of the SHIFT, CTRL, or ALT keys.
An application can get the scan code corresponding to the left or
right instance of one of these keys by calling **MapVirtualKeyEx**
with *uCode* set to one of the following virtual-key code constants:
- **VK\_LSHIFT** - **VK\_RSHIFT** - **VK\_LCONTROL** -
**VK\_RCONTROL** - **VK\_LMENU** - **VK\_RMENU** These left- and
right-distinguishing constants are available to an application only
through the [GetKeyboardState](nf-winuser-getkeyboardstate.md),
[SetKeyboardState](nf-winuser-setkeyboardstate.md),
[GetAsyncKeyState](nf-winuser-getasynckeystate.md),
[GetKeyState](nf-winuser-getkeystate.md),
[MapVirtualKey](nf-winuser-mapvirtualkeyw.md), and
**MapVirtualKeyEx** functions. For list complete table of virtual key
codes, see [Virtual Key
Codes](/windows/win32/inputdev/virtual-key-codes). In
**MAPVK\_VK\_TO\_CHAR** mode [virtual-key
codes](/windows/win32/inputdev/virtual-key-codes), the 'A'..'Z' keys
are translated to upper-case 'A'..'Z' characters regardless of
current keyboard layout. If you want to translate a virtual-key code
to the corresponding character, use the
[ToUnicode](/windows/win32/api/winuser/nf-winuser-tounicode)
function. > [!NOTE] > The winuser.h header defines MapVirtualKeyEx as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
MapWindowPoints
The MapWindowPoints function converts (maps) a set of points from a coordinate space relative to one window to a coordinate space relative to another window.
%group
Win32 user32
%prm
hWndFrom, hWndTo, lpPoints, cPoints
hWndFrom : [intptr] A handle to the window from which points are converted. If this parameter is NULL or HWND_DESKTOP, the points are presumed to be in screen coordinates.
hWndTo : [intptr] A handle to the window to which points are converted. If this parameter is NULL or HWND_DESKTOP, the points are converted to screen coordinates.
lpPoints : [var] A pointer to an array of POINT structures that contain the set of points to be converted. The points are in device units. This parameter can also point to a RECT structure, in which case the cPoints parameter should be set to 2.
cPoints : [int] The number of POINT structures in the array pointed to by the lpPoints parameter.
%inst
The MapWindowPoints function converts (maps) a set of points from a
coordinate space relative to one window to a coordinate space
relative to another window.

[戻り値]
If the function succeeds, the low-order word of the return value is
the number of pixels added to the horizontal coordinate of each
source point in order to compute the horizontal coordinate of each
destination point. (In addition to that, if precisely one of hWndFrom
and hWndTo is mirrored, then each resulting horizontal coordinate is
multiplied by -1.) The high-order word is the number of pixels added
to the vertical coordinate of each source point in order to compute
the vertical coordinate of each destination point. If the function
fails, the return value is zero. Call SetLastError prior to calling
this method to differentiate an error return value from a legitimate
"0" return value.

[備考]
If hWndFrom or hWndTo (or both) are mirrored windows (that is, have
WS_EX_LAYOUTRTL extended style) and precisely two points are passed
in lpPoints, MapWindowPoints will interpret those two points as a
RECT and possibly automatically swap the left and right fields of
that rectangle to ensure that left is not greater than right. If any
number of points other than 2 is passed in lpPoints, then
MapWindowPoints will correctly map the coordinates of each of those
points separately, so if you pass in a pointer to an array of more
than one rectangle in lpPoints, the new rectangles may get their left
field greater than right. Thus, to guarantee the correct
transformation of rectangle coordinates, you must call
MapWindowPoints with one RECT pointer at a time, as shown in the
following example:
This doc was truncated.


%index
MenuItemFromPoint
Determines which menu item, if any, is at the specified location.
%group
Win32 user32
%prm
hWnd, hMenu, ptScreen
hWnd : [intptr] Type: HWND A handle to the window containing the menu. If this value is NULL and the hMenu parameter represents a popup menu, the function will find the menu window.
hMenu : [intptr] Type: HMENU A handle to the menu containing the menu items to hit test.
ptScreen : [int] Type: POINT A structure that specifies the location to test. If hMenu specifies a menu bar, this parameter is in window coordinates. Otherwise, it is in client coordinates.
%inst
Determines which menu item, if any, is at the specified location.

[戻り値]
Type: int Returns the zero-based position of the menu item at the
specified location or -1 if no menu item is at the specified
location.


%index
MessageBeep
Plays a waveform sound. The waveform sound for each sound type is identified by an entry in the registry.
%group
Win32 user32
%prm
uType
uType : [int] The sound to be played. The sounds are set by the user through the Sound control panel application, and then stored in the registry.
%inst
Plays a waveform sound. The waveform sound for each sound type is
identified by an entry in the registry.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
After queuing the sound, the MessageBeep function returns control to
the calling function and plays the sound asynchronously. If it cannot
play the specified alert sound, MessageBeep attempts to play the
system default sound. If it cannot play the system default sound, the
function produces a standard beep sound through the computer speaker.
The user can disable the warning beep by using the Sound control
panel application. Note To send a beep to a remote client, use the
Beep function. The Beep function is redirected to the client, whereas
MessageBeep is not.


%index
MessageBoxW
システムアイコン、ボタン群、アプリケーション固有の短いメッセージ(状態やエラー情報など)を含むモーダルダイアログボックスを表示する。戻り値はユーザーがクリックしたボタンを示す整数値。(MessageBoxW)
%group
Win32 user32
%prm
hWnd, lpText, lpCaption, uType
hWnd : [intptr] 型: HWND 作成するメッセージボックスのオーナーウィンドウへのハンドル。NULL の場合、メッセージボックスにオーナーウィンドウはない。
lpText : [wstr] 型: LPCTSTR 表示するメッセージ。複数行にする場合は各行の間にキャリッジリターンおよび/またはラインフィード文字を入れる。
lpCaption : [wstr] 型: LPCTSTR ダイアログボックスのタイトル。NULL の場合、既定のタイトルは Error。
uType : [int] 型: UINT ダイアログボックスの内容と動作。このパラメータには次のフラググループからのフラグの組み合わせを指定できる。
%inst

システムアイコン、ボタン群、アプリケーション固有の短いメッセージ(状態やエラー情報など)を含むモーダルダイアログボックスを表示する。戻り値はユーザーがクリックしたボタンを示す整数値。(MessageBoxW)

[戻り値]
型: int メッセージボックスに Cancel ボタンがある場合、ESC キーが押されるか Cancel ボタンが選択されると関数は
IDCANCEL を返す。Cancel ボタンがない場合、MB_OK ボタンがない限り ESC は無効である。MB_OK
ボタンが表示されていて ESC が押されると戻り値は IDOK になる。失敗した場合は 0。拡張エラー情報を得るには
GetLastError を呼び出す。成功した場合の戻り値は次のメニュー項目値のいずれかとなる。
（以下省略）

[備考]
次のシステムアイコンは、uType パラメータに対応するフラグ値を設定することでメッセージボックスに表示できる。
（以下省略）


%index
MessageBoxExW
Creates, displays, and operates a message box. (Unicode)
%group
Win32 user32
%prm
hWnd, lpText, lpCaption, uType, wLanguageId
hWnd : [intptr] Type: HWND A handle to the owner window of the message box to be created. If this parameter is NULL, the message box has no owner window.
lpText : [wstr] Type: LPCTSTR The message to be displayed.
lpCaption : [wstr] Type: LPCTSTR The dialog box title. If this parameter is NULL, the default title Error is used.
uType : [int] Type: UINT The contents and behavior of the dialog box. For information on the supported flags, see MessageBox.
wLanguageId : [int] Type: WORD The language for the text displayed in the message box button(s). Specifying a value of zero (0) indicates to display the button text in the default system language. If this parameter is MAKELANGID(LANG_NEUTRAL, SUBLANG_NEUTRAL), the current language associated with the calling thread is used.
%inst
Creates, displays, and operates a message box. (Unicode)

[戻り値]
Type: int If a message box has a Cancel button, the function returns
the IDCANCEL value if either the ESC key is pressed or the Cancel
button is selected. If the message box has no Cancel button, pressing
ESC will no effect - unless an MB_OK button is present. If an MB_OK
button is displayed and the user presses ESC, the return value will
be IDOK. If the function fails, the return value is zero. To get
extended error information, call GetLastError. If the function
succeeds, the return value is one of the following menu-item values.
This doc was truncated.

[備考]
When you use a system-modal message box to indicate that the system
is low on memory, the strings pointed to by the lpText and lpCaption
parameters should not be taken from a resource file because an
attempt to load the resource may fail. If you create a message box
while a dialog box is present, use a handle to the dialog box as the
hWnd parameter. The hWnd parameter should not identify a child
window, such as a control in a dialog box.
> [!NOTE] > The winuser.h header defines MessageBoxEx as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
MessageBoxIndirectW
Creates, displays, and operates a message box. The message box contains application-defined message text and title, any icon, and any combination of predefined push buttons. (Unicode)
%group
Win32 user32
%prm
lpmbp
lpmbp : [var] Type: const LPMSGBOXPARAMS A pointer to a MSGBOXPARAMS structure that contains information used to display the message box.
%inst
Creates, displays, and operates a message box. The message box
contains application-defined message text and title, any icon, and
any combination of predefined push buttons. (Unicode)

[戻り値]
Type: int If the function succeeds, the return value is one of the
following menu-item values. If a message box has a Cancel button, the
function returns the IDCANCEL value if either the ESC key is pressed
or the Cancel button is selected. If the message box has no Cancel
button, pressing ESC has no effect. If there is not enough memory to
create the message box, the return value is zero.
This doc was truncated.

[備考]
When you use a system-modal message box to indicate that the system
is low on memory, the strings pointed to by the lpszText and
lpszCaption members of the MSGBOXPARAMS structure should not be taken
from a resource file, because an attempt to load the resource may
fail. If you create a message box while a dialog box is present, use
a handle to the dialog box as the hWnd parameter. The hWnd parameter
should not identify a child window, such as a control in a dialog
box.
> [!NOTE] > The winuser.h header defines MessageBoxIndirect as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ModifyMenuW
Changes an existing menu item. (Unicode)
%group
Win32 user32
%prm
hMnu, uPosition, uFlags, uIDNewItem, lpNewItem
hMnu : [intptr] Type: HMENU A handle to the menu to be changed.
uPosition : [int] Type: UINT The menu item to be changed, as determined by the uFlags parameter.
uFlags : [int] Type: UINT Controls the interpretation of the uPosition parameter and the content, appearance, and behavior of the menu item. This parameter must include one of the following required values.
uIDNewItem : [int] Type: UINT_PTR The identifier of the modified menu item or, if the uFlags parameter has the MF_POPUP flag set, a handle to the drop-down menu or submenu.
lpNewItem : [wstr] Type: LPCTSTR The contents of the changed menu item. The interpretation of this parameter depends on whether the uFlags parameter includes the MF_BITMAP, MF_OWNERDRAW, or MF_STRING flag.
%inst
Changes an existing menu item. (Unicode)

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. To get extended
error information, call GetLastError.

[備考]
If ModifyMenu replaces a menu item that opens a drop-down menu or
submenu, the function destroys the old drop-down menu or submenu and
frees the memory used by it. In order for keyboard accelerators to
work with bitmap or owner-drawn menu items, the owner of the menu
must process the WM_MENUCHAR message. See Owner-Drawn Menus and the
WM_MENUCHAR Message for more information. The application must call
the DrawMenuBar function whenever a menu changes, whether the menu is
in a displayed window. To change the attributes of existing menu
items, it is much faster to use the CheckMenuItem and EnableMenuItem
functions. The following groups of flags cannot be used together:
This doc was truncated.


%index
MonitorFromPoint
The MonitorFromPoint function retrieves a handle to the display monitor that contains a specified point.
%group
Win32 user32
%prm
pt, dwFlags
pt : [int] A POINT structure that specifies the point of interest in virtual-screen coordinates.
dwFlags : [int] Determines the function's return value if the point is not contained within any display monitor.
%inst
The MonitorFromPoint function retrieves a handle to the display
monitor that contains a specified point.

[戻り値]
If the point is contained by a display monitor, the return value is
an HMONITOR handle to that display monitor. If the point is not
contained by a display monitor, the return value depends on the value
of dwFlags.


%index
MonitorFromRect
The MonitorFromRect function retrieves a handle to the display monitor that has the largest area of intersection with a specified rectangle.
%group
Win32 user32
%prm
lprc, dwFlags
lprc : [var] A pointer to a RECT structure that specifies the rectangle of interest in virtual-screen coordinates.
dwFlags : [int] Determines the function's return value if the rectangle does not intersect any display monitor.
%inst
The MonitorFromRect function retrieves a handle to the display
monitor that has the largest area of intersection with a specified
rectangle.

[戻り値]
If the rectangle intersects one or more display monitor rectangles,
the return value is an HMONITOR handle to the display monitor that
has the largest area of intersection with the rectangle. If the
rectangle does not intersect a display monitor, the return value
depends on the value of dwFlags.


%index
MonitorFromWindow
The MonitorFromWindow function retrieves a handle to the display monitor that has the largest area of intersection with the bounding rectangle of a specified window.
%group
Win32 user32
%prm
hwnd, dwFlags
hwnd : [intptr] A handle to the window of interest.
dwFlags : [int] Determines the function's return value if the window does not intersect any display monitor.
%inst
The MonitorFromWindow function retrieves a handle to the display
monitor that has the largest area of intersection with the bounding
rectangle of a specified window.

[戻り値]
If the window intersects one or more display monitor rectangles, the
return value is an HMONITOR handle to the display monitor that has
the largest area of intersection with the window. If the window does
not intersect a display monitor, the return value depends on the
value of dwFlags.

[備考]
If the window is currently minimized, MonitorFromWindow uses the
rectangle of the window before it was minimized.


%index
MoveWindow
指定したウィンドウの位置と寸法を変更する。
%group
Win32 user32
%prm
hWnd, X, Y, nWidth, nHeight, bRepaint
hWnd : [intptr] 型: HWND ウィンドウへのハンドル。
X : [int] 型: int ウィンドウ左辺の新しい位置。
Y : [int] 型: int ウィンドウ上辺の新しい位置。
nWidth : [int] 型: int ウィンドウの新しい幅。
nHeight : [int] 型: int ウィンドウの新しい高さ。
bRepaint : [int] 型: BOOL ウィンドウを再描画するかどうか。TRUE の場合、ウィンドウはメッセージを受け取る。FALSE の場合、一切の再描画は行われない。これはクライアント領域、非クライアント領域(タイトルバー、スクロールバー含む)、および子ウィンドウ移動により露出した親ウィンドウの一部すべてに適用される。
%inst
指定したウィンドウの位置と寸法を変更する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報を得るには GetLastError
を呼び出す。

[備考]
bRepaint が TRUE の場合、システムはウィンドウ移動直後にウィンドウプロシージャへ WM_PAINT
メッセージを送る(すなわち MoveWindow は UpdateWindow を呼ぶ)。FALSE
の場合、アプリケーションは再描画が必要な箇所を明示的に無効化または再描画する必要がある。MoveWindow はウィンドウへ
WM_WINDOWPOSCHANGING、WM_WINDOWPOSCHANGED、WM_MOVE、WM_SIZE、WM_NCCALCSIZE
メッセージを送る。


%index
MsgWaitForMultipleObjects
Waits until one or all of the specified objects are in the signaled state or the time-out interval elapses. The objects can include input event objects.
%group
Win32 user32
%prm
nCount, pHandles, fWaitAll, dwMilliseconds, dwWakeMask
nCount : [int] The number of object handles in the array pointed to by pHandles. The maximum number of object handles is MAXIMUM_WAIT_OBJECTS minus one. If this parameter has the value zero, then the function waits only for an input event.
pHandles : [intptr] An array of object handles. For a list of the object types whose handles can be specified, see the following Remarks section. The array can contain handles of objects of different types. It may not contain multiple copies of the same handle.
fWaitAll : [int] If this parameter is TRUE, the function returns when the states of all objects in the pHandles array have been set to signaled and an input event has been received. If this parameter is FALSE, the function returns when the state of any one of the objects is set to signaled or an input event has been received. In this case, the return value indicates the object whose state caused the function to return.
dwMilliseconds : [int] The time-out interval, in milliseconds. If a nonzero value is specified, the function waits until the specified objects are signaled or the interval elapses. If dwMilliseconds is zero, the function does not enter a wait state if the specified objects are not signaled; it always returns immediately. If dwMilliseconds is INFINITE, the function will return only when the specified objects are signaled. Windows?XP, Windows Server?2003, Windows?Vista, Windows?7, Windows Server?2008 and Windows Server?2008?R2:??The dwMilliseconds value does include time spent in low-power states. For example, the timeout does keep counting down while the computer is asleep. Windows?8, Windows Server?2012, Windows?8.1, Windows Server?2012?R2, Windows?10 and Windows Server?2016:??The dwMilliseconds value does not include time spent in low-power states. For example, the timeout does not keep counting down while the computer is asleep.
dwWakeMask : [int] The input types for which an input event object handle will be added to the array of object handles. This parameter can be any combination of the values listed in [GetQueueStatus](/windows/win32/api/winuser/nf-winuser-getqueuestatus) *flags* parameter.
%inst
Waits until one or all of the specified objects are in the signaled
state or the time-out interval elapses. The objects can include input
event objects.

[戻り値]
If the function succeeds, the return value indicates the event that
caused the function to return. It can be one of the following values.
(Note that WAIT_OBJECT_0 is defined as 0 and WAIT_ABANDONED_0 is
defined as 0x00000080L.)
This doc was truncated.

[備考]
The MsgWaitForMultipleObjects function determines whether the wait
criteria have been met. If the criteria have not been met, the
calling thread enters the wait state until the conditions of the wait
criteria have been met or the time-out interval elapses. When
bWaitAll is TRUE, the function does not modify the states of the
specified objects until the states of all objects have been set to
signaled. For example, a mutex can be signaled, but the thread does
not get ownership until the states of the other objects have also
been set to signaled. In the meantime, some other thread may get
ownership of the mutex, thereby setting its state to nonsignaled.
When bWaitAll is TRUE, the function's wait is completed only when the
states of all objects have been set to signaled and an input event
has been received. Therefore, setting bWaitAll to TRUE prevents input
from being processed until the state of all objects in the pHandles
array have been set to signaled. For this reason, if you set bWaitAll
to TRUE, you should use a short timeout value in dwMilliseconds. If
you have a thread that creates windows waiting for all objects in the
pHandles array, including input events specified by dwWakeMask, with
no timeout interval, the system will deadlock. This is because
threads that create windows must process messages. DDE sends message
to all windows in the system. Therefore, if a thread creates windows,
do not set the bWaitAll parameter to TRUE in calls to
MsgWaitForMultipleObjects made from that thread. When bWaitAll is
FALSE, this function checks the handles in the array in order
starting with index 0, until one of the objects is signaled. If
multiple objects become signaled, the function returns the index of
the first handle in the array whose object was signaled.
MsgWaitForMultipleObjects does not return if there is unread input of
the specified type in the message queue after the thread has called a
function to check the queue. This is because functions such as
PeekMessage, GetMessage, GetQueueStatus, and WaitMessage check the
queue and then change the state information for the queue so that the
input is no longer considered new. A subsequent call to
MsgWaitForMultipleObjects will not return until new input of the
specified type arrives. The existing unread input (received prior to
the last time the thread checked the queue) is ignored. The function
modifies the state of some types of synchronization objects.
Modification occurs only for the object or objects whose signaled
state caused the function to return. For example, the count of a
semaphore object is decreased by one. For more information, see the
documentation for the individual synchronization objects. The
MsgWaitForMultipleObjects function can specify handles of any of the
following object types in the pHandles array:
This doc was truncated.


%index
MsgWaitForMultipleObjectsEx
Waits until one or all of the specified objects are in the signaled state, an I/O completion routine or asynchronous procedure call (APC) is queued to the thread, or the time-out interval elapses. The array of objects can include input event objects.
%group
Win32 user32
%prm
nCount, pHandles, dwMilliseconds, dwWakeMask, dwFlags
nCount : [int] The number of object handles in the array pointed to by pHandles. The maximum number of object handles is MAXIMUM_WAIT_OBJECTS minus one. If this parameter has the value zero, then the function waits only for an input event.
pHandles : [intptr] An array of object handles. For a list of the object types whose handles you can specify, see the Remarks section later in this topic. The array can contain handles to multiple types of objects. It may not contain multiple copies of the same handle.
dwMilliseconds : [int] The time-out interval, in milliseconds. If a nonzero value is specified, the function waits until the specified objects are signaled, an I/O completion routine or APC is queued, or the interval elapses. If dwMilliseconds is zero, the function does not enter a wait state if the criteria is not met; it always returns immediately. If dwMilliseconds is INFINITE, the function will return only when the specified objects are signaled or an I/O completion routine or APC is queued. Windows?XP, Windows Server?2003, Windows?Vista, Windows?7, Windows Server?2008 and Windows Server?2008?R2:??The dwMilliseconds value does include time spent in low-power states. For example, the timeout does keep counting down while the computer is asleep. Windows?8, Windows Server?2012, Windows?8.1, Windows Server?2012?R2, Windows?10 and Windows Server?2016:??The dwMilliseconds value does not include time spent in low-power states. For example, the timeout does not keep counting down while the computer is asleep.
dwWakeMask : [int] The input types for which an input event object handle will be added to the array of object handles. This parameter can be any combination of the values listed in [GetQueueStatus](/windows/win32/api/winuser/nf-winuser-getqueuestatus) *flags* parameter.
dwFlags : [int] 
%inst
Waits until one or all of the specified objects are in the signaled
state, an I/O completion routine or asynchronous procedure call (APC)
is queued to the thread, or the time-out interval elapses. The array
of objects can include input event objects.

[戻り値]
If the function succeeds, the return value indicates the event that
caused the function to return. It can be one of the following values.
(Note that WAIT_OBJECT_0 is defined as 0 and WAIT_ABANDONED_0 is
defined as 0x00000080L.)
This doc was truncated.

[備考]
The MsgWaitForMultipleObjectsEx function determines whether the
conditions specified by dwWakeMask and dwFlags have been met. If the
conditions have not been met, the calling thread enters the wait
state until the conditions of the wait criteria have been met or the
time-out interval elapses. When dwFlags is zero, this function checks
the handles in the array in order starting with index 0, until one of
the objects is signaled. If multiple objects become signaled, the
function returns the index of the first handle in the array whose
object was signaled. MsgWaitForMultipleObjectsEx does not return if
there is unread input of the specified type in the message queue
after the thread has called a function to check the queue, unless you
use the MWMO_INPUTAVAILABLE flag. This is because functions such as
PeekMessage, GetMessage, GetQueueStatus, and WaitMessage check the
queue and then change the state information for the queue so that the
input is no longer considered new. A subsequent call to
MsgWaitForMultipleObjectsEx will not return until new input of the
specified type arrives, unless you use the MWMO_INPUTAVAILABLE flag.
If this flag is not used, the existing unread input (received prior
to the last time the thread checked the queue) is ignored. The
function modifies the state of some types of synchronization objects.
Modification occurs only for the object or objects whose signaled
state caused the function to return. For example, the system
decreases the count of a semaphore object by one. For more
information, see the documentation for the individual synchronization
objects. The MsgWaitForMultipleObjectsEx function can specify handles
of any of the following object types in the pHandles array:
This doc was truncated.


%index
NotifyWinEvent
Signals the system that a predefined event occurred. If any client applications have registered a hook function for the event, the system calls the client's hook function.
%group
Win32 user32
%prm
event, hwnd, idObject, idChild
event : [int] 
hwnd : [intptr] Type: HWND Handle to the window that contains the object that generated the event.
idObject : [int] Type: LONG Identifies the object that generated the event. This value is either one of the predefined object identifiers or a custom object ID value.
idChild : [int] Type: LONG Identifies whether the event was generated by an object or by a child element of the object. If this value is CHILDID_SELF, the event was generated by the object itself. If not CHILDID_SELF, this value is the child ID of the element that generated the event.
%inst
Signals the system that a predefined event occurred. If any client
applications have registered a hook function for the event, the
system calls the client's hook function.

[備考]
Servers call this function to notify the system that an event has
occurred. Microsoft Active Accessibility checks to see if any client
applications have set hook procedures for the event and, if so, calls
the appropriate hook procedures. If no hook procedures are registered
for the event, the performance penalty for calling this function is
minor. Servers call NotifyWinEvent to announce the event to the
system after the event has occurred; they must never notify the
system of an event before the event has occurred. When the client's
hook procedure is called, it receives a number of parameters that
describe the event and the object that generated the event. The hook
procedure uses the AccessibleObjectFromEvent function to retrieve a
pointer to the IAccessible interface of the object that generated the
event. Servers may receive a
[WM_GETOBJECT](/windows/win32/winauto/wm-getobject) message
immediately after calling this function. This can happen if there are
any in-context clients that call AccessibleObjectFromEvent in the
event callback. When servers call this function, they must be ready
to handle [WM_GETOBJECT](/windows/win32/winauto/wm-getobject), return
an IAccessible interface pointer, and handle any of the IAccessible
methods. Note to Server Developers: When you call NotifyWinEvent, if
any clients are listening for that event in-context, their event
handlers, which typically send
[WM_GETOBJECT](/windows/win32/winauto/wm-getobject) and call
IAccessible methods, will execute before NotifyWinEvent returns. When
you call NotifyWinEvent, you should be prepared to handle these
calls, if they occur. If you need to do extra setup to allow for
this, you should do so before you call NotifyWinEvent, not after.


%index
OemKeyScan
Maps OEMASCII codes 0 through 0x0FF into the OEM scan codes and shift states. The function provides information that allows a program to send OEM text to another program by simulating keyboard input.
%group
Win32 user32
%prm
wOemChar
wOemChar : [int] Type: WORD The ASCII value of the OEM character.
%inst
Maps OEMASCII codes 0 through 0x0FF into the OEM scan codes and shift
states. The function provides information that allows a program to
send OEM text to another program by simulating keyboard input.

[戻り値]
Type: DWORD The low-order word of the return value contains the scan
code of the OEM character, and the high-order word contains the shift
state, which can be a combination of the following bits.
This doc was truncated.

[備考]
This function does not provide translations for characters that
require CTRL+ALT or dead keys. Characters not translated by this
function must be copied by simulating input using the ALT+ keypad
mechanism. The NUMLOCK key must be off. This function does not
provide translations for characters that cannot be typed with one
keystroke using the current keyboard layout, such as characters with
diacritics requiring dead keys. Characters not translated by this
function may be simulated using the ALT+ keypad mechanism. The
NUMLOCK key must be on. This function is implemented using the
VkKeyScan function.


%index
OemToCharW
Translates a string from the OEM-defined character set into either an ANSI or a wide-character string.Warning??Do not use. (Unicode)
%group
Win32 user32
%prm
pSrc, pDst
pSrc : [str] Type: LPCSTR A null-terminated string of characters from the OEM-defined character set.
pDst : [wstr] Type: LPTSTR The destination buffer, which receives the translated string. If the OemToChar function is being used as an ANSI function, the string can be translated in place by setting the lpszDst parameter to the same address as the lpszSrc parameter. This cannot be done if OemToChar is being used as a wide-character function.
%inst
Translates a string from the OEM-defined character set into either an
ANSI or a wide-character string.Warning Do not use. (Unicode)

[戻り値]
Type: BOOL The return value is always nonzero except when you pass
the same address to lpszSrc and lpszDst in the wide-character version
of the function. In this case the function returns zero and
GetLastError returns ERROR_INVALID_ADDRESS.

[備考]
> [!NOTE] > The winuser.h header defines OemToChar as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
OemToCharBuffW
Translates a specified number of characters in a string from the OEM-defined character set into either an ANSI or a wide-character string. (Unicode)
%group
Win32 user32
%prm
lpszSrc, lpszDst, cchDstLength
lpszSrc : [str] Type: LPCSTR One or more characters from the OEM-defined character set.
lpszDst : [wstr] Type: LPTSTR The destination buffer, which receives the translated string. If the OemToCharBuff function is being used as an ANSI function, the string can be translated in place by setting the lpszDst parameter to the same address as the lpszSrc parameter. This cannot be done if the OemToCharBuff function is being used as a wide-character function.
cchDstLength : [int] Type: DWORD The number of characters to be translated in the buffer identified by the lpszSrc parameter.
%inst
Translates a specified number of characters in a string from the
OEM-defined character set into either an ANSI or a wide-character
string. (Unicode)

[戻り値]
Type: BOOL The return value is always nonzero except when you pass
the same address to lpszSrc and lpszDst in the wide-character version
of the function. In this case the function returns zero and
GetLastError returns ERROR_INVALID_ADDRESS.

[備考]
Unlike the OemToChar function, the OemToCharBuff function does not
stop converting characters when it encounters a null character in the
buffer pointed to by lpszSrc. The OemToCharBuff function converts all
cchDstLength characters.
> [!NOTE] > The winuser.h header defines OemToCharBuff as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
OffsetRect
The OffsetRect function moves the specified rectangle by the specified offsets.
%group
Win32 user32
%prm
lprc, dx, dy
lprc : [var] Pointer to a RECT structure that contains the logical coordinates of the rectangle to be moved.
dx : [int] Specifies the amount to move the rectangle left or right. This parameter must be a negative value to move the rectangle to the left.
dy : [int] Specifies the amount to move the rectangle up or down. This parameter must be a negative value to move the rectangle up.
%inst
The OffsetRect function moves the specified rectangle by the
specified offsets.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
Because applications can use rectangles for different purposes, the
rectangle functions do not use an explicit unit of measure. Instead,
all rectangle coordinates and dimensions are given in signed, logical
values. The mapping mode and the function in which the rectangle is
used determine the units of measure.


%index
OpenClipboard
Opens the clipboard for examination and prevents other applications from modifying the clipboard content.
%group
Win32 user32
%prm
hWndNewOwner
hWndNewOwner : [intptr] Type: HWND A handle to the window to be associated with the open clipboard. If this parameter is NULL, the open clipboard is associated with the current task.
%inst
Opens the clipboard for examination and prevents other applications
from modifying the clipboard content.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
OpenClipboard fails if another window has the clipboard open. An
application should call the CloseClipboard function after every
successful call to OpenClipboard. The window identified by the
hWndNewOwner parameter does not become the clipboard owner unless the
EmptyClipboard function is called. If an application calls
OpenClipboard with hwnd set to NULL, EmptyClipboard sets the
clipboard owner to NULL; this causes SetClipboardData to fail.


%index
OpenDesktopW
Opens the specified desktop object. (Unicode)
%group
Win32 user32
%prm
lpszDesktop, dwFlags, fInherit, dwDesiredAccess
lpszDesktop : [wstr] The name of the desktop to be opened. Desktop names are case-insensitive. This desktop must belong to the current window station.
dwFlags : [int] This parameter can be zero or the following value.
fInherit : [int] If this value is TRUE, processes created by this process will inherit the handle. Otherwise, the processes do not inherit this handle.
dwDesiredAccess : [int] The access to the desktop. For a list of access rights, see Desktop Security and Access Rights.
%inst
Opens the specified desktop object. (Unicode)

[戻り値]
If the function succeeds, the return value is a handle to the opened
desktop. When you are finished using the handle, call the
CloseDesktop function to close it. If the function fails, the return
value is NULL. To get extended error information, call GetLastError.

[備考]
The calling process must have an associated window station, either
assigned by the system at process creation time or set by the
SetProcessWindowStation function. If the dwDesiredAccess parameter
specifies the READ_CONTROL, WRITE_DAC, or WRITE_OWNER standard access
rights, you must also request the DESKTOP_READOBJECTS and
DESKTOP_WRITEOBJECTS access rights.
> [!NOTE] > The winuser.h header defines OpenDesktop as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
OpenIcon
Restores a minimized (iconic) window to its previous size and position; it then activates the window.
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] Type: HWND A handle to the window to be restored and activated.
%inst
Restores a minimized (iconic) window to its previous size and
position; it then activates the window.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
OpenIcon sends a WM_QUERYOPEN message to the given window.


%index
OpenInputDesktop
Opens the desktop that receives user input.
%group
Win32 user32
%prm
dwFlags, fInherit, dwDesiredAccess
dwFlags : [int] This parameter can be zero or the following value.
fInherit : [int] If this value is TRUE, processes created by this process will inherit the handle. Otherwise, the processes do not inherit this handle.
dwDesiredAccess : [int] The access to the desktop. For a list of access rights, see Desktop Security and Access Rights.
%inst
Opens the desktop that receives user input.

[戻り値]
If the function succeeds, the return value is a handle to the desktop
that receives user input. When you are finished using the handle,
call the CloseDesktop function to close it. If the function fails,
the return value is NULL. To get extended error information, call
GetLastError.

[備考]
The calling process must have an associated window station, either
assigned by the system when the process is created, or set by the
SetProcessWindowStation function. The window station associated with
the calling process must be capable of receiving input. If the
calling process is running in a disconnected session, the function
returns a handle to the desktop that becomes active when the user
restores the connection. An application can use the SwitchDesktop
function to change the input desktop. If the dwDesiredAccess
parameter specifies the READ_CONTROL, WRITE_DAC, or WRITE_OWNER
standard access rights, you must also request the DESKTOP_READOBJECTS
and DESKTOP_WRITEOBJECTS access rights.


%index
OpenWindowStationW
Opens the specified window station. (Unicode)
%group
Win32 user32
%prm
lpszWinSta, fInherit, dwDesiredAccess
lpszWinSta : [wstr] The name of the window station to be opened. Window station names are case-insensitive. This window station must belong to the current session.
fInherit : [int] If this value is TRUE, processes created by this process will inherit the handle. Otherwise, the processes do not inherit this handle.
dwDesiredAccess : [int] The access to the window station. For a list of access rights, see Window Station Security and Access Rights.
%inst
Opens the specified window station. (Unicode)

[戻り値]
If the function succeeds, the return value is the handle to the
specified window station. If the function fails, the return value is
NULL. To get extended error information, call GetLastError.

[備考]
After you are done with the handle, you must call CloseWindowStation
to free the handle.
> [!NOTE] > The winuser.h header defines OpenWindowStation as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
PackDDElParam
Packs a Dynamic Data Exchange (DDE)?lParam value into an internal structure used for sharing DDE data between processes.
%group
Win32 user32
%prm
msg, uiLo, uiHi
msg : [int] Type: UINT The DDE message to be posted.
uiLo : [int] Type: UINT_PTR A value that corresponds to the 16-bit Windows low-order word of an lParam parameter for the DDE message being posted.
uiHi : [int] Type: UINT_PTR A value that corresponds to the 16-bit Windows high-order word of an lParam parameter for the DDE message being posted.
%inst
Packs a Dynamic Data Exchange (DDE) lParam value into an internal
structure used for sharing DDE data between processes.

[戻り値]
Type: LPARAM The return value is the lParam value.

[備考]
The return value must be posted as the lParam parameter of a DDE
message; it must not be used for any other purpose. After the
application posts a return value, it need not perform any action to
dispose of the lParam parameter. An application should call this
function only for posted DDE messages.


%index
PackTouchHitTestingProximityEvaluation
Returns the proximity evaluation score and the adjusted touch-point coordinates as a packed value for the WM_TOUCHHITTESTING callback.
%group
Win32 user32
%prm
pHitTestingInput, pProximityEval
pHitTestingInput : [var] The TOUCH_HIT_TESTING_INPUT structure that holds the data for the touch contact area.
pProximityEval : [var] The TOUCH_HIT_TESTING_PROXIMITY_EVALUATION structure that holds the score and adjusted touch-point data that the EvaluateProximityToPolygon or EvaluateProximityToRect function returns.
%inst
Returns the proximity evaluation score and the adjusted touch-point
coordinates as a packed value for the WM_TOUCHHITTESTING callback.

[戻り値]
If this function succeeds, it returns the score and adjustedPoint
values from TOUCH_HIT_TESTING_PROXIMITY_EVALUATION as an LRESULT. To
retrieve extended error information, call the GetLastError function.

[備考]
Usually, this is the last function that's called in a
WM_TOUCHHITTESTING handler.


%index
PaintDesktop
The PaintDesktop function fills the clipping region in the specified device context with the desktop pattern or wallpaper. The function is provided primarily for shell desktops.
%group
Win32 user32
%prm
hdc
hdc : [intptr] Handle to the device context.
%inst
The PaintDesktop function fills the clipping region in the specified
device context with the desktop pattern or wallpaper. The function is
provided primarily for shell desktops.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.


%index
PeekMessageW
Dispatches incoming nonqueued messages, checks the thread message queue for a posted message, and retrieves the message (if any exist). (Unicode)
%group
Win32 user32
%prm
lpMsg, hWnd, wMsgFilterMin, wMsgFilterMax, wRemoveMsg
lpMsg : [var] Type: LPMSG A pointer to an MSG structure that receives message information.
hWnd : [intptr] Type: HWND A handle to the window whose messages are to be retrieved. The window must belong to the current thread.
wMsgFilterMin : [int] Type: UINT The value of the first message in the range of messages to be examined. Use WM_KEYFIRST (0x0100) to specify the first keyboard message or WM_MOUSEFIRST (0x0200) to specify the first mouse message. If wMsgFilterMin and wMsgFilterMax are both zero, PeekMessage returns all available messages (that is, no range filtering is performed).
wMsgFilterMax : [int] Type: UINT The value of the last message in the range of messages to be examined. Use WM_KEYLAST to specify the last keyboard message or WM_MOUSELAST to specify the last mouse message. If wMsgFilterMin and wMsgFilterMax are both zero, PeekMessage returns all available messages (that is, no range filtering is performed).
wRemoveMsg : [int] Type: UINT
%inst
Dispatches incoming nonqueued messages, checks the thread message
queue for a posted message, and retrieves the message (if any exist).
(Unicode)

[戻り値]
Type: BOOL If a message is available, the return value is nonzero. If
no messages are available, the return value is zero.

[備考]
PeekMessage retrieves messages associated with the window identified
by the hWnd parameter or any of its children as specified by the
IsChild function, and within the range of message values given by the
wMsgFilterMin and wMsgFilterMax parameters. Note that an application
can only use the low word in the wMsgFilterMin and wMsgFilterMax
parameters; the high word is reserved for the system. Note that
PeekMessage always retrieves WM_QUIT messages, no matter which values
you specify for wMsgFilterMin and wMsgFilterMax. During this call,
the system dispatches (DispatchMessage) pending, nonqueued messages,
that is, messages sent to windows owned by the calling thread using
the SendMessage, SendMessageCallback, SendMessageTimeout, or
SendNotifyMessage function. Then the first queued message that
matches the specified filter is retrieved. The system may also
process internal events. If no filter is specified, messages are
processed in the following order:
This doc was truncated.


%index
PhysicalToLogicalPoint
Converts the physical coordinates of a point in a window to logical coordinates.
%group
Win32 user32
%prm
hWnd, lpPoint
hWnd : [intptr] Type: HWND A handle to the window whose transform is used for the conversion. Top level windows are fully supported. In the case of child windows, only the area of overlap between the parent and the child window is converted.
lpPoint : [var] Type: LPPOINT A pointer to a POINT structure that specifies the physical/screen coordinates to be converted. The new logical coordinates are copied into this structure if the function succeeds.
%inst
Converts the physical coordinates of a point in a window to logical
coordinates.

[備考]
Windows Vista introduces the concept of physical coordinates. Desktop
Window Manager (DWM) scales non-dots per inch (dpi) aware windows
when the display is high dpi. The window seen on the screen
corresponds to the physical coordinates. The application continues to
work in logical space. Therefore, the application's view of the
window is different from that which appears on the screen. For scaled
windows, logical and physical coordinates are different. The function
uses the window identified by the hWnd parameter and the physical
coordinates given in the POINT structure to compute the logical
coordinates. The logical coordinates are the unscaled coordinates
that appear to the application in a programmatic way. In other words,
the logical coordinates are the coordinates the application
recognizes, which can be different from the physical coordinates. The
API then replaces the physical coordinates with the logical
coordinates. The new coordinates are in the world coordinates whose
origin is (0, 0) on the desktop. The coordinates passed to the API
have to be on the hWnd. The source coordinates are in device units.
On all platforms, PhysicalToLogicalPoint will fail on a window that
has either 0 width or height; an application must first establish a
non-0 width and height by calling, for example, MoveWindow. On some
versions of Windows (including Windows 7), PhysicalToLogicalPoint
will still fail if MoveWindow has been called after a call to
ShowWindow with SH_HIDE has hidden the window. In Windows 8,
system?DPI aware applications translate between physical and logical
space using PhysicalToLogicalPoint and LogicalToPhysicalPoint. In
Windows 8.1, the additional virtualization of the system and
inter-process communications means that for the majority of
applications, you do not need these APIs. As a result, in Windows
8.1, PhysicalToLogicalPoint and LogicalToPhysicalPoint no longer
transform points. The system returns all points to an application in
its own coordinate space. This behavior preserves functionality for
the majority of applications, but there are some exceptions in which
you must make changes to ensure that the application works as
expected. In those cases, use PhysicalToLogicalPointForPerMonitorDPI
and LogicalToPhysicalPointForPerMonitorDPI.


%index
PhysicalToLogicalPointForPerMonitorDPI
Converts a point in a window from physical coordinates into logical coordinates, regardless of the dots per inch (dpi) awareness of the caller.
%group
Win32 user32
%prm
hWnd, lpPoint
hWnd : [intptr] A handle to the window whose transform is used for the conversion.
lpPoint : [var] A pointer to a POINT structure that specifies the physical/screen coordinates to be converted. The new logical coordinates are copied into this structure if the function succeeds.
%inst
Converts a point in a window from physical coordinates into logical
coordinates, regardless of the dots per inch (dpi) awareness of the
caller.

[戻り値]
Returns TRUE if successful, or FALSE otherwise.

[備考]
In Windows 8, system?DPI aware applications translate between
physical and logical space using PhysicalToLogicalPoint and
LogicalToPhysicalPoint. In Windows 8.1, the additional virtualization
of the system and inter-process communications means that for the
majority of applications, you do not need these APIs. As a result, in
Windows 8.1, these APIs no longer transform points. The system
returns all points to an application in its own coordinate space.
This behavior preserves functionality for the majority of
applications, but there are some exceptions in which you must make
changes to ensure that the application works as expected. For
example, an application might need to walk the entire window tree of
another process and ask the system for DPI-dependent information
about the window. By default, the system will return the information
based on the DPI awareness of the caller. This is ideal for most
applications. However, the caller might need the information based on
the DPI awareness of the application associated with the window. This
might be necessary because the two applications send DPI-dependent
information between each other directly. In this case, the
application can use LogicalToPhysicalPointForPerMonitorDPI to get
physical coordinates and then use
PhysicalToLogicalPointForPerMonitorDPI to convert the physical
coordinates into logical coordinates based on the DPI-awareness of
the provided HWND. Consider two applications, one has a
PROCESS_DPI_AWARENESS value of PROCESS_DPI_UNAWARE and the other has
a value of PROCESS_PER_MONITOR_AWARE. The PROCESS_PER_MONITOR_AWARE
app creates a window on a single monitor where the scale factor is
200% (192 DPI). If both apps call GetWindowRect on this window, they
will receive different values. The PROCESS_DPI_UNAWARE app will
receive a rect based on 96 DPI coordinates, while the
PROCESS_PER_MONITOR_AWARE app will receive coordinates matching the
actual DPI of the monitor. If the PROCESS_DPI_UNAWARE needs the rect
that the system returned to the PROCESS_PER_MONITOR_AWARE app, it
could call LogicalToPhysicalPointForPerMonitorDPI for the corners of
its rect and pass in a handle to the PROCESS_PER_MONITOR_AWARE app's
window. This will return points based on the other app's awareness
that can be used to create a rect. This works because since a
PROCESS_PER_MONITOR_AWARE uses the actual DPI of the monitor, logical
and physical coordinates are identical.


%index
PostMessageW
指定したウィンドウを作成したスレッドのメッセージキューにメッセージを投稿(ポスト)し、スレッドがメッセージを処理するのを待たずに戻る。(Unicode)
%group
Win32 user32
%prm
hWnd, Msg, wParam, lParam
hWnd : [intptr] 型: HWND メッセージを受け取るウィンドウプロシージャのウィンドウへのハンドル。次の値は特別な意味を持つ。
Msg : [int] 型: UINT 投稿するメッセージ。システム定義メッセージの一覧は System-Defined Messages を参照。
wParam : [intptr] 型: WPARAM メッセージ固有の追加情報。
lParam : [intptr] 型: LPARAM メッセージ固有の追加情報。
%inst

指定したウィンドウを作成したスレッドのメッセージキューにメッセージを投稿(ポスト)し、スレッドがメッセージを処理するのを待たずに戻る。(Unicode)

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報を得るには GetLastError
を呼び出す。

[備考]
UIPI によりメッセージがブロックされた場合、GetLastError で取得される最終エラーは 5 (access denied)
に設定される。メッセージキュー内のメッセージは GetMessage または PeekMessage
で取得される。HWND_BROADCAST を使った通信を行うアプリケーションは、アプリケーション間通信用の一意なメッセージを得るために
RegisterWindowMessage を使うべきである。システムはシステムメッセージ(0～WM_USER-1
の範囲)についてのみマーシャリングを行う。他のメッセージ(WM_USER
以上)を別プロセスへ送るにはカスタムマーシャリングが必要。WM_USER
未満のメッセージを非同期メッセージ関数(PostMessage、SendNotifyMessage、SendMessageCallback)で送る場合、メッセージパラメータにポインタを含めてはならない。さもなければ操作は失敗する。これらの関数は受信スレッドがメッセージを処理する前に戻り、送信側は使用される前にメモリを解放してしまう。WM_QUIT
を PostMessage で投稿してはならない。代わりに PostQuitMessage を使うこと。アクセシビリティアプリケーションは
PostMessage でシェルに WM_APPCOMMAND
メッセージを投稿しアプリケーションを起動できる。これは他のタイプのアプリケーションで動作する保証はない。メッセージキューあたりの投稿メッセージ数は
10,000
に制限される。この上限は十分大きいはずである。上限を超える場合、そのアプリケーションはシステムリソースの消費を避けるよう再設計すべきである。この上限を調整するには次のレジストリキーを編集する。HKEY_LOCAL_MACHINE
SOFTWARE Microsoft Windows NT CurrentVersion Windows
USERPostMessageLimit 失敗時は GetLastError を呼ぶ。上限に達した場合、GetLastError は
ERROR_NOT_ENOUGH_QUOTA を返す。許容可能な最小値は 4000。


%index
PostQuitMessage
Indicates to the system that a thread has made a request to terminate (quit). It is typically used in response to a WM_DESTROY message.
%group
Win32 user32
%prm
nExitCode
nExitCode : [int] Type: int The application exit code. This value is used as the wParam parameter of the WM_QUIT message.
%inst
Indicates to the system that a thread has made a request to terminate
(quit). It is typically used in response to a WM_DESTROY message.

[備考]
The PostQuitMessage function posts a WM_QUIT message to the thread's
message queue and returns immediately; the function simply indicates
to the system that the thread is requesting to quit at some time in
the future. When the thread retrieves the WM_QUIT message from its
message queue, it should exit its message loop and return control to
the system. The exit value returned to the system must be the wParam
parameter of the WM_QUIT message.


%index
PostThreadMessageW
Posts a message to the message queue of the specified thread. It returns without waiting for the thread to process the message. (Unicode)
%group
Win32 user32
%prm
idThread, Msg, wParam, lParam
idThread : [int] Type: DWORD The identifier of the thread to which the message is to be posted. The function fails if the specified thread does not have a message queue. The system creates a thread's message queue when the thread makes its first call to one of the User or GDI functions. For more information, see the Remarks section. Message posting is subject to UIPI. The thread of a process can post messages only to posted-message queues of threads in processes of lesser or equal integrity level. This thread must have the SE_TCB_NAME privilege to post a message to a thread that belongs to a process with the same locally unique identifier (LUID) but is in a different desktop. Otherwise, the function fails and returns ERROR_INVALID_THREAD_ID. This thread must either belong to the same desktop as the calling thread or to a process with the same LUID. Otherwise, the function fails and returns ERROR_INVALID_THREAD_ID.
Msg : [int] Type: UINT The type of message to be posted.
wParam : [intptr] Type: WPARAM Additional message-specific information.
lParam : [intptr] Type: LPARAM Additional message-specific information.
%inst
Posts a message to the message queue of the specified thread. It
returns without waiting for the thread to process the message.
(Unicode)

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError. GetLastError returns
ERROR_INVALID_THREAD_ID if idThread is not a valid thread identifier,
or if the thread specified by idThread does not have a message queue.
GetLastError returns ERROR_NOT_ENOUGH_QUOTA when the message limit is
hit.

[備考]
When a message is blocked by UIPI the last error, retrieved with
GetLastError, is set to 5 (access denied). The thread to which the
message is posted must have created a message queue, or else the call
to PostThreadMessage fails. Use the following method to handle this
situation.
This doc was truncated.


%index
PrintWindow
The PrintWindow function copies a visual window into the specified device context (DC), typically a printer DC.
%group
Win32 user32
%prm
hwnd, hdcBlt, nFlags
hwnd : [intptr] A handle to the window that will be copied.
hdcBlt : [intptr] A handle to the device context.
nFlags : [int] 
%inst
The PrintWindow function copies a visual window into the specified
device context (DC), typically a printer DC.

[戻り値]
If the function succeeds, it returns a nonzero value. If the function
fails, it returns zero.

[備考]
Note This is a blocking or synchronous function and might not return
immediately. How quickly this function returns depends on run-time
factors such as network status, print server configuration, and
printer driver implementation?factors that are difficult to predict
when writing an application. Calling this function from a thread that
manages interaction with the user interface could make the
application appear to be unresponsive. The application that owns the
window referenced by hWnd processes the PrintWindow call and renders
the image in the device context that is referenced by hdcBlt. The
application receives a WM_PRINT message or, if the PW_PRINTCLIENT
flag is specified, a WM_PRINTCLIENT message. For more information,
see WM_PRINT and WM_PRINTCLIENT.


%index
PrivateExtractIconsW
Creates an array of handles to icons that are extracted from a specified file. (Unicode)
%group
Win32 user32
%prm
szFileName, nIconIndex, cxIcon, cyIcon, phicon, piconid, nIcons, flags
szFileName : [wstr] Type: LPCTSTR The path and name of the file from which the icon(s) are to be extracted.
nIconIndex : [int] Type: int The zero-based index of the first icon to extract. For example, if this value is zero, the function extracts the first icon in the specified file.
cxIcon : [int] Type: int The horizontal icon size wanted. See Remarks.
cyIcon : [int] Type: int The vertical icon size wanted. See Remarks.
phicon : [intptr] Type: HICON* A pointer to the returned array of icon handles.
piconid : [var] Type: UINT* A pointer to a returned resource identifier for the icon that best fits the current display device.  The returned identifier is 0xFFFFFFFF if the identifier is not available for this format.  The returned identifier is 0 if the identifier cannot otherwise be obtained.
nIcons : [int] Type: UINT The number of icons to extract from the file. This parameter is only valid when extracting from .exe and .dll files.
flags : [int] Type: UINT Specifies flags that control this function.  These flags are the LR_* flags used by the LoadImage function.
%inst
Creates an array of handles to icons that are extracted from a
specified file. (Unicode)

[戻り値]
Type: UINT If the phicon parameter is NULL and this function
succeeds, then the return value is the number of icons in the file.
If the function fails then the return value is 0. If the phicon
parameter is not NULL and the function succeeds, then the return
value is the number of icons extracted. Otherwise, the return value
is 0xFFFFFFFF if the file is not found.

[備考]
This function extracts from executable (.exe), DLL (.dll), icon
(.ico), cursor (.cur), animated cursor (.ani), and bitmap (.bmp)
files. Extractions from Windows 3.x 16-bit executables (.exe or .dll)
are also supported. The cxIcon and cyIcon parameters specify the size
of the icons to extract. Two sizes can be extracted by putting the
first size in the LOWORD of the parameter and the second size in the
HIWORD. For example, MAKELONG(24, 48) for both the cxIcon and cyIcon
parameters would extract both 24 and 48 size icons. You must destroy
all icons extracted by PrivateExtractIcons by calling the DestroyIcon
function. This function was not included in the SDK headers and
libraries until Windows XP Service Pack 1 (SP1) and Windows Server
2003. If you do not have a header file and import library for this
function, you can call the function using LoadLibrary and
GetProcAddress.
> [!NOTE] > The winuser.h header defines PrivateExtractIcons as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
PtInRect
The PtInRect function determines whether the specified point lies within the specified rectangle.
%group
Win32 user32
%prm
lprc, pt
lprc : [var] A pointer to a RECT structure that contains the specified rectangle.
pt : [int] A POINT structure that contains the specified point.
%inst
The PtInRect function determines whether the specified point lies
within the specified rectangle.

[戻り値]
If the specified point lies within the rectangle, the return value is
nonzero. If the specified point does not lie within the rectangle,
the return value is zero.

[備考]
The rectangle must be normalized before PtInRect is called. That is,
lprc.right must be greater than lprc.left and lprc.bottom must be
greater than lprc.top. If the rectangle is not normalized, a point is
never considered inside of the rectangle. Because applications can
use rectangles for different purposes, the rectangle functions do not
use an explicit unit of measure. Instead, all rectangle coordinates
and dimensions are given in signed, logical values. The mapping mode
and the function in which the rectangle is used determine the units
of measure.


%index
QueryDisplayConfig
The QueryDisplayConfig function retrieves information about all possible display paths for all display devices, or views, in the current setting.
%group
Win32 user32
%prm
flags, numPathArrayElements, pathArray, numModeInfoArrayElements, modeInfoArray, currentTopologyId
flags : [int] 
numPathArrayElements : [var] Pointer to a variable that contains the number of elements in pPathInfoArray. This parameter cannot be NULL. If QueryDisplayConfig returns ERROR_SUCCESS, pNumPathInfoElements is updated with the number of valid entries in pPathInfoArray.
pathArray : [var] Pointer to a variable that contains an array of DISPLAYCONFIG_PATH_INFO elements. Each element in pPathInfoArray describes a single path from a source to a target. The source and target mode information indexes are only valid in combination with the pmodeInfoArray tables that are returned for the API at the same time. This parameter cannot be NULL. The pPathInfoArray is always returned in path priority order. For more information about path priority order, see Path Priority Order.
numModeInfoArrayElements : [var] Pointer to a variable that specifies the number in element of the mode information table. This parameter cannot be NULL. If QueryDisplayConfig returns ERROR_SUCCESS, pNumModeInfoArrayElements is updated with the number of valid entries in pModeInfoArray.
modeInfoArray : [var] Pointer to a variable that contains an array of DISPLAYCONFIG_MODE_INFO elements. This parameter cannot be NULL.
currentTopologyId : [var] Pointer to a variable that receives the identifier of the currently active topology in the CCD database. For a list of possible values, see the DISPLAYCONFIG_TOPOLOGY_ID enumerated type. The pCurrentTopologyId parameter is only set when the Flags parameter value is QDC_DATABASE_CURRENT. If the Flags parameter value is set to QDC_DATABASE_CURRENT, the pCurrentTopologyId parameter must not be NULL. If the Flags parameter value is not set to QDC_DATABASE_CURRENT, the pCurrentTopologyId parameter value must be NULL.
%inst
The QueryDisplayConfig function retrieves information about all
possible display paths for all display devices, or views, in the
current setting.

[戻り値]
The function returns one of the following return codes.
This doc was truncated.

[備考]
As the GetDisplayConfigBufferSizes function can only determine the
required array size at a particular moment in time, it is possible
that between calls to GetDisplayConfigBufferSizes and
QueryDisplayConfig the system configuration will change and the
provided array sizes will no longer be sufficient to store the new
path data. In this situation, QueryDisplayConfig fails with
ERROR_INSUFFICIENT_BUFFER, and the caller should call
GetDisplayConfigBufferSizes again to get the new array sizes. The
caller should then allocate the correct amount of memory.
QueryDisplayConfig returns paths in the path array that the
pPathInfoArray parameter specifies and the source and target modes in
the mode array that the pModeInfoArray parameter specifies.
QueryDisplayConfig always returns paths in path priority order. If
QDC_ALL_PATHS is set in the Flags parameter, QueryDisplayConfig
returns all the inactive paths after the active paths. Full path,
source mode, and target mode information is available for all active
paths. The ModeInfoIdx members in the DISPLAYCONFIG_PATH_SOURCE_INFO
and DISPLAYCONFIG_PATH_TARGET_INFO structures for the source and
target are set up for these active paths. For inactive paths,
returned source and target mode information is not available;
therefore, the target information in the path structure is set to
default values, and the source and target mode indexes are marked as
invalid. For database queries, if the current connect monitors have
an entry, QueryDisplayConfig returns full path, source mode, and
target mode information (same as for active paths). However, if the
database does not have a entry, QueryDisplayConfig returns just the
path information with the default target details (same as for
inactive paths). For an example of how source and target mode
information relates to path information, see Relationship of Mode
Information to Path Information. The caller can use
DisplayConfigGetDeviceInfo to obtain additional information about the
source or target device, for example, the monitor names and monitor
preferred mode and source device name. If a target is currently being
force projected, the statusFlags member of the
DISPLAYCONFIG_PATH_TARGET_INFO structure has one of the
DISPLAYCONFIG_TARGET_FORCED_XXX flags set. If the
QDC_DATABASE_CURRENT flag is set in the Flags parameter,
QueryDisplayConfig returns the topology identifier of the active
database topology in the variable that the pCurrentTopologyId
parameter points to. If the QDC_ALL_PATHS or QDC_ONLY_ACTIVE_PATHS
flag is set in the Flags parameter, the pCurrentTopologyId parameter
must be set to NULL; otherwise, QueryDisplayConfig returns
ERROR_INVALID_PARAMETER. If a caller calls QueryDisplayConfig with
the QDC_DATABASE_CURRENT flag set in the Flags parameter,
QueryDisplayConfig initializes the DISPLAYCONFIG_2DREGION structure
that is specified in the totalSize member of the
DISPLAYCONFIG_VIDEO_SIGNAL_INFO structure to zeros and does not
complete DISPLAYCONFIG_2DREGION. The DEVMODE structure that is
returned by the EnumDisplaySettings Win32 function (described in the
Windows SDK documentation) contains information that relates to both
the source and target modes. However, the CCD APIs explicitly
separate the source and target mode components.


%index
RealChildWindowFromPoint
Retrieves a handle to the child window at the specified point. The search is restricted to immediate child windows; grandchildren and deeper descendant windows are not searched.
%group
Win32 user32
%prm
hwndParent, ptParentClientCoords
hwndParent : [intptr] Type: HWND A handle to the window whose child is to be retrieved.
ptParentClientCoords : [int] Type: POINT A POINT structure that defines the client coordinates of the point to be checked.
%inst
Retrieves a handle to the child window at the specified point. The
search is restricted to immediate child windows; grandchildren and
deeper descendant windows are not searched.

[戻り値]
Type: HWND The return value is a handle to the child window that
contains the specified point.

[備考]
RealChildWindowFromPoint treats HTTRANSPARENT areas of a standard
control differently from other areas of the control; it returns the
child window behind a transparent part of a control. In contrast,
ChildWindowFromPoint treats HTTRANSPARENT areas of a control the same
as other areas. For example, if the point is in a transparent area of
a groupbox, RealChildWindowFromPoint returns the child window behind
a groupbox, whereas ChildWindowFromPoint returns the groupbox.
However, both APIs return a static field, even though it, too,
returns HTTRANSPARENT.


%index
RealGetWindowClassW
Retrieves a string that specifies the window type. (Unicode)
%group
Win32 user32
%prm
hwnd, ptszClassName, cchClassNameMax
hwnd : [intptr] Type: HWND A handle to the window whose type will be retrieved.
ptszClassName : [wstr] Type: LPTSTR A pointer to a string that receives the window type.
cchClassNameMax : [int] Type: UINT The length, in characters, of the buffer pointed to by the pszType parameter.
%inst
Retrieves a string that specifies the window type. (Unicode)

[戻り値]
Type: UINT If the function succeeds, the return value is the number
of characters copied to the specified buffer. If the function fails,
the return value is zero. To get extended error information, call
GetLastError.


%index
RedrawWindow
The RedrawWindow function updates the specified rectangle or region in a window's client area.
%group
Win32 user32
%prm
hWnd, lprcUpdate, hrgnUpdate, flags
hWnd : [intptr] A handle to the window to be redrawn. If this parameter is NULL, the desktop window is updated.
lprcUpdate : [var] A pointer to a RECT structure containing the coordinates, in device units, of the update rectangle. This parameter is ignored if the hrgnUpdate parameter identifies a region.
hrgnUpdate : [intptr] A handle to the update region. If both the hrgnUpdate and lprcUpdate parameters are NULL, the entire client area is added to the update region.
flags : [int] One or more redraw flags. This parameter can be used to invalidate or validate a window, control repainting, and control which windows are affected by RedrawWindow. The following flags are used to invalidate the window.
%inst
The RedrawWindow function updates the specified rectangle or region
in a window's client area.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
When RedrawWindow is used to invalidate part of the desktop window,
the desktop window does not receive a WM_PAINT message. To repaint
the desktop, an application uses the RDW_ERASE flag to generate a
WM_ERASEBKGND message.


%index
RegisterClassW
Registers a window class for subsequent use in calls to the CreateWindow or CreateWindowEx function. (RegisterClassW)
%group
Win32 user32
%prm
lpWndClass
lpWndClass : [var] Type: const WNDCLASS* A pointer to a WNDCLASS structure. You must fill the structure with the appropriate class attributes before passing it to the function.
%inst
Registers a window class for subsequent use in calls to the
CreateWindow or CreateWindowEx function. (RegisterClassW)

[戻り値]
Type: ATOM If the function succeeds, the return value is a class atom
that uniquely identifies the class being registered. This atom can
only be used by the CreateWindow, CreateWindowEx, GetClassInfo,
GetClassInfoEx, FindWindow, FindWindowEx, and UnregisterClass
functions and the IActiveIMMap::FilterClientWindows method. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
If you register the window class by using RegisterClassA, the
application tells the system that the windows of the created class
expect messages with text or character parameters to use the ANSI
character set; if you register it by using RegisterClassW, the
application requests that the system pass text parameters of messages
as Unicode. The IsWindowUnicode function enables applications to
query the nature of each window. For more information on ANSI and
Unicode functions, see Conventions for Function Prototypes. All
window classes that an application registers are unregistered when it
terminates. No window classes registered by a DLL are unregistered
when the DLL is unloaded. A DLL must explicitly unregister its
classes when it is unloaded.


%index
RegisterClassExW
Registers a window class for subsequent use in calls to the CreateWindow or CreateWindowEx function. (RegisterClassExW)
%group
Win32 user32
%prm
param0
param0 : [var] 
%inst
Registers a window class for subsequent use in calls to the
CreateWindow or CreateWindowEx function. (RegisterClassExW)

[戻り値]
Type: ATOM If the function succeeds, the return value is a class atom
that uniquely identifies the class being registered. This atom can
only be used by the CreateWindow, CreateWindowEx, GetClassInfo,
GetClassInfoEx, FindWindow, FindWindowEx, and UnregisterClass
functions and the IActiveIMMap::FilterClientWindows method. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
If you register the window class by using RegisterClassExA, the
application tells the system that the windows of the created class
expect messages with text or character parameters to use the ANSI
character set; if you register it by using RegisterClassExW, the
application requests that the system pass text parameters of messages
as Unicode. The IsWindowUnicode function enables applications to
query the nature of each window. For more information on ANSI and
Unicode functions, see Conventions for Function Prototypes. All
window classes that an application registers are unregistered when it
terminates. No window classes registered by a DLL are unregistered
when the DLL is unloaded. A DLL must explicitly unregister its
classes when it is unloaded.


%index
RegisterClipboardFormatW
Registers a new clipboard format. This format can then be used as a valid clipboard format. (Unicode)
%group
Win32 user32
%prm
lpszFormat
lpszFormat : [wstr] Type: LPCTSTR The name of the new format.
%inst
Registers a new clipboard format. This format can then be used as a
valid clipboard format. (Unicode)

[戻り値]
Type: UINT If the function succeeds, the return value identifies the
registered clipboard format. If the function fails, the return value
is zero. To get extended error information, call GetLastError.

[備考]
If a registered format with the specified name already exists, a new
format is not registered and the return value identifies the existing
format. This enables more than one application to copy and paste data
using the same registered clipboard format. Note that the format name
comparison is case-insensitive. Registered clipboard formats are
identified by values in the range 0xC000 through 0xFFFF. When
registered clipboard formats are placed on or retrieved from the
clipboard, they must be in the form of an HGLOBAL value.


%index
UnregisterDeviceNotification
Closes the specified device notification handle.
%group
Win32 user32
%prm
Handle
Handle : [int] Device notification handle returned by the RegisterDeviceNotification function.
%inst
Closes the specified device notification handle.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
RegisterDeviceNotificationW
Registers the device or type of device for which a window will receive notifications. (Unicode)
%group
Win32 user32
%prm
hRecipient, NotificationFilter, Flags
hRecipient : [intptr] A handle to the window or service that will receive device events for the devices specified in the NotificationFilter parameter. The same window handle can be used in multiple calls to RegisterDeviceNotification. Services can specify either a window handle or service status handle.
NotificationFilter : [intptr] A pointer to a block of data that specifies the type of device for which notifications should be sent. This block always begins with the DEV_BROADCAST_HDR structure. The data following this header is dependent on the value of the dbch_devicetype member, which can be DBT_DEVTYP_DEVICEINTERFACE or DBT_DEVTYP_HANDLE. For more information, see Remarks.
Flags : [int] 
%inst
Registers the device or type of device for which a window will
receive notifications. (Unicode)

[戻り値]
If the function succeeds, the return value is a device notification
handle. If the function fails, the return value is NULL. To get
extended error information, call GetLastError.

[備考]
Applications send event notifications using the
BroadcastSystemMessage function. Any application with a top-level
window can receive basic notifications by processing the
WM_DEVICECHANGE message. Applications can use the
RegisterDeviceNotification function to register to receive device
notifications. Services can use the RegisterDeviceNotification
function to register to receive device notifications. If a service
specifies a window handle in the hRecipient parameter, the
notifications are sent to the window procedure. If hRecipient is a
service status handle, SERVICE_CONTROL_DEVICEEVENT notifications are
sent to the service control handler. For more information about the
service control handler, see HandlerEx. Be sure to handle Plug and
Play device events as quickly as possible. Otherwise, the system may
become unresponsive. If your event handler is to perform an operation
that may block execution (such as I/O), it is best to start another
thread to perform the operation asynchronously. Device notification
handles returned by RegisterDeviceNotification must be closed by
calling the UnregisterDeviceNotification function when they are no
longer needed. The DBT_DEVICEARRIVAL and DBT_DEVICEREMOVECOMPLETE
events are automatically broadcast to all top-level windows for port
devices. Therefore, it is not necessary to call
RegisterDeviceNotification for ports, and the function fails if the
dbch_devicetype member is DBT_DEVTYP_PORT. Volume notifications are
also broadcast to top-level windows, so the function fails if
dbch_devicetype is DBT_DEVTYP_VOLUME. OEM-defined devices are not
used directly by the system, so the function fails if dbch_devicetype
is DBT_DEVTYP_OEM.


%index
RegisterHotKey
Defines a system-wide hot key.
%group
Win32 user32
%prm
hWnd, id, fsModifiers, vk
hWnd : [intptr] Type: HWND A handle to the window that will receive WM_HOTKEY messages generated by the hot key. If this parameter is NULL, WM_HOTKEY messages are posted to the message queue of the calling thread and must be processed in the message loop.
id : [int] Type: int The identifier of the hot key.  If the hWnd parameter is NULL, then the hot key is associated with the current thread rather than with a particular window. If a hot key already exists with the same hWnd and id parameters, see Remarks for the action taken.
fsModifiers : [int] Type: UINT The keys that must be pressed in combination with the key specified by the
vk : [int] Type: UINT The virtual-key code of the hot key. See Virtual Key Codes.
%inst
Defines a system-wide hot key.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
When a key is pressed, the system looks for a match against all hot
keys. Upon finding a match, the system posts the WM_HOTKEY message to
the message queue of the window with which the hot key is associated.
If the hot key is not associated with a window, then the WM_HOTKEY
message is posted to the thread associated with the hot key. This
function cannot associate a hot key with a window created by another
thread. RegisterHotKey fails if the keystrokes specified for the hot
key have already been registered by another hot key. If a hot key
already exists with the same hWnd and id parameters, it is maintained
along with the new hot key. The application must explicitly call
UnregisterHotKey to unregister the old hot key. Windows Server 2003:
If a hot key already exists with the same hWnd and id parameters, it
is replaced by the new hot key. The F12 key is reserved for use by
the debugger at all times, so it should not be registered as a hot
key. Even when you are not debugging an application, F12 is reserved
in case a kernel-mode debugger or a just-in-time debugger is
resident. An application must specify an id value in the range 0x0000
through 0xBFFF. A shared DLL must specify a value in the range 0xC000
through 0xFFFF (the range returned by the GlobalAddAtom function). To
avoid conflicts with hot-key identifiers defined by other shared
DLLs, a DLL should use the GlobalAddAtom function to obtain the
hot-key identifier.


%index
RegisterPointerDeviceNotifications
Registers a window to process the WM_POINTERDEVICECHANGE, WM_POINTERDEVICEINRANGE, and WM_POINTERDEVICEOUTOFRANGE pointer device notifications.
%group
Win32 user32
%prm
window, notifyRange
window : [intptr] The window that receives WM_POINTERDEVICECHANGE, WM_POINTERDEVICEINRANGE, and WM_POINTERDEVICEOUTOFRANGE notifications.
notifyRange : [int] If set to TRUE, process the WM_POINTERDEVICEINRANGE and WM_POINTERDEVICEOUTOFRANGE messages. If set to FALSE, these messages aren't processed.
%inst
Registers a window to process the WM_POINTERDEVICECHANGE,
WM_POINTERDEVICEINRANGE, and WM_POINTERDEVICEOUTOFRANGE pointer
device notifications.

[戻り値]
If this function succeeds, it returns TRUE. Otherwise, it returns
FALSE. To retrieve extended error information, call the GetLastError
function.


%index
RegisterPointerInputTarget
Allows the caller to register a target window to which all pointer input of the specified type is redirected.
%group
Win32 user32
%prm
hwnd, pointerType
hwnd : [intptr] The window to register as a global redirection target. Redirection can cause the foreground window to lose activation (focus). To avoid this, ensure the window is a message-only window or has the WS_EX_NOACTIVATE style set.
pointerType : [int] Type of pointer input to be redirected to the specified  window. This is any valid and supported value from the POINTER_INPUT_TYPE enumeration. Note that the generic PT_POINTER type and the PT_MOUSE type are not valid in this parameter.
%inst
Allows the caller to register a target window to which all pointer
input of the specified type is redirected.

[戻り値]
If the function succeeds, the return value is non-zero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
An application with the UI Access privilege can use this function to
register its own window to receive all input of the specified pointer
input type. Each desktop allows only one such global redirection
target window for each pointer input type at any given time. The
first window to successfully register remains in effect until the
window is unregistered or destroyed, at which point the role is
available to the next qualified caller. While the registration is in
effect, all input of the specified pointer type, whether from an
input device or injected by an application, is redirected to the
registered window. However, when the process that owns the registered
window injects input of the specified pointer type, such injected is
not redirected but is instead processed normally. An application that
wishes to register the same window as a global redirection target for
multiple pointer input types must call the RegisterPointerInputTarget
function multiple times, once for each pointer input type of
interest. If the calling thread does not have the UI Access
privilege, this function fails with the last error set to
ERROR_ACCESS_DENIED. If the specified pointer input type is not
valid, this function fails with the last error set to
ERROR_INVALID_PARAMETER. If the calling thread does not own the
specified window, this function fails with the last error set to
ERROR_ACCESS_DENIED. If the specified window’s desktop already has a
registered global redirection target for the specified pointer input
type, this function fails with the last error set to
ERROR_ACCESS_DENIED.


%index
RegisterPointerInputTargetEx
RegisterPointerInputTargetEx may be altered or unavailable. Instead, use RegisterPointerInputTarget.
%group
Win32 user32
%prm
hwnd, pointerType, fObserve
hwnd : [intptr] Not supported.
pointerType : [int] Not supported.
fObserve : [int] Not supported.
%inst
RegisterPointerInputTargetEx may be altered or unavailable. Instead,
use RegisterPointerInputTarget.

[戻り値]
Not supported.


%index
UnregisterPowerSettingNotification
Unregisters the power setting notification.
%group
Win32 user32
%prm
Handle
Handle : [intptr] The handle returned from the RegisterPowerSettingNotification function.
%inst
Unregisters the power setting notification.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
RegisterPowerSettingNotification
Registers the application to receive power setting notifications for the specific power setting event.
%group
Win32 user32
%prm
hRecipient, PowerSettingGuid, Flags
hRecipient : [intptr] Handle indicating where the power setting notifications are to be sent. For interactive applications, the Flags parameter should be zero, and the hRecipient parameter should be a window handle. For services, the Flags parameter should be one, and the hRecipient parameter should be a SERVICE_STATUS_HANDLE as returned from RegisterServiceCtrlHandlerEx.
PowerSettingGuid : [var] The GUID of the power setting for which notifications are to be sent. For more information see Registering for Power Events.
Flags : [int] This doc was truncated.
%inst
Registers the application to receive power setting notifications for
the specific power setting event.

[戻り値]
Returns a notification handle for unregistering for power
notifications. If the function fails, the return value is NULL. To
get extended error information, call GetLastError.


%index
RegisterRawInputDevices
Registers the devices that supply the raw input data.
%group
Win32 user32
%prm
pRawInputDevices, uiNumDevices, cbSize
pRawInputDevices : [var] Type: PCRAWINPUTDEVICE An array of RAWINPUTDEVICE structures that represent the devices that supply the raw input.
uiNumDevices : [int] Type: UINT The number of RAWINPUTDEVICE structures pointed to by pRawInputDevices.
cbSize : [int] Type: UINT The size, in bytes, of a RAWINPUTDEVICE structure.
%inst
Registers the devices that supply the raw input data.

[戻り値]
Type: BOOL TRUE if the function succeeds; otherwise, FALSE. If the
function fails, call GetLastError for more information.

[備考]
To receive WM_INPUT messages, an application must first register the
raw input devices using RegisterRawInputDevices. By default, an
application does not receive raw input. To receive
WM_INPUT_DEVICE_CHANGE messages, an application must specify the
RIDEV_DEVNOTIFY flag for each device class that is specified by the
usUsagePage and usUsage fields of the RAWINPUTDEVICE structure . By
default, an application does not receive WM_INPUT_DEVICE_CHANGE
notifications for raw input device arrival and removal. If a
RAWINPUTDEVICE structure has the RIDEV_REMOVE flag set and the
hwndTarget parameter is not set to NULL, then parameter validation
will fail. Only one window per raw input device class may be
registered to receive raw input within a process (the window passed
in the last call to RegisterRawInputDevices). Because of this,
RegisterRawInputDevices should not be used from a library, as it may
interfere with any raw input processing logic already present in
applications that load it.


%index
RegisterShellHookWindow
Registers a specified Shell window to receive certain messages for events or notifications that are useful to Shell applications.
%group
Win32 user32
%prm
hwnd
hwnd : [intptr] Type: HWND A handle to the window to register for Shell hook messages.
%inst
Registers a specified Shell window to receive certain messages for
events or notifications that are useful to Shell applications.

[戻り値]
Type: BOOL TRUE if the function succeeds; otherwise, FALSE.

[備考]
As with normal window messages, the second parameter of the window
procedure identifies the message as a WM_SHELLHOOKMESSAGE. However,
for these Shell hook messages, the message value is not a pre-defined
constant like other message IDs such as WM_COMMAND. The value must be
obtained dynamically using a call to RegisterWindowMessage as shown
here:
RegisterWindowMessage(TEXT("SHELLHOOK")); This precludes handling
these messages using a traditional switch statement which requires ID
values that are known at compile time. For handling Shell hook
messages, the normal practice is to code an If statement in the
default section of your switch statement and then handle the message
if the value of the message ID is the same as the value obtained from
the RegisterWindowMessage call. The following table describes the
wParam and lParam parameter values passed to the window procedure for
the Shell hook messages.
This doc was truncated.


%index
RegisterSuspendResumeNotification
Registers to receive notification when the system is suspended or resumed. Similar to PowerRegisterSuspendResumeNotification, but operates in user mode and can take a window handle.
%group
Win32 user32
%prm
hRecipient, Flags
hRecipient : [intptr] This parameter contains parameters for subscribing to a power notification or a window handle representing the subscribing process. If Flags is DEVICE_NOTIFY_CALLBACK, hRecipient is interpreted as a pointer to a DEVICE_NOTIFY_SUBSCRIBE_PARAMETERS structure. In this case, the callback function is DeviceNotifyCallbackRoutine. When the Callback function executes, the  Type parameter is set indicating the type of event that occurred. Possible values include PBT_APMSUSPEND, PBT_APMRESUMESUSPEND, and PBT_APMRESUMEAUTOMATIC - see  Power Management Events for more info. The Setting parameter is not used with suspend/resume notifications. If Flags is DEVICE_NOTIFY_WINDOW_HANDLE, hRecipient is a handle to the window to deliver events to.
Flags : [int] This parameter can be DEVICE_NOTIFY_WINDOW_HANDLE or DEVICE_NOTIFY_CALLBACK.
%inst
Registers to receive notification when the system is suspended or
resumed. Similar to PowerRegisterSuspendResumeNotification, but
operates in user mode and can take a window handle.

[戻り値]
A handle to the registration. Use this handle to unregister for
notifications. If the function fails, the return value is NULL. To
get extended error information call GetLastError.


%index
RegisterTouchHitTestingWindow
Registers a window to process the WM_TOUCHHITTESTING notification.
%group
Win32 user32
%prm
hwnd, value
hwnd : [intptr] The window that receives the WM_TOUCHHITTESTING  notification.
value : [int] 
%inst
Registers a window to process the WM_TOUCHHITTESTING notification.

[戻り値]
If this function succeeds, it returns TRUE. Otherwise, it returns
FALSE. To retrieve extended error information, call the GetLastError
function.


%index
RegisterTouchWindow
Registers a window as being touch-capable.
%group
Win32 user32
%prm
hwnd, ulFlags
hwnd : [intptr] The handle of the window being registered. The function fails with ERROR_ACCESS_DENIED if the calling thread does not own the specified window.
ulFlags : [int] 
%inst
Registers a window as being touch-capable.

[戻り値]
If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. To get extended
error information, use the GetLastError function.

[備考]
Note RegisterTouchWindow must be called on every window that will be
used for touch input. This means that if you have an application that
has multiple windows within it, RegisterTouchWindow must be called on
every window in that application that uses touch features. Also, an
application can call RegisterTouchWindow any number of times for the
same window if it desires to change the modifier flags. A window can
be marked as no longer requiring touch input using the
UnregisterTouchWindow function. If TWF_WANTPALM is enabled, packets
from touch input are not buffered and palm detection is not performed
before the packets are sent to your application. Enabling
TWF_WANTPALM is most useful if you want minimal latencies when
processing WM_TOUCH messages.


%index
RegisterWindowMessageW
Defines a new window message that is guaranteed to be unique throughout the system. The message value can be used when sending or posting messages. (Unicode)
%group
Win32 user32
%prm
lpString
lpString : [wstr] Type: LPCTSTR The message to be registered.
%inst
Defines a new window message that is guaranteed to be unique
throughout the system. The message value can be used when sending or
posting messages. (Unicode)

[戻り値]
Type: UINT If the message is successfully registered, the return
value is a message identifier in the range 0xC000 through 0xFFFF. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The RegisterWindowMessage function is typically used to register
messages for communicating between two cooperating applications. If
two different applications register the same message string, the
applications return the same message value. The message remains
registered until the session ends. Only use RegisterWindowMessage
when more than one application must process the same message. For
sending private messages within a window class, an application can
use any integer in the range WM_USER through 0x7FFF. (Messages in
this range are private to a window class, not to an application. For
example, predefined control classes such as BUTTON, EDIT, LISTBOX,
and COMBOBOX may use values in this range.)


%index
ReleaseCapture
Releases the mouse capture from a window in the current thread and restores normal mouse input processing.
%group
Win32 user32
%prm

%inst
Releases the mouse capture from a window in the current thread and
restores normal mouse input processing.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
An application calls this function after calling the SetCapture
function.


%index
ReleaseDC
The ReleaseDC function releases a device context (DC), freeing it for use by other applications. The effect of the ReleaseDC function depends on the type of DC. It frees only common and window DCs. It has no effect on class or private DCs.
%group
Win32 user32
%prm
hWnd, hDC
hWnd : [intptr] A handle to the window whose DC is to be released.
hDC : [intptr] A handle to the DC to be released.
%inst
The ReleaseDC function releases a device context (DC), freeing it for
use by other applications. The effect of the ReleaseDC function
depends on the type of DC. It frees only common and window DCs. It
has no effect on class or private DCs.

[戻り値]
The return value indicates whether the DC was released. If the DC was
released, the return value is 1. If the DC was not released, the
return value is zero.

[備考]
The application must call the ReleaseDC function for each call to the
GetWindowDC function and for each call to the GetDC function that
retrieves a common DC. An application cannot use the ReleaseDC
function to release a DC that was created by calling the CreateDC
function; instead, it must use the DeleteDC function. ReleaseDC must
be called from the same thread that called GetDC.


%index
RemoveClipboardFormatListener
Removes the given window from the system-maintained clipboard format listener list.
%group
Win32 user32
%prm
hwnd
hwnd : [intptr] Type: HWND A handle to the window to remove from the clipboard format listener list.
%inst
Removes the given window from the system-maintained clipboard format
listener list.

[戻り値]
Type: BOOL Returns TRUE if successful, FALSE otherwise. Call
GetLastError for additional details.

[備考]
When a window has been removed from the clipboard format listener
list, it will no longer receive WM_CLIPBOARDUPDATE messages.


%index
RemoveMenu
Deletes a menu item or detaches a submenu from the specified menu.
%group
Win32 user32
%prm
hMenu, uPosition, uFlags
hMenu : [intptr] Type: HMENU A handle to the menu to be changed.
uPosition : [int] Type: UINT The menu item to be deleted, as determined by the uFlags parameter.
uFlags : [int] Type: UINT
%inst
Deletes a menu item or detaches a submenu from the specified menu.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The application must call the DrawMenuBar function whenever a menu
changes, whether the menu is in a displayed window.


%index
RemovePropW
Removes an entry from the property list of the specified window. The specified character string identifies the entry to be removed. (Unicode)
%group
Win32 user32
%prm
hWnd, lpString
hWnd : [intptr] Type: HWND A handle to the window whose property list is to be changed.
lpString : [wstr] Type: LPCTSTR A null-terminated character string or an atom that identifies a string. If this parameter is an atom, it must have been created using the GlobalAddAtom function. The atom, a 16-bit value, must be placed in the low-order word of lpString; the high-order word must be zero.
%inst
Removes an entry from the property list of the specified window. The
specified character string identifies the entry to be removed.
(Unicode)

[戻り値]
Type: HANDLE The return value identifies the specified data. If the
data cannot be found in the specified property list, the return value
is NULL.

[備考]
The return value is the hData value that was passed to SetProp; it is
an application-defined value. Note, this function only destroys the
association between the data and the window. If appropriate, the
application must free the data handles associated with entries
removed from a property list. The application can remove only those
properties it has added. It must not remove properties added by other
applications or by the system itself. The RemoveProp function returns
the data handle associated with the string so that the application
can free the data associated with the handle. Starting with Windows
Vista, RemoveProp is subject to the restrictions of User Interface
Privilege Isolation (UIPI). A process can only call this function on
a window belonging to a process of lesser or equal integrity level.
When UIPI blocks property changes, GetLastError will return 5.


%index
ReplyMessage
Replies to a message sent from another thread by the SendMessage function.
%group
Win32 user32
%prm
lResult
lResult : [intptr] Type: LRESULT The result of the message processing. The possible values are based on the message sent.
%inst
Replies to a message sent from another thread by the SendMessage
function.

[戻り値]
Type: BOOL If the calling thread was processing a message sent from
another thread or process, the return value is nonzero. If the
calling thread was not processing a message sent from another thread
or process, the return value is zero.

[備考]
By calling this function, the window procedure that receives the
message allows the thread that called SendMessage to continue to run
as though the thread receiving the message had returned control. The
thread that calls the ReplyMessage function also continues to run. If
the message was not sent through SendMessage or if the message was
sent by the same thread, ReplyMessage has no effect.


%index
ReuseDDElParam
Enables an application to reuse a packed Dynamic Data Exchange (DDE)?lParam parameter, rather than allocating a new packed lParam. Using this function reduces reallocations for applications that pass packed DDE messages.
%group
Win32 user32
%prm
lParam, msgIn, msgOut, uiLo, uiHi
lParam : [intptr] Type: LPARAM The lParam parameter of the posted DDE message being reused.
msgIn : [int] Type: UINT The identifier of the received DDE message.
msgOut : [int] Type: UINT The identifier of the DDE message to be posted. The DDE message will reuse the packed lParam parameter.
uiLo : [int] Type: UINT_PTR The value to be packed into the low-order word of the reused lParam parameter.
uiHi : [int] Type: UINT_PTR The value to be packed into the high-order word of the reused lParam parameter.
%inst
Enables an application to reuse a packed Dynamic Data Exchange (DDE)
lParam parameter, rather than allocating a new packed lParam. Using
this function reduces reallocations for applications that pass packed
DDE messages.

[戻り値]
Type: LPARAM The return value is the new lParam value.

[備考]
The return value must be posted as the lParam parameter of a DDE
message; it must not be used for any other purpose. Once the return
value is posted, the posting application need not perform any action
to dispose of the lParam parameter. Use ReuseDDElParam instead of
FreeDDElParam if the lParam parameter will be reused in a responding
message. ReuseDDElParam returns the lParam appropriate for reuse.
This function allocates or frees lParam parameters as needed,
depending on the packing requirements of the incoming and outgoing
messages. This reduces reallocations in passing DDE messages.


%index
ScreenToClient
指定された画面上の点のスクリーン座標をクライアント領域座標に変換する。
%group
Win32 user32
%prm
hWnd, lpPoint
hWnd : [intptr] 変換に使用するクライアント領域を持つウィンドウへのハンドル。
lpPoint : [var] 変換するスクリーン座標を指定する POINT 構造体へのポインタ。
%inst
指定された画面上の点のスクリーン座標をクライアント領域座標に変換する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
hWnd で指定されるウィンドウと POINT 構造体で与えられるスクリーン座標を使ってクライアント座標を計算し、POINT
にクライアント座標を格納する。新しい座標は指定ウィンドウのクライアント領域の左上隅を基準とする。すべての座標はデバイス単位。ミラーリング状況(レイアウト変更時)では
ScreenToClient を使わず MapWindowPoints を使うこと。


%index
ScrollDC
The ScrollDC function scrolls a rectangle of bits horizontally and vertically.
%group
Win32 user32
%prm
hDC, dx, dy, lprcScroll, lprcClip, hrgnUpdate, lprcUpdate
hDC : [intptr] Type: HDC Handle to the device context that contains the bits to be scrolled.
dx : [int] Type: int Specifies the amount, in device units, of horizontal scrolling. This parameter must be a negative value to scroll to the left.
dy : [int] Type: int Specifies the amount, in device units, of vertical scrolling. This parameter must be a negative value to scroll up.
lprcScroll : [var] Type: const RECT* Pointer to a RECT structure containing the coordinates of the bits to be scrolled. The only bits affected by the scroll operation are bits in the intersection of this rectangle and the rectangle specified by lprcClip. If lprcScroll is NULL, the entire client area is used.
lprcClip : [var] Type: const RECT* Pointer to a RECT structure containing the coordinates of the clipping rectangle. The only bits that will be painted are the bits that remain inside this rectangle after the scroll operation has been completed. If lprcClip is NULL, the entire client area is used.
hrgnUpdate : [intptr] Type: HRGN Handle to the region uncovered by the scrolling process. ScrollDC defines this region; it is not necessarily a rectangle.
lprcUpdate : [var] Type: LPRECT Pointer to a RECT structure that receives the coordinates of the rectangle bounding the scrolling update region. This is the largest rectangular area that requires repainting. When the function returns, the values in the structure are in client coordinates, regardless of the mapping mode for the specified device context. This allows applications to use the update region in a call to the InvalidateRgn function, if required.
%inst
The ScrollDC function scrolls a rectangle of bits horizontally and
vertically.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
If the lprcUpdate parameter is NULL, the system does not compute the
update rectangle. If both the hrgnUpdate and lprcUpdate parameters
are NULL, the system does not compute the update region. If
hrgnUpdate is not NULL, the system proceeds as though it contains a
valid handle to the region uncovered by the scrolling process
(defined by ScrollDC). When you must scroll the entire client area of
a window, use the ScrollWindowEx function.


%index
ScrollWindow
The ScrollWindow function scrolls the contents of the specified window's client area.
%group
Win32 user32
%prm
hWnd, XAmount, YAmount, lpRect, lpClipRect
hWnd : [intptr] Type: HWND Handle to the window where the client area is to be scrolled.
XAmount : [int] Type: int Specifies the amount, in device units, of horizontal scrolling. If the window being scrolled has the CS_OWNDC or CS_CLASSDC style, then this parameter uses logical units rather than device units. This parameter must be a negative value to scroll the content of the window to the left.
YAmount : [int] Type: int Specifies the amount, in device units, of vertical scrolling. If the window being scrolled has the CS_OWNDC or CS_CLASSDC style, then this parameter uses logical units rather than device units. This parameter must be a negative value to scroll the content of the window up.
lpRect : [var] Type: const RECT* Pointer to the RECT structure specifying the portion of the client area to be scrolled. If this parameter is NULL, the entire client area is scrolled.
lpClipRect : [var] Type: const RECT* Pointer to the RECT structure containing the coordinates of the clipping rectangle. Only device bits within the clipping rectangle are affected. Bits scrolled from the outside of the rectangle to the inside are painted; bits scrolled from the inside of the rectangle to the outside are not painted.
%inst
The ScrollWindow function scrolls the contents of the specified
window's client area.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
If the caret is in the window being scrolled, ScrollWindow
automatically hides the caret to prevent it from being erased and
then restores the caret after the scrolling is finished. The caret
position is adjusted accordingly. The area uncovered by ScrollWindow
is not repainted, but it is combined into the window's update region.
The application eventually receives a WM_PAINT message notifying it
that the region must be repainted. To repaint the uncovered area at
the same time the scrolling is in action, call the UpdateWindow
function immediately after calling ScrollWindow. If the lpRect
parameter is NULL, the positions of any child windows in the window
are offset by the amount specified by the XAmount and YAmount
parameters; invalid (unpainted) areas in the window are also offset.
ScrollWindow is faster when lpRect is NULL. If lpRect is not NULL,
the positions of child windows are not changed and invalid areas in
the window are not offset. To prevent updating problems when lpRect
is not NULL, call UpdateWindow to repaint the window before calling
ScrollWindow.


%index
ScrollWindowEx
The ScrollWindowEx function scrolls the contents of the specified window's client area.
%group
Win32 user32
%prm
hWnd, dx, dy, prcScroll, prcClip, hrgnUpdate, prcUpdate, flags
hWnd : [intptr] Type: HWND Handle to the window where the client area is to be scrolled.
dx : [int] Type: int Specifies the amount, in device units, of horizontal scrolling. This parameter must be a negative value to scroll to the left.
dy : [int] Type: int Specifies the amount, in device units, of vertical scrolling. This parameter must be a negative value to scroll up.
prcScroll : [var] Type: const RECT* Pointer to a RECT structure that specifies the portion of the client area to be scrolled. If this parameter is NULL, the entire client area is scrolled.
prcClip : [var] Type: const RECT* Pointer to a RECT structure that contains the coordinates of the clipping rectangle. Only device bits within the clipping rectangle are affected. Bits scrolled from the outside of the rectangle to the inside are painted; bits scrolled from the inside of the rectangle to the outside are not painted. This parameter may be NULL.
hrgnUpdate : [intptr] Type: HRGN Handle to the region that is modified to hold the region invalidated by scrolling. This parameter may be NULL.
prcUpdate : [var] Type: LPRECT Pointer to a RECT structure that receives the boundaries of the rectangle invalidated by scrolling. This parameter may be NULL.
flags : [int] Type: UINT
%inst
The ScrollWindowEx function scrolls the contents of the specified
window's client area.

[戻り値]
Type: int If the function succeeds, the return value is SIMPLEREGION
(rectangular invalidated region), COMPLEXREGION (nonrectangular
invalidated region; overlapping rectangles), or NULLREGION (no
invalidated region). If the function fails, the return value is
ERROR. To get extended error information, call GetLastError.

[備考]
If the SW_INVALIDATE and SW_ERASE flags are not specified,
ScrollWindowEx does not invalidate the area that is scrolled from. If
either of these flags is set, ScrollWindowEx invalidates this area.
The area is not updated until the application calls the UpdateWindow
function, calls the RedrawWindow function (specifying the
RDW_UPDATENOW or RDW_ERASENOW flag), or retrieves the WM_PAINT
message from the application queue. If the window has the
WS_CLIPCHILDREN style, the returned areas specified by hrgnUpdate and
prcUpdate represent the total area of the scrolled window that must
be updated, including any areas in child windows that need updating.
If the SW_SCROLLCHILDREN flag is specified, the system does not
properly update the screen if part of a child window is scrolled. The
part of the scrolled child window that lies outside the source
rectangle is not erased and is not properly redrawn in its new
destination. To move child windows that do not lie completely within
the rectangle specified by prcScroll, use the DeferWindowPos
function. The cursor is repositioned if the SW_SCROLLCHILDREN flag is
set and the caret rectangle intersects the scroll rectangle. All
input and output coordinates (for prcScroll, prcClip, prcUpdate, and
hrgnUpdate) are determined as client coordinates, regardless of
whether the window has the CS_OWNDC or CS_CLASSDC class style. Use
the LPtoDP and DPtoLP functions to convert to and from logical
coordinates, if necessary.


%index
SendDlgItemMessageW
Sends a message to the specified control in a dialog box. (Unicode)
%group
Win32 user32
%prm
hDlg, nIDDlgItem, Msg, wParam, lParam
hDlg : [intptr] Type: HWND A handle to the dialog box that contains the control.
nIDDlgItem : [int] Type: int The identifier of the control that receives the message.
Msg : [int] Type: UINT The message to be sent. For lists of the system-provided messages, see System-Defined Messages.
wParam : [intptr] Type: WPARAM Additional message-specific information.
lParam : [intptr] Type: LPARAM Additional message-specific information.
%inst
Sends a message to the specified control in a dialog box. (Unicode)

[戻り値]
Type: LRESULT The return value specifies the result of the message
processing and depends on the message sent.

[備考]
The SendDlgItemMessage function does not return until the message has
been processed. Using SendDlgItemMessage is identical to retrieving a
handle to the specified control and calling the SendMessage function.


%index
SendIMEMessageExW
Specifies an action or processing for the Input Method Editor (IME) through a specified subfunction. (Unicode)
%group
Win32 user32
%prm
param0, param1
param0 : [intptr] 
param1 : [intptr] 
%inst
Specifies an action or processing for the Input Method Editor (IME)
through a specified subfunction. (Unicode)

[戻り値]
The result of processing of the subfunction. If the result is not
success, one of the following error codes is stored into the wParam
of the IMESTRUCT structure.
This doc was truncated.

[備考]
SendIMEMessageEx guarantees the action stipulated in the
specifications only for IMEs that support the WM_CONVERTREQUESTEX
message. For an IME that does not support WM_CONVERTREQUESTEX,
SendIMEMessageEx sends a WM_CONVERTREQUEST message to the IME and
returns the contents of the wParam member of the IMESTRUCT structure.
If the processing of the subfunction has not been completed normally,
these functions set IME_RS_ERROR into wParam.
> [!NOTE] > The ime.h header defines SendIMEMessageEx as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
SendInput
Synthesizes keystrokes, mouse motions, and button clicks.
%group
Win32 user32
%prm
cInputs, pInputs, cbSize
cInputs : [int] Type: UINT The number of structures in the pInputs array.
pInputs : [var] Type: LPINPUT An array of INPUT structures. Each structure represents an event to be inserted into the keyboard or mouse input stream.
cbSize : [int] Type: int The size, in bytes, of an INPUT structure. If cbSize is not the size of an INPUT structure, the function fails.
%inst
Synthesizes keystrokes, mouse motions, and button clicks.

[戻り値]
Type: UINT The function returns the number of events that it
successfully inserted into the keyboard or mouse input stream. If the
function returns zero, the input was already blocked by another
thread. To get extended error information, call GetLastError. This
function fails when it is blocked by UIPI. Note that neither
GetLastError nor the return value will indicate the failure was
caused by UIPI blocking.

[備考]
This function is subject to UIPI. Applications are permitted to
inject input only into applications that are at an equal or lesser
integrity level. The SendInput function inserts the events in the
INPUT structures serially into the keyboard or mouse input stream.
These events are not interspersed with other keyboard or mouse input
events inserted either by the user (with the keyboard or mouse) or by
calls to keybd_event, mouse_event, or other calls to SendInput. This
function does not reset the keyboard's current state. Any keys that
are already pressed when the function is called might interfere with
the events that this function generates. To avoid this problem, check
the keyboard's state with the GetAsyncKeyState function and correct
as necessary. Because the touch keyboard uses the surrogate macros
defined in winnls.h to send input to the system, a listener on the
keyboard event hook must decode input originating from the touch
keyboard. For more information, see Surrogates and Supplementary
Characters. An accessibility application can use SendInput to inject
keystrokes corresponding to application launch shortcut keys that are
handled by the shell. This functionality is not guaranteed to work
for other types of applications.


%index
SendMessageW
指定したメッセージをウィンドウ(群)に送信する。SendMessage は指定ウィンドウのウィンドウプロシージャを呼び出し、メッセージ処理が完了するまで戻らない。(SendMessageW)
%group
Win32 user32
%prm
hWnd, Msg, wParam, lParam
hWnd : [intptr] 型: HWND メッセージを受け取るウィンドウプロシージャのウィンドウへのハンドル。HWND_BROADCAST ((HWND)0xffff) を指定すると、メッセージはシステム内のすべてのトップレベルウィンドウ(無効または非表示の非所有ウィンドウ、オーバーラップウィンドウ、ポップアップウィンドウを含む)に送信されるが、子ウィンドウには送信されない。メッセージ送信は UIPI の対象。プロセスのスレッドは同等以下の整合性レベルのプロセスのスレッドメッセージキューにのみメッセージを送信できる。
Msg : [int] 型: UINT 送信するメッセージ。システム定義メッセージの一覧は System-Defined Messages を参照。
wParam : [intptr] 型: WPARAM メッセージ固有の追加情報。
lParam : [intptr] 型: LPARAM メッセージ固有の追加情報。
%inst
指定したメッセージをウィンドウ(群)に送信する。SendMessage
は指定ウィンドウのウィンドウプロシージャを呼び出し、メッセージ処理が完了するまで戻らない。(SendMessageW)

[戻り値]
型: LRESULT 戻り値はメッセージ処理の結果を表し、送信したメッセージに依存する。

[備考]
UIPI によりメッセージがブロックされた場合、GetLastError で取得される最終エラーは 5 (access denied)
に設定される。HWND_BROADCAST を使った通信を行うアプリケーションは、アプリケーション間通信用の一意なメッセージを得るために
RegisterWindowMessage を使うべきである。システムはシステムメッセージ(0～WM_USER-1
の範囲)についてのみマーシャリングを行う。他のメッセージ(WM_USER
以上)を別プロセスへ送るにはカスタムマーシャリングが必要。指定ウィンドウが呼び出しスレッドで作成されたものであればウィンドウプロシージャはサブルーチンとして直ちに呼ばれる。別スレッドで作成されたものであれば、システムはそのスレッドに切り替えて適切なウィンドウプロシージャを呼ぶ。スレッド間で送られたメッセージは受信スレッドがメッセージ取得コードを実行したときに初めて処理される。送信スレッドは受信スレッドがメッセージを処理するまでブロックされる。ただし送信スレッドは処理待ちの間、着信ノンキューメッセージを処理する。これを防ぐには
SMTO_BLOCK を指定した SendMessageTimeout を使う。ノンキューメッセージの詳細は Nonqueued
Messages を参照。アクセシビリティアプリケーションは SendMessage でシェルに WM_APPCOMMAND
メッセージを送信しアプリケーションを起動できる。これは他のタイプのアプリケーションで動作する保証はない。


%index
SendMessageCallbackW
Sends the specified message to a window or windows. (SendMessageCallbackW)
%group
Win32 user32
%prm
hWnd, Msg, wParam, lParam, lpResultCallBack, dwData
hWnd : [intptr] Type: HWND A handle to the window whose window procedure will receive the message. If this parameter is HWND_BROADCAST ((HWND)0xffff), the message is sent to all top-level windows in the system, including disabled or invisible unowned windows, overlapped windows, and pop-up windows; but the message is not sent to child windows.
Msg : [int] Type: UINT The message to be sent. For lists of the system-provided messages, see System-Defined Messages.
wParam : [intptr] Type: WPARAM Additional message-specific information.
lParam : [intptr] Type: LPARAM Additional message-specific information.
lpResultCallBack : [int] Type: SENDASYNCPROC A pointer to a callback function that the system calls after the window procedure processes the message. For more information, see SendAsyncProc.
dwData : [int] Type: ULONG_PTR An application-defined value to be sent to the callback function pointed to by the lpCallBack parameter.
%inst
Sends the specified message to a window or windows.
(SendMessageCallbackW)

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
If the target window belongs to the same thread as the caller, then
the window procedure is called synchronously, and the callback
function is called immediately after the window procedure returns. If
the target window belongs to a different thread from the caller, then
the callback function is called only when the thread that called
SendMessageCallback also calls GetMessage, PeekMessage, or
WaitMessage. If you send a message in the range below WM_USER to the
asynchronous message functions (PostMessage, SendNotifyMessage, and
SendMessageCallback), its message parameters cannot include pointers.
Otherwise, the operation will fail. The functions will return before
the receiving thread has had a chance to process the message and the
sender will free the memory before it is used. Applications that need
to communicate using HWND_BROADCAST should use the
RegisterWindowMessage function to obtain a unique message for
inter-application communication. The system only does marshalling for
system messages (those in the range 0 to (WM_USER-1)). To send other
messages (those >= WM_USER) to another process, you must do custom
marshalling.
> [!NOTE] > The winuser.h header defines SendMessageCallback as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
SendMessageTimeoutW
Sends the specified message to one or more windows. (Unicode)
%group
Win32 user32
%prm
hWnd, Msg, wParam, lParam, fuFlags, uTimeout, lpdwResult
hWnd : [intptr] Type: HWND A handle to the window whose window procedure will receive the message. If this parameter is HWND_BROADCAST ((HWND)0xffff), the message is sent to all top-level windows in the system, including disabled or invisible unowned windows. The function does not return until each window has timed out. Therefore, the total wait time can be up to the value of uTimeout multiplied by the number of top-level windows.
Msg : [int] Type: UINT The message to be sent. For lists of the system-provided messages, see System-Defined Messages.
wParam : [intptr] Type: WPARAM Any additional message-specific information.
lParam : [intptr] Type: LPARAM Any additional message-specific information.
fuFlags : [int] Type: UINT
uTimeout : [int] Type: UINT The duration of the time-out period, in milliseconds. If the message is a broadcast message, each window can use the full time-out period. For example, if you specify a five second time-out period and there are three top-level windows that fail to process the message, you could have up to a 15 second delay.
lpdwResult : [var] Type: PDWORD_PTR The result of the message processing. The value of this parameter depends on the message that is specified.
%inst
Sends the specified message to one or more windows. (Unicode)

[戻り値]
Type: LRESULT If the function succeeds, the return value is nonzero.
SendMessageTimeout does not provide information about individual
windows timing out if HWND_BROADCAST is used. If the function fails
or times out, the return value is 0. To get extended error
information, call GetLastError. If GetLastError returns
ERROR_TIMEOUT, then the function timed out. Windows 2000: If
GetLastError returns 0, then the function timed out.

[備考]
The function calls the window procedure for the specified window and,
if the specified window belongs to a different thread, does not
return until the window procedure has processed the message or the
specified time-out period has elapsed. If the window receiving the
message belongs to the same queue as the current thread, the window
procedure is called directly?the time-out value is ignored. This
function considers that a thread is not responding if it has not
called GetMessage or a similar function within five seconds. The
system only does marshalling for system messages (those in the range
0 to (WM_USER-1)). To send other messages (those >= WM_USER) to
another process, you must do custom marshalling.
> [!NOTE] > The winuser.h header defines SendMessageTimeout as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
SendNotifyMessageW
Sends the specified message to a window or windows. (SendNotifyMessageW)
%group
Win32 user32
%prm
hWnd, Msg, wParam, lParam
hWnd : [intptr] Type: HWND A handle to the window whose window procedure will receive the message. If this parameter is HWND_BROADCAST ((HWND)0xffff), the message is sent to all top-level windows in the system, including disabled or invisible unowned windows, overlapped windows, and pop-up windows; but the message is not sent to child windows.
Msg : [int] Type: UINT The message to be sent. For lists of the system-provided messages, see System-Defined Messages.
wParam : [intptr] Type: WPARAM Additional message-specific information.
lParam : [intptr] Type: LPARAM Additional message-specific information.
%inst
Sends the specified message to a window or windows.
(SendNotifyMessageW)

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
If you send a message in the range below WM_USER to the asynchronous
message functions (PostMessage, SendNotifyMessage, and
SendMessageCallback), its message parameters cannot include pointers.
Otherwise, the operation will fail. The functions will return before
the receiving thread has had a chance to process the message and the
sender will free the memory before it is used. Applications that need
to communicate using HWND_BROADCAST should use the
RegisterWindowMessage function to obtain a unique message for
inter-application communication. The system only does marshalling for
system messages (those in the range 0 to (WM_USER-1)). To send other
messages (those >= WM_USER) to another process, you must do custom
marshalling.
> [!NOTE] > The winuser.h header defines SendNotifyMessage as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
SetActiveWindow
Activates a window. The window must be attached to the calling thread's message queue.
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] Type: HWND A handle to the top-level window to be activated.
%inst
Activates a window. The window must be attached to the calling
thread's message queue.

[戻り値]
Type: HWND If the function succeeds, the return value is the handle
to the window that was previously active. If the function fails, the
return value is NULL. To get extended error information, call
GetLastError.

[備考]
The SetActiveWindow function activates a window, but not if the
application is in the background. The window will be brought into the
foreground (top of Z-Order) if its application is in the foreground
when the system activates the window. If the window identified by the
hWnd parameter was created by the calling thread, the active window
status of the calling thread is set to hWnd. Otherwise, the active
window status of the calling thread is set to NULL.


%index
SetCapture
Sets the mouse capture to the specified window belonging to the current thread.
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] Type: HWND A handle to the window in the current thread that is to capture the mouse.
%inst
Sets the mouse capture to the specified window belonging to the
current thread.

[戻り値]
Type: HWND The return value is a handle to the window that had
previously captured the mouse. If there is no such window, the return
value is NULL.

[備考]
Only the foreground window can capture the mouse. When a background
window attempts to do so, the window receives messages only for mouse
events that occur when the cursor hot spot is within the visible
portion of the window. Also, even if the foreground window has
captured the mouse, the user can still click another window, bringing
it to the foreground. When the window no longer requires all mouse
input, the thread that created the window should call the
ReleaseCapture function to release the mouse. This function cannot be
used to capture mouse input meant for another process. When the mouse
is captured, menu hotkeys and other keyboard accelerators do not
work.


%index
SetCaretBlinkTime
Sets the caret blink time to the specified number of milliseconds. The blink time is the elapsed time, in milliseconds, required to invert the caret's pixels.
%group
Win32 user32
%prm
uMSeconds
uMSeconds : [int] Type: UINT The new blink time, in milliseconds.
%inst
Sets the caret blink time to the specified number of milliseconds.
The blink time is the elapsed time, in milliseconds, required to
invert the caret's pixels.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The user can set the blink time using the Control Panel. Applications
should respect the setting that the user has chosen. The
SetCaretBlinkTime function should only be used by application that
allow the user to set the blink time, such as a Control Panel applet.
If you change the blink time, subsequently activated applications
will use the modified blink time, even if you restore the previous
blink time when you lose the keyboard focus or become inactive. This
is due to the multithreaded environment, where deactivation of your
application is not synchronized with the activation of another
application. This feature allows the system to activate another
application even if the current application is not responding.


%index
SetCaretPos
Moves the caret to the specified coordinates. If the window that owns the caret was created with the CS_OWNDC class style, then the specified coordinates are subject to the mapping mode of the device context associated with that window.
%group
Win32 user32
%prm
X, Y
X : [int] Type: int The new x-coordinate of the caret.
Y : [int] Type: int The new y-coordinate of the caret.
%inst
Moves the caret to the specified coordinates. If the window that owns
the caret was created with the CS_OWNDC class style, then the
specified coordinates are subject to the mapping mode of the device
context associated with that window.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
SetCaretPos moves the caret whether the caret is hidden. The system
provides one caret per queue. A window should create a caret only
when it has the keyboard focus or is active. The window should
destroy the caret before losing the keyboard focus or becoming
inactive. A window can set the caret position only if it owns the
caret. DPI Virtualization This API does not participate in DPI
virtualization. The provided position is interpreted as logical
coordinates in terms of the window associated with the caret. The
calling thread is not taken into consideration.


%index
SetClassLongW
Replaces the specified 32-bit (long) value at the specified offset into the extra class memory or the WNDCLASSEX structure for the class to which the specified window belongs. (Unicode)
%group
Win32 user32
%prm
hWnd, nIndex, dwNewLong
hWnd : [intptr] Type: HWND A handle to the window and, indirectly, the class to which the window belongs.
nIndex : [int] Type: int
dwNewLong : [int] Type: LONG The replacement value.
%inst
Replaces the specified 32-bit (long) value at the specified offset
into the extra class memory or the WNDCLASSEX structure for the class
to which the specified window belongs. (Unicode)

[戻り値]
Type: DWORD If the function succeeds, the return value is the
previous value of the specified 32-bit integer. If the value was not
previously set, the return value is zero. If the function fails, the
return value is zero. To get extended error information, call
GetLastError.

[備考]
If you use the SetClassLong function and the GCL_WNDPROC index to
replace the window procedure, the window procedure must conform to
the guidelines specified in the description of the WindowProc
callback function. Calling SetClassLong with the GCL_WNDPROC index
creates a subclass of the window class that affects all windows
subsequently created with the class. An application can subclass a
system class, but should not subclass a window class created by
another process. Reserve extra class memory by specifying a nonzero
value in the cbClsExtra member of the WNDCLASSEX structure used with
the RegisterClassEx function. Use the SetClassLong function with
care. For example, it is possible to change the background color for
a class by using SetClassLong, but this change does not immediately
repaint all windows belonging to the class.


%index
SetClassWord
Replaces the 16-bit (WORD) value at the specified offset into the extra class memory for the window class to which the specified window belongs.
%group
Win32 user32
%prm
hWnd, nIndex, wNewWord
hWnd : [intptr] Type: HWND A handle to the window and, indirectly, the class to which the window belongs.
nIndex : [int] Type: int The zero-based byte offset of the value to be replaced. Valid values are in the range zero through the number of bytes of class memory minus two; for example, if you specified 10 or more bytes of extra class memory, a value of 8 would be an index to the fifth 16-bit integer.
wNewWord : [int] Type: WORD The replacement value.
%inst
Replaces the 16-bit (WORD) value at the specified offset into the
extra class memory for the window class to which the specified window
belongs.

[戻り値]
Type: WORD If the function succeeds, the return value is the previous
value of the specified 16-bit integer. If the value was not
previously set, the return value is zero. If the function fails, the
return value is zero. To get extended error information, call
GetLastError.

[備考]
Reserve extra class memory by specifying a nonzero value in the
cbClsExtra member of the WNDCLASS structure used with the
RegisterClass function.


%index
SetClipboardData
Places data on the clipboard in a specified clipboard format.
%group
Win32 user32
%prm
uFormat, hMem
uFormat : [int] Type: UINT The clipboard format. This parameter can be a registered format or any of the standard clipboard formats. For more information, see Standard Clipboard Formats and Registered Clipboard Formats.
hMem : [intptr] Type: HANDLE A handle to the data in the specified format. This parameter can be NULL, indicating that the window provides data in the specified clipboard format (renders the format) upon request; this is known as [delayed rendering](/windows/win32/dataxchg/clipboard-operations#delayed-rendering). If a window delays rendering, it must process the [WM_RENDERFORMAT](/windows/win32/dataxchg/wm-renderformat) and [WM_RENDERALLFORMATS](/windows/win32/dataxchg/wm-renderallformats) messages. If SetClipboardData succeeds, the system owns the object identified by the hMem parameter. The application may not write to or free the data once ownership has been transferred to the system, but it can lock and read from the data until the CloseClipboard function is called. (The memory must be unlocked before the Clipboard is closed.) If the hMem parameter identifies a memory object, the object must have been allocated using the function with the GMEM_MOVEABLE flag.
%inst
Places data on the clipboard in a specified clipboard format.

[戻り値]
Type: HANDLE If the function succeeds, the return value is the handle
to the data. If the function fails, the return value is NULL. To get
extended error information, call GetLastError.

[備考]
Windows 8: Bitmaps to be shared with Windows Store app apps must be
in the CF_BITMAP format (device-dependent bitmap). If an application
calls SetClipboardData in response to WM_RENDERFORMAT or
WM_RENDERALLFORMATS, the application should not use the handle after
SetClipboardData has been called. If an application calls
OpenClipboard with hwnd set to NULL, EmptyClipboard sets the
clipboard owner to NULL; this causes SetClipboardData to fail. The
system performs implicit data format conversions between certain
clipboard formats when an application calls the GetClipboardData
function. For example, if the CF_OEMTEXT format is on the clipboard,
a window can retrieve data in the CF_TEXT format. The format on the
clipboard is converted to the requested format on demand. For more
information, see Synthesized Clipboard Formats.


%index
SetClipboardViewer
Adds the specified window to the chain of clipboard viewers. Clipboard viewer windows receive a WM_DRAWCLIPBOARD message whenever the content of the clipboard changes. This function is used for backward compatibility with earlier versions of Windows.
%group
Win32 user32
%prm
hWndNewViewer
hWndNewViewer : [intptr] Type: HWND A handle to the window to be added to the clipboard chain.
%inst
Adds the specified window to the chain of clipboard viewers.
Clipboard viewer windows receive a WM_DRAWCLIPBOARD message whenever
the content of the clipboard changes. This function is used for
backward compatibility with earlier versions of Windows.

[戻り値]
Type: HWND If the function succeeds, the return value identifies the
next window in the clipboard viewer chain. If an error occurs or
there are no other windows in the clipboard viewer chain, the return
value is NULL. To get extended error information, call GetLastError.

[備考]
The windows that are part of the clipboard viewer chain, called
clipboard viewer windows, must process the clipboard messages
WM_CHANGECBCHAIN and WM_DRAWCLIPBOARD. Each clipboard viewer window
calls the SendMessage function to pass these messages to the next
window in the clipboard viewer chain. A clipboard viewer window must
eventually remove itself from the clipboard viewer chain by calling
the ChangeClipboardChain function ? for example, in response to the
WM_DESTROY message. The SetClipboardViewer function exists to provide
backward compatibility with earlier versions of Windows. The
clipboard viewer chain can be broken by an application that fails to
handle the clipboard chain messages properly. New applications should
use more robust techniques such as the clipboard sequence number or
the registration of a clipboard format listener. For further details
on these alternatives techniques, see Monitoring Clipboard Contents.


%index
SetCoalescableTimer
Creates a timer with the specified time-out value and coalescing tolerance delay.
%group
Win32 user32
%prm
hWnd, nIDEvent, uElapse, lpTimerFunc, uToleranceDelay
hWnd : [intptr] Type: HWND A handle to the window to be associated with the timer. This window must be owned by the calling thread. If a NULL value for hWnd is passed in along with an nIDEvent of an existing timer, that timer will be replaced in the same way that an existing non-NULL hWnd timer will be.
nIDEvent : [int] Type: UINT_PTR A timer identifier. If the hWnd parameter is NULL, and the nIDEvent does not match an existing timer, then the nIDEvent is ignored and a new timer ID is generated. If the hWnd parameter is not NULL and the window specified by hWnd already has a timer with the value nIDEvent, then the existing timer is replaced by the new timer. When SetCoalescableTimer replaces a timer, the timer is reset. Therefore, a message will be sent after the current time-out value elapses, but the previously set time-out value is ignored. If the call is not intended to replace an existing timer, nIDEvent should be 0 if the hWnd is NULL.
uElapse : [int] Type: UINT The time-out value, in milliseconds. If uElapse is less than USER_TIMER_MINIMUM (0x0000000A), the timeout is set to USER_TIMER_MINIMUM. If uElapse is greater than USER_TIMER_MAXIMUM (0x7FFFFFFF), the timeout is set to USER_TIMER_MAXIMUM. If the sum of uElapse and uToleranceDelay exceeds USER_TIMER_MAXIMUM, an ERROR_INVALID_PARAMETER exception occurs.
lpTimerFunc : [int] Type: TIMERPROC A pointer to the function to be notified when the time-out value elapses. For more information about the function, see TimerProc. If lpTimerFunc is NULL, the system posts a WM_TIMER message to the application queue. The hwnd member of the message's MSG structure contains the value of the hWnd parameter.
uToleranceDelay : [int] Type: ULONG
%inst
Creates a timer with the specified time-out value and coalescing
tolerance delay.

[戻り値]
Type: UINT_PTR If the function succeeds and the hWnd parameter is
NULL, the return value is an integer identifying the new timer. An
application can pass this value to the KillTimer function to destroy
the timer. If the function succeeds and the hWnd parameter is not
NULL, then the return value is a nonzero integer. An application can
pass the value of the nIDEvent parameter to the KillTimer function to
destroy the timer. If the function fails to create a timer, the
return value is zero. To get extended error information, call
GetLastError.

[備考]
An application can process WM_TIMER messages by including a WM_TIMER
case statement in the window procedure or by specifying a TimerProc
callback function when creating the timer. When you specify a
TimerProc callback function, the default window procedure calls the
callback function when it processes WM_TIMER. Therefore, you need to
dispatch messages in the calling thread, even when you use TimerProc
instead of processing WM_TIMER. The wParam parameter of the WM_TIMER
message contains the value of the nIDEvent parameter. The timer
identifier, nIDEvent, is specific to the associated window. Another
window can have its own timer which has the same identifier as a
timer owned by another window. The timers are distinct.
SetTimer can reuse timer IDs in the case where hWnd is NULL.
When uToleranceDelay is set to 0, the system default timer coalescing
is used and SetCoalescableTimer behaves the same as SetTimer. Before
using **SetCoalescableTimer** or other timer-related functions, it is
recommended to set the **UOI_TIMERPROC_EXCEPTION_SUPPRESSION** flag
to **false** through the **SetUserObjectInformationW** function,
otherwise the application could behave unpredictably and could be
vulnerable to security exploits. For more info, see
SetUserObjectInformationW.


%index
SetCursor
カーソルの形状を設定する。
%group
Win32 user32
%prm
hCursor
hCursor : [intptr] 型: HCURSOR カーソルへのハンドル。CreateCursor、CreateIconIndirect で作成されるか、LoadCursor、LoadImage でロードされたものでなければならない。NULL の場合、カーソルは画面から削除される。
%inst
カーソルの形状を設定する。

[戻り値]
型: HCURSOR 戻り値は以前のカーソルへのハンドル(存在した場合)。なかった場合は NULL。

[備考]

新しいカーソルが以前のカーソルと異なる場合のみカーソルが設定される。カーソルは共有リソースであり、クライアント領域内にあるときまたはマウス入力をキャプチャしているときにのみ設定すべきである。アプリケーションがカーソルを設定する場合、指定されたウィンドウクラスのクラスカーソルを
NULL にしておく必要がある(そうでないとマウス移動時にクラスカーソルが復元される)。内部カーソル表示カウントが 0
未満の場合、カーソルは画面に表示されない。


%index
SetCursorPos
カーソルを指定したスクリーン座標に移動する。
%group
Win32 user32
%prm
X, Y
X : [int] 型: int カーソルの新しい x 座標(スクリーン座標)。
Y : [int] 型: int カーソルの新しい y 座標(スクリーン座標)。
%inst
カーソルを指定したスクリーン座標に移動する。

[戻り値]
型: BOOL 成功した場合は 0 以外、失敗した場合は 0 を返す。拡張エラー情報を得るには GetLastError を呼び出す。

[備考]

カーソルは共有リソースである。ウィンドウはカーソルが自身のクライアント領域にあるときのみカーソルを移動すべきである。呼び出し元プロセスはウィンドウステーションに対する
WINSTA_WRITEATTRIBUTES アクセス権を持っている必要がある。SetCursorPos
呼び出し時、入力デスクトップがカレントデスクトップでなければならない。カレントデスクトップが入力デスクトップかどうかを判定するには
OpenInputDesktop を呼ぶ。そうでなければ、OpenInputDesktop が返す HDESK を指定して
SetThreadDesktop を呼び、そのデスクトップへ切り替える。


%index
SetDebugErrorLevel
(no summary)
%group
Win32 user32
%prm
dwLevel
dwLevel : [int] 
%inst



%index
SetDialogControlDpiChangeBehavior
Overrides the default per-monitor DPI scaling behavior of a child window in a dialog.
%group
Win32 user32
%prm
hWnd, mask, values
hWnd : [intptr] A handle for the window whose behavior will be modified.
mask : [int] A mask specifying the subset of flags to be changed.
values : [int] The desired value to be set for the specified subset of flags.
%inst
Overrides the default per-monitor DPI scaling behavior of a child
window in a dialog.

[戻り値]
This function returns TRUE if the operation was successful, and FALSE
otherwise. To get extended error information, call GetLastError.
Possible errors are ERROR_INVALID_HANDLE if passed an invalid HWND,
and ERROR_ACCESS_DENIED if the windows belongs to another process.

[備考]
The behaviors are specified as values from the
DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS enum. This function follows the
typical two-parameter approach to setting flags, where a mask
specifies the subset of the flags to be changed. It is valid to set
these behaviors on any window. It does not matter if the window is
currently a child of a dialog at the point in time that
SetDialogControlDpiChangeBehavior is called. The behaviors are
retained and will take effect only when the window is an immediate
child of a dialog that has per-monitor DPI scaling enabled. This API
influences individual controls within dialogs. The dialog-wide
per-monitor DPI scaling behavior is controlled by
SetDialogDpiChangeBehavior.


%index
SetDialogDpiChangeBehavior
Dialogs in Per-Monitor v2 contexts are automatically DPI scaled. This method lets you customize their DPI change behavior.
%group
Win32 user32
%prm
hDlg, mask, values
hDlg : [intptr] A handle for the dialog whose behavior will be modified.
mask : [int] A mask specifying the subset of flags to be changed.
values : [int] The desired value to be set for the specified subset of flags.
%inst
Dialogs in Per-Monitor v2 contexts are automatically DPI scaled. This
method lets you customize their DPI change behavior.

[戻り値]
This function returns TRUE if the operation was successful, and FALSE
otherwise. To get extended error information, call GetLastError.
Possible errors are ERROR_INVALID_HANDLE if passed an invalid dialog
HWND, and ERROR_ACCESS_DENIED if the dialog belongs to another
process.

[備考]
For extensibility, DIALOG_DPI_CHANGE_BEHAVIORS was modeled as a set
of bit-flags representing separate behaviors. This function follows
the typical two-parameter approach to setting flags, where a mask
specifies the subset of the flags to be changed. It is not an error
to call this API outside of Per Monitor v2 contexts, though the flags
will have no effect on the behavior of the specified dialog until the
context is changed to Per Monitor v2.


%index
SetDisplayAutoRotationPreferences
Sets the screen auto-rotation preferences for the current process.
%group
Win32 user32
%prm
orientation
orientation : [int] Pointer to a location in memory with the screen orientation preferences to set for the calling process.
%inst
Sets the screen auto-rotation preferences for the current process.

[戻り値]
TRUE if the method succeeds, otherwise FALSE. See
GetDisplayAutoRotationPreferences for an example of using this
function.


%index
SetDisplayConfig
The SetDisplayConfig function modifies the display topology, source, and target modes by exclusively enabling the specified paths in the current session.
%group
Win32 user32
%prm
numPathArrayElements, pathArray, numModeInfoArrayElements, modeInfoArray, flags
numPathArrayElements : [int] Number of elements in pathArray.
pathArray : [var] Array of all display paths that are to be set. Only the paths within this array that have the DISPLAYCONFIG_PATH_ACTIVE flag set in the flags member of DISPLAYCONFIG_PATH_INFO are set. This parameter can be NULL. The order in which active paths appear in this array determines the path priority. For more information about path priority order, see Path Priority Order.
numModeInfoArrayElements : [int] Number of elements in modeInfoArray.
modeInfoArray : [var] Array of display source and target mode information (DISPLAYCONFIG_MODE_INFO) that is referenced by the modeInfoIdx member of DISPLAYCONFIG_PATH_SOURCE_INFO and DISPLAYCONFIG_PATH_TARGET_INFO element of path information from pathArray. This parameter can be NULL.
flags : [int] 
%inst
The SetDisplayConfig function modifies the display topology, source,
and target modes by exclusively enabling the specified paths in the
current session.

[戻り値]
The function returns one of the following return codes.
This doc was truncated.

[備考]
The SetDisplayConfig function takes the active display paths with any
specified source and target mode information and uses best mode logic
to generate any missing source and target mode information. This
function then sets the complete display path. The ModeInfoIdx members
in the DISPLAYCONFIG_PATH_SOURCE_INFO and
DISPLAYCONFIG_PATH_TARGET_INFO structures are used to indicate
whether source and target mode are supplied for a given active path.
If the index value is DISPLAYCONFIG_PATH_MODE_IDX_INVALID for either,
this indicates the mode information is not being specified. It is
valid for the path plus source mode or the path plus source and
target mode information to be specified for a given path. However, it
is not valid for the path plus target mode to be specified without
the source mode. The source and target modes for each source and
target identifiers can only appear in the modeInfoArray array once.
For example, a source mode for source identifier S1 can only appear
in the table once; if multiple paths reference the same source, they
have to use the same ModeInfoIdx. The expectation is that most
callers use QueryDisplayConfig to get the current configuration along
with other valid possibilities and then use SetDisplayConfig to test
and set the configuration. The order in which the active paths appear
in the PathArray array determines the path priority. By default,
SetDisplayConfig never changes any supplied path, source mode, or
target mode information. If best mode logic cannot find a solution
without changing the specified display path information,
SetDisplayConfig fails with ERROR_BAD_CONFIGURATION. In this case,
the caller should specify the SDC_ALLOW_CHANGES flag to allow the
function to tweak some of the specified source and mode details to
allow the display path change to be successful. If the specified or
calculated source and target modes have the same dimensions,
SetDisplayConfig automatically sets the path scaling to
DISPLAYCONFIG_PPR_IDENTITY before setting the display path and saving
it in the database. For information about how SetDisplayConfig
handles scaling, see Scaling the Desktop Image. When the caller
specifies the SDC_USE_SUPPLIED_DISPLAY_CONFIG flag to set a clone
path and if any source mode indexes are invalid in the path array,
SetDisplayConfig determines that all of the source mode indexes from
that source are invalid. SetDisplayConfig uses the best mode logic to
determine the source mode information. Except for the
SDC_TOPOLOGY_SUPPLIED flag (for more information about
SDC_TOPOLOGY_SUPPLIED, see the following paragraph), the
SDC_TOPOLOGY_XXX flags set last display path settings, including the
source and target mode information for that topology type. For
information about valid SDC_TOPOLOGY_XXX flag combinations, see the
Flags parameter description. The pathArray and modeInfoArray
parameters must be NULL, and their associated sizes must be zero. For
example, if SDC_TOPOLOGY_CLONE and SDC_TOPOLOGY_EXTEND are set, this
function uses the most recent clone or extend display path
configuration. If a single topology type is requested, the last
configuration of that type is used. If that topology had never been
set before, SetDisplayConfig uses the best topology logic to find the
best topology, and then best mode logic to find the best source and
target mode to use. If a combination of the topology flags had been
set and none of them had database entries, the following priority is
used. For laptops: clone, extend, internal, and then external; for
desktops the priority is extend and then clone. The caller can
specify the SDC_TOPOLOGY_SUPPLIED flag to indicate that it sets just
the path information (topology) and requests that SetDisplayConfig
obtains and then uses the source and target mode information from the
persistence database. If the active paths that the caller supplies do
not have an entry in the persistence database, SetDisplayConfig
fails. In this case, if the caller calls SetDisplayConfig again with
the same path data but with the SDC_USE_SUPPLIED_DISPLAY_CONFIG flag
set, SetDisplayConfig uses best mode logic to create the source and
target mode information. When the caller specifies
SDC_TOPOLOGY_SUPPLIED, the caller must set the
numModeInfoArrayElements parameter to zero and the modeInfoArray
parameter to NULL; however, the caller must set the pathArray and
numPathArrayElements parameters for the path information that the
caller requires. The caller must mark all the source and target mode
indexes as invalid (DISPLAYCONFIG_PATH_MODE_IDX_INVALID) in this path
data. The following table provides some common scenarios where
SetDisplayConfig is called along with the flag combinations that the
caller passes to the Flags parameter to achieve the scenarios.
This doc was truncated.


%index
SetDlgItemInt
Sets the text of a control in a dialog box to the string representation of a specified integer value.
%group
Win32 user32
%prm
hDlg, nIDDlgItem, uValue, bSigned
hDlg : [intptr] Type: HWND A handle to the dialog box that contains the control.
nIDDlgItem : [int] Type: int The control to be changed.
uValue : [int] Type: UINT The integer value used to generate the item text.
bSigned : [int] Type: BOOL Indicates whether the uValue parameter is signed or unsigned. If this parameter is TRUE, uValue is signed. If this parameter is TRUE and uValue is less than zero, a minus sign is placed before the first digit in the string. If this parameter is FALSE, uValue is unsigned.
%inst
Sets the text of a control in a dialog box to the string
representation of a specified integer value.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
To set the new text, this function sends a WM_SETTEXT message to the
specified control.


%index
SetDlgItemTextW
Sets the title or text of a control in a dialog box. (Unicode)
%group
Win32 user32
%prm
hDlg, nIDDlgItem, lpString
hDlg : [intptr] Type: HWND A handle to the dialog box that contains the control.
nIDDlgItem : [int] Type: int The control with a title or text to be set.
lpString : [wstr] Type: LPCTSTR The text to be copied to the control.
%inst
Sets the title or text of a control in a dialog box. (Unicode)

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The SetDlgItemText function sends a WM_SETTEXT message to the
specified control.


%index
SetDoubleClickTime
Sets the double-click time for the mouse.
%group
Win32 user32
%prm
param0
param0 : [int] 
%inst
Sets the double-click time for the mouse.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The SetDoubleClickTime function alters the double-click time for all
windows in the system.


%index
SetFocus
Sets the keyboard focus to the specified window. The window must be attached to the calling thread's message queue.
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] Type: **HWND** A handle to the window that will receive the keyboard input. If this parameter is NULL, keystrokes are ignored.
%inst
Sets the keyboard focus to the specified window. The window must be
attached to the calling thread's message queue.

[戻り値]
Type: **HWND** If the function succeeds, the return value is the
handle to the window that previously had the keyboard focus. If the
*hWnd* parameter is invalid or the window is not attached to the
calling thread's message queue, the return value is NULL. To get
extended error information, call [GetLastError
function](../errhandlingapi/nf-errhandlingapi-getlasterror.md).
Extended error ERROR_INVALID_PARAMETER (0x57) means that window is in
disabled state.

[備考]
This function sends a
[WM_KILLFOCUS](/windows/desktop/inputdev/wm-killfocus) message to the
window that loses the keyboard focus and a
[WM_SETFOCUS](/windows/desktop/inputdev/wm-setfocus) message to the
window that receives the keyboard focus. It also activates either the
window that receives the focus or the parent of the window that
receives the focus. If a window is active but does not have the
focus, any key pressed produces the
[WM_SYSCHAR](/windows/desktop/menurc/wm-syschar),
[WM_SYSKEYDOWN](/windows/desktop/inputdev/wm-syskeydown), or
[WM_SYSKEYUP](/windows/desktop/inputdev/wm-syskeyup) message. If the
VK_MENU key is also pressed, bit 30 of the *lParam* parameter of the
message is set. Otherwise, the messages produced do not have this bit
set. By using the [AttachThreadInput
function](nf-winuser-attachthreadinput.md), a thread can attach its
input processing to another thread. This allows a thread to call
SetFocus to set the keyboard focus to a window attached to another
thread's message queue.


%index
SetForegroundWindow
指定されたウィンドウを作成したスレッドをフォアグラウンドにし、ウィンドウをアクティブ化する。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND アクティブ化してフォアグラウンドに持ってくるウィンドウへのハンドル。
%inst
指定されたウィンドウを作成したスレッドをフォアグラウンドにし、ウィンドウをアクティブ化する。

[戻り値]
型: BOOL ウィンドウがフォアグラウンドになった場合は 0 以外、そうでない場合は 0。

[備考]
システムはフォアグラウンドウィンドウを設定できるプロセスを制限する。SetForegroundWindow
を呼び出してフォアグラウンドウィンドウを設定できるのは、呼び出し元プロセスがデスクトップアプリケーション(UWP や Windows
Store アプリではない)、LockSetForegroundWindow
で呼び出しが無効化されていない、フォアグラウンドロックタイムアウト経過済み、アクティブなメニューがない、かつ以下のいずれかを満たす場合:
呼び出しプロセスがフォアグラウンド、呼び出しプロセスがフォアグラウンドから起動された、フォアグラウンドウィンドウがない、最後の入力イベントを受信した、呼び出しプロセスまたはフォアグラウンドプロセスがデバッグ中。ユーザが他のウィンドウを操作している間はウィンドウを強制的にフォアグラウンドにすることはできず、代わりにタスクバーボタンが点滅する。
（以下省略）


%index
SetGestureConfig
Configures the messages that are sent from a window for Windows Touch gestures.
%group
Win32 user32
%prm
hwnd, dwReserved, cIDs, pGestureConfig, cbSize
hwnd : [intptr] A handle to the window to set the gesture configuration on.
dwReserved : [int] This value is reserved and must be set to 0.
cIDs : [int] A count of the gesture configuration structures that are being passed.
pGestureConfig : [var] An array of gesture configuration structures that specify the gesture configuration.
cbSize : [int] The size of the gesture configuration (GESTURECONFIG) structure.
%inst
Configures the messages that are sent from a window for Windows Touch
gestures.

[戻り値]
If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. To get extended
error information, use the GetLastError function.

[備考]
If you don't expect to change the gesture configuration, call
SetGestureConfig at window creation time. If you want to dynamically
change the gesture configuration, call SetGestureConfig in response
to WM_GESTURENOTIFY messages.
The following table shows the identifiers for gestures that are
supported by the dwID member of the GESTURECONFIG structure. Note
that setting dwID to 0 indicates that global gesture configuration
flags are set.
This doc was truncated.


%index
SetKeyboardState
Copies an array of keyboard key states into the calling thread's keyboard input-state table. This is the same table accessed by the GetKeyboardState and GetKeyState functions. Changes made to this table do not affect keyboard input to any other thread.
%group
Win32 user32
%prm
lpKeyState
lpKeyState : [var] Type: LPBYTE A pointer to a 256-byte array that contains keyboard key states.
%inst
Copies an array of keyboard key states into the calling thread's
keyboard input-state table. This is the same table accessed by the
GetKeyboardState and GetKeyState functions. Changes made to this
table do not affect keyboard input to any other thread.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Because the SetKeyboardState function alters the input state of the
calling thread and not the global input state of the system, an
application cannot use SetKeyboardState to set the NUM LOCK, CAPS
LOCK, or SCROLL LOCK (or the Japanese KANA) indicator lights on the
keyboard. These can be set or cleared using SendInput to simulate
keystrokes.


%index
SetLastErrorEx
Sets the last-error code.
%group
Win32 user32
%prm
dwErrCode, dwType
dwErrCode : [int] The last-error code for the thread.
dwType : [int] This parameter is ignored.
%inst
Sets the last-error code.

[備考]
The last-error code is kept in thread local storage so that multiple
threads do not overwrite each other's values. Most functions call
SetLastError or SetLastErrorEx only when they fail. However, some
system functions call SetLastError or SetLastErrorEx under conditions
of success; those cases are noted in each function's documentation.
Applications can optionally retrieve the value set by this function
by using the GetLastError function immediately after a function
fails. Error codes are 32-bit values (bit 31 is the most significant
bit). Bit 29 is reserved for application-defined error codes; no
system error code has this bit set. If you are defining an error code
for your application, set this bit to indicate that the error code
has been defined by the application and to ensure that your error
code does not conflict with any system-defined error codes.


%index
SetLayeredWindowAttributes
Sets the opacity and transparency color key of a layered window.
%group
Win32 user32
%prm
hwnd, crKey, bAlpha, dwFlags
hwnd : [intptr] Type: HWND A handle to the layered window. A layered window is created by specifying WS_EX_LAYERED when creating the window with the CreateWindowEx function or by setting WS_EX_LAYERED via SetWindowLong after the window has been created. Windows?8:??The WS_EX_LAYERED style is supported for top-level windows and child windows. Previous Windows versions support WS_EX_LAYERED only for top-level windows.
crKey : [int] Type: COLORREF A COLORREF structure that specifies the transparency color key to be used when composing the layered window. All pixels painted by the window in this color will be transparent. To generate a COLORREF, use the RGB macro.
bAlpha : [int] Type: BYTE Alpha value used to describe the opacity of the layered window. Similar to the SourceConstantAlpha member of the BLENDFUNCTION structure. When bAlpha is 0, the window is completely transparent. When bAlpha is 255, the window is opaque.
dwFlags : [int] Type: DWORD
%inst
Sets the opacity and transparency color key of a layered window.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. To get extended
error information, call GetLastError.

[備考]
Note that once SetLayeredWindowAttributes has been called for a
layered window, subsequent UpdateLayeredWindow calls will fail until
the layering style bit is cleared and set again. For more
information, see Using Layered Windows.


%index
SetMenu
Assigns a new menu to the specified window.
%group
Win32 user32
%prm
hWnd, hMenu
hWnd : [intptr] Type: HWND A handle to the window to which the menu is to be assigned.
hMenu : [intptr] Type: HMENU A handle to the new menu. If this parameter is NULL, the window's current menu is removed.
%inst
Assigns a new menu to the specified window.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The window is redrawn to reflect the menu change. A menu can be
assigned to any window that is not a child window. The SetMenu
function replaces the previous menu, if any, but it does not destroy
it. An application should call the DestroyMenu function to accomplish
this task.


%index
SetMenuContextHelpId
Associates a Help context identifier with a menu.
%group
Win32 user32
%prm
param0, param1
param0 : [intptr] 
param1 : [int] 
%inst
Associates a Help context identifier with a menu.

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise. To
retrieve extended error information, call GetLastError.

[備考]
All items in the menu share this identifier. Help context identifiers
can't be attached to individual menu items.


%index
SetMenuDefaultItem
Sets the default menu item for the specified menu.
%group
Win32 user32
%prm
hMenu, uItem, fByPos
hMenu : [intptr] Type: HMENU A handle to the menu to set the default item for.
uItem : [int] Type: UINT The identifier or position of the new default menu item or -1 for no default item. The meaning of this parameter depends on the value of fByPos.
fByPos : [int] Type: UINT The meaning of uItem. If this parameter is FALSE, uItem is a menu item identifier. Otherwise, it is a menu item position. See About Menus for more information.
%inst
Sets the default menu item for the specified menu.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, use the GetLastError function.


%index
SetMenuInfo
Sets information for a specified menu.
%group
Win32 user32
%prm
param0, param1
param0 : [intptr] 
param1 : [var] 
%inst
Sets information for a specified menu.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
SetMenuItemBitmaps
Associates the specified bitmap with a menu item. Whether the menu item is selected or clear, the system displays the appropriate bitmap next to the menu item.
%group
Win32 user32
%prm
hMenu, uPosition, uFlags, hBitmapUnchecked, hBitmapChecked
hMenu : [intptr] Type: HMENU A handle to the menu containing the item to receive new check-mark bitmaps.
uPosition : [int] Type: UINT The menu item to be changed, as determined by the uFlags parameter.
uFlags : [int] Type: UINT
hBitmapUnchecked : [intptr] Type: HBITMAP A handle to the bitmap displayed when the menu item is not selected.
hBitmapChecked : [intptr] Type: HBITMAP A handle to the bitmap displayed when the menu item is selected.
%inst
Associates the specified bitmap with a menu item. Whether the menu
item is selected or clear, the system displays the appropriate bitmap
next to the menu item.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
If either the hBitmapUnchecked or hBitmapChecked parameter is NULL,
the system displays nothing next to the menu item for the
corresponding check state. If both parameters are NULL, the system
displays the default check-mark bitmap when the item is selected, and
removes the bitmap when the item is not selected. When the menu is
destroyed, these bitmaps are not destroyed; it is up to the
application to destroy them. The selected and clear bitmaps should be
monochrome. The system uses the Boolean AND operator to combine
bitmaps with the menu so that the white part becomes transparent and
the black part becomes the menu-item color. If you use color bitmaps,
the results may be undesirable. Use the GetSystemMetrics function
with the SM_CXMENUCHECK and SM_CYMENUCHECK values to retrieve the
bitmap dimensions.


%index
SetMenuItemInfoW
Changes information about a menu item. (Unicode)
%group
Win32 user32
%prm
hmenu, item, fByPositon, lpmii
hmenu : [intptr] Type: HMENU A handle to the menu that contains the menu item.
item : [int] Type: UINT The identifier or position of the menu item to change. The meaning of this parameter depends on the value of fByPosition.
fByPositon : [int] 
lpmii : [var] Type: LPMENUITEMINFO A pointer to a MENUITEMINFO structure that contains information about the menu item and specifies which menu item attributes to change.
%inst
Changes information about a menu item. (Unicode)

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, use the GetLastError function.

[備考]
The application must call the DrawMenuBar function whenever a menu
changes, whether the menu is in a displayed window. In order for
keyboard accelerators to work with bitmap or owner-drawn menu items,
the owner of the menu must process the WM_MENUCHAR message. See
Owner-Drawn Menus and the WM_MENUCHAR Message for more information.


%index
SetMessageExtraInfo
Sets the extra message information for the current thread.
%group
Win32 user32
%prm
lParam
lParam : [intptr] Type: LPARAM The value to be associated with the current thread.
%inst
Sets the extra message information for the current thread.

[戻り値]
Type: LPARAM The return value is the previous value associated with
the current thread.


%index
SetMessageQueue
(no summary)
%group
Win32 user32
%prm
cMessagesMax
cMessagesMax : [int] 
%inst



%index
SetParent
指定した子ウィンドウの親ウィンドウを変更する。
%group
Win32 user32
%prm
hWndChild, hWndNewParent
hWndChild : [intptr] 型: HWND 子ウィンドウへのハンドル。
hWndNewParent : [intptr] 型: HWND 新しい親ウィンドウへのハンドル。NULL の場合、デスクトップウィンドウが新しい親となる。HWND_MESSAGE の場合、子ウィンドウはメッセージ専用ウィンドウになる。
%inst
指定した子ウィンドウの親ウィンドウを変更する。

[戻り値]
型: HWND 関数が成功した場合、戻り値は以前の親ウィンドウへのハンドル。失敗した場合は NULL。拡張エラー情報を得るには
GetLastError を呼び出す。

[備考]
アプリケーションは SetParent を使ってポップアップ、オーバーラップ、子ウィンドウの親を設定できる。hWndChild
が表示中の場合、システムは適切な再描画を行う。互換性のため、SetParent は親変更対象ウィンドウの WS_CHILD や
WS_POPUP スタイルを変更しない。したがって hWndNewParent が NULL の場合は SetParent 呼び出し後に
WS_CHILD ビットをクリアし WS_POPUP を設定すべきである。逆に hWndNewParent が非 NULL
でウィンドウが以前デスクトップの子であった場合、呼び出し前に WS_POPUP をクリアし WS_CHILD
を設定すべきである。ウィンドウの親を変更するときは両ウィンドウの UISTATE を同期すべきである。詳細は
WM_CHANGEUISTATE と WM_UPDATEUISTATE を参照。hWndNewParent と hWndChild
が異なる DPI 認識モードで動作している場合、予期しない動作やエラーが発生する可能性がある。その挙動は次の表にまとめる:
（以下省略）


%index
SetPhysicalCursorPos
Sets the position of the cursor in physical coordinates.
%group
Win32 user32
%prm
X, Y
X : [int] Type: int The new x-coordinate of the cursor, in physical coordinates.
Y : [int] Type: int The new y-coordinate of the cursor, in physical coordinates.
%inst
Sets the position of the cursor in physical coordinates.

[戻り値]
Type: BOOL TRUE if successful; otherwise FALSE.

[備考]
For a description of the difference between logical coordinates and
physical coordinates, see PhysicalToLogicalPoint.
GetLastError can be called to get more information about any error
that is generated.


%index
SetProcessDPIAware
SetProcessDPIAware may be altered or unavailable. Instead, use SetProcessDPIAwareness.
%group
Win32 user32
%prm

%inst
SetProcessDPIAware may be altered or unavailable. Instead, use
SetProcessDPIAwareness.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero.
Otherwise, the return value is zero.

[備考]
For more information, see Setting the default DPI awareness for a
process.


%index
SetProcessDefaultLayout
Changes the default layout when windows are created with no parent or owner only for the currently running process.
%group
Win32 user32
%prm
dwDefaultLayout
dwDefaultLayout : [int] Type: DWORD The default process layout. This parameter can be 0 or the following value.
%inst
Changes the default layout when windows are created with no parent or
owner only for the currently running process.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The layout specifies how text and graphics are laid out; the default
is left to right. The SetProcessDefaultLayout function changes layout
to be right to left, which is the standard in Arabic and Hebrew
cultures. After the LAYOUT_RTL flag is selected, flags normally
specifying right or left are reversed. To avoid confusion, consider
defining alternate words for standard flags, such as those in the
following table.
This doc was truncated.


%index
SetProcessDpiAwarenessContext
Sets the current process to a specified dots per inch (dpi) awareness context. The DPI awareness contexts are from the DPI_AWARENESS_CONTEXT value.
%group
Win32 user32
%prm
value
value : [intptr] A DPI_AWARENESS_CONTEXT handle to set.
%inst
Sets the current process to a specified dots per inch (dpi) awareness
context. The DPI awareness contexts are from the
DPI_AWARENESS_CONTEXT value.

[戻り値]
This function returns TRUE if the operation was successful, and FALSE
otherwise. To get extended error information, call GetLastError.
Possible errors are ERROR_INVALID_PARAMETER for an invalid input, and
ERROR_ACCESS_DENIED if the default API awareness mode for the process
has already been set (via a previous API call or within the
application manifest).

[備考]
This API is a more advanced version of the previously existing
SetProcessDpiAwareness API, allowing for the process default to be
set to the finer-grained DPI_AWARENESS_CONTEXT values. Most
importantly, this allows you to programmatically set Per Monitor v2
as the process default value, which is not possible with the previous
API. This method sets the default DPI_AWARENESS_CONTEXT for all
threads within an application. Individual threads can have their DPI
awareness changed from the default with the
SetThreadDpiAwarenessContext method. Important In general, it is
recommended to not use SetProcessDpiAwarenessContext to set the DPI
awareness for your application. If possible, you should declare the
DPI awareness for your application in the application manifest. For
more information, see Setting the default DPI awareness for a
process. You must call this API before you call any APIs that depend
on the DPI awareness (including before creating any UI in your
process). Once API awareness is set for an app, any future calls to
this API will fail. This is true regardless of whether you set the
DPI awareness in the manifest or by using this API. If the DPI
awareness level is not set, the default value is
DPI_AWARENESS_CONTEXT_UNAWARE.


%index
SetProcessRestrictionExemption
Exempts the calling process from restrictions preventing desktop processes from interacting with the Windows Store app environment. This function is used by development and debugging tools.
%group
Win32 user32
%prm
fEnableExemption
fEnableExemption : [int] When set to TRUE, indicates a request to disable exemption for the calling process.
%inst
Exempts the calling process from restrictions preventing desktop
processes from interacting with the Windows Store app environment.
This function is used by development and debugging tools.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Any process can call this function, including desktop and Windows
Store app processes and processes that use IL code.


%index
SetProcessWindowStation
Assigns the specified window station to the calling process.
%group
Win32 user32
%prm
hWinSta
hWinSta : [intptr] A handle to the window station. This can be a handle returned by the CreateWindowStation, OpenWindowStation, or GetProcessWindowStation function. This window station must be associated with the current session.
%inst
Assigns the specified window station to the calling process.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
SetPropW
Adds a new entry or changes an existing entry in the property list of the specified window. (Unicode)
%group
Win32 user32
%prm
hWnd, lpString, hData
hWnd : [intptr] Type: HWND A handle to the window whose property list receives the new entry.
lpString : [wstr] Type: LPCTSTR A null-terminated string or an atom that identifies a string. If this parameter is an atom, it must be a global atom created by a previous call to the GlobalAddAtom function. The atom must be placed in the low-order word of lpString; the high-order word must be zero.
hData : [intptr] Type: HANDLE A handle to the data to be copied to the property list. The data handle can identify any value useful to the application.
%inst
Adds a new entry or changes an existing entry in the property list of
the specified window. (Unicode)

[戻り値]
Type: BOOL If the data handle and string are added to the property
list, the return value is nonzero. If the function fails, the return
value is zero. To get extended error information, call GetLastError.

[備考]
Before a window is destroyed (that is, before it returns from
processing the WM_NCDESTROY message), an application must remove all
entries it has added to the property list. The application must use
the RemoveProp function to remove the entries. SetProp is subject to
the restrictions of User Interface Privilege Isolation (UIPI). A
process can only call this function on a window belonging to a
process of lesser or equal integrity level. When UIPI blocks property
changes, GetLastError will return 5.


%index
SetRect
The SetRect function sets the coordinates of the specified rectangle. This is equivalent to assigning the left, top, right, and bottom arguments to the appropriate members of the RECT structure.
%group
Win32 user32
%prm
lprc, xLeft, yTop, xRight, yBottom
lprc : [var] Pointer to the RECT structure that contains the rectangle to be set.
xLeft : [int] Specifies the x-coordinate of the rectangle's upper-left corner.
yTop : [int] Specifies the y-coordinate of the rectangle's upper-left corner.
xRight : [int] Specifies the x-coordinate of the rectangle's lower-right corner.
yBottom : [int] Specifies the y-coordinate of the rectangle's lower-right corner.
%inst
The SetRect function sets the coordinates of the specified rectangle.
This is equivalent to assigning the left, top, right, and bottom
arguments to the appropriate members of the RECT structure.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
Because applications can use rectangles for different purposes, the
rectangle functions do not use an explicit unit of measure. Instead,
all rectangle coordinates and dimensions are given in signed, logical
values. The mapping mode and the function in which the rectangle is
used determine the units of measure.


%index
SetRectEmpty
The SetRectEmpty function creates an empty rectangle in which all coordinates are set to zero.
%group
Win32 user32
%prm
lprc
lprc : [var] Pointer to the RECT structure that contains the coordinates of the rectangle.
%inst
The SetRectEmpty function creates an empty rectangle in which all
coordinates are set to zero.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
Because applications can use rectangles for different purposes, the
rectangle functions do not use an explicit unit of measure. Instead,
all rectangle coordinates and dimensions are given in signed, logical
values. The mapping mode and the function in which the rectangle is
used determine the units of measure.


%index
SetScrollInfo
The SetScrollInfo function sets the parameters of a scroll bar, including the minimum and maximum scrolling positions, the page size, and the position of the scroll box (thumb). The function also redraws the scroll bar, if requested.
%group
Win32 user32
%prm
hwnd, nBar, lpsi, redraw
hwnd : [intptr] Type: HWND Handle to a scroll bar control or a window with a standard scroll bar, depending on the value of the fnBar parameter.
nBar : [int] Type: int
lpsi : [var] Type: LPCSCROLLINFO Pointer to a SCROLLINFO structure. Before calling SetScrollInfo, set the cbSize member of the structure to sizeof(SCROLLINFO), set the fMask member to indicate the parameters to set, and specify the new parameter values in the appropriate members. The
redraw : [int] Type: BOOL Specifies whether the scroll bar is redrawn to reflect the changes to the scroll bar. If this parameter is TRUE, the scroll bar is redrawn, otherwise, it is not redrawn.
%inst
The SetScrollInfo function sets the parameters of a scroll bar,
including the minimum and maximum scrolling positions, the page size,
and the position of the scroll box (thumb). The function also redraws
the scroll bar, if requested.

[戻り値]
Type: int The return value is the current position of the scroll box.

[備考]
The SetScrollInfo function performs range checking on the values
specified by the nPage and nPos members of the SCROLLINFO structure.
The nPage member must specify a value from 0 to nMax - nMin +1. The
nPos member must specify a value between nMin and nMax - max( nPage?
1, 0). If either value is beyond its range, the function sets it to a
value that is just within the range. If the fnBar parameter is SB_CTL
and the window specified by the hwnd parameter is not a system scroll
bar control, the system sends the SBM_SETSCROLLINFO message to the
window to set scroll bar information (The system can optimize the
message to SBM_SETPOS or SBM_SETRANGE if the request is solely for
the position or range). This allows SetScrollInfo to operate on a
custom control that mimics a scroll bar. If the window does not
handle SBM_SETSCROLLINFO (or the optimized SBM_SETPOS message or
SBM_SETRANGE message), then the SetScrollInfo function fails. For an
example, see Scrolling Text with the WM_PAINT Message.


%index
SetScrollPos
The SetScrollPos function sets the position of the scroll box (thumb) in the specified scroll bar and, if requested, redraws the scroll bar to reflect the new position of the scroll box.
%group
Win32 user32
%prm
hWnd, nBar, nPos, bRedraw
hWnd : [intptr] Type: HWND Handle to a scroll bar control or a window with a standard scroll bar, depending on the value of the nBar parameter.
nBar : [int] Type: int
nPos : [int] Type: int Specifies the new position of the scroll box. The position must be within the scrolling range. For more information about the scrolling range, see the SetScrollRange function.
bRedraw : [int] Type: BOOL Specifies whether the scroll bar is redrawn to reflect the new scroll box position. If this parameter is TRUE, the scroll bar is redrawn. If it is FALSE, the scroll bar is not redrawn.
%inst
The SetScrollPos function sets the position of the scroll box (thumb)
in the specified scroll bar and, if requested, redraws the scroll bar
to reflect the new position of the scroll box.

[戻り値]
Type: int If the function succeeds, the return value is the previous
position of the scroll box.
If the function fails, the return value is zero. To get extended
error information, call GetLastError.

[備考]
If the scroll bar is redrawn by a subsequent call to another
function, setting the bRedraw parameter to FALSE is useful. Because
the messages that indicate scroll bar position, WM_HSCROLL and
WM_VSCROLL, are limited to 16 bits of position data, applications
that rely solely on those messages for position data have a practical
maximum value of 65,535 for the SetScrollPos function's nPos
parameter. However, because the SetScrollInfo, SetScrollPos,
SetScrollRange, GetScrollInfo, GetScrollPos, and GetScrollRange
functions support 32-bit scroll bar position data, there is a way to
circumvent the 16-bit barrier of the WM_HSCROLL and WM_VSCROLL
messages. See GetScrollInfo for a description of the technique. If
the nBar parameter is SB_CTL and the window specified by the hWnd
parameter is not a system scroll bar control, the system sends the
SBM_SETPOS message to the window to set scroll bar information. This
allows SetScrollPos to operate on a custom control that mimics a
scroll bar. If the window does not handle the SBM_SETPOS message, the
SetScrollPos function fails.


%index
SetScrollRange
The SetScrollRange function sets the minimum and maximum scroll box positions for the specified scroll bar.
%group
Win32 user32
%prm
hWnd, nBar, nMinPos, nMaxPos, bRedraw
hWnd : [intptr] Type: HWND Handle to a scroll bar control or a window with a standard scroll bar, depending on the value of the nBar parameter.
nBar : [int] Type: int
nMinPos : [int] Type: int Specifies the minimum scrolling position.
nMaxPos : [int] Type: int Specifies the maximum scrolling position.
bRedraw : [int] Type: BOOL Specifies whether the scroll bar should be redrawn to reflect the change. If this parameter is TRUE, the scroll bar is redrawn. If it is FALSE, the scroll bar is not redrawn.
%inst
The SetScrollRange function sets the minimum and maximum scroll box
positions for the specified scroll bar.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
You can use SetScrollRange to hide the scroll bar by setting nMinPos
and nMaxPos to the same value. An application should not call the
SetScrollRange function to hide a scroll bar while processing a
scroll bar message. New applications should use the ShowScrollBar
function to hide the scroll bar. If the call to SetScrollRange
immediately follows a call to the SetScrollPos function, the bRedraw
parameter in SetScrollPos must be zero to prevent the scroll bar from
being drawn twice. The default range for a standard scroll bar is 0
through 100. The default range for a scroll bar control is empty
(both the nMinPos and nMaxPos parameter values are zero). The
difference between the values specified by the nMinPos and nMaxPos
parameters must not be greater than the value of MAXLONG. Because the
messages that indicate scroll bar position, WM_HSCROLL and
WM_VSCROLL, are limited to 16 bits of position data, applications
that rely solely on those messages for position data have a practical
maximum value of 65,535 for the SetScrollRange function's nMaxPos
parameter. However, because the SetScrollInfo, SetScrollPos,
SetScrollRange, GetScrollInfo, GetScrollPos, and GetScrollRange
functions support 32-bit scroll bar position data, there is a way to
circumvent the 16-bit barrier of the WM_HSCROLL and WM_VSCROLL
messages. See GetScrollInfo for a description of the technique. If
the nBar parameter is SB_CTL and the window specified by the hWnd
parameter is not a system scroll bar control, the system sends the
SBM_SETRANGE message to the window to set scroll bar information.
This allows SetScrollRange to operate on a custom control that mimics
a scroll bar. If the window does not handle the SBM_SETRANGE message,
the SetScrollRange function fails.


%index
SetSysColors
Sets the colors for the specified display elements.
%group
Win32 user32
%prm
cElements, lpaElements, lpaRgbValues
cElements : [int] Type: int The number of display elements in the lpaElements array.
lpaElements : [var] Type: const INT* An array of integers that specify the display elements to be changed. For a list of display elements, see GetSysColor.
lpaRgbValues : [var] Type: const COLORREF* An array of COLORREF values that contain the new red, green, blue (RGB) color values for the display elements in the array pointed to by the lpaElements parameter. To generate a COLORREF, use the RGB macro.
%inst
Sets the colors for the specified display elements.

[戻り値]
Type: BOOL If the function succeeds, the return value is a nonzero
value. If the function fails, the return value is zero. To get
extended error information, call GetLastError.

[備考]
The SetSysColors function sends a WM_SYSCOLORCHANGE message to all
windows to inform them of the change in color. It also directs the
system to repaint the affected portions of all currently visible
windows. It is best to respect the color settings specified by the
user. If you are writing an application to enable the user to change
the colors, then it is appropriate to use this function. However,
this function affects only the current session. The new colors are
not saved when the system terminates.


%index
SetSystemCursor
Enables an application to customize the system cursors. It replaces the contents of the system cursor specified by the id parameter with the contents of the cursor specified by the hcur parameter and then destroys hcur.
%group
Win32 user32
%prm
hcur, id
hcur : [intptr] Type: HCURSOR A handle to the cursor. The function replaces the contents of the system cursor specified by id with the contents of the cursor handled by hcur. The system destroys hcur by calling the DestroyCursor function. Therefore, hcur cannot be a cursor loaded using the LoadCursor function. To specify a cursor loaded from a resource, copy the cursor using the CopyCursor function, then pass the copy to SetSystemCursor.
id : [int] Type: DWORD
%inst
Enables an application to customize the system cursors. It replaces
the contents of the system cursor specified by the id parameter with
the contents of the cursor specified by the hcur parameter and then
destroys hcur.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
For an application to use any of the OCR_ constants, the constant
OEMRESOURCE must be defined before the Windows.h header file is
included.


%index
SetThreadDesktop
Assigns the specified desktop to the calling thread. All subsequent operations on the desktop use the access rights granted to the desktop.
%group
Win32 user32
%prm
hDesktop
hDesktop : [intptr] A handle to the desktop to be assigned to the calling thread. This handle is returned by the CreateDesktop, GetThreadDesktop, OpenDesktop, or OpenInputDesktop function. This desktop must be associated with the current window station for the process.
%inst
Assigns the specified desktop to the calling thread. All subsequent
operations on the desktop use the access rights granted to the
desktop.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The SetThreadDesktop function will fail if the calling thread has any
windows or hooks on its current desktop (unless the hDesktop
parameter is a handle to the current desktop). Warning There is a
significant security risk for any service that opens a window on the
interactive desktop. By opening a desktop window, a service makes
itself vulnerable to attack from the logged-on user, whose
application could send malicious messages to the service's desktop
window and affect its ability to function.


%index
SetThreadDpiAwarenessContext
Set the DPI awareness for the current thread to the provided value.
%group
Win32 user32
%prm
dpiContext
dpiContext : [intptr] The new DPI_AWARENESS_CONTEXT for the current thread. This context includes the DPI_AWARENESS value.
%inst
Set the DPI awareness for the current thread to the provided value.

[戻り値]
The old DPI_AWARENESS_CONTEXT for the thread. If the dpiContext is
invalid, the thread will not be updated and the return value will be
NULL. You can use this value to restore the old DPI_AWARENESS_CONTEXT
after overriding it with a predefined value.

[備考]
Use this API to change the DPI_AWARENESS_CONTEXT for the thread from
the default value for the app.


%index
SetThreadDpiHostingBehavior
Sets the thread's DPI_HOSTING_BEHAVIOR. This behavior allows windows created in the thread to host child windows with a different DPI_AWARENESS_CONTEXT.
%group
Win32 user32
%prm
value
value : [int] The new DPI_HOSTING_BEHAVIOR value for the current thread.
%inst
Sets the thread's DPI_HOSTING_BEHAVIOR. This behavior allows windows
created in the thread to host child windows with a different
DPI_AWARENESS_CONTEXT.

[戻り値]
The previous DPI_HOSTING_BEHAVIOR for the thread. If the hosting
behavior passed in is invalid, the thread will not be updated and the
return value will be DPI_HOSTING_BEHAVIOR_INVALID. You can use this
value to restore the old DPI_HOSTING_BEHAVIOR after overriding it
with a predefined value.

[備考]
DPI_HOSTING_BEHAVIOR enables a mixed content hosting behavior, which
allows parent windows created in the thread to host child windows
with a different DPI_AWARENESS_CONTEXT value. This property only
effects new windows created within this thread while the mixed
hosting behavior is active. A parent window with this hosting
behavior is able to host child windows with different
DPI_AWARENESS_CONTEXT values, regardless of whether the child windows
have mixed hosting behavior enabled. This hosting behavior does not
allow for windows with per-monitor DPI_AWARENESS_CONTEXT values to be
hosted until windows with DPI_AWARENESS_CONTEXT values of system or
unaware. To avoid unexpected outcomes, a thread's
DPI_HOSTING_BEHAVIOR should be changed to support mixed hosting
behaviors only when creating a new window which needs to support
those behaviors. Once that window is created, the hosting behavior
should be switched back to its default value. This API is used to
change the thread's DPI_HOSTING_BEHAVIOR from its default value. This
is only necessary if your app needs to host child windows from
plugins and third-party components that do not support
per-monitor-aware context. This is most likely to occur if you are
updating complex applications to support per-monitor
DPI_AWARENESS_CONTEXT behaviors. Enabling mixed hosting behavior will
not automatically adjust the thread's DPI_AWARENESS_CONTEXT to be
compatible with legacy content. The thread's awareness context must
still be manually changed before new windows are created to host such
content.


%index
SetTimer
Creates a timer with the specified time-out value.
%group
Win32 user32
%prm
hWnd, nIDEvent, uElapse, lpTimerFunc
hWnd : [intptr] Type: HWND A handle to the window to be associated with the timer. This window must be owned by the calling thread. If a NULL value for hWnd is passed in along with an nIDEvent of an existing timer, that timer will be replaced in the same way that an existing non-NULL hWnd timer will be.
nIDEvent : [int] Type: UINT_PTR A nonzero timer identifier. If the hWnd parameter is NULL, and the nIDEvent does not match an existing timer then it is ignored and a new timer ID is generated. If the hWnd parameter is not NULL and the window specified by hWnd already has a timer with the value nIDEvent, then the existing timer is replaced by the new timer. When SetTimer replaces a timer, the timer is reset. Therefore, a message will be sent after the current time-out value elapses, but the previously set time-out value is ignored. If the call is not intended to replace an existing timer, nIDEvent should be 0 if the hWnd is NULL.
uElapse : [int] Type: UINT The time-out value, in milliseconds. If uElapse is less than USER_TIMER_MINIMUM (0x0000000A), the timeout is set to USER_TIMER_MINIMUM. If uElapse is greater than USER_TIMER_MAXIMUM (0x7FFFFFFF), the timeout is set to USER_TIMER_MAXIMUM.
lpTimerFunc : [int] Type: TIMERPROC A pointer to the function to be notified when the time-out value elapses. For more information about the function, see TimerProc. If lpTimerFunc is NULL, the system posts a WM_TIMER message to the application queue. The hwnd member of the message's MSG structure contains the value of the hWnd parameter.
%inst
Creates a timer with the specified time-out value.

[戻り値]
Type: UINT_PTR If the function succeeds and the hWnd parameter is
NULL, the return value is an integer identifying the new timer. An
application can pass this value to the KillTimer function to destroy
the timer. If the function succeeds and the hWnd parameter is not
NULL, then the return value is a nonzero integer. An application can
pass the value of the nIDEvent parameter to the KillTimer function to
destroy the timer. If the function fails to create a timer, the
return value is zero. To get extended error information, call
GetLastError.

[備考]
An application can process WM_TIMER messages by including a WM_TIMER
case statement in the window procedure or by specifying a TimerProc
callback function when creating the timer. When you specify a
TimerProc callback function, the DispatchMessage calls the callback
function instead of calling the window procedure when it processes
WM_TIMER with a non-NULL lParam. Therefore, you need to dispatch
messages in the calling thread, even when you use TimerProc instead
of processing WM_TIMER. The wParam parameter of the WM_TIMER message
contains the value of the nIDEvent parameter. The timer identifier,
nIDEvent, is specific to the associated window. Another window can
have its own timer which has the same identifier as a timer owned by
another window. The timers are distinct. SetTimer can reuse timer IDs
in the case where hWnd is NULL. Before using **SetTimer** or other
timer-related functions, it is recommended to set the
**UOI_TIMERPROC_EXCEPTION_SUPPRESSION** flag to **false** through the
**SetUserObjectInformationW** function, otherwise the application
could behave unpredictably and could be vulnerable to security
exploits. For more info, see SetUserObjectInformationW.


%index
SetUserObjectInformationW
Sets information about the specified window station or desktop object. (Unicode)
%group
Win32 user32
%prm
hObj, nIndex, pvInfo, nLength
hObj : [intptr] A handle to the window station, desktop object or a current process pseudo handle. This handle can be returned by the  CreateWindowStation, OpenWindowStation, CreateDesktop, OpenDesktop or  GetCurrentProcess function.
nIndex : [int] The object information to be set. This parameter can be the following value.
pvInfo : [intptr] A pointer to a buffer containing the object information, or a BOOL.
nLength : [int] The size of the information contained in the buffer pointed to by pvInfo, in bytes.
%inst
Sets information about the specified window station or desktop
object. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails the return value is zero. To get extended error
information, call GetLastError.

[備考]
> [!NOTE] > The winuser.h header defines SetUserObjectInformation as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
SetUserObjectSecurity
Sets the security of a user object. This can be, for example, a window or a DDE conversation.
%group
Win32 user32
%prm
hObj, pSIRequested, pSID
hObj : [intptr] A handle to a user object for which security information is set.
pSIRequested : [var] 
pSID : [int] A pointer to a SECURITY_DESCRIPTOR structure that contains the new security information.
%inst
Sets the security of a user object. This can be, for example, a
window or a DDE conversation.

[戻り値]
If the function succeeds, the function returns nonzero. If the
function fails, it returns zero. To get extended error information,
call GetLastError.

[備考]
The SetUserObjectSecurity function applies changes specified in a
security descriptor to the security descriptor assigned to a user
object. The security descriptor of the object must be in
self-relative form. If necessary, this function allocates additional
memory to increase the size of the security descriptor.


%index
UnhookWinEvent
Removes an event hook function created by a previous call to SetWinEventHook.
%group
Win32 user32
%prm
hWinEventHook
hWinEventHook : [intptr] Type: HWINEVENTHOOK Handle to the event hook returned in the previous call to SetWinEventHook.
%inst
Removes an event hook function created by a previous call to
SetWinEventHook.

[戻り値]
Type: BOOL If successful, returns TRUE; otherwise, returns FALSE.
Three common errors cause this function to fail:
This doc was truncated.

[備考]
This function removes the event hook specified by hWinEventHook that
prevents the corresponding callback function from receiving further
event notifications. If the client's thread ends, the system
automatically calls this function. Call this function from the same
thread that installed the event hook. UnhookWinEvent fails if called
from a thread different from the call that corresponds to
SetWinEventHook. If WINEVENT_INCONTEXT was specified when this event
hook was installed, the system attempts to unload the corresponding
DLL from all processes that loaded it. Although unloading does not
occur immediately, the hook function is not called after
UnhookWinEvent returns. For more information on WINEVENT_INCONTEXT,
see In-Context Hook Functions.


%index
SetWinEventHook
Sets an event hook function for a range of events.
%group
Win32 user32
%prm
eventMin, eventMax, hmodWinEventProc, pfnWinEventProc, idProcess, idThread, dwFlags
eventMin : [int] Type: UINT Specifies the event constant for the lowest event value in the range of events that are handled by the hook function. This parameter can be set to EVENT_MIN to indicate the lowest possible event value.
eventMax : [int] Type: UINT Specifies the event constant for the highest event value in the range of events that are handled by the hook function. This parameter can be  set to EVENT_MAX to indicate the highest possible event value.
hmodWinEventProc : [intptr] Type: HMODULE Handle to the DLL that contains the hook function at lpfnWinEventProc, if the WINEVENT_INCONTEXT flag is specified in the dwFlags parameter. If the hook function is not located in a DLL, or if the WINEVENT_OUTOFCONTEXT flag is specified, this parameter is NULL.
pfnWinEventProc : [int] Type: WINEVENTPROC Pointer to the event hook function. For more information about this function, see WinEventProc.
idProcess : [int] Type: DWORD Specifies the ID of the process from which the hook function receives events. Specify zero (0) to receive events from all processes on the current desktop.
idThread : [int] Type: DWORD Specifies the ID of the thread from which the hook function receives events. If this parameter is zero, the hook function is associated with all existing threads on the current desktop.
dwFlags : [int] Type: UINT
%inst
Sets an event hook function for a range of events.

[戻り値]
Type: HWINEVENTHOOK If successful, returns an HWINEVENTHOOK value
that identifies this event hook instance. Applications save this
return value to use it with the UnhookWinEvent function. If
unsuccessful, returns zero.

[備考]
This function allows clients to specify which processes and threads
they are interested in. If the idProcess parameter is nonzero and
idThread is zero, the hook function receives the specified events
from all threads in that process. If the idProcess parameter is zero
and idThread is nonzero, the hook function receives the specified
events only from the thread specified by idThread. If both are zero,
the hook function receives the specified events from all threads and
processes. Clients can call SetWinEventHook multiple times if they
want to register additional hook functions or listen for additional
events. The client thread that calls SetWinEventHook must have a
message loop in order to receive events. When you use SetWinEventHook
to set a callback in managed code, you should use the GCHandle
structure to avoid exceptions. This tells the garbage collector not
to move the callback. For out-of-context events, the event is
delivered on the same thread that called SetWinEventHook. In some
situations, even if you request WINEVENT_INCONTEXT events, the events
will still be delivered out-of-context. These scenarios include
events from console windows and events from processes that have a
different bit-depth (64 bit versus 32 bits) than the caller.
While a hook function processes an event, additional events may be
triggered, which may cause the hook function to reenter before the
processing for the original event is finished. The problem with
reentrancy in hook functions is that events are completed out of
sequence unless the hook function handles this situation. For more
information, see Guarding Against Reentrancy. Windows Store app
development If dwFlags is WINEVENT_INCONTEXT AND (idProcess = 0 |
idThread = 0), then window hook DLLs are not loaded in-process for
the Windows Store app processes and the Windows Runtime broker
process unless they are installed by UIAccess processes
(accessibility tools). The notification is delivered on the
installer's thread. This behavior is similar to what happens when
there is an architecture mismatch between the hook DLL and the target
application process, for example, when the hook DLL is 32-bit and the
application process 64-bit.


%index
SetWindowContextHelpId
Associates a Help context identifier with the specified window.
%group
Win32 user32
%prm
param0, param1
param0 : [intptr] 
param1 : [int] 
%inst
Associates a Help context identifier with the specified window.

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise. To
retrieve extended error information, call GetLastError.

[備考]
If a child window does not have a Help context identifier, it
inherits the identifier of its parent window. Likewise, if an owned
window does not have a Help context identifier, it inherits the
identifier of its owner window. This inheritance of Help context
identifiers allows an application to set just one identifier for a
dialog box and all of its controls.


%index
SetWindowDisplayAffinity
Stores the display affinity setting in kernel mode on the hWnd associated with the window.
%group
Win32 user32
%prm
hWnd, dwAffinity
hWnd : [intptr] Type: HWND A handle to the top-level window. The window must belong to the current process.
dwAffinity : [int] Type: DWORD The display affinity setting that specifies where the content of the window can be displayed.
%inst
Stores the display affinity setting in kernel mode on the hWnd
associated with the window.

[戻り値]
Type: BOOL If the function succeeds, it returns TRUE; otherwise, it
returns FALSE when, for example, the function call is made on a non
top-level window. To get extended error information, call
GetLastError.

[備考]
This function and GetWindowDisplayAffinity are designed to support
the window content protection feature that is new to Windows 7. This
feature enables applications to protect their own onscreen window
content from being captured or copied through a specific set of
public operating system features and APIs. However, it works only
when the Desktop Window Manager(DWM) is composing the desktop. It is
important to note that unlike a security feature or an implementation
of Digital Rights Management (DRM), there is no guarantee that using
SetWindowDisplayAffinity and GetWindowDisplayAffinity, and other
necessary functions such as DwmIsCompositionEnabled, will strictly
protect windowed content, for example where someone takes a
photograph of the screen. Starting in Windows 10 Version 2004,
WDA_EXCLUDEFROMCAPTURE is a supported value. Setting the display
affinity to WDA_EXCLUDEFROMCAPTURE on previous version of Windows
will behave as if WDA_MONITOR is applied.


%index
SetWindowFeedbackSetting
Sets the feedback configuration for a window.
%group
Win32 user32
%prm
hwnd, feedback, dwFlags, size, configuration
hwnd : [intptr] The window to configure feedback on.
feedback : [int] One of the values from the FEEDBACK_TYPE enumeration.
dwFlags : [int] Reserved. Must be 0.
size : [int] The size, in bytes, of the configuration data. Must be sizeof(BOOL) or 0 if the feedback setting is being reset.
configuration : [intptr] The configuration data. Must be BOOL or NULL if the feedback setting is being reset.
%inst
Sets the feedback configuration for a window.

[戻り値]
Returns TRUE if successful; otherwise, returns FALSE.


%index
SetWindowLongW
Changes an attribute of the specified window. The function also sets the 32-bit (long) value at the specified offset into the extra window memory. (Unicode)
%group
Win32 user32
%prm
hWnd, nIndex, dwNewLong
hWnd : [intptr] Type: HWND A handle to the window and, indirectly, the class to which the window belongs.
nIndex : [int] Type: int
dwNewLong : [int] Type: LONG The replacement value.
%inst
Changes an attribute of the specified window. The function also sets
the 32-bit (long) value at the specified offset into the extra window
memory. (Unicode)

[戻り値]
Type: LONG If the function succeeds, the return value is the previous
value of the specified 32-bit integer. If the function fails, the
return value is zero. To get extended error information, call
GetLastError. If the previous value of the specified 32-bit integer
is zero, and the function succeeds, the return value is zero, but the
function does not clear the last error information. This makes it
difficult to determine success or failure. To deal with this, you
should clear the last error information by calling SetLastError with
0 before calling SetWindowLong. Then, function failure will be
indicated by a return value of zero and a GetLastError result that is
nonzero.

[備考]
Certain window data is cached, so changes you make using
SetWindowLong will not take effect until you call the SetWindowPos
function. Specifically, if you change any of the frame styles, you
must call SetWindowPos with the SWP_FRAMECHANGED flag for the cache
to be updated properly. If you use SetWindowLong with the GWL_WNDPROC
index to replace the window procedure, the window procedure must
conform to the guidelines specified in the description of the
WindowProc callback function. If you use SetWindowLong with the
DWL_MSGRESULT index to set the return value for a message processed
by a dialog procedure, you should return TRUE directly afterward.
Otherwise, if you call any function that results in your dialog
procedure receiving a window message, the nested window message could
overwrite the return value you set using DWL_MSGRESULT. Calling
SetWindowLong with the GWL_WNDPROC index creates a subclass of the
window class used to create the window. An application can subclass a
system class, but should not subclass a window class created by
another process. The SetWindowLong function creates the window
subclass by changing the window procedure associated with a
particular window class, causing the system to call the new window
procedure instead of the previous one. An application must pass any
messages not processed by the new window procedure to the previous
window procedure by calling CallWindowProc. This allows the
application to create a chain of window procedures. Reserve extra
window memory by specifying a nonzero value in the cbWndExtra member
of the WNDCLASSEX structure used with the RegisterClassEx function.
You must not call SetWindowLong with the GWL_HWNDPARENT index to
change the parent of a child window. Instead, use the SetParent
function. If the window has a class style of CS_CLASSDC or CS_OWNDC,
do not set the extended window styles WS_EX_COMPOSITED or
WS_EX_LAYERED. Calling SetWindowLong to set the style on a
progressbar will reset its position.


%index
SetWindowPlacement
Sets the show state and the restored, minimized, and maximized positions of the specified window.
%group
Win32 user32
%prm
hWnd, lpwndpl
hWnd : [intptr] Type: HWND A handle to the window.
lpwndpl : [var] Type: const WINDOWPLACEMENT* A pointer to a WINDOWPLACEMENT structure that specifies the new show state and window positions. Before calling SetWindowPlacement, set the length member of the WINDOWPLACEMENT structure to sizeof(WINDOWPLACEMENT). SetWindowPlacement fails if the length member is not set correctly.
%inst
Sets the show state and the restored, minimized, and maximized
positions of the specified window.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
If the information specified in WINDOWPLACEMENT would result in a
window that is completely off the screen, the system will
automatically adjust the coordinates so that the window is visible,
taking into account changes in screen resolution and multiple monitor
configuration. The length member of WINDOWPLACEMENT must be set to
sizeof(WINDOWPLACEMENT). If this member is not set correctly, the
function returns FALSE. For additional remarks on the proper use of
window placement coordinates, see WINDOWPLACEMENT.


%index
SetWindowPos
子、ポップアップ、またはトップレベルウィンドウのサイズ、位置、Z オーダーを変更する。これらのウィンドウは画面上の表示順に並んでおり、最前面のウィンドウが最上位ランクを持ち Z オーダーの先頭となる。
%group
Win32 user32
%prm
hWnd, hWndInsertAfter, X, Y, cx, cy, uFlags
hWnd : [intptr] 型: HWND ウィンドウへのハンドル。
hWndInsertAfter : [intptr] 型: HWND
X : [int] 型: int ウィンドウ左辺の新しい位置(クライアント座標)。
Y : [int] 型: int ウィンドウ上辺の新しい位置(クライアント座標)。
cx : [int] 型: int ウィンドウの新しい幅(ピクセル単位)。
cy : [int] 型: int ウィンドウの新しい高さ(ピクセル単位)。
uFlags : [int] 型: UINT
%inst
子、ポップアップ、またはトップレベルウィンドウのサイズ、位置、Z
オーダーを変更する。これらのウィンドウは画面上の表示順に並んでおり、最前面のウィンドウが最上位ランクを持ち Z オーダーの先頭となる。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報を得るには GetLastError
を呼び出す。

[備考]
Vista 以降のアーキテクチャ変更により、すべてのサービスは対話型デスクトップから Session 0 へ移された。hwnd
およびウィンドウマネージャ操作はセッション内でのみ有効で、セッションを越えた hwnd 操作は失敗する。詳細は The Windows
Vista Developer Story: Application Compatibility Cookbook
を参照。SetWindowLong で特定のウィンドウデータを変更した場合、変更を反映させるには SetWindowPos
を呼ぶ必要がある。uFlags には次の組み合わせを使う: SWP_NOMOVE | SWP_NOSIZE | SWP_NOZORDER
| SWP_FRAMECHANGED。ウィンドウを最前面にするには hWndInsertAfter を HWND_TOPMOST に設定し
SWP_NOZORDER フラグを設定しないか、Z
オーダー内の位置を既存の最前面ウィンドウより上にする。非最前面ウィンドウを最前面にすると、その所有ウィンドウも最前面になるが、所有者は変更されない。SWP_NOACTIVATE
も SWP_NOZORDER も指定されていない場合(つまりウィンドウの有効化と Z
オーダーの変更を同時に要求する場合)、hWndInsertAfter の値は次の状況でのみ使用される。
（以下省略）


%index
SetWindowRgn
The SetWindowRgn function sets the window region of a window.
%group
Win32 user32
%prm
hWnd, hRgn, bRedraw
hWnd : [intptr] A handle to the window whose window region is to be set.
hRgn : [intptr] A handle to a region. The function sets the window region of the window to this region. If hRgn is NULL, the function sets the window region to NULL.
bRedraw : [int] Specifies whether the system redraws the window after setting the window region. If bRedraw is TRUE, the system does so; otherwise, it does not. Typically, you set bRedraw to TRUE if the window is visible.
%inst
The SetWindowRgn function sets the window region of a window.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
When this function is called, the system sends the
WM_WINDOWPOSCHANGING and WM_WINDOWPOSCHANGING messages to the window.
The coordinates of a window's window region are relative to the
upper-left corner of the window, not the client area of the window.
Note If the window layout is right-to-left (RTL), the coordinates are
relative to the upper-right corner of the window. See Window Layout
and Mirroring. After a successful call to SetWindowRgn, the system
owns the region specified by the region handle hRgn. The system does
not make a copy of the region. Thus, you should not make any further
function calls with this region handle. In particular, do not delete
this region handle. The system deletes the region handle when it no
longer needed. To obtain the window region of a window, call the
GetWindowRgn function.


%index
SetWindowTextW
Changes the text of the specified window's title bar (if it has one). If the specified window is a control, the text of the control is changed. However, SetWindowText cannot change the text of a control in another application. (Unicode)
%group
Win32 user32
%prm
hWnd, lpString
hWnd : [intptr] Type: HWND A handle to the window or control whose text is to be changed.
lpString : [wstr] Type: LPCWSTR The new title or control text.
%inst
Changes the text of the specified window's title bar (if it has one).
If the specified window is a control, the text of the control is
changed. However, SetWindowText cannot change the text of a control
in another application. (Unicode)

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
If the target window is owned by the current process, SetWindowText
causes a WM_SETTEXT message to be sent to the specified window or
control. If the control is a list box control created with the
WS_CAPTION style, however, SetWindowText sets the text for the
control, not for the list box entries. To set the text of a control
in another process, send the WM_SETTEXT message directly instead of
calling SetWindowText. The SetWindowText function does not expand tab
characters (ASCII code 0x09). Tab characters are displayed as
vertical bar (|) characters.


%index
SetWindowWord
(no summary)
%group
Win32 user32
%prm
hWnd, nIndex, wNewWord
hWnd : [intptr] 
nIndex : [int] 
wNewWord : [int] 
%inst



%index
SetWindowsHookW
(no summary)
%group
Win32 user32
%prm
nFilterType, pfnFilterProc
nFilterType : [int] 
pfnFilterProc : [int] 
%inst



%index
SetWindowsHookExW
Installs an application-defined hook procedure into a hook chain. (Unicode)
%group
Win32 user32
%prm
idHook, lpfn, hmod, dwThreadId
idHook : [int] Type: int
lpfn : [int] Type: HOOKPROC A pointer to the hook procedure. If the dwThreadId parameter is zero or specifies the identifier of a thread created by a different process, the lpfn parameter must point to a hook procedure in a DLL. Otherwise, lpfn can point to a hook procedure in the code associated with the current process.
hmod : [intptr] Type: HINSTANCE A handle to the DLL containing the hook procedure pointed to by the lpfn parameter. The hMod parameter must be set to NULL if the dwThreadId parameter specifies a thread created by the current process and if the hook procedure is within the code associated with the current process.
dwThreadId : [int] Type: DWORD The identifier of the thread with which the hook procedure is to be associated. For desktop apps, if this parameter is zero, the hook procedure is associated with all existing threads running in the same desktop as the calling thread. For Windows Store apps, see the Remarks section.
%inst
Installs an application-defined hook procedure into a hook chain.
(Unicode)

[戻り値]
Type: HHOOK If the function succeeds, the return value is the handle
to the hook procedure. If the function fails, the return value is
NULL. To get extended error information, call GetLastError.

[備考]
SetWindowsHookEx can be used to inject a DLL into another process. A
32-bit DLL cannot be injected into a 64-bit process, and a 64-bit DLL
cannot be injected into a 32-bit process. If an application requires
the use of hooks in other processes, it is required that a 32-bit
application call SetWindowsHookEx to inject a 32-bit DLL into 32-bit
processes, and a 64-bit application call SetWindowsHookEx to inject a
64-bit DLL into 64-bit processes. The 32-bit and 64-bit DLLs must
have different names.
Because hooks run in the context of an application, they must match
the "bitness" of the application. If a 32-bit application installs a
global hook on 64-bit Windows, the 32-bit hook is injected into each
32-bit process (the usual security boundaries apply). In a 64-bit
process, the threads are still marked as "hooked." However, because a
32-bit application must run the hook code, the system executes the
hook in the hooking app's context; specifically, on the thread that
called SetWindowsHookEx. This means that the hooking application must
continue to pump messages or it might block the normal functioning of
the 64-bit processes.
If a 64-bit application installs a global hook on 64-bit Windows, the
64-bit hook is injected into each 64-bit process, while all 32-bit
processes use a callback to the hooking application.
To hook all applications on the desktop of a 64-bit Windows
installation, install a 32-bit global hook and a 64-bit global hook,
each from appropriate processes, and be sure to keep pumping messages
in the hooking application to avoid blocking normal functioning. If
you already have a 32-bit global hooking application and it doesn't
need to run in each application's context, you may not need to create
a 64-bit version.
An error may occur if the hMod parameter is NULL and the dwThreadId
parameter is zero or specifies the identifier of a thread created by
another process. Calling the CallNextHookEx function to chain to the
next hook procedure is optional, but it is highly recommended;
otherwise, other applications that have installed hooks will not
receive hook notifications and may behave incorrectly as a result.
You should call CallNextHookEx unless you absolutely need to prevent
the notification from being seen by other applications. Before
terminating, an application must call the UnhookWindowsHookEx
function to free system resources associated with the hook. The scope
of a hook depends on the hook type. Some hooks can be set only with
global scope; others can also be set for only a specific thread, as
shown in the following table.
This doc was truncated.


%index
ShowCaret
Makes the caret visible on the screen at the caret's current position. When the caret becomes visible, it begins flashing automatically.
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] Type: HWND A handle to the window that owns the caret. If this parameter is NULL, ShowCaret searches the current task for the window that owns the caret.
%inst
Makes the caret visible on the screen at the caret's current
position. When the caret becomes visible, it begins flashing
automatically.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
ShowCaret shows the caret only if the specified window owns the
caret, the caret has a shape, and the caret has not been hidden two
or more times in a row. If one or more of these conditions is not
met, ShowCaret does nothing and returns FALSE. Hiding is cumulative.
If your application calls HideCaret five times in a row, it must also
call ShowCaret five times before the caret reappears. The system
provides one caret per queue. A window should create a caret only
when it has the keyboard focus or is active. The window should
destroy the caret before losing the keyboard focus or becoming
inactive.


%index
ShowCursor
Displays or hides the cursor. (ShowCursor)
%group
Win32 user32
%prm
bShow
bShow : [int] Type: BOOL If bShow is TRUE, the display count is incremented by one. If bShow is FALSE, the display count is decremented by one.
%inst
Displays or hides the cursor. (ShowCursor)

[戻り値]
Type: int The return value specifies the new display counter.

[備考]
Windows 8: Call GetCursorInfo to determine the cursor visibility.
This function sets an internal display counter that determines
whether the cursor should be displayed. The cursor is displayed only
if the display count is greater than or equal to 0. If a mouse is
installed, the initial display count is 0. If no mouse is installed,
the display count is ?1.


%index
ShowOwnedPopups
Shows or hides all pop-up windows owned by the specified window.
%group
Win32 user32
%prm
hWnd, fShow
hWnd : [intptr] Type: HWND A handle to the window that owns the pop-up windows to be shown or hidden.
fShow : [int] Type: BOOL If this parameter is TRUE, all hidden pop-up windows are shown. If this parameter is FALSE, all visible pop-up windows are hidden.
%inst
Shows or hides all pop-up windows owned by the specified window.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
ShowOwnedPopups shows only windows hidden by a previous call to
ShowOwnedPopups. For example, if a pop-up window is hidden by using
the ShowWindow function, subsequently calling ShowOwnedPopups with
the fShow parameter set to TRUE does not cause the window to be
shown.


%index
ShowScrollBar
The ShowScrollBar function shows or hides the specified scroll bar.
%group
Win32 user32
%prm
hWnd, wBar, bShow
hWnd : [intptr] Type: HWND Handle to a scroll bar control or a window with a standard scroll bar, depending on the value of the wBar parameter.
wBar : [int] Type: int
bShow : [int] Type: BOOL Specifies whether the scroll bar is shown or hidden. If this parameter is TRUE, the scroll bar is shown; otherwise, it is hidden.
%inst
The ShowScrollBar function shows or hides the specified scroll bar.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
You should not call this function to hide a scroll bar while
processing a scroll bar message.


%index
ShowWindow
指定されたウィンドウの表示状態を設定する。
%group
Win32 user32
%prm
hWnd, nCmdShow
hWnd : [intptr] 型: HWND ウィンドウへのハンドル。
nCmdShow : [int] 型: int
%inst
指定されたウィンドウの表示状態を設定する。

[戻り値]
型: BOOL ウィンドウが以前表示されていた場合は 0 以外。以前非表示だった場合は 0。

[備考]
ウィンドウの表示/非表示で特殊効果を行うには AnimateWindow を使う。アプリケーションは ShowWindow
の初回呼び出しで WinMain の nCmdShow パラメータを使用する。2 回目以降は指定値のいずれかを使用する(WinMain
のものではなく)。プログラムが STARTUPINFO 構造体で起動情報を指定した場合、初回 ShowWindow 呼び出しの
nCmdShow は無視される。以降の呼び出しで SW_SHOWDEFAULT を使うと起動情報を利用できる。
（以下省略）


%index
ShowWindowAsync
Sets the show state of a window without waiting for the operation to complete.
%group
Win32 user32
%prm
hWnd, nCmdShow
hWnd : [intptr] Type: HWND A handle to the window.
nCmdShow : [int] Type: int Controls how the window is to be shown. For a list of possible values, see the description of the ShowWindow function.
%inst
Sets the show state of a window without waiting for the operation to
complete.

[戻り値]
Type: BOOL If the operation was successfully started, the return
value is nonzero.

[備考]
This function posts a show-window event to the message queue of the
given window. An application can use this function to avoid becoming
nonresponsive while waiting for a nonresponsive application to finish
processing a show-window event.


%index
ShutdownBlockReasonCreate
Indicates that the system cannot be shut down and sets a reason string to be displayed to the user if system shutdown is initiated.
%group
Win32 user32
%prm
hWnd, pwszReason
hWnd : [intptr] A handle to the main window of the application.
pwszReason : [wstr] The reason the application must block system shutdown. This string will be truncated for display purposes after MAX_STR_BLOCKREASON characters.
%inst
Indicates that the system cannot be shut down and sets a reason
string to be displayed to the user if system shutdown is initiated.

[戻り値]
If the call succeeds, the return value is nonzero. If the call fails,
the return value is zero. To get extended error information, call
GetLastError.

[備考]
This function can only be called from the thread that created the
window specified by the hWnd parameter. Otherwise, the function fails
and the last error code is ERROR_ACCESS_DENIED. Applications should
call this function as they begin an operation that cannot be
interrupted, such as burning a CD or DVD. When the operation has
completed, call the ShutdownBlockReasonDestroy function to indicate
that the system can be shut down. Because users are typically in a
hurry when shutting down the system, they may spend only a few
seconds looking at the shutdown reasons that are displayed by the
system. Therefore, it is important that your reason strings are short
and clear. For example "A CD burn is in progress." is better than
"This application is blocking system shutdown because a CD burn is in
progress. Do not shut down."


%index
ShutdownBlockReasonDestroy
Indicates that the system can be shut down and frees the reason string.
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] A handle to the main window of the application.
%inst
Indicates that the system can be shut down and frees the reason
string.

[戻り値]
If the call succeeds, the return value is nonzero. If the call fails,
the return value is zero. To get extended error information, call
GetLastError.

[備考]
This function can only be called from the thread that created the
window specified by the hWnd parameter. Otherwise, the function fails
and the last error code is ERROR_ACCESS_DENIED. If system shutdown
has been previously blocked by the ShutdownBlockReasonCreate
function, this function frees the reason string. Otherwise, this
function is a no-op.


%index
ShutdownBlockReasonQuery
Retrieves the reason string set by the ShutdownBlockReasonCreate function.
%group
Win32 user32
%prm
hWnd, pwszBuff, pcchBuff
hWnd : [intptr] A handle to the main window of the application.
pwszBuff : [wstr] A pointer to a buffer that receives the reason string. If this parameter is NULL, the function retrieves the number of characters in the reason string.
pcchBuff : [var] A pointer to a variable that specifies the size of the pwszBuff buffer, in characters. If the function succeeds, this variable receives the number of characters copied into the buffer, including the null-terminating character. If the buffer is too small, the variable receives the required buffer size, in characters, not including the null-terminating character.
%inst
Retrieves the reason string set by the ShutdownBlockReasonCreate
function.

[戻り値]
If the call succeeds, the return value is nonzero. If the call fails,
the return value is zero. To get extended error information, call
GetLastError.

[備考]
This function can only be called from the thread that created the
window specified by the hWnd parameter. Otherwise, the function fails
and the last error code is ERROR_ACCESS_DENIED.


%index
SkipPointerFrameMessages
Determines which pointer input frame generated the most recently retrieved message for the specified pointer and discards any queued (unretrieved) pointer input messages generated from the same pointer input frame.
%group
Win32 user32
%prm
pointerId
pointerId : [int] Identifier of the pointer. Pending messages will be skipped for the frame that includes the most recently retrieved input for this pointer.
%inst
Determines which pointer input frame generated the most recently
retrieved message for the specified pointer and discards any queued
(unretrieved) pointer input messages generated from the same pointer
input frame.

[戻り値]
If the function succeeds, the return value is non-zero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Parallel-mode devices may report pointer input in frames, that is,
they may report the state and position of all pointers from that
device in a single input report to the system. Ideally, applications
should view the entire frame as a single input unless the
application-specific requirements dictate otherwise. The
SkipPointerFrameMessages function can be used in conjunction with the
GetPointerFrameInfo function (or one of its type-specific variants)
to consume entire frames as a single input. When an application sees
a pointer message, it can use the GetPointerFrameInfo function to
retrieve the entire pointer input frame to which the pointer message
belongs, hence obtaining an updated view of all of the pointers
currently owned by the window. Note that the returned frame contains
only pointers that are currently owned by the same window as the
specified pointer. Having retrieved the entire frame of information,
the application can then call the SkipPointerFrameMessages function
to skip remaining pointer messages associated with this frame that
are pending retrieval. This saves the application the overhead of
retrieving and processing the remaining messages one by one. Warning
The SkipPointerFrameMessages function should be used only when the
caller can be sure that no other entity on the caller’s thread (such
as Direct Manipulation) is expecting to retrieve pending pointer
messages. For this reason, SkipPointerFrameMessages should not be
used in conjunction with Direct Manipulation when processing
multiple, simultaneous interactions. Note that the information
retrieved is associated with the pointer frame most recently
retrieved by the calling thread. Once the calling thread retrieves
its next message, the information associated with the previous
pointer frame may no longer be available. If the pointer frame
contains no additional pointers besides the specified pointer, this
function succeeds with no action. If the calling thread does not own
the window to which the pointer message has been delivered, this
function fails with the last error set to ERROR_ACCESS_DENIED.


%index
SoundSentry
Triggers a visual signal to indicate that a sound is playing.
%group
Win32 user32
%prm

%inst
Triggers a visual signal to indicate that a sound is playing.

[戻り値]
Type: BOOL This function returns one of the following values.
This doc was truncated.

[備考]
Set the notification behavior by calling SystemParametersInfo with
the SPI_SETSOUNDSENTRY value.


%index
SubtractRect
The SubtractRect function determines the coordinates of a rectangle formed by subtracting one rectangle from another.
%group
Win32 user32
%prm
lprcDst, lprcSrc1, lprcSrc2
lprcDst : [var] A pointer to a RECT structure that receives the coordinates of the rectangle determined by subtracting the rectangle pointed to by lprcSrc2 from the rectangle pointed to by lprcSrc1.
lprcSrc1 : [var] A pointer to a RECT structure from which the function subtracts the rectangle pointed to by lprcSrc2.
lprcSrc2 : [var] A pointer to a RECT structure that the function subtracts from the rectangle pointed to by lprcSrc1.
%inst
The SubtractRect function determines the coordinates of a rectangle
formed by subtracting one rectangle from another.

[戻り値]
If the resulting rectangle is empty, the return value is zero. If the
resulting rectangle is not empty, the return value is nonzero.

[備考]
The function only subtracts the rectangle specified by lprcSrc2 from
the rectangle specified by lprcSrc1 when the rectangles intersect
completely in either the x- or y-direction. For example, if *lprcSrc1
has the coordinates (10,10,100,100) and *lprcSrc2 has the coordinates
(50,50,150,150), the function sets the coordinates of the rectangle
pointed to by lprcDst to (10,10,100,100). If *lprcSrc1 has the
coordinates (10,10,100,100) and *lprcSrc2 has the coordinates
(50,10,150,150), however, the function sets the coordinates of the
rectangle pointed to by lprcDst to (10,10,50,100). In other words,
the resulting rectangle is the bounding box of the geometric
difference. Because applications can use rectangles for different
purposes, the rectangle functions do not use an explicit unit of
measure. Instead, all rectangle coordinates and dimensions are given
in signed, logical values. The mapping mode and the function in which
the rectangle is used determine the units of measure.


%index
SwapMouseButton
Reverses or restores the meaning of the left and right mouse buttons.
%group
Win32 user32
%prm
fSwap
fSwap : [int] Type: BOOL If this parameter is TRUE, the left button generates right-button messages and the right button generates left-button messages. If this parameter is FALSE, the buttons are restored to their original meanings.
%inst
Reverses or restores the meaning of the left and right mouse buttons.

[戻り値]
Type: BOOL If the meaning of the mouse buttons was reversed
previously, before the function was called, the return value is
nonzero. If the meaning of the mouse buttons was not reversed, the
return value is zero.

[備考]
Button swapping is provided as a convenience to people who use the
mouse with their left hands. The SwapMouseButton function is usually
called by Control Panel only. Although an application is free to call
the function, the mouse is a shared resource and reversing the
meaning of its buttons affects all applications.


%index
SwitchDesktop
Makes the specified desktop visible and activates it. This enables the desktop to receive input from the user.
%group
Win32 user32
%prm
hDesktop
hDesktop : [intptr] A handle to the desktop. This handle is returned by the CreateDesktop and OpenDesktop functions. This desktop must be associated with the current window station for the process.
%inst
Makes the specified desktop visible and activates it. This enables
the desktop to receive input from the user.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. However, SwitchDesktop only sets the
last error for the following cases:
This doc was truncated.

[備考]
The SwitchDesktop function fails if the desktop belongs to an
invisible window station. SwitchDesktop also fails when called from a
process that is associated with a secured desktop such as the
WinLogon and ScreenSaver desktops. Processes that are associated with
a secured desktop include custom UserInit processes. Such calls
typically fail with an "access denied" error.


%index
SwitchToThisWindow
Switches focus to the specified window and brings it to the foreground.
%group
Win32 user32
%prm
hwnd, fUnknown
hwnd : [intptr] Type: HWND A handle to the window.
fUnknown : [int] Type: BOOL A TRUE for this parameter indicates that the window is being switched to using the Alt/Ctl+Tab key sequence.  This parameter should be FALSE otherwise.
%inst
Switches focus to the specified window and brings it to the
foreground.

[備考]
This function is typically called to maintain window z-ordering. This
function was not included in the SDK headers and libraries until
Windows XP with Service Pack 1 (SP1) and Windows Server 2003. If you
do not have a header file and import library for this function, you
can call the function using LoadLibrary and GetProcAddress.


%index
SystemParametersInfoW
Retrieves or sets the value of one of the system-wide parameters. (Unicode)
%group
Win32 user32
%prm
uiAction, uiParam, pvParam, fWinIni
uiAction : [int] Type: UINT The system-wide parameter to be retrieved or set. The possible values are organized in the following tables of related parameters:
uiParam : [int] Type: UINT A parameter whose usage and format depends on the system parameter being queried or set. For more information about system-wide parameters, see the uiAction parameter. If not otherwise indicated, you must specify zero for this parameter.
pvParam : [intptr] Type: PVOID A parameter whose usage and format depends on the system parameter being queried or set. For more information about system-wide parameters, see the uiAction parameter. If not otherwise indicated, you must specify NULL for this parameter. For information on the PVOID datatype, see Windows Data Types.
fWinIni : [int] Type: UINT If a system parameter is being set, specifies whether the user profile is to be updated, and if so, whether the WM_SETTINGCHANGE message is to be broadcast to all top-level windows to notify them of the change.
%inst
Retrieves or sets the value of one of the system-wide parameters.
(Unicode)

[戻り値]
Type: BOOL If the function succeeds, the return value is a nonzero
value. If the function fails, the return value is zero. To get
extended error information, call GetLastError.

[備考]
This function is intended for use with applications that allow the
user to customize the environment. A keyboard layout name should be
derived from the hexadecimal value of the language identifier
corresponding to the layout. For example, U.S. English has a language
identifier of 0x0409, so the primary U.S. English layout is named
"00000409". Variants of U.S. English layout, such as the Dvorak
layout, are named "00010409", "00020409" and so on. For a list of the
primary language identifiers and sublanguage identifiers that make up
a language identifier, see the MAKELANGID macro. There is a
difference between the High Contrast color scheme and the High
Contrast Mode. The High Contrast color scheme changes the system
colors to colors that have obvious contrast; you switch to this color
scheme by using the Display Options in the control panel. The High
Contrast Mode, which uses SPI_GETHIGHCONTRAST and
SPI_SETHIGHCONTRAST, advises applications to modify their appearance
for visually-impaired users. It involves such things as audible
warning to users and customized color scheme (using the Accessibility
Options in the control panel). For more information, see
HIGHCONTRAST. For more information on general accessibility features,
see Accessibility. During the time that the primary button is held
down to activate the Mouse ClickLock feature, the user can move the
mouse. After the primary button is locked down, releasing the primary
button does not result in a WM_LBUTTONUP message. Thus, it will
appear to an application that the primary button is still down. Any
subsequent button message releases the primary button, sending a
WM_LBUTTONUP message to the application, thus the button can be
unlocked programmatically or through the user clicking any button.
This API is not DPI aware, and should not be used if the calling
thread is per-monitor DPI aware. For the DPI-aware version of this
API, see SystemParametersInfoForDPI. For more information on DPI
awareness, see the Windows High DPI documentation.


%index
SystemParametersInfoForDpi
Retrieves the value of one of the system-wide parameters, taking into account the provided DPI value.
%group
Win32 user32
%prm
uiAction, uiParam, pvParam, fWinIni, dpi
uiAction : [int] The system-wide parameter to be retrieved. This function is only intended for use with SPI_GETICONTITLELOGFONT, SPI_GETICONMETRICS, or SPI_GETNONCLIENTMETRICS. See SystemParametersInfo for more information on these values.
uiParam : [int] A parameter whose usage and format depends on the system parameter being queried. For more information about system-wide parameters, see the uiAction parameter. If not otherwise indicated, you must specify zero for this parameter.
pvParam : [intptr] A parameter whose usage and format depends on the system parameter being queried. For more information about system-wide parameters, see the uiAction parameter. If not otherwise indicated, you must specify NULL for this parameter. For information on the PVOID datatype, see Windows Data Types.
fWinIni : [int] Has no effect for with this API. This parameter only has an effect if you're setting parameter.
dpi : [int] The DPI to use for scaling the metric.
%inst
Retrieves the value of one of the system-wide parameters, taking into
account the provided DPI value.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
This function returns a similar result as SystemParametersInfo, but
scales it according to an arbitrary DPI you provide (if appropriate).
It only scales with the following possible values for uiAction:
SPI_GETICONTITLELOGFONT, SPI_GETICONMETRICS, SPI_GETNONCLIENTMETRICS.
Other possible uiAction values do not provide ForDPI behavior, and
therefore this function returns 0 if called with them. For uiAction
values that contain strings within their associated structures, only
Unicode (LOGFONTW) strings are supported in this function.


%index
TabbedTextOutW
The TabbedTextOut function writes a character string at a specified location, expanding tabs to the values specified in an array of tab-stop positions. Text is written in the currently selected font, background color, and text color. (Unicode)
%group
Win32 user32
%prm
hdc, x, y, lpString, chCount, nTabPositions, lpnTabStopPositions, nTabOrigin
hdc : [intptr] A handle to the device context.
x : [int] The x-coordinate of the starting point of the string, in logical units.
y : [int] The y-coordinate of the starting point of the string, in logical units.
lpString : [wstr] A pointer to the character string to draw. The string does not need to be zero-terminated, since nCount specifies the length of the string.
chCount : [int] The length of the string pointed to by lpString.
nTabPositions : [int] The number of values in the array of tab-stop positions.
lpnTabStopPositions : [var] A pointer to an array containing the tab-stop positions, in logical units. The tab stops must be sorted in increasing order; the smallest x-value should be the first item in the array.
nTabOrigin : [int] The x-coordinate of the starting position from which tabs are expanded, in logical units.
%inst
The TabbedTextOut function writes a character string at a specified
location, expanding tabs to the values specified in an array of
tab-stop positions. Text is written in the currently selected font,
background color, and text color. (Unicode)

[戻り値]
If the function succeeds, the return value is the dimensions, in
logical units, of the string. The height is in the high-order word
and the width is in the low-order word. If the function fails, the
return value is zero.

[備考]
If the nTabPositions parameter is zero and the lpnTabStopPositions
parameter is NULL, tabs are expanded to eight times the average
character width. If nTabPositions is 1, the tab stops are separated
by the distance specified by the first value in the
lpnTabStopPositions array. If the lpnTabStopPositions array contains
more than one value, a tab stop is set for each value in the array,
up to the number specified by nTabPositions. The nTabOrigin parameter
allows an application to call the TabbedTextOut function several
times for a single line. If the application calls TabbedTextOut more
than once with the nTabOrigin set to the same value each time, the
function expands all tabs relative to the position specified by
nTabOrigin. By default, the current position is not used or updated
by the TabbedTextOut function. If an application needs to update the
current position when it calls TabbedTextOut, the application can
call the SetTextAlign function with the wFlags parameter set to
TA_UPDATECP. When this flag is set, the system ignores the X and Y
parameters on subsequent calls to the TabbedTextOut function, using
the current position instead. Note For Windows Vista and later,
TabbedTextOut ignores text alignment when it draws text.
> [!NOTE] > The winuser.h header defines TabbedTextOut as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
TileWindows
Tiles the specified child windows of the specified parent window.
%group
Win32 user32
%prm
hwndParent, wHow, lpRect, cKids, lpKids
hwndParent : [intptr] Type: HWND A handle to the parent window. If this parameter is NULL, the desktop window is assumed.
wHow : [int] Type: UINT
lpRect : [var] Type: const RECT* A pointer to a structure that specifies the rectangular area, in client coordinates, within which the windows are arranged. If this parameter is NULL, the client area of the parent window is used.
cKids : [int] Type: UINT The number of elements in the array specified by the lpKids parameter. This parameter is ignored if lpKids is NULL.
lpKids : [intptr] Type: const HWND* An array of handles to the child windows to arrange. If a specified child window is a top-level window with the style WS_EX_TOPMOST or WS_EX_TOOLWINDOW, the child window is not arranged. If this parameter is NULL, all child windows of the specified parent window (or of the desktop window) are arranged.
%inst
Tiles the specified child windows of the specified parent window.

[戻り値]
Type: WORD If the function succeeds, the return value is the number
of windows arranged. If the function fails, the return value is zero.
To get extended error information, call GetLastError.

[備考]
Calling TileWindows causes all maximized windows to be restored to
their previous size.


%index
ToAscii
Translates the specified virtual-key code and keyboard state to the corresponding character or characters.
%group
Win32 user32
%prm
uVirtKey, uScanCode, lpKeyState, lpChar, uFlags
uVirtKey : [int] Type: UINT The virtual-key code to be translated. See Virtual-Key Codes.
uScanCode : [int] Type: UINT The hardware scan code of the key to be translated. The high-order bit of this value is set if the key is up (not pressed).
lpKeyState : [var] Type: const BYTE* A pointer to a 256-byte array that contains the current keyboard state. Each element (byte) in the array contains the state of one key. If the high-order bit of a byte is set, the key is down (pressed). The low bit, if set, indicates that the key is toggled on. In this function, only the toggle bit of the CAPS LOCK key is relevant. The toggle state of the NUM LOCK and SCROLL LOCK keys is ignored.
lpChar : [var] Type: LPWORD The buffer that receives the translated character or characters. The low-order byte contains first character and the high-order byte contains second character, if present.
uFlags : [int] Type: UINT This parameter must be 1 if a menu is active, or 0 otherwise.
%inst
Translates the specified virtual-key code and keyboard state to the
corresponding character or characters.

[戻り値]
Type: int The return value is one of the following values.
This doc was truncated.

[備考]
The parameters supplied to the ToAscii function might not be
sufficient to translate the virtual-key code, because a previous dead
key is stored in the keyboard layout. Typically, ToAscii performs the
translation based on the virtual-key code. In some cases, however,
bit 15 of the uScanCode parameter may be used to distinguish between
a key press and a key release. The scan code is used for translating
ALT+ number key combinations. Although NUM LOCK is a toggle key that
affects keyboard behavior, ToAscii ignores the toggle setting (the
low bit) of lpKeyState (VK_NUMLOCK) because the uVirtKey parameter
alone is sufficient to distinguish the cursor movement keys (VK_HOME,
VK_INSERT, and so on) from the numeric keys (VK_DECIMAL, VK_NUMPAD0 -
VK_NUMPAD9).


%index
ToAsciiEx
Translates the specified virtual-key code and keyboard state to the corresponding character or characters. The function translates the code using the input language and physical keyboard layout identified by the input locale identifier.
%group
Win32 user32
%prm
uVirtKey, uScanCode, lpKeyState, lpChar, uFlags, dwhkl
uVirtKey : [int] Type: UINT The virtual-key code to be translated. See Virtual-Key Codes.
uScanCode : [int] Type: UINT The hardware scan code of the key to be translated. The high-order bit of this value is set if the key is up (not pressed).
lpKeyState : [var] Type: const BYTE* A pointer to a 256-byte array that contains the current keyboard state. Each element (byte) in the array contains the state of one key. If the high-order bit of a byte is set, the key is down (pressed). The low bit, if set, indicates that the key is toggled on. In this function, only the toggle bit of the CAPS LOCK key is relevant. The toggle state of the NUM LOCK and SCOLL LOCK keys is ignored.
lpChar : [var] Type: LPWORD A pointer to the buffer that receives the translated character or characters. The low-order byte contains first character and the high-order byte contains second character, if present.
uFlags : [int] Type: UINT This parameter must be 1 if a menu is active, zero otherwise.
dwhkl : [intptr] Type: HKL Input locale identifier to use to translate the code. This parameter can be any input locale identifier previously returned by the LoadKeyboardLayout function.
%inst
Translates the specified virtual-key code and keyboard state to the
corresponding character or characters. The function translates the
code using the input language and physical keyboard layout identified
by the input locale identifier.

[戻り値]
Type: int The return value is one of the following values.
This doc was truncated.

[備考]
The input locale identifier is a broader concept than a keyboard
layout, since it can also encompass a speech-to-text converter, an
Input Method Editor (IME), or any other form of input. The parameters
supplied to the ToAsciiEx function might not be sufficient to
translate the virtual-key code, because a previous dead key is stored
in the keyboard layout. Typically, ToAsciiEx performs the translation
based on the virtual-key code. In some cases, however, bit 15 of the
uScanCode parameter may be used to distinguish between a key press
and a key release. The scan code is used for translating ALT+number
key combinations. Although NUM LOCK is a toggle key that affects
keyboard behavior, ToAsciiEx ignores the toggle setting (the low bit)
of lpKeyState (VK_NUMLOCK) because the uVirtKey parameter alone is
sufficient to distinguish the cursor movement keys (VK_HOME,
VK_INSERT, and so on) from the numeric keys (VK_DECIMAL, VK_NUMPAD0 -
VK_NUMPAD9).


%index
ToUnicode
Translates the specified virtual-key code and keyboard state to the corresponding Unicode character or characters. (ToUnicode)
%group
Win32 user32
%prm
wVirtKey, wScanCode, lpKeyState, pwszBuff, cchBuff, wFlags
wVirtKey : [int] Type: UINT The virtual-key code to be translated. See Virtual-Key Codes.
wScanCode : [int] Type: UINT The hardware scan code of the key to be translated. The high-order bit of this value is set if the key is up.
lpKeyState : [var] Type: const BYTE* A pointer to a 256-byte array that contains the current keyboard state. Each element (byte) in the array contains the state of one key. If the high-order bit of a byte is set, the key is down. The low bit, if set, indicates that the key is toggled on. In this function, only the toggle bit of the CAPS LOCK key is relevant. The toggle state of the NUM LOCK and SCROLL LOCK keys is ignored. See GetKeyboardState for more info.
pwszBuff : [wstr] Type: LPWSTR The buffer that receives the translated character or characters as array of UTF-16 code units. This buffer may be returned without being null-terminated even though the variable name suggests that it is null-terminated. You can use the return value of this method to determine how many characters were written.
cchBuff : [int] Type: int The size, in characters, of the buffer pointed to by the pwszBuff parameter.
wFlags : [int] Type: UINT The behavior of the function. If bit 0 is set, a menu is active. In this mode Alt+Numeric keypad key combinations are not handled. If bit 2 is set, keyboard state is not changed (Windows?10, version 1607 and newer) All other bits (through 31) are reserved.
%inst
Translates the specified virtual-key code and keyboard state to the
corresponding Unicode character or characters. (ToUnicode)

[戻り値]
Type: int The function returns one of the following values.
This doc was truncated.

[備考]
To specify a handle to the keyboard layout to use to translate the
specified code, use the ToUnicodeEx function. Some keyboard layouts
may return several characters and/or supplementary characters as
surrogate pairs in pwszBuff. If a dead key character (accent or
diacritic) stored in the keyboard layout could not be combined with
the specified virtual key to form a single character then the
previous entered dead character can be combined with the current
character. The parameters supplied to the ToUnicodeEx function might
not be sufficient to translate the virtual-key code because a
previous dead key is stored in the keyboard layout. Typically,
ToUnicode performs the translation based on the virtual-key code. In
some cases, however, bit 15 of the wScanCode parameter can be used to
distinguish between a key press and a key release (for example for
ALT+numpad key entry). As ToUnicode translates the virtual-key code,
it also changes the state of the kernel-mode keyboard buffer. This
state-change affects dead keys, ligatures, Alt+Numeric keypad key
entry, and so on. It might also cause undesired side-effects if used
in conjunction with TranslateMessage (which also changes the state of
the kernel-mode keyboard buffer).


%index
ToUnicodeEx
Translates the specified virtual-key code and keyboard state to the corresponding Unicode character or characters. (ToUnicodeEx)
%group
Win32 user32
%prm
wVirtKey, wScanCode, lpKeyState, pwszBuff, cchBuff, wFlags, dwhkl
wVirtKey : [int] Type: UINT The virtual-key code to be translated. See Virtual-Key Codes.
wScanCode : [int] Type: UINT The hardware scan code of the key to be translated. The high-order bit of this value is set if the key is up.
lpKeyState : [var] Type: const BYTE* A pointer to a 256-byte array that contains the current keyboard state. Each element (byte) in the array contains the state of one key. If the high-order bit of a byte is set, the key is down. The low bit, if set, indicates that the key is toggled on. In this function, only the toggle bit of the CAPS LOCK key is relevant. The toggle state of the NUM LOCK and SCROLL LOCK keys is ignored. See GetKeyboardState for more info.
pwszBuff : [wstr] Type: LPWSTR The buffer that receives the translated character or characters as array of UTF-16 code units. This buffer may be returned without being null-terminated even though the variable name suggests that it is null-terminated. You can use the return value of this method to determine how many characters were written.
cchBuff : [int] Type: int The size, in characters, of the buffer pointed to by the pwszBuff parameter.
wFlags : [int] Type: UINT The behavior of the function. If bit 0 is set, a menu is active. In this mode Alt+Numeric keypad key combinations are not handled. If bit 1 is set, **ToUnicodeEx** will translate scancodes marked as key break events in addition to its usual treatment of key make events. If bit 2 is set, keyboard state is not changed (Windows?10, version 1607 and newer) All other bits (through 31) are reserved.
dwhkl : [intptr] Type: HKL The input locale identifier used to translate the specified code. This parameter can be any input locale identifier previously returned by the LoadKeyboardLayout function.
%inst
Translates the specified virtual-key code and keyboard state to the
corresponding Unicode character or characters. (ToUnicodeEx)

[戻り値]
Type: int The function returns one of the following values.
This doc was truncated.

[備考]
The input locale identifier is a broader concept than a keyboard
layout, since it can also encompass a speech-to-text converter, an
Input Method Editor (IME), or any other form of input. Some keyboard
layouts may return several characters and/or supplementary characters
as surrogate pairs in pwszBuff. If dead key character (accent or
diacritic) stored in the keyboard layout could not be combined with
the specified virtual key to form a single character then the
previous entered dead character can be combined with the current
character. The parameters supplied to the ToUnicodeEx function might
not be sufficient to translate the virtual-key code because a
previous dead key is stored in the keyboard layout. Typically,
ToUnicodeEx performs the translation based on the virtual-key code.
In some cases, however, bit 15 of the wScanCode parameter can be used
to distinguish between a key press and a key release (for example for
ALT+numpad key entry). As ToUnicodeEx translates the virtual-key
code, it also changes the state of the kernel-mode keyboard buffer.
This state-change affects dead keys, ligatures, Alt+Numeric keypad
key entry, and so on. It might also cause undesired side-effects if
used in conjunction with TranslateMessage (which also changes the
state of the kernel-mode keyboard buffer).


%index
TrackMouseEvent
Posts messages when the mouse pointer leaves a window or hovers over a window for a specified amount of time.
%group
Win32 user32
%prm
lpEventTrack
lpEventTrack : [var] Type: LPTRACKMOUSEEVENT A pointer to a TRACKMOUSEEVENT structure that contains tracking information.
%inst
Posts messages when the mouse pointer leaves a window or hovers over
a window for a specified amount of time.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero . If
the function fails, return value is zero. To get extended error
information, call GetLastError.

[備考]
The mouse pointer is considered to be hovering when it stays within a
specified rectangle for a specified period of time. Call
SystemParametersInfo. and use the values SPI_GETMOUSEHOVERWIDTH,
SPI_GETMOUSEHOVERHEIGHT, and SPI_GETMOUSEHOVERTIME to retrieve the
size of the rectangle and the time. The function can post the
following messages.
This doc was truncated.


%index
TrackPopupMenu
Displays a shortcut menu at the specified location and tracks the selection of items on the menu. The shortcut menu can appear anywhere on the screen.
%group
Win32 user32
%prm
hMenu, uFlags, x, y, nReserved, hWnd, prcRect
hMenu : [intptr] Type: HMENU A handle to the shortcut menu to be displayed. The handle can be obtained by calling CreatePopupMenu to create a new shortcut menu, or by calling GetSubMenu to retrieve a handle to a submenu associated with an existing menu item.
uFlags : [int] Type: UINT Use zero of more of these flags to specify function options.
x : [int] Type: int The horizontal location of the shortcut menu, in screen coordinates.
y : [int] Type: int The vertical location of the shortcut menu, in screen coordinates.
nReserved : [int] Type: int Reserved; must be zero.
hWnd : [intptr] Type: HWND A handle to the window that owns the shortcut menu. This window receives all messages from the menu. The window does not receive a WM_COMMAND message from the menu until the function returns. If you specify TPM_NONOTIFY in the uFlags parameter, the function does not send messages to the window identified by hWnd. However, you must still pass a window handle in hWnd. It can be any window handle from your application.
prcRect : [var] Type: const RECT* Ignored.
%inst
Displays a shortcut menu at the specified location and tracks the
selection of items on the menu. The shortcut menu can appear anywhere
on the screen.

[戻り値]
Type: BOOL If you specify TPM_RETURNCMD in the uFlags parameter, the
return value is the menu-item identifier of the item that the user
selected. If the user cancels the menu without making a selection, or
if an error occurs, the return value is zero. If you do not specify
TPM_RETURNCMD in the uFlags parameter, the return value is nonzero if
the function succeeds and zero if it fails. To get extended error
information, call GetLastError.

[備考]
Call GetSystemMetrics with SM_MENUDROPALIGNMENT to determine the
correct horizontal alignment flag (TPM_LEFTALIGN or TPM_RIGHTALIGN)
and/or horizontal animation direction flag (TPM_HORPOSANIMATION or
TPM_HORNEGANIMATION) to pass to TrackPopupMenu or TrackPopupMenuEx.
This is essential for creating an optimal user experience, especially
when developing Microsoft Tablet PC applications. To specify an area
of the screen that the menu should not overlap, use the
TrackPopupMenuEx function To display a context menu for a
notification icon, the current window must be the foreground window
before the application calls TrackPopupMenu or TrackPopupMenuEx.
Otherwise, the menu will not disappear when the user clicks outside
of the menu or the window that created the menu (if it is visible).
If the current window is a child window, you must set the (top-level)
parent window as the foreground window. However, when the current
window is the foreground window, the second time this menu is
displayed, it appears and then immediately disappears. To correct
this, you must force a task switch to the application that called
TrackPopupMenu. This is done by posting a benign message to the
window or thread, as shown in the following code sample:
This doc was truncated.


%index
TrackPopupMenuEx
Displays a shortcut menu at the specified location and tracks the selection of items on the shortcut menu. The shortcut menu can appear anywhere on the screen.
%group
Win32 user32
%prm
hMenu, uFlags, x, y, hwnd, lptpm
hMenu : [intptr] Type: HMENU A handle to the shortcut menu to be displayed. This handle can be obtained by calling the CreatePopupMenu function to create a new shortcut menu or by calling the GetSubMenu function to retrieve a handle to a submenu associated with an existing menu item.
uFlags : [int] Type: UINT Specifies function options.
x : [int] Type: int The horizontal location of the shortcut menu, in screen coordinates.
y : [int] Type: int The vertical location of the shortcut menu, in screen coordinates.
hwnd : [intptr] Type: HWND A handle to the window that owns the shortcut menu. This window receives all messages from the menu. The window does not receive a WM_COMMAND message from the menu until the function returns. If you specify TPM_NONOTIFY in the fuFlags parameter, the function does not send messages to the window identified by hwnd. However, you must still pass a window handle in hwnd. It can be any window handle from your application.
lptpm : [var] Type: LPTPMPARAMS A pointer to a TPMPARAMS structure that specifies an area of the screen the menu should not overlap. This parameter can be NULL.
%inst
Displays a shortcut menu at the specified location and tracks the
selection of items on the shortcut menu. The shortcut menu can appear
anywhere on the screen.

[戻り値]
Type: BOOL If you specify TPM_RETURNCMD in the fuFlags parameter, the
return value is the menu-item identifier of the item that the user
selected. If the user cancels the menu without making a selection, or
if an error occurs, the return value is zero. If you do not specify
TPM_RETURNCMD in the fuFlags parameter, the return value is nonzero
if the function succeeds and zero if it fails. To get extended error
information, call GetLastError.

[備考]
Call GetSystemMetrics with SM_MENUDROPALIGNMENT to determine the
correct horizontal alignment flag (TPM_LEFTALIGN or TPM_RIGHTALIGN)
and/or horizontal animation direction flag (TPM_HORPOSANIMATION or
TPM_HORNEGANIMATION) to pass to TrackPopupMenu or TrackPopupMenuEx.
This is essential for creating an optimal user experience, especially
when developing Microsoft Tablet PC applications. To display a
context menu for a notification icon, the current window must be the
foreground window before the application calls TrackPopupMenu or
TrackPopupMenuEx. Otherwise, the menu will not disappear when the
user clicks outside of the menu or the window that created the menu
(if it is visible). If the current window is a child window, you must
set the (top-level) parent window as the foreground window.


%index
TranslateAcceleratorW
Processes accelerator keys for menu commands. (Unicode)
%group
Win32 user32
%prm
hWnd, hAccTable, lpMsg
hWnd : [intptr] Type: HWND A handle to the window whose messages are to be translated.
hAccTable : [intptr] Type: HACCEL A handle to the accelerator table. The accelerator table must have been loaded by a call to the LoadAccelerators function or created by a call to the CreateAcceleratorTable function.
lpMsg : [var] Type: LPMSG A pointer to an MSG structure that contains message information retrieved from the calling thread's message queue using the GetMessage or PeekMessage function.
%inst
Processes accelerator keys for menu commands. (Unicode)

[戻り値]
Type: int If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
To differentiate the message that this function sends from messages
sent by menus or controls, the high-order word of the wParam
parameter of the WM_COMMAND or WM_SYSCOMMAND message contains the
value 1. Accelerator key combinations used to select items from the
window menu are translated into WM_SYSCOMMAND messages; all other
accelerator key combinations are translated into WM_COMMAND messages.
When TranslateAccelerator returns a nonzero value and the message is
translated, the application should not use the TranslateMessage
function to process the message again. An accelerator need not
correspond to a menu command. If the accelerator command corresponds
to a menu item, the application is sent WM_INITMENU and
WM_INITMENUPOPUP messages, as if the user were trying to display the
menu. However, these messages are not sent if any of the following
conditions exist:
This doc was truncated.


%index
TranslateMDISysAccel
Processes accelerator keystrokes for window menu commands of the multiple-document interface (MDI) child windows associated with the specified MDI client window.
%group
Win32 user32
%prm
hWndClient, lpMsg
hWndClient : [intptr] Type: HWND A handle to the MDI client window.
lpMsg : [var] Type: LPMSG A pointer to a message retrieved by using the GetMessage or PeekMessage function. The message must be an MSG structure and contain message information from the application's message queue.
%inst
Processes accelerator keystrokes for window menu commands of the
multiple-document interface (MDI) child windows associated with the
specified MDI client window.

[戻り値]
Type: BOOL If the message is translated into a system command, the
return value is nonzero. If the message is not translated into a
system command, the return value is zero.


%index
TranslateMessage
仮想キーメッセージを文字メッセージに翻訳する。文字メッセージは呼び出し元スレッドのメッセージキューに投稿され、次に GetMessage または PeekMessage が呼ばれたときに読み取られる。
%group
Win32 user32
%prm
lpMsg
lpMsg : [var] 型: const MSG* GetMessage または PeekMessage でスレッドメッセージキューから取得したメッセージ情報を含む MSG 構造体へのポインタ。
%inst
仮想キーメッセージを文字メッセージに翻訳する。文字メッセージは呼び出し元スレッドのメッセージキューに投稿され、次に GetMessage
または PeekMessage が呼ばれたときに読み取られる。

[戻り値]
型: BOOL メッセージが翻訳された場合(文字メッセージがキューに投稿された場合)、戻り値は 0
以外。WM_KEYDOWN、WM_KEYUP、WM_SYSKEYDOWN、WM_SYSKEYUP の場合、翻訳の有無に関わらず 0
以外。翻訳されなかった場合は 0。

[備考]
TranslateMessage は lpMsg が指すメッセージを変更しない。WM_KEYDOWN と WM_KEYUP の組み合わせは
WM_CHAR または WM_DEADCHAR を生成する。WM_SYSKEYDOWN と WM_SYSKEYUP の組み合わせは
WM_SYSCHAR または WM_SYSDEADCHAR を生成する。TranslateMessage はキーボードドライバによって
ASCII 文字にマップされるキーのみ WM_CHAR を生成する。アプリケーションが仮想キーメッセージを他の目的で処理する場合は
TranslateMessage を呼ぶべきでない。


%index
UnhookWindowsHook
(no summary)
%group
Win32 user32
%prm
nCode, pfnFilterProc
nCode : [int] 
pfnFilterProc : [int] 
%inst



%index
UnionRect
The UnionRect function creates the union of two rectangles. The union is the smallest rectangle that contains both source rectangles.
%group
Win32 user32
%prm
lprcDst, lprcSrc1, lprcSrc2
lprcDst : [var] A pointer to the RECT structure that will receive a rectangle containing the rectangles pointed to by the lprcSrc1 and lprcSrc2 parameters.
lprcSrc1 : [var] A pointer to the RECT structure that contains the first source rectangle.
lprcSrc2 : [var] A pointer to the RECT structure that contains the second source rectangle.
%inst
The UnionRect function creates the union of two rectangles. The union
is the smallest rectangle that contains both source rectangles.

[戻り値]
If the specified structure contains a nonempty rectangle, the return
value is nonzero. If the specified structure does not contain a
nonempty rectangle, the return value is zero.

[備考]
The system ignores the dimensions of an empty rectangle that is, a
rectangle in which all coordinates are set to zero, so that it has no
height or no width. Because applications can use rectangles for
different purposes, the rectangle functions do not use an explicit
unit of measure. Instead, all rectangle coordinates and dimensions
are given in signed, logical values. The mapping mode and the
function in which the rectangle is used determine the units of
measure.


%index
UnpackDDElParam
Unpacks a Dynamic Data Exchange (DDE)lParam value received from a posted DDE message.
%group
Win32 user32
%prm
msg, lParam, puiLo, puiHi
msg : [int] Type: UINT The posted DDE message.
lParam : [intptr] Type: LPARAM The lParam parameter of the posted DDE message that was received. The application must free the memory object specified by the lParam parameter by calling the FreeDDElParam function.
puiLo : [var] Type: PUINT_PTR A pointer to a variable that receives the low-order word of lParam.
puiHi : [var] Type: PUINT_PTR A pointer to a variable that receives the high-order word of lParam.
%inst
Unpacks a Dynamic Data Exchange (DDE)lParam value received from a
posted DDE message.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero.

[備考]
PackDDElParam eases the porting of 16-bit DDE applications to 32-bit
DDE applications.


%index
UnregisterClassW
Unregisters a window class, freeing the memory required for the class. (Unicode)
%group
Win32 user32
%prm
lpClassName, hInstance
lpClassName : [wstr] Type: LPCTSTR A null-terminated string or a class atom. If lpClassName is a string, it specifies the window class name. This class name must have been registered by a previous call to the RegisterClass or RegisterClassEx function. System classes, such as dialog box controls, cannot be unregistered. If this parameter is an atom, it must be a class atom created by a previous call to the RegisterClass or RegisterClassEx function. The atom must be in the low-order word of lpClassName; the high-order word must be zero.
hInstance : [intptr] Type: HINSTANCE A handle to the instance of the module that created the class.
%inst
Unregisters a window class, freeing the memory required for the
class. (Unicode)

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the class could not be found or if a window still exists that was
created with the class, the return value is zero. To get extended
error information, call GetLastError.

[備考]
Before calling this function, an application must destroy all windows
created with the specified class. All window classes that an
application registers are unregistered when it terminates. Class
atoms are special atoms returned only by RegisterClass and
RegisterClassEx. No window classes registered by a DLL are
unregistered when the .dll is unloaded.
> [!NOTE] > The winuser.h header defines UnregisterClass as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
UnregisterHotKey
Frees a hot key previously registered by the calling thread.
%group
Win32 user32
%prm
hWnd, id
hWnd : [intptr] Type: HWND A handle to the window associated with the hot key to be freed. This parameter should be NULL if the hot key is not associated with a window.
id : [int] Type: int The identifier of the hot key to be freed.
%inst
Frees a hot key previously registered by the calling thread.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
UnregisterPointerInputTarget
Allows the caller to unregister a target window to which all pointer input of the specified type is redirected.
%group
Win32 user32
%prm
hwnd, pointerType
hwnd : [intptr] Window to be un-registered as a global redirection target on its desktop.
pointerType : [int] Type of pointer input to no longer be redirected to the specified window. This is any valid and supported value from the POINTER_INPUT_TYPE  enumeration. Note that the generic PT_POINTER type and the PT_MOUSE type are not valid in this parameter.
%inst
Allows the caller to unregister a target window to which all pointer
input of the specified type is redirected.

[戻り値]
If the function succeeds, the return value is non-zero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
An application that has successfully called the
RegisterPointerInputTarget function can call this function to
un-register the window from the role of global redirected target for
the specified pointer type. An application that has registered the
same window as a global redirection target for multiple pointer input
types can call the UnregisterPointerInputTarget to un-register the
window for one of those types while leaving the window registered for
the remaining types. If the calling thread does not have the UI
Access privilege, this function fails with the last error set to
ERROR_ACCESS_DENIED. If the specified pointer input type is not
valid, this function fails with the last error set to
ERROR_INVALID_PARAMETER. If the calling thread does not own the
specified window, this function fails with the last error set to
ERROR_ACCESS_DENIED. If the specified window is not the registered
global redirection target for the specified pointer input type on its
desktop, this function takes no action and returns success.


%index
UnregisterPointerInputTargetEx
UnregisterPointerInputTargetEx may be altered or unavailable. Instead, use UnregisterPointerInputTarget.
%group
Win32 user32
%prm
hwnd, pointerType
hwnd : [intptr] Not supported.
pointerType : [int] Not supported.
%inst
UnregisterPointerInputTargetEx may be altered or unavailable.
Instead, use UnregisterPointerInputTarget.

[戻り値]
Not supported.


%index
UnregisterSuspendResumeNotification
Cancels a registration to receive notification when the system is suspended or resumed. Similar to PowerUnregisterSuspendResumeNotification but operates in user mode.
%group
Win32 user32
%prm
Handle
Handle : [intptr] A handle to a registration obtained by calling the RegisterSuspendResumeNotification function.
%inst
Cancels a registration to receive notification when the system is
suspended or resumed. Similar to
PowerUnregisterSuspendResumeNotification but operates in user mode.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
UnregisterTouchWindow
Registers a window as no longer being touch-capable.
%group
Win32 user32
%prm
hwnd
hwnd : [intptr] The handle of the window. The function fails with ERROR_ACCESS_DENIED if the calling thread does not own the specified window.
%inst
Registers a window as no longer being touch-capable.

[戻り値]
If the function succeeds, the return value is nonzero.
If the function fails, the return value is zero. To get extended
error information, use the GetLastError function.

[備考]
The UnregisterTouchWindow function succeeds even if the specified
window was not previously registered as being touch-capable.


%index
UpdateLayeredWindow
Updates the position, size, shape, content, and translucency of a layered window.
%group
Win32 user32
%prm
hWnd, hdcDst, pptDst, psize, hdcSrc, pptSrc, crKey, pblend, dwFlags
hWnd : [intptr] Type: HWND A handle to a layered window. A layered window is created by specifying WS_EX_LAYERED when creating the window with the CreateWindowEx function. Windows?8:??The WS_EX_LAYERED style is supported for top-level windows and child windows. Previous Windows versions support WS_EX_LAYERED only for top-level windows.
hdcDst : [intptr] Type: HDC A handle to a DC for the screen. This handle is obtained by specifying NULL when calling the GetDC function. It is used for palette color matching when the window contents are updated. If hdcDst is NULL, the default palette will be used. If hdcSrc is NULL, hdcDst must be NULL.
pptDst : [var] Type: POINT* A pointer to a structure that specifies the new screen position of the layered window. If the current position is not changing, pptDst can be NULL.
psize : [var] Type: SIZE* A pointer to a structure that specifies the new size of the layered window. If the size of the window is not changing, psize can be NULL. If hdcSrc is NULL, psize must be NULL.
hdcSrc : [intptr] Type: HDC A handle to a DC for the surface that defines the layered window. This handle can be obtained by calling the CreateCompatibleDC function. If the shape and visual context of the window are not changing, hdcSrc can be NULL.
pptSrc : [var] Type: POINT* A pointer to a structure that specifies the location of the layer in the device context. If hdcSrc is NULL, pptSrc should be NULL.
crKey : [int] Type: COLORREF A structure that specifies the color key to be used when composing the layered window. To generate a COLORREF, use the RGB macro.
pblend : [var] Type: BLENDFUNCTION* A pointer to a structure that specifies the transparency value to be used when composing the layered window.
dwFlags : [int] Type: DWORD
%inst
Updates the position, size, shape, content, and translucency of a
layered window.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The source DC should contain the surface that defines the visible
contents of the layered window. For example, you can select a bitmap
into a device context obtained by calling the CreateCompatibleDC
function. An application should call SetLayout on the hdcSrc device
context to properly set the mirroring mode. SetLayout will properly
mirror all drawing into an HDC while properly preserving text glyph
and (optionally) bitmap direction order. It cannot modify drawing
directly into the bits of a device-independent bitmap (DIB). For more
information, see Window Layout and Mirroring. The UpdateLayeredWindow
function maintains the window's appearance on the screen. The windows
underneath a layered window do not need to be repainted when they are
uncovered due to a call to UpdateLayeredWindow, because the system
will automatically repaint them. This permits seamless animation of
the layered window. UpdateLayeredWindow always updates the entire
window. To update part of a window, use the traditional WM_PAINT and
set the blend value using SetLayeredWindowAttributes. For best
drawing performance by the layered window and any underlying windows,
the layered window should be as small as possible. An application
should also process the message and re-create its layered windows
when the display's color depth changes. For more information, see
Layered Windows.


%index
UpdateLayeredWindowIndirect
(no summary)
%group
Win32 user32
%prm
hWnd, pULWInfo
hWnd : [intptr] 
pULWInfo : [var] 
%inst



%index
UpdateWindow
指定されたウィンドウの更新領域が空でない場合、ウィンドウに WM_PAINT メッセージを送信してクライアント領域を更新する。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 更新するウィンドウへのハンドル。
%inst
指定されたウィンドウの更新領域が空でない場合、ウィンドウに WM_PAINT メッセージを送信してクライアント領域を更新する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。


%index
UserHandleGrantAccess
Grants or denies access to a handle to a User object to a job that has a user-interface restriction.
%group
Win32 user32
%prm
hUserHandle, hJob, bGrant
hUserHandle : [intptr] A handle to the User object.
hJob : [intptr] A handle to the job to be granted access to the User handle. The CreateJobObject or OpenJobObject function returns this handle.
bGrant : [int] If this parameter is TRUE, all processes associated with the job can recognize and use the handle. If the parameter is FALSE, the processes cannot use the handle.
%inst
Grants or denies access to a handle to a User object to a job that
has a user-interface restriction.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The UserHandleGrantAccess function can be called only from a process
not associated with the job specified by the hJob parameter. The User
handle must not be owned by a process or thread associated with the
job. To create user-interface restrictions, call the
SetInformationJobObject function with the
JobObjectBasicUIRestrictions job information class.


%index
ValidateRect
The ValidateRect function validates the client area within a rectangle by removing the rectangle from the update region of the specified window.
%group
Win32 user32
%prm
hWnd, lpRect
hWnd : [intptr] Handle to the window whose update region is to be modified. If this parameter is NULL, the system invalidates and redraws all windows and sends the WM_ERASEBKGND and WM_NCPAINT messages to the window procedure before the function returns.
lpRect : [var] Pointer to a RECT structure that contains the client coordinates of the rectangle to be removed from the update region. If this parameter is NULL, the entire client area is removed.
%inst
The ValidateRect function validates the client area within a
rectangle by removing the rectangle from the update region of the
specified window.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The BeginPaint function automatically validates the entire client
area. Neither the ValidateRect nor ValidateRgn function should be
called if a portion of the update region must be validated before the
next WM_PAINT message is generated. The system continues to generate
WM_PAINT messages until the current update region is validated.


%index
ValidateRgn
The ValidateRgn function validates the client area within a region by removing the region from the current update region of the specified window.
%group
Win32 user32
%prm
hWnd, hRgn
hWnd : [intptr] Handle to the window whose update region is to be modified.
hRgn : [intptr] Handle to a region that defines the area to be removed from the update region. If this parameter is NULL, the entire client area is removed.
%inst
The ValidateRgn function validates the client area within a region by
removing the region from the current update region of the specified
window.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The specified region must have been created by a region function. The
region coordinates are assumed to be client coordinates. The
BeginPaint function automatically validates the entire client area.
Neither the ValidateRect nor ValidateRgn function should be called if
a portion of the update region must be validated before the next
WM_PAINT message is generated.


%index
VkKeyScanW
Translates a character to the corresponding virtual-key code and shift state for the current keyboard. (Unicode)
%group
Win32 user32
%prm
ch
ch : [int] Type: TCHAR The character to be translated into a virtual-key code.
%inst
Translates a character to the corresponding virtual-key code and
shift state for the current keyboard. (Unicode)

[戻り値]
Type: SHORT If the function succeeds, the low-order byte of the
return value contains the virtual-key code and the high-order byte
contains the shift state, which can be a combination of the following
flag bits.
This doc was truncated.

[備考]
For keyboard layouts that use the right-hand ALT key as a shift key
(for example, the French keyboard layout), the shift state is
represented by the value 6, because the right-hand ALT key is
converted internally into CTRL+ALT. Translations for the numeric
keypad (VK_NUMPAD0 through VK_DIVIDE) are ignored. This function is
intended to translate characters into keystrokes from the main
keyboard section only. For example, the character "7" is translated
into VK_7, not VK_NUMPAD7. VkKeyScan is used by applications that
send characters by using the WM_KEYUP and WM_KEYDOWN messages.
> [!NOTE] > The winuser.h header defines VkKeyScan as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
VkKeyScanExW
Translates a character to the corresponding virtual-key code and shift state. The function translates the character using the input language and physical keyboard layout identified by the input locale identifier. (Unicode)
%group
Win32 user32
%prm
ch, dwhkl
ch : [int] Type: TCHAR The character to be translated into a virtual-key code.
dwhkl : [intptr] Type: HKL Input locale identifier used to translate the character. This parameter can be any input locale identifier previously returned by the LoadKeyboardLayout function.
%inst
Translates a character to the corresponding virtual-key code and
shift state. The function translates the character using the input
language and physical keyboard layout identified by the input locale
identifier. (Unicode)

[戻り値]
Type: SHORT If the function succeeds, the low-order byte of the
return value contains the virtual-key code and the high-order byte
contains the shift state, which can be a combination of the following
flag bits.
This doc was truncated.

[備考]
The input locale identifier is a broader concept than a keyboard
layout, since it can also encompass a speech-to-text converter, an
Input Method Editor (IME), or any other form of input. For keyboard
layouts that use the right-hand ALT key as a shift key (for example,
the French keyboard layout), the shift state is represented by the
value 6, because the right-hand ALT key is converted internally into
CTRL+ALT. Translations for the numeric keypad (VK_NUMPAD0 through
VK_DIVIDE) are ignored. This function is intended to translate
characters into keystrokes from the main keyboard section only. For
example, the character "7" is translated into VK_7, not VK_NUMPAD7.
VkKeyScanEx is used by applications that send characters by using the
WM_KEYUP and WM_KEYDOWN messages.
> [!NOTE] > The winuser.h header defines VkKeyScanEx as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
WINNLSEnableIME
Temporarily enables or disables an Input Method Editor (IME) and, at the same time, turns on or off the display of all windows owned by the IME.
%group
Win32 user32
%prm
param0, param1
param0 : [intptr] 
param1 : [int] 
%inst
Temporarily enables or disables an Input Method Editor (IME) and, at
the same time, turns on or off the display of all windows owned by
the IME.

[戻り値]
The previous state of the IME. TRUE if it was enabled before this
call, otherwise, FALSE.

[備考]
The terms "enabled" and "disabled" in regard to this function are
defined as follows:
If an IME is disabled, IME_WINDOWUPDATE(FALSE) is issued to the IME,
which responds by deleting the conversion and system windows. With
the IME disabled, keyboard messages are not sent to the IME, but are
sent directly to the application. Even if the IME is disabled, the
API that uses the SendIMEMessageEx function is still valid. If an IME
is enabled, IME_WINDOWUPDATE(TRUE) is issued to the IME, which
responds by redisplaying the conversion and system windows. With the
IME enabled, keyboard messages are sent to the IME.


%index
WINNLSGetEnableStatus
(no summary)
%group
Win32 user32
%prm
param0
param0 : [intptr] 
%inst



%index
WINNLSGetIMEHotkey
(no summary)
%group
Win32 user32
%prm
param0
param0 : [intptr] 
%inst



%index
WaitForInputIdle
Waits until the specified process has finished processing its initial input and is waiting for user input with no input pending, or until the time-out interval has elapsed.
%group
Win32 user32
%prm
hProcess, dwMilliseconds
hProcess : [intptr] A handle to the process. If this process is a console application or does not have a message queue, WaitForInputIdle returns immediately.
dwMilliseconds : [int] The time-out interval, in milliseconds. If dwMilliseconds is INFINITE, the function does not return until the process is idle.
%inst
Waits until the specified process has finished processing its initial
input and is waiting for user input with no input pending, or until
the time-out interval has elapsed.

[戻り値]
The following table shows the possible return values for this
function.
This doc was truncated.

[備考]
The WaitForInputIdle function enables a thread to suspend its
execution until the specified process has finished its initialization
and is waiting for user input with no input pending. If the process
has multiple threads, the WaitForInputIdle function returns as soon
as any thread becomes idle. WaitForInputIdle can be used at any time,
not just during application startup. However, WaitForInputIdle waits
only once for a process to become idle; subsequent WaitForInputIdle
calls return immediately, whether the process is idle or busy.
WaitForInputIdle can be useful for synchronizing a parent process and
a newly created child process. When a parent process creates a child
process, the CreateProcess function returns without waiting for the
child process to finish its initialization. Before trying to
communicate with the child process, the parent process can use the
WaitForInputIdle function to determine when the child's
initialization has been completed. For example, the parent process
should use the WaitForInputIdle function before trying to find a
window associated with the child process.


%index
WaitMessage
Yields control to other threads when a thread has no other messages in its message queue. The WaitMessage function suspends the thread and does not return until a new message is placed in the thread's message queue.
%group
Win32 user32
%prm

%inst
Yields control to other threads when a thread has no other messages
in its message queue. The WaitMessage function suspends the thread
and does not return until a new message is placed in the thread's
message queue.

[戻り値]
Type: BOOL If the function succeeds, the return value is nonzero. If
the function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Note that WaitMessage does not return if there is unread input in the
message queue after the thread has called a function to check the
queue. This is because functions such as PeekMessage, GetMessage,
GetQueueStatus, WaitMessage, MsgWaitForMultipleObjects, and
MsgWaitForMultipleObjectsEx check the queue and then change the state
information for the queue so that the input is no longer considered
new. A subsequent call to WaitMessage will not return until new input
of the specified type arrives. The existing unread input (received
prior to the last time the thread checked the queue) is ignored.


%index
WinHelpW
Launches Windows Help (Winhelp.exe) and passes additional data that indicates the nature of the help requested by the application. (Unicode)
%group
Win32 user32
%prm
hWndMain, lpszHelp, uCommand, dwData
hWndMain : [intptr] Type: HWND A handle to the window requesting help. The WinHelp function uses this handle to keep track of which applications have requested help. If the uCommand parameter specifies HELP_CONTEXTMENU or HELP_WM_HELP, hWndMain identifies the control requesting help.
lpszHelp : [wstr] Type: LPCTSTR The address of a null-terminated string containing the path, if necessary, and the name of the Help file that WinHelp is to display.
uCommand : [int] Type: UINT The type of help requested. For a list of possible values and how they affect the value to place in the dwData parameter, see the Remarks section.
dwData : [int] Type: ULONG_PTR Additional data. The value used depends on the value of the uCommand parameter. For a list of possible dwData values, see the Remarks section.
%inst
Launches Windows Help (Winhelp.exe) and passes additional data that
indicates the nature of the help requested by the application.
(Unicode)

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise. To
retrieve extended error information, call GetLastError.

[備考]
Before closing the window that requested help, the application must
call WinHelp with the uCommand parameter set to HELP_QUIT. Until all
applications have done this, Windows Help will not terminate. Note
that calling Windows Help with the HELP_QUIT command is not necessary
if you used the HELP_CONTEXTPOPUP command to start Windows Help. This
function fails if called from any context but the current user. The
following table shows the possible values for the uCommand parameter
and the corresponding formats of the dwData parameter.
This doc was truncated.


%index
WindowFromDC
The WindowFromDC function returns a handle to the window associated with the specified display device context (DC). Output functions that use the specified device context draw into this window.
%group
Win32 user32
%prm
hDC
hDC : [intptr] Handle to the device context from which a handle to the associated window is to be retrieved.
%inst
The WindowFromDC function returns a handle to the window associated
with the specified display device context (DC). Output functions that
use the specified device context draw into this window.

[戻り値]
The return value is a handle to the window associated with the
specified DC. If no window is associated with the specified DC, the
return value is NULL.


%index
WindowFromPhysicalPoint
Retrieves a handle to the window that contains the specified physical point.
%group
Win32 user32
%prm
Point
Point : [int] Type: POINT The physical coordinates of the point.
%inst
Retrieves a handle to the window that contains the specified physical
point.

[戻り値]
Type: HWND A handle to the window that contains the given physical
point. If no window exists at the point, this value is NULL.

[備考]
The WindowFromPhysicalPoint function does not retrieve a handle to a
hidden or disabled window, even if the point is within the window.


%index
WindowFromPoint
Retrieves a handle to the window that contains the specified point.
%group
Win32 user32
%prm
Point
Point : [int] Type: POINT The point to be checked.
%inst
Retrieves a handle to the window that contains the specified point.

[戻り値]
Type: HWND The return value is a handle to the window that contains
the point. If no window exists at the given point, the return value
is NULL. If the point is over a static text control, the return value
is a handle to the window under the static text control.

[備考]
The WindowFromPoint function does not retrieve a handle to a hidden
or disabled window, even if the point is within the window. An
application should use the ChildWindowFromPoint function for a
nonrestrictive search.

