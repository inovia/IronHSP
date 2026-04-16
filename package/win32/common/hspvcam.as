;
;   hspvcam.as — 仮想ウェブカメラ プラグイン ヘッダー (IronHSP)
;
;   名前付き共有メモリ経由で BGRA フレームを外部ブリッジプロセスに供給し、
;   仮想カメラデバイスとして OBS / Zoom / Teams 等に映像を送信できます。
;
;   使い方:
;     #include "hspvcam.as"
;
#ifndef __hspvcam__
#define __hspvcam__

#uselib "hspvcam.dll"

; --- 仮想カメラの作成 ---
; vcam_create width, height, fps
;   stat にハンドル (> 0) が返る。失敗時は 0。
#cfunc global vcam_create_ "vcam_create" int, int, int

; --- BGRA バッファの送信 ---
; vcam_send_frame handle, bgra_ptr, size
;   stat = 0: 成功, -1: 失敗
#func global vcam_send_frame "vcam_send_frame" int, var, int

; --- スクリーン領域のキャプチャ送信 ---
; vcam_send_from_screen handle, x, y, w, h
;   stat = 0: 成功, -1: 失敗
#func global vcam_send_from_screen "vcam_send_from_screen" int, int, int, int, int

; --- カメラ情報の取得 ---
; vcam_get_info handle, var_w, var_h, var_fps
;   stat = 0: 成功, -1: 失敗
#func global vcam_get_info "vcam_get_info" int, var, var, var

; --- コンシューマ接続チェック ---
; vcam_is_connected(handle)
;   1: 接続中, 0: 未接続, -1: 無効ハンドル
#cfunc global vcam_is_connected "vcam_is_connected" int

; --- 仮想カメラの破棄 ---
; vcam_close handle
;   stat = 0: 成功, -1: 失敗
#func global vcam_close "vcam_close" int

#endif
