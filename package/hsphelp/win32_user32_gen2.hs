; ============================================================
;   user32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
UnloadKeyboardLayout
入力ロケール識別子(旧称キーボードレイアウト)をアンロードする。
%group
Win32 user32
%prm
hkl
hkl : [intptr] 型: HKL アンロードする入力ロケール識別子。
%inst
入力ロケール識別子(旧称キーボードレイアウト)をアンロードする。

[戻り値]
型: BOOL 成功時は 0 以外、失敗時は 0 を返す。失敗する可能性のある原因は以下の通り。
（以下省略）

[備考]

入力ロケール識別子はキーボードレイアウトより広い概念で、音声認識、IME、その他の入力形式を含む。システム既定の入力ロケール識別子のみがロードされている場合はアンロードできない。先に別の入力ロケール識別子をロードしてから既定をアンロードすること。


%index
ActivateKeyboardLayout
呼び出し元スレッドまたは現在のプロセスに対して入力ロケール識別子 (旧称: キーボードレイアウトハンドル) を設定する。入力ロケール識別子はロケールとキーボードの物理レイアウトを指定する。
%group
Win32 user32
%prm
hkl, Flags
hkl : [intptr] 型: HKL アクティブにする入力ロケール識別子。
Flags : [int] 型: UINT
%inst
呼び出し元スレッドまたは現在のプロセスに対して入力ロケール識別子 (旧称: キーボードレイアウトハンドル)
を設定する。入力ロケール識別子はロケールとキーボードの物理レイアウトを指定する。

[戻り値]
型: HKL 戻り値の型は HKL である。関数が成功した場合、戻り値は直前の入力ロケール識別子。失敗した場合は
0。拡張エラー情報を取得するには GetLastError 関数を使用する。

[備考]
この関数は現在のプロセスまたはスレッドのレイアウトのみに影響する。この関数はキーボードレイアウトに限定されない。hkl
パラメータは実際には入力ロケール識別子であり、これはキーボードレイアウトより広い概念で、音声入力変換器、IME (Input Method
Editor)、その他の入力形式を含む場合がある。複数の入力ロケール識別子を同時にロードしておくことができるが、アクティブにできるのは一度に
1 つだけである。複数ロードしておくと素早く切り替えられる。1 つのロケールに対して複数の IME が許可されている場合、上位ワード
(デバイスハンドル) がゼロの入力ロケール識別子を渡すと、そのロケールに属するリストの最初の IME
がアクティブになる。KLF_RESET および KLF_SHIFTLOCK フラグは、Caps Lock
状態の解除方法を変更する。既定では Caps Lock キーを再度押すことで解除される。KLF_RESET
のみ指定すると既定の状態に戻る。KLF_RESET と KLF_SHIFTLOCK を指定すると、いずれかの Caps Lock
キーを押すことで解除されるようになる。この機能は地域のキーボード動作標準や個人の好みに合わせるためにある。


%index
AddClipboardFormatListener
指定したウィンドウをシステムが管理するクリップボード形式リスナーリストに登録する。
%group
Win32 user32
%prm
hwnd
hwnd : [intptr] 型: HWND クリップボード形式リスナーリストに登録するウィンドウへのハンドル。
%inst
指定したウィンドウをシステムが管理するクリップボード形式リスナーリストに登録する。

[戻り値]
型: BOOL 成功すれば TRUE、それ以外は FALSE を返す。詳細は GetLastError を呼ぶ。

[備考]
ウィンドウがクリップボード形式リスナーリストに登録されると、クリップボードの内容が変更されるたびに WM_CLIPBOARDUPDATE
メッセージがポストされる。


%index
AdjustWindowRect
目的のクライアント矩形のサイズに基づいて、必要なウィンドウ矩形のサイズを計算する。計算結果のウィンドウ矩形は、目的のサイズのクライアント領域を持つウィンドウを作成するために CreateWindow 関数に渡せる。
%group
Win32 user32
%prm
lpRect, dwStyle, bMenu
lpRect : [var] 型: LPRECT 目的のクライアント領域の左上隅と右下隅の座標を含む RECT 構造体へのポインタ。関数の戻り時には、目的のクライアント領域を確保するためのウィンドウの左上隅と右下隅の座標が格納される。
dwStyle : [int] 型: DWORD 必要なサイズを計算する対象のウィンドウのウィンドウスタイル。WS_OVERLAPPED スタイルは指定できない点に注意。
bMenu : [int] 型: BOOL ウィンドウがメニューを持つかどうかを示す。
%inst

目的のクライアント矩形のサイズに基づいて、必要なウィンドウ矩形のサイズを計算する。計算結果のウィンドウ矩形は、目的のサイズのクライアント領域を持つウィンドウを作成するために
CreateWindow 関数に渡せる。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]

クライアント矩形とは、クライアント領域を完全に内包する最小の矩形である。ウィンドウ矩形とは、クライアント領域および非クライアント領域を含むウィンドウ全体を完全に内包する最小の矩形である。AdjustWindowRect
関数は、メニューバーが 2 行以上に折り返される場合に余分な領域を加えない。AdjustWindowRect 関数は WS_VSCROLL
や WS_HSCROLL スタイルを考慮しない。スクロールバーを考慮する場合は、SM_CXVSCROLL または SM_CYHSCROLL
を指定して GetSystemMetrics 関数を呼ぶ。


%index
AdjustWindowRectEx
目的のクライアント矩形のサイズに基づいて、必要なウィンドウ矩形のサイズを計算する。計算結果のウィンドウ矩形は、目的のサイズのクライアント領域を持つウィンドウを作成するために CreateWindowEx 関数に渡せる。
%group
Win32 user32
%prm
lpRect, dwStyle, bMenu, dwExStyle
lpRect : [var] 型: LPRECT 目的のクライアント領域の左上隅と右下隅の座標を含む RECT 構造体へのポインタ。関数の戻り時には、目的のクライアント領域を確保するためのウィンドウの左上隅と右下隅の座標が格納される。
dwStyle : [int] 型: DWORD 必要なサイズを計算する対象のウィンドウのウィンドウスタイル。WS_OVERLAPPED スタイルは指定できない点に注意。
bMenu : [int] 型: BOOL ウィンドウがメニューを持つかどうかを示す。
dwExStyle : [int] 型: DWORD 必要なサイズを計算する対象のウィンドウの拡張ウィンドウスタイル。
%inst

目的のクライアント矩形のサイズに基づいて、必要なウィンドウ矩形のサイズを計算する。計算結果のウィンドウ矩形は、目的のサイズのクライアント領域を持つウィンドウを作成するために
CreateWindowEx 関数に渡せる。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]

クライアント矩形とは、クライアント領域を完全に内包する最小の矩形である。ウィンドウ矩形とは、クライアント領域および非クライアント領域を含むウィンドウ全体を完全に内包する最小の矩形である。AdjustWindowRectEx
関数は、メニューバーが 2 行以上に折り返される場合に余分な領域を加えない。AdjustWindowRectEx 関数は
WS_VSCROLL や WS_HSCROLL スタイルを考慮しない。スクロールバーを考慮する場合は、SM_CXVSCROLL または
SM_CYHSCROLL を指定して GetSystemMetrics 関数を呼ぶ。この API は DPI
対応ではなく、呼び出し元スレッドがモニタごとの DPI 対応である場合は使用すべきではない。DPI 対応版については
AdjustWindowsRectExForDPI を参照。DPI 対応の詳細については Windows High DPI
のドキュメントを参照。


%index
AdjustWindowRectExForDpi
目的のクライアント矩形のサイズと指定された DPI に基づいて、必要なウィンドウ矩形のサイズを計算する。
%group
Win32 user32
%prm
lpRect, dwStyle, bMenu, dwExStyle, dpi
lpRect : [var] 目的のクライアント領域の左上隅と右下隅の座標を含む RECT 構造体へのポインタ。関数の戻り時には、目的のクライアント領域を確保するためのウィンドウの左上隅と右下隅の座標が格納される。
dwStyle : [int] 必要なサイズを計算する対象のウィンドウのウィンドウスタイル。WS_OVERLAPPED スタイルは指定できない点に注意。
bMenu : [int] ウィンドウがメニューを持つかどうかを示す。
dwExStyle : [int] 必要なサイズを計算する対象のウィンドウの拡張ウィンドウスタイル。
dpi : [int] スケーリングに使用する DPI 値。
%inst
目的のクライアント矩形のサイズと指定された DPI に基づいて、必要なウィンドウ矩形のサイズを計算する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
この関数は AdjustWindowRectEx と同じ結果を返すが、必要に応じて指定された任意の DPI に従ってスケーリングする。


%index
AllowSetForegroundWindow
指定したプロセスが SetForegroundWindow 関数を使用して前面ウィンドウを設定できるようにする。呼び出し元プロセスは既に前面ウィンドウを設定できる必要がある。詳細は本トピックの後の備考を参照。
%group
Win32 user32
%prm
dwProcessId
dwProcessId : [int] 型: DWORD 前面ウィンドウを設定できるようにするプロセスの識別子。このパラメータが ASFW_ANY の場合、すべてのプロセスが前面ウィンドウを設定できるようになる。
%inst
指定したプロセスが SetForegroundWindow
関数を使用して前面ウィンドウを設定できるようにする。呼び出し元プロセスは既に前面ウィンドウを設定できる必要がある。詳細は本トピックの後の備考を参照。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は
0。呼び出し元プロセスが前面ウィンドウを設定できない場合、関数が失敗する。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
システムはどのプロセスが前面ウィンドウを設定できるかを制限する。通常、プロセスが SetForegroundWindow
を呼んで前面ウィンドウを設定できるのは次の条件をすべて満たす場合に限られる: 呼び出し元プロセスが UWP アプリや Windows
8/8.1 向けの Windows ストアアプリではなく、デスクトップアプリケーションに属している。前面プロセスが
LockSetForegroundWindow を呼んで SetForegroundWindow
を無効化していない。前面ロックのタイムアウトが経過している (SystemParametersInfo の
SPI_GETFOREGROUNDLOCKTIMEOUT を参照)。アクティブなメニューが存在しない。さらに次のいずれか 1
つ以上が真である必要がある:
呼び出し元プロセスが前面プロセスである。呼び出し元プロセスが前面プロセスから起動された。現在前面ウィンドウが存在せず、したがって前面プロセスも存在しない。呼び出し元プロセスが最後の入力イベントを受け取った。前面プロセスまたは呼び出し元プロセスがデバッグ中である。前面ウィンドウを設定できるプロセスは、AllowSetForegroundWindow
を呼ぶことで他のプロセスにも前面ウィンドウを設定する権限を与えられる。dwProcessId
で指定されたプロセスは、ユーザが次に入力を生成する (その入力がそのプロセス向けでない場合) まで、または次に別のプロセスが
AllowSetForegroundWindow を呼ぶ (前回と同じプロセスを指定する場合を除く)
まで、前面ウィンドウを設定する能力を失う。


%index
AnimateWindow
ウィンドウを表示または非表示にするときに特殊効果を生成できるようにする。アニメーションは 4 種類: ロール、スライド、折りたたみまたは展開、アルファブレンドフェード。
%group
Win32 user32
%prm
hWnd, dwTime, dwFlags
hWnd : [intptr] 型: HWND アニメーションさせるウィンドウへのハンドル。呼び出し元スレッドがこのウィンドウを所有している必要がある。
dwTime : [int] 型: DWORD アニメーションの再生にかかる時間 (ミリ秒)。通常、アニメーションの再生には 200 ミリ秒かかる。
dwFlags : [int] 型: DWORD
%inst
ウィンドウを表示または非表示にするときに特殊効果を生成できるようにする。アニメーションは 4 種類:
ロール、スライド、折りたたみまたは展開、アルファブレンドフェード。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。次の状況で関数が失敗する:
（以下省略）

[備考]
特殊効果なしでウィンドウを表示・非表示にするには ShowWindow
を使用する。スライドまたはロールアニメーションを使うときは方向を指定する必要がある。AW_HOR_POSITIVE、AW_HOR_NEGATIVE、AW_VER_POSITIVE、AW_VER_NEGATIVE
のいずれかが使用できる。AW_HOR_POSITIVE または AW_HOR_NEGATIVE と AW_VER_POSITIVE または
AW_VER_NEGATIVE
を組み合わせて、ウィンドウを斜めにアニメーションさせることもできる。ウィンドウとその子ウィンドウのウィンドウプロシージャは
WM_PRINT または WM_PRINTCLIENT
メッセージを処理する必要がある。ダイアログボックス、コントロール、コモンコントロールは既に WM_PRINTCLIENT
を処理している。デフォルトのウィンドウプロシージャは既に WM_PRINT
を処理している。子ウィンドウが部分的にクリップされて表示されている場合、アニメーション時にクリップされた部分に穴ができる。AnimateWindow
は RTL ウィンドウをサポートする。ドロップシャドウを持つウィンドウのアニメーションは視覚的にぎくしゃくして気が散るため避けること。


%index
AnyPopup
所有された可視のトップレベルポップアップ、またはオーバーラップウィンドウが画面上に存在するかどうかを示す。この関数は呼び出し元アプリケーションのクライアント領域だけでなく画面全体を検索する。
%group
Win32 user32
%prm

%inst

所有された可視のトップレベルポップアップ、またはオーバーラップウィンドウが画面上に存在するかどうかを示す。この関数は呼び出し元アプリケーションのクライアント領域だけでなく画面全体を検索する。

[戻り値]
型: BOOL ポップアップウィンドウが存在する場合、たとえそれが他のウィンドウで完全に覆われていても、戻り値は 0
以外。ポップアップウィンドウが存在しない場合、戻り値は 0。

[備考]
この関数は、所有者を持たないポップアップウィンドウや WS_VISIBLE スタイルビットが設定されていないウィンドウは検出しない。


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
AppendMenuW
指定したメニューバー、ドロップダウンメニュー、サブメニュー、またはショートカットメニューの末尾に新しい項目を追加する。この関数を使ってメニュー項目の内容、外観、動作を指定できる。(Unicode)
%group
Win32 user32
%prm
hMenu, uFlags, uIDNewItem, lpNewItem
hMenu : [intptr] 型: HMENU 変更するメニューバー、ドロップダウンメニュー、サブメニュー、ショートカットメニューへのハンドル。
uFlags : [int] 型: UINT
uIDNewItem : [int] 型: UINT_PTR 新しいメニュー項目の識別子。uFlags が MF_POPUP に設定されている場合は、ドロップダウンメニューまたはサブメニューへのハンドル。
lpNewItem : [wstr] 型: LPCTSTR 新しいメニュー項目の内容。lpNewItem の解釈は uFlags パラメータが次の値を含むかどうかに依存する。
%inst

指定したメニューバー、ドロップダウンメニュー、サブメニュー、またはショートカットメニューの末尾に新しい項目を追加する。この関数を使ってメニュー項目の内容、外観、動作を指定できる。(Unicode)

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
アプリケーションは、メニューが表示されているウィンドウ内にあるかどうかにかかわらず、メニューが変更されるたびに DrawMenuBar
関数を呼ぶ必要がある。ビットマップ項目またはオーナードロー項目でキーボードアクセラレータを動作させるには、メニューの所有者が
WM_MENUCHAR メッセージを処理する必要がある。詳細はオーナードローメニューと WM_MENUCHAR
メッセージを参照。次のフラグのグループは一緒に使用できない:
（以下省略）


%index
AreDpiAwarenessContextsEqual
2 つの DPI_AWARENESS_CONTEXT 値が同一かどうかを判定する。
%group
Win32 user32
%prm
dpiContextA, dpiContextB
dpiContextA : [intptr] 比較する 1 番目の値。
dpiContextB : [intptr] 比較する 2 番目の値。
%inst
2 つの DPI_AWARENESS_CONTEXT 値が同一かどうかを判定する。

[戻り値]
値が等しい場合は TRUE、それ以外は FALSE を返す。

[備考]
DPI_AWARENESS_CONTEXT には複数の情報が含まれる。たとえば、現在の DPI_AWARENESS 値と継承された
DPI_AWARENESS 値の両方が含まれる。AreDpiAwarenessContextsEqual
は情報フラグを無視して値が等しいかどうかを判定する。これらの情報フラグがあるため、直接ビット比較はできない。


%index
ArrangeIconicWindows
指定された親ウィンドウのすべての最小化 (アイコン化) された子ウィンドウを整列する。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND 親ウィンドウへのハンドル。
%inst
指定された親ウィンドウのすべての最小化 (アイコン化) された子ウィンドウを整列する。

[戻り値]
型: UINT 関数が成功した場合、戻り値はアイコン 1 行分の高さ。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
独自に最小化された子ウィンドウを管理するアプリケーションは、ArrangeIconicWindows
関数を使って親ウィンドウ内のアイコンを整列できる。この関数はデスクトップ上のアイコンも整列できる。デスクトップウィンドウへのウィンドウハンドルを取得するには
GetDesktopWindow 関数を使用する。アプリケーションは MDI クライアントウィンドウに WM_MDIICONARRANGE
メッセージを送信して、最小化された MDI 子ウィンドウを整列するように要求する。


%index
AttachThreadInput
あるスレッドの入力処理メカニズムを別のスレッドにアタッチする、またはそのアタッチを解除する。
%group
Win32 user32
%prm
idAttach, idAttachTo, fAttach
idAttach : [int] 別のスレッドにアタッチするスレッドの識別子。アタッチするスレッドはシステムスレッドであってはならない。
idAttachTo : [int] idAttach がアタッチされる先のスレッドの識別子。このスレッドはシステムスレッドであってはならない。
fAttach : [int] このパラメータが TRUE の場合、2 つのスレッドがアタッチされる。FALSE の場合は切り離される。
%inst
あるスレッドの入力処理メカニズムを別のスレッドにアタッチする、またはそのアタッチを解除する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。Windows Server 2003 および Windows XP では拡張エラー情報はなく、GetLastError
を呼んではならない。この動作は Windows Vista 以降で変更された。

[備考]
AttachThreadInput
関数を使うと、スレッドはキーボード状態や現在のフォーカスウィンドウなどの入力状態を別のスレッドと共有できる。両方のスレッドが受け取るキーボードおよびマウスイベントは、AttachThreadInput
を 2 回目に呼び出して fAttach に FALSE
を指定して切り離すまで、受信した順に処理される。AttachThreadInput
関数は、指定されたスレッドのいずれかがメッセージキューを持たない場合は失敗する。システムは、スレッドが USER または GDI
関数を最初に呼び出したときにそのスレッドのメッセージキューを作成する。AttachThreadInput
関数は、ジャーナル記録フックがインストールされている場合も失敗する。ジャーナル記録フックはすべての入力キューを連結する。GetKeyState
や GetKeyboardState で取得できるキー状態は、AttachThreadInput
呼び出し後にリセットされる点に注意。別のデスクトップにあるスレッドにアタッチすることはできない。


%index
BeginDeferWindowPos
複数ウィンドウ位置構造体のためのメモリを割り当て、その構造体へのハンドルを返す。
%group
Win32 user32
%prm
nNumWindows
nNumWindows : [int] 型: int 位置情報を格納するウィンドウの初期数。必要に応じて DeferWindowPos 関数が構造体のサイズを増加させる。
%inst
複数ウィンドウ位置構造体のためのメモリを割り当て、その構造体へのハンドルを返す。

[戻り値]
型: HDWP
関数が成功した場合、戻り値は複数ウィンドウ位置構造体を識別する。構造体を割り当てるシステムリソースが不足している場合、戻り値は
NULL。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
複数ウィンドウ位置構造体は内部構造体であり、アプリケーションから直接アクセスすることはできない。
DeferWindowPos は、これから移動される 1
つまたは複数のウィンドウの目的位置に関する情報を構造体に書き込む。EndDeferWindowPos
関数はこの構造体へのハンドルを受け取り、構造体に格納された情報に基づいてウィンドウの位置を変更する。nNumWindows
パラメータで指定された初期サイズを超えて構造体のサイズを増やす必要があるが、十分なメモリを割り当てられない場合、システムはウィンドウ位置決めシーケンス全体
(BeginDeferWindowPos、DeferWindowPos、EndDeferWindowPos)
を失敗させる。必要となる最大サイズを指定することで、アプリケーションは処理の早い段階で失敗を検出して処理できる。


%index
BeginPaint
BeginPaint 関数は、指定されたウィンドウを描画用に準備し、PAINTSTRUCT 構造体に描画情報を書き込む。
%group
Win32 user32
%prm
hWnd, lpPaint
hWnd : [intptr] 再描画するウィンドウへのハンドル。
lpPaint : [var] 描画情報を受け取る PAINTSTRUCT 構造体へのポインタ。
%inst
BeginPaint 関数は、指定されたウィンドウを描画用に準備し、PAINTSTRUCT 構造体に描画情報を書き込む。

[戻り値]
関数が成功した場合、戻り値は指定されたウィンドウのディスプレイデバイスコンテキストへのハンドル。関数が失敗した場合、戻り値は NULL
で、利用可能なディスプレイデバイスコンテキストがないことを示す。

[備考]
BeginPaint 関数は、デバイスコンテキストのクリッピング領域を更新領域外を除外するように自動的に設定する。更新領域は
InvalidateRect または InvalidateRgn
関数によって設定され、また、サイズ変更、移動、作成、スクロール、その他クライアント領域に影響する操作の後にシステムによって設定される。更新領域が消去対象としてマークされている場合、BeginPaint
はウィンドウに WM_ERASEBKGND メッセージを送信する。アプリケーションは WM_PAINT メッセージへの応答以外で
BeginPaint を呼ぶべきではない。BeginPaint の呼び出しごとに対応する EndPaint
呼び出しが必要である。キャレットが描画される領域内にある場合、BeginPaint
はキャレットが消去されないように自動的に非表示にする。ウィンドウのクラスが背景ブラシを持つ場合、BeginPaint
はそのブラシを使って更新領域の背景を消去してから戻る。DPI 仮想化: この API は DPI
仮想化に参加しない。返される出力は常に物理ピクセル単位である。


%index
BlockInput
キーボードおよびマウスの入力イベントがアプリケーションに到達するのをブロックする。
%group
Win32 user32
%prm
fBlockIt
fBlockIt : [int] 型: BOOL 関数の目的。このパラメータが TRUE の場合、キーボードおよびマウスの入力イベントがブロックされる。FALSE の場合はブロックが解除される。入力をブロックしたスレッドのみがブロックを解除できる点に注意。
%inst
キーボードおよびマウスの入力イベントがアプリケーションに到達するのをブロックする。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。入力が既にブロックされている場合、戻り値は 0。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
入力がブロックされている間、マウスやキーボードからの実際の物理入力は、入力キューの同期キー状態 (GetKeyState や
GetKeyboardState で報告) や非同期キー状態 (GetAsyncKeyState で報告)
に影響しない。ただし、入力をブロックしているスレッドは SendInput
を呼ぶことで両方のキー状態に影響を与えることができる。他のスレッドはこれを行えない。次の場合、システムは入力のブロックを解除する:
（以下省略）


%index
BringWindowToTop
指定したウィンドウを Z オーダーの先頭に持ってくる。ウィンドウがトップレベルウィンドウであればアクティブ化される。子ウィンドウであれば、その子ウィンドウに関連付けられたトップレベルの親ウィンドウがアクティブ化される。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND Z オーダーの先頭に持ってくるウィンドウへのハンドル。
%inst
指定したウィンドウを Z
オーダーの先頭に持ってくる。ウィンドウがトップレベルウィンドウであればアクティブ化される。子ウィンドウであれば、その子ウィンドウに関連付けられたトップレベルの親ウィンドウがアクティブ化される。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
BringWindowToTop
関数を使うと、他のウィンドウに部分的または完全に隠されているウィンドウを表に出すことができる。この関数を呼ぶことは、SetWindowPos
関数を呼んで Z オーダー内のウィンドウの位置を変更することと似ている。BringWindowToTop
はウィンドウをトップレベルウィンドウにはしない。


%index
BroadcastSystemMessageW
指定された受信者にメッセージを送信する。(BroadcastSystemMessageW)
%group
Win32 user32
%prm
flags, lpInfo, Msg, wParam, lParam
flags : [int] 型: DWORD
lpInfo : [var] 型: LPDWORD メッセージの受信者に関する情報を保持し受け取る変数へのポインタ。
Msg : [int] 型: UINT 送信するメッセージ。システム提供メッセージのリストについては System-Defined Messages を参照。
wParam : [intptr] 型: WPARAM 追加のメッセージ固有情報。
lParam : [intptr] 型: LPARAM 追加のメッセージ固有情報。
%inst
指定された受信者にメッセージを送信する。(BroadcastSystemMessageW)

[戻り値]
型: long 関数が成功した場合、戻り値は正の値。メッセージをブロードキャストできない場合、戻り値は -1。dwFlags が
BSF_QUERY で、少なくとも 1 つの受信者が対応するメッセージに対して BROADCAST_QUERY_DENY
を返した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
BSF_QUERY
が指定されていない場合、関数は要求された全受信者に指定メッセージを送信し、それらが返す値は無視する。システムはシステムメッセージ (0
から WM_USER-1 の範囲) のマーシャリングのみを行う。それ以外のメッセージ (WM_USER 以上)
を別プロセスに送るには独自のマーシャリングが必要である。


%index
CloseDesktop
デスクトップオブジェクトへのオープン中のハンドルを閉じる。
%group
Win32 user32
%prm
hDesktop
hDesktop : [intptr] 閉じるデスクトップへのハンドル。CreateDesktop、OpenDesktop、または OpenInputDesktop が返したハンドル。GetThreadDesktop が返したハンドルを指定してはならない。
%inst
デスクトップオブジェクトへのオープン中のハンドルを閉じる。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
CloseDesktop
関数は、呼び出し元プロセス内のいずれかのスレッドが指定されたデスクトップハンドルを使用している場合、またはハンドルが呼び出し元プロセスの初期デスクトップを参照している場合、失敗する。


%index
BroadcastSystemMessageExW
指定された受信者にメッセージを送信する。(BroadcastSystemMessageExW)
%group
Win32 user32
%prm
flags, lpInfo, Msg, wParam, lParam, pbsmInfo
flags : [int] 型: DWORD
lpInfo : [var] 型: LPDWORD メッセージの受信者に関する情報を保持し受け取る変数へのポインタ。
Msg : [int] 型: UINT 送信するメッセージ。システム提供メッセージのリストについては System-Defined Messages を参照。
wParam : [intptr] 型: WPARAM 追加のメッセージ固有情報。
lParam : [intptr] 型: LPARAM 追加のメッセージ固有情報。
pbsmInfo : [var] 型: PBSMINFO 要求が拒否され dwFlags が BSF_QUERY に設定されている場合の追加情報を格納する BSMINFO 構造体へのポインタ。
%inst
指定された受信者にメッセージを送信する。(BroadcastSystemMessageExW)

[戻り値]
型: long 関数が成功した場合、戻り値は正の値。メッセージをブロードキャストできない場合、戻り値は -1。dwFlags が
BSF_QUERY で、少なくとも 1 つの受信者が対応するメッセージに対して BROADCAST_QUERY_DENY
を返した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
BSF_QUERY
が指定されていない場合、関数は要求された全受信者に指定メッセージを送信し、それらが返す値は無視する。呼び出し元のスレッドが要求を拒否したウィンドウとは別のデスクトップにある場合、呼び出し元はそのウィンドウ上で何かを問い合わせるために
SetThreadDesktop(hdesk) を呼ぶ必要がある。また、返された hdesk ハンドルに対して CloseDesktop
を呼ぶ必要もある。システムはシステムメッセージ (0 から WM_USER-1 の範囲) のマーシャリングのみを行う。それ以外のメッセージ
(WM_USER 以上) を別プロセスに送るには独自のマーシャリングが必要である。
> [!NOTE] > winuser.h ヘッダは BroadcastSystemMessageEx
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づき自動的に ANSI/Unicode
版を選択する。エンコーディング非依存のエイリアスとそうでないコードを混在させると、コンパイル時または実行時のエラーにつながる不一致が生じる可能性がある。詳細は
Conventions for Function Prototypes を参照。


%index
CalculatePopupWindowPosition
指定されたアンカーポイント、ポップアップウィンドウサイズ、フラグ、およびオプションの除外矩形を使って、適切なポップアップウィンドウ位置を計算する。
%group
Win32 user32
%prm
anchorPoint, windowSize, flags, excludeRect, popupWindowPosition
anchorPoint : [var] 型: const POINT* 指定するアンカーポイント。
windowSize : [var] 型: const SIZE* 指定するウィンドウサイズ。
flags : [int] 型: UINT 関数がポップアップウィンドウを水平・垂直方向にどのように配置するかを指定するフラグのいずれかを使用する。フラグは TrackPopupMenuEx 関数の垂直・水平配置フラグと同じ。
excludeRect : [var] 型: RECT* 除外矩形を指定する構造体へのポインタ。NULL でもよい。
popupWindowPosition : [var] 型: RECT* ポップアップウィンドウの位置を指定する構造体へのポインタ。
%inst

指定されたアンカーポイント、ポップアップウィンドウサイズ、フラグ、およびオプションの除外矩形を使って、適切なポップアップウィンドウ位置を計算する。

[戻り値]
型: BOOL 関数が成功した場合、TRUE を返す。それ以外は FALSE を返す。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
TPM_WORKAREA は TrackPopupMenu および TrackPopupMenuEx 関数でサポートされる。


%index
CallMsgFilterW
WH_SYSMSGFILTER および WH_MSGFILTER フックに関連付けられたフックプロシージャに、指定したメッセージとフックコードを渡す。(Unicode)
%group
Win32 user32
%prm
lpMsg, nCode
lpMsg : [var] 型: LPMSG フックプロシージャに渡すメッセージを含む MSG 構造体へのポインタ。
nCode : [int] 型: int フックプロシージャがメッセージの処理方法を判断するために使うアプリケーション定義のコード。このコードは WH_SYSMSGFILTER および WH_MSGFILTER フックに関連付けられたシステム定義のフックコード (MSGF_ および HC_) と同じ値であってはならない。
%inst
WH_SYSMSGFILTER および WH_MSGFILTER
フックに関連付けられたフックプロシージャに、指定したメッセージとフックコードを渡す。(Unicode)

[戻り値]
型: BOOL アプリケーションがさらにメッセージを処理すべき場合、戻り値は 0。処理すべきでない場合、戻り値は 0 以外。

[備考]
システムは、ダイアログボックス、メッセージボックス、メニュー、スクロールバーの内部処理中、またはユーザが ALT+TAB
で別ウィンドウをアクティブにしたときに、アプリケーションがメッセージのフローを検査・制御できるよう CallMsgFilter
を呼ぶ。このフックプロシージャは SetWindowsHookEx 関数を使ってインストールする。


%index
UnhookWindowsHookEx
SetWindowsHookEx 関数によってフックチェーンにインストールされたフックプロシージャを削除する。
%group
Win32 user32
%prm
hhk
hhk : [intptr] 型: HHOOK 削除するフックへのハンドル。
%inst
SetWindowsHookEx 関数によってフックチェーンにインストールされたフックプロシージャを削除する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
UnhookWindowsHookEx が戻った後でも、フックプロシージャが別のスレッドによって呼ばれている状態である可能性がある。


%index
CallNextHookEx
現在のフックチェーン内の次のフックプロシージャにフック情報を渡す。フックプロシージャは、フック情報を処理する前か後のどちらかでこの関数を呼べる。
%group
Win32 user32
%prm
hhk, nCode, wParam, lParam
hhk : [intptr] 型: HHOOK このパラメータは無視される。
nCode : [int] 型: int 現在のフックプロシージャに渡されたフックコード。次のフックプロシージャはこのコードを使ってフック情報の処理方法を決定する。
wParam : [intptr] 型: WPARAM 現在のフックプロシージャに渡された wParam の値。このパラメータの意味は、現在のフックチェーンに関連付けられたフックの種類による。
lParam : [intptr] 型: LPARAM 現在のフックプロシージャに渡された lParam の値。このパラメータの意味は、現在のフックチェーンに関連付けられたフックの種類による。
%inst

現在のフックチェーン内の次のフックプロシージャにフック情報を渡す。フックプロシージャは、フック情報を処理する前か後のどちらかでこの関数を呼べる。

[戻り値]
型: LRESULT
この値はチェーン内の次のフックプロシージャによって返される。現在のフックプロシージャもこの値を返す必要がある。戻り値の意味はフックタイプによる。詳細は個々のフックプロシージャの説明を参照。

[備考]
フックプロシージャは特定のフックタイプに対してチェーン形式でインストールされる。CallNextHookEx
はチェーン内の次のフックを呼び出す。CallNextHookEx
の呼び出しは任意だが、強く推奨される。呼び出さないと、他のフックをインストールしているアプリケーションがフック通知を受け取れず、結果として正しく動作しなくなる可能性がある。他のアプリケーションに通知を見せたくない場合を除き、CallNextHookEx
を呼ぶべきである。


%index
CallWindowProcW
メッセージ情報を指定したウィンドウプロシージャに渡す。(Unicode)
%group
Win32 user32
%prm
lpPrevWndFunc, hWnd, Msg, wParam, lParam
lpPrevWndFunc : [int] 型: WNDPROC 直前のウィンドウプロシージャ。GetWindowLong 関数の nIndex を GWL_WNDPROC または DWL_DLGPROC に設定して取得した場合、これは実際にはウィンドウまたはダイアログプロシージャのアドレスか、CallWindowProc にのみ意味のある特殊な内部値である。
hWnd : [intptr] 型: HWND メッセージを受け取るウィンドウプロシージャへのハンドル。
Msg : [int] 型: UINT メッセージ。
wParam : [intptr] 型: WPARAM 追加のメッセージ固有情報。このパラメータの内容は Msg パラメータの値による。
lParam : [intptr] 型: LPARAM 追加のメッセージ固有情報。このパラメータの内容は Msg パラメータの値による。
%inst
メッセージ情報を指定したウィンドウプロシージャに渡す。(Unicode)

[戻り値]
型: LRESULT 戻り値はメッセージ処理の結果を表し、送信されたメッセージに依存する。

[備考]
ウィンドウのサブクラス化には CallWindowProc 関数を使用する。通常、同じクラスを持つすべてのウィンドウは 1
つのウィンドウプロシージャを共有する。サブクラスとは、同じクラスを持つウィンドウまたはウィンドウ群で、そのメッセージがクラスのウィンドウプロシージャに渡される前に別のウィンドウプロシージャによってインターセプトされ処理されるものである。SetWindowLong
関数は、特定のウィンドウに関連付けられたウィンドウプロシージャを変更してサブクラスを作成し、システムが以前のものではなく新しいウィンドウプロシージャを呼ぶようにする。アプリケーションは新しいウィンドウプロシージャで処理しなかったメッセージを
CallWindowProc
を呼んで以前のウィンドウプロシージャに渡す必要がある。これによりアプリケーションはウィンドウプロシージャのチェーンを作成できる。STRICT
が定義されている場合、lpPrevWndFunc パラメータの型は WNDPROC である。WNDPROC 型は次のように宣言されている:
（以下省略）


%index
CancelShutdown
(no summary)
%group
Win32 user32
%prm

%inst



%index
CascadeWindows
指定された親ウィンドウの指定された子ウィンドウをカスケード表示する。
%group
Win32 user32
%prm
hwndParent, wHow, lpRect, cKids, lpKids
hwndParent : [intptr] 型: HWND 親ウィンドウへのハンドル。NULL の場合、デスクトップウィンドウが想定される。
wHow : [int] 型: UINT
lpRect : [var] 型: const RECT* ウィンドウを整列するクライアント座標の矩形領域を指定する構造体へのポインタ。NULL の場合、親ウィンドウのクライアント領域が使われる。
cKids : [int] 型: UINT lpKids パラメータで指定された配列の要素数。lpKids が NULL の場合は無視される。
lpKids : [intptr] 型: const HWND* 整列する子ウィンドウのハンドルの配列。指定された子ウィンドウが WS_EX_TOPMOST または WS_EX_TOOLWINDOW スタイルを持つトップレベルウィンドウである場合、その子ウィンドウは整列されない。NULL の場合、指定された親ウィンドウ (またはデスクトップウィンドウ) のすべての子ウィンドウが整列される。
%inst
指定された親ウィンドウの指定された子ウィンドウをカスケード表示する。

[戻り値]
型: WORD 関数が成功した場合、戻り値は整列されたウィンドウの数。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
既定では、CascadeWindows は lpKids 配列で与えられた順序でウィンドウを整列するが、Z
オーダーは保持する。MDITILE_ZORDER フラグを指定すると、CascadeWindows は Z
オーダーで整列する。CascadeWindows を呼ぶと、すべての最大化ウィンドウが以前のサイズに戻される。


%index
ChangeClipboardChain
指定したウィンドウをクリップボードビューアのチェーンから取り除く。
%group
Win32 user32
%prm
hWndRemove, hWndNewNext
hWndRemove : [intptr] 型: HWND チェーンから削除するウィンドウへのハンドル。SetClipboardViewer 関数に渡されたものでなければならない。
hWndNewNext : [intptr] 型: HWND クリップボードビューアチェーン内で hWndRemove ウィンドウの次に続くウィンドウへのハンドル。(これは通常 SetClipboardViewer が返したハンドルだが、WM_CHANGECBCHAIN メッセージへの応答でシーケンスが変更された場合は別。)
%inst
指定したウィンドウをクリップボードビューアのチェーンから取り除く。

[戻り値]
型: BOOL 戻り値は WM_CHANGECBCHAIN
メッセージをクリップボードビューアチェーン内のウィンドウに渡した結果を示す。チェーン内のウィンドウは通常 WM_CHANGECBCHAIN
を処理するときに FALSE を返すため、ChangeClipboardChain の戻り値も通常 FALSE になる。チェーン内に 1
つだけウィンドウがある場合、戻り値は通常 TRUE。

[備考]
hWndNewNext で識別されるウィンドウがチェーン内の hWndRemove
ウィンドウを置き換える。SetClipboardViewer 関数はクリップボードビューアチェーンの先頭ウィンドウに
WM_CHANGECBCHAIN メッセージを送信する。例については Removing a Window from the
Clipboard Viewer Chain を参照。


%index
ChangeDisplaySettingsW
ChangeDisplaySettings 関数は、既定のディスプレイデバイスの設定を指定したグラフィックモードに変更する。(Unicode)
%group
Win32 user32
%prm
lpDevMode, dwFlags
lpDevMode : [var] 新しいグラフィックモードを記述する DEVMODE 構造体へのポインタ。lpDevMode が NULL の場合、レジストリに現在ある値がディスプレイ設定に使われる。lpDevMode に NULL、dwFlags に 0 を渡すのは、動的なモード変更後に既定モードに戻す最も簡単な方法である。DEVMODE の dmSize メンバには DEVMODE 構造体のサイズ (バイト) を初期化する必要がある。dmDriverExtra メンバには、DEVMODE 構造体に続くプライベートドライバデータのバイト数を初期化する必要がある。さらに、DEVMODE 構造体の以下のメンバを必要に応じて使用できる。
dwFlags : [int] 
%inst
ChangeDisplaySettings
関数は、既定のディスプレイデバイスの設定を指定したグラフィックモードに変更する。(Unicode)

[戻り値]
ChangeDisplaySettings 関数は次のいずれかの値を返す。
（以下省略）

[備考]
ChangeDisplaySettings に渡す DEVMODE
構造体が有効でディスプレイドライバがサポートする値のみを含むことを保証するには、EnumDisplaySettings 関数が返した
DEVMODE を使用する。ディスプレイモードが動的に変更されると、次のメッセージパラメータで WM_DISPLAYCHANGE
メッセージが実行中のすべてのアプリケーションに送られる。
（以下省略）


%index
ChangeDisplaySettingsExW
ChangeDisplaySettingsEx 関数は、指定したディスプレイデバイスの設定を指定したグラフィックモードに変更する。(Unicode)
%group
Win32 user32
%prm
lpszDeviceName, lpDevMode, hwnd, dwflags, lParam
lpszDeviceName : [wstr] グラフィックモードを変更するディスプレイデバイスを指定する null 終端文字列へのポインタ。EnumDisplayDevices が返すディスプレイデバイス名のみ有効。これらに関連付けられた名前の詳細については EnumDisplayDevices を参照。lpszDeviceName は NULL でもよい。NULL は既定のディスプレイデバイスを指定する。既定のデバイスは EnumDisplayDevices を呼んで DISPLAY_DEVICE_PRIMARY_DEVICE フラグを確認することで判別できる。
lpDevMode : [var] 新しいグラフィックモードを記述する DEVMODE 構造体へのポインタ。lpDevMode が NULL の場合、レジストリに現在ある値がディスプレイ設定に使われる。lpDevMode に NULL、dwFlags に 0 を渡すのは、動的なモード変更後に既定モードに戻す最も簡単な方法である。dmSize メンバには DEVMODE 構造体のサイズ (バイト) を初期化する必要がある。dmDriverExtra メンバには、DEVMODE 構造体に続くプライベートドライバデータのバイト数を示す値を初期化する必要がある。さらに、DEVMODE 構造体の以下のメンバを使用できる。
hwnd : [intptr] 予約されており、NULL でなければならない。
dwflags : [int] 
lParam : [intptr] dwFlags が CDS_VIDEOPARAMETERS の場合、lParam は VIDEOPARAMETERS 構造体へのポインタ。それ以外の場合、lParam は NULL でなければならない。
%inst
ChangeDisplaySettingsEx
関数は、指定したディスプレイデバイスの設定を指定したグラフィックモードに変更する。(Unicode)

[戻り値]
ChangeDisplaySettingsEx 関数は次のいずれかの値を返す。
（以下省略）

[備考]
ChangeDisplaySettingsEx に渡す DEVMODE
構造体が有効でディスプレイドライバがサポートする値のみを含むことを保証するには、EnumDisplaySettings 関数が返した
DEVMODE を使用する。プログラムによって複数モニタシステムにディスプレイモニタを追加する場合、DEVMODE.dmFields に
DM_POSITION を設定し、追加するモニタの位置 (DEVMODE.dmPosition) を、既存モニタの表示領域の少なくとも 1
ピクセルに隣接するように指定する。モニタを切り離すには DEVMODE.dmFields に DM_POSITION
を設定し、DEVMODE.dmPelsWidth と DEVMODE.dmPelsHeight を 0 にする。詳細は Multiple
Display Monitors を参照。ディスプレイモードが動的に変更されると、次のメッセージパラメータで
WM_DISPLAYCHANGE メッセージが実行中のすべてのアプリケーションに送られる。
（以下省略）


%index
ChangeMenuW
(no summary)
%group
Win32 user32
%prm
hMenu, cmd, lpszNewItem, cmdInsert, flags
hMenu : [intptr] 
cmd : [int] 
lpszNewItem : [wstr] 
cmdInsert : [int] 
flags : [int] 
%inst



%index
ChangeWindowMessageFilter
ユーザインターフェース特権分離 (UIPI) のメッセージフィルタからメッセージを追加または削除する。
%group
Win32 user32
%prm
message, dwFlag
message : [int] 型: UINT フィルタに追加または削除するメッセージ。
dwFlag : [int] 型: DWORD
%inst
ユーザインターフェース特権分離 (UIPI) のメッセージフィルタからメッセージを追加または削除する。

[戻り値]
型: BOOL 成功した場合は TRUE、それ以外は FALSE。拡張エラー情報を取得するには GetLastError を呼ぶ。
注意: メッセージをフィルタから削除できても、それがブロックされる保証ではない。詳細は備考を参照。

[備考]
UIPI は、より低い整合性レベルの送信元からメッセージを受信させないセキュリティ機能である。WM_USER
より大きい値を持つそのようなメッセージはすべて既定でブロックされる。フィルタは直感に反するが、許可されるメッセージのリストである。したがってフィルタにメッセージを追加すると、より低い整合性の送信元からそのメッセージを受信できるようになり、フィルタから削除するとブロックされる。WM_USER
より小さい値の特定のメッセージは、フィルタ設定に関係なくフィルタを通過する必要がある。これらのメッセージをフィルタから削除するためにこの関数を呼ぶこともでき、TRUE
を返すが、メッセージは依然として呼び出し元プロセスによって受信される。SECURITY_MANDATORY_LOW_RID
以下のプロセスはフィルタを変更できない。それらが本関数を呼ぶと失敗する。整合性レベルの詳細については Understanding and
Working in Protected Mode Internet Explorer を参照。


%index
ChangeWindowMessageFilterEx
指定したウィンドウに対してユーザインターフェース特権分離 (UIPI) メッセージフィルタを変更する。
%group
Win32 user32
%prm
hwnd, message, action, pChangeFilterStruct
hwnd : [intptr] 型: HWND UIPI メッセージフィルタを変更するウィンドウへのハンドル。
message : [int] 型: UINT メッセージフィルタが通すか、ブロックするメッセージ。
action : [int] 型: DWORD
pChangeFilterStruct : [var] 型: PCHANGEFILTERSTRUCT CHANGEFILTERSTRUCT 構造体へのオプションのポインタ。
%inst
指定したウィンドウに対してユーザインターフェース特権分離 (UIPI) メッセージフィルタを変更する。

[戻り値]
型: BOOL 関数が成功した場合は TRUE、それ以外は FALSE。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
UIPI
は、より低い整合性レベルの送信元からメッセージを受信させないセキュリティ機能である。この関数を使うと、より低い整合性レベルのプロセスからのメッセージでも特定のメッセージをウィンドウに配信できる。プロセス全体のメッセージフィルタを制御する
ChangeWindowMessageFilter とは異なり、ChangeWindowMessageFilterEx
はウィンドウのメッセージフィルタを制御する。
アプリケーションは ChangeWindowMessageFilter
を使ってプロセス全体でメッセージを許可またはブロックできる。プロセスメッセージフィルタとウィンドウメッセージフィルタのいずれかでメッセージが許可されていれば、ウィンドウに配信される。
SECURITY_MANDATORY_LOW_RID
以下のプロセスはメッセージフィルタを変更できない点に注意。これらのプロセスがこの関数を呼ぶと失敗し、ERROR_ACCESS_DENIED
の拡張エラーコードを生成する。
WM_USER
より小さい特定のメッセージは、フィルタ設定に関係なくフィルタを通過する必要がある。これらのメッセージを許可またはブロックするためにこの関数を使っても効果はない。


%index
CharLowerW
文字列または単一の文字を小文字に変換する。オペランドが文字列の場合、関数は文字をその場で変換する。(Unicode)
%group
Win32 user32
%prm
lpsz
lpsz : [wstr] 型: LPTSTR null 終端文字列、または単一の文字を指定する。このパラメータの上位ワードが 0 の場合、下位ワードに変換する単一の文字を含めなければならない。
%inst
文字列または単一の文字を小文字に変換する。オペランドが文字列の場合、関数は文字をその場で変換する。(Unicode)

[戻り値]
型: LPTSTR オペランドが文字列の場合、関数は変換後の文字列へのポインタを返す。文字列はその場で変換されるため、戻り値は lpsz
と等しい。オペランドが単一文字の場合、戻り値は上位ワードが 0、下位ワードに変換後の文字を含む 32
ビット値である。成功・失敗の表示はない。失敗はまれである。この関数に拡張エラー情報はない。GetLastError を呼んではならない。

[備考]
CharLower は、現在の言語がトルコ語またはアゼルバイジャン語であっても常に大文字 I を小文字 I ("i")
にマップすることに注意。言語的に敏感な関数が必要な場合は LCMapString を呼ぶ。ANSI 版での Unicode
への変換はすべての場合、システム既定のロケールで行われる。
> [!NOTE] > winuser.h ヘッダは CharLower をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づき自動的に ANSI/Unicode
版を選択する。エンコーディング非依存のエイリアスとそうでないコードを混在させると、コンパイル時または実行時のエラーにつながる不一致が生じる可能性がある。詳細は
Conventions for Function Prototypes を参照。


%index
CharLowerBuffW
バッファ内の大文字を小文字に変換する。文字はその場で変換される。(Unicode)
%group
Win32 user32
%prm
lpsz, cchLength
lpsz : [wstr] 型: LPTSTR 処理する 1 つ以上の文字を格納したバッファ。
cchLength : [int] 型: DWORD lpsz が指すバッファのサイズ (文字数)。関数は各文字を調べ、大文字を小文字に変換する。null 文字が含まれていても cchLength で示される文字数を調べる。
%inst
バッファ内の大文字を小文字に変換する。文字はその場で変換される。(Unicode)

[戻り値]
型: DWORD 戻り値は処理された文字数。たとえば CharLowerBuff("Acme of Operating Systems",
10) が成功すると、戻り値は 10 になる。

[備考]
CharLowerBuff は、現在の言語がトルコ語またはアゼルバイジャン語であっても常に大文字 I を小文字 I ("i")
にマップすることに注意。言語的に敏感な関数が必要な場合は LCMapString を呼ぶ。ANSI 版での Unicode
への変換はすべての場合、システム既定のロケールで行われる。


%index
CharNextW
文字列内の次の文字へのポインタを取得する。この関数はシングルバイトまたはマルチバイト文字からなる文字列を扱える。(Unicode)
%group
Win32 user32
%prm
lpsz
lpsz : [wstr] 型: LPCTSTR null 終端文字列内の文字。
%inst
文字列内の次の文字へのポインタを取得する。この関数はシングルバイトまたはマルチバイト文字からなる文字列を扱える。(Unicode)

[戻り値]
型: LPTSTR 戻り値は文字列内の次の文字へのポインタ、または文字列の末尾であれば終端 null 文字へのポインタ。lpsz が終端
null 文字を指している場合、戻り値は lpsz と等しい。

[備考]
ANSI 関数として呼ばれたとき、CharNext はシステム既定のコードページを使用するのに対し、CharNextExA
は使用するコードページを指定する。この関数はダイアクリティカルマークを扱う際の既定の「ユーザ」期待に従って動作する。たとえば:
U+0061 U+030a (LATIN SMALL LETTER A + COMBINING RING ABOVE) を含む文字列
(見た目は "?") は 1 ではなく 2 コードポイント進む。U+0061 U+0301 U+0302 U+0303 U+0304
を含む文字列 (見た目は "a´^~?") は 1 ではなく 5 コードポイント進む、など。
> [!NOTE] > winuser.h ヘッダは CharNext をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づき自動的に ANSI/Unicode
版を選択する。エンコーディング非依存のエイリアスとそうでないコードを混在させると、コンパイル時または実行時のエラーにつながる不一致が生じる可能性がある。詳細は
Conventions for Function Prototypes を参照。


%index
CharPrevW
文字列内の前の文字へのポインタを取得する。この関数はシングルバイトまたはマルチバイト文字からなる文字列を扱える。(Unicode)
%group
Win32 user32
%prm
lpszStart, lpszCurrent
lpszStart : [wstr] 型: LPCTSTR 文字列の先頭。
lpszCurrent : [wstr] 型: LPCTSTR null 終端文字列内の文字。
%inst
文字列内の前の文字へのポインタを取得する。この関数はシングルバイトまたはマルチバイト文字からなる文字列を扱える。(Unicode)

[戻り値]
型: LPTSTR 戻り値は文字列内の前の文字へのポインタ、または lpszCurrent が lpszStart
と等しい場合は文字列の最初の文字へのポインタ。

[備考]
ANSI 関数として呼ばれたとき、CharPrev はシステム既定のコードページを使用するのに対し、CharPrevExA
は使用するコードページを指定する。この関数はダイアクリティカルマークを扱う際の既定の「ユーザ」期待に従って動作する。たとえば:
U+0061 U+030a (LATIN SMALL LETTER A + COMBINING RING ABOVE) を含む文字列
(見た目は "?") は 1 ではなく 2 コードポイント進む。U+0061 U+0301 U+0302 U+0303 U+0304
を含む文字列 (見た目は "a´^~?") は 1 ではなく 5 コードポイント進む、など。
> [!NOTE] > winuser.h ヘッダは CharPrev をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づき自動的に ANSI/Unicode
版を選択する。エンコーディング非依存のエイリアスとそうでないコードを混在させると、コンパイル時または実行時のエラーにつながる不一致が生じる可能性がある。詳細は
Conventions for Function Prototypes を参照。


%index
CharToOemW
文字列を OEM 定義の文字セットに変換する。警告: 使用しないこと。(Unicode)
%group
Win32 user32
%prm
pSrc, pDst
pSrc : [wstr] 型: LPCTSTR 変換する null 終端文字列。
pDst : [str] 型: LPSTR 変換後の文字列を受け取る出力バッファ。CharToOem 関数を ANSI 関数として使用する場合、lpszDst を lpszSrc と同じアドレスに設定することで文字列をその場で変換できる。CharToOem をワイド文字関数として使用する場合はこれを行えない。
%inst
文字列を OEM 定義の文字セットに変換する。警告: 使用しないこと。(Unicode)

[戻り値]
型: BOOL 戻り値は常に 0 以外。ただしワイド文字版の関数で lpszSrc と lpszDst
に同じアドレスを渡した場合は例外で、その場合は 0 を返し GetLastError は ERROR_INVALID_ADDRESS
を返す。

[備考]
> [!NOTE] > winuser.h ヘッダは CharToOem をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づき自動的に ANSI/Unicode
版を選択する。エンコーディング非依存のエイリアスとそうでないコードを混在させると、コンパイル時または実行時のエラーにつながる不一致が生じる可能性がある。詳細は
Conventions for Function Prototypes を参照。


%index
CharToOemBuffW
文字列内の指定数の文字を OEM 定義の文字セットに変換する。(Unicode)
%group
Win32 user32
%prm
lpszSrc, lpszDst, cchDstLength
lpszSrc : [wstr] 型: LPCTSTR 変換する null 終端文字列。
lpszDst : [str] 型: LPSTR 変換後の文字列を格納するバッファ。CharToOemBuff 関数を ANSI 関数として使用する場合、lpszDst を lpszSrc と同じアドレスに設定することで文字列をその場で変換できる。CharToOemBuff をワイド文字関数として使用する場合はこれを行えない。
cchDstLength : [int] 型: DWORD lpszSrc パラメータで指定された文字列内で変換する文字数。
%inst
文字列内の指定数の文字を OEM 定義の文字セットに変換する。(Unicode)

[戻り値]
型: BOOL 戻り値は常に 0 以外。ただしワイド文字版の関数で lpszSrc と lpszDst
に同じアドレスを渡した場合は例外で、その場合は 0 を返し GetLastError は ERROR_INVALID_ADDRESS
を返す。

[備考]
CharToOem 関数とは異なり、CharToOemBuff 関数は lpszSrc が指すバッファ内で null
文字に遭遇しても文字変換を停止しない。CharToOemBuff 関数は cchDstLength 文字すべてを変換する。
> [!NOTE] > winuser.h ヘッダは CharToOemBuff をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づき自動的に ANSI/Unicode
版を選択する。エンコーディング非依存のエイリアスとそうでないコードを混在させると、コンパイル時または実行時のエラーにつながる不一致が生じる可能性がある。詳細は
Conventions for Function Prototypes を参照。


%index
CharUpperW
文字列または単一の文字を大文字に変換する。オペランドが文字列の場合、関数は文字をその場で変換する。(Unicode)
%group
Win32 user32
%prm
lpsz
lpsz : [wstr] 型: LPTSTR null 終端文字列、または単一の文字。このパラメータの上位ワードが 0 の場合、下位ワードに変換する単一の文字を含めなければならない。
%inst
文字列または単一の文字を大文字に変換する。オペランドが文字列の場合、関数は文字をその場で変換する。(Unicode)

[戻り値]
型: LPTSTR オペランドが文字列の場合、関数は変換後の文字列へのポインタを返す。文字列はその場で変換されるため、戻り値は lpsz
と等しい。オペランドが単一文字の場合、戻り値は上位ワードが 0、下位ワードに変換後の文字を含む 32
ビット値である。成功・失敗の表示はない。失敗はまれである。この関数に拡張エラー情報はない。GetLastError を呼んではならない。

[備考]
CharUpper は、現在の言語がトルコ語またはアゼルバイジャン語であっても常に小文字 I ("i") を大文字 I
にマップすることに注意。言語的に敏感な関数が必要な場合は LCMapString を呼ぶ。ANSI 版での Unicode
への変換はすべての場合、システム既定のロケールで行われる。
> [!NOTE] > winuser.h ヘッダは CharUpper をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づき自動的に ANSI/Unicode
版を選択する。エンコーディング非依存のエイリアスとそうでないコードを混在させると、コンパイル時または実行時のエラーにつながる不一致が生じる可能性がある。詳細は
Conventions for Function Prototypes を参照。


%index
CharUpperBuffW
バッファ内の小文字を大文字に変換する。文字はその場で変換される。(Unicode)
%group
Win32 user32
%prm
lpsz, cchLength
lpsz : [wstr] 型: LPTSTR 処理する 1 つ以上の文字を格納したバッファ。
cchLength : [int] 型: DWORD lpsz が指すバッファのサイズ (文字数)。関数は各文字を調べ、小文字を大文字に変換する。null 文字が含まれていても cchLength で示される文字数を調べる。
%inst
バッファ内の小文字を大文字に変換する。文字はその場で変換される。(Unicode)

[戻り値]
型: DWORD 戻り値は処理された文字数。たとえば CharUpperBuff("Zenith of API Sets", 10)
が成功すると、戻り値は 10 になる。

[備考]
CharUpperBuff は、現在の言語がトルコ語またはアゼルバイジャン語であっても常に小文字 I ("i") を大文字 I
にマップすることに注意。言語的に敏感な関数が必要な場合は LCMapString を呼ぶ。ANSI 版での Unicode
への変換はすべての場合、システム既定のロケールで行われる。


%index
CheckDlgButton
ボタンコントロールのチェック状態を変更する。
%group
Win32 user32
%prm
hDlg, nIDButton, uCheck
hDlg : [intptr] 型: HWND ボタンを含むダイアログへのハンドル。
nIDButton : [int] 型: int 変更するボタンの識別子。
uCheck : [int] 型: UINT
%inst
ボタンコントロールのチェック状態を変更する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
CheckDlgButton 関数は、指定されたダイアログ内の指定されたボタンコントロールに BM_SETCHECK
メッセージを送信する。


%index
CheckMenuItem
指定されたメニュー項目のチェックマーク属性の状態を選択またはクリアに設定する。
%group
Win32 user32
%prm
hMenu, uIDCheckItem, uCheck
hMenu : [intptr] 型: HMENU 対象のメニューへのハンドル。
uIDCheckItem : [int] 型: UINT チェックマーク属性を設定するメニュー項目。uCheck パラメータによって判定される。
uCheck : [int] 型: UINT uIDCheckItem パラメータの解釈方法とメニュー項目のチェックマーク属性の状態を制御するフラグ。MF_BYCOMMAND または MF_BYPOSITION と、MF_CHECKED または MF_UNCHECKED の組み合わせを指定できる。
%inst
指定されたメニュー項目のチェックマーク属性の状態を選択またはクリアに設定する。

[戻り値]
型: DWORD 戻り値はメニュー項目の以前の状態 (MF_CHECKED または MF_UNCHECKED)
を表す。メニュー項目が存在しない場合、戻り値は -1。

[備考]
メニューバー内の項目はチェックマークを持てない。uIDCheckItem
パラメータはサブメニューを開く項目またはコマンド項目を識別する。サブメニューを開く項目の場合、uIDCheckItem
は項目の位置を指定しなければならない。コマンド項目の場合、uIDCheckItem は項目の位置または識別子のいずれかを指定できる。


%index
CheckMenuRadioItem
指定したメニュー項目をチェックしてラジオ項目にする。同時に、関連グループ内の他のすべてのメニュー項目をクリアし、それらの項目のラジオ項目タイプフラグをクリアする。
%group
Win32 user32
%prm
hmenu, first, last, check, flags
hmenu : [intptr] 型: HMENU メニュー項目のグループを含むメニューへのハンドル。
first : [int] 型: UINT グループ内の最初のメニュー項目の識別子または位置。
last : [int] 型: UINT グループ内の最後のメニュー項目の識別子または位置。
check : [int] 型: UINT チェックするメニュー項目の識別子または位置。
flags : [int] 型: UINT idFirst、idLast、idCheck の意味を示す。MF_BYCOMMAND の場合、他のパラメータはメニュー項目識別子を指定する。MF_BYPOSITION の場合、他のパラメータはメニュー項目の位置を指定する。
%inst

指定したメニュー項目をチェックしてラジオ項目にする。同時に、関連グループ内の他のすべてのメニュー項目をクリアし、それらの項目のラジオ項目タイプフラグをクリアする。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには
GetLastError 関数を使用する。

[備考]
CheckMenuRadioItem 関数は idCheck で指定された項目に MFT_RADIOCHECK タイプフラグと
MFS_CHECKED
状態を設定し、同時にグループ内の他のすべての項目の両フラグをクリアする。選択された項目はチェックマークビットマップではなく弾丸
(bullet) ビットマップで表示される。メニュー項目のタイプおよび状態フラグの詳細については MENUITEMINFO 構造体を参照。


%index
CheckRadioButton
グループ内の指定したラジオボタンにチェックマークを追加 (チェック) し、グループ内の他のすべてのラジオボタンからチェックマークを除去 (クリア) する。
%group
Win32 user32
%prm
hDlg, nIDFirstButton, nIDLastButton, nIDCheckButton
hDlg : [intptr] 型: HWND ラジオボタンを含むダイアログへのハンドル。
nIDFirstButton : [int] 型: int グループ内の最初のラジオボタンの識別子。
nIDLastButton : [int] 型: int グループ内の最後のラジオボタンの識別子。
nIDCheckButton : [int] 型: int 選択するラジオボタンの識別子。
%inst
グループ内の指定したラジオボタンにチェックマークを追加 (チェック) し、グループ内の他のすべてのラジオボタンからチェックマークを除去
(クリア) する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
CheckRadioButton 関数は、指定されたグループ内の各ラジオボタンに BM_SETCHECK
メッセージを送信する。nIDFirstButton と nIDLastButton はボタン識別子の範囲 (通常はボタンのリソース ID)
を指定する。タブオーダーにおけるボタンの位置は無関係で、グループの一部であってもこの ID 範囲外であれば影響を受けない。


%index
ChildWindowFromPoint
親ウィンドウに属する子ウィンドウのうち、指定した点を含むものを判定する。検索は直下の子ウィンドウに限定され、孫やそれ以降の子孫は検索されない。
%group
Win32 user32
%prm
hWndParent, Point
hWndParent : [intptr] 型: HWND 親ウィンドウへのハンドル。
Point : [int] 型: POINT hWndParent 相対の、検査する点のクライアント座標を定義する構造体。
%inst

親ウィンドウに属する子ウィンドウのうち、指定した点を含むものを判定する。検索は直下の子ウィンドウに限定され、孫やそれ以降の子孫は検索されない。

[戻り値]
型: HWND
戻り値は、その点を含む子ウィンドウへのハンドル。子ウィンドウが非表示または無効でも返される。点が親ウィンドウの外にある場合、戻り値は
NULL。点が親ウィンドウ内にあるがどの子ウィンドウにも含まれない場合、戻り値は親ウィンドウへのハンドル。

[備考]
システムは親ウィンドウに関連付けられた子ウィンドウのハンドルを含む内部リストを保持する。リスト内のハンドルの順序は子ウィンドウの Z
オーダーに依存する。複数の子ウィンドウが指定された点を含む場合、システムはリスト内でその点を含む最初のウィンドウへのハンドルを返す。ChildWindowFromPoint
は標準コントロールの HTTRANSPARENT 領域をコントロールの他の部分と同じように扱う。これに対し
RealChildWindowFromPoint は HTTRANSPARENT
領域を異なる扱いとし、コントロールの透明領域の背後にある子ウィンドウを返す。たとえば点がグループボックスの透明領域内にある場合、ChildWindowFromPoint
はグループボックスを返すが、RealChildWindowFromPoint はグループボックスの背後にある子ウィンドウを返す。ただし両
API ともスタティックフィールドが HTTRANSPARENT を返す場合でもそれを返す。


%index
ChildWindowFromPointEx
指定した親ウィンドウに属する子ウィンドウのうち、指定した点を含むものを判定する。
%group
Win32 user32
%prm
hwnd, pt, flags
hwnd : [intptr] 型: HWND 親ウィンドウへのハンドル。
pt : [int] 型: POINT hwndParent 相対の、検査する点のクライアント座標を定義する構造体。
flags : [int] 型: UINT スキップする子ウィンドウ。次の値の 1 つ以上を指定できる。
%inst
指定した親ウィンドウに属する子ウィンドウのうち、指定した点を含むものを判定する。

[戻り値]
型: HWND 戻り値は、その点を含み uFlags
の条件を満たす最初の子ウィンドウへのハンドル。点が親ウィンドウ内にあるが条件を満たすどの子ウィンドウにも含まれない場合、戻り値は親ウィンドウへのハンドル。点が親ウィンドウ外、または関数が失敗した場合、戻り値は
NULL。

[備考]
システムは親ウィンドウに関連付けられた子ウィンドウのハンドルを含む内部リストを保持する。リスト内のハンドルの順序は子ウィンドウの Z
オーダーに依存する。複数の子ウィンドウが指定された点を含む場合、システムはリスト内でその点を含み uFlags
で指定された条件を満たす最初のウィンドウへのハンドルを返す。


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
ClipCursor
カーソルを画面上の矩形領域に閉じ込める。
%group
Win32 user32
%prm
lpRect
lpRect : [var] 型: const RECT* 制限矩形の左上隅と右下隅のスクリーン座標を含む構造体へのポインタ。NULL の場合、カーソルは画面上の任意の場所に自由に移動できる。
%inst
カーソルを画面上の矩形領域に閉じ込める。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
カーソルは共有リソースである。アプリケーションがカーソルを制限した場合、別のアプリケーションに制御を渡す前に ClipCursor
を使ってカーソルを解放しなければならない。呼び出し元プロセスはウィンドウステーションに対する WINSTA_WRITEATTRIBUTES
アクセス権を持っている必要がある。


%index
CloseClipboard
クリップボードを閉じる。
%group
Win32 user32
%prm

%inst
クリップボードを閉じる。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
ウィンドウがクリップボードの検査または変更を完了したら、CloseClipboard
を呼んでクリップボードを閉じる。これにより他のウィンドウがクリップボードにアクセスできるようになる。CloseClipboard
を呼んだ後にオブジェクトをクリップボードに置いてはならない。


%index
CloseGestureInfoHandle
ジェスチャ情報ハンドルに関連付けられたリソースを閉じる。
%group
Win32 user32
%prm
hGestureInfo
hGestureInfo : [intptr] ジェスチャ情報ハンドル。
%inst
ジェスチャ情報ハンドルに関連付けられたリソースを閉じる。

[戻り値]
関数が成功した場合、戻り値は 0 以外。
関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError 関数を使用する。

[備考]
アプリケーションが WM_GESTURE
メッセージを処理する場合、この関数を使ってハンドルを閉じる責任がある。閉じないとプロセスメモリリークが発生する場合がある。
メッセージが DefWindowProc に渡されるか、PostMessage や SendMessage 系の API
関数のいずれかで転送される場合、ハンドルはメッセージとともに転送され、アプリケーションが閉じる必要はない。


%index
CloseTouchInputHandle
タッチ入力ハンドルを閉じ、それに関連付けられたプロセスメモリを解放し、ハンドルを無効化する。
%group
Win32 user32
%prm
hTouchInput
hTouchInput : [intptr] タッチメッセージの LPARAM で受け取ったタッチ入力ハンドル。このハンドルが無効な場合、関数は ERROR_INVALID_HANDLE で失敗する。CloseTouchInputHandle の成功した呼び出しに使われた後、または DefWindowProc、PostMessage、SendMessage、もしくはそれらの派生関数に渡された後はハンドルは無効になる点に注意。
%inst
タッチ入力ハンドルを閉じ、それに関連付けられたプロセスメモリを解放し、ハンドルを無効化する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。
関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError 関数を使用する。

[備考]
CloseTouchInputHandle を呼んでも GetTouchInputInfo
の呼び出しで取得した値に関連付けられたメモリは解放されない。GetTouchInputInfo
に渡される構造体内の値は、削除するまで有効である。


%index
CloseWindow
指定したウィンドウを最小化する (ただし破棄はしない)。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND 最小化するウィンドウへのハンドル。
%inst
指定したウィンドウを最小化する (ただし破棄はしない)。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
ウィンドウを破棄するには、アプリケーションは DestroyWindow 関数を使用しなければならない。


%index
CloseWindowStation
オープン中のウィンドウステーションハンドルを閉じる。
%group
Win32 user32
%prm
hWinSta
hWinSta : [intptr] 閉じるウィンドウステーションへのハンドル。CreateWindowStation または OpenWindowStation 関数が返したハンドル。GetProcessWindowStation が返したハンドルを指定してはならない。
%inst
オープン中のウィンドウステーションハンドルを閉じる。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。Windows Server 2003 および Windows XP/2000
では、この関数は失敗時に最終エラーコードを設定しない。

[備考]
CloseWindowStation
関数は、閉じるハンドルが呼び出し元プロセスに割り当てられたウィンドウステーション用のものである場合、失敗する。


%index
ConsoleControl
(no summary)
%group
Win32 user32
%prm
Command, ConsoleInformation, ConsoleInformationLength
Command : [int] 
ConsoleInformation : [intptr] 
ConsoleInformationLength : [int] 
%inst



%index
DestroyAcceleratorTable
アクセラレータテーブルを破棄する。
%group
Win32 user32
%prm
hAccel
hAccel : [intptr] 型: HACCEL 破棄するアクセラレータテーブルへのハンドル。このハンドルは CreateAcceleratorTable または LoadAccelerators 関数によって作成されている必要がある。
%inst
アクセラレータテーブルを破棄する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外となる。ただし、テーブルが LoadAccelerators
によって複数回ロードされている場合、DestroyAcceleratorTable が同じ回数呼び出されたときにのみ 0
以外の値を返す。関数が失敗した場合、戻り値は 0 となる。


%index
CopyAcceleratorTableW
指定したアクセラレータテーブルをコピーする。この関数は、アクセラレータテーブルハンドルに対応するアクセラレータテーブルデータを取得するため、またはアクセラレータテーブルデータのサイズを判定するために使用される。(Unicode)
%group
Win32 user32
%prm
hAccelSrc, lpAccelDst, cAccelEntries
hAccelSrc : [intptr] 型: HACCEL コピーするアクセラレータテーブルへのハンドル。
lpAccelDst : [var] 型: LPACCEL アクセラレータテーブル情報を受け取る ACCEL 構造体の配列。
cAccelEntries : [int] 型: int lpAccelDst パラメータが指すバッファにコピーする ACCEL 構造体の数。
%inst

指定したアクセラレータテーブルをコピーする。この関数は、アクセラレータテーブルハンドルに対応するアクセラレータテーブルデータを取得するため、またはアクセラレータテーブルデータのサイズを判定するために使用される。(Unicode)

[戻り値]
型: int lpAccelDst が NULL
の場合、戻り値は元のテーブル内のアクセラレータテーブルエントリの数。それ以外の場合は、コピーされたエントリの数を返す。

[備考]
> [!NOTE] > winuser.h ヘッダは CopyAcceleratorTable
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づき自動的に ANSI/Unicode
版を選択する。エンコーディング非依存のエイリアスとそうでないコードを混在させると、コンパイル時または実行時のエラーにつながる不一致が生じる可能性がある。詳細は
Conventions for Function Prototypes を参照。


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
CopyIcon
指定したアイコンを別のモジュールから現在のモジュールにコピーする。
%group
Win32 user32
%prm
hIcon
hIcon : [intptr] 型: HICON コピーするアイコンへのハンドル。
%inst
指定したアイコンを別のモジュールから現在のモジュールにコピーする。

[戻り値]
型: HICON 関数が成功した場合、戻り値は複製されたアイコンへのハンドル。関数が失敗した場合、戻り値は
NULL。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
CopyIcon 関数を使うと、アプリケーションまたは DLL
が別のモジュールが所有するアイコンへの自分専用のハンドルを取得できる。他のモジュールが解放されても、アプリケーションのアイコンは引き続きそのアイコンを使用できる。アプリケーションは終了前に
DestroyIcon 関数を呼んで、アイコンに関連付けられたシステムリソースを解放する必要がある。


%index
CopyImage
新しい画像 (アイコン、カーソル、ビットマップ) を作成し、指定された画像の属性を新しい画像にコピーする。必要に応じて、新しい画像の希望サイズに合わせてビットを伸縮する。
%group
Win32 user32
%prm
h, type, cx, cy, flags
h : [intptr] 型: HANDLE コピーする画像へのハンドル。
type : [int] 型: UINT
cx : [int] 型: int 画像の希望幅 (ピクセル)。0 の場合、返される画像は元の hImage と同じ幅になる。
cy : [int] 型: int 画像の希望高さ (ピクセル)。0 の場合、返される画像は元の hImage と同じ高さになる。
flags : [int] 型: UINT
%inst
新しい画像 (アイコン、カーソル、ビットマップ)
を作成し、指定された画像の属性を新しい画像にコピーする。必要に応じて、新しい画像の希望サイズに合わせてビットを伸縮する。

[戻り値]
型: HANDLE 関数が成功した場合、戻り値は新しく作成された画像へのハンドル。関数が失敗した場合、戻り値は
NULL。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
リソースの使用が終わったら、次の表の関数のいずれかを呼んでそれに関連するメモリを解放できる。
（以下省略）


%index
CopyRect
CopyRect 関数は、ある矩形の座標を別の矩形にコピーする。
%group
Win32 user32
%prm
lprcDst, lprcSrc
lprcDst : [var] コピー元矩形の論理座標を受け取る RECT 構造体へのポインタ。
lprcSrc : [var] 論理単位でコピーされる座標を持つ RECT 構造体へのポインタ。
%inst
CopyRect 関数は、ある矩形の座標を別の矩形にコピーする。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。

[備考]

アプリケーションは矩形をさまざまな目的で使用できるため、矩形関数は明示的な単位を使わない。代わりに、すべての矩形座標と寸法は符号付きの論理値で与えられる。マッピングモードと矩形を使用する関数によって測定単位が決まる。


%index
CountClipboardFormats
現在クリップボードにある異なるデータ形式の数を取得する。
%group
Win32 user32
%prm

%inst
現在クリップボードにある異なるデータ形式の数を取得する。

[戻り値]
型: int 関数が成功した場合、戻り値は現在クリップボードにある異なるデータ形式の数。関数が失敗した場合、戻り値は
0。拡張エラー情報を取得するには GetLastError を呼ぶ。


%index
CreateAcceleratorTableW
アクセラレータテーブルを作成する。(Unicode)
%group
Win32 user32
%prm
paccel, cAccel
paccel : [var] 型: LPACCEL アクセラレータテーブルを記述する ACCEL 構造体の配列。
cAccel : [int] 型: int 配列内の ACCEL 構造体の数。1 から 32767 の範囲でなければならず、それ以外の場合は失敗する。
%inst
アクセラレータテーブルを作成する。(Unicode)

[戻り値]
型: HACCEL 関数が成功した場合、戻り値は作成されたアクセラレータテーブルへのハンドル。それ以外の場合は
NULL。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
アプリケーションは終了前に DestroyAcceleratorTable 関数を使って、CreateAcceleratorTable
で作成したアクセラレータテーブルを破棄できる。


%index
CreateCaret
システムキャレット用の新しい形状を作成し、キャレットの所有権を指定したウィンドウに割り当てる。キャレット形状は線、ブロック、またはビットマップにできる。
%group
Win32 user32
%prm
hWnd, hBitmap, nWidth, nHeight
hWnd : [intptr] 型: HWND キャレットを所有するウィンドウへのハンドル。
hBitmap : [intptr] 型: HBITMAP キャレット形状を定義するビットマップへのハンドル。NULL の場合、キャレットは塗りつぶしになる。(HBITMAP) 1 の場合、キャレットはグレーになる。ビットマップハンドルの場合、キャレットは指定されたビットマップになる。ビットマップハンドルは CreateBitmap、CreateDIBitmap、または LoadBitmap で作成されたものでなければならない。hBitmap がビットマップハンドルの場合、CreateCaret は nWidth と nHeight を無視する。ビットマップ自体が幅と高さを定義する。
nWidth : [int] 型: int キャレットの幅 (論理単位)。0 の場合、システム定義のウィンドウ境界の幅に設定される。hBitmap がビットマップハンドルの場合、CreateCaret はこのパラメータを無視する。
nHeight : [int] 型: int キャレットの高さ (論理単位)。0 の場合、システム定義のウィンドウ境界の高さに設定される。hBitmap がビットマップハンドルの場合、CreateCaret はこのパラメータを無視する。
%inst

システムキャレット用の新しい形状を作成し、キャレットの所有権を指定したウィンドウに割り当てる。キャレット形状は線、ブロック、またはビットマップにできる。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。
関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
nWidth と nHeight
はキャレットの幅と高さを論理単位で指定する。ピクセル単位での正確な幅と高さはウィンドウのマッピングモードによる。CreateCaret
は、所有するウィンドウに関係なく、以前のキャレット形状があれば自動的に破棄する。アプリケーションが ShowCaret
関数を呼んでキャレットを表示するまで、キャレットは非表示である。システムはキューごとに 1
つのキャレットを提供する。ウィンドウはキーボードフォーカスを持っているか、アクティブなときにのみキャレットを作成すべきである。ウィンドウはキーボードフォーカスを失う前または非アクティブになる前にキャレットを破棄すべきである。DPI
仮想化: この API は DPI
仮想化に参加しない。幅と高さのパラメータは、対象ウィンドウに関する論理サイズとして解釈される。呼び出し元スレッドは考慮されない。


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
CreateCursor
指定したサイズ、ビットパターン、ホットスポットを持つカーソルを作成する。
%group
Win32 user32
%prm
hInst, xHotSpot, yHotSpot, nWidth, nHeight, pvANDPlane, pvXORPlane
hInst : [intptr] 型: HINSTANCE カーソルを作成するアプリケーションの現在のインスタンスへのハンドル。
xHotSpot : [int] 型: int カーソルのホットスポットの水平位置。
yHotSpot : [int] 型: int カーソルのホットスポットの垂直位置。
nWidth : [int] 型: int カーソルの幅 (ピクセル)。
nHeight : [int] 型: int カーソルの高さ (ピクセル)。
pvANDPlane : [intptr] 型: const VOID* デバイス依存モノクロビットマップのように、カーソルの AND マスクのビット値を含むバイト配列。
pvXORPlane : [intptr] 型: const VOID* デバイス依存モノクロビットマップのように、カーソルの XOR マスクのビット値を含むバイト配列。
%inst
指定したサイズ、ビットパターン、ホットスポットを持つカーソルを作成する。

[戻り値]
型: HCURSOR 関数が成功した場合、戻り値はカーソルへのハンドル。関数が失敗した場合、戻り値は
NULL。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
nWidth と nHeight
は現在のディスプレイドライバがサポートする幅と高さを指定しなければならない。システムは他のサイズのカーソルを作成できない。ディスプレイドライバがサポートする幅と高さを判定するには、SM_CXCURSOR
または SM_CYCURSOR 値を指定して GetSystemMetrics 関数を使用する。アプリケーションは終了前に
DestroyCursor 関数を呼んで、カーソルに関連付けられたシステムリソースを解放しなければならない。DPI 仮想化: この API
は DPI 仮想化に参加しない。返される出力は物理座標で、呼び出し元スレッドの DPI
には影響されない。ただし、作成されたカーソルは描画される任意のウィンドウの DPI に合わせてスケールされる場合がある。


%index
CreateDesktopW
新しいデスクトップを作成し、呼び出し元プロセスの現在のウィンドウステーションに関連付け、呼び出し元スレッドに割り当てる。(Unicode)
%group
Win32 user32
%prm
lpszDesktop, lpszDevice, pDevmode, dwFlags, dwDesiredAccess, lpsa
lpszDesktop : [wstr] 作成するデスクトップの名前。デスクトップ名は大文字小文字を区別せず、バックスラッシュ文字 (\\) を含めることはできない。
lpszDevice : [wstr] 予約されており、NULL でなければならない。
pDevmode : [var] 予約されており、NULL でなければならない。
dwFlags : [int] このパラメータは 0 または次の値を指定できる。
dwDesiredAccess : [int] デスクトップへのアクセス。値の一覧については Desktop Security and Access Rights を参照。CreateDesktop は内部でハンドルを使ってウィンドウを作成するため、このパラメータには DESKTOP_CREATEWINDOW アクセス権を含める必要がある。
lpsa : [var] 返されるハンドルが子プロセスに継承可能かどうかを決定する SECURITY_ATTRIBUTES 構造体へのポインタ。lpsa が NULL の場合、ハンドルは継承されない。構造体の lpSecurityDescriptor メンバは、新しいデスクトップのセキュリティ記述子を指定する。NULL の場合、デスクトップは親ウィンドウステーションからセキュリティ記述子を継承する。
%inst
新しいデスクトップを作成し、呼び出し元プロセスの現在のウィンドウステーションに関連付け、呼び出し元スレッドに割り当てる。(Unicode)

[戻り値]

関数が成功した場合、戻り値は新しく作成されたデスクトップへのハンドル。指定されたデスクトップが既に存在する場合、関数は成功し、既存のデスクトップへのハンドルを返す。ハンドルの使用が終わったら
CloseDesktop 関数を呼んで閉じる。関数が失敗した場合、戻り値は NULL。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
dwDesiredAccess に READ_CONTROL、WRITE_DAC、または WRITE_OWNER
の標準アクセス権を指定する場合、DESKTOP_READOBJECTS と DESKTOP_WRITEOBJECTS
アクセス権も要求しなければならない。作成可能なデスクトップ数は 48 MB
のシステムデスクトップヒープのサイズによって制限される。デスクトップオブジェクトはリソースを格納するためにこのヒープを使用する。対話的ウィンドウステーション内の各デスクトップに予約される既定ヒープを減らすことで、作成可能なデスクトップ数を増やせる。この値は次のレジストリ値の
"SharedSection" サブ文字列で指定される:
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session
Manager\SubSystems\Windows。このレジストリ値の既定データは次のとおり:
"%SystemRoot%\system32\csrss.exe ObjectDirectory=\Windows
SharedSection=1024,3072,512 Windows=On SubSystemType=Windows
ServerDll=basesrv,1 ServerDll=winsrv:UserServerDllInitialization,3
ServerDll=winsrv:ConServerDllInitialization,2 ProfileControl=Off
MaxRequestThreads=16"
"SharedSection" サブ文字列の値は次のとおり:
（以下省略）


%index
CreateDesktopExW
指定したヒープを持つ新しいデスクトップを作成し、呼び出し元プロセスの現在のウィンドウステーションに関連付け、呼び出し元スレッドに割り当てる。(Unicode)
%group
Win32 user32
%prm
lpszDesktop, lpszDevice, pDevmode, dwFlags, dwDesiredAccess, lpsa, ulHeapSize, pvoid
lpszDesktop : [wstr] 作成するデスクトップの名前。デスクトップ名は大文字小文字を区別せず、バックスラッシュ文字 (\\) を含めることはできない。
lpszDevice : [wstr] 予約されており、NULL でなければならない。
pDevmode : [var] 予約されており、NULL でなければならない。
dwFlags : [int] このパラメータは 0 または次の値を指定できる。
dwDesiredAccess : [int] デスクトップへの要求アクセス。値の一覧については Desktop Security and Access Rights を参照。
lpsa : [var] 返されるハンドルが子プロセスに継承可能かどうかを決定する SECURITY_ATTRIBUTES 構造体へのポインタ。lpsa が NULL の場合、ハンドルは継承されない。
ulHeapSize : [int] デスクトップヒープのサイズ (キロバイト単位)。
pvoid : [intptr] 予約されており、NULL でなければならない。
%inst

指定したヒープを持つ新しいデスクトップを作成し、呼び出し元プロセスの現在のウィンドウステーションに関連付け、呼び出し元スレッドに割り当てる。(Unicode)

[戻り値]

関数が成功した場合、戻り値は新しく作成されたデスクトップへのハンドル。指定されたデスクトップが既に存在する場合、関数は成功し、既存のデスクトップへのハンドルを返す。ハンドルの使用が終わったら
CloseDesktop 関数を呼んで閉じる。関数が失敗した場合、戻り値は NULL。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
dwDesiredAccess に READ_CONTROL、WRITE_DAC、または WRITE_OWNER
の標準アクセス権を指定する場合、DESKTOP_READOBJECTS と DESKTOP_WRITEOBJECTS
アクセス権も要求しなければならない。作成可能なデスクトップ数はシステムデスクトップヒープのサイズによって制限される。デスクトップオブジェクトはリソースを格納するためにこのヒープを使用する。デスクトップヒープサイズを増やすか、対話的ウィンドウステーション内の各デスクトップに予約される既定ヒープを減らすことで、作成可能なデスクトップ数を増やせる。この値は次のレジストリ値の
SharedSection サブ文字列で指定される:
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session
Manager\SubSystems\Windows。このレジストリ値の既定データは次のとおり:
%SystemRoot%\system32\csrss.exe ObjectDirectory=\Windows
SharedSection=1024,3072,512 Windows=On SubSystemType=Windows
ServerDll=basesrv,1 ServerDll=winsrv:UserServerDllInitialization,3
ServerDll=winsrv:ConServerDllInitialization,2 ProfileControl=Off
MaxRequestThreads=16
SharedSection サブ文字列の値は次のとおり:
（以下省略）


%index
CreateDialogIndirectParamW
メモリ内のダイアログテンプレートからモードレスダイアログを作成する。(Unicode)
%group
Win32 user32
%prm
hInstance, lpTemplate, hWndParent, lpDialogFunc, dwInitParam
hInstance : [intptr] 型: HINSTANCE ダイアログテンプレートを含むモジュールへのハンドル。NULL の場合、現在の実行可能ファイルが使われる。
lpTemplate : [var] 型: LPCDLGTEMPLATE CreateDialogIndirectParam がダイアログ作成に使用するテンプレート。ダイアログテンプレートは、ダイアログを記述するヘッダと、それに続くダイアログ内の各コントロールを記述する 1 つ以上のデータブロックで構成される。テンプレートは標準形式または拡張形式を使える。
hWndParent : [intptr] 型: HWND ダイアログを所有するウィンドウへのハンドル。
lpDialogFunc : [int] 型: DLGPROC ダイアログプロシージャへのポインタ。詳細は DialogProc を参照。
dwInitParam : [intptr] 型: LPARAM WM_INITDIALOG メッセージの lParam パラメータでダイアログに渡す値。
%inst
メモリ内のダイアログテンプレートからモードレスダイアログを作成する。(Unicode)

[戻り値]
型: HWND 関数が成功した場合、戻り値はダイアログのウィンドウハンドル。関数が失敗した場合、戻り値は
NULL。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
CreateDialogIndirectParam 関数は CreateWindowEx 関数を使ってダイアログを作成する。次に
CreateDialogIndirectParam はダイアログプロシージャに WM_INITDIALOG
メッセージを送信する。テンプレートが DS_SETFONT または DS_SHELLFONT スタイルを指定している場合、関数は
WM_SETFONT メッセージもダイアログプロシージャに送信する。テンプレートが WS_VISIBLE
スタイルを指定している場合、関数はダイアログを表示する。最後に CreateDialogIndirectParam
はダイアログのウィンドウハンドルを返す。CreateDialogIndirectParam が戻った後、ShowWindow
関数を使ってダイアログを表示できる (まだ表示されていない場合)。ダイアログを破棄するには DestroyWindow
関数を使う。キーボードナビゲーションやその他のダイアログ機能をサポートするには、ダイアログのメッセージループから
IsDialogMessage 関数を呼ばなければならない。標準ダイアログテンプレートでは、DLGTEMPLATE 構造体および各
DLGITEMTEMPLATE 構造体は DWORD 境界に整列される必要がある。DLGITEMTEMPLATE
構造体に続く作成データ配列も DWORD 境界に整列される必要がある。テンプレート内の他のすべての可変長配列は WORD
境界に整列される必要がある。拡張ダイアログテンプレートでは、DLGTEMPLATEEX ヘッダと各 DLGITEMTEMPLATEEX
コントロール定義は DWORD 境界に整列される必要がある。DLGITEMTEMPLATEEX 構造体に続く作成データ配列があれば、それも
DWORD 境界に整列される必要がある。テンプレート内の他のすべての可変長配列は WORD
境界に整列される必要がある。ダイアログテンプレート内のすべての文字列 (ダイアログやボタンのタイトルなど) は Unicode
文字列でなければならない。
> [!NOTE] > winuser.h ヘッダは CreateDialogIndirectParam
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づき自動的に ANSI/Unicode
版を選択する。エンコーディング非依存のエイリアスとそうでないコードを混在させると、コンパイル時または実行時のエラーにつながる不一致が生じる可能性がある。詳細は
Conventions for Function Prototypes を参照。


%index
CreateDialogParamW
ダイアログテンプレートリソースからモードレスダイアログを作成する。(Unicode)
%group
Win32 user32
%prm
hInstance, lpTemplateName, hWndParent, lpDialogFunc, dwInitParam
hInstance : [intptr] 型: HINSTANCE ダイアログテンプレートを含むモジュールへのハンドル。NULL の場合、現在の実行可能ファイルが使われる。
lpTemplateName : [wstr] 型: LPCTSTR ダイアログテンプレート。このパラメータは、ダイアログテンプレートの名前を指定する null 終端文字列へのポインタか、ダイアログテンプレートのリソース識別子を指定する整数値のいずれか。リソース識別子を指定する場合、上位ワードは 0 で下位ワードに識別子を含めなければならない。MAKEINTRESOURCE マクロを使ってこの値を作成できる。
hWndParent : [intptr] 型: HWND ダイアログを所有するウィンドウへのハンドル。
lpDialogFunc : [int] 型: DLGPROC ダイアログプロシージャへのポインタ。詳細は DialogProc を参照。
dwInitParam : [intptr] 型: LPARAM WM_INITDIALOG メッセージの lParam パラメータでダイアログプロシージャに渡される値。
%inst
ダイアログテンプレートリソースからモードレスダイアログを作成する。(Unicode)

[戻り値]
型: HWND 関数が成功した場合、戻り値はダイアログのウィンドウハンドル。関数が失敗した場合、戻り値は
NULL。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
CreateDialogParam 関数は CreateWindowEx 関数を使ってダイアログを作成する。次に
CreateDialogParam はダイアログプロシージャに WM_INITDIALOG メッセージ (テンプレートが
DS_SETFONT または DS_SHELLFONT スタイルを指定している場合は WM_SETFONT メッセージも)
を送信する。テンプレートが WS_VISIBLE スタイルを指定している場合、関数はダイアログを表示する。最後に
CreateDialogParam はダイアログのウィンドウハンドルを返す。CreateDialogParam
が戻った後、アプリケーションは ShowWindow 関数を使ってダイアログを表示する (まだ表示されていない場合)。アプリケーションは
DestroyWindow
関数を使ってダイアログを破棄する。キーボードナビゲーションやその他のダイアログ機能をサポートするには、ダイアログのメッセージループから
IsDialogMessage 関数を呼ばなければならない。
> [!NOTE] > winuser.h ヘッダは CreateDialogParam をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づき自動的に ANSI/Unicode
版を選択する。エンコーディング非依存のエイリアスとそうでないコードを混在させると、コンパイル時または実行時のエラーにつながる不一致が生じる可能性がある。詳細は
Conventions for Function Prototypes を参照。


%index
CreateIcon
指定したサイズ、色、ビットパターンを持つアイコンを作成する。
%group
Win32 user32
%prm
hInstance, nWidth, nHeight, cPlanes, cBitsPixel, lpbANDbits, lpbXORbits
hInstance : [intptr] 型: HINSTANCE アイコンを作成するモジュールのインスタンスへのハンドル。
nWidth : [int] 型: int アイコンの幅 (ピクセル)。
nHeight : [int] 型: int アイコンの高さ (ピクセル)。
cPlanes : [int] 型: BYTE アイコンの XOR ビットマスクのプレーン数。
cBitsPixel : [int] 型: BYTE アイコンの XOR ビットマスクのピクセルあたりのビット数。
lpbANDbits : [var] 型: const BYTE* アイコンの AND ビットマスクのビット値を含むバイト配列。このビットマスクはモノクロビットマップを記述する。
lpbXORbits : [var] 型: const BYTE* アイコンの XOR ビットマスクのビット値を含むバイト配列。このビットマスクはモノクロまたはデバイス依存のカラービットマップを記述する。
%inst
指定したサイズ、色、ビットパターンを持つアイコンを作成する。

[戻り値]
型: HICON 関数が成功した場合、戻り値はアイコンへのハンドル。関数が失敗した場合、戻り値は NULL。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
nWidth と nHeight の詳細については Icon Sizes を参照。CreateIcon は AND および XOR
ビットマスクに次の真理値表を適用する。
（以下省略）


%index
CreateIconFromResource
アイコンを記述するリソースビットからアイコンまたはカーソルを作成する。(CreateIconFromResource)
%group
Win32 user32
%prm
presbits, dwResSize, fIcon, dwVer
presbits : [var] 型: PBYTE アイコンまたはカーソルリソースビットを含むバッファ。これらのビットは通常 LookupIconIdFromDirectory、LookupIconIdFromDirectoryEx、LoadResource 関数の呼び出しによってロードされる。
dwResSize : [int] 型: DWORD presbits パラメータが指すビット集合のサイズ (バイト)。
fIcon : [int] 型: BOOL アイコンを作成するかカーソルを作成するかを示す。TRUE の場合はアイコン、FALSE の場合はカーソルを作成する。
dwVer : [int] 型: DWORD presbits パラメータが指すリソースビットのアイコンまたはカーソル形式のバージョン番号。値は 0x00020000 以上 0x00030000 以下でなければならない。通常は 0x00030000 を指定する。
%inst
アイコンを記述するリソースビットからアイコンまたはカーソルを作成する。(CreateIconFromResource)

[戻り値]
型: HICON 関数が成功した場合、戻り値はアイコンまたはカーソルへのハンドル。関数が失敗した場合、戻り値は
NULL。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]

CreateIconFromResource、CreateIconFromResourceEx、CreateIconIndirect、GetIconInfo、LookupIconIdFromDirectory、および
LookupIconIdFromDirectoryEx
関数は、シェルアプリケーションやアイコンブラウザがシステム全体のリソースを検査・使用できるようにする。CreateIconFromResource
関数は LR_DEFAULTSIZE|LR_SHARED をフラグとして CreateIconFromResourceEx
を呼び出す。アイコンの使用が終わったら DestroyIcon 関数で破棄する。


%index
CreateIconFromResourceEx
アイコンを記述するリソースビットからアイコンまたはカーソルを作成する。(CreateIconFromResourceEx)
%group
Win32 user32
%prm
presbits, dwResSize, fIcon, dwVer, cxDesired, cyDesired, Flags
presbits : [var] 型: PBYTE アイコンまたはカーソルリソースビット。これらのビットは通常 LookupIconIdFromDirectoryEx と LoadResource 関数の呼び出しによってロードされる。
dwResSize : [int] 型: DWORD pbIconBits パラメータが指すビット集合のサイズ (バイト)。
fIcon : [int] 型: BOOL アイコンを作成するかカーソルを作成するかを示す。TRUE の場合はアイコン、FALSE の場合はカーソルを作成する。
dwVer : [int] 型: DWORD pbIconBits パラメータが指すリソースビットのアイコンまたはカーソル形式のバージョン番号。値は 0x00020000 以上 0x00030000 以下でなければならない。通常は 0x00030000 を指定する。
cxDesired : [int] 型: int アイコンまたはカーソルの希望幅 (ピクセル)。0 の場合、関数は SM_CXICON または SM_CXCURSOR システムメトリック値を使って幅を設定する。
cyDesired : [int] 型: int アイコンまたはカーソルの希望高さ (ピクセル)。0 の場合、関数は SM_CYICON または SM_CYCURSOR システムメトリック値を使って高さを設定する。
Flags : [int] 型: UINT
%inst
アイコンを記述するリソースビットからアイコンまたはカーソルを作成する。(CreateIconFromResourceEx)

[戻り値]
型: HICON 関数が成功した場合、戻り値はアイコンまたはカーソルへのハンドル。関数が失敗した場合、戻り値は
NULL。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]

CreateIconFromResource、CreateIconFromResourceEx、CreateIconIndirect、GetIconInfo、および
LookupIconIdFromDirectoryEx
関数は、シェルアプリケーションやアイコンブラウザがシステム全体のリソースを検査・使用できるようにする。CreateIconFromResourceEx
で作成したアイコンには DestroyIcon を呼ぶ必要がある。


%index
CreateIconIndirect
ICONINFO 構造体からアイコンまたはカーソルを作成する。
%group
Win32 user32
%prm
piconinfo
piconinfo : [var] 型: PICONINFO アイコンまたはカーソルを作成するために関数が使う ICONINFO 構造体へのポインタ。
%inst
ICONINFO 構造体からアイコンまたはカーソルを作成する。

[戻り値]
型: HICON 関数が成功した場合、戻り値は作成されたアイコンまたはカーソルへのハンドル。関数が失敗した場合、戻り値は
NULL。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
システムはアイコンまたはカーソルを作成する前に ICONINFO
構造体内のビットマップをコピーする。システムが一時的にビットマップをデバイスコンテキストに選択する場合があるため、ICONINFO
構造体の hbmMask と hbmColor
メンバはあらかじめデバイスコンテキストに選択されていてはならない。アプリケーションは元のビットマップを管理し続け、不要になったら削除しなければならない。アイコンの使用が終わったら
DestroyIcon 関数で破棄する。


%index
CreateMDIWindowW
マルチドキュメントインターフェース (MDI) の子ウィンドウを作成する。(Unicode)
%group
Win32 user32
%prm
lpClassName, lpWindowName, dwStyle, X, Y, nWidth, nHeight, hWndParent, hInstance, lParam
lpClassName : [wstr] 型: LPCTSTR MDI 子ウィンドウのウィンドウクラス。クラス名は RegisterClassEx 関数で登録されている必要がある。
lpWindowName : [wstr] 型: LPCTSTR ウィンドウ名。システムは子ウィンドウのタイトルバーにこの名前を表示する。
dwStyle : [int] 型: DWORD
X : [int] 型: int MDI 子ウィンドウの初期水平位置 (クライアント座標)。CW_USEDEFAULT ((int)0x80000000) の場合、MDI 子ウィンドウには既定の水平位置が割り当てられる。
Y : [int] 型: int MDI 子ウィンドウの初期垂直位置 (クライアント座標)。CW_USEDEFAULT の場合、MDI 子ウィンドウには既定の垂直位置が割り当てられる。
nWidth : [int] 型: int MDI 子ウィンドウの初期幅 (デバイス単位)。CW_USEDEFAULT の場合、既定の幅が割り当てられる。
nHeight : [int] 型: int MDI 子ウィンドウの初期高さ (デバイス単位)。CW_USEDEFAULT に設定すると既定の高さが割り当てられる。
hWndParent : [intptr] 型: HWND 新しい MDI 子ウィンドウの親となる MDI クライアントウィンドウへのハンドル。
hInstance : [intptr] 型: HINSTANCE MDI 子ウィンドウを作成するアプリケーションのインスタンスへのハンドル。
lParam : [intptr] 型: LPARAM アプリケーション定義の値。
%inst
マルチドキュメントインターフェース (MDI) の子ウィンドウを作成する。(Unicode)

[戻り値]
型: HWND 関数が成功した場合、戻り値は作成されたウィンドウへのハンドル。関数が失敗した場合、戻り値は
NULL。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
> [!NOTE] > winuser.h ヘッダは CreateMDIWindow をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づき自動的に ANSI/Unicode
版を選択する。エンコーディング非依存のエイリアスとそうでないコードを混在させると、コンパイル時または実行時のエラーにつながる不一致が生じる可能性がある。詳細は
Conventions for Function Prototypes を参照。


%index
CreateMenu
メニューを作成する。メニューは最初は空で、InsertMenuItem、AppendMenu、InsertMenu 関数を使ってメニュー項目を追加できる。
%group
Win32 user32
%prm

%inst
メニューを作成する。メニューは最初は空で、InsertMenuItem、AppendMenu、InsertMenu
関数を使ってメニュー項目を追加できる。

[戻り値]
型: HMENU 関数が成功した場合、戻り値は新しく作成されたメニューへのハンドル。関数が失敗した場合、戻り値は
NULL。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]

ウィンドウに割り当てられたメニューに関連するリソースは自動的に解放される。メニューがウィンドウに割り当てられていない場合、アプリケーションは終了前にメニューに関連付けられたシステムリソースを解放しなければならない。アプリケーションは
DestroyMenu 関数を呼んでメニューリソースを解放する。


%index
CreatePopupMenu
ドロップダウンメニュー、サブメニュー、またはショートカットメニューを作成する。
%group
Win32 user32
%prm

%inst
ドロップダウンメニュー、サブメニュー、またはショートカットメニューを作成する。

[戻り値]
型: HMENU 関数が成功した場合、戻り値は新しく作成されたメニューへのハンドル。関数が失敗した場合、戻り値は
NULL。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
アプリケーションは新しいメニューを既存のメニューに追加するか、TrackPopupMenuEx または TrackPopupMenu
関数を呼んでショートカットメニューを表示できる。ウィンドウに割り当てられたメニューに関連するリソースは自動的に解放される。メニューがウィンドウに割り当てられていない場合、アプリケーションは終了前にメニューに関連付けられたシステムリソースを解放しなければならない。アプリケーションは
DestroyMenu 関数を呼んでメニューリソースを解放する。


%index
DestroySyntheticPointerDevice
指定したポインタ入力デバイスを破棄する。
%group
Win32 user32
%prm
device
device : [intptr] ポインタ入力デバイスへのハンドル。
%inst
指定したポインタ入力デバイスを破棄する。


%index
CreateSyntheticPointerDevice
呼び出し元アプリケーションのポインタ注入デバイスを構成し、アプリが注入できる同時ポインタの最大数を初期化する。
%group
Win32 user32
%prm
pointerType, maxCount, mode
pointerType : [int] ポインタ注入デバイスの種類。PT_TOUCH または PT_PEN のいずれかでなければならない。
maxCount : [int] コンタクトの最大数。
mode : [int] コンタクト視覚化モード。
%inst
呼び出し元アプリケーションのポインタ注入デバイスを構成し、アプリが注入できる同時ポインタの最大数を初期化する。

[戻り値]
関数が成功した場合、戻り値はポインタ注入デバイスへのハンドル。それ以外の場合は null を返す。拡張エラー情報を取得するには
GetLastError 関数を呼ぶ。


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
CreateWindowStationW
ウィンドウステーションオブジェクトを作成し、呼び出し元プロセスに関連付け、現在のセッションに割り当てる。(Unicode)
%group
Win32 user32
%prm
lpwinsta, dwFlags, dwDesiredAccess, lpsa
lpwinsta : [wstr] 作成するウィンドウステーションの名前。ウィンドウステーション名は大文字小文字を区別せず、バックスラッシュ文字 (\\) を含むことはできない。名前を指定できるのは Administrators グループのメンバのみである。lpwinsta が NULL または空文字列の場合、システムは呼び出し元プロセスのログオンセッション識別子を使ってウィンドウステーション名を生成する。この名前を取得するには GetUserObjectInformation 関数を呼ぶ。
dwFlags : [int] このパラメータが CWF_CREATE_ONLY でウィンドウステーションが既に存在する場合、呼び出しは失敗する。このフラグが指定されておらずウィンドウステーションが既に存在する場合、関数は成功し、既存のウィンドウステーションへの新しいハンドルを返す。Windows XP/2000 ではこのパラメータは予約されており、0 でなければならない。
dwDesiredAccess : [int] 返されるハンドルがウィンドウステーションに対して持つアクセスの種類。さらに、READ_CONTROL や WRITE_DAC などの標準アクセス権、およびウィンドウステーション固有のアクセス権の組み合わせを指定できる。詳細は Window Station Security and Access Rights を参照。
lpsa : [var] 返されるハンドルが子プロセスに継承可能かどうかを決定する SECURITY_ATTRIBUTES 構造体へのポインタ。lpsa が NULL の場合、ハンドルは継承されない。構造体の lpSecurityDescriptor メンバは、新しいウィンドウステーションのセキュリティ記述子を指定する。lpsa が NULL の場合、ウィンドウステーション (およびその中で作成されるデスクトップ) はすべてのユーザに GENERIC_ALL アクセスを許可するセキュリティ記述子を取得する。
%inst
ウィンドウステーションオブジェクトを作成し、呼び出し元プロセスに関連付け、現在のセッションに割り当てる。(Unicode)

[戻り値]

関数が成功した場合、戻り値は新しく作成されたウィンドウステーションへのハンドル。指定されたウィンドウステーションが既に存在する場合、関数は成功し、既存のウィンドウステーションへのハンドルを返す。関数が失敗した場合、戻り値は
NULL。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
ハンドルの使用が終わったら CloseWindowStation を呼んでハンドルを解放しなければならない。
> [!NOTE] > winuser.h ヘッダは CreateWindowStation
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づき自動的に ANSI/Unicode
版を選択する。エンコーディング非依存のエイリアスとそうでないコードを混在させると、コンパイル時または実行時のエラーにつながる不一致が生じる可能性がある。詳細は
Conventions for Function Prototypes を参照。


%index
DdeDisconnect
DdeConnect または DdeConnectList 関数で開始された会話を終了し、指定された会話ハンドルを無効化する。
%group
Win32 user32
%prm
hConv
hConv : [intptr] 型: HCONV 終了するアクティブな会話へのハンドル。
%inst
DdeConnect または DdeConnectList 関数で開始された会話を終了し、指定された会話ハンドルを無効化する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。エラーコードは DdeGetLastError
関数で取得でき、次のいずれかになる:

[備考]
DdeDisconnect を呼ぶ前に開始された未完了のトランザクションは即座に破棄される。XTYP_DISCONNECT
トランザクションは会話の相手の DDE
コールバック関数に送信される。一般に、会話を終了する必要があるのはクライアントアプリケーションだけである。


%index
DdeAbandonTransaction
指定された非同期トランザクションを破棄し、トランザクションに関連付けられたすべてのリソースを解放する。
%group
Win32 user32
%prm
idInst, hConv, idTransaction
idInst : [int] 型: DWORD DdeInitialize 関数の以前の呼び出しで取得したアプリケーションインスタンス識別子。
hConv : [intptr] 型: HCONV トランザクションが開始された会話へのハンドル。0L の場合、すべてのトランザクションが破棄される (idTransaction パラメータは無視される)。
idTransaction : [int] 型: DWORD 破棄するトランザクションの識別子。0L の場合、指定された会話内のすべてのアクティブトランザクションが破棄される。
%inst
指定された非同期トランザクションを破棄し、トランザクションに関連付けられたすべてのリソースを解放する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。エラーコードは DdeGetLastError
関数で取得でき、次のいずれかになる:

[備考]
DdeAbandonTransaction を呼ぶのは DDE クライアントアプリケーションのみであるべき。クライアントが
DdeAbandonTransaction
を呼んだ後にサーバアプリケーションがトランザクションに応答した場合、システムはトランザクション結果を破棄する。この関数は同期トランザクションには影響しない。


%index
DdeFreeDataHandle
DDE オブジェクトを解放し、オブジェクトに関連付けられたデータハンドルを削除する。
%group
Win32 user32
%prm
hData
hData : [intptr] 型: HDDEDATA 解放する DDE オブジェクトへのハンドル。このハンドルは DdeCreateDataHandle 関数の以前の呼び出しで作成されたか、DdeClientTransaction 関数によって返されたものでなければならない。
%inst
DDE オブジェクトを解放し、オブジェクトに関連付けられたデータハンドルを削除する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。エラーコードは DdeGetLastError
関数で取得でき、次のいずれかになる:

[備考]
アプリケーションは次の状況で DdeFreeDataHandle を呼ばなければならない:
（以下省略）


%index
DdeAccessData
指定された DDE オブジェクト内のデータへのアクセスを提供する。アプリケーションはオブジェクト内のデータへのアクセスを終えたら DdeUnaccessData 関数を呼ばなければならない。
%group
Win32 user32
%prm
hData, pcbDataSize
hData : [intptr] 型: HDDEDATA アクセスする DDE オブジェクトへのハンドル。
pcbDataSize : [var] 型: LPDWORD hData パラメータで識別される DDE オブジェクトのサイズ (バイト) を受け取る変数へのポインタ。NULL の場合、サイズ情報は返されない。
%inst
指定された DDE オブジェクト内のデータへのアクセスを提供する。アプリケーションはオブジェクト内のデータへのアクセスを終えたら
DdeUnaccessData 関数を呼ばなければならない。

[戻り値]
型: LPBYTE 関数が成功した場合、戻り値は DDE オブジェクト内のデータの最初のバイトへのポインタ。関数が失敗した場合、戻り値は
NULL。エラーコードは DdeGetLastError 関数で取得でき、次のいずれかになる:

[備考]
hData パラメータがまだ DDEML 関数に渡されていない場合、アプリケーションは DdeAccessData
が返したポインタを使って DDE オブジェクトに対して読み書きアクセスができる。hData が既に DDEML
関数に渡されている場合、ポインタはメモリオブジェクトへの読み取りアクセスにのみ使用すべきである。


%index
DdeAddData
指定された DDE オブジェクトにデータを追加する。
%group
Win32 user32
%prm
hData, pSrc, cb, cbOff
hData : [intptr] 型: HDDEDATA データを追加する DDE オブジェクトへのハンドル。
pSrc : [var] 型: LPBYTE DDE オブジェクトに追加するデータ。
cb : [int] 型: DWORD DDE オブジェクトに追加するデータの長さ (バイト)。データが文字列の場合は終端 NULL を含む。
cbOff : [int] 型: DWORD DDE オブジェクトの先頭からのオフセット (バイト)。追加データはこのオフセットからオブジェクトにコピーされる。
%inst
指定された DDE オブジェクトにデータを追加する。

[戻り値]
型: HDDEDATA 関数が成功した場合、戻り値は DDE
オブジェクトへの新しいハンドル。新しいハンドルはオブジェクトへのすべての参照で使用される。関数が失敗した場合、戻り値は 0。エラーコードは
DdeGetLastError 関数で取得でき、次のいずれかになる:

[備考]
データハンドルが他の DDEML 関数のパラメータとして使われた、または DDE コールバック関数によって返された後は、ハンドルは識別する
DDE
オブジェクトへの読み取りアクセスにのみ使用できる。元々割り当てられたメモリ量が追加データを保持するのに不足している場合、DdeAddData
は適切なサイズのグローバルメモリオブジェクトを再割り当てする。


%index
DdeClientTransaction
クライアントとサーバ間のデータトランザクションを開始する。この関数を呼べるのは DDE クライアントアプリケーションのみで、サーバとの会話を確立した後にのみ使用できる。
%group
Win32 user32
%prm
pData, cbData, hConv, hszItem, wFmt, wType, dwTimeout, pdwResult
pData : [var] 型: LPBYTE クライアントがサーバに渡すデータの先頭。あるいはサーバに渡すデータハンドル (HDDEDATA) を指定でき、その場合 cbData は -1 に設定する必要がある。このパラメータは wType が XTYP_EXECUTE または XTYP_POKE の場合のみ必要。それ以外の場合、このパラメータは NULL であるべき。pData がデータハンドルである XTYP_POKE トランザクションでは、ハンドルは wFmt パラメータで指定されたものと同じデータ形式を使用して DdeCreateDataHandle 関数の以前の呼び出しで作成されている必要がある。
cbData : [int] 型: DWORD pData パラメータが指すデータの長さ (バイト)。データが文字列の場合は終端 NULL を含む。-1 は pData が送信されるデータを識別するデータハンドルであることを示す。
hConv : [intptr] 型: HCONV トランザクションを行う会話へのハンドル。
hszItem : [intptr] 型: HSZ トランザクション中にデータが交換されるデータ項目へのハンドル。このハンドルは DdeCreateStringHandle 関数の以前の呼び出しで作成されたものでなければならない。wType が XTYP_EXECUTE の場合、このパラメータは無視される (0L に設定すべき)。
wFmt : [int] 型: UINT データ項目が送信または要求される標準クリップボード形式。wType で指定されたトランザクションがデータを渡さない、または XTYP_EXECUTE の場合、このパラメータは 0 であるべき。wType が非実行 DDE データ (XTYP_POKE、XTYP_ADVSTART、XTYP_ADVSTOP、XTYP_REQUEST) を参照する場合、wFmt は有効な定義済み (CF_) DDE 形式または有効な登録済みクリップボード形式でなければならない。
wType : [int] 型: UINT
dwTimeout : [int] 型: DWORD 同期トランザクションでクライアントがサーバアプリケーションからの応答を待つ最大時間 (ミリ秒)。非同期トランザクションの場合、TIMEOUT_ASYNC を指定する。
pdwResult : [var] 型: LPDWORD トランザクションの結果を受け取る変数へのポインタ。結果を確認しないアプリケーションは NULL を渡せる。同期トランザクションでは、この変数の下位ワードにトランザクションから生じる適用可能な DDE_ フラグが含まれる。これは DDE_APPSTATUS ビットに依存するアプリケーションのサポートを提供する。ただし、これらのビットは将来のバージョンの DDEML でサポートされない可能性があるため、アプリケーションはこれらのビットを使用しないことが推奨される。非同期トランザクションでは、この変数には DdeAbandonTransaction 関数や XTYP_XACT_COMPLETE トランザクションで使用する一意のトランザクション識別子が格納される。
%inst
クライアントとサーバ間のデータトランザクションを開始する。この関数を呼べるのは DDE
クライアントアプリケーションのみで、サーバとの会話を確立した後にのみ使用できる。

[戻り値]
型: HDDEDATA
関数が成功した場合、戻り値はクライアントがサーバからデータを期待する成功した同期トランザクションのデータを識別するデータハンドル。成功した非同期トランザクション、およびクライアントがデータを期待しない同期トランザクションでは戻り値は
0 以外。すべての失敗トランザクションでは戻り値は 0。エラーコードは DdeGetLastError
関数で取得でき、次のいずれかになる:

[備考]
DdeClientTransaction が返したデータハンドルの使用が終わったら、アプリケーションは DdeFreeDataHandle
関数を呼んでハンドルを解放すべきである。トランザクションは同期または非同期にできる。同期トランザクション中、DdeClientTransaction
はトランザクションが正常に完了するか失敗するまで戻らない。同期トランザクションはクライアントを各種非同期イベントを待つモーダルループに入れる。このため、クライアントアプリケーションは同期トランザクションを待つ間もユーザ入力に応答できるが、最初のトランザクションに関連するアクティビティのため
2
番目の同期トランザクションを開始できない。同じタスクのインスタンスが既に同期トランザクションを進行中の場合、DdeClientTransaction
は失敗する。非同期トランザクション中、DdeClientTransaction
はトランザクションが開始した後、参照用のトランザクション識別子を渡して戻る。サーバの DDE
コールバック関数が非同期トランザクションの処理を完了すると、システムはクライアントに XTYP_XACT_COMPLETE
トランザクションを送信する。このトランザクションは、クライアントが DdeClientTransaction
を呼んで開始した非同期トランザクションの結果をクライアントに提供する。クライアントアプリケーションは
DdeAbandonTransaction 関数を呼んで非同期トランザクションを破棄することを選択できる。


%index
DdeCmpStringHandles
2 つの文字列ハンドルの値を比較する。文字列ハンドルの値は関連する文字列の大文字小文字とは無関係である。
%group
Win32 user32
%prm
hsz1, hsz2
hsz1 : [intptr] 型: HSZ 1 番目の文字列へのハンドル。
hsz2 : [intptr] 型: HSZ 2 番目の文字列へのハンドル。
%inst
2 つの文字列ハンドルの値を比較する。文字列ハンドルの値は関連する文字列の大文字小文字とは無関係である。

[戻り値]
型: int 戻り値は次のいずれかの値をとる。
（以下省略）

[備考]
2
つの文字列ハンドルの大文字小文字を区別する比較を行う必要があるアプリケーションは、文字列ハンドルを直接比較すべきである。それ以外のすべての比較では
DDE の大文字小文字非区別の性質を保持するために DdeCmpStringHandles
を使用すべき。DdeCmpStringHandles は文字列ハンドルをアルファベット順にソートするためには使用できない。


%index
DdeConnect
指定されたサービス名とトピック名の組をサポートするサーバアプリケーションとの会話を確立する。複数のそのようなサーバが存在する場合、システムは 1 つだけを選択する。
%group
Win32 user32
%prm
idInst, hszService, hszTopic, pCC
idInst : [int] 型: DWORD DdeInitialize 関数の以前の呼び出しで取得したアプリケーションインスタンス識別子。
hszService : [intptr] 型: HSZ 会話を確立するサーバアプリケーションのサービス名を指定する文字列へのハンドル。このハンドルは DdeCreateStringHandle 関数の以前の呼び出しで作成されたものでなければならない。0L の場合、利用可能な任意のサーバとの会話が確立される。
hszTopic : [intptr] 型: HSZ 会話を確立するトピックの名前を指定する文字列へのハンドル。このハンドルは DdeCreateStringHandle の以前の呼び出しで作成されたものでなければならない。0L の場合、選択されたサーバがサポートする任意のトピック上で会話が確立される。
pCC : [var] 型: PCONVCONTEXT 会話コンテキスト情報を含む CONVCONTEXT 構造体へのポインタ。NULL の場合、サーバは XTYP_CONNECT または XTYP_WILDCONNECT トランザクション中に既定の CONVCONTEXT 構造体を受け取る。
%inst

指定されたサービス名とトピック名の組をサポートするサーバアプリケーションとの会話を確立する。複数のそのようなサーバが存在する場合、システムは
1 つだけを選択する。

[戻り値]
型: HCONV 関数が成功した場合、戻り値は確立された会話へのハンドル。関数が失敗した場合、戻り値は 0L。エラーコードは
DdeGetLastError 関数で取得でき、次のいずれかになる:

[備考]
クライアントアプリケーションは選択されたサーバについての仮定をしてはならない。hszService
にインスタンス固有の名前が指定されている場合、指定されたインスタンスとのみ会話が確立される。インスタンス固有のサービス名は
XTYP_REGISTER および XTYP_UNREGISTER トランザクション中にアプリケーションの DDE
コールバック関数に渡される。既定の CONVCONTEXT 構造体のすべてのメンバはゼロに設定されるが、cb
は構造体のサイズを指定し、iCodePage はクライアントアプリケーションが ANSI 版か Unicode 版のいずれの
DdeInitialize 関数を呼んだかに応じて CP_WINANSI (既定コードページ) または CP_WINUNICODE
を指定する。


%index
DdeDisconnectList
指定された会話リストを破棄し、それに関連付けられたすべての会話を終了する。
%group
Win32 user32
%prm
hConvList
hConvList : [intptr] 型: HCONVLIST 会話リストへのハンドル。このハンドルは DdeConnectList 関数の以前の呼び出しで作成されたものでなければならない。
%inst
指定された会話リストを破棄し、それに関連付けられたすべての会話を終了する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。エラーコードは DdeGetLastError
関数で取得でき、次のいずれかになる:

[備考]
アプリケーションはリスト内の個々の会話を終了するために DdeDisconnect 関数を使用できる。


%index
DdeConnectList
指定されたサービス名とトピック名の組をサポートするすべてのサーバアプリケーションとの会話を確立する。
%group
Win32 user32
%prm
idInst, hszService, hszTopic, hConvList, pCC
idInst : [int] 型: DWORD DdeInitialize 関数の以前の呼び出しで取得したアプリケーションインスタンス識別子。
hszService : [intptr] 型: HSZ 会話を確立するサーバアプリケーションのサービス名を指定する文字列へのハンドル。0L の場合、システムは指定されたトピック名をサポートする利用可能なすべてのサーバとの会話確立を試みる。
hszTopic : [intptr] 型: HSZ 会話を確立するトピックの名前を指定する文字列へのハンドル。このハンドルは DdeCreateStringHandle 関数の以前の呼び出しで作成されたものでなければならない。0L の場合、システムは選択されたサーバがサポートするすべてのトピック上で会話を確立しようとする。
hConvList : [intptr] 型: HCONVLIST 列挙する会話リストへのハンドル。新しい会話リストを確立する場合は 0L を指定する。
pCC : [var] 型: PCONVCONTEXT 会話コンテキスト情報を含む CONVCONTEXT 構造体へのポインタ。NULL の場合、サーバは XTYP_CONNECT または XTYP_WILDCONNECT トランザクション中に既定の CONVCONTEXT 構造体を受け取る。
%inst
指定されたサービス名とトピック名の組をサポートするすべてのサーバアプリケーションとの会話を確立する。

[戻り値]
型: HCONVLIST 関数が成功した場合、戻り値は新しい会話リストへのハンドル。関数が失敗した場合、戻り値は
0L。古い会話リストへのハンドルはもう有効ではない。エラーコードは DdeGetLastError 関数で取得でき、次のいずれかになる:

[備考]
アプリケーションは、リスト内の会話ハンドルがアクティブかどうかにかかわらず、DdeConnectList
関数が返す会話リストハンドルを解放しなければならない。ハンドルを解放するにはアプリケーションは DdeDisconnectList
を呼べる。既定の CONVCONTEXT 構造体のすべてのメンバはゼロに設定されるが、cb は構造体のサイズを指定し、iCodePage
はクライアントアプリケーションが ANSI 版か Unicode 版のいずれの DdeInitialize 関数を呼んだかに応じて
CP_WINANSI (既定コードページ) または CP_WINUNICODE を指定する。


%index
DdeCreateDataHandle
DDE オブジェクトを作成し、指定されたバッファのデータでオブジェクトを埋める。DDE アプリケーションは、相手のアプリケーションにデータを渡すトランザクション中にこの関数を使用する。
%group
Win32 user32
%prm
idInst, pSrc, cb, cbOff, hszItem, wFmt, afCmd
idInst : [int] 型: DWORD DdeInitialize 関数の以前の呼び出しで取得したアプリケーションインスタンス識別子。
pSrc : [var] 型: LPBYTE DDE オブジェクトにコピーするデータ。NULL の場合、データはオブジェクトにコピーされない。
cb : [int] 型: DWORD pSrc が指すバッファからコピーするメモリ量 (バイト)。データが文字列の場合は終端 NULL を含む。0 の場合、pSrc パラメータは無視される。
cbOff : [int] 型: DWORD pSrc パラメータが指すバッファの先頭からのオフセット (バイト)。このオフセットからバッファのデータが DDE オブジェクトにコピーされる。
hszItem : [intptr] 型: HSZ DDE オブジェクトに対応するデータ項目を指定する文字列へのハンドル。このハンドルは DdeCreateStringHandle 関数の以前の呼び出しで作成されたものでなければならない。データハンドルが XTYP_EXECUTE トランザクションで使用される場合、このパラメータは 0L でなければならない。
wFmt : [int] 型: UINT データの標準クリップボード形式。
afCmd : [int] 型: UINT 作成フラグ。HDATA_APPOWNED を指定でき、これは DdeCreateDataHandle 関数を呼び出すサーバアプリケーションがこの関数が作成するデータハンドルを所有することを指定する。このフラグにより、アプリケーションは各アプリケーションに渡す別々のハンドルを作成するのではなく、データハンドルを他の DDEML アプリケーションと共有できる。このフラグを指定する場合、アプリケーションは最終的に DdeFreeDataHandle 関数を使ってハンドルに関連する共有メモリオブジェクトを解放しなければならない。このフラグが指定されていない場合、データハンドルがアプリケーションの DDE コールバック関数によって返されたか、別の DDEML 関数のパラメータとして使われた後、ハンドルを作成したアプリケーション内でハンドルは無効になる。
%inst
DDE オブジェクトを作成し、指定されたバッファのデータでオブジェクトを埋める。DDE
アプリケーションは、相手のアプリケーションにデータを渡すトランザクション中にこの関数を使用する。

[戻り値]
型: HDDEDATA 関数が成功した場合、戻り値はデータハンドル。関数が失敗した場合、戻り値は 0L。エラーコードは
DdeGetLastError 関数で取得でき、次のいずれかになる:

[備考]
DDE オブジェクト内の埋められていない位置は未定義である。データハンドルが他の DDEML 関数のパラメータとして使われた、または
DDE コールバック関数によって返された後は、ハンドルは識別する DDE オブジェクトへの読み取りアクセスにのみ使用できる。


%index
DdeCreateStringHandleW
指定された文字列を識別するハンドルを作成する。DDE クライアントまたはサーバアプリケーションは、文字列ハンドルをパラメータとして他の DDEML 関数に渡せる。(Unicode)
%group
Win32 user32
%prm
idInst, psz, iCodePage
idInst : [int] 型: DWORD DdeInitialize 関数の以前の呼び出しで取得したアプリケーションインスタンス識別子。
psz : [wstr] 型: LPTSTR ハンドルを作成する null 終端文字列。この文字列は最大 255 文字まで。これは DDEML 文字列管理関数がアトムを使って実装されているためである。
iCodePage : [int] 型: int 文字列のレンダリングに使用するコードページ。クライアントアプリケーションが ANSI 版か Unicode 版のいずれの DdeInitialize を呼んだかに応じて CP_WINANSI (既定コードページ) または CP_WINUNICODE を指定する。
%inst
指定された文字列を識別するハンドルを作成する。DDE クライアントまたはサーバアプリケーションは、文字列ハンドルをパラメータとして他の
DDEML 関数に渡せる。(Unicode)

[戻り値]
型: HSZ 関数が成功した場合、戻り値は文字列ハンドル。関数が失敗した場合、戻り値は 0L。エラーコードは
DdeGetLastError 関数で取得でき、次のいずれかになる:

[備考]

文字列ハンドルの値は識別する文字列の大文字小文字とは無関係である。アプリケーションが文字列ハンドルを作成するか、コールバック関数で受け取って
DdeKeepStringHandle
関数で保持した場合、不要になったらアプリケーションはその文字列ハンドルを解放しなければならない。インスタンス固有の文字列ハンドルは、文字列ハンドルから文字列、そして文字列ハンドルへとマッピングできない。これは次の例で示される。DdeQueryString
関数が文字列ハンドルから文字列を作成し、DdeCreateStringHandle がその文字列から文字列ハンドルを作成しても、2
つのハンドルは同じではない:
（以下省略）


%index
DdeEnableCallback
特定の会話または呼び出し元アプリケーションが現在確立しているすべての会話に対するトランザクションを有効または無効にする。
%group
Win32 user32
%prm
idInst, hConv, wCmd
idInst : [int] 型: DWORD DdeInitialize 関数の以前の呼び出しで取得したアプリケーションインスタンス識別子。
hConv : [intptr] 型: HCONV 有効/無効にする会話へのハンドル。NULL の場合、関数はすべての会話に影響する。
wCmd : [int] 型: UINT
%inst
特定の会話または呼び出し元アプリケーションが現在確立しているすべての会話に対するトランザクションを有効または無効にする。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。wCmd が EC_QUERYWAITING
で、アプリケーションのトランザクションキューに処理されていない 1 つ以上の未処理トランザクションがある場合、戻り値は
TRUE。それ以外の場合は FALSE。エラーコードは DdeGetLastError 関数で取得でき、次のいずれかになる:

[備考]
アプリケーションは DDE コールバック関数から CBR_BLOCK
戻りコードを返すことで特定の会話のトランザクションを無効化できる。DdeEnableCallback
関数を使って会話を再有効化すると、オペレーティングシステムは会話が無効化されたときに進行中だったトランザクションと同じトランザクションを生成する。EC_QUERYWAITING
フラグを使っても会話の有効状態は変わらず、DdeEnableCallback
の呼び出しコンテキスト内でトランザクションが発行されることもない。EC_QUERYWAITING で DdeEnableCallback
を呼んで関数が 0
以外を返した場合、アプリケーションは速やかにメッセージ処理を許可する、コールバックから戻る、またはコールバックを有効化するように努めるべきである。そのような結果は、後続のコールバックが行われることを保証するものではない。EC_QUERYWAITING
で DdeEnableCallback
を呼ぶことで、コールバックがブロックされたアプリケーションはブロックされた会話に対して保留中のトランザクションがあるかどうかを判定できる。もちろん、そのような呼び出しが
0 を返しても、アプリケーションは常にメッセージをタイムリーに処理すべきである。


%index
DdeFreeStringHandle
呼び出し元アプリケーション内の文字列ハンドルを解放する。
%group
Win32 user32
%prm
idInst, hsz
idInst : [int] 型: DWORD DdeInitialize 関数の以前の呼び出しで取得したアプリケーションインスタンス識別子。
hsz : [intptr] 型: HSZ 解放する文字列ハンドルへのハンドル。このハンドルは DdeCreateStringHandle 関数の以前の呼び出しで作成されたものでなければならない。
%inst
呼び出し元アプリケーション内の文字列ハンドルを解放する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。

[備考]
アプリケーションは DdeCreateStringHandle で作成した文字列ハンドルを解放できるが、システムがアプリケーションの
DDE コールバック関数に渡したものや DdeQueryConvInfo 関数の CONVINFO
構造体で返されたものは解放すべきではない。


%index
DdeGetData
指定された DDE オブジェクトから指定されたローカルバッファにデータをコピーする。
%group
Win32 user32
%prm
hData, pDst, cbMax, cbOff
hData : [intptr] 型: HDDEDATA コピーするデータを含む DDE オブジェクトへのハンドル。
pDst : [var] 型: LPBYTE データを受け取るバッファへのポインタ。NULL の場合、DdeGetData 関数はバッファにコピーされるであろうデータの量 (バイト) を返す。
cbMax : [int] 型: DWORD pDst パラメータが指すバッファにコピーするデータの最大量 (バイト)。通常、このパラメータは pDst が指すバッファの長さを指定する。
cbOff : [int] 型: DWORD DDE オブジェクト内のオフセット。このオフセットからオブジェクトのデータがコピーされる。
%inst
指定された DDE オブジェクトから指定されたローカルバッファにデータをコピーする。

[戻り値]
型: DWORD pDst がバッファを指す場合、戻り値はデータハンドルに関連付けられたメモリオブジェクトのサイズ (バイト)、または
cbMax で指定されたサイズのいずれか低い方。pDst が NULL
の場合、戻り値はデータハンドルに関連付けられたメモリオブジェクトのサイズ (バイト)。エラーコードは DdeGetLastError
関数で取得でき、次のいずれかになる:


%index
DdeGetLastError
DDEML 関数の失敗によって設定された最新のエラーコードを取得し、エラーコードを DMLERR_NO_ERROR にリセットする。
%group
Win32 user32
%prm
idInst
idInst : [int] 型: DWORD DdeInitialize 関数の以前の呼び出しで取得したアプリケーションインスタンス識別子。
%inst
DDEML 関数の失敗によって設定された最新のエラーコードを取得し、エラーコードを DMLERR_NO_ERROR にリセットする。

[戻り値]
型: UINT 関数が成功した場合、戻り値は最新のエラーコードで、次のいずれかの値になる。
（以下省略）


%index
DdeImpersonateClient
DDE クライアント会話で DDE クライアントアプリケーションを偽装する。
%group
Win32 user32
%prm
hConv
hConv : [intptr] 型: HCONV 偽装する DDE クライアント会話へのハンドル。
%inst
DDE クライアント会話で DDE クライアントアプリケーションを偽装する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
偽装とは、プロセスが別のプロセスのセキュリティ属性を引き受ける能力である。DDE 会話のクライアントが DDE
サーバから情報を要求するとき、サーバはクライアントを偽装する。サーバがオブジェクトへのアクセスを要求すると、システムはクライアントのセキュリティ属性に対してアクセスを検証する。偽装が完了したら、サーバは通常
RevertToSelf 関数を呼ぶ。セキュリティに関する考慮事項: DdeImpersonateClient
の呼び出しが何らかの理由で失敗した場合、クライアントは偽装されず、クライアント要求は呼び出し元プロセスのセキュリティコンテキストで行われる。呼び出し元プロセスが
LocalSystem
などの高権限アカウント、または管理者グループのメンバとして実行されている場合、ユーザは通常許可されないアクションを実行できる可能性がある。したがって、呼び出しの戻り値を必ず確認し、失敗してエラーが発生した場合はクライアント要求の実行を続行しないことが重要である。


%index
DdeInitializeW
アプリケーションを動的データ交換管理ライブラリ (DDEML) に登録する。アプリケーションは他のすべての DDEML 関数を呼ぶ前にこの関数を呼ばなければならない。(Unicode)
%group
Win32 user32
%prm
pidInst, pfnCallback, afCmd, ulRes
pidInst : [var] 型: LPDWORD アプリケーションインスタンス識別子。初期化時、このパラメータは 0 を指していなければならない。関数が成功した場合、このパラメータはアプリケーションのインスタンス識別子を指す。この値は、必要とする他のすべての DDEML 関数に idInst パラメータとして渡される。アプリケーションが DDEML DLL の複数インスタンスを使用する場合、アプリケーションは各インスタンス用に異なるコールバック関数を提供すべきである。pidInst が 0 以外の値を指している場合、DDEML の再初期化が行われる。この場合、pidInst は有効なアプリケーションインスタンス識別子を指していなければならない。
pfnCallback : [int] 型: PFNCALLBACK アプリケーション定義の DDE コールバック関数へのポインタ。この関数はシステムが送信する DDE トランザクションを処理する。詳細は DdeCallback コールバック関数を参照。
afCmd : [int] 型: DWORD APPCMD_、CBF_、MF_ フラグの集合。APPCMD_ フラグは DdeInitialize に特別な指示を提供する。CBF_ フラグは特定の種類のトランザクションがコールバック関数に到達するのを防ぐフィルタを指定する。MF_ フラグは DDE 監視アプリケーションが監視する DDE アクティビティの種類を指定する。これらのフラグを使うと、コールバック関数への不必要な呼び出しを排除して DDE アプリケーションのパフォーマンスを向上させられる。
ulRes : [int] 型: DWORD 予約されており、0 に設定する必要がある。
%inst
アプリケーションを動的データ交換管理ライブラリ (DDEML) に登録する。アプリケーションは他のすべての DDEML
関数を呼ぶ前にこの関数を呼ばなければならない。(Unicode)

[戻り値]
型: UINT 関数が成功した場合、戻り値は DMLERR_NO_ERROR。関数が失敗した場合、戻り値は次のいずれかの値になる:

[備考]
DDEML の複数のインスタンスを使用するアプリケーションは、インスタンス間で DDEML オブジェクトを渡してはならない。DDE
監視アプリケーションは、同じアプリケーションインスタンスのコンテキスト内で DDE 操作 (会話の確立、トランザクションの発行など)
を行おうとすべきではない。同じタスクのインスタンスで既に同期トランザクションが進行中の場合、同期トランザクションは
DMLERR_REENTRANCY エラーで失敗する。CBF_FAIL_ALLSVRXACTIONS フラグは DDEML
がすべてのサーバトランザクションをフィルタするようにし、後続の DdeInitialize
呼び出しで変更できる。APPCMD_CLIENTONLY フラグは DDEML がサーバ用のキーリソースを作成するのを防ぎ、後続の
DdeInitialize 呼び出しで変更できない。DdeInitialize には ANSI 版と Unicode
版がある。呼ばれる版によって DDE 会話を制御するために使用されるウィンドウプロシージャの種類 (ANSI または Unicode)
と、CONVCONTEXT 構造体の iCodePage メンバの既定値 (CP_WINANSI または CP_WINUNICODE)
が決まる。
> [!NOTE] > ddeml.h ヘッダは DdeInitialize をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づき自動的に ANSI/Unicode
版を選択する。エンコーディング非依存のエイリアスとそうでないコードを混在させると、コンパイル時または実行時のエラーにつながる不一致が生じる可能性がある。詳細は
Conventions for Function Prototypes を参照。


%index
DdeKeepStringHandle
指定されたハンドルに関連する使用カウントをインクリメントする。
%group
Win32 user32
%prm
idInst, hsz
idInst : [int] 型: DWORD DdeInitialize 関数の以前の呼び出しで取得したアプリケーションインスタンス識別子。
hsz : [intptr] 型: HSZ 保存する文字列ハンドルへのハンドル。
%inst
指定されたハンドルに関連する使用カウントをインクリメントする。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。


%index
DdeNameService
DDE サーバがサポートするサービス名を登録または登録解除する。
%group
Win32 user32
%prm
idInst, hsz1, hsz2, afCmd
idInst : [int] 型: DWORD DdeInitialize 関数の以前の呼び出しで取得したアプリケーションインスタンス識別子。
hsz1 : [intptr] 型: HSZ サーバが登録または登録解除するサービス名を指定する文字列へのハンドル。すべてのサービス名を登録解除するアプリケーションは、このパラメータを 0L に設定すべき。
hsz2 : [intptr] 型: HSZ 予約されており、0L に設定すべき。
afCmd : [int] 型: UINT
%inst
DDE サーバがサポートするサービス名を登録または登録解除する。

[戻り値]
型: HDDEDATA 関数が成功した場合、0 以外の値を返す。この値は真の HDDEDATA
値ではなく、成功を示す単なるブール値である。関数は将来の機能拡張やより高度な戻り値のため HDDEDATA
型としている。関数が失敗した場合、戻り値は 0L。エラーコードは DdeGetLastError 関数で取得でき、次のいずれかになる:

[備考]
hsz1 で識別されるサービス名はベース名 (つまりインスタンス固有の情報を含まない名前)
であるべき。システムはインスタンス固有の名前を生成し、XTYP_REGISTER および XTYP_UNREGISTER
トランザクション中にベース名と一緒に送信する。受信側のアプリケーションは特定のアプリケーションインスタンスに接続できる。


%index
DdePostAdvise
指定されたトピックと項目上にアクティブなアドバイスループを持つ各クライアントについて、システムが呼び出し元 (サーバ) アプリケーションの DDE コールバック関数に XTYP_ADVREQ トランザクションを送信するようにする。
%group
Win32 user32
%prm
idInst, hszTopic, hszItem
idInst : [int] 型: DWORD DdeInitialize 関数の以前の呼び出しで取得したアプリケーションインスタンス識別子。
hszTopic : [intptr] 型: HSZ トピック名を指定する文字列へのハンドル。アクティブなアドバイスループを持つすべてのトピックに通知を送るには、このパラメータを 0L に設定する。
hszItem : [intptr] 型: HSZ 項目名を指定する文字列へのハンドル。アクティブなアドバイスループを持つすべての項目に通知を送るには、このパラメータを 0L に設定する。
%inst
指定されたトピックと項目上にアクティブなアドバイスループを持つ各クライアントについて、システムが呼び出し元 (サーバ) アプリケーションの
DDE コールバック関数に XTYP_ADVREQ トランザクションを送信するようにする。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。エラーコードは DdeGetLastError
関数で取得でき、次のいずれかになる:

[備考]

列挙不可能なトピックや項目を持つサーバは、システムがすべてのアクティブなアドバイスループに対するトランザクションを生成するように、hszTopic
と hszItem を NULL に設定すべきである。サーバの DDE コールバック関数は更新する必要のないアドバイスループに対して
NULL を返す。サーバが、現在 XTYP_ADVREQ コールバックで処理中の集合を含むトピック、項目、フォーマット名集合で
DdePostAdvise を呼ぶと、スタックオーバーフローになる可能性がある。


%index
DdeQueryConvInfo
DDE トランザクションおよびトランザクションが行われる会話に関する情報を取得する。
%group
Win32 user32
%prm
hConv, idTransaction, pConvInfo
hConv : [intptr] 型: HCONV 会話へのハンドル。
idTransaction : [int] 型: DWORD トランザクション。非同期トランザクションでは、このパラメータは DdeClientTransaction 関数によって返されるトランザクション識別子であるべき。同期トランザクションでは、QID_SYNC を指定する。
pConvInfo : [var] 型: PCONVINFO トランザクションと会話に関する情報を受け取る CONVINFO 構造体へのポインタ。CONVINFO 構造体の cb メンバには、構造体に割り当てられたバッファの長さを指定しなければならない。
%inst
DDE トランザクションおよびトランザクションが行われる会話に関する情報を取得する。

[戻り値]
型: UINT 関数が成功した場合、戻り値は CONVINFO 構造体にコピーされたバイト数。関数が失敗した場合、戻り値は
FALSE。エラーコードは DdeGetLastError 関数で取得でき、次のいずれかになる:

[備考]
アプリケーションは CONVINFO
構造体が参照する文字列ハンドルを解放すべきではない。これらの文字列ハンドルのいずれかを使う必要がある場合、アプリケーションは
DdeKeepStringHandle 関数を呼んでハンドルのコピーを作成すべき。idTransaction が QID_SYNC
に設定されている場合、CONVINFO 構造体の hUser
メンバは会話に関連付けられ、会話に関するデータの保持に使用できる。idTransaction
が非同期トランザクションの識別子である場合、hUser
メンバは現在のトランザクションのみに関連付けられ、トランザクションの期間中のみ有効である。


%index
DdeQueryNextServer
指定された会話リスト内の次の会話ハンドルを取得する。
%group
Win32 user32
%prm
hConvList, hConvPrev
hConvList : [intptr] 型: HCONVLIST 会話リストへのハンドル。このハンドルは DdeConnectList 関数の以前の呼び出しで作成されたものでなければならない。
hConvPrev : [intptr] 型: HCONV この関数が以前に返した会話ハンドル。0L の場合、関数はリスト内の最初の会話ハンドルを返す。
%inst
指定された会話リスト内の次の会話ハンドルを取得する。

[戻り値]
型: HCONV リストにさらに会話ハンドルがある場合、戻り値はリスト内の次の会話ハンドル。それ以外は 0L。


%index
DdeQueryStringW
文字列ハンドルに関連付けられたテキストをバッファにコピーする。(Unicode)
%group
Win32 user32
%prm
idInst, hsz, psz, cchMax, iCodePage
idInst : [int] 型: DWORD DdeInitialize 関数の以前の呼び出しで取得したアプリケーションインスタンス識別子。
hsz : [intptr] 型: HSZ コピーする文字列へのハンドル。このハンドルは DdeCreateStringHandle 関数の以前の呼び出しで作成されたものでなければならない。
psz : [wstr] 型: LPTSTR 文字列を受け取るバッファへのポインタ。文字列の長さを取得するには、このパラメータを NULL に設定する。
cchMax : [int] 型: DWORD psz パラメータが指すバッファの長さ (文字数)。ANSI 版ではバイト数、Unicode 版では文字数。文字列が (cchMax - 1) より長い場合、切り詰められる。psz が NULL の場合、このパラメータは無視される。
iCodePage : [int] 型: int 文字列のレンダリングに使用するコードページ。CP_WINANSI または CP_WINUNICODE のいずれかを指定する。
%inst
文字列ハンドルに関連付けられたテキストをバッファにコピーする。(Unicode)

[戻り値]
型: DWORD psz が有効なポインタを指定した場合、戻り値は返されたテキストの長さ (文字数、終端 null 文字を除く)。psz
が NULL ポインタを指定した場合、戻り値は hsz パラメータに関連付けられたテキストの長さ (終端 null
文字を除く)。エラーが発生した場合、戻り値は 0L。

[備考]
バッファに返される文字列は常に null 終端される。文字列が (cchMax - 1) より長い場合、最初の (cchMax - 1)
文字のみがコピーされる。psz が NULL の場合、DdeQueryString 関数は文字列ハンドルに関連する文字列の長さ (バイト)
を取得する。長さには終端 null 文字は含まれない。
> [!NOTE] > ddeml.h ヘッダは DdeQueryString をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に基づき自動的に ANSI/Unicode
版を選択する。エンコーディング非依存のエイリアスとそうでないコードを混在させると、コンパイル時または実行時のエラーにつながる不一致が生じる可能性がある。詳細は
Conventions for Function Prototypes を参照。


%index
DdeReconnect
クライアント DDEML アプリケーションが、クライアントとの会話を終了したサービスとの会話の再確立を試みることを可能にする。
%group
Win32 user32
%prm
hConv
hConv : [intptr] 型: HCONV 再確立する会話へのハンドル。クライアントは DdeConnect 関数の以前の呼び出し、または XTYP_DISCONNECT トランザクションから会話ハンドルを取得していなければならない。
%inst
クライアント DDEML アプリケーションが、クライアントとの会話を終了したサービスとの会話の再確立を試みることを可能にする。

[戻り値]
型: HCONV 関数が成功した場合、戻り値は再確立された会話へのハンドル。関数が失敗した場合、戻り値は 0L。エラーコードは
DdeGetLastError 関数で取得でき、次のいずれかになる:


%index
DdeSetQualityOfService
raw DDE アプリケーションが今後開始する DDE 会話に求めるサービス品質 (QOS) を指定する。
%group
Win32 user32
%prm
hwndClient, pqosNew, pqosPrev
hwndClient : [intptr] 型: HWND クライアントが DDE 会話を開始するために送信する WM_DDE_INITIATE メッセージの送信元を指定する DDE クライアントウィンドウへのハンドル。
pqosNew : [var] 型: const SECURITY_QUALITY_OF_SERVICE* 希望するサービス品質値の SECURITY_QUALITY_OF_SERVICE 構造体へのポインタ。
pqosPrev : [var] 型: PSECURITY_QUALITY_OF_SERVICE hwndClient で識別されるウィンドウに関連する以前のサービス品質値を受け取る SECURITY_QUALITY_OF_SERVICE 構造体へのポインタ。このパラメータはオプションで、アプリケーションが hwndClient の以前の QOS 値に関心がない場合は NULL に設定する。
%inst
raw DDE アプリケーションが今後開始する DDE 会話に求めるサービス品質 (QOS) を指定する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
wParam を hwndClient に設定して WM_DDE_INITIATE を送信する前にクライアントウィンドウ
hwndClient のサービス品質が指定されていない場合、システムはクライアントウィンドウに対して以下の既定のサービス品質値を使用する:
（以下省略）


%index
DdeSetUserHandle
アプリケーション定義の値を会話ハンドルまたはトランザクション識別子に関連付ける。これは非同期トランザクションの処理を簡素化するのに有用。アプリケーションは DdeQueryConvInfo 関数を使ってこの値を取得できる。
%group
Win32 user32
%prm
hConv, id, hUser
hConv : [intptr] 型: HCONV 会話へのハンドル。
id : [int] 型: DWORD hUser パラメータで指定された値に関連付けるトランザクション識別子。アプリケーションは hUser を hConv パラメータで識別される会話に関連付けるためにこのパラメータを QID_SYNC に設定すべき。
hUser : [int] 型: DWORD_PTR 会話ハンドルに関連付ける値。
%inst

アプリケーション定義の値を会話ハンドルまたはトランザクション識別子に関連付ける。これは非同期トランザクションの処理を簡素化するのに有用。アプリケーションは
DdeQueryConvInfo 関数を使ってこの値を取得できる。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。エラーコードは DdeGetLastError
関数で取得でき、次のいずれかになる:


%index
DdeUnaccessData
DDE オブジェクトへのアクセスを解除する。アプリケーションはオブジェクトへのアクセスを終えたらこの関数を呼ばなければならない。
%group
Win32 user32
%prm
hData
hData : [intptr] 型: HDDEDATA DDE オブジェクトへのハンドル。
%inst
DDE オブジェクトへのアクセスを解除する。アプリケーションはオブジェクトへのアクセスを終えたらこの関数を呼ばなければならない。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。エラーコードは DdeGetLastError
関数で取得でき、次のいずれかになる:


%index
DdeUninitialize
呼び出し元アプリケーションに関連付けられたすべての DDEML リソースを解放する。
%group
Win32 user32
%prm
idInst
idInst : [int] 型: DWORD DdeInitialize 関数の以前の呼び出しで取得したアプリケーションインスタンス識別子。
%inst
呼び出し元アプリケーションに関連付けられたすべての DDEML リソースを解放する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0。

[備考]
DdeUninitialize はアプリケーションが現在開いているすべての会話を終了する。


%index
DefFrameProcW
マルチドキュメントインターフェイス (MDI) フレームウィンドウのウィンドウプロシージャが処理しないウィンドウメッセージに対して既定の処理を行う。(Unicode)
%group
Win32 user32
%prm
hWnd, hWndMDIClient, uMsg, wParam, lParam
hWnd : [intptr] 型: HWND MDI フレームウィンドウへのハンドル。
hWndMDIClient : [intptr] 型: HWND MDI クライアントウィンドウへのハンドル。
uMsg : [int] 型: UINT 処理するメッセージ。
wParam : [intptr] 型: WPARAM メッセージ固有の追加情報。
lParam : [intptr] 型: LPARAM 追加のメッセージ固有情報。
%inst
マルチドキュメントインターフェイス (MDI)
フレームウィンドウのウィンドウプロシージャが処理しないウィンドウメッセージに対して既定の処理を行う。(Unicode)

[戻り値]
型: LRESULT 戻り値はメッセージ処理の結果を示し、メッセージによって異なる。hWndMDIClient パラメータが NULL
の場合、戻り値は DefWindowProc 関数と同じである。

[備考]
アプリケーションのウィンドウプロシージャがメッセージを処理しない場合、通常はそのメッセージを DefWindowProc
関数に渡して処理する。MDI アプリケーションでは、既定のメッセージ処理を行うために DefWindowProc の代わりに
DefFrameProc 関数と DefMDIChildProc 関数を使用する。通常なら DefWindowProc
に渡すすべてのメッセージ (非クライアントメッセージや WM_SETTEXT メッセージなど) は、代わりに DefFrameProc
に渡すべきである。DefFrameProc 関数は次のメッセージも処理する。
（以下省略）


%index
DefMDIChildProcW
マルチドキュメントインターフェイス (MDI) 子ウィンドウのウィンドウプロシージャが処理しないウィンドウメッセージに対して既定の処理を行う。(Unicode)
%group
Win32 user32
%prm
hWnd, uMsg, wParam, lParam
hWnd : [intptr] 型: HWND MDI 子ウィンドウへのハンドル。
uMsg : [int] 型: UINT 処理するメッセージ。
wParam : [intptr] 型: WPARAM メッセージ固有の追加情報。
lParam : [intptr] 型: LPARAM メッセージ固有の追加情報。
%inst
マルチドキュメントインターフェイス (MDI)
子ウィンドウのウィンドウプロシージャが処理しないウィンドウメッセージに対して既定の処理を行う。(Unicode)

[戻り値]
型: LRESULT 戻り値はメッセージ処理の結果を示し、メッセージによって異なる。

[備考]
DefMDIChildProc 関数は、hWnd パラメータで指定された MDI 子ウィンドウの親ウィンドウが MDICLIENT
クラスで作成されていることを想定する。アプリケーションのウィンドウプロシージャがメッセージを処理しない場合、通常はそのメッセージを
DefWindowProc 関数に渡して処理する。MDI アプリケーションでは、既定のメッセージ処理を行うために
DefWindowProc の代わりに DefFrameProc 関数と DefMDIChildProc 関数を使用する。通常なら
DefWindowProc に渡すすべてのメッセージ (非クライアントメッセージや WM_SETTEXT メッセージなど) は、代わりに
DefMDIChildProc に渡すべきである。さらに、DefMDIChildProc は次のメッセージも処理する。
（以下省略）


%index
DefRawInputProc
RAWINPUTHEADER 構造体のサイズが正しいことを検証する。
%group
Win32 user32
%prm
paRawInput, nInput, cbSizeHeader
paRawInput : [var] 型: PRAWINPUT* 無視される。
nInput : [int] 型: INT 無視される。
cbSizeHeader : [int] 型: UINT RAWINPUTHEADER 構造体のサイズ (バイト単位)。
%inst
RAWINPUTHEADER 構造体のサイズが正しいことを検証する。

[戻り値]
型: LRESULT 成功した場合、関数は 0 を返す。それ以外の場合は -1 を返す。


%index
DeferWindowPos
指定したウィンドウに対する複数ウィンドウ位置構造体を更新する。
%group
Win32 user32
%prm
hWinPosInfo, hWnd, hWndInsertAfter, x, y, cx, cy, uFlags
hWinPosInfo : [intptr] 型: HDWP 1 つ以上のウィンドウのサイズおよび位置情報を保持する、複数ウィンドウ位置構造体へのハンドル。この構造体は BeginDeferWindowPos または直近の DeferWindowPos 呼び出しによって返される。
hWnd : [intptr] 型: HWND 構造体に更新情報を格納するウィンドウへのハンドル。複数ウィンドウ位置構造体内のすべてのウィンドウは同じ親を持たなければならない。
hWndInsertAfter : [intptr] 型: HWND
x : [int] 型: int ウィンドウ左上隅の x 座標。
y : [int] 型: int ウィンドウ左上隅の y 座標。
cx : [int] 型: int ウィンドウの新しい幅 (ピクセル単位)。
cy : [int] 型: int ウィンドウの新しい高さ (ピクセル単位)。
uFlags : [int] 型: UINT
%inst
指定したウィンドウに対する複数ウィンドウ位置構造体を更新する。

[戻り値]
型: HDWP
戻り値は更新された複数ウィンドウ位置構造体を識別する。この関数が返すハンドルは、関数に渡されたハンドルと異なる場合がある。この関数が返した新しいハンドルは、次回の
DeferWindowPos または EndDeferWindowPos
呼び出しに渡す必要がある。関数の成功に必要なシステムリソースが不足している場合、戻り値は NULL となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
DeferWindowPos の呼び出しが失敗した場合、アプリケーションはウィンドウ配置処理を中止し、EndDeferWindowPos
を呼び出してはならない。SWP_NOZORDER が指定されていない場合、システムは hWnd パラメータで指定されたウィンドウを
hWndInsertAfter パラメータで指定されたウィンドウの直後に配置する。hWndInsertAfter が NULL または
HWND_TOP の場合、システムは hWnd ウィンドウを Z オーダーの最上位に配置する。hWndInsertAfter が
HWND_BOTTOM に設定されている場合、システムは hWnd ウィンドウを Z
オーダーの最下位に配置する。子ウィンドウのすべての座標は親ウィンドウのクライアント領域の左上隅を基準とする。ウィンドウを最前面ウィンドウにするには、hWndInsertAfter
に HWND_TOPMOST フラグを設定し、SWP_NOZORDER
フラグを設定しないようにするか、既存の最前面ウィンドウよりも上になるように Z
オーダーの位置を設定する。非最前面ウィンドウが最前面になると、その所有する子ウィンドウも最前面になる。ただし、所有者は変更されない。SWP_NOACTIVATE
フラグと SWP_NOZORDER フラグのどちらも指定されていない場合 (つまり、アプリケーションがウィンドウのアクティブ化と Z
オーダーの変更を同時に要求した場合)、hWndInsertAfter に指定された値は次の場合にのみ使用される。
（以下省略）


%index
DeleteMenu
指定したメニューから項目を削除する。メニュー項目がメニューまたはサブメニューを開くものである場合、この関数はそのメニューまたはサブメニューのハンドルを破棄し、使用されていたメモリを解放する。
%group
Win32 user32
%prm
hMenu, uPosition, uFlags
hMenu : [intptr] 型: HMENU 変更するメニューへのハンドル。
uPosition : [int] 型: UINT 削除するメニュー項目。uFlags パラメータによって決定される。
uFlags : [int] 型: UINT
%inst

指定したメニューから項目を削除する。メニュー項目がメニューまたはサブメニューを開くものである場合、この関数はそのメニューまたはサブメニューのハンドルを破棄し、使用されていたメモリを解放する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
アプリケーションはメニューが変更されるたびに、そのメニューが表示されているウィンドウの中にあるかどうかに関わらず DrawMenuBar
関数を呼び出さなければならない。


%index
DeregisterShellHookWindow
シェルフックメッセージを受信するために登録されている指定のシェルウィンドウを登録解除する。
%group
Win32 user32
%prm
hwnd
hwnd : [intptr] 型: HWND 登録解除するウィンドウへのハンドル。このウィンドウは RegisterShellHookWindow 関数の呼び出しによって登録されている。
%inst
シェルフックメッセージを受信するために登録されている指定のシェルウィンドウを登録解除する。

[戻り値]
型: BOOL 関数が成功した場合は TRUE、失敗した場合は FALSE。

[備考]
この関数は Windows XP Service Pack 1 (SP1) および Windows Server 2003 までは SDK
のヘッダーおよびライブラリに含まれていなかった。この関数用のヘッダーファイルやインポートライブラリがない場合、LoadLibrary と
GetProcAddress を使って関数を呼び出すことができる。


%index
DestroyCaret
キャレットの現在の形状を破棄し、ウィンドウからキャレットを解放し、画面からキャレットを除去する。
%group
Win32 user32
%prm

%inst
キャレットの現在の形状を破棄し、ウィンドウからキャレットを解放し、画面からキャレットを除去する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
DestroyCaret
は、現在のタスク内のウィンドウがキャレットを所有している場合にのみキャレットを破棄する。現在のタスクに属さないウィンドウがキャレットを所有している場合、DestroyCaret
は何もせず FALSE を返す。システムはキュー毎に 1
つのキャレットを提供する。ウィンドウはキーボードフォーカスを持っているかアクティブであるときにのみキャレットを作成すべきである。ウィンドウはキーボードフォーカスを失うかアクティブでなくなる前にキャレットを破棄しなければならない。例については「Destroying
a Caret」を参照。


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
DialogBoxIndirectParamW
メモリ内のダイアログボックステンプレートからモーダルダイアログボックスを作成する。(Unicode)
%group
Win32 user32
%prm
hInstance, hDialogTemplate, hWndParent, lpDialogFunc, dwInitParam
hInstance : [intptr] 型: HINSTANCE ダイアログボックスを作成するモジュールへのハンドル。
hDialogTemplate : [var] 型: LPCDLGTEMPLATE DialogBoxIndirectParam がダイアログボックスの作成に使用するテンプレート。ダイアログボックステンプレートは、ダイアログボックスを記述するヘッダーに続いて、ダイアログボックス内の各コントロールを記述する 1 つ以上の追加データブロックで構成される。テンプレートは標準形式または拡張形式のいずれかを使用できる。
hWndParent : [intptr] 型: HWND ダイアログボックスを所有するウィンドウへのハンドル。
lpDialogFunc : [int] 型: DLGPROC ダイアログボックスプロシージャへのポインタ。詳細は DialogProc を参照。
dwInitParam : [intptr] 型: LPARAM WM_INITDIALOG メッセージの lParam パラメータでダイアログボックスに渡す値。
%inst
メモリ内のダイアログボックステンプレートからモーダルダイアログボックスを作成する。(Unicode)

[戻り値]
型: INT_PTR 関数が成功した場合、戻り値はダイアログボックスを終了させた EndDialog 関数の呼び出しで指定された
nResult パラメータとなる。hWndParent パラメータが無効なために関数が失敗した場合、戻り値は 0
となる。その他の理由で関数が失敗した場合、戻り値は -1 となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
DialogBoxIndirectParam 関数は CreateWindowEx
関数を使用してダイアログボックスを作成する。その後、ダイアログボックスプロシージャに WM_INITDIALOG
メッセージを送信する。テンプレートが DS_SETFONT または DS_SHELLFONT
スタイルを指定している場合、関数はダイアログボックスプロシージャに WM_SETFONT
メッセージも送信する。関数はダイアログボックスを表示し (テンプレートが WS_VISIBLE
スタイルを指定しているかどうかに関わらず)、所有者ウィンドウを無効化し、ダイアログボックスのメッセージを取得およびディスパッチするための独自のメッセージループを開始する。ダイアログボックスプロシージャが
EndDialog 関数を呼び出すと、DialogBoxIndirectParam
はダイアログボックスを破棄し、メッセージループを終了し、所有者ウィンドウを (以前有効だった場合は)
有効化し、ダイアログボックスプロシージャが EndDialog を呼び出したときに指定した nResult パラメータを返す。
> [!NOTE] > winuser.h ヘッダーは DialogBoxIndirectParam を、UNICODE
プリプロセッサ定数の定義に基づいて ANSI または Unicode 版を自動的に選択するエイリアスとして定義する。


%index
DialogBoxParamW
ダイアログボックステンプレートリソースからモーダルダイアログボックスを作成する。(Unicode)
%group
Win32 user32
%prm
hInstance, lpTemplateName, hWndParent, lpDialogFunc, dwInitParam
hInstance : [intptr] 型: HINSTANCE ダイアログボックステンプレートを含むモジュールへのハンドル。このパラメータが NULL の場合、現在の実行可能ファイルが使用される。
lpTemplateName : [wstr] 型: LPCTSTR ダイアログボックステンプレート。このパラメータは、ダイアログボックステンプレートの名前を指定する NULL 終端文字列へのポインタか、ダイアログボックステンプレートのリソース識別子を指定する整数値のいずれかである。リソース識別子を指定する場合、上位ワードは 0、下位ワードに識別子を含めなければならない。この値の作成には MAKEINTRESOURCE マクロを使用できる。
hWndParent : [intptr] 型: HWND ダイアログボックスを所有するウィンドウへのハンドル。
lpDialogFunc : [int] 型: DLGPROC ダイアログボックスプロシージャへのポインタ。詳細は DialogProc を参照。
dwInitParam : [intptr] 型: LPARAM WM_INITDIALOG メッセージの lParam パラメータでダイアログボックスに渡す値。
%inst
ダイアログボックステンプレートリソースからモーダルダイアログボックスを作成する。(Unicode)

[戻り値]
型: INT_PTR 関数が成功した場合、戻り値はダイアログボックスを終了させた EndDialog 関数の呼び出しで指定された
nResult パラメータの値となる。hWndParent パラメータが無効なために関数が失敗した場合、戻り値は 0
となる。その他の理由で関数が失敗した場合、戻り値は -1 となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
DialogBoxParam 関数は CreateWindowEx
関数を使用してダイアログボックスを作成する。その後、ダイアログボックスプロシージャに WM_INITDIALOG メッセージを送信する
(テンプレートが DS_SETFONT または DS_SHELLFONT スタイルを指定している場合は WM_SETFONT
メッセージも送信する)。関数はダイアログボックスを表示し、所有者ウィンドウを無効化し、ダイアログボックスのメッセージを取得およびディスパッチするための独自のメッセージループを開始する。ダイアログボックスプロシージャが
EndDialog 関数を呼び出すと、DialogBoxParam
はダイアログボックスを破棄し、メッセージループを終了し、所有者ウィンドウを有効化し、EndDialog で指定された nResult
パラメータを返す。


%index
DisableProcessWindowsGhosting
呼び出し元 GUI プロセスに対してウィンドウゴースト機能を無効化する。ウィンドウゴースト機能は、応答しないアプリケーションのメインウィンドウを最小化、移動、閉じることをユーザに許可する Windows マネージャの機能である。
%group
Win32 user32
%prm

%inst
呼び出し元 GUI
プロセスに対してウィンドウゴースト機能を無効化する。ウィンドウゴースト機能は、応答しないアプリケーションのメインウィンドウを最小化、移動、閉じることをユーザに許可する
Windows マネージャの機能である。

[備考]
DisableProcessWindowsGhosting を呼び出すと、プロセスの実行中はゴースト機能が無効になる。


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
DisplayConfigGetDeviceInfo
DisplayConfigGetDeviceInfo 関数は、デバイスに関するディスプレイ構成情報を取得する。
%group
Win32 user32
%prm
requestPacket
requestPacket : [var] DISPLAYCONFIG_DEVICE_INFO_HEADER 構造体へのポインタ。この構造体には、type メンバーに含まれるパケットタイプを含めた要求に関する情報が含まれる。DisplayConfigGetDeviceInfo がヘッダー構造体の後に返す追加データの型およびサイズはパケットタイプに依存する。
%inst
DisplayConfigGetDeviceInfo 関数は、デバイスに関するディスプレイ構成情報を取得する。

[戻り値]
関数は次のいずれかの戻りコードを返す。
（以下省略）

[備考]
アダプタのソースまたはターゲットに関する追加情報 (ディスプレイ名、推奨されるディスプレイモード、ソースデバイス名など)
を取得するには、DisplayConfigGetDeviceInfo 関数を使用する。呼び出し元は
DisplayConfigGetDeviceInfo
を呼び出して、ユーザインターフェイスに表示するためのより分かりやすい名前を取得できる。アダプタ、ソース、ターゲットの名前を取得することができる。呼び出し元は
DisplayConfigGetDeviceInfo を呼び出して、接続されたディスプレイデバイスの最適な解像度を取得することもできる。


%index
DisplayConfigSetDeviceInfo
DisplayConfigSetDeviceInfo 関数はターゲットのプロパティを設定する。
%group
Win32 user32
%prm
setPacket
setPacket : [var] デバイスに設定する情報を含む DISPLAYCONFIG_DEVICE_INFO_HEADER 構造体へのポインタ。DisplayConfigSetDeviceInfo が構成に使用する追加データの型およびサイズは、ヘッダー構造体の後に続く。この追加データは DISPLAYCONFIG_DEVICE_INFO_HEADER の type メンバーで指定されるパケットタイプに依存する。
%inst
DisplayConfigSetDeviceInfo 関数はターゲットのプロパティを設定する。

[戻り値]
関数は次のいずれかの戻りコードを返す。
（以下省略）

[備考]
DisplayConfigSetDeviceInfo
は現時点ではアナログターゲットでのブート永続化強制プロジェクションの開始および停止にのみ使用できる。DisplayConfigSetDeviceInfo
は DISPLAYCONFIG_DEVICE_INFO_SET_XXX
タイプの情報の設定にのみ使用できる。DISPLAYCONFIG_DEVICE_INFO_HEADER の type メンバーが
DISPLAYCONFIG_DEVICE_INFO_GET_XXX
のいずれかに設定されている場合、DisplayConfigSetDeviceInfo は失敗する。


%index
DlgDirListW
リストボックスの内容を、指定したディレクトリ内のサブディレクトリおよびファイルの名前で置き換える。ファイル属性のセットを指定することで名前のリストをフィルタリングできる。リストにはマップされたドライブを含めることもできる。(Unicode)
%group
Win32 user32
%prm
hDlg, lpPathSpec, nIDListBox, nIDStaticPath, uFileType
hDlg : [intptr] 型: HWND リストボックスを含むダイアログボックスへのハンドル。
lpPathSpec : [wstr] 型: LPTSTR 絶対パス、相対パス、またはファイル名を指定する NULL 終端文字列を含むバッファへのポインタ。絶対パスはドライブレターまたは UNC 名で始めることができる。関数は文字列をディレクトリとファイル名に分割する。ディレクトリ内でファイル名と一致する名前を検索する。文字列にディレクトリが指定されていない場合、関数は現在のディレクトリを検索する。文字列にファイル名が含まれている場合、ファイル名には少なくとも 1 つのワイルドカード (? または *) が含まれなければならない。ファイル名が含まれない場合、関数はアスタリスクワイルドカード (*) がファイル名として指定されたかのように動作する。指定したディレクトリ内でファイル名と一致し、uFileType パラメータで指定された属性を持つすべての名前がリストボックスに追加される。
nIDListBox : [int] 型: int hDlg ダイアログボックス内のリストボックスの識別子。このパラメータが 0 の場合、DlgDirList はリストボックスへの格納を試みない。
nIDStaticPath : [int] 型: int hDlg ダイアログボックス内の静的コントロールの識別子。DlgDirList はこのコントロールのテキストを設定し、現在のドライブおよびディレクトリを表示する。現在のドライブおよびディレクトリを表示したくない場合、このパラメータを 0 にすることができる。
uFileType : [int] 型: UINT
%inst

リストボックスの内容を、指定したディレクトリ内のサブディレクトリおよびファイルの名前で置き換える。ファイル属性のセットを指定することで名前のリストをフィルタリングできる。リストにはマップされたドライブを含めることもできる。(Unicode)

[戻り値]
型: int 関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。例えば lpPathSpec
で指定された文字列が有効なパスでない場合、関数は失敗する。

[備考]
lpPathSpec がディレクトリを指定する場合、DlgDirListComboBox
はリストボックスを格納する前に現在のディレクトリを指定されたディレクトリに変更する。nIDStaticPath
パラメータで指定された静的コントロールのテキストは、新しい現在のディレクトリの名前に設定される。DlgDirList は
LB_RESETCONTENT および LB_DIR メッセージをリストボックスに送信する。


%index
DlgDirListComboBoxW
コンボボックスの内容を、指定したディレクトリ内のサブディレクトリおよびファイルの名前で置き換える。ファイル属性のセットを指定することで名前のリストをフィルタリングできる。名前のリストにはマップされたドライブレターを含めることができる。(Unicode)
%group
Win32 user32
%prm
hDlg, lpPathSpec, nIDComboBox, nIDStaticPath, uFiletype
hDlg : [intptr] 型: HWND コンボボックスを含むダイアログボックスへのハンドル。
lpPathSpec : [wstr] 型: LPTSTR 絶対パス、相対パス、またはファイル名を指定する NULL 終端文字列を含むバッファへのポインタ。絶対パスはドライブレター (例: d:\) または UNC 名 (例: \\machinename\sharename) で始めることができる。
nIDComboBox : [int] 型: int hDlg ダイアログボックス内のコンボボックスの識別子。このパラメータが 0 の場合、DlgDirListComboBox はコンボボックスへの格納を試みない。
nIDStaticPath : [int] 型: int hDlg ダイアログボックス内の静的コントロールの識別子。DlgDirListComboBox はこのコントロールのテキストを設定し、現在のドライブおよびディレクトリを表示する。現在のドライブおよびディレクトリを表示したくない場合、このパラメータを 0 にすることができる。
uFiletype : [int] 型: UINT
%inst

コンボボックスの内容を、指定したディレクトリ内のサブディレクトリおよびファイルの名前で置き換える。ファイル属性のセットを指定することで名前のリストをフィルタリングできる。名前のリストにはマップされたドライブレターを含めることができる。(Unicode)

[戻り値]
型: int 関数が成功した場合、戻り値は 0 以外となる。
関数が失敗した場合、戻り値は 0 となる。例えば lpPathSpec
で指定された文字列が有効なパスでない場合、関数は失敗する。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
lpPathSpec がディレクトリを指定する場合、DlgDirListComboBox
はコンボボックスを格納する前に現在のディレクトリを指定されたディレクトリに変更する。nIDStaticPath
パラメータで指定された静的コントロールのテキストは、新しい現在のディレクトリの名前に設定される。
DlgDirListComboBox は CB_RESETCONTENT および CB_DIR メッセージをコンボボックスに送信する。


%index
DlgDirSelectComboBoxExW
DlgDirListComboBox 関数で格納されたコンボボックスから現在の選択を取得する。選択はドライブレター、ファイル、またはディレクトリ名として解釈される。(Unicode)
%group
Win32 user32
%prm
hwndDlg, lpString, cchOut, idComboBox
hwndDlg : [intptr] 型: HWND コンボボックスを含むダイアログボックスへのハンドル。
lpString : [wstr] 型: LPTSTR 選択されたパスを受け取るバッファへのポインタ。
cchOut : [int] 型: int lpString パラメータで指定されるバッファの長さ (文字数)。
idComboBox : [int] 型: int ダイアログボックス内のコンボボックスコントロールの整数識別子。
%inst
DlgDirListComboBox
関数で格納されたコンボボックスから現在の選択を取得する。選択はドライブレター、ファイル、またはディレクトリ名として解釈される。(Unicode)

[戻り値]
型: BOOL 現在の選択がディレクトリ名である場合、戻り値は 0 以外となる。
現在の選択がディレクトリ名でない場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
現在の選択がディレクトリ名またはドライブレターを指定している場合、DlgDirSelectComboBoxEx 関数は囲んでいる角括弧
(およびドライブレターの場合はハイフン) を取り除き、新しいパスまたはファイル名に挿入できる状態にする。選択がない場合、lpString
が指すバッファの内容は変更されない。DlgDirSelectComboBoxEx
関数はコンボボックスから複数のファイル名を返すことはできない。文字列がバッファと同等以上の長さの場合、バッファには切り詰められた文字列と終端
NULL 文字が含まれる。DlgDirSelectComboBoxEx は CB_GETCURSEL および CB_GETLBTEXT
メッセージをコンボボックスに送信する。


%index
DlgDirSelectExW
単一選択リストボックスから現在の選択を取得する。リストボックスが DlgDirList 関数によって格納されており、選択がドライブレター、ファイル名、またはディレクトリ名であることを前提とする。(Unicode)
%group
Win32 user32
%prm
hwndDlg, lpString, chCount, idListBox
hwndDlg : [intptr] 型: HWND リストボックスを含むダイアログボックスへのハンドル。
lpString : [wstr] 型: LPTSTR 選択されたパスを受け取るバッファへのポインタ。
chCount : [int] 型: int lpString が指すバッファの長さ (TCHAR 単位)。
idListBox : [int] 型: int ダイアログボックス内のリストボックスの識別子。
%inst
単一選択リストボックスから現在の選択を取得する。リストボックスが DlgDirList
関数によって格納されており、選択がドライブレター、ファイル名、またはディレクトリ名であることを前提とする。(Unicode)

[戻り値]
型: BOOL 現在の選択がディレクトリ名である場合、戻り値は 0 以外となる。現在の選択がディレクトリ名でない場合、戻り値は 0
となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
DlgDirSelectEx 関数は選択を lpString
パラメータで指定されたバッファにコピーする。現在の選択がディレクトリ名またはドライブレターの場合、DlgDirSelectEx
は囲んでいる角括弧 (およびドライブレターの場合はハイフン)
を取り除き、新しいパスに挿入できる状態にする。選択がない場合、lpString
は変更されない。文字列がバッファと同等以上の長さの場合、バッファには切り詰められた文字列と終端 NULL
文字が含まれる。DlgDirSelectEx は LB_GETCURSEL および LB_GETTEXT
メッセージをリストボックスに送信する。関数はリストボックスから複数のファイル名を返すことはできない。リストボックスは複数選択リストボックスであってはならない。複数選択の場合、この関数は
0 以外の値を返さず lpString も変更されない。


%index
DragDetect
マウスをキャプチャし、ユーザが左ボタンを離すか、ESC キーを押すか、指定した点の周囲のドラッグ矩形の外側にマウスを移動するまで、その動きを追跡する。
%group
Win32 user32
%prm
hwnd, pt
hwnd : [intptr] 型: HWND マウス入力を受信するウィンドウへのハンドル。
pt : [int] 型: POINT マウスの初期位置 (スクリーン座標)。関数はこの点を使用してドラッグ矩形の座標を決定する。
%inst
マウスをキャプチャし、ユーザが左ボタンを離すか、ESC
キーを押すか、指定した点の周囲のドラッグ矩形の外側にマウスを移動するまで、その動きを追跡する。

[戻り値]
型: BOOL ユーザが左ボタンを押しながらドラッグ矩形の外側にマウスを移動した場合、戻り値は 0
以外となる。左ボタンを押しながらドラッグ矩形の外側にマウスを移動しなかった場合、戻り値は 0 となる。

[備考]
ドラッグ矩形のシステムメトリックは構成可能であり、より大きなまたは小さなドラッグ矩形を使用できる。


%index
DragObject
(no summary)
%group
Win32 user32
%prm
hwndParent, hwndFrom, fmt, data, hcur
hwndParent : [intptr] 
hwndFrom : [intptr] 
fmt : [int] 
data : [int] 
hcur : [intptr] 
%inst



%index
DrawAnimatedRects
ウィンドウのキャプションをアニメーションし、アイコンの開放またはウィンドウの最小化・最大化を示す。
%group
Win32 user32
%prm
hwnd, idAni, lprcFrom, lprcTo
hwnd : [intptr] 画面上でキャプションをアニメーションさせるウィンドウへのハンドル。アニメーションはこのウィンドウの親にクリップされる。
idAni : [int] アニメーションの種類。これは IDANI_CAPTION でなければならない。IDANI_CAPTION アニメーションタイプでは、ウィンドウキャプションが lprcFrom で指定された位置から lprcTo で指定された位置へアニメーションする。効果はウィンドウの最小化や最大化に似ている。
lprcFrom : [var] アイコンまたは最小化されたウィンドウの位置とサイズを指定する RECT 構造体へのポインタ。座標はクリッピングウィンドウ hwnd に対する相対位置である。
lprcTo : [var] 復元されたウィンドウの位置とサイズを指定する RECT 構造体へのポインタ。座標はクリッピングウィンドウ hwnd に対する相対位置である。
%inst
ウィンドウのキャプションをアニメーションし、アイコンの開放またはウィンドウの最小化・最大化を示す。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。


%index
DrawCaption
DrawCaption 関数はウィンドウキャプションを描画する。
%group
Win32 user32
%prm
hwnd, hdc, lprect, flags
hwnd : [intptr] ウィンドウキャプション用のテキストとアイコンを提供するウィンドウへのハンドル。
hdc : [intptr] デバイスコンテキストへのハンドル。関数はこのデバイスコンテキストにウィンドウキャプションを描画する。
lprect : [var] 論理座標でウィンドウキャプションの境界矩形を指定する RECT 構造体へのポインタ。
flags : [int] 
%inst
DrawCaption 関数はウィンドウキャプションを描画する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。


%index
DrawEdge
DrawEdge 関数は矩形の 1 つまたは複数のエッジを描画する。
%group
Win32 user32
%prm
hdc, qrc, edge, grfFlags
hdc : [intptr] デバイスコンテキストへのハンドル。
qrc : [var] 矩形の論理座標を含む RECT 構造体へのポインタ。
edge : [int] 描画する内側および外側のエッジの種類。このパラメータは 1 つの内側境界フラグと 1 つの外側境界フラグの組み合わせでなければならない。内側境界フラグは次のとおり。
grfFlags : [int] 
%inst
DrawEdge 関数は矩形の 1 つまたは複数のエッジを描画する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。


%index
DrawFocusRect
DrawFocusRect 関数は、矩形がフォーカスを持つことを示すスタイルで矩形を描画する。
%group
Win32 user32
%prm
hDC, lprc
hDC : [intptr] デバイスコンテキストへのハンドル。
lprc : [var] 矩形の論理座標を指定する RECT 構造体へのポインタ。
%inst
DrawFocusRect 関数は、矩形がフォーカスを持つことを示すスタイルで矩形を描画する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。

[備考]
DrawFocusRect は MM_TEXT モードでのみ動作する。DrawFocusRect は XOR 関数であるため、同じ矩形で
2
回目に呼び出すと画面から矩形が削除される。この関数はスクロールできない矩形を描画する。この関数で描画された矩形を含む領域をスクロールするには、DrawFocusRect
を呼び出して画面から矩形を削除し、領域をスクロールしてから再度 DrawFocusRect を呼び出して新しい位置に矩形を描画する。


%index
DrawFrameControl
DrawFrameControl 関数は、指定した種類およびスタイルのフレームコントロールを描画する。
%group
Win32 user32
%prm
param0, param1, param2, param3
param0 : [intptr] 
param1 : [var] 
param2 : [int] 
param3 : [int] 
%inst
DrawFrameControl 関数は、指定した種類およびスタイルのフレームコントロールを描画する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。

[備考]
uType が DFC_MENU または DFC_BUTTON のいずれかで、uState が DFCS_BUTTONPUSH
でない場合、フレームコントロールは白背景に黒のマスクとなる
(つまり、白地に黒のフレームコントロール)。このような場合、アプリケーションはビットマップメモリデバイスコンテキストへのハンドルを渡さなければならない。DPI
仮想化 この API は DPI 仮想化に参加しない。入力は常に物理ピクセルで指定され、呼び出しコンテキストとは無関係である。


%index
DrawIcon
指定したデバイスコンテキストにアイコンまたはカーソルを描画する。
%group
Win32 user32
%prm
hDC, X, Y, hIcon
hDC : [intptr] 型: HDC アイコンまたはカーソルを描画するデバイスコンテキストへのハンドル。
X : [int] 型: int アイコンの左上隅の論理 x 座標。
Y : [int] 型: int アイコンの左上隅の論理 y 座標。
hIcon : [intptr] 型: HICON 描画するアイコンへのハンドル。
%inst
指定したデバイスコンテキストにアイコンまたはカーソルを描画する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
DrawIcon はアイコンの左上隅を X および Y
パラメータで指定された位置に配置する。位置はデバイスコンテキストの現在のマッピングモードに従う。DrawIcon
はシステムメトリックで指定されたアイコン用の幅と高さを使用してアイコンまたはカーソルを描画する。


%index
DrawIconEx
指定したデバイスコンテキストにアイコンまたはカーソルを描画し、指定したラスタ演算を行い、指定どおりにアイコンやカーソルを伸縮する。
%group
Win32 user32
%prm
hdc, xLeft, yTop, hIcon, cxWidth, cyWidth, istepIfAniCur, hbrFlickerFreeDraw, diFlags
hdc : [intptr] 型: HDC アイコンまたはカーソルを描画するデバイスコンテキストへのハンドル。
xLeft : [int] 型: int アイコンまたはカーソルの左上隅の論理 x 座標。
yTop : [int] 型: int アイコンまたはカーソルの左上隅の論理 y 座標。
hIcon : [intptr] 型: HICON 描画するアイコンまたはカーソルへのハンドル。このパラメータはアニメーションカーソルを識別できる。
cxWidth : [int] 型: int アイコンまたはカーソルの論理的な幅。このパラメータが 0 で diFlags パラメータが DI_DEFAULTSIZE の場合、関数は SM_CXICON システムメトリック値を使用して幅を設定する。0 で DI_DEFAULTSIZE が使用されていない場合、関数は実際のリソースの幅を使用する。
cyWidth : [int] 型: int アイコンまたはカーソルの論理的な高さ。このパラメータが 0 で diFlags パラメータが DI_DEFAULTSIZE の場合、関数は SM_CYICON システムメトリック値を使用して高さを設定する。0 で DI_DEFAULTSIZE が使用されていない場合、関数は実際のリソースの高さを使用する。
istepIfAniCur : [int] 型: UINT hIcon がアニメーションカーソルを識別する場合に描画するフレームのインデックス。hIcon がアニメーションカーソルを識別しない場合、このパラメータは無視される。
hbrFlickerFreeDraw : [intptr] 型: HBRUSH システムがちらつきのない描画に使用するブラシへのハンドル。hbrFlickerFreeDraw が有効なブラシハンドルである場合、システムは指定されたブラシを背景色としてオフスクリーンビットマップを作成し、そのビットマップにアイコンまたはカーソルを描画し、そのビットマップを hdc で指定されたデバイスコンテキストにコピーする。hbrFlickerFreeDraw が NULL の場合、システムは直接デバイスコンテキストにアイコンまたはカーソルを描画する。
diFlags : [int] 型: UINT
%inst
指定したデバイスコンテキストにアイコンまたはカーソルを描画し、指定したラスタ演算を行い、指定どおりにアイコンやカーソルを伸縮する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
DrawIconEx 関数はアイコンの左上隅を xLeft および yTop
パラメータで指定された位置に配置する。位置はデバイスコンテキストの現在のマッピングモードに従う。


%index
DrawMenuBar
指定したウィンドウのメニューバーを再描画する。システムがウィンドウを作成した後にメニューバーが変更された場合、変更されたメニューバーを描画するためにこの関数を呼び出さなければならない。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND メニューバーを再描画するウィンドウへのハンドル。
%inst

指定したウィンドウのメニューバーを再描画する。システムがウィンドウを作成した後にメニューバーが変更された場合、変更されたメニューバーを描画するためにこの関数を呼び出さなければならない。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。


%index
DrawStateW
DrawState 関数は、無効状態や既定状態などの状態を示す視覚効果を適用して画像を表示する。(Unicode)
%group
Win32 user32
%prm
hdc, hbrFore, qfnCallBack, lData, wData, x, y, cx, cy, uFlags
hdc : [intptr] 描画先のデバイスコンテキストへのハンドル。
hbrFore : [intptr] fuFlags パラメータで指定された状態が DSS_MONO の場合に、画像の描画に使用するブラシへのハンドル。その他の状態では無視される。
qfnCallBack : [int] 画像の描画に使用するアプリケーション定義のコールバック関数へのポインタ。fuFlags の画像タイプが DST_COMPLEX の場合に必須。画像タイプが DST_TEXT の場合は省略可能で NULL にできる。その他の画像タイプでは無視される。
lData : [intptr] 画像に関する情報。このパラメータの意味は画像タイプに依存する。
wData : [intptr] 画像に関する情報。このパラメータの意味は画像タイプに依存する。ただし、DrawStateProc 関数で使用するためにゼロ拡張される。
x : [int] 画像を描画する水平位置 (デバイス単位)。
y : [int] 画像を描画する垂直位置 (デバイス単位)。
cx : [int] 画像の幅 (デバイス単位)。画像タイプが DST_COMPLEX の場合に必須。それ以外の場合は 0 を指定して画像の幅を計算させることができる。
cy : [int] 画像の高さ (デバイス単位)。画像タイプが DST_COMPLEX の場合に必須。それ以外の場合は 0 を指定して画像の高さを計算させることができる。
uFlags : [int] 画像タイプと状態。このパラメータには次のタイプ値のいずれかを指定できる。
%inst
DrawState 関数は、無効状態や既定状態などの状態を示す視覚効果を適用して画像を表示する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。

[備考]
> [!NOTE] > winuser.h ヘッダーは DrawState を、UNICODE プリプロセッサ定数の定義に基づいて
ANSI または Unicode 版を自動的に選択するエイリアスとして定義する。


%index
DrawTextW
DrawText 関数は指定した矩形に書式設定されたテキストを描画する。指定した方法 (タブ展開、文字配置、改行など) に従ってテキストを書式設定する。(DrawTextW)
%group
Win32 user32
%prm
hdc, lpchText, cchText, lprc, format
hdc : [intptr] デバイスコンテキストへのハンドル。
lpchText : [wstr] 描画するテキストを指定する文字列へのポインタ。nCount パラメータが -1 の場合、文字列は NULL 終端されていなければならない。uFormat に DT_MODIFYSTRING が含まれる場合、関数はこの文字列に最大 4 文字を追加することがある。
cchText : [int] 文字列の長さ (文字数)。nCount が -1 の場合、lpchText パラメータは NULL 終端文字列へのポインタと見なされ、DrawText が文字数を自動計算する。
lprc : [var] テキストを書式設定する矩形を論理座標で含む RECT 構造体へのポインタ。
format : [int] 
%inst
DrawText 関数は指定した矩形に書式設定されたテキストを描画する。指定した方法 (タブ展開、文字配置、改行など)
に従ってテキストを書式設定する。(DrawTextW)

[戻り値]
関数が成功した場合、戻り値は論理単位でのテキストの高さとなる。DT_VCENTER または DT_BOTTOM
が指定されている場合、戻り値は lpRect->top から描画されたテキストの下端までのオフセットとなる。関数が失敗した場合、戻り値は
0 となる。

[備考]
DrawText 関数は、デバイスコンテキストの選択されたフォント、テキスト色、背景色を使ってテキストを描画する。DT_NOCLIP
形式を使用しない限り、DrawText はテキストを指定された矩形の外に現れないようにクリップする。DT_SINGLELINE
形式が指定されない限り、書式設定は複数行を前提とする。選択されたフォントが指定された矩形に対して大きすぎる場合、DrawText
関数は小さなフォントに置き換えようとしない。


%index
DrawTextExW
DrawTextEx 関数は指定した矩形に書式設定されたテキストを描画する。(Unicode)
%group
Win32 user32
%prm
hdc, lpchText, cchText, lprc, format, lpdtp
hdc : [intptr] 描画先のデバイスコンテキストへのハンドル。
lpchText : [wstr] 描画するテキストを含む文字列へのポインタ。cchText パラメータが -1 の場合、文字列は NULL 終端されていなければならない。dwDTFormat に DT_MODIFYSTRING が含まれる場合、関数はこの文字列に最大 4 文字を追加することがある。この文字列を含むバッファはこれらの追加文字を収容するのに十分な大きさであるべきである。
cchText : [int] lpchText が指す文字列の長さ。cchText が -1 の場合、lpchText パラメータは NULL 終端文字列へのポインタと見なされ、DrawTextEx が文字数を自動計算する。
lprc : [var] テキストを書式設定する矩形を論理座標で含む RECT 構造体へのポインタ。
format : [int] 
lpdtp : [var] 追加の書式設定オプションを指定する DRAWTEXTPARAMS 構造体へのポインタ。このパラメータは NULL にできる。
%inst
DrawTextEx 関数は指定した矩形に書式設定されたテキストを描画する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は論理単位でのテキストの高さとなる。DT_VCENTER または DT_BOTTOM
が指定されている場合、戻り値は lprc->top から描画されたテキストの下端までのオフセットとなる。関数が失敗した場合、戻り値は 0
となる。

[備考]
DrawTextEx
関数はエスケープメントおよび向きが共にゼロであるフォントのみサポートする。デバイスコンテキストのテキスト整列モードには
TA_LEFT、TA_TOP、TA_NOUPDATECP フラグが含まれなければならない。


%index
EmptyClipboard
クリップボードを空にし、クリップボード内のデータへのハンドルを解放する。その後、クリップボードの所有権を現在クリップボードを開いているウィンドウに割り当てる。
%group
Win32 user32
%prm

%inst

クリップボードを空にし、クリップボード内のデータへのハンドルを解放する。その後、クリップボードの所有権を現在クリップボードを開いているウィンドウに割り当てる。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
EmptyClipboard を呼び出す前に、アプリケーションは OpenClipboard
関数を使用してクリップボードを開かなければならない。アプリケーションがクリップボードを開くときに NULL
のウィンドウハンドルを指定した場合、EmptyClipboard は成功するがクリップボード所有者を NULL に設定する。これにより
SetClipboardData が失敗することに注意。


%index
EnableMenuItem
指定したメニュー項目を有効化、無効化、またはグレー表示する。
%group
Win32 user32
%prm
hMenu, uIDEnableItem, uEnable
hMenu : [intptr] 型: HMENU メニューへのハンドル。
uIDEnableItem : [int] 型: UINT 有効化、無効化、またはグレー表示するメニュー項目。uEnable パラメータによって決定される。このパラメータはメニューバー、メニュー、またはサブメニュー内の項目を指定する。
uEnable : [int] 型: UINT
%inst
指定したメニュー項目を有効化、無効化、またはグレー表示する。

[戻り値]
型: BOOL 戻り値はメニュー項目の以前の状態 (MF_DISABLED、MF_ENABLED、または MF_GRAYED のいずれか)
を示す。メニュー項目が存在しない場合、戻り値は -1 となる。

[備考]
アプリケーションは正しいメニューハンドルを指定するために MF_BYPOSITION
フラグを使用しなければならない。メニューバーへのメニューハンドルが指定されている場合、トップレベルのメニュー項目 (メニューバー内の項目)
が影響を受ける。ドロップダウンメニューまたはサブメニュー内の項目の状態を位置で設定するには、ドロップダウンメニューまたはサブメニューへのハンドルを指定しなければならない。InsertMenu、InsertMenuItem、LoadMenuIndirect、ModifyMenu、および
SetMenuItemInfo
関数もメニュー項目の状態を設定できる。ウィンドウメニューを変更すると、メニューバーはすぐには更新されない。更新を強制するには
DrawMenuBar を呼び出す。


%index
EnableMouseInPointer
マウスをポインタ入力デバイスとして機能させ、WM_POINTER メッセージを送信できるようにする。
%group
Win32 user32
%prm
fEnable
fEnable : [int] WM_POINTER でのマウス入力サポートを有効にする場合は TRUE。
%inst
マウスをポインタ入力デバイスとして機能させ、WM_POINTER メッセージを送信できるようにする。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
この関数はプロセスのライフタイム内で一度だけ呼び出すことができる。最初の呼び出し以前、Windows ストアアプリは
mouse-in-pointer が有効な状態で実行され、mshtml.dll
を使用するデスクトップアプリケーションも同様である。その他すべてのデスクトップアプリケーションは mouse-in-pointer
が無効な状態で実行される。


%index
EnableNonClientDpiScaling
高 DPI ディスプレイにおいて、指定したトップレベルウィンドウの非クライアント領域部分の自動ディスプレイスケーリングを有効化する。ウィンドウの初期化中に呼び出さなければならない。
%group
Win32 user32
%prm
hwnd
hwnd : [intptr] 非クライアント領域の自動スケーリングを有効にするウィンドウ。
%inst
高 DPI
ディスプレイにおいて、指定したトップレベルウィンドウの非クライアント領域部分の自動ディスプレイスケーリングを有効化する。ウィンドウの初期化中に呼び出さなければならない。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
この関数を呼び出すと、DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE の
DPI_AWARENESS_CONTEXT
を持つ個別のトップレベルウィンドウに対して非クライアントスケーリングが有効になる。プロセス全体が
DPI_AWARENESS_PER_MONITOR_AWARE
モードで実行されている場合にこの関数を呼び出すと、プロセス内のトップレベルウィンドウで非クライアントスケーリングが有効になる。この関数は新しいウィンドウの初期化中の
WM_NCCREATE から呼び出さなければならない。
（以下省略）


%index
EnableScrollBar
EnableScrollBar 関数は、一方または両方のスクロールバーの矢印を有効化または無効化する。
%group
Win32 user32
%prm
hWnd, wSBflags, wArrows
hWnd : [intptr] 型: HWND wSBflags パラメータの値に応じて、ウィンドウまたはスクロールバーコントロールへのハンドル。
wSBflags : [int] 型: UINT
wArrows : [int] 型: UINT
%inst
EnableScrollBar 関数は、一方または両方のスクロールバーの矢印を有効化または無効化する。

[戻り値]
型: BOOL 矢印が指定どおりに有効化または無効化された場合、戻り値は 0
以外となる。矢印が既に要求された状態にある場合またはエラーが発生した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。


%index
EnableWindow
指定したウィンドウまたはコントロールへのマウスおよびキーボード入力を有効化または無効化する。入力が無効化されている場合、ウィンドウはマウスクリックやキー押下などの入力を受け取らない。入力が有効化されている場合、ウィンドウはすべての入力を受け取る。
%group
Win32 user32
%prm
hWnd, bEnable
hWnd : [intptr] 型: HWND 有効化または無効化するウィンドウへのハンドル。
bEnable : [int] 型: BOOL ウィンドウを有効化するか無効化するかを示す。このパラメータが TRUE の場合、ウィンドウは有効化される。FALSE の場合、ウィンドウは無効化される。
%inst

指定したウィンドウまたはコントロールへのマウスおよびキーボード入力を有効化または無効化する。入力が無効化されている場合、ウィンドウはマウスクリックやキー押下などの入力を受け取らない。入力が有効化されている場合、ウィンドウはすべての入力を受け取る。

[戻り値]
型: BOOL ウィンドウが以前無効化されていた場合、戻り値は 0 以外となる。ウィンドウが以前無効化されていなかった場合、戻り値は 0
となる。

[備考]
ウィンドウが無効化される場合、システムは WM_CANCELMODE メッセージを送信する。ウィンドウの有効状態が変化する場合、システムは
WM_CANCELMODE メッセージの後に WM_ENABLE メッセージを送信する (これらのメッセージは EnableWindow
が返る前に送信される)。ウィンドウが既に無効化されている場合、その子ウィンドウは暗黙的に無効化されるが、WM_ENABLE
メッセージは送信されない。ウィンドウはアクティブ化される前に有効化されていなければならない。既定では、ウィンドウは作成時に有効化される。


%index
EndDeferWindowPos
1 回の画面更新サイクルで 1 つ以上のウィンドウの位置とサイズを同時に更新する。
%group
Win32 user32
%prm
hWinPosInfo
hWinPosInfo : [intptr] 型: HDWP 1 つ以上のウィンドウのサイズおよび位置情報を保持する、複数ウィンドウ位置構造体へのハンドル。この内部構造体は BeginDeferWindowPos 関数または直近の DeferWindowPos 関数呼び出しによって返される。
%inst
1 回の画面更新サイクルで 1 つ以上のウィンドウの位置とサイズを同時に更新する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
EndDeferWindowPos 関数は、内部構造体内で指定された各ウィンドウに WM_WINDOWPOSCHANGING および
WM_WINDOWPOSCHANGED メッセージを送信する。


%index
EndDialog
モーダルダイアログボックスを破棄し、システムにダイアログボックスに対するすべての処理を終了させる。
%group
Win32 user32
%prm
hDlg, nResult
hDlg : [intptr] 型: HWND 破棄するダイアログボックスへのハンドル。
nResult : [int] 型: INT_PTR ダイアログボックスを作成した関数からアプリケーションに返す値。
%inst
モーダルダイアログボックスを破棄し、システムにダイアログボックスに対するすべての処理を終了させる。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
DialogBox、DialogBoxParam、DialogBoxIndirect、DialogBoxIndirectParam
関数によって作成されたダイアログボックスは EndDialog
関数を使用して破棄しなければならない。アプリケーションはダイアログボックスプロシージャ内から EndDialog
を呼び出す。関数はその他の目的に使用してはならない。ダイアログボックスプロシージャは WM_INITDIALOG
メッセージの処理中を含め、いつでも EndDialog を呼び出すことができる。EndDialog
はダイアログボックスを直ちに破棄しない。代わりにフラグを設定し、ダイアログボックスプロシージャがシステムに制御を返せるようにする。


%index
EndMenu
呼び出し元スレッドのアクティブメニューを終了する。
%group
Win32 user32
%prm

%inst
呼び出し元スレッドのアクティブメニューを終了する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
プラットフォームが EndMenu をサポートしない場合、アクティブメニューの所有者に WM_CANCELMODE メッセージを送信する。


%index
EndPaint
EndPaint 関数は、指定したウィンドウの描画の終了を示す。この関数は BeginPaint 関数の各呼び出しに対して必要であるが、描画完了後にのみ呼び出す。
%group
Win32 user32
%prm
hWnd, lpPaint
hWnd : [intptr] 再描画されたウィンドウへのハンドル。
lpPaint : [var] BeginPaint で取得した描画情報を含む PAINTSTRUCT 構造体へのポインタ。
%inst
EndPaint 関数は、指定したウィンドウの描画の終了を示す。この関数は BeginPaint
関数の各呼び出しに対して必要であるが、描画完了後にのみ呼び出す。

[戻り値]
戻り値は常に 0 以外となる。

[備考]
BeginPaint によってキャレットが隠されていた場合、EndPaint は画面にキャレットを復元する。EndPaint は
BeginPaint が取得した表示デバイスコンテキストを解放する。


%index
EnumChildWindows
指定した親ウィンドウに属する子ウィンドウを列挙し、各子ウィンドウへのハンドルを順にアプリケーション定義のコールバック関数に渡す。
%group
Win32 user32
%prm
hWndParent, lpEnumFunc, lParam
hWndParent : [intptr] 型: HWND 子ウィンドウを列挙する親ウィンドウへのハンドル。このパラメータが NULL の場合、この関数は EnumWindows と等価である。
lpEnumFunc : [int] 型: WNDENUMPROC アプリケーション定義のコールバック関数へのポインタ。詳細は EnumChildProc を参照。
lParam : [intptr] 型: LPARAM コールバック関数に渡されるアプリケーション定義の値。
%inst
指定した親ウィンドウに属する子ウィンドウを列挙し、各子ウィンドウへのハンドルを順にアプリケーション定義のコールバック関数に渡す。

[戻り値]
型: BOOL 戻り値は使用されない。

[備考]
子ウィンドウが独自の子ウィンドウを作成している場合、EnumChildWindows はそれらのウィンドウも列挙する。列挙処理中に Z
オーダー内で移動または再配置された子ウィンドウは正しく列挙される。関数は列挙される前に破棄された子ウィンドウや、列挙処理中に作成された子ウィンドウは列挙しない。


%index
EnumClipboardFormats
現在クリップボードで利用可能なデータ形式を列挙する。
%group
Win32 user32
%prm
format
format : [int] 型: UINT 利用可能であると分かっているクリップボード形式。クリップボード形式の列挙を開始するには、format を 0 に設定する。format が 0 の場合、関数は最初に利用可能なクリップボード形式を取得する。列挙中の後続の呼び出しでは、format を直前の EnumClipboardFormats 呼び出しの結果に設定する。
%inst
現在クリップボードで利用可能なデータ形式を列挙する。

[戻り値]
型: UINT 関数が成功した場合、戻り値は指定された形式の次のクリップボード形式となる。関数が失敗した場合、戻り値は 0
となる。拡張エラー情報を取得するには GetLastError を呼ぶ。列挙するクリップボード形式がこれ以上ない場合、戻り値は 0
となる。この場合、GetLastError 関数は ERROR_SUCCESS を返す。

[備考]
形式を列挙する前にクリップボードを開く必要がある。クリップボードを開くには OpenClipboard
関数を使用する。クリップボードが開いていない場合、EnumClipboardFormats
関数は失敗する。EnumClipboardFormats 関数は、クリップボードに配置された順序で形式を列挙する。


%index
EnumDesktopWindows
指定したデスクトップに関連付けられたすべてのトップレベルウィンドウを列挙する。各ウィンドウへのハンドルを順にアプリケーション定義のコールバック関数に渡す。
%group
Win32 user32
%prm
hDesktop, lpfn, lParam
hDesktop : [intptr] トップレベルウィンドウを列挙するデスクトップへのハンドル。このハンドルは CreateDesktop、GetThreadDesktop、OpenDesktop、または OpenInputDesktop 関数によって返され、DESKTOP_READOBJECTS アクセス権を持っていなければならない。このパラメータが NULL の場合、現在のデスクトップが使用される。
lpfn : [int] アプリケーション定義の EnumWindowsProc コールバック関数へのポインタ。
lParam : [intptr] コールバック関数に渡されるアプリケーション定義の値。
%inst

指定したデスクトップに関連付けられたすべてのトップレベルウィンドウを列挙する。各ウィンドウへのハンドルを順にアプリケーション定義のコールバック関数に渡す。

[戻り値]
関数が失敗したか列挙を実行できなかった場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼ぶ。コールバック関数が失敗した場合に SetLastError を設定することを保証しなければならない。

[備考]
EnumDesktopWindows 関数は、最後のトップレベルウィンドウが列挙されるか、コールバック関数が FALSE
を返すまで、lpfn コールバック関数を繰り返し呼び出す。


%index
EnumDesktopsW
呼び出し元プロセスの指定したウィンドウステーションに関連付けられたすべてのデスクトップを列挙する。各デスクトップの名前を順にアプリケーション定義のコールバック関数に渡す。(Unicode)
%group
Win32 user32
%prm
hwinsta, lpEnumFunc, lParam
hwinsta : [intptr] デスクトップを列挙するウィンドウステーションへのハンドル。このハンドルは CreateWindowStation、GetProcessWindowStation、または OpenWindowStation 関数によって返され、WINSTA_ENUMDESKTOPS アクセス権を持っていなければならない。このパラメータが NULL の場合、現在のウィンドウステーションが使用される。
lpEnumFunc : [int] アプリケーション定義の EnumDesktopProc コールバック関数へのポインタ。
lParam : [intptr] コールバック関数に渡されるアプリケーション定義の値。
%inst

呼び出し元プロセスの指定したウィンドウステーションに関連付けられたすべてのデスクトップを列挙する。各デスクトップの名前を順にアプリケーション定義のコールバック関数に渡す。(Unicode)

[戻り値]
関数が成功した場合、lpEnumFunc が指すコールバック関数が返した 0 以外の値を返す。関数が列挙を実行できない場合、戻り値は 0
となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
EnumDesktops 関数は、呼び出し元プロセスが DESKTOP_ENUMERATE
アクセス権を持つデスクトップのみを列挙する。EnumDesktops 関数は、最後のデスクトップが列挙されるかコールバック関数が
FALSE を返すまで、lpEnumFunc コールバック関数を繰り返し呼び出す。


%index
EnumDisplayDevicesW
EnumDisplayDevices 関数は、現在のセッション内のディスプレイデバイスに関する情報を取得できるようにする。(Unicode)
%group
Win32 user32
%prm
lpDevice, iDevNum, lpDisplayDevice, dwFlags
lpDevice : [wstr] デバイス名へのポインタ。NULL の場合、関数は iDevNum に基づいてマシン上のディスプレイアダプタに関する情報を返す。
iDevNum : [int] 対象のディスプレイデバイスを指定するインデックス値。オペレーティングシステムは現在のセッション内の各ディスプレイデバイスをインデックス値で識別する。インデックス値は 0 から始まる連続した整数である。
lpDisplayDevice : [var] iDevNum で指定されたディスプレイデバイスに関する情報を受け取る DISPLAY_DEVICE 構造体へのポインタ。EnumDisplayDevices を呼び出す前に、DISPLAY_DEVICE の cb メンバーに DISPLAY_DEVICE のサイズ (バイト単位) を初期化しなければならない。
dwFlags : [int] GUID_DEVINTERFACE_MONITOR のデバイスインターフェイス名を取得するには、このフラグを EDD_GET_DEVICE_INTERFACE_NAME (0x00000001) に設定する。値は lpDisplayDevice に返される DISPLAY_DEVICE 構造体の DeviceID メンバーに格納される。
%inst
EnumDisplayDevices
関数は、現在のセッション内のディスプレイデバイスに関する情報を取得できるようにする。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。iDevNum
が最大デバイスインデックスより大きい場合、関数は失敗する。

[備考]
現在のセッション内のすべてのディスプレイデバイスを照会するには、iDevNum を 0
から始めてループでこの関数を呼び出し、関数が失敗するまで iDevNum
をインクリメントする。デスクトップ内のすべてのディスプレイデバイスを選択するには、DISPLAY_DEVICE 構造体に
DISPLAY_DEVICE_ATTACHED_TO_DESKTOP フラグを持つディスプレイデバイスのみを使用する。


%index
EnumDisplayMonitors
EnumDisplayMonitors 関数は、指定したクリッピング矩形とデバイスコンテキストの可視領域の交差によって形成される領域と交差するディスプレイモニタ (ミラーリングドライバに関連付けられた非表示の疑似モニタを含む) を列挙する。EnumDisplayMonitors は列挙される各モニタに対し、アプリケーション定義の MonitorEnumProc コールバック関数を 1 回呼び出す。
%group
Win32 user32
%prm
hdc, lprcClip, lpfnEnum, dwData
hdc : [intptr] 対象となる可視領域を定義するディスプレイデバイスコンテキストへのハンドル。このパラメータが NULL の場合、コールバック関数に渡される hdcMonitor パラメータは NULL となり、対象の可視領域はデスクトップ上のすべてのディスプレイを含む仮想スクリーンとなる。
lprcClip : [var] クリッピング矩形を指定する RECT 構造体へのポインタ。対象領域は、hdc で指定された可視領域とクリッピング矩形との交差部分となる。hdc が NULL 以外の場合、クリッピング矩形の座標は hdc の原点に対する相対位置である。hdc が NULL の場合、座標は仮想スクリーン座標である。
lpfnEnum : [int] MonitorEnumProc アプリケーション定義のコールバック関数へのポインタ。
dwData : [intptr] EnumDisplayMonitors が MonitorEnumProc 関数に直接渡すアプリケーション定義のデータ。
%inst
EnumDisplayMonitors
関数は、指定したクリッピング矩形とデバイスコンテキストの可視領域の交差によって形成される領域と交差するディスプレイモニタ
(ミラーリングドライバに関連付けられた非表示の疑似モニタを含む) を列挙する。EnumDisplayMonitors
は列挙される各モニタに対し、アプリケーション定義の MonitorEnumProc コールバック関数を 1 回呼び出す。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。

[備考]
EnumDisplayMonitors 関数を呼び出す理由は 2 つある。
（以下省略）


%index
EnumDisplaySettingsW
EnumDisplaySettings 関数は、ディスプレイデバイスのいずれかのグラフィックスモードに関する情報を取得する。ディスプレイデバイスのすべてのグラフィックスモードの情報を取得するには、この関数を連続して呼び出す。(Unicode)
%group
Win32 user32
%prm
lpszDeviceName, iModeNum, lpDevMode
lpszDeviceName : [wstr] 情報を取得するグラフィックスモードが属するディスプレイデバイスを指定する NULL 終端文字列へのポインタ。このパラメータは NULL または EnumDisplayDevices から返された DISPLAY_DEVICE.DeviceName のいずれかである。
iModeNum : [int] 
lpDevMode : [var] 関数が指定したグラフィックスモードに関する情報を格納する DEVMODE 構造体へのポインタ。EnumDisplaySettings を呼び出す前に、dmSize メンバーを sizeof(DEVMODE) に設定し、dmDriverExtra メンバーにプライベートドライバデータを受け取る追加領域のサイズ (バイト単位) を設定する。
%inst
EnumDisplaySettings
関数は、ディスプレイデバイスのいずれかのグラフィックスモードに関する情報を取得する。ディスプレイデバイスのすべてのグラフィックスモードの情報を取得するには、この関数を連続して呼び出す。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。

[備考]
iModeNum がディスプレイデバイスの最後のグラフィックスモードのインデックスより大きい場合、関数は失敗する。DPI 仮想化 この
API は DPI 仮想化に参加しない。


%index
EnumDisplaySettingsExW
EnumDisplaySettingsEx 関数は、ディスプレイデバイスのいずれかのグラフィックスモードに関する情報を取得する。ディスプレイデバイスのすべてのグラフィックスモードの情報を取得するには、この関数を連続して呼び出す。(Unicode)
%group
Win32 user32
%prm
lpszDeviceName, iModeNum, lpDevMode, dwFlags
lpszDeviceName : [wstr] 情報を取得するグラフィックスモードが属するディスプレイデバイスを指定する NULL 終端文字列へのポインタ。このパラメータは NULL または EnumDisplayDevices から返された DISPLAY_DEVICE.DeviceName のいずれかである。NULL 値は呼び出し元スレッドが実行されているコンピュータ上の現在のディスプレイデバイスを指定する。
iModeNum : [int] 
lpDevMode : [var] 関数が指定したグラフィックスモードに関する情報を格納する DEVMODE 構造体へのポインタ。EnumDisplaySettingsEx を呼び出す前に、dmSize メンバーを sizeof(DEVMODE) に設定し、dmDriverExtra メンバーにプライベートドライバデータを受け取る追加領域のサイズ (バイト単位) を設定する。
dwFlags : [int] このパラメータには次の値を指定できる。
%inst
EnumDisplaySettingsEx
関数は、ディスプレイデバイスのいずれかのグラフィックスモードに関する情報を取得する。ディスプレイデバイスのすべてのグラフィックスモードの情報を取得するには、この関数を連続して呼び出す。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。

[備考]
iModeNum がディスプレイデバイスの最後のグラフィックスモードのインデックスより大きい場合、関数は失敗する。iModeNum
パラメータの説明にあるように、この動作を利用してディスプレイデバイスのすべてのグラフィックスモードを列挙できる。DPI 仮想化 この
API は DPI 仮想化に参加しない。


%index
EnumPropsW
ウィンドウのプロパティリスト内のすべてのエントリを指定したコールバック関数に 1 つずつ渡して列挙する。EnumProps は最後のエントリが列挙されるかコールバック関数が FALSE を返すまで継続する。(Unicode)
%group
Win32 user32
%prm
hWnd, lpEnumFunc
hWnd : [intptr] 型: HWND プロパティリストを列挙するウィンドウへのハンドル。
lpEnumFunc : [int] 型: PROPENUMPROC コールバック関数へのポインタ。詳細は PropEnumProc 関数を参照。
%inst
ウィンドウのプロパティリスト内のすべてのエントリを指定したコールバック関数に 1 つずつ渡して列挙する。EnumProps
は最後のエントリが列挙されるかコールバック関数が FALSE を返すまで継続する。(Unicode)

[戻り値]
型: int 戻り値はコールバック関数が返した最後の値を示す。列挙するプロパティが見つからなかった場合は -1 となる。

[備考]

アプリケーションは自身が追加したプロパティのみを削除できる。他のアプリケーションまたはシステム自体が追加したプロパティを削除してはならない。


%index
EnumPropsExW
ウィンドウのプロパティリスト内のすべてのエントリを指定したコールバック関数に 1 つずつ渡して列挙する。EnumPropsEx は最後のエントリが列挙されるかコールバック関数が FALSE を返すまで継続する。(Unicode)
%group
Win32 user32
%prm
hWnd, lpEnumFunc, lParam
hWnd : [intptr] 型: HWND プロパティリストを列挙するウィンドウへのハンドル。
lpEnumFunc : [int] 型: PROPENUMPROCEX コールバック関数へのポインタ。詳細は PropEnumProcEx 関数を参照。
lParam : [intptr] 型: LPARAM コールバック関数に渡されるアプリケーション定義のデータ。
%inst
ウィンドウのプロパティリスト内のすべてのエントリを指定したコールバック関数に 1 つずつ渡して列挙する。EnumPropsEx
は最後のエントリが列挙されるかコールバック関数が FALSE を返すまで継続する。(Unicode)

[戻り値]
型: int 戻り値はコールバック関数が返した最後の値を示す。列挙するプロパティが見つからなかった場合は -1 となる。

[備考]

アプリケーションは自身が追加したプロパティのみを削除できる。他のアプリケーションまたはシステム自体が追加したプロパティを削除してはならない。


%index
EnumThreadWindows
スレッドに関連付けられたすべての非子ウィンドウを列挙し、各ウィンドウへのハンドルを順にアプリケーション定義のコールバック関数に渡す。
%group
Win32 user32
%prm
dwThreadId, lpfn, lParam
dwThreadId : [int] 型: DWORD ウィンドウを列挙するスレッドの識別子。
lpfn : [int] 型: WNDENUMPROC アプリケーション定義のコールバック関数へのポインタ。詳細は EnumThreadWndProc を参照。
lParam : [intptr] 型: LPARAM コールバック関数に渡されるアプリケーション定義の値。
%inst
スレッドに関連付けられたすべての非子ウィンドウを列挙し、各ウィンドウへのハンドルを順にアプリケーション定義のコールバック関数に渡す。

[戻り値]
型: BOOL dwThreadId で指定したスレッド内のすべてのウィンドウに対してコールバック関数が TRUE を返した場合、戻り値は
TRUE となる。コールバック関数が列挙されたウィンドウのいずれかで FALSE を返した場合、または dwThreadId
で指定したスレッドにウィンドウが見つからない場合、戻り値は FALSE となる。


%index
EnumWindowStationsW
現在のセッション内のすべてのウィンドウステーションを列挙する。各ウィンドウステーションの名前を順にアプリケーション定義のコールバック関数に渡す。(Unicode)
%group
Win32 user32
%prm
lpEnumFunc, lParam
lpEnumFunc : [int] アプリケーション定義の EnumWindowStationProc コールバック関数へのポインタ。
lParam : [intptr] コールバック関数に渡されるアプリケーション定義の値。
%inst

現在のセッション内のすべてのウィンドウステーションを列挙する。各ウィンドウステーションの名前を順にアプリケーション定義のコールバック関数に渡す。(Unicode)

[戻り値]
関数が成功した場合、lpEnumFunc が指すコールバック関数が返した 0 以外の値を返す。関数が列挙を実行できない場合、戻り値は 0
となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
EnumWindowStations 関数は、呼び出し元プロセスが WINSTA_ENUMERATE
アクセス権を持つウィンドウステーションのみを列挙する。EnumWindowStations
は、最後のウィンドウステーションが列挙されるかコールバック関数が FALSE を返すまで、lpEnumFunc
コールバック関数を繰り返し呼び出す。


%index
EnumWindows
画面上のすべてのトップレベルウィンドウを列挙し、各ウィンドウへのハンドルを順にアプリケーション定義のコールバック関数に渡す。EnumWindows は最後のトップレベルウィンドウが列挙されるかコールバック関数が FALSE を返すまで継続する。
%group
Win32 user32
%prm
lpEnumFunc, lParam
lpEnumFunc : [int] 型: WNDENUMPROC アプリケーション定義のコールバック関数へのポインタ。詳細は EnumWindowsProc を参照。
lParam : [intptr] 型: LPARAM コールバック関数に渡されるアプリケーション定義の値。
%inst

画面上のすべてのトップレベルウィンドウを列挙し、各ウィンドウへのハンドルを順にアプリケーション定義のコールバック関数に渡す。EnumWindows
は最後のトップレベルウィンドウが列挙されるかコールバック関数が FALSE を返すまで継続する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。EnumWindowsProc が 0 を返した場合、戻り値も 0 となる。

[備考]
EnumWindows 関数は、WS_CHILD
スタイルを持つシステム所有のいくつかのトップレベルウィンドウを除き、子ウィンドウを列挙しない。この関数は GetWindow
関数をループで呼び出すよりも信頼性が高い。注意 Windows 8 以降、EnumWindows
はデスクトップアプリのトップレベルウィンドウのみを列挙する。


%index
EqualRect
EqualRect 関数は、左上隅と右下隅の座標を比較することによって、指定した 2 つの矩形が等しいかどうかを判定する。
%group
Win32 user32
%prm
lprc1, lprc2
lprc1 : [var] 1 つ目の矩形の論理座標を含む RECT 構造体へのポインタ。
lprc2 : [var] 2 つ目の矩形の論理座標を含む RECT 構造体へのポインタ。
%inst
EqualRect 関数は、左上隅と右下隅の座標を比較することによって、指定した 2 つの矩形が等しいかどうかを判定する。

[戻り値]
2 つの矩形が同一の場合、戻り値は 0 以外となる。2 つの矩形が同一でない場合、戻り値は 0 となる。

[備考]
EqualRect
関数は、座標が異なる空の矩形を等しいものとしては扱わない。アプリケーションは矩形をさまざまな目的に使用できるため、矩形関数は明示的な測定単位を使用しない。すべての矩形座標および寸法は符号付き論理値で指定される。


%index
EvaluateProximityToPolygon
タッチ接触領域と交差する他のすべてのポリゴンと比較した、ポリゴンの可能性のあるタッチターゲットとしてのスコアおよびポリゴン内の調整されたタッチポイントを返す。
%group
Win32 user32
%prm
numVertices, controlPolygon, pHitTestingInput, pProximityEval
numVertices : [int] ポリゴンの頂点数。この値は 3 以上でなければならない。
controlPolygon : [var] UI 要素の形状を定義する x-y スクリーン座標の配列。numVertices パラメータで座標数を指定する。
pHitTestingInput : [var] タッチ接触領域のデータを保持する TOUCH_HIT_TESTING_INPUT 構造体。
pProximityEval : [var] スコアおよび調整されたタッチポイントデータを保持する TOUCH_HIT_TESTING_PROXIMITY_EVALUATION 構造体。
%inst

タッチ接触領域と交差する他のすべてのポリゴンと比較した、ポリゴンの可能性のあるタッチターゲットとしてのスコアおよびポリゴン内の調整されたタッチポイントを返す。

[戻り値]
関数が成功した場合、TRUE を返す。それ以外の場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
関数を呼ぶ。

[備考]
Windows との整合性のため、WM_TOUCHHITTESTING
を処理するフレームワークはターゲット決定に次の原則を使用すべきである。
（以下省略）


%index
EvaluateProximityToRect
タッチ接触領域と交差する他のすべての矩形と比較した、矩形の可能性のあるタッチターゲットとしてのスコアおよび矩形内の調整されたタッチポイントを返す。
%group
Win32 user32
%prm
controlBoundingBox, pHitTestingInput, pProximityEval
controlBoundingBox : [var] UI 要素の境界ボックスを定義する RECT 構造体。
pHitTestingInput : [var] タッチ接触領域のデータを保持する TOUCH_HIT_TESTING_INPUT 構造体。
pProximityEval : [var] スコアおよび調整されたタッチポイントデータを保持する TOUCH_HIT_TESTING_PROXIMITY_EVALUATION 構造体。
%inst

タッチ接触領域と交差する他のすべての矩形と比較した、矩形の可能性のあるタッチターゲットとしてのスコアおよび矩形内の調整されたタッチポイントを返す。

[戻り値]
関数が成功した場合、TRUE を返す。それ以外の場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
関数を呼ぶ。

[備考]
Windows との整合性のため、WM_TOUCHHITTESTING
を処理するフレームワークはターゲット決定に次の原則を使用すべきである。
（以下省略）


%index
ExcludeUpdateRgn
ExcludeUpdateRgn 関数は、ウィンドウの更新領域をクリッピング領域から除外することで、ウィンドウの無効領域内での描画を防ぐ。
%group
Win32 user32
%prm
hDC, hWnd
hDC : [intptr] クリッピング領域に関連付けられたデバイスコンテキストへのハンドル。
hWnd : [intptr] 更新するウィンドウへのハンドル。
%inst
ExcludeUpdateRgn 関数は、ウィンドウの更新領域をクリッピング領域から除外することで、ウィンドウの無効領域内での描画を防ぐ。

[戻り値]
戻り値は除外された領域の複雑さを示す。次のいずれかの値となる。
（以下省略）


%index
ExitWindowsEx
対話的ユーザをログオフするか、システムをシャットダウンするか、システムをシャットダウンして再起動する。
%group
Win32 user32
%prm
uFlags, dwReason
uFlags : [int] 
dwReason : [int] シャットダウンを開始する理由。このパラメータはシステムシャットダウン理由コードのいずれかでなければならない。このパラメータが 0 の場合、SHTDN_REASON_FLAG_PLANNED 理由コードは設定されないため、既定の動作は「この理由のタイトルは見つかりませんでした」としてログに記録される未定義のシャットダウンとなる。
%inst
対話的ユーザをログオフするか、システムをシャットダウンするか、システムをシャットダウンして再起動する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数は非同期に実行されるため、0
以外の戻り値はシャットダウンが開始されたことを示す。シャットダウンが成功するかどうかを示すものではない。関数が失敗した場合、戻り値は 0
となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
ExitWindowsEx
関数はシャットダウン処理を開始するとすぐに返る。シャットダウンまたはログオフはその後非同期に進行する。この関数は呼び出し元のログオンセッション内のすべてのプロセスを停止するように設計されている。


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
FindWindowW
クラス名およびウィンドウ名が指定した文字列と一致するトップレベルウィンドウへのハンドルを取得する。この関数は子ウィンドウを検索しない。大文字小文字を区別しない検索を行う。(Unicode)
%group
Win32 user32
%prm
lpClassName, lpWindowName
lpClassName : [wstr] 型: LPCTSTR クラス名または直前の RegisterClass や RegisterClassEx 関数の呼び出しで作成されたクラスアトム。アトムは lpClassName の下位ワードになければならず、上位ワードは 0 でなければならない。lpClassName が NULL の場合、lpWindowName パラメータと一致するタイトルを持つウィンドウを探す。
lpWindowName : [wstr] 型: LPCTSTR ウィンドウ名 (ウィンドウのタイトル)。このパラメータが NULL の場合、すべてのウィンドウ名が一致する。
%inst

クラス名およびウィンドウ名が指定した文字列と一致するトップレベルウィンドウへのハンドルを取得する。この関数は子ウィンドウを検索しない。大文字小文字を区別しない検索を行う。(Unicode)

[戻り値]
型: HWND
関数が成功した場合、戻り値は指定したクラス名およびウィンドウ名を持つウィンドウへのハンドルとなる。関数が失敗した場合、戻り値は NULL
となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
lpWindowName パラメータが NULL でない場合、FindWindow は GetWindowText
関数を呼び出して比較用にウィンドウ名を取得する。


%index
FindWindowExW
クラス名およびウィンドウ名が指定した文字列と一致するウィンドウへのハンドルを取得する。関数は指定した子ウィンドウの次のウィンドウから子ウィンドウを検索する。この関数は大文字小文字を区別しない検索を行う。(Unicode)
%group
Win32 user32
%prm
hWndParent, hWndChildAfter, lpszClass, lpszWindow
hWndParent : [intptr] 型: HWND 子ウィンドウを検索する親ウィンドウへのハンドル。hwndParent が NULL の場合、関数はデスクトップウィンドウを親ウィンドウとして使用する。hwndParent が HWND_MESSAGE の場合、関数はすべてのメッセージ専用ウィンドウを検索する。
hWndChildAfter : [intptr] 型: HWND 子ウィンドウへのハンドル。検索は Z オーダー内の次の子ウィンドウから開始される。子ウィンドウは hwndParent の直接の子ウィンドウでなければならず、単なる子孫ウィンドウではない。hwndChildAfter が NULL の場合、検索は hwndParent の最初の子ウィンドウから開始される。hwndParent と hwndChildAfter の両方が NULL の場合、関数はすべてのトップレベルおよびメッセージ専用ウィンドウを検索する。
lpszClass : [wstr] 型: LPCTSTR クラス名または直前の RegisterClass や RegisterClassEx 関数の呼び出しで作成されたクラスアトム。アトムは lpszClass の下位ワードに配置しなければならず、上位ワードは 0 でなければならない。
lpszWindow : [wstr] 型: LPCTSTR ウィンドウ名 (ウィンドウのタイトル)。このパラメータが NULL の場合、すべてのウィンドウ名が一致する。
%inst

クラス名およびウィンドウ名が指定した文字列と一致するウィンドウへのハンドルを取得する。関数は指定した子ウィンドウの次のウィンドウから子ウィンドウを検索する。この関数は大文字小文字を区別しない検索を行う。(Unicode)

[戻り値]
型: HWND
関数が成功した場合、戻り値は指定したクラス名およびウィンドウ名を持つウィンドウへのハンドルとなる。関数が失敗した場合、戻り値は NULL
となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
FindWindowEx 関数は直接の子ウィンドウのみを検索する。他の子孫は検索しない。lpszWindow パラメータが NULL
でない場合、FindWindowEx は GetWindowText 関数を呼び出して比較用にウィンドウ名を取得する。


%index
FlashWindow
指定したウィンドウを 1 回フラッシュする。ウィンドウのアクティブ状態は変更しない。
%group
Win32 user32
%prm
hWnd, bInvert
hWnd : [intptr] フラッシュさせるウィンドウへのハンドル。ウィンドウは開いているか最小化されていてもよい。
bInvert : [int] このパラメータが TRUE の場合、ウィンドウはある状態から別の状態へフラッシュされる。FALSE の場合、ウィンドウは元の状態 (アクティブまたは非アクティブ) に戻される。
%inst
指定したウィンドウを 1 回フラッシュする。ウィンドウのアクティブ状態は変更しない。

[戻り値]
戻り値は FlashWindow
関数の呼び出し前のウィンドウの状態を示す。呼び出し前にウィンドウキャプションがアクティブとして描画されていた場合、戻り値は 0
以外となる。それ以外の場合、戻り値は 0 となる。

[備考]
ウィンドウをフラッシュするとは、ウィンドウが非アクティブからアクティブ状態 (またはその逆)
に変化するかのようにキャプションバーの外観を変えることを意味する。通常、ウィンドウは現在キーボードフォーカスを持っていないがユーザの注意が必要であることを知らせるためにフラッシュされる。FlashWindow
関数はウィンドウを 1 回だけフラッシュする。繰り返しフラッシュさせるには、アプリケーションはシステムタイマーを作成すべきである。


%index
FlashWindowEx
指定したウィンドウをフラッシュする。ウィンドウのアクティブ状態は変更しない。
%group
Win32 user32
%prm
pfwi
pfwi : [var] FLASHWINFO 構造体へのポインタ。
%inst
指定したウィンドウをフラッシュする。ウィンドウのアクティブ状態は変更しない。

[戻り値]
戻り値は FlashWindowEx
関数の呼び出し前のウィンドウの状態を示す。呼び出し前にウィンドウキャプションがアクティブとして描画されていた場合、戻り値は 0
以外となる。それ以外の場合、戻り値は 0 となる。

[備考]

通常、ウィンドウは現在キーボードフォーカスを持っていないがユーザの注意が必要であることを知らせるためにフラッシュされる。ウィンドウがフラッシュすると、非アクティブからアクティブ状態に変化するように見える。


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
FreeDDElParam
ポストされた動的データ交換 (DDE) メッセージの lParam パラメータで指定されたメモリを解放する。ポストされた DDE メッセージを受信したアプリケーションは、UnpackDDElParam 関数を使用して lParam 値を展開した後にこの関数を呼び出すべきである。
%group
Win32 user32
%prm
msg, lParam
msg : [int] 型: UINT ポストされた DDE メッセージ。
lParam : [intptr] 型: LPARAM ポストされた DDE メッセージの lParam パラメータ。
%inst
ポストされた動的データ交換 (DDE) メッセージの lParam パラメータで指定されたメモリを解放する。ポストされた DDE
メッセージを受信したアプリケーションは、UnpackDDElParam 関数を使用して lParam
値を展開した後にこの関数を呼び出すべきである。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。

[備考]
アプリケーションはポストされた DDE メッセージに対してのみこの関数を呼び出すべきである。この関数は lParam
パラメータで指定されたメモリを解放する。lParam の内容は解放しない。


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
GetAltTabInfoW
指定したウィンドウがアプリケーション切り替え (ALT+TAB) ウィンドウである場合、その状態情報を取得する。(Unicode)
%group
Win32 user32
%prm
hwnd, iItem, pati, pszItemText, cchItemText
hwnd : [intptr] 型: HWND 状態情報を取得するウィンドウへのハンドル。このウィンドウはアプリケーション切り替えウィンドウでなければならない。
iItem : [int] 型: int アプリケーション切り替えウィンドウ内のアイコンのインデックス。pszItemText パラメータが NULL でない場合、項目の名前が pszItemText 文字列にコピーされる。このパラメータが -1 の場合、項目の名前はコピーされない。
pati : [var] 型: PALTTABINFO 状態情報を受け取る ALTTABINFO 構造体へのポインタ。この関数を呼び出す前に csSize メンバーを sizeof(ALTTABINFO) に設定しなければならないことに注意。
pszItemText : [wstr] 型: LPTSTR 項目の名前。このパラメータが NULL の場合、項目の名前はコピーされない。
cchItemText : [int] 型: UINT pszItemText バッファのサイズ (文字数)。
%inst
指定したウィンドウがアプリケーション切り替え (ALT+TAB) ウィンドウである場合、その状態情報を取得する。(Unicode)

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]

アプリケーション切り替えウィンドウを使うと、直近で使用されたアプリケーションウィンドウに切り替えることができる。アプリケーション切り替えウィンドウを表示するには
ALT+TAB を押す。


%index
GetAncestor
指定したウィンドウの祖先へのハンドルを取得する。
%group
Win32 user32
%prm
hwnd, gaFlags
hwnd : [intptr] 型: HWND 祖先を取得するウィンドウへのハンドル。このパラメータがデスクトップウィンドウである場合、関数は NULL を返す。
gaFlags : [int] 型: UINT
%inst
指定したウィンドウの祖先へのハンドルを取得する。

[戻り値]
型: HWND 戻り値は祖先ウィンドウへのハンドルとなる。


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
GetAutoRotationState
システムの画面自動回転の状態 (自動回転がサポートされているか、ユーザによって有効になっているかなど) を含む AR_STATE 値を取得する。
%group
Win32 user32
%prm
pState
pState : [var] システムの自動回転の現在の状態を受け取るメモリ上の位置へのポインタ。
%inst
システムの画面自動回転の状態 (自動回転がサポートされているか、ユーザによって有効になっているかなど) を含む AR_STATE
値を取得する。

[戻り値]
メソッドが成功した場合は TRUE、それ以外の場合は FALSE。


%index
GetAwarenessFromDpiAwarenessContext
DPI_AWARENESS_CONTEXT から DPI_AWARENESS 値を取得する。
%group
Win32 user32
%prm
value
value : [intptr] 調査する DPI_AWARENESS_CONTEXT。
%inst
DPI_AWARENESS_CONTEXT から DPI_AWARENESS 値を取得する。

[戻り値]
DPI_AWARENESS。指定された値が NULL または無効な場合、このメソッドは DPI_AWARENESS_INVALID
を返す。

[備考]
DPI_AWARENESS_CONTEXT には複数の情報が含まれる。例えば、現在および継承された DPI_AWARENESS
の両方が含まれる。このメソッドは構造体から DPI_AWARENESS を取得する。


%index
GetCIMSSM
入力メッセージのソースを取得する (GetCurrentInputMessageSourceInSendMessage)。
%group
Win32 user32
%prm
inputMessageSource
inputMessageSource : [var] 入力メッセージソースのデバイスタイプおよび ID を保持する INPUT_MESSAGE_SOURCE 構造体。
%inst
入力メッセージのソースを取得する (GetCurrentInputMessageSourceInSendMessage)。

[戻り値]
関数が成功した場合、TRUE を返す。それ以外の場合は ERROR_INVALID_PARAMETER を返す。
（以下省略）

[備考]
GetCIMSSM は、GetCurrentInputMessageSource が IMDT_UNAVAILABLE
のデバイスタイプを返す場合にのみ使用すべきである。


%index
GetCapture
マウスをキャプチャしているウィンドウ (存在する場合) へのハンドルを取得する。一度に 1 つのウィンドウのみがマウスをキャプチャできる。このウィンドウはカーソルが境界内にあるかどうかに関わらずマウス入力を受信する。
%group
Win32 user32
%prm

%inst
マウスをキャプチャしているウィンドウ (存在する場合) へのハンドルを取得する。一度に 1
つのウィンドウのみがマウスをキャプチャできる。このウィンドウはカーソルが境界内にあるかどうかに関わらずマウス入力を受信する。

[戻り値]
型: HWND
戻り値は現在のスレッドに関連付けられたキャプチャウィンドウへのハンドルとなる。スレッド内のウィンドウがマウスをキャプチャしていない場合、戻り値は
NULL となる。

[備考]
戻り値が NULL
の場合、現在のスレッドはマウスをキャプチャしていないことを意味する。ただし、別のスレッドまたはプロセスがマウスをキャプチャしている可能性がある。別のスレッドのキャプチャウィンドウへのハンドルを取得するには
GetGUIThreadInfo 関数を使用する。


%index
GetCaretBlinkTime
キャレットのピクセルを反転するのに必要な時間を取得する。この値はユーザが設定できる。
%group
Win32 user32
%prm

%inst
キャレットのピクセルを反転するのに必要な時間を取得する。この値はユーザが設定できる。

[戻り値]
型: UINT 関数が成功した場合、戻り値は点滅時間 (ミリ秒単位) となる。
戻り値が INFINITE の場合、キャレットが点滅していないことを示す。戻り値が 0
の場合、関数が失敗したことを示す。拡張エラー情報を取得するには GetLastError を呼ぶ。


%index
GetCaretPos
キャレットの位置を指定した POINT 構造体にコピーする。
%group
Win32 user32
%prm
lpPoint
lpPoint : [var] 型: LPPOINT キャレットのクライアント座標を受け取る POINT 構造体へのポインタ。
%inst
キャレットの位置を指定した POINT 構造体にコピーする。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外となる。
関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
キャレットの位置は常に、キャレットを含むウィンドウのクライアント座標で与えられる。DPI 仮想化 この API は DPI
仮想化に参加しない。


%index
GetClassInfoW
ウィンドウクラスに関する情報を取得する。(Unicode)
%group
Win32 user32
%prm
hInstance, lpClassName, lpWndClass
hInstance : [intptr] 型: HINSTANCE クラスを作成したアプリケーションのインスタンスへのハンドル。システムが定義するクラス (ボタンやリストボックスなど) に関する情報を取得するには、このパラメータを NULL に設定する。
lpClassName : [wstr] 型: LPCTSTR クラス名。名前は事前登録済みクラスか、直前の RegisterClass または RegisterClassEx 関数の呼び出しで登録されたクラスのものでなければならない。
lpWndClass : [var] 型: LPWNDCLASS クラスに関する情報を受け取る WNDCLASS 構造体へのポインタ。
%inst
ウィンドウクラスに関する情報を取得する。(Unicode)

[戻り値]
型: BOOL 関数が一致するクラスを見つけてデータを正常にコピーした場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0
となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
> [!NOTE] > winuser.h ヘッダーは GetClassInfo を、UNICODE プリプロセッサ定数の定義に基づいて
ANSI または Unicode 版を自動的に選択するエイリアスとして定義する。


%index
GetClassInfoExW
ウィンドウクラスに関する情報を取得する。ウィンドウクラスに関連付けられた小さなアイコンへのハンドルも含む。GetClassInfo 関数は小さなアイコンへのハンドルを取得しない。(Unicode)
%group
Win32 user32
%prm
hInstance, lpszClass, lpwcx
hInstance : [intptr] 型: HINSTANCE クラスを作成したアプリケーションのインスタンスへのハンドル。システムが定義するクラス (ボタンやリストボックスなど) に関する情報を取得するには、このパラメータを NULL に設定する。
lpszClass : [wstr] 型: LPCTSTR クラス名。名前は事前登録済みクラスか、直前の RegisterClass または RegisterClassEx 関数の呼び出しで登録されたクラスのものでなければならない。
lpwcx : [var] 型: LPWNDCLASSEX クラスに関する情報を受け取る WNDCLASSEX 構造体へのポインタ。
%inst
ウィンドウクラスに関する情報を取得する。ウィンドウクラスに関連付けられた小さなアイコンへのハンドルも含む。GetClassInfo
関数は小さなアイコンへのハンドルを取得しない。(Unicode)

[戻り値]
型: BOOL 関数が一致するクラスを見つけてデータを正常にコピーした場合、戻り値は 0
以外となる。関数が一致するクラスを見つけられずデータのコピーに失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
クラスアトムは RegisterClass または RegisterClassEx 関数を使用して作成され、GlobalAddAtom
関数では作成されない。


%index
GetClassLongW
指定したウィンドウに関連付けられた WNDCLASSEX 構造体から、指定した 32 ビット (DWORD) 値を取得する。(Unicode)
%group
Win32 user32
%prm
hWnd, nIndex
hWnd : [intptr] 型: HWND ウィンドウへのハンドル、および間接的にそのウィンドウが属するクラスへのハンドル。
nIndex : [int] 型: int
%inst
指定したウィンドウに関連付けられた WNDCLASSEX 構造体から、指定した 32 ビット (DWORD)
値を取得する。(Unicode)

[戻り値]
型: DWORD 関数が成功した場合、戻り値は要求された値となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
クラスの追加メモリを予約するには、RegisterClassEx 関数で使用する WNDCLASSEX 構造体の cbClsExtra
メンバーに 0 以外の値を指定する。


%index
GetClassNameW
指定したウィンドウが属するクラスの名前を取得する。(GetClassNameW)
%group
Win32 user32
%prm
hWnd, lpClassName, nMaxCount
hWnd : [intptr] 型: HWND ウィンドウへのハンドル、および間接的にそのウィンドウが属するクラスへのハンドル。
lpClassName : [wstr] 型: LPTSTR クラス名文字列。
nMaxCount : [int] 型: int lpClassName バッファの長さ (文字数)。バッファは終端 NULL 文字を含めるのに十分な大きさでなければならない。そうでない場合、クラス名文字列は nMaxCount-1 文字に切り詰められる。
%inst
指定したウィンドウが属するクラスの名前を取得する。(GetClassNameW)

[戻り値]
型: int 関数が成功した場合、戻り値は終端 NULL 文字を含まない、バッファにコピーされた文字数となる。関数が失敗した場合、戻り値は
0 となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
> [!NOTE] > winuser.h ヘッダーは GetClassName を、UNICODE プリプロセッサ定数の定義に基づいて
ANSI または Unicode 版を自動的に選択するエイリアスとして定義する。


%index
GetClassWord
指定したウィンドウが属するウィンドウクラスの追加クラスメモリ内の指定したオフセットにある 16 ビット (WORD) 値を取得する。
%group
Win32 user32
%prm
hWnd, nIndex
hWnd : [intptr] 型: HWND ウィンドウへのハンドル、および間接的にそのウィンドウが属するクラスへのハンドル。
nIndex : [int] 型: int 取得する値の 0 から始まるバイトオフセット。有効な値は 0 からクラスメモリのバイト数から 2 を引いた範囲である。
%inst
指定したウィンドウが属するウィンドウクラスの追加クラスメモリ内の指定したオフセットにある 16 ビット (WORD) 値を取得する。

[戻り値]
型: WORD 関数が成功した場合、戻り値は要求された 16 ビット値となる。関数が失敗した場合、戻り値は 0
となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
クラスの追加メモリを予約するには、RegisterClass 関数で使用する WNDCLASS 構造体の cbClsExtra メンバーに
0 以外の値を指定する。


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
GetClipCursor
カーソルが制限されている矩形領域のスクリーン座標を取得する。
%group
Win32 user32
%prm
lpRect
lpRect : [var] 型: LPRECT 制限矩形のスクリーン座標を受け取る RECT 構造体へのポインタ。カーソルが矩形に制限されていない場合、構造体は画面の寸法を受け取る。
%inst
カーソルが制限されている矩形領域のスクリーン座標を取得する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
カーソルは共有リソースである。アプリケーションが ClipCursor 関数でカーソルを制限した場合、別のアプリケーションに制御を譲る前に
ClipCursor を使って後でカーソルを解放しなければならない。呼び出し元プロセスはウィンドウステーションへの
WINSTA_READATTRIBUTES アクセス権を持っていなければならない。


%index
GetClipboardData
指定した形式でクリップボードからデータを取得する。クリップボードは事前に開かれていなければならない。
%group
Win32 user32
%prm
uFormat
uFormat : [int] 型: UINT クリップボード形式。標準クリップボード形式の説明については「Standard Clipboard Formats」を参照。
%inst
指定した形式でクリップボードからデータを取得する。クリップボードは事前に開かれていなければならない。

[戻り値]
型: HANDLE 関数が成功した場合、戻り値は指定した形式のクリップボードオブジェクトへのハンドルとなる。関数が失敗した場合、戻り値は
NULL となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
注意 クリップボードのデータは信頼されない。アプリケーションで使用する前に慎重にパースすること。アプリケーションは事前に
EnumClipboardFormats 関数を使って利用可能な形式を列挙できる。GetClipboardData
関数が返すハンドルはアプリケーションではなくクリップボードが制御する。アプリケーションはデータを直ちにコピーすべきである。


%index
GetClipboardFormatNameW
クリップボードから、指定した登録済み形式の名前を取得する。関数は名前を指定したバッファにコピーする。(Unicode)
%group
Win32 user32
%prm
format, lpszFormatName, cchMaxCount
format : [int] 型: UINT 取得する形式のタイプ。このパラメータに事前定義済みのクリップボード形式を指定してはならない。
lpszFormatName : [wstr] 型: LPTSTR 形式名を受け取るバッファ。
cchMaxCount : [int] 型: int バッファにコピーされる文字列の最大長 (文字数)。名前がこの制限を超える場合、切り詰められる。
%inst
クリップボードから、指定した登録済み形式の名前を取得する。関数は名前を指定したバッファにコピーする。(Unicode)

[戻り値]
型: int 関数が成功した場合、戻り値はバッファにコピーされた文字列の長さ (文字数) となる。関数が失敗した場合、戻り値は 0
となり、要求された形式が存在しないか事前定義済みであることを示す。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
セキュリティ上の考慮事項 この関数を誤って使用するとプログラムのセキュリティを損なう可能性がある。


%index
GetClipboardOwner
クリップボードの現在の所有者のウィンドウハンドルを取得する。
%group
Win32 user32
%prm

%inst
クリップボードの現在の所有者のウィンドウハンドルを取得する。

[戻り値]
型: HWND
関数が成功した場合、戻り値はクリップボードを所有するウィンドウへのハンドルとなる。クリップボードが所有されていない場合、戻り値は NULL
となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]

クリップボードが現在所有されていない場合でも、クリップボードはデータを保持している可能性がある。一般に、クリップボードの所有者は最後にクリップボードにデータを配置したウィンドウである。EmptyClipboard
関数がクリップボードの所有権を割り当てる。


%index
GetClipboardSequenceNumber
現在のウィンドウステーションのクリップボードシーケンス番号を取得する。
%group
Win32 user32
%prm

%inst
現在のウィンドウステーションのクリップボードシーケンス番号を取得する。

[戻り値]
型: DWORD 戻り値はクリップボードのシーケンス番号である。ウィンドウステーションに対する
WINSTA_ACCESSCLIPBOARD アクセス権を持たない場合、関数は 0 を返す。

[備考]

システムは各ウィンドウステーションに対してクリップボードのシリアル番号を保持する。クリップボードの内容が変更されるかクリップボードが空にされるたびに、この番号はインクリメントされる。この値を追跡することで、クリップボードの内容が変更されたかどうかを判定できる。


%index
GetClipboardViewer
クリップボードビューアチェーン内の最初のウィンドウへのハンドルを取得する。
%group
Win32 user32
%prm

%inst
クリップボードビューアチェーン内の最初のウィンドウへのハンドルを取得する。

[戻り値]
型: HWND
関数が成功した場合、戻り値はクリップボードビューアチェーン内の最初のウィンドウへのハンドルとなる。クリップボードビューアがない場合、戻り値は
NULL となる。拡張エラー情報を取得するには GetLastError を呼ぶ。


%index
GetComboBoxInfo
指定したコンボボックスに関する情報を取得する。
%group
Win32 user32
%prm
hwndCombo, pcbi
hwndCombo : [intptr] 型: HWND コンボボックスへのハンドル。
pcbi : [var] 型: PCOMBOBOXINFO 情報を受け取る COMBOBOXINFO 構造体へのポインタ。この関数を呼び出す前に COMBOBOXINFO.cbSize を設定しなければならない。
%inst
指定したコンボボックスに関する情報を取得する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
CB_GETCOMBOBOXINFO メッセージはこの関数と等価である。


%index
GetCurrentInputMessageSource
入力メッセージのソースを取得する。
%group
Win32 user32
%prm
inputMessageSource
inputMessageSource : [var] 入力メッセージソースのデバイスタイプおよび ID を保持する INPUT_MESSAGE_SOURCE 構造体。
%inst
入力メッセージのソースを取得する。

[戻り値]
関数が成功した場合、TRUE を返す。それ以外の場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
関数を呼ぶ。


%index
GetCursor
現在のカーソルへのハンドルを取得する。
%group
Win32 user32
%prm

%inst
現在のカーソルへのハンドルを取得する。

[戻り値]
型: HCURSOR 戻り値は現在のカーソルへのハンドルとなる。カーソルがない場合、戻り値は NULL となる。


%index
GetCursorInfo
グローバルカーソルに関する情報を取得する。
%group
Win32 user32
%prm
pci
pci : [var] 型: PCURSORINFO 情報を受け取る CURSORINFO 構造体へのポインタ。この関数を呼び出す前に cbSize メンバーを sizeof(CURSORINFO) に設定しなければならないことに注意。
%inst
グローバルカーソルに関する情報を取得する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。


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
GetDC
GetDC 関数は、指定したウィンドウのクライアント領域または画面全体のデバイスコンテキスト (DC) へのハンドルを取得する。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] DC を取得するウィンドウへのハンドル。この値が NULL の場合、GetDC は画面全体の DC を取得する。
%inst
GetDC 関数は、指定したウィンドウのクライアント領域または画面全体のデバイスコンテキスト (DC) へのハンドルを取得する。

[戻り値]
関数が成功した場合、戻り値は指定したウィンドウのクライアント領域の DC へのハンドルとなる。関数が失敗した場合、戻り値は NULL
となる。

[備考]
GetDC 関数は、指定したウィンドウのクラススタイルに応じて共通、クラス、またはプライベート DC を取得する。クラスおよびプライベート
DC の場合、GetDC は以前に割り当てられた属性を変更しない。ただし、共通 DC の場合、GetDC は取得するたびに既定の属性を
DC に割り当てる。共通 DC で描画した後、DC を解放するために ReleaseDC 関数を呼び出さなければならない。


%index
GetDCEx
GetDCEx 関数は、指定したウィンドウのクライアント領域または画面全体のデバイスコンテキスト (DC) へのハンドルを取得する。
%group
Win32 user32
%prm
hWnd, hrgnClip, flags
hWnd : [intptr] DC を取得するウィンドウへのハンドル。この値が NULL の場合、GetDCEx は画面全体の DC を取得する。
hrgnClip : [intptr] DC の可視領域と結合されるクリッピング領域。flags の値が DCX_INTERSECTRGN または DCX_EXCLUDERGN の場合、オペレーティングシステムは領域の所有権を引き継ぎ、不要になったときに自動的に削除する。
flags : [int] 
%inst
GetDCEx 関数は、指定したウィンドウのクライアント領域または画面全体のデバイスコンテキスト (DC) へのハンドルを取得する。

[戻り値]
関数が成功した場合、戻り値は指定したウィンドウの DC へのハンドルとなる。関数が失敗した場合、戻り値は NULL となる。hWnd
パラメータの値が無効な場合、関数は失敗する。

[備考]
表示 DC がウィンドウクラスに属していない限り、描画後に DC を解放するために ReleaseDC
関数を呼び出さなければならない。また、ReleaseDC は GetDCEx を呼び出したのと同じスレッドから呼び出さなければならない。


%index
GetDesktopWindow
デスクトップウィンドウへのハンドルを取得する。デスクトップウィンドウは画面全体を覆う。デスクトップウィンドウは他のウィンドウが描画される領域である。
%group
Win32 user32
%prm

%inst

デスクトップウィンドウへのハンドルを取得する。デスクトップウィンドウは画面全体を覆う。デスクトップウィンドウは他のウィンドウが描画される領域である。

[戻り値]
型: HWND 戻り値はデスクトップウィンドウへのハンドルとなる。


%index
GetDialogBaseUnits
システムのダイアログ基本単位 (システムフォントの文字の平均幅と高さ) を取得する。
%group
Win32 user32
%prm

%inst
システムのダイアログ基本単位 (システムフォントの文字の平均幅と高さ) を取得する。

[戻り値]
型: LONG
関数はダイアログ基本単位を返す。戻り値の下位ワードは水平ダイアログボックス基本単位を含み、上位ワードは垂直ダイアログボックス基本単位を含む。

[備考]
GetDialogBaseUnits が返す水平基本単位は、システムフォントの文字の平均幅 (ピクセル単位)
に等しい。垂直基本単位はフォントの高さ (ピクセル単位)
に等しい。システムフォントはダイアログボックステンプレートがフォントを指定していない場合にのみ使用される。ほとんどのダイアログボックステンプレートはフォントを指定するため、この関数はほとんどのダイアログボックスで有用ではない。


%index
GetDialogControlDpiChangeBehavior
ダイアログ内の子ウィンドウのモニタごとの DPI スケーリング動作オーバーライドを取得する。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 調査するウィンドウのハンドル。
%inst
ダイアログ内の子ウィンドウのモニタごとの DPI スケーリング動作オーバーライドを取得する。

[戻り値]
指定したウィンドウに設定されているフラグ。無効なハンドルが渡された場合、この関数は 0 を返し、最後のエラーを
ERROR_INVALID_HANDLE に設定する。


%index
GetDialogDpiChangeBehavior
直前の SetDialogDpiChangeBehavior 呼び出しで設定されたフラグを返す。
%group
Win32 user32
%prm
hDlg
hDlg : [intptr] 調査するダイアログのハンドル。
%inst
直前の SetDialogDpiChangeBehavior 呼び出しで設定されたフラグを返す。

[戻り値]
指定したダイアログに設定されているフラグ。無効なハンドルが渡された場合、この関数は 0 を返し、最後のエラーを
ERROR_INVALID_HANDLE に設定する。

[備考]
戻り値 DDC_DEFAULT とエラーの場合 (0) を区別するのは難しい場合がある。両者を判別するには GetLastError()
を呼び出してエラーを確認することが推奨される。


%index
GetDisplayAutoRotationPreferences
現在のプロセスの画面自動回転設定を取得する。
%group
Win32 user32
%prm
pOrientation
pOrientation : [var] 呼び出し元プロセスの現在の向き設定を受け取るメモリ上の位置へのポインタ。
%inst
現在のプロセスの画面自動回転設定を取得する。

[戻り値]
メソッドが成功した場合は TRUE、それ以外の場合は FALSE。


%index
GetDisplayConfigBufferSizes
GetDisplayConfigBufferSizes 関数は、QueryDisplayConfig 関数を呼び出すのに必要なバッファのサイズを取得する。
%group
Win32 user32
%prm
flags, numPathArrayElements, numModeInfoArrayElements
flags : [int] 
numPathArrayElements : [var] パス情報テーブル内の要素数を受け取る変数へのポインタ。pNumPathArrayElements パラメータの値は、その後 QueryDisplayConfig 関数の呼び出しで使用される。このパラメータを NULL にすることはできない。
numModeInfoArrayElements : [var] モード情報テーブル内の要素数を受け取る変数へのポインタ。pNumModeInfoArrayElements パラメータの値は、その後 QueryDisplayConfig 関数の呼び出しで使用される。このパラメータを NULL にすることはできない。
%inst
GetDisplayConfigBufferSizes 関数は、QueryDisplayConfig
関数を呼び出すのに必要なバッファのサイズを取得する。

[戻り値]
関数は次のいずれかの戻りコードを返す。
（以下省略）

[備考]
現在のディスプレイパス構成と要求されたフラグに基づき、GetDisplayConfigBufferSizes
は情報を格納するために必要なパスおよびモードテーブルのサイズを返す。


%index
GetDlgCtrlID
指定したコントロールの識別子を取得する。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND コントロールへのハンドル。
%inst
指定したコントロールの識別子を取得する。

[戻り値]
型: int 関数が成功した場合、戻り値はコントロールの識別子となる。関数が失敗した場合、戻り値は 0 となる。hwndCtl
パラメータに無効な値を指定した場合などに関数は失敗する。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
GetDlgCtrlID
は子ウィンドウハンドルおよびダイアログボックス内のコントロールのハンドルを受け入れる。アプリケーションは子ウィンドウを作成するときに、CreateWindow
または CreateWindowEx 関数の呼び出し時に hmenu
パラメータに識別子の値を割り当てることで子ウィンドウの識別子を設定する。


%index
GetDlgItem
指定したダイアログボックス内のコントロールへのハンドルを取得する。
%group
Win32 user32
%prm
hDlg, nIDDlgItem
hDlg : [intptr] 型: HWND コントロールを含むダイアログボックスへのハンドル。
nIDDlgItem : [int] 型: int 取得するコントロールの識別子。
%inst
指定したダイアログボックス内のコントロールへのハンドルを取得する。

[戻り値]
型: HWND 関数が成功した場合、戻り値は指定したコントロールのウィンドウハンドルとなる。関数が失敗した場合、戻り値は NULL
となり、無効なダイアログボックスハンドルまたは存在しないコントロールを示す。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
GetDlgItem 関数はダイアログボックスだけでなく、任意の親子ウィンドウのペアで使用できる。hDlg
パラメータが親ウィンドウを指定し、子ウィンドウが一意の識別子を持つ限り、GetDlgItem は子ウィンドウへの有効なハンドルを返す。


%index
GetDlgItemInt
ダイアログボックス内の指定したコントロールのテキストを整数値に変換する。
%group
Win32 user32
%prm
hDlg, nIDDlgItem, lpTranslated, bSigned
hDlg : [intptr] 型: HWND 対象のコントロールを含むダイアログボックスへのハンドル。
nIDDlgItem : [int] 型: int テキストを変換するコントロールの識別子。
lpTranslated : [var] 型: BOOL* 成功または失敗を示す (TRUE は成功、FALSE は失敗)。このパラメータが NULL の場合、関数は成功または失敗に関する情報を返さない。
bSigned : [int] 型: BOOL 関数が先頭のマイナス記号を調べ、見つかった場合に符号付き整数値を返すかどうかを示す (TRUE の場合は行う、FALSE の場合は行わない)。
%inst
ダイアログボックス内の指定したコントロールのテキストを整数値に変換する。

[戻り値]
型: UINT 関数が成功した場合、lpTranslated が指す変数は TRUE
に設定され、戻り値はコントロールテキストの変換値となる。関数が失敗した場合、lpTranslated が指す変数は FALSE
に設定され、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
GetDlgItemInt 関数は、コントロールに WM_GETTEXT
メッセージを送信することで指定したコントロールのテキストを取得する。関数は取得したテキストから先頭の余分な空白を取り除き、10
進数字を変換する。関数はテキストの終わりに達するか非数字文字に遭遇したときに変換を停止する。


%index
GetDlgItemTextW
ダイアログボックス内のコントロールに関連付けられたタイトルまたはテキストを取得する。(Unicode)
%group
Win32 user32
%prm
hDlg, nIDDlgItem, lpString, cchMax
hDlg : [intptr] 型: HWND コントロールを含むダイアログボックスへのハンドル。
nIDDlgItem : [int] 型: int タイトルまたはテキストを取得するコントロールの識別子。
lpString : [wstr] 型: LPTSTR タイトルまたはテキストを受け取るバッファ。
cchMax : [int] 型: int lpString が指すバッファにコピーされる文字列の最大長 (文字数)。NULL 文字を含む文字列の長さが制限を超える場合、文字列は切り詰められる。
%inst
ダイアログボックス内のコントロールに関連付けられたタイトルまたはテキストを取得する。(Unicode)

[戻り値]
型: UINT 関数が成功した場合、戻り値は終端 NULL
文字を含まない、バッファにコピーされた文字数となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
文字列がバッファと同等以上の長さの場合、バッファには切り詰められた文字列と終端 NULL 文字が含まれる。GetDlgItemText
関数はコントロールに WM_GETTEXT メッセージを送信する。


%index
GetDoubleClickTime
マウスの現在のダブルクリック時間を取得する。
%group
Win32 user32
%prm

%inst
マウスの現在のダブルクリック時間を取得する。

[戻り値]
型: UINT 戻り値は現在のダブルクリック時間 (ミリ秒単位) を指定する。最大戻り値は 5000 ミリ秒である。


%index
GetDpiAwarenessContextForProcess
(no summary)
%group
Win32 user32
%prm
hProcess
hProcess : [intptr] 
%inst



%index
GetDpiForSystem
システムの DPI を返す。
%group
Win32 user32
%prm

%inst
システムの DPI を返す。

[戻り値]
システムの DPI 値。

[備考]
戻り値は呼び出しコンテキストに依存する。現在のスレッドの DPI_AWARENESS 値が DPI_AWARENESS_UNAWARE
の場合、戻り値は 96 となる。これは現在のコンテキストが常に 96 の DPI を想定するためである。その他の
DPI_AWARENESS 値では、戻り値は実際のシステム DPI となる。システム DPI をキャッシュすべきではなく、必要なときは常に
GetDpiForSystem を使用すべきである。


%index
GetDpiForWindow
指定したウィンドウの 1 インチあたりのドット数 (DPI) 値を返す。
%group
Win32 user32
%prm
hwnd
hwnd : [intptr] 情報を取得するウィンドウ。
%inst
指定したウィンドウの 1 インチあたりのドット数 (DPI) 値を返す。

[戻り値]
ウィンドウの DPI。これはウィンドウの DPI_AWARENESS に依存する。無効な hwnd 値は 0 の戻り値となる。

[備考]
次の表は、指定された hwnd の DPI_AWARENESS に基づく GetDpiForWindow の戻り値を示す。
（以下省略）


%index
GetDpiFromDpiAwarenessContext
指定した DPI_AWARENESS_CONTEXT ハンドルから DPI を取得する。これにより、そのスレッド内で作成されたウィンドウを調べることなく、スレッドの DPI を判定できる。
%group
Win32 user32
%prm
value
value : [intptr] 調査する DPI_AWARENESS_CONTEXT ハンドル。
%inst
指定した DPI_AWARENESS_CONTEXT ハンドルから DPI
を取得する。これにより、そのスレッド内で作成されたウィンドウを調べることなく、スレッドの DPI を判定できる。

[戻り値]
DPI_AWARENESS_CONTEXT ハンドルに関連付けられた DPI 値。

[備考]
DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE および
DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE_V2 の値に関連付けられた
DPI_AWARENESS_CONTEXT ハンドルは、DPI として 0 を返す。これはモニタごとに認識されるウィンドウの DPI
が変化する可能性があり、ウィンドウの HWND なしでは実際の DPI を返せないためである。


%index
GetFocus
ウィンドウが呼び出し元スレッドのメッセージキューにアタッチされている場合、キーボードフォーカスを持つウィンドウへのハンドルを取得する。
%group
Win32 user32
%prm

%inst
ウィンドウが呼び出し元スレッドのメッセージキューにアタッチされている場合、キーボードフォーカスを持つウィンドウへのハンドルを取得する。

[戻り値]
型: HWND
戻り値はキーボードフォーカスを持つウィンドウへのハンドルとなる。呼び出し元スレッドのメッセージキューにキーボードフォーカスを持つウィンドウが関連付けられていない場合、戻り値は
NULL となる。

[備考]
GetFocus は、現在のスレッドのメッセージキューに対してキーボードフォーカスを持つウィンドウを返す。GetFocus が NULL
を返した場合、別のスレッドのキューがキーボードフォーカスを持つウィンドウにアタッチされている可能性がある。ユーザが現在操作しているウィンドウへのハンドルを取得するには
GetForegroundWindow 関数を使用する。


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
GetGUIThreadInfo
アクティブウィンドウまたは指定した GUI スレッドに関する情報を取得する。
%group
Win32 user32
%prm
idThread, pgui
idThread : [int] 型: DWORD 情報を取得するスレッドの識別子。この値を取得するには GetWindowThreadProcessId 関数を使用する。このパラメータが NULL の場合、関数はフォアグラウンドスレッドの情報を返す。
pgui : [var] 型: LPGUITHREADINFO スレッドを記述する情報を受け取る GUITHREADINFO 構造体へのポインタ。この関数を呼び出す前に cbSize メンバーを sizeof(GUITHREADINFO) に設定しなければならないことに注意。
%inst
アクティブウィンドウまたは指定した GUI スレッドに関する情報を取得する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]

アクティブウィンドウが呼び出し元プロセスによって所有されていない場合でもこの関数は成功する。指定したスレッドが存在しないか入力キューを持たない場合、関数は失敗する。


%index
GetGestureConfig
ウィンドウから送信される Windows タッチジェスチャメッセージの構成を取得する。
%group
Win32 user32
%prm
hwnd, dwReserved, dwFlags, pcIDs, pGestureConfig, cbSize
hwnd : [intptr] ジェスチャ構成を取得するウィンドウへのハンドル。
dwReserved : [int] この値は予約されており、0 に設定しなければならない。
dwFlags : [int] ジェスチャ構成の取得オプションを示すジェスチャコマンドフラグ値。
pcIDs : [var] pGestureConfig バッファ内のジェスチャ構成構造体の数。
pGestureConfig : [var] ジェスチャ構成を指定するジェスチャ構成構造体の配列。
cbSize : [int] ジェスチャ構成 (GESTURECONFIG) 構造体のサイズ。
%inst
ウィンドウから送信される Windows タッチジェスチャメッセージの構成を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。
関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError 関数を使用する。

[備考]
cbSize パラメータに sizeof(GESTURECONFIG)
以外の値を渡すと、この関数の呼び出しは失敗し、GetLastError は ERROR_INVALID_PARAMETER (10 進数
87) を返す。
（以下省略）


%index
GetGestureExtraArgs
GESTUREINFO ハンドルからジェスチャに関する追加情報を取得する。
%group
Win32 user32
%prm
hGestureInfo, cbExtraArgs, pExtraArgs
hGestureInfo : [intptr] WM_GESTURE メッセージの lParam で渡されるジェスチャ情報へのハンドル。
cbExtraArgs : [int] 追加引数に格納されているデータのバイト数。
pExtraArgs : [var] 追加引数情報へのポインタ。
%inst
GESTUREINFO ハンドルからジェスチャに関する追加情報を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。
関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError 関数を使用する。

[備考]
この関数は将来の使用のために予約されており、テスト用にのみ使用すべきである。Windows 7 ジェスチャは追加引数を使用しない。


%index
GetGestureInfo
ジェスチャ情報へのハンドルから GESTUREINFO 構造体を取得する。
%group
Win32 user32
%prm
hGestureInfo, pGestureInfo
hGestureInfo : [intptr] ジェスチャ情報ハンドル。
pGestureInfo : [var] ジェスチャ情報構造体へのポインタ。
%inst
ジェスチャ情報へのハンドルから GESTUREINFO 構造体を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。
関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError 関数を使用する。

[備考]
関数に渡される GESTUREINFO 構造体の cbSize
メンバーは、関数が呼び出される前に設定されなければならない。そうでない場合、GetLastError への呼び出しは
ERROR_INVALID_PARAMETER (10 進数 87) を返す。アプリケーションが WM_GESTURE
メッセージを処理する場合、CloseGestureInfoHandle を使用してハンドルを閉じる責任がある。


%index
GetGuiResources
指定したプロセスによって使用されているグラフィカルユーザインターフェイス (GUI) オブジェクトへのハンドル数を取得する。
%group
Win32 user32
%prm
hProcess, uiFlags
hProcess : [intptr] プロセスへのハンドル。このハンドルは現在のセッション内のプロセスを参照しなければならず、**PROCESS_QUERY_LIMITED_INFORMATION** アクセス権を持っていなければならない。このパラメータが特別な値 **GR_GLOBAL** の場合、リソース使用量は現在のセッション内のすべてのプロセスにわたって報告される。
uiFlags : [int] 
%inst
指定したプロセスによって使用されているグラフィカルユーザインターフェイス (GUI) オブジェクトへのハンドル数を取得する。

[戻り値]
関数が成功した場合、戻り値はプロセスによって使用されている GUI オブジェクトへのハンドル数となる。GUI
オブジェクトが使用されていない場合、戻り値は 0 となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
グラフィカルユーザインターフェイスを持たないプロセスは GUI リソースを使用しないため、GetGuiResources は 0 を返す。


%index
GetIconInfo
指定したアイコンまたはカーソルに関する情報を取得する。
%group
Win32 user32
%prm
hIcon, piconinfo
hIcon : [intptr] 型: HICON
piconinfo : [var] 型: PICONINFO ICONINFO 構造体へのポインタ。関数が構造体のメンバーを埋める。
%inst
指定したアイコンまたはカーソルに関する情報を取得する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外となり、関数は指定した ICONINFO
構造体のメンバーを埋める。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
GetIconInfo は ICONINFO の hbmMask および hbmColor
メンバー用のビットマップを作成する。呼び出し元アプリケーションはこれらのビットマップを管理し、不要になったときに削除しなければならない。DPI
仮想化 この API は DPI 仮想化に参加しない。


%index
GetIconInfoExW
指定したアイコンまたはカーソルに関する情報を取得する。GetIconInfoEx は新しい ICONINFOEX 構造体を使用して GetIconInfo を拡張する。(Unicode)
%group
Win32 user32
%prm
hicon, piconinfo
hicon : [intptr] 型: HICON
piconinfo : [var] 型: PICONINFOEX このメソッドが返るとき、ICONINFOEX 構造体へのポインタを含む。関数が構造体のメンバーを埋める。
%inst
指定したアイコンまたはカーソルに関する情報を取得する。GetIconInfoEx は新しい ICONINFOEX 構造体を使用して
GetIconInfo を拡張する。(Unicode)

[戻り値]
型: BOOL TRUE は成功、FALSE は失敗を示す。

[備考]
GetIconInfoEx は ICONINFOEX の hbmMask および hbmColor
メンバー用のビットマップを作成する。呼び出し元アプリケーションはこれらのビットマップを管理し、不要になったときに削除しなければならない。DPI
仮想化 この API は DPI 仮想化に参加しない。


%index
GetInputState
呼び出し元スレッドのメッセージキューにマウスボタンまたはキーボードメッセージがあるかどうかを判定する。
%group
Win32 user32
%prm

%inst
呼び出し元スレッドのメッセージキューにマウスボタンまたはキーボードメッセージがあるかどうかを判定する。

[戻り値]
型: BOOL キューに 1 つ以上の新しいマウスボタンまたはキーボードメッセージが含まれている場合、戻り値は 0
以外となる。キューに新しいマウスボタンまたはキーボードメッセージがない場合、戻り値は 0 となる。


%index
GetKBCodePage
現在のコードページを取得する。
%group
Win32 user32
%prm

%inst
現在のコードページを取得する。

[戻り値]
型: UINT 戻り値は OEM コードページ識別子、またはレジストリ値が読み取れない場合は既定の識別子となる。


%index
GetKeyNameTextW
キーの名前を表す文字列を取得する。(Unicode)
%group
Win32 user32
%prm
lParam, lpString, cchSize
lParam : [int] 型: LONG 処理するキーボードメッセージ (WM_KEYDOWN など) の 2 番目のパラメータ。関数は lParam 内の次のビット位置を解釈する。
lpString : [wstr] 型: LPTSTR キー名を受け取るバッファ。
cchSize : [int] 型: int キー名の最大長 (終端 NULL 文字を含む、文字数)。
%inst
キーの名前を表す文字列を取得する。(Unicode)

[戻り値]
型: int 関数が成功した場合、NULL 終端文字列が指定したバッファにコピーされ、戻り値は終端 NULL 文字を含まない文字列の長さ
(文字数) となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
キー名文字列の形式は現在のキーボードレイアウトに依存する。キーボードドライバは、1
文字を超える名前を持つキーの名前リストを文字列の形で保持する。


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
GetKeyboardLayout
アクティブな入力ロケール識別子 (以前はキーボードレイアウトと呼ばれていた) を取得する。
%group
Win32 user32
%prm
idThread
idThread : [int] 型: DWORD 照会するスレッドの識別子。現在のスレッドの場合は 0。
%inst
アクティブな入力ロケール識別子 (以前はキーボードレイアウトと呼ばれていた) を取得する。

[戻り値]
型: HKL
戻り値はスレッドの入力ロケール識別子となる。下位ワードには入力言語の言語識別子が含まれ、上位ワードにはキーボードの物理レイアウトへのデバイスハンドルが含まれる。

[備考]
入力ロケール識別子はキーボードレイアウトより広い概念であり、音声からテキストへのコンバータ、インプットメソッドエディタ
(IME)、その他の入力形式を含めることができる。キーボードレイアウトは動的に変更できるため、現在のキーボードレイアウトに関する情報をキャッシュするアプリケーションは、入力言語の変更を通知されるために
WM_INPUTLANGCHANGE メッセージを処理すべきである。


%index
GetKeyboardLayoutList
システム内の現在の入力ロケールセットに対応する入力ロケール識別子 (以前はキーボードレイアウトハンドルと呼ばれていた) を取得する。関数は識別子を指定したバッファにコピーする。
%group
Win32 user32
%prm
nBuff, lpList
nBuff : [int] 型: int バッファが保持できるハンドルの最大数。
lpList : [intptr] 型: HKL* 入力ロケール識別子の配列を受け取るバッファへのポインタ。
%inst
システム内の現在の入力ロケールセットに対応する入力ロケール識別子 (以前はキーボードレイアウトハンドルと呼ばれていた)
を取得する。関数は識別子を指定したバッファにコピーする。

[戻り値]
型: int 関数が成功した場合、戻り値はバッファにコピーされた入力ロケール識別子の数となる。nBuff が 0
の場合、戻り値は現在のすべての入力ロケール識別子を受け取るのに必要なバッファのサイズ (配列要素数) となる。関数が失敗した場合、戻り値は
0 となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
入力ロケール識別子はキーボードレイアウトより広い概念であり、音声からテキストへのコンバータ、インプットメソッドエディタ
(IME)、その他の入力形式を含めることができる。


%index
GetKeyboardLayoutNameW
システムのアクティブな入力ロケール識別子 (以前はキーボードレイアウトと呼ばれていた) の名前を取得する。(Unicode)
%group
Win32 user32
%prm
pwszKLID
pwszKLID : [wstr] 型: LPTSTR 入力ロケール識別子の名前 (終端 NULL 文字を含む) を受け取るバッファ (少なくとも KL_NAMELENGTH 文字の長さ)。
%inst
システムのアクティブな入力ロケール識別子 (以前はキーボードレイアウトと呼ばれていた) の名前を取得する。(Unicode)

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
入力ロケール識別子はキーボードレイアウトより広い概念であり、音声からテキストへのコンバータ、インプットメソッドエディタ
(IME)、その他の入力形式を含めることができる。


%index
GetKeyboardState
256 個の仮想キーの状態を指定したバッファにコピーする。
%group
Win32 user32
%prm
lpKeyState
lpKeyState : [var] 型: PBYTE 各仮想キーの状態データを受け取る 256 バイトの配列。
%inst
256 個の仮想キーの状態を指定したバッファにコピーする。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]

アプリケーションはこの関数を呼び出して、すべての仮想キーの現在の状態を取得できる。状態はスレッドがメッセージキューからキーボードメッセージを削除するときに変化する。スレッドのメッセージキューにキーボードメッセージがポストされるときや、他のスレッドのメッセージキューに対してポストまたは取得されるときには変化しない。


%index
GetKeyboardType
現在のキーボードに関する情報を取得する。
%group
Win32 user32
%prm
nTypeFlag
nTypeFlag : [int] 型: int
%inst
現在のキーボードに関する情報を取得する。

[戻り値]
型: int 関数が成功した場合、戻り値は要求された情報を示す。関数が失敗し、かつ nTypeFlag が 1 でないとき、戻り値は 0
である。nTypeFlag が 1(キーボードのサブタイプ)の場合、0 は正当な戻り値でもある。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
有効なキーボード種別は次のとおり: | 値 | 説明 | |:-----:|------| | 0x4 | 拡張 101 または 102
キーボード(および互換機) | | 0x7 | 日本語キーボード | | 0x8 | 韓国語キーボード | | 0x51 |
不明な種別または HID キーボード | キーボードのサブタイプは OEM 依存の値である。


%index
GetLastActivePopup
指定されたウィンドウが所有するポップアップウィンドウのうち、もっとも最近アクティブだったものを特定する。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND オーナーウィンドウへのハンドル。
%inst
指定されたウィンドウが所有するポップアップウィンドウのうち、もっとも最近アクティブだったものを特定する。

[戻り値]
型: HWND 戻り値は、もっとも最近アクティブだったポップアップウィンドウを示す。次のいずれかの条件を満たす場合、戻り値は hWnd
パラメータと同じになる。
（以下省略）


%index
GetLastInputInfo
最後の入力イベントの時刻を取得する。
%group
Win32 user32
%prm
plii
plii : [var] 型: PLASTINPUTINFO 最後の入力イベントの時刻を受け取る LASTINPUTINFO 構造体へのポインタ。
%inst
最後の入力イベントの時刻を取得する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
この関数は入力アイドル検出に有用である。ただし GetLastInputInfo
は、実行中のすべてのセッションをまたぐシステム全体のユーザー入力情報は提供しない。関数を呼び出したセッションに固有のユーザー入力情報だけを返す。最後の入力イベントを受信したときのティックカウント(LASTINPUTINFO
を参照)は、必ずしも単調増加するとは限らない。場合によっては、直前のイベントのティックカウントより小さくなることもある。例えば、生入力スレッドとデスクトップスレッドの間のタイミングのずれや、独自のティックカウントを供給する
SendInput によって発生するイベントが原因となる。


%index
GetLayeredWindowAttributes
レイヤードウィンドウの不透明度と透明カラーキーを取得する。
%group
Win32 user32
%prm
hwnd, pcrKey, pbAlpha, pdwFlags
hwnd : [intptr] 型: HWND レイヤードウィンドウへのハンドル。レイヤードウィンドウは、CreateWindowEx 関数でウィンドウを作成する際に WS_EX_LAYERED を指定するか、ウィンドウ作成後に SetWindowLong を用いて WS_EX_LAYERED を設定することで作成される。
pcrKey : [var] 型: COLORREF* レイヤードウィンドウを合成する際に使用する透明カラーキーを受け取る COLORREF 値へのポインタ。ウィンドウがこの色で描画したすべてのピクセルは透明になる。この引数が不要な場合は NULL を指定できる。
pbAlpha : [var] 型: BYTE* レイヤードウィンドウの不透明度を表す Alpha 値。BLENDFUNCTION 構造体の SourceConstantAlpha メンバと同様である。pbAlpha が指す変数の値が 0 のときウィンドウは完全に透明になり、255 のときウィンドウは不透明になる。この引数が不要な場合は NULL を指定できる。
pdwFlags : [var] 型: DWORD*
%inst
レイヤードウィンドウの不透明度と透明カラーキーを取得する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
GetLayeredWindowAttributes は、アプリケーションが事前にそのウィンドウに対して
SetLayeredWindowAttributes を呼び出している場合にのみ呼び出すことができる。レイヤードウィンドウが
UpdateLayeredWindow でセットアップされていると、関数は失敗する。詳細はレイヤードウィンドウの使用を参照。


%index
GetListBoxInfo
指定されたリストボックスの列ごとの項目数を取得する。
%group
Win32 user32
%prm
hwnd
hwnd : [intptr] 型: HWND 列ごとの項目数を取得するリストボックスへのハンドル。
%inst
指定されたリストボックスの列ごとの項目数を取得する。

[戻り値]
型: DWORD 戻り値は列ごとの項目数である。


%index
GetMenu
指定したウィンドウに割り当てられたメニューのハンドルを取得する。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND メニューハンドルを取得する対象のウィンドウへのハンドル。
%inst
指定したウィンドウに割り当てられたメニューのハンドルを取得する。

[戻り値]
型: HMENU 戻り値はメニューへのハンドルである。指定ウィンドウにメニューが無い場合、戻り値は NULL
である。ウィンドウが子ウィンドウの場合、戻り値は未定義である。

[備考]
GetMenu
はフローティングメニューバーには動作しない。フローティングメニューバーは標準メニューを模倣したカスタムコントロールであり、メニューそのものではない。フローティングメニューバーのハンドルを得るには
Active Accessibility API を使用する。


%index
GetMenuBarInfo
指定したメニューバーに関する情報を取得する。
%group
Win32 user32
%prm
hwnd, idObject, idItem, pmbi
hwnd : [intptr] 型: HWND 情報を取得する対象のウィンドウ(メニューバー)へのハンドル。
idObject : [int] 型: LONG
idItem : [int] 型: LONG 情報を取得する項目。このパラメータが 0 の場合、関数はメニュー自身の情報を取得する。1 の場合はメニューの最初の項目、以降同様である。
pmbi : [var] 型: PMENUBARINFO 情報を受け取る MENUBARINFO 構造体へのポインタ。関数を呼び出す前に、cbSize メンバに sizeof(MENUBARINFO) を設定しておく必要がある。
%inst
指定したメニューバーに関する情報を取得する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには
GetLastError を呼ぶ。


%index
GetMenuCheckMarkDimensions
既定のチェックマークビットマップのサイズを取得する。
%group
Win32 user32
%prm

%inst
既定のチェックマークビットマップのサイズを取得する。

[戻り値]
型: LONG 戻り値は既定のチェックマークビットマップの高さと幅をピクセル単位で示す。上位ワードに高さ、下位ワードに幅が格納される。


%index
GetMenuContextHelpId
指定したメニューに関連付けられたヘルプコンテキスト識別子を取得する。
%group
Win32 user32
%prm
param0
param0 : [intptr] 
%inst
指定したメニューに関連付けられたヘルプコンテキスト識別子を取得する。

[戻り値]
型: DWORD メニューにヘルプコンテキスト識別子があればそれを返し、無ければ 0 を返す。


%index
GetMenuDefaultItem
指定したメニューの既定のメニュー項目を特定する。
%group
Win32 user32
%prm
hMenu, fByPos, gmdiFlags
hMenu : [intptr] 型: HMENU 既定のメニュー項目を取得する対象のメニューへのハンドル。
fByPos : [int] 型: UINT メニュー項目の識別子を取得するか位置を取得するかを指定する。FALSE の場合は識別子が、そうでない場合は位置が返される。
gmdiFlags : [int] 型: UINT
%inst
指定したメニューの既定のメニュー項目を特定する。

[戻り値]
型: UINT 関数が成功した場合、戻り値はメニュー項目の識別子または位置である。関数が失敗した場合、戻り値は -1
である。拡張エラー情報を取得するには GetLastError を呼ぶ。


%index
GetMenuInfo
指定したメニューに関する情報を取得する。
%group
Win32 user32
%prm
param0, param1
param0 : [intptr] 
param1 : [var] 
%inst
指定したメニューに関する情報を取得する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには
GetLastError を呼ぶ。


%index
GetMenuItemCount
指定したメニュー内の項目数を取得する。
%group
Win32 user32
%prm
hMenu
hMenu : [intptr] 型: HMENU 調査対象のメニューへのハンドル。
%inst
指定したメニュー内の項目数を取得する。

[戻り値]
型: int 関数が成功した場合、戻り値はメニュー内の項目数である。関数が失敗した場合、戻り値は -1
である。拡張エラー情報を取得するには GetLastError を呼ぶ。


%index
GetMenuItemID
メニュー内の指定位置にあるメニュー項目の識別子を取得する。
%group
Win32 user32
%prm
hMenu, nPos
hMenu : [intptr] 型: HMENU 識別子を取得する項目を含むメニューへのハンドル。
nPos : [int] 型: int 識別子を取得するメニュー項目のゼロ基準の相対位置。
%inst
メニュー内の指定位置にあるメニュー項目の識別子を取得する。

[戻り値]
型: UINT 戻り値は指定されたメニュー項目の識別子である。メニュー項目の識別子が NULL
の場合、または指定された項目がサブメニューを開く場合、戻り値は -1 である。


%index
GetMenuItemInfoW
メニュー項目に関する情報を取得する。(Unicode)
%group
Win32 user32
%prm
hmenu, item, fByPosition, lpmii
hmenu : [intptr] 型: HMENU メニュー項目を含むメニューへのハンドル。
item : [int] 型: UINT 情報を取得するメニュー項目の識別子または位置。このパラメータの意味は fByPosition の値に依存する。
fByPosition : [int] 型: BOOL uItem の意味を指定する。FALSE の場合、uItem はメニュー項目識別子として扱われる。そうでない場合はメニュー項目の位置として扱われる。詳しくは「プログラムからメニュー項目にアクセスする」を参照。
lpmii : [var] 型: LPMENUITEMINFO 取得する情報を指定し、メニュー項目情報を受け取る MENUITEMINFO 構造体へのポインタ。関数を呼び出す前に cbSize メンバに sizeof(MENUITEMINFO) を設定しておく必要がある。
%inst
メニュー項目に関する情報を取得する。(Unicode)

[戻り値]
型: BOOL 関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには
GetLastError 関数を使用する。

[備考]
MFT_STRING 型のメニュー項目を取得するには、まず MENUITEMINFO の dwTypeData メンバを NULL
に設定して GetMenuItemInfo を呼び、文字列のサイズを取得する。必要なサイズは cch+1
である。次にそのサイズのバッファを確保して dwTypeData にそのポインタを渡し、cch を 1 増やしてから再度
GetMenuItemInfo を呼び、バッファを文字列で満たす。取得したメニュー項目が他の型である場合、GetMenuItemInfo
は fType で示される型の値を dwTypeData に設定し、cch を 0 にする。


%index
GetMenuItemRect
指定したメニュー項目の外接矩形を取得する。
%group
Win32 user32
%prm
hWnd, hMenu, uItem, lprcItem
hWnd : [intptr] 型: HWND メニューを含むウィンドウへのハンドル。この値が NULL で hMenu がポップアップメニューを表す場合、関数はメニューウィンドウを検索する。
hMenu : [intptr] 型: HMENU メニューへのハンドル。
uItem : [int] 型: UINT メニュー項目のゼロ基準の位置。
lprcItem : [var] 型: LPRECT 指定されたメニュー項目の外接矩形を画面座標で受け取る RECT 構造体へのポインタ。
%inst
指定したメニュー項目の外接矩形を取得する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには
GetLastError 関数を使用する。

[備考]

返される矩形が意味を持つためには、ポップアップメニューなら表示中、メニューバーならウィンドウにアタッチされている必要がある。メニュー項目の位置はメニューが表示されるまで決定されない。


%index
GetMenuState
指定したメニュー項目に関連付けられたメニューフラグを取得する。
%group
Win32 user32
%prm
hMenu, uId, uFlags
hMenu : [intptr] 型: HMENU フラグを取得するメニュー項目を含むメニューへのハンドル。
uId : [int] 型: UINT フラグを取得するメニュー項目。uFlags パラメータによって解釈が変わる。
uFlags : [int] 型: UINT
%inst
指定したメニュー項目に関連付けられたメニューフラグを取得する。

[戻り値]
型: UINT 指定された項目が存在しない場合、戻り値は -1
である。メニュー項目がサブメニューを開く場合、戻り値の下位バイトにはその項目に関連付けられたメニューフラグ、上位バイトには開かれるサブメニュー内の項目数が入る。そうでない場合、戻り値はメニューフラグのビットごとの
OR マスクである。以下にメニュー項目に関連付けられるメニューフラグを示す。
（以下省略）

[備考]
MF_ENABLED、MF_STRING、MF_UNCHECKED、MF_UNHILITE
のフラグ値をテストすることもできるが、これらの値は 0 であるため、単純なビット比較ではなく式を用いて判定する必要がある。
（以下省略）


%index
GetMenuStringW
指定したメニュー項目のテキスト文字列を指定バッファにコピーする。(Unicode)
%group
Win32 user32
%prm
hMenu, uIDItem, lpString, cchMax, flags
hMenu : [intptr] 型: HMENU メニューへのハンドル。
uIDItem : [int] 型: UINT 取得するメニュー項目。uFlag パラメータによって解釈が変わる。
lpString : [wstr] 型: LPTSTR NULL 終端文字列を受け取るバッファ。文字列が lpString と同じかそれ以上の長さの場合、文字列は切り詰められ終端 NULL 文字が付加される。lpString が NULL の場合、関数はメニュー文字列の長さを返す。
cchMax : [int] 型: int コピーする文字列の最大長(文字数)。文字列が nMaxCount で指定された最大長より長い場合、超過した文字は切り捨てられる。nMaxCount が 0 の場合、関数はメニュー文字列の長さを返す。
flags : [int] 型: UINT
%inst
指定したメニュー項目のテキスト文字列を指定バッファにコピーする。(Unicode)

[戻り値]
型: int 関数が成功した場合、戻り値はバッファにコピーされた文字数(終端 NULL
文字を含まない)である。関数が失敗した場合、戻り値はゼロである。指定項目が MIIM_STRING または MFT_STRING
型でない場合、戻り値はゼロである。

[備考]
nMaxCount パラメータは、終端 NULL 文字を収めるためにテキスト文字列の文字数より 1
だけ大きくする必要がある。nMaxCount が 0 の場合、関数はメニュー文字列の長さを返す。セキュリティ警告: lpString は
TCHAR バッファであり、nMaxCount
はメニュー文字列の長さを文字数で表す。これらを誤って指定すると文字列が切り詰められ、データが失われる可能性がある。


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
GetMessageExtraInfo
現在のスレッドの追加メッセージ情報を取得する。追加メッセージ情報は、現在のスレッドのメッセージキューに関連付けられたアプリケーションまたはドライバ定義の値である。
%group
Win32 user32
%prm

%inst

現在のスレッドの追加メッセージ情報を取得する。追加メッセージ情報は、現在のスレッドのメッセージキューに関連付けられたアプリケーションまたはドライバ定義の値である。

[戻り値]
型: LPARAM 戻り値は追加情報を表す。追加情報の意味はデバイス固有である。

[備考]
スレッドの追加メッセージ情報を設定するには SetMessageExtraInfo 関数を使用する。


%index
GetMessagePos
GetMessage 関数で最後に取得したメッセージのカーソル位置を取得する。
%group
Win32 user32
%prm

%inst
GetMessage 関数で最後に取得したメッセージのカーソル位置を取得する。

[戻り値]
型: DWORD 戻り値はカーソル位置の x, y 座標を表す。x 座標は下位ショート、y 座標は上位ショートに入る。

[備考]
前述のとおり、x 座標は戻り値の下位ショート、y
座標は上位ショートに入る(マルチモニタ環境では負の値を取り得るため、ともに符号付き値として扱う)。戻り値を変数に代入した場合、MAKEPOINTS
マクロを用いて POINTS 構造体を得ることができる。GET_X_LPARAM や GET_Y_LPARAM マクロで x または y
座標を抽出することもできる。重要: マルチモニタ環境ではカーソル位置の座標を LOWORD や HIWORD
マクロで抽出してはならない。これらのマクロは座標を符号なし量として扱うため、負の座標を正しく扱えず誤った結果を返す。


%index
GetMessageTime
GetMessage 関数で最後に取得したメッセージのメッセージ時刻を取得する。
%group
Win32 user32
%prm

%inst
GetMessage 関数で最後に取得したメッセージのメッセージ時刻を取得する。

[戻り値]
型: LONG 戻り値はメッセージ時刻を表す。

[備考]
GetMessageTime の戻り値は、タイマカウンタが long
整数の最大値を超えるとラップアラウンドして最小値に戻るため、後続のメッセージで必ずしも増加するとは限らない。メッセージ間の時間差を計算するには、2
番目のメッセージの時刻から 1 番目の時刻を減算し(オーバーフローは無視)、その結果を目的の遅延量と比較する。


%index
GetMonitorInfoW
GetMonitorInfo 関数はディスプレイモニタに関する情報を取得する。(Unicode)
%group
Win32 user32
%prm
hMonitor, lpmi
hMonitor : [intptr] 対象のディスプレイモニタへのハンドル。
lpmi : [var] 指定したディスプレイモニタの情報を受け取る MONITORINFO または MONITORINFOEX 構造体へのポインタ。GetMonitorInfo を呼び出す前に、構造体の cbSize メンバに sizeof(MONITORINFO) または sizeof(MONITORINFOEX) を設定する必要がある。こうすることで渡した構造体の種類を関数が判別できる。MONITORINFOEX は MONITORINFO のスーパーセットで、ディスプレイモニタ名の文字列という 1 つのメンバが追加されている。ほとんどのアプリケーションでモニタ名は不要であり、MONITORINFO を使うことでバイト数を節約できる。
%inst
GetMonitorInfo 関数はディスプレイモニタに関する情報を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
> [!NOTE] > winuser.h ヘッダは GetMonitorInfo を、UNICODE プリプロセッサ定数の定義に応じて
ANSI 版と Unicode
版を自動選択するエイリアスとして定義する。エンコーディングに依存するコードと、エンコーディング中立なエイリアスの混在は、コンパイルエラーや実行時エラーの原因となる。詳しくは
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetMouseMovePointsEx
マウスまたはペンの直近最大 64 個の座標履歴を取得する。
%group
Win32 user32
%prm
cbSize, lppt, lpptBuf, nBufPoints, resolution
cbSize : [int] 型: UINT MOUSEMOVEPOINT 構造体のバイト単位のサイズ。
lppt : [var] 型: LPMOUSEMOVEPOINT 有効なマウス座標(画面座標)を含む MOUSEMOVEPOINT 構造体へのポインタ。タイムスタンプを含めてもよい。GetMouseMovePointsEx は指定点をマウス座標履歴から検索する。見つかった場合、その点を含む直前までの nBufPoints 個の点を返す。アプリケーションがタイムスタンプを与えると、同じ座標だが記録時刻が異なる 2 点を区別するのに使用される。アプリケーションは WM_MOUSEMOVE メッセージで受け取ったマウス座標を画面座標に変換してから本関数を呼び出すべきである。
lpptBuf : [var] 型: LPMOUSEMOVEPOINT 取得した点を受け取るバッファへのポインタ。少なくとも cbSize * nBufPoints のサイズが必要である。
nBufPoints : [int] 型: int 取得する点の個数。
resolution : [int] 型: DWORD
%inst
マウスまたはペンの直近最大 64 個の座標履歴を取得する。

[戻り値]
型: int 関数が成功した場合、戻り値はバッファ内の点の個数である。それ以外の場合は -1 を返す。拡張エラー情報については
GetLastError を呼ぶ。

[備考]
システムは直近の 64 個のマウス座標とそのタイムスタンプを保持している。アプリケーションがマウス座標を
GetMouseMovePointsEx
に渡し、その座標がシステムのマウス座標履歴に存在すれば、関数は指定個数の座標を履歴から取得する。タイムスタンプを与えれば、履歴内の同一点を区別するために使用される。GetMouseMovePointsEx
は、呼び出しスレッドだけでなく他のスレッドにも最終的にディスパッチされた点を返す。次の場合 GetMouseMovePointsEx
は失敗するか誤った値を返すことがある。
（以下省略）


%index
GetNextDlgGroupItem
ダイアログ内で指定コントロールの前(または後)にある、コントロールグループの先頭コントロールへのハンドルを取得する。
%group
Win32 user32
%prm
hDlg, hCtl, bPrevious
hDlg : [intptr] 型: HWND 検索対象のダイアログへのハンドル。
hCtl : [intptr] 型: HWND 検索の起点となるコントロールへのハンドル。NULL の場合、ダイアログ内の最後(または最初)のコントロールを起点とする。
bPrevious : [int] 型: BOOL ダイアログ内のコントロールグループの検索方法を指定する。TRUE の場合、関数はグループ内の前のコントロールを検索する。FALSE の場合、次のコントロールを検索する。
%inst
ダイアログ内で指定コントロールの前(または後)にある、コントロールグループの先頭コントロールへのハンドルを取得する。

[戻り値]
型: HWND
関数が成功した場合、戻り値はコントロールグループ内の前(または次)のコントロールへのハンドルである。関数が失敗した場合、戻り値は NULL
である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
GetNextDlgGroupItem
はダイアログテンプレート内で作成された順(または逆順)にコントロールを検索する。グループの先頭コントロールは WS_GROUP
スタイルを持たねばならず、その他のグループ内コントロールは連続して作成され、WS_GROUP
スタイルを持っていてはならない。前のコントロールを検索する場合、関数は可視かつ有効な最初のコントロールを返す。hCtl
で指定されたコントロールが WS_GROUP スタイルを持つ場合、関数は一時的に検索方向を反転し、WS_GROUP
スタイルを持つ最初のコントロールを見つけてから元の方向で検索を再開し、可視かつ有効な最初のコントロールを返す。該当するコントロールが無ければ
hCtl を返す。次のコントロールを検索する場合、関数は可視で有効かつ WS_GROUP
スタイルを持たない最初のコントロールを返す。WS_GROUP スタイルを持つコントロールに遭遇すると検索方向を反転し、WS_GROUP
スタイルを持つ最初のコントロールを見つけて、それが可視かつ有効ならばそれを返す。そうでなければ元の方向で検索を再開し、可視かつ有効な最初のコントロールを返す。該当するコントロールが無ければ
hCtl を返す。グループ内の次のコントロール検索で WS_EX_CONTROLPARENT
スタイルを持つウィンドウに遭遇した場合、システムはそのウィンドウの子を再帰的に検索する。


%index
GetNextDlgTabItem
指定されたコントロールの前(または後)にある WS_TABSTOP スタイルを持つ最初のコントロールへのハンドルを取得する。
%group
Win32 user32
%prm
hDlg, hCtl, bPrevious
hDlg : [intptr] 型: HWND 検索対象のダイアログへのハンドル。
hCtl : [intptr] 型: HWND 検索の起点となるコントロールへのハンドル。NULL の場合、関数は失敗する。
bPrevious : [int] 型: BOOL ダイアログの検索方法を指定する。TRUE の場合、関数はダイアログ内の前のコントロールを検索する。FALSE の場合、次のコントロールを検索する。
%inst
指定されたコントロールの前(または後)にある WS_TABSTOP スタイルを持つ最初のコントロールへのハンドルを取得する。

[戻り値]
型: HWND 関数が成功した場合、戻り値は WS_TABSTOP
スタイルを持つ前(または次)のコントロールのウィンドウハンドルである。関数が失敗した場合、戻り値は NULL
である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
GetNextDlgTabItem はダイアログテンプレート内で作成された順(または逆順)にコントロールを検索する。関数は可視で有効かつ
WS_TABSTOP スタイルを持つ最初のコントロールを返す。該当するコントロールが無ければ hCtl を返す。WS_TABSTOP
スタイルを持つ次のコントロールを検索する際に WS_EX_CONTROLPARENT
スタイルを持つウィンドウに遭遇した場合、システムはそのウィンドウの子を再帰的に検索する。


%index
GetOpenClipboardWindow
現在クリップボードを開いているウィンドウへのハンドルを取得する。
%group
Win32 user32
%prm

%inst
現在クリップボードを開いているウィンドウへのハンドルを取得する。

[戻り値]
型: HWND
関数が成功した場合、戻り値はクリップボードを開いているウィンドウへのハンドルである。クリップボードを開いているウィンドウが無い場合、戻り値は
NULL である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
アプリケーションまたは DLL が OpenClipboard 関数を呼ぶ際に NULL
のウィンドウハンドルを指定した場合、クリップボードは開かれるがウィンドウとは関連付けられない。この場合、GetOpenClipboardWindow
は NULL を返す。


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
GetPhysicalCursorPos
カーソルの位置を物理座標で取得する。
%group
Win32 user32
%prm
lpPoint
lpPoint : [var] 型: LPPOINT カーソルの物理座標位置。
%inst
カーソルの位置を物理座標で取得する。

[戻り値]
型: BOOL 成功した場合 TRUE、それ以外は FALSE。
発生したエラーの詳細を取得するには GetLastError を呼ぶ。

[備考]
論理座標と物理座標の違いについては PhysicalToLogicalPoint を参照。


%index
GetPointerCursorId
指定したポインタに関連付けられたカーソル識別子を取得する。
%group
Win32 user32
%prm
pointerId, cursorId
pointerId : [int] カーソル識別子を取得する対象のポインタの識別子。
cursorId : [var] 指定したポインタに関連付けられたタブレットカーソル識別子(存在する場合)を受け取る UINT32 のアドレス。
%inst
指定したポインタに関連付けられたカーソル識別子を取得する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]

カーソルオブジェクトは、デジタイザデバイスで使われるポインティング・選択デバイスを表す。もっとも一般的にはタッチデジタイザ上の接触やペンデジタイザのペンがこれに該当する。物理ペンには複数の先端(通常端と消しゴム端など)があり、それぞれが別のカーソルオブジェクトを表す。各カーソルオブジェクトには識別子が関連付けられており、それらから派生するポインタ種別については、アプリケーションが
GetPointerCursorId を使ってポインタに対応するカーソル識別子を取得できる。


%index
GetPointerDevice
ポインタデバイスに関する情報を取得する。
%group
Win32 user32
%prm
device, pointerDevice
device : [intptr] デバイスへのハンドル。
pointerDevice : [var] ポインタデバイスに関する情報を格納する POINTER_DEVICE_INFO 構造体。
%inst
ポインタデバイスに関する情報を取得する。

[戻り値]
関数が成功した場合、TRUE を返す。失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
関数を呼ぶ。


%index
GetPointerDeviceCursors
ポインタデバイスに関連付けられたカーソルにマッピングされているカーソル ID を取得する。
%group
Win32 user32
%prm
device, cursorCount, deviceCursors
device : [intptr] デバイスハンドル。
cursorCount : [var] ポインタデバイスに関連付けられたカーソル数。
deviceCursors : [var] カーソル情報を格納する POINTER_DEVICE_CURSOR_INFO 構造体の配列。NULL の場合、cursorCount にポインタデバイスに関連付けられたカーソル数が返される。
%inst
ポインタデバイスに関連付けられたカーソルにマッピングされているカーソル ID を取得する。

[戻り値]
関数が成功した場合は TRUE、そうでなければ FALSE。関数が失敗した場合は GetLastError 関数で詳細を取得する。


%index
GetPointerDeviceProperties
POINTER_DEVICE_INFO 構造体に含まれていないデバイスプロパティを取得する。
%group
Win32 user32
%prm
device, propertyCount, pointerProperties
device : [intptr] プロパティを問い合わせるポインタデバイス。GetPointerDevices 関数を呼ぶと、このハンドルが POINTER_DEVICE_INFO 構造体で返される。
propertyCount : [var] プロパティの数。pointerProperties が NULL の場合は書き込むべき(あるいは必要な)数を返す。ポインタデバイスがサポートするプロパティ数より小さい値で pointerProperties が NULL でない場合、関数は実際のプロパティ数をこの変数に返して失敗する。
pointerProperties : [var] プロパティの配列。
%inst
POINTER_DEVICE_INFO 構造体に含まれていないデバイスプロパティを取得する。

[戻り値]
関数が成功した場合は TRUE、そうでなければ FALSE。関数が失敗した場合は GetLastError 関数で詳細を取得する。


%index
GetPointerDeviceRects
ポインタデバイスの x, y 範囲(himetric 単位)と、そのデバイスがマッピングされているディスプレイの現在解像度での x, y 範囲を取得する。
%group
Win32 user32
%prm
device, pointerDeviceRect, displayRect
device : [intptr] ポインタデバイスへのハンドル。
pointerDeviceRect : [var] デバイスの物理範囲データを取得するための構造体。
displayRect : [var] ディスプレイ解像度を取得するための構造体。
%inst
ポインタデバイスの x, y 範囲(himetric 単位)と、そのデバイスがマッピングされているディスプレイの現在解像度での x, y
範囲を取得する。

[戻り値]
関数が成功した場合は TRUE、そうでなければ FALSE。関数が失敗した場合は GetLastError 関数で詳細を取得する。


%index
GetPointerDevices
システムに接続されているポインタデバイスに関する情報を取得する。
%group
Win32 user32
%prm
deviceCount, pointerDevices
deviceCount : [var] pointerDevices が NULL の場合、deviceCount には接続されているポインタデバイスの総数が返される。そうでない場合、deviceCount は pointerDevices が指す POINTER_DEVICE_INFO 構造体の個数を指定する。
pointerDevices : [var] システムに接続されているポインタデバイス用の POINTER_DEVICE_INFO 構造体配列。NULL の場合、接続されているポインタデバイスの総数が deviceCount に返される。
%inst
システムに接続されているポインタデバイスに関する情報を取得する。

[戻り値]
関数が成功した場合、TRUE を返す。失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
関数を呼ぶ。

[備考]
Windows 8 では次をサポートする。
（以下省略）


%index
GetPointerFrameInfo
現在のメッセージに関連付けられた指定ポインタのフレーム情報全体を取得する。
%group
Win32 user32
%prm
pointerId, pointerCount, pointerInfo
pointerId : [int] フレーム情報を取得する対象のポインタ識別子。
pointerCount : [var] pointerInfo が指すバッファ内の構造体数を指定する変数へのポインタ。GetPointerFrameInfo が成功した場合、フレーム内のポインタ総数で pointerCount が更新される。
pointerInfo : [var] ポインタ情報を受け取る POINTER_INFO 構造体配列のアドレス。*pointerCount がゼロの場合は NULL でもよい。
%inst
現在のメッセージに関連付けられた指定ポインタのフレーム情報全体を取得する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
並列モードデバイスは、複数ポインタの状態と位置を 1
つの入力レポートとしてシステムに報告する(フレーム単位のポインタ入力)。原則としてアプリケーションはフレーム全体を 1
つの入力単位として扱うべきである。GetPointerFrameInfo
は、ポインタメッセージに関連付けられたポインタ入力フレーム全体を取得する。単一ポインタの情報を取得するには GetPointerInfo
を使用する。フレームには、指定ポインタと同じウィンドウが現在所有するポインタのみが含まれる。GetPointerFrameInfo
が返す情報は、呼び出しスレッドがもっとも最近取得したポインタメッセージに関連付けられている。次のメッセージが取得されると、直前のメッセージに関連付けられた情報は失われる可能性がある。
アプリケーションがポインタ入力メッセージを生成速度ほど速く処理できない場合、一部のメッセージが WM_POINTERUPDATE
メッセージに統合(coalesced)されることがある。直近の WM_POINTERUPDATE
メッセージからメッセージ履歴を取得するには GetPointerFrameInfoHistory
を使用する。フレーム全体を取得した後は、SkipPointerFrameMessages
関数を呼び出して、取得待ちの残りのポインタメッセージをスキップできる。これにより残りメッセージを個別に取得・処理する手間を省ける。ただし
SkipPointerFrameMessages
は、同一スレッドの他のエンティティが個別にメッセージを受け取ることを期待していないと確実な場合にのみ慎重に使うべきである。取得される情報は呼び出しスレッドがもっとも最近取得したポインタフレームに関連付けられるため、次のメッセージが取得されると失われる可能性がある。フレームに指定ポインタ以外のポインタが含まれない場合、関数は成功して指定ポインタの情報のみを返す。フレーム情報がもう利用できない場合、関数は失敗し、最終エラーが
ERROR_NO_DATA
に設定される。呼び出しスレッドが、ポインタメッセージが配信されたウィンドウ(あるいは転送先ウィンドウ)を所有していない場合、関数は失敗し最終エラーが
ERROR_ACCESS_DENIED
に設定される。クライアント領域と非クライアント領域の両方を持つアプリでは、入力フレームに両方のデータが含まれることがある。両者を区別するには対象ウィンドウに対してヒットテストを行う必要がある。入力フレームからデータを絞り込みたい場合は次を推奨する。
（以下省略）


%index
GetPointerFrameInfoHistory
現在のメッセージに関連付けられた指定ポインタのフレーム情報全体(統合された入力フレームを含む)を取得する。
%group
Win32 user32
%prm
pointerId, entriesCount, pointerCount, pointerInfo
pointerId : [int] フレーム情報を取得する対象のポインタ識別子。
entriesCount : [var] pointerInfo が指す 2 次元配列の行数を指定する変数へのポインタ。GetPointerFrameInfoHistory が成功した場合、履歴で利用可能なフレーム総数で entriesCount が更新される。
pointerCount : [var] pointerInfo が指す 2 次元配列の列数を指定する変数へのポインタ。GetPointerFrameInfoHistory が成功した場合、各フレーム内のポインタ総数で pointerCount が更新される。
pointerInfo : [var] ポインタ情報を受け取る POINTER_INFO 構造体の 2 次元配列のアドレス。*entriesCount と *pointerCount の両方がゼロの場合は NULL でもよい。配列は POINTER_INFO[*entriesCount][*pointerCount] として解釈される。
%inst
現在のメッセージに関連付けられた指定ポインタのフレーム情報全体(統合された入力フレームを含む)を取得する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
並列モードデバイスは、複数ポインタの状態と位置を 1 つの入力レポートとしてシステムに報告する。原則としてアプリケーションはフレーム全体を
1 つの入力単位として扱うべきである。GetPointerFrameInfo
が返す情報は呼び出しスレッドがもっとも最近取得したポインタメッセージに関連付けられており、次のメッセージが取得されると失われる可能性がある。アプリケーションがポインタ入力メッセージを生成速度ほど速く処理できない場合、一部のメッセージが
WM_POINTERUPDATE メッセージに統合されることがある。統合された入力フレームを含むメッセージ履歴を直近の
WM_POINTERUPDATE メッセージから取得するには GetPointerFrameInfoHistory
を使用する。フレーム全体を取得した後は SkipPointerFrameMessages
を呼んで残りのポインタメッセージをスキップできる。ただし SkipPointerFrameMessages
は同一スレッドの他のエンティティが個別にメッセージを受け取ることを期待していないと確実な場合にのみ慎重に使うべきである。フレームには、指定ポインタと同じウィンドウが現在所有するポインタのみが含まれる。取得される情報は
2 次元配列として表され、履歴エントリごとに 1 行、フレーム内のポインタごとに 1
列となる。取得される情報は逆時系列順で、最新エントリが配列の 1 行目に入る。最新エントリは GetPointerFrameInfo
が返すものと同じである。提供バッファの行数が利用可能な履歴エントリ全部を収めるのに不十分な場合、関数は成功し、バッファには最新エントリ群が入り、*entriesCount
には利用可能なエントリ総数が入る。

フレームに指定ポインタ以外のポインタが含まれない場合、関数は成功して指定ポインタの情報のみを返す。フレーム情報がもう利用できない場合、関数は失敗し、最終エラーが
ERROR_NO_DATA
に設定される。呼び出しスレッドがポインタメッセージが配信されたウィンドウ(あるいは転送先ウィンドウ)を所有していない場合、関数は失敗し最終エラーが
ERROR_ACCESS_DENIED
に設定される。クライアント領域と非クライアント領域の両方を持つアプリでは、入力フレームに両方のデータが含まれることがある。両者を区別するには対象ウィンドウに対してヒットテストを行う必要がある。入力フレームからデータを絞り込みたい場合は次を推奨する。
（以下省略）


%index
GetPointerFramePenInfo
現在のメッセージに関連付けられた指定ポインタ(PT_PEN 型)のペンベースのフレーム情報全体を取得する。
%group
Win32 user32
%prm
pointerId, pointerCount, penInfo
pointerId : [int] フレーム情報を取得する対象のポインタ識別子。
pointerCount : [var] penInfo が指すバッファ内の構造体数を指定する変数へのポインタ。GetPointerFramePenInfo が成功した場合、フレーム内のポインタ総数で pointerCount が更新される。
penInfo : [var] ポインタ情報を受け取る POINTER_PEN_INFO 構造体配列のアドレス。*pointerCount がゼロの場合は NULL でもよい。
%inst
現在のメッセージに関連付けられた指定ポインタ(PT_PEN 型)のペンベースのフレーム情報全体を取得する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
並列モードデバイスは、複数ポインタの状態と位置を 1
つの入力レポートとしてシステムに報告することがある。原則としてアプリケーションはフレーム全体を 1
つの入力単位として扱うべきである。GetPointerFramePenInfo は、ポインタ(PT_PEN
型)メッセージに関連付けられたポインタ入力フレーム全体を取得する。単一ポインタの情報を取得するには GetPointerPenInfo
を使用する。フレームには、指定ポインタと同じウィンドウが現在所有するポインタのみが含まれる。GetPointerFrameInfo
が返す情報は呼び出しスレッドがもっとも最近取得したポインタメッセージに関連付けられており、次のメッセージが取得されると失われる可能性がある。
アプリケーションがポインタ入力メッセージを生成速度ほど速く処理できない場合、一部のメッセージが WM_POINTERUPDATE
メッセージに統合されることがある。直近の WM_POINTERUPDATE メッセージからメッセージ履歴を取得するには
GetPointerFramePenInfoHistory を使用する。フレーム全体を取得した後は
SkipPointerFrameMessages を呼んで残りのポインタメッセージをスキップできる。ただし
SkipPointerFrameMessages
は同一スレッドの他のエンティティが個別にメッセージを受け取ることを期待していないと確実な場合にのみ慎重に使うべきである。取得される情報は呼び出しスレッドがもっとも最近取得したポインタフレームに関連付けられるため、次のメッセージが取得されると失われる可能性がある。フレームに指定ポインタ以外のポインタが含まれない場合、関数は成功して指定ポインタの情報のみを返す。フレーム情報がもう利用できない場合、関数は失敗し最終エラーが
ERROR_NO_DATA
に設定される。呼び出しスレッドがポインタメッセージが配信されたウィンドウを所有していない場合、関数は失敗し最終エラーが
ERROR_ACCESS_DENIED に設定される。指定ポインタが PT_PEN 型でない場合、関数は失敗し最終エラーが
ERROR_DATATYPE_MISMATCH に設定される。

クライアント領域と非クライアント領域の両方を持つアプリでは、入力フレームに両方のデータが含まれることがある。両者を区別するには対象ウィンドウに対してヒットテストを行う必要がある。入力フレームからデータを絞り込みたい場合は次を推奨する。
（以下省略）


%index
GetPointerFramePenInfoHistory
現在のメッセージに関連付けられた指定ポインタ(PT_PEN 型)のペンベースのフレーム情報全体(統合された入力フレームを含む)を取得する。
%group
Win32 user32
%prm
pointerId, entriesCount, pointerCount, penInfo
pointerId : [int] フレーム情報を取得する対象のポインタ識別子。
entriesCount : [var] penInfo が指す 2 次元配列の行数を指定する変数へのポインタ。GetPointerFramePenInfoHistory が成功した場合、履歴で利用可能なフレーム総数で entriesCount が更新される。
pointerCount : [var] penInfo が指す 2 次元配列の列数を指定する変数へのポインタ。GetPointerFramePenInfoHistory が成功した場合、各フレーム内のポインタ総数で pointerCount が更新される。
penInfo : [var] ポインタ情報を受け取る POINTER_PEN_INFO 構造体の 2 次元配列のアドレス。*entriesCount と *pointerCount の両方がゼロの場合は NULL でもよい。
%inst
現在のメッセージに関連付けられた指定ポインタ(PT_PEN 型)のペンベースのフレーム情報全体(統合された入力フレームを含む)を取得する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
並列モードデバイスは、複数ポインタの状態と位置を 1
つの入力レポートとしてシステムに報告することがある。原則としてアプリケーションはフレーム全体を 1
つの入力単位として扱うべきである。GetPointerFramePenInfo
が返す情報は呼び出しスレッドがもっとも最近取得したポインタ(PT_PEN)メッセージに関連付けられており、次のメッセージが取得されると失われる可能性がある。アプリケーションがポインタ入力メッセージを生成速度ほど速く処理できない場合、一部のメッセージが
WM_POINTERUPDATE メッセージに統合されることがある。統合された入力フレームを含むメッセージ履歴を直近の
WM_POINTERUPDATE メッセージから取得するには GetPointerFramePenInfoHistory
を使用する。フレーム全体を取得した後は SkipPointerFrameMessages
を呼んで残りのポインタメッセージをスキップできる。ただし SkipPointerFrameMessages
は同一スレッドの他のエンティティが個別にメッセージを受け取ることを期待していないと確実な場合にのみ慎重に使うべきである。フレームには、指定ポインタと同じウィンドウが現在所有するポインタのみが含まれる。取得される情報は
2 次元配列として表され、履歴エントリごとに 1 行、フレーム内のポインタごとに 1
列となる。取得される情報は逆時系列順で、最新エントリが配列の 1 行目に入る。最新エントリは GetPointerFramePenInfo
が返すものと同じである。提供バッファの行数が利用可能な履歴エントリ全部を収めるのに不十分な場合、関数は成功し、バッファには最新エントリ群が入り、*entriesCount
には利用可能なエントリ総数が入る。

フレームに指定ポインタ以外のポインタが含まれない場合、関数は成功して指定ポインタの情報のみを返す。フレーム情報がもう利用できない場合、関数は失敗し最終エラーが
ERROR_NO_DATA
に設定される。呼び出しスレッドがポインタメッセージが配信されたウィンドウ(あるいは転送先ウィンドウ)を所有していない場合、関数は失敗し最終エラーが
ERROR_ACCESS_DENIED に設定される。指定ポインタが PT_PEN 型でない場合、関数は失敗し最終エラーが
ERROR_DATATYPE_MISMATCH に設定される。

クライアント領域と非クライアント領域の両方を持つアプリでは、入力フレームに両方のデータが含まれることがある。両者を区別するには対象ウィンドウに対してヒットテストを行う必要がある。入力フレームからデータを絞り込みたい場合は次を推奨する。
（以下省略）


%index
GetPointerFrameTouchInfo
現在のメッセージに関連付けられた指定ポインタ(PT_TOUCH 型)のタッチベースのフレーム情報全体を取得する。
%group
Win32 user32
%prm
pointerId, pointerCount, touchInfo
pointerId : [int] フレーム情報を取得する対象のポインタ識別子。
pointerCount : [var] touchInfo が指すバッファ内の構造体数を指定する変数へのポインタ。GetPointerFrameTouchInfo が成功した場合、フレーム内のポインタ総数で pointerCount が更新される。
touchInfo : [var] ポインタ情報を受け取る POINTER_TOUCH_INFO 構造体配列のアドレス。*pointerCount がゼロの場合は NULL でもよい。
%inst
現在のメッセージに関連付けられた指定ポインタ(PT_TOUCH 型)のタッチベースのフレーム情報全体を取得する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
並列モードデバイスは、複数ポインタの状態と位置を 1
つの入力レポートとしてシステムに報告することがある。原則としてアプリケーションはフレーム全体を 1
つの入力単位として扱うべきである。GetPointerFrameTouchInfo は、ポインタ(PT_TOUCH
型)メッセージに関連付けられたポインタ入力フレーム全体を取得する。単一ポインタの情報を取得するには GetPointerTouchInfo
を使用する。フレームには、指定ポインタと同じウィンドウが現在所有するポインタのみが含まれる。GetPointerFrameTouchInfo
が返す情報は呼び出しスレッドがもっとも最近取得したポインタメッセージに関連付けられており、次のメッセージが取得されると失われる可能性がある。
アプリケーションがポインタ入力メッセージを生成速度ほど速く処理できない場合、一部のメッセージが WM_POINTERUPDATE
メッセージに統合されることがある。直近の WM_POINTERUPDATE メッセージからメッセージ履歴を取得するには
GetPointerFrameTouchInfoHistory を使用する。フレーム全体を取得した後は
SkipPointerFrameMessages を呼んで残りのポインタメッセージをスキップできる。ただし
SkipPointerFrameMessages
は同一スレッドの他のエンティティが個別にメッセージを受け取ることを期待していないと確実な場合にのみ慎重に使うべきである。取得される情報は呼び出しスレッドがもっとも最近取得したポインタフレームに関連付けられるため、次のメッセージが取得されると失われる可能性がある。フレームに指定ポインタ以外のポインタが含まれない場合、関数は成功して指定ポインタの情報のみを返す。フレーム情報がもう利用できない場合、関数は失敗し最終エラーが
ERROR_NO_DATA
に設定される。呼び出しスレッドがポインタメッセージが配信されたウィンドウを所有していない場合、関数は失敗し最終エラーが
ERROR_ACCESS_DENIED に設定される。指定ポインタが PT_TOUCH 型でない場合、関数は失敗し最終エラーが
ERROR_DATATYPE_MISMATCH に設定される。

クライアント領域と非クライアント領域の両方を持つアプリでは、入力フレームに両方のデータが含まれることがある。両者を区別するには対象ウィンドウに対してヒットテストを行う必要がある。入力フレームからデータを絞り込みたい場合は次を推奨する。
（以下省略）


%index
GetPointerFrameTouchInfoHistory
現在のメッセージに関連付けられた指定ポインタ(PT_TOUCH 型)のタッチベースのフレーム情報全体(統合された入力フレームを含む)を取得する。
%group
Win32 user32
%prm
pointerId, entriesCount, pointerCount, touchInfo
pointerId : [int] フレーム情報を取得する対象のポインタ識別子。
entriesCount : [var] touchInfo が指す 2 次元配列の行数を指定する変数へのポインタ。GetPointerFrameTouchInfoHistory が成功した場合、履歴で利用可能なフレーム総数で entriesCount が更新される。
pointerCount : [var] touchInfo が指す 2 次元配列の列数を指定する変数へのポインタ。GetPointerFrameTouchInfoHistory が成功した場合、各フレーム内のポインタ総数で pointerCount が更新される。
touchInfo : [var] ポインタ情報を受け取る POINTER_TOUCH_INFO 構造体の 2 次元配列のアドレス。*entriesCount と *pointerCount の両方がゼロの場合は NULL でもよい。配列は POINTER_TOUCH_INFO[*entriesCount][*pointerCount] として解釈される。
%inst
現在のメッセージに関連付けられた指定ポインタ(PT_TOUCH
型)のタッチベースのフレーム情報全体(統合された入力フレームを含む)を取得する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
並列モードデバイスは、複数ポインタの状態と位置を 1
つの入力レポートとしてシステムに報告することがある。原則としてアプリケーションはフレーム全体を 1
つの入力単位として扱うべきである。GetPointerFrameTouchInfo
が返す情報は呼び出しスレッドがもっとも最近取得したポインタ(PT_TOUCH)メッセージに関連付けられており、次のメッセージが取得されると失われる可能性がある。アプリケーションがポインタ入力メッセージを生成速度ほど速く処理できない場合、一部のメッセージが
WM_POINTERUPDATE メッセージに統合されることがある。統合された入力フレームを含むメッセージ履歴を直近の
WM_POINTERUPDATE メッセージから取得するには GetPointerFrameTouchInfoHistory
を使用する。フレーム全体を取得した後は SkipPointerFrameMessages
を呼んで残りのポインタメッセージをスキップできる。ただし SkipPointerFrameMessages
は同一スレッドの他のエンティティが個別にメッセージを受け取ることを期待していないと確実な場合にのみ慎重に使うべきである。フレームには、指定ポインタと同じウィンドウが現在所有するポインタのみが含まれる。取得される情報は
2 次元配列として表され、履歴エントリごとに 1 行、フレーム内のポインタごとに 1
列となる。取得される情報は逆時系列順で、最新エントリが配列の 1 行目に入る。最新エントリは
GetPointerFrameTouchInfo
が返すものと同じである。提供バッファの行数が利用可能な履歴エントリ全部を収めるのに不十分な場合、関数は成功し、バッファには最新エントリ群が入り、*entriesCount
には利用可能なエントリ総数が入る。

フレームに指定ポインタ以外のポインタが含まれない場合、関数は成功して指定ポインタの情報のみを返す。フレーム情報がもう利用できない場合、関数は失敗し最終エラーが
ERROR_NO_DATA
に設定される。呼び出しスレッドがポインタメッセージが配信されたウィンドウ(あるいは転送先ウィンドウ)を所有していない場合、関数は失敗し最終エラーが
ERROR_ACCESS_DENIED に設定される。指定ポインタが PT_TOUCH 型でない場合、関数は失敗し最終エラーが
ERROR_DATATYPE_MISMATCH に設定される。

クライアント領域と非クライアント領域の両方を持つアプリでは、入力フレームに両方のデータが含まれることがある。両者を区別するには対象ウィンドウに対してヒットテストを行う必要がある。入力フレームからデータを絞り込みたい場合は次を推奨する。
（以下省略）


%index
GetPointerInfo
現在のメッセージに関連付けられた指定ポインタの情報を取得する。
%group
Win32 user32
%prm
pointerId, pointerInfo
pointerId : [int] ポインタ識別子。
pointerInfo : [var] ポインタ情報を受け取る POINTER_INFO 構造体のアドレス。
%inst
現在のメッセージに関連付けられた指定ポインタの情報を取得する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
GetPointerInfo は、ポインタメッセージに関連付けられた単一ポインタの情報を取得する。ポインタ集合のフレーム情報を取得するには
GetPointerFrameInfo を使用する。GetPointerInfo
が返す情報は呼び出しスレッドがもっとも最近取得したポインタメッセージに関連付けられており、次のメッセージが取得されると失われる可能性がある。アプリケーションがポインタ入力メッセージを生成速度ほど速く処理できない場合、一部のメッセージが
WM_POINTERUPDATE メッセージに統合されることがある。直近の WM_POINTERUPDATE
メッセージからメッセージ履歴を取得するには GetPointerInfoHistory
を使用する。メッセージに関連付けられた情報がもう利用できない場合、関数は失敗し最終エラーが ERROR_NO_DATA
に設定される。呼び出しスレッドがポインタメッセージが配信されたウィンドウを所有していない場合、関数は失敗し最終エラーが
ERROR_ACCESS_DENIED
に設定される。これは入力が元々配信されたウィンドウ、あるいはメッセージが転送されたウィンドウである可能性がある。


%index
GetPointerInfoHistory
指定ポインタについて、現在のメッセージに統合された個々の入力情報を取得する。
%group
Win32 user32
%prm
pointerId, entriesCount, pointerInfo
pointerId : [int] 情報を取得する対象のポインタ識別子。
entriesCount : [var] pointerInfo が指すバッファ内の構造体数を指定する変数へのポインタ。GetPointerInfoHistory が成功した場合、利用可能な構造体の総数で entriesCount が更新される。この総数は GetPointerInfo が返す POINTER_INFO 構造体の historyCount フィールドと同じ値である。
pointerInfo : [var] ポインタ情報を受け取る POINTER_INFO 構造体配列のアドレス。*entriesCount がゼロの場合は NULL でもよい。
%inst
指定ポインタについて、現在のメッセージに統合された個々の入力情報を取得する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]

アプリケーションがポインタ入力メッセージを生成速度ほど速く処理できない場合、一部の移動が統合されることがある。統合可能なポインタメッセージを受け取った際、アプリケーションは
GetPointerInfoHistory
を使ってメッセージに統合された個々の入力情報をすべて取得できる。取得される情報は呼び出しスレッドがもっとも最近取得したポインタメッセージに関連付けられるため、次のメッセージが取得されると失われる可能性がある。取得される情報は逆時系列順で、最新エントリが配列の
1 行目に入る。最新エントリは GetPointerInfo
が返すものと同じである。提供バッファの行数が利用可能な履歴エントリ全部を収めるのに不十分な場合、関数は成功し、バッファには最新エントリ群が入り、*entriesCount
には利用可能なエントリ総数が入る。

フレームに指定ポインタ以外のポインタが含まれない場合、関数は成功して指定ポインタの情報のみを返す。フレーム情報がもう利用できない場合、関数は失敗し最終エラーが
ERROR_NO_DATA
に設定される。呼び出しスレッドがポインタメッセージが配信されたウィンドウ(あるいは転送先ウィンドウ)を所有していない場合、関数は失敗し最終エラーが
ERROR_ACCESS_DENIED に設定される。


%index
GetPointerInputTransform
現在のメッセージに関連付けられたポインタ情報座標に対する 1 つ以上の変換を取得する。
%group
Win32 user32
%prm
pointerId, historyCount, inputTransform
pointerId : [int] 情報を取得する対象のポインタ識別子。
historyCount : [int] inputTransform が指せる INPUT_TRANSFORM 構造体の個数。この値は 1 以上かつ、GetPointerInfo, GetPointerTouchInfo, GetPointerPenInfo(単一入力変換の場合)または GetPointerInfoHistory, GetPointerTouchInfoHistory, GetPointerPenInfoHistory(入力変換配列の場合)が返す POINTER_INFO 構造体の historyCount 以下でなければならない。GetPointerInputTransform が成功した場合、利用可能な構造体の総数で inputTransform が更新される。この総数は POINTER_INFO 構造体の historyCount フィールドと同じ値である。
inputTransform : [var] 変換情報を受け取る INPUT_TRANSFORM 構造体配列のアドレス。このパラメータは NULL にできない。
%inst
現在のメッセージに関連付けられたポインタ情報座標に対する 1 つ以上の変換を取得する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
ポインタ入力メッセージの利用側は通常、ScreenToClient や MapWindowPoints
で画面座標をクライアント座標に変換する。メッセージ利用側で変換が適用されている場合、入力発生時点の変換を取得するには
GetPointerInputTransform
を使用する。その逆変換を使えば、ポインタ入力座標を画面座標からメッセージ利用側のクライアント座標へ変換できる。入力に変換が関連付けられていない場合、GetPointerInputTransform
は最終エラー ERROR_NO_DATA で失敗する。代わりに ScreenToClient または MapWindowPoints
を使う。入力変換は入力先の右から左レイアウト設定を考慮しない。右から左レイアウト用の座標補正が必要なアプリケーションは、自前でミラーリングするか、適切なミラーリング変換を入力変換と組み合わせる必要がある。
GetPointerInputTransform
が返す情報は呼び出しスレッドがもっとも最近取得したポインタメッセージに関連付けられており、次のメッセージが取得されると失われる可能性がある。GetPointerInfo
を呼んだ場合、同じポインタ ID と 1 要素の INPUT_TRANSFORM 出力バッファで
GetPointerInputTransform
を呼ぶことでそのデータに関連付けられた入力変換を取得できる。GetPointerFrameInfo
を呼んだ場合も同様で、同一の入力変換がフレーム全体に適用される。GetPointerInfoHistory を呼んだ場合、同じポインタ
ID と取得済みエントリを格納する出力バッファで GetPointerInputTransform
を呼ぶことができる。返された配列内の各入力変換は GetPointerInfoHistory
が返す対応エントリに適用できる。GetPointerFrameInfoHistory を呼んだ場合も同様で、返された配列内の各入力変換は
GetPointerFrameInfoHistory が返す対応フレームに適用でき、同一の入力変換がフレーム全体に適用される。
メッセージに関連付けられた情報がもう利用できない場合、関数は失敗し最終エラーが ERROR_INVALID_PARAMETER
に設定される。historyCount が GetPointerInfo が返す POINTER_INFO 構造体(あるいは
GetPointerInfoHistory が返す配列の最初の POINTER_INFO 構造体)の historyCount
より大きい値を含む場合、関数は失敗し最終エラーが ERROR_INVALID_PARAMETER に設定される。


%index
GetPointerPenInfo
現在のメッセージに関連付けられた指定ポインタ(PT_PEN 型)のペンベースの情報を取得する。
%group
Win32 user32
%prm
pointerId, penInfo
pointerId : [int] 情報を取得する対象のポインタ識別子。
penInfo : [var] ペン固有のポインタ情報を受け取る POINTER_PEN_INFO 構造体のアドレス。
%inst
現在のメッセージに関連付けられた指定ポインタ(PT_PEN 型)のペンベースの情報を取得する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
GetPointerPenInfo は、ポインタメッセージに関連付けられた単一のポインタ(PT_PEN
型)情報を取得する。ポインタ集合のフレーム情報を取得するには GetPointerFramePenInfo
を使用する。GetPointerInfo
が返す情報は呼び出しスレッドがもっとも最近取得したポインタメッセージに関連付けられており、次のメッセージが取得されると失われる可能性がある。アプリケーションがポインタ入力メッセージを生成速度ほど速く処理できない場合、一部のメッセージが
WM_POINTERUPDATE メッセージに統合されることがある。直近の WM_POINTERUPDATE
メッセージからメッセージ履歴を取得するには GetPointerPenInfoHistory
を使用する。メッセージに関連付けられた情報がもう利用できない場合、関数は失敗し最終エラーが ERROR_NO_DATA
に設定される。呼び出しスレッドがポインタメッセージが配信されたウィンドウを所有していない場合、関数は失敗し最終エラーが
ERROR_ACCESS_DENIED
に設定される。これは入力が元々配信されたウィンドウ、あるいはメッセージが転送されたウィンドウである可能性がある。指定ポインタが
PT_PEN 型でない場合、関数は失敗し最終エラーが ERROR_DATATYPE_MISMATCH に設定される。


%index
GetPointerPenInfoHistory
指定ポインタ(PT_PEN 型)について、現在のメッセージに統合された個々の入力に関連付けられたペンベースの情報を取得する。
%group
Win32 user32
%prm
pointerId, entriesCount, penInfo
pointerId : [int] 情報を取得する対象のポインタ識別子。
entriesCount : [var] penInfo が指すバッファ内の構造体数を指定する変数へのポインタ。GetPointerPenInfoHistory が成功した場合、利用可能な構造体の総数で entriesCount が更新される。この総数は GetPointerPenInfo が返す POINTER_PEN_INFO 構造体の historyCount フィールドと同じ値である。
penInfo : [var] ポインタ情報を受け取る POINTER_PEN_INFO 構造体配列のアドレス。*entriesCount がゼロの場合は NULL でもよい。
%inst
指定ポインタ(PT_PEN 型)について、現在のメッセージに統合された個々の入力に関連付けられたペンベースの情報を取得する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]

アプリケーションがポインタ入力メッセージを生成速度ほど速く処理できない場合、一部の移動が統合されることがある。統合可能なポインタ(PT_PEN
型)メッセージを受け取った際、アプリケーションは GetPointerPenInfoHistory
を使ってメッセージに統合された個々の入力情報をすべて取得できる。取得される情報は呼び出しスレッドがもっとも最近取得したポインタメッセージに関連付けられるため、次のメッセージが取得されると失われる可能性がある。取得される情報は逆時系列順で、最新エントリが配列の
1 行目に入る。最新エントリは GetPointerPenInfo
が返すものと同じである。提供バッファの行数が利用可能な履歴エントリ全部を収めるのに不十分な場合、関数は成功し、バッファには最新エントリ群が入り、*entriesCount
には利用可能なエントリ総数が入る。フレームに指定ポインタ以外のポインタが含まれない場合、関数は成功して指定ポインタの情報のみを返す。フレーム情報がもう利用できない場合、関数は失敗し最終エラーが
ERROR_NO_DATA
に設定される。呼び出しスレッドがポインタメッセージが配信されたウィンドウ(あるいは転送先ウィンドウ)を所有していない場合、関数は失敗し最終エラーが
ERROR_ACCESS_DENIED に設定される。指定ポインタが PT_PEN 型でない場合、関数は失敗し最終エラーが
ERROR_DATATYPE_MISMATCH に設定される。


%index
GetPointerTouchInfo
現在のメッセージに関連付けられた指定ポインタ(PT_TOUCH 型)のタッチベースの情報を取得する。
%group
Win32 user32
%prm
pointerId, touchInfo
pointerId : [int] 情報を取得する対象のポインタ識別子。
touchInfo : [var] タッチ固有のポインタ情報を受け取る POINTER_TOUCH_INFO 構造体のアドレス。
%inst
現在のメッセージに関連付けられた指定ポインタ(PT_TOUCH 型)のタッチベースの情報を取得する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
GetPointerTouchInfo は、ポインタメッセージに関連付けられた単一のポインタ(PT_TOUCH
型)情報を取得する。ポインタ集合のフレーム情報を取得するには GetPointerFrameTouchInfo
を使用する。GetPointerTouchInfo
が返す情報は呼び出しスレッドがもっとも最近取得したポインタメッセージに関連付けられており、次のメッセージが取得されると失われる可能性がある。アプリケーションがポインタ入力メッセージを生成速度ほど速く処理できない場合、一部のメッセージが
WM_POINTERUPDATE メッセージに統合されることがある。直近の WM_POINTERUPDATE
メッセージからメッセージ履歴を取得するには GetPointerTouchInfoHistory
を使用する。メッセージに関連付けられた情報がもう利用できない場合、関数は失敗し最終エラーが ERROR_NO_DATA
に設定される。呼び出しスレッドがポインタメッセージが配信されたウィンドウを所有していない場合、関数は失敗し最終エラーが
ERROR_ACCESS_DENIED
に設定される。これは入力が元々配信されたウィンドウ、あるいはメッセージが転送されたウィンドウである可能性がある。指定ポインタが
PT_TOUCH 型でない場合、関数は失敗し最終エラーが ERROR_DATATYPE_MISMATCH に設定される。


%index
GetPointerTouchInfoHistory
指定ポインタ(PT_TOUCH 型)について、現在のメッセージに統合された個々の入力に関連付けられたタッチベースの情報を取得する。
%group
Win32 user32
%prm
pointerId, entriesCount, touchInfo
pointerId : [int] 情報を取得する対象のポインタ識別子。
entriesCount : [var] touchInfo が指すバッファ内の構造体数を指定する変数へのポインタ。GetPointerTouchInfoHistory が成功した場合、利用可能な構造体の総数で entriesCount が更新される。この総数は GetPointerInfo または GetPointerTouchInfo が返す POINTER_INFO 構造体の historyCount フィールドと同じ値である。
touchInfo : [var] ポインタ情報を受け取る POINTER_TOUCH_INFO 構造体配列のアドレス。*entriesCount がゼロの場合は NULL でもよい。
%inst
指定ポインタ(PT_TOUCH 型)について、現在のメッセージに統合された個々の入力に関連付けられたタッチベースの情報を取得する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]

アプリケーションがポインタ入力メッセージを生成速度ほど速く処理できない場合、一部の移動が統合されることがある。統合可能なポインタ(PT_TOUCH
型)メッセージを受け取った際、アプリケーションは GetPointerTouchInfoHistory
を使ってメッセージに統合された個々の入力情報をすべて取得できる。取得される情報は呼び出しスレッドがもっとも最近取得したポインタメッセージに関連付けられるため、次のメッセージが取得されると失われる可能性がある。取得される情報は逆時系列順で、最新エントリが配列の
1 行目に入る。最新エントリは GetPointerTouchInfo
が返すものと同じである。提供バッファの行数が利用可能な履歴エントリ全部を収めるのに不十分な場合、関数は成功し、バッファには最新エントリ群が入り、*entriesCount
には利用可能なエントリ総数が入る。

フレームに指定ポインタ以外のポインタが含まれない場合、関数は成功して指定ポインタの情報のみを返す。フレーム情報がもう利用できない場合、関数は失敗し最終エラーが
ERROR_NO_DATA
に設定される。呼び出しスレッドがポインタメッセージが配信されたウィンドウ(あるいは転送先ウィンドウ)を所有していない場合、関数は失敗し最終エラーが
ERROR_ACCESS_DENIED に設定される。指定ポインタが PT_TOUCH 型でない場合、関数は失敗し最終エラーが
ERROR_DATATYPE_MISMATCH に設定される。


%index
GetPointerType
指定したポインタのポインタ種別を取得する。
%group
Win32 user32
%prm
pointerId, pointerType
pointerId : [int] ポインタ種別を取得する対象のポインタ識別子。
pointerType : [var] ポインタ入力種別を受け取る POINTER_INPUT_TYPE のアドレス。
%inst
指定したポインタのポインタ種別を取得する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
アプリケーションは、種別が異なるポインタに対して別々に振る舞いたい場合に GetPointerType
を使ってポインタ種別を判定できる。注意: この関数が汎用の PT_POINTER 型を返すことはない。


%index
GetPriorityClipboardFormat
指定リストの中で最初に利用可能なクリップボード形式を取得する。
%group
Win32 user32
%prm
paFormatPriorityList, cFormats
paFormatPriorityList : [var] 型: UINT* 優先順位順のクリップボード形式。標準クリップボード形式の説明は Standard Clipboard Formats を参照。
cFormats : [int] 型: int paFormatPriorityList 配列内のエントリ数。この値は配列のエントリ数を超えてはならない。
%inst
指定リストの中で最初に利用可能なクリップボード形式を取得する。

[戻り値]
型: int 関数が成功した場合、戻り値はリスト中で利用可能なデータを持つ最初のクリップボード形式である。クリップボードが空なら戻り値は
NULL である。クリップボードにデータはあるが指定形式のいずれにも該当しない場合、戻り値は -1 である。拡張エラー情報を取得するには
GetLastError を呼ぶ。


%index
GetProcessDefaultLayout
親やオーナーを持たないウィンドウが作成される際に使われる既定レイアウトを取得する。
%group
Win32 user32
%prm
pdwDefaultLayout
pdwDefaultLayout : [var] 型: DWORD* 現在のプロセス既定レイアウト。値の一覧は SetProcessDefaultLayout を参照。
%inst
親やオーナーを持たないウィンドウが作成される際に使われる既定レイアウトを取得する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]

レイアウトは、ウィンドウ内でテキストとグラフィックスがどのように配置されるかを指定する。既定は左から右である。GetProcessDefaultLayout
により、SetProcessDefaultLayout で既定レイアウトが変更されたかどうかを知ることができる。


%index
GetProcessWindowStation
呼び出しプロセスの現在のウィンドウステーションへのハンドルを取得する。
%group
Win32 user32
%prm

%inst
呼び出しプロセスの現在のウィンドウステーションへのハンドルを取得する。

[戻り値]
関数が成功した場合、戻り値はウィンドウステーションへのハンドルである。関数が失敗した場合、戻り値は NULL
である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
システムはプロセス作成時にウィンドウステーションをそのプロセスに関連付ける。プロセスは SetProcessWindowStation
関数で自身のウィンドウステーションを変更できる。呼び出しプロセスは返されたハンドルを GetUserObjectInformation,
GetUserObjectSecurity, SetUserObjectInformation,
SetUserObjectSecurity
の各関数に渡すことができる。この関数が返すハンドルをクローズしてはならない。サービスアプリケーションは作成時に既にウィンドウステーションとデスクトップが関連付けられているため、サービスをウィンドウステーションとデスクトップに接続するために
USER または GDI の関数を呼ぶ必要はない。


%index
GetPropW
指定したウィンドウのプロパティリストからデータハンドルを取得する。取得するハンドルは文字列によって識別される。文字列とハンドルは事前に SetProp 関数でプロパティリストに追加されていなければならない。(Unicode)
%group
Win32 user32
%prm
hWnd, lpString
hWnd : [intptr] 型: HWND 検索対象のプロパティリストを持つウィンドウへのハンドル。
lpString : [wstr] 型: LPCTSTR 文字列を識別するアトム。アトムの場合、GlobalAddAtom 関数で作成されたものでなければならない。16 ビット値のアトムは lpString の下位ワードに配置し、上位ワードはゼロでなければならない。
%inst
指定したウィンドウのプロパティリストからデータハンドルを取得する。取得するハンドルは文字列によって識別される。文字列とハンドルは事前に
SetProp 関数でプロパティリストに追加されていなければならない。(Unicode)

[戻り値]
型: HANDLE プロパティリストに文字列が含まれていれば、戻り値は関連付けられたデータハンドルである。それ以外の場合、戻り値は
NULL である。

[備考]
> [!NOTE] > winuser.h ヘッダは GetProp を、UNICODE プリプロセッサ定数の定義に応じて ANSI 版と
Unicode
版を自動選択するエイリアスとして定義する。エンコーディングに依存するコードと、エンコーディング中立なエイリアスの混在は、コンパイルエラーや実行時エラーの原因となる。詳しくは
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetQueueStatus
呼び出しスレッドのメッセージキューに含まれるメッセージの種類を取得する。
%group
Win32 user32
%prm
flags
flags : [int] 型: UINT
%inst
呼び出しスレッドのメッセージキューに含まれるメッセージの種類を取得する。

[戻り値]
型: DWORD 戻り値の上位ワードは現在キューにあるメッセージの種類を示す。下位ワードは、前回の GetQueueStatus,
GetMessage, PeekMessage の呼び出し以降にキューに追加され、現在もキュー内にあるメッセージの種類を示す。

[備考]
戻り値に QS_ フラグがあるからといって、続く GetMessage または PeekMessage
の呼び出しで必ずメッセージが返るとは限らない。GetMessage と PeekMessage
は内部的にフィルタリングを行うため、メッセージが内部処理されることがある。このため GetQueueStatus
の戻り値は、GetMessage や PeekMessage を呼ぶべきかのヒントとして扱うべきである。QS_ALLPOSTMESSAGE
と QS_POSTMESSAGE はクリアされるタイミングが異なる。QS_POSTMESSAGE はフィルタリングの有無にかかわらず
GetMessage または PeekMessage を呼ぶとクリアされる。QS_ALLPOSTMESSAGE
は、フィルタリングなし(wMsgFilterMin と wMsgFilterMax が 0)で呼ぶときのみクリアされる。これは
PeekMessage を異なる範囲で繰り返し呼んでメッセージを取得する場合に役立つ。


%index
GetRawInputBuffer
生入力データをバッファリングして読み取る。
%group
Win32 user32
%prm
pData, pcbSize, cbSizeHeader
pData : [var] 型: **PRAWINPUT** 生入力データを含む [RAWINPUT](ns-winuser-rawinput.md) 構造体群のバッファへのポインタ。バッファはポインタ境界(32 ビットアーキテクチャでは **DWORD**、64 ビットアーキテクチャでは **QWORD**)にアラインすること。**NULL** の場合、最初の生入力メッセージのデータサイズ(必要最小バッファ、バイト単位)が \**pcbSize* に返される。
pcbSize : [var] 型: **PUINT** 指定した [RAWINPUT](ns-winuser-rawinput.md) バッファのバイト単位のサイズ。
cbSizeHeader : [int] 型: **UINT** [RAWINPUTHEADER](ns-winuser-rawinputheader.md) 構造体のバイト単位のサイズ。
%inst
生入力データをバッファリングして読み取る。

[戻り値]
型: **UINT** *pData* が **NULL** で関数が成功した場合、戻り値はゼロである。*pData* が
**NULL** でなく関数が成功した場合、戻り値は *pData* に書き込まれた
[RAWINPUT](ns-winuser-rawinput.md) 構造体の個数である。エラー発生時は (**UINT**)-1
を返す。エラーコードは
[GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
を呼んで取得する。

[備考]
アプリケーションが生入力を受け取ると、メッセージキューに
[WM_INPUT](/windows/win32/inputdev/wm-input) メッセージが届き、キューステータスフラグ
[QS_RAWINPUT](nf-winuser-getqueuestatus.md)
が設定される。**GetRawInputBuffer** により生入力データは可変サイズの
[RAWINPUT](ns-winuser-rawinput.md) 構造体配列として読み取られ、対応する
[WM_INPUT](/windows/win32/inputdev/wm-input)
メッセージが呼び出しスレッドのメッセージキューから削除される。バッファにすべてのメッセージデータが収まらない場合は複数回呼び出してすべて読み取ることができる。[NEXTRAWINPUTBLOCK](nf-winuser-nextrawinputblock.md)
マクロで [RAWINPUT](ns-winuser-rawinput.md)
配列を走査できる。すべての生入力メッセージが正常に読み取られると、呼び出しスレッドのメッセージキューステータスから
[QS_RAWINPUT](nf-winuser-getqueuestatus.md) フラグがクリアされる。 > [!NOTE] >
WOW64 では、生入力バッファの正しいサイズを取得するために \**pcbSize* の代わりに \**pcbSize* \* 8
を使う必要がある。WOW64 で **GetRawInputBuffer** を正しく動作させるには
[RAWINPUT](ns-winuser-rawinput.md) 構造体を 8 バイト境界にアラインする必要がある。次のコードは
WOW64 向けに **RAWINPUT** をアラインする例を示す。
（以下省略）


%index
GetRawInputData
指定デバイスからの生入力を取得する。
%group
Win32 user32
%prm
hRawInput, uiCommand, pData, pcbSize, cbSizeHeader
hRawInput : [intptr] 型: HRAWINPUT RAWINPUT 構造体へのハンドル。これは WM_INPUT の lParam から取得する。
uiCommand : [int] 型: UINT
pData : [intptr] 型: LPVOID RAWINPUT 構造体から得たデータへのポインタ。uiCommand の値により内容が異なる。pData が NULL の場合、必要なバッファサイズが *pcbSize に返される。
pcbSize : [var] 型: PUINT pData 内のデータのバイト単位のサイズ。
cbSizeHeader : [int] 型: UINT RAWINPUTHEADER 構造体のバイト単位のサイズ。
%inst
指定デバイスからの生入力を取得する。

[戻り値]
型: UINT pData が NULL で関数が成功した場合、戻り値は 0 である。pData が NULL
でなく関数が成功した場合、戻り値は pData にコピーされたバイト数である。エラーが発生した場合、戻り値は (UINT)-1 である。

[備考]
GetRawInputData は RAWINPUT 構造体を 1 つずつ取得する。一方、GetRawInputBuffer は
RAWINPUT 構造体の配列を取得する。


%index
GetRawInputDeviceInfoW
生入力デバイスに関する情報を取得する。(Unicode)
%group
Win32 user32
%prm
hDevice, uiCommand, pData, pcbSize
hDevice : [intptr] 型: HANDLE 生入力デバイスへのハンドル。RAWINPUTHEADER の hDevice メンバまたは GetRawInputDeviceList から取得する。
uiCommand : [int] 型: UINT
pData : [intptr] 型: LPVOID uiCommand で指定された情報を含むバッファへのポインタ。uiCommand が RIDI_DEVICEINFO の場合、GetRawInputDeviceInfo を呼び出す前に RID_DEVICE_INFO の cbSize メンバを sizeof(RID_DEVICE_INFO) に設定する。
pcbSize : [var] 型: PUINT pData 内のデータのバイト単位のサイズ。
%inst
生入力デバイスに関する情報を取得する。(Unicode)

[戻り値]
型: UINT 成功した場合、pData にコピーされたバイト数を示す非負の値を返す。pData がデータを収めるのに十分でない場合、-1
を返す。pData が NULL の場合、ゼロを返す。これらのいずれの場合も、pcbSize は pData
バッファに必要な最小サイズに設定される。その他のエラーを特定するには GetLastError を呼ぶ。

[備考]
> [!NOTE] > winuser.h ヘッダは GetRawInputDeviceInfo を、UNICODE
プリプロセッサ定数の定義に応じて ANSI 版と Unicode
版を自動選択するエイリアスとして定義する。エンコーディングに依存するコードと、エンコーディング中立なエイリアスの混在は、コンパイルエラーや実行時エラーの原因となる。詳しくは
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetRawInputDeviceList
システムに接続されている生入力デバイスを列挙する。
%group
Win32 user32
%prm
pRawInputDeviceList, puiNumDevices, cbSize
pRawInputDeviceList : [var] 型: PRAWINPUTDEVICELIST システムに接続されているデバイスの RAWINPUTDEVICELIST 構造体配列。NULL の場合、デバイス数が *puiNumDevices に返される。
puiNumDevices : [var] 型: PUINT pRawInputDeviceList が NULL の場合、この変数にはシステムに接続されているデバイス数が入る。そうでない場合は、pRawInputDeviceList が指すバッファに収容可能な RAWINPUTDEVICELIST 構造体の個数を指定する。この値が接続デバイス数より小さい場合、関数は実際のデバイス数をこの変数に返し ERROR_INSUFFICIENT_BUFFER で失敗する。この値が接続デバイス数以上の場合、値は変更されず、戻り値としてデバイス数が報告される。
cbSize : [int] 型: UINT RAWINPUTDEVICELIST 構造体のバイト単位のサイズ。
%inst
システムに接続されている生入力デバイスを列挙する。

[戻り値]
型: UINT 関数が成功した場合、戻り値は pRawInputDeviceList
が指すバッファに格納されたデバイス数である。その他のエラー時は (UINT)-1 を返し、GetLastError がエラーを示す。

[備考]
この関数が返すデバイスはマウス、キーボード、その他の HID
デバイスである。接続デバイスの詳細情報を取得するには、RAWINPUTDEVICELIST の hDevice を用いて
GetRawInputDeviceInfo を呼び出す。


%index
GetRawPointerDeviceData
ポインタデバイスから生入力データを取得する。
%group
Win32 user32
%prm
pointerId, historyCount, propertiesCount, pProperties, pValues
pointerId : [int] 情報を取得する対象のポインタ識別子。
historyCount : [int] ポインタ履歴。
propertiesCount : [int] 取得するプロパティの数。
pProperties : [var] デバイスが報告する生データを含む POINTER_DEVICE_PROPERTY 構造体の配列。
pValues : [var] pProperties に対応する値。
%inst
ポインタデバイスから生入力データを取得する。

[戻り値]
関数が成功した場合は TRUE、そうでなければ FALSE。関数が失敗した場合は GetLastError 関数で詳細を取得する。


%index
GetRegisteredRawInputDevices
現在のアプリケーションに登録されている生入力デバイスに関する情報を取得する。
%group
Win32 user32
%prm
pRawInputDevices, puiNumDevices, cbSize
pRawInputDevices : [var] 型: PRAWINPUTDEVICE アプリケーション用の RAWINPUTDEVICE 構造体配列。
puiNumDevices : [var] 型: PUINT *pRawInputDevices 内の RAWINPUTDEVICE 構造体の個数。
cbSize : [int] 型: UINT RAWINPUTDEVICE 構造体のバイト単位のサイズ。
%inst
現在のアプリケーションに登録されている生入力デバイスに関する情報を取得する。

[戻り値]
型: UINT 成功した場合、バッファに書き込まれた RAWINPUTDEVICE
構造体の個数(非負)を返す。pRawInputDevices バッファが小さすぎるか NULL の場合、関数は最終エラーを
ERROR_INSUFFICIENT_BUFFER に設定し -1 を返し、puiNumDevices
に必要なデバイス数を返す。それ以外の理由で失敗した場合も -1 を返す。詳細は GetLastError を呼ぶ。

[備考]
デバイスから生入力を受け取るには、アプリケーションは RegisterRawInputDevices を用いて登録しなければならない。


%index
GetScrollBarInfo
GetScrollBarInfo 関数は指定したスクロールバーに関する情報を取得する。
%group
Win32 user32
%prm
hwnd, idObject, psbi
hwnd : [intptr] 型: HWND 情報を取得するスクロールバーに関連付けられたウィンドウへのハンドル。idObject が OBJID_CLIENT の場合、hwnd はスクロールバーコントロールへのハンドルである。そうでない場合、hwnd は WS_VSCROLL または WS_HSCROLL スタイルで作成されたウィンドウへのハンドルである。
idObject : [int] 型: LONG
psbi : [var] 型: PSCROLLBARINFO 情報を受け取る SCROLLBARINFO 構造体へのポインタ。GetScrollBarInfo を呼び出す前に cbSize メンバを sizeof(SCROLLBARINFO) に設定する。
%inst
GetScrollBarInfo 関数は指定したスクロールバーに関する情報を取得する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
idObject が OBJID_CLIENT で、hwnd
が示すウィンドウがシステムスクロールバーコントロールでない場合、システムはそのウィンドウに SBM_GETSCROLLBARINFO
メッセージを送ってスクロールバー情報を取得する。これにより GetScrollBarInfo
はスクロールバーを模倣したカスタムコントロールでも動作する。ウィンドウが SBM_GETSCROLLBARINFO
を処理しない場合、GetScrollBarInfo は失敗する。


%index
GetScrollInfo
GetScrollInfo 関数はスクロールバーのパラメータ(最小・最大スクロール位置、ページサイズ、スクロールボックス(サム)位置を含む)を取得する。
%group
Win32 user32
%prm
hwnd, nBar, lpsi
hwnd : [intptr] 型: HWND fnBar パラメータの値により、スクロールバーコントロールへのハンドル、または標準スクロールバーを持つウィンドウへのハンドル。
nBar : [int] 型: int
lpsi : [var] 型: LPSCROLLINFO SCROLLINFO 構造体へのポインタ。GetScrollInfo を呼び出す前に cbSize メンバに sizeof(SCROLLINFO) を設定し、fMask メンバに取得するスクロールバーパラメータを指定する。関数は処理を終える前に指定されたパラメータを構造体の該当メンバにコピーする。
%inst
GetScrollInfo
関数はスクロールバーのパラメータ(最小・最大スクロール位置、ページサイズ、スクロールボックス(サム)位置を含む)を取得する。

[戻り値]
型: BOOL
関数が何らかの値を取得した場合、戻り値は非ゼロである。何も取得しなかった場合、戻り値はゼロである。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
GetScrollInfo はアプリケーションが 32 ビットのスクロール位置を使えるようにする。スクロールバー位置を示すメッセージである
WM_HSCROLL や WM_VSCROLL は 16 ビットの位置データしか持たないが、SetScrollInfo と
GetScrollInfo は 32 ビットのスクロールバー位置データを提供する。したがって、WM_HSCROLL または
WM_VSCROLL メッセージの処理中に GetScrollInfo を呼ぶことで 32
ビットのスクロール位置データを取得できる。WM_HSCROLL または WM_VSCROLL メッセージ内で SB_THUMBTRACK
リクエストコードを処理中にスクロールボックス(サム)の 32 ビット位置を取得するには、SCROLLINFO 構造体の fMask
メンバに SIF_TRACKPOS を指定して GetScrollInfo を呼ぶ。関数は SCROLLINFO 構造体の
nTrackPos
メンバにスクロールボックスの追跡位置を返す。これによりユーザーがスクロールボックスを動かしている最中の位置を取得できる。次のサンプルコードはこのテクニックを示す。
（以下省略）


%index
GetScrollPos
GetScrollPos 関数は指定スクロールバーのスクロールボックス(サム)の現在位置を取得する。
%group
Win32 user32
%prm
hWnd, nBar
hWnd : [intptr] 型: HWND nBar パラメータの値により、スクロールバーコントロールへのハンドル、または標準スクロールバーを持つウィンドウへのハンドル。
nBar : [int] 型: int
%inst
GetScrollPos 関数は指定スクロールバーのスクロールボックス(サム)の現在位置を取得する。

[戻り値]
型: int
関数が成功した場合、戻り値はスクロールボックスの現在位置である。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
GetScrollPos はアプリケーションが 32 ビットのスクロール位置を使えるようにする。スクロールバー位置を示すメッセージである
WM_HSCROLL や WM_VSCROLL は 16 ビットの位置データに制限されているが、SetScrollPos,
SetScrollRange, GetScrollPos, GetScrollRange は 32
ビットのスクロールバー位置データをサポートする。したがって、WM_HSCROLL または WM_VSCROLL メッセージの処理中に
GetScrollPos を呼ぶことで 32 ビットのスクロール位置データを取得できる。WM_HSCROLL または WM_VSCROLL
メッセージ内で SB_THUMBTRACK リクエストコードを処理中にスクロールボックス(サム)の 32 ビット位置を取得するには
GetScrollInfo 関数を使う。nBar が SB_CTL で、hWnd
が示すウィンドウがシステムスクロールバーコントロールでない場合、システムはそのウィンドウに SBM_GETPOS
メッセージを送ってスクロールバー情報を取得する。これにより GetScrollPos
はスクロールバーを模倣したカスタムコントロールでも動作する。ウィンドウが SBM_GETPOS を処理しない場合、GetScrollPos
は失敗する。


%index
GetScrollRange
GetScrollRange 関数は指定スクロールバーの現在の最小・最大スクロールボックス(サム)位置を取得する。
%group
Win32 user32
%prm
hWnd, nBar, lpMinPos, lpMaxPos
hWnd : [intptr] 型: HWND nBar パラメータの値により、スクロールバーコントロールへのハンドル、または標準スクロールバーを持つウィンドウへのハンドル。
nBar : [int] 型: int
lpMinPos : [var] 型: LPINT 最小位置を受け取る整数変数へのポインタ。
lpMaxPos : [var] 型: LPINT 最大位置を受け取る整数変数へのポインタ。
%inst
GetScrollRange 関数は指定スクロールバーの現在の最小・最大スクロールボックス(サム)位置を取得する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
指定ウィンドウが標準スクロールバーを持たず、スクロールバーコントロールでもない場合、GetScrollRange は lpMinPos と
lpMaxPos にゼロをコピーする。標準スクロールバーの既定の範囲は 0 から 100
である。スクロールバーコントロールの既定範囲は空(両方ゼロ)である。WM_HSCROLL と WM_VSCROLL は 16
ビットの位置データに制限されているが、SetScrollInfo, SetScrollPos, SetScrollRange,
GetScrollInfo, GetScrollPos, GetScrollRange は 32
ビットのスクロールバー位置データをサポートするため、WM_HSCROLL/WM_VSCROLL の 16
ビット制限を回避できる。技術の詳細は GetScrollInfo を参照。nBar が SB_CTL で、hWnd
が示すウィンドウがシステムスクロールバーコントロールでない場合、システムはそのウィンドウに SBM_GETRANGE
メッセージを送ってスクロールバー情報を取得する。これにより GetScrollRange
はスクロールバーを模倣したカスタムコントロールでも動作する。ウィンドウが SBM_GETRANGE
を処理しない場合、GetScrollRange は失敗する。


%index
GetShellWindow
シェルのデスクトップウィンドウへのハンドルを取得する。
%group
Win32 user32
%prm

%inst
シェルのデスクトップウィンドウへのハンドルを取得する。

[戻り値]
型: HWND 戻り値はシェルのデスクトップウィンドウのハンドルである。シェルプロセスが存在しない場合、戻り値は NULL である。


%index
GetSubMenu
指定メニュー項目がアクティブにするドロップダウンメニューまたはサブメニューへのハンドルを取得する。
%group
Win32 user32
%prm
hMenu, nPos
hMenu : [intptr] 型: HMENU メニューへのハンドル。
nPos : [int] 型: int 指定メニュー内で、ドロップダウンメニューまたはサブメニューをアクティブにする項目のゼロ基準の相対位置。
%inst
指定メニュー項目がアクティブにするドロップダウンメニューまたはサブメニューへのハンドルを取得する。

[戻り値]
型: HMENU
関数が成功した場合、戻り値は指定項目がアクティブにするドロップダウンメニューまたはサブメニューへのハンドルである。項目がドロップダウンメニューやサブメニューをアクティブにしない場合、戻り値は
NULL である。


%index
GetSysColor
指定された表示要素の現在の色を取得する。
%group
Win32 user32
%prm
nIndex
nIndex : [int] 型: int
%inst
指定された表示要素の現在の色を取得する。

[戻り値]
型: DWORD 関数は指定要素の RGB 色値を返す。nIndex が範囲外の場合、戻り値はゼロである。ゼロも有効な RGB
値なので、GetSysColor でシステム色がサポートされているか判断することはできない。代わりに GetSysColorBrush
を使う(サポートされていなければ NULL を返す)。

[備考]
RGB 値の各成分を表示するには GetRValue, GetGValue, GetBValue
マクロを使う。モノクロディスプレイでのシステムカラーは通常グレーの濃淡として解釈される。システムカラーのブラシで描画する際は、GetSysColorBrush(nIndex)
を使うべきである。CreateSolidBrush(GetSysColor(nIndex))
では毎回新しいブラシを確保してしまうが、GetSysColorBrush はキャッシュ済みブラシを返す。色はほとんどの UI
にとって重要な視覚要素である。アプリケーションでの色の使用ガイドラインについては Color - Win32 および Color in
Windows 11 を参照。


%index
GetSysColorBrush
GetSysColorBrush 関数は指定された色インデックスに対応する論理ブラシのハンドルを取得する。
%group
Win32 user32
%prm
nIndex
nIndex : [int] 色インデックス。この値はウィンドウ要素の塗りに使われる色に対応する。システム色インデックスの値は GetSysColor を参照。
%inst
GetSysColorBrush 関数は指定された色インデックスに対応する論理ブラシのハンドルを取得する。

[戻り値]
nIndex が現在のプラットフォームでサポートされている場合、戻り値は論理ブラシを識別する。そうでない場合は NULL を返す。

[備考]
ブラシは塗りつぶし形状の内部を塗るためにシステムが使うビットマップである。アプリケーションは GetSysColor
を呼ぶことで現在のシステム色を取得できる。SetSysColors
でシステム色を設定することもできる。システムブラシをウィンドウクラスに登録してはならない。システム色でクラスを登録するには、WNDCLASS
または WNDCLASSEX 構造体の hbrBackground
メンバのドキュメントを参照。システムカラーブラシはシステム色の変更に追従する。ユーザーがシステム色を変更すると、関連するブラシも自動的に新しい色に変わる。システム色で塗るときは、GetSysColorBrush(nIndex)
を使うべきである。CreateSolidBrush(GetSysColor(nIndex))
では毎回新しいブラシを確保してしまうが、GetSysColorBrush
はキャッシュ済みブラシを返す。システムカラーブラシはシステムが所有するため、破棄する必要はない。GetSysColorBrush
が返す論理ブラシを削除する必要はないが、DeleteObject を呼んでも害はない。


%index
GetSystemDpiForProcess
指定プロセスに関連付けられたシステム DPI を取得する。複数の system-aware プロセス間でシステム DPI の異なる DPI 関連情報を共有する際の互換性の問題を避けるのに役立つ。
%group
Win32 user32
%prm
hProcess
hProcess : [intptr] 調査するプロセスのハンドル。NULL の場合、この API は GetDpiForSystem と同一に振る舞う。
%inst
指定プロセスに関連付けられたシステム DPI を取得する。複数の system-aware プロセス間でシステム DPI の異なる DPI
関連情報を共有する際の互換性の問題を避けるのに役立つ。

[戻り値]
プロセスのシステム DPI 値。

[備考]
戻り値は渡されたプロセスに依存する。指定プロセスの DPI_AWARENESS が DPI_AWARENESS_UNAWARE
の場合、戻り値は 96 になる(この場合、現在のコンテキストは常に DPI 96 と見なされるため)。その他の DPI_AWARENESS
値では、戻り値は当該プロセスの実際のシステム DPI である。


%index
GetSystemMenu
アプリケーションがウィンドウメニュー(システムメニュー、コントロールメニューとも呼ばれる)にアクセスして、コピーや変更を行えるようにする。
%group
Win32 user32
%prm
hWnd, bRevert
hWnd : [intptr] 型: HWND ウィンドウメニューのコピーを所有するウィンドウへのハンドル。
bRevert : [int] 型: BOOL 実行するアクション。FALSE の場合、GetSystemMenu は現在使用中のウィンドウメニューのコピーへのハンドルを返す。このコピーは最初はウィンドウメニューと同一だが、変更することができる。TRUE の場合、ウィンドウメニューを既定状態にリセットする。既存のウィンドウメニュー(あれば)は破棄される。
%inst
アプリケーションがウィンドウメニュー(システムメニュー、コントロールメニューとも呼ばれる)にアクセスして、コピーや変更を行えるようにする。

[戻り値]
型: HMENU bRevert が FALSE の場合、戻り値はウィンドウメニューのコピーへのハンドルである。bRevert が
TRUE の場合、戻り値は NULL である。

[備考]
GetSystemMenu
を使ってウィンドウメニューのコピーを作成しないウィンドウは、標準のウィンドウメニューを受け取る。ウィンドウメニューには最初、SC_CLOSE,
SC_MOVE, SC_SIZE などの識別子を持つ項目が含まれる。ウィンドウメニューの項目は WM_SYSCOMMAND
メッセージを送る。定義済みのウィンドウメニュー項目の識別子はすべて 0xF000
より大きい。アプリケーションがウィンドウメニューにコマンドを追加するときは 0xF000
より小さい識別子を使うべきである。システムは状況に応じて標準ウィンドウメニュー項目を自動的にグレーアウトする。アプリケーションはメニュー表示前に送られる
WM_INITMENU メッセージに応答することで独自のチェックやグレーアウトを行える。


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
GetSystemMetricsForDpi
指定した DPI を考慮した上で、指定されたシステムメトリックまたはシステム構成設定を取得する。
%group
Win32 user32
%prm
nIndex, dpi
nIndex : [int] 取得するシステムメトリックまたは構成設定。利用可能な値は GetSystemMetrics を参照。
dpi : [int] メトリックのスケーリングに使う DPI。
%inst
指定した DPI を考慮した上で、指定されたシステムメトリックまたはシステム構成設定を取得する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
この関数は GetSystemMetrics と同じ結果を返すが、適切な場合に与えられた任意の DPI に従ってスケーリングする。


%index
GetTabbedTextExtentW
GetTabbedTextExtent 関数は文字列の幅と高さを計算する。(Unicode)
%group
Win32 user32
%prm
hdc, lpString, chCount, nTabPositions, lpnTabStopPositions
hdc : [intptr] デバイスコンテキストへのハンドル。
lpString : [wstr] 文字列へのポインタ。
chCount : [int] テキスト文字列の長さ。ANSI 関数ではバイト数、Unicode 関数では WORD 数を指定する。ANSI 関数では SBCS コードページの文字は 1 バイト、DBCS コードページの多くの文字は 2 バイトを占める。Unicode 関数では現在定義されている多くの Unicode 文字(BMP 内)は 1 WORD、サロゲートは 2 WORD である。
nTabPositions : [int] lpnTabStopPositions が指す配列内のタブストップ位置の数。
lpnTabStopPositions : [var] タブストップ位置(デバイス単位)を含む配列へのポインタ。タブストップは昇順に並んでいる必要があり、最小の x 値を配列の先頭にする。
%inst
GetTabbedTextExtent 関数は文字列の幅と高さを計算する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は文字列の寸法(論理単位)である。高さは上位ワード、幅は下位ワードに入る。関数が失敗した場合、戻り値は 0
である。GetTabbedTextExtent は hDC が無効の場合、または nTabPositions が 0
未満の場合に失敗する。

[備考]
現在のクリッピング領域は GetTabbedTextExtent
が返す幅と高さに影響しない。一部のデバイスは文字を規則的なセル配列に配置しない(カーニングを行う)ため、文字列内の各文字のエクステントの合計が文字列全体のエクステントと一致しないことがある。nTabPositions
が 0 で lpnTabStopPositions が NULL の場合、タブは平均文字幅の 8
倍に展開される。nTabPositions が 1 の場合、タブストップは配列の最初の値で示される距離ごとに置かれる。
> [!NOTE] > winuser.h ヘッダは GetTabbedTextExtent を、UNICODE
プリプロセッサ定数の定義に応じて ANSI 版と Unicode
版を自動選択するエイリアスとして定義する。エンコーディングに依存するコードと、エンコーディング中立なエイリアスの混在は、コンパイルエラーや実行時エラーの原因となる。詳しくは
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetThreadDesktop
指定スレッドに割り当てられたデスクトップへのハンドルを取得する。
%group
Win32 user32
%prm
dwThreadId
dwThreadId : [int] スレッド識別子。GetCurrentThreadId と CreateProcess 関数はスレッド識別子を返す。
%inst
指定スレッドに割り当てられたデスクトップへのハンドルを取得する。

[戻り値]
関数が成功した場合、戻り値は指定スレッドに関連付けられたデスクトップへのハンドルである。返されたハンドルをクローズするために
CloseDesktop を呼ぶ必要はない。関数が失敗した場合、戻り値は NULL である。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
システムはスレッド作成時にデスクトップをそのスレッドに関連付ける。スレッドは SetThreadDesktop
関数でデスクトップを変更できる。スレッドに関連付けられたデスクトップは、スレッドのプロセスに関連付けられたウィンドウステーション上になければならない。呼び出しプロセスは返されたハンドルを
GetUserObjectInformation, GetUserObjectSecurity,
SetUserObjectInformation, SetUserObjectSecurity
の各関数に渡すことができる。サービスアプリケーションは作成時に既にウィンドウステーションとデスクトップが関連付けられているため、サービスをウィンドウステーションとデスクトップに接続するために
USER または GDI の関数を呼ぶ必要はない。


%index
GetThreadDpiAwarenessContext
現在のスレッドの DPI_AWARENESS_CONTEXT を取得する。
%group
Win32 user32
%prm

%inst
現在のスレッドの DPI_AWARENESS_CONTEXT を取得する。

[戻り値]
現在のスレッドの DPI_AWARENESS_CONTEXT。

[備考]
このメソッドは SetThreadDpiAwarenessContext に最後に渡された DPI_AWARENESS_CONTEXT
を返す。このスレッドに対して SetThreadDpiAwarenessContext が呼ばれたことがない場合、戻り値はプロセス既定の
DPI_AWARENESS_CONTEXT と等しい。


%index
GetThreadDpiHostingBehavior
現在のスレッドから DPI_HOSTING_BEHAVIOR を取得する。
%group
Win32 user32
%prm

%inst
現在のスレッドから DPI_HOSTING_BEHAVIOR を取得する。

[戻り値]
現在のスレッドの DPI_HOSTING_BEHAVIOR。

[備考]
この API は以前に SetThreadDpiHostingBehavior
で設定されたホスティング動作を返す。以前の呼び出しが無ければ DPI_HOSTING_BEHAVIOR_DEFAULT を返す。


%index
GetTitleBarInfo
指定したタイトルバーに関する情報を取得する。
%group
Win32 user32
%prm
hwnd, pti
hwnd : [intptr] 型: HWND 情報を取得するタイトルバーへのハンドル。
pti : [var] 型: PTITLEBARINFO 情報を受け取る TITLEBARINFO 構造体へのポインタ。関数を呼び出す前に cbSize メンバに sizeof(TITLEBARINFO) を設定する必要がある。
%inst
指定したタイトルバーに関する情報を取得する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには
GetLastError を呼ぶ。


%index
GetTopWindow
指定した親ウィンドウに属する子ウィンドウの Z オーダーを調べ、Z オーダー最上位の子ウィンドウへのハンドルを取得する。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND 子ウィンドウを調べる対象の親ウィンドウへのハンドル。NULL の場合、関数は Z オーダー最上位のウィンドウへのハンドルを返す。
%inst
指定した親ウィンドウに属する子ウィンドウの Z オーダーを調べ、Z オーダー最上位の子ウィンドウへのハンドルを取得する。

[戻り値]
型: HWND 関数が成功した場合、戻り値は Z
オーダー最上位の子ウィンドウへのハンドルである。指定ウィンドウに子ウィンドウが無い場合、戻り値は NULL
である。拡張エラー情報を取得するには GetLastError 関数を使用する。


%index
GetTouchInputInfo
特定のタッチ入力ハンドルに関連付けられたタッチ入力の詳細情報を取得する。
%group
Win32 user32
%prm
hTouchInput, cInputs, pInputs, cbSize
hTouchInput : [intptr] タッチメッセージの LPARAM で受け取ったタッチ入力ハンドル。ハンドルが無効な場合、関数は ERROR_INVALID_HANDLE で失敗する。このハンドルは CloseTouchInputHandle の成功呼び出し後、あるいは DefWindowProc, PostMessage, SendMessage 等に渡した後は無効となる。
cInputs : [int] pInputs 配列内の構造体の数。理想的にはメッセージ WPARAM に示されるタッチポイント数以上を指定すべきである。cInputs がタッチポイント数より小さい場合でも関数は成功し、cInputs 個のタッチポイント情報で pInputs バッファを埋める。
pInputs : [var] 指定タッチ入力ハンドルに関連付けられたタッチポイント情報を受け取る TOUCHINPUT 構造体配列へのポインタ。
cbSize : [int] TOUCHINPUT 構造体 1 つ分のバイト単位のサイズ。cbSize が TOUCHINPUT 構造体 1 つのサイズと一致しない場合、関数は ERROR_INVALID_PARAMETER で失敗する。
%inst
特定のタッチ入力ハンドルに関連付けられたタッチ入力の詳細情報を取得する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには GetLastError
関数を使用する。

[備考]
CloseTouchInputHandle を呼んでも GetTouchInputInfo
で取得した値に関連付けられたメモリは解放されない。GetTouchInputInfo
に渡した構造体内の値は、こちらで削除するまで有効である。


%index
GetUnpredictedMessagePos
タッチ予測処理を通す前のポインタデータを取得する。
%group
Win32 user32
%prm

%inst
タッチ予測処理を通す前のポインタデータを取得する。

[戻り値]
ポインタ入力の画面位置。

[備考]
既定ではタッチ予測は有効になっている。


%index
GetUpdateRect
GetUpdateRect 関数は、指定ウィンドウの更新領域を完全に含むもっとも小さな矩形の座標を取得する。
%group
Win32 user32
%prm
hWnd, lpRect, bErase
hWnd : [intptr] 更新領域を取得する対象のウィンドウへのハンドル。
lpRect : [var] 外接矩形の座標(デバイス単位)を受け取る RECT 構造体へのポインタ。NULL を指定すると、ウィンドウに更新領域が存在するかだけを判定できる。このパラメータが NULL の場合、更新領域が存在すれば GetUpdateRect は非ゼロを返し、存在しなければゼロを返す。これは WM_PAINT メッセージが無効領域によるものかを簡単かつ効率的に判定する手段になる。
bErase : [int] 更新領域内の背景を消去するかを指定する。TRUE で更新領域が空でない場合、GetUpdateRect は指定ウィンドウに WM_ERASEBKGND メッセージを送って背景を消去する。
%inst
GetUpdateRect 関数は、指定ウィンドウの更新領域を完全に含むもっとも小さな矩形の座標を取得する。

[戻り値]
更新領域が空でない場合、戻り値は非ゼロである。更新領域が無い場合、戻り値はゼロである。

[備考]
BeginPaint 関数が返す更新矩形は GetUpdateRect が返すものと同一である。
BeginPaint は自動的に更新領域を検証するため、BeginPaint 呼び出し直後に GetUpdateRect
を呼んでも空の更新領域が返される。


%index
GetUpdateRgn
GetUpdateRgn 関数は、ウィンドウの更新領域を指定リージョンにコピーして取得する。更新領域の座標はウィンドウの左上隅を基準とする(つまりクライアント座標である)。
%group
Win32 user32
%prm
hWnd, hRgn, bErase
hWnd : [intptr] 更新領域を取得する対象のウィンドウへのハンドル。
hRgn : [intptr] 更新領域を受け取るリージョンへのハンドル。
bErase : [int] ウィンドウ背景を消去し、子ウィンドウの非クライアント領域を描画するかを指定する。FALSE の場合、描画は行われない。
%inst
GetUpdateRgn
関数は、ウィンドウの更新領域を指定リージョンにコピーして取得する。更新領域の座標はウィンドウの左上隅を基準とする(つまりクライアント座標である)。

[戻り値]
戻り値は得られたリージョンの複雑さを示し、次のいずれかの値を取る。
（以下省略）

[備考]
BeginPaint 関数は自動的に更新領域を検証するため、BeginPaint 呼び出し直後に GetUpdateRgn
を呼んでも空の更新領域が返される。


%index
GetUpdatedClipboardFormats
現在サポートされているクリップボード形式を取得する。
%group
Win32 user32
%prm
lpuiFormats, cFormats, pcFormatsOut
lpuiFormats : [var] 型: PUINT クリップボード形式の配列。標準クリップボード形式の説明は Standard Clipboard Formats を参照。
cFormats : [int] 型: UINT lpuiFormats が指す配列内のエントリ数。
pcFormatsOut : [var] 型: PUINT lpuiFormats が指す配列内のクリップボード形式の実際の数。
%inst
現在サポートされているクリップボード形式を取得する。

[戻り値]
型: BOOL 関数は成功した場合 TRUE を返し、そうでなければ FALSE を返す。詳細は GetLastError を呼ぶ。


%index
GetUserObjectInformationW
指定したウィンドウステーションまたはデスクトップオブジェクトに関する情報を取得する。(Unicode)
%group
Win32 user32
%prm
hObj, nIndex, pvInfo, nLength, lpnLengthNeeded
hObj : [intptr] ウィンドウステーションまたはデスクトップオブジェクトへのハンドル。このハンドルは CreateWindowStation, OpenWindowStation, CreateDesktop, OpenDesktop 関数が返すものである。
nIndex : [int] 
pvInfo : [intptr] オブジェクト情報を受け取るバッファへのポインタ。
nLength : [int] pvInfo が指すバッファのバイト単位のサイズ。
lpnLengthNeeded : [var] 要求された情報の格納に必要なバイト数を受け取る変数へのポインタ。関数終了時にこの変数の値が nLength より大きい場合、関数は FALSE を返し、情報は pvInfo バッファに何もコピーされない。lpnLengthNeeded が指す変数の値が nLength 以下の場合、情報ブロック全体がコピーされる。
%inst
指定したウィンドウステーションまたはデスクトップオブジェクトに関する情報を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
> [!NOTE] > winuser.h ヘッダは GetUserObjectInformation を、UNICODE
プリプロセッサ定数の定義に応じて ANSI 版と Unicode
版を自動選択するエイリアスとして定義する。エンコーディングに依存するコードと、エンコーディング中立なエイリアスの混在は、コンパイルエラーや実行時エラーの原因となる。詳しくは
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetUserObjectSecurity
指定したユーザーオブジェクトのセキュリティ情報を取得する。
%group
Win32 user32
%prm
hObj, pSIRequested, pSID, nLength, lpnLengthNeeded
hObj : [intptr] セキュリティ情報を返す対象のユーザーオブジェクトへのハンドル。
pSIRequested : [var] 要求するセキュリティ情報を指定する SECURITY_INFORMATION 値へのポインタ。
pSID : [int] 関数終了時に要求情報を含む自己相対形式の SECURITY_DESCRIPTOR 構造体へのポインタ。このバッファは 4 バイト境界にアラインされていなければならない。
nLength : [int] pSD が指すバッファのバイト単位の長さ。
lpnLengthNeeded : [var] 完全なセキュリティ記述子の格納に必要なバイト数を受け取る変数へのポインタ。関数終了時にこの変数の値が nLength より大きい場合、関数は FALSE を返し、セキュリティ記述子はバッファに何もコピーされない。そうでなければ、セキュリティ記述子全体がコピーされる。
%inst
指定したユーザーオブジェクトのセキュリティ情報を取得する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。
関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
ユーザーオブジェクトのセキュリティ記述子から所有者、グループ、または随意アクセス制御リスト(DACL)を読み取るには、ハンドルを開く際に
READ_CONTROL アクセスを付与されている必要がある。システムアクセス制御リスト(SACL)を読み取るには
ACCESS_SYSTEM_SECURITY アクセスが必要である。これを得る正しい方法は、呼び出し元の現在のトークンで
SE_SECURITY_NAME 特権を有効にし、ACCESS_SYSTEM_SECURITY で開き、その後特権を無効にすることである。


%index
GetWindow
指定されたウィンドウに対して特定の関係(Z オーダーまたはオーナー)を持つウィンドウへのハンドルを取得する。
%group
Win32 user32
%prm
hWnd, uCmd
hWnd : [intptr] 型: HWND ウィンドウへのハンドル。取得されるウィンドウハンドルは、uCmd パラメータの値に基づいてこのウィンドウからの相対となる。
uCmd : [int] 型: UINT
%inst
指定されたウィンドウに対して特定の関係(Z オーダーまたはオーナー)を持つウィンドウへのハンドルを取得する。

[戻り値]
型: HWND 関数が成功した場合、戻り値はウィンドウハンドルである。指定された関係にあるウィンドウが無い場合、戻り値は NULL
である。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
EnumChildWindows 関数はループで GetWindow を呼び出すよりも信頼性が高い。GetWindow
をループで呼ぶアプリケーションは、無限ループに陥ったり破棄済みのウィンドウハンドルを参照したりする危険がある。


%index
GetWindowContextHelpId
指定したウィンドウに関連付けられたヘルプコンテキスト識別子(もしあれば)を取得する。
%group
Win32 user32
%prm
param0
param0 : [intptr] 
%inst
指定したウィンドウに関連付けられたヘルプコンテキスト識別子(もしあれば)を取得する。

[戻り値]
型: DWORD ウィンドウにヘルプコンテキスト識別子があればそれを返し、無ければ 0 を返す。


%index
GetWindowDC
GetWindowDC 関数は、タイトルバー、メニュー、スクロールバーを含むウィンドウ全体のデバイスコンテキスト(DC)を取得する。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] デバイスコンテキストを取得する対象のウィンドウへのハンドル。NULL の場合、GetWindowDC は画面全体のデバイスコンテキストを取得する。このパラメータが NULL の場合、プライマリディスプレイモニタのデバイスコンテキストが取得される。他のディスプレイモニタのデバイスコンテキストを得るには EnumDisplayMonitors と CreateDC 関数を使う。
%inst
GetWindowDC 関数は、タイトルバー、メニュー、スクロールバーを含むウィンドウ全体のデバイスコンテキスト(DC)を取得する。

[戻り値]
関数が成功した場合、戻り値は指定ウィンドウのデバイスコンテキストへのハンドルである。関数が失敗した場合、戻り値は NULL
となり、エラーまたは無効な hWnd を示す。

[備考]
GetWindowDC
は、ウィンドウの非クライアント領域内での特殊な描画効果のためにある。任意のウィンドウの非クライアント領域への描画は推奨されない。タイトルバー、メニュー、スクロールバーなど非クライアント領域の各部の寸法は
GetSystemMetrics で取得できる。画面全体のデバイスコンテキストを取得するには GetDC 関数を使う。描画が完了したら
ReleaseDC
でデバイスコンテキストを解放しなければならない。ウィンドウデバイスコンテキストを解放しないとアプリケーションの描画に重大な影響が出る。


%index
GetWindowDisplayAffinity
任意のプロセスから、指定ウィンドウの現在のディスプレイアフィニティ設定を取得する。
%group
Win32 user32
%prm
hWnd, pdwAffinity
hWnd : [intptr] 型: HWND ウィンドウへのハンドル。
pdwAffinity : [var] 型: DWORD* ディスプレイアフィニティ設定を受け取る変数へのポインタ。アフィニティ設定の一覧とその意味は SetWindowDisplayAffinity を参照。
%inst
任意のプロセスから、指定ウィンドウの現在のディスプレイアフィニティ設定を取得する。

[戻り値]
型: BOOL この関数はウィンドウがレイヤードで、かつ Desktop Window Manager
がデスクトップを合成しているときのみ成功する。成功した場合 TRUE を返し、そうでなければ FALSE
を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
本関数と SetWindowDisplayAffinity は、Windows 7
固有のウィンドウコンテンツ保護機能を支援するために設計された。この機能によりアプリケーションは、特定の OS 機能や API
によって自身のオンスクリーンウィンドウ内容がキャプチャ/コピーされないよう保護できる。ただし、これは Desktop Window
Manager (DWM) がデスクトップを合成している場合にのみ機能する。
なお、これはセキュリティ機能や DRM
の実装ではないため、SetWindowDisplayAffinity/GetWindowDisplayAffinity、および
DwmIsCompositionEnabled
等の必要関数を使用しても、たとえば画面を写真撮影されるような場合にはウィンドウコンテンツを厳密に保護することは保証されない。


%index
GetWindowDpiAwarenessContext
ウィンドウに関連付けられた DPI_AWARENESS_CONTEXT を返す。
%group
Win32 user32
%prm
hwnd
hwnd : [intptr] 問い合わせるウィンドウ。
%inst
ウィンドウに関連付けられた DPI_AWARENESS_CONTEXT を返す。

[戻り値]
指定ウィンドウの DPI_AWARENESS_CONTEXT。ウィンドウが無効な場合、戻り値は NULL である。

[備考]
重要: GetWindowDpiAwarenessContext の戻り値は現在のスレッドの DPI_AWARENESS
の影響を受けない。hwnd 入力パラメータで指定したウィンドウのコンテキストのみを示す。


%index
GetWindowDpiHostingBehavior
指定ウィンドウの DPI_HOSTING_BEHAVIOR を返す。
%group
Win32 user32
%prm
hwnd
hwnd : [intptr] 調査するウィンドウのハンドル。
%inst
指定ウィンドウの DPI_HOSTING_BEHAVIOR を返す。

[戻り値]
指定ウィンドウの DPI_HOSTING_BEHAVIOR。

[備考]
この API
を使うと、ウィンドウ作成後にそのホスティング動作を調べることができる。ウィンドウのホスティング動作は、そのウィンドウが作成されたスレッドのホスティング動作(SetThreadDpiHostingBehavior
で設定されたもの)である。これはウィンドウ作成後に変更不能な永続値であり、スレッドのホスティング動作が変更されても影響を受けない。


%index
GetWindowFeedbackSetting
ウィンドウのフィードバック構成を取得する。
%group
Win32 user32
%prm
hwnd, feedback, dwFlags, pSize, config
hwnd : [intptr] フィードバック構成をチェックする対象のウィンドウ。
feedback : [int] FEEDBACK_TYPE 列挙型の値のいずれか。
dwFlags : [int] 値が見つかるまで親ウィンドウ連鎖をチェックする場合は GWFS_INCLUDE_ANCESTORS を指定する。既定は 0 で、指定ウィンドウのみをチェックすることを示す。
pSize : [var] config が指すメモリ領域のサイズ。pSize は feedback で示されるフィードバック種別の構成データのサイズを指定し、sizeof(BOOL) でなければならない。
config : [intptr] 構成データ。config は BOOL 型の値を指していなければならない。
%inst
ウィンドウのフィードバック構成を取得する。

[戻り値]
指定されたフィードバック設定が指定ウィンドウに構成されている場合 TRUE を返す。そうでなければ FALSE を返す(config
は変更されない)。


%index
GetWindowInfo
指定したウィンドウに関する情報を取得する。(GetWindowInfo)
%group
Win32 user32
%prm
hwnd, pwi
hwnd : [intptr] 型: HWND 情報を取得する対象のウィンドウへのハンドル。
pwi : [var] 型: PWINDOWINFO 情報を受け取る WINDOWINFO 構造体へのポインタ。関数を呼び出す前に cbSize メンバに sizeof(WINDOWINFO) を設定する必要がある。
%inst
指定したウィンドウに関する情報を取得する。(GetWindowInfo)

[戻り値]
型: BOOL 関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには
GetLastError を呼ぶ。


%index
GetWindowLongW
指定したウィンドウに関する情報を取得する。(GetWindowLongW)
%group
Win32 user32
%prm
hWnd, nIndex
hWnd : [intptr] 型: HWND ウィンドウへのハンドル。間接的にそのウィンドウが属するクラスも指す。
nIndex : [int] 型: int
%inst
指定したウィンドウに関する情報を取得する。(GetWindowLongW)

[戻り値]
型: LONG 関数が成功した場合、戻り値は要求された値である。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには
GetLastError を呼ぶ。以前に SetWindowLong が呼ばれていない場合、GetWindowLong
は追加のウィンドウまたはクラスメモリ内の値についてゼロを返す。

[備考]
追加のウィンドウメモリは、RegisterClassEx で用いる WNDCLASSEX 構造体の cbWndExtra
メンバに非ゼロを指定して確保する。


%index
GetWindowModuleFileNameW
指定されたウィンドウハンドルに関連付けられたモジュールのフルパスとファイル名を取得する。(Unicode)
%group
Win32 user32
%prm
hwnd, pszFileName, cchFileNameMax
hwnd : [intptr] 型: HWND モジュールファイル名を取得する対象のウィンドウへのハンドル。
pszFileName : [wstr] 型: LPTSTR パスとファイル名。
cchFileNameMax : [int] 型: UINT lpszFileName バッファにコピー可能な最大文字数。
%inst
指定されたウィンドウハンドルに関連付けられたモジュールのフルパスとファイル名を取得する。(Unicode)

[戻り値]
型: UINT 戻り値はバッファにコピーされた総文字数である。

[備考]
> [!NOTE] > winuser.h ヘッダは GetWindowModuleFileName を、UNICODE
プリプロセッサ定数の定義に応じて ANSI 版と Unicode
版を自動選択するエイリアスとして定義する。エンコーディングに依存するコードと、エンコーディング中立なエイリアスの混在は、コンパイルエラーや実行時エラーの原因となる。詳しくは
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetWindowPlacement
指定したウィンドウの表示状態と、復元・最小化・最大化時の位置を取得する。
%group
Win32 user32
%prm
hWnd, lpwndpl
hWnd : [intptr] 型: HWND ウィンドウへのハンドル。
lpwndpl : [var] 型: WINDOWPLACEMENT* 表示状態と位置情報を受け取る WINDOWPLACEMENT 構造体へのポインタ。GetWindowPlacement を呼び出す前に length メンバを sizeof(WINDOWPLACEMENT) に設定する。lpwndpl->length が正しく設定されていないと GetWindowPlacement は失敗する。
%inst
指定したウィンドウの表示状態と、復元・最小化・最大化時の位置を取得する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
この関数が取得する WINDOWPLACEMENT の flags メンバは常にゼロである。hWnd
で示されるウィンドウが最大化されていれば showCmd メンバは SW_SHOWMAXIMIZED、最小化されていれば
SW_SHOWMINIMIZED、それ以外は SW_SHOWNORMAL になる。WINDOWPLACEMENT の length
メンバは sizeof(WINDOWPLACEMENT) に設定しなければならない。正しく設定されていないと関数は FALSE
を返す。ウィンドウプレースメント座標の正しい使い方についての追加情報は WINDOWPLACEMENT を参照。


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
GetWindowRgn
GetWindowRgn 関数はウィンドウのウィンドウリージョンのコピーを取得する。
%group
Win32 user32
%prm
hWnd, hRgn
hWnd : [intptr] ウィンドウリージョンを取得する対象のウィンドウへのハンドル。
hRgn : [intptr] ウィンドウリージョンを表すよう修正されるリージョンへのハンドル。
%inst
GetWindowRgn 関数はウィンドウのウィンドウリージョンのコピーを取得する。

[戻り値]
戻り値は取得したリージョンの種類を示し、次のいずれかの値を取る。
（以下省略）

[備考]
ウィンドウのウィンドウリージョンの座標は、クライアント領域ではなくウィンドウの左上隅を基準とする。ウィンドウリージョンを設定するには
SetWindowRgn 関数を呼ぶ。


%index
GetWindowRgnBox
GetWindowRgnBox 関数は、ウィンドウのウィンドウリージョンを最小に囲む外接矩形の寸法を取得する。
%group
Win32 user32
%prm
hWnd, lprc
hWnd : [intptr] ウィンドウへのハンドル。
lprc : [var] ウィンドウの左上隅を基準としたデバイス単位の矩形寸法を受け取る RECT 構造体へのポインタ。
%inst
GetWindowRgnBox 関数は、ウィンドウのウィンドウリージョンを最小に囲む外接矩形の寸法を取得する。

[戻り値]
戻り値は取得したリージョンの種類を示し、次のいずれかの値を取る。
（以下省略）

[備考]

ウィンドウリージョンはウィンドウ内で描画を許可する領域を決定する。システムはウィンドウリージョンの外側の部分を表示しない。ウィンドウリージョンの座標はクライアント領域ではなくウィンドウの左上隅を基準とする。ウィンドウリージョンを設定するには
SetWindowRgn 関数を呼ぶ。


%index
GetWindowTextW
指定したウィンドウのタイトルバーテキスト(タイトルバーがある場合)をバッファにコピーする。指定ウィンドウがコントロールの場合、そのコントロールのテキストがコピーされる。ただし GetWindowText は別アプリケーションのコントロールのテキストは取得できない。(Unicode)
%group
Win32 user32
%prm
hWnd, lpString, nMaxCount
hWnd : [intptr] 型: HWND テキストを含むウィンドウまたはコントロールへのハンドル。
lpString : [wstr] 型: LPTSTR テキストを受け取るバッファ。文字列がバッファと同じかそれ以上の長さの場合、文字列は切り詰められて NULL 文字で終端される。
nMaxCount : [int] 型: int NULL 文字を含め、バッファにコピーする最大文字数。テキストがこの制限を超える場合は切り詰められる。
%inst

指定したウィンドウのタイトルバーテキスト(タイトルバーがある場合)をバッファにコピーする。指定ウィンドウがコントロールの場合、そのコントロールのテキストがコピーされる。ただし
GetWindowText は別アプリケーションのコントロールのテキストは取得できない。(Unicode)

[戻り値]
型: int 関数が成功した場合、戻り値はコピーされた文字列の長さ(終端 NULL
を含まない文字数)である。ウィンドウにタイトルバーが無いか、テキストが無いか、タイトルバーが空、またはウィンドウ/コントロールハンドルが無効な場合、戻り値はゼロである。拡張エラー情報を取得するには
GetLastError を呼ぶ。この関数は別アプリケーションのエディットコントロールのテキストを取得できない。

[備考]
対象ウィンドウが現在のプロセスの所有物である場合、GetWindowText はそのウィンドウまたはコントロールに WM_GETTEXT
メッセージを送る。対象ウィンドウが別プロセスに属し、キャプションを持つ場合、GetWindowText
はウィンドウキャプションのテキストを取得する。ウィンドウにキャプションが無い場合、戻り値は空文字列となる。これは設計上の動作で、対象ウィンドウのプロセスが応答しない場合でも呼び出し側アプリケーションが応答不能にならないようにするためである。ただし、対象ウィンドウが応答しない状態で、かつ呼び出し側アプリケーションに属する場合、GetWindowText
は呼び出し側アプリケーションを応答不能にする。別プロセスのコントロールのテキストを取得するには、GetWindowText を呼ぶ代わりに
WM_GETTEXT メッセージを直接送る。


%index
GetWindowTextLengthW
指定したウィンドウのタイトルバーテキストの長さ(文字数)を取得する(タイトルバーがある場合)。(Unicode)
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND ウィンドウまたはコントロールへのハンドル。
%inst
指定したウィンドウのタイトルバーテキストの長さ(文字数)を取得する(タイトルバーがある場合)。(Unicode)

[戻り値]
型: int
関数が成功した場合、戻り値はテキストの長さ(文字数)である。条件によってはこの値が実際のテキスト長より大きいことがある(備考参照)。ウィンドウにテキストが無い場合、戻り値はゼロである。関数の失敗は、戻り値がゼロかつ
GetLastError の結果が非ゼロであることで示される。 > [!NOTE] >
この関数は直近のエラー情報をクリアしない。成否を判定するには、まず SetLastError(0) で直近のエラー情報をクリアしてから
GetLastError を呼ぶ。

[備考]
対象ウィンドウが現在のプロセスの所有物である場合、GetWindowTextLength はそのウィンドウまたはコントロールに
WM_GETTEXTLENGTH メッセージを送る。特定条件下で、GetWindowTextLength
は実際のテキスト長より大きい値を返すことがある。これは ANSI と Unicode の混在時に、システムがテキスト中に DBCS
文字が存在する可能性を考慮するために発生する。ただし戻り値は常に実際の長さ以上になるため、バッファ確保の目安としては常に使える。この挙動は、アプリケーションが
Unicode を使う共通ダイアログと ANSI 関数を混在させるときに起こり得る。また、ANSI 版
GetWindowTextLength を Unicode のウィンドウプロシージャを持つウィンドウに、もしくは Unicode 版を
ANSI のウィンドウプロシージャを持つウィンドウに使うときにも起こる。ANSI と ANSI 関数の詳細は Conventions
for Function Prototypes を参照。テキストの正確な長さを得るには、WM_GETTEXT, LB_GETTEXT,
CB_GETLBTEXT メッセージや GetWindowText 関数を使う。
> [!NOTE] > winuser.h ヘッダは GetWindowTextLength を、UNICODE
プリプロセッサ定数の定義に応じて ANSI 版と Unicode
版を自動選択するエイリアスとして定義する。エンコーディングに依存するコードと、エンコーディング中立なエイリアスの混在は、コンパイルエラーや実行時エラーの原因となる。詳しくは
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetWindowThreadProcessId
指定したウィンドウを作成したスレッドの識別子を取得する。任意でウィンドウを作成したプロセスの識別子も取得できる。
%group
Win32 user32
%prm
hWnd, lpdwProcessId
hWnd : [intptr] 型: HWND ウィンドウへのハンドル。
lpdwProcessId : [var] 型: LPDWORD プロセス識別子を受け取る変数へのポインタ。NULL でなければ、GetWindowThreadProcessId はプロセス識別子をこの変数にコピーする。NULL の場合はコピーしない。関数が失敗した場合、この変数の値は変更されない。
%inst
指定したウィンドウを作成したスレッドの識別子を取得する。任意でウィンドウを作成したプロセスの識別子も取得できる。

[戻り値]
型: DWORD
関数が成功した場合、戻り値はウィンドウを作成したスレッドの識別子である。ウィンドウハンドルが無効な場合、戻り値はゼロである。拡張エラー情報を取得するには
GetLastError を呼ぶ。


%index
GetWindowWord
追加のウィンドウメモリ内の指定オフセットにある 16 ビット(**DWORD**)値を取得する。
%group
Win32 user32
%prm
hWnd, nIndex
hWnd : [intptr] ウィンドウへのハンドル。間接的にそのウィンドウが属するクラスも指す。
nIndex : [int] 
%inst
追加のウィンドウメモリ内の指定オフセットにある 16 ビット(**DWORD**)値を取得する。

[戻り値]
関数が成功した場合、戻り値は要求された値である。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
追加のウィンドウメモリは、RegisterClassEx で用いる WNDCLASSEX 構造体の cbWndExtra
メンバに非ゼロを指定して確保する。


%index
GrayStringW
GrayString 関数は指定位置にグレーのテキストを描画する。(Unicode)
%group
Win32 user32
%prm
hDC, hBrush, lpOutputFunc, lpData, nCount, X, Y, nWidth, nHeight
hDC : [intptr] デバイスコンテキストへのハンドル。
hBrush : [intptr] グレー化に用いるブラシへのハンドル。NULL の場合、ウィンドウテキストの描画に使われるのと同じブラシでテキストがグレー化される。
lpOutputFunc : [int] 文字列を描画するアプリケーション定義関数へのポインタ。文字列の描画に TextOut を使う場合は NULL ポインタを指定する。詳細は OutputProc コールバック関数を参照。
lpData : [intptr] 出力関数に渡すデータへのポインタ。lpOutputFunc が NULL の場合、lpData は出力する文字列へのポインタでなければならない。
nCount : [int] 出力する文字数。nCount が 0 の場合、GrayString は文字列長を計算する(lpData が文字列へのポインタであるとみなす)。nCount が 1 で lpOutputFunc が指す関数が FALSE を返す場合、イメージは表示されるがグレー化されない。
X : [int] 文字列を囲む矩形の開始位置のデバイス x 座標。
Y : [int] 文字列を囲む矩形の開始位置のデバイス y 座標。
nWidth : [int] 文字列を囲む矩形の幅(デバイス単位)。0 の場合、GrayString は領域の幅を計算する(lpData が文字列へのポインタであるとみなす)。
nHeight : [int] 文字列を囲む矩形の高さ(デバイス単位)。0 の場合、GrayString は領域の高さを計算する(lpData が文字列へのポインタであるとみなす)。
%inst
GrayString 関数は指定位置にグレーのテキストを描画する。(Unicode)

[戻り値]
文字列が描画された場合、戻り値は非ゼロである。TextOut
関数またはアプリケーション定義の出力関数がゼロを返した場合、あるいはグレー化用のメモリビットマップ作成に十分なメモリが無かった場合、戻り値はゼロである。

[備考]
GrayString
を呼び出すまでもなく、アプリケーションはソリッドグレー色をサポートするデバイス上でグレー化された文字列を描画できる。システム色
COLOR_GRAYTEXT は、無効テキストを描くのに使われるソリッドグレーのシステム色である。アプリケーションは
GetSysColor で COLOR_GRAYTEXT の色値を取得できる。色がゼロ(黒)以外なら SetTextColor
でその色に設定し、文字列を直接描画できる。取得した色が黒の場合、GrayString を呼び出してテキストをグレー化する必要がある。
> [!NOTE] > winuser.h ヘッダは GrayString を、UNICODE プリプロセッサ定数の定義に応じて ANSI
版と Unicode
版を自動選択するエイリアスとして定義する。エンコーディングに依存するコードと、エンコーディング中立なエイリアスの混在は、コンパイルエラーや実行時エラーの原因となる。詳しくは
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
HideCaret
キャレットを画面から消す。キャレットを隠してもその形状や挿入位置は失われない。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND キャレットを所有するウィンドウへのハンドル。NULL の場合、HideCaret は現在のタスクからキャレットを所有するウィンドウを検索する。
%inst
キャレットを画面から消す。キャレットを隠してもその形状や挿入位置は失われない。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
HideCaret は指定ウィンドウがキャレットを所有している場合にのみキャレットを隠す。所有していない場合、HideCaret
は何もせず FALSE を返す。非表示は累積される。HideCaret を連続 5 回呼んだ場合、キャレットを表示するには
ShowCaret を 5 回呼ぶ必要がある。例は Hiding a Caret を参照。


%index
HiliteMenuItem
メニューバー内の項目にハイライトを付加または削除する。
%group
Win32 user32
%prm
hWnd, hMenu, uIDHiliteItem, uHilite
hWnd : [intptr] 型: HWND メニューを含むウィンドウへのハンドル。
hMenu : [intptr] 型: HMENU 項目を含むメニューバーへのハンドル。
uIDHiliteItem : [int] 型: UINT メニュー項目。uHilite の値により、メニュー項目の識別子またはメニューバー内のオフセットとなる。
uHilite : [int] 型: UINT uItemHilite の解釈方法と、メニュー項目がハイライトされるかを制御する。MF_BYCOMMAND または MF_BYPOSITION のいずれかと、MF_HILITE または MF_UNHILITE の組み合わせでなければならない。
%inst
メニューバー内の項目にハイライトを付加または削除する。

[戻り値]
型: BOOL メニュー項目が指定したハイライト状態に設定された場合、戻り値は非ゼロである。そうでなければゼロである。

[備考]
MF_HILITE および MF_UNHILITE フラグは HiliteMenuItem 関数でのみ使用でき、ModifyMenu
関数では使用できない。


%index
IMPGetIMEA
(no summary)
%group
Win32 user32
%prm
param0, param1
param0 : [intptr] 
param1 : [var] 
%inst



%index
IMPGetIMEW
(no summary)
%group
Win32 user32
%prm
param0, param1
param0 : [intptr] 
param1 : [var] 
%inst



%index
IMPQueryIMEA
(no summary)
%group
Win32 user32
%prm
param0
param0 : [var] 
%inst



%index
IMPQueryIMEW
(no summary)
%group
Win32 user32
%prm
param0
param0 : [var] 
%inst



%index
IMPSetIMEA
(no summary)
%group
Win32 user32
%prm
param0, param1
param0 : [intptr] 
param1 : [var] 
%inst



%index
IMPSetIMEW
(no summary)
%group
Win32 user32
%prm
param0, param1
param0 : [intptr] 
param1 : [var] 
%inst



%index
ImpersonateDdeClientWindow
DDE サーバーアプリケーションが DDE クライアントアプリケーションのセキュリティコンテキストになりすませるようにする。これにより、認可されていない DDE クライアントから安全なサーバーデータを保護する。
%group
Win32 user32
%prm
hWndClient, hWndServer
hWndClient : [intptr] 型: HWND なりすます対象の DDE クライアントウィンドウへのハンドル。クライアントウィンドウは hWndServer で示されるサーバーウィンドウと DDE 会話を確立していなければならない。
hWndServer : [intptr] 型: HWND DDE サーバーウィンドウへのハンドル。アプリケーションはこの関数を呼ぶ前にサーバーウィンドウを作成しなければならない。
%inst
DDE サーバーアプリケーションが DDE
クライアントアプリケーションのセキュリティコンテキストになりすませるようにする。これにより、認可されていない DDE
クライアントから安全なサーバーデータを保護する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
アプリケーションは ImpersonateDdeClientWindow が設定したなりすましを解除するために RevertToSelf
関数を呼ぶべきである。DDEML アプリケーションでは DdeImpersonateClient
関数を使う。セキュリティに関する考慮事項:
本関数の誤用はプログラムのセキュリティを危うくする可能性がある。呼び出しの戻り値を必ず確認すること。何らかの理由で関数が失敗した場合、クライアントはなりすまされず、以降のクライアントからの要求は呼び出しプロセスのセキュリティコンテキストで実行される。呼び出しプロセスが
LocalSystem
や管理者グループのメンバのように高特権で動いている場合、ユーザーが本来許可されない操作を実行できる可能性がある。したがって、呼び出しが失敗したりエラーを発生させた場合はクライアント要求の実行を続けてはならない。


%index
InSendMessage
現在のウィンドウプロシージャが、(同じプロセス内または別プロセスの)別スレッドからの SendMessage 呼び出しで送られたメッセージを処理中かを判定する。
%group
Win32 user32
%prm

%inst
現在のウィンドウプロシージャが、(同じプロセス内または別プロセスの)別スレッドからの SendMessage
呼び出しで送られたメッセージを処理中かを判定する。

[戻り値]
型: BOOL ウィンドウプロシージャが SendMessage
により別スレッドから送られたメッセージを処理中の場合、戻り値は非ゼロである。そうでなければゼロである。


%index
InSendMessageEx
現在のウィンドウプロシージャが、(同じプロセス内または別プロセスの)別スレッドから送られたメッセージを処理中かを判定する。
%group
Win32 user32
%prm
lpReserved
lpReserved : [intptr] 型: LPVOID 予約。NULL でなければならない。
%inst
現在のウィンドウプロシージャが、(同じプロセス内または別プロセスの)別スレッドから送られたメッセージを処理中かを判定する。

[戻り値]
型: DWORD メッセージが送信されていない場合、戻り値は ISMEX_NOSEND (0x00000000)
である。そうでない場合、戻り値は次のいずれかの値(または複数の OR)である。
（以下省略）

[備考]
送信元がブロックされているかを判定するには、次のテストを使う: fBlocked = ( InSendMessageEx(NULL) &
(ISMEX_REPLIED|ISMEX_SEND) ) == ISMEX_SEND;


%index
InflateRect
InflateRect 関数は指定矩形の幅と高さを増減させる。
%group
Win32 user32
%prm
lprc, dx, dy
lprc : [var] サイズを増減させる RECT 構造体へのポインタ。
dx : [int] 矩形の幅を増減させる量。幅を減らす場合は負値を指定する。
dy : [int] 矩形の高さを増減させる量。高さを減らす場合は負値を指定する。
%inst
InflateRect 関数は指定矩形の幅と高さを増減させる。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]

アプリケーションは矩形をさまざまな目的で使えるため、矩形関数は明示的な測定単位を用いない。すべての矩形座標と寸法は符号付きの論理値で与えられる。マッピングモードと矩形が使われる関数によって測定単位が決まる。


%index
InheritWindowMonitor
(no summary)
%group
Win32 user32
%prm
hwnd, hwndInherit
hwnd : [intptr] 
hwndInherit : [intptr] 
%inst



%index
InitializeTouchInjection
呼び出しアプリケーションのタッチ注入コンテキストを構成し、同時注入可能な接触の最大数を初期化する。
%group
Win32 user32
%prm
maxCount, dwMode
maxCount : [int] 最大同時接触数。maxCount は 0 より大きく、winuser.h で定義される MAX_TOUCH_COUNT (256) 以下でなければならない。
dwMode : [int] 接触の可視化モード。dwMode は TOUCH_FEEDBACK_DEFAULT, TOUCH_FEEDBACK_INDIRECT, TOUCH_FEEDBACK_NONE のいずれかでなければならない。
%inst
呼び出しアプリケーションのタッチ注入コンテキストを構成し、同時注入可能な接触の最大数を初期化する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE である。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
TOUCH_FEEDBACK_DEFAULT
が設定されている場合、注入したタッチフィードバックはペンとタッチのコントロールパネルのユーザー設定で抑制されることがある。TOUCH_FEEDBACK_INDIRECT
が設定されている場合、注入したフィードバックはペンとタッチのコントロールパネルのユーザー設定より優先される。TOUCH_FEEDBACK_INDIRECT
または TOUCH_FEEDBACK_NONE
が設定されている場合、アプリケーションやコントロールが提供するタッチフィードバックは影響を受けない可能性がある。


%index
InjectSyntheticPointerInput
ポインタ入力(ペンまたはタッチ)をシミュレートする。
%group
Win32 user32
%prm
device, pointerInfo, count
device : [intptr] CreateSyntheticPointerDevice で作成したポインタ注入デバイスへのハンドル。
pointerInfo : [var] 注入するポインタを表す [POINTER_TYPE_INFO](ns-winuser-pointer_type_info.md) 構造体の配列。型は、注入デバイスを作成した CreateSyntheticPointerDevice 呼び出しの pointerType パラメータと一致していなければならない。
count : [int] 接触の数。
%inst
ポインタ入力(ペンまたはタッチ)をシミュレートする。

[戻り値]
関数が成功した場合、TRUE を返す。失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
関数を呼ぶ。


%index
InjectTouchInput
タッチ入力をシミュレートする。
%group
Win32 user32
%prm
count, contacts
count : [int] contacts 配列のサイズ。count の最大値は InitializeTouchInjection 関数の maxCount パラメータで指定される。
contacts : [var] デスクトップ上のすべての接触を表す POINTER_TOUCH_INFO 構造体の配列。各接触の画面座標はデスクトップの範囲内でなければならない。
%inst
タッチ入力をシミュレートする。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
注入された入力は、注入プロセスが実行されているセッションのデスクトップに送られる。タッチ入力注入には 2
つの入力状態(インタラクティブとホバー)があり、contacts 内の pointerFlags の組み合わせで示される。
（以下省略)


%index
InsertMenuW
新しいメニュー項目をメニューに挿入し、他の項目をメニュー内で下にずらす。(Unicode)
%group
Win32 user32
%prm
hMenu, uPosition, uFlags, uIDNewItem, lpNewItem
hMenu : [intptr] 型: HMENU 変更するメニューへのハンドル。
uPosition : [int] 型: UINT 新しいメニュー項目を挿入する直前(基準)のメニュー項目。uFlags によって解釈が変わる。
uFlags : [int] 型: UINT uPosition の解釈と、新しいメニュー項目の内容・外観・動作を制御する。次の必須値のいずれかを含まなければならない。
uIDNewItem : [int] 型: UINT_PTR 新しいメニュー項目の識別子。uFlags に MF_POPUP フラグが設定されている場合は、ドロップダウンメニューまたはサブメニューへのハンドルとする。
lpNewItem : [wstr] 型: LPCTSTR 新しいメニュー項目の内容。lpNewItem の解釈は、uFlags に MF_BITMAP, MF_OWNERDRAW, MF_STRING のどれが含まれるかによって異なる。
%inst
新しいメニュー項目をメニューに挿入し、他の項目をメニュー内で下にずらす。(Unicode)

[戻り値]
型: BOOL 関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
メニューに変更があった場合、そのメニューが表示されているウィンドウにあるか否かにかかわらず、アプリケーションは DrawMenuBar
を呼び出さなければならない。次のフラグ群は併用できない。
（以下省略）


%index
InsertMenuItemW
メニュー内の指定位置に新しいメニュー項目を挿入する。(Unicode)
%group
Win32 user32
%prm
hmenu, item, fByPosition, lpmi
hmenu : [intptr] 型: HMENU 新しいメニュー項目を挿入するメニューへのハンドル。
item : [int] 型: UINT 新しい項目を挿入する位置の直後(基準)となるメニュー項目の識別子または位置。解釈は fByPosition の値による。
fByPosition : [int] 型: BOOL item の解釈を制御する。FALSE の場合、item はメニュー項目識別子として扱われる。そうでない場合はメニュー項目の位置として扱われる。詳しくは「プログラムからメニュー項目にアクセスする」を参照。
lpmi : [var] 型: LPCMENUITEMINFO 新しいメニュー項目の情報を含む MENUITEMINFO 構造体へのポインタ。
%inst
メニュー内の指定位置に新しいメニュー項目を挿入する。(Unicode)

[戻り値]
型: BOOL 関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報を取得するには
GetLastError 関数を使用する。

[備考]
メニューに変更があった場合、そのメニューが表示されているウィンドウにあるか否かにかかわらず、アプリケーションは DrawMenuBar
を呼び出さなければならない。ビットマップまたはオーナー描画のメニュー項目でキーボードアクセラレータを使うには、メニューの所有者が
WM_MENUCHAR メッセージを処理する必要がある。詳細は Owner-Drawn Menus と WM_MENUCHAR
メッセージを参照。


%index
InternalGetWindowText
指定したウィンドウのタイトルバーテキスト(タイトルバーがある場合)をバッファにコピーする。
%group
Win32 user32
%prm
hWnd, pString, cchMaxCount
hWnd : [intptr] 型: HWND テキストを含むウィンドウまたはコントロールへのハンドル。
pString : [wstr] 型: LPWSTR テキストを受け取るバッファ。文字列がバッファと同じかそれ以上の長さの場合、文字列は切り詰められて NULL 文字で終端される。
cchMaxCount : [int] 型: int NULL 文字を含め、バッファにコピーする最大文字数。テキストがこの制限を超える場合は切り詰められる。
%inst
指定したウィンドウのタイトルバーテキスト(タイトルバーがある場合)をバッファにコピーする。

[戻り値]
型: int 関数が成功した場合、戻り値はコピーされた文字列の長さ(終端 NULL
を含まない文字数)である。ウィンドウにタイトルバーが無いか、テキストが無いか、タイトルバーが空、またはウィンドウ/コントロールハンドルが無効な場合、戻り値はゼロである。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
この関数は Windows XP Service Pack 1 (SP1) および Windows Server 2003 まで SDK
のヘッダとインポートライブラリに含まれていなかった。該当ヘッダとインポートライブラリを持っていない場合、LoadLibrary と
GetProcAddress を使って関数を呼び出せる。


%index
IntersectRect
IntersectRect 関数は 2 つのソース矩形の積(共通部分)を計算し、積の矩形の座標を宛先矩形に格納する。
%group
Win32 user32
%prm
lprcDst, lprcSrc1, lprcSrc2
lprcDst : [var] lprcSrc1 と lprcSrc2 が指す矩形の積(共通部分)を受け取る RECT 構造体へのポインタ。このパラメータは NULL にできない。
lprcSrc1 : [var] 最初のソース矩形を含む RECT 構造体へのポインタ。
lprcSrc2 : [var] 2 番目のソース矩形を含む RECT 構造体へのポインタ。
%inst
IntersectRect 関数は 2 つのソース矩形の積(共通部分)を計算し、積の矩形の座標を宛先矩形に格納する。

[戻り値]
矩形が交差する場合、戻り値は非ゼロである。矩形が交差しない場合、戻り値はゼロである。

[備考]

アプリケーションは矩形をさまざまな目的で使えるため、矩形関数は明示的な測定単位を用いない。すべての矩形座標と寸法は符号付きの論理値で与えられる。マッピングモードと矩形が使われる関数によって測定単位が決まる。


%index
InvalidateRect
InvalidateRect 関数は、指定ウィンドウの更新領域に矩形を追加する。更新領域は、再描画が必要なクライアント領域の一部を表す。
%group
Win32 user32
%prm
hWnd, lpRect, bErase
hWnd : [intptr] 更新領域が変化したウィンドウへのハンドル。NULL の場合、システムは当該アプリケーションだけでなくすべてのウィンドウを無効化して再描画し、関数の戻る前に WM_ERASEBKGND と WM_NCPAINT メッセージを送る。このパラメータを NULL に設定することは推奨されない。
lpRect : [var] 更新領域に追加する矩形のクライアント座標を含む RECT 構造体へのポインタ。NULL の場合、クライアント領域全体が更新領域に追加される。
bErase : [int] 更新領域の処理時に、領域内の背景を消去するかを指定する。TRUE の場合、BeginPaint が呼ばれたときに背景が消去される。FALSE の場合、背景は変更されない。
%inst
InvalidateRect 関数は、指定ウィンドウの更新領域に矩形を追加する。更新領域は、再描画が必要なクライアント領域の一部を表す。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
無効化された領域は、次の WM_PAINT メッセージが処理されるか、ValidateRect または ValidateRgn
で検証されるまで更新領域に蓄積される。ウィンドウの更新領域が空でなく、かつそのウィンドウ向けの他のメッセージがアプリケーションキューに無いとき、システムはそのウィンドウに
WM_PAINT メッセージを送る。bErase が更新領域のいずれかの部分で TRUE
の場合、指定部分だけでなく領域全体の背景が消去される。


%index
InvalidateRgn
InvalidateRgn 関数は指定された領域内のクライアント領域を、ウィンドウの現在の更新領域に追加することで無効化する。
%group
Win32 user32
%prm
hWnd, hRgn, bErase
hWnd : [intptr] 更新領域を修正するウィンドウへのハンドル。
hRgn : [intptr] 更新領域に追加するリージョンへのハンドル。このリージョンはクライアント座標とみなされる。NULL の場合、クライアント領域全体が更新領域に追加される。
bErase : [int] 更新領域の処理時に、領域内の背景を消去するかを指定する。TRUE の場合、BeginPaint が呼ばれたときに背景が消去される。FALSE の場合、背景は変更されない。
%inst
InvalidateRgn 関数は指定された領域内のクライアント領域を、ウィンドウの現在の更新領域に追加することで無効化する。

[戻り値]
戻り値は常に 0 以外となる。

[備考]
無効化された領域は、次の WM_PAINT メッセージが処理されるか、ValidateRect または ValidateRgn
で検証されるまで更新領域に蓄積される。ウィンドウの更新領域が空でなく、かつそのウィンドウ向けの他のメッセージがアプリケーションキューに無いとき、システムはそのウィンドウに
WM_PAINT メッセージを送る。指定リージョンはリージョン関数のいずれかを用いて作成されたものでなければならない。bErase
が更新領域のいずれかの部分で TRUE の場合、指定部分だけでなく領域全体の背景が消去される。


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


%index
IsCharAlphaW
文字がアルファベットかを判定する。セットアップまたはコントロールパネルでユーザが選択した言語のセマンティクスに基づいて判定される。(Unicode)
%group
Win32 user32
%prm
ch
ch : [int] 型: TCHAR 検査する文字。
%inst

文字がアルファベットかを判定する。セットアップまたはコントロールパネルでユーザが選択した言語のセマンティクスに基づいて判定される。(Unicode)

[戻り値]
型: BOOL 文字がアルファベットの場合、戻り値は 0 以外となる。アルファベットでない場合、戻り値は 0
となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
> [!NOTE] > winuser.h ヘッダは IsCharAlpha を UNICODE プリプロセッサ定数の定義に基づいて
ANSI/Unicode 版を自動選択するエイリアスとして定義する。


%index
IsCharAlphaNumericW
文字がアルファベットまたは数字であるかを判定する。セットアップまたはコントロールパネルでユーザが選択した言語のセマンティクスに基づいて判定される。(Unicode)
%group
Win32 user32
%prm
ch
ch : [int] 型: TCHAR 検査する文字。
%inst

文字がアルファベットまたは数字であるかを判定する。セットアップまたはコントロールパネルでユーザが選択した言語のセマンティクスに基づいて判定される。(Unicode)

[戻り値]
型: BOOL 文字が英数字の場合、戻り値は 0 以外となる。英数字でない場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
> [!NOTE] > winuser.h ヘッダは IsCharAlphaNumeric を UNICODE
プリプロセッサ定数の定義に基づいて ANSI/Unicode 版を自動選択するエイリアスとして定義する。


%index
IsCharLowerW
(no summary)
%group
Win32 user32
%prm
ch
ch : [int] 型: TCHAR 検査する文字。
%inst


[戻り値]
型: BOOL 文字が小文字の場合、戻り値は 0 以外。それ以外の場合は 0。

[備考]
IsCharLower の Unicode 版。文字が小文字であるかどうかを判定する。


%index
IsCharUpperW
文字が大文字かを判定する。セットアップまたはコントロールパネルでユーザが選択した言語のセマンティクスに基づいて判定される。(Unicode)
%group
Win32 user32
%prm
ch
ch : [int] 型: TCHAR 検査する文字。
%inst

文字が大文字かを判定する。セットアップまたはコントロールパネルでユーザが選択した言語のセマンティクスに基づいて判定される。(Unicode)

[戻り値]
型: BOOL 文字が大文字の場合、戻り値は 0 以外となる。大文字でない場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
> [!NOTE] > winuser.h ヘッダは IsCharUpper を UNICODE プリプロセッサ定数の定義に基づいて
ANSI/Unicode 版を自動選択するエイリアスとして定義する。


%index
IsChild
ウィンドウが指定された親ウィンドウの子ウィンドウまたは子孫ウィンドウであるかを判定する。
%group
Win32 user32
%prm
hWndParent, hWnd
hWndParent : [intptr] 型: HWND 親ウィンドウへのハンドル。
hWnd : [intptr] 型: HWND 検査するウィンドウへのハンドル。
%inst
ウィンドウが指定された親ウィンドウの子ウィンドウまたは子孫ウィンドウであるかを判定する。

[戻り値]
型: BOOL ウィンドウが指定親ウィンドウの子または子孫ウィンドウの場合、戻り値は 0 以外となる。そうでない場合、戻り値は 0
となる。


%index
IsClipboardFormatAvailable
クリップボードが指定形式のデータを含むかを判定する。
%group
Win32 user32
%prm
format
format : [int] 型: UINT 標準または登録済みのクリップボード形式。標準クリップボード形式の説明については「標準クリップボード形式」を参照。
%inst
クリップボードが指定形式のデータを含むかを判定する。

[戻り値]
型: BOOL クリップボード形式が利用可能な場合、戻り値は 0 以外となる。そうでない場合、戻り値は 0
となる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
通常、1 つのクリップボード形式のみを認識するアプリケーションは、WM_INITMENU または WM_INITMENUPOPUP
メッセージの処理時にこの関数を呼ぶ。アプリケーションは戻り値に応じて貼り付けメニュー項目を有効化または無効化する。


%index
IsDialogMessageW
メッセージが指定ダイアログ宛てかを判定し、そうである場合はメッセージを処理する。(Unicode)
%group
Win32 user32
%prm
hDlg, lpMsg
hDlg : [intptr] 型: HWND ダイアログへのハンドル。
lpMsg : [var] 型: LPMSG 検査するメッセージを含む MSG 構造体へのポインタ。
%inst
メッセージが指定ダイアログ宛てかを判定し、そうである場合はメッセージを処理する。(Unicode)

[戻り値]
型: BOOL メッセージが処理された場合、戻り値は 0 以外となる。処理されなかった場合、戻り値は 0 となる。

[備考]
IsDialogMessage
関数はモードレスダイアログを対象とするが、コントロールを含む任意のウィンドウで使用して、ダイアログと同じキーボード選択を提供できる。IsDialogMessage
がメッセージを処理するとき、キーボードメッセージを検査し対応するダイアログの選択に変換する。IsDialogMessage
で処理されたメッセージを TranslateMessage や DispatchMessage に渡してはならない。


%index
IsDlgButtonChecked
IsDlgButtonChecked 関数はボタンコントロールがチェックされているか、または 3 状態ボタンコントロールがチェック/非チェック/不定のいずれであるかを判定する。
%group
Win32 user32
%prm
hDlg, nIDButton
hDlg : [intptr] 型: HWND ボタンコントロールを含むダイアログへのハンドル。
nIDButton : [int] 型: int ボタンコントロールの識別子。
%inst
IsDlgButtonChecked 関数はボタンコントロールがチェックされているか、または 3
状態ボタンコントロールがチェック/非チェック/不定のいずれであるかを判定する。

[戻り値]
型: UINT
BS_AUTOCHECKBOX、BS_AUTORADIOBUTTON、BS_AUTO3STATE、BS_CHECKBOX、BS_RADIOBUTTON、BS_3STATE
で作成されたボタンの戻り値は次表のいずれかとなる。その他のスタイルの場合、戻り値は 0。
（以下省略）

[備考]
IsDlgButtonChecked 関数は指定ボタンコントロールに BM_GETCHECK メッセージを送る。


%index
IsGUIThread
呼び出しスレッドが既に GUI スレッドかを判定する。任意でスレッドを GUI スレッドに変換することもできる。
%group
Win32 user32
%prm
bConvert
bConvert : [int] 型: BOOL TRUE でスレッドが GUI スレッドでない場合、GUI スレッドに変換する。
%inst
呼び出しスレッドが既に GUI スレッドかを判定する。任意でスレッドを GUI スレッドに変換することもできる。

[戻り値]
型: BOOL 次の状況では 0 以外を返す。
（以下省略）


%index
IsHungAppWindow
指定されたアプリケーションが応答していないとシステムが判断しているかを調べる。
%group
Win32 user32
%prm
hwnd
hwnd : [intptr] 型: HWND 検査するウィンドウへのハンドル。
%inst
指定されたアプリケーションが応答していないとシステムが判断しているかを調べる。

[戻り値]
型: BOOL ウィンドウが応答しなくなっている場合は TRUE、そうでない場合は FALSE。ゴーストウィンドウは常に TRUE
を返す。

[備考]
Windows のタイムアウト基準 5 秒は変更される可能性がある。この関数は Windows XP SP1 および Windows
Server 2003 まで SDK ヘッダとライブラリに含まれていなかった。


%index
IsIconic
指定されたウィンドウが最小化(アイコン化)されているかを判定する。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND 検査するウィンドウへのハンドル。
%inst
指定されたウィンドウが最小化(アイコン化)されているかを判定する。

[戻り値]
型: BOOL ウィンドウがアイコン化されている場合、戻り値は 0 以外となる。そうでない場合、戻り値は 0 となる。


%index
IsImmersiveProcess
プロセスが Windows ストアアプリに属するかを判定する。
%group
Win32 user32
%prm
hProcess
hProcess : [intptr] 対象プロセスのハンドル。
%inst
プロセスが Windows ストアアプリに属するかを判定する。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには GetLastError
を呼ぶ。


%index
IsMenu
ハンドルがメニューハンドルかを判定する。
%group
Win32 user32
%prm
hMenu
hMenu : [intptr] 型: HMENU 検査するハンドル。
%inst
ハンドルがメニューハンドルかを判定する。

[戻り値]
型: BOOL ハンドルがメニューハンドルの場合、戻り値は 0 以外となる。そうでない場合、戻り値は 0 となる。


%index
IsMouseInPointerEnabled
マウスをポインタ入力デバイスとして動作させ WM_POINTER メッセージを送るために EnableMouseInPointer が設定されているかを示す。
%group
Win32 user32
%prm

%inst
マウスをポインタ入力デバイスとして動作させ WM_POINTER メッセージを送るために EnableMouseInPointer
が設定されているかを示す。

[戻り値]
EnableMouseInPointer が設定されている場合、戻り値は 0 以外。そうでない場合、戻り値は 0。

[備考]
EnableMouseInPointer はプロセスの存続期間中に 1 回しか呼び出せない。


%index
IsProcessDPIAware
IsProcessDPIAware は変更または利用不可になる可能性がある。代わりに GetProcessDPIAwareness を使用する。
%group
Win32 user32
%prm

%inst
IsProcessDPIAware は変更または利用不可になる可能性がある。代わりに GetProcessDPIAwareness
を使用する。

[戻り値]
型: BOOL プロセスが DPI 認識ならば TRUE、そうでなければ FALSE。


%index
IsRectEmpty
IsRectEmpty 関数は指定された矩形が空であるかを判定する。
%group
Win32 user32
%prm
lprc
lprc : [var] 矩形の論理座標を含む RECT 構造体へのポインタ。
%inst
IsRectEmpty 関数は指定された矩形が空であるかを判定する。

[戻り値]
矩形が空の場合、戻り値は 0 以外となる。空でない場合、戻り値は 0 となる。

[備考]

アプリケーションは矩形をさまざまな用途に使えるため、矩形関数は明示的な測定単位を用いない。すべての矩形座標と寸法は符号付きの論理値で与えられる。


%index
IsTouchWindow
指定されたウィンドウがタッチ対応かを調べ、任意でタッチ機能の修飾フラグも取得する。
%group
Win32 user32
%prm
hwnd, pulFlags
hwnd : [intptr] ウィンドウのハンドル。呼び出しスレッドが指定ウィンドウと同じデスクトップにない場合、関数は ERROR_ACCESS_DENIED で失敗する。
pulFlags : [var] 指定ウィンドウのタッチ機能の修飾フラグを受け取る ULONG 変数のアドレス。
%inst
指定されたウィンドウがタッチ対応かを調べ、任意でタッチ機能の修飾フラグも取得する。

[戻り値]
ウィンドウが Windows タッチをサポートする場合は TRUE、サポートしない場合は FALSE を返す。

[備考]
次表は pulFlags 出力パラメータの値を示す。
（以下省略）


%index
IsValidDpiAwarenessContext
指定された DPI_AWARENESS_CONTEXT が有効で現在のシステムでサポートされているかを判定する。
%group
Win32 user32
%prm
value
value : [intptr] サポートされているかどうかを判定したいコンテキスト。
%inst
指定された DPI_AWARENESS_CONTEXT が有効で現在のシステムでサポートされているかを判定する。

[戻り値]
指定コンテキストがサポートされている場合は TRUE、そうでない場合は FALSE。

[備考]
IsValidDpiAwarenessContext は指定された DPI_AWARENESS_CONTEXT
の妥当性を判定する。SetThreadDpiAwarenessContext
で使用する前にコンテキストが有効かを確認すべきである。入力値が NULL の場合は無効なコンテキストとみなされ、FALSE を返す。


%index
IsWinEventHookInstalled
指定されたイベントを通知される WinEvent フックがインストールされているかを判定する。
%group
Win32 user32
%prm
event
event : [int] 
%inst
指定されたイベントを通知される WinEvent フックがインストールされているかを判定する。

[戻り値]
型: BOOL 指定イベントを通知されるフックがある場合、戻り値は TRUE。ない場合、戻り値は FALSE。

[備考]
このメソッドは偽陰性を返さないことが保証されている。FALSE
を返した場合、システム内のどのフックもそのイベントを通知しないことを意味する。


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
IsWindowArranged
指定されたウィンドウが arranged(スナップされている)かを判定する。
%group
Win32 user32
%prm
hwnd
hwnd : [intptr] 型: HWND 検査するウィンドウへのハンドル。
%inst
指定されたウィンドウが arranged(スナップされている)かを判定する。

[戻り値]
型: BOOL ウィンドウが arranged の場合は 0 以外、そうでない場合は 0。

[備考]
現時点でこの関数には関連ヘッダファイルもライブラリファイルもない。アプリケーションは LoadLibrary を DLL 名
(User32.dll) で呼んでモジュールハンドルを取得し、GetProcAddress
でこの関数のアドレスを取得できる。スナップされたウィンドウは arranged と見なされる。arranged は maximize
と同様のウィンドウ状態として扱うべきである。arranged、maximize、minimize は相互に排他的な状態である。


%index
IsWindowEnabled
指定されたウィンドウがマウスおよびキーボード入力に対して有効かを判定する。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND 検査するウィンドウへのハンドル。
%inst
指定されたウィンドウがマウスおよびキーボード入力に対して有効かを判定する。

[戻り値]
型: BOOL ウィンドウが有効な場合、戻り値は 0 以外。そうでない場合は 0。

[備考]
子ウィンドウは有効でかつ可視の場合にのみ入力を受け取る。


%index
IsWindowUnicode
指定されたウィンドウがネイティブ Unicode ウィンドウかを判定する。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND 検査するウィンドウへのハンドル。
%inst
指定されたウィンドウがネイティブ Unicode ウィンドウかを判定する。

[戻り値]
型: BOOL ウィンドウがネイティブ Unicode ウィンドウの場合、戻り値は 0 以外。そうでない場合、戻り値は 0 でネイティブ
ANSI ウィンドウであることを示す。

[備考]
ウィンドウの文字セットは RegisterClass 関数の使用によって決まる。ANSI 版 (RegisterClassA)
で登録された場合は ANSI、Unicode 版 (RegisterClassW) の場合は Unicode
となる。システムはウィンドウメッセージに対して Unicode/ANSI の自動双方向変換を行う。


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
IsWow64Message
現在のスレッドのキューから最後に読み取られたメッセージが WOW64 プロセスから発信されたかを判定する。
%group
Win32 user32
%prm

%inst
現在のスレッドのキューから最後に読み取られたメッセージが WOW64 プロセスから発信されたかを判定する。

[戻り値]
現在のスレッドのキューから最後に読み取られたメッセージが WOW64 プロセスから発信された場合は TRUE、そうでない場合は FALSE
を返す。

[備考]
この関数は、ポインタ依存データを含むデータ構造に関連付けられたプライベートメッセージを 32
ビットクライアントアプリケーションから受け取る 64 ビットネイティブアプリケーションを開発するのに役立つ。


%index
IsZoomed
ウィンドウが最大化されているかを判定する。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND 検査するウィンドウへのハンドル。
%inst
ウィンドウが最大化されているかを判定する。

[戻り値]
型: BOOL ウィンドウがズーム(最大化)されている場合、戻り値は 0 以外。そうでない場合は 0。


%index
KillTimer
指定されたタイマを破棄する。
%group
Win32 user32
%prm
hWnd, uIDEvent
hWnd : [intptr] 型: HWND 指定タイマに関連付けられたウィンドウへのハンドル。SetTimer に渡した hWnd と同じでなければならない。
uIDEvent : [int] 型: UINT_PTR 破棄するタイマ。SetTimer に渡されたウィンドウハンドルが有効な場合、SetTimer に渡した nIDEvent と同じでなければならない。hWnd が NULL だった場合は SetTimer が返したタイマ識別子を指定する。
%inst
指定されたタイマを破棄する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外となる。失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
KillTimer 関数はメッセージキューに既にポストされている WM_TIMER メッセージを削除しない。


%index
LoadAcceleratorsW
指定されたアクセラレータテーブルを読み込む。(Unicode)
%group
Win32 user32
%prm
hInstance, lpTableName
hInstance : [intptr] 型: HINSTANCE 読み込むアクセラレータテーブルを実行ファイルに含むモジュールへのハンドル。
lpTableName : [wstr] 型: LPCTSTR 読み込むアクセラレータテーブルの名前。またはアクセラレータテーブルリソースのリソース識別子を下位ワード、上位ワードを 0 として指定してもよい。
%inst
指定されたアクセラレータテーブルを読み込む。(Unicode)

[戻り値]
型: HACCEL 関数が成功した場合、戻り値は読み込まれたアクセラレータテーブルへのハンドル。失敗した場合、戻り値は
NULL。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]

アクセラレータテーブルがまだ読み込まれていない場合、関数はそれを指定された実行ファイルから読み込む。リソースから読み込まれたアクセラレータテーブルはアプリケーション終了時に自動的に解放される。


%index
LoadBitmapW
LoadBitmap 関数は指定されたビットマップリソースをモジュールの実行ファイルから読み込む。(Unicode)
%group
Win32 user32
%prm
hInstance, lpBitmapName
hInstance : [intptr] 読み込むビットマップを実行ファイルに含むモジュールのインスタンスへのハンドル。
lpBitmapName : [wstr] 読み込むビットマップリソースの名前を含む null 終端文字列へのポインタ。または下位ワードにリソース識別子、上位ワードに 0 を指定してもよい。
%inst
LoadBitmap 関数は指定されたビットマップリソースをモジュールの実行ファイルから読み込む。(Unicode)

[戻り値]
関数が成功した場合、戻り値は指定ビットマップへのハンドル。失敗した場合、戻り値は NULL。

[備考]
lpBitmapName が指すビットマップが存在しないか、読み込むためのメモリが不足している場合、関数は失敗する。LoadBitmap
はディスプレイ互換のビットマップを作成するため、プリンタに選択できない。


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
LoadCursorFromFileW
ファイルに含まれるデータに基づいてカーソルを作成する。(Unicode)
%group
Win32 user32
%prm
lpFileName
lpFileName : [wstr] 型: LPCTSTR カーソルの作成に使用するファイルデータのソース。ファイル内のデータは .CUR または .ANI 形式でなければならない。
%inst
ファイルに含まれるデータに基づいてカーソルを作成する。(Unicode)

[戻り値]
型: HCURSOR 関数が成功した場合、戻り値は新しいカーソルへのハンドル。失敗した場合、戻り値は
NULL。拡張エラー情報を取得するには GetLastError を呼ぶ。
（以下省略）

[備考]
DPI 仮想化: この API は DPI 仮想化に参加しない。出力は呼び出しスレッドの DPI の影響を受けない。


%index
LoadIconW
アプリケーションインスタンスに関連付けられた実行ファイルから指定のアイコンリソースを読み込む。(Unicode)
%group
Win32 user32
%prm
hInstance, lpIconName
hInstance : [intptr] 型: HINSTANCE 読み込むアイコンを実行ファイルに含むモジュールのインスタンスへのハンドル。標準アイコンを読み込む場合は NULL。
lpIconName : [wstr] 型: LPCTSTR 読み込むアイコンリソースの名前。または下位ワードにリソース識別子、上位ワードに 0 を指定する。MAKEINTRESOURCE マクロを使用する。
%inst
アプリケーションインスタンスに関連付けられた実行ファイルから指定のアイコンリソースを読み込む。(Unicode)

[戻り値]
型: HICON 関数が成功した場合、戻り値は新しく読み込まれたアイコンへのハンドル。失敗した場合、戻り値は
NULL。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
LoadIcon
は未読み込みのアイコンリソースのみ読み込む。既に読み込まれている場合は既存リソースへのハンドルを取得する。LoadIcon は
SM_CXICON と SM_CYICON のシステムメトリック値に合致するサイズのアイコンしか読み込めない。他のサイズは
LoadImage を使用する。


%index
LoadImageW
アイコン、カーソル、アニメーションカーソル、またはビットマップを読み込む。(Unicode)
%group
Win32 user32
%prm
hInst, name, type, cx, cy, fuLoad
hInst : [intptr] 型: HINSTANCE 読み込むイメージを含む DLL または実行ファイルのモジュールへのハンドル。OEM イメージを読み込むには NULL を設定する。スタンドアロンリソース(アイコン、カーソル、ビットマップファイル)を読み込むにも NULL を設定する。
name : [wstr] 型: LPCTSTR 読み込むイメージ。hinst が非 NULL かつ fuLoad に LR_LOADFROMFILE が含まれない場合、lpszName は hinst モジュール内のイメージリソースを指定する。
type : [int] 型: UINT
cx : [int] 型: int アイコンまたはカーソルの幅(ピクセル単位)。0 で fuLoad が LR_DEFAULTSIZE の場合、SM_CXICON または SM_CXCURSOR システムメトリック値が使用される。0 で LR_DEFAULTSIZE が使われない場合は実際のリソース幅が使用される。
cy : [int] 型: int アイコンまたはカーソルの高さ(ピクセル単位)。
fuLoad : [int] 型: UINT
%inst
アイコン、カーソル、アニメーションカーソル、またはビットマップを読み込む。(Unicode)

[戻り値]
型: HANDLE 関数が成功した場合、戻り値は新しく読み込まれたイメージのハンドル。失敗した場合、戻り値は
NULL。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
IS_INTRESOURCE(lpszName) が TRUE ならば lpszName は整数識別子を指す。そうでなければ null
終端文字列へのポインタ。LR_SHARED
フラグを指定せずに読み込んだビットマップ、カーソル、アイコンの使用を終えたら、対応する関数で解放する必要がある。


%index
LoadKeyboardLayoutW
新しい入力ロケール識別子(以前はキーボードレイアウトと呼ばれていた)をシステムに読み込む。(Unicode)
%group
Win32 user32
%prm
pwszKLID, Flags
pwszKLID : [wstr] 型: LPCTSTR 読み込む入力ロケール識別子の名前。この名前は言語識別子の 16 進値(下位ワード)とデバイス識別子(上位ワード)で構成される文字列。例えば米国英語は 0x0409 なので主要米国英語レイアウト名は「00000409」となる。
Flags : [int] 型: UINT
%inst
新しい入力ロケール識別子(以前はキーボードレイアウトと呼ばれていた)をシステムに読み込む。(Unicode)

[戻り値]
型: HKL 関数が成功した場合、戻り値は pwszKLID
で指定された名前に対応する入力ロケール識別子。一致するロケールがない場合は既定の言語。関数が失敗した場合、戻り値は NULL。

[備考]
入力ロケール識別子はキーボードレイアウトより広い概念で、音声テキスト変換器、IME、その他の入力形式も包含する。


%index
LoadMenuW
アプリケーションインスタンスに関連付けられた実行ファイルから指定のメニューリソースを読み込む。(Unicode)
%group
Win32 user32
%prm
hInstance, lpMenuName
hInstance : [intptr] 型: HINSTANCE 読み込むメニューリソースを含むモジュールへのハンドル。
lpMenuName : [wstr] 型: LPCTSTR メニューリソースの名前。または下位ワードにリソース識別子、上位ワードに 0 を指定してもよい。MAKEINTRESOURCE マクロを使用する。
%inst
アプリケーションインスタンスに関連付けられた実行ファイルから指定のメニューリソースを読み込む。(Unicode)

[戻り値]
型: HMENU 関数が成功した場合、戻り値はメニューリソースへのハンドル。失敗した場合、戻り値は NULL。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
アプリケーション終了前に DestroyMenu 関数を使ってメニューを破棄し、読み込まれたメニューが占有していたメモリを解放する。


%index
LoadMenuIndirectW
メモリ上の指定メニューテンプレートを読み込む。(Unicode)
%group
Win32 user32
%prm
lpMenuTemplate
lpMenuTemplate : [intptr] 型: const MENUTEMPLATE* メニューテンプレートまたは拡張メニューテンプレートへのポインタ。
%inst
メモリ上の指定メニューテンプレートを読み込む。(Unicode)

[戻り値]
型: HMENU 関数が成功した場合、戻り値はメニューへのハンドル。失敗した場合、戻り値は NULL。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
ANSI 版と Unicode 版いずれの関数でも、MENUITEMTEMPLATE 構造体内の文字列は Unicode
文字列でなければならない。


%index
LoadStringW
指定モジュールに関連付けられた実行ファイルから文字列リソースを読み込み、バッファにコピーし、終端 null 文字を付加する。(Unicode)
%group
Win32 user32
%prm
hInstance, uID, lpBuffer, cchBufferMax
hInstance : [intptr] 型: HINSTANCE 文字列リソースを実行ファイルに含むモジュールのインスタンスへのハンドル。アプリケーション自身へのハンドルを得るには GetModuleHandle を NULL で呼ぶ。
uID : [int] 型: UINT 読み込む文字列の識別子。
lpBuffer : [wstr] 型: LPTSTR 文字列を受け取るバッファ(cchBufferMax が非ゼロの場合)、または文字列リソース自体への読み取り専用ポインタ(cchBufferMax が 0 の場合)。ポインタを保持するのに十分な長さ(8 バイト)が必要。
cchBufferMax : [int] 型: int バッファのサイズ(文字単位)。文字列が指定文字数より長い場合は切り詰められ null 終端される。0 の場合、lpBuffer は文字列リソース自体への読み取り専用ポインタを受け取る。
%inst
指定モジュールに関連付けられた実行ファイルから文字列リソースを読み込み、バッファにコピーし、終端 null
文字を付加する。(Unicode)

[戻り値]
型: int 関数が成功した場合、戻り値は次のいずれか: バッファにコピーされた文字数(cchBufferMax が非ゼロの場合、終端
null 文字を含まない)。lpBuffer が指す文字列リソースの文字数(cchBufferMax が 0
の場合)。文字列リソースが存在しない場合は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
cchBufferMax に 0
を渡して文字列リソースへの読み取り専用ポインタを返す場合、文字列リソースの長さを判定するには戻り値の文字数を使用する。文字列リソースはモジュールのリソーステーブル内で
null 終端されていることが保証されない。


%index
LockSetForegroundWindow
前景プロセスは LockSetForegroundWindow 関数を呼び出して SetForegroundWindow 関数の呼び出しを無効化できる。
%group
Win32 user32
%prm
uLockCode
uLockCode : [int] 型: UINT
%inst
前景プロセスは LockSetForegroundWindow 関数を呼び出して SetForegroundWindow
関数の呼び出しを無効化できる。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
ユーザが ALT
キーを押したり、システム自身が前景ウィンドウを変更するような操作(背景ウィンドウのクリックなど)を行うと、システムは自動的に
SetForegroundWindow への呼び出しを有効化する。


%index
LockWindowUpdate
LockWindowUpdate 関数は指定されたウィンドウの描画を無効化または有効化する。一度にロックできるウィンドウは 1 つだけ。
%group
Win32 user32
%prm
hWndLock
hWndLock : [intptr] 描画を無効化するウィンドウ。NULL の場合、ロックされたウィンドウの描画が有効化される。
%inst
LockWindowUpdate 関数は指定されたウィンドウの描画を無効化または有効化する。一度にロックできるウィンドウは 1 つだけ。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0
となりエラーが発生したか別のウィンドウが既にロックされていることを示す。

[備考]
LockWindowUpdate
関数の目的は、ウィンドウ自体の干渉を受けずにドラッグ/ドロップのフィードバックをウィンドウ上に描画することを許可することである。LockWindowUpdate
はウィンドウ再描画の一般的な抑制を意図していない。特定のウィンドウの再描画を無効化するには WM_SETREDRAW
メッセージを使用する。


%index
LockWorkStation
ワークステーションの表示をロックする。
%group
Win32 user32
%prm

%inst
ワークステーションの表示をロックする。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数は非同期で実行されるため、0 以外の戻り値は操作が開始されたことを示す。失敗した場合、戻り値は
0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
LockWorkStation
関数は対話型デスクトップで実行されているプロセスからのみ呼び出せる。さらにユーザがログオンしている必要があり、ワークステーションが既にロックされていてはならない。


%index
LogicalToPhysicalPoint
ウィンドウ内の点の論理座標を物理座標に変換する。
%group
Win32 user32
%prm
hWnd, lpPoint
hWnd : [intptr] 型: HWND 変換に使用する変換行列を持つウィンドウへのハンドル。トップレベルウィンドウは完全にサポートされる。子ウィンドウの場合、親と子の重なり領域のみが変換される。
lpPoint : [var] 型: LPPOINT 変換する論理座標を指定する POINT 構造体へのポインタ。成功時には新しい物理座標がこの構造体にコピーされる。
%inst
ウィンドウ内の点の論理座標を物理座標に変換する。

[備考]
Windows Vista で物理座標の概念が導入された。DWM は DPI 非対応ウィンドウを高 DPI
表示時に拡大する。Windows 8.1 ではこの API
は点を変換しなくなった。システムはすべての点をアプリケーション自身の座標空間で返す。


%index
LogicalToPhysicalPointForPerMonitorDPI
呼び出し元の DPI 認識に関わらず、ウィンドウ内の点を論理座標から物理座標に変換する。
%group
Win32 user32
%prm
hWnd, lpPoint
hWnd : [intptr] 変換に使用する変換行列を持つウィンドウへのハンドル。
lpPoint : [var] 変換する論理座標を指定する POINT 構造体へのポインタ。成功時には新しい物理座標がこの構造体にコピーされる。
%inst
呼び出し元の DPI 認識に関わらず、ウィンドウ内の点を論理座標から物理座標に変換する。

[戻り値]
成功した場合は TRUE、そうでない場合は FALSE を返す。

[備考]
呼び出し元の DPI 認識に関係なく指定ウィンドウの DPI
認識に基づいて変換する。例えば、PROCESS_PER_MONITOR_AWARE なアプリが PROCESS_DPI_UNAWARE
なアプリのウィンドウに対する座標を取得する際に使用できる。


%index
LookupIconIdFromDirectory
現在のディスプレイデバイスに最適なアイコンまたはカーソルをアイコン/カーソルデータから検索する。(LookupIconIdFromDirectory)
%group
Win32 user32
%prm
presbits, fIcon
presbits : [var] 型: PBYTE アイコンまたはカーソルのディレクトリデータ。この関数はリソースデータを検証しないため、presbits が有効なリソースデータを指していないと GP フォールトが発生するか未定義値を返す。
fIcon : [int] 型: BOOL アイコンを探すかカーソルを探すかを示す。TRUE でアイコン、FALSE でカーソルを検索する。
%inst

現在のディスプレイデバイスに最適なアイコンまたはカーソルをアイコン/カーソルデータから検索する。(LookupIconIdFromDirectory)

[戻り値]
型: int
関数が成功した場合、戻り値は現在のディスプレイデバイスに最適なアイコンまたはカーソルの整数リソース識別子。失敗した場合、戻り値は
0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
RT_GROUP_ICON (カーソルは RT_GROUP_CURSOR)
タイプのリソースファイルには、複数のデバイス依存/独立形式のアイコン(カーソル)データが含まれる。LookupIconIdFromDirectory
は現在のディスプレイデバイスに最適なものを検索し整数識別子を返す。


%index
LookupIconIdFromDirectoryEx
現在のディスプレイデバイスに最適なアイコンまたはカーソルをアイコン/カーソルデータから検索する。(LookupIconIdFromDirectoryEx)
%group
Win32 user32
%prm
presbits, fIcon, cxDesired, cyDesired, Flags
presbits : [var] 型: PBYTE アイコンまたはカーソルのディレクトリデータ。
fIcon : [int] 型: BOOL アイコンを探すかカーソルを探すかを示す。TRUE でアイコン、FALSE でカーソルを検索する。
cxDesired : [int] 型: int 望ましいアイコンの幅(ピクセル単位)。0 の場合、SM_CXICON または SM_CXCURSOR システムメトリック値を使用する。
cyDesired : [int] 型: int 望ましいアイコンの高さ(ピクセル単位)。0 の場合、SM_CYICON または SM_CYCURSOR システムメトリック値を使用する。
Flags : [int] 型: UINT
%inst

現在のディスプレイデバイスに最適なアイコンまたはカーソルをアイコン/カーソルデータから検索する。(LookupIconIdFromDirectoryEx)

[戻り値]
型: int
関数が成功した場合、戻り値は現在のディスプレイデバイスに最適なアイコンまたはカーソルの整数リソース識別子。失敗した場合、戻り値は
0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
RT_GROUP_ICON
タイプのリソースファイルには複数の形式のアイコンデータが含まれる。LookupIconIdFromDirectoryEx
は現在のディスプレイデバイスに最適なものを検索する。


%index
MapDialogRect
指定されたダイアログ単位を画面単位(ピクセル)に変換する。
%group
Win32 user32
%prm
hDlg, lpRect
hDlg : [intptr] 型: HWND ダイアログへのハンドル。この関数はダイアログ作成関数が返したハンドルのみ受け付ける。他のウィンドウのハンドルは無効。
lpRect : [var] 型: LPRECT 変換するダイアログ座標を含む RECT 構造体へのポインタ。
%inst
指定されたダイアログ単位を画面単位(ピクセル)に変換する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
MapDialogRect 関数は RECT
構造体の初期座標がダイアログ単位であることを前提とする。座標をダイアログ単位からピクセルに変換するには、現在のダイアログの水平/垂直基本単位を取得し計算式を適用する。
（以下省略）


%index
MapVirtualKeyW
仮想キーコードをスキャンコードまたは文字値に変換する、またはスキャンコードを仮想キーコードに変換する。(Unicode)
%group
Win32 user32
%prm
uCode, uMapType
uCode : [int] 型: UINT キーの仮想キーコードまたはスキャンコード。解釈は uMapType の値に依存する。
uMapType : [int] 型: UINT 実行する変換。値は uCode パラメータの値に依存する。
%inst
仮想キーコードをスキャンコードまたは文字値に変換する、またはスキャンコードを仮想キーコードに変換する。(Unicode)

[戻り値]
型: UINT 戻り値は uCode と uMapType
の値に応じて、スキャンコード、仮想キーコード、または文字値のいずれか。変換がない場合、戻り値は 0。

[備考]
指定コードの変換に使用するキーボードレイアウトへのハンドルを指定するには MapVirtualKeyEx 関数を使用する。


%index
MapVirtualKeyExW
仮想キーコードをスキャンコードまたは文字値に変換する、またはスキャンコードを仮想キーコードに変換する。入力言語と入力ロケール識別子を用いてコードを変換する。(Unicode)
%group
Win32 user32
%prm
uCode, uMapType, dwhkl
uCode : [int] 型: UINT キーの仮想キーコードまたはスキャンコード。この値の解釈は uMapType の値に依存する。Windows Vista 以降では uCode の上位バイトに 0xe0 または 0xe1 を含めて拡張スキャンコードを指定できる。
uMapType : [int] 型: UINT 実行する変換。値は uCode パラメータの値に依存する。
dwhkl : [intptr] 型: HKL 指定コードの変換に使用する入力ロケール識別子。LoadKeyboardLayout で返された任意の入力ロケール識別子を指定できる。
%inst

仮想キーコードをスキャンコードまたは文字値に変換する、またはスキャンコードを仮想キーコードに変換する。入力言語と入力ロケール識別子を用いてコードを変換する。(Unicode)

[戻り値]
型: UINT 戻り値は uCode と uMapType
の値に応じて、スキャンコード、仮想キーコード、または文字値のいずれか。変換がない場合、戻り値は 0。

[備考]

入力ロケール識別子はキーボードレイアウトより広い概念で、音声テキスト変換器、IME、その他の入力形式も包含する。MapVirtualKeyEx
はスキャンコードを VK_SHIFT、VK_CONTROL、VK_MENU 等の仮想キーコード定数に変換できる。


%index
MapWindowPoints
MapWindowPoints 関数は点のセットをあるウィンドウの座標空間から別のウィンドウの座標空間に変換する。
%group
Win32 user32
%prm
hWndFrom, hWndTo, lpPoints, cPoints
hWndFrom : [intptr] 点を変換する元のウィンドウへのハンドル。NULL または HWND_DESKTOP の場合、点はスクリーン座標とみなされる。
hWndTo : [intptr] 点を変換する先のウィンドウへのハンドル。NULL または HWND_DESKTOP の場合、点はスクリーン座標に変換される。
lpPoints : [var] 変換する点のセットを含む POINT 構造体の配列へのポインタ。点はデバイス単位。RECT 構造体を指すこともでき、その場合 cPoints は 2 に設定する。
cPoints : [int] lpPoints が指す配列内の POINT 構造体の数。
%inst
MapWindowPoints 関数は点のセットをあるウィンドウの座標空間から別のウィンドウの座標空間に変換する。

[戻り値]

関数が成功した場合、戻り値の下位ワードは各ソース点の水平座標に加算されるピクセル数。上位ワードは垂直座標に加算されるピクセル数。関数が失敗した場合、戻り値は
0。

[備考]
hWndFrom または hWndTo(あるいは両方)がミラー化ウィンドウ(WS_EX_LAYOUTRTL 拡張スタイル)で、正確に 2
点が lpPoints に渡された場合、MapWindowPoints はそれらを RECT として解釈し、left が right
より大きくならないよう自動的に入れ替える可能性がある。


%index
MenuItemFromPoint
指定位置にあるメニュー項目がどれかを判定する。
%group
Win32 user32
%prm
hWnd, hMenu, ptScreen
hWnd : [intptr] 型: HWND メニューを含むウィンドウへのハンドル。NULL で hMenu がポップアップメニューを表す場合、関数はメニューウィンドウを自動で見つける。
hMenu : [intptr] 型: HMENU ヒットテスト対象のメニュー項目を含むメニューへのハンドル。
ptScreen : [int] 型: POINT テストする位置を指定する構造体。hMenu がメニューバーを指定する場合はウィンドウ座標、それ以外はクライアント座標。
%inst
指定位置にあるメニュー項目がどれかを判定する。

[戻り値]
型: int 指定位置にあるメニュー項目の 0 ベース位置、またはメニュー項目がない場合は -1 を返す。


%index
MessageBeep
波形音を再生する。各音種の波形音はレジストリのエントリで識別される。
%group
Win32 user32
%prm
uType
uType : [int] 再生する音。音はユーザがサウンドコントロールパネルで設定し、レジストリに保存される。
%inst
波形音を再生する。各音種の波形音はレジストリのエントリで識別される。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
MessageBeep
関数は音をキューに入れた後、制御を呼び出し元に返し、音を非同期に再生する。指定された警告音を再生できない場合、システム既定音を試す。それもできない場合、コンピュータスピーカで標準ビープ音を鳴らす。


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
MessageBoxExW
メッセージボックスを作成、表示、操作する。(Unicode)
%group
Win32 user32
%prm
hWnd, lpText, lpCaption, uType, wLanguageId
hWnd : [intptr] 型: HWND 作成するメッセージボックスの所有ウィンドウへのハンドル。NULL の場合、所有ウィンドウを持たない。
lpText : [wstr] 型: LPCTSTR 表示するメッセージ。
lpCaption : [wstr] 型: LPCTSTR ダイアログタイトル。NULL の場合、既定タイトル「Error」が使用される。
uType : [int] 型: UINT ダイアログの内容と動作。サポートされるフラグは MessageBox を参照。
wLanguageId : [int] 型: WORD メッセージボックスボタンテキストの言語。0 を指定すると既定のシステム言語で表示する。MAKELANGID(LANG_NEUTRAL, SUBLANG_NEUTRAL) の場合、呼び出しスレッドに関連付けられた現在の言語が使用される。
%inst
メッセージボックスを作成、表示、操作する。(Unicode)

[戻り値]
型: int メッセージボックスに Cancel ボタンがある場合、ESC キーを押すか Cancel ボタンを選択すると
IDCANCEL を返す。関数が失敗した場合、戻り値は 0。
（以下省略）

[備考]
システムがメモリ不足を示すためにシステムモーダルメッセージボックスを使用する場合、lpText と lpCaption
が指す文字列はリソースファイルから取らないこと(リソース読み込みが失敗する可能性があるため)。


%index
MessageBoxIndirectW
メッセージボックスを作成、表示、操作する。メッセージボックスにはアプリケーション定義のメッセージテキストとタイトル、任意のアイコン、および事前定義のプッシュボタンの組み合わせが含まれる。(Unicode)
%group
Win32 user32
%prm
lpmbp
lpmbp : [var] 型: const LPMSGBOXPARAMS メッセージボックス表示に使用する情報を含む MSGBOXPARAMS 構造体へのポインタ。
%inst

メッセージボックスを作成、表示、操作する。メッセージボックスにはアプリケーション定義のメッセージテキストとタイトル、任意のアイコン、および事前定義のプッシュボタンの組み合わせが含まれる。(Unicode)

[戻り値]
型: int 関数が成功した場合、戻り値は次のメニュー項目値のいずれか。メモリ不足でメッセージボックスを作成できない場合、戻り値は 0。
（以下省略）

[備考]
システムがメモリ不足を示すためにシステムモーダルメッセージボックスを使用する場合、MSGBOXPARAMS 構造体の lpszText と
lpszCaption メンバが指す文字列はリソースファイルから取らないこと。


%index
ModifyMenuW
既存のメニュー項目を変更する。(Unicode)
%group
Win32 user32
%prm
hMnu, uPosition, uFlags, uIDNewItem, lpNewItem
hMnu : [intptr] 型: HMENU 変更するメニューへのハンドル。
uPosition : [int] 型: UINT 変更するメニュー項目。uFlags により解釈される。
uFlags : [int] 型: UINT uPosition パラメータの解釈と、メニュー項目の内容・外観・動作を制御する。
uIDNewItem : [int] 型: UINT_PTR 変更するメニュー項目の識別子。uFlags に MF_POPUP フラグが設定されている場合、ドロップダウンメニューまたはサブメニューへのハンドル。
lpNewItem : [wstr] 型: LPCTSTR 変更後のメニュー項目の内容。解釈は uFlags に MF_BITMAP、MF_OWNERDRAW、MF_STRING が含まれるかに依存する。
%inst
既存のメニュー項目を変更する。(Unicode)

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
ModifyMenu
がドロップダウンまたはサブメニューを開くメニュー項目を置き換える場合、関数は古いドロップダウン/サブメニューを破棄し、それが使用していたメモリを解放する。アプリケーションはメニューが変更されるたびに
DrawMenuBar 関数を呼ぶ必要がある。


%index
MonitorFromPoint
MonitorFromPoint 関数は指定された点を含むディスプレイモニタへのハンドルを取得する。
%group
Win32 user32
%prm
pt, dwFlags
pt : [int] 仮想スクリーン座標で対象の点を指定する POINT 構造体。
dwFlags : [int] 点がどのディスプレイモニタにも含まれない場合の関数の戻り値を決定する。
%inst
MonitorFromPoint 関数は指定された点を含むディスプレイモニタへのハンドルを取得する。

[戻り値]
点がディスプレイモニタに含まれる場合、戻り値はそのモニタへの HMONITOR ハンドル。含まれない場合、戻り値は dwFlags
の値に依存する。


%index
MonitorFromRect
MonitorFromRect 関数は指定矩形と最も交差面積の大きいディスプレイモニタへのハンドルを取得する。
%group
Win32 user32
%prm
lprc, dwFlags
lprc : [var] 仮想スクリーン座標で対象の矩形を指定する RECT 構造体へのポインタ。
dwFlags : [int] 矩形がどのディスプレイモニタとも交差しない場合の関数の戻り値を決定する。
%inst
MonitorFromRect 関数は指定矩形と最も交差面積の大きいディスプレイモニタへのハンドルを取得する。

[戻り値]
矩形が 1 つ以上のディスプレイモニタ矩形と交差する場合、戻り値は最も交差面積の大きいモニタへの HMONITOR
ハンドル。交差しない場合、戻り値は dwFlags の値に依存する。


%index
MonitorFromWindow
MonitorFromWindow 関数は指定ウィンドウの境界矩形と最も交差面積の大きいディスプレイモニタへのハンドルを取得する。
%group
Win32 user32
%prm
hwnd, dwFlags
hwnd : [intptr] 対象のウィンドウへのハンドル。
dwFlags : [int] ウィンドウがどのディスプレイモニタとも交差しない場合の関数の戻り値を決定する。
%inst
MonitorFromWindow 関数は指定ウィンドウの境界矩形と最も交差面積の大きいディスプレイモニタへのハンドルを取得する。

[戻り値]
ウィンドウが 1 つ以上のディスプレイモニタ矩形と交差する場合、戻り値は最も交差面積の大きいモニタへの HMONITOR
ハンドル。交差しない場合、戻り値は dwFlags の値に依存する。

[備考]
ウィンドウが現在最小化されている場合、MonitorFromWindow は最小化前のウィンドウ矩形を使用する。


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
MsgWaitForMultipleObjects
指定オブジェクトのうちの 1 つまたはすべてがシグナル状態になるか、タイムアウト間隔が経過するまで待機する。オブジェクトには入力イベントオブジェクトを含めることができる。
%group
Win32 user32
%prm
nCount, pHandles, fWaitAll, dwMilliseconds, dwWakeMask
nCount : [int] pHandles が指す配列内のオブジェクトハンドル数。最大は MAXIMUM_WAIT_OBJECTS - 1。0 の場合、入力イベントのみを待機する。
pHandles : [intptr] オブジェクトハンドルの配列。配列には異なる種類のオブジェクトハンドルを含められる。同じハンドルを複数含めてはならない。
fWaitAll : [int] TRUE なら、pHandles 内のすべてのオブジェクトがシグナル状態になり入力イベントを受信したときに戻る。FALSE なら、いずれか 1 つがシグナル状態になるか入力イベントを受信したときに戻る。
dwMilliseconds : [int] タイムアウト間隔(ミリ秒単位)。非ゼロを指定すると、指定オブジェクトがシグナル状態になるかタイムアウトまで待機する。0 の場合、シグナル状態でなくても待機状態に入らず即座に戻る。INFINITE の場合、シグナル状態になったときのみ戻る。
dwWakeMask : [int] 入力イベントオブジェクトハンドルがオブジェクトハンドル配列に追加される入力種別。
%inst
指定オブジェクトのうちの 1
つまたはすべてがシグナル状態になるか、タイムアウト間隔が経過するまで待機する。オブジェクトには入力イベントオブジェクトを含めることができる。

[戻り値]
関数が成功した場合、戻り値は関数を戻らせたイベントを示す。
（以下省略）

[備考]
MsgWaitForMultipleObjects 関数は待機基準が満たされたかを判定する。bWaitAll が TRUE
の場合、すべてのオブジェクトがシグナル状態になり入力イベントを受信するまで待機が完了しない。そのため、ウィンドウを作成するスレッドでは
bWaitAll を TRUE にしないこと。


%index
MsgWaitForMultipleObjectsEx
指定オブジェクトのうちの 1 つまたはすべてがシグナル状態になるか、I/O 完了ルーチンまたは APC がスレッドにキューされるか、タイムアウト間隔が経過するまで待機する。
%group
Win32 user32
%prm
nCount, pHandles, dwMilliseconds, dwWakeMask, dwFlags
nCount : [int] pHandles が指す配列内のオブジェクトハンドル数。
pHandles : [intptr] オブジェクトハンドルの配列。
dwMilliseconds : [int] タイムアウト間隔(ミリ秒単位)。
dwWakeMask : [int] 入力イベントオブジェクトハンドルがオブジェクトハンドル配列に追加される入力種別。
dwFlags : [int] 
%inst
指定オブジェクトのうちの 1 つまたはすべてがシグナル状態になるか、I/O 完了ルーチンまたは APC
がスレッドにキューされるか、タイムアウト間隔が経過するまで待機する。

[戻り値]
関数が成功した場合、戻り値は関数を戻らせたイベントを示す。
（以下省略）

[備考]
MsgWaitForMultipleObjectsEx 関数は dwWakeMask と dwFlags
で指定された条件が満たされたかを判定する。


%index
NotifyWinEvent
事前定義のイベントが発生したことをシステムに通知する。クライアントアプリケーションがイベントのフック関数を登録している場合、システムはクライアントのフック関数を呼び出す。
%group
Win32 user32
%prm
event, hwnd, idObject, idChild
event : [int] 
hwnd : [intptr] 型: HWND イベントを発生させたオブジェクトを含むウィンドウへのハンドル。
idObject : [int] 型: LONG イベントを発生させたオブジェクトを識別する。事前定義のオブジェクト識別子またはカスタムオブジェクト ID のいずれか。
idChild : [int] 型: LONG イベントがオブジェクト自身で発生したか子要素で発生したかを示す。CHILDID_SELF の場合、オブジェクト自身で発生。
%inst

事前定義のイベントが発生したことをシステムに通知する。クライアントアプリケーションがイベントのフック関数を登録している場合、システムはクライアントのフック関数を呼び出す。

[備考]
サーバはこの関数を呼び出してイベントが発生したことをシステムに通知する。Microsoft Active Accessibility
はクライアントアプリケーションがイベントに対してフック手続きを設定しているかを確認し、そうであれば適切なフック手続きを呼び出す。


%index
OemKeyScan
OEM ASCII コード 0 から 0x0FF を OEM スキャンコードおよびシフト状態にマップする。キーボード入力を模擬して別プログラムに OEM テキストを送るための情報を提供する。
%group
Win32 user32
%prm
wOemChar
wOemChar : [int] 型: WORD OEM 文字の ASCII 値。
%inst
OEM ASCII コード 0 から 0x0FF を OEM
スキャンコードおよびシフト状態にマップする。キーボード入力を模擬して別プログラムに OEM テキストを送るための情報を提供する。

[戻り値]
型: DWORD 戻り値の下位ワードは OEM 文字のスキャンコード、上位ワードはシフト状態を含む。
（以下省略）

[備考]
この関数は CTRL+ALT やデッドキーを要する文字の変換は提供しない。変換されない文字は
ALT+キーパッドの仕組みで入力を模擬する必要がある。


%index
OemToCharW
OEM 定義文字セットから ANSI またはワイド文字列へ文字列を変換する。警告: 使用しないこと。(Unicode)
%group
Win32 user32
%prm
pSrc, pDst
pSrc : [str] 型: LPCSTR OEM 定義文字セットからの null 終端文字列。
pDst : [wstr] 型: LPTSTR 変換後の文字列を受け取る出力バッファ。
%inst
OEM 定義文字セットから ANSI またはワイド文字列へ文字列を変換する。警告: 使用しないこと。(Unicode)

[戻り値]
型: BOOL ワイド文字版関数で lpszSrc と lpszDst に同じアドレスを渡した場合を除き、戻り値は常に 0
以外。その場合は 0 を返し GetLastError は ERROR_INVALID_ADDRESS を返す。

[備考]
> [!NOTE] > winuser.h ヘッダは OemToChar を UNICODE プリプロセッサ定数の定義に基づいて
ANSI/Unicode 版を自動選択するエイリアスとして定義する。


%index
OemToCharBuffW
OEM 定義文字セットから ANSI またはワイド文字列へ指定文字数の文字列を変換する。(Unicode)
%group
Win32 user32
%prm
lpszSrc, lpszDst, cchDstLength
lpszSrc : [str] 型: LPCSTR OEM 定義文字セットからの 1 文字以上。
lpszDst : [wstr] 型: LPTSTR 変換後の文字列を受け取る出力バッファ。OemToCharBuff を ANSI 関数として使用する場合、lpszDst に lpszSrc と同じアドレスを設定することで文字列をその場で変換できる。ワイド文字版ではできない。
cchDstLength : [int] 型: DWORD lpszSrc で識別されるバッファ内で変換する文字数。
%inst
OEM 定義文字セットから ANSI またはワイド文字列へ指定文字数の文字列を変換する。(Unicode)

[戻り値]
型: BOOL ワイド文字版関数で lpszSrc と lpszDst に同じアドレスを渡した場合を除き、戻り値は常に 0
以外。その場合は 0 を返し GetLastError は ERROR_INVALID_ADDRESS を返す。

[備考]
OemToChar 関数と異なり、OemToCharBuff 関数は lpszSrc が指すバッファ内で null
文字を検出しても変換を停止しない。cchDstLength 文字すべてを変換する。


%index
OffsetRect
OffsetRect 関数は指定された矩形を指定されたオフセットだけ移動する。
%group
Win32 user32
%prm
lprc, dx, dy
lprc : [var] 移動する矩形の論理座標を含む RECT 構造体へのポインタ。
dx : [int] 矩形を左右に移動する量。左に移動するには負値を指定する。
dy : [int] 矩形を上下に移動する量。上に移動するには負値を指定する。
%inst
OffsetRect 関数は指定された矩形を指定されたオフセットだけ移動する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。

[備考]
アプリケーションは矩形をさまざまな用途に使えるため、矩形関数は明示的な測定単位を用いない。


%index
OpenClipboard
クリップボードを検査用に開き、他のアプリケーションがクリップボード内容を変更するのを防ぐ。
%group
Win32 user32
%prm
hWndNewOwner
hWndNewOwner : [intptr] 型: HWND 開いたクリップボードに関連付けるウィンドウへのハンドル。NULL の場合、現在のタスクに関連付けられる。
%inst
クリップボードを検査用に開き、他のアプリケーションがクリップボード内容を変更するのを防ぐ。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
OpenClipboard は別ウィンドウがクリップボードを開いている場合に失敗する。OpenClipboard の成功呼び出しのたびに
CloseClipboard を呼ぶ必要がある。


%index
OpenDesktopW
指定されたデスクトップオブジェクトを開く。(Unicode)
%group
Win32 user32
%prm
lpszDesktop, dwFlags, fInherit, dwDesiredAccess
lpszDesktop : [wstr] 開くデスクトップの名前。デスクトップ名は大文字小文字を区別しない。現在のウィンドウステーションに属する必要がある。
dwFlags : [int] このパラメータは 0 または次の値を指定できる。
fInherit : [int] TRUE の場合、このプロセスが作成するプロセスがハンドルを継承する。
dwDesiredAccess : [int] デスクトップへのアクセス。アクセス権の一覧はデスクトップのセキュリティとアクセス権を参照。
%inst
指定されたデスクトップオブジェクトを開く。(Unicode)

[戻り値]
関数が成功した場合、戻り値は開いたデスクトップへのハンドル。使用後は CloseDesktop 関数で閉じる。失敗した場合、戻り値は
NULL。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
呼び出しプロセスは、プロセス作成時にシステムに割り当てられたか SetProcessWindowStation
で設定されたウィンドウステーションに関連付けられている必要がある。


%index
OpenIcon
最小化(アイコン化)されたウィンドウを以前のサイズと位置に復元し、ウィンドウをアクティブ化する。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND 復元してアクティブ化するウィンドウへのハンドル。
%inst
最小化(アイコン化)されたウィンドウを以前のサイズと位置に復元し、ウィンドウをアクティブ化する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
OpenIcon は指定ウィンドウに WM_QUERYOPEN メッセージを送る。


%index
OpenInputDesktop
ユーザ入力を受け取るデスクトップを開く。
%group
Win32 user32
%prm
dwFlags, fInherit, dwDesiredAccess
dwFlags : [int] このパラメータは 0 または次の値を指定できる。
fInherit : [int] TRUE の場合、このプロセスが作成するプロセスがハンドルを継承する。
dwDesiredAccess : [int] デスクトップへのアクセス権。
%inst
ユーザ入力を受け取るデスクトップを開く。

[戻り値]
関数が成功した場合、戻り値はユーザ入力を受け取るデスクトップへのハンドル。失敗した場合、戻り値は NULL。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
呼び出しプロセスに関連付けられたウィンドウステーションは入力を受信できる必要がある。


%index
OpenWindowStationW
指定されたウィンドウステーションを開く。(Unicode)
%group
Win32 user32
%prm
lpszWinSta, fInherit, dwDesiredAccess
lpszWinSta : [wstr] 開くウィンドウステーションの名前。大文字小文字を区別しない。現在のセッションに属する必要がある。
fInherit : [int] TRUE の場合、このプロセスが作成するプロセスがハンドルを継承する。
dwDesiredAccess : [int] ウィンドウステーションへのアクセス権。
%inst
指定されたウィンドウステーションを開く。(Unicode)

[戻り値]
関数が成功した場合、戻り値は指定ウィンドウステーションへのハンドル。失敗した場合、戻り値は NULL。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
ハンドルの使用が終わったら CloseWindowStation で解放する必要がある。


%index
PackDDElParam
プロセス間で DDE データを共有するために使用される内部構造体に動的データ交換 (DDE) の lParam 値をパックする。
%group
Win32 user32
%prm
msg, uiLo, uiHi
msg : [int] 型: UINT ポストする DDE メッセージ。
uiLo : [int] 型: UINT_PTR ポストする DDE メッセージの lParam パラメータの 16 ビット下位ワードに対応する値。
uiHi : [int] 型: UINT_PTR ポストする DDE メッセージの lParam パラメータの 16 ビット上位ワードに対応する値。
%inst
プロセス間で DDE データを共有するために使用される内部構造体に動的データ交換 (DDE) の lParam 値をパックする。

[戻り値]
型: LPARAM 戻り値は lParam 値。

[備考]
戻り値は DDE メッセージの lParam パラメータとしてポストする必要があり、他の目的に使用してはならない。ポストされた DDE
メッセージに対してのみ呼び出すこと。


%index
PackTouchHitTestingProximityEvaluation
WM_TOUCHHITTESTING コールバック向けに、近接度評価スコアと調整済みタッチポイント座標をパック値として返す。
%group
Win32 user32
%prm
pHitTestingInput, pProximityEval
pHitTestingInput : [var] タッチ接触領域のデータを保持する TOUCH_HIT_TESTING_INPUT 構造体。
pProximityEval : [var] EvaluateProximityToPolygon または EvaluateProximityToRect 関数が返すスコアと調整済みタッチポイントデータを保持する TOUCH_HIT_TESTING_PROXIMITY_EVALUATION 構造体。
%inst
WM_TOUCHHITTESTING コールバック向けに、近接度評価スコアと調整済みタッチポイント座標をパック値として返す。

[戻り値]
関数が成功した場合、TOUCH_HIT_TESTING_PROXIMITY_EVALUATION の score と
adjustedPoint 値を LRESULT としてパックして返す。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
通常、これは WM_TOUCHHITTESTING ハンドラで呼ばれる最後の関数。


%index
PaintDesktop
PaintDesktop 関数は指定デバイスコンテキスト内のクリッピング領域をデスクトップパターンまたは壁紙で塗りつぶす。
%group
Win32 user32
%prm
hdc
hdc : [intptr] デバイスコンテキストへのハンドル。
%inst
PaintDesktop 関数は指定デバイスコンテキスト内のクリッピング領域をデスクトップパターンまたは壁紙で塗りつぶす。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。


%index
PeekMessageW
受信した非キューメッセージをディスパッチし、ポストされたメッセージをスレッドメッセージキューから取得する。(Unicode)
%group
Win32 user32
%prm
lpMsg, hWnd, wMsgFilterMin, wMsgFilterMax, wRemoveMsg
lpMsg : [var] 型: LPMSG メッセージ情報を受け取る MSG 構造体へのポインタ。
hWnd : [intptr] 型: HWND メッセージを取得するウィンドウへのハンドル。ウィンドウは現在のスレッドに属している必要がある。NULL の場合、現スレッドに属する任意のウィンドウのメッセージ、および hwnd 値が NULL の現スレッドメッセージキュー上のメッセージを取得する。-1 の場合、hwnd 値が NULL のメッセージ(スレッドメッセージ)のみを取得する。
wMsgFilterMin : [int] 型: UINT 調べるメッセージ範囲の最初の値。キーボードメッセージには WM_KEYFIRST(0x0100)、マウスメッセージには WM_MOUSEFIRST(0x0200)を指定する。
wMsgFilterMax : [int] 型: UINT 調べるメッセージ範囲の最後の値。キーボードメッセージには WM_KEYLAST、マウスメッセージには WM_MOUSELAST を指定する。wMsgFilterMin と wMsgFilterMax がともに 0 の場合、すべての利用可能なメッセージを取得する。
wRemoveMsg : [int] 型: UINT
%inst
受信した非キューメッセージをディスパッチし、ポストされたメッセージをスレッドメッセージキューから取得する。(Unicode)

[戻り値]
型: BOOL メッセージがある場合、戻り値は 0 以外。ない場合、戻り値は 0。

[備考]
PeekMessage は hWnd パラメータで識別されるウィンドウまたはその子に関連付けられ、wMsgFilterMin/Max
の範囲内のメッセージを取得する。WM_QUIT メッセージはフィルタ値に関わらず常に取得される。


%index
PhysicalToLogicalPoint
ウィンドウ内の点の物理座標を論理座標に変換する。
%group
Win32 user32
%prm
hWnd, lpPoint
hWnd : [intptr] 型: HWND 変換に使用する変換行列を持つウィンドウへのハンドル。
lpPoint : [var] 型: LPPOINT 変換する物理/スクリーン座標を指定する POINT 構造体へのポインタ。成功時には新しい論理座標がこの構造体にコピーされる。
%inst
ウィンドウ内の点の物理座標を論理座標に変換する。

[備考]
Windows Vista で物理座標の概念が導入された。Windows 8.1 以降、この API は点を変換しなくなった。


%index
PhysicalToLogicalPointForPerMonitorDPI
呼び出し元の DPI 認識に関わらず、ウィンドウ内の点を物理座標から論理座標に変換する。
%group
Win32 user32
%prm
hWnd, lpPoint
hWnd : [intptr] 変換に使用する変換行列を持つウィンドウへのハンドル。
lpPoint : [var] 変換する物理/スクリーン座標を指定する POINT 構造体へのポインタ。
%inst
呼び出し元の DPI 認識に関わらず、ウィンドウ内の点を物理座標から論理座標に変換する。

[戻り値]
成功した場合は TRUE、そうでない場合は FALSE を返す。

[備考]
呼び出し元の DPI 認識に関わらず、指定ウィンドウの DPI 認識に基づいて物理座標を論理座標に変換する。


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
PostQuitMessage
スレッドが終了要求を出したことをシステムに示す。通常 WM_DESTROY メッセージへの応答で使用する。
%group
Win32 user32
%prm
nExitCode
nExitCode : [int] 型: int アプリケーション終了コード。WM_QUIT メッセージの wParam パラメータとして使用される。
%inst
スレッドが終了要求を出したことをシステムに示す。通常 WM_DESTROY メッセージへの応答で使用する。

[備考]
PostQuitMessage 関数はスレッドのメッセージキューに WM_QUIT
メッセージをポストして即座に戻る。関数はスレッドが将来終了することを要求していることをシステムに示すだけである。


%index
PostThreadMessageW
指定されたスレッドのメッセージキューにメッセージをポストする。スレッドがメッセージを処理するのを待たずに戻る。(Unicode)
%group
Win32 user32
%prm
idThread, Msg, wParam, lParam
idThread : [int] 型: DWORD メッセージをポストするスレッドの識別子。指定スレッドがメッセージキューを持たない場合、関数は失敗する。
Msg : [int] 型: UINT ポストするメッセージの種類。
wParam : [intptr] 型: WPARAM メッセージ固有の追加情報。
lParam : [intptr] 型: LPARAM メッセージ固有の追加情報。
%inst
指定されたスレッドのメッセージキューにメッセージをポストする。スレッドがメッセージを処理するのを待たずに戻る。(Unicode)

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
メッセージが UIPI によってブロックされた場合、GetLastError の最後のエラーは
5(アクセス拒否)に設定される。メッセージをポストする対象スレッドはメッセージキューを作成している必要がある。そうでなければ
PostThreadMessage は失敗する。


%index
PrintWindow
PrintWindow 関数は視覚的なウィンドウを指定されたデバイスコンテキスト(通常はプリンタ DC)にコピーする。
%group
Win32 user32
%prm
hwnd, hdcBlt, nFlags
hwnd : [intptr] コピーされるウィンドウへのハンドル。
hdcBlt : [intptr] デバイスコンテキストへのハンドル。
nFlags : [int] 
%inst
PrintWindow 関数は視覚的なウィンドウを指定されたデバイスコンテキスト(通常はプリンタ DC)にコピーする。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。

[備考]
注意: これはブロッキングまたは同期関数で、即座に戻らない可能性がある。hWnd で参照されるウィンドウを所有するアプリケーションが
PrintWindow 呼び出しを処理し、hdcBlt が参照するデバイスコンテキストに画像を描画する。アプリケーションは
WM_PRINT メッセージ(または PW_PRINTCLIENT フラグ指定時は WM_PRINTCLIENT メッセージ)を受け取る。


%index
PrivateExtractIconsW
指定ファイルから抽出したアイコンのハンドル配列を作成する。(Unicode)
%group
Win32 user32
%prm
szFileName, nIconIndex, cxIcon, cyIcon, phicon, piconid, nIcons, flags
szFileName : [wstr] 型: LPCTSTR アイコンを抽出するファイルのパスと名前。
nIconIndex : [int] 型: int 抽出する最初のアイコンの 0 ベースのインデックス。
cxIcon : [int] 型: int 希望する水平アイコンサイズ。
cyIcon : [int] 型: int 希望する垂直アイコンサイズ。
phicon : [intptr] 型: HICON* 返されるアイコンハンドル配列へのポインタ。
piconid : [var] 型: UINT* 現在のディスプレイデバイスに最適なアイコンの返されるリソース識別子へのポインタ。
nIcons : [int] 型: UINT ファイルから抽出するアイコン数。.exe および .dll からの抽出時のみ有効。
flags : [int] 型: UINT この関数を制御するフラグ。LoadImage 関数で使用される LR_* フラグ。
%inst
指定ファイルから抽出したアイコンのハンドル配列を作成する。(Unicode)

[戻り値]
型: UINT phicon が NULL で関数が成功した場合、戻り値はファイル内のアイコン数。関数が失敗した場合、戻り値は
0。phicon が非 NULL で成功した場合、戻り値は抽出されたアイコン数。ファイルが見つからない場合は 0xFFFFFFFF。

[備考]
この関数は実行ファイル (.exe)、DLL (.dll)、アイコン (.ico)、カーソル (.cur)、アニメーションカーソル
(.ani)、ビットマップ (.bmp) ファイルから抽出する。Windows 3.x の 16
ビット実行ファイルからの抽出もサポートされる。


%index
PtInRect
PtInRect 関数は指定された点が指定された矩形内にあるかを判定する。
%group
Win32 user32
%prm
lprc, pt
lprc : [var] 指定された矩形を含む RECT 構造体へのポインタ。
pt : [int] 指定された点を含む POINT 構造体。
%inst
PtInRect 関数は指定された点が指定された矩形内にあるかを判定する。

[戻り値]
指定点が矩形内にある場合、戻り値は 0 以外。ない場合、戻り値は 0。

[備考]
PtInRect を呼ぶ前に矩形は正規化されている必要がある(lprc.right > lprc.left かつ lprc.bottom
> lprc.top)。正規化されていないと、点は決して矩形内とはみなされない。


%index
QueryDisplayConfig
QueryDisplayConfig 関数は現在の設定におけるすべてのディスプレイデバイスまたはビューのすべての可能なディスプレイパスに関する情報を取得する。
%group
Win32 user32
%prm
flags, numPathArrayElements, pathArray, numModeInfoArrayElements, modeInfoArray, currentTopologyId
flags : [int] 
numPathArrayElements : [var] pPathInfoArray の要素数を含む変数へのポインタ。NULL 不可。
pathArray : [var] DISPLAYCONFIG_PATH_INFO 要素の配列を含む変数へのポインタ。各要素はソースからターゲットへのパスを記述する。NULL 不可。
numModeInfoArrayElements : [var] モード情報テーブルの要素数を指定する変数へのポインタ。NULL 不可。
modeInfoArray : [var] DISPLAYCONFIG_MODE_INFO 要素の配列を含む変数へのポインタ。NULL 不可。
currentTopologyId : [var] CCD データベース内の現在アクティブなトポロジの識別子を受け取る変数へのポインタ。pCurrentTopologyId は Flags が QDC_DATABASE_CURRENT の場合のみ設定される。
%inst
QueryDisplayConfig
関数は現在の設定におけるすべてのディスプレイデバイスまたはビューのすべての可能なディスプレイパスに関する情報を取得する。

[戻り値]
関数は次のいずれかの戻り値を返す。
（以下省略）

[備考]
GetDisplayConfigBufferSizes
は特定の時点の必要な配列サイズしか判定できないため、GetDisplayConfigBufferSizes と
QueryDisplayConfig
呼び出しの間にシステム構成が変わり、提供された配列サイズが新しいパスデータを格納するのに不足する可能性がある。その場合、QueryDisplayConfig
は ERROR_INSUFFICIENT_BUFFER で失敗する。


%index
RealChildWindowFromPoint
指定点にある子ウィンドウへのハンドルを取得する。検索は直接の子ウィンドウに限定される。
%group
Win32 user32
%prm
hwndParent, ptParentClientCoords
hwndParent : [intptr] 型: HWND 子を取得するウィンドウへのハンドル。
ptParentClientCoords : [int] 型: POINT 検査する点のクライアント座標を定義する POINT 構造体。
%inst
指定点にある子ウィンドウへのハンドルを取得する。検索は直接の子ウィンドウに限定される。

[戻り値]
型: HWND 戻り値は指定点を含む子ウィンドウへのハンドル。

[備考]
RealChildWindowFromPoint は標準コントロールの HTTRANSPARENT
領域を他の領域と異なる扱いとし、透明部分の背後にある子ウィンドウを返す。対して ChildWindowFromPoint は
HTTRANSPARENT 領域を同様に扱う。


%index
RealGetWindowClassW
ウィンドウ型を指定する文字列を取得する。(Unicode)
%group
Win32 user32
%prm
hwnd, ptszClassName, cchClassNameMax
hwnd : [intptr] 型: HWND 型を取得するウィンドウへのハンドル。
ptszClassName : [wstr] 型: LPTSTR ウィンドウ型を受け取る文字列へのポインタ。
cchClassNameMax : [int] 型: UINT pszType が指すバッファの長さ(文字単位)。
%inst
ウィンドウ型を指定する文字列を取得する。(Unicode)

[戻り値]
型: UINT 関数が成功した場合、戻り値は指定バッファにコピーされた文字数。失敗した場合、戻り値は 0。拡張エラー情報を取得するには
GetLastError を呼ぶ。


%index
RedrawWindow
RedrawWindow 関数はウィンドウのクライアント領域内の指定矩形または領域を更新する。
%group
Win32 user32
%prm
hWnd, lprcUpdate, hrgnUpdate, flags
hWnd : [intptr] 再描画するウィンドウへのハンドル。NULL の場合、デスクトップウィンドウが更新される。
lprcUpdate : [var] 更新矩形の座標をデバイス単位で含む RECT 構造体へのポインタ。hrgnUpdate が領域を指定する場合は無視される。
hrgnUpdate : [intptr] 更新領域へのハンドル。hrgnUpdate と lprcUpdate がともに NULL の場合、クライアント領域全体が更新領域に追加される。
flags : [int] 1 つ以上の再描画フラグ。ウィンドウの無効化/有効化、再描画制御、RedrawWindow の影響ウィンドウを制御できる。
%inst
RedrawWindow 関数はウィンドウのクライアント領域内の指定矩形または領域を更新する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。

[備考]
RedrawWindow を用いてデスクトップウィンドウの一部を無効化する場合、デスクトップウィンドウは WM_PAINT
メッセージを受け取らない。


%index
RegisterClassW
CreateWindow または CreateWindowEx の呼び出しで後続使用するウィンドウクラスを登録する。(RegisterClassW)
%group
Win32 user32
%prm
lpWndClass
lpWndClass : [var] 型: const WNDCLASS* WNDCLASS 構造体へのポインタ。渡す前にクラス属性で構造体を埋める必要がある。
%inst
CreateWindow または CreateWindowEx
の呼び出しで後続使用するウィンドウクラスを登録する。(RegisterClassW)

[戻り値]
型: ATOM 関数が成功した場合、戻り値は登録されたクラスを一意に識別するクラスアトム。失敗した場合、戻り値は
0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
RegisterClassA で登録された場合、作成されたクラスのウィンドウはメッセージテキストや文字パラメータに ANSI
文字セットを期待する。RegisterClassW の場合は Unicode。


%index
RegisterClassExW
CreateWindow または CreateWindowEx の呼び出しで後続使用するウィンドウクラスを登録する。(RegisterClassExW)
%group
Win32 user32
%prm
param0
param0 : [var] 
%inst
CreateWindow または CreateWindowEx
の呼び出しで後続使用するウィンドウクラスを登録する。(RegisterClassExW)

[戻り値]
型: ATOM 関数が成功した場合、戻り値は登録されたクラスを一意に識別するクラスアトム。失敗した場合、戻り値は
0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
RegisterClassExA
でウィンドウクラスを登録した場合、作成されたクラスのウィンドウはテキストや文字パラメータを含むメッセージに ANSI
文字セットを期待する。RegisterClassExW で登録した場合は Unicode
でのテキストパラメータを期待する。アプリケーションが登録したすべてのウィンドウクラスは終了時に登録解除される。


%index
RegisterClipboardFormatW
新しいクリップボード形式を登録する。(Unicode)
%group
Win32 user32
%prm
lpszFormat
lpszFormat : [wstr] 型: LPCTSTR 新しい形式の名前。
%inst
新しいクリップボード形式を登録する。(Unicode)

[戻り値]
型: UINT 関数が成功した場合、戻り値は登録されたクリップボード形式を識別する。失敗した場合、戻り値は
0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]

指定された名前の登録済み形式が既に存在する場合、新しい形式は登録されず、戻り値は既存の形式を識別する。これにより複数のアプリケーションが同じ登録済みクリップボード形式でデータをコピー/貼り付けできる。形式名の比較は大文字小文字を区別しない。


%index
UnregisterDeviceNotification
指定されたデバイス通知ハンドルを閉じる。
%group
Win32 user32
%prm
Handle
Handle : [int] RegisterDeviceNotification 関数が返したデバイス通知ハンドル。
%inst
指定されたデバイス通知ハンドルを閉じる。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。


%index
RegisterDeviceNotificationW
ウィンドウが通知を受け取るデバイスまたはデバイスの種類を登録する。(Unicode)
%group
Win32 user32
%prm
hRecipient, NotificationFilter, Flags
hRecipient : [intptr] NotificationFilter で指定されたデバイスのデバイスイベントを受け取るウィンドウまたはサービスへのハンドル。
NotificationFilter : [intptr] 通知を送るデバイスの種類を指定するデータブロックへのポインタ。このブロックは常に DEV_BROADCAST_HDR 構造体で始まる。
Flags : [int] 
%inst
ウィンドウが通知を受け取るデバイスまたはデバイスの種類を登録する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はデバイス通知ハンドル。失敗した場合、戻り値は NULL。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
アプリケーションは BroadcastSystemMessage
関数を使ってイベント通知を送る。トップレベルウィンドウを持つ任意のアプリケーションは WM_DEVICECHANGE
メッセージを処理して基本通知を受け取れる。


%index
RegisterHotKey
システム全体のホットキーを定義する。
%group
Win32 user32
%prm
hWnd, id, fsModifiers, vk
hWnd : [intptr] 型: HWND ホットキーによって生成された WM_HOTKEY メッセージを受け取るウィンドウへのハンドル。NULL の場合、呼び出しスレッドのメッセージキューにポストされ、メッセージループで処理する必要がある。
id : [int] 型: int ホットキーの識別子。hWnd が NULL の場合、ホットキーは特定のウィンドウではなく現スレッドに関連付けられる。
fsModifiers : [int] 型: UINT ホットキーと組み合わせて押す必要があるキー。
vk : [int] 型: UINT ホットキーの仮想キーコード。
%inst
システム全体のホットキーを定義する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
キーが押されると、システムはすべてのホットキーと照合する。一致が見つかると、ホットキーに関連付けられたウィンドウのメッセージキューに
WM_HOTKEY メッセージをポストする。F12 キーは常にデバッガ用に予約されているので、ホットキーとして登録すべきでない。


%index
RegisterPointerDeviceNotifications
WM_POINTERDEVICECHANGE、WM_POINTERDEVICEINRANGE、WM_POINTERDEVICEOUTOFRANGE ポインタデバイス通知を処理するウィンドウを登録する。
%group
Win32 user32
%prm
window, notifyRange
window : [intptr] WM_POINTERDEVICECHANGE、WM_POINTERDEVICEINRANGE、WM_POINTERDEVICEOUTOFRANGE 通知を受け取るウィンドウ。
notifyRange : [int] TRUE なら WM_POINTERDEVICEINRANGE と WM_POINTERDEVICEOUTOFRANGE メッセージを処理する。FALSE なら処理しない。
%inst

WM_POINTERDEVICECHANGE、WM_POINTERDEVICEINRANGE、WM_POINTERDEVICEOUTOFRANGE
ポインタデバイス通知を処理するウィンドウを登録する。

[戻り値]
関数が成功した場合は TRUE、そうでない場合は FALSE を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。


%index
RegisterPointerInputTarget
呼び出し元が指定種別のすべてのポインタ入力をリダイレクトされるターゲットウィンドウを登録できるようにする。
%group
Win32 user32
%prm
hwnd, pointerType
hwnd : [intptr] グローバルリダイレクトターゲットとして登録するウィンドウ。
pointerType : [int] 指定ウィンドウにリダイレクトするポインタ入力の種別。POINTER_INPUT_TYPE 列挙型の有効な値のいずれか。汎用 PT_POINTER と PT_MOUSE 型はこのパラメータには無効。
%inst
呼び出し元が指定種別のすべてのポインタ入力をリダイレクトされるターゲットウィンドウを登録できるようにする。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
UI
アクセス権限を持つアプリケーションは、指定ポインタ入力種別のすべての入力を受け取るよう自身のウィンドウを登録できる。各デスクトップはポインタ入力種別ごとに
1 つのグローバルリダイレクトターゲットウィンドウしか許可しない。


%index
RegisterPointerInputTargetEx
RegisterPointerInputTargetEx は変更または利用不可になる可能性がある。代わりに RegisterPointerInputTarget を使用する。
%group
Win32 user32
%prm
hwnd, pointerType, fObserve
hwnd : [intptr] サポートされていない。
pointerType : [int] サポートされていない。
fObserve : [int] サポートされていない。
%inst
RegisterPointerInputTargetEx は変更または利用不可になる可能性がある。代わりに
RegisterPointerInputTarget を使用する。

[戻り値]
サポートされていない。


%index
UnregisterPowerSettingNotification
電源設定通知の登録を解除する。
%group
Win32 user32
%prm
Handle
Handle : [intptr] RegisterPowerSettingNotification 関数から返されたハンドル。
%inst
電源設定通知の登録を解除する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。


%index
RegisterPowerSettingNotification
特定の電源設定イベントに対する電源設定通知をアプリケーションに登録する。
%group
Win32 user32
%prm
hRecipient, PowerSettingGuid, Flags
hRecipient : [intptr] 電源設定通知を送る先を示すハンドル。対話型アプリケーションでは Flags は 0、hRecipient はウィンドウハンドル。サービスでは Flags は 1、hRecipient は SERVICE_STATUS_HANDLE。
PowerSettingGuid : [var] 通知を送る電源設定の GUID。
Flags : [int] （以下省略）
%inst
特定の電源設定イベントに対する電源設定通知をアプリケーションに登録する。

[戻り値]
電源通知登録解除用の通知ハンドルを返す。関数が失敗した場合、戻り値は NULL。拡張エラー情報を取得するには GetLastError
を呼ぶ。


%index
RegisterRawInputDevices
生の入力データを供給するデバイスを登録する。
%group
Win32 user32
%prm
pRawInputDevices, uiNumDevices, cbSize
pRawInputDevices : [var] 型: PCRAWINPUTDEVICE 生の入力を供給するデバイスを表す RAWINPUTDEVICE 構造体の配列。
uiNumDevices : [int] 型: UINT pRawInputDevices が指す RAWINPUTDEVICE 構造体の数。
cbSize : [int] 型: UINT RAWINPUTDEVICE 構造体のサイズ(バイト単位)。
%inst
生の入力データを供給するデバイスを登録する。

[戻り値]
型: BOOL 関数が成功した場合は TRUE、そうでない場合は FALSE。失敗した場合は GetLastError で詳細を取得する。

[備考]
WM_INPUT メッセージを受け取るには、アプリケーションはまず RegisterRawInputDevices
で生の入力デバイスを登録する必要がある。既定ではアプリケーションは生の入力を受け取らない。


%index
RegisterShellHookWindow
シェルアプリケーションに有用なイベントまたは通知に対して特定のメッセージを受け取るよう指定されたシェルウィンドウを登録する。
%group
Win32 user32
%prm
hwnd
hwnd : [intptr] 型: HWND シェルフックメッセージを受け取るよう登録するウィンドウへのハンドル。
%inst
シェルアプリケーションに有用なイベントまたは通知に対して特定のメッセージを受け取るよう指定されたシェルウィンドウを登録する。

[戻り値]
型: BOOL 関数が成功した場合は TRUE、そうでない場合は FALSE。

[備考]
通常のウィンドウメッセージと同様、ウィンドウプロシージャの第 2 パラメータはメッセージを WM_SHELLHOOKMESSAGE
として識別する。ただし、これらのシェルフックメッセージでは、メッセージ値は事前定義定数ではなく RegisterWindowMessage
の呼び出しで動的に取得する必要がある。


%index
RegisterSuspendResumeNotification
システムがサスペンドまたは再開されたときに通知を受け取るよう登録する。
%group
Win32 user32
%prm
hRecipient, Flags
hRecipient : [intptr] 電源通知の購読パラメータまたは購読プロセスを表すウィンドウハンドルを含む。Flags が DEVICE_NOTIFY_CALLBACK なら DEVICE_NOTIFY_SUBSCRIBE_PARAMETERS 構造体へのポインタとして解釈される。DEVICE_NOTIFY_WINDOW_HANDLE ならイベントを届ける先のウィンドウへのハンドル。
Flags : [int] DEVICE_NOTIFY_WINDOW_HANDLE または DEVICE_NOTIFY_CALLBACK を指定できる。
%inst
システムがサスペンドまたは再開されたときに通知を受け取るよう登録する。

[戻り値]
登録ハンドル。このハンドルで通知登録を解除する。関数が失敗した場合、戻り値は NULL。拡張エラー情報を取得するには
GetLastError を呼ぶ。


%index
RegisterTouchHitTestingWindow
WM_TOUCHHITTESTING 通知を処理するウィンドウを登録する。
%group
Win32 user32
%prm
hwnd, value
hwnd : [intptr] WM_TOUCHHITTESTING 通知を受け取るウィンドウ。
value : [int] 
%inst
WM_TOUCHHITTESTING 通知を処理するウィンドウを登録する。

[戻り値]
関数が成功した場合は TRUE、そうでない場合は FALSE を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。


%index
RegisterTouchWindow
ウィンドウをタッチ対応として登録する。
%group
Win32 user32
%prm
hwnd, ulFlags
hwnd : [intptr] 登録するウィンドウのハンドル。呼び出しスレッドが指定ウィンドウを所有していない場合、関数は ERROR_ACCESS_DENIED で失敗する。
ulFlags : [int] 
%inst
ウィンドウをタッチ対応として登録する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。
失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
注意: RegisterTouchWindow はタッチ入力に使用するすべてのウィンドウで呼ぶ必要がある。TWF_WANTPALM
が有効な場合、タッチ入力のパケットはバッファリングされず、パケットがアプリケーションに送られる前に手のひら検出が行われない。


%index
RegisterWindowMessageW
システム全体で一意であることが保証される新しいウィンドウメッセージを定義する。(Unicode)
%group
Win32 user32
%prm
lpString
lpString : [wstr] 型: LPCTSTR 登録するメッセージ。
%inst
システム全体で一意であることが保証される新しいウィンドウメッセージを定義する。(Unicode)

[戻り値]
型: UINT メッセージが正常に登録された場合、戻り値は 0xC000 から 0xFFFF
の範囲のメッセージ識別子。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
RegisterWindowMessage 関数は通常、協調する 2
つのアプリケーション間の通信用メッセージを登録するために使用される。2
つの異なるアプリケーションが同じメッセージ文字列を登録すると、同じメッセージ値が返される。メッセージはセッション終了まで登録されたままになる。


%index
ReleaseCapture
現在のスレッド内のウィンドウからマウスキャプチャを解放し、通常のマウス入力処理を復元する。
%group
Win32 user32
%prm

%inst
現在のスレッド内のウィンドウからマウスキャプチャを解放し、通常のマウス入力処理を復元する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
SetCapture 関数の呼び出し後にアプリケーションがこの関数を呼ぶ。


%index
ReleaseDC
ReleaseDC 関数はデバイスコンテキスト (DC) を解放し、他のアプリケーションで使用できるようにする。共通 DC とウィンドウ DC のみ解放する。クラスまたはプライベート DC には影響しない。
%group
Win32 user32
%prm
hWnd, hDC
hWnd : [intptr] DC を解放するウィンドウへのハンドル。
hDC : [intptr] 解放する DC へのハンドル。
%inst
ReleaseDC 関数はデバイスコンテキスト (DC) を解放し、他のアプリケーションで使用できるようにする。共通 DC とウィンドウ
DC のみ解放する。クラスまたはプライベート DC には影響しない。

[戻り値]
戻り値は DC が解放されたかを示す。解放された場合は 1、解放されなかった場合は 0。

[備考]
アプリケーションは GetWindowDC の呼び出しごと、および共通 DC を取得する GetDC の呼び出しごとに ReleaseDC
関数を呼ぶ必要がある。CreateDC で作成された DC を ReleaseDC で解放することはできず、DeleteDC
を使用する。ReleaseDC は GetDC と同じスレッドから呼ぶ必要がある。


%index
RemoveClipboardFormatListener
指定ウィンドウをシステム管理のクリップボード形式リスナーリストから削除する。
%group
Win32 user32
%prm
hwnd
hwnd : [intptr] 型: HWND クリップボード形式リスナーリストから削除するウィンドウへのハンドル。
%inst
指定ウィンドウをシステム管理のクリップボード形式リスナーリストから削除する。

[戻り値]
型: BOOL 成功した場合は TRUE、そうでない場合は FALSE を返す。詳細は GetLastError を呼ぶ。

[備考]
クリップボード形式リスナーリストから削除されたウィンドウは WM_CLIPBOARDUPDATE メッセージを受け取らなくなる。


%index
RemoveMenu
指定されたメニューからメニュー項目を削除するか、サブメニューを切り離す。
%group
Win32 user32
%prm
hMenu, uPosition, uFlags
hMenu : [intptr] 型: HMENU 変更するメニューへのハンドル。
uPosition : [int] 型: UINT 削除するメニュー項目。uFlags により解釈される。
uFlags : [int] 型: UINT
%inst
指定されたメニューからメニュー項目を削除するか、サブメニューを切り離す。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
アプリケーションはメニューが変更されるたびに DrawMenuBar 関数を呼ぶ必要がある。


%index
RemovePropW
指定されたウィンドウのプロパティリストからエントリを削除する。指定された文字列が削除するエントリを識別する。(Unicode)
%group
Win32 user32
%prm
hWnd, lpString
hWnd : [intptr] 型: HWND プロパティリストを変更するウィンドウへのハンドル。
lpString : [wstr] 型: LPCTSTR null 終端文字列、または文字列を識別するアトム。アトムの場合は GlobalAddAtom で作成したもので、下位ワードに配置、上位ワードは 0。
%inst
指定されたウィンドウのプロパティリストからエントリを削除する。指定された文字列が削除するエントリを識別する。(Unicode)

[戻り値]
型: HANDLE 戻り値は指定されたデータを識別する。指定プロパティリスト内にデータが見つからない場合、戻り値は NULL。

[備考]
戻り値は SetProp に渡された hData
値で、アプリケーション定義の値。この関数はデータとウィンドウの関連付けを破棄するのみである。必要に応じてアプリケーションはプロパティリストから削除されたエントリに関連付けられたデータハンドルを解放する必要がある。


%index
ReplyMessage
SendMessage 関数により別のスレッドから送信されたメッセージに返信する。
%group
Win32 user32
%prm
lResult
lResult : [intptr] 型: LRESULT メッセージ処理の結果。可能な値は送信されたメッセージに依存する。
%inst
SendMessage 関数により別のスレッドから送信されたメッセージに返信する。

[戻り値]
型: BOOL 呼び出しスレッドが別のスレッドまたはプロセスから送信されたメッセージを処理していた場合、戻り値は 0
以外。そうでない場合は 0。

[備考]
この関数を呼ぶことで、メッセージを受け取ったウィンドウプロシージャは、SendMessage
を呼んだスレッドを、あたかもメッセージを受け取るスレッドが制御を返したかのように実行継続させる。


%index
ReuseDDElParam
アプリケーションが新しいパック lParam を割り当てる代わりに、パック済み動的データ交換 (DDE) lParam パラメータを再利用できるようにする。
%group
Win32 user32
%prm
lParam, msgIn, msgOut, uiLo, uiHi
lParam : [intptr] 型: LPARAM 再利用される、ポスト済み DDE メッセージの lParam パラメータ。
msgIn : [int] 型: UINT 受信した DDE メッセージの識別子。
msgOut : [int] 型: UINT ポストする DDE メッセージの識別子。この DDE メッセージはパックされた lParam を再利用する。
uiLo : [int] 型: UINT_PTR 再利用する lParam の下位ワードにパックする値。
uiHi : [int] 型: UINT_PTR 再利用する lParam の上位ワードにパックする値。
%inst
アプリケーションが新しいパック lParam を割り当てる代わりに、パック済み動的データ交換 (DDE) lParam
パラメータを再利用できるようにする。

[戻り値]
型: LPARAM 戻り値は新しい lParam 値。

[備考]
戻り値は DDE メッセージの lParam としてポストする必要があり、他の目的に使用してはならない。応答メッセージで lParam
を再利用する場合は FreeDDElParam の代わりに ReuseDDElParam を使用する。


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
ScrollDC
ScrollDC 関数はビットの矩形を水平および垂直にスクロールする。
%group
Win32 user32
%prm
hDC, dx, dy, lprcScroll, lprcClip, hrgnUpdate, lprcUpdate
hDC : [intptr] 型: HDC スクロール対象のビットを含むデバイスコンテキストへのハンドル。
dx : [int] 型: int 水平スクロール量(デバイス単位)。左にスクロールするには負値を指定する。
dy : [int] 型: int 垂直スクロール量(デバイス単位)。上にスクロールするには負値を指定する。
lprcScroll : [var] 型: const RECT* スクロールするビットの座標を含む RECT 構造体へのポインタ。この矩形と lprcClip の交差部分内のビットのみがスクロール操作の影響を受ける。NULL ならクライアント領域全体。
lprcClip : [var] 型: const RECT* クリッピング矩形の座標を含む RECT 構造体へのポインタ。スクロール操作後もこの矩形内に残るビットのみが描画される。NULL ならクライアント領域全体が使用される。
hrgnUpdate : [intptr] 型: HRGN スクロール処理によって露出した領域へのハンドル。ScrollDC がこの領域を定義する。必ずしも矩形ではない。
lprcUpdate : [var] 型: LPRECT スクロール更新領域の境界矩形の座標を受け取る RECT 構造体へのポインタ。
%inst
ScrollDC 関数はビットの矩形を水平および垂直にスクロールする。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
lprcUpdate が NULL の場合、システムは更新矩形を計算しない。hrgnUpdate と lprcUpdate の両方が
NULL なら、システムは更新領域を計算しない。ウィンドウ全体のクライアント領域をスクロールする必要がある場合は
ScrollWindowEx を使用する。


%index
ScrollWindow
ScrollWindow 関数は指定されたウィンドウのクライアント領域の内容をスクロールする。
%group
Win32 user32
%prm
hWnd, XAmount, YAmount, lpRect, lpClipRect
hWnd : [intptr] 型: HWND クライアント領域をスクロールするウィンドウへのハンドル。
XAmount : [int] 型: int 水平スクロール量(デバイス単位)。ウィンドウが CS_OWNDC または CS_CLASSDC スタイルを持つ場合、論理単位が使用される。左にスクロールするには負値を指定する。
YAmount : [int] 型: int 垂直スクロール量(デバイス単位)。上にスクロールするには負値を指定する。
lpRect : [var] 型: const RECT* スクロールするクライアント領域の部分を指定する RECT 構造体へのポインタ。NULL ならクライアント領域全体がスクロールされる。
lpClipRect : [var] 型: const RECT* クリッピング矩形の座標を含む RECT 構造体へのポインタ。クリッピング矩形内のデバイスビットのみが影響を受ける。
%inst
ScrollWindow 関数は指定されたウィンドウのクライアント領域の内容をスクロールする。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
スクロール対象ウィンドウにキャレットがある場合、ScrollWindow
は消去を防ぐためキャレットを自動的に隠し、スクロール完了後に復元する。


%index
ScrollWindowEx
ScrollWindowEx 関数は指定されたウィンドウのクライアント領域の内容をスクロールする。
%group
Win32 user32
%prm
hWnd, dx, dy, prcScroll, prcClip, hrgnUpdate, prcUpdate, flags
hWnd : [intptr] 型: HWND クライアント領域をスクロールするウィンドウへのハンドル。
dx : [int] 型: int 水平スクロール量(デバイス単位)。左にスクロールするには負値を指定する。
dy : [int] 型: int 垂直スクロール量(デバイス単位)。上にスクロールするには負値を指定する。
prcScroll : [var] 型: const RECT* スクロールするクライアント領域の部分を指定する RECT 構造体へのポインタ。NULL ならクライアント領域全体。
prcClip : [var] 型: const RECT* クリッピング矩形の座標を含む RECT 構造体へのポインタ。NULL 可。
hrgnUpdate : [intptr] 型: HRGN スクロールによって無効化された領域を保持するよう変更される領域へのハンドル。NULL 可。
prcUpdate : [var] 型: LPRECT スクロールによって無効化された矩形の境界を受け取る RECT 構造体へのポインタ。NULL 可。
flags : [int] 型: UINT
%inst
ScrollWindowEx 関数は指定されたウィンドウのクライアント領域の内容をスクロールする。

[戻り値]
型: int 関数が成功した場合、戻り値は SIMPLEREGION、COMPLEXREGION、または
NULLREGION。失敗した場合、戻り値は ERROR。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
SW_INVALIDATE と SW_ERASE フラグのどちらも指定されていない場合、ScrollWindowEx
はスクロール元の領域を無効化しない。ウィンドウが WS_CLIPCHILDREN
スタイルを持つ場合、返される領域は更新が必要なスクロールウィンドウの全領域(子ウィンドウ内の更新領域を含む)を表す。


%index
SendDlgItemMessageW
ダイアログ内の指定コントロールにメッセージを送る。(Unicode)
%group
Win32 user32
%prm
hDlg, nIDDlgItem, Msg, wParam, lParam
hDlg : [intptr] 型: HWND コントロールを含むダイアログへのハンドル。
nIDDlgItem : [int] 型: int メッセージを受け取るコントロールの識別子。
Msg : [int] 型: UINT 送信するメッセージ。
wParam : [intptr] 型: WPARAM メッセージ固有の追加情報。
lParam : [intptr] 型: LPARAM メッセージ固有の追加情報。
%inst
ダイアログ内の指定コントロールにメッセージを送る。(Unicode)

[戻り値]
型: LRESULT 戻り値はメッセージ処理の結果を示し、送信したメッセージに依存する。

[備考]
SendDlgItemMessage 関数はメッセージが処理されるまで戻らない。SendDlgItemMessage
を使用することは、指定コントロールへのハンドルを取得して SendMessage 関数を呼ぶことと同等である。


%index
SendIMEMessageExW
指定されたサブ関数を通じて入力方式エディタ (IME) に対するアクションまたは処理を指定する。(Unicode)
%group
Win32 user32
%prm
param0, param1
param0 : [intptr] 
param1 : [intptr] 
%inst
指定されたサブ関数を通じて入力方式エディタ (IME) に対するアクションまたは処理を指定する。(Unicode)

[戻り値]
サブ関数の処理結果。成功でない場合、次のエラーコードのいずれかが IMESTRUCT 構造体の wParam に格納される。
（以下省略）

[備考]
SendIMEMessageEx は WM_CONVERTREQUESTEX メッセージをサポートする IME
に対してのみ仕様に規定された動作を保証する。サブ関数の処理が正常に完了しなかった場合、これらの関数は IME_RS_ERROR を
wParam に設定する。


%index
SendInput
キー入力、マウス移動、ボタンクリックを合成する。
%group
Win32 user32
%prm
cInputs, pInputs, cbSize
cInputs : [int] 型: UINT pInputs 配列内の構造体の数。
pInputs : [var] 型: LPINPUT INPUT 構造体の配列。各構造体はキーボードまたはマウス入力ストリームに挿入するイベントを表す。
cbSize : [int] 型: int INPUT 構造体のサイズ(バイト単位)。INPUT 構造体のサイズと一致しない場合、関数は失敗する。
%inst
キー入力、マウス移動、ボタンクリックを合成する。

[戻り値]
型: UINT キーボードまたはマウス入力ストリームに正常に挿入されたイベント数を返す。0
を返した場合、入力は既に別スレッドによってブロックされている。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
この関数は UIPI
の対象となる。アプリケーションは同等または低い整合性レベルのアプリケーションにのみ入力を注入できる。SendInput 関数は INPUT
構造体のイベントをキーボードまたはマウス入力ストリームに順次挿入する。


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
SendMessageCallbackW
指定されたメッセージを 1 つまたは複数のウィンドウに送る。(SendMessageCallbackW)
%group
Win32 user32
%prm
hWnd, Msg, wParam, lParam, lpResultCallBack, dwData
hWnd : [intptr] 型: HWND メッセージを受け取るウィンドウプロシージャを持つウィンドウへのハンドル。HWND_BROADCAST の場合、システム内のすべてのトップレベルウィンドウに送信される。ただし子ウィンドウには送信されない。
Msg : [int] 型: UINT 送信するメッセージ。
wParam : [intptr] 型: WPARAM メッセージ固有の追加情報。
lParam : [intptr] 型: LPARAM メッセージ固有の追加情報。
lpResultCallBack : [int] 型: SENDASYNCPROC ウィンドウプロシージャがメッセージを処理した後にシステムが呼び出すコールバック関数へのポインタ。
dwData : [int] 型: ULONG_PTR lpCallBack が指すコールバック関数に送られるアプリケーション定義の値。
%inst
指定されたメッセージを 1 つまたは複数のウィンドウに送る。(SendMessageCallbackW)

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]

対象ウィンドウが呼び出し元と同じスレッドに属する場合、ウィンドウプロシージャは同期的に呼ばれ、コールバック関数はウィンドウプロシージャが戻った直後に呼ばれる。WM_USER
より下の範囲のメッセージを非同期メッセージ関数に送る場合、メッセージパラメータにポインタを含められない。


%index
SendMessageTimeoutW
指定メッセージを 1 つ以上のウィンドウに送る。(Unicode)
%group
Win32 user32
%prm
hWnd, Msg, wParam, lParam, fuFlags, uTimeout, lpdwResult
hWnd : [intptr] 型: HWND メッセージを受け取るウィンドウプロシージャを持つウィンドウへのハンドル。HWND_BROADCAST の場合、無効または非可視の未所有ウィンドウを含むすべてのトップレベルウィンドウに送信される。各ウィンドウがタイムアウトするまで関数は戻らない。
Msg : [int] 型: UINT 送信するメッセージ。
wParam : [intptr] 型: WPARAM メッセージ固有の追加情報。
lParam : [intptr] 型: LPARAM メッセージ固有の追加情報。
fuFlags : [int] 型: UINT
uTimeout : [int] 型: UINT タイムアウト時間(ミリ秒単位)。ブロードキャストメッセージの場合、各ウィンドウが全タイムアウト時間を使用できる。
lpdwResult : [var] 型: PDWORD_PTR メッセージ処理の結果。値は送信するメッセージに依存する。
%inst
指定メッセージを 1 つ以上のウィンドウに送る。(Unicode)

[戻り値]
型: LRESULT 関数が成功した場合、戻り値は 0 以外。失敗またはタイムアウトの場合は 0。GetLastError が
ERROR_TIMEOUT を返すならタイムアウトしたことを示す。

[備考]

関数は指定ウィンドウのウィンドウプロシージャを呼び、別スレッドに属する場合はメッセージ処理が終わるかタイムアウトまで戻らない。同じキューに属する場合はウィンドウプロシージャが直接呼ばれ、タイムアウト値は無視される。


%index
SendNotifyMessageW
指定されたメッセージを 1 つまたは複数のウィンドウに送る。(SendNotifyMessageW)
%group
Win32 user32
%prm
hWnd, Msg, wParam, lParam
hWnd : [intptr] 型: HWND メッセージを受け取るウィンドウプロシージャを持つウィンドウへのハンドル。HWND_BROADCAST の場合、すべてのトップレベルウィンドウに送信される。子ウィンドウには送信されない。
Msg : [int] 型: UINT 送信するメッセージ。
wParam : [intptr] 型: WPARAM メッセージ固有の追加情報。
lParam : [intptr] 型: LPARAM メッセージ固有の追加情報。
%inst
指定されたメッセージを 1 つまたは複数のウィンドウに送る。(SendNotifyMessageW)

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
WM_USER より下の範囲のメッセージを非同期メッセージ関数
(PostMessage、SendNotifyMessage、SendMessageCallback)
に送る場合、メッセージパラメータにポインタを含められない。


%index
SetActiveWindow
ウィンドウをアクティブ化する。ウィンドウは呼び出しスレッドのメッセージキューにアタッチされている必要がある。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND アクティブ化するトップレベルウィンドウへのハンドル。
%inst
ウィンドウをアクティブ化する。ウィンドウは呼び出しスレッドのメッセージキューにアタッチされている必要がある。

[戻り値]
型: HWND 関数が成功した場合、戻り値は以前アクティブだったウィンドウへのハンドル。失敗した場合、戻り値は
NULL。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
SetActiveWindow 関数はウィンドウをアクティブ化するが、アプリケーションが背景にある場合は前景には出さない。hWnd
で示されるウィンドウが呼び出しスレッドによって作成されたものならば、呼び出しスレッドのアクティブウィンドウステータスが hWnd
に設定される。


%index
SetCapture
現スレッドに属する指定ウィンドウにマウスキャプチャを設定する。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND 現スレッド内でマウスをキャプチャするウィンドウへのハンドル。
%inst
現スレッドに属する指定ウィンドウにマウスキャプチャを設定する。

[戻り値]
型: HWND 戻り値は以前マウスをキャプチャしていたウィンドウへのハンドル。そのようなウィンドウがない場合、戻り値は NULL。

[備考]

前景ウィンドウのみがマウスをキャプチャできる。別プロセス宛てのマウス入力をキャプチャするためには使用できない。マウスがキャプチャされているとき、メニューホットキーや他のキーボードアクセラレータは機能しない。


%index
SetCaretBlinkTime
キャレットの点滅時間を指定されたミリ秒数に設定する。点滅時間はキャレットのピクセルを反転するのに必要な経過時間(ミリ秒単位)。
%group
Win32 user32
%prm
uMSeconds
uMSeconds : [int] 型: UINT 新しい点滅時間(ミリ秒単位)。
%inst
キャレットの点滅時間を指定されたミリ秒数に設定する。点滅時間はキャレットのピクセルを反転するのに必要な経過時間(ミリ秒単位)。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]

ユーザはコントロールパネルで点滅時間を設定できる。アプリケーションはユーザが選択した設定を尊重すべきである。SetCaretBlinkTime
関数は、コントロールパネルアプレットなど、ユーザが点滅時間を設定できるアプリケーションでのみ使用すべきである。


%index
SetCaretPos
キャレットを指定座標に移動する。キャレットを所有するウィンドウが CS_OWNDC クラススタイルで作成されている場合、指定座標はそのウィンドウに関連付けられたデバイスコンテキストのマッピングモードに従う。
%group
Win32 user32
%prm
X, Y
X : [int] 型: int キャレットの新しい x 座標。
Y : [int] 型: int キャレットの新しい y 座標。
%inst
キャレットを指定座標に移動する。キャレットを所有するウィンドウが CS_OWNDC
クラススタイルで作成されている場合、指定座標はそのウィンドウに関連付けられたデバイスコンテキストのマッピングモードに従う。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外となる。失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
SetCaretPos はキャレットが隠されているかに関わらず移動する。システムは各キューに 1
つのキャレットを提供する。ウィンドウはキーボードフォーカスを持つかアクティブであるときにのみキャレットを作成すべきで、失う前に破棄すべきである。ウィンドウはキャレットを所有している場合にのみキャレット位置を設定できる。


%index
SetClassLongW
指定されたウィンドウが属するクラスの追加クラスメモリまたは WNDCLASSEX 構造体の指定オフセットにある 32 ビット値を置き換える。(Unicode)
%group
Win32 user32
%prm
hWnd, nIndex, dwNewLong
hWnd : [intptr] 型: HWND ウィンドウ、および間接的にウィンドウが属するクラスへのハンドル。
nIndex : [int] 型: int
dwNewLong : [int] 型: LONG 置換値。
%inst
指定されたウィンドウが属するクラスの追加クラスメモリまたは WNDCLASSEX 構造体の指定オフセットにある 32
ビット値を置き換える。(Unicode)

[戻り値]
型: DWORD 関数が成功した場合、戻り値は指定された 32 ビット整数の以前の値。以前に設定されていなければ
0。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
GCL_WNDPROC インデックスでウィンドウプロシージャを置き換える場合、ウィンドウプロシージャは WindowProc
コールバック関数の説明で指定されたガイドラインに従う必要がある。GCL_WNDPROC で SetClassLong
を呼ぶと、以降にそのクラスで作成されるすべてのウィンドウに影響するウィンドウクラスのサブクラスが作成される。


%index
SetClassWord
指定されたウィンドウが属するウィンドウクラスの追加クラスメモリの指定オフセットにある 16 ビット (WORD) 値を置き換える。
%group
Win32 user32
%prm
hWnd, nIndex, wNewWord
hWnd : [intptr] 型: HWND ウィンドウ、および間接的にウィンドウが属するクラスへのハンドル。
nIndex : [int] 型: int 置換する値の 0 ベースのバイトオフセット。
wNewWord : [int] 型: WORD 置換値。
%inst
指定されたウィンドウが属するウィンドウクラスの追加クラスメモリの指定オフセットにある 16 ビット (WORD) 値を置き換える。

[戻り値]
型: WORD 関数が成功した場合、戻り値は指定された 16 ビット整数の以前の値。以前に設定されていなければ
0。関数が失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
RegisterClass で使用する WNDCLASS 構造体の cbClsExtra メンバに 0
以外の値を指定して追加クラスメモリを予約する。


%index
SetClipboardData
指定されたクリップボード形式でクリップボードにデータを置く。
%group
Win32 user32
%prm
uFormat, hMem
uFormat : [int] 型: UINT クリップボード形式。登録済み形式または標準クリップボード形式のいずれか。
hMem : [intptr] 型: HANDLE 指定形式のデータへのハンドル。NULL を指定すると、ウィンドウは要求時に指定クリップボード形式でデータを提供する(遅延レンダリングと呼ばれる)。成功すると、システムが hMem で識別されるオブジェクトを所有する。所有権がシステムに移った後、アプリケーションはデータを書き込んだり解放したりしてはならない。
%inst
指定されたクリップボード形式でクリップボードにデータを置く。

[戻り値]
型: HANDLE 関数が成功した場合、戻り値はデータへのハンドル。失敗した場合、戻り値は NULL。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
Windows 8: Windows ストアアプリと共有するビットマップは CF_BITMAP
形式(デバイス依存ビットマップ)でなければならない。アプリケーションが WM_RENDERFORMAT または
WM_RENDERALLFORMATS に応答して SetClipboardData
を呼ぶ場合、呼び出し後にハンドルを使用してはならない。


%index
SetClipboardViewer
指定されたウィンドウをクリップボードビューアのチェーンに追加する。クリップボードビューアウィンドウはクリップボード内容が変更されるたびに WM_DRAWCLIPBOARD メッセージを受け取る。この関数は過去の Windows との後方互換性のために使用される。
%group
Win32 user32
%prm
hWndNewViewer
hWndNewViewer : [intptr] 型: HWND クリップボードチェーンに追加するウィンドウへのハンドル。
%inst
指定されたウィンドウをクリップボードビューアのチェーンに追加する。クリップボードビューアウィンドウはクリップボード内容が変更されるたびに
WM_DRAWCLIPBOARD メッセージを受け取る。この関数は過去の Windows との後方互換性のために使用される。

[戻り値]
型: HWND
関数が成功した場合、戻り値はクリップボードビューアチェーン内の次のウィンドウを識別する。エラーまたは他にウィンドウがない場合、戻り値は
NULL。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
クリップボードビューアチェーンの一部であるウィンドウ(クリップボードビューアウィンドウ)は WM_CHANGECBCHAIN と
WM_DRAWCLIPBOARD クリップボードメッセージを処理する必要がある。各クリップボードビューアウィンドウは
SendMessage
関数を呼び出してこれらのメッセージをチェーン内の次のウィンドウに渡す。新しいアプリケーションはクリップボードシーケンス番号やクリップボード形式リスナーの登録などより堅牢な手法を使うべきである。


%index
SetCoalescableTimer
指定されたタイムアウト値と結合許容遅延を持つタイマを作成する。
%group
Win32 user32
%prm
hWnd, nIDEvent, uElapse, lpTimerFunc, uToleranceDelay
hWnd : [intptr] 型: HWND タイマに関連付けるウィンドウへのハンドル。このウィンドウは呼び出しスレッドが所有している必要がある。
nIDEvent : [int] 型: UINT_PTR タイマ識別子。hWnd が NULL で nIDEvent が既存のタイマと一致しない場合、nIDEvent は無視され新しいタイマ ID が生成される。
uElapse : [int] 型: UINT タイムアウト値(ミリ秒単位)。USER_TIMER_MINIMUM (0x0000000A) より小さい場合は USER_TIMER_MINIMUM に設定される。USER_TIMER_MAXIMUM (0x7FFFFFFF) より大きい場合は USER_TIMER_MAXIMUM に設定される。
lpTimerFunc : [int] 型: TIMERPROC タイムアウト値が経過したときに通知される関数へのポインタ。NULL の場合、システムは WM_TIMER メッセージをアプリケーションキューにポストする。
uToleranceDelay : [int] 型: ULONG
%inst
指定されたタイムアウト値と結合許容遅延を持つタイマを作成する。

[戻り値]
型: UINT_PTR 関数が成功し hWnd が NULL の場合、戻り値は新しいタイマを識別する整数。hWnd が NULL
でない場合は 0 以外の整数。失敗した場合は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
アプリケーションはウィンドウプロシージャに WM_TIMER case 文を含めるか、タイマ作成時に TimerProc
コールバック関数を指定して WM_TIMER メッセージを処理できる。uToleranceDelay が 0
の場合、システム既定のタイマ結合が使用され、SetCoalescableTimer は SetTimer
と同じ動作をする。SetCoalescableTimer
や他のタイマ関連関数を使用する前に、SetUserObjectInformationW で
UOI_TIMERPROC_EXCEPTION_SUPPRESSION フラグを FALSE に設定することが推奨される。


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
SetDebugErrorLevel
(no summary)
%group
Win32 user32
%prm
dwLevel
dwLevel : [int] 
%inst



%index
SetDialogControlDpiChangeBehavior
ダイアログ内の子ウィンドウの既定のモニタごとの DPI スケーリング動作をオーバーライドする。
%group
Win32 user32
%prm
hWnd, mask, values
hWnd : [intptr] 動作を変更するウィンドウへのハンドル。
mask : [int] 変更するフラグのサブセットを指定するマスク。
values : [int] 指定されたフラグサブセットに設定する値。
%inst
ダイアログ内の子ウィンドウの既定のモニタごとの DPI スケーリング動作をオーバーライドする。

[戻り値]
操作が成功した場合は TRUE、そうでない場合は FALSE を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
動作は DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS 列挙値で指定する。この関数はフラグ設定の典型的な 2
パラメータアプローチに従い、マスクで変更するフラグのサブセットを指定する。任意のウィンドウでこれらの動作を設定できる。動作は保持され、ウィンドウがモニタごとの
DPI スケーリングが有効なダイアログの直接の子になったときにのみ有効化される。


%index
SetDialogDpiChangeBehavior
モニタごと v2 コンテキストのダイアログは自動的に DPI スケーリングされる。このメソッドで DPI 変更動作をカスタマイズできる。
%group
Win32 user32
%prm
hDlg, mask, values
hDlg : [intptr] 動作を変更するダイアログへのハンドル。
mask : [int] 変更するフラグのサブセットを指定するマスク。
values : [int] 指定されたフラグサブセットに設定する値。
%inst
モニタごと v2 コンテキストのダイアログは自動的に DPI スケーリングされる。このメソッドで DPI 変更動作をカスタマイズできる。

[戻り値]
操作が成功した場合は TRUE、そうでない場合は FALSE を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
拡張性のため、DIALOG_DPI_CHANGE_BEHAVIORS は個別の動作を表すビットフラグのセットとしてモデル化されている。この
API はモニタごと v2 コンテキスト外で呼ばれてもエラーにはならないが、コンテキストがモニタごと v2
に変わるまではフラグは効果を持たない。


%index
SetDisplayAutoRotationPreferences
現在のプロセスの画面自動回転設定を設定する。
%group
Win32 user32
%prm
orientation
orientation : [int] 呼び出しプロセスに設定する画面向き設定を持つメモリ位置へのポインタ。
%inst
現在のプロセスの画面自動回転設定を設定する。

[戻り値]
メソッドが成功した場合は TRUE、そうでない場合は FALSE。


%index
SetDisplayConfig
SetDisplayConfig 関数は現在のセッションで指定されたパスを排他的に有効化することにより、ディスプレイトポロジ、ソース、ターゲットモードを変更する。
%group
Win32 user32
%prm
numPathArrayElements, pathArray, numModeInfoArrayElements, modeInfoArray, flags
numPathArrayElements : [int] pathArray の要素数。
pathArray : [var] 設定するすべてのディスプレイパスの配列。DISPLAYCONFIG_PATH_INFO の flags メンバに DISPLAYCONFIG_PATH_ACTIVE フラグが設定されたパスのみが設定される。NULL 可。アクティブパスの順序がパス優先順位を決定する。
numModeInfoArrayElements : [int] modeInfoArray の要素数。
modeInfoArray : [var] pathArray のパス情報要素の DISPLAYCONFIG_PATH_SOURCE_INFO と DISPLAYCONFIG_PATH_TARGET_INFO の modeInfoIdx メンバから参照される、ディスプレイソースとターゲットのモード情報の配列。NULL 可。
flags : [int] 
%inst
SetDisplayConfig
関数は現在のセッションで指定されたパスを排他的に有効化することにより、ディスプレイトポロジ、ソース、ターゲットモードを変更する。

[戻り値]
関数は次のいずれかの戻り値を返す。
（以下省略）

[備考]
SetDisplayConfig
関数は指定されたソースおよびターゲットモード情報を持つアクティブディスプレイパスを取り、最適モードロジックで欠落しているソースおよびターゲットモード情報を生成する。


%index
SetDlgItemInt
ダイアログ内のコントロールのテキストを指定整数値の文字列表現に設定する。
%group
Win32 user32
%prm
hDlg, nIDDlgItem, uValue, bSigned
hDlg : [intptr] 型: HWND コントロールを含むダイアログへのハンドル。
nIDDlgItem : [int] 型: int 変更するコントロール。
uValue : [int] 型: UINT 項目テキスト生成に使う整数値。
bSigned : [int] 型: BOOL uValue が符号付きか符号なしかを示す。TRUE なら符号付きで、負値の場合は最初の桁の前にマイナス記号が置かれる。FALSE なら符号なし。
%inst
ダイアログ内のコントロールのテキストを指定整数値の文字列表現に設定する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
新しいテキストを設定するため、この関数は指定コントロールに WM_SETTEXT メッセージを送る。


%index
SetDlgItemTextW
ダイアログ内のコントロールのタイトルまたはテキストを設定する。(Unicode)
%group
Win32 user32
%prm
hDlg, nIDDlgItem, lpString
hDlg : [intptr] 型: HWND コントロールを含むダイアログへのハンドル。
nIDDlgItem : [int] 型: int タイトルまたはテキストを設定するコントロール。
lpString : [wstr] 型: LPCTSTR コントロールにコピーするテキスト。
%inst
ダイアログ内のコントロールのタイトルまたはテキストを設定する。(Unicode)

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
SetDlgItemText 関数は指定コントロールに WM_SETTEXT メッセージを送る。


%index
SetDoubleClickTime
マウスのダブルクリック時間を設定する。
%group
Win32 user32
%prm
param0
param0 : [int] 
%inst
マウスのダブルクリック時間を設定する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
SetDoubleClickTime 関数はシステム内のすべてのウィンドウのダブルクリック時間を変更する。


%index
SetFocus
指定されたウィンドウにキーボードフォーカスを設定する。ウィンドウは呼び出しスレッドのメッセージキューにアタッチされている必要がある。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND キーボード入力を受け取るウィンドウへのハンドル。NULL の場合、キー入力は無視される。
%inst
指定されたウィンドウにキーボードフォーカスを設定する。ウィンドウは呼び出しスレッドのメッセージキューにアタッチされている必要がある。

[戻り値]
型: HWND 関数が成功した場合、戻り値は以前キーボードフォーカスを持っていたウィンドウへのハンドル。hWnd
が無効、またはウィンドウが呼び出しスレッドのメッセージキューにアタッチされていない場合、戻り値は NULL。拡張エラー
ERROR_INVALID_PARAMETER (0x57) はウィンドウが無効状態にあることを意味する。

[備考]
この関数はキーボードフォーカスを失うウィンドウに WM_KILLFOCUS、フォーカスを受け取るウィンドウに WM_SETFOCUS
メッセージを送る。フォーカスを受け取るウィンドウまたはその親ウィンドウもアクティブ化される。ウィンドウがアクティブだがフォーカスを持たない場合、任意のキー押下で
WM_SYSCHAR、WM_SYSKEYDOWN、WM_SYSKEYUP メッセージが生成される。


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
SetGestureConfig
Windows タッチジェスチャに対してウィンドウから送信されるメッセージを構成する。
%group
Win32 user32
%prm
hwnd, dwReserved, cIDs, pGestureConfig, cbSize
hwnd : [intptr] ジェスチャ設定を設定するウィンドウへのハンドル。
dwReserved : [int] 予約済みで 0 を設定する。
cIDs : [int] 渡されているジェスチャ設定構造体の数。
pGestureConfig : [var] ジェスチャ設定を指定するジェスチャ設定構造体の配列。
cbSize : [int] ジェスチャ設定 (GESTURECONFIG) 構造体のサイズ。
%inst
Windows タッチジェスチャに対してウィンドウから送信されるメッセージを構成する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。
失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
ジェスチャ設定の変更が予期されない場合、ウィンドウ作成時に SetGestureConfig を呼ぶ。動的に変更する場合は
WM_GESTURENOTIFY メッセージに応答して呼ぶ。
（以下省略）


%index
SetKeyboardState
キーボードキー状態の配列を呼び出しスレッドのキーボード入力状態テーブルにコピーする。GetKeyboardState と GetKeyState がアクセスするのと同じテーブル。このテーブルへの変更は他のスレッドのキーボード入力に影響しない。
%group
Win32 user32
%prm
lpKeyState
lpKeyState : [var] 型: LPBYTE キーボードキー状態を含む 256 バイト配列へのポインタ。
%inst
キーボードキー状態の配列を呼び出しスレッドのキーボード入力状態テーブルにコピーする。GetKeyboardState と
GetKeyState がアクセスするのと同じテーブル。このテーブルへの変更は他のスレッドのキーボード入力に影響しない。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
SetKeyboardState 関数は呼び出しスレッドの入力状態を変更し、システムのグローバル入力状態は変更しないため、NUM
LOCK、CAPS LOCK、SCROLL LOCK(日本語 KANA)のインジケータランプを設定するには使用できない。SendInput
でキー入力をシミュレーションする必要がある。


%index
SetLastErrorEx
最後のエラーコードを設定する。
%group
Win32 user32
%prm
dwErrCode, dwType
dwErrCode : [int] スレッドの最後のエラーコード。
dwType : [int] このパラメータは無視される。
%inst
最後のエラーコードを設定する。

[備考]

最後のエラーコードはスレッドローカルストレージに保持され、複数のスレッドが互いの値を上書きしないようにする。アプリケーションは関数の失敗直後に
GetLastError で値を取得できる。


%index
SetLayeredWindowAttributes
レイヤードウィンドウの不透明度と透明色キーを設定する。
%group
Win32 user32
%prm
hwnd, crKey, bAlpha, dwFlags
hwnd : [intptr] 型: HWND レイヤードウィンドウへのハンドル。CreateWindowEx で WS_EX_LAYERED を指定するか、ウィンドウ作成後に SetWindowLong で WS_EX_LAYERED を設定することで作成される。
crKey : [int] 型: COLORREF レイヤードウィンドウの合成時に使用する透明色キーを指定する COLORREF 構造体。この色でウィンドウが描画したすべてのピクセルが透明になる。
bAlpha : [int] 型: BYTE レイヤードウィンドウの不透明度を記述するアルファ値。BLENDFUNCTION 構造体の SourceConstantAlpha メンバに類似。0 で完全に透明、255 で不透明。
dwFlags : [int] 型: DWORD
%inst
レイヤードウィンドウの不透明度と透明色キーを設定する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。
失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
レイヤードウィンドウに対して SetLayeredWindowAttributes
を呼んだ後、レイヤ化スタイルビットがクリアされ再設定されるまで UpdateLayeredWindow の呼び出しは失敗する。


%index
SetMenu
指定されたウィンドウに新しいメニューを割り当てる。
%group
Win32 user32
%prm
hWnd, hMenu
hWnd : [intptr] 型: HWND メニューを割り当てるウィンドウへのハンドル。
hMenu : [intptr] 型: HMENU 新しいメニューへのハンドル。NULL の場合、ウィンドウの現在のメニューが削除される。
%inst
指定されたウィンドウに新しいメニューを割り当てる。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
ウィンドウはメニューの変更を反映するため再描画される。メニューは子ウィンドウ以外の任意のウィンドウに割り当てられる。SetMenu
関数は以前のメニューを置き換えるが、破棄はしない。アプリケーションは破棄するために DestroyMenu 関数を呼ぶ必要がある。


%index
SetMenuContextHelpId
メニューにヘルプコンテキスト識別子を関連付ける。
%group
Win32 user32
%prm
param0, param1
param0 : [intptr] 
param1 : [int] 
%inst
メニューにヘルプコンテキスト識別子を関連付ける。

[戻り値]
型: BOOL 成功した場合は 0 以外、そうでない場合は 0 を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
メニュー内のすべての項目はこの識別子を共有する。ヘルプコンテキスト識別子は個別のメニュー項目に付与できない。


%index
SetMenuDefaultItem
指定されたメニューの既定メニュー項目を設定する。
%group
Win32 user32
%prm
hMenu, uItem, fByPos
hMenu : [intptr] 型: HMENU 既定項目を設定するメニューへのハンドル。
uItem : [int] 型: UINT 新しい既定メニュー項目の識別子または位置、または既定項目なしの場合は -1。
fByPos : [int] 型: UINT uItem の意味。FALSE ならメニュー項目識別子、それ以外ならメニュー項目位置。
%inst
指定されたメニューの既定メニュー項目を設定する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。


%index
SetMenuInfo
指定されたメニューの情報を設定する。
%group
Win32 user32
%prm
param0, param1
param0 : [intptr] 
param1 : [var] 
%inst
指定されたメニューの情報を設定する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。


%index
SetMenuItemBitmaps
指定されたビットマップをメニュー項目に関連付ける。項目が選択されているかに応じて、システムは適切なビットマップをメニュー項目の隣に表示する。
%group
Win32 user32
%prm
hMenu, uPosition, uFlags, hBitmapUnchecked, hBitmapChecked
hMenu : [intptr] 型: HMENU 新しいチェックマークビットマップを受け取る項目を含むメニューへのハンドル。
uPosition : [int] 型: UINT 変更するメニュー項目。uFlags により解釈される。
uFlags : [int] 型: UINT
hBitmapUnchecked : [intptr] 型: HBITMAP メニュー項目が選択されていないときに表示されるビットマップへのハンドル。
hBitmapChecked : [intptr] 型: HBITMAP メニュー項目が選択されているときに表示されるビットマップへのハンドル。
%inst

指定されたビットマップをメニュー項目に関連付ける。項目が選択されているかに応じて、システムは適切なビットマップをメニュー項目の隣に表示する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
hBitmapUnchecked または hBitmapChecked のいずれかが NULL
の場合、システムは対応するチェック状態のメニュー項目の隣に何も表示しない。両方が NULL
の場合、項目が選択されているときは既定のチェックマークビットマップを表示する。メニューが破棄されてもこれらのビットマップは破棄されないため、アプリケーションで破棄する必要がある。


%index
SetMenuItemInfoW
メニュー項目に関する情報を変更する。(Unicode)
%group
Win32 user32
%prm
hmenu, item, fByPositon, lpmii
hmenu : [intptr] 型: HMENU メニュー項目を含むメニューへのハンドル。
item : [int] 型: UINT 変更するメニュー項目の識別子または位置。
fByPositon : [int] 
lpmii : [var] 型: LPMENUITEMINFO メニュー項目情報と変更する属性を指定する MENUITEMINFO 構造体へのポインタ。
%inst
メニュー項目に関する情報を変更する。(Unicode)

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
アプリケーションはメニューが変更されるたびに DrawMenuBar 関数を呼ぶ必要がある。


%index
SetMessageExtraInfo
現在のスレッドの追加メッセージ情報を設定する。
%group
Win32 user32
%prm
lParam
lParam : [intptr] 型: LPARAM 現在のスレッドに関連付ける値。
%inst
現在のスレッドの追加メッセージ情報を設定する。

[戻り値]
型: LPARAM 戻り値は現在のスレッドに関連付けられた以前の値。


%index
SetMessageQueue
(no summary)
%group
Win32 user32
%prm
cMessagesMax
cMessagesMax : [int] 
%inst



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
SetPhysicalCursorPos
物理座標でカーソルの位置を設定する。
%group
Win32 user32
%prm
X, Y
X : [int] 型: int カーソルの新しい x 座標(物理座標)。
Y : [int] 型: int カーソルの新しい y 座標(物理座標)。
%inst
物理座標でカーソルの位置を設定する。

[戻り値]
型: BOOL 成功した場合は TRUE、そうでない場合は FALSE。

[備考]
論理座標と物理座標の違いの説明は PhysicalToLogicalPoint を参照。生成されたエラーの詳細を取得するには
GetLastError を呼ぶ。


%index
SetProcessDPIAware
SetProcessDPIAware は変更または利用不可になる可能性がある。代わりに SetProcessDPIAwareness を使用する。
%group
Win32 user32
%prm

%inst
SetProcessDPIAware は変更または利用不可になる可能性がある。代わりに SetProcessDPIAwareness
を使用する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。そうでない場合、戻り値は 0。

[備考]
詳細はプロセスの既定 DPI 認識の設定を参照。


%index
SetProcessDefaultLayout
現在実行中のプロセスに対してのみ、親または所有者なしでウィンドウが作成されるときの既定レイアウトを変更する。
%group
Win32 user32
%prm
dwDefaultLayout
dwDefaultLayout : [int] 型: DWORD 既定のプロセスレイアウト。このパラメータは 0 または以下の値を指定できる。
%inst
現在実行中のプロセスに対してのみ、親または所有者なしでウィンドウが作成されるときの既定レイアウトを変更する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
レイアウトはテキストとグラフィックスの配置方法を指定する。既定は左から右。SetProcessDefaultLayout
はレイアウトを右から左に変更する(アラビア語・ヘブライ語文化の標準)。


%index
SetProcessDpiAwarenessContext
現在のプロセスを指定された DPI 認識コンテキストに設定する。DPI 認識コンテキストは DPI_AWARENESS_CONTEXT 値からのもの。
%group
Win32 user32
%prm
value
value : [intptr] 設定する DPI_AWARENESS_CONTEXT ハンドル。
%inst
現在のプロセスを指定された DPI 認識コンテキストに設定する。DPI 認識コンテキストは DPI_AWARENESS_CONTEXT
値からのもの。

[戻り値]
操作が成功した場合は TRUE、そうでない場合は FALSE を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
この API は既存の SetProcessDpiAwareness API のより高度な版で、プロセス既定値をよりきめ細かい
DPI_AWARENESS_CONTEXT 値に設定できる。最も重要なのは、プログラム的にモニタごと v2
をプロセス既定値として設定できることで、これは以前の API では不可能だった。一般に、アプリケーションの DPI 認識を設定するには
SetProcessDpiAwarenessContext ではなくアプリケーションマニフェストで宣言することを推奨する。


%index
SetProcessRestrictionExemption
デスクトッププロセスが Windows ストアアプリ環境と対話することを防ぐ制限から呼び出しプロセスを免除する。開発およびデバッグツールで使用される。
%group
Win32 user32
%prm
fEnableExemption
fEnableExemption : [int] TRUE の場合、呼び出しプロセスの免除無効化要求を示す。
%inst
デスクトッププロセスが Windows
ストアアプリ環境と対話することを防ぐ制限から呼び出しプロセスを免除する。開発およびデバッグツールで使用される。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
デスクトップや Windows ストアアプリプロセス、IL コードを使用するプロセスを含む任意のプロセスがこの関数を呼べる。


%index
SetProcessWindowStation
指定されたウィンドウステーションを呼び出しプロセスに割り当てる。
%group
Win32 user32
%prm
hWinSta
hWinSta : [intptr] ウィンドウステーションへのハンドル。CreateWindowStation、OpenWindowStation、GetProcessWindowStation 関数が返すハンドル。このウィンドウステーションは現在のセッションに関連付けられている必要がある。
%inst
指定されたウィンドウステーションを呼び出しプロセスに割り当てる。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。


%index
SetPropW
指定されたウィンドウのプロパティリストに新しいエントリを追加するか、既存のエントリを変更する。(Unicode)
%group
Win32 user32
%prm
hWnd, lpString, hData
hWnd : [intptr] 型: HWND プロパティリストに新しいエントリを受け取るウィンドウへのハンドル。
lpString : [wstr] 型: LPCTSTR null 終端文字列または文字列を識別するアトム。アトムの場合は GlobalAddAtom で作成されたグローバルアトムでなければならない。
hData : [intptr] 型: HANDLE プロパティリストにコピーするデータへのハンドル。アプリケーションに有用な任意の値を識別できる。
%inst
指定されたウィンドウのプロパティリストに新しいエントリを追加するか、既存のエントリを変更する。(Unicode)

[戻り値]
型: BOOL データハンドルと文字列がプロパティリストに追加された場合、戻り値は 0 以外。失敗した場合、戻り値は
0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
ウィンドウが破棄される前(WM_NCDESTROY
メッセージの処理から戻る前)に、アプリケーションはプロパティリストに追加したすべてのエントリを削除する必要がある。RemoveProp
関数でエントリを削除する。


%index
SetRect
SetRect 関数は指定された矩形の座標を設定する。left、top、right、bottom 引数を RECT 構造体の適切なメンバに代入するのと同等。
%group
Win32 user32
%prm
lprc, xLeft, yTop, xRight, yBottom
lprc : [var] 設定する矩形を含む RECT 構造体へのポインタ。
xLeft : [int] 矩形左上隅の x 座標を指定する。
yTop : [int] 矩形左上隅の y 座標を指定する。
xRight : [int] 矩形右下隅の x 座標を指定する。
yBottom : [int] 矩形右下隅の y 座標を指定する。
%inst
SetRect 関数は指定された矩形の座標を設定する。left、top、right、bottom 引数を RECT
構造体の適切なメンバに代入するのと同等。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。

[備考]
アプリケーションは矩形をさまざまな用途に使えるため、矩形関数は明示的な測定単位を用いない。


%index
SetRectEmpty
SetRectEmpty 関数はすべての座標が 0 に設定された空の矩形を作成する。
%group
Win32 user32
%prm
lprc
lprc : [var] 矩形の座標を含む RECT 構造体へのポインタ。
%inst
SetRectEmpty 関数はすべての座標が 0 に設定された空の矩形を作成する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。

[備考]
アプリケーションは矩形をさまざまな用途に使えるため、矩形関数は明示的な測定単位を用いない。


%index
SetScrollInfo
SetScrollInfo 関数はスクロールバーのパラメータ(最小/最大スクロール位置、ページサイズ、スクロールボックス位置)を設定する。要求された場合はスクロールバーを再描画する。
%group
Win32 user32
%prm
hwnd, nBar, lpsi, redraw
hwnd : [intptr] 型: HWND スクロールバーコントロールまたは標準スクロールバーを持つウィンドウへのハンドル。fnBar の値に依存する。
nBar : [int] 型: int
lpsi : [var] 型: LPCSCROLLINFO SCROLLINFO 構造体へのポインタ。呼び出し前に cbSize を sizeof(SCROLLINFO) に設定し、fMask で設定するパラメータを示し、新しい値を指定する。
redraw : [int] 型: BOOL 変更を反映するためにスクロールバーを再描画するかを指定する。TRUE なら再描画、FALSE なら再描画しない。
%inst
SetScrollInfo
関数はスクロールバーのパラメータ(最小/最大スクロール位置、ページサイズ、スクロールボックス位置)を設定する。要求された場合はスクロールバーを再描画する。

[戻り値]
型: int 戻り値はスクロールボックスの現在位置。

[備考]
SetScrollInfo 関数は SCROLLINFO 構造体の nPage と nPos メンバの値の範囲チェックを行う。


%index
SetScrollPos
SetScrollPos 関数は指定されたスクロールバーのスクロールボックスの位置を設定し、要求された場合は新位置を反映するためにスクロールバーを再描画する。
%group
Win32 user32
%prm
hWnd, nBar, nPos, bRedraw
hWnd : [intptr] 型: HWND スクロールバーコントロールまたは標準スクロールバーを持つウィンドウへのハンドル。
nBar : [int] 型: int
nPos : [int] 型: int スクロールボックスの新しい位置。スクロール範囲内になければならない。
bRedraw : [int] 型: BOOL スクロールボックスの新位置を反映するためにスクロールバーを再描画するかを指定する。
%inst
SetScrollPos
関数は指定されたスクロールバーのスクロールボックスの位置を設定し、要求された場合は新位置を反映するためにスクロールバーを再描画する。

[戻り値]
型: int 関数が成功した場合、戻り値はスクロールボックスの以前の位置。
失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
スクロールバーが後続の関数呼び出しで再描画される場合、bRedraw を FALSE にするのが有用である。SetScrollInfo
などは 32 ビットのスクロールバー位置データをサポートするので、WM_HSCROLL/WM_VSCROLL メッセージの 16
ビット制限を回避できる。


%index
SetScrollRange
SetScrollRange 関数は指定されたスクロールバーの最小および最大スクロールボックス位置を設定する。
%group
Win32 user32
%prm
hWnd, nBar, nMinPos, nMaxPos, bRedraw
hWnd : [intptr] 型: HWND スクロールバーコントロールまたは標準スクロールバーを持つウィンドウへのハンドル。
nBar : [int] 型: int
nMinPos : [int] 型: int 最小スクロール位置を指定する。
nMaxPos : [int] 型: int 最大スクロール位置を指定する。
bRedraw : [int] 型: BOOL 変更を反映するためにスクロールバーを再描画するかを指定する。
%inst
SetScrollRange 関数は指定されたスクロールバーの最小および最大スクロールボックス位置を設定する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
nMinPos と nMaxPos
を同じ値にすることでスクロールバーを非表示にできる。ただしスクロールバーを非表示にするには新しいアプリケーションでは
ShowScrollBar 関数を使用すべきである。


%index
SetSysColors
指定された表示要素の色を設定する。
%group
Win32 user32
%prm
cElements, lpaElements, lpaRgbValues
cElements : [int] 型: int lpaElements 配列内の表示要素の数。
lpaElements : [var] 型: const INT* 変更する表示要素を指定する整数の配列。
lpaRgbValues : [var] 型: const COLORREF* lpaElements が指す配列内の表示要素の新しい RGB 値を含む COLORREF 値の配列。
%inst
指定された表示要素の色を設定する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
SetSysColors 関数はすべてのウィンドウに WM_SYSCOLORCHANGE
メッセージを送って色の変更を通知する。また、現在表示中のすべてのウィンドウの影響を受ける部分を再描画するよう指示する。この関数は現在のセッションのみに影響する。新しい色はシステム終了時に保存されない。


%index
SetSystemCursor
アプリケーションがシステムカーソルをカスタマイズできるようにする。id で指定されるシステムカーソルの内容を hcur のカーソルの内容で置き換え、その後 hcur を破棄する。
%group
Win32 user32
%prm
hcur, id
hcur : [intptr] 型: HCURSOR カーソルへのハンドル。関数は id で指定されるシステムカーソルの内容を hcur のカーソルの内容で置き換える。システムは DestroyCursor で hcur を破棄するため、LoadCursor で読み込んだカーソルは使えない。
id : [int] 型: DWORD
%inst
アプリケーションがシステムカーソルをカスタマイズできるようにする。id で指定されるシステムカーソルの内容を hcur
のカーソルの内容で置き換え、その後 hcur を破棄する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
OCR_ 定数を使用するには、Windows.h を含める前に OEMRESOURCE 定数を定義する必要がある。


%index
SetThreadDesktop
指定されたデスクトップを呼び出しスレッドに割り当てる。以降のすべての操作はそのデスクトップに付与されたアクセス権を使用する。
%group
Win32 user32
%prm
hDesktop
hDesktop : [intptr] 呼び出しスレッドに割り当てるデスクトップへのハンドル。このデスクトップはプロセスの現在のウィンドウステーションに関連付けられている必要がある。
%inst
指定されたデスクトップを呼び出しスレッドに割り当てる。以降のすべての操作はそのデスクトップに付与されたアクセス権を使用する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
SetThreadDesktop 関数は、呼び出しスレッドが現在のデスクトップにウィンドウまたはフックを持つ場合に失敗する。警告:
対話型デスクトップにウィンドウを開くサービスには重大なセキュリティリスクがある。


%index
SetThreadDpiAwarenessContext
現在のスレッドの DPI 認識を指定された値に設定する。
%group
Win32 user32
%prm
dpiContext
dpiContext : [intptr] 現在のスレッドの新しい DPI_AWARENESS_CONTEXT。このコンテキストには DPI_AWARENESS 値が含まれる。
%inst
現在のスレッドの DPI 認識を指定された値に設定する。

[戻り値]
スレッドの古い DPI_AWARENESS_CONTEXT。dpiContext が無効な場合、スレッドは更新されず戻り値は NULL。

[備考]
スレッドの DPI_AWARENESS_CONTEXT をアプリの既定値から変更するにはこの API を使用する。


%index
SetThreadDpiHostingBehavior
スレッドの DPI_HOSTING_BEHAVIOR を設定する。この動作により、スレッド内で作成されるウィンドウが異なる DPI_AWARENESS_CONTEXT を持つ子ウィンドウをホストできる。
%group
Win32 user32
%prm
value
value : [int] 現在のスレッドの新しい DPI_HOSTING_BEHAVIOR 値。
%inst
スレッドの DPI_HOSTING_BEHAVIOR を設定する。この動作により、スレッド内で作成されるウィンドウが異なる
DPI_AWARENESS_CONTEXT を持つ子ウィンドウをホストできる。

[戻り値]
スレッドの以前の DPI_HOSTING_BEHAVIOR。渡されたホスティング動作が無効な場合、スレッドは更新されず戻り値は
DPI_HOSTING_BEHAVIOR_INVALID。

[備考]
DPI_HOSTING_BEHAVIOR は、混合コンテンツホスティング動作を有効にし、スレッド内で作成される親ウィンドウが異なる
DPI_AWARENESS_CONTEXT
値の子ウィンドウをホストできるようにする。このプロパティは混合ホスティング動作が有効な間にスレッド内で作成される新しいウィンドウにのみ影響する。


%index
SetTimer
指定されたタイムアウト値を持つタイマを作成する。
%group
Win32 user32
%prm
hWnd, nIDEvent, uElapse, lpTimerFunc
hWnd : [intptr] 型: HWND タイマに関連付けるウィンドウへのハンドル。このウィンドウは呼び出しスレッドが所有している必要がある。
nIDEvent : [int] 型: UINT_PTR 0 以外のタイマ識別子。
uElapse : [int] 型: UINT タイムアウト値(ミリ秒単位)。USER_TIMER_MINIMUM より小さい場合は USER_TIMER_MINIMUM、USER_TIMER_MAXIMUM より大きい場合は USER_TIMER_MAXIMUM に設定される。
lpTimerFunc : [int] 型: TIMERPROC タイムアウト値が経過したときに通知される関数へのポインタ。NULL の場合、システムは WM_TIMER メッセージをアプリケーションキューにポストする。
%inst
指定されたタイムアウト値を持つタイマを作成する。

[戻り値]
型: UINT_PTR 関数が成功し hWnd が NULL の場合、戻り値は新しいタイマを識別する整数。そうでない場合は 0
以外の整数。失敗した場合は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
アプリケーションはウィンドウプロシージャに WM_TIMER case 文を含めるか、タイマ作成時に TimerProc
コールバック関数を指定して WM_TIMER メッセージを処理できる。SetTimer や他のタイマ関連関数を使用する前に
SetUserObjectInformationW で UOI_TIMERPROC_EXCEPTION_SUPPRESSION フラグを
FALSE に設定することが推奨される。


%index
SetUserObjectInformationW
指定されたウィンドウステーションまたはデスクトップオブジェクトに関する情報を設定する。(Unicode)
%group
Win32 user32
%prm
hObj, nIndex, pvInfo, nLength
hObj : [intptr] ウィンドウステーション、デスクトップオブジェクト、または現在のプロセス疑似ハンドルへのハンドル。
nIndex : [int] 設定するオブジェクト情報。
pvInfo : [intptr] オブジェクト情報を含むバッファ、または BOOL へのポインタ。
nLength : [int] pvInfo が指すバッファ内の情報のサイズ(バイト単位)。
%inst
指定されたウィンドウステーションまたはデスクトップオブジェクトに関する情報を設定する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
> [!NOTE] > winuser.h ヘッダは SetUserObjectInformation を UNICODE
プリプロセッサ定数に基づいて ANSI/Unicode 版を自動選択するエイリアスとして定義する。


%index
SetUserObjectSecurity
ユーザオブジェクト(例えばウィンドウや DDE 会話)のセキュリティを設定する。
%group
Win32 user32
%prm
hObj, pSIRequested, pSID
hObj : [intptr] セキュリティ情報を設定するユーザオブジェクトへのハンドル。
pSIRequested : [var] 
pSID : [int] 新しいセキュリティ情報を含む SECURITY_DESCRIPTOR 構造体へのポインタ。
%inst
ユーザオブジェクト(例えばウィンドウや DDE 会話)のセキュリティを設定する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
SetUserObjectSecurity
関数はユーザオブジェクトに割り当てられたセキュリティ記述子にセキュリティ記述子で指定された変更を適用する。オブジェクトのセキュリティ記述子は自己相対形式でなければならない。


%index
UnhookWinEvent
SetWinEventHook の以前の呼び出しで作成されたイベントフック関数を削除する。
%group
Win32 user32
%prm
hWinEventHook
hWinEventHook : [intptr] 型: HWINEVENTHOOK SetWinEventHook の以前の呼び出しで返されたイベントフックへのハンドル。
%inst
SetWinEventHook の以前の呼び出しで作成されたイベントフック関数を削除する。

[戻り値]
型: BOOL 成功した場合は TRUE、そうでない場合は FALSE を返す。
（以下省略）

[備考]
この関数は hWinEventHook
で指定されたイベントフックを削除し、対応するコールバック関数がイベント通知を受け取らないようにする。クライアントのスレッドが終了すると、システムは自動的にこの関数を呼ぶ。


%index
SetWinEventHook
イベント範囲に対するイベントフック関数を設定する。
%group
Win32 user32
%prm
eventMin, eventMax, hmodWinEventProc, pfnWinEventProc, idProcess, idThread, dwFlags
eventMin : [int] 型: UINT フック関数で処理されるイベント範囲の最小イベント値の定数。EVENT_MIN を指定して可能な最小値を示すことができる。
eventMax : [int] 型: UINT フック関数で処理されるイベント範囲の最大イベント値の定数。EVENT_MAX を指定して可能な最大値を示すことができる。
hmodWinEventProc : [intptr] 型: HMODULE dwFlags に WINEVENT_INCONTEXT が指定されている場合、lpfnWinEventProc のフック関数を含む DLL へのハンドル。フック関数が DLL 内になく、WINEVENT_OUTOFCONTEXT が指定されている場合、このパラメータは NULL。
pfnWinEventProc : [int] 型: WINEVENTPROC イベントフック関数へのポインタ。
idProcess : [int] 型: DWORD フック関数がイベントを受け取るプロセスの ID。0 を指定すると現在のデスクトップのすべてのプロセスからイベントを受け取る。
idThread : [int] 型: DWORD フック関数がイベントを受け取るスレッドの ID。0 の場合、現在のデスクトップのすべての既存スレッドに関連付けられる。
dwFlags : [int] 型: UINT
%inst
イベント範囲に対するイベントフック関数を設定する。

[戻り値]
型: HWINEVENTHOOK 成功した場合、このイベントフックインスタンスを識別する HWINEVENTHOOK
値を返す。失敗した場合は 0 を返す。

[備考]
この関数によりクライアントは関心のあるプロセスとスレッドを指定できる。idProcess が非ゼロで idThread
がゼロの場合、フック関数はそのプロセスのすべてのスレッドから指定イベントを受け取る。


%index
SetWindowContextHelpId
指定されたウィンドウにヘルプコンテキスト識別子を関連付ける。
%group
Win32 user32
%prm
param0, param1
param0 : [intptr] 
param1 : [int] 
%inst
指定されたウィンドウにヘルプコンテキスト識別子を関連付ける。

[戻り値]
型: BOOL 成功した場合は 0 以外、そうでない場合は 0 を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]

子ウィンドウがヘルプコンテキスト識別子を持たない場合、親ウィンドウの識別子を継承する。所有ウィンドウの場合も同様に所有ウィンドウの識別子を継承する。


%index
SetWindowDisplayAffinity
ウィンドウに関連付けられた hWnd 上のカーネルモードに表示アフィニティ設定を格納する。
%group
Win32 user32
%prm
hWnd, dwAffinity
hWnd : [intptr] 型: HWND トップレベルウィンドウへのハンドル。ウィンドウは現在のプロセスに属する必要がある。
dwAffinity : [int] 型: DWORD ウィンドウの内容を表示できる場所を指定する表示アフィニティ設定。
%inst
ウィンドウに関連付けられた hWnd 上のカーネルモードに表示アフィニティ設定を格納する。

[戻り値]
型: BOOL 関数が成功した場合は TRUE、そうでない場合(例えば非トップレベルウィンドウに対して呼ばれた場合)は
FALSE。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
この関数と GetWindowDisplayAffinity は、Windows 7
の新機能であるウィンドウコンテンツ保護機能をサポートするために設計されている。この機能により、アプリケーションは特定の公開 OS 機能と
API を通じて画面ウィンドウコンテンツがキャプチャまたはコピーされないように保護できる。


%index
SetWindowFeedbackSetting
ウィンドウのフィードバック構成を設定する。
%group
Win32 user32
%prm
hwnd, feedback, dwFlags, size, configuration
hwnd : [intptr] フィードバックを構成するウィンドウ。
feedback : [int] FEEDBACK_TYPE 列挙の値のいずれか。
dwFlags : [int] 予約済みで 0 を設定する。
size : [int] 構成データのサイズ(バイト単位)。
configuration : [intptr] 構成データ。フィードバック設定をリセットする場合は BOOL または NULL でなければならない。
%inst
ウィンドウのフィードバック構成を設定する。

[戻り値]
成功した場合は TRUE、そうでない場合は FALSE を返す。


%index
SetWindowLongW
指定されたウィンドウの属性を変更する。また追加ウィンドウメモリの指定オフセットにある 32 ビット値を設定する。(Unicode)
%group
Win32 user32
%prm
hWnd, nIndex, dwNewLong
hWnd : [intptr] 型: HWND ウィンドウ、および間接的にウィンドウが属するクラスへのハンドル。
nIndex : [int] 型: int
dwNewLong : [int] 型: LONG 置換値。
%inst
指定されたウィンドウの属性を変更する。また追加ウィンドウメモリの指定オフセットにある 32 ビット値を設定する。(Unicode)

[戻り値]
型: LONG 関数が成功した場合、戻り値は指定された 32 ビット整数の以前の値。失敗した場合、戻り値は
0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
一部のウィンドウデータはキャッシュされているため、SetWindowLong による変更は SetWindowPos
を呼ぶまで反映されない。フレームスタイルを変更した場合、キャッシュを適切に更新するために SWP_FRAMECHANGED フラグ付きで
SetWindowPos を呼ぶ必要がある。GWL_WNDPROC
インデックスでウィンドウプロシージャを置き換える場合、新しいプロシージャはガイドラインに従う必要がある。


%index
SetWindowPlacement
指定されたウィンドウの表示状態と、復元・最小化・最大化時の位置を設定する。
%group
Win32 user32
%prm
hWnd, lpwndpl
hWnd : [intptr] 型: HWND ウィンドウへのハンドル。
lpwndpl : [var] 型: const WINDOWPLACEMENT* 新しい表示状態とウィンドウ位置を指定する WINDOWPLACEMENT 構造体へのポインタ。呼び出し前に length メンバを sizeof(WINDOWPLACEMENT) に設定する必要がある。
%inst
指定されたウィンドウの表示状態と、復元・最小化・最大化時の位置を設定する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
WINDOWPLACEMENT
で指定された情報により画面外に完全に出るウィンドウになる場合、システムは自動的に座標を調整してウィンドウを可視にする。WINDOWPLACEMENT
の length メンバを sizeof(WINDOWPLACEMENT) に設定する必要がある。


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
SetWindowRgn
SetWindowRgn 関数はウィンドウのウィンドウ領域を設定する。
%group
Win32 user32
%prm
hWnd, hRgn, bRedraw
hWnd : [intptr] ウィンドウ領域を設定するウィンドウへのハンドル。
hRgn : [intptr] 領域へのハンドル。関数はウィンドウのウィンドウ領域をこの領域に設定する。hRgn が NULL なら、関数はウィンドウ領域を NULL に設定する。
bRedraw : [int] ウィンドウ領域を設定後にシステムがウィンドウを再描画するかを指定する。TRUE なら再描画、そうでなければ再描画しない。通常ウィンドウが可視なら TRUE を設定する。
%inst
SetWindowRgn 関数はウィンドウのウィンドウ領域を設定する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。

[備考]
この関数が呼ばれると、システムはウィンドウに WM_WINDOWPOSCHANGING
メッセージを送る。ウィンドウ領域の座標はウィンドウの左上隅(RTL なら右上隅)に対して相対的である。SetWindowRgn
の成功呼び出し後、hRgn で指定された領域はシステムが所有する。


%index
SetWindowTextW
指定ウィンドウのタイトルバーのテキスト(ある場合)を変更する。指定ウィンドウがコントロールの場合、コントロールのテキストが変更される。(Unicode)
%group
Win32 user32
%prm
hWnd, lpString
hWnd : [intptr] 型: HWND テキストを変更するウィンドウまたはコントロールへのハンドル。
lpString : [wstr] 型: LPCWSTR 新しいタイトルまたはコントロールテキスト。
%inst

指定ウィンドウのタイトルバーのテキスト(ある場合)を変更する。指定ウィンドウがコントロールの場合、コントロールのテキストが変更される。(Unicode)

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
対象ウィンドウが現在のプロセスに所有されている場合、SetWindowText は指定ウィンドウまたはコントロールに WM_SETTEXT
メッセージを送る。別プロセスのコントロールのテキストを設定するには、SetWindowText を呼ぶ代わりに WM_SETTEXT
メッセージを直接送る。SetWindowText 関数はタブ文字(ASCII 0x09)を展開しない。


%index
SetWindowWord
(no summary)
%group
Win32 user32
%prm
hWnd, nIndex, wNewWord
hWnd : [intptr] 
nIndex : [int] 
wNewWord : [int] 
%inst



%index
SetWindowsHookW
(no summary)
%group
Win32 user32
%prm
nFilterType, pfnFilterProc
nFilterType : [int] 
pfnFilterProc : [int] 
%inst



%index
SetWindowsHookExW
アプリケーション定義のフックプロシージャをフックチェーンにインストールする。(Unicode)
%group
Win32 user32
%prm
idHook, lpfn, hmod, dwThreadId
idHook : [int] 型: int
lpfn : [int] 型: HOOKPROC フックプロシージャへのポインタ。
hmod : [intptr] 型: HINSTANCE lpfn が指すフックプロシージャを含む DLL へのハンドル。dwThreadId が現在のプロセスが作成したスレッドを指定し、フックプロシージャが現在のプロセスに関連付けられたコード内にある場合、hMod は NULL でなければならない。
dwThreadId : [int] 型: DWORD フックプロシージャに関連付けるスレッドの識別子。デスクトップアプリで 0 を指定すると、呼び出しスレッドと同じデスクトップで実行されているすべての既存スレッドに関連付けられる。
%inst
アプリケーション定義のフックプロシージャをフックチェーンにインストールする。(Unicode)

[戻り値]
型: HHOOK 関数が成功した場合、戻り値はフックプロシージャへのハンドル。失敗した場合、戻り値は
NULL。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
SetWindowsHookEx は別プロセスに DLL を注入するために使用できる。32 ビット DLL を 64
ビットプロセスに注入したり、64 ビット DLL を 32 ビットプロセスに注入したりはできない。終了前に
UnhookWindowsHookEx を呼び出してシステムリソースを解放する必要がある。


%index
ShowCaret
キャレットを現在位置に表示する。キャレットが可視になると自動的に点滅が始まる。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] 型: HWND キャレットを所有するウィンドウへのハンドル。NULL の場合、ShowCaret は現在のタスクでキャレットを所有するウィンドウを検索する。
%inst
キャレットを現在位置に表示する。キャレットが可視になると自動的に点滅が始まる。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
ShowCaret は指定ウィンドウがキャレットを所有し、キャレットが形状を持ち、連続して 2
回以上隠されていない場合にのみキャレットを表示する。隠蔽は累積する。


%index
ShowCursor
カーソルを表示または非表示にする。(ShowCursor)
%group
Win32 user32
%prm
bShow
bShow : [int] 型: BOOL TRUE なら表示カウンタを 1 増やす。FALSE なら 1 減らす。
%inst
カーソルを表示または非表示にする。(ShowCursor)

[戻り値]
型: int 戻り値は新しい表示カウンタ。

[備考]
Windows 8: カーソルの可視性を判定するには GetCursorInfo
を呼ぶ。この関数はカーソルを表示すべきかを判定する内部表示カウンタを設定する。カーソルは表示カウンタが 0 以上の場合にのみ表示される。


%index
ShowOwnedPopups
指定されたウィンドウが所有するすべてのポップアップウィンドウを表示または非表示にする。
%group
Win32 user32
%prm
hWnd, fShow
hWnd : [intptr] 型: HWND 表示または非表示にするポップアップウィンドウを所有するウィンドウへのハンドル。
fShow : [int] 型: BOOL TRUE なら所有するすべての隠されたポップアップウィンドウを表示する。FALSE なら可視のポップアップウィンドウをすべて非表示にする。
%inst
指定されたウィンドウが所有するすべてのポップアップウィンドウを表示または非表示にする。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
ShowOwnedPopups は以前の ShowOwnedPopups 呼び出しによって隠されたウィンドウのみ表示する。


%index
ShowScrollBar
ShowScrollBar 関数は指定されたスクロールバーを表示または非表示にする。
%group
Win32 user32
%prm
hWnd, wBar, bShow
hWnd : [intptr] 型: HWND スクロールバーコントロールまたは標準スクロールバーを持つウィンドウへのハンドル。
wBar : [int] 型: int
bShow : [int] 型: BOOL スクロールバーを表示するか非表示にするかを指定する。TRUE なら表示、そうでなければ非表示。
%inst
ShowScrollBar 関数は指定されたスクロールバーを表示または非表示にする。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
スクロールバーメッセージの処理中にこの関数を呼び出してスクロールバーを非表示にしてはならない。


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
ShowWindowAsync
操作の完了を待たずにウィンドウの表示状態を設定する。
%group
Win32 user32
%prm
hWnd, nCmdShow
hWnd : [intptr] 型: HWND ウィンドウへのハンドル。
nCmdShow : [int] 型: int ウィンドウの表示方法を制御する。可能な値の一覧は ShowWindow を参照。
%inst
操作の完了を待たずにウィンドウの表示状態を設定する。

[戻り値]
型: BOOL 操作が正常に開始された場合、戻り値は 0 以外。

[備考]
この関数は show-window イベントを指定ウィンドウのメッセージキューにポストする。応答しないアプリケーションの
show-window イベント処理待ちで自身も応答不能になるのを避けるためにこの関数を使用できる。


%index
ShutdownBlockReasonCreate
システムをシャットダウンできないことを示し、システムシャットダウンが開始された場合にユーザに表示する理由文字列を設定する。
%group
Win32 user32
%prm
hWnd, pwszReason
hWnd : [intptr] アプリケーションのメインウィンドウへのハンドル。
pwszReason : [wstr] アプリケーションがシステムシャットダウンをブロックしなければならない理由。
%inst
システムをシャットダウンできないことを示し、システムシャットダウンが開始された場合にユーザに表示する理由文字列を設定する。

[戻り値]
成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
この関数は hWnd を作成したスレッドからのみ呼び出せる。そうでなければ失敗し、最後のエラーは ERROR_ACCESS_DENIED
となる。中断できない操作(CD/DVD の書き込みなど)を開始するときに呼び出すべきである。


%index
ShutdownBlockReasonDestroy
システムをシャットダウンできることを示し、理由文字列を解放する。
%group
Win32 user32
%prm
hWnd
hWnd : [intptr] アプリケーションのメインウィンドウへのハンドル。
%inst
システムをシャットダウンできることを示し、理由文字列を解放する。

[戻り値]
成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
この関数は hWnd を作成したスレッドからのみ呼び出せる。


%index
ShutdownBlockReasonQuery
ShutdownBlockReasonCreate 関数で設定された理由文字列を取得する。
%group
Win32 user32
%prm
hWnd, pwszBuff, pcchBuff
hWnd : [intptr] アプリケーションのメインウィンドウへのハンドル。
pwszBuff : [wstr] 理由文字列を受け取るバッファへのポインタ。NULL の場合、関数は理由文字列の文字数を取得する。
pcchBuff : [var] pwszBuff バッファのサイズ(文字単位)を指定する変数へのポインタ。
%inst
ShutdownBlockReasonCreate 関数で設定された理由文字列を取得する。

[戻り値]
成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
この関数は hWnd を作成したスレッドからのみ呼び出せる。


%index
SkipPointerFrameMessages
指定ポインタについて最近取得したメッセージを生成したポインタ入力フレームを判定し、同じポインタ入力フレームから生成された保留中のポインタ入力メッセージを破棄する。
%group
Win32 user32
%prm
pointerId
pointerId : [int] ポインタの識別子。このポインタの最新取得入力を含むフレームについて、保留中のメッセージをスキップする。
%inst

指定ポインタについて最近取得したメッセージを生成したポインタ入力フレームを判定し、同じポインタ入力フレームから生成された保留中のポインタ入力メッセージを破棄する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
パラレルモードデバイスはポインタ入力をフレームで報告することがある。SkipPointerFrameMessages 関数は
GetPointerFrameInfo 関数と組み合わせてフレーム全体を単一の入力として消費できる。


%index
SoundSentry
音声が再生されていることを示すための視覚信号をトリガする。
%group
Win32 user32
%prm

%inst
音声が再生されていることを示すための視覚信号をトリガする。

[戻り値]
型: BOOL この関数は次の値のいずれかを返す。
（以下省略）

[備考]
SystemParametersInfo を SPI_SETSOUNDSENTRY で呼び出して通知動作を設定する。


%index
SubtractRect
SubtractRect 関数は、ある矩形から別の矩形を減算して形成される矩形の座標を決定する。
%group
Win32 user32
%prm
lprcDst, lprcSrc1, lprcSrc2
lprcDst : [var] lprcSrc1 から lprcSrc2 を減算して決定された矩形の座標を受け取る RECT 構造体へのポインタ。
lprcSrc1 : [var] 減算される矩形を指す RECT 構造体へのポインタ。
lprcSrc2 : [var] lprcSrc1 から減算される矩形を指す RECT 構造体へのポインタ。
%inst
SubtractRect 関数は、ある矩形から別の矩形を減算して形成される矩形の座標を決定する。

[戻り値]
結果の矩形が空の場合、戻り値は 0。空でない場合、戻り値は 0 以外。

[備考]
矩形が x または y 方向に完全に交差する場合のみ、関数は lprcSrc1 から lprcSrc2
を減算する。結果の矩形は幾何学的差分の境界ボックスとなる。


%index
SwapMouseButton
左右のマウスボタンの意味を反転または元に戻す。
%group
Win32 user32
%prm
fSwap
fSwap : [int] 型: BOOL TRUE なら左ボタンが右ボタンメッセージを、右ボタンが左ボタンメッセージを生成する。FALSE なら元の意味に戻す。
%inst
左右のマウスボタンの意味を反転または元に戻す。

[戻り値]
型: BOOL 関数呼び出し前にマウスボタンの意味が以前に反転されていた場合、戻り値は 0 以外。そうでない場合、戻り値は 0。

[備考]
ボタンの入れ替えは左手でマウスを使う人向けに提供される。通常 SwapMouseButton 関数はコントロールパネルからのみ呼ばれる。


%index
SwitchDesktop
指定されたデスクトップを可視化してアクティブ化する。これによりデスクトップはユーザからの入力を受け取れるようになる。
%group
Win32 user32
%prm
hDesktop
hDesktop : [intptr] デスクトップへのハンドル。CreateDesktop と OpenDesktop 関数が返す。このデスクトップはプロセスの現在のウィンドウステーションに関連付けられている必要がある。
%inst
指定されたデスクトップを可視化してアクティブ化する。これによりデスクトップはユーザからの入力を受け取れるようになる。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。
（以下省略）

[備考]
SwitchDesktop 関数は非可視ウィンドウステーションに属するデスクトップでは失敗する。WinLogon
やスクリーンセーバーデスクトップなどのセキュリティ保護されたデスクトップに関連付けられたプロセスから呼ばれた場合も失敗する。


%index
SwitchToThisWindow
指定されたウィンドウにフォーカスを切り替え、前景に持ってくる。
%group
Win32 user32
%prm
hwnd, fUnknown
hwnd : [intptr] 型: HWND ウィンドウへのハンドル。
fUnknown : [int] 型: BOOL Alt/Ctrl+Tab キーシーケンスによりウィンドウを切り替える場合は TRUE、それ以外は FALSE。
%inst
指定されたウィンドウにフォーカスを切り替え、前景に持ってくる。

[備考]
この関数は通常ウィンドウの Z オーダーを維持するために呼ばれる。Windows XP SP1 および Windows Server
2003 まで SDK ヘッダとライブラリに含まれていなかった。


%index
SystemParametersInfoW
システム全体のパラメータの値を取得または設定する。(Unicode)
%group
Win32 user32
%prm
uiAction, uiParam, pvParam, fWinIni
uiAction : [int] 型: UINT 取得または設定するシステム全体のパラメータ。
uiParam : [int] 型: UINT 使用法と形式は問い合わせまたは設定するシステムパラメータに依存するパラメータ。
pvParam : [intptr] 型: PVOID 使用法と形式は問い合わせまたは設定するシステムパラメータに依存するパラメータ。
fWinIni : [int] 型: UINT システムパラメータを設定中の場合、ユーザプロファイルを更新するか、WM_SETTINGCHANGE メッセージをすべてのトップレベルウィンドウにブロードキャストして変更を通知するかを指定する。
%inst
システム全体のパラメータの値を取得または設定する。(Unicode)

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
この関数はユーザが環境をカスタマイズできるようにするアプリケーション向け。この API は DPI
非認識であり、呼び出しスレッドがモニタごと DPI 認識の場合は使用すべきでない。DPI 認識版は
SystemParametersInfoForDPI を参照。


%index
SystemParametersInfoForDpi
提供された DPI 値を考慮してシステム全体のパラメータの値を取得する。
%group
Win32 user32
%prm
uiAction, uiParam, pvParam, fWinIni, dpi
uiAction : [int] 取得するシステム全体のパラメータ。この関数は SPI_GETICONTITLELOGFONT、SPI_GETICONMETRICS、SPI_GETNONCLIENTMETRICS でのみ使用される。
uiParam : [int] 使用法と形式は問い合わせるシステムパラメータに依存するパラメータ。
pvParam : [intptr] 使用法と形式は問い合わせるシステムパラメータに依存するパラメータ。
fWinIni : [int] この API では効果を持たない。
dpi : [int] メトリックのスケーリングに使用する DPI。
%inst
提供された DPI 値を考慮してシステム全体のパラメータの値を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
この関数は SystemParametersInfo と同様の結果を返すが、指定された任意の DPI
に応じてスケーリングする。uiAction に対応する値に文字列が含まれる場合、この関数では Unicode (LOGFONTW)
文字列のみがサポートされる。


%index
TabbedTextOutW
TabbedTextOut 関数は指定位置に文字列を書き、タブストップ位置配列の値に従ってタブを展開する。テキストは現在選択されているフォント、背景色、テキスト色で書かれる。(Unicode)
%group
Win32 user32
%prm
hdc, x, y, lpString, chCount, nTabPositions, lpnTabStopPositions, nTabOrigin
hdc : [intptr] デバイスコンテキストへのハンドル。
x : [int] 文字列の開始点の x 座標(論理単位)。
y : [int] 文字列の開始点の y 座標(論理単位)。
lpString : [wstr] 描画する文字列へのポインタ。nCount で文字列長を指定するため、0 終端不要。
chCount : [int] lpString が指す文字列の長さ。
nTabPositions : [int] タブストップ位置配列の値の数。
lpnTabStopPositions : [var] 論理単位のタブストップ位置を含む配列へのポインタ。昇順にソートする必要がある。
nTabOrigin : [int] タブ展開の基準となる開始位置の x 座標(論理単位)。
%inst
TabbedTextOut
関数は指定位置に文字列を書き、タブストップ位置配列の値に従ってタブを展開する。テキストは現在選択されているフォント、背景色、テキスト色で書かれる。(Unicode)

[戻り値]
関数が成功した場合、戻り値は文字列の論理単位の寸法。上位ワードが高さ、下位ワードが幅。失敗した場合、戻り値は 0。

[備考]
nTabPositions が 0 で lpnTabStopPositions が NULL の場合、タブは平均文字幅の 8
倍に展開される。nTabPositions が 1 ならタブストップは配列の最初の値の距離で分離される。既定では
TabbedTextOut 関数は現在位置を使用または更新しない。


%index
TileWindows
指定された親ウィンドウの指定子ウィンドウをタイル状に並べる。
%group
Win32 user32
%prm
hwndParent, wHow, lpRect, cKids, lpKids
hwndParent : [intptr] 型: HWND 親ウィンドウへのハンドル。NULL の場合、デスクトップウィンドウと仮定する。
wHow : [int] 型: UINT
lpRect : [var] 型: const RECT* ウィンドウを配置する矩形領域をクライアント座標で指定する構造体へのポインタ。NULL なら親ウィンドウのクライアント領域が使用される。
cKids : [int] 型: UINT lpKids で指定される配列の要素数。lpKids が NULL の場合は無視される。
lpKids : [intptr] 型: const HWND* 配置する子ウィンドウのハンドル配列。指定子ウィンドウが WS_EX_TOPMOST または WS_EX_TOOLWINDOW スタイルを持つトップレベルウィンドウの場合、配置されない。NULL なら親ウィンドウ(またはデスクトップウィンドウ)のすべての子ウィンドウが配置される。
%inst
指定された親ウィンドウの指定子ウィンドウをタイル状に並べる。

[戻り値]
型: WORD 関数が成功した場合、戻り値は配置されたウィンドウ数。失敗した場合、戻り値は 0。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
TileWindows を呼ぶと、すべての最大化ウィンドウが以前のサイズに復元される。


%index
ToAscii
指定された仮想キーコードとキーボード状態を対応する文字に変換する。
%group
Win32 user32
%prm
uVirtKey, uScanCode, lpKeyState, lpChar, uFlags
uVirtKey : [int] 型: UINT 変換する仮想キーコード。
uScanCode : [int] 型: UINT 変換するキーのハードウェアスキャンコード。キーが押されていない場合、この値の最上位ビットが設定される。
lpKeyState : [var] 型: const BYTE* 現在のキーボード状態を含む 256 バイトの配列へのポインタ。
lpChar : [var] 型: LPWORD 変換された文字を受け取るバッファ。下位バイトに最初の文字、存在すれば上位バイトに 2 番目の文字を含む。
uFlags : [int] 型: UINT メニューがアクティブな場合は 1、そうでなければ 0。
%inst
指定された仮想キーコードとキーボード状態を対応する文字に変換する。

[戻り値]
型: int 戻り値は次の値のいずれか。
（以下省略）

[備考]
ToAscii
に与えられたパラメータだけでは仮想キーコードの変換に不十分なことがある(キーボードレイアウトに前のデッドキーが格納されているため)。通常、ToAscii
は仮想キーコードに基づいて変換する。


%index
ToAsciiEx
指定された仮想キーコードとキーボード状態を対応する文字に変換する。入力ロケール識別子で識別される入力言語と物理キーボードレイアウトを使用してコードを変換する。
%group
Win32 user32
%prm
uVirtKey, uScanCode, lpKeyState, lpChar, uFlags, dwhkl
uVirtKey : [int] 型: UINT 変換する仮想キーコード。
uScanCode : [int] 型: UINT 変換するキーのハードウェアスキャンコード。
lpKeyState : [var] 型: const BYTE* 現在のキーボード状態を含む 256 バイト配列へのポインタ。
lpChar : [var] 型: LPWORD 変換された文字を受け取るバッファへのポインタ。
uFlags : [int] 型: UINT メニューがアクティブな場合は 1、そうでなければ 0。
dwhkl : [intptr] 型: HKL コードの変換に使用する入力ロケール識別子。
%inst

指定された仮想キーコードとキーボード状態を対応する文字に変換する。入力ロケール識別子で識別される入力言語と物理キーボードレイアウトを使用してコードを変換する。

[戻り値]
型: int 戻り値は次の値のいずれか。
（以下省略）

[備考]
入力ロケール識別子はキーボードレイアウトより広い概念である。ToAsciiEx
に与えられたパラメータだけでは仮想キーコードの変換に不十分なことがある。


%index
ToUnicode
指定された仮想キーコードとキーボード状態を対応する Unicode 文字に変換する。(ToUnicode)
%group
Win32 user32
%prm
wVirtKey, wScanCode, lpKeyState, pwszBuff, cchBuff, wFlags
wVirtKey : [int] 型: UINT 変換する仮想キーコード。
wScanCode : [int] 型: UINT 変換するキーのハードウェアスキャンコード。
lpKeyState : [var] 型: const BYTE* 現在のキーボード状態を含む 256 バイト配列へのポインタ。
pwszBuff : [wstr] 型: LPWSTR 変換された UTF-16 コード単位の配列として文字を受け取るバッファ。
cchBuff : [int] 型: int pwszBuff が指すバッファのサイズ(文字単位)。
wFlags : [int] 型: UINT 関数の動作。ビット 0 が設定されているとメニューがアクティブ。ビット 2 が設定されているとキーボード状態は変更されない(Windows 10 version 1607 以降)。
%inst
指定された仮想キーコードとキーボード状態を対応する Unicode 文字に変換する。(ToUnicode)

[戻り値]
型: int 関数は次の値のいずれかを返す。
（以下省略）

[備考]
指定コードの変換に使用するキーボードレイアウトのハンドルを指定するには ToUnicodeEx を使用する。一部のキーボードレイアウトは
pwszBuff にサロゲートペアとして複数の文字を返す可能性がある。


%index
ToUnicodeEx
指定された仮想キーコードとキーボード状態を対応する Unicode 文字に変換する。(ToUnicodeEx)
%group
Win32 user32
%prm
wVirtKey, wScanCode, lpKeyState, pwszBuff, cchBuff, wFlags, dwhkl
wVirtKey : [int] 型: UINT 変換する仮想キーコード。
wScanCode : [int] 型: UINT 変換するキーのハードウェアスキャンコード。
lpKeyState : [var] 型: const BYTE* 現在のキーボード状態を含む 256 バイト配列へのポインタ。
pwszBuff : [wstr] 型: LPWSTR 変換された UTF-16 コード単位の配列として文字を受け取るバッファ。
cchBuff : [int] 型: int pwszBuff が指すバッファのサイズ(文字単位)。
wFlags : [int] 型: UINT 関数の動作。ビット 0 が設定されているとメニューがアクティブ。ビット 1 が設定されているとキーブレークイベントとしてマークされたスキャンコードも変換する。ビット 2 が設定されているとキーボード状態は変更されない。
dwhkl : [intptr] 型: HKL 指定コードの変換に使用する入力ロケール識別子。
%inst
指定された仮想キーコードとキーボード状態を対応する Unicode 文字に変換する。(ToUnicodeEx)

[戻り値]
型: int 関数は次の値のいずれかを返す。
（以下省略）

[備考]
入力ロケール識別子はキーボードレイアウトより広い概念である。一部のキーボードレイアウトは pwszBuff
にサロゲートペアとして複数の文字を返す可能性がある。


%index
TrackMouseEvent
マウスポインタがウィンドウを離れたり、指定時間ウィンドウ上にホバーしたりしたときにメッセージをポストする。
%group
Win32 user32
%prm
lpEventTrack
lpEventTrack : [var] 型: LPTRACKMOUSEEVENT 追跡情報を含む TRACKMOUSEEVENT 構造体へのポインタ。
%inst
マウスポインタがウィンドウを離れたり、指定時間ウィンドウ上にホバーしたりしたときにメッセージをポストする。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
マウスポインタが指定矩形内に指定時間留まるとホバー中と見なされる。SystemParametersInfo を
SPI_GETMOUSEHOVERWIDTH、SPI_GETMOUSEHOVERHEIGHT、SPI_GETMOUSEHOVERTIME
で呼び出して矩形のサイズと時間を取得する。


%index
TrackPopupMenu
指定された位置にショートカットメニューを表示し、項目の選択を追跡する。ショートカットメニューは画面上の任意の場所に表示できる。
%group
Win32 user32
%prm
hMenu, uFlags, x, y, nReserved, hWnd, prcRect
hMenu : [intptr] 型: HMENU 表示するショートカットメニューへのハンドル。CreatePopupMenu で新しいショートカットメニューを作成するか、GetSubMenu で既存のメニュー項目に関連付けられたサブメニューへのハンドルを取得する。
uFlags : [int] 型: UINT 関数オプションを指定する 0 以上のフラグ。
x : [int] 型: int ショートカットメニューの水平位置(スクリーン座標)。
y : [int] 型: int ショートカットメニューの垂直位置(スクリーン座標)。
nReserved : [int] 型: int 予約済みで 0 を設定する。
hWnd : [intptr] 型: HWND ショートカットメニューを所有するウィンドウへのハンドル。このウィンドウがメニューからすべてのメッセージを受け取る。関数が戻るまで WM_COMMAND は受信しない。
prcRect : [var] 型: const RECT* 無視される。
%inst
指定された位置にショートカットメニューを表示し、項目の選択を追跡する。ショートカットメニューは画面上の任意の場所に表示できる。

[戻り値]
型: BOOL uFlags に TPM_RETURNCMD
を指定した場合、戻り値はユーザが選択した項目のメニュー項目識別子。ユーザが選択せずキャンセルした場合やエラー発生時は
0。TPM_RETURNCMD を指定しない場合、関数成功時は 0 以外、失敗時は 0。

[備考]
正しい水平配置フラグ(TPM_LEFTALIGN または TPM_RIGHTALIGN)や水平アニメーション方向フラグを決定するには
GetSystemMetrics を SM_MENUDROPALIGNMENT
で呼び出す。通知アイコンのコンテキストメニューを表示するには、TrackPopupMenu/TrackPopupMenuEx
を呼ぶ前に現在のウィンドウが前景ウィンドウである必要がある。


%index
TrackPopupMenuEx
指定された位置にショートカットメニューを表示し、項目の選択を追跡する。ショートカットメニューは画面上の任意の場所に表示できる。
%group
Win32 user32
%prm
hMenu, uFlags, x, y, hwnd, lptpm
hMenu : [intptr] 型: HMENU 表示するショートカットメニューへのハンドル。
uFlags : [int] 型: UINT 関数オプションを指定する。
x : [int] 型: int ショートカットメニューの水平位置(スクリーン座標)。
y : [int] 型: int ショートカットメニューの垂直位置(スクリーン座標)。
hwnd : [intptr] 型: HWND ショートカットメニューを所有するウィンドウへのハンドル。
lptpm : [var] 型: LPTPMPARAMS メニューが重ならない画面領域を指定する TPMPARAMS 構造体へのポインタ。NULL 可。
%inst
指定された位置にショートカットメニューを表示し、項目の選択を追跡する。ショートカットメニューは画面上の任意の場所に表示できる。

[戻り値]
型: BOOL fuFlags に TPM_RETURNCMD
を指定した場合、戻り値はユーザが選択した項目のメニュー項目識別子。TPM_RETURNCMD を指定しない場合、関数成功時は 0
以外、失敗時は 0。

[備考]
正しい水平配置フラグを決定するには GetSystemMetrics を SM_MENUDROPALIGNMENT
で呼び出す。通知アイコンのコンテキストメニューを表示するには、TrackPopupMenu/TrackPopupMenuEx
を呼ぶ前に現在のウィンドウが前景ウィンドウである必要がある。


%index
TranslateAcceleratorW
メニューコマンドのアクセラレータキーを処理する。(Unicode)
%group
Win32 user32
%prm
hWnd, hAccTable, lpMsg
hWnd : [intptr] 型: HWND メッセージを変換するウィンドウへのハンドル。
hAccTable : [intptr] 型: HACCEL アクセラレータテーブルへのハンドル。LoadAccelerators で読み込まれるか、CreateAcceleratorTable で作成されたものでなければならない。
lpMsg : [var] 型: LPMSG GetMessage または PeekMessage で取得したメッセージ情報を含む MSG 構造体へのポインタ。
%inst
メニューコマンドのアクセラレータキーを処理する。(Unicode)

[戻り値]
型: int 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
ウィンドウメニューから項目を選択するためのアクセラレータキーの組み合わせは WM_SYSCOMMAND メッセージに変換され、それ以外は
WM_COMMAND メッセージに変換される。TranslateAccelerator が 0
以外を返しメッセージが変換されている場合、TranslateMessage 関数でメッセージを再処理してはならない。


%index
TranslateMDISysAccel
指定された MDI クライアントウィンドウに関連付けられた MDI 子ウィンドウのウィンドウメニューコマンドのアクセラレータキーを処理する。
%group
Win32 user32
%prm
hWndClient, lpMsg
hWndClient : [intptr] 型: HWND MDI クライアントウィンドウへのハンドル。
lpMsg : [var] 型: LPMSG GetMessage または PeekMessage で取得されたメッセージへのポインタ。MSG 構造体でなければならない。
%inst
指定された MDI クライアントウィンドウに関連付けられた MDI
子ウィンドウのウィンドウメニューコマンドのアクセラレータキーを処理する。

[戻り値]
型: BOOL メッセージがシステムコマンドに変換された場合、戻り値は 0 以外。そうでない場合は 0。


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
UnhookWindowsHook
(no summary)
%group
Win32 user32
%prm
nCode, pfnFilterProc
nCode : [int] 
pfnFilterProc : [int] 
%inst



%index
UnionRect
UnionRect 関数は 2 つの矩形の和集合を作成する。和集合は両方のソース矩形を含む最小の矩形である。
%group
Win32 user32
%prm
lprcDst, lprcSrc1, lprcSrc2
lprcDst : [var] lprcSrc1 と lprcSrc2 が指す矩形を含む矩形を受け取る RECT 構造体へのポインタ。
lprcSrc1 : [var] 最初のソース矩形を含む RECT 構造体へのポインタ。
lprcSrc2 : [var] 2 番目のソース矩形を含む RECT 構造体へのポインタ。
%inst
UnionRect 関数は 2 つの矩形の和集合を作成する。和集合は両方のソース矩形を含む最小の矩形である。

[戻り値]
指定構造体が空でない矩形を含む場合、戻り値は 0 以外。空の場合、戻り値は 0。

[備考]
システムは空の矩形(すべての座標が 0 に設定された矩形)の寸法を無視する。


%index
UnpackDDElParam
ポストされた DDE メッセージから受信した動的データ交換 (DDE) lParam 値をアンパックする。
%group
Win32 user32
%prm
msg, lParam, puiLo, puiHi
msg : [int] 型: UINT ポストされた DDE メッセージ。
lParam : [intptr] 型: LPARAM 受信したポスト済み DDE メッセージの lParam パラメータ。アプリケーションは FreeDDElParam 関数を呼んで lParam で指定されたメモリオブジェクトを解放する必要がある。
puiLo : [var] 型: PUINT_PTR lParam の下位ワードを受け取る変数へのポインタ。
puiHi : [var] 型: PUINT_PTR lParam の上位ワードを受け取る変数へのポインタ。
%inst
ポストされた DDE メッセージから受信した動的データ交換 (DDE) lParam 値をアンパックする。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。

[備考]
PackDDElParam は 16 ビット DDE アプリケーションから 32 ビット DDE アプリケーションへの移植を容易にする。


%index
UnregisterClassW
ウィンドウクラスの登録を解除し、クラスに必要なメモリを解放する。(Unicode)
%group
Win32 user32
%prm
lpClassName, hInstance
lpClassName : [wstr] 型: LPCTSTR null 終端文字列またはクラスアトム。
hInstance : [intptr] 型: HINSTANCE クラスを作成したモジュールのインスタンスへのハンドル。
%inst
ウィンドウクラスの登録を解除し、クラスに必要なメモリを解放する。(Unicode)

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。クラスが見つからないか、クラスで作成されたウィンドウがまだ存在する場合、戻り値は
0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]

この関数を呼ぶ前に、アプリケーションは指定クラスで作成したすべてのウィンドウを破棄する必要がある。アプリケーションが登録したすべてのウィンドウクラスは終了時に登録解除される。


%index
UnregisterHotKey
呼び出しスレッドが以前に登録したホットキーを解放する。
%group
Win32 user32
%prm
hWnd, id
hWnd : [intptr] 型: HWND 解放するホットキーに関連付けられたウィンドウへのハンドル。ホットキーがウィンドウに関連付けられていない場合は NULL。
id : [int] 型: int 解放するホットキーの識別子。
%inst
呼び出しスレッドが以前に登録したホットキーを解放する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。


%index
UnregisterPointerInputTarget
呼び出し元が指定種別のすべてのポインタ入力をリダイレクトされるターゲットウィンドウの登録を解除できるようにする。
%group
Win32 user32
%prm
hwnd, pointerType
hwnd : [intptr] デスクトップ上でグローバルリダイレクトターゲットとしての登録を解除するウィンドウ。
pointerType : [int] 指定ウィンドウへのリダイレクトを停止するポインタ入力の種別。POINTER_INPUT_TYPE 列挙の有効な値。
%inst
呼び出し元が指定種別のすべてのポインタ入力をリダイレクトされるターゲットウィンドウの登録を解除できるようにする。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
RegisterPointerInputTarget
を正常に呼び出したアプリケーションは、この関数を呼んで指定ポインタ種別のグローバルリダイレクトターゲットとしてのウィンドウの登録を解除できる。


%index
UnregisterPointerInputTargetEx
UnregisterPointerInputTargetEx は変更または利用不可になる可能性がある。代わりに UnregisterPointerInputTarget を使用する。
%group
Win32 user32
%prm
hwnd, pointerType
hwnd : [intptr] サポートされていない。
pointerType : [int] サポートされていない。
%inst
UnregisterPointerInputTargetEx は変更または利用不可になる可能性がある。代わりに
UnregisterPointerInputTarget を使用する。

[戻り値]
サポートされていない。


%index
UnregisterSuspendResumeNotification
システムがサスペンドまたは再開されたときの通知受信の登録を解除する。
%group
Win32 user32
%prm
Handle
Handle : [intptr] RegisterSuspendResumeNotification の呼び出しで取得した登録へのハンドル。
%inst
システムがサスペンドまたは再開されたときの通知受信の登録を解除する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。


%index
UnregisterTouchWindow
ウィンドウをタッチ対応でないとして登録する。
%group
Win32 user32
%prm
hwnd
hwnd : [intptr] ウィンドウのハンドル。呼び出しスレッドが指定ウィンドウを所有していない場合、ERROR_ACCESS_DENIED で失敗する。
%inst
ウィンドウをタッチ対応でないとして登録する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。
失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
UnregisterTouchWindow 関数は指定ウィンドウが以前にタッチ対応として登録されていなくても成功する。


%index
UpdateLayeredWindow
レイヤードウィンドウの位置、サイズ、形状、コンテンツ、半透明性を更新する。
%group
Win32 user32
%prm
hWnd, hdcDst, pptDst, psize, hdcSrc, pptSrc, crKey, pblend, dwFlags
hWnd : [intptr] 型: HWND レイヤードウィンドウへのハンドル。CreateWindowEx で WS_EX_LAYERED を指定して作成する。
hdcDst : [intptr] 型: HDC 画面の DC へのハンドル。GetDC を NULL で呼んで取得する。ウィンドウ内容更新時のパレット色マッチングに使用される。
pptDst : [var] 型: POINT* レイヤードウィンドウの新しい画面位置を指定する構造体へのポインタ。現在位置が変わらない場合は NULL 可。
psize : [var] 型: SIZE* レイヤードウィンドウの新しいサイズを指定する構造体へのポインタ。サイズが変わらない場合は NULL 可。
hdcSrc : [intptr] 型: HDC レイヤードウィンドウを定義するサーフェスの DC へのハンドル。CreateCompatibleDC で取得できる。ウィンドウの形状と視覚的コンテキストが変わらない場合は NULL 可。
pptSrc : [var] 型: POINT* デバイスコンテキスト内のレイヤの位置を指定する構造体へのポインタ。hdcSrc が NULL なら pptSrc も NULL。
crKey : [int] 型: COLORREF レイヤードウィンドウの合成時に使用する色キーを指定する構造体。
pblend : [var] 型: BLENDFUNCTION* レイヤードウィンドウの合成時に使用する透明度値を指定する構造体へのポインタ。
dwFlags : [int] 型: DWORD
%inst
レイヤードウィンドウの位置、サイズ、形状、コンテンツ、半透明性を更新する。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
ソース DC はレイヤードウィンドウの可視コンテンツを定義するサーフェスを含むべきである。UpdateLayeredWindow
関数は画面上のウィンドウの外観を維持する。UpdateLayeredWindow は常にウィンドウ全体を更新する。


%index
UpdateLayeredWindowIndirect
(no summary)
%group
Win32 user32
%prm
hWnd, pULWInfo
hWnd : [intptr] 
pULWInfo : [var] 
%inst



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
UserHandleGrantAccess
ユーザインターフェイス制限を持つジョブに対してユーザオブジェクトへのハンドルへのアクセスを許可または拒否する。
%group
Win32 user32
%prm
hUserHandle, hJob, bGrant
hUserHandle : [intptr] ユーザオブジェクトへのハンドル。
hJob : [intptr] ユーザハンドルへのアクセスを許可するジョブへのハンドル。
bGrant : [int] TRUE ならジョブに関連付けられたすべてのプロセスがハンドルを認識・使用できる。FALSE なら使用できない。
%inst
ユーザインターフェイス制限を持つジョブに対してユーザオブジェクトへのハンドルへのアクセスを許可または拒否する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
UserHandleGrantAccess 関数は hJob
で指定されたジョブに関連付けられていないプロセスからのみ呼び出せる。ユーザハンドルはジョブに関連付けられたプロセスまたはスレッドによって所有されてはならない。


%index
ValidateRect
ValidateRect 関数は指定されたウィンドウの更新領域から矩形を削除することで、矩形内のクライアント領域を有効化する。
%group
Win32 user32
%prm
hWnd, lpRect
hWnd : [intptr] 更新領域を変更するウィンドウへのハンドル。NULL の場合、システムはすべてのウィンドウを無効化・再描画し、関数が戻る前にウィンドウプロシージャに WM_ERASEBKGND と WM_NCPAINT メッセージを送る。
lpRect : [var] 更新領域から削除する矩形のクライアント座標を含む RECT 構造体へのポインタ。NULL の場合、クライアント領域全体が削除される。
%inst
ValidateRect 関数は指定されたウィンドウの更新領域から矩形を削除することで、矩形内のクライアント領域を有効化する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。

[備考]
BeginPaint 関数は自動的にクライアント領域全体を有効化する。次の WM_PAINT
メッセージが生成される前に更新領域の一部を有効化する必要がある場合を除き、ValidateRect/ValidateRgn
関数を呼ぶべきでない。


%index
ValidateRgn
ValidateRgn 関数は指定されたウィンドウの現在の更新領域から領域を削除することで、領域内のクライアント領域を有効化する。
%group
Win32 user32
%prm
hWnd, hRgn
hWnd : [intptr] 更新領域を変更するウィンドウへのハンドル。
hRgn : [intptr] 更新領域から削除する領域を定義する領域へのハンドル。NULL の場合、クライアント領域全体が削除される。
%inst
ValidateRgn 関数は指定されたウィンドウの現在の更新領域から領域を削除することで、領域内のクライアント領域を有効化する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。

[備考]
指定された領域は領域関数で作成されている必要がある。領域座標はクライアント座標と仮定される。


%index
VkKeyScanW
文字を現在のキーボードの対応する仮想キーコードとシフト状態に変換する。(Unicode)
%group
Win32 user32
%prm
ch
ch : [int] 型: TCHAR 仮想キーコードに変換する文字。
%inst
文字を現在のキーボードの対応する仮想キーコードとシフト状態に変換する。(Unicode)

[戻り値]
型: SHORT 関数が成功した場合、戻り値の下位バイトに仮想キーコード、上位バイトにシフト状態が含まれる。
（以下省略）

[備考]
右 ALT キーをシフトキーとして使うキーボードレイアウト(例: フランス語キーボード)では、右 ALT が内部的に CTRL+ALT
に変換されるため、シフト状態は値 6 で表される。


%index
VkKeyScanExW
文字を対応する仮想キーコードとシフト状態に変換する。入力ロケール識別子で識別される入力言語と物理キーボードレイアウトを使用して変換する。(Unicode)
%group
Win32 user32
%prm
ch, dwhkl
ch : [int] 型: TCHAR 仮想キーコードに変換する文字。
dwhkl : [intptr] 型: HKL 文字の変換に使用する入力ロケール識別子。
%inst

文字を対応する仮想キーコードとシフト状態に変換する。入力ロケール識別子で識別される入力言語と物理キーボードレイアウトを使用して変換する。(Unicode)

[戻り値]
型: SHORT 関数が成功した場合、戻り値の下位バイトに仮想キーコード、上位バイトにシフト状態が含まれる。
（以下省略）

[備考]
入力ロケール識別子はキーボードレイアウトより広い概念である。VkKeyScanEx
はメインキーボードセクションからのキー入力に文字を変換することを意図している。


%index
WINNLSEnableIME
入力方式エディタ (IME) を一時的に有効化または無効化し、同時に IME が所有するすべてのウィンドウの表示をオン/オフする。
%group
Win32 user32
%prm
param0, param1
param0 : [intptr] 
param1 : [int] 
%inst
入力方式エディタ (IME) を一時的に有効化または無効化し、同時に IME が所有するすべてのウィンドウの表示をオン/オフする。

[戻り値]
IME の以前の状態。この呼び出し前に有効だった場合は TRUE、そうでなければ FALSE。

[備考]
IME が無効化されると IME_WINDOWUPDATE(FALSE) が発行され、IME
は変換およびシステムウィンドウを削除する。無効状態ではキーボードメッセージは IME に送られず、アプリケーションに直接送られる。


%index
WINNLSGetEnableStatus
(no summary)
%group
Win32 user32
%prm
param0
param0 : [intptr] 
%inst



%index
WINNLSGetIMEHotkey
(no summary)
%group
Win32 user32
%prm
param0
param0 : [intptr] 
%inst



%index
WaitForInputIdle
指定されたプロセスが初期入力処理を完了し入力を待っているか、タイムアウト間隔が経過するまで待機する。
%group
Win32 user32
%prm
hProcess, dwMilliseconds
hProcess : [intptr] プロセスへのハンドル。コンソールアプリケーションやメッセージキューを持たないプロセスの場合、WaitForInputIdle は即座に戻る。
dwMilliseconds : [int] タイムアウト間隔(ミリ秒単位)。INFINITE の場合、プロセスがアイドルになるまで戻らない。
%inst
指定されたプロセスが初期入力処理を完了し入力を待っているか、タイムアウト間隔が経過するまで待機する。

[戻り値]
次表に可能な戻り値を示す。
（以下省略）

[備考]
WaitForInputIdle
関数はスレッドが指定プロセスの初期化完了と入力待ち状態まで実行を停止できるようにする。プロセスに複数スレッドがある場合、いずれかのスレッドがアイドルになると戻る。


%index
WaitMessage
スレッドのメッセージキューに他のメッセージがないときに制御を他のスレッドに譲る。WaitMessage 関数はスレッドを一時停止し、新しいメッセージがスレッドのメッセージキューに置かれるまで戻らない。
%group
Win32 user32
%prm

%inst
スレッドのメッセージキューに他のメッセージがないときに制御を他のスレッドに譲る。WaitMessage
関数はスレッドを一時停止し、新しいメッセージがスレッドのメッセージキューに置かれるまで戻らない。

[戻り値]
型: BOOL 関数が成功した場合、戻り値は 0 以外。失敗した場合、戻り値は 0。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
WaitMessage はスレッドがキューを検査する関数を呼び出した後、メッセージキューに未読入力があっても戻らない。これは
PeekMessage、GetMessage、GetQueueStatus、WaitMessage
などの関数がキューを検査した後、キューの状態情報を変更して入力がもはや新しいと見なされないようにするため。


%index
WinHelpW
Windows Help (Winhelp.exe) を起動し、アプリケーションが要求するヘルプの性質を示す追加データを渡す。(Unicode)
%group
Win32 user32
%prm
hWndMain, lpszHelp, uCommand, dwData
hWndMain : [intptr] 型: HWND ヘルプを要求するウィンドウへのハンドル。WinHelp はこのハンドルでどのアプリケーションがヘルプを要求したかを追跡する。
lpszHelp : [wstr] 型: LPCTSTR WinHelp が表示するヘルプファイルのパス(必要なら)と名前を含む null 終端文字列のアドレス。
uCommand : [int] 型: UINT 要求されるヘルプの種類。可能な値と dwData パラメータに置く値の対応については解説を参照。
dwData : [int] 型: ULONG_PTR 追加データ。使用される値は uCommand の値に依存する。
%inst
Windows Help (Winhelp.exe)
を起動し、アプリケーションが要求するヘルプの性質を示す追加データを渡す。(Unicode)

[戻り値]
型: BOOL 成功した場合は 0 以外、そうでない場合は 0 を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
ヘルプを要求したウィンドウを閉じる前に、アプリケーションは uCommand を HELP_QUIT に設定して WinHelp
を呼ぶ必要がある。すべてのアプリケーションがこれを行うまで Windows Help は終了しない。


%index
WindowFromDC
WindowFromDC 関数は指定されたディスプレイデバイスコンテキスト (DC) に関連付けられたウィンドウへのハンドルを返す。
%group
Win32 user32
%prm
hDC
hDC : [intptr] 関連するウィンドウへのハンドルを取得するデバイスコンテキストへのハンドル。
%inst
WindowFromDC 関数は指定されたディスプレイデバイスコンテキスト (DC) に関連付けられたウィンドウへのハンドルを返す。

[戻り値]
戻り値は指定 DC に関連付けられたウィンドウへのハンドル。関連付けられたウィンドウがない場合、戻り値は NULL。


%index
WindowFromPhysicalPoint
指定された物理点を含むウィンドウへのハンドルを取得する。
%group
Win32 user32
%prm
Point
Point : [int] 型: POINT 点の物理座標。
%inst
指定された物理点を含むウィンドウへのハンドルを取得する。

[戻り値]
型: HWND 指定された物理点を含むウィンドウへのハンドル。点の位置にウィンドウが存在しない場合、戻り値は NULL。

[備考]
WindowFromPhysicalPoint
関数は点がウィンドウ内にあっても、隠されたウィンドウや無効化されたウィンドウへのハンドルを取得しない。


%index
WindowFromPoint
指定された点を含むウィンドウへのハンドルを取得する。
%group
Win32 user32
%prm
Point
Point : [int] 型: POINT 検査する点。
%inst
指定された点を含むウィンドウへのハンドルを取得する。

[戻り値]
型: HWND 戻り値は点を含むウィンドウへのハンドル。点の位置にウィンドウが存在しない場合、戻り値は NULL。

[備考]
WindowFromPoint
関数は点がウィンドウ内にあっても、隠されたウィンドウや無効化されたウィンドウへのハンドルを取得しない。より非制限的な検索を行うには
ChildWindowFromPoint 関数を使用する。

