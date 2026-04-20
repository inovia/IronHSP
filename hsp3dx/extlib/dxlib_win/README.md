# hsp3dx/extlib/dxlib_win

**DxLib Windows 版 SDK の配置先。SDK ファイル本体はリポジトリに含まれない (`.gitignore` で除外)**。hsp3dx.exe をビルドするユーザーが手動でここに配置する必要がある。

## 取得手順

1. 公式ダウンロードページ https://dxlib.xsrv.jp/dxdload.html にアクセス
2. **Windows (Visual C++) 用パッケージ** をダウンロード
   - 直リンク (Ver3.24f 時点): https://dxlib.xsrv.jp/DxLib/DxLib_VC3_24f.zip
   - サイズ: 約 206 MB
3. zip を展開すると `DxLib_VC/` フォルダが出てくる。その中の日本語名フォルダ
   **「プロジェクトに追加すべきファイル_VC用」** の中身すべてを以下の位置にフラットに配置:

```
hsp3dx/extlib/dxlib_win/
  README.md                   本ファイル (git 管理)
  DxLib_VC/                   (git ignored; 約 424 ファイル)
    DxLib.h
    DxLib_x64.lib
    DxLib_vs2015_x64_MT.lib
    DxLib_vs2015_x64_MTd.lib
    DxDataType.h
    DxDataTypeWin.h
    ... (各種 .h .lib .pdb)
```

DxLib は `DxLib.h` 内で `#pragma comment(lib, "...")` により必要な lib を自動リンクする設計なので、`include/` と `lib/` に分割せず **1 ディレクトリに全部入れる** のが正しい配置。

vcxproj はこの `DxLib_VC/` を include path と library path の両方に指定している。

## 動作確認バージョン

- 本プロジェクトは **DxLib Ver 3.24f 以降** を想定 (`SetUseCharCodeFormat(DX_CHARCODEFORMAT_UTF8)` 対応版)
- 旧バージョン (3.23 以前) では UTF-8 モードが無いため動作しません

## ライセンス要点 (DxLib 公式 `DxLib.txt` より)

- 著作権: 山田 巧 氏
- **商用利用 OK、ライセンス料なし** (個人・法人・無料・有料ソフトすべて不問)
- **無保証** (損害賠償義務なし、不備訂正義務なし)
- DxLib 使用表記は任意 (「記載されれば嬉しい」程度)
- **DxLib のライブラリ/ソースを再配布する場合は `DX Library Copyright (C) 2001-2025 Takumi Yamada.` の著作権表記を付記**
- 依存ライブラリの著作権表記が必要な場合あり:
  - JPEG 機能使用時: `libjpeg Copyright (C) 1991-2013, Thomas G. Lane, Guido Vollbeding.`
  - PNG 機能使用時: libpng / zlib の表記
  - TIFF 機能使用時: libtiff の表記
  - Ogg Vorbis / Ogg Theora 使用時: Xiph.org Foundation 表記 (BSD 3-clause 相当)
  - `GetRand` 使用時: Mersenne Twister 表記 (BSD 3-clause 相当)
  - PMD/VMD 物理演算使用時: Bullet 表記
  - Live2D 機能使用時: Live2D 独自ライセンス遵守

**hsp3dx プロジェクトのスタンス**: SDK バイナリを再配布しない方針 (ユーザー個別 DL) なので、再配布時の著作権表記義務は原則発生しない。ただし hsp3dx.exe をバンドル配布する場合はビルド成果物ドキュメントに Takumi Yamada 氏のクレジットを含めることを推奨。

## トラブルシュート

- **ビルド時に `DxLib.h` が見つからない**: `DxLib_VC/` ディレクトリに展開されているか、vcxproj の `<AdditionalIncludeDirectories>` が `$(ProjectDir)..\extlib\dxlib_win\DxLib_VC` を指しているか確認
- **リンク時に lib が見つからない (LNK1104)**: `DxLib_VC/` 内に `DxLib_vs2015_x64_MT.lib` 等が存在するか確認
- **LNK2019 未解決の外部シンボル**: DxLib SDK のバージョンと vcxproj の `<RuntimeLibrary>` 設定が整合しているか確認。hsp3dx は Release=`/MT`、Debug=`/MTd` の静的 CRT でビルド
- **DxLib.txt が SJIS で読めない**: `iconv -f shift_jis -t utf-8 DxLib.txt` で UTF-8 変換可。本 README のライセンス要点欄に要約済み
