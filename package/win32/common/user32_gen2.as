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
; winmdroot.Foundation.BOOL DestroyMenu(winmdroot.UI.WindowsAndMessaging.HMENU hMenu)
#cfunc DestroyMenu "DestroyMenu" intptr

; winmdroot.Foundation.HWND CreateWindowEx(winmdroot.UI.WindowsAndMessaging.WINDOW_EX_STYLE dwExStyle, winmdroot.Foundation.PCWSTR lpClassName, winmdroot.Foundation.PCWSTR lpWindowName, winmdroot.UI.WindowsAndMessaging.WINDOW_STYLE dwStyle, int X, int Y, int nWidth, int nHeight, winmdroot.Foundation.HWND hWndParent, winmdroot.UI.WindowsAndMessaging.HMENU hMenu, winmdroot.Foundation.HINSTANCE hInstance, [Optional] void* lpParam)
#cfunc CreateWindowExW "CreateWindowExW" int, wstr, wstr, int, int, int, int, int, intptr, intptr, intptr, intptr

; winmdroot.Foundation.BOOL DestroyWindow(winmdroot.Foundation.HWND hWnd)
#cfunc DestroyWindow "DestroyWindow" intptr

; winmdroot.Foundation.BOOL ShowWindow(winmdroot.Foundation.HWND hWnd, winmdroot.UI.WindowsAndMessaging.SHOW_WINDOW_CMD nCmdShow)
#cfunc ShowWindow "ShowWindow" intptr, int

; winmdroot.Foundation.BOOL UpdateWindow(winmdroot.Foundation.HWND hWnd)
#cfunc UpdateWindow "UpdateWindow" intptr

; winmdroot.Foundation.HWND GetForegroundWindow()
#cfunc GetForegroundWindow "GetForegroundWindow"

; winmdroot.Foundation.BOOL SetForegroundWindow(winmdroot.Foundation.HWND hWnd)
#cfunc SetForegroundWindow "SetForegroundWindow" intptr

; winmdroot.Foundation.HWND GetActiveWindow()
#cfunc GetActiveWindow "GetActiveWindow"

; winmdroot.Foundation.BOOL IsWindow(winmdroot.Foundation.HWND hWnd)
#cfunc IsWindow "IsWindow" intptr

; winmdroot.Foundation.BOOL IsWindowVisible(winmdroot.Foundation.HWND hWnd)
#cfunc IsWindowVisible "IsWindowVisible" intptr

; winmdroot.Foundation.BOOL GetClientRect(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.RECT* lpRect)
#cfunc GetClientRect "GetClientRect" intptr, var

; winmdroot.Foundation.BOOL GetWindowRect(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.RECT* lpRect)
#cfunc GetWindowRect "GetWindowRect" intptr, var

; winmdroot.Foundation.BOOL SetWindowPos(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.HWND hWndInsertAfter, int X, int Y, int cx, int cy, winmdroot.UI.WindowsAndMessaging.SET_WINDOW_POS_FLAGS uFlags)
#cfunc SetWindowPos "SetWindowPos" intptr, intptr, int, int, int, int, int

; winmdroot.Foundation.BOOL MoveWindow(winmdroot.Foundation.HWND hWnd, int X, int Y, int nWidth, int nHeight, winmdroot.Foundation.BOOL bRepaint)
#cfunc MoveWindow "MoveWindow" intptr, int, int, int, int, int

; winmdroot.Foundation.BOOL ClientToScreen(winmdroot.Foundation.HWND hWnd, global::System.Drawing.Point* lpPoint)
#cfunc ClientToScreen "ClientToScreen" intptr, var

; winmdroot.Foundation.BOOL ScreenToClient(winmdroot.Foundation.HWND hWnd, global::System.Drawing.Point* lpPoint)
#cfunc ScreenToClient "ScreenToClient" intptr, var

; winmdroot.Foundation.HWND GetParent(winmdroot.Foundation.HWND hWnd)
#cfunc GetParent "GetParent" intptr

; winmdroot.Foundation.HWND SetParent(winmdroot.Foundation.HWND hWndChild, winmdroot.Foundation.HWND hWndNewParent)
#cfunc SetParent "SetParent" intptr, intptr

; winmdroot.Foundation.LRESULT SendMessage(winmdroot.Foundation.HWND hWnd, uint Msg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam)
#cfunc SendMessageW "SendMessageW" intptr, int, intptr, intptr

; winmdroot.Foundation.BOOL PostMessage(winmdroot.Foundation.HWND hWnd, uint Msg, winmdroot.Foundation.WPARAM wParam, winmdroot.Foundation.LPARAM lParam)
#cfunc PostMessageW "PostMessageW" intptr, int, intptr, intptr

; winmdroot.Foundation.BOOL GetMessage(winmdroot.UI.WindowsAndMessaging.MSG* lpMsg, winmdroot.Foundation.HWND hWnd, uint wMsgFilterMin, uint wMsgFilterMax)
#cfunc GetMessageW "GetMessageW" var, intptr, int, int

; winmdroot.Foundation.BOOL TranslateMessage(winmdroot.UI.WindowsAndMessaging.MSG* lpMsg)
#cfunc TranslateMessage "TranslateMessage" var

; winmdroot.Foundation.LRESULT DispatchMessageW(winmdroot.UI.WindowsAndMessaging.MSG* lpMsg)
#cfunc DispatchMessageW "DispatchMessageW" var

; winmdroot.UI.WindowsAndMessaging.MESSAGEBOX_RESULT MessageBox(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.PCWSTR lpText, winmdroot.Foundation.PCWSTR lpCaption, winmdroot.UI.WindowsAndMessaging.MESSAGEBOX_STYLE uType)
#cfunc MessageBoxW "MessageBoxW" intptr, wstr, wstr, int

; winmdroot.Foundation.BOOL DestroyCursor(winmdroot.UI.WindowsAndMessaging.HCURSOR hCursor)
#cfunc DestroyCursor "DestroyCursor" intptr

; winmdroot.Foundation.BOOL DestroyIcon(winmdroot.UI.WindowsAndMessaging.HICON hIcon)
#cfunc DestroyIcon "DestroyIcon" intptr

; winmdroot.UI.WindowsAndMessaging.HCURSOR LoadCursor(winmdroot.Foundation.HINSTANCE hInstance, winmdroot.Foundation.PCWSTR lpCursorName)
#cfunc LoadCursorW "LoadCursorW" intptr, wstr

; winmdroot.UI.WindowsAndMessaging.HCURSOR SetCursor(winmdroot.UI.WindowsAndMessaging.HCURSOR hCursor)
#cfunc SetCursor "SetCursor" intptr

; winmdroot.Foundation.BOOL GetCursorPos(global::System.Drawing.Point* lpPoint)
#cfunc GetCursorPos "GetCursorPos" var

; winmdroot.Foundation.BOOL SetCursorPos(int X, int Y)
#cfunc SetCursorPos "SetCursorPos" int, int

; int GetSystemMetrics(winmdroot.UI.WindowsAndMessaging.SYSTEM_METRICS_INDEX nIndex)
#cfunc GetSystemMetrics "GetSystemMetrics" int

; short GetAsyncKeyState(int vKey)
#cfunc GetAsyncKeyState "GetAsyncKeyState" int

; short GetKeyState(int nVirtKey)
#cfunc GetKeyState "GetKeyState" int

; int FillRect(winmdroot.Graphics.Gdi.HDC hDC, winmdroot.Foundation.RECT* lprc, winmdroot.Graphics.Gdi.HBRUSH hbr)
#cfunc FillRect "FillRect" intptr, var, intptr

; int FrameRect(winmdroot.Graphics.Gdi.HDC hDC, winmdroot.Foundation.RECT* lprc, winmdroot.Graphics.Gdi.HBRUSH hbr)
#cfunc FrameRect "FrameRect" intptr, var, intptr

; winmdroot.Foundation.BOOL InvertRect(winmdroot.Graphics.Gdi.HDC hDC, winmdroot.Foundation.RECT* lprc)
#cfunc InvertRect "InvertRect" intptr, var

; winmdroot.Foundation.BOOL UnloadKeyboardLayout(winmdroot.UI.Input.KeyboardAndMouse.HKL hkl)
#cfunc UnloadKeyboardLayout "UnloadKeyboardLayout" intptr

#endif
