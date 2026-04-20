# hsp3dx/win32

Windows 版 `hsp3dx.exe` のソースとビルド構成を配置予定 (Phase 1)。

## 想定構成

```
win32/
  hsp3dx.vcxproj               VS 2022 プロジェクト
  hsp3dx.cpp                   main エントリ (VM 起動 + DxLib 初期化)
  hgio_dx.cpp                  hgio → DxLib 差し替え層 (hsp3dish の hgio を参考)
  dxlib_core.cpp               DxLib コマンド群 (dx_drawgraph など)
  dxlib_core.h
  axload.cpp                   .ax ファイル読み込み
```

## 依存

- DxLib Windows 版 SDK (`DxLib_*.lib` / `DxLib.h`) — Phase 0 時点では未取得
- hsp3 VM コア (`../../hsp3/src/` 配下) を静的リンク
- UTF-8 ランタイムのため `SetUseCharCodeFormat(DX_CHARCODEFORMAT_UTF8)` を起動時に呼ぶ

## ビルド手順 (Phase 1 予定)

1. DxLib Windows 版 SDK を `extlib/dxlib_win/` に配置
2. VS 2022 で `hsp3dx.vcxproj` をビルド (x64 / Release)
3. `hsp3dx.exe` が生成される
4. 同じディレクトリに `start.ax` を置いて実行
