;
; hspduckdb.dll  HSP3 ヘルプ (日本語)
; DuckDB C API プラグイン / iron_duckdb.hsp 糖衣
;

%type
拡張命令
%ver
1.0
%date
2026-04-15
%author
IronHSP / hspduckdb
%dll
hspduckdb.dll

%url
https://duckdb.org
%port
Win32 / Win64

%note
hspduckdb.dll は DuckDB (https://duckdb.org) の C API を embed した
HSP プラグインです。embedded OLAP DB として SQLite 類似の使い勝手で、
CSV / Parquet / JSON / httpfs 拡張を組み込み済み (SQL で直接ファイル
select 可能) という強力な特徴があります。

  #include "hspduckdb.as"
  #include "iron_duckdb.hsp"    ; 糖衣関数 (db_open / db_query / db_fetch_*)

DuckDB amalgamation (duckdb.h / duckdb.cpp) を
  plugins/win32/hspduckdb/third_party/duckdb/
に配置し、vcxproj 側でコメント解除してビルドしてください。
手順は third_party/duckdb/README.md を参照。

amalgamation 未配置でも stub としてビルド可能で、その場合は全命令が
-100 を返します。

特徴:
  - 1 つの DLL で OLAP SQL エンジン (SQLite 相当の手軽さ)
  - SELECT * FROM 'data.csv' / 'data.parquet' が直接動く
  - :memory: DB / file DB 両対応
  - 1M 行 / GB 級データでもインタラクティブに処理可

%index
duckdb_open_db
DB を open してハンドルを返す
%group
hspduckdb — 接続
%prm
"file", var_handle
"file" : ":memory:" で in-memory DB / それ以外はファイル DB

%inst
DuckDB を open して接続ハンドル (var_handle) を得ます。
負数はエラー (-100 は amalgamation 未配置)。

例:
  duckdb_open_db ":memory:", db
  ; iron_duckdb.hsp の糖衣: db_open ":memory:" → db = stat

%index
duckdb_close_db
DB ハンドルを閉じる
%group
hspduckdb — 接続
%prm
handle

%inst
接続とデータベースを解放します。

%index
duckdb_exec
結果を返さない SQL を実行
%group
hspduckdb — クエリ
%prm
handle, "sql", var_rc

%inst
CREATE / INSERT / UPDATE / DELETE など結果セットを参照しない SQL を
実行します。var_rc は 0 (成功) / 負数 (エラー)。

%index
duckdb_query
SELECT を実行して result ハンドルを返す
%group
hspduckdb — クエリ
%prm
handle, "sql", var_result_handle

%inst
SELECT 系 SQL を実行し、結果セットハンドルを取得します。
取得後は duckdb_result_free で解放してください。

%index
duckdb_result_rows
結果の行数を取得
%group
hspduckdb — 結果取得
%prm
rh, var_rows

%index
duckdb_result_cols
結果の列数を取得
%group
hspduckdb — 結果取得
%prm
rh, var_cols

%index
duckdb_result_col_name
列名を取得
%group
hspduckdb — 結果取得
%prm
rh, col, var_str
col : 0-origin

%index
duckdb_result_cell_str
セル値を文字列で取得
%group
hspduckdb — 結果取得
%prm
rh, row, col, var_str
row, col : 0-origin

%inst
DuckDB の any 型を文字列化して返します (NULL は空文字列)。

%index
duckdb_result_cell_dbl
セル値を double で取得
%group
hspduckdb — 結果取得
%prm
rh, row, col, var_dbl

%index
duckdb_result_free
結果ハンドルを解放
%group
hspduckdb — 結果取得
%prm
rh
