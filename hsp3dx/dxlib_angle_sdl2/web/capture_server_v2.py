#!/usr/bin/env python
import base64, http.server, os, socketserver, sys
from pathlib import Path
SERVE_DIR = Path("J:/HNWorks/IronHSP_2026/hsp3dx/dxlib_angle_sdl2/build_web")
CAP_DIR = SERVE_DIR / "captures"
CAP_DIR.mkdir(exist_ok=True)
state = {"shots": 0, "log": []}
class H(http.server.SimpleHTTPRequestHandler):
    extensions_map = {**http.server.SimpleHTTPRequestHandler.extensions_map, ".wasm":"application/wasm"}
    def log_message(self, fmt, *args): pass
    def do_POST(self):
        n = int(self.headers.get("Content-Length", 0))
        body = self.rfile.read(n) if n>0 else b""
        if self.path == "/log":
            txt = body.decode("utf-8", errors="replace")
            state["log"].append(txt)
            (CAP_DIR/"log.txt").write_text("".join(state["log"]), encoding="utf-8")
            print(f"[log] {txt.rstrip()}")
            self.send_response(200); self.end_headers(); return
        if self.path == "/screenshot":
            data = body.decode("utf-8", errors="replace")
            if "," in data: data = data.split(",",1)[1]
            try:
                png = base64.b64decode(data)
            except Exception as e:
                print(f"[screenshot] err: {e}")
                self.send_response(400); self.end_headers(); return
            state["shots"] += 1
            out = CAP_DIR/f"frame_{state['shots']:04d}.png"
            out.write_bytes(png)
            print(f"[screenshot] {out.name} ({len(png)} bytes)")
            self.send_response(200); self.end_headers(); return
        self.send_response(404); self.end_headers()
os.chdir(SERVE_DIR)
print(f"serving on http://127.0.0.1:8089  (captures -> {CAP_DIR})")
with socketserver.TCPServer(("127.0.0.1", 8089), H) as srv:
    srv.serve_forever()
