#!/usr/bin/env python3
"""IronHSP Jupyter カーネルの kernelspec を登録する。

使い方:
    python install.py           # --user (カレントユーザー) に登録
    python install.py --sys     # システム全体
"""

import json
import os
import sys
import shutil
import tempfile
from pathlib import Path


HERE = Path(__file__).resolve().parent


def main():
    sysprefix = "--sys" in sys.argv
    from jupyter_client.kernelspec import KernelSpecManager

    with tempfile.TemporaryDirectory() as d:
        spec_dir = Path(d)
        # kernel.json
        spec = {
            "argv": [
                sys.executable,
                "-m",
                "hsp_kernel",
                "-f",
                "{connection_file}",
            ],
            "display_name": "IronHSP",
            "language": "hsp",
            "interrupt_mode": "signal",
        }
        (spec_dir / "kernel.json").write_text(
            json.dumps(spec, indent=2), encoding="utf-8"
        )

        # hsp_kernel.py をパッケージ化してコピー (jupyter が module import できるよう)
        shutil.copy2(HERE / "hsp_kernel.py", spec_dir / "hsp_kernel.py")

        # カーネルスペック登録
        mgr = KernelSpecManager()
        name = "iron_hsp"
        mgr.install_kernel_spec(
            str(spec_dir), kernel_name=name, user=not sysprefix, replace=True
        )
        print(f"Installed kernelspec '{name}' (scope={'system' if sysprefix else 'user'})")


if __name__ == "__main__":
    main()
