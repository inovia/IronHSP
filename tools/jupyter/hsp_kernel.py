#!/usr/bin/env python3
"""
IronHSP Jupyter kernel (wrapper kernel)

Jupyter セル内の HSP スクリプトを hspcmp64 → hsp3cl_net_test_64 で実行し、
stdout / stderr (NDJSON) を Jupyter の出力ストリームに流す最小実装。

セットアップ:
    pip install ipykernel jupyter
    python -m hsp_kernel.install     # kernelspec 登録
    jupyter lab                       # → IronHSP カーネル選択可能

依存:
    - package/win32/hspcmp64.exe + hspcmp64.dll
    - package/win32/hsp3cl_net_test_64.exe + NDJSON stderr 対応
    - package/win32/common/ (import 用 .as 一式)
"""

from __future__ import annotations

import json
import os
import subprocess
import sys
import tempfile
from pathlib import Path
from typing import Iterable

try:
    from ipykernel.kernelbase import Kernel
except ImportError:
    sys.stderr.write("ipykernel not found. Run: pip install ipykernel\n")
    sys.exit(1)


_PKG_DIR = Path(__file__).resolve().parent.parent.parent / "package" / "win32"


def _locate(binary: str) -> Path | None:
    p = _PKG_DIR / binary
    if p.exists():
        return p
    # ユーザーが PATH に置いてる可能性もある
    import shutil

    w = shutil.which(binary)
    return Path(w) if w else None


class IronHspKernel(Kernel):
    implementation = "iron_hsp"
    implementation_version = "0.1"
    language = "hsp"
    language_version = "3.8beta1"
    language_info = {
        "name": "hsp",
        "mimetype": "text/x-hsp",
        "file_extension": ".hsp",
        "pygments_lexer": "text",
    }
    banner = "IronHSP kernel — HSP3 scripts executed via hsp3cl_net_test_64.exe"

    def __init__(self, **kw):
        super().__init__(**kw)
        self._hspcmp = _locate("hspcmp64.exe")
        self._runtime = _locate("hsp3cl_net_test_64.exe")
        self._common = _PKG_DIR / "common"
        if not self._hspcmp or not self._runtime:
            self.log.warning(
                "hspcmp64.exe or hsp3cl_net_test_64.exe not found under %s",
                _PKG_DIR,
            )

    def do_execute(
        self,
        code: str,
        silent: bool,
        store_history: bool = True,
        user_expressions: dict | None = None,
        allow_stdin: bool = False,
        *,
        cell_id: str | None = None,
    ):
        # 1. ソースをラップしてテンポラリに書き出し
        header = '#include "hsp3cl_net_64.as"\n'
        # ユーザーが自分で include 書いてたらスキップ (先頭行に既にある場合)
        if "hsp3cl_net_64.as" in code.split("\n", 3)[0]:
            header = ""
        source = header + code + "\n"

        with tempfile.TemporaryDirectory(prefix="hspkernel_") as tmpd:
            src_path = Path(tmpd) / "cell.hsp"
            ax_path = src_path.with_suffix(".ax")
            src_path.write_text(source, encoding="utf-8")

            # 2. コンパイル
            if not self._hspcmp:
                self._stream("stderr", "hspcmp64.exe not found\n")
                return self._err_reply()

            cargs = [
                str(self._hspcmp),
                "-d",
                "-i",
                "-u",
                f"--compath={self._common}/",
                src_path.name,
            ]
            try:
                r = subprocess.run(
                    cargs, cwd=tmpd, capture_output=True, text=True, timeout=30
                )
            except Exception as e:
                self._stream("stderr", f"compile invocation failed: {e}\n")
                return self._err_reply()
            if r.returncode != 0 or not ax_path.exists():
                self._stream("stderr", (r.stdout or "") + (r.stderr or ""))
                return self._err_reply()

            # 3. 実行
            try:
                r = subprocess.run(
                    [str(self._runtime), ax_path.name],
                    cwd=tmpd,
                    capture_output=True,
                    text=True,
                    timeout=60,
                )
            except Exception as e:
                self._stream("stderr", f"run invocation failed: {e}\n")
                return self._err_reply()

            # stdout はそのままユーザーに
            if r.stdout:
                self._stream("stdout", r.stdout)

            # stderr は NDJSON。error イベントだけ拾って表示
            for ev in self._parse_ndjson(r.stderr.splitlines()):
                if ev.get("type") == "error":
                    self._stream(
                        "stderr",
                        "Error {code} at {file}:{line} — {message}\n".format(
                            code=ev.get("code", "?"),
                            file=ev.get("file", "?"),
                            line=ev.get("line", "?"),
                            message=ev.get("message", ""),
                        ),
                    )

            if r.returncode != 0:
                return self._err_reply()

        return {
            "status": "ok",
            "execution_count": self.execution_count,
            "payload": [],
            "user_expressions": {},
        }

    # ---- helpers ----
    def _stream(self, name: str, text: str) -> None:
        self.send_response(self.iopub_socket, "stream", {"name": name, "text": text})

    def _err_reply(self) -> dict:
        return {
            "status": "error",
            "execution_count": self.execution_count,
            "ename": "HSPError",
            "evalue": "",
            "traceback": [],
        }

    @staticmethod
    def _parse_ndjson(lines: Iterable[str]):
        for line in lines:
            line = line.strip()
            if not line:
                continue
            try:
                yield json.loads(line)
            except json.JSONDecodeError:
                continue


if __name__ == "__main__":
    from ipykernel.kernelapp import IPKernelApp

    IPKernelApp.launch_instance(kernel_class=IronHspKernel)
