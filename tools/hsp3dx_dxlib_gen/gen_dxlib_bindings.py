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

HDR_PATH    = r"J:\HNWorks\IronHSP_2026\hsp3dx\extlib\dxlib_win\DxLib_VC\DxLib.h"
OUT_CPP     = r"J:\HNWorks\IronHSP_2026\hsp3dx\src\hsp3dx_dxlib_auto.cpp"
OUT_AS      = r"J:\HNWorks\IronHSP_2026\package\win32\common\iron_dxlib_auto.as"
OUT_HS      = r"J:\HNWorks\IronHSP_2026\package\hsphelp\iron_dxlib_auto.hs"
#  Phase 5.5p: #ccmd (関数形式) 版の別出力
OUT_CPP_F   = r"J:\HNWorks\IronHSP_2026\hsp3dx\src\hsp3dx_dxlib_auto_f.cpp"
OUT_AS_F    = r"J:\HNWorks\IronHSP_2026\package\win32\common\iron_dxlib_auto_f.as"

OPCODE_START  = 0x200
OPCODE_END    = 0x9FF
#  #ccmd 式形式用の opcode は別範囲 (EXTSYSVAR 空間)
OPCODE_FSTART = 0x300
OPCODE_FEND   = 0xFFF

# Function signature pattern:
#   extern <rettype> FuncName( arg1, arg2 ... );
# rettype: int / unsigned int / float / double / LONGLONG / ULONGLONG /
#          VECTOR / VECTOR_D / MATRIX / MATRIX_D / COLOR_F / COLOR_U8 /
#          FLOAT2 / FLOAT3 / FLOAT4
ACCEPTED_RETURNS = {
    'int':                  'r_int',
    'unsigned int':         'r_uint',
    'float':                'r_float',
    'double':               'r_double',
    'LONGLONG':             'r_int64',
    'ULONGLONG':            'r_uint64',
    'VECTOR':               'r_VECTOR',
    'VECTOR_D':             'r_VECTOR_D',
    'MATRIX':               'r_MATRIX',
    'MATRIX_D':             'r_MATRIX_D',
    'COLOR_F':              'r_COLOR_F',
    'COLOR_U8':             'r_COLOR_U8',
    'FLOAT2':               'r_FLOAT2',
    'FLOAT3':               'r_FLOAT3',
    'FLOAT4':               'r_FLOAT4',
}
FUNC_RE = re.compile(
    r'extern\s+((?:unsigned\s+)?\w+)\s+(\w+)\s*\(\s*(.*?)\s*\)\s*;',
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

# Skip list: auto-gen から除外する関数名
# 除外理由は以下のいずれか:
#   (A) VS x64 ビルドで .lib に実体が無い (リンクエラー)
#   (B) hsp3dx ランタイムのライフサイクル管理側で呼ぶため直接公開しない
SKIP_NAMES = {
    # --- (A) 未定義シンボル ---
    'MailApp_Send',
    'SetProxySetting', 'SetIEProxySetting',
    'CheckNetWorkSendUDP',
    'HTTP_Close', 'HTTP_CloseAll', 'HTTP_GetDownloadFileSize',
    'HTTP_GetDownloadedFileSize', 'HTTP_GetError', 'HTTP_GetFileSize',
    'HTTP_GetState', 'HTTP_StartGetFileSize',
    'URLConvert', 'URLAnalys', 'fgetsForNetHandle',
    'GetProxySetting',

    # Android DxLib は DX_NON_NETWORK 有効なので network API が未定義
    # (Windows 版は使えるが、クロスプラットフォーム性のため auto-gen からは除外。
    #  Windows 向けには hsp3dx 独自の dx_http_* / dx_ws_* を用意済)
    'CheckNetWorkRecvUDP', 'CheckNetWorkSendUDP',
    'CloseNetWork', 'ConnectNetWork', 'ConnectNetWork_ASync',
    'ConnectNetWork_IPv6', 'ConnectNetWork_IPv6_ASync',
    'DeleteUDPSocket',
    'GetHostIPbyName', 'GetHostIPbyNameWithStrLen',
    'GetHostIPbyName_IPv6', 'GetHostIPbyName_IPv6WithStrLen',
    'GetLostNetWork', 'GetMyIPAddress', 'GetMyIPAddress_IPv6',
    'GetNetWorkAcceptState', 'GetNetWorkCloseAfterLostFlag',
    'GetNetWorkDataLength', 'GetNetWorkIP', 'GetNetWorkIP_IPv6',
    'GetNetWorkSendDataLength', 'GetNewAcceptNetWork',
    'GetUseDXNetWorkProtocol', 'GetUseDXProtocol',
    'HTTP_FileDownload', 'HTTP_StartFileDownload',
    'MakeUDPSocket', 'MakeUDPSocket_IPv6',
    'NetWorkRecv', 'NetWorkRecvBufferClear', 'NetWorkRecvToPeek',
    'NetWorkRecvUDP', 'NetWorkRecvUDP_IPv6',
    'NetWorkSend', 'NetWorkSendUDP', 'NetWorkSendUDP_IPv6',
    'PreparationListenNetWork', 'PreparationListenNetWork_IPv6',
    'ProcessNetMessage', 'SetConnectTimeOutWait',
    'SetNetWorkCloseAfterLostFlag',
    'SetUseDXNetWorkProtocol', 'SetUseDXProtocol',
    'StopListenNetWork', 'URLParamAnalysis',

    # Android DxLib で未宣言/シグネチャ違いの関数 (コンパイルエラー回避)
    'GetLastErrorMessage', 'GetClipboardText',
    'ClearInputCharBuf', 'GetOneChar', 'GetOneCharWait',
    # IME / Key input 系 (Android では IME 機構が Java 側なので DxLib 未実装)
    'DrawIMEInputString', 'DrawIMEInputExtendString',
    'SetUseIMEFlag', 'GetUseIMEFlag',
    'SetInputStringMaxLengthIMESync', 'SetIMEInputStringMaxLength',
    'KeyInputNumber', 'GetIMEInputModeStr',
    'SetIMEInputString', 'SetKeyInputStringFont', 'DrawKeyInputModeString',
    'InitKeyInput', 'DeleteKeyInput',
    'SetActiveKeyInput', 'GetActiveKeyInput',
    'CheckKeyInput', 'ReStartKeyInput',
    'ProcessActKeyInput', 'DrawKeyInputString', 'DrawKeyInputExtendString',
    'SetKeyInputDrawArea', 'SetKeyInputSelectArea',
    'SetKeyInputDrawStartPos', 'GetKeyInputDrawStartPos',
    'SetKeyInputCursorBrinkTime', 'SetKeyInputCursorBrinkFlag',
    'SetKeyInputString', 'SetKeyInputNumber', 'SetKeyInputNumberToFloat',
    'GetKeyInputString', 'GetKeyInputNumber', 'GetKeyInputNumberToFloat',
    'SetKeyInputCursorPosition', 'GetKeyInputCursorPosition',
    'FileRead_gets',    #  signature ミスマッチ (int argに const char* 期待)
    'GetKeyInputSelectArea',
    #  ConvertFullPath / GetGraphFilePath / EnumFontName / MV1GetFrameName2
    #  は Android で TCHAR 戻り buffer size の扱いが Win 版と異なる
    'ConvertFullPath', 'GetGraphFilePath', 'EnumFontName', 'MV1GetFrameName2',
    'GetFontStateToHandle',
    #  Android DxLib static lib に未実装のマウス関数
    'SetMouseDispFlag', 'SetMouseDispIgnoreMenuFlag',
    #  Windows PC speaker beep API (Android 未実装)
    'SetBeepFrequency', 'PlayBeep', 'StopBeep',
    #  Live2D (Android ビルドには Live2D Cubism Core が同梱されていない)
    'Live2D_SetCubism4CoreDLLPath', 'Live2D_SetCubism3CoreDLLPath',
    'Live2D_RenderBegin', 'Live2D_RenderEnd',
    'Live2D_LoadModel', 'Live2D_DeleteModel', 'Live2D_InitModel',
    'Live2D_SetUseAutoScaling', 'Live2D_SetUseAutoCentering',
    'Live2D_SetUseReverseYAxis',
    'Live2D_Model_Update', 'Live2D_Model_SetTranslate',

    # --- (B) hsp3dx ランタイム専管 ---
    #  DxLib_Init / DxLib_End: hgio_dx_init/term が呼ぶ (ユーザが呼ぶと壊れる)
    #  ProcessMessage: ランタイムのメインループが呼んでいる
    'DxLib_Init', 'DxLib_End', 'ProcessMessage',
}


#  out-param (ポインタ引数) として受け入れる型 → kind
OUT_PARAM_TYPES = {
    'int':       'out_int',
    'float':     'out_float',
    'double':    'out_double',
    'VECTOR':    'out_VECTOR',
    'VECTOR_D':  'out_VECTOR_D',
    'MATRIX':    'out_MATRIX',
    'MATRIX_D':  'out_MATRIX_D',
    'COLOR_F':   'out_COLOR_F',
    'COLOR_U8':  'out_COLOR_U8',
    'FLOAT2':    'out_FLOAT2',
    'FLOAT3':    'out_FLOAT3',
    'FLOAT4':    'out_FLOAT4',
}

#  out 構造体のサイズ (pval->len[0] チェック用)
OUT_STRUCT_SIZES = {
    'out_VECTOR':   12,
    'out_VECTOR_D': 24,
    'out_MATRIX':   64,
    'out_MATRIX_D': 128,
    'out_COLOR_F':  16,
    'out_COLOR_U8': 4,
    'out_FLOAT2':   8,
    'out_FLOAT3':   12,
    'out_FLOAT4':   16,
}

#  out 型 → DxLib 側の型名
OUT_CTYPE = {
    'out_int':      'int',
    'out_float':    'float',
    'out_double':   'double',
    'out_VECTOR':   'VECTOR',
    'out_VECTOR_D': 'VECTOR_D',
    'out_MATRIX':   'MATRIX',
    'out_MATRIX_D': 'MATRIX_D',
    'out_COLOR_F':  'COLOR_F',
    'out_COLOR_U8': 'COLOR_U8',
    'out_FLOAT2':   'FLOAT2',
    'out_FLOAT3':   'FLOAT3',
    'out_FLOAT4':   'FLOAT4',
}


def parse_arg(arg_str):
    """1 引数文字列から (kind, name, default) を抽出。受け入れ不可なら None。
       kind は ACCEPT_TYPES の値 ('int', 'uint', 'struct_VECTOR', 'out_int', ...)。"""
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
    # ポインタ付き: out-param として扱える型か
    if star:
        if type_ in OUT_PARAM_TYPES:
            return (OUT_PARAM_TYPES[type_], name, default)
        return None
    if type_ not in ACCEPT_TYPES:
        return None
    return (ACCEPT_TYPES[type_], name, default)


def parse_signature(match):
    """FUNC_RE マッチから (name, return_kind, [(type, name, default)...]) または None を返す。
    フィルタに引っかかる関数は None。
    return_kind は ACCEPTED_RETURNS の値 ('r_int', 'r_VECTOR' 等)。
    """
    rettype = re.sub(r'\s+', ' ', match.group(1))
    name    = match.group(2)
    if name in SKIP_NAMES:
        return None
    #  Live2D 系は Android ビルドに Cubism Core がないため全除外
    if name.startswith('Live2D_'):
        return None
    if rettype not in ACCEPTED_RETURNS:
        return None
    return_kind = ACCEPTED_RETURNS[rettype]
    raw_args = match.group(3)
    if raw_args.strip() == 'void' or raw_args.strip() == '':
        return (name, return_kind, [])
    args = []
    for piece in raw_args.split(','):
        a = parse_arg(piece)
        if a is None:
            return None
        args.append(a)
    return (name, return_kind, args)


def to_dx_name(camel):
    """DxLib の CamelCase 関数名 → dx_CamelCase (HSP キーワードとして使える形)。
       元の関数名はそのまま保持 (ユーザが DxLib ドキュメントから照合できる)。"""
    return 'dx_' + camel


def type_label(kind):
    """ACCEPT_TYPES の値 → .hs / コメント表示用ラベル"""
    m = {
        'int': 'int',          'uint': 'int (uint 扱い)',
        'uchar': 'int (uchar 扱い)', 'ushort': 'int (ushort 扱い)',
        'ulong': 'int (ulong 扱い)', 'int64': 'int64',
        'uint64': 'int64 (uint64 扱い)',
        'float': 'double (float 縮小)', 'double': 'double',
        'tchar': 'str', 'char': 'str',
        'struct_VECTOR': 'var (VECTOR: #defstruct float x,y,z)',
        'struct_VECTOR_D': 'var (VECTOR_D: #defstruct double x,y,z)',
        'struct_MATRIX': 'var (MATRIX: 4x4 float)',
        'struct_MATRIX_D': 'var (MATRIX_D: 4x4 double)',
        'struct_COLOR_U8': 'var (COLOR_U8: byte r,g,b,a)',
        'struct_COLOR_F': 'var (COLOR_F: float r,g,b,a)',
        'struct_FLOAT2': 'var (FLOAT2)',
        'struct_FLOAT3': 'var (FLOAT3)',
        'struct_FLOAT4': 'var (FLOAT4)',
        'out_int': 'var (int 出力)',
        'out_float': 'var (double 出力、float 昇格)',
        'out_double': 'var (double 出力)',
        'out_VECTOR': 'var (VECTOR 出力)',
        'out_VECTOR_D': 'var (VECTOR_D 出力)',
        'out_MATRIX': 'var (MATRIX 出力)',
        'out_MATRIX_D': 'var (MATRIX_D 出力)',
        'out_COLOR_F': 'var (COLOR_F 出力)',
        'out_COLOR_U8': 'var (COLOR_U8 出力)',
        'out_FLOAT2': 'var (FLOAT2 出力)',
        'out_FLOAT3': 'var (FLOAT3 出力)',
        'out_FLOAT4': 'var (FLOAT4 出力)',
    }
    return m.get(kind, kind)


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
    for fn, rkind, args in functions:
        if fn in seen:
            continue
        seen.add(fn)
        unique.append((fn, rkind, args))
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
    #  非 int 戻り値は HSP 側で "out var, args..." の形 (out が先頭)。
    #  コメントにそれを反映する。
    RKIND_LABEL = {
        'r_int':     'int',     'r_uint':     'uint',
        'r_float':   'float',   'r_double':   'double',
        'r_int64':   'int64',   'r_uint64':   'uint64',
        'r_VECTOR':  'VECTOR',  'r_VECTOR_D': 'VECTOR_D',
        'r_MATRIX':  'MATRIX',  'r_MATRIX_D': 'MATRIX_D',
        'r_COLOR_F': 'COLOR_F', 'r_COLOR_U8': 'COLOR_U8',
        'r_FLOAT2':  'FLOAT2',  'r_FLOAT3':   'FLOAT3', 'r_FLOAT4': 'FLOAT4',
    }
    for i, (fn, rkind, args) in enumerate(functions):
        opcode = OPCODE_START + i
        dx_name = to_dx_name(fn)
        sig_in = ', '.join(type_label(t) for (t, _, _) in args)
        if rkind == 'r_int':
            sig = f'[stat] <- {fn}({sig_in})'
        else:
            sig = f'[out {RKIND_LABEL[rkind]}] <- {fn}({sig_in})'
        as_lines.append(f'#cmd {dx_name:<45} ${opcode:03x}     ; {sig}')
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
    cpp.append('#ifdef _WIN32')
    cpp.append('#include <windows.h>')
    cpp.append('#endif')
    cpp.append('#include "hsp3dx_compat.h"')
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

    for i, (fn, rkind, args) in enumerate(functions):
        opcode = OPCODE_START + i
        cpp.append(f'    case 0x{opcode:03x}: {{  // {fn}  -> {rkind}')
        # 戻り値が非 int の場合、先頭に out 変数を受け取る処理を生成
        ret_local = '_ret'
        if rkind == 'r_int':
            pass  # 既存通り、stat に入れる
        elif rkind in ('r_uint', 'r_float', 'r_double', 'r_int64', 'r_uint64'):
            cpp.append(f'        PVal *{ret_local}_pv; APTR {ret_local}_ap;')
            cpp.append(f'        {ret_local}_ap = code_getva( &{ret_local}_pv );')
        else:
            # 構造体戻り値: NSTRUCT 変数に memcpy で書き戻し
            ctype = {'r_VECTOR':'VECTOR','r_VECTOR_D':'VECTOR_D',
                     'r_MATRIX':'MATRIX','r_MATRIX_D':'MATRIX_D',
                     'r_COLOR_F':'COLOR_F','r_COLOR_U8':'COLOR_U8',
                     'r_FLOAT2':'FLOAT2','r_FLOAT3':'FLOAT3','r_FLOAT4':'FLOAT4'}[rkind]
            size  = {'r_VECTOR':12,'r_VECTOR_D':24,'r_MATRIX':64,'r_MATRIX_D':128,
                     'r_COLOR_F':16,'r_COLOR_U8':4,'r_FLOAT2':8,'r_FLOAT3':12,'r_FLOAT4':16}[rkind]
            cpp.append(f'        PVal *{ret_local}_pv; APTR {ret_local}_ap;')
            cpp.append(f'        {ret_local}_ap = code_getva( &{ret_local}_pv );')
            cpp.append(f'        if ( {ret_local}_pv->pt == nullptr || {ret_local}_pv->len[0] < {size} )')
            cpp.append(f'            throw HSPERR_TYPE_MISMATCH;')
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
                #  TCHAR は Win=wchar_t / Android=char。Win は UTF-8 → UTF-16 変換、
                #  Android/iOS は UTF-8 をそのまま渡す (DxLib が UTF8 モードで受ける)
                cpp.append(f'        const char *{local}_u8 = hsp3dx_auto_gets();')
                cpp.append(f'#ifdef _WIN32')
                cpp.append(f'        wchar_t {local}_t[1024];')
                cpp.append(f'        hsp3dx_utf8_to_wide( {local}_u8, {local}_t, 1024 );')
                cpp.append(f'#else')
                cpp.append(f'        const char *{local}_t = {local}_u8;')
                cpp.append(f'#endif')
                call_args.append(f'{local}_t')
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
            elif t == 'out_int':
                #  int* : HSP 変数を取り、呼出後に代入で書き戻す
                cpp.append(f'        PVal *{local}_pv; APTR {local}_ap;')
                cpp.append(f'        {local}_ap = code_getva( &{local}_pv );')
                cpp.append(f'        int {local} = 0;')
                call_args.append(f'&{local}')
            elif t == 'out_float':
                cpp.append(f'        PVal *{local}_pv; APTR {local}_ap;')
                cpp.append(f'        {local}_ap = code_getva( &{local}_pv );')
                cpp.append(f'        float {local} = 0.0f;')
                call_args.append(f'&{local}')
            elif t == 'out_double':
                cpp.append(f'        PVal *{local}_pv; APTR {local}_ap;')
                cpp.append(f'        {local}_ap = code_getva( &{local}_pv );')
                cpp.append(f'        double {local} = 0.0;')
                call_args.append(f'&{local}')
            elif t.startswith('out_'):
                #  struct out: NSTRUCT 変数の生メモリに直接書く (コピー不要)
                ctype = OUT_CTYPE[t]
                size  = OUT_STRUCT_SIZES[t]
                cpp.append(f'        PVal *{local}_pv; APTR {local}_ap;')
                cpp.append(f'        {local}_ap = code_getva( &{local}_pv );')
                cpp.append(f'        if ( {local}_pv->pt == nullptr || {local}_pv->len[0] < {size} )')
                cpp.append(f'            throw HSPERR_TYPE_MISMATCH;')
                cpp.append(f'        {ctype} *{local} = ({ctype} *)({local}_pv->pt + {local}_ap * {local}_pv->len[0]);')
                call_args.append(local)
        call_str = f'{fn}( {", ".join(call_args)} )'
        # 戻り値処理
        if rkind == 'r_int':
            cpp.append(f'        ctx->stat = {call_str};')
        elif rkind == 'r_uint':
            cpp.append(f'        unsigned int {ret_local} = {call_str};')
            cpp.append(f'        int {ret_local}_i = (int){ret_local};')
            cpp.append(f'        code_setva( {ret_local}_pv, {ret_local}_ap, TYPE_INUM, &{ret_local}_i );')
            cpp.append(f'        ctx->stat = (int){ret_local};')
        elif rkind == 'r_float':
            cpp.append(f'        float {ret_local} = {call_str};')
            cpp.append(f'        double {ret_local}_d = (double){ret_local};')
            cpp.append(f'        code_setva( {ret_local}_pv, {ret_local}_ap, TYPE_DNUM, &{ret_local}_d );')
        elif rkind == 'r_double':
            cpp.append(f'        double {ret_local} = {call_str};')
            cpp.append(f'        code_setva( {ret_local}_pv, {ret_local}_ap, TYPE_DNUM, &{ret_local} );')
        elif rkind == 'r_int64':
            cpp.append(f'        LONGLONG {ret_local} = {call_str};')
            cpp.append(f'        int {ret_local}_i = (int){ret_local};')
            cpp.append(f'        code_setva( {ret_local}_pv, {ret_local}_ap, TYPE_INUM, &{ret_local}_i );')
        elif rkind == 'r_uint64':
            cpp.append(f'        ULONGLONG {ret_local} = {call_str};')
            cpp.append(f'        int {ret_local}_i = (int){ret_local};')
            cpp.append(f'        code_setva( {ret_local}_pv, {ret_local}_ap, TYPE_INUM, &{ret_local}_i );')
        else:
            #  構造体戻り値: NSTRUCT 変数の生メモリに memcpy
            ctype = {'r_VECTOR':'VECTOR','r_VECTOR_D':'VECTOR_D',
                     'r_MATRIX':'MATRIX','r_MATRIX_D':'MATRIX_D',
                     'r_COLOR_F':'COLOR_F','r_COLOR_U8':'COLOR_U8',
                     'r_FLOAT2':'FLOAT2','r_FLOAT3':'FLOAT3','r_FLOAT4':'FLOAT4'}[rkind]
            cpp.append(f'        {ctype} {ret_local} = {call_str};')
            cpp.append(f'        memcpy( {ret_local}_pv->pt + {ret_local}_ap * {ret_local}_pv->len[0], &{ret_local}, sizeof({ctype}) );')
        #  out-param のスカラーは呼出後に HSP 変数に書き戻す
        for idx, (t, aname, default) in enumerate(args):
            local = f'_a{idx}'
            if t == 'out_int':
                cpp.append(f'        code_setva( {local}_pv, {local}_ap, TYPE_INUM, &{local} );')
            elif t == 'out_float':
                cpp.append(f'        double {local}_d = (double){local};')
                cpp.append(f'        code_setva( {local}_pv, {local}_ap, TYPE_DNUM, &{local}_d );')
            elif t == 'out_double':
                cpp.append(f'        code_setva( {local}_pv, {local}_ap, TYPE_DNUM, &{local} );')
        cpp.append('        return 1;')
        cpp.append('    }')

    cpp.append('    }')
    cpp.append('    return 0;   // 未処理 → 呼び出し側で HSPERR_UNSUPPORTED_FUNCTION 投げる')
    cpp.append('}')
    cpp.append('')
    with open(OUT_CPP, 'w', encoding='utf-8', newline='\n') as f:
        f.write('\n'.join(cpp))

    # ------------------------------------------------------------------
    # Phase 5.5p: 関数形式 (#ccmd) 出力
    # 対象: スカラー戻り (int/uint/float/double/int64/uint64) かつ
    #       引数がスカラー + tchar のみ (out-param / struct in / struct ret は不可)
    # 命名: 元の dx_CamelCase の後ろに _f (function form) を付けた名前
    # opcode 範囲: 0x300 〜 (EXTSYSVAR 空間)
    # ------------------------------------------------------------------
    SCALAR_ARG_KINDS = {'int', 'uint', 'uchar', 'ushort', 'ulong', 'int64', 'uint64',
                        'float', 'double', 'tchar', 'char'}
    SCALAR_RET_KINDS = {'r_int', 'r_uint', 'r_float', 'r_double', 'r_int64', 'r_uint64'}

    f_functions = []
    for fn, rkind, args in functions:
        if rkind not in SCALAR_RET_KINDS: continue
        bad = False
        for (t, _, _) in args:
            if t not in SCALAR_ARG_KINDS: bad = True; break
        if bad: continue
        f_functions.append((fn, rkind, args))

    if len(f_functions) > OPCODE_FEND - OPCODE_FSTART + 1:
        f_functions = f_functions[:OPCODE_FEND - OPCODE_FSTART + 1]

    #  ---- iron_dxlib_auto_f.as (#ccmd 版) ----
    fas = [
        ';============================================================',
        ';  iron_dxlib_auto_f.as — Phase 5.5p 自動生成 DxLib 関数形式 (#ccmd)',
        ';  DO NOT EDIT — gen_dxlib_bindings.py で再生成',
        f';  関数数: {len(f_functions)}',
        ';============================================================',
        '#ifndef __iron_dxlib_auto_f_as__',
        '#define __iron_dxlib_auto_f_as__',
        '',
        '#regcmd 10',    # TYPE_EXTSYSVAR
        '',
    ]
    R_CTYPE_SHORT = {'r_int':'int','r_uint':'uint','r_float':'float','r_double':'double',
                     'r_int64':'int64','r_uint64':'uint64'}
    for i, (fn, rkind, args) in enumerate(f_functions):
        opcode = OPCODE_FSTART + i
        name = to_dx_name(fn) + '_f'
        sig_in = ', '.join(type_label(t) for (t, _, _) in args)
        fas.append(f'#ccmd {name:<48} ${opcode:03x}     ; [{R_CTYPE_SHORT[rkind]}] <- {fn}({sig_in})')
    fas.append('')
    fas.append('#endif')
    with open(OUT_AS_F, 'w', encoding='utf-8', newline='\n') as f:
        f.write('\n'.join(fas))

    #  ---- hsp3dx_dxlib_auto_f.cpp (dispatcher) ----
    fcpp = []
    fcpp.append('//  hsp3dx_dxlib_auto_f.cpp — 関数形式 DxLib binding (#ccmd)')
    fcpp.append('//  DO NOT EDIT — gen_dxlib_bindings.py で再生成')
    fcpp.append(f'//  関数数: {len(f_functions)}')
    fcpp.append('#include <stdio.h>')
    fcpp.append('#include <string.h>')
    fcpp.append('#ifdef _WIN32')
    fcpp.append('#include <windows.h>')
    fcpp.append('#endif')
    fcpp.append('#include "hsp3dx_compat.h"')
    fcpp.append('#include "../../hsp3/hsp3config.h"')
    fcpp.append('#include "../../hsp3/hsp3struct.h"')
    fcpp.append('#include "../../hsp3/hsp3code.h"')
    fcpp.append('#include "../../hsp3/hsp3debug.h"')
    fcpp.append('#include "DxLib.h"')
    fcpp.append('#include "hsp3dx_console.h"')
    fcpp.append('')
    fcpp.append('//  dispatcher: reffunc_function から呼ばれる。')
    fcpp.append('//  既に `(` は code_next() で消費済、ここでは引数列を順に parse して DxLib 関数を呼ぶ。')
    fcpp.append('//  戻り値は専用 static 領域に格納、戻り type を *type_res、ポインタを return。')
    fcpp.append('//  戻り値 0 = 未対応 (dispatcher は触らなかった) / 1 = 処理済')
    fcpp.append('static int    s_ret_i = 0;')
    fcpp.append('static double s_ret_d = 0.0;')
    fcpp.append('static LONGLONG s_ret_i64 = 0;')
    fcpp.append('')
    fcpp.append('extern "C" int hsp3dx_dxlib_auto_f_dispatch( int cmd, int *type_res, void **ptr_out )')
    fcpp.append('{')
    fcpp.append('    switch ( cmd ) {')
    for i, (fn, rkind, args) in enumerate(f_functions):
        opcode = OPCODE_FSTART + i
        fcpp.append(f'    case 0x{opcode:03x}: {{  // {fn} -> {rkind}')
        call_args = []
        for idx, (t, aname, default) in enumerate(args):
            local = f'_a{idx}'
            if t == 'int':
                d = default if default else '0'
                if d == 'TRUE': d = '1'
                elif d == 'FALSE': d = '0'
                fcpp.append(f'        int {local} = code_getdi( {d} );')
                call_args.append(local)
            elif t in ('uint', 'uchar', 'ushort', 'ulong'):
                ctype = KIND_TO_CTYPE[t]
                d = default if default else '0'
                if d == 'TRUE': d = '1'
                elif d == 'FALSE': d = '0'
                fcpp.append(f'        {ctype} {local} = ({ctype})code_getdi( (int)({d}) );')
                call_args.append(local)
            elif t == 'int64':
                fcpp.append(f'        LONGLONG {local} = (LONGLONG)code_geti64();')
                call_args.append(local)
            elif t == 'uint64':
                fcpp.append(f'        ULONGLONG {local} = (ULONGLONG)code_geti64();')
                call_args.append(local)
            elif t == 'float':
                d = default if default else '0.0'
                d = d.rstrip('f')
                fcpp.append(f'        float {local} = (float)code_getdd( {d} );')
                call_args.append(local)
            elif t == 'double':
                d = default if default else '0.0'
                fcpp.append(f'        double {local} = code_getdd( {d} );')
                call_args.append(local)
            elif t == 'tchar':
                fcpp.append(f'        const char *{local}_u8 = code_gets();')
                fcpp.append(f'#ifdef _WIN32')
                fcpp.append(f'        static wchar_t {local}_t[1024];')
                fcpp.append(f'        hsp3dx_utf8_to_wide( {local}_u8, {local}_t, 1024 );')
                fcpp.append(f'#else')
                fcpp.append(f'        const char *{local}_t = {local}_u8;')
                fcpp.append(f'#endif')
                call_args.append(f'{local}_t')
            elif t == 'char':
                fcpp.append(f'        const char *{local} = code_gets();')
                call_args.append(local)
        call_str = f'{fn}( {", ".join(call_args)} )'
        if rkind == 'r_int':
            fcpp.append(f'        s_ret_i = {call_str};')
            fcpp.append('        *type_res = HSPVAR_FLAG_INT;')
            fcpp.append('        *ptr_out = &s_ret_i;')
        elif rkind == 'r_uint':
            fcpp.append(f'        s_ret_i = (int)({call_str});')
            fcpp.append('        *type_res = HSPVAR_FLAG_INT;')
            fcpp.append('        *ptr_out = &s_ret_i;')
        elif rkind == 'r_float':
            fcpp.append(f'        s_ret_d = (double)({call_str});')
            fcpp.append('        *type_res = HSPVAR_FLAG_DOUBLE;')
            fcpp.append('        *ptr_out = &s_ret_d;')
        elif rkind == 'r_double':
            fcpp.append(f'        s_ret_d = {call_str};')
            fcpp.append('        *type_res = HSPVAR_FLAG_DOUBLE;')
            fcpp.append('        *ptr_out = &s_ret_d;')
        elif rkind in ('r_int64', 'r_uint64'):
            fcpp.append(f'        s_ret_i64 = (LONGLONG)({call_str});')
            fcpp.append('        *type_res = HSPVAR_FLAG_INT64;')
            fcpp.append('        *ptr_out = &s_ret_i64;')
        fcpp.append('        return 1;')
        fcpp.append('    }')
    fcpp.append('    }')
    fcpp.append('    return 0;')
    fcpp.append('}')
    fcpp.append('')
    with open(OUT_CPP_F, 'w', encoding='utf-8', newline='\n') as f:
        f.write('\n'.join(fcpp))

    # ------------------------------------------------------------------
    # iron_dxlib_auto.hs — HSP Help (VS Code / VS 2022 / hsed から照会)
    # ------------------------------------------------------------------
    def guess_group(fn):
        """関数名から大まかなカテゴリを推測 (.hs の %group 用)"""
        n = fn
        if n.startswith('Draw'):         return 'DxLib 描画'
        if n.startswith('MV1'):          return 'DxLib MV1 モデル'
        if n.startswith('SetCamera') or n.startswith('GetCamera'): return 'DxLib カメラ'
        if n.startswith('SetLight') or n.startswith('GetLight') or 'Light' in n: return 'DxLib ライト'
        if 'Sound' in n or 'Music' in n or 'Audio' in n: return 'DxLib サウンド'
        if 'Movie' in n or 'Play' in n: return 'DxLib 動画 / 再生'
        if 'Shader' in n or 'Vertex' in n or 'Pixel' in n: return 'DxLib シェーダ'
        if 'Font' in n:                  return 'DxLib フォント'
        if 'Key' in n or 'Joypad' in n or 'Mouse' in n or 'Touch' in n: return 'DxLib 入力'
        if n.startswith('Set') or n.startswith('Get'): return 'DxLib 設定 / 取得'
        if n.startswith('Load') or n.startswith('Save') or 'File' in n: return 'DxLib ファイル'
        if 'Network' in n or 'Socket' in n or 'NetWork' in n: return 'DxLib ネットワーク'
        if 'Screen' in n or 'Graph' in n: return 'DxLib グラフィック'
        return 'DxLib その他'

    hs = []
    hs.append(';')
    hs.append('; iron_dxlib_auto.hs — hsp3dx 自動生成 DxLib 命令の HSP Help')
    hs.append('; DO NOT EDIT — tools/hsp3dx_dxlib_gen/gen_dxlib_bindings.py で再生成')
    hs.append(f'; 関数数: {len(functions)}')
    hs.append(';')
    hs.append('')
    hs.append('%dll')
    hs.append('iron_dxlib_auto')
    hs.append('%ver')
    hs.append('hsp3dx 5.5c')
    hs.append('%date')
    hs.append('2026/04/21')
    hs.append('%author')
    hs.append('DxLib: Takumi Yamada / hsp3dx binding: IronHSP Project')
    hs.append('%url')
    hs.append('https://dxlib.xsrv.jp/')
    hs.append('%note')
    hs.append('hsp3dx で iron_dxlib.as を #include すれば利用可能 (iron_dxlib_auto.as は内部 include)')
    hs.append('%type')
    hs.append('DxLib 自動生成コマンド (hsp3dx)')
    hs.append('%port')
    hs.append('Win')
    hs.append('')
    R_CTYPE_MAP = {'r_int':'int','r_uint':'unsigned int','r_float':'float','r_double':'double',
                   'r_int64':'LONGLONG','r_uint64':'ULONGLONG',
                   'r_VECTOR':'VECTOR','r_VECTOR_D':'VECTOR_D','r_MATRIX':'MATRIX','r_MATRIX_D':'MATRIX_D',
                   'r_COLOR_F':'COLOR_F','r_COLOR_U8':'COLOR_U8',
                   'r_FLOAT2':'FLOAT2','r_FLOAT3':'FLOAT3','r_FLOAT4':'FLOAT4'}
    for fn, rkind, args in functions:
        dx_name = to_dx_name(fn)
        group = guess_group(fn)
        hs.append('%index')
        hs.append(dx_name)
        hs.append(f'DxLib {fn} (自動生成、hsp3dx 専用)')
        hs.append('%group')
        hs.append(group)
        hs.append('%prm')
        p_idx = 1
        if rkind != 'r_int':
            hs.append(f'p{p_idx} : var (戻り値 {R_CTYPE_MAP[rkind]} 出力)')
            p_idx += 1
        if args:
            for idx, (t, aname, default) in enumerate(args):
                d = f' (default {default})' if default else ''
                hs.append(f'p{p_idx} : {type_label(t)} {aname}{d}')
                p_idx += 1
        elif rkind == 'r_int':
            hs.append('(引数なし)')
        hs.append('%inst')
        hs.append(f'DxLib の {fn}() を呼び出します。')
        hs.append(f'^p')
        def ctype_of(t):
            if t in KIND_TO_CTYPE: return KIND_TO_CTYPE[t]
            if t in OUT_CTYPE:     return OUT_CTYPE[t] + ' *'
            return t
        ret_c = R_CTYPE_MAP[rkind]
        hs.append(f'元関数シグネチャ: {ret_c} {fn}({", ".join(f"{ctype_of(t)} {aname}" for t, aname, _ in args) or "void"})')
        hs.append(f'^p')
        if rkind == 'r_int':
            hs.append(f'戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。')
        else:
            hs.append(f'戻り値は第 1 引数に指定した変数に書き戻されます。')
        hs.append(f'^p')
        hs.append(f'詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の {fn} 項を参照。')
        hs.append('')
    with open(OUT_HS, 'w', encoding='utf-8', newline='\n') as f:
        f.write('\n'.join(hs))

    print(f'generated:')
    print(f'  {OUT_AS}     ({len(functions)} #cmd entries)')
    print(f'  {OUT_CPP}    ({len(functions)} case handlers)')
    print(f'  {OUT_HS}     ({len(functions)} %index entries)')
    print(f'  {OUT_AS_F}   ({len(f_functions)} #ccmd entries)')
    print(f'  {OUT_CPP_F}  ({len(f_functions)} case handlers)')


if __name__ == '__main__':
    main()
