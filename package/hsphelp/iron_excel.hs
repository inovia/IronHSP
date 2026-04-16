;
; iron_excel.hsp  HSP3 ヘルプ (日本語)
; Excel .xlsx 読み書き (.NET OpenXML)
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
iron_excel.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
hsp3net 専用。Office インストール不要。

%group
Excel

%index
excel_create
新規 Excel ファイル作成
%group
Excel
%prm
"path"

%inst
空の .xlsx ファイルを作成し Sheet1 を追加します。

%href
excel_open

%index
excel_open
既存 Excel ファイルを開く
%group
Excel
%prm
"path"

%inst
.xlsx ファイルを開いてセルの読み書きを可能にします。

%href
excel_set_cell

%index
excel_set_cell
セルに値を書き込む
%group
Excel
%prm
sheet, row, col, "value"

%inst
sheet, row, col は 1-origin です。

%href
excel_get_cell

%index
excel_get_cell
セルの値を読み取る
%group
Excel
%prm
(sheet, row, col)

%inst
文字列で値を返します。空セルは空文字。

%href
excel_save

%index
excel_save
保存する
%group
Excel
%prm


%inst
変更をファイルに書き込みます。

%href
excel_close

%index
excel_close
閉じる
%group
Excel
%prm


%inst
ファイルを閉じてリソースを解放します。

%href
excel_sheet_count

%index
excel_sheet_count
シート数を取得
%group
Excel
%prm
()

%inst
ブック内のシート数を返します。

%href
excel_sheet_name

%index
excel_sheet_name
シート名を取得
%group
Excel
%prm
(index)

%inst
index は 1-origin です。

%href
excel_add_sheet

%index
excel_add_sheet
シートを追加
%group
Excel
%prm
"name"

%inst
指定名でシートを追加します。
