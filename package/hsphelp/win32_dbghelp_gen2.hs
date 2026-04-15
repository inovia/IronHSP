; ============================================================
;   dbghelp.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
dbghelp.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の dbghelp.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
DbgHelpCreateUserDump
(no summary)
%prm
FileName, Callback, UserData
FileName : [str] 
Callback : [int] 
UserData : [intptr] 
%inst



%index
EnumDirTree
EnumDirTree 関数 (dbghelp.h) は、指定したディレクトリツリー内にある指定ファイルの出現箇所をすべて列挙する。
%prm
hProcess, RootPath, InputPathName, OutputPathBuffer, cb, data
hProcess : [intptr] プロセスへのハンドル。このハンドルは事前に SymInitialize 関数に渡しておく必要がある。
RootPath : [str] ファイル検索を開始するパス。
InputPathName : [str] 検索対象のファイル名。部分パスを指定できる。
OutputPathBuffer : [str] ファイルのフルパスを受け取るバッファへのポインター。関数が失敗した場合や一致するファイルが見つからなかった場合でも、このバッファには最後に見つかったフルパスが格納されたままとなる。このパラメーターは省略可能で、NULL を指定できる。
cb : [int] アプリケーション定義のコールバック関数、または NULL。詳細は EnumDirTreeProc を参照。
data : [intptr] ユーザー定義データ、または NULL。この値はコールバック関数に渡される。
%inst
EnumDirTree 関数 (dbghelp.h) は、指定したディレクトリツリー内にある指定ファイルの出現箇所をすべて列挙する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
SymRegisterCallbackProc64 コールバック関数を登録しておけば、検索をキャンセルできる。EnumDirTree
はファイル操作のたびにこのコールバック関数を CBA_DEFERRED_SYMBOL_LOAD_CANCEL
で呼び出す。コールバック関数が TRUE を返すと EnumDirTree は検索をキャンセルする。DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。Unicode
版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
EnumerateLoadedModules64
指定したプロセスにロード済みのモジュールを列挙する。(EnumerateLoadedModules64)
%prm
hProcess, EnumLoadedModulesCallback, UserContext
hProcess : [intptr] モジュールを列挙する対象プロセスへのハンドル。
EnumLoadedModulesCallback : [int] アプリケーション定義のコールバック関数。詳細は EnumerateLoadedModulesProc64 を参照。
UserContext : [intptr] 省略可能なユーザー定義データ。この値はコールバック関数に渡される。
%inst
指定したプロセスにロード済みのモジュールを列挙する。(EnumerateLoadedModules64)

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。Unicode
版の EnumerateLoadedModulesW64 を呼び出すには DBGHELP_TRANSLATE_TCHAR
を定義する。EnumerateLoadedModulesW64 は DbgHelp.h で次のように定義されている。
（以下省略）


%index
EnumerateLoadedModulesEx
EnumerateLoadedModulesEx 関数 (dbghelp.h) は、指定したプロセスにロード済みのモジュールを列挙する。
%prm
hProcess, EnumLoadedModulesCallback, UserContext
hProcess : [intptr] モジュールを列挙する対象プロセスへのハンドル。
EnumLoadedModulesCallback : [int] アプリケーション定義のコールバック関数。詳細は EnumerateLoadedModulesProc64 を参照。
UserContext : [intptr] 省略可能なユーザー定義データ。この値はコールバック関数に渡される。
%inst
EnumerateLoadedModulesEx 関数 (dbghelp.h) は、指定したプロセスにロード済みのモジュールを列挙する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。Unicode
版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
EnumerateLoadedModulesW64
指定したプロセスにロード済みのモジュールを列挙する。(EnumerateLoadedModulesW64)
%prm
hProcess, EnumLoadedModulesCallback, UserContext
hProcess : [intptr] モジュールを列挙する対象プロセスへのハンドル。
EnumLoadedModulesCallback : [int] アプリケーション定義のコールバック関数。詳細は EnumerateLoadedModulesProc64 を参照。
UserContext : [intptr] 省略可能なユーザー定義データ。この値はコールバック関数に渡される。
%inst
指定したプロセスにロード済みのモジュールを列挙する。(EnumerateLoadedModulesW64)

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。Unicode
版の EnumerateLoadedModulesW64 を呼び出すには DBGHELP_TRANSLATE_TCHAR
を定義する。EnumerateLoadedModulesW64 は DbgHelp.h で次のように定義されている。
（以下省略）


%index
FindDebugInfoFile
デバッグ (.dbg) ファイルを検索する。
%prm
FileName, SymbolPath, DebugFilePath
FileName : [str] 取得したい .dbg ファイルの名前。部分パスを指定できる。
SymbolPath : [str] シンボルファイルが置かれているパス。セミコロンで区切って複数のパスを指定できる。シンボルパスを取得するには SymGetSearchPath 関数を使う。
DebugFilePath : [str] .dbg ファイルのフルパスを受け取るバッファへのポインター。
%inst
デバッグ (.dbg) ファイルを検索する。

[戻り値]
関数が成功した場合、戻り値は .dbg ファイルに対するオープン済みハンドルとなる。関数が失敗した場合、戻り値は NULL
となる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
FindDebugInfoFile 関数は .dbg
ファイルを検索するために用いる。この関数により、単一の関数呼び出しで複数のディレクトリを対象に検索できる。SymbolPath
パラメーターにはセミコロン (;)
で区切って複数のパスを指定できる。複数のパスを指定した場合、関数は各ディレクトリ内でファイルを検索する。サブディレクトリは検索されない。ファイルが見つかった時点で検索は終了する。したがって
SymbolPath にはパスを正しい順序で指定すること。DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。


%index
FindDebugInfoFileEx
FindDebugInfoFileEx 関数 (dbghelp.h) は、指定したデバッグ (.dbg) ファイルを検索する。
%prm
FileName, SymbolPath, DebugFilePath, Callback, CallerData
FileName : [str] 検索する .dbg ファイルの名前。部分パスを指定できる。
SymbolPath : [str] シンボルファイルが置かれているパス。セミコロンで区切って複数のパスを指定できる。シンボルパスを取得するには SymGetSearchPath 関数を使う。
DebugFilePath : [str] .dbg ファイルのフルパスを受け取るバッファへのポインター。
Callback : [int] 正しいファイルが見つかったか、または検索を続行すべきかを判定するアプリケーション定義のコールバック関数。詳細は FindDebugInfoFileProc を参照。
CallerData : [intptr] コールバック関数に渡す省略可能なユーザー定義データ。
%inst
FindDebugInfoFileEx 関数 (dbghelp.h) は、指定したデバッグ (.dbg) ファイルを検索する。

[戻り値]
関数が成功した場合、戻り値は .dbg ファイルに対するオープン済みハンドルとなる。関数が失敗した場合、戻り値は NULL
となる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
FindDebugInfoFileEx 関数は .dbg
ファイルを検索するために用いる。この関数により、単一の関数呼び出しで複数のディレクトリを対象に検索できる。SymbolPath
パラメーターにはセミコロン (;)
で区切って複数のパスを指定できる。複数のパスを指定した場合、関数は指定された各ディレクトリ内でファイルを検索する。ファイルが見つかった時点で検索は終了する。したがって
SymbolPath にはパスを正しい順序で指定すること。指定されたファイル名に .dbg
拡張子が含まれていない場合、FindDebugInfoFileEx は以下の順序でファイルを検索する。
（以下省略）


%index
FindExecutableImage
実行可能ファイルを検索する。
%prm
FileName, SymbolPath, ImageFilePath
FileName : [str] 検索するシンボルファイルの名前。このパラメーターには部分パスを指定できる。
SymbolPath : [str] シンボルファイルが置かれているパス。セミコロンで区切って複数のパスを指定できる。シンボルパスを取得するには SymGetSearchPath 関数を使う。
ImageFilePath : [str] 実行可能ファイルのフルパスを受け取るバッファへのポインター。
%inst
実行可能ファイルを検索する。

[戻り値]
関数が成功した場合、戻り値は実行可能ファイルに対するオープン済みハンドルとなる。関数が失敗した場合、戻り値は NULL
となる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
FindExecutableImage
関数は、単一の関数呼び出しで複数のディレクトリを対象に実行可能ファイルを検索できるように用意されている。SymbolPath
パラメーターにはセミコロン (;)
で区切って複数のパスを指定できる。複数のパスを指定した場合、関数は各ディレクトリツリーを対象に実行可能ファイルを検索する。ファイルが見つかった時点で検索は終了する。したがって
SymbolPath にはパスを正しい順序で指定すること。DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。


%index
FindExecutableImageEx
FindExecutableImageEx 関数 (dbghelp.h) は、指定した実行可能ファイルを検索する。
%prm
FileName, SymbolPath, ImageFilePath, Callback, CallerData
FileName : [str] 検索するシンボルファイルの名前。このパラメーターには部分パスを指定できる。
SymbolPath : [str] シンボルファイルが置かれているパス。この文字列にはセミコロンで区切って複数のパスを指定できる。シンボルパスを取得するには SymGetSearchPath 関数を使う。
ImageFilePath : [str] 実行可能ファイルのフルパスを受け取るバッファへのポインター。
Callback : [int] 正しい実行可能ファイルが見つかったか、または検索を続行すべきかを判定するアプリケーション定義のコールバック関数。詳細は FindExecutableImageProc を参照。
CallerData : [intptr] コールバック関数に渡す省略可能なユーザー定義データ。このパラメーターには NULL を指定できる。
%inst
FindExecutableImageEx 関数 (dbghelp.h) は、指定した実行可能ファイルを検索する。

[戻り値]
関数が成功した場合、戻り値は実行可能ファイルに対するオープン済みハンドルとなる。関数が失敗した場合、戻り値は NULL
となる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
FindExecutableImageEx
関数は、単一の関数呼び出しで複数のディレクトリから実行可能ファイルを見つけられるように用意されている。SymbolPath
パラメーターに複数のパスが含まれる場合、関数は指定された各ディレクトリツリーから実行可能ファイルを検索する。ファイルが見つかった時点で検索は終了する。したがって
SymbolPath にはパスを正しい順序で指定すること。DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。Unicode
版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
FindFileInPath
(no summary)
%prm
hprocess, SearchPathA, FileName, id, two, three, flags, FilePath
hprocess : [intptr] 
SearchPathA : [str] 
FileName : [str] 
id : [intptr] 
two : [int] 
three : [int] 
flags : [int] 
FilePath : [str] 
%inst



%index
FindFileInSearchPath
(no summary)
%prm
hprocess, SearchPathA, FileName, one, two, three, FilePath
hprocess : [intptr] 
SearchPathA : [str] 
FileName : [str] 
one : [int] 
two : [int] 
three : [int] 
FilePath : [str] 
%inst



%index
GetSymLoadError
直近のシンボルロードエラーを取得する。
%prm

%inst
直近のシンボルロードエラーを取得する。

[戻り値]
直近のシンボルロードエラー。


%index
GetTimestampForLoadedLibrary
ロード済みイメージのタイムスタンプを取得する。
%prm
Module
Module : [intptr] MapViewOfFile 関数によりメモリにマップされたイメージのベースアドレス。
%inst
ロード済みイメージのタイムスタンプを取得する。

[戻り値]
関数が成功した場合、戻り値はイメージから取得されたタイムスタンプとなる。関数が失敗した場合、戻り値は 0
となる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
イメージのタイムスタンプはリンカーにより初期設定されるが、リベースなどの操作によって変更されることがある。値はシステム時計により、1970
年 1 月 1 日午前 0 時 (協定世界時) からの経過秒数で表される。タイムスタンプは C ランタイム (CRT) 関数 ctime
で印字できる。DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。


%index
ImageDirectoryEntryToData
イメージ固有のデータへのアクセスを取得する。
%prm
Base, MappedAsImage, DirectoryEntry, Size
Base : [intptr] イメージのベースアドレス。
MappedAsImage : [int] このパラメーターが TRUE の場合、ファイルはシステムによりイメージとしてマップされている。FALSE の場合、ファイルは MapViewOfFile 関数によりデータファイルとしてマップされている。
DirectoryEntry : [int] 
Size : [var] ディレクトリエントリのデータサイズ (バイト単位) を受け取る変数へのポインター。
%inst
イメージ固有のデータへのアクセスを取得する。

[戻り値]
関数が成功した場合、戻り値はディレクトリエントリのデータへのポインターとなる。関数が失敗した場合、戻り値は NULL
となる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
ImageDirectoryEntryToData 関数は、イメージ固有のデータへのアクセスを取得するために用いる。DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。


%index
ImageDirectoryEntryToDataEx
イメージヘッダー内のディレクトリエントリを特定し、そのディレクトリエントリのデータのアドレスを返す。見つかったデータに対応するセクションヘッダーが存在する場合はそれも返す。
%prm
Base, MappedAsImage, DirectoryEntry, Size, FoundHeader
Base : [intptr] イメージまたはデータファイルのベースアドレス。
MappedAsImage : [int] このフラグが TRUE の場合、ファイルはシステムによりイメージとしてマップされている。FALSE の場合、ファイルは MapViewOfFile 関数によりデータファイルとしてマップされている。
DirectoryEntry : [int] 
Size : [var] 見つかったディレクトリエントリのデータサイズを受け取る変数へのポインター。
FoundHeader : [var] データを受け取る IMAGE_SECTION_HEADER 構造体へのポインター。セクションヘッダーが存在しない場合、このパラメーターは NULL となる。
%inst

イメージヘッダー内のディレクトリエントリを特定し、そのディレクトリエントリのデータのアドレスを返す。見つかったデータに対応するセクションヘッダーが存在する場合はそれも返す。

[戻り値]
関数が成功した場合、戻り値はディレクトリエントリのデータへのポインターとなる。関数が失敗した場合、戻り値は NULL
となる。拡張エラー情報を取得するには GetLastError を呼び出す。DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。


%index
ImagehlpApiVersion
システムにインストールされている DbgHelp ライブラリのバージョン情報を取得する。
%prm

%inst
システムにインストールされている DbgHelp ライブラリのバージョン情報を取得する。

[戻り値]
戻り値は API_VERSION 構造体へのポインター。

[備考]

システムにインストールされているライブラリのバージョンが、アプリケーションで使用しているライブラリのバージョンと互換性があるかを確認するには、API_VERSION
構造体の情報を使う。ライブラリ関数は後方互換性があるが、あるバージョンで導入された関数は当然のことながら、それ以前のバージョンでは利用できない。DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。


%index
ImagehlpApiVersionEx
アプリケーションが使用するライブラリのバージョン情報を変更する。
%prm
AppVersion
AppVersion : [var] アプリケーションにとって有効なバージョン情報を保持する API_VERSION 構造体へのポインター。
%inst
アプリケーションが使用するライブラリのバージョン情報を変更する。

[戻り値]
戻り値は API_VERSION 構造体へのポインター。

[備考]
ImagehlpApiVersionEx
関数は、アプリケーションがビルドされたライブラリのバージョンを示すために用いる。ライブラリはこの情報を使って互換性を保つ。例えばカーネルモードのコールバックスタックフレーム
(User と GDI はカーネルモードに存在する) を辿る場合を考える。ImagehlpApiVersionEx を呼び出して
Revision メンバーを 4 以降に設定すると、StackWalk64
関数はコールバックスタックフレームを越えて処理を続ける。それ以外に Revision を 4
より小さいバージョンに設定すると、StackWalk64 はカーネル遷移で停止する。DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。


%index
MakeSureDirectoryPathExists
指定したパスに含まれるすべてのディレクトリを、ルートから順に作成する。
%prm
DirPath
DirPath : [str] 有効なパス名。パスの末尾要素がファイル名ではなくディレクトリである場合、文字列は円記号 (\\) で終わる必要がある。
%inst
指定したパスに含まれるすべてのディレクトリを、ルートから順に作成する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
指定された各ディレクトリがまだ存在しなければ作成される。一部のディレクトリしか作成できなかった場合、関数は FALSE を返す。この関数は
Unicode 文字列をサポートしない。Unicode パスを指定するには SHCreateDirectoryEx
関数を使う。DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。


%index
RangeMapAddPeImageSections
(no summary)
%prm
RmapHandle, ImageName, MappedImage, MappingBytes, ImageBase, UserTag, MappingFlags
RmapHandle : [intptr] 
ImageName : [wstr] 
MappedImage : [intptr] 
MappingBytes : [int] 
ImageBase : [int64] 
UserTag : [int64] 
MappingFlags : [int] 
%inst



%index
RangeMapCreate
(no summary)
%prm

%inst



%index
RangeMapFree
(no summary)
%prm
RmapHandle
RmapHandle : [intptr] 
%inst



%index
RangeMapRead
(no summary)
%prm
RmapHandle, Offset, Buffer, RequestBytes, Flags, DoneBytes
RmapHandle : [intptr] 
Offset : [int64] 
Buffer : [intptr] 
RequestBytes : [int] 
Flags : [int] 
DoneBytes : [var] 
%inst



%index
RangeMapRemove
(no summary)
%prm
RmapHandle, UserTag
RmapHandle : [intptr] 
UserTag : [int64] 
%inst



%index
RangeMapWrite
(no summary)
%prm
RmapHandle, Offset, Buffer, RequestBytes, Flags, DoneBytes
RmapHandle : [intptr] 
Offset : [int64] 
Buffer : [intptr] 
RequestBytes : [int] 
Flags : [int] 
DoneBytes : [var] 
%inst



%index
RemoveInvalidModuleList
(no summary)
%prm
hProcess
hProcess : [intptr] 
%inst



%index
ReportSymbolLoadSummary
(no summary)
%prm
hProcess, pLoadModule, pSymbolData
hProcess : [intptr] 
pLoadModule : [wstr] 
pSymbolData : [var] 
%inst



%index
SearchTreeForFile
SearchTreeForFile 関数 (dbghelp.h) は、ディレクトリツリー内から指定したファイルを検索する。
%prm
RootPath, InputPathName, OutputPathBuffer
RootPath : [str] ファイル検索を開始するパス。
InputPathName : [str] 関数が検索するファイル。部分パスを指定できる。
OutputPathBuffer : [str] 見つかったファイルのフルパスを受け取るバッファへのポインター。戻り値が FALSE の場合、この文字列は変更されない。
%inst
SearchTreeForFile 関数 (dbghelp.h) は、ディレクトリツリー内から指定したファイルを検索する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
関数は RootPath パラメーターで指定されたパスを起点として、InputPathName
パラメーターで指定されたファイルを検索する。RootPath で許容される最大パス深度は 32
ディレクトリである。ディレクトリツリー内でファイルが見つかると、OutputPathBuffer
パラメーターで指定されたバッファにフルパスが格納される。サブディレクトリの検索順序は基盤のファイルシステムに依存する。SymRegisterCallbackProc64
コールバック関数を登録しておけば検索をキャンセルできる。SearchTreeForFile
は検索対象のディレクトリごとに、このコールバック関数を CBA_DEFERRED_SYMBOL_LOAD_CANCEL
で呼び出す。コールバック関数が TRUE を返すと SearchTreeForFile
は検索をキャンセルする。この関数は検索対象ディレクトリごとに 1 回 CBA_DEFERRED_SYMBOL_LOAD_CANCEL
イベントを発生させる。これにより呼び出し側は検索をキャンセルできる。DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。Unicode
版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SetCheckUserInterruptShared
(no summary)
%prm
lpStartAddress
lpStartAddress : [int] 
%inst



%index
SetSymLoadError
シンボルロードエラーを設定する。
%prm
error
error : [int] シンボルロードエラー。
%inst
シンボルロードエラーを設定する。

[戻り値]
この関数は値を返さない。


%index
StackWalk64
スタックトレースを取得する。(StackWalk64)
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
StackWalkEx
スタックトレースを取得する。(StackWalkEx)
%prm
MachineType, hProcess, hThread, StackFrame, ContextRecord, ReadMemoryRoutine, FunctionTableAccessRoutine, GetModuleBaseRoutine, TranslateAddress, Flags
MachineType : [int] スタックトレースを生成する対象コンピューターのアーキテクチャ種別。このパラメーターには以下のいずれかの値を指定できる。
hProcess : [intptr] スタックトレースを生成する対象プロセスへのハンドル。呼び出し元が ReadMemoryRoutine パラメーターに有効なコールバックポインターを指定する場合、この値は有効なプロセスハンドルでなくても構わない。StackWalkEx 関数の呼び出しの間で一意かつ一貫して同じ値を持つトークンでもよい。StackWalkEx と共にシンボルハンドラーを使う場合は、各関数呼び出しで同じプロセスハンドルを使う。
hThread : [intptr] スタックトレースを生成する対象スレッドへのハンドル。呼び出し元が ReadMemoryRoutine パラメーターに有効なコールバックポインターを指定する場合、この値は有効なスレッドハンドルでなくても構わない。StackWalkEx 関数の呼び出しの間で一意かつ一貫して同じ値を持つトークンでもよい。
StackFrame : [var] STACKFRAME_EX 構造体へのポインター。関数呼び出しに成功すると、この構造体に次のフレームの情報が格納される。
ContextRecord : [intptr] CONTEXT 構造体へのポインター。このパラメーターは MachineType パラメーターが IMAGE_FILE_MACHINE_I386 以外の場合にのみ必須である。ただし、より多様な状況に StackWalkEx が対応できるよう、有効なコンテキストレコードを指定することが推奨される。このコンテキストは変更される可能性があるため、変更されては困るコンテキストレコードを渡してはならない。
ReadMemoryRoutine : [int] メモリ読み取りサービスを提供するコールバックルーチン。StackWalkEx 関数がプロセスのアドレス空間からメモリを読み取る必要があるとき、ReadProcessMemoryProc64 コールバックが使用される。このパラメーターが NULL の場合、関数は既定のルーチンを使う。その際 hProcess パラメーターには有効なプロセスハンドルを指定する必要がある。このパラメーターが NULL でない場合、アプリケーションは CBA_READ_MEMORY を処理するシンボルハンドラーのコールバック関数を実装して登録すること。
FunctionTableAccessRoutine : [int] プロセスの実行時関数テーブルへのアクセスを提供するコールバックルーチン。StackWalkEx 関数はプロセスの実行時関数テーブルにアクセスできないため、このパラメーターは必須である。詳細は FunctionTableAccessProc64 を参照。シンボルハンドラーは実行時テーブルをロードおよびアクセスする関数を提供する。それらを使う場合は SymFunctionTableAccess64 を有効なパラメーターとして渡すことができる。
GetModuleBaseRoutine : [int] 任意の仮想アドレスに対応するモジュールのベースアドレスを提供するコールバックルーチン。このパラメーターは必須である。詳細は GetModuleBaseProc64 を参照。シンボルハンドラーはモジュール情報のロードと維持を行う関数を提供する。それらを使う場合は SymGetModuleBase64 を有効なパラメーターとして渡すことができる。
TranslateAddress : [int] 16 ビットアドレスのアドレス変換を提供するコールバックルーチン。詳細は TranslateAddressProc64 を参照。StackWalkEx を呼び出すほとんどの呼び出し元は、このパラメーターに安全に NULL を渡すことができる。
Flags : [int] 0 個以上のフラグの組み合わせ。
%inst
スタックトレースを取得する。(StackWalkEx)

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。StackWalkEx
は通常、最終エラーコードを設定しない点に注意。

[備考]
StackWalkEx
関数は、スタックトレースを取得するための移植性のある手段を提供する。プラットフォームごとのスタックウォークに付随する複雑さを考えると、独自の関数を実装するより
StackWalkEx
を使うことが推奨される。加えて、モジュールのコンパイル方法によってスタックの見え方を変えるコンパイラーオプションも存在する。この関数を使えば、コンパイラーや
OS が変わっても動作し続ける移植性の高いスタックトレースが得られる。StackFrame パラメーターで渡す STACKFRAME64
構造体の AddrPC、AddrFrame、AddrStack
メンバーが初期化されていない場合、この関数の最初の呼び出しは失敗する。DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。


%index
SymAddSourceStream
SymAddSourceStream 関数 (dbghelp.h) は、ソースサーバーで使用するためにストリームを指定したモジュールに追加する。
%prm
hProcess, Base, StreamFile, Buffer, Size
hProcess : [intptr] プロセスへのハンドル。このハンドルは事前に SymInitialize 関数に渡しておく必要がある。
Base : [int64] モジュールのベースアドレス。
StreamFile : [str] ソースインデックスストリームを含むファイルの絶対パスまたは相対パスを示す、NULL 終端の文字列。Buffer が NULL でない場合は NULL を指定できる。
Buffer : [var] ソースインデックスストリームを格納するバッファ。StreamFile が NULL でない場合は NULL を指定できる。
Size : [int] Buffer バッファのサイズ (バイト単位)。
%inst
SymAddSourceStream 関数 (dbghelp.h)
は、ソースサーバーで使用するためにストリームを指定したモジュールに追加する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
SymAddSourceStream
は、ソースサーバーで使用する形式のデータストリームを指定したモジュールに追加する。呼び出し元はストリームを Buffer
パラメーターにバッファとして渡すか、StreamFile
パラメーターにファイルとして渡すことができる。両方のパラメーターが指定された場合、関数は Buffer
パラメーターを使用する。両方のパラメーターが NULL の場合、関数は FALSE を返し、最終エラーコードは
ERROR_INVALID_PARAMETER に設定される。SymAddSourceStream は対応する PDB
にストリームを追加してデータを永続化することはしない点に注意が必要である。この関数は、PDB
が利用できない状況で独自のデバッガをプログラム的に実装する場合に使用される。


%index
SymAddSymbol
SymAddSymbol 関数 (dbghelp.h) は、指定したモジュールに仮想シンボルを追加する。
%prm
hProcess, BaseOfDll, Name, Address, Size, Flags
hProcess : [intptr] プロセスへのハンドル。このハンドルは事前に SymInitialize 関数に渡しておく必要がある。
BaseOfDll : [int64] モジュールのベースアドレス。
Name : [str] シンボルの名前。シンボル名の最大サイズは MAX_SYM_NAME 文字である。
Address : [int64] シンボルのアドレス。このアドレスは指定されたモジュールのアドレス範囲内に含まれていなければならない。
Size : [int] シンボルのサイズ (バイト単位)。このパラメーターは省略可能である。
Flags : [int] このパラメーターは使用されない。
%inst
SymAddSymbol 関数 (dbghelp.h) は、指定したモジュールに仮想シンボルを追加する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。Unicode
版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymAddrIncludeInlineTrace
指定したアドレスがインラインフレーム内にあるかどうかを示す。
%prm
hProcess, Address
hProcess : [intptr] プロセスへのハンドル。このハンドルは事前に SymInitialize 関数に渡しておく必要がある。
Address : [int64] アドレス。
%inst
指定したアドレスがインラインフレーム内にあるかどうかを示す。

[戻り値]
指定アドレスがインラインフレーム内にない場合は 0 を返す。


%index
SymCleanup
プロセスハンドルに関連付けられたすべてのリソースを解放する。
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
SymCompareInlineTrace
2 つのインライントレースを比較する。
%prm
hProcess, Address1, InlineContext1, RetAddress1, Address2, RetAddress2
hProcess : [intptr] プロセスへのハンドル。このハンドルは事前に SymInitialize 関数に渡しておく必要がある。
Address1 : [int64] 比較する 1 つ目のアドレス。
InlineContext1 : [int] 比較する 1 つ目のトレースのインラインコンテキスト。
RetAddress1 : [int64] 比較する 1 つ目のトレースのリターンアドレス。
Address2 : [int64] 比較する 2 つ目のアドレス。
RetAddress2 : [int64] 比較する 2 つ目のトレースのリターンアドレス。
%inst
2 つのインライントレースを比較する。

[戻り値]
比較の結果を示す。
（以下省略）


%index
SymDeleteSymbol
SymDeleteSymbol 関数 (dbghelp.h) は、指定したモジュールから仮想シンボルを削除する。
%prm
hProcess, BaseOfDll, Name, Address, Flags
hProcess : [intptr] プロセスへのハンドル。このハンドルは事前に SymInitialize 関数に渡しておく必要がある。
BaseOfDll : [int64] モジュールのベースアドレス。
Name : [str] シンボルの名前。
Address : [int64] シンボルのアドレス。このアドレスは指定されたモジュールのアドレス範囲内に含まれていなければならない。
Flags : [int] このパラメーターは使用されない。
%inst
SymDeleteSymbol 関数 (dbghelp.h) は、指定したモジュールから仮想シンボルを削除する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。Unicode
版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymEnumLines
SymEnumLines 関数 (dbghelp.h) は、指定したモジュール内のすべての行を列挙する。
%prm
hProcess, Base, Obj, File, EnumLinesCallback, UserContext
hProcess : [intptr] プロセスへのハンドル。このハンドルは事前に SymInitialize 関数に渡しておく必要がある。
Base : [int64] モジュールのベースアドレス。
Obj : [str] モジュール内の .obj ファイルの名前。列挙はこのファイルに限定される。このパラメーターが NULL または空文字列の場合、すべての .obj ファイルが検索される。
File : [str] 検索対象のソースファイル名を示すワイルドカード式。このパラメーターが NULL または空文字列の場合、すべてのファイルが検索される。
EnumLinesCallback : [int] 行情報を受け取る SymEnumLinesProc コールバック関数。
UserContext : [intptr] コールバック関数に渡されるユーザー定義の値、または NULL。このパラメーターは通常、コールバック関数にコンテキストを提供するデータ構造へのポインターを渡すために使用される。
%inst
SymEnumLines 関数 (dbghelp.h) は、指定したモジュール内のすべての行を列挙する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
この関数は PDB 情報に対してのみサポートされる。COFF 情報がある場合は SymGetLineXXX
系関数のいずれかを使用する。DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。Unicode
版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymEnumProcesses
SymInitialize 関数を呼び出したすべてのプロセスを列挙する。
%prm
EnumProcessesCallback, UserContext
EnumProcessesCallback : [int] プロセス情報を受け取る SymEnumProcessesProc コールバック関数。
UserContext : [intptr] コールバック関数に渡されるユーザー定義の値、または NULL。このパラメーターは通常、コールバック関数にコンテキストを提供するデータ構造へのポインターを渡すために使用される。
%inst
SymInitialize 関数を呼び出したすべてのプロセスを列挙する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。
関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。


%index
SymEnumSourceFileTokens
モジュールのソースサーバーデータ内の個々のエントリを、利用可能であればすべて列挙する。
%prm
hProcess, Base, Callback
hProcess : [intptr] プロセスへのハンドル。このハンドルは事前に SymInitialize 関数に渡しておく必要がある。
Base : [int64] モジュールのベースアドレス。
Callback : [int] シンボル情報を受け取る SymEnumSourceFileTokensProc コールバック関数。
%inst
モジュールのソースサーバーデータ内の個々のエントリを、利用可能であればすべて列挙する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
一部のモジュールは PDB
ファイルにソースサーバー情報を持ち、各モジュールの作成に使用された個々のソースファイルのバージョン管理情報が含まれている。アプリケーションはこの関数を使うことで、「ソースインデックス化された」すべてのソースファイルのデータを列挙できる。DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。


%index
SymEnumSourceFiles
SymEnumSourceFiles 関数 (dbghelp.h) は、プロセス内のすべてのソースファイルを列挙する。
%prm
hProcess, ModBase, Mask, cbSrcFiles, UserContext
hProcess : [intptr] プロセスへのハンドル。このハンドルは事前に SymInitialize 関数に渡しておく必要がある。
ModBase : [int64] モジュールのベースアドレス。この値が 0 で、Mask に感嘆符 (!) が含まれている場合、関数はモジュールをまたいで検索する。この値が 0 で Mask に感嘆符が含まれていない場合、関数は SymSetContext 関数で確立されたスコープを使う。
Mask : [str] 列挙するソースファイル名を示すワイルドカード式。モジュール名を指定するには !mod 構文を使う。このパラメーターが NULL の場合、関数はすべてのファイルを列挙する。
cbSrcFiles : [int] ソースファイル情報を受け取る SymEnumSourceFilesProc コールバック関数へのポインター。
UserContext : [intptr] コールバック関数に渡されるユーザー定義の値、または NULL。このパラメーターは通常、コールバック関数にコンテキストを提供するデータ構造へのポインターを渡すために使用される。
%inst
SymEnumSourceFiles 関数 (dbghelp.h) は、プロセス内のすべてのソースファイルを列挙する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。
関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。


%index
SymEnumSourceLines
SymEnumSourceLines 関数 (dbghelp.h) は、モジュール内のすべてのソース行を列挙する。
%prm
hProcess, Base, Obj, File, Line, Flags, EnumLinesCallback, UserContext
hProcess : [intptr] プロセスへのハンドル。このハンドルは事前に SymInitialize 関数に渡しておく必要がある。
Base : [int64] モジュールのベースアドレス。
Obj : [str] モジュール内の .obj ファイルの名前。列挙はこのファイルに限定される。このパラメーターが NULL または空文字列の場合、すべての .obj ファイルが検索される。
File : [str] 検索対象のソースファイル名を示すワイルドカード式。このパラメーターが NULL または空文字列の場合、すべてのファイルが検索される。
Line : [int] モジュール内の行番号。列挙はこの行に限定される。このパラメーターが 0 の場合、すべての行が検索される。
Flags : [int] このパラメーターが ESLFLAG_FULLPATH の場合、関数は File パラメーターのフルパスに対して一致を取る。
EnumLinesCallback : [int] 行情報を受け取る SymEnumLinesProc コールバック関数。
UserContext : [intptr] コールバック関数に渡されるユーザー定義の値、または NULL。このパラメーターは通常、コールバック関数にコンテキストを提供するデータ構造へのポインターを渡すために使用される。
%inst
SymEnumSourceLines 関数 (dbghelp.h) は、モジュール内のすべてのソース行を列挙する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。
関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。


%index
SymEnumSym
(no summary)
%prm
hProcess, BaseOfDll, EnumSymbolsCallback, UserContext
hProcess : [intptr] 
BaseOfDll : [int64] 
EnumSymbolsCallback : [int] 
UserContext : [intptr] 
%inst



%index
SymEnumSymbols
SymEnumSymbols 関数 (dbghelp.h) は、プロセス内のすべてのシンボルを列挙する。
%prm
hProcess, BaseOfDll, Mask, EnumSymbolsCallback, UserContext
hProcess : [intptr] プロセスへのハンドル。このハンドルは事前に SymInitialize 関数に渡しておく必要がある。
BaseOfDll : [int64] モジュールのベースアドレス。この値が 0 で Mask に感嘆符 (!) が含まれている場合、関数はモジュールをまたいで検索する。この値が 0 で Mask に感嘆符が含まれていない場合、関数は SymSetContext 関数で確立されたスコープを使う。
Mask : [str] 列挙するシンボル名を示すワイルドカード文字列。テキストには任意でワイルドカード "*" および "?" を含められる。特定のモジュールまたはモジュール群を指定するには、モジュールを示すワイルドカード文字列の後に感嘆符を付けて先頭に置く。モジュールを指定した場合、BaseOfDll は無視される。
EnumSymbolsCallback : [int] シンボル情報を受け取る SymEnumSymbolsProc コールバック関数。
UserContext : [intptr] コールバック関数に渡されるユーザー定義の値、または NULL。このパラメーターは通常、コールバック関数にコンテキストを提供するデータ構造へのポインターを渡すために使用される。
%inst
SymEnumSymbols 関数 (dbghelp.h) は、プロセス内のすべてのシンボルを列挙する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。Unicode
版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymEnumSymbolsEx
SymEnumSymbolsEx 関数 (dbghelp.h) は、プロセス内のすべてのシンボルを列挙する。
%prm
hProcess, BaseOfDll, Mask, EnumSymbolsCallback, UserContext, Options
hProcess : [intptr] プロセスへのハンドル。このハンドルは事前に SymInitialize 関数に渡しておく必要がある。
BaseOfDll : [int64] モジュールのベースアドレス。この値が 0 で Mask に感嘆符 (!) が含まれている場合、関数はモジュールをまたいで検索する。この値が 0 で Mask に感嘆符が含まれていない場合、関数は SymSetContext 関数で確立されたスコープを使う。
Mask : [str] 列挙するシンボル名を示すワイルドカード文字列。テキストには任意でワイルドカード "*" および "?" を含められる。特定のモジュールまたはモジュール群を指定するには、モジュールを示すワイルドカード文字列の後に感嘆符を付けて先頭に置く。モジュールを指定した場合、BaseOfDll は無視される。
EnumSymbolsCallback : [int] シンボル情報を受け取る SymEnumSymbolsProc コールバック関数。
UserContext : [intptr] コールバック関数に渡されるユーザー定義の値、または NULL。このパラメーターは通常、コールバック関数にコンテキストを提供するデータ構造へのポインターを渡すために使用される。
Options : [int] 指定可能なオプションを示す。
%inst
SymEnumSymbolsEx 関数 (dbghelp.h) は、プロセス内のすべてのシンボルを列挙する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。


%index
SymEnumSymbolsForAddr
SymEnumSymbolsForAddr 関数 (dbghelp.h) は、指定したアドレスに対応するシンボルを列挙する。
%prm
hProcess, Address, EnumSymbolsCallback, UserContext
hProcess : [intptr] プロセスへのハンドル。このハンドルは事前に SymInitialize 関数に渡しておく必要がある。
Address : [int64] シンボルを検索する対象アドレス。アドレスはシンボルの境界上にある必要はない。アドレスがシンボルの開始以降、終端 (シンボル開始 + シンボルサイズ) より前にある場合、関数はそのシンボルを検出する。
EnumSymbolsCallback : [int] アプリケーション定義のコールバック関数。この関数は Address で見つかったシンボルごとに呼び出される。詳細は SymEnumSymbolsProc を参照。
UserContext : [intptr] 省略可能なユーザー定義データ。この値はコールバック関数に渡される。
%inst
SymEnumSymbolsForAddr 関数 (dbghelp.h) は、指定したアドレスに対応するシンボルを列挙する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。Unicode
版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymEnumTypes
SymEnumTypes 関数 (dbghelp.h) は、ユーザー定義型をすべて列挙する。
%prm
hProcess, BaseOfDll, EnumSymbolsCallback, UserContext
hProcess : [intptr] プロセスへのハンドル。このハンドルは事前に SymInitialize 関数に渡しておく必要がある。
BaseOfDll : [int64] モジュールのベースアドレス。
EnumSymbolsCallback : [int] シンボル情報を受け取る SymEnumSymbolsProc コールバック関数へのポインター。
UserContext : [intptr] コールバック関数に渡されるユーザー定義の値、または NULL。このパラメーターは通常、コールバック関数にコンテキスト情報を提供するデータ構造へのポインターを渡すために使用される。
%inst
SymEnumTypes 関数 (dbghelp.h) は、ユーザー定義型をすべて列挙する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。Unicode
版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymEnumTypesByName
SymEnumTypesByName 関数 (dbghelp.h) は、ユーザー定義型をすべて列挙する。
%prm
hProcess, BaseOfDll, mask, EnumSymbolsCallback, UserContext
hProcess : [intptr] プロセスへのハンドル。このハンドルは事前に SymInitialize 関数に渡しておく必要がある。
BaseOfDll : [int64] モジュールのベースアドレス。
mask : [str] 列挙するシンボル名を示すワイルドカード式。モジュール名を指定するには !mod 構文を使う。
EnumSymbolsCallback : [int] シンボル情報を受け取る SymEnumSymbolsProc コールバック関数へのポインター。
UserContext : [intptr] コールバック関数に渡されるユーザー定義の値、または NULL。このパラメーターは通常、コールバック関数にコンテキスト情報を提供するデータ構造へのポインターを渡すために使用される。
%inst
SymEnumTypesByName 関数 (dbghelp.h) は、ユーザー定義型をすべて列挙する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。Unicode
版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymEnumerateModules64
SymLoadModule64 または SymLoadModuleEx 関数によってプロセスにロードされたモジュールをすべて列挙する。(SymEnumerateModules64)
%prm
hProcess, EnumModulesCallback, UserContext
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスへのハンドル。
EnumModulesCallback : [int] 列挙用のコールバック関数。この関数はモジュールごとに 1 回呼び出される。詳細は SymEnumerateModulesProc64 を参照。
UserContext : [intptr] ユーザー定義の値、または NULL。この値はそのままコールバック関数に渡される。通常このパラメーターは、コールバック関数が何らかのコンテキストを確立できるよう、アプリケーションがデータ構造へのポインターを渡すために使用する。
%inst
SymLoadModule64 または SymLoadModuleEx
関数によってプロセスにロードされたモジュールをすべて列挙する。(SymEnumerateModules64)

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
SymEnumerateModules64 関数は、シンボルのロードが遅延されている場合も含め、SymLoadModule64
によってプロセスにロードされたモジュールをすべて列挙する。列挙用のコールバック関数は各モジュールに対して 1
回呼び出され、モジュール情報が渡される。DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。Unicode
版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。SymEnumerateModulesW64 は
Dbghelp.h で次のように定義されている。
（以下省略）


%index
SymEnumerateModulesW64
SymLoadModule64 または SymLoadModuleEx 関数によってプロセスにロードされたモジュールをすべて列挙する。(SymEnumerateModulesW64)
%prm
hProcess, EnumModulesCallback, UserContext
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスへのハンドル。
EnumModulesCallback : [int] 列挙用のコールバック関数。この関数はモジュールごとに 1 回呼び出される。詳細は SymEnumerateModulesProc64 を参照。
UserContext : [intptr] ユーザー定義の値、または NULL。この値はそのままコールバック関数に渡される。通常このパラメーターは、コールバック関数が何らかのコンテキストを確立できるよう、アプリケーションがデータ構造へのポインターを渡すために使用する。
%inst
SymLoadModule64 または SymLoadModuleEx
関数によってプロセスにロードされたモジュールをすべて列挙する。(SymEnumerateModulesW64)

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
SymEnumerateModules64 関数は、シンボルのロードが遅延されている場合も含め、SymLoadModule64
によってプロセスにロードされたモジュールをすべて列挙する。列挙用のコールバック関数は各モジュールに対して 1
回呼び出され、モジュール情報が渡される。DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。Unicode
版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。SymEnumerateModulesW64 は
Dbghelp.h で次のように定義されている。
（以下省略）


%index
SymEnumerateSymbols64
指定したモジュール内のすべてのシンボルを列挙する。(SymEnumerateSymbols64)
%prm
hProcess, BaseOfDll, EnumSymbolsCallback, UserContext
hProcess : [intptr] プロセスへのハンドル。このハンドルは事前に SymInitialize 関数に渡しておく必要がある。
BaseOfDll : [int64] シンボルを列挙する対象モジュールのベースアドレス。
EnumSymbolsCallback : [int] シンボル情報を受け取るコールバック関数。詳細は SymEnumerateSymbolsProc64 を参照。
UserContext : [intptr] ユーザー定義の値、または NULL。この値はコールバック関数に渡される。通常このパラメーターは、コールバック関数が何らかのコンテキストを確立できるよう、アプリケーションがデータ構造へのポインターを渡すために使用する。
%inst
指定したモジュール内のすべてのシンボルを列挙する。(SymEnumerateSymbols64)

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
SymEnumerateSymbols64 関数は、指定したモジュール内のすべてのシンボルを列挙する。モジュール情報は BaseOfDll
パラメーターから特定される。コールバック関数はシンボルごとに 1 回呼び出され、各シンボルの情報が渡される。DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。Unicode
版の SymEnumerateSymbolsW64 は Dbghelp.h で次のように定義されている。
（以下省略）


%index
SymEnumerateSymbolsW64
指定したモジュール内のすべてのシンボルを列挙する。(SymEnumerateSymbolsW64)
%prm
hProcess, BaseOfDll, EnumSymbolsCallback, UserContext
hProcess : [intptr] プロセスへのハンドル。このハンドルは事前に SymInitialize 関数に渡しておく必要がある。
BaseOfDll : [int64] シンボルを列挙する対象モジュールのベースアドレス。
EnumSymbolsCallback : [int] シンボル情報を受け取るコールバック関数。詳細は SymEnumerateSymbolsProc64 を参照。
UserContext : [intptr] ユーザー定義の値、または NULL。この値はコールバック関数に渡される。通常このパラメーターは、コールバック関数が何らかのコンテキストを確立できるよう、アプリケーションがデータ構造へのポインターを渡すために使用する。
%inst
指定したモジュール内のすべてのシンボルを列挙する。(SymEnumerateSymbolsW64)

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
SymEnumerateSymbols64 関数は、指定したモジュール内のすべてのシンボルを列挙する。モジュール情報は BaseOfDll
パラメーターから特定される。コールバック関数はシンボルごとに 1 回呼び出され、各シンボルの情報が渡される。DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。Unicode
版の SymEnumerateSymbolsW64 は Dbghelp.h で次のように定義されている。
（以下省略）


%index
SymFindDebugInfoFile
SymFindDebugInfoFile 関数 (dbghelp.h) は、プロセスの検索パス内から .dbg ファイルを検索する。
%prm
hProcess, FileName, DebugFilePath, Callback, CallerData
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスへのハンドル。
FileName : [str] .dbg ファイルの名前。部分パスを指定できる。
DebugFilePath : [str] .dbg ファイルの完全修飾パス。このバッファは少なくとも MAX_PATH 文字分の容量が必要。
Callback : [int] 正しいファイルが見つかったか、または検索を続行すべきかを判定するアプリケーション定義のコールバック関数。詳細は FindDebugInfoFileProc を参照。
CallerData : [intptr] ユーザー定義の値、または NULL。この値はそのままコールバック関数に渡される。このパラメーターは通常、コールバック関数にコンテキストを提供するデータ構造へのポインターを渡すために使用される。
%inst
SymFindDebugInfoFile 関数 (dbghelp.h) は、プロセスの検索パス内から .dbg ファイルを検索する。

[戻り値]
関数が成功した場合、戻り値は .dbg ファイルに対するオープン済みハンドルとなる。関数が失敗した場合、戻り値は NULL
となる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
この関数は SymInitialize または SymSetSearchPath 関数で設定された検索パスを使用する。DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。Unicode
版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymFindExecutableImage
SymFindExecutableImage 関数 (dbghelp.h) は、プロセスの検索パス内から実行可能ファイルを検索する。
%prm
hProcess, FileName, ImageFilePath, Callback, CallerData
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスへのハンドル。
FileName : [str] 実行可能ファイルの名前。部分パスを指定できる。
ImageFilePath : [str] 実行可能ファイルの完全修飾パス。このバッファは少なくとも MAX_PATH 文字分の容量が必要。
Callback : [int] 正しい実行可能ファイルが見つかったか、または検索を続行すべきかを判定するアプリケーション定義のコールバック関数。詳細は FindExecutableImageProc を参照。
CallerData : [intptr] ユーザー定義の値、または NULL。この値はそのままコールバック関数に渡される。このパラメーターは通常、コールバック関数にコンテキストを提供するデータ構造へのポインターを渡すために使用される。
%inst
SymFindExecutableImage 関数 (dbghelp.h) は、プロセスの検索パス内から実行可能ファイルを検索する。

[戻り値]
関数が成功した場合、戻り値は実行可能ファイルに対するオープン済みハンドルとなる。関数が失敗した場合、戻り値は NULL
となる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
この関数は SymInitialize または SymSetSearchPath 関数で設定された検索パスを使用する。DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。Unicode
版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymFindFileInPath
SymFindFileInPath 関数 (dbghelp.h) は、シンボルファイルまたは実行可能イメージを検索する。
%prm
hprocess, SearchPathA, FileName, id, two, three, flags, FoundFile, callback, context
hprocess : [intptr] もともと SymInitialize 関数に渡したプロセスへのハンドル。
SearchPathA : [str] 
FileName : [str] ファイルの名前。パスを指定することもできるが、ファイル名のみが使用される。
id : [intptr] 3 つの識別パラメーターのうちの 1 つ目 (備考参照)。
two : [int] 3 つの識別パラメーターのうちの 2 つ目 (備考参照)。
three : [int] 3 つの識別パラメーターのうちの 3 つ目 (備考参照)。
flags : [int] 
FoundFile : [str] シンボルファイルへの完全修飾パスを受け取るバッファへのポインター。このバッファは少なくとも MAX_PATH 文字分の容量が必要。
callback : [int] SymFindFileInPathProc コールバック関数。
context : [intptr] ユーザー定義の値、または NULL。この値はそのままコールバック関数に渡される。このパラメーターは通常、コールバック関数にコンテキストを提供するデータ構造へのポインターを渡すために使用される。
%inst
SymFindFileInPath 関数 (dbghelp.h) は、シンボルファイルまたは実行可能イメージを検索する。

[戻り値]
サーバーが有効なシンボルファイルを見つけた場合は TRUE を返す。そうでない場合は FALSE を返し、GetLastError
はシンボルファイルが返されなかった理由を示す値を返す。

[備考]
識別パラメーターは次のように埋める。
（以下省略）


%index
SymFromAddr
SymFromAddr 関数 (dbghelp.h) は指定アドレスに対するシンボル情報を取得する。
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
SymFromIndex
SymFromIndex 関数 (dbghelp.h) は、指定したインデックスに対応するシンボル情報を取得する。
%prm
hProcess, BaseOfDll, Index, Symbol
hProcess : [intptr] プロセスへのハンドル。このハンドルは事前に SymInitialize 関数に渡しておく必要がある。
BaseOfDll : [int64] モジュールのベースアドレス。
Index : [int] シンボルに対する一意な値。
Symbol : [var] シンボルに関する情報を提供する SYMBOL_INFO 構造体へのポインター。
%inst
SymFromIndex 関数 (dbghelp.h) は、指定したインデックスに対応するシンボル情報を取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。
関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。


%index
SymFromInlineContext
SymFromInlineContext 関数 (dbghelp.h) は、指定したアドレスおよびインラインコンテキストに対応するシンボル情報を取得する。
%prm
hProcess, Address, InlineContext, Displacement, Symbol
hProcess : [intptr] プロセスへのハンドル。このハンドルは事前に SymInitialize 関数に渡しておく必要がある。
Address : [int64] シンボルを検索する対象アドレス。アドレスはシンボルの境界上にある必要はない。アドレスがシンボルの開始以降、終端より前にある場合、そのシンボルが検出される。
InlineContext : [int] シンボルを検索する対象のインラインコンテキスト。
Displacement : [var] シンボル先頭からの変位、または 0。
Symbol : [var] シンボルに関する情報を提供する SYMBOL_INFO 構造体へのポインター。シンボル名は可変長のため、このバッファは SYMBOL_INFO 構造体の末尾に格納される名前を保持できる十分な大きさが必要である。MaxNameLen メンバーに、名前のために確保したバイト数を必ず設定すること。
%inst
SymFromInlineContext 関数 (dbghelp.h)
は、指定したアドレスおよびインラインコンテキストに対応するシンボル情報を取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。


%index
SymFromName
SymFromName 関数 (dbghelp.h) は、指定した名前に対応するシンボル情報を取得する。
%prm
hProcess, Name, Symbol
hProcess : [intptr] プロセスへのハンドル。このハンドルは事前に SymInitialize 関数に渡しておく必要がある。
Name : [str] 検索対象のシンボル名。
Symbol : [var] シンボルに関する情報を提供する SYMBOL_INFO 構造体へのポインター。
%inst
SymFromName 関数 (dbghelp.h) は、指定した名前に対応するシンボル情報を取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。Unicode
版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymFromToken
SymFromToken 関数 (dbghelp.h) は、指定したマネージコードトークンに対応するシンボル情報を取得する。
%prm
hProcess, Base, Token, Symbol
hProcess : [intptr] プロセスへのハンドル。このハンドルは事前に SymInitialize 関数に渡しておく必要がある。
Base : [int64] マネージコードモジュールのベースアドレス。
Token : [int] マネージコードのトークン。
Symbol : [var] シンボルに関する情報を提供する SYMBOL_INFO 構造体へのポインター。
%inst
SymFromToken 関数 (dbghelp.h) は、指定したマネージコードトークンに対応するシンボル情報を取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。Unicode
版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymFunctionTableAccess64
指定したアドレスに対応する関数テーブルエントリを取得する。(SymFunctionTableAccess64)
%prm
hProcess, AddrBase
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスへのハンドル。
AddrBase : [int64] 関数テーブル情報が必要なベースアドレス。
%inst
指定したアドレスに対応する関数テーブルエントリを取得する。(SymFunctionTableAccess64)

[戻り値]
関数が成功した場合、戻り値は関数テーブルエントリへのポインターとなる。関数が失敗した場合、戻り値は NULL
となる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
返されるポインターの型は、シンボルがロードされるイメージに依存する。x86: イメージが x86 システム向けの場合、これは
FPO_DATA 構造体へのポインターとなる。x64: イメージが x64 システム向けの場合、これは
_IMAGE_RUNTIME_FUNCTION_ENTRY 構造体へのポインターとなる。DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。この関数は
SymFunctionTableAccess 関数に取って代わるものである。詳細は Updated Platform Support
を参照。SymFunctionTableAccess は Dbghelp.h で次のように定義されている。
（以下省略）


%index
SymFunctionTableAccess64AccessRoutines
あるアドレスに対する関数テーブルエントリ、またはフレームポインター省略 (FPO) レコードを検索する。
%prm
hProcess, AddrBase, ReadMemoryRoutine, GetModuleBaseRoutine
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスへのハンドル。
AddrBase : [int64] 関数テーブル情報が必要なベースアドレス。
ReadMemoryRoutine : [int] メモリ読み取り用コールバック関数へのポインター。
GetModuleBaseRoutine : [int] モジュールベース取得用コールバック関数へのポインター。
%inst
あるアドレスに対する関数テーブルエントリ、またはフレームポインター省略 (FPO) レコードを検索する。


%index
SymGetExtendedOption
指定した拡張シンボルオプションが有効か無効かを取得する。
%prm
option
option : [int] 確認する拡張シンボルオプション。有効な値は次のとおり。
%inst
指定した拡張シンボルオプションが有効か無効かを取得する。

[戻り値]
指定したシンボルオプションの値。


%index
SymGetFileLineOffsets64
指定したモジュールおよびファイル名に対する行情報を検索する。
%prm
hProcess, ModuleName, FileName, Buffer, BufferLines
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスへのハンドル。
ModuleName : [str] 行を検索する対象モジュールの名前。このパラメーターが NULL の場合、関数はすべてのモジュールを検索する。
FileName : [str] 行を検索する対象ファイル名。
Buffer : [var] 各行に対するオフセットの配列。行 n のオフセットは要素 n-1 に格納される。行情報を持たない行に対応する配列要素は変更されない。
BufferLines : [int] Buffer 配列の要素数。
%inst
指定したモジュールおよびファイル名に対する行情報を検索する。

[戻り値]
関数が成功した場合、戻り値は見つかった最大の行番号となる。行情報が見つからなかった場合、この値は 0 となる。関数が失敗した場合、戻り値は
LINE_ERROR となる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。


%index
SymGetHomeDirectory
SymGetHomeDirectory 関数 (dbghelp.h) は、Dbghelp が使用するホームディレクトリを取得する。
%prm
type, dir, size
type : [int] 
dir : [str] ディレクトリを受け取る文字列へのポインター。
size : [int] 出力バッファのサイズ (文字単位)。
%inst
SymGetHomeDirectory 関数 (dbghelp.h) は、Dbghelp が使用するホームディレクトリを取得する。

[戻り値]
関数が成功した場合、戻り値は dir パラメーターへのポインターとなる。関数が失敗した場合、戻り値は NULL
となる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。Unicode
版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymGetLineFromAddr64
指定アドレスに対するソース行を特定する。(SymGetLineFromAddr64)
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
SymGetLineFromAddrW64
指定したアドレスに対応するソース行を検索する。(SymGetLineFromAddrW64)
%prm
hProcess, dwAddr, pdwDisplacement, Line
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスへのハンドル。
dwAddr : [int64] 行を検索する対象アドレス。アドレスは行境界上にある必要はない。アドレスが行の開始以降、終端より前に位置していれば、その行が検出される。
pdwDisplacement : [var] 行先頭からの変位 (バイト単位)、または 0。
Line : [var] IMAGEHLP_LINE64 構造体へのポインター。
%inst
指定したアドレスに対応するソース行を検索する。(SymGetLineFromAddrW64)

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
呼び出し元は SymGetLineFromAddr64 を呼び出す前に、Line バッファを適切に確保し、IMAGEHLP_LINE64
構造体の必須メンバーを設定しておく必要がある。この関数は別の関数によって再利用される可能性のあるバッファへのポインターを返す。したがって、返されたデータはすぐに別のバッファにコピーしておくこと。DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。Unicode
版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。SymGetLineFromAddrW64 は
Dbghelp.h で次のように定義されている。
（以下省略）


%index
SymGetLineFromInlineContext
SymGetLineFromInlineContext 関数 (dbghelp.h) は、指定したインラインコンテキストに対応するソース行を検索する。
%prm
hProcess, qwAddr, InlineContext, qwModuleBaseAddress, pdwDisplacement, Line64
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスへのハンドル。
qwAddr : [int64] 行を検索する対象アドレス。アドレスは行境界上にある必要はない。アドレスが行の開始以降、終端より前に位置していれば、その行が検出される。
InlineContext : [int] インラインコンテキスト。
qwModuleBaseAddress : [int64] モジュールのベースアドレス。
pdwDisplacement : [var] 行先頭からの変位 (バイト単位)、または 0。
Line64 : [var] IMAGEHLP_LINE64 構造体へのポインター。
%inst
SymGetLineFromInlineContext 関数 (dbghelp.h)
は、指定したインラインコンテキストに対応するソース行を検索する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
呼び出し元は SymGetLineFromInlineContext を呼び出す前に、Line
バッファを適切に確保し、IMAGEHLP_LINE64
構造体の必須メンバーを設定しておく必要がある。この関数は別の関数によって再利用される可能性のあるバッファへのポインターを返す。したがって、返されたデータはすぐに別のバッファにコピーしておくこと。DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。Unicode
版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。SymGetLineFromInlineContext は
Dbghelp.h で次のように定義されている。
（以下省略）


%index
SymGetLineFromName64
指定したモジュール、ファイル名、行番号に対するソース行を検索する。(SymGetLineFromName64)
%prm
hProcess, ModuleName, FileName, dwLineNumber, plDisplacement, Line
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスへのハンドル。
ModuleName : [str] 行を検索する対象モジュールの名前。
FileName : [str] 行を検索する対象ファイル名。アプリケーションが同名のソースファイルを複数持つ場合は、必ずフルパスを指定すること。
dwLineNumber : [int] 検索対象の行番号。
plDisplacement : [var] 行先頭からの変位 (バイト単位)、または 0。
Line : [var] IMAGEHLP_LINE64 構造体へのポインター。
%inst
指定したモジュール、ファイル名、行番号に対するソース行を検索する。(SymGetLineFromName64)

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
呼び出し元は SymGetLineFromName64 を呼び出す前に、Line バッファを適切に確保し、IMAGEHLP_LINE64
構造体の必須メンバーを設定しておく必要がある。この関数を呼び出す前に、まず
SymInitialize、SymSetOptions、SymLoadModule64
を呼び出してシンボルが正しく初期化されていることを確認すること。この関数は別の関数によって再利用される可能性のあるバッファへのポインターを返す。したがって、返されたデータはすぐに別のバッファにコピーしておくこと。DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。Unicode
版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。SymGetLineFromNameW64 は
Dbghelp.h で次のように定義されている。
（以下省略）


%index
SymGetLineFromNameW64
指定したモジュール、ファイル名、行番号に対するソース行を検索する。(SymGetLineFromNameW64)
%prm
hProcess, ModuleName, FileName, dwLineNumber, plDisplacement, Line
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスへのハンドル。
ModuleName : [wstr] 行を検索する対象モジュールの名前。
FileName : [wstr] 行を検索する対象ファイル名。アプリケーションが同名のソースファイルを複数持つ場合は、必ずフルパスを指定すること。
dwLineNumber : [int] 検索対象の行番号。
plDisplacement : [var] 行先頭からの変位 (バイト単位)、または 0。
Line : [var] IMAGEHLP_LINE64 構造体へのポインター。
%inst
指定したモジュール、ファイル名、行番号に対するソース行を検索する。(SymGetLineFromNameW64)

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
呼び出し元は SymGetLineFromName64 を呼び出す前に、Line バッファを適切に確保し、IMAGEHLP_LINE64
構造体の必須メンバーを設定しておく必要がある。この関数を呼び出す前に、まず
SymInitialize、SymSetOptions、SymLoadModule64
を呼び出してシンボルが正しく初期化されていることを確認すること。この関数は別の関数によって再利用される可能性のあるバッファへのポインターを返す。したがって、返されたデータはすぐに別のバッファにコピーしておくこと。DbgHelp
関数はすべて、この関数を含めシングルスレッドである。したがって複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を引き起こす可能性が高い。これを避けるため、複数スレッドからの同時呼び出しはすべて同期する必要がある。Unicode
版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。SymGetLineFromNameW64 は
Dbghelp.h で次のように定義されている。
（以下省略）


%index
SymGetLineNext64
次のソース行の行情報を取得する。(SymGetLineNext64)
%prm
hProcess, Line
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスのハンドル。
Line : [var] 行情報を保持する IMAGEHLP_LINE64 構造体へのポインター。
%inst
次のソース行の行情報を取得する。(SymGetLineNext64)

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
SymGetLineNext64 関数では、IMAGEHLP_LINE64 構造体が有効なデータを保持している必要があり、通常は
SymGetLineFromAddr64 または SymGetLineFromName64
関数の呼び出しで得たものを使用する。この構造体には、順序上の次の行の行情報が格納される。この関数は他の関数から再利用される可能性があるバッファへのポインタを返すため、返されたデータはただちに別のバッファへコピーすること。この関数を含め、すべての
DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。SymGetLineNextW64 は
Dbghelp.h で次のように定義されている。
（以下省略）


%index
SymGetLineNextW64
次のソース行の行情報を取得する。(SymGetLineNextW64)
%prm
hProcess, Line
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスのハンドル。
Line : [var] 行情報を保持する IMAGEHLP_LINE64 構造体へのポインタ。
%inst
次のソース行の行情報を取得する。(SymGetLineNextW64)

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
SymGetLineNext64 関数では、IMAGEHLP_LINE64 構造体が有効なデータを保持している必要があり、通常は
SymGetLineFromAddr64 または SymGetLineFromName64
関数の呼び出しで得たものを使用する。この構造体には、順序上の次の行の行情報が格納される。この関数は他の関数から再利用される可能性があるバッファへのポインタを返すため、返されたデータはただちに別のバッファへコピーすること。この関数を含め、すべての
DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。SymGetLineNextW64 は
Dbghelp.h で次のように定義されている。
（以下省略）


%index
SymGetLinePrev64
前のソース行の行情報を取得する。(SymGetLinePrev64)
%prm
hProcess, Line
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスのハンドル。
Line : [var] IMAGEHLP_LINE64 構造体へのポインタ。
%inst
前のソース行の行情報を取得する。(SymGetLinePrev64)

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
SymGetLinePrev64 関数では、IMAGEHLP_LINE64 構造体が有効なデータを保持している必要があり、通常は
SymGetLineFromAddr64 または SymGetLineFromName64
関数の呼び出しで得たものを使用する。この構造体には、順序上の前の行の行情報が格納される。この関数は他の関数から再利用される可能性があるバッファへのポインタを返すため、返されたデータはただちに別のバッファへコピーすること。この関数を含め、すべての
DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。SymGetLinePrevW64 は
DbgHelp.h で次のように定義されている。
（以下省略）


%index
SymGetLinePrevW64
前のソース行の行情報を取得する。(SymGetLinePrevW64)
%prm
hProcess, Line
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスのハンドル。
Line : [var] IMAGEHLP_LINE64 構造体へのポインタ。
%inst
前のソース行の行情報を取得する。(SymGetLinePrevW64)

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
SymGetLinePrev64 関数では、IMAGEHLP_LINE64 構造体が有効なデータを保持している必要があり、通常は
SymGetLineFromAddr64 または SymGetLineFromName64
関数の呼び出しで得たものを使用する。この構造体には、順序上の前の行の行情報が格納される。この関数は他の関数から再利用される可能性があるバッファへのポインタを返すため、返されたデータはただちに別のバッファへコピーすること。この関数を含め、すべての
DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。SymGetLinePrevW64 は
DbgHelp.h で次のように定義されている。
（以下省略）


%index
SymGetModuleBase64
指定されたアドレスを含むモジュールのベースアドレスを取得する。(SymGetModuleBase64)
%prm
hProcess, qwAddr
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスのハンドル。
qwAddr : [int64] SymLoadModule64 関数によって読み込まれたいずれかのモジュールに含まれる仮想アドレス。
%inst
指定されたアドレスを含むモジュールのベースアドレスを取得する。(SymGetModuleBase64)

[戻り値]
関数が成功した場合、戻り値は 0 以外の仮想アドレスである。値は dwAddr
パラメータで指定されたアドレスを含むモジュールのベースアドレスである。関数が失敗した場合、戻り値は 0
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
モジュールテーブルから dwAddr
を含むモジュールが検索される。モジュールは各モジュールの読み込みアドレスとサイズを基に特定される。この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数は
SymGetModuleBase 関数の後継である。詳細は Updated Platform Support
を参照のこと。SymGetModuleBase は DbgHelp.h で次のように定義されている。
（以下省略）


%index
SymGetModuleInfo64
指定されたモジュールのモジュール情報を取得する。(SymGetModuleInfo64)
%prm
hProcess, qwAddr, ModuleInfo
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスのハンドル。
qwAddr : [int64] SymLoadModule64 関数によって読み込まれたいずれかのモジュールに含まれる仮想アドレス。
ModuleInfo : [var] IMAGEHLP_MODULE64 構造体へのポインタ。SizeOfStruct メンバには IMAGEHLP_MODULE64 構造体のサイズを設定しておく必要がある。無効な値を指定するとエラーになる。
%inst
指定されたモジュールのモジュール情報を取得する。(SymGetModuleInfo64)

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
モジュールテーブルから dwAddr
を含むモジュールが検索される。モジュールは各モジュールの読み込みアドレスとサイズを基に特定される。有効なモジュールが見つかると、ModuleInfo
パラメータにそのモジュールの情報が格納される。この関数で使用される IMAGEHLP_MODULE64
構造体のサイズは長年のあいだに変化してきた。呼び出し側コードのコンパイルに使用した DbgHelp.h より古いバージョンの
DbgHelp.dll を呼び出すと、この関数は ERROR_INVALID_PARAMETER
のエラーコードで失敗することがある。これは特にシステム版 (%WinDir%\System32\DbgHelp.dll)
を呼び出す場合に発生しやすい。システム版の DbgHelp.dll を呼び出すコードは、対応する Windows リリース向けの
SDK、またはそれ以前のリリース向け SDK でコンパイルする必要がある。推奨されるモデルは、必要なバージョンの DbgHelp.dll
を呼び出し側ソフトウェアとともに再配布することである。これにより、もっとも堅牢なバージョンの DbgHelp.dll
を使用でき、アップグレードも容易になる。最新バージョンの DbgHelp.dll は Debugging Tools for
Windows
パッケージから常に入手できる。原則として、古いバージョン向けにコンパイルされたコードは新しいバージョンでも動作する。この関数を含め、すべての
DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。SymGetModuleInfoW64 は
DbgHelp.h で次のように定義されている。
（以下省略）


%index
SymGetModuleInfoW64
指定されたモジュールのモジュール情報を取得する。(SymGetModuleInfoW64)
%prm
hProcess, qwAddr, ModuleInfo
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスのハンドル。
qwAddr : [int64] SymLoadModule64 関数によって読み込まれたいずれかのモジュールに含まれる仮想アドレス。
ModuleInfo : [var] IMAGEHLP_MODULEW64 構造体へのポインタ。SizeOfStruct メンバには IMAGEHLP_MODULEW64 構造体のサイズを設定しておく必要がある。無効な値を指定するとエラーになる。
%inst
指定されたモジュールのモジュール情報を取得する。(SymGetModuleInfoW64)

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
モジュールテーブルから dwAddr
を含むモジュールが検索される。モジュールは各モジュールの読み込みアドレスとサイズを基に特定される。有効なモジュールが見つかると、ModuleInfo
パラメータにそのモジュールの情報が格納される。この関数で使用される IMAGEHLP_MODULEW64
構造体のサイズは長年のあいだに変化してきた。呼び出し側コードのコンパイルに使用した DbgHelp.h より古いバージョンの
DbgHelp.dll を呼び出すと、この関数は ERROR_INVALID_PARAMETER
のエラーコードで失敗することがある。これは特にシステム版 (%WinDir%\System32\DbgHelp.dll)
を呼び出す場合に発生しやすい。システム版の DbgHelp.dll を呼び出すコードは、対応する Windows リリース向けの
SDK、またはそれ以前のリリース向け SDK でコンパイルする必要がある。推奨されるモデルは、必要なバージョンの DbgHelp.dll
を呼び出し側ソフトウェアとともに再配布することである。これにより、もっとも堅牢なバージョンの DbgHelp.dll
を使用でき、アップグレードも容易になる。最新バージョンの DbgHelp.dll は Debugging Tools for
Windows
パッケージから常に入手できる。原則として、古いバージョン向けにコンパイルされたコードは新しいバージョンでも動作する。この関数を含め、すべての
DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。SymGetModuleInfoW64 は
DbgHelp.h で次のように定義されている。
（以下省略）


%index
SymGetOmaps
読み込まれたモジュール内の omap テーブルを取得する。
%prm
hProcess, BaseOfDll, OmapTo, cOmapTo, OmapFrom, cOmapFrom
hProcess : [intptr] プロセスのハンドル。このハンドルは事前に SymInitialize 関数に渡されている必要がある。
BaseOfDll : [int64] モジュールのベースアドレス。
OmapTo : [var] 元のレイアウトから新しいイメージレイアウトへのアドレスマップエントリの配列。マップエントリの詳細は OMAP 構造体を参照のこと。
cOmapTo : [var] OmapTo 配列のエントリ数。
OmapFrom : [var] 新しいイメージレイアウトから元のレイアウト（デバッグシンボルに記述されたもの）へのアドレスマップエントリの配列。マップエントリの詳細は OMAP 構造体を参照のこと。
cOmapFrom : [var] OmapFrom 配列のエントリ数。
%inst
読み込まれたモジュール内の omap テーブルを取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合（omap が見つからなかった場合）、戻り値は FALSE
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。


%index
SymGetOptions
現在のオプションマスクを取得する。
%prm

%inst
現在のオプションマスクを取得する。

[戻り値]
関数は現在設定されているオプションを返す。0 も有効な値であり、すべてのオプションがオフになっていることを示す。

[備考]

これらのオプションは、アプリケーションがライブラリを使用している間に何度でも変更できる。オプションの変更は以降のシンボルハンドラ呼び出しすべてに影響する。戻り値は
SymSetOptions 関数で設定された以下の値の組み合わせである。
（以下省略）


%index
SymGetScope
SymGetScope 関数 (dbghelp.h) は、指定されたインデックスに対するスコープを取得する。
%prm
hProcess, BaseOfDll, Index, Symbol
hProcess : [intptr] プロセスのハンドル。このハンドルは事前に SymInitialize 関数に渡されている必要がある。
BaseOfDll : [int64] モジュールのベースアドレス。
Index : [int] シンボルを一意に識別する値。
Symbol : [var] SYMBOL_INFO 構造体へのポインタ。Scope メンバにスコープが格納される。
%inst
SymGetScope 関数 (dbghelp.h) は、指定されたインデックスに対するスコープを取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。
関数が失敗した場合、戻り値は FALSE である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。


%index
SymGetSearchPath
SymGetSearchPath 関数 (dbghelp.h) は、指定されたプロセスのシンボル検索パスを取得する。
%prm
hProcess, SearchPathA, SearchPathLength
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスのハンドル。
SearchPathA : [str] 
SearchPathLength : [int] SearchPath バッファのサイズ（文字数）。
%inst
SymGetSearchPath 関数 (dbghelp.h) は、指定されたプロセスのシンボル検索パスを取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
SymGetSearchPath 関数は、指定されたプロセスのシンボル検索パスを SearchPath
バッファにコピーする。関数が失敗した場合、バッファの内容は不定である。プロセスのシンボル検索パスを設定するには、SymSetSearchPath
関数を使用する。この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymGetSourceFile
SymGetSourceFile 関数 (dbghelp.h) は、ソースサーバーから指定されたソースファイルを取得する。
%prm
hProcess, Base, Params, FileSpec, FilePath, Size
hProcess : [intptr] プロセスのハンドル。このハンドルは事前に SymInitialize 関数に渡されている必要がある。
Base : [int64] モジュールのベースアドレス。
Params : [str] このパラメータは使用されない。
FileSpec : [str] ソースファイルの名前。
FilePath : [str] ソースファイルの完全修飾パスを受け取るバッファへのポインタ。
Size : [int] FilePath バッファのサイズ（文字数）。
%inst
SymGetSourceFile 関数 (dbghelp.h) は、ソースサーバーから指定されたソースファイルを取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。
関数が失敗した場合、戻り値は FALSE である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
ソースファイルを受け取るディレクトリを制御するには、SymSetHomeDirectory 関数を使用する。この関数を含め、すべての
DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymGetSourceFileChecksum
SymGetSourceFileChecksum 関数 (dbghelp.h) は、ソースサーバーから指定されたソースファイルのチェックサムを取得する。
%prm
hProcess, Base, FileSpec, pCheckSumType, pChecksum, checksumSize, pActualBytesWritten
hProcess : [intptr] プロセスのハンドル。このハンドルは事前に SymInitialize 関数に渡されている必要がある。
Base : [int64] モジュールのベースアドレス。
FileSpec : [str] ソースファイルの名前。
pCheckSumType : [var] 成功時にチェックサム種別を指す。
pChecksum : [var] チェックサムを受け取るバッファへのポインタ。NULL を指定した場合、呼び出しから戻ったときに pActualBytesWritten に必要なバイト数が返される。
checksumSize : [int] pChecksum バッファのサイズ（バイト単位）。
pActualBytesWritten : [var] バッファに実際に書き込まれたバイト数へのポインタ。
%inst
SymGetSourceFileChecksum 関数 (dbghelp.h)
は、ソースサーバーから指定されたソースファイルのチェックサムを取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。
関数が失敗した場合、戻り値は FALSE である。拡張エラー情報を取得するには、GetLastError を呼び出す。


%index
SymGetSourceFileFromToken
SymGetSourceFileFromToken 関数 (dbghelp.h) は、ソースサーバーから指定されたトークンに対応するソースファイルを取得する。
%prm
hProcess, Token, Params, FilePath, Size
hProcess : [intptr] プロセスのハンドル。このハンドルは事前に SymInitialize 関数に渡されている必要がある。
Token : [intptr] トークンへのポインタ。
Params : [str] このパラメータは使用されない。
FilePath : [str] ソースファイルの完全修飾パスを受け取るバッファへのポインタ。
Size : [int] FilePath バッファのサイズ（文字数）。
%inst
SymGetSourceFileFromToken 関数 (dbghelp.h)
は、ソースサーバーから指定されたトークンに対応するソースファイルを取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。
関数が失敗した場合、戻り値は FALSE である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymGetSourceFileToken
SymGetSourceFileToken 関数 (dbghelp.h) は、ソースサーバーから指定されたソースファイルのトークンを取得する。
%prm
hProcess, Base, FileSpec, Token, Size
hProcess : [intptr] プロセスのハンドル。このハンドルは事前に SymInitialize 関数に渡されている必要がある。
Base : [int64] モジュールのベースアドレス。
FileSpec : [str] ソースファイルの名前。
Token : [var] トークンを受け取るバッファへのポインタ。
Size : [var] Token バッファのサイズ（バイト単位）。
%inst
SymGetSourceFileToken 関数 (dbghelp.h)
は、ソースサーバーから指定されたソースファイルのトークンを取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。
関数が失敗した場合、戻り値は FALSE である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymGetSourceVarFromToken
SymGetSourceVarFromToken 関数 (dbghelp.h) は、ソースサーバートークンから指定された変数名に関連付けられた値を取得する。
%prm
hProcess, Token, Params, VarName, Value, Size
hProcess : [intptr] プロセスのハンドル。このハンドルは事前に SymInitialize 関数に渡されている必要がある。
Token : [intptr] トークンへのポインタ。
Params : [str] このパラメータは使用されない。
VarName : [str] 値を取得したい変数トークンの名前。
Value : [str] VarName パラメータで指定された変数トークンに関連付けられた値を受け取るバッファへのポインタ。
Size : [int] Value バッファのサイズ（文字数）。
%inst
SymGetSourceVarFromToken 関数 (dbghelp.h)
は、ソースサーバートークンから指定された変数名に関連付けられた値を取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymGetSymFromAddr64
指定されたアドレスに対するシンボルを特定する。(SymGetSymFromAddr64)
%prm
hProcess, qwAddr, pdwDisplacement, Symbol
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスのハンドル。
qwAddr : [int64] シンボルを特定するアドレス。アドレスはシンボル境界に一致していなくてもよい。アドレスがシンボルの先頭以降、かつシンボルの末尾（シンボルの先頭にシンボルサイズを加えた位置）より前にあれば、シンボルが見つかる。
pdwDisplacement : [var] シンボルの先頭からのオフセット、または 0。
Symbol : [var] IMAGEHLP_SYMBOL64 構造体へのポインタ。
%inst
指定されたアドレスに対するシンボルを特定する。(SymGetSymFromAddr64)

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
SymGetSymFromAddr64
関数は、指定されたアドレスに対するシンボルを特定する。まず該当するアドレスを含むモジュールがモジュール群から検索される。モジュールが見つかると、そのシンボルテーブルから一致するシンボルが検索される。シンボルが見つかると、呼び出し側が用意した
Symbol バッファにシンボル情報がコピーされる。SymGetSymFromAddr64 を呼び出す前に、呼び出し側で Symbol
バッファを適切に確保し、IMAGEHLP_SYMBOL64 構造体の必須パラメータを設定しておく必要がある。この関数を含め、すべての
DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数は
SymGetSymFromAddr 関数の後継である。詳細は Updated Platform Support
を参照のこと。SymGetSymFromAddr は Dbghelp.h で次のように定義されている。
（以下省略）


%index
SymGetSymFromName64
指定された名前に対するシンボルを特定する。(SymGetSymFromName64)
%prm
hProcess, Name, Symbol
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスのハンドル。
Name : [str] シンボルを特定するためのシンボル名。
Symbol : [var] IMAGEHLP_SYMBOL64 構造体へのポインタ。
%inst
指定された名前に対するシンボルを特定する。(SymGetSymFromName64)

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
SymGetSymFromName64
関数は、指定された名前に対するシンボルを特定するために使用される。名前には「module!」という形式のモジュール接頭辞を含めて、シンボル検索を単一モジュールのシンボルテーブルに限定することができる。「!」文字はモジュール名とシンボル名の区切り文字である。モジュール接頭辞がない場合、最初に読み込まれたモジュールから順に、各モジュールのシンボルテーブルに対して線形に検索が行われる。モジュール接頭辞を使用すると、二つの点で望ましい。まず、シンボル検索がはるかに高速になる。次に、遅延シンボル読み込みが有効な場合、検索対象の各モジュールのシンボルが読み込まれてしまうことを避けられる。シンボルが見つかると、呼び出し側が用意した
Symbol バッファにシンボル情報がコピーされる。SymGetSymFromName64 を呼び出す前に、呼び出し側で Symbol
バッファを適切に確保し、IMAGEHLP_SYMBOL64 構造体の必須パラメータを設定しておく必要がある。この関数を含め、すべての
DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数は
SymGetSymFromName 関数の後継である。詳細は Updated Platform Support
を参照のこと。SymGetSymFromName は Dbghelp.h で次のように定義されている。
（以下省略）


%index
SymGetSymNext64
次のシンボルに対するシンボル情報を取得する。(SymGetSymNext64)
%prm
hProcess, Symbol
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスのハンドル。
Symbol : [var] IMAGEHLP_SYMBOL64 構造体へのポインタ。
%inst
次のシンボルに対するシンボル情報を取得する。(SymGetSymNext64)

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
SymGetSymNext64 関数では、IMAGEHLP_SYMBOL64 構造体が有効なデータを保持している必要があり、通常は
SymGetSymFromAddr64 または SymGetSymFromName64
関数の呼び出しで得たものを使用する。この構造体には、仮想アドレス順で次にあたるシンボルのシンボル情報が格納される。この関数を含め、すべての
DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。SymGetSymNextW64 は
DbgHelp.h で次のように定義されている。
（以下省略）


%index
SymGetSymPrev64
前のシンボルに対するシンボル情報を取得する。(SymGetSymPrev64)
%prm
hProcess, Symbol
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスのハンドル。
Symbol : [var] IMAGEHLP_SYMBOL64 構造体へのポインタ。
%inst
前のシンボルに対するシンボル情報を取得する。(SymGetSymPrev64)

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
SymGetSymPrev64 関数では、IMAGEHLP_SYMBOL64 構造体が有効なデータを保持している必要があり、通常は
SymGetSymFromAddr64 または SymGetSymFromName64
関数の呼び出しで得たものを使用する。この構造体には、仮想アドレス順で前にあたるシンボルのシンボル情報が格納される。この関数を含め、すべての
DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。SymGetSymPrevW64 は
DbgHelp.h で次のように定義されている。
（以下省略）


%index
SymGetSymbolFile
SymGetSymbolFile 関数 (dbghelp.h) は、指定されたシンボルパスからシンボルファイルを特定する。
%prm
hProcess, SymPath, ImageFile, Type, SymbolFile, cSymbolFile, DbgFile, cDbgFile
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスのハンドル。このハンドルが 0 の場合、SymPath を NULL にすることはできない。SymInitialize や SymCleanup を呼び出さずにシンボルファイルを読み込みたい場合にこのオプションを使用する。
SymPath : [str] シンボルパス。このパラメータが NULL または空文字列の場合、関数は SymInitialize または SymSetSearchPath 関数で設定されたシンボルパスを使用する。
ImageFile : [str] イメージファイルの名前。
Type : [int] 
SymbolFile : [str] シンボルファイルの名前を受け取る、NULL 終端文字列へのポインタ。
cSymbolFile : [int] SymbolFile バッファのサイズ（文字数）。
DbgFile : [str] シンボルファイルの完全修飾パスを受け取るバッファへのポインタ。このバッファは最低でも MAX_PATH 文字分の大きさが必要である。
cDbgFile : [int] DbgFile バッファのサイズ（文字数）。
%inst
SymGetSymbolFile 関数 (dbghelp.h) は、指定されたシンボルパスからシンボルファイルを特定する。

[戻り値]
サーバーが有効なシンボルファイルを見つけた場合は TRUE を返し、そうでない場合は FALSE を返す。FALSE
のとき、GetLastError はシンボルファイルが返されなかった理由を示す値を返す。

[備考]
この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymGetTypeFromName
SymGetTypeFromName 関数 (dbghelp.h) は、指定された型名に対する型インデックスを取得する。
%prm
hProcess, BaseOfDll, Name, Symbol
hProcess : [intptr] プロセスのハンドル。このハンドルは事前に SymInitialize 関数に渡されている必要がある。
BaseOfDll : [int64] モジュールのベースアドレス。
Name : [str] 型の名前。
Symbol : [var] SYMBOL_INFO 構造体へのポインタ。TypeIndex メンバに型インデックスが格納される。
%inst
SymGetTypeFromName 関数 (dbghelp.h) は、指定された型名に対する型インデックスを取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
型に関する情報を取得するには、型インデックスを SymGetTypeInfo 関数に渡す。この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymGetTypeInfo
指定された型インデックスに対する型情報を取得する。
%prm
hProcess, ModBase, TypeId, GetType, pInfo
hProcess : [intptr] プロセスのハンドル。このハンドルは事前に SymInitialize 関数に渡されている必要がある。
ModBase : [int64] モジュールのベースアドレス。
TypeId : [int] 型インデックス。（多くの関数が SYMBOL_INFO 構造体の TypeIndex メンバとして型インデックスを返す。）
GetType : [int] 取得する情報の種類。このパラメータには IMAGEHLP_SYMBOL_TYPE_INFO 列挙型の値を 1 つ以上指定できる。
pInfo : [intptr] データ。データの形式は GetType パラメータの値によって異なる。
%inst
指定された型インデックスに対する型情報を取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
型情報の詳細については、PDB 形式のドキュメントを参照のこと。この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。


%index
SymGetTypeInfoEx
複数の型情報をまとめて取得する。
%prm
hProcess, ModBase, Params
hProcess : [intptr] プロセスのハンドル。このハンドルは事前に SymInitialize 関数に渡されている必要がある。
ModBase : [int64] モジュールのベースアドレス。
Params : [var] クエリの入力および出力情報を指定する IMAGEHLP_GET_TYPE_INFO_PARAMS 構造体へのポインタ。
%inst
複数の型情報をまとめて取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。


%index
SymGetUnwindInfo
(no summary)
%prm
hProcess, Address, Buffer, Size
hProcess : [intptr] 
Address : [int64] 
Buffer : [intptr] 
Size : [var] 
%inst



%index
SymInitialize
SymInitialize 関数 (dbghelp.h) はプロセスのシンボルハンドラを初期化する。
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


%index
SymLoadModule64
シンボルテーブルを読み込む。(SymLoadModule64)
%prm
hProcess, hFile, ImageName, ModuleName, BaseOfDll, SizeOfDll
hProcess : [intptr] プロセスのハンドル。このハンドルは事前に SymInitialize 関数に渡されている必要がある。
hFile : [intptr] 実行可能イメージファイルのハンドル。この引数は主にデバッガで使用され、デバッグイベントから取得したファイルハンドルを渡す。NULL を指定すると hFile は使用されない。
ImageName : [str] 実行可能イメージの名前。この名前には部分パス、フルパス、またはパスなしを指定できる。指定された名前でファイルが見つからない場合、シンボル検索パスが使用される。
ModuleName : [str] モジュールのショートカット名。ポインタ値が NULL の場合、ライブラリはシンボルファイルのベース名を用いて名前を生成する。
BaseOfDll : [int64] モジュールの読み込みアドレス。値が 0 の場合、ライブラリはシンボルファイルから読み込みアドレスを取得する。シンボルファイルに含まれる読み込みアドレスは、必ずしも実際の読み込みアドレスと一致するとは限らない。デバッガなど実際の読み込みアドレスを把握しているアプリケーションでは、この関数を呼び出す際に実際の読み込みアドレスを使用すべきである。イメージが .pdb ファイルの場合、このパラメータを 0 にすることはできない。
SizeOfDll : [int] モジュールのサイズ（バイト単位）。値が 0 の場合、ライブラリはシンボルファイルからサイズを取得する。シンボルファイルに含まれるサイズは、必ずしも実際のサイズと一致するとは限らない。デバッガなど実際のサイズを把握しているアプリケーションでは、この関数を呼び出す際に実際のサイズを使用すべきである。イメージが .pdb ファイルの場合、このパラメータを 0 にすることはできない。
%inst
シンボルテーブルを読み込む。(SymLoadModule64)

[戻り値]
関数が成功した場合、戻り値は読み込まれたモジュールのベースアドレスである。関数が失敗した場合、戻り値は 0
である。拡張エラー情報を取得するには、GetLastError を呼び出す。モジュールがすでに読み込まれている場合、戻り値は 0
となり、GetLastError は ERROR_SUCCESS を返す。

[備考]

シンボルハンドラはモジュールのエントリを作成する。遅延シンボル読み込みオプションが無効であれば、シンボルの読み込みが試みられる。遅延シンボル読み込みが有効な場合、モジュールは遅延状態としてマークされ、モジュール内のシンボルが参照されるまでシンボルは読み込まれない。シンボルテーブルを解放するには、SymUnloadModule64
関数を使用する。この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数は
SymLoadModule 関数の後継である。詳細は Updated Platform Support
を参照のこと。SymLoadModule は DbgHelp.h で次のように定義されている。
（以下省略）


%index
SymLoadModuleEx
SymLoadModuleEx 関数 (dbghelp.h) は、指定されたモジュールのシンボルテーブルを読み込む。
%prm
hProcess, hFile, ImageName, ModuleName, BaseOfDll, DllSize, Data, Flags
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスのハンドル。
hFile : [intptr] 実行可能イメージファイルのハンドル。この引数は主にデバッガで使用され、デバッグイベントから取得したファイルハンドルを渡す。NULL を指定すると hFile は使用されない。
ImageName : [str] 実行可能イメージの名前。この名前には部分パス、フルパス、またはパスなしを指定できる。指定された名前でファイルが見つからない場合、シンボル検索パスが使用される。
ModuleName : [str] モジュールのショートカット名。ポインタ値が NULL の場合、ライブラリはシンボルファイルのベース名を用いて名前を生成する。
BaseOfDll : [int64] モジュールの読み込みアドレス。値が 0 の場合、ライブラリはシンボルファイルから読み込みアドレスを取得する。シンボルファイルに含まれる読み込みアドレスは、必ずしも実際の読み込みアドレスと一致するとは限らない。デバッガなど実際の読み込みアドレスを把握しているアプリケーションでは、この関数を呼び出す際に実際の読み込みアドレスを使用すべきである。イメージが .pdb ファイルの場合、このパラメータを 0 にすることはできない。
DllSize : [int] モジュールのサイズ（バイト単位）。値が 0 の場合、ライブラリはシンボルファイルからサイズを取得する。シンボルファイルに含まれるサイズは、必ずしも実際のサイズと一致するとは限らない。デバッガなど実際のサイズを把握しているアプリケーションでは、この関数を呼び出す際に実際のサイズを使用すべきである。イメージが .pdb ファイルの場合、このパラメータを 0 にすることはできない。
Data : [var] 標準の PE ヘッダ以外のヘッダを表す MODLOAD_DATA 構造体へのポインタ。このパラメータは省略可能であり、NULL でも構わない。
Flags : [int] 
%inst
SymLoadModuleEx 関数 (dbghelp.h) は、指定されたモジュールのシンボルテーブルを読み込む。

[戻り値]
関数が成功した場合、戻り値は読み込まれたモジュールのベースアドレスである。関数が失敗した場合、戻り値は 0
である。拡張エラー情報を取得するには、GetLastError を呼び出す。モジュールがすでに読み込まれている場合、戻り値は 0
となり、GetLastError は ERROR_SUCCESS を返す。

[備考]

シンボルハンドラはモジュールのエントリを作成する。遅延シンボル読み込みオプションが無効であれば、シンボルの読み込みが試みられる。遅延シンボル読み込みが有効な場合、モジュールは遅延状態としてマークされ、モジュール内のシンボルが参照されるまでシンボルは読み込まれない。そのため、SymLoadModuleEx
を呼び出した後は常に SymGetModuleInfo64
関数を呼び出すべきである。シンボルテーブルを解放するには、SymUnloadModule64 関数を使用する。この関数を含め、すべての
DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymMatchFileName
SymMatchFileName 関数 (dbghelp.h) は、文字列をファイル名およびパスと比較する。
%prm
FileName, Match, FileNameStop, MatchStop
FileName : [str] Match パラメータと比較されるファイル名。
Match : [str] FileName パラメータと比較される文字列。
FileNameStop : [var] 照合が終了した FileName 内の位置を指すポインタを受け取る文字列バッファへのポインタ。完全一致した場合、この値は FileName の先頭より 1 文字前を指すことがある。この値は NULL でもよい。
MatchStop : [var] 照合が終了した Match 内の位置を指すポインタを受け取る文字列バッファへのポインタ。完全一致した場合、この値は Match の先頭より 1 文字前を指すことがある。この値は NULL でもよい。
%inst
SymMatchFileName 関数 (dbghelp.h) は、文字列をファイル名およびパスと比較する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]

マッチ文字列は完全なファイル名のサフィックスとすることができるため、この関数を使えば単純なファイル名と完全修飾ファイル名を照合することが可能である。照合は両方の文字列の末尾から始まり、前方向へ進行する。照合は大文字小文字を区別せず、バックスラッシュ
(\\) とスラッシュ (/) を同一視する。この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymMatchString
SymMatchString 関数 (dbghelp.h) は、指定された文字列を指定されたワイルドカード式と比較する。
%prm
string, expression, fCase
string : [int] 
expression : [str] string パラメータと比較するワイルドカード式。ワイルドカード式には * と ? を含めることができる。* は任意の文字列に一致し、? は任意の 1 文字に一致する。
fCase : [int] 比較で大文字小文字を区別するかどうかを示す変数。
%inst
SymMatchString 関数 (dbghelp.h) は、指定された文字列を指定されたワイルドカード式と比較する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。
関数が失敗した場合、戻り値は FALSE である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。


%index
SymNext
SymNext 関数 (dbghelp.h) は、次のシンボルに対するシンボル情報を取得する。
%prm
hProcess, si
hProcess : [intptr] プロセスのハンドル。このハンドルは事前に SymInitialize 関数に渡されている必要がある。
si : [var] 現在のシンボルに関する情報を保持する SYMBOL_INFO 構造体へのポインタ。関数から戻ると、構造体には次のシンボルに関する情報が格納される。
%inst
SymNext 関数 (dbghelp.h) は、次のシンボルに対するシンボル情報を取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。
関数が失敗した場合、戻り値は FALSE である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
この関数では、SYMBOL_INFO
構造体が現在のシンボルに対する有効なデータを保持している必要がある。次のシンボルとは、仮想アドレス順で次にあたるシンボルである。この関数を含め、すべての
DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymPrev
SymPrev 関数 (dbghelp.h) は、前のシンボルに対するシンボル情報を取得する。
%prm
hProcess, si
hProcess : [intptr] プロセスのハンドル。このハンドルは事前に SymInitialize 関数に渡されている必要がある。
si : [var] 現在のシンボルに関する情報を保持する SYMBOL_INFO 構造体へのポインタ。関数から戻ると、構造体には前のシンボルに関する情報が格納される。
%inst
SymPrev 関数 (dbghelp.h) は、前のシンボルに対するシンボル情報を取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。
関数が失敗した場合、戻り値は FALSE である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
この関数では、SYMBOL_INFO
構造体が現在のシンボルに対する有効なデータを保持している必要がある。前のシンボルとは、現在のシンボルの直前にある仮想アドレスを持つシンボルである。この関数を含め、すべての
DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymQueryInlineTrace
インライントレースをクエリする。
%prm
hProcess, StartAddress, StartContext, StartRetAddress, CurAddress, CurContext, CurFrameIndex
hProcess : [intptr] プロセスのハンドル。このハンドルは事前に SymInitialize 関数に渡されている必要がある。
StartAddress : [int64] 開始アドレス。
StartContext : [int] ブロックの開始位置のコンテキストを格納する。
StartRetAddress : [int64] 現在のブロックの開始位置のリターンアドレスを格納する。
CurAddress : [int64] 現在のアドレスを格納する。
CurContext : [var] 現在のコンテキストを受け取る DWORD のアドレス。
CurFrameIndex : [var] 関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE である。拡張エラー情報を取得するには、GetLastError を呼び出す。
%inst
インライントレースをクエリする。

[備考]
StartAddress または StartRetAddress のいずれかは、CurAddress
と同じ関数スコープ内になければならない。前者は同一関数内のステップオーバーを示し、後者は StartAddress
からのステップオーバーを示す。


%index
SymRefreshModuleList
プロセスのモジュール一覧を更新する。
%prm
hProcess
hProcess : [intptr] プロセスのハンドル。このハンドルは事前に SymInitialize 関数に渡されている必要がある。
%inst
プロセスのモジュール一覧を更新する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。
関数が失敗した場合、戻り値は FALSE である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
この関数はプロセスに読み込まれたモジュールを列挙し、各モジュールに対して実質的に SymLoadModule64
関数を呼び出す。fInvadeProcess を TRUE にして SymInitialize
を呼び出した場合も、同じ処理が行われる。この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。


%index
SymRegisterCallback64
シンボルハンドラが使用するコールバック関数を登録する。(SymRegisterCallback64)
%prm
hProcess, CallbackFunction, UserContext
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスのハンドル。
CallbackFunction : [int] SymRegisterCallbackProc64 コールバック関数。
UserContext : [int64] ユーザー定義の値または NULL。この値はそのままコールバック関数に渡される。通常、アプリケーションはこのパラメータを使用して、コールバック関数がコンテキストを確立するためのデータ構造へのポインタを渡す。
%inst
シンボルハンドラが使用するコールバック関数を登録する。(SymRegisterCallback64)

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
SymRegisterCallback64
関数を使用すると、アプリケーションはシンボルハンドラが使用するコールバック関数を登録できる。シンボルハンドラはアプリケーションに対する状態や進行情報があるときに、登録されたコールバック関数を呼び出す。この関数を含め、すべての
DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。SymRegisterCallbackW64
は Dbghelp.h で次のように定義されている。
（以下省略）


%index
SymRegisterCallbackW64
シンボルハンドラが使用するコールバック関数を登録する。(SymRegisterCallbackW64)
%prm
hProcess, CallbackFunction, UserContext
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスのハンドル。
CallbackFunction : [int] SymRegisterCallbackProc64 コールバック関数。
UserContext : [int64] ユーザー定義の値または NULL。この値はそのままコールバック関数に渡される。通常、アプリケーションはこのパラメータを使用して、コールバック関数がコンテキストを確立するためのデータ構造へのポインタを渡す。
%inst
シンボルハンドラが使用するコールバック関数を登録する。(SymRegisterCallbackW64)

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
SymRegisterCallback64
関数を使用すると、アプリケーションはシンボルハンドラが使用するコールバック関数を登録できる。シンボルハンドラはアプリケーションに対する状態や進行情報があるときに、登録されたコールバック関数を呼び出す。この関数を含め、すべての
DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。SymRegisterCallbackW64
は Dbghelp.h で次のように定義されている。
（以下省略）


%index
SymRegisterFunctionEntryCallback64
Alpha コンピュータ上でスタックウォーク処理が使用するコールバック関数を登録する。(SymRegisterFunctionEntryCallback64)
%prm
hProcess, CallbackFunction, UserContext
hProcess : [intptr] もともと StackWalk64 関数に渡したプロセスのハンドル。
CallbackFunction : [int] SymRegisterFunctionEntryCallbackProc64 コールバック関数。
UserContext : [int64] ユーザー定義の値または NULL。この値はそのままコールバック関数に渡される。通常、アプリケーションはこのパラメータを使用して、コールバック関数がコンテキストを確立するためのデータ構造へのポインタを渡す。
%inst
Alpha
コンピュータ上でスタックウォーク処理が使用するコールバック関数を登録する。(SymRegisterFunctionEntryCallback64)

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
SymRegisterFunctionEntryCallback64
関数を使用すると、アプリケーションはスタックウォーク処理が使用するコールバック関数を登録できる。スタックウォーク処理はアドレスに対する関数テーブルエントリを特定できなかった場合に、登録されたコールバック関数を呼び出す。多くの場合、スタックウォーク処理はそのアドレスを含むイメージの関数テーブルから関数テーブルエントリを特定する。しかし関数テーブルエントリがイメージ内に存在しない状況では、このコールバックによりデバッガが別の情報源から関数テーブルエントリを提供できる。たとえば
Alpha
コンピュータ上の実行時生成コードは、例外処理とスタックトレースをサポートするために動的関数テーブルを定義できる。この関数を含め、すべての
DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数は
SymRegisterFunctionEntryCallback 関数の後継である。詳細は Updated Platform
Support を参照のこと。SymRegisterFunctionEntryCallback は Dbghelp.h
で次のように定義されている。
（以下省略）


%index
SymSearch
SymSearch 関数 (dbghelp.h) は、指定された条件に一致する PDB シンボルを検索する。
%prm
hProcess, BaseOfDll, Index, SymTag, Mask, Address, EnumSymbolsCallback, UserContext, Options
hProcess : [intptr] プロセスのハンドル。このハンドルは事前に SymInitialize 関数に渡されている必要がある。
BaseOfDll : [int64] モジュールのベースアドレス。この値が 0 で Mask に感嘆符 (!) が含まれる場合、関数は複数モジュールを横断して検索する。この値が 0 で Mask に感嘆符が含まれない場合、関数は SymSetContext 関数で設定されたスコープを使用する。
Index : [int] シンボルを一意に識別する値。
SymTag : [int] PDB の分類。これらの値は Dbghelp.h の SymTagEnum 列挙型で定義されている。説明については PDB ドキュメントを参照のこと。
Mask : [str] 列挙対象のシンボル名を示すワイルドカード式。モジュール名を指定するには !mod 構文を使用する。
Address : [int64] シンボルのアドレス。
EnumSymbolsCallback : [int] シンボル情報を受け取る SymEnumSymbolsProc コールバック関数。
UserContext : [intptr] コールバック関数に渡されるユーザー定義の値、または NULL。通常、アプリケーションはこのパラメータを使用して、コールバック関数にコンテキストを提供するデータ構造へのポインタを渡す。
Options : [int] 関数の動作を制御するオプション。
%inst
SymSearch 関数 (dbghelp.h) は、指定された条件に一致する PDB シンボルを検索する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。
関数が失敗した場合、戻り値は FALSE である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymSetContext
SymEnumSymbols 関数が使用するコンテキスト情報を設定する。この関数は PDB シンボルでのみ機能する。
%prm
hProcess, StackFrame, Context
hProcess : [intptr] プロセスのハンドル。このハンドルは事前に SymInitialize 関数に渡されている必要がある。
StackFrame : [var] フレーム情報を含む IMAGEHLP_STACK_FRAME 構造体へのポインタ。
Context : [intptr] このパラメータは無視される。
%inst
SymEnumSymbols 関数が使用するコンテキスト情報を設定する。この関数は PDB シンボルでのみ機能する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
SymSetContext を呼び出して現在の値と同じコンテキストに設定すると、関数は失敗するが GetLastError は
ERROR_SUCCESS を返す。この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。


%index
SymSetExtendedOption
指定された拡張シンボルオプションをオンまたはオフにする。
%prm
option, value
option : [int] オンまたはオフにする拡張シンボルオプション。有効な値は以下のとおり。
value : [int] 指定されたオプションに設定する値で、TRUE または FALSE。
%inst
指定された拡張シンボルオプションをオンまたはオフにする。

[戻り値]
指定された拡張オプションの以前の値。


%index
SymSetHomeDirectory
SymSetHomeDirectory 関数 (dbghelp.h) は、Dbghelp が使用するホームディレクトリを設定する。
%prm
hProcess, dir
hProcess : [intptr] プロセスのハンドル。このハンドルは事前に SymInitialize 関数に渡されている必要がある。
dir : [str] ホームディレクトリ。このディレクトリは書き込み可能でなければならない。書き込めない場合、ホームディレクトリには [CSIDL_COMMON_APPDATA](/windows/win32/shell/csidl) で指定される共通アプリケーションディレクトリが使用される。このパラメータが NULL の場合、関数は既定のディレクトリを使用する。
%inst
SymSetHomeDirectory 関数 (dbghelp.h) は、Dbghelp が使用するホームディレクトリを設定する。

[戻り値]
関数が成功した場合、戻り値は dir パラメータへのポインタである。関数が失敗した場合、戻り値は NULL
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
既定のホームディレクトリは Dbghelp.dll が存在するディレクトリである。Dbghelp
はこのディレクトリを他のディレクトリ（既定のダウンストリームストアディレクトリ、すなわちホームディレクトリ直下の sym
サブディレクトリなど）の基点として使用する。既定のシンボルストアおよびソースサーバーキャッシュの場所として使用されるホームディレクトリは、DBGHELP_HOMEDIR
環境変数に保存される。この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymSetOptions
オプションマスクを設定する。
%prm
SymOptions
SymOptions : [int] シンボルオプション。0 も有効な値で、すべてのオプションがオフであることを示す。オプション値は OR 演算子で組み合わせて有効なオプション値を構成する。有効な値は以下のとおり。
%inst
オプションマスクを設定する。

[戻り値]
関数は現在のオプションマスクを返す。

[備考]

オプション値はアプリケーションがライブラリを使用している間、何度でも変更できる。オプションの変更は以降のシンボルハンドラ呼び出しすべてに影響する。現在のオプションマスクを取得するには、SymGetOptions
関数を呼び出す。この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。


%index
SymSetParentWindow
呼び出し側がユーザーインターフェイスの表示に使用するウィンドウを設定する。
%prm
hwnd
hwnd : [intptr] ウィンドウのハンドル。
%inst
呼び出し側がユーザーインターフェイスの表示に使用するウィンドウを設定する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。


%index
SymSetScopeFromAddr
指定されたアドレスに一致するシンボルをローカルスコープに設定する。
%prm
hProcess, Address
hProcess : [intptr] プロセスのハンドル。このハンドルは事前に SymInitialize 関数に渡されている必要がある。
Address : [int64] アドレス。
%inst
指定されたアドレスに一致するシンボルをローカルスコープに設定する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。
関数が失敗した場合、戻り値は FALSE である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。


%index
SymSetScopeFromIndex
指定されたインデックスに一致するシンボルをローカルスコープに設定する。
%prm
hProcess, BaseOfDll, Index
hProcess : [intptr] プロセスのハンドル。このハンドルは事前に SymInitialize 関数に渡されている必要がある。
BaseOfDll : [int64] モジュールのベースアドレス。
Index : [int] シンボルを一意に識別する値。
%inst
指定されたインデックスに一致するシンボルをローカルスコープに設定する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。


%index
SymSetScopeFromInlineContext
指定されたアドレスおよびインラインコンテキストに一致するシンボルをローカルスコープに設定する。
%prm
hProcess, Address, InlineContext
hProcess : [intptr] プロセスのハンドル。このハンドルは事前に SymInitialize 関数に渡されている必要がある。
Address : [int64] アドレス。
InlineContext : [int] インラインコンテキスト。
%inst
指定されたアドレスおよびインラインコンテキストに一致するシンボルをローカルスコープに設定する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには、GetLastError を呼び出す。


%index
SymSetSearchPath
SymSetSearchPath 関数 (dbghelp.h) は、指定されたプロセスの検索パスを設定する。
%prm
hProcess, SearchPathA
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスのハンドル。
SearchPathA : [str] 
%inst
SymSetSearchPath 関数 (dbghelp.h) は、指定されたプロセスの検索パスを設定する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]

シンボル検索パスはアプリケーションがライブラリを使用している間、何度でも変更できる。変更は以降のシンボルハンドラ呼び出しすべてに影響する。現在の検索パスを取得するには、SymGetSearchPath
関数を呼び出す。この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymSrvDeltaName
SymSrvDeltaName 関数 (dbghelp.h) は、同一のシンボル／イメージの 2 つのバージョン間の関係を表すファイルの名前を生成する。
%prm
hProcess, SymPath, Type, File1, File2
hProcess : [intptr] プロセスのハンドル。このハンドルは事前に SymInitialize 関数に渡されている必要がある。
SymPath : [str] シンボルパス。関数はシンボルストアの標準構文で記述されたシンボルストアのみを使用する。その他のパスは無視される。このパラメータが NULL の場合、関数は SymInitialize または SymSetSearchPath 関数で設定されたシンボルパスを使用する。
Type : [str] 生成されるファイル名の拡張子。
File1 : [str] シンボルまたはイメージファイルの第 1 バージョンのパス。
File2 : [str] シンボルまたはイメージファイルの第 2 バージョンのパス。
%inst
SymSrvDeltaName 関数 (dbghelp.h) は、同一のシンボル／イメージの 2
つのバージョン間の関係を表すファイルの名前を生成する。

[戻り値]
関数が成功した場合、戻り値は生成されたファイル名である。
関数が失敗した場合、戻り値は NULL である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
この関数は指定された 2
つのファイルを開き、ヘッダからインデックス情報を読み取ってシンボルサーバーに渡し、ファイル名を生成させる。Type パラメータに
"xml" を指定すると、名前は File1 のインデックスに続いてダッシュ、さらに File2 のインデックス、.xml
拡張子の順となる。例: 3F3D5C755000-3F3D647621000.xml
この関数は他の関数から再利用される可能性があるバッファへのポインタを返すため、返されたデータはただちに別のバッファへコピーすること。この関数を含め、すべての
DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymSrvGetFileIndexInfo
SymSrvGetFileIndexInfo 関数 (dbghelp.h) は、指定された .pdb、.dbg、またはイメージファイルのインデックス情報を取得する。
%prm
File, Info, Flags
File : [str] ファイル名。
Info : [var] インデックス情報を受け取る SYMSRV_INDEX_INFO 構造体。
Flags : [int] このパラメータは将来の使用のために予約されている。
%inst
SymSrvGetFileIndexInfo 関数 (dbghelp.h) は、指定された
.pdb、.dbg、またはイメージファイルのインデックス情報を取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。
関数が失敗した場合、戻り値は FALSE である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]

この関数は一般的な用途向けではない。シンボルサーバーストア内のファイル管理用ユーティリティを作成する場合、シンボルサーバーがファイルを検索する相対パスを予測するためにこの関数を使用できる。srctool.exe
はこの関数を使って実際にシンボルサーバーストアを構築している。また SymFindFileInPath
関数に渡すパラメータを求める用途にも役立つ。この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymSrvGetFileIndexString
SymSrvGetFileIndexString 関数 (dbghelp.h) は、指定された .pdb、.dbg、またはイメージファイルのインデックス文字列を取得する。
%prm
hProcess, SrvPath, File, Index, Size, Flags
hProcess : [intptr] プロセスのハンドル。このハンドルは事前に SymInitialize 関数に渡されている必要がある。
SrvPath : [str] シンボルサーバーへのパス。
File : [str] ファイル名。
Index : [str] インデックス文字列を受け取るバッファへのポインタ。
Size : [int] Index バッファのサイズ（文字数）。
Flags : [int] このパラメータは将来の使用のために予約されている。
%inst
SymSrvGetFileIndexString 関数 (dbghelp.h) は、指定された
.pdb、.dbg、またはイメージファイルのインデックス文字列を取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。
関数が失敗した場合、戻り値は FALSE である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]

この関数は一般的な用途向けではない。シンボルサーバーストア内のファイル管理用ユーティリティを作成する場合、シンボルサーバーがファイルを検索する相対パスを予測するためにこの関数を使用できる。srctool.exe
はこの関数を使って実際にシンボルサーバーストアを構築している。この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymSrvGetFileIndexes
SymSrvGetFileIndexes 関数 (dbghelp.h) は、指定された .pdb、.dbg、またはイメージファイルをストアに保存する際に使用されるインデックスを取得する。
%prm
File, Id, Val1, Val2, Flags
File : [str] ファイル名。
Id : [var] 識別用の 3 つのパラメータのうち 1 つ目。
Val1 : [var] 識別用の 3 つのパラメータのうち 2 つ目。
Val2 : [var] 識別用の 3 つのパラメータのうち 3 つ目。
Flags : [int] このパラメータは将来の使用のために予約されている。
%inst
SymSrvGetFileIndexes 関数 (dbghelp.h) は、指定された
.pdb、.dbg、またはイメージファイルをストアに保存する際に使用されるインデックスを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。関数が失敗した場合、戻り値は 0
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymSrvGetSupplement
SymSrvGetSupplement 関数 (dbghelp.h) は、シンボルストアの補助領域から指定されたファイルを取得する。
%prm
hProcess, SymPath, Node, File
hProcess : [intptr] プロセスのハンドル。このハンドルは事前に SymInitialize 関数に渡されている必要がある。
SymPath : [str] シンボルパス。関数はシンボルストアの標準構文で記述されたシンボルストアのみを使用する。その他のパスは無視される。このパラメータが NULL の場合、関数は SymInitialize または SymSetSearchPath 関数で設定されたシンボルパスを使用する。
Node : [str] 補助ファイルに関連付けられたシンボルファイル。
File : [str] ファイル名。
%inst
SymSrvGetSupplement 関数 (dbghelp.h) は、シンボルストアの補助領域から指定されたファイルを取得する。

[戻り値]
関数が成功した場合、戻り値は補助ファイルの完全修飾パスである。
関数が失敗した場合、戻り値は NULL である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
補助ファイルの詳細については、SymSrvStoreSupplement
を参照のこと。この関数は他の関数から再利用される可能性があるバッファへのポインタを返すため、返されたデータはただちに別のバッファへコピーすること。この関数を含め、すべての
DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymSrvIsStore
SymSrvIsStore 関数 (dbghelp.h) は、指定されたパスがシンボルストアを指しているかどうかを判定する。
%prm
hProcess, path
hProcess : [intptr] 事前に SymInitialize 関数に渡したプロセスのハンドル。このパラメータを NULL に設定した場合、関数はストアが存在するかどうかのみを判定する。NULL でない場合、関数はストアが存在し、かつ指定されたプロセスハンドルに対応するプロセスエントリを含むかどうかを判定する。
path : [str] シンボルストアへのパス。パスは既定のシンボルストア（たとえば SRV*）、HTTP または HTTPS シンボルサーバー、あるいはストアへの UNC・絶対・相対パスを指定できる。
%inst
SymSrvIsStore 関数 (dbghelp.h) は、指定されたパスがシンボルストアを指しているかどうかを判定する。

[戻り値]
パスがシンボルストアを指している場合、関数は TRUE を返す。そうでない場合は FALSE
を返す。拡張エラー情報を取得するには、GetLastError 関数を呼び出す。

[備考]
パスが既定のシンボルストア（たとえば SRV*）または HTTP／HTTPS
シンボルサーバーを指している場合、関数はストアが存在すると見なす。クライアントコンピュータとサーバーの間にプロキシコンピュータがある場合、プロキシ上の
SymSrv.dll のバージョンはクライアント上のバージョンより低くてはならない。この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymSrvStoreFile
SymSrvStoreFile 関数 (dbghelp.h) は、指定されたシンボルストアにファイルを保存する。
%prm
hProcess, SrvPath, File, Flags
hProcess : [intptr] プロセスのハンドル。このハンドルは事前に SymInitialize 関数に渡されている必要がある。
SrvPath : [str] シンボルストア。
File : [str] ファイル名。
Flags : [int] 関数の動作を制御するフラグ。
%inst
SymSrvStoreFile 関数 (dbghelp.h) は、指定されたシンボルストアにファイルを保存する。

[戻り値]
関数が成功した場合、戻り値は保存されたファイルの完全修飾パスを指す NULL 終端文字列へのポインタである。
関数が失敗した場合、戻り値は NULL である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数は他の関数から再利用される可能性があるバッファへのポインタを返すため、返されたデータはただちに別のバッファへコピーすること。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymSrvStoreSupplement
SymSrvStoreSupplement 関数 (dbghelp.h) は、シンボルストアの指定された補助領域にファイルを保存する。
%prm
hProcess, SrvPath, Node, File, Flags
hProcess : [intptr] プロセスのハンドル。このハンドルは事前に SymInitialize 関数に渡されている必要がある。
SrvPath : [str] シンボルストアへのパス。
Node : [str] 補助ファイルに関連付けられたシンボルファイル。
File : [str] ファイル名。
Flags : [int] このパラメータが SYMSTOREOPT_COMPRESS の場合、ファイルはシンボルストア内で圧縮される。現在のところ、それ以外にサポートされる値はない。
%inst
SymSrvStoreSupplement 関数 (dbghelp.h) は、シンボルストアの指定された補助領域にファイルを保存する。

[戻り値]
関数が成功した場合、戻り値は補助ファイルの完全修飾パスである。
関数が失敗した場合、戻り値は NULL である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
この関数の重要な用途の 1 つは差分ファイルの保存である。詳細は SymSrvDeltaName
を参照のこと。この関数は他の関数から再利用される可能性があるバッファへのポインタを返すため、返されたデータはただちに別のバッファへコピーすること。シンボルサーバーは同じ拡張子を持つ補助ファイルを共通のディレクトリに保存する。たとえば
Sup1.xml は次のディレクトリに保存される:
SymPath\supplement\Node\xml。ストアの管理者は、ストアのルートに Supplement
という名前の読み取り専用ファイルを作成することで、ユーザーによる補助ファイルの書き込みを防止できる。あるいは、supplement
ディレクトリを作成し、ACL でアクセスを制御してもよい。この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。


%index
SymUnDName64
装飾された C++ シンボル名を元に戻す。(SymUnDName64)
%prm
sym, UnDecName, UnDecNameLength
sym : [var] 元に戻す対象のシンボルを指定する IMAGEHLP_SYMBOL64 構造体へのポインタ。
UnDecName : [str] 元に戻されたシンボル名を受け取るバッファへのポインタ。
UnDecNameLength : [int] UnDecName バッファのサイズ（文字数）。
%inst
装飾された C++ シンボル名を元に戻す。(SymUnDName64)

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数は
SymUnDName 関数の後継である。詳細は Updated Platform Support を参照のこと。SymUnDName は
Dbghelp.h で次のように定義されている。
（以下省略）


%index
SymUnloadModule64
シンボルテーブルを解放する。(SymUnloadModule64)
%prm
hProcess, BaseOfDll
hProcess : [intptr] もともと SymInitialize 関数に渡したプロセスのハンドル。
BaseOfDll : [int64] 解放するモジュールのベースアドレス。
%inst
シンボルテーブルを解放する。(SymUnloadModule64)

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE
である。拡張エラー情報を取得するには、GetLastError を呼び出す。

[備考]
この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数は
SymUnloadedModule 関数の後継である。詳細は Updated Platform Support
を参照のこと。SymUnloadedModule は Dbghelp.h で次のように定義されている。
（以下省略）


%index
UnDecorateSymbolName
UnDecorateSymbolName 関数 (dbghelp.h) は、指定された装飾付き C++ シンボル名を元に戻す。
%prm
name, outputString, maxStringLength, flags
name : [str] 装飾された C++ シンボル名。この名前は先頭の文字で識別でき、常に疑問符 (?) で始まる。
outputString : [str] 元に戻された名前を受け取る文字列バッファへのポインタ。
maxStringLength : [int] UnDecoratedName バッファのサイズ（文字数）。
flags : [int] 装飾名をどのように元に戻すかのオプション。このパラメータには以下の値を 0 個以上指定できる。
%inst
UnDecorateSymbolName 関数 (dbghelp.h) は、指定された装飾付き C++ シンボル名を元に戻す。

[戻り値]
関数が成功した場合、戻り値は UnDecoratedName バッファ内の文字数（NULL
終端を含まない）である。関数が失敗した場合、戻り値は 0 である。拡張エラー情報を取得するには、GetLastError
を呼び出す。関数が失敗して 0 を返した場合、UnDecoratedName バッファの内容は不定である。

[備考]
元に戻されたシンボルを使用するには、SymSetOptions 関数に SYMOPT_UNDNAME
オプションを指定して呼び出す。この関数を含め、すべての DbgHelp
関数はシングルスレッドである。そのため複数のスレッドから同時に呼び出すと、予期しない動作やメモリ破壊を招く可能性が高い。これを避けるには、複数スレッドからの並行呼び出しをすべて同期する必要がある。この関数の
Unicode 版を呼び出すには DBGHELP_TRANSLATE_TCHAR を定義する。

