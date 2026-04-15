;============================================================
;  hspllama.as — llama.cpp プラグイン宣言
;============================================================

#ifndef __hspllama_as__
#define __hspllama_as__

#uselib "hspllama.dll"
#func global llama_init         llama_init         $202
#func global llama_shutdown     llama_shutdown     $202
#func global llama_load         llama_load         $202
#func global llama_close        llama_close        $202
#func global llama_complete     llama_complete     $202
#func global llama_chat         llama_chat         $202
#func global llama_stream_begin llama_stream_begin $202
#func global llama_stream_next  llama_stream_next  $202
#func global llama_stream_end   llama_stream_end   $202
#func global llama_n_ctx        llama_n_ctx        $202
#func global llama_n_vocab      llama_n_vocab      $202

#endif
