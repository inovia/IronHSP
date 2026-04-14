# hspvosk.dll

Offline speech-to-text helper DLL for IronHSP, wrapping
[Vosk](https://github.com/alphacep/vosk-api) (Kaldi ベース).

## Status

- **Platform**: x64 only (Vosk が prebuilt x64 のみ提供)
- **Output**: `Release/hspvosk_64.dll`
- **HSP wrapper**: `package/win32/common/iron_speech.hsp` の `SPEECH_BACKEND_VOSK`

## Setup (one-time)

### 1. Vosk バイナリ DL

```bash
cd plugins/win32/hspvosk/third_party
curl -L -o vosk-win64.zip \
  https://github.com/alphacep/vosk-api/releases/download/v0.3.45/vosk-win64-0.3.45.zip
unzip vosk-win64.zip
```

展開後の構成:
```
third_party/vosk-win64-0.3.45/
  libvosk.dll       (~17 MB)
  libvosk.lib
  libgcc_s_seh-1.dll
  libstdc++-6.dll
  libwinpthread-1.dll
  vosk_api.h
```

### 2. ビルド

```bash
msbuild hspvosk.vcxproj /p:Configuration=Release /p:Platform=x64
```

### 3. ランタイム配置

`hspvosk_64.dll` と `libvosk.dll` (および 3 つの runtime DLL) を
HSP 実行ファイルと同じディレクトリに置く必要があります:
- libvosk.dll
- libgcc_s_seh-1.dll
- libstdc++-6.dll
- libwinpthread-1.dll

## Model download

Vosk model はディレクトリ単位 (フォルダごと):

```bash
# 日本語 small (~47 MB)
curl -L -o vosk-model-small-ja-0.22.zip \
  https://alphacephei.com/vosk/models/vosk-model-small-ja-0.22.zip
unzip vosk-model-small-ja-0.22.zip

# 英語 small (~40 MB)
curl -L -o vosk-model-small-en-us-0.15.zip \
  https://alphacephei.com/vosk/models/vosk-model-small-en-us-0.15.zip
```

その他のモデル一覧: https://alphacephei.com/vosk/models

## Usage from HSP

```hsp
#include "iron_speech.hsp"

    iron_speech_set_backend SPEECH_BACKEND_VOSK
    iron_speech_set_model "vosk-model-small-ja-0.22"   ; モデルディレクトリ
    iron_speech_open
    iron_speech_transcribe "voice.wav", text
    mes text
    iron_speech_close
```

## C++ API

```cpp
int  hvosk_open(const char* model_path, int sample_rate);
int  hvosk_transcribe_wav(int handle, const char* wav_path, char* out_text, int out_len);
int  hvosk_transcribe_pcm_s16(int handle, const short* pcm, int sample_count, char* out_text, int out_len);
void hvosk_close(int handle);
```

## Notes

- Vosk は 16kHz mono 16bit を前提 (内部で sample_rate を Recognizer に渡す)
- 関数名 `hvosk_*` は libvosk の `vosk_*` シンボルとの混同を避けるための prefix
- 結果 JSON から "text" フィールドを正規表現抜きで簡易抽出
- partial result (連続認識) は将来追加予定
