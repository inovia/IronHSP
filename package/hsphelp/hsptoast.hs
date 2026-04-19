;
; hsptoast.dll  HSP3 ヘルプ (日本語)
; Windows 10/11 トースト風通知プラグイン
;

%type
拡張命令
%ver
1.0
%date
2026-04-19
%author
IronHSP / hsptoast
%dll
hsptoast.dll
%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%index
hsptoast_show_info
情報トースト通知を表示
%group
hsptoast
%prm
title, body
title : 通知のタイトル (UTF-8 文字列)
body  : 通知の本文   (UTF-8 文字列)
%inst
画面右下に情報アイコン (青い i) 付きのトースト通知を表示する。
Windows 10 以降で NIIF_INFO を渡した Shell_NotifyIconW が実際のトースト
として描画される。
%href
hsptoast_show_warn
hsptoast_show_error
hsptoast_clear

%index
hsptoast_show_warn
警告トースト通知を表示
%group
hsptoast
%prm
title, body
title : 通知のタイトル
body  : 通知の本文
%inst
画面右下に警告アイコン (黄色い !) 付きのトースト通知を表示する。
%href
hsptoast_show_info

%index
hsptoast_show_error
エラートースト通知を表示
%group
hsptoast
%prm
title, body
title : 通知のタイトル
body  : 通知の本文
%inst
画面右下にエラーアイコン (赤い ×) 付きのトースト通知を表示する。
%href
hsptoast_show_info

%index
hsptoast_clear
トースト通知を消去
%group
hsptoast
%inst
タスクトレイに登録した通知アイコンを削除する。
プロセス終了時は DllMain 内で自動的に削除されるので、通常明示的に
呼ぶ必要はない。
