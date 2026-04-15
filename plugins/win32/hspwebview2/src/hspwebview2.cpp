//============================================================
//   hspwebview2.dll v2 — Microsoft Edge WebView2 plugin for IronHSP
//
//   HSP window (HWND) に WebView2 を貼り付けて HTML/JS を表示し、
//   HSP <-> JS の双方向メッセージングまで行う。
//
//   v2 (2026-04-15): OLDDLL $202 → typed #func 形式に全面移行。
//   HSPEXINFO callback は一切使わず、各 export 関数は普通の C 関数。
//
//   HSP API (全て typed #func):
//     wv2_init        "user_data_dir"
//     wv2_attach      hwnd, x, y, w, h              ; -> stat = view_id
//     wv2_detach      id
//     wv2_close       id                             ; detach と同義
//     wv2_navigate    id, "https://..."
//     wv2_navigate_to_string id, "<html>..."
//     wv2_resize      id, x, y, w, h
//     wv2_visible     id, 0/1
//     wv2_execute_script id, "js", var_buf, buf_size
//     wv2_post_message   id, "text"
//     wv2_poll_message   id, var_buf, buf_size       ; -> stat 1/0
//     wv2_add_script     id, "js"
//
//   実装メモ:
//     - WebView2 の非同期 API は Completed Handler COM オブジェクトを要求する。
//       MyHandler<IID> という薄い IUnknown 派生 template で lambda 受けに
//       まとめ、std::atomic<bool> done 付きメッセージポンプで同期待ちする。
//     - WebMessageReceived はメインスレッドで呼ばれるので、直接リング
//       バッファに push して wv2_poll_message で取り出す。
//     - 複数 view: 固定長 16。id は配列 index そのまま。
//     - ビルド時に WebView2.h が見つからない場合は HSPWV2_STUB が定義され、
//       DLL としては空の hsp 関数だけ出す (build 可 / 実行するとエラー)。
//============================================================

#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include <objbase.h>
#include <shlobj.h>

#include <string>
#include <vector>
#include <deque>
#include <atomic>
#include <memory>
#include <mutex>
#include <functional>
#include <cstdint>
#include <cstring>
#include <cstdio>

// ---- WebView2 SDK include (optional) ----
#if defined(__has_include)
#  if __has_include(<WebView2.h>)
#    include <WebView2.h>
#  elif __has_include("WebView2.h")
#    include "WebView2.h"
#  elif __has_include("webview2/include/WebView2.h")
#    include "webview2/include/WebView2.h"
#  elif __has_include("../third_party/webview2/include/WebView2.h")
#    include "../third_party/webview2/include/WebView2.h"
#  else
#    define HSPWV2_STUB 1
#  endif
#else
#  include <WebView2.h>
#endif

#define HSPWV2_EXPORT extern "C" __declspec(dllexport)

// ============================================================
// 共通 helpers
// ============================================================
namespace {

static std::wstring utf8_to_wide(const char* s)
{
    if (!s || !*s) return L"";
    int n = MultiByteToWideChar(CP_UTF8, 0, s, -1, nullptr, 0);
    if (n <= 0) return L"";
    std::wstring w(n - 1, L'\0');
    MultiByteToWideChar(CP_UTF8, 0, s, -1, w.data(), n);
    return w;
}

static std::string wide_to_utf8(const wchar_t* w)
{
    if (!w || !*w) return "";
    int n = WideCharToMultiByte(CP_UTF8, 0, w, -1, nullptr, 0, nullptr, nullptr);
    if (n <= 0) return "";
    std::string s(n - 1, '\0');
    WideCharToMultiByte(CP_UTF8, 0, w, -1, s.data(), n, nullptr, nullptr);
    return s;
}

static void copy_to_buf(const std::string& src, char* out, int out_size) {
    if (!out || out_size <= 0) return;
    int n = (int)src.size();
    if (n >= out_size) n = out_size - 1;
    if (n > 0) memcpy(out, src.data(), (size_t)n);
    out[n] = 0;
}

// HSP のメッセージポンプを止めずに done フラグを待つ
static bool pump_until(std::atomic<bool>& done, DWORD timeout_ms = 30000)
{
    DWORD start = GetTickCount();
    MSG msg;
    while (!done.load()) {
        if (GetTickCount() - start > timeout_ms) return false;
        if (PeekMessageW(&msg, nullptr, 0, 0, PM_REMOVE)) {
            TranslateMessage(&msg);
            DispatchMessageW(&msg);
        } else {
            MsgWaitForMultipleObjectsEx(0, nullptr, 10, QS_ALLINPUT, MWMO_INPUTAVAILABLE);
        }
    }
    return true;
}

} // namespace

#ifndef HSPWV2_STUB

// ============================================================
// WebView2 plugin main impl
// ============================================================

namespace {

constexpr int MAX_VIEWS = 16;

struct WebView2State {
    bool inuse = false;
    HWND parent = nullptr;
    ICoreWebView2Controller* controller = nullptr;
    ICoreWebView2*           view       = nullptr;
    EventRegistrationToken   msg_token  = {};
    std::deque<std::string>  msg_queue;   // JS -> HSP (UTF-8)
    std::mutex               msg_mutex;
};

static WebView2State g_views[MAX_VIEWS];

static ICoreWebView2Environment* g_env = nullptr;
static bool g_com_inited = false;
static bool g_env_inited = false;

// ---------- Generic completion handler template ----------
template <class TInterface, class TArg>
class GenericCompletedHandler : public TInterface {
    LONG ref_ = 1;
    std::function<HRESULT(HRESULT, TArg*)> cb_;
public:
    explicit GenericCompletedHandler(std::function<HRESULT(HRESULT, TArg*)> cb) : cb_(std::move(cb)) {}
    HRESULT STDMETHODCALLTYPE QueryInterface(REFIID riid, void** ppv) override {
        if (!ppv) return E_POINTER;
        if (riid == __uuidof(TInterface) || riid == IID_IUnknown) {
            *ppv = static_cast<TInterface*>(this);
            AddRef();
            return S_OK;
        }
        *ppv = nullptr;
        return E_NOINTERFACE;
    }
    ULONG STDMETHODCALLTYPE AddRef() override { return (ULONG)InterlockedIncrement(&ref_); }
    ULONG STDMETHODCALLTYPE Release() override {
        ULONG r = (ULONG)InterlockedDecrement(&ref_);
        if (r == 0) delete this;
        return r;
    }
    HRESULT STDMETHODCALLTYPE Invoke(HRESULT errorCode, TArg* result) override {
        if (cb_) return cb_(errorCode, result);
        return S_OK;
    }
};

class ExecuteScriptHandler
    : public ICoreWebView2ExecuteScriptCompletedHandler {
    LONG ref_ = 1;
    std::function<HRESULT(HRESULT, LPCWSTR)> cb_;
public:
    explicit ExecuteScriptHandler(std::function<HRESULT(HRESULT, LPCWSTR)> cb) : cb_(std::move(cb)) {}
    HRESULT STDMETHODCALLTYPE QueryInterface(REFIID riid, void** ppv) override {
        if (!ppv) return E_POINTER;
        if (riid == __uuidof(ICoreWebView2ExecuteScriptCompletedHandler) || riid == IID_IUnknown) {
            *ppv = static_cast<ICoreWebView2ExecuteScriptCompletedHandler*>(this);
            AddRef();
            return S_OK;
        }
        *ppv = nullptr;
        return E_NOINTERFACE;
    }
    ULONG STDMETHODCALLTYPE AddRef() override { return (ULONG)InterlockedIncrement(&ref_); }
    ULONG STDMETHODCALLTYPE Release() override {
        ULONG r = (ULONG)InterlockedDecrement(&ref_);
        if (r == 0) delete this;
        return r;
    }
    HRESULT STDMETHODCALLTYPE Invoke(HRESULT errorCode, LPCWSTR resultObjectAsJson) override {
        if (cb_) return cb_(errorCode, resultObjectAsJson);
        return S_OK;
    }
};

class AddScriptHandler
    : public ICoreWebView2AddScriptToExecuteOnDocumentCreatedCompletedHandler {
    LONG ref_ = 1;
    std::function<HRESULT(HRESULT, LPCWSTR)> cb_;
public:
    explicit AddScriptHandler(std::function<HRESULT(HRESULT, LPCWSTR)> cb) : cb_(std::move(cb)) {}
    HRESULT STDMETHODCALLTYPE QueryInterface(REFIID riid, void** ppv) override {
        if (!ppv) return E_POINTER;
        if (riid == __uuidof(ICoreWebView2AddScriptToExecuteOnDocumentCreatedCompletedHandler) || riid == IID_IUnknown) {
            *ppv = static_cast<ICoreWebView2AddScriptToExecuteOnDocumentCreatedCompletedHandler*>(this);
            AddRef();
            return S_OK;
        }
        *ppv = nullptr;
        return E_NOINTERFACE;
    }
    ULONG STDMETHODCALLTYPE AddRef() override { return (ULONG)InterlockedIncrement(&ref_); }
    ULONG STDMETHODCALLTYPE Release() override {
        ULONG r = (ULONG)InterlockedDecrement(&ref_);
        if (r == 0) delete this;
        return r;
    }
    HRESULT STDMETHODCALLTYPE Invoke(HRESULT errorCode, LPCWSTR id) override {
        if (cb_) return cb_(errorCode, id);
        return S_OK;
    }
};

class WebMessageHandler : public ICoreWebView2WebMessageReceivedEventHandler {
    LONG ref_ = 1;
    int slot_;
public:
    explicit WebMessageHandler(int slot) : slot_(slot) {}
    HRESULT STDMETHODCALLTYPE QueryInterface(REFIID riid, void** ppv) override {
        if (!ppv) return E_POINTER;
        if (riid == __uuidof(ICoreWebView2WebMessageReceivedEventHandler) || riid == IID_IUnknown) {
            *ppv = static_cast<ICoreWebView2WebMessageReceivedEventHandler*>(this);
            AddRef();
            return S_OK;
        }
        *ppv = nullptr;
        return E_NOINTERFACE;
    }
    ULONG STDMETHODCALLTYPE AddRef() override { return (ULONG)InterlockedIncrement(&ref_); }
    ULONG STDMETHODCALLTYPE Release() override {
        ULONG r = (ULONG)InterlockedDecrement(&ref_);
        if (r == 0) delete this;
        return r;
    }
    HRESULT STDMETHODCALLTYPE Invoke(
        ICoreWebView2* /*sender*/,
        ICoreWebView2WebMessageReceivedEventArgs* args) override
    {
        if (!args || slot_ < 0 || slot_ >= MAX_VIEWS) return S_OK;
        LPWSTR wmsg = nullptr;
        HRESULT hr = args->TryGetWebMessageAsString(&wmsg);
        if (FAILED(hr) || !wmsg) {
            if (wmsg) { CoTaskMemFree(wmsg); wmsg = nullptr; }
            hr = args->get_WebMessageAsJson(&wmsg);
        }
        if (SUCCEEDED(hr) && wmsg) {
            std::string u8 = wide_to_utf8(wmsg);
            WebView2State& st = g_views[slot_];
            std::lock_guard<std::mutex> lk(st.msg_mutex);
            st.msg_queue.push_back(std::move(u8));
            CoTaskMemFree(wmsg);
        }
        return S_OK;
    }
};

using EnvHandler = GenericCompletedHandler<
    ICoreWebView2CreateCoreWebView2EnvironmentCompletedHandler,
    ICoreWebView2Environment>;

using CtrlHandler = GenericCompletedHandler<
    ICoreWebView2CreateCoreWebView2ControllerCompletedHandler,
    ICoreWebView2Controller>;

// ============================================================
// Slot helpers
// ============================================================

static int alloc_slot() {
    for (int i = 0; i < MAX_VIEWS; i++) if (!g_views[i].inuse) return i;
    return -1;
}

static bool valid_slot(int id) {
    return id >= 0 && id < MAX_VIEWS && g_views[id].inuse;
}

static void free_slot(int id) {
    if (id < 0 || id >= MAX_VIEWS) return;
    WebView2State& st = g_views[id];
    if (st.view && st.msg_token.value != 0) {
        st.view->remove_WebMessageReceived(st.msg_token);
        st.msg_token = {};
    }
    if (st.controller) {
        st.controller->Close();
        st.controller->Release();
        st.controller = nullptr;
    }
    if (st.view) {
        st.view->Release();
        st.view = nullptr;
    }
    {
        std::lock_guard<std::mutex> lk(st.msg_mutex);
        st.msg_queue.clear();
    }
    st.parent = nullptr;
    st.inuse = false;
}

static void ensure_com_init()
{
    if (!g_com_inited) {
        HRESULT hr = CoInitializeEx(nullptr, COINIT_APARTMENTTHREADED);
        if (SUCCEEDED(hr) || hr == RPC_E_CHANGED_MODE || hr == S_FALSE) {
            g_com_inited = true;
        }
    }
}

} // namespace

// ============================================================
// HSP exports (typed #func 新形式)
// ============================================================

// wv2_init "user_data_dir"
HSPWV2_EXPORT int __stdcall wv2_init(const char* udir_u8)
{
    std::wstring udir = utf8_to_wide(udir_u8);
    if (udir.empty()) {
        wchar_t buf[MAX_PATH] = {};
        if (SUCCEEDED(SHGetFolderPathW(nullptr, CSIDL_LOCAL_APPDATA, nullptr, 0, buf))) {
            udir = std::wstring(buf) + L"\\IronHSP\\WebView2";
            CreateDirectoryW((std::wstring(buf) + L"\\IronHSP").c_str(), nullptr);
            CreateDirectoryW(udir.c_str(), nullptr);
        }
    }

    ensure_com_init();

    if (g_env_inited && g_env) return 0;

    std::atomic<bool> done{false};
    HRESULT invoke_hr = S_OK;
    ICoreWebView2Environment* env_out = nullptr;

    auto* handler = new EnvHandler(
        [&](HRESULT hr, ICoreWebView2Environment* env) -> HRESULT {
            invoke_hr = hr;
            if (SUCCEEDED(hr) && env) {
                env->AddRef();
                env_out = env;
            }
            done.store(true);
            return S_OK;
        });

    HRESULT hr = CreateCoreWebView2EnvironmentWithOptions(
        nullptr,
        udir.empty() ? nullptr : udir.c_str(),
        nullptr,
        handler);
    handler->Release();

    if (FAILED(hr)) return -1;
    if (!pump_until(done)) return -2;
    if (FAILED(invoke_hr) || !env_out) return -3;

    g_env = env_out;
    g_env_inited = true;
    return 0;
}

// wv2_attach hwnd, x, y, w, h  -> stat = id
HSPWV2_EXPORT int __stdcall wv2_attach(int hwnd_i, int x, int y, int w, int h)
{
    if (!g_env_inited || !g_env) return -1;
    HWND parent = (HWND)(LONG_PTR)hwnd_i;
    if (!IsWindow(parent)) return -2;

    int slot = alloc_slot();
    if (slot < 0) return -3;

    WebView2State& st = g_views[slot];
    st.inuse = true;
    st.parent = parent;

    std::atomic<bool> done{false};
    HRESULT invoke_hr = S_OK;
    ICoreWebView2Controller* ctrl_out = nullptr;

    auto* handler = new CtrlHandler(
        [&](HRESULT hr, ICoreWebView2Controller* ctrl) -> HRESULT {
            invoke_hr = hr;
            if (SUCCEEDED(hr) && ctrl) {
                ctrl->AddRef();
                ctrl_out = ctrl;
            }
            done.store(true);
            return S_OK;
        });

    HRESULT hr = g_env->CreateCoreWebView2Controller(parent, handler);
    handler->Release();

    if (FAILED(hr)) { free_slot(slot); return -4; }
    if (!pump_until(done)) { free_slot(slot); return -5; }
    if (FAILED(invoke_hr) || !ctrl_out) { free_slot(slot); return -6; }

    st.controller = ctrl_out;
    hr = ctrl_out->get_CoreWebView2(&st.view);
    if (FAILED(hr) || !st.view) { free_slot(slot); return -7; }

    RECT rc = { x, y, x + w, y + h };
    if (w <= 0 || h <= 0) {
        GetClientRect(parent, &rc);
    }
    st.controller->put_Bounds(rc);
    st.controller->put_IsVisible(TRUE);

    auto* msgh = new WebMessageHandler(slot);
    hr = st.view->add_WebMessageReceived(msgh, &st.msg_token);
    msgh->Release();
    (void)hr;

    return slot;
}

HSPWV2_EXPORT int __stdcall wv2_detach(int id)
{
    if (!valid_slot(id)) return -1;
    free_slot(id);
    return 0;
}

HSPWV2_EXPORT int __stdcall wv2_close(int id)
{
    return wv2_detach(id);
}

HSPWV2_EXPORT int __stdcall wv2_navigate(int id, const char* url)
{
    if (!valid_slot(id) || !g_views[id].view) return -1;
    std::wstring wurl = utf8_to_wide(url);
    HRESULT hr = g_views[id].view->Navigate(wurl.c_str());
    return SUCCEEDED(hr) ? 0 : -2;
}

HSPWV2_EXPORT int __stdcall wv2_navigate_to_string(int id, const char* html)
{
    if (!valid_slot(id) || !g_views[id].view) return -1;
    std::wstring whtml = utf8_to_wide(html);
    HRESULT hr = g_views[id].view->NavigateToString(whtml.c_str());
    return SUCCEEDED(hr) ? 0 : -2;
}

HSPWV2_EXPORT int __stdcall wv2_resize(int id, int x, int y, int w, int h)
{
    if (!valid_slot(id) || !g_views[id].controller) return -1;
    RECT rc = { x, y, x + w, y + h };
    g_views[id].controller->put_Bounds(rc);
    return 0;
}

HSPWV2_EXPORT int __stdcall wv2_visible(int id, int v)
{
    if (!valid_slot(id) || !g_views[id].controller) return -1;
    g_views[id].controller->put_IsVisible(v ? TRUE : FALSE);
    return 0;
}

// wv2_execute_script id, "js", var_buf, buf_size
HSPWV2_EXPORT int __stdcall wv2_execute_script(int id, const char* js, char* out_buf, int out_size)
{
    if (out_buf && out_size > 0) out_buf[0] = 0;
    if (!valid_slot(id) || !g_views[id].view) return -1;

    std::wstring wjs = utf8_to_wide(js);
    std::atomic<bool> done{false};
    std::string result;
    HRESULT invoke_hr = S_OK;

    auto* handler = new ExecuteScriptHandler(
        [&](HRESULT hr, LPCWSTR json) -> HRESULT {
            invoke_hr = hr;
            if (SUCCEEDED(hr) && json) result = wide_to_utf8(json);
            done.store(true);
            return S_OK;
        });

    HRESULT hr = g_views[id].view->ExecuteScript(wjs.c_str(), handler);
    handler->Release();
    if (FAILED(hr)) return -2;
    if (!pump_until(done)) return -3;
    if (FAILED(invoke_hr)) return -4;

    copy_to_buf(result, out_buf, out_size);
    return 0;
}

HSPWV2_EXPORT int __stdcall wv2_post_message(int id, const char* text)
{
    if (!valid_slot(id) || !g_views[id].view) return -1;
    std::wstring w = utf8_to_wide(text);
    HRESULT hr = g_views[id].view->PostWebMessageAsString(w.c_str());
    return SUCCEEDED(hr) ? 0 : -2;
}

// wv2_poll_message id, var_buf, buf_size  -> 1 = 取得 / 0 = 空
HSPWV2_EXPORT int __stdcall wv2_poll_message(int id, char* out_buf, int out_size)
{
    if (out_buf && out_size > 0) out_buf[0] = 0;
    if (!valid_slot(id)) return 0;

    // メインスレッドで呼ばれるので、直前に COM callback が飛ぶよう軽くポンプ
    MSG msg;
    while (PeekMessageW(&msg, nullptr, 0, 0, PM_REMOVE)) {
        TranslateMessage(&msg);
        DispatchMessageW(&msg);
    }

    WebView2State& st = g_views[id];
    std::unique_lock<std::mutex> lk(st.msg_mutex);
    if (st.msg_queue.empty()) {
        return 0;
    }
    std::string s = std::move(st.msg_queue.front());
    st.msg_queue.pop_front();
    lk.unlock();
    copy_to_buf(s, out_buf, out_size);
    return 1;
}

HSPWV2_EXPORT int __stdcall wv2_add_script(int id, const char* js)
{
    if (!valid_slot(id) || !g_views[id].view) return -1;

    std::wstring wjs = utf8_to_wide(js);
    std::atomic<bool> done{false};
    HRESULT invoke_hr = S_OK;

    auto* handler = new AddScriptHandler(
        [&](HRESULT hr, LPCWSTR /*id*/) -> HRESULT {
            invoke_hr = hr;
            done.store(true);
            return S_OK;
        });

    HRESULT hr = g_views[id].view->AddScriptToExecuteOnDocumentCreated(wjs.c_str(), handler);
    handler->Release();
    if (FAILED(hr)) return -2;
    if (!pump_until(done)) return -3;
    return SUCCEEDED(invoke_hr) ? 0 : -4;
}

#else // HSPWV2_STUB

// WebView2 SDK 不在時の stub。ビルドだけ通せるよう、全関数はエラー返し。
HSPWV2_EXPORT int __stdcall wv2_init(const char*) { return -1; }
HSPWV2_EXPORT int __stdcall wv2_attach(int, int, int, int, int) { return -1; }
HSPWV2_EXPORT int __stdcall wv2_detach(int) { return -1; }
HSPWV2_EXPORT int __stdcall wv2_close(int) { return -1; }
HSPWV2_EXPORT int __stdcall wv2_navigate(int, const char*) { return -1; }
HSPWV2_EXPORT int __stdcall wv2_navigate_to_string(int, const char*) { return -1; }
HSPWV2_EXPORT int __stdcall wv2_resize(int, int, int, int, int) { return -1; }
HSPWV2_EXPORT int __stdcall wv2_visible(int, int) { return -1; }
HSPWV2_EXPORT int __stdcall wv2_execute_script(int, const char*, char*, int) { return -1; }
HSPWV2_EXPORT int __stdcall wv2_post_message(int, const char*) { return -1; }
HSPWV2_EXPORT int __stdcall wv2_poll_message(int, char*, int) { return 0; }
HSPWV2_EXPORT int __stdcall wv2_add_script(int, const char*) { return -1; }

#endif // HSPWV2_STUB

// DllMain
BOOL WINAPI DllMain(HINSTANCE, DWORD reason, LPVOID)
{
    if (reason == DLL_PROCESS_DETACH) {
#ifndef HSPWV2_STUB
        for (int i = 0; i < MAX_VIEWS; i++) free_slot(i);
        if (g_env) { g_env->Release(); g_env = nullptr; }
        g_env_inited = false;
        if (g_com_inited) { CoUninitialize(); g_com_inited = false; }
#endif
    }
    return TRUE;
}
