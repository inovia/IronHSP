#!/usr/bin/env python3
"""Merge translate_chunks/*.ja.json into docs_ja.json for the COM bridge."""
from __future__ import annotations
import json
from pathlib import Path

BRIDGE = Path(__file__).parent
CHUNKS_DIR = BRIDGE / "translate_chunks"
DOCS_JA = BRIDGE / "docs_ja.json"
DOCS_EN = BRIDGE / "docs_en.json"

en = json.loads(DOCS_EN.read_text(encoding="utf-8"))
ja = json.loads(DOCS_JA.read_text(encoding="utf-8")) if DOCS_JA.exists() else {}
before = len(ja)

per_chunk: list[tuple[str, int]] = []
for f in sorted(CHUNKS_DIR.glob("*.ja.json")):
    try:
        data = json.loads(f.read_text(encoding="utf-8"))
    except Exception as e:
        print(f"[skip] {f.name}: {e}")
        continue
    added = 0
    for k, v in data.items():
        if not isinstance(v, str) or not v.strip():
            continue
        if k not in ja:
            added += 1
        ja[k] = v
    per_chunk.append((f.name, added))

DOCS_JA.write_text(
    json.dumps(ja, indent=2, ensure_ascii=False, sort_keys=True),
    encoding="utf-8",
)

after = len(ja)
print(f"docs_ja.json: {before} -> {after}  (+{after - before})")
print(f"docs_en.json: {len(en)}, missing: {len(set(en) - set(ja))}")
print()
for name, n in per_chunk:
    print(f"  {name:40} +{n}")
