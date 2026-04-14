#!/usr/bin/env python3
"""Run dumpbin /exports on a list of system DLLs, extract function names,
strip ANSI/Unicode suffixes to get the canonical base names, dedupe, and
emit a NativeMethods.txt section for each DLL.

This is the systematic approach to NativeMethods.txt expansion: we list
EVERY exported function in the actual system DLL and let CsWin32 tell us
which ones are not in win32metadata (those get commented out after the
build pass).
"""

from __future__ import annotations
import re
import subprocess
import sys
from pathlib import Path

DUMPBIN = (
    r"C:\Program Files\Microsoft Visual Studio\2022\Community"
    r"\VC\Tools\MSVC\14.44.35207\bin\Hostx64\x64\dumpbin.exe"
)
SYSTEM32 = Path(r"C:\Windows\System32")
TARGET_DLLS = [
    "kernel32",
    "user32",
    "gdi32",
    "shell32",
    "advapi32",
    "comctl32",
    "comdlg32",
    "ole32",
    "oleaut32",
    "dwmapi",
    "msimg32",
    "winmm",
    "psapi",
    "version",
    "imm32",
    "uxtheme",
    "wininet",
    "winhttp",
    "crypt32",
    "bcrypt",
    "dbghelp",
    "userenv",
    "netapi32",
    # Phase E: networking / DirectX entry points / utility DLLs
    "ws2_32",       # Winsock 2 (socket / bind / connect / send / recv / etc.)
    "iphlpapi",     # IP Helper API (GetAdaptersAddresses / GetIfTable / etc.)
    "urlmon",       # URLDownloadToFile / IBindStatusCallback
    "d2d1",         # Direct2D entry points (D2D1CreateFactory)
    "dwrite",       # DirectWrite entry points (DWriteCreateFactory)
    "windowscodecs",# WIC entry points
    "dxgi",         # DXGI entry points (CreateDXGIFactory)
    "d3d11",        # Direct3D 11 entry points (D3D11CreateDevice)
    "xaudio2_9",    # XAudio2 (XAudio2Create)
    "dinput8",      # DirectInput 8 (DirectInput8Create)
    "secur32",      # Security Support Provider (SSPI)
    # Phase F: graphics / web server / xml / opengl / multimedia
    "gdiplus",      # GDI+ (high-level 2D graphics, image codecs, font rendering)
    "opengl32",     # OpenGL (wgl* + GL 1.1 functions)
    "glu32",        # GLU utility (gluPerspective / gluLookAt etc.)
    "httpapi",      # HTTP Server API (kernel-mode HTTP.sys)
    "xmllite",      # XmlLite (CreateXmlReader / CreateXmlWriter — fast XML)
    "wlanapi",      # Wireless LAN API
    "wer",          # Windows Error Reporting
    "powrprof",     # Power Profile (battery, sleep, hibernate)
    "wtsapi32",     # Terminal Services / session info
]

# Names matching these patterns are filtered out: clearly internal helpers,
# private workers, undocumented forwards. Win32 conventions: capital first
# letter for public API, except for some legacy conventions (lstr*, time*,
# wave*, midi*, mci*, mmio*, joy*, sndPlay*, aux*, mixer*).
LEGACY_LOWER_PREFIXES = (
    "lstr", "time", "wave", "midi", "mci", "mmio", "joy", "snd", "aux",
    "mixer", "sndPlay", "Reg",   # Reg is uppercase, not needed but included
    "gl", "wgl", "glu",          # OpenGL / GLU lower-case convention
)

EXCLUDE_SUFFIXES = ("Worker", "Internal", "Stub")
EXCLUDE_PREFIXES = (
    "uaw_",         # user assistance workers
    "Base",         # internal Base* helpers
    "Wow64",        # WoW64 internals (most are internal)
    "Pss",          # process snapshot internals (some public exist; we keep public via win32metadata)
    "_",            # underscore-prefixed internals
)
EXCLUDE_EXACT = {
    "DllMain", "DllRegisterServer", "DllUnregisterServer",
    "DllCanUnloadNow", "DllGetClassObject", "DllInstall",
}


def is_publicish(name: str) -> bool:
    """Heuristic: keep names that look like documented public Win32 APIs."""
    if name in EXCLUDE_EXACT:
        return False
    if name.startswith(EXCLUDE_PREFIXES):
        return False
    for suf in EXCLUDE_SUFFIXES:
        if name.endswith(suf):
            return False
    # First char rules
    c0 = name[0]
    if c0.islower():
        if any(name.startswith(p) for p in LEGACY_LOWER_PREFIXES):
            return True
        return False
    return True


def strip_aw(name: str) -> str:
    """Strip trailing 'A' / 'W' so CreateFileA / CreateFileW → CreateFile.
    We keep names like 'BeginPaint' (no suffix), 'GetMessage' etc. unchanged
    because there is no GetMessageA/GetMessageW base form.

    Heuristic: strip if the name ends in A or W AND a sibling without the
    suffix would conflict (we just always strip; CsWin32 resolves both
    variants from the base name).
    """
    if len(name) > 1 and name[-1] in ("A", "W") and name[-2].islower():
        return name[:-1]
    return name


def dump_exports(dll_short: str) -> list[str]:
    dll = SYSTEM32 / f"{dll_short}.dll"
    if not dll.exists():
        print(f"[skip] {dll} not found")
        return []
    res = subprocess.run([DUMPBIN, "-exports", str(dll)],
                         capture_output=True, text=True, errors="replace")
    out = res.stdout
    names: list[str] = []
    for line in out.splitlines():
        # ordinal hint rva name
        m = re.match(r"\s+\d+\s+[0-9A-Fa-f]+\s+[0-9A-Fa-f]+\s+(\w+)", line)
        if m:
            names.append(m.group(1))
    return names


def main() -> int:
    sections: list[str] = []
    sections.append(
        "// === Auto-generated by tools/cswin32_bridge/dump_exports.py ===\n"
        "// One section per system DLL. Names are deduped after stripping\n"
        "// trailing A/W. CsWin32 resolves the variant via win32metadata.\n"
        "// Unsupported names stay as PInvoke001 warnings; they get\n"
        "// commented out after the first build pass.\n"
    )
    summary: list[tuple[str, int, int, int]] = []
    for dll_short in TARGET_DLLS:
        all_names = dump_exports(dll_short)
        kept = [n for n in all_names if is_publicish(n)]
        unique = sorted(set(strip_aw(n) for n in kept))
        summary.append((dll_short, len(all_names), len(kept), len(unique)))
        sections.append(f"\n// === {dll_short}.dll ({len(unique)} candidates) ===")
        for name in unique:
            sections.append(name)
    sections.append("")

    out_path = Path(__file__).parent / "NativeMethods_full.txt"
    out_path.write_text("\n".join(sections), encoding="utf-8")
    print(f"[write] {out_path} ({sum(s[3] for s in summary)} unique candidates)\n")
    print(f"{'DLL':12} {'all':>6} {'kept':>6} {'unique':>7}")
    for (d, a, k, u) in summary:
        print(f"{d:12} {a:>6} {k:>6} {u:>7}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
