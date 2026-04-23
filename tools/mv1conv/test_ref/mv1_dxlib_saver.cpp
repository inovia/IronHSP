// mv1_dxlib_saver — DxLib 本家経由で任意フォーマット (主に .pmx) → .mv1 保存。
//
// mv1conv から subprocess として呼び出す用途。mv1conv が assimp (/MD) を
// リンクしている一方、DxLib は /MT 前提のため、同一 exe にリンクできない。
// そのため本 exe は /MT でビルドし、DxLib 経由での最終 .mv1 保存だけを担う。
//
// 使い方:
//   mv1_dxlib_saver.exe <input> <output.mv1>
//
// 出力 (stderr): "OK" または "ERR: <reason>"
// 終了コード: 0=成功, 非零=失敗
//
// 注: DxLib は GUI 前提のため Init 必須。SetWindowVisibleFlag(FALSE) で
// ウィンドウ隠し、即終了するため実害は極小。

#define DX_COMPILE_TYPE_WINDOWS
#include "DxLib.h"

#include <cstdio>
#include <cwchar>

#ifdef _WIN32
#include <windows.h>
#include <io.h>
#include <fcntl.h>
#endif

int wmain(int argc, wchar_t **argv);

#ifdef _WIN32
int WINAPI wWinMain(HINSTANCE, HINSTANCE, LPWSTR, int) {
    // コンソール付きで呼ばれた場合に stderr を親へ継承させるため、
    // 既存 STD_ERROR_HANDLE を _fileno(stderr) に bind。
    int argc;
    LPWSTR *argv = CommandLineToArgvW(GetCommandLineW(), &argc);
    int ret = wmain(argc, argv);
    LocalFree(argv);
    return ret;
}
#endif

static void emit_err(const wchar_t *msg) {
    // subprocess の親が読めるよう stderr へ。
    // _UNICODE 環境では fwprintf + wcslen で OK。
    fwprintf(stderr, L"ERR: %ls\n", msg);
    fflush(stderr);
}

int wmain(int argc, wchar_t **argv) {
    if (argc < 3) {
        emit_err(L"usage: mv1_dxlib_saver <input> <output.mv1>");
        return 2;
    }
    const wchar_t *inPath  = argv[1];
    const wchar_t *outPath = argv[2];

    const bool diag = _wgetenv(L"MV1SAVER_DIAG") != nullptr;
    SetOutApplicationLogValidFlag(diag ? TRUE : FALSE);
    SetUseDirectInputFlag(FALSE);
    SetUseDirect3DVersion(DX_DIRECT3D_11);
    SetWindowVisibleFlag(FALSE);
    ChangeWindowMode(TRUE);

    if (DxLib_Init() != 0) {
        emit_err(L"DxLib_Init failed");
        return 1;
    }

    int h = MV1LoadModel(inPath);
    if (h < 0) {
        wchar_t msg[768];
        swprintf_s(msg, L"MV1LoadModel failed: %ls", inPath);
        emit_err(msg);
        DxLib_End();
        return 1;
    }

    int r = MV1SaveModelToMV1File(h, outPath,
                                  MV1_SAVETYPE_MESH | MV1_SAVETYPE_ANIM,
                                  -1,
                                  FALSE,
                                  FALSE,
                                  FALSE,
                                  FALSE,
                                  FALSE);
    MV1DeleteModel(h);
    DxLib_End();

    if (r != 0) {
        emit_err(L"MV1SaveModelToMV1File failed");
        return 1;
    }
    fwprintf(stderr, L"OK\n");
    fflush(stderr);
    return 0;
}
