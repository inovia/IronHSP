# hsp3watch_64.exe — Apple Watch ランタイムの Windows デバッグ版

Apple Watch 用の Swift 製 mini HSP インタプリタ
([../ios/template/Watch/Sources/HSPRuntime.swift](../ios/template/Watch/Sources/HSPRuntime.swift))
を **Win32 + GDI** に C++17 で移植したもの。同じ `.ax` を Watch sim を回さずに
Windows 上で確認・デバッグするためのツール。

命名規則は他の HSP ランタイム (`hsp3.exe` / `hsp3_64.exe` / `hsp3cl_64.exe` / `hsp3_net_64.exe`) と
揃え、 64bit 版を `hsp3watch_64.exe` とする。

## ビルド

```cmd
"x64 Native Tools Command Prompt for VS 2022" を起動
cd j:\HNWorks\IronHSP_2026\hsp3dx\hsp3watch
build.bat
```

`hsp3watch.cpp` 1 ファイル + `cl.exe` 1 発で `hsp3watch_64.exe` が出来る。
追加依存無し (user32 / gdi32 / 標準 C++17 のみ)。

## 実行

```cmd
hsp3watch_64.exe                                     # デフォルト ../ios/template/Watch/Resources/demo.ax
hsp3watch_64.exe path\to\file.ax                     # 任意 .ax を実行
```

ビルド済バイナリは [J:\HNWorks\IronHSP_2026\package\win32\hsp3watch_64.exe](../../package/win32/hsp3watch_64.exe)
にも配置されている (他の hsp3.exe / hspcmp.exe と同じ場所)。
コンパイルなしで動作確認したいときは package/win32 から直接呼べる。

- ウィンドウサイズ: 200×250 pt × 2x scale = 400×500 px (Apple Watch S11 46mm 相当)
- 30Hz timer で `runFrame()` を反復、`wait`/`await` で frame 境界
- F5 = .ax 再読み込み / Esc = 終了

## サポート機能 (HSPRuntime.swift Phase 3 と同等)

| 種類 | 命令 / 機能 |
|---|---|
| 描画 | `cls` / `color` / `boxf` / `mes` / `pos` / `line` / `pset` / `font` (size のみ) |
| 制御 | `if` / `else` / `repeat` / `loop` / `break` / `continue` / `goto` / `gosub` / `return` |
| 同期 | `wait` / `await` (frame yield) / `end` / `stop` |
| 変数 | `var = expr` / `+=` / `-=` / `*=` / `/=` |
| 演算 | `+ - * / \ & | ^ == != < > <= >= >> <<` |
| sysvar | `cnt` |
| 文字列 | `+` 演算子で int/double と concat |

未対応: 配列 / 構造体 / モジュール / 関数式 / プラグイン / hgio2D 全般。

## .hsp → .ax のコンパイル

```cmd
cd path\to\hello.hsp
copy J:\HNWorks\IronHSP_2026\package\win32\hspcmp.exe .
mklink /D common J:\HNWorks\IronHSP_2026\package\win32\common
hspcmp.exe -i -u hello.hsp                         # → hello.ax 生成
hsp3watch_64.exe hello.ax
```

`-i` = 入力 UTF-8 / `-u` = 出力 UTF-8。日本語を含む `.hsp` には両方必要。

## Watch / Windows 一致検証 (2026-04-26 確認)

同じ `demo.ax` を両環境で実行し、frame カウンタと座標計算が完全一致：

| 環境 | frame=97 | frame=309 |
|---|---|---|
| Apple Watch S11 46mm sim | x=43 | (未測定) |
| Windows hsp3watch_64.exe | (未測定) | x=71 |

計算式 `x = abs((cnt \ 240) - 120) + 20`:
- frame=97: `(97 \ 240=97) - 120 = -23 → 23 + 20 = 43` ✓
- frame=309: `(309 \ 240=69) - 120 = -51 → 51 + 20 = 71` ✓

## ファイル

- [hsp3watch.cpp](hsp3watch.cpp) — runtime + Win32 viewer (1 TU、約 600 行)
- [build.bat](build.bat) — `cl.exe` 1 発ビルドスクリプト
