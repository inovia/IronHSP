;
; hspvosk.dll  HSP3 ヘルプ (日本語)
; Vosk (Kaldi) ベース オフライン音声認識
;

%type
拡張命令
%ver
1.0
%date
2026-04-14
%author
IronHSP / hspvosk
%dll
hspvosk_64.dll
%url
https://github.com/inovia/IronHSP
%port
Win64 専用 (Vosk prebuilt が x64 のみ)

%note
hspvosk.dll は Vosk (alphacephei/vosk-api, Kaldi ベース) の prebuilt
libvosk.dll を HSP からラップしたオフライン音声認識プラグイン。

特徴:
  * オフライン (ネットワーク不要)
  * 軽量 (small model 47 MB ～)
  * 多言語対応 (日本語/英語/中国語/フランス語/ロシア語等 24 言語以上)
  * 連続認識 (partial result) も内部 API は対応 (HSP wrapper は final のみ)

依存:
  third_party/vosk-win64-0.3.45/libvosk.dll, libvosk.lib, vosk_api.h
  Vosk model directory (別途 DL)

ランタイム配置:
  hspvosk_64.dll 以外に、libvosk.dll + libgcc_s_seh-1.dll +
  libstdc++-6.dll + libwinpthread-1.dll を実行ファイル横に置く必要あり

HSP からは package/win32/common/iron_speech.hsp を SPEECH_BACKEND_VOSK
で使うのが推奨です。

%group
hspvosk (Vosk音声認識)

%index
hvosk_open
モデルを読み込んでハンドル取得
%group
hspvosk
%prm
"model_path", sample_rate

%inst
Vosk model ディレクトリを読み込んで Recognizer を生成します。
sample_rate は推論時の入力サンプルレート (通常 16000)。

戻り値: ハンドル / -1 失敗

%href
hvosk_transcribe_wav
hvosk_close

%index
hvosk_transcribe_wav
WAV ファイルを文字起こし
%group
hspvosk
%prm
handle, "wav_path", out_text, out_len

%inst
WAV (16bit PCM) を 16kHz mono にリサンプル → Vosk Recognizer →
JSON 結果から "text" 抽出 → out_text に書き込み。

%index
hvosk_transcribe_pcm_s16
生 16bit PCM を文字起こし
%group
hspvosk
%prm
handle, pcm_var, sample_count, out_text, out_len

%inst
16bit signed PCM 配列を直接渡して文字起こし。

%index
hvosk_close
ハンドルを解放
%group
hspvosk
%prm
handle
