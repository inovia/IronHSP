;============================================================
; hspaudiometer.dll — WASAPI ループバック サウンドメーター
;============================================================

#ifndef __hspaudiometer__
#define __hspaudiometer__

#uselib "hspaudiometer.dll"
#func global sm_open             "sm_open"
#func global sm_close            "sm_close"
#func global sm_poll             "sm_poll"
#func global sm_get_rms          "sm_get_rms"          var
#func global sm_get_peak         "sm_get_peak"         var
#func global sm_get_dbfs         "sm_get_dbfs"         var
#func global sm_get_band         "sm_get_band"         int, var
#func global sm_get_sample_rate  "sm_get_sample_rate"  var

; バンド定数 (8 帯域)
#define global SM_BAND_SUB_LOW   0   ; 〜 250 Hz
#define global SM_BAND_LOW       1   ; 250 〜 500
#define global SM_BAND_MID_LOW   2   ; 500 〜 1k
#define global SM_BAND_MID       3   ; 1k 〜 2k
#define global SM_BAND_MID_HIGH  4   ; 2k 〜 4k
#define global SM_BAND_HIGH      5   ; 4k 〜 8k
#define global SM_BAND_SUPER     6   ; 8k 〜 16k
#define global SM_BAND_ULTRA     7   ; 16k 〜

#endif
