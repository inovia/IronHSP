;
; iron_mqtt.hsp  HSP3 ヘルプ (日本語)
; MQTT クライアント
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
iron_mqtt.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
hsp3net 専用

%group
ネットワーク

%index
mqtt_connect
接続
%group
ネットワーク
%prm
"broker", port, "client_id"

%inst
MQTT 3.1.1

%href
mqtt_set_auth

%index
mqtt_set_auth
認証設定
%group
ネットワーク
%prm
"user", "pass"

%inst


%href
mqtt_publish

%index
mqtt_publish
パブリッシュ
%group
ネットワーク
%prm
"topic", "payload", qos

%inst


%href
mqtt_subscribe

%index
mqtt_subscribe
サブスクライブ
%group
ネットワーク
%prm
"topic", qos

%inst


%href
mqtt_poll

%index
mqtt_poll
メッセージ受信
%group
ネットワーク
%prm
var_topic, var_payload, timeout_ms

%inst
stat=1 受信あり

%href
mqtt_disconnect

%index
mqtt_disconnect
切断
%group
ネットワーク
%prm


%inst

