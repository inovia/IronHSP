;
; iron_scraper.hsp  HSP3 ヘルプ (日本語)
; Web スクレイピング
;

%type
拡張命令
%ver
3.8
%date
2026/04/17
%author
IronHSP
%dll
iron_scraper.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_http + iron_html が必要

%group
Web

%index
scrape_links
リンクを抽出
%group
Web
%prm
"url"

%inst
refstr に改行区切りの URL リストが格納されます。

%href
scrape_text

%index
scrape_text
テキストを抽出
%group
Web
%prm
"url"

%inst
refstr に HTML タグを除去したプレーンテキストが格納されます。
