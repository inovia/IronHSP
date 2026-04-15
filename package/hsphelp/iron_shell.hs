;
; iron_shell.hsp  HSP3 ヘルプ (日本語)
; Windows シェル操作 (ShellExecute / ゴミ箱 / .lnk ショートカット)
;

%type
拡張命令
%ver
1.0
%date
2026-04-15
%author
IronHSP / iron_shell
%dll
iron_shell.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_shell.hsp は shell32.dll の ShellExecute / SHFileOperation /
IShellLink 等を HSP から手軽に呼び出すためのラッパモジュールです。

  #include "iron_shell.hsp"

サポート:
  ファイル / URL をデフォルトアプリで開く
  任意コマンドの実行 (通常 / 管理者昇格)
  ファイル / フォルダをゴミ箱へ送る
  エクスプローラでファイルを選択表示
  .lnk ショートカットファイルの作成 (IShellLinkA COM)

%group
iron_shell (シェル操作)

%index
shell_open
ファイル/URL をデフォルトアプリで開く
%group
iron_shell ― 起動
%prm
"path"
"path" : ファイル、フォルダ、または URL

%inst
ShellExecute の verb = "open" を呼び出し、拡張子に関連付けられた
アプリケーションで path を開きます。URL を渡すと既定のブラウザが
起動します。

例:
  shell_open "https://www.google.com/"
  shell_open "readme.txt"

%href
shell_execute
shell_runas

%index
shell_execute
任意コマンドを実行
%group
iron_shell ― 起動
%prm
"cmd", "args", "workdir"
"cmd"     : 実行ファイルパスまたはコマンド
"args"    : コマンドライン引数 (空文字可)
"workdir" : 作業ディレクトリ (空文字可)

%inst
ShellExecute verb = "open" で任意のコマンドを実行します。

例:
  shell_execute "notepad.exe", "readme.txt", ""

%href
shell_open
shell_runas

%index
shell_runas
管理者権限で実行 (UAC 昇格)
%group
iron_shell ― 起動
%prm
"cmd", "args"
"cmd"  : 実行ファイル
"args" : 引数

%inst
ShellExecute verb = "runas" で UAC プロンプトを出して管理者権限で
起動します。ユーザーがキャンセルした場合は失敗します。

例:
  shell_runas "cmd.exe", "/c netsh http show urlacl"

%href
shell_execute

%index
shell_recycle
ファイル/フォルダをゴミ箱へ送る
%group
iron_shell ― ファイル
%prm
"path"
"path" : 削除対象のパス

%inst
SHFileOperationA + FO_DELETE + FOF_ALLOWUNDO でファイルまたは
フォルダをゴミ箱へ送ります。FOF_NOCONFIRMATION | FOF_SILENT も
付くため確認ダイアログは出ません。復元はエクスプローラのゴミ箱から
行えます。

例:
  shell_recycle "tmp_output.txt"

%index
shell_show_in_explorer
エクスプローラでファイルを選択表示
%group
iron_shell ― エクスプローラ
%prm
"path"
"path" : 表示したいファイルのパス

%inst
explorer.exe /select,path を実行し、ファイルが選択された状態で
親フォルダを開きます。

例:
  shell_show_in_explorer "C:\\Users\\me\\report.pdf"

%index
shell_mklink
.lnk ショートカットを作成 (IShellLinkA COM)
%group
iron_shell ― ショートカット
%prm
"target", "link", "args", "desc", "workdir"
"target"  : リンク先のファイル/フォルダ
"link"    : 作成する .lnk ファイルのパス
"args"    : 起動時引数 (空文字可)
"desc"    : 説明 (tooltip、空文字可)
"workdir" : 作業ディレクトリ (空文字可)

%inst
shell32.dll の CLSID_ShellLink (IShellLinkA) を newcom で生成し、
SetPath / SetArguments / SetDescription / SetWorkingDir を呼び出して
IPersistFile::Save で .lnk を保存します。戻り値は 0 で成功、
-1 で QueryInterface 失敗です。

例:
  shell_mklink "C:\\app\\foo.exe", "C:\\Users\\me\\Desktop\\foo.lnk", "--verbose", "My App", "C:\\app\\"

備考:
  内部で使用しているのは IShellLinkA (ANSI 版) です。パスに非 ASCII 文字
  (日本語フォルダ名等) が含まれる場合は IShellLinkW 版の使用を検討
  してください。
