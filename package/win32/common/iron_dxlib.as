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

#endif
