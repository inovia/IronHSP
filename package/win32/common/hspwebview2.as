;============================================================
;  hspwebview2.as — WebView2 プラグイン宣言 (新形式 typed #func)
;
;  Microsoft Edge WebView2 を HSP ウィンドウにアタッチして
;  HTML / JS を表示し、HSP <-> JS の双方向メッセージングを行う。
;
;  前提:
;    - Edge WebView2 Runtime (evergreen) が PC にインストール済み。
;      ほとんどの Windows 10/11 は既に入っている。
;      なければ https://developer.microsoft.com/microsoft-edge/webview2/
;    - hspwebview2.dll (32bit) または hspwebview2_64.dll (64bit) と
;      WebView2Loader.dll (必要なら) を実行ファイルと同じ場所に配置。
;============================================================

#ifndef __hspwebview2_as__
#define global __hspwebview2_as__

#uselib "hspwebview2.dll"
#func global wv2_init              "wv2_init"              str
#func global wv2_attach            "wv2_attach"            int, int, int, int, int
#func global wv2_detach            "wv2_detach"            int
#func global wv2_close             "wv2_close"             int
#func global wv2_navigate          "wv2_navigate"          int, str
#func global wv2_navigate_to_string "wv2_navigate_to_string" int, str
#func global wv2_resize            "wv2_resize"            int, int, int, int, int
#func global wv2_visible           "wv2_visible"           int, int
#func global wv2_execute_script    "wv2_execute_script"    int, str, var, int
#func global wv2_post_message      "wv2_post_message"      int, str
#func global wv2_poll_message      "wv2_poll_message"      int, var, int
#func global wv2_add_script        "wv2_add_script"        int, str

#endif
