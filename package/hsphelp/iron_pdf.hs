%dll
; iron_pdf PDF 操作 (PDFium)
%ver
3.8
%date
2026/04/16
%author
IronHSP
%note
hsppdf.dllが必要。
%type
ユーザー定義命令
%group
ドキュメント

%index
pdf_open
PDF ファイルを開く
%prm
"file.pdf"
%href
pdf_page_count

%index
pdf_page_count
ページ数を取得
%prm
()
%href
pdf_render

%index
pdf_render
ページをレンダリング
%prm
page, buf, w, h
%href
pdf_close

%index
pdf_close
PDF を閉じる
%prm

%href
pdf_create

%index
pdf_create
新規 PDF を作成
%prm
"output.pdf"
%href
pdf_add_text

%index
pdf_add_text
テキストを追加
%prm
"text", x, y
%href
pdf_save

%index
pdf_save
PDF を保存
%prm

