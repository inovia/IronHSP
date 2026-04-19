# hspsapi.dll — Windows SAPI 5 speech recognition plugin

Windows 標準の Speech API 5 (SAPI) を使ったオフライン音声認識。
追加 DL 不要 (Windows 本体に付属)。

## API

```
h = hspsapi_open("en-US")                             ; 言語 ISO code、>=0 成功
n = hspsapi_transcribe_wav(h, "audio.wav", var_text, text_max)
    hspsapi_close h
```

## ビルド

```powershell
msbuild hspsapi.vcxproj /p:Configuration=Release /p:Platform=x64
cp Release/hspsapi_64.dll ../../../package/win32/
```

sapi.h は Windows SDK に含まれる。追加 SDK 不要。

## テスト

`package/win32/sample/iron/test_speech_backends.hsp` で close 安全性確認。

## 制限

- 日本語認識には Windows の「言語パック + 音声パック」を追加インストール必要
- SAPI 本体は英語がデフォルト
- iron_speech.hsp の `SPEECH_BACKEND_SAPI` で使える

## 参考

- SAPI 5 docs: https://learn.microsoft.com/en-us/previous-versions/windows/desktop/ms720151(v=vs.85)
