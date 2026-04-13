; ============================================================
;   user32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
DestroyMenu
指定したメニューを破棄し、メニューが占有していたメモリを解放する。
%group
Win32 user32
%prm
hMenu
hMenu : [intptr] 型: HMENU 破棄するメニューへのハンドル。
%inst
指定したメニューを破棄し、メニューが占有していたメモリを解放する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報を得るには GetLastError
を呼び出す。

[備考]
アプリケーションは終了前に、ウィンドウに割り当てられていないメニューを DestroyMenu
関数で破棄する必要がある。ウィンドウに割り当てられたメニューはアプリケーション終了時に自動的に破棄される。DestroyMenu
は再帰的で、メニューとそのすべてのサブメニューを破棄する。


%index
CreateWindowExW
拡張ウィンドウスタイルを持つオーバーラップ、ポップアップ、または子ウィンドウを作成する。それ以外は CreateWindow 関数と同じ。(Unicode)
%group
Win32 user32
%prm
dwExStyle, lpClassName, lpWindowName, dwStyle, X, Y, nWidth, nHeight, hWndParent, hMenu, hInstance, lpParam
dwExStyle : [int] 型: DWORD 作成するウィンドウの拡張ウィンドウスタイル。指定可能な値は Extended Window Styles を参照。
lpClassName : [wstr] 型: LPCTSTR NULL 終端文字列、または以前に RegisterClass もしくは RegisterClassEx を呼び出して作成されたクラスアトム。アトムは lpClassName の下位ワードに配置し、上位ワードは 0 でなければならない。文字列の場合はウィンドウクラス名を指定する。クラス名はクラスを登録したモジュールがウィンドウを作成するモジュールと同一である限り、RegisterClass または RegisterClassEx で登録した任意の名前を指定できる。定義済みのシステムクラス名も指定できる。
lpWindowName : [wstr] 型: LPCTSTR ウィンドウ名。ウィンドウスタイルでタイトルバーが指定されている場合、lpWindowName が指すタイトルがタイトルバーに表示される。ボタン、チェックボックス、静的コントロールなどのコントロールを CreateWindow で作成する場合、lpWindowName でコントロールのテキストを指定する。SS_ICON スタイルの静的コントロールを作成する場合、lpWindowName でアイコン名または識別子を指定する。識別子を指定するには "#num" 構文を使う。
dwStyle : [int] 型: DWORD 作成するウィンドウのスタイル。ウィンドウスタイル値の組み合わせに加え、Remarks セクションに示されたコントロールスタイルを指定できる。
X : [int] 型: int ウィンドウの初期水平位置。オーバーラップまたはポップアップウィンドウの場合、x はウィンドウ左上隅の初期 x 座標(スクリーン座標)。子ウィンドウの場合、x は親ウィンドウクライアント領域の左上隅を基準とした左上隅の x 座標。x に CW_USEDEFAULT を指定すると、システムはウィンドウ左上隅の既定位置を選択し、y パラメータは無視される。CW_USEDEFAULT はオーバーラップウィンドウでのみ有効。ポップアップや子ウィンドウに指定すると x, y は 0 に設定される。
Y : [int] 型: int ウィンドウの初期垂直位置。オーバーラップまたはポップアップウィンドウの場合、y はウィンドウ左上隅の初期 y 座標(スクリーン座標)。子ウィンドウの場合、y は親ウィンドウクライアント領域の左上隅を基準とした子ウィンドウ左上隅の初期 y 座標。リストボックスの場合、y は親ウィンドウクライアント領域の左上隅を基準としたリストボックスクライアント領域の左上隅の初期 y 座標。
nWidth : [int] 型: int ウィンドウの幅(デバイス単位)。オーバーラップウィンドウの場合、nWidth はスクリーン座標による幅、または CW_USEDEFAULT を指定する。CW_USEDEFAULT の場合、システムが既定の幅と高さを選択する。既定の幅は初期 x 座標から画面右端まで、既定の高さは初期 y 座標からアイコン領域上端まで延びる。CW_USEDEFAULT はオーバーラップウィンドウでのみ有効。ポップアップや子ウィンドウに指定すると nWidth と nHeight は 0 に設定される。
nHeight : [int] 型: int ウィンドウの高さ(デバイス単位)。オーバーラップウィンドウの場合、nHeight はスクリーン座標によるウィンドウの高さ。nWidth に CW_USEDEFAULT が指定されている場合、nHeight は無視される。
hWndParent : [intptr] 型: HWND 作成するウィンドウの親または所有者ウィンドウへのハンドル。子ウィンドウや所有されるウィンドウを作成するには有効なウィンドウハンドルを指定する。ポップアップウィンドウではこのパラメータは省略可能。メッセージ専用ウィンドウを作成するには HWND_MESSAGE または既存のメッセージ専用ウィンドウのハンドルを指定する。
hMenu : [intptr] 型: HMENU ウィンドウスタイルに応じてメニューへのハンドルまたは子ウィンドウ識別子を指定する。オーバーラップまたはポップアップウィンドウの場合、hMenu はウィンドウで使用するメニューを識別する。クラスメニューを使用する場合は NULL を指定できる。子ウィンドウの場合、hMenu は子ウィンドウ識別子(ダイアログボックスのコントロールが親に対してイベントを通知するために使用する整数値)を指定する。識別子はアプリケーションが決定し、同じ親を持つすべての子ウィンドウで一意でなければならない。
hInstance : [intptr] 型: HINSTANCE ウィンドウに関連付けるモジュールのインスタンスへのハンドル。
lpParam : [intptr] 型: LPVOID WM_CREATE メッセージの lParam が指す CREATESTRUCT 構造体(lpCreateParams メンバ)を経由してウィンドウに渡される値へのポインタ。このメッセージは CreateWindowEx の戻り前に作成されたウィンドウへ送信される。MDI クライアントウィンドウを作成するために CreateWindow を呼ぶ場合、lpParam は CLIENTCREATESTRUCT 構造体を指す必要がある。MDI クライアントウィンドウが MDI 子ウィンドウを作成する場合は MDICREATESTRUCT 構造体を指す必要がある。追加データが不要なら NULL でもよい。
%inst
拡張ウィンドウスタイルを持つオーバーラップ、ポップアップ、または子ウィンドウを作成する。それ以外は CreateWindow
関数と同じ。(Unicode)

[戻り値]
型: HWND 関数が成功した場合、戻り値は新しいウィンドウへのハンドル。失敗した場合は NULL。拡張エラー情報は
GetLastError で取得する。この関数は通常、次のいずれかの理由で失敗する:
（以下省略）

[備考]
CreateWindowEx 関数は作成中のウィンドウに WM_NCCREATE、WM_NCCALCSIZE、WM_CREATE
メッセージを送信する。作成されたウィンドウが子ウィンドウの場合、既定位置は Z オーダーの最下位。トップレベルウィンドウの場合は Z
オーダーの最上位(ただし、作成されたウィンドウ自身が最前面でない限り、すべての最前面ウィンドウの下)。タスクバーに作成ウィンドウのボタンを表示するかどうかの制御については
Managing Taskbar Buttons を参照。ウィンドウの削除については DestroyWindow
を参照。次の定義済みコントロールクラスを lpClassName に指定できる。対応するコントロールスタイルは dwStyle
に指定できる。
（以下省略）


%index
DestroyWindow
指定したウィンドウを破棄する。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND 破棄するウィンドウへのハンドル。
%inst
指定したウィンドウを破棄する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報を得るには GetLastError
を呼び出す。

[備考]
スレッドは DestroyWindow を使って別スレッドが作成したウィンドウを破棄できない。破棄対象が
WS_EX_NOPARENTNOTIFY スタイルを持たない子ウィンドウの場合、親に WM_PARENTNOTIFY
メッセージが送られる。


%index
ShowWindow
指定されたウィンドウの表示状態を設定する。
%group
Win32 user32
%prm
hWnd, nCmdShow
hWnd : [intptr] 型: HWND ウィンドウへのハンドル。
nCmdShow : [int] 型: int
%inst
指定されたウィンドウの表示状態を設定する。

[戻り値]
型: BOOL ウィンドウが以前表示されていた場合は 0 以外。以前非表示だった場合は 0。

[備考]
ウィンドウの表示/非表示で特殊効果を行うには AnimateWindow を使う。アプリケーションは ShowWindow
の初回呼び出しで WinMain の nCmdShow パラメータを使用する。2 回目以降は指定値のいずれかを使用する(WinMain
のものではなく)。プログラムが STARTUPINFO 構造体で起動情報を指定した場合、初回 ShowWindow 呼び出しの
nCmdShow は無視される。以降の呼び出しで SW_SHOWDEFAULT を使うと起動情報を利用できる。
（以下省略）


%index
UpdateWindow
指定されたウィンドウの更新領域が空でない場合、ウィンドウに WM_PAINT メッセージを送信してクライアント領域を更新する。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 更新するウィンドウへのハンドル。
%inst
指定されたウィンドウの更新領域が空でない場合、ウィンドウに WM_PAINT メッセージを送信してクライアント領域を更新する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。


%index
GetForegroundWindow
フォアグラウンドウィンドウ(ユーザが現在操作しているウィンドウ)へのハンドルを取得する。システムはフォアグラウンドウィンドウを作成したスレッドに他スレッドより若干高い優先度を割り当てる。
%group
Win32 user32
%prm

%inst

フォアグラウンドウィンドウ(ユーザが現在操作しているウィンドウ)へのハンドルを取得する。システムはフォアグラウンドウィンドウを作成したスレッドに他スレッドより若干高い優先度を割り当てる。

[戻り値]
型: HWND 戻り値はフォアグラウンドウィンドウへのハンドル。特定の状況(ウィンドウがアクティベーションを失っているときなど)では
NULL になる場合がある。


%index
SetForegroundWindow
指定されたウィンドウを作成したスレッドをフォアグラウンドにし、ウィンドウをアクティブ化する。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND アクティブ化してフォアグラウンドに持ってくるウィンドウへのハンドル。
%inst
指定されたウィンドウを作成したスレッドをフォアグラウンドにし、ウィンドウをアクティブ化する。

[戻り値]
型: BOOL ウィンドウがフォアグラウンドになった場合は 0 以外、そうでない場合は 0。

[備考]
システムはフォアグラウンドウィンドウを設定できるプロセスを制限する。SetForegroundWindow
を呼び出してフォアグラウンドウィンドウを設定できるのは、呼び出し元プロセスがデスクトップアプリケーション(UWP や Windows
Store アプリではない)、LockSetForegroundWindow
で呼び出しが無効化されていない、フォアグラウンドロックタイムアウト経過済み、アクティブなメニューがない、かつ以下のいずれかを満たす場合:
呼び出しプロセスがフォアグラウンド、呼び出しプロセスがフォアグラウンドから起動された、フォアグラウンドウィンドウがない、最後の入力イベントを受信した、呼び出しプロセスまたはフォアグラウンドプロセスがデバッグ中。ユーザが他のウィンドウを操作している間はウィンドウを強制的にフォアグラウンドにすることはできず、代わりにタスクバーボタンが点滅する。
（以下省略）


%index
GetActiveWindow
呼び出し元スレッドのメッセージキューにアタッチされたアクティブウィンドウへのハンドルを取得する。
%group
Win32 user32
%prm

%inst
呼び出し元スレッドのメッセージキューにアタッチされたアクティブウィンドウへのハンドルを取得する。

[戻り値]
型: HWND 戻り値は呼び出し元スレッドのメッセージキューにアタッチされたアクティブウィンドウへのハンドル。ない場合は NULL。

[備考]
フォアグラウンドウィンドウのハンドルは GetForegroundWindow
で取得できる。別スレッドのメッセージキュー内のアクティブウィンドウのハンドルは GetGUIThreadInfo で取得する。


%index
IsWindow
指定したウィンドウハンドルが既存のウィンドウを識別するかを判定する。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND テスト対象のウィンドウへのハンドル。
%inst
指定したウィンドウハンドルが既存のウィンドウを識別するかを判定する。

[戻り値]
型: BOOL ウィンドウハンドルが既存のウィンドウを識別する場合は 0 以外。そうでなければ 0。

[備考]
スレッドは自身が作成していないウィンドウに対して IsWindow
を使用すべきではない。呼び出し後にウィンドウが破棄される可能性があり、さらにウィンドウハンドルは再利用されるため異なるウィンドウを指す可能性がある。


%index
IsWindowVisible
指定したウィンドウの可視状態を判定する。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND テスト対象のウィンドウへのハンドル。
%inst
指定したウィンドウの可視状態を判定する。

[戻り値]
型: BOOL 指定ウィンドウ、その親、親の親、…がすべて WS_VISIBLE スタイルを持つ場合は 0 以外。そうでなければ
0。戻り値は WS_VISIBLE スタイルを持つかを示すもので、他のウィンドウに完全に隠されていても 0 以外となりうる。

[備考]
ウィンドウの可視状態は WS_VISIBLE スタイルビットで示される。WS_VISIBLE
が設定されている場合、ウィンドウは表示され、その後の描画が表示される。ただし他のウィンドウに隠されている場合や親によってクリップされている場合は描画が表示されないことがある。


%index
GetClientRect
ウィンドウのクライアント領域の座標を取得する。
%group
Win32 user32
%prm
hWnd, lpRect
hWnd : [intptr] 型: HWND クライアント座標を取得するウィンドウへのハンドル。
lpRect : [var] 型: LPRECT クライアント座標を受け取る RECT 構造体へのポインタ。left と top は 0。right と bottom はウィンドウの幅と高さを格納する。
%inst
ウィンドウのクライアント領域の座標を取得する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報を得るには GetLastError
を呼び出す。

[備考]
RECT 構造体の規約に従い、返される矩形の右下座標は排他的(exclusive)である。つまり (right, bottom)
のピクセルは矩形のすぐ外側に位置する。


%index
GetWindowRect
指定したウィンドウの外接矩形の寸法を取得する。寸法は画面左上隅を原点とするスクリーン座標で返される。
%group
Win32 user32
%prm
hWnd, lpRect
hWnd : [intptr] 型: HWND ウィンドウへのハンドル。
lpRect : [var] 型: LPRECT ウィンドウの左上および右下隅のスクリーン座標を受け取る RECT 構造体へのポインタ。
%inst
指定したウィンドウの外接矩形の寸法を取得する。寸法は画面左上隅を原点とするスクリーン座標で返される。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報を得るには GetLastError
を呼び出す。

[備考]
RECT 構造体の規約に従い、返される矩形の右下座標は排他的(exclusive)である。つまり (right, bottom)
のピクセルは矩形のすぐ外側に位置する。GetWindowRect は DPI に対して仮想化されている。Windows Vista
以降、Window Rect にはドロップシャドウが占める領域も含まれる。GetWindowRect
の動作はウィンドウが一度でも表示されたかどうかに依存する。まだ表示されていない場合、GetWindowRect
にはドロップシャドウ領域は含まれない。ドロップシャドウを除いた境界を取得するには、DwmGetWindowAttribute に
DWMWA_EXTENDED_FRAME_BOUNDS を指定する。Window Rect と異なり、DWM Extended Frame
Bounds は DPI 補正されない点に注意。拡張フレーム境界の取得はウィンドウが少なくとも一度表示された後でのみ可能である。


%index
SetWindowPos
子、ポップアップ、またはトップレベルウィンドウのサイズ、位置、Z オーダーを変更する。これらのウィンドウは画面上の表示順に並んでおり、最前面のウィンドウが最上位ランクを持ち Z オーダーの先頭となる。
%group
Win32 user32
%prm
hWnd, hWndInsertAfter, X, Y, cx, cy, uFlags
hWnd : [intptr] 型: HWND ウィンドウへのハンドル。
hWndInsertAfter : [intptr] 型: HWND
X : [int] 型: int ウィンドウ左辺の新しい位置(クライアント座標)。
Y : [int] 型: int ウィンドウ上辺の新しい位置(クライアント座標)。
cx : [int] 型: int ウィンドウの新しい幅(ピクセル単位)。
cy : [int] 型: int ウィンドウの新しい高さ(ピクセル単位)。
uFlags : [int] 型: UINT
%inst
子、ポップアップ、またはトップレベルウィンドウのサイズ、位置、Z
オーダーを変更する。これらのウィンドウは画面上の表示順に並んでおり、最前面のウィンドウが最上位ランクを持ち Z オーダーの先頭となる。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報を得るには GetLastError
を呼び出す。

[備考]
Vista 以降のアーキテクチャ変更により、すべてのサービスは対話型デスクトップから Session 0 へ移された。hwnd
およびウィンドウマネージャ操作はセッション内でのみ有効で、セッションを越えた hwnd 操作は失敗する。詳細は The Windows
Vista Developer Story: Application Compatibility Cookbook
を参照。SetWindowLong で特定のウィンドウデータを変更した場合、変更を反映させるには SetWindowPos
を呼ぶ必要がある。uFlags には次の組み合わせを使う: SWP_NOMOVE | SWP_NOSIZE | SWP_NOZORDER
| SWP_FRAMECHANGED。ウィンドウを最前面にするには hWndInsertAfter を HWND_TOPMOST に設定し
SWP_NOZORDER フラグを設定しないか、Z
オーダー内の位置を既存の最前面ウィンドウより上にする。非最前面ウィンドウを最前面にすると、その所有ウィンドウも最前面になるが、所有者は変更されない。SWP_NOACTIVATE
も SWP_NOZORDER も指定されていない場合(つまりウィンドウの有効化と Z
オーダーの変更を同時に要求する場合)、hWndInsertAfter の値は次の状況でのみ使用される。
（以下省略）


%index
MoveWindow
指定したウィンドウの位置と寸法を変更する。
%group
Win32 user32
%prm
hWnd, X, Y, nWidth, nHeight, bRepaint
hWnd : [intptr] 型: HWND ウィンドウへのハンドル。
X : [int] 型: int ウィンドウ左辺の新しい位置。
Y : [int] 型: int ウィンドウ上辺の新しい位置。
nWidth : [int] 型: int ウィンドウの新しい幅。
nHeight : [int] 型: int ウィンドウの新しい高さ。
bRepaint : [int] 型: BOOL ウィンドウを再描画するかどうか。TRUE の場合、ウィンドウはメッセージを受け取る。FALSE の場合、一切の再描画は行われない。これはクライアント領域、非クライアント領域(タイトルバー、スクロールバー含む)、および子ウィンドウ移動により露出した親ウィンドウの一部すべてに適用される。
%inst
指定したウィンドウの位置と寸法を変更する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報を得るには GetLastError
を呼び出す。

[備考]
bRepaint が TRUE の場合、システムはウィンドウ移動直後にウィンドウプロシージャへ WM_PAINT
メッセージを送る(すなわち MoveWindow は UpdateWindow を呼ぶ)。FALSE
の場合、アプリケーションは再描画が必要な箇所を明示的に無効化または再描画する必要がある。MoveWindow はウィンドウへ
WM_WINDOWPOSCHANGING、WM_WINDOWPOSCHANGED、WM_MOVE、WM_SIZE、WM_NCCALCSIZE
メッセージを送る。


%index
ClientToScreen
指定した点のクライアント領域座標をスクリーン座標に変換する。
%group
Win32 user32
%prm
hWnd, lpPoint
hWnd : [intptr] 変換に使用するクライアント領域を持つウィンドウへのハンドル。
lpPoint : [var] 変換するクライアント座標を保持する POINT 構造体へのポインタ。成功時は新しいスクリーン座標が格納される。
%inst
指定した点のクライアント領域座標をスクリーン座標に変換する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
POINT
構造体のクライアント領域座標をスクリーン座標に置き換える。スクリーン座標は画面左上隅が基準。ウィンドウのクライアント領域の上にある点は y
が負となり、左にある点は x が負となる。すべての座標はデバイス座標である。


%index
ScreenToClient
指定された画面上の点のスクリーン座標をクライアント領域座標に変換する。
%group
Win32 user32
%prm
hWnd, lpPoint
hWnd : [intptr] 変換に使用するクライアント領域を持つウィンドウへのハンドル。
lpPoint : [var] 変換するスクリーン座標を指定する POINT 構造体へのポインタ。
%inst
指定された画面上の点のスクリーン座標をクライアント領域座標に変換する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
hWnd で指定されるウィンドウと POINT 構造体で与えられるスクリーン座標を使ってクライアント座標を計算し、POINT
にクライアント座標を格納する。新しい座標は指定ウィンドウのクライアント領域の左上隅を基準とする。すべての座標はデバイス単位。ミラーリング状況(レイアウト変更時)では
ScreenToClient を使わず MapWindowPoints を使うこと。


%index
GetParent
指定したウィンドウの親またはオーナーへのハンドルを取得する。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND 親ウィンドウハンドルを取得するウィンドウへのハンドル。
%inst
指定したウィンドウの親またはオーナーへのハンドルを取得する。

[戻り値]
型: HWND ウィンドウが子ウィンドウの場合、戻り値は親ウィンドウへのハンドル。WS_POPUP
スタイルのトップレベルウィンドウの場合、戻り値はオーナーウィンドウへのハンドル。失敗した場合は NULL。拡張エラー情報を得るには
GetLastError を呼び出す。この関数は通常、次のいずれかの理由で失敗する:
（以下省略）

[備考]
ウィンドウのオーナーウィンドウを取得するには、GetParent ではなく GW_OWNER フラグを指定した GetWindow
を使う。オーナーではなく親ウィンドウを取得するには、GetParent ではなく GA_PARENT フラグを指定した
GetAncestor を使う。


%index
SetParent
指定した子ウィンドウの親ウィンドウを変更する。
%group
Win32 user32
%prm
hWndChild, hWndNewParent
hWndChild : [intptr] 型: HWND 子ウィンドウへのハンドル。
hWndNewParent : [intptr] 型: HWND 新しい親ウィンドウへのハンドル。NULL の場合、デスクトップウィンドウが新しい親となる。HWND_MESSAGE の場合、子ウィンドウはメッセージ専用ウィンドウになる。
%inst
指定した子ウィンドウの親ウィンドウを変更する。

[戻り値]
型: HWND 関数が成功した場合、戻り値は以前の親ウィンドウへのハンドル。失敗した場合は NULL。拡張エラー情報を得るには
GetLastError を呼び出す。

[備考]
アプリケーションは SetParent を使ってポップアップ、オーバーラップ、子ウィンドウの親を設定できる。hWndChild
が表示中の場合、システムは適切な再描画を行う。互換性のため、SetParent は親変更対象ウィンドウの WS_CHILD や
WS_POPUP スタイルを変更しない。したがって hWndNewParent が NULL の場合は SetParent 呼び出し後に
WS_CHILD ビットをクリアし WS_POPUP を設定すべきである。逆に hWndNewParent が非 NULL
でウィンドウが以前デスクトップの子であった場合、呼び出し前に WS_POPUP をクリアし WS_CHILD
を設定すべきである。ウィンドウの親を変更するときは両ウィンドウの UISTATE を同期すべきである。詳細は
WM_CHANGEUISTATE と WM_UPDATEUISTATE を参照。hWndNewParent と hWndChild
が異なる DPI 認識モードで動作している場合、予期しない動作やエラーが発生する可能性がある。その挙動は次の表にまとめる:
（以下省略）


%index
SendMessageW
指定したメッセージをウィンドウ(群)に送信する。SendMessage は指定ウィンドウのウィンドウプロシージャを呼び出し、メッセージ処理が完了するまで戻らない。(SendMessageW)
%group
Win32 user32
%prm
hWnd, Msg, wParam, lParam
hWnd : [intptr] 型: HWND メッセージを受け取るウィンドウプロシージャのウィンドウへのハンドル。HWND_BROADCAST ((HWND)0xffff) を指定すると、メッセージはシステム内のすべてのトップレベルウィンドウ(無効または非表示の非所有ウィンドウ、オーバーラップウィンドウ、ポップアップウィンドウを含む)に送信されるが、子ウィンドウには送信されない。メッセージ送信は UIPI の対象。プロセスのスレッドは同等以下の整合性レベルのプロセスのスレッドメッセージキューにのみメッセージを送信できる。
Msg : [int] 型: UINT 送信するメッセージ。システム定義メッセージの一覧は System-Defined Messages を参照。
wParam : [intptr] 型: WPARAM メッセージ固有の追加情報。
lParam : [intptr] 型: LPARAM メッセージ固有の追加情報。
%inst
指定したメッセージをウィンドウ(群)に送信する。SendMessage
は指定ウィンドウのウィンドウプロシージャを呼び出し、メッセージ処理が完了するまで戻らない。(SendMessageW)

[戻り値]
型: LRESULT 戻り値はメッセージ処理の結果を表し、送信したメッセージに依存する。

[備考]
UIPI によりメッセージがブロックされた場合、GetLastError で取得される最終エラーは 5 (access denied)
に設定される。HWND_BROADCAST を使った通信を行うアプリケーションは、アプリケーション間通信用の一意なメッセージを得るために
RegisterWindowMessage を使うべきである。システムはシステムメッセージ(0～WM_USER-1
の範囲)についてのみマーシャリングを行う。他のメッセージ(WM_USER
以上)を別プロセスへ送るにはカスタムマーシャリングが必要。指定ウィンドウが呼び出しスレッドで作成されたものであればウィンドウプロシージャはサブルーチンとして直ちに呼ばれる。別スレッドで作成されたものであれば、システムはそのスレッドに切り替えて適切なウィンドウプロシージャを呼ぶ。スレッド間で送られたメッセージは受信スレッドがメッセージ取得コードを実行したときに初めて処理される。送信スレッドは受信スレッドがメッセージを処理するまでブロックされる。ただし送信スレッドは処理待ちの間、着信ノンキューメッセージを処理する。これを防ぐには
SMTO_BLOCK を指定した SendMessageTimeout を使う。ノンキューメッセージの詳細は Nonqueued
Messages を参照。アクセシビリティアプリケーションは SendMessage でシェルに WM_APPCOMMAND
メッセージを送信しアプリケーションを起動できる。これは他のタイプのアプリケーションで動作する保証はない。


%index
PostMessageW
指定したウィンドウを作成したスレッドのメッセージキューにメッセージを投稿(ポスト)し、スレッドがメッセージを処理するのを待たずに戻る。(Unicode)
%group
Win32 user32
%prm
hWnd, Msg, wParam, lParam
hWnd : [intptr] 型: HWND メッセージを受け取るウィンドウプロシージャのウィンドウへのハンドル。次の値は特別な意味を持つ。
Msg : [int] 型: UINT 投稿するメッセージ。システム定義メッセージの一覧は System-Defined Messages を参照。
wParam : [intptr] 型: WPARAM メッセージ固有の追加情報。
lParam : [intptr] 型: LPARAM メッセージ固有の追加情報。
%inst

指定したウィンドウを作成したスレッドのメッセージキューにメッセージを投稿(ポスト)し、スレッドがメッセージを処理するのを待たずに戻る。(Unicode)

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報を得るには GetLastError
を呼び出す。

[備考]
UIPI によりメッセージがブロックされた場合、GetLastError で取得される最終エラーは 5 (access denied)
に設定される。メッセージキュー内のメッセージは GetMessage または PeekMessage
で取得される。HWND_BROADCAST を使った通信を行うアプリケーションは、アプリケーション間通信用の一意なメッセージを得るために
RegisterWindowMessage を使うべきである。システムはシステムメッセージ(0～WM_USER-1
の範囲)についてのみマーシャリングを行う。他のメッセージ(WM_USER
以上)を別プロセスへ送るにはカスタムマーシャリングが必要。WM_USER
未満のメッセージを非同期メッセージ関数(PostMessage、SendNotifyMessage、SendMessageCallback)で送る場合、メッセージパラメータにポインタを含めてはならない。さもなければ操作は失敗する。これらの関数は受信スレッドがメッセージを処理する前に戻り、送信側は使用される前にメモリを解放してしまう。WM_QUIT
を PostMessage で投稿してはならない。代わりに PostQuitMessage を使うこと。アクセシビリティアプリケーションは
PostMessage でシェルに WM_APPCOMMAND
メッセージを投稿しアプリケーションを起動できる。これは他のタイプのアプリケーションで動作する保証はない。メッセージキューあたりの投稿メッセージ数は
10,000
に制限される。この上限は十分大きいはずである。上限を超える場合、そのアプリケーションはシステムリソースの消費を避けるよう再設計すべきである。この上限を調整するには次のレジストリキーを編集する。HKEY_LOCAL_MACHINE
SOFTWARE Microsoft Windows NT CurrentVersion Windows
USERPostMessageLimit 失敗時は GetLastError を呼ぶ。上限に達した場合、GetLastError は
ERROR_NOT_ENOUGH_QUOTA を返す。許容可能な最小値は 4000。


%index
GetMessageW
呼び出し元スレッドのメッセージキューからメッセージを取得する。取得可能な投稿メッセージが得られるまで、着信送信メッセージを配送する。(GetMessageW)
%group
Win32 user32
%prm
lpMsg, hWnd, wMsgFilterMin, wMsgFilterMax
lpMsg : [var] 型: LPMSG スレッドのメッセージキューからメッセージ情報を受け取る MSG 構造体へのポインタ。
hWnd : [intptr] 型: HWND メッセージを取得するウィンドウへのハンドル。ウィンドウは現在のスレッドに属している必要がある。
wMsgFilterMin : [int] 型: UINT 取得するメッセージ値の最小値。最初のキーボードメッセージを指定するには WM_KEYFIRST (0x0100)、最初のマウスメッセージを指定するには WM_MOUSEFIRST (0x0200) を使う。WM_INPUT メッセージのみを指定するには wMsgFilterMin と wMsgFilterMax の両方に WM_INPUT を指定する。wMsgFilterMin と wMsgFilterMax がともに 0 の場合、GetMessage は範囲フィルタリングを行わずすべてのメッセージを返す。
wMsgFilterMax : [int] 型: UINT 取得するメッセージ値の最大値。最後のキーボードメッセージを指定するには WM_KEYLAST、最後のマウスメッセージを指定するには WM_MOUSELAST を使う。
%inst

呼び出し元スレッドのメッセージキューからメッセージを取得する。取得可能な投稿メッセージが得られるまで、着信送信メッセージを配送する。(GetMessageW)

[戻り値]
型: BOOL 関数が WM_QUIT 以外のメッセージを取得した場合、戻り値は 0 以外。WM_QUIT を取得した場合は
0。エラーの場合は -1。たとえば hWnd が無効なウィンドウハンドル、または lpMsg
が無効なポインタの場合に失敗する。拡張エラー情報を得るには GetLastError を呼び出す。戻り値が 0 以外、0、-1
のいずれにもなりうるため、次のようなコードは避けること:
（以下省略）

[備考]
アプリケーションは通常、戻り値を使ってメインメッセージループを終了しプログラムを抜けるかどうかを判断する。GetMessage は
hWnd パラメータで指定されたウィンドウ(および IsChild
で判定されるその子)に関連付けられたメッセージのうち、wMsgFilterMin と wMsgFilterMax
の範囲内のものを取得する。これらのパラメータで使用できるのは下位ワードのみで、上位ワードはシステム予約である。wMsgFilterMin
と wMsgFilterMax に何を指定しても GetMessage は常に WM_QUIT
メッセージを取得する点に注意。この呼び出し中、システムは保留中のノンキューメッセージ(SendMessage、SendMessageCallback、SendMessageTimeout、SendNotifyMessage
により呼び出し元スレッド所有のウィンドウに送信されたメッセージ)を配送する。その後、指定フィルタに一致する最初のキューメッセージが取得される。システムは内部イベントも処理する場合がある。フィルタが指定されていない場合、メッセージは次の順で処理される:
（以下省略）


%index
TranslateMessage
仮想キーメッセージを文字メッセージに翻訳する。文字メッセージは呼び出し元スレッドのメッセージキューに投稿され、次に GetMessage または PeekMessage が呼ばれたときに読み取られる。
%group
Win32 user32
%prm
lpMsg
lpMsg : [var] 型: const MSG* GetMessage または PeekMessage でスレッドメッセージキューから取得したメッセージ情報を含む MSG 構造体へのポインタ。
%inst
仮想キーメッセージを文字メッセージに翻訳する。文字メッセージは呼び出し元スレッドのメッセージキューに投稿され、次に GetMessage
または PeekMessage が呼ばれたときに読み取られる。

[戻り値]
型: BOOL メッセージが翻訳された場合(文字メッセージがキューに投稿された場合)、戻り値は 0
以外。WM_KEYDOWN、WM_KEYUP、WM_SYSKEYDOWN、WM_SYSKEYUP の場合、翻訳の有無に関わらず 0
以外。翻訳されなかった場合は 0。

[備考]
TranslateMessage は lpMsg が指すメッセージを変更しない。WM_KEYDOWN と WM_KEYUP の組み合わせは
WM_CHAR または WM_DEADCHAR を生成する。WM_SYSKEYDOWN と WM_SYSKEYUP の組み合わせは
WM_SYSCHAR または WM_SYSDEADCHAR を生成する。TranslateMessage はキーボードドライバによって
ASCII 文字にマップされるキーのみ WM_CHAR を生成する。アプリケーションが仮想キーメッセージを他の目的で処理する場合は
TranslateMessage を呼ぶべきでない。


%index
DispatchMessageW
メッセージをウィンドウプロシージャにディスパッチする。通常は GetMessage で取得したメッセージのディスパッチに使用する。(DispatchMessageW)
%group
Win32 user32
%prm
lpMsg
lpMsg : [var] 型: const MSG* メッセージを格納した構造体へのポインタ。
%inst
メッセージをウィンドウプロシージャにディスパッチする。通常は GetMessage
で取得したメッセージのディスパッチに使用する。(DispatchMessageW)

[戻り値]
型: LRESULT 戻り値はウィンドウプロシージャが返した値を示す。意味はディスパッチされたメッセージによるが、一般には無視される。

[備考]
MSG 構造体には有効なメッセージ値が入っている必要がある。lpmsg が WM_TIMER メッセージを指し、lParam が NULL
でない場合、lParam
はウィンドウプロシージャの代わりに呼び出される関数を指す。ダイアログボックスへの入力メッセージの取得とディスパッチはアプリケーションの責任であり、多くの場合メインメッセージループを使う。キーボードでのコントロール操作を許可するには
IsDialogMessage を呼ぶ必要がある。


%index
MessageBoxW
システムアイコン、ボタン群、アプリケーション固有の短いメッセージ(状態やエラー情報など)を含むモーダルダイアログボックスを表示する。戻り値はユーザーがクリックしたボタンを示す整数値。(MessageBoxW)
%group
Win32 user32
%prm
hWnd, lpText, lpCaption, uType
hWnd : [intptr] 型: HWND 作成するメッセージボックスのオーナーウィンドウへのハンドル。NULL の場合、メッセージボックスにオーナーウィンドウはない。
lpText : [wstr] 型: LPCTSTR 表示するメッセージ。複数行にする場合は各行の間にキャリッジリターンおよび/またはラインフィード文字を入れる。
lpCaption : [wstr] 型: LPCTSTR ダイアログボックスのタイトル。NULL の場合、既定のタイトルは Error。
uType : [int] 型: UINT ダイアログボックスの内容と動作。このパラメータには次のフラググループからのフラグの組み合わせを指定できる。
%inst

システムアイコン、ボタン群、アプリケーション固有の短いメッセージ(状態やエラー情報など)を含むモーダルダイアログボックスを表示する。戻り値はユーザーがクリックしたボタンを示す整数値。(MessageBoxW)

[戻り値]
型: int メッセージボックスに Cancel ボタンがある場合、ESC キーが押されるか Cancel ボタンが選択されると関数は
IDCANCEL を返す。Cancel ボタンがない場合、MB_OK ボタンがない限り ESC は無効である。MB_OK
ボタンが表示されていて ESC が押されると戻り値は IDOK になる。失敗した場合は 0。拡張エラー情報を得るには
GetLastError を呼び出す。成功した場合の戻り値は次のメニュー項目値のいずれかとなる。
（以下省略）

[備考]
次のシステムアイコンは、uType パラメータに対応するフラグ値を設定することでメッセージボックスに表示できる。
（以下省略）


%index
DestroyCursor
カーソルを破棄し、カーソルが占有していたメモリを解放する。共有カーソルの破棄にこの関数を使用してはならない。
%group
Win32 user32
%prm
hCursor
hCursor : [intptr] 型: HCURSOR 破棄するカーソルへのハンドル。カーソルは使用中であってはならない。
%inst
カーソルを破棄し、カーソルが占有していたメモリを解放する。共有カーソルの破棄にこの関数を使用してはならない。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報を得るには GetLastError
を呼び出す。

[備考]
DestroyCursor
関数は非共有カーソルを破棄する。この関数で共有カーソルを破棄してはならない。共有カーソルはそれをロードしたモジュールがメモリ上に存在する限り有効である。次の関数は共有カーソルを取得する:
（以下省略）


%index
DestroyIcon
アイコンを破棄し、アイコンが占有していたメモリを解放する。
%group
Win32 user32
%prm
hIcon
hIcon : [intptr] 型: HICON 破棄するアイコンへのハンドル。アイコンは使用中であってはならない。
%inst
アイコンを破棄し、アイコンが占有していたメモリを解放する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報を得るには GetLastError
を呼び出す。

[備考]
DestroyIcon を呼ぶ必要があるのは、次の関数で作成されたアイコンおよびカーソルのみ:
CreateIconFromResourceEx(LR_SHARED
フラグなしで呼ばれた場合)、CreateIconIndirect、CopyIcon。共有アイコンの破棄にこの関数を使用してはならない。共有アイコンはそれをロードしたモジュールがメモリ上に存在する限り有効である。次の関数は共有アイコンを取得する。
（以下省略）


%index
LoadCursorW
アプリケーションインスタンスに関連付けられた実行ファイル(.EXE)から指定したカーソルリソースをロードする。(Unicode)
%group
Win32 user32
%prm
hInstance, lpCursorName
hInstance : [intptr] 型: HINSTANCE ロードするカーソルを含む実行ファイルを持つモジュールのインスタンスへのハンドル。
lpCursorName : [wstr] 型: LPCTSTR ロードするカーソルリソースの名前。代わりに、下位ワードにリソース識別子、上位ワードに 0 を指定する形式も使える。MAKEINTRESOURCE マクロでこの値を生成することもできる。定義済みカーソルを使うには hInstance に NULL、lpCursorName に次のいずれかの値を指定する。
%inst
アプリケーションインスタンスに関連付けられた実行ファイル(.EXE)から指定したカーソルリソースをロードする。(Unicode)

[戻り値]
型: HCURSOR 関数が成功した場合、戻り値は新たにロードされたカーソルへのハンドル。失敗した場合は
NULL。拡張エラー情報を得るには GetLastError を呼び出す。

[備考]
LoadCursor
はカーソルリソースがまだロードされていない場合のみロードし、既にロード済みであれば既存リソースのハンドルを返す。lpCursorName
がカーソルリソースへのポインタである場合にのみ有効なカーソルハンドルを返す。lpCursorName
がカーソル以外のリソース(アイコンなど)を指す場合、戻り値は NULL でなくとも有効なカーソルハンドルではない。LoadCursor
は現在の表示デバイスに最も適したカーソルリソースを検索する。カーソルリソースはカラーまたはモノクロビットマップでよい。DPI 仮想化 この
API は DPI 仮想化に参加しない。出力は呼び出しスレッドの DPI の影響を受けない。


%index
SetCursor
カーソルの形状を設定する。
%group
Win32 user32
%prm
hCursor
hCursor : [intptr] 型: HCURSOR カーソルへのハンドル。CreateCursor、CreateIconIndirect で作成されるか、LoadCursor、LoadImage でロードされたものでなければならない。NULL の場合、カーソルは画面から削除される。
%inst
カーソルの形状を設定する。

[戻り値]
型: HCURSOR 戻り値は以前のカーソルへのハンドル(存在した場合)。なかった場合は NULL。

[備考]

新しいカーソルが以前のカーソルと異なる場合のみカーソルが設定される。カーソルは共有リソースであり、クライアント領域内にあるときまたはマウス入力をキャプチャしているときにのみ設定すべきである。アプリケーションがカーソルを設定する場合、指定されたウィンドウクラスのクラスカーソルを
NULL にしておく必要がある(そうでないとマウス移動時にクラスカーソルが復元される)。内部カーソル表示カウントが 0
未満の場合、カーソルは画面に表示されない。


%index
GetCursorPos
マウスカーソルの位置をスクリーン座標で取得する。
%group
Win32 user32
%prm
lpPoint
lpPoint : [var] 型: LPPOINT カーソルのスクリーン座標を受け取る POINT 構造体へのポインタ。
%inst
マウスカーソルの位置をスクリーン座標で取得する。

[戻り値]
型: BOOL 成功した場合は 0 以外、失敗した場合は 0 を返す。拡張エラー情報を得るには GetLastError を呼び出す。

[備考]

カーソル位置は常にスクリーン座標で指定され、カーソルを含むウィンドウのマッピングモードの影響を受けない。呼び出し元プロセスはウィンドウステーションに対する
WINSTA_READATTRIBUTES アクセス権を持っている必要がある。GetCursorPos
呼び出し時、入力デスクトップがカレントデスクトップでなければならない。カレントデスクトップが入力デスクトップかどうかを判定するには
OpenInputDesktop を呼ぶ。そうでなければ、OpenInputDesktop が返す HDESK を指定して
SetThreadDesktop を呼び、そのデスクトップへ切り替える。


%index
SetCursorPos
カーソルを指定したスクリーン座標に移動する。
%group
Win32 user32
%prm
X, Y
X : [int] 型: int カーソルの新しい x 座標(スクリーン座標)。
Y : [int] 型: int カーソルの新しい y 座標(スクリーン座標)。
%inst
カーソルを指定したスクリーン座標に移動する。

[戻り値]
型: BOOL 成功した場合は 0 以外、失敗した場合は 0 を返す。拡張エラー情報を得るには GetLastError を呼び出す。

[備考]

カーソルは共有リソースである。ウィンドウはカーソルが自身のクライアント領域にあるときのみカーソルを移動すべきである。呼び出し元プロセスはウィンドウステーションに対する
WINSTA_WRITEATTRIBUTES アクセス権を持っている必要がある。SetCursorPos
呼び出し時、入力デスクトップがカレントデスクトップでなければならない。カレントデスクトップが入力デスクトップかどうかを判定するには
OpenInputDesktop を呼ぶ。そうでなければ、OpenInputDesktop が返す HDESK を指定して
SetThreadDesktop を呼び、そのデスクトップへ切り替える。


%index
GetSystemMetrics
指定されたシステムメトリックまたはシステム構成設定を取得する。
%group
Win32 user32
%prm
nIndex
nIndex : [int] 型: int
%inst
指定されたシステムメトリックまたはシステム構成設定を取得する。

[戻り値]
型: int 関数が成功した場合、戻り値は要求されたシステムメトリックまたは構成設定。失敗した場合は 0。GetLastError
は拡張エラー情報を提供しない。

[備考]
システムメトリックはディスプレイによって異なる場合がある。GetSystemMetrics(SM_CMONITORS)
は可視ディスプレイモニタのみをカウントする。SM_ARRANGE はシステムが最小化ウィンドウを配置する方法を指定する。
（以下省略）


%index
GetAsyncKeyState
呼び出し時にキーが押されているかどうか、および前回の GetAsyncKeyState 呼び出し以降に押されたかを判定する。
%group
Win32 user32
%prm
vKey
vKey : [int] 型: int 仮想キーコード。詳細は Virtual Key Codes を参照。左右を区別する定数を使うこともできる。
%inst
呼び出し時にキーが押されているかどうか、および前回の GetAsyncKeyState 呼び出し以降に押されたかを判定する。

[戻り値]
型: SHORT
成功した場合、戻り値はキーが前回の呼び出し以降に押されたか、および現在押されているかを示す。最上位ビットがセットされていればキーは押下中、最下位ビットがセットされていれば前回呼び出し以降に押された。
（以下省略）

[備考]
GetAsyncKeyState
はマウスボタンに対しても動作するが、物理マウスボタンの状態を調べる(論理ボタンではない)。VK_SHIFT、VK_CONTROL、VK_MENU
を vKey に使うと、左右を区別せずに SHIFT/CTRL/ALT の状態を取得する。左右を区別するには
VK_LSHIFT、VK_RSHIFT、VK_LCONTROL、VK_RCONTROL、VK_LMENU、VK_RMENU などを使う。
（以下省略）


%index
GetKeyState
指定された仮想キーの状態(押下/解放、トグル状態)を取得する。
%group
Win32 user32
%prm
nVirtKey
nVirtKey : [int] 型: int 仮想キー。A-Z、a-z、0-9 の場合は ASCII 値をセットする。それ以外は仮想キーコードを指定する。
%inst
指定された仮想キーの状態(押下/解放、トグル状態)を取得する。

[戻り値]
型: SHORT 戻り値は指定された仮想キーの状態を示す。
（以下省略）

[備考]

この関数が返すキーの状態は、スレッドがメッセージキューからキーメッセージを読み取るにつれて変化する。この状態はハードウェアレベルの状態を反映しない(そちらは
GetAsyncKeyState で取得する)。キーボード入力メッセージに応答して GetKeyState
を呼ぶと、入力メッセージが生成された時点のキー状態を取得できる。全仮想キーの状態は GetKeyboardState
で取得する。VK_SHIFT、VK_CONTROL、VK_MENU は SHIFT/CTRL/ALT
の左右を区別しない状態を返す。左右を区別するには VK_LSHIFT、VK_RSHIFT などを使う。


%index
FillRect
指定したブラシを使って矩形を塗りつぶす。左端と上端は含み、右端と下端は含まない。
%group
Win32 user32
%prm
hDC, lprc, hbr
hDC : [intptr] デバイスコンテキストへのハンドル。
lprc : [var] 塗りつぶす矩形の論理座標を含む RECT 構造体へのポインタ。
hbr : [intptr] 矩形を塗りつぶすのに使用するブラシへのハンドル。
%inst
指定したブラシを使って矩形を塗りつぶす。左端と上端は含み、右端と下端は含まない。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
hbr
は論理ブラシへのハンドルまたは色値のいずれか。論理ブラシを指定する場合、CreateHatchBrush、CreatePatternBrush、CreateSolidBrush
のいずれか、または GetStockObject でハンドルを取得する。色値を指定する場合、標準システム色の 1 つ(選択色に 1
を足した値)でなければならない。
（以下省略）


%index
FrameRect
指定したブラシを使って矩形の周囲に枠線を描画する。枠線の幅と高さは常に 1 論理単位。
%group
Win32 user32
%prm
hDC, lprc, hbr
hDC : [intptr] 枠を描画するデバイスコンテキストへのハンドル。
lprc : [var] 矩形の左上隅と右下隅の論理座標を含む RECT 構造体へのポインタ。
hbr : [intptr] 枠の描画に使用するブラシへのハンドル。
%inst
指定したブラシを使って矩形の周囲に枠線を描画する。枠線の幅と高さは常に 1 論理単位。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
hbr で指定されるブラシは CreateHatchBrush、CreatePatternBrush、CreateSolidBrush
で作成されているか、GetStockObject で取得されたものでなければならない。RECT の bottom が top
より小さい、または right が left より小さい場合、関数は矩形を描画しない。


%index
InvertRect
矩形内の各ピクセルの色値に対して論理 NOT 演算を行って、ウィンドウ内の矩形を反転する。
%group
Win32 user32
%prm
hDC, lprc
hDC : [intptr] デバイスコンテキストへのハンドル。
lprc : [var] 反転する矩形の論理座標を含む RECT 構造体へのポインタ。
%inst
矩形内の各ピクセルの色値に対して論理 NOT 演算を行って、ウィンドウ内の矩形を反転する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
モノクロ画面では InvertRect
は白ピクセルを黒に、黒ピクセルを白にする。カラー画面では画面の色生成方式によって反転結果が決まる。同じ矩形に対して InvertRect
を 2 回呼ぶと、画面は元の色に戻る。

