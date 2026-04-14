#!/usr/bin/env python3
"""Merge all *.ja.json files from translate_chunks/ into docs_ja.json,
preserving any existing translations.

Usage:
    python merge_translations.py
"""
from __future__ import annotations
import json
from pathlib import Path

BRIDGE = Path(__file__).parent
CHUNKS_DIR = BRIDGE / "translate_chunks"
DOCS_JA = BRIDGE / "docs_ja.json"
DOCS_EN = BRIDGE / "docs_en.json"


def main() -> int:
    en = json.loads(DOCS_EN.read_text(encoding="utf-8"))
    ja = json.loads(DOCS_JA.read_text(encoding="utf-8")) if DOCS_JA.exists() else {}
    before = len(ja)

    chunks_loaded = 0
    chunks_skipped = 0
    new_total = 0
    overwritten = 0
    per_chunk: list[tuple[str, int]] = []
    for f in sorted(CHUNKS_DIR.glob("*.ja.json")):
        try:
            data = json.loads(f.read_text(encoding="utf-8"))
        except Exception as e:
            print(f"[skip] {f.name}: {e}")
            chunks_skipped += 1
            continue
        added = 0
        for k, v in data.items():
            if not isinstance(v, str) or not v.strip():
                continue
            if k in ja:
                if ja[k] != v:
                    overwritten += 1
            else:
                added += 1
            ja[k] = v
        per_chunk.append((f.name, added))
        new_total += added
        chunks_loaded += 1

    DOCS_JA.write_text(
        json.dumps(ja, indent=2, ensure_ascii=False, sort_keys=True),
        encoding="utf-8",
    )

    after = len(ja)
    print(f"chunks loaded: {chunks_loaded}  skipped: {chunks_skipped}")
    print(f"docs_ja.json: {before} -> {after}  (+{after - before})")
    print(f"new entries: {new_total}, overwritten: {overwritten}")
    print(f"docs_en.json: {len(en)}, missing now: {len(set(en) - set(ja))}")
    print(f"\nper-chunk new entries:")
    for name, n in per_chunk:
        print(f"  {name:50} +{n}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
