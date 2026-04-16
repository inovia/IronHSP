%dll
; iron_html HTMLパース
%ver
3.8
%date
2026/04/16
%author
IronHSP
%type
ユーザー定義命令
%group
テキスト処理

%index
html_parse
HTMLを解析
%prm
html_str
%inst
stat にタグ数。
%href
html_find

%index
html_find
タグ名で検索
%prm
"tag"
%inst
stat に件数。
%href
html_tag_text

%index
html_tag_text
タグの内部テキストを取得
%prm
(index)
%inst

%href
html_tag_attr

%index
html_tag_attr
タグの属性値を取得
%prm
(index, "attr")
%inst

%href
html_text

%index
html_text
タグを除いたテキストを取得
%prm
()
%inst

