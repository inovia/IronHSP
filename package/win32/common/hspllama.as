;============================================================
;  hspllama.as — llama.cpp プラグイン宣言 (新形式 typed #func)
;
;  HSP 側コマンド名は llama_xxx (使いやすさ優先)。
;  DLL export 名は hspllama_xxx (llama.dll の同名シンボルとの
;  リンク衝突を避けるため第 3 引数で実体名を指定)。
;
;  使用例:
;    #include "hsp3cl_net_64.as"   ; or hsp3_net_64.as
;    #include "hspllama.as"
;
;        llama_init
;        llama_load "model.gguf", 512, 0, h
;        if h < 0 : end
;        sdim reply, 4096
;        llama_complete h, "The capital of Japan is", 32, reply, 4096
;        mes reply
;        llama_close h
;        llama_shutdown
;        end
;============================================================

#ifndef __hspllama_as__
#define __hspllama_as__

#uselib "hspllama.dll"
#func global llama_init         "hspllama_init"
#func global llama_shutdown     "hspllama_shutdown"
#func global llama_load         "hspllama_load"          str, int, int, var
#func global llama_close        "hspllama_close"         int
#func global llama_complete     "hspllama_complete"      int, str, int, var, int
#func global llama_chat         "hspllama_chat"          int, str, str, int, var, int
#func global llama_stream_begin "hspllama_stream_begin"  int, str, int
#func global llama_stream_next  "hspllama_stream_next"   var, int
#func global llama_stream_end   "hspllama_stream_end"
#func global llama_n_ctx        "hspllama_n_ctx"         int, var
#func global llama_n_vocab      "hspllama_n_vocab"       int, var

#endif
