%dll
; iron_report 帳票出力
%ver
3.8
%date
2026/04/16
%author
IronHSP
%type
ユーザー定義命令
%group
帳票出力

%index
report_init
帳票を初期化
%prm

%inst

%href
report_template

%index
report_template
HTMLテンプレートを設定
%prm
html_str
%inst
{{key}} プレースホルダー対応。
%href
report_set

%index
report_set
差し込みデータを設定
%prm
"key", "value"
%inst

%href
report_table_begin

%index
report_table_begin
テーブル行の開始
%prm
"key"
%inst

%href
report_table_row

%index
report_table_row
テーブル行を追加
%prm
"col1", "col2", ...
%inst
最大 8 列。
%href
report_table_end

%index
report_table_end
テーブル行の終了
%prm

%inst

%href
report_preview

%index
report_preview
ブラウザでプレビュー
%prm

%inst

%href
report_save

%index
report_save
ファイルに保存
%prm
"file.html"
%inst

