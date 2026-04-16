%dll
; iron_path パス操作
%ver
3.8
%date
2026/04/16
%author
IronHSP
%note
shlwapi.dll。外部DLL不要。
%type
ユーザー定義命令
%group
ファイル操作

%index
path_combine
パス結合
%prm
(dir, file)
%inst
2つのパスを結合して返す。
%href
path_ext

%index
path_ext
拡張子を取得
%prm
(path)
%inst
".txt" 等を返す。
%href
path_filename

%index
path_filename
ファイル名を取得
%prm
(path)
%inst

%href
path_dir

%index
path_dir
ディレクトリを取得
%prm
(path)
%inst

%href
path_stem

%index
path_stem
拡張子なしファイル名
%prm
(path)
%inst

%href
path_exists

%index
path_exists
パスが存在するか
%prm
(path)
%inst
1=存在, 0=なし
%href
path_is_relative

%index
path_is_relative
相対パスか
%prm
(path)
%inst
1=相対, 0=絶対
%href
path_temp

%index
path_temp
一時フォルダ
%prm
()
%inst

