;
; iron_db.hsp  HSP3 ヘルプ (日本語)
; SQLite データベース操作 (hspdb.dll wrapper)
;

%type
拡張命令
%ver
1.0
%date
2026-04-15
%author
IronHSP / iron_db
%dll
hspdb.dll

%url
https://github.com/HNWorks/IronHSP_2026
%port
Win32 / Win64

%note
iron_db.hsp は hspdb.dll (SQLite 3.46 amalgamation 埋め込み) を
HSP から扱いやすくしたラッパモジュールです。組み込みデータベースを
1 行 API で利用できます。

  #include "iron_db.hsp"

典型的な使い方:
  h = db_open("test.db")
  db_exec h, "CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, name TEXT, age INTEGER)"
  db_exec h, "INSERT INTO users (name, age) VALUES ('Alice', 30)"
  qh = db_query(h, "SELECT name, age FROM users WHERE age > 20")
  repeat
      db_step qh
      if stat = 0 : break
      db_col_text qh, 0, name
      age = db_col_int(qh, 1)
      mes name + " (" + age + ")"
  loop
  db_query_close qh
  db_close h

%index
db_open
データベースを開く
%group
iron_db — 接続
%prm
"path"
"path" : SQLite DB ファイルパス (存在しなければ作成)

%inst
SQLite データベースファイルを開き、DB ハンドルを返します (関数)。
":memory:" を渡すとメモリ上の一時 DB になります。

例:
  h = db_open("test.db")

%href
db_close

%index
db_close
データベースを閉じる
%group
iron_db — 接続
%prm
h
h : db_open で得た DB ハンドル

%inst
DB 接続を閉じます。開いたままの query ハンドルがある場合は事前に
db_query_close で閉じてください。

%href
db_open

%index
db_exec
SQL を 1 文実行 (結果セット不要)
%group
iron_db — 実行
%prm
h, "sql"
h     : DB ハンドル
"sql" : CREATE / INSERT / UPDATE / DELETE など

%inst
結果セットを返さない SQL 文を実行する関数です。戻り値は 0 で成功、
非 0 で SQLite エラーコード。SELECT には db_query を使います。

例:
  db_exec h, "INSERT INTO users VALUES (NULL, 'Bob', 25)"

%index
db_query
SELECT 文を prepare + 実行
%group
iron_db — クエリ
%prm
h, "sql"
h     : DB ハンドル
"sql" : SELECT 文

%inst
SQL を prepare して query ハンドルを返す関数です。返されたハンドルは
db_step でフェッチし、使い終わったら db_query_close で解放します。

例:
  qh = db_query(h, "SELECT name, age FROM users")

%href
db_step
db_query_close

%index
db_step
次の行をフェッチ
%group
iron_db — クエリ
%prm
qh
qh : db_query の戻り値 (query ハンドル)

%inst
次の行を取り出します。stat に 1 (行あり) / 0 (終端) / 負値 (エラー) が
返ります。行データは db_col_text / db_col_int / db_col_dbl で取得します。

%href
db_query
db_col_text
db_col_int

%index
db_query_close
query ハンドルを閉じる
%group
iron_db — クエリ
%prm
qh
qh : query ハンドル

%inst
db_query で取得した query ハンドルを解放します。

%index
db_col_count
現在行のカラム数
%group
iron_db — カラム
%prm
qh
qh : query ハンドル

%inst
query の結果カラム数を返す関数です。

%index
db_col_name
カラム名を取得
%group
iron_db — カラム
%prm
qh, col, out_name
qh       : query ハンドル
col      : 0 始まりのカラムインデックス
out_name : カラム名を受け取る変数 (sdim 自動、最大 255 byte)

%inst
指定カラムの名前を文字列として取得します。

%index
db_col_text
カラム値を TEXT で取得
%group
iron_db — カラム
%prm
qh, col, out_text
qh       : query ハンドル
col      : 0 始まりのカラムインデックス
out_text : 値を受け取る変数 (sdim 自動、最大 4095 byte)

%inst
指定カラムを文字列として取得します。

%index
db_col_int
カラム値を int で取得
%group
iron_db — カラム
%prm
qh, col
qh  : query ハンドル
col : カラムインデックス

%inst
指定カラムを int として返す関数です。

%index
db_col_dbl
カラム値を double で取得
%group
iron_db — カラム
%prm
qh, col
qh  : query ハンドル
col : カラムインデックス

%inst
指定カラムを double として返す関数です。

%index
db_last_rowid
直近 INSERT の rowid
%group
iron_db — メタ
%prm
h
h : DB ハンドル

%inst
最後の INSERT で生成された rowid (AUTOINCREMENT の値) を返す関数です。

%index
db_changes
直近 SQL の影響行数
%group
iron_db — メタ
%prm
h
h : DB ハンドル

%inst
直近の INSERT / UPDATE / DELETE で影響を受けた行数を返す関数です。

%index
db_errmsg
エラーメッセージを取得
%group
iron_db — メタ
%prm
h, out_msg
h       : DB ハンドル
out_msg : メッセージを受け取る変数 (sdim 自動、最大 1023 byte)

%inst
直近の SQLite エラーメッセージ文字列を取得します。
