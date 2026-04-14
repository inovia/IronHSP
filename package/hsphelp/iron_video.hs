;
; iron_video.hsp  HSP3 ヘルプ (日本語)
; Media Foundation MFPlay 動画/音声再生ラッパ
;

%type
拡張命令
%ver
1.0
%date
2026-04-14
%author
IronHSP / iron_video
%dll

%url
https://github.com/HNWorks/IronHSP_2026
%port
Win32 / Win64

%note
iron_video.hsp は Microsoft Media Foundation MFPlay (IMFPMediaPlayer)
を HSP の #usecom + #comfunc で直接叩いた動画・音声再生ラッパ。

Win Media Foundation コーデック対応のため:
  - 動画: MP4 / MKV / AVI / WMV / MOV / WebM 等
  - 音声: MP3 / WAV / AAC / WMA / FLAC 等

  #include "iron_video.hsp"

注意:
  - HWND を渡せば動画は HSP ウィンドウ内に貼り付けられる
  - HWND=0 なら音声のみ再生
  - Position/Duration の取得は PROPVARIANT 経由のため未実装 (将来対応)

%index
iron_video_open
動画/音声ファイルを開いて再生開始
%group
iron_video
%prm
"path", hwnd
"path" : ファイルパス (絶対 or 相対)
hwnd   : 親 HWND (HSP の hwnd システム変数 / 0 で音声のみ)

%inst
ファイルを開いて MFPCreateMediaPlayer で再生を開始します。
hwnd を渡した場合は動画がそのウィンドウに描画されます (アスペクト比
自動調整付き)。

%href
iron_video_play
iron_video_close

%index
iron_video_play
再生開始 (一時停止からの再開)
%group
iron_video
%prm

%index
iron_video_pause
一時停止
%group
iron_video
%prm

%index
iron_video_stop
停止 (頭に巻き戻る)
%group
iron_video
%prm

%index
iron_video_step
1 フレーム進める
%group
iron_video
%prm

%inst
一時停止状態で 1 フレームずつ進めます。コマ送りに使用。

%index
iron_video_set_rate
再生速度を変更
%group
iron_video
%prm
rate
rate : 1.0=等速, 0.5=スロー, 2.0=倍速

%index
iron_video_set_volume
音量を設定
%group
iron_video
%prm
vol
vol : 0.0 〜 1.0 (0 で無音, 1 で最大)

%index
iron_video_update
動画ウィンドウを再描画
%group
iron_video
%prm

%inst
親ウィンドウのリサイズ後などに呼び出すと動画位置が更新されます。

%index
iron_video_state
現在の再生状態を取得
%group
iron_video
%prm

%inst
defcfunc。状態コードを返します:
  -1 = ロード前
   1 = Stopped
   2 = Playing
   3 = Paused
   4 = Shutdown

%index
iron_video_close
解放
%group
iron_video
%prm

%inst
IMFPMediaPlayer_Shutdown → delcom → MFShutdown を実行します。
