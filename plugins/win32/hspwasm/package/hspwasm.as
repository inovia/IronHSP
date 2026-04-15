;============================================================
;  hspwasm.as — WebAssembly (Wasm3) プラグイン宣言
;============================================================

#ifndef __hspwasm_as__
#define __hspwasm_as__

#uselib "hspwasm.dll"
#func global wasm_load         wasm_load         $202
#func global wasm_load_mem     wasm_load_mem     $202
#func global wasm_close        wasm_close        $202
#func global wasm_clear        wasm_clear        $202
#func global wasm_memory_size  wasm_memory_size  $202
#func global wasm_memory_read  wasm_memory_read  $202
#func global wasm_memory_write wasm_memory_write $202
#func global wasm_call_i       wasm_call_i       $202
#func global wasm_call_i64     wasm_call_i64     $202
#func global wasm_call_d       wasm_call_d       $202

#endif
