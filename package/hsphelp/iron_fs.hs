%dll
; iron_fs File/Folder ops
%ver
3.8
%date
2026/04/17
%author
IronHSP
%note
Win32 API
%type
User command
%group
File

%index
fs_copy
Copy file
%prm
"src","dst"
%inst
stat=0 ok
%href
fs_move

%index
fs_move
Move file
%prm
"src","dst"
%inst

%href
fs_size

%index
fs_size
File size
%prm
("path")
%inst
bytes
%href
fs_readtext

%index
fs_readtext
Read text
%prm
("path")
%inst

%href
fs_writetext

%index
fs_writetext
Write text
%prm
"path","text"
%inst

%href
fs_tempfile

%index
fs_tempfile
Temp file
%prm
()
%inst
path
%href
fs_is_locked

%index
fs_is_locked
File locked
%prm
("path")
%inst
1=locked
%href
fs_mkdir_p

%index
fs_mkdir_p
Mkdir recursive
%prm
"path"
%inst

%href
fs_rmdir_r

%index
fs_rmdir_r
Rmdir recursive
%prm
"path"
%inst

%href
fs_listfiles

%index
fs_listfiles
List files
%prm
"dir","*.txt"
%inst
refstr
%href
fs_is_dir

%index
fs_is_dir
Is directory
%prm
("path")
%inst
