;
;   iron_vcam.hs - HSP Help Manager 用ヘルプソース
;   hspvcam プラグイン (仮想ウェブカメラ) のコマンドリファレンス
;

%type
拡張命令
%ver
0.1
%note
hspvcam.as をインクルードすること。
iron_vcam.hsp を使用する場合は iron_vcam.hsp をインクルードすること。
%date
2026/04/18
%author
HNWorks / IronHSP
%dll
hspvcam
%url
https://github.com/
%port
Win



;==========================================================================
; 仮想カメラの基本操作
;==========================================================================

%group
hspvcam (仮想ウェブカメラ)

%index
vcam_create
仮想カメラの作成
%group
hspvcam 基本操作
%prm
w, h, fps
w : フレーム幅 (int, ピクセル)
h : フレーム高さ (int, ピクセル)
fps : フレームレート (int, 例: 30)
%inst
指定した解像度・フレームレートで仮想カメラを作成します。
内部的には名前付き共有メモリとイベントオブジェクトが生成され、
外部のブリッジプロセスがフレームデータを読み出せるようになります。

stat にハンドル (正の整数) が返ります。0 の場合は作成失敗です。

一般的な解像度の例:
  640, 480, 30    (VGA, 30fps)
  1280, 720, 30   (HD, 30fps)
  1920, 1080, 30  (Full HD, 30fps)

iron_vcam.hsp をインクルードしている場合は、モジュール版の
vcam_create 命令が使用されます。
%sample
    #include "iron_vcam.hsp"
    vcam_create 640, 480, 30
    cam = stat
    if cam == 0 {
        dialog "仮想カメラの作成に失敗しました"
        end
    }
    mes "仮想カメラ作成: handle=" + cam
%href
vcam_close,vcam_send,vcam_send_frame



%index
vcam_send
カレントスクリーンの送信
%group
hspvcam 基本操作
%prm
handle
handle : vcam_create で取得したハンドル (int)
%inst
HSP のカレントウィンドウ全体をキャプチャして仮想カメラに送信します。
内部で ginfo を使ってウィンドウのスクリーン座標とサイズを取得し、
デスクトップ DC から BitBlt / StretchBlt でキャプチャします。

キャプチャしたフレームは共有メモリに書き込まれ、フレームカウンタが
インクリメントされます。

この命令は iron_vcam.hsp をインクルードした場合に利用できます。
hspvcam.as のみの場合は vcam_send_from_screen を直接使用してください。

stat = 0: 成功, -1: 失敗
%sample
    #include "iron_vcam.hsp"
    vcam_create 640, 480, 30
    cam = stat
    repeat
        redraw 0
        color 0, 0, 0 : boxf
        color 255, 255, 255
        pos 10, 10 : mes "フレーム: " + cnt
        redraw 1
        vcam_send cam
        await 33
    loop
%href
vcam_send_region,vcam_send_buffer,vcam_send_from_screen



%index
vcam_send_region
スクリーン領域の送信
%group
hspvcam 基本操作
%prm
handle, x, y, w, h
handle : vcam_create で取得したハンドル (int)
x : キャプチャ開始 X 座標 (int, スクリーン座標)
y : キャプチャ開始 Y 座標 (int, スクリーン座標)
w : キャプチャ幅 (int)
h : キャプチャ高さ (int)
%inst
スクリーン上の指定矩形領域をキャプチャして仮想カメラに送信します。
キャプチャ領域が仮想カメラの解像度と異なる場合は自動でストレッチ
(リサイズ) されます。

座標はスクリーン座標で指定します。
HSP ウィンドウの座標は ginfo_wx1 / ginfo_wy1 で取得できます。

この命令は iron_vcam.hsp をインクルードした場合に利用できます。

stat = 0: 成功, -1: 失敗
%href
vcam_send,vcam_send_buffer



%index
vcam_send_buffer
BGRA バッファの送信
%group
hspvcam 基本操作
%prm
handle, buf
handle : vcam_create で取得したハンドル (int)
buf : BGRA ピクセルデータ変数 (var)
%inst
BGRA 形式のピクセルデータを直接仮想カメラに送信します。
buf には width * height * 4 バイト以上のデータが格納されて
いる必要があります。

ピクセルフォーマットは BGRA (Blue, Green, Red, Alpha) の
4 バイト/ピクセルです。Alpha チャンネルは通常 255 を指定します。

この命令は iron_vcam.hsp をインクルードした場合に利用できます。

stat = 0: 成功, -1: 失敗
%sample
    #include "iron_vcam.hsp"
    w = 640 : h = 480
    vcam_create w, h, 30
    cam = stat
    ; BGRA バッファを作成
    sz = w * h * 4
    sdim buf, sz
    ; 赤一色で塗りつぶし
    repeat w * h
        poke buf, cnt * 4 + 0, 0     ; B
        poke buf, cnt * 4 + 1, 0     ; G
        poke buf, cnt * 4 + 2, 255   ; R
        poke buf, cnt * 4 + 3, 255   ; A
    loop
    vcam_send_buffer cam, buf
%href
vcam_send,vcam_send_frame



%index
vcam_send_frame
BGRA バッファの低レベル送信
%group
hspvcam 低レベル API
%prm
handle, buf, size
handle : vcam_create で取得したハンドル (int)
buf : BGRA ピクセルデータ変数 (var)
size : データサイズ (int, バイト)
%inst
BGRA 形式のピクセルデータを指定サイズで送信します。
hspvcam.as の低レベル関数です。

通常は iron_vcam.hsp の vcam_send_buffer を使用してください。
この関数ではサイズを明示的に指定する必要があります。

stat = 0: 成功, -1: 失敗
%href
vcam_send_buffer



%index
vcam_send_from_screen
スクリーン領域の低レベルキャプチャ送信
%group
hspvcam 低レベル API
%prm
handle, x, y, w, h
handle : vcam_create で取得したハンドル (int)
x : キャプチャ開始 X 座標 (int, スクリーン座標)
y : キャプチャ開始 Y 座標 (int, スクリーン座標)
w : キャプチャ幅 (int, 0 で仮想カメラ幅)
h : キャプチャ高さ (int, 0 で仮想カメラ高さ)
%inst
デスクトップのスクリーン DC から指定矩形を BitBlt / StretchBlt で
キャプチャし、仮想カメラの共有メモリに書き込みます。
w, h に 0 を指定すると仮想カメラの解像度がそのまま使われます。

hspvcam.as の低レベル関数です。

stat = 0: 成功, -1: 失敗
%href
vcam_send_region



%index
vcam_get_info
仮想カメラ情報の取得
%group
hspvcam 基本操作
%prm
handle, var_w, var_h, var_fps
handle : vcam_create で取得したハンドル (int)
var_w : 幅を受け取る変数 (var)
var_h : 高さを受け取る変数 (var)
var_fps : FPS を受け取る変数 (var)
%inst
指定ハンドルの仮想カメラの解像度とフレームレートを取得します。

stat = 0: 成功, -1: 失敗
%sample
    #include "hspvcam.as"
    h = vcam_create_(640, 480, 30)
    vcam_get_info h, w, h2, fps
    mes "幅=" + w + " 高さ=" + h2 + " FPS=" + fps
%href
vcam_create



%index
vcam_is_connected
コンシューマ接続チェック
%group
hspvcam 基本操作
%prm
(handle)
handle : vcam_create で取得したハンドル (int)
%inst
仮想カメラブリッジプロセス (コンシューマ) が共有メモリを読み出して
いるかどうかを確認します。

ブリッジプロセスは共有メモリヘッダの consumer_alive フィールドに
非 0 を書き込むことで接続を通知します。

戻り値:
  1: コンシューマが接続中
  0: 未接続
  -1: 無効なハンドル
%sample
    #include "hspvcam.as"
    h = vcam_create_(640, 480, 30)
    if vcam_is_connected(h) {
        mes "ブリッジプロセスが接続中です"
    } else {
        mes "ブリッジプロセスが未接続です"
    }
%href
vcam_create



%index
vcam_close
仮想カメラの破棄
%group
hspvcam 基本操作
%prm
handle
handle : vcam_create で取得したハンドル (int)
%inst
仮想カメラを破棄し、共有メモリとイベントオブジェクトを解放します。
プログラム終了時には自動的に全ハンドルが解放されますが、
明示的に解放するのが推奨です。

stat = 0: 成功, -1: 失敗
%sample
    #include "iron_vcam.hsp"
    vcam_create 640, 480, 30
    cam = stat
    ; ... 使用 ...
    vcam_close cam
%href
vcam_create
