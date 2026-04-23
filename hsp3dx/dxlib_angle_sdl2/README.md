# hsp3dx/dxlib_angle_sdl2 — DxLib Desktop SDL2 fork

DxLib 3.24f 本家ソースを SDL2 + OpenGL (compat) で **Mac / Linux / Web** に展開する作業ツリー。
Windows での build も同ソースで通るので、Win/Mac/Linux/Web の 4 プラットフォームを
**同じ .cpp で** 対応する。

対応状況: **[PORTING_STATUS.html](PORTING_STATUS.html)** (主要 API) /
**[PORTING_STATUS_DETAIL.html](PORTING_STATUS_DETAIL.html)** (全 2438 関数) 参照。
変更履歴: **[SESSION_LOG.md](SESSION_LOG.md)** に日次記録。

## 構成

```
dxlib_angle_sdl2/
├── dxlib_portable/                 # DxLib 3.24f fork (patch 適用済)
│   ├── Dx*.cpp / Dx*.h             # DxLib 本体
│   ├── Desktop/                    # ★SDL2 + OpenGL 専用 platform 層
│   │   ├── DxGraphicsDesktop.cpp   # SDL2 window + GL context + 2D/3D 描画
│   │   ├── DxSoundDesktop.cpp      # SDL2_mixer + libogg/vorbis/opus デコード
│   │   ├── DxFontDesktop.cpp       # SDL2_ttf
│   │   ├── DxBaseImageDesktop.cpp  # stb_image
│   │   ├── DxMovie*Desktop.cpp     # Theora / Media Foundation / AVFoundation / GStreamer / <video>
│   │   ├── DxModelDesktop.cpp      # MV1 描画 (fixed-function + optional GLSL shader)
│   │   ├── DxShaderDesktop.cpp     # GLSL compile/use/uniform API (extern "C")
│   │   ├── DxGraphicsFilterDesktop.cpp     # GraphFilter CPU 版 (17 種)
│   │   ├── DxGraphicsFilterGPUDesktop.cpp  # GraphFilter GPU 版 (BICUBIC/LANCZOS3/GAUSS/SSAO)
│   │   ├── DxMaskDesktop.cpp               # Mask (stencil buffer)
│   │   ├── DxLive2DCubism4Desktop.cpp      # Live2D PF 関数 (SetupShader_PF 他)
│   │   ├── DxLive2DCubism4Shader_stub.cpp  # Cubism GLSL shader embed + compile
│   │   └── glsl/                   # MV1 shader GLSL template (mv1_basic / filter_gauss 等)
│   ├── iOS/ Android/ 他            # 本家プラットフォーム層 (非改変)
├── extlib/
│   ├── SDL2/ SDL2_ttf/ SDL2_mixer/ # SDL2 prebuilt (VC / Mac brew / Linux apt)
│   ├── libogg/ libvorbis/ opusfile/ libopus/ libtheora/ libtiff/   # 音声/映像 bundle
│   ├── bullet3/                    # Bullet Physics 3.25 source bundle
│   ├── cubism/                     # Live2D Cubism SDK 5-r.5 (Framework source + Core lib)
│   ├── glew/                       # GLEW 2.2 single-file
│   └── zlib/                       # zlib bundle
├── src/
│   ├── stage1〜stage25_*.cpp       # 機能別 demo (window / draw / image / font / sound / 3D / mv1 / movie 等)
│   └── stage*_web.cpp              # Web 向け entry
├── web/
│   ├── build_web.sh                # emscripten ビルドスクリプト
│   ├── capture_server.py           # 自動キャプチャ用 HTTP server
│   └── capture_shell.html          # screenshot 取得用 HTML shell
├── CMakeLists.txt
├── PORTING_STATUS.html             # 主要 API 対応マトリクス
├── PORTING_STATUS_DETAIL.html      # 全 2438 関数対応表 (自動生成)
├── SESSION_LOG.md                  # 日次作業ログ
├── COMPARE_NOTES.md                # DxPortLib との比較
└── README.md (this file)
```

## ビルド

### Windows (MSVC)
```bash
cmake -S . -B build -G "Visual Studio 17 2022" -A x64
cmake --build build --config Release
```

### Mac (arm64 Apple Silicon)
```bash
# brew / cmake / sdl2 / sdl2_mixer / sdl2_ttf 事前インストール要
# Mac は /opt/homebrew/bin が PATH に無いので明示
export PATH=/opt/homebrew/bin:$PATH
cmake -S . -B build_mac
make -C build_mac -j$(sysctl -n hw.ncpu)
```

### Linux (WSL2 Ubuntu + WSLg or native)
```bash
sudo apt install libsdl2-dev libsdl2-ttf-dev libsdl2-mixer-dev
cmake -S . -B build_linux
make -C build_linux -j$(nproc)
```

### Web (emscripten)
```bash
# /c/Build/emsdk にインストール済
export PATH=/c/Build/emsdk/upstream/emscripten:$PATH
cd web/build
bash ../build_web.sh stage4        # → stage4_web.{html,js,wasm}
```

## 現状の到達度

**対応プラットフォーム** (2026-04-25 時点):

### 5 platform で同一 .ax 起動達成 🎉

| Platform | Stage demo build | hsp3dx_desktop runtime | 同一 .ax 動作 |
|---|:---:|:---:|:---:|
| Windows (MSVC) | ✅ | ✅ (DxLib native) | ✅ 既存 |
| iOS (Xcode) | ✅ | ✅ libDxLib_iOS | ✅ 確認済 (Live2D / MV1+Bullet / Movie) |
| Android (NDK) | ✅ | ✅ NDK source build | ✅ 確認済 |
| **Mac arm64** (SDL2 fork) | ✅ | ✅ **2026-04-25 達成** | ✅ test_box+mes screenshot |
| **Linux x86_64** (WSL2) | ✅ | ✅ **2026-04-25 達成** | 🔶 ELF runtime 起動済、WSLg visual 残 |
| **Web** (emscripten) | ✅ | 🚧 build WIP | ⏳ DxFont/WebGL 構造化要 |

### 機能カバレッジ (Stage demo + DxLib 本体)

| Platform | Build | 2D | 3D/MV1 | Font | Sound | Movie | Mask/Filter | Live2D |
|---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| Windows (MSVC) | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ 本家 |
| iOS (Xcode) | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ 4-r.7 |
| Android (NDK) | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ 4-r.7 |
| **Mac arm64** (SDL2 fork) | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | 🔶 build |
| **Linux** (WSL2/native) | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | 🔶 build |
| **Web** (emscripten) | ✅ | ✅ | ✅ | △ | △ | △ | △ | ❌ 無効 |

- ✅ = 動作確認済、🔶 = build 通過 / runtime 未検証、△ = 部分、❌ = 未対応
- Windows/iOS/Android は DxLib 本家の platform 実装を使う
- Mac/Linux/Web は `Desktop/` 以下の SDL2+GL 実装

### hsp3dx_desktop ランタイム使い方

```sh
# Mac (SDL2 + Metal-translated GL)
cd hsp3dx/dxlib_angle_sdl2/build_mac && ./hsp3dx_desktop /path/to/start.ax

# Linux (WSL2 + Mesa GL)
cd hsp3dx/dxlib_angle_sdl2/build_linux && ./hsp3dx_desktop ./start.ax

# Web (emscripten、build WIP)
# 完成後: ブラウザで hsp3dx_desktop.html 開く
```

CMake target は EMSCRIPTEN/APPLE/Linux で platform 自動判別。`HSPMAC=1` /
`HSPLINUX=1` / `HSPEMSCRIPTEN=1` が定義され適切な supio が link される。

**主要機能** (L4 Phase 2 + M1-M5 + L1-L4 + E1 + 2026-04-23 分まで):

- 2D プリミティブ (Box/Circle/Line/...)、GraphBlend 16 mode、Bright、SetDrawMode
- 3D (DrawPolygon/DrawCapsule)、MV1 load + skin + 法線 + Lighting + Toon outline
- MV1 basic GLSL shader (per-fragment Blinn-Phong + shadow2DProj + alpha discard + derivative TBN)
- Font (SDL2_ttf)、Sound (SDL2_mixer + ogg/vorbis/opus)、Movie (Theora + platform native)
- Mask (stencil buffer)、GraphFilter 17 種 (CPU 15 + GPU 4: BICUBIC/LANCZOS3/GAUSS/SSAO)
- Live2D Cubism 4 (Win/iOS/Android 本家 + SDL2 fork は Cubism 5 SDK + GLSL shader embed 済)
- Bullet Physics 3.25 source bundle
- Shadow map projective (fixed-function + FBO)

## 残タスク

ランタイム検証:
- Mac / Linux / Web での実描画動作確認 (GUI window / draw テスト)
- Desktop SDL2 Cubism GLSL の実モデル描画検証 (hsp3dx runtime on SDL2 fork)

機能の穴:
- DxLib Shader API 完全互換 (.vso/.pso → GLSL transpile、2〜3 週間)
- GradMap GPU filter (今 CPU fallback)
- MV1 SpecularLayer advanced shader / parallax mapping
- Bullet Physics の hsp3dx runtime 統合

詳細は [PORTING_STATUS.html](PORTING_STATUS.html) の「保留項目」欄参照。

## セットアップ (初回)

`extlib/SDL2/` / `SDL2_ttf/` / `SDL2_mixer/` / `cubism/lib/` 配下は
`.gitignore` で除外。プラットフォーム別に取得が必要:

```bash
# Windows: SDL2 prebuilt (VC)
cd extlib
curl -L -o SDL2.zip https://github.com/libsdl-org/SDL/releases/download/release-2.30.11/SDL2-devel-2.30.11-VC.zip
unzip SDL2.zip && mv SDL2-2.30.11 SDL2 && rm SDL2.zip
# (SDL2_ttf / SDL2_mixer も同様の VC zip を取得)

# Mac: brew
brew install sdl2 sdl2_ttf sdl2_mixer

# Linux: apt
sudo apt install libsdl2-dev libsdl2-ttf-dev libsdl2-mixer-dev

# Cubism SDK (Live2D 使用時、全プラットフォーム共通)
# https://www.live2d.com/download/cubism-sdk/ から CubismSdkForNative-5-r.5.zip を DL
# SDK for Native を展開し、Core/lib/<platform>/libLive2DCubismCore.a を
# extlib/cubism/lib/<platform>/ にコピー
```

## ライセンス

- DxLib 本体: [DxLib 著作権表記同梱義務](https://dxlib.xsrv.jp/dxlicense.html)
- SDL2 / SDL2_ttf / SDL2_mixer: zlib license
- 音声/映像 bundle (libogg/vorbis/opus/theora/tiff): 各 BSD-like
- Bullet Physics 3.25: zlib license
- Cubism SDK (Core + Framework): Live2D Proprietary (各自 DL & 規約同意)
- 本リポジトリの新規コード (`Desktop/*`, `src/*`, CMake, ドキュメント類): hsp3dx 本体と同じ

## 参考

- **[PORTING_STATUS.html](PORTING_STATUS.html)** — 対応 API マトリクス
- **[SESSION_LOG.md](SESSION_LOG.md)** — 日次作業ログ (stage 1〜25 の足跡)
- DxPortLib [github.com/mauvecow/DxPortLib](https://github.com/mauvecow/DxPortLib) — 2017 停滞、比較用
- DxLib 本家 [dxlib.xsrv.jp](https://dxlib.xsrv.jp/) — ベースソース
