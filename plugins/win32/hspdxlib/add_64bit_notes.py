#!/usr/bin/env python3
"""Add 64-bit notes to handle/IntPtr/long functions in dxlib_help.json."""
import json
import re

# Functions that return IntPtr (pointer) - int on 32bit, int64 on 64bit
INTPTR_RETURN_FUNCS = {
    'DxAlloc', 'DxAllocAligned', 'DxCalloc', 'DxCallocAligned',
    'DxRealloc', 'DxReallocAligned',
    'FileRead_fullyLoad_getImage',
    'GetBufferVertexBuffer', 'GetBufferIndexBuffer', 'GetBufferShaderConstantBuffer',
    'GetImageAddressSoftImage', 'GetSoftSoundDataImage',
    'GetMainWindowHandle',
    'GetGraphID3D11Texture2D', 'GetGraphID3D11RenderTargetView', 'GetGraphID3D11DepthStencilView',
    'GetDesktopScreenGraphMemImage',
    'GetUseDirect3DDevice9', 'GetUseDirect3D9BackBufferSurface',
    'GetUseDirect3D11Device', 'GetUseDirect3D11DeviceContext',
    'GetUseDirect3D11BackBufferTexture2D', 'GetUseDirect3D11BackBufferRenderTargetView',
    'GetUseDirect3D11DepthStencilTexture2D',
    'AddFontFile', 'AddFontFileFromMem',
    'GetDSoundObj',
}

# Functions that return long (64-bit integer)
LONG_RETURN_FUNCS = {
    'FileRead_fullyLoad_getSize', 'FileRead_size',
    'FileRead_size_handle', 'FileRead_tell',
    'GetCurrentPositionSoundMem', 'GetNowHiPerformanceCount',
    'GetOneFrameTimeMovieToGraph', 'GetSoftSoundSampleNum',
    'GetSoundCurrentPosition', 'GetSoundCurrentTime',
    'GetSoundTotalTime', 'GetSoundTotalSample',
    'GetMovieTotalFrameToGraph', 'GetMovieCurrentFrameToGraph',
    'GetNowSysPerformanceCount', 'GetSysPerformanceFrequency',
}

# DxLib handle types - these are int (32bit) but could be int64 in future
# For DxLib, handles are always int regardless of 32/64bit
# Only pointer-like values (HWND, device objects) change size

HANDLE_NOTE_64 = '\n※ 64bit環境では戻り値が int64 になります。ポインタサイズの値を返すため、変数は int64 型で受け取ってください。'
HANDLE_PARAM_NOTE_64 = '\n※ 64bit環境ではポインタパラメータは int64 で渡す必要があります。'
LONG_NOTE = '\n※ この関数の戻り値は 64bit整数 (int64/long) です。32bit環境でも64bit値を返します。'

# Functions that take pointer/handle parameters (HWND etc.)
INTPTR_PARAM_FUNCS = {
    'SetUserWindow', 'SetUserChildWindow',
    'SetWindowIconHandle', 'SetDialogBoxHandle',
    'SetScreenFlipTargetWindow',
    'AddMessageTakeOverWindow', 'SubMessageTakeOverWindow',
    'SetDrawScreen_ID3D11RenderTargetView',
    'CreateGraphFromID3D11Texture2D',
}

def main():
    with open(r"j:\HNWorks\IronHSP_2026\plugins\win32\hspdxlib\dxlib_help.json", "r", encoding="utf-8") as f:
        data = json.load(f)

    updated = 0

    for name, info in data.items():
        desc = info.get('description', '')
        needs_update = False
        note = ''

        # IntPtr return functions
        if name in INTPTR_RETURN_FUNCS:
            if '64bit' not in desc and 'int64' not in desc:
                note = HANDLE_NOTE_64
                needs_update = True

        # long return functions
        elif name in LONG_RETURN_FUNCS:
            if '64bit' not in desc and 'int64' not in desc:
                note = LONG_NOTE
                needs_update = True

        # IntPtr parameter functions
        elif name in INTPTR_PARAM_FUNCS:
            if '64bit' not in desc and 'int64' not in desc:
                note = HANDLE_PARAM_NOTE_64
                needs_update = True

        # Functions that return "ハンドル" - DxLib handles are int (not pointer-sized)
        # but mention this fact for clarity
        elif 'ハンドル' in info.get('returns', '') or \
             ('ハンドル' in desc and ('戻り値' in desc or '返' in desc)):
            if '64bit' not in desc and 'DxLibのハンドル' not in desc:
                # DxLib handles are int (32bit) even on 64bit
                # Only mention if not already noted
                if name.startswith(('Load', 'Create', 'Make', 'Duplicate', 'Add')) and \
                   'Handle' not in name and 'ハンドル' in desc:
                    note = '\n※ DxLib のハンドル値は 32bit/64bit 共に int 型です。'
                    needs_update = True

        if needs_update and note:
            # Append note to description
            info['description'] = desc.rstrip() + '\n' + note.strip()
            updated += 1

    # Also add a general note about handles vs pointers for key functions
    general_notes = {
        'GetMainWindowHandle': '※ 64bit環境では戻り値が int64 になります。HWND はポインタサイズの値のため、変数は int64 型で受け取ってください。\n例: dim64 hwnd : hwnd = GetMainWindowHandle()',
        'LoadGraph': '※ DxLib のグラフィックハンドルは 32bit/64bit 共に int 型です。int64 にする必要はありません。',
        'LoadSoundMem': '※ DxLib のサウンドハンドルは 32bit/64bit 共に int 型です。',
        'MV1LoadModel': '※ DxLib のモデルハンドルは 32bit/64bit 共に int 型です。',
        'CreateFontToHandle': '※ DxLib のフォントハンドルは 32bit/64bit 共に int 型です。',
    }

    for name, extra_note in general_notes.items():
        if name in data:
            desc = data[name].get('description', '')
            if '64bit' not in desc and 'int64' not in desc:
                data[name]['description'] = desc.rstrip() + '\n\n' + extra_note
                updated += 1

    with open(r"j:\HNWorks\IronHSP_2026\plugins\win32\hspdxlib\dxlib_help.json", "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=2)

    print(f"Updated {updated} functions with 64-bit notes")


if __name__ == '__main__':
    main()
