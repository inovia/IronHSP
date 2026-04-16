;
; iron_taskdialog.hsp  HSP3 ヘルプ (日本語)
; Vista+ タスクダイアログ
;

%type
拡張命令
%ver
3.8
%date
2026/04/18
%author
IronHSP (原作: inovia)
%dll
iron_taskdialog.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
comctl32.dll (OS 標準)。Vista 以降。

%group
ダイアログ

%index
taskdlg_init
初期化
%group
ダイアログ
%prm


%inst
内部状態を初期化します。通常は自動呼び出しされるため明示的に呼ぶ必要はありません。

%href
taskdlg

%index
taskdlg
タスクダイアログ表示
%group
ダイアログ
%prm
"title", "main", "content", "footer", "choices", mainico, footico

%inst
フル機能のタスクダイアログを表示します。
choices は改行区切りの選択肢文字列です。
stat に選択 ID (101～=選択肢 / 2=キャンセル) が返ります。
mainico/footico: 0=なし / 1=警告 / 2=エラー / 3=情報 / 4=シールド

%href
taskdlg_simple

%index
taskdlg_simple
簡易ダイアログ
%group
ダイアログ
%prm
"title", "main", buttons

%inst
選択肢なしの簡易版です。buttons に TDBTN_OK|TDBTN_YES 等を指定します。
stat に IDOK(1)/IDYES(6)/IDNO(7) 等が返ります。

%href
taskdlg_set_flags

%index
taskdlg_set_flags
フラグ設定
%group
ダイアログ
%prm
flags

%inst
dwFlags を設定します。TDF_* 定数の組み合わせ。

%href
taskdlg_set_width

%index
taskdlg_set_width
ダイアログ幅設定
%group
ダイアログ
%prm
px

%inst
ダイアログの幅をピクセルで指定します (0=自動)。

%href
taskdlg_set_buttons

%index
taskdlg_set_buttons
共通ボタン設定
%group
ダイアログ
%prm
btns

%inst
dwCommonButtons を設定します。TDBTN_* 定数の組み合わせ。

%href
taskdlg_set_default_id

%index
taskdlg_set_default_id
デフォルトボタン設定
%group
ダイアログ
%prm
id

%inst
デフォルトで選択されるボタンの ID を設定します。
