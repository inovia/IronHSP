;
; iron_sentiment.hsp  HSP3 ヘルプ (日本語)
; 感情分析
;

%type
拡張命令
%ver
3.8
%date
2026/04/17
%author
IronHSP
%dll
iron_sentiment.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
AI

%index
sentiment_score
感情スコアを取得
%group
AI
%prm
(text)

%inst
テキストの感情スコアを返します。
正の値=ポジティブ、負の値=ネガティブ。

%href
sentiment_label

%index
sentiment_label
感情ラベルを取得
%group
AI
%prm
(text)

%inst
テキストの感情ラベルを返します。
戻り値: "positive" / "negative" / "neutral"
