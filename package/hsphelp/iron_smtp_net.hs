%dll
; iron_smtp_net .NET SMTP
%ver
3.8
%date
2026/04/16
%author
IronHSP
%note
hsp3net 専用。System.Net.Mail.SmtpClient 使用。TLS/SSL 自動対応。
%type
ユーザー定義命令
%group
ネットワーク (.NET)

%index
netmail_send
.NETでSMTPメール送信 (TLS対応)
%prm
"host", port, "from", "to", "subject", "body" [, "user", "pass"]
%inst
stat=0 で成功。SmtpClient.EnableSsl=true で TLS 自動対応。
%sample
	netmail_send "smtp.gmail.com", 587, "from@gmail.com", "to@example.com", "Test", "Hello!", "user", "apppass"
%href
mail_send
