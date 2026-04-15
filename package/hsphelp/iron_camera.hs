;
; iron_camera.hsp  HSP3 ヘルプ (日本語)
; hspcv4 ベース Webcam ラッパ
;

%type
拡張命令
%ver
1.0
%date
2026-04-14
%author
IronHSP / iron_camera
%dll
iron_camera.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_camera.hsp は hspcv4 (OpenCV 4.x) の VideoCapture を 1 行 API で
ラップした Webcam モジュールです。OpenCV は内部で MSMF を使うので
結果としては Media Foundation バックエンドです。

  #include "hspcv4.as"
  #include "iron_camera.hsp"

iron_camera_mf.hsp との違い:
  - 本モジュールは hspcv4 経由 (OpenCV 機能をフル活用したい時に便利)
  - iron_camera_mf は pure MF (hspmfcam.dll 経由)

%group
iron_camera (Webカメラ)

%index
iron_camera_open
カメラを開く
%group
iron_camera
%prm
[dev_idx]
dev_idx : デバイス番号 (省略時 0 = 先頭)

%inst
cv4_video_open でカメラを開きます。

戻り値: 0=成功 / -1=失敗

%href
iron_camera_close

%index
iron_camera_read
1 フレーム取得
%group
iron_camera
%prm

%inst
cv4_video_read で 1 フレームを内部画像 ID に取り込みます。

戻り値: stat = 0 成功 / 1 終端

%index
iron_camera_draw
カレント HSP window に描画
%group
iron_camera
%prm
[x, y]
x, y : 描画位置 (省略時 0,0)

%inst
内部画像を cv4getimg 経由で HSP の現在ウィンドウに描画します。
呼び出し前後を redraw 0 / redraw 1 で囲んでください。

%index
iron_camera_save
現在フレームを画像ファイルに保存
%group
iron_camera
%prm
"path"

%inst
cv4save で画像ファイルとして保存します。
拡張子で形式自動判別 (PNG/JPEG/BMP/TIFF...)。

%index
iron_camera_size
カメラ解像度を取得
%group
iron_camera
%prm
var_w, var_h

%inst
カメラのネイティブ解像度を w, h に書き込みます。

%index
iron_camera_close
カメラを閉じる
%group
iron_camera
%prm

%inst
cv4_video_close でカメラを解放します。
