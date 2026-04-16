//
//  hspvcam.dll — IronHSP 仮想ウェブカメラ プラグイン
//
//  名前付き共有メモリを使って HSP から BGRA フレームデータを書き込み、
//  外部の仮想カメラブリッジプロセスが読み出して DirectShow / Media Foundation
//  ソースフィルタへ供給するアーキテクチャ。
//
//  共有メモリレイアウト:
//    VCamSharedHeader (固定サイズ) + BGRA ピクセルデータ (w * h * 4)
//
//  名前付きオブジェクト:
//    共有メモリ: IronHSP_VCam_{handle}
//    イベント  : IronHSP_VCam_Event_{handle}
//
//  エクスポート (__cdecl):
//    vcam_create          仮想カメラの作成
//    vcam_send_frame      BGRA バッファをフレーム送信
//    vcam_send_from_screen HSP スクリーン領域をキャプチャして送信
//    vcam_get_info        カメラ情報の取得
//    vcam_is_connected    コンシューマ接続チェック
//    vcam_close           仮想カメラの破棄
//

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <cstdio>
#include <cstring>
#include <unordered_map>
#include <mutex>

//---------------------------------------------------------------
// 共有メモリヘッダ構造体
//---------------------------------------------------------------
struct VCamSharedHeader {
    int width;           // フレーム幅
    int height;          // フレーム高さ
    int fps;             // フレームレート
    int frame_counter;   // フレーム送信カウンタ (送信ごとにインクリメント)
    int consumer_alive;  // コンシューマが読み出し中なら非 0
    int reserved[3];     // 将来の拡張用 (32 bytes 境界)
    // ここに続いて BGRA ピクセルデータ (width * height * 4 bytes)
};

//---------------------------------------------------------------
// 内部ハンドル管理
//---------------------------------------------------------------
struct VCamHandle {
    HANDLE hMapFile;     // 共有メモリハンドル
    HANDLE hEvent;       // フレーム送信イベント
    VCamSharedHeader* pHeader;  // マッピングされたポインタ
    BYTE* pPixels;       // ピクセルデータ先頭
    int width;
    int height;
    int fps;
    size_t pixelSize;    // width * height * 4
};

static std::unordered_map<int, VCamHandle*> g_handles;
static std::mutex g_mutex;
static int g_nextHandle = 1;

//---------------------------------------------------------------
// 共有メモリ名の生成
//---------------------------------------------------------------
static void MakeSharedMemName(int handle, char* buf, size_t bufLen)
{
    _snprintf_s(buf, bufLen, _TRUNCATE, "IronHSP_VCam_%d", handle);
}

static void MakeEventName(int handle, char* buf, size_t bufLen)
{
    _snprintf_s(buf, bufLen, _TRUNCATE, "IronHSP_VCam_Event_%d", handle);
}

//---------------------------------------------------------------
// DLL エントリポイント
//---------------------------------------------------------------
BOOL APIENTRY DllMain(HMODULE hModule, DWORD ul_reason_for_call, LPVOID lpReserved)
{
    switch (ul_reason_for_call) {
    case DLL_PROCESS_ATTACH:
        DisableThreadLibraryCalls(hModule);
        break;
    case DLL_PROCESS_DETACH:
        // プロセス終了時に全ハンドルを解放
        {
            std::lock_guard<std::mutex> lock(g_mutex);
            for (auto& pair : g_handles) {
                VCamHandle* h = pair.second;
                if (h->pHeader) UnmapViewOfFile(h->pHeader);
                if (h->hMapFile) CloseHandle(h->hMapFile);
                if (h->hEvent) CloseHandle(h->hEvent);
                delete h;
            }
            g_handles.clear();
        }
        break;
    }
    return TRUE;
}

//---------------------------------------------------------------
// vcam_create — 仮想カメラの作成
//   width  : フレーム幅 (ピクセル)
//   height : フレーム高さ (ピクセル)
//   fps    : フレームレート
//   戻り値 : ハンドル (> 0)、失敗時 0
//---------------------------------------------------------------
extern "C" __declspec(dllexport) int __cdecl vcam_create(int width, int height, int fps)
{
    if (width <= 0 || height <= 0 || fps <= 0) return 0;

    // 共有メモリサイズ = ヘッダ + ピクセルデータ
    size_t pixelSize = (size_t)width * height * 4;
    size_t totalSize = sizeof(VCamSharedHeader) + pixelSize;

    std::lock_guard<std::mutex> lock(g_mutex);
    int handle = g_nextHandle++;

    // 共有メモリ名
    char shmName[128];
    MakeSharedMemName(handle, shmName, sizeof(shmName));

    // イベント名
    char evtName[128];
    MakeEventName(handle, evtName, sizeof(evtName));

    // 共有メモリの作成
    HANDLE hMapFile = CreateFileMappingA(
        INVALID_HANDLE_VALUE,
        NULL,
        PAGE_READWRITE,
        (DWORD)(totalSize >> 32),
        (DWORD)(totalSize & 0xFFFFFFFF),
        shmName
    );
    if (!hMapFile) return 0;

    // マッピング
    BYTE* pBuf = (BYTE*)MapViewOfFile(hMapFile, FILE_MAP_ALL_ACCESS, 0, 0, totalSize);
    if (!pBuf) {
        CloseHandle(hMapFile);
        return 0;
    }

    // ヘッダの初期化
    VCamSharedHeader* pHeader = (VCamSharedHeader*)pBuf;
    ZeroMemory(pHeader, sizeof(VCamSharedHeader));
    pHeader->width = width;
    pHeader->height = height;
    pHeader->fps = fps;
    pHeader->frame_counter = 0;
    pHeader->consumer_alive = 0;

    // ピクセルデータ領域をゼロクリア
    BYTE* pPixels = pBuf + sizeof(VCamSharedHeader);
    ZeroMemory(pPixels, pixelSize);

    // フレーム送信通知イベント (自動リセット)
    HANDLE hEvent = CreateEventA(NULL, FALSE, FALSE, evtName);
    if (!hEvent) {
        UnmapViewOfFile(pBuf);
        CloseHandle(hMapFile);
        return 0;
    }

    // ハンドルの登録
    VCamHandle* h = new VCamHandle();
    h->hMapFile = hMapFile;
    h->hEvent = hEvent;
    h->pHeader = pHeader;
    h->pPixels = pPixels;
    h->width = width;
    h->height = height;
    h->fps = fps;
    h->pixelSize = pixelSize;
    g_handles[handle] = h;

    return handle;
}

//---------------------------------------------------------------
// vcam_send_frame — BGRA バッファをフレームとして送信
//   handle    : vcam_create で取得したハンドル
//   bgra_data : BGRA ピクセルデータ (width * height * 4 bytes)
//   size      : データサイズ (バイト)
//   戻り値    : 0=成功, -1=失敗
//---------------------------------------------------------------
extern "C" __declspec(dllexport) int __cdecl vcam_send_frame(int handle, const void* bgra_data, int size)
{
    std::lock_guard<std::mutex> lock(g_mutex);
    auto it = g_handles.find(handle);
    if (it == g_handles.end()) return -1;

    VCamHandle* h = it->second;
    if (!bgra_data || size <= 0) return -1;

    // サイズの検証 (最小限のチェック)
    size_t copySize = ((size_t)size < h->pixelSize) ? (size_t)size : h->pixelSize;

    // ピクセルデータのコピー
    memcpy(h->pPixels, bgra_data, copySize);

    // フレームカウンタをインクリメント
    h->pHeader->frame_counter++;

    // イベントをシグナル状態にしてコンシューマに通知
    SetEvent(h->hEvent);

    return 0;
}

//---------------------------------------------------------------
// vcam_send_from_screen — HSP スクリーン領域をキャプチャして送信
//   handle : vcam_create で取得したハンドル
//   x, y   : キャプチャ開始座標
//   w, h   : キャプチャ幅・高さ (0 の場合は仮想カメラの幅・高さを使用)
//   戻り値 : 0=成功, -1=失敗
//
//   注: デスクトップ DC からの BitBlt でキャプチャするため、
//       HSP ウィンドウに限らずスクリーン上の任意の領域を取得可能。
//       ただし通常は HSP ウィンドウの hwnd を指定するのが想定用途。
//---------------------------------------------------------------
extern "C" __declspec(dllexport) int __cdecl vcam_send_from_screen(int handle, int x, int y, int w, int h)
{
    std::lock_guard<std::mutex> lock(g_mutex);
    auto it = g_handles.find(handle);
    if (it == g_handles.end()) return -1;

    VCamHandle* vh = it->second;

    // w, h が 0 なら仮想カメラサイズを使用
    int capW = (w > 0) ? w : vh->width;
    int capH = (h > 0) ? h : vh->height;

    // デスクトップ DC からキャプチャ
    HDC hScreenDC = GetDC(NULL);
    if (!hScreenDC) return -1;

    HDC hMemDC = CreateCompatibleDC(hScreenDC);
    if (!hMemDC) {
        ReleaseDC(NULL, hScreenDC);
        return -1;
    }

    // 32bit DIB セクションの作成 (BGRA)
    BITMAPINFO bmi = {};
    bmi.bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
    bmi.bmiHeader.biWidth = vh->width;
    bmi.bmiHeader.biHeight = -(int)vh->height;  // トップダウン
    bmi.bmiHeader.biPlanes = 1;
    bmi.bmiHeader.biBitCount = 32;
    bmi.bmiHeader.biCompression = BI_RGB;

    BYTE* pBits = NULL;
    HBITMAP hBmp = CreateDIBSection(hMemDC, &bmi, DIB_RGB_COLORS, (void**)&pBits, NULL, 0);
    if (!hBmp) {
        DeleteDC(hMemDC);
        ReleaseDC(NULL, hScreenDC);
        return -1;
    }

    HGDIOBJ hOld = SelectObject(hMemDC, hBmp);

    // キャプチャ領域が仮想カメラサイズと異なる場合はストレッチ
    if (capW == vh->width && capH == vh->height) {
        BitBlt(hMemDC, 0, 0, vh->width, vh->height, hScreenDC, x, y, SRCCOPY);
    } else {
        SetStretchBltMode(hMemDC, HALFTONE);
        StretchBlt(hMemDC, 0, 0, vh->width, vh->height,
                   hScreenDC, x, y, capW, capH, SRCCOPY);
    }

    // DIB ビットを共有メモリへコピー
    memcpy(vh->pPixels, pBits, vh->pixelSize);

    // フレームカウンタをインクリメント & イベント通知
    vh->pHeader->frame_counter++;
    SetEvent(vh->hEvent);

    // 後始末
    SelectObject(hMemDC, hOld);
    DeleteObject(hBmp);
    DeleteDC(hMemDC);
    ReleaseDC(NULL, hScreenDC);

    return 0;
}

//---------------------------------------------------------------
// vcam_get_info — 仮想カメラの情報を取得
//   handle  : ハンドル
//   w, h    : 出力: 幅・高さ
//   fps     : 出力: フレームレート
//   戻り値  : 0=成功, -1=失敗
//---------------------------------------------------------------
extern "C" __declspec(dllexport) int __cdecl vcam_get_info(int handle, int* w, int* h, int* fps)
{
    std::lock_guard<std::mutex> lock(g_mutex);
    auto it = g_handles.find(handle);
    if (it == g_handles.end()) return -1;

    VCamHandle* vh = it->second;
    if (w)   *w   = vh->width;
    if (h)   *h   = vh->height;
    if (fps) *fps = vh->fps;
    return 0;
}

//---------------------------------------------------------------
// vcam_is_connected — コンシューマが接続しているか
//   handle : ハンドル
//   戻り値 : 1=接続中, 0=未接続, -1=無効ハンドル
//---------------------------------------------------------------
extern "C" __declspec(dllexport) int __cdecl vcam_is_connected(int handle)
{
    std::lock_guard<std::mutex> lock(g_mutex);
    auto it = g_handles.find(handle);
    if (it == g_handles.end()) return -1;

    VCamHandle* vh = it->second;
    return (vh->pHeader->consumer_alive != 0) ? 1 : 0;
}

//---------------------------------------------------------------
// vcam_close — 仮想カメラの破棄
//   handle : ハンドル
//   戻り値 : 0=成功, -1=失敗
//---------------------------------------------------------------
extern "C" __declspec(dllexport) int __cdecl vcam_close(int handle)
{
    std::lock_guard<std::mutex> lock(g_mutex);
    auto it = g_handles.find(handle);
    if (it == g_handles.end()) return -1;

    VCamHandle* h = it->second;

    if (h->pHeader) UnmapViewOfFile(h->pHeader);
    if (h->hMapFile) CloseHandle(h->hMapFile);
    if (h->hEvent) CloseHandle(h->hEvent);
    delete h;

    g_handles.erase(it);
    return 0;
}
