# hsp3dx/extlib/dxlib_win

**DxLib Windows 版 SDK の配置先。SDK ファイル本体はリポジトリに含まれない (`.gitignore` で除外)**。hsp3dx.exe をビルドするユーザーが手動でここに配置する必要がある。

## 取得手順

1. 公式サイト https://dxlib.xsrv.jp/ から「VC (Visual C++) 用パッケージ」をダウンロード
2. zip を展開して、以下の構造で本ディレクトリに配置:

```
hsp3dx/extlib/dxlib_win/
  include/                    DxLib.h など公式ヘッダ
    DxLib.h
    (その他)
  lib/
    x64/                      64bit 版 .lib
      DxLib_x64.lib
      DxLibVS2022_x64.lib (など VS 版対応が必要なら)
      (その他)
  README.md                   本ファイル (git 管理)
  LICENSE.txt                 公式配布ライセンス (手動配置推奨、git 管理しない)
```

配布 zip の中身をそのまま `include/` / `lib/` に分けて配置する形。zip の内容はバージョンにより多少違うので、DxLib.h と DxLib_x64.lib が見つかるように配置すれば OK。

## 動作確認バージョン

- 本プロジェクトは **DxLib Ver 3.24f 以降** を想定 (`SetUseCharCodeFormat(DX_CHARCODEFORMAT_UTF8)` 対応版)
- 旧バージョン (3.23 以前) では UTF-8 モードが無いため動作しません

## ライセンスに関する注意

- DxLib 本体のソースコード / バイナリは **リポジトリに含めない**。各ユーザーが公式からダウンロードして利用
- DxLib の利用規約は公式サイトを確認のこと
- hsp3dx プロジェクト自体は DxLib のバイナリを再配布していない。リンクビルドで生成された `hsp3dx.exe` を配布する場合は、DxLib 公式の配布条件に従うこと

## トラブルシュート

- **ビルド時に `DxLib.h` が見つからない**: `include/` ディレクトリが作られているか、vcxproj の `<AdditionalIncludeDirectories>` が `$(SolutionDir)hsp3dx\extlib\dxlib_win\include` を指しているかを確認
- **リンク時に `DxLib_x64.lib` が見つからない**: `lib/x64/` に lib があるか、vcxproj の `<AdditionalLibraryDirectories>` が正しいか確認
- **リンク時に LNK2019 (未解決の外部シンボル)**: DxLib SDK のバージョンとランタイム (MT/MD) の組み合わせを確認。hsp3dx は `/MT` (静的 CRT) でビルドする想定
