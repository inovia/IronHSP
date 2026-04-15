;
; hspble.dll  HSP3 ヘルプ (日本語)
; Bluetooth LE GATT クライアント (Windows.Devices.Bluetooth)
;

%type
拡張命令
%ver
1.0
%date
2026-04-15
%author
IronHSP / hspble
%dll
hspble.dll
%url
https://github.com/HNWorks/IronHSP_2026
%port
Win32 / Win64 (Windows 10 以降、BLE 対応アダプタ必須)

%note
hspble.dll は Windows 10 以降に搭載された Windows.Devices.Bluetooth
(WinRT) を使って、BLE セントラル機能 (GATT クライアント) を
HSP3 に提供します。

提供機能:
  - BluetoothLEAdvertisementWatcher によるアドバタイズスキャン
  - BluetoothLEDevice::FromBluetoothAddressAsync による接続
  - GATT サービス / キャラクタリスティックの列挙
  - Read / Write / Notify

非同期 WinRT API は内部で .get() による同期待ちにしているので、
HSP 側からは通常の同期命令として扱えます。ただし接続や Read は
数百 ms ブロックすることがあるので、リアルタイム描画ループと
併用する場合は注意してください。

スキャン結果と Notify はバックグラウンドスレッドで内部キュー
に蓄積され、ble_scan_poll / ble_notify_poll で 1 件ずつ取り
出す方式です (STA 不要)。

%index
ble_init
BLE サブシステム初期化
%group
hspble — 基本
%prm

%inst
WinRT apartment (multi_threaded) は DllMain で自動初期化される
ので、この命令は内部状態フラグの ON のみを行います。プラグイン
を使う前に 1 回呼び出してください。

%href
ble_shutdown

%index
ble_shutdown
BLE サブシステム解放
%group
hspble — 基本
%prm

%inst
スキャンを停止し、接続中のすべてのデバイスを切断します。

%href
ble_init

%index
ble_scan_start
アドバタイズスキャン開始
%group
hspble — スキャン
%prm

%inst
BluetoothLEAdvertisementWatcher を Active モードで Start します。
受信したアドバタイズは内部キュー (最大 4096 件) に蓄積され、
ble_scan_poll で取り出します。

%href
ble_scan_stop
ble_scan_poll

%index
ble_scan_stop
スキャン停止
%group
hspble — スキャン
%prm

%inst
AdvertisementWatcher を Stop し、受信キューをクリアします。

%href
ble_scan_start

%index
ble_scan_poll
スキャン結果を 1 件取り出す
%group
hspble — スキャン
%prm
var_addr, var_name, var_rssi
var_addr : MAC アドレス文字列 ("aa:bb:cc:dd:ee:ff")
var_name : ローカル名 (無い場合は空文字)
var_rssi : RSSI (dBm, int)

%inst
内部キューから 1 件取り出して引数の各変数に格納します。
stat=1 で取得成功、stat=0 でキューが空。

%href
ble_scan_start

%index
ble_connect
BLE デバイスに接続
%group
hspble — 接続
%prm
"addr"
addr : MAC アドレス文字列 ("aa:bb:cc:dd:ee:ff")

%inst
BluetoothLEDevice::FromBluetoothAddressAsync で接続を確立し、
内部スロット (最大 16) に格納します。戻り値 (stat) は 0〜15 の
デバイスハンドル。負値はエラー。

%href
ble_disconnect

%index
ble_disconnect
BLE デバイスの切断
%group
hspble — 接続
%prm
dev_h

%inst
登録した ValueChanged イベントをすべて解除し、BluetoothLEDevice
オブジェクトを解放してスロットを空けます。

%href
ble_connect

%index
ble_services
GATT サービス一覧を取得
%group
hspble — GATT
%prm
dev_h, var_list
dev_h    : デバイスハンドル
var_list : UUID 文字列を LF 区切りで受け取る str 変数

%inst
GetGattServicesAsync(Uncached) でサービスを列挙し、各 UUID を
小文字の 128bit 形式 ("xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
で LF 区切りの文字列として var に格納します。

%href
ble_characteristics

%index
ble_characteristics
特定サービスの characteristic 一覧
%group
hspble — GATT
%prm
dev_h, "svc_uuid", var_list

%inst
指定サービスに属する GattCharacteristic を列挙し、UUID を LF
区切りで返します。ble_services → ble_characteristics の順に
呼ぶことで属性ツリーが取れます。

%href
ble_services

%index
ble_read
characteristic を読み取る
%group
hspble — GATT I/O
%prm
dev_h, "svc", "chr", var_buf, var_len

%inst
GattCharacteristic::ReadValueAsync を同期実行し、取得したバイ
ト列を var_buf へ書き込みます (文字列変数に resize + memcpy)。
バイト数は var_len に int で返します。

%href
ble_write
ble_notify_enable

%index
ble_write
characteristic に書き込む
%group
hspble — GATT I/O
%prm
dev_h, "svc", "chr", var_buf, len

%inst
var_buf 先頭から len バイトを IBuffer に詰めて
WriteValueAsync(WriteWithResponse) で送信します。

%href
ble_read

%index
ble_notify_enable
Notify 購読を有効化
%group
hspble — Notify
%prm
dev_h, "svc", "chr"

%inst
CCCD (Client Characteristic Configuration Descriptor) に Notify
を書き込み、ValueChanged イベントを登録して内部キューに溜め始め
ます。受信したデータは ble_notify_poll で取り出します。

%href
ble_notify_poll

%index
ble_notify_poll
Notify キューから 1 件取り出す
%group
hspble — Notify
%prm
dev_h, "chr", var_buf, var_len

%inst
指定 characteristic のキューから最古の 1 件を取り出して var_buf
と var_len に格納します。chr を空文字にした場合は任意の chr の
1 件を取ります。stat=1 で成功、stat=0 でキューが空。

%href
ble_notify_enable
