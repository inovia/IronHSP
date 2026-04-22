# DxPortLib vs DxLib (本家) 比較メモ

2026-04-22 調査。ANGLE + SDL2 移植の「どちらをベースにするか」判断用。

## 規模比較

| 項目 | DxLib (本家 3.24f) | DxPortLib (fork) |
|------|--------------------|-------------------|
| 主ソース行数 | ~298K (root 45 .cpp) | ~20K (全体) |
| iOS 固有 | +40K | ― |
| Android 固有 | +48K | ― |
| 最終更新 | 2026-04 (active) | **2017-11-05** (停滞) |
| 公式サポートプラットフォーム | Win / iOS / Android | Win / Linux (+SDL2) |
| 公開ライセンス | 独自 (個人可/改変可) | zlib ライセンス (寛容) |
| 3D | ✓ 完全 | ✗ **未サポート** |

## API 覆域 (DxPortLib の `DxLibFunctionSupport.txt` より集計)

| ステータス | 件数 |
|-----------|------|
| `*` 実装済 | 190 |
| `&` 部分実装 | 8 |
| `S` Stub のみ | 3 |
| `?` 未決 | 52 |
| `.` 未対応 | 1236 |
| `X` 永久非対応 | 103 |
| **合計** | **~1592** |

覆域は **190/1592 ≒ 12%** のみ。残り ~1340 関数が未実装or放棄。

### カテゴリ別欠落 (特に痛い箇所)

| カテゴリ | サポート | 未対応 |
|---------|---------|--------|
| DxGraph (2D描画) | 70 | 443 + X20 (= フィルタ/シェーダ/3D系ほぼ全滅) |
| DxModel (3D モデル) | **0** | **255** (全滅) |
| DxSound | 12 | 131 |
| DxFont | 38 | 47 |
| DxWindow | 24 | 50 + X69 |
| DxBaseImage | 2 | 67 |
| DxSoftImage | 0 | 44 |
| DxNetwork | 0 | 38 |
| DxMatrix/Vector | 0 | 95 |

### DxPortLib の公式 TODO (README/TODO.txt 抜粋)

- "Rendering: Currently too tied to OpenGL. Would like to separate that out more."
- "3D: Functions unsupported"
- "Movies: No support for movie playback, theora or otherwise."
- "Networking: No support whatsoever!"
- "Async load: No asynchronous loading support anywhere."
- "This library is not intended to be a 100% implementation"  ← **設計思想が違う**
- "Maintainers for all platforms don't exist, if you would like to help please contact!"

## DxPortLib アーキテクチャ (参考)

```
include/DxLib.h                # 公式 DxLib.h 互換の API 宣言
src/DxLib/                     # DxLib API → PL レイヤ変換
  DxLib.cpp, DxLib_c.c, DxDraw.c, DxFont.c, DxGraph.c, DxFile.c, DxDXA.c
src/DPL/                       # DxPortLib 独自の補助
src/PL/                        # プラットフォーム抽象
  PL/GL/       PLGL*.c          # OpenGL バックエンド (7 files / ~3000 lines)
  PL/D3D9/     PLD3D9*.c        # DirectX 9 バックエンド (7 files)
  PL/SDL2/     PLSDL2*.c        # SDL2 ウィンドウ/入力/オーディオ (8 files / ~1600 lines)
  PLAudio/PLInput/PLFile/...    # 共通バックエンド I/F
```

→ PL 層で GL / D3D9 / SDL2 を差し替え可能な設計。**ANGLE 注入は PL/GL 既存コードに向けて容易** (GL ES 2 呼び出しに集約すれば良い)。

## DxLib 本家の既存 iOS/Android 実装

- `iOS/DxGraphicsiOS.cpp` は既に **OpenGL ES 2.0/3.0** を使って 3D まで含めた全機能を実装済
- `Android/DxGraphicsAndroid.cpp` も同様
- シェーダは `DxShaderCodeBin_*_iOS.cpp` 等にバイナリで埋め込み済
- つまり **GL ES 実装は既にある** のが決定的に大きい

## 結論: ベース選定

### 採用案: **本家 DxLib iOS/Android 版をベース + プラットフォーム層差し替え**

理由:
1. **3D / Model / Live2D / Movie / Network / Async** などが全部そのまま使える
2. **シェーダ資産 (GL ES 2/3) が既に存在**、書き直し不要
3. 本家は継続メンテされている
4. DxPortLib から流用するコード量は少ない (せいぜい SDL2 adapter の参考)

### 書き換え必要な範囲 (推定)

| 現状 (iOS/Android) | Mac/Linux/Web 化 |
|--------------------|------------------|
| EAGLContext (iOS) / GLSurfaceView (Android) | → **ANGLE + SDL2** (Metal/Vulkan/WebGPU) |
| UIKit / NativeActivity | → **SDL2 window/event** |
| OpenAL (iOS/Android) | → **SDL2_mixer** or 既存 OpenAL (Linux/Mac で可) |
| CTFontRef / Android Typeface | → **SDL2_ttf** or FreeType 直接 |
| NSBundle / AAsset | → **fopen** (or SDL_RWops) |
| AVFoundation / MediaPlayer (Movie) | → **ffmpeg** or 無効化 |
| CLLocation/CMMotion (sensor) | → 無効化 or SDL_Sensor (限定的) |

ハードな部分は **windowing + input + audio の差し替え** のみ。
Graphics/Model/3D/Font の中身はほぼそのまま。

### 具体的な新規作成ファイル案

```
hsp3dx/dxlib_angle_sdl2/
  src/
    DxBaseFuncDesktop.cpp         # 共通ユーティリティ (時刻/乱数等、SDL2 で実装)
    DxGraphicsDesktop.cpp         # DxGraphicsiOS をベースに ANGLE/SDL2 対応
    DxFileDesktop.cpp             # fopen + SDL_RWops (DXA 対応維持)
    DxFontDesktop.cpp             # SDL2_ttf / FreeType
    DxInputDesktop.cpp            # SDL2 keyboard/mouse/joystick
    DxSoundDesktop.cpp            # OpenAL or SDL2_mixer
    DxLogDesktop.cpp
    DxThreadDesktop.cpp           # std::thread
    DxMemoryDesktop.cpp           # malloc/free
    DxObjectiveCPPStub.mm         # Mac only 残骸 (空でも可)
    DxShaderCodeBin_*_GLES.cpp    # iOS/Android のを流用
    main_sdl2.cpp                 # hsp3dx 側エントリポイント
  extlib/
    angle/                        # ANGLE prebuilt (Metal/Vulkan/WebGPU)
    sdl2/
  xmake.lua (or CMakeLists.txt)
```

### 初動 PoC プラン

1. **Stage 1: Empty window** — SDL2 + ANGLE で GL ES context 取る
2. **Stage 2: DrawBox / DrawCircle** — DxGraphics 最小 subset 通す
3. **Stage 3: LoadGraph/DrawGraph** — libpng/libjpeg 経由でテクスチャ
4. **Stage 4: sample_mes.ax 走行** — 2D サンプル動作確認
5. **Stage 5: 3D (MV1*)** — モデル表示
6. **Stage 6: Web 対応** — emscripten + WebGPU (ANGLE) ビルド

DxPortLib の PL/SDL2/ の `PLSDL2Window.c` / `PLSDL2Main.c` は **参考実装として読む価値あり** (SDL2 window init まわりのお作法)。直接取り込むほどではない。

## ライセンス注意

- DxLib 独自ライセンス: 個人利用/改変可だが、**再配布時は本家に連絡** / fork 公開は要確認
- public fork を GitHub に出すなら事前に山田巧氏に許諾取得が無難
- DxPortLib (zlib ライセンス) からコードを持ち込む場合は `COPYING.txt` 準拠で著作権表示
