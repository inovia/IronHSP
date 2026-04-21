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

;  ---- アンチエイリアス描画 (DxLib 独自、HSP 標準にない) ----
#cmd dx_drawcircleaa   $100     ; dx_drawcircleaa x, y, r, color [, fill, thickness]
#cmd dx_drawlineaa     $101     ; dx_drawlineaa x1, y1, x2, y2, color [, thickness]
#cmd dx_drawboxaa      $102     ; dx_drawboxaa x1, y1, x2, y2, color [, fill, thickness]
#cmd dx_drawtriangle   $103     ; dx_drawtriangle x1, y1, x2, y2, x3, y3, color, fill

;  ---- 自由変形 (DxLib DrawModiGraph、4 頂点で画像を歪める) ----
#cmd dx_drawmodigraph  $104     ; dx_drawmodigraph srcID, x1,y1, x2,y2, x3,y3, x4,y4

;  ---- ジョイパッド入力 ----
#cmd dx_getjoypad      $110     ; dx_getjoypad var [, pad_no] — ビットフィールドを var に
#cmd dx_joyanalog      $111     ; dx_joyanalog xvar, yvar [, pad_no] — アナログ L スティック

;  ---- 画面フィルタ / エフェクト ----
#cmd dx_setwaitvsync   $120     ; dx_setwaitvsync flag — VSync 待機 ON/OFF
#cmd dx_setfullscreen  $121     ; dx_setfullscreen flag — フルスクリーン切替

;  ---- Phase 5.2: 3D プリミティブ / カメラ ----
#cmd dx_setcamerapos   $130     ; dx_setcamerapos cx, cy, cz, tx, ty, tz  視点 (cx,cy,cz) → 注視点 (tx,ty,tz)
#cmd dx_setcameraperspective $131  ; dx_setcameraperspective fov_deg  視野角 (度、DxLib は内部で rad 換算)
#cmd dx_drawsphere3d   $132     ; dx_drawsphere3d x, y, z, r, divnum, difcol, spccol, fill
#cmd dx_drawcube3d     $133     ; dx_drawcube3d x1,y1,z1, x2,y2,z2, difcol, spccol, fill
#cmd dx_setbgcolor3d   $134     ; dx_setbgcolor3d r, g, b  3D 背景色
#cmd dx_setuselighting $135     ; dx_setuselighting flag — 照明 ON/OFF (OFF で DifColor がフラット表示)
#cmd dx_setlightdir    $136     ; dx_setlightdir dx, dy, dz — 平行光源の方向
#cmd dx_setzbuffer     $137     ; dx_setzbuffer flag — Z バッファ (深度テスト) ON/OFF

;  ---- Phase 5.2: 3D モデル ----
#cmd dx_mv1load        $140     ; dx_mv1load "file" — stat にハンドル (-1=失敗)
#cmd dx_mv1draw        $141     ; dx_mv1draw handle
#cmd dx_mv1setpos      $142     ; dx_mv1setpos handle, x, y, z
#cmd dx_mv1setrot      $143     ; dx_mv1setrot handle, rx, ry, rz (radians)
#cmd dx_mv1setscale    $144     ; dx_mv1setscale handle, sx, sy, sz
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

#endif
