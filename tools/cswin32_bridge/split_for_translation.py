#!/usr/bin/env python3
"""Split docs_en.json into per-DLL / per-chunk JSON files for parallel
translation by subagents.

Each chunk is a flat dict { key: english_text } that an LLM can read,
translate inline, and write back as { key: japanese_text }. The main
thread merges all per-chunk JA files into docs_ja.json at the end.

Output: tools/cswin32_bridge/translate_chunks/<dll>_<letter>.json
        and a translate_chunks/index.json listing chunks + counts.
"""

from __future__ import annotations
import json
import re
from pathlib import Path
from collections import defaultdict

BRIDGE = Path(__file__).parent
COMMON = Path(__file__).resolve().parents[2] / "package" / "win32" / "common"
EN = json.loads((BRIDGE / "docs_en.json").read_text(encoding="utf-8"))
JA = json.loads((BRIDGE / "docs_ja.json").read_text(encoding="utf-8"))
missing = {k: v for k, v in EN.items() if k not in JA}

# Build func → dll lookup from the regenerated .as files.
func_to_dll: dict[str, str] = {}
for f in COMMON.glob("*_gen2.as"):
    if f.name == "win32_types_gen2.as":
        continue
    dll = f.stem.replace("_gen2", "")
    for line in f.read_text(encoding="cp932", errors="replace").splitlines():
        m = re.match(r"#(?:cfunc|func)(?:\s+global)?\s+(\w+)\s+\"(\w+)\"", line)
        if m:
            func_to_dll[m.group(1)] = dll
            func_to_dll[m.group(2)] = dll

# Group missing entries by DLL (or "structs" / "other").
buckets: dict[str, dict[str, str]] = defaultdict(dict)
for key, val in missing.items():
    parts = key.split("::")
    if parts[0] == "struct":
        buckets["structs"][key] = val
    elif parts[0] == "func":
        dll = func_to_dll.get(parts[1], "other")
        buckets[dll][key] = val
    else:
        buckets["other"][key] = val

# Split big DLL buckets into ~700-entry sub-chunks alphabetically.
CHUNK_TARGET = 700
out_dir = BRIDGE / "translate_chunks"
out_dir.mkdir(exist_ok=True)
# Wipe old chunks
for old in out_dir.glob("*.json"):
    old.unlink()

index: list[dict] = []
for dll, entries in sorted(buckets.items()):
    items = sorted(entries.items())
    if len(items) <= CHUNK_TARGET:
        chunks = [items]
    else:
        n_chunks = (len(items) + CHUNK_TARGET - 1) // CHUNK_TARGET
        size = (len(items) + n_chunks - 1) // n_chunks
        chunks = [items[i:i + size] for i in range(0, len(items), size)]
    for i, chunk in enumerate(chunks):
        suffix = "" if len(chunks) == 1 else f"_{chr(ord('a') + i)}"
        name = f"{dll}{suffix}.json"
        path = out_dir / name
        path.write_text(
            json.dumps(dict(chunk), indent=2, ensure_ascii=False),
            encoding="utf-8",
        )
        index.append({"file": name, "dll": dll, "count": len(chunk)})

(out_dir / "index.json").write_text(
    json.dumps(index, indent=2, ensure_ascii=False), encoding="utf-8")

print(f"missing total: {len(missing)}")
print(f"chunks: {len(index)}")
print(f"{'file':40} {'count':>7}")
for entry in index:
    print(f"{entry['file']:40} {entry['count']:>7}")
