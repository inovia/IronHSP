//============================================================
//   hspwgcapture.dll — Windows.Graphics.Capture plugin for IronHSP (新形式)
//
//   Windows 10 1903+ の Windows.Graphics.Capture API (C++/WinRT) を
//   利用したスクリーン / ウィンドウ キャプチャ。
//
//   v2 (2026-04-15): OLDDLL $202 → typed #func 形式に全面移行。
//
//   HSP API (typed #func):
//     wgc_init                                          ; apartment init + D3D11 device
//     wgc_shutdown
//     wgc_list_windows  var_buf, buf_size               ; "title\tHWND\n" 形式
//     wgc_start_window  hwnd,    var_h                  ; var_h に handle (-1=失敗)
//     wgc_start_monitor monidx,  var_h
//     wgc_stop          h
//     wgc_grab_frame    h, var_buf, buf_size, var_w, var_h  ; BGRA raw
//     wgc_save_png      h, "out.png"
//
//   __has_include でヘッダが無い環境ではスタブ (全関数 -1) 化。
//============================================================

#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>

#include <string>
#include <vector>
#include <cstdio>
#include <cstring>
#include <mutex>

#define HSPWGC_EXPORT extern "C" __declspec(dllexport)

// ============================================================
// __has_include fallback
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

// 共通: 文字列を HSP 側のバッファに安全コピー
static void copy_to_buf(const std::string& src, char* out, int out_size)
{
    if (!out || out_size <= 0) return;
    int n = (int)src.size();
    if (n >= out_size) n = out_size - 1;
    if (n > 0) memcpy(out, src.data(), (size_t)n);
    out[n] = 0;
}

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

#include <windows.graphics.capture.interop.h>
#include <windows.graphics.directx.direct3d11.interop.h>
#include <Windows.Graphics.Capture.h>
#include <DispatcherQueue.h>

#pragma comment(lib, "windowsapp.lib")
#pragma comment(lib, "d3d11.lib")
#pragma comment(lib, "dxgi.lib")
#pragma comment(lib, "windowscodecs.lib")

#include <inspectable.h>

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

static bool GrabLatestBGRA(Session& s,
                           std::vector<uint8_t>& out,
                           int& out_w, int& out_h)
{
    if (!s.active || !s.pool) return false;

    Direct3D11CaptureFrame frame{ nullptr };
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

        g_sessions[idx].active  = true;
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
    try { if (s.session) s.session.Close(); } catch (...) {}
    try { if (s.pool)    s.pool.Close();    } catch (...) {}
    s.session = nullptr;
    s.pool    = nullptr;
    s.item    = nullptr;
    s.active  = false;
}

} // namespace wgc_impl

namespace {
struct EnumCtx { std::string* out; };
static BOOL CALLBACK WndProc_List(HWND hwnd, LPARAM lp)
{
    auto* ctx = reinterpret_cast<EnumCtx*>(lp);
    if (!IsWindowVisible(hwnd)) return TRUE;
    wchar_t title[512];
    int n = GetWindowTextW(hwnd, title, 512);
    if (n <= 0) return TRUE;
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
// HSP exports (typed #func)
// ============================================================

HSPWGC_EXPORT int __stdcall wgc_init()
{
    try {
        if (!winrt::Windows::Graphics::Capture::GraphicsCaptureSession::IsSupported()) return -2;
        if (!wgc_impl::EnsureDevice()) return -3;
        wgc_impl::g_ready = true;
        return 0;
    } catch (...) { return -1; }
}

HSPWGC_EXPORT int __stdcall wgc_shutdown()
{
    for (int i = 0; i < wgc_impl::MAX_SESSIONS; ++i)
        wgc_impl::StopSession(i);
    wgc_impl::g_device  = nullptr;
    wgc_impl::g_context = nullptr;
    wgc_impl::g_winrtDevice = nullptr;
    wgc_impl::g_ready = false;
    return 0;
}

HSPWGC_EXPORT int __stdcall wgc_list_windows(char* out_buf, int out_size)
{
    if (out_buf && out_size > 0) out_buf[0] = 0;
    std::string out;
    EnumCtx ctx{ &out };
    EnumWindows(WndProc_List, (LPARAM)&ctx);
    copy_to_buf(out, out_buf, out_size);
    return 0;
}

HSPWGC_EXPORT int __stdcall wgc_start_window(int hwnd_i, int* out_h)
{
    if (out_h) *out_h = -1;
    if (!wgc_impl::g_ready) return -1;
    HWND hwnd = (HWND)(intptr_t)hwnd_i;
    if (!IsWindow(hwnd)) return -2;
    auto item = wgc_impl::ItemFromHwnd(hwnd);
    int h = wgc_impl::StartSession(item);
    if (out_h) *out_h = h;
    return 0;
}

HSPWGC_EXPORT int __stdcall wgc_start_monitor(int idx, int* out_h)
{
    if (out_h) *out_h = -1;
    if (!wgc_impl::g_ready) return -1;
    HMONITOR hmon = wgc_impl::MonitorByIndex(idx);
    if (!hmon) return -2;
    auto item = wgc_impl::ItemFromMonitor(hmon);
    int h = wgc_impl::StartSession(item);
    if (out_h) *out_h = h;
    return 0;
}

HSPWGC_EXPORT int __stdcall wgc_stop(int h)
{
    wgc_impl::StopSession(h);
    return 0;
}

// wgc_grab_frame(h, var_buf, buf_size, var_w, var_h)
HSPWGC_EXPORT int __stdcall wgc_grab_frame(
    int h, void* out_buf, int buf_size, int* out_w, int* out_h)
{
    if (out_w) *out_w = 0;
    if (out_h) *out_h = 0;
    if (!wgc_impl::g_ready) return -1;
    if (h < 0 || h >= wgc_impl::MAX_SESSIONS) return -2;
    auto& s = wgc_impl::g_sessions[h];
    if (!s.active) return -3;

    std::vector<uint8_t> pixels;
    int w = 0, hh = 0;
    if (!wgc_impl::GrabLatestBGRA(s, pixels, w, hh)) return -4;

    if (out_buf && buf_size > 0) {
        size_t n = pixels.size();
        if ((int)n > buf_size) n = (size_t)buf_size;
        if (n > 0) memcpy(out_buf, pixels.data(), n);
    }
    if (out_w) *out_w = w;
    if (out_h) *out_h = hh;
    return 0;
}

HSPWGC_EXPORT int __stdcall wgc_save_png(int h, const char* path_a)
{
    if (!wgc_impl::g_ready) return -1;
    if (h < 0 || h >= wgc_impl::MAX_SESSIONS) return -2;
    auto& s = wgc_impl::g_sessions[h];
    if (!s.active) return -3;
    if (!path_a) return -6;

    std::vector<uint8_t> pixels;
    int w = 0, hh = 0;
    if (!wgc_impl::GrabLatestBGRA(s, pixels, w, hh)) return -4;

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

HSPWGC_EXPORT int __stdcall wgc_init() { return -1; }
HSPWGC_EXPORT int __stdcall wgc_shutdown() { return -1; }
HSPWGC_EXPORT int __stdcall wgc_list_windows(char* out_buf, int out_size)
{
    if (out_buf && out_size > 0) out_buf[0] = 0;
    return -1;
}
HSPWGC_EXPORT int __stdcall wgc_start_window(int, int* out_h)
{ if (out_h) *out_h = -1; return -1; }
HSPWGC_EXPORT int __stdcall wgc_start_monitor(int, int* out_h)
{ if (out_h) *out_h = -1; return -1; }
HSPWGC_EXPORT int __stdcall wgc_stop(int) { return -1; }
HSPWGC_EXPORT int __stdcall wgc_grab_frame(int, void*, int, int* out_w, int* out_h)
{ if (out_w) *out_w = 0; if (out_h) *out_h = 0; return -1; }
HSPWGC_EXPORT int __stdcall wgc_save_png(int, const char*) { return -1; }

BOOL WINAPI DllMain(HMODULE, DWORD, LPVOID) { return TRUE; }

#endif // HSPWGC_HAVE_WGC
