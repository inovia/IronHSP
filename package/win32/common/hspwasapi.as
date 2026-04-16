;
;   hspwasapi.as -- WASAPI audio capture / render DLL header
;
#ifndef __hspwasapi_as__
#define __hspwasapi_as__

#ifdef __hsp64__
#uselib "hspwasapi64.dll"
#else
#uselib "hspwasapi.dll"
#endif

#cfunc wasapi_init          "wasapi_init"
#cfunc wasapi_device_count  "wasapi_device_count"     int
#func  wasapi_device_name   "wasapi_device_name"      int, int, var, int
#cfunc wasapi_open          "wasapi_open"             int, int, int, int, int
#func  wasapi_start_file    "wasapi_start_file"       int, str
#func  wasapi_stop          "wasapi_stop"             int
#func  wasapi_get_pcm       "wasapi_get_pcm"          int, var, int
#cfunc wasapi_get_level     "wasapi_get_level"        int
#func  wasapi_get_info      "wasapi_get_info"         int, var, var, var
#func  wasapi_close         "wasapi_close"            int
#cfunc wasapi_shutdown      "wasapi_shutdown"

; direction constants
#define global WASAPI_CAPTURE 0
#define global WASAPI_RENDER  1

#endif
