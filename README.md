# IronHSP

**.NET をフル活用できる、HSP 互換 + 拡張ランタイム / 言語スイート**

OpenHSP 3.8beta1 をベースに、.NET Framework 4.8 連携 / 64bit 対応 / wstr (UTF-16) / 構造体型 (NSTRUCT) / OpenCV 4 / DXLib / HSP風 .NET コンパイラ (nhspc) / Visual Studio 2022 + VS Code 統合まで、多数の機能を追加した実験プロジェクトです。

> Based on http://dev.onionsoft.net/svn/openhsp/tags/3.8beta1 (Subversion) — `hspver "3.8beta1"`, see [`hsp3/hsp3config.h`](hsp3/hsp3config.h)

---

## 主な追加機能 (vanilla HSP3 との差分)

### ランタイム / 言語コア

- **`int64` / `long` 型** — Phase 1〜6 で導入。変数型・システム変数・関数・コンパイラリテラル・パラメータすべて対応。
- **`wstr` 型 (UTF-16 ワイド文字列)** — `L"..."` リテラル + 文字列関数 / 命令 / `note` 系 / 自動変換まで全 Phase 完了。
- **構造体型 `HSPVAR_FLAG_NSTRUCT`** — `#defstruct` / `stdim` で確保。`#field` / `#defunion` / `pack` / `Size` / `LayoutKind` 全対応。`#cfuncst` で構造体戻り値 DLL 関数を呼べる、`callfuncst` で動的呼び出し可。`varsize(STRUCT)` で型サイズ取得。`MPTYPE_STRUCTVAL` で構造体値渡しも対応。
- **.NET 連携 (hsp3net)** — Phase 7〜12 で `loadnet` / `newnet` / `netres` / `mcall` 等を通じて任意の .NET 4.8 アセンブリを呼び出せます。例外処理 (`neterror` / `netexerr`)、`CnvCustom`、`tonet`、Enum 変換、`objprm` 対応済み。
- **DLL の double / float 戻り値** — `#cfuncd` / `#cfuncf` / `callfuncd` / `callfuncf`。
- **WinForms 統合** — `screen` を Form として扱い、HSP の GUI オブジェクトを .NET 化。

### 新規プラグイン

- **hspcv4** ([`plugins/win32/hspcv4/`](plugins/win32/hspcv4/)) — OpenCV 4.12 + opencv_contrib をベースに新規開発したプラグイン。**全 200 命令** (main 12 + contrib 8 = 20 モジュールカバー)。FreeType / HarfBuzz による日本語フォント描画、Tesseract OCR、wechat_qrcode、saliency、SWT text detection、stereo / xfeatures2d / ximgproc / ml / face / dnn 等、フル装備。

### 大幅拡張したプラグイン

- **hspdxlib** ([`plugins/win32/hspdxlib/`](plugins/win32/hspdxlib/)) — [DX ライブラリ (山田 巧 氏)](https://dxlib.xsrv.jp/) を `#uselib` / `#func` / `#cfunc` / `#cfuncst` で呼べるよう自動ラッパ生成。`gen_hspdxlib.py` で 55 構造体を自動 `#defstruct` 化、166 関数で値渡し ABI 修正、32 / 64 bit 検証済み。

### 標準プラグインの 64bit 対応

OpenHSP 標準同梱のプラグイン (hspvoicevox / hgimg / hgimgx / hspinet / hspsock / hspda / hspdb / hspsw / hspprint / Hspext / obaq 等) は、上記新規開発分とは別に **64bit ビルドへの対応作業** を行っています。機能追加ではなく、x64 ターゲットでもビルド・動作するようにしたものです。

### `nhspc` — HSP風 .NET アセンブリコンパイラ ([`nhspc/`](nhspc/))

HSP に似た文法で **.NET DLL / EXE を直接生成** する独自コンパイラ。`System.Reflection.Emit` ベース、出力は .NET Framework 4.8 アセンブリ (IL)。

**言語機能 (Phase 1〜18 完了、157 ユニットテスト全パス):**

- クラス / インターフェース / 構造体 / enum / delegate / イベント / インデクサ / 演算子オーバーロード / ネストクラス / 静的コンストラクタ / デストラクタ / プロパティ
- 継承 / virtual / override / sealed / abstract
- if / else / elseif / repeat / loop / while / for / foreach / switch / case / break / continue
- try / catch / finally / throw + 例外フィルタ
- ref / out / params / デフォルト引数
- P/Invoke (`#dllimport` / `#dllfunc` の全オプション: EntryPoint / CharSet / CallingConvention / SetLastError / [MarshalAs] / [In] / [Out])
- COM 属性 (`#attribute`)
- 文字列補間 `$"..{x}.."` / 16 進数 `0xFF`/`$FF` / コロン区切り / 行継続 `\` / dim 省略 / `null`/`nullptr` / 値型メンバアクセス
- 三項演算子 `?:` / null 合体 `??` / `is` / `as` / `typeof` / ビット演算 / `++`/`--` / 複合代入

**ビルド出力オプション:**

- `-platform anycpu | x86 | x64 | anycpu32` — ターゲットアーキ (`PortableExecutableKinds` + `Preferred32Bit` 対応)
- `-target dll | exe` — 出力種別 (`#main` 自動判定もあり)
- `-subsystem console | windows` — GUI アプリの黒コンソール窓を抑制
- `-r <assembly>` / `#reference "..."` — 参照アセンブリ追加
- `-win32icon <file>` / `#icon "logo.png"` — Win32 アプリケーションアイコン埋め込み (.ico/.png/.bmp/.gif/.jpg/.tiff 対応、内部で 16/32/48/256 PNG エントリの .ico に自動変換)
- `#manifest "app.manifest"` — Win32 マニフェスト埋め込み
- `#version` / `#fileversion` / `#title` / `#company` / `#product` / `#copyright` 等のメタデータディレクティブ → `DefineVersionInfoResource()` で Win32 VERSIONINFO 自動生成
- `-debug` — Windows PDB 出力。`Pdb2PortablePdb.exe` で Portable PDB に変換可

**エディタ統合:**

- **`NhspEditor.exe`** — スタンドアロン WinForms エディタ (シンタックスハイライト + Platform/Target/SubSystem ドロップダウン + 実行時引数 TextBox 付き)
- **`vscode-nhsp/`** — VS Code 拡張 (シンタックスハイライト + コンパイル/実行/デバッグコマンド + LSP クライアント)
- **`vs2022-nhsp/`** — Visual Studio 2022 拡張 (TextMate 文法 + MEF 経由の `ILanguageClient` + bundled LSP server)。`install.bat /home /openfolder C:\proj` でワンショットセットアップ
- **`sakura/`** — サクラエディタ用 強調キーワード (`.kwd`) + キーワードヘルプ (`.khp`)、Shift-JIS + CRLF

**Language Server (`nhspls.exe`):**

nhspc のレキサー / パーサーをそのまま使った独自 LSP サーバ (JSON-RPC over stdio、Newtonsoft.Json ベース)。サポート機能:

- リアルタイム診断 (`publishDiagnostics`)
- アウトライン (`documentSymbol`)
- 補完 (`completion` — `#` 直後はディレクティブ、それ以外はキーワード/型/ユーザー定義)
- ホバー (`hover` — 型エイリアスは CLR 名、識別子はシグネチャ)
- 定義ジャンプ (`definition` — F12)

VS Code は同梱の最小 LSP クライアント、VS 2022 は `Microsoft.VisualStudio.LanguageServer.Client` MEF コンポーネント経由で使います。

---

## ディレクトリ構造

```
IronHSP_2026/
├── hsp3/                       — HSP3 ランタイム本体 (Win32 / x64)
├── hsp3net/                    — .NET 連携版 ランタイム
├── hsp3cnv/ hsp3dish/ hsp3embed/ hsp3ll/ hsp3rd/ hsp3rtest/
├── hspcmp/                     — HSP コンパイラ (#defstruct / NSTRUCT 対応)
├── plugins/win32/              — 同梱プラグイン
│   ├── hspcv4/                 — OpenCV 4.12 (200 命令 / 20 モジュール)
│   ├── hspdxlib/               — DXLib プラグイン化
│   ├── hspvoicevox/            — VOICEVOX 連携
│   └── ... (hgimg / hspinet / hspsock / hspda / hspdb / 他)
├── nhspc/                      — HSP風 .NET アセンブリコンパイラ
│   ├── NhspCompiler.Core/      — コアライブラリ (.NET 4.8 Class Library)
│   ├── nhspc/                  — CLI コンパイラ (nhspc.exe)
│   ├── NhspCompiler.Tests/     — 157 ユニットテスト
│   ├── NhspEditor/             — スタンドアロン WinForms エディタ
│   ├── NhspLanguageServer/     — LSP サーバ (nhspls.exe)
│   ├── NhspVsLanguageClient/   — VS 2022 用 MEF ILanguageClient
│   ├── Pdb2PortablePdb/        — Windows PDB → Portable PDB 変換ツール
│   ├── vscode-nhsp/            — VS Code 拡張
│   ├── vs2022-nhsp/            — VS 2022 VSIX ビルドツリー + install.bat
│   ├── sakura/                 — サクラエディタ強調キーワード
│   ├── docs/                   — nhsp_beginners.html / nhsp_reference.html
│   └── samples/                — サンプル .nhsp スクリプト
├── package/                    — HSP 配布用パッケージ素材
├── docs/                       — HSP 公式ドキュメント
└── License.txt / License_j.txt — OpenHSP オリジナルライセンス (BSD)
```

---

## ビルド方法

### HSP3 ランタイム本体

[`hsp3/win32/`](hsp3/win32/) (32bit) または [`hsp3/hsp3_64/`](hsp3/hsp3_64/) (64bit) の `.sln` を Visual Studio 2022 で開いて Release ビルド。

### `nhspc` コンパイラ + エディタ + LSP

```cmd
cd nhspc
"C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\MSBuild.exe" NhspCompiler.sln /p:Configuration=Release /m
```

これだけで以下がすべてビルドされます:

- `nhspc/nhspc/bin/Release/nhspc.exe` — CLI コンパイラ
- `nhspc/NhspEditor/bin/Release/NhspEditor.exe` — スタンドアロンエディタ
- `nhspc/NhspLanguageServer/bin/Release/net48/nhspls.exe` — LSP サーバ
- `nhspc/NhspVsLanguageClient/bin/Release/net472/NhspVsLanguageClient.dll` — VS 2022 LSP MEF
- `nhspc/Pdb2PortablePdb/bin/Release/net48/Pdb2PortablePdb.exe` — PDB 変換

テスト実行:

```cmd
nhspc\NhspCompiler.Tests\bin\Release\NhspCompiler.Tests.exe
```

### Visual Studio 2022 拡張 (nhsp-language.vsix)

```cmd
cd nhspc\vs2022-nhsp
build.bat                                  REM .vsix を生成 (PowerShell ベース、VS SDK 不要)
install.bat                                REM ビルド + インストール (確認ダイアログあり)
install.bat /q                             REM サイレントインストール
install.bat /home /openfolder C:\proj      REM Phase A+B+C 全部入り (NHSPC_HOME 自動設定)
uninstall.bat                              REM アンインストール
```

### VS Code 拡張

```cmd
cd nhspc\vscode-nhsp
install.bat
```

### `hspcv4` (OpenCV プラグイン)

```cmd
cd plugins\win32\hspcv4\build
build_all.bat                              REM OpenCV 4.12 を vcpkg 経由で取得しつつ x86/x64 両方ビルド
```

詳細は [`plugins/win32/hspcv4/docs/hspcv4_build.html`](plugins/win32/hspcv4/docs/hspcv4_build.html)。

---

## ブランチ

メイン開発ブランチは [`update-hsp3net`](https://github.com/inovia/IronHSP/tree/update-hsp3net)。`master` へのマージは未実施 (随時統合予定)。

---

## ライセンス

OpenHSP 3.8beta1 (BSD ライセンス) をベースとしているため、追加分も基本的に BSD ライセンスとして扱います。詳細は [`License.txt`](License.txt) / [`License_j.txt`](License_j.txt) を参照。

サードパーティライブラリ (OpenCV / Tesseract / Newtonsoft.Json / DxLib 等) はそれぞれの配布元のライセンスに従います。

---

## リンク

- 公式リポジトリ: https://github.com/inovia/IronHSP
- nhspc 言語リファレンス: [`nhspc/docs/nhsp_reference.html`](nhspc/docs/nhsp_reference.html)
- nhspc 入門: [`nhspc/docs/nhsp_beginners.html`](nhspc/docs/nhsp_beginners.html)
- HSP 本家: https://hsp.tv/
- OpenHSP: http://dev.onionsoft.net/
