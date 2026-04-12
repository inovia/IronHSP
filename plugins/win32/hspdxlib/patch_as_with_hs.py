#!/usr/bin/env python3
"""hspdxlib.as を hspdxlib.hs のパラメータ型情報に基づいてパッチする。

DxDLLW.cs が無い状況で、既に生成済みの .as に対して構造体値渡しの修正を
適用するためのスクリプト。.hs ファイルの %prm セクションに記録されている
"VECTOR Position" のような型注釈を読み取って、対応する #func/#cfunc/#cfuncst の
パラメータ列にある `var` を構造体名 (svalN) に置き換える。

また、KNOWN_DEFSTRUCTS に含まれない構造体の #defstruct ブロックを必要に応じて
追加する (フィールド情報は hspdxlib_struct.as の `_<member> <offset>` から復元)。
"""
import re
import sys
import os

# C → HSP #field 型マップ
C_TO_HSP_FIELD = {
    'int': 'int', 'unsigned int': 'int', 'UINT': 'int', 'DWORD': 'int',
    'BOOL': 'int', 'long': 'int', 'unsigned long': 'int', 'LONG': 'int',
    'short': 'short', 'unsigned short': 'short', 'WORD': 'short',
    'byte': 'byte', 'unsigned char': 'byte', 'BYTE': 'byte', 'char': 'byte',
    'float': 'float',
    'double': 'double',
    'int64': 'int64', 'long long': 'int64', '__int64': 'int64', 'LONGLONG': 'int64',
    'IntPtr': 'ptr',
}

# 既に hspdxlib.as に書かれている defstruct (再生成しない)
KNOWN_DEFSTRUCTS_IN_AS = set()


def parse_hs_param_types(hs_path):
    """hspdxlib.hs を読み込み、関数名 → [パラメータ型] のマップを返す。

    %prm セクションの形式:
        Position, Target          ← パラメータ名一覧
        VECTOR Position : ...     ← 型情報行
        VECTOR Target : ...
    """
    with open(hs_path, 'r', encoding='cp932', errors='replace') as f:
        text = f.read()

    func_params = {}  # name → [(struct_or_None, param_name), ...]
    entries = re.split(r'^%index\s*$', text, flags=re.MULTILINE)
    for entry in entries[1:]:
        lines = entry.split('\n')
        # 最初の非空行が関数名
        func_name = ''
        for ln in lines:
            if ln.strip():
                func_name = ln.strip()
                break
        if not func_name or not re.match(r'^[A-Za-z_]\w*$', func_name):
            continue

        # %prm セクションを探す
        in_prm = False
        prm_lines = []
        for ln in lines:
            s = ln.rstrip('\r')
            if s.strip() == '%prm':
                in_prm = True
                continue
            if in_prm:
                if s.startswith('%') or s.strip().startswith('--'):
                    break
                prm_lines.append(s)

        if not prm_lines:
            continue

        # 1 行目はパラメータ名一覧 (e.g. "Position, Target") なのでスキップ
        # 2 行目以降が "型 名前 ..." 形式
        param_types = []
        for ln in prm_lines[1:]:
            s = ln.strip()
            if not s:
                continue
            # 型名 (1 ワード) + パラメータ名 (1 ワード) + 残り
            m = re.match(r'^([A-Za-z_][\w]*)\s+\*?([A-Za-z_]\w*)', s)
            if not m:
                continue
            type_word = m.group(1)
            # ポインタや配列の判定 ("*" or "[" が含まれていれば pointer 扱い)
            if '*' in s.split(m.group(2))[0] or '[' in s:
                param_types.append((None, m.group(2)))
                continue
            param_types.append((type_word, m.group(2)))

        if param_types:
            func_params[func_name] = param_types

    return func_params


def parse_struct_as_fields(struct_as_path):
    """hspdxlib_struct.as をパースして {struct_name: [(hsp_type, field_name, offset), ...]} を返す。"""
    structs = {}
    with open(struct_as_path, 'r', encoding='cp932', errors='replace') as f:
        text = f.read()

    cur_struct = None
    cur_fields = []
    cur_size = 0

    for line in text.split('\n'):
        m = re.match(r';\s*---\s*(\w+)\s*\(size=(\d+)', line)
        if m:
            if cur_struct:
                structs[cur_struct] = (cur_size, cur_fields)
            cur_struct = m.group(1)
            cur_size = int(m.group(2))
            cur_fields = []
            continue
        m = re.match(r'#const\s+global\s+(\w+)_(\w+)\s+(\d+)\s*;\s*(\w+)', line)
        if m and cur_struct and m.group(1) == cur_struct:
            fname = m.group(2)
            offset = int(m.group(3))
            ftype = m.group(4)
            if ftype == 'SIZE':
                continue
            hsp_type = C_TO_HSP_FIELD.get(ftype)
            if hsp_type:
                cur_fields.append((hsp_type, fname, offset))

    if cur_struct:
        structs[cur_struct] = (cur_size, cur_fields)

    # SIZE フィールドや不明型のせいで空になったエントリは除外
    return {k: v for k, v in structs.items() if v[1]}


def patch_as_file(as_path, hs_params, structs):
    """hspdxlib.as をパッチする。

    1. 既存 #defstruct ブロックの構造体名集合を収集
    2. .hs から取得した型情報をもとに #func/#cfunc/#cfuncst の var を構造体名に置換
    3. 新しく必要になった #defstruct ブロックを既存ブロックの後ろに挿入
    """
    with open(as_path, 'r', encoding='cp932', errors='replace') as f:
        lines = f.read().split('\n')

    # 既存 #defstruct を収集
    existing_defstructs = set()
    for ln in lines:
        m = re.match(r'#defstruct\s+(\w+)', ln)
        if m:
            existing_defstructs.add(m.group(1))

    # #func/#cfunc/#cfuncst 行のパターン
    func_pat = re.compile(
        r'^(\s*#(?:func|cfunc|cfuncf|cfuncd|cfuncst)(?:\s+global)?\s+)'
        r'(?:(\w+)\s+)?'                     # cfuncst 用のオプションの構造体戻り値名
        r'(\w+)\s+"([^"]+)"\s*(.*?)\s*$'
    )

    needed_structs = set()  # 新たに #defstruct したい構造体名
    fix_count = 0

    for i, line in enumerate(lines):
        m = func_pat.match(line)
        if not m:
            continue

        prefix = m.group(1)
        ret_struct = m.group(2)  # cfuncst の戻り値構造体名 (新形式) または None
        func_name = m.group(3)
        entry = m.group(4)
        params_str = m.group(5)

        if func_name not in hs_params:
            continue

        hs_types = hs_params[func_name]
        # 既存パラメータ列を分解
        if not params_str:
            continue
        cur_params = [p.strip() for p in params_str.split(',')]

        # 個数が一致しない場合はスキップ (オーバーロード等で不確実)
        if len(cur_params) != len(hs_types):
            continue

        new_params = []
        changed = False
        for cur, (hs_type, _) in zip(cur_params, hs_types):
            if cur == 'var' and hs_type and hs_type in structs:
                # var → 構造体名 に変換
                new_params.append(hs_type)
                needed_structs.add(hs_type)
                changed = True
            else:
                new_params.append(cur)

        if changed:
            new_line = f'{prefix}'
            if ret_struct:
                new_line += f'{ret_struct} '
            new_line += f'{func_name} "{entry}" {", ".join(new_params)}'
            lines[i] = new_line
            fix_count += 1

    # 必要な #defstruct のうち未定義のものを追加
    new_defstructs = sorted(s for s in needed_structs if s not in existing_defstructs)
    add_blocks = []
    for sname in new_defstructs:
        if sname not in structs:
            continue
        size, fields = structs[sname]
        block = [f'#defstruct {sname}']
        for hsp_type, fname, _ in fields:
            block.append(f'#field {hsp_type} {fname}')
        block.append('#endstruct')
        block.append('')
        add_blocks.append('\n'.join(block))

    if add_blocks:
        # 既存の #defstruct ブロック群の終了位置を探す
        # (最後の #endstruct の直後に挿入)
        last_endstruct = -1
        for i, ln in enumerate(lines):
            if ln.strip() == '#endstruct':
                last_endstruct = i
        if last_endstruct >= 0:
            insert_text = '\n'.join(add_blocks)
            lines.insert(last_endstruct + 1, '')
            lines.insert(last_endstruct + 2, insert_text)

    with open(as_path, 'w', encoding='cp932', errors='replace') as f:
        f.write('\n'.join(lines))

    return fix_count, len(new_defstructs)


def main():
    if len(sys.argv) < 2:
        base = os.path.join(os.path.dirname(__file__), 'output')
    else:
        base = sys.argv[1]

    as_path = os.path.join(base, 'hspdxlib.as')
    hs_path = os.path.join(base, 'hspdxlib.hs')
    struct_as_path = os.path.join(base, 'hspdxlib_struct.as')

    print(f'Reading {hs_path}...')
    hs_params = parse_hs_param_types(hs_path)
    print(f'  Parsed {len(hs_params)} function param signatures')

    print(f'Reading {struct_as_path}...')
    structs = parse_struct_as_fields(struct_as_path)
    print(f'  Parsed {len(structs)} struct definitions')

    print(f'Patching {as_path}...')
    fix_count, new_struct_count = patch_as_file(as_path, hs_params, structs)
    print(f'  Fixed {fix_count} function declarations')
    print(f'  Added {new_struct_count} new #defstruct blocks')


if __name__ == '__main__':
    main()
