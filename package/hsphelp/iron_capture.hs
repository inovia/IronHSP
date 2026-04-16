%dll
; iron_capture 画面キャプチャ
%ver
3.8
%date
2026/04/16
%author
IronHSP
%note
hspcapture.dllが必要。DXGI Desktop Duplication (Win8+)。
%type
ユーザー定義命令
%group
画面キャプチャ

%index
capture_init
DXGI画面キャプチャを初期化
%inst
stat=0 で成功。D3D11 + DXGI を使用。
%href
capture_save

%index
capture_save
スクリーンショットをBMP保存
%prm
"filename.bmp"
%inst
プライマリモニタの画面をBMPで保存。
%sample
	capture_init
	capture_save "screenshot.bmp"
	capture_bye
%href
capture_init

%index
capture_bye
終了処理
%href
capture_init
