# DxLib Desktop GLSL shaders (L4 — in progress)

このディレクトリには DxLib 本家の HLSL shader の GLSL 版 (GLSL 1.20 / OpenGL 2.1
compat profile 向け) を順次バンドルする。

## 現在同梱 (Phase 1 template)

| ファイル | 用途 | 進捗 |
|---|---|---|
| `mv1_basic.vert.glsl` | MV1 model 頂点シェーダ (最小) | template |
| `mv1_basic.frag.glsl` | MV1 model フラグメントシェーダ (最小) | template |
| `filter_gauss.frag.glsl` | GraphFilter GAUSS (separable) | template |

## 今後追加予定 (優先順位順)

### MV1 Model
- `mv1_skin4.vert.glsl` — 4-bone skinning (bone palette uniform)
- `mv1_skin8.vert.glsl` — 8-bone skinning
- `mv1_lit.frag.glsl` — per-fragment Blinn-Phong (DiffuseLayer N 段 + Specular)
- `mv1_toon.frag.glsl` — Toon (DiffuseGradTexture 1D ramp + SphereMap)
- `mv1_normalmap.frag.glsl` — Tangent-space NormalLayer
- `mv1_shadow.frag.glsl` — Shadow map projection + PCF

### GraphFilter (GPU accelerated)
- `filter_ssao.frag.glsl` — Screen-Space Ambient Occlusion (depth + normal buffer)
- `filter_bicubic.frag.glsl` — Bicubic resample (CPU 版もあり、GPU 版は 10x 高速)
- `filter_lanczos3.frag.glsl` — Lanczos-3 resample
- `filter_gradmap.frag.glsl` — Gradient map (LUT 1D texture sampling)

### Shadow Map
- `shadow_depth.vert.glsl` / `.frag.glsl` — depth-only pass

## 統合方針

1. shader source は `.glsl` ファイルとしてビルド時に embed (C++ の const char*)
   するか、実行時にロードする。
2. `DxShaderDesktop.cpp` の `DesktopShader_CompileGLSL(vs, fs)` で compile、
   `DesktopShader_Use()` で bind。
3. MV1 draw path で material type / layer 数に応じて適切な shader を選択。
4. DxLib 本家 `LoadVertexShader` の backing として、file name から GLSL への
   mapping table を保持するか、HLSL→GLSL transpile を noop にして user が
   Desktop_ShaderLoadGLSL を明示的に呼ぶ形にするか検討。

HLSL → GLSL 自動変換には SPIRV-Cross や shaderc + glslang が必要だが、依存が
大きいため採用しない方向。DxLib 内蔵 shader の GLSL 手書き bundle が現実解。

## ライセンス

ここに置く GLSL ファイルは hsp3dx プロジェクト (DxLib zlib license 下) の一部。
DxLib 本家の HLSL から機能移植するが、コピーではなく機能互換の再実装。
