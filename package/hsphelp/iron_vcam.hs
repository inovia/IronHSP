;
;   iron_vcam.hs - HSP Help Manager 用ヘルプソース
;   hspvcam プラグイン (DirectShow 仮想ウェブカメラ) のコマンドリファレンス
;

%type
拡張命令
%ver
3.8
%note
hspvcam.as をインクルードすること。
iron_vcam.hsp を使用する場合は iron_vcam.hsp をインクルードすること。
%date
2026/04/18
%author
IronHSP
%dll
hspvcam
%url
https://github.com/
%port
Win



;==========================================================================
; 基本 API (iron_vcam.hsp)
;==========================================================================

%group
hspvcam 基本命令

%index
vcam_init
仮想カメラの初期化
%group
hspvcam 基本命令
%prm
w, h, fps
w : フレーム幅 (int, ピクセル)
h : フレーム高さ (int, ピクセル)
fps : フレームレート (int, 例: 30)
%inst
指定した解像度・フレームレートで仮想カメラを初期化します。
内部では名前付き共有メモリとイベントオブジェクトを作成し、
DirectShow フィルタ側がフレームデータを読み出せるようにします。

事前に管理者権限のコマンドプロンプトで以下を実行し、
DirectShow フィルタを登録しておく必要があります:

  regsvr32 hspvcam.dll

stat = 0: 成功, -1: 失敗

一般的な解像度の例:
  640, 480, 30    (VGA, 30fps)
  1280, 720, 30   (HD, 30fps)
  1920, 1080, 30  (Full HD, 30fps)

この命令は iron_vcam.hsp をインクルードした場合に利用できます。
%sample
    #include "iron_vcam.hsp"
    vcam_init 640, 480, 30
    if stat != 0 {
        dialog "仮想カメラの初期化に失敗しました"
        end
    }
    mes "仮想カメラを初期化しました"
%href
vcam_term,vcam_send,vcam_create



%index
vcam_send
カレントスクリーンの送信
%group
hspvcam 基本命令
%prm
(パラメータなし)
%inst
HSP のカレントウィンドウ全体をキャプチャして仮想カメラに送信します。
内部で ginfo を使ってウィンドウのスクリーン座標とサイズを取得し、
デスクトップ DC から BitBlt でキャプチャ後、共有メモリに書き込みます。

カレントウィンドウのサイズが仮想カメラの解像度と異なる場合は
自動的にストレッチ (リサイズ) されます。

redraw 1 のあと (描画完了後) に呼び出してください。

stat = 0: 成功, -1: 失敗

この命令は iron_vcam.hsp をインクルードした場合に利用できます。
%sample
    #include "iron_vcam.hsp"
    vcam_init 640, 480, 30
    if stat != 0 : end
    screen 0, 640, 480
    repeat
        redraw 0
        color 0, 0, 0 : boxf
        color 255, 255, 255
        pos 10, 10 : mes "フレーム: " + cnt
        redraw 1
        vcam_send
        await 33
    loop
%href
vcam_send_region,vcam_send_buffer,vcam_init



%index
vcam_send_region
スクリーン領域の送信
%group
hspvcam 基本命令
%prm
x, y, w, h
x : キャプチャ開始 X 座標 (int, スクリーン座標)
y : キャプチャ開始 Y 座標 (int, スクリーン座標)
w : キャプチャ幅 (int)
h : キャプチャ高さ (int)
%inst
スクリーン上の指定矩形領域をキャプチャして仮想カメラに送信します。
キャプチャ領域が仮想カメラの解像度と異なる場合は自動的にストレッチ
されます。

座標はスクリーン座標で指定します。
HSP ウィンドウの座標は ginfo_wx1 / ginfo_wy1 で取得できます。

stat = 0: 成功, -1: 失敗

この命令は iron_vcam.hsp をインクルードした場合に利用できます。
%href
vcam_send,vcam_send_buffer



%index
vcam_send_buffer
BGRA バッファの送信
%group
hspvcam 基本命令
%prm
buf
buf : BGRA ピクセルデータ変数 (var)
%inst
BGRA 形式のピクセルデータを直接仮想カメラに送信します。
buf には width * height * 4 バイト以上のデータが格納されて
いる必要があります。

ピクセルフォーマットは BGRA (Blue, Green, Red, Alpha) の
4 バイト/ピクセルです。Alpha チャンネルは通常 255 を指定します。
走査方向はトップダウン (先頭バイトが左上ピクセル) です。

stat = 0: 成功, -1: 失敗

この命令は iron_vcam.hsp をインクルードした場合に利用できます。
%sample
    #include "iron_vcam.hsp"
    w = 640 : h = 480
    vcam_init w, h, 30
    if stat != 0 : end
    ; BGRA バッファを作成 (赤一色)
    sz = w * h * 4
    sdim buf, sz
    repeat w * h
        poke buf, cnt * 4 + 0, 0     ; B
        poke buf, cnt * 4 + 1, 0     ; G
        poke buf, cnt * 4 + 2, 255   ; R
        poke buf, cnt * 4 + 3, 255   ; A
    loop
    vcam_send_buffer buf
%href
vcam_send,vcam_send_frame



%index
vcam_is_active
フィルタ接続チェック
%group
hspvcam 基本命令
%prm
()
%inst
DirectShow 仮想カメラフィルタが消費側アプリケーション (Zoom, Teams,
OBS 等) によって接続されているかどうかを返します。

仮想カメラフィルタは消費側アプリのプロセス内で動作するため、
アプリがカメラを選択してストリーミングを開始すると、
共有メモリの consumer_alive フラグが 1 になります。

戻り値:
  1: 接続中 (フィルタがフレームを読み出している)
  0: 未接続

この関数は iron_vcam.hsp をインクルードした場合に利用できます。
%sample
    #include "iron_vcam.hsp"
    vcam_init 640, 480, 30
    if stat != 0 : end
    if vcam_is_active() {
        mes "仮想カメラは接続中です"
    } else {
        mes "仮想カメラは未接続です"
    }
%href
vcam_init,vcam_is_connected



%index
vcam_term
仮想カメラの終了
%group
hspvcam 基本命令
%prm
(パラメータなし)
%inst
仮想カメラを終了し、共有メモリとイベントオブジェクトを解放します。
プログラム終了時には自動的に解放されますが、
明示的に解放するのが望ましいです。

stat = 0: 成功, -1: 失敗
%sample
    #include "iron_vcam.hsp"
    vcam_init 640, 480, 30
    if stat != 0 : end
    ; ... 使用 ...
    vcam_term
    end
%href
vcam_init



;==========================================================================
; 低レベル API (hspvcam.as)
;==========================================================================

%index
vcam_create
仮想カメラの作成 (低レベル)
%group
hspvcam 低レベル API
%prm
w, h, fps
w : フレーム幅 (int, ピクセル)
h : フレーム高さ (int, ピクセル)
fps : フレームレート (int)
%inst
hspvcam.dll の低レベル関数です。共有メモリとイベントを作成します。

通常は iron_vcam.hsp の vcam_init を使用してください。

stat = 0: 成功, -1: 失敗
%href
vcam_init,vcam_send_frame,vcam_close



%index
vcam_send_frame
BGRA バッファの低レベル送信
%group
hspvcam 低レベル API
%prm
buf, size
buf : BGRA ピクセルデータ変数 (var)
size : データサイズ (int, バイト)
%inst
BGRA 形式のピクセルデータを指定サイズで共有メモリに書き込みます。
hspvcam.dll の低レベル関数です。

通常は iron_vcam.hsp の vcam_send_buffer を使用してください。

stat = 0: 成功, -1: 失敗
%href
vcam_send_buffer,vcam_create



%index
vcam_is_connected
コンシューマ接続チェック (低レベル)
%group
hspvcam 低レベル API
%prm
()
%inst
共有メモリの consumer_alive フラグを確認します。
DirectShow フィルタが消費側プロセスで動作中なら 1 を返します。

通常は iron_vcam.hsp の vcam_is_active() を使用してください。

戻り値:
  1: 接続中
  0: 未接続
%href
vcam_is_active,vcam_create



%index
vcam_close
仮想カメラの破棄 (低レベル)
%group
hspvcam 低レベル API
%prm
(パラメータなし)
%inst
共有メモリとイベントオブジェクトを解放します。
hspvcam.dll の低レベル関数です。

通常は iron_vcam.hsp の vcam_term を使用してください。

stat = 0: 成功, -1: 失敗
%href
vcam_term,vcam_create
