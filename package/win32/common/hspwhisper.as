;============================================================
;  hspwhisper.as — whisper.cpp プラグイン宣言 (x64 のみ)
;============================================================

#ifndef __hspwhisper_as__
#define __hspwhisper_as__

#ifdef _HSP64
#uselib "hspwhisper_64.dll"
#else
#uselib "hspwhisper.dll"
#endif

; #cfunc 形式 (返り値 = 結果コード)
#cfunc hspwhisper_open            "whisper_open"            str
#cfunc hspwhisper_transcribe_wav  "whisper_transcribe_wav"  int, str, str, var, int
#cfunc hspwhisper_transcribe_pcm  "whisper_transcribe_pcm"  int, var, int, int, str, var, int
#func  hspwhisper_close           "whisper_close"           int

#endif
