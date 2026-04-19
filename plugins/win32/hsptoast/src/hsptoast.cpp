//============================================================
//   hsptoast.dll — Windows toast-style notifications for HSP
//
//   Shell_NotifyIconW + NIIF_INFO で Windows 10/11 のトースト通知 (左下
//   サウンド付き) を出す薄いラッパ。PowerShell 不要、WinRT 不要。
//   タイトル/本文は UTF-8 で受け取って UTF-16 に変換し、W API に渡す。
//
//   エクスポート (新形式 typed #func):
//     int  hsptoast_show_info  (const char* title, const char* body)
//     int  hsptoast_show_warn  (const char* title, const char* body)
//     int  hsptoast_show_error (const char* title, const char* body)
//     int  hsptoast_clear      ()
//============================================================

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <shellapi.h>
#include <string>
#include <vector>

#pragma comment(lib, "shell32.lib")
#pragma comment(lib, "user32.lib")
#pragma comment(lib, "kernel32.lib")

#define HSPTOAST_EXPORT extern "C" __declspec(dllexport)

// ------------------------------------------------------------
// Internals
// ------------------------------------------------------------
static const UINT  kTrayId     = 0xC7F00001;   // 適当な一意 ID
static const WCHAR kClassName[] = L"IronHspToastHiddenWnd";

static HWND  g_hwnd      = nullptr;
static HICON g_info_icon = nullptr;
static HICON g_warn_icon = nullptr;
static HICON g_err_icon  = nullptr;
static bool  g_added     = false;

static std::wstring U8toU16(const char* s)
{
    if (!s) return std::wstring();
    int n = MultiByteToWideChar(CP_UTF8, 0, s, -1, nullptr, 0);
    if (n <= 0) return std::wstring();
    std::wstring w((size_t)n - 1, L'\0');
    MultiByteToWideChar(CP_UTF8, 0, s, -1, &w[0], n);
    return w;
}

static LRESULT CALLBACK HiddenWndProc(HWND h, UINT m, WPARAM w, LPARAM l)
{
    return DefWindowProcW(h, m, w, l);
}

static HWND GetHiddenWnd()
{
    if (g_hwnd) return g_hwnd;
    WNDCLASSEXW wc = { sizeof(wc) };
    wc.lpfnWndProc   = HiddenWndProc;
    wc.hInstance     = GetModuleHandleW(nullptr);
    wc.lpszClassName = kClassName;
    RegisterClassExW(&wc);   // 失敗しても CreateWindowExW が "class already exists" で通る
    g_hwnd = CreateWindowExW(0, kClassName, L"IronHspToast", 0,
                              0, 0, 0, 0, HWND_MESSAGE, nullptr,
                              wc.hInstance, nullptr);
    g_info_icon = LoadIconW(nullptr, IDI_INFORMATION);
    g_warn_icon = LoadIconW(nullptr, IDI_WARNING);
    g_err_icon  = LoadIconW(nullptr, IDI_ERROR);
    return g_hwnd;
}

static int ShowToast(const char* title, const char* body, DWORD dwInfoFlags, HICON balloonIcon)
{
    HWND hwnd = GetHiddenWnd();
    if (!hwnd) return -1;

    std::wstring wtitle = U8toU16(title ? title : "");
    std::wstring wbody  = U8toU16(body  ? body  : "");

    NOTIFYICONDATAW nid = {};
    nid.cbSize = sizeof(nid);
    nid.hWnd   = hwnd;
    nid.uID    = kTrayId;
    nid.uFlags = NIF_ICON | NIF_INFO | NIF_TIP;
    nid.hIcon  = g_info_icon;
    lstrcpynW(nid.szTip, L"IronHSP", ARRAYSIZE(nid.szTip));
    lstrcpynW(nid.szInfoTitle, wtitle.c_str(), ARRAYSIZE(nid.szInfoTitle));
    lstrcpynW(nid.szInfo,      wbody.c_str(),  ARRAYSIZE(nid.szInfo));
    nid.dwInfoFlags = dwInfoFlags | NIIF_USER | NIIF_LARGE_ICON;
    nid.hBalloonIcon = balloonIcon;

    BOOL ok;
    if (!g_added) {
        ok = Shell_NotifyIconW(NIM_ADD, &nid);
        if (ok) g_added = true;
    } else {
        ok = Shell_NotifyIconW(NIM_MODIFY, &nid);
    }
    return ok ? 0 : -1;
}

// ------------------------------------------------------------
// Exports
// ------------------------------------------------------------
HSPTOAST_EXPORT int __stdcall hsptoast_show_info(const char* title, const char* body)
{
    return ShowToast(title, body, NIIF_INFO, g_info_icon);
}

HSPTOAST_EXPORT int __stdcall hsptoast_show_warn(const char* title, const char* body)
{
    return ShowToast(title, body, NIIF_WARNING, g_warn_icon);
}

HSPTOAST_EXPORT int __stdcall hsptoast_show_error(const char* title, const char* body)
{
    return ShowToast(title, body, NIIF_ERROR, g_err_icon);
}

HSPTOAST_EXPORT int __stdcall hsptoast_clear()
{
    if (!g_added) return 0;
    NOTIFYICONDATAW nid = {};
    nid.cbSize = sizeof(nid);
    nid.hWnd   = g_hwnd;
    nid.uID    = kTrayId;
    BOOL ok = Shell_NotifyIconW(NIM_DELETE, &nid);
    if (ok) g_added = false;
    return ok ? 0 : -1;
}

// ------------------------------------------------------------
// DllMain: プロセス終了時に通知を確実に消す
// ------------------------------------------------------------
BOOL WINAPI DllMain(HINSTANCE, DWORD reason, LPVOID)
{
    if (reason == DLL_PROCESS_DETACH) {
        hsptoast_clear();
        if (g_hwnd) { DestroyWindow(g_hwnd); g_hwnd = nullptr; }
    }
    return TRUE;
}
