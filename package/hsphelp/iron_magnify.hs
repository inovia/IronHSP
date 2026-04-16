%dll
; iron_magnify 画面拡大
%ver
3.8
%date
2026/04/16
%author
IronHSP
%note
magnification.dll。外部DLL不要。
%type
ユーザー定義命令
%group
画面拡大

%index
mag_init
拡大APIを初期化
%inst
stat=0 で成功。
%href
mag_fullscreen_on

%index
mag_fullscreen_on
全画面拡大をON
%prm
factor
factor : 倍率 (100=等倍, 200=2倍)
%href
mag_fullscreen_off

%index
mag_fullscreen_off
全画面拡大をOFF
%href
mag_fullscreen_on

%index
mag_bye
終了処理
%href
mag_init
