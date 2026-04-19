# hspmqtt.dll — Minimal MQTT 3.1.1 client for HSP

純 C + Winsock で書いた最小 MQTT クライアント。paho.mqtt.c / mosquitto 等の
外部ライブラリ不要、単一 cpp ファイル (~330 LOC)。

## サポート範囲

| 機能 | 対応 |
|---|---|
| TCP 接続 | ✅ |
| TLS (MQTTS) | ❌ (v2 で OpenSSL 静的リンク予定) |
| CONNECT / CONNACK | ✅ |
| PUBLISH QoS 0 | ✅ |
| PUBLISH QoS 1/2 (PUBACK/PUBREC) | ❌ |
| SUBSCRIBE / SUBACK QoS 0 | ✅ |
| PINGREQ / PINGRESP (keepalive) | ✅ |
| DISCONNECT | ✅ |
| Retained / LWT / Username/Password | ❌ |
| MQTT 5.0 プロパティ | ❌ |

## API

```
h = hspmqtt_open("broker.example.com", 1883, "client-id", 60)  ; >=0 成功
    hspmqtt_publish   h, "sensors/temp", "21.5"
    hspmqtt_subscribe h, "sensors/+"
n = hspmqtt_recv h, topic_buf, topic_buf_max, payload_buf, payload_buf_max
    hspmqtt_close h
```

`hspmqtt_recv` は非ブロッキング。ループで回して `n > 0` のとき
`topic_buf` / `payload_buf` に受信メッセージが入る。

## ビルド

```powershell
msbuild hspmqtt.vcxproj /p:Configuration=Release /p:Platform=x64    # → hspmqtt_64.dll
msbuild hspmqtt.vcxproj /p:Configuration=Release /p:Platform=Win32  # → hspmqtt.dll
```

追加 SDK 不要。`ws2_32.lib` (Winsock) をリンクするだけ。

## テスト

```
cd package/win32/sample/iron
../../iron_test_runner.exe --compiler=../../hspcmp64.exe \
    --runtime=../../hsp3cl_net_test_64.exe --compath=../../common/ \
    test_mqtt.hsp
```

broker なしでも動く軽量版 (localhost:1883 接続失敗 → 負ハンドル、または
成功 → close 安全性)。

## フル動作確認

Mosquitto ブローカーをローカルで起動:

```powershell
choco install mosquitto
mosquitto -v
```

もう一つのターミナルで:

```powershell
mosquitto_sub -t sensors/#       # subscribe
```

HSP で publish するサンプルを実行すれば届く。

## 実装ノート

- 1 プロセスに同時 8 接続まで (`kMaxSessions = 8`)
- keepalive の半分の時間経過で自動的に `PINGREQ` 送信
- `namespace {}` 内部 API + C linkage の `HSPMQTT_EXPORT` で HSP 側から呼ぶ
- MQTT Variable Length Integer (最大 4 バイト) の encode / decode を自前で実装

## 参考

- MQTT 3.1.1 spec: https://docs.oasis-open.org/mqtt/mqtt/v3.1.1/os/mqtt-v3.1.1-os.html
- Eclipse Mosquitto (broker): https://mosquitto.org
