;
; iron_faker.hsp  HSP3 ヘルプ (日本語)
; フェイクデータ生成
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
iron_faker.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
テスト

%index
fake_name
ランダムな名前
%group
テスト
%prm
()

%inst
例: "田中太郎"

%href
fake_email

%index
fake_email
ランダムなメールアドレス
%group
テスト
%prm
()

%inst
例: "taro.tanaka@example.com"

%href
fake_phone

%index
fake_phone
ランダムな電話番号
%group
テスト
%prm
()

%inst
例: "090-1234-5678"

%href
fake_address

%index
fake_address
ランダムな住所
%group
テスト
%prm
()

%inst
例: "東京都 3-15-7"

%href
fake_int

%index
fake_int
ランダムな整数
%group
テスト
%prm
(min, max)

%inst
min～max の範囲の整数を返します。
