#!/usr/bin/env python3
"""
DxDLLW.cs -> hspdxlib.as / hspdxlib_const.as / hspdxlib_struct.as / hspdxlib.hs generator
Parses the C# P/Invoke wrapper to generate HSP header and help files for DxLibW.
"""
import re
import sys
import os
from collections import OrderedDict

# ---- Configuration ----
INPUT_CS = None
OUTPUT_DIR = None

# ---- Type mapping: C# type -> HSP #func/#cfunc param type ----
TYPE_MAP = {
    'int': 'int',
    'uint': 'int',
    'long': 'int',
    'ulong': 'int',
    'short': 'int',
    'ushort': 'int',
    'byte': 'int',
    'sbyte': 'int',
    'float': 'float',
    'double': 'double',
    'string': 'wstr',
    'System.IntPtr': 'int',
    'IntPtr': 'int',
    'bool': 'int',
}

SIMPLE_RETURN_TYPES = {'int', 'uint', 'float', 'double', 'long', 'ulong', 'short',
                       'ushort', 'byte', 'sbyte', 'void', 'bool', 'System.IntPtr', 'IntPtr'}

STRUCT_NAMES = set()
STRUCT_SIZES = {}  # struct name -> size in bytes (filled during parsing)
DLL_ENTRY_POINTS = set()  # set of entry point names from DllImport("DxLibW.dll")

# Mapping from C# struct name -> (#defstruct name, size, [(type, field_name), ...])
# Used for generating #defstruct blocks and #cfuncst with struct names
KNOWN_DEFSTRUCTS = {
    'VECTOR':   ('VECTOR',   12, [('float', 'x'), ('float', 'y'), ('float', 'z')]),
    'VECTOR_D': ('VECTOR_D', 24, [('double', 'x'), ('double', 'y'), ('double', 'z')]),
    'MATRIX':   ('MATRIX',   64, [('float', 'm00'), ('float', 'm01'), ('float', 'm02'), ('float', 'm03'),
                                   ('float', 'm10'), ('float', 'm11'), ('float', 'm12'), ('float', 'm13'),
                                   ('float', 'm20'), ('float', 'm21'), ('float', 'm22'), ('float', 'm23'),
                                   ('float', 'm30'), ('float', 'm31'), ('float', 'm32'), ('float', 'm33')]),
    'COLOR_F':  ('COLOR_F',  16, [('float', 'r'), ('float', 'g'), ('float', 'b'), ('float', 'a')]),
    'FLOAT4':   ('FLOAT4',   16, [('float', 'x'), ('float', 'y'), ('float', 'z'), ('float', 'w')]),
    'DOUBLE4':  ('DOUBLE4',  32, [('double', 'x'), ('double', 'y'), ('double', 'z'), ('double', 'w')]),
}


def parse_constants(lines):
    results = []
    for line in lines:
        m = re.match(r'\s*public\s+const\s+(\w+)\s+(\w+)\s*=\s*(.+?)\s*;', line)
        if m:
            ctype, name, value = m.groups()
            value = value.strip()
            um = re.match(r'unchecked\s*\(\s*\(int\)\s*(0x[\da-fA-F]+)\s*\)', value)
            if um:
                value = um.group(1)
            results.append((name, value, ctype))
    return results


def parse_structs(lines):
    results = []
    i = 0
    while i < len(lines):
        if '[StructLayout' in lines[i]:
            layout_line = lines[i].strip()
            layout = 'Sequential'
            if 'LayoutKind.Explicit' in layout_line:
                layout = 'Explicit'

            i += 1
            m = re.match(r'\s*public\s+struct\s+(\w+)', lines[i])
            if m:
                struct_name = m.group(1)
                STRUCT_NAMES.add(struct_name)
                fields = []
                i += 1
                while i < len(lines):
                    line = lines[i].strip()
                    if line in ('}', '};'):
                        break
                    fm = re.match(r'\[FieldOffset\((\d+)\)\]\s*public\s+(\w+)\s+(\w+)\s*;', line)
                    if fm:
                        offset, ftype, fname = fm.groups()
                        fields.append((ftype, fname, int(offset)))
                    else:
                        fm2 = re.match(r'public\s+(\w+)\s+(\w+)\s*;', line)
                        if fm2:
                            ftype, fname = fm2.groups()
                            fields.append((ftype, fname, -1))
                    i += 1
                # Compute struct size
                total_size = 0
                for ftype, fname, offset in fields:
                    fsize = get_field_size(ftype)
                    if offset >= 0:
                        total_size = max(total_size, offset + fsize)
                    else:
                        total_size += fsize
                STRUCT_SIZES[struct_name] = total_size
                results.append((struct_name, fields, layout))
        i += 1
    return results


def collect_entry_points(lines):
    """Collect all entry points from DxLibW.dll DllImport declarations."""
    for line in lines:
        m = re.search(r'\[DllImport\("DxLibW\.dll".*?EntryPoint\s*=\s*"(\w+)"', line)
        if m:
            DLL_ENTRY_POINTS.add(m.group(1))


def parse_public_methods(lines):
    """Parse public static method signatures, filtering to real DLL functions only."""
    results = []
    seen = {}
    i = 0
    while i < len(lines):
        line = lines[i].strip()
        pm = re.match(r'public\s+static\s+(.+?)\s+(\w+)\s*\((.*?)\)\s*$', line)
        if pm:
            ret_type = pm.group(1).strip()
            method_name = pm.group(2).strip()
            params_str = pm.group(3).strip()

            # Skip internal names
            if method_name.startswith('dx_') or method_name.endswith('_x86') or method_name.endswith('_x64'):
                i += 1
                continue

            # Skip WithStrLen variants
            if 'WithStrLen' in method_name:
                i += 1
                continue

            # Check if this has a DLL entry point
            entry_point = f'dx_{method_name}'
            has_dll = entry_point in DLL_ENTRY_POINTS

            # Check if return type is simple (not struct)
            is_simple_return = ret_type in SIMPLE_RETURN_TYPES

            # Check if it's a struct return
            is_struct_return = ret_type in STRUCT_NAMES

            params = parse_params(params_str)

            if method_name not in seen:
                seen[method_name] = 0
            overload_idx = seen[method_name]
            seen[method_name] += 1

            results.append({
                'name': method_name,
                'ret_type': ret_type,
                'params': params,
                'overload_idx': overload_idx,
                'has_dll': has_dll,
                'is_simple_return': is_simple_return,
                'is_struct_return': is_struct_return,
                'entry_point': entry_point,
            })
        i += 1
    return results


def parse_params(params_str):
    if not params_str.strip():
        return []
    params = []
    for p in split_params(params_str):
        p = p.strip()
        if not p:
            continue
        is_out = False
        is_ref = False
        if p.startswith('out '):
            is_out = True
            p = p[4:].strip()
        elif p.startswith('ref '):
            is_ref = True
            p = p[4:].strip()

        p = p.replace('*', '').strip()

        parts = p.rsplit(None, 1)
        if len(parts) == 2:
            ptype, pname = parts
        else:
            ptype = parts[0]
            pname = 'param'
        params.append({
            'type': ptype.strip(),
            'name': pname.strip(),
            'is_out': is_out,
            'is_ref': is_ref,
        })
    return params


def split_params(s):
    depth = 0
    parts = []
    current = []
    for c in s:
        if c == '<':
            depth += 1
        elif c == '>':
            depth -= 1
        elif c == ',' and depth == 0:
            parts.append(''.join(current))
            current = []
            continue
        current.append(c)
    if current:
        parts.append(''.join(current))
    return parts


def csharp_type_to_hsp(ctype, is_out=False, is_ref=False):
    if is_out or is_ref:
        return 'var'
    ctype = ctype.strip()
    if ctype.endswith('[]'):
        return 'var'
    if ctype in TYPE_MAP:
        return TYPE_MAP[ctype]
    if ctype in STRUCT_NAMES:
        # 値渡しの構造体: #defstruct が定義されていれば構造体名 (svalN) を出力。
        # 定義がない場合のみ var フォールバック (旧挙動。ABI として正しくないが他に手段がない)。
        if ctype in KNOWN_DEFSTRUCTS:
            return ctype
        return 'var'
    if '*' in ctype or 'IntPtr' in ctype:
        return 'int'
    return 'int'


def is_error_code_function(name, method_info):
    """Determine if a function's int return is just an error code (use #func)
    vs a meaningful value (use #cfunc)."""
    # Functions that clearly return meaningful values → #cfunc
    meaningful_prefixes = (
        'Get', 'Check', 'Load', 'Create', 'Make', 'Duplicate',
        'Search', 'Find', 'Count', 'Is', 'Read',
    )
    for prefix in meaningful_prefixes:
        if name.startswith(prefix):
            return False

    # Functions that return handles
    if 'Handle' in name and ('Create' in name or 'Add' in name or 'Load' in name):
        return False

    # Functions that clearly return error codes → #func
    errorcode_prefixes = (
        'Set', 'Draw', 'Delete', 'Init', 'Play', 'Stop',
        'Change', 'Clear', 'Reset', 'Add', 'Remove', 'Update',
        'Save', 'Write', 'Close', 'Open', 'Setup', 'Refresh',
        'Insert', 'Sub', 'Blt', 'Paint',
    )
    for prefix in errorcode_prefixes:
        if name.startswith(prefix):
            return True

    # MV1Set*, MV1Detach*, etc. are error codes
    if name.startswith('MV1') and any(name[3:].startswith(p) for p in ('Set', 'Detach', 'Delete', 'Setup', 'Reset', 'Rebuild')):
        return True

    # Special cases
    if name in ('DxLib_Init', 'DxLib_End', 'ProcessMessage', 'ScreenFlip',
                'WaitTimer', 'WaitKey', 'WaitVSync', 'SRand'):
        return True

    return False


def choose_directive(name, ret_type, method_info):
    """Choose the appropriate HSP directive for a DLL function."""
    if ret_type == 'void':
        return '#func'
    if ret_type == 'float':
        return '#cfuncf'
    if ret_type == 'double':
        return '#cfuncd'
    if ret_type in ('int', 'uint', 'long', 'ulong', 'short', 'ushort', 'byte', 'sbyte',
                     'bool', 'System.IntPtr', 'IntPtr'):
        if is_error_code_function(name, method_info):
            return '#func'
        return '#cfunc'
    # Default
    return '#cfunc'


def generate_as_header(methods):
    """Generate hspdxlib.as - only for functions with DLL entry points and simple returns."""
    lines = []
    lines.append(';')
    lines.append('; hspdxlib.as - DxLibW header for HSP')
    lines.append('; Auto-generated from DxDLLW.cs (DxLib 3.24f)')
    lines.append('; Unicode (Wide) version - 32bit/64bit auto-detect')
    lines.append(';')
    lines.append('')
    lines.append('#ifdef __hsp30__')
    lines.append('#ifndef __HSPDXLIB__')
    lines.append('#define global __HSPDXLIB__')
    lines.append('')
    lines.append('#include "hspdxlib_const.as"')
    lines.append('#include "hspdxlib_struct.as"')
    lines.append('')

    # --- #defstruct blocks for known structs ---
    lines.append('; === Struct definitions (#defstruct) ===')
    for cs_name, (ds_name, ds_size, ds_fields) in KNOWN_DEFSTRUCTS.items():
        lines.append(f'#defstruct {ds_name}')
        for ftype, fname in ds_fields:
            lines.append(f'#field {ftype} {fname}')
        lines.append('#endstruct')
        lines.append('')
    lines.append('')

    lines.append('; --- DLL selection (32bit / 64bit) ---')
    lines.append('#ifdef __hsp64__')
    lines.append('#uselib "DxLibW_x64.dll"')
    lines.append('#else')
    lines.append('#uselib "DxLibW.dll"')
    lines.append('#endif')
    lines.append('')

    # Categorize for output
    categories = categorize_methods(methods)

    seen_names = set()
    total = 0

    for cat_name in ['システム', 'ウィンドウ', 'グラフィック描画', '画像管理',
                      '文字描画', 'フォント', '入力', 'サウンド',
                      '3Dモデル', '3Dカメラ', '3Dライト', '3D数学',
                      '通信', 'ファイル', 'その他']:
        cat_methods = categories.get(cat_name, [])
        if not cat_methods:
            continue

        lines.append(f'\t; === {cat_name} ===')
        for m in cat_methods:
            name = m['name']
            overload_idx = m['overload_idx']
            has_dll = m['has_dll']
            is_simple_return = m['is_simple_return']
            is_struct_return = m['is_struct_return']
            ret_type = m['ret_type']
            params = m['params']
            entry_point = m['entry_point']

            if not has_dll:
                continue

            # Build HSP name (add suffix for overloads)
            hsp_name = f'{name}_{overload_idx}' if overload_idx > 0 else name

            if hsp_name in seen_names:
                continue
            seen_names.add(hsp_name)

            # Build parameter type list
            hsp_params = []
            for p in params:
                hsp_t = csharp_type_to_hsp(p['type'], p['is_out'], p['is_ref'])
                hsp_params.append(hsp_t)
            param_str = ', '.join(hsp_params) if hsp_params else ''

            if is_struct_return:
                # Struct return: use #cfuncst
                # If the return type has a known #defstruct, use struct name syntax
                # Otherwise fall back to size syntax
                sret_size = STRUCT_SIZES.get(ret_type, 0)
                if sret_size > 0 and sret_size <= 4096:
                    if ret_type in KNOWN_DEFSTRUCTS:
                        ds_name = KNOWN_DEFSTRUCTS[ret_type][0]
                        if param_str:
                            lines.append(f'\t#cfuncst global {ds_name} {hsp_name} "{entry_point}" {param_str}')
                        else:
                            lines.append(f'\t#cfuncst global {ds_name} {hsp_name} "{entry_point}"')
                    else:
                        if param_str:
                            lines.append(f'\t#cfuncst global {hsp_name} "{entry_point}" {sret_size}, {param_str}')
                        else:
                            lines.append(f'\t#cfuncst global {hsp_name} "{entry_point}" {sret_size}')
                else:
                    # Unknown or too large struct - keep as comment
                    if param_str:
                        lines.append(f'\t; (struct too large: {sret_size}) #cfuncst global {hsp_name} "{entry_point}" {sret_size}, {param_str}')
                    else:
                        lines.append(f'\t; (struct too large: {sret_size}) #cfuncst global {hsp_name} "{entry_point}" {sret_size}')
                total += 1
                continue

            # Determine directive: #func / #cfunc / #cfuncf / #cfuncd
            directive = choose_directive(name, ret_type, m)

            if param_str:
                lines.append(f'\t{directive} global {hsp_name} "{entry_point}" {param_str}')
            else:
                lines.append(f'\t{directive} global {hsp_name} "{entry_point}"')
            total += 1
        lines.append('')

    lines.append(f'\t; Total: {total} functions exported')
    lines.append('')
    lines.append('#endif ; __HSPDXLIB__')
    lines.append('#endif ; __hsp30__')
    lines.append('')
    return '\n'.join(lines)


def generate_const_as(consts):
    lines = []
    lines.append(';')
    lines.append('; hspdxlib_const.as - DxLib constants for HSP')
    lines.append('; Auto-generated from DxDLLW.cs (DxLib 3.24f)')
    lines.append(';')
    lines.append('')
    lines.append('#ifndef __HSPDXLIB_CONST__')
    lines.append('#define global __HSPDXLIB_CONST__')
    lines.append('')

    # ハードコード定数 (DxDLLW.cs にも同名定義があるが値が誤っているケースがあるため、
    # こちらが正となる値を先に出力する)
    HARDCODED_CONSTS = [
        ('DX_SCREEN_FRONT', '$fffffffe'),    # -2
        ('DX_SCREEN_BACK',  '$fffffffc'),    # -4
        ('DX_SCREEN_WORK',  '$fffffffa'),    # -6
    ]
    lines.append('; --- Screen handles ---')
    for name, value in HARDCODED_CONSTS:
        lines.append(f'#define global {name} {value}')
    lines.append('')

    # 重複定義防止: ハードコード済み + 後続の定数群で同じ名前を 1 度だけ出力する
    seen = set(name for name, _ in HARDCODED_CONSTS)

    groups = OrderedDict()
    for name, value, ctype in consts:
        if name in seen:
            continue
        seen.add(name)
        parts = name.split('_')
        if len(parts) >= 3:
            group = '_'.join(parts[:3])
        elif len(parts) >= 2:
            group = '_'.join(parts[:2])
        else:
            group = 'OTHER'
        if group not in groups:
            groups[group] = []
        groups[group].append((name, value))

    for group_name, items in groups.items():
        lines.append(f'; --- {group_name} ---')
        for name, value in items:
            lines.append(f'#const global {name} {value}')
        lines.append('')

    lines.append('#endif ; __HSPDXLIB_CONST__')
    lines.append('')
    return '\n'.join(lines)


def generate_struct_as(struct_list):
    lines = []
    lines.append(';')
    lines.append('; hspdxlib_struct.as - DxLib struct offset constants for HSP')
    lines.append('; Auto-generated from DxDLLW.cs (DxLib 3.24f)')
    lines.append(';')
    lines.append('; このファイルは互換性のために残されています。')
    lines.append('; 構造体メンバアクセスは hspdxlib.as の #defstruct + stdim を使うのが推奨です:')
    lines.append(';')
    lines.append(';   stdim v, VECTOR        ; HSPVAR_FLAG_NSTRUCT として確保')
    lines.append(';   v->x = 1.0             ; #field によるメンバアクセス')
    lines.append(';   v = GetCameraTarget()  ; cfuncst 戻り値が直接 NSTRUCT として代入される')
    lines.append(';')
    lines.append('; 旧式 (offset 定数 + lpoke/dupptr) も引き続き使用可能:')
    lines.append(';   sdim buf, VECTOR_SIZE')
    lines.append(';   lpoke buf, VECTOR_x, 100')
    lines.append(';')
    lines.append('')
    lines.append('#ifndef __HSPDXLIB_STRUCT__')
    lines.append('#define global __HSPDXLIB_STRUCT__')
    lines.append('')

    for struct_name, fields, layout in struct_list:
        if not fields:
            continue

        total_size = 0
        for ftype, fname, offset in fields:
            fsize = get_field_size(ftype)
            if offset >= 0:
                total_size = max(total_size, offset + fsize)
            else:
                total_size += fsize

        lines.append(f'; --- {struct_name} (size={total_size}, layout={layout}) ---')
        lines.append(f'#const global {struct_name}_SIZE {total_size}')

        current_offset = 0
        for ftype, fname, offset in fields:
            fsize = get_field_size(ftype)
            actual_offset = offset if offset >= 0 else current_offset
            if offset < 0:
                current_offset += fsize
            type_comment = ftype
            lines.append(f'#const global {struct_name}_{fname} {actual_offset}\t; {type_comment}')
        lines.append('')

    lines.append('#endif ; __HSPDXLIB_STRUCT__')
    lines.append('')
    return '\n'.join(lines)


def get_field_size(ftype):
    sizes = {
        'double': 8, 'long': 8, 'ulong': 8,
        'int': 4, 'uint': 4, 'float': 4,
        'short': 2, 'ushort': 2,
        'byte': 1, 'sbyte': 1,
    }
    return sizes.get(ftype, 4)


# C# プリミティブ型 → HSP #field 型キーワードのマップ
CS_TO_HSP_FIELD_TYPE = {
    'int':    'int',
    'uint':   'int',
    'long':   'int64',
    'ulong':  'int64',
    'short':  'short',
    'ushort': 'short',
    'byte':   'byte',
    'sbyte':  'byte',
    'float':  'float',
    'double': 'double',
    'bool':   'bool',
    'IntPtr': 'ptr',
    'UIntPtr':'ptr',
}


def auto_populate_known_defstructs(struct_list):
    """parse_structs() の結果から KNOWN_DEFSTRUCTS を自動生成する。

    フィールド型がすべて HSP プリミティブにマップできる構造体のみ追加する
    (ネスト構造体や配列などの複雑なフィールドはスキップ)。
    手動定義済みの KNOWN_DEFSTRUCTS エントリは上書きしない。
    """
    added = 0
    for struct_name, fields, layout in struct_list:
        if struct_name in KNOWN_DEFSTRUCTS:
            continue
        # 全フィールドを HSP 型に変換できるか確認
        hsp_fields = []
        ok = True
        for ftype, fname, offset in fields:
            if ftype not in CS_TO_HSP_FIELD_TYPE:
                ok = False
                break
            hsp_fields.append((CS_TO_HSP_FIELD_TYPE[ftype], fname))
        if not ok or not hsp_fields:
            continue
        size = STRUCT_SIZES.get(struct_name, 0)
        if size <= 0:
            continue
        KNOWN_DEFSTRUCTS[struct_name] = (struct_name, size, hsp_fields)
        added += 1
    return added


def generate_macro_as(methods):
    lines = []
    lines.append(';')
    lines.append('; hspdxlib_macro.as - HSP-friendly convenience macros for DxLib')
    lines.append('; Auto-generated from DxDLLW.cs (DxLib 3.24f)')
    lines.append(';')
    lines.append('; Usage: #include "hspdxlib.as"')
    lines.append(';        #include "hspdxlib_macro.as"')
    lines.append(';')
    lines.append('')
    lines.append('#ifndef __HSPDXLIB_MACRO__')
    lines.append('#define global __HSPDXLIB_MACRO__')
    lines.append('')

    aliases = [
        ('dxinit',      'DxLib_Init',       'DXライブラリの初期化'),
        ('dxend',       'DxLib_End',        'DXライブラリの終了処理'),
        ('dxmsg',       'ProcessMessage',   'メッセージ処理'),
        ('dxflip',      'ScreenFlip',       '画面フリップ'),
        ('dxcls',       'ClearDrawScreen',  '描画画面クリア'),
        ('dxscreen',    'SetDrawScreen',    '描画先設定'),
        ('dxwait',      'WaitTimer',        'ウェイト'),
        ('dxdraw',      'DrawGraph',        '画像描画'),
        ('dxdrawex',    'DrawExtendGraph',  '画像拡大縮小描画'),
        ('dxdrawrota',  'DrawRotaGraph',    '画像回転描画'),
        ('dxload',      'LoadGraph',        '画像読込'),
        ('dxdel',       'DeleteGraph',      '画像解放'),	# dxfree は DxFree() と case-insensitive で衝突するため dxdel に変更
        ('dxcolor',     'GetColor',         '色コード取得'),
        ('dxtitle',     'SetMainWindowText','タイトル設定'),
        ('dxwindow',    'ChangeWindowMode', 'ウィンドウモード変更'),
        ('dxmode',      'SetGraphMode',     '画面モード設定'),
        ('dxkey',       'CheckHitKey',      'キー入力チェック'),
        ('dxmouse',     'GetMousePoint',    'マウス座標取得'),
        ('dxclick',     'GetMouseInput',    'マウスボタン取得'),
        ('dxloadsnd',   'LoadSoundMem',     '音声読込'),
        ('dxplaysnd',   'PlaySoundMem',     '音声再生'),
        ('dxstopsnd',   'StopSoundMem',     '音声停止'),
        ('dxfreesnd',   'DeleteSoundMem',   '音声解放'),
        ('dxfontsize',  'SetFontSize',      'フォントサイズ設定'),
        ('dxbox',       'DrawBox',          '矩形描画'),
        ('dxline',      'DrawLine',         '線描画'),
        ('dxcircle',    'DrawCircle',       '円描画'),
        ('dxpset',      'DrawPixel',        '点描画'),
        ('dxbgcolor',   'SetBackgroundColor','背景色設定'),
        ('dxblend',     'SetDrawBlendMode', 'ブレンドモード設定'),
        ('dxpad',       'GetJoypadInputState','パッド入力取得'),
    ]

    method_names = {m['name'] for m in methods if m['has_dll']}

    lines.append('; --- HSP-friendly short aliases ---')
    for alias, orig, desc in aliases:
        if orig in method_names:
            lines.append(f'#define global {alias} {orig}\t; {desc}')
    lines.append('')

    lines.append('; --- Vector helper macros ---')
    lines.append('; VGet: Create a VECTOR in a buffer')
    lines.append('; Usage: dxvec buf, 1.0, 2.0, 3.0')
    lines.append('#define global dxvec(%1,%2,%3,%4) sdim %1, VECTOR_SIZE : memcpy_f %1, VECTOR_x, %2 : memcpy_f %1, VECTOR_y, %3 : memcpy_f %1, VECTOR_z, %4')
    lines.append('')

    lines.append('; --- Convenience initialization ---')
    lines.append('; dxinit_window: Initialize with window mode')
    lines.append('; Usage: dxinit_window "My Game", 800, 600')
    lines.append('#define global dxinit_window(%1,%2,%3) ChangeWindowMode TRUE : SetGraphMode %2, %3, 32 : SetMainWindowText %1 : DxLib_Init : SetDrawScreen DX_SCREEN_BACK')
    lines.append('')

    lines.append('; --- Main loop helpers ---')
    lines.append('; Usage:')
    lines.append(';   dxinit_window "Test", 640, 480')
    lines.append(';   *main')
    lines.append(';   ClearDrawScreen')
    lines.append(';   ; ... draw ...')
    lines.append(';   ScreenFlip')
    lines.append(';   if ProcessMessage() == 0 : goto *main')
    lines.append(';   DxLib_End')
    lines.append('')

    lines.append('#endif ; __HSPDXLIB_MACRO__')
    lines.append('')
    return '\n'.join(lines)


def generate_hs_help(methods, consts, struct_list, descriptions, dxlib_docs=None):
    """Generate .hs help file using DxLib official documentation when available."""
    if dxlib_docs is None:
        dxlib_docs = {}

    lines = []
    lines.append(';')
    lines.append('; hspdxlib.hs - DxLib help for HSP')
    lines.append('; Auto-generated from DxDLLW.cs + DxLib help (DxLib 3.24f)')
    lines.append(';')
    lines.append('')
    lines.append('%dll')
    lines.append('DxLibW')
    lines.append('%ver')
    lines.append('3.24f')
    lines.append('%date')
    lines.append('2026/04/12')
    lines.append('%author')
    lines.append('DxLib: Takumi Yamada / HSP binding: IronHSP Project')
    lines.append('%url')
    lines.append('https://dxlib.xsrv.jp/')
    lines.append('%note')
    lines.append('hspdxlib.as をインクルードして使用')
    lines.append('%type')
    lines.append('DxLib ゲームライブラリ')
    lines.append('%port')
    lines.append('Win')
    lines.append('')

    categories = categorize_methods(methods)
    doc_used = 0

    # Build overload map: base_name -> [method, method_1, method_2, ...]
    overload_map = {}
    all_func_names = set()
    for m in methods:
        if not m['has_dll']:
            continue
        base = m['name']
        all_func_names.add(base)
        if m['overload_idx'] > 0:
            all_func_names.add(f'{base}_{m["overload_idx"]}')
        if base not in overload_map:
            overload_map[base] = []
        overload_map[base].append(m)

    seen = set()
    cat_order = ['システム', 'ウィンドウ', 'グラフィック描画', '画像管理',
                  '文字描画', 'フォント', '入力', 'サウンド',
                  '3Dモデル', '3Dカメラ', '3Dライト', '3D数学',
                  '通信', 'ファイル', 'その他']

    for cat_name in cat_order:
        cat_methods = categories.get(cat_name, [])
        if not cat_methods:
            continue

        for m in cat_methods:
            name = m['name']
            if name in seen:
                continue
            if not m['has_dll']:
                continue
            if m['overload_idx'] > 0:
                continue
            seen.add(name)

            doc = dxlib_docs.get(name, {})
            has_doc = bool(doc.get('summary') or doc.get('description'))
            if has_doc:
                doc_used += 1

            summary = doc.get('summary', '') or descriptions.get(name, f'{name} を実行する')
            ret_type = m['ret_type']
            params = m['params']
            directive = choose_directive(name, ret_type, m)
            is_func_style = (directive in ('#cfunc', '#cfuncf', '#cfuncd', '#cfuncst'))

            # --- Emit main entry ---
            emit_hs_entry(lines, name, summary, cat_name, params, m, doc,
                          descriptions, is_func_style, directive,
                          all_func_names=all_func_names)

            # --- Emit overload entries ---
            overloads = overload_map.get(name, [])
            for om in overloads:
                if om['overload_idx'] == 0:
                    continue
                oidx = om['overload_idx']
                oname = f'{name}_{oidx}'
                oparams = om['params']
                # Build overload description
                base_param_count = len(params)
                extra_params = oparams[base_param_count:]
                extra_desc = ''
                if extra_params:
                    extras = ', '.join(p['name'] for p in extra_params)
                    extra_desc = f'{name} の拡張版です。追加パラメータ: {extras}'
                else:
                    extra_desc = f'{name} のオーバーロードです。'

                o_directive = choose_directive(name, om['ret_type'], om)
                o_is_func = (o_directive in ('#cfunc', '#cfuncf', '#cfuncd', '#cfuncst'))

                emit_hs_entry(lines, oname, f'{summary}（拡張版）', cat_name,
                              oparams, om, doc, descriptions, o_is_func, o_directive,
                              overload_base=name, overload_extra_desc=extra_desc,
                              all_func_names=all_func_names)

    print(f'  DxLib docs used: {doc_used} / {len(seen)} functions')
    return '\n'.join(lines)


def auto_detect_related(name, all_names):
    """Auto-detect related functions by naming pattern."""
    related = []
    name_set = set(all_names)

    # 1. D suffix variant (double precision)
    if name.endswith('D') and name[:-1] in name_set:
        related.append(name[:-1])
    elif name + 'D' in name_set:
        related.append(name + 'D')

    # 2. F suffix variant (float coordinates)
    if name.endswith('F') and name[:-1] in name_set:
        related.append(name[:-1])
    elif name + 'F' in name_set:
        related.append(name + 'F')

    # 3. AA variant (anti-aliased)
    if name.endswith('AA') and name[:-2] in name_set:
        related.append(name[:-2])
    elif name + 'AA' in name_set:
        related.append(name + 'AA')

    # 4. Set/Get pair
    if name.startswith('Set') and 'Get' + name[3:] in name_set:
        related.append('Get' + name[3:])
    elif name.startswith('Get') and 'Set' + name[3:] in name_set:
        related.append('Set' + name[3:])

    # 5. Load/Delete/Init trio
    if name.startswith('Load') and 'Graph' in name:
        for prefix in ['Delete', 'Init']:
            candidate = prefix + 'Graph'
            if candidate in name_set:
                related.append(candidate)
    if name.startswith('Load') and 'SoundMem' in name:
        for other in ['PlaySoundMem', 'StopSoundMem', 'DeleteSoundMem']:
            if other in name_set and other != name:
                related.append(other)
    if name.startswith('Load') and 'Model' in name:
        for other in ['MV1DrawModel', 'MV1DeleteModel']:
            if other in name_set and other != name:
                related.append(other)

    # 6. Create/Delete pair
    if name.startswith('Create') and name.replace('Create', 'Delete', 1) in name_set:
        related.append(name.replace('Create', 'Delete', 1))
    elif name.startswith('Delete') and name.replace('Delete', 'Create', 1) in name_set:
        related.append(name.replace('Delete', 'Create', 1))

    # 7. ToHandle variant
    if 'ToHandle' not in name:
        candidate = name + 'ToHandle'
        if candidate in name_set:
            related.append(candidate)
    else:
        base = name.replace('ToHandle', '')
        if base in name_set:
            related.append(base)

    # 8. MV1 related: Set/Get pairs within MV1
    if name.startswith('MV1Set'):
        getter = 'MV1Get' + name[6:]
        if getter in name_set:
            related.append(getter)
    elif name.startswith('MV1Get'):
        setter = 'MV1Set' + name[6:]
        if setter in name_set:
            related.append(setter)

    # 9. DrawString / DrawFormatString family
    if 'DrawString' in name or 'DrawFormatString' in name:
        for sibling in ['DrawString', 'DrawFormatString', 'DrawStringToHandle', 'DrawFormatStringToHandle']:
            if sibling in name_set and sibling != name:
                related.append(sibling)

    # 10. Camera related
    if 'Camera' in name:
        for sibling in ['SetCameraNearFar', 'SetCameraPositionAndTarget_UpVecY', 'GetCameraPosition', 'GetCameraTarget']:
            if sibling in name_set and sibling != name and sibling not in related:
                related.append(sibling)

    # 11. Light related
    if 'Light' in name and 'Handle' not in name:
        for sibling in ['SetLightDirection', 'SetLightDifColor', 'SetLightSpcColor', 'SetLightAmbColor', 'SetLightEnable']:
            if sibling in name_set and sibling != name and sibling not in related:
                related.append(sibling)

    # 12. Draw shape family
    shape_family = ['DrawLine', 'DrawBox', 'DrawCircle', 'DrawOval', 'DrawTriangle', 'DrawPixel', 'DrawRoundRect']
    if name in shape_family:
        for sibling in shape_family:
            if sibling in name_set and sibling != name and sibling not in related:
                related.append(sibling)

    # 13. Draw image family
    image_family = ['DrawGraph', 'DrawExtendGraph', 'DrawRotaGraph', 'DrawRotaGraph2', 'DrawRotaGraph3',
                    'DrawModiGraph', 'DrawTurnGraph']
    if name in image_family:
        for sibling in image_family:
            if sibling in name_set and sibling != name and sibling not in related:
                related.append(sibling)

    # 14. Vector math
    vec_family = ['VGet', 'VAdd', 'VSub', 'VDot', 'VCross', 'VScale', 'VSize', 'VSquareSize', 'VNorm', 'VTransform']
    if name in vec_family:
        for sibling in vec_family:
            if sibling in name_set and sibling != name and sibling not in related:
                related.append(sibling)

    # 15. Sound family
    if 'SoundMem' in name:
        for sibling in ['LoadSoundMem', 'PlaySoundMem', 'StopSoundMem', 'DeleteSoundMem',
                        'CheckSoundMem', 'SetVolumeSoundMem', 'InitSoundMem']:
            if sibling in name_set and sibling != name and sibling not in related:
                related.append(sibling)

    # 16. Joypad family
    if 'Joypad' in name or 'JoyPad' in name:
        for sibling in ['GetJoypadInputState', 'GetJoypadNum', 'GetJoypadAnalogInput', 'SetJoypadDeadZone']:
            if sibling in name_set and sibling != name and sibling not in related:
                related.append(sibling)

    # 17. XInput family
    if 'XInput' in name:
        for sibling in ['GetXInputState', 'SetXInputVibration']:
            if sibling in name_set and sibling != name and sibling not in related:
                related.append(sibling)

    # 18. Screen family
    if name in ('ScreenFlip', 'ClearDrawScreen', 'SetDrawScreen', 'GetDrawScreen', 'SetBackgroundColor'):
        for sibling in ['ScreenFlip', 'ClearDrawScreen', 'SetDrawScreen', 'GetDrawScreen', 'SetBackgroundColor']:
            if sibling in name_set and sibling != name and sibling not in related:
                related.append(sibling)

    return related


def emit_hs_entry(lines, name, summary, cat_name, params, m, doc,
                   descriptions, is_func_style, directive,
                   overload_base=None, overload_extra_desc=None,
                   all_func_names=None):
    """Emit a single .hs entry for a function."""
    ret_type = m['ret_type']
    doc_params = doc.get('params', '') if not overload_base else ''

    lines.append('%index')
    lines.append(name)
    lines.append(summary)
    lines.append('%group')
    lines.append(f'DxLib {cat_name}')

    # --- %prm section ---
    if params:
        param_names = [p['name'] for p in params]
        lines.append('%prm')

        # Function style (#cfunc etc.) uses (p1, p2) format
        # Command style (#func) uses p1, p2 format
        if is_func_style:
            lines.append(f'({", ".join(param_names)})')
        else:
            lines.append(f'{", ".join(param_names)}')

        # Parameter descriptions
        if doc_params:
            for pline in doc_params.split('\n'):
                pline = pline.strip()
                if pline:
                    lines.append(pline)
        else:
            for p in params:
                ptype = p['type']
                pname = p['name']
                hsp_t = csharp_type_to_hsp(ptype, p['is_out'], p['is_ref'])
                prefix = ''
                if p['is_out']:
                    prefix = '[out] '
                elif p['is_ref']:
                    prefix = '[ref] '
                lines.append(f'{pname} : {prefix}{ptype} ({hsp_t})')

    # --- %inst section ---
    lines.append('%inst')

    # Overload extra description
    if overload_extra_desc:
        lines.append(overload_extra_desc)
        lines.append('^p')

    # Use DxLib official description if available
    desc_text = doc.get('description', '') if not overload_base else ''
    if not desc_text and overload_base:
        # For overloads, reference the base function
        base_doc = descriptions.get(overload_base, '')
        if not base_doc:
            desc_text = summary
    elif not desc_text:
        desc_text = summary

    if desc_text:
        if len(desc_text) > 4000:
            desc_text = desc_text[:4000] + '...'
        for dline in desc_text.split('\n'):
            dline = dline.strip()
            if dline:
                lines.append(dline)
            else:
                lines.append('^p')

    # Return value / struct return info
    doc_returns = doc.get('returns', '') if not overload_base else ''

    if m['is_struct_return']:
        sret_size = STRUCT_SIZES.get(ret_type, 0)
        lines.append('^p')
        if ret_type in KNOWN_DEFSTRUCTS:
            ds_name = KNOWN_DEFSTRUCTS[ret_type][0]
            ds_fields = KNOWN_DEFSTRUCTS[ret_type][2]
            field_names = ', '.join(f[1] for f in ds_fields)
            lines.append(f'※ この関数は #cfuncst ({ds_name}) で宣言されています。')
            lines.append(f'戻り値は構造体 {ds_name} ({sret_size}バイト) です。')
            lines.append(f'^p')
            lines.append(f'代入するだけで自動的に構造体変数が作成されます:')
            lines.append(f'  v = {name}(...)   ; auto dim + copy')
            lines.append(f'代入後はメンバにアクセスできます:')
            for ftype, fname in ds_fields[:3]:
                lines.append(f'  mes v->{fname}')
            if len(ds_fields) > 3:
                lines.append(f'  ...')
        else:
            lines.append(f'※ この関数は #cfuncst で宣言されています。')
            lines.append(f'戻り値は構造体 {ret_type} ({sret_size}バイト) へのポインタです。')
            lines.append(f'dupptr で変数にマッピングして使用してください。')
    elif doc_returns:
        lines.append('^p')
        lines.append('戻り値:')
        for rline in doc_returns.split('\n'):
            rline = rline.strip()
            if rline:
                lines.append(f'  {rline}')
    elif ret_type == 'float':
        lines.append('^p')
        lines.append('戻り値: 実数(float)')
    elif ret_type != 'void' and not is_error_code_function(name.split('_')[0] if '_' in name and name.split('_')[-1].isdigit() else name, m):
        lines.append('^p')
        lines.append(f'戻り値: {ret_type}')

    # 64bit notes - always auto-detect from parameter/return types
    # Check all lines emitted so far for this entry to avoid duplicates
    entry_start = len(lines)
    for i in range(len(lines) - 1, -1, -1):
        if lines[i].startswith('%index'):
            entry_start = i
            break
    entry_text = ' '.join(lines[entry_start:])
    has_64note = '64bit' in entry_text or 'int64' in entry_text
    if not has_64note:
        has_intptr_param = any(p['type'] in ('System.IntPtr', 'IntPtr') for p in params)
        has_intptr_ret = ret_type in ('System.IntPtr', 'IntPtr')
        has_long_ret = ret_type in ('long', 'ulong')

        if has_intptr_param and has_intptr_ret:
            lines.append('^p')
            lines.append('※ この関数はポインタを引数に取り、ポインタを返します。')
            lines.append('64bit環境では引数・戻り値ともに int64 型になります。')
        elif has_intptr_ret:
            lines.append('^p')
            lines.append('※ 64bit環境では戻り値が int64 になります。ポインタサイズの値を返すため、変数は int64 型で受け取ってください。')
        elif has_intptr_param:
            lines.append('^p')
            lines.append('※ ポインタ型 (IntPtr) のパラメータがあります。')
            lines.append('64bit環境では int64 型の値を渡してください。')
        elif has_long_ret:
            lines.append('^p')
            lines.append('※ この関数の戻り値は 64bit整数 (int64) です。32bit環境でも64bit値を返します。')

    # Sample code (main function only)
    if not overload_base:
        sample = get_sample_code(name)
        if sample:
            lines.append('%sample')
            lines.append(sample)

    # %href - related functions (auto-detect + manual)
    href_items = []
    base_name = overload_base or name
    # Strip _N suffix for pattern matching
    clean_name = base_name

    # Manual related
    related = get_related(clean_name)
    if related:
        href_items.extend(related)

    # Auto-detect related functions from all_func_names
    auto_related = auto_detect_related(clean_name, all_func_names or set())
    for r in auto_related:
        if r not in href_items:
            href_items.append(r)

    # For overloads, add base function and sibling overloads
    if overload_base:
        if overload_base not in href_items:
            href_items.insert(0, overload_base)

    # Remove self from href
    href_items = [r for r in href_items if r != name]

    # Limit to reasonable count
    if len(href_items) > 12:
        href_items = href_items[:12]

    if href_items:
        lines.append('%href')
        for r in href_items:
            lines.append(r)

    lines.append('')


def get_sample_code(name):
    samples = {
        'DxLib_Init': '''#include "hspdxlib.as"
ChangeWindowMode TRUE
SetGraphMode 640, 480, 32
DxLib_Init
SetDrawScreen DX_SCREEN_BACK

*main
ClearDrawScreen
DrawString 10, 10, "Hello DxLib!", GetColor(255, 255, 255)
ScreenFlip
if ProcessMessage() == 0 : goto *main
DxLib_End
end''',
        'DrawGraph': '''#include "hspdxlib.as"
; ... DxLib_Init 済み ...
gh = LoadGraph("image.png")
DrawGraph 100, 100, gh, TRUE
ScreenFlip''',
        'LoadGraph': '''#include "hspdxlib.as"
; ... DxLib_Init 済み ...
gh = LoadGraph("player.png")
if gh == -1 {
    ; 読み込み失敗
}''',
        'DrawString': '''DrawString 10, 10, "Hello World!", GetColor(255, 255, 255)
; 縁取り付き
DrawString 10, 30, "Edge!", GetColor(255, 0, 0), GetColor(0, 0, 0)''',
        'DrawBox': '''DrawBox 10, 10, 100, 100, GetColor(255, 0, 0), TRUE  ; 塗りつぶし
DrawBox 10, 10, 100, 100, GetColor(255, 0, 0), FALSE ; 枠のみ''',
        'LoadSoundMem': '''se = LoadSoundMem("sound.wav")
PlaySoundMem se, DX_PLAYTYPE_BACK''',
        'CheckHitKey': '''if CheckHitKey(KEY_INPUT_ESCAPE) == 1 {
    ; ESCキーが押された
}''',
        'GetMousePoint': '''GetMousePoint mx, my
DrawFormatString 0, 0, GetColor(255,255,255), "Mouse: %d, %d", mx, my''',
        'SetDrawBlendMode': '''SetDrawBlendMode DX_BLENDMODE_ALPHA, 128 ; 半透明
DrawGraph 0, 0, gh, TRUE
SetDrawBlendMode DX_BLENDMODE_NOBLEND, 0   ; 通常に戻す''',
        'ChangeWindowMode': '''ChangeWindowMode TRUE   ; ウィンドウモード
; ChangeWindowMode FALSE ; フルスクリーンモード''',
        'SetGraphMode': '''SetGraphMode 1280, 720, 32  ; 1280x720 32bit''',
        'ScreenFlip': '''; ダブルバッファリングの基本パターン
ClearDrawScreen
; ... 描画処理 ...
ScreenFlip''',
        'DrawRotaGraph': '''DrawRotaGraph 320, 240, 1.0, 3.14/4, gh, TRUE
; x, y: 描画中心座標
; 1.0: 拡大率
; 3.14/4: 回転角度(ラジアン)
; gh: グラフィックハンドル
; TRUE: 透過処理あり''',
    }
    return samples.get(name)


def get_related(name):
    relations = {
        'DxLib_Init': ['DxLib_End', 'SetGraphMode', 'ChangeWindowMode'],
        'DxLib_End': ['DxLib_Init'],
        'ProcessMessage': ['WaitTimer', 'ScreenFlip'],
        'DrawGraph': ['LoadGraph', 'DrawExtendGraph', 'DrawRotaGraph', 'DrawTurnGraph'],
        'DrawExtendGraph': ['DrawGraph', 'DrawRotaGraph'],
        'DrawRotaGraph': ['DrawGraph', 'DrawRotaGraph2', 'DrawRotaGraph3'],
        'LoadGraph': ['DeleteGraph', 'LoadDivGraph', 'DrawGraph'],
        'DeleteGraph': ['LoadGraph', 'InitGraph'],
        'DrawString': ['DrawFormatString', 'DrawStringToHandle', 'GetDrawStringWidth'],
        'DrawFormatString': ['DrawString', 'DrawFormatStringToHandle'],
        'LoadSoundMem': ['PlaySoundMem', 'StopSoundMem', 'DeleteSoundMem'],
        'PlaySoundMem': ['LoadSoundMem', 'StopSoundMem', 'CheckSoundMem'],
        'StopSoundMem': ['PlaySoundMem', 'CheckSoundMem'],
        'CheckHitKey': ['GetHitKeyStateAll', 'CheckHitKeyAll'],
        'GetMousePoint': ['GetMouseInput', 'SetMousePoint'],
        'GetMouseInput': ['GetMousePoint', 'GetMouseWheelRotVol'],
        'SetDrawBlendMode': ['SetDrawBright', 'SetDrawArea'],
        'ChangeWindowMode': ['SetGraphMode', 'SetMainWindowText'],
        'SetGraphMode': ['ChangeWindowMode', 'GetScreenState'],
        'ScreenFlip': ['ClearDrawScreen', 'SetDrawScreen'],
        'ClearDrawScreen': ['ScreenFlip', 'SetDrawScreen'],
        'SetDrawScreen': ['ScreenFlip', 'ClearDrawScreen'],
        'DrawBox': ['DrawLine', 'DrawCircle', 'DrawTriangle'],
        'DrawLine': ['DrawBox', 'DrawPixel'],
        'DrawCircle': ['DrawOval', 'DrawBox'],
        'SetFontSize': ['ChangeFont', 'ChangeFontType', 'CreateFontToHandle'],
        'GetColor': ['SetBackgroundColor', 'DrawString'],
        'SetMainWindowText': ['ChangeWindowMode', 'SetGraphMode'],
        'MV1LoadModel': ['MV1DrawModel', 'MV1DeleteModel', 'MV1SetPosition'],
        'MV1DrawModel': ['MV1LoadModel', 'MV1SetPosition', 'MV1SetScale'],
        'GetJoypadInputState': ['GetJoypadNum', 'GetJoypadAnalogInput'],
    }
    return relations.get(name)


def categorize_methods(methods):
    categories = OrderedDict()
    for cat in ['システム', 'ウィンドウ', 'グラフィック描画', '画像管理',
                '文字描画', 'フォント', '入力', 'サウンド',
                '3Dモデル', '3Dカメラ', '3Dライト', '3D数学',
                '通信', 'ファイル', 'その他']:
        categories[cat] = []

    for m in methods:
        name = m['name']

        if name.startswith('DxLib_') or name in ('ProcessMessage', 'WaitTimer', 'WaitKey',
            'GetNowCount', 'GetNowHiPerformanceCount', 'GetDateTime', 'GetRand', 'SRand',
            'SetAlwaysRunFlag', 'SetLogDrawOutFlag', 'SetOutApplicationLogValidFlag',
            'SetWaitVSyncFlag', 'SetUseDXArchiveFlag', 'SetDXArchiveKeyString',
            'GetDxLibVersion', 'SetDoubleStartValidFlag', 'SetUseCharSet'):
            categories['システム'].append(m)
        elif any(x in name for x in ['Window', 'Screen', 'GraphMode', 'ColorBitDepth',
                    'FullScreen', 'Resolution', 'MainWindow']) and 'Draw' not in name:
            categories['ウィンドウ'].append(m)
        elif name.startswith('Draw') and ('String' in name or 'Format' in name or 'Number' in name):
            categories['文字描画'].append(m)
        elif name.startswith('Draw') or name in ('ClearDrawScreen', 'ScreenFlip',
            'SetDrawBlendMode', 'SetDrawBright', 'SetDrawArea', 'GetDrawScreen',
            'SetBackgroundColor', 'Paint', 'GetPixel') or name.startswith('SetDraw') or 'DrawScreen' in name:
            categories['グラフィック描画'].append(m)
        elif any(x in name for x in ['LoadGraph', 'MakeGraph', 'DeleteGraph', 'InitGraph',
                    'GetGraphSize', 'DerivationGraph', 'TransColor', 'SaveDraw', 'GraphScreen',
                    'BlendGraph', 'SetGraph', 'GetGraph', 'CreateGraph', 'ReloadGraph',
                    'SetCreateGraph', 'SetRestoreGraph']):
            categories['画像管理'].append(m)
        elif 'Font' in name or name.startswith('ChangeFont'):
            categories['フォント'].append(m)
        elif any(x in name for x in ['Key', 'Mouse', 'Joypad', 'JoyPad', 'XInput',
                    'Touch', 'Input']) and 'Sound' not in name:
            categories['入力'].append(m)
        elif any(x in name for x in ['Sound', 'Music', 'Beep', 'MIDI']) or \
             (name.startswith('Play') and 'Sound' in name) or \
             (name.startswith('Stop') and 'Sound' in name):
            categories['サウンド'].append(m)
        elif name.startswith('MV1'):
            categories['3Dモデル'].append(m)
        elif name.startswith('SetCamera') or name.startswith('GetCamera'):
            categories['3Dカメラ'].append(m)
        elif name.startswith('SetLight') or name.startswith('GetLight') or \
             name.startswith('CreateLight') or name.startswith('Create') and 'Light' in name or \
             name.startswith('DeleteLight') or name.startswith('ChangeLightType'):
            categories['3Dライト'].append(m)
        elif any(x in name for x in ['VGet', 'VAdd', 'VSub', 'VDot', 'VCross', 'VScale',
                    'VNorm', 'VSize', 'VSquare', 'VTransform', 'MMult', 'MScale', 'MIdent',
                    'CreateIdentity', 'CreateLookAt', 'CreatePerspective', 'QT', 'F2', 'F4', 'D4']):
            categories['3D数学'].append(m)
        elif any(x in name for x in ['Connect', 'NetWork', 'UDP', 'TCP', 'HTTP']):
            categories['通信'].append(m)
        elif 'File' in name or name.startswith('DXArchive'):
            categories['ファイル'].append(m)
        else:
            categories['その他'].append(m)

    return {k: v for k, v in categories.items() if v}


def build_descriptions():
    desc = {
        'DxLib_Init': 'DXライブラリの初期化',
        'DxLib_End': 'DXライブラリの終了処理',
        'DxLib_GlobalStructInitialize': 'DXライブラリのグローバル構造体を初期化',
        'DxLib_IsInit': 'DXライブラリが初期化済みかを取得',
        'ProcessMessage': 'ウィンドウメッセージの処理',
        'WaitTimer': '指定ミリ秒だけ待つ',
        'WaitKey': 'キー入力を待つ',
        'GetNowCount': '現在の時間をミリ秒単位で取得',
        'GetNowHiPerformanceCount': '高精度タイマーの現在値を取得',
        'GetDateTime': '現在の日時を取得',
        'GetRand': '乱数を取得',
        'SRand': '乱数のシードを設定',
        'SetAlwaysRunFlag': '非アクティブ時も処理を続行するか設定',
        'SetLogDrawOutFlag': 'ログ描画の表示/非表示を設定',
        'SetOutApplicationLogValidFlag': 'ログファイル出力の有効/無効を設定',
        'SetWaitVSyncFlag': 'VSyncを待つかどうかを設定',
        'GetDxLibVersion': 'DXライブラリのバージョンを取得',

        'ClearDrawScreen': '描画先画面をクリア',
        'ScreenFlip': '裏画面と表画面を入れ替える',
        'SetDrawScreen': '描画先画面を設定',
        'GetDrawScreen': '現在の描画先画面を取得',
        'SetDrawBlendMode': '描画のブレンドモードを設定',
        'SetDrawBright': '描画の輝度を設定',
        'SetDrawArea': '描画可能範囲を設定',
        'GetColor': '色コードを取得 (R, G, B)',
        'SetBackgroundColor': '背景色を設定',
        'SetDrawMode': '描画モードを設定',
        'DrawGraph': '画像を描画',
        'DrawExtendGraph': '画像を拡大縮小して描画',
        'DrawRotaGraph': '画像を回転して描画',
        'DrawRotaGraph2': '画像を回転して描画 (回転中心指定)',
        'DrawRotaGraph3': '画像を回転して描画 (X/Y拡大率個別指定)',
        'DrawModiGraph': '画像を自由変形して描画',
        'DrawTurnGraph': '画像を左右反転して描画',
        'DrawBox': '矩形を描画',
        'DrawFillBox': '塗りつぶし矩形を描画',
        'DrawLine': '線を描画',
        'DrawCircle': '円を描画',
        'DrawOval': '楕円を描画',
        'DrawTriangle': '三角形を描画',
        'DrawPixel': '点を描画',
        'DrawGraphF': '画像を描画 (float座標)',
        'DrawExtendGraphF': '画像を拡大縮小して描画 (float座標)',
        'DrawRotaGraphF': '画像を回転して描画 (float座標)',
        'GetPixel': '指定座標のピクセル色を取得',
        'Paint': '指定座標から塗りつぶし',

        'LoadGraph': '画像ファイルを読み込みグラフィックハンドルを取得',
        'LoadDivGraph': '画像ファイルを分割して読み込み',
        'DeleteGraph': 'グラフィックハンドルを削除',
        'InitGraph': '全てのグラフィックハンドルを削除',
        'MakeGraph': '空のグラフィックハンドルを作成',
        'MakeScreen': '描画可能なグラフィックハンドルを作成',
        'GetGraphSize': '画像のサイズを取得',
        'DerivationGraph': '画像の一部を別のグラフィックハンドルとして作成',
        'SetTransColor': '透過色を設定',
        'LoadGraphScreen': '画像ファイルを画面に直接読み込み',
        'LoadBlendGraph': 'ブレンド画像を読み込み',
        'SaveDrawScreen': '描画先画面を画像ファイルに保存',
        'SaveDrawScreenToBMP': '描画先画面をBMPファイルに保存',
        'SaveDrawScreenToPNG': '描画先画面をPNGファイルに保存',
        'SaveDrawScreenToJPEG': '描画先画面をJPEGファイルに保存',

        'DrawString': '文字列を描画',
        'DrawFormatString': '書式付き文字列を描画',
        'DrawStringToHandle': 'フォントハンドルを使って文字列を描画',
        'DrawFormatStringToHandle': 'フォントハンドルを使って書式付き文字列を描画',
        'GetDrawStringWidth': '文字列の描画幅を取得',
        'GetDrawFormatStringWidth': '書式付き文字列の描画幅を取得',
        'GetDrawStringWidthToHandle': 'フォントハンドルを使って文字列の描画幅を取得',

        'SetFontSize': 'フォントサイズを設定',
        'SetFontThickness': 'フォントの太さを設定',
        'ChangeFont': 'フォントを変更',
        'ChangeFontType': 'フォントタイプを変更',
        'CreateFontToHandle': 'フォントハンドルを作成',
        'DeleteFontToHandle': 'フォントハンドルを削除',
        'GetFontSize': '現在のフォントサイズを取得',
        'GetFontSizeToHandle': 'フォントハンドルのフォントサイズを取得',

        'CheckHitKey': 'キーが押されているか調べる',
        'CheckHitKeyAll': 'いずれかのキーが押されているか調べる',
        'GetHitKeyStateAll': '全キーの押下状態を取得',
        'GetMousePoint': 'マウスカーソルの位置を取得',
        'SetMousePoint': 'マウスカーソルの位置を設定',
        'GetMouseInput': 'マウスボタンの押下状態を取得',
        'GetMouseWheelRotVol': 'マウスホイールの回転量を取得',
        'SetMouseDispFlag': 'マウスカーソルの表示/非表示を設定',
        'GetJoypadInputState': 'ジョイパッドの入力状態を取得',
        'GetJoypadNum': 'ジョイパッドの接続数を取得',
        'GetJoypadAnalogInput': 'ジョイパッドのアナログ入力を取得',
        'SetJoypadDeadZone': 'ジョイパッドのデッドゾーンを設定',
        'GetXInputState': 'XInput対応パッドの入力状態を取得',
        'SetXInputVibration': 'XInput対応パッドの振動を設定',
        'GetTouchInputNum': 'タッチ入力の数を取得',
        'GetTouchInput': 'タッチ入力の情報を取得',

        'LoadSoundMem': '音声ファイルを読み込みサウンドハンドルを取得',
        'PlaySoundMem': 'サウンドを再生',
        'StopSoundMem': 'サウンドの再生を停止',
        'DeleteSoundMem': 'サウンドハンドルを削除',
        'InitSoundMem': '全てのサウンドハンドルを削除',
        'CheckSoundMem': 'サウンドが再生中か調べる',
        'SetVolumeSoundMem': 'サウンドの音量を設定',
        'ChangeVolumeSoundMem': 'サウンドの音量を変更',
        'SetFrequencySoundMem': 'サウンドの再生周波数を設定',
        'SetCurrentPositionSoundMem': 'サウンドの再生位置を設定',
        'DuplicateSoundMem': 'サウンドハンドルを複製',
        'PlayMusic': 'MIDIを再生',
        'StopMusic': 'MIDIの再生を停止',
        'SetVolumeMusic': 'MIDIの音量を設定',

        'ChangeWindowMode': 'ウィンドウモードを変更 (TRUE=ウィンドウ)',
        'SetGraphMode': '画面解像度と色ビット深度を設定',
        'SetMainWindowText': 'ウィンドウのタイトルを設定',
        'GetScreenState': '画面の状態を取得',
        'SetWindowSize': 'ウィンドウの表示サイズを設定',
        'SetWindowPosition': 'ウィンドウの位置を設定',
        'GetColorBitDepth': 'カラービット深度を取得',
        'GetMainWindowHandle': 'メインウィンドウのハンドルを取得',
        'SetWindowStyleMode': 'ウィンドウスタイルを設定',
        'SetWindowIconID': 'ウィンドウアイコンを設定',
        'SetDoubleStartValidFlag': '二重起動を許可するか設定',

        'MV1LoadModel': '3Dモデルファイルを読み込み',
        'MV1DeleteModel': '3Dモデルハンドルを削除',
        'MV1DrawModel': '3Dモデルを描画',
        'MV1SetPosition': '3Dモデルの座標を設定',
        'MV1SetScale': '3Dモデルのスケールを設定',
        'MV1SetRotationXYZ': '3Dモデルの回転を設定 (XYZ)',
        'MV1GetFrameNum': '3Dモデルのフレーム数を取得',
        'MV1SearchFrame': '3Dモデルのフレームを名前で検索',
        'MV1SetFrameVisible': '3Dモデルのフレーム表示/非表示を設定',
        'MV1AttachAnim': '3Dモデルにアニメーションをアタッチ',
        'MV1DetachAnim': '3Dモデルからアニメーションをデタッチ',
        'MV1SetAttachAnimTime': '3Dモデルのアニメーション再生時間を設定',
        'MV1GetAttachAnimTotalTime': '3Dモデルのアニメーション総再生時間を取得',

        'SetCameraNearFar': 'カメラのクリッピング距離を設定',
        'SetCameraPositionAndTarget_UpVecY': 'カメラの位置と注視点を設定 (上方向Y)',
        'SetCameraPositionAndTargetAndUpVec': 'カメラの位置と注視点と上方向を設定',

        'SetLightDirection': 'デフォルトライトの方向を設定',
        'SetLightDifColor': 'デフォルトライトのディフューズカラーを設定',
        'SetLightSpcColor': 'デフォルトライトのスペキュラカラーを設定',
        'SetLightAmbColor': 'デフォルトライトのアンビエントカラーを設定',
        'SetLightEnable': 'デフォルトライトの有効/無効を設定',

        'FileRead_open': 'ファイルを読み込み用に開く',
        'FileRead_close': 'ファイルを閉じる',
        'FileRead_read': 'ファイルからデータを読み込む',
        'FileRead_size': 'ファイルサイズを取得',
        'FileRead_seek': 'ファイル読み込み位置を変更',
        'FileRead_tell': 'ファイル読み込み位置を取得',
        'FileRead_eof': 'ファイル終端かを取得',
        'FileRead_gets': 'ファイルから一行読み込む',

        'SetUseDXArchiveFlag': 'DXアーカイブファイルの使用設定',
        'SetDXArchiveKeyString': 'DXアーカイブの暗号キーを設定',

        'GetColor': '色コードを取得 (R, G, B)',
        'SetFullScreenResolutionMode': 'フルスクリーン時の解像度モードを設定',
        'SetFullScreenScalingMode': 'フルスクリーン時のスケーリングモードを設定',

        'VGet': 'VECTORを作成 (x, y, z)',
        'VAdd': 'ベクトルの加算',
        'VSub': 'ベクトルの減算',
        'VDot': 'ベクトルの内積',
        'VCross': 'ベクトルの外積',
        'VScale': 'ベクトルのスカラー倍',
        'VSquareSize': 'ベクトルの大きさの二乗',
        'VNorm': 'ベクトルの正規化',
        'VTransform': 'ベクトルを行列で変換',
    }
    return desc


def main():
    global INPUT_CS, OUTPUT_DIR

    if len(sys.argv) < 3:
        print(f'Usage: {sys.argv[0]} <DxDLLW.cs> <output_dir> [dxlib_help.json]')
        sys.exit(1)

    INPUT_CS = sys.argv[1]
    OUTPUT_DIR = sys.argv[2]
    HELP_JSON = sys.argv[3] if len(sys.argv) > 3 else None

    os.makedirs(OUTPUT_DIR, exist_ok=True)

    print(f'Reading {INPUT_CS}...')
    with open(INPUT_CS, 'r', encoding='utf-8') as f:
        content = f.read()
    lines = content.split('\n')

    print('Parsing constants...')
    consts = parse_constants(lines)
    print(f'  Found {len(consts)} constants')

    print('Parsing structs...')
    struct_list = parse_structs(lines)
    print(f'  Found {len(struct_list)} structs')

    # 解析済み構造体から KNOWN_DEFSTRUCTS を拡張
    # (#defstruct 経由で stdim / 値渡し / -> アクセスを使えるようにする)
    auto_added = auto_populate_known_defstructs(struct_list)
    print(f'  Auto-populated KNOWN_DEFSTRUCTS: +{auto_added} structs (total {len(KNOWN_DEFSTRUCTS)})')

    print('Collecting DLL entry points...')
    collect_entry_points(lines)
    print(f'  Found {len(DLL_ENTRY_POINTS)} entry points')

    print('Parsing public methods...')
    pub_methods = parse_public_methods(lines)
    dll_methods = [m for m in pub_methods if m['has_dll']]
    simple_methods = [m for m in dll_methods if m['is_simple_return']]
    struct_methods = [m for m in dll_methods if m['is_struct_return']]
    no_dll_methods = [m for m in pub_methods if not m['has_dll']]
    struct_with_size = [m for m in struct_methods if STRUCT_SIZES.get(m['ret_type'], 0) > 0]
    print(f'  Total public methods:     {len(pub_methods)}')
    print(f'  With DLL entry point:     {len(dll_methods)}')
    print(f'  Simple return (#cfunc):   {len(simple_methods)}')
    print(f'  Struct return (#cfuncst): {len(struct_with_size)}')
    print(f'  No DLL (C# helpers):      {len(no_dll_methods)}')

    descriptions = build_descriptions()

    print('Generating hspdxlib.as...')
    as_content = generate_as_header(pub_methods)
    with open(os.path.join(OUTPUT_DIR, 'hspdxlib.as'), 'w', encoding='cp932', errors='replace') as f:
        f.write(as_content)

    print('Generating hspdxlib_const.as...')
    const_content = generate_const_as(consts)
    with open(os.path.join(OUTPUT_DIR, 'hspdxlib_const.as'), 'w', encoding='cp932', errors='replace') as f:
        f.write(const_content)

    print('Generating hspdxlib_struct.as...')
    struct_content = generate_struct_as(struct_list)
    with open(os.path.join(OUTPUT_DIR, 'hspdxlib_struct.as'), 'w', encoding='cp932', errors='replace') as f:
        f.write(struct_content)

    print('Generating hspdxlib_macro.as...')
    macro_content = generate_macro_as(pub_methods)
    with open(os.path.join(OUTPUT_DIR, 'hspdxlib_macro.as'), 'w', encoding='cp932', errors='replace') as f:
        f.write(macro_content)

    # Load DxLib official documentation (if available)
    dxlib_docs = {}
    if HELP_JSON and os.path.exists(HELP_JSON):
        import json
        print(f'Loading DxLib help from {HELP_JSON}...')
        with open(HELP_JSON, 'r', encoding='utf-8') as f:
            dxlib_docs = json.load(f)
        print(f'  Loaded {len(dxlib_docs)} function docs')
    else:
        print('No DxLib help JSON specified, using built-in descriptions only.')

    print('Generating hspdxlib.hs...')
    hs_content = generate_hs_help(pub_methods, consts, struct_list, descriptions, dxlib_docs)
    with open(os.path.join(OUTPUT_DIR, 'hspdxlib.hs'), 'w', encoding='cp932', errors='replace') as f:
        f.write(hs_content)

    print('')
    print('=== Summary ===')
    print(f'Constants:          {len(consts)}')
    print(f'Structs:            {len(struct_list)}')
    print(f'Exported functions: {len(simple_methods)} #cfunc + {len([m for m in struct_methods if STRUCT_SIZES.get(m["ret_type"],0)>0])} #cfuncst')
    print(f'Descriptions:       {len(descriptions)}')
    print('')
    print('Generated files:')
    for fn in ['hspdxlib.as', 'hspdxlib_const.as', 'hspdxlib_struct.as', 'hspdxlib_macro.as', 'hspdxlib.hs']:
        fpath = os.path.join(OUTPUT_DIR, fn)
        if os.path.exists(fpath):
            size = os.path.getsize(fpath)
            print(f'  {fn}: {size:,} bytes')


if __name__ == '__main__':
    main()
