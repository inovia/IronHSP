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

### 3. 動作確認

Phase 1.2 時点で `mes` / `title` / `dialog` が動作します。`start.hsp` を UTF-8 ソース / UTF-8 出力モードでコンパイルしてから実行:

```
cd bin\Release
..\..\..\package\win32\hspcmp64.exe -i -u start.hsp
hsp3dx.exe
```

**重要: `hspcmp64` には `-i` と `-u` の両方が必須**
- `-i` = 入力ソースが UTF-8 (BOM なし)
- `-u` = 出力 .ax 文字列テーブルが UTF-8

これを間違えると:
- `-i` のみ: SJIS 出力になるが入力は UTF-8 読み込み → ランタイムと不一致で文字化け
- `-u` のみ: 出力は UTF-8 だが入力を SJIS として誤読 → UTF-8 バイトを SJIS 解釈 → 別の Unicode 文字に変換されて出力 (例: "これ" が "縺薙" になる)
- 両方なし: 全部 SJIS
- **両方あり**: ✅ UTF-8 で一貫、文字化けなし

`#cmpopt utf8 1` 指定は `-u` 相当のみで入力側には効かない仕様のため、コマンドライン `-i` が必須。

実行するとウィンドウが開き、`mes` の内容が白文字で左上に描画されます。ESC で終了。

## Phase 1 サブフェーズ進捗

| サブ Phase | 内容 | 状態 |
|---|---|---|
| **1.0** | ディレクトリ + vcxproj + スケルトン main/hgio_dx | ✅ |
| **1.1** | hsp3/ VM コア統合 (hsp3cl.cpp 参考の hsp3dxcl ドライバ) | ✅ |
| **1.2** | mes / title / dialog 実装 + UTF-8 描画経路 | ✅ |
| 1.3 | `dxlib_core` プラグイン 基盤 (`dx_*` 命令登録機構) | 未着手 |
| 1.4 | 描画 20 関数 (`dx_drawgraph` / `dx_drawbox` など) | 未着手 |
| 1.5 | 音声 10 関数 (`dx_loadsoundmem` / `dx_playsoundmem` など) | 未着手 |
| 1.6 | 入力 10 関数 (`dx_getmouseinput` / `dx_checkhitkey` など) | 未着手 |
| 1.7 | `hsp3dx/samples/` の 3 サンプル動作確認 | 未着手 |

## トラブルシュート

- **ビルドエラー `DxLib.h: No such file`**: extlib/dxlib_win/include/ が存在するか確認
- **リンクエラー LNK1104 `DxLib_x64.lib`**: extlib/dxlib_win/lib/x64/ に lib があるか確認
- **LNK2019 未解決の外部シンボル**: DxLib SDK の CRT 選択と vcxproj の `<RuntimeLibrary>` 設定が整合しているか (現状 Release=MT, Debug=MTd)

## 既知の制限 (Phase 1.2 時点)

- 実装済み extcmd: `mes` / `print` / `title` / `dialog` のみ。
  他の命令 (`pos` / `color` / `line` / `boxf` / `wait` / `getkey` など) は `HSPERR_UNSUPPORTED_FUNCTION` で落ちる
- 実装済み reffunc (システム変数 / 組み込み関数): なし。`sysinfo()` / `dirinfo()` / `strlen()` なども未対応
- フォント: DxLib デフォルト固定 (18px 行高)、font 命令で変更不可
- スクロールバッファは 64 行 × 512 バイト固定
- `wait` / `await` 命令は VM 側の RUNMODE_WAIT/AWAIT で処理されるが、実用的なタイマ統合は Phase 1.3 以降で調整
