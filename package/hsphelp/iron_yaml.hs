;
; iron_yaml.hsp  HSP3 ヘルプ (日本語)
; YAML パーサー
;

%type
拡張命令
%ver
3.8
%date
2026/04/17
%author
IronHSP
%dll
iron_yaml.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
データ

%index
yaml_load
YAML テキストを解析
%group
データ
%prm
"text"

%inst
YAML テキストを解析します。
stat にエントリ数が返ります。

%href
yaml_get

%index
yaml_get
キーで値を取得
%group
データ
%prm
("key")

%inst
指定キーに対応する値を文字列で返します。

%href
yaml_count

%index
yaml_count
エントリ数を取得
%group
データ
%prm
()

%inst
読み込んだエントリの数を返します。
