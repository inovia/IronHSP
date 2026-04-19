;
; hspmqtt.dll  HSP3 ヘルプ (日本語)
; 最小 MQTT 3.1.1 クライアントプラグイン
;

%type
拡張命令
%ver
1.0
%date
2026-04-19
%author
IronHSP / hspmqtt
%dll
hspmqtt.dll
%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%index
hspmqtt_open
MQTT ブローカーに接続
%group
hspmqtt
%prm
p1 = str : ブローカーのホスト名 (例 "broker.hivemq.com")
p2 = int : ポート番号 (通常 1883)
p3 = str : クライアント ID (重複不可、空文字だとブローカーが割り当て)
p4 = int : キープアライブ秒数 (通常 60)
%inst
TCP で指定ブローカーに接続し、MQTT 3.1.1 CONNECT → CONNACK を行う。
戻り値 (stat) はセッションハンドル (>=0 成功、<0 失敗)。
TLS (MQTTS) 未対応。
%href
hspmqtt_close

%index
hspmqtt_publish
トピックにメッセージを PUBLISH
%group
hspmqtt
%prm
handle, topic, payload
handle  : hspmqtt_open で取得したハンドル
topic   : 送信先トピック ("sensors/temperature" 等)
payload : メッセージ本文 (UTF-8 文字列)
%inst
QoS 0 で PUBLISH パケットを送信。PUBACK は受けないので確実な配信保証はなし。
%href
hspmqtt_subscribe

%index
hspmqtt_subscribe
トピックを SUBSCRIBE
%group
hspmqtt
%prm
handle, topic_filter
topic_filter : "+"/"#" ワイルドカード含むトピックフィルタ
%inst
QoS 0 で SUBSCRIBE パケットを送信。以降 hspmqtt_recv で受信できる。
%href
hspmqtt_recv

%index
hspmqtt_recv
非ブロッキング受信
%group
hspmqtt
%prm
handle, topic_buf, topic_buf_len, payload_buf, payload_buf_len
%inst
受信キューに PUBLISH があれば topic_buf / payload_buf に書き込み、
payload バイト数を stat に返す。何もなければ 0。
通信エラー時は負の値。keepalive を過ぎた場合は内部で PINGREQ を送信する。
%href
hspmqtt_subscribe

%index
hspmqtt_close
接続を切断してハンドルを解放
%group
hspmqtt
%prm
handle
%inst
MQTT DISCONNECT を送信し、TCP ソケットを閉じる。
プロセス終了時には DllMain が自動的に全ハンドルを掃除するので、
明示的に呼ばなくてもリークはしない。
