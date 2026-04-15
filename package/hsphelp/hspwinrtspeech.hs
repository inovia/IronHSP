;
; hspwinrtspeech.dll  HSP3 ヘルプ (日本語)
; Windows.Media.SpeechRecognition (WinRT) ライブマイク認識
;

%type
拡張命令
%ver
1.0
%date
2026-04-14
%author
IronHSP / hspwinrtspeech
%dll
hspwinrtspeech_64.dll
%url
https://github.com/inovia/IronHSP
%port
Win64 専用 (C++/WinRT)

%note
hspwinrtspeech.dll は Windows.Media.SpeechRecognition.SpeechRecognizer
(WinRT) を C++/WinRT (header-only) で叩いてマイク入力からの音声認識を
HSP に提供するヘルパ DLL。

重要: WinRT SpeechRecognition は仕様上 microphone-only。
WAV ファイル等の事前録音音声は受け付けません。ファイルから文字起こし
したい場合は SPEECH_BACKEND_WHISPER / SPEECH_BACKEND_VOSK /
SPEECH_BACKEND_SAPI / SPEECH_BACKEND_CLOUD を使ってください。

特徴:
  * Windows 10/11 標準 (cppwinrt header-only)
  * ライブマイクから dictation 認識
  * 多言語: OS の Speech Recognition Language に依存
    (en-US 標準、ja-JP は別途 Speech Pack インストール要)

iron_speech.hsp との連携:
  * SPEECH_BACKEND_WINRT で open
  * iron_speech_listen_once で 1 phrase 取得
  * iron_speech_transcribe (WAV file) は WinRT では未対応 (NOT_IMPL)

%group
hspwinrtspeech (WinRT音声認識)

%index
winrt_speech_open
SpeechRecognizer を open
%group
hspwinrtspeech
%prm
"lang"

%inst
init_apartment(STA) → SpeechRecognizer{ Language(lang) } →
CompileConstraintsAsync (dictation) を実行。

lang : "en-US" / "ja-JP" / "" (システム既定)

戻り値: ハンドル / -1 失敗

%href
winrt_speech_listen_once
winrt_speech_close

%index
winrt_speech_listen_once
マイクから 1 phrase の認識
%group
hspwinrtspeech
%prm
handle, out_text, out_len

%inst
SpeechRecognizer::RecognizeAsync().get() を呼んでマイクからの 1 回の
発話を待ちます。ブロッキング (最大 ~10 秒)。完了後、結果テキストを
out_text に UTF-8 で書き込みます。

戻り値: 書き込んだ byte 数 / -1 失敗 (認識失敗 / マイクエラー / 言語非対応)

%index
winrt_speech_close
SpeechRecognizer を解放
%group
hspwinrtspeech
%prm
handle
