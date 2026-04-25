; watch_api.as — hsp3watch / Watch app 専用 API
;
; 使い方: HSP スクリプトから #include "watch_api.as" して
;   wcsend "hello"     ; iOS app に文字列メッセージ送信 (Watch only — hsp3watch では no-op)
;   wcrecv msg         ; 最新の WC 受信メッセージを msg に書き込む (空なら "")
;   if wcready() {     ; 新しいメッセージあるか
;       wcrecv msg
;       mes "got: " + msg
;   }
;
; 実装は HSPRuntime.swift / hsp3watch.cpp 側。 hspcmp は #regcmd + #cmd で
; 単に opcode 番号を keyword に割り当てる。

#regcmd 9                    ; TYPE_EXTCMD
#cmd wcsend $200             ; wcsend "string"
#cmd wcrecv $201             ; wcrecv var

#regcmd 10                   ; TYPE_EXTSYSVAR (括弧なしで参照可能)
#cmd wcready $300            ; if wcready { ... }
