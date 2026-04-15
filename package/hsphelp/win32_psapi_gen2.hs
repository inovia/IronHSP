; ============================================================
;   psapi.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
psapi.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の psapi.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
EmptyWorkingSet
指定されたプロセスのワーキングセットからできる限り多くのページを削除する。
%prm
hProcess
hProcess : [intptr] プロセスのハンドル。ハンドルには PROCESS_QUERY_INFORMATION または PROCESS_QUERY_LIMITED_INFORMATION アクセス権、および PROCESS_SET_QUOTA アクセス権が必要である。詳細は「Process Security and Access Rights」を参照。
%inst
指定されたプロセスのワーキングセットからできる限り多くのページを削除する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
SetProcessWorkingSetSize または SetProcessWorkingSetSizeEx
関数を、dwMinimumWorkingSetSize と dwMaximumWorkingSetSize の両パラメータに
(SIZE_T)(-1) を指定して呼び出すことでもワーキングセットを空にできる。Windows 7 および Windows Server
2008 R2 以降、Psapi.h は PSAPI 関数群にバージョン番号を設定している。PSAPI
バージョン番号は、関数を呼び出す際に使用する名前と、プログラムがロードする必要のあるライブラリに影響を与える。PSAPI_VERSION
が 2 以上の場合、この関数は Psapi.h で K32EmptyWorkingSet として定義され、Kernel32.lib および
Kernel32.dll からエクスポートされる。PSAPI_VERSION が 1 の場合、この関数は Psapi.h で
K32EmptyWorkingSet として定義され、K32EmptyWorkingSet を呼び出すラッパーとして Psapi.lib
および Psapi.dll からエクスポートされる。Windows の旧バージョンと Windows 7
以降の両方で動作する必要があるプログラムは、常に K32EmptyWorkingSet
として呼び出すべきである。シンボル解決を正しく行うには、TARGETLIBS マクロに Psapi.lib
を追加し、-DPSAPI_VERSION=1 を指定してプログラムをコンパイルする。実行時動的リンクを利用するには、Psapi.dll
をロードする。


%index
EnumDeviceDrivers
システム内の各デバイスドライバーのロードアドレスを取得する。
%prm
lpImageBase, cb, lpcbNeeded
lpImageBase : [var] デバイスドライバーのロードアドレスのリストを受け取る配列。
cb : [int] lpImageBase 配列のサイズ（バイト単位）。配列がロードアドレスを格納するのに十分でない場合、lpcbNeeded パラメータには必要な配列サイズが返される。
lpcbNeeded : [var] lpImageBase 配列に返されるバイト数。
%inst
システム内の各デバイスドライバーのロードアドレスを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
EnumDeviceDrivers 呼び出しによって列挙されたデバイスドライバーの数を求めるには、lpcbNeeded パラメータの値を
sizeof(LPVOID) で除算する。Windows 7 および Windows Server 2008 R2 以降、Psapi.h
は PSAPI 関数群にバージョン番号を設定している。PSAPI
バージョン番号は、関数を呼び出す際に使用する名前と、プログラムがロードする必要のあるライブラリに影響を与える。PSAPI_VERSION
が 2 以上の場合、この関数は Psapi.h で K32EnumDeviceDrivers として定義され、Kernel32.lib
および Kernel32.dll からエクスポートされる。PSAPI_VERSION が 1 の場合、この関数は Psapi.h で
EnumDeviceDrivers として定義され、K32EnumDeviceDrivers を呼び出すラッパーとして Psapi.lib
および Psapi.dll からエクスポートされる。Windows の旧バージョンと Windows 7
以降の両方で動作する必要があるプログラムは、常に EnumDeviceDrivers
として呼び出すべきである。シンボル解決を正しく行うには、TARGETLIBS マクロに Psapi.lib
を追加し、-DPSAPI_VERSION=1 を指定してプログラムをコンパイルする。実行時動的リンクを利用するには、Psapi.dll
をロードする。


%index
EnumPageFilesW
システムにインストールされている各ページファイルに対してコールバックルーチンを呼び出す。(Unicode)
%prm
pCallBackRoutine, pContext
pCallBackRoutine : [int] 各ページファイルに対して呼び出されるルーチンへのポインタ。詳細は EnumPageFilesProc を参照。
pContext : [intptr] コールバックルーチンに渡されるユーザー定義データ。
%inst
システムにインストールされている各ページファイルに対してコールバックルーチンを呼び出す。(Unicode)

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
Windows 7 および Windows Server 2008 R2 以降、Psapi.h は PSAPI
関数群にバージョン番号を設定している。PSAPI
バージョン番号は、関数を呼び出す際に使用する名前と、プログラムがロードする必要のあるライブラリに影響を与える。PSAPI_VERSION
が 2 以上の場合、この関数は Psapi.h で K32EnumPageFiles として定義され、Kernel32.lib および
Kernel32.dll からエクスポートされる。PSAPI_VERSION が 1 の場合、この関数は Psapi.h で
EnumPageFiles として定義され、K32EnumPageFiles を呼び出すラッパーとして Psapi.lib および
Psapi.dll からエクスポートされる。Windows の旧バージョンと Windows 7
以降の両方で動作する必要があるプログラムは、常に EnumPageFiles
として呼び出すべきである。シンボル解決を正しく行うには、TARGETLIBS マクロに Psapi.lib
を追加し、-DPSAPI_VERSION=1 を指定してプログラムをコンパイルする。実行時動的リンクを利用するには、Psapi.dll
をロードする。
> [!NOTE] > psapi.h ヘッダは EnumPageFiles を、UNICODE
プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または Unicode
版を自動的に選択するエイリアスとして定義している。エンコーディング中立なエイリアスとエンコーディング中立でないコードを混在させると、コンパイルや実行時のエラーにつながる不一致が発生する場合がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
EnumProcessModules
指定プロセス内の各モジュールのハンドルを取得する。
%prm
hProcess, lphModule, cb, lpcbNeeded
hProcess : [intptr] プロセスのハンドル。
lphModule : [intptr] モジュールハンドルのリストを受け取る配列。
cb : [int] lphModule 配列のサイズ(バイト単位)。
lpcbNeeded : [var] すべてのモジュールハンドルを格納するのに必要なバイト数。
%inst
指定プロセス内の各モジュールのハンドルを取得する。

[戻り値]
成功時は 0 以外、失敗時は 0 を返す。拡張エラー情報は GetLastError で取得する。

[備考]

本関数は主にデバッガなど別プロセスのモジュール情報を取得するツール向けに設計されている。対象プロセスのモジュールリストが壊れていたり未初期化、または呼び出し中に
DLL のロード/アンロードで変化した場合は失敗や不正結果を返すことがある。大きな配列を使うのが望ましい。lpcbNeeded > cb
なら配列を拡大して再試行する。32 ビットアプリが WOW64 上で呼び出した場合は 32 ビットプロセスのモジュールしか列挙できず、64
ビットプロセスに対してはエラー (ERROR_PARTIAL_COPY = 299) となる。返されたハンドルに対して
CloseHandle を呼んではならない。PSAPI_VERSION による動作は EnumProcesses と同様。


%index
EnumProcessModulesEx
指定したフィルタ条件に一致する、指定プロセス内の各モジュールのハンドルを取得する。
%prm
hProcess, lphModule, cb, lpcbNeeded, dwFilterFlag
hProcess : [intptr] プロセスのハンドル。
lphModule : [intptr] モジュールハンドルのリストを受け取る配列。
cb : [int] lphModule 配列のサイズ（バイト単位）。
lpcbNeeded : [var] lphModule 配列にすべてのモジュールハンドルを格納するために必要なバイト数。
dwFilterFlag : [int] 
%inst
指定したフィルタ条件に一致する、指定プロセス内の各モジュールのハンドルを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
EnumProcessModulesEx
関数は主に、別プロセスからモジュール情報を取り出す必要があるデバッガなどのアプリケーション向けに設計されている。対象プロセスのモジュールリストが破損していたり、まだ初期化されていなかったり、関数呼び出し中に
DLL のロードやアンロードによってモジュールリストが変化したりすると、EnumProcessModulesEx
は失敗するか不正確な情報を返す可能性がある。この関数は主に 64 ビットアプリケーション向けである。WOW64 上で動作する 32
ビットアプリケーションから呼び出された場合、dwFilterFlag オプションは無視され、EnumProcessModules
関数と同じ結果を返す。EnumProcessModulesEx
を呼び出した時点でプロセス内にいくつのモジュールが存在するかは予測しにくいため、HMODULE
値の大きな配列を指定するのが望ましい。lphModule
配列がプロセスのすべてのモジュールハンドルを保持するには小さすぎるかどうかを判断するには、lpcbNeeded に返された値と cb
に指定した値を比較する。lpcbNeeded が cb より大きい場合、配列のサイズを大きくして EnumProcessModulesEx
を再度呼び出す。EnumProcessModulesEx 呼び出しによって列挙されたモジュール数を求めるには、lpcbNeeded
パラメータの値を sizeof(HMODULE) で除算する。EnumProcessModulesEx 関数は
LOAD_LIBRARY_AS_DATAFILE フラグでロードされたモジュールのハンドルを取得しない。詳細は LoadLibraryEx
を参照。この関数で返されたハンドルに対して CloseHandle
を呼び出してはならない。情報はスナップショットから得られるため、解放すべきリソースは存在しない。指定プロセスとそれらが使用するヒープ、モジュール、スレッドのスナップショットを取得するには、CreateToolhelp32Snapshot
関数を使用する。Windows 7 および Windows Server 2008 R2 以降、Psapi.h は PSAPI
関数群にバージョン番号を設定している。PSAPI
バージョン番号は、関数を呼び出す際に使用する名前と、プログラムがロードする必要のあるライブラリに影響を与える。PSAPI_VERSION
が 2 以上の場合、この関数は Psapi.h で K32EnumProcessModulesEx
として定義され、Kernel32.lib および Kernel32.dll からエクスポートされる。PSAPI_VERSION が 1
の場合、この関数は Psapi.h で EnumProcessModulesEx
として定義され、K32EnumProcessModulesEx を呼び出すラッパーとして Psapi.lib および Psapi.dll
からエクスポートされる。Windows の旧バージョンと Windows 7 以降の両方で動作する必要があるプログラムは、常に
EnumProcessModulesEx として呼び出すべきである。シンボル解決を正しく行うには、TARGETLIBS マクロに
Psapi.lib を追加し、-DPSAPI_VERSION=1
を指定してプログラムをコンパイルする。実行時動的リンクを利用するには、Psapi.dll をロードする。


%index
EnumProcesses
システム内の各プロセスオブジェクトのプロセス識別子を取得する。
%prm
lpidProcess, cb, lpcbNeeded
lpidProcess : [var] プロセス識別子のリストを受け取る配列へのポインタ。
cb : [int] pProcessIds 配列のサイズ(バイト単位)。
lpcbNeeded : [var] pProcessIds 配列に返されたバイト数。
%inst
システム内の各プロセスオブジェクトのプロセス識別子を取得する。

[戻り値]
成功時は 0 以外、失敗時は 0 を返す。拡張エラー情報は GetLastError で取得する。

[備考]
EnumProcesses
呼び出し時に存在するプロセス数を事前予測するのは難しいため、大きな配列を使うのが望ましい。列挙されたプロセス数は lpcbNeeded を
sizeof(DWORD) で割って求める。バッファ不足時の通知はないため、lpcbNeeded が cb
と等しい場合は配列を拡大して再試行を検討する。プロセスハンドル取得には OpenProcess を使用する。Windows 7 /
Windows Server 2008 R2 以降、Psapi.h は PSAPI
関数にバージョン番号を設定した。PSAPI_VERSION が 2 以上では本関数は K32EnumProcesses として定義され
Kernel32 からエクスポートされる。1 の場合は従来通り Psapi.dll の EnumProcesses
として呼び出される。古い Windows との互換が必要なら EnumProcesses
として呼び出し、-DPSAPI_VERSION=1 でコンパイルする。


%index
GetDeviceDriverBaseNameW
指定されたデバイスドライバーのベース名を取得する。(Unicode)
%prm
ImageBase, lpBaseName, nSize
ImageBase : [intptr] デバイスドライバーのロードアドレス。この値は EnumDeviceDrivers 関数で取得できる。
lpBaseName : [wstr] デバイスドライバーのベース名を受け取るバッファへのポインタ。
nSize : [int] lpBaseName バッファのサイズ（文字数）。バッファがベース名と終端の null 文字を格納するのに十分でない場合、文字列は切り詰められる。
%inst
指定されたデバイスドライバーのベース名を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はバッファにコピーされた文字列の長さ（終端の null 文字を含まない）となる。関数が失敗した場合、戻り値は 0
となる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
Windows 7 および Windows Server 2008 R2 以降、Psapi.h は PSAPI
関数群にバージョン番号を設定している。PSAPI
バージョン番号は、関数を呼び出す際に使用する名前と、プログラムがロードする必要のあるライブラリに影響を与える。PSAPI_VERSION
が 2 以上の場合、この関数は Psapi.h で K32GetDeviceDriverBaseName
として定義され、Kernel32.lib および Kernel32.dll からエクスポートされる。PSAPI_VERSION が 1
の場合、この関数は Psapi.h で GetDeviceDriverBaseName
として定義され、K32GetDeviceDriverBaseName を呼び出すラッパーとして Psapi.lib および
Psapi.dll からエクスポートされる。Windows の旧バージョンと Windows 7
以降の両方で動作する必要があるプログラムは、常に GetDeviceDriverBaseName
として呼び出すべきである。シンボル解決を正しく行うには、TARGETLIBS マクロに Psapi.lib
を追加し、-DPSAPI_VERSION=1 を指定してプログラムをコンパイルする。実行時動的リンクを利用するには、Psapi.dll
をロードする。


%index
GetDeviceDriverFileNameW
指定されたデバイスドライバーで利用可能なパスを取得する。(Unicode)
%prm
ImageBase, lpFilename, nSize
ImageBase : [intptr] デバイスドライバーのロードアドレス。
lpFilename : [wstr] デバイスドライバーへのパスを受け取るバッファへのポインタ。
nSize : [int] lpFilename バッファのサイズ（文字数）。バッファがパスと終端の null 文字を格納するのに十分でない場合、文字列は切り詰められる。
%inst
指定されたデバイスドライバーで利用可能なパスを取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はバッファにコピーされた文字列の長さ（終端の null 文字を含まない）となる。関数が失敗した場合、戻り値は 0
となる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
Windows 7 および Windows Server 2008 R2 以降、Psapi.h は PSAPI
関数群にバージョン番号を設定している。PSAPI
バージョン番号は、関数を呼び出す際に使用する名前と、プログラムがロードする必要のあるライブラリに影響を与える。PSAPI_VERSION
が 2 以上の場合、この関数は Psapi.h で K32GetDeviceDriverFileName
として定義され、Kernel32.lib および Kernel32.dll からエクスポートされる。PSAPI_VERSION が 1
の場合、この関数は Psapi.h で GetDeviceDriverFileName
として定義され、K32GetDeviceDriverFileName を呼び出すラッパーとして Psapi.lib および
Psapi.dll からエクスポートされる。Windows の旧バージョンと Windows 7
以降の両方で動作する必要があるプログラムは、常に GetDeviceDriverFileName
として呼び出すべきである。シンボル解決を正しく行うには、TARGETLIBS マクロに Psapi.lib
を追加し、-DPSAPI_VERSION=1 を指定してプログラムをコンパイルする。実行時動的リンクを利用するには、Psapi.dll
をロードする。
> [!NOTE] > psapi.h ヘッダは GetDeviceDriverFileName を、UNICODE
プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または Unicode
版を自動的に選択するエイリアスとして定義している。エンコーディング中立なエイリアスとエンコーディング中立でないコードを混在させると、コンパイルや実行時のエラーにつながる不一致が発生する場合がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetMappedFileNameW
指定されたアドレスが、指定プロセスのアドレス空間内のメモリマップトファイルの中にあるかを確認する。該当する場合、関数はそのメモリマップトファイルの名前を返す。(Unicode)
%prm
hProcess, lpv, lpFilename, nSize
hProcess : [intptr] プロセスのハンドル。ハンドルには PROCESS_QUERY_INFORMATION アクセス権が必要である。詳細は「Process Security and Access Rights」を参照。
lpv : [intptr] 検証するアドレス。
lpFilename : [wstr] lpv で指定したアドレスが属するメモリマップトファイルの名前を受け取るバッファへのポインタ。
nSize : [int] lpFilename バッファのサイズ（文字数）。
%inst

指定されたアドレスが、指定プロセスのアドレス空間内のメモリマップトファイルの中にあるかを確認する。該当する場合、関数はそのメモリマップトファイルの名前を返す。(Unicode)

[戻り値]
関数が成功した場合、戻り値はバッファにコピーされた文字列の長さ（文字数）となる。関数が失敗した場合、戻り値は 0
となる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
Windows 7 および Windows Server 2008 R2 以降、Psapi.h は PSAPI
関数群にバージョン番号を設定している。PSAPI
バージョン番号は、関数を呼び出す際に使用する名前と、プログラムがロードする必要のあるライブラリに影響を与える。PSAPI_VERSION
が 2 以上の場合、この関数は Psapi.h で K32GetMappedFileName として定義され、Kernel32.lib
および Kernel32.dll からエクスポートされる。PSAPI_VERSION が 1 の場合、この関数は Psapi.h で
GetMappedFileName として定義され、K32GetMappedFileName を呼び出すラッパーとして Psapi.lib
および Psapi.dll からエクスポートされる。Windows の旧バージョンと Windows 7
以降の両方で動作する必要があるプログラムは、常に GetMappedFileName
として呼び出すべきである。シンボル解決を正しく行うには、TARGETLIBS マクロに Psapi.lib
を追加し、-DPSAPI_VERSION=1 を指定してプログラムをコンパイルする。実行時動的リンクを利用するには、Psapi.dll
をロードする。Windows Server 2012 では、この関数は次のテクノロジーでサポートされる。
（以下省略）


%index
GetModuleBaseNameW
指定モジュールのベース名を取得する。(Unicode)
%prm
hProcess, hModule, lpBaseName, nSize
hProcess : [intptr] モジュールを含むプロセスのハンドル。PROCESS_QUERY_INFORMATION と PROCESS_VM_READ アクセス権が必要。
hModule : [intptr] モジュールのハンドル。NULL の場合、呼び出し元プロセスの作成に使われたファイル名を返す。
lpBaseName : [wstr] モジュールのベース名を受け取るバッファへのポインタ。nSize より長い場合は切り詰められる。
nSize : [int] lpBaseName バッファのサイズ(文字単位)。
%inst
指定モジュールのベース名を取得する。(Unicode)

[戻り値]
成功時はバッファにコピーされた文字数を返す。失敗時は 0。拡張エラー情報は GetLastError で取得する。

[備考]
本関数は主にデバッガなど別プロセスのモジュール情報を取得するツール向け。現在のプロセスのモジュールベース名を取得するには
GetModuleFileName + strrchr
の方が効率的で信頼できる。リモートプロセスの主実行モジュールのベース名を取得するには GetProcessImageFileName
または QueryFullProcessImageName を使う方がよい。LOAD_LIBRARY_AS_DATAFILE
でロードされたモジュールには対応しない。PSAPI_VERSION 関連の動作は他の psapi 関数と同様。


%index
GetModuleFileNameExW
指定モジュールを含むファイルの完全修飾パスを取得する。(Unicode)
%prm
hProcess, hModule, lpFilename, nSize
hProcess : [intptr] モジュールを含むプロセスのハンドル。PROCESS_QUERY_INFORMATION および PROCESS_VM_READ 権限が必要。Windows 10/Server 2016 以降では、hModule が NULL の場合 PROCESS_QUERY_LIMITED_INFORMATION だけで十分。LOAD_LIBRARY_AS_DATAFILE でロードされたモジュールのパスは取得できない。
hModule : [intptr] モジュールのハンドル。NULL の場合、hProcess に指定したプロセスの実行ファイルのパスを返す。
lpFilename : [wstr] モジュールへの完全修飾パスを受け取るバッファへのポインタ。バッファが小さい場合、ファイル名は切り詰められて NULL 終端される。
nSize : [int] lpFilename バッファのサイズ(文字単位)。
%inst
指定モジュールを含むファイルの完全修飾パスを取得する。(Unicode)

[戻り値]
成功時はバッファにコピーされた文字列長を返す。失敗時は 0。拡張エラー情報は GetLastError で取得する。

[備考]
主にデバッガなど別プロセスのモジュール情報取得用。現プロセスのモジュール名取得には GetModuleFileName
の方が効率的で信頼できる。リモートプロセスの主実行モジュール名取得には GetProcessImageFileName または
QueryFullProcessImageName を使う方がよい。PSAPI_VERSION 関連は他の psapi 関数と同様。


%index
GetModuleInformation
指定されたモジュールに関する情報を MODULEINFO 構造体に取得する。
%prm
hProcess, hModule, lpmodinfo, cb
hProcess : [intptr] モジュールを含むプロセスのハンドル。ハンドルには PROCESS_QUERY_INFORMATION および PROCESS_VM_READ アクセス権が必要である。詳細は「Process Security and Access Rights」を参照。
hModule : [intptr] モジュールのハンドル。
lpmodinfo : [var] モジュールに関する情報を受け取る MODULEINFO 構造体へのポインタ。
cb : [int] MODULEINFO 構造体のサイズ（バイト単位）。
%inst
指定されたモジュールに関する情報を MODULEINFO 構造体に取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
呼び出し元プロセスの情報を取得するには、GetCurrentProcess が返すハンドルを渡す。GetModuleInformation
関数は LOAD_LIBRARY_AS_DATAFILE フラグでロードされたモジュールの情報を取得しない。詳細は
LoadLibraryEx を参照。Windows 7 および Windows Server 2008 R2 以降、Psapi.h は
PSAPI 関数群にバージョン番号を設定している。PSAPI
バージョン番号は、関数を呼び出す際に使用する名前と、プログラムがロードする必要のあるライブラリに影響を与える。PSAPI_VERSION
が 2 以上の場合、この関数は Psapi.h で K32GetModuleInformation
として定義され、Kernel32.lib および Kernel32.dll からエクスポートされる。PSAPI_VERSION が 1
の場合、この関数は Psapi.h で K32GetModuleInformation
として定義され、K32GetModuleInformation を呼び出すラッパーとして Psapi.lib および Psapi.dll
からエクスポートされる。Windows の旧バージョンと Windows 7 以降の両方で動作する必要があるプログラムは、常に
K32GetModuleInformation として呼び出すべきである。シンボル解決を正しく行うには、TARGETLIBS マクロに
Psapi.lib を追加し、-DPSAPI_VERSION=1
を指定してプログラムをコンパイルする。実行時動的リンクを利用するには、Psapi.dll をロードする。


%index
GetPerformanceInfo
PERFORMANCE_INFORMATION 構造体に格納されたパフォーマンス値を取得する。
%prm
pPerformanceInformation, cb
pPerformanceInformation : [var] パフォーマンス情報を受け取る PERFORMANCE_INFORMATION 構造体へのポインタ。
cb : [int] PERFORMANCE_INFORMATION 構造体のサイズ（バイト単位）。
%inst
PERFORMANCE_INFORMATION 構造体に格納されたパフォーマンス値を取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
Windows 7 および Windows Server 2008 R2 以降、Psapi.h は PSAPI
関数群にバージョン番号を設定している。PSAPI
バージョン番号は、関数を呼び出す際に使用する名前と、プログラムがロードする必要のあるライブラリに影響を与える。PSAPI_VERSION
が 2 以上の場合、この関数は Psapi.h で K32GetPerformanceInfo として定義され、Kernel32.lib
および Kernel32.dll からエクスポートされる。PSAPI_VERSION が 1 の場合、この関数は Psapi.h で
GetPerformanceInfo として定義され、K32GetPerformanceInfo を呼び出すラッパーとして
Psapi.lib および Psapi.dll からエクスポートされる。Windows の旧バージョンと Windows 7
以降の両方で動作する必要があるプログラムは、常に GetPerformanceInfo
として呼び出すべきである。シンボル解決を正しく行うには、TARGETLIBS マクロに Psapi.lib
を追加し、-DPSAPI_VERSION=1 を指定してプログラムをコンパイルする。実行時動的リンクを利用するには、Psapi.dll
をロードする。


%index
GetProcessImageFileNameW
指定プロセスの実行ファイル名を取得する。(Unicode)
%prm
hProcess, lpImageFileName, nSize
hProcess : [intptr] プロセスのハンドル。PROCESS_QUERY_INFORMATION または PROCESS_QUERY_LIMITED_INFORMATION アクセス権が必要。Windows Server 2003/Windows XP: PROCESS_QUERY_INFORMATION が必要。
lpImageFileName : [wstr] 実行ファイルへの完全パスを受け取るバッファへのポインタ。
nSize : [int] lpImageFileName バッファのサイズ(文字単位)。
%inst
指定プロセスの実行ファイル名を取得する。(Unicode)

[戻り値]
成功時はバッファにコピーされた文字列長を返す。失敗時は 0。拡張エラー情報は GetLastError で取得する。

[備考]
Psapi.dll は %windir%\System32
にインストールされる。別の場所に複製があるとエントリポイントのエラーが起こるため、対処として別の場所のものを削除/リネームする必要がある。本関数はドライブレターではなくデバイス形式のパスを返す(例:
\Device\Harddisk0\Partition1\... )。現プロセスのモジュール名取得には GetModuleFileName
の方が効率的。Win32 パス形式が必要なら QueryFullProcessImageName を使う。PSAPI_VERSION
関連は他の psapi 関数と同様。
> [!NOTE] > psapi.h は UNICODE マクロに応じて GetProcessImageFileName を
ANSI/Unicode 版のエイリアスとして定義する。


%index
GetProcessMemoryInfo
指定プロセスのメモリ使用情報を取得する。
%prm
Process, ppsmemCounters, cb
Process : [intptr] プロセスのハンドル。**PROCESS_QUERY_INFORMATION** または **PROCESS_QUERY_LIMITED_INFORMATION** アクセス権が必要。**Windows Server 2003 および Windows XP:** **PROCESS_QUERY_INFORMATION** と **PROCESS_VM_READ** が必要。
ppsmemCounters : [var] プロセスのメモリ使用情報を受け取る PROCESS_MEMORY_COUNTERS または PROCESS_MEMORY_COUNTERS_EX 構造体へのポインタ。
cb : [int] ppsmemCounters 構造体のサイズ(バイト単位)。
%inst
指定プロセスのメモリ使用情報を取得する。

[戻り値]
成功時は 0 以外、失敗時は 0 を返す。拡張エラー情報は GetLastError で取得する。

[備考]
Windows 7 / Windows Server 2008 R2 以降、Psapi.h は PSAPI
関数にバージョン番号を設定した。**PSAPI_VERSION** が 2 以上では本関数は
**K32GetProcessMemoryInfo** として定義され Kernel32 からエクスポートされる。1 の場合は従来通り
Psapi.dll 経由となる。互換が必要なら **GetProcessMemoryInfo**
として呼び出し、**-DPSAPI_VERSION=1** でコンパイルする。


%index
GetWsChanges
この関数または InitializeProcessForWsWatch 関数が前回呼び出されてから、指定プロセスのワーキングセットに追加されたページに関する情報を取得する。
%prm
hProcess, lpWatchInfo, cb
hProcess : [intptr] プロセスのハンドル。ハンドルには PROCESS_QUERY_INFORMATION アクセス権が必要である。詳細は「Process Security and Access Rights」を参照。
lpWatchInfo : [var] PSAPI_WS_WATCH_INFORMATION 構造体の配列を受け取る、ユーザーが割り当てたバッファへのポインタ。配列は FaultingPc メンバーが NULL の構造体で終端される。
cb : [int] lpWatchInfo バッファのサイズ（バイト単位）。
%inst
この関数または InitializeProcessForWsWatch
関数が前回呼び出されてから、指定プロセスのワーキングセットに追加されたページに関する情報を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。
lpWatchInfo バッファがすべてのワーキングセット変更レコードを格納するのに十分でない場合、GetLastError は
ERROR_INSUFFICIENT_BUFFER
を返し、バッファは空のまま返される。バッファ用にもっと大きなメモリブロックを再割り当てして再度呼び出すこと。

[備考]
オペレーティングシステムは、ワーキングセットの変更レコードを保持するためにプロセスごとに 1
つのバッファを使用する。複数のアプリケーション（または同一アプリケーションの複数スレッド）が同じプロセスハンドルでこの関数を呼び出した場合、各呼び出しがバッファを空にするため、いずれのアプリケーションもワーキングセットの変更を完全に把握することはできない。オペレーティングシステムはクエリの処理中（およびバッファのクリア中）に新しい変更レコードを記録しない。別のクエリの処理中にもう一つのクエリを受信した場合、関数はエラーコードを
NO_MORE_ENTRIES に設定する。バッファが満杯になると、この関数または InitializeProcessForWsWatch
関数が呼び出されるまで、新しいレコードはバッファに追加されない。データ損失を防ぐため、十分な頻度でこのメソッドを呼び出す必要がある。レコードが失われた場合、配列は
FaultingPc メンバーが NULL で FaultingVa
メンバーが失われたレコード数に設定された構造体で終端される。Windows Server 2003 および Windows XP:
レコードが失われた場合、配列は FaultingPc メンバーが NULL で FaultingVa メンバーが 1
の構造体で終端される。Windows 7 および Windows Server 2008 R2 以降、Psapi.h は PSAPI
関数群にバージョン番号を設定している。PSAPI
バージョン番号は、関数を呼び出す際に使用する名前と、プログラムがロードする必要のあるライブラリに影響を与える。PSAPI_VERSION
が 2 以上の場合、この関数は Psapi.h で K32GetWsChanges として定義され、Kernel32.lib および
Kernel32.dll からエクスポートされる。PSAPI_VERSION が 1 の場合、この関数は Psapi.h で
GetWsChanges として定義され、K32GetWsChanges を呼び出すラッパーとして Psapi.lib および
Psapi.dll からエクスポートされる。Windows の旧バージョンと Windows 7
以降の両方で動作する必要があるプログラムは、常に GetWsChanges
として呼び出すべきである。シンボル解決を正しく行うには、TARGETLIBS マクロに Psapi.lib
を追加し、-DPSAPI_VERSION=1 を指定してプログラムをコンパイルする。実行時動的リンクを利用するには、Psapi.dll
をロードする。


%index
GetWsChangesEx
この関数または InitializeProcessForWsWatch 関数が前回呼び出されてから、指定プロセスのワーキングセットに追加されたページに関する拡張情報を取得する。
%prm
hProcess, lpWatchInfoEx, cb
hProcess : [intptr] プロセスのハンドル。ハンドルには PROCESS_QUERY_INFORMATION アクセス権が必要である。詳細は「Process Security and Access Rights」を参照。
lpWatchInfoEx : [var] PSAPI_WS_WATCH_INFORMATION_EX 構造体の配列を受け取る、ユーザーが割り当てたバッファへのポインタ。配列は FaultingPc メンバーが NULL の構造体で終端される。
cb : [var] lpWatchInfoEx バッファのサイズ（バイト単位）。
%inst
この関数または InitializeProcessForWsWatch
関数が前回呼び出されてから、指定プロセスのワーキングセットに追加されたページに関する拡張情報を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。
関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
関数を呼び出す。lpWatchInfoEx
バッファがすべてのワーキングセット変更レコードを格納するのに十分でない場合、GetLastError 関数は
ERROR_INSUFFICIENT_BUFFER
を返し、バッファは空のまま返される。バッファ用にもっと大きなメモリブロックを再割り当てして再度呼び出すこと。

[備考]
オペレーティングシステムは、ワーキングセットの変更レコードを保持するためにプロセスごとに 1
つのバッファを使用する。複数のアプリケーション（または同一アプリケーションの複数スレッド）が同じプロセスハンドルでこの関数を呼び出した場合、各呼び出しがバッファを空にするため、いずれのアプリケーションもワーキングセットの変更を完全に把握することはできない。オペレーティングシステムはクエリの処理中（およびバッファのクリア中）に新しい変更レコードを記録しない。別のクエリの処理中にもう一つのクエリを受信した場合、この関数はエラーコードを
NO_MORE_ENTRIES に設定する。バッファが満杯になると、この関数または InitializeProcessForWsWatch
関数が呼び出されるまで、新しいレコードはバッファに追加されない。データ損失を防ぐため、十分な頻度で GetWsChangesEx
を呼び出す必要がある。レコードが失われた場合、配列は FaultingPc メンバーが NULL で FaultingVa
メンバーが失われたレコード数に設定された構造体で終端される。Windows 7 および Windows Server 2008 R2
以降、Psapi.h は PSAPI 関数群にバージョン番号を設定している。PSAPI
バージョン番号は、関数を呼び出す際に使用する名前と、プログラムがロードする必要のあるライブラリに影響を与える。PSAPI_VERSION
が 2 以上の場合、この関数は Psapi.h で K32GetWsChangesEx として定義され、Kernel32.lib および
Kernel32.dll からエクスポートされる。PSAPI_VERSION が 1 の場合、この関数は Psapi.h で
GetWsChangesEx として定義され、K32GetWsChangesEx を呼び出すラッパーとして Psapi.lib および
Psapi.dll からエクスポートされる。Windows の旧バージョンと Windows 7
以降の両方で動作する必要があるプログラムは、常に GetWsChangesEx
として呼び出すべきである。シンボル解決を正しく行うには、TARGETLIBS マクロに Psapi.lib
を追加し、-DPSAPI_VERSION=1 を指定してプログラムをコンパイルする。実行時動的リンクを利用するには、Psapi.dll
をロードする。


%index
InitializeProcessForWsWatch
指定プロセスのワーキングセットの監視を開始する。
%prm
hProcess
hProcess : [intptr] プロセスのハンドル。ハンドルには PROCESS_QUERY_INFORMATION アクセス権が必要である。詳細は「Process Security and Access Rights」を参照。
%inst
指定プロセスのワーキングセットの監視を開始する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
Windows 7 および Windows Server 2008 R2 以降、Psapi.h は PSAPI
関数群にバージョン番号を設定している。PSAPI
バージョン番号は、関数を呼び出す際に使用する名前と、プログラムがロードする必要のあるライブラリに影響を与える。PSAPI_VERSION
が 2 以上の場合、この関数は Psapi.h で K32InitializeProcessForWsWatch
として定義され、Kernel32.lib および Kernel32.dll からエクスポートされる。PSAPI_VERSION が 1
の場合、この関数は Psapi.h で InitializeProcessForWsWatch
として定義され、K32InitializeProcessForWsWatch を呼び出すラッパーとして Psapi.lib および
Psapi.dll からエクスポートされる。Windows の旧バージョンと Windows 7
以降の両方で動作する必要があるプログラムは、常に InitializeProcessForWsWatch
として呼び出すべきである。シンボル解決を正しく行うには、TARGETLIBS マクロに Psapi.lib
を追加し、-DPSAPI_VERSION=1 を指定してプログラムをコンパイルする。実行時動的リンクを利用するには、Psapi.dll
をロードする。


%index
QueryWorkingSet
指定プロセスのワーキングセットに現在追加されているページに関する情報を取得する。
%prm
hProcess, pv, cb
hProcess : [intptr] プロセスのハンドル。ハンドルには PROCESS_QUERY_INFORMATION および PROCESS_VM_READ アクセス権が必要である。詳細は「Process Security and Access Rights」を参照。
pv : [intptr] 情報を受け取るバッファへのポインタ。詳細は PSAPI_WORKING_SET_INFORMATION を参照。pv パラメータが指すバッファが対象プロセスのすべてのワーキングセットエントリを格納するのに十分でない場合、関数は ERROR_BAD_LENGTH で失敗する。この場合、PSAPI_WORKING_SET_INFORMATION 構造体の NumberOfEntries メンバーには必要なエントリ数が設定されるが、関数はワーキングセットエントリの情報を返さない。
cb : [int] pv バッファのサイズ（バイト単位）。
%inst
指定プロセスのワーキングセットに現在追加されているページに関する情報を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
Windows 7 および Windows Server 2008 R2 以降、Psapi.h は PSAPI
関数群にバージョン番号を設定している。PSAPI
バージョン番号は、関数を呼び出す際に使用する名前と、プログラムがロードする必要のあるライブラリに影響を与える。PSAPI_VERSION
が 2 以上の場合、この関数は Psapi.h で K32QueryWorkingSet として定義され、Kernel32.lib および
Kernel32.dll からエクスポートされる。PSAPI_VERSION が 1 の場合、この関数は Psapi.h で
QueryWorkingSet として定義され、K32QueryWorkingSet を呼び出すラッパーとして Psapi.lib および
Psapi.dll からエクスポートされる。Windows の旧バージョンと Windows 7
以降の両方で動作する必要があるプログラムは、常に QueryWorkingSet
として呼び出すべきである。シンボル解決を正しく行うには、TARGETLIBS マクロに Psapi.lib
を追加し、-DPSAPI_VERSION=1 を指定してプログラムをコンパイルする。実行時動的リンクを利用するには、Psapi.dll
をロードする。


%index
QueryWorkingSetEx
指定プロセスのアドレス空間内の特定の仮想アドレスにあるページに関する拡張情報を取得する。
%prm
hProcess, pv, cb
hProcess : [intptr] プロセスのハンドル。ハンドルには PROCESS_QUERY_INFORMATION アクセス権が必要である。詳細は「Process Security and Access Rights」を参照。
pv : [intptr] PSAPI_WORKING_SET_EX_INFORMATION 構造体の配列へのポインタ。入力時には、配列の各項目に問い合わせ対象の仮想アドレスを指定する。出力時には、配列の各項目に対応する仮想ページに関する情報が返される。
cb : [int] pv バッファのサイズ（バイト単位）。
%inst
指定プロセスのアドレス空間内の特定の仮想アドレスにあるページに関する拡張情報を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
対象プロセスのワーキングセットに限定される QueryWorkingSet 関数とは異なり、QueryWorkingSetEx
関数はプロセスのワーキングセットには含まれないがプロセスの一部であるアドレス（AWE
やラージページなど）を問い合わせるために使用できる。Windows 7 および Windows Server 2008 R2
以降、Psapi.h は PSAPI 関数群にバージョン番号を設定している。PSAPI
バージョン番号は、関数を呼び出す際に使用する名前と、プログラムがロードする必要のあるライブラリに影響を与える。PSAPI_VERSION
が 2 以上の場合、この関数は Psapi.h で K32QueryWorkingSetEx として定義され、Kernel32.lib
および Kernel32.dll からエクスポートされる。PSAPI_VERSION が 1 の場合、この関数は Psapi.h で
QueryWorkingSetEx として定義され、K32QueryWorkingSetEx を呼び出すラッパーとして Psapi.lib
および Psapi.dll からエクスポートされる。Windows の旧バージョンと Windows 7
以降の両方で動作する必要があるプログラムは、常に QueryWorkingSetEx
として呼び出すべきである。シンボル解決を正しく行うには、TARGETLIBS マクロに Psapi.lib
を追加し、"-DPSAPI_VERSION=1" を指定してプログラムをコンパイルする。実行時動的リンクを利用するには、Psapi.dll
をロードする。

