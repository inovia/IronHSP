; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    kernel32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __kernel32_gen2_as__
#define __kernel32_gen2_as__

;--- structs ---
#defstruct MSG
    #field intptr hwnd
    #field int message
    #field intptr wParam
    #field intptr lParam
    #field int time
#endstruct

#defstruct RECT
    #field int left
    #field int top
    #field int right
    #field int bottom
#endstruct

;--- enums / constants ---
; MESSAGEBOX_RESULT
#define IDOK  0x1
#define IDCANCEL  0x2
#define IDABORT  0x3
#define IDRETRY  0x4
#define IDIGNORE  0x5
#define IDYES  0x6
#define IDNO  0x7
#define IDCLOSE  0x8
#define IDHELP  0x9
#define IDTRYAGAIN  0xa
#define IDCONTINUE  0xb
#define IDASYNC  0x7d01
#define IDTIMEOUT  0x7d00

; MESSAGEBOX_STYLE
#define MB_ABORTRETRYIGNORE  0x2
#define MB_CANCELTRYCONTINUE  0x6
#define MB_HELP  0x4000
#define MB_OK  0x0
#define MB_OKCANCEL  0x1
#define MB_RETRYCANCEL  0x5
#define MB_YESNO  0x4
#define MB_YESNOCANCEL  0x3
#define MB_ICONHAND  0x10
#define MB_ICONQUESTION  0x20
#define MB_ICONEXCLAMATION  0x30
#define MB_ICONASTERISK  0x40
#define MB_USERICON  0x80
#define MB_ICONWARNING  0x30
#define MB_ICONERROR  0x10
#define MB_ICONINFORMATION  0x40
#define MB_ICONSTOP  0x10
#define MB_DEFBUTTON1  0x0
#define MB_DEFBUTTON2  0x100
#define MB_DEFBUTTON3  0x200
#define MB_DEFBUTTON4  0x300
#define MB_APPLMODAL  0x0
#define MB_SYSTEMMODAL  0x1000
#define MB_TASKMODAL  0x2000
#define MB_NOFOCUS  0x8000
#define MB_SETFOREGROUND  0x10000
#define MB_DEFAULT_DESKTOP_ONLY  0x20000
#define MB_TOPMOST  0x40000
#define MB_RIGHT  0x80000
#define MB_RTLREADING  0x100000
#define MB_SERVICE_NOTIFICATION  0x200000
#define MB_SERVICE_NOTIFICATION_NT3X  0x40000
#define MB_TYPEMASK  0xf
#define MB_ICONMASK  0xf0
#define MB_DEFMASK  0xf00
#define MB_MODEMASK  0x3000
#define MB_MISCMASK  0xc000

; SET_WINDOW_POS_FLAGS
#define SWP_ASYNCWINDOWPOS  0x4000
#define SWP_DEFERERASE  0x2000
#define SWP_DRAWFRAME  0x20
#define SWP_FRAMECHANGED  0x20
#define SWP_HIDEWINDOW  0x80
#define SWP_NOACTIVATE  0x10
#define SWP_NOCOPYBITS  0x100
#define SWP_NOMOVE  0x2
#define SWP_NOOWNERZORDER  0x200
#define SWP_NOREDRAW  0x8
#define SWP_NOREPOSITION  0x200
#define SWP_NOSENDCHANGING  0x400
#define SWP_NOSIZE  0x1
#define SWP_NOZORDER  0x4
#define SWP_SHOWWINDOW  0x40

; SHOW_WINDOW_CMD
#define SW_HIDE  0x0
#define SW_SHOWNORMAL  0x1
#define SW_NORMAL  0x1
#define SW_SHOWMINIMIZED  0x2
#define SW_SHOWMAXIMIZED  0x3
#define SW_MAXIMIZE  0x3
#define SW_SHOWNOACTIVATE  0x4
#define SW_SHOW  0x5
#define SW_MINIMIZE  0x6
#define SW_SHOWMINNOACTIVE  0x7
#define SW_SHOWNA  0x8
#define SW_RESTORE  0x9
#define SW_SHOWDEFAULT  0xa
#define SW_FORCEMINIMIZE  0xb
#define SW_MAX  0xb

; SYSTEM_METRICS_INDEX
#define SM_ARRANGE  0x38
#define SM_CLEANBOOT  0x43
#define SM_CMONITORS  0x50
#define SM_CMOUSEBUTTONS  0x2b
#define SM_CONVERTIBLESLATEMODE  0x2003
#define SM_CXBORDER  0x5
#define SM_CXCURSOR  0xd
#define SM_CXDLGFRAME  0x7
#define SM_CXDOUBLECLK  0x24
#define SM_CXDRAG  0x44
#define SM_CXEDGE  0x2d
#define SM_CXFIXEDFRAME  0x7
#define SM_CXFOCUSBORDER  0x53
#define SM_CXFRAME  0x20
#define SM_CXFULLSCREEN  0x10
#define SM_CXHSCROLL  0x15
#define SM_CXHTHUMB  0xa
#define SM_CXICON  0xb
#define SM_CXICONSPACING  0x26
#define SM_CXMAXIMIZED  0x3d
#define SM_CXMAXTRACK  0x3b
#define SM_CXMENUCHECK  0x47
#define SM_CXMENUSIZE  0x36
#define SM_CXMIN  0x1c
#define SM_CXMINIMIZED  0x39
#define SM_CXMINSPACING  0x2f
#define SM_CXMINTRACK  0x22
#define SM_CXPADDEDBORDER  0x5c
#define SM_CXSCREEN  0x0
#define SM_CXSIZE  0x1e
#define SM_CXSIZEFRAME  0x20
#define SM_CXSMICON  0x31
#define SM_CXSMSIZE  0x34
#define SM_CXVIRTUALSCREEN  0x4e
#define SM_CXVSCROLL  0x2
#define SM_CYBORDER  0x6
#define SM_CYCAPTION  0x4
#define SM_CYCURSOR  0xe
#define SM_CYDLGFRAME  0x8
#define SM_CYDOUBLECLK  0x25
#define SM_CYDRAG  0x45
#define SM_CYEDGE  0x2e
#define SM_CYFIXEDFRAME  0x8
#define SM_CYFOCUSBORDER  0x54
#define SM_CYFRAME  0x21
#define SM_CYFULLSCREEN  0x11
#define SM_CYHSCROLL  0x3
#define SM_CYICON  0xc
#define SM_CYICONSPACING  0x27
#define SM_CYKANJIWINDOW  0x12
#define SM_CYMAXIMIZED  0x3e
#define SM_CYMAXTRACK  0x3c
#define SM_CYMENU  0xf
#define SM_CYMENUCHECK  0x48
#define SM_CYMENUSIZE  0x37
#define SM_CYMIN  0x1d
#define SM_CYMINIMIZED  0x3a
#define SM_CYMINSPACING  0x30
#define SM_CYMINTRACK  0x23
#define SM_CYSCREEN  0x1
#define SM_CYSIZE  0x1f
#define SM_CYSIZEFRAME  0x21
#define SM_CYSMCAPTION  0x33
#define SM_CYSMICON  0x32
#define SM_CYSMSIZE  0x35
#define SM_CYVIRTUALSCREEN  0x4f
#define SM_CYVSCROLL  0x14
#define SM_CYVTHUMB  0x9
#define SM_DBCSENABLED  0x2a
#define SM_DEBUG  0x16
#define SM_DIGITIZER  0x5e
#define SM_IMMENABLED  0x52
#define SM_MAXIMUMTOUCHES  0x5f
#define SM_MEDIACENTER  0x57
#define SM_MENUDROPALIGNMENT  0x28
#define SM_MIDEASTENABLED  0x4a
#define SM_MOUSEPRESENT  0x13
#define SM_MOUSEHORIZONTALWHEELPRESENT  0x5b
#define SM_MOUSEWHEELPRESENT  0x4b
#define SM_NETWORK  0x3f
#define SM_PENWINDOWS  0x29
#define SM_REMOTECONTROL  0x2001
#define SM_REMOTESESSION  0x1000
#define SM_SAMEDISPLAYFORMAT  0x51
#define SM_SECURE  0x2c
#define SM_SERVERR2  0x59
#define SM_SHOWSOUNDS  0x46
#define SM_SHUTTINGDOWN  0x2000
#define SM_SLOWMACHINE  0x49
#define SM_STARTER  0x58
#define SM_SWAPBUTTON  0x17
#define SM_SYSTEMDOCKED  0x2004
#define SM_TABLETPC  0x56
#define SM_XVIRTUALSCREEN  0x4c
#define SM_YVIRTUALSCREEN  0x4d

; WINDOW_EX_STYLE
#define WS_EX_DLGMODALFRAME  0x1
#define WS_EX_NOPARENTNOTIFY  0x4
#define WS_EX_TOPMOST  0x8
#define WS_EX_ACCEPTFILES  0x10
#define WS_EX_TRANSPARENT  0x20
#define WS_EX_MDICHILD  0x40
#define WS_EX_TOOLWINDOW  0x80
#define WS_EX_WINDOWEDGE  0x100
#define WS_EX_CLIENTEDGE  0x200
#define WS_EX_CONTEXTHELP  0x400
#define WS_EX_RIGHT  0x1000
#define WS_EX_LEFT  0x0
#define WS_EX_RTLREADING  0x2000
#define WS_EX_LTRREADING  0x0
#define WS_EX_LEFTSCROLLBAR  0x4000
#define WS_EX_RIGHTSCROLLBAR  0x0
#define WS_EX_CONTROLPARENT  0x10000
#define WS_EX_STATICEDGE  0x20000
#define WS_EX_APPWINDOW  0x40000
#define WS_EX_OVERLAPPEDWINDOW  0x300
#define WS_EX_PALETTEWINDOW  0x188
#define WS_EX_LAYERED  0x80000
#define WS_EX_NOINHERITLAYOUT  0x100000
#define WS_EX_NOREDIRECTIONBITMAP  0x200000
#define WS_EX_LAYOUTRTL  0x400000
#define WS_EX_COMPOSITED  0x2000000
#define WS_EX_NOACTIVATE  0x8000000

; WINDOW_STYLE
#define WS_OVERLAPPED  0x0
#define WS_POPUP  0x80000000
#define WS_CHILD  0x40000000
#define WS_MINIMIZE  0x20000000
#define WS_VISIBLE  0x10000000
#define WS_DISABLED  0x8000000
#define WS_CLIPSIBLINGS  0x4000000
#define WS_CLIPCHILDREN  0x2000000
#define WS_MAXIMIZE  0x1000000
#define WS_CAPTION  0xc00000
#define WS_BORDER  0x800000
#define WS_DLGFRAME  0x400000
#define WS_VSCROLL  0x200000
#define WS_HSCROLL  0x100000
#define WS_SYSMENU  0x80000
#define WS_THICKFRAME  0x40000
#define WS_GROUP  0x20000
#define WS_TABSTOP  0x10000
#define WS_MINIMIZEBOX  0x20000
#define WS_MAXIMIZEBOX  0x10000
#define WS_TILED  0x0
#define WS_ICONIC  0x20000000
#define WS_SIZEBOX  0x40000
#define WS_TILEDWINDOW  0xcf0000
#define WS_OVERLAPPEDWINDOW  0xcf0000
#define WS_POPUPWINDOW  0x80880000
#define WS_CHILDWINDOW  0x40000000
#define WS_ACTIVECAPTION  0x1

;--- functions ---
#uselib "kernel32.dll"
; winmdroot.Foundation.BOOL CloseHandle(winmdroot.Foundation.HANDLE hObject)
#cfunc CloseHandle "CloseHandle" intptr

; winmdroot.Foundation.BOOL FreeLibrary(winmdroot.Foundation.HMODULE hLibModule)
#cfunc FreeLibrary "FreeLibrary" intptr

#endif
