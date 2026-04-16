;
; iron_xlsx.hsp  HSP3 ヘルプ (日本語)
; OpenXML (.xlsx) 読み書きモジュール (Pure HSP + hsp7z)
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
iron_xlsx.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_xlsx.hsp は Microsoft Excel (.xlsx) ファイルを Pure HSP で読み書き
するモジュールです。.xlsx は実体として ZIP + XML の集合なので、
iron_7z.hsp (hsp7z.dll) で一時ディレクトリに展開し、XML を直接パースして
セル値を取得します。

  #include "iron_xlsx.hsp"

Microsoft Office のインストールは不要です。iron_office.hsp (COM/VBS
bridge) より軽量で、サーバー環境でも動作します。

v1 スコープ:
  読み取り : sharedStrings / inline string / 数値に対応
  書き込み : xlsx_new → xlsx_set_cell → xlsx_save の最小テンプレート経由
             既存 xlsx への追記や書式保持は非対応

依存:
  iron_7z.hsp (hsp7z.dll + 7za_*.exe)
  row, col は 1-origin (Excel の A1 = row 1, col 1)

%group
iron_xlsx (Excel入出力)

%index
xlsx_open
xlsx ファイルを開いてハンドルを返す
%group
iron_xlsx ― 読み取り
%prm
"file.xlsx"
"file.xlsx" : 対象ファイル

%inst
.xlsx ファイルを hsp7z で一時ディレクトリに展開してパースします。
戻り値 (stat) はハンドル (0 以上) または負数のエラーコードです。

例:
  xlsx_open "book.xlsx"
  h = stat

%index
xlsx_close
xlsx ハンドルを閉じる
%group
iron_xlsx ― 読み取り
%prm
handle

%inst
ハンドルを解放します。一時ディレクトリは %TEMP% に残りますが害はありません。

%index
xlsx_sheet_count
sheet 数を取得
%group
iron_xlsx ― 読み取り
%prm
handle

%inst
workbook 内の sheet 数を stat に返します。

%index
xlsx_sheet_name
sheet 名を取得
%group
iron_xlsx ― 読み取り
%prm
handle, idx, var_str
idx : 0-origin

%inst
sheet のインデックス (0-origin) から名前を取得します。

%index
xlsx_cell_str
セルを文字列として取得
%group
iron_xlsx ― 読み取り
%prm
handle, sheet_idx, row, col, var_str
sheet_idx : 0-origin
row, col  : 1-origin

%inst
指定セルの値を文字列で取得します。数値セルは文字列化されて返ります。

例:
  xlsx_cell_str h, 0, 1, 1, v   ; sheet[0] の A1

%index
xlsx_cell_num
セルを数値として取得
%group
iron_xlsx ― 読み取り
%prm
handle, sheet_idx, row, col, var_dbl

%inst
指定セルの値を double として取得します。

%index
xlsx_used_range
使用範囲を取得
%group
iron_xlsx ― 読み取り
%prm
handle, sheet_idx, var_rows, var_cols

%inst
sheet 内で値が格納されている最大 row / col (1-origin) を取得します。

%index
xlsx_new
空 book を新規作成
%group
iron_xlsx ― 書き込み
%prm
var_handle

%inst
空の book (1 sheet: "Sheet1") を新規作成してハンドルを返します。

%index
xlsx_set_cell
セルに文字列を書き込む
%group
iron_xlsx ― 書き込み
%prm
handle, sheet_idx, row, col, "value"

%inst
セルに文字列値を書き込みます。inlineStr 形式で保存されます。

%index
xlsx_set_num
セルに数値を書き込む
%group
iron_xlsx ― 書き込み
%prm
handle, sheet_idx, row, col, value_dbl

%inst
セルに数値を書き込みます。

%index
xlsx_save
.xlsx ファイルとして保存
%group
iron_xlsx ― 書き込み
%prm
handle, "file.xlsx"

%inst
最小テンプレートの OpenXML 構造を一時ディレクトリに書き出し、
hsp7z で zip 化して .xlsx として保存します。
