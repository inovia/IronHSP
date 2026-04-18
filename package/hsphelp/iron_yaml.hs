;
; iron_yaml.hsp  HSP3 ヘルプ (日本語)
; YAML (サブセット) パーサ (Pure HSP)
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
iron_yaml.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_yaml.hsp は YAML 1.2 の "よく使う" サブセットを Pure HSP で実装した
軽量パーサです。外部 DLL は不要です。

  #include "iron_yaml.hsp"

TOML と同じく MAP 変数に "parent.child" のフラット形式で格納します。

対応構文:
  - key: value / "quoted key": value
  - ネストマッピング (インデントで親子関係を検出)
  - 行コメント (# で行末まで)
  - true/false / null / yes/no
  - --- document separator

対応外:
  - ブロックスタイル配列 (- item)
  - アンカー & エイリアス
  - 複数行スカラー (| > 表記)

%group
iron_yaml (YAML パーサ)

%index
yaml_parse
YAML 文字列をパース
%prm
var map, "yaml text"
%inst
YAML テキストを map にフラットキー形式で格納します。



%index
yaml_load
YAML ファイルを読み込む
%prm
var map, "file.yaml"
%inst
bload + yaml_parse。



%index
yaml_get
キーに対応する値を取得
%prm
var out, var map, "key.path", "default"



%index
yaml_get_int
整数値として取得
%prm
map, "key.path", default



%index
yaml_get_double
double 値として取得
%prm
map, "key.path", default



%index
yaml_get_bool
bool 値として取得
%prm
map, "key.path", default



%index
yaml_last_error
最後の parse エラー情報を取得
%prm
var msg, var line
