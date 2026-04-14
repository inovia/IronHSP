;
; iron_mcp_client.hsp  HSP3 ヘルプ (日本語)
; Model Context Protocol クライアント (stdio + HTTP)
;

%type
拡張命令
%ver
1.0
%date
2026-04-14
%author
IronHSP / iron_mcp_client
%dll

%url
https://github.com/HNWorks/IronHSP_2026
%port
Win32 / Win64

%note
iron_mcp_client.hsp は Anthropic 製の Model Context Protocol (MCP)
サーバを HSP から叩くクライアントラッパです。

stdio (子プロセス pipe) と HTTP (POST) の両方をサポート:
  - stdio: hspmcp.dll 経由で子プロセスを spawn して JSON-RPC 通信
  - HTTP : iron_http 経由で POST + JSON 応答パース

依存:
  - hspmcp.dll
  - iron_http.hsp + iron_json.hsp (本ファイルで auto include)

  #include "iron_mcp_client.hsp"

注意:
  同時に 1 個までの transport (stdio または HTTP) しか open できない
  内部状態がグローバル設計

%index
iron_mcp_open_stdio
子プロセスとして MCP server を起動
%group
iron_mcp_client — open
%prm
"command", "working_dir"
"command"     : コマンドライン (例 "npx -y @modelcontextprotocol/server-filesystem C:\\")
"working_dir" : 作業ディレクトリ ("" でカレント)

%inst
hspmcp.dll の mcp_proc_open でプロセス spawn → JSON-RPC over stdio で
通信を開始します。

戻り値: 0=成功 / -1=失敗

%href
iron_mcp_open_http
iron_mcp_initialize

%index
iron_mcp_open_http
HTTP transport で MCP server に接続
%group
iron_mcp_client — open
%prm
"url"

%inst
HTTP transport は iron_http の http_post 経由。
リクエスト/レスポンス 1 往復ごとに POST します。

%index
iron_mcp_initialize
MCP handshake (initialize + initialized)
%group
iron_mcp_client
%prm

%inst
JSON-RPC で initialize リクエストを送り、続けて
notifications/initialized を投げます (stdio のみ)。
open_* のあと必ず呼び出してください。

%index
iron_mcp_tools_count
利用可能 tool 数を取得 (defcfunc)
%group
iron_mcp_client — tools
%prm

%inst
defcfunc。初回呼び出し時に tools/list を内部実行してキャッシュします。

%index
iron_mcp_tools_refresh
tool リストを再取得
%group
iron_mcp_client — tools
%prm

%inst
tools/list を強制的に再呼び出し → 内部 JSON キャッシュを更新します。

%index
iron_mcp_tool_name
idx 番目の tool 名を取得
%group
iron_mcp_client — tools
%prm
idx, var

%index
iron_mcp_tool_desc
idx 番目の tool 説明を取得
%group
iron_mcp_client — tools
%prm
idx, var

%index
iron_mcp_call
tool を呼び出す
%group
iron_mcp_client — tools
%prm
"tool_name", "args_json", out_var
"tool_name" : tool 名
"args_json" : arguments を JSON 文字列で渡す (例 "{\"path\":\"C:\\\\\"}")
out_var     : 結果を受け取る var

%inst
JSON-RPC tools/call を発行 → result.content[0].text を out_var に書き込みます。
text が無ければ raw JSON レスポンスを返します。

戻り値: stat = 0 成功 / 負値 失敗

%index
iron_mcp_close
接続を閉じる
%group
iron_mcp_client
%prm

%inst
stdio の場合は子プロセスを終了。HTTP の場合は内部状態をクリア。
