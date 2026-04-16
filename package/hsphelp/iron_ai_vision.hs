;
; iron_ai_vision.hsp  HSP3 ヘルプ (日本語)
; AI 画像認識
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
iron_ai_vision.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_ai + iron_hash 依存

%group
AI

%index
iron_ai_vision_file
ファイルから画像送信
%group
AI
%prm
"image.png", "prompt", var_reply

%inst
Base64 エンコードして送信。

%href
iron_ai_vision_base64

%index
iron_ai_vision_base64
Base64 画像送信
%group
AI
%prm
base64_str, "prompt", var_reply

%inst


%href
iron_ai_vision_url

%index
iron_ai_vision_url
URL 画像送信
%group
AI
%prm
"url", "prompt", var_reply

%inst

