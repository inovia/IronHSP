;============================================================
;   iron_dxlib.as — hsp3dx ランタイム専用の DxLib 拡張命令
;
;   HSP3Dish hgimg4.as と同じく #regcmd / #cmd メカニズムで
;   独自キーワードを opcode に割り当てる。
;
;   ランタイム (hsp3dx.exe) の extcmd ハンドラが opcode 0x100〜 を
;   処理する前提。ユーザーは `#include "iron_dxlib.as"` するだけで
;   dx_* 命令が使えるようになる。
;
;   hspcmp 改造も #uselib も不要。
;============================================================
#ifndef __iron_dxlib_as__
#define __iron_dxlib_as__

#regcmd 9

;  自動生成の DxLib 全 binding (opcode 0x200〜) を取り込む
#include "iron_dxlib_auto.as"
;  関数形式 (#ccmd、opcode 0x300〜 EXTSYSVAR) — v = dx_Xxx_f(args) で呼べる
#include "iron_dxlib_auto_f.as"
;  iron_dxlib_auto_f.as 内の #regcmd 10 で pptype が書き換わるので、以降の
;  手書き #cmd は EXTCMD として登録するため 9 に戻す。
#regcmd 9

;  ---- アンチエイリアス描画 (DxLib 独自、HSP 標準にない) ----
;      直接版は auto-gen の dx_DrawCircleAA / dx_DrawLineAA / dx_DrawBoxAA /
;      dx_DrawTriangle / dx_DrawModiGraph も利用可能。
;      以下の _s サフィックス付きは簡易ラッパ (引数少なめ・内部でデフォルト値補完)。
#cmd dx_drawcircleaa_s $100     ; dx_drawcircleaa_s x, y, r, color [, fill, thickness]
#cmd dx_drawmodigraph_s $104    ; dx_drawmodigraph_s srcID, x1,y1, x2,y2, x3,y3, x4,y4 (引数順 IronHSP 独自)

;  ---- ジョイパッド入力 ----
#cmd dx_getjoypad      $110     ; dx_getjoypad var [, pad_no] — ビットフィールドを var に
#cmd dx_joyanalog      $111     ; dx_joyanalog xvar, yvar [, pad_no] — アナログ L スティック

;  ---- 画面フィルタ / エフェクト ----
#cmd dx_setwaitvsync   $120     ; dx_setwaitvsync flag — VSync 待機 ON/OFF
#cmd dx_setfullscreen  $121     ; dx_setfullscreen flag — フルスクリーン切替
#cmd dx_setscreenfit   $122     ; dx_setscreenfit flag — 画面フィット (0=比率維持 letterbox(default) / 1=ストレッチ比率無視 / 2=ピクセル等倍(予約))
#cmd dx_getdispsize    $123     ; dx_getdispsize wvar, hvar — 端末/デスクトップのネイティブ解像度を取得 (screen 0, wvar, hvar の組で使う)
#cmd dx_getmtouchnum   $124     ; dx_getmtouchnum — 現在のタッチ本数を stat に
#cmd dx_getmtouch      $125     ; dx_getmtouch index, xvar, yvar — index 番目のタッチ座標を取得 (index は 0..dx_getmtouchnum-1)

;  ---- Phase 5.2: 3D プリミティブ / カメラ ----
;      直接版は auto-gen の dx_SetCameraPositionAndTarget_UpVecY / dx_DrawSphere3D / dx_DrawCube3D / dx_SetUseLighting も利用可能。
#cmd dx_setcamerapos   $130     ; dx_setcamerapos cx, cy, cz, tx, ty, tz  視点 (cx,cy,cz) → 注視点 (tx,ty,tz)
#cmd dx_setcameraperspective $131  ; dx_setcameraperspective fov_deg  視野角 (度、DxLib は内部で rad 換算)
#cmd dx_drawsphere3d_s $132     ; dx_drawsphere3d_s x, y, z, r, divnum, difcol, spccol, fill (スカラー xyz 版)
#cmd dx_drawcube3d_s   $133     ; dx_drawcube3d_s x1,y1,z1, x2,y2,z2, difcol, spccol, fill (スカラー xyz 版)
#cmd dx_setbgcolor3d   $134     ; dx_setbgcolor3d r, g, b  3D 背景色
#cmd dx_setlightdir    $136     ; dx_setlightdir dx, dy, dz — 平行光源の方向
#cmd dx_setzbuffer     $137     ; dx_setzbuffer flag — Z バッファ (深度テスト) ON/OFF

;  ---- Phase 5.2: 3D モデル ----
#cmd dx_mv1load        $140     ; dx_mv1load "file" — stat にハンドル (-1=失敗)
#cmd dx_mv1draw        $141     ; dx_mv1draw handle
#cmd dx_mv1setpos      $142     ; dx_mv1setpos handle, x, y, z
#cmd dx_mv1setrot      $143     ; dx_mv1setrot handle, rx, ry, rz (radians)
#cmd dx_mv1setscale_s  $144     ; dx_mv1setscale_s handle, sx, sy, sz (直接版は dx_MV1SetScale)
#cmd dx_mv1delete      $145     ; dx_mv1delete handle

;  ---- Phase 5.2: 動画再生 ----
#cmd dx_loadmovie      $150     ; dx_loadmovie "file", ID — graph handle として buffer[ID] に
#cmd dx_playmoviegraph $151     ; dx_playmoviegraph ID
#cmd dx_pausemoviegraph $152    ; dx_pausemoviegraph ID
#cmd dx_stopmoviegraph $153     ; dx_stopmoviegraph ID

;  ---- Phase 5.4a: HTTP クライアント (Win = WinHTTP / iOS/Android は Phase 3,4) ----
#cmd dx_http_set_timeout $160   ; dx_http_set_timeout ms
#cmd dx_http_set_header  $161   ; dx_http_set_header "Header: value\r\n..." (空でクリア)
#cmd dx_http_get         $162   ; dx_http_get "url", var_body  (stat = status code)
#cmd dx_http_post        $163   ; dx_http_post "url", "body", var_body, "content-type"
#cmd dx_http_set_user_agent $164   ; dx_http_set_user_agent "MyApp/1.0"
#cmd dx_http_put           $165   ; dx_http_put "url", "body", var_body, "ctype"
#cmd dx_http_delete        $166   ; dx_http_delete "url", var_body
#cmd dx_http_patch         $167   ; dx_http_patch "url", "body", var_body, "ctype"
#cmd dx_http_download      $168   ; dx_http_download "url", "path"  (stat=status)
#cmd dx_http_get_res_header $169  ; dx_http_get_res_header "name", var_val (stat=0 見つかった / 1 無し)
#cmd dx_http_set_basic_auth $16a  ; dx_http_set_basic_auth "user", "pass"
#cmd dx_http_cookie_clear  $16b   ; dx_http_cookie_clear (セッションリセット)
#cmd dx_http_cookie_enable $16c   ; dx_http_cookie_enable flag (0=無効 / 1=有効)

;  ---- Phase M.2: Key-Value 設定永続 (Win=INI, iOS=UserDefaults, Android=SharedPreferences) ----
#cmd dx_pref_set_str   $178   ; dx_pref_set_str "section", "key", "value"
#cmd dx_pref_set_int   $179   ; dx_pref_set_int "section", "key", int_value
#cmd dx_pref_get_str   $17a   ; dx_pref_get_str "section", "key", var_buf [, "default"]
#cmd dx_pref_get_int   $17b   ; dx_pref_get_int "section", "key" [, default] (stat=値)
#cmd dx_pref_remove    $17c   ; dx_pref_remove "section", "key"
#cmd dx_pref_clear     $17d   ; dx_pref_clear "section"  (section="" で全消去)
#cmd dx_pref_exists    $17e   ; dx_pref_exists "section", "key"  (stat=1 存在 / 0 無し)
#cmd dx_pref_set_double $17f  ; dx_pref_set_double "section", "key", double_value
#cmd dx_pref_get_double $194  ; dx_pref_get_double "section", "key", var_double [, default]
#cmd dx_pref_list_keys  $195  ; dx_pref_list_keys "section", var_str  (stat=件数、var に \n 区切りで格納)

;  ---- Phase M.3: アプリライフサイクルイベント ----
;      onevents <DX_EVT_*>, *label  で登録。通知時に *label へ gosub で飛ぶ。
#cmd onevents           $196  ; onevents event_id, *label  (label 省略で登録解除)

#const global DX_EVT_APP_BACKGROUND      0
#const global DX_EVT_APP_FOREGROUND      1
#const global DX_EVT_APP_WILL_TERMINATE  2
#const global DX_EVT_APP_LOW_MEMORY      3
#const global DX_EVT_ORIENTATION_CHANGED 4

;  ---- Phase M.4: デバイス情報 / 制御 (権限不要系) ----
#cmd dx_dev_vibrate      $1b0  ; dx_dev_vibrate ms  (Android は VIBRATE 権限、iOS は ms 無視)
#cmd dx_dev_is_dark      $1b1  ; dx_dev_is_dark  (stat=1 ダーク / 0 ライト)
#cmd dx_dev_battery      $1b2  ; dx_dev_battery var_level, var_state  (level=0..100 / -1、state=0..2 / -1)
#cmd dx_dev_orientation  $1b3  ; dx_dev_orientation  (stat=0..3: portrait/landscapeL/upside/landscapeR)
#cmd dx_dev_sound        $1b4  ; dx_dev_sound id  (iOS SystemSoundID、他は無視して短ビープ)
#cmd dx_dev_accel        $1b5  ; dx_dev_accel var_x, var_y, var_z    (double、初回呼び出しで自動 start)
#cmd dx_dev_gyro         $1b6  ; dx_dev_gyro  var_x, var_y, var_z    (double、rad/s)
#cmd dx_dev_attitude     $1b7  ; dx_dev_attitude var_roll, var_pitch, var_yaw (double、radian)

;  ---- Phase M.6: 権限要系 (GPS / トーチ) ----
#cmd dx_dev_gps_start      $1b8 ; dx_dev_gps_start  (初回で位置情報権限を要求)
#cmd dx_dev_gps_stop       $1b9 ; dx_dev_gps_stop
#cmd dx_dev_gps_get        $1ba ; dx_dev_gps_get var_lat, var_lng  (double、未 fix 時 0,0)
#cmd dx_dev_gps_status     $1bb ; dx_dev_gps_status  (stat=0 未開始 / 1 要求中 / 2 稼働 / 3 denied)
#cmd dx_dev_torch          $1bc ; dx_dev_torch on  (0=off, 1=on)
#cmd dx_dev_torch_supported $1bd ; dx_dev_torch_supported (stat=1 対応/0 非対応)
#cmd dx_dev_mic_start      $1be ; dx_dev_mic_start  (マイクレベル測定開始、RECORD_AUDIO 権限)
#cmd dx_dev_mic_stop       $1bf ; dx_dev_mic_stop
#cmd dx_dev_mic_level      $1c0 ; dx_dev_mic_level  (stat=0..100 瞬間音量、未開始は -1)
#cmd dx_dev_biometric_auth $1c1 ; dx_dev_biometric_auth "reason"  (stat=1 成功/0 失敗/-1 未対応)

;  ---- Phase 5.4a+: multipart/form-data ファイルアップロード ----
#cmd dx_http_mp_begin      $170   ; dx_http_mp_begin
#cmd dx_http_mp_add_text   $171   ; dx_http_mp_add_text "name", "value"
#cmd dx_http_mp_add_file   $172   ; dx_http_mp_add_file "name", "path" [, "ctype", "disp_filename"]
#cmd dx_http_mp_post       $173   ; dx_http_mp_post "url", var_body (stat=status)
#cmd dx_http_mp_end        $174   ; dx_http_mp_end

;  ---- Phase 5.4b: JSON (picojson ラッパ) ----
;      path は "user.items[0].name" 形式 (空文字でルート)
#cmd dx_json_parse         $180   ; dx_json_parse "src"  (stat=handle / -1)
#cmd dx_json_new_obj       $181   ; dx_json_new_obj      (stat=handle)
#cmd dx_json_new_arr       $182   ; dx_json_new_arr      (stat=handle)
#cmd dx_json_free          $183   ; dx_json_free handle
#cmd dx_json_stringify     $184   ; dx_json_stringify handle, var [, pretty]
#cmd dx_json_type          $185   ; dx_json_type handle, "path"    (stat=0..5 / -1)
#cmd dx_json_size          $186   ; dx_json_size handle, "path"    (stat=length / -1)
#cmd dx_json_key           $187   ; dx_json_key handle, "path", idx, var
#cmd dx_json_get_str       $188   ; dx_json_get_str handle, "path", var [, "default"]
#cmd dx_json_get_int       $189   ; dx_json_get_int handle, "path" [, default]  (stat=int)
#cmd dx_json_get_double    $18a   ; dx_json_get_double handle, "path", var_d
#cmd dx_json_get_bool      $18b   ; dx_json_get_bool handle, "path" [, default] (stat=0/1)
#cmd dx_json_set_str       $18c   ; dx_json_set_str handle, "path", "value"
#cmd dx_json_set_int       $18d   ; dx_json_set_int handle, "path", int_val
#cmd dx_json_set_double    $18e   ; dx_json_set_double handle, "path", double_var
#cmd dx_json_set_bool      $18f   ; dx_json_set_bool handle, "path", flag
#cmd dx_json_set_null      $190   ; dx_json_set_null handle, "path"
#cmd dx_json_set_obj       $191   ; dx_json_set_obj handle, "path"  (空 object)
#cmd dx_json_set_arr       $192   ; dx_json_set_arr handle, "path"  (空 array)
#cmd dx_json_remove        $193   ; dx_json_remove handle, "path"

;  ---- Phase 5.4c: WebSocket (ws:// / wss://、WinHTTP WebSocket API) ----
;      非同期受信はランタイム側 background thread で処理される
#cmd dx_ws_connect         $1a0   ; dx_ws_connect "url" [, "Hdr: val\r\n...", timeout_ms] (stat=handle/-1)
#cmd dx_ws_close           $1a1   ; dx_ws_close handle [, close_code]
#cmd dx_ws_free            $1a2   ; dx_ws_free handle
#cmd dx_ws_send_text       $1a3   ; dx_ws_send_text handle, "msg"
#cmd dx_ws_send_binary     $1a4   ; dx_ws_send_binary handle, var, size
#cmd dx_ws_recv            $1a5   ; dx_ws_recv handle, var [, timeout_ms] (stat: 0=TEXT / 1=BIN / -1=closed / -2=timeout, strsize=bytes)
#cmd dx_ws_status          $1a6   ; dx_ws_status handle (stat: 0=OPEN / 1=CONNECTING / 2=CLOSING / 3=CLOSED)

;  ---- Phase 5.5b の VECTOR 3D プリミティブは Phase 5.5l で廃止 ----
;      auto-gen の dx_DrawLine3D / dx_DrawTriangle3D / dx_DrawCapsule3D /
;      dx_DrawCone3D / dx_DrawCube3D が全く同じ引数仕様で使える。

;  ---- Phase 5.5n: 3D/2D Polygon/Primitive (頂点配列 + インデックス配列版) ----
;      HSP 側は #defstruct VERTEX3D (VECTOR pos + VECTOR norm + COLOR_U8 dif/spc + float u,v,su,sv)
;      を定義し、stdim verts, VERTEX3D, N で配列確保して渡す。
;      インデックスは #field short i[N] NSTRUCT か HSP 標準 int 配列。
#cmd dx_DrawPolygon3D               $1e0  ; verts, polyNum, grHandle [, transFlag]
#cmd dx_DrawPolygonIndexed3D        $1e1  ; verts, vNum, idx_short, polyNum, grHandle [, transFlag]
#cmd dx_DrawPolygon32bitIndexed3D   $1e2  ; verts, vNum, idx_int, polyNum, grHandle [, transFlag] (int 配列 OK)
#cmd dx_DrawPolygon2D               $1e3  ; verts, polyNum, grHandle, transFlag
#cmd dx_DrawPolygonIndexed2D        $1e4  ; verts, vNum, idx_short, polyNum, grHandle, transFlag
#cmd dx_DrawPolygon32bitIndexed2D   $1e5  ; verts, vNum, idx_int, polyNum, grHandle, transFlag

;  ---- Phase 5.5k: DxLib コールバック (静的スロット方式) ----
;  HSP 側は通常のラベルを渡す。dx_SetASyncLoadFinishCallback は handle 引数あり。
#cmd dx_SetRestoreGraphCallback         $1d0   ; dx_SetRestoreGraphCallback *label
#cmd dx_SetRestoreShredPoint            $1d1   ; dx_SetRestoreShredPoint *label
#cmd dx_SetGraphicsDeviceRestoreCallback $1d2  ; dx_SetGraphicsDeviceRestoreCallback *label
#cmd dx_SetGraphicsDeviceLostCallback   $1d3   ; dx_SetGraphicsDeviceLostCallback *label
#cmd dx_SetASyncLoadFinishCallback      $1d4   ; dx_SetASyncLoadFinishCallback handle, *label

#endif
