# hsp3dx dxlib_angle_sdl2 — セッション作業ログ

壊れた時の再開用。最新セッションが上、ファイルパス/行番号は具体的に。

---

## 2026-04-22 — Day 1

### 目標
DxLib を SDL2 + ANGLE 経由で Mac / Linux / Web に展開する PoC 開始。

### 決定事項 (背景含む)
- **ベース**: DxPortLib (2017 停滞、2D のみ、API 12% カバレッジ) **ではなく本家 DxLib 3.24f**。
  - 本家 iOS/Android は既に OpenGL ES 2/3 実装済 + シェーダ資産あり → Mac/Linux/Web へは ANGLE で橋渡しするだけで済む
  - 比較詳細: [COMPARE_NOTES.md](COMPARE_NOTES.md)
- **フォーク方針**: `dxlib_portable/` に DxLib 丸ごとコピー → Desktop プラットフォーム層を追加する patch を当てる
- **ライセンス**: DxLib は [公式ライセンス](https://dxlib.xsrv.jp/dxlicense.html) で著作権表記のみ要件 → fork 丸ごと commit で問題なし
- **ウィンドウ/入力/音声**: SDL2 を採用 (SDL3 は SDL_GPU 待ちで見送り)
- **グラフィックス**: 本家 iOS の GLES 2/3 コードをそのまま desktop で動かす → ANGLE が各 OS native API に橋渡し
- **Windows 側 PoC**: NVIDIA driver は native GL ES 3.2 を返すので Windows では一旦 ANGLE 無しで動く (Stage 1 で確認済)。ANGLE は Mac/Linux/Web の時に組む

### 環境 (非自明なもの)
- DxLib 3.24f 原本ソース: **`c:/Users/inovia/dxlib_src/DxLibMake/`** (91 .cpp ファイル、UTF-8 と ShiftJIS 混在)
- iOS/Android 向けソースは UTF-8、root の共通ソースは ShiftJIS (CP932)
- CMake: `/c/Program Files/CMake/bin/cmake.exe` (3.25)
- MSVC: VS 2022 Community (14.44.35207)
- SDL2 prebuilt VC: 2.30.11 — `extlib/SDL2/` (.gitignore 済、再取得は README 参照)
- `/source-charset:.932` で MSVC に ShiftJIS 読ませる

### 完了した Stage

#### Stage 1 — SDL2 + GL ES window
- [src/stage1_empty_window.cpp](src/stage1_empty_window.cpp) 実装
- `SDL_GL_CONTEXT_PROFILE_ES` + major 2 minor 0 指定で context 取得
- 実行結果 (Win + NVIDIA):
  - `GL_VENDOR: NVIDIA Corporation`
  - `GL_RENDERER: NVIDIA GeForce RTX 3090`
  - `GL_VERSION: OpenGL ES 3.2 NVIDIA 591.44`
- スクショ: `stage1_screenshot.png` + `_small.png` (.gitignore)

#### Stage 2 — DxLib.h scaffolding
- [src/stage2_header_compile.cpp](src/stage2_header_compile.cpp): `DX_PLATFORM_DESKTOP_SDL2` 定義 + `#include "DxLib.h"` 単体テスト
- 実行結果:
  - `DXLIB_VERSION = 0x324f` → 本家 3.24f ヘッダが正しくロード
  - `DX_NON_DIRECT3D11 defined` → Desktop ブランチで DirectX 無効化カスケード動作
  - `DX_NON_NETWORK defined` → 同上

#### プラットフォーム層 scaffolding
- **`extlib/DxLibMake/`** (39MB, .gitignore) ← 読取専用リファレンス (diff 用)
- **`dxlib_portable/`** (39MB, commit 対象) ← 我々のフォーク
- **新規ファイル (UTF-8)**:
  - [dxlib_portable/DxDataTypeDesktop.h](dxlib_portable/DxDataTypeDesktop.h)
  - [dxlib_portable/DxFunctionDesktop.h](dxlib_portable/DxFunctionDesktop.h)
  - [dxlib_portable/Desktop/DxBaseFuncDesktop.h](dxlib_portable/Desktop/DxBaseFuncDesktop.h) + `.cpp`
  - `dxlib_portable/Desktop/Dx*Desktop.h` 17 枚 stub
- **Patch 済 (ShiftJIS のまま)**:
  - [dxlib_portable/DxCompileConfig.h:218](dxlib_portable/DxCompileConfig.h#L218) — `DX_PLATFORM_DESKTOP_SDL2` で `WINDOWS_DESKTOP_OS` 抑止ガード
  - [dxlib_portable/DxCompileConfig.h:224](dxlib_portable/DxCompileConfig.h#L224) — `USE_ULL` に `DX_PLATFORM_DESKTOP_SDL2` 追加
  - [dxlib_portable/DxCompileConfig.h:247](dxlib_portable/DxCompileConfig.h#L247) — Apple/Android 無効化ブロックに `DX_PLATFORM_DESKTOP_SDL2` 追加
  - [dxlib_portable/DxDataType.h:30](dxlib_portable/DxDataType.h#L30) — `DxDataTypeDesktop.h` 分岐 include
  - 11 headers + 7 cpp: `#endif // __APPLE__` 直後に Desktop 分岐 include を python 一括 patch

### 残 TODO (優先度順)

#### Stage 3 — DxBaseFunc.cpp を Desktop 向けに compile + link 通す
現状 Desktop/Dx*Desktop.h は stub 17 枚。中身を埋める。
- [ ] **DxLogDesktop.{h,cpp}** — iOS 版 [iOS/DxLogiOS.cpp](dxlib_portable/iOS/DxLogiOS.cpp) (200 行) 参考
- [ ] **DxMemoryDesktop.{h,cpp}** — malloc/free ラッパ、iOS 版参考
- [ ] **DxThreadDesktop.{h,cpp}** — iOS 422 行、pthread → std::thread に置換
- [ ] **DxFileDesktop.{h,cpp}** — fopen + ディレクトリ列挙、iOS は NSBundle 依存で desktop では fopen/dirent
- [ ] ここまでで `DxBaseFunc.cpp` が static lib としてリンクできる想定
- 成功判定: CMake に static library target `dxlib_portable` を追加し、stage2 がそことリンクできる

#### Stage 4 — 画像 decode 層
- [ ] DxBaseImageDesktop (libpng / libjpeg 経由、iOS 版参考)
- SDL2_image を使うか、DxLib の zlib/libpng 同梱を使うか要判断

#### Stage 5 — DxGraphics 本体 (最大規模)
- [ ] DxGraphicsDesktop — iOS 版 [iOS/DxGraphicsiOS.cpp](dxlib_portable/iOS/DxGraphicsiOS.cpp) を GL ES 2 コードごと流用
  - EAGLContext → SDL_GL_CreateContext に置換
  - CAEAGLLayer → SDL_Window に置換
  - その他 UIKit 依存を SDL2 に置換
- 工数見積 1〜2 週間

#### Stage 6-12
README.md の「残りの工数目安」テーブル参照。

### 次の具体的な一手
1. `dxlib_portable/Desktop/DxLogDesktop.{h,cpp}` を `iOS/DxLogiOS.*` をベースに実装
2. CMake に `dxlib_portable` static library target を追加
3. `add_library(dxlib_portable STATIC ...)` で少なくとも `DxBaseFunc.cpp` + `Desktop/DxBaseFuncDesktop.cpp` + `DxLog.cpp` + `Desktop/DxLogDesktop.cpp` + `DxChar.cpp` がコンパイル通るか試す
4. 通らないエラーから依存ファイル芋づる式に拡張

### 参考コマンド (copy-paste 用)
```bash
# 再ビルド
cd "j:/HNWorks/IronHSP_2026/hsp3dx/dxlib_angle_sdl2"
"/c/Program Files/CMake/bin/cmake.exe" --build build --config Release

# Stage 1 実行 (SDL2 window)
./build/Release/stage1_empty_window.exe

# Stage 2 実行 (ヘッダ parse 確認)
./build/Release/stage2_header_compile.exe

# Stage 2 が求める期待出力:
#   DXLIB_VERSION = 0x324f
#   DX_NON_DIRECT3D11 is defined (expected)
#   DX_NON_NETWORK is defined (expected on initial stage)
#   Stage 2 header-only compile succeeded.
```

### commit 状態
- 未 commit。ユーザーから指示待ち。
- checkpoint すべき内容:
  - Phase: hsp3dx dxlib_angle_sdl2 Stage 1+2+3 + scaffolding
  - Co-Authored-By 既定通り Claude Opus 4.7 (1M context)

---

### 2026-04-22 — Day 1 追補 (Stage 3 完了)

#### Stage 3 — 静的ライブラリビルド成功
- ターゲット: `dxlib_portable_stage3.lib` (488KB) ビルド成功
- 含まれるソース:
  - `Desktop/DxBaseFuncDesktop.cpp` (cwd/chdir ラッパ、iOS 版ベース)
  - `Desktop/DxLogDesktop.{h,cpp}` (NSLog → fprintf(stderr), 暫定 cwd にログ出力)
  - `Desktop/DxMemoryDesktop.{h,cpp}` (malloc/free 薄ラッパ、iOS 版と同構造)
  - `Desktop/DxThreadDesktop.{h,cpp}` (**SDL2 thread API 採用**。pthread 直接は避けて cross-platform)
  - `Desktop/DxFileDesktop.h` (struct 3 種のみ、impl は Stage 4 で)
  - DxBaseFunc.cpp / DxChar.cpp / DxLog.cpp / DxMemory.cpp / DxThread.cpp / DxHeap.cpp
- 知見:
  - **UTF-8 BOM が必須**。`/source-charset:.932` 指定下では BOM 無し UTF-8 ファイルは CP932 として誤読され C2447 エラー。全 Desktop/*.h および `DxDataType/FunctionDesktop.h` に BOM 付与済
  - SDL2 ヘッダは `.cpp` 側だけで include し、ヘッダは opaque `void*` で保持する → DxLib.h を include するユーザーが SDL.h に曝露されない
  - Stage 3 のスコープ絞り: CMake で下記を `DX_NON_*` で全て off
    `MOVIE / LIVE2D_CUBISM4 / MODEL / BULLET_PHYSICS / FILTER / MASK / SOUND / FONT / INPUT / GRAPHICS`
    → これらの Desktop backend は後段で書く
- ビルドコマンド: `cmake --build build --config Release --target dxlib_portable_stage3`

#### 次 Stage 4 — 候補
1. **DxFile.cpp** (7630 行) を Desktop に通す
   - `DxFileDesktop.cpp` を新規実装 (iOS は NSBundle 経由、desktop は fopen/opendir)
   - 18 関数実装必要 (`InitializeFile_PF`, `ReadOnlyFileAccessOpen_PF` 等)
   - 完了すれば DxBaseImage/DxFont の土台が揃う
2. **DxSystem.cpp** を Desktop に通す
   - `DxSystemDesktop.cpp` — DxLib_Init の platform 側 (windowing/context 初期化) 
   - 現状 DX_NON_GRAPHICS なので window すら作らない方針だと大部分 stub で通せる
   - DxLib_Init が呼べるようになる最小構成にできるか要検証
3. 小さく勝つなら DxFile 優先 (独立性高い)

---

### 2026-04-22 — Day 1 追補 (Stage 4 完了)

#### Stage 4 — DxLib_Init() が Desktop で呼べる最小構成達成

**検証**: `stage4_init_test.exe` が実行成功、以下を出力:
```
[Stage4] Calling DxLib_Init...
[DxLib Desktop] DxLib_Init (stub)
[Stage4] DxLib_Init returned 0
[Stage4] Calling DxLib_End...
[DxLib Desktop] DxLib_End (stub)
[Stage4] Done.
```

**成果物**:
- `dxlib_portable_stage3.lib` = 1.57 MB (Stage 3 の 0.49MB → Stage 4 で 3.2 倍)
- `stage4_init_test.exe` = 340 KB (main + DxLib stub init + SDL2 クリップボード/タイマ含む)

**追加した実装**:
- `Desktop/DxFileDesktop.{h,cpp}` — 18 関数実装
  - stdio ベース (fopen/fread/fseek/fclose/remove/fwrite)
  - `Desktop_wchar_t_to_utf8_Path()` で cwd 基点フルパス展開
  - Find系は **std::filesystem::directory_iterator (C++17)** を採用 — Mac/Linux/Win 共通で動く
  - iOS 版の `GetApplicationDirectory()` (NSBundle) 呼び出しは desktop では不要、cwd 基点で十分
- `Desktop/DxSystemDesktop.{h,cpp}` — Stage 4 最小版
  - `DxLib_Init` / `DxLib_End` — 実装 stub (フラグ立てるだけ、DxGateway.cpp 経由せず直接実装)
  - `GetNowSysPerformanceCount` → `SDL_GetPerformanceCounter`
  - `ConvMilliSecondsToSysPerformanceCount` → SDL performance freq 経由
  - `GetNowCount` → `SDL_GetTicks`
  - `GetDateTime` → `std::time` + `localtime`
  - `NS_ProcessMessage` → `SDL_PollEvent` ループ + SDL_QUIT で -1
  - `DxLib_Error` / `DxLib_ErrorUTF16LE` → stderr printf stub
  - `GetClipboardText_PF` / `SetClipboardText_WCHAR_T_PF` / `GetClipboardText_WCHAR_T_PF` → **SDL_GetClipboardText / SDL_SetClipboardText** 経由

**追加した DxLib コアソース**:
- `DxFile.cpp` (7630 行)
- `DxSystem.cpp` (1336 行)
- `DxArchive_.cpp` (DXA 復号)
- `DxCharCodeTable.cpp` (CP932/936 → UTF16 変換テーブル)
- `DxMath.cpp`
- `DxUseCLib.cpp` (5180 行、Mersenne Twister 含む)
- `DxHandle.cpp` (InitializeHandleManage 等)
- `DxASyncLoad.cpp` (非同期読み込み基盤)

#### 知見

- **DxLib_Init は DxGateway.cpp (22K 行) に定義されているが、本物を引っ張ると依存の嵐**。
  代替: DxSystemDesktop.cpp に直接 `DxLib_Init` を実装して DxGateway を回避。
  本物の `NS_DxLib_Init` は Graphics/Sound/Input の Desktop backend が揃ったら呼ぶ。
- **DX_NON_TIFFREAD / JPEGREAD / PNGREAD / OGGVORBIS / OGGTHEORA / OPUS を全 define** しないと DxUseCLib.cpp が tiff.h/jpeglib.h/png.h を要求。Stage 5 で libpng/libjpeg を DxLib 付属版 (extlib 側) or SDL2_image で供給検討。
- **DX_NON_MERSENNE_TWISTER は定義しない** (定義すると `srand` / `RAND_MAX` が未解決になる。むしろ MT 実装 (DxUseCLib.cpp 内) を使った方がラク)
- stderr と stdout のバッファ違いで出力順が混ざる (`DxLib_Init (stub)` が `Calling DxLib_Init...` より先に出る)。これは cosmetic、ロジックは正しい。気にする時は fflush(stdout) を挟む

#### 次 Stage 5 — 候補

- **A**. DxGraphics Desktop backend — 本命の 2D 描画。iOS DxGraphicsiOS.cpp (〜12K 行) を GL ES 2 ごと流用、EAGLContext → SDL_GL_CreateContext、CAEAGLLayer → SDL_Window に置換。工数 1〜2 週間
- **B**. DxGateway.cpp を入れて本物の `DxLib_Init` 経由に切り替え — 22K 行の dispatcher。Graphics 無くても通るか不明、要調査
- **C**. この辺で checkpoint commit してから Stage 5 へ

---

### 2026-04-22 — Day 1 追補 (Stage 5 挑戦 → ロールバック)

#### 結論: DxGraphics.cpp の link は今日中には無理、規模が想定以上だった

**到達点**:
- `DX_NON_GRAPHICS` を外して `DxGraphics.cpp` (37K 行) 単体**コンパイルは成功**
- [dxlib_portable/Desktop/DxGraphicsDesktop.h](dxlib_portable/Desktop/DxGraphicsDesktop.h) に必要な struct を iOS 版から移植:
  `IMAGEDATA_ORIG_HARD_TEX_PF`, `SHADOWMAPDATA_PF`, `VERTEXBUFFERHANDLEDATA_PF`,
  `INDEXBUFFERHANDLEDATA_PF`, `SHADERHANDLEDATA_PF`, `SHADERCONSTANTBUFFERHANDLEDATA_PF`
  (GLuint/GLint を `uint32_t/int32_t` で opaque 化し、.cpp 側で GL 依存を閉じ込める方針)
- [dxlib_portable/Desktop/DxSystemDesktop.h](dxlib_portable/Desktop/DxSystemDesktop.h) に `CheckActiveState()` マクロ no-op 追加

**停止理由**:
- `stage4_init_test` をリンクしようとしたら **50 以上の未解決シンボル**
- 原因: `DxGraphics.cpp` が以下の他 .cpp を大量に参照する
  - `DxBaseImage.cpp` — `GetColor`, `GetColor2..5`, `CreateARGBF32ColorBaseImage`,
    `ReleaseBaseImage`, `SetPixelBaseImage`, `BltBaseImage2`, 他数十
  - `DxSoftImage.cpp` — `MemImg` 系 (`InitializeMemImg`, `BltMemImg`, `DrawMemImg`, 他数十)
  - `DxSystemDesktop.cpp` 追加必要: `GetSysPerformanceFrequency`
- これら全部を今日中に通すのは 1 セッションでは無理。各 .cpp 自体も大型 (DxBaseImage は
  さらに別の dep を引き込む)

**ロールバック状態** (今の build で動くもの):
- `DX_NON_GRAPHICS=1` を CMakeLists に戻した → Stage 4 と同じ動作
- `dxlib_portable_stage3.lib` = 1.57MB、`stage4_init_test.exe` (340KB) が正常起動
- DxGraphicsDesktop.{h,cpp} は**残してあり、ビルドにも入っている** (link 失敗するのは Graphics 関数呼び出し側。stub を作ってない今は使わない限り link する)
- `DxGraphics.cpp` もビルドに入ってる (DX_NON_GRAPHICS=1 のとき先頭で巻き戻されるので obj に何も入らない)

#### Stage 5 本着手の計画 (次回以降)

1. **先に `DxBaseImage.cpp` と `DxSoftImage.cpp` を build に追加** (DxGraphics より先にやるべきだった)
   - 2 つとも platform-independent (GL 使わない、メモリ上のピクセル処理)
   - 通る可能性高い
2. `DxGraphicsDesktop.cpp` に `GraphicsInitialize_PF` の最小実装 (SDL_Window + SDL_GL_CreateContext を保持)
3. `Graphics_Hardware_ClearDrawScreen_PF` (glClear + SDL_GL_SwapWindow) だけ実装
4. それ以外の Graphics_Hardware_*_PF は全部 no-op stub
5. `DxGateway.cpp` を入れないと本物の `DxLib_Init` にたどり着けないので、最終的にはこれも取り込む必要あり — ただし link 爆発が怖いので慎重に

#### Stage 5 のための雑多な前提 (次セッション即時再開用)

- CMakeLists の `dxlib_portable_stage3` target に DxGraphics.cpp と Desktop/DxGraphicsDesktop.cpp は既に入っている (DX_NON_GRAPHICS=1 なので空 obj)
- Desktop 側 struct は [dxlib_portable/Desktop/DxGraphicsDesktop.h](dxlib_portable/Desktop/DxGraphicsDesktop.h) に定義済 (6 struct)
- **DxGraphics.cpp 単体はパースできる** (20,920 行の iOS 版と異なり、コア .cpp なので platform-agnostic)
- 次やるときの最小追加: CMake に `DxBaseImage.cpp`, `DxSoftImage.cpp` を書き足して、また link 試行

### commit 状態 (更新)
- Stage 1+2+3+4 + Stage 5 途中骨格 (compile 通過 / link 未) 済。まだ未 commit。
- 現在のビルドで動く: stage1 / stage2 / stage4_init_test

---

### 2026-04-22 — Day 1 追補 (Stage 5 再挑戦 → 成功)

#### 結論: DxGraphics enabled のまま DxLib_Init 通過を達成

**実行結果**:
```
[Stage4] Calling DxLib_Init...
[DxLib Desktop] NS_DxLib_Init (stub)    ← DxGateway::DxLib_Init → NS_DxLib_Init
[Stage4] DxLib_Init returned 0
[Stage4] Calling DxLib_End...
[DxLib Desktop] NS_DxLib_End (stub)
[Stage4] Done.
```

**成果物**:
- `dxlib_portable_stage3.lib` = **5.99MB** (Stage 4 の 1.57MB → 3.8 倍)
- `stage4_init_test.exe` = 354KB
- 合計 30 以上の DxLib コア .cpp + 14 Desktop ファイルがビルド対象

#### 追加した DxLib コア .cpp

- `DxBaseImage.cpp` (16,130 行) — 色処理/BaseImage 全般
- `DxSoftImage.cpp` (2,609 行) — software image
- `DxMemImg.cpp` + `DxMemImgDrawFunction0..3.cpp` — メモリイメージ描画 (5 ファイル)
- `DxGraphics.cpp` (37,545 行)
- `DxGateway.cpp` (22,485 行) ← **これが鍵**。本物の DxLib_Init/End と全公開 API を定義

#### `DxGateway.cpp` を取り込む戦略が勝因
- DxGateway は各公開 API を thread-safe ラッパーとして提供 (`DxLib_Init` → `NS_DxLib_Init`)
- 中身は短い定型コードの塊なので、依存を増やさず取り込める
- 結果: `DrawCircle`, `DrawGraph` 等の 100+ 公開 API が全部解決

#### `_PF` stub 一括生成 (158 関数)
- build log をパースして未解決シンボルを抽出
- Python で `extern <ret> <name>(<params>) { return 0; }` 形式の stub を自動生成
- → [Desktop/DxGraphicsDesktop_stubs.cpp](dxlib_portable/Desktop/DxGraphicsDesktop_stubs.cpp) (160+ 行、自動生成) として保存
- 将来 Stage 6+ で 1 つずつ SDL2/GL 実装に置き換えていく

#### Desktop 側に追加で実装した関数
- `DxSystemDesktop.cpp`:
  - `NS_DxLib_Init` / `NS_DxLib_End` (元の DxLib_Init/End stub から置き換え)
  - `GetSysPerformanceFrequency` (SDL_GetPerformanceFrequency)
- `DxGraphicsDesktop.cpp`:
  - `Graphics_Hardware_RenderVertex` (非 _PF、単体スタブ)
  - `DefaultImageLoadFunc_PF[]` (関数ポインタ配列、nullptr 終端)

#### 今の CMake に入っているファイル一覧 (Stage 5 終了時点)

Desktop platform (11 files):
- DxBaseFuncDesktop / DxLogDesktop / DxMemoryDesktop / DxThreadDesktop
- DxFileDesktop / DxSystemDesktop / DxGraphicsDesktop / DxGraphicsDesktop_stubs
- (+ stub only: 残 15 ヘッダ)

DxLib コア (16 files):
- DxBaseFunc / DxChar / DxFile / DxLog / DxMemory / DxThread / DxHeap / DxSystem
- DxArchive_ / DxCharCodeTable / DxMath / DxUseCLib / DxHandle / DxASyncLoad
- DxBaseImage / DxSoftImage / DxMemImg / DxMemImgDrawFunction0-3 (5)
- DxGraphics / DxGateway

#### 知見 (重要)

- **"DxGateway.cpp 入れる = link 爆発" は誤り**。逆に入れないと公開 API すべて未解決
- DxGateway は DxLib のファサード層。軽量なラッパーの集まりなので取り込んでも
  コードサイズは増えるが依存は深まらない
- platform-specific の分は全部 `_PF` で揃っていて、これを stub 化すれば link は通る
- 本物の `NS_DxLib_Init()` の実装を書くまでは、すべて stub を通過するだけで何も
  描画しない状態。しかし **link が通った** 意味は大きい: Graphics_Hardware_*_PF を
  １つずつ埋めていけば段階的に描画機能が戻ってくる

#### 次 Stage 6 — 候補

1. **A**. `Graphics_Hardware_Initialize_PF` 実装 (SDL2 window + SDL_GL_CreateContext 保持) + `Graphics_Hardware_ClearDrawScreen_PF` (glClear + glClearColor) + `Graphics_Hardware_Flip_PF` (SDL_GL_SwapWindow)
   - 最小の「青い窓」を DxLib 経由で描画できる
2. **B**. 先に `NS_DxLib_Init` の本実装に差し替えて、GraphicsInitialize を呼ぶ
3. **C**. ここで checkpoint commit

#### 次回即時再開時のメモ

- build コマンド: `cmake --build build --config Release --target stage4_init_test`
- 現在の動作確認: `./build/Release/stage4_init_test.exe`
- 期待出力: 上記参照
- 新規の _PF 実装を追加するときは [DxGraphicsDesktop_stubs.cpp](dxlib_portable/Desktop/DxGraphicsDesktop_stubs.cpp) の該当関数を編集するか、
  [DxGraphicsDesktop.cpp](dxlib_portable/Desktop/DxGraphicsDesktop.cpp) 側に移動して実装 (stub から実装への移行路線)

---

### 2026-04-22 — Day 1 追補 (Stage 6 完了 🎉)

#### 結論: DxLib 経由で実 SDL2 window + GL ES context が稼働

**実行結果** (`stage6_window_clear.exe`):
```
[Stage6] DxLib_Init...
[DxLib Desktop] NS_DxLib_Init
[DxLib Desktop] GL_VENDOR:   NVIDIA Corporation
[DxLib Desktop] GL_VERSION:  OpenGL ES 3.2 NVIDIA 591.44
[Stage6] rendered 181 frames, DxLib_End...
[DxLib Desktop] NS_DxLib_End
[Stage6] Done.
```

**60fps × 3秒 = 181 frames**, clear + flip が DxLib 経由でループ成功。

#### 実装した関数

- `DxDesktop_MakeWinAndGL(w, h, title)` — SDL_CreateWindow + SDL_GL_CreateContext
  - SDL_GL_CONTEXT_PROFILE_ES, major 2 / minor 0 指定
  - 失敗時 compat プロファイルに fallback
  - `GSYS.Setting.ValidHardware = TRUE` 設定 (これ忘れると NS_ClearDrawScreen が software path へ)
- `DxDesktop_KillWinAndGL()` — context + window 破棄
- `Graphics_Hardware_ClearDrawScreen_PF` — `glClearColor(BackgroundRGBA/255)` + `glClear`
- `Graphics_ScreenFlipBase_PF` — `SDL_GL_SwapWindow`
- `Graphics_Hardware_Initialize_PF` — ログのみ (SDL 初期化は DxDesktop_MakeWinAndGL で行う)

#### 引っかかった落とし穴 (次セッション向け注意)

1. **`CreateWindow` substring 問題は誤診**。最初 `DxDesktop_CreateWindowAndGLContext` が MSVC で
   "identifier not found" になって windows.h の CreateWindow マクロと衝突してるのかと疑ったが、
   実際は **DxLib namespace 内での forward decl と、DxGateway/DxLib.h が開閉する namespace の
   入れ子**が原因だった。
   → **解決**: `DxDesktop_*` を global scope に置き、`extern "C"` で宣言する。
     forward decl は [DxSystemDesktop.h](dxlib_portable/Desktop/DxSystemDesktop.h) に置いて
     `#include` で共有する (DxSystemDesktop.cpp と DxGraphicsDesktop.cpp 両方から include)

2. **Windows.h の typedef と DxDataTypeDesktop.h の #define の衝突**。
   SDL_opengl.h → windows.h → `typedef unsigned char BYTE` 。
   その後 DxDataTypeDesktop.h の `#define BYTE unsigned char` が展開されると
   `typedef unsigned char unsigned char BYTE` に化けて syntax error。
   → **解決**: [DxDataTypeDesktop.h](dxlib_portable/DxDataTypeDesktop.h) で `#ifdef _WIN32`
     の時は先に `<windows.h>` を include し、以降の BYTE/WORD/DWORD/RECT 等の独自定義を
     `#ifndef DX_DESKTOP_TYPES_FROM_WINDOWS_H` でスキップ。

3. **MSVC は `unsigned int` と `DWORD (=unsigned long)` を別型扱い**。
   stub 自動生成で `unsigned int` を吐いたがヘッダ側が `DWORD` で link error。
   → **解決**: 該当 6 関数 (`Graphics_Hardware_SetDrawBrightToOneParam_PF` 等) で
   `unsigned int` → `DWORD` に修正

4. **UTF-8 BOM が無い .cpp ファイルは MSVC が CP932 として誤読**し、日本語コメントが
   パーサを壊して謎のエラー行番号を出す。新規 .cpp 全てに BOM を付与 (python script で)

#### 成果物

- `dxlib_portable_stage3.lib` = **5.99 MB** (同じサイズ、Stage 5 時点と変化なし)
- `stage6_window_clear.exe` = 354 KB
- 実装した PF stub のうち 3 つが真実装に差し替わった: ClearDrawScreen / Initialize / ScreenFlipBase

#### 次 Stage 7 — 候補

1. **A**. `DrawBox` / `DrawCircle` 等の 2D primitive を PF stub で実装 (iOS 版 `DxGraphicsiOS.cpp` の該当コードを SDL2+GL に移植)
2. **B**. 背景色設定以外の「何かを実際描画」を目指す (DrawFillBox + VBO 経由)
3. **C**. Windows ANGLE バイナリ取得 + 差し替えテスト
4. **D**. Mac/Linux クロス検証 (これが本プロジェクトの最終目標)
5. **E**. Checkpoint commit

#### 次回即時再開用コマンド

```bash
cd "j:/HNWorks/IronHSP_2026/hsp3dx/dxlib_angle_sdl2"
"/c/Program Files/CMake/bin/cmake.exe" --build build --config Release --target stage6_window_clear
./build/Release/stage6_window_clear.exe  # 3 秒で終了する
```

---

### 2026-04-22 — Day 1 追補 (Stage 7 完了 🎉)

#### 結論: DxLib の 2D プリミティブが実画面に見える

**実行結果** (`stage7_draw_primitives.exe`):
スクショ: [stage7_screenshot.png](stage7_screenshot.png) — 4 秒間のループで:
- 暗い紺背景 (`SetBackgroundColor(30,30,60)`)
- 四隅に色違いの `DrawFillBox` (赤/緑/青/黄)
- 横に流れる水色の矩形 (毎フレーム x 座標更新)
- 中央に白い対角線 (`DrawLine` × 2本)

全て DxLib 公開 API (`DrawFillBox`, `DrawLine`, `GetColor`, `SetBackgroundColor`) 経由で呼ばれ、
`DxGateway → NS_* → Graphics_Hardware_*_PF` の完全なチェーンで画面に出ている。

#### 実装した PF 関数 (Stage 6 から +3)

- `Graphics_Hardware_DrawFillBox_PF(x1,y1,x2,y2,Color)` — `glOrtho` + `GL_TRIANGLE_STRIP` で矩形塗りつぶし
- `Graphics_Hardware_DrawLine_PF(x1,y1,x2,y2,Color)` — `GL_LINES` で線分
- `Graphics_Hardware_DrawPixel_PF(x,y,Color)` — `GL_POINTS` で 1 pixel
- 共通 helper: `Desktop_SetOrtho2D()` (glOrtho で左上原点座標系) / `Desktop_SetGLColor(Color)` (DxLib Color → glColor4ub)

#### GL context を ES → compat profile に変更

Stage 6 時点では `SDL_GL_CONTEXT_PROFILE_ES` で GL ES 3.2 を要求していたが、**GL ES 2+ は
fixed-function pipeline を持たない** (glBegin/glEnd が使えない) ため、Stage 7 では
`SDL_GL_CONTEXT_PROFILE_COMPATIBILITY` に切り替え。

→ `[DxLib Desktop] GL_VERSION:  4.6.0 NVIDIA 591.44` (compat profile)

**ANGLE 差し替え時に再度 ES profile に戻して、shader ベースで 2D 描画するように
書き直す必要がある**。Stage 7 はあくまで「compat で楽して可視化優先」。

#### 累計状況

| 項目 | 数 |
|------|---|
| 実装済 _PF 関数 (真実装) | 6 (Initialize, ClearDrawScreen, ScreenFlipBase, DrawFillBox, DrawLine, DrawPixel) |
| stub のまま _PF | 152 |
| Stage 成果物 | stage1/stage2/stage4_init_test/**stage6_window_clear**/**stage7_draw_primitives** |
| dxlib_portable_stage3.lib サイズ | 5.99 MB |

#### 次 Stage 8 以降 — 候補

1. **A**. より多くの 2D primitive PF を埋める (DrawCircle / DrawOval / DrawTriangle / DrawQuadrangle)
2. **B**. テクスチャ系 (LoadGraph / DrawGraph) — VBO + texture ID 管理が必要、shader 前提
3. **C**. Mac クロスコンパイル試行 — DxPortLib なしで DxLib 本家 → SDL2+GL が Mac でビルドできるか検証
4. **D**. Checkpoint commit (Stage 1〜7 一括)
5. **E**. DrawString (テキスト描画) — SDL2_ttf 連携が必要

#### 次回即時再開用コマンド

```bash
cd "j:/HNWorks/IronHSP_2026/hsp3dx/dxlib_angle_sdl2"
"/c/Program Files/CMake/bin/cmake.exe" --build build --config Release --target stage7_draw_primitives
./build/Release/stage7_draw_primitives.exe  # 4 秒間描画
```

---

### 2026-04-22 — Day 1 追補 (Stage 8 完了 🎉)

#### 結論: 2D primitive を 5 種追加、全て画面出力確認

**実行結果** (`stage8_more_primitives.exe`):
スクショ: [stage8_screenshot.png](stage8_screenshot.png) — 5 秒間のループで:
- 上段: `DrawCircle(塗)` ピンク / `DrawCircle(枠)` 白 / `DrawOval(横長塗)` 緑 / `DrawOval(縦長塗)` 青
- 中段: `DrawTriangle(塗)` 橙 / `DrawTriangle(枠)` 白 / `DrawQuadrangle(塗)` 紫 / `DrawLineBox` 水色
- 下段: `DrawFillBox` 水色 (横移動) / `DrawLine` 対角線

#### 実装した PF 関数 (Stage 7 から +5, 累計 11/158)

- `Graphics_Hardware_DrawLineBox_PF` — `GL_LINE_LOOP` で矩形の枠
- `Graphics_Hardware_DrawCircle_PF` — 48 segments、`GL_TRIANGLE_FAN` (塗) / `GL_LINE_LOOP` (枠)
- `Graphics_Hardware_DrawOval_PF` — Circle の xy 独立版
- `Graphics_Hardware_DrawTriangle_PF` — `GL_TRIANGLES` / `GL_LINE_LOOP`
- `Graphics_Hardware_DrawQuadrangle_PF` — `GL_TRIANGLE_FAN` (4 頂点) / `GL_LINE_LOOP`

#### 引っかかった罠

- `#include <cmath>` を **namespace DxLib 内で include したら C2061 大量発生** — C++ std ヘッダは global scope で include しないと templates が壊れる。解決: top of file (namespace 前) に移動

#### 累計状況 (Stage 8 終了時)

| 項目 | 数 |
|------|---|
| 実装済 _PF (真実装) | **11** (Initialize, ClearDrawScreen, ScreenFlipBase, DrawFillBox, DrawLine, DrawPixel, DrawLineBox, DrawCircle, DrawOval, DrawTriangle, DrawQuadrangle) |
| stub のまま | 147 |
| Stage 成果物 exe | stage1, stage2, stage4_init_test, stage6_window_clear, stage7_draw_primitives, **stage8_more_primitives** |
| dxlib_portable_stage3.lib | 5.99 MB (変化なし) |

#### 次 Stage 9 以降 — 候補

1. **A**. さらに PF 埋め (DrawBoxSet / DrawLineSet / DrawPixelSet / `*_Thickness`)
   — 一括描画系。効率は悪いがループで PF の既存実装を呼ぶだけで通る
2. **B**. **テクスチャ系** (`Graphics_Image_SetupHandle_UseGParam_PF` / `LoadGraph` / `DrawGraph`)
   — texture ID 管理 + VBO + shader が必要。大規模、ここで compat profile から脱却
3. **C**. Mac クロスコンパイル — CMake を Mac 向けに調整、SDL2 の Framework 対応
4. **D**. **Checkpoint commit** (Stage 1〜8 一括)
5. **E**. フルスクリーン切り替え / ウィンドウサイズ変更対応 (`NS_SetGraphMode`)

#### 次回即時再開用コマンド

```bash
cd "j:/HNWorks/IronHSP_2026/hsp3dx/dxlib_angle_sdl2"
"/c/Program Files/CMake/bin/cmake.exe" --build build --config Release --target stage8_more_primitives
./build/Release/stage8_more_primitives.exe  # 5 秒間描画、8 パターン表示
```

---

### 2026-04-22 — Day 1 追補 (Stage 9 完了 🎉)

#### 結論: Set/Thickness 系 5 PF 追加、アニメーションデモ完動

**実行結果** (`stage9_animated.exe`, 6 秒):
[stage9_screenshot.png](stage9_screenshot.png):
- 上段: 50 個のカラフルな矩形の帯 (`DrawBoxSet`) — sin 波で色が流れる
- 中段: 60 本の螺旋状の線束 (`DrawLineSet`) — 色相も回転
- 下段: 同心円 × 4 + 楕円の枠

#### 実装した PF (Stage 8 から +5, 累計 16/158)

- `Graphics_Hardware_DrawBoxSet_PF(RECTDATA*, N)` — N 個の矩形を一括、色は per-box
- `Graphics_Hardware_DrawLineSet_PF(LINEDATA*, N)` — N 本の線
- `Graphics_Hardware_DrawPixelSet_PF(POINTDATA*, N)` — N 個のピクセル
- `Graphics_Hardware_DrawCircle_Thickness_PF` — glLineWidth 使用で太い円
- `Graphics_Hardware_DrawOval_Thickness_PF` — 同上 楕円版

#### 累計 (Stage 9 終了時)

| 項目 | 数 |
|------|---|
| 実装済 _PF | **16** |
| stub のまま | 142 |
| Stage exe | stage1, stage2, stage4_init_test, stage6, stage7, stage8, **stage9** |

#### 次 Stage 候補

- **A**. Checkpoint commit (9 stages 一括、大きな区切り)
- **B**. Mac クロスコンパイル検証 (本命)
- **C**. テクスチャ (LoadGraph/DrawGraph) — shader 必須、大工事
- **D**. Fullscreen / NS_SetGraphMode (ウィンドウサイズ変更)
- **E**. さらに PF 埋め (DrawRotaGraph 等、shader 無しでは難しい)

#### 次回即時再開用コマンド

```bash
"/c/Program Files/CMake/bin/cmake.exe" --build build --config Release --target stage9_animated
./build/Release/stage9_animated.exe  # 6 秒アニメーション
```

---

### 2026-04-22 — Day 1 追補 (Checkpoint commit + Stage 10 + Stage 11 🎉)

#### Checkpoint: `e2dc16b0` (Stage 1〜9 一括、514 files, +853K 行)

`feat(hsp3dx): dxlib_angle_sdl2 Stage 1〜9 — DxLib を SDL2+GL で Desktop 起動`

#### Stage 10: Blend mode + Bright + DrawQuadrangleF (5 PF 追加, 累計 21/158)

- `Graphics_Hardware_DrawQuadrangleF_PF` — float 座標版
- `Graphics_Hardware_SetDrawBlendMode_PF` — ALPHA/ADD/SUB/MUL/PMA_ALPHA/INVSRC → glBlendFunc
- `Graphics_Hardware_SetDrawBright_PF` — R/G/B を保持し Desktop_SetGLColor で乗算
- `Graphics_Hardware_SetDrawBrightToOneParam_PF` — 旧 API no-op
- `Graphics_Hardware_RefreshAlphaChDrawMode_PF` — no-op

注意: `glBlendEquation(GL_FUNC_REVERSE_SUBTRACT)` は GL extension なので MSVC link で
`__imp_glBlendEquation` 未解決エラー発生。SUB 系は `glBlendFunc(GL_ZERO, GL_ONE_MINUS_SRC_ALPHA)`
近似に差し替え (ANGLE/shader 化時にちゃんと実装し直し)

#### Stage 11: Emscripten (WebAssembly + WebGL) 動作確認 🎉🎉🎉

**本プロジェクトの本命目標 "cross-platform" が初実証**。

- emsdk 最新版 (5.0.6) を `c:/Build/emsdk/` にインストール (python emsdk.bat install latest)
- 最小 Web デモ: [web/stage1_web.cpp](web/stage1_web.cpp)
  - DxLib なしの SDL2 直接コード (stage1_empty_window.cpp の emscripten 版)
  - `emscripten_set_main_loop()` でブラウザループ
  - `glClearColor` を時間で変化させて視覚確認
- ビルドコマンド:
  ```bash
  emcc stage1_web.cpp -o stage1_web.html \
    -s USE_SDL=2 -s FULL_ES2=1 \
    -s MIN_WEBGL_VERSION=2 -s MAX_WEBGL_VERSION=2 \
    -s ALLOW_MEMORY_GROWTH=1 -std=c++17 -O2
  ```
- 出力: `stage1_web.wasm` (412 KB) + `stage1_web.js` + `stage1_web.html` (19 KB)
- Chrome で `http://127.0.0.1:8766/stage1_web.html` を開いて青系 canvas 表示を確認

**Web 配信時の注意**:
- Python の `-m http.server` は `.wasm` の MIME type を `application/octet-stream` で返す場合があり、
  ブラウザが streaming instantiation を拒否して停止することがある
- 解決: `.wasm` → `application/wasm` に MIME 上書きする簡易 server を使う
  ```python
  class H(http.server.SimpleHTTPRequestHandler):
      extensions_map = {**H.extensions_map, '.wasm': 'application/wasm'}
  ```
- `emrun` コマンドも使えるが今回は素の python server + MIME 上書きで動いた

#### 累計状況 (Stage 11 終了時)

| 項目 | Windows | Web |
|------|---------|-----|
| stage1 (SDL2 + GL) | ✓ | **✓** |
| stage6〜9 (DxLib 経由 2D 描画) | ✓ | 未検証 (Stage 12 候補) |
| 実装済 _PF | 21/158 | 同左 |

#### 教訓 / 知見

- emscripten 公式 shell.html は `.wasm` MIME が正しいと 400 KB 程度は数秒でロード
- SDL2 は `-s USE_SDL=2` で emscripten 側が自動でコンパイル + cache (`C:/Build/emsdk/upstream/emscripten/cache/` 下)
- FULL_ES2 を指定すると WebGL2 context が得られる (本家のコードは GL ES 2 なので動く)
- python の `http.server` は `-m` で使うと MIME 差し替え困難 → 5 行の wrapper 書く方が速い

#### 次 Stage 12 候補

- **A**. **DxLib 本体 (stage6 相当) を emscripten でビルド** — これが通れば "DxLib on Web" が完成
  - 難度高め: 5.99MB の static lib + 500+ ソースファイル、compat profile → ES2 shader 書き直しも必要になる可能性
- **B**. Stage 11 の拡張 (DrawBox/DrawLine 等を純 SDL2+WebGL で実装、hsp3dx とは別)
- **C**. Mac ビルド (SDL2 は brew、DxLib フォークに Mac 固有 stub 追加必要)
- **D**. checkpoint commit (Stage 10 + 11)

---

### 2026-04-22 — Day 1 追補 (Stage 12 完了 🎉🎉🎉)

#### 結論: **DxLib 本体が WebAssembly で稼働**

Stage 4 (DxLib_Init/End stub 呼び出し) の **Web 版が動作**:

スクショ: [stage12_stage4web.png](stage12_stage4web.png) — Chrome で出力:
```
[Stage4] Calling DxLib_Init...
[Stage4] DxLib_Init returned 0
[Stage4] Calling DxLib_End...
[Stage4] Done.
```

#### ビルド手順 ([web/build_web.sh](web/build_web.sh))

```bash
emcc ../../src/stage4_init_test.cpp \
  ../../dxlib_portable/Dx*.cpp \
  ../../dxlib_portable/Desktop/Dx*Desktop*.cpp \
  -I../../dxlib_portable \
  -DDX_PLATFORM_DESKTOP_SDL2=1 -DDX_GCC_COMPILE=1 -DDX_NON_INLINE_ASM=1 \
  -DDX_NON_GRAPHICS=1 -DDX_NON_MOVIE=1 ...(他 non 群)... \
  -s USE_SDL=2 -s ALLOW_MEMORY_GROWTH=1 -s INITIAL_MEMORY=64MB \
  -s FULL_ES2=1 -s MIN_WEBGL_VERSION=2 -s MAX_WEBGL_VERSION=2 \
  -std=c++17 -O0 -g \
  -Wno-macro-redefined -Wno-invalid-source-encoding \
  -o stage4_web.html
```

出力: **stage4_web.wasm = 6.1 MB**

#### 重要な知見

1. **`-finput-charset=CP932` は clang 不対応**。ShiftJIS の DxLib ソースは
   `-Wno-invalid-source-encoding` で警告無視すれば clang が通してくれる
2. **`_WIN32` は emscripten で未定義**なので `DxDataTypeDesktop.h` の
   `DX_DESKTOP_TYPES_FROM_WINDOWS_H` ブランチが無効化され、
   `#define BYTE / WORD / DWORD / RECT / POINT` が全部有効になる
3. stderr の `[DxLib Desktop]` ログは emscripten のデフォルト textarea には
   出ず、stdout のみ表示。完全表示には `EXPORT_PRINT_STDERR` 等の追加設定が要る
4. `-s INITIAL_MEMORY=64MB` 設定が推奨 (dxlib 内部の MAX_HANDLE_NUM 確保で必要)
5. 6.1MB は大きめ。-O3 + -s ASSERTIONS=0 で 3MB 程度まで圧縮可能

#### 動いているプラットフォーム層と動いていないもの

| 機能 | Windows Desktop | Web |
|------|----------------|-----|
| DxLib_Init/End (stub) | ✓ | **✓** |
| DxLib_Init/End (本物 via DxGateway) | ✓ | **✓** |
| File I/O (std::filesystem) | ✓ | 未検証 |
| Thread (SDL2) | ✓ | 未検証 (Web はそもそも single thread 基本) |
| Graphics (compat GL fixed-function) | ✓ | ✗ (WebGL 非対応) |
| stage6 (窓 + clear + flip) | ✓ | **未対応** (glBegin/glEnd なし) |

#### Stage 12 で出来ていないこと (正直な報告)

- **stage6 以降 (Graphics 有効) の Web 動作は未達成**。理由は `DxGraphicsDesktop.cpp`
  が compat profile の fixed-function (`glOrtho`, `glBegin`, `glEnd`, `glVertex2f`,
  `glColor4ub`) を使っているため。WebGL は GL ES 2+ 互換で fixed-function 無し。
- 対処案:
  - **A**. emscripten の `-s LEGACY_GL_EMULATION=1` で fixed-function を WebGL に
    エミュレートさせる (限定的だが動く可能性あり)
  - **B**. `DxGraphicsDesktop.cpp` を完全な shader + VBO ベースに書き直す
    (ANGLE 経由 Mac/Linux/Web に向けた本命の解決策)

#### 次 Stage 13 — 候補

- **A**. `-s LEGACY_GL_EMULATION=1` で stage6/7/8/9 の Web 動作を試行
- **B**. `DxGraphicsDesktop.cpp` の 2D primitive を shader 化 (ES 2 compatible)
- **C**. Checkpoint commit (Stage 10/11/12 一括)
- **D**. Mac / Linux ビルドへ

#### 次回即時再開用コマンド

```bash
# Web ビルド (stage4):
cd j:/HNWorks/IronHSP_2026/hsp3dx/dxlib_angle_sdl2/web/build
bash ../build_web.sh stage4

# Server:
python -c "
import http.server, socketserver, os
class H(http.server.SimpleHTTPRequestHandler):
    extensions_map = {**http.server.SimpleHTTPRequestHandler.extensions_map, '.wasm':'application/wasm'}
os.chdir('j:/HNWorks/IronHSP_2026/hsp3dx/dxlib_angle_sdl2/web/build')
with socketserver.TCPServer(('127.0.0.1', 8766), H) as s: s.serve_forever()
"

# Open Chrome: http://127.0.0.1:8766/stage4_web.html
```

---

### 2026-04-22 — Day 1 追補 (Stage 13 完了 🎉🎉🎉 — DxLib 2D on Web 動作)

#### 結論: **DxLib の 2D 描画が WebAssembly + WebGL で動作**

スクショ: [stage13_v4.png](stage13_v4.png) / [stage13_v4_small.png](stage13_v4_small.png)

Chrome ブラウザの canvas 上に stage7 の描画結果が表示された:
- 紺色背景
- 四隅の色付き矩形 (赤/緑/青/黄)
- 中央に時間で横移動する水色矩形
- 白い対角線 2 本

コンソール出力:
```
[Stage7Web] DxLib_Init...
[Stage7Web] Starting main loop (60fps)
```

#### 達成した工夫

1. **emscripten 向けに `-s LEGACY_GL_EMULATION=1`** を追加 (fixed-function GL を WebGL にエミュ)
   - `FULL_ES2=1` と両立しないので外す必要あり (両方指定すると "cannot emulate both" エラー)
2. **MSVC 固有型を可搬型に**: `unsigned __int64` → `unsigned long long` (clang 非対応)
3. **emscripten-aware main loop**: busy loop は browser で blocking → `emscripten_set_main_loop` 版の
   [web/stage7_web.cpp](web/stage7_web.cpp) を新規作成
4. **SDL_GL context attr を emscripten 分岐**: `DxDesktop_MakeWinAndGL` 内で
   `#ifdef __EMSCRIPTEN__` 時は PROFILE_MASK/VERSION を設定しない (COMPAT profile は WebGL 非対応)

#### 動作状況 (最終)

| Target | stage1 | stage4 | stage7 (2D) | stage8+ |
|--------|--------|--------|-------------|---------|
| Windows Desktop | ✓ | ✓ | ✓ | ✓ |
| **Web (WASM/WebGL)** | ✓ | ✓ | **✓** | 未検証 (同じ仕組みで動くはず) |

**hsp3dx の DxLib 2D 描画が Windows Desktop と Web ブラウザで稼働**。
Mac/Linux も SDL2 + 同コードなので同じく動く見込み。

#### 次回即時再開コマンド

```bash
# Web ビルド (2D 描画デモ):
cd j:/HNWorks/IronHSP_2026/hsp3dx/dxlib_angle_sdl2/web/build
bash ../build_web.sh stage7

# Chrome で: http://127.0.0.1:8766/stage7_web.html
#   → 四隅の色矩形 + 白対角線 + 横移動水色矩形 が 60fps で描画
```

---

### 2026-04-22 — Day 1 追補 (Stage 14 完了 — 自動キャプチャ + stage8/9 Web)

#### 課題と解決

Chrome を手動で何度も開き直す必要があり不便だった
→ **ブラウザから canvas と console をローカルサーバーに POST する仕組み**を構築。

#### 作ったもの

1. **[web/capture_shell.html](web/capture_shell.html)**: emscripten の `--shell-file` テンプレ
   - `Module.print` / `Module.printErr` をオーバーライドして `POST /log` で送信
   - `?capture=N&interval=MS&close=1` クエリで N 枚スナップショット後自動閉じ
   - **重要**: `WebGL` context 生成前に `getContext` を wrap して
     `preserveDrawingBuffer: true` を強制しないと `canvas.toDataURL()` が
     真っ黒になる (WebGL デフォは SwapBuffers 後に buffer クリア)

2. **[web/capture_server.py](web/capture_server.py)**: 静的ファイル配信 + POST 受信
   - `POST /log` → `build/captures/<stage>/log.txt` に追記
   - `POST /screenshot` → base64 PNG を `frame_NNNN.png` に保存
   - `.wasm` MIME type を `application/wasm` に (streaming instantiation 用)

3. **build_web.sh 更新**: `--shell-file ../capture_shell.html` 追加

#### 使い方

```bash
# サーバー起動
python web/capture_server.py stage7

# Chrome を 1 度だけ開く (incognito 推奨)
chrome --incognito --new-window \
  "http://127.0.0.1:8766/stage7_web.html?capture=5&interval=1000&close=1"

# 20 秒ほど待つ → captures/stage7/frame_NNNN.png + log.txt
```

#### stage7/8/9 の Web 版キャプチャ結果

ブラウザをパタパタさせず、サーバー側の PNG ファイルを読むだけで確認可能:

| Stage | PNG | 内容 |
|-------|-----|------|
| stage7 | captures/stage7/frame_0008.png | 四隅矩形 + 対角線 + 動く矩形 |
| stage8 | captures/stage8/frame_0003.png | 円/楕円/三角/ひし形/枠 全種 |
| stage9 | captures/stage9/frame_0003.png | 50 矩形帯 + 螺旋線 + 同心円 |

全部きれいに Chrome/WebGL で描画されてる。

#### log.txt サンプル (stage7/log.txt 実物)

```
[Stage7Web] DxLib_Init...
[err] [DxLib Desktop] NS_DxLib_Init
[err] WARNING: using emscripten GL immediate mode emulation.
[err] [DxLib Desktop] GL_VENDOR:   WebKit
[err] [DxLib Desktop] GL_VERSION:  OpenGL ES 2.0 (WebGL 1.0 (OpenGL ES 2.0 Chromium))
[Stage7Web] Starting main loop (60fps)
```

#### 次回即時再開コマンド

```bash
cd j:/HNWorks/IronHSP_2026/hsp3dx/dxlib_angle_sdl2

# 任意 stage を Web ビルド + capture
bash web/build_web.sh stage7   # or stage8, stage9
python web/capture_server.py stage7 &
sleep 3
chrome --incognito --new-window "http://127.0.0.1:8766/stage7_web.html?capture=5&interval=1000&close=1"
# → web/build/captures/stage7/ に PNG 5 枚 + log.txt が出る
```

---

### 2026-04-22 — Day 1 追補 (Stage 15 — Linux + Mac ネイティブビルド 🎉)

#### 結論: **Windows / Web / Linux / Mac の 4 プラットフォーム全部で stage4 以上が動作**

| Target | stage4 | stage7 (2D) |
|--------|:---:|:---:|
| Windows Desktop (MSVC) | ✓ | ✓ |
| Web (emscripten WASM + WebGL) | ✓ | ✓ |
| **Linux (WSL2 Ubuntu GCC 13.3)** | **✓ (Mesa 25)** | ビルド ✓ / GUI は WSLg 待ち |
| **Mac (arm64 AppleClang 17 + Metal)** | **✓ (Metal 90.5)** | **✓ 221 frames 完走** |

#### CMakeLists.txt を cross-platform 化

`WIN32` / `APPLE` / `UNIX` ブランチで:
- Windows: `extlib/SDL2` prebuilt + `opengl32`
- Linux/Mac: `find_package(SDL2 REQUIRED)` + `find_package(OpenGL REQUIRED)`
- MSVC 以外では `-Wno-invalid-source-encoding -Wno-macro-redefined` で ShiftJIS 混在許容

#### ネイティブビルドで判明した修正点

1. **`__cdecl` は MSVC 固有** (GCC/Clang で未知) — stubs.cpp 内で `#if !defined(_MSC_VER) #define __cdecl` を先頭に追加
2. **`MailApp_Send_WCHAR_T_PF` が Mac link で unresolved** (Win では呼ばれない path) — stub 追加

#### 確認済の動作ログ

**Linux (WSL2, Mesa 25.2.8):**
```
[DxLib Desktop] NS_DxLib_Init
[DxLib Desktop] GL_VENDOR:   Mesa
[DxLib Desktop] GL_VERSION:  4.5 (Compatibility Profile) Mesa 25.2.8-0ubuntu0.24.04.1
[Stage4] DxLib_Init returned 0
```

**Mac (arm64, AppleGL+Metal backend):**
```
[DxLib Desktop] NS_DxLib_Init
[DxLib Desktop] GL_VENDOR:   Apple
[DxLib Desktop] GL_VERSION:  2.1 Metal - 90.5
[Stage7] rendered 221 frames
```

→ **Apple Silicon で OpenGL が Metal 経由で動く** (ANGLE 無しで)。Metal backend は macOS 10.14+ で自動有効。

#### 参考: 環境情報 memory

環境情報は [reference_mac_wsl_cross_build_env.md](.../memory/reference_mac_wsl_cross_build_env.md) に保存済:
- Mac: `ssh -i ~/.ssh/id_hsp3dx_mac inovia@192.168.0.208`
- Mac プロジェクト: `/Volumes/karyl/HNWorks/IronHSP_2026/` (SMB マウント)
- WSL Ubuntu: `wsl -d Ubuntu`、`/mnt/j/HNWorks/IronHSP_2026/`

#### 次回即時再開コマンド

```bash
# Linux (WSL2):
wsl -d Ubuntu -- bash -c "cd ~/build_hsp3dx_linux && make stage4_init_test -j4 && ./stage4_init_test"

# Mac (SSH):
ssh -i ~/.ssh/id_hsp3dx_mac inovia@192.168.0.208 "cd ~/build_hsp3dx_mac && PATH=/opt/homebrew/bin:\$PATH make stage7_draw_primitives -j4 && ./stage7_draw_primitives"
```

---

### 2026-04-22 — Day 1 追補 (Stage 15 最終更新 — WSLg で Linux 描画確認 🎉)

#### Windows 10 22H2 + WSLg 対応

- Windows 10 Build 19045 は 22H2 で WSLg 対応可
- `wsl --update` で Store 版 WSL (2.6.3.0) に上げると自動で WSLg 有効化
- `wsl --shutdown` → 次回起動時に `/mnt/wslg/` 生成 + DISPLAY=:0 + WAYLAND_DISPLAY=wayland-0
- カーネルは 6.6.87.2-microsoft-standard-WSL2 (5.10 時代は WSLg 不可)

#### stage15_linux_visible.cpp 追加

WSLg 上で 60 秒間回り続ける stage8 相当のデモを追加 ([src/stage15_linux_visible.cpp](src/stage15_linux_visible.cpp))。
- stage7/8/9 は 4〜6 秒で終了するので screenshot 捕捉が難しい
- stage15 は 60 秒回す & SDL_QUIT を無視して event pump のみ
  (WSLg 環境で SDL_QUIT が早期発火する回避策)
- 60 frame ごとに `[Stage15] N frames` 出力

#### Linux ネイティブ描画確認

スクショ: [stage15_linux_wslg.png](stage15_linux_wslg.png)

右側に 640x480 の **Linux ネイティブウィンドウ** が Windows デスクトップ上に表示:
- Mesa 25.2.8 / GL 4.5 Compatibility Profile
- 円・楕円・三角・ひし形・矩形・対角線 全て描画成功
- SDL2 の Wayland backend → WSLg RDP → Windows DWM

#### 到達 (最終)

| Target | stage4 | stage7/8 (2D) |
|--------|:------:|:-------------:|
| Windows Desktop (MSVC) | ✓ | ✓ |
| Web (emscripten WASM+WebGL) | ✓ | ✓ |
| **Linux (WSLg + Mesa)** | **✓** | **✓** |
| **Mac (arm64 + Metal)** | **✓** | **✓** |

本命目標 **"hsp3dx DxLib を Windows/Web/Linux/Mac で動かす"** 全完走。

#### 次回即時再開用コマンド

```bash
# Web ビルド:
export PATH="/c/Build/emsdk/upstream/emscripten:$PATH"
cd j:/HNWorks/IronHSP_2026/hsp3dx/dxlib_angle_sdl2/web/build
/c/Build/emsdk/upstream/emscripten/emcc.bat ../stage1_web.cpp -o stage1_web.html \
  -s USE_SDL=2 -s FULL_ES2=1 -s MIN_WEBGL_VERSION=2 -s MAX_WEBGL_VERSION=2 \
  -s ALLOW_MEMORY_GROWTH=1 -std=c++17 -O2

# Server:
python -c "
import http.server, socketserver, os
class H(http.server.SimpleHTTPRequestHandler):
    extensions_map = {**http.server.SimpleHTTPRequestHandler.extensions_map, '.wasm':'application/wasm'}
os.chdir('j:/HNWorks/IronHSP_2026/hsp3dx/dxlib_angle_sdl2/web/build')
with socketserver.TCPServer(('127.0.0.1', 8766), H) as s: s.serve_forever()
"

# Open Chrome: http://127.0.0.1:8766/stage1_web.html
```
