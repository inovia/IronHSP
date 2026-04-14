; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    user32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __user32_gen2_as__
#define __user32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "user32.dll"
; winmdroot.Foundation.BOOL UnloadKeyboardLayout(winmdroot.UI.Input.KeyboardAndMouse.HKL hkl)
#cfunc UnloadKeyboardLayout "UnloadKeyboardLayout" intptr

; winmdroot.UI.Input.KeyboardAndMouse.HKL ActivateKeyboardLayout(winmdroot.UI.Input.KeyboardAndMouse.HKL hkl, winmdroot.UI.Input.KeyboardAndMouse.ACTIVATE_KEYBOARD_LAYOUT_FLAGS Flags)
#cfunc ActivateKeyboardLayout "ActivateKeyboardLayout" intptr, int

; winmdroot.Foundation.BOOL AddClipboardFormatListener(winmdroot.Foundation.HWND hwnd)
#cfunc AddClipboardFormatListener "AddClipboardFormatListener" intptr

; winmdroot.Foundation.BOOL AdjustWindowRect(winmdroot.Foundation.RECT* lpRect, winmdroot.UI.WindowsAndMessaging.WINDOW_STYLE dwStyle, winmdroot.Foundation.BOOL bMenu)
#cfunc AdjustWindowRect "AdjustWindowRect" var, int, int

; winmdroot.Foundation.BOOL AdjustWindowRectEx(winmdroot.Foundation.RECT* lpRect, winmdroot.UI.WindowsAndMessaging.WINDOW_STYLE dwStyle, winmdroot.Foundation.BOOL bMenu, winmdroot.UI.WindowsAndMessaging.WINDOW_EX_STYLE dwExStyle)
#cfunc AdjustWindowRectEx "AdjustWindowRectEx" var, int, int, int

; winmdroot.Foundation.BOOL AdjustWindowRectExForDpi(winmdroot.Foundation.RECT* lpRect, winmdroot.UI.WindowsAndMessaging.WINDOW_STYLE dwStyle, winmdroot.Foundation.BOOL bMenu, winmdroot.UI.WindowsAndMessaging.WINDOW_EX_STYLE dwExStyle, uint dpi)
#cfunc AdjustWindowRectExForDpi "AdjustWindowRectExForDpi" var, int, int, int, int

; winmdroot.Foundation.BOOL AllowSetForegroundWindow(uint dwProcessId)
#cfunc AllowSetForegroundWindow "AllowSetForegroundWindow" int

; winmdroot.Foundation.BOOL AnimateWindow(winmdroot.Foundation.HWND hWnd, uint dwTime, winmdroot.UI.WindowsAndMessaging.ANIMATE_WINDOW_FLAGS dwFlags)
#cfunc AnimateWindow "AnimateWindow" intptr, int, int

; winmdroot.Foundation.BOOL AnyPopup()
#cfunc AnyPopup "AnyPopup"

; winmdroot.Foundation.BOOL DestroyMenu(winmdroot.UI.WindowsAndMessaging.HMENU hMenu)
#cfunc DestroyMenu "DestroyMenu" intptr

; winmdroot.Foundation.BOOL AppendMenu(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, winmdroot.UI.WindowsAndMessaging.MENU_ITEM_FLAGS uFlags, nuint uIDNewItem, winmdroot.Foundation.PCWSTR lpNewItem)
#cfunc AppendMenuW "AppendMenuW" intptr, int, int, wstr

; winmdroot.Foundation.BOOL AreDpiAwarenessContextsEqual(winmdroot.UI.HiDpi.DPI_AWARENESS_CONTEXT dpiContextA, winmdroot.UI.HiDpi.DPI_AWARENESS_CONTEXT dpiContextB)
#cfunc AreDpiAwarenessContextsEqual "AreDpiAwarenessContextsEqual" intptr, intptr

; uint ArrangeIconicWindows(winmdroot.Foundation.HWND hWnd)
#cfunc ArrangeIconicWindows "ArrangeIconicWindows" intptr

; winmdroot.Foundation.BOOL AttachThreadInput(uint idAttach, uint idAttachTo, winmdroot.Foundation.BOOL fAttach)
#cfunc AttachThreadInput "AttachThreadInput" int, int, int

; winmdroot.UI.WindowsAndMessaging.HDWP BeginDeferWindowPos(int nNumWindows)
#cfunc BeginDeferWindowPos "BeginDeferWindowPos" int

; winmdroot.Graphics.Gdi.HDC BeginPaint(winmdroot.Foundation.HWND hWnd, winmdroot.Graphics.Gdi.PAINTSTRUCT* lpPaint)
#cfunc BeginPaint "BeginPaint" intptr, var

; winmdroot.Foundation.BOOL BlockInput(winmdroot.Foundation.BOOL fBlockIt)
#cfunc BlockInput "BlockInput" int

; winmdroot.Foundation.BOOL BringWindowToTop(winmdroot.Foundation.HWND hWnd)
#cfunc BringWindowToTop "BringWindowToTop" intptr

; int BroadcastSystemMessage(winmdroot.System.StationsAndDesktops.BROADCAST_SYSTEM_MESSAGE_FLAGS flags, [Optional] winmdroot.System.StationsAndDesktops.BROADCAST_SYSTEM_MESSAGE_INFO* lpInfo, uint Msg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam)
#cfunc BroadcastSystemMessageW "BroadcastSystemMessageW" int, var, int, intptr, intptr

; winmdroot.Foundation.BOOL CloseDesktop(winmdroot.System.StationsAndDesktops.HDESK hDesktop)
#cfunc CloseDesktop "CloseDesktop" intptr

; int BroadcastSystemMessageEx(winmdroot.System.StationsAndDesktops.BROADCAST_SYSTEM_MESSAGE_FLAGS flags, [Optional] winmdroot.System.StationsAndDesktops.BROADCAST_SYSTEM_MESSAGE_INFO* lpInfo, uint Msg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam, [Optional] winmdroot.System.StationsAndDesktops.BSMINFO* pbsmInfo)
#cfunc BroadcastSystemMessageExW "BroadcastSystemMessageExW" int, var, int, intptr, intptr, var

; winmdroot.Foundation.BOOL CalculatePopupWindowPosition(global::System.Drawing.Point* anchorPoint, winmdroot.Foundation.SIZE* windowSize, uint flags, [Optional] winmdroot.Foundation.RECT* excludeRect, winmdroot.Foundation.RECT* popupWindowPosition)
#cfunc CalculatePopupWindowPosition "CalculatePopupWindowPosition" var, var, int, var, var

; winmdroot.Foundation.BOOL CallMsgFilterW(winmdroot.UI.WindowsAndMessaging.MSG* lpMsg, int nCode)
#cfunc CallMsgFilterW "CallMsgFilterW" var, int

; winmdroot.Foundation.BOOL UnhookWindowsHookEx(winmdroot.UI.WindowsAndMessaging.HHOOK hhk)
#cfunc UnhookWindowsHookEx "UnhookWindowsHookEx" intptr

; winmdroot.Foundation.LRESULT CallNextHookEx(winmdroot.UI.WindowsAndMessaging.HHOOK hhk, int nCode, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam)
#cfunc CallNextHookEx "CallNextHookEx" intptr, int, intptr, intptr

; winmdroot.Foundation.LRESULT CallWindowProcW(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,uint,global::Windows.Win32.Foundation.WPARAM,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.LRESULT> lpPrevWndFunc, winmdroot.Foundation.HWND hWnd, uint Msg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam)
#cfunc CallWindowProcW "CallWindowProcW" int, intptr, int, intptr, intptr

; winmdroot.Foundation.BOOL CancelShutdown()
#cfunc CancelShutdown "CancelShutdown"

; ushort CascadeWindows(winmdroot.Foundation.HWND hwndParent, winmdroot.UI.WindowsAndMessaging.CASCADE_WINDOWS_HOW wHow, [Optional] winmdroot.Foundation.RECT* lpRect, uint cKids, [Optional] winmdroot.Foundation.HWND* lpKids)
#cfunc CascadeWindows "CascadeWindows" intptr, int, var, int, intptr

; winmdroot.Foundation.BOOL ChangeClipboardChain(winmdroot.Foundation.HWND hWndRemove, winmdroot.Foundation.HWND hWndNewNext)
#cfunc ChangeClipboardChain "ChangeClipboardChain" intptr, intptr

; winmdroot.Graphics.Gdi.DISP_CHANGE ChangeDisplaySettingsW([Optional] winmdroot.Graphics.Gdi.DEVMODEW* lpDevMode, winmdroot.Graphics.Gdi.CDS_TYPE dwFlags)
#cfunc ChangeDisplaySettingsW "ChangeDisplaySettingsW" var, int

; winmdroot.Graphics.Gdi.DISP_CHANGE ChangeDisplaySettingsExW(winmdroot.Foundation.PCWSTR lpszDeviceName, [Optional] winmdroot.Graphics.Gdi.DEVMODEW* lpDevMode, winmdroot.Foundation.HWND hwnd, winmdroot.Graphics.Gdi.CDS_TYPE dwflags, [Optional] void* lParam)
#cfunc ChangeDisplaySettingsExW "ChangeDisplaySettingsExW" wstr, var, intptr, int, intptr

; winmdroot.Foundation.BOOL ChangeMenuW(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, uint cmd, winmdroot.Foundation.PCWSTR lpszNewItem, uint cmdInsert, uint flags)
#cfunc ChangeMenuW "ChangeMenuW" intptr, int, wstr, int, int

; winmdroot.Foundation.BOOL ChangeWindowMessageFilter(uint message, winmdroot.UI.WindowsAndMessaging.CHANGE_WINDOW_MESSAGE_FILTER_FLAGS dwFlag)
#cfunc ChangeWindowMessageFilter "ChangeWindowMessageFilter" int, int

; winmdroot.Foundation.BOOL ChangeWindowMessageFilterEx(winmdroot.Foundation.HWND hwnd, uint message, winmdroot.UI.WindowsAndMessaging.WINDOW_MESSAGE_FILTER_ACTION action, [Optional] winmdroot.UI.WindowsAndMessaging.CHANGEFILTERSTRUCT* pChangeFilterStruct)
#cfunc ChangeWindowMessageFilterEx "ChangeWindowMessageFilterEx" intptr, int, int, var

; winmdroot.Foundation.PWSTR CharLower(winmdroot.Foundation.PWSTR lpsz)
#cfunc CharLowerW "CharLowerW" wstr

; uint CharLowerBuffW(winmdroot.Foundation.PWSTR lpsz, uint cchLength)
#cfunc CharLowerBuffW "CharLowerBuffW" wstr, int

; winmdroot.Foundation.PWSTR CharNextW(winmdroot.Foundation.PCWSTR lpsz)
#cfunc CharNextW "CharNextW" wstr

; winmdroot.Foundation.PWSTR CharPrevW(winmdroot.Foundation.PCWSTR lpszStart, winmdroot.Foundation.PCWSTR lpszCurrent)
#cfunc CharPrevW "CharPrevW" wstr, wstr

; winmdroot.Foundation.BOOL CharToOem(winmdroot.Foundation.PCWSTR pSrc, winmdroot.Foundation.PSTR pDst)
#cfunc CharToOemW "CharToOemW" wstr, str

; winmdroot.Foundation.BOOL CharToOemBuff(winmdroot.Foundation.PCWSTR lpszSrc, winmdroot.Foundation.PSTR lpszDst, uint cchDstLength)
#cfunc CharToOemBuffW "CharToOemBuffW" wstr, str, int

; winmdroot.Foundation.PWSTR CharUpper(winmdroot.Foundation.PWSTR lpsz)
#cfunc CharUpperW "CharUpperW" wstr

; uint CharUpperBuffW(winmdroot.Foundation.PWSTR lpsz, uint cchLength)
#cfunc CharUpperBuffW "CharUpperBuffW" wstr, int

; winmdroot.Foundation.BOOL CheckDlgButton(winmdroot.Foundation.HWND hDlg, int nIDButton, winmdroot.UI.Controls.DLG_BUTTON_CHECK_STATE uCheck)
#cfunc CheckDlgButton "CheckDlgButton" intptr, int, int

; uint CheckMenuItem(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, uint uIDCheckItem, uint uCheck)
#cfunc CheckMenuItem "CheckMenuItem" intptr, int, int

; winmdroot.Foundation.BOOL CheckMenuRadioItem(winmdroot.UI.WindowsAndMessaging.HMENU hmenu, uint first, uint last, uint check, uint flags)
#cfunc CheckMenuRadioItem "CheckMenuRadioItem" intptr, int, int, int, int

; winmdroot.Foundation.BOOL CheckRadioButton(winmdroot.Foundation.HWND hDlg, int nIDFirstButton, int nIDLastButton, int nIDCheckButton)
#cfunc CheckRadioButton "CheckRadioButton" intptr, int, int, int

; winmdroot.Foundation.HWND ChildWindowFromPoint(winmdroot.Foundation.HWND hWndParent, global::System.Drawing.Point Point)
#cfunc ChildWindowFromPoint "ChildWindowFromPoint" intptr, int

; winmdroot.Foundation.HWND ChildWindowFromPointEx(winmdroot.Foundation.HWND hwnd, global::System.Drawing.Point pt, winmdroot.UI.WindowsAndMessaging.CWP_FLAGS flags)
#cfunc ChildWindowFromPointEx "ChildWindowFromPointEx" intptr, int, int

; winmdroot.Foundation.BOOL ClientToScreen(winmdroot.Foundation.HWND hWnd, global::System.Drawing.Point* lpPoint)
#cfunc ClientToScreen "ClientToScreen" intptr, var

; winmdroot.Foundation.BOOL ClipCursor([Optional] winmdroot.Foundation.RECT* lpRect)
#cfunc ClipCursor "ClipCursor" var

; winmdroot.Foundation.BOOL CloseClipboard()
#cfunc CloseClipboard "CloseClipboard"

; winmdroot.Foundation.BOOL CloseGestureInfoHandle(winmdroot.UI.Input.Touch.HGESTUREINFO hGestureInfo)
#cfunc CloseGestureInfoHandle "CloseGestureInfoHandle" intptr

; winmdroot.Foundation.BOOL CloseTouchInputHandle(winmdroot.UI.Input.Touch.HTOUCHINPUT hTouchInput)
#cfunc CloseTouchInputHandle "CloseTouchInputHandle" intptr

; winmdroot.Foundation.BOOL CloseWindow(winmdroot.Foundation.HWND hWnd)
#cfunc CloseWindow "CloseWindow" intptr

; winmdroot.Foundation.BOOL CloseWindowStation(winmdroot.System.StationsAndDesktops.HWINSTA hWinSta)
#cfunc CloseWindowStation "CloseWindowStation" intptr

; winmdroot.Foundation.NTSTATUS ConsoleControl(winmdroot.System.Console.CONSOLECONTROL Command, void* ConsoleInformation, uint ConsoleInformationLength)
#cfunc ConsoleControl "ConsoleControl" int, intptr, int

; winmdroot.Foundation.BOOL DestroyAcceleratorTable(winmdroot.UI.WindowsAndMessaging.HACCEL hAccel)
#cfunc DestroyAcceleratorTable "DestroyAcceleratorTable" intptr

; int CopyAcceleratorTableW(winmdroot.UI.WindowsAndMessaging.HACCEL hAccelSrc, [Optional] winmdroot.UI.WindowsAndMessaging.ACCEL* lpAccelDst, int cAccelEntries)
#cfunc CopyAcceleratorTableW "CopyAcceleratorTableW" intptr, var, int

; winmdroot.Foundation.BOOL DestroyIcon(winmdroot.UI.WindowsAndMessaging.HICON hIcon)
#cfunc DestroyIcon "DestroyIcon" intptr

; winmdroot.UI.WindowsAndMessaging.HICON CopyIcon(winmdroot.UI.WindowsAndMessaging.HICON hIcon)
#cfunc CopyIcon "CopyIcon" intptr

; winmdroot.Foundation.HANDLE CopyImage(winmdroot.Foundation.HANDLE h, winmdroot.UI.WindowsAndMessaging.GDI_IMAGE_TYPE type, int cx, int cy, winmdroot.UI.WindowsAndMessaging.IMAGE_FLAGS flags)
#cfunc CopyImage "CopyImage" intptr, int, int, int, int

; winmdroot.Foundation.BOOL CopyRect(winmdroot.Foundation.RECT* lprcDst, winmdroot.Foundation.RECT* lprcSrc)
#cfunc CopyRect "CopyRect" var, var

; int CountClipboardFormats()
#cfunc CountClipboardFormats "CountClipboardFormats"

; winmdroot.UI.WindowsAndMessaging.HACCEL CreateAcceleratorTable(winmdroot.UI.WindowsAndMessaging.ACCEL* paccel, int cAccel)
#cfunc CreateAcceleratorTableW "CreateAcceleratorTableW" var, int

; winmdroot.Foundation.BOOL CreateCaret(winmdroot.Foundation.HWND hWnd, winmdroot.Graphics.Gdi.HBITMAP hBitmap, int nWidth, int nHeight)
#cfunc CreateCaret "CreateCaret" intptr, intptr, int, int

; winmdroot.Foundation.BOOL DestroyCursor(winmdroot.UI.WindowsAndMessaging.HCURSOR hCursor)
#cfunc DestroyCursor "DestroyCursor" intptr

; winmdroot.UI.WindowsAndMessaging.HCURSOR CreateCursor(winmdroot.Foundation.HINSTANCE hInst, int xHotSpot, int yHotSpot, int nWidth, int nHeight, void* pvANDPlane, void* pvXORPlane)
#cfunc CreateCursor "CreateCursor" intptr, int, int, int, int, intptr, intptr

; winmdroot.System.StationsAndDesktops.HDESK CreateDesktop(winmdroot.Foundation.PCWSTR lpszDesktop, winmdroot.Foundation.PCWSTR lpszDevice, [Optional] winmdroot.Graphics.Gdi.DEVMODEW* pDevmode, winmdroot.System.StationsAndDesktops.DESKTOP_CONTROL_FLAGS dwFlags, uint dwDesiredAccess, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpsa)
#cfunc CreateDesktopW "CreateDesktopW" wstr, wstr, var, int, int, var

; winmdroot.System.StationsAndDesktops.HDESK CreateDesktopEx(winmdroot.Foundation.PCWSTR lpszDesktop, winmdroot.Foundation.PCWSTR lpszDevice, [Optional] winmdroot.Graphics.Gdi.DEVMODEW* pDevmode, winmdroot.System.StationsAndDesktops.DESKTOP_CONTROL_FLAGS dwFlags, uint dwDesiredAccess, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpsa, uint ulHeapSize, [Optional] void* pvoid)
#cfunc CreateDesktopExW "CreateDesktopExW" wstr, wstr, var, int, int, var, int, intptr

; winmdroot.Foundation.HWND CreateDialogIndirectParam(winmdroot.Foundation.HINSTANCE hInstance, winmdroot.UI.WindowsAndMessaging.DLGTEMPLATE* lpTemplate, winmdroot.Foundation.HWND hWndParent, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,uint,global::Windows.Win32.Foundation.WPARAM,global::Windows.Win32.Foundation.LPARAM,nint> lpDialogFunc, winmdroot.Foundation.LPARAM dwInitParam)
#cfunc CreateDialogIndirectParamW "CreateDialogIndirectParamW" intptr, var, intptr, int, intptr

; winmdroot.Foundation.HWND CreateDialogParam(winmdroot.Foundation.HINSTANCE hInstance, winmdroot.Foundation.PCWSTR lpTemplateName, winmdroot.Foundation.HWND hWndParent, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,uint,global::Windows.Win32.Foundation.WPARAM,global::Windows.Win32.Foundation.LPARAM,nint> lpDialogFunc, winmdroot.Foundation.LPARAM dwInitParam)
#cfunc CreateDialogParamW "CreateDialogParamW" intptr, wstr, intptr, int, intptr

; winmdroot.UI.WindowsAndMessaging.HICON CreateIcon(winmdroot.Foundation.HINSTANCE hInstance, int nWidth, int nHeight, byte cPlanes, byte cBitsPixel, byte* lpbANDbits, byte* lpbXORbits)
#cfunc CreateIcon "CreateIcon" intptr, int, int, int, int, var, var

; winmdroot.UI.WindowsAndMessaging.HICON CreateIconFromResource(byte* presbits, uint dwResSize, winmdroot.Foundation.BOOL fIcon, uint dwVer)
#cfunc CreateIconFromResource "CreateIconFromResource" var, int, int, int

; winmdroot.UI.WindowsAndMessaging.HICON CreateIconFromResourceEx(byte* presbits, uint dwResSize, winmdroot.Foundation.BOOL fIcon, uint dwVer, int cxDesired, int cyDesired, winmdroot.UI.WindowsAndMessaging.IMAGE_FLAGS Flags)
#cfunc CreateIconFromResourceEx "CreateIconFromResourceEx" var, int, int, int, int, int, int

; winmdroot.UI.WindowsAndMessaging.HICON CreateIconIndirect(winmdroot.UI.WindowsAndMessaging.ICONINFO* piconinfo)
#cfunc CreateIconIndirect "CreateIconIndirect" var

; winmdroot.Foundation.HWND CreateMDIWindow(winmdroot.Foundation.PCWSTR lpClassName, winmdroot.Foundation.PCWSTR lpWindowName, winmdroot.UI.WindowsAndMessaging.WINDOW_STYLE dwStyle, int X, int Y, int nWidth, int nHeight, winmdroot.Foundation.HWND hWndParent, winmdroot.Foundation.HINSTANCE hInstance, winmdroot.Foundation.LPARAM lParam)
#cfunc CreateMDIWindowW "CreateMDIWindowW" wstr, wstr, int, int, int, int, int, intptr, intptr, intptr

; winmdroot.UI.WindowsAndMessaging.HMENU CreateMenu()
#cfunc CreateMenu "CreateMenu"

; winmdroot.UI.WindowsAndMessaging.HMENU CreatePopupMenu()
#cfunc CreatePopupMenu "CreatePopupMenu"

; void DestroySyntheticPointerDevice(winmdroot.UI.Controls.HSYNTHETICPOINTERDEVICE device)
#func DestroySyntheticPointerDevice "DestroySyntheticPointerDevice" intptr

; winmdroot.UI.Controls.HSYNTHETICPOINTERDEVICE CreateSyntheticPointerDevice(winmdroot.UI.WindowsAndMessaging.POINTER_INPUT_TYPE pointerType, uint maxCount, winmdroot.UI.Controls.POINTER_FEEDBACK_MODE mode)
#cfunc CreateSyntheticPointerDevice "CreateSyntheticPointerDevice" int, int, int

; winmdroot.Foundation.HWND CreateWindowEx(winmdroot.UI.WindowsAndMessaging.WINDOW_EX_STYLE dwExStyle, winmdroot.Foundation.PCWSTR lpClassName, winmdroot.Foundation.PCWSTR lpWindowName, winmdroot.UI.WindowsAndMessaging.WINDOW_STYLE dwStyle, int X, int Y, int nWidth, int nHeight, winmdroot.Foundation.HWND hWndParent, winmdroot.UI.WindowsAndMessaging.HMENU hMenu, winmdroot.Foundation.HINSTANCE hInstance, [Optional] void* lpParam)
#cfunc CreateWindowExW "CreateWindowExW" int, wstr, wstr, int, int, int, int, int, intptr, intptr, intptr, intptr

; winmdroot.System.StationsAndDesktops.HWINSTA CreateWindowStation(winmdroot.Foundation.PCWSTR lpwinsta, uint dwFlags, uint dwDesiredAccess, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpsa)
#cfunc CreateWindowStationW "CreateWindowStationW" wstr, int, int, var

; winmdroot.Foundation.BOOL DdeDisconnect(winmdroot.System.DataExchange.HCONV hConv)
#cfunc DdeDisconnect "DdeDisconnect" intptr

; winmdroot.Foundation.BOOL DdeAbandonTransaction(uint idInst, winmdroot.System.DataExchange.HCONV hConv, uint idTransaction)
#cfunc DdeAbandonTransaction "DdeAbandonTransaction" int, intptr, int

; winmdroot.Foundation.BOOL DdeFreeDataHandle(winmdroot.System.DataExchange.HDDEDATA hData)
#cfunc DdeFreeDataHandle "DdeFreeDataHandle" intptr

; byte* DdeAccessData(winmdroot.System.DataExchange.HDDEDATA hData, [Optional] uint* pcbDataSize)
#cfunc DdeAccessData "DdeAccessData" intptr, var

; winmdroot.System.DataExchange.HDDEDATA DdeAddData(winmdroot.System.DataExchange.HDDEDATA hData, byte* pSrc, uint cb, uint cbOff)
#cfunc DdeAddData "DdeAddData" intptr, var, int, int

; winmdroot.System.DataExchange.HDDEDATA DdeClientTransaction([Optional] byte* pData, uint cbData, winmdroot.System.DataExchange.HCONV hConv, winmdroot.System.DataExchange.HSZ hszItem, uint wFmt, winmdroot.System.DataExchange.DDE_CLIENT_TRANSACTION_TYPE wType, uint dwTimeout, [Optional] uint* pdwResult)
#cfunc DdeClientTransaction "DdeClientTransaction" var, int, intptr, intptr, int, int, int, var

; int DdeCmpStringHandles(winmdroot.System.DataExchange.HSZ hsz1, winmdroot.System.DataExchange.HSZ hsz2)
#cfunc DdeCmpStringHandles "DdeCmpStringHandles" intptr, intptr

; winmdroot.System.DataExchange.HCONV DdeConnect(uint idInst, winmdroot.System.DataExchange.HSZ hszService, winmdroot.System.DataExchange.HSZ hszTopic, [Optional] winmdroot.System.DataExchange.CONVCONTEXT* pCC)
#cfunc DdeConnect "DdeConnect" int, intptr, intptr, var

; winmdroot.Foundation.BOOL DdeDisconnectList(winmdroot.System.DataExchange.HCONVLIST hConvList)
#cfunc DdeDisconnectList "DdeDisconnectList" intptr

; winmdroot.System.DataExchange.HCONVLIST DdeConnectList(uint idInst, winmdroot.System.DataExchange.HSZ hszService, winmdroot.System.DataExchange.HSZ hszTopic, winmdroot.System.DataExchange.HCONVLIST hConvList, [Optional] winmdroot.System.DataExchange.CONVCONTEXT* pCC)
#cfunc DdeConnectList "DdeConnectList" int, intptr, intptr, intptr, var

; winmdroot.System.DataExchange.HDDEDATA DdeCreateDataHandle(uint idInst, [Optional] byte* pSrc, uint cb, uint cbOff, winmdroot.System.DataExchange.HSZ hszItem, uint wFmt, uint afCmd)
#cfunc DdeCreateDataHandle "DdeCreateDataHandle" int, var, int, int, intptr, int, int

; winmdroot.System.DataExchange.HSZ DdeCreateStringHandleW(uint idInst, winmdroot.Foundation.PCWSTR psz, int iCodePage)
#cfunc DdeCreateStringHandleW "DdeCreateStringHandleW" int, wstr, int

; winmdroot.Foundation.BOOL DdeEnableCallback(uint idInst, winmdroot.System.DataExchange.HCONV hConv, winmdroot.System.DataExchange.DDE_ENABLE_CALLBACK_CMD wCmd)
#cfunc DdeEnableCallback "DdeEnableCallback" int, intptr, int

; winmdroot.Foundation.BOOL DdeFreeStringHandle(uint idInst, winmdroot.System.DataExchange.HSZ hsz)
#cfunc DdeFreeStringHandle "DdeFreeStringHandle" int, intptr

; uint DdeGetData(winmdroot.System.DataExchange.HDDEDATA hData, [Optional] byte* pDst, uint cbMax, uint cbOff)
#cfunc DdeGetData "DdeGetData" intptr, var, int, int

; uint DdeGetLastError(uint idInst)
#cfunc DdeGetLastError "DdeGetLastError" int

; winmdroot.Foundation.BOOL DdeImpersonateClient(winmdroot.System.DataExchange.HCONV hConv)
#cfunc DdeImpersonateClient "DdeImpersonateClient" intptr

; uint DdeInitializeW(uint* pidInst, delegate *unmanaged[Stdcall]<uint,uint,global::Windows.Win32.System.DataExchange.HCONV,global::Windows.Win32.System.DataExchange.HSZ,global::Windows.Win32.System.DataExchange.HSZ,global::Windows.Win32.System.DataExchange.HDDEDATA,nuint,nuint,global::Windows.Win32.System.DataExchange.HDDEDATA> pfnCallback, winmdroot.System.DataExchange.DDE_INITIALIZE_COMMAND afCmd, uint ulRes)
#cfunc DdeInitializeW "DdeInitializeW" var, int, int, int

; winmdroot.Foundation.BOOL DdeKeepStringHandle(uint idInst, winmdroot.System.DataExchange.HSZ hsz)
#cfunc DdeKeepStringHandle "DdeKeepStringHandle" int, intptr

; winmdroot.System.DataExchange.HDDEDATA DdeNameService(uint idInst, winmdroot.System.DataExchange.HSZ hsz1, winmdroot.System.DataExchange.HSZ hsz2, winmdroot.System.DataExchange.DDE_NAME_SERVICE_CMD afCmd)
#cfunc DdeNameService "DdeNameService" int, intptr, intptr, int

; winmdroot.Foundation.BOOL DdePostAdvise(uint idInst, winmdroot.System.DataExchange.HSZ hszTopic, winmdroot.System.DataExchange.HSZ hszItem)
#cfunc DdePostAdvise "DdePostAdvise" int, intptr, intptr

; uint DdeQueryConvInfo(winmdroot.System.DataExchange.HCONV hConv, uint idTransaction, winmdroot.System.DataExchange.CONVINFO* pConvInfo)
#cfunc DdeQueryConvInfo "DdeQueryConvInfo" intptr, int, var

; winmdroot.System.DataExchange.HCONV DdeQueryNextServer(winmdroot.System.DataExchange.HCONVLIST hConvList, winmdroot.System.DataExchange.HCONV hConvPrev)
#cfunc DdeQueryNextServer "DdeQueryNextServer" intptr, intptr

; uint DdeQueryStringW(uint idInst, winmdroot.System.DataExchange.HSZ hsz, winmdroot.Foundation.PWSTR psz, uint cchMax, int iCodePage)
#cfunc DdeQueryStringW "DdeQueryStringW" int, intptr, wstr, int, int

; winmdroot.System.DataExchange.HCONV DdeReconnect(winmdroot.System.DataExchange.HCONV hConv)
#cfunc DdeReconnect "DdeReconnect" intptr

; winmdroot.Foundation.BOOL DdeSetQualityOfService(winmdroot.Foundation.HWND hwndClient, winmdroot.Security.SECURITY_QUALITY_OF_SERVICE* pqosNew, winmdroot.Security.SECURITY_QUALITY_OF_SERVICE* pqosPrev)
#cfunc DdeSetQualityOfService "DdeSetQualityOfService" intptr, var, var

; winmdroot.Foundation.BOOL DdeSetUserHandle(winmdroot.System.DataExchange.HCONV hConv, uint id, nuint hUser)
#cfunc DdeSetUserHandle "DdeSetUserHandle" intptr, int, int

; winmdroot.Foundation.BOOL DdeUnaccessData(winmdroot.System.DataExchange.HDDEDATA hData)
#cfunc DdeUnaccessData "DdeUnaccessData" intptr

; winmdroot.Foundation.BOOL DdeUninitialize(uint idInst)
#cfunc DdeUninitialize "DdeUninitialize" int

; winmdroot.Foundation.LRESULT DefFrameProcW(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.HWND hWndMDIClient, uint uMsg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam)
#cfunc DefFrameProcW "DefFrameProcW" intptr, intptr, int, intptr, intptr

; winmdroot.Foundation.LRESULT DefMDIChildProcW(winmdroot.Foundation.HWND hWnd, uint uMsg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam)
#cfunc DefMDIChildProcW "DefMDIChildProcW" intptr, int, intptr, intptr

; winmdroot.Foundation.LRESULT DefRawInputProc(winmdroot.UI.Input.RAWINPUT** paRawInput, int nInput, uint cbSizeHeader)
#cfunc DefRawInputProc "DefRawInputProc" var, int, int

; winmdroot.UI.WindowsAndMessaging.HDWP DeferWindowPos(winmdroot.UI.WindowsAndMessaging.HDWP hWinPosInfo, winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.HWND hWndInsertAfter, int x, int y, int cx, int cy, winmdroot.UI.WindowsAndMessaging.SET_WINDOW_POS_FLAGS uFlags)
#cfunc DeferWindowPos "DeferWindowPos" intptr, intptr, intptr, int, int, int, int, int

; winmdroot.Foundation.BOOL DeleteMenu(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, uint uPosition, winmdroot.UI.WindowsAndMessaging.MENU_ITEM_FLAGS uFlags)
#cfunc DeleteMenu "DeleteMenu" intptr, int, int

; winmdroot.Foundation.BOOL DeregisterShellHookWindow(winmdroot.Foundation.HWND hwnd)
#cfunc DeregisterShellHookWindow "DeregisterShellHookWindow" intptr

; winmdroot.Foundation.BOOL DestroyCaret()
#cfunc DestroyCaret "DestroyCaret"

; winmdroot.Foundation.BOOL DestroyWindow(winmdroot.Foundation.HWND hWnd)
#cfunc DestroyWindow "DestroyWindow" intptr

; nint DialogBoxIndirectParam(winmdroot.Foundation.HINSTANCE hInstance, winmdroot.UI.WindowsAndMessaging.DLGTEMPLATE* hDialogTemplate, winmdroot.Foundation.HWND hWndParent, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,uint,global::Windows.Win32.Foundation.WPARAM,global::Windows.Win32.Foundation.LPARAM,nint> lpDialogFunc, winmdroot.Foundation.LPARAM dwInitParam)
#cfunc DialogBoxIndirectParamW "DialogBoxIndirectParamW" intptr, var, intptr, int, intptr

; nint DialogBoxParam(winmdroot.Foundation.HINSTANCE hInstance, winmdroot.Foundation.PCWSTR lpTemplateName, winmdroot.Foundation.HWND hWndParent, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,uint,global::Windows.Win32.Foundation.WPARAM,global::Windows.Win32.Foundation.LPARAM,nint> lpDialogFunc, winmdroot.Foundation.LPARAM dwInitParam)
#cfunc DialogBoxParamW "DialogBoxParamW" intptr, wstr, intptr, int, intptr

; void DisableProcessWindowsGhosting()
#func DisableProcessWindowsGhosting "DisableProcessWindowsGhosting"

; winmdroot.Foundation.LRESULT DispatchMessageW(winmdroot.UI.WindowsAndMessaging.MSG* lpMsg)
#cfunc DispatchMessageW "DispatchMessageW" var

; int DisplayConfigGetDeviceInfo(winmdroot.Devices.Display.DISPLAYCONFIG_DEVICE_INFO_HEADER* requestPacket)
#cfunc DisplayConfigGetDeviceInfo "DisplayConfigGetDeviceInfo" var

; int DisplayConfigSetDeviceInfo(winmdroot.Devices.Display.DISPLAYCONFIG_DEVICE_INFO_HEADER* setPacket)
#cfunc DisplayConfigSetDeviceInfo "DisplayConfigSetDeviceInfo" var

; int DlgDirListW(winmdroot.Foundation.HWND hDlg, winmdroot.Foundation.PWSTR lpPathSpec, int nIDListBox, int nIDStaticPath, winmdroot.UI.Controls.DLG_DIR_LIST_FILE_TYPE uFileType)
#cfunc DlgDirListW "DlgDirListW" intptr, wstr, int, int, int

; int DlgDirListComboBox(winmdroot.Foundation.HWND hDlg, winmdroot.Foundation.PWSTR lpPathSpec, int nIDComboBox, int nIDStaticPath, winmdroot.UI.Controls.DLG_DIR_LIST_FILE_TYPE uFiletype)
#cfunc DlgDirListComboBoxW "DlgDirListComboBoxW" intptr, wstr, int, int, int

; winmdroot.Foundation.BOOL DlgDirSelectComboBoxEx(winmdroot.Foundation.HWND hwndDlg, winmdroot.Foundation.PWSTR lpString, int cchOut, int idComboBox)
#cfunc DlgDirSelectComboBoxExW "DlgDirSelectComboBoxExW" intptr, wstr, int, int

; winmdroot.Foundation.BOOL DlgDirSelectEx(winmdroot.Foundation.HWND hwndDlg, winmdroot.Foundation.PWSTR lpString, int chCount, int idListBox)
#cfunc DlgDirSelectExW "DlgDirSelectExW" intptr, wstr, int, int

; winmdroot.Foundation.BOOL DragDetect(winmdroot.Foundation.HWND hwnd, global::System.Drawing.Point pt)
#cfunc DragDetect "DragDetect" intptr, int

; uint DragObject(winmdroot.Foundation.HWND hwndParent, winmdroot.Foundation.HWND hwndFrom, uint fmt, nuint data, winmdroot.UI.WindowsAndMessaging.HCURSOR hcur)
#cfunc DragObject "DragObject" intptr, intptr, int, int, intptr

; winmdroot.Foundation.BOOL DrawAnimatedRects(winmdroot.Foundation.HWND hwnd, int idAni, winmdroot.Foundation.RECT* lprcFrom, winmdroot.Foundation.RECT* lprcTo)
#cfunc DrawAnimatedRects "DrawAnimatedRects" intptr, int, var, var

; winmdroot.Foundation.BOOL DrawCaption(winmdroot.Foundation.HWND hwnd, winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.RECT* lprect, winmdroot.Graphics.Gdi.DRAW_CAPTION_FLAGS flags)
#cfunc DrawCaption "DrawCaption" intptr, intptr, var, int

; winmdroot.Foundation.BOOL DrawEdge(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.RECT* qrc, winmdroot.Graphics.Gdi.DRAWEDGE_FLAGS edge, winmdroot.Graphics.Gdi.DRAW_EDGE_FLAGS grfFlags)
#cfunc DrawEdge "DrawEdge" intptr, var, int, int

; winmdroot.Foundation.BOOL DrawFocusRect(winmdroot.Graphics.Gdi.HDC hDC, winmdroot.Foundation.RECT* lprc)
#cfunc DrawFocusRect "DrawFocusRect" intptr, var

; winmdroot.Foundation.BOOL DrawFrameControl(winmdroot.Graphics.Gdi.HDC param0, winmdroot.Foundation.RECT* param1, winmdroot.Graphics.Gdi.DFC_TYPE param2, winmdroot.Graphics.Gdi.DFCS_STATE param3)
#cfunc DrawFrameControl "DrawFrameControl" intptr, var, int, int

; winmdroot.Foundation.BOOL DrawIcon(winmdroot.Graphics.Gdi.HDC hDC, int X, int Y, winmdroot.UI.WindowsAndMessaging.HICON hIcon)
#cfunc DrawIcon "DrawIcon" intptr, int, int, intptr

; winmdroot.Foundation.BOOL DrawIconEx(winmdroot.Graphics.Gdi.HDC hdc, int xLeft, int yTop, winmdroot.UI.WindowsAndMessaging.HICON hIcon, int cxWidth, int cyWidth, uint istepIfAniCur, winmdroot.Graphics.Gdi.HBRUSH hbrFlickerFreeDraw, winmdroot.UI.WindowsAndMessaging.DI_FLAGS diFlags)
#cfunc DrawIconEx "DrawIconEx" intptr, int, int, intptr, int, int, int, intptr, int

; winmdroot.Foundation.BOOL DrawMenuBar(winmdroot.Foundation.HWND hWnd)
#cfunc DrawMenuBar "DrawMenuBar" intptr

; winmdroot.Foundation.BOOL DrawStateW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HBRUSH hbrFore, delegate *unmanaged[Stdcall]<global::Windows.Win32.Graphics.Gdi.HDC,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.WPARAM,int,int,global::Windows.Win32.Foundation.BOOL> qfnCallBack, winmdroot.Foundation.LPARAM lData, winmdroot.Foundation.WPARAM wData, int x, int y, int cx, int cy, winmdroot.Graphics.Gdi.DRAWSTATE_FLAGS uFlags)
#cfunc DrawStateW "DrawStateW" intptr, intptr, int, intptr, intptr, int, int, int, int, int

; int DrawTextW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.PCWSTR lpchText, int cchText, winmdroot.Foundation.RECT* lprc, winmdroot.Graphics.Gdi.DRAW_TEXT_FORMAT format)
#cfunc DrawTextW "DrawTextW" intptr, wstr, int, var, int

; int DrawTextExW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.PWSTR lpchText, int cchText, winmdroot.Foundation.RECT* lprc, winmdroot.Graphics.Gdi.DRAW_TEXT_FORMAT format, [Optional] winmdroot.Graphics.Gdi.DRAWTEXTPARAMS* lpdtp)
#cfunc DrawTextExW "DrawTextExW" intptr, wstr, int, var, int, var

; winmdroot.Foundation.BOOL EmptyClipboard()
#cfunc EmptyClipboard "EmptyClipboard"

; winmdroot.Foundation.BOOL EnableMenuItem(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, uint uIDEnableItem, winmdroot.UI.WindowsAndMessaging.MENU_ITEM_FLAGS uEnable)
#cfunc EnableMenuItem "EnableMenuItem" intptr, int, int

; winmdroot.Foundation.BOOL EnableMouseInPointer(winmdroot.Foundation.BOOL fEnable)
#cfunc EnableMouseInPointer "EnableMouseInPointer" int

; winmdroot.Foundation.BOOL EnableNonClientDpiScaling(winmdroot.Foundation.HWND hwnd)
#cfunc EnableNonClientDpiScaling "EnableNonClientDpiScaling" intptr

; winmdroot.Foundation.BOOL EnableScrollBar(winmdroot.Foundation.HWND hWnd, uint wSBflags, winmdroot.UI.Controls.ENABLE_SCROLL_BAR_ARROWS wArrows)
#cfunc EnableScrollBar "EnableScrollBar" intptr, int, int

; winmdroot.Foundation.BOOL EnableWindow(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.BOOL bEnable)
#cfunc EnableWindow "EnableWindow" intptr, int

; winmdroot.Foundation.BOOL EndDeferWindowPos(winmdroot.UI.WindowsAndMessaging.HDWP hWinPosInfo)
#cfunc EndDeferWindowPos "EndDeferWindowPos" intptr

; winmdroot.Foundation.BOOL EndDialog(winmdroot.Foundation.HWND hDlg, nint nResult)
#cfunc EndDialog "EndDialog" intptr, int

; winmdroot.Foundation.BOOL EndMenu()
#cfunc EndMenu "EndMenu"

; winmdroot.Foundation.BOOL EndPaint(winmdroot.Foundation.HWND hWnd, winmdroot.Graphics.Gdi.PAINTSTRUCT* lpPaint)
#cfunc EndPaint "EndPaint" intptr, var

; winmdroot.Foundation.BOOL EnumChildWindows(winmdroot.Foundation.HWND hWndParent, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.BOOL> lpEnumFunc, winmdroot.Foundation.LPARAM lParam)
#cfunc EnumChildWindows "EnumChildWindows" intptr, int, intptr

; uint EnumClipboardFormats(uint format)
#cfunc EnumClipboardFormats "EnumClipboardFormats" int

; winmdroot.Foundation.BOOL EnumDesktopWindows(winmdroot.System.StationsAndDesktops.HDESK hDesktop, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.BOOL> lpfn, winmdroot.Foundation.LPARAM lParam)
#cfunc EnumDesktopWindows "EnumDesktopWindows" intptr, int, intptr

; winmdroot.Foundation.BOOL EnumDesktops(winmdroot.System.StationsAndDesktops.HWINSTA hwinsta, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.BOOL> lpEnumFunc, winmdroot.Foundation.LPARAM lParam)
#cfunc EnumDesktopsW "EnumDesktopsW" intptr, int, intptr

; winmdroot.Foundation.BOOL EnumDisplayDevicesW(winmdroot.Foundation.PCWSTR lpDevice, uint iDevNum, winmdroot.Graphics.Gdi.DISPLAY_DEVICEW* lpDisplayDevice, uint dwFlags)
#cfunc EnumDisplayDevicesW "EnumDisplayDevicesW" wstr, int, var, int

; winmdroot.Foundation.BOOL EnumDisplayMonitors(winmdroot.Graphics.Gdi.HDC hdc, [Optional] winmdroot.Foundation.RECT* lprcClip, delegate *unmanaged[Stdcall]<global::Windows.Win32.Graphics.Gdi.HMONITOR,global::Windows.Win32.Graphics.Gdi.HDC,global::Windows.Win32.Foundation.RECT*,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.BOOL> lpfnEnum, winmdroot.Foundation.LPARAM dwData)
#cfunc EnumDisplayMonitors "EnumDisplayMonitors" intptr, var, int, intptr

; winmdroot.Foundation.BOOL EnumDisplaySettingsW(winmdroot.Foundation.PCWSTR lpszDeviceName, winmdroot.Graphics.Gdi.ENUM_DISPLAY_SETTINGS_MODE iModeNum, winmdroot.Graphics.Gdi.DEVMODEW* lpDevMode)
#cfunc EnumDisplaySettingsW "EnumDisplaySettingsW" wstr, int, var

; winmdroot.Foundation.BOOL EnumDisplaySettingsExW(winmdroot.Foundation.PCWSTR lpszDeviceName, winmdroot.Graphics.Gdi.ENUM_DISPLAY_SETTINGS_MODE iModeNum, winmdroot.Graphics.Gdi.DEVMODEW* lpDevMode, winmdroot.Graphics.Gdi.ENUM_DISPLAY_SETTINGS_FLAGS dwFlags)
#cfunc EnumDisplaySettingsExW "EnumDisplaySettingsExW" wstr, int, var, int

; int EnumPropsW(winmdroot.Foundation.HWND hWnd, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,winmdroot.Foundation.PCWSTR,global::Windows.Win32.Foundation.HANDLE,global::Windows.Win32.Foundation.BOOL> lpEnumFunc)
#cfunc EnumPropsW "EnumPropsW" intptr, int

; int EnumPropsExW(winmdroot.Foundation.HWND hWnd, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.HANDLE,nuint,global::Windows.Win32.Foundation.BOOL> lpEnumFunc, winmdroot.Foundation.LPARAM lParam)
#cfunc EnumPropsExW "EnumPropsExW" intptr, int, intptr

; winmdroot.Foundation.BOOL EnumThreadWindows(uint dwThreadId, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.BOOL> lpfn, winmdroot.Foundation.LPARAM lParam)
#cfunc EnumThreadWindows "EnumThreadWindows" int, int, intptr

; winmdroot.Foundation.BOOL EnumWindowStations(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.BOOL> lpEnumFunc, winmdroot.Foundation.LPARAM lParam)
#cfunc EnumWindowStationsW "EnumWindowStationsW" int, intptr

; winmdroot.Foundation.BOOL EnumWindows(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.BOOL> lpEnumFunc, winmdroot.Foundation.LPARAM lParam)
#cfunc EnumWindows "EnumWindows" int, intptr

; winmdroot.Foundation.BOOL EqualRect(winmdroot.Foundation.RECT* lprc1, winmdroot.Foundation.RECT* lprc2)
#cfunc EqualRect "EqualRect" var, var

; winmdroot.Foundation.BOOL EvaluateProximityToPolygon(uint numVertices, global::System.Drawing.Point* controlPolygon, winmdroot.UI.Controls.TOUCH_HIT_TESTING_INPUT* pHitTestingInput, winmdroot.UI.Controls.TOUCH_HIT_TESTING_PROXIMITY_EVALUATION* pProximityEval)
#cfunc EvaluateProximityToPolygon "EvaluateProximityToPolygon" int, var, var, var

; winmdroot.Foundation.BOOL EvaluateProximityToRect(winmdroot.Foundation.RECT* controlBoundingBox, winmdroot.UI.Controls.TOUCH_HIT_TESTING_INPUT* pHitTestingInput, winmdroot.UI.Controls.TOUCH_HIT_TESTING_PROXIMITY_EVALUATION* pProximityEval)
#cfunc EvaluateProximityToRect "EvaluateProximityToRect" var, var, var

; int ExcludeUpdateRgn(winmdroot.Graphics.Gdi.HDC hDC, winmdroot.Foundation.HWND hWnd)
#cfunc ExcludeUpdateRgn "ExcludeUpdateRgn" intptr, intptr

; winmdroot.Foundation.BOOL ExitWindowsEx(winmdroot.System.Shutdown.EXIT_WINDOWS_FLAGS uFlags, winmdroot.System.Shutdown.SHUTDOWN_REASON dwReason)
#cfunc ExitWindowsEx "ExitWindowsEx" int, int

; int FillRect(winmdroot.Graphics.Gdi.HDC hDC, winmdroot.Foundation.RECT* lprc, winmdroot.Graphics.Gdi.HBRUSH hbr)
#cfunc FillRect "FillRect" intptr, var, intptr

; winmdroot.Foundation.HWND FindWindow(winmdroot.Foundation.PCWSTR lpClassName, winmdroot.Foundation.PCWSTR lpWindowName)
#cfunc FindWindowW "FindWindowW" wstr, wstr

; winmdroot.Foundation.HWND FindWindowEx(winmdroot.Foundation.HWND hWndParent, winmdroot.Foundation.HWND hWndChildAfter, winmdroot.Foundation.PCWSTR lpszClass, winmdroot.Foundation.PCWSTR lpszWindow)
#cfunc FindWindowExW "FindWindowExW" intptr, intptr, wstr, wstr

; winmdroot.Foundation.BOOL FlashWindow(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.BOOL bInvert)
#cfunc FlashWindow "FlashWindow" intptr, int

; winmdroot.Foundation.BOOL FlashWindowEx(winmdroot.UI.WindowsAndMessaging.FLASHWINFO* pfwi)
#cfunc FlashWindowEx "FlashWindowEx" var

; int FrameRect(winmdroot.Graphics.Gdi.HDC hDC, winmdroot.Foundation.RECT* lprc, winmdroot.Graphics.Gdi.HBRUSH hbr)
#cfunc FrameRect "FrameRect" intptr, var, intptr

; winmdroot.Foundation.BOOL FreeDDElParam(uint msg, winmdroot.Foundation.LPARAM lParam)
#cfunc FreeDDElParam "FreeDDElParam" int, intptr

; winmdroot.Foundation.HWND GetActiveWindow()
#cfunc GetActiveWindow "GetActiveWindow"

; winmdroot.Foundation.BOOL GetAltTabInfo(winmdroot.Foundation.HWND hwnd, int iItem, winmdroot.UI.WindowsAndMessaging.ALTTABINFO* pati, winmdroot.Foundation.PWSTR pszItemText, uint cchItemText)
#cfunc GetAltTabInfoW "GetAltTabInfoW" intptr, int, var, wstr, int

; winmdroot.Foundation.HWND GetAncestor(winmdroot.Foundation.HWND hwnd, winmdroot.UI.WindowsAndMessaging.GET_ANCESTOR_FLAGS gaFlags)
#cfunc GetAncestor "GetAncestor" intptr, int

; short GetAsyncKeyState(int vKey)
#cfunc GetAsyncKeyState "GetAsyncKeyState" int

; winmdroot.Foundation.BOOL GetAutoRotationState(winmdroot.Devices.Display.AR_STATE* pState)
#cfunc GetAutoRotationState "GetAutoRotationState" var

; winmdroot.UI.HiDpi.DPI_AWARENESS GetAwarenessFromDpiAwarenessContext(winmdroot.UI.HiDpi.DPI_AWARENESS_CONTEXT value)
#cfunc GetAwarenessFromDpiAwarenessContext "GetAwarenessFromDpiAwarenessContext" intptr

; winmdroot.Foundation.BOOL GetCIMSSM(winmdroot.UI.Input.INPUT_MESSAGE_SOURCE* inputMessageSource)
#cfunc GetCIMSSM "GetCIMSSM" var

; winmdroot.Foundation.HWND GetCapture()
#cfunc GetCapture "GetCapture"

; uint GetCaretBlinkTime()
#cfunc GetCaretBlinkTime "GetCaretBlinkTime"

; winmdroot.Foundation.BOOL GetCaretPos(global::System.Drawing.Point* lpPoint)
#cfunc GetCaretPos "GetCaretPos" var

; winmdroot.Foundation.BOOL GetClassInfo(winmdroot.Foundation.HINSTANCE hInstance, winmdroot.Foundation.PCWSTR lpClassName, winmdroot.UI.WindowsAndMessaging.WNDCLASSW* lpWndClass)
#cfunc GetClassInfoW "GetClassInfoW" intptr, wstr, var

; winmdroot.Foundation.BOOL GetClassInfoEx(winmdroot.Foundation.HINSTANCE hInstance, winmdroot.Foundation.PCWSTR lpszClass, winmdroot.UI.WindowsAndMessaging.WNDCLASSEXW* lpwcx)
#cfunc GetClassInfoExW "GetClassInfoExW" intptr, wstr, var

; uint GetClassLong(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.GET_CLASS_LONG_INDEX nIndex)
#cfunc GetClassLongW "GetClassLongW" intptr, int

; int GetClassName(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.PWSTR lpClassName, int nMaxCount)
#cfunc GetClassNameW "GetClassNameW" intptr, wstr, int

; ushort GetClassWord(winmdroot.Foundation.HWND hWnd, int nIndex)
#cfunc GetClassWord "GetClassWord" intptr, int

; winmdroot.Foundation.BOOL GetClientRect(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.RECT* lpRect)
#cfunc GetClientRect "GetClientRect" intptr, var

; winmdroot.Foundation.BOOL GetClipCursor(winmdroot.Foundation.RECT* lpRect)
#cfunc GetClipCursor "GetClipCursor" var

; winmdroot.Foundation.HANDLE GetClipboardData(uint uFormat)
#cfunc GetClipboardData "GetClipboardData" int

; int GetClipboardFormatName(uint format, winmdroot.Foundation.PWSTR lpszFormatName, int cchMaxCount)
#cfunc GetClipboardFormatNameW "GetClipboardFormatNameW" int, wstr, int

; winmdroot.Foundation.HWND GetClipboardOwner()
#cfunc GetClipboardOwner "GetClipboardOwner"

; uint GetClipboardSequenceNumber()
#cfunc GetClipboardSequenceNumber "GetClipboardSequenceNumber"

; winmdroot.Foundation.HWND GetClipboardViewer()
#cfunc GetClipboardViewer "GetClipboardViewer"

; winmdroot.Foundation.BOOL GetComboBoxInfo(winmdroot.Foundation.HWND hwndCombo, winmdroot.UI.Controls.COMBOBOXINFO* pcbi)
#cfunc GetComboBoxInfo "GetComboBoxInfo" intptr, var

; winmdroot.Foundation.BOOL GetCurrentInputMessageSource(winmdroot.UI.Input.INPUT_MESSAGE_SOURCE* inputMessageSource)
#cfunc GetCurrentInputMessageSource "GetCurrentInputMessageSource" var

; winmdroot.UI.WindowsAndMessaging.HCURSOR GetCursor()
#cfunc GetCursor "GetCursor"

; winmdroot.Foundation.BOOL GetCursorInfo(winmdroot.UI.WindowsAndMessaging.CURSORINFO* pci)
#cfunc GetCursorInfo "GetCursorInfo" var

; winmdroot.Foundation.BOOL GetCursorPos(global::System.Drawing.Point* lpPoint)
#cfunc GetCursorPos "GetCursorPos" var

; winmdroot.Graphics.Gdi.HDC GetDC(winmdroot.Foundation.HWND hWnd)
#cfunc GetDC "GetDC" intptr

; winmdroot.Graphics.Gdi.HDC GetDCEx(winmdroot.Foundation.HWND hWnd, winmdroot.Graphics.Gdi.HRGN hrgnClip, winmdroot.Graphics.Gdi.GET_DCX_FLAGS flags)
#cfunc GetDCEx "GetDCEx" intptr, intptr, int

; winmdroot.Foundation.HWND GetDesktopWindow()
#cfunc GetDesktopWindow "GetDesktopWindow"

; int GetDialogBaseUnits()
#cfunc GetDialogBaseUnits "GetDialogBaseUnits"

; winmdroot.UI.HiDpi.DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS GetDialogControlDpiChangeBehavior(winmdroot.Foundation.HWND hWnd)
#cfunc GetDialogControlDpiChangeBehavior "GetDialogControlDpiChangeBehavior" intptr

; winmdroot.UI.HiDpi.DIALOG_DPI_CHANGE_BEHAVIORS GetDialogDpiChangeBehavior(winmdroot.Foundation.HWND hDlg)
#cfunc GetDialogDpiChangeBehavior "GetDialogDpiChangeBehavior" intptr

; winmdroot.Foundation.BOOL GetDisplayAutoRotationPreferences(winmdroot.Devices.Display.ORIENTATION_PREFERENCE* pOrientation)
#cfunc GetDisplayAutoRotationPreferences "GetDisplayAutoRotationPreferences" var

; winmdroot.Foundation.WIN32_ERROR GetDisplayConfigBufferSizes(winmdroot.Devices.Display.QUERY_DISPLAY_CONFIG_FLAGS flags, uint* numPathArrayElements, uint* numModeInfoArrayElements)
#cfunc GetDisplayConfigBufferSizes "GetDisplayConfigBufferSizes" int, var, var

; int GetDlgCtrlID(winmdroot.Foundation.HWND hWnd)
#cfunc GetDlgCtrlID "GetDlgCtrlID" intptr

; winmdroot.Foundation.HWND GetDlgItem(winmdroot.Foundation.HWND hDlg, int nIDDlgItem)
#cfunc GetDlgItem "GetDlgItem" intptr, int

; uint GetDlgItemInt(winmdroot.Foundation.HWND hDlg, int nIDDlgItem, [Optional] winmdroot.Foundation.BOOL* lpTranslated, winmdroot.Foundation.BOOL bSigned)
#cfunc GetDlgItemInt "GetDlgItemInt" intptr, int, var, int

; uint GetDlgItemText(winmdroot.Foundation.HWND hDlg, int nIDDlgItem, winmdroot.Foundation.PWSTR lpString, int cchMax)
#cfunc GetDlgItemTextW "GetDlgItemTextW" intptr, int, wstr, int

; uint GetDoubleClickTime()
#cfunc GetDoubleClickTime "GetDoubleClickTime"

; winmdroot.UI.HiDpi.DPI_AWARENESS_CONTEXT GetDpiAwarenessContextForProcess(winmdroot.Foundation.HANDLE hProcess)
#cfunc GetDpiAwarenessContextForProcess "GetDpiAwarenessContextForProcess" intptr

; uint GetDpiForSystem()
#cfunc GetDpiForSystem "GetDpiForSystem"

; uint GetDpiForWindow(winmdroot.Foundation.HWND hwnd)
#cfunc GetDpiForWindow "GetDpiForWindow" intptr

; uint GetDpiFromDpiAwarenessContext(winmdroot.UI.HiDpi.DPI_AWARENESS_CONTEXT value)
#cfunc GetDpiFromDpiAwarenessContext "GetDpiFromDpiAwarenessContext" intptr

; winmdroot.Foundation.HWND GetFocus()
#cfunc GetFocus "GetFocus"

; winmdroot.Foundation.HWND GetForegroundWindow()
#cfunc GetForegroundWindow "GetForegroundWindow"

; winmdroot.Foundation.BOOL GetGUIThreadInfo(uint idThread, winmdroot.UI.WindowsAndMessaging.GUITHREADINFO* pgui)
#cfunc GetGUIThreadInfo "GetGUIThreadInfo" int, var

; winmdroot.Foundation.BOOL GetGestureConfig(winmdroot.Foundation.HWND hwnd, uint dwReserved, uint dwFlags, uint* pcIDs, winmdroot.UI.Input.Touch.GESTURECONFIG* pGestureConfig, uint cbSize)
#cfunc GetGestureConfig "GetGestureConfig" intptr, int, int, var, var, int

; winmdroot.Foundation.BOOL GetGestureExtraArgs(winmdroot.UI.Input.Touch.HGESTUREINFO hGestureInfo, uint cbExtraArgs, byte* pExtraArgs)
#cfunc GetGestureExtraArgs "GetGestureExtraArgs" intptr, int, var

; winmdroot.Foundation.BOOL GetGestureInfo(winmdroot.UI.Input.Touch.HGESTUREINFO hGestureInfo, winmdroot.UI.Input.Touch.GESTUREINFO* pGestureInfo)
#cfunc GetGestureInfo "GetGestureInfo" intptr, var

; uint GetGuiResources(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.Threading.GET_GUI_RESOURCES_FLAGS uiFlags)
#cfunc GetGuiResources "GetGuiResources" intptr, int

; winmdroot.Foundation.BOOL GetIconInfo(winmdroot.UI.WindowsAndMessaging.HICON hIcon, winmdroot.UI.WindowsAndMessaging.ICONINFO* piconinfo)
#cfunc GetIconInfo "GetIconInfo" intptr, var

; winmdroot.Foundation.BOOL GetIconInfoExW(winmdroot.UI.WindowsAndMessaging.HICON hicon, winmdroot.UI.WindowsAndMessaging.ICONINFOEXW* piconinfo)
#cfunc GetIconInfoExW "GetIconInfoExW" intptr, var

; winmdroot.Foundation.BOOL GetInputState()
#cfunc GetInputState "GetInputState"

; uint GetKBCodePage()
#cfunc GetKBCodePage "GetKBCodePage"

; int GetKeyNameText(int lParam, winmdroot.Foundation.PWSTR lpString, int cchSize)
#cfunc GetKeyNameTextW "GetKeyNameTextW" int, wstr, int

; short GetKeyState(int nVirtKey)
#cfunc GetKeyState "GetKeyState" int

; winmdroot.UI.Input.KeyboardAndMouse.HKL GetKeyboardLayout(uint idThread)
#cfunc GetKeyboardLayout "GetKeyboardLayout" int

; int GetKeyboardLayoutList(int nBuff, [Optional] winmdroot.UI.Input.KeyboardAndMouse.HKL* lpList)
#cfunc GetKeyboardLayoutList "GetKeyboardLayoutList" int, intptr

; winmdroot.Foundation.BOOL GetKeyboardLayoutName(winmdroot.Foundation.PWSTR pwszKLID)
#cfunc GetKeyboardLayoutNameW "GetKeyboardLayoutNameW" wstr

; winmdroot.Foundation.BOOL GetKeyboardState(byte* lpKeyState)
#cfunc GetKeyboardState "GetKeyboardState" var

; int GetKeyboardType(int nTypeFlag)
#cfunc GetKeyboardType "GetKeyboardType" int

; winmdroot.Foundation.HWND GetLastActivePopup(winmdroot.Foundation.HWND hWnd)
#cfunc GetLastActivePopup "GetLastActivePopup" intptr

; winmdroot.Foundation.BOOL GetLastInputInfo(winmdroot.UI.Input.KeyboardAndMouse.LASTINPUTINFO* plii)
#cfunc GetLastInputInfo "GetLastInputInfo" var

; winmdroot.Foundation.BOOL GetLayeredWindowAttributes(winmdroot.Foundation.HWND hwnd, [Optional] winmdroot.Foundation.COLORREF* pcrKey, [Optional] byte* pbAlpha, [Optional] winmdroot.UI.WindowsAndMessaging.LAYERED_WINDOW_ATTRIBUTES_FLAGS* pdwFlags)
#cfunc GetLayeredWindowAttributes "GetLayeredWindowAttributes" intptr, var, var, var

; uint GetListBoxInfo(winmdroot.Foundation.HWND hwnd)
#cfunc GetListBoxInfo "GetListBoxInfo" intptr

; winmdroot.UI.WindowsAndMessaging.HMENU GetMenu(winmdroot.Foundation.HWND hWnd)
#cfunc GetMenu "GetMenu" intptr

; winmdroot.Foundation.BOOL GetMenuBarInfo(winmdroot.Foundation.HWND hwnd, winmdroot.UI.WindowsAndMessaging.OBJECT_IDENTIFIER idObject, int idItem, winmdroot.UI.WindowsAndMessaging.MENUBARINFO* pmbi)
#cfunc GetMenuBarInfo "GetMenuBarInfo" intptr, int, int, var

; int GetMenuCheckMarkDimensions()
#cfunc GetMenuCheckMarkDimensions "GetMenuCheckMarkDimensions"

; uint GetMenuContextHelpId(winmdroot.UI.WindowsAndMessaging.HMENU param0)
#cfunc GetMenuContextHelpId "GetMenuContextHelpId" intptr

; uint GetMenuDefaultItem(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, uint fByPos, winmdroot.UI.WindowsAndMessaging.GET_MENU_DEFAULT_ITEM_FLAGS gmdiFlags)
#cfunc GetMenuDefaultItem "GetMenuDefaultItem" intptr, int, int

; winmdroot.Foundation.BOOL GetMenuInfo(winmdroot.UI.WindowsAndMessaging.HMENU param0, winmdroot.UI.WindowsAndMessaging.MENUINFO* param1)
#cfunc GetMenuInfo "GetMenuInfo" intptr, var

; int GetMenuItemCount(winmdroot.UI.WindowsAndMessaging.HMENU hMenu)
#cfunc GetMenuItemCount "GetMenuItemCount" intptr

; uint GetMenuItemID(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, int nPos)
#cfunc GetMenuItemID "GetMenuItemID" intptr, int

; winmdroot.Foundation.BOOL GetMenuItemInfo(winmdroot.UI.WindowsAndMessaging.HMENU hmenu, uint item, winmdroot.Foundation.BOOL fByPosition, winmdroot.UI.WindowsAndMessaging.MENUITEMINFOW* lpmii)
#cfunc GetMenuItemInfoW "GetMenuItemInfoW" intptr, int, int, var

; winmdroot.Foundation.BOOL GetMenuItemRect(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.HMENU hMenu, uint uItem, winmdroot.Foundation.RECT* lprcItem)
#cfunc GetMenuItemRect "GetMenuItemRect" intptr, intptr, int, var

; uint GetMenuState(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, uint uId, winmdroot.UI.WindowsAndMessaging.MENU_ITEM_FLAGS uFlags)
#cfunc GetMenuState "GetMenuState" intptr, int, int

; int GetMenuStringW(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, uint uIDItem, winmdroot.Foundation.PWSTR lpString, int cchMax, winmdroot.UI.WindowsAndMessaging.MENU_ITEM_FLAGS flags)
#cfunc GetMenuStringW "GetMenuStringW" intptr, int, wstr, int, int

; winmdroot.Foundation.BOOL GetMessage(winmdroot.UI.WindowsAndMessaging.MSG* lpMsg, winmdroot.Foundation.HWND hWnd, uint wMsgFilterMin, uint wMsgFilterMax)
#cfunc GetMessageW "GetMessageW" var, intptr, int, int

; winmdroot.Foundation.LPARAM GetMessageExtraInfo()
#cfunc GetMessageExtraInfo "GetMessageExtraInfo"

; uint GetMessagePos()
#cfunc GetMessagePos "GetMessagePos"

; int GetMessageTime()
#cfunc GetMessageTime "GetMessageTime"

; winmdroot.Foundation.BOOL GetMonitorInfoW(winmdroot.Graphics.Gdi.HMONITOR hMonitor, winmdroot.Graphics.Gdi.MONITORINFO* lpmi)
#cfunc GetMonitorInfoW "GetMonitorInfoW" intptr, var

; int GetMouseMovePointsEx(uint cbSize, winmdroot.UI.Input.KeyboardAndMouse.MOUSEMOVEPOINT* lppt, winmdroot.UI.Input.KeyboardAndMouse.MOUSEMOVEPOINT* lpptBuf, int nBufPoints, winmdroot.UI.Input.KeyboardAndMouse.GET_MOUSE_MOVE_POINTS_EX_RESOLUTION resolution)
#cfunc GetMouseMovePointsEx "GetMouseMovePointsEx" int, var, var, int, int

; winmdroot.Foundation.HWND GetNextDlgGroupItem(winmdroot.Foundation.HWND hDlg, winmdroot.Foundation.HWND hCtl, winmdroot.Foundation.BOOL bPrevious)
#cfunc GetNextDlgGroupItem "GetNextDlgGroupItem" intptr, intptr, int

; winmdroot.Foundation.HWND GetNextDlgTabItem(winmdroot.Foundation.HWND hDlg, winmdroot.Foundation.HWND hCtl, winmdroot.Foundation.BOOL bPrevious)
#cfunc GetNextDlgTabItem "GetNextDlgTabItem" intptr, intptr, int

; winmdroot.Foundation.HWND GetOpenClipboardWindow()
#cfunc GetOpenClipboardWindow "GetOpenClipboardWindow"

; winmdroot.Foundation.HWND GetParent(winmdroot.Foundation.HWND hWnd)
#cfunc GetParent "GetParent" intptr

; winmdroot.Foundation.BOOL GetPhysicalCursorPos(global::System.Drawing.Point* lpPoint)
#cfunc GetPhysicalCursorPos "GetPhysicalCursorPos" var

; winmdroot.Foundation.BOOL GetPointerCursorId(uint pointerId, uint* cursorId)
#cfunc GetPointerCursorId "GetPointerCursorId" int, var

; winmdroot.Foundation.BOOL GetPointerDevice(winmdroot.Foundation.HANDLE device, winmdroot.UI.Controls.POINTER_DEVICE_INFO* pointerDevice)
#cfunc GetPointerDevice "GetPointerDevice" intptr, var

; winmdroot.Foundation.BOOL GetPointerDeviceCursors(winmdroot.Foundation.HANDLE device, uint* cursorCount, [Optional] winmdroot.UI.Controls.POINTER_DEVICE_CURSOR_INFO* deviceCursors)
#cfunc GetPointerDeviceCursors "GetPointerDeviceCursors" intptr, var, var

; winmdroot.Foundation.BOOL GetPointerDeviceProperties(winmdroot.Foundation.HANDLE device, uint* propertyCount, [Optional] winmdroot.UI.Controls.POINTER_DEVICE_PROPERTY* pointerProperties)
#cfunc GetPointerDeviceProperties "GetPointerDeviceProperties" intptr, var, var

; winmdroot.Foundation.BOOL GetPointerDeviceRects(winmdroot.Foundation.HANDLE device, winmdroot.Foundation.RECT* pointerDeviceRect, winmdroot.Foundation.RECT* displayRect)
#cfunc GetPointerDeviceRects "GetPointerDeviceRects" intptr, var, var

; winmdroot.Foundation.BOOL GetPointerDevices(uint* deviceCount, [Optional] winmdroot.UI.Controls.POINTER_DEVICE_INFO* pointerDevices)
#cfunc GetPointerDevices "GetPointerDevices" var, var

; winmdroot.Foundation.BOOL GetPointerFrameInfo(uint pointerId, uint* pointerCount, [Optional] winmdroot.UI.Input.Pointer.POINTER_INFO* pointerInfo)
#cfunc GetPointerFrameInfo "GetPointerFrameInfo" int, var, var

; winmdroot.Foundation.BOOL GetPointerFrameInfoHistory(uint pointerId, uint* entriesCount, uint* pointerCount, [Optional] winmdroot.UI.Input.Pointer.POINTER_INFO* pointerInfo)
#cfunc GetPointerFrameInfoHistory "GetPointerFrameInfoHistory" int, var, var, var

; winmdroot.Foundation.BOOL GetPointerFramePenInfo(uint pointerId, uint* pointerCount, [Optional] winmdroot.UI.Input.Pointer.POINTER_PEN_INFO* penInfo)
#cfunc GetPointerFramePenInfo "GetPointerFramePenInfo" int, var, var

; winmdroot.Foundation.BOOL GetPointerFramePenInfoHistory(uint pointerId, uint* entriesCount, uint* pointerCount, [Optional] winmdroot.UI.Input.Pointer.POINTER_PEN_INFO* penInfo)
#cfunc GetPointerFramePenInfoHistory "GetPointerFramePenInfoHistory" int, var, var, var

; winmdroot.Foundation.BOOL GetPointerFrameTouchInfo(uint pointerId, uint* pointerCount, [Optional] winmdroot.UI.Input.Pointer.POINTER_TOUCH_INFO* touchInfo)
#cfunc GetPointerFrameTouchInfo "GetPointerFrameTouchInfo" int, var, var

; winmdroot.Foundation.BOOL GetPointerFrameTouchInfoHistory(uint pointerId, uint* entriesCount, uint* pointerCount, [Optional] winmdroot.UI.Input.Pointer.POINTER_TOUCH_INFO* touchInfo)
#cfunc GetPointerFrameTouchInfoHistory "GetPointerFrameTouchInfoHistory" int, var, var, var

; winmdroot.Foundation.BOOL GetPointerInfo(uint pointerId, winmdroot.UI.Input.Pointer.POINTER_INFO* pointerInfo)
#cfunc GetPointerInfo "GetPointerInfo" int, var

; winmdroot.Foundation.BOOL GetPointerInfoHistory(uint pointerId, uint* entriesCount, [Optional] winmdroot.UI.Input.Pointer.POINTER_INFO* pointerInfo)
#cfunc GetPointerInfoHistory "GetPointerInfoHistory" int, var, var

; winmdroot.Foundation.BOOL GetPointerInputTransform(uint pointerId, uint historyCount, winmdroot.UI.Input.Pointer.INPUT_TRANSFORM* inputTransform)
#cfunc GetPointerInputTransform "GetPointerInputTransform" int, int, var

; winmdroot.Foundation.BOOL GetPointerPenInfo(uint pointerId, winmdroot.UI.Input.Pointer.POINTER_PEN_INFO* penInfo)
#cfunc GetPointerPenInfo "GetPointerPenInfo" int, var

; winmdroot.Foundation.BOOL GetPointerPenInfoHistory(uint pointerId, uint* entriesCount, [Optional] winmdroot.UI.Input.Pointer.POINTER_PEN_INFO* penInfo)
#cfunc GetPointerPenInfoHistory "GetPointerPenInfoHistory" int, var, var

; winmdroot.Foundation.BOOL GetPointerTouchInfo(uint pointerId, winmdroot.UI.Input.Pointer.POINTER_TOUCH_INFO* touchInfo)
#cfunc GetPointerTouchInfo "GetPointerTouchInfo" int, var

; winmdroot.Foundation.BOOL GetPointerTouchInfoHistory(uint pointerId, uint* entriesCount, [Optional] winmdroot.UI.Input.Pointer.POINTER_TOUCH_INFO* touchInfo)
#cfunc GetPointerTouchInfoHistory "GetPointerTouchInfoHistory" int, var, var

; winmdroot.Foundation.BOOL GetPointerType(uint pointerId, winmdroot.UI.WindowsAndMessaging.POINTER_INPUT_TYPE* pointerType)
#cfunc GetPointerType "GetPointerType" int, var

; int GetPriorityClipboardFormat(uint* paFormatPriorityList, int cFormats)
#cfunc GetPriorityClipboardFormat "GetPriorityClipboardFormat" var, int

; winmdroot.Foundation.BOOL GetProcessDefaultLayout(uint* pdwDefaultLayout)
#cfunc GetProcessDefaultLayout "GetProcessDefaultLayout" var

; winmdroot.System.StationsAndDesktops.HWINSTA GetProcessWindowStation()
#cfunc GetProcessWindowStation "GetProcessWindowStation"

; winmdroot.Foundation.HANDLE GetPropW(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.PCWSTR lpString)
#cfunc GetPropW "GetPropW" intptr, wstr

; uint GetQueueStatus(winmdroot.UI.WindowsAndMessaging.QUEUE_STATUS_FLAGS flags)
#cfunc GetQueueStatus "GetQueueStatus" int

; uint GetRawInputBuffer([Optional] winmdroot.UI.Input.RAWINPUT* pData, uint* pcbSize, uint cbSizeHeader)
#cfunc GetRawInputBuffer "GetRawInputBuffer" var, var, int

; uint GetRawInputData(winmdroot.UI.Input.HRAWINPUT hRawInput, winmdroot.UI.Input.RAW_INPUT_DATA_COMMAND_FLAGS uiCommand, [Optional] void* pData, uint* pcbSize, uint cbSizeHeader)
#cfunc GetRawInputData "GetRawInputData" intptr, int, intptr, var, int

; uint GetRawInputDeviceInfo(winmdroot.Foundation.HANDLE hDevice, winmdroot.UI.Input.RAW_INPUT_DEVICE_INFO_COMMAND uiCommand, [Optional] void* pData, uint* pcbSize)
#cfunc GetRawInputDeviceInfoW "GetRawInputDeviceInfoW" intptr, int, intptr, var

; uint GetRawInputDeviceList([Optional] winmdroot.UI.Input.RAWINPUTDEVICELIST* pRawInputDeviceList, uint* puiNumDevices, uint cbSize)
#cfunc GetRawInputDeviceList "GetRawInputDeviceList" var, var, int

; winmdroot.Foundation.BOOL GetRawPointerDeviceData(uint pointerId, uint historyCount, uint propertiesCount, winmdroot.UI.Controls.POINTER_DEVICE_PROPERTY* pProperties, int* pValues)
#cfunc GetRawPointerDeviceData "GetRawPointerDeviceData" int, int, int, var, var

; uint GetRegisteredRawInputDevices([Optional] winmdroot.UI.Input.RAWINPUTDEVICE* pRawInputDevices, uint* puiNumDevices, uint cbSize)
#cfunc GetRegisteredRawInputDevices "GetRegisteredRawInputDevices" var, var, int

; winmdroot.Foundation.BOOL GetScrollBarInfo(winmdroot.Foundation.HWND hwnd, winmdroot.UI.WindowsAndMessaging.OBJECT_IDENTIFIER idObject, winmdroot.UI.WindowsAndMessaging.SCROLLBARINFO* psbi)
#cfunc GetScrollBarInfo "GetScrollBarInfo" intptr, int, var

; winmdroot.Foundation.BOOL GetScrollInfo(winmdroot.Foundation.HWND hwnd, winmdroot.UI.WindowsAndMessaging.SCROLLBAR_CONSTANTS nBar, winmdroot.UI.WindowsAndMessaging.SCROLLINFO* lpsi)
#cfunc GetScrollInfo "GetScrollInfo" intptr, int, var

; int GetScrollPos(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.SCROLLBAR_CONSTANTS nBar)
#cfunc GetScrollPos "GetScrollPos" intptr, int

; winmdroot.Foundation.BOOL GetScrollRange(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.SCROLLBAR_CONSTANTS nBar, int* lpMinPos, int* lpMaxPos)
#cfunc GetScrollRange "GetScrollRange" intptr, int, var, var

; winmdroot.Foundation.HWND GetShellWindow()
#cfunc GetShellWindow "GetShellWindow"

; winmdroot.UI.WindowsAndMessaging.HMENU GetSubMenu(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, int nPos)
#cfunc GetSubMenu "GetSubMenu" intptr, int

; uint GetSysColor(winmdroot.Graphics.Gdi.SYS_COLOR_INDEX nIndex)
#cfunc GetSysColor "GetSysColor" int

; winmdroot.Graphics.Gdi.HBRUSH GetSysColorBrush(winmdroot.Graphics.Gdi.SYS_COLOR_INDEX nIndex)
#cfunc GetSysColorBrush "GetSysColorBrush" int

; uint GetSystemDpiForProcess(winmdroot.Foundation.HANDLE hProcess)
#cfunc GetSystemDpiForProcess "GetSystemDpiForProcess" intptr

; winmdroot.UI.WindowsAndMessaging.HMENU GetSystemMenu(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.BOOL bRevert)
#cfunc GetSystemMenu "GetSystemMenu" intptr, int

; int GetSystemMetrics(winmdroot.UI.WindowsAndMessaging.SYSTEM_METRICS_INDEX nIndex)
#cfunc GetSystemMetrics "GetSystemMetrics" int

; int GetSystemMetricsForDpi(winmdroot.UI.WindowsAndMessaging.SYSTEM_METRICS_INDEX nIndex, uint dpi)
#cfunc GetSystemMetricsForDpi "GetSystemMetricsForDpi" int, int

; uint GetTabbedTextExtentW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.PCWSTR lpString, int chCount, int nTabPositions, [Optional] int* lpnTabStopPositions)
#cfunc GetTabbedTextExtentW "GetTabbedTextExtentW" intptr, wstr, int, int, var

; winmdroot.System.StationsAndDesktops.HDESK GetThreadDesktop(uint dwThreadId)
#cfunc GetThreadDesktop "GetThreadDesktop" int

; winmdroot.UI.HiDpi.DPI_AWARENESS_CONTEXT GetThreadDpiAwarenessContext()
#cfunc GetThreadDpiAwarenessContext "GetThreadDpiAwarenessContext"

; winmdroot.UI.HiDpi.DPI_HOSTING_BEHAVIOR GetThreadDpiHostingBehavior()
#cfunc GetThreadDpiHostingBehavior "GetThreadDpiHostingBehavior"

; winmdroot.Foundation.BOOL GetTitleBarInfo(winmdroot.Foundation.HWND hwnd, winmdroot.UI.WindowsAndMessaging.TITLEBARINFO* pti)
#cfunc GetTitleBarInfo "GetTitleBarInfo" intptr, var

; winmdroot.Foundation.HWND GetTopWindow(winmdroot.Foundation.HWND hWnd)
#cfunc GetTopWindow "GetTopWindow" intptr

; winmdroot.Foundation.BOOL GetTouchInputInfo(winmdroot.UI.Input.Touch.HTOUCHINPUT hTouchInput, uint cInputs, winmdroot.UI.Input.Touch.TOUCHINPUT* pInputs, int cbSize)
#cfunc GetTouchInputInfo "GetTouchInputInfo" intptr, int, var, int

; uint GetUnpredictedMessagePos()
#cfunc GetUnpredictedMessagePos "GetUnpredictedMessagePos"

; winmdroot.Foundation.BOOL GetUpdateRect(winmdroot.Foundation.HWND hWnd, [Optional] winmdroot.Foundation.RECT* lpRect, winmdroot.Foundation.BOOL bErase)
#cfunc GetUpdateRect "GetUpdateRect" intptr, var, int

; winmdroot.Graphics.Gdi.GDI_REGION_TYPE GetUpdateRgn(winmdroot.Foundation.HWND hWnd, winmdroot.Graphics.Gdi.HRGN hRgn, winmdroot.Foundation.BOOL bErase)
#cfunc GetUpdateRgn "GetUpdateRgn" intptr, intptr, int

; winmdroot.Foundation.BOOL GetUpdatedClipboardFormats(uint* lpuiFormats, uint cFormats, uint* pcFormatsOut)
#cfunc GetUpdatedClipboardFormats "GetUpdatedClipboardFormats" var, int, var

; winmdroot.Foundation.BOOL GetUserObjectInformation(winmdroot.Foundation.HANDLE hObj, winmdroot.System.StationsAndDesktops.USER_OBJECT_INFORMATION_INDEX nIndex, [Optional] void* pvInfo, uint nLength, [Optional] uint* lpnLengthNeeded)
#cfunc GetUserObjectInformationW "GetUserObjectInformationW" intptr, int, intptr, int, var

; winmdroot.Foundation.BOOL GetUserObjectSecurity(winmdroot.Foundation.HANDLE hObj, uint* pSIRequested, winmdroot.Security.PSECURITY_DESCRIPTOR pSID, uint nLength, uint* lpnLengthNeeded)
#cfunc GetUserObjectSecurity "GetUserObjectSecurity" intptr, var, int, int, var

; winmdroot.Foundation.HWND GetWindow(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.GET_WINDOW_CMD uCmd)
#cfunc GetWindow "GetWindow" intptr, int

; uint GetWindowContextHelpId(winmdroot.Foundation.HWND param0)
#cfunc GetWindowContextHelpId "GetWindowContextHelpId" intptr

; winmdroot.Graphics.Gdi.HDC GetWindowDC(winmdroot.Foundation.HWND hWnd)
#cfunc GetWindowDC "GetWindowDC" intptr

; winmdroot.Foundation.BOOL GetWindowDisplayAffinity(winmdroot.Foundation.HWND hWnd, uint* pdwAffinity)
#cfunc GetWindowDisplayAffinity "GetWindowDisplayAffinity" intptr, var

; winmdroot.UI.HiDpi.DPI_AWARENESS_CONTEXT GetWindowDpiAwarenessContext(winmdroot.Foundation.HWND hwnd)
#cfunc GetWindowDpiAwarenessContext "GetWindowDpiAwarenessContext" intptr

; winmdroot.UI.HiDpi.DPI_HOSTING_BEHAVIOR GetWindowDpiHostingBehavior(winmdroot.Foundation.HWND hwnd)
#cfunc GetWindowDpiHostingBehavior "GetWindowDpiHostingBehavior" intptr

; winmdroot.Foundation.BOOL GetWindowFeedbackSetting(winmdroot.Foundation.HWND hwnd, winmdroot.UI.Controls.FEEDBACK_TYPE feedback, uint dwFlags, uint* pSize, [Optional] void* config)
#cfunc GetWindowFeedbackSetting "GetWindowFeedbackSetting" intptr, int, int, var, intptr

; winmdroot.Foundation.BOOL GetWindowInfo(winmdroot.Foundation.HWND hwnd, winmdroot.UI.WindowsAndMessaging.WINDOWINFO* pwi)
#cfunc GetWindowInfo "GetWindowInfo" intptr, var

; int GetWindowLong(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.WINDOW_LONG_PTR_INDEX nIndex)
#cfunc GetWindowLongW "GetWindowLongW" intptr, int

; uint GetWindowModuleFileNameW(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.PWSTR pszFileName, uint cchFileNameMax)
#cfunc GetWindowModuleFileNameW "GetWindowModuleFileNameW" intptr, wstr, int

; winmdroot.Foundation.BOOL GetWindowPlacement(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.WINDOWPLACEMENT* lpwndpl)
#cfunc GetWindowPlacement "GetWindowPlacement" intptr, var

; winmdroot.Foundation.BOOL GetWindowRect(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.RECT* lpRect)
#cfunc GetWindowRect "GetWindowRect" intptr, var

; winmdroot.Graphics.Gdi.GDI_REGION_TYPE GetWindowRgn(winmdroot.Foundation.HWND hWnd, winmdroot.Graphics.Gdi.HRGN hRgn)
#cfunc GetWindowRgn "GetWindowRgn" intptr, intptr

; winmdroot.Graphics.Gdi.GDI_REGION_TYPE GetWindowRgnBox(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.RECT* lprc)
#cfunc GetWindowRgnBox "GetWindowRgnBox" intptr, var

; int GetWindowText(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.PWSTR lpString, int nMaxCount)
#cfunc GetWindowTextW "GetWindowTextW" intptr, wstr, int

; int GetWindowTextLength(winmdroot.Foundation.HWND hWnd)
#cfunc GetWindowTextLengthW "GetWindowTextLengthW" intptr

; uint GetWindowThreadProcessId(winmdroot.Foundation.HWND hWnd, [Optional] uint* lpdwProcessId)
#cfunc GetWindowThreadProcessId "GetWindowThreadProcessId" intptr, var

; ushort GetWindowWord(winmdroot.Foundation.HWND hWnd, int nIndex)
#cfunc GetWindowWord "GetWindowWord" intptr, int

; winmdroot.Foundation.BOOL GrayStringW(winmdroot.Graphics.Gdi.HDC hDC, winmdroot.Graphics.Gdi.HBRUSH hBrush, delegate *unmanaged[Stdcall]<global::Windows.Win32.Graphics.Gdi.HDC,global::Windows.Win32.Foundation.LPARAM,int,global::Windows.Win32.Foundation.BOOL> lpOutputFunc, winmdroot.Foundation.LPARAM lpData, int nCount, int X, int Y, int nWidth, int nHeight)
#cfunc GrayStringW "GrayStringW" intptr, intptr, int, intptr, int, int, int, int, int

; winmdroot.Foundation.BOOL HideCaret(winmdroot.Foundation.HWND hWnd)
#cfunc HideCaret "HideCaret" intptr

; winmdroot.Foundation.BOOL HiliteMenuItem(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.HMENU hMenu, uint uIDHiliteItem, uint uHilite)
#cfunc HiliteMenuItem "HiliteMenuItem" intptr, intptr, int, int

; winmdroot.Foundation.BOOL IMPGetIMEA(winmdroot.Foundation.HWND param0, winmdroot.System.WindowsProgramming.IMEPROA* param1)
#cfunc IMPGetIMEA "IMPGetIMEA" intptr, var

; winmdroot.Foundation.BOOL IMPGetIMEW(winmdroot.Foundation.HWND param0, winmdroot.System.WindowsProgramming.IMEPROW* param1)
#cfunc IMPGetIMEW "IMPGetIMEW" intptr, var

; winmdroot.Foundation.BOOL IMPQueryIMEA(winmdroot.System.WindowsProgramming.IMEPROA* param0)
#cfunc IMPQueryIMEA "IMPQueryIMEA" var

; winmdroot.Foundation.BOOL IMPQueryIMEW(winmdroot.System.WindowsProgramming.IMEPROW* param0)
#cfunc IMPQueryIMEW "IMPQueryIMEW" var

; winmdroot.Foundation.BOOL IMPSetIMEA(winmdroot.Foundation.HWND param0, winmdroot.System.WindowsProgramming.IMEPROA* param1)
#cfunc IMPSetIMEA "IMPSetIMEA" intptr, var

; winmdroot.Foundation.BOOL IMPSetIMEW(winmdroot.Foundation.HWND param0, winmdroot.System.WindowsProgramming.IMEPROW* param1)
#cfunc IMPSetIMEW "IMPSetIMEW" intptr, var

; winmdroot.Foundation.BOOL ImpersonateDdeClientWindow(winmdroot.Foundation.HWND hWndClient, winmdroot.Foundation.HWND hWndServer)
#cfunc ImpersonateDdeClientWindow "ImpersonateDdeClientWindow" intptr, intptr

; winmdroot.Foundation.BOOL InSendMessage()
#cfunc InSendMessage "InSendMessage"

; uint InSendMessageEx([Optional] void* lpReserved)
#cfunc InSendMessageEx "InSendMessageEx" intptr

; winmdroot.Foundation.BOOL InflateRect(winmdroot.Foundation.RECT* lprc, int dx, int dy)
#cfunc InflateRect "InflateRect" var, int, int

; winmdroot.Foundation.BOOL InheritWindowMonitor(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.HWND hwndInherit)
#cfunc InheritWindowMonitor "InheritWindowMonitor" intptr, intptr

; winmdroot.Foundation.BOOL InitializeTouchInjection(uint maxCount, winmdroot.UI.Input.Pointer.TOUCH_FEEDBACK_MODE dwMode)
#cfunc InitializeTouchInjection "InitializeTouchInjection" int, int

; winmdroot.Foundation.BOOL InjectSyntheticPointerInput(winmdroot.UI.Controls.HSYNTHETICPOINTERDEVICE device, winmdroot.UI.Controls.POINTER_TYPE_INFO* pointerInfo, uint count)
#cfunc InjectSyntheticPointerInput "InjectSyntheticPointerInput" intptr, var, int

; winmdroot.Foundation.BOOL InjectTouchInput(uint count, winmdroot.UI.Input.Pointer.POINTER_TOUCH_INFO* contacts)
#cfunc InjectTouchInput "InjectTouchInput" int, var

; winmdroot.Foundation.BOOL InsertMenu(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, uint uPosition, winmdroot.UI.WindowsAndMessaging.MENU_ITEM_FLAGS uFlags, nuint uIDNewItem, winmdroot.Foundation.PCWSTR lpNewItem)
#cfunc InsertMenuW "InsertMenuW" intptr, int, int, int, wstr

; winmdroot.Foundation.BOOL InsertMenuItem(winmdroot.UI.WindowsAndMessaging.HMENU hmenu, uint item, winmdroot.Foundation.BOOL fByPosition, winmdroot.UI.WindowsAndMessaging.MENUITEMINFOW* lpmi)
#cfunc InsertMenuItemW "InsertMenuItemW" intptr, int, int, var

; int InternalGetWindowText(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.PWSTR pString, int cchMaxCount)
#cfunc InternalGetWindowText "InternalGetWindowText" intptr, wstr, int

; winmdroot.Foundation.BOOL IntersectRect(winmdroot.Foundation.RECT* lprcDst, winmdroot.Foundation.RECT* lprcSrc1, winmdroot.Foundation.RECT* lprcSrc2)
#cfunc IntersectRect "IntersectRect" var, var, var

; winmdroot.Foundation.BOOL InvalidateRect(winmdroot.Foundation.HWND hWnd, [Optional] winmdroot.Foundation.RECT* lpRect, winmdroot.Foundation.BOOL bErase)
#cfunc InvalidateRect "InvalidateRect" intptr, var, int

; winmdroot.Foundation.BOOL InvalidateRgn(winmdroot.Foundation.HWND hWnd, winmdroot.Graphics.Gdi.HRGN hRgn, winmdroot.Foundation.BOOL bErase)
#cfunc InvalidateRgn "InvalidateRgn" intptr, intptr, int

; winmdroot.Foundation.BOOL InvertRect(winmdroot.Graphics.Gdi.HDC hDC, winmdroot.Foundation.RECT* lprc)
#cfunc InvertRect "InvertRect" intptr, var

; winmdroot.Foundation.BOOL IsCharAlpha(char ch)
#cfunc IsCharAlphaW "IsCharAlphaW" int

; winmdroot.Foundation.BOOL IsCharAlphaNumeric(char ch)
#cfunc IsCharAlphaNumericW "IsCharAlphaNumericW" int

; winmdroot.Foundation.BOOL IsCharUpper(char ch)
#cfunc IsCharUpperW "IsCharUpperW" int

; winmdroot.Foundation.BOOL IsChild(winmdroot.Foundation.HWND hWndParent, winmdroot.Foundation.HWND hWnd)
#cfunc IsChild "IsChild" intptr, intptr

; winmdroot.Foundation.BOOL IsClipboardFormatAvailable(uint format)
#cfunc IsClipboardFormatAvailable "IsClipboardFormatAvailable" int

; winmdroot.Foundation.BOOL IsDialogMessageW(winmdroot.Foundation.HWND hDlg, winmdroot.UI.WindowsAndMessaging.MSG* lpMsg)
#cfunc IsDialogMessageW "IsDialogMessageW" intptr, var

; uint IsDlgButtonChecked(winmdroot.Foundation.HWND hDlg, int nIDButton)
#cfunc IsDlgButtonChecked "IsDlgButtonChecked" intptr, int

; winmdroot.Foundation.BOOL IsGUIThread(winmdroot.Foundation.BOOL bConvert)
#cfunc IsGUIThread "IsGUIThread" int

; winmdroot.Foundation.BOOL IsHungAppWindow(winmdroot.Foundation.HWND hwnd)
#cfunc IsHungAppWindow "IsHungAppWindow" intptr

; winmdroot.Foundation.BOOL IsIconic(winmdroot.Foundation.HWND hWnd)
#cfunc IsIconic "IsIconic" intptr

; winmdroot.Foundation.BOOL IsImmersiveProcess(winmdroot.Foundation.HANDLE hProcess)
#cfunc IsImmersiveProcess "IsImmersiveProcess" intptr

; winmdroot.Foundation.BOOL IsMenu(winmdroot.UI.WindowsAndMessaging.HMENU hMenu)
#cfunc IsMenu "IsMenu" intptr

; winmdroot.Foundation.BOOL IsMouseInPointerEnabled()
#cfunc IsMouseInPointerEnabled "IsMouseInPointerEnabled"

; winmdroot.Foundation.BOOL IsProcessDPIAware()
#cfunc IsProcessDPIAware "IsProcessDPIAware"

; winmdroot.Foundation.BOOL IsRectEmpty(winmdroot.Foundation.RECT* lprc)
#cfunc IsRectEmpty "IsRectEmpty" var

; winmdroot.Foundation.BOOL IsTouchWindow(winmdroot.Foundation.HWND hwnd, [Optional] uint* pulFlags)
#cfunc IsTouchWindow "IsTouchWindow" intptr, var

; winmdroot.Foundation.BOOL IsValidDpiAwarenessContext(winmdroot.UI.HiDpi.DPI_AWARENESS_CONTEXT value)
#cfunc IsValidDpiAwarenessContext "IsValidDpiAwarenessContext" intptr

; winmdroot.Foundation.BOOL IsWinEventHookInstalled(uint @event)
#cfunc IsWinEventHookInstalled "IsWinEventHookInstalled" int

; winmdroot.Foundation.BOOL IsWindow(winmdroot.Foundation.HWND hWnd)
#cfunc IsWindow "IsWindow" intptr

; winmdroot.Foundation.BOOL IsWindowArranged(winmdroot.Foundation.HWND hwnd)
#cfunc IsWindowArranged "IsWindowArranged" intptr

; winmdroot.Foundation.BOOL IsWindowEnabled(winmdroot.Foundation.HWND hWnd)
#cfunc IsWindowEnabled "IsWindowEnabled" intptr

; winmdroot.Foundation.BOOL IsWindowUnicode(winmdroot.Foundation.HWND hWnd)
#cfunc IsWindowUnicode "IsWindowUnicode" intptr

; winmdroot.Foundation.BOOL IsWindowVisible(winmdroot.Foundation.HWND hWnd)
#cfunc IsWindowVisible "IsWindowVisible" intptr

; winmdroot.Foundation.BOOL IsWow64Message()
#cfunc IsWow64Message "IsWow64Message"

; winmdroot.Foundation.BOOL IsZoomed(winmdroot.Foundation.HWND hWnd)
#cfunc IsZoomed "IsZoomed" intptr

; winmdroot.Foundation.BOOL KillTimer(winmdroot.Foundation.HWND hWnd, nuint uIDEvent)
#cfunc KillTimer "KillTimer" intptr, int

; winmdroot.UI.WindowsAndMessaging.HACCEL LoadAccelerators(winmdroot.Foundation.HINSTANCE hInstance, winmdroot.Foundation.PCWSTR lpTableName)
#cfunc LoadAcceleratorsW "LoadAcceleratorsW" intptr, wstr

; winmdroot.Graphics.Gdi.HBITMAP LoadBitmapW(winmdroot.Foundation.HINSTANCE hInstance, winmdroot.Foundation.PCWSTR lpBitmapName)
#cfunc LoadBitmapW "LoadBitmapW" intptr, wstr

; winmdroot.UI.WindowsAndMessaging.HCURSOR LoadCursor(winmdroot.Foundation.HINSTANCE hInstance, winmdroot.Foundation.PCWSTR lpCursorName)
#cfunc LoadCursorW "LoadCursorW" intptr, wstr

; winmdroot.UI.WindowsAndMessaging.HCURSOR LoadCursorFromFile(winmdroot.Foundation.PCWSTR lpFileName)
#cfunc LoadCursorFromFileW "LoadCursorFromFileW" wstr

; winmdroot.UI.WindowsAndMessaging.HICON LoadIcon(winmdroot.Foundation.HINSTANCE hInstance, winmdroot.Foundation.PCWSTR lpIconName)
#cfunc LoadIconW "LoadIconW" intptr, wstr

; winmdroot.Foundation.HANDLE LoadImage(winmdroot.Foundation.HINSTANCE hInst, winmdroot.Foundation.PCWSTR name, winmdroot.UI.WindowsAndMessaging.GDI_IMAGE_TYPE type, int cx, int cy, winmdroot.UI.WindowsAndMessaging.IMAGE_FLAGS fuLoad)
#cfunc LoadImageW "LoadImageW" intptr, wstr, int, int, int, int

; winmdroot.UI.Input.KeyboardAndMouse.HKL LoadKeyboardLayout(winmdroot.Foundation.PCWSTR pwszKLID, winmdroot.UI.Input.KeyboardAndMouse.ACTIVATE_KEYBOARD_LAYOUT_FLAGS Flags)
#cfunc LoadKeyboardLayoutW "LoadKeyboardLayoutW" wstr, int

; winmdroot.UI.WindowsAndMessaging.HMENU LoadMenu(winmdroot.Foundation.HINSTANCE hInstance, winmdroot.Foundation.PCWSTR lpMenuName)
#cfunc LoadMenuW "LoadMenuW" intptr, wstr

; winmdroot.UI.WindowsAndMessaging.HMENU LoadMenuIndirect(void* lpMenuTemplate)
#cfunc LoadMenuIndirectW "LoadMenuIndirectW" intptr

; int LoadString(winmdroot.Foundation.HINSTANCE hInstance, uint uID, winmdroot.Foundation.PWSTR lpBuffer, int cchBufferMax)
#cfunc LoadStringW "LoadStringW" intptr, int, wstr, int

; winmdroot.Foundation.BOOL LockSetForegroundWindow(winmdroot.UI.WindowsAndMessaging.FOREGROUND_WINDOW_LOCK_CODE uLockCode)
#cfunc LockSetForegroundWindow "LockSetForegroundWindow" int

; winmdroot.Foundation.BOOL LockWindowUpdate(winmdroot.Foundation.HWND hWndLock)
#cfunc LockWindowUpdate "LockWindowUpdate" intptr

; winmdroot.Foundation.BOOL LockWorkStation()
#cfunc LockWorkStation "LockWorkStation"

; winmdroot.Foundation.BOOL LogicalToPhysicalPoint(winmdroot.Foundation.HWND hWnd, global::System.Drawing.Point* lpPoint)
#cfunc LogicalToPhysicalPoint "LogicalToPhysicalPoint" intptr, var

; winmdroot.Foundation.BOOL LogicalToPhysicalPointForPerMonitorDPI(winmdroot.Foundation.HWND hWnd, global::System.Drawing.Point* lpPoint)
#cfunc LogicalToPhysicalPointForPerMonitorDPI "LogicalToPhysicalPointForPerMonitorDPI" intptr, var

; int LookupIconIdFromDirectory(byte* presbits, winmdroot.Foundation.BOOL fIcon)
#cfunc LookupIconIdFromDirectory "LookupIconIdFromDirectory" var, int

; int LookupIconIdFromDirectoryEx(byte* presbits, winmdroot.Foundation.BOOL fIcon, int cxDesired, int cyDesired, winmdroot.UI.WindowsAndMessaging.IMAGE_FLAGS Flags)
#cfunc LookupIconIdFromDirectoryEx "LookupIconIdFromDirectoryEx" var, int, int, int, int

; winmdroot.Foundation.BOOL MapDialogRect(winmdroot.Foundation.HWND hDlg, winmdroot.Foundation.RECT* lpRect)
#cfunc MapDialogRect "MapDialogRect" intptr, var

; uint MapVirtualKeyW(uint uCode, winmdroot.UI.Input.KeyboardAndMouse.MAP_VIRTUAL_KEY_TYPE uMapType)
#cfunc MapVirtualKeyW "MapVirtualKeyW" int, int

; uint MapVirtualKeyExW(uint uCode, winmdroot.UI.Input.KeyboardAndMouse.MAP_VIRTUAL_KEY_TYPE uMapType, winmdroot.UI.Input.KeyboardAndMouse.HKL dwhkl)
#cfunc MapVirtualKeyExW "MapVirtualKeyExW" int, int, intptr

; int MapWindowPoints(winmdroot.Foundation.HWND hWndFrom, winmdroot.Foundation.HWND hWndTo, global::System.Drawing.Point* lpPoints, uint cPoints)
#cfunc MapWindowPoints "MapWindowPoints" intptr, intptr, var, int

; int MenuItemFromPoint(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.HMENU hMenu, global::System.Drawing.Point ptScreen)
#cfunc MenuItemFromPoint "MenuItemFromPoint" intptr, intptr, int

; winmdroot.Foundation.BOOL MessageBeep(winmdroot.UI.WindowsAndMessaging.MESSAGEBOX_STYLE uType)
#cfunc MessageBeep "MessageBeep" int

; winmdroot.UI.WindowsAndMessaging.MESSAGEBOX_RESULT MessageBox(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.PCWSTR lpText, winmdroot.Foundation.PCWSTR lpCaption, winmdroot.UI.WindowsAndMessaging.MESSAGEBOX_STYLE uType)
#cfunc MessageBoxW "MessageBoxW" intptr, wstr, wstr, int

; winmdroot.UI.WindowsAndMessaging.MESSAGEBOX_RESULT MessageBoxEx(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.PCWSTR lpText, winmdroot.Foundation.PCWSTR lpCaption, winmdroot.UI.WindowsAndMessaging.MESSAGEBOX_STYLE uType, ushort wLanguageId)
#cfunc MessageBoxExW "MessageBoxExW" intptr, wstr, wstr, int, int

; winmdroot.UI.WindowsAndMessaging.MESSAGEBOX_RESULT MessageBoxIndirectW(winmdroot.UI.WindowsAndMessaging.MSGBOXPARAMSW* lpmbp)
#cfunc MessageBoxIndirectW "MessageBoxIndirectW" var

; winmdroot.Foundation.BOOL ModifyMenu(winmdroot.UI.WindowsAndMessaging.HMENU hMnu, uint uPosition, winmdroot.UI.WindowsAndMessaging.MENU_ITEM_FLAGS uFlags, nuint uIDNewItem, winmdroot.Foundation.PCWSTR lpNewItem)
#cfunc ModifyMenuW "ModifyMenuW" intptr, int, int, int, wstr

; winmdroot.Graphics.Gdi.HMONITOR MonitorFromPoint(global::System.Drawing.Point pt, winmdroot.Graphics.Gdi.MONITOR_FROM_FLAGS dwFlags)
#cfunc MonitorFromPoint "MonitorFromPoint" int, int

; winmdroot.Graphics.Gdi.HMONITOR MonitorFromRect(winmdroot.Foundation.RECT* lprc, winmdroot.Graphics.Gdi.MONITOR_FROM_FLAGS dwFlags)
#cfunc MonitorFromRect "MonitorFromRect" var, int

; winmdroot.Graphics.Gdi.HMONITOR MonitorFromWindow(winmdroot.Foundation.HWND hwnd, winmdroot.Graphics.Gdi.MONITOR_FROM_FLAGS dwFlags)
#cfunc MonitorFromWindow "MonitorFromWindow" intptr, int

; winmdroot.Foundation.BOOL MoveWindow(winmdroot.Foundation.HWND hWnd, int X, int Y, int nWidth, int nHeight, winmdroot.Foundation.BOOL bRepaint)
#cfunc MoveWindow "MoveWindow" intptr, int, int, int, int, int

; winmdroot.Foundation.WAIT_EVENT MsgWaitForMultipleObjects(uint nCount, [Optional] winmdroot.Foundation.HANDLE* pHandles, winmdroot.Foundation.BOOL fWaitAll, uint dwMilliseconds, winmdroot.UI.WindowsAndMessaging.QUEUE_STATUS_FLAGS dwWakeMask)
#cfunc MsgWaitForMultipleObjects "MsgWaitForMultipleObjects" int, intptr, int, int, int

; winmdroot.Foundation.WAIT_EVENT MsgWaitForMultipleObjectsEx(uint nCount, [Optional] winmdroot.Foundation.HANDLE* pHandles, uint dwMilliseconds, winmdroot.UI.WindowsAndMessaging.QUEUE_STATUS_FLAGS dwWakeMask, winmdroot.UI.WindowsAndMessaging.MSG_WAIT_FOR_MULTIPLE_OBJECTS_EX_FLAGS dwFlags)
#cfunc MsgWaitForMultipleObjectsEx "MsgWaitForMultipleObjectsEx" int, intptr, int, int, int

; void NotifyWinEvent(uint @event, winmdroot.Foundation.HWND hwnd, int idObject, int idChild)
#func NotifyWinEvent "NotifyWinEvent" int, intptr, int, int

; uint OemKeyScan(ushort wOemChar)
#cfunc OemKeyScan "OemKeyScan" int

; winmdroot.Foundation.BOOL OemToChar(winmdroot.Foundation.PCSTR pSrc, winmdroot.Foundation.PWSTR pDst)
#cfunc OemToCharW "OemToCharW" str, wstr

; winmdroot.Foundation.BOOL OemToCharBuff(winmdroot.Foundation.PCSTR lpszSrc, winmdroot.Foundation.PWSTR lpszDst, uint cchDstLength)
#cfunc OemToCharBuffW "OemToCharBuffW" str, wstr, int

; winmdroot.Foundation.BOOL OffsetRect(winmdroot.Foundation.RECT* lprc, int dx, int dy)
#cfunc OffsetRect "OffsetRect" var, int, int

; winmdroot.Foundation.BOOL OpenClipboard(winmdroot.Foundation.HWND hWndNewOwner)
#cfunc OpenClipboard "OpenClipboard" intptr

; winmdroot.System.StationsAndDesktops.HDESK OpenDesktop(winmdroot.Foundation.PCWSTR lpszDesktop, winmdroot.System.StationsAndDesktops.DESKTOP_CONTROL_FLAGS dwFlags, winmdroot.Foundation.BOOL fInherit, uint dwDesiredAccess)
#cfunc OpenDesktopW "OpenDesktopW" wstr, int, int, int

; winmdroot.Foundation.BOOL OpenIcon(winmdroot.Foundation.HWND hWnd)
#cfunc OpenIcon "OpenIcon" intptr

; winmdroot.System.StationsAndDesktops.HDESK OpenInputDesktop(winmdroot.System.StationsAndDesktops.DESKTOP_CONTROL_FLAGS dwFlags, winmdroot.Foundation.BOOL fInherit, winmdroot.System.StationsAndDesktops.DESKTOP_ACCESS_FLAGS dwDesiredAccess)
#cfunc OpenInputDesktop "OpenInputDesktop" int, int, int

; winmdroot.System.StationsAndDesktops.HWINSTA OpenWindowStation(winmdroot.Foundation.PCWSTR lpszWinSta, winmdroot.Foundation.BOOL fInherit, uint dwDesiredAccess)
#cfunc OpenWindowStationW "OpenWindowStationW" wstr, int, int

; winmdroot.Foundation.LPARAM PackDDElParam(uint msg, nuint uiLo, nuint uiHi)
#cfunc PackDDElParam "PackDDElParam" int, int, int

; winmdroot.Foundation.LRESULT PackTouchHitTestingProximityEvaluation(winmdroot.UI.Controls.TOUCH_HIT_TESTING_INPUT* pHitTestingInput, winmdroot.UI.Controls.TOUCH_HIT_TESTING_PROXIMITY_EVALUATION* pProximityEval)
#cfunc PackTouchHitTestingProximityEvaluation "PackTouchHitTestingProximityEvaluation" var, var

; winmdroot.Foundation.BOOL PaintDesktop(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc PaintDesktop "PaintDesktop" intptr

; winmdroot.Foundation.BOOL PeekMessageW(winmdroot.UI.WindowsAndMessaging.MSG* lpMsg, winmdroot.Foundation.HWND hWnd, uint wMsgFilterMin, uint wMsgFilterMax, winmdroot.UI.WindowsAndMessaging.PEEK_MESSAGE_REMOVE_TYPE wRemoveMsg)
#cfunc PeekMessageW "PeekMessageW" var, intptr, int, int, int

; winmdroot.Foundation.BOOL PhysicalToLogicalPoint(winmdroot.Foundation.HWND hWnd, global::System.Drawing.Point* lpPoint)
#cfunc PhysicalToLogicalPoint "PhysicalToLogicalPoint" intptr, var

; winmdroot.Foundation.BOOL PhysicalToLogicalPointForPerMonitorDPI(winmdroot.Foundation.HWND hWnd, global::System.Drawing.Point* lpPoint)
#cfunc PhysicalToLogicalPointForPerMonitorDPI "PhysicalToLogicalPointForPerMonitorDPI" intptr, var

; winmdroot.Foundation.BOOL PostMessage(winmdroot.Foundation.HWND hWnd, uint Msg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam)
#cfunc PostMessageW "PostMessageW" intptr, int, intptr, intptr

; void PostQuitMessage(int nExitCode)
#func PostQuitMessage "PostQuitMessage" int

; winmdroot.Foundation.BOOL PostThreadMessage(uint idThread, uint Msg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam)
#cfunc PostThreadMessageW "PostThreadMessageW" int, int, intptr, intptr

; winmdroot.Foundation.BOOL PrintWindow(winmdroot.Foundation.HWND hwnd, winmdroot.Graphics.Gdi.HDC hdcBlt, winmdroot.Storage.Xps.PRINT_WINDOW_FLAGS nFlags)
#cfunc PrintWindow "PrintWindow" intptr, intptr, int

; uint PrivateExtractIconsW(winmdroot.Foundation.PCWSTR szFileName, int nIconIndex, int cxIcon, int cyIcon, [Optional] winmdroot.UI.WindowsAndMessaging.HICON* phicon, [Optional] uint* piconid, uint nIcons, uint flags)
#cfunc PrivateExtractIconsW "PrivateExtractIconsW" wstr, int, int, int, intptr, var, int, int

; winmdroot.Foundation.BOOL PtInRect(winmdroot.Foundation.RECT* lprc, global::System.Drawing.Point pt)
#cfunc PtInRect "PtInRect" var, int

; winmdroot.Foundation.WIN32_ERROR QueryDisplayConfig(winmdroot.Devices.Display.QUERY_DISPLAY_CONFIG_FLAGS flags, uint* numPathArrayElements, winmdroot.Devices.Display.DISPLAYCONFIG_PATH_INFO* pathArray, uint* numModeInfoArrayElements, winmdroot.Devices.Display.DISPLAYCONFIG_MODE_INFO* modeInfoArray, [Optional] winmdroot.Devices.Display.DISPLAYCONFIG_TOPOLOGY_ID* currentTopologyId)
#cfunc QueryDisplayConfig "QueryDisplayConfig" int, var, var, var, var, var

; winmdroot.Foundation.HWND RealChildWindowFromPoint(winmdroot.Foundation.HWND hwndParent, global::System.Drawing.Point ptParentClientCoords)
#cfunc RealChildWindowFromPoint "RealChildWindowFromPoint" intptr, int

; uint RealGetWindowClass(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.PWSTR ptszClassName, uint cchClassNameMax)
#cfunc RealGetWindowClassW "RealGetWindowClassW" intptr, wstr, int

; winmdroot.Foundation.BOOL RedrawWindow(winmdroot.Foundation.HWND hWnd, [Optional] winmdroot.Foundation.RECT* lprcUpdate, winmdroot.Graphics.Gdi.HRGN hrgnUpdate, winmdroot.Graphics.Gdi.REDRAW_WINDOW_FLAGS flags)
#cfunc RedrawWindow "RedrawWindow" intptr, var, intptr, int

; ushort RegisterClass(winmdroot.UI.WindowsAndMessaging.WNDCLASSW* lpWndClass)
#cfunc RegisterClassW "RegisterClassW" var

; ushort RegisterClassEx(winmdroot.UI.WindowsAndMessaging.WNDCLASSEXW* param0)
#cfunc RegisterClassExW "RegisterClassExW" var

; uint RegisterClipboardFormat(winmdroot.Foundation.PCWSTR lpszFormat)
#cfunc RegisterClipboardFormatW "RegisterClipboardFormatW" wstr

; winmdroot.Foundation.BOOL UnregisterDeviceNotification(winmdroot.UI.WindowsAndMessaging.HDEVNOTIFY Handle)
#cfunc UnregisterDeviceNotification "UnregisterDeviceNotification" int

; winmdroot.UI.WindowsAndMessaging.HDEVNOTIFY RegisterDeviceNotification(winmdroot.Foundation.HANDLE hRecipient, void* NotificationFilter, winmdroot.UI.WindowsAndMessaging.REGISTER_NOTIFICATION_FLAGS Flags)
#cfunc RegisterDeviceNotificationW "RegisterDeviceNotificationW" intptr, intptr, int

; winmdroot.Foundation.BOOL RegisterHotKey(winmdroot.Foundation.HWND hWnd, int id, winmdroot.UI.Input.KeyboardAndMouse.HOT_KEY_MODIFIERS fsModifiers, uint vk)
#cfunc RegisterHotKey "RegisterHotKey" intptr, int, int, int

; winmdroot.Foundation.BOOL RegisterPointerDeviceNotifications(winmdroot.Foundation.HWND window, winmdroot.Foundation.BOOL notifyRange)
#cfunc RegisterPointerDeviceNotifications "RegisterPointerDeviceNotifications" intptr, int

; winmdroot.Foundation.BOOL RegisterPointerInputTarget(winmdroot.Foundation.HWND hwnd, winmdroot.UI.WindowsAndMessaging.POINTER_INPUT_TYPE pointerType)
#cfunc RegisterPointerInputTarget "RegisterPointerInputTarget" intptr, int

; winmdroot.Foundation.BOOL RegisterPointerInputTargetEx(winmdroot.Foundation.HWND hwnd, winmdroot.UI.WindowsAndMessaging.POINTER_INPUT_TYPE pointerType, winmdroot.Foundation.BOOL fObserve)
#cfunc RegisterPointerInputTargetEx "RegisterPointerInputTargetEx" intptr, int, int

; winmdroot.Foundation.BOOL UnregisterPowerSettingNotification(winmdroot.System.Power.HPOWERNOTIFY Handle)
#cfunc UnregisterPowerSettingNotification "UnregisterPowerSettingNotification" intptr

; winmdroot.System.Power.HPOWERNOTIFY RegisterPowerSettingNotification(winmdroot.Foundation.HANDLE hRecipient, global::System.Guid* PowerSettingGuid, winmdroot.UI.WindowsAndMessaging.REGISTER_NOTIFICATION_FLAGS Flags)
#cfunc RegisterPowerSettingNotification "RegisterPowerSettingNotification" intptr, var, int

; winmdroot.Foundation.BOOL RegisterRawInputDevices(winmdroot.UI.Input.RAWINPUTDEVICE* pRawInputDevices, uint uiNumDevices, uint cbSize)
#cfunc RegisterRawInputDevices "RegisterRawInputDevices" var, int, int

; winmdroot.Foundation.BOOL RegisterShellHookWindow(winmdroot.Foundation.HWND hwnd)
#cfunc RegisterShellHookWindow "RegisterShellHookWindow" intptr

; winmdroot.System.Power.HPOWERNOTIFY RegisterSuspendResumeNotification(winmdroot.Foundation.HANDLE hRecipient, winmdroot.UI.WindowsAndMessaging.REGISTER_NOTIFICATION_FLAGS Flags)
#cfunc RegisterSuspendResumeNotification "RegisterSuspendResumeNotification" intptr, int

; winmdroot.Foundation.BOOL RegisterTouchHitTestingWindow(winmdroot.Foundation.HWND hwnd, uint value)
#cfunc RegisterTouchHitTestingWindow "RegisterTouchHitTestingWindow" intptr, int

; winmdroot.Foundation.BOOL RegisterTouchWindow(winmdroot.Foundation.HWND hwnd, winmdroot.UI.Input.Touch.REGISTER_TOUCH_WINDOW_FLAGS ulFlags)
#cfunc RegisterTouchWindow "RegisterTouchWindow" intptr, int

; uint RegisterWindowMessage(winmdroot.Foundation.PCWSTR lpString)
#cfunc RegisterWindowMessageW "RegisterWindowMessageW" wstr

; winmdroot.Foundation.BOOL ReleaseCapture()
#cfunc ReleaseCapture "ReleaseCapture"

; int ReleaseDC(winmdroot.Foundation.HWND hWnd, winmdroot.Graphics.Gdi.HDC hDC)
#cfunc ReleaseDC "ReleaseDC" intptr, intptr

; winmdroot.Foundation.BOOL RemoveClipboardFormatListener(winmdroot.Foundation.HWND hwnd)
#cfunc RemoveClipboardFormatListener "RemoveClipboardFormatListener" intptr

; winmdroot.Foundation.BOOL RemoveMenu(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, uint uPosition, winmdroot.UI.WindowsAndMessaging.MENU_ITEM_FLAGS uFlags)
#cfunc RemoveMenu "RemoveMenu" intptr, int, int

; winmdroot.Foundation.HANDLE RemoveProp(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.PCWSTR lpString)
#cfunc RemovePropW "RemovePropW" intptr, wstr

; winmdroot.Foundation.BOOL ReplyMessage(winmdroot.Foundation.LRESULT lResult)
#cfunc ReplyMessage "ReplyMessage" intptr

; winmdroot.Foundation.LPARAM ReuseDDElParam(winmdroot.Foundation.LPARAM lParam, uint msgIn, uint msgOut, nuint uiLo, nuint uiHi)
#cfunc ReuseDDElParam "ReuseDDElParam" intptr, int, int, int, int

; winmdroot.Foundation.BOOL ScreenToClient(winmdroot.Foundation.HWND hWnd, global::System.Drawing.Point* lpPoint)
#cfunc ScreenToClient "ScreenToClient" intptr, var

; winmdroot.Foundation.BOOL ScrollDC(winmdroot.Graphics.Gdi.HDC hDC, int dx, int dy, [Optional] winmdroot.Foundation.RECT* lprcScroll, [Optional] winmdroot.Foundation.RECT* lprcClip, winmdroot.Graphics.Gdi.HRGN hrgnUpdate, [Optional] winmdroot.Foundation.RECT* lprcUpdate)
#cfunc ScrollDC "ScrollDC" intptr, int, int, var, var, intptr, var

; winmdroot.Foundation.BOOL ScrollWindow(winmdroot.Foundation.HWND hWnd, int XAmount, int YAmount, [Optional] winmdroot.Foundation.RECT* lpRect, [Optional] winmdroot.Foundation.RECT* lpClipRect)
#cfunc ScrollWindow "ScrollWindow" intptr, int, int, var, var

; int ScrollWindowEx(winmdroot.Foundation.HWND hWnd, int dx, int dy, [Optional] winmdroot.Foundation.RECT* prcScroll, [Optional] winmdroot.Foundation.RECT* prcClip, winmdroot.Graphics.Gdi.HRGN hrgnUpdate, [Optional] winmdroot.Foundation.RECT* prcUpdate, winmdroot.UI.WindowsAndMessaging.SCROLL_WINDOW_FLAGS flags)
#cfunc ScrollWindowEx "ScrollWindowEx" intptr, int, int, var, var, intptr, var, int

; winmdroot.Foundation.LRESULT SendDlgItemMessageW(winmdroot.Foundation.HWND hDlg, int nIDDlgItem, uint Msg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam)
#cfunc SendDlgItemMessageW "SendDlgItemMessageW" intptr, int, int, intptr, intptr

; winmdroot.Foundation.LRESULT SendIMEMessageExW(winmdroot.Foundation.HWND param0, winmdroot.Foundation.LPARAM param1)
#cfunc SendIMEMessageExW "SendIMEMessageExW" intptr, intptr

; uint SendInput(uint cInputs, winmdroot.UI.Input.KeyboardAndMouse.INPUT* pInputs, int cbSize)
#cfunc SendInput "SendInput" int, var, int

; winmdroot.Foundation.LRESULT SendMessage(winmdroot.Foundation.HWND hWnd, uint Msg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam)
#cfunc SendMessageW "SendMessageW" intptr, int, intptr, intptr

; winmdroot.Foundation.BOOL SendMessageCallback(winmdroot.Foundation.HWND hWnd, uint Msg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,uint,nuint,global::Windows.Win32.Foundation.LRESULT,void> lpResultCallBack, nuint dwData)
#cfunc SendMessageCallbackW "SendMessageCallbackW" intptr, int, intptr, intptr, int, int

; winmdroot.Foundation.LRESULT SendMessageTimeout(winmdroot.Foundation.HWND hWnd, uint Msg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam, winmdroot.UI.WindowsAndMessaging.SEND_MESSAGE_TIMEOUT_FLAGS fuFlags, uint uTimeout, [Optional] nuint* lpdwResult)
#cfunc SendMessageTimeoutW "SendMessageTimeoutW" intptr, int, intptr, intptr, int, int, var

; winmdroot.Foundation.BOOL SendNotifyMessage(winmdroot.Foundation.HWND hWnd, uint Msg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam)
#cfunc SendNotifyMessageW "SendNotifyMessageW" intptr, int, intptr, intptr

; winmdroot.Foundation.HWND SetActiveWindow(winmdroot.Foundation.HWND hWnd)
#cfunc SetActiveWindow "SetActiveWindow" intptr

; winmdroot.Foundation.HWND SetCapture(winmdroot.Foundation.HWND hWnd)
#cfunc SetCapture "SetCapture" intptr

; winmdroot.Foundation.BOOL SetCaretBlinkTime(uint uMSeconds)
#cfunc SetCaretBlinkTime "SetCaretBlinkTime" int

; winmdroot.Foundation.BOOL SetCaretPos(int X, int Y)
#cfunc SetCaretPos "SetCaretPos" int, int

; uint SetClassLong(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.GET_CLASS_LONG_INDEX nIndex, int dwNewLong)
#cfunc SetClassLongW "SetClassLongW" intptr, int, int

; ushort SetClassWord(winmdroot.Foundation.HWND hWnd, int nIndex, ushort wNewWord)
#cfunc SetClassWord "SetClassWord" intptr, int, int

; winmdroot.Foundation.HANDLE SetClipboardData(uint uFormat, winmdroot.Foundation.HANDLE hMem)
#cfunc SetClipboardData "SetClipboardData" int, intptr

; winmdroot.Foundation.HWND SetClipboardViewer(winmdroot.Foundation.HWND hWndNewViewer)
#cfunc SetClipboardViewer "SetClipboardViewer" intptr

; nuint SetCoalescableTimer(winmdroot.Foundation.HWND hWnd, nuint nIDEvent, uint uElapse, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,uint,nuint,uint,void> lpTimerFunc, uint uToleranceDelay)
#cfunc SetCoalescableTimer "SetCoalescableTimer" intptr, int, int, int, int

; winmdroot.UI.WindowsAndMessaging.HCURSOR SetCursor(winmdroot.UI.WindowsAndMessaging.HCURSOR hCursor)
#cfunc SetCursor "SetCursor" intptr

; winmdroot.Foundation.BOOL SetCursorPos(int X, int Y)
#cfunc SetCursorPos "SetCursorPos" int, int

; void SetDebugErrorLevel(uint dwLevel)
#func SetDebugErrorLevel "SetDebugErrorLevel" int

; winmdroot.Foundation.BOOL SetDialogControlDpiChangeBehavior(winmdroot.Foundation.HWND hWnd, winmdroot.UI.HiDpi.DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS mask, winmdroot.UI.HiDpi.DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS values)
#cfunc SetDialogControlDpiChangeBehavior "SetDialogControlDpiChangeBehavior" intptr, int, int

; winmdroot.Foundation.BOOL SetDialogDpiChangeBehavior(winmdroot.Foundation.HWND hDlg, winmdroot.UI.HiDpi.DIALOG_DPI_CHANGE_BEHAVIORS mask, winmdroot.UI.HiDpi.DIALOG_DPI_CHANGE_BEHAVIORS values)
#cfunc SetDialogDpiChangeBehavior "SetDialogDpiChangeBehavior" intptr, int, int

; winmdroot.Foundation.BOOL SetDisplayAutoRotationPreferences(winmdroot.Devices.Display.ORIENTATION_PREFERENCE orientation)
#cfunc SetDisplayAutoRotationPreferences "SetDisplayAutoRotationPreferences" int

; int SetDisplayConfig(uint numPathArrayElements, [Optional] winmdroot.Devices.Display.DISPLAYCONFIG_PATH_INFO* pathArray, uint numModeInfoArrayElements, [Optional] winmdroot.Devices.Display.DISPLAYCONFIG_MODE_INFO* modeInfoArray, winmdroot.Devices.Display.SET_DISPLAY_CONFIG_FLAGS flags)
#cfunc SetDisplayConfig "SetDisplayConfig" int, var, int, var, int

; winmdroot.Foundation.BOOL SetDlgItemInt(winmdroot.Foundation.HWND hDlg, int nIDDlgItem, uint uValue, winmdroot.Foundation.BOOL bSigned)
#cfunc SetDlgItemInt "SetDlgItemInt" intptr, int, int, int

; winmdroot.Foundation.BOOL SetDlgItemText(winmdroot.Foundation.HWND hDlg, int nIDDlgItem, winmdroot.Foundation.PCWSTR lpString)
#cfunc SetDlgItemTextW "SetDlgItemTextW" intptr, int, wstr

; winmdroot.Foundation.BOOL SetDoubleClickTime(uint param0)
#cfunc SetDoubleClickTime "SetDoubleClickTime" int

; winmdroot.Foundation.HWND SetFocus(winmdroot.Foundation.HWND hWnd)
#cfunc SetFocus "SetFocus" intptr

; winmdroot.Foundation.BOOL SetForegroundWindow(winmdroot.Foundation.HWND hWnd)
#cfunc SetForegroundWindow "SetForegroundWindow" intptr

; winmdroot.Foundation.BOOL SetGestureConfig(winmdroot.Foundation.HWND hwnd, uint dwReserved, uint cIDs, winmdroot.UI.Input.Touch.GESTURECONFIG* pGestureConfig, uint cbSize)
#cfunc SetGestureConfig "SetGestureConfig" intptr, int, int, var, int

; winmdroot.Foundation.BOOL SetKeyboardState(byte* lpKeyState)
#cfunc SetKeyboardState "SetKeyboardState" var

; void SetLastErrorEx(winmdroot.Foundation.WIN32_ERROR dwErrCode, uint dwType)
#func SetLastErrorEx "SetLastErrorEx" int, int

; winmdroot.Foundation.BOOL SetLayeredWindowAttributes(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.COLORREF crKey, byte bAlpha, winmdroot.UI.WindowsAndMessaging.LAYERED_WINDOW_ATTRIBUTES_FLAGS dwFlags)
#cfunc SetLayeredWindowAttributes "SetLayeredWindowAttributes" intptr, int, int, int

; winmdroot.Foundation.BOOL SetMenu(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.HMENU hMenu)
#cfunc SetMenu "SetMenu" intptr, intptr

; winmdroot.Foundation.BOOL SetMenuContextHelpId(winmdroot.UI.WindowsAndMessaging.HMENU param0, uint param1)
#cfunc SetMenuContextHelpId "SetMenuContextHelpId" intptr, int

; winmdroot.Foundation.BOOL SetMenuDefaultItem(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, uint uItem, uint fByPos)
#cfunc SetMenuDefaultItem "SetMenuDefaultItem" intptr, int, int

; winmdroot.Foundation.BOOL SetMenuInfo(winmdroot.UI.WindowsAndMessaging.HMENU param0, winmdroot.UI.WindowsAndMessaging.MENUINFO* param1)
#cfunc SetMenuInfo "SetMenuInfo" intptr, var

; winmdroot.Foundation.BOOL SetMenuItemBitmaps(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, uint uPosition, winmdroot.UI.WindowsAndMessaging.MENU_ITEM_FLAGS uFlags, winmdroot.Graphics.Gdi.HBITMAP hBitmapUnchecked, winmdroot.Graphics.Gdi.HBITMAP hBitmapChecked)
#cfunc SetMenuItemBitmaps "SetMenuItemBitmaps" intptr, int, int, intptr, intptr

; winmdroot.Foundation.BOOL SetMenuItemInfo(winmdroot.UI.WindowsAndMessaging.HMENU hmenu, uint item, winmdroot.Foundation.BOOL fByPositon, winmdroot.UI.WindowsAndMessaging.MENUITEMINFOW* lpmii)
#cfunc SetMenuItemInfoW "SetMenuItemInfoW" intptr, int, int, var

; winmdroot.Foundation.LPARAM SetMessageExtraInfo(winmdroot.Foundation.LPARAM lParam)
#cfunc SetMessageExtraInfo "SetMessageExtraInfo" intptr

; winmdroot.Foundation.BOOL SetMessageQueue(int cMessagesMax)
#cfunc SetMessageQueue "SetMessageQueue" int

; winmdroot.Foundation.HWND SetParent(winmdroot.Foundation.HWND hWndChild, winmdroot.Foundation.HWND hWndNewParent)
#cfunc SetParent "SetParent" intptr, intptr

; winmdroot.Foundation.BOOL SetPhysicalCursorPos(int X, int Y)
#cfunc SetPhysicalCursorPos "SetPhysicalCursorPos" int, int

; winmdroot.Foundation.BOOL SetProcessDPIAware()
#cfunc SetProcessDPIAware "SetProcessDPIAware"

; winmdroot.Foundation.BOOL SetProcessDefaultLayout(uint dwDefaultLayout)
#cfunc SetProcessDefaultLayout "SetProcessDefaultLayout" int

; winmdroot.Foundation.BOOL SetProcessDpiAwarenessContext(winmdroot.UI.HiDpi.DPI_AWARENESS_CONTEXT value)
#cfunc SetProcessDpiAwarenessContext "SetProcessDpiAwarenessContext" intptr

; winmdroot.Foundation.BOOL SetProcessRestrictionExemption(winmdroot.Foundation.BOOL fEnableExemption)
#cfunc SetProcessRestrictionExemption "SetProcessRestrictionExemption" int

; winmdroot.Foundation.BOOL SetProcessWindowStation(winmdroot.System.StationsAndDesktops.HWINSTA hWinSta)
#cfunc SetProcessWindowStation "SetProcessWindowStation" intptr

; winmdroot.Foundation.BOOL SetProp(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.PCWSTR lpString, winmdroot.Foundation.HANDLE hData)
#cfunc SetPropW "SetPropW" intptr, wstr, intptr

; winmdroot.Foundation.BOOL SetRect(winmdroot.Foundation.RECT* lprc, int xLeft, int yTop, int xRight, int yBottom)
#cfunc SetRect "SetRect" var, int, int, int, int

; winmdroot.Foundation.BOOL SetRectEmpty(winmdroot.Foundation.RECT* lprc)
#cfunc SetRectEmpty "SetRectEmpty" var

; int SetScrollInfo(winmdroot.Foundation.HWND hwnd, winmdroot.UI.WindowsAndMessaging.SCROLLBAR_CONSTANTS nBar, winmdroot.UI.WindowsAndMessaging.SCROLLINFO* lpsi, winmdroot.Foundation.BOOL redraw)
#cfunc SetScrollInfo "SetScrollInfo" intptr, int, var, int

; int SetScrollPos(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.SCROLLBAR_CONSTANTS nBar, int nPos, winmdroot.Foundation.BOOL bRedraw)
#cfunc SetScrollPos "SetScrollPos" intptr, int, int, int

; winmdroot.Foundation.BOOL SetScrollRange(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.SCROLLBAR_CONSTANTS nBar, int nMinPos, int nMaxPos, winmdroot.Foundation.BOOL bRedraw)
#cfunc SetScrollRange "SetScrollRange" intptr, int, int, int, int

; winmdroot.Foundation.BOOL SetSysColors(int cElements, int* lpaElements, winmdroot.Foundation.COLORREF* lpaRgbValues)
#cfunc SetSysColors "SetSysColors" int, var, var

; winmdroot.Foundation.BOOL SetSystemCursor(winmdroot.UI.WindowsAndMessaging.HCURSOR hcur, winmdroot.UI.WindowsAndMessaging.SYSTEM_CURSOR_ID id)
#cfunc SetSystemCursor "SetSystemCursor" intptr, int

; winmdroot.Foundation.BOOL SetThreadDesktop(winmdroot.System.StationsAndDesktops.HDESK hDesktop)
#cfunc SetThreadDesktop "SetThreadDesktop" intptr

; winmdroot.UI.HiDpi.DPI_AWARENESS_CONTEXT SetThreadDpiAwarenessContext(winmdroot.UI.HiDpi.DPI_AWARENESS_CONTEXT dpiContext)
#cfunc SetThreadDpiAwarenessContext "SetThreadDpiAwarenessContext" intptr

; winmdroot.UI.HiDpi.DPI_HOSTING_BEHAVIOR SetThreadDpiHostingBehavior(winmdroot.UI.HiDpi.DPI_HOSTING_BEHAVIOR value)
#cfunc SetThreadDpiHostingBehavior "SetThreadDpiHostingBehavior" int

; nuint SetTimer(winmdroot.Foundation.HWND hWnd, nuint nIDEvent, uint uElapse, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,uint,nuint,uint,void> lpTimerFunc)
#cfunc SetTimer "SetTimer" intptr, int, int, int

; winmdroot.Foundation.BOOL SetUserObjectInformation(winmdroot.Foundation.HANDLE hObj, int nIndex, void* pvInfo, uint nLength)
#cfunc SetUserObjectInformationW "SetUserObjectInformationW" intptr, int, intptr, int

; winmdroot.Foundation.BOOL SetUserObjectSecurity(winmdroot.Foundation.HANDLE hObj, winmdroot.Security.OBJECT_SECURITY_INFORMATION* pSIRequested, winmdroot.Security.PSECURITY_DESCRIPTOR pSID)
#cfunc SetUserObjectSecurity "SetUserObjectSecurity" intptr, var, int

; winmdroot.Foundation.BOOL UnhookWinEvent(winmdroot.UI.Accessibility.HWINEVENTHOOK hWinEventHook)
#cfunc UnhookWinEvent "UnhookWinEvent" intptr

; winmdroot.UI.Accessibility.HWINEVENTHOOK SetWinEventHook(uint eventMin, uint eventMax, winmdroot.Foundation.HMODULE hmodWinEventProc, delegate *unmanaged[Stdcall]<global::Windows.Win32.UI.Accessibility.HWINEVENTHOOK,uint,global::Windows.Win32.Foundation.HWND,int,int,uint,uint,void> pfnWinEventProc, uint idProcess, uint idThread, uint dwFlags)
#cfunc SetWinEventHook "SetWinEventHook" int, int, intptr, int, int, int, int

; winmdroot.Foundation.BOOL SetWindowContextHelpId(winmdroot.Foundation.HWND param0, uint param1)
#cfunc SetWindowContextHelpId "SetWindowContextHelpId" intptr, int

; winmdroot.Foundation.BOOL SetWindowDisplayAffinity(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.WINDOW_DISPLAY_AFFINITY dwAffinity)
#cfunc SetWindowDisplayAffinity "SetWindowDisplayAffinity" intptr, int

; winmdroot.Foundation.BOOL SetWindowFeedbackSetting(winmdroot.Foundation.HWND hwnd, winmdroot.UI.Controls.FEEDBACK_TYPE feedback, uint dwFlags, uint size, [Optional] void* configuration)
#cfunc SetWindowFeedbackSetting "SetWindowFeedbackSetting" intptr, int, int, int, intptr

; int SetWindowLong(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.WINDOW_LONG_PTR_INDEX nIndex, int dwNewLong)
#cfunc SetWindowLongW "SetWindowLongW" intptr, int, int

; winmdroot.Foundation.BOOL SetWindowPlacement(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.WINDOWPLACEMENT* lpwndpl)
#cfunc SetWindowPlacement "SetWindowPlacement" intptr, var

; winmdroot.Foundation.BOOL SetWindowPos(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.HWND hWndInsertAfter, int X, int Y, int cx, int cy, winmdroot.UI.WindowsAndMessaging.SET_WINDOW_POS_FLAGS uFlags)
#cfunc SetWindowPos "SetWindowPos" intptr, intptr, int, int, int, int, int

; int SetWindowRgn(winmdroot.Foundation.HWND hWnd, winmdroot.Graphics.Gdi.HRGN hRgn, winmdroot.Foundation.BOOL bRedraw)
#cfunc SetWindowRgn "SetWindowRgn" intptr, intptr, int

; winmdroot.Foundation.BOOL SetWindowText(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.PCWSTR lpString)
#cfunc SetWindowTextW "SetWindowTextW" intptr, wstr

; ushort SetWindowWord(winmdroot.Foundation.HWND hWnd, int nIndex, ushort wNewWord)
#cfunc SetWindowWord "SetWindowWord" intptr, int, int

; winmdroot.UI.WindowsAndMessaging.HHOOK SetWindowsHookW(int nFilterType, delegate *unmanaged[Stdcall]<int,global::Windows.Win32.Foundation.WPARAM,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.LRESULT> pfnFilterProc)
#cfunc SetWindowsHookW "SetWindowsHookW" int, int

; winmdroot.UI.WindowsAndMessaging.HHOOK SetWindowsHookEx(winmdroot.UI.WindowsAndMessaging.WINDOWS_HOOK_ID idHook, delegate *unmanaged[Stdcall]<int,global::Windows.Win32.Foundation.WPARAM,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.LRESULT> lpfn, winmdroot.Foundation.HINSTANCE hmod, uint dwThreadId)
#cfunc SetWindowsHookExW "SetWindowsHookExW" int, int, intptr, int

; winmdroot.Foundation.BOOL ShowCaret(winmdroot.Foundation.HWND hWnd)
#cfunc ShowCaret "ShowCaret" intptr

; int ShowCursor(winmdroot.Foundation.BOOL bShow)
#cfunc ShowCursor "ShowCursor" int

; winmdroot.Foundation.BOOL ShowOwnedPopups(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.BOOL fShow)
#cfunc ShowOwnedPopups "ShowOwnedPopups" intptr, int

; winmdroot.Foundation.BOOL ShowScrollBar(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.SCROLLBAR_CONSTANTS wBar, winmdroot.Foundation.BOOL bShow)
#cfunc ShowScrollBar "ShowScrollBar" intptr, int, int

; winmdroot.Foundation.BOOL ShowWindow(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.SHOW_WINDOW_CMD nCmdShow)
#cfunc ShowWindow "ShowWindow" intptr, int

; winmdroot.Foundation.BOOL ShowWindowAsync(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.SHOW_WINDOW_CMD nCmdShow)
#cfunc ShowWindowAsync "ShowWindowAsync" intptr, int

; winmdroot.Foundation.BOOL ShutdownBlockReasonCreate(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.PCWSTR pwszReason)
#cfunc ShutdownBlockReasonCreate "ShutdownBlockReasonCreate" intptr, wstr

; winmdroot.Foundation.BOOL ShutdownBlockReasonDestroy(winmdroot.Foundation.HWND hWnd)
#cfunc ShutdownBlockReasonDestroy "ShutdownBlockReasonDestroy" intptr

; winmdroot.Foundation.BOOL ShutdownBlockReasonQuery(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.PWSTR pwszBuff, uint* pcchBuff)
#cfunc ShutdownBlockReasonQuery "ShutdownBlockReasonQuery" intptr, wstr, var

; winmdroot.Foundation.BOOL SkipPointerFrameMessages(uint pointerId)
#cfunc SkipPointerFrameMessages "SkipPointerFrameMessages" int

; winmdroot.Foundation.BOOL SoundSentry()
#cfunc SoundSentry "SoundSentry"

; winmdroot.Foundation.BOOL SubtractRect(winmdroot.Foundation.RECT* lprcDst, winmdroot.Foundation.RECT* lprcSrc1, winmdroot.Foundation.RECT* lprcSrc2)
#cfunc SubtractRect "SubtractRect" var, var, var

; winmdroot.Foundation.BOOL SwapMouseButton(winmdroot.Foundation.BOOL fSwap)
#cfunc SwapMouseButton "SwapMouseButton" int

; winmdroot.Foundation.BOOL SwitchDesktop(winmdroot.System.StationsAndDesktops.HDESK hDesktop)
#cfunc SwitchDesktop "SwitchDesktop" intptr

; void SwitchToThisWindow(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.BOOL fUnknown)
#func SwitchToThisWindow "SwitchToThisWindow" intptr, int

; winmdroot.Foundation.BOOL SystemParametersInfo(winmdroot.UI.WindowsAndMessaging.SYSTEM_PARAMETERS_INFO_ACTION uiAction, uint uiParam, [Optional] void* pvParam, winmdroot.UI.WindowsAndMessaging.SYSTEM_PARAMETERS_INFO_UPDATE_FLAGS fWinIni)
#cfunc SystemParametersInfoW "SystemParametersInfoW" int, int, intptr, int

; winmdroot.Foundation.BOOL SystemParametersInfoForDpi(uint uiAction, uint uiParam, [Optional] void* pvParam, uint fWinIni, uint dpi)
#cfunc SystemParametersInfoForDpi "SystemParametersInfoForDpi" int, int, intptr, int, int

; int TabbedTextOutW(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, winmdroot.Foundation.PCWSTR lpString, int chCount, int nTabPositions, [Optional] int* lpnTabStopPositions, int nTabOrigin)
#cfunc TabbedTextOutW "TabbedTextOutW" intptr, int, int, wstr, int, int, var, int

; ushort TileWindows(winmdroot.Foundation.HWND hwndParent, winmdroot.UI.WindowsAndMessaging.TILE_WINDOWS_HOW wHow, [Optional] winmdroot.Foundation.RECT* lpRect, uint cKids, [Optional] winmdroot.Foundation.HWND* lpKids)
#cfunc TileWindows "TileWindows" intptr, int, var, int, intptr

; int ToAscii(uint uVirtKey, uint uScanCode, [Optional] byte* lpKeyState, ushort* lpChar, uint uFlags)
#cfunc ToAscii "ToAscii" int, int, var, var, int

; int ToAsciiEx(uint uVirtKey, uint uScanCode, [Optional] byte* lpKeyState, ushort* lpChar, uint uFlags, winmdroot.UI.Input.KeyboardAndMouse.HKL dwhkl)
#cfunc ToAsciiEx "ToAsciiEx" int, int, var, var, int, intptr

; int ToUnicode(uint wVirtKey, uint wScanCode, [Optional] byte* lpKeyState, winmdroot.Foundation.PWSTR pwszBuff, int cchBuff, uint wFlags)
#cfunc ToUnicode "ToUnicode" int, int, var, wstr, int, int

; int ToUnicodeEx(uint wVirtKey, uint wScanCode, byte* lpKeyState, winmdroot.Foundation.PWSTR pwszBuff, int cchBuff, uint wFlags, winmdroot.UI.Input.KeyboardAndMouse.HKL dwhkl)
#cfunc ToUnicodeEx "ToUnicodeEx" int, int, var, wstr, int, int, intptr

; winmdroot.Foundation.BOOL TrackMouseEvent(winmdroot.UI.Input.KeyboardAndMouse.TRACKMOUSEEVENT* lpEventTrack)
#cfunc TrackMouseEvent "TrackMouseEvent" var

; winmdroot.Foundation.BOOL TrackPopupMenu(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, winmdroot.UI.WindowsAndMessaging.TRACK_POPUP_MENU_FLAGS uFlags, int x, int y, int nReserved, winmdroot.Foundation.HWND hWnd, [Optional] winmdroot.Foundation.RECT* prcRect)
#cfunc TrackPopupMenu "TrackPopupMenu" intptr, int, int, int, int, intptr, var

; winmdroot.Foundation.BOOL TrackPopupMenuEx(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, uint uFlags, int x, int y, winmdroot.Foundation.HWND hwnd, [Optional] winmdroot.UI.WindowsAndMessaging.TPMPARAMS* lptpm)
#cfunc TrackPopupMenuEx "TrackPopupMenuEx" intptr, int, int, int, intptr, var

; int TranslateAccelerator(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.HACCEL hAccTable, winmdroot.UI.WindowsAndMessaging.MSG* lpMsg)
#cfunc TranslateAcceleratorW "TranslateAcceleratorW" intptr, intptr, var

; winmdroot.Foundation.BOOL TranslateMDISysAccel(winmdroot.Foundation.HWND hWndClient, winmdroot.UI.WindowsAndMessaging.MSG* lpMsg)
#cfunc TranslateMDISysAccel "TranslateMDISysAccel" intptr, var

; winmdroot.Foundation.BOOL TranslateMessage(winmdroot.UI.WindowsAndMessaging.MSG* lpMsg)
#cfunc TranslateMessage "TranslateMessage" var

; winmdroot.Foundation.BOOL UnhookWindowsHook(int nCode, delegate *unmanaged[Stdcall]<int,global::Windows.Win32.Foundation.WPARAM,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.LRESULT> pfnFilterProc)
#cfunc UnhookWindowsHook "UnhookWindowsHook" int, int

; winmdroot.Foundation.BOOL UnionRect(winmdroot.Foundation.RECT* lprcDst, winmdroot.Foundation.RECT* lprcSrc1, winmdroot.Foundation.RECT* lprcSrc2)
#cfunc UnionRect "UnionRect" var, var, var

; winmdroot.Foundation.BOOL UnpackDDElParam(uint msg, winmdroot.Foundation.LPARAM lParam, nuint* puiLo, nuint* puiHi)
#cfunc UnpackDDElParam "UnpackDDElParam" int, intptr, var, var

; winmdroot.Foundation.BOOL UnregisterClass(winmdroot.Foundation.PCWSTR lpClassName, winmdroot.Foundation.HINSTANCE hInstance)
#cfunc UnregisterClassW "UnregisterClassW" wstr, intptr

; winmdroot.Foundation.BOOL UnregisterHotKey(winmdroot.Foundation.HWND hWnd, int id)
#cfunc UnregisterHotKey "UnregisterHotKey" intptr, int

; winmdroot.Foundation.BOOL UnregisterPointerInputTarget(winmdroot.Foundation.HWND hwnd, winmdroot.UI.WindowsAndMessaging.POINTER_INPUT_TYPE pointerType)
#cfunc UnregisterPointerInputTarget "UnregisterPointerInputTarget" intptr, int

; winmdroot.Foundation.BOOL UnregisterPointerInputTargetEx(winmdroot.Foundation.HWND hwnd, winmdroot.UI.WindowsAndMessaging.POINTER_INPUT_TYPE pointerType)
#cfunc UnregisterPointerInputTargetEx "UnregisterPointerInputTargetEx" intptr, int

; winmdroot.Foundation.BOOL UnregisterSuspendResumeNotification(winmdroot.System.Power.HPOWERNOTIFY Handle)
#cfunc UnregisterSuspendResumeNotification "UnregisterSuspendResumeNotification" intptr

; winmdroot.Foundation.BOOL UnregisterTouchWindow(winmdroot.Foundation.HWND hwnd)
#cfunc UnregisterTouchWindow "UnregisterTouchWindow" intptr

; winmdroot.Foundation.BOOL UpdateLayeredWindow(winmdroot.Foundation.HWND hWnd, winmdroot.Graphics.Gdi.HDC hdcDst, [Optional] global::System.Drawing.Point* pptDst, [Optional] winmdroot.Foundation.SIZE* psize, winmdroot.Graphics.Gdi.HDC hdcSrc, [Optional] global::System.Drawing.Point* pptSrc, winmdroot.Foundation.COLORREF crKey, [Optional] winmdroot.Graphics.Gdi.BLENDFUNCTION* pblend, winmdroot.UI.WindowsAndMessaging.UPDATE_LAYERED_WINDOW_FLAGS dwFlags)
#cfunc UpdateLayeredWindow "UpdateLayeredWindow" intptr, intptr, var, var, intptr, var, int, var, int

; winmdroot.Foundation.BOOL UpdateLayeredWindowIndirect(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.UPDATELAYEREDWINDOWINFO* pULWInfo)
#cfunc UpdateLayeredWindowIndirect "UpdateLayeredWindowIndirect" intptr, var

; winmdroot.Foundation.BOOL UpdateWindow(winmdroot.Foundation.HWND hWnd)
#cfunc UpdateWindow "UpdateWindow" intptr

; winmdroot.Foundation.BOOL UserHandleGrantAccess(winmdroot.Foundation.HANDLE hUserHandle, winmdroot.Foundation.HANDLE hJob, winmdroot.Foundation.BOOL bGrant)
#cfunc UserHandleGrantAccess "UserHandleGrantAccess" intptr, intptr, int

; winmdroot.Foundation.BOOL ValidateRect(winmdroot.Foundation.HWND hWnd, [Optional] winmdroot.Foundation.RECT* lpRect)
#cfunc ValidateRect "ValidateRect" intptr, var

; winmdroot.Foundation.BOOL ValidateRgn(winmdroot.Foundation.HWND hWnd, winmdroot.Graphics.Gdi.HRGN hRgn)
#cfunc ValidateRgn "ValidateRgn" intptr, intptr

; short VkKeyScanW(char ch)
#cfunc VkKeyScanW "VkKeyScanW" int

; short VkKeyScanExW(char ch, winmdroot.UI.Input.KeyboardAndMouse.HKL dwhkl)
#cfunc VkKeyScanExW "VkKeyScanExW" int, intptr

; winmdroot.Foundation.BOOL WINNLSEnableIME(winmdroot.Foundation.HWND param0, winmdroot.Foundation.BOOL param1)
#cfunc WINNLSEnableIME "WINNLSEnableIME" intptr, int

; winmdroot.Foundation.BOOL WINNLSGetEnableStatus(winmdroot.Foundation.HWND param0)
#cfunc WINNLSGetEnableStatus "WINNLSGetEnableStatus" intptr

; uint WINNLSGetIMEHotkey(winmdroot.Foundation.HWND param0)
#cfunc WINNLSGetIMEHotkey "WINNLSGetIMEHotkey" intptr

; uint WaitForInputIdle(winmdroot.Foundation.HANDLE hProcess, uint dwMilliseconds)
#cfunc WaitForInputIdle "WaitForInputIdle" intptr, int

; winmdroot.Foundation.BOOL WaitMessage()
#cfunc WaitMessage "WaitMessage"

; winmdroot.Foundation.BOOL WinHelp(winmdroot.Foundation.HWND hWndMain, winmdroot.Foundation.PCWSTR lpszHelp, uint uCommand, nuint dwData)
#cfunc WinHelpW "WinHelpW" intptr, wstr, int, int

; winmdroot.Foundation.HWND WindowFromDC(winmdroot.Graphics.Gdi.HDC hDC)
#cfunc WindowFromDC "WindowFromDC" intptr

; winmdroot.Foundation.HWND WindowFromPhysicalPoint(global::System.Drawing.Point Point)
#cfunc WindowFromPhysicalPoint "WindowFromPhysicalPoint" int

; winmdroot.Foundation.HWND WindowFromPoint(global::System.Drawing.Point Point)
#cfunc WindowFromPoint "WindowFromPoint" int

#endif
