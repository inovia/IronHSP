; ============================================================
;   version.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
version.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の version.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
GetFileVersionInfoW
指定ファイルのバージョン情報を取得する。(GetFileVersionInfoW)
%prm
lptstrFilename, dwHandle, dwLen, lpData
lptstrFilename : [wstr] 型: LPCTSTR ファイル名。フルパス指定でない場合は LoadLibrary と同じ検索順序を使う。
dwHandle : [int] 型: DWORD このパラメータは無視される。
dwLen : [int] 型: DWORD lpData が指すバッファのサイズ(バイト単位)。先に GetFileVersionInfoSize を呼んで必要サイズを求めること。不十分なサイズを渡すと関数はバージョン情報を切り詰める。
lpData : [intptr] 型: LPVOID ファイルバージョン情報を受け取るバッファへのポインタ。後で VerQueryValue に渡してデータを取り出せる。
%inst
指定ファイルのバージョン情報を取得する。(GetFileVersionInfoW)

[戻り値]
型: BOOL 成功時は 0 以外、失敗時は 0 を返す。拡張エラー情報は GetLastError で取得する。

[備考]
ファイルバージョン情報には固定部と非固定部がある。固定部にはバージョン番号などが含まれ、非固定部には文字列などが含まれる。かつてはバイナリ
(exe/dll) からバージョン情報を取得していたが、現在は言語中立ファイルから固定部を、mui
ファイルから非固定部を取得してマージする。対象バイナリに mui ファイルがない場合は従来と同じ動作。呼び出し前に
GetFileVersionInfoSize を呼ぶこと。取得後のバッファから情報を取り出すには VerQueryValue を使う。
> [!NOTE] > winver.h は UNICODE マクロに応じて GetFileVersionInfo を
ANSI/Unicode 版のエイリアスとして定義する。


%index
GetFileVersionInfoExW
指定されたファイルのバージョン情報を取得する。(GetFileVersionInfoExW)
%prm
dwFlags, lpwstrFilename, dwHandle, dwLen, lpData
dwFlags : [int] 型: DWORD バージョンリソースを抽出する MUI DLL（存在する場合）を制御する。このフラグの値は、dwLen パラメータに渡すバッファサイズを決定するために使用した対応する GetFileVersionInfoSizeEx 呼び出しに渡したフラグと一致する必要がある。以下のフラグから 0 個以上を指定する。
lpwstrFilename : [wstr] 型: LPCTSTR ファイル名。フルパスが指定されていない場合、関数は LoadLibrary 関数で指定された検索順序を使用する。
dwHandle : [int] 型: DWORD このパラメータは無視される。
dwLen : [int] 型: DWORD lpData パラメータが指すバッファのサイズ（バイト単位）。
lpData : [intptr] 型: LPVOID 関数が戻ったとき、ファイルのバージョン情報を格納したバッファへのポインタを保持する。この値は、後続の VerQueryValue 関数の呼び出しでバッファからデータを取得するために使用できる。
%inst
指定されたファイルのバージョン情報を取得する。(GetFileVersionInfoExW)

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
GetFileVersionInfoEx 関数を呼び出す前に GetFileVersionInfoSizeEx
関数を呼び出すこと。ファイルバージョン情報バッファから情報を取得するには、VerQueryValue 関数を使用する。
> [!NOTE] > winver.h ヘッダは GetFileVersionInfoEx を、UNICODE
プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または Unicode
版を自動的に選択するエイリアスとして定義している。エンコーディング中立なエイリアスとエンコーディング中立でないコードを混在させると、コンパイルや実行時のエラーにつながる不一致が発生する場合がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetFileVersionInfoSizeW
OS が指定ファイルのバージョン情報を取得できるかを判定し、取得可能ならそのサイズ(バイト単位)を返す。(Unicode)
%prm
lptstrFilename, lpdwHandle
lptstrFilename : [wstr] 型: LPCTSTR 対象ファイルの名前。LoadLibrary と同じ検索順序を使う。
lpdwHandle : [var] 型: LPDWORD 関数が 0 に設定する変数へのポインタ。
%inst
OS が指定ファイルのバージョン情報を取得できるかを判定し、取得可能ならそのサイズ(バイト単位)を返す。(Unicode)

[戻り値]
型: DWORD 成功時はファイルのバージョン情報サイズ(バイト単位)を返す。失敗時は 0。拡張エラー情報は GetLastError
で取得する。

[備考]
GetFileVersionInfo を呼ぶ前に本関数を呼ぶこと。返されたサイズは GetFileVersionInfo
に必要なバッファサイズを示す。
> [!NOTE] > winver.h は UNICODE マクロに応じて GetFileVersionInfoSize を
ANSI/Unicode 版のエイリアスとして定義する。


%index
GetFileVersionInfoSizeExW
オペレーティングシステムが指定されたファイルのバージョン情報を取得できるかどうかを判定する。バージョン情報が利用可能な場合、GetFileVersionInfoSizeEx はその情報のサイズ（バイト単位）を返す。(Unicode)
%prm
dwFlags, lpwstrFilename, lpdwHandle
dwFlags : [int] 型: DWORD バージョンリソースを抽出する MUI DLL（存在する場合）を制御する。以下のフラグから 0 個以上を指定する。
lpwstrFilename : [wstr] 型: LPCTSTR 対象ファイルの名前。関数は LoadLibrary 関数で指定された検索順序を使用する。
lpdwHandle : [var] 型: LPDWORD 関数が戻ったとき、変数へのポインタを保持する。この変数は本関数によって 0 に設定される。このパラメータは歴史的な理由で存在する。
%inst

オペレーティングシステムが指定されたファイルのバージョン情報を取得できるかどうかを判定する。バージョン情報が利用可能な場合、GetFileVersionInfoSizeEx
はその情報のサイズ（バイト単位）を返す。(Unicode)

[戻り値]
型: DWORD 関数が成功した場合、戻り値はファイルのバージョン情報のサイズ（バイト単位）となる。
関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
GetFileVersionInfoEx 関数を呼び出す前に GetFileVersionInfoSizeEx
関数を呼び出すこと。GetFileVersionInfoSizeEx が返すサイズは、GetFileVersionInfoEx
が返すバージョン情報を格納するために必要なバッファサイズを示す。
> [!NOTE] > winver.h ヘッダは GetFileVersionInfoSizeEx を、UNICODE
プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または Unicode
版を自動的に選択するエイリアスとして定義している。エンコーディング中立なエイリアスとエンコーディング中立でないコードを混在させると、コンパイルや実行時のエラーにつながる不一致が発生する場合がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
VerFindFileW
システム内に該当ファイルの別バージョンがあるかどうかに基づいて、ファイルをインストールする場所を決定する。VerFindFile が指定バッファに返す値は、後続の VerInstallFile 関数呼び出しで使用される。(Unicode)
%prm
uFlags, szFileName, szWinDir, szAppDir, szCurDir, puCurDirLen, szDestDir, puDestDirLen
uFlags : [int] 型: DWORD このパラメータには次の値を指定できる。その他のビットはすべて予約されている。
szFileName : [wstr] 型: LPCTSTR インストールするファイルの名前。ファイル名と拡張子のみを指定し、パスを含めてはならない。
szWinDir : [wstr] 型: LPCTSTR Windows が動作している、または動作する予定のディレクトリ。この文字列は GetWindowsDirectory 関数によって返される。
szAppDir : [wstr] 型: LPCTSTR インストールプログラムが関連ファイル群をインストールするディレクトリ。インストールプログラムがアプリケーションをインストールする場合は、これがアプリケーションの配置先ディレクトリとなる。このパラメータは、特に指定しない限りアプリケーションのカレントディレクトリも指す。
szCurDir : [wstr] 型: LPWSTR インストールするファイルの現行バージョンへのパスを受け取るバッファ。このパスは null 終端文字列である。現行バージョンがインストールされていない場合、バッファは長さ 0 の文字列を含む。バッファは少なくとも _MAX_PATH 文字以上の長さを持つことが望ましいが、必須ではない。
puCurDirLen : [var] 型: PUINT szCurDir バッファの長さ。このポインタは NULL であってはならない。関数が戻ったとき、lpuCurDirLen は szCurDir に返されるデータのサイズ（終端の null 文字を含む文字数）を保持する。バッファがすべてのデータを格納するには小さすぎる場合、lpuCurDirLen にはパスを保持するために必要なバッファサイズが格納される。
szDestDir : [wstr] 型: LPTSTR VerFindFile が推奨するインストール場所へのパスを受け取るバッファ。このパスは null 終端文字列である。バッファは少なくとも _MAX_PATH 文字以上の長さを持つことが望ましいが、必須ではない。
puDestDirLen : [var] 型: PUINT szDestDir バッファの長さを指定する変数へのポインタ。このポインタは NULL であってはならない。関数が戻ったとき、lpuDestDirLen は szDestDir に返されるデータのサイズ（終端の null 文字を含む文字数）を保持する。バッファがすべてのデータを格納するには小さすぎる場合、lpuDestDirLen にはパスを保持するために必要なバッファサイズが格納される。
%inst
システム内に該当ファイルの別バージョンがあるかどうかに基づいて、ファイルをインストールする場所を決定する。VerFindFile
が指定バッファに返す値は、後続の VerInstallFile 関数呼び出しで使用される。(Unicode)

[戻り値]
型: DWORD 戻り値はファイルの状態を示すビットマスクである。次の値の 1
つ以上を含む可能性がある。その他の値はすべて予約されている。
（以下省略）

[備考]
この関数は 16 ビット、32 ビット、64 ビットのファイルイメージで動作する。VerFindFile は OpenFile
関数を使用して指定されたファイルのコピーを検索する。ただし、システムディレクトリは指定された Windows
ディレクトリから決定するか、パスを検索する。dwFlags
パラメータがファイルがこのアプリケーション専用（VFFF_ISSHAREDFILE
ではない）であることを示している場合、VerFindFile
はアプリケーションのディレクトリにファイルをインストールすることを推奨する。それ以外の場合、システムが共有コピーで動作しているなら関数は
Windows
ディレクトリへのインストールを推奨し、システムがプライベートコピーで動作しているならシステムディレクトリへのインストールを推奨する。
> [!NOTE] > winver.h ヘッダは VerFindFile を、UNICODE
プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または Unicode
版を自動的に選択するエイリアスとして定義している。エンコーディング中立なエイリアスとエンコーディング中立でないコードを混在させると、コンパイルや実行時のエラーにつながる不一致が発生する場合がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
VerInstallFileW
VerFindFile 関数から返された情報に基づいて、指定されたファイルをインストールする。VerInstallFile は必要に応じてファイルを展開し、一意のファイル名を割り当て、古いファイルなどのエラーをチェックする。(Unicode)
%prm
uFlags, szSrcFileName, szDestFileName, szSrcDir, szDestDir, szCurDir, szTmpFile, puTmpFileLen
uFlags : [int] 型: DWORD
szSrcFileName : [wstr] 型: LPCTSTR インストールするファイルの名前。これは szSrcDir パラメータが指すディレクトリ内のファイル名であり、ファイル名と拡張子のみを含めることができる（パスを含めてはならない）。
szDestFileName : [wstr] 型: LPCTSTR インストール時に VerInstallFile が新しいファイルに付ける名前。このファイル名は szSrcFileName のディレクトリにあるファイル名と異なっていてもよい。新しい名前にはファイル名と拡張子のみを含め、パスを含めてはならない。
szSrcDir : [wstr] 型: LPCTSTR ファイルが見つかるディレクトリの名前。
szDestDir : [wstr] 型: LPCTSTR ファイルをインストールすべきディレクトリの名前。VerFindFile はこの値を szDestDir パラメータに返す。
szCurDir : [wstr] 型: LPCTSTR このファイルの既存バージョンが見つかったディレクトリの名前。VerFindFile はこの値を szCurDir パラメータに返す。
szTmpFile : [wstr] 型: LPTSTR ソースファイルの一時的なコピーの名前。バッファは少なくとも _MAX_PATH 文字以上の長さを持つことが望ましいが必須ではなく、入力時には空にしておく必要がある。
puTmpFileLen : [var] 型: PUINT szTmpFile バッファの長さ。このポインタは NULL であってはならない。関数が戻ったとき、lpuTmpFileLen は szTmpFile に返されるデータのサイズ（終端の null 文字を含む文字数）を受け取る。バッファがすべてのデータを格納するには小さすぎる場合、lpuTmpFileLen にはデータを保持するために必要なバッファサイズが格納される。
%inst
VerFindFile 関数から返された情報に基づいて、指定されたファイルをインストールする。VerInstallFile
は必要に応じてファイルを展開し、一意のファイル名を割り当て、古いファイルなどのエラーをチェックする。(Unicode)

[戻り値]
型: DWORD 戻り値は例外を示すビットマスクである。次の値の 1 つ以上を含む可能性がある。その他の値はすべて予約されている。
（以下省略）

[備考]
この関数は 16 ビット、32 ビット、64 ビットのファイルイメージで動作する。VerInstallFile
はソースディレクトリから対象ディレクトリへファイルをコピーする。szCurDir
がシステム上に以前のバージョンのファイルが存在することを示している場合、VerInstallFile
はファイルのバージョンスタンプ情報を比較する。以前にインストールされたバージョンが新しいバージョンより新しい場合、または属性に大きな差がある場合（例えば異なる言語である場合）、VerInstallFile
は 1 つ以上の回復可能なエラーコードを返す。VerInstallFile
は対象ディレクトリに一時ファイルを残す。アプリケーションはエラーを上書きするか、一時ファイルを削除できる。アプリケーションがエラーを上書きする場合、VerInstallFile
は以前にインストールされたバージョンを削除し、一時ファイルを元のファイル名に変更する。
> [!NOTE] > winver.h ヘッダは VerInstallFile を、UNICODE
プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または Unicode
版を自動的に選択するエイリアスとして定義している。エンコーディング中立なエイリアスとエンコーディング中立でないコードを混在させると、コンパイルや実行時のエラーにつながる不一致が発生する場合がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
VerQueryValueW
指定のバージョン情報リソースから指定の情報を取得する。(Unicode)
%prm
pBlock, lpSubBlock, lplpBuffer, puLen
pBlock : [intptr] 型: LPCVOID GetFileVersionInfo が返したバージョン情報リソース。
lpSubBlock : [wstr] 型: LPCTSTR 取得するバージョン情報の値。バックスラッシュ (\\) で区切られた名前で構成する。
lplpBuffer : [var] 型: LPVOID* 復帰時、pBlock 内の要求バージョン情報へのポインタを受け取る。pBlock のメモリ解放時に一緒に解放される。
puLen : [var] 型: PUINT 復帰時、lplpBuffer が指すデータのサイズを受け取る。バージョン情報値の場合は文字列の文字数、翻訳配列値の場合は配列のバイト数、ルートブロックの場合は構造体のバイト数。
%inst
指定のバージョン情報リソースから指定の情報を取得する。(Unicode)

[戻り値]
型: BOOL 指定のバージョン情報構造体が存在し情報が取得できれば 0 以外、長さバッファのアドレスが 0
であれば該当名前用の値が存在しない。指定名前が存在しない/リソースが無効の場合は 0 を返す。

[備考]
本関数は 16/32/64 ビットファイルイメージで動作する。定義済みバージョン情報 Unicode 文字列は以下の通り。
（以下省略）

