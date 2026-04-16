%dll
; iron_audioloop 音声ループバック
%ver
3.8
%date
2026/04/16
%author
IronHSP
%note
hspaudioloop.dllが必要。WASAPI ループバック (Vista+)。
%type
ユーザー定義命令
%group
オーディオ

%index
audioloop_start
音声ループバック録音開始
%prm
"output.wav"
%inst
システム再生音をWAVファイルに録音。ステレオミックス不要。
stat=0 で成功。
%href
audioloop_poll
audioloop_stop

%index
audioloop_poll
録音データを取得
%inst
50～100msごとに呼ぶ。stat に書き込みバイト数。
%href
audioloop_start

%index
audioloop_stop
録音停止
%inst
WAVヘッダを更新してファイルを完成。
%href
audioloop_start
