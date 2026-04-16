;============================================================
;  hspwgcapture.as — Windows.Graphics.Capture プラグイン宣言 (新形式 typed #func)
;   スクリーン / ウィンドウ / モニタ キャプチャ (Win10 1903+)
;============================================================

#ifndef __hspwgcapture_as__
#define global __hspwgcapture_as__

#uselib "hspwgcapture.dll"
#func global wgc_init          "wgc_init"
#func global wgc_shutdown      "wgc_shutdown"
#func global wgc_list_windows  "wgc_list_windows"  var, int
#func global wgc_start_window  "wgc_start_window"  int, var
#func global wgc_start_monitor "wgc_start_monitor" int, var
#func global wgc_stop          "wgc_stop"          int
#func global wgc_grab_frame    "wgc_grab_frame"    int, var, int, var, var
#func global wgc_save_png      "wgc_save_png"      int, str

#endif
