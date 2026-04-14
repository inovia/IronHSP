# hspwhisper.dll

Offline speech-to-text helper DLL for IronHSP, wrapping
[whisper.cpp](https://github.com/ggerganov/whisper.cpp).

## Status

- **Platform**: x64 only (whisper.cpp の SIMD/AVX 依存)
- **Output**: `Release/hspwhisper_64.dll`
- **HSP wrapper**: `package/win32/common/iron_speech.hsp` の `SPEECH_BACKEND_WHISPER`

## Build (one-time setup)

```bash
# 1. clone whisper.cpp
cd plugins/win32/hspwhisper/third_party
git clone --depth 1 https://github.com/ggerganov/whisper.cpp.git

# 2. cmake build (10〜30 分)
cd whisper.cpp
cmake -B build_x64 -A x64 -DCMAKE_BUILD_TYPE=Release \
  -DBUILD_SHARED_LIBS=OFF -DWHISPER_BUILD_TESTS=OFF \
  -DWHISPER_BUILD_EXAMPLES=OFF -DGGML_NATIVE=OFF
cmake --build build_x64 --config Release -j

# 3. hspwhisper.dll をビルド
cd ../..
msbuild hspwhisper.vcxproj /p:Configuration=Release /p:Platform=x64
```

## Model download

GGML model ファイルを `models/` または任意のパスに置く必要があります:

```bash
# tiny (75 MB) — 一番軽量
curl -L -o models/ggml-tiny.bin \
  https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-tiny.bin

# base (140 MB) — 推奨
curl -L -o models/ggml-base.bin \
  https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-base.bin

# small (470 MB) — 高品質
curl -L -o models/ggml-small.bin \
  https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-small.bin

# 多言語日本語: ggml-base や ggml-small で OK (Whisper はそもそも多言語モデル)
# 英語専用 .en 版もあり (より小さい)
```

## Usage from HSP

```hsp
#include "iron_speech.hsp"

    iron_speech_set_backend SPEECH_BACKEND_WHISPER
    iron_speech_set_model "C:\\path\\to\\ggml-base.bin"
    iron_speech_set_language "ja"      ; "auto" でも可
    iron_speech_open
    iron_speech_transcribe "voice.wav", text
    mes text
    iron_speech_close
```

## C++ API

```cpp
int  whisper_open(const char* model_path);
int  whisper_transcribe_wav(int handle, const char* wav_path, const char* lang,
                             char* out_text, int out_len);
int  whisper_transcribe_pcm(int handle, const float* pcm_f32, int sample_count,
                             const char* lang, char* out_text, int out_len);
void whisper_close(int handle);
```

## Notes

- WAV loader は 16bit PCM 専用、簡易リサンプル付き (16kHz mono に変換)
- リサンプルは線形補間 (品質を厳密に追求するなら whisper.cpp 付属の
  examples/common.cpp の方が良い)
- GPU 推論は無効化済み (CPU 4 thread)。CUDA/Vulkan 版を使うなら
  cmake オプション + ggml-cuda.lib のリンクを追加してください
- 巨大な third_party/whisper.cpp は .gitignore で除外推奨
