%dll
; iron_registry レジストリ操作
%ver
3.8
%date
2026/04/16
%author
IronHSP
%type
ユーザー定義命令
%group
レジストリ

%index
reg_read
レジストリ値を読み取る
%prm
hkey, "subkey", "name"
%inst
refstr に値。stat=0 で成功。
%href
reg_write

%index
reg_write
文字列値を書き込む
%prm
hkey, "subkey", "name", "value"
%inst
REG_SZ 型。stat=0 で成功。
%href
reg_write_dword

%index
reg_write_dword
DWORD 値を書き込む
%prm
hkey, "subkey", "name", value
%inst
REG_DWORD 型。
%href
reg_delete_value

%index
reg_delete_value
値を削除
%prm
hkey, "subkey", "name"
%inst

%href
reg_delete_key

%index
reg_delete_key
キーを削除
%prm
hkey, "subkey"
%inst

%href
reg_exists

%index
reg_exists
値が存在するか確認
%prm
(hkey, "subkey", "name")
%inst
存在すれば 1、なければ 0。
