;============================================================
;  hspllama.as — llama.cpp プラグイン宣言
;
;  HSP 側コマンド名は llama_xxx (使いやすさ優先)。
;  DLL export 名は hspllama_xxx (llama.dll の同名シンボルとの
;  リンク衝突を避けるため第 3 引数で実体名を指定)。
;============================================================

#ifndef __hspllama_as__
#define __hspllama_as__

#uselib "hspllama.dll"
#func global llama_init         hspllama_init         $202
#func global llama_shutdown     hspllama_shutdown     $202
#func global llama_load         hspllama_load         $202
#func global llama_close        hspllama_close        $202
#func global llama_complete     hspllama_complete     $202
#func global llama_chat         hspllama_chat         $202
#func global llama_stream_begin hspllama_stream_begin $202
#func global llama_stream_next  hspllama_stream_next  $202
#func global llama_stream_end   hspllama_stream_end   $202
#func global llama_n_ctx        hspllama_n_ctx        $202
#func global llama_n_vocab      hspllama_n_vocab      $202

#endif
