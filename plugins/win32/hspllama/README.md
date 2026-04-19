# hspllama.dll — llama.cpp plugin for HSP (オフライン LLM)

ローカルで GGUF 量子化モデル (Llama / Mistral / Phi / Qwen / Gemma 等) を
推論できるプラグイン。ネットワーク不要、API キー不要、ローカル CPU で完結。

## API

```
llama_init
llama_shutdown
llama_load     "model.gguf", n_ctx, n_gpu_layers, var_handle
llama_close    h
llama_complete h, "prompt", max_tokens, var_text, text_max
llama_chat     h, "system", "user", max_tokens, var_text, text_max
llama_stream_begin h, "prompt", max_tokens
llama_stream_next  h, var_chunk, chunk_max             ; stat = 1 継続 / 0 終了
```

## ビルド手順

### 1. llama.cpp prebuilt (またはビルド済 libs) を配置

`third_party/llamacpp/` に `include/`, `lib/x64/`, `bin/x64/` が入っている
状態にする。本リポジトリには既に vendor 済み (llama.cpp ビルド成果物の
.dll / .lib + llama.h / ggml.h ほか)。

独自ビルドする場合:

```powershell
cd third_party
git clone https://github.com/ggerganov/llama.cpp.git src
cd src
cmake -B build -A x64 -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON -DGGML_NATIVE=OFF
cmake --build build --config Release -j
# build/bin/Release/{llama,ggml,ggml-base,ggml-cpu*}.dll を llamacpp/bin/x64/ へコピー
# build/Release/{llama,ggml,ggml-base}.lib を llamacpp/lib/x64/ へコピー
# src/include/* を llamacpp/include/ へコピー
```

### 2. ビルド

```powershell
msbuild hspllama.vcxproj /p:Configuration=Release /p:Platform=x64
# → Release/hspllama_64.dll
```

### 3. 配置

```powershell
cp Release/hspllama_64.dll ../../../package/win32/
# ランタイム DLL 一式
cp third_party/llamacpp/bin/x64/*.dll ../../../package/win32/
```

## モデル DL

HuggingFace や TheBloke の GGUF を `models/` 等に DL:

```powershell
# SmolLM-135M (~50MB、軽量テスト用)
curl -L -o models/smollm-135m.Q4_K_M.gguf \
  https://huggingface.co/HuggingFaceTB/SmolLM-135M-Instruct-GGUF/resolve/main/smollm-135m-instruct-q4_k_m.gguf

# Llama-3.2-1B-Instruct (~800MB)
curl -L -o models/llama-3.2-1b.Q4_K_M.gguf \
  https://huggingface.co/bartowski/Llama-3.2-1B-Instruct-GGUF/resolve/main/Llama-3.2-1B-Instruct-Q4_K_M.gguf
```

## テスト

```
cd package/win32/sample/iron
../../iron_test_runner.exe --compiler=../../hspcmp64.exe \
    --runtime=../../hsp3cl_net_test_64.exe --compath=../../common/ \
    test_llama.hsp
```

モデル DL 不要 (bad path で負ハンドル返却確認 + close 安全性)。
実推論サンプルは `sample_llama.hsp`、`sample_ai.hsp` (iron_ai 経由
`AI_BACKEND_LLAMA`) でも使える。

## 制限 / 注意

- **x64 のみ**: llama.cpp が AVX/AVX2 前提で 32-bit 動作未保証
- **CPU 推論デフォルト**: GPU 対応 (CUDA/Vulkan) には llama.cpp 本体を
  対応オプションで再ビルドして .dll を差し替える
- 多数の `ggml-cpu-*.dll` (CPU microarchitecture 自動選択) と
  `ggml-base.dll` / `ggml.dll` / `llama.dll` を同梱する必要あり

## 参考

- llama.cpp: https://github.com/ggerganov/llama.cpp
- GGUF モデル: https://huggingface.co/models?search=gguf
