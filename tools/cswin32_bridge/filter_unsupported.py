#!/usr/bin/env python3
"""
filter_unsupported.py

Reads build.log from a CsWin32 Win32Gen build and comments out
NativeMethods.txt entries that are not supported by win32metadata.

Handled diagnostic codes:
  PInvoke001 - Method, type or constant "X" not found
  PInvoke003 - This API will not be generated. Use X instead.
  PInvoke005 - AnyCPU-incompatible signatures
  CS8785     - Ambiguous method names (generator throws ArgumentException)

Unsupported names are replaced with
  // removed: <reason>: <name>
so the original file history remains auditable in-place.

Usage:  python filter_unsupported.py
"""
import re
import sys
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).parent
NM = ROOT / "NativeMethods.txt"
LOG = ROOT / "build.log"

# Regexes for the diagnostic messages CsWin32 emits.
RE_P001 = re.compile(r'PInvoke001.*?"([^"]+)" not found')
RE_P003 = re.compile(r'PInvoke003.*?API\s+"?([A-Za-z_][A-Za-z0-9_]*)"?\s+will not be generated')
# PInvoke005 doesn't quote the name in the message — it only references a line
# number in NativeMethods.txt. We capture (line_number).
RE_P005_LINE = re.compile(r'NativeMethods\.txt\((\d+),\d+\):\s*warning\s+PInvoke005')
# CS8785 ambiguous: "The method name is ambiguous. ... Possible matches: NS1.OpenMutexW, NS2.OpenMutexA"
RE_AMBIG = re.compile(r'The method name is ambiguous.*?Possible matches:\s*([^\'\]]+)')

def load_log():
    if not LOG.exists():
        sys.exit(f"build.log not found at {LOG}")
    return LOG.read_text(encoding="utf-8", errors="replace")

def collect_unsupported(log: str, lines: list[str] = None):
    """Return dict name -> reason string. PInvoke005 needs the NativeMethods.txt
    file lines to look up names by line number."""
    bad = {}
    for m in RE_P001.finditer(log):
        bad.setdefault(m.group(1), "not in win32metadata")
    for m in RE_P003.finditer(log):
        bad.setdefault(m.group(1), "PInvoke003 deprecated/redirected")
    if lines is not None:
        for m in RE_P005_LINE.finditer(log):
            ln = int(m.group(1))
            if 1 <= ln <= len(lines):
                name = lines[ln - 1].strip()
                if name and not name.startswith("//"):
                    bad.setdefault(name, "PInvoke005 AnyCPU incompatible")
    for m in RE_AMBIG.finditer(log):
        matches = m.group(1)
        # Extract short names, e.g. "Windows.Win32.System.Threading.OpenMutexW"
        for full in re.findall(r'[A-Za-z_][A-Za-z0-9_\.]*', matches):
            short = full.rsplit('.', 1)[-1]
            # Strip trailing A/W to get the base name as stored in NativeMethods.txt
            base = re.sub(r'[AW]$', '', short)
            bad.setdefault(base, "CS8785 ambiguous across namespaces")
            bad.setdefault(short, "CS8785 ambiguous across namespaces")
    return bad

def filter_file(bad: dict):
    lines = NM.read_text(encoding="utf-8").splitlines()
    out = []
    current_dll = "<unknown>"
    removed_by_dll = defaultdict(int)
    dll_header = re.compile(r'^//\s*===\s*([a-zA-Z0-9_]+\.dll)')
    for line in lines:
        hm = dll_header.match(line)
        if hm:
            current_dll = hm.group(1)
            out.append(line)
            continue
        stripped = line.strip()
        if not stripped or stripped.startswith("//"):
            out.append(line)
            continue
        # stripped is a bare API name (possibly with leading whitespace)
        name = stripped
        if name in bad:
            out.append(f"// removed: {bad[name]}: {name}")
            removed_by_dll[current_dll] += 1
        else:
            out.append(line)
    NM.write_text("\n".join(out) + "\n", encoding="utf-8")
    return removed_by_dll

def main():
    log = load_log()
    nm_lines = NM.read_text(encoding="utf-8").splitlines()
    bad = collect_unsupported(log, nm_lines)
    print(f"Collected {len(bad)} unsupported name(s) from build.log")
    if not bad:
        return
    removed = filter_file(bad)
    total = sum(removed.values())
    print(f"Commented out {total} line(s) in NativeMethods.txt")
    for dll, n in sorted(removed.items(), key=lambda x: -x[1]):
        print(f"  {dll:20s} -{n}")

if __name__ == "__main__":
    main()
