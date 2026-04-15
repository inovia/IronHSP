;
; iron_7z.hsp  HSP3 ヘルプ (日本語)
; 7-Zip サブプロセスラッパ (7z/zip/tar/gz/rar ほか 40+ フォーマット)
;

%type
拡張命令
%ver
1.0
%date
2026-04-15
%author
IronHSP / iron_7z
%dll
iron_7z.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_7z.hsp は hsp7z.dll + 同梱の 7za_x86.exe / 7za_x64.exe を呼び出し、
7z / zip / tar / gz / bz2 / xz / rar(読み取りのみ) / wim / iso など
40 種類以上のアーカイブフォーマットを扱うラッパモジュールです。

  #include "iron_7z.hsp"

iron_zip.hsp (miniz 版) よりも高機能ですが、サブプロセス起動コストが
あるため、1 ファイル単位の細かい処理ではなくまとめて extract / compress
する用途向けです。

依存:
  plugins/win32/hsp7z/Release/hsp7z.dll
  hsp7z.dll と同じディレクトリに 7za_x86.exe / 7za_x64.exe を配置すること

%group
iron_7z (7z/zipアーカイブ)

%index
iron_7z_add
アーカイブにファイル/フォルダを追加
%group
iron_7z ― 書き込み
%prm
"archive", "path"
"archive" : 対象アーカイブ (存在しなければ新規作成)
"path"    : 追加するファイル/ディレクトリ

%inst
既存アーカイブに path を追加します。アーカイブが存在しない場合は
新規作成されます。内部的には "7za a -y archive path" を実行します。

例:
  iron_7z_add "backup.7z", "mydata\\"

%index
iron_7z_extract
アーカイブの全エントリを展開
%group
iron_7z ― 読み取り
%prm
"archive", "out_dir"
"archive" : アーカイブファイル
"out_dir" : 出力先ディレクトリ (末尾 \\ 推奨)

%inst
アーカイブ内の全エントリをパス構造を保持したまま out_dir に展開します。
内部的に "7za x -y archive -oout_dir" を実行します。

例:
  iron_7z_extract "backup.7z", "restore\\"

%index
iron_7z_extract_one
アーカイブから 1 エントリだけ展開
%group
iron_7z ― 読み取り
%prm
"archive", "entry", "out_dir"
"archive" : アーカイブファイル
"entry"   : 取り出すエントリのパス
"out_dir" : 出力先ディレクトリ

%inst
アーカイブ内の指定エントリのみを展開します。

例:
  iron_7z_extract_one "backup.7z", "docs/readme.txt", "out\\"

%index
iron_7z_test
アーカイブの整合性チェック
%group
iron_7z ― 検査
%prm
"archive"
"archive" : アーカイブファイル

%inst
アーカイブの内容をテスト展開して破損を検査します。
stat に 7za プロセスの終了コードが返り、0 なら正常です。

%index
iron_7z_list
アーカイブのエントリ一覧取得
%group
iron_7z ― 一覧
%prm
"archive", names, sizes
"archive" : アーカイブファイル
names     : エントリ名を受け取る配列 (sdim 自動)
sizes     : 各エントリのサイズを受け取る int 配列

%inst
アーカイブ内のエントリ一覧を取得します。names(i) にパス、sizes(i) に
バイトサイズが入り、stat にエントリ件数が返ります。内部的に
"7za l -slt archive" の technical モード出力をパースしています。

例:
  iron_7z_list "backup.7z", ns, ss
  mes "entries: " + stat
  repeat stat
      mes ns(cnt) + " (" + ss(cnt) + " bytes)"
  loop

%index
sevenz_run
7za プロセスを生コマンドラインで実行 (低レベル)
%group
iron_7z ― 低レベル
%prm
"args", var, int
"args" : 7za に渡すコマンドライン文字列 (例: "l backup.7z")
var    : stdout を受け取る変数
int    : var の最大長

%inst
hsp7z.dll の低レベル API。7za のコマンドラインを直接指定して呼び出します。
戻り値は 7za プロセスの終了コードです。iron_7z_* ラッパで足りない場合
のみ使用してください。
