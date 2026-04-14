;============================================================
;  hspjson.as — JSON プラグイン宣言
;============================================================

#ifndef __hspjson_as__
#define __hspjson_as__

#uselib "hspjson.dll"
#func global json_parse            json_parse            $202
#func global json_free             json_free             $202
#func global json_clear            json_clear            $202
#func global json_get_str          json_get_str          $202
#func global json_get_int          json_get_int          $202
#func global json_get_dbl          json_get_dbl          $202
#func global json_count            json_count            $202
#func global json_type             json_type             $202
#func global json_stringify        json_stringify        $202
#func global json_stringify_pretty json_stringify_pretty $202

; 値型定数 (json_type の戻り)
#define global JT_NULL  0
#define global JT_BOOL  1
#define global JT_NUM   2
#define global JT_STR   3
#define global JT_ARR   4
#define global JT_OBJ   5

#endif
