# hsp3dx 仕様書 (Phase 0 ドラフト)

**hsp3dx** は HSP3 言語を DxLib ベースのランタイムで動かすクロスプラットフォーム実行環境です。**Windows / iOS / Android** の 3 プラットフォームで **同一の `.ax` バイト列** を実行できることを目指します。

---

## 1. 設計コンセプト

| 項目 | 方針 |
|---|---|
| VM ベース | **`hsp3embed` を fork** (`HSPIOS` / `HSPNDK` 分岐が既存、mobile ビルド実績あり) |
| 描画 / 音声 / 入力 | hgio 層を DxLib バックエンドに差し替え (`hgio_dx.cpp`) |
| DxLib 全 API 公開 | `dxlib_core` プラグインを静的リンク (`dx_*` 命令として HSP 側に公開) |
| `.ax` バイト列 | 3 プラットフォーム共通、**すべて VM インタプリトで実行** |
| `.ax` 配布経路 | Win = ファイル直読み / iOS = bundle 内バイト配列 / Android = assets 内バイト配列 |
| JIT | なし (インタプリト実行、iOS 禁止のため) |
| ポインタ幅 | 64bit 固定 (`#bootopt hsp64 1` 既定) |
| 文字コード | UTF-8 固定 (3 プラットフォーム共通) |

### HSP3Dish との差別化ポイント (4 点)

1. **真の "同一 `.ax` が 3 プラットフォームで同じ VM で走る"**
   HSP3Dish mobile は `hsp3cnv` で `.ax → C++` AOT 翻訳して native ビルドするため、Win (interpret) と mobile (AOT native) で実行コードパスが違う。hsp3dx は全プラットフォームで VM インタプリタ統一のため、**挙動再現性が高い** (Win で出たバグは mobile でも同じ VM で再現)。
2. **DxLib の豊富な API** をそのまま呼べる (3D / エフェクト / 動画再生 / ネットワークなど 2000 関数超、HSP3Dish は 2D + 簡易 3D のみ)
3. **DxLib 既存ユーザーの資産移行パス**
4. **新命令追加時に翻訳ルール不要** (hsp3cnv に HSP→C++ 翻訳ルール追加が要らない、プラグイン側の命令表だけでよい)

### Route B を採用した理由 (Route A との比較)

| 項目 | Route A (hsp3dish AOT 方式) | **Route B (全 VM interpret) ← 採用** |
|---|---|---|
| Win 実行 | インタプリタ | インタプリタ |
| Mobile 実行 | hsp3cnv で AOT、native 実行 | VM がインタプリト |
| 挙動一致性 | 翻訳バグの可能性 | 完全一致 |
| Mobile 性能 | ★★★ (native) | ★★ (interpret) |
| 新命令追加コスト | 翻訳ルール + plugin 両方 | plugin のみ |
| 実装ベース | hsp3dish fork | `hsp3embed` fork |
| hsp3dish との差別化 | 薄い | **明確** |

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

## 3. 型システムの進化計画

DxLib は **float / 構造体 / 構造体配列** を多用するため、段階的に HSP の型システムを拡張する必要がある。本章で **段階的移植計画** を明記する。

### 3.1 DxLib が使う型 / 機構

| カテゴリ | 具体例 |
|---|---|
| float 引数 / 戻り値 | `VECTOR = {float x,y,z;}` / `DrawCircle(x,y,r,color,fill,thickness)` の半径 / 音量・ピッチなど |
| 構造体 | `VECTOR` / `VECTOR_D` / `VERTEX3D` / `MATRIX` / `RECT` / `COLOR_F` / `MV1_COLL_RESULT_POLY` 他多数 |
| 構造体の出力 (pointer) | `GetCameraPosition(&pos)` で VECTOR を返す |
| 構造体配列 | 頂点バッファ、当たり判定ポリゴン群 |
| コールバック | `SetMovieSurfaceCallback` 等 (少数) |

### 3.2 hsp3net にあって hsp3embed に無い型機構

ベースとする `hsp3embed` は HSP3 素の型セット (int / double / str / 配列) しか持たない。対して `hsp3net` には以下が実装済:

| 機能 | hsp3net | hsp3embed (fork 元) | 用途例 |
|---|---|---|---|
| `#cfunc` (int 返し) | ○ | ○ | ハンドル / カウント |
| `#cfuncd` (double 返し) | ○ | ✗ | 一般数値 |
| **`#cfuncf` (float 返し)** | ○ | ✗ | DxLib float 戻り値 |
| **`#cfuncst` (struct 返し)** | ○ | ✗ | VECTOR 取得など |
| **`NSTRUCT` (構造体型)** | ○ | ✗ | `pos.x` で触れる |
| `#defcbcom` (COM callback) | ○ | ✗ | DxLib では概ね不要 |

### 3.3 取れる 3 方針

**方針 1: プラグイン側ですべて吸収**
- 型拡張なし、HSP 側は `int` / `double` / `str` のみ
- `dx_get_camera_position posx, posy, posz` のように **スカラ 3 引数に分解**
- 構造体配列は TSV 文字列 or `array double` で返し、HSP 側でパース (`iron_mlnet.hsp` と同じ方式)
- 実装コスト: 最小 (hsp3embed に手を入れない)
- API の醜さ: 大 (MATRIX 16 要素、頂点バッファなど冗長)

**方針 2: 最小限の型拡張 (float + cfuncf だけ移植)**
- hsp3embed に `HSPVAR_FLAG_FLOAT` + `#cfuncf` を追加
- 構造体は引き続きプラグイン側で分解
- 実装コスト: 中 (VM の型テーブル拡張、hspcmp の型認識追加)
- DxLib の float 精度が保てる

**方針 3: hsp3net の型機構フル移植**
- hsp3embed に NSTRUCT + cfuncf + cfuncd + cfuncst を移植
- HSP 側で `ddim pos, 3 : dx_get_camera_pos pos : mes pos.x` のように struct 風に触れる
- 実装コスト: 大 (VM 型システムの大改修、hspcmp 改修、互換性検証)
- 2000 関数の自動生成が機械的にできるようになる

### 3.4 Phase と方針の対応

| Phase | 型方針 | 理由 |
|---|---|---|
| **Phase 1** (MVP 40 関数) | **方針 1** | スカラ分解で DrawGraph / DrawCircle / GetMousePoint など動かす |
| Phase 2-3 (cnv + mobile) | 方針 1 継続 | VM 側は触らず、安定化優先 |
| Phase 4-5 (API 40 → 500) | **方針 2** | `#cfuncf` 追加、float 精度必要な API が増える |
| **Phase 6** (3D / 動画) | **方針 3** | NSTRUCT / cfuncst 移植、MATRIX / VERTEX3D を touch する段階 |

### 3.5 長期ベース判断 (Phase 6 入りで再考)

Phase 6 到達時に以下を再検討:

- `hsp3embed` を hsp3net 系に寄せて進化させるか
- いっそ `hsp3net` を fork して DxLib プラグインだけ追加する方針に切り替えるか
- 両方メンテするのは現実的でないので、**Phase 6 時点で系統統合の判断** をする

### 3.6 自動コード生成の指針

DxLib の 2000 関数を手書きで `#deffunc` / `#cfunc` 定義するのは非現実的 → `DxLib.h` をパースして機械生成するスクリプトを Phase 5 で整備予定。

- **Phase 5 自動生成**: 方針 2 ベース (float 対応済、構造体はスカラ分解)
- **Phase 6 自動生成**: 方針 3 ベース (NSTRUCT 対応済、構造体そのまま渡せる)
- 方針 1 期のプラグイン手書きコードは Phase 5 で **生成コードに置き換わって捨てる前提** で書く (繋ぎコードに投資しすぎない)

### 3.7 コールバック方針 (iOS / Android 制約への対処)

DxLib には `SetMovieSurfaceCallback` / サウンドストリーム / ネットワーク受信 / MV1 当たり判定など **C 関数ポインタを受ける API が 10〜20 個** 存在する。これを HSP 側から扱う方針。

#### 3.7.1 プラットフォーム制約

| プラットフォーム | 動的コード生成 (JIT / trampoline 実行時生成) | 静的 C 関数ポインタ渡し |
|---|---|---|
| Windows | ○ 自由 | ○ |
| Android | △ NDK で `mprotect` 使えば可、ただし Android 10+ で制限強化 | ○ |
| **iOS** | **✗ 原則禁止** (W^X、executable page を write できない) | ○ |

#### 3.7.2 コールバック 3 技法と対応

| 技法 | 仕組み | iOS | Android | Win |
|---|---|---|---|---|
| (a) **静的スロット trampoline** | ビルド時に N 個の C 関数 (`cb_slot_0`, `cb_slot_1`, …) を用意し、スロット ID から HSP 側ハンドラへ dispatch | ✅ | ✅ | ✅ |
| (b) 動的 trampoline 生成 | 実行時に機械語を書き出して関数ポインタ化 (HSP3 classic の `callback` 命令、libffi closure) | ❌ | △ | ✅ |
| (c) .NET CLR thunk | CLR が JIT で生成 (hsp3net の `#defcbcom`) | ❌ (iOS Mono は AOT 必須、JIT 不可) | △ | ✅ |

**hsp3dx は (a) 静的スロット方式を採用**。HSP3 classic の `callback` / hsp3net の `#defcbcom` はそのままでは iOS 動作不可。

#### 3.7.3 静的スロット方式の具体像

```cpp
// ビルド時に signature family ごとに N 個事前生成 (DxLib.h パース時に自動)
static int g_hsp_label[256];
static void cb_slot_0(int arg0, int arg1) {
    VM_CallHspLabel(g_hsp_label[0], arg0, arg1);
}
static void cb_slot_1(int arg0, int arg1) { ... }
/* ... cb_slot_255 まで ... */

static void (*trampolines[256])(int,int) = {
    cb_slot_0, cb_slot_1, /* ... */, cb_slot_255
};
```

HSP 側:

```hsp
dx_set_callback_xxx *my_handler     ; プラグインが空きスロットを確保、ラベル ID を記録
...
*my_handler
    ; DxLib からコールバックされたときここに来る
    return
```

#### 3.7.4 制約と運用

- **シグネチャごとに別スロット群が必要** (`void(int,int)` と `void(float*)` はスロット共有不可) → DxLib のコールバック API は 10〜20 種、5〜10 種類のシグネチャで各 256 スロット事前生成で実用十分
- **同時登録可能数に上限あり** (スロット数まで) → ゲーム用途では問題にならない
- **スレッド安全性**: DxLib 側が別スレッドから呼ぶ API では VM ロック必須 (VM を呼ぶ前に mutex 取得)

#### 3.7.5 Phase 対応

| Phase | コールバック対応 |
|---|---|
| Phase 1 (MVP 40 関数) | コールバック不使用、スキップ |
| Phase 5 (API 拡張) | 静的スロット trampoline 導入、5 シグネチャ × 256 スロット程度で初期実装 |
| Phase 6 (3D / 動画) | `SetMovieSurfaceCallback` など本命コールバック対応 |

#### 3.7.6 §3.2 の `#defcbcom` 記述の補足

§3.2 の型機構比較表では「`#defcbcom` は DxLib では概ね不要」と書いたが、これは **CLR thunk 方式の `#defcbcom` そのものは mobile で動かないので流用できない** 意味であり、コールバック機能自体が不要ではない。hsp3dx では代わりに **`#defcallback` (仮称) + 静的スロット方式** を自前で用意する。

---

## 4. プラグイン方針

### 4.1 `#uselib` での任意 DLL ロードは **禁止**

iOS ではダイナミックロードが原則禁止、Android でも .so の外部ロードは面倒で配布負荷が高いため。

### 4.2 同梱プラグインは **事前承認制** (静的リンク)

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

## 5. 文字コード規則

### 5.1 統一ルール

| 層 | エンコーディング |
|---|---|
| `.hsp` ソースファイル | **UTF-8 (BOM なし)** 必須 |
| `hspcmp` オプション | `#cmpopt utf8 1` 相当を既定 |
| `.ax` 内文字列テーブル | UTF-8 バイト列 |
| ランタイム内部文字列 | UTF-8 |
| DxLib 呼び出し | `SetUseCharCodeFormat(DX_CHARCODEFORMAT_UTF8)` を起動時固定 |
| ファイルパス | UTF-8 (Win は `_wfopen` 経由で UTF-16 変換、iOS/Android はネイティブ UTF-8) |
| フォントファイル (.ttf/.otf) | バイナリなので非依存 |

### 5.2 DxLib 公式ドキュメント準拠

- Windows DxLib: デフォルトは Shift-JIS / UTF-16LE。`SetUseCharCodeFormat` で切り替え
- Android / iOS DxLib: UTF-8 固定
- hsp3dx ランタイムは **起動時必ず `SetUseCharCodeFormat(DX_CHARCODEFORMAT_UTF8)` を呼ぶ** → 3 プラットフォームで統一

### 5.3 移行時の既知の落とし穴

1. **Shift-JIS の 2 バイト目 0x5C 問題**: `表` (0x95 0x5C) などの文字がリテラル中に出ると 0x5C がエスケープ文字として解釈されてリテラルが破壊される → **UTF-8 化で自動解消**
2. **`sdim` のサイズ指定**: UTF-8 では 1 文字 1〜4 バイト。Shift-JIS で 2 バイトだった文字が UTF-8 で 3 バイトになる例が多数 → **バッファサイズを 1.5 倍程度で見積もる**
3. **`strlen` は文字数ではなくバイト数** (既存 HSP と同じだが UTF-8 では差が顕著になるので再注意)
4. **`poke`/`peek` でバイト単位に触っている既存コード**: 非互換、書き換え必須
5. **DxLib API 引数**: `SetUseCharCodeFormat(DX_CHARCODEFORMAT_UTF8)` 呼び出し後は UTF-8 で渡せばよく、特別な変換は不要

### 5.4 既存資産の移行サポート

`tools/hsp3dx_sjis2utf8/` に `.hsp` ソースを Shift-JIS → UTF-8 に一括変換するツールを同梱。使い方:

```
hsp3dx_sjis2utf8 --in path\to\src.hsp [--out path\to\dst.hsp]
hsp3dx_sjis2utf8 --dir path\to\project [--recursive]
```

---

## 6. ビルド/配布フロー

### 6.1 Windows

```
your_game.hsp  →  hspcmp (#cmpopt utf8 1, #bootopt hsp64 1)  →  start.ax
                                                               ↓
                                         hsp3dx.exe  ←  start.ax を読んで実行
```

### 6.2 iOS

```
your_game.hsp  →  hspcmp  →  start.ax
                              ↓
              hsp3dx_cnv (単純バイト配列化)  →  start.cpp:
                                                 const uint8_t ax_data[] = { 0x48, 0x53, ... };
                                                 const size_t  ax_size   = N;
                              ↓
      Xcode project + libhsp3dx.a (hsp3embed VM + hgio_dx + dxlib_core) + DxLib iOS lib + start.cpp
                              ↓
                             .ipa
```

起動時に `libhsp3dx` が `VM_Run(ax_data, ax_size)` を呼ぶ形でインタプリト実行。
`hsp3cnv` のような HSP→C++ AOT 翻訳は**行わない**。

### 6.3 Android

```
your_game.hsp  →  hspcmp  →  start.ax
                              ↓
              hsp3dx_cnv (単純バイト配列化)  →  start.cpp
                              ↓
     Android Studio + libhsp3dx.so (hsp3embed VM + hgio_dx + dxlib_core) + DxLib Android lib + start.cpp
                              ↓
                             .apk / .aab
```

### 6.4 共通アセットパッケージング

`.ax` 以外の素材 (画像 / 音声 / フォント) は `hsp3dx_pack` ツール (Phase 2 で作成予定) で **仮想 FS** に固める。ランタイムはプラットフォーム問わず同じ API で素材にアクセスできる。

---

## 7. Phase 計画

| Phase | 内容 | 型方針 (§3) | 状態 |
|---|---|---|---|
| **Phase 0** | 仕様書 + SJIS→UTF-8 移行ツール + ディレクトリ雛形 | — | ✅ 完了 |
| Phase 1 | Windows 版 `hsp3dx.exe` MVP (DxLib コア 40 関数 + 3 サンプル) | 方針 1 | 未着手 |
| Phase 2 | `hsp3dx_cnv` ツール + `hsp3dx_pack` ツール | 方針 1 | 未着手 |
| Phase 3 | iOS 版 `libhsp3dx.a` + Xcode テンプレ | 方針 1 | 未着手 |
| Phase 4 | Android 版 `libhsp3dx.so` + Android Studio テンプレ | 方針 1 | 未着手 |
| Phase 5 | DxLib API を 40 → 500 関数に拡張 (自動生成) | 方針 2 (float + `#cfuncf` 追加) | 未着手 |
| Phase 6 | 3D / 動画 / ネットワーク機能追加 | 方針 3 (NSTRUCT / cfuncst 移植) | 未着手 |

---

## 8. ディレクトリ構成 (Phase 0 時点)

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

## 9. 未確定事項 (Phase 1 着手時に決める)

- [x] ~~VM ソースは `hsp3net` を fork するか `hsp3dish` を fork するか~~
  → **`hsp3embed` を fork** で確定 (`HSPIOS`/`HSPNDK` 条件コンパイルが既存、mobile ビルド実績あり)
- [ ] DxLib SDK の取得方法 (公式配布 zip / Git submodule)
- [ ] DxLib ライセンス条項確認 (再配布可否)
- [ ] プラグイン ID テーブルの設計 (HSP 命令 ID 付与ルール)
- [ ] `sdim` のバイト数自動調整をランタイム側で行うか (互換性のため)
- [ ] `hsp3dx` 独自の拡張命令 (`dx_*` prefix) を `iron_dxlib.hsp` に畳み込むか、ランタイム組み込みにするか
