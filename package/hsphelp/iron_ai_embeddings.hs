;
; iron_ai_embeddings.hsp  HSP3 ヘルプ (日本語)
; AI 埋め込みベクトル
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
iron_ai_embeddings.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_ai + iron_json 依存

%group
AI

%index
iron_ai_emb_set_model
モデル設定
%group
AI
%prm
"text-embedding-3-small"

%inst


%href
iron_ai_embed

%index
iron_ai_embed
埋め込み取得
%group
AI
%prm
"text", var_vector, var_dim

%inst


%href
iron_ai_embed_batch

%index
iron_ai_embed_batch
バッチ埋め込み
%group
AI
%prm
texts, n, var_vectors, var_dim

%inst


%href
iron_ai_emb_cosine

%index
iron_ai_emb_cosine
コサイン類似度
%group
AI
%prm
(a, b, dim)

%inst

