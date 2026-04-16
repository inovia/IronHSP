%dll
; iron_dpi DPI対応
%ver
3.8
%date
2026/04/16
%author
IronHSP
%note
user32/shcore。外部DLL不要。
%type
ユーザー定義関数
%group
DPI対応

%index
dpi_set_awareness
DPI認識モードを設定
%prm
mode
mode : 0=UNAWARE, 1=SYSTEM, 2=PER_MONITOR_V2
%href
dpi_get

%index
dpi_get
現在のDPIを取得
%prm
()
%inst
96=100%, 120=125%, 144=150%, 192=200%
%href
dpi_scale

%index
dpi_scale
値を現在DPIでスケール
%prm
(value)
%href
dpi_get
