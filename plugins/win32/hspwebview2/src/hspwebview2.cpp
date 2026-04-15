//============================================================
//   hspwebview2.dll — Microsoft Edge WebView2 plugin for IronHSP
//
//   HSP window (HWND) に WebView2 を貼り付けて HTML/JS を表示し、
//   HSP <-> JS の双方向メッセージングまで行う。
//
//   前提:
//     - Microsoft Edge WebView2 Runtime (evergreen) が PC に
//       インストール済みであること (Win10/11 なら通常入っている)。
//     - 配布時: WebView2Loader.dll を DLL と同じディレクトリに
//       配置する (redist/README.md 参照)。
//     - ビルド時: Microsoft.Web.WebView2 SDK (WebView2.h 等) を
//       third_party/webview2/include/ に配置 (third_party/README.md)。
//
//   HSP API (全て #func global、OLDDLL $202):
//     wv2_init        "user_data_dir"
//     wv2_attach      hwnd, x, y, w, h           ; -> stat = view_id (>=0) / 負値 err
//     wv2_detach      id
//     wv2_close       id                          ; detach と同義
//     wv2_navigate    id, "https://..."
//     wv2_navigate_to_string id, "<html>..."
//     wv2_resize      id, x, y, w, h
//     wv2_visible     id, 0/1
//     wv2_execute_script id, "js_code", var_str   ; 同期で結果 JSON を var_str に
//     wv2_post_message   id, "text"               ; HSP -> JS
//     wv2_poll_message   id, var_str              ; -> stat 1=取得 0=空
//     wv2_add_script     id, "js"                 ; init script 注入
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

// ---- HSP SDK ----
#ifndef HSPWIN
#define HSPWIN
#endif
#if defined(_WIN64) && !defined(HSP64)
#define HSP64
#endif
#pragma warning(push)
#pragma warning(disable: 4819)
#include "../../../../hsp3/hsp3debug.h"
#include "../../../../hsp3/hsp3struct.h"
#include "../../../../hsp3/hspwnd.h"
#pragma warning(pop)

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
// HSP plugin helpers (hspjson と同じパターン)
// ============================================================

namespace {

HSPEXINFO* g_hei = nullptr;
inline void set_hei(HSPEXINFO* hei) { g_hei = hei; }
inline int    getint() { return g_hei->HspFunc_prm_geti(); }
inline char*  getstr() { return g_hei->HspFunc_prm_gets(); }
inline double getdbl() { return g_hei->HspFunc_prm_getd(); }

static void write_str_to_var(const std::string& s)
{
    PVal* pv = nullptr;
    APTR a = g_hei->HspFunc_prm_getva(&pv);
    if (!pv) return;
    if (pv->flag != HSPVAR_FLAG_STR) return;
    pv->offset = a;
    HspVarProc* proc = g_hei->HspFunc_getproc(pv->flag);
    proc->Set(pv, proc->GetPtr(pv), (void*)s.c_str());
}

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
            // ワーカー側の APC / COM STA callback を進めるために軽く待つ
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
//
// WebView2 の各種 *CompletedHandler は
//   HRESULT Invoke(HRESULT errorCode, T* result)
// という一貫した形をしている。
// T が nullptr のものもある (navigation completed 等) が本プラグインの
// completion handler 用途では常に "(HRESULT, T*)" で OK。

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

// ExecuteScriptCompletedHandler は Invoke(HRESULT, LPCWSTR) シグネチャで
// TArg* スタイルに収まらないので個別実装。
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

// AddScriptToExecuteOnDocumentCreatedCompletedHandler:
//   Invoke(HRESULT, LPCWSTR id)
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

// WebMessageReceived event handler (イベントハンドラなので completion 系とは別)
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
        // try string first, fallback to WebMessageAsJson
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

// ---------- CreateCoreWebView2EnvironmentCompletedHandler ----------
// Invoke(HRESULT, ICoreWebView2Environment*)
using EnvHandler = GenericCompletedHandler<
    ICoreWebView2CreateCoreWebView2EnvironmentCompletedHandler,
    ICoreWebView2Environment>;

// ---------- CreateCoreWebView2ControllerCompletedHandler ----------
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
// HSP exports
// ============================================================

// wv2_init "user_data_dir"
HSPWV2_EXPORT BOOL WINAPI wv2_init(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);

    const char* udir_u8 = getstr();
    std::wstring udir = utf8_to_wide(udir_u8);
    if (udir.empty()) {
        // 既定: %LOCALAPPDATA%\IronHSP\WebView2
        wchar_t buf[MAX_PATH] = {};
        if (SUCCEEDED(SHGetFolderPathW(nullptr, CSIDL_LOCAL_APPDATA, nullptr, 0, buf))) {
            udir = std::wstring(buf) + L"\\IronHSP\\WebView2";
            CreateDirectoryW((std::wstring(buf) + L"\\IronHSP").c_str(), nullptr);
            CreateDirectoryW(udir.c_str(), nullptr);
        }
    }

    ensure_com_init();

    if (g_env_inited && g_env) return 0; // 再 init は idempotent

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
HSPWV2_EXPORT BOOL WINAPI wv2_attach(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);

    int hwnd_i = getint();
    int x = getint();
    int y = getint();
    int w = getint();
    int h = getint();

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

    // bounds
    RECT rc = { x, y, x + w, y + h };
    if (w <= 0 || h <= 0) {
        GetClientRect(parent, &rc);
    }
    st.controller->put_Bounds(rc);
    st.controller->put_IsVisible(TRUE);

    // WebMessageReceived ハンドラ登録
    auto* msgh = new WebMessageHandler(slot);
    hr = st.view->add_WebMessageReceived(msgh, &st.msg_token);
    msgh->Release();
    (void)hr;

    return slot;
}

// wv2_detach id / wv2_close id
HSPWV2_EXPORT BOOL WINAPI wv2_detach(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int id = getint();
    if (!valid_slot(id)) return -1;
    free_slot(id);
    return 0;
}

HSPWV2_EXPORT BOOL WINAPI wv2_close(HSPEXINFO* hei, int p1, int p2, int p3)
{
    return wv2_detach(hei, p1, p2, p3);
}

// wv2_navigate id, "url"
HSPWV2_EXPORT BOOL WINAPI wv2_navigate(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int id = getint();
    const char* url = getstr();
    if (!valid_slot(id) || !g_views[id].view) return -1;
    std::wstring wurl = utf8_to_wide(url);
    HRESULT hr = g_views[id].view->Navigate(wurl.c_str());
    return SUCCEEDED(hr) ? 0 : -2;
}

// wv2_navigate_to_string id, "<html>"
HSPWV2_EXPORT BOOL WINAPI wv2_navigate_to_string(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int id = getint();
    const char* html = getstr();
    if (!valid_slot(id) || !g_views[id].view) return -1;
    std::wstring whtml = utf8_to_wide(html);
    HRESULT hr = g_views[id].view->NavigateToString(whtml.c_str());
    return SUCCEEDED(hr) ? 0 : -2;
}

// wv2_resize id, x, y, w, h
HSPWV2_EXPORT BOOL WINAPI wv2_resize(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int id = getint();
    int x = getint();
    int y = getint();
    int w = getint();
    int h = getint();
    if (!valid_slot(id) || !g_views[id].controller) return -1;
    RECT rc = { x, y, x + w, y + h };
    g_views[id].controller->put_Bounds(rc);
    return 0;
}

// wv2_visible id, 0/1
HSPWV2_EXPORT BOOL WINAPI wv2_visible(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int id = getint();
    int v = getint();
    if (!valid_slot(id) || !g_views[id].controller) return -1;
    g_views[id].controller->put_IsVisible(v ? TRUE : FALSE);
    return 0;
}

// wv2_execute_script id, "js", var_result
HSPWV2_EXPORT BOOL WINAPI wv2_execute_script(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int id = getint();
    const char* js = getstr();
    if (!valid_slot(id) || !g_views[id].view) { write_str_to_var(""); return -1; }

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
    if (FAILED(hr)) { write_str_to_var(""); return -2; }

    if (!pump_until(done)) { write_str_to_var(""); return -3; }
    if (FAILED(invoke_hr)) { write_str_to_var(""); return -4; }

    write_str_to_var(result);
    return 0;
}

// wv2_post_message id, "text"  (HSP -> JS)
HSPWV2_EXPORT BOOL WINAPI wv2_post_message(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int id = getint();
    const char* text = getstr();
    if (!valid_slot(id) || !g_views[id].view) return -1;
    std::wstring w = utf8_to_wide(text);
    HRESULT hr = g_views[id].view->PostWebMessageAsString(w.c_str());
    return SUCCEEDED(hr) ? 0 : -2;
}

// wv2_poll_message id, var_text  -> stat 1/0
HSPWV2_EXPORT BOOL WINAPI wv2_poll_message(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int id = getint();
    if (!valid_slot(id)) { write_str_to_var(""); return 0; }

    // メインスレッドで呼ばれるので、直前に COM callback が飛ぶよう軽くポンプ
    MSG msg;
    while (PeekMessageW(&msg, nullptr, 0, 0, PM_REMOVE)) {
        TranslateMessage(&msg);
        DispatchMessageW(&msg);
    }

    WebView2State& st = g_views[id];
    std::unique_lock<std::mutex> lk(st.msg_mutex);
    if (st.msg_queue.empty()) {
        lk.unlock();
        write_str_to_var("");
        return 0;
    }
    std::string s = std::move(st.msg_queue.front());
    st.msg_queue.pop_front();
    lk.unlock();
    write_str_to_var(s);
    return 1;
}

// wv2_add_script id, "js"  (AddScriptToExecuteOnDocumentCreated)
HSPWV2_EXPORT BOOL WINAPI wv2_add_script(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int id = getint();
    const char* js = getstr();
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
#define HSPWV2_STUB_FUNC(name) \
    HSPWV2_EXPORT BOOL WINAPI name(HSPEXINFO* hei, int, int, int) { (void)hei; return -1; }

HSPWV2_STUB_FUNC(wv2_init)
HSPWV2_STUB_FUNC(wv2_attach)
HSPWV2_STUB_FUNC(wv2_detach)
HSPWV2_STUB_FUNC(wv2_close)
HSPWV2_STUB_FUNC(wv2_navigate)
HSPWV2_STUB_FUNC(wv2_navigate_to_string)
HSPWV2_STUB_FUNC(wv2_resize)
HSPWV2_STUB_FUNC(wv2_visible)
HSPWV2_STUB_FUNC(wv2_execute_script)
HSPWV2_STUB_FUNC(wv2_post_message)
HSPWV2_STUB_FUNC(wv2_poll_message)
HSPWV2_STUB_FUNC(wv2_add_script)

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
