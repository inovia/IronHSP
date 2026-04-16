;
; iron_ai_tools.hsp  HSP3 ヘルプ (日本語)
; AI Function Calling
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
iron_ai_tools.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_ai 依存

%group
AI

%index
iron_ai_tool_add
ツール登録
%group
AI
%prm
"name", "desc", "params_json"

%inst


%href
iron_ai_tool_clear

%index
iron_ai_tool_clear
ツール全消去
%group
AI
%prm


%inst


%href
iron_ai_chat_tools

%index
iron_ai_chat_tools
ツール付きチャット
%group
AI
%prm
msg, var_reply, var_tool_calls

%inst
stat=1 ツール要求, stat=0 通常

%href
iron_ai_tool_result

%index
iron_ai_tool_result
ツール結果送信
%group
AI
%prm
"tool_call_id", "result"

%inst


%href
iron_ai_chat_tools_continue

%index
iron_ai_chat_tools_continue
続行
%group
AI
%prm
var_reply, var_tool_calls

%inst

