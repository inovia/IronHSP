%dll
; iron_registry_net .NETレジストリ
%ver
3.8
%date
2026/04/16
%author
IronHSP
%note
hsp3net 専用。Microsoft.Win32.Registry 使用。
%type
ユーザー定義命令
%group
レジストリ (.NET)

%index
netreg_read
.NETでレジストリ値を読む
%prm
"subkey", "name"
%inst
refstr に値。HKEY_CURRENT_USER がデフォルト。
%href
netreg_write

%index
netreg_write
.NETでレジストリ値を書く
%prm
"subkey", "name", "value"
%href
netreg_read

%index
netreg_exists
.NETでレジストリ値の存在確認
%prm
("subkey", "name")
%inst
1/0 を返す。
%href
netreg_read
