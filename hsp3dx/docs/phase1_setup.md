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
..\..\..\package\win32\hspcmp64.exe -i start.hsp
hsp3dx.exe
```

**重要: UTF-8 で一貫するには以下の 2 点が必須**

1. **ソース `.hsp` に `#cmpopt utf8 1` を書く** (`#bootopt` と同じ位置)
2. **コマンドラインに `-i` を付ける** (入力ソースを UTF-8 として読む指示)

2026-04-21 の検証で判明した hspcmp64 の実挙動:
- `-u` cmdline オプションは単体では出力 UTF-8 化しない (ヘルプと実挙動が違う)
- `#cmpopt utf8 1` が出力 UTF-8 化の本命
- `-i` は入力 UTF-8 として読むためにコマンドラインで必須
- `#cmpopt utf8 1` + `-i` がセットで必要 (どちらか片方だと化ける)

片方欠けた時の化け方:
- `-i` 欠け: UTF-8 バイトを SJIS 誤認 → 「これは」→「縺薙 丨」みたいな別 Unicode 化け
- `#cmpopt utf8 1` 欠け: 出力が SJIS のまま → ランタイムが UTF-8 として表示して化け

詳細は `memory/reference_hspcmp_utf8_flags.md` 参照。

実行するとウィンドウが開き、`mes` の内容が白文字で左上に描画されます。ESC で終了。

## Phase 1 サブフェーズ進捗

| サブ Phase | 内容 | 状態 |
|---|---|---|
| **1.0** | ディレクトリ + vcxproj + スケルトン main/hgio_dx | ✅ |
| **1.1** | hsp3/ VM コア統合 (hsp3cl.cpp 参考の hsp3dxcl ドライバ) | ✅ |
| **1.2** | mes / title / dialog 実装 + UTF-8 描画経路 | ✅ |
| **1.3** | pos / color / cls / redraw + pset / line / boxf / circle | ✅ |
| **1.4** | font + picload (CreateFontToHandle / LoadGraph) | ✅ |
| **1.5** | gcopy / gmode / celload / celput / buffer / screen / gsel | ✅ |
| **1.6** | 入力: getkey / stick / mouse + mousex/mousey/mousew sysvar + wait/await 中の ProcessMessage | ✅ |
| **1.7** | 音声 (mmload / mmplay / mmstop → DxLib LoadSoundMem / PlaySoundMem / StopSoundMem) | ✅ |
| **1.8** | sysvar/reffunc 拡充 (hwnd / hinstance / sysinfo(p) / dirinfo(p) + 既存の hsp3int 自動登録) | ✅ |
| **1.9** | 総合サンプル (シューティング) + getkey VK 互換修正 | ✅ |

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
