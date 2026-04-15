;============================================================
;  hspjson.as — JSON プラグイン宣言 (新形式 typed #func)
;
;  HSP コマンド名は従来互換 (json_parse 等)。
;  DLL 実体は hspjson_xxx にリネームして第 3 引数で指定。
;============================================================

#ifndef __hspjson_as__
#define __hspjson_as__

#uselib "hspjson.dll"
#func global json_parse            "hspjson_parse"            str, var
#func global json_free             "hspjson_free"             int
#func global json_clear            "hspjson_clear"
#func global json_get_str          "hspjson_get_str"          int, str, var, int
#func global json_get_int          "hspjson_get_int"          int, str, var
#func global json_get_dbl          "hspjson_get_dbl"          int, str, var
#func global json_count            "hspjson_count"            int, str, var
#func global json_type             "hspjson_type"             int, str, var
#func global json_stringify        "hspjson_stringify"        int, var, int
#func global json_stringify_pretty "hspjson_stringify_pretty" int, var, int

; 値型定数 (json_type の戻り)
#define global JT_NULL  0
#define global JT_BOOL  1
#define global JT_NUM   2
#define global JT_STR   3
#define global JT_ARR   4
#define global JT_OBJ   5

#endif
