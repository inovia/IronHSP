;============================================================
;  hspsapi.as — Windows SAPI 5 プラグイン宣言
;============================================================
#ifndef __hspsapi_as__
#define __hspsapi_as__
#ifdef _HSP64
#uselib "hspsapi_64.dll"
#else
#uselib "hspsapi.dll"
#endif
#cfunc hspsapi_open            "sapi_open"            str
#cfunc hspsapi_transcribe_wav  "sapi_transcribe_wav"  int, str, var, int
#func  hspsapi_close           "sapi_close"           int
#endif
