// mv1_load_check — DxLib 本家で .mv1 を load して成功/失敗を返すだけの checker。
// 使い方: mv1_load_check.exe <file.mv1>
// exit code: 0=OK, 1=load fail, 2=usage
#define DX_COMPILE_TYPE_WINDOWS
#include "DxLib.h"

#include <cstdio>
#include <cstdlib>
#include <cwchar>

int wmain(int argc, wchar_t **argv);

#ifdef _WIN32
#include <windows.h>
int WINAPI wWinMain(HINSTANCE, HINSTANCE, LPWSTR, int) {
    int argc;
    LPWSTR *argv = CommandLineToArgvW(GetCommandLineW(), &argc);
    int ret = wmain(argc, argv);
    LocalFree(argv);
    return ret;
}
#endif

int wmain(int argc, wchar_t **argv) {
    if (argc < 2) return 2;

    // log を無効化 (diag 時は env で上書き)
    SetOutApplicationLogValidFlag(getenv("MV1CHECK_LOG") ? TRUE : FALSE);
    SetUseDirectInputFlag(FALSE);
    SetUseDirect3DVersion(DX_DIRECT3D_11);
    SetWindowVisibleFlag(FALSE);
    ChangeWindowMode(TRUE);
    SetUseDXArchiveFlag(FALSE);
    SetWaitVSyncFlag(FALSE);
    SetGraphMode(64, 64, 32);

    if (DxLib_Init() != 0) {
        fwprintf(stderr, L"DxLib_Init failed\n");
        return 1;
    }

    int h = MV1LoadModel(argv[1]);
    int rc;
    if (h < 0) {
        fwprintf(stderr, L"MV1LoadModel failed: %ls\n", argv[1]);
        rc = 1;
    } else {
        rc = 0;
        int anims = MV1GetAnimNum(h);
        int keysets = MV1GetAnimKeySetNum(h);
        int shapes = MV1GetShapeNum(h);
        if (anims > 0 || keysets > 0 || shapes > 0) {
            fwprintf(stderr, L"load OK: anims=%d keysets=%d shapes=%d\n",
                     anims, keysets, shapes);
        }
        MV1DeleteModel(h);
    }
    DxLib_End();
    return rc;
}
