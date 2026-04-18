;
; iron_toml.hsp  HSP3 ヘルプ (日本語)
; TOML v1.0 パーサ / ライタ (Pure HSP)
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
iron_toml.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_toml.hsp は TOML (Tom's Obvious Minimal Language) v1.0 のサブセットを
Pure HSP で実装したパーサです。外部 DLL は不要です。

  #include "iron_toml.hsp"

値は全て文字列として MAP 変数に格納され、"section.key" のフラット形式で
アクセスします。数値 / bool は toml_get_int / toml_get_bool などのヘルパで
取得してください。

対応構文:
  - key = value / "quoted key" = value
  - 値型: string / integer / float / boolean / datetime (文字列保持)
  - [section.name]
  - # 行コメント
  - インラインテーブル (1 階層まで)

対応外: 複数行文字列 / 配列テーブル [[name]]

%group
iron_toml (TOML パーサ)

%index
toml_parse
TOML 文字列をパース
%prm
var map, "toml text"
map : MAP 変数 (dimmap で確保、関数内で再初期化される)
%inst
TOML テキストを map に "section.key" → value の形式で格納します。
エラー時は stat が負で戻り、toml_last_error で詳細取得可能。



%index
toml_load
TOML ファイルを読み込む
%prm
var map, "file.toml"
%inst
bload でファイルを読み、toml_parse と同じ結果を map に格納します。



%index
toml_get
キーに対応する値を取得
%prm
var out, var map, "section.key", "default"
%inst
キーが存在すれば out に値を代入、存在しなければ default を代入します。



%index
toml_get_int
整数値として取得
%prm
map, "section.key", default
%inst
MAP から int に変換して返します。未登録時は default。



%index
toml_get_double
double 値として取得
%prm
map, "section.key", default
%inst
MAP から double に変換して返します。



%index
toml_get_bool
bool 値として取得
%prm
map, "section.key", default
%inst
MAP から bool (1 or 0) に変換して返します。"true"/"1" → 1、それ以外 → 0。



%index
toml_last_error
最後の parse エラー情報を取得
%prm
var msg, var line
%inst
toml_parse の最後のエラーメッセージと行番号を取得します。
