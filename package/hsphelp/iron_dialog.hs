;
; iron_dialog.hsp  HSP3 ヘルプ (日本語)
; モダン (Vista+) ファイルダイアログラッパ
;

%type
拡張命令
%ver
1.0
%date
2026-04-13
%author
IronHSP / iron_dialog
%dll
iron_dialog.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / hsp3net 専用 (#usecom 使用)

%note
iron_dialog.hsp は Win32 IFileOpenDialog / IFileSaveDialog COM
インターフェースを HSP から手軽に使えるようにする薄いラッパです。

特徴:
  - Windows Vista 以降のモダン UI (旧 GetOpenFileName より見た目良い)
  - Win10/11 ネイティブの「最近のフォルダ」「お気に入り」「OneDrive」
    「クイックアクセス」等の左ペインがそのまま使える
  - hsp3net 専用 (#usecom / #comfunc / newcom -2 アタッチを使うため)

  #include "iron_dialog.hsp"

filter フォーマット (NULL 区切り):
  "PNG (*.png)|*.png|JPEG (*.jpg)|*.jpg|All|*.*|"
  内部で | を NULL に変換します。

%group
iron_dialog (ファイルダイアログ)

%index
dialog_open
ファイルを開くダイアログ
%group
iron_dialog
%prm
["title"], ["filter"]
"title"  : ダイアログタイトル (省略可)
"filter" : ファイルタイプフィルタ (省略可)

%inst
モダンなファイル選択ダイアログを表示します。
  refstr : 選択されたファイルパス
  stat   : 0 成功 / 1 キャンセル / 負値 エラー

例:
  dialog_open "画像を開いてください", "画像 (*.png;*.jpg)|*.png;*.jpg|All|*.*|"
  if stat = 0 {
    picload refstr
  }

%index
dialog_save
ファイルを保存ダイアログ
%group
iron_dialog
%prm
["title"], ["filter"], ["default_ext"]
"default_ext" : 拡張子省略時に補完される拡張子 (例 "txt")

%inst
保存先選択ダイアログを表示します。

例:
  dialog_save "保存先を指定", "テキスト|*.txt|", "txt"
  if stat = 0 : notesave refstr
