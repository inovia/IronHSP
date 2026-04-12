#!/usr/bin/env python3
"""
Enrich DxLib function descriptions by:
1. Reading DxLib source (.cpp files) to find internal implementation comments
2. Generating detailed descriptions from function name, params, section context
3. Updating dxlib_help.json with enriched descriptions
"""
import re
import sys
import os
import json
from collections import defaultdict


def index_cpp_functions(srcdir):
    """Index NS_* function implementations from all .cpp files.
    Returns dict: { 'NS_FuncName': { 'file': ..., 'comments': [...], 'body_preview': ... } }
    """
    index = {}
    for fname in sorted(os.listdir(srcdir)):
        if not fname.endswith('.cpp'):
            continue
        fpath = os.path.join(srcdir, fname)
        try:
            with open(fpath, 'r', encoding='cp932', errors='replace') as f:
                content = f.read()
        except:
            continue

        # Find NS_FuncName function definitions with preceding comments
        # Pattern: comments + function signature + opening brace
        for m in re.finditer(
            r'((?://[^\n]*\n)*)'  # preceding comments
            r'\s*(?:extern\s+)?(?:static\s+)?'
            r'(?:int|void|float|double|VECTOR|MATRIX|COLOR_F|FLOAT4|DOUBLE4|unsigned\s+int|LONGLONG|ULONGLONG|DWORD|BOOL|const\s+\w+\s*\*?)\s+'
            r'(NS_\w+)\s*\([^)]*\)\s*\{',
            content
        ):
            comments = m.group(1).strip()
            func_name = m.group(2)
            # Get first ~500 chars of body
            body_start = m.end()
            body_end = min(body_start + 800, len(content))
            body = content[body_start:body_end]
            # Extract meaningful comments from body
            body_comments = re.findall(r'//\s*(.+)', body)

            index[func_name] = {
                'file': fname,
                'comments': comments,
                'body_comments': body_comments[:5],  # first 5 comments
            }
    return index


def generate_description(func_name, info, cpp_index):
    """Generate a detailed description for a function."""
    summary = info.get('summary', '') or info.get('header_comment', '')
    params = info.get('params', '')
    returns = info.get('returns', '')
    section = info.get('section', '')
    existing_desc = info.get('description', '')

    # If already has a detailed description (from HTML help), keep it
    if existing_desc and len(existing_desc) > 100 and info.get('source') != 'DxLib.h':
        return None  # no change needed

    # Look up internal implementation
    ns_name = f'NS_{func_name}'
    cpp_info = cpp_index.get(ns_name, {})
    cpp_comments = cpp_info.get('body_comments', [])
    cpp_file = cpp_info.get('file', '')

    # Build enriched description
    desc_parts = []

    # Start with the summary
    if summary:
        desc_parts.append(summary)

    # Add parameter details if we have them
    if params and len(params) > 5:
        # params already contains good info, it will be in %prm section
        pass

    # Add implementation-derived info
    if cpp_comments:
        useful_comments = [c for c in cpp_comments
                          if len(c) > 5
                          and not c.startswith('//')
                          and '初期化されていなかったら' not in c
                          and 'ここから' not in c
                          and '終了' not in c.strip()[:2]]
        if useful_comments:
            desc_parts.append('')
            for c in useful_comments[:3]:
                desc_parts.append(c.strip())

    # Generate additional description based on function name patterns
    extra = generate_from_patterns(func_name, summary, params, section)
    if extra:
        desc_parts.append('')
        desc_parts.append(extra)

    # Add return value info
    if returns:
        pass  # will be added separately
    elif summary:
        ret_hint = generate_return_hint(func_name, summary)
        if ret_hint:
            desc_parts.append('')
            desc_parts.append(ret_hint)

    result = '\n'.join(desc_parts)

    # Only return if we actually improved the description
    if len(result) > len(existing_desc) + 20:
        return result
    return None


def generate_from_patterns(func_name, summary, params, section):
    """Generate additional description based on naming patterns."""
    name = func_name
    parts = []

    # MV1 model functions
    if name.startswith('MV1'):
        sub = name[3:]
        if sub.startswith('Get') and sub.endswith('Num'):
            thing = sub[3:-3]
            parts.append(f'モデルに含まれる{thing_to_ja(thing)}の数を取得します。')
        elif sub.startswith('Set') and 'Visible' in sub:
            parts.append('TRUEで表示、FALSEで非表示になります。')
            parts.append('MV1DrawModel 等の描画関数を呼んでも非表示の要素は描画されません。')
        elif sub.startswith('Set') and 'Position' in sub:
            parts.append('VECTOR構造体で座標を指定します。VGet関数でVECTORを作成できます。')
        elif sub.startswith('Set') and 'Scale' in sub:
            parts.append('VECTOR構造体で各軸のスケール値を指定します。VGet(1.0, 1.0, 1.0)が等倍です。')
        elif sub.startswith('Set') and 'Rotation' in sub:
            parts.append('回転角度はラジアン単位で指定します。')
        elif sub.startswith('Get') and 'Position' in sub:
            parts.append('戻り値はVECTOR構造体へのポインタです。')
        elif 'Anim' in sub and 'Attach' in sub:
            parts.append('アタッチ成功時はアタッチインデックスが返ります。このインデックスを使用してアニメーションの再生時間を設定できます。')
        elif 'Anim' in sub and 'Detach' in sub:
            parts.append('MV1AttachAnimでアタッチしたアニメーションを解除します。')
        elif 'Material' in sub:
            parts.append('マテリアルの番号は 0 から MV1GetMaterialNum の戻り値 - 1 までです。')
        elif 'Frame' in sub:
            parts.append('フレームの番号は 0 から MV1GetFrameNum の戻り値 - 1 までです。')
        elif 'Mesh' in sub:
            parts.append('メッシュの番号は 0 から MV1GetMeshNum の戻り値 - 1 までです。')
        elif 'Coll' in sub or 'Collision' in sub:
            parts.append('コリジョン情報を使用するには事前に MV1SetupCollInfo でコリジョン情報のセットアップを行う必要があります。')

    # Draw functions
    elif name.startswith('Draw'):
        if 'AA' in name and 'AA' == name[-2:]:
            base = name[4:-2]
            parts.append(f'アンチエイリアス処理付きで{base_to_ja(base)}を描画します。描画結果のエッジが滑らかになります。')
        elif '3D' in name:
            parts.append('3D空間に描画するため、カメラの設定（SetCameraNearFar、SetCameraPositionAndTarget_UpVecY等）が必要です。')
        if 'FillFlag' in params:
            parts.append('FillFlag を TRUE にすると塗りつぶし、FALSE にすると輪郭のみ描画します。')
        if 'TransFlag' in params:
            parts.append('TransFlag を TRUE にすると画像の透過色( SetTransColor で設定 )が有効になります。')

    # Set/Get functions
    elif name.startswith('Set') and not name.startswith('Setup'):
        counterpart = 'Get' + name[3:]
        parts.append(f'この関数で設定した値は {counterpart} で取得できます。' if len(name) > 5 else '')
        if 'Flag' in name:
            parts.append('TRUE で有効、FALSE で無効です。')
        if 'Mode' in name:
            parts.append('設定するモードの値は DxLib の定数を使用してください。')

    elif name.startswith('Get'):
        if name.endswith('Num') or name.endswith('Count'):
            parts.append('戻り値に数を返します。')
        if 'Handle' in name:
            parts.append('戻り値は -1 の場合はエラーです。')
        if 'State' in name or 'Input' in name:
            parts.append('毎フレーム呼び出して最新の状態を取得してください。')

    # Load functions
    elif name.startswith('Load'):
        parts.append('読み込みに成功するとハンドルが返ります。失敗した場合は -1 が返ります。')
        parts.append('使い終わったハンドルは対応する Delete 関数で削除してください。')
        if 'Graph' in name:
            parts.append('DXアーカイブファイル内のファイルも読み込めます。')
        if 'Sound' in name:
            parts.append('対応フォーマット: WAV, OGG, MP3, MIDI 等')

    # Delete functions
    elif name.startswith('Delete'):
        parts.append('ハンドルを削除し、使用していたメモリやリソースを解放します。')
        parts.append('削除済みのハンドルを使用するとエラーになります。')

    # Init functions (delete all)
    elif name.startswith('Init') and name != 'DxLib_Init':
        parts.append('指定されたタイプのハンドルを全て削除します。')

    # Create functions
    elif name.startswith('Create') or name.startswith('Make'):
        parts.append('成功するとハンドルが返ります。失敗した場合は -1 が返ります。')

    # Check functions
    elif name.startswith('Check'):
        parts.append('条件を満たしている場合は TRUE(1)、そうでない場合は FALSE(0) を返します。')

    # Camera functions
    elif 'Camera' in name:
        if 'Set' in name:
            parts.append('3D描画を行う前にカメラの設定を行ってください。')
        if 'NearFar' in name:
            parts.append('Near はカメラから最も近い描画距離、Far は最も遠い描画距離です。Near に 0 は指定できません。')

    # Light functions
    elif 'Light' in name and 'Handle' in name:
        if 'Create' in name:
            parts.append('作成したライトハンドルは DeleteLightHandle で削除してください。')
        parts.append('ライトの番号は CreateDirLightHandle, CreatePointLightHandle, CreateSpotLightHandle の戻り値です。')

    # Sound functions
    elif 'Sound' in name or 'Music' in name:
        if 'Volume' in name:
            parts.append('音量の範囲は 0（無音）～ 255（最大）です。')
        if 'Frequency' in name:
            parts.append('周波数の単位は Hz です。')
        if 'PlayType' in params or 'PlayType' in summary:
            parts.append('再生タイプ: DX_PLAYTYPE_NORMAL(通常再生), DX_PLAYTYPE_BACK(バックグラウンド再生), DX_PLAYTYPE_LOOP(ループ再生)')

    # Font functions
    elif 'Font' in name:
        if 'ToHandle' in name:
            parts.append('フォントハンドルを使用することでデフォルトフォントとは異なるフォントで描画できます。')
        if 'Create' in name:
            parts.append('不要になったフォントハンドルは DeleteFontToHandle で削除してください。')

    # String/Format functions
    if 'FormatString' in name or 'FormatStr' in name:
        parts.append('C言語の printf と同じ書式指定文字列が使用できます（%d, %f, %s 等）。')

    # Network functions
    if 'NetWork' in name or 'UDP' in name or 'TCP' in name:
        parts.append('通信機能を使用するには事前にネットワークの初期化が必要です。')

    # Shader functions
    if 'Shader' in name:
        if 'Constant' in name:
            parts.append('シェーダー内の定数レジスタに値を設定します。')

    # D suffix = double precision variant
    if name.endswith('D') and len(name) > 3:
        base = name[:-1]
        parts.append(f'{base} の倍精度浮動小数点数(double)版です。')

    # F suffix = float coordinate variant
    if name.endswith('F') and 'Draw' in name:
        base = name[:-1]
        parts.append(f'{base} の float 座標版です。小数点以下の精度で描画位置を指定できます。')

    return '\n'.join(p for p in parts if p)


def thing_to_ja(thing):
    """Convert model sub-component name to Japanese."""
    mapping = {
        'Frame': 'フレーム',
        'Mesh': 'メッシュ',
        'Material': 'マテリアル',
        'Anim': 'アニメーション',
        'Shape': 'シェイプ',
        'Texture': 'テクスチャ',
        'Triangle': 'ポリゴン',
        'Vertex': '頂点',
        'Opacity': '透明度',
    }
    for eng, ja in mapping.items():
        if eng in thing:
            return ja
    return thing


def base_to_ja(base):
    """Convert shape base name to Japanese."""
    mapping = {
        'Line': '線',
        'Box': '四角形',
        'Circle': '円',
        'Oval': '楕円',
        'Triangle': '三角形',
        'Quadrangle': '四角形',
        'RoundRect': '角丸四角形',
    }
    return mapping.get(base, base)


def generate_return_hint(func_name, summary):
    """Generate return value hint from summary."""
    if '取得' in summary or 'を得る' in summary:
        return '戻り値として結果が返ります。エラーの場合は -1 が返ります。'
    if '設定' in summary or 'を行う' in summary:
        return '戻り値: 0:成功  -1:エラー'
    if '描画' in summary:
        return '戻り値: 0:成功  -1:エラー'
    if '読み込' in summary or 'ロード' in summary:
        return '成功するとハンドルが返ります。失敗した場合は -1 が返ります。'
    if '削除' in summary:
        return '戻り値: 0:成功  -1:エラー'
    return ''


def main():
    if len(sys.argv) < 3:
        print(f'Usage: {sys.argv[0]} <DxLibMake_dir> <dxlib_help.json>')
        sys.exit(1)

    srcdir = sys.argv[1]
    json_path = sys.argv[2]

    print(f'Indexing .cpp files from {srcdir}...')
    cpp_index = index_cpp_functions(srcdir)
    print(f'  Indexed {len(cpp_index)} NS_* functions')

    print(f'Loading {json_path}...')
    with open(json_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    print(f'  {len(data)} functions')

    # Count functions needing enrichment
    needs_enrichment = []
    for name, info in data.items():
        desc = info.get('description', '')
        source = info.get('source', '')
        # Functions from DxLib.h only (short descriptions) or with no desc
        if source == 'DxLib.h' or (not desc) or len(desc) < 50:
            needs_enrichment.append(name)

    print(f'  Functions needing enrichment: {len(needs_enrichment)}')

    enriched = 0
    for name in needs_enrichment:
        info = data[name]
        new_desc = generate_description(name, info, cpp_index)
        if new_desc:
            info['description'] = new_desc
            enriched += 1

    print(f'  Enriched: {enriched}')

    # Also handle completely undocumented functions
    # (those still with "を実行する" pattern)
    still_generic = 0
    for name, info in data.items():
        desc = info.get('description', '')
        summary = info.get('summary', '')
        if (f'{name} を実行する' in desc or f'{name} を実行する' in summary) and desc == summary:
            new_desc = generate_description(name, info, cpp_index)
            if new_desc and new_desc != desc:
                info['description'] = new_desc
                still_generic += 1

    print(f'  Generic → enriched: {still_generic}')

    with open(json_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=2)
    print(f'Saved to {json_path}')

    # Stats
    short = sum(1 for v in data.values() if len(v.get('description', '')) < 50)
    medium = sum(1 for v in data.values() if 50 <= len(v.get('description', '')) < 150)
    long_d = sum(1 for v in data.values() if len(v.get('description', '')) >= 150)
    print(f'\nDescription length stats:')
    print(f'  Short (<50 chars):  {short}')
    print(f'  Medium (50-150):    {medium}')
    print(f'  Long (>150):        {long_d}')


if __name__ == '__main__':
    main()
