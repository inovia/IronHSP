;
; iron_office.hsp  HSP3 ヘルプ (日本語)
; Microsoft Office COM 自動化 (VBScript bridge)
;

%type
拡張命令
%ver
1.0
%date
2026-04-15
%author
IronHSP / iron_office
%dll

%url
https://github.com/HNWorks/IronHSP_2026
%port
Win32 / Win64

%note
iron_office.hsp は Microsoft Excel / Word / PowerPoint を
COM Automation 経由で操作するためのラッパです。

  #include "iron_office.hsp"

妥協設計:
  pure HSP から IDispatch late binding を直接駆動するのは労力が大きい
  ため、本モジュールは **VBScript ブリッジ方式** を採用しています。
  実行時に一時 .vbs を書き出して cscript.exe で実行し、結果を一時
  ファイル経由で受け取る仕組みです。

要件:
  Microsoft Office (Excel / Word / PowerPoint) が導入されていること
  Office 非導入環境では全関数が失敗します

大量セル操作などの性能重視用途では iron_xlsx.hsp (Pure HSP + OpenXML
直読み) を推奨します。iron_office.hsp は以下のような用途向けです:
  - 既存 Office ファイルの PDF エクスポート (レイアウト保持)
  - 少量のセル読み書き
  - VBA マクロ実行

%index
office_excel_run
任意の VBScript を cscript 経由で実行
%group
iron_office — Excel
%prm
"vbs_code", var_out

%inst
与えられた VBScript を一時ファイルに書き出して cscript.exe //nologo で
実行します。スクリプト側では変数 IRON_OFFICE_OUT (出力先一時ファイル
パス) が定義済みなので、そこに書き込めば var_out に読み戻されます。

例:
  vbs = "Dim fso : Set fso = CreateObject(\"Scripting.FileSystemObject\")\n"
  vbs += "Dim f : Set f = fso.CreateTextFile(IRON_OFFICE_OUT, True)\n"
  vbs += "f.Write \"hello\" : f.Close\n"
  office_excel_run vbs, out

%index
office_excel_get_cell
Excel のセル値を読む
%group
iron_office — Excel
%prm
"file.xlsx", sheet, row, col, var_str
sheet : 1-origin (VBA の Sheets(n) 準拠)
row, col : 1-origin

%inst
Excel.Application を起動して file.xlsx を開き、Sheets(sheet).Cells(row, col)
の値を var_str に読み込みます。

%index
office_excel_set_cell
Excel のセル値を書く
%group
iron_office — Excel
%prm
"file.xlsx", sheet, row, col, "value"

%inst
Excel.Application を起動して file.xlsx を開き、指定セルに値を書き込み
Save してから閉じます。

%index
office_excel_to_pdf
Excel ファイルを PDF 変換
%group
iron_office — Excel
%prm
"src.xlsx", "dst.pdf"

%inst
Workbook.ExportAsFixedFormat (xlTypePDF = 0) で PDF 変換を行います。
Excel 2007 SP2 以上が必要です。

%index
office_word_to_pdf
Word ファイルを PDF 変換
%group
iron_office — Word
%prm
"src.docx", "dst.pdf"

%inst
Document.ExportAsFixedFormat (wdExportFormatPDF = 17) で PDF 変換。

%index
office_ppt_to_pdf
PowerPoint ファイルを PDF 変換
%group
iron_office — PowerPoint
%prm
"src.pptx", "dst.pdf"

%inst
Presentation.SaveAs (ppSaveAsPDF = 32) で PDF 変換。
