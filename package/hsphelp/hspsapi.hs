;
; hspsapi.dll  HSP3 ヘルプ (日本語)
; Windows SAPI 5 オフライン音声認識
;

%type
拡張命令
%ver
1.0
%date
2026-04-14
%author
IronHSP / hspsapi
%dll
hspsapi_64.dll
%url
https://github.com/HNWorks/IronHSP_2026
%port
Win32 / Win64

%note
hspsapi.dll は Windows 標準の SAPI 5 (sapi.dll) を ISpRecognizer +
ISpRecoContext + ISpRecoGrammar の COM 階層で叩いて、HSP から
オフライン音声認識をできるようにする helper DLL です。

特徴:
  * Windows 標準、追加 DL 不要 (sapi.dll は OS 同梱)
  * ディクテーションモード (連続音声認識)
  * 多言語: OS の Speech Recognition Language に依存

注意:
  * 認識品質は whisper.cpp / Vosk より低い (英語専用想定)
  * 日本語認識は Windows 設定 → 言語 → 音声認識 で日本語パックの
    インストールが必要 (デフォルトでは入っていない)
  * ライブマイク入力は未実装 (WAV ファイルからの認識のみ)
  * SpInprocRecognizer + SPBindToFile + SPRS_ACTIVE のフロー

HSP からは package/win32/common/iron_speech.hsp を SPEECH_BACKEND_SAPI
で使うのが推奨です。

%index
sapi_open
SAPI 認識エンジンを開く
%group
hspsapi
%prm
"lang"

%inst
ISpRecognizer (CLSID_SpInprocRecognizer) を CoCreateInstance で
生成し、SPBindToFile / RecoContext / Dictation Grammar を準備します。

lang : "en-US" / "ja-JP" / "" (システム既定)
       SpFindBestToken で対応する Recognition Engine token を選ぶ。

戻り値: ハンドル / -1 失敗

%href
sapi_transcribe_wav
sapi_close

%index
sapi_transcribe_wav
WAV ファイルを文字起こし
%group
hspsapi
%prm
handle, "wav_path", out_text, out_len

%inst
SPBindToFile で WAV を ISpStream として開いて recognizer の入力に
セット → SetRecoState(SPRST_ACTIVE) → 認識完了まで GetEvents で
イベントループ → SPEI_RECOGNITION で ISpRecoResult::GetText を取得 →
全 phrase を空白区切りで連結して out_text に返します。

最大 ~10 分でタイムアウト。

戻り値: 書き込んだ byte 数 / -1 失敗

%index
sapi_close
ハンドルを解放
%group
hspsapi
%prm
handle
