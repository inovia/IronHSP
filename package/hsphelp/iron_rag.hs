;
; iron_rag.hsp  HSP3 ヘルプ (日本語)
; RAG パイプライン
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
iron_rag.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_ai + iron_ai_embeddings 依存

%group
AI

%index
rag_init
初期化
%group
AI
%prm
max_docs

%inst


%href
rag_add_text

%index
rag_add_text
テキスト追加
%group
AI
%prm
"text", "metadata"

%inst
自動チャンク分割。

%href
rag_add_file

%index
rag_add_file
ファイル追加
%group
AI
%prm
"path"

%inst


%href
rag_build

%index
rag_build
インデックス構築
%group
AI
%prm


%inst
全チャンクの埋め込みベクトル計算。

%href
rag_query

%index
rag_query
質問
%group
AI
%prm
"question", var_answer, top_k

%inst
関連チャンク検索 + LLM 回答。

%href
rag_set_chunk_size

%index
rag_set_chunk_size
チャンクサイズ設定
%group
AI
%prm
chars

%inst
デフォルト 500。

%href
rag_count

%index
rag_count
ドキュメント数
%group
AI
%prm
()

%inst

