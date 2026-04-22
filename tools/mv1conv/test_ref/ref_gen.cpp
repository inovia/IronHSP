// mv1_ref_gen — DxLib 本家で入力ファイル → .mv1 を保存する test oracle。
// 我々の writer が出力する .mv1 と byte/dump 比較して writer のバグ検出する。
//
// 使い方:
//   mv1_ref_gen.exe <input.x|.mqo|.pmd|.pmx|.fbx> <output.mv1>
//
// DxLib のロード自動判定 + 本家 MV1SaveModelToMV1File を呼ぶだけ。
// 隠しウィンドウで動作 (Init 必要なため完全 headless 不可だが即終了)。
#define DX_COMPILE_TYPE_WINDOWS
#include "DxLib.h"

#include <cstdio>
#include <cstring>
#include <string>

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
    if (argc < 3) {
        // stderr に出す (GUI だけど command line から見える)
        MessageBoxW(nullptr, L"usage: mv1_ref_gen <input> <output.mv1>", L"mv1_ref_gen", MB_OK);
        return 2;
    }
    const wchar_t *inPath  = argv[1];
    const wchar_t *outPath = argv[2];

    // できる限り控えめに初期化 (ただし diagnostic 時は log 有効化)
    const bool diag = std::getenv("MV1REF_DIAG") != nullptr;
    SetOutApplicationLogValidFlag(diag ? TRUE : FALSE);
    SetUseDirectInputFlag(FALSE);           // DirectInput 無効
    SetUseDirect3DVersion(DX_DIRECT3D_11);  // DX11 固定
    SetWindowVisibleFlag(FALSE);            // ウィンドウ隠し (init より前に呼ぶ)
    ChangeWindowMode(TRUE);                 // フルスクリーン禁止

    if (DxLib_Init() != 0) {
        MessageBoxW(nullptr, L"DxLib_Init failed", L"mv1_ref_gen", MB_OK);
        return 1;
    }

    int h = MV1LoadModel(inPath);
    if (h < 0) {
        wchar_t msg[512];
        swprintf_s(msg, L"MV1LoadModel failed: %ls", inPath);
        MessageBoxW(nullptr, msg, L"mv1_ref_gen", MB_OK);
        DxLib_End();
        return 1;
    }

    int r = MV1SaveModelToMV1File(h, outPath,
                                  MV1_SAVETYPE_MESH | MV1_SAVETYPE_ANIM,
                                  -1 /* anim model handle: -1 = self */,
                                  FALSE /* anim name check */,
                                  FALSE /* normal 8bit */,
                                  FALSE /* position 16bit */,
                                  FALSE /* weight 8bit */,
                                  FALSE /* anim 16bit */);
    MV1DeleteModel(h);
    DxLib_End();

    if (r != 0) {
        MessageBoxW(nullptr, L"MV1SaveModelToMV1File failed", L"mv1_ref_gen", MB_OK);
        return 1;
    }
    return 0;
}
