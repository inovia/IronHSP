;
; hspwhisper.dll  HSP3 ヘルプ (日本語)
; whisper.cpp ベース オフライン音声認識
;

%type
拡張命令
%ver
1.0
%date
2026-04-14
%author
IronHSP / hspwhisper
%dll
hspwhisper_64.dll
%url
https://github.com/inovia/IronHSP
%port
Win64 専用 (whisper.cpp の SIMD 依存)

%note
hspwhisper.dll は OpenAI Whisper の高速 C++ 移植版 whisper.cpp
(ggerganov 製) を HSP からラップしたオフライン音声認識プラグイン。

特徴:
  * オフライン (ネットワーク不要、API キー不要)
  * 多言語対応 (日本語含む 99 言語)
  * GGML 量子化モデル (tiny 75MB / base 140MB / small 470MB / medium 1.5GB / large 3GB)
  * CPU 推論 (4 thread デフォルト)

依存:
  third_party/whisper.cpp の cmake build 済 whisper.lib + ggml*.lib
  GGML model file (別途 DL)

HSP からは package/win32/common/iron_speech.hsp を SPEECH_BACKEND_WHISPER
で使うのが推奨です。生 API は本ヘルプ参照。

ビルド + モデル DL の手順:
  plugins/win32/hspwhisper/README.md 参照

%group
hspwhisper (whisper.cpp音声認識)

%index
whisper_open
モデルファイルを読み込んでハンドル取得
%group
hspwhisper
%prm
"model_path"

%inst
GGML フォーマットの whisper モデルファイル (例 ggml-base.bin) を
読み込んで context を生成します。

戻り値: ハンドル (>=0) / -1 失敗

%href
whisper_transcribe_wav
whisper_close

%index
whisper_transcribe_wav
WAV ファイルを文字起こし
%group
hspwhisper
%prm
handle, "wav_path", "lang", out_text, text_len
handle    : ハンドル
"wav_path": 16bit PCM WAV ファイルパス (16kHz mono が推奨、それ以外は
            内部で線形補間リサンプル + ダウンミックス)
"lang"    : 言語コード "ja", "en", "auto", ""
out_text  : 結果を書き込む文字列変数 (sdim 65536 推奨)
text_len  : バッファサイズ

%inst
WAV を 16kHz mono float32 に変換 → whisper_full で推論 →
全 segment テキストを連結して out_text に書き込みます。

戻り値: 書き込み byte 数 (>=0) / -1 失敗

%index
whisper_transcribe_pcm
生 float32 PCM を文字起こし
%group
hspwhisper
%prm
handle, pcm_var, sample_count, "lang", out_text, text_len

%inst
16kHz mono float32 PCM 配列を直接渡して文字起こし。
WAV loader を経由しないので、自前でリサンプル済みの音声 (例えば
mfcam_audio_read_pcm の生 PCM) をそのまま渡せます。

%index
whisper_close
ハンドルを解放
%group
hspwhisper
%prm
handle

%inst
whisper context を whisper_free で解放します。
