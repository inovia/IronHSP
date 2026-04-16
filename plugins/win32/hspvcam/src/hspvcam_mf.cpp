//
//  hspvcam_mf.cpp — IMFVirtualCamera (Windows 11+) 仮想カメラ実装
//
//  Windows 11 22H2 以降の IMFVirtualCamera API を使用して、
//  regsvr32 不要で仮想カメラデバイスを作成・フレーム送信する。
//
//  API が利用できない環境 (Windows 10 以前) では vcam_mf_is_available() が 0 を返す。
//  ランタイム検出 (GetProcAddress) でリンクエラーを回避する。
//
//  エクスポート (__cdecl):
//    vcam_mf_create         仮想カメラの作成 (Win11+ IMFVirtualCamera)
//    vcam_mf_send_frame     BGRA バッファをフレーム送信
//    vcam_mf_stop           仮想カメラの停止・削除
//    vcam_mf_is_available   Win11 API の利用可否チェック
//

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <cstdio>
#include <cstring>
#include <mutex>

//---------------------------------------------------------------
// IMFVirtualCamera 関連の定義
// SDK に mfvirtualcamera.h が無い環境でもビルドできるよう、
// 必要な型と GUID を手動で定義する。
//---------------------------------------------------------------

#if __has_include(<mfvirtualcamera.h>)
#include <mfvirtualcamera.h>
#define HAS_MF_VIRTUALCAMERA_HEADER 1
#else
#define HAS_MF_VIRTUALCAMERA_HEADER 0
#endif

#include <mfidl.h>
#include <mfapi.h>
#include <mferror.h>
#include <mfobjects.h>
#include <mfreadwrite.h>

#pragma comment(lib, "mf.lib")
#pragma comment(lib, "mfplat.lib")
#pragma comment(lib, "mfuuid.lib")
#pragma comment(lib, "mfreadwrite.lib")
#pragma comment(lib, "ole32.lib")

#define EXPORT extern "C" __declspec(dllexport)

//---------------------------------------------------------------
// IMFVirtualCamera が SDK に無い場合のフォールバック定義
//---------------------------------------------------------------
#if !HAS_MF_VIRTUALCAMERA_HEADER

typedef enum _MFVirtualCameraType {
    MFVirtualCameraType_SoftwareCameraSource = 0
} MFVirtualCameraType;

typedef enum _MFVirtualCameraLifetime {
    MFVirtualCameraLifetime_Session = 0,
    MFVirtualCameraLifetime_System  = 1
} MFVirtualCameraLifetime;

typedef enum _MFVirtualCameraAccess {
    MFVirtualCameraAccess_CurrentUser = 0,
    MFVirtualCameraAccess_AllUsers    = 1
} MFVirtualCameraAccess;

// {C3B1F9A1-69A8-4C7D-880D-BF4F9F7B37C6}  -- IMFVirtualCamera IID (Windows 11)
MIDL_INTERFACE("C3B1F9A1-69A8-4C7D-880D-BF4F9F7B37C6")
IMFVirtualCamera : public IMFAttributes
{
public:
    virtual HRESULT STDMETHODCALLTYPE AddProperty(
        const DEVPROPKEY *pKey,
        DEVPROPTYPE Type,
        const BYTE *pbData,
        ULONG cbData) = 0;

    virtual HRESULT STDMETHODCALLTYPE AddRegistryEntry(
        LPCWSTR EntryName,
        LPCWSTR SubkeyPath,
        DWORD dwRegType,
        const BYTE *pbData,
        ULONG cbData) = 0;

    virtual HRESULT STDMETHODCALLTYPE AddStreamSink(
        DWORD dwIndex,
        IMFMediaType *pMediaType,
        IMFAttributes *pAttributes,
        IMFStreamSink **ppStreamSink) = 0;

    virtual HRESULT STDMETHODCALLTYPE Start(
        IMFAsyncCallback *pCallback) = 0;

    virtual HRESULT STDMETHODCALLTYPE Stop(void) = 0;

    virtual HRESULT STDMETHODCALLTYPE Remove(void) = 0;

    virtual HRESULT STDMETHODCALLTYPE GetMediaSource(
        IMFMediaSource **ppMediaSource) = 0;

    virtual HRESULT STDMETHODCALLTYPE SendCameraProperty(
        REFGUID propertySet,
        ULONG propertyId,
        ULONG propertyFlags,
        void *pPropertyPayload,
        ULONG cbPropertyPayload,
        void *pData,
        ULONG cbData,
        ULONG *pcbReturned) = 0;

    virtual HRESULT STDMETHODCALLTYPE CreateSyncEvent(
        REFGUID kseventSet,
        ULONG kseventId,
        ULONG kseventFlags,
        HANDLE eventHandle,
        LONG *pKsEventHandle) = 0;

    virtual HRESULT STDMETHODCALLTYPE CreateSyncSemaphore(
        REFGUID kseventSet,
        ULONG kseventId,
        ULONG kseventFlags,
        HANDLE semaphoreHandle,
        LONG initialCount,
        LONG maxCount,
        LONG *pKsEventHandle) = 0;

    virtual HRESULT STDMETHODCALLTYPE Shutdown(void) = 0;
};

static const IID IID_IMFVirtualCamera = {
    0xC3B1F9A1, 0x69A8, 0x4C7D,
    {0x88, 0x0D, 0xBF, 0x4F, 0x9F, 0x7B, 0x37, 0xC6}
};

#endif // !HAS_MF_VIRTUALCAMERA_HEADER

//---------------------------------------------------------------
// MFCreateVirtualCamera 関数ポインタ (動的ロード)
//---------------------------------------------------------------
typedef HRESULT (STDAPICALLTYPE *PFN_MFCreateVirtualCamera)(
    MFVirtualCameraType type,
    MFVirtualCameraLifetime lifetime,
    MFVirtualCameraAccess access,
    LPCWSTR friendlyName,
    LPCWSTR sourceId,
    const GUID *pCategoryGUIDs,
    ULONG cCategoryGUIDs,
    IMFVirtualCamera **ppVirtualCamera
);

static PFN_MFCreateVirtualCamera g_pfnMFCreateVirtualCamera = nullptr;
static bool g_mfChecked = false;
static bool g_mfAvailable = false;
static std::mutex g_mfMutex;

//---------------------------------------------------------------
// ランタイムチェック: MFCreateVirtualCamera が利用可能か
//---------------------------------------------------------------
static bool CheckMFVirtualCameraAvailable()
{
    if (g_mfChecked) return g_mfAvailable;

    g_mfChecked = true;
    g_mfAvailable = false;

    HMODULE hMfplat = LoadLibraryW(L"mfsensorgroup.dll");
    if (!hMfplat) {
        // Windows 11 ではこの DLL に MFCreateVirtualCamera がある
        // 別の DLL に入っている可能性もあるので mf.dll も試す
        hMfplat = LoadLibraryW(L"mf.dll");
    }
    if (hMfplat) {
        g_pfnMFCreateVirtualCamera = (PFN_MFCreateVirtualCamera)
            GetProcAddress(hMfplat, "MFCreateVirtualCamera");
        if (g_pfnMFCreateVirtualCamera) {
            g_mfAvailable = true;
        }
        // DLL は FreeLibrary しない (使い続ける)
    }
    return g_mfAvailable;
}

//---------------------------------------------------------------
// 内部状態
//---------------------------------------------------------------
struct MFVCamState {
    IMFVirtualCamera* pVirtualCamera;
    IMFMediaSource*   pMediaSource;
    IMFSinkWriter*    pSinkWriter;     // フレーム書き込み用 (将来)
    int width;
    int height;
    int fps;
    bool started;

    // 共有メモリベースのフレーム受け渡し
    HANDLE hMapFile;
    HANDLE hEvent;
    BYTE*  pSharedBuf;
    size_t pixelSize;

    MFVCamState()
        : pVirtualCamera(nullptr), pMediaSource(nullptr), pSinkWriter(nullptr)
        , width(0), height(0), fps(0), started(false)
        , hMapFile(nullptr), hEvent(nullptr), pSharedBuf(nullptr), pixelSize(0)
    {}
};

static MFVCamState g_state;
static bool g_mfInitialized = false;

//---------------------------------------------------------------
// 共有メモリの作成 (MF 用)
// MF 仮想カメラのメディアソースへフレームを供給するため、
// DirectShow 版と同じ共有メモリ形式で BGRA データを保持する。
//---------------------------------------------------------------
struct VCamSharedHeader_MF {
    int width;
    int height;
    int fps;
    int frame_counter;
    int consumer_alive;
    int reserved[3];
};

static const wchar_t* MF_SHM_NAME  = L"IronHSP_VCam_MF";
static const wchar_t* MF_EVT_NAME  = L"IronHSP_VCam_MF_Event";

static bool CreateMFSharedMemory(int w, int h)
{
    size_t pixelSize = (size_t)w * h * 4;
    size_t totalSize = sizeof(VCamSharedHeader_MF) + pixelSize;

    HANDLE hMap = CreateFileMappingW(
        INVALID_HANDLE_VALUE, NULL, PAGE_READWRITE,
        (DWORD)(totalSize >> 32), (DWORD)(totalSize & 0xFFFFFFFF),
        MF_SHM_NAME);
    if (!hMap) return false;

    BYTE* pBuf = (BYTE*)MapViewOfFile(hMap, FILE_MAP_ALL_ACCESS, 0, 0, totalSize);
    if (!pBuf) {
        CloseHandle(hMap);
        return false;
    }

    VCamSharedHeader_MF* hdr = (VCamSharedHeader_MF*)pBuf;
    ZeroMemory(hdr, sizeof(VCamSharedHeader_MF));
    hdr->width  = w;
    hdr->height = h;
    hdr->fps    = 0;

    HANDLE hEvt = CreateEventW(NULL, FALSE, FALSE, MF_EVT_NAME);
    if (!hEvt) {
        UnmapViewOfFile(pBuf);
        CloseHandle(hMap);
        return false;
    }

    g_state.hMapFile   = hMap;
    g_state.hEvent     = hEvt;
    g_state.pSharedBuf = pBuf;
    g_state.pixelSize  = pixelSize;

    return true;
}

static void DestroyMFSharedMemory()
{
    if (g_state.pSharedBuf) {
        UnmapViewOfFile(g_state.pSharedBuf);
        g_state.pSharedBuf = nullptr;
    }
    if (g_state.hMapFile) {
        CloseHandle(g_state.hMapFile);
        g_state.hMapFile = nullptr;
    }
    if (g_state.hEvent) {
        CloseHandle(g_state.hEvent);
        g_state.hEvent = nullptr;
    }
    g_state.pixelSize = 0;
}

//---------------------------------------------------------------
// vcam_mf_is_available — Win11 MF Virtual Camera API が利用可能か
//   戻り値: 1=利用可, 0=利用不可
//---------------------------------------------------------------
EXPORT int __cdecl vcam_mf_is_available(void)
{
    std::lock_guard<std::mutex> lock(g_mfMutex);
    return CheckMFVirtualCameraAvailable() ? 1 : 0;
}

//---------------------------------------------------------------
// vcam_mf_create — MF 仮想カメラの作成
//   w    : フレーム幅
//   h    : フレーム高さ
//   fps  : フレームレート
//   name : カメラの表示名 (wchar_t*, NULL の場合は既定名)
//   戻り値: 0=成功, -1=API 未サポート, -2=MFStartup 失敗,
//           -3=仮想カメラ作成失敗, -4=共有メモリ作成失敗,
//           -5=Start 失敗
//---------------------------------------------------------------
EXPORT int __cdecl vcam_mf_create(int w, int h, int fps, const wchar_t* name)
{
    std::lock_guard<std::mutex> lock(g_mfMutex);

    if (w <= 0 || h <= 0 || fps <= 0) return -1;

    // 既に作成済みの場合はまず停止
    if (g_state.started) {
        if (g_state.pVirtualCamera) {
            g_state.pVirtualCamera->Stop();
            g_state.pVirtualCamera->Remove();
            g_state.pVirtualCamera->Release();
            g_state.pVirtualCamera = nullptr;
        }
        DestroyMFSharedMemory();
        g_state.started = false;
    }

    // API チェック
    if (!CheckMFVirtualCameraAvailable()) return -1;

    // Media Foundation の初期化
    if (!g_mfInitialized) {
        HRESULT hr = MFStartup(MF_VERSION, MFSTARTUP_NOSOCKET);
        if (FAILED(hr)) return -2;
        g_mfInitialized = true;
    }

    // 表示名
    const wchar_t* displayName = name;
    if (!displayName || displayName[0] == L'\0') {
        displayName = L"IronHSP Virtual Camera";
    }

    // ソース ID (一意の識別子)
    const wchar_t* sourceId = L"IronHSP_VCam_MFSource";

    // KSCATEGORY_VIDEO_CAMERA
    static const GUID KSCATEGORY_VIDEO_CAMERA_GUID = {
        0xe5323777, 0xf976, 0x4f5b,
        {0x9b, 0x55, 0xb9, 0x46, 0x99, 0xc4, 0x6e, 0x44}
    };

    // 仮想カメラの作成
    IMFVirtualCamera* pVCam = nullptr;
    HRESULT hr = g_pfnMFCreateVirtualCamera(
        MFVirtualCameraType_SoftwareCameraSource,
        MFVirtualCameraLifetime_Session,   // セッション限定 (プロセス終了で自動削除)
        MFVirtualCameraAccess_CurrentUser,
        displayName,
        sourceId,
        &KSCATEGORY_VIDEO_CAMERA_GUID,
        1,
        &pVCam
    );

    if (FAILED(hr) || !pVCam) return -3;

    // 共有メモリの作成
    if (!CreateMFSharedMemory(w, h)) {
        pVCam->Remove();
        pVCam->Release();
        return -4;
    }

    // 仮想カメラを開始 (デバイス一覧に表示される)
    hr = pVCam->Start(nullptr);
    if (FAILED(hr)) {
        DestroyMFSharedMemory();
        pVCam->Remove();
        pVCam->Release();
        return -5;
    }

    g_state.pVirtualCamera = pVCam;
    g_state.width   = w;
    g_state.height  = h;
    g_state.fps     = fps;
    g_state.started = true;

    return 0;
}

//---------------------------------------------------------------
// vcam_mf_send_frame — BGRA バッファをフレームとして送信
//   bgra : BGRA ピクセルデータポインタ
//   size : データサイズ (バイト)
//   戻り値: 0=成功, -1=未初期化, -2=バッファ不正
//---------------------------------------------------------------
EXPORT int __cdecl vcam_mf_send_frame(const void* bgra, int size)
{
    std::lock_guard<std::mutex> lock(g_mfMutex);

    if (!g_state.started || !g_state.pSharedBuf) return -1;
    if (!bgra || size <= 0) return -2;

    size_t copySize = ((size_t)size < g_state.pixelSize) ? (size_t)size : g_state.pixelSize;
    BYTE* pPixels = g_state.pSharedBuf + sizeof(VCamSharedHeader_MF);
    memcpy(pPixels, bgra, copySize);

    // フレームカウンタのインクリメント
    VCamSharedHeader_MF* hdr = (VCamSharedHeader_MF*)g_state.pSharedBuf;
    hdr->frame_counter++;

    // イベント通知
    if (g_state.hEvent) {
        SetEvent(g_state.hEvent);
    }

    return 0;
}

//---------------------------------------------------------------
// vcam_mf_stop — 仮想カメラの停止・削除
//   戻り値: 0=成功, -1=未初期化
//---------------------------------------------------------------
EXPORT int __cdecl vcam_mf_stop(void)
{
    std::lock_guard<std::mutex> lock(g_mfMutex);

    if (!g_state.started) return -1;

    // 仮想カメラの停止
    if (g_state.pVirtualCamera) {
        g_state.pVirtualCamera->Stop();
        g_state.pVirtualCamera->Remove();
        g_state.pVirtualCamera->Release();
        g_state.pVirtualCamera = nullptr;
    }

    // メディアソースの解放
    if (g_state.pMediaSource) {
        g_state.pMediaSource->Shutdown();
        g_state.pMediaSource->Release();
        g_state.pMediaSource = nullptr;
    }

    // SinkWriter の解放
    if (g_state.pSinkWriter) {
        g_state.pSinkWriter->Release();
        g_state.pSinkWriter = nullptr;
    }

    // 共有メモリの破棄
    DestroyMFSharedMemory();

    g_state.started = false;
    g_state.width   = 0;
    g_state.height  = 0;
    g_state.fps     = 0;

    // Media Foundation のシャットダウン
    if (g_mfInitialized) {
        MFShutdown();
        g_mfInitialized = false;
    }

    return 0;
}
