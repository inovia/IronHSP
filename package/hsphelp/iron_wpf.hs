;
; iron_wpf.hsp  HSP3 ヘルプ (日本語)
; WPF サポート
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
iron_wpf.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
hsp3net 専用

%group
UI/GUI

%index
wpf_init
WPF 初期化
%group
UI/GUI
%prm


%inst
WPF アセンブリをロード。

%href
wpf_load_xaml

%index
wpf_load_xaml
XAML 読み込み
%group
UI/GUI
%prm
"xaml", var_handle

%inst
XAML をパース。

%href
wpf_show

%index
wpf_show
ウィンドウ表示
%group
UI/GUI
%prm
handle

%inst


%href
wpf_find

%index
wpf_find
要素検索
%group
UI/GUI
%prm
handle, "name", var_element

%inst
x:Name で検索。

%href
wpf_set_text

%index
wpf_set_text
テキスト設定
%group
UI/GUI
%prm
element, "text"

%inst


%href
wpf_get_text

%index
wpf_get_text
テキスト取得
%group
UI/GUI
%prm
element

%inst
refstr に返す。

%href
wpf_close

%index
wpf_close
ウィンドウを閉じる
%group
UI/GUI
%prm
handle

%inst

