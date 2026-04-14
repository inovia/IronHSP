#!/usr/bin/env python3
"""Split COM docs_en.json into per-interface chunks for sequential translation.

Same pattern as the main bridge's split_for_translation.py: filters entries
that aren't already in docs_ja.json, groups by interface name, and splits
big buckets into ~600-entry sub-chunks alphabetically.

Output: tools/cswin32_bridge_com/translate_chunks/<interface>[_letter].json
"""

from __future__ import annotations
import json
from pathlib import Path
from collections import defaultdict

BRIDGE = Path(__file__).parent
EN = json.loads((BRIDGE / "docs_en.json").read_text(encoding="utf-8"))
JA_PATH = BRIDGE / "docs_ja.json"
JA = json.loads(JA_PATH.read_text(encoding="utf-8")) if JA_PATH.exists() else {}
missing = {k: v for k, v in EN.items() if k not in JA}

# Group missing entries by interface (key format: com::IFACE::METHOD::FIELD)
buckets: dict[str, dict[str, str]] = defaultdict(dict)
for key, val in missing.items():
    parts = key.split("::")
    if parts[0] == "com" and len(parts) >= 2:
        buckets[parts[1]][key] = val
    else:
        buckets["other"][key] = val

# Sort by entry count descending so we know what's biggest
sizes = sorted(((name, len(d)) for name, d in buckets.items()),
               key=lambda x: -x[1])

# Combine very small interfaces (<150 entries) into mixed chunks of ~500
CHUNK_TARGET = 500
out_dir = BRIDGE / "translate_chunks"
out_dir.mkdir(exist_ok=True)
for old in out_dir.glob("*.json"):
    old.unlink()

# Big ones get split alphabetically
def split_chunks(items: list[tuple[str, str]], target: int):
    if len(items) <= target:
        return [items]
    n = (len(items) + target - 1) // target
    size = (len(items) + n - 1) // n
    return [items[i:i + size] for i in range(0, len(items), size)]

written: list[tuple[str, int]] = []
small_buf: list[tuple[str, str]] = []
small_idx = 0

for name, count in sizes:
    items = sorted(buckets[name].items())
    if count >= 150:
        # Split into ~500-entry chunks
        chunks = split_chunks(items, CHUNK_TARGET)
        for i, chunk in enumerate(chunks):
            suffix = "" if len(chunks) == 1 else f"_{chr(ord('a') + i)}"
            fname = f"{name}{suffix}.json"
            (out_dir / fname).write_text(
                json.dumps(dict(chunk), indent=2, ensure_ascii=False),
                encoding="utf-8",
            )
            written.append((fname, len(chunk)))
    else:
        # Accumulate into mixed bucket
        small_buf.extend(items)
        if len(small_buf) >= CHUNK_TARGET:
            fname = f"_mixed_{small_idx:02d}.json"
            (out_dir / fname).write_text(
                json.dumps(dict(small_buf), indent=2, ensure_ascii=False),
                encoding="utf-8",
            )
            written.append((fname, len(small_buf)))
            small_buf = []
            small_idx += 1

# Flush remainder
if small_buf:
    fname = f"_mixed_{small_idx:02d}.json"
    (out_dir / fname).write_text(
        json.dumps(dict(small_buf), indent=2, ensure_ascii=False),
        encoding="utf-8",
    )
    written.append((fname, len(small_buf)))

total = sum(n for _, n in written)
print(f"missing total: {len(missing)}")
print(f"chunks: {len(written)}")
print(f"total entries in chunks: {total}")
for name, n in written:
    print(f"  {name:40} {n:5}")
