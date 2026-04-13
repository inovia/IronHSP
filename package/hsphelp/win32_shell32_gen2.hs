; ============================================================
;   shell32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
DragAcceptFiles
ウィンドウがドロップされたファイルを受け付けるかを登録する。
%group
Win32 shell32
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
%group
Win32 shell32
%prm
hDrop
hDrop : [intptr] 型: HDROP ドロップされたファイルを記述する構造体の識別子。このハンドルは WM_DROPFILES メッセージの wParam から取得する。
%inst
アプリケーションへファイル名を転送するためにシステムが割り当てたメモリを解放する。


%index
DragQueryFileW
ドラッグアンドドロップ操作の結果としてドロップされたファイル名を取得する。(Unicode)
%group
Win32 shell32
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
%group
Win32 shell32
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
ExtractIconW
指定された実行ファイル、DLL、またはアイコンファイルからアイコンのハンドルを取得する。大/小アイコンハンドルの配列を取得するには ExtractIconEx を使う。(Unicode)
%group
Win32 shell32
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
SHBrowseForFolderW
ユーザが Shell フォルダを選択できるダイアログボックスを表示する。(Unicode)
%group
Win32 shell32
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
SHChangeNotify
アプリケーションが実行したイベントをシステムに通知する。Shell に影響する可能性があるアクションを実行した場合に使用すべき。
%group
Win32 shell32
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
SHGetFolderPathW
非推奨。(SHGetFolderPathW)
%group
Win32 shell32
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
SHGetKnownFolderPath
フォルダの KNOWNFOLDERID で識別される既知フォルダの完全パスを取得する。
%group
Win32 shell32
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
SHGetPathFromIDListW
アイテム識別子リストをファイルシステムパスに変換する。(Unicode)
%group
Win32 shell32
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
SHGetSpecialFolderPathW
SHGetSpecialFolderPath はサポートされていない。代わりに SHGetFolderPath を使う。(Unicode)
%group
Win32 shell32
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
ShellExecuteW
指定されたファイルに対する操作を実行する。(ShellExecuteW)
%group
Win32 shell32
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

