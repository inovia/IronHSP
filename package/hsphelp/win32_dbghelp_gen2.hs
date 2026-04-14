; ============================================================
;   dbghelp.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
StackWalk64
スタックトレースを取得する。(StackWalk64)
%group
Win32 dbghelp
%prm
MachineType, hProcess, hThread, StackFrame, ContextRecord, ReadMemoryRoutine, FunctionTableAccessRoutine, GetModuleBaseRoutine, TranslateAddress
MachineType : [int] スタックトレース対象コンピュータのアーキテクチャ種別。以下のいずれかを指定できる。
hProcess : [intptr] スタックトレース対象プロセスのハンドル。ReadMemoryRoutine に有効なコールバックを渡す場合は必ずしも有効なプロセスハンドルである必要はなく、StackWalk64 呼び出し全体で一意かつ一貫していればトークンでもよい。シンボルハンドラと併用する場合は各関数呼び出しで同じプロセスハンドルを使うこと。
hThread : [intptr] スタックトレース対象スレッドのハンドル。ReadMemoryRoutine に有効なコールバックを渡す場合、必ずしも有効なスレッドハンドルである必要はない。
StackFrame : [var] STACKFRAME64 構造体へのポインタ。成功時、次のフレームの情報を受け取る。
ContextRecord : [intptr] CONTEXT 構造体へのポインタ。MachineType が IMAGE_FILE_MACHINE_I386 でない場合に必須。有効なコンテキストレコードを渡すと StackWalk64 が処理できる状況の幅が広がる。このコンテキストは変更される可能性があるため、変更されたくないコンテキストは渡さないこと。
ReadMemoryRoutine : [int] メモリ読み取りサービスを提供するコールバックルーチン。プロセスのアドレス空間からメモリを読むときに呼ばれる。NULL を渡すと既定のルーチンが使われ、その場合 hProcess は有効なプロセスハンドルでなければならない。
FunctionTableAccessRoutine : [int] プロセスのランタイム関数テーブルへのアクセスを提供するコールバックルーチン。通常 SymFunctionTableAccess64 を渡せばよい。
GetModuleBaseRoutine : [int] 任意の仮想アドレスに対するモジュールベースを提供するコールバック。通常 SymGetModuleBase64 を渡せばよい。
TranslateAddress : [int] 16 ビットアドレス変換用コールバック。ほとんどの呼び出し元は NULL を渡せばよい。
%inst
スタックトレースを取得する。(StackWalk64)

[戻り値]
成功時は TRUE、失敗時は FALSE を返す。StackWalk64 は通常 last error を設定しないことに注意。

[備考]
StackWalk64
はスタックトレース取得のための移植可能な方法を提供する。自前実装よりも本関数の利用が推奨される。StackFrame の
AddrPC、AddrFrame、AddrStack メンバーが初期化されていない場合、初回呼び出しは失敗する。DbgHelp
のすべての関数と同様、本関数は単一スレッドでのみ動作するため、複数スレッドからの呼び出しは同期が必要。本関数は従来の StackWalk
を置き換えるものである。
（以下省略）


%index
SymCleanup
プロセスハンドルに関連付けられたすべてのリソースを解放する。
%group
Win32 dbghelp
%prm
hProcess
hProcess : [intptr] 元々 SymInitialize に渡したプロセスハンドル。
%inst
プロセスハンドルに関連付けられたすべてのリソースを解放する。

[戻り値]
成功時は TRUE、失敗時は FALSE を返す。拡張エラー情報は GetLastError で取得する。

[備考]
本関数を呼び出さないとメモリおよびリソースのリークにつながる。DbgHelp
の他関数同様、本関数は単一スレッドでのみ動作する。プロセス起動時に 1 回 SymInitialize を呼び、終了時に 1 回
SymCleanup を呼ぶのが正しい使い方。


%index
SymFromAddr
SymFromAddr 関数 (dbghelp.h) は指定アドレスに対するシンボル情報を取得する。
%group
Win32 dbghelp
%prm
hProcess, Address, Displacement, Symbol
hProcess : [intptr] プロセスのハンドル。事前に SymInitialize に渡したハンドルでなければならない。
Address : [int64] シンボルを特定したいアドレス。シンボル境界上になくても、シンボル範囲内であれば見つかる。
Displacement : [var] シンボル先頭からのオフセット、または 0。
Symbol : [var] シンボル情報を受け取る SYMBOL_INFO 構造体へのポインタ。シンボル名は可変長であるため、末尾に続く名前用に十分大きいバッファを確保し、MaxNameLen に確保バイト数を設定しておくこと。
%inst
SymFromAddr 関数 (dbghelp.h) は指定アドレスに対するシンボル情報を取得する。

[戻り値]
成功時は TRUE、失敗時は FALSE を返す。拡張エラー情報は GetLastError で取得する。

[備考]
DbgHelp の関数はすべて単一スレッドで動作するため、複数スレッドからの呼び出しは同期が必要。Unicode 版を使うには
DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymGetLineFromAddr64
指定アドレスに対するソース行を特定する。(SymGetLineFromAddr64)
%group
Win32 dbghelp
%prm
hProcess, qwAddr, pdwDisplacement, Line64
hProcess : [intptr] 元々 SymInitialize に渡したプロセスハンドル。
qwAddr : [int64] 行を特定したいアドレス。行境界上にある必要はなく、行範囲内であれば見つかる。
pdwDisplacement : [var] 行先頭からのバイト単位のオフセット、または 0。
Line64 : [var] IMAGEHLP_LINE64 構造体へのポインタ。
%inst
指定アドレスに対するソース行を特定する。(SymGetLineFromAddr64)

[戻り値]
成功時は TRUE、失敗時は FALSE を返す。拡張エラー情報は GetLastError で取得する。

[備考]
呼び出し元は Line バッファを適切に確保し、IMAGEHLP_LINE64
構造体の必要なメンバを事前に設定する必要がある。返されたバッファは他の関数で再利用される可能性があるため、返されたデータはすぐに別のバッファへコピーすること。DbgHelp
の関数同様、単一スレッドでのみ動作する。Unicode 版を使うには DBGHELP_TRANSLATE_TCHAR を定義する。
（以下省略）


%index
SymInitialize
SymInitialize 関数 (dbghelp.h) はプロセスのシンボルハンドラを初期化する。
%group
Win32 dbghelp
%prm
hProcess, UserSearchPath, fInvadeProcess
hProcess : [intptr] 呼び出し元を識別するハンドル。一意で 0 以外であればよく、必ずしもプロセスハンドルである必要はない。プロセスハンドルを使う場合は正しいものを渡すこと。デバッガであればデバッグ対象プロセスのハンドルを使うこと。GetCurrentProcess で得たハンドルは使わないこと。複数コンポーネントが同時に dbghelp を使っているときに予期しない結果を招く可能性がある。NULL は不可。
UserSearchPath : [str] シンボルファイル検索用のパス。複数パスはセミコロン (;) で区切る。NULL を渡すと以下のソースからシンボルパスを構築しようとする:
fInvadeProcess : [int] TRUE の場合、プロセス内のロード済みモジュールを列挙して各モジュールに対して実質的に SymLoadModule64 を呼び出す。
%inst
SymInitialize 関数 (dbghelp.h) はプロセスのシンボルハンドラを初期化する。

[戻り値]
成功時は TRUE、失敗時は FALSE を返す。拡張エラー情報は GetLastError で取得する。

[備考]
SymInitialize はプロセスのシンボルハンドラを初期化する。SymInitialize
に渡すハンドルは、そのプロセスで呼び出す他のシンボルハンドラ関数すべてに同じ値を渡す必要がある。使用後は SymCleanup
を呼んで関連リソースを解放すること。UserSearchPath
に指定したパスに対してはサブディレクトリまで再帰的に検索されるため、ルートを指定するとドライブ全体を検索することになり時間がかかる。プロセス実行可能ファイルのあるディレクトリは自動的には検索パスに含まれない。含めたい場合は
GetModuleFileNameEx を呼んでパスを取得し UserSearchPath に追加する。SymInitialize
を再度呼ぶ前に必ず SymCleanup を呼ぶこと。fInvadeProcess が TRUE
の呼び出しでモジュール一覧を再ロードしたい場合は SymRefreshModuleList を使用する。DbgHelp
の関数は単一スレッドで動作する。Unicode 版を使うには DBGHELP_TRANSLATE_TCHAR を定義する。

