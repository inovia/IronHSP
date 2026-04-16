;
; iron_clip.hsp  HSP3 ヘルプ (日本語)
; Win32 クリップボード文字列ラッパ
;

%type
拡張命令
%ver
3.8
%date
2026/04/18
%author
IronHSP
%dll
iron_clip.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32

%note
iron_clip.hsp は Win32 OpenClipboard / GetClipboardData /
SetClipboardData / CloseClipboard / GlobalAlloc / GlobalLock を組み
合わせた文字列クリップボードラッパです。

  #include "iron_clip.hsp"

HSP 標準の clipget / clipset でも文字列はやり取りできますが、
このモジュールはサイズ取得や CF_TEXT/CF_UNICODETEXT 切り替え、
has_text 判定等のヘルパを追加します。

%group
iron_clip (クリップボード)

%index
clip_get_text
クリップボードから文字列取得
%group
iron_clip
%prm

%inst
クリップボードのテキストを取得します。
  refstr : 取得文字列
  stat   : 文字数 (失敗時 -1)

例:
  clip_get_text
  if stat >= 0 : mes "クリップボード: " + refstr

%index
clip_set_text
クリップボードに文字列を書き込む
%group
iron_clip
%prm
"text"

%inst
クリップボードに文字列を設定します。
GlobalAlloc → GlobalLock → memcpy → SetClipboardData の順で
高速に書き込みます。

%index
clip_clear
クリップボード内容をクリア
%group
iron_clip
%prm

%inst
EmptyClipboard でクリップボードを空にします。

%index
clip_has_text
クリップボードにテキストがあるかチェック
%group
iron_clip
%prm

%inst
stat = 1 (テキストあり) / 0 (なし)
