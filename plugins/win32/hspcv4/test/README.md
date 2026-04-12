# hspcv4 tests

## Prerequisites

- `plugins/win32/hspcv4/Release/hspcv4.dll` がビルドされていること
  (ルートから `msbuild plugins\win32\hspcv4\hspcv4.vcxproj /p:Configuration=Release /p:Platform=Win32`)
- `hsp3/win32/Release/hsp3cl.exe` が存在すること (IronHSP 本体の Release ビルド済み)
- `package/win32/hspcmp.exe` が存在すること (リポジトリ標準)

## 自動テスト (headless)

```cmd
cd plugins\win32\hspcv4\test
run_tests.bat
```

`run_tests.bat` は `_work/` ディレクトリに必要なファイルをステージし、
`test_headless.hsp` をコンパイル・実行して標準出力を検証します。

- 成功時: `=== RESULT: PASS ===` / exit code 0
- 失敗時: `=== RESULT: FAIL ===` / exit code 1

検証内容:
- `cv4load` / `cv4info` / `cv4resize` / `cv4cvt` / `cv4save` / `cv4del` / `cv4reset`
- 保存ファイルを再 load してチャンネル/サイズが維持されることを roundtrip 検証

## 目視テスト (GUI)

```cmd
cd plugins\win32\hspcv4\test
rem DLL/依存物を _work にステージしてから
..\..\..\..\hsp3\win32\Release\hsp3.exe _work\test_gui_manual.ax
```

`test_gui_manual.hsp` は `cv4getimg` / `cv4putimg` の色順序 (BGR) と
向き (上下反転なし) を目視確認するためのスクリプトです。自動判定はできません。

確認項目:
1. りんごの画像が正しい向き・色で HSP 画面に描画されること
2. `captured.png` が生成され、画像ビュワーで開いて HSP 画面と一致すること

## x64 版のテスト

`run_tests.bat` はデフォルトで Win32 (`hspcv4.dll` + `hsp3cl.exe`) を使います。
x64 を検証したい場合は手動で `hspcv4_64.dll` を `hspcv4.dll` にリネームして
`hsp3/hsp3_64/x64/Release/` の x64 版 `hsp3cl_64.exe` を使う必要があります
(将来的に `run_tests_64.bat` を整備予定)。
