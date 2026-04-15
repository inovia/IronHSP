;============================================================
;  hspwasm.as — WebAssembly (Wasm3) プラグイン宣言 (新形式 typed #func)
;============================================================

#ifndef __hspwasm_as__
#define __hspwasm_as__

#uselib "hspwasm.dll"
#func global wasm_load         "hspwasm_load"          str, var
#func global wasm_load_mem     "hspwasm_load_mem"      var, int, var
#func global wasm_close        "hspwasm_close"         int
#func global wasm_clear        "hspwasm_clear"
#func global wasm_memory_size  "hspwasm_memory_size"   int, var
#func global wasm_memory_read  "hspwasm_memory_read"   int, int, var, int, var
#func global wasm_memory_write "hspwasm_memory_write"  int, int, var, int, var
#func global wasm_call_i       "hspwasm_call_i"        int, str, var, int, var
#func global wasm_call_i64     "hspwasm_call_i64"      int, str, var, int, var
#func global wasm_call_d       "hspwasm_call_d"        int, str, var, int, var

#endif
