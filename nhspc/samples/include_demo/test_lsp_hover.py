"""
Manual E2E test: verify nhspls can see doc comments from #include'd files.

Usage: python test_lsp_hover.py
Prereq: nhspls.exe built at nhspc/NhspLanguageServer/bin/Release/net48/nhspls.exe
"""
import json
import os
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
NHSPLS = os.path.abspath(os.path.join(HERE, "..", "..", "NhspLanguageServer",
                                      "bin", "Release", "net48", "nhspls.exe"))
APP = os.path.join(HERE, "app.nhsp")
APP_B = os.path.join(HERE, "app_b_probe.nhsp")
APP_C = os.path.join(HERE, "c_test", "app_c_probe.nhsp")


def frame(msg):
    body = json.dumps(msg).encode("utf-8")
    return f"Content-Length: {len(body)}\r\n\r\n".encode() + body


def read_frame(stream):
    # Read headers
    headers = b""
    while not headers.endswith(b"\r\n\r\n"):
        b = stream.read(1)
        if not b:
            return None
        headers += b
    size = None
    for line in headers.decode().split("\r\n"):
        if line.lower().startswith("content-length:"):
            size = int(line.split(":", 1)[1].strip())
    body = stream.read(size).decode("utf-8")
    return json.loads(body)


def main():
    if not os.path.exists(NHSPLS):
        print(f"ERROR: nhspls.exe not found at {NHSPLS}", file=sys.stderr)
        return 2

    text = open(APP, encoding="utf-8").read()
    text_b = open(APP_B, encoding="utf-8").read()
    text_c = open(APP_C, encoding="utf-8").read()
    uri = f"file:///{APP.replace(chr(92), '/')}"
    uri_b = f"file:///{APP_B.replace(chr(92), '/')}"
    uri_c = f"file:///{APP_C.replace(chr(92), '/')}"
    root_uri = f"file:///{HERE.replace(chr(92), '/')}"

    p = subprocess.Popen([NHSPLS], stdin=subprocess.PIPE, stdout=subprocess.PIPE)

    # initialize — pass rootUri so Phase B workspace scan can pick up lib_extras.
    p.stdin.write(frame({
        "jsonrpc": "2.0", "id": 1, "method": "initialize",
        "params": {"processId": 0, "rootUri": root_uri, "capabilities": {}}
    }))
    p.stdin.flush()
    read_frame(p.stdout)  # response

    # initialized — triggers workspace scan
    p.stdin.write(frame({"jsonrpc": "2.0", "method": "initialized", "params": {}}))
    p.stdin.flush()

    # didOpen app.nhsp (Phase A target)
    p.stdin.write(frame({
        "jsonrpc": "2.0", "method": "textDocument/didOpen",
        "params": {"textDocument": {"uri": uri, "languageId": "nhsp",
                                    "version": 1, "text": text}}
    }))
    p.stdin.flush()
    read_frame(p.stdout)  # diagnostics

    # didOpen app_b_probe.nhsp (Phase B target)
    p.stdin.write(frame({
        "jsonrpc": "2.0", "method": "textDocument/didOpen",
        "params": {"textDocument": {"uri": uri_b, "languageId": "nhsp",
                                    "version": 1, "text": text_b}}
    }))
    p.stdin.flush()
    read_frame(p.stdout)  # diagnostics

    # didOpen app_c_probe.nhsp (Phase C target)
    p.stdin.write(frame({
        "jsonrpc": "2.0", "method": "textDocument/didOpen",
        "params": {"textDocument": {"uri": uri_c, "languageId": "nhsp",
                                    "version": 1, "text": text_c}}
    }))
    p.stdin.flush()
    read_frame(p.stdout)  # diagnostics

    # hover at the position of `Vec2` on line 10 (1-based LSP position is 0-based: line 9)
    # Find position of "Vec2" in the app text
    lines = text.split("\n")
    hover_targets = {}
    for li, line in enumerate(lines):
        # Skip comment-only lines — the Lexer strips them, so no tokens there.
        stripped = line.lstrip()
        if stripped.startswith(";") or stripped.startswith("//"):
            continue
        for sym in ("Vec2", "Clamp", "Mag2", "ClampInt"):
            if sym in hover_targets:
                continue
            # Find word-boundary match so "Clamp" doesn't pre-empt "ClampInt".
            start = 0
            while True:
                c = line.find(sym, start)
                if c < 0: break
                after = line[c + len(sym)] if c + len(sym) < len(line) else ""
                before = line[c - 1] if c > 0 else ""
                if not after.isalnum() and after != "_" and not before.isalnum() and before != "_":
                    hover_targets[sym] = (sym, li, c + 1)
                    break
                start = c + 1
    hover_targets = list(hover_targets.values())

    # Add a Phase B probe: hover on `Extras` in app_b_probe.nhsp (not #include'd).
    lines_b = text_b.split("\n")
    for li, line in enumerate(lines_b):
        stripped = line.lstrip()
        if stripped.startswith(";") or stripped.startswith("//"):
            continue
        c = line.find("Extras")
        if c >= 0:
            hover_targets.append(("Extras", li, c + 1, uri_b))
            break

    # Add Phase C probes: hover on `Currency` + `Dollars` in app_c_probe.nhsp.
    # These symbols live only in LibC.dll (via #reference); docs come from LibC.xml.
    lines_c = text_c.split("\n")
    for sym in ("Currency", "Dollars"):
        for li, line in enumerate(lines_c):
            stripped = line.lstrip()
            if stripped.startswith(";") or stripped.startswith("//"):
                continue
            c = line.find(sym)
            if c >= 0:
                hover_targets.append((sym, li, c + 1, uri_c))
                break

    # Normalize earlier tuples to include the uri.
    hover_targets = [(t if len(t) == 4 else (t[0], t[1], t[2], uri)) for t in hover_targets]
    print("  targets:", hover_targets)

    results = {}
    next_id = 2
    for sym, li, ch, target_uri in hover_targets:
        p.stdin.write(frame({
            "jsonrpc": "2.0", "id": next_id, "method": "textDocument/hover",
            "params": {"textDocument": {"uri": target_uri},
                       "position": {"line": li, "character": ch}}
        }))
        p.stdin.flush()
        resp = read_frame(p.stdout)
        result = resp.get("result")
        if result:
            # Contents may be: MarkedString[] (list), MarkedString ({...}),
            # MarkupContent ({ kind, value }), or plain string.
            contents = result["contents"]
            parts = []
            if isinstance(contents, list):
                for c in contents:
                    if isinstance(c, str): parts.append(c)
                    elif isinstance(c, dict): parts.append(c.get("value", ""))
            elif isinstance(contents, dict):
                parts.append(contents.get("value", ""))
            elif isinstance(contents, str):
                parts.append(contents)
            results[sym] = "\n".join(parts)
        next_id += 1

    # shutdown
    p.stdin.write(frame({"jsonrpc": "2.0", "id": 99, "method": "shutdown", "params": {}}))
    p.stdin.flush()
    read_frame(p.stdout)
    p.stdin.write(frame({"jsonrpc": "2.0", "method": "exit", "params": {}}))
    p.stdin.flush()
    p.wait(timeout=5)

    # Verify — each symbol's hover must come from another file.
    # Phase A: lib_math.nhsp is #include'd by app.nhsp
    # Phase B: lib_extras.nhsp is NOT #include'd but exists in the workspace
    # Phase C: LibC.dll is #reference'd, LibC.xml supplies the docs
    expected_keywords = {
        "Vec2":      "2D vector",          # A: class doc from lib_math
        "Clamp":     "Clamps an integer",  # A: class doc from lib_math
        "Mag2":      "Euclidean-ish",      # A: method doc from lib_math
        "ClampInt":  "Clamp.ClampInt",     # A: signature proves cross-file visibility
        "Extras":    "workspace scan",     # B: workspace-wide doc (no include)
        "Currency":  "Currency helpers",   # C: class doc from LibC.xml
        "Dollars":   "cents to major",     # C: method doc from LibC.xml
    }
    any_fail = False
    for sym, kw in expected_keywords.items():
        md = results.get(sym, "")
        ok = kw in md
        print(f"  [{('OK' if ok else 'FAIL')}] hover {sym!r}: {'contains' if ok else 'MISSING'} {kw!r}")
        if not ok:
            any_fail = True
            print("    got (len={}):".format(len(md)))
            for line in (md or "(none)").split("\n"):
                print("      " + line)

    return 1 if any_fail else 0


if __name__ == "__main__":
    sys.exit(main())
