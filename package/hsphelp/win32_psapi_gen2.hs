; ============================================================
;   psapi.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
EnumProcesses
システム内の各プロセスオブジェクトのプロセス識別子を取得する。
%group
Win32 psapi
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
EnumProcessModules
指定プロセス内の各モジュールのハンドルを取得する。
%group
Win32 psapi
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
GetModuleBaseNameW
指定モジュールのベース名を取得する。(Unicode)
%group
Win32 psapi
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
%group
Win32 psapi
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
GetProcessImageFileNameW
指定プロセスの実行ファイル名を取得する。(Unicode)
%group
Win32 psapi
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
%group
Win32 psapi
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

