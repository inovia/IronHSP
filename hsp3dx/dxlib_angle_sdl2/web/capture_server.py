#!/usr/bin/env python
"""
hsp3dx dxlib_angle_sdl2 Web 自動キャプチャサーバー。

静的ファイル提供 + ブラウザからの POST 受け付け:
  POST /log         テキストボディを log.txt に append
  POST /screenshot  base64 PNG を screenshots/NNNN.png に保存
  GET  /done        全キャプチャ終わったか問い合わせ (polling 用)

ブラウザ側 (custom shell.html) からこれらに POST することで、
Chrome を再三立ち上げずに wasm の出力をローカルで確認できる。

使い方:
    python capture_server.py <stage>

    例: python capture_server.py stage7
        → http://127.0.0.1:8766/stage7_web.html?capture=5 を Chrome で開き、
          5 frame 分の canvas を build/captures/<stage>/ に保存、
          stdout/stderr は build/captures/<stage>/log.txt に記録
"""
import base64
import http.server
import os
import socketserver
import sys
from pathlib import Path

STAGE = sys.argv[1] if len(sys.argv) > 1 else "stage7"
BUILD_DIR = Path(__file__).parent / "build"
CAPTURE_DIR = BUILD_DIR / "captures" / STAGE
CAPTURE_DIR.mkdir(parents=True, exist_ok=True)

state = {"log": [], "shots": 0, "done_frame": None}

class H(http.server.SimpleHTTPRequestHandler):
    extensions_map = {
        **http.server.SimpleHTTPRequestHandler.extensions_map,
        ".wasm": "application/wasm",
    }

    def log_message(self, fmt, *args):
        pass  # quieter

    def do_POST(self):
        n = int(self.headers.get("Content-Length", 0))
        body = self.rfile.read(n) if n > 0 else b""

        if self.path == "/log":
            txt = body.decode("utf-8", errors="replace")
            state["log"].append(txt)
            (CAPTURE_DIR / "log.txt").write_text("".join(state["log"]), encoding="utf-8")
            print(f"[log] {txt.rstrip()}")
            self.send_response(200); self.end_headers()
            return

        if self.path == "/screenshot":
            # data:image/png;base64,iVBORw0KGgo...
            data = body.decode("utf-8", errors="replace")
            if "," in data:
                data = data.split(",", 1)[1]
            try:
                png = base64.b64decode(data)
            except Exception as e:
                print(f"[screenshot] base64 decode err: {e}")
                self.send_response(400); self.end_headers(); return
            state["shots"] += 1
            out = CAPTURE_DIR / f"frame_{state['shots']:04d}.png"
            out.write_bytes(png)
            print(f"[screenshot] {out.name} ({len(png)} bytes)")
            self.send_response(200); self.end_headers()
            return

        if self.path == "/done":
            state["done_frame"] = state["shots"]
            print(f"[done] {state['shots']} frames captured")
            self.send_response(200); self.end_headers()
            return

        self.send_response(404); self.end_headers()

os.chdir(BUILD_DIR)
print(f"serving on http://127.0.0.1:8766  (captures → {CAPTURE_DIR})")
with socketserver.TCPServer(("127.0.0.1", 8766), H) as srv:
    srv.serve_forever()
