# DxLib Desktop GLSL shaders

DxLib 本家の HLSL shader の GLSL 版 (GLSL 1.20 / OpenGL 2.1 compat profile 向け) を
提供する。template 的な .glsl ファイルと、実運用 shader が embed される実 .cpp の
両方があり、現状は embed 側が先行している。

## 配置

### このディレクトリ (ファイル .glsl template)

| ファイル | 用途 | 進捗 |
|---|---|---|
| `mv1_basic.vert.glsl` | MV1 model 頂点シェーダ template | reference |
| `mv1_basic.frag.glsl` | MV1 model フラグメントシェーダ template | reference |
| `filter_gauss.frag.glsl` | GraphFilter GAUSS template | reference |

### 実運用 (`DxShaderDesktop.cpp` / `DxGraphicsFilterGPUDesktop.cpp` / `DxLive2DCubism4Shader_stub.cpp`)

実 shader は C++ の `R"GLSL(...)GLSL"` raw string で embed されている。
編集する際は該当 .cpp を直接触る (ファイルの `s_*_vs` / `s_*_fs` 変数を探す)。

| Shader | 実装ファイル | 状態 |
|---|---|---|
| MV1 basic (Blinn-Phong + shadow2DProj + alpha + derivative TBN) | `DxShaderDesktop.cpp` (s_mv1_vs / s_mv1_fs) | ✅ 稼働中 |
| Filter BICUBIC (Catmull-Rom 4x4) | `DxGraphicsFilterGPUDesktop.cpp` (s_filter_bicubic_fs) | ✅ 稼働中 |
| Filter LANCZOS3 (6x6 sinc window) | 〃 (s_filter_lanczos3_fs) | ✅ 稼働中 |
| Filter GAUSS (9-tap separable) | 〃 (s_filter_gauss_fs) | ✅ 稼働中 |
| Filter SSAO (3x3 ring luminance 比較) | 〃 (s_filter_ssao_fs) | ✅ 稼働中 (2026-04-23) |
| Cubism 4 SetupMask | `DxLive2DCubism4Shader_stub.cpp` (VS_SETUP_MASK / FS_SETUP_MASK) | ✅ compile OK、実描画未検証 |
| Cubism 4 Normal | 〃 (VS_NORMAL / FS_NORMAL) | 〃 |
| Cubism 4 Normal PremultipliedAlpha | 〃 (FS_NORMAL_PA) | 〃 |
| Cubism 4 Masked | 〃 (VS_MASKED / FS_MASK) | 〃 |
| Cubism 4 MaskedInverted | 〃 (FS_MASK_INV) | 〃 |
| Cubism 4 MaskedPA | 〃 (FS_MASK_PA) | 〃 |
| Cubism 4 MaskedInvertedPA | 〃 (FS_MASK_INV_PA) | 〃 |

計: MV1 basic + GPU filter 4 種 + Cubism 7 program。Add/Mult 系は Normal program 再利用。

## 今後追加予定 (優先順位順)

### MV1 Model advanced

- `mv1_skin4.vert.glsl` — 4-bone skinning (bone palette uniform)
- `mv1_skin8.vert.glsl` — 8-bone skinning
- `mv1_lit.frag.glsl` — per-fragment Blinn-Phong (DiffuseLayer N 段 + Specular advanced)
- `mv1_toon.frag.glsl` — Toon (DiffuseGradTexture 1D ramp + SphereMap)
- `mv1_normalmap.frag.glsl` — Tangent-space NormalLayer (parallax 等の advanced 版)
- `mv1_shadow.frag.glsl` — Shadow map projection + PCF

### GraphFilter (GPU accelerated)

- `filter_gradmap.frag.glsl` — Gradient map (LUT 256 色 uniform or 1D texture sampling)

### Shadow Map

- `shadow_depth.vert.glsl` / `.frag.glsl` — depth-only pass

## 統合方針

1. shader source は `.cpp` 内の `R"GLSL(...)GLSL"` raw string で embed が基本
   (runtime 変更なし、build 時 static)
2. `DxShaderDesktop.cpp` の `DesktopShader_CompileGLSL(vs, fs)` で compile、
   `DesktopShader_Use()` で bind、`DesktopShader_SetUniform*` で uniform 設定
3. MV1 draw path で material type / layer 数に応じて適切な shader を選択
   (現状 `Desktop_MV1_UseGLSLShader(1)` で有効化、デフォルトは fixed-function)
4. DxLib 本家 `LoadVertexShader` の backing は .vso/.pso バイナリ前提で直接互換不可。
   Desktop 拡張 API (`DesktopShader_*`) で GLSL 直接使用が現実解

## HLSL → GLSL 自動変換 (将来検討)

SPIRV-Cross や shaderc + glslang 経由で自動変換できるが、依存が 100MB+ 級と
大きい。DxLib 内蔵 shader は 10〜20 種なので手書き bundle で済ます方針。
ただし DxLib API `.vso/.pso` ファイルをユーザが指定した場合の対応は別議論。

## ライセンス

- 本ディレクトリの template .glsl: hsp3dx プロジェクト (DxLib zlib license 下)
- DxShaderDesktop.cpp 内 embed shader: 同上 (機能互換の再実装)
- DxLive2DCubism4Shader_stub.cpp 内 Cubism shader: CubismFramework 由来、
  **Live2D Open Software License** (コメントで明示、source 由来も記載)
