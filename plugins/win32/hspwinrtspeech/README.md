# hspwinrtspeech.dll — Windows.Media.SpeechRecognition plugin

WinRT の SpeechRecognition API (Windows 10+) を使ったマイク入力音声認識。
cppwinrt ベース。

## API

```
h = hspwinrt_speech_open("ja-JP")                     ; 言語 tag、>=0 成功
n = hspwinrt_speech_listen_once(h, var_text, text_max)  ; 1 フレーズ認識
    hspwinrt_speech_close h
```

## ビルド

```powershell
msbuild hspwinrtspeech.vcxproj /p:Configuration=Release /p:Platform=x64
cp Release/hspwinrtspeech_64.dll ../../../package/win32/
```

## 制限

- **マイク入力専用**: WAV ファイルの認識は不可 (WinRT API の制限)
- Windows 10/11 標準の「音声認識を許可」プライバシー設定が ON である必要
- iron_speech.hsp の `SPEECH_BACKEND_WINRT` で使える

## 参考

- Windows.Media.SpeechRecognition: https://learn.microsoft.com/en-us/uwp/api/windows.media.speechrecognition
