;
; iron_ini.hsp  HSP3 ヘルプ (日本語)
; INI 設定ファイル簡易ラッパ
;

%type
拡張命令
%ver
1.0
%date
2026-04-13
%author
IronHSP / iron_ini
%dll

%url
https://github.com/HNWorks/IronHSP_2026
%port
Win32 / Win64

%note
iron_ini.hsp は Win32 GetPrivateProfile* / WritePrivateProfile* API を
HSP から手軽に使えるようにする薄いラッパです。

  #include "iron_ini.hsp"

特徴:
  - 1 行で読み書き
  - SJIS ベース (HSP 標準) なのでエンコーディング変換不要
  - INI ファイルパスは相対 / 絶対どちらも可
  - 既定値付き取得もサポート

注意: 必ず最初に ini_setpath で対象 INI ファイルを指定してください。

%index
ini_setpath
カレント INI ファイルを設定
%group
iron_ini
%prm
"path"

%inst
以降の ini_get/set 系命令が対象とする INI ファイルを設定します。
相対パスの場合はカレントディレクトリ基準で WritePrivateProfileString
が解決します。

%index
ini_get
文字列値を取得
%group
iron_ini — 取得
%prm
"section", "key", "default"

%inst
refstr に値を返します。キーが無ければ default を返します。

例:
  ini_get "Window", "Title", "untitled" : title = refstr

%index
ini_geti
整数値を取得
%group
iron_ini — 取得
%prm
"section", "key", default_int

%inst
stat に値を返します。

例:
  ini_geti "Window", "Width", 800 : w = stat

%index
ini_getd
double 値を取得
%group
iron_ini — 取得
%prm
"section", "key", default_double

%inst
refdval に値を返します。

%index
ini_set
文字列値を書き込む
%group
iron_ini — 書き込み
%prm
"section", "key", "value"

%index
ini_seti
整数値を書き込む
%group
iron_ini — 書き込み
%prm
"section", "key", value_int

%index
ini_setd
double 値を書き込む
%group
iron_ini — 書き込み
%prm
"section", "key", value_double

%index
ini_delete_key
キーを削除
%group
iron_ini — 削除
%prm
"section", "key"

%index
ini_delete_section
セクション全体を削除
%group
iron_ini — 削除
%prm
"section"

%index
ini_section_keys
セクション内のキー一覧を取得
%group
iron_ini — 列挙
%prm
"section", out_array

%index
ini_section_names
ファイル内の全セクション名を取得
%group
iron_ini — 列挙
%prm
out_array
