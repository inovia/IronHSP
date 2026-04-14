;
; hspmcp.dll  HSP3 ヘルプ (日本語)
; プロセス pipe + stdin/stdout helper (Model Context Protocol 用)
;

%type
拡張命令
%ver
1.0
%date
2026-04-14
%author
IronHSP / hspmcp
%dll
hspmcp.dll
%url
https://github.com/HNWorks/IronHSP_2026
%port
Win32 / Win64

%note
hspmcp.dll は HSP からは扱いづらい以下の処理を C++ で隠蔽します:
  * CreateProcess + 匿名 pipe で子プロセスを spawn
  * 子プロセス stdin/stdout を行単位で読み書き
  * バックグラウンド reader thread + 内部 line buffer
  * 自プロセスの stdin/stdout (HSP3CL を MCP server として動かすとき)

主に Anthropic Model Context Protocol (MCP) の stdio transport
実装に使うために作りましたが、汎用の "process pipe wrapper" として
他の用途にも使えます (子プロセス起動 + パイプ通信が必要な任意の場面)。

HSP からは package/win32/common/iron_mcp_client.hsp と
iron_mcp_server.hsp を include して使うのが推奨です。

%index
mcp_proc_open
子プロセスを起動して pipe を確立
%group
hspmcp — process spawn
%prm
"command", "working_dir"
"command"     : コマンドラインまたは実行ファイルパス + 引数
"working_dir" : 作業ディレクトリ ("" でカレント)

%inst
"command" のコマンドラインで子プロセスを起動して、stdin/stdout を
匿名 pipe で接続します。バックグラウンド reader thread が子プロセス
stdout を読み続けて行 buffer に溜めるので、HSP 側からは
mcp_proc_recv_line で 1 行ずつ取り出せます。

戻り値: ハンドル (>=0) / -1 失敗

CreateProcess の dwCreationFlags には CREATE_NO_WINDOW を指定して
あるので、子プロセスのコンソールウィンドウは表示されません。

最大 64 プロセスまで並列で開けます。

%href
mcp_proc_send
mcp_proc_recv_line
mcp_proc_close

%index
mcp_proc_send
子プロセス stdin にデータを書き込む
%group
hspmcp — process spawn
%prm
hid, "data", len
hid    : mcp_proc_open で取得したハンドル
"data" : 書き込むバイト列
len    : バイト数 (0 で strlen)

%inst
子プロセスの stdin に data を書き込みます。改行は自動付与されません
ので JSON-RPC over stdio 等で行区切りが必要な場合は呼び出し側で
"\n" を付けてください。

戻り値: 実際に書き込んだバイト数 / 0 失敗

%index
mcp_proc_recv_line
子プロセス stdout から 1 行取得
%group
hspmcp — process spawn
%prm
hid, var, buflen
hid    : ハンドル
var    : 結果を格納する文字列変数 (sdim 済)
buflen : 変数のバッファサイズ

%inst
子プロセスの stdout から改行 (\n) で区切られた 1 行を取り出します。
バックグラウンド reader thread が常時 ReadFile を回しているので、
本命令はノンブロッキングで、buffer に未到達の場合はすぐ 0 を返します。

戻り値:
  >0 : 読めたバイト数 (改行は含まない)
   0 : まだ buffer に行が無い (await でリトライ可)
  -1 : ハンドル無効

%href
mcp_proc_send

%index
mcp_proc_alive
子プロセスが生きているか判定
%group
hspmcp — process spawn
%prm
hid

%inst
GetExitCodeProcess で STILL_ACTIVE かどうかを判定します。

戻り値: 1 = 動作中 / 0 = 終了

%index
mcp_proc_close
子プロセスを終了して pipe を閉じる
%group
hspmcp — process spawn
%prm
hid

%inst
reader thread を停止 → stdin pipe を close → 必要なら TerminateProcess
→ ハンドルを全部 close。HSP プログラム終了時には DllMain で全 active
ハンドルを自動 close するので明示呼び出しは省略しても OK。

%index
mcp_stdin_read_line
自プロセスの stdin から 1 行取得 (server 用)
%group
hspmcp — server side stdin/stdout
%prm
var, buflen
var    : 結果を格納する文字列変数
buflen : バッファサイズ

%inst
自プロセス (HSP3CL) の stdin から改行区切りで 1 行読み取ります。
HSP3CL を MCP server として動かす際、親プロセス (Claude Desktop 等)
から JSON-RPC リクエストを受け取るために使います。

ブロッキング読み: stdin に入力が来るまで戻ってきません。

戻り値:
  >=0 : 読めたバイト数
   -1 : EOF または error

%href
mcp_stdout_write

%index
mcp_stdout_write
自プロセスの stdout に書き込む (server 用)
%group
hspmcp — server side stdin/stdout
%prm
"data", len
"data" : 書き込むバイト列
len    : バイト数 (0 で strlen)

%inst
自プロセスの stdout にデータを書き込んで FlushFileBuffers を呼びます。
HSP3CL を MCP server として動かす際、親プロセスへ JSON-RPC レスポンスを
返すために使います。

mcp_stdin_read_line と組み合わせて行単位の双方向通信を実現します。

戻り値: 実際に書き込んだバイト数

%href
mcp_stdin_read_line
