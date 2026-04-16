;
; iron_ffmpeg.hsp  HSP3 ヘルプ (日本語)
; FFmpeg ラッパー
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
iron_ffmpeg.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
ffmpeg.exe が必要

%group
マルチメディア

%index
ffmpeg_set_path
ffmpeg パスを設定
%group
マルチメディア
%prm
"path"

%inst
ffmpeg.exe のパスを指定します。

%href
ffmpeg_convert

%index
ffmpeg_convert
フォーマット変換
%group
マルチメディア
%prm
"in", "out"

%inst
入力ファイルを出力フォーマットに変換します。

%href
ffmpeg_extract_audio

%index
ffmpeg_extract_audio
音声を抽出
%group
マルチメディア
%prm
"video", "audio"

%inst
動画ファイルから音声トラックを抽出します。

%href
ffmpeg_trim

%index
ffmpeg_trim
動画をトリミング
%group
マルチメディア
%prm
"in", "out", "start", "dur"

%inst
開始時刻と長さを指定して切り出します。

%href
ffmpeg_thumbnail

%index
ffmpeg_thumbnail
フレームを抽出
%group
マルチメディア
%prm
"video", "img", "time"

%inst
指定時刻のフレームを画像として保存します。
