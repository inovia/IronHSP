;
; iron_ai.hsp  HSP3 ヘルプ (日本語)
; OpenAI 互換 Chat API クライアント
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
iron_ai.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_ai.hsp は OpenAI 互換の /chat/completions エンドポイントを 1 行で
叩ける純 HSP3 クライアントです。

対応サーバ:
  OpenAI    (api.openai.com)
  Anthropic (api.anthropic.com)
  Ollama    (localhost:11434)
  LM Studio (localhost:1234)
  llama.cpp (localhost:8080)
  GitHub Models / Groq / DeepSeek / xAI 等

依存: iron_http.hsp + iron_json.hsp (本ファイルで auto include)
注意: HTTPS は WinHTTP のシステム証明書ストアを使用。
ストリーミングは未対応 (将来 Phase 2)。

  #include "iron_ai.hsp"

%group
iron_ai (AIチャット)

%index
iron_ai_set_endpoint
エンドポイント URL を設定
%group
iron_ai ― 設定
%prm
"url"

%inst
"https://api.openai.com/v1" 等のベース URL を設定。
末尾に /chat/completions を内部で付加します。

%index
iron_ai_set_key
API キー (Authorization: Bearer) を設定
%group
iron_ai ― 設定
%prm
"key"

%inst
ローカル LLM (Ollama 等) の場合は空文字 "" で OK。
OpenAI/Anthropic 等は "sk-..." を渡します。

%index
iron_ai_set_model
モデル名を設定
%group
iron_ai ― 設定
%prm
"model"

%inst
"gpt-4o-mini", "claude-3-5-sonnet-20241022", "llama3.2" 等。

%index
iron_ai_set_system
システムプロンプトを設定
%group
iron_ai ― 設定
%prm
"system_prompt"

%inst
"あなたは親切な日本語アシスタントです" 等。
chat 呼び出し時に messages 配列の先頭に system role として挿入されます。

%index
iron_ai_set_max_tokens
最大トークン数を設定
%group
iron_ai ― 設定
%prm
n
n : max_tokens (0 でサーバデフォルト)

%index
iron_ai_set_temperature
温度パラメータを設定 (x100 整数)
%group
iron_ai ― 設定
%prm
t_x100
t_x100 : 温度 × 100 (例 70 = 0.7 / -1 でデフォルト)

%inst
HSP は double 引数より int の方が安定するため x100 表現にしてあります。

%index
iron_ai_chat
ユーザーメッセージを送信して応答を取得
%group
iron_ai ― チャット
%prm
"msg", reply
"msg" : ユーザーメッセージ
reply : 応答を受け取る var

%inst
chat completion を呼び出して assistant の応答を reply に書き込みます。
完了後、user/assistant の両方を内部 history に自動追加します
(multi-turn 用)。

戻り値: stat = HTTP status (200 = 成功)

例:
  iron_ai_chat "HSP3 とは?", reply
  if stat = 200 : mes reply

%href
iron_ai_history_clear
iron_ai_history_add

%index
iron_ai_history_clear
会話履歴をクリア
%group
iron_ai ― 履歴
%prm

%inst
内部 history JSON をクリアします。新しい会話を始める前に呼び出します。

%index
iron_ai_history_add
会話履歴に手動でエントリ追加
%group
iron_ai ― 履歴
%prm
"role", "content"
"role"    : "user" / "assistant" / "system" / "tool"
"content" : 内容

%inst
過去の会話を復元したい場合等に使用。chat 呼び出しは自動で
history に追加するので、通常は使う必要はありません。
