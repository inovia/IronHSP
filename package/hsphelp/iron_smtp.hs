%dll
; iron_smtp SMTPメール送信
%ver
3.8
%date
2026/04/16
%author
IronHSP
%type
ユーザー定義命令
%group
ネットワーク通信

%index
mail_send
メールを送信
%prm
"host", port, "from", "to", "subject", "body" [, "user", "pass"]
%inst
stat=0 で成功。AUTH LOGIN 対応。
%href
mail_error

%index
mail_error
エラーメッセージを取得
%prm
()
%inst
エラー文字列を返す。
