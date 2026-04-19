;============================================================
;  hspvosk.as — Vosk (Kaldi) プラグイン宣言
;============================================================
#ifndef __hspvosk_as__
#define __hspvosk_as__
#ifdef _HSP64
#uselib "hspvosk_64.dll"
#else
#uselib "hspvosk.dll"
#endif
#cfunc hspvosk_open            "hvosk_open"            str, int
#cfunc hspvosk_transcribe_wav  "hvosk_transcribe_wav"  int, str, var, int
#cfunc hspvosk_accept_pcm_s16  "hvosk_accept_pcm_s16"  int, var, int
#func  hspvosk_partial_result  "hvosk_partial_result"  int, var, int
#func  hspvosk_final_result    "hvosk_final_result"    int, var, int
#func  hspvosk_reset           "hvosk_reset"           int
#func  hspvosk_close           "hvosk_close"           int
#endif
