;
; iron_toast.hsp  HSP3 ヘルプ (日本語)
; Shell_NotifyIcon バルーン通知ラッパ
;

%type
拡張命令
%ver
1.0
%date
2026-04-14
%author
IronHSP / iron_toast
%dll
iron_toast.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 (32bit のみ)

%note
iron_toast.hsp は Windows のタスクトレイ領域にバルーン通知を表示する
ラッパです。Win10/11 ではトースト風の右下スライドイン通知になります。

Shell_NotifyIconA + NOTIFYICONDATAA を sdim/lpoke で構造体手組み。
WinRT 不要、追加 DLL 不要。

  #include "iron_toast.hsp"

注意: 32bit 専用です (NOTIFYICONDATAA の構造体レイアウトを 32bit
固定で作成しているため)。x64 対応は将来課題。

%group
iron_toast (トースト通知)

%index
toast
情報通知 (青 i アイコン) を表示
%group
iron_toast
%prm
"title", "body"
"title" : 通知タイトル (最大 63 byte)
"body"  : 通知本文 (最大 255 byte)

%inst
タスクトレイにバルーン通知を表示します。
初回は NIM_ADD でアイコンを追加、2 回目以降は NIM_MODIFY で更新。

例:
  toast "IronHSP", "ビルドが完了しました"

%href
toast_warning
toast_error
toast_clear

%index
toast_warning
警告通知 (黄 ! アイコン) を表示
%group
iron_toast
%prm
"title", "body"

%inst
NIIF_WARNING フラグで黄色の警告マーク付き通知を表示します。

例:
  toast_warning "警告", "ディスク空き容量が少なくなっています"

%index
toast_error
エラー通知 (赤 × アイコン) を表示
%group
iron_toast
%prm
"title", "body"

%inst
NIIF_ERROR フラグで赤色のエラーマーク付き通知を表示します。

例:
  toast_error "エラー", "ファイルが見つかりません"

%index
toast_clear
タスクトレイからアイコンを削除
%group
iron_toast
%prm

%inst
NIM_DELETE で登録済みアイコンを削除します。アプリ終了前に呼び出す
ことを推奨。
