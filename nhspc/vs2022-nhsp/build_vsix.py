#!/usr/bin/env python3
"""
Cross-platform VSIX packager for nhsp-language.vsix.

Mirrors what build.bat does via PowerShell on Windows, but works from any
shell. Assumes the .NET projects have already been built (Release).

VSIX = OPC ZIP. Only the files listed below are packed, so stray build
artifacts don't accidentally end up in the package.
"""
import os
import sys
import zipfile

ROOT = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(ROOT, ".."))
VSCLIENT_BIN = os.path.join(REPO, "NhspVsLanguageClient", "bin", "Release", "net472")
LSP_BIN = os.path.join(REPO, "NhspLanguageServer", "bin", "Release", "net48")
OUT = os.path.join(ROOT, "nhsp-language.vsix")

# src_path (absolute) → dst_path_in_vsix (forward slashes, relative to ZIP root)
ENTRIES = [
    (os.path.join(ROOT, "extension.vsixmanifest"),    "extension.vsixmanifest"),
    (os.path.join(ROOT, "[Content_Types].xml"),       "[Content_Types].xml"),
    (os.path.join(ROOT, "nhsp.pkgdef"),               "nhsp.pkgdef"),
    (os.path.join(ROOT, "language-configuration.json"), "language-configuration.json"),
    (os.path.join(ROOT, "Grammars", "nhsp.tmLanguage.json"), "Grammars/nhsp.tmLanguage.json"),
    (os.path.join(VSCLIENT_BIN, "NhspVsLanguageClient.dll"), "NhspVsLanguageClient.dll"),
    (os.path.join(LSP_BIN, "nhspls.exe"),             "nhspls.exe"),
    (os.path.join(LSP_BIN, "NhspCompiler.Core.dll"),  "NhspCompiler.Core.dll"),
    (os.path.join(LSP_BIN, "Newtonsoft.Json.dll"),    "Newtonsoft.Json.dll"),
    # nhspls.exe.config is optional; include only if .NET emitted one.
    (os.path.join(LSP_BIN, "nhspls.exe.config"),      "nhspls.exe.config"),
]


def main():
    missing = []
    for src, _ in ENTRIES:
        # The .config is optional; everything else is required.
        if src.endswith(".config"):
            continue
        if not os.path.isfile(src):
            missing.append(src)
    if missing:
        print("ERROR: missing required files:", file=sys.stderr)
        for m in missing:
            print("  " + m, file=sys.stderr)
        return 1

    if os.path.exists(OUT):
        os.remove(OUT)

    with zipfile.ZipFile(OUT, "w", zipfile.ZIP_DEFLATED) as zf:
        for src, dst in ENTRIES:
            if not os.path.isfile(src):
                # Only hits optional files (e.g. .config when absent).
                continue
            zf.write(src, dst)
            print(f"  added: {dst}")

    print(f"\nbuilt: {OUT}  ({os.path.getsize(OUT)} bytes)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
