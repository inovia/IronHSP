# IronHSP Jupyter kernel

Jupyter Lab / Notebook でセル単位に HSP3 スクリプトを実行できる wrapper
kernel (Phase M5 scaffold)。

## 仕組み

1. Jupyter カーネルプロトコル (ipykernel) を Python 側で実装
2. `do_execute(code)` がセル内容を受け取る
3. `%TEMP%/hspkernel_*/cell.hsp` に書き出し
4. `hspcmp64.exe -d -i -u --compath=common/ cell.hsp` でコンパイル
5. `hsp3cl_net_test_64.exe cell.ax` で実行
6. stdout はそのまま出力、stderr (NDJSON) から `type:"error"` を拾って表示

## 前提

- Python 3.8+
- `pip install ipykernel jupyter`
- `package/win32/hspcmp64.exe` / `hspcmp64.dll` / `hsp3cl_net_test_64.exe` が
  ビルド済で配置されていること
- `package/win32/common/` に hspdef.as 一式があること

## インストール

```powershell
cd tools/jupyter
pip install ipykernel jupyter
python install.py                # --user (カレントユーザー) に登録
jupyter lab                       # → ランチャーに "IronHSP" が出る
```

## 実行例 (1 セル)

```hsp
mes "hello"
repeat 5
    mes "count " + cnt
loop
```

→ stdout に 6 行出る。

## 制限 (scaffold レベル)

- **状態はセルごとに独立**: 変数や関数定義を別セルに持ち越せない。
  真のインタラクティブ REPL にするには hsp3net runtime 側の永続化が必要
- `wait` / `stop` / GUI 命令は動くが、画面は一瞬出て閉じる
  (`hsp3cl_net_test_64` は GUI サポートあるが Jupyter 下では出力が見えにくい)
- タイムアウト: コンパイル 30 秒、実行 60 秒で kill
- `%e` runtime 起動や `#bootopt` は未サポート
- ipykernel の `do_complete` / `do_inspect` 未実装 (補完・ヘルプなし)

## 次のステップ (v2 以降)

- セッション永続化: hsp3net を長時間プロセスとして起動、stdin に改行区切りの
  コマンドを流して変数を保持
- `do_complete`: hspdef.as のキーワード + ユーザー定義シンボルを補完
- Rich output: `mes` を MIME type 付き出力に置き換えて HTML/画像表示
- `%matplotlib inline` 相当の描画対応 (stb_image.h で PNG 吐き出し)

## 参考

- IPython wrapper kernel docs:
  https://jupyter-client.readthedocs.io/en/latest/wrapperkernels.html
- Iron HSP テストランタイム: [test_runtime_guide.html](../../docs/test_runtime_guide.html)
