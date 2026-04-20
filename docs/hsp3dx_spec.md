# hsp3dx 仕様書 (Phase 0 ドラフト)

**hsp3dx** は HSP3 言語を DxLib ベースのランタイムで動かすクロスプラットフォーム実行環境です。**Windows / iOS / Android** の 3 プラットフォームで **同一の `.ax` バイト列** を実行できることを目指します。

---

## 1. 設計コンセプト

| 項目 | 方針 |
|---|---|
| VM | HSP3 インタプリタをそのまま流用 (hsp3net / hsp3dish のコア) |
| 描画 / 音声 / 入力 | すべて DxLib 経由に差し替え |
| `.ax` バイト列 | 3 プラットフォーム共通 |
| `.ax` 配布経路 | Win = ファイル直読み / iOS = bundle 埋め込み / Android = assets 埋め込み |
| JIT | なし (インタプリト実行、iOS 禁止のため) |
| ポインタ幅 | 64bit 固定 (`#bootopt hsp64 1` 既定) |
| 文字コード | UTF-8 固定 (3 プラットフォーム共通) |

### HSP3Dish との差別化ポイント

- **DxLib の豊富な API** をそのまま呼べる (3D / エフェクト / 動画再生 / ネットワークなど 2000 関数超)
- DxLib 既存ユーザーの資産移行パス
- DxLib 公式 mobile サポートに乗るので、プラットフォーム追随コストを DxLib 側に委譲

---

## 2. HSP コマンド分類

### 2.1 採用する (pure HSP / 言語コア)

| 分類 | コマンド |
|---|---|
| 制御 | `if` / `else` / `repeat` / `loop` / `break` / `continue` / `foreach` / `return` / `gosub` / `goto` / `on` / `switch` / `case` / `default` / `swbreak` / `swend` |
| 変数宣言 | `dim` / `ddim` / `sdim` / `ldim` / `alloc` / `dimtype` |
| 配列・メモリ | `length` / `length2` / `length3` / `length4` / `memcpy` / `memset` / `dup` / `dupptr` / `mref` / `vartype` / `varuse` / `varsize` |
| 文字列 | `strmid` / `instr` / `strf` / `split` / `getstr` / `strtrim` / `strrep` / `cnvstow` / `cnvwtos` |
| 数学 (整数) | `int` / `abs` / `limit` / `rnd` / `srand` |
| 数学 (浮動小数) | `double` / `sin` / `cos` / `tan` / `atan` / `sqrt` / `pow` / `exp` / `log` / `absf` |
| 型変換 | `str` / `int` / `double` / `char` / `cnvint` / `cnvwide` |
| ファイル | `exist` / `bsave` / `bload` / `fileopen` / `fileclose` / `fileread` / `filewrite` / `bsave` |
| プロセス制御 | `wait` / `await` / `stop` / `end` / `exgoto` |
| デバッグ | `mes` (DxLib の `DrawString` にリダイレクト) / `logmes` / `title` (`SetMainWindowText`) / `assert` |

### 2.2 除外する (Win32 依存)

| 分類 | 除外コマンド | 理由 |
|---|---|---|
| GUI ウィジェット | `button` / `mesbox` / `chkbox` / `combox` / `listbox` / `input` / `objprm` / `objsel` / `objmode` / `clrobj` / `objsize` | Win32 Common Controls 前提 |
| HSP 標準描画 | `color` / `palette` / `palcolor` / `palfade` / `pset` / `line` / `boxf` / `circle` / `pget` / `gcopy` / `gzoom` / `gmode` / `gsquare` / `grotate` / `celput` / `celload` / `celdiv` / `redraw` / `screen` / `bgscr` / `gsel` / `buffer` / `picload` / `bmpsave` | DxLib に置換 |
| HSP 標準音声 | `mmload` / `mmplay` / `mmstop` / `mmvol` / `mmpan` / `mci` | DxLib に置換 |
| HSP 標準入力 | `getkey` / `mousex` / `mousey` / `mousew` / `mouse` / `stick` / `onkey` / `onclick` | DxLib に置換 |
| ダイアログ | `dialog` | DxLib で簡易代替 (`MessageBoxSetNomalFontSize` + `DrawString`) |
| COM | `newcom` / `delcom` / `comobj` / `comres` / `comevent` / `comevarg` / `comevdisp` / `axobj` | Win32 COM 前提 |
| レジストリ | `regread` / `regwrite` / `regdel` | Win 固有 |
| Win32 API 直叩き | `#uselib` (任意 DLL) / `dllproc` / `dllfunc` / `dllctrl` / `winobj` | iOS 禁止 / Android NDK 面倒 |
| イベント | `onerror` / `oncmd` | Win32 メッセージ依存 |

### 2.3 DxLib 経由で置換提供する命令

詳細は Phase 1 以降で 40 関数から順次拡張。分類:

- **描画**: `dx_drawgraph` / `dx_drawbox` / `dx_drawline` / `dx_drawcircle` / `dx_drawstring` / `dx_loadgraph` / `dx_screenflip` / `dx_cleardrawscreen`
- **音声**: `dx_loadsoundmem` / `dx_playsoundmem` / `dx_stopsoundmem` / `dx_setvolumesoundmem`
- **入力**: `dx_getmouseinput` / `dx_getmousepoint` / `dx_getjoypadinputstate` / `dx_checkhitkey` / `dx_getinputstring`
- **ウィンドウ**: `dx_setwindowtext` / `dx_setgraphmode` / `dx_setwindowstyle` / `dx_changewindowmode`
- **タイマ**: `dx_gettickcount` / `dx_getnowcount`
- **3D**: `dx_loadmodel` / `dx_drawmodel` / `dx_setcameraposeye` (Phase 4+)
- **動画**: `dx_playmovie` / `dx_pausemovie` (Phase 4+)
- **ネットワーク**: `dx_connectnetwork` / `dx_netsend` / `dx_netrecv` (Phase 4+)

---

## 3. プラグイン方針

### 3.1 `#uselib` での任意 DLL ロードは **禁止**

iOS ではダイナミックロードが原則禁止、Android でも .so の外部ロードは面倒で配布負荷が高いため。

### 3.2 同梱プラグインは **事前承認制** (静的リンク)

hsp3dx ランタイムのビルド時に静的リンクされたプラグインだけがユーザーから利用可能。

**OK プラグイン (pure HSP / クロスプラットフォーム対応可)**:
- `iron_math_ex.hsp` — 数値計算拡張 (pure HSP)
- `iron_json.hsp` — JSON パーサ (pure HSP)
- `iron_csv.hsp` — CSV パーサ (pure HSP)
- `iron_vector.hsp` — ベクタ演算 (pure HSP)
- `iron_matrix.hsp` — 行列演算 (pure HSP)
- `iron_curvefit.hsp` / `iron_curvefit_ex.hsp` — カーブフィット (pure HSP 部分のみ)
- `iron_knn.hsp` / `iron_kmeans_nd.hsp` / `iron_pca.hsp` — 機械学習 (pure HSP)
- `iron_scaler.hsp` / `iron_split.hsp` / `iron_metrics.hsp` — 前処理/評価

**NG プラグイン (除外)**:
- `iron_*_net.hsp` — .NET 依存
- `hsp3net` 系 — CLR ホスティング前提
- `hspcv4` — OpenCV 依存、mobile ビルドが重い
- `hspsockm` — Win32 WinSock 依存 (→ `dx_connectnetwork` で代替)
- `hspcomponent` — COM 依存
- `hspext` — Win32 拡張
- `hspda` — DirectAudio 依存

---

## 4. 文字コード規則

### 4.1 統一ルール

| 層 | エンコーディング |
|---|---|
| `.hsp` ソースファイル | **UTF-8 (BOM なし)** 必須 |
| `hspcmp` オプション | `#cmpopt utf8 1` 相当を既定 |
| `.ax` 内文字列テーブル | UTF-8 バイト列 |
| ランタイム内部文字列 | UTF-8 |
| DxLib 呼び出し | `SetUseCharCodeFormat(DX_CHARCODEFORMAT_UTF8)` を起動時固定 |
| ファイルパス | UTF-8 (Win は `_wfopen` 経由で UTF-16 変換、iOS/Android はネイティブ UTF-8) |
| フォントファイル (.ttf/.otf) | バイナリなので非依存 |

### 4.2 DxLib 公式ドキュメント準拠

- Windows DxLib: デフォルトは Shift-JIS / UTF-16LE。`SetUseCharCodeFormat` で切り替え
- Android / iOS DxLib: UTF-8 固定
- hsp3dx ランタイムは **起動時必ず `SetUseCharCodeFormat(DX_CHARCODEFORMAT_UTF8)` を呼ぶ** → 3 プラットフォームで統一

### 4.3 移行時の既知の落とし穴

1. **Shift-JIS の 2 バイト目 0x5C 問題**: `表` (0x95 0x5C) などの文字がリテラル中に出ると 0x5C がエスケープ文字として解釈されてリテラルが破壊される → **UTF-8 化で自動解消**
2. **`sdim` のサイズ指定**: UTF-8 では 1 文字 1〜4 バイト。Shift-JIS で 2 バイトだった文字が UTF-8 で 3 バイトになる例が多数 → **バッファサイズを 1.5 倍程度で見積もる**
3. **`strlen` は文字数ではなくバイト数** (既存 HSP と同じだが UTF-8 では差が顕著になるので再注意)
4. **`poke`/`peek` でバイト単位に触っている既存コード**: 非互換、書き換え必須
5. **DxLib API 引数**: `SetUseCharCodeFormat(DX_CHARCODEFORMAT_UTF8)` 呼び出し後は UTF-8 で渡せばよく、特別な変換は不要

### 4.4 既存資産の移行サポート

`tools/hsp3dx_sjis2utf8/` に `.hsp` ソースを Shift-JIS → UTF-8 に一括変換するツールを同梱。使い方:

```
hsp3dx_sjis2utf8 --in path\to\src.hsp [--out path\to\dst.hsp]
hsp3dx_sjis2utf8 --dir path\to\project [--recursive]
```

---

## 5. ビルド/配布フロー

### 5.1 Windows

```
your_game.hsp  →  hspcmp (#cmpopt utf8 1, #bootopt hsp64 1)  →  start.ax
                                                               ↓
                                         hsp3dx.exe  ←  start.ax を読んで実行
```

### 5.2 iOS

```
your_game.hsp  →  hspcmp  →  start.ax
                              ↓
              hsp3dx_cnv  →  start.cpp (const unsigned char ax_data[] = { ... })
                              ↓
            Xcode project + libhsp3dx.a + DxLib iOS lib + start.cpp  →  .ipa
```

### 5.3 Android

```
your_game.hsp  →  hspcmp  →  start.ax
                              ↓
              hsp3dx_cnv  →  start.cpp
                              ↓
          Android Studio + libhsp3dx.so + DxLib Android lib + start.cpp  →  .apk
```

### 5.4 共通アセットパッケージング

`.ax` 以外の素材 (画像 / 音声 / フォント) は `hsp3dx_pack` ツール (Phase 2 で作成予定) で **仮想 FS** に固める。ランタイムはプラットフォーム問わず同じ API で素材にアクセスできる。

---

## 6. Phase 計画

| Phase | 内容 | 状態 |
|---|---|---|
| **Phase 0** | 仕様書 + SJIS→UTF-8 移行ツール + ディレクトリ雛形 | 作業中 |
| Phase 1 | Windows 版 `hsp3dx.exe` MVP (DxLib コア 40 関数 + 3 サンプル) | 未着手 |
| Phase 2 | `hsp3dx_cnv` ツール + `hsp3dx_pack` ツール | 未着手 |
| Phase 3 | iOS 版 `libhsp3dx.a` + Xcode テンプレ | 未着手 |
| Phase 4 | Android 版 `libhsp3dx.so` + Android Studio テンプレ | 未着手 |
| Phase 5 | DxLib API を 40 → 500 関数に拡張 | 未着手 |
| Phase 6 | 3D / 動画 / ネットワーク機能追加 | 未着手 |

---

## 7. ディレクトリ構成 (Phase 0 時点)

```
hsp3dx/
  README.md                    このドキュメントへのリンク
  samples/
    sample_drawgraph.hsp       Phase 1 検証用サンプル (雛形)
    sample_sound.hsp           Phase 1 検証用サンプル (雛形)
    sample_mouse.hsp           Phase 1 検証用サンプル (雛形)
  win32/                       Phase 1 で hsp3dx.exe のソース/vcxproj を配置
    README.md
  ios/                         Phase 3 で Xcode プロジェクトを配置
    README.md
  ndk/                         Phase 4 で Android Studio プロジェクトを配置
    README.md

docs/
  hsp3dx_spec.md               本ドキュメント

tools/
  hsp3dx_sjis2utf8/            SJIS → UTF-8 一括変換ツール (.NET)
    hsp3dx_sjis2utf8.csproj
    Program.cs
    README.md
```

---

## 8. 未確定事項 (Phase 1 着手時に決める)

- [ ] VM ソースは `hsp3net` を fork するか `hsp3dish` を fork するか
  - 候補: `hsp3dish` — cross-platform すでに対応済、hgio 層を差し替えるだけ
- [ ] DxLib SDK の取得方法 (公式配布 zip / Git submodule)
- [ ] DxLib ライセンス条項確認 (再配布可否)
- [ ] プラグイン ID テーブルの設計 (HSP 命令 ID 付与ルール)
- [ ] `sdim` のバイト数自動調整をランタイム側で行うか (互換性のため)
- [ ] `hsp3dx` 独自の拡張命令 (`dx_*` prefix) を `iron_dxlib.hsp` に畳み込むか、ランタイム組み込みにするか
