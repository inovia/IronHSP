;
; iron_sysinfo.hsp  HSP3 ヘルプ (日本語)
; OS / CPU / ユーザー情報取得ラッパ
;

%type
拡張命令
%ver
1.0
%date
2026-04-13
%author
IronHSP / iron_sysinfo
%dll

%url
https://github.com/HNWorks/IronHSP_2026
%port
Win32 / Win64

%note
iron_sysinfo.hsp は GetUserNameA / GetComputerNameA / GetSystemInfo /
GetTickCount / GlobalMemoryStatusEx 等を簡単に呼び出すラッパです。

  #include "iron_sysinfo.hsp"

%index
sys_username
Windows ログオンユーザー名を取得
%group
iron_sysinfo — ユーザー
%prm

%inst
refstr に %USERNAME% に相当する文字列を書き込みます。

%index
sys_computername
コンピュータ名を取得
%group
iron_sysinfo — ホスト
%prm

%inst
refstr に %COMPUTERNAME% を書き込みます。

%index
sys_cpucount
論理プロセッサ数
%group
iron_sysinfo — CPU
%prm

%inst
stat に CPU の論理コア数を返します。

%index
sys_pagesize
メモリページサイズ
%group
iron_sysinfo — メモリ
%prm

%inst
stat にページサイズ (通常 4096) を返します。

%index
sys_uptime
起動からのミリ秒
%group
iron_sysinfo — その他
%prm

%inst
stat に GetTickCount の値を返します (32bit、約 49 日でラップ)。

%index
sys_temp_path
%TEMP% パス
%group
iron_sysinfo — パス
%prm

%inst
refstr に temp ディレクトリパスを返します。

%index
sys_windows_dir
Windows ディレクトリパス
%group
iron_sysinfo — パス
%prm

%inst
refstr に C:\Windows 等のパスを返します。

%index
sys_system_dir
System32 ディレクトリパス
%group
iron_sysinfo — パス
%prm

%inst
refstr に C:\Windows\System32 等のパスを返します。

%index
sys_appdata
%APPDATA% (Roaming) パス
%group
iron_sysinfo — パス
%prm

%index
sys_localappdata
%LOCALAPPDATA% パス
%group
iron_sysinfo — パス
%prm
