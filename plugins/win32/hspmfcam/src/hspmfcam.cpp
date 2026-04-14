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
#include <strmif.h>      // IAMVideoProcAmp / IAMCameraControl
#include <cstring>
#include <cstdlib>
#include <cstdio>
#include <cmath>

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
    int    fps_num = 30;
    int    fps_den = 1;

    // Phase 2-B: 任意フォーマット指定 open のための desired params
    // (mfcam_open_ex でセットされる。0 なら "気にしない")
    int    desired_w = 0;
    int    desired_h = 0;
    int    desired_fps_num = 0;
    int    desired_fps_den = 0;

    HANDLE worker = NULL;
    HANDLE ready_event = NULL;
    HWND   child_hwnd = NULL;

    CRITICAL_SECTION lock;
    bool             lock_inited = false;
    BYTE*            latest = nullptr;
    bool             frame_ready = false;

    // Phase 2-D: 録画用 (SinkWriter)
    IMFSinkWriter*   writer = nullptr;
    DWORD            writer_video_stream = 0;
    LONGLONG         record_start_qpc = 0;
    LONGLONG         qpc_freq = 0;
    bool             recording = false;

    // Phase 2-C: カメラプロパティ用 (IAMVideoProcAmp / IAMCameraControl 取得元)
    IMFMediaSource*  source = nullptr;

    // Phase 2-E: 音声録画用
    IMFSourceReader* audio_reader = nullptr;
    DWORD            writer_audio_stream = 0;
    HANDLE           audio_worker = NULL;
    bool             audio_active = false;
    UINT32           audio_sample_rate = 48000;
    UINT32           audio_channels = 2;
    UINT32           audio_bits = 16;
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

// 内部: native types を走査して desired_w/h/fps と最も近い type を選ぶ。
// 見つかれば SetCurrentMediaType でその native type を一旦設定 → そのあと
// RGB32 + same w/h/fps で再設定 (MF が color converter MFT を自動挿入)。
// desired が 0 の場合は単純に RGB32 + デフォルトサイズ。
HRESULT ConfigureReader(IMFSourceReader* reader,
                        int desired_w, int desired_h,
                        int desired_fps_num, int desired_fps_den,
                        int* outW, int* outH, LONG* outStride,
                        int* outFpsNum, int* outFpsDen) {
    HRESULT hr;
    const DWORD STREAM = (DWORD)MF_SOURCE_READER_FIRST_VIDEO_STREAM;

    // Phase 2-B: desired 指定があれば native 列挙して最近接 type を選ぶ
    if (desired_w > 0 && desired_h > 0) {
        long long best_score = -1;
        int best_idx = -1;
        IMFMediaType* best_mt = nullptr;
        DWORD type_idx = 0;
        while (true) {
            IMFMediaType* mt = nullptr;
            hr = reader->GetNativeMediaType(STREAM, type_idx, &mt);
            if (hr == MF_E_NO_MORE_TYPES || FAILED(hr)) break;

            UINT32 nw = 0, nh = 0;
            UINT32 nfn = 0, nfd = 1;
            if (SUCCEEDED(MFGetAttributeSize(mt, MF_MT_FRAME_SIZE, &nw, &nh))) {
                MFGetAttributeRatio(mt, MF_MT_FRAME_RATE, &nfn, &nfd);

                // スコア: サイズ差の絶対値合計 + fps 差 (重み小)
                long long sd = (long long)abs((int)nw - desired_w)
                             + (long long)abs((int)nh - desired_h);
                if (desired_fps_num > 0 && desired_fps_den > 0) {
                    double dfps = (double)desired_fps_num / desired_fps_den;
                    double nfps = (double)nfn / (nfd == 0 ? 1 : nfd);
                    sd += (long long)(fabs(nfps - dfps) * 10);
                }
                if (best_score < 0 || sd < best_score) {
                    best_score = sd;
                    best_idx = (int)type_idx;
                    SafeRelease(best_mt);
                    best_mt = mt;
                    mt = nullptr;
                }
            }
            SafeRelease(mt);
            type_idx++;
            if (type_idx > 256) break;  // 安全弁
        }

        if (best_mt) {
            // まず native type を設定 (size/fps を伝える)
            reader->SetCurrentMediaType(STREAM, NULL, best_mt);
            SafeRelease(best_mt);
        }
    }

    // RGB32 + Progressive を要求 → MF が必要なら自動で
    // Color Converter MFT + Video Processor MFT (deinterlace) を挿入。
    // ※ Reader 側に MF_SOURCE_READER_ENABLE_VIDEO_PROCESSING=TRUE が必要
    //   (この関数の呼び出し元 WorkerProc で設定)。
    IMFMediaType* mt = nullptr;
    hr = MFCreateMediaType(&mt);
    if (FAILED(hr)) return hr;
    mt->SetGUID(MF_MT_MAJOR_TYPE, MFMediaType_Video);
    mt->SetGUID(MF_MT_SUBTYPE, MFVideoFormat_RGB32);
    mt->SetUINT32(MF_MT_INTERLACE_MODE, MFVideoInterlace_Progressive);
    hr = reader->SetCurrentMediaType(STREAM, NULL, mt);
    SafeRelease(mt);
    if (FAILED(hr)) return hr;

    IMFMediaType* current = nullptr;
    hr = reader->GetCurrentMediaType(STREAM, &current);
    if (FAILED(hr)) return hr;

    UINT32 w = 0, h = 0;
    hr = MFGetAttributeSize(current, MF_MT_FRAME_SIZE, &w, &h);
    if (FAILED(hr)) { SafeRelease(current); return hr; }

    UINT32 fps_n = 30, fps_d = 1;
    MFGetAttributeRatio(current, MF_MT_FRAME_RATE, &fps_n, &fps_d);

    LONG stride = 0;
    hr = MFGetStrideForBitmapInfoHeader(MFVideoFormat_RGB32.Data1, w, &stride);
    SafeRelease(current);
    if (FAILED(hr)) {
        stride = (LONG)w * 4;
    }

    *outW = (int)w;
    *outH = (int)h;
    *outStride = stride;
    if (outFpsNum) *outFpsNum = (int)fps_n;
    if (outFpsDen) *outFpsDen = (int)fps_d;
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

    // Reader 作成時に video processing を有効化:
    //   * Color Conversion (YUY2/NV12/MJPG → RGB32)
    //   * Resize (任意の解像度に対応)
    //   * Deinterlace (interlaced → progressive 自動変換)
    // これでキャプチャカードからの 1080i 等も progressive RGB32 として
    // 取得できるようになる。
    IMFAttributes* readerAttrs = nullptr;
    MFCreateAttributes(&readerAttrs, 1);
    if (readerAttrs) {
        readerAttrs->SetUINT32(MF_SOURCE_READER_ENABLE_VIDEO_PROCESSING, TRUE);
    }
    IMFSourceReader* reader = nullptr;
    hr = MFCreateSourceReaderFromMediaSource(source, readerAttrs, &reader);
    SafeRelease(readerAttrs);
    if (FAILED(hr) || !reader) {
        SafeRelease(source);
        cam->open_ok = false;
        SetEvent(cam->ready_event);
        if (SUCCEEDED(hrCo)) CoUninitialize();
        return 0;
    }
    // Phase 2-C: source を保持してプロパティアクセスに使う
    cam->source = source;
    source = nullptr;

    int W = 0, H = 0;
    LONG stride = 0;
    int fps_n = 30, fps_d = 1;
    hr = ConfigureReader(reader,
                         cam->desired_w, cam->desired_h,
                         cam->desired_fps_num, cam->desired_fps_den,
                         &W, &H, &stride, &fps_n, &fps_d);
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
    cam->fps_num = fps_n;
    cam->fps_den = fps_d;
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

            // Phase 2-D: 録画中なら SinkWriter にもフレームを書く
            if (cam->recording && cam->writer) {
                IMFSample* outSample = nullptr;
                if (SUCCEEDED(MFCreateSample(&outSample))) {
                    IMFMediaBuffer* outBuf = nullptr;
                    DWORD frameBytes = (DWORD)W * (DWORD)H * 4;
                    if (SUCCEEDED(MFCreateMemoryBuffer(frameBytes, &outBuf))) {
                        BYTE* dst = nullptr;
                        if (SUCCEEDED(outBuf->Lock(&dst, NULL, NULL))) {
                            memcpy(dst, cam->latest, frameBytes);
                            outBuf->Unlock();
                        }
                        outBuf->SetCurrentLength(frameBytes);
                        outSample->AddBuffer(outBuf);

                        LARGE_INTEGER nowQpc;
                        QueryPerformanceCounter(&nowQpc);
                        LONGLONG diff = nowQpc.QuadPart - cam->record_start_qpc;
                        LONGLONG t100ns = (cam->qpc_freq > 0)
                            ? (diff * 10000000LL / cam->qpc_freq) : 0;
                        outSample->SetSampleTime(t100ns);
                        // 1 フレーム duration (fps から逆算)
                        LONGLONG dur = (cam->fps_num > 0)
                            ? (10000000LL * (LONGLONG)cam->fps_den / (LONGLONG)cam->fps_num)
                            : 333333LL;
                        outSample->SetSampleDuration(dur);

                        cam->writer->WriteSample(cam->writer_video_stream, outSample);
                        SafeRelease(outBuf);
                    }
                    SafeRelease(outSample);
                }
            }
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
    SafeRelease(cam->source);
    if (cam->latest) {
        free(cam->latest);
        cam->latest = nullptr;
    }
    if (SUCCEEDED(hrCo)) CoUninitialize();
    return 0;
}

// Phase 2-E: 音声デバイスを開いて IMFMediaSource を返す
HRESULT OpenAudioDeviceSource(int idx, IMFMediaSource** outSource) {
    *outSource = nullptr;
    IMFAttributes* attrs = nullptr;
    HRESULT hr = MFCreateAttributes(&attrs, 1);
    if (FAILED(hr)) return hr;
    attrs->SetGUID(MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE,
                   MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_GUID);
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

// Phase 2-E: 音声 worker thread。常時 ReadSample → SinkWriter に書く。
DWORD WINAPI AudioWorkerProc(LPVOID arg) {
    CamState* cam = (CamState*)arg;
    HRESULT hrCo = CoInitializeEx(NULL, COINIT_APARTMENTTHREADED | COINIT_DISABLE_OLE1DDE);

    while (cam->audio_active) {
        if (!cam->audio_reader) { Sleep(10); continue; }

        DWORD streamIdx = 0, flags = 0;
        LONGLONG ts = 0;
        IMFSample* sample = nullptr;
        HRESULT hr = cam->audio_reader->ReadSample(
            (DWORD)MF_SOURCE_READER_FIRST_AUDIO_STREAM,
            0, &streamIdx, &flags, &ts, &sample);
        if (FAILED(hr)) { Sleep(5); continue; }
        if (!sample)   { Sleep(1); continue; }

        // 録画中のみ SinkWriter に書く
        if (cam->recording && cam->writer) {
            LARGE_INTEGER nowQpc;
            QueryPerformanceCounter(&nowQpc);
            LONGLONG diff = nowQpc.QuadPart - cam->record_start_qpc;
            LONGLONG t100ns = (cam->qpc_freq > 0)
                ? (diff * 10000000LL / cam->qpc_freq) : 0;
            sample->SetSampleTime(t100ns);

            EnterCriticalSection(&cam->lock);
            if (cam->writer && cam->recording) {
                cam->writer->WriteSample(cam->writer_audio_stream, sample);
            }
            LeaveCriticalSection(&cam->lock);
        }
        SafeRelease(sample);
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

// 内部: 指定 source type の idx 番目のデバイスから任意の string 属性を
// 取得して ANSI で書き込む。
// (id_attr に MF_DEVSOURCE_ATTRIBUTE_FRIENDLY_NAME / SYMBOLIC_LINK /
//  ENDPOINT_ID 等の GUID を渡す)
static int EnumDeviceString(REFGUID sourceType, REFGUID id_attr, int idx, char* buf, int buflen) {
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
        if (SUCCEEDED(devices[idx]->GetAllocatedString(id_attr, &name, &nameLen)) && name) {
            int n = WideCharToMultiByte(CP_ACP, 0, name, -1, buf, buflen, NULL, NULL);
            if (n > 0) written = 1;
            CoTaskMemFree(name);
        }
    }
    for (UINT32 i = 0; i < count; i++) SafeRelease(devices[i]);
    CoTaskMemFree(devices);
    return written;
}

// 後方互換ラッパ
static int EnumDeviceName(REFGUID sourceType, int idx, char* buf, int buflen) {
    return EnumDeviceString(sourceType, MF_DEVSOURCE_ATTRIBUTE_FRIENDLY_NAME, idx, buf, buflen);
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

// Phase 2: ユニーク ID 取得 (同じ friendly name のデバイスを区別するため)
//   カメラ: SymbolicLink (USB device path 等)
//   オーディオ: EndpointID (WASAPI endpoint)
HSPMFCAM_EXPORT int __stdcall mfcam_get_id(int idx, char* buf, int buflen) {
    return EnumDeviceString(MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_GUID,
                            MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_SYMBOLIC_LINK,
                            idx, buf, buflen);
}

HSPMFCAM_EXPORT int __stdcall mfcam_audio_get_id(int idx, char* buf, int buflen) {
    return EnumDeviceString(MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_GUID,
                            MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_ENDPOINT_ID,
                            idx, buf, buflen);
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

// Phase 2-A: 内部 — subtype GUID から FOURCC 文字列を生成
static void GuidToFourCC(REFGUID g, char* out16) {
    if (IsEqualGUID(g, MFVideoFormat_RGB32))   { strcpy(out16, "RGB32");  return; }
    if (IsEqualGUID(g, MFVideoFormat_RGB24))   { strcpy(out16, "RGB24");  return; }
    if (IsEqualGUID(g, MFVideoFormat_ARGB32))  { strcpy(out16, "ARGB32"); return; }
    if (IsEqualGUID(g, MFVideoFormat_RGB565))  { strcpy(out16, "RGB565"); return; }
    if (IsEqualGUID(g, MFVideoFormat_RGB555))  { strcpy(out16, "RGB555"); return; }
    if (IsEqualGUID(g, MFVideoFormat_RGB8))    { strcpy(out16, "RGB8");   return; }

    // それ以外は GUID Data1 を 4-char FOURCC として扱う (NV12, YUY2, MJPG 等)
    DWORD fcc = g.Data1;
    out16[0] = (char)( fcc        & 0xFF);
    out16[1] = (char)((fcc >>  8) & 0xFF);
    out16[2] = (char)((fcc >> 16) & 0xFF);
    out16[3] = (char)((fcc >> 24) & 0xFF);
    out16[4] = 0;
    // ASCII 印字可能でなければ十六進
    for (int i = 0; i < 4; i++) {
        if (out16[i] < 0x20 || out16[i] > 0x7e) {
            sprintf(out16, "0x%08X", fcc);
            return;
        }
    }
}

// 内部: 指定 device の native フォーマット情報を取得 (一時 source/reader を作る)
struct FormatInfo {
    int w, h;
    int fps_num, fps_den;
    char fourcc[16];
};

static int EnumFormats(int dev_idx, FormatInfo* out_arr, int max_count) {
    HRESULT hr;
    IMFMediaSource* source = nullptr;
    hr = OpenDeviceSource(dev_idx, &source);
    if (FAILED(hr) || !source) return 0;

    IMFAttributes* attrs = nullptr;
    MFCreateAttributes(&attrs, 1);
    if (attrs) attrs->SetUINT32(MF_SOURCE_READER_ENABLE_VIDEO_PROCESSING, FALSE);

    IMFSourceReader* reader = nullptr;
    hr = MFCreateSourceReaderFromMediaSource(source, attrs, &reader);
    SafeRelease(attrs);
    SafeRelease(source);
    if (FAILED(hr) || !reader) return 0;

    int count = 0;
    DWORD type_idx = 0;
    while (count < max_count && type_idx < 256) {
        IMFMediaType* mt = nullptr;
        hr = reader->GetNativeMediaType((DWORD)MF_SOURCE_READER_FIRST_VIDEO_STREAM,
                                        type_idx, &mt);
        if (hr == MF_E_NO_MORE_TYPES || FAILED(hr)) { SafeRelease(mt); break; }

        UINT32 w = 0, h = 0;
        if (SUCCEEDED(MFGetAttributeSize(mt, MF_MT_FRAME_SIZE, &w, &h))) {
            UINT32 fn = 0, fd = 1;
            MFGetAttributeRatio(mt, MF_MT_FRAME_RATE, &fn, &fd);

            GUID subtype = {};
            mt->GetGUID(MF_MT_SUBTYPE, &subtype);

            if (out_arr) {
                out_arr[count].w = (int)w;
                out_arr[count].h = (int)h;
                out_arr[count].fps_num = (int)fn;
                out_arr[count].fps_den = (int)fd;
                GuidToFourCC(subtype, out_arr[count].fourcc);
            }
            count++;
        }
        SafeRelease(mt);
        type_idx++;
    }
    SafeRelease(reader);
    return count;
}

HSPMFCAM_EXPORT int __stdcall mfcam_format_count(int dev_idx) {
    return EnumFormats(dev_idx, NULL, 1024);
}

HSPMFCAM_EXPORT int __stdcall mfcam_format_get(int dev_idx, int fmt_idx,
                                               int* out_w, int* out_h,
                                               int* out_fps_num, int* out_fps_den,
                                               char* out_fourcc, int fourcc_len) {
    if (fmt_idx < 0) return 0;
    int total = EnumFormats(dev_idx, NULL, 1024);
    if (fmt_idx >= total) return 0;

    FormatInfo* arr = (FormatInfo*)calloc(total, sizeof(FormatInfo));
    if (!arr) return 0;
    int n = EnumFormats(dev_idx, arr, total);
    int ok = 0;
    if (fmt_idx < n) {
        if (out_w)       *out_w       = arr[fmt_idx].w;
        if (out_h)       *out_h       = arr[fmt_idx].h;
        if (out_fps_num) *out_fps_num = arr[fmt_idx].fps_num;
        if (out_fps_den) *out_fps_den = arr[fmt_idx].fps_den;
        if (out_fourcc && fourcc_len > 0) {
            int n2 = (int)strlen(arr[fmt_idx].fourcc);
            if (n2 >= fourcc_len) n2 = fourcc_len - 1;
            memcpy(out_fourcc, arr[fmt_idx].fourcc, n2);
            out_fourcc[n2] = 0;
        }
        ok = 1;
    }
    free(arr);
    return ok;
}

// 内部実装: open_ex の本体。desired_* が 0 ならデフォルト動作。
static int OpenInternal(int idx, void* parent_hwnd, int x, int y, int w, int h,
                        int desired_w, int desired_h,
                        int desired_fps_num, int desired_fps_den,
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
    cam.desired_w = desired_w;
    cam.desired_h = desired_h;
    cam.desired_fps_num = desired_fps_num;
    cam.desired_fps_den = desired_fps_den;
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

HSPMFCAM_EXPORT int __stdcall mfcam_open(int idx, void* parent_hwnd,
                                         int x, int y, int w, int h,
                                         int* out_w, int* out_h) {
    return OpenInternal(idx, parent_hwnd, x, y, w, h, 0, 0, 0, 0, out_w, out_h);
}

// Phase 2-B: 任意フォーマット指定 open
//   desired_w/desired_h: 0 = デフォルト
//   desired_fps_num/desired_fps_den: 0 = デフォルト
HSPMFCAM_EXPORT int __stdcall mfcam_open_ex(int idx, void* parent_hwnd,
                                            int x, int y, int w, int h,
                                            int desired_w, int desired_h,
                                            int desired_fps_num, int desired_fps_den,
                                            int* out_w, int* out_h) {
    return OpenInternal(idx, parent_hwnd, x, y, w, h,
                        desired_w, desired_h, desired_fps_num, desired_fps_den,
                        out_w, out_h);
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

// Phase 2-C: カメラプロパティ
//
// HSP 側 prop_id:
//    0..9  → IAMVideoProcAmp プロパティ (VideoProcAmp_* 値)
//             0=Brightness 1=Contrast 2=Hue 3=Saturation 4=Sharpness
//             5=Gamma 6=ColorEnable 7=WhiteBalance 8=BacklightCompensation 9=Gain
//   10..16 → IAMCameraControl プロパティ (CameraControl_* 値)
//             10=Pan 11=Tilt 12=Roll 13=Zoom 14=Exposure 15=Iris 16=Focus
//
// flags 値:
//    1 = AUTO   2 = MANUAL
//
// 戻り値:
//    1 = 成功 / 0 = 失敗
//
// mfcam_prop_get は value/min/max/step/default/flags を出力。NULL ポインタは無視。
HSPMFCAM_EXPORT int __stdcall mfcam_prop_get(int handle, int prop_id,
                                             int* out_value, int* out_min, int* out_max,
                                             int* out_step, int* out_default, int* out_flags) {
    if (handle < 0 || handle >= MAX_CAMS) return 0;
    CamState& cam = g_cams[handle];
    if (!cam.slot_used || !cam.source) return 0;

    HRESULT hr;
    int success = 0;

    if (prop_id >= 0 && prop_id <= 9) {
        IAMVideoProcAmp* amp = nullptr;
        hr = cam.source->QueryInterface(IID_PPV_ARGS(&amp));
        if (SUCCEEDED(hr) && amp) {
            long minv = 0, maxv = 0, step = 0, defv = 0, flags = 0;
            if (SUCCEEDED(amp->GetRange((long)prop_id, &minv, &maxv, &step, &defv, &flags))) {
                long val = 0, valFlags = 0;
                amp->Get((long)prop_id, &val, &valFlags);
                if (out_value)   *out_value   = (int)val;
                if (out_min)     *out_min     = (int)minv;
                if (out_max)     *out_max     = (int)maxv;
                if (out_step)    *out_step    = (int)step;
                if (out_default) *out_default = (int)defv;
                if (out_flags)   *out_flags   = (int)valFlags;
                success = 1;
            }
            amp->Release();
        }
    } else if (prop_id >= 10 && prop_id <= 16) {
        int ctrl_id = prop_id - 10;
        IAMCameraControl* ctrl = nullptr;
        hr = cam.source->QueryInterface(IID_PPV_ARGS(&ctrl));
        if (SUCCEEDED(hr) && ctrl) {
            long minv = 0, maxv = 0, step = 0, defv = 0, flags = 0;
            if (SUCCEEDED(ctrl->GetRange((long)ctrl_id, &minv, &maxv, &step, &defv, &flags))) {
                long val = 0, valFlags = 0;
                ctrl->Get((long)ctrl_id, &val, &valFlags);
                if (out_value)   *out_value   = (int)val;
                if (out_min)     *out_min     = (int)minv;
                if (out_max)     *out_max     = (int)maxv;
                if (out_step)    *out_step    = (int)step;
                if (out_default) *out_default = (int)defv;
                if (out_flags)   *out_flags   = (int)valFlags;
                success = 1;
            }
            ctrl->Release();
        }
    }
    return success;
}

HSPMFCAM_EXPORT int __stdcall mfcam_prop_set(int handle, int prop_id, int value, int flags) {
    if (handle < 0 || handle >= MAX_CAMS) return 0;
    CamState& cam = g_cams[handle];
    if (!cam.slot_used || !cam.source) return 0;
    if (flags == 0) flags = 2;  // default = MANUAL (1=AUTO, 2=MANUAL)

    int success = 0;
    if (prop_id >= 0 && prop_id <= 9) {
        IAMVideoProcAmp* amp = nullptr;
        if (SUCCEEDED(cam.source->QueryInterface(IID_PPV_ARGS(&amp))) && amp) {
            if (SUCCEEDED(amp->Set((long)prop_id, (long)value, (long)flags))) success = 1;
            amp->Release();
        }
    } else if (prop_id >= 10 && prop_id <= 16) {
        int ctrl_id = prop_id - 10;
        IAMCameraControl* ctrl = nullptr;
        if (SUCCEEDED(cam.source->QueryInterface(IID_PPV_ARGS(&ctrl))) && ctrl) {
            if (SUCCEEDED(ctrl->Set((long)ctrl_id, (long)value, (long)flags))) success = 1;
            ctrl->Release();
        }
    }
    return success;
}

// Phase 2-D: H.264 (or other codec) MP4 録画開始
//
//   handle       : open 済みカメラハンドル
//   path         : 出力 MP4 のパス (ANSI)
//   video_codec  : "" or "H264" のみサポート (Phase 2-F で他コーデック追加)
//   video_bitrate: 平均ビットレート (例 4000000 = 4 Mbps)
//
// 戻り値: 1=成功 / 0=失敗
HSPMFCAM_EXPORT int __stdcall mfcam_record_start(int handle, const char* path,
                                                 const char* video_codec, int video_bitrate) {
    if (handle < 0 || handle >= MAX_CAMS) return 0;
    CamState& cam = g_cams[handle];
    if (!cam.slot_used || !cam.active) return 0;
    if (cam.recording) return 0;  // すでに録画中
    if (!path) return 0;

    // Phase 2-F: 動画コーデック選択
    //   "" / "H264" → H.264 (デフォルト)
    //   "HEVC" / "H265" → HEVC (要 OS HEVC 拡張)
    //   "WMV9" → WMV9 (.wmv コンテナ向け)
    //   "VP9" → VP9 (Win10+)
    //   "MJPG" → Motion JPEG
    GUID encGuid = MFVideoFormat_H264;
    if (video_codec && *video_codec) {
        if      (_stricmp(video_codec, "H264") == 0 ||
                 _stricmp(video_codec, "h264") == 0)  encGuid = MFVideoFormat_H264;
        else if (_stricmp(video_codec, "HEVC") == 0 ||
                 _stricmp(video_codec, "H265") == 0 ||
                 _stricmp(video_codec, "h265") == 0)  encGuid = MFVideoFormat_HEVC;
        else if (_stricmp(video_codec, "WMV9") == 0 ||
                 _stricmp(video_codec, "wmv9") == 0 ||
                 _stricmp(video_codec, "WMV3") == 0)  encGuid = MFVideoFormat_WMV3;
        else if (_stricmp(video_codec, "VP9")  == 0 ||
                 _stricmp(video_codec, "vp9")  == 0)  encGuid = MFVideoFormat_VP90;
        else if (_stricmp(video_codec, "MJPG") == 0 ||
                 _stricmp(video_codec, "MJPEG")== 0)  encGuid = MFVideoFormat_MJPG;
        else return 0;  // 未対応コーデック
    }
    if (video_bitrate <= 0) video_bitrate = 4000000;

    // ANSI path → wide
    int wlen = MultiByteToWideChar(CP_ACP, 0, path, -1, NULL, 0);
    if (wlen <= 0) return 0;
    wchar_t* wpath = (wchar_t*)malloc(sizeof(wchar_t) * wlen);
    if (!wpath) return 0;
    MultiByteToWideChar(CP_ACP, 0, path, -1, wpath, wlen);

    HRESULT hrCo = CoInitializeEx(NULL, COINIT_APARTMENTTHREADED | COINIT_DISABLE_OLE1DDE);
    bool needUninit = SUCCEEDED(hrCo);

    int success = 0;
    EnterCriticalSection(&cam.lock);

    IMFSinkWriter* writer = nullptr;
    HRESULT hr = MFCreateSinkWriterFromURL(wpath, NULL, NULL, &writer);
    if (SUCCEEDED(hr) && writer) {
        // 出力 type
        IMFMediaType* outType = nullptr;
        MFCreateMediaType(&outType);
        outType->SetGUID(MF_MT_MAJOR_TYPE, MFMediaType_Video);
        outType->SetGUID(MF_MT_SUBTYPE, encGuid);
        outType->SetUINT32(MF_MT_AVG_BITRATE, (UINT32)video_bitrate);
        outType->SetUINT32(MF_MT_INTERLACE_MODE, MFVideoInterlace_Progressive);
        MFSetAttributeSize(outType, MF_MT_FRAME_SIZE, (UINT32)cam.width, (UINT32)cam.height);
        MFSetAttributeRatio(outType, MF_MT_FRAME_RATE,
                            (UINT32)cam.fps_num, (UINT32)cam.fps_den);
        MFSetAttributeRatio(outType, MF_MT_PIXEL_ASPECT_RATIO, 1, 1);

        DWORD streamIdx = 0;
        hr = writer->AddStream(outType, &streamIdx);
        SafeRelease(outType);

        if (SUCCEEDED(hr)) {
            // 入力 type (RGB32, top-down は negative stride)
            IMFMediaType* inType = nullptr;
            MFCreateMediaType(&inType);
            inType->SetGUID(MF_MT_MAJOR_TYPE, MFMediaType_Video);
            inType->SetGUID(MF_MT_SUBTYPE, MFVideoFormat_RGB32);
            inType->SetUINT32(MF_MT_INTERLACE_MODE, MFVideoInterlace_Progressive);
            MFSetAttributeSize(inType, MF_MT_FRAME_SIZE, (UINT32)cam.width, (UINT32)cam.height);
            MFSetAttributeRatio(inType, MF_MT_FRAME_RATE,
                                (UINT32)cam.fps_num, (UINT32)cam.fps_den);
            MFSetAttributeRatio(inType, MF_MT_PIXEL_ASPECT_RATIO, 1, 1);
            // top-down stride: positive
            inType->SetUINT32(MF_MT_DEFAULT_STRIDE, (UINT32)(cam.width * 4));

            hr = writer->SetInputMediaType(streamIdx, inType, NULL);
            SafeRelease(inType);
        }

        if (SUCCEEDED(hr)) hr = writer->BeginWriting();

        if (SUCCEEDED(hr)) {
            cam.writer = writer;
            cam.writer_video_stream = streamIdx;
            LARGE_INTEGER freq, start;
            QueryPerformanceFrequency(&freq);
            QueryPerformanceCounter(&start);
            cam.qpc_freq = freq.QuadPart;
            cam.record_start_qpc = start.QuadPart;
            cam.recording = true;
            success = 1;
        } else {
            SafeRelease(writer);
        }
    }
    LeaveCriticalSection(&cam.lock);

    if (needUninit) CoUninitialize();
    free(wpath);
    return success;
}

HSPMFCAM_EXPORT int __stdcall mfcam_record_stop(int handle) {
    if (handle < 0 || handle >= MAX_CAMS) return 0;
    CamState& cam = g_cams[handle];
    if (!cam.slot_used) return 0;
    if (!cam.recording || !cam.writer) return 0;

    EnterCriticalSection(&cam.lock);
    cam.recording = false;
    IMFSinkWriter* w = cam.writer;
    cam.writer = nullptr;
    LeaveCriticalSection(&cam.lock);

    // Phase 2-E: 音声 worker も停止
    if (cam.audio_active) {
        cam.audio_active = false;
        if (cam.audio_worker) {
            WaitForSingleObject(cam.audio_worker, 3000);
            CloseHandle(cam.audio_worker);
            cam.audio_worker = NULL;
        }
        SafeRelease(cam.audio_reader);
    }

    if (w) {
        w->Finalize();
        w->Release();
    }
    return 1;
}

// Phase 2-E: 音声 + 映像 同時録画
//   handle        : open 済みカメラハンドル
//   path          : 出力ファイル (mp4/mkv/mov 等)
//   video_codec   : "" / "H264" / "HEVC" / "WMV9" / "VP9" / "MJPG"
//   video_bitrate : Mbps 換算で 4000000 等
//   audio_dev_idx : mfcam_audio_count() で得たインデックス
//   audio_codec   : "" / "AAC" / "WMA" / "FLAC" / "MP3"
//   audio_bitrate : 平均バイト/秒 (例 16000=128kbps, 24000=192kbps)
//
// 戻り値: 1=成功 / 0=失敗
HSPMFCAM_EXPORT int __stdcall mfcam_record_start_av(int handle, const char* path,
                                                    const char* video_codec, int video_bitrate,
                                                    int audio_dev_idx,
                                                    const char* audio_codec, int audio_bitrate) {
    // まず video のみで録画開始
    int ok = mfcam_record_start(handle, path, video_codec, video_bitrate);
    if (!ok) return 0;

    if (audio_dev_idx < 0) return 1;  // audio 無しでもよい

    CamState& cam = g_cams[handle];

    // audio codec マッピング
    GUID audGuid = MFAudioFormat_AAC;
    if (audio_codec && *audio_codec) {
        if      (_stricmp(audio_codec, "AAC")  == 0) audGuid = MFAudioFormat_AAC;
        else if (_stricmp(audio_codec, "WMA")  == 0) audGuid = MFAudioFormat_WMAudioV9;
        else if (_stricmp(audio_codec, "FLAC") == 0) audGuid = MFAudioFormat_FLAC;
        else if (_stricmp(audio_codec, "MP3")  == 0) audGuid = MFAudioFormat_MP3;
        else { mfcam_record_stop(handle); return 0; }
    }
    if (audio_bitrate <= 0) audio_bitrate = 16000;  // 128 kbps デフォルト

    HRESULT hrCo = CoInitializeEx(NULL, COINIT_APARTMENTTHREADED | COINIT_DISABLE_OLE1DDE);
    bool needUninit = SUCCEEDED(hrCo);

    int success = 0;
    IMFSourceReader* audReader = nullptr;
    EnterCriticalSection(&cam.lock);

    // ----- 音声ソース open -----
    {
        IMFMediaSource* audSrc = nullptr;
        HRESULT hr = OpenAudioDeviceSource(audio_dev_idx, &audSrc);
        if (FAILED(hr) || !audSrc) goto done;

        hr = MFCreateSourceReaderFromMediaSource(audSrc, NULL, &audReader);
        SafeRelease(audSrc);
        if (FAILED(hr) || !audReader) { audReader = nullptr; goto done; }
    }

    // 入力音声を PCM 16bit 48kHz stereo に
    {
        IMFMediaType* pcm = nullptr;
        MFCreateMediaType(&pcm);
        pcm->SetGUID(MF_MT_MAJOR_TYPE, MFMediaType_Audio);
        pcm->SetGUID(MF_MT_SUBTYPE, MFAudioFormat_PCM);
        pcm->SetUINT32(MF_MT_AUDIO_BITS_PER_SAMPLE, 16);
        pcm->SetUINT32(MF_MT_AUDIO_SAMPLES_PER_SECOND, 48000);
        pcm->SetUINT32(MF_MT_AUDIO_NUM_CHANNELS, 2);
        pcm->SetUINT32(MF_MT_AUDIO_BLOCK_ALIGNMENT, 4);   // 16bit*2ch = 4byte
        pcm->SetUINT32(MF_MT_AUDIO_AVG_BYTES_PER_SECOND, 48000 * 4);
        pcm->SetUINT32(MF_MT_ALL_SAMPLES_INDEPENDENT, TRUE);
        HRESULT hr2 = audReader->SetCurrentMediaType((DWORD)MF_SOURCE_READER_FIRST_AUDIO_STREAM, NULL, pcm);
        SafeRelease(pcm);
        if (FAILED(hr2)) { SafeRelease(audReader); audReader = nullptr; goto done; }
    }

    cam.audio_sample_rate = 48000;
    cam.audio_channels = 2;
    cam.audio_bits = 16;

    // ----- SinkWriter に音声ストリーム追加 -----
    {
        IMFMediaType* outAud = nullptr;
        MFCreateMediaType(&outAud);
        outAud->SetGUID(MF_MT_MAJOR_TYPE, MFMediaType_Audio);
        outAud->SetGUID(MF_MT_SUBTYPE, audGuid);
        outAud->SetUINT32(MF_MT_AUDIO_BITS_PER_SAMPLE, 16);
        outAud->SetUINT32(MF_MT_AUDIO_SAMPLES_PER_SECOND, 48000);
        outAud->SetUINT32(MF_MT_AUDIO_NUM_CHANNELS, 2);
        outAud->SetUINT32(MF_MT_AUDIO_AVG_BYTES_PER_SECOND, (UINT32)audio_bitrate);
        if (IsEqualGUID(audGuid, MFAudioFormat_AAC)) {
            outAud->SetUINT32(MF_MT_AAC_AUDIO_PROFILE_LEVEL_INDICATION, 0x29);  // L4
        }

        DWORD audStreamIdx = 0;
        HRESULT hr3 = cam.writer->AddStream(outAud, &audStreamIdx);
        if (SUCCEEDED(hr3)) {
            // 入力 PCM type を SinkWriter に通知
            IMFMediaType* inAud = nullptr;
            MFCreateMediaType(&inAud);
            inAud->SetGUID(MF_MT_MAJOR_TYPE, MFMediaType_Audio);
            inAud->SetGUID(MF_MT_SUBTYPE, MFAudioFormat_PCM);
            inAud->SetUINT32(MF_MT_AUDIO_BITS_PER_SAMPLE, 16);
            inAud->SetUINT32(MF_MT_AUDIO_SAMPLES_PER_SECOND, 48000);
            inAud->SetUINT32(MF_MT_AUDIO_NUM_CHANNELS, 2);
            inAud->SetUINT32(MF_MT_AUDIO_BLOCK_ALIGNMENT, 4);
            inAud->SetUINT32(MF_MT_AUDIO_AVG_BYTES_PER_SECOND, 48000 * 4);
            inAud->SetUINT32(MF_MT_ALL_SAMPLES_INDEPENDENT, TRUE);
            hr3 = cam.writer->SetInputMediaType(audStreamIdx, inAud, NULL);
            SafeRelease(inAud);

            if (SUCCEEDED(hr3)) {
                cam.writer_audio_stream = audStreamIdx;
                cam.audio_reader = audReader;
                audReader = nullptr;
                cam.audio_active = true;
                cam.audio_worker = CreateThread(NULL, 0, AudioWorkerProc, &cam, 0, NULL);
                if (cam.audio_worker) success = 1;
            }
        }
        SafeRelease(outAud);
    }

done:
    SafeRelease(audReader);  // success 後は cam.audio_reader に move 済 → ここでは無害
    LeaveCriticalSection(&cam.lock);

    if (needUninit) CoUninitialize();

    if (!success) {
        // 失敗: 全体停止
        mfcam_record_stop(handle);
        return 0;
    }
    return 1;
}

HSPMFCAM_EXPORT void __stdcall mfcam_close(int handle) {
    if (handle < 0 || handle >= MAX_CAMS) return;
    CamState& cam = g_cams[handle];
    if (!cam.slot_used) return;

    // 録画中なら先に停止
    if (cam.recording) {
        mfcam_record_stop(handle);
    }

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
