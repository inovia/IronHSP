#!/usr/bin/env python3
"""
audit_samples.py - IronHSP 内の .as / .hsp を一括検証する監査スクリプト

Usage:
    python tools/scripts/audit_samples.py [--phase as|hsp|all] [--timeout <sec>]
                                          [--out <report.md>]

Phase A (.as 検証):
  package/win32/common/*.as について、各 .as を単体で #include した
  スタブ .hsp を作って hspcmp64 でコンパイルできるかを確認する。
  .as は単体実行できないので compile-only のみ。

Phase B (.hsp 検証):
  package/win32/sample/**/*.hsp を再帰検索し、各スクリプトを
  hspcmp64 でコンパイル → hsp3cl_net_test_64 で短いタイムアウト付き実行。

結果は Markdown レポートで出力。
"""
import argparse
import concurrent.futures as cf
import datetime
import json
import os
import pathlib
import re
import shutil
import subprocess
import sys
import tempfile
from collections import Counter

ROOT = pathlib.Path(__file__).resolve().parents[2]  # IronHSP_2026/

# ---- 実行ファイル配置 ----
RUNNER   = ROOT / "package/win32/iron_test_runner.exe"
HSPCMP   = ROOT / "temp/hspcmp64.exe"
RUNTIME  = ROOT / "temp/hsp3cl_net_test_64.exe"
COMPATH  = ROOT / "package/win32/common"


def parse_runner_output(text):
    """iron_test_runner の 1 件分の行 [TAG] path ... を解析して (tag, detail) を返す"""
    for line in text.splitlines():
        m = re.match(r"^\[(\w+\s*)\]\s+(\S+)\s+cases:(\d+)\s+pass:(\d+)\s+fail:(\d+)\s+\((\d+)ms\)", line.strip())
        if m:
            return {
                "tag":      m.group(1).strip(),
                "file":     m.group(2),
                "cases":    int(m.group(3)),
                "pass":     int(m.group(4)),
                "fail":     int(m.group(5)),
                "ms":       int(m.group(6)),
            }
    return None


def run_one(hsp_path, *, compile_only=False, timeout_sec=3, extra_compath=None):
    """iron_test_runner を 1 ファイルに対して実行し、結果を辞書で返す"""
    # --compath は絶対パス + 末尾スラッシュが必要 (HSP コンパイラの仕様)
    cpath = str(pathlib.Path(extra_compath or COMPATH).resolve()).replace("\\", "/")
    if not cpath.endswith("/"):
        cpath += "/"

    cmd = [
        str(RUNNER),
        f"--compiler={HSPCMP}",
        f"--runtime={RUNTIME}",
        f"--compath={cpath}",
        # --quiet は付けない (CERR 時の error 詳細を stdout で取りたい)
        "--no-color",
    ]
    if compile_only:
        cmd.append("--compile-only")
    else:
        cmd.append(f"--timeout={timeout_sec}")
    cmd.append(str(hsp_path))

    proc = subprocess.run(cmd, capture_output=True, text=True,
                          encoding="utf-8", errors="replace",
                          timeout=timeout_sec + 30)
    parsed = parse_runner_output(proc.stdout)
    if not parsed:
        return {
            "tag":    "UNKNOWN",
            "file":   hsp_path.name,
            "cases": 0, "pass": 0, "fail": 0, "ms": 0,
            "stdout": proc.stdout[-500:],
            "stderr": proc.stderr[-500:],
        }
    parsed["stdout"] = proc.stdout[-500:]
    parsed["stderr"] = proc.stderr[-500:]
    parsed["src"] = str(hsp_path)
    return parsed


def audit_as_files(max_workers=4):
    """Phase A: .as ファイルごとにスタブ .hsp を作って compile-only で検査"""
    as_dir = ROOT / "package/win32/common"
    # ランタイム固有 .as は単体コンパイル不可 (hgimg3/hgimg4 runtime が
    # プリロード済の前提で #cmd が書かれている)。audit 対象から除外。
    EXCLUDE = {
        "hgimg3.as",        # hgimg3 runtime 専用 (command table)
        "mod_gputil.as",    # hgimg3/hgimg4 用ユーティリティ
        "gpposteffect.as",  # hgimg4 runtime 専用
    }
    as_files = sorted(p for p in as_dir.glob("*.as") if p.name not in EXCLUDE)
    print(f"[Phase A] {len(as_files)} .as files under {as_dir.relative_to(ROOT)}")

    # tempdir で各 stub を作成
    tmpdir = ROOT / "temp/_audit_as"
    tmpdir.mkdir(parents=True, exist_ok=True)

    # 安定した依存解決のため compath はオリジナルディレクトリを指す
    results = []

    # ランタイム系の .as は他のランタイム .as を include しては衝突する (_HSP64 二重定義など)
    RUNTIME_AS = {
        "hsp3.as", "hsp3cl.as", "hsp3_64.as", "hsp3cl_64.as",
        "hsp3_net.as", "hsp3cl_net.as", "hsp3_net_64.as", "hsp3cl_net_64.as",
    }

    def worker(as_path):
        name = as_path.stem
        stub = tmpdir / f"check_{name}.hsp"
        if as_path.name in RUNTIME_AS:
            # ランタイム .as は単独 include
            stub.write_text(
                f'#include "{as_path.name}"\n'
                f'stop\n',
                encoding="utf-8"
            )
        else:
            # 一般 .as: 64bit ランタイムコンテキストを用意してから include
            stub.write_text(
                f'#include "hsp3cl_net_64.as"\n'
                f'#include "{as_path.name}"\n'
                f'stop\n',
                encoding="utf-8"
            )
        r = run_one(stub, compile_only=True, extra_compath=as_dir)
        r["as_file"] = as_path.name
        return r

    with cf.ThreadPoolExecutor(max_workers=max_workers) as pool:
        for i, r in enumerate(pool.map(worker, as_files), 1):
            results.append(r)
            print(f"  [{i:3}/{len(as_files)}] [{r['tag']:<4}] {r['as_file']}")

    return results


def audit_hsp_samples(max_workers=4, timeout_sec=3):
    """Phase B: package/win32/sample/**/*.hsp を再帰的にコンパイル+短時間実行"""
    sample_root = ROOT / "package/win32/sample"
    all_files = sorted(sample_root.rglob("*.hsp"))
    print(f"[Phase B] {len(all_files)} .hsp samples under {sample_root.relative_to(ROOT)}")

    results = []

    def worker(hsp_path):
        r = run_one(hsp_path, compile_only=False, timeout_sec=timeout_sec)
        r["rel"] = str(hsp_path.relative_to(ROOT))
        return r

    with cf.ThreadPoolExecutor(max_workers=max_workers) as pool:
        for i, r in enumerate(pool.map(worker, all_files), 1):
            results.append(r)
            if i % 25 == 0 or r["tag"] in ("ERR", "CERR"):
                print(f"  [{i:3}/{len(all_files)}] [{r['tag']:<4}] {r.get('rel', r['file'])}")

    return results


def summarize(results, title):
    buckets = {}
    for r in results:
        buckets.setdefault(r["tag"], []).append(r)
    return buckets


def write_markdown_report(as_results, hsp_results, out_path):
    now = datetime.datetime.now().isoformat(timespec="seconds")
    lines = []
    lines.append(f"# IronHSP サンプル/.as 自動テスト監査レポート")
    lines.append("")
    lines.append(f"生成日時: {now}")
    lines.append("")

    def write_section(title, results):
        lines.append(f"## {title}")
        lines.append("")
        buckets = summarize(results, title)
        total = len(results)
        lines.append(f"総数: **{total}** 件")
        lines.append("")

        # 上位エラー原因のグループ集計
        cause_counts = Counter()
        for r in results:
            if r['tag'] not in ('CERR', 'ERR', 'UNKNOWN'):
                continue
            text = (r.get('stdout') or '') + '\n' + (r.get('stderr') or '')
            for line in text.splitlines():
                s = line.strip()
                if s.startswith('#Error:') or 'error code=' in s:
                    if '重大' in s or '\uFFFD' in s:
                        continue
                    s = re.sub(r'\[[^\]]+\.(as|hsp)\]', '[...]', s)
                    s = re.sub(r'\bline[ =]\d+', 'line=N', s)
                    s = re.sub(r'file=[^\s"]+', 'file=...', s)
                    cause_counts[s[:140]] += 1
                    break
        if cause_counts:
            lines.append("### 上位エラー原因 (グループ集計)")
            lines.append("")
            lines.append("| 件数 | 代表メッセージ |")
            lines.append("|---:|---|")
            for cause, n in cause_counts.most_common(15):
                lines.append(f"| {n} | `{cause.replace('|','\\|')}` |")
            lines.append("")
        # 集計表
        lines.append("| 状態 | 件数 | 説明 |")
        lines.append("|---|---:|---|")
        tag_desc = {
            "PASS":  "正常終了 (exit=0)",
            "CMP ":  "コンパイル成功 (実行スキップ)",
            "FAIL":  "expect 失敗",
            "ERR ":  "ランタイムエラー",
            "CERR":  "コンパイルエラー",
            "TIMO":  "タイムアウト (GUI/waitループ等)",
            "UNKNOWN": "runner 出力を解析できず",
        }
        for tag in sorted(buckets.keys()):
            n = len(buckets[tag])
            lines.append(f"| `{tag}` | {n} | {tag_desc.get(tag, '-')}|")
        lines.append("")

        # 失敗ケース (CERR / ERR) の詳細を列挙
        for tag in ("CERR", "ERR", "UNKNOWN"):
            failed = buckets.get(tag, [])
            if not failed:
                continue
            lines.append(f"### {tag} 詳細 ({len(failed)} 件)")
            lines.append("")
            lines.append("<details><summary>クリックして展開</summary>")
            lines.append("")
            lines.append("| ファイル | 原因 |")
            lines.append("|---|---|")
            for r in failed[:300]:
                path = r.get("rel") or r.get("as_file") or r["file"]
                # 代表的なエラー行を抽出 (hspcmp の "#Error: xxx" か runner の "error code=X ...")
                text = (r.get("stdout") or "") + "\n" + (r.get("stderr") or "")
                cause = ""
                for line in text.splitlines():
                    s = line.strip()
                    if s.startswith("#Error:") or s.startswith("error code=") or " error " in s:
                        # ノイズ除去: 重大エラー文言や CRLF 文字化けは捨てる
                        if "重大" in s or "�d��" in s:
                            continue
                        cause = s[:180].replace("|", "\\|")
                        break
                if not cause:
                    # fallback: 最初の非空行
                    for line in text.splitlines():
                        s = line.strip()
                        if s and not s.startswith("[") and not s.startswith("-") and not s.startswith("files:") and not s.startswith("tests:"):
                            cause = s[:180].replace("|", "\\|")
                            break
                lines.append(f"| `{path}` | {cause} |")
            if len(failed) > 300:
                lines.append(f"| ... | ({len(failed) - 300} 件省略) |")
            lines.append("")
            lines.append("</details>")
            lines.append("")

    if as_results is not None:
        write_section("Phase A — .as ファイル (compile-only)", as_results)
    if hsp_results is not None:
        write_section("Phase B — サンプル .hsp (compile + short-timeout run)", hsp_results)

    out_path.write_text("\n".join(lines), encoding="utf-8")
    print(f"\nReport written: {out_path}")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--phase", choices=["as", "hsp", "all"], default="all")
    ap.add_argument("--timeout", type=int, default=3, help="per-.hsp timeout (sec)")
    ap.add_argument("--jobs", type=int, default=4)
    ap.add_argument("--out", type=pathlib.Path,
                    default=ROOT / "temp/audit_report.md")
    args = ap.parse_args()

    # 環境チェック
    for p in (RUNNER, HSPCMP, RUNTIME):
        if not p.exists():
            print(f"missing: {p}", file=sys.stderr)
            sys.exit(2)

    as_results  = audit_as_files(max_workers=args.jobs) if args.phase in ("as",  "all") else None
    hsp_results = audit_hsp_samples(max_workers=args.jobs,
                                    timeout_sec=args.timeout) if args.phase in ("hsp", "all") else None

    write_markdown_report(as_results, hsp_results, args.out)

    # 機械可読な JSON もついでに
    json_path = args.out.with_suffix(".json")
    json_path.write_text(json.dumps({
        "as":  as_results or [],
        "hsp": hsp_results or [],
    }, ensure_ascii=False, indent=2), encoding="utf-8")
    print(f"JSON   written: {json_path}")


if __name__ == "__main__":
    main()
