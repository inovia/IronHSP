#!/usr/bin/env python3
"""
hsp3dx_dxlib_gen / gen_dxlib_bindings.py

DxLib.h を正規表現ベースで parse し、HSP から呼び出せる `dx_*` 命令の
ランタイム binding を自動生成する。Phase 5.3 本命ツール。

【入力】
    hsp3dx/extlib/dxlib_win/DxLib_VC/DxLib.h   (SDK ヘッダ)

【出力】
    hsp3dx/src/hsp3dx_dxlib_auto.cpp           (cmdfunc dispatcher case 群)
    package/win32/common/iron_dxlib_auto.as    (#cmd エントリ群)

【フィルタ】
    * extern int FuncName(...) 形式のみ
    * 引数型は int / float / double / const TCHAR * のみ許可
    * 戻り値は int のみ (ctx->stat に格納)
    * VECTOR / callback / struct / ** / DXCOLOR などを含む関数は skip
    * DEFAULTPARAM 付き引数はオプションとして扱う

【opcode 範囲】
    0x200 〜 0x3FF を自動生成用に予約
"""

import re
import sys
import os

HDR_PATH   = r"J:\HNWorks\IronHSP_2026\hsp3dx\extlib\dxlib_win\DxLib_VC\DxLib.h"
OUT_CPP    = r"J:\HNWorks\IronHSP_2026\hsp3dx\src\hsp3dx_dxlib_auto.cpp"
OUT_AS     = r"J:\HNWorks\IronHSP_2026\package\win32\common\iron_dxlib_auto.as"

OPCODE_START = 0x200
OPCODE_END   = 0x6FF

# Function signature pattern:
#   extern int  FuncName(  arg1,  arg2 ...)  ;
FUNC_RE = re.compile(
    r'extern\s+int\s+(\w+)\s*\(\s*(.*?)\s*\)\s*;',
    re.MULTILINE | re.DOTALL
)

# DEFAULTPARAM( = value ) in DxLib.h marks default values (optional args)
DEFAULT_RE = re.compile(r'DEFAULTPARAM\s*\(\s*=\s*([^)]+?)\s*\)')

# Per-arg pattern: optional "const", type (1〜2 語: unsigned int など), optional "*", name [ DEFAULTPARAM(...)]
ARG_RE = re.compile(
    r'^\s*(?:const\s+)?((?:unsigned|signed)\s+\w+|\w+)\s*(\*?)\s*(\w+)\s*(?:DEFAULTPARAM\s*\(\s*=\s*([^)]+?)\s*\))?\s*$'
)

# 受け入れる型
ACCEPT_TYPES = {
    'int':             'int',
    'float':           'float',
    'double':          'double',
    'TCHAR':           'tchar',       # const TCHAR* 専用
    'char':            'char',        # const char* (稀)
    'unsigned int':    'uint',        # color 等
    'unsigned char':   'uchar',
    'unsigned short':  'ushort',
    'unsigned long':   'ulong',
    'LONGLONG':        'int64',       # 8 byte signed
    'ULONGLONG':       'uint64',
    # DxLib 構造体 (NSTRUCT 変数として HSP 側で確保、生メモリを VECTOR* 等にキャスト)
    'VECTOR':          'struct_VECTOR',
    'VECTOR_D':        'struct_VECTOR_D',
    'MATRIX':          'struct_MATRIX',
    'MATRIX_D':        'struct_MATRIX_D',
    'COLOR_U8':        'struct_COLOR_U8',
    'COLOR_F':         'struct_COLOR_F',
    'FLOAT2':          'struct_FLOAT2',
    'FLOAT3':          'struct_FLOAT3',
    'FLOAT4':          'struct_FLOAT4',
}

# 構造体 → 最小バイトサイズ (PVal->len[0] 側がこれ以上あれば OK と判定)
STRUCT_SIZES = {
    'struct_VECTOR':   12,
    'struct_VECTOR_D': 24,
    'struct_MATRIX':   64,   # 4x4 float
    'struct_MATRIX_D': 128,  # 4x4 double
    'struct_COLOR_U8': 4,
    'struct_COLOR_F':  16,
    'struct_FLOAT2':   8,
    'struct_FLOAT3':   12,
    'struct_FLOAT4':   16,
}

# ACCEPT_TYPES の値 → DxLib 側の実型 (生成コード内で使う型名)
KIND_TO_CTYPE = {
    'int':             'int',
    'float':           'float',
    'double':          'double',
    'tchar':           'const TCHAR *',
    'char':            'const char *',
    'uint':            'unsigned int',
    'uchar':           'unsigned char',
    'ushort':          'unsigned short',
    'ulong':           'unsigned long',
    'int64':           'LONGLONG',
    'uint64':          'ULONGLONG',
    'struct_VECTOR':   'VECTOR',
    'struct_VECTOR_D': 'VECTOR_D',
    'struct_MATRIX':   'MATRIX',
    'struct_MATRIX_D': 'MATRIX_D',
    'struct_COLOR_U8': 'COLOR_U8',
    'struct_COLOR_F':  'COLOR_F',
    'struct_FLOAT2':   'FLOAT2',
    'struct_FLOAT3':   'FLOAT3',
    'struct_FLOAT4':   'FLOAT4',
}

# Skip list: 既に hand-written で実装済、または名前空間かぶりを避ける、
# または VS x64 ビルドに含まれていない (DxLib.h に宣言だけある) 関数
SKIP_NAMES = {
    # VS x64 ビルドで未定義シンボル (2026-04-21 ビルドで発覚)
    'MailApp_Send',
    'SetProxySetting', 'SetIEProxySetting',
    'CheckNetWorkSendUDP',
    'HTTP_Close', 'HTTP_CloseAll', 'HTTP_GetDownloadFileSize',
    'HTTP_GetDownloadedFileSize', 'HTTP_GetError', 'HTTP_GetFileSize',
    'HTTP_GetState', 'HTTP_StartGetFileSize',
    'URLConvert', 'fgetsForNetHandle',
    # Phase 1/5.1/5.2 で手書き実装済
    'DrawPixel', 'DrawCircle', 'DrawBox', 'DrawLine', 'DrawGraph',
    'DrawRotaGraph', 'DrawRectGraph', 'DrawExtendGraph', 'DrawString',
    'DrawCircleAA', 'DrawLineAA', 'DrawBoxAA', 'DrawTriangle',
    'DrawModiGraph', 'DrawRectRotaGraph',
    'LoadGraph', 'LoadSoundMem', 'MakeScreen', 'DeleteGraph',
    'PlaySoundMem', 'StopSoundMem', 'DeleteSoundMem',
    'SetVolumeSoundMem', 'SetPanSoundMem', 'CheckSoundMem',
    'DrawCube3D', 'DrawSphere3D',
    'SetCameraPositionAndTarget_UpVecY', 'SetupCamera_Perspective',
    'MV1LoadModel', 'MV1DrawModel', 'MV1SetPosition', 'MV1SetRotationXYZ',
    'MV1SetScale', 'MV1DeleteModel',
    'GetColor', 'GetJoypadInputState', 'GetJoypadAnalogInput',
    'CheckHitKey', 'GetMousePoint', 'GetMouseInput', 'SetMousePoint',
    'ClearDrawScreen', 'ScreenFlip', 'DxLib_Init', 'DxLib_End',
    'ProcessMessage', 'SetDrawScreen',
    'SetMainWindowText', 'SetWindowText', 'SetGraphMode',
    'ChangeWindowMode', 'SetBackgroundColor',
    'CreateFontToHandle', 'ChangeFont', 'SetFontSize', 'SetFontThickness',
    'SetUseLighting', 'SetLightDirection',
    'SetUseZBuffer3D', 'SetWriteZBuffer3D',
    'SetUseCharCodeFormat', 'SetWaitVSyncFlag',
    'SetDrawMode', 'SetDrawBright', 'SetDrawBlendMode',
    'GetMainWindowHandle', 'GetGraphSize',
    'PlayMovieToGraph', 'PauseMovieToGraph',
    'SaveDrawScreen',
    # 戻り値を ctx->stat に入れるだけで意味が取れない (refstr/refdval 必要) ものも後で
}


def parse_arg(arg_str):
    """1 引数文字列から (kind, name, default) を抽出。受け入れ不可なら None。
       kind は ACCEPT_TYPES の値 ('int', 'uint', 'struct_VECTOR', ...)。"""
    arg_str = arg_str.strip()
    if not arg_str or arg_str == 'void':
        return None
    m = ARG_RE.match(arg_str)
    if not m:
        return None
    type_, star, name, default = m.group(1), m.group(2), m.group(3), m.group(4)
    # 複数語 (unsigned int 等) は空白を 1 つに正規化
    type_ = re.sub(r'\s+', ' ', type_)
    # const TCHAR * / const char * はポインタ必須
    if type_ == 'TCHAR':
        return ('tchar', name, default) if star == '*' else None
    if type_ == 'char':
        return ('char', name, default) if star == '*' else None
    # その他はポインタ不可 (値渡し前提)
    if star:
        return None
    if type_ not in ACCEPT_TYPES:
        return None
    return (ACCEPT_TYPES[type_], name, default)


def parse_signature(match):
    """FUNC_RE マッチから (name, [(type, name, default)...]) または None を返す。
    フィルタに引っかかる関数は None。
    """
    name = match.group(1)
    if name in SKIP_NAMES:
        return None
    raw_args = match.group(2)
    # void だけの場合 [] を返す
    if raw_args.strip() == 'void' or raw_args.strip() == '':
        return (name, [])
    # カンマ分割 (ネストなし前提 — TEMPLATE がない DxLib.h では OK)
    args = []
    for piece in raw_args.split(','):
        a = parse_arg(piece)
        if a is None:
            return None    # 1 つでも受け入れ不可なら関数全体を skip
        args.append(a)
    return (name, args)


def to_snake_lower(camel):
    """CamelCase → snake_case。DxLib の大文字混じり関数名を dx_small_snake にする。"""
    # DxLib_ / NS_ などの既存のプレフィックス + underscore を取り除く
    if camel.startswith('DxLib_'):
        camel = camel[len('DxLib_'):]
    s1 = re.sub(r'(.)([A-Z][a-z]+)', r'\1_\2', camel)
    s2 = re.sub(r'([a-z0-9])([A-Z])', r'\1_\2', s1).lower()
    # 二重下線を 1 つに畳む
    s2 = re.sub(r'__+', '_', s2)
    return s2


def main():
    with open(HDR_PATH, 'rb') as f:
        # SJIS 混じりなので bytes で読む (コメント中に SJIS が入ってる可能性)
        data = f.read().decode('latin-1', errors='replace')

    matches = list(FUNC_RE.finditer(data))
    functions = []
    skipped = 0
    for m in matches:
        parsed = parse_signature(m)
        if parsed is None:
            skipped += 1
            continue
        functions.append(parsed)

    # 重複名を排除 (DxLib.h には同名ラッパが複数ある)
    seen = set()
    unique = []
    for fn, args in functions:
        if fn in seen:
            continue
        seen.add(fn)
        unique.append((fn, args))
    functions = unique

    print(f'parsed: {len(matches)}  accepted: {len(functions)}  skipped: {skipped}')
    if len(functions) > OPCODE_END - OPCODE_START + 1:
        print(f'WARN: too many functions ({len(functions)}) for opcode range '
              f'0x{OPCODE_START:03X}..0x{OPCODE_END:03X}; truncating')
        functions = functions[:OPCODE_END - OPCODE_START + 1]

    # ------------------------------------------------------------------
    # iron_dxlib_auto.as
    # ------------------------------------------------------------------
    as_lines = [
        ';============================================================',
        ';  iron_dxlib_auto.as — Phase 5.3 自動生成 DxLib bindings',
        ';  DO NOT EDIT — tools/hsp3dx_dxlib_gen/gen_dxlib_bindings.py で再生成',
        f';  関数数: {len(functions)}',
        ';============================================================',
        '#ifndef __iron_dxlib_auto_as__',
        '#define __iron_dxlib_auto_as__',
        '',
        '#regcmd 9',
        '',
    ]
    for i, (fn, args) in enumerate(functions):
        opcode = OPCODE_START + i
        dx_name = 'dx_' + to_snake_lower(fn)
        as_lines.append(f'#cmd {dx_name:<38} ${opcode:03x}')
    as_lines.append('')
    as_lines.append('#endif')
    with open(OUT_AS, 'w', encoding='utf-8', newline='\n') as f:
        f.write('\n'.join(as_lines))

    # ------------------------------------------------------------------
    # hsp3dx_dxlib_auto.cpp
    # ------------------------------------------------------------------
    cpp = []
    cpp.append('//')
    cpp.append('//  hsp3dx_dxlib_auto.cpp — Phase 5.3 自動生成 DxLib binding dispatcher')
    cpp.append('//  DO NOT EDIT — tools/hsp3dx_dxlib_gen/gen_dxlib_bindings.py で再生成')
    cpp.append(f'//  関数数: {len(functions)}')
    cpp.append('//')
    cpp.append('//  hsp3dx_extcmd.cpp の cmdfunc_extcmd() から以下で呼ばれる:')
    cpp.append('//      if ( hsp3dx_dxlib_auto_dispatch( cmd, ctx ) ) return RUNMODE_RUN;')
    cpp.append('//')
    cpp.append('#include <stdio.h>')
    cpp.append('#include <string.h>')
    cpp.append('#include <windows.h>')
    cpp.append('#include "../../hsp3/hsp3config.h"')
    cpp.append('#include "../../hsp3/hsp3struct.h"  // PVal / APTR (struct 引数用)')
    cpp.append('#include "../../hsp3/hsp3code.h"')
    cpp.append('#include "../../hsp3/hsp3debug.h"')
    cpp.append('#include "DxLib.h"')
    cpp.append('#include "hsp3dx_console.h"    // utf8_to_wide')
    cpp.append('')
    cpp.append('//  本ファイル専用のユーティリティ (console.h の公開関数を使う)')
    cpp.append('static int hsp3dx_auto_geti(int def) { return code_getdi(def); }')
    cpp.append('static double hsp3dx_auto_getd(double def) { return code_getdd(def); }')
    cpp.append('static const char *hsp3dx_auto_gets() { return code_gets(); }')
    cpp.append('')
    cpp.append('extern "C" int hsp3dx_dxlib_auto_dispatch( int cmd, HSPCTX *ctx )')
    cpp.append('{')
    cpp.append('    switch ( cmd ) {')

    for i, (fn, args) in enumerate(functions):
        opcode = OPCODE_START + i
        cpp.append(f'    case 0x{opcode:03x}: {{  // {fn}')
        # 引数展開
        call_args = []
        for idx, (t, aname, default) in enumerate(args):
            local = f'_a{idx}'
            if t == 'int':
                d = default if default else '0'
                if d == 'TRUE': d = '1'
                elif d == 'FALSE': d = '0'
                cpp.append(f'        int {local} = hsp3dx_auto_geti( {d} );')
                call_args.append(local)
            elif t in ('uint', 'uchar', 'ushort', 'ulong'):
                ctype = KIND_TO_CTYPE[t]
                d = default if default else '0'
                if d == 'TRUE': d = '1'
                elif d == 'FALSE': d = '0'
                cpp.append(f'        {ctype} {local} = ({ctype})hsp3dx_auto_geti( (int)({d}) );')
                call_args.append(local)
            elif t == 'int64':
                d = default if default else '0'
                cpp.append(f'        LONGLONG {local} = (LONGLONG)code_geti64();')
                call_args.append(local)
            elif t == 'uint64':
                cpp.append(f'        ULONGLONG {local} = (ULONGLONG)code_geti64();')
                call_args.append(local)
            elif t == 'float':
                d = default if default else '0.0'
                d = d.rstrip('f')
                cpp.append(f'        float {local} = (float)hsp3dx_auto_getd( {d} );')
                call_args.append(local)
            elif t == 'double':
                d = default if default else '0.0'
                cpp.append(f'        double {local} = hsp3dx_auto_getd( {d} );')
                call_args.append(local)
            elif t == 'tchar':
                cpp.append(f'        const char *{local}_u8 = hsp3dx_auto_gets();')
                cpp.append(f'        wchar_t {local}_w[1024];')
                cpp.append(f'        hsp3dx_utf8_to_wide( {local}_u8, {local}_w, 1024 );')
                call_args.append(f'{local}_w')
            elif t == 'char':
                cpp.append(f'        const char *{local} = hsp3dx_auto_gets();')
                call_args.append(local)
            elif t.startswith('struct_'):
                ctype = KIND_TO_CTYPE[t]
                size  = STRUCT_SIZES[t]
                cpp.append(f'        PVal *{local}_pv; APTR {local}_ap;')
                cpp.append(f'        {local}_ap = code_getva( &{local}_pv );')
                cpp.append(f'        if ( {local}_pv->pt == nullptr || {local}_pv->len[0] < {size} )')
                cpp.append(f'            throw HSPERR_TYPE_MISMATCH;')
                cpp.append(f'        {ctype} {local};')
                cpp.append(f'        memcpy( &{local}, {local}_pv->pt + {local}_ap * {local}_pv->len[0], sizeof({ctype}) );')
                call_args.append(local)
        cpp.append(f'        ctx->stat = {fn}( {", ".join(call_args)} );')
        cpp.append('        return 1;')
        cpp.append('    }')

    cpp.append('    }')
    cpp.append('    return 0;   // 未処理 → 呼び出し側で HSPERR_UNSUPPORTED_FUNCTION 投げる')
    cpp.append('}')
    cpp.append('')
    with open(OUT_CPP, 'w', encoding='utf-8', newline='\n') as f:
        f.write('\n'.join(cpp))

    print(f'generated:')
    print(f'  {OUT_AS}   ({len(functions)} #cmd entries)')
    print(f'  {OUT_CPP}  ({len(functions)} case handlers)')


if __name__ == '__main__':
    main()
