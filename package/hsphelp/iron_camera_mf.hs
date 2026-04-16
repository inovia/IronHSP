;
; iron_camera_mf.hsp  HSP3 ヘルプ (日本語)
; hspmfcam.dll ベース Pure Media Foundation Webcam ラッパ
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
iron_camera_mf.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_camera_mf.hsp は hspmfcam.dll を経由して Microsoft Media
Foundation の SourceReader から Webcam フレームを取得する HSP ラッパ。
OpenCV 不要、依存は hspmfcam.dll のみ。

特徴:
  - 内部で worker thread + child window を作成 (MFPlay と同じ方式)
  - HSP main thread が title bar drag 等で止まっても prefetch 継続
  - 自動デインターレース (キャプチャカードの 1080i 等にも対応)
  - 最大 256 デバイス並列 (仮想 webcam / キャプチャカード対応)
  - PNG/JPEG/BMP/GIF/TIFF スナップショット保存
  - H.264/HEVC/WMV9/VP9/MJPG 録画 + AAC/WMA/FLAC/MP3 同時録音
  - カメラプロパティ (明るさ/露出/フォーカス) アクセス

  #include "iron_camera_mf.hsp"

詳細な命令仕様は hspmfcam.hs を参照。本ファイルは hspmfcam.dll の
HSP ラッパで、ハンドル管理 + より HSP 親和的な API を提供します。

%group
iron_camera_mf (Webカメラ/録画/マイク)

%index
iron_cam_count
接続カメラ数を取得 (defcfunc)
%group
iron_camera_mf ― 列挙
%prm

%inst
defcfunc。Video capture デバイス数を返します。

%index
iron_cam_name
カメラ friendly name を取得
%group
iron_camera_mf ― 列挙
%prm
idx, var

%inst
idx 番目のカメラの friendly name を var に書き込みます (sdim 自動 256 byte)。

%index
iron_cam_id
カメラの SymbolicLink を取得 (ユニーク ID)
%group
iron_camera_mf ― 列挙
%prm
idx, var

%inst
USB device path 等のユニーク ID を取得します。同名製品が複数接続
されている場合の区別に使用。

%index
iron_cam_audio_count
オーディオキャプチャデバイス数 (defcfunc)
%group
iron_camera_mf ― 列挙

%index
iron_cam_audio_name
オーディオデバイス friendly name を取得
%group
iron_camera_mf ― 列挙
%prm
idx, var

%index
iron_cam_audio_id
オーディオデバイスの EndpointID を取得
%group
iron_camera_mf ― 列挙
%prm
idx, var

%index
iron_cam_format_count
カメラの対応フォーマット数 (defcfunc)
%group
iron_camera_mf ― フォーマット列挙
%prm
dev_idx

%inst
指定カメラがネイティブで対応する (解像度 × FPS × FOURCC) の
組み合わせ数を返します。

%index
iron_cam_format_get
対応フォーマット情報を取得
%group
iron_camera_mf ― フォーマット列挙
%prm
dev_idx, fmt_idx, ow, oh, ofn, ofd, ofcc

%inst
fmt_idx 番目の対応フォーマットを取得:
  ow / oh : 幅 / 高さ
  ofn / ofd : fps 分子 / 分母
  ofcc : "NV12" "YUY2" "MJPG" "RGB32" 等の FOURCC 文字列

%index
iron_cam_open
カメラを開いてプレビュー開始 (defcfunc)
%group
iron_camera_mf ― open
%prm
dev_idx, x, y, w, h

%inst
defcfunc。dev_idx 番目のカメラを開き、HSP の現在ウィンドウ内
(x, y, w, h) に child window としてプレビューを作成します。

戻り値: ハンドル (>=0) / -1 失敗

%href
iron_cam_open_ex
iron_cam_close

%index
iron_cam_open_ex
任意フォーマット指定でカメラを開く (defcfunc)
%group
iron_camera_mf ― open
%prm
dev_idx, x, y, w, h, des_w, des_h, des_fn, des_fd

%inst
解像度と fps を指定して open。des_w/des_h/des_fn/des_fd を 0 にすると
デフォルト動作 (iron_cam_open と同じ)。

例 (1280x720 30fps):
  h = iron_cam_open_ex(0, 0, 0, 800, 600, 1280, 720, 30, 1)

%index
iron_cam_size
カメラのネイティブ解像度を取得
%group
iron_camera_mf
%prm
h, ow, oh

%index
iron_cam_set_pos
プレビュー子ウィンドウのリサイズ
%group
iron_camera_mf
%prm
h, x, y, w, hh

%inst
親 HSP ウィンドウのリサイズに合わせて呼び出します。

%index
iron_cam_set_aspect
アスペクト比モード切替
%group
iron_camera_mf
%prm
h, mode
mode : 0=stretch (引き伸ばし) / 1=letterbox (アスペクト比固定 + 黒帯)

%index
iron_cam_state
カメラの現在状態を取得 (defcfunc)
%group
iron_camera_mf
%prm
h

%inst
0=FREE 1=OPENING 2=READY 3=ERROR を返します。
定数: IRON_CAM_FREE / OPENING / READY / ERROR

%index
iron_cam_save
スナップショットを画像ファイルに保存
%group
iron_camera_mf
%prm
h, "path"

%inst
拡張子で PNG/JPEG/BMP/GIF/TIFF を自動判別。WIC エンコード。

%index
iron_cam_read
最新フレームを byte 配列にコピー
%group
iron_camera_mf
%prm
h, var

%inst
BGRA32 (top-down) を var に書き込みます。
buffer サイズは width*height*4 必要。

%index
iron_cam_prop_get
カメラプロパティ値とレンジを取得
%group
iron_camera_mf ― プロパティ
%prm
h, prop_id, val, minv, maxv, step, defv, flags

%inst
プロパティ ID:
  0=Brightness 1=Contrast 2=Hue 3=Saturation 4=Sharpness 5=Gamma
  6=ColorEnable 7=WhiteBalance 8=BacklightCompensation 9=Gain
  10=Pan 11=Tilt 12=Roll 13=Zoom 14=Exposure 15=Iris 16=Focus

定数: IRON_CAM_PROP_BRIGHTNESS 等。

%index
iron_cam_prop_set
カメラプロパティ値を設定
%group
iron_camera_mf ― プロパティ
%prm
h, prop_id, val, flags

%inst
flags: 1=AUTO 2=MANUAL (0=デフォルト MANUAL)
定数: IRON_CAM_PROP_AUTO / IRON_CAM_PROP_MANUAL

%index
iron_cam_record
映像のみ MP4 録画開始
%group
iron_camera_mf ― 録画
%prm
h, "path", "vcodec", vbr

%inst
SinkWriter を構築して録画開始。
vcodec: "" (=H264) / "H264" / "HEVC" / "WMV9" / "VP9" / "MJPG"
vbr: ビットレート bps (0 = デフォルト 4 Mbps)

%href
iron_cam_record_av
iron_cam_record_stop

%index
iron_cam_record_av
音声 + 映像 同時録画開始
%group
iron_camera_mf ― 録画
%prm
h, "path", audio_dev, "vcodec", vbr, "acodec", abr

%inst
別 worker thread で audio_dev のオーディオキャプチャデバイスを開いて
SinkWriter に audio stream を追加して同時録画。

acodec: "" (=AAC) / "AAC" / "WMA" / "FLAC" / "MP3"
abr: 平均バイト/秒 (16000 = 128 kbps 相当)

%index
iron_cam_record_stop
録画停止 + finalize
%group
iron_camera_mf ― 録画
%prm
h

%index
iron_cam_close
カメラを閉じる
%group
iron_camera_mf
%prm
h

%inst
worker thread を停止 → child window を破棄 → 録画中なら自動 finalize。

;============================================================
; マイク単独 audio-only API (Phase 2-G)
;============================================================

%index
iron_mic_open
マイク (オーディオデバイス) を開く (defcfunc)
%group
iron_camera_mf ― マイク録音
%prm
dev_idx, sample_rate, channels, bits

%inst
defcfunc。指定オーディオデバイスを開いて worker thread 起動。
sample_rate=0 で 48000、channels=0 で 2、bits=0 で 16 がデフォルト。

戻り値: ハンドル / -1 失敗 / -2 フォーマット非対応

%href
iron_mic_close
iron_mic_save_wav
iron_mic_record

%index
iron_mic_close
マイクを閉じる
%group
iron_camera_mf ― マイク録音
%prm
h

%index
iron_mic_get_format
実 sample rate / ch / bits を取得
%group
iron_camera_mf ― マイク録音
%prm
h, var_sr, var_ch, var_bits

%inst
mfcam_audio_open でネゴ後の実フォーマットを返します。

%index
iron_mic_avail
リング内 PCM byte 数 (defcfunc)
%group
iron_camera_mf ― マイク録音
%prm
h

%index
iron_mic_read
リングから PCM を読み出す
%group
iron_camera_mf ― マイク録音
%prm
h, var_buf, max_bytes

%inst
worker が裏で蓄積した PCM を最大 max_bytes byte だけ var_buf にコピー。
取り出した分はリングから消えます。
stat に実際に読めた byte 数。

%index
iron_mic_save_wav
WAV ファイル直書き開始
%group
iron_camera_mf ― マイク録音
%prm
h, "path"

%inst
RIFF header + 生 PCM 直接書き込み。エンコード無し、低 CPU。
文字起こし用途 (whisper 向け 16kHz mono 16bit) に最適。

%index
iron_mic_save_wav_stop
WAV ファイル直書き停止
%group
iron_camera_mf ― マイク録音
%prm
h

%index
iron_mic_record
エンコード録音開始 (AAC/MP3/WMA/FLAC)
%group
iron_camera_mf ― マイク録音
%prm
h, "path", "codec", bitrate

%inst
SinkWriter で圧縮録音。codec="" で AAC デフォルト。
bitrate=0 で 128 kbps 相当。

%index
iron_mic_record_stop
エンコード録音停止
%group
iron_camera_mf ― マイク録音
%prm
h
