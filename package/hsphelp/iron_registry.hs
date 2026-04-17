%dll
; iron_registry レジストリ操作
%ver
3.8
%date
2026/04/17
%author
IronHSP
%note
Win32 API (W版 Unicode)。外部DLL不要。
%type
User command
%group
レジストリ

%index
reg_read
レジストリ値を読み取る
%prm
hkey, "subkey", "name", var_result
hkey : HKEY_CURRENT_USER 等
var_result : 結果を格納する変数
%inst
stat=0 で成功。結果は第4引数 (var) に格納されます。
%sample
	reg_read HKEY_CURRENT_USER, "Environment", "TEMP", result
	if stat == 0 : mes result
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
reg_read

%index
reg_write_dword
DWORD 値を書き込む
%prm
hkey, "subkey", "name", value
%href
reg_write

%index
reg_delete_value
値を削除
%prm
hkey, "subkey", "name"
%href
reg_delete_key

%index
reg_delete_key
キーを削除
%prm
hkey, "subkey"
%href
reg_delete_value

%index
reg_exists
値が存在するか確認
%prm
(hkey, "subkey", "name")
%inst
1=存在, 0=なし
%href
reg_read
