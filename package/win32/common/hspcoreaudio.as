;============================================================
; hspcoreaudio.dll — Windows CoreAudio 制御
;
; システム全体の音量 / アプリ単位の音量 / ピークメーター / デバイス列挙
; 外部 SDK 不要 (Windows SDK のみで動作)
;============================================================

#ifndef __hspcoreaudio__
#define __hspcoreaudio__

#uselib "hspcoreaudio.dll"
#func global coreaudio_init           "coreaudio_init"
#func global coreaudio_shutdown       "coreaudio_shutdown"

; --- システム音量 ---
#func global coreaudio_system_get_volume "coreaudio_system_get_volume" var
#func global coreaudio_system_set_volume "coreaudio_system_set_volume" double
#func global coreaudio_system_get_mute   "coreaudio_system_get_mute"   var
#func global coreaudio_system_set_mute   "coreaudio_system_set_mute"   int
#func global coreaudio_system_get_peak   "coreaudio_system_get_peak"   var

; --- セッション (アプリ単位) ---
#func global coreaudio_session_count      "coreaudio_session_count"      var
#func global coreaudio_session_name       "coreaudio_session_name"       int, var, int
#func global coreaudio_session_pid        "coreaudio_session_pid"        int, var
#func global coreaudio_session_get_volume "coreaudio_session_get_volume" int, var
#func global coreaudio_session_set_volume "coreaudio_session_set_volume" int, double
#func global coreaudio_session_get_mute   "coreaudio_session_get_mute"   int, var
#func global coreaudio_session_set_mute   "coreaudio_session_set_mute"   int, int
#func global coreaudio_session_get_peak   "coreaudio_session_get_peak"   int, var

; --- デバイス列挙 (direction: 0=render / 1=capture) ---
#func global coreaudio_device_count       "coreaudio_device_count"       int, var
#func global coreaudio_device_name        "coreaudio_device_name"        int, int, var, int
#func global coreaudio_device_get_default "coreaudio_device_get_default" int, var, int

#define global CA_RENDER  0
#define global CA_CAPTURE 1

#endif
