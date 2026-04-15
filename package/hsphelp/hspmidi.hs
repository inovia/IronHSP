;
; hspmidi.dll  HSP3 ヘルプ (日本語)
; winmm ベース MIDI in/out プラグイン
;

%type
拡張命令
%ver
1.0
%date
2026-04-15
%author
IronHSP / hspmidi
%dll
hspmidi.dll
%url
https://github.com/HNWorks/IronHSP_2026
%port
Win32 / Win64

%note
hspmidi.dll は Windows の winmm (midiOut* / midiIn*) を使った
MIDI 入出力プラグインです。ショートメッセージ (Note On/Off,
Program Change 等) の送受信のみサポートします。SysEx は v1 では非対応。

  #include "hspmidi.as"     ; 直接使用
  #include "iron_midi.hsp"  ; note_name("C4") 等の便利 cfunc 付き

制約 (v1):
  - MIDI out / in それぞれハンドルは同時 1 個のみ
  - MIDI in はワーカースレッド callback → 内部リングバッファ (1024)
    に蓄え、HSP 側は midi_in_poll で取り出すポーリング式
  - SysEx / MIM_LONGDATA は未対応

戻り値規約:
  0  ... 成功
  負 ... 失敗 (winmm の MMRESULT を負符号化したもの)

;------------------------------------------------------------
; MIDI 出力
;------------------------------------------------------------

%index
midi_out_count
MIDI out デバイス数取得
%group
hspmidi — MIDI out
%prm
var_count
var_count ... デバイス数を受け取る整数変数

%inst
MIDI 出力デバイスの数を var_count に格納します (midiOutGetNumDevs)。
通常 "Microsoft GS Wavetable Synth" が devid=0 にあります。

%index
midi_out_name
MIDI out デバイス名取得
%group
hspmidi — MIDI out
%prm
var_str, buf_size, devid
var_str  ... デバイス名を格納する文字列変数 (sdim 済)
buf_size ... var_str に sdim で確保したバッファサイズ
devid    ... デバイス番号 (0 〜 midi_out_count-1)

%inst
指定デバイスの名称を var_str に cp932 で格納します。内部的には
midiOutGetDevCapsW で UTF-16 取得後、CP_ACP で変換しています。
var_str は事前に sdim で十分なサイズを確保し、その sdim サイズを
buf_size に指定してください。

例:
  sdim nm, 256
  midi_out_count cnt_dev
  repeat cnt_dev
    midi_out_name nm, 256, cnt
    mes strf("%d: %s", cnt, nm)
  loop

%index
midi_out_open
MIDI out デバイスを開く
%group
hspmidi — MIDI out
%prm
devid
devid ... デバイス番号 (0 = 既定の音源)

%inst
MIDI 出力デバイスを開きます。成功すると 0、失敗なら負数。
既に開いていた場合は内部で一旦 close してから開き直します。

%index
midi_out_close
MIDI out デバイスを閉じる
%group
hspmidi — MIDI out
%prm

%inst
MIDI 出力デバイスを閉じます。開いていなければ何もせず 0 を返します。
内部で midiOutReset (All Sound Off) してから close します。

%index
midi_out_short
short MIDI メッセージ送信
%group
hspmidi — MIDI out
%prm
status, data1, data2
status ... ステータスバイト (例: $90=Note On ch0)
data1  ... データバイト 1 (0〜127)
data2  ... データバイト 2 (0〜127)

%inst
任意のショートメッセージを送信します (midiOutShortMsg)。status の
下位 4bit がチャンネル番号です。

例:
  midi_out_short $90, 60, 100   ; ch0 C4 Note On vel 100
  await 500
  midi_out_short $80, 60, 0     ; ch0 C4 Note Off

%index
midi_out_note_on
Note On 送信 (便利ラッパ)
%group
hspmidi — MIDI out
%prm
ch, note, vel
ch   ... MIDI チャンネル (0〜15)
note ... ノート番号 (C4 = 60)
vel  ... ベロシティ (1〜127)

%inst
$90 + ch のステータスで Note On を送ります。

%index
midi_out_note_off
Note Off 送信 (便利ラッパ)
%group
hspmidi — MIDI out
%prm
ch, note, vel
ch   ... MIDI チャンネル (0〜15)
note ... ノート番号
vel  ... ベロシティ (通常 0)

%inst
$80 + ch のステータスで Note Off を送ります。vel には release
velocity を入れますが、0 で問題ありません。

%index
midi_out_program_change
音色切替 (Program Change)
%group
hspmidi — MIDI out
%prm
ch, program
ch      ... MIDI チャンネル (0〜15)
program ... 音色番号 (GM 準拠: 0 = Acoustic Grand Piano 等)

%inst
$C0 + ch の Program Change を送信します。

主な GM 音色番号 (hspmidi.as にも #define あり):
  0  Acoustic Grand Piano
  4  Electric Piano
  6  Harpsichord
  11 Vibraphone
  24 Nylon Guitar
  33 Electric Bass
  40 Violin
  48 String Ensemble
  56 Trumpet
  65 Alto Sax
  73 Flute

%index
midi_out_reset
全ノートオフ (midiOutReset)
%group
hspmidi — MIDI out
%prm

%inst
midiOutReset を呼び、全チャンネルで鳴っている音を停止します。
演奏中に強制停止したいときに使用します。

;------------------------------------------------------------
; MIDI 入力 (ポーリング式)
;------------------------------------------------------------

%index
midi_in_count
MIDI in デバイス数取得
%group
hspmidi — MIDI in
%prm
var_count
var_count ... デバイス数を受け取る整数変数

%inst
MIDI 入力デバイスの数を var_count に格納します (midiInGetNumDevs)。

%index
midi_in_name
MIDI in デバイス名取得
%group
hspmidi — MIDI in
%prm
var_str, buf_size, devid
var_str  ... デバイス名を格納する文字列変数 (sdim 済)
buf_size ... var_str に sdim で確保したバッファサイズ
devid    ... デバイス番号

%inst
指定 MIDI 入力デバイスの名称を cp932 で格納します。
var_str は事前に sdim で十分なサイズを確保し、その sdim サイズを
buf_size に指定してください。

%index
midi_in_open
MIDI in デバイスを開く
%group
hspmidi — MIDI in
%prm
devid

%inst
MIDI 入力デバイスを開きます。成功で 0、失敗で負数。
開いた時点ではまだ受信は始まりません。midi_in_start を呼んで
ください。内部リングバッファはここでクリアされます。

使い方の流れ:
  midi_in_open 0
  midi_in_start
  repeat
    midi_in_poll got, st, d1, d2
    if got == 0 : await 5 : continue
    mes strf("%02x %d %d", st, d1, d2)
  loop
  midi_in_stop
  midi_in_close

%index
midi_in_start
MIDI 入力の受信開始
%group
hspmidi — MIDI in
%prm

%inst
midiInStart を呼び、コールバック経由での受信を開始します。
受信メッセージは内部リングバッファ (1024 件) に蓄えられ、
midi_in_poll で取り出します。

%index
midi_in_stop
MIDI 入力の受信停止
%group
hspmidi — MIDI in
%prm

%inst
midiInStop を呼び受信を停止します。リングバッファの中身は
残ります (続けて poll で取れます)。

%index
midi_in_close
MIDI in デバイスを閉じる
%group
hspmidi — MIDI in
%prm

%inst
MIDI 入力デバイスを閉じます。内部で midi_in_stop してから close
します。

%index
midi_in_poll
受信メッセージの取得
%group
hspmidi — MIDI in
%prm
var_got, var_status, var_d1, var_d2
var_got    ... 取得結果フラグ (int 変数: 1=取得成功 / 0=バッファ空)
var_status ... 結果のステータスバイト (int 変数)
var_d1     ... データ1 (int 変数)
var_d2     ... データ2 (int 変数)

%inst
内部リングバッファから 1 件取り出します。
  var_got = 1 ... 取得成功 (status/d1/d2 に値が入る)
  var_got = 0 ... バッファ空 (status/d1/d2 は 0)

status には「チャンネル付きステータスバイト」(例: $90 ch0 Note On)
がそのまま入ります。チャンネル分離が必要な場合は
  ch = st & $0F
  kind = st & $F0
のようにマスクしてください。

例 (受信ループ):
  midi_in_open 0
  midi_in_start
  *poll
    midi_in_poll got, st, d1, d2
    if got {
      kind = st & $F0
      ch   = st & $0F
      if kind == MIDI_NOTE_ON  : mes strf("ON  ch%d note=%d vel=%d", ch, d1, d2)
      if kind == MIDI_NOTE_OFF : mes strf("OFF ch%d note=%d vel=%d", ch, d1, d2)
      goto *poll
    }
    await 5
    goto *poll

%index
note_name
音名 → ノート番号 変換 (iron_midi)
%group
iron_midi — ユーティリティ
%prm
"name"
name ... "C4", "C#4", "Db4", "A-1" 等

%inst
iron_midi.hsp に定義された cfunc。音名を MIDI ノート番号に変換します。
書式: [音名][臨時記号(#|b)][オクターブ番号] 例: "F#3"。
C4 = 60, C-1 = 0, G9 = 127。

例:
  n = note_name("C4")    ; 60
  midi_out_note_on 0, n, 100
