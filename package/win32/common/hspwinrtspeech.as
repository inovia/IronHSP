;============================================================
;  hspwinrtspeech.as — Windows.Media.SpeechRecognition プラグイン宣言
;============================================================
#ifndef __hspwinrtspeech_as__
#define __hspwinrtspeech_as__
#ifdef _HSP64
#uselib "hspwinrtspeech_64.dll"
#else
#uselib "hspwinrtspeech.dll"
#endif
#cfunc hspwinrt_speech_open          "winrt_speech_open"        str
#cfunc hspwinrt_speech_listen_once   "winrt_speech_listen_once" int, var, int
#func  hspwinrt_speech_close         "winrt_speech_close"       int
#endif
