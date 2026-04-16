;
; iron_serial.hsp  HSP3 ヘルプ (日本語)
; シリアルポート (RS-232 / USB CDC) 通信ラッパ
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
iron_serial.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_serial.hsp は Win32 の CreateFile + SetCommState + ReadFile /
WriteFile を直接ラップしたシリアルポート読み書きモジュールです。
kernel32.dll のみ利用するので追加 DLL は不要で、Arduino / マイコンとの
UART 連携に適しています。

  #include "iron_serial.hsp"

注意:
  現状 1 ポートのみ同時に open 可能です (内部グローバル状態)。
  COM1～COM9 は "COM3" のように書けますが、COM10 以降は
  "\\\\.\\COM10" という形式が必要です。

%group
iron_serial (シリアル通信)

%index
serial_open
シリアルポートを開く
%group
iron_serial ― 接続
%prm
"port", baud, bits, parity, stop
"port"  : ポート名 ("COM3" 等)
baud    : ボーレート (0 指定で 9600)
bits    : データビット数 (0 指定で 8)
parity  : パリティ (0=N 1=O 2=E 3=M 4=S)
stop    : ストップビット (0=1bit 1=1.5bit 2=2bit)

%inst
指定ポートを GENERIC_READ | GENERIC_WRITE で開き、DCB と
COMMTIMEOUTS を設定します。戻り値は 0 で成功、-1 で CreateFile 失敗、
-2 で SetCommState 失敗です。既に他のポートが open されている場合は
先に close されます。

例:
  serial_open "COM3", 115200, 8, 0, 0

%href
serial_close

%index
serial_close
シリアルポートを閉じる
%group
iron_serial ― 接続
%prm

%inst
現在開いているシリアルポートを閉じます。open していない場合は
何もしません。

%href
serial_open

%index
serial_write
文字列を送信
%group
iron_serial ― 送信
%prm
"text"
"text" : 送信する文字列

%inst
文字列を strlen バイト分送信します。戻り値は実際に書き込まれた
バイト数です。改行が必要な場合は "\r\n" を文字列に含めてください。

例:
  serial_write "hello\r\n"

%href
serial_write_buf

%index
serial_write_buf
バイナリバッファを送信
%group
iron_serial ― 送信
%prm
buf, len
buf : 送信バッファ変数
len : 送信バイト数

%inst
文字列終端に依存しないバイナリ送信です。戻り値は書き込まれたバイト数。

%href
serial_write

%index
serial_avail
受信バッファ内のバイト数を取得
%group
iron_serial ― 受信
%prm

%inst
ClearCommError で COMSTAT の cbInQue を取得し、stat に受信待ちの
バイト数を返します。ポーリングループから read のタイミングを計るのに
使います。

例:
  serial_avail
  if stat > 0 : serial_read buf, 255

%href
serial_read

%index
serial_read
受信データを読み取る
%group
iron_serial ― 受信
%prm
out_buf, max_bytes
out_buf   : 受信先変数 (sdim 自動、max_bytes + 16)
max_bytes : 最大読み取りバイト数

%inst
最大 max_bytes まで非ブロッキング read します (内部 timeout は
MAXDWORD = ノンブロッキング)。戻り値は実際に読み取ったバイト数です。
serial_avail でバッファ内のバイト数を先にチェックする運用を推奨します。

例:
  serial_avail
  if stat > 0 {
      sdim buf, 256
      serial_read buf, 255
      mes "received: " + buf
  }

%href
serial_avail
