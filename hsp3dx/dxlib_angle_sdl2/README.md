# hsp3dx — Mac/Linux/Web ポート作業場 (SDL2 + ANGLE)

DxLib を SDL2 + ANGLE 経由で Mac / Linux / Web に展開するための作業フォルダ。

- ベース: DxLib 3.24f 本家ソース (Windows/iOS/Android 公式サポート)
- 方針: **DxLib 本家をフォーク** (`dxlib_portable/`) + Desktop プラットフォーム層を追加
- 参考: DxPortLib (2017-11 停滞、2D のみ) — API カバレッジ 12% のため採用見送り

詳細な比較は [COMPARE_NOTES.md](COMPARE_NOTES.md) 参照。

## ディレクトリ構成

```
hsp3dx/dxlib_angle_sdl2/
├── extlib/
│   ├── SDL2/                    # SDL2 2.30.11 VC prebuilt (include + lib/x64 + bin)
│   └── DxLibMake/               # DxLib 3.24f ソース (read-only reference)
├── dxlib_portable/              # ★DxLib の Desktop 向けフォーク
│   ├── DxCompileConfig.h        # patched: DX_PLATFORM_DESKTOP_SDL2 ブランチ追加
│   ├── DxDataType.h             # patched: DxDataTypeDesktop.h 分岐
│   ├── DxDataTypeDesktop.h      # new (UTF-8): iOS 版ベース
│   ├── DxFunctionDesktop.h      # new (UTF-8): Desktop 固有 API 宣言
│   ├── Dx*.h                    # patched 18 files (Desktop/ ヘッダ分岐追加)
│   ├── Dx*.cpp                  # patched 7 files
│   ├── iOS/ / Android/ / 他     # 未変更
│   └── Desktop/                 # ★新規プラットフォーム層
│       ├── DxBaseFuncDesktop.{h,cpp}    # 実装済 (iOS 版の最小移植)
│       └── Dx*Desktop.h                 # stub 17 枚 (中身空、後日実装)
├── src/
│   ├── stage1_empty_window.cpp  # SDL2 + GL ES context の PoC
│   └── stage2_header_compile.cpp # DxLib.h パース検証
├── _research/
│   └── DxPortLib/               # 比較用 git clone
├── CMakeLists.txt
└── README.md (this file)
```

## ビルド (Windows MSVC)

```bash
cmake -S . -B build -G "Visual Studio 17 2022" -A x64
cmake --build build --config Release
```

### 生成ターゲット

| ターゲット | 目的 | 状態 |
|----------|------|------|
| `stage1_empty_window` | SDL2 で window + GL ES context 取得 | ✓ 動作確認済 |
| `stage2_header_compile` | DxLib.h が DX_PLATFORM_DESKTOP_SDL2 で parse 可能か検証 | ✓ pass |

## 現状の到達度

**Stage 1 (✓ done)** — SDL2 + OpenGL ES 2 window。
NVIDIA ドライバの native GL ES 3.2 context を取得して毎フレーム青系カラー clear。

**Stage 2 (✓ done)** — DxLib.h ヘッダ全体 (5688 行) が DX_PLATFORM_DESKTOP_SDL2
ブランチで parse 成功。プラットフォーム抽象層 scaffolding 完了:
- DX_PLATFORM_DESKTOP_SDL2 で WINDOWS_DESKTOP_OS を抑止
- Apple/Android と同等の DirectX/DSHOW/MediaFoundation/Network 無効化
- Desktop/ ディレクトリに 18 ヘッダ stub + 1 実装ファイル

**Stage 3 (次)** — `DxBaseFunc.cpp` が Desktop 向けにコンパイル可能に持っていく。
現時点では stub しか無いので、以下のファイル群の本実装が必要:
- `Desktop/DxLogDesktop.{h,cpp}` (iOS 版 200 行参考)
- `Desktop/DxMemoryDesktop.{h,cpp}`
- `Desktop/DxThreadDesktop.{h,cpp}` (iOS 版 422 行、pthread → std::thread)
- `Desktop/DxFileDesktop.{h,cpp}` (fopen + SDL_RWops で iOS NSBundle 相当)

## 残りの工数目安 (超概算)

| 段階 | 内容 | 見込み工数 |
|------|------|-----------|
| Stage 3 | 基礎 stub 実装 (BaseFunc/Log/Memory/Thread/File) | 1〜2 日 |
| Stage 4 | Desktop 版 DxBaseImage (画像 decode = libpng/jpeg 経由) | 2〜3 日 |
| Stage 5 | Desktop 版 DxGraphics (GL ES 2 2D 描画, iOS 版 12K 行移植) | **1〜2 週間** |
| Stage 6 | DxInput (SDL2 kbd/mouse/joy → DxLib)、DxSound (SDL2_mixer or OpenAL) | 3〜4 日 |
| Stage 7 | DxFont (SDL2_ttf or FreeType)、DxModel (3D, 最大工数) | **2 週間+** |
| Stage 8 | ANGLE 組み込み (Windows で libEGL/libGLESv2) | 2〜3 日 |
| Stage 9 | Mac ビルド (Metal backend via ANGLE) | 1 週間 |
| Stage 10 | Linux ビルド (Vulkan backend via ANGLE) | 3〜4 日 |
| Stage 11 | Web ビルド (emscripten + WebGPU backend via ANGLE) | 1 週間+ |
| Stage 12 | hsp3dx 統合 (hsp3dx/src を dxlib_angle_sdl2 バックエンドでビルド) | 3〜5 日 |

**総計**: 集中して作業しても **1.5〜2 ヶ月** 程度。

## セットアップ (初回)

`extlib/SDL2/` と `extlib/DxLibMake/` は git ignore してあるので、
次の手順で取ってくる必要がある。

```bash
cd hsp3dx/dxlib_angle_sdl2/extlib
# SDL2 prebuilt (VC)
curl -L -o SDL2.zip https://github.com/libsdl-org/SDL/releases/download/release-2.30.11/SDL2-devel-2.30.11-VC.zip
unzip SDL2.zip && mv SDL2-2.30.11 SDL2 && rm SDL2.zip

# DxLib 3.24f source (xsrv から手動 DL して配置)
# https://dxlib.xsrv.jp/ の「VisualC++用 ソースコード」からDL → DxLibMake フォルダをここに置く
```

`dxlib_portable/` は git 管理されている (DxLib 3.24f + 我々の patch 適用済)。

## ライセンス

- DxLib 本体: [DxLib 著作権](https://dxlib.xsrv.jp/dxlicense.html) — 著作権表記 (`DX Library Copyright (C) 2001-2025 Takumi Yamada`) を同梱すれば改変・再配布 OK の寛容なライセンス。
- SDL2: [zlib license](https://www.libsdl.org/license.php)
- 本リポジトリの新規コード (`Desktop/*`, `src/*`, CMake, ドキュメント類): hsp3dx 本体と同じライセンス

## 参考資料

- DxPortLib: [github.com/mauvecow/DxPortLib](https://github.com/mauvecow/DxPortLib)
  - 2D 実装 / SDL2 adapter (`src/PL/SDL2/PLSDL2Window.c` 等) は参考になる
  - 3D 全滅、採用見送り
- ANGLE: [chromium.org/angle](https://chromium.googlesource.com/angle/angle/+/main)
- SDL2: [libsdl.org](https://www.libsdl.org/)
