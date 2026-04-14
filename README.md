# IronHSP

**.NET をフル活用できる、HSP 互換 + 拡張ランタイム / 言語スイート**

OpenHSP 3.8beta1 をベースに、.NET Framework 4.8 連携 / 64bit 対応 / wstr (UTF-16) / 構造体型 (NSTRUCT) / OpenCV 4 / DXLib / HSP風 .NET コンパイラ (nhspc) / Visual Studio 2022 + VS Code 統合まで、多数の機能を追加した実験プロジェクトです。

> Based on http://dev.onionsoft.net/svn/openhsp/trunk (Subversion) — 3.8beta1 系。`hspver "3.8beta1"`, see [`hsp3/hsp3config.h`](hsp3/hsp3config.h)

---

## 主な追加機能 (vanilla HSP3 との差分)

### ランタイム / 言語コア

- **`int64` / `long` 型** — Phase 1〜6 で導入。変数型・システム変数・関数・コンパイラリテラル・パラメータすべて対応。
- **`intptr` 型** — プラットフォーム依存サイズの整数型 (x86=32bit / x64=64bit)。`#func` / `#cfunc` / `#cfuncd` / `#cfuncf` / `#cfuncst` / `#comfunc` / `#cbmethod` の全 DLL 系関数で `int` / `int64` の代わりに使えて、**同じ HSP source が x86/x64 両方で動く**。HANDLE / ポインタ系引数を書くときに使う。hsp3net 専用。
- **`wstr` 型 (UTF-16 ワイド文字列)** — `L"..."` リテラル + 文字列関数 / 命令 / `note` 系 / 自動変換まで全 Phase 完了。
- **構造体型 `HSPVAR_FLAG_NSTRUCT`** — `#defstruct` / `stdim` で確保。`#field` / `#defunion` / `pack` / `Size` / `LayoutKind` 全対応。`#cfuncst` で構造体戻り値 DLL 関数を呼べる、`callfuncst` で動的呼び出し可。`varsize(STRUCT)` で型サイズ取得。`MPTYPE_STRUCTVAL` で構造体値渡しも対応。
- **.NET 連携 (hsp3net)** — Phase 7〜12 で `loadnet` / `newnet` / `netres` / `mcall` 等を通じて任意の .NET 4.8 アセンブリを呼び出せます。例外処理 (`neterror` / `netexerr`)、`CnvCustom`、`tonet`、Enum 変換、`objprm` 対応済み。
- **DLL の double / float 戻り値** — `#cfuncd` / `#cfuncf` / `callfuncd` / `callfuncf`。
- **`setcallback` / `callbackarg`** — flat C 関数コールバックを HSP ラベルから生成 (動的 thunk)。WNDPROC や SetWindowsHookEx 等に渡せる。hsp3net 専用。
- **COM コールバックインターフェース (`#defcbcom`)** — `IDropTarget` / `IBindStatusCallback` 等の COM インターフェースを HSP 側で実装し、外部 COM API に渡せる。`#cbmethod` で各メソッドを HSP ラベルにマッピング、`newcomcb` でインスタンス化、`comprm()` / `comcbidx()` / `comcbtag()` / `comret` で実行コンテキストにアクセス。IUnknown (QI/AddRef/Release) は runtime が自動実装。x86/x64 両対応の動的 vtable トランポリン生成。hsp3net 専用。詳細は [`package/win32/sample/cbcom/`](package/win32/sample/cbcom/)。
- **WinForms 統合** — `screen` を Form として扱い、HSP の GUI オブジェクトを .NET 化。

### 新規プラグイン

- **hspcv4** ([`plugins/win32/hspcv4/`](plugins/win32/hspcv4/)) — OpenCV 4.12 + opencv_contrib をベースに新規開発したプラグイン。**全 200 命令以上** (main 12 + contrib 8 = 20 モジュールカバー)。FreeType / HarfBuzz による日本語フォント描画、Tesseract OCR、wechat_qrcode、saliency、SWT text detection、stereo / xfeatures2d / ximgproc / ml / face / dnn 等、フル装備。**アルファチャンネル対応 (Phase 1-3 完了)**: `cv4load` がデフォルトで `IMREAD_UNCHANGED` を使い PNG 等の BGRA を保持、`with_alpha_preserved` ヘルパーで blur/filter2d/canny/sobel/morphology 等の主要フィルタ系がアルファを自動分離・再合成、`cv4_get_pixela` で 4ch ピクセル読み取り対応。

### 大幅拡張したプラグイン

- **hspdxlib** ([`plugins/win32/hspdxlib/`](plugins/win32/hspdxlib/)) — [DX ライブラリ (山田 巧 氏)](https://dxlib.xsrv.jp/) を `#uselib` / `#func` / `#cfunc` / `#cfuncst` で呼べるよう自動ラッパ生成。`gen_hspdxlib.py` で 55 構造体を自動 `#defstruct` 化、166 関数で値渡し ABI 修正、32 / 64 bit 検証済み。

### Pure HSP モジュール

- **hspd2d** ([`package/win32/common/hspd2d.hsp`](package/win32/common/hspd2d.hsp)) — DirectWrite + Direct2D + WIC を **HSP の COM 機能 (`#usecom` / `#comfunc` / `newcom -1/-2`) だけで wrap** したモジュール。C++ DLL を介さずに高品質テキスト描画と画像読み書きを実現。`d2d_init` / `d2d_image_create` / `d2d_image_load` / `d2d_clear` / `d2d_font` / `d2d_color` / `d2d_drawtext` / `d2d_drawline` / `d2d_drawrect` / `d2d_fillrect` / `d2d_drawellipse` / `d2d_fillellipse` / `d2d_drawimage` / `d2d_image_save` 等のコマンドを提供。PNG / BMP / JPEG / TIFF / GIF 形式のロード・保存対応。`D2D1_DRAW_TEXT_OPTIONS_ENABLE_COLOR_FONT` を有効にしているので **Segoe UI Emoji 等の COLR/CPAL カラーフォントによる絵文字** も自動で色付き描画される。サンプル: [`package/win32/sample/hspd2d/`](package/win32/sample/hspd2d/)。

### Win32 API 大幅拡充 (CsWin32 bridge)

OpenHSP 標準の `package/win32/common/user32.as` / `kernel32.as` / `gdi32.as` 等は古く (sptr ベース、構造体未対応、x64 で破綻ぎりぎり)、kernel32.dll の 1449 exports に対して 67 関数 (4%) しかカバーできていなかった。これを **dumpbin による実 DLL exports 走査 + Microsoft の [win32metadata](https://github.com/microsoft/win32metadata) (CsWin32 source generator)** をベースに体系的に再構築:

- **30 DLL / 4338 関数 / 118 COM インターフェース / 1238 COM メソッド / 全 28373 entries 日本語 MSDN ヘルプ付き** ([`package/win32/common/*_gen2.as`](package/win32/common/) + [`package/hsphelp/win32_*_gen2.hs`](package/hsphelp/))
- 自動 A/W 選択 (`CreateFileW` / `MessageBoxW` / `RegOpenKeyExW` 等が自動でユニコード版を選択)
- 完全な `intptr` / `wstr` / `var` (NSTRUCT pointer) 型マッピング
- 全定数 enum を自動 `#define` 展開 (`SW_*` / `SM_*` / `WS_*` / `MB_*` / `WM_*` / `KEY_*` 等)
- 共有 `win32_types_gen2.as` に 734 構造体 + 608 enum 群を集約 (各 DLL .as は `#include` で参照)
- `#usecom` / `#comfunc` 形式で COM インターフェース ([IFileDialog](package/win32/common/com_misc_gen2.as) / IDropTarget / IShellLinkW / IDataObject / ID2D1Factory / IDWriteFactory / IWICImagingFactory / IDXGIFactory 等) も自動生成

#### カバー DLL 一覧

| カテゴリ | DLL |
|---|---|
| ベース | kernel32 (881), user32 (606), advapi32 (419), oleaut32 (404), gdi32 (384), crypt32 (218), shell32 (195), wininet (192), winmm (146), ole32 (143), dbghelp (128), comctl32 (94) |
| その他 | uxtheme (77), imm32 (63), bcrypt (53), winhttp (46), netapi32 (45), userenv (34), dwmapi (31), psapi (20), shlwapi (15), version (7), wintrust (7), msimg32 (3), comdlg32 / ncrypt / normaliz / propsys 他 |

#### パイプライン

```
dumpbin /exports → tools/cswin32_bridge/dump_exports.py → NativeMethods.txt
                                                              ↓
                                          dotnet build (CsWin32 SourceGenerator)
                                                              ↓
                              tools/cswin32_bridge/gen_from_cswin32.py (Python)
                                                              ↓
                         package/win32/common/<dll>_gen2.as + win32_types_gen2.as
                         package/hsphelp/win32_<dll>_gen2.hs (英語/日本語 fallback)
```

`tools/cswin32_bridge/docs_ja.json` (25422 entries) と `tools/cswin32_bridge_com/docs_ja.json` (2951 entries) に MSDN-JP 準拠の常体翻訳をキャッシュ。再生成時に自動的に日本語ヘルプとして埋め込まれる。

新規 API を追加するときは `NativeMethods.txt` に 1 行追加 → `dotnet build` → `python gen_from_cswin32.py` だけで .as / .hs まで完成する。詳細は [`tools/cswin32_bridge/`](tools/cswin32_bridge/) と [`tools/cswin32_bridge_com/`](tools/cswin32_bridge_com/)。

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
