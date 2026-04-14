; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    user32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __user32_gen2_as__
#define global __user32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "user32.dll"
; winmdroot.Foundation.BOOL UnloadKeyboardLayout(winmdroot.UI.Input.KeyboardAndMouse.HKL hkl)
#cfunc global UnloadKeyboardLayout "UnloadKeyboardLayout" intptr

; winmdroot.UI.Input.KeyboardAndMouse.HKL ActivateKeyboardLayout(winmdroot.UI.Input.KeyboardAndMouse.HKL hkl, winmdroot.UI.Input.KeyboardAndMouse.ACTIVATE_KEYBOARD_LAYOUT_FLAGS Flags)
#cfunc global ActivateKeyboardLayout "ActivateKeyboardLayout" intptr, int

; winmdroot.Foundation.BOOL AddClipboardFormatListener(winmdroot.Foundation.HWND hwnd)
#cfunc global AddClipboardFormatListener "AddClipboardFormatListener" intptr

; winmdroot.Foundation.BOOL AdjustWindowRect(winmdroot.Foundation.RECT* lpRect, winmdroot.UI.WindowsAndMessaging.WINDOW_STYLE dwStyle, winmdroot.Foundation.BOOL bMenu)
#cfunc global AdjustWindowRect "AdjustWindowRect" var, int, int

; winmdroot.Foundation.BOOL AdjustWindowRectEx(winmdroot.Foundation.RECT* lpRect, winmdroot.UI.WindowsAndMessaging.WINDOW_STYLE dwStyle, winmdroot.Foundation.BOOL bMenu, winmdroot.UI.WindowsAndMessaging.WINDOW_EX_STYLE dwExStyle)
#cfunc global AdjustWindowRectEx "AdjustWindowRectEx" var, int, int, int

; winmdroot.Foundation.BOOL AdjustWindowRectExForDpi(winmdroot.Foundation.RECT* lpRect, winmdroot.UI.WindowsAndMessaging.WINDOW_STYLE dwStyle, winmdroot.Foundation.BOOL bMenu, winmdroot.UI.WindowsAndMessaging.WINDOW_EX_STYLE dwExStyle, uint dpi)
#cfunc global AdjustWindowRectExForDpi "AdjustWindowRectExForDpi" var, int, int, int, int

; winmdroot.Foundation.BOOL AllowSetForegroundWindow(uint dwProcessId)
#cfunc global AllowSetForegroundWindow "AllowSetForegroundWindow" int

; winmdroot.Foundation.BOOL AnimateWindow(winmdroot.Foundation.HWND hWnd, uint dwTime, winmdroot.UI.WindowsAndMessaging.ANIMATE_WINDOW_FLAGS dwFlags)
#cfunc global AnimateWindow "AnimateWindow" intptr, int, int

; winmdroot.Foundation.BOOL AnyPopup()
#cfunc global AnyPopup "AnyPopup"

; winmdroot.Foundation.BOOL DestroyMenu(winmdroot.UI.WindowsAndMessaging.HMENU hMenu)
#cfunc global DestroyMenu "DestroyMenu" intptr

; winmdroot.Foundation.BOOL AppendMenu(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, winmdroot.UI.WindowsAndMessaging.MENU_ITEM_FLAGS uFlags, nuint uIDNewItem, winmdroot.Foundation.PCWSTR lpNewItem)
#cfunc global AppendMenuW "AppendMenuW" intptr, int, int, wstr

; winmdroot.Foundation.BOOL AreDpiAwarenessContextsEqual(winmdroot.UI.HiDpi.DPI_AWARENESS_CONTEXT dpiContextA, winmdroot.UI.HiDpi.DPI_AWARENESS_CONTEXT dpiContextB)
#cfunc global AreDpiAwarenessContextsEqual "AreDpiAwarenessContextsEqual" intptr, intptr

; uint ArrangeIconicWindows(winmdroot.Foundation.HWND hWnd)
#cfunc global ArrangeIconicWindows "ArrangeIconicWindows" intptr

; winmdroot.Foundation.BOOL AttachThreadInput(uint idAttach, uint idAttachTo, winmdroot.Foundation.BOOL fAttach)
#cfunc global AttachThreadInput "AttachThreadInput" int, int, int

; winmdroot.UI.WindowsAndMessaging.HDWP BeginDeferWindowPos(int nNumWindows)
#cfunc global BeginDeferWindowPos "BeginDeferWindowPos" int

; winmdroot.Graphics.Gdi.HDC BeginPaint(winmdroot.Foundation.HWND hWnd, winmdroot.Graphics.Gdi.PAINTSTRUCT* lpPaint)
#cfunc global BeginPaint "BeginPaint" intptr, var

; winmdroot.Foundation.BOOL BlockInput(winmdroot.Foundation.BOOL fBlockIt)
#cfunc global BlockInput "BlockInput" int

; winmdroot.Foundation.BOOL BringWindowToTop(winmdroot.Foundation.HWND hWnd)
#cfunc global BringWindowToTop "BringWindowToTop" intptr

; int BroadcastSystemMessage(winmdroot.System.StationsAndDesktops.BROADCAST_SYSTEM_MESSAGE_FLAGS flags, [Optional] winmdroot.System.StationsAndDesktops.BROADCAST_SYSTEM_MESSAGE_INFO* lpInfo, uint Msg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam)
#cfunc global BroadcastSystemMessageW "BroadcastSystemMessageW" int, var, int, intptr, intptr

; winmdroot.Foundation.BOOL CloseDesktop(winmdroot.System.StationsAndDesktops.HDESK hDesktop)
#cfunc global CloseDesktop "CloseDesktop" intptr

; int BroadcastSystemMessageEx(winmdroot.System.StationsAndDesktops.BROADCAST_SYSTEM_MESSAGE_FLAGS flags, [Optional] winmdroot.System.StationsAndDesktops.BROADCAST_SYSTEM_MESSAGE_INFO* lpInfo, uint Msg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam, [Optional] winmdroot.System.StationsAndDesktops.BSMINFO* pbsmInfo)
#cfunc global BroadcastSystemMessageExW "BroadcastSystemMessageExW" int, var, int, intptr, intptr, var

; winmdroot.Foundation.BOOL CalculatePopupWindowPosition(global::System.Drawing.Point* anchorPoint, winmdroot.Foundation.SIZE* windowSize, uint flags, [Optional] winmdroot.Foundation.RECT* excludeRect, winmdroot.Foundation.RECT* popupWindowPosition)
#cfunc global CalculatePopupWindowPosition "CalculatePopupWindowPosition" var, var, int, var, var

; winmdroot.Foundation.BOOL CallMsgFilterW(winmdroot.UI.WindowsAndMessaging.MSG* lpMsg, int nCode)
#cfunc global CallMsgFilterW "CallMsgFilterW" var, int

; winmdroot.Foundation.BOOL UnhookWindowsHookEx(winmdroot.UI.WindowsAndMessaging.HHOOK hhk)
#cfunc global UnhookWindowsHookEx "UnhookWindowsHookEx" intptr

; winmdroot.Foundation.LRESULT CallNextHookEx(winmdroot.UI.WindowsAndMessaging.HHOOK hhk, int nCode, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam)
#cfunc global CallNextHookEx "CallNextHookEx" intptr, int, intptr, intptr

; winmdroot.Foundation.LRESULT CallWindowProcW(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,uint,global::Windows.Win32.Foundation.WPARAM,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.LRESULT> lpPrevWndFunc, winmdroot.Foundation.HWND hWnd, uint Msg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam)
#cfunc global CallWindowProcW "CallWindowProcW" int, intptr, int, intptr, intptr

; winmdroot.Foundation.BOOL CancelShutdown()
#cfunc global CancelShutdown "CancelShutdown"

; ushort CascadeWindows(winmdroot.Foundation.HWND hwndParent, winmdroot.UI.WindowsAndMessaging.CASCADE_WINDOWS_HOW wHow, [Optional] winmdroot.Foundation.RECT* lpRect, uint cKids, [Optional] winmdroot.Foundation.HWND* lpKids)
#cfunc global CascadeWindows "CascadeWindows" intptr, int, var, int, intptr

; winmdroot.Foundation.BOOL ChangeClipboardChain(winmdroot.Foundation.HWND hWndRemove, winmdroot.Foundation.HWND hWndNewNext)
#cfunc global ChangeClipboardChain "ChangeClipboardChain" intptr, intptr

; winmdroot.Graphics.Gdi.DISP_CHANGE ChangeDisplaySettingsW([Optional] winmdroot.Graphics.Gdi.DEVMODEW* lpDevMode, winmdroot.Graphics.Gdi.CDS_TYPE dwFlags)
#cfunc global ChangeDisplaySettingsW "ChangeDisplaySettingsW" var, int

; winmdroot.Graphics.Gdi.DISP_CHANGE ChangeDisplaySettingsExW(winmdroot.Foundation.PCWSTR lpszDeviceName, [Optional] winmdroot.Graphics.Gdi.DEVMODEW* lpDevMode, winmdroot.Foundation.HWND hwnd, winmdroot.Graphics.Gdi.CDS_TYPE dwflags, [Optional] void* lParam)
#cfunc global ChangeDisplaySettingsExW "ChangeDisplaySettingsExW" wstr, var, intptr, int, intptr

; winmdroot.Foundation.BOOL ChangeMenuW(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, uint cmd, winmdroot.Foundation.PCWSTR lpszNewItem, uint cmdInsert, uint flags)
#cfunc global ChangeMenuW "ChangeMenuW" intptr, int, wstr, int, int

; winmdroot.Foundation.BOOL ChangeWindowMessageFilter(uint message, winmdroot.UI.WindowsAndMessaging.CHANGE_WINDOW_MESSAGE_FILTER_FLAGS dwFlag)
#cfunc global ChangeWindowMessageFilter "ChangeWindowMessageFilter" int, int

; winmdroot.Foundation.BOOL ChangeWindowMessageFilterEx(winmdroot.Foundation.HWND hwnd, uint message, winmdroot.UI.WindowsAndMessaging.WINDOW_MESSAGE_FILTER_ACTION action, [Optional] winmdroot.UI.WindowsAndMessaging.CHANGEFILTERSTRUCT* pChangeFilterStruct)
#cfunc global ChangeWindowMessageFilterEx "ChangeWindowMessageFilterEx" intptr, int, int, var

; winmdroot.Foundation.PWSTR CharLower(winmdroot.Foundation.PWSTR lpsz)
#cfunc global CharLowerW "CharLowerW" wstr

; uint CharLowerBuffW(winmdroot.Foundation.PWSTR lpsz, uint cchLength)
#cfunc global CharLowerBuffW "CharLowerBuffW" wstr, int

; winmdroot.Foundation.PWSTR CharNextW(winmdroot.Foundation.PCWSTR lpsz)
#cfunc global CharNextW "CharNextW" wstr

; winmdroot.Foundation.PWSTR CharPrevW(winmdroot.Foundation.PCWSTR lpszStart, winmdroot.Foundation.PCWSTR lpszCurrent)
#cfunc global CharPrevW "CharPrevW" wstr, wstr

; winmdroot.Foundation.BOOL CharToOem(winmdroot.Foundation.PCWSTR pSrc, winmdroot.Foundation.PSTR pDst)
#cfunc global CharToOemW "CharToOemW" wstr, str

; winmdroot.Foundation.BOOL CharToOemBuff(winmdroot.Foundation.PCWSTR lpszSrc, winmdroot.Foundation.PSTR lpszDst, uint cchDstLength)
#cfunc global CharToOemBuffW "CharToOemBuffW" wstr, str, int

; winmdroot.Foundation.PWSTR CharUpper(winmdroot.Foundation.PWSTR lpsz)
#cfunc global CharUpperW "CharUpperW" wstr

; uint CharUpperBuffW(winmdroot.Foundation.PWSTR lpsz, uint cchLength)
#cfunc global CharUpperBuffW "CharUpperBuffW" wstr, int

; winmdroot.Foundation.BOOL CheckDlgButton(winmdroot.Foundation.HWND hDlg, int nIDButton, winmdroot.UI.Controls.DLG_BUTTON_CHECK_STATE uCheck)
#cfunc global CheckDlgButton "CheckDlgButton" intptr, int, int

; uint CheckMenuItem(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, uint uIDCheckItem, uint uCheck)
#cfunc global CheckMenuItem "CheckMenuItem" intptr, int, int

; winmdroot.Foundation.BOOL CheckMenuRadioItem(winmdroot.UI.WindowsAndMessaging.HMENU hmenu, uint first, uint last, uint check, uint flags)
#cfunc global CheckMenuRadioItem "CheckMenuRadioItem" intptr, int, int, int, int

; winmdroot.Foundation.BOOL CheckRadioButton(winmdroot.Foundation.HWND hDlg, int nIDFirstButton, int nIDLastButton, int nIDCheckButton)
#cfunc global CheckRadioButton "CheckRadioButton" intptr, int, int, int

; winmdroot.Foundation.HWND ChildWindowFromPoint(winmdroot.Foundation.HWND hWndParent, global::System.Drawing.Point Point)
#cfunc global ChildWindowFromPoint "ChildWindowFromPoint" intptr, int

; winmdroot.Foundation.HWND ChildWindowFromPointEx(winmdroot.Foundation.HWND hwnd, global::System.Drawing.Point pt, winmdroot.UI.WindowsAndMessaging.CWP_FLAGS flags)
#cfunc global ChildWindowFromPointEx "ChildWindowFromPointEx" intptr, int, int

; winmdroot.Foundation.BOOL ClientToScreen(winmdroot.Foundation.HWND hWnd, global::System.Drawing.Point* lpPoint)
#cfunc global ClientToScreen "ClientToScreen" intptr, var

; winmdroot.Foundation.BOOL ClipCursor([Optional] winmdroot.Foundation.RECT* lpRect)
#cfunc global ClipCursor "ClipCursor" var

; winmdroot.Foundation.BOOL CloseClipboard()
#cfunc global CloseClipboard "CloseClipboard"

; winmdroot.Foundation.BOOL CloseGestureInfoHandle(winmdroot.UI.Input.Touch.HGESTUREINFO hGestureInfo)
#cfunc global CloseGestureInfoHandle "CloseGestureInfoHandle" intptr

; winmdroot.Foundation.BOOL CloseTouchInputHandle(winmdroot.UI.Input.Touch.HTOUCHINPUT hTouchInput)
#cfunc global CloseTouchInputHandle "CloseTouchInputHandle" intptr

; winmdroot.Foundation.BOOL CloseWindow(winmdroot.Foundation.HWND hWnd)
#cfunc global CloseWindow "CloseWindow" intptr

; winmdroot.Foundation.BOOL CloseWindowStation(winmdroot.System.StationsAndDesktops.HWINSTA hWinSta)
#cfunc global CloseWindowStation "CloseWindowStation" intptr

; winmdroot.Foundation.NTSTATUS ConsoleControl(winmdroot.System.Console.CONSOLECONTROL Command, void* ConsoleInformation, uint ConsoleInformationLength)
#cfunc global ConsoleControl "ConsoleControl" int, intptr, int

; winmdroot.Foundation.BOOL DestroyAcceleratorTable(winmdroot.UI.WindowsAndMessaging.HACCEL hAccel)
#cfunc global DestroyAcceleratorTable "DestroyAcceleratorTable" intptr

; int CopyAcceleratorTableW(winmdroot.UI.WindowsAndMessaging.HACCEL hAccelSrc, [Optional] winmdroot.UI.WindowsAndMessaging.ACCEL* lpAccelDst, int cAccelEntries)
#cfunc global CopyAcceleratorTableW "CopyAcceleratorTableW" intptr, var, int

; winmdroot.Foundation.BOOL DestroyIcon(winmdroot.UI.WindowsAndMessaging.HICON hIcon)
#cfunc global DestroyIcon "DestroyIcon" intptr

; winmdroot.UI.WindowsAndMessaging.HICON CopyIcon(winmdroot.UI.WindowsAndMessaging.HICON hIcon)
#cfunc global CopyIcon "CopyIcon" intptr

; winmdroot.Foundation.HANDLE CopyImage(winmdroot.Foundation.HANDLE h, winmdroot.UI.WindowsAndMessaging.GDI_IMAGE_TYPE type, int cx, int cy, winmdroot.UI.WindowsAndMessaging.IMAGE_FLAGS flags)
#cfunc global CopyImage "CopyImage" intptr, int, int, int, int

; winmdroot.Foundation.BOOL CopyRect(winmdroot.Foundation.RECT* lprcDst, winmdroot.Foundation.RECT* lprcSrc)
#cfunc global CopyRect "CopyRect" var, var

; int CountClipboardFormats()
#cfunc global CountClipboardFormats "CountClipboardFormats"

; winmdroot.UI.WindowsAndMessaging.HACCEL CreateAcceleratorTable(winmdroot.UI.WindowsAndMessaging.ACCEL* paccel, int cAccel)
#cfunc global CreateAcceleratorTableW "CreateAcceleratorTableW" var, int

; winmdroot.Foundation.BOOL CreateCaret(winmdroot.Foundation.HWND hWnd, winmdroot.Graphics.Gdi.HBITMAP hBitmap, int nWidth, int nHeight)
#cfunc global CreateCaret "CreateCaret" intptr, intptr, int, int

; winmdroot.Foundation.BOOL DestroyCursor(winmdroot.UI.WindowsAndMessaging.HCURSOR hCursor)
#cfunc global DestroyCursor "DestroyCursor" intptr

; winmdroot.UI.WindowsAndMessaging.HCURSOR CreateCursor(winmdroot.Foundation.HINSTANCE hInst, int xHotSpot, int yHotSpot, int nWidth, int nHeight, void* pvANDPlane, void* pvXORPlane)
#cfunc global CreateCursor "CreateCursor" intptr, int, int, int, int, intptr, intptr

; winmdroot.System.StationsAndDesktops.HDESK CreateDesktop(winmdroot.Foundation.PCWSTR lpszDesktop, winmdroot.Foundation.PCWSTR lpszDevice, [Optional] winmdroot.Graphics.Gdi.DEVMODEW* pDevmode, winmdroot.System.StationsAndDesktops.DESKTOP_CONTROL_FLAGS dwFlags, uint dwDesiredAccess, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpsa)
#cfunc global CreateDesktopW "CreateDesktopW" wstr, wstr, var, int, int, var

; winmdroot.System.StationsAndDesktops.HDESK CreateDesktopEx(winmdroot.Foundation.PCWSTR lpszDesktop, winmdroot.Foundation.PCWSTR lpszDevice, [Optional] winmdroot.Graphics.Gdi.DEVMODEW* pDevmode, winmdroot.System.StationsAndDesktops.DESKTOP_CONTROL_FLAGS dwFlags, uint dwDesiredAccess, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpsa, uint ulHeapSize, [Optional] void* pvoid)
#cfunc global CreateDesktopExW "CreateDesktopExW" wstr, wstr, var, int, int, var, int, intptr

; winmdroot.Foundation.HWND CreateDialogIndirectParam(winmdroot.Foundation.HINSTANCE hInstance, winmdroot.UI.WindowsAndMessaging.DLGTEMPLATE* lpTemplate, winmdroot.Foundation.HWND hWndParent, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,uint,global::Windows.Win32.Foundation.WPARAM,global::Windows.Win32.Foundation.LPARAM,nint> lpDialogFunc, winmdroot.Foundation.LPARAM dwInitParam)
#cfunc global CreateDialogIndirectParamW "CreateDialogIndirectParamW" intptr, var, intptr, int, intptr

; winmdroot.Foundation.HWND CreateDialogParam(winmdroot.Foundation.HINSTANCE hInstance, winmdroot.Foundation.PCWSTR lpTemplateName, winmdroot.Foundation.HWND hWndParent, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,uint,global::Windows.Win32.Foundation.WPARAM,global::Windows.Win32.Foundation.LPARAM,nint> lpDialogFunc, winmdroot.Foundation.LPARAM dwInitParam)
#cfunc global CreateDialogParamW "CreateDialogParamW" intptr, wstr, intptr, int, intptr

; winmdroot.UI.WindowsAndMessaging.HICON CreateIcon(winmdroot.Foundation.HINSTANCE hInstance, int nWidth, int nHeight, byte cPlanes, byte cBitsPixel, byte* lpbANDbits, byte* lpbXORbits)
#cfunc global CreateIcon "CreateIcon" intptr, int, int, int, int, var, var

; winmdroot.UI.WindowsAndMessaging.HICON CreateIconFromResource(byte* presbits, uint dwResSize, winmdroot.Foundation.BOOL fIcon, uint dwVer)
#cfunc global CreateIconFromResource "CreateIconFromResource" var, int, int, int

; winmdroot.UI.WindowsAndMessaging.HICON CreateIconFromResourceEx(byte* presbits, uint dwResSize, winmdroot.Foundation.BOOL fIcon, uint dwVer, int cxDesired, int cyDesired, winmdroot.UI.WindowsAndMessaging.IMAGE_FLAGS Flags)
#cfunc global CreateIconFromResourceEx "CreateIconFromResourceEx" var, int, int, int, int, int, int

; winmdroot.UI.WindowsAndMessaging.HICON CreateIconIndirect(winmdroot.UI.WindowsAndMessaging.ICONINFO* piconinfo)
#cfunc global CreateIconIndirect "CreateIconIndirect" var

; winmdroot.Foundation.HWND CreateMDIWindow(winmdroot.Foundation.PCWSTR lpClassName, winmdroot.Foundation.PCWSTR lpWindowName, winmdroot.UI.WindowsAndMessaging.WINDOW_STYLE dwStyle, int X, int Y, int nWidth, int nHeight, winmdroot.Foundation.HWND hWndParent, winmdroot.Foundation.HINSTANCE hInstance, winmdroot.Foundation.LPARAM lParam)
#cfunc global CreateMDIWindowW "CreateMDIWindowW" wstr, wstr, int, int, int, int, int, intptr, intptr, intptr

; winmdroot.UI.WindowsAndMessaging.HMENU CreateMenu()
#cfunc global CreateMenu "CreateMenu"

; winmdroot.UI.WindowsAndMessaging.HMENU CreatePopupMenu()
#cfunc global CreatePopupMenu "CreatePopupMenu"

; void DestroySyntheticPointerDevice(winmdroot.UI.Controls.HSYNTHETICPOINTERDEVICE device)
#func global DestroySyntheticPointerDevice "DestroySyntheticPointerDevice" intptr

; winmdroot.UI.Controls.HSYNTHETICPOINTERDEVICE CreateSyntheticPointerDevice(winmdroot.UI.WindowsAndMessaging.POINTER_INPUT_TYPE pointerType, uint maxCount, winmdroot.UI.Controls.POINTER_FEEDBACK_MODE mode)
#cfunc global CreateSyntheticPointerDevice "CreateSyntheticPointerDevice" int, int, int

; winmdroot.Foundation.HWND CreateWindowEx(winmdroot.UI.WindowsAndMessaging.WINDOW_EX_STYLE dwExStyle, winmdroot.Foundation.PCWSTR lpClassName, winmdroot.Foundation.PCWSTR lpWindowName, winmdroot.UI.WindowsAndMessaging.WINDOW_STYLE dwStyle, int X, int Y, int nWidth, int nHeight, winmdroot.Foundation.HWND hWndParent, winmdroot.UI.WindowsAndMessaging.HMENU hMenu, winmdroot.Foundation.HINSTANCE hInstance, [Optional] void* lpParam)
#cfunc global CreateWindowExW "CreateWindowExW" int, wstr, wstr, int, int, int, int, int, intptr, intptr, intptr, intptr

; winmdroot.System.StationsAndDesktops.HWINSTA CreateWindowStation(winmdroot.Foundation.PCWSTR lpwinsta, uint dwFlags, uint dwDesiredAccess, [Optional] winmdroot.Security.SECURITY_ATTRIBUTES* lpsa)
#cfunc global CreateWindowStationW "CreateWindowStationW" wstr, int, int, var

; winmdroot.Foundation.BOOL DdeDisconnect(winmdroot.System.DataExchange.HCONV hConv)
#cfunc global DdeDisconnect "DdeDisconnect" intptr

; winmdroot.Foundation.BOOL DdeAbandonTransaction(uint idInst, winmdroot.System.DataExchange.HCONV hConv, uint idTransaction)
#cfunc global DdeAbandonTransaction "DdeAbandonTransaction" int, intptr, int

; winmdroot.Foundation.BOOL DdeFreeDataHandle(winmdroot.System.DataExchange.HDDEDATA hData)
#cfunc global DdeFreeDataHandle "DdeFreeDataHandle" intptr

; byte* DdeAccessData(winmdroot.System.DataExchange.HDDEDATA hData, [Optional] uint* pcbDataSize)
#cfunc global DdeAccessData "DdeAccessData" intptr, var

; winmdroot.System.DataExchange.HDDEDATA DdeAddData(winmdroot.System.DataExchange.HDDEDATA hData, byte* pSrc, uint cb, uint cbOff)
#cfunc global DdeAddData "DdeAddData" intptr, var, int, int

; winmdroot.System.DataExchange.HDDEDATA DdeClientTransaction([Optional] byte* pData, uint cbData, winmdroot.System.DataExchange.HCONV hConv, winmdroot.System.DataExchange.HSZ hszItem, uint wFmt, winmdroot.System.DataExchange.DDE_CLIENT_TRANSACTION_TYPE wType, uint dwTimeout, [Optional] uint* pdwResult)
#cfunc global DdeClientTransaction "DdeClientTransaction" var, int, intptr, intptr, int, int, int, var

; int DdeCmpStringHandles(winmdroot.System.DataExchange.HSZ hsz1, winmdroot.System.DataExchange.HSZ hsz2)
#cfunc global DdeCmpStringHandles "DdeCmpStringHandles" intptr, intptr

; winmdroot.System.DataExchange.HCONV DdeConnect(uint idInst, winmdroot.System.DataExchange.HSZ hszService, winmdroot.System.DataExchange.HSZ hszTopic, [Optional] winmdroot.System.DataExchange.CONVCONTEXT* pCC)
#cfunc global DdeConnect "DdeConnect" int, intptr, intptr, var

; winmdroot.Foundation.BOOL DdeDisconnectList(winmdroot.System.DataExchange.HCONVLIST hConvList)
#cfunc global DdeDisconnectList "DdeDisconnectList" intptr

; winmdroot.System.DataExchange.HCONVLIST DdeConnectList(uint idInst, winmdroot.System.DataExchange.HSZ hszService, winmdroot.System.DataExchange.HSZ hszTopic, winmdroot.System.DataExchange.HCONVLIST hConvList, [Optional] winmdroot.System.DataExchange.CONVCONTEXT* pCC)
#cfunc global DdeConnectList "DdeConnectList" int, intptr, intptr, intptr, var

; winmdroot.System.DataExchange.HDDEDATA DdeCreateDataHandle(uint idInst, [Optional] byte* pSrc, uint cb, uint cbOff, winmdroot.System.DataExchange.HSZ hszItem, uint wFmt, uint afCmd)
#cfunc global DdeCreateDataHandle "DdeCreateDataHandle" int, var, int, int, intptr, int, int

; winmdroot.System.DataExchange.HSZ DdeCreateStringHandleW(uint idInst, winmdroot.Foundation.PCWSTR psz, int iCodePage)
#cfunc global DdeCreateStringHandleW "DdeCreateStringHandleW" int, wstr, int

; winmdroot.Foundation.BOOL DdeEnableCallback(uint idInst, winmdroot.System.DataExchange.HCONV hConv, winmdroot.System.DataExchange.DDE_ENABLE_CALLBACK_CMD wCmd)
#cfunc global DdeEnableCallback "DdeEnableCallback" int, intptr, int

; winmdroot.Foundation.BOOL DdeFreeStringHandle(uint idInst, winmdroot.System.DataExchange.HSZ hsz)
#cfunc global DdeFreeStringHandle "DdeFreeStringHandle" int, intptr

; uint DdeGetData(winmdroot.System.DataExchange.HDDEDATA hData, [Optional] byte* pDst, uint cbMax, uint cbOff)
#cfunc global DdeGetData "DdeGetData" intptr, var, int, int

; uint DdeGetLastError(uint idInst)
#cfunc global DdeGetLastError "DdeGetLastError" int

; winmdroot.Foundation.BOOL DdeImpersonateClient(winmdroot.System.DataExchange.HCONV hConv)
#cfunc global DdeImpersonateClient "DdeImpersonateClient" intptr

; uint DdeInitializeW(uint* pidInst, delegate *unmanaged[Stdcall]<uint,uint,global::Windows.Win32.System.DataExchange.HCONV,global::Windows.Win32.System.DataExchange.HSZ,global::Windows.Win32.System.DataExchange.HSZ,global::Windows.Win32.System.DataExchange.HDDEDATA,nuint,nuint,global::Windows.Win32.System.DataExchange.HDDEDATA> pfnCallback, winmdroot.System.DataExchange.DDE_INITIALIZE_COMMAND afCmd, uint ulRes)
#cfunc global DdeInitializeW "DdeInitializeW" var, int, int, int

; winmdroot.Foundation.BOOL DdeKeepStringHandle(uint idInst, winmdroot.System.DataExchange.HSZ hsz)
#cfunc global DdeKeepStringHandle "DdeKeepStringHandle" int, intptr

; winmdroot.System.DataExchange.HDDEDATA DdeNameService(uint idInst, winmdroot.System.DataExchange.HSZ hsz1, winmdroot.System.DataExchange.HSZ hsz2, winmdroot.System.DataExchange.DDE_NAME_SERVICE_CMD afCmd)
#cfunc global DdeNameService "DdeNameService" int, intptr, intptr, int

; winmdroot.Foundation.BOOL DdePostAdvise(uint idInst, winmdroot.System.DataExchange.HSZ hszTopic, winmdroot.System.DataExchange.HSZ hszItem)
#cfunc global DdePostAdvise "DdePostAdvise" int, intptr, intptr

; uint DdeQueryConvInfo(winmdroot.System.DataExchange.HCONV hConv, uint idTransaction, winmdroot.System.DataExchange.CONVINFO* pConvInfo)
#cfunc global DdeQueryConvInfo "DdeQueryConvInfo" intptr, int, var

; winmdroot.System.DataExchange.HCONV DdeQueryNextServer(winmdroot.System.DataExchange.HCONVLIST hConvList, winmdroot.System.DataExchange.HCONV hConvPrev)
#cfunc global DdeQueryNextServer "DdeQueryNextServer" intptr, intptr

; uint DdeQueryStringW(uint idInst, winmdroot.System.DataExchange.HSZ hsz, winmdroot.Foundation.PWSTR psz, uint cchMax, int iCodePage)
#cfunc global DdeQueryStringW "DdeQueryStringW" int, intptr, wstr, int, int

; winmdroot.System.DataExchange.HCONV DdeReconnect(winmdroot.System.DataExchange.HCONV hConv)
#cfunc global DdeReconnect "DdeReconnect" intptr

; winmdroot.Foundation.BOOL DdeSetQualityOfService(winmdroot.Foundation.HWND hwndClient, winmdroot.Security.SECURITY_QUALITY_OF_SERVICE* pqosNew, winmdroot.Security.SECURITY_QUALITY_OF_SERVICE* pqosPrev)
#cfunc global DdeSetQualityOfService "DdeSetQualityOfService" intptr, var, var

; winmdroot.Foundation.BOOL DdeSetUserHandle(winmdroot.System.DataExchange.HCONV hConv, uint id, nuint hUser)
#cfunc global DdeSetUserHandle "DdeSetUserHandle" intptr, int, int

; winmdroot.Foundation.BOOL DdeUnaccessData(winmdroot.System.DataExchange.HDDEDATA hData)
#cfunc global DdeUnaccessData "DdeUnaccessData" intptr

; winmdroot.Foundation.BOOL DdeUninitialize(uint idInst)
#cfunc global DdeUninitialize "DdeUninitialize" int

; winmdroot.Foundation.LRESULT DefFrameProcW(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.HWND hWndMDIClient, uint uMsg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam)
#cfunc global DefFrameProcW "DefFrameProcW" intptr, intptr, int, intptr, intptr

; winmdroot.Foundation.LRESULT DefMDIChildProcW(winmdroot.Foundation.HWND hWnd, uint uMsg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam)
#cfunc global DefMDIChildProcW "DefMDIChildProcW" intptr, int, intptr, intptr

; winmdroot.Foundation.LRESULT DefRawInputProc(winmdroot.UI.Input.RAWINPUT** paRawInput, int nInput, uint cbSizeHeader)
#cfunc global DefRawInputProc "DefRawInputProc" var, int, int

; winmdroot.UI.WindowsAndMessaging.HDWP DeferWindowPos(winmdroot.UI.WindowsAndMessaging.HDWP hWinPosInfo, winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.HWND hWndInsertAfter, int x, int y, int cx, int cy, winmdroot.UI.WindowsAndMessaging.SET_WINDOW_POS_FLAGS uFlags)
#cfunc global DeferWindowPos "DeferWindowPos" intptr, intptr, intptr, int, int, int, int, int

; winmdroot.Foundation.BOOL DeleteMenu(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, uint uPosition, winmdroot.UI.WindowsAndMessaging.MENU_ITEM_FLAGS uFlags)
#cfunc global DeleteMenu "DeleteMenu" intptr, int, int

; winmdroot.Foundation.BOOL DeregisterShellHookWindow(winmdroot.Foundation.HWND hwnd)
#cfunc global DeregisterShellHookWindow "DeregisterShellHookWindow" intptr

; winmdroot.Foundation.BOOL DestroyCaret()
#cfunc global DestroyCaret "DestroyCaret"

; winmdroot.Foundation.BOOL DestroyWindow(winmdroot.Foundation.HWND hWnd)
#cfunc global DestroyWindow "DestroyWindow" intptr

; nint DialogBoxIndirectParam(winmdroot.Foundation.HINSTANCE hInstance, winmdroot.UI.WindowsAndMessaging.DLGTEMPLATE* hDialogTemplate, winmdroot.Foundation.HWND hWndParent, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,uint,global::Windows.Win32.Foundation.WPARAM,global::Windows.Win32.Foundation.LPARAM,nint> lpDialogFunc, winmdroot.Foundation.LPARAM dwInitParam)
#cfunc global DialogBoxIndirectParamW "DialogBoxIndirectParamW" intptr, var, intptr, int, intptr

; nint DialogBoxParam(winmdroot.Foundation.HINSTANCE hInstance, winmdroot.Foundation.PCWSTR lpTemplateName, winmdroot.Foundation.HWND hWndParent, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,uint,global::Windows.Win32.Foundation.WPARAM,global::Windows.Win32.Foundation.LPARAM,nint> lpDialogFunc, winmdroot.Foundation.LPARAM dwInitParam)
#cfunc global DialogBoxParamW "DialogBoxParamW" intptr, wstr, intptr, int, intptr

; void DisableProcessWindowsGhosting()
#func global DisableProcessWindowsGhosting "DisableProcessWindowsGhosting"

; winmdroot.Foundation.LRESULT DispatchMessageW(winmdroot.UI.WindowsAndMessaging.MSG* lpMsg)
#cfunc global DispatchMessageW "DispatchMessageW" var

; int DisplayConfigGetDeviceInfo(winmdroot.Devices.Display.DISPLAYCONFIG_DEVICE_INFO_HEADER* requestPacket)
#cfunc global DisplayConfigGetDeviceInfo "DisplayConfigGetDeviceInfo" var

; int DisplayConfigSetDeviceInfo(winmdroot.Devices.Display.DISPLAYCONFIG_DEVICE_INFO_HEADER* setPacket)
#cfunc global DisplayConfigSetDeviceInfo "DisplayConfigSetDeviceInfo" var

; int DlgDirListW(winmdroot.Foundation.HWND hDlg, winmdroot.Foundation.PWSTR lpPathSpec, int nIDListBox, int nIDStaticPath, winmdroot.UI.Controls.DLG_DIR_LIST_FILE_TYPE uFileType)
#cfunc global DlgDirListW "DlgDirListW" intptr, wstr, int, int, int

; int DlgDirListComboBox(winmdroot.Foundation.HWND hDlg, winmdroot.Foundation.PWSTR lpPathSpec, int nIDComboBox, int nIDStaticPath, winmdroot.UI.Controls.DLG_DIR_LIST_FILE_TYPE uFiletype)
#cfunc global DlgDirListComboBoxW "DlgDirListComboBoxW" intptr, wstr, int, int, int

; winmdroot.Foundation.BOOL DlgDirSelectComboBoxEx(winmdroot.Foundation.HWND hwndDlg, winmdroot.Foundation.PWSTR lpString, int cchOut, int idComboBox)
#cfunc global DlgDirSelectComboBoxExW "DlgDirSelectComboBoxExW" intptr, wstr, int, int

; winmdroot.Foundation.BOOL DlgDirSelectEx(winmdroot.Foundation.HWND hwndDlg, winmdroot.Foundation.PWSTR lpString, int chCount, int idListBox)
#cfunc global DlgDirSelectExW "DlgDirSelectExW" intptr, wstr, int, int

; winmdroot.Foundation.BOOL DragDetect(winmdroot.Foundation.HWND hwnd, global::System.Drawing.Point pt)
#cfunc global DragDetect "DragDetect" intptr, int

; uint DragObject(winmdroot.Foundation.HWND hwndParent, winmdroot.Foundation.HWND hwndFrom, uint fmt, nuint data, winmdroot.UI.WindowsAndMessaging.HCURSOR hcur)
#cfunc global DragObject "DragObject" intptr, intptr, int, int, intptr

; winmdroot.Foundation.BOOL DrawAnimatedRects(winmdroot.Foundation.HWND hwnd, int idAni, winmdroot.Foundation.RECT* lprcFrom, winmdroot.Foundation.RECT* lprcTo)
#cfunc global DrawAnimatedRects "DrawAnimatedRects" intptr, int, var, var

; winmdroot.Foundation.BOOL DrawCaption(winmdroot.Foundation.HWND hwnd, winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.RECT* lprect, winmdroot.Graphics.Gdi.DRAW_CAPTION_FLAGS flags)
#cfunc global DrawCaption "DrawCaption" intptr, intptr, var, int

; winmdroot.Foundation.BOOL DrawEdge(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.RECT* qrc, winmdroot.Graphics.Gdi.DRAWEDGE_FLAGS edge, winmdroot.Graphics.Gdi.DRAW_EDGE_FLAGS grfFlags)
#cfunc global DrawEdge "DrawEdge" intptr, var, int, int

; winmdroot.Foundation.BOOL DrawFocusRect(winmdroot.Graphics.Gdi.HDC hDC, winmdroot.Foundation.RECT* lprc)
#cfunc global DrawFocusRect "DrawFocusRect" intptr, var

; winmdroot.Foundation.BOOL DrawFrameControl(winmdroot.Graphics.Gdi.HDC param0, winmdroot.Foundation.RECT* param1, winmdroot.Graphics.Gdi.DFC_TYPE param2, winmdroot.Graphics.Gdi.DFCS_STATE param3)
#cfunc global DrawFrameControl "DrawFrameControl" intptr, var, int, int

; winmdroot.Foundation.BOOL DrawIcon(winmdroot.Graphics.Gdi.HDC hDC, int X, int Y, winmdroot.UI.WindowsAndMessaging.HICON hIcon)
#cfunc global DrawIcon "DrawIcon" intptr, int, int, intptr

; winmdroot.Foundation.BOOL DrawIconEx(winmdroot.Graphics.Gdi.HDC hdc, int xLeft, int yTop, winmdroot.UI.WindowsAndMessaging.HICON hIcon, int cxWidth, int cyWidth, uint istepIfAniCur, winmdroot.Graphics.Gdi.HBRUSH hbrFlickerFreeDraw, winmdroot.UI.WindowsAndMessaging.DI_FLAGS diFlags)
#cfunc global DrawIconEx "DrawIconEx" intptr, int, int, intptr, int, int, int, intptr, int

; winmdroot.Foundation.BOOL DrawMenuBar(winmdroot.Foundation.HWND hWnd)
#cfunc global DrawMenuBar "DrawMenuBar" intptr

; winmdroot.Foundation.BOOL DrawStateW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Graphics.Gdi.HBRUSH hbrFore, delegate *unmanaged[Stdcall]<global::Windows.Win32.Graphics.Gdi.HDC,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.WPARAM,int,int,global::Windows.Win32.Foundation.BOOL> qfnCallBack, winmdroot.Foundation.LPARAM lData, winmdroot.Foundation.WPARAM wData, int x, int y, int cx, int cy, winmdroot.Graphics.Gdi.DRAWSTATE_FLAGS uFlags)
#cfunc global DrawStateW "DrawStateW" intptr, intptr, int, intptr, intptr, int, int, int, int, int

; int DrawTextW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.PCWSTR lpchText, int cchText, winmdroot.Foundation.RECT* lprc, winmdroot.Graphics.Gdi.DRAW_TEXT_FORMAT format)
#cfunc global DrawTextW "DrawTextW" intptr, wstr, int, var, int

; int DrawTextExW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.PWSTR lpchText, int cchText, winmdroot.Foundation.RECT* lprc, winmdroot.Graphics.Gdi.DRAW_TEXT_FORMAT format, [Optional] winmdroot.Graphics.Gdi.DRAWTEXTPARAMS* lpdtp)
#cfunc global DrawTextExW "DrawTextExW" intptr, wstr, int, var, int, var

; winmdroot.Foundation.BOOL EmptyClipboard()
#cfunc global EmptyClipboard "EmptyClipboard"

; winmdroot.Foundation.BOOL EnableMenuItem(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, uint uIDEnableItem, winmdroot.UI.WindowsAndMessaging.MENU_ITEM_FLAGS uEnable)
#cfunc global EnableMenuItem "EnableMenuItem" intptr, int, int

; winmdroot.Foundation.BOOL EnableMouseInPointer(winmdroot.Foundation.BOOL fEnable)
#cfunc global EnableMouseInPointer "EnableMouseInPointer" int

; winmdroot.Foundation.BOOL EnableNonClientDpiScaling(winmdroot.Foundation.HWND hwnd)
#cfunc global EnableNonClientDpiScaling "EnableNonClientDpiScaling" intptr

; winmdroot.Foundation.BOOL EnableScrollBar(winmdroot.Foundation.HWND hWnd, uint wSBflags, winmdroot.UI.Controls.ENABLE_SCROLL_BAR_ARROWS wArrows)
#cfunc global EnableScrollBar "EnableScrollBar" intptr, int, int

; winmdroot.Foundation.BOOL EnableWindow(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.BOOL bEnable)
#cfunc global EnableWindow "EnableWindow" intptr, int

; winmdroot.Foundation.BOOL EndDeferWindowPos(winmdroot.UI.WindowsAndMessaging.HDWP hWinPosInfo)
#cfunc global EndDeferWindowPos "EndDeferWindowPos" intptr

; winmdroot.Foundation.BOOL EndDialog(winmdroot.Foundation.HWND hDlg, nint nResult)
#cfunc global EndDialog "EndDialog" intptr, int

; winmdroot.Foundation.BOOL EndMenu()
#cfunc global EndMenu "EndMenu"

; winmdroot.Foundation.BOOL EndPaint(winmdroot.Foundation.HWND hWnd, winmdroot.Graphics.Gdi.PAINTSTRUCT* lpPaint)
#cfunc global EndPaint "EndPaint" intptr, var

; winmdroot.Foundation.BOOL EnumChildWindows(winmdroot.Foundation.HWND hWndParent, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.BOOL> lpEnumFunc, winmdroot.Foundation.LPARAM lParam)
#cfunc global EnumChildWindows "EnumChildWindows" intptr, int, intptr

; uint EnumClipboardFormats(uint format)
#cfunc global EnumClipboardFormats "EnumClipboardFormats" int

; winmdroot.Foundation.BOOL EnumDesktopWindows(winmdroot.System.StationsAndDesktops.HDESK hDesktop, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.BOOL> lpfn, winmdroot.Foundation.LPARAM lParam)
#cfunc global EnumDesktopWindows "EnumDesktopWindows" intptr, int, intptr

; winmdroot.Foundation.BOOL EnumDesktops(winmdroot.System.StationsAndDesktops.HWINSTA hwinsta, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.BOOL> lpEnumFunc, winmdroot.Foundation.LPARAM lParam)
#cfunc global EnumDesktopsW "EnumDesktopsW" intptr, int, intptr

; winmdroot.Foundation.BOOL EnumDisplayDevicesW(winmdroot.Foundation.PCWSTR lpDevice, uint iDevNum, winmdroot.Graphics.Gdi.DISPLAY_DEVICEW* lpDisplayDevice, uint dwFlags)
#cfunc global EnumDisplayDevicesW "EnumDisplayDevicesW" wstr, int, var, int

; winmdroot.Foundation.BOOL EnumDisplayMonitors(winmdroot.Graphics.Gdi.HDC hdc, [Optional] winmdroot.Foundation.RECT* lprcClip, delegate *unmanaged[Stdcall]<global::Windows.Win32.Graphics.Gdi.HMONITOR,global::Windows.Win32.Graphics.Gdi.HDC,global::Windows.Win32.Foundation.RECT*,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.BOOL> lpfnEnum, winmdroot.Foundation.LPARAM dwData)
#cfunc global EnumDisplayMonitors "EnumDisplayMonitors" intptr, var, int, intptr

; winmdroot.Foundation.BOOL EnumDisplaySettingsW(winmdroot.Foundation.PCWSTR lpszDeviceName, winmdroot.Graphics.Gdi.ENUM_DISPLAY_SETTINGS_MODE iModeNum, winmdroot.Graphics.Gdi.DEVMODEW* lpDevMode)
#cfunc global EnumDisplaySettingsW "EnumDisplaySettingsW" wstr, int, var

; winmdroot.Foundation.BOOL EnumDisplaySettingsExW(winmdroot.Foundation.PCWSTR lpszDeviceName, winmdroot.Graphics.Gdi.ENUM_DISPLAY_SETTINGS_MODE iModeNum, winmdroot.Graphics.Gdi.DEVMODEW* lpDevMode, winmdroot.Graphics.Gdi.ENUM_DISPLAY_SETTINGS_FLAGS dwFlags)
#cfunc global EnumDisplaySettingsExW "EnumDisplaySettingsExW" wstr, int, var, int

; int EnumPropsW(winmdroot.Foundation.HWND hWnd, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,winmdroot.Foundation.PCWSTR,global::Windows.Win32.Foundation.HANDLE,global::Windows.Win32.Foundation.BOOL> lpEnumFunc)
#cfunc global EnumPropsW "EnumPropsW" intptr, int

; int EnumPropsExW(winmdroot.Foundation.HWND hWnd, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.HANDLE,nuint,global::Windows.Win32.Foundation.BOOL> lpEnumFunc, winmdroot.Foundation.LPARAM lParam)
#cfunc global EnumPropsExW "EnumPropsExW" intptr, int, intptr

; winmdroot.Foundation.BOOL EnumThreadWindows(uint dwThreadId, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.BOOL> lpfn, winmdroot.Foundation.LPARAM lParam)
#cfunc global EnumThreadWindows "EnumThreadWindows" int, int, intptr

; winmdroot.Foundation.BOOL EnumWindowStations(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.BOOL> lpEnumFunc, winmdroot.Foundation.LPARAM lParam)
#cfunc global EnumWindowStationsW "EnumWindowStationsW" int, intptr

; winmdroot.Foundation.BOOL EnumWindows(delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.BOOL> lpEnumFunc, winmdroot.Foundation.LPARAM lParam)
#cfunc global EnumWindows "EnumWindows" int, intptr

; winmdroot.Foundation.BOOL EqualRect(winmdroot.Foundation.RECT* lprc1, winmdroot.Foundation.RECT* lprc2)
#cfunc global EqualRect "EqualRect" var, var

; winmdroot.Foundation.BOOL EvaluateProximityToPolygon(uint numVertices, global::System.Drawing.Point* controlPolygon, winmdroot.UI.Controls.TOUCH_HIT_TESTING_INPUT* pHitTestingInput, winmdroot.UI.Controls.TOUCH_HIT_TESTING_PROXIMITY_EVALUATION* pProximityEval)
#cfunc global EvaluateProximityToPolygon "EvaluateProximityToPolygon" int, var, var, var

; winmdroot.Foundation.BOOL EvaluateProximityToRect(winmdroot.Foundation.RECT* controlBoundingBox, winmdroot.UI.Controls.TOUCH_HIT_TESTING_INPUT* pHitTestingInput, winmdroot.UI.Controls.TOUCH_HIT_TESTING_PROXIMITY_EVALUATION* pProximityEval)
#cfunc global EvaluateProximityToRect "EvaluateProximityToRect" var, var, var

; int ExcludeUpdateRgn(winmdroot.Graphics.Gdi.HDC hDC, winmdroot.Foundation.HWND hWnd)
#cfunc global ExcludeUpdateRgn "ExcludeUpdateRgn" intptr, intptr

; winmdroot.Foundation.BOOL ExitWindowsEx(winmdroot.System.Shutdown.EXIT_WINDOWS_FLAGS uFlags, winmdroot.System.Shutdown.SHUTDOWN_REASON dwReason)
#cfunc global ExitWindowsEx "ExitWindowsEx" int, int

; int FillRect(winmdroot.Graphics.Gdi.HDC hDC, winmdroot.Foundation.RECT* lprc, winmdroot.Graphics.Gdi.HBRUSH hbr)
#cfunc global FillRect "FillRect" intptr, var, intptr

; winmdroot.Foundation.HWND FindWindow(winmdroot.Foundation.PCWSTR lpClassName, winmdroot.Foundation.PCWSTR lpWindowName)
#cfunc global FindWindowW "FindWindowW" wstr, wstr

; winmdroot.Foundation.HWND FindWindowEx(winmdroot.Foundation.HWND hWndParent, winmdroot.Foundation.HWND hWndChildAfter, winmdroot.Foundation.PCWSTR lpszClass, winmdroot.Foundation.PCWSTR lpszWindow)
#cfunc global FindWindowExW "FindWindowExW" intptr, intptr, wstr, wstr

; winmdroot.Foundation.BOOL FlashWindow(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.BOOL bInvert)
#cfunc global FlashWindow "FlashWindow" intptr, int

; winmdroot.Foundation.BOOL FlashWindowEx(winmdroot.UI.WindowsAndMessaging.FLASHWINFO* pfwi)
#cfunc global FlashWindowEx "FlashWindowEx" var

; int FrameRect(winmdroot.Graphics.Gdi.HDC hDC, winmdroot.Foundation.RECT* lprc, winmdroot.Graphics.Gdi.HBRUSH hbr)
#cfunc global FrameRect "FrameRect" intptr, var, intptr

; winmdroot.Foundation.BOOL FreeDDElParam(uint msg, winmdroot.Foundation.LPARAM lParam)
#cfunc global FreeDDElParam "FreeDDElParam" int, intptr

; winmdroot.Foundation.HWND GetActiveWindow()
#cfunc global GetActiveWindow "GetActiveWindow"

; winmdroot.Foundation.BOOL GetAltTabInfo(winmdroot.Foundation.HWND hwnd, int iItem, winmdroot.UI.WindowsAndMessaging.ALTTABINFO* pati, winmdroot.Foundation.PWSTR pszItemText, uint cchItemText)
#cfunc global GetAltTabInfoW "GetAltTabInfoW" intptr, int, var, wstr, int

; winmdroot.Foundation.HWND GetAncestor(winmdroot.Foundation.HWND hwnd, winmdroot.UI.WindowsAndMessaging.GET_ANCESTOR_FLAGS gaFlags)
#cfunc global GetAncestor "GetAncestor" intptr, int

; short GetAsyncKeyState(int vKey)
#cfunc global GetAsyncKeyState "GetAsyncKeyState" int

; winmdroot.Foundation.BOOL GetAutoRotationState(winmdroot.Devices.Display.AR_STATE* pState)
#cfunc global GetAutoRotationState "GetAutoRotationState" var

; winmdroot.UI.HiDpi.DPI_AWARENESS GetAwarenessFromDpiAwarenessContext(winmdroot.UI.HiDpi.DPI_AWARENESS_CONTEXT value)
#cfunc global GetAwarenessFromDpiAwarenessContext "GetAwarenessFromDpiAwarenessContext" intptr

; winmdroot.Foundation.BOOL GetCIMSSM(winmdroot.UI.Input.INPUT_MESSAGE_SOURCE* inputMessageSource)
#cfunc global GetCIMSSM "GetCIMSSM" var

; winmdroot.Foundation.HWND GetCapture()
#cfunc global GetCapture "GetCapture"

; uint GetCaretBlinkTime()
#cfunc global GetCaretBlinkTime "GetCaretBlinkTime"

; winmdroot.Foundation.BOOL GetCaretPos(global::System.Drawing.Point* lpPoint)
#cfunc global GetCaretPos "GetCaretPos" var

; winmdroot.Foundation.BOOL GetClassInfo(winmdroot.Foundation.HINSTANCE hInstance, winmdroot.Foundation.PCWSTR lpClassName, winmdroot.UI.WindowsAndMessaging.WNDCLASSW* lpWndClass)
#cfunc global GetClassInfoW "GetClassInfoW" intptr, wstr, var

; winmdroot.Foundation.BOOL GetClassInfoEx(winmdroot.Foundation.HINSTANCE hInstance, winmdroot.Foundation.PCWSTR lpszClass, winmdroot.UI.WindowsAndMessaging.WNDCLASSEXW* lpwcx)
#cfunc global GetClassInfoExW "GetClassInfoExW" intptr, wstr, var

; uint GetClassLong(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.GET_CLASS_LONG_INDEX nIndex)
#cfunc global GetClassLongW "GetClassLongW" intptr, int

; int GetClassName(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.PWSTR lpClassName, int nMaxCount)
#cfunc global GetClassNameW "GetClassNameW" intptr, wstr, int

; ushort GetClassWord(winmdroot.Foundation.HWND hWnd, int nIndex)
#cfunc global GetClassWord "GetClassWord" intptr, int

; winmdroot.Foundation.BOOL GetClientRect(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.RECT* lpRect)
#cfunc global GetClientRect "GetClientRect" intptr, var

; winmdroot.Foundation.BOOL GetClipCursor(winmdroot.Foundation.RECT* lpRect)
#cfunc global GetClipCursor "GetClipCursor" var

; winmdroot.Foundation.HANDLE GetClipboardData(uint uFormat)
#cfunc global GetClipboardData "GetClipboardData" int

; int GetClipboardFormatName(uint format, winmdroot.Foundation.PWSTR lpszFormatName, int cchMaxCount)
#cfunc global GetClipboardFormatNameW "GetClipboardFormatNameW" int, wstr, int

; winmdroot.Foundation.HWND GetClipboardOwner()
#cfunc global GetClipboardOwner "GetClipboardOwner"

; uint GetClipboardSequenceNumber()
#cfunc global GetClipboardSequenceNumber "GetClipboardSequenceNumber"

; winmdroot.Foundation.HWND GetClipboardViewer()
#cfunc global GetClipboardViewer "GetClipboardViewer"

; winmdroot.Foundation.BOOL GetComboBoxInfo(winmdroot.Foundation.HWND hwndCombo, winmdroot.UI.Controls.COMBOBOXINFO* pcbi)
#cfunc global GetComboBoxInfo "GetComboBoxInfo" intptr, var

; winmdroot.Foundation.BOOL GetCurrentInputMessageSource(winmdroot.UI.Input.INPUT_MESSAGE_SOURCE* inputMessageSource)
#cfunc global GetCurrentInputMessageSource "GetCurrentInputMessageSource" var

; winmdroot.UI.WindowsAndMessaging.HCURSOR GetCursor()
#cfunc global GetCursor "GetCursor"

; winmdroot.Foundation.BOOL GetCursorInfo(winmdroot.UI.WindowsAndMessaging.CURSORINFO* pci)
#cfunc global GetCursorInfo "GetCursorInfo" var

; winmdroot.Foundation.BOOL GetCursorPos(global::System.Drawing.Point* lpPoint)
#cfunc global GetCursorPos "GetCursorPos" var

; winmdroot.Graphics.Gdi.HDC GetDC(winmdroot.Foundation.HWND hWnd)
#cfunc global GetDC "GetDC" intptr

; winmdroot.Graphics.Gdi.HDC GetDCEx(winmdroot.Foundation.HWND hWnd, winmdroot.Graphics.Gdi.HRGN hrgnClip, winmdroot.Graphics.Gdi.GET_DCX_FLAGS flags)
#cfunc global GetDCEx "GetDCEx" intptr, intptr, int

; winmdroot.Foundation.HWND GetDesktopWindow()
#cfunc global GetDesktopWindow "GetDesktopWindow"

; int GetDialogBaseUnits()
#cfunc global GetDialogBaseUnits "GetDialogBaseUnits"

; winmdroot.UI.HiDpi.DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS GetDialogControlDpiChangeBehavior(winmdroot.Foundation.HWND hWnd)
#cfunc global GetDialogControlDpiChangeBehavior "GetDialogControlDpiChangeBehavior" intptr

; winmdroot.UI.HiDpi.DIALOG_DPI_CHANGE_BEHAVIORS GetDialogDpiChangeBehavior(winmdroot.Foundation.HWND hDlg)
#cfunc global GetDialogDpiChangeBehavior "GetDialogDpiChangeBehavior" intptr

; winmdroot.Foundation.BOOL GetDisplayAutoRotationPreferences(winmdroot.Devices.Display.ORIENTATION_PREFERENCE* pOrientation)
#cfunc global GetDisplayAutoRotationPreferences "GetDisplayAutoRotationPreferences" var

; winmdroot.Foundation.WIN32_ERROR GetDisplayConfigBufferSizes(winmdroot.Devices.Display.QUERY_DISPLAY_CONFIG_FLAGS flags, uint* numPathArrayElements, uint* numModeInfoArrayElements)
#cfunc global GetDisplayConfigBufferSizes "GetDisplayConfigBufferSizes" int, var, var

; int GetDlgCtrlID(winmdroot.Foundation.HWND hWnd)
#cfunc global GetDlgCtrlID "GetDlgCtrlID" intptr

; winmdroot.Foundation.HWND GetDlgItem(winmdroot.Foundation.HWND hDlg, int nIDDlgItem)
#cfunc global GetDlgItem "GetDlgItem" intptr, int

; uint GetDlgItemInt(winmdroot.Foundation.HWND hDlg, int nIDDlgItem, [Optional] winmdroot.Foundation.BOOL* lpTranslated, winmdroot.Foundation.BOOL bSigned)
#cfunc global GetDlgItemInt "GetDlgItemInt" intptr, int, var, int

; uint GetDlgItemText(winmdroot.Foundation.HWND hDlg, int nIDDlgItem, winmdroot.Foundation.PWSTR lpString, int cchMax)
#cfunc global GetDlgItemTextW "GetDlgItemTextW" intptr, int, wstr, int

; uint GetDoubleClickTime()
#cfunc global GetDoubleClickTime "GetDoubleClickTime"

; winmdroot.UI.HiDpi.DPI_AWARENESS_CONTEXT GetDpiAwarenessContextForProcess(winmdroot.Foundation.HANDLE hProcess)
#cfunc global GetDpiAwarenessContextForProcess "GetDpiAwarenessContextForProcess" intptr

; uint GetDpiForSystem()
#cfunc global GetDpiForSystem "GetDpiForSystem"

; uint GetDpiForWindow(winmdroot.Foundation.HWND hwnd)
#cfunc global GetDpiForWindow "GetDpiForWindow" intptr

; uint GetDpiFromDpiAwarenessContext(winmdroot.UI.HiDpi.DPI_AWARENESS_CONTEXT value)
#cfunc global GetDpiFromDpiAwarenessContext "GetDpiFromDpiAwarenessContext" intptr

; winmdroot.Foundation.HWND GetFocus()
#cfunc global GetFocus "GetFocus"

; winmdroot.Foundation.HWND GetForegroundWindow()
#cfunc global GetForegroundWindow "GetForegroundWindow"

; winmdroot.Foundation.BOOL GetGUIThreadInfo(uint idThread, winmdroot.UI.WindowsAndMessaging.GUITHREADINFO* pgui)
#cfunc global GetGUIThreadInfo "GetGUIThreadInfo" int, var

; winmdroot.Foundation.BOOL GetGestureConfig(winmdroot.Foundation.HWND hwnd, uint dwReserved, uint dwFlags, uint* pcIDs, winmdroot.UI.Input.Touch.GESTURECONFIG* pGestureConfig, uint cbSize)
#cfunc global GetGestureConfig "GetGestureConfig" intptr, int, int, var, var, int

; winmdroot.Foundation.BOOL GetGestureExtraArgs(winmdroot.UI.Input.Touch.HGESTUREINFO hGestureInfo, uint cbExtraArgs, byte* pExtraArgs)
#cfunc global GetGestureExtraArgs "GetGestureExtraArgs" intptr, int, var

; winmdroot.Foundation.BOOL GetGestureInfo(winmdroot.UI.Input.Touch.HGESTUREINFO hGestureInfo, winmdroot.UI.Input.Touch.GESTUREINFO* pGestureInfo)
#cfunc global GetGestureInfo "GetGestureInfo" intptr, var

; uint GetGuiResources(winmdroot.Foundation.HANDLE hProcess, winmdroot.System.Threading.GET_GUI_RESOURCES_FLAGS uiFlags)
#cfunc global GetGuiResources "GetGuiResources" intptr, int

; winmdroot.Foundation.BOOL GetIconInfo(winmdroot.UI.WindowsAndMessaging.HICON hIcon, winmdroot.UI.WindowsAndMessaging.ICONINFO* piconinfo)
#cfunc global GetIconInfo "GetIconInfo" intptr, var

; winmdroot.Foundation.BOOL GetIconInfoExW(winmdroot.UI.WindowsAndMessaging.HICON hicon, winmdroot.UI.WindowsAndMessaging.ICONINFOEXW* piconinfo)
#cfunc global GetIconInfoExW "GetIconInfoExW" intptr, var

; winmdroot.Foundation.BOOL GetInputState()
#cfunc global GetInputState "GetInputState"

; uint GetKBCodePage()
#cfunc global GetKBCodePage "GetKBCodePage"

; int GetKeyNameText(int lParam, winmdroot.Foundation.PWSTR lpString, int cchSize)
#cfunc global GetKeyNameTextW "GetKeyNameTextW" int, wstr, int

; short GetKeyState(int nVirtKey)
#cfunc global GetKeyState "GetKeyState" int

; winmdroot.UI.Input.KeyboardAndMouse.HKL GetKeyboardLayout(uint idThread)
#cfunc global GetKeyboardLayout "GetKeyboardLayout" int

; int GetKeyboardLayoutList(int nBuff, [Optional] winmdroot.UI.Input.KeyboardAndMouse.HKL* lpList)
#cfunc global GetKeyboardLayoutList "GetKeyboardLayoutList" int, intptr

; winmdroot.Foundation.BOOL GetKeyboardLayoutName(winmdroot.Foundation.PWSTR pwszKLID)
#cfunc global GetKeyboardLayoutNameW "GetKeyboardLayoutNameW" wstr

; winmdroot.Foundation.BOOL GetKeyboardState(byte* lpKeyState)
#cfunc global GetKeyboardState "GetKeyboardState" var

; int GetKeyboardType(int nTypeFlag)
#cfunc global GetKeyboardType "GetKeyboardType" int

; winmdroot.Foundation.HWND GetLastActivePopup(winmdroot.Foundation.HWND hWnd)
#cfunc global GetLastActivePopup "GetLastActivePopup" intptr

; winmdroot.Foundation.BOOL GetLastInputInfo(winmdroot.UI.Input.KeyboardAndMouse.LASTINPUTINFO* plii)
#cfunc global GetLastInputInfo "GetLastInputInfo" var

; winmdroot.Foundation.BOOL GetLayeredWindowAttributes(winmdroot.Foundation.HWND hwnd, [Optional] winmdroot.Foundation.COLORREF* pcrKey, [Optional] byte* pbAlpha, [Optional] winmdroot.UI.WindowsAndMessaging.LAYERED_WINDOW_ATTRIBUTES_FLAGS* pdwFlags)
#cfunc global GetLayeredWindowAttributes "GetLayeredWindowAttributes" intptr, var, var, var

; uint GetListBoxInfo(winmdroot.Foundation.HWND hwnd)
#cfunc global GetListBoxInfo "GetListBoxInfo" intptr

; winmdroot.UI.WindowsAndMessaging.HMENU GetMenu(winmdroot.Foundation.HWND hWnd)
#cfunc global GetMenu "GetMenu" intptr

; winmdroot.Foundation.BOOL GetMenuBarInfo(winmdroot.Foundation.HWND hwnd, winmdroot.UI.WindowsAndMessaging.OBJECT_IDENTIFIER idObject, int idItem, winmdroot.UI.WindowsAndMessaging.MENUBARINFO* pmbi)
#cfunc global GetMenuBarInfo "GetMenuBarInfo" intptr, int, int, var

; int GetMenuCheckMarkDimensions()
#cfunc global GetMenuCheckMarkDimensions "GetMenuCheckMarkDimensions"

; uint GetMenuContextHelpId(winmdroot.UI.WindowsAndMessaging.HMENU param0)
#cfunc global GetMenuContextHelpId "GetMenuContextHelpId" intptr

; uint GetMenuDefaultItem(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, uint fByPos, winmdroot.UI.WindowsAndMessaging.GET_MENU_DEFAULT_ITEM_FLAGS gmdiFlags)
#cfunc global GetMenuDefaultItem "GetMenuDefaultItem" intptr, int, int

; winmdroot.Foundation.BOOL GetMenuInfo(winmdroot.UI.WindowsAndMessaging.HMENU param0, winmdroot.UI.WindowsAndMessaging.MENUINFO* param1)
#cfunc global GetMenuInfo "GetMenuInfo" intptr, var

; int GetMenuItemCount(winmdroot.UI.WindowsAndMessaging.HMENU hMenu)
#cfunc global GetMenuItemCount "GetMenuItemCount" intptr

; uint GetMenuItemID(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, int nPos)
#cfunc global GetMenuItemID "GetMenuItemID" intptr, int

; winmdroot.Foundation.BOOL GetMenuItemInfo(winmdroot.UI.WindowsAndMessaging.HMENU hmenu, uint item, winmdroot.Foundation.BOOL fByPosition, winmdroot.UI.WindowsAndMessaging.MENUITEMINFOW* lpmii)
#cfunc global GetMenuItemInfoW "GetMenuItemInfoW" intptr, int, int, var

; winmdroot.Foundation.BOOL GetMenuItemRect(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.HMENU hMenu, uint uItem, winmdroot.Foundation.RECT* lprcItem)
#cfunc global GetMenuItemRect "GetMenuItemRect" intptr, intptr, int, var

; uint GetMenuState(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, uint uId, winmdroot.UI.WindowsAndMessaging.MENU_ITEM_FLAGS uFlags)
#cfunc global GetMenuState "GetMenuState" intptr, int, int

; int GetMenuStringW(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, uint uIDItem, winmdroot.Foundation.PWSTR lpString, int cchMax, winmdroot.UI.WindowsAndMessaging.MENU_ITEM_FLAGS flags)
#cfunc global GetMenuStringW "GetMenuStringW" intptr, int, wstr, int, int

; winmdroot.Foundation.BOOL GetMessage(winmdroot.UI.WindowsAndMessaging.MSG* lpMsg, winmdroot.Foundation.HWND hWnd, uint wMsgFilterMin, uint wMsgFilterMax)
#cfunc global GetMessageW "GetMessageW" var, intptr, int, int

; winmdroot.Foundation.LPARAM GetMessageExtraInfo()
#cfunc global GetMessageExtraInfo "GetMessageExtraInfo"

; uint GetMessagePos()
#cfunc global GetMessagePos "GetMessagePos"

; int GetMessageTime()
#cfunc global GetMessageTime "GetMessageTime"

; winmdroot.Foundation.BOOL GetMonitorInfoW(winmdroot.Graphics.Gdi.HMONITOR hMonitor, winmdroot.Graphics.Gdi.MONITORINFO* lpmi)
#cfunc global GetMonitorInfoW "GetMonitorInfoW" intptr, var

; int GetMouseMovePointsEx(uint cbSize, winmdroot.UI.Input.KeyboardAndMouse.MOUSEMOVEPOINT* lppt, winmdroot.UI.Input.KeyboardAndMouse.MOUSEMOVEPOINT* lpptBuf, int nBufPoints, winmdroot.UI.Input.KeyboardAndMouse.GET_MOUSE_MOVE_POINTS_EX_RESOLUTION resolution)
#cfunc global GetMouseMovePointsEx "GetMouseMovePointsEx" int, var, var, int, int

; winmdroot.Foundation.HWND GetNextDlgGroupItem(winmdroot.Foundation.HWND hDlg, winmdroot.Foundation.HWND hCtl, winmdroot.Foundation.BOOL bPrevious)
#cfunc global GetNextDlgGroupItem "GetNextDlgGroupItem" intptr, intptr, int

; winmdroot.Foundation.HWND GetNextDlgTabItem(winmdroot.Foundation.HWND hDlg, winmdroot.Foundation.HWND hCtl, winmdroot.Foundation.BOOL bPrevious)
#cfunc global GetNextDlgTabItem "GetNextDlgTabItem" intptr, intptr, int

; winmdroot.Foundation.HWND GetOpenClipboardWindow()
#cfunc global GetOpenClipboardWindow "GetOpenClipboardWindow"

; winmdroot.Foundation.HWND GetParent(winmdroot.Foundation.HWND hWnd)
#cfunc global GetParent "GetParent" intptr

; winmdroot.Foundation.BOOL GetPhysicalCursorPos(global::System.Drawing.Point* lpPoint)
#cfunc global GetPhysicalCursorPos "GetPhysicalCursorPos" var

; winmdroot.Foundation.BOOL GetPointerCursorId(uint pointerId, uint* cursorId)
#cfunc global GetPointerCursorId "GetPointerCursorId" int, var

; winmdroot.Foundation.BOOL GetPointerDevice(winmdroot.Foundation.HANDLE device, winmdroot.UI.Controls.POINTER_DEVICE_INFO* pointerDevice)
#cfunc global GetPointerDevice "GetPointerDevice" intptr, var

; winmdroot.Foundation.BOOL GetPointerDeviceCursors(winmdroot.Foundation.HANDLE device, uint* cursorCount, [Optional] winmdroot.UI.Controls.POINTER_DEVICE_CURSOR_INFO* deviceCursors)
#cfunc global GetPointerDeviceCursors "GetPointerDeviceCursors" intptr, var, var

; winmdroot.Foundation.BOOL GetPointerDeviceProperties(winmdroot.Foundation.HANDLE device, uint* propertyCount, [Optional] winmdroot.UI.Controls.POINTER_DEVICE_PROPERTY* pointerProperties)
#cfunc global GetPointerDeviceProperties "GetPointerDeviceProperties" intptr, var, var

; winmdroot.Foundation.BOOL GetPointerDeviceRects(winmdroot.Foundation.HANDLE device, winmdroot.Foundation.RECT* pointerDeviceRect, winmdroot.Foundation.RECT* displayRect)
#cfunc global GetPointerDeviceRects "GetPointerDeviceRects" intptr, var, var

; winmdroot.Foundation.BOOL GetPointerDevices(uint* deviceCount, [Optional] winmdroot.UI.Controls.POINTER_DEVICE_INFO* pointerDevices)
#cfunc global GetPointerDevices "GetPointerDevices" var, var

; winmdroot.Foundation.BOOL GetPointerFrameInfo(uint pointerId, uint* pointerCount, [Optional] winmdroot.UI.Input.Pointer.POINTER_INFO* pointerInfo)
#cfunc global GetPointerFrameInfo "GetPointerFrameInfo" int, var, var

; winmdroot.Foundation.BOOL GetPointerFrameInfoHistory(uint pointerId, uint* entriesCount, uint* pointerCount, [Optional] winmdroot.UI.Input.Pointer.POINTER_INFO* pointerInfo)
#cfunc global GetPointerFrameInfoHistory "GetPointerFrameInfoHistory" int, var, var, var

; winmdroot.Foundation.BOOL GetPointerFramePenInfo(uint pointerId, uint* pointerCount, [Optional] winmdroot.UI.Input.Pointer.POINTER_PEN_INFO* penInfo)
#cfunc global GetPointerFramePenInfo "GetPointerFramePenInfo" int, var, var

; winmdroot.Foundation.BOOL GetPointerFramePenInfoHistory(uint pointerId, uint* entriesCount, uint* pointerCount, [Optional] winmdroot.UI.Input.Pointer.POINTER_PEN_INFO* penInfo)
#cfunc global GetPointerFramePenInfoHistory "GetPointerFramePenInfoHistory" int, var, var, var

; winmdroot.Foundation.BOOL GetPointerFrameTouchInfo(uint pointerId, uint* pointerCount, [Optional] winmdroot.UI.Input.Pointer.POINTER_TOUCH_INFO* touchInfo)
#cfunc global GetPointerFrameTouchInfo "GetPointerFrameTouchInfo" int, var, var

; winmdroot.Foundation.BOOL GetPointerFrameTouchInfoHistory(uint pointerId, uint* entriesCount, uint* pointerCount, [Optional] winmdroot.UI.Input.Pointer.POINTER_TOUCH_INFO* touchInfo)
#cfunc global GetPointerFrameTouchInfoHistory "GetPointerFrameTouchInfoHistory" int, var, var, var

; winmdroot.Foundation.BOOL GetPointerInfo(uint pointerId, winmdroot.UI.Input.Pointer.POINTER_INFO* pointerInfo)
#cfunc global GetPointerInfo "GetPointerInfo" int, var

; winmdroot.Foundation.BOOL GetPointerInfoHistory(uint pointerId, uint* entriesCount, [Optional] winmdroot.UI.Input.Pointer.POINTER_INFO* pointerInfo)
#cfunc global GetPointerInfoHistory "GetPointerInfoHistory" int, var, var

; winmdroot.Foundation.BOOL GetPointerInputTransform(uint pointerId, uint historyCount, winmdroot.UI.Input.Pointer.INPUT_TRANSFORM* inputTransform)
#cfunc global GetPointerInputTransform "GetPointerInputTransform" int, int, var

; winmdroot.Foundation.BOOL GetPointerPenInfo(uint pointerId, winmdroot.UI.Input.Pointer.POINTER_PEN_INFO* penInfo)
#cfunc global GetPointerPenInfo "GetPointerPenInfo" int, var

; winmdroot.Foundation.BOOL GetPointerPenInfoHistory(uint pointerId, uint* entriesCount, [Optional] winmdroot.UI.Input.Pointer.POINTER_PEN_INFO* penInfo)
#cfunc global GetPointerPenInfoHistory "GetPointerPenInfoHistory" int, var, var

; winmdroot.Foundation.BOOL GetPointerTouchInfo(uint pointerId, winmdroot.UI.Input.Pointer.POINTER_TOUCH_INFO* touchInfo)
#cfunc global GetPointerTouchInfo "GetPointerTouchInfo" int, var

; winmdroot.Foundation.BOOL GetPointerTouchInfoHistory(uint pointerId, uint* entriesCount, [Optional] winmdroot.UI.Input.Pointer.POINTER_TOUCH_INFO* touchInfo)
#cfunc global GetPointerTouchInfoHistory "GetPointerTouchInfoHistory" int, var, var

; winmdroot.Foundation.BOOL GetPointerType(uint pointerId, winmdroot.UI.WindowsAndMessaging.POINTER_INPUT_TYPE* pointerType)
#cfunc global GetPointerType "GetPointerType" int, var

; int GetPriorityClipboardFormat(uint* paFormatPriorityList, int cFormats)
#cfunc global GetPriorityClipboardFormat "GetPriorityClipboardFormat" var, int

; winmdroot.Foundation.BOOL GetProcessDefaultLayout(uint* pdwDefaultLayout)
#cfunc global GetProcessDefaultLayout "GetProcessDefaultLayout" var

; winmdroot.System.StationsAndDesktops.HWINSTA GetProcessWindowStation()
#cfunc global GetProcessWindowStation "GetProcessWindowStation"

; winmdroot.Foundation.HANDLE GetPropW(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.PCWSTR lpString)
#cfunc global GetPropW "GetPropW" intptr, wstr

; uint GetQueueStatus(winmdroot.UI.WindowsAndMessaging.QUEUE_STATUS_FLAGS flags)
#cfunc global GetQueueStatus "GetQueueStatus" int

; uint GetRawInputBuffer([Optional] winmdroot.UI.Input.RAWINPUT* pData, uint* pcbSize, uint cbSizeHeader)
#cfunc global GetRawInputBuffer "GetRawInputBuffer" var, var, int

; uint GetRawInputData(winmdroot.UI.Input.HRAWINPUT hRawInput, winmdroot.UI.Input.RAW_INPUT_DATA_COMMAND_FLAGS uiCommand, [Optional] void* pData, uint* pcbSize, uint cbSizeHeader)
#cfunc global GetRawInputData "GetRawInputData" intptr, int, intptr, var, int

; uint GetRawInputDeviceInfo(winmdroot.Foundation.HANDLE hDevice, winmdroot.UI.Input.RAW_INPUT_DEVICE_INFO_COMMAND uiCommand, [Optional] void* pData, uint* pcbSize)
#cfunc global GetRawInputDeviceInfoW "GetRawInputDeviceInfoW" intptr, int, intptr, var

; uint GetRawInputDeviceList([Optional] winmdroot.UI.Input.RAWINPUTDEVICELIST* pRawInputDeviceList, uint* puiNumDevices, uint cbSize)
#cfunc global GetRawInputDeviceList "GetRawInputDeviceList" var, var, int

; winmdroot.Foundation.BOOL GetRawPointerDeviceData(uint pointerId, uint historyCount, uint propertiesCount, winmdroot.UI.Controls.POINTER_DEVICE_PROPERTY* pProperties, int* pValues)
#cfunc global GetRawPointerDeviceData "GetRawPointerDeviceData" int, int, int, var, var

; uint GetRegisteredRawInputDevices([Optional] winmdroot.UI.Input.RAWINPUTDEVICE* pRawInputDevices, uint* puiNumDevices, uint cbSize)
#cfunc global GetRegisteredRawInputDevices "GetRegisteredRawInputDevices" var, var, int

; winmdroot.Foundation.BOOL GetScrollBarInfo(winmdroot.Foundation.HWND hwnd, winmdroot.UI.WindowsAndMessaging.OBJECT_IDENTIFIER idObject, winmdroot.UI.WindowsAndMessaging.SCROLLBARINFO* psbi)
#cfunc global GetScrollBarInfo "GetScrollBarInfo" intptr, int, var

; winmdroot.Foundation.BOOL GetScrollInfo(winmdroot.Foundation.HWND hwnd, winmdroot.UI.WindowsAndMessaging.SCROLLBAR_CONSTANTS nBar, winmdroot.UI.WindowsAndMessaging.SCROLLINFO* lpsi)
#cfunc global GetScrollInfo "GetScrollInfo" intptr, int, var

; int GetScrollPos(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.SCROLLBAR_CONSTANTS nBar)
#cfunc global GetScrollPos "GetScrollPos" intptr, int

; winmdroot.Foundation.BOOL GetScrollRange(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.SCROLLBAR_CONSTANTS nBar, int* lpMinPos, int* lpMaxPos)
#cfunc global GetScrollRange "GetScrollRange" intptr, int, var, var

; winmdroot.Foundation.HWND GetShellWindow()
#cfunc global GetShellWindow "GetShellWindow"

; winmdroot.UI.WindowsAndMessaging.HMENU GetSubMenu(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, int nPos)
#cfunc global GetSubMenu "GetSubMenu" intptr, int

; uint GetSysColor(winmdroot.Graphics.Gdi.SYS_COLOR_INDEX nIndex)
#cfunc global GetSysColor "GetSysColor" int

; winmdroot.Graphics.Gdi.HBRUSH GetSysColorBrush(winmdroot.Graphics.Gdi.SYS_COLOR_INDEX nIndex)
#cfunc global GetSysColorBrush "GetSysColorBrush" int

; uint GetSystemDpiForProcess(winmdroot.Foundation.HANDLE hProcess)
#cfunc global GetSystemDpiForProcess "GetSystemDpiForProcess" intptr

; winmdroot.UI.WindowsAndMessaging.HMENU GetSystemMenu(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.BOOL bRevert)
#cfunc global GetSystemMenu "GetSystemMenu" intptr, int

; int GetSystemMetrics(winmdroot.UI.WindowsAndMessaging.SYSTEM_METRICS_INDEX nIndex)
#cfunc global GetSystemMetrics "GetSystemMetrics" int

; int GetSystemMetricsForDpi(winmdroot.UI.WindowsAndMessaging.SYSTEM_METRICS_INDEX nIndex, uint dpi)
#cfunc global GetSystemMetricsForDpi "GetSystemMetricsForDpi" int, int

; uint GetTabbedTextExtentW(winmdroot.Graphics.Gdi.HDC hdc, winmdroot.Foundation.PCWSTR lpString, int chCount, int nTabPositions, [Optional] int* lpnTabStopPositions)
#cfunc global GetTabbedTextExtentW "GetTabbedTextExtentW" intptr, wstr, int, int, var

; winmdroot.System.StationsAndDesktops.HDESK GetThreadDesktop(uint dwThreadId)
#cfunc global GetThreadDesktop "GetThreadDesktop" int

; winmdroot.UI.HiDpi.DPI_AWARENESS_CONTEXT GetThreadDpiAwarenessContext()
#cfunc global GetThreadDpiAwarenessContext "GetThreadDpiAwarenessContext"

; winmdroot.UI.HiDpi.DPI_HOSTING_BEHAVIOR GetThreadDpiHostingBehavior()
#cfunc global GetThreadDpiHostingBehavior "GetThreadDpiHostingBehavior"

; winmdroot.Foundation.BOOL GetTitleBarInfo(winmdroot.Foundation.HWND hwnd, winmdroot.UI.WindowsAndMessaging.TITLEBARINFO* pti)
#cfunc global GetTitleBarInfo "GetTitleBarInfo" intptr, var

; winmdroot.Foundation.HWND GetTopWindow(winmdroot.Foundation.HWND hWnd)
#cfunc global GetTopWindow "GetTopWindow" intptr

; winmdroot.Foundation.BOOL GetTouchInputInfo(winmdroot.UI.Input.Touch.HTOUCHINPUT hTouchInput, uint cInputs, winmdroot.UI.Input.Touch.TOUCHINPUT* pInputs, int cbSize)
#cfunc global GetTouchInputInfo "GetTouchInputInfo" intptr, int, var, int

; uint GetUnpredictedMessagePos()
#cfunc global GetUnpredictedMessagePos "GetUnpredictedMessagePos"

; winmdroot.Foundation.BOOL GetUpdateRect(winmdroot.Foundation.HWND hWnd, [Optional] winmdroot.Foundation.RECT* lpRect, winmdroot.Foundation.BOOL bErase)
#cfunc global GetUpdateRect "GetUpdateRect" intptr, var, int

; winmdroot.Graphics.Gdi.GDI_REGION_TYPE GetUpdateRgn(winmdroot.Foundation.HWND hWnd, winmdroot.Graphics.Gdi.HRGN hRgn, winmdroot.Foundation.BOOL bErase)
#cfunc global GetUpdateRgn "GetUpdateRgn" intptr, intptr, int

; winmdroot.Foundation.BOOL GetUpdatedClipboardFormats(uint* lpuiFormats, uint cFormats, uint* pcFormatsOut)
#cfunc global GetUpdatedClipboardFormats "GetUpdatedClipboardFormats" var, int, var

; winmdroot.Foundation.BOOL GetUserObjectInformation(winmdroot.Foundation.HANDLE hObj, winmdroot.System.StationsAndDesktops.USER_OBJECT_INFORMATION_INDEX nIndex, [Optional] void* pvInfo, uint nLength, [Optional] uint* lpnLengthNeeded)
#cfunc global GetUserObjectInformationW "GetUserObjectInformationW" intptr, int, intptr, int, var

; winmdroot.Foundation.BOOL GetUserObjectSecurity(winmdroot.Foundation.HANDLE hObj, uint* pSIRequested, winmdroot.Security.PSECURITY_DESCRIPTOR pSID, uint nLength, uint* lpnLengthNeeded)
#cfunc global GetUserObjectSecurity "GetUserObjectSecurity" intptr, var, int, int, var

; winmdroot.Foundation.HWND GetWindow(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.GET_WINDOW_CMD uCmd)
#cfunc global GetWindow "GetWindow" intptr, int

; uint GetWindowContextHelpId(winmdroot.Foundation.HWND param0)
#cfunc global GetWindowContextHelpId "GetWindowContextHelpId" intptr

; winmdroot.Graphics.Gdi.HDC GetWindowDC(winmdroot.Foundation.HWND hWnd)
#cfunc global GetWindowDC "GetWindowDC" intptr

; winmdroot.Foundation.BOOL GetWindowDisplayAffinity(winmdroot.Foundation.HWND hWnd, uint* pdwAffinity)
#cfunc global GetWindowDisplayAffinity "GetWindowDisplayAffinity" intptr, var

; winmdroot.UI.HiDpi.DPI_AWARENESS_CONTEXT GetWindowDpiAwarenessContext(winmdroot.Foundation.HWND hwnd)
#cfunc global GetWindowDpiAwarenessContext "GetWindowDpiAwarenessContext" intptr

; winmdroot.UI.HiDpi.DPI_HOSTING_BEHAVIOR GetWindowDpiHostingBehavior(winmdroot.Foundation.HWND hwnd)
#cfunc global GetWindowDpiHostingBehavior "GetWindowDpiHostingBehavior" intptr

; winmdroot.Foundation.BOOL GetWindowFeedbackSetting(winmdroot.Foundation.HWND hwnd, winmdroot.UI.Controls.FEEDBACK_TYPE feedback, uint dwFlags, uint* pSize, [Optional] void* config)
#cfunc global GetWindowFeedbackSetting "GetWindowFeedbackSetting" intptr, int, int, var, intptr

; winmdroot.Foundation.BOOL GetWindowInfo(winmdroot.Foundation.HWND hwnd, winmdroot.UI.WindowsAndMessaging.WINDOWINFO* pwi)
#cfunc global GetWindowInfo "GetWindowInfo" intptr, var

; int GetWindowLong(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.WINDOW_LONG_PTR_INDEX nIndex)
#cfunc global GetWindowLongW "GetWindowLongW" intptr, int

; uint GetWindowModuleFileNameW(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.PWSTR pszFileName, uint cchFileNameMax)
#cfunc global GetWindowModuleFileNameW "GetWindowModuleFileNameW" intptr, wstr, int

; winmdroot.Foundation.BOOL GetWindowPlacement(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.WINDOWPLACEMENT* lpwndpl)
#cfunc global GetWindowPlacement "GetWindowPlacement" intptr, var

; winmdroot.Foundation.BOOL GetWindowRect(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.RECT* lpRect)
#cfunc global GetWindowRect "GetWindowRect" intptr, var

; winmdroot.Graphics.Gdi.GDI_REGION_TYPE GetWindowRgn(winmdroot.Foundation.HWND hWnd, winmdroot.Graphics.Gdi.HRGN hRgn)
#cfunc global GetWindowRgn "GetWindowRgn" intptr, intptr

; winmdroot.Graphics.Gdi.GDI_REGION_TYPE GetWindowRgnBox(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.RECT* lprc)
#cfunc global GetWindowRgnBox "GetWindowRgnBox" intptr, var

; int GetWindowText(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.PWSTR lpString, int nMaxCount)
#cfunc global GetWindowTextW "GetWindowTextW" intptr, wstr, int

; int GetWindowTextLength(winmdroot.Foundation.HWND hWnd)
#cfunc global GetWindowTextLengthW "GetWindowTextLengthW" intptr

; uint GetWindowThreadProcessId(winmdroot.Foundation.HWND hWnd, [Optional] uint* lpdwProcessId)
#cfunc global GetWindowThreadProcessId "GetWindowThreadProcessId" intptr, var

; ushort GetWindowWord(winmdroot.Foundation.HWND hWnd, int nIndex)
#cfunc global GetWindowWord "GetWindowWord" intptr, int

; winmdroot.Foundation.BOOL GrayStringW(winmdroot.Graphics.Gdi.HDC hDC, winmdroot.Graphics.Gdi.HBRUSH hBrush, delegate *unmanaged[Stdcall]<global::Windows.Win32.Graphics.Gdi.HDC,global::Windows.Win32.Foundation.LPARAM,int,global::Windows.Win32.Foundation.BOOL> lpOutputFunc, winmdroot.Foundation.LPARAM lpData, int nCount, int X, int Y, int nWidth, int nHeight)
#cfunc global GrayStringW "GrayStringW" intptr, intptr, int, intptr, int, int, int, int, int

; winmdroot.Foundation.BOOL HideCaret(winmdroot.Foundation.HWND hWnd)
#cfunc global HideCaret "HideCaret" intptr

; winmdroot.Foundation.BOOL HiliteMenuItem(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.HMENU hMenu, uint uIDHiliteItem, uint uHilite)
#cfunc global HiliteMenuItem "HiliteMenuItem" intptr, intptr, int, int

; winmdroot.Foundation.BOOL IMPGetIMEA(winmdroot.Foundation.HWND param0, winmdroot.System.WindowsProgramming.IMEPROA* param1)
#cfunc global IMPGetIMEA "IMPGetIMEA" intptr, var

; winmdroot.Foundation.BOOL IMPGetIMEW(winmdroot.Foundation.HWND param0, winmdroot.System.WindowsProgramming.IMEPROW* param1)
#cfunc global IMPGetIMEW "IMPGetIMEW" intptr, var

; winmdroot.Foundation.BOOL IMPQueryIMEA(winmdroot.System.WindowsProgramming.IMEPROA* param0)
#cfunc global IMPQueryIMEA "IMPQueryIMEA" var

; winmdroot.Foundation.BOOL IMPQueryIMEW(winmdroot.System.WindowsProgramming.IMEPROW* param0)
#cfunc global IMPQueryIMEW "IMPQueryIMEW" var

; winmdroot.Foundation.BOOL IMPSetIMEA(winmdroot.Foundation.HWND param0, winmdroot.System.WindowsProgramming.IMEPROA* param1)
#cfunc global IMPSetIMEA "IMPSetIMEA" intptr, var

; winmdroot.Foundation.BOOL IMPSetIMEW(winmdroot.Foundation.HWND param0, winmdroot.System.WindowsProgramming.IMEPROW* param1)
#cfunc global IMPSetIMEW "IMPSetIMEW" intptr, var

; winmdroot.Foundation.BOOL ImpersonateDdeClientWindow(winmdroot.Foundation.HWND hWndClient, winmdroot.Foundation.HWND hWndServer)
#cfunc global ImpersonateDdeClientWindow "ImpersonateDdeClientWindow" intptr, intptr

; winmdroot.Foundation.BOOL InSendMessage()
#cfunc global InSendMessage "InSendMessage"

; uint InSendMessageEx([Optional] void* lpReserved)
#cfunc global InSendMessageEx "InSendMessageEx" intptr

; winmdroot.Foundation.BOOL InflateRect(winmdroot.Foundation.RECT* lprc, int dx, int dy)
#cfunc global InflateRect "InflateRect" var, int, int

; winmdroot.Foundation.BOOL InheritWindowMonitor(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.HWND hwndInherit)
#cfunc global InheritWindowMonitor "InheritWindowMonitor" intptr, intptr

; winmdroot.Foundation.BOOL InitializeTouchInjection(uint maxCount, winmdroot.UI.Input.Pointer.TOUCH_FEEDBACK_MODE dwMode)
#cfunc global InitializeTouchInjection "InitializeTouchInjection" int, int

; winmdroot.Foundation.BOOL InjectSyntheticPointerInput(winmdroot.UI.Controls.HSYNTHETICPOINTERDEVICE device, winmdroot.UI.Controls.POINTER_TYPE_INFO* pointerInfo, uint count)
#cfunc global InjectSyntheticPointerInput "InjectSyntheticPointerInput" intptr, var, int

; winmdroot.Foundation.BOOL InjectTouchInput(uint count, winmdroot.UI.Input.Pointer.POINTER_TOUCH_INFO* contacts)
#cfunc global InjectTouchInput "InjectTouchInput" int, var

; winmdroot.Foundation.BOOL InsertMenu(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, uint uPosition, winmdroot.UI.WindowsAndMessaging.MENU_ITEM_FLAGS uFlags, nuint uIDNewItem, winmdroot.Foundation.PCWSTR lpNewItem)
#cfunc global InsertMenuW "InsertMenuW" intptr, int, int, int, wstr

; winmdroot.Foundation.BOOL InsertMenuItem(winmdroot.UI.WindowsAndMessaging.HMENU hmenu, uint item, winmdroot.Foundation.BOOL fByPosition, winmdroot.UI.WindowsAndMessaging.MENUITEMINFOW* lpmi)
#cfunc global InsertMenuItemW "InsertMenuItemW" intptr, int, int, var

; int InternalGetWindowText(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.PWSTR pString, int cchMaxCount)
#cfunc global InternalGetWindowText "InternalGetWindowText" intptr, wstr, int

; winmdroot.Foundation.BOOL IntersectRect(winmdroot.Foundation.RECT* lprcDst, winmdroot.Foundation.RECT* lprcSrc1, winmdroot.Foundation.RECT* lprcSrc2)
#cfunc global IntersectRect "IntersectRect" var, var, var

; winmdroot.Foundation.BOOL InvalidateRect(winmdroot.Foundation.HWND hWnd, [Optional] winmdroot.Foundation.RECT* lpRect, winmdroot.Foundation.BOOL bErase)
#cfunc global InvalidateRect "InvalidateRect" intptr, var, int

; winmdroot.Foundation.BOOL InvalidateRgn(winmdroot.Foundation.HWND hWnd, winmdroot.Graphics.Gdi.HRGN hRgn, winmdroot.Foundation.BOOL bErase)
#cfunc global InvalidateRgn "InvalidateRgn" intptr, intptr, int

; winmdroot.Foundation.BOOL InvertRect(winmdroot.Graphics.Gdi.HDC hDC, winmdroot.Foundation.RECT* lprc)
#cfunc global InvertRect "InvertRect" intptr, var

; winmdroot.Foundation.BOOL IsCharAlpha(char ch)
#cfunc global IsCharAlphaW "IsCharAlphaW" int

; winmdroot.Foundation.BOOL IsCharAlphaNumeric(char ch)
#cfunc global IsCharAlphaNumericW "IsCharAlphaNumericW" int

; winmdroot.Foundation.BOOL IsCharLower(char ch)
#cfunc global IsCharLowerW "IsCharLowerW" int

; winmdroot.Foundation.BOOL IsCharUpper(char ch)
#cfunc global IsCharUpperW "IsCharUpperW" int

; winmdroot.Foundation.BOOL IsChild(winmdroot.Foundation.HWND hWndParent, winmdroot.Foundation.HWND hWnd)
#cfunc global IsChild "IsChild" intptr, intptr

; winmdroot.Foundation.BOOL IsClipboardFormatAvailable(uint format)
#cfunc global IsClipboardFormatAvailable "IsClipboardFormatAvailable" int

; winmdroot.Foundation.BOOL IsDialogMessageW(winmdroot.Foundation.HWND hDlg, winmdroot.UI.WindowsAndMessaging.MSG* lpMsg)
#cfunc global IsDialogMessageW "IsDialogMessageW" intptr, var

; uint IsDlgButtonChecked(winmdroot.Foundation.HWND hDlg, int nIDButton)
#cfunc global IsDlgButtonChecked "IsDlgButtonChecked" intptr, int

; winmdroot.Foundation.BOOL IsGUIThread(winmdroot.Foundation.BOOL bConvert)
#cfunc global IsGUIThread "IsGUIThread" int

; winmdroot.Foundation.BOOL IsHungAppWindow(winmdroot.Foundation.HWND hwnd)
#cfunc global IsHungAppWindow "IsHungAppWindow" intptr

; winmdroot.Foundation.BOOL IsIconic(winmdroot.Foundation.HWND hWnd)
#cfunc global IsIconic "IsIconic" intptr

; winmdroot.Foundation.BOOL IsImmersiveProcess(winmdroot.Foundation.HANDLE hProcess)
#cfunc global IsImmersiveProcess "IsImmersiveProcess" intptr

; winmdroot.Foundation.BOOL IsMenu(winmdroot.UI.WindowsAndMessaging.HMENU hMenu)
#cfunc global IsMenu "IsMenu" intptr

; winmdroot.Foundation.BOOL IsMouseInPointerEnabled()
#cfunc global IsMouseInPointerEnabled "IsMouseInPointerEnabled"

; winmdroot.Foundation.BOOL IsProcessDPIAware()
#cfunc global IsProcessDPIAware "IsProcessDPIAware"

; winmdroot.Foundation.BOOL IsRectEmpty(winmdroot.Foundation.RECT* lprc)
#cfunc global IsRectEmpty "IsRectEmpty" var

; winmdroot.Foundation.BOOL IsTouchWindow(winmdroot.Foundation.HWND hwnd, [Optional] uint* pulFlags)
#cfunc global IsTouchWindow "IsTouchWindow" intptr, var

; winmdroot.Foundation.BOOL IsValidDpiAwarenessContext(winmdroot.UI.HiDpi.DPI_AWARENESS_CONTEXT value)
#cfunc global IsValidDpiAwarenessContext "IsValidDpiAwarenessContext" intptr

; winmdroot.Foundation.BOOL IsWinEventHookInstalled(uint @event)
#cfunc global IsWinEventHookInstalled "IsWinEventHookInstalled" int

; winmdroot.Foundation.BOOL IsWindow(winmdroot.Foundation.HWND hWnd)
#cfunc global IsWindow "IsWindow" intptr

; winmdroot.Foundation.BOOL IsWindowArranged(winmdroot.Foundation.HWND hwnd)
#cfunc global IsWindowArranged "IsWindowArranged" intptr

; winmdroot.Foundation.BOOL IsWindowEnabled(winmdroot.Foundation.HWND hWnd)
#cfunc global IsWindowEnabled "IsWindowEnabled" intptr

; winmdroot.Foundation.BOOL IsWindowUnicode(winmdroot.Foundation.HWND hWnd)
#cfunc global IsWindowUnicode "IsWindowUnicode" intptr

; winmdroot.Foundation.BOOL IsWindowVisible(winmdroot.Foundation.HWND hWnd)
#cfunc global IsWindowVisible "IsWindowVisible" intptr

; winmdroot.Foundation.BOOL IsWow64Message()
#cfunc global IsWow64Message "IsWow64Message"

; winmdroot.Foundation.BOOL IsZoomed(winmdroot.Foundation.HWND hWnd)
#cfunc global IsZoomed "IsZoomed" intptr

; winmdroot.Foundation.BOOL KillTimer(winmdroot.Foundation.HWND hWnd, nuint uIDEvent)
#cfunc global KillTimer "KillTimer" intptr, int

; winmdroot.UI.WindowsAndMessaging.HACCEL LoadAccelerators(winmdroot.Foundation.HINSTANCE hInstance, winmdroot.Foundation.PCWSTR lpTableName)
#cfunc global LoadAcceleratorsW "LoadAcceleratorsW" intptr, wstr

; winmdroot.Graphics.Gdi.HBITMAP LoadBitmapW(winmdroot.Foundation.HINSTANCE hInstance, winmdroot.Foundation.PCWSTR lpBitmapName)
#cfunc global LoadBitmapW "LoadBitmapW" intptr, wstr

; winmdroot.UI.WindowsAndMessaging.HCURSOR LoadCursor(winmdroot.Foundation.HINSTANCE hInstance, winmdroot.Foundation.PCWSTR lpCursorName)
#cfunc global LoadCursorW "LoadCursorW" intptr, wstr

; winmdroot.UI.WindowsAndMessaging.HCURSOR LoadCursorFromFile(winmdroot.Foundation.PCWSTR lpFileName)
#cfunc global LoadCursorFromFileW "LoadCursorFromFileW" wstr

; winmdroot.UI.WindowsAndMessaging.HICON LoadIcon(winmdroot.Foundation.HINSTANCE hInstance, winmdroot.Foundation.PCWSTR lpIconName)
#cfunc global LoadIconW "LoadIconW" intptr, wstr

; winmdroot.Foundation.HANDLE LoadImage(winmdroot.Foundation.HINSTANCE hInst, winmdroot.Foundation.PCWSTR name, winmdroot.UI.WindowsAndMessaging.GDI_IMAGE_TYPE type, int cx, int cy, winmdroot.UI.WindowsAndMessaging.IMAGE_FLAGS fuLoad)
#cfunc global LoadImageW "LoadImageW" intptr, wstr, int, int, int, int

; winmdroot.UI.Input.KeyboardAndMouse.HKL LoadKeyboardLayout(winmdroot.Foundation.PCWSTR pwszKLID, winmdroot.UI.Input.KeyboardAndMouse.ACTIVATE_KEYBOARD_LAYOUT_FLAGS Flags)
#cfunc global LoadKeyboardLayoutW "LoadKeyboardLayoutW" wstr, int

; winmdroot.UI.WindowsAndMessaging.HMENU LoadMenu(winmdroot.Foundation.HINSTANCE hInstance, winmdroot.Foundation.PCWSTR lpMenuName)
#cfunc global LoadMenuW "LoadMenuW" intptr, wstr

; winmdroot.UI.WindowsAndMessaging.HMENU LoadMenuIndirect(void* lpMenuTemplate)
#cfunc global LoadMenuIndirectW "LoadMenuIndirectW" intptr

; int LoadString(winmdroot.Foundation.HINSTANCE hInstance, uint uID, winmdroot.Foundation.PWSTR lpBuffer, int cchBufferMax)
#cfunc global LoadStringW "LoadStringW" intptr, int, wstr, int

; winmdroot.Foundation.BOOL LockSetForegroundWindow(winmdroot.UI.WindowsAndMessaging.FOREGROUND_WINDOW_LOCK_CODE uLockCode)
#cfunc global LockSetForegroundWindow "LockSetForegroundWindow" int

; winmdroot.Foundation.BOOL LockWindowUpdate(winmdroot.Foundation.HWND hWndLock)
#cfunc global LockWindowUpdate "LockWindowUpdate" intptr

; winmdroot.Foundation.BOOL LockWorkStation()
#cfunc global LockWorkStation "LockWorkStation"

; winmdroot.Foundation.BOOL LogicalToPhysicalPoint(winmdroot.Foundation.HWND hWnd, global::System.Drawing.Point* lpPoint)
#cfunc global LogicalToPhysicalPoint "LogicalToPhysicalPoint" intptr, var

; winmdroot.Foundation.BOOL LogicalToPhysicalPointForPerMonitorDPI(winmdroot.Foundation.HWND hWnd, global::System.Drawing.Point* lpPoint)
#cfunc global LogicalToPhysicalPointForPerMonitorDPI "LogicalToPhysicalPointForPerMonitorDPI" intptr, var

; int LookupIconIdFromDirectory(byte* presbits, winmdroot.Foundation.BOOL fIcon)
#cfunc global LookupIconIdFromDirectory "LookupIconIdFromDirectory" var, int

; int LookupIconIdFromDirectoryEx(byte* presbits, winmdroot.Foundation.BOOL fIcon, int cxDesired, int cyDesired, winmdroot.UI.WindowsAndMessaging.IMAGE_FLAGS Flags)
#cfunc global LookupIconIdFromDirectoryEx "LookupIconIdFromDirectoryEx" var, int, int, int, int

; winmdroot.Foundation.BOOL MapDialogRect(winmdroot.Foundation.HWND hDlg, winmdroot.Foundation.RECT* lpRect)
#cfunc global MapDialogRect "MapDialogRect" intptr, var

; uint MapVirtualKeyW(uint uCode, winmdroot.UI.Input.KeyboardAndMouse.MAP_VIRTUAL_KEY_TYPE uMapType)
#cfunc global MapVirtualKeyW "MapVirtualKeyW" int, int

; uint MapVirtualKeyExW(uint uCode, winmdroot.UI.Input.KeyboardAndMouse.MAP_VIRTUAL_KEY_TYPE uMapType, winmdroot.UI.Input.KeyboardAndMouse.HKL dwhkl)
#cfunc global MapVirtualKeyExW "MapVirtualKeyExW" int, int, intptr

; int MapWindowPoints(winmdroot.Foundation.HWND hWndFrom, winmdroot.Foundation.HWND hWndTo, global::System.Drawing.Point* lpPoints, uint cPoints)
#cfunc global MapWindowPoints "MapWindowPoints" intptr, intptr, var, int

; int MenuItemFromPoint(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.HMENU hMenu, global::System.Drawing.Point ptScreen)
#cfunc global MenuItemFromPoint "MenuItemFromPoint" intptr, intptr, int

; winmdroot.Foundation.BOOL MessageBeep(winmdroot.UI.WindowsAndMessaging.MESSAGEBOX_STYLE uType)
#cfunc global MessageBeep "MessageBeep" int

; winmdroot.UI.WindowsAndMessaging.MESSAGEBOX_RESULT MessageBox(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.PCWSTR lpText, winmdroot.Foundation.PCWSTR lpCaption, winmdroot.UI.WindowsAndMessaging.MESSAGEBOX_STYLE uType)
#cfunc global MessageBoxW "MessageBoxW" intptr, wstr, wstr, int

; winmdroot.UI.WindowsAndMessaging.MESSAGEBOX_RESULT MessageBoxEx(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.PCWSTR lpText, winmdroot.Foundation.PCWSTR lpCaption, winmdroot.UI.WindowsAndMessaging.MESSAGEBOX_STYLE uType, ushort wLanguageId)
#cfunc global MessageBoxExW "MessageBoxExW" intptr, wstr, wstr, int, int

; winmdroot.UI.WindowsAndMessaging.MESSAGEBOX_RESULT MessageBoxIndirectW(winmdroot.UI.WindowsAndMessaging.MSGBOXPARAMSW* lpmbp)
#cfunc global MessageBoxIndirectW "MessageBoxIndirectW" var

; winmdroot.Foundation.BOOL ModifyMenu(winmdroot.UI.WindowsAndMessaging.HMENU hMnu, uint uPosition, winmdroot.UI.WindowsAndMessaging.MENU_ITEM_FLAGS uFlags, nuint uIDNewItem, winmdroot.Foundation.PCWSTR lpNewItem)
#cfunc global ModifyMenuW "ModifyMenuW" intptr, int, int, int, wstr

; winmdroot.Graphics.Gdi.HMONITOR MonitorFromPoint(global::System.Drawing.Point pt, winmdroot.Graphics.Gdi.MONITOR_FROM_FLAGS dwFlags)
#cfunc global MonitorFromPoint "MonitorFromPoint" int, int

; winmdroot.Graphics.Gdi.HMONITOR MonitorFromRect(winmdroot.Foundation.RECT* lprc, winmdroot.Graphics.Gdi.MONITOR_FROM_FLAGS dwFlags)
#cfunc global MonitorFromRect "MonitorFromRect" var, int

; winmdroot.Graphics.Gdi.HMONITOR MonitorFromWindow(winmdroot.Foundation.HWND hwnd, winmdroot.Graphics.Gdi.MONITOR_FROM_FLAGS dwFlags)
#cfunc global MonitorFromWindow "MonitorFromWindow" intptr, int

; winmdroot.Foundation.BOOL MoveWindow(winmdroot.Foundation.HWND hWnd, int X, int Y, int nWidth, int nHeight, winmdroot.Foundation.BOOL bRepaint)
#cfunc global MoveWindow "MoveWindow" intptr, int, int, int, int, int

; winmdroot.Foundation.WAIT_EVENT MsgWaitForMultipleObjects(uint nCount, [Optional] winmdroot.Foundation.HANDLE* pHandles, winmdroot.Foundation.BOOL fWaitAll, uint dwMilliseconds, winmdroot.UI.WindowsAndMessaging.QUEUE_STATUS_FLAGS dwWakeMask)
#cfunc global MsgWaitForMultipleObjects "MsgWaitForMultipleObjects" int, intptr, int, int, int

; winmdroot.Foundation.WAIT_EVENT MsgWaitForMultipleObjectsEx(uint nCount, [Optional] winmdroot.Foundation.HANDLE* pHandles, uint dwMilliseconds, winmdroot.UI.WindowsAndMessaging.QUEUE_STATUS_FLAGS dwWakeMask, winmdroot.UI.WindowsAndMessaging.MSG_WAIT_FOR_MULTIPLE_OBJECTS_EX_FLAGS dwFlags)
#cfunc global MsgWaitForMultipleObjectsEx "MsgWaitForMultipleObjectsEx" int, intptr, int, int, int

; void NotifyWinEvent(uint @event, winmdroot.Foundation.HWND hwnd, int idObject, int idChild)
#func global NotifyWinEvent "NotifyWinEvent" int, intptr, int, int

; uint OemKeyScan(ushort wOemChar)
#cfunc global OemKeyScan "OemKeyScan" int

; winmdroot.Foundation.BOOL OemToChar(winmdroot.Foundation.PCSTR pSrc, winmdroot.Foundation.PWSTR pDst)
#cfunc global OemToCharW "OemToCharW" str, wstr

; winmdroot.Foundation.BOOL OemToCharBuff(winmdroot.Foundation.PCSTR lpszSrc, winmdroot.Foundation.PWSTR lpszDst, uint cchDstLength)
#cfunc global OemToCharBuffW "OemToCharBuffW" str, wstr, int

; winmdroot.Foundation.BOOL OffsetRect(winmdroot.Foundation.RECT* lprc, int dx, int dy)
#cfunc global OffsetRect "OffsetRect" var, int, int

; winmdroot.Foundation.BOOL OpenClipboard(winmdroot.Foundation.HWND hWndNewOwner)
#cfunc global OpenClipboard "OpenClipboard" intptr

; winmdroot.System.StationsAndDesktops.HDESK OpenDesktop(winmdroot.Foundation.PCWSTR lpszDesktop, winmdroot.System.StationsAndDesktops.DESKTOP_CONTROL_FLAGS dwFlags, winmdroot.Foundation.BOOL fInherit, uint dwDesiredAccess)
#cfunc global OpenDesktopW "OpenDesktopW" wstr, int, int, int

; winmdroot.Foundation.BOOL OpenIcon(winmdroot.Foundation.HWND hWnd)
#cfunc global OpenIcon "OpenIcon" intptr

; winmdroot.System.StationsAndDesktops.HDESK OpenInputDesktop(winmdroot.System.StationsAndDesktops.DESKTOP_CONTROL_FLAGS dwFlags, winmdroot.Foundation.BOOL fInherit, winmdroot.System.StationsAndDesktops.DESKTOP_ACCESS_FLAGS dwDesiredAccess)
#cfunc global OpenInputDesktop "OpenInputDesktop" int, int, int

; winmdroot.System.StationsAndDesktops.HWINSTA OpenWindowStation(winmdroot.Foundation.PCWSTR lpszWinSta, winmdroot.Foundation.BOOL fInherit, uint dwDesiredAccess)
#cfunc global OpenWindowStationW "OpenWindowStationW" wstr, int, int

; winmdroot.Foundation.LPARAM PackDDElParam(uint msg, nuint uiLo, nuint uiHi)
#cfunc global PackDDElParam "PackDDElParam" int, int, int

; winmdroot.Foundation.LRESULT PackTouchHitTestingProximityEvaluation(winmdroot.UI.Controls.TOUCH_HIT_TESTING_INPUT* pHitTestingInput, winmdroot.UI.Controls.TOUCH_HIT_TESTING_PROXIMITY_EVALUATION* pProximityEval)
#cfunc global PackTouchHitTestingProximityEvaluation "PackTouchHitTestingProximityEvaluation" var, var

; winmdroot.Foundation.BOOL PaintDesktop(winmdroot.Graphics.Gdi.HDC hdc)
#cfunc global PaintDesktop "PaintDesktop" intptr

; winmdroot.Foundation.BOOL PeekMessageW(winmdroot.UI.WindowsAndMessaging.MSG* lpMsg, winmdroot.Foundation.HWND hWnd, uint wMsgFilterMin, uint wMsgFilterMax, winmdroot.UI.WindowsAndMessaging.PEEK_MESSAGE_REMOVE_TYPE wRemoveMsg)
#cfunc global PeekMessageW "PeekMessageW" var, intptr, int, int, int

; winmdroot.Foundation.BOOL PhysicalToLogicalPoint(winmdroot.Foundation.HWND hWnd, global::System.Drawing.Point* lpPoint)
#cfunc global PhysicalToLogicalPoint "PhysicalToLogicalPoint" intptr, var

; winmdroot.Foundation.BOOL PhysicalToLogicalPointForPerMonitorDPI(winmdroot.Foundation.HWND hWnd, global::System.Drawing.Point* lpPoint)
#cfunc global PhysicalToLogicalPointForPerMonitorDPI "PhysicalToLogicalPointForPerMonitorDPI" intptr, var

; winmdroot.Foundation.BOOL PostMessage(winmdroot.Foundation.HWND hWnd, uint Msg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam)
#cfunc global PostMessageW "PostMessageW" intptr, int, intptr, intptr

; void PostQuitMessage(int nExitCode)
#func global PostQuitMessage "PostQuitMessage" int

; winmdroot.Foundation.BOOL PostThreadMessage(uint idThread, uint Msg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam)
#cfunc global PostThreadMessageW "PostThreadMessageW" int, int, intptr, intptr

; winmdroot.Foundation.BOOL PrintWindow(winmdroot.Foundation.HWND hwnd, winmdroot.Graphics.Gdi.HDC hdcBlt, winmdroot.Storage.Xps.PRINT_WINDOW_FLAGS nFlags)
#cfunc global PrintWindow "PrintWindow" intptr, intptr, int

; uint PrivateExtractIconsW(winmdroot.Foundation.PCWSTR szFileName, int nIconIndex, int cxIcon, int cyIcon, [Optional] winmdroot.UI.WindowsAndMessaging.HICON* phicon, [Optional] uint* piconid, uint nIcons, uint flags)
#cfunc global PrivateExtractIconsW "PrivateExtractIconsW" wstr, int, int, int, intptr, var, int, int

; winmdroot.Foundation.BOOL PtInRect(winmdroot.Foundation.RECT* lprc, global::System.Drawing.Point pt)
#cfunc global PtInRect "PtInRect" var, int

; winmdroot.Foundation.WIN32_ERROR QueryDisplayConfig(winmdroot.Devices.Display.QUERY_DISPLAY_CONFIG_FLAGS flags, uint* numPathArrayElements, winmdroot.Devices.Display.DISPLAYCONFIG_PATH_INFO* pathArray, uint* numModeInfoArrayElements, winmdroot.Devices.Display.DISPLAYCONFIG_MODE_INFO* modeInfoArray, [Optional] winmdroot.Devices.Display.DISPLAYCONFIG_TOPOLOGY_ID* currentTopologyId)
#cfunc global QueryDisplayConfig "QueryDisplayConfig" int, var, var, var, var, var

; winmdroot.Foundation.HWND RealChildWindowFromPoint(winmdroot.Foundation.HWND hwndParent, global::System.Drawing.Point ptParentClientCoords)
#cfunc global RealChildWindowFromPoint "RealChildWindowFromPoint" intptr, int

; uint RealGetWindowClass(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.PWSTR ptszClassName, uint cchClassNameMax)
#cfunc global RealGetWindowClassW "RealGetWindowClassW" intptr, wstr, int

; winmdroot.Foundation.BOOL RedrawWindow(winmdroot.Foundation.HWND hWnd, [Optional] winmdroot.Foundation.RECT* lprcUpdate, winmdroot.Graphics.Gdi.HRGN hrgnUpdate, winmdroot.Graphics.Gdi.REDRAW_WINDOW_FLAGS flags)
#cfunc global RedrawWindow "RedrawWindow" intptr, var, intptr, int

; ushort RegisterClass(winmdroot.UI.WindowsAndMessaging.WNDCLASSW* lpWndClass)
#cfunc global RegisterClassW "RegisterClassW" var

; ushort RegisterClassEx(winmdroot.UI.WindowsAndMessaging.WNDCLASSEXW* param0)
#cfunc global RegisterClassExW "RegisterClassExW" var

; uint RegisterClipboardFormat(winmdroot.Foundation.PCWSTR lpszFormat)
#cfunc global RegisterClipboardFormatW "RegisterClipboardFormatW" wstr

; winmdroot.Foundation.BOOL UnregisterDeviceNotification(winmdroot.UI.WindowsAndMessaging.HDEVNOTIFY Handle)
#cfunc global UnregisterDeviceNotification "UnregisterDeviceNotification" int

; winmdroot.UI.WindowsAndMessaging.HDEVNOTIFY RegisterDeviceNotification(winmdroot.Foundation.HANDLE hRecipient, void* NotificationFilter, winmdroot.UI.WindowsAndMessaging.REGISTER_NOTIFICATION_FLAGS Flags)
#cfunc global RegisterDeviceNotificationW "RegisterDeviceNotificationW" intptr, intptr, int

; winmdroot.Foundation.BOOL RegisterHotKey(winmdroot.Foundation.HWND hWnd, int id, winmdroot.UI.Input.KeyboardAndMouse.HOT_KEY_MODIFIERS fsModifiers, uint vk)
#cfunc global RegisterHotKey "RegisterHotKey" intptr, int, int, int

; winmdroot.Foundation.BOOL RegisterPointerDeviceNotifications(winmdroot.Foundation.HWND window, winmdroot.Foundation.BOOL notifyRange)
#cfunc global RegisterPointerDeviceNotifications "RegisterPointerDeviceNotifications" intptr, int

; winmdroot.Foundation.BOOL RegisterPointerInputTarget(winmdroot.Foundation.HWND hwnd, winmdroot.UI.WindowsAndMessaging.POINTER_INPUT_TYPE pointerType)
#cfunc global RegisterPointerInputTarget "RegisterPointerInputTarget" intptr, int

; winmdroot.Foundation.BOOL RegisterPointerInputTargetEx(winmdroot.Foundation.HWND hwnd, winmdroot.UI.WindowsAndMessaging.POINTER_INPUT_TYPE pointerType, winmdroot.Foundation.BOOL fObserve)
#cfunc global RegisterPointerInputTargetEx "RegisterPointerInputTargetEx" intptr, int, int

; winmdroot.Foundation.BOOL UnregisterPowerSettingNotification(winmdroot.System.Power.HPOWERNOTIFY Handle)
#cfunc global UnregisterPowerSettingNotification "UnregisterPowerSettingNotification" intptr

; winmdroot.System.Power.HPOWERNOTIFY RegisterPowerSettingNotification(winmdroot.Foundation.HANDLE hRecipient, global::System.Guid* PowerSettingGuid, winmdroot.UI.WindowsAndMessaging.REGISTER_NOTIFICATION_FLAGS Flags)
#cfunc global RegisterPowerSettingNotification "RegisterPowerSettingNotification" intptr, var, int

; winmdroot.Foundation.BOOL RegisterRawInputDevices(winmdroot.UI.Input.RAWINPUTDEVICE* pRawInputDevices, uint uiNumDevices, uint cbSize)
#cfunc global RegisterRawInputDevices "RegisterRawInputDevices" var, int, int

; winmdroot.Foundation.BOOL RegisterShellHookWindow(winmdroot.Foundation.HWND hwnd)
#cfunc global RegisterShellHookWindow "RegisterShellHookWindow" intptr

; winmdroot.System.Power.HPOWERNOTIFY RegisterSuspendResumeNotification(winmdroot.Foundation.HANDLE hRecipient, winmdroot.UI.WindowsAndMessaging.REGISTER_NOTIFICATION_FLAGS Flags)
#cfunc global RegisterSuspendResumeNotification "RegisterSuspendResumeNotification" intptr, int

; winmdroot.Foundation.BOOL RegisterTouchHitTestingWindow(winmdroot.Foundation.HWND hwnd, uint value)
#cfunc global RegisterTouchHitTestingWindow "RegisterTouchHitTestingWindow" intptr, int

; winmdroot.Foundation.BOOL RegisterTouchWindow(winmdroot.Foundation.HWND hwnd, winmdroot.UI.Input.Touch.REGISTER_TOUCH_WINDOW_FLAGS ulFlags)
#cfunc global RegisterTouchWindow "RegisterTouchWindow" intptr, int

; uint RegisterWindowMessage(winmdroot.Foundation.PCWSTR lpString)
#cfunc global RegisterWindowMessageW "RegisterWindowMessageW" wstr

; winmdroot.Foundation.BOOL ReleaseCapture()
#cfunc global ReleaseCapture "ReleaseCapture"

; int ReleaseDC(winmdroot.Foundation.HWND hWnd, winmdroot.Graphics.Gdi.HDC hDC)
#cfunc global ReleaseDC "ReleaseDC" intptr, intptr

; winmdroot.Foundation.BOOL RemoveClipboardFormatListener(winmdroot.Foundation.HWND hwnd)
#cfunc global RemoveClipboardFormatListener "RemoveClipboardFormatListener" intptr

; winmdroot.Foundation.BOOL RemoveMenu(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, uint uPosition, winmdroot.UI.WindowsAndMessaging.MENU_ITEM_FLAGS uFlags)
#cfunc global RemoveMenu "RemoveMenu" intptr, int, int

; winmdroot.Foundation.HANDLE RemoveProp(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.PCWSTR lpString)
#cfunc global RemovePropW "RemovePropW" intptr, wstr

; winmdroot.Foundation.BOOL ReplyMessage(winmdroot.Foundation.LRESULT lResult)
#cfunc global ReplyMessage "ReplyMessage" intptr

; winmdroot.Foundation.LPARAM ReuseDDElParam(winmdroot.Foundation.LPARAM lParam, uint msgIn, uint msgOut, nuint uiLo, nuint uiHi)
#cfunc global ReuseDDElParam "ReuseDDElParam" intptr, int, int, int, int

; winmdroot.Foundation.BOOL ScreenToClient(winmdroot.Foundation.HWND hWnd, global::System.Drawing.Point* lpPoint)
#cfunc global ScreenToClient "ScreenToClient" intptr, var

; winmdroot.Foundation.BOOL ScrollDC(winmdroot.Graphics.Gdi.HDC hDC, int dx, int dy, [Optional] winmdroot.Foundation.RECT* lprcScroll, [Optional] winmdroot.Foundation.RECT* lprcClip, winmdroot.Graphics.Gdi.HRGN hrgnUpdate, [Optional] winmdroot.Foundation.RECT* lprcUpdate)
#cfunc global ScrollDC "ScrollDC" intptr, int, int, var, var, intptr, var

; winmdroot.Foundation.BOOL ScrollWindow(winmdroot.Foundation.HWND hWnd, int XAmount, int YAmount, [Optional] winmdroot.Foundation.RECT* lpRect, [Optional] winmdroot.Foundation.RECT* lpClipRect)
#cfunc global ScrollWindow "ScrollWindow" intptr, int, int, var, var

; int ScrollWindowEx(winmdroot.Foundation.HWND hWnd, int dx, int dy, [Optional] winmdroot.Foundation.RECT* prcScroll, [Optional] winmdroot.Foundation.RECT* prcClip, winmdroot.Graphics.Gdi.HRGN hrgnUpdate, [Optional] winmdroot.Foundation.RECT* prcUpdate, winmdroot.UI.WindowsAndMessaging.SCROLL_WINDOW_FLAGS flags)
#cfunc global ScrollWindowEx "ScrollWindowEx" intptr, int, int, var, var, intptr, var, int

; winmdroot.Foundation.LRESULT SendDlgItemMessageW(winmdroot.Foundation.HWND hDlg, int nIDDlgItem, uint Msg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam)
#cfunc global SendDlgItemMessageW "SendDlgItemMessageW" intptr, int, int, intptr, intptr

; winmdroot.Foundation.LRESULT SendIMEMessageExW(winmdroot.Foundation.HWND param0, winmdroot.Foundation.LPARAM param1)
#cfunc global SendIMEMessageExW "SendIMEMessageExW" intptr, intptr

; uint SendInput(uint cInputs, winmdroot.UI.Input.KeyboardAndMouse.INPUT* pInputs, int cbSize)
#cfunc global SendInput "SendInput" int, var, int

; winmdroot.Foundation.LRESULT SendMessage(winmdroot.Foundation.HWND hWnd, uint Msg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam)
#cfunc global SendMessageW "SendMessageW" intptr, int, intptr, intptr

; winmdroot.Foundation.BOOL SendMessageCallback(winmdroot.Foundation.HWND hWnd, uint Msg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,uint,nuint,global::Windows.Win32.Foundation.LRESULT,void> lpResultCallBack, nuint dwData)
#cfunc global SendMessageCallbackW "SendMessageCallbackW" intptr, int, intptr, intptr, int, int

; winmdroot.Foundation.LRESULT SendMessageTimeout(winmdroot.Foundation.HWND hWnd, uint Msg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam, winmdroot.UI.WindowsAndMessaging.SEND_MESSAGE_TIMEOUT_FLAGS fuFlags, uint uTimeout, [Optional] nuint* lpdwResult)
#cfunc global SendMessageTimeoutW "SendMessageTimeoutW" intptr, int, intptr, intptr, int, int, var

; winmdroot.Foundation.BOOL SendNotifyMessage(winmdroot.Foundation.HWND hWnd, uint Msg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam)
#cfunc global SendNotifyMessageW "SendNotifyMessageW" intptr, int, intptr, intptr

; winmdroot.Foundation.HWND SetActiveWindow(winmdroot.Foundation.HWND hWnd)
#cfunc global SetActiveWindow "SetActiveWindow" intptr

; winmdroot.Foundation.HWND SetCapture(winmdroot.Foundation.HWND hWnd)
#cfunc global SetCapture "SetCapture" intptr

; winmdroot.Foundation.BOOL SetCaretBlinkTime(uint uMSeconds)
#cfunc global SetCaretBlinkTime "SetCaretBlinkTime" int

; winmdroot.Foundation.BOOL SetCaretPos(int X, int Y)
#cfunc global SetCaretPos "SetCaretPos" int, int

; uint SetClassLong(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.GET_CLASS_LONG_INDEX nIndex, int dwNewLong)
#cfunc global SetClassLongW "SetClassLongW" intptr, int, int

; ushort SetClassWord(winmdroot.Foundation.HWND hWnd, int nIndex, ushort wNewWord)
#cfunc global SetClassWord "SetClassWord" intptr, int, int

; winmdroot.Foundation.HANDLE SetClipboardData(uint uFormat, winmdroot.Foundation.HANDLE hMem)
#cfunc global SetClipboardData "SetClipboardData" int, intptr

; winmdroot.Foundation.HWND SetClipboardViewer(winmdroot.Foundation.HWND hWndNewViewer)
#cfunc global SetClipboardViewer "SetClipboardViewer" intptr

; nuint SetCoalescableTimer(winmdroot.Foundation.HWND hWnd, nuint nIDEvent, uint uElapse, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,uint,nuint,uint,void> lpTimerFunc, uint uToleranceDelay)
#cfunc global SetCoalescableTimer "SetCoalescableTimer" intptr, int, int, int, int

; winmdroot.UI.WindowsAndMessaging.HCURSOR SetCursor(winmdroot.UI.WindowsAndMessaging.HCURSOR hCursor)
#cfunc global SetCursor "SetCursor" intptr

; winmdroot.Foundation.BOOL SetCursorPos(int X, int Y)
#cfunc global SetCursorPos "SetCursorPos" int, int

; void SetDebugErrorLevel(uint dwLevel)
#func global SetDebugErrorLevel "SetDebugErrorLevel" int

; winmdroot.Foundation.BOOL SetDialogControlDpiChangeBehavior(winmdroot.Foundation.HWND hWnd, winmdroot.UI.HiDpi.DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS mask, winmdroot.UI.HiDpi.DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS values)
#cfunc global SetDialogControlDpiChangeBehavior "SetDialogControlDpiChangeBehavior" intptr, int, int

; winmdroot.Foundation.BOOL SetDialogDpiChangeBehavior(winmdroot.Foundation.HWND hDlg, winmdroot.UI.HiDpi.DIALOG_DPI_CHANGE_BEHAVIORS mask, winmdroot.UI.HiDpi.DIALOG_DPI_CHANGE_BEHAVIORS values)
#cfunc global SetDialogDpiChangeBehavior "SetDialogDpiChangeBehavior" intptr, int, int

; winmdroot.Foundation.BOOL SetDisplayAutoRotationPreferences(winmdroot.Devices.Display.ORIENTATION_PREFERENCE orientation)
#cfunc global SetDisplayAutoRotationPreferences "SetDisplayAutoRotationPreferences" int

; int SetDisplayConfig(uint numPathArrayElements, [Optional] winmdroot.Devices.Display.DISPLAYCONFIG_PATH_INFO* pathArray, uint numModeInfoArrayElements, [Optional] winmdroot.Devices.Display.DISPLAYCONFIG_MODE_INFO* modeInfoArray, winmdroot.Devices.Display.SET_DISPLAY_CONFIG_FLAGS flags)
#cfunc global SetDisplayConfig "SetDisplayConfig" int, var, int, var, int

; winmdroot.Foundation.BOOL SetDlgItemInt(winmdroot.Foundation.HWND hDlg, int nIDDlgItem, uint uValue, winmdroot.Foundation.BOOL bSigned)
#cfunc global SetDlgItemInt "SetDlgItemInt" intptr, int, int, int

; winmdroot.Foundation.BOOL SetDlgItemText(winmdroot.Foundation.HWND hDlg, int nIDDlgItem, winmdroot.Foundation.PCWSTR lpString)
#cfunc global SetDlgItemTextW "SetDlgItemTextW" intptr, int, wstr

; winmdroot.Foundation.BOOL SetDoubleClickTime(uint param0)
#cfunc global SetDoubleClickTime "SetDoubleClickTime" int

; winmdroot.Foundation.HWND SetFocus(winmdroot.Foundation.HWND hWnd)
#cfunc global SetFocus "SetFocus" intptr

; winmdroot.Foundation.BOOL SetForegroundWindow(winmdroot.Foundation.HWND hWnd)
#cfunc global SetForegroundWindow "SetForegroundWindow" intptr

; winmdroot.Foundation.BOOL SetGestureConfig(winmdroot.Foundation.HWND hwnd, uint dwReserved, uint cIDs, winmdroot.UI.Input.Touch.GESTURECONFIG* pGestureConfig, uint cbSize)
#cfunc global SetGestureConfig "SetGestureConfig" intptr, int, int, var, int

; winmdroot.Foundation.BOOL SetKeyboardState(byte* lpKeyState)
#cfunc global SetKeyboardState "SetKeyboardState" var

; void SetLastErrorEx(winmdroot.Foundation.WIN32_ERROR dwErrCode, uint dwType)
#func global SetLastErrorEx "SetLastErrorEx" int, int

; winmdroot.Foundation.BOOL SetLayeredWindowAttributes(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.COLORREF crKey, byte bAlpha, winmdroot.UI.WindowsAndMessaging.LAYERED_WINDOW_ATTRIBUTES_FLAGS dwFlags)
#cfunc global SetLayeredWindowAttributes "SetLayeredWindowAttributes" intptr, int, int, int

; winmdroot.Foundation.BOOL SetMenu(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.HMENU hMenu)
#cfunc global SetMenu "SetMenu" intptr, intptr

; winmdroot.Foundation.BOOL SetMenuContextHelpId(winmdroot.UI.WindowsAndMessaging.HMENU param0, uint param1)
#cfunc global SetMenuContextHelpId "SetMenuContextHelpId" intptr, int

; winmdroot.Foundation.BOOL SetMenuDefaultItem(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, uint uItem, uint fByPos)
#cfunc global SetMenuDefaultItem "SetMenuDefaultItem" intptr, int, int

; winmdroot.Foundation.BOOL SetMenuInfo(winmdroot.UI.WindowsAndMessaging.HMENU param0, winmdroot.UI.WindowsAndMessaging.MENUINFO* param1)
#cfunc global SetMenuInfo "SetMenuInfo" intptr, var

; winmdroot.Foundation.BOOL SetMenuItemBitmaps(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, uint uPosition, winmdroot.UI.WindowsAndMessaging.MENU_ITEM_FLAGS uFlags, winmdroot.Graphics.Gdi.HBITMAP hBitmapUnchecked, winmdroot.Graphics.Gdi.HBITMAP hBitmapChecked)
#cfunc global SetMenuItemBitmaps "SetMenuItemBitmaps" intptr, int, int, intptr, intptr

; winmdroot.Foundation.BOOL SetMenuItemInfo(winmdroot.UI.WindowsAndMessaging.HMENU hmenu, uint item, winmdroot.Foundation.BOOL fByPositon, winmdroot.UI.WindowsAndMessaging.MENUITEMINFOW* lpmii)
#cfunc global SetMenuItemInfoW "SetMenuItemInfoW" intptr, int, int, var

; winmdroot.Foundation.LPARAM SetMessageExtraInfo(winmdroot.Foundation.LPARAM lParam)
#cfunc global SetMessageExtraInfo "SetMessageExtraInfo" intptr

; winmdroot.Foundation.BOOL SetMessageQueue(int cMessagesMax)
#cfunc global SetMessageQueue "SetMessageQueue" int

; winmdroot.Foundation.HWND SetParent(winmdroot.Foundation.HWND hWndChild, winmdroot.Foundation.HWND hWndNewParent)
#cfunc global SetParent "SetParent" intptr, intptr

; winmdroot.Foundation.BOOL SetPhysicalCursorPos(int X, int Y)
#cfunc global SetPhysicalCursorPos "SetPhysicalCursorPos" int, int

; winmdroot.Foundation.BOOL SetProcessDPIAware()
#cfunc global SetProcessDPIAware "SetProcessDPIAware"

; winmdroot.Foundation.BOOL SetProcessDefaultLayout(uint dwDefaultLayout)
#cfunc global SetProcessDefaultLayout "SetProcessDefaultLayout" int

; winmdroot.Foundation.BOOL SetProcessDpiAwarenessContext(winmdroot.UI.HiDpi.DPI_AWARENESS_CONTEXT value)
#cfunc global SetProcessDpiAwarenessContext "SetProcessDpiAwarenessContext" intptr

; winmdroot.Foundation.BOOL SetProcessRestrictionExemption(winmdroot.Foundation.BOOL fEnableExemption)
#cfunc global SetProcessRestrictionExemption "SetProcessRestrictionExemption" int

; winmdroot.Foundation.BOOL SetProcessWindowStation(winmdroot.System.StationsAndDesktops.HWINSTA hWinSta)
#cfunc global SetProcessWindowStation "SetProcessWindowStation" intptr

; winmdroot.Foundation.BOOL SetProp(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.PCWSTR lpString, winmdroot.Foundation.HANDLE hData)
#cfunc global SetPropW "SetPropW" intptr, wstr, intptr

; winmdroot.Foundation.BOOL SetRect(winmdroot.Foundation.RECT* lprc, int xLeft, int yTop, int xRight, int yBottom)
#cfunc global SetRect "SetRect" var, int, int, int, int

; winmdroot.Foundation.BOOL SetRectEmpty(winmdroot.Foundation.RECT* lprc)
#cfunc global SetRectEmpty "SetRectEmpty" var

; int SetScrollInfo(winmdroot.Foundation.HWND hwnd, winmdroot.UI.WindowsAndMessaging.SCROLLBAR_CONSTANTS nBar, winmdroot.UI.WindowsAndMessaging.SCROLLINFO* lpsi, winmdroot.Foundation.BOOL redraw)
#cfunc global SetScrollInfo "SetScrollInfo" intptr, int, var, int

; int SetScrollPos(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.SCROLLBAR_CONSTANTS nBar, int nPos, winmdroot.Foundation.BOOL bRedraw)
#cfunc global SetScrollPos "SetScrollPos" intptr, int, int, int

; winmdroot.Foundation.BOOL SetScrollRange(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.SCROLLBAR_CONSTANTS nBar, int nMinPos, int nMaxPos, winmdroot.Foundation.BOOL bRedraw)
#cfunc global SetScrollRange "SetScrollRange" intptr, int, int, int, int

; winmdroot.Foundation.BOOL SetSysColors(int cElements, int* lpaElements, winmdroot.Foundation.COLORREF* lpaRgbValues)
#cfunc global SetSysColors "SetSysColors" int, var, var

; winmdroot.Foundation.BOOL SetSystemCursor(winmdroot.UI.WindowsAndMessaging.HCURSOR hcur, winmdroot.UI.WindowsAndMessaging.SYSTEM_CURSOR_ID id)
#cfunc global SetSystemCursor "SetSystemCursor" intptr, int

; winmdroot.Foundation.BOOL SetThreadDesktop(winmdroot.System.StationsAndDesktops.HDESK hDesktop)
#cfunc global SetThreadDesktop "SetThreadDesktop" intptr

; winmdroot.UI.HiDpi.DPI_AWARENESS_CONTEXT SetThreadDpiAwarenessContext(winmdroot.UI.HiDpi.DPI_AWARENESS_CONTEXT dpiContext)
#cfunc global SetThreadDpiAwarenessContext "SetThreadDpiAwarenessContext" intptr

; winmdroot.UI.HiDpi.DPI_HOSTING_BEHAVIOR SetThreadDpiHostingBehavior(winmdroot.UI.HiDpi.DPI_HOSTING_BEHAVIOR value)
#cfunc global SetThreadDpiHostingBehavior "SetThreadDpiHostingBehavior" int

; nuint SetTimer(winmdroot.Foundation.HWND hWnd, nuint nIDEvent, uint uElapse, delegate *unmanaged[Stdcall]<global::Windows.Win32.Foundation.HWND,uint,nuint,uint,void> lpTimerFunc)
#cfunc global SetTimer "SetTimer" intptr, int, int, int

; winmdroot.Foundation.BOOL SetUserObjectInformation(winmdroot.Foundation.HANDLE hObj, int nIndex, void* pvInfo, uint nLength)
#cfunc global SetUserObjectInformationW "SetUserObjectInformationW" intptr, int, intptr, int

; winmdroot.Foundation.BOOL SetUserObjectSecurity(winmdroot.Foundation.HANDLE hObj, winmdroot.Security.OBJECT_SECURITY_INFORMATION* pSIRequested, winmdroot.Security.PSECURITY_DESCRIPTOR pSID)
#cfunc global SetUserObjectSecurity "SetUserObjectSecurity" intptr, var, int

; winmdroot.Foundation.BOOL UnhookWinEvent(winmdroot.UI.Accessibility.HWINEVENTHOOK hWinEventHook)
#cfunc global UnhookWinEvent "UnhookWinEvent" intptr

; winmdroot.UI.Accessibility.HWINEVENTHOOK SetWinEventHook(uint eventMin, uint eventMax, winmdroot.Foundation.HMODULE hmodWinEventProc, delegate *unmanaged[Stdcall]<global::Windows.Win32.UI.Accessibility.HWINEVENTHOOK,uint,global::Windows.Win32.Foundation.HWND,int,int,uint,uint,void> pfnWinEventProc, uint idProcess, uint idThread, uint dwFlags)
#cfunc global SetWinEventHook "SetWinEventHook" int, int, intptr, int, int, int, int

; winmdroot.Foundation.BOOL SetWindowContextHelpId(winmdroot.Foundation.HWND param0, uint param1)
#cfunc global SetWindowContextHelpId "SetWindowContextHelpId" intptr, int

; winmdroot.Foundation.BOOL SetWindowDisplayAffinity(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.WINDOW_DISPLAY_AFFINITY dwAffinity)
#cfunc global SetWindowDisplayAffinity "SetWindowDisplayAffinity" intptr, int

; winmdroot.Foundation.BOOL SetWindowFeedbackSetting(winmdroot.Foundation.HWND hwnd, winmdroot.UI.Controls.FEEDBACK_TYPE feedback, uint dwFlags, uint size, [Optional] void* configuration)
#cfunc global SetWindowFeedbackSetting "SetWindowFeedbackSetting" intptr, int, int, int, intptr

; int SetWindowLong(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.WINDOW_LONG_PTR_INDEX nIndex, int dwNewLong)
#cfunc global SetWindowLongW "SetWindowLongW" intptr, int, int

; winmdroot.Foundation.BOOL SetWindowPlacement(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.WINDOWPLACEMENT* lpwndpl)
#cfunc global SetWindowPlacement "SetWindowPlacement" intptr, var

; winmdroot.Foundation.BOOL SetWindowPos(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.HWND hWndInsertAfter, int X, int Y, int cx, int cy, winmdroot.UI.WindowsAndMessaging.SET_WINDOW_POS_FLAGS uFlags)
#cfunc global SetWindowPos "SetWindowPos" intptr, intptr, int, int, int, int, int

; int SetWindowRgn(winmdroot.Foundation.HWND hWnd, winmdroot.Graphics.Gdi.HRGN hRgn, winmdroot.Foundation.BOOL bRedraw)
#cfunc global SetWindowRgn "SetWindowRgn" intptr, intptr, int

; winmdroot.Foundation.BOOL SetWindowText(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.PCWSTR lpString)
#cfunc global SetWindowTextW "SetWindowTextW" intptr, wstr

; ushort SetWindowWord(winmdroot.Foundation.HWND hWnd, int nIndex, ushort wNewWord)
#cfunc global SetWindowWord "SetWindowWord" intptr, int, int

; winmdroot.UI.WindowsAndMessaging.HHOOK SetWindowsHookW(int nFilterType, delegate *unmanaged[Stdcall]<int,global::Windows.Win32.Foundation.WPARAM,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.LRESULT> pfnFilterProc)
#cfunc global SetWindowsHookW "SetWindowsHookW" int, int

; winmdroot.UI.WindowsAndMessaging.HHOOK SetWindowsHookEx(winmdroot.UI.WindowsAndMessaging.WINDOWS_HOOK_ID idHook, delegate *unmanaged[Stdcall]<int,global::Windows.Win32.Foundation.WPARAM,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.LRESULT> lpfn, winmdroot.Foundation.HINSTANCE hmod, uint dwThreadId)
#cfunc global SetWindowsHookExW "SetWindowsHookExW" int, int, intptr, int

; winmdroot.Foundation.BOOL ShowCaret(winmdroot.Foundation.HWND hWnd)
#cfunc global ShowCaret "ShowCaret" intptr

; int ShowCursor(winmdroot.Foundation.BOOL bShow)
#cfunc global ShowCursor "ShowCursor" int

; winmdroot.Foundation.BOOL ShowOwnedPopups(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.BOOL fShow)
#cfunc global ShowOwnedPopups "ShowOwnedPopups" intptr, int

; winmdroot.Foundation.BOOL ShowScrollBar(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.SCROLLBAR_CONSTANTS wBar, winmdroot.Foundation.BOOL bShow)
#cfunc global ShowScrollBar "ShowScrollBar" intptr, int, int

; winmdroot.Foundation.BOOL ShowWindow(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.SHOW_WINDOW_CMD nCmdShow)
#cfunc global ShowWindow "ShowWindow" intptr, int

; winmdroot.Foundation.BOOL ShowWindowAsync(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.SHOW_WINDOW_CMD nCmdShow)
#cfunc global ShowWindowAsync "ShowWindowAsync" intptr, int

; winmdroot.Foundation.BOOL ShutdownBlockReasonCreate(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.PCWSTR pwszReason)
#cfunc global ShutdownBlockReasonCreate "ShutdownBlockReasonCreate" intptr, wstr

; winmdroot.Foundation.BOOL ShutdownBlockReasonDestroy(winmdroot.Foundation.HWND hWnd)
#cfunc global ShutdownBlockReasonDestroy "ShutdownBlockReasonDestroy" intptr

; winmdroot.Foundation.BOOL ShutdownBlockReasonQuery(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.PWSTR pwszBuff, uint* pcchBuff)
#cfunc global ShutdownBlockReasonQuery "ShutdownBlockReasonQuery" intptr, wstr, var

; winmdroot.Foundation.BOOL SkipPointerFrameMessages(uint pointerId)
#cfunc global SkipPointerFrameMessages "SkipPointerFrameMessages" int

; winmdroot.Foundation.BOOL SoundSentry()
#cfunc global SoundSentry "SoundSentry"

; winmdroot.Foundation.BOOL SubtractRect(winmdroot.Foundation.RECT* lprcDst, winmdroot.Foundation.RECT* lprcSrc1, winmdroot.Foundation.RECT* lprcSrc2)
#cfunc global SubtractRect "SubtractRect" var, var, var

; winmdroot.Foundation.BOOL SwapMouseButton(winmdroot.Foundation.BOOL fSwap)
#cfunc global SwapMouseButton "SwapMouseButton" int

; winmdroot.Foundation.BOOL SwitchDesktop(winmdroot.System.StationsAndDesktops.HDESK hDesktop)
#cfunc global SwitchDesktop "SwitchDesktop" intptr

; void SwitchToThisWindow(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.BOOL fUnknown)
#func global SwitchToThisWindow "SwitchToThisWindow" intptr, int

; winmdroot.Foundation.BOOL SystemParametersInfo(winmdroot.UI.WindowsAndMessaging.SYSTEM_PARAMETERS_INFO_ACTION uiAction, uint uiParam, [Optional] void* pvParam, winmdroot.UI.WindowsAndMessaging.SYSTEM_PARAMETERS_INFO_UPDATE_FLAGS fWinIni)
#cfunc global SystemParametersInfoW "SystemParametersInfoW" int, int, intptr, int

; winmdroot.Foundation.BOOL SystemParametersInfoForDpi(uint uiAction, uint uiParam, [Optional] void* pvParam, uint fWinIni, uint dpi)
#cfunc global SystemParametersInfoForDpi "SystemParametersInfoForDpi" int, int, intptr, int, int

; int TabbedTextOutW(winmdroot.Graphics.Gdi.HDC hdc, int x, int y, winmdroot.Foundation.PCWSTR lpString, int chCount, int nTabPositions, [Optional] int* lpnTabStopPositions, int nTabOrigin)
#cfunc global TabbedTextOutW "TabbedTextOutW" intptr, int, int, wstr, int, int, var, int

; ushort TileWindows(winmdroot.Foundation.HWND hwndParent, winmdroot.UI.WindowsAndMessaging.TILE_WINDOWS_HOW wHow, [Optional] winmdroot.Foundation.RECT* lpRect, uint cKids, [Optional] winmdroot.Foundation.HWND* lpKids)
#cfunc global TileWindows "TileWindows" intptr, int, var, int, intptr

; int ToAscii(uint uVirtKey, uint uScanCode, [Optional] byte* lpKeyState, ushort* lpChar, uint uFlags)
#cfunc global ToAscii "ToAscii" int, int, var, var, int

; int ToAsciiEx(uint uVirtKey, uint uScanCode, [Optional] byte* lpKeyState, ushort* lpChar, uint uFlags, winmdroot.UI.Input.KeyboardAndMouse.HKL dwhkl)
#cfunc global ToAsciiEx "ToAsciiEx" int, int, var, var, int, intptr

; int ToUnicode(uint wVirtKey, uint wScanCode, [Optional] byte* lpKeyState, winmdroot.Foundation.PWSTR pwszBuff, int cchBuff, uint wFlags)
#cfunc global ToUnicode "ToUnicode" int, int, var, wstr, int, int

; int ToUnicodeEx(uint wVirtKey, uint wScanCode, byte* lpKeyState, winmdroot.Foundation.PWSTR pwszBuff, int cchBuff, uint wFlags, winmdroot.UI.Input.KeyboardAndMouse.HKL dwhkl)
#cfunc global ToUnicodeEx "ToUnicodeEx" int, int, var, wstr, int, int, intptr

; winmdroot.Foundation.BOOL TrackMouseEvent(winmdroot.UI.Input.KeyboardAndMouse.TRACKMOUSEEVENT* lpEventTrack)
#cfunc global TrackMouseEvent "TrackMouseEvent" var

; winmdroot.Foundation.BOOL TrackPopupMenu(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, winmdroot.UI.WindowsAndMessaging.TRACK_POPUP_MENU_FLAGS uFlags, int x, int y, int nReserved, winmdroot.Foundation.HWND hWnd, [Optional] winmdroot.Foundation.RECT* prcRect)
#cfunc global TrackPopupMenu "TrackPopupMenu" intptr, int, int, int, int, intptr, var

; winmdroot.Foundation.BOOL TrackPopupMenuEx(winmdroot.UI.WindowsAndMessaging.HMENU hMenu, uint uFlags, int x, int y, winmdroot.Foundation.HWND hwnd, [Optional] winmdroot.UI.WindowsAndMessaging.TPMPARAMS* lptpm)
#cfunc global TrackPopupMenuEx "TrackPopupMenuEx" intptr, int, int, int, intptr, var

; int TranslateAccelerator(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.HACCEL hAccTable, winmdroot.UI.WindowsAndMessaging.MSG* lpMsg)
#cfunc global TranslateAcceleratorW "TranslateAcceleratorW" intptr, intptr, var

; winmdroot.Foundation.BOOL TranslateMDISysAccel(winmdroot.Foundation.HWND hWndClient, winmdroot.UI.WindowsAndMessaging.MSG* lpMsg)
#cfunc global TranslateMDISysAccel "TranslateMDISysAccel" intptr, var

; winmdroot.Foundation.BOOL TranslateMessage(winmdroot.UI.WindowsAndMessaging.MSG* lpMsg)
#cfunc global TranslateMessage "TranslateMessage" var

; winmdroot.Foundation.BOOL UnhookWindowsHook(int nCode, delegate *unmanaged[Stdcall]<int,global::Windows.Win32.Foundation.WPARAM,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.LRESULT> pfnFilterProc)
#cfunc global UnhookWindowsHook "UnhookWindowsHook" int, int

; winmdroot.Foundation.BOOL UnionRect(winmdroot.Foundation.RECT* lprcDst, winmdroot.Foundation.RECT* lprcSrc1, winmdroot.Foundation.RECT* lprcSrc2)
#cfunc global UnionRect "UnionRect" var, var, var

; winmdroot.Foundation.BOOL UnpackDDElParam(uint msg, winmdroot.Foundation.LPARAM lParam, nuint* puiLo, nuint* puiHi)
#cfunc global UnpackDDElParam "UnpackDDElParam" int, intptr, var, var

; winmdroot.Foundation.BOOL UnregisterClass(winmdroot.Foundation.PCWSTR lpClassName, winmdroot.Foundation.HINSTANCE hInstance)
#cfunc global UnregisterClassW "UnregisterClassW" wstr, intptr

; winmdroot.Foundation.BOOL UnregisterHotKey(winmdroot.Foundation.HWND hWnd, int id)
#cfunc global UnregisterHotKey "UnregisterHotKey" intptr, int

; winmdroot.Foundation.BOOL UnregisterPointerInputTarget(winmdroot.Foundation.HWND hwnd, winmdroot.UI.WindowsAndMessaging.POINTER_INPUT_TYPE pointerType)
#cfunc global UnregisterPointerInputTarget "UnregisterPointerInputTarget" intptr, int

; winmdroot.Foundation.BOOL UnregisterPointerInputTargetEx(winmdroot.Foundation.HWND hwnd, winmdroot.UI.WindowsAndMessaging.POINTER_INPUT_TYPE pointerType)
#cfunc global UnregisterPointerInputTargetEx "UnregisterPointerInputTargetEx" intptr, int

; winmdroot.Foundation.BOOL UnregisterSuspendResumeNotification(winmdroot.System.Power.HPOWERNOTIFY Handle)
#cfunc global UnregisterSuspendResumeNotification "UnregisterSuspendResumeNotification" intptr

; winmdroot.Foundation.BOOL UnregisterTouchWindow(winmdroot.Foundation.HWND hwnd)
#cfunc global UnregisterTouchWindow "UnregisterTouchWindow" intptr

; winmdroot.Foundation.BOOL UpdateLayeredWindow(winmdroot.Foundation.HWND hWnd, winmdroot.Graphics.Gdi.HDC hdcDst, [Optional] global::System.Drawing.Point* pptDst, [Optional] winmdroot.Foundation.SIZE* psize, winmdroot.Graphics.Gdi.HDC hdcSrc, [Optional] global::System.Drawing.Point* pptSrc, winmdroot.Foundation.COLORREF crKey, [Optional] winmdroot.Graphics.Gdi.BLENDFUNCTION* pblend, winmdroot.UI.WindowsAndMessaging.UPDATE_LAYERED_WINDOW_FLAGS dwFlags)
#cfunc global UpdateLayeredWindow "UpdateLayeredWindow" intptr, intptr, var, var, intptr, var, int, var, int

; winmdroot.Foundation.BOOL UpdateLayeredWindowIndirect(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.UPDATELAYEREDWINDOWINFO* pULWInfo)
#cfunc global UpdateLayeredWindowIndirect "UpdateLayeredWindowIndirect" intptr, var

; winmdroot.Foundation.BOOL UpdateWindow(winmdroot.Foundation.HWND hWnd)
#cfunc global UpdateWindow "UpdateWindow" intptr

; winmdroot.Foundation.BOOL UserHandleGrantAccess(winmdroot.Foundation.HANDLE hUserHandle, winmdroot.Foundation.HANDLE hJob, winmdroot.Foundation.BOOL bGrant)
#cfunc global UserHandleGrantAccess "UserHandleGrantAccess" intptr, intptr, int

; winmdroot.Foundation.BOOL ValidateRect(winmdroot.Foundation.HWND hWnd, [Optional] winmdroot.Foundation.RECT* lpRect)
#cfunc global ValidateRect "ValidateRect" intptr, var

; winmdroot.Foundation.BOOL ValidateRgn(winmdroot.Foundation.HWND hWnd, winmdroot.Graphics.Gdi.HRGN hRgn)
#cfunc global ValidateRgn "ValidateRgn" intptr, intptr

; short VkKeyScanW(char ch)
#cfunc global VkKeyScanW "VkKeyScanW" int

; short VkKeyScanExW(char ch, winmdroot.UI.Input.KeyboardAndMouse.HKL dwhkl)
#cfunc global VkKeyScanExW "VkKeyScanExW" int, intptr

; winmdroot.Foundation.BOOL WINNLSEnableIME(winmdroot.Foundation.HWND param0, winmdroot.Foundation.BOOL param1)
#cfunc global WINNLSEnableIME "WINNLSEnableIME" intptr, int

; winmdroot.Foundation.BOOL WINNLSGetEnableStatus(winmdroot.Foundation.HWND param0)
#cfunc global WINNLSGetEnableStatus "WINNLSGetEnableStatus" intptr

; uint WINNLSGetIMEHotkey(winmdroot.Foundation.HWND param0)
#cfunc global WINNLSGetIMEHotkey "WINNLSGetIMEHotkey" intptr

; uint WaitForInputIdle(winmdroot.Foundation.HANDLE hProcess, uint dwMilliseconds)
#cfunc global WaitForInputIdle "WaitForInputIdle" intptr, int

; winmdroot.Foundation.BOOL WaitMessage()
#cfunc global WaitMessage "WaitMessage"

; winmdroot.Foundation.BOOL WinHelp(winmdroot.Foundation.HWND hWndMain, winmdroot.Foundation.PCWSTR lpszHelp, uint uCommand, nuint dwData)
#cfunc global WinHelpW "WinHelpW" intptr, wstr, int, int

; winmdroot.Foundation.HWND WindowFromDC(winmdroot.Graphics.Gdi.HDC hDC)
#cfunc global WindowFromDC "WindowFromDC" intptr

; winmdroot.Foundation.HWND WindowFromPhysicalPoint(global::System.Drawing.Point Point)
#cfunc global WindowFromPhysicalPoint "WindowFromPhysicalPoint" int

; winmdroot.Foundation.HWND WindowFromPoint(global::System.Drawing.Point Point)
#cfunc global WindowFromPoint "WindowFromPoint" int

#endif
