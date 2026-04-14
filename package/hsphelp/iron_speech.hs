;
; iron_speech.hsp  HSP3 ヘルプ (日本語)
; 音声認識統一 API (バックエンド切替対応)
;

%type
拡張命令
%ver
1.0
%date
2026-04-14
%author
IronHSP / iron_speech
%dll

%url
https://github.com/HNWorks/IronHSP_2026
%port
Win32 / Win64

%note
iron_speech.hsp は複数の音声認識バックエンドを統一 API で扱えるラッパです。
スクリプト側でバックエンドを切り替えるだけで cloud / offline を選べます。

バックエンド一覧:
  SPEECH_BACKEND_CLOUD    : iron_ai 経由でクラウド Whisper API
                             (OpenAI, Groq, Cloudflare 等の OpenAI 互換)
  SPEECH_BACKEND_WHISPER  : whisper.cpp (オフライン高品質)  ※未実装
  SPEECH_BACKEND_SAPI     : Windows SAPI 5                  ※未実装
  SPEECH_BACKEND_WINRT    : WinRT Speech                    ※未実装
  SPEECH_BACKEND_VOSK     : Kaldi/Vosk                      ※未実装

現状: CLOUD のみ動作。他は SPEECH_ERR_NOT_IMPL を返すスタブ。
  → 将来的に hspwhisper.dll / hspsapi.dll / hspwinrtspeech.dll /
    hspvosk.dll を追加して切り替え可能になる予定。

ステータスコード:
  SPEECH_OK             0
  SPEECH_ERR_BACKEND   -1   未対応バックエンド
  SPEECH_ERR_NOT_IMPL  -2   未実装
  SPEECH_ERR_NOT_OPEN  -3   open されていない
  SPEECH_ERR_HTTP      -4   HTTP エラー (cloud バックエンド)

  #include "iron_speech.hsp"

%index
iron_speech_set_backend
バックエンドを選択
%group
iron_speech — 設定
%prm
backend_id

%inst
SPEECH_BACKEND_CLOUD / WHISPER / SAPI / WINRT / VOSK のいずれかを指定。

%index
iron_speech_set_endpoint
クラウド endpoint URL を設定
%group
iron_speech — 設定
%prm
"url"

%inst
CLOUD バックエンド時に使用。OpenAI 互換 API のベース URL を指定:
  OpenAI: https://api.openai.com/v1
  Groq:   https://api.groq.com/openai/v1

%index
iron_speech_set_key
クラウド API キーを設定
%group
iron_speech — 設定
%prm
"key"

%index
iron_speech_set_model
モデル名/モデルファイルパスを設定
%group
iron_speech — 設定
%prm
"model"

%inst
CLOUD: "whisper-1" (OpenAI), "whisper-large-v3" (Groq) 等
オフライン: モデルファイルパス (whisper.cpp の GGML model 等)

%index
iron_speech_set_language
言語ヒントを設定
%group
iron_speech — 設定
%prm
"lang"

%inst
"ja", "en" 等の ISO 639-1 言語コード。一部バックエンドで使用。
省略時はバックエンドが自動判別。

%index
iron_speech_open
バックエンドを初期化
%group
iron_speech — メイン
%prm

%inst
選択中のバックエンドを初期化します。
CLOUD: iron_ai に endpoint/key/model を伝えるだけ (no-op に近い)
オフライン: モデルファイル読み込み

戻り値: SPEECH_OK / 各種 ERR

%href
iron_speech_close

%index
iron_speech_transcribe
音声ファイルを文字起こし
%group
iron_speech — メイン
%prm
"audio_path", out_text

%inst
ローカル音声ファイル (wav/mp3/m4a/ogg/webm/flac 等) を文字起こしして
out_text に結果文字列を書き込みます。

戻り値: SPEECH_OK / 各種 ERR

例:
  iron_speech_set_backend SPEECH_BACKEND_CLOUD
  iron_speech_set_endpoint "https://api.groq.com/openai/v1"
  iron_speech_set_key "gsk_..."
  iron_speech_set_model "whisper-large-v3"
  iron_speech_open
  iron_speech_transcribe "voice.wav", text
  mes text
  iron_speech_close

%index
iron_speech_close
バックエンドを解放
%group
iron_speech — メイン
%prm

%index
iron_speech_backend_name
現在のバックエンド名を文字列で取得 (defcfunc)
%group
iron_speech — 情報
%prm

%inst
defcfunc。"cloud" / "whisper.cpp (not impl)" 等を返します。
