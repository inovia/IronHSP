# hsp3dx Phase 1 セットアップガイド

Phase 1.0 (本コミット時点) のソースを **VS 2022 でビルドしてみる手順**。

## 前提

- Windows 10/11 x64
- Visual Studio 2022 (v143 ツールセット、C++ デスクトップ開発ワークロード)
- DxLib Windows 版 SDK (Ver 3.24f 以降推奨)

## 手順

### 1. DxLib SDK の取得と配置

1. https://dxlib.xsrv.jp/ から「VC 用パッケージ」をダウンロード
2. `hsp3dx/extlib/dxlib_win/` に以下の形で展開配置:
   ```
   hsp3dx/extlib/dxlib_win/
     include/
       DxLib.h
       (その他)
     lib/
       x64/
         DxLib_x64.lib
   ```
詳細は [extlib/dxlib_win/README.md](../extlib/dxlib_win/README.md) 参照。

### 2. ビルド

```
cd hsp3dx\win32
msbuild hsp3dx.vcxproj /p:Configuration=Release /p:Platform=x64
```

または VS 2022 で `hsp3dx.vcxproj` を開いてビルド。

成果物: `bin/Release/hsp3dx.exe`

### 3. 動作確認 (Phase 1.0 時点)

現時点ではウィンドウが開いて ESC 押下で閉じるだけ (VM 未搭載)。実際の HSP 実行は Phase 1.1 で対応。

```
cd bin\Release
hsp3dx.exe
```

## Phase 1 サブフェーズ進捗

| サブ Phase | 内容 | 状態 |
|---|---|---|
| **1.0** | ディレクトリ + vcxproj + スケルトン main/hgio_dx | ✅ |
| 1.1 | hsp3embed VM の組み込み (`.ax` ロード + 実行ドライブ) | 未着手 |
| 1.2 | `dxlib_core` プラグイン 基盤 (`dx_*` 命令登録機構) | 未着手 |
| 1.3 | 描画 20 関数 (`dx_drawgraph` / `dx_drawbox` など) | 未着手 |
| 1.4 | 音声 10 関数 (`dx_loadsoundmem` / `dx_playsoundmem` など) | 未着手 |
| 1.5 | 入力 10 関数 (`dx_getmouseinput` / `dx_checkhitkey` など) | 未着手 |
| 1.6 | `hsp3dx/samples/` の 3 サンプル動作確認 | 未着手 |

## トラブルシュート

- **ビルドエラー `DxLib.h: No such file`**: extlib/dxlib_win/include/ が存在するか確認
- **リンクエラー LNK1104 `DxLib_x64.lib`**: extlib/dxlib_win/lib/x64/ に lib があるか確認
- **LNK2019 未解決の外部シンボル**: DxLib SDK の CRT 選択と vcxproj の `<RuntimeLibrary>` 設定が整合しているか (現状 Release=MT, Debug=MTd)

## 既知の制限 (Phase 1.0)

- VM 未搭載なので .ax の実行はできない
- `#bootopt hsp64 1` でコンパイルした .ax を想定
- プラグイン (`dx_*` 命令) も未登録
- サンプル .hsp は Phase 1.2 以降で動かせるようになる
