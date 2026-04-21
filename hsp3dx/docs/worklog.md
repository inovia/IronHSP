# hsp3dx 作業ログ

hsp3dx プロジェクトのセッション単位の作業記録。リバース年代順 (新しい作業が上)。
仕様書 ([hsp3dx_spec.md](../../docs/hsp3dx_spec.md)) は **決めごと** を、本ログは
**何をしたか・何に詰まったか・なぜそう決めたか** を書く。

---

## 2026-04-21 (Phase 1.2: mes 命令 + 文字列描画)

### (これから commit) @ 20:00 — Phase 1.2: mes / title / dialog 実装 + console バッファ + UTF-8 描画 (実機で日本語表示 OK)

**やったこと**
- **`hsp3dx_console.{h,cpp}`** 新規 — mes / print 用のテキストリングバッファ
  (64 行 × 512 bytes)。改行毎に新しい行を追加、最大行超過時は先頭をスクロール
- **`hsp3dx_extcmd.cpp`** 新規 (`hsp3dx_stubs.cpp` を置き換え) — cmdfunc_extcmd と
  reffunc_function を実装、Phase 1.2 スコープ:
  - `0x03` dialog: Win32 `MessageBoxA` で暫定代用
  - `0x0f` mes / print: `hsp3dx_console_append` でバッファに追記
  - `0x10` title: DxLib `SetMainWindowText` 経由でウィンドウタイトル更新
  - それ以外の extcmd は `HSPERR_UNSUPPORTED_FUNCTION` を throw
  - reffunc も全部 UNSUPPORTED throw (Phase 1.3 で sysinfo/dirinfo/exist 実装予定)
- **main.cpp** のレンダループに `hsp3dx_console_render_dxlib(10, 10, 0xFFFFFF)` を追加、
  VM が mes で書いた内容が画面に白文字で表示される
- **vcxproj** を更新: stubs.cpp 除去 → extcmd.cpp + console.cpp 追加

**詰まりどころ (UNICODE 問題)**
- 最初は `UNICODE;_UNICODE` を削除したが、`hsp3utfcnv.cpp` / `dpmread.cpp` /
  `supio_win_unicode.cpp` は `_tfopen` / `TEXT()` / `GetModuleFileName` など TCHAR
  マクロを使っているので UNICODE 必須。削ると wchar_t ↔ char 変換エラーが再発
- 一方で DxLib は UNICODE 定義下で `DrawString` が `const wchar_t*` を要求、
  `SetUseCharCodeFormat(DX_CHARCODEFORMAT_UTF8)` も UNICODE 版では無効化される
  仕様 (DxLib.h コメントより)
- **解決策**: global UNICODE 有効のまま、hsp3dx_console.cpp 側で UTF-8 char* を
  `MultiByteToWideChar(CP_UTF8, ...)` で wchar_t* に変換してから DxLib に渡す運用

**動作確認**
- ビルド成功: hsp3dx.exe 6.95 MB、警告ゼロ
- `start.hsp` (`mes "hello, hsp3dx!"` + 日本語 UTF-8 `mes` + `end`) を hspcmp64 で
  `.ax` に変換
- ユーザー実機で hsp3dx.exe を起動 → **ウィンドウに hello メッセージが正しく表示** ✅
- **Phase 1.2 実機動作確認 完了**

**mojibake 対応の経緯**
- 初回表示で日本語部分 "これは UTF-8 文字列" が "縺薙丨縺ッ UTF-8 譁・ュ恰・" に化けた
- .ax の hex dump で原因判明: "これ" が UTF-8 `E3 81 93 E3 82 8C` ではなく
  `E7 B8 BA E8 96 99` (= 縺薙の UTF-8 エンコーディング) として格納されていた
- 理由: `hspcmp64` を `-u` (出力 UTF-8) のみで実行、`-i` (入力 UTF-8) を指定していなかった
  ため、UTF-8 ソースを SJIS と誤認して 2 バイトごとに Unicode 文字へ誤変換、それを UTF-8 で出力
- `-i -u` 両方指定で再コンパイル → 正しい UTF-8 バイト列 `E3 81 93...` が .ax に格納 → 表示 OK
- hsp3dx ランタイム側のコードには問題なし (ビルド更新不要)

**詰まりどころ (再発防止ドキュメント)**
- `#cmpopt utf8 1` だけでは入力エンコーディングが SJIS のまま → 必ず hspcmp コマンドライン
  に `-i` を指定する必要あり
- `phase1_setup.md` に `-i -u` 両方必須の注意を赤字で追記

**追加成果物**
- `hsp3dx/samples/sample_mes.hsp` — Phase 1.2 動作確認用サンプル (UTF-8)
- `phase1_setup.md` の「動作確認」セクションを実機再現手順に更新

**決めごと**
- UNICODE 定義は global で有効、DxLib 境界で `MultiByteToWideChar` 明示変換
- mes の \n は `code_getdi(0)` が 0 (通常 mes) なら付加、1 (print) なら付加しない
- テキストレンダリングは固定 18px 行高 (Phase 1.3 で font サイズ可変化予定)

---

## 2026-04-20 (初日: Phase 0 全走破 + Phase 1.0 起点 + Phase 1.1 VM 統合)

### 01444ec7 @ 20:59 — Phase 1.1: hsp3 VM コア統合 + hsp3dxcl ドライバ

**やったこと**
- **設計訂正**: VM ベースを `hsp3embed` fork から **`hsp3/` コア (`Hsp3` クラス) fork** に変更
  - 根拠: `hsp3embed` の `Hsp3r::Reset()` は `__HspInit(Hsp3r*)` を **hsp3cnv が .ax ごとに
    自動生成** する前提で、AOT 翻訳モデル専用。Route B (runtime .ax interpret) と非互換
  - `hsp3/` の `Hsp3::Reset(int mode)` は runtime で `.ax` ファイルを読み込んで HSPHED 解析
    まで自己完結。標準 `hsp3cl.exe` が採用している方式
  - 仕様書 §1 / §3.5 / §6.2 / §6.3 / §9 を訂正、MD/HTML 両方
- **vcxproj 更新**: `hsp3/` コアの 19 ファイル + `win32gui/supio_win_unicode.cpp` を追加
- **`hsp3dxcl.{h,cpp}` 新規作成** — `hsp3/win32/hsp3cl.cpp` を参考に、COM / ComCtrl /
  Win32 MessagePump / Debug Dialog / DLL ロードを削った cross-platform ミニマル版:
  - `Hsp3` インスタンス管理
  - `Hsp3::Reset()` で .ax ロード
  - `msgfunc` は tick ベース wait のみ (PeekMessage 依存なし)
  - `code_execcmd()` を呼ぶ実行ループ
- **`hsp3dx_stubs.cpp` 新規作成** — `hsp3typeinit_cl_extcmd` / `hsp3typeinit_cl_extfunc` の
  空実装 (Phase 1.2 で mes / wait / await 等を実装予定)
- **`main.cpp` 書き直し** — DxLib init → VM init + .ax ロード → VM 実行 → ESC 待ち → 終了
- **Preprocessor 追加**: `HSP64` / `HSPWIN` / `HSPUTF8` / `UNICODE` / `_UNICODE` /
  `_CRT_SECURE_NO_WARNINGS`
- **ビルド成功**: `hsp3dx.exe` 6.94 MB (Phase 1.0 比 +150 KB = hsp3 VM コア 19 ファイル分)

**詰まりどころ**
- 初回ビルドで `supio_win_unicode.cpp` に大量の `wchar_t → char` 変換エラー
  → 原因: `UNICODE` / `_UNICODE` マクロが未定義だったため TCHAR マクロが ANSI 版 API に展開
    されていた。`hsp3utfcnv.cpp` / `dpmread.cpp` でも同様
  → 対策: preprocessor に `UNICODE;_UNICODE` 追加で `_wfopen` / `MessageBoxW` 等 wide 版
    に正しく展開され、すべて解消

**制約 (Phase 1.1 時点)**
- 拡張命令 (`mes` / `wait` / `await` / `exist` など) は未実装スタブ
  → 実際の HSP 命令を含む .ax を走らせると runtime error になる見込み
  → Phase 1.2 で extcmd テーブルを埋めていく
- 起動時の挙動: DxLib ウィンドウが開き、`start.ax` を読み込み試行。実行が終わったら
  ESC で終了
- 実動作確認 (GUI) は sandbox 環境では実行不可のため未検証。コンパイル/リンクの成功のみ確認

**決めごと**
- VM ベース確定: `hsp3/` コア、`hsp3embed` は採用しない
- Phase 6 到達時に hsp3net 系への統合判断を再考する点は据え置き

### ed9117ec @ 20:57 — DxLib SDK 配置 + Phase 1.0 の初回ビルド成功

### ed9117ec @ 20:57 — DxLib SDK 配置 + 初回ビルド成功

**やったこと**
- `DxLib_VC3_24f.zip` (206 MB) を `https://dxlib.xsrv.jp/DxLib/DxLib_VC3_24f.zip` からダウンロード
- 展開して日本語フォルダ「プロジェクトに追加すべきファイル_VC用」の中身 (約 424 ファイル)
  を `hsp3dx/extlib/dxlib_win/DxLib_VC/` にフラット配置 (SDK 本体は `.gitignore` 済)
- vcxproj を flat 配置に合わせて修正:
  - include path と lib path を同じ `DxLib_VC/` に統一
  - `DxLib_x64.lib` の明示リンク指定を削除 (`DxLib.h` 内 `#pragma comment(lib,...)` が自動選択)
  - `/utf-8` フラグ追加 (UTF-8 ソース固定のため必須)
  - `/wd4828` で DxLib.h 内 SJIS 日本語コメントの警告抑制
- `hsp3dx.exe` (6.78 MB) を VS 2022 v143 / x64 / Release / MT で **ビルド成功**、警告ゼロ

**詰まりどころ**
- 初回ビルドで大量の構文エラーが連鎖発生 → 原因は MSVC が UTF-8 ソースを SJIS として誤解釈
  していたため (WC 4819 警告が手がかり)。`/utf-8` 追加で解消
- DxLib ライセンス条項は公式ダウンロードページに直リンクがなく、配布 zip 内 `DxLib.txt`
  (SJIS) に書かれていた → `iconv` で UTF-8 変換して確認

**決めごと**
- DxLib は git 管理しない (ユーザー個別 DL)
- 再配布時には `DX Library Copyright (C) 2001-2025 Takumi Yamada.` 表記を入れる
- 商用利用 OK、ライセンス料なし (山田巧氏の寛容な方針)

### 0ea34c57 @ 20:56 — DxLib 公式 DL URL 調査 + iOS/Android extlib プレースホルダ

**やったこと**
- `https://dxlib.xsrv.jp/dxdload.html` を WebFetch で調査、3 プラットフォーム分の zip URL 取得
  - Windows: `DxLib_VC3_24f.zip` (~206 MB)
  - Android:  `DxLib_Android3_24f.zip` (~75 MB)
  - iOS:      `DxLib_iOS3_24f.zip` (~78 MB)
- 最新版は **Ver3.24f** (仕様書 §5.2 の UTF-8 モード要件合致)
- Phase 3/4 用の `hsp3dx/extlib/dxlib_{ios,android}/README.md` を先に作成 (将来忘れない)
- `.gitignore` に 3 プラットフォーム分の除外ルール追加

### c5af57fa @ 20:55 — Phase 1.0 Windows 版 scaffold

**やったこと**
- `hsp3dx/extlib/dxlib_win/README.md` — DxLib SDK 取得・配置手順
- `hsp3dx/src/` スケルトン:
  - `main.cpp` — WinMain (`.ax` ロード + DxLib init + 空ループ、ESC で終了)
  - `hgio_dx.{h,cpp}` — hgio 互換 API を DxLib 呼び出しに転送する層 (init / ProcessMessage /
    ScreenFlip / CheckHitKey / GetMousePoint のみ)
- `hsp3dx/win32/hsp3dx.vcxproj` — VS 2022 v143 / x64 / `_HSP64`/`HSP3DX` define / MT CRT
- `hsp3dx/docs/phase1_setup.md` — Phase 1 サブ Phase 進捗表 + ビルド手順
- `.gitignore` — DxLib SDK と `hsp3dx/{bin,obj}` 除外

---

### 69b02a21 @ 20:54 — §3.7 コールバック方針 (iOS/Android 制約対応)

**やったこと**
- iOS の W^X 制約 (動的コード生成禁止) と Android 10+ の制限強化を整理
- コールバック 3 技法の対応表: 静的スロット trampoline ✅ / 動的 trampoline ❌ iOS / CLR thunk ❌ iOS
- **hsp3dx は静的スロット方式を採用** — ビルド時に signature family ごとに N 個の C 関数を
  事前生成し、スロット ID → HSP ラベル ID マップで dispatch
- HSP3 classic の `callback` 命令 / hsp3net の `#defcbcom` は mobile 動作不可と明記
- Phase 対応: Phase 1 不使用 → Phase 5 導入 → Phase 6 本命 (SetMovieSurfaceCallback など)

### 81475bc2 @ 20:53 — §3 型システムの進化計画

**やったこと**
- DxLib の float / struct (VECTOR / MATRIX / VERTEX3D) / 構造体配列 / コールバック使用状況を整理
- hsp3net にあって hsp3embed に無い型機構: `#cfuncf` / `#cfuncst` / `NSTRUCT` / `#defcbcom`
- 3 方針の比較表:
  - 方針 1: プラグインで全吸収 (スカラ分解) — Phase 1-3
  - 方針 2: float + `#cfuncf` だけ追加 — Phase 4-5
  - 方針 3: NSTRUCT / cfuncst フル移植 — Phase 6
- Phase 6 到達時に hsp3embed / hsp3net / hsp3 のどれを長期ベースにするか再考する判断ポイント明記
- MD/HTML 両方で §番号を 3→4, 4→5, … に繰り下げ、TOC / anchor 更新

### f7a26c2c @ 20:52 — Route B 採用 (全プラットフォーム VM interpret)

**やったこと**
- **VM ベースを `hsp3embed` fork に確定** (リポジトリ内に既存、HSPIOS/HSPNDK 分岐 + iOS/misc.mm
  があり mobile ビルド実績あり)
- **過去の誤認識を訂正**: 「hsp3cnv は .ax をバイト配列化するだけ」は誤り。実際は各 HSP タスクを
  `static void L0001(void){...}` に AOT 翻訳する code generator。HSP3Dish mobile は AOT 方式
- Route A (hsp3dish AOT) と Route B (全 VM interpret) を比較し、**差別化を重視して Route B を採用**
- hsp3dx_cnv は単純なバイト配列書き出しツールに再定義 (hsp3cnv 流用しない)
- ランタイム構成図を 2 層 (hgio_dx + dxlib_core) に書き直し

**ユーザー指摘で判明した重要な事実**
- HSP3Dish iOS/Android は `.ax` を直接読んでいない → AOT 翻訳で C++ になって native ビルドされる
  ため。初回説明時に誤って「バイト列埋め込み」と言っていた

### a47469c8 @ 20:51 — HTML 版仕様書

**やったこと**
- `docs/hsp3dx_spec.html` を既存 docs/ の CSS スタイル (wstr_design.html 他共通) で整形
- TOC, hgio 差し替え戦略の ASCII 図、OK/NG プラグインのカラー区分、Phase バッジなど視覚化

### 91a73a5e @ 20:50 — Phase 0 設計資料 + 移行ツール + ディレクトリ雛形

**やったこと**
- `docs/hsp3dx_spec.md` 初版: HSP コマンド採用/除外分類、文字コード規則、Phase 計画
- `tools/hsp3dx_sjis2utf8/` — .NET 8 CLI、`.hsp` / `.as` を Shift-JIS → UTF-8 (BOM なし) 変換
  - BOM / ASCII / 既に UTF-8 のファイルは自動スキップ
  - `--dir --recursive --dry-run` オプション
  - `dotnet build` 成功、SJIS "テストデータ" → UTF-8 変換 smoke test pass
- `hsp3dx/samples/` — Phase 1 用検証サンプル雛形 (DrawGraph / Sound / Mouse)
- `hsp3dx/{win32,ios,ndk}/README.md` — 各プラットフォームビルド構成の配置先プレースホルダ

---

## 次回作業予定: Phase 1.1 — hsp3embed VM 組み込み

**目標**: `hsp3dx.exe` が `.ax` を読んで実行できるようにする

**タスク候補**
1. `hsp3embed/*.cpp` を vcxproj に追加 (`hsp3embed.cpp` / `hsp3code.cpp` / `hsp3r.cpp` /
   `hspsource.cpp` / `hspvar_util.cpp` / `misc.cpp`)
2. 依存する `hsp3/` 配下のコアソース (VM 本体、型システム、命令ディスパッチ) も追加
3. `hsp3eb_init` / `hsp3eb_exec` を main.cpp から呼ぶ経路を通す
4. `.ax` バイト列を hsp3embed に食わせる仕組み (`__HspInit` 代替 or 独自ローダ)
5. 動作確認用の最小 `.ax` (`mes "hello"` だけ) を実行

**事前の調査が必要なこと**
- `__HspInit( Hsp3r *hsp )` は hsp3embed.cpp 内で `extern` 宣言されているだけ。実体は
  どこに定義されているか要確認 (`hsp3cl_64` / `hsp3dish` どちらか)
- hsp3embed の start.ax ロード経路 (直接 `.ax` を読む API がないように見える)
- `HSPDISHGP` / `USE_OBAQ` などの define を hsp3dx でどう扱うか
