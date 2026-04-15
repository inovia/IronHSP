; ============================================================
;   shell32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
shell32.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の shell32.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
AssocGetDetailsOfPropKey
名前空間拡張が提供するファイル関連付け情報を使って、指定したプロパティキーの値を取得する。
%prm
psf, pidl, pkey, pv, pfFoundPropKey
psf : [var] 型: IShellFolder* ファイル関連付けのプロパティキーの詳細を取得する対象のシェルフォルダへのポインタ。
pidl : [var] 型: PCUITEMID_CHILD ファイル関連付けの取得対象となる子アイテムの PIDL。
pkey : [var] 型: PROPERTYKEY* 取得するプロパティキーへのポインタ。
pv : [var] 型: VARIANT* この関数から戻る際に、指定されたプロパティキーの詳細を格納する。
pfFoundPropKey : [var] 型: BOOL* この関数から戻る際に、プロパティキーが見つかった場合は TRUE、見つからなかった場合は FALSE となるフラグを格納する。
%inst
名前空間拡張が提供するファイル関連付け情報を使って、指定したプロパティキーの値を取得する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
この関数は IShellFolder 名前空間拡張の実装者専用である。それ以外の呼び出し側アプリケーションは、PROPERTYKEY
の値を取得するために IShellFolder2::GetDetailsEx を使用すること。この関数は IShellFolder
名前空間拡張の実装者によって使用される。提供する名前空間拡張は、次の 3 つのいずれかの方法でこの API
の使用をサポートしなければならない。
（以下省略）


%index
CDefFolderMenu_Create2
選択された一群のファイルフォルダオブジェクトに対するコンテキストメニューを作成する。
%prm
pidlFolder, hwnd, cidl, apidl, psf, pfn, nKeys, ahkeys, ppcm
pidlFolder : [var] 型: PCIDLIST_ABSOLUTE 親フォルダの ITEMIDLIST 構造体。この値は NULL でも構わない。
hwnd : [intptr] 型: HWND 親ウィンドウへのハンドル。この値は NULL でも構わない。
cidl : [int] 型: UINT apidl が指す配列内の ITEMIDLIST 構造体の数。
apidl : [var] 型: PCUITEMID_CHILD_ARRAY* 選択された各アイテムに対応する ITEMIDLIST 構造体の配列へのポインタ。
psf : [var] 型: IShellFolder* 親フォルダの IShellFolder インタフェースへのポインタ。この IShellFolder は IDataObject インタフェースをサポートしている必要があり、サポートしていない場合 CDefFolderMenu_Create2 は失敗して E_NOINTERFACE を返す。この値は NULL でも構わない。
pfn : [int] 型: LPFNDFMCALLBACK LPFNDFMCALLBACK コールバックオブジェクト。コールバックオブジェクトが不要な場合は NULL を指定できる。
nKeys : [int] 型: UINT ahkeys が指す配列内のレジストリキーの数。
ahkeys : [intptr] 型: const HKEY* メニュー項目に使用するコンテキストメニューハンドラを指定するレジストリキーの配列へのポインタ。コンテキストメニューハンドラの詳細については「コンテキストメニューハンドラの作成」を参照。この配列には最大 16 個のレジストリキーを格納できる。
ppcm : [var] 型: IContextMenu** 関数が成功して戻る際に、コンテキストメニューを表す IContextMenu オブジェクトを指す IContextMenu インタフェースポインタのアドレス。
%inst
選択された一群のファイルフォルダオブジェクトに対するコンテキストメニューを作成する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
CIDLData_CreateFromIDArray
CIDLData_CreateFromIDArray は変更されたり利用できなくなったりする可能性がある。
%prm
pidlFolder, cidl, apidl, ppdtobj
pidlFolder : [var] 型: PCIDLIST_ABSOLUTE apidl で指定されたアイテムのルートを表す完全修飾 IDLIST。
cidl : [int] 型: UINT apidl 配列のエントリ数。
apidl : [var] 型: PCUIDLIST_RELATIVE_ARRAY pidlFolder からの相対アイテム ID の配列。通常 apidl は子 ID の配列で、pidlFolder はそれらアイテムの完全な PIDL である。ただし pidlFolder には NULL PIDL（デスクトップの IDLIST）を指定することもでき、その場合 apidl は完全修飾 ID リストを格納できる。
ppdtobj : [var] 型: IDataObject** IDataObject を実装するオブジェクトへのポインタを受け取るアドレス。
%inst
CIDLData_CreateFromIDArray は変更されたり利用できなくなったりする可能性がある。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
この関数で作成されるデータオブジェクトは、シェルクリップボード形式識別子 CFSTR_SHELLIDLIST
を提供する。さらに、他のクリップボード形式を取り込むため IDataObject::SetData 呼び出しもサポートする。


%index
CommandLineToArgvW
Unicode のコマンドライン文字列を解析し、標準 C ランタイムの argv および argc の値と同様に、コマンドライン引数へのポインタの配列とその引数の数を返す。
%prm
lpCmdLine, pNumArgs
lpCmdLine : [wstr] 型: LPCWSTR コマンドライン全体を格納したヌル終端 Unicode 文字列へのポインタ。このパラメータが空文字列の場合、関数は現在の実行ファイルへのパスを返す。
pNumArgs : [var] 型: int* argc と同様に、返される配列要素数を受け取る int へのポインタ。
%inst
Unicode のコマンドライン文字列を解析し、標準 C ランタイムの argv および argc
の値と同様に、コマンドライン引数へのポインタの配列とその引数の数を返す。

[戻り値]
型: LPWSTR* argv と同様の LPWSTR 値の配列へのポインタ。
関数が失敗した場合、戻り値は NULL である。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
CommandLineToArgvW が返すアドレスは、LPWSTR 値の配列の先頭要素のアドレスであり、この配列内のポインタ数は
pNumArgs によって示される。各ヌル終端 Unicode
文字列ポインタは、コマンドライン上で見つかった個々の引数を表す。CommandLineToArgvW
は引数文字列へのポインタおよび引数文字列自体のために連続したメモリブロックを確保するので、呼び出し側アプリケーションは不要になった時点でその引数リストのメモリを解放しなければならない。メモリの解放には
LocalFree 関数を 1 度呼び出せばよい。argv と argc の引数規約の詳細は「Argument
Definitions」および「Parsing C Command-Line Arguments」を参照。lpCmdLine
パラメータに渡すのに適したコマンドライン文字列は GetCommandLineW
関数で取得できる。この関数はプログラム名を含むコマンドラインを受け付け、プログラム名は引用符で囲まれていてもいなくてもよい。CommandLineToArgvW
は、バックスラッシュ文字の直後に引用符（"）が続く場合に特別な解釈を行う。この解釈では、先行する引数は有効なファイルシステムパスであることを前提としており、そうでないと予測不能な動作となる可能性がある。この特別な解釈はパーサが追跡する「引用符内」モードを制御する。このモードがオフのとき、空白で現在の引数が終端される。オンのとき、空白は他の文字と同様に引数に追加される。
（以下省略）


%index
DAD_AutoScroll
イメージのドラッグ中にウィンドウをスクロールする。
%prm
hwnd, pad, pptNow
hwnd : [intptr] 型: HWND スクロール対象のウィンドウへのハンドル。
pad : [var] 型: AUTO_SCROLL_DATA* AUTO_SCROLL_DATA 構造体へのポインタ。
pptNow : [var] 型: const POINT* 現在のスクロール座標へのポインタ。
%inst
イメージのドラッグ中にウィンドウをスクロールする。

[戻り値]
型: BOOL 成功した場合は 0 以外、それ以外の場合は 0 を返す。

[備考]
この関数は AUTO_SCROLL_DATA 構造体の bFull パラメータが TRUE
の場合にのみ成功し、ウィンドウがスクロールする。bFull が FALSE の間は、この関数を呼び出すたびに iNextSample
パラメータが 1 ずつ増加し、現在のスクロール座標と時刻が AUTO_SCROLL_DATA 構造体に返される。iNextSample が
NUM_POINTS と等しくなると bFull が TRUE に設定され、関数が成功してウィンドウがスクロールする。


%index
DAD_DragEnterEx
ドラッグ操作中に指定したウィンドウへの更新をロックし、ウィンドウ内の指定位置にドラッグイメージを表示する。(DAD_DragEnterEx)
%prm
hwndTarget, ptStart
hwndTarget : [intptr] 型: HWND ドラッグイメージを所有するウィンドウへのハンドル。
ptStart : [int] 型: const POINT ドラッグイメージの表示を開始する座標。座標はクライアント領域ではなく、ウィンドウの左上隅を基準とする。
%inst

ドラッグ操作中に指定したウィンドウへの更新をロックし、ウィンドウ内の指定位置にドラッグイメージを表示する。(DAD_DragEnterEx)

[戻り値]
型: BOOL 成功した場合は TRUE、それ以外の場合は FALSE を返す。


%index
DAD_DragEnterEx2
ドラッグ&ドロップ操作の間、指定したウィンドウへの更新をロックし、ウィンドウ内の指定位置にドラッグイメージを表示する。
%prm
hwndTarget, ptStart, pdtObject
hwndTarget : [intptr] 型: HWND ドラッグイメージを所有するウィンドウへのハンドル。
ptStart : [int] 型: const POINT ドラッグイメージの表示を開始する座標を指定する。座標はクライアント領域ではなく、ウィンドウの左上隅を基準とする。
pdtObject : [var] 型: IDataObject* データオブジェクト上の IDataObject インタフェースへのポインタ。このデータオブジェクトはドラッグ&ドロップ操作で転送されるデータを保持しており、ドロップが発生するとターゲットに取り込まれる。このパラメータは NULL でも構わない。
%inst
ドラッグ&ドロップ操作の間、指定したウィンドウへの更新をロックし、ウィンドウ内の指定位置にドラッグイメージを表示する。

[戻り値]
型: BOOL 成功した場合は TRUE、それ以外の場合は FALSE を返す。


%index
DAD_DragLeave
DAD_DragEnterEx 関数によってロックされたウィンドウのロックを解除する。
%prm

%inst
DAD_DragEnterEx 関数によってロックされたウィンドウのロックを解除する。

[戻り値]
型: BOOL 成功した場合は SUCCEEDED、それ以外の場合は FALSE を返す。


%index
DAD_DragMove
ドラッグ&ドロップ操作中にドラッグされているイメージを移動する。
%prm
pt
pt : [int] 型: POINT ドラッグイメージを表示する座標。座標はクライアント領域ではなく、ウィンドウの左上隅を基準とする。
%inst
ドラッグ&ドロップ操作中にドラッグされているイメージを移動する。

[戻り値]
型: BOOL 成功した場合は 0 以外、それ以外の場合は 0 を返す。


%index
DAD_SetDragImage
ドラッグイメージを設定する。
%prm
him, pptOffset
him : [intptr] 型: HIMAGELIST イメージリストへのハンドル。このパラメータでは ImageList のインデックス 0 を使用する。
pptOffset : [var] 型: POINT* イメージのドラッグ時にホットスポットとして使用する座標へのポインタ。座標はイメージの左上隅を基準とする。
%inst
ドラッグイメージを設定する。

[戻り値]
型: BOOL 成功した場合は 0 以外、それ以外の場合は 0 を返す。

[備考]
him パラメータに -1、pptOffset パラメータに NULL
を設定するとドラッグイメージを消去できる。イメージは同じスレッド内で設定されている必要がある。


%index
DAD_ShowDragImage
ドラッグされているイメージを表示または非表示にする。(DAD_ShowDragImage)
%prm
fShow
fShow : [int] 型: BOOL ドラッグされているイメージを表示するか非表示にするかを指定する値。
%inst
ドラッグされているイメージを表示または非表示にする。(DAD_ShowDragImage)

[戻り値]
型: BOOL 成功した場合は 0 以外、それ以外の場合は 0 を返す。

[備考]
この関数はロックされたウィンドウに対して機能する。レイヤードウィンドウでは機能しない。


%index
DoEnvironmentSubstW
1 つ以上の環境変数への参照を含む入力文字列を解析し、それらを完全に展開した値に置き換える。(Unicode)
%prm
pszSrc, cchSrc
pszSrc : [wstr] 型: LPTSTR 1 つ以上の環境変数への参照を次の形式で含むヌル終端文字列へのポインタ。大文字小文字は区別されない。
cchSrc : [int] 型: UINT pszSrc が指すバッファのサイズ（文字数）。バッファは返される文字列を格納するのに十分な大きさが必要であることに注意。
%inst
1 つ以上の環境変数への参照を含む入力文字列を解析し、それらを完全に展開した値に置き換える。(Unicode)

[戻り値]
型: DWORD 展開された文字列がバッファに収まる場合、HIWORD に TRUE が返り、新しい pszSrc の長さ（文字数）が
LOWORD に返る。
展開された文字列がバッファに対して大きすぎる場合、HIWORD に FALSE が返り、LOWORD に cchSrc が返る。

[備考]
パラメータには有効で NULL
以外の値が含まれていなければならない。これらの値は呼び出し側で検証する必要がある。検証を怠ると予期しない結果になる可能性がある。pszSrc
に返される文字列は通常入力文字列より長くなるため、展開後の文字列を格納するのに十分な大きさのバッファを用意すること。ANSI 文字列の場合
cchSrc バッファに割り当てるサイズは Unicode 文字列のバッファより 1 大きくする必要がある。ANSI
文字列を扱う際は「バッファサイズ = 文字列長 + 終端ヌル文字 +
1」という式で必要な最小バッファサイズを求める。環境変数はユーザやアプリケーションが追加できるため、その完全なリストはシステム依存である。次の環境変数は標準であり、対話型アプリケーションおよびサービスの両方で利用できる。
（以下省略）


%index
DragAcceptFiles
ウィンドウがドロップされたファイルを受け付けるかを登録する。
%prm
hWnd, fAccept
hWnd : [intptr] 型: HWND ドロップされたファイルを受け付けるかどうかを登録するウィンドウの識別子。
fAccept : [int] 型: BOOL hWnd で識別されるウィンドウがドロップされたファイルを受け付けるかを示す値。TRUE で受け付け、FALSE で受け付けを中止する。
%inst
ウィンドウがドロップされたファイルを受け付けるかを登録する。

[備考]
fAccept に TRUE を指定して DragAcceptFiles を呼び出したアプリケーションは、ファイルマネージャからの
WM_DROPFILES メッセージを処理できることを示す。


%index
DragFinish
アプリケーションへファイル名を転送するためにシステムが割り当てたメモリを解放する。
%prm
hDrop
hDrop : [intptr] 型: HDROP ドロップされたファイルを記述する構造体の識別子。このハンドルは WM_DROPFILES メッセージの wParam から取得する。
%inst
アプリケーションへファイル名を転送するためにシステムが割り当てたメモリを解放する。


%index
DragQueryFileW
ドラッグアンドドロップ操作の結果としてドロップされたファイル名を取得する。(Unicode)
%prm
hDrop, iFile, lpszFile, cch
hDrop : [intptr] 型: HDROP ドロップされたファイル名を含む構造体の識別子。
iFile : [int] 型: UINT 照会するファイルのインデックス。0xFFFFFFFF の場合はドロップされたファイル総数を返す。0 から総数の間の値なら対応するインデックスのファイル名を lpszFile にコピーする。
lpszFile : [wstr] 型: LPTSTR ドロップされたファイル名を受け取るバッファのアドレス。NULL 終端文字列。NULL を指定すると必要なバッファサイズ(文字単位)を返す。
cch : [int] 型: UINT lpszFile バッファのサイズ(文字単位)。
%inst
ドラッグアンドドロップ操作の結果としてドロップされたファイル名を取得する。(Unicode)

[戻り値]
型: UINT 0 以外の値は成功を示す。ファイル名をバッファにコピーした場合、戻り値は終端 NULL
を含まないコピーされた文字数。iFile が 0xFFFFFFFF の場合、戻り値はドロップされたファイル数。iFile が 0
から総数の間で lpszFile が NULL の場合、戻り値は必要なバッファサイズ(文字単位、終端 NULL を含まない)。

[備考]
shellapi.h ヘッダは UNICODE プリプロセッサ定数の定義に基づいて ANSI または Unicode
版を自動選択するエイリアスとして DragQueryFile
を定義している。エンコーディング非中立なコードでエイリアスを混用するとコンパイル時または実行時エラーを招く可能性がある。


%index
DragQueryPoint
ドラッグアンドドロップ操作でファイルがドロップされた時点のマウスポインタ位置を取得する。
%prm
hDrop, ppt
hDrop : [intptr] 型: HDROP ドロップされたファイルを記述するドロップ構造体のハンドル。
ppt : [var] 型: POINT* 関数が成功した場合にファイルがドロップされた時のマウスポインタ座標を受け取る POINT 構造体へのポインタ。
%inst
ドラッグアンドドロップ操作でファイルがドロップされた時点のマウスポインタ位置を取得する。

[戻り値]
型: BOOL ウィンドウのクライアント領域内でドロップされた場合は TRUE、そうでなければ FALSE。

[備考]
座標が返されるウィンドウは WM_DROPFILES メッセージを受信したウィンドウ。


%index
DriveType
DriveType 関数はドライブ番号からドライブの種類を判別する。(DriveType function)
%prm
iDrive
iDrive : [int] 型: int 調べたいドライブの番号。"A:" は 0、"B:" は 1、というように対応する。
%inst
DriveType 関数はドライブ番号からドライブの種類を判別する。(DriveType function)

[戻り値]
型: int 次のいずれかの値を返す。
（以下省略）

[備考]
DriveType は RealDriveType を呼び出すのと等価である。RealDriveType の方が推奨される関数である。


%index
DuplicateIcon
指定したアイコンの複製を作成する。
%prm
hInst, hIcon
hInst : [intptr] 型: HINSTANCE
hIcon : [intptr] 型: HICON 複製対象となるアイコンへのハンドル。
%inst
指定したアイコンの複製を作成する。

[戻り値]
型: HICON 成功した場合、関数は新しく作成されたアイコンへのハンドルを返す。それ以外の場合は NULL を返す。

[備考]
DuplicateIcon が返したアイコンハンドルは、不要になった時点で呼び出し側が DestroyIcon
関数を呼び出して解放する責任がある。


%index
ExtractAssociatedIconW
ファイル内にリソースとして格納されたアイコン、またはファイルに関連付けられた実行ファイル内に格納されたアイコンへのハンドルを取得する。(Unicode)
%prm
hInst, pszIconPath, piIcon
hInst : [intptr] 型: HINSTANCE 呼び出し側アプリケーションのインスタンスへのハンドル。
pszIconPath : [wstr] 型: LPTSTR 文字列へのポインタ。入力時にはアイコンを含むファイルの完全なパスとファイル名を指定する。関数はそのファイル、またはそのファイルに関連付けられた実行ファイルからアイコンハンドルを抽出する。
piIcon : [var] 型: LPWORD WORD 値へのポインタ。入力時にはハンドルを取得するアイコンのインデックスを指定する。
%inst

ファイル内にリソースとして格納されたアイコン、またはファイルに関連付けられた実行ファイル内に格納されたアイコンへのハンドルを取得する。(Unicode)

[戻り値]
型: HICON
関数が成功した場合、戻り値はアイコンハンドルである。アイコンが関連付けられた実行ファイルから抽出された場合、関数は実行ファイルの完全なパスとファイル名を
lpIconPath が指す文字列に格納し、アイコン識別子を lpiIcon が指す WORD に格納する。
関数が失敗した場合、戻り値は NULL である。

[備考]
ExtractAssociatedIcon が返したアイコンハンドルは、不要になった時点で呼び出し側が DestroyIcon
関数を呼び出して解放する責任がある。ExtractAssociatedIcon 関数はまず lpIconPath
で指定されたファイル内でインデックス指定されたアイコンを探す。そのファイルからアイコンハンドルを取得できず、かつそのファイルに関連付けられた実行ファイルがある場合、その実行ファイル内でアイコンを探す。実行ファイルとの関連付けはファイル名の拡張子に基づいており、レジストリのユーザ単位部分に格納されている。
> [!NOTE] > shellapi.h ヘッダは UNICODE プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または
Unicode 版を自動的に選択するエイリアスとして ExtractAssociatedIcon
を定義している。エンコーディング非依存のエイリアスとエンコーディング依存のコードを混在させるとミスマッチが生じ、コンパイルエラーや実行時エラーを引き起こす可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
ExtractAssociatedIconExW
ExtractAssociatedIconEx は変更されたり利用できなくなったりする可能性がある。(Unicode)
%prm
hInst, pszIconPath, piIconIndex, piIconId
hInst : [intptr] 型: HINSTANCE アイコンを抽出するモジュールのハンドル。
pszIconPath : [wstr] 型: LPTSTR 文字列へのポインタ。入力時にはアイコンを含むファイルの完全なパスとファイル名を指定する。関数はそのファイル、またはそのファイルに関連付けられた実行ファイルからアイコンハンドルを抽出する。
piIconIndex : [var] 型: LPWORD WORD 値へのポインタ。入力時にはハンドルを取得するアイコンのインデックスを指定する。
piIconId : [var] 型: LPWORD WORD 値へのポインタ。入力時にはハンドルを取得するアイコンの ID を指定する。
%inst
ExtractAssociatedIconEx は変更されたり利用できなくなったりする可能性がある。(Unicode)

[戻り値]
型: HICON 成功した場合はアイコンへのハンドルを返す。それ以外の場合は NULL を返す。

[備考]
この関数が返したアイコンハンドルは、不要になった時点で DestroyIcon を呼び出して解放しなければならない。
> [!NOTE] > shellapi.h ヘッダは UNICODE プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または
Unicode 版を自動的に選択するエイリアスとして ExtractAssociatedIconEx
を定義している。エンコーディング非依存のエイリアスとエンコーディング依存のコードを混在させるとミスマッチが生じ、コンパイルエラーや実行時エラーを引き起こす可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
ExtractIconW
指定された実行ファイル、DLL、またはアイコンファイルからアイコンのハンドルを取得する。大/小アイコンハンドルの配列を取得するには ExtractIconEx を使う。(Unicode)
%prm
hInst, pszExeFileName, nIconIndex
hInst : [intptr] 型: HINSTANCE 関数を呼び出すアプリケーションのインスタンスへのハンドル。
pszExeFileName : [wstr] 型: LPCTSTR 実行ファイル、DLL、またはアイコンファイルの名前を指定する NULL 終端文字列へのポインタ。
nIconIndex : [int] 型: UINT 取得するアイコンの 0 ベースインデックス。0 なら最初のアイコンのハンドルを返す。
%inst
指定された実行ファイル、DLL、またはアイコンファイルからアイコンのハンドルを取得する。大/小アイコンハンドルの配列を取得するには
ExtractIconEx を使う。(Unicode)

[戻り値]
型: HICON 戻り値はアイコンへのハンドル。指定ファイルが実行ファイル、DLL、アイコンファイルのいずれでもない場合は
1。アイコンが見つからない場合は NULL。

[備考]
不要になったら DestroyIcon を呼んで ExtractIcon で取得したアイコンハンドルを破棄すること。shellapi.h
ヘッダは UNICODE プリプロセッサ定数に基づき ExtractIcon を ANSI/Unicode 版のエイリアスとして定義する。


%index
ExtractIconExW
ExtractIconEx 関数は、指定された実行ファイル、DLL、またはアイコンファイルから抽出された大または小アイコンへのハンドルの配列を作成する。(Unicode)
%prm
lpszFile, nIconIndex, phiconLarge, phiconSmall, nIcons
lpszFile : [wstr] 型: LPCTSTR アイコンを抽出する実行ファイル、DLL、またはアイコンファイルの名前を指定するヌル終端文字列へのポインタ。
nIconIndex : [int] 型: int 抽出する最初のアイコンの 0 起点インデックスを指定する。たとえばこの値が 0 であれば、関数は指定ファイル内の最初のアイコンを抽出する。
phiconLarge : [intptr] 型: HICON* ファイルから抽出した大アイコンへのハンドルを受け取るアイコンハンドル配列へのポインタ。このパラメータが NULL の場合、ファイルから大アイコンは抽出されない。
phiconSmall : [intptr] 型: HICON* ファイルから抽出した小アイコンへのハンドルを受け取るアイコンハンドル配列へのポインタ。このパラメータが NULL の場合、ファイルから小アイコンは抽出されない。
nIcons : [int] 型: UINT ファイルから抽出するアイコンの数。
%inst
ExtractIconEx
関数は、指定された実行ファイル、DLL、またはアイコンファイルから抽出された大または小アイコンへのハンドルの配列を作成する。(Unicode)

[戻り値]
型: **UINT** *nIconIndex* パラメータが -1 で、*phiconLarge* と *phiconSmall*
の両方が **NULL** の場合、戻り値は指定ファイル内のアイコン数となる。*nIconIndex* パラメータが -1
以外の値で、*phiconLarge* または *phiconSmall* のいずれかが **NULL**
でない場合、戻り値はファイルから正常に抽出されたアイコンの数となる。> [!NOTE] > 関数がエラーに遭遇した場合は
**UINT_MAX**
を返す。この場合、[GetLastError](../errhandlingapi/nf-errhandlingapi-getlasterror.md)
を呼び出してエラーコードを取得できる。たとえば *lpszFile* で指定されたファイルが見つからない場合に *nIconIndex*
が -1 以外で *phiconLarge* または *phiconSmall* のいずれかが **NULL** でないとき、この関数は
**UINT_MAX** を返す。この場合 **GetLastError** は
**ERROR_FILE_NOT_FOUND**（2）を返す。

[備考]
ExtractIconEx で抽出したアイコンは、不要になった時点ですべて DestroyIcon
関数を呼び出して破棄しなければならない。大アイコンと小アイコンの寸法を取得するには、SM_CXICON、SM_CYICON、SM_CXSMICON、SM_CYSMICON
フラグとともにこの関数を使用する。
> [!NOTE] > shellapi.h ヘッダは UNICODE プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または
Unicode 版を自動的に選択するエイリアスとして ExtractIconEx
を定義している。エンコーディング非依存のエイリアスとエンコーディング依存のコードを混在させるとミスマッチが生じ、コンパイルエラーや実行時エラーを引き起こす可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
FindExecutableW
特定のドキュメントファイルに関連付けられた実行可能（.exe）ファイルの名前およびハンドルを取得する。(Unicode)
%prm
lpFile, lpDirectory, lpResult
lpFile : [wstr] 型: LPCTSTR ファイル名を指定するヌル終端文字列のアドレス。このファイルはドキュメントである必要がある。
lpDirectory : [wstr] 型: LPCTSTR 既定のディレクトリを指定するヌル終端文字列のアドレス。この値は NULL でも構わない。
lpResult : [wstr] 型: LPTSTR 関連付けられた実行ファイルのファイル名を受け取るバッファのアドレス。このファイル名はヌル終端文字列であり、lpFile で指定したファイルに対して関連付けによる「open」を実行したときに起動される実行ファイルを示す。簡単に言えば、ドキュメントファイルを直接ダブルクリックしたときや、ファイルのショートカットメニューから「開く」を選択したときに起動されるアプリケーションである。このパラメータには有効で非 NULL の値が必要であり、長さは MAX_PATH と仮定される。値の検証はプログラマの責任である。
%inst
特定のドキュメントファイルに関連付けられた実行可能（.exe）ファイルの名前およびハンドルを取得する。(Unicode)

[戻り値]
型: HINSTANCE 成功した場合は 32 より大きい値、失敗した場合はエラーを表す 32 以下の値を返す。
次の表に、ありうるエラー値を示す。
（以下省略）

[備考]
ドキュメントには FindExecutable を使用すること。実行ファイルのパスを取得したい場合は、次を使用する。
（以下省略）


%index
GetCurrentProcessExplicitAppUserModelID
現在のプロセスに対するアプリケーション定義の明示的な Application User Model ID（AppUserModelID）を取得する。
%prm
AppID
AppID : [var] 型: PWSTR* プロセスに割り当てられた AppUserModelID のアドレスを受け取るポインタ。呼び出し側は、不要になった時点でこの文字列を CoTaskMemFree で解放する責任がある。
%inst
現在のプロセスに対するアプリケーション定義の明示的な Application User Model
ID（AppUserModelID）を取得する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
この関数で取得される AppUserModelID は、事前に
SetCurrentProcessExplicitAppUserModelID
で設定されたものである。アプリケーションは明示的に設定された AppUserModelID しか取得できず、システムが既定で割り当てた
AppUserModelID は取得できない。アプリケーションが自身の AppUserModelID
を必要とする場合は、明示的に設定すべきである。


%index
GetFileNameFromBrowse
GetFileNameFromBrowse 関数は、ユーザが開くファイルのドライブ、ディレクトリ、名前を指定できる「開く」ダイアログボックスを作成する。
%prm
hwnd, pszFilePath, cchFilePath, pszWorkingDir, pszDefExt, pszFilters, pszTitle
hwnd : [intptr] 型: HWND ダイアログボックスを所有するウィンドウへのハンドル。このメンバには有効なウィンドウハンドルを指定でき、ダイアログボックスにオーナーがない場合は NULL を指定できる。
pszFilePath : [wstr] 型: PWSTR ファイル名編集コントロールを初期化するために使うファイル名を含むヌル終端 Unicode 文字列。この文字列は OPENFILENAME 構造体の lpstrFile メンバに対応し、まったく同じように使われる。
cchFilePath : [int] 型: UINT pszFilePath の文字数（終端ヌル文字を含む）。
pszWorkingDir : [wstr] 型: PCWSTR 初期ディレクトリの完全修飾パス。この文字列は OPENFILENAME 構造体の lpstrInitialDir メンバに対応し、まったく同じように使われる。
pszDefExt : [wstr] 型: PCWSTR 既定のファイル名拡張子を含むヌル終端 Unicode 文字列。ユーザが拡張子を指定しない場合、この拡張子が pszFilePath に追加される。文字列に '.' を含めてはならない。この文字列が NULL でユーザが拡張子を入力しなかった場合、拡張子は付加されない。
pszFilters : [wstr] 型: PCWSTR フィルタを定義するヌル終端 Unicode 文字列。この文字列は OPENFILENAME 構造体の lpstrFilter メンバに対応し、まったく同じように使われる。
pszTitle : [wstr] 型: PCWSTR ダイアログボックスのタイトルバーに表示されるヌル終端 Unicode 文字列。この値が NULL の場合、システムは既定のタイトルを使用する。
%inst
GetFileNameFromBrowse
関数は、ユーザが開くファイルのドライブ、ディレクトリ、名前を指定できる「開く」ダイアログボックスを作成する。

[戻り値]
型: BOOL ユーザがファイル名を指定して OK をクリックした場合、戻り値は TRUE となる。pszFilePath
が指すバッファには、ユーザが指定した完全なパスとファイル名が格納される。ユーザが「開く」ダイアログボックスをキャンセル/閉じた場合、またはエラーが発生した場合は
FALSE を返す。


%index
ILAppendID
SHITEMID 構造体を ITEMIDLIST 構造体の末尾または先頭に追加する。
%prm
pidl, pmkid, fAppend
pidl : [var] 型: PIDLIST_RELATIVE ITEMIDLIST 構造体へのポインタ。関数から戻った時点で、pmkid で指定された SHITEMID 構造体が末尾または先頭に追加されている。
pmkid : [var] 型: LPSHITEMID pidl に追加または先頭挿入する SHITEMID 構造体へのポインタ。
fAppend : [int] 型: BOOL pmkid を pidl の末尾に追加するには TRUE を指定する。先頭に挿入するには FALSE を指定する。
%inst
SHITEMID 構造体を ITEMIDLIST 構造体の末尾または先頭に追加する。

[戻り値]
型: PIDLIST_RELATIVE pmkid が末尾または先頭に追加された pidl の ITEMIDLIST
構造体を返す。失敗した場合は NULL を返す。


%index
ILClone
ITEMIDLIST 構造体をクローンする。
%prm
pidl
pidl : [var] 型: PCUIDLIST_RELATIVE クローンする ITEMIDLIST 構造体へのポインタ。
%inst
ITEMIDLIST 構造体をクローンする。

[戻り値]
型: PIDLIST_RELATIVE pidl が指す ITEMIDLIST 構造体のコピーへのポインタを返す。

[備考]
クローンした ITEMIDLIST 構造体の使用が終わったら、メモリリークを防ぐために ILFree で解放すること。


%index
ILCloneFirst
ITEMIDLIST 構造体内の最初の SHITEMID 構造体をクローンする。
%prm
pidl
pidl : [var] 型: PCUIDLIST_RELATIVE クローンしたい ITEMIDLIST 構造体へのポインタ。
%inst
ITEMIDLIST 構造体内の最初の SHITEMID 構造体をクローンする。

[戻り値]
型: PITEMID_CHILD pidl が指す ITEMIDLIST 構造体の最初の SHITEMID 構造体を含む
ITEMIDLIST 構造体へのポインタ。失敗した場合は NULL を返す。


%index
ILCombine
2 つの ITEMIDLIST 構造体を結合する。
%prm
pidl1, pidl2
pidl1 : [var] 型: PCIDLIST_ABSOLUTE 1 つ目の ITEMIDLIST 構造体へのポインタ。
pidl2 : [var] 型: PCUIDLIST_RELATIVE 2 つ目の ITEMIDLIST 構造体へのポインタ。この構造体は pidl1 が指す構造体の末尾に追加される。
%inst
2 つの ITEMIDLIST 構造体を結合する。

[戻り値]
型: PIDLIST_ABSOLUTE 結合された構造体を含む ITEMIDLIST を返す。pidl1 または pidl2 のいずれかを
NULL にした場合、戻り値の ITEMIDLIST 構造体は NULL でない方のクローンになる。pidl1 と pidl2 の両方が
NULL の場合は NULL を返す。


%index
ILCreateFromPathW
ILCreateFromPathW (Unicode) 関数は、指定されたファイルパスに関連付けられた ITEMIDLIST 構造体を返す。
%prm
pszPath
pszPath : [wstr] 型: PCTSTR パスを含むヌル終端 Unicode 文字列へのポインタ。この文字列は終端ヌル文字を含めて MAX_PATH 文字以下でなければならない。
%inst
ILCreateFromPathW (Unicode) 関数は、指定されたファイルパスに関連付けられた ITEMIDLIST
構造体を返す。

[戻り値]
型: PIDLIST_ABSOLUTE 指定パスに対応する ITEMIDLIST 構造体へのポインタを返す。

[備考]
ITEMIDLIST の使用が終わったら ILFree を呼び出して解放すること。
> [!NOTE] > shlobj_core.h ヘッダは UNICODE プリプロセッサ定数の定義に基づいてこの関数の ANSI
版または Unicode 版を自動的に選択するエイリアスとして ILCreateFromPath
を定義している。エンコーディング非依存のエイリアスとエンコーディング依存のコードを混在させるとミスマッチが生じ、コンパイルエラーや実行時エラーを引き起こす可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
ILFindChild
指定した ITEMIDLIST 構造体が別の ITEMIDLIST 構造体の子であるかどうかを判定する。
%prm
pidlParent, pidlChild
pidlParent : [var] 型: PCIDLIST_ABSOLUTE 親側の ITEMIDLIST 構造体へのポインタ。
pidlChild : [var] 型: PCIDLIST_ABSOLUTE 子側の ITEMIDLIST 構造体へのポインタ。
%inst
指定した ITEMIDLIST 構造体が別の ITEMIDLIST 構造体の子であるかどうかを判定する。

[戻り値]
型: PUIDLIST_RELATIVE pidlChild が pidlParent の子である場合、その子の単純な
ITEMIDLIST 構造体へのポインタを返す。返される構造体は pidlChild から pidlParent を構成する
SHITEMID 構造体を取り除いたものである。pidlChild が pidlParent の子でない場合は NULL を返す。Note
返されるポインタは既存の親構造体内へのポインタであり、pidlChild
のエイリアスである。返されたポインタに関連して新しいメモリは確保されないため、呼び出し側で解放する必要はない。


%index
ILFindLastID
ITEMIDLIST 構造体内の最後の SHITEMID 構造体へのポインタを返す。
%prm
pidl
pidl : [var] 型: PCUIDLIST_RELATIVE ITEMIDLIST 構造体へのポインタ。
%inst
ITEMIDLIST 構造体内の最後の SHITEMID 構造体へのポインタを返す。

[戻り値]
型: PUITEMID_CHILD pidl 内の最後の SHITEMID 構造体へのポインタ。

[備考]
この関数は最後のアイテムをクローンしないため、返されたポインタを ILFree で解放する必要はない。


%index
ILFree
シェルによって確保された ITEMIDLIST 構造体を解放する。
%prm
pidl
pidl : [var] 型: PIDLIST_RELATIVE 解放する ITEMIDLIST 構造体へのポインタ。このパラメータは NULL でも構わない。
%inst
シェルによって確保された ITEMIDLIST 構造体を解放する。

[備考]
ILFree は他の IL 系関数で確保された ITEMIDLIST 構造体に対してよく使われるが、シェルが返したそうした構造体（たとえば
SHBrowseForFolder の戻り値や SHGetFolderLocation
の呼び出しで使うもの）を解放するのにも使える。Note Windows 2000 以降では ILFree ではなく
CoTaskMemFree を使うこと。これらのプラットフォームでは ITEMIDLIST 構造体は常に Component Object
Model (COM) のタスクアロケータで確保される。


%index
ILGetNext
ITEMIDLIST 構造体内の次の SHITEMID 構造体を取得する。(ILGetNext)
%prm
pidl
pidl : [var] 型: PCUIDLIST_RELATIVE 大きな ITEMIDLIST 構造体内の特定の SHITEMID 構造体へのポインタ。
%inst
ITEMIDLIST 構造体内の次の SHITEMID 構造体を取得する。(ILGetNext)

[戻り値]
型: PUIDLIST_RELATIVE pidl で指定されたものの次にある SHITEMID 構造体へのポインタを返す。pidl
が最後の SHITEMID 構造体を指している場合は NULL を返す。


%index
ILGetSize
ITEMIDLIST 構造体のサイズをバイト単位で返す。
%prm
pidl
pidl : [var] 型: PCUIDLIST_RELATIVE ITEMIDLIST 構造体へのポインタ。
%inst
ITEMIDLIST 構造体のサイズをバイト単位で返す。

[戻り値]
型: UINT pidl で指定された ITEMIDLIST 構造体のサイズ（バイト単位）。


%index
ILIsEqual
2 つの ITEMIDLIST 構造体がバイナリ比較で等しいかどうかを判定する。
%prm
pidl1, pidl2
pidl1 : [var] 型: PCIDLIST_ABSOLUTE 1 つ目の ITEMIDLIST 構造体。
pidl2 : [var] 型: PCIDLIST_ABSOLUTE 2 つ目の ITEMIDLIST 構造体。
%inst
2 つの ITEMIDLIST 構造体がバイナリ比較で等しいかどうかを判定する。

[戻り値]
型: BOOL 2 つの構造体が等しい場合は TRUE、そうでない場合は FALSE を返す。

[備考]
ILIsEqual はアイテムデータのバイナリ比較を行う。同じアイテムを参照していてもバイナリレベルで 2 つの ITEMIDLIST
構造体が異なることはありうる。バイナリでない比較を行うには IShellFolder::CompareIDs を使うこと。


%index
ILIsParent
ある ITEMIDLIST 構造体が別の ITEMIDLIST 構造体の親であるかどうかを判定する。
%prm
pidl1, pidl2, fImmediate
pidl1 : [var] 型: PCIDLIST_ABSOLUTE 親を表す ITEMIDLIST (PIDL) 構造体へのポインタ。これは絶対 PIDL でなければならない。
pidl2 : [var] 型: PCIDLIST_ABSOLUTE 子を表す ITEMIDLIST (PIDL) 構造体へのポインタ。これは絶対 PIDL でなければならない。
fImmediate : [int] 型: BOOL pidl2 の直接の親かどうかを判定するには TRUE、任意の祖先かどうかを判定するには FALSE を指定するブール値。
%inst
ある ITEMIDLIST 構造体が別の ITEMIDLIST 構造体の親であるかどうかを判定する。

[戻り値]
型: BOOL pidl1 が pidl2 の親である場合は TRUE を返す。fImmediate が TRUE の場合、関数は
pidl1 が pidl2 の直接の親である場合にのみ TRUE を返す。それ以外の場合は FALSE を返す。


%index
ILLoadFromStreamEx
この関数は変更されたり利用できなくなったりする可能性がある。
%prm
pstm, pidl
pstm : [var] 型: IStream* 絶対 ITEMIDLIST をロードする元の IStream インタフェースへのポインタ。
pidl : [var] 型: PIDLIST_ABSOLUTE* このメソッドが成功して戻る際に、結果として得られた絶対 ITEMIDLIST を格納する。失敗した場合は NULL が格納される。
%inst
この関数は変更されたり利用できなくなったりする可能性がある。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
STRICT_TYPED_ITEMIDS が定義されている場合に使用する。


%index
ILRemoveLastID
ITEMIDLIST 構造体から最後の SHITEMID 構造体を取り除く。
%prm
pidl
pidl : [var] 型: PUIDLIST_RELATIVE 短縮する ITEMIDLIST 構造体へのポインタ。関数から戻ると、この変数は短縮された構造体を指す。
%inst
ITEMIDLIST 構造体から最後の SHITEMID 構造体を取り除く。

[戻り値]
型: BOOL 成功した場合は TRUE、それ以外の場合は FALSE を返す。


%index
ILSaveToStream
ITEMIDLIST 構造体をストリームに保存する。
%prm
pstm, pidl
pstm : [var] 型: IStream * ITEMIDLIST を保存する先の IStream インタフェースへのポインタ。
pidl : [var] 型: PCUIDLIST_RELATIVE 保存する ITEMIDLIST 構造体へのポインタ。
%inst
ITEMIDLIST 構造体をストリームに保存する。

[戻り値]
型: HRESULT 成功した場合は S_OK を返し、それ以外の場合は COM のエラー値を返す。

[備考]
ストリームは書き込み用にオープンされていなければならず、そうでないと ILSaveToStream はエラーを返す。


%index
InitNetworkAddressControl
ネットワークアドレスコントロールのウィンドウクラスを初期化する。
%prm

%inst
ネットワークアドレスコントロールのウィンドウクラスを初期化する。

[戻り値]
型: BOOL 初期化に成功した場合は TRUE、そうでない場合は FALSE を返す。

[備考]

ネットワークアドレスコントロールはエディットコントロールに似た外観を持ち、ネットワークアドレスの検証機能を追加で提供する。エラーメッセージの表示にはバルーンチップを使用する。この関数はクラス
WC_NETADDRESS を初期化する。この関数が TRUE を返した場合、コントロールを生成できる。


%index
IsLFNDriveW
(no summary)
%prm
pszPath
pszPath : [wstr] 
%inst



%index
IsNetDrive
ドライブがネットワークドライブかどうかを判定する。
%prm
iDrive
iDrive : [int] 型: int 調べたいドライブ文字を示す整数。A: には 0、B: には 1 というように設定する。
%inst
ドライブがネットワークドライブかどうかを判定する。

[戻り値]
型: int この関数は次のいずれかの値を返す。
（以下省略）


%index
IsUserAnAdmin
IsUserAnAdmin は変更されたり利用できなくなったりする可能性がある。
%prm

%inst
IsUserAnAdmin は変更されたり利用できなくなったりする可能性がある。

[戻り値]
型: BOOL ユーザが Administrators グループのメンバである場合は TRUE、それ以外の場合は FALSE を返す。

[備考]
この関数は CheckTokenMembership のラッパである。Administrator
グループの状態を判定するには、IsUserAnAdmin ではなくその関数を直接呼び出すことが推奨される。


%index
OpenRegStream
OpenRegStream は変更されたり利用できなくなったりする可能性がある。代わりに SHOpenRegStream2 か SHOpenRegStream を使うこと。
%prm
hkey, pszSubkey, pszValue, grfMode
hkey : [intptr] 型: HKEY 現在開いているキーへのハンドル。
pszSubkey : [wstr] 型: PCWSTR サブキーの名前を指定するヌル終端 Unicode 文字列。
pszValue : [wstr] 型: PCWSTR アクセスする値を指定するヌル終端 Unicode 文字列。
grfMode : [int] 型: DWORD
%inst
OpenRegStream は変更されたり利用できなくなったりする可能性がある。代わりに SHOpenRegStream2 か
SHOpenRegStream を使うこと。

[戻り値]
型: IStream* 成功した場合は IStream インタフェースのアドレスを返し、そうでない場合は NULL を返す。


%index
PathCleanupSpec
PathCleanupSpec は変更されたり利用できなくなったりする可能性がある。
%prm
pszDir, pszSpec
pszDir : [wstr] 型: PCWSTR pszSpec で指定されるファイルまたはディレクトリを格納するディレクトリの完全修飾パスを含むヌル終端バッファへのポインタ。パスは終端ヌル文字を含めて MAX_PATH 文字を超えてはならない。このパスは変更されない。
pszSpec : [wstr] 型: PWSTR クリーンアップするファイルまたはディレクトリ名を含むヌル終端バッファへのポインタ。ファイルの場合は拡張子も含めること。'\' は無効文字とみなされ削除されるため、このバッファに 1 階層を超えるパスを含めることはできないことに注意。
%inst
PathCleanupSpec は変更されたり利用できなくなったりする可能性がある。

[戻り値]
型: int 次のうち 1 つ以上の値を返す。
（以下省略）

[備考]
次の文字はすべての名前で無効とみなされる。
（以下省略）


%index
PathGetShortPath
PathGetShortPath は変更されたり利用できなくなったりする可能性がある。
%prm
pszLongPath
pszLongPath : [wstr] 型: PWSTR 長いパスを含むヌル終端 Unicode 文字列へのポインタ。関数から戻ると、対応する短いパスが格納される。
%inst
PathGetShortPath は変更されたり利用できなくなったりする可能性がある。


%index
PathIsExe
PathIsExe は変更されたり利用できなくなったりする可能性がある。
%prm
pszPath
pszPath : [wstr] 型: PCWSTR ファイル名を含むファイルパスを格納したヌル終端 Unicode 文字列へのポインタ。
%inst
PathIsExe は変更されたり利用できなくなったりする可能性がある。

[戻り値]
型: BOOL ファイル名の拡張子が .cmd、.bat、.pif、.scf、.exe、.com、.scr のいずれかの場合は
TRUE、それ以外は FALSE を返す。


%index
PathIsSlowW
PathIsSlow は変更されたり利用できなくなったりする可能性がある。(Unicode)
%prm
pszFile, dwAttr
pszFile : [wstr] 型: LPCTSTR ファイルの完全修飾パスを含むヌル終端文字列へのポインタ。
dwAttr : [int] 型: DWORD ファイル属性が分かっている場合はそれを指定する。分からない場合は ?1 を渡すと、関数が GetFileAttributes を呼び出して属性を取得する。ファイル属性の一覧は GetFileAttributes を参照。
%inst
PathIsSlow は変更されたり利用できなくなったりする可能性がある。(Unicode)

[戻り値]
型: BOOL 接続が高遅延の場合は TRUE、それ以外は FALSE を返す。

[備考]
MultinetGetConnectionPerformance 関数の NETCONNECTINFOSTRUCT 構造体内
dwSpeed が 400 以下を返した場合（これはネットワークリソースまでのメディアの速度で、100 bps
単位）、または対象ファイルに FILE_ATTRIBUTE_OFFLINE
が設定されている場合、そのパスは「遅い」とみなされる。なおネットワーク状況は関数のパフォーマンスに影響することに注意。
> [!NOTE] > shlobj.h ヘッダは UNICODE プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または
Unicode 版を自動的に選択するエイリアスとして PathIsSlow
を定義している。エンコーディング非依存のエイリアスとエンコーディング依存のコードを混在させるとミスマッチが生じ、コンパイルエラーや実行時エラーを引き起こす可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
PathMakeUniqueName
テンプレートから一意なパス名を生成する。
%prm
pszUniqueName, cchMax, pszTemplate, pszLongPlate, pszDir
pszUniqueName : [wstr] 型: PWSTR 一意なパス名を含むヌル終端 Unicode 文字列を受け取るバッファ。少なくとも MAX_PATH 文字の長さが必要である。
cchMax : [int] 型: UINT pszUniqueName が指すバッファの文字数。
pszTemplate : [wstr] 型: PCWSTR 一意な名前の構築に使うテンプレートを含むヌル終端 Unicode 文字列。8.3 形式のファイル名を要求するドライブで使用される。終端ヌル文字を含めて MAX_PATH 文字以下でなければならない。
pszLongPlate : [wstr] 型: PCWSTR 一意な名前の構築に使うテンプレートを含むヌル終端 Unicode 文字列。長いファイル名をサポートするドライブで使用される。終端ヌル文字を含めて MAX_PATH 文字以下でなければならない。
pszDir : [wstr] 型: PCWSTR 新規ファイルが置かれるディレクトリを含むヌル終端文字列。終端ヌル文字を含めて MAX_PATH 文字以下でなければならない。
%inst
テンプレートから一意なパス名を生成する。

[戻り値]
型: BOOL 成功した場合は TRUE、それ以外の場合は FALSE を返す。

[備考]
この関数は、8.3 形式を要求するドライブには pszTemplate、長いファイル名をサポートするドライブには pszLongPlate
で指定したテンプレートを基に新しい一意なファイル名を生成する。たとえば pszLongPlate に "My New Filename"
を指定すると、PathMakeUniqueName は "My New Filename (1)"、"My New Filename
(2)" のような名前を返す。


%index
PathQualify
(no summary)
%prm
psz
psz : [wstr] 
%inst



%index
PathResolve
PathResolve は変更されたり利用できなくなったりする可能性がある。
%prm
pszPath, dirs, fFlags
pszPath : [wstr] 型: PWSTR 解決対象のパスを含むヌル終端 Unicode 文字列。関数から戻ると、対応する完全修飾パスが格納される。このバッファは少なくとも MAX_PATH 文字の長さが必要である。
dirs : [var] 型: PZPCWSTR pszPath からパスを解決できなかった場合に最初に検索するディレクトリの、省略可能なヌル終端配列へのポインタ。この値は NULL でも構わない。
fFlags : [int] 型: UINT 関数の動作を指定するフラグ。
%inst
PathResolve は変更されたり利用できなくなったりする可能性がある。

[戻り値]
型: int PRF_VERIFYEXISTS が設定されていない限り TRUE
を返す。そのフラグが設定されている場合、ファイルの存在が確認できれば TRUE、確認できなければ FALSE を返す。同時に
GetLastError で取得できる ERROR_FILE_NOT_FOUND エラーコードを設定する。

[備考]
FALSE
が返ってきたとしても、必ずしもファイルが存在しないことを意味するわけではない。与えられた情報からはファイルを単に見つけられなかっただけかもしれない。PathResolve
が pszPath で指定されたパスを解決できない場合、pszPath と dirs をパラメータとして PathFindOnPath
を呼び出す。


%index
PathYetAnotherMakeUniqueName
既存のファイル名を基に一意なファイル名を生成する。
%prm
pszUniqueName, pszPath, pszShort, pszFileSpec
pszUniqueName : [wstr] 型: PWSTR 一意なファイル名の完全修飾パスを含むヌル終端 Unicode 文字列を受け取る文字列バッファ。バッファオーバーランを避けるため、少なくとも MAX_PATH 文字の長さが必要である。
pszPath : [wstr] 型: PCWSTR 新規ファイルを格納するフォルダの完全修飾パスを含むヌル終端 Unicode 文字列。pszShort が NULL の場合、この文字列には新ファイル名の元となる長いファイル名で終わる完全な宛先パスを含めなければならない。
pszShort : [wstr] 型: PCWSTR 一意な名前の元になる短いファイル名を含むヌル終端 Unicode 文字列。長いファイル名を基に名前を作成する場合はこの値を NULL に設定する。
pszFileSpec : [wstr] 型: PCWSTR 一意な名前の元になる長いファイル名を含むヌル終端 Unicode 文字列。
%inst
既存のファイル名を基に一意なファイル名を生成する。

[戻り値]
型: BOOL 一意な名前の作成に成功した場合は TRUE、それ以外の場合は FALSE を返す。

[備考]
生成されたパスが MAX_PATH 文字を超える場合、PathYetAnotherMakeUniqueName
は切り詰められた文字列を返す可能性がある。その場合は FALSE を返す。


%index
PickIconDlg
PickIconDlg は変更されたり利用できなくなったりする可能性がある。
%prm
hwnd, pszIconPath, cchIconPath, piIconIndex
hwnd : [intptr] 型: HWND 親ウィンドウのハンドル。この値は NULL でも構わない。
pszIconPath : [wstr] 型: PWSTR アイコンを含む既定リソースの完全修飾パスを格納したヌル終端文字列へのポインタ。ユーザがダイアログで別のリソースを選択した場合、関数から戻った時点でこのバッファにそのファイルのパスが格納される。返されるパスが切り詰められないよう、少なくとも MAX_PATH 文字の長さが必要である。使用前にパスが有効であることを確認すること。
cchIconPath : [int] 型: UINT pszIconPath の文字数（終端 NULL 文字を含む）。
piIconIndex : [var] 型: int* 整数へのポインタ。入力時は初期選択のインデックスを指定し、関数が成功して戻る際には選択されたアイコンのインデックスを受け取る。
%inst
PickIconDlg は変更されたり利用できなくなったりする可能性がある。

[戻り値]
型: int 成功した場合は 1、それ以外の場合は 0 を返す。


%index
PifMgr_CloseProperties
PifMgr_OpenProperties で開いたアプリケーションプロパティを閉じる。
%prm
hProps, flOpt
hProps : [intptr] 型: HANDLE アプリケーションのプロパティへのハンドル。このパラメータには PifMgr_OpenProperties が返した値を設定する。
flOpt : [int] 型: UINT 関数の動作を指定するフラグ。
%inst
PifMgr_OpenProperties で開いたアプリケーションプロパティを閉じる。

[戻り値]
型: int 成功した場合は NULL を返す。失敗した場合は、hProps として渡されたアプリケーションプロパティのハンドルを返す。


%index
PifMgr_GetProperties
指定された .pif ファイルからデータブロックを返す。
%prm
hProps, pszGroup, lpProps, cbProps, flOpt
hProps : [intptr] 型: HANDLE アプリケーションのプロパティへのハンドル。このパラメータには PifMgr_OpenProperties が返した値を設定する。
pszGroup : [str] 型: PCSTR プロパティグループ名を含むヌル終端文字列。次のいずれか、または有効な .pif 拡張子に対応する任意の名前を指定できる。
lpProps : [intptr] 型: void* この関数から戻る際に、PROPPRG 構造体へのポインタを格納する。
cbProps : [int] 型: int lpProps が指すバッファのサイズ（バイト単位）。
flOpt : [int] 型: UINT このパラメータは GETPROPS_NONE に設定する。
%inst
指定された .pif ファイルからデータブロックを返す。

[戻り値]
型: int 成功した場合は NULL を返す。失敗した場合は、hProps として渡されたアプリケーションプロパティのハンドルを返す。

[備考]
ブロックが「名前付き」ブロックの場合、それは .pif
ファイル内のリンクされた拡張子の名前でなければならない。これは事前定義された名前（例："WINDOWS 386
3.0"）でも、独自のブロック名でも構わない。独自の名前付きデータブロックは PifMgr_SetProperties
で作成できる。名前付きデータは生データとも考えられ、変換されずにそのまま呼び出し側アプリケーションへ返される。名前付きブロックのサイズは
cbProps を 0 にして PifMgr_GetProperties
を呼び出すことで取得できる。データはコピーされず、要求されたブロックのサイズだけが返される。すべての名前付きブロックは pszGroup
を NULL にすることで列挙できる。lpProps は要求するブロック名を格納する 16
バイトのバッファへのポインタでなければならず、cbProps には 0
起点のブロックインデックスを設定する必要がある。戻り値はブロックのサイズで、ブロックが見つからなければ 0
となる。名前パラメータのセレクタを NULL
に設定して名前なしプロパティブロックを要求し、オフセットがプロパティグループの序数である場合、関連付けられた構造体が返される。たとえば
PifMgr_GetProperties(GROUP_TSK) は、すべてのタスク関連情報を .pif
ファイルから独立した形式で含む事前定義された構造体を返す。これは、必要なのは 1 つのセクションだけなのに多種多様なセクション（.pif
拡張子と呼ばれる）を含む .pif ファイルを呼び出し側アプリケーションが直接扱わずに済むようにするための便利なサービスである。


%index
PifMgr_OpenProperties
Microsoft MS-DOS アプリケーションに関連付けられた .pif ファイルを開き、そのアプリケーションのプロパティへのハンドルを返す。
%prm
pszApp, pszPIF, hInf, flOpt
pszApp : [wstr] 型: PCWSTR アプリケーション名を含むヌル終端 Unicode 文字列。
pszPIF : [wstr] 型: PCWSTR .pif ファイル名を含むヌル終端 Unicode 文字列。
hInf : [int] 型: UINT アプリケーションの .inf ファイルへのハンドル。.inf ファイルがない場合はゼロを設定する。.inf ファイルを処理しないようにするには -1 を設定する。
flOpt : [int] 型: UINT 関数の動作を制御するフラグ。
%inst
Microsoft MS-DOS アプリケーションに関連付けられた .pif
ファイルを開き、そのアプリケーションのプロパティへのハンドルを返す。

[戻り値]
型: HANDLE アプリケーションのプロパティへのハンドルを返す。関連する .pif 関数を呼び出すときにこのハンドルを使用する。

[備考]
PifMgr_OpenProperties はどこかのファイルを開く関数だと考えるべきではない。.pif
ファイルはこの呼び出しの後も開かれたままにはならない。むしろ、ディスク上のデータで初期化できるプロパティ構造体のアロケータと考える方が役に立つ。この関数が失敗する主な理由は、メモリ不足か、指定された
.pif ファイルを開けないことである。.pif
ファイルが存在しない場合でも、関数はメモリ上にデータブロックを確保し、_Default.pif
または内部既定値からのデータでそれを初期化する。関数が .pif ファイル名を探しても見つからない場合は名前を構築し、内部の .pif
データ構造体に保存する。これにより、PifMgr_SetProperties
が呼ばれた際にデータがディスクに保存されることが保証される。.pif ファイルが見つからない場合、関数は次の順序で検索する。
（以下省略）


%index
PifMgr_SetProperties
値を .pif ファイル内のデータブロックに割り当てる。
%prm
hProps, pszGroup, lpProps, cbProps, flOpt
hProps : [intptr] 型: HANDLE アプリケーションのプロパティへのハンドル。このパラメータには PifMgr_OpenProperties が返した値を設定する。
pszGroup : [str] 型: PCSTR プロパティグループ名を含むヌル終端 ANSI 文字列。次のいずれか、または有効な .pif 拡張子に対応する任意の名前を指定できる。
lpProps : [intptr] 型: const void* データを保持するプロパティグループレコードバッファ。
cbProps : [int] 型: int lpProps が指すバッファのサイズ（バイト単位）。
flOpt : [int] 型: UINT 常に SETPROPS_NONE。
%inst
値を .pif ファイル内のデータブロックに割り当てる。

[戻り値]
型: int 転送された情報量をバイト単位で返す。グループが見つからない場合やエラーが発生した場合はゼロを返す。


%index
ReadCabinetState
ReadCabinetState は変更されたり利用できなくなったりする可能性がある。
%prm
pcs, cLength
pcs : [var] 型: CABINETSTATE* この関数から戻る際に、レジストリから取得した情報または既定情報のいずれかを含む CABINETSTATE 構造体へのポインタ。
cLength : [int] 型: int pcs が指す構造体のサイズ（バイト単位）。
%inst
ReadCabinetState は変更されたり利用できなくなったりする可能性がある。

[戻り値]
型: BOOL 返された構造体にレジストリの情報が含まれている場合は TRUE を返す。既定情報が含まれている場合は FALSE を返す。


%index
RealDriveType
RealDriveType は変更されたり利用できなくなったりする可能性がある。
%prm
iDrive, fOKToHitNet
iDrive : [int] 型: int 調べたいドライブの番号。"A:" は 0、"B:" は 1、というように対応する。
fOKToHitNet : [int] 型: BOOL 予約。0 を設定しなければならない。
%inst
RealDriveType は変更されたり利用できなくなったりする可能性がある。

[戻り値]
型: int 次のいずれかの値を返す。
（以下省略）


%index
RestartDialog
ユーザに Windows の再起動を促すダイアログボックスを表示する。ユーザがボタンをクリックすると、関数は ExitWindowsEx を呼び出して Windows の再起動を試みる。
%prm
hwnd, pszPrompt, dwReturn
hwnd : [intptr] 型: HWND 親ウィンドウへのハンドル。
pszPrompt : [wstr] 型: PCWSTR ユーザに表示するダイアログボックス内のテキストを含むヌル終端 Unicode 文字列。
dwReturn : [int] 型: DWORD シャットダウンの種類を指定するフラグ。
%inst
ユーザに Windows の再起動を促すダイアログボックスを表示する。ユーザがボタンをクリックすると、関数は ExitWindowsEx
を呼び出して Windows の再起動を試みる。

[戻り値]
型: int ダイアログボックスを閉じるために押されたボタンの識別子を返す。


%index
RestartDialogEx
ユーザに Windows の再起動を求めるダイアログボックスを表示する。ユーザがボタンをクリックすると、関数は ExitWindowsEx を呼び出して Windows の再起動を試みる。
%prm
hwnd, pszPrompt, dwReturn, dwReasonCode
hwnd : [intptr] 型: HWND 親ウィンドウへのハンドル。
pszPrompt : [wstr] 型: PCWSTR ユーザに表示するダイアログボックス内のテキストを含むヌル終端文字列。
dwReturn : [int] 型: DWORD シャットダウンの種類を指定するフラグ。
dwReasonCode : [int] 型: DWORD Windows XP: シャットダウンを開始する理由を指定する。詳細は「System Shutdown Reason Codes」を参照。
%inst
ユーザに Windows の再起動を求めるダイアログボックスを表示する。ユーザがボタンをクリックすると、関数は ExitWindowsEx
を呼び出して Windows の再起動を試みる。

[戻り値]
型: int ダイアログボックスを閉じるために押されたボタンの識別子を返す。


%index
SHAddDefaultPropertiesByExt
指定したファイル拡張子に対して登録されている既定プロパティをプロパティストアに追加する。
%prm
pszExt, pPropStore
pszExt : [wstr] 型: PCWSTR 拡張子を指定するヌル終端 Unicode 文字列へのポインタ。
pPropStore : [var] 型: IPropertyStore* 追加する既定プロパティを定義する IPropertyStore インタフェースへのポインタ。
%inst
指定したファイル拡張子に対して登録されている既定プロパティをプロパティストアに追加する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
既定値の設定に使用するプロパティのリストは、指定したファイル拡張子に関連付けられた ProgID の SetDefaultsFor
レジストリ値から取得される。リストは "prop:" で始まり、既定値を設定するプロパティの正規名（たとえば
"prop:System.Author;System.Document.DateCreated"）を含む。このリストに指定可能なプロパティは
System.Author、System.Document.DateCreated、System.Photo.DateTaken
である。SetDefaultsFor 値が ProgID 上に存在しない場合、この関数は HKEY_CLASSES_ROOT\* の
SetDefaultsFor 値で見つかった既定値を使う。System.Author
にはアクションを実行したユーザの値が、System.Document.DateCreated と
System.Photo.DateTaken には現在の日付が入る。これら 3
つはシステムが特別な既定値を提供する唯一のプロパティである。プロパティにはいくつかの種類があることに注意。
（以下省略）


%index
SHDestroyPropSheetExtArray
SHCreatePropSheetExtArray によって作成された配列が指すプロパティシートハンドラーを解放する。
%prm
hpsxa
hpsxa : [intptr] 型: HPSXA 破棄するプロパティシートハンドラーへのポインターを格納している配列のハンドル。
%inst
SHCreatePropSheetExtArray によって作成された配列が指すプロパティシートハンドラーを解放する。


%index
SHAddFromPropSheetExtArray
SHCreatePropSheetExtArray で作成されたプロパティシート拡張配列にページを追加する。
%prm
hpsxa, lpfnAddPage, lParam
hpsxa : [intptr] 型: HPSXA SHCreatePropSheetExtArray が返したプロパティシートハンドラの配列。
lpfnAddPage : [int] 型: LPFNADDPROPSHEETPAGE AddPropSheetPageProc コールバック関数へのポインタ。各プロパティシートハンドラごとに 1 度ずつ呼び出される。コールバック関数はその後、ハンドラのプロパティシートにページを追加するのに必要な情報を返す。
lParam : [intptr] 型: LPARAM アプリケーション定義のデータへのポインタ。このデータは lpfnAddPage で指定されたコールバック関数に渡される。
%inst
SHCreatePropSheetExtArray で作成されたプロパティシート拡張配列にページを追加する。

[戻り値]
型: UINT 実際に追加されたページ数を返す。

[備考]
この関数は hpsxa で指定されたプロパティシート拡張配列に対して 1 度だけ呼び出すこと。この関数は各拡張の
IShellPropSheetExt::AddPages メソッドを呼び出す。詳細はそのページを参照。


%index
SHAddToRecentDocs
最近使用したアイテムや最も頻繁に使用したアイテムを追跡する目的で、アイテムがアクセスされたことをシステムに通知する。この関数はすべての使用状況データを消去するためにも使用できる。
%prm
uFlags, pv
uFlags : [int] 型: UINT pv パラメータが指す情報の形式を示す SHARD 列挙体の値。
pv : [intptr] 型: LPCVOID アクセスされたアイテムを識別するデータへのポインタ。アイテムは次のいずれかの形式でこのパラメータに指定できる。
%inst

最近使用したアイテムや最も頻繁に使用したアイテムを追跡する目的で、アイテムがアクセスされたことをシステムに通知する。この関数はすべての使用状況データを消去するためにも使用できる。

[備考]

このメソッドの呼び出しを通じて収集された使用状況統計は、最近使用したアイテムや最も頻繁に使用したアイテムの一覧を決定するために使われる。これらの一覧はスタートメニューや、Windows
7 以降ではアプリケーションのジャンプリストに表示される。このメソッドが呼ばれると、次の領域に影響する。
（以下省略）


%index
SHAlloc
シェルのヒープからメモリを確保する。
%prm
cb
cb : [int] 型: SIZE_T 確保するメモリのバイト数。
%inst
シェルのヒープからメモリを確保する。

[戻り値]
型: LPVOID 確保したメモリへのポインタ。

[備考]
このメモリは SHFree を呼び出して解放できる。


%index
SHAssocEnumHandlers
指定されたファイル名拡張子ハンドラの集合に対する列挙オブジェクトを返す。
%prm
pszExtra, afFilter, ppEnumHandler
pszExtra : [wstr] 型: PCWSTR 単一のファイル種別拡張子（たとえば ".jpg"）を含むヌル終端バッファへのポインタ。指定された拡張子に関連付けられたハンドラのみが列挙される。このパラメータを **NULL** にすることはできない。
afFilter : [int] 型: ASSOC_FILTER
ppEnumHandler : [var] 型: IEnumAssocHandlers** このメソッドから戻る際に、IEnumAssocHandlers オブジェクトへのポインタのアドレスを格納する。
%inst
指定されたファイル名拡張子ハンドラの集合に対する列挙オブジェクトを返す。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
SHAssocEnumHandlersForProtocolByApplication
指定されたプロトコルに関連付けられたハンドラへアクセスするための列挙インタフェースを取得する。
%prm
protocol, riid, enumHandlers
protocol : [wstr] 型: PCWSTR プロトコルを指定する文字列へのポインタ。
riid : [var] 型: REFIID enumHandlers を通じて取得するインタフェースの IID への参照。通常は IID_IEnumAssocHandlers である。
enumHandlers : [var] 型: void** このメソッドから戻る際に、riid で要求されたインタフェースポインタを格納する。通常は IEnumAssocHandlers である。
%inst
指定されたプロトコルに関連付けられたハンドラへアクセスするための列挙インタフェースを取得する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
Objbase.h で定義されている IID_PPV_ARGS マクロを使って riid と enumHandlers
のパラメータをまとめることが推奨される。このマクロは enumHandlers の値が指すインタフェースに基づいて正しい IID
を提供するため、コーディングミスの可能性を排除できる。


%index
SHBindToFolderIDListParent
フォルダ形式で指定されたシェル名前空間アイテムと、そのフォルダを基準としたアイテム識別子リストを与えると、この関数は名前空間アイテムの親にバインドし、必要に応じてアイテム識別子リストの最終要素へのポインタを返す。
%prm
psfRoot, pidl, riid, ppv, ppidlLast
psfRoot : [var] 型: IShellFolder* シェルフォルダオブジェクトへのポインタ。psfRoot が NULL の場合、渡された IDList はデスクトップを基準とすることを示す。
pidl : [var] 型: PCUIDLIST_RELATIVE psfRoot を基準としてバインド対象とする PIDL。psfRoot が NULL の場合、これはデスクトップフォルダを基準とする絶対 IDList である。
riid : [var] 型: REFIID 目的のインタフェース ID への参照。通常は IID_IShellFolder または IID_IShellFolder2 だが、対象フォルダがサポートする任意のものでよい。
ppv : [var] 型: void** この関数から戻る際に、riid で要求されたインタフェースポインタを格納する。通常は IShellFolder または IShellFolder2 だが、対象フォルダがサポートする任意のものでよい。
ppidlLast : [var] 型: PCUITEMID_CHILD* pidl パラメータの最後の ID へのポインタで、ppv に返される親フォルダを基準とした子 ID である。この値は NULL でも構わない。
%inst

フォルダ形式で指定されたシェル名前空間アイテムと、そのフォルダを基準としたアイテム識別子リストを与えると、この関数は名前空間アイテムの親にバインドし、必要に応じてアイテム識別子リストの最終要素へのポインタを返す。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
Note SHBindToFolderIDListParent 関数の呼び出しは、バインドコンテキストとして NULL を指定して
SHBindToFolderIDListParentEx 関数を呼び出すのと等価である。


%index
SHBindToFolderIDListParentEx
呼び出し側がバインドコンテキストを指定できるようにすることで SHBindToFolderIDListParent 関数を拡張する。
%prm
psfRoot, pidl, ppbc, riid, ppv, ppidlLast
psfRoot : [var] 型: IShellFolder* シェルフォルダオブジェクトへのポインタ。psfRoot が NULL の場合、渡された IDList はデスクトップを基準とすることを示す。
pidl : [var] 型: PCUIDLIST_RELATIVE psfRoot を基準としてバインド対象とする PIDL。psfRoot が NULL の場合、これはデスクトップフォルダを基準とする絶対 IDList である。
ppbc : [var] 型: IBindCtx* この操作中に使用するバインドコンテキストオブジェクトの IBindCtx インタフェースへのポインタ。このパラメータを使用しない場合は NULL に設定し、それは SHBindToFolderIDListParent 関数を呼び出すのと等価である。pbc のサポートはフォルダオブジェクト実装ではオプションのため、フォルダによってはバインドコンテキストの使用をサポートしないことがある。
riid : [var] 型: REFIID 目的のインタフェース ID への参照。通常は IID_IShellFolder または IID_IShellFolder2 だが、対象フォルダがサポートする任意のものでよい。
ppv : [var] 型: void** この関数から戻る際に、riid で要求されたインタフェースポインタを格納する。通常は IShellFolder または IShellFolder2 だが、対象フォルダがサポートする任意のものでよい。
ppidlLast : [var] 型: PCUITEMID_CHILD* pidl パラメータの最後の ID へのポインタで、ppv に返される親フォルダを基準とした子 ID である。この値は NULL でも構わない。
%inst
呼び出し側がバインドコンテキストを指定できるようにすることで SHBindToFolderIDListParent 関数を拡張する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
SHBindToObject
シェル名前空間の IShellFolder::BindToObject メソッドを使って、指定したオブジェクトを取得してバインドする。
%prm
psf, pidl, pbc, riid, ppv
psf : [var] 型: IShellFolder* IShellFolder へのポインタ。このパラメータは NULL でも構わない。psf が NULL の場合、これは pidl がデスクトップを基準とすることを示す。この場合、pidl は絶対 ITEMIDLIST を指定しなければならない。
pidl : [var] 型: PCUIDLIST_RELATIVE psf を基準としてバインドする定数 ITEMIDLIST へのポインタ。psf が NULL の場合、これはデスクトップフォルダを基準とする絶対 ITEMIDLIST である。
pbc : [var] 型: IBindCtx* この操作中に使用するバインドコンテキストオブジェクトの IBindCtx インタフェースへのポインタ。このパラメータを使用しない場合は NULL に設定する。pbc のサポートはフォルダオブジェクト実装ではオプションのため、フォルダによってはバインドコンテキストの使用をサポートしないことがある。
riid : [var] 型: REFIID 返すインタフェースの識別子。
ppv : [var] 型: void** このメソッドから戻る際に、バインド先オブジェクトの、riid で指定したインタフェースポインタを格納する。エラーが発生した場合は NULL ポインタを格納する。
%inst
シェル名前空間の IShellFolder::BindToObject メソッドを使って、指定したオブジェクトを取得してバインドする。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
Note これは SHGetDesktopFolder を呼び出してデスクトップオブジェクトを取得するヘルパ関数である。


%index
SHBindToParent
完全修飾アイテム識別子リスト (PIDL) へのポインタを受け取り、親オブジェクト上の指定されたインタフェースポインタを返す。
%prm
pidl, riid, ppv, ppidlLast
pidl : [var] 型: PCIDLIST_ABSOLUTE アイテムの PIDL。
riid : [var] 型: REFIID アイテムの親オブジェクトが公開するインタフェースのいずれかの REFIID。
ppv : [var] 型: VOID** riid で指定したインタフェースへのポインタ。使い終わったらオブジェクトを解放しなければならない。
ppidlLast : [var] 型: PCUITEMID_CHILD* 親フォルダを基準としたアイテムの PIDL。この PIDL は親フォルダのインタフェースがサポートする多くのメソッドで利用できる。ppidlLast を NULL に設定すると PIDL は返されない。
%inst
完全修飾アイテム識別子リスト (PIDL) へのポインタを受け取り、親オブジェクト上の指定されたインタフェースポインタを返す。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
SHBrowseForFolderW
ユーザが Shell フォルダを選択できるダイアログボックスを表示する。(Unicode)
%prm
lpbi
lpbi : [var] 型: LPBROWSEINFO ダイアログボックスの表示に使用する情報を含む BROWSEINFO 構造体へのポインタ。
%inst
ユーザが Shell フォルダを選択できるダイアログボックスを表示する。(Unicode)

[戻り値]
型: PIDLIST_ABSOLUTE 名前空間のルートからの選択フォルダの位置を指定する PIDL
を返す。ユーザがキャンセルボタンを押した場合は NULL。
返される PIDL はフォルダ自体ではなくフォルダショートカットの場合があることに注意。

[備考]
Windows Vista 以降では SHBrowseForFolder ではなく IFileDialog を
FOS_PICKFOLDERS オプションで使うことが推奨される。SHBrowseForFolder を呼び出す前に COM
を初期化する必要がある。CoInitializeEx で初期化する場合、dwCoInit に
COINIT_APARTMENTTHREADED を設定する。COINIT_MULTITHREADED で初期化した COM で
BIF_USENEWUI や BIF_NEWDIALOGSTYLE を使うと失敗する。返される IDList は
CoTaskMemFree で解放する。
（以下省略）


%index
SHCLSIDFromString
クラス識別子 (CLSID) の文字列形式を受け取り、対応する CLSID を生成する。
%prm
psz, pclsid
psz : [wstr] 型: PCWSTR {xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx} の形式で CLSID を含む Unicode 文字列。
pclsid : [var] 型: CLSID* 関数が成功して戻る際に、変換された文字列を CLSID として受け取る CLSID 値へのポインタ。
%inst
クラス識別子 (CLSID) の文字列形式を受け取り、対応する CLSID を生成する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
SHChangeNotification_Lock
シェル変更通知イベントに関連付けられた共有メモリをロックする。
%prm
hChange, dwProcId, pppidl, plEvent
hChange : [intptr] 型: HANDLE 指定されたシェル変更通知メッセージ内に wParam として受け取ったウィンドウへのハンドル。
dwProcId : [int] 型: DWORD プロセス ID（メッセージコールバックの lParam）。
pppidl : [var] 型: PIDLIST_ABSOLUTE** 関数が成功して戻る際に、影響を受けた PIDL のリストを受け取る PIDLIST_ABSOLUTE へのポインタのアドレス。
plEvent : [var] 型: LONG* 関数が成功して戻る際に、発生したイベントのシェル変更通知 ID を受け取る LONG 値へのポインタ。
%inst
シェル変更通知イベントに関連付けられた共有メモリをロックする。

[戻り値]
型: HANDLE ロックされたメモリへのハンドル (HLOCK) を返す。完了時にこの値を
SHChangeNotification_Unlock に渡す。


%index
SHChangeNotification_Unlock
変更通知のための共有メモリのロックを解除する。
%prm
hLock
hLock : [intptr] 型: HANDLE メモリロックへのハンドル。これは SHChangeNotification_Lock がメモリをロックした際に返したハンドルである。
%inst
変更通知のための共有メモリのロックを解除する。

[戻り値]
型: BOOL 成功した場合は TRUE、それ以外の場合は FALSE を返す。


%index
SHChangeNotify
アプリケーションが実行したイベントをシステムに通知する。Shell に影響する可能性があるアクションを実行した場合に使用すべき。
%prm
wEventId, uFlags, dwItem1, dwItem2
wEventId : [int] 型: LONG
uFlags : [int] 型: UINT
dwItem1 : [intptr] 型: LPCVOID オプション。イベント依存の 1 番目の値。
dwItem2 : [intptr] 型: LPCVOID オプション。イベント依存の 2 番目の値。
%inst
アプリケーションが実行したイベントをシステムに通知する。Shell に影響する可能性があるアクションを実行した場合に使用すべき。

[備考]
新しいハンドラを登録するアプリケーションは SHCNE_ASSOCCHANGED フラグで SHChangeNotify
を呼び、Shell
にアイコンとサムネイルキャッシュの無効化を指示しなければならない。アイコンオーバーレイハンドラは再ロードされない。dwItem1 と
dwItem2 が指す文字列は ANSI または Unicode のいずれか。


%index
SHChangeNotifyDeregister
クライアントのウィンドウプロセスを SHChangeNotify メッセージの受信から登録解除する。
%prm
ulID
ulID : [int] 型: ULONG SHChangeNotifyRegister が返した登録 ID を指定する ULONG 型の値。
%inst
クライアントのウィンドウプロセスを SHChangeNotify メッセージの受信から登録解除する。

[戻り値]
型: BOOL 指定されたクライアントが見つかって除去された場合は TRUE、それ以外の場合は FALSE を返す。

[備考]
この関数の使い方の完全な例については、Windows Software Development Kit (SDK) の Change
Notify Watcher Sample を参照。Windows Vista 以降では使用できない
NTSHChangeNotifyDeregister 関数は SHChangeNotifyDeregister と等価であった。


%index
SHChangeNotifyRegister
ファイルシステムが通知をサポートしている場合、ファイルシステムやシェルから通知を受け取るウィンドウを登録する。
%prm
hwnd, fSources, fEvents, wMsg, cEntries, pshcne
hwnd : [intptr] 型: HWND 変更や通知メッセージを受け取るウィンドウへのハンドル。
fSources : [int] 型: int
fEvents : [int] 型: LONG 通知を受け取る変更通知イベント。指定可能な値は SHChangeNotify に列挙されている SHCNE フラグを参照。
wMsg : [int] 型: UINT ウィンドウプロシージャに通知するメッセージ。
cEntries : [int] 型: int pshcne 配列内のエントリ数。
pshcne : [var] 型: const SHChangeNotifyEntry* 通知を含む SHChangeNotifyEntry 構造体の配列。SHChangeNotifyRegister や SHChangeNotifyDeregister を呼び出す際、この配列は常に 1 に設定する必要があり、そうしないと正しく動作しない。
%inst
ファイルシステムが通知をサポートしている場合、ファイルシステムやシェルから通知を受け取るウィンドウを登録する。

[戻り値]
型: ULONG 正の整数の登録 ID を返す。メモリ不足や無効なパラメータの場合は 0 を返す。

[備考]
この関数の使い方の完全な例については、Windows Software Development Kit (SDK) の Change
Notify Watcher Sample を参照。変更通知イベントが発生すると、wMsg で指定されたメッセージが hwnd
パラメータで指定されたウィンドウに配信される。
（以下省略）


%index
SHChangeNotifyRegisterThread
スレッドの非同期登録および登録解除を有効にする。
%prm
status
status : [int] 型: SCNRT_STATUS スレッドを登録するために関数を使うのか登録解除するために使うのかを示す。SCNRT_STATUS のいずれかの値。
%inst
スレッドの非同期登録および登録解除を有効にする。


%index
SHCloneSpecialIDList
SHCloneSpecialIDList は変更されたり利用できなくなったりする可能性がある。代わりに SHGetSpecialFolderLocation を使うこと。
%prm
hwnd, csidl, fCreate
hwnd : [intptr] 型: HWND 予約。
csidl : [int] 型: int 対象となるフォルダを示す CSIDL 値。
fCreate : [int] 型: BOOL フォルダがまだ存在しない場合に作成するかどうかを示す BOOL 型の値。fCreate が TRUE の場合フォルダが作成され、FALSE の場合は作成されない。
%inst
SHCloneSpecialIDList は変更されたり利用できなくなったりする可能性がある。代わりに
SHGetSpecialFolderLocation を使うこと。

[戻り値]
型: PIDLIST_ABSOLUTE csidl で指定された特殊フォルダの ITEMIDLIST
構造体へのポインタを返す。fCreate が TRUE の場合、関数はフォルダを作成する。

[備考]
クローンしたフォルダへのポインタは、使い終わったら ILFree で解放すること。


%index
SHCoCreateInstance
SHCoCreateInstance は変更されたり利用できなくなったりする可能性がある。代わりに CoCreateInstance を使うこと。
%prm
pszCLSID, pclsid, pUnkOuter, riid, ppv
pszCLSID : [wstr] 型: PCWSTR CLSID に変換する文字列へのポインタ。NULL の場合は pclsid が CLSID として使用される。
pclsid : [var] 型: const CLSID* 生成する CLSID。
pUnkOuter : [var] 型: IUnknown* 外側の IUnknown へのポインタ。集約に使用する。
riid : [var] 型: REFIID ppv を通じて取得するインタフェースの IID への参照。
ppv : [var] 型: void** 関数が成功して戻る際に、riid で要求されたインタフェースポインタを受け取る。
%inst
SHCoCreateInstance は変更されたり利用できなくなったりする可能性がある。代わりに CoCreateInstance
を使うこと。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
Objbase.h で定義されている IID_PPV_ARGS マクロを使って riid と ppv
のパラメータをまとめることが推奨される。このマクロは ppv の値が指すインタフェースに基づいて正しい IID を提供するため、riid
のコーディングミスによる予期しない結果の可能性を排除できる。


%index
SHCreateAssociationRegistration
Windows が提供するインタフェースの標準実装に基づく IApplicationAssociationRegistration オブジェクトを生成する。
%prm
riid, ppv
riid : [var] 型: REFIID 要求されたインタフェースの IID への参照。
ppv : [var] 型: void** この関数から戻る際に、IApplicationAssociationRegistration オブジェクトへのポインタのアドレスを格納する。
%inst
Windows が提供するインタフェースの標準実装に基づく IApplicationAssociationRegistration
オブジェクトを生成する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
SHCreateDataObject
親フォルダ内にデータオブジェクトを生成する。
%prm
pidlFolder, cidl, apidl, pdtInner, riid, ppv
pidlFolder : [var] 型: PCIDLIST_ABSOLUTE データオブジェクトを格納する親フォルダの ITEMIDLIST (PIDL) へのポインタ。
cidl : [int] 型: UINT apidl パラメータで指定されたファイルオブジェクトまたはサブフォルダの数。
apidl : [var] 型: PCUITEMID_CHILD_ARRAY 親フォルダを基準としてファイルオブジェクトまたはサブフォルダを一意に識別する定数 ITEMIDLIST 構造体へのポインタの配列。各アイテム識別子リストは終端ゼロが続く SHITEMID 構造体を 1 つだけ含まなければならない。
pdtInner : [var] 型: IDataObject* IDataObject インタフェースへのポインタ。このパラメータは NULL でも構わない。pdtInner は、生成するデータオブジェクトが、生成時に割り当てられる既定形式以外の追加 FORMATETC クリップボード形式をサポートする必要がある場合にのみ指定する。あるいは IDataObject::SetData を呼び出して FORMATETC 構造体に形式を指定することで、既定以外のクリップボード形式を使ってデータオブジェクトに値を設定するためのサポートも提供できる。
riid : [var] 型: REFIID ppv を通じて取得するインタフェースの IID への参照。これは IID_IDataObject でなければならない。
ppv : [var] 型: void** このメソッドが成功して戻る際に、riid で要求された IDataObject インタフェースポインタを格納する。
%inst
親フォルダ内にデータオブジェクトを生成する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
この関数は通常 IShellFolder::GetUIObjectOf メソッドの実装時に呼ばれる。インタフェース ID
IID_IDataObject のインタフェースポインタが要求されると（riid パラメータを使用）、実装者は応答として
SHCreateDataObject で生成したオブジェクト上のインタフェースポインタを返すことができる。この関数は
CFSTR_SHELLIDLIST（HIDA とも呼ばれる）クリップボード形式をサポートし、IDataObject::SetData
を介して任意のクリップボード形式に対する汎用サポートも提供する。クリップボード形式の詳細は「Shell Clipboard
Formats」を参照。新しいデータオブジェクトはドラッグ&ドロップなど、データが指定された形式でクリップボードに保存される操作で使用することを想定している。Objbase.h
で定義されている IID_PPV_ARGS マクロを使って riid と ppv のパラメータをまとめることが推奨される。このマクロは
ppv の値が指すインタフェースに基づいて正しい IID を提供するため、riid
のコーディングミスによる予期しない結果の可能性を排除できる。


%index
SHCreateDefaultContextMenu
シェルの既定コンテキストメニュー実装を表すオブジェクトを生成する。
%prm
pdcm, riid, ppv
pdcm : [var] 型: const DEFCONTEXTMENU* 定数 DEFCONTEXTMENU 構造体へのポインタ。
riid : [var] 型: REFIID 基にするオブジェクトのインタフェース ID への参照。通常は IContextMenu、IContextMenu2、または IContextMenu3 の IID である。
ppv : [var] 型: void** このメソッドから戻る際に、riid で要求されたインタフェースポインタを格納する。
%inst
シェルの既定コンテキストメニュー実装を表すオブジェクトを生成する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
この関数は通常 IShellFolder::GetUIObjectOf の実装で使用する。GetUIObjectOf は
DEFCONTEXTMENU 構造体で指定された IContextMenu
ハンドラを統合したコンテキストメニューを生成し、open、explore、delete、copy
などの既定のコンテキストメニュー動詞実装をオプションで提供できる。この関数の動作は DEFCONTEXTMENU
構造体に指定された入力で制御される。CDefFolderMenu_Create2 API
は既定のコンテキストメニュー実装を構築する別の方法である。SHCreateDefaultContextMenu
より表現力は劣るが、Windows Vista 以前のプラットフォームでも利用できる。


%index
SHCreateDefaultExtractIcon
標準のアイコン抽出器を生成する。その既定動作は IDefaultExtractIconInit インタフェースを通じてさらに設定できる。
%prm
riid, ppv
riid : [var] 型: REFIID インタフェース ID への参照。
ppv : [var] 型: void** IDefaultExtractIconInit インタフェースポインタのアドレス。
%inst
標準のアイコン抽出器を生成する。その既定動作は IDefaultExtractIconInit インタフェースを通じてさらに設定できる。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
この関数の想定される使い方は次のとおりである。
（以下省略）


%index
SHCreateDefaultPropertiesOp
シェルアイテム上で、まだ設定されていない既定プロパティを設定するファイル操作を生成する。
%prm
psi, ppFileOp
psi : [var] 型: IShellItem* ソースシェルアイテムへのポインタ。IShellItem を参照。
ppFileOp : [var] 型: IFileOperation** IFileOperation インタフェースポインタのアドレス。
%inst
シェルアイテム上で、まだ設定されていない既定プロパティを設定するファイル操作を生成する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
既定値を設定するプロパティのリストは、アイテムのファイル関連付けにある ProgID 配下の SetDefaultsFor
レジストリエントリから取得される。リストは prop: で始まり、既定値を設定するプロパティの正規名（たとえば
prop:System.Author;System.Document.DateCreated）を含む。このリストに指定可能なプロパティは
System.Author、System.Document.DateCreated、System.Photo.DateTaken
である。SetDefaultsFor エントリが ProgID 上に存在しない場合、この関数は HKEY_CLASSES_ROOT\* の
SetDefaultsFor エントリで見つかった既定値を使う。


%index
SHCreateDirectory
新しいファイルシステムフォルダを作成する。
%prm
hwnd, pszPath
hwnd : [intptr] 型: HWND 親ウィンドウへのハンドル。ユーザインタフェースを表示しない場合、このパラメータは NULL に設定できる。
pszPath : [wstr] 型: PCWSTR ディレクトリの完全修飾パスを含むヌル終端 Unicode 文字列へのポインタ。この文字列は終端ヌル文字を含めて MAX_PATH 文字以下でなければならない。
%inst
新しいファイルシステムフォルダを作成する。

[戻り値]
型: int 成功した場合は ERROR_SUCCESS
を返す。操作が失敗した場合、ここに挙げたものを含むその他のエラーコードを返すことがある。明示されていない値は「System Error
Codes」を参照。
（以下省略）

[備考]
この関数は pszPath
で与えられた完全修飾パスのファイルシステムフォルダを作成する。途中のフォルダが存在しない場合は、それらも作成する。新しいフォルダにセキュリティ属性を設定するには
SHCreateDirectoryEx を使うこと。


%index
SHCreateDirectoryExW
オプションでセキュリティ属性を指定して新しいファイルシステムフォルダを作成する。(Unicode)
%prm
hwnd, pszPath, psa
hwnd : [intptr] 型: HWND 親ウィンドウへのハンドル。ユーザインタフェースを表示しない場合、このパラメータは NULL に設定できる。
pszPath : [wstr] 型: LPCTSTR ディレクトリの完全修飾パスを指定するヌル終端文字列へのポインタ。この文字列は終端ヌル文字を含めて最大 248 文字までである。
psa : [var] 型: const SECURITY_ATTRIBUTES* ディレクトリのセキュリティ属性を持つ SECURITY_ATTRIBUTES 構造体へのポインタ。セキュリティ属性を設定する必要がない場合は NULL に設定する。
%inst
オプションでセキュリティ属性を指定して新しいファイルシステムフォルダを作成する。(Unicode)

[戻り値]
型: int 成功した場合は ERROR_SUCCESS
を返す。操作が失敗した場合、ここに挙げたものを含むその他のエラーコードを返すことがある。明示されていない値は「System Error
Codes」を参照。
（以下省略）

[備考]
この関数は pszPath
で与えられた完全修飾パスのファイルシステムフォルダを作成する。途中のフォルダが存在しない場合は、それらも作成する。SHCreateDirectoryEx
は作成したファイルが可視であることも検証する。可視でない場合は、次のいずれかが起こる。
（以下省略）


%index
SHCreateFileExtractIconW
SHCreateFileExtractIcon は変更されたり利用できなくなったりする可能性がある。(Unicode)
%prm
pszFile, dwFileAttributes, riid, ppv
pszFile : [wstr] 型: LPCTSTR ファイルシステムオブジェクトを指定するヌル終端文字列へのポインタ。バッファは MAX_PATH 文字を超えてはならない。
dwFileAttributes : [int] 型: DWORD オブジェクトの種類を指定する 1 つ以上のファイル属性フラグ（Winnt.h で定義された FILE_ATTRIBUTE_* の値）の組み合わせ。
riid : [var] 型: REFIID 生成するアイコン抽出器インタフェースの目的のインタフェース ID への参照。これは IID_IExtractIconA か IID_IExtractIconW のいずれかでなければならない。
ppv : [var] 型: void** この関数から戻る際に、riid で要求されたインタフェースポインタを格納する。通常は IExtractIcon である。
%inst
SHCreateFileExtractIcon は変更されたり利用できなくなったりする可能性がある。(Unicode)

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
SHCreateItemFromIDList
アイテム識別子リスト (PIDL) へのポインタからシェルアイテムオブジェクトを生成し初期化する。生成されるシェルアイテムオブジェクトは IShellItem インタフェースをサポートする。
%prm
pidl, riid, ppv
pidl : [var] 型: PCIDLIST_ABSOLUTE ソース PIDL。
riid : [var] 型: REFIID 要求されたインタフェースの IID への参照。
ppv : [var] 型: void** この関数から戻る際に、riid で要求されたインタフェースポインタを格納する。通常は IShellItem または IShellItem2 である。
%inst
アイテム識別子リスト (PIDL) へのポインタからシェルアイテムオブジェクトを生成し初期化する。生成されるシェルアイテムオブジェクトは
IShellItem インタフェースをサポートする。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
SHCreateItemFromParsingName
解析名からシェルアイテムオブジェクトを生成し初期化する。
%prm
pszPath, pbc, riid, ppv
pszPath : [wstr] 型: PCWSTR 表示名へのポインタ。
pbc : [var] 型: IBindCtx* 省略可能。解析関数への入力および出力としてパラメータを渡すために使うバインドコンテキストへのポインタ。これらのパラメータは多くの場合データソース固有であり、データソース所有者によって文書化されている。たとえばファイルシステムデータソースは、解析対象の名前（WIN32_FIND_DATA 構造体として）を STR_FILE_SYS_BIND_DATA バインドコンテキストパラメータを使って受け付ける。
riid : [var] 型: REFIID ppv を通じて取得するインタフェースの IID への参照。通常は IID_IShellItem または IID_IShellItem2 である。
ppv : [var] 型: void** このメソッドが成功して戻る際に、riid で要求されたインタフェースポインタを格納する。通常は IShellItem または IShellItem2 である。
%inst
解析名からシェルアイテムオブジェクトを生成し初期化する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
Objbase.h で定義されている IID_PPV_ARGS マクロを使って riid と ppv
のパラメータをまとめることが推奨される。このマクロは ppv の値が指すインタフェースに基づいて正しい IID を提供するため、riid
のコーディングミスによる予期しない結果の可能性を排除できる。


%index
SHCreateItemFromRelativeName
相対解析名からシェルアイテムオブジェクトを生成し初期化する。
%prm
psiParent, pszName, pbc, riid, ppv
psiParent : [var] 型: IShellItem* 親シェルアイテムへのポインタ。
pszName : [wstr] 型: PCWSTR psiParent からの相対表示名を指定するヌル終端 Unicode 文字列へのポインタ。
pbc : [var] 型: IBindCtx* 解析操作を制御するバインドコンテキストへのポインタ。このパラメータは NULL でも構わない。
riid : [var] 型: REFIID インタフェース ID への参照。
ppv : [var] 型: void** この関数から戻る際に、riid で要求されたインタフェースポインタを格納する。通常は IShellItem または IShellItem2 である。
%inst
相対解析名からシェルアイテムオブジェクトを生成し初期化する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
SHCreateItemInKnownFolder
既知フォルダ内に存在する単一ファイルに対するシェルアイテムオブジェクトを生成する。
%prm
kfid, dwKFFlags, pszItem, riid, ppv
kfid : [var] 型: REFKNOWNFOLDERID アイテムを格納するフォルダを示す KNOWNFOLDERID（GUID）への参照。
dwKFFlags : [int] 型: DWORD オブジェクト取得時の特別なオプションを指定するフラグ。この値は 0 でも、KNOWN_FOLDER_FLAG の値の 1 つ以上でも構わない。
pszItem : [wstr] 型: PCWSTR 新しいアイテムのファイル名を Unicode 文字列として含むヌル終端バッファへのポインタ。このパラメータは NULL でも構わない。NULL の場合、既知フォルダ自体を表す IShellItem が生成される。
riid : [var] 型: REFIID ppv を通じて取得する、アイテムを表すインタフェースの IID への参照。通常は IID_IShellItem または IID_IShellItem2 である。
ppv : [var] 型: void** この関数が成功して戻る際に、riid で要求されたインタフェースポインタを格納する。通常は IShellItem または IShellItem2 である。
%inst
既知フォルダ内に存在する単一ファイルに対するシェルアイテムオブジェクトを生成する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
SHCreateItemWithParent
親フォルダと子アイテム ID からシェルアイテムを生成する。
%prm
pidlParent, psfParent, pidl, riid, ppvItem
pidlParent : [var] 型: PCIDLIST_ABSOLUTE 生成対象アイテムの親フォルダの IDList、すなわち psfParent の IDList。psfParent が指定されていれば、このパラメータは NULL でも構わない。
psfParent : [var] 型: IShellFolder* pidl で指定された子アイテムのシェルデータソースを指定する IShellFolder インタフェースへのポインタ。pidlParent が指定されていれば、このパラメータは NULL でも構わない。
pidl : [var] 型: PCUITEMID_CHILD psfParent または pidlParent で指定された親フォルダを基準とする子アイテム ID。
riid : [var] 型: REFIID インタフェース ID への参照。
ppvItem : [var] 型: void** この関数から戻る際に、riid で要求されたインタフェースポインタを格納する。通常は IShellItem または IShellItem2 である。
%inst
親フォルダと子アイテム ID からシェルアイテムを生成する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
SHCreatePropSheetExtArray
SHCreatePropSheetExtArray は変更されたり利用できなくなったりする可能性がある。
%prm
hKey, pszSubKey, max_iface
hKey : [intptr] 型: HKEY プロパティシート拡張ハンドラを含むサブキーがあるレジストリのルートキー。たとえば HKEY_LOCAL_MACHINE。
pszSubKey : [wstr] 型: PCWSTR shellex\PropertySheetHandlers を含むサブキーの名前を指定するヌル終端文字列へのポインタ。たとえば hkey が HKEY_LOCAL_MACHINE で pszSubkey が "Software\Microsoft\Windows\CurrentVersion\Controls Folder\Display" の場合、この関数は次のサブキーを使ってプロパティシート拡張ハンドラを返す。
max_iface : [int] 型: UINT 返されるプロパティシートハンドラの最大数。
%inst
SHCreatePropSheetExtArray は変更されたり利用できなくなったりする可能性がある。

[戻り値]
型: HPSXA プロパティシートハンドラの配列へのハンドルを返す。この値は SHAddFromPropSheetExtArray
に渡す。直接アクセスしてはならない。

[備考]
返された HPSXA ハンドルを使い終わったら、SHDestroyPropSheetExtArray
を呼び出して破棄すること。この関数は最大 max_iface 個のプロパティシート拡張を配列に読み込み、その配列が
SHAddFromPropSheetExtArray に渡される。


%index
SHCreateQueryCancelAutoPlayMoniker
非推奨。実行中オブジェクトテーブル (ROT) に IQueryCancelAutoPlay ハンドラを登録するのに利用できる QueryCancelAutoPlay クラスモニカを生成する。
%prm
ppmoniker
ppmoniker : [var] 型: IMoniker** 関数が成功して戻る際に、QueryCancelAutoPlay クラスモニカを受け取る IMoniker インタフェースポインタのアドレス。この関数呼び出しが失敗した場合、この値は NULL になる。
%inst
非推奨。実行中オブジェクトテーブル (ROT) に IQueryCancelAutoPlay ハンドラを登録するのに利用できる
QueryCancelAutoPlay クラスモニカを生成する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
成功した場合、SHCreateQueryCancelAutoPlayMoniker はインタフェースの AddRef
メソッドを呼び出して参照カウントをインクリメントする。使い終わったら、インタフェースの Release メソッドを呼び出して解放すること。


%index
SHCreateShellItem
IShellItem オブジェクトを生成する。
%prm
pidlParent, psfParent, pidl, ppsi
pidlParent : [var] 型: PCIDLIST_ABSOLUTE 親への PIDL。この値は NULL でも構わない。
psfParent : [var] 型: IShellFolder* 親 IShellFolder へのポインタ。この値は NULL でも構わない。
pidl : [var] 型: PCUITEMID_CHILD 要求アイテムの PIDL。pidlParent または psfParent に親情報が含まれていない場合、これは絶対 PIDL でなければならない。
ppsi : [var] 型: IShellItem** このメソッドから戻る際に、新しい IShellItem へのインタフェースポインタを格納する。
%inst
IShellItem オブジェクトを生成する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
SHCreateShellItem はシェル名前空間アイテムを表すオブジェクトを生成する。呼び出し側は pidlParent または
psfParent に親情報を提供しなければならない。代わりに pidl パラメータに絶対 IDList
を指定することもできる。この関数の有効な呼び出しパターンは 3 通りある。
（以下省略）


%index
SHCreateShellItemArray
シェルアイテム配列オブジェクトを生成する。
%prm
pidlParent, psf, cidl, ppidl, ppsiItemArray
pidlParent : [var] 型: PCIDLIST_ABSOLUTE ppidl で指定されたアイテムの親フォルダの ID リスト。psf が指定されていれば、このパラメータは NULL でも構わない。pidlParent が指定されていない場合、IPersistFolder2 を使って psf パラメータから計算される。
psf : [var] 型: IShellFolder* ppidl で指定された子アイテムの親であるシェルデータソースオブジェクト。pidlParent が指定されていれば、このパラメータは NULL でも構わない。
cidl : [int] 型: UINT ppidl で指定された配列の要素数。
ppidl : [var] 型: PCUITEMID_CHILD_ARRAY 配列を作成する対象の子アイテム ID のリスト。この値は NULL でも構わない。
ppsiItemArray : [var] 型: IShellItemArray** この関数から戻る際に、IShellItemArray インタフェースポインタのアドレスを格納する。
%inst
シェルアイテム配列オブジェクトを生成する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
SHCreateShellItemArrayFromDataObject
データオブジェクトからシェルアイテム配列オブジェクトを生成する。
%prm
pdo, riid, ppv
pdo : [var] 型: IDataObject* IDataObject インタフェースへのポインタ。
riid : [var] 型: REFIID 目的のインタフェース ID への参照。
ppv : [var] 型: void** このメソッドから戻る際に、riid で要求されたインタフェースポインタを格納する。通常は IShellItemArray である。
%inst
データオブジェクトからシェルアイテム配列オブジェクトを生成する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
この関数は IShellExtInit を実装し IShellExtInit::Initialize
メソッドにデータオブジェクトが渡されるシェル拡張（たとえばコンテキストメニューハンドラ）にとって有用である。この API
を使うとデータオブジェクトをシェルアイテムに変換でき、ハンドラがそれを利用できる。CF_HDROP や
CFSTR_SHELLIDLIST（HIDA
とも呼ばれる）のようなクリップボード形式よりもシェルアイテム配列を使うことが推奨される。コードがシンプルになり、性能向上の余地もあるためである。生成されたシェルアイテム配列はソースデータオブジェクトへの参照を保持するため、シェルアイテム配列の寿命の間そのデータオブジェクトは有効でなければならない。特に
IDropTarget メソッドに渡されたデータオブジェクトはドロップ操作完了後は無効となることに注意。


%index
SHCreateShellItemArrayFromIDLists
ITEMIDLIST 構造体のリストからシェルアイテム配列オブジェクトを生成する。
%prm
cidl, rgpidl, ppsiItemArray
cidl : [int] 型: UINT 配列の要素数。
rgpidl : [var] 型: PCIDLIST_ABSOLUTE_ARRAY ITEMIDLIST 構造体への定数ポインタを cidl 個含むリスト。
ppsiItemArray : [var] 型: IShellItemArray** この関数から戻る際に、IShellItemArray インタフェースポインタを格納する。
%inst
ITEMIDLIST 構造体のリストからシェルアイテム配列オブジェクトを生成する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
SHCreateShellItemArrayFromShellItem
単一のシェルアイテムから 1 要素の配列を作成する。
%prm
psi, riid, ppv
psi : [var] 型: IShellItem* アイテムを表す IShellItem オブジェクトへのポインタ。
riid : [var] 型: REFIID ppv を通じて取得するインタフェースの IID への参照。
ppv : [var] 型: void** このメソッドから戻る際に、riid で要求されたインタフェースポインタを格納する。通常は IShellItemArray へのポインタである。
%inst
単一のシェルアイテムから 1 要素の配列を作成する。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
この関数は単一のアイテムから 1 要素の配列を作成する。フォルダの内容から配列を作成するには SHCreateShellItemArray
を使用する。


%index
SHCreateStdEnumFmtEtc
SHCreateStdEnumFmtEtc は変更されるか利用できなくなる可能性がある。
%prm
cfmt, afmt, ppenumFormatEtc
cfmt : [int] 型: UINT afmt 配列のエントリ数。
afmt : [var] 型: const FORMATETC[] 対象とするクリップボード形式を指定する FORMATETC 構造体の配列。
ppenumFormatEtc : [var] 型: IEnumFORMATETC** この関数が成功した場合、IEnumFORMATETC インターフェイスポインターを受け取る。失敗した場合は NULL を受け取る。
%inst
SHCreateStdEnumFmtEtc は変更されるか利用できなくなる可能性がある。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
SHDefExtractIconW
ファイルからアイコンを抽出するための既定のハンドラーを提供する。(Unicode)
%prm
pszIconFile, iIndex, uFlags, phiconLarge, phiconSmall, nIconSize
pszIconFile : [wstr] 型: LPCTSTR アイコンを抽出するファイルのパスと名前を含む、null 終端バッファーへのポインター。
iIndex : [int] 型: int pszIconFile で指定されたファイル内のアイコンの位置。正の数の場合は、ファイル内のアイコンの 0 から始まる位置を表す。たとえば 0 はリソースファイルの 1 番目のアイコンを、2 は 3 番目のアイコンを指す。負の数の場合は、アイコンのリソース ID を表す。
uFlags : [int] 型: UINT アイコンの抽出を制御するフラグ。
phiconLarge : [intptr] 型: HICON* この関数が成功した場合、nIconSize の下位ワードで指定された大きい方のアイコンのハンドルを受け取る HICON へのポインター。この値は NULL でもよい。
phiconSmall : [intptr] 型: HICON* この関数が成功した場合、nIconSize の上位ワードで指定された小さい方のアイコンのハンドルを受け取る HICON へのポインター。
nIconSize : [int] 型: UINT 下位ワードに大アイコンのサイズ、上位ワードに小アイコンのサイズを格納した値。サイズはピクセル単位で測定する。既定の大小サイズを指定するには 0 を渡す。
%inst
ファイルからアイコンを抽出するための既定のハンドラーを提供する。(Unicode)

[戻り値]
型: HRESULT この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
この関数で作成したアイコンリソースを不要になった時点で解放するのは呼び出し側の責任である。これは DestroyIcon 関数で行える。
> [!NOTE] > shlobj_core.h ヘッダーは SHDefExtractIcon を、UNICODE
プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または Unicode
版を自動的に選択するエイリアスとして定義している。エンコーディング中立なエイリアスとそうでないコードを混在して使用すると、コンパイルや実行時のエラーにつながる不一致が発生する場合がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
SHDoDragDrop
ドラッグ&ドロップ操作を実行する。必要に応じてドラッグソースの生成およびドラッグ画像をサポートする。
%prm
hwnd, pdata, pdsrc, dwEffect, pdwEffect
hwnd : [intptr] 型: HWND ドラッグ画像を取得するために使用するウィンドウのハンドル。この値は NULL でもよい。詳細は備考を参照。
pdata : [var] 型: IDataObject* ドラッグされるデータを保持するデータオブジェクトの IDataObject インターフェイスへのポインター。
pdsrc : [var] 型: IDropSource* ドラッグ操作中にソースと通信するために使用される IDropSource インターフェイスの実装へのポインター。
dwEffect : [int] 型: DWORD ドラッグ&ドロップ操作においてソースが許可する効果。最も重要な効果は、ドラッグ&ドロップ操作で移動を許可するかどうかである。指定可能な値の一覧は DROPEFFECT を参照。
pdwEffect : [var] 型: DWORD* ドラッグ&ドロップ操作がソースデータにどう影響したかを示す値へのポインター。pdwEffect パラメーターは操作がキャンセルされなかった場合にのみ設定される。指定可能な値の一覧は DROPEFFECT を参照。
%inst
ドラッグ&ドロップ操作を実行する。必要に応じてドラッグソースの生成およびドラッグ画像をサポートする。

[戻り値]
型: HRESULT この関数は標準の戻り値 E_OUTOFMEMORY に加え、次の値もサポートする。
（以下省略）

[備考]
Windows Vista 以降では、データオブジェクト pdtobj にドラッグ画像が格納されておらず、かつ hwnd
で指定されたウィンドウからドラッグ画像が取得できない場合、シェルが汎用のドラッグ画像を提供する。指定したウィンドウからドラッグ画像を取得できないのは、hwnd
が NULL であるか、指定したウィンドウが DI_GETDRAGIMAGE メッセージをサポートしていないかのいずれかの場合である。


%index
SHEmptyRecycleBinW
指定したドライブのごみ箱を空にする。(Unicode)
%prm
hwnd, pszRootPath, dwFlags
hwnd : [intptr] 型: HWND 操作中に表示される可能性のあるダイアログボックスの親ウィンドウへのハンドル。このパラメーターは NULL でもよい。
pszRootPath : [wstr] 型: LPCTSTR ごみ箱が存在するルートドライブのパスを格納する、最大長 MAX_PATH の null 終端文字列のアドレス。このパラメーターには c:\windows\system\ のように、ドライブ・フォルダ・サブフォルダ名で書式化された文字列のアドレスを指定することもできる。空文字列または NULL でもよい。空文字列または NULL を指定すると、すべてのドライブ上のすべてのごみ箱が空にされる。
dwFlags : [int] 型: DWORD
%inst
指定したドライブのごみ箱を空にする。(Unicode)

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
> [!NOTE] > shellapi.h ヘッダーは SHEmptyRecycleBin を、UNICODE
プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または Unicode
版を自動的に選択するエイリアスとして定義している。エンコーディング中立なエイリアスとそうでないコードを混在して使用すると、コンパイルや実行時のエラーにつながる不一致が発生する場合がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
SHEnumerateUnreadMailAccountsW
未読メールが存在するユーザーアカウントを列挙する。(Unicode)
%prm
hKeyUser, dwIndex, pszMailAddress, cchMailAddress
hKeyUser : [intptr] 型: HKEY 指定したユーザーに対する有効な HKEY。
dwIndex : [int] 型: DWORD ユーザーアカウントのインデックス。
pszMailAddress : [wstr] 型: LPTSTR 指定したユーザーに属するアカウントのメールアドレスを指定する Unicode 文字列へのポインター。
cchMailAddress : [int] 型: int メールアドレスの文字数。
%inst
未読メールが存在するユーザーアカウントを列挙する。(Unicode)

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
hKeyUser パラメーターは、HKEY_CURRENT_USER のようなユーザー情報のルート、または HKEY_USERS
の下に列挙される任意のキーに対する HKEY である。
> [!NOTE] > shellapi.h ヘッダーは SHEnumerateUnreadMailAccounts を、UNICODE
プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または Unicode
版を自動的に選択するエイリアスとして定義している。エンコーディング中立なエイリアスとそうでないコードを混在して使用すると、コンパイルや実行時のエラーにつながる不一致が発生する場合がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
SHEvaluateSystemCommandTemplate
CreateProcess または ShellExecute の呼び出しで使用されるパラメーターの厳密な検証を行う。
%prm
pszCmdTemplate, ppszApplication, ppszCommandLine, ppszParameters
pszCmdTemplate : [wstr] 型: PCWSTR パラメーターを含む場合と含まない場合がある、コマンドライン。パラメーターが置換パラメーターである場合は、パラメーターが置換される前に SHEvaluateSystemCommandTemplate を呼び出す必要がある。
ppszApplication : [var] 型: PWSTR* 検証済みのアプリケーションへのパスのポインター。この値は CreateProcess の lpApplication パラメーター、または ShellExecute の lpFile パラメーターとして渡す。このリソースは CoTaskMemAlloc で割り当てられるため、不要になった時点で CoTaskMemFree を呼び出して解放するのは呼び出し側の責任である。
ppszCommandLine : [var] 型: PWSTR* CreateProcess の呼び出しで使用されるコマンドラインテンプレート文字列へのポインター。コマンドラインパラメーターはこのテンプレートに基づいて指定し、CreateProcess に lpCommandLine パラメーターとして渡す必要がある。PathGetArgs が常に正しく読み取れる形式であることが保証されている。このリソースは CoTaskMemAlloc で割り当てられるため、不要になった時点で CoTaskMemFree を呼び出して解放するのは呼び出し側の責任である。
ppszParameters : [var] 型: PWSTR* ShellExecute の呼び出しで使用されるコマンドラインテンプレート文字列へのポインター。コマンドラインパラメーターはこのテンプレートに基づいて指定し、ShellExecute に lpParameters パラメーターとして渡す必要がある。このパラメーターは PathGetArgs を呼び出すのと同等である。このリソースは CoTaskMemAlloc で割り当てられるため、不要になった時点で CoTaskMemFree を呼び出して解放するのは呼び出し側の責任である。
%inst
CreateProcess または ShellExecute の呼び出しで使用されるパラメーターの厳密な検証を行う。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]

この関数は、呼び出し元プロセスが実行コンテキストに関係なくコマンドテンプレートからの決定論的な動作を必要とする場合に使用する。%PATH%、GetCurrentDirectory、親プロセスのディレクトリといった現在のプロセス状態を無視する。この関数は、コマンドがハードコードされている場合に使用する。HKEY_CLASSES_ROOT
からファイル関連付けを処理する際に ShellExecute によって使用される。この関数の目的は、CreateProcess
のコマンドライン悪用を低減することである。ユーザー入力の処理用に設計されておらず、その目的で使用すると予期しない失敗が発生する可能性がある。


%index
SHFindFiles
SHFindFiles は変更されるか利用できなくなる可能性がある。
%prm
pidlFolder, pidlSaveFile
pidlFolder : [var] 型: PCIDLIST_ABSOLUTE 検索を開始するフォルダ。このフォルダは検索ウィンドウの「探す場所:」ボックスに表示される。検索ウィンドウの「詳細オプション」でユーザーが他のオプションを選択しない限り、このフォルダとそのすべてのサブフォルダが検索される。この値は NULL でもよい。
pidlSaveFile : [var] 型: PCIDLIST_ABSOLUTE このパラメーターは使用されず、NULL に設定する必要がある。Windows Server 2003 および Windows XP: 読み込む保存済み検索ファイル (.fnd)。検索を開始した後、検索パラメーターを .fnd ファイルに保存できる。この値は NULL でもよい。
%inst
SHFindFiles は変更されるか利用できなくなる可能性がある。

[戻り値]
型: BOOL 検索ウィンドウの表示に成功した場合は TRUE を、それ以外の場合は FALSE を返す。


%index
SHFind_InitMenuPopup
SHFind_InitMenuPopup は変更されるか利用できなくなる可能性がある。
%prm
hmenu, hwndOwner, idCmdFirst, idCmdLast
hmenu : [intptr] 型: HMENU ポップアップメニューのハンドル。
hwndOwner : [intptr] 型: HWND ポップアップメニューのオーナーウィンドウのハンドル。この値は NULL でもよい。
idCmdFirst : [int] 型: UINT 最初のメニュー項目の ID。
idCmdLast : [int] 型: UINT 最後のメニュー項目の ID。
%inst
SHFind_InitMenuPopup は変更されるか利用できなくなる可能性がある。

[戻り値]
型: IContextMenu* 成功した場合は IContextMenu ポインターを返す。失敗した場合は NULL を返す。


%index
SHFlushSFCache
SHFlushSFCache は変更されるか利用できなくなる可能性がある。
%prm

%inst
SHFlushSFCache は変更されるか利用できなくなる可能性がある。

[備考]
SHFlushSFCache
は特殊フォルダへのパスが変更されたときに呼び出す。これにより、キャッシュされた値ではなく、レジストリに格納された更新後のパスが使用されるようになる。特殊フォルダの詳細については、Getting
a Folder's ID の Special Folders and CSIDLs セクションを参照。


%index
SHFormatDrive
SHFormatDrive は変更されるか利用できなくなる可能性がある。
%prm
hwnd, drive, fmtID, options
hwnd : [intptr] 型: HWND ダイアログボックスの親ウィンドウのハンドル。フォーマットダイアログボックスには親ウィンドウが必要であるため、このパラメーターを NULL にすることはできない。
drive : [int] 型: UINT フォーマットするドライブ。このパラメーターの値は、A: ドライブを 0 とする文字ドライブを表す。たとえば 2 は C: ドライブを表す。
fmtID : [int] 型: UINT 物理フォーマットの ID。現在は次のフラグのみ定義されている。
options : [int] 型: UINT
%inst
SHFormatDrive は変更されるか利用できなくなる可能性がある。

[戻り値]
型: DWORD 直前に成功したフォーマットの フォーマット ID
または次のいずれかの値を返す。この値の下位ワードは、最後のフォーマットを繰り返すために以降の呼び出しで fmtID
パラメーターとして渡すことができる。
（以下省略）

[備考]
フォーマットはダイアログボックスインターフェイスによって制御される。つまり、実際にフォーマットを開始するにはユーザーが OK
ボタンをクリックする必要があり、プログラムからフォーマットを開始することはできない。


%index
SHFree
SHAlloc によって割り当てられたメモリを解放する。
%prm
pv
pv : [intptr] 型: void* SHAlloc によって割り当てられたメモリへのポインター。
%inst
SHAlloc によって割り当てられたメモリを解放する。


%index
SHFreeNameMappings
SHFileOperation 関数によって取得されたファイル名マッピングオブジェクトを解放する。
%prm
hNameMappings
hNameMappings : [intptr] 型: HANDLE 解放するファイル名マッピングオブジェクトへのハンドル。
%inst
SHFileOperation 関数によって取得されたファイル名マッピングオブジェクトを解放する。


%index
SHGetAttributesFromDataObject
SHGetAttributesFromDataObject は変更されるか利用できなくなる可能性がある。
%prm
pdo, dwAttributeMask, pdwAttributes, pcItems
pdo : [var] 型: IDataObject* 情報を取得するデータオブジェクト。
dwAttributeMask : [int] 型: DWORD 呼び出し側アプリケーションが取得したい情報を示す 1 つ以上の SFGAO フラグ。
pdwAttributes : [var] 型: DWORD* この関数が成功した場合、要求された属性のうち pdo 内のすべての項目に共通する属性を示す 1 つ以上の SFGAO フラグを受け取る DWORD 値へのポインター。この情報が不要な場合は NULL でもよい。
pcItems : [var] 型: UINT* この関数が成功した場合、pdo が指すデータオブジェクト内の PIDL の数を受け取る UINT へのポインター。この情報が不要な場合は NULL でもよい。
%inst
SHGetAttributesFromDataObject は変更されるか利用できなくなる可能性がある。

[戻り値]
型: HRESULT この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
SHGetDataFromIDListW
相対アイテム識別子リストから拡張プロパティデータを取得する。(Unicode)
%prm
psf, pidl, nFormat, pv, cb
psf : [var] 型: IShellFolder* 親 IShellFolder インターフェイスのアドレス。これは、pidl パラメーターが参照する ITEMIDLIST 構造体の直接の親でなければならない。
pidl : [var] 型: PCUITEMID_CHILD psf で指定されたフォルダを基準としてオブジェクトを識別する ITEMIDLIST 構造体へのポインター。
nFormat : [int] 型: int
pv : [intptr] 型: void* この関数が成功した場合に、要求されたデータを受け取るバッファーへのポインター。このバッファーの形式は nFormat によって決まる。nFormat が SHGDFIL_NETRESOURCE の場合、2 つのケースがある。バッファーが十分に大きい場合は、ネットワークリソースの文字列情報 (ネットワーク名、ローカル名、プロバイダー、コメントの各フィールド) がバッファーに格納される。バッファーが十分でない場合は、ネットワークリソース構造体のみがバッファーに格納され、文字列情報のポインターは NULL になる。
cb : [int] 型: int pv のバッファーのサイズ (バイト単位)。
%inst
相対アイテム識別子リストから拡張プロパティデータを取得する。(Unicode)

[戻り値]
型: HRESULT 成功した場合は S_OK を、それ以外の場合は E_INVALIDARG を返す。

[備考]
この関数は、アイテム識別子リスト (PIDL) へのポインターに存在する情報のみを抽出する。PIDL の内容は PIDL
を作成したフォルダオブジェクトに依存するため、要求した情報がすべて利用できる保証はない。さらに、返される情報は PIDL
が作成された時点でのオブジェクトの状態を反映する。オブジェクトの現在の状態は異なる可能性がある。たとえば、nFormat に
SHGDFIL_FINDDATA を設定すると、関数は WIN32_FIND_DATA
構造体のメンバーの一部にのみ意味のある値を割り当てる場合がある。残りのメンバーはゼロに設定される。ファイルシステムのファイルやフォルダに関する完全な現在の情報を取得するには、GetFileTime
や FindFirstFile などの標準ファイルシステム関数を使用する。psf、pidl、pv、または cb パラメーターが
nFormat パラメーターと一致しない場合、または nFormat が上記の特定の SHGDFIL_ 値のいずれでもない場合は
E_INVALIDARG が返される。
> [!NOTE] > shlobj_core.h ヘッダーは SHGetDataFromIDList を、UNICODE
プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または Unicode
版を自動的に選択するエイリアスとして定義している。エンコーディング中立なエイリアスとそうでないコードを混在して使用すると、コンパイルや実行時のエラーにつながる不一致が発生する場合がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
SHGetDesktopFolder
シェルの名前空間のルートであるデスクトップフォルダの IShellFolder インターフェイスを取得する。
%prm
ppshf
ppshf : [var] 型: IShellFolder** このメソッドが返るときに、デスクトップフォルダの IShellFolder インターフェイスポインターを受け取る。呼び出し側アプリケーションは、最終的に IUnknown::Release メソッドを呼び出してインターフェイスを解放する責任がある。
%inst
シェルの名前空間のルートであるデスクトップフォルダの IShellFolder インターフェイスを取得する。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
SHGetDiskFreeSpaceExW
ディスクボリュームのディスク領域情報を取得する。(Unicode)
%prm
pszDirectoryName, pulFreeBytesAvailableToCaller, pulTotalNumberOfBytes, pulTotalNumberOfFreeBytes
pszDirectoryName : [wstr] 型: LPCTSTR サイズ情報を取得するボリュームを指定する null 終端文字列。ドライブ文字、UNC 名、またはフォルダのパスのいずれかを指定できる。現在のドライブを表すために NULL を使用することはできない。
pulFreeBytesAvailableToCaller : [var] 型: ULARGE_INTEGER* 呼び出し側アプリケーションが利用可能なボリューム上のバイト数を受け取る値へのポインター。オペレーティングシステムがユーザーごとのクォータを実装している場合、この値はボリューム上の空きバイトの総数より少ない場合がある。
pulTotalNumberOfBytes : [var] 型: ULARGE_INTEGER* ボリュームの総サイズ (バイト単位) を受け取る値へのポインター。
pulTotalNumberOfFreeBytes : [var] 型: ULARGE_INTEGER* ボリューム上の空き領域のバイト数を受け取る値へのポインター。
%inst
ディスクボリュームのディスク領域情報を取得する。(Unicode)

[戻り値]
型: BOOL 成功した場合は TRUE を、それ以外の場合は FALSE を返す。

[備考]
類似名の関数 SHGetDiskFreeSpace は単に SHGetDiskFreeSpaceEx
のエイリアスである。SHGetDiskFreeSpace
を呼び出すと実際にはこの関数が呼ばれる。この関数は、オペレーティングシステムで利用可能であれば GetDiskFreeSpaceEx
関数を呼び出す。GetDiskFreeSpaceEx が利用できない場合は、GetDiskFreeSpace
関数を呼び出して戻り値を加工することでエミュレートする。詳細は GetDiskFreeSpaceEx のドキュメントを参照。
> [!NOTE] > shellapi.h ヘッダーは SHGetDiskFreeSpaceEx を、UNICODE
プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または Unicode
版を自動的に選択するエイリアスとして定義している。エンコーディング中立なエイリアスとそうでないコードを混在して使用すると、コンパイルや実行時のエラーにつながる不一致が発生する場合がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
SHGetDriveMedia
指定したドライブに入っているメディアの種類を返す。
%prm
pszDrive, pdwMediaContent
pszDrive : [wstr] 型: PCWSTR メディアの種類をチェックするドライブ。
pdwMediaContent : [var] 型: DWORD* 指定したドライブ内のメディアの種類へのポインター。ARCONTENT フラグの組み合わせ。
%inst
指定したドライブに入っているメディアの種類を返す。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
SHGetFolderLocation
非推奨。フォルダのパスを ITEMIDLIST 構造体として取得する。
%prm
hwnd, csidl, hToken, dwFlags, ppidl
hwnd : [intptr] 型: HWND 予約済み。
csidl : [int] 型: int 取得するフォルダを識別する CSIDL 値。CSIDL に関連付けられたフォルダは、特定のシステムには存在しない場合がある。
hToken : [intptr] 型: HANDLE 特定のユーザーを表すために使用できるアクセストークン。通常は NULL に設定するが、単一ユーザーに属するものとして扱われる、複数ユーザーを持つフォルダの場合に必要となることがある。この種類の最も一般的に使用されるフォルダはマイ ドキュメントである。hToken が非 NULL の場合、呼び出し側アプリケーションは正しい偽装を行う責任がある。特定のユーザーに対する適切なセキュリティ特権を持っている必要があり、ユーザーのレジストリハイブが現在マウントされている必要がある。アクセス制御の詳細については、Access Control を参照。
dwFlags : [int] 型: DWORD
ppidl : [var] 型: PIDLIST_ABSOLUTE* 名前空間のルート (デスクトップ) を基準としたフォルダの場所を指定するアイテム識別子リスト構造体へのポインターのアドレス。失敗した場合、ppidl パラメーターは NULL に設定される。呼び出し側アプリケーションは、ILFree を呼び出してこのリソースを解放する責任がある。
%inst
非推奨。フォルダのパスを ITEMIDLIST 構造体として取得する。

[戻り値]
型: HRESULT 成功した場合は S_OK を、それ以外の場合は次のいずれかを含むエラー値を返す。
（以下省略）

[備考]
注 Windows Vista 以降、この関数は単に SHGetKnownFolderIDList のラッパーとなった。CSIDL
値は対応する KNOWNFOLDERID に変換され、SHGetKnownFolderIDList
が呼び出される。新しいアプリケーションは、後方互換性のためにのみサポートされている古い CSIDL システムではなく、known
folder
システムを使用すべきである。SHGetFolderLocation、SHGetFolderPath、SHGetSpecialFolderLocation、および
SHGetSpecialFolderPath 関数は、Windows Vista
より前のシステムでフォルダのハンドルを取得するのに推奨される方法である。ExpandEnvironmentStrings
のように環境変数名を %VariableName%
の形式で直接使う関数は、信頼できない場合がある。この関数は、シェルの旧バージョンに含まれていた
SHGetSpecialFolderLocation の上位集合である。


%index
SHGetFolderPathW
非推奨。(SHGetFolderPathW)
%prm
hwnd, csidl, hToken, dwFlags, pszPath
hwnd : [intptr] 型: HWND 予約。
csidl : [int] 型: int パスを取得するフォルダを識別する CSIDL 値。実フォルダのみ有効。仮想フォルダを指定した場合は失敗する。CSIDL_FLAG_CREATE と組み合わせることでフォルダ作成を強制できる。
hToken : [intptr] 型: HANDLE 特定のユーザを表すアクセストークン。通常は NULL を指定するが、複数ユーザで共有されるが単一ユーザに属するとして扱われるフォルダ(Documents など)では非 NULL 値を割り当てる必要がある場合がある。-1 を指定すると Default User を示す。
dwFlags : [int] 型: DWORD 返されるパスを指定するフラグ。ユーザまたは管理者によりリダイレクトされた現在値(SHGFP_TYPE_CURRENT)または既定値(SHGFP_TYPE_DEFAULT)を取得できる。
pszPath : [wstr] 型: LPWSTR パスを受け取る長さ MAX_PATH の NULL 終端文字列へのポインタ。エラーまたは S_FALSE が返される場合は空になる。末尾にバックスラッシュは付かない。
%inst
非推奨。(SHGetFolderPathW)

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外は HRESULT エラーコード。

[備考]
この関数は SHGetSpecialFolderPath のスーパーセットであり、一部の CSIDL 値がサポートされる。
（以下省略）


%index
SHGetFolderPathAndSubDirW
フォルダのパスを取得し、ユーザー指定のサブフォルダパスを追加する。(Unicode)
%prm
hwnd, csidl, hToken, dwFlags, pszSubDir, pszPath
hwnd : [intptr] 型: HWND 予約済み。
csidl : [int] 型: int パスを取得するフォルダを識別する CSIDL 値。実フォルダのみが有効である。仮想フォルダを指定するとこの関数は失敗する。フォルダの CSIDL を CSIDL_FLAG_CREATE と組み合わせると、SHGetFolderPathAndSubDir でフォルダの作成を強制できる。
hToken : [intptr] 型: HANDLE 特定のユーザーを表すアクセストークン。Windows 2000 より前のシステムではこの値を NULL に設定する。それ以降のシステムでは、hToken は通常 (常にではない) NULL に設定する。複数ユーザーを持ち得るが単一ユーザーに属するものとして扱われるフォルダの場合に hToken に値を割り当てる必要があるかもしれない。この種類の最も一般的に使用されるフォルダはマイ ドキュメントである。
dwFlags : [int] 型: DWORD 返されるパスがフォルダの実際のパスか既定のパスかを指定する。この値は、CSIDL 値に関連付けられたフォルダがユーザーによって移動または名前変更される可能性がある場合に使用する。
pszSubDir : [wstr] 型: LPCTSTR フォルダのパスに追加するサブパスへのポインター。これは長さ MAX_PATH の null 終端文字列である。新しいディレクトリを作成しない場合、これは既存のサブディレクトリでなければならず、そうでない場合は関数がエラーを返す。サブパスを追加しない場合、この値は NULL でもよい。
pszPath : [wstr] 型: LPTSTR この関数が返るときに、ディレクトリパスと追加されたサブパスを指す。これは長さ MAX_PATH の null 終端文字列である。関数がエラーコードを返した場合、この文字列は空である。
%inst
フォルダのパスを取得し、ユーザー指定のサブフォルダパスを追加する。(Unicode)

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
> [!NOTE] > shlobj_core.h ヘッダーは SHGetFolderPathAndSubDir を、UNICODE
プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または Unicode
版を自動的に選択するエイリアスとして定義している。エンコーディング中立なエイリアスとそうでないコードを混在して使用すると、コンパイルや実行時のエラーにつながる不一致が発生する場合がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
SHGetIDListFromObject
オブジェクトのアイテム識別子リスト (PIDL) へのポインターを取得する。
%prm
punk, ppidl
punk : [var] 型: IUnknown* PIDL を取得する対象のオブジェクトの IUnknown へのポインター。
ppidl : [var] 型: PIDLIST_ABSOLUTE* この関数が返るときに、指定したオブジェクトの PIDL へのポインターを格納する。
%inst
オブジェクトのアイテム識別子リスト (PIDL) へのポインターを取得する。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
SHGetIconOverlayIndexW
システムイメージリスト内のオーバーレイアイコンのインデックスを返す。(Unicode)
%prm
pszIconPath, iIconIndex
pszIconPath : [wstr] 型: LPCTSTR アイコンを含むファイルの完全修飾パスを格納する、最大長 MAX_PATH の null 終端文字列へのポインター。
iIconIndex : [int] 型: int pszIconPath が指すファイル内のアイコンのインデックス。標準オーバーレイアイコンを要求するには、pszIconPath を NULL に設定し、iIconIndex を次のいずれかに設定する。
%inst
システムイメージリスト内のオーバーレイアイコンのインデックスを返す。(Unicode)

[戻り値]
型: int 成功した場合はシステムイメージリスト内のオーバーレイアイコンのインデックスを返す。失敗した場合は -1 を返す。

[備考]
アイコンオーバーレイはシステムイメージリストの一部である。これらには 2 つの識別子がある。1
つ目は、イメージリスト内の他のオーバーレイに対するオーバーレイを識別する 1 から始まるオーバーレイインデックスである。もう 1
つは、実際のイメージを識別するイメージインデックスである。これら 2
つのインデックスは、ImageList_SetOverlayImage でプライベートイメージリストにアイコンオーバーレイを追加する際に
iOverlay および iImage パラメーターにそれぞれ割り当てる値と同等である。SHGetIconOverlayIndex
はオーバーレイインデックスを返す。オーバーレイインデックスを対応するイメージインデックスに変換するには、INDEXTOOVERLAYMASK
を呼び出す。注 初期化中にイメージがシステムイメージリストに読み込まれた後は、変更できない。pszIconPath と
iIconIndex
で指定されたファイル名とインデックスはアイコンオーバーレイを識別するためにのみ使用される。SHGetIconOverlayIndex
はシステムイメージリストの変更には使用できない。
> [!NOTE] > shlobj_core.h ヘッダーは SHGetIconOverlayIndex を、UNICODE
プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または Unicode
版を自動的に選択するエイリアスとして定義している。エンコーディング中立なエイリアスとそうでないコードを混在して使用すると、コンパイルや実行時のエラーにつながる不一致が発生する場合がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
SHGetImageList
イメージリストを取得する。
%prm
iImageList, riid, ppvObj
iImageList : [int] 型: int
riid : [var] 型: REFIID イメージリストインターフェイス識別子への参照。通常は IID_IImageList。
ppvObj : [var] 型: void** このメソッドが返るときに、riid で要求されたインターフェイスポインターを格納する。これは通常 IImageList である。
%inst
イメージリストを取得する。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
ppv パラメーターで返される IImageList ポインター型は、必要に応じて (たとえばリストビューでの使用のために)
HIMAGELIST にキャストできる。逆に、HIMAGELIST を IImageList
へのポインターにキャストすることもできる。Windows Vista 以降、プロセスが dpi-aware
としてマークされている場合、SHIL_SMALL、SHIL_LARGE、および SHIL_EXTRALARGE は dpi
に応じてスケールされる。これらの種類を dpi-aware にするには、SetProcessDPIAware
を呼び出す。SHIL_JUMBO は dpi-aware の設定に関係なく 256 ピクセルに固定される。


%index
SHGetInstanceExplorer
ホストされたシェル拡張やその他のコンポーネントが、それらのホストプロセスの早期終了を防ぐためのインターフェイスを取得する。
%prm
ppunk
ppunk : [var] 型: IUnknown** この関数が成功した場合、ホストプロセスの IUnknown インターフェイスポインターのアドレスを格納する。これはホストプロセスの終了を防ぐために使用されるフリースレッドインターフェイスである。関数呼び出しが失敗した場合、この値は NULL に設定される。
%inst
ホストされたシェル拡張やその他のコンポーネントが、それらのホストプロセスの早期終了を防ぐためのインターフェイスを取得する。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
シェル拡張ハンドラーなど、DLL として実装され Windows Explorer (Explorer.exe) や Internet
Explorer (Iexplore.exe)
などのホストプロセス内で実行されるコンポーネントが多数存在する。通常、ユーザーがホストプロセスを閉じると、コンポーネントもただちにシャットダウンされる。このような突然の終了は、いくつかのコンポーネントにとって問題を引き起こす可能性がある。たとえば、コンポーネントがバックグラウンドスレッドを使用してデータをダウンロードしたりユーザーインターフェイス機能を実行したりしている場合、安全にシャットダウンするための追加時間が必要となる場合がある。SHGetInstanceExplorer
により、ホストプロセス内で実行されているコンポーネントがホストプロセスへの参照を保持できるようになる。SHGetInstanceExplorer
はホストの参照カウントをインクリメントし、ホストの IUnknown
インターフェイスへのポインターを返す。その参照を保持することで、コンポーネントはホストプロセスが早期に終了するのを防げる。コンポーネントが必要な処理を完了した後は、(*ppunk)->Release
を呼び出してホストの参照を解放し、プロセスが終了できるようにする必要がある。注 SHGetInstanceExplorer
が成功した場合、コンポーネントは不要になった時点でホストの参照を解放しなければならない。そうしなければ、プロセスに関連付けられたすべてのリソースがメモリに残ったままになる。*ppunk
が指す IUnknown インターフェイスは、この参照を解放するためにのみ使用できる。コンポーネントは
(*ppunk)->QueryInterface
を使用して他のインターフェイスポインターを要求することはできない。SHGetInstanceExplorer は、以前に
SHSetInstanceExplorer を呼び出してプロセス参照を設定したアプリケーションから呼び出された場合にのみ成功する。


%index
SHGetItemFromDataObject
IDataObject によって指定された項目に基づいて、IShellItem または関連オブジェクトを作成する。
%prm
pdtobj, dwFlags, riid, ppv
pdtobj : [var] 型: IDataObject* ソース IDataObject インスタンスへのポインター。
dwFlags : [int] 型: DATAOBJ_GET_ITEM_FLAGS ターゲットオブジェクトに関するオプションを指定する DATAOBJ_GET_ITEM_FLAGS 列挙体の 1 つ以上の値。この値は 0 でもよい。
riid : [var] 型: REFIID ppv 経由で取得するインターフェイスの IID への参照。通常は IID_IShellItem。
ppv : [var] 型: void** このメソッドが返るときに、riid で要求されたインターフェイスポインターを格納する。これは通常 IShellItem である。
%inst
IDataObject によって指定された項目に基づいて、IShellItem または関連オブジェクトを作成する。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
Objbase.h で定義されている IID_PPV_ARGS マクロを使用して riid と ppv
パラメーターをパッケージ化することを推奨する。このマクロは ppv の値が指すインターフェイスに基づいて正しい IID
を提供するため、コーディングエラーの可能性をなくせる。


%index
SHGetItemFromObject
オブジェクトの IShellItem を取得する。
%prm
punk, riid, ppv
punk : [var] 型: IUnknown* オブジェクトの IUnknown へのポインター。
riid : [var] 型: REFIID 目的の IID への参照。
ppv : [var] 型: void** このメソッドが返るときに、riid で要求されたインターフェイスポインターを格納する。これは通常 IShellItem または関連インターフェイスである。
%inst
オブジェクトの IShellItem を取得する。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
パフォーマンス上の観点から、IDList が既にフォルダにバインドされている場合はこのメソッドの方が
SHGetIDListFromObject よりも好ましい。


%index
SHGetKnownFolderIDList
known folder のパスを ITEMIDLIST 構造体として取得する。
%prm
rfid, dwFlags, hToken, ppidl
rfid : [var] 型: REFKNOWNFOLDERID フォルダを識別する KNOWNFOLDERID への参照。known folder ID に関連付けられたフォルダは、特定のシステムには存在しない場合がある。
dwFlags : [int] 型: DWORD 特殊な取得オプションを指定するフラグ。この値は 0 でもよく、それ以外の場合は 1 つ以上の KNOWN_FOLDER_FLAG 値である。
hToken : [intptr] 型: HANDLE 特定のユーザーを表すために使用するアクセストークン。このパラメーターは通常 NULL に設定し、その場合、関数は現在のユーザーのフォルダインスタンスへのアクセスを試みる。ただし、複数ユーザーを持ち得るが単一ユーザーに属するものとして扱われるフォルダの場合は、hToken に値を割り当てる必要があるかもしれない。この種類の最も一般的に使用されるフォルダは Documents である。hToken が非 null の場合、呼び出し側アプリケーションは正しい偽装を行う責任がある。TOKEN_QUERY および TOKEN_IMPERSONATE を含む、特定のユーザーに対する適切なセキュリティ特権を持っている必要があり、ユーザーのレジストリハイブが現在マウントされている必要がある。アクセス制御の詳細については、Access Control を参照。hToken パラメーターに -1 を指定すると、Default User を表す。これにより SHGetKnownFolderIDList のクライアントが Default User の Desktop フォルダなどのフォルダの場所を見つけられるようになる。Default User のユーザープロファイルは、新しいユーザーアカウントが作成されるたびに複製され、Documents や Desktop などの特殊フォルダを含む。Default User フォルダに追加した項目は、新しいユーザーアカウントすべてにも表示される。Default User フォルダへのアクセスには管理者特権が必要であることに注意。
ppidl : [var] 型: PIDLIST_ABSOLUTE* このメソッドが返るときに、フォルダの PIDL へのポインターを格納する。このパラメーターは初期化されていない状態で渡される。呼び出し側は、不要になった時点で ILFree を呼び出して返された PIDL を解放する責任がある。
%inst
known folder のパスを ITEMIDLIST 構造体として取得する。

[戻り値]
型: HRESULT 成功した場合は S_OK を、それ以外の場合は次のいずれかを含むエラー値を返す。
（以下省略）

[備考]
この関数は SHGetFolderLocation を置き換える。古い関数は今や単に SHGetKnownFolderIDList
のラッパーである。この関数を呼び出す側は少なくとも User 特権を持っている必要がある。Documents フォルダなど、いくつかの
known folder はユーザーごとである。各ユーザーは Documents フォルダに対して異なるパスを持つ。hToken が
NULL の場合、API は現在のユーザーのフォルダインスタンスへのアクセスを試みる。hToken が有効なユーザートークンの場合、API
はそのトークンを使ってユーザーを偽装し、そのユーザーのフォルダインスタンスへのアクセスを試みる。


%index
SHGetKnownFolderItem
known folder を表す IShellItem オブジェクトを取得する。
%prm
rfid, flags, hToken, riid, ppv
rfid : [var] 型: REFKNOWNFOLDERID 項目を含むフォルダを識別する GUID である KNOWNFOLDERID への参照。
flags : [int] 型: KNOWN_FOLDER_FLAG known folder の IShellItem の取得時に使用される特殊なオプションを指定するフラグ。この値は KF_FLAG_DEFAULT でもよく、それ以外の場合は 1 つ以上の KNOWN_FOLDER_FLAG 値である。
hToken : [intptr] 型: HANDLE 特定のユーザーを表すために使用するアクセストークン。このパラメーターは通常 NULL に設定し、その場合、関数は現在のユーザーのフォルダインスタンスへのアクセスを試みる。ただし、複数ユーザーを持ち得るが単一ユーザーに属するものとして扱われるフォルダの場合は、hToken に値を割り当てる必要があるかもしれない。この種類の最も一般的に使用されるフォルダは Documents である。
riid : [var] 型: REFIID 項目を表すインターフェイスの IID への参照。通常は IID_IShellItem または IID_IShellItem2。
ppv : [var] 型: void** このメソッドが返るときに、riid で要求されたインターフェイスポインターを格納する。
%inst
known folder を表す IShellItem オブジェクトを取得する。

[戻り値]
型: HRESULT 成功した場合は S_OK を、それ以外の場合は次のいずれかを含むエラー値を返す。
（以下省略）

[備考]
この関数の呼び出し側は管理者特権を持っている必要がある。public な known folder
に対してこの関数を呼び出すには、呼び出し側は管理者特権を持っている必要がある。ユーザーごとの known folder に対しては
User 特権だけが必要である。Documents フォルダなど、known folder のいくつかはユーザーごとである。各ユーザーは
Documents フォルダに対して異なるパスを持つ。hToken が NULL の場合、API
は呼び出し側アプリケーションのフォルダインスタンス (現在のユーザーのもの) へのアクセスを試みる。hToken
が有効なユーザートークンの場合、API はそのトークンを使ってユーザーを偽装し、そのユーザーのインスタンスへのアクセスを試みる。この関数は
KF_CATEGORY_FIXED および KF_CATEGORY_VIRTUAL
型のフォルダに対しては呼び出すことができない。KF_CATEGORY_COMMON
型のフォルダに対してこの関数を呼び出すには、呼び出し側アプリケーションが昇格された特権で実行されている必要がある。


%index
SHGetKnownFolderPath
フォルダの KNOWNFOLDERID で識別される既知フォルダの完全パスを取得する。
%prm
rfid, dwFlags, hToken, ppszPath
rfid : [var] 型: REFKNOWNFOLDERID フォルダを識別する KNOWNFOLDERID への参照。
dwFlags : [int] 型: DWORD 特別な取得オプションを指定するフラグ。0、または KNOWN_FOLDER_FLAG 値の 1 つ以上。
hToken : [intptr] 型: HANDLE 特定のユーザを表すアクセストークン。NULL(最も一般的)の場合は現在のユーザのフォルダを要求する。
ppszPath : [var] 型: PWSTR* メソッドから戻るとき、既知フォルダのパスを指定する NULL 終端 Unicode 文字列へのポインタのアドレスを含む。呼び出し元は成功/失敗を問わず CoTaskMemFree で解放する責任がある。末尾にバックスラッシュは付かない。
%inst
フォルダの KNOWNFOLDERID で識別される既知フォルダの完全パスを取得する。

[戻り値]
型: HRESULT 成功した場合は S_OK、それ以外はエラー値を返す。
（以下省略）

[備考]
この関数は SHGetFolderPath を置き換える。SHGetFolderPath は現在 SHGetKnownFolderPath
の単なるラッパーである。


%index
SHGetLocalizedName
シェルフォルダ内のファイルのローカライズされた名前を取得する。
%prm
pszPath, pszResModule, cch, pidsRes
pszPath : [wstr] 型: PCWSTR ファイルの完全修飾パスを指定する文字列へのポインター。
pszResModule : [wstr] 型: PWSTR この関数が返るときに、ファイル名のローカライズされたバージョンを指定する文字列リソースへのポインターを格納する。
cch : [int] 型: UINT この関数が返るときに、pszResModule の文字列のサイズ (WCHAR 単位) を格納する。
pidsRes : [var] 型: int* この関数が返るときに、リソースファイル内のローカライズされたファイル名の ID へのポインターを格納する。
%inst
シェルフォルダ内のファイルのローカライズされた名前を取得する。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
SHGetMalloc
シェルの IMalloc インターフェイスへのポインターを取得する。
%prm
ppMalloc
ppMalloc : [var] 型: LPMALLOC* シェルの IMalloc インターフェイスポインターを受け取るポインターのアドレス。
%inst
シェルの IMalloc インターフェイスへのポインターを取得する。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
SHGetMalloc は Windows 95 および Microsoft Windows NT 4.0 で導入されたが、Windows
2000 以降は不要になっている。代わりにプログラムは、同等で (より使いやすい) CoTaskMemAlloc および
CoTaskMemFree を呼び出せる。SHGetMalloc
の使用を提案または要求する古いリファレンスドキュメントを見つけた場合は、代わりに CoTaskMemAlloc と
CoTaskMemFree を使用しても構わないし、推奨される。


%index
SHGetNameFromIDList
IDList で識別される項目の表示名を取得する。
%prm
pidl, sigdnName, ppszName
pidl : [var] 型: PCIDLIST_ABSOLUTE 項目を識別する PIDL。
sigdnName : [int] 型: SIGDN 取得する表示名の種類を指定する SIGDN 列挙体の値。
ppszName : [var] 型: PWSTR* この関数が成功した場合に、取得した表示名へのポインターのアドレスを受け取る値。
%inst
IDList で識別される項目の表示名を取得する。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
ppszName が指す文字列を不要になった時点で解放するのは呼び出し側の責任である。メモリを解放するには *ppszName に対して
CoTaskMemFree を呼び出す。


%index
SHGetNewLinkInfoW
ショートカットの提案されたターゲットに基づいて新しいショートカットの名前を作成する。この関数はショートカット自体は作成せず、名前のみを作成する。(Unicode)
%prm
pszLinkTo, pszDir, pszName, pfMustCopy, uFlags
pszLinkTo : [wstr] 型: LPCTSTR ショートカットのターゲットのパスとファイル名へのポインター。uFlags に SHGNLI_PIDL 値が含まれていない場合、このパラメーターはターゲットを格納する null 終端文字列のアドレスである。uFlags に SHGNLI_PIDL 値が含まれている場合、このパラメーターはターゲットを表す PIDL である。
pszDir : [wstr] 型: LPCTSTR ショートカットが作成されるフォルダのパスを格納する null 終端文字列へのポインター。
pszName : [wstr] 型: LPTSTR ショートカットの null 終端のパスとファイル名を受け取る文字列へのポインター。このバッファーは少なくとも MAX_PATH 文字のサイズが想定される。
pfMustCopy : [var] 型: BOOL* ショートカットがコピーされるかどうかを示すフラグを受け取る BOOL 値のアドレス。別のショートカットへのショートカットを作成するとき、シェルは単にターゲットショートカットをコピーし、コピーされたショートカットを適切に変更する。pszLinkTo で指定されたターゲットがターゲットショートカットのコピーを引き起こすショートカットを指定している場合、このパラメーターは非ゼロ値を受け取る。ターゲットがコピーされるショートカットを指定していない場合、このパラメーターはゼロを受け取る。
uFlags : [int] 型: UINT
%inst

ショートカットの提案されたターゲットに基づいて新しいショートカットの名前を作成する。この関数はショートカット自体は作成せず、名前のみを作成する。(Unicode)

[戻り値]
型: BOOL 成功した場合は TRUE を、それ以外の場合は FALSE を返す。

[備考]
SHGetNewLinkInfo
は、宛先のファイルシステムが長いファイル名をサポートしているかどうかを判定する。サポートしている場合は、ショートカット名に長いファイル名が使用される。宛先のファイルシステムが長いファイル名をサポートしていない場合は、ショートカット名は
8.3 形式で返される。
> [!NOTE] > shellapi.h ヘッダーは SHGetNewLinkInfo を、UNICODE
プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または Unicode
版を自動的に選択するエイリアスとして定義している。エンコーディング中立なエイリアスとそうでないコードを混在して使用すると、コンパイルや実行時のエラーにつながる不一致が発生する場合がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
SHGetPathFromIDListW
アイテム識別子リストをファイルシステムパスに変換する。(Unicode)
%prm
pidl, pszPath
pidl : [var] 型: PCIDLIST_ABSOLUTE 名前空間のルート(デスクトップ)からのファイルまたはディレクトリ位置を指定するアイテム識別子リストのアドレス。
pszPath : [wstr] 型: LPTSTR ファイルシステムパスを受け取るバッファのアドレス。少なくとも MAX_PATH 文字サイズが必要。
%inst
アイテム識別子リストをファイルシステムパスに変換する。(Unicode)

[戻り値]
型: BOOL 成功した場合は TRUE、それ以外は FALSE。

[備考]
pidl が指定する位置がファイルシステムの一部でない場合、この関数は失敗する。pidl がショートカットを指定する場合、pszPath
はショートカット自体へのパスを含み、ターゲットへのパスではない。


%index
SHGetPathFromIDListEx
アイテム識別子リストをファイルシステムパスに変換する。この関数は、文字列バッファーの初期サイズを設定し、以下のオプションを宣言できるようにすることで SHGetPathFromIDList を拡張する。
%prm
pidl, pszPath, cchPath, uOpts
pidl : [var] 型: PCIDLIST_ABSOLUTE 名前空間のルート (デスクトップ) を基準としたファイルまたはディレクトリの場所を指定するアイテム識別子リストへのポインター。
pszPath : [wstr] 型: PWSTR この関数が呼び出されるとき、ファイルシステムパスを受け取る null 終端の Unicode バッファーが渡される。このバッファーのサイズは cchPath である。
cchPath : [int] 型: DWORD pszPath が指すバッファーのサイズ (文字単位)。
uOpts : [int] 型: GPFIDL_FLAGS これらのフラグは返されるパスの種類を決定する。
%inst

アイテム識別子リストをファイルシステムパスに変換する。この関数は、文字列バッファーの初期サイズを設定し、以下のオプションを宣言できるようにすることで
SHGetPathFromIDList を拡張する。

[戻り値]
型: BOOL 成功した場合は TRUE を、それ以外の場合は FALSE を返す。

[備考]
UNC プリンター名を除き、pidl パラメーターで指定された場所がファイルシステムの一部でない場合、この関数は失敗する。pidl
パラメーターがショートカットを指定する場合、pszPath
にはショートカットのターゲットではなく、ショートカット自体へのパスが格納される。


%index
SHGetPropertyStoreForWindow
特定のウィンドウのプロパティのコレクションを表すオブジェクトを取得し、それらのプロパティをクエリしたり設定したりできるようにする。
%prm
hwnd, riid, ppv
hwnd : [intptr] 型: HWND プロパティを取得するウィンドウへのハンドル。
riid : [var] 型: REFIID ppv 経由で取得するプロパティストアオブジェクトの IID への参照。これは通常 IID_IPropertyStore である。
ppv : [var] 型: void** この関数が返るときに、riid で要求されたインターフェイスポインターを格納する。これは通常 IPropertyStore である。
%inst
特定のウィンドウのプロパティのコレクションを表すオブジェクトを取得し、それらのプロパティをクエリしたり設定したりできるようにする。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
アプリケーションは、System.AppUserModel.ID プロパティに明示的な Application User Model ID
(AppUserModelID)
を設定するために、この関数を使用してウィンドウのプロパティストアにアクセスできる。ウィンドウのプロパティはウィンドウを閉じる前に削除する必要がある。これを行わないと、それらのプロパティが使用しているリソースがシステムに返却されない。プロパティを削除するには
PROPVARIANT 型の VT_EMPTY に設定する。ppv 経由で取得したオブジェクトに対して
IPropertyStore::SetValue を呼び出すと、プロパティと値はただちにウィンドウに格納される。したがって
IPropertyStore::Commit
を呼び出す必要はない。呼び出してもエラーは発生しないが効果はない。アプリケーションは、アプリケーションのタスクバーグループ化やジャンプリストの内容を制御するために、個々のウィンドウに
AppUserModelID
を設定する。たとえばスイートアプリケーションは、サブ機能ごとに異なるタスクバーボタンを提供し、そのサブ機能に関連するウィンドウをそのボタンの下にグループ化したい場合がある。ウィンドウレベルの
AppUserModelID
がない場合、それらのウィンドウはすべてメインプロセスの下にグループ化される。アプリケーションは、システムがアプリケーションをその状態に戻せるようにするためにも、このプロパティストアを使用してこれらの再起動プロパティを設定すべきである。
（以下省略）


%index
SHGetPropertyStoreFromIDList
アイテム識別子リスト (PIDL) へのポインターから、IPropertyStore または関連インターフェイスをサポートするオブジェクトを取得する。
%prm
pidl, flags, riid, ppv
pidl : [var] 型: PCIDLIST_ABSOLUTE アイテム ID リストへのポインター。
flags : [int] 型: GETPROPERTYSTOREFLAGS GETPROPERTYSTOREFLAGS 定数の 1 つ以上の値。このパラメーターは NULL でもよい。
riid : [var] 型: REFIID 目的のインターフェイス ID への参照。
ppv : [var] 型: void** この関数が返るときに、riid で要求されたインターフェイスポインターを格納する。これは通常 IPropertyStore または関連インターフェイスである。
%inst
アイテム識別子リスト (PIDL) へのポインターから、IPropertyStore
または関連インターフェイスをサポートするオブジェクトを取得する。


%index
SHGetPropertyStoreFromParsingName
パスまたは解析名から、項目のプロパティストアを返す。
%prm
pszPath, pbc, flags, riid, ppv
pszPath : [wstr] 型: PCWSTR 項目のパスを指定する null 終端の Unicode 文字列へのポインター。
pbc : [var] 型: IBindCtx* バインドコンテキストへのアクセスを提供する IBindCtx オブジェクトへのポインター。この値は NULL でもよい。
flags : [int] 型: GETPROPERTYSTOREFLAGS GETPROPERTYSTOREFLAGS 定数の 1 つ以上の値。このパラメーターは NULL でもよい。
riid : [var] 型: REFIID 目的のインターフェイス ID への参照。
ppv : [var] 型: void** この関数が返るときに、riid で要求されたインターフェイスポインターを格納する。これは通常 IPropertyStore または関連インターフェイスである。
%inst
パスまたは解析名から、項目のプロパティストアを返す。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
SHGetRealIDL
SHGetRealIDL は変更されるか利用できなくなる可能性がある。
%prm
psf, pidlSimple, ppidlReal
psf : [var] 型: IShellFolder* シンプル PIDL を変換する対象の IShellFolder のインスタンスへのポインター。
pidlSimple : [var] 型: PCUITEMID_CHILD 変換するシンプル PIDL。
ppidlReal : [var] 型: PITEMID_CHILD* このメソッドが返るときに、変換された完全な PIDL へのポインターを格納する。関数が失敗した場合、このパラメーターは NULL に設定される。
%inst
SHGetRealIDL は変更されるか利用できなくなる可能性がある。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
SHGetSetFolderCustomSettings
SHGetSetFolderCustomSettings は変更されるか利用できなくなる可能性がある。
%prm
pfcs, pszPath, dwReadWrite
pfcs : [var] 型: LPSHFOLDERCUSTOMSETTINGS カスタムフォルダ設定を提供または受け取る SHFOLDERCUSTOMSETTINGS 構造体へのポインター。
pszPath : [wstr] 型: PCTSTR フォルダへのパスを格納する null 終端の Unicode 文字列へのポインター。pszPath の長さは、終端の null 文字を含めて MAX_PATH 以下でなければならない。
dwReadWrite : [int] 型: DWORD
%inst
SHGetSetFolderCustomSettings は変更されるか利用できなくなる可能性がある。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
Unicode 文字列のみがサポートされる。Windows Server 2003 および Windows XP:
SHGetSetFolderCustomSettings は ANSI 文字列と Unicode 文字列の両方をサポートする。


%index
SHGetSetSettings
SHGetSetSettings は変更されるか利用できなくなる可能性がある。
%prm
lpss, dwMask, bSet
lpss : [var] 型: LPSHELLSTATE シェル状態設定を提供または受け取る SHELLSTATE 構造体へのポインター。
dwMask : [int] 型: DWORD 設定または取得する設定を示す 1 つ以上の SSF フラグ。
bSet : [int] 型: BOOL lpss の内容をシェル設定の設定に使用することを示すには TRUE、シェル設定を lpss に取得することを示すには FALSE を指定する。
%inst
SHGetSetSettings は変更されるか利用できなくなる可能性がある。


%index
SHGetSettings
現在のシェルオプション設定を取得する。
%prm
psfs, dwMask
psfs : [var] 型: LPSHELLFLAGSTATE シェルオプション設定を受け取る SHELLFLAGSTATE 構造体のアドレス。
dwMask : [int] 型: DWORD
%inst
現在のシェルオプション設定を取得する。


%index
SHGetSpecialFolderLocation
SHGetSpecialFolderLocation はサポートされておらず、将来変更されるか利用できなくなる可能性がある。代わりに SHGetFolderLocation を使用する。
%prm
hwnd, csidl, ppidl
hwnd : [intptr] 型: HWND 予約済み。
csidl : [int] 型: int 対象のフォルダを識別する CSIDL 値。
ppidl : [var] 型: PIDLIST_ABSOLUTE* 名前空間のルート (デスクトップ) を基準としたフォルダの場所を指定する PIDL。返された IDList を CoTaskMemFree を使って解放するのは呼び出し側アプリケーションの責任である。
%inst
SHGetSpecialFolderLocation はサポートされておらず、将来変更されるか利用できなくなる可能性がある。代わりに
SHGetFolderLocation を使用する。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
SHGetSpecialFolderPathW
SHGetSpecialFolderPath はサポートされていない。代わりに SHGetFolderPath を使う。(Unicode)
%prm
hwnd, pszPath, csidl, fCreate
hwnd : [intptr] 型: HWND 予約。
pszPath : [wstr] 型: LPTSTR 指定フォルダのドライブとパスを受け取る NULL 終端文字列へのポインタ。少なくとも MAX_PATH 文字サイズが必要。
csidl : [int] 型: int 対象フォルダを識別する CSIDL。仮想フォルダを指定した場合は失敗する。
fCreate : [int] 型: BOOL 存在しない場合にフォルダを作成するかを示す。非 0 なら作成する、0 なら作成しない。
%inst
SHGetSpecialFolderPath はサポートされていない。代わりに SHGetFolderPath を使う。(Unicode)

[戻り値]
型: BOOL 成功した場合は TRUE、それ以外は FALSE。

[備考]
この関数を使うには Microsoft Internet Explorer 4.0 Desktop Update
がインストールされている必要がある。shlobj_core.h は SHGetSpecialFolderPath を UNICODE
に基づく ANSI/Unicode 版のエイリアスとして定義する。


%index
SHGetTemporaryPropertyForItem
指定した項目の一時プロパティを取得する。一時プロパティは、項目に永続化されるのではなく、IShellItem オブジェクトの存続期間中だけプロパティを保持する読み書き可能なストアである。
%prm
psi, propkey, ppropvar
psi : [var] 型: IShellItem* 一時プロパティを取得する対象の項目へのポインター。
propkey : [var] 型: REFPROPERTYKEY プロパティキー。
ppropvar : [var] 型: PROPVARIANT* 項目の一時プロパティへのポインター。
%inst
指定した項目の一時プロパティを取得する。一時プロパティは、項目に永続化されるのではなく、IShellItem
オブジェクトの存続期間中だけプロパティを保持する読み書き可能なストアである。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
SHGetUnreadMailCountW
指定したユーザーの未読メッセージ数を、任意またはすべてのメールアカウントについて取得する。(Unicode)
%prm
hKeyUser, pszMailAddress, pdwCount, pFileTime, pszShellExecuteCommand, cchShellExecuteCommand
hKeyUser : [intptr] 型: HKEY 指定したユーザーに対する有効な HKEY。関数がユーザーの環境で呼び出される場合はこのパラメーターを NULL にすべきで、その場合は HKEY_CURRENT_USER が使用される。関数が SYSTEM コンテキストから呼び出される場合もこのパラメーターを NULL にすべきで、その場合は HKEY_USERS\{SID} が使用される。
pszMailAddress : [wstr] 型: LPCTSTR 指定したユーザーに属するアカウントのメールアドレスを指定する Unicode 文字列へのポインター。このパラメーターが NULL の場合、pdwCount は指定したユーザーが所有するすべてのアカウントの未読メッセージの合計数を返す。
pdwCount : [var] 型: DWORD* 未読メッセージ数を受け取る DWORD 値へのポインター。
pFileTime : [var] 型: FILETIME* FILETIME 構造体へのポインター。このパラメーターの使用方法は pszMailAddress が NULL かどうかで決まる。pszMailAddress が NULL の場合、このパラメーターは [in] パラメーターとして扱われ、フィルターを指定するため、指定した時刻より新しい未読メールのみが表示されるようになる。pszMailAddress が NULL でない場合、このパラメーターは [out] パラメーターとして扱われ、指定したユーザーおよびメールアカウントに対する直近の SHSetUnreadMailCount 呼び出しのタイムスタンプを関数が格納する FILETIME 構造体を指す。
pszShellExecuteCommand : [wstr] 型: LPCTSTR 指定したユーザーおよびメールアカウントに対する直近の SHSetUnreadMailCount 呼び出しに渡された ShellExecute コマンド文を返す文字列へのポインター。このコマンド文字列は pszMailAddress で参照されるアカウントを所有するメールアプリケーションを起動する。ShellExecute コマンドが必要ない場合、このパラメーターは NULL でもよい。pszMailAddress が NULL の場合、このパラメーターは無視され、NULL でなければならない。
cchShellExecuteCommand : [int] 型: int pszShellExecuteCommand が指す ShellExecute コマンドバッファーの最大サイズ (文字単位)。pszMailAddress が NULL の合計カウント取得時には、このパラメーターはゼロでなければならない。ShellExecute コマンド文字列が必要ない場合は NULL でもよい。
%inst
指定したユーザーの未読メッセージ数を、任意またはすべてのメールアカウントについて取得する。(Unicode)

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
SHHandleUpdateImage
SHHandleUpdateImage は変更されるか利用できなくなる可能性がある。
%prm
pidlExtra
pidlExtra : [var] 型: PCIDLIST_ABSOLUTE IShellChangeNotify::OnChange の pidl2 パラメーターで指定された、変更されたシステムイメージリスト内のインデックス。
%inst
SHHandleUpdateImage は変更されるか利用できなくなる可能性がある。

[戻り値]
型: int 失敗した場合は -1 を、成功した場合は変更されたイメージリストエントリのインデックスを返す。

[備考]
SHHandleUpdateImage は、変更通知コールバックが受け取った pidl2 パラメーターが非 NULL
の場合にのみ使用する。


%index
SHILCreateFromPath
SHILCreateFromPath は変更されるか利用できなくなる可能性がある。
%prm
pszPath, ppidl, rgfInOut
pszPath : [wstr] 型: PCWSTR 変換するパスを含む、最大長 MAX_PATH の null 終端文字列へのポインター。
ppidl : [var] 型: PIDLIST_ABSOLUTE* PIDL として表現された pszPath のパス。
rgfInOut : [var] 型: DWORD* エントリ時に、呼び出し側アプリケーションが PIDL とともに取得したい pszPath で指定されたフォルダの属性を示す DWORD 値へのポインター。終了時に、この値は要求された属性を含む。このパラメーターに指定可能な属性フラグの一覧は IShellFolder::GetAttributesOf を参照。
%inst
SHILCreateFromPath は変更されるか利用できなくなる可能性がある。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
SHInvokePrinterCommandW
プリンターオブジェクトに対してコマンドを実行する。(Unicode)
%prm
hwnd, uAction, lpBuf1, lpBuf2, fModal
hwnd : [intptr] 型: HWND 操作中に作成されるウィンドウやダイアログボックスの親ウィンドウのハンドル。
uAction : [int] 型: UINT
lpBuf1 : [wstr] 型: LPCTSTR プリンターコマンドの追加情報を含む null 終端文字列へのポインター。このパラメーターに含まれる情報は uAction の値によって決まる。
lpBuf2 : [wstr] 型: LPCTSTR プリンターコマンドの追加情報を含む null 終端文字列へのポインター。このパラメーターに含まれる情報は uAction の値によって決まる。
fModal : [int] 型: BOOL コマンドが完了するまで SHInvokePrinterCommand が戻らないように指定するには TRUE、コマンドが初期化されたらすぐに関数が戻るようにするには FALSE を指定する。
%inst
プリンターオブジェクトに対してコマンドを実行する。(Unicode)

[戻り値]
型: BOOL 成功した場合は TRUE を、それ以外の場合は FALSE を返す。

[備考]
lpBuf1
でプリンター名を指定する場合、その名前はローカルプリンターの名前か、ネットワークプリンターのサーバーと共有名のいずれかである。ネットワークプリンター名を指定する場合は、次の形式で指定する必要がある:
（以下省略）


%index
SHIsFileAvailableOffline
ファイルまたはフォルダがオフラインで使用可能かどうかを判定する。この関数はまた、ファイルがネットワーク・ローカルのオフラインファイルキャッシュ・両方の場所のうちどこから開かれるかも判定する。
%prm
pwszPath, pdwStatus
pwszPath : [wstr] 型: PCWSTR ネットワークファイルまたはディレクトリへのフルパスを指定する文字列値へのポインター。このパスは UNC 形式である必要はない。pszPath がネットワークパスでない場合、関数は E_INVALIDARG を返す。
pdwStatus : [var] 型: LPDWORD 関数が成功した場合に、次のフラグの 1 つ以上を受け取る DWORD 型の変数へのポインター。
%inst

ファイルまたはフォルダがオフラインで使用可能かどうかを判定する。この関数はまた、ファイルがネットワーク・ローカルのオフラインファイルキャッシュ・両方の場所のうちどこから開かれるかも判定する。

[戻り値]
型: HRESULT この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
pszPath がディレクトリの場合、SHIsFileAvailableOffline は
OFFLINE_STATUS_INCOMPLETE フラグを返さない。SHIsFileAvailableOffline が
OFFLINE_STATUS_LOCAL と OFFLINE_STATUS_REMOTE
の両方を返した場合、ファイルまたはディレクトリは両方の場所で開かれている。これはサーバーがオンラインのときによく見られる。


%index
SHLimitInputEdit
エディットコントロールに有効な文字の制限を設定する。
%prm
hwndEdit, psf
hwndEdit : [intptr] 型: HWND エディットコントロールのハンドル。
psf : [var] 型: IShellFolder* IShellFolder インターフェイスポインター。このオブジェクトは、無効な文字のリストと最大名長を提供する IItemNameLimits も実装している必要がある。
%inst
エディットコントロールに有効な文字の制限を設定する。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
SHLoadInProc
シェルのプロセスのコンテキスト内から指定したオブジェクトクラスのインスタンスを作成する。Windows Vista 以降:\_この関数は無効化されており、E_NOTIMPL を返す。
%prm
rclsid
rclsid : [var] 型: REFCLSID 作成するオブジェクトクラスの CLSID。
%inst
シェルのプロセスのコンテキスト内から指定したオブジェクトクラスのインスタンスを作成する。Windows Vista
以降:\_この関数は無効化されており、E_NOTIMPL を返す。

[戻り値]
型: HRESULT 成功した場合は S_OK を、それ以外の場合はエラー値を返す。Windows Vista 以降のバージョンでは常に
E_NOTIMPL を返す。

[備考]
注 この関数は Windows XP Service Pack 2 (SP2) および Windows Server 2003
まで利用可能である。Windows Vista を含む、それ以降の Windows のバージョンでは利用できない。この関数は
CoCreateInstance
関数を呼び出して要求されたオブジェクトインスタンスを作成し、返されたオブジェクトをただちに解放する。関連付けられた DLL は、その
DllCanUnloadNow 関数から S_OK を返したときに、標準の Component Object Model (COM)
のルールに従ってアンロードされる。


%index
SHLoadNonloadedIconOverlayIdentifiers
次にオーバーレイ情報を必要とする操作の際に、起動時に作成に失敗したか作成のために存在しなかったアイコンオーバーレイ識別子をロードすべきであることをシェルに通知する。既にロード済みの識別子は影響を受けない。
%prm

%inst

次にオーバーレイ情報を必要とする操作の際に、起動時に作成に失敗したか作成のために存在しなかったアイコンオーバーレイ識別子をロードすべきであることをシェルに通知する。既にロード済みの識別子は影響を受けない。

[戻り値]
型: HRESULT 常に S_OK を返す。

[備考]
SHLoadNonloadedIconOverlayIdentifiers
の呼び出しは、シェル拡張のすぐにロードされることにはつながらず、アイコンオーバーレイハンドラーがロードされることにもつながらない。SHLoadNonloadedIconOverlayIdentifiers
の呼び出しは、次にアイコンオーバーレイ情報を要求するコードが、レジストリ内のアイコンオーバーレイと既にロードされているものの比較を引き起こすような状況をもたらす。アイコンオーバーレイが新たに登録されており、システムが
15
個のアイコンオーバーレイの上限にまだ達していない場合は、新しいオーバーレイがロードされる。SHLoadNonloadedIconOverlayIdentifiers
だけでは新しいアイコンオーバーレイはロードされない。Windows Explorer
のビューの更新など、オーバーレイを使用するアクションも引き起こす必要がある。詳細は How to Implement Icon
Overlay Handlers を参照。


%index
SHMapPIDLToSystemImageListIndex
SHMapPIDLToSystemImageListIndex は変更されるか利用できなくなる可能性がある。
%prm
pshf, pidl, piIndexSel
pshf : [var] 型: IShellFolder* 項目を含むフォルダの IShellFolder インターフェイスポインター。
pidl : [var] 型: PCUITEMID_CHILD 項目の ITEMIDLIST 構造体へのポインター。
piIndexSel : [var] 型: int* この関数が成功した場合に、システムイメージリスト内の項目のオープンアイコンのインデックスを受け取る int へのポインター。項目に特別なオープンアイコンがない場合は、その通常アイコンのインデックスが返される。オープンアイコンが存在するが取得できない場合、piIndex が指す値は -1 に設定される。呼び出し側アプリケーションがオープンアイコンに関心がない場合は、このパラメーターは NULL でもよい。
%inst
SHMapPIDLToSystemImageListIndex は変更されるか利用できなくなる可能性がある。

[戻り値]
型: int 成功した場合はシステムイメージリスト内の項目の通常アイコンのインデックスを返し、それ以外の場合は -1 を返す。


%index
SHMultiFileProperties
ファイルセットに対してマージされたプロパティシートを表示する。すべてのファイルに共通するプロパティ値が表示され、異なるものについては文字列「(複数の値)」が表示される。
%prm
pdtobj, dwFlags
pdtobj : [var] 型: IDataObject* マージされたプロパティシートを表示するすべてのファイルの PIDL を提供するデータオブジェクトへのポインター。データオブジェクトは CFSTR_SHELLIDLIST クリップボード形式を使用する必要がある。親フォルダの IShellFolder::GetDisplayNameOf の実装は、SHGDN_FORPARSING フラグに応答して各項目の完全修飾ファイルシステムパスを返す必要がある。
dwFlags : [int] 型: DWORD 予約済み。0 に設定する必要がある。
%inst

ファイルセットに対してマージされたプロパティシートを表示する。すべてのファイルに共通するプロパティ値が表示され、異なるものについては文字列「(複数の値)」が表示される。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
SHObjectProperties
SHObjectProperties は変更されるか利用できなくなる可能性がある。
%prm
hwnd, shopObjectType, pszObjectName, pszPropertyPage
hwnd : [intptr] 型: HWND ダイアログボックスの親ウィンドウのハンドル。この値は NULL でもよい。
shopObjectType : [int] 型: DWORD オブジェクトの種類を指定するフラグ値。
pszObjectName : [wstr] 型: PCWSTR オブジェクト名を含む null 終端の Unicode 文字列。文字列の内容は shopObjectType に設定されたフラグによって決まる。
pszPropertyPage : [wstr] 型: PCWSTR 最初に開くプロパティシートページの名前を含む null 終端の Unicode 文字列。既定のページを指定するには、このパラメーターを NULL に設定する。
%inst
SHObjectProperties は変更されるか利用できなくなる可能性がある。

[戻り値]
型: BOOL コマンドが正常に呼び出された場合は TRUE、それ以外の場合は FALSE。


%index
SHOpenFolderAndSelectItems
特定のフォルダ内の指定した項目が選択された状態で Windows Explorer ウィンドウを開く。
%prm
pidlFolder, cidl, apidl, dwFlags
pidlFolder : [var] 型: PCIDLIST_ABSOLUTE フォルダを指定する完全修飾アイテム ID リストへのポインター。
cidl : [int] 型: UINT 選択配列 apidl 内の項目数。cidl がゼロの場合、pidlFolder は選択する単一項目を記述する完全に指定された ITEMIDLIST を指している必要がある。この関数は親フォルダを開き、その項目を選択する。
apidl : [var] 型: PCUITEMID_CHILD_ARRAY pidlFolder で参照されるターゲットフォルダ内で選択する項目それぞれを表す PIDL 構造体の配列へのポインター。
dwFlags : [int] 型: DWORD 任意のフラグ。Windows XP ではこのパラメーターは無視される。Windows Vista では次のフラグが定義されている。
%inst
特定のフォルダ内の指定した項目が選択された状態で Windows Explorer ウィンドウを開く。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
SHOpenFolderAndSelectItems を使用する前に CoInitialize または CoInitializeEx
を呼び出す必要がある。これを行わないと SHOpenFolderAndSelectItems は失敗する。


%index
SHOpenWithDialog
「ファイルを開くプログラムの選択」ダイアログボックスを表示する。
%prm
hwndParent, poainfo
hwndParent : [intptr] 型: HWND 親ウィンドウのハンドル。この値は NULL でもよい。
poainfo : [var] 型: const OPENASINFO* 結果のダイアログの内容を指定する OPENASINFO 構造体へのポインター。
%inst
「ファイルを開くプログラムの選択」ダイアログボックスを表示する。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
Windows 10
以降、OAIF_ALLOW_REGISTRATION、OAIF_FORCE_REGISTRATION、OAIF_HIDE_REGISTRATION
フラグは SHOpenWithDialog
によって無視される。「ファイルを開くプログラムの選択」ダイアログボックスは、ファイル拡張子を開く既定のプログラムを変更するためには使用できなくなった。SHOpenWithDialog
は単一のファイルを開くためにのみ使用できる。SHOpenWithDialog を OAIF_EXEC
を渡さずに呼び出した場合、ユーザーは「設定」でファイル拡張子を開く既定のプログラムを変更できることを知らせるダイアログを受け取る。


%index
SHParseDisplayName
シェル名前空間オブジェクトの表示名をアイテム識別子リストに変換し、オブジェクトの属性を返す。この関数は文字列をアイテム識別子リスト (PIDL) へのポインターに変換するための推奨方法である。
%prm
pszName, pbc, ppidl, sfgaoIn, psfgaoOut
pszName : [wstr] 型: LPCWSTR 解析する表示名を含むゼロ終端のワイド文字列へのポインター。
pbc : [var] 型: IBindCtx* 解析操作を制御するバインドコンテキスト。このパラメーターは通常 NULL に設定する。
ppidl : [var] 型: PIDLIST_ABSOLUTE* オブジェクトのアイテム識別子リストを受け取る ITEMIDLIST 型の変数へのポインターのアドレス。エラーが発生した場合、このパラメーターは NULL に設定される。
sfgaoIn : [int] 型: SFGAOF クエリする属性を指定する ULONG 値。1 つ以上の属性をクエリするには、関心のある属性を表すフラグでこのパラメーターを初期化する。利用可能な SFGAO フラグの一覧は IShellFolder::GetAttributesOf を参照。
psfgaoOut : [var] 型: SFGAOF* ULONG へのポインター。戻り時に、sfgaoIn で要求されたうちオブジェクトに対して true である属性が設定される。オブジェクトの属性フラグは 0 または SFGAO フラグの組み合わせとなる。利用可能な SFGAO フラグの一覧は IShellFolder::GetAttributesOf を参照。
%inst
シェル名前空間オブジェクトの表示名をアイテム識別子リストに変換し、オブジェクトの属性を返す。この関数は文字列をアイテム識別子リスト
(PIDL) へのポインターに変換するための推奨方法である。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
この関数はバックグラウンドスレッドから呼び出すべきである。そうしないと UI が応答しなくなる可能性がある。


%index
SHPathPrepareForWriteW
パスが存在するかどうかをチェックする。(Unicode)
%prm
hwnd, punkEnableModless, pszPath, dwFlags
hwnd : [intptr] 型: HWND 作成する必要のあるユーザーインターフェイスウィンドウに使用される親ウィンドウを指定するウィンドウへのハンドル。NULL に設定すると、ユーザーインターフェイスウィンドウは作成されない。
punkEnableModless : [var] 型: IUnknown* EnableModeless メソッドを実装する IOleInPlaceActiveObject オブジェクトを指定する IUnknown インターフェイスへのポインター。
pszPath : [wstr] 型: LPCTSTR 書き込みに有効かを検証するパスを指定する、最大長 MAX_PATH の null 終端文字列へのポインター。これは UNC またはファイルドライブのパスでもよい。
dwFlags : [int] 型: DWORD
%inst
パスが存在するかどうかをチェックする。(Unicode)

[戻り値]
型: HRESULT パスが利用可能な場合は S_OK を、それ以外の場合はエラーコードを返す。S_OK
の戻り値はメディアが書き込み可能であることを意味するわけではなく、単にパスが利用可能であることを意味することに注意。

[備考]
この関数の主な用途は、プログラムがパスを使用する前にチェックし、ユーザーに促す必要なユーザーインターフェイスを表示することである。たとえば
A: ドライブのディスクが入っていない場合、ユーザーにディスクを挿入するよう促すウィンドウが表示される。
> [!NOTE] > shlobj_core.h ヘッダーは SHPathPrepareForWrite を、UNICODE
プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または Unicode
版を自動的に選択するエイリアスとして定義している。エンコーディング中立なエイリアスとそうでないコードを混在して使用すると、コンパイルや実行時のエラーにつながる不一致が発生する場合がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
SHPropStgCreate
要求されたプロパティセット操作に対するコードページの取得や割り当てを適切に処理する。
%prm
psstg, fmtid, pclsid, grfFlags, grfMode, dwDisposition, ppstg, puCodePage
psstg : [var] 型: IPropertySetStorage* IPropertySetStorage インターフェイスへのポインター。
fmtid : [var] 型: REFFMTID 開くプロパティセット ID。このパラメーターの値は、Predefined Property Set Format Identifiers で定義されているものか、登録した他の任意の FMTID のいずれかである。
pclsid : [var] 型: const CLSID* セットに関連付けられた CLSID へのポインター。このパラメーターは NULL でもよい。
grfFlags : [int] 型: DWORD プロパティセットの作成と開き方を決定する PROPSETFLAG 列挙体の 1 つ以上のメンバー。ANSI バイトを含むセットはすべて PROPSETFLAG_ANSI で作成すべきで、それ以外は PROPSETFLAG_DEFAULT を使用する。
grfMode : [int] 型: DWORD オブジェクトの作成と削除の条件、およびオブジェクトのアクセスモードを示す STGM 列挙体のフラグ。STGM_DIRECT | STGM_SHARE_EXCLUSIVE を含む必要がある。
dwDisposition : [int] 型: DWORD
ppstg : [var] 型: IPropertyStorage** このメソッドが返るときに、IPropertyStorage インターフェイスポインターを格納する。
puCodePage : [var] 型: UINT* このメソッドが返るときに、セットのコードページ ID のアドレスを格納する。
%inst
要求されたプロパティセット操作に対するコードページの取得や割り当てを適切に処理する。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
SHPropStgReadMultiple
非推奨のプロパティセットに対して ANSI と Unicode の変換が適切に処理されるよう、IPropertyStorage::ReadMultiple 関数をラップする。
%prm
pps, uCodePage, cpspec, rgpspec, rgvar
pps : [var] 型: IPropertyStorage* プロパティストアを識別する IPropertyStorage インターフェイスポインター。
uCodePage : [int] 型: UINT ANSI 文字列プロパティ用のコードページ値。
cpspec : [int] 型: ULONG 読み取るプロパティの数。
rgpspec : [var] 型: PROPSPEC const[] 読み取るプロパティの配列。
rgvar : [var] 型: PROPVARIANT[] この関数が成功した場合に、プロパティ値を受け取る PROPVARIANT 型の配列。
%inst
非推奨のプロパティセットに対して ANSI と Unicode
の変換が適切に処理されるよう、IPropertyStorage::ReadMultiple 関数をラップする。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
SHPropStgWriteMultiple
非推奨のプロパティセットに対して ANSI と Unicode の変換が適切に処理されるよう、IPropertyStorage::WriteMultiple 関数をラップする。
%prm
pps, puCodePage, cpspec, rgpspec, rgvar, propidNameFirst
pps : [var] 型: IPropertyStorage* プロパティストアを識別する IPropertyStorage インターフェイスポインター。
puCodePage : [var] 型: UINT* ANSI 文字列プロパティ用のコードページ値へのポインター。
cpspec : [int] 型: ULONG 設定するプロパティの数。
rgpspec : [var] 型: PROPSPEC const[] 設定するプロパティ情報を含む PROPSPEC 構造体の配列。
rgvar : [var] 型: PROPVARIANT[] プロパティ値を設定する PROPVARIANT 型の配列。
propidNameFirst : [int] 型: PROPID プロパティ識別子を割り当てる必要がある場合の最小値。値は PID_FIRST_USABLE 以上でなければならない。
%inst
非推奨のプロパティセットに対して ANSI と Unicode
の変換が適切に処理されるよう、IPropertyStorage::WriteMultiple 関数をラップする。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
SHQueryUserNotificationState
現在のユーザーに対して通知を送信するのが適切かを判定するため、コンピューターの状態をチェックする。
%prm
pquns
pquns : [var] 型: QUERY_USER_NOTIFICATION_STATE* この関数が返るときに、QUERY_USER_NOTIFICATION_STATE 列挙体の値の 1 つへのポインターを格納する。
%inst
現在のユーザーに対して通知を送信するのが適切かを判定するため、コンピューターの状態をチェックする。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
アプリケーションは、Shell_NotifyIcon が生成するバルーン通知に類似する通知 UI
を表示する前に、SHQueryUserNotificationState を呼び出して戻り値をテストすべきである。通知は、この API が
QNS_ACCEPTS_NOTIFICATIONS
を返したときにのみ表示すべきである。これにより、ユーザーが中断されてはならないプロセスを実行しているかどうかをアプリケーションに通知する。トップレベルウィンドウは、ユーザーがプレゼンテーション設定をオン/オフしたときや、ユーザーセッションがロック/ロック解除されたときに
WM_SETTINGCHANGE
メッセージを受信する。ユーザーがフルスクリーンアプリケーションを開始または停止したときには通知が送信されないことに注意。この関数が
QUNS_QUIET_TIME を返した場合、通知は重要なものに限り表示すべきである。


%index
SHRemoveLocalizedName
シェルフォルダ内のファイルのローカライズされた名前を削除する。
%prm
pszPath
pszPath : [wstr] 型: PCWSTR ターゲットファイルの完全修飾パスを指定する null 終端の Unicode 文字列へのポインター。
%inst
シェルフォルダ内のファイルのローカライズされた名前を削除する。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
SHSetLocalizedName で表示名文字列が設定されると、Windows Explorer
はファイル名の代わりにその文字列を表示用に使用する。ファイルへのパスは変更されない。アプリケーションは
IShellFolder::GetDisplayNameOf メソッドを使い、SIGDN_NORMALDISPLAY フラグで表示
(ローカライズされた) 名を、SIGDN_DESKTOPABSOLUTEPARSING で解析 (ローカライズされていない)
名を取得できる。SHRemoveLocalizedName を呼び出すと、表示名は解析名と同一になる。


%index
SHReplaceFromPropSheetExtArray
プロパティシート拡張配列内の各プロパティシートにページを置き換えるよう要求する。各ページは最大 1 回の置換が許可される。
%prm
hpsxa, uPageID, lpfnReplaceWith, lParam
hpsxa : [intptr] 型: HPSXA SHCreatePropSheetExtArray の呼び出しから返されたプロパティシート配列ハンドル (HPSXA)。
uPageID : [int] 型: UINT 置き換えるページの ID。
lpfnReplaceWith : [int] 型: LPFNADDPROPSHEETPAGE プロパティシートにページを追加するためにプロパティシート拡張が使用する AddPropSheetPageProc 関数へのポインター。
lParam : [intptr] 型: LPARAM アプリケーション定義の値。
%inst
プロパティシート拡張配列内の各プロパティシートにページを置き換えるよう要求する。各ページは最大 1 回の置換が許可される。

[戻り値]
型: UINT 実際に行われた置換の数。


%index
SHResolveLibrary
ライブラリ内のすべての場所を、移動または名前変更されたものも含めて解決する。
%prm
psiLibrary
psiLibrary : [var] 型: IShellItem* ライブラリを表す IShellItem オブジェクトへのポインター。
%inst
ライブラリ内のすべての場所を、移動または名前変更されたものも含めて解決する。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]

この関数は、指定したライブラリ内のすべての場所を解決するのにかかる時間だけ呼び出し元スレッドをブロックする可能性がある。呼び出し元のスレッドをブロックするため、ユーザーインターフェイスとのやり取りも処理するスレッドからは呼び出すべきではない。この関数は、指定したライブラリ内のすべての場所を
1 回の呼び出しで解決する。ライブラリ内の個々の場所を解決するには、IShellLibrary::ResolveFolder
メソッドまたは SHResolveFolderPathInLibrary 関数を参照。


%index
SHRestricted
SHRestricted は変更されるか利用できなくなる可能性がある。
%prm
rest
rest : [int] 型: RESTRICTIONS RESTRICTIONS 列挙型に記述されたフラグの 1 つを指定する。
%inst
SHRestricted は変更されるか利用できなくなる可能性がある。

[戻り値]
型: DWORD 指定した制限が有効な場合は非ゼロを、それ以外の場合はゼロを返す。


%index
SHSetDefaultProperties
シェル項目に既定のプロパティセットを適用する。
%prm
hwnd, psi, dwFileOpFlags, pfops
hwnd : [intptr] 型: HWND エラー通知を受信する項目の親ウィンドウへのハンドル。この値は NULL でもよい。
psi : [var] 型: IShellItem* 項目を表す IShellItem オブジェクトへのポインター。
dwFileOpFlags : [int] 型: DWORD 操作をカスタマイズするフラグ。フラグ値については IFileOperation::SetOperationFlags を参照。
pfops : [var] 型: IFileOperationProgressSink* 操作の進行状況を追跡するために使用される IFileOperationProgressSink オブジェクトへのポインター。詳細は IFileOperation::Advise を参照。この値は NULL でもよい。
%inst
シェル項目に既定のプロパティセットを適用する。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
既定値を設定するプロパティのリストは、項目のファイル関連付けに対応する ProgID 配下の SetDefaultsFor
レジストリエントリに由来する。リストには「prop:」というプレフィックスが付き、たとえば「prop:System.Author;System.Document.DateCreated」のように、既定値を設定するプロパティの正規名が含まれる。このリストに指定可能なプロパティは
System.Author、System.Document.DateCreated、System.Photo.DateTaken
である。SetDefaultsFor エントリが ProgID に存在しない場合、この関数は HKEY_CLASSES_ROOT\* の
SetDefaultsFor エントリにある既定値を使用する。


%index
SHSetFolderPathW
非推奨。CSIDL によって識別されるシステムフォルダに新しいパスを割り当てる。(Unicode)
%prm
csidl, hToken, dwFlags, pszPath
csidl : [int] 型: int パスを設定するフォルダを識別する CSIDL 値。物理フォルダのみが有効である。仮想フォルダを指定するとこの関数は失敗する。文字列が提供されたとおりにレジストリに書き込まれることを保証するには、CSIDL に CSIDL_FLAG_DONT_UNEXPAND 値を加える。CSIDL_FLAG_DONT_UNEXPAND フラグを含めない場合、パスの一部が %USERPROFILE% などの環境文字列に置き換えられる場合がある。
hToken : [intptr] 型: HANDLE 特定のユーザーを表すために使用できるアクセストークン。このパラメーターは通常 NULL に設定し、その場合、関数は現在のユーザーのフォルダインスタンスへのアクセスを試みる。ただし、複数ユーザーを持ち得るが単一ユーザーに属するものとして扱われるフォルダの場合は、hToken に値を割り当てる必要があるかもしれない。この種類の最も一般的に使用されるフォルダは Documents である。hToken が非 null の場合、呼び出し側アプリケーションは正しい偽装を行う責任がある。TOKEN_QUERY および TOKEN_IMPERSONATE を含む、特定のユーザーに対する適切なセキュリティ特権を持っている必要があり、ユーザーのレジストリハイブが現在マウントされている必要がある。アクセス制御の詳細については、Access Control を参照。
dwFlags : [int] 型: DWORD 予約済み。0 に設定する必要がある。
pszPath : [wstr] 型: LPCTSTR フォルダの新しいパスを格納する、長さ MAX_PATH の null 終端文字列へのポインター。この値を NULL にすることはできず、文字列の長さがゼロであってもならない。
%inst
非推奨。CSIDL によって識別されるシステムフォルダに新しいパスを割り当てる。(Unicode)

[戻り値]
型: HRESULT 標準の HRESULT コードを返す。次のものを含む:
（以下省略）

[備考]
注 Windows Vista 以降、この関数は単に SHSetKnownFolderPath のラッパーとなった。CSIDL
値は対応する KNOWNFOLDERID に変換され、SHSetKnownFolderPath
が呼び出される。新しいアプリケーションは、後方互換性のためにのみサポートされている古い CSIDL システムではなく、known
folder システムを使用すべきである。SHSetFolderPath は Shell32.dll
から名前ではエクスポートされていない。この関数を使うには、SHSetFolderPathA (ANSI 文字列用) は序数 231
で、SHSetFolderPathW (Unicode 文字列用) は序数 232 で GetProcAddress
を呼び出して関数ポインターを取得する必要がある。フォルダ名には ANSI で表現できない Unicode
文字が含まれる可能性があるため、パスは Unicode 文字列で表現することを推奨する。
> [!NOTE] > shlobj_core.h ヘッダーは SHSetFolderPath を、UNICODE
プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または Unicode
版を自動的に選択するエイリアスとして定義している。エンコーディング中立なエイリアスとそうでないコードを混在して使用すると、コンパイルや実行時のエラーにつながる不一致が発生する場合がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
SHSetInstanceExplorer
ホストされたシェル拡張やその他のコンポーネントが、それらのホストプロセスの早期終了を防ぐためのインターフェイスを提供する。
%prm
punk
punk : [var] 型: IUnknown* フリースレッドの IUnknown へのポインター。コンポーネントは (SHGetInstanceExplorer を介して) このインターフェイスを使ってホストプロセスの終了を防ぐことができる。この値は NULL でもよく、その場合、プロセス参照はコンポーネントから利用できなくなる。
%inst
ホストされたシェル拡張やその他のコンポーネントが、それらのホストプロセスの早期終了を防ぐためのインターフェイスを提供する。

[備考]
Windows Explorer と Internet Explorer
は、シェル拡張などのコンポーネントがプロセスの存続期間を延長できるようにするために SHSetInstanceExplorer
を使用できる。他のアプリケーションも同じ機能を提供するために SHSetInstanceExplorer
を使用できる。たとえば、ブラウザのメッセージループとプロキシデスクトップは、他のスレッドが自分たちの存続期間を延長できるようにするために
SHSetInstanceExplorer を使用する。Windows Explorer と Internet Explorer
以外のアプリケーションがこの関数を呼び出すと、互換性の問題に遭遇する可能性がある。なぜなら、いくつかのコンポーネントは Windows
Explorer や Internet Explorer 内でホストされているかどうかを検出するために
SHGetInstanceExplorer を使用するからである。SHSetInstanceExplorer
に渡されるインターフェイスポインターはフリースレッドオブジェクトを参照していなければならない。コンポーネントが
SHGetInstanceExplorer を呼び出すたびに、システムはインターフェイスポインターを呼び出し側コンポーネントに返す前に
AddRef メソッドを呼び出す。コンポーネントは処理が完了したときに IUnknown::Release
メソッドを呼び出す。SHSetInstanceExplorer
を呼び出したプロセスは、提供されたインターフェイスポインターの参照カウントが非ゼロの間は終了してはならない。コンポーネントがプロセス参照をどのように使用するかの詳細は、SHGetInstanceExplorer
を参照。


%index
SHSetKnownFolderPath
known folder を新しい場所にリダイレクトする。
%prm
rfid, dwFlags, hToken, pszPath
rfid : [var] 型: REFKNOWNFOLDERID known folder を識別する GUID。
dwFlags : [int] 型: DWORD 0 または次の値。
hToken : [intptr] 型: HANDLE 特定のユーザーを表すために使用するアクセストークン。このパラメーターは通常 NULL に設定し、その場合、関数は現在のユーザーのフォルダインスタンスへのアクセスを試みる。ただし、複数ユーザーを持ち得るが単一ユーザーに属するものとして扱われるフォルダの場合は、hToken に値を割り当てる必要があるかもしれない。この種類の最も一般的に使用されるフォルダは Documents である。
pszPath : [wstr] 型: PCWSTR フォルダの新しいパスへのポインター。これは長さ MAX_PATH の null 終端 Unicode 文字列である。このパスの長さはゼロであってはならない。
%inst
known folder を新しい場所にリダイレクトする。

[戻り値]
型: HRESULT 成功した場合は S_OK を、それ以外の場合は次のいずれかを含むエラー値を返す。
（以下省略）

[備考]
この関数は SHSetFolderPath を置き換える。古い関数は今や単に SHSetKnownFolderPath
のラッパーである。この関数の呼び出し側は管理者特権を持っている必要がある。public な known folder
に対してこの関数を呼び出すには、呼び出し側は管理者特権を持っている必要がある。ユーザーごとの known folder に対しては
User 特権だけが必要である。Documents フォルダなど、known folder のいくつかはユーザーごとである。各ユーザーは
Documents フォルダに対して異なるパスを持つ。hToken が NULL の場合、API
は呼び出し側アプリケーションのフォルダインスタンス (現在のユーザーのもの) へのアクセスを試みる。hToken
が有効なユーザートークンの場合、API はそのトークンを使ってユーザーを偽装し、そのユーザーのインスタンスへのアクセスを試みる。この関数は
KF_CATEGORY_FIXED および KF_CATEGORY_VIRTUAL
型のフォルダに対しては呼び出すことができない。KF_CATEGORY_COMMON
型のフォルダに対してこの関数を呼び出すには、呼び出し側アプリケーションが昇格された特権で実行されている必要がある。


%index
SHSetLocalizedName
シェルフォルダ内のファイルのローカライズされた名前を設定する。
%prm
pszPath, pszResModule, idsRes
pszPath : [wstr] 型: PCWSTR ターゲットファイルの完全修飾パスを指定する文字列へのポインター。
pszResModule : [wstr] 型: PCWSTR ファイル名のローカライズされたバージョンを指定する文字列リソースへのポインター。
idsRes : [int] 型: int 文字列リソース内のローカライズされたファイル名を指定する整数 ID。
%inst
シェルフォルダ内のファイルのローカライズされた名前を設定する。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
この文字列が設定されていると、Explorer はファイル名の代わりにこの文字列を表示する。ファイルへのパスは変更されない。
アプリケーションは、IShellFolder::GetDisplayNameOf に SIGDN_NORMALDISPLAY
フラグを指定して表示 (ローカライズされた) 名を、IShellItem::GetDisplayName に
SIGDN_DESKTOPABSOLUTEPARSING フラグを指定して解析 (ローカライズされていない)
名を取得できる。SHRemoveLocalizedName を呼び出すと、表示名は解析名と同一になる。


%index
SHSetTemporaryPropertyForItem
指定した項目に一時プロパティを設定する。一時プロパティは、項目に書き戻されるのではなく、IShellItem オブジェクトの存続期間中だけプロパティを保持する読み書き可能なストアに保持される。
%prm
psi, propkey, propvar
psi : [var] 型: IShellItem* 一時プロパティを設定する対象の項目へのポインター。
propkey : [var] 型: REFPROPERTYKEY 設定する一時プロパティを識別する PROPERTYKEY への参照。
propvar : [var] 型: REFPROPVARIANT 一時プロパティの値を格納する PROPVARIANT への参照。
%inst
指定した項目に一時プロパティを設定する。一時プロパティは、項目に書き戻されるのではなく、IShellItem
オブジェクトの存続期間中だけプロパティを保持する読み書き可能なストアに保持される。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
一時値は、SHGetTemporaryPropertyForItem または IShellItem2::GetPropertyStore
に GPS_TEMPORARY を渡すことでのみ読み取ることができる。


%index
SHSetUnreadMailCountW
現在のユーザーの指定したメールアカウントの未読メッセージ数をレジストリに格納する。(Unicode)
%prm
pszMailAddress, dwCount, pszShellExecuteCommand
pszMailAddress : [wstr] 型: LPCTSTR 現在のユーザーの完全なメールアドレスを格納する Unicode 文字列へのポインター。
dwCount : [int] 型: DWORD 未読メッセージの数。
pszShellExecuteCommand : [wstr] 型: LPCTSTR ShellExecute に渡せるコマンドのフルテキストを格納する Unicode 文字列へのポインター。このコマンドは pszMailAddress で参照されるアカウントを所有するメールアプリケーションを起動する。
%inst
現在のユーザーの指定したメールアカウントの未読メッセージ数をレジストリに格納する。(Unicode)

[戻り値]
型: HRESULT 次の値を含み得る HRESULT。
（以下省略）

[備考]

この関数がレジストリを更新すると、新しいレジストリエントリには現在の時刻と日付が自動的にスタンプされる。同じメール名を指定する異なる独立系ソフトウェアベンダー
(ISV) からこの関数が呼び出された場合、最後の呼び出しのみが保存される。つまり、この関数を呼び出すと、異なる ISV
による呼び出しであっても、同じメールアドレスに対して以前に保存された値が上書きされる。未読メッセージ数は、ユーザーアカウントの主受信トレイに対してのみ設定することを推奨する。下書きや削除済みアイテムなどのサブフォルダ内のメールは無視すべきである。メールクライアントはアプリケーションの終了時に未読メッセージ数を
0 に設定してはならない。なぜなら、これは未読メッセージ数を 0 と誤って報告することにつながるからである。この関数は
HKEY_CURRENT_USER を使用するため、ユーザーを偽装するシステムプロセスから呼び出すべきではない。


%index
SHShellFolderView_Message
SHShellFolderView_Message は変更されるか利用できなくなる可能性がある。
%prm
hwndMain, uMsg, lParam
hwndMain : [intptr] 型: HWND メッセージを受信するウィンドウへのハンドル。
uMsg : [int] 型: UINT 送信するメッセージ。指定可能なメッセージの一覧は次のとおり。
lParam : [intptr] 型: LPARAM この値の内容は uMsg で渡されるメッセージによって決まる。詳細は個々のメッセージのトピックを参照。
%inst
SHShellFolderView_Message は変更されるか利用できなくなる可能性がある。

[戻り値]
型: LRESULT 戻り値は uMsg で渡されるメッセージによって決まる。詳細は個々のメッセージのトピックを参照。


%index
SHShowManageLibraryUI
ユーザーがライブラリのフォルダと既定の保存場所を管理できるライブラリ管理ダイアログボックスを表示する。
%prm
psiLibrary, hwndOwner, pszTitle, pszInstruction, lmdOptions
psiLibrary : [var] 型: IShellItem* 管理対象のライブラリを表す IShellItem オブジェクトへのポインター。
hwndOwner : [intptr] 型: HWND ライブラリ管理ダイアログボックスのオーナーウィンドウのハンドル。このパラメーターの値は NULL でもよい。
pszTitle : [wstr] 型: LPCWSTR ライブラリ管理ダイアログのタイトルへのポインター。汎用タイトル文字列を表示するには、このパラメーターの値を NULL に設定する。
pszInstruction : [wstr] 型: LPCWSTR ライブラリ管理ダイアログボックスのタイトル文字列の下に表示するヘルプ文字列へのポインター。汎用ヘルプ文字列を表示するには、このパラメーターの値を NULL に設定する。
lmdOptions : [int] 型: LIBRARYMANAGEDIALOGOPTIONS 管理ダイアログボックスの動作を指定する LIBRARYMANAGEDIALOGOPTIONS 列挙体の値。
%inst
ユーザーがライブラリのフォルダと既定の保存場所を管理できるライブラリ管理ダイアログボックスを表示する。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
SHSimpleIDListFromPath
非推奨。パスを渡されると ITEMIDLIST 構造体へのポインターを返す。
%prm
pszPath
pszPath : [wstr] 型: PCWSTR PIDL に変換するパスを含む null 終端文字列へのポインター。
%inst
非推奨。パスを渡されると ITEMIDLIST 構造体へのポインターを返す。

[戻り値]
型: PIDLIST_ABSOLUTE 成功した場合は ITEMIDLIST 構造体へのポインターを返し、それ以外の場合は NULL
を返す。

[備考]
Windows 7 より前では、この関数は Shlobj.h で宣言されていた。Windows 7 以降では Shobjidl.h
で宣言される。注 この関数は Windows 7 および Windows Server 2003 まで利用可能である。将来の
Windows のバージョンでは存在しなくなる可能性がある。この関数の代替案は次のとおりである:
（以下省略）


%index
SHStartNetConnectionDialogW
SHStartNetConnectionDialog は変更されるか利用できなくなる可能性がある。(Unicode)
%prm
hwnd, pszRemoteName, dwType
hwnd : [intptr] 型: HWND 親ウィンドウへのハンドル。
pszRemoteName : [wstr] 型: LPCTSTR リモートネットワーク名を指定する null 終端文字列へのポインター。この値は NULL に設定してもよい。
dwType : [int] 型: DWORD
%inst
SHStartNetConnectionDialog は変更されるか利用できなくなる可能性がある。(Unicode)

[戻り値]
型: HRESULT 常に S_OK を返す。

[備考]
> [!NOTE] > shlobj_core.h ヘッダーは SHStartNetConnectionDialog を、UNICODE
プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または Unicode
版を自動的に選択するエイリアスとして定義している。エンコーディング中立なエイリアスとそうでないコードを混在して使用すると、コンパイルや実行時のエラーにつながる不一致が発生する場合がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
SHTestTokenMembership
CheckTokenMembership を使用して、指定したトークンが指定された RID を持つローカルグループのメンバーかどうかをテストする。
%prm
hToken, ulRID
hToken : [intptr] 型: HANDLE トークンへのハンドル。この値は NULL でもよい。
ulRID : [int] 型: ULONG メンバーシップをテストする対象のローカルグループの RID。
%inst
CheckTokenMembership を使用して、指定したトークンが指定された RID
を持つローカルグループのメンバーかどうかをテストする。

[戻り値]
型: BOOL 成功した場合は TRUE を、失敗した場合は FALSE を返す。

[備考]
この関数は CheckTokenMembership をラップし、ローカルグループのみをチェックする。


%index
SHUpdateImageW
システムイメージリスト内のイメージが変更されたことをシェルに通知する。(Unicode)
%prm
pszHashItem, iIndex, uFlags, iImageIndex
pszHashItem : [wstr] 型: LPCTSTR アイコンを含むファイルの完全修飾パスを指定する文字列値へのポインター。IExtractIcon::GetIconLocation の szIconFile パラメーターが指すバッファーで返されたパスを使用する。
iIndex : [int] 型: int pszHashItem で指定されたファイル内のアイコンのゼロから始まるインデックスを指定する整数。IExtractIcon::GetIconLocation の piIndex パラメーターが指す値を使用する。
uFlags : [int] 型: UINT アイコンの属性を決定するフラグを指定する符号なし整数。uFlags は IExtractIcon::GetIconLocation の pwFlags パラメーターが指す値に設定する。SHUpdateImage に関連するフラグは GIL_NOTFILENAME と GIL_SIMULATEDOC である。
iImageIndex : [int] 型: int 更新されるアイコンのシステムイメージリスト内のインデックスを指定する整数。
%inst
システムイメージリスト内のイメージが変更されたことをシェルに通知する。(Unicode)

[備考]
更新したいアイコンのシステムイメージリスト内のインデックスがわからない場合は、uFlags パラメーターを
SHGFI_SYSICONINDEX に設定して SHGetFileInfo
を使用する。IExtractIcon::GetIconLocation
は、置き換えたい新しいアイコンではなく、更新が必要な古いアイコンのパラメーターで使用しなければならない。
> [!NOTE] > shlobj_core.h ヘッダーは SHUpdateImage を、UNICODE
プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または Unicode
版を自動的に選択するエイリアスとして定義している。エンコーディング中立なエイリアスとそうでないコードを混在して使用すると、コンパイルや実行時のエラーにつながる不一致が発生する場合がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
SHValidateUNC
SHValidateUNC は変更されるか利用できなくなる可能性がある。
%prm
hwndOwner, pszFile, fConnect
hwndOwner : [intptr] 型: HWND 親ウィンドウのハンドル。UI を表示するために使用される。これが必要ない場合、この値は NULL に設定できる。
pszFile : [wstr] 型: PWSTR 検証する UNC パスを指定する null 終端の Unicode 文字列へのポインター。注: この文字列は定数文字列であってはならない。
fConnect : [int] 型: UINT
%inst
SHValidateUNC は変更されるか利用できなくなる可能性がある。

[戻り値]
型: BOOL UNC パスが存在する場合は TRUE を返す。UNC パスが存在しない場合や、その他の失敗が発生した場合は FALSE
を返す。


%index
SetCurrentProcessExplicitAppUserModelID
現在のプロセスをタスクバーに対して識別する、アプリケーション定義の一意な Application User Model ID (AppUserModelID) を指定する。この識別子により、アプリケーションは関連するプロセスとウィンドウを単一のタスクバーボタンの下にグループ化できる。
%prm
AppID
AppID : [wstr] 型: PCWSTR 現在のプロセスに割り当てる AppUserModelID へのポインター。
%inst
現在のプロセスをタスクバーに対して識別する、アプリケーション定義の一意な Application User Model ID
(AppUserModelID)
を指定する。この識別子により、アプリケーションは関連するプロセスとウィンドウを単一のタスクバーボタンの下にグループ化できる。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
このメソッドはアプリケーションの初期起動ルーチン中、UI を表示したりジャンプリストを操作したりする前に呼び出さなければならない。これには
SHAddToRecentDocs の呼び出しも含まれる。


%index
ShellAboutW
ShellAbout ダイアログボックスを表示する。(Unicode)
%prm
hWnd, szApp, szOtherStuff, hIcon
hWnd : [intptr] 型: HWND 親ウィンドウへのウィンドウハンドル。このパラメーターは NULL でもよい。
szApp : [wstr] 型: LPCTSTR ShellAbout ダイアログボックスのタイトルバーと、ダイアログボックスの最初の行の「Microsoft」テキストの後に表示されるテキストを格納する null 終端文字列へのポインター。テキストに区切り文字 (#) が含まれていてそれによって 2 つの部分に分けられる場合、関数は最初の部分をタイトルバーに、2 番目の部分を「Microsoft」テキストの後の最初の行に表示する。
szOtherStuff : [wstr] 型: LPCTSTR バージョンと著作権情報の後にダイアログボックスに表示するテキストを格納する null 終端文字列へのポインター。このパラメーターは NULL でもよい。
hIcon : [intptr] 型: HICON ダイアログボックスに表示するアイコンのハンドル。このパラメーターは NULL でもよく、その場合は Windows のアイコンが表示される。
%inst
ShellAbout ダイアログボックスを表示する。(Unicode)

[戻り値]
型: int 成功した場合は TRUE を、それ以外の場合は FALSE を返す。

[備考]
ShellAbout 関数のダイアログボックスは Windows 固有のテキストと既定のアイコンを使用することに注意。ShellAbout
ダイアログボックスの例を見るには、Windows Explorer のヘルプメニューのドロップダウンリストから「Windows
のバージョン情報」を選択する。
> [!NOTE] > shellapi.h ヘッダーは ShellAbout を、UNICODE
プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または Unicode
版を自動的に選択するエイリアスとして定義している。エンコーディング中立なエイリアスとそうでないコードを混在して使用すると、コンパイルや実行時のエラーにつながる不一致が発生する場合がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
ShellExecuteW
指定されたファイルに対する操作を実行する。(ShellExecuteW)
%prm
hwnd, lpOperation, lpFile, lpParameters, lpDirectory, nShowCmd
hwnd : [intptr] 型: HWND UI やエラーメッセージを表示するための親ウィンドウへのハンドル。ウィンドウに関連しない操作の場合は NULL を指定可能。
lpOperation : [wstr] 型: LPCTSTR 実行するアクション(verb)を指定する NULL 終端文字列へのポインタ。使用可能な verb はファイルやフォルダによって異なる。一般にオブジェクトのショートカットメニューから使用可能なアクションが verb として使える。
lpFile : [wstr] 型: LPCTSTR 指定された verb を実行するファイルまたはオブジェクトを指定する NULL 終端文字列へのポインタ。Shell 名前空間オブジェクトを指定するには完全修飾 parse name を渡す。すべての verb がすべてのオブジェクトでサポートされるわけではない。
lpParameters : [wstr] 型: LPCTSTR lpFile が実行ファイルの場合、アプリケーションに渡すパラメータを指定する NULL 終端文字列へのポインタ。書式は呼び出される verb に依存する。lpFile がドキュメントファイルの場合は NULL にすべき。
lpDirectory : [wstr] 型: LPCTSTR アクションの既定(作業)ディレクトリを指定する NULL 終端文字列へのポインタ。NULL の場合、現在の作業ディレクトリが使用される。
nShowCmd : [int] 型: INT アプリケーションを開くときにどのように表示するかを指定するフラグ。lpFile がドキュメントファイルの場合、フラグは単に関連アプリケーションに渡される。ShowWindow の nCmdShow パラメータに指定可能な任意の値。
%inst
指定されたファイルに対する操作を実行する。(ShellExecuteW)

[戻り値]
型: HINSTANCE 関数が成功した場合、32 より大きい値を返す。失敗した場合はエラーを示す値を返す。戻り値は 16 ビット
Windows アプリケーションとの後方互換性のため HINSTANCE としてキャストされるが、真の HINSTANCE
ではない。INT_PTR にキャストして 32 またはエラーコードと比較できる。
（以下省略）

[備考]
ShellExecute は Shell 拡張(データソース、コンテキストメニューハンドラ、verb
実装)に実行を委譲できるため、ShellExecute 呼び出し前に COM を初期化すべきである。一部の Shell 拡張は STA
を要求する。
（以下省略）


%index
Shell_GetCachedImageIndex
Shell_GetCachedImageIndex は変更されるか利用できなくなる可能性がある。
%prm
pwszIconPath, iIconIndex, uIconFlags
pwszIconPath : [wstr] 型: PCWSTR イメージファイルへのパスを格納するバッファーへのポインター。
iIconIndex : [int] 型: int pwszIconPath で指定されたファイル内のイメージのインデックス。
uIconFlags : [int] 型: UINT 使用しない。
%inst
Shell_GetCachedImageIndex は変更されるか利用できなくなる可能性がある。

[戻り値]
型: int イメージのインデックスを返す。失敗した場合は ?1 を返す。

[備考]
この関数の Shell_GetCachedImageIndexA 版および Shell_GetCachedImageIndexW 版は
Windows Vista で追加された。Unicode 文字列の場合は Shell_GetCachedImageIndexW または
Shell_GetCachedImageIndex のいずれかを呼び出す。ANSI 文字列の場合は
Shell_GetCachedImageIndexA を明示的に呼び出さなければならない。Windows Server 2003 および
Windows XP: Shell_GetCachedImageIndex
のみがサポートされる。Shell_GetCachedImageIndex は Unicode 文字列を必要とする。


%index
Shell_GetImageLists
大アイコンと小アイコン用のシステムイメージリストを取得する。
%prm
phiml, phimlSmall
phiml : [intptr] 型: HIMAGELIST* 成功時に大 (32 x 32) アイコン用のシステムイメージリストを受け取るイメージリストのハンドルへのポインター。
phimlSmall : [intptr] 型: HIMAGELIST* 成功時に小 (16 x 16) アイコン用のシステムイメージリストを受け取るイメージリストのハンドルへのポインター。
%inst
大アイコンと小アイコン用のシステムイメージリストを取得する。

[戻り値]
型: BOOL 成功した場合は TRUE を返す。失敗した場合は FALSE を返し、phiml と phimlSmall
が指すイメージリストは変更されない。

[備考]
重要 この関数で取得されるイメージリストはグローバルなシステムイメージリストである。これらに対して ImageList_Destroy
を呼び出してはならない。


%index
Shell_MergeMenus
Shell_MergeMenus は変更されるか利用できなくなる可能性がある。
%prm
hmDst, hmSrc, uInsert, uIDAdjust, uIDAdjustMax, uFlags
hmDst : [intptr] 型: HMENU hmSrc が追加される宛先メニュー。
hmSrc : [intptr] 型: HMENU hmDst に追加されるソースメニュー。
uInsert : [int] 型: UINT hmSrc のエントリが挿入される hmDst 内の位置。
uIDAdjust : [int] 型: UINT この数は各メニューの ID に加算され、調整された ID を与える。調整しない場合は 0 を設定する。uIDAdjust の値は通常 hmDst の項目数となる。この数は GetMenuItemCount を使用して取得できる。
uIDAdjustMax : [int] 型: UINT メニューに追加する調整済み ID の最大値。この値より大きい調整済み ID は追加されない。すべての ID を許可するには、このパラメーターを 0xFFFF に設定する。
uFlags : [int] 型: ULONG 次のフラグの 1 つ以上。
%inst
Shell_MergeMenus は変更されるか利用できなくなる可能性がある。

[戻り値]
型: UINT メニューの末尾の次の空き ID (調整済み ID の最大値 + 1) を返す。


%index
SignalFileOpen
SignalFileOpen は変更されるか利用できなくなる可能性がある。
%prm
pidl
pidl : [var] 型: PCIDLIST_ABSOLUTE ファイルを指定する PIDL。
%inst
SignalFileOpen は変更されるか利用できなくなる可能性がある。

[戻り値]
型: BOOL 成功した場合は TRUE を、それ以外の場合は FALSE を返す。


%index
StgMakeUniqueName
テンプレートからストリームまたはストレージオブジェクトの一意な名前を作成する。
%prm
pstgParent, pszFileSpec, grfMode, riid, ppv
pstgParent : [var] 型: IStorage* IStorage オブジェクトへのポインター。
pszFileSpec : [wstr] 型: PCWSTR ストリームまたはストレージオブジェクトの名前の書式またはテンプレート。
grfMode : [int] 型: DWORD ストリームまたはストレージオブジェクトを開く際に使用するアクセスモード。詳細と指定可能な値については STGM Constants を参照。
riid : [var] 型: REFIID ppv 経由で取得するインターフェイスの IID への参照。通常は IID_IStorage または IID_IStream。
ppv : [var] 型: void** このメソッドが返るときに、riid で要求されたインターフェイスポインターを格納する。これは通常 IStorage または IStream である。
%inst
テンプレートからストリームまたはストレージオブジェクトの一意な名前を作成する。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
Objbase.h で定義されている IID_PPV_ARGS マクロを使用して riid と ppv
パラメーターをパッケージ化することを推奨する。このマクロは ppv の値が指すインターフェイスに基づいて正しい IID
を提供するため、コーディングエラーの可能性をなくせる。


%index
Win32DeleteFile
Win32DeleteFile は変更されるか利用できなくなる可能性がある。
%prm
pszPath
pszPath : [wstr] 型: PCWSTR 削除するファイルのフルネームを格納するバッファーへのポインター。
%inst
Win32DeleteFile は変更されるか利用できなくなる可能性がある。

[戻り値]
型: BOOL ファイルが正常に削除された場合は TRUE を、それ以外の場合は FALSE を返す。


%index
WriteCabinetState
WriteCabinetState は変更されるか利用できなくなる可能性がある。
%prm
pcs
pcs : [var] 型: CABINETSTATE* 設定する値を保持する CABINETSTATE 構造体へのポインター。
%inst
WriteCabinetState は変更されるか利用できなくなる可能性がある。

[戻り値]
型: BOOL 成功した場合は TRUE を、それ以外の場合は FALSE を返す。

