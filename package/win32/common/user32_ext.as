;============================================================
;   user32_ext.as
;
;   user32.dll の拡張版ヘッダ (IronHSP の intptr / NSTRUCT / wstr 対応)
;
;   既存の user32.as は 32bit ABI 前提・sptr ベースで構造体を一切扱って
;   いないが、こちらは:
;     - intptr で HWND / HMODULE 等を 32/64bit 両対応
;     - #defstruct で RECT / POINT / MSG / WNDCLASSEXW を扱える
;     - W (Unicode) 関数を優先して定義
;     - hsp3net 専用 (intptr / NSTRUCT は hsp3net の機能)
;
;   完全な user32 API カバレッジを目指したものではなく、現代的 Win32 API
;   を HSP から自然に書くためのサンプル + 将来の自動生成のターゲット
;   フォーマットの reference 実装。
;============================================================

#ifndef __user32_ext__
#define __user32_ext__

;------------------------------------------------------------
; 構造体 (#defstruct) — RECT / POINT / SIZE / MSG / WNDCLASSEXW など
;------------------------------------------------------------

#defstruct U32_RECT
    #field int left
    #field int top
    #field int right
    #field int bottom
#endstruct

#defstruct U32_POINT
    #field int x
    #field int y
#endstruct

#defstruct U32_SIZE
    #field int cx
    #field int cy
#endstruct

#defstruct U32_MSG
    #field intptr hwnd
    #field int    message
    #field intptr wParam
    #field intptr lParam
    #field int    time
    #field int    pt_x
    #field int    pt_y
    #field int    lPrivate
#endstruct

#defstruct U32_WNDCLASSEXW
    #field int    cbSize
    #field int    style
    #field intptr lpfnWndProc
    #field int    cbClsExtra
    #field int    cbWndExtra
    #field intptr hInstance
    #field intptr hIcon
    #field intptr hCursor
    #field intptr hbrBackground
    #field intptr lpszMenuName
    #field intptr lpszClassName
    #field intptr hIconSm
#endstruct

;------------------------------------------------------------
; ウィンドウ操作
;------------------------------------------------------------

#uselib "user32.dll"

; HWND CreateWindowExW(DWORD dwExStyle, LPCWSTR lpClassName, LPCWSTR lpWindowName,
;     DWORD dwStyle, int X, int Y, int nWidth, int nHeight, HWND hWndParent,
;     HMENU hMenu, HINSTANCE hInstance, LPVOID lpParam)
#cfunc CreateWindowExW "CreateWindowExW" int, wstr, wstr, int, int, int, int, int, intptr, intptr, intptr, intptr

; BOOL DestroyWindow(HWND)
#cfunc DestroyWindow "DestroyWindow" intptr

; BOOL ShowWindow(HWND, int nCmdShow)
#cfunc ShowWindow "ShowWindow" intptr, int

; BOOL UpdateWindow(HWND)
#cfunc UpdateWindow "UpdateWindow" intptr

; HWND GetParent(HWND)
#cfunc GetParent "GetParent" intptr

; HWND SetParent(HWND child, HWND newParent)
#cfunc SetParent "SetParent" intptr, intptr

; HWND GetForegroundWindow()
#cfunc GetForegroundWindow "GetForegroundWindow"

; BOOL SetForegroundWindow(HWND)
#cfunc SetForegroundWindow "SetForegroundWindow" intptr

; HWND GetActiveWindow()
#cfunc GetActiveWindow "GetActiveWindow"

; BOOL IsWindow(HWND)
#cfunc IsWindow "IsWindow" intptr

; BOOL IsWindowVisible(HWND)
#cfunc IsWindowVisible "IsWindowVisible" intptr

;------------------------------------------------------------
; ウィンドウ位置 / サイズ
;------------------------------------------------------------

; BOOL GetClientRect(HWND, LPRECT)
#cfunc GetClientRect "GetClientRect" intptr, var

; BOOL GetWindowRect(HWND, LPRECT)
#cfunc GetWindowRect "GetWindowRect" intptr, var

; BOOL SetWindowPos(HWND, HWND insertAfter, int X, int Y, int cx, int cy, UINT flags)
#cfunc SetWindowPos "SetWindowPos" intptr, intptr, int, int, int, int, int

; BOOL MoveWindow(HWND, int X, int Y, int nWidth, int nHeight, BOOL bRepaint)
#cfunc MoveWindow "MoveWindow" intptr, int, int, int, int, int

; BOOL ClientToScreen(HWND, LPPOINT)
#cfunc ClientToScreen "ClientToScreen" intptr, var

; BOOL ScreenToClient(HWND, LPPOINT)
#cfunc ScreenToClient "ScreenToClient" intptr, var

;------------------------------------------------------------
; ウィンドウ属性 (Long) — intptr で 32/64bit 両対応
;------------------------------------------------------------

; LONG_PTR GetWindowLongPtrW(HWND, int nIndex)
#cfunc GetWindowLongPtrW "GetWindowLongPtrW" intptr, int

; LONG_PTR SetWindowLongPtrW(HWND, int nIndex, LONG_PTR dwNewLong)
#cfunc SetWindowLongPtrW "SetWindowLongPtrW" intptr, int, intptr

; nIndex 定数
#define GWL_STYLE     -16
#define GWL_EXSTYLE   -20
#define GWL_USERDATA  -21
#define GWLP_WNDPROC  -4
#define GWLP_HINSTANCE -6
#define GWLP_HWNDPARENT -8
#define GWLP_ID       -12

;------------------------------------------------------------
; メッセージ
;------------------------------------------------------------

; LRESULT SendMessageW(HWND, UINT msg, WPARAM, LPARAM)
#cfunc SendMessageW "SendMessageW" intptr, int, intptr, intptr

; BOOL PostMessageW(HWND, UINT msg, WPARAM, LPARAM)
#cfunc PostMessageW "PostMessageW" intptr, int, intptr, intptr

; BOOL GetMessageW(LPMSG, HWND, UINT min, UINT max)
#cfunc GetMessageW "GetMessageW" var, intptr, int, int

; BOOL TranslateMessage(LPMSG)
#cfunc TranslateMessage "TranslateMessage" var

; LRESULT DispatchMessageW(LPMSG)
#cfunc DispatchMessageW "DispatchMessageW" var

;------------------------------------------------------------
; ダイアログ
;------------------------------------------------------------

; int MessageBoxW(HWND, LPCWSTR text, LPCWSTR caption, UINT type)
#cfunc MessageBoxW "MessageBoxW" intptr, wstr, wstr, int

; MessageBox 定数
#define MB_OK                  0x00000000
#define MB_OKCANCEL            0x00000001
#define MB_YESNO               0x00000004
#define MB_YESNOCANCEL         0x00000003
#define MB_ICONINFORMATION     0x00000040
#define MB_ICONWARNING         0x00000030
#define MB_ICONERROR           0x00000010
#define MB_ICONQUESTION        0x00000020

; MessageBox 戻り値
#define IDOK     1
#define IDCANCEL 2
#define IDYES    6
#define IDNO     7

;------------------------------------------------------------
; カーソル / アイコン
;------------------------------------------------------------

; HCURSOR LoadCursorW(HINSTANCE, LPCWSTR name)
#cfunc LoadCursorW "LoadCursorW" intptr, intptr

; HCURSOR SetCursor(HCURSOR)
#cfunc SetCursor "SetCursor" intptr

; BOOL GetCursorPos(LPPOINT)
#cfunc GetCursorPos "GetCursorPos" var

; BOOL SetCursorPos(int X, int Y)
#cfunc SetCursorPos "SetCursorPos" int, int

; 標準カーソル ID (LoadCursor の第 2 引数に MAKEINTRESOURCE 値で渡す)
#define IDC_ARROW    32512
#define IDC_IBEAM    32513
#define IDC_WAIT     32514
#define IDC_CROSS    32515
#define IDC_HAND     32649

;------------------------------------------------------------
; モニタ / システム情報
;------------------------------------------------------------

; int GetSystemMetrics(int)
#cfunc GetSystemMetrics "GetSystemMetrics" int

#define SM_CXSCREEN  0
#define SM_CYSCREEN  1
#define SM_CXFULLSCREEN 16
#define SM_CYFULLSCREEN 17

;------------------------------------------------------------
; キーボード
;------------------------------------------------------------

; SHORT GetAsyncKeyState(int vKey)
#cfunc GetAsyncKeyState "GetAsyncKeyState" int

; SHORT GetKeyState(int vKey)
#cfunc GetKeyState "GetKeyState" int

;------------------------------------------------------------
; ShowWindow nCmdShow 定数
;------------------------------------------------------------
#define SW_HIDE             0
#define SW_SHOWNORMAL       1
#define SW_SHOWMINIMIZED    2
#define SW_SHOWMAXIMIZED    3
#define SW_SHOWNOACTIVATE   4
#define SW_SHOW             5
#define SW_MINIMIZE         6
#define SW_SHOWNA           8
#define SW_RESTORE          9

;------------------------------------------------------------
; ウィンドウスタイル
;------------------------------------------------------------
#define WS_OVERLAPPED       0x00000000
#define WS_POPUP            0x80000000
#define WS_CHILD            0x40000000
#define WS_VISIBLE          0x10000000
#define WS_DISABLED         0x08000000
#define WS_BORDER           0x00800000
#define WS_DLGFRAME         0x00400000
#define WS_VSCROLL          0x00200000
#define WS_HSCROLL          0x00100000
#define WS_SYSMENU          0x00080000
#define WS_THICKFRAME       0x00040000
#define WS_MINIMIZEBOX      0x00020000
#define WS_MAXIMIZEBOX      0x00010000
#define WS_OVERLAPPEDWINDOW 0x00CF0000

#endif
