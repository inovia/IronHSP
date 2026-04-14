;
; hspmfcam.dll  HSP3 ヘルプ (日本語)
; Webcam / 仮想カメラ / キャプチャカードの取り込み + 録画
;

%type
拡張命令
%ver
1.0
%date
2026-04-14
%author
IronHSP / hspmfcam
%dll
hspmfcam.dll
%url
https://github.com/HNWorks/IronHSP_2026
%port
Win32 / Win64

%note
hspmfcam.dll は Microsoft Media Foundation (MF) を直接ラップして、
Webcam や仮想カメラ (OBS/NDI)、キャプチャカード (Magewell/Elgato/Blackmagic)
からの映像取り込み・録画を 1 行で行えるようにする C++ 製ヘルパ DLL です。

特徴:
  - 内部で worker thread + child window を作成 (MFPlay と同じ方式)
  - HSP main thread が title bar drag 等で停止しても映像は止まらない
  - 最大 256 デバイスを同時に open 可能
  - 自動デインターレース (キャプチャカードの 1080i 等にも対応)
  - PNG/JPEG/BMP/GIF/TIFF スナップショット保存 (WIC)
  - H.264/HEVC/WMV9/VP9/MJPG 録画 + AAC/WMA/FLAC/MP3 同時録音
  - カメラプロパティ (明るさ/露出/フォーカス等) アクセス

HSP 側からは package/win32/common/iron_camera_mf.hsp を include して
iron_cam_* 系のラッパ命令で扱うのが推奨です (raw API は mfcam_* 系)。

%index
mfcam_count
接続カメラ数を取得
%group
hspmfcam — デバイス列挙
%prm

%inst
システムに接続されている Video Capture デバイス
(Webcam, 仮想カメラ, キャプチャカード) の総数を返します。
ANSI 文字列。

%href
mfcam_get_name
mfcam_get_id
mfcam_audio_count

%index
mfcam_get_name
カメラ friendly name の取得
%group
hspmfcam — デバイス列挙
%prm
p1, p2, p3
p1=0~  : デバイスインデックス (0 から順)
p2     : 結果を格納する文字列変数
p3=1~  : 変数バッファサイズ

%inst
idx 番目のカメラの "friendly name" (例: "Logicool BRIO") を p2 に書き込みます。
HSP 側で sdim で予めバッファ確保しておくこと。

%href
mfcam_count
mfcam_get_id

%index
mfcam_get_id
カメラのユニーク ID (Symbolic Link) を取得
%group
hspmfcam — デバイス列挙
%prm
p1, p2, p3
p1=0~  : デバイスインデックス
p2     : 結果を格納する文字列変数 (1024 byte 推奨)
p3=1~  : 変数バッファサイズ

%inst
idx 番目のカメラの SymbolicLink (USB device path 等) を取得します。
friendly name と違って、同じ製品が複数接続されていても USB ポートごとに
ユニークな値になります。デバイスを記憶しておきたい場合に使用。

%href
mfcam_get_name

%index
mfcam_audio_count
オーディオキャプチャデバイス数
%group
hspmfcam — デバイス列挙
%prm

%inst
マイクや LineIn 等のオーディオキャプチャデバイスの総数を返します。

%href
mfcam_audio_get_name
mfcam_audio_get_id

%index
mfcam_audio_get_name
オーディオ friendly name 取得
%group
hspmfcam — デバイス列挙
%prm
p1, p2, p3
p1=0~ : インデックス
p2    : 文字列変数
p3=1~ : バッファサイズ

%inst
オーディオデバイスの friendly name を取得します。

%index
mfcam_audio_get_id
オーディオデバイスのユニーク ID 取得
%group
hspmfcam — デバイス列挙
%prm
p1, p2, p3
p1=0~ : インデックス
p2    : 文字列変数 (1024 byte 推奨)
p3=1~ : バッファサイズ

%inst
オーディオデバイスの WASAPI EndpointID を取得します。

%index
mfcam_format_count
カメラ対応フォーマット数
%group
hspmfcam — フォーマット列挙
%prm
p1
p1=0~ : デバイスインデックス

%inst
指定カメラがネイティブで対応している (解像度 × FPS × FOURCC) の
組み合わせ数を返します。例えば 1080p30/720p60/MJPG 1080p30 等が
別々にカウントされます。

%href
mfcam_format_get
mfcam_open_ex

%index
mfcam_format_get
対応フォーマット情報の取得
%group
hspmfcam — フォーマット列挙
%prm
p1, p2, p3, p4, p5, p6, p7, p8
p1=0~ : デバイスインデックス
p2=0~ : フォーマットインデックス
p3    : 幅 (out int 変数)
p4    : 高さ (out int 変数)
p5    : fps 分子 (out int 変数)
p6    : fps 分母 (out int 変数)
p7    : FOURCC (out 文字列変数, 32 byte 推奨)
p8=1~ : FOURCC バッファサイズ

%inst
idx 番目のカメラの fmt_idx 番目の対応フォーマットを取得します。
FOURCC は "NV12" "YUY2" "MJPG" "RGB32" 等の文字列。
fps は num/den 形式 (30 fps の場合 30/1)。

戻り値: 成功 1 / 失敗 0

%href
mfcam_format_count
mfcam_open_ex

%index
mfcam_open
カメラを開いて子ウィンドウにプレビュー表示
%group
hspmfcam — open / close
%prm
p1, p2, p3, p4, p5, p6, p7, p8
p1=0~      : デバイスインデックス
p2         : 親 HWND (HSP の hwnd システム変数を渡す)
p3, p4     : 子ウィンドウの x, y
p5, p6     : 子ウィンドウの幅, 高さ
p7         : 取得解像度 width (out int)
p8         : 取得解像度 height (out int)

%inst
idx 番目のカメラを開き、parent_hwnd の子ウィンドウ (位置 x,y サイズ w,h)
としてリアルタイムプレビューを表示します。内部で worker thread を起動して
MF SourceReader → StretchDIBits でフレーム描画を行います。

戻り値: ハンドル (>=0) / -1 失敗

ハンドルは mfcam_set_pos / mfcam_read / mfcam_record_start / mfcam_close
等の以降の呼び出しで使います。

最大 256 デバイスまで並列に open 可能。

%href
mfcam_open_ex
mfcam_close
mfcam_set_pos

%index
mfcam_open_ex
任意フォーマット指定でカメラを開く
%group
hspmfcam — open / close
%prm
p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12
p1=0~      : デバイスインデックス
p2         : 親 HWND
p3,p4,p5,p6: 表示位置 x,y,w,h
p7=0~      : 望む解像度 width (0=デフォルト)
p8=0~      : 望む解像度 height (0=デフォルト)
p9=0~      : 望む fps 分子 (0=デフォルト, 例 30)
p10=0~     : 望む fps 分母 (0=デフォルト, 例 1)
p11        : 取得解像度 width (out)
p12        : 取得解像度 height (out)

%inst
mfcam_open と同じだが、解像度と fps を指定して open できます。
内部では mfcam_format_get で得られる native フォーマット中、
desired_w/h/fps に最も近い type を選択 → 出力 RGB32 に変換します。

戻り値: ハンドル / -1 失敗

%href
mfcam_open
mfcam_format_count

%index
mfcam_set_pos
プレビュー子ウィンドウのリサイズ
%group
hspmfcam — レイアウト
%prm
p1, p2, p3, p4, p5
p1   : ハンドル
p2,p3: 新しい x, y
p4,p5: 新しい w, h

%inst
HSP の親ウィンドウがリサイズされた際などに、子ウィンドウを
追従させるために呼びます。

%index
mfcam_set_aspect
アスペクト比モードの切替
%group
hspmfcam — レイアウト
%prm
p1, p2
p1 : ハンドル
p2 : 0=stretch (引き伸ばし) / 1=letterbox (アスペクト比固定 + 黒帯)

%inst
プレビューの表示モードを切り替えます。
letterbox モードでは余白を黒で塗りつぶします。

%index
mfcam_get_state
カメラの現在状態
%group
hspmfcam — 状態
%prm
p1
p1 : ハンドル

%inst
カメラの状態を返します:
  0 = FREE     (スロット未使用)
  1 = OPENING  (worker 起動中、まだフレーム未取得)
  2 = READY    (再生中、フレーム取得可)
  3 = ERROR    (open 失敗 / 異常終了)

%index
mfcam_read
最新フレームを byte 配列にコピー
%group
hspmfcam — フレーム取得
%prm
p1, p2
p1 : ハンドル
p2 : BGRA32 を書き込む変数 (sdim _, w*h*4 で確保)

%inst
最新の取得済みフレームを BGRA32 (top-down) として p2 に書き込みます。
画像処理を HSP 側で行いたい場合に使用。

%href
mfcam_save_snapshot

%index
mfcam_save_snapshot
スナップショットをファイル保存
%group
hspmfcam — フレーム取得
%prm
p1, p2
p1 : ハンドル
p2 : 出力パス (拡張子で形式自動判別)

%inst
最新のフレームを画像ファイルとして保存します。
拡張子で形式が決まります:
  .png   → PNG
  .jpg   → JPEG
  .bmp   → BMP
  .gif   → GIF
  .tif   → TIFF

WIC (Windows Imaging Component) を使ったエンコードです。

%href
mfcam_read

%index
mfcam_prop_get
カメラプロパティ値とレンジ取得
%group
hspmfcam — プロパティ
%prm
p1, p2, p3, p4, p5, p6, p7, p8
p1 : ハンドル
p2 : プロパティ ID (下記参照)
p3 : 現在値 (out)
p4 : 最小値 (out)
p5 : 最大値 (out)
p6 : ステップ (out)
p7 : デフォルト値 (out)
p8 : flags (out, 1=AUTO 2=MANUAL)

%inst
カメラプロパティの現在値とレンジを取得します。

プロパティ ID:
  0 = Brightness    1 = Contrast      2 = Hue
  3 = Saturation    4 = Sharpness     5 = Gamma
  6 = ColorEnable   7 = WhiteBalance  8 = BacklightCompensation
  9 = Gain
 10 = Pan          11 = Tilt         12 = Roll
 13 = Zoom         14 = Exposure     15 = Iris
 16 = Focus

戻り値: 1=成功 / 0=失敗 (プロパティ非対応)

%href
mfcam_prop_set

%index
mfcam_prop_set
カメラプロパティ値の設定
%group
hspmfcam — プロパティ
%prm
p1, p2, p3, p4
p1 : ハンドル
p2 : プロパティ ID
p3 : 設定値
p4 : flags (1=AUTO, 2=MANUAL, 0=デフォルト MANUAL)

%inst
カメラプロパティを設定します。値の範囲は mfcam_prop_get で確認可能。

戻り値: 1=成功 / 0=失敗

%index
mfcam_record_start
映像のみ MP4 録画開始
%group
hspmfcam — 録画
%prm
p1, p2, p3, p4
p1 : ハンドル
p2 : 出力パス (例 "out.mp4")
p3 : 動画コーデック ("" or "H264" / "HEVC" / "WMV9" / "VP9" / "MJPG")
p4 : ビットレート bps (例 4000000 = 4 Mbps、0 でデフォルト 4 Mbps)

%inst
SinkWriter を構築して録画を開始します。worker thread が ReadSample で
取得したフレームを WriteSample にパススルーします。

戻り値: 1=成功 / 0=失敗 (open 失敗、コーデック非対応 等)

mfcam_record_stop で停止 + ファイル finalize されます。

%href
mfcam_record_start_av
mfcam_record_stop

%index
mfcam_record_start_av
音声 + 映像 同時録画開始
%group
hspmfcam — 録画
%prm
p1, p2, p3, p4, p5, p6, p7
p1 : ハンドル
p2 : 出力パス
p3 : 動画コーデック ("H264" 等)
p4 : 動画ビットレート
p5 : オーディオデバイスインデックス (mfcam_audio_count で取得)
p6 : 音声コーデック ("" or "AAC" / "WMA" / "FLAC" / "MP3")
p7 : 音声ビットレート (バイト/秒, 例 16000 = 128 kbps)

%inst
mfcam_record_start に加えて、別 worker thread で audio_dev_idx の
オーディオキャプチャデバイスを開き、SinkWriter に audio stream を
追加して映像と同時録画します。PCM 16bit 48kHz stereo を
指定コーデックで圧縮して muxer に流します。

戻り値: 1=成功 / 0=失敗

%href
mfcam_record_start
mfcam_record_stop
mfcam_audio_count

%index
mfcam_record_stop
録画停止 + finalize
%group
hspmfcam — 録画
%prm
p1
p1 : ハンドル

%inst
録画を停止して SinkWriter を finalize → release します。
audio worker thread も同時に停止。
mfcam_close でも自動的に呼ばれます。

%index
mfcam_close
カメラを閉じる
%group
hspmfcam — open / close
%prm
p1
p1 : ハンドル

%inst
worker thread を停止して child window を破棄、リソースを解放します。
録画中の場合は先に mfcam_record_stop を自動実行します。

%href
mfcam_open

;============================================================
; Audio-only capture API (Phase 2-G)
; マイク単独録音 + 生 PCM + WAV + エンコーダ録音
;============================================================

%index
mfcam_audio_open
オーディオデバイスを開いて worker thread 起動
%group
hspmfcam — audio capture
%prm
p1, p2, p3, p4
p1 : デバイスインデックス (mfcam_audio_count で取得)
p2 : sample rate (例 16000 / 44100 / 48000、0 で 48000)
p3 : channels (1=mono / 2=stereo、0 で 2)
p4 : bits per sample (8/16/24/32、0 で 16)

%inst
オーディオデバイスを open して MF SourceReader を起動。要求された PCM
フォーマットがネイティブと違っていても MF の Audio Resampler MFT が
自動で挿入されて変換されます (得られた format は mfcam_audio_get_format
で確認可能)。

戻り値: ハンドル (>=0) / -1 失敗 / -2 フォーマット非対応

最大 64 デバイス並列。

%href
mfcam_audio_close
mfcam_audio_get_format

%index
mfcam_audio_get_format
実際に得られた sample rate / ch / bits を取得
%group
hspmfcam — audio capture
%prm
p1, p2, p3, p4
p1 : ハンドル
p2 : 結果 sample rate (out int)
p3 : 結果 channels   (out int)
p4 : 結果 bits       (out int)

%inst
mfcam_audio_open でネゴ後の実フォーマットを返します。
要求と違うことがあるので録音前に必ず確認してください。

%index
mfcam_audio_pcm_avail
リングバッファに溜まっている PCM byte 数
%group
hspmfcam — audio capture
%prm
p1

%inst
worker thread が裏で取得した PCM の現在の蓄積量を返します。

%index
mfcam_audio_read_pcm
リングから PCM を取り出す
%group
hspmfcam — audio capture
%prm
p1, p2, p3
p1 : ハンドル
p2 : 結果 byte 配列 (sdim 済の char 変数)
p3 : 最大読み込み byte 数

%inst
リングバッファの先頭から指定 byte 数だけコピーして取り出します。
取り出した分はバッファから消えます。

戻り値: 実際に読めた byte 数

%index
mfcam_audio_save_wav_start
WAV ファイル直書き開始
%group
hspmfcam — audio capture
%prm
p1, p2
p1 : ハンドル
p2 : 出力 WAV パス

%inst
RIFF ヘッダを書いて、以降 worker が ReadSample で取得した PCM を直接
WriteFile します。エンコード無し、低 CPU、無圧縮。文字起こし用途向き。

%index
mfcam_audio_save_wav_stop
WAV ファイル直書き停止
%group
hspmfcam — audio capture
%prm
p1

%inst
RIFF/data チャンクサイズを finalize してファイルを閉じます。

%index
mfcam_audio_record_start
エンコード録音開始 (AAC/MP3/WMA/FLAC)
%group
hspmfcam — audio capture
%prm
p1, p2, p3, p4
p1 : ハンドル
p2 : 出力ファイルパス
p3 : codec ("" or "AAC" / "MP3" / "WMA" / "FLAC")
p4 : ビットレート (0 で 16000 = 128 kbps デフォルト)

%inst
SinkWriter を構築して圧縮録音を開始します。

%index
mfcam_audio_record_stop
エンコード録音停止 + finalize
%group
hspmfcam — audio capture
%prm
p1

%index
mfcam_audio_close
オーディオデバイスを閉じる
%group
hspmfcam — audio capture
%prm
p1

%inst
worker thread を停止 → reader release。
WAV / エンコード録音中の場合は自動で stop してくれます。
