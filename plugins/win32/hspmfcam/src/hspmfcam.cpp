//============================================================
//   hspmfcam.dll — Webcam preview via Microsoft Media Foundation
//
//   HSP からカメラのリアルタイムプレビューを 1 行で実現する
//   ヘルパ DLL。MFPlay と同様、内部で:
//
//     * 専用 worker thread を spawn
//     * Worker が child window を作成 (parent = HSP window)
//     * Worker thread 上で COM init → MF SourceReader 起動 →
//       message pump + ReadSample loop で StretchDIBits 描画
//
//   このため HSP main thread が title bar drag 等の modal loop
//   で止まっても、worker thread は走り続けて child window は
//   更新され続ける (= 動画フィードがフリーズしない)。
//
//   依存: mfplat.lib / mf.lib / mfreadwrite.lib / mfuuid.lib
//   出力: hspmfcam.dll  (Win32) / hspmfcam_64.dll (x64)
//
//   エクスポート関数:
//     int  mfcam_count()
//         接続されている Webcam の数を返す
//
//     int  mfcam_open(int idx, void* parent_hwnd,
//                     int x, int y, int w, int h,
//                     int* out_w, int* out_h)
//         idx 番目のカメラを開いて parent_hwnd の子 window として
//         (x,y,w,h) の位置にプレビューを表示する。
//         out_w/out_h にはカメラのネイティブ解像度を返す。
//         戻り値: handle (>=0 成功) / -1 失敗
//
//     int  mfcam_set_pos(int handle, int x, int y, int w, int h)
//         child window の位置とサイズを変更する
//
//     int  mfcam_read(int handle, void* bgra_buf)
//         スナップショット用: 最新フレームを bgra_buf にコピー
//         (worker が作った latest buffer から lock してコピー)
//         buffer サイズは width * height * 4 bytes 必要
//
//     void mfcam_close(int handle)
//         worker thread を停止 → child window 破棄 → リソース解放
//============================================================

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <mfapi.h>
#include <mfidl.h>
#include <mfreadwrite.h>
#include <mferror.h>
#include <combaseapi.h>
#include <wincodec.h>
#include <cstring>
#include <cstdlib>

#pragma comment(lib, "mfplat.lib")
#pragma comment(lib, "mf.lib")
#pragma comment(lib, "mfreadwrite.lib")
#pragma comment(lib, "mfuuid.lib")
#pragma comment(lib, "ole32.lib")
#pragma comment(lib, "gdi32.lib")
#pragma comment(lib, "user32.lib")
#pragma comment(lib, "windowscodecs.lib")

#define HSPMFCAM_EXPORT extern "C" __declspec(dllexport)

namespace {

constexpr int MAX_CAMS = 256;

struct CamState {
    bool   slot_used = false;
    bool   active = false;          // worker is running
    bool   open_ok = false;         // open succeeded

    int    device_idx = 0;
    HWND   parent_hwnd = NULL;
    int    init_x = 0, init_y = 0, init_w = 0, init_h = 0;

    int    width = 0;
    int    height = 0;
    LONG   stride = 0;
    int    aspect_mode = 0;        // 0=stretch (fill), 1=letterbox (preserve)

    HANDLE worker = NULL;
    HANDLE ready_event = NULL;
    HWND   child_hwnd = NULL;

    CRITICAL_SECTION lock;
    bool             lock_inited = false;
    BYTE*            latest = nullptr;
    bool             frame_ready = false;
};

static CamState g_cams[MAX_CAMS];
static bool g_mf_initialized = false;
static bool g_class_registered = false;
static const wchar_t* WND_CLASS_NAME = L"HSPMFCAM_PREVIEW";

template <typename T> inline void SafeRelease(T*& p) {
    if (p) { p->Release(); p = nullptr; }
}

int FindFreeHandle() {
    for (int i = 0; i < MAX_CAMS; i++) {
        if (!g_cams[i].slot_used) return i;
    }
    return -1;
}

LRESULT CALLBACK PreviewWndProc(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp) {
    switch (msg) {
        case WM_PAINT: {
            // worker thread が次フレームで上書きするので、ここでは
            // 黒で埋めるだけ (ちらつき防止用)
            PAINTSTRUCT ps;
            HDC hdc = BeginPaint(hwnd, &ps);
            RECT rc;
            GetClientRect(hwnd, &rc);
            HBRUSH br = (HBRUSH)GetStockObject(BLACK_BRUSH);
            FillRect(hdc, &rc, br);
            EndPaint(hwnd, &ps);
            return 0;
        }
        case WM_ERASEBKGND:
            return 1;  // 背景消去をスキップしてちらつき防止
    }
    return DefWindowProcW(hwnd, msg, wp, lp);
}

void EnsureWindowClass() {
    if (g_class_registered) return;
    WNDCLASSEXW wc = {};
    wc.cbSize = sizeof(wc);
    wc.lpfnWndProc = PreviewWndProc;
    wc.hInstance = GetModuleHandleW(NULL);
    wc.hCursor = LoadCursor(NULL, IDC_ARROW);
    wc.hbrBackground = (HBRUSH)GetStockObject(BLACK_BRUSH);
    wc.lpszClassName = WND_CLASS_NAME;
    RegisterClassExW(&wc);
    g_class_registered = true;
}

HRESULT OpenDeviceSource(int idx, IMFMediaSource** outSource) {
    *outSource = nullptr;
    IMFAttributes* attrs = nullptr;
    HRESULT hr = MFCreateAttributes(&attrs, 1);
    if (FAILED(hr)) return hr;

    hr = attrs->SetGUID(MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE,
                        MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_GUID);
    if (FAILED(hr)) { attrs->Release(); return hr; }

    IMFActivate** devices = nullptr;
    UINT32 count = 0;
    hr = MFEnumDeviceSources(attrs, &devices, &count);
    attrs->Release();
    if (FAILED(hr)) return hr;

    if ((UINT32)idx >= count) {
        for (UINT32 i = 0; i < count; i++) SafeRelease(devices[i]);
        CoTaskMemFree(devices);
        return E_INVALIDARG;
    }

    hr = devices[idx]->ActivateObject(IID_PPV_ARGS(outSource));
    for (UINT32 i = 0; i < count; i++) SafeRelease(devices[i]);
    CoTaskMemFree(devices);
    return hr;
}

HRESULT ConfigureReader(IMFSourceReader* reader, int* outW, int* outH, LONG* outStride) {
    IMFMediaType* mt = nullptr;
    HRESULT hr = MFCreateMediaType(&mt);
    if (FAILED(hr)) return hr;
    mt->SetGUID(MF_MT_MAJOR_TYPE, MFMediaType_Video);
    mt->SetGUID(MF_MT_SUBTYPE, MFVideoFormat_RGB32);
    hr = reader->SetCurrentMediaType((DWORD)MF_SOURCE_READER_FIRST_VIDEO_STREAM, NULL, mt);
    SafeRelease(mt);
    if (FAILED(hr)) return hr;

    IMFMediaType* current = nullptr;
    hr = reader->GetCurrentMediaType((DWORD)MF_SOURCE_READER_FIRST_VIDEO_STREAM, &current);
    if (FAILED(hr)) return hr;

    UINT32 w = 0, h = 0;
    hr = MFGetAttributeSize(current, MF_MT_FRAME_SIZE, &w, &h);
    if (FAILED(hr)) { SafeRelease(current); return hr; }

    LONG stride = 0;
    hr = MFGetStrideForBitmapInfoHeader(MFVideoFormat_RGB32.Data1, w, &stride);
    SafeRelease(current);
    if (FAILED(hr)) {
        stride = (LONG)w * 4;
    }

    *outW = (int)w;
    *outH = (int)h;
    *outStride = stride;
    return S_OK;
}

DWORD WINAPI WorkerProc(LPVOID arg) {
    CamState* cam = (CamState*)arg;

    HRESULT hrCo = CoInitializeEx(NULL, COINIT_APARTMENTTHREADED | COINIT_DISABLE_OLE1DDE);

    // ----- MF パイプライン初期化 -----
    IMFMediaSource* source = nullptr;
    HRESULT hr = OpenDeviceSource(cam->device_idx, &source);
    if (FAILED(hr) || !source) {
        cam->open_ok = false;
        SetEvent(cam->ready_event);
        if (SUCCEEDED(hrCo)) CoUninitialize();
        return 0;
    }

    IMFSourceReader* reader = nullptr;
    hr = MFCreateSourceReaderFromMediaSource(source, NULL, &reader);
    SafeRelease(source);
    if (FAILED(hr) || !reader) {
        cam->open_ok = false;
        SetEvent(cam->ready_event);
        if (SUCCEEDED(hrCo)) CoUninitialize();
        return 0;
    }

    int W = 0, H = 0;
    LONG stride = 0;
    hr = ConfigureReader(reader, &W, &H, &stride);
    if (FAILED(hr)) {
        SafeRelease(reader);
        cam->open_ok = false;
        SetEvent(cam->ready_event);
        if (SUCCEEDED(hrCo)) CoUninitialize();
        return 0;
    }
    cam->width = W;
    cam->height = H;
    cam->stride = stride;
    cam->latest = (BYTE*)malloc((size_t)W * H * 4);
    if (!cam->latest) {
        SafeRelease(reader);
        cam->open_ok = false;
        SetEvent(cam->ready_event);
        if (SUCCEEDED(hrCo)) CoUninitialize();
        return 0;
    }

    // ----- child window をこのスレッドで作成 -----
    EnsureWindowClass();
    cam->child_hwnd = CreateWindowExW(
        0, WND_CLASS_NAME, L"",
        WS_CHILD | WS_VISIBLE | WS_CLIPSIBLINGS,
        cam->init_x, cam->init_y, cam->init_w, cam->init_h,
        cam->parent_hwnd, NULL, GetModuleHandleW(NULL), NULL);

    cam->open_ok = (cam->child_hwnd != NULL);
    cam->active = cam->open_ok;
    SetEvent(cam->ready_event);

    if (!cam->active) {
        SafeRelease(reader);
        free(cam->latest);
        cam->latest = nullptr;
        if (SUCCEEDED(hrCo)) CoUninitialize();
        return 0;
    }

    HDC hdc = GetDC(cam->child_hwnd);
    BITMAPINFO bmi = {};
    bmi.bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
    bmi.bmiHeader.biWidth = W;
    bmi.bmiHeader.biHeight = -H;          // top-down DIB
    bmi.bmiHeader.biPlanes = 1;
    bmi.bmiHeader.biBitCount = 32;
    bmi.bmiHeader.biCompression = BI_RGB;
    SetStretchBltMode(hdc, HALFTONE);

    // ----- メインループ: メッセージ pump + ReadSample + paint -----
    while (cam->active) {
        // ノンブロッキングで自スレッドのメッセージを処理
        MSG msg;
        while (PeekMessageW(&msg, NULL, 0, 0, PM_REMOVE)) {
            if (msg.message == WM_QUIT) {
                cam->active = false;
                break;
            }
            TranslateMessage(&msg);
            DispatchMessageW(&msg);
        }
        if (!cam->active) break;

        // フレーム取得
        DWORD streamIdx = 0, flags = 0;
        LONGLONG ts = 0;
        IMFSample* sample = nullptr;
        hr = reader->ReadSample(
            (DWORD)MF_SOURCE_READER_FIRST_VIDEO_STREAM,
            0, &streamIdx, &flags, &ts, &sample);
        if (FAILED(hr)) {
            Sleep(10);
            continue;
        }
        if (!sample) {
            Sleep(1);
            continue;
        }

        IMFMediaBuffer* mediaBuf = nullptr;
        if (FAILED(sample->ConvertToContiguousBuffer(&mediaBuf)) || !mediaBuf) {
            SafeRelease(sample);
            continue;
        }

        BYTE* data = nullptr;
        DWORD curlen = 0;
        if (SUCCEEDED(mediaBuf->Lock(&data, NULL, &curlen)) && data) {
            EnterCriticalSection(&cam->lock);
            const int rowBytes = W * 4;
            if (stride > 0) {
                for (int y = 0; y < H; y++) {
                    memcpy(cam->latest + y * rowBytes, data + y * stride, rowBytes);
                }
            } else {
                const LONG abs = -stride;
                for (int y = 0; y < H; y++) {
                    memcpy(cam->latest + y * rowBytes, data + (H - 1 - y) * abs, rowBytes);
                }
            }
            cam->frame_ready = true;
            LeaveCriticalSection(&cam->lock);
            mediaBuf->Unlock();

            // child window に直接描画 (このスレッドが child を所有しているので OK)
            RECT rc;
            GetClientRect(cam->child_hwnd, &rc);
            int dx = 0, dy = 0, dw = rc.right, dh = rc.bottom;
            if (cam->aspect_mode == 1 && W > 0 && H > 0 && dw > 0 && dh > 0) {
                // letterbox: src と dst の比率を比較して fit
                long long srcAR = (long long)W * dh;
                long long dstAR = (long long)H * dw;
                if (srcAR > dstAR) {
                    // src の方が横長 → 横を dw にあわせて高さを縮める
                    int newH = (int)((long long)dw * H / W);
                    dy = (dh - newH) / 2;
                    dh = newH;
                } else {
                    int newW = (int)((long long)dh * W / H);
                    dx = (dw - newW) / 2;
                    dw = newW;
                }
                // 余白を黒で塗る (ちらつき対策で枠だけ)
                RECT outer;
                GetClientRect(cam->child_hwnd, &outer);
                HBRUSH br = (HBRUSH)GetStockObject(BLACK_BRUSH);
                if (dx > 0) {
                    RECT lr = { 0, 0, dx, outer.bottom };
                    RECT rr = { dx + dw, 0, outer.right, outer.bottom };
                    FillRect(hdc, &lr, br);
                    FillRect(hdc, &rr, br);
                }
                if (dy > 0) {
                    RECT tr = { 0, 0, outer.right, dy };
                    RECT br2 = { 0, dy + dh, outer.right, outer.bottom };
                    FillRect(hdc, &tr, br);
                    FillRect(hdc, &br2, br);
                }
            }
            StretchDIBits(hdc,
                          dx, dy, dw, dh,
                          0, 0, W, H,
                          cam->latest, &bmi, DIB_RGB_COLORS, SRCCOPY);
        }
        SafeRelease(mediaBuf);
        SafeRelease(sample);
    }

    // ----- クリーンアップ -----
    if (hdc && cam->child_hwnd) {
        ReleaseDC(cam->child_hwnd, hdc);
    }
    if (cam->child_hwnd) {
        DestroyWindow(cam->child_hwnd);
        cam->child_hwnd = NULL;
    }
    SafeRelease(reader);
    if (cam->latest) {
        free(cam->latest);
        cam->latest = nullptr;
    }
    if (SUCCEEDED(hrCo)) CoUninitialize();
    return 0;
}

} // namespace

//============================================================
// エクスポート
//============================================================

// 内部: 指定 source type で device を列挙して count を返す
static int EnumDeviceCount(REFGUID sourceType) {
    IMFAttributes* attrs = nullptr;
    if (FAILED(MFCreateAttributes(&attrs, 1))) return 0;
    attrs->SetGUID(MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE, sourceType);
    IMFActivate** devices = nullptr;
    UINT32 count = 0;
    HRESULT hr = MFEnumDeviceSources(attrs, &devices, &count);
    attrs->Release();
    if (FAILED(hr)) return 0;
    for (UINT32 i = 0; i < count; i++) SafeRelease(devices[i]);
    CoTaskMemFree(devices);
    return (int)count;
}

// 内部: 指定 source type の idx 番目のデバイス friendly name を ANSI で書き込む
static int EnumDeviceName(REFGUID sourceType, int idx, char* buf, int buflen) {
    if (!buf || buflen <= 0) return 0;
    buf[0] = '\0';
    IMFAttributes* attrs = nullptr;
    if (FAILED(MFCreateAttributes(&attrs, 1))) return 0;
    attrs->SetGUID(MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE, sourceType);
    IMFActivate** devices = nullptr;
    UINT32 count = 0;
    HRESULT hr = MFEnumDeviceSources(attrs, &devices, &count);
    attrs->Release();
    if (FAILED(hr)) return 0;

    int written = 0;
    if ((UINT32)idx < count && devices[idx]) {
        WCHAR* name = nullptr;
        UINT32 nameLen = 0;
        if (SUCCEEDED(devices[idx]->GetAllocatedString(
                MF_DEVSOURCE_ATTRIBUTE_FRIENDLY_NAME, &name, &nameLen)) && name) {
            int n = WideCharToMultiByte(CP_ACP, 0, name, -1, buf, buflen, NULL, NULL);
            if (n > 0) written = 1;
            CoTaskMemFree(name);
        }
    }
    for (UINT32 i = 0; i < count; i++) SafeRelease(devices[i]);
    CoTaskMemFree(devices);
    return written;
}

HSPMFCAM_EXPORT int __stdcall mfcam_count() {
    return EnumDeviceCount(MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_GUID);
}

HSPMFCAM_EXPORT int __stdcall mfcam_get_name(int idx, char* buf, int buflen) {
    return EnumDeviceName(MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_GUID, idx, buf, buflen);
}

HSPMFCAM_EXPORT int __stdcall mfcam_audio_count() {
    return EnumDeviceCount(MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_GUID);
}

HSPMFCAM_EXPORT int __stdcall mfcam_audio_get_name(int idx, char* buf, int buflen) {
    return EnumDeviceName(MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_GUID, idx, buf, buflen);
}

// ステート定数 (HSP 側に公開)
//   0 = MFCAM_STATE_FREE     スロット未使用
//   1 = MFCAM_STATE_OPENING  worker 起動中 (まだフレーム未到着)
//   2 = MFCAM_STATE_READY    初回フレーム取得済 (再生中)
//   3 = MFCAM_STATE_ERROR    open 失敗 / 異常
HSPMFCAM_EXPORT int __stdcall mfcam_get_state(int handle) {
    if (handle < 0 || handle >= MAX_CAMS) return 0;
    CamState& cam = g_cams[handle];
    if (!cam.slot_used) return 0;
    if (!cam.active) return 3;
    if (!cam.frame_ready) return 1;
    return 2;
}

HSPMFCAM_EXPORT int __stdcall mfcam_set_aspect(int handle, int mode) {
    if (handle < 0 || handle >= MAX_CAMS) return 0;
    CamState& cam = g_cams[handle];
    if (!cam.slot_used) return 0;
    cam.aspect_mode = mode;
    return 1;
}

HSPMFCAM_EXPORT int __stdcall mfcam_open(int idx, void* parent_hwnd,
                                         int x, int y, int w, int h,
                                         int* out_w, int* out_h) {
    int handle = FindFreeHandle();
    if (handle < 0) return -1;

    CamState& cam = g_cams[handle];
    cam.slot_used = true;
    cam.active = false;
    cam.open_ok = false;
    cam.device_idx = idx;
    cam.parent_hwnd = (HWND)parent_hwnd;
    cam.init_x = x;
    cam.init_y = y;
    cam.init_w = w;
    cam.init_h = h;
    cam.width = 0;
    cam.height = 0;
    cam.stride = 0;
    cam.child_hwnd = NULL;
    cam.latest = nullptr;
    cam.frame_ready = false;

    if (!cam.lock_inited) {
        InitializeCriticalSection(&cam.lock);
        cam.lock_inited = true;
    }
    cam.ready_event = CreateEventW(NULL, TRUE, FALSE, NULL);
    if (!cam.ready_event) {
        cam.slot_used = false;
        return -1;
    }

    cam.worker = CreateThread(NULL, 0, WorkerProc, &cam, 0, NULL);
    if (!cam.worker) {
        CloseHandle(cam.ready_event);
        cam.ready_event = NULL;
        cam.slot_used = false;
        return -1;
    }

    // worker が MF 初期化 + window 作成を終えるまで待つ (最大 5 秒)
    WaitForSingleObject(cam.ready_event, 5000);
    CloseHandle(cam.ready_event);
    cam.ready_event = NULL;

    if (!cam.open_ok) {
        // worker が失敗した — thread の終了を待ってクリーンアップ
        WaitForSingleObject(cam.worker, 2000);
        CloseHandle(cam.worker);
        cam.worker = NULL;
        cam.slot_used = false;
        return -1;
    }

    if (out_w) *out_w = cam.width;
    if (out_h) *out_h = cam.height;
    return handle;
}

HSPMFCAM_EXPORT int __stdcall mfcam_set_pos(int handle, int x, int y, int w, int h) {
    if (handle < 0 || handle >= MAX_CAMS) return 0;
    CamState& cam = g_cams[handle];
    if (!cam.slot_used || !cam.child_hwnd) return 0;
    SetWindowPos(cam.child_hwnd, NULL, x, y, w, h, SWP_NOZORDER | SWP_NOACTIVATE);
    return 1;
}

HSPMFCAM_EXPORT int __stdcall mfcam_read(int handle, void* bgra_buf) {
    if (handle < 0 || handle >= MAX_CAMS) return 0;
    CamState& cam = g_cams[handle];
    if (!cam.slot_used || !cam.latest || !bgra_buf) return 0;
    EnterCriticalSection(&cam.lock);
    bool ready = cam.frame_ready;
    if (ready) {
        memcpy(bgra_buf, cam.latest, (size_t)cam.width * cam.height * 4);
    }
    LeaveCriticalSection(&cam.lock);
    return ready ? 1 : 0;
}

// 拡張子から WIC エンコーダ GUID を返す。未対応なら PNG をデフォルト。
static GUID GuessWicContainer(const char* path) {
    if (!path) return GUID_ContainerFormatPng;
    const char* dot = strrchr(path, '.');
    if (!dot) return GUID_ContainerFormatPng;
    if (_stricmp(dot, ".png")  == 0) return GUID_ContainerFormatPng;
    if (_stricmp(dot, ".jpg")  == 0) return GUID_ContainerFormatJpeg;
    if (_stricmp(dot, ".jpeg") == 0) return GUID_ContainerFormatJpeg;
    if (_stricmp(dot, ".bmp")  == 0) return GUID_ContainerFormatBmp;
    if (_stricmp(dot, ".gif")  == 0) return GUID_ContainerFormatGif;
    if (_stricmp(dot, ".tif")  == 0) return GUID_ContainerFormatTiff;
    if (_stricmp(dot, ".tiff") == 0) return GUID_ContainerFormatTiff;
    return GUID_ContainerFormatPng;
}

HSPMFCAM_EXPORT int __stdcall mfcam_save_snapshot(int handle, const char* path) {
    if (handle < 0 || handle >= MAX_CAMS) return 0;
    CamState& cam = g_cams[handle];
    if (!cam.slot_used || !cam.latest || !path) return 0;

    // ロックして latest をスナップショットコピー
    EnterCriticalSection(&cam.lock);
    if (!cam.frame_ready) {
        LeaveCriticalSection(&cam.lock);
        return 0;
    }
    int W = cam.width;
    int H = cam.height;
    BYTE* snapshot = (BYTE*)malloc((size_t)W * H * 4);
    if (!snapshot) {
        LeaveCriticalSection(&cam.lock);
        return 0;
    }
    memcpy(snapshot, cam.latest, (size_t)W * H * 4);
    LeaveCriticalSection(&cam.lock);

    // ANSI path → wide
    int wlen = MultiByteToWideChar(CP_ACP, 0, path, -1, NULL, 0);
    if (wlen <= 0) { free(snapshot); return 0; }
    wchar_t* wpath = (wchar_t*)malloc(sizeof(wchar_t) * wlen);
    if (!wpath) { free(snapshot); return 0; }
    MultiByteToWideChar(CP_ACP, 0, path, -1, wpath, wlen);

    // この呼び出しスレッド (HSP main thread) で COM 初期化
    HRESULT hrCo = CoInitializeEx(NULL, COINIT_APARTMENTTHREADED | COINIT_DISABLE_OLE1DDE);
    bool needUninit = SUCCEEDED(hrCo);

    int success = 0;
    IWICImagingFactory* factory = nullptr;
    IWICStream* stream = nullptr;
    IWICBitmapEncoder* encoder = nullptr;
    IWICBitmapFrameEncode* frame = nullptr;

    HRESULT hr = CoCreateInstance(CLSID_WICImagingFactory, NULL,
                                  CLSCTX_INPROC_SERVER, IID_PPV_ARGS(&factory));
    if (SUCCEEDED(hr) && factory) {
        hr = factory->CreateStream(&stream);
        if (SUCCEEDED(hr)) hr = stream->InitializeFromFilename(wpath, GENERIC_WRITE);
        if (SUCCEEDED(hr)) hr = factory->CreateEncoder(GuessWicContainer(path), NULL, &encoder);
        if (SUCCEEDED(hr)) hr = encoder->Initialize(stream, WICBitmapEncoderNoCache);
        if (SUCCEEDED(hr)) hr = encoder->CreateNewFrame(&frame, NULL);
        if (SUCCEEDED(hr)) hr = frame->Initialize(NULL);
        if (SUCCEEDED(hr)) hr = frame->SetSize((UINT)W, (UINT)H);
        if (SUCCEEDED(hr)) {
            WICPixelFormatGUID pf = GUID_WICPixelFormat32bppBGRA;
            hr = frame->SetPixelFormat(&pf);
        }
        if (SUCCEEDED(hr)) {
            UINT stride = (UINT)W * 4;
            hr = frame->WritePixels((UINT)H, stride, stride * (UINT)H, snapshot);
        }
        if (SUCCEEDED(hr)) hr = frame->Commit();
        if (SUCCEEDED(hr)) hr = encoder->Commit();
        if (SUCCEEDED(hr)) success = 1;
    }
    SafeRelease(frame);
    SafeRelease(encoder);
    SafeRelease(stream);
    SafeRelease(factory);

    if (needUninit) CoUninitialize();
    free(wpath);
    free(snapshot);
    return success;
}

HSPMFCAM_EXPORT void __stdcall mfcam_close(int handle) {
    if (handle < 0 || handle >= MAX_CAMS) return;
    CamState& cam = g_cams[handle];
    if (!cam.slot_used) return;

    cam.active = false;
    if (cam.child_hwnd) {
        // worker が PeekMessage で WM_QUIT を見つけて自然終了するように促す
        PostMessageW(cam.child_hwnd, WM_CLOSE, 0, 0);
    }
    if (cam.worker) {
        // worker thread に WM_QUIT を送る (PeekMessage で見つかる)
        DWORD tid = GetThreadId(cam.worker);
        if (tid) PostThreadMessageW(tid, WM_QUIT, 0, 0);
        WaitForSingleObject(cam.worker, 3000);
        CloseHandle(cam.worker);
        cam.worker = NULL;
    }
    cam.width = 0;
    cam.height = 0;
    cam.slot_used = false;
}

//============================================================
// DllMain
//============================================================

BOOL WINAPI DllMain(HMODULE, DWORD reason, LPVOID) {
    if (reason == DLL_PROCESS_ATTACH) {
        if (SUCCEEDED(MFStartup(MF_VERSION, MFSTARTUP_FULL))) {
            g_mf_initialized = true;
        }
    } else if (reason == DLL_PROCESS_DETACH) {
        for (int i = 0; i < MAX_CAMS; i++) {
            if (g_cams[i].slot_used) {
                g_cams[i].active = false;
                if (g_cams[i].worker) {
                    DWORD tid = GetThreadId(g_cams[i].worker);
                    if (tid) PostThreadMessageW(tid, WM_QUIT, 0, 0);
                    WaitForSingleObject(g_cams[i].worker, 1000);
                    CloseHandle(g_cams[i].worker);
                }
                if (g_cams[i].lock_inited) {
                    DeleteCriticalSection(&g_cams[i].lock);
                }
            }
        }
        if (g_mf_initialized) {
            MFShutdown();
            g_mf_initialized = false;
        }
    }
    return TRUE;
}
