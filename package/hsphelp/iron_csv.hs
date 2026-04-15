;
; iron_csv.hsp  HSP3 ヘルプ (日本語)
; RFC 4180 準拠 CSV パーサ / ビルダ (Pure HSP)
;

%type
拡張命令
%ver
1.0
%date
2026-04-15
%author
IronHSP / iron_csv
%dll

%url
https://github.com/HNWorks/IronHSP_2026
%port
Win32 / Win64

%note
iron_csv.hsp は RFC 4180 準拠の CSV パーサ / ビルダを Pure HSP で実装した
モジュールです。外部 DLL は不要です。

  #include "iron_csv.hsp"

対応機能:
  - カンマ / 任意デリミタ (TSV 等) 対応
  - ダブルクォートフィールド ("..." で囲む)
  - フィールド内の " を "" でエスケープ
  - 行区切り CRLF / LF / CR 自動判別
  - 文字コード cp932 / SJIS

%index
csv_parse
CSV 文字列をパース
%group
iron_csv — パース
%prm
var data, var rows, var cols, "csv_text", "sep"
data    : パース結果を格納する str 配列 (sdim 済み、内部で再確保)
rows    : 行数が返る変数
cols    : 最大列数が返る変数
"csv_text" : パース対象の CSV 文字列
"sep"   : デリミタ (省略時 ",")

%inst
CSV 文字列をパースして 2 次元フラット配列に格納します。
data は内部で sdim data, 1024, rows*cols として再確保されます。
個々のセルは data(r*cols + c) または csv_cell(data, r, c, cols) で
取り出せます。

例:
  sdim data, 256, 100
  csv_parse data, rows, cols, "a,b,c\n1,2,3\n"
  mes "rows=" + rows + " cols=" + cols
  mes csv_cell(data, 1, 0, cols)   ; → "1"

%index
csv_load
CSV ファイルを読み込んでパース
%group
iron_csv — パース
%prm
var data, var rows, var cols, "file.csv", "sep"

%inst
指定ファイルを bload して csv_parse でパースします。stat に 0 (成功) /
-1 (ファイルが存在しない) が返ります。

%index
csv_cell
セル値を取得
%group
iron_csv — パース
%prm
var data, int row, int col, int cols
%inst
csv_parse で格納された 2 次元フラット配列からセル値を取得する
ヘルパ関数 (cfunc) です。data(row*cols + col) と等価。

例:
  mes csv_cell(data, 2, 1, cols)

%index
csv_escape
1 フィールドをクォート処理 (cfunc)
%group
iron_csv — ビルド
%prm
"raw"
%inst
"raw" 文字列を CSV フィールドとしてクォート処理した結果を返します。
カンマ / 改行 / ダブルクォート / タブ を含む場合のみ "..." で囲まれ、
内部の " は "" にエスケープされます。不要な場合は元の文字列そのままを
返します。

例:
  mes csv_escape("hello, world")   ; → "hello, world"
  mes csv_escape("plain")          ; → plain

%index
csv_row_begin
1 行の組み立てを開始
%group
iron_csv — ビルド
%prm

%inst
csv_row_add / csv_row_end を使って 1 行を組み立てる際、最初に呼びます。
モジュール内部の行バッファをクリアします。

%index
csv_row_add
セルを 1 個追加
%group
iron_csv — ビルド
%prm
"value"
%inst
現在組み立て中の行に 1 セル追加します。値は自動で csv_escape されます。

%index
csv_row_end
組み立て中の行を出力変数に追記
%group
iron_csv — ビルド
%prm
var out
%inst
csv_row_begin / csv_row_add で組み立てた 1 行を、out 変数に CRLF 付きで
追記します。out は呼び出し側で sdim 済みの str 変数である必要があります。

例:
  sdim buf, 4096 : buf = ""
  csv_row_begin
  csv_row_add "name" : csv_row_add "age"
  csv_row_end buf
  csv_row_begin
  csv_row_add "Alice" : csv_row_add "30"
  csv_row_end buf
  ; buf = "name,age\r\nAlice,30\r\n"

%index
csv_write
CSV 文字列をファイルに書き出す
%group
iron_csv — ビルド
%prm
"file.csv", var csv_text
%inst
csv_text (var) の内容を指定ファイルに bsave で書き出します。
stat に書き出したバイト数が返ります。
