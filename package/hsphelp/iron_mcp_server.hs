;
; iron_mcp_server.hsp  HSP3 ヘルプ (日本語)
; Run HSP3CL as MCP stdio server
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
iron_mcp_server.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_mcp_server.hsp は HSP の関数を Model Context Protocol の "tool"
として公開して、Claude Desktop や VSCode/Cursor 等の MCP 対応クライアント
から呼び出してもらうための server-side ラッパです。

依存:
  - hspmcp.dll (mcp_stdin_read_line / mcp_stdout_write)
  - iron_json.hsp

  #include "iron_mcp_server.hsp"

使い方の流れ:
  1. iron_mcp_server_tool で複数のツールを *handler_label 付きで登録
  2. iron_mcp_server_run でメインループ開始 (stdin EOF まで戻ってこない)
  3. tools/call が来ると handler に gosub される
  4. handler 内で iron_mcp_argp_* で引数取得、iron_mcp_set_result で結果設定

Claude Desktop の claude_desktop_config.json:
  {
    "mcpServers": {
      "ironhsp_demo": {
        "command": "C:\\path\\to\\hsp3cl.exe",
        "args": ["C:\\path\\to\\sample_mcp_server.ax"]
      }
    }
  }

%group
iron_mcp_server (MCPサーバ)

%index
iron_mcp_server_tool
ツールを登録
%group
iron_mcp_server
%prm
"name", "description", *handler_label
"name"        : tool 名 (英数字)
"description" : tool の説明 (Claude が読む)
*handler      : 呼び出されたときに gosub するラベル

%inst
最大 64 個まで登録可能。tool name の一意性は呼び出し側責任。

例:
  iron_mcp_server_tool "say_hello", "Greet a user", *handler_hello

%index
iron_mcp_server_run
メインループ開始
%group
iron_mcp_server
%prm

%inst
stdin から JSON-RPC リクエストを 1 行ずつ読み続けて dispatch:
  initialize → capabilities を返す
  tools/list → 登録済みツール一覧を返す
  tools/call → 該当 handler に gosub
  notifications/initialized → 無応答
  resources/list / prompts/list → 空配列を返す

stdin EOF または Ctrl+C で抜けます。

%index
iron_mcp_argp_str
handler 内で string 引数を取得
%group
iron_mcp_server ― handler
%prm
"key", out_var

%inst
arguments JSON の指定キーから文字列を取り出します。

%index
iron_mcp_argp_int
handler 内で int 引数を取得
%group
iron_mcp_server ― handler
%prm
"key", out_var

%index
iron_mcp_argp_dbl
handler 内で double 引数を取得
%group
iron_mcp_server ― handler
%prm
"key", out_var

%index
iron_mcp_set_result
handler の結果文字列を設定
%group
iron_mcp_server ― handler
%prm
"text"

%inst
handler 完了時、この文字列が JSON-RPC result の content[0].text として
クライアントに返されます。

例:
  *handler_hello
      iron_mcp_argp_str "name", name_arg
      iron_mcp_set_result "Hello, " + name_arg + "!"
      return
