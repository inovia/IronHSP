;
; iron_ai_tts.hsp  HSP3 ヘルプ (日本語)
; AI 音声合成
;

%type
拡張命令
%ver
3.8
%date
2026/04/18
%author
IronHSP
%dll
iron_ai_tts.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_ai 依存

%group
AI

%index
iron_ai_tts_set_voice
音声設定
%group
AI
%prm
"alloy"

%inst
alloy/echo/fable/onyx/nova/shimmer

%href
iron_ai_tts_set_model

%index
iron_ai_tts_set_model
モデル設定
%group
AI
%prm
"tts-1"

%inst
tts-1 / tts-1-hd

%href
iron_ai_tts

%index
iron_ai_tts
音声生成
%group
AI
%prm
"text", "output.mp3"

%inst
テキストから音声ファイル生成。
