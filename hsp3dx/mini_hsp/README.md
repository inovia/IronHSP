# mini_hsp.exe — Windows 版 mini HSP ランタイム

Apple Watch 用の Swift 製 mini HSP インタプリタ
([../ios/template/Watch/Sources/HSPRuntime.swift](../ios/template/Watch/Sources/HSPRuntime.swift))
を **Win32 + GDI** に C++17 で移植したもの。同じ `.ax` を Watch sim を回さずに
Windows 上で確認・デバッグするためのツール。

## ビルド

```cmd
"x64 Native Tools Command Prompt for VS 2022" を起動
cd j:\HNWorks\IronHSP_2026\hsp3dx\mini_hsp
build.bat
```

`mini_hsp.cpp` 1 ファイル + `cl.exe` 1 発で `mini_hsp.exe` が出来る。
追加依存無し (user32 / gdi32 / 標準 C++17 のみ)。

## 実行

```cmd
mini_hsp.exe                                       # デフォルト ../ios/template/Watch/Resources/demo.ax
mini_hsp.exe path\to\file.ax                       # 任意 .ax を実行
```

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
mini_hsp.exe hello.ax
```

`-i` = 入力 UTF-8 / `-u` = 出力 UTF-8。日本語を含む `.hsp` には両方必要。

## Watch / Windows 一致検証 (2026-04-26 確認)

同じ `demo.ax` を両環境で実行し、frame カウンタと座標計算が完全一致：

| 環境 | frame=97 | frame=309 |
|---|---|---|
| Apple Watch S11 46mm sim | x=43 | (未測定) |
| Windows mini_hsp.exe | (未測定) | x=71 |

計算式 `x = abs((cnt \ 240) - 120) + 20`:
- frame=97: `(97 \ 240=97) - 120 = -23 → 23 + 20 = 43` ✓
- frame=309: `(309 \ 240=69) - 120 = -51 → 51 + 20 = 71` ✓

## ファイル

- [mini_hsp.cpp](mini_hsp.cpp) — runtime + Win32 viewer (1 TU、約 600 行)
- [build.bat](build.bat) — `cl.exe` 1 発ビルドスクリプト
