# llama.cpp vendoring

`hspllama.dll` は llama.cpp (https://github.com/ggerganov/llama.cpp) を embed した
local LLM 推論プラグインです。ライセンスは MIT です。

llama.cpp は数百 MB 級のサードパーティ (GGML, CUDA, Metal, Vulkan etc.) を含み、
ビルド設定も CMake ベースで複雑なので、本リポジトリには vendor していません。
以下の手順で手動ビルド → ヘッダと lib だけを本ディレクトリに配置してください。

## 方法 A: CMake で static lib をビルド (推奨)

```bash
cd plugins/win32/hspllama/third_party
git clone --depth 1 https://github.com/ggerganov/llama.cpp.git llamacpp_src
cd llamacpp_src
cmake -B build -G "Visual Studio 17 2022" -A x64 ^
      -DBUILD_SHARED_LIBS=OFF ^
      -DLLAMA_BUILD_EXAMPLES=OFF ^
      -DLLAMA_BUILD_TESTS=OFF ^
      -DLLAMA_BUILD_SERVER=OFF ^
      -DGGML_CUDA=OFF
cmake --build build --config Release -j
```

ビルド完了後、以下を本ディレクトリへコピー:

```
third_party/llamacpp/
  include/
    llama.h
    ggml.h              (必要なら)
  lib/
    x64/
      llama.lib
      ggml.lib
      ggml-base.lib
      ggml-cpu.lib
      ...
```

さらに `hspllama.vcxproj` の Link AdditionalDependencies に `llama.lib;ggml.lib;...`
を追加してください (スタブビルドでは未列挙)。

## 方法 B: GPU バックエンド有効化

CUDA / Vulkan / DirectML で GPU 推論する場合:

- CUDA: `-DGGML_CUDA=ON` + CUDA Toolkit 必須。`cublas*.dll` の同梱も必要。
- Vulkan: `-DGGML_VULKAN=ON` + Vulkan SDK。
- Metal: Apple 限定 (本プラグインは Windows 専用なので対象外)。

## 方法 C: 既存の llama.dll を動的にロード

llama.cpp を shared lib としてビルド (`BUILD_SHARED_LIBS=ON`) すれば
`llama.dll` が得られます。これを HSP ランタイムと同じディレクトリに置いて
hspllama.dll からリンクさせるのが配布的に最もシンプルです。
その場合 `llama.lib` (import lib) を lib/x64/ に置いてリンクしてください。

## スタブビルド (llama.cpp 未配置)

`hspllama.cpp` は `__has_include("llama.h")` で存在チェックしており、
header がない場合は全 API がスタブ実装となります。

スタブでは:
- `llama_load` は -100 を返す
- `llama_complete` / `llama_chat` は `[hspllama stub: llama.cpp not linked]` を返す
- `llama_stream_*` は stub 文字列を 1 文字ずつ返す

`hsp3.exe` や他プラグインのビルド確認時に、llama.cpp を配置しなくても
`hspllama.dll` 自体は生成されます。

## 動作確認済みバージョン

- llama.cpp b3xxx 系 (2024 以降)
  (具体的な commit SHA は初回実動作確認時に記載)

## モデルの入手

```
# 例: Phi-3-mini 4K instruct Q4_K_M (2.4GB)
huggingface-cli download microsoft/Phi-3-mini-4k-instruct-gguf \
    Phi-3-mini-4k-instruct-q4.gguf --local-dir ./models

# 例: Llama 3.2 3B instruct Q4_K_M (2.0GB)
huggingface-cli download bartowski/Llama-3.2-3B-Instruct-GGUF \
    Llama-3.2-3B-Instruct-Q4_K_M.gguf --local-dir ./models
```

HSP 側で `llama_load "models/Llama-3.2-3B-Instruct-Q4_K_M.gguf", 2048, 99, h` のように
指定してください (n_gpu_layers=99 で「可能な限り全部 GPU offload」)。

## ライセンス

llama.cpp / ggml は MIT ライセンスです。配布時は両プロジェクトの LICENSE を同梱してください。
