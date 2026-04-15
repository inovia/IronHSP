//============================================================
//   hspwgcapture.dll — Windows.Graphics.Capture plugin for IronHSP
//
//   Windows 10 1903+ に搭載された Windows.Graphics.Capture API
//   (c++/WinRT) を利用したスクリーン / ウィンドウ キャプチャ。
//
//   HSP API (OLDDLL $202):
//     wgc_init                                  ; apartment init + D3D11 device
//     wgc_shutdown
//     wgc_list_windows    var_str               ; "title\tHWND\n" 形式で列挙
//     wgc_start_window    hwnd      -> stat=h   ; ウィンドウキャプチャ開始
//     wgc_start_monitor   monidx    -> stat=h   ; モニタキャプチャ開始
//     wgc_stop            h
//     wgc_grab_frame      h, buf, w, h          ; 最新フレームを BGRA で buf へ
//     wgc_save_png        h, "out.png"          ; 最新フレームを PNG 保存
//
//   実装メモ:
//     - C++/WinRT + Windows.Graphics.Capture.h (windowsapp.lib)
//     - 1 プロセスにつき最大 4 セッション (スロット) を保持
//     - GraphicsCaptureItem::CreateFromWindowId / CreateFromMonitorId は
//       activation factory の IGraphicsCaptureItemInterop 経由で HWND/HMONITOR
//       から直接生成する (これが唯一の通常手段)
//     - D3D11Device は BGRA_SUPPORT で 1 個だけ作成、FramePool は各セッションで
//       CreateFreeThreaded を使う (UI スレッドでなくても Closed イベント等が動くため)
//     - grab_frame では TryGetNextFrame -> Surface.as<IDirect3DDxgiInterfaceAccess>
//       -> ID3D11Texture2D を staging テクスチャにコピー -> Map して memcpy
//     - save_png は WIC (CoCreateInstance) で PNG エンコード
//     - __has_include でヘッダが無い環境ではスタブ (全関数 -1) 化
//============================================================

#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>

// HSP SDK
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
#pragma warning(pop)

#include <string>
#include <vector>
#include <cstdio>
#include <cstring>
#include <mutex>

#define HSPWGC_EXPORT extern "C" __declspec(dllexport)

// ============================================================
// HSPEXINFO helpers
// ============================================================
namespace {
HSPEXINFO* g_hei = nullptr;
inline void  set_hei(HSPEXINFO* hei) { g_hei = hei; }
inline int   getint() { return g_hei->HspFunc_prm_geti(); }
inline char* getstr() { return g_hei->HspFunc_prm_gets(); }

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

static void write_int_to_var(int v)
{
    PVal* pv = nullptr;
    APTR a = g_hei->HspFunc_prm_getva(&pv);
    if (!pv) return;
    if (pv->flag != HSPVAR_FLAG_INT) return;
    pv->offset = a;
    HspVarProc* proc = g_hei->HspFunc_getproc(pv->flag);
    proc->Set(pv, proc->GetPtr(pv), &v);
}

// str 変数を n バイトで resize し、そこに memcpy
static void write_buf_to_var(const void* data, size_t n)
{
    PVal* pv = nullptr;
    APTR a = g_hei->HspFunc_prm_getva(&pv);
    if (!pv) return;
    if (pv->flag != HSPVAR_FLAG_STR) return;
    pv->offset = a;
    g_hei->HspFunc_dim(pv, HSPVAR_FLAG_STR, (int)n + 1, 0, 0, 0, 0);
    if (n > 0) memcpy(pv->pt, data, n);
    ((char*)pv->pt)[n] = 0;
}
} // namespace

// ============================================================
// __has_include fallback (if Windows.Graphics.Capture は未対応)
// ============================================================
#if defined(__has_include)
#  if __has_include(<winrt/Windows.Graphics.Capture.h>) && \
      __has_include(<windows.graphics.capture.interop.h>)
#    define HSPWGC_HAVE_WGC 1
#  else
#    define HSPWGC_HAVE_WGC 0
#  endif
#else
#  define HSPWGC_HAVE_WGC 1
#endif

#if HSPWGC_HAVE_WGC

#include <d3d11.h>
#include <d3d11_4.h>
#include <dxgi1_2.h>
#include <wincodec.h>

#include <winrt/base.h>
#include <winrt/Windows.Foundation.h>
#include <winrt/Windows.Graphics.h>
#include <winrt/Windows.Graphics.Capture.h>
#include <winrt/Windows.Graphics.DirectX.h>
#include <winrt/Windows.Graphics.DirectX.Direct3D11.h>

// interop / Direct3D11 bridge
#include <windows.graphics.capture.interop.h>
#include <windows.graphics.directx.direct3d11.interop.h>
#include <Windows.Graphics.Capture.h>    // ABI
#include <DispatcherQueue.h>

#pragma comment(lib, "windowsapp.lib")
#pragma comment(lib, "d3d11.lib")
#pragma comment(lib, "dxgi.lib")
#pragma comment(lib, "windowscodecs.lib")

// IDirect3DDxgiInterfaceAccess (Windows.Graphics.DirectX.Direct3D11.interop.h)
#include <inspectable.h>
extern "C" {
// 既に direct3d11.interop.h で宣言されているはず。念のため forward decl。
}

namespace wgc_impl {

using namespace winrt;
using namespace winrt::Windows::Foundation;
using namespace winrt::Windows::Graphics;
using namespace winrt::Windows::Graphics::Capture;
using namespace winrt::Windows::Graphics::DirectX;
using namespace winrt::Windows::Graphics::DirectX::Direct3D11;

constexpr int MAX_SESSIONS = 4;

struct Session {
    bool                           active = false;
    GraphicsCaptureItem             item{ nullptr };
    Direct3D11CaptureFramePool      pool{ nullptr };
    GraphicsCaptureSession          session{ nullptr };
    SizeInt32                       size{};
};

static Session                     g_sessions[MAX_SESSIONS];
static std::mutex                  g_mutex;
static bool                        g_ready = false;

static winrt::com_ptr<ID3D11Device>          g_device;
static winrt::com_ptr<ID3D11DeviceContext>   g_context;
static IDirect3DDevice                       g_winrtDevice{ nullptr };

// --- device init --------------------------------------------------------
static bool EnsureDevice()
{
    if (g_device) return true;

    UINT flags = D3D11_CREATE_DEVICE_BGRA_SUPPORT;
    D3D_FEATURE_LEVEL levels[] = {
        D3D_FEATURE_LEVEL_11_1, D3D_FEATURE_LEVEL_11_0,
        D3D_FEATURE_LEVEL_10_1, D3D_FEATURE_LEVEL_10_0,
    };
    D3D_FEATURE_LEVEL got;
    HRESULT hr = D3D11CreateDevice(
        nullptr, D3D_DRIVER_TYPE_HARDWARE, nullptr, flags,
        levels, ARRAYSIZE(levels), D3D11_SDK_VERSION,
        g_device.put(), &got, g_context.put());
    if (FAILED(hr)) {
        // WARP fallback
        hr = D3D11CreateDevice(
            nullptr, D3D_DRIVER_TYPE_WARP, nullptr, flags,
            levels, ARRAYSIZE(levels), D3D11_SDK_VERSION,
            g_device.put(), &got, g_context.put());
        if (FAILED(hr)) return false;
    }

    winrt::com_ptr<IDXGIDevice> dxgi;
    if (FAILED(g_device->QueryInterface(__uuidof(IDXGIDevice),
                                        dxgi.put_void()))) return false;

    winrt::com_ptr<::IInspectable> insp;
    HRESULT hr2 = CreateDirect3D11DeviceFromDXGIDevice(
        dxgi.get(), insp.put());
    if (FAILED(hr2)) return false;
    g_winrtDevice = insp.as<IDirect3DDevice>();
    return true;
}

// --- GraphicsCaptureItem from HWND/HMONITOR via interop -----------------
static GraphicsCaptureItem ItemFromHwnd(HWND hwnd)
{
    auto factory = winrt::get_activation_factory<
        GraphicsCaptureItem, ::IGraphicsCaptureItemInterop>();
    GraphicsCaptureItem item{ nullptr };
    HRESULT hr = factory->CreateForWindow(
        hwnd, winrt::guid_of<GraphicsCaptureItem>(),
        reinterpret_cast<void**>(winrt::put_abi(item)));
    if (FAILED(hr)) return nullptr;
    return item;
}

static GraphicsCaptureItem ItemFromMonitor(HMONITOR hmon)
{
    auto factory = winrt::get_activation_factory<
        GraphicsCaptureItem, ::IGraphicsCaptureItemInterop>();
    GraphicsCaptureItem item{ nullptr };
    HRESULT hr = factory->CreateForMonitor(
        hmon, winrt::guid_of<GraphicsCaptureItem>(),
        reinterpret_cast<void**>(winrt::put_abi(item)));
    if (FAILED(hr)) return nullptr;
    return item;
}

// モニタ index -> HMONITOR
struct MonEnumCtx { int target; int cur; HMONITOR out; };
static BOOL CALLBACK MonProc(HMONITOR hmon, HDC, LPRECT, LPARAM lp)
{
    auto* c = reinterpret_cast<MonEnumCtx*>(lp);
    if (c->cur == c->target) { c->out = hmon; return FALSE; }
    ++c->cur;
    return TRUE;
}
static HMONITOR MonitorByIndex(int idx)
{
    MonEnumCtx ctx{ idx, 0, nullptr };
    EnumDisplayMonitors(nullptr, nullptr, MonProc, (LPARAM)&ctx);
    return ctx.out;
}

// 最新フレームを取得し、BGRA リニア pixels と w/h を返す
// 返り値: true で out_pixels を埋めた
static bool GrabLatestBGRA(Session& s,
                           std::vector<uint8_t>& out,
                           int& out_w, int& out_h)
{
    if (!s.active || !s.pool) return false;

    Direct3D11CaptureFrame frame{ nullptr };
    // 最新を取り出す。複数溜まっていれば捨てる。
    for (int tries = 0; tries < 8; ++tries) {
        auto f = s.pool.TryGetNextFrame();
        if (!f) break;
        frame = f;
    }
    if (!frame) return false;

    auto surface = frame.Surface();
    auto access  = surface.as<::Windows::Graphics::DirectX::Direct3D11::
                              IDirect3DDxgiInterfaceAccess>();
    winrt::com_ptr<ID3D11Texture2D> tex;
    HRESULT hr = access->GetInterface(__uuidof(ID3D11Texture2D), tex.put_void());
    if (FAILED(hr) || !tex) return false;

    D3D11_TEXTURE2D_DESC desc{};
    tex->GetDesc(&desc);
    out_w = (int)desc.Width;
    out_h = (int)desc.Height;

    // staging テクスチャを作って CPU read する
    D3D11_TEXTURE2D_DESC sdesc = desc;
    sdesc.Usage          = D3D11_USAGE_STAGING;
    sdesc.BindFlags      = 0;
    sdesc.CPUAccessFlags = D3D11_CPU_ACCESS_READ;
    sdesc.MiscFlags      = 0;
    winrt::com_ptr<ID3D11Texture2D> staging;
    hr = g_device->CreateTexture2D(&sdesc, nullptr, staging.put());
    if (FAILED(hr)) return false;

    g_context->CopyResource(staging.get(), tex.get());

    D3D11_MAPPED_SUBRESOURCE map{};
    hr = g_context->Map(staging.get(), 0, D3D11_MAP_READ, 0, &map);
    if (FAILED(hr)) return false;

    out.resize((size_t)out_w * out_h * 4);
    const uint8_t* src = (const uint8_t*)map.pData;
    uint8_t* dst = out.data();
    for (int y = 0; y < out_h; ++y) {
        memcpy(dst + (size_t)y * out_w * 4,
               src + (size_t)y * map.RowPitch,
               (size_t)out_w * 4);
    }
    g_context->Unmap(staging.get(), 0);
    return true;
}

static bool SavePngBGRA(const std::vector<uint8_t>& px,
                        int w, int h, const wchar_t* path)
{
    if (px.empty() || !path) return false;

    HRESULT hr;
    winrt::com_ptr<IWICImagingFactory> factory;
    hr = CoCreateInstance(CLSID_WICImagingFactory, nullptr,
                          CLSCTX_INPROC_SERVER,
                          IID_PPV_ARGS(factory.put()));
    if (FAILED(hr)) return false;

    winrt::com_ptr<IWICStream> stream;
    factory->CreateStream(stream.put());
    hr = stream->InitializeFromFilename(path, GENERIC_WRITE);
    if (FAILED(hr)) return false;

    winrt::com_ptr<IWICBitmapEncoder> encoder;
    factory->CreateEncoder(GUID_ContainerFormatPng, nullptr, encoder.put());
    encoder->Initialize(stream.get(), WICBitmapEncoderNoCache);

    winrt::com_ptr<IWICBitmapFrameEncode> frame;
    encoder->CreateNewFrame(frame.put(), nullptr);
    frame->Initialize(nullptr);
    frame->SetSize(w, h);
    WICPixelFormatGUID fmt = GUID_WICPixelFormat32bppBGRA;
    frame->SetPixelFormat(&fmt);

    UINT stride = (UINT)w * 4;
    UINT bufSize = stride * (UINT)h;
    frame->WritePixels(h, stride, bufSize,
                       const_cast<BYTE*>(px.data()));
    frame->Commit();
    encoder->Commit();
    return true;
}

static int FindFreeSlot()
{
    for (int i = 0; i < MAX_SESSIONS; ++i)
        if (!g_sessions[i].active) return i;
    return -1;
}

// --- start helpers ------------------------------------------------------
static int StartSession(GraphicsCaptureItem item)
{
    if (!item) return -1;
    std::lock_guard<std::mutex> lk(g_mutex);
    int idx = FindFreeSlot();
    if (idx < 0) return -1;
    try {
        auto size = item.Size();
        auto pool = Direct3D11CaptureFramePool::CreateFreeThreaded(
            g_winrtDevice,
            DirectXPixelFormat::B8G8R8A8UIntNormalized,
            2, size);
        auto session = pool.CreateCaptureSession(item);
        session.StartCapture();

        g_sessions[idx].active = true;
        g_sessions[idx].item    = item;
        g_sessions[idx].pool    = pool;
        g_sessions[idx].session = session;
        g_sessions[idx].size    = size;
        return idx;
    } catch (...) {
        return -1;
    }
}

static void StopSession(int idx)
{
    if (idx < 0 || idx >= MAX_SESSIONS) return;
    std::lock_guard<std::mutex> lk(g_mutex);
    auto& s = g_sessions[idx];
    if (!s.active) return;
    try {
        if (s.session) s.session.Close();
    } catch (...) {}
    try {
        if (s.pool) s.pool.Close();
    } catch (...) {}
    s.session = nullptr;
    s.pool    = nullptr;
    s.item    = nullptr;
    s.active  = false;
}

} // namespace wgc_impl

// --- window enumeration (not WGC, just EnumWindows) --------------------
namespace {
struct EnumCtx { std::string* out; };
static BOOL CALLBACK WndProc_List(HWND hwnd, LPARAM lp)
{
    auto* ctx = reinterpret_cast<EnumCtx*>(lp);
    if (!IsWindowVisible(hwnd)) return TRUE;
    wchar_t title[512];
    int n = GetWindowTextW(hwnd, title, 512);
    if (n <= 0) return TRUE;
    // UTF-16 -> cp932
    int need = WideCharToMultiByte(CP_ACP, 0, title, n, nullptr, 0, nullptr, nullptr);
    if (need <= 0) return TRUE;
    std::vector<char> buf(need);
    WideCharToMultiByte(CP_ACP, 0, title, n, buf.data(), need, nullptr, nullptr);
    char line[1024];
    _snprintf_s(line, _TRUNCATE, "%s\t%p\n",
                std::string(buf.data(), need).c_str(), (void*)hwnd);
    *ctx->out += line;
    return TRUE;
}
} // namespace

// ============================================================
// HSP exports
// ============================================================

HSPWGC_EXPORT BOOL WINAPI wgc_init(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1;(void)p2;(void)p3;
    set_hei(hei);
    try {
        if (!GraphicsCaptureSession::IsSupported()) return -2;
        if (!wgc_impl::EnsureDevice()) return -3;
        wgc_impl::g_ready = true;
        return 0;
    } catch (...) { return -1; }
}

HSPWGC_EXPORT BOOL WINAPI wgc_shutdown(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1;(void)p2;(void)p3;
    set_hei(hei);
    for (int i = 0; i < wgc_impl::MAX_SESSIONS; ++i)
        wgc_impl::StopSession(i);
    wgc_impl::g_device  = nullptr;
    wgc_impl::g_context = nullptr;
    wgc_impl::g_winrtDevice = nullptr;
    wgc_impl::g_ready = false;
    return 0;
}

HSPWGC_EXPORT BOOL WINAPI wgc_list_windows(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1;(void)p2;(void)p3;
    set_hei(hei);
    std::string out;
    EnumCtx ctx{ &out };
    EnumWindows(WndProc_List, (LPARAM)&ctx);
    write_str_to_var(out);
    return 0;
}

HSPWGC_EXPORT BOOL WINAPI wgc_start_window(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1;(void)p2;(void)p3;
    set_hei(hei);
    if (!wgc_impl::g_ready) return -1;
    int hwnd_i = getint();
    HWND hwnd = (HWND)(intptr_t)hwnd_i;
    if (!IsWindow(hwnd)) return -2;
    auto item = wgc_impl::ItemFromHwnd(hwnd);
    return wgc_impl::StartSession(item);
}

HSPWGC_EXPORT BOOL WINAPI wgc_start_monitor(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1;(void)p2;(void)p3;
    set_hei(hei);
    if (!wgc_impl::g_ready) return -1;
    int idx = getint();
    HMONITOR hmon = wgc_impl::MonitorByIndex(idx);
    if (!hmon) return -2;
    auto item = wgc_impl::ItemFromMonitor(hmon);
    return wgc_impl::StartSession(item);
}

HSPWGC_EXPORT BOOL WINAPI wgc_stop(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1;(void)p2;(void)p3;
    set_hei(hei);
    int h = getint();
    wgc_impl::StopSession(h);
    return 0;
}

HSPWGC_EXPORT BOOL WINAPI wgc_grab_frame(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1;(void)p2;(void)p3;
    set_hei(hei);
    if (!wgc_impl::g_ready) return -1;
    int h = getint();
    if (h < 0 || h >= wgc_impl::MAX_SESSIONS) return -2;
    auto& s = wgc_impl::g_sessions[h];
    if (!s.active) return -3;

    std::vector<uint8_t> pixels;
    int w = 0, hh = 0;
    if (!wgc_impl::GrabLatestBGRA(s, pixels, w, hh)) {
        // 書き込まずに失敗
        // それでも var_buf / var_w / var_h パラメータを消費しないと
        // 次命令で引数が狂うので、空で書き込み
        write_buf_to_var(nullptr, 0);
        write_int_to_var(0);
        write_int_to_var(0);
        return -4;
    }
    write_buf_to_var(pixels.data(), pixels.size());
    write_int_to_var(w);
    write_int_to_var(hh);
    return 0;
}

HSPWGC_EXPORT BOOL WINAPI wgc_save_png(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1;(void)p2;(void)p3;
    set_hei(hei);
    if (!wgc_impl::g_ready) return -1;
    int h = getint();
    char* path_a = getstr();
    if (h < 0 || h >= wgc_impl::MAX_SESSIONS) return -2;
    auto& s = wgc_impl::g_sessions[h];
    if (!s.active) return -3;

    std::vector<uint8_t> pixels;
    int w = 0, hh = 0;
    if (!wgc_impl::GrabLatestBGRA(s, pixels, w, hh)) return -4;

    // cp932 -> UTF-16
    int wlen = MultiByteToWideChar(CP_ACP, 0, path_a, -1, nullptr, 0);
    std::vector<wchar_t> wbuf(wlen > 0 ? wlen : 1);
    if (wlen > 0)
        MultiByteToWideChar(CP_ACP, 0, path_a, -1, wbuf.data(), wlen);

    return wgc_impl::SavePngBGRA(pixels, w, hh, wbuf.data()) ? 0 : -5;
}

// ============================================================
// DllMain
// ============================================================
BOOL WINAPI DllMain(HMODULE, DWORD reason, LPVOID)
{
    switch (reason) {
    case DLL_PROCESS_ATTACH:
        try {
            winrt::init_apartment(winrt::apartment_type::multi_threaded);
        } catch (...) {}
        // COM for WIC も必要 (MTA 内なので既に OK)
        break;
    case DLL_PROCESS_DETACH:
        for (int i = 0; i < wgc_impl::MAX_SESSIONS; ++i)
            wgc_impl::StopSession(i);
        wgc_impl::g_device = nullptr;
        wgc_impl::g_context = nullptr;
        wgc_impl::g_winrtDevice = nullptr;
        break;
    }
    return TRUE;
}

#else // !HSPWGC_HAVE_WGC  — stub build

HSPWGC_EXPORT BOOL WINAPI wgc_init(HSPEXINFO* hei, int, int, int)
{ set_hei(hei); return -1; }
HSPWGC_EXPORT BOOL WINAPI wgc_shutdown(HSPEXINFO* hei, int, int, int)
{ set_hei(hei); return -1; }
HSPWGC_EXPORT BOOL WINAPI wgc_list_windows(HSPEXINFO* hei, int, int, int)
{ set_hei(hei); write_str_to_var(""); return -1; }
HSPWGC_EXPORT BOOL WINAPI wgc_start_window(HSPEXINFO* hei, int, int, int)
{ set_hei(hei); (void)getint(); return -1; }
HSPWGC_EXPORT BOOL WINAPI wgc_start_monitor(HSPEXINFO* hei, int, int, int)
{ set_hei(hei); (void)getint(); return -1; }
HSPWGC_EXPORT BOOL WINAPI wgc_stop(HSPEXINFO* hei, int, int, int)
{ set_hei(hei); (void)getint(); return -1; }
HSPWGC_EXPORT BOOL WINAPI wgc_grab_frame(HSPEXINFO* hei, int, int, int)
{ set_hei(hei); return -1; }
HSPWGC_EXPORT BOOL WINAPI wgc_save_png(HSPEXINFO* hei, int, int, int)
{ set_hei(hei); return -1; }

BOOL WINAPI DllMain(HMODULE, DWORD, LPVOID) { return TRUE; }

#endif // HSPWGC_HAVE_WGC
