;
; iron_embedding.hsp  HSP3 ヘルプ (日本語)
; テキスト埋め込み (Embedding)
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
iron_embedding.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
AI

%index
embedding_build_vocab
語彙を構築する
%group
AI
%prm
"corpus"

%inst
コーパス文字列から語彙辞書を構築します。
stat に単語数が返ります。

%href
vec_cosine

%index
vec_cosine
コサイン類似度を計算
%group
AI
%prm
(a, b, n)

%inst
2つのベクトル a, b のコサイン類似度を返します。
戻り値: 0.0～1.0
