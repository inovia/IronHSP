%dll
; iron_ime IME制御
%ver
3.8
%date
2026/04/16
%author
IronHSP
%note
imm32.dll。外部DLL不要。
%type
ユーザー定義命令
%group
IME制御

%index
ime_on
IMEをON
%href
ime_off

%index
ime_off
IMEをOFF
%href
ime_on

%index
ime_get_state
IMEのON/OFF状態を取得
%prm
()
%inst
1=ON, 0=OFF
%href
ime_on

%index
ime_set_mode
変換モードを設定
%prm
mode
mode : 0=直接, 1=ひらがな, 2=全角カナ, 3=半角カナ
%href
ime_get_mode

%index
ime_get_mode
現在の変換モードを取得
%prm
()
%href
ime_set_mode
