#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
DxLib.h から全関数を抽出し、Desktop (SDL2+GL) fork での実装状況と
照合して詳細 HTML (PORTING_STATUS_DETAIL.html) を生成する。

使い方: (repo root から)
  python3 hsp3dx/dxlib_angle_sdl2/tools/gen_porting_status_detail.py
出力:    hsp3dx/dxlib_angle_sdl2/PORTING_STATUS_DETAIL.html

ロジック概要:
1. DxLib.h (Shift-JIS) を開き、`extern` プロトタイプを抽出。コメント行
   (// XXX関係関数 等) をセクション区切りとして使う。
2. Desktop/*.cpp で `extern int <FUNC>(` パターンを grep して
   「Desktop 独自実装」扱いの関数集合を作る。
3. Windows/DxGraphicsDesktop_stubs.cpp / DxGraphicsDesktop.cpp にある
   PF (関数名末尾 _PF) を stub/impl で 2 分類。
4. 全関数をプラットフォーム毎にマーク付けして HTML テーブル化。
   * Win (DxLib 本家): 全 ✓ (DxLib.h に宣言があればどれも実装済)
   * iOS / Android:   基本 ✓ (#ifdef で切られている関数は ⚠)
   * SDL2 (Win/Mac/Linux fork): この repo の Desktop/ 実装に応じて ✓/△/×
   * Web:              SDL2 と同じ (emscripten で未検証のものは △)
"""

import os
import re
import sys
import html
from pathlib import Path

# --- paths ---
SCRIPT_DIR = Path(__file__).resolve().parent
ROOT = SCRIPT_DIR.parent                     # hsp3dx/dxlib_angle_sdl2/
PORTABLE = ROOT / "dxlib_portable"
DESKTOP = PORTABLE / "Desktop"
OUT_HTML = ROOT / "PORTING_STATUS_DETAIL.html"

DXLIB_H = PORTABLE / "DxLib.h"


# ---- 1. Parse DxLib.h to get (section, [func]) ------------------------

def read_sjis(p):
    # DxLib.h は Shift-JIS
    with open(p, "rb") as f:
        raw = f.read()
    try:
        return raw.decode("shift_jis")
    except UnicodeDecodeError:
        return raw.decode("shift_jis", errors="replace")


SECTION_COMMENT_RE = re.compile(r"^//\s*(.+関係関数|.+関係の関数|.+関係|.+関連関数)\s*$")
# extern プロトタイプ。
EXTERN_RE = re.compile(
    r"^extern\s+(?:const\s+)?[A-Za-z_][A-Za-z0-9_* \t]*\s+"
    r"([A-Za-z_][A-Za-z0-9_]*)\s*\("
)
# DX_NON_* ガードの begin/end を追う
NON_BEGIN_RE = re.compile(r"^\s*#ifndef\s+(DX_NON_[A-Z0-9_]+)\s*$")
NON_END_RE = re.compile(r"^\s*#endif\s*//\s*(DX_NON_[A-Z0-9_]+)\s*$")


def parse_dxlib_h(p):
    """
    戻り値: [ (section_name, [ (func_name, [active_DX_NON_guards,...]), ... ]) ]
    """
    text = read_sjis(p)
    sections = []
    current = ("未分類", [])
    sections.append(current)
    guard_stack = []
    for line in text.splitlines():
        stripped = line.strip()
        mb = NON_BEGIN_RE.match(line)
        if mb:
            guard_stack.append(mb.group(1))
            continue
        me = NON_END_RE.match(line)
        if me:
            # pop matching
            if guard_stack and guard_stack[-1] == me.group(1):
                guard_stack.pop()
            continue
        m = SECTION_COMMENT_RE.match(stripped)
        if m:
            name = m.group(1).strip()
            current = (name, [])
            sections.append(current)
            continue
        m = EXTERN_RE.match(line)
        if m:
            fname = m.group(1)
            current[1].append((fname, tuple(guard_stack)))
    return [(n, fs) for (n, fs) in sections if fs]


# ---- 2. Scan Desktop sources for implementations ---------------------

# Desktop/*.cpp で `extern X Func(` / `extern int Func(` / `extern "C" X Func(` を拾う
IMPL_RE = re.compile(
    r'^\s*extern\s+(?:"[^"]*"\s+)?'
    r"(?:const\s+)?[A-Za-z_][A-Za-z0-9_* \t]*\s+"
    r"([A-Za-z_][A-Za-z0-9_]*)\s*\("
)
# Desktop/DxGraphicsDesktop_stubs.cpp の stub 行 (まだ消し込んでない行)
STUB_LIVE_RE = re.compile(
    r'^\s*extern\s+[A-Za-z_][A-Za-z0-9_* \t]*\s+'
    r"([A-Za-z_][A-Za-z0-9_]*_PF)\s*\([^)]*\)\s*\{\s*return"
)


def scan_desktop():
    impl = set()   # Desktop で実装されている関数名 (名前一致のみ)
    stubs = set()  # 現 stub.cpp に残っている PF 名
    for cpp in DESKTOP.glob("*.cpp"):
        name = cpp.name
        with open(cpp, "rb") as f:
            raw = f.read()
        # BOM 付き UTF-8 も普通の UTF-8 も両対応
        try:
            text = raw.decode("utf-8-sig")
        except UnicodeDecodeError:
            text = raw.decode("utf-8", errors="replace")
        for line in text.splitlines():
            m = IMPL_RE.match(line)
            if m:
                impl.add(m.group(1))
            if name.endswith("stubs.cpp"):
                s = STUB_LIVE_RE.match(line)
                if s:
                    stubs.add(s.group(1))
    return impl, stubs


# DxLib の DX_NON_* ガード情報: lib 側で殺しているサブシステム
# (Sound / Movie / JPEGREAD / PNGREAD)
# これらは lib 側 DxLib.cpp 経路は使わず Desktop/*.cpp で独自提供しているので、
# impl[] に入っていれば ✓、無ければ × 判定。


# ---- 3. Build matrix -------------------------------------------------

# SDL2 fork の lib コンパイル時に定義される DX_NON_* (殺しているサブシステム)
# DxLib.h の #ifndef DX_NON_X 内の宣言は、lib 側で見ると「消えている」。
# ただし Desktop/*.cpp で上書き実装していれば復活扱い。
LIB_DISABLED_GUARDS = {
    "DX_NON_MOVIE",          # Movie — Win は override
    "DX_NON_MODEL",          # MV1 — override なし (stub のみ、未 link)
    "DX_NON_LIVE2D_CUBISM4", # Live2D — 未 override
    "DX_NON_SOUND",          # Sound — 全 API を override
    "DX_NON_JPEGREAD",       # JPEG 読み込み — stb_image で loader 差替
    "DX_NON_PNGREAD",        # PNG 読み込み — 同上
    "DX_NON_BULLET_PHYSICS", # Bullet Physics
    "DX_NON_FILTER",         # GraphFilter (post-process)
    "DX_NON_INPUTSTRING",    # IME 統合
    "DX_NON_KEYEX",          # KeyEx 高機能キー入力
    "DX_NON_TIFFREAD",       # TIFF
    "DX_NON_OGGVORBIS",      # OGG Vorbis
    "DX_NON_OGGTHEORA",      # OGG Theora
    "DX_NON_OPUS",           # OPUS
}

# Movie API 関数名一覧 (Win override 済) — 動くが Mac/Linux/Web は stub
MOVIE_WIN_OVERRIDES = {
    "OpenMovieToGraph", "OpenMovieToGraphWithStrLen",
    "PlayMovieToGraph", "PauseMovieToGraph",
    "GetMovieStateToGraph", "UpdateMovieToGraph",
    "TellMovieToGraph", "SeekMovieToGraph",
    "SetMovieVolumeToGraph", "GetMovieVolumeToGraph",
    "ChangeMovieVolumeToGraph", "GetMovieVolumeToGraph2",
    "GetMovieTotalFrameToGraph", "GetLastUpdateTimeMovieToGraph",
    "GetMovieImageSize_File",
}

# Sound override 済 (全 OK)
SOUND_OVERRIDES = {
    "LoadSoundMem", "LoadSoundMemWithStrLen", "LoadSoundMemBase",
    "PlaySoundMem", "StopSoundMem", "CheckSoundMem",
    "SetVolumeSoundMem", "ChangeVolumeSoundMem",
    "DeleteSoundMem", "InitSoundMem",
}


def classify(func, guards, impl_set, stubs_set):
    """
    guards: DxLib.h で func を囲む DX_NON_X タプル
    戻り値: (win, ios, android, sdl2, web) コード
    """
    win, ios, android = "ok", "ok", "ok"

    # プラットフォーム特有の対象外
    if func.startswith(("CheckHitKey", "GetHitKey",
                         "GetMouseWheel", "GetMouseHWheel", "SetMousePoint")):
        ios, android = "na", "na"
    if func.startswith("GetTouchInput"):
        win = "par"  # Win は基本未対応
    if func.startswith("KeyInputString") or "IME" in func:
        # Win 専用寄り
        ios, android = "par", "par"
    if func.startswith("Live2D_"):
        # 本家でも SDK 前提 (公式 DxLibEnableLive2D_* を当てないと動かない)
        ios, android = "par", "par"

    # --- SDL2 fork ---
    lib_guards = {g for g in guards if g in LIB_DISABLED_GUARDS}

    if func in impl_set:
        # 直接実装あり (DxMovieDesktop / DxSoundDesktop / DxFontDesktop 等)
        sdl2 = "ok"
        # Movie override は Mac/Linux で video 動かず (stub)。
        # 表の 1 列表示なので Win OK だが Mac/Linux stub = partial
        if func in MOVIE_WIN_OVERRIDES:
            sdl2, web = "par", "no"  # Win のみ、Mac/Linux/Web は stub
        else:
            # Font/Sound/Image は Web で未検証
            if func in SOUND_OVERRIDES or \
               func.startswith(("CreateFontToHandle", "DrawString", "DrawNString",
                                "DrawFormatString", "DrawExtendString", "DrawRotaString",
                                "GetDrawStringWidth", "LoadGraph", "LoadReverseGraph",
                                "LoadDivGraph", "LoadBmp", "OpenMovieToGraph")):
                web = "par"
            else:
                web = "ok"
    elif not lib_guards:
        # DX_NON_* で殺されていない → DxLib 本体コードがそのまま動く
        # (2D/Font Cache/3D/Input/File/Math/Camera/Light/Fog 等)
        sdl2 = "ok"
        web = "ok"
        # 一部はテクスチャ/深度バッファ依存で Web 差分あり
        if func.startswith(("GraphLock", "GraphUnlock",
                             "GetDrawScreenGraph",
                             "GetDrawStringPixelData")):
            web = "par"
    else:
        # lib で殺されており override もない
        if "DX_NON_MODEL" in lib_guards or func.startswith("MV1"):
            sdl2, web = "pen", "pen"
        elif "DX_NON_LIVE2D_CUBISM4" in lib_guards:
            sdl2, web = "pen", "pen"
        elif "DX_NON_MOVIE" in lib_guards:
            # Win 実装予定の Movie API は partial、それ以外 (AddMovieFrame 等) は no
            sdl2, web = "no", "no"
        elif "DX_NON_FILTER" in lib_guards:
            sdl2, web = "pen", "pen"
        elif "DX_NON_BULLET_PHYSICS" in lib_guards:
            sdl2, web = "pen", "pen"
        elif "DX_NON_INPUTSTRING" in lib_guards or "DX_NON_KEYEX" in lib_guards:
            sdl2, web = "no", "no"
        elif "DX_NON_TIFFREAD" in lib_guards or \
             "DX_NON_OGGVORBIS" in lib_guards or \
             "DX_NON_OGGTHEORA" in lib_guards or \
             "DX_NON_OPUS" in lib_guards:
            sdl2, web = "no", "no"
        else:
            sdl2, web = "no", "no"

    # Mask (CPU 側 ON、PF stub) は DxLib.h 上は DX_NON_MASK 配下でないことも。
    # lib 側で DX_NON_MASK を外しているので DxMask.cpp はコンパイル済。
    # 描画クリップ効果は未反映なので partial。
    if func.startswith(("CreateMaskScreen", "DeleteMaskScreen", "FillMaskScreen",
                         "SetUseMaskScreen", "GetValidMaskScreenFlag", "DrawMask",
                         "LoadMask", "LoadDivMask", "LoadBlendMask",
                         "CreateMaskFromGraph", "CreateMaskFromMem",
                         "CreateDivMaskFrom", "DeleteMask", "InitMask",
                         "CreateMaskScreenBlendMode", "BlendMaskScreen",
                         "SetUseMaskRestoreShift", "DefaultRestoreMask",
                         "SetValidMaskScreenGraphCreateFlag", "SetMaskReverseEffectFlag",
                         "CreateMaskFromBase")):
        if sdl2 == "ok":
            sdl2 = "par"
        if web == "ok":
            web = "par"

    # Shader API (Graphics_Hardware_Shader_*_PF は stub — fixed-function のみ)
    if func.startswith(("LoadVertexShader", "LoadPixelShader",
                         "LoadGeometryShader", "CreateVertexShader",
                         "CreatePixelShader", "SetUseVertexShader",
                         "SetUsePixelShader", "SetVSConstF",
                         "SetPSConstF", "SetVSConstV", "SetPSConstV",
                         "ResetVSConst", "ResetPSConst",
                         "CreateShaderConstantBuffer",
                         "DeleteShaderConstantBuffer",
                         "UpdateShaderConstantBuffer",
                         "SetShaderConstantBuffer",
                         "GetBufferShaderConstantBuffer",
                         "DrawPrimitive2DToShader",
                         "DrawPrimitive3DToShader",
                         "DrawPrimitiveIndexed2DToShader",
                         "DrawPrimitiveIndexed3DToShader",
                         "GetConstIndexToShader",
                         "InitShader", "DeleteShader")):
        sdl2, web = "pen", "pen"

    # Network (POSIX socket は lib で有効、但し未検証)
    if func.startswith(("ConnectNetWork", "CloseNetWork",
                         "NetWorkRecv", "NetWorkSend",
                         "GetNetWorkIPInfo", "CheckNetWorkRecv",
                         "GetNetWorkDataLength", "GetHostIPbyName",
                         "CreateUDPSocket", "DeleteUDPSocket",
                         "NetWorkSendUDP", "NetWorkRecvUDP",
                         "CheckNetWorkRecvUDP", "CheckNetWorkSendUDP",
                         "SetNetWorkCloseAfterLost",
                         "SetConnectTimeOutPeriodNetWork",
                         "ProcessNetMessage", "MakeIPAddress",
                         "GetLastNetworkError")):
        # Win は動く可能性高い、Mac/Linux SDL2 POSIX socket も動くはず (未検証 → par)
        if sdl2 == "ok":
            sdl2 = "par"
        web = "no"  # Web は WebSocket/WebRTC しかない

    # HTTP 関数 (DxLib.h に宣言あるが DxGateway.cpp でコメントアウト)
    if func.startswith(("ExecHttp", "GetHttp", "SetHttpTimeOut",
                         "CloseHttp", "GetHttpDownloadedBytes",
                         "GetHttpContentLength",
                         "CheckHttpDownload")):
        win = "no"
        ios, android = "no", "no"
        sdl2, web = "no", "no"

    # Clipboard (Win/Mac は対応可、SDL_SetClipboardText あり、未実装)
    if func in ("SetClipboardText", "GetClipboardText", "SetClipboardString",
                 "GetClipboardString"):
        ios, android = "na", "na"
        if sdl2 == "ok":
            sdl2 = "par"  # SDL_SetClipboardText 実装は未 wire up

    return (win, ios, android, sdl2, web)


# ---- 4. Render HTML --------------------------------------------------

BADGE = {
    "ok":  ('<span class="badge b-ok">✓</span>',  "#107f3e"),
    "par": ('<span class="badge b-par">△</span>', "#a07500"),
    "pen": ('<span class="badge b-pen">⏳</span>', "#b36b00"),
    "no":  ('<span class="badge b-no">×</span>',  "#b03030"),
    "na":  ('<span class="badge b-na">—</span>',  "#9a9a9a"),
}


HTML_HEAD = """<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>hsp3dx DxLib 関数対応マトリクス (全 %(total)d 関数)</title>
<style>
:root { --bg:#fafafa; --fg:#222; --muted:#777; --accent:#2b6cb0; --border:#d0d0d0; --row-alt:#f1f5f9; }
* { box-sizing: border-box; }
body { margin:0; padding:24px; font-family:"Hiragino Kaku Gothic ProN","Yu Gothic","Meiryo",sans-serif; background:var(--bg); color:var(--fg); line-height:1.5; }
h1 { font-size:22px; margin:0 0 4px; }
h2 { font-size:16px; margin:22px 0 6px; padding-bottom:3px; border-bottom:2px solid var(--accent); color:var(--accent); }
.meta { color:var(--muted); font-size:13px; margin-bottom:16px; }
.legend { background:#fff; border:1px solid var(--border); border-radius:6px; padding:10px 14px; margin-bottom:14px; font-size:13px; }
.legend span { display:inline-block; margin-right:14px; }
.badge { display:inline-block; width:22px; text-align:center; font-weight:600; border-radius:3px; font-size:12px; padding:1px 0; }
.b-ok  { background:#d9f1e1; color:#107f3e; }
.b-par { background:#fff4d0; color:#a07500; }
.b-pen { background:#ffe1c2; color:#b36b00; }
.b-no  { background:#fddada; color:#b03030; }
.b-na  { background:#e8e8e8; color:#9a9a9a; }
table { border-collapse:collapse; width:100%%; margin:6px 0 18px; font-size:12.5px; background:#fff; }
th, td { border:1px solid var(--border); padding:3px 6px; text-align:left; }
th { background:#eef2f7; font-weight:600; color:#333; }
tr:nth-child(even) { background:var(--row-alt); }
td.c { text-align:center; }
td.fn { font-family:"Consolas","Menlo",monospace; font-size:11.5px; white-space:nowrap; }
.sum { background:#fff; border:1px solid var(--border); border-radius:6px; padding:10px 14px; margin-bottom:14px; font-size:13px; }
.toc { background:#fff; border:1px solid var(--border); border-radius:6px; padding:8px 14px; margin-bottom:14px; font-size:12.5px; column-count:3; }
.toc a { color:var(--accent); text-decoration:none; display:block; }
.toc a:hover { text-decoration:underline; }
</style>
</head>
<body>
<h1>hsp3dx DxLib 関数対応マトリクス (全 %(total)d 関数)</h1>
<p class="meta">自動生成: <code>tools/gen_porting_status_detail.py</code> &nbsp;|&nbsp;
ソース解析: <code>dxlib_portable/DxLib.h</code> (2466 extern 宣言) + <code>Desktop/*.cpp</code> (実装集合) &nbsp;|&nbsp;
概観版: <a href="PORTING_STATUS.html">PORTING_STATUS.html</a></p>
<div class="sum">
<strong>列の意味:</strong>
Win = DxLib 本家 Windows (D3D11) / iOS = DxLib 本家 iOS (GLES) / Android = DxLib 本家 Android (GLES) /
SDL2 = 本 fork (Win/Mac/Linux Desktop, SDL2+GL compat) / Web = 本 fork (emscripten WebGL)。<br>
判定ルール: 関数名が <code>Desktop/*.cpp</code> で直接定義されていれば SDL2=✓。
Movie/MV1 等は個別にフォールバック判定。Web は emscripten 個別制約で一部 △。
</div>
<div class="legend">
<strong>凡例:</strong>
<span><span class="badge b-ok">✓</span> 実装済</span>
<span><span class="badge b-par">△</span> 部分実装 / 制限あり</span>
<span><span class="badge b-pen">⏳</span> pending (大規模工数)</span>
<span><span class="badge b-no">×</span> 未実装</span>
<span><span class="badge b-na">—</span> 対象外</span>
</div>
"""

HTML_TAIL = """</body>
</html>
"""


def main():
    sections = parse_dxlib_h(DXLIB_H)
    impl, stubs = scan_desktop()

    total = sum(len(fs) for _, fs in sections)
    stat_counts = {"ok": 0, "par": 0, "pen": 0, "no": 0, "na": 0}
    for _, fs in sections:
        for (f, guards) in fs:
            _, _, _, sdl2, _ = classify(f, guards, impl, stubs)
            stat_counts[sdl2] = stat_counts.get(sdl2, 0) + 1

    out = []
    out.append(HTML_HEAD % {"total": total})

    # Summary bar
    out.append('<div class="sum"><strong>SDL2 fork 集計:</strong> ')
    for k, label in [("ok", "✓ 実装済"), ("par", "△ 部分"),
                      ("pen", "⏳ pending"), ("no", "× 未"), ("na", "— 対象外")]:
        out.append(f'<span style="margin-right:12px">{label}: <strong>{stat_counts.get(k,0)}</strong></span>')
    out.append(f' / 全 {total} 関数</div>')

    # TOC
    out.append('<div class="toc">')
    for i, (name, fs) in enumerate(sections):
        if not fs:
            continue
        out.append(f'<a href="#sec{i}">{html.escape(name)} ({len(fs)})</a>')
    out.append('</div>')

    # Tables
    for i, (name, fs) in enumerate(sections):
        if not fs:
            continue
        out.append(f'<h2 id="sec{i}">{html.escape(name)} <span style="color:#888;font-weight:normal">({len(fs)} 関数)</span></h2>')
        out.append('<table>')
        out.append('<tr><th>関数名</th><th class="c">Win</th><th class="c">iOS</th><th class="c">Android</th><th class="c">SDL2<br>(Win/Mac/Linux)</th><th class="c">Web</th></tr>')
        for (f, guards) in fs:
            w, ios, an, sd, wb = classify(f, guards, impl, stubs)
            out.append(
                '<tr>'
                f'<td class="fn">{html.escape(f)}</td>'
                f'<td class="c">{BADGE[w][0]}</td>'
                f'<td class="c">{BADGE[ios][0]}</td>'
                f'<td class="c">{BADGE[an][0]}</td>'
                f'<td class="c">{BADGE[sd][0]}</td>'
                f'<td class="c">{BADGE[wb][0]}</td>'
                '</tr>'
            )
        out.append('</table>')

    out.append(HTML_TAIL)

    with open(OUT_HTML, "w", encoding="utf-8") as f:
        f.write("".join(out))
    print(f"[gen_porting_status_detail] wrote {OUT_HTML} ({total} functions, "
          f"ok={stat_counts.get('ok',0)} par={stat_counts.get('par',0)} "
          f"pen={stat_counts.get('pen',0)} no={stat_counts.get('no',0)} "
          f"na={stat_counts.get('na',0)})")


if __name__ == "__main__":
    main()
