;============================================================
;  hsptoast.as — Windows 10/11 トースト通知 (Shell_NotifyIconW 経由)
;============================================================
#ifndef __hsptoast_as__
#define __hsptoast_as__
#ifdef _HSP64
#uselib "hsptoast_64.dll"
#else
#uselib "hsptoast.dll"
#endif
#func global hsptoast_show_info   "hsptoast_show_info"   str, str
#func global hsptoast_show_warn   "hsptoast_show_warn"   str, str
#func global hsptoast_show_error  "hsptoast_show_error"  str, str
#func global hsptoast_clear       "hsptoast_clear"
#endif
