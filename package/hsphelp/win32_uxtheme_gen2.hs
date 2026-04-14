; ============================================================
;   uxtheme.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
BeginBufferedAnimation
バッファ付きアニメーション操作を開始する。アニメーションは、指定された期間にわたる 2 つのバッファ内容のクロスフェードから構成される。
%group
Win32 uxtheme
%prm
hwnd, hdcTarget, prcTarget, dwFormat, pPaintParams, pAnimationParams, phdcFrom, phdcTo
hwnd : [intptr] 型: HWND アニメーションを再生するウィンドウのハンドル。
hdcTarget : [intptr] 型: HDC バッファをアニメーション表示するターゲット DC のハンドル。
prcTarget : [var] 型: const RECT* 描画対象となるターゲット DC 上の領域を指定する構造体へのポインター。
dwFormat : [int] 型: BP_BUFFERFORMAT バッファのフォーマット。
pPaintParams : [var] 型: BP_PAINTPARAMS* 描画操作のパラメーターを定義する構造体へのポインター。この値は NULL を指定できる。
pAnimationParams : [var] 型: BP_ANIMATIONPARAMS* アニメーション操作のパラメーターを定義する構造体へのポインター。
phdcFrom : [intptr] 型: HDC* この関数から戻ったとき、NULL でなければアニメーションの初期状態をアプリケーションが描画すべき DC のハンドルを指す。
phdcTo : [intptr] 型: HDC* この関数から戻ったとき、NULL でなければアニメーションの最終状態をアプリケーションが描画すべき DC のハンドルを指す。
%inst
バッファ付きアニメーション操作を開始する。アニメーションは、指定された期間にわたる 2 つのバッファ内容のクロスフェードから構成される。

[戻り値]
型: HANIMATIONBUFFER バッファ付き描画アニメーションへのハンドル。

[備考]
BeginBufferedAnimation は、複数の WM_PAINT メッセージを生成することにより、これら 2
つの状態の間の中間フレームの描画を引き受ける。
BeginBufferedAnimation はタイマーを開始し、WM_PAINT メッセージを生成する。これらのメッセージ内で
BufferedPaintRenderAnimation
を呼び出す必要がある。これらのメッセージ中、BufferedPaintRenderAnimation は中間フレームを描画したときに
TRUE を返し、アプリケーションがこれ以上描画する必要がないことを示す。アニメーション期間が 0 の場合、phdcTo
のみが返され、phdcFrom は NULL に設定される。この場合、アプリケーションは BeginBufferedPaint
と同様の動作を得るために phdcTo を用いて最終状態を描画する必要がある。


%index
BeginBufferedPaint
バッファ付き描画操作を開始する。
%group
Win32 uxtheme
%prm
hdcTarget, prcTarget, dwFormat, pPaintParams, phdc
hdcTarget : [intptr] 型: HDC バッファを描画するターゲット DC のハンドル。
prcTarget : [var] 型: const RECT* 描画対象となるターゲット DC 上の領域を指定する RECT 構造体へのポインター。
dwFormat : [int] 型: BP_BUFFERFORMAT バッファのフォーマットを指定する BP_BUFFERFORMAT 列挙体のメンバー。
pPaintParams : [var] 型: BP_PAINTPARAMS* 描画操作のパラメーターを定義する BP_PAINTPARAMS 構造体へのポインター。この値は NULL を指定できる。
phdc : [intptr] 型: HDC* この関数から戻ったとき、新しいデバイスコンテキストのハンドルを指す。
%inst
バッファ付き描画操作を開始する。

[戻り値]
型: HPAINTBUFFER バッファ付き描画コンテキストへのハンドル。関数が失敗した場合は戻り値が NULL となり、phdc も
NULL になる。拡張エラー情報を取得するには GetLastError を呼び出す。返されたハンドルは EndBufferedPaint
が呼び出されたときに解放される。アプリケーションは BeginBufferedPaint を呼び出す前に呼び出し元スレッドで
BufferedPaintInit を呼び出し、スレッド終了前に BufferedPaintUnInit
を呼び出す必要がある。BufferedPaintInit
を呼び出さないと、バッファ付き描画操作ごとに内部データが初期化および破棄されるため、性能が低下することがある。


%index
BeginPanningFeedback
パンジェスチャーの影響を受けるターゲットウィンドウについてフィードバックを送るようシステムに通知する。
%group
Win32 uxtheme
%prm
hwnd
hwnd : [intptr] 型: HWND フィードバックを受け取るターゲットウィンドウのハンドル。
%inst
パンジェスチャーの影響を受けるターゲットウィンドウについてフィードバックを送るようシステムに通知する。

[戻り値]
型: BOOL 成功した場合は TRUE。

[備考]
この関数は UpdatePanningFeedback または EndPanningFeedback
関数を呼び出す前に呼び出す必要がある。


%index
BufferedPaintClear
バッファ内の指定された矩形を ARGB = {0,0,0,0} にクリアする。
%group
Win32 uxtheme
%prm
hBufferedPaint, prc
hBufferedPaint : [int] 型: HPAINTBUFFER BeginBufferedPaint で取得したバッファ付き描画コンテキストのハンドル。
prc : [var] 型: const RECT* クリアする矩形を指定する RECT 構造体へのポインター。バッファ全体を指定するにはこのパラメーターを NULL に設定する。
%inst
バッファ内の指定された矩形を ARGB = {0,0,0,0} にクリアする。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
この関数はバッファのビットに直接アクセスするため、GDI 関数を呼び出してバッファを消去するよりも高速である。


%index
BufferedPaintInit
現在のスレッドのバッファ付き描画を初期化する。
%group
Win32 uxtheme
%prm

%inst
現在のスレッドのバッファ付き描画を初期化する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
BufferedPaintInit は、これらの関数を使用するスレッドごとに BeginBufferedPaint または
BeginBufferedAnimation の前に呼び出される。BufferedPaintInit の各呼び出しは、バッファ付き描画
API の呼び出しが不要になった時点で BufferedPaintUnInit
の呼び出しと対応させる必要がある。アプリケーションは、BufferedPaintInit の各呼び出しが
BufferedPaintUnInit の呼び出しとバランスする限り、この API を複数回呼び出すことができる。
この関数は、スレッドの存続期間中に 1 回だけ呼び出せばよい。通常、この関数はメインアプリケーションウィンドウを作成する前、または
WM_CREATE 内で呼び出される。BufferedPaintUnInit はウィンドウ破棄後、または WM_NCDESTROY
内で呼び出す。


%index
BufferedPaintRenderAnimation
バッファ付き描画アニメーションの次のフレームを描画する。
%group
Win32 uxtheme
%prm
hwnd, hdcTarget
hwnd : [intptr] 型: HWND アニメーションを再生するウィンドウのハンドル。
hdcTarget : [intptr] 型: HDC バッファをアニメーション表示するターゲット DC のハンドル。
%inst
バッファ付き描画アニメーションの次のフレームを描画する。

[戻り値]
型: BOOL フレームが描画された場合は TRUE、そうでない場合は FALSE を返す。

[備考]
この関数が TRUE を返した場合、アプリケーションはこれ以上描画を行うべきではない。FALSE
を返した場合は通常通り描画する。アプリケーションはこの関数を WM_PAINT
ハンドラー内で呼び出す。BufferedPaintRenderAnimation
がアニメーションフレームを描画した後、アプリケーションは通常、通常の描画操作を行わずに処理を続行する。必要に応じて、アプリケーションはアニメーションの上に追加のユーザーインターフェイス
(UI) を描画してもよい。次のコード例は、より大きなコード本体の一部として、アニメーション描画関数の使用方法を示している。
（以下省略）


%index
BufferedPaintSetAlpha
指定された矩形内でアルファを指定値に設定する。アルファは、バッファを描画先デバイスコンテキスト (DC) にブレンドする際に適用される透明度の量を制御する。
%group
Win32 uxtheme
%prm
hBufferedPaint, prc, alpha
hBufferedPaint : [int] 型: HPAINTBUFFER BeginBufferedPaint で取得したバッファ付き描画コンテキストのハンドル。
prc : [var] 型: const RECT* アルファを設定する矩形を指定する RECT 構造体へのポインター。バッファ全体を指定するにはこのパラメーターを NULL に設定する。
alpha : [int] 型: BYTE 設定するアルファ値。アルファ値は 0 (完全に透明) から 255 (完全に不透明) までの範囲で指定できる。
%inst
指定された矩形内でアルファを指定値に設定する。アルファは、バッファを描画先デバイスコンテキスト (DC)
にブレンドする際に適用される透明度の量を制御する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
この関数は対象矩形内の各ピクセルに対してアルファ値を設定する。アルファ値に 255
を渡すとピクセルは完全に不透明となる。uxtheme.h で定義されている BufferedPaintMakeOpaque
マクロは、アルファ値を 255 に設定する。これは通常、GDI
を呼び出してメモリバッファに描画した後、グラス上に描画するために不透明化する目的で使用される。


%index
BufferedPaintStopAllAnimations
指定されたウィンドウのすべてのバッファ付きアニメーションを停止する。
%group
Win32 uxtheme
%prm
hwnd
hwnd : [intptr] 型: HWND すべてのアニメーションを停止するウィンドウのハンドル。
%inst
指定されたウィンドウのすべてのバッファ付きアニメーションを停止する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
BufferedPaintUnInit
現在のスレッドのバッファ付き描画を終了する。BeginBufferedPaint の呼び出しが不要になった後、BufferedPaintInit の呼び出しごとに 1 回呼び出される。
%group
Win32 uxtheme
%prm

%inst
現在のスレッドのバッファ付き描画を終了する。BeginBufferedPaint
の呼び出しが不要になった後、BufferedPaintInit の呼び出しごとに 1 回呼び出される。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
CloseThemeData
テーマデータハンドルを閉じる。
%group
Win32 uxtheme
%prm
hTheme
hTheme : [intptr] 型: HTHEME ウィンドウのテーマデータへのハンドル。OpenThemeData で HTHEME を作成する。
%inst
テーマデータハンドルを閉じる。

[戻り値]
型: HRESULT 成功時は S_OK、失敗時は HRESULT エラーコードを返す。

[備考]
ビジュアルスタイルを適用されたウィンドウが破棄されるときに本関数を呼ぶこと。WM_THEMECHANGED
を受信した際にも呼ぶこと。呼び出し後、IsThemeActive が TRUE を返す場合は新しいテーマデータハンドルを作成しなおすこと。


%index
DrawThemeBackground
指定コントロールパートのビジュアルスタイルで定義された枠線と塗りつぶしを描画する。
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, pRect, pClipRect
hTheme : [intptr] 型: HTHEME ウィンドウのテーマデータへのハンドル。OpenThemeData で HTHEME を作成する。
hdc : [intptr] 型: HDC テーマ背景画像を描画する HDC。
iPartId : [int] 型: int 描画するパートを指定する int 値。Parts and States を参照。
iStateId : [int] 型: int 描画するパートの状態を指定する int 値。Parts and States を参照。
pRect : [var] 型: const RECT* 背景画像を描画する矩形(論理座標)を含む RECT 構造体へのポインタ。
pClipRect : [var] 型: const RECT* クリッピング矩形を含む RECT へのポインタ。NULL 可。
%inst
指定コントロールパートのビジュアルスタイルで定義された枠線と塗りつぶしを描画する。

[戻り値]
型: HRESULT 成功時は S_OK、失敗時は HRESULT エラーコードを返す。

[備考]
描画は pRect で指定された矩形に収まるようスケールされ、それを超えないようにする。アプリケーションは pClipRect
で指定した矩形の外に描画してはならない。


%index
DrawThemeBackgroundEx
指定されたコントロールパートに対してビジュアルスタイルが定義する背景画像を描画する。
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, pRect, pOptions
hTheme : [intptr] 型: HTHEME ウィンドウの指定されたテーマデータへのハンドル。HTHEME を作成するには OpenThemeData を使用する。
hdc : [intptr] 型: HDC テーマで定義された背景画像の描画に使用する HDC。
iPartId : [int] 型: int 描画するパートを指定する int 型の値。Parts and States を参照。
iStateId : [int] 型: int 描画するパートの状態を指定する int 型の値。Parts and States を参照。
pRect : [var] 型: const RECT* 背景画像を描画する論理座標での矩形を含む RECT 構造体へのポインター。
pOptions : [var] 型: const DTBGOPTS* クリッピング情報を含む DTBGOPTS 構造体へのポインター。このパラメーターは NULL に設定できる。
%inst
指定されたコントロールパートに対してビジュアルスタイルが定義する背景画像を描画する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
描画操作は pRect で指定された矩形に収まり、それを超えないようにスケーリングされる。


%index
DrawThemeEdge
矩形のビジュアルスタイルで定義された 1 つ以上のエッジを描画する。
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, pDestRect, uEdge, uFlags, pContentRect
hTheme : [intptr] 型: HTHEME ウィンドウの指定されたテーマデータへのハンドル。HTHEME を作成するには OpenThemeData を使用する。
hdc : [intptr] 型: HDC HDC。
iPartId : [int] 型: int 矩形を含むパートを指定する int 型の値。Parts and States を参照。
iStateId : [int] 型: int パートの状態を指定する int 型の値。Parts and States を参照。
pDestRect : [var] 型: LPCRECT 論理座標での矩形を含む RECT 構造体へのポインター。
uEdge : [int] 型: UINT 描画する内側および外側エッジの種類を指定する UINT。このパラメーターは、内側ボーダーフラグと外側ボーダーフラグの組み合わせ、または組み合わせフラグのいずれかでなければならない。ボーダーフラグは次のとおり:
uFlags : [int] 型: UINT
pContentRect : [var] 型: LPRECT uFlags が BF_ADJUST に設定されている場合に、内側の矩形を受け取る論理座標の矩形を含む RECT 構造体へのポインター。このパラメーターは NULL に設定できる。
%inst
矩形のビジュアルスタイルで定義された 1 つ以上のエッジを描画する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
DrawThemeIcon
イメージリストから画像を、ビジュアルスタイルが定義するアイコン効果付きで描画する。
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, pRect, himl, iImageIndex
hTheme : [intptr] 型: HTHEME ウィンドウの指定されたテーマデータへのハンドル。HTHEME を作成するには OpenThemeData を使用する。
hdc : [intptr] 型: HDC HDC。
iPartId : [int] 型: int 画像を描画するパートを指定する int 型の値。Parts and States を参照。
iStateId : [int] 型: int パートの状態を指定する int 型の値。Parts and States を参照。
pRect : [var] 型: LPCRECT 画像を描画する論理座標での矩形を含む RECT 構造体へのポインター。
himl : [intptr] 型: HIMAGELIST 描画する画像を含むイメージリストへのハンドル。
iImageIndex : [int] 型: int 描画する画像のインデックスを指定する int 型の値。
%inst
イメージリストから画像を、ビジュアルスタイルが定義するアイコン効果付きで描画する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
DrawThemeParentBackground
部分的に透明またはアルファブレンドされた子コントロールが覆っている親コントロールの部分を描画する。
%group
Win32 uxtheme
%prm
hwnd, hdc, prc
hwnd : [intptr] 型: HWND 子コントロール。
hdc : [intptr] 型: HDC 子コントロールの DC。
prc : [var] 型: const RECT* 描画する領域。矩形は子ウィンドウの座標系で指定する。このパラメーターが NULL の場合、描画される領域は子コントロールが占有する領域全体となる。
%inst
部分的に透明またはアルファブレンドされた子コントロールが覆っている親コントロールの部分を描画する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
DrawThemeParentBackgroundEx
部分的に透明またはアルファブレンドされた子コントロールが、その前面に表示される親の部分を描画するために使用される。WM_ERASEBKGND メッセージに続いて WM_PRINTCLIENT を送信する。
%group
Win32 uxtheme
%prm
hwnd, hdc, dwFlags, prc
hwnd : [intptr] 型: HWND 子コントロールのハンドル。
hdc : [intptr] 型: HDC 子コントロールの HDC。
dwFlags : [int] 型: DWORD
prc : [var] 型: const RECT* 任意。子座標系で描画する領域。このパラメーターが NULL の場合、描画される領域は子コントロールが占有する領域全体となる。
%inst

部分的に透明またはアルファブレンドされた子コントロールが、その前面に表示される親の部分を描画するために使用される。WM_ERASEBKGND
メッセージに続いて WM_PRINTCLIENT を送信する。

[戻り値]
型: HRESULT 成功した場合は S_OK、それ以外の場合は S_FALSE。


%index
DrawThemeText
ビジュアルスタイルで定義された色とフォントを使ってテキストを描画する。
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, pszText, cchText, dwTextFlags, dwTextFlags2, pRect
hTheme : [intptr] 型: HTHEME ウィンドウのテーマデータへのハンドル。OpenThemeData で HTHEME を作成する。
hdc : [intptr] 型: HDC 描画に使う HDC。
iPartId : [int] 型: int 目的のテキスト外観を持つコントロールパート。0 を指定すると既定フォント(または HDC に選択されたフォント)で描画される。
iStateId : [int] 型: int 目的のテキスト外観を持つコントロール状態。
pszText : [wstr] 型: LPCWSTR 描画するテキスト文字列へのポインタ。
cchText : [int] 型: int 描画する文字数。-1 を指定すると文字列の全文字を描画する。
dwTextFlags : [int] 型: DWORD 文字列書式を指定する値(1 つ以上)。DrawThemeText は DT_CALCRECT をサポートしないが、DrawThemeTextEx はサポートする。
dwTextFlags2 : [int] 型: DWORD 使用しない。0 を指定する。
pRect : [var] 型: LPCRECT テキスト描画矩形(論理座標)を含む RECT 構造体へのポインタ。GetThemeTextExtent で得られる pExtentRect の使用が推奨される。
%inst
ビジュアルスタイルで定義された色とフォントを使ってテキストを描画する。

[戻り値]
型: HRESULT 成功時は S_OK、失敗時は HRESULT エラーコードを返す。

[備考]
指定パート・状態に対してテーマフォントが定義されていれば常にそれを使用する。定義されていない場合は現在 HDC
に選択されているフォントを使う。テーマフォントの有無は GetThemeFont や GetThemePropertyOrigin を
TMT_FONT で呼んで確認できる。


%index
DrawThemeTextEx
ビジュアルスタイルで定義された色とフォントを用いてテキストを描画する。DrawThemeText を拡張し、追加のテキスト書式オプションを指定できるようにする。
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, pszText, cchText, dwTextFlags, pRect, pOptions
hTheme : [intptr] 型: HTHEME ウィンドウの指定されたテーマデータへのハンドル。HTHEME を作成するには OpenThemeData を使用する。
hdc : [intptr] 型: HDC 描画に使用する HDC。
iPartId : [int] 型: int 目的のテキスト外観を持つコントロールパート。Parts and States を参照。値が 0 の場合、テキストはデフォルトのフォント、またはデバイスコンテキストに選択されているフォントで描画される。
iStateId : [int] 型: int 目的のテキスト外観を持つコントロール状態。Parts and States を参照。
pszText : [wstr] 型: LPCWSTR 描画するテキストを含む文字列へのポインター。
cchText : [int] 型: int 描画する文字数を含む int 型の値。-1 に設定すると文字列内のすべての文字が描画される。
dwTextFlags : [int] 型: DWORD 文字列の書式設定を指定する 1 つ以上の値を含む DWORD。指定可能なパラメーター値については Format Values を参照。
pRect : [var] 型: LPRECT テキストを描画する論理座標での矩形を含む RECT 構造体へのポインター。
pOptions : [var] 型: const DTTOPTS* 描画されるテキストに適用される追加の書式設定オプションを定義する DTTOPTS 構造体。
%inst
ビジュアルスタイルで定義された色とフォントを用いてテキストを描画する。DrawThemeText
を拡張し、追加のテキスト書式オプションを指定できるようにする。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]

指定されたパートおよび状態に対してテーマフォントが定義されている場合、関数は常にそれを使用する。それ以外の場合は、デバイスコンテキストに現在選択されているフォントを使用する。テーマフォントが定義されているかどうかを調べるには、プロパティ識別子として
TMT_FONT を指定して GetThemeFont または GetThemePropertyOrigin を呼び出す。


%index
EnableThemeDialogTexture
ダイアログウィンドウ背景のビジュアルスタイルを有効または無効にする。
%group
Win32 uxtheme
%prm
hwnd, dwFlags
hwnd : [intptr] 型: HWND 対象ダイアログボックスのウィンドウハンドル。
dwFlags : [int] 型: DWORD 次のオプションフラグ値のいずれか:
%inst
ダイアログウィンドウ背景のビジュアルスタイルを有効または無効にする。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
EnableThemeDialogTexture
は、親ダイアログボックスとクライアント領域背景の描画を協調できるかどうかが異なる子ウィンドウやコントロールに対する、ダイアログボックスの互換性を調整するために使用できる。


%index
EnableTheming
Windows Vista から Windows 7: 現在のユーザーに対し、現在および以降のセッションでビジュアルスタイルを有効または無効にする。Windows 8 以降: この関数は何もしない。Windows 8 以降ではビジュアルスタイルは常に有効である。
%group
Win32 uxtheme
%prm
fEnable
fEnable : [int] 型: BOOL
%inst
Windows Vista から Windows 7:
現在のユーザーに対し、現在および以降のセッションでビジュアルスタイルを有効または無効にする。Windows 8 以降:
この関数は何もしない。Windows 8 以降ではビジュアルスタイルは常に有効である。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
EndBufferedAnimation
バッファ付きアニメーション操作の最初のフレームを描画し、アニメーションタイマーを開始する。
%group
Win32 uxtheme
%prm
hbpAnimation, fUpdateTarget
hbpAnimation : [int] 型: HANIMATIONBUFFER BeginBufferedAnimation が返したバッファ付きアニメーションコンテキストのハンドル。
fUpdateTarget : [int] 型: BOOL TRUE の場合、ターゲット DC をアニメーションで更新する。FALSE の場合、アニメーションは開始されず、ターゲット DC は更新されず、hbpAnimation パラメーターは解放される。
%inst
バッファ付きアニメーション操作の最初のフレームを描画し、アニメーションタイマーを開始する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
EndBufferedPaint
バッファ付き描画操作を完了し、関連するバッファ付き描画ハンドルを解放する。
%group
Win32 uxtheme
%prm
hBufferedPaint, fUpdateTarget
hBufferedPaint : [int] 型: HPAINTBUFFER BeginBufferedPaint で取得したバッファ付き描画コンテキストのハンドル。
fUpdateTarget : [int] 型: BOOL バッファをターゲット DC にコピーする場合は TRUE。
%inst
バッファ付き描画操作を完了し、関連するバッファ付き描画ハンドルを解放する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
EndPanningFeedback
BeginPanningFeedback と UpdatePanningFeedback によって設定または進行中であった既存のアニメーションを終了させる。
%group
Win32 uxtheme
%prm
hwnd, fAnimateBack
hwnd : [intptr] 型: HWND フィードバックを受け取るターゲットウィンドウのハンドル。
fAnimateBack : [int] 型: BOOL 変位したウィンドウをアニメーションを使用して元の位置に戻すかどうかを示すフラグ。FALSE の場合、メソッドは移動したウィンドウを直接ジャンプさせて復元する。
%inst
BeginPanningFeedback と UpdatePanningFeedback
によって設定または進行中であった既存のアニメーションを終了させる。

[戻り値]
型: BOOL 成功した場合は TRUE。

[備考]
この関数は BeginPanningFeedback の呼び出し後にのみ呼び出すことができる。


%index
GetBufferedPaintBits
バッファがデバイス独立ビットマップ (DIB) である場合に、バッファビットマップへのポインターを取得する。
%group
Win32 uxtheme
%prm
hBufferedPaint, ppbBuffer, pcxRow
hBufferedPaint : [int] 型: HPAINTBUFFER BeginBufferedPaint で取得したバッファ付き描画コンテキストのハンドル。
ppbBuffer : [var] 型: RGBQUAD** この関数から戻ったとき、バッファビットマップピクセルのアドレスへのポインターを保持する。
pcxRow : [var] 型: int* この関数から戻ったとき、バッファビットマップの幅 (ピクセル単位) へのポインターを保持する。この値はバッファ幅と必ずしも等しくなく、より大きいことがある。
%inst
バッファがデバイス独立ビットマップ (DIB) である場合に、バッファビットマップへのポインターを取得する。

[戻り値]
型: HRESULT 成功した場合は S_OK を返し、それ以外の場合はエラー値を返す。エラーが発生した場合、ppbBuffer は
NULL に、pcxRow は 0 に設定される。

[備考]
1 ピクセルあたりのビット数は、BeginBufferedPaint に渡されたピクセル形式に依存する。


%index
GetBufferedPaintDC
描画デバイスコンテキスト (DC) を取得する。これは BeginBufferedPaint が取得するのと同じ値である。
%group
Win32 uxtheme
%prm
hBufferedPaint
hBufferedPaint : [int] 型: HPAINTBUFFER BeginBufferedPaint で取得したバッファ付き描画コンテキストのハンドル。
%inst
描画デバイスコンテキスト (DC) を取得する。これは BeginBufferedPaint が取得するのと同じ値である。

[戻り値]
型: HDC 要求された DC のハンドル。これは BeginBufferedPaint が返すのと同じ DC である。失敗した場合は
NULL を返す。


%index
GetBufferedPaintTargetDC
ターゲットデバイスコンテキスト (DC) を取得する。
%group
Win32 uxtheme
%prm
hBufferedPaint
hBufferedPaint : [int] 型: HPAINTBUFFER BeginBufferedPaint で取得したバッファ付き描画コンテキストへのハンドル。
%inst
ターゲットデバイスコンテキスト (DC) を取得する。

[戻り値]
型: HDC 要求された DC へのハンドル。失敗した場合は NULL。

[備考]
成功した場合、この関数はアプリケーションが BeginBufferedPaint に渡したターゲット DC を返す。


%index
GetBufferedPaintTargetRect
BeginBufferedPaint で指定されたターゲット矩形を取得する。
%group
Win32 uxtheme
%prm
hBufferedPaint, prc
hBufferedPaint : [int] 型: HPAINTBUFFER BeginBufferedPaint で取得したバッファ付き描画コンテキストへのハンドル。
prc : [var] 型: RECT* この関数から戻ったとき、要求された矩形を保持する。
%inst
BeginBufferedPaint で指定されたターゲット矩形を取得する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
この関数が失敗した場合、prc にある RECT 構造体は空に設定される。


%index
GetCurrentThemeName
現在のビジュアルスタイルの名前を取得し、必要に応じてカラースキーム名とサイズ名も取得する。
%group
Win32 uxtheme
%prm
pszThemeFileName, cchMaxNameChars, pszColorBuff, cchMaxColorChars, pszSizeBuff, cchMaxSizeChars
pszThemeFileName : [wstr] 型: LPWSTR テーマのパスとファイル名を受け取る文字列へのポインター。
cchMaxNameChars : [int] 型: int テーマファイル名に許される最大文字数を含む int 型の値。
pszColorBuff : [wstr] 型: LPWSTR カラースキーム名を受け取る文字列へのポインター。このパラメーターは NULL に設定できる。
cchMaxColorChars : [int] 型: int カラースキーム名に許される最大文字数を含む int 型の値。
pszSizeBuff : [wstr] 型: LPWSTR サイズ名を受け取る文字列へのポインター。このパラメーターは NULL に設定できる。
cchMaxSizeChars : [int] 型: int サイズ名に許される最大文字数を含む int 型の値。
%inst
現在のビジュアルスタイルの名前を取得し、必要に応じてカラースキーム名とサイズ名も取得する。

[戻り値]
型: HRESULT 成功した場合は S_OK を返し、それ以外の場合はエラーコードを返す。


%index
GetThemeAnimationProperty
ストーリーボード ID とターゲット ID に基づいてテーマアニメーションプロパティを取得する。
%group
Win32 uxtheme
%prm
hTheme, iStoryboardId, iTargetId, eProperty, pvProperty, cbSize, pcbSizeOut
hTheme : [intptr] オープンされたテーマハンドル。
iStoryboardId : [int] 事前定義されたストーリーボード識別子。
iTargetId : [int] 事前定義されたターゲット識別子。
eProperty : [int] アニメーションのストーリーボードおよびターゲットに関連付けられるプロパティ。
pvProperty : [intptr] 返されるプロパティ値を受け取るバッファ。
cbSize : [int] pvProperty が指すバッファのバイトサイズ。
pcbSizeOut : [var] 返されるプロパティのバイトサイズ。
%inst
ストーリーボード ID とターゲット ID に基づいてテーマアニメーションプロパティを取得する。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
GetThemeAnimationTransform
ストーリーボード ID、ターゲット ID、および変換インデックスに基づいてアニメーション変換操作を取得する。
%group
Win32 uxtheme
%prm
hTheme, iStoryboardId, iTargetId, dwTransformIndex, pTransform, cbSize, pcbSizeOut
hTheme : [intptr] オープンされたテーマハンドル。
iStoryboardId : [int] 事前定義されたストーリーボード識別子。
iTargetId : [int] 事前定義されたターゲット識別子。
dwTransformIndex : [int] 変換操作のゼロベースのインデックス。
pTransform : [var] 変換構造体を受け取るバッファへのポインター。
cbSize : [int] pTransform が指すバッファのバイトサイズ。
pcbSizeOut : [var] 変換操作構造体のバイトサイズ。
%inst
ストーリーボード ID、ターゲット ID、および変換インデックスに基づいてアニメーション変換操作を取得する。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
GetThemeAppProperties
現在のアプリケーションでビジュアルスタイルがどのように適用されるかを制御するプロパティフラグを取得する。
%group
Win32 uxtheme
%prm

%inst
現在のアプリケーションでビジュアルスタイルがどのように適用されるかを制御するプロパティフラグを取得する。

[戻り値]
型: DWORD 次の戻り値は論理 OR で結合されたビットフラグである。
（以下省略）

[備考]
結果から個別のフラグを取り出すには、結果と目的のフラグの論理 AND を取る。DllMain
やグローバルオブジェクトのコンストラクターの中でこの関数を呼び出してはならない。無効な戻り値が返ることがある。


%index
GetThemeBackgroundContentRect
ビジュアルスタイルで定義された背景のコンテンツ領域のサイズを取得する。
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, pBoundingRect, pContentRect
hTheme : [intptr] 型: HTHEME ウィンドウの指定されたテーマデータへのハンドル。HTHEME を作成するには OpenThemeData を使用する。
hdc : [intptr] 型: HDC 描画時に使用する HDC。このパラメーターは NULL に設定できる。
iPartId : [int] 型: int コンテンツ領域を含むパートを指定する int 型の値。Parts and States を参照。
iStateId : [int] 型: int コンテンツ領域を含むパートの状態を指定する int 型の値。Parts and States を参照。
pBoundingRect : [var] 型: LPCRECT 論理座標系での背景全体の矩形を含む RECT 構造体へのポインター。これはボーダーやマージンの内側の領域である。
pContentRect : [var] 型: LPRECT 論理座標系でコンテンツ領域の背景矩形を受け取る RECT 構造体へのポインター。この矩形はコンテンツ領域に収まるように計算される。
%inst
ビジュアルスタイルで定義された背景のコンテンツ領域のサイズを取得する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]

ビジュアルスタイルは、各背景画像の中にコンテンツ領域を定義することができる。これは、テキストやアイコンなどのコンテンツを背景のボーダーを上書きせずに配置できる領域である。


%index
GetThemeBackgroundExtent
コンテンツ領域からビジュアルスタイルで定義された背景のサイズと位置を計算する。
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, pContentRect, pExtentRect
hTheme : [intptr] 型: HTHEME ウィンドウの指定されたテーマデータへのハンドル。HTHEME を作成するには OpenThemeData を使用する。
hdc : [intptr] 型: HDC 描画時に使用する HDC。このパラメーターは NULL に設定できる。
iPartId : [int] 型: int コンテンツを含むパートを指定する int 型の値。Parts and States を参照。
iStateId : [int] 型: int コンテンツを含むパートの状態を指定する int 型の値。Parts and States を参照。
pContentRect : [var] 型: LPCRECT 論理座標系でコンテンツ背景矩形を含む RECT 構造体へのポインター。この矩形は GetThemeBackgroundContentRect から返される。
pExtentRect : [var] 型: LPRECT 論理座標系で背景矩形を受け取る RECT 構造体へのポインター。この矩形は pContentRect に基づく。
%inst
コンテンツ領域からビジュアルスタイルで定義された背景のサイズと位置を計算する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]

テーマは、各背景画像の中にコンテンツ領域を定義することができる。これは、テキストやアイコンなどのコンテンツを背景のボーダーを上書きせずに配置できる領域である。


%index
GetThemeBackgroundRegion
指定された矩形で囲まれた、通常または部分的に透明な背景のリージョンを計算する。
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, pRect, pRegion
hTheme : [intptr] 型: HTHEME ウィンドウの指定されたテーマデータへのハンドル。HTHEME を作成するには OpenThemeData を使用する。
hdc : [intptr] 型: HDC 描画先の HDC。DC は dpi スケーリングを使用する。このパラメーターは NULL に設定できる。
iPartId : [int] 型: int リージョンを含むパートを指定する int 型の値。Parts and States を参照。
iStateId : [int] 型: int パートの状態を指定する int 型の値。Parts and States を参照。
pRect : [var] 型: LPCRECT リージョンを計算するために使用する論理座標系での指定矩形を含む RECT 構造体へのポインター。
pRegion : [intptr] 型: HRGN* 計算されたリージョンへのハンドルへのポインター。
%inst
指定された矩形で囲まれた、通常または部分的に透明な背景のリージョンを計算する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
この関数が返すリージョンハンドルは、不要になったときに DeleteObject を使用して解放する必要がある。


%index
GetThemeBitmap
特定のテーマ、パート、状態、およびプロパティに関連付けられたビットマップを取得する。
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId, iPropId, dwFlags, phBitmap
hTheme : [intptr] 型: HTHEME テーマデータへのハンドル。
iPartId : [int] 型: int ビットマップを含むパート。Parts and States を参照。
iStateId : [int] 型: int パートの状態。
iPropId : [int] 型: int 取得するプロパティ。このパートと状態に対して最初に利用可能なビットマップを自動的に選択するには 0 を渡す。
dwFlags : [int] 型: ULONG
phBitmap : [intptr] 型: HBITMAP* 要求されたビットマップへのハンドルを受け取るポインター。
%inst
特定のテーマ、パート、状態、およびプロパティに関連付けられたビットマップを取得する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
dwFlags が GBF_COPY に設定されている場合、phBitmap に格納されたビットマップは不要になったときに
DeleteObject を呼び出して解放する。


%index
GetThemeBool
テーマデータの SysMetrics セクションから BOOL プロパティの値を取得する。
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId, iPropId, pfVal
hTheme : [intptr] 型: HTHEME ウィンドウの指定されたテーマデータへのハンドル。HTHEME を作成するには OpenThemeData を使用する。
iPartId : [int] 型: int BOOL プロパティを含むパートを指定する int 型の値。Parts and States を参照。
iStateId : [int] 型: int パートの状態を指定する int 型の値。Parts and States を参照。
iPropId : [int] 型: int
pfVal : [var] 型: BOOL* 取得したプロパティ値を受け取る BOOL へのポインター。
%inst
テーマデータの SysMetrics セクションから BOOL プロパティの値を取得する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
GetThemeColor
カラープロパティの値を取得する。
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId, iPropId, pColor
hTheme : [intptr] 型: HTHEME ウィンドウのテーマデータへのハンドル。OpenThemeData で HTHEME を作成する。
iPartId : [int] 型: int カラープロパティを含むパートを指定する int 値。
iStateId : [int] 型: int パートの状態を指定する int 値。
iPropId : [int] 型: int 取得するプロパティを指定する int 値。Property Identifiers 参照。
pColor : [var] 型: COLORREF* 色値を受け取る COLORREF 構造体へのポインタ。
%inst
カラープロパティの値を取得する。

[戻り値]
型: HRESULT 成功時は S_OK、失敗時は HRESULT エラーコードを返す。


%index
GetThemeDocumentationProperty
指定されたテーマファイルのドキュメンテーションセクションからテーマプロパティの値を取得する。
%group
Win32 uxtheme
%prm
pszThemeName, pszPropertyName, pszValueBuff, cchMaxValChars
pszThemeName : [wstr] 型: LPCWSTR プロパティを問い合わせるために開くテーマファイルの名前を含む文字列へのポインター。
pszPropertyName : [wstr] 型: LPCWSTR
pszValueBuff : [wstr] 型: LPWSTR プロパティの文字列値を受け取る文字列バッファへのポインター。
cchMaxValChars : [int] 型: int pszValueBuff に格納できる最大文字数を指定する int 型の値。
%inst
指定されたテーマファイルのドキュメンテーションセクションからテーマプロパティの値を取得する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
テーマファイルの文字列テーブルでテーマプロパティがローカライズされている場合、この関数はローカライズ済みのバージョンを返す。


%index
GetThemeEnumValue
列挙型プロパティの値を取得する。
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId, iPropId, piVal
hTheme : [intptr] 型: HTHEME ウィンドウの指定されたテーマデータへのハンドル。HTHEME を作成するには OpenThemeData を使用する。
iPartId : [int] 型: int 列挙型プロパティを含むパートを指定する int 型の値。Parts and States を参照。
iStateId : [int] 型: int パートの状態を指定する int 型の値。Parts and States を参照。
iPropId : [int] 型: int 取得するプロパティを指定する int 型の値。指定可能な値の一覧は Property Identifiers を参照。
piVal : [var] 型: int* 列挙型の値を受け取る int へのポインター。
%inst
列挙型プロパティの値を取得する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
GetThemeFilename
ファイル名プロパティの値を取得する。
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId, iPropId, pszThemeFileName, cchMaxBuffChars
hTheme : [intptr] 型: HTHEME ウィンドウの指定されたテーマデータへのハンドル。HTHEME を作成するには OpenThemeData を使用する。
iPartId : [int] 型: int ファイル名プロパティを含むパートを指定する int 型の値。Parts and States を参照。
iStateId : [int] 型: int パートの状態を指定する int 型の値。Parts and States を参照。
iPropId : [int] 型: int 取得するプロパティを指定する int 型の値。指定可能な値の一覧は Property Identifiers を参照。
pszThemeFileName : [wstr] 型: LPWSTR 取得したファイル名を受け取るバッファへのポインター。
cchMaxBuffChars : [int] 型: int ファイル名の最大文字数を受け取る int 型の値。
%inst
ファイル名プロパティの値を取得する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
GetThemeFont
フォントプロパティの値を取得する。
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, iPropId, pFont
hTheme : [intptr] 型: HTHEME ウィンドウの指定されたテーマデータへのハンドル。HTHEME を作成するには OpenThemeData を使用する。
hdc : [intptr] 型: HDC HDC。このパラメーターは NULL に設定できる。
iPartId : [int] 型: int フォントプロパティを含むパートを指定する int 型の値。Parts and States を参照。
iStateId : [int] 型: int パートの状態を指定する int 型の値。Parts and States を参照。
iPropId : [int] 型: int 取得するプロパティを指定する int 型の値。指定可能な値の一覧は Property Identifiers を参照。
pFont : [var] 型: LOGFONTW* フォントプロパティ値を受け取る LOGFONT 構造体へのポインター。
%inst
フォントプロパティの値を取得する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
フォントは現在の論理画面に対して dpi
単位でスケーリングされる。指定されたパートおよび状態に対してプロパティがサポートされていない場合は
E_PROP_ID_UNSUPPORTED が返されることがある。


%index
GetThemeInt
int プロパティの値を取得する。
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId, iPropId, piVal
hTheme : [intptr] 型: HTHEME ウィンドウの指定されたテーマデータへのハンドル。HTHEME を作成するには OpenThemeData を使用する。
iPartId : [int] 型: int int プロパティを含むパートを指定する int 型の値。Parts and States を参照。
iStateId : [int] 型: int パートの状態を指定する int 型の値。Parts and States を参照。
iPropId : [int] 型: int 取得するプロパティを指定する int 型の値。指定可能な値の一覧は Property Identifiers を参照。
piVal : [var] 型: int* 取得した値を受け取る int へのポインター。
%inst
int プロパティの値を取得する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
GetThemeIntList
ビジュアルスタイルから int データのリストを取得する。
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId, iPropId, pIntList
hTheme : [intptr] 型: HTHEME ウィンドウの指定されたテーマデータへのハンドル。HTHEME を作成するには OpenThemeData を使用する。
iPartId : [int] 型: int 返されるデータのリストを含むパートを指定する int 型の値。Parts and States を参照。
iStateId : [int] 型: int パートの状態を指定する int 型の値。Parts and States を参照。
iPropId : [int] 型: int 取得するプロパティを指定する int 型の値。Property Identifiers を参照。
pIntList : [var] 型: INTLIST* int データを受け取る INTLIST 構造体へのポインター。
%inst
ビジュアルスタイルから int データのリストを取得する。

[戻り値]
型: HRESULT 成功した場合は S_OK を返し、それ以外の場合はエラーコードを返す。


%index
GetThemeMargins
MARGINS プロパティの値を取得する。
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, iPropId, prc, pMargins
hTheme : [intptr] 型: HTHEME ウィンドウの指定されたテーマデータへのハンドル。HTHEME を作成するには OpenThemeData を使用する。
hdc : [intptr] 型: HDC フォントを選択する HDC。このパラメーターは NULL に設定できる。
iPartId : [int] 型: int MARGINS プロパティを含むパートを指定する int 型の値。Parts and States を参照。
iStateId : [int] 型: int パートの状態を指定する int 型の値。Parts and States を参照。
iPropId : [int] 型: int 取得するプロパティを指定する int 型の値。指定可能な値の一覧は Property Identifiers を参照。
prc : [var] 型: LPRECT 描画先の領域を指定する矩形を含む RECT 構造体へのポインター。このパラメーターは NULL に設定できる。
pMargins : [var] 型: MARGINS* 取得した値を受け取る MARGINS 構造体へのポインター。
%inst
MARGINS プロパティの値を取得する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
GetThemeMetric
メトリックプロパティの値を取得する。
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, iPropId, piVal
hTheme : [intptr] 型: HTHEME ウィンドウの指定されたテーマデータへのハンドル。HTHEME を作成するには OpenThemeData を使用する。
hdc : [intptr] 型: HDC HDC。このパラメーターは NULL に設定できる。
iPartId : [int] 型: int メトリックプロパティを含むパートを指定する int 型の値。Parts and States を参照。
iStateId : [int] 型: int パートの状態を指定する int 型の値。Parts and States を参照。
iPropId : [int] 型: int
piVal : [var] 型: int* メトリックプロパティ値を受け取る int へのポインター。
%inst
メトリックプロパティの値を取得する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
GetThemePartSize
ビジュアルスタイルで定義されたパートの元サイズを計算する。
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, prc, eSize, psz
hTheme : [intptr] 型: HTHEME ウィンドウのテーマデータへのハンドル。OpenThemeData で HTHEME を作成する。
hdc : [intptr] 型: HDC フォントを選択する HDC。
iPartId : [int] 型: int サイズ計算対象のパートを指定する int 値。
iStateId : [int] 型: int パートの状態を指定する int 値。
prc : [var] 型: LPCRECT パート描画先矩形を含む RECT 構造体へのポインタ。NULL 可。
eSize : [int] 
psz : [var] 型: SIZE* 指定パートの寸法を受け取る SIZE 構造体へのポインタ。
%inst
ビジュアルスタイルで定義されたパートの元サイズを計算する。

[戻り値]
型: HRESULT 成功時は S_OK、失敗時は HRESULT エラーコードを返す。


%index
GetThemePosition
位置プロパティの値を取得する。
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId, iPropId, pPoint
hTheme : [intptr] 型: HTHEME ウィンドウの指定されたテーマデータへのハンドル。HTHEME を作成するには OpenThemeData を使用する。
iPartId : [int] 型: int 位置プロパティを含むパートを指定する int 型の値。Parts and States を参照。
iStateId : [int] 型: int パートの状態を指定する int 型の値。Parts and States を参照。
iPropId : [int] 型: int 取得するプロパティを指定する int 型の値。指定可能な値の一覧は Property Identifiers を参照。
pPoint : [var] 型: POINT* 位置の値を受け取る POINT 構造体へのポインター。
%inst
位置プロパティの値を取得する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]

位置が含まれるパートによって、指定可能な状態値が決まる。たとえば、位置がチェックボックス内であれば、状態はチェック済みまたは未チェックとなるが、キャプション内であれば、可能な状態はアクティブ、非アクティブ、または無効である。


%index
GetThemePropertyOrigin
プロパティに対するテーマプロパティ定義の場所を取得する。
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId, iPropId, pOrigin
hTheme : [intptr] 型: HTHEME ウィンドウの指定されたテーマデータへのハンドル。HTHEME を作成するには OpenThemeData を使用する。
iPartId : [int] 型: int テーマを含むパートを指定する int 型の値。Parts and States を参照。
iStateId : [int] 型: int パートの状態を指定する int 型の値。Parts and States を参照。
iPropId : [int] 型: int 取得するプロパティを指定する int 型の値。Vssym32.h のプロパティ値を使用できる。これらの値は、それを使用する関数のリファレンスページで説明されている。たとえば、GetThemeInt 関数は TMT_BORDERSIZE の値を使用する。関数の一覧は Visual Styles Reference を参照。
pOrigin : [var] 
%inst
プロパティに対するテーマプロパティ定義の場所を取得する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
GetThemeRect
RECT プロパティの値を取得する。
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId, iPropId, pRect
hTheme : [intptr] 型: HTHEME ウィンドウの指定されたテーマデータへのハンドル。HTHEME を作成するには OpenThemeData を使用する。
iPartId : [int] 型: int RECT プロパティを含むパートを指定する int 型の値。Parts and States を参照。
iStateId : [int] 型: int パートの状態を指定する int 型の値。Parts and States を参照。
iPropId : [int] 型: int 取得するプロパティを指定する int 型の値。指定可能な値の一覧は Property Identifiers を参照。
pRect : [var] 型: LPRECT 矩形を受け取る RECT 構造体へのポインター。
%inst
RECT プロパティの値を取得する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
GetThemeStream
指定されたテーマに対応するデータストリームを、指定されたパート、状態、およびプロパティから取得する。
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId, iPropId, ppvStream, pcbStream, hInst
hTheme : [intptr] 型: HTHEME ストリームを取得するテーマへのハンドル。
iPartId : [int] 型: int ストリームを取得するパートを指定する。Parts and States を参照。
iStateId : [int] 型: int パートの状態を指定する。
iPropId : [int] 型: int 取得するプロパティを指定する。
ppvStream : [var] 型: VOID** ストリームを受け取るポインターのアドレス。
pcbStream : [var] 型: DWORD* ppvStream で受け取るストリームのバイト単位の長さを受け取るポインター。
hInst : [intptr] 型: HINSTANCE iPropId が TMT_STREAM の場合、この値は NULL である。iPropId が TMT_DISKSTREAM の場合、この値はロード済みスタイルファイルの HINSTANCE である。
%inst
指定されたテーマに対応するデータストリームを、指定されたパート、状態、およびプロパティから取得する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
Windows 8: ハイコントラストモードでは、この関数で取得したデータストリームは、hTheme
テーマハンドルが閉じられた後では有効でない。
この関数で取得したデータストリームはコピーではない。使用後にデータストリームを削除またはクローズしてはならない。


%index
GetThemeString
文字列プロパティの値を取得する。
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId, iPropId, pszBuff, cchMaxBuffChars
hTheme : [intptr] 型: HTHEME ウィンドウの指定されたテーマデータへのハンドル。HTHEME を作成するには OpenThemeData を使用する。
iPartId : [int] 型: int 文字列プロパティを含むパートを指定する int 型の値。Parts and States を参照。
iStateId : [int] 型: int パートの状態を指定する int 型の値。Parts and States を参照。
iPropId : [int] 型: int 取得するプロパティを指定する int 型の値。指定可能な値の一覧は Property Identifiers を参照。
pszBuff : [wstr] 型: LPWSTR 文字列値を受け取るバッファへのポインター。
cchMaxBuffChars : [int] 型: int pszBuff に格納できる最大文字数を指定する int 型の値。
%inst
文字列プロパティの値を取得する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
GetThemeSysBool
システムメトリックのブール値を取得する。
%group
Win32 uxtheme
%prm
hTheme, iBoolId
hTheme : [intptr] 型: HTHEME テーマデータへのハンドル。
iBoolId : [int] 型: int 取得するシステムブールメトリックを指定する int 型の値。次の値を指定できる。
%inst
システムメトリックのブール値を取得する。

[戻り値]
型: BOOL 目的のシステムメトリックの値。

[備考]
テーマデータハンドルが NULL ハンドルでない場合、この関数はビジュアルスタイルの SysMetrics セクションから目的の BOOL
を返す。テーマデータハンドルが NULL の場合、この関数は指定されたシステムブール値を返す。


%index
GetThemeSysColor
システム色の値を取得する。
%group
Win32 uxtheme
%prm
hTheme, iColorId
hTheme : [intptr] 型: HTHEME テーマデータへのハンドル。
iColorId : [int] 型: int 色番号を指定する int 型の値。GetSysColor の nIndex パラメーターに記載されている値のいずれかを指定できる。
%inst
システム色の値を取得する。

[戻り値]
型: COLORREF 指定されたシステム色の値。

[備考]
テーマデータハンドルが NULL ハンドルでない場合、この関数は現在のビジュアルスタイルの SysMetrics
セクションから色を返す。テーマデータハンドルが NULL の場合、この関数はグローバルシステム色に一致する色を返す。


%index
GetThemeSysColorBrush
システム色のブラシを取得する。
%group
Win32 uxtheme
%prm
hTheme, iColorId
hTheme : [intptr] 型: HTHEME テーマデータへのハンドル。
iColorId : [int] 型: int
%inst
システム色のブラシを取得する。

[戻り値]
型: HBRUSH ブラシデータへのハンドル。

[備考]
テーマデータハンドルが NULL ハンドルでない場合、GetThemeSysColorBrush はビジュアルスタイルの
SysMetrics セクションから指定された色に一致するブラシを返す。テーマデータハンドルが NULL
の場合、関数はグローバルシステム色に一致するブラシを返す。
この関数が返すブラシハンドルは、不要になったときに DeleteObject を使用して解放する必要がある。


%index
GetThemeSysFont
システムフォントの LOGFONT を取得する。
%group
Win32 uxtheme
%prm
hTheme, iFontId, plf
hTheme : [intptr] 型: HTHEME テーマデータへのハンドル。
iFontId : [int] 型: int
plf : [var] 型: LOGFONTW* この関数からのフォント情報を受け取る LOGFONT 構造体へのポインター。
%inst
システムフォントの LOGFONT を取得する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
この関数には vssym32.h と uxtheme.h が必要である。テーマデータハンドルが NULL
ハンドルでない場合、この関数はビジュアルスタイルの SysMetrics セクションから目的の LOGFONT
を返す。テーマデータハンドルが NULL の場合、関数は同じ種類のグローバルシステムメトリック値を返す。フォントは現在の論理画面に対して
dpi 単位でスケーリングされる。


%index
GetThemeSysInt
システム int の値を取得する。
%group
Win32 uxtheme
%prm
hTheme, iIntId, piValue
hTheme : [intptr] 型: HTHEME テーマデータへのハンドル。
iIntId : [int] 型: int 取得するシステム int を指定する int 型の値。次の値を指定できる。
piValue : [var] 型: int* システム整数値を受け取る int へのポインター。
%inst
システム int の値を取得する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
GetThemeSysSize
テーマデータからシステムサイズメトリックの値を取得する。
%group
Win32 uxtheme
%prm
hTheme, iSizeId
hTheme : [intptr] 型: HTHEME テーマデータへのハンドル。
iSizeId : [int] 型: int 取得するシステムサイズメトリックを指定する int 型の値。次の値が有効である:
%inst
テーマデータからシステムサイズメトリックの値を取得する。

[戻り値]
型: int サイズをピクセル単位で返す。

[備考]
hTheme が NULL でない場合、この関数は現在のビジュアルスタイル (ビジュアルスタイルの SysMetrics セクション)
に格納されているサイズを、現在の画面 dpi にスケーリングして返す。hTheme が NULL
の場合、この関数はピクセル単位のグローバルシステムメトリックを返す。アプリケーションが dpi 対応としてマークされている場合のみ、現在の
dpi にスケーリングされる。それ以外の場合は、スケーリングされていないピクセル値が返される。


%index
GetThemeSysString
システム文字列の値を取得する。
%group
Win32 uxtheme
%prm
hTheme, iStringId, pszStringBuff, cchMaxStringChars
hTheme : [intptr] 型: HTHEME テーマデータへのハンドル。
iStringId : [int] 型: int
pszStringBuff : [wstr] 型: LPWSTR この関数から文字列値を受け取るバッファへのポインター。
cchMaxStringChars : [int] 型: int 文字列バッファに格納できる最大文字数を指定する int 型の値。
%inst
システム文字列の値を取得する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
テーマデータハンドルが NULL ハンドルでない場合、この関数はビジュアルスタイルの SysMetrics
セクションから目的の文字列を返す。テーマデータハンドルが NULL の場合、この関数は同じ種類のグローバルシステムメトリック値を返す。


%index
GetThemeTextExtent
ビジュアルスタイルのフォントでレンダリングしたときの、指定されたテキストのサイズと位置を計算する。
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, pszText, cchCharCount, dwTextFlags, pBoundingRect, pExtentRect
hTheme : [intptr] 型: HTHEME ウィンドウの指定されたテーマデータへのハンドル。HTHEME を作成するには OpenThemeData を使用する。
hdc : [intptr] 型: HDC フォントを選択する HDC。
iPartId : [int] 型: int テキストを描画するパートを指定する int 型の値。Parts and States を参照。
iStateId : [int] 型: int パートの状態を指定する int 型の値。Parts and States を参照。
pszText : [wstr] 型: LPCWSTR 描画するテキストを含む文字列へのポインター。
cchCharCount : [int] 型: int 描画する文字数を含む int 型の値。-1 に設定すると文字列内のすべての文字が描画される。
dwTextFlags : [int] 型: DWORD 文字列の書式設定を指定する 1 つ以上の値を含む DWORD。指定可能なパラメーター値については Format Values を参照。
pBoundingRect : [var] 型: LPCRECT テキストのレイアウトを制御するために使用される矩形を含む RECT 構造体へのポインター。このパラメーターは NULL に設定できる。
pExtentRect : [var] 型: LPRECT レンダリングされたテキストを収めるために必要な論理座標系での矩形を含む RECT 構造体へのポインター。
%inst
ビジュアルスタイルのフォントでレンダリングしたときの、指定されたテキストのサイズと位置を計算する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
GetThemeTextMetrics
特定のパートに対してビジュアルスタイルが指定するフォントについての情報を取得する。
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, ptm
hTheme : [intptr] 型: HTHEME ウィンドウの指定されたテーマデータへのハンドル。HTHEME を作成するには OpenThemeData を使用する。
hdc : [intptr] 型: HDC スクリーンコンテキストに使用する HDC。このパラメーターは NULL に設定できる。
iPartId : [int] 型: int フォント情報を取得するパートを指定する int 型の値。Parts and States を参照。
iStateId : [int] 型: int パートの状態を指定する int 型の値。Parts and States を参照。
ptm : [var] 型: TEXTMETRIC* フォント情報を受け取る。
%inst
特定のパートに対してビジュアルスタイルが指定するフォントについての情報を取得する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
GetThemeTimingFunction
タイミング関数識別子に基づいて事前定義されたタイミング関数を取得する。
%group
Win32 uxtheme
%prm
hTheme, iTimingFunctionId, pTimingFunction, cbSize, pcbSizeOut
hTheme : [intptr] オープンされたテーマハンドル。
iTimingFunctionId : [int] タイミング関数識別子。
pTimingFunction : [var] 事前定義されたタイミング関数ポインターを受け取るバッファ。
cbSize : [int] pTimingFunction が指すバッファのバイトサイズ。
pcbSizeOut : [var] タイミング関数構造体のバイトサイズ。
%inst
タイミング関数識別子に基づいて事前定義されたタイミング関数を取得する。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
GetThemeTransitionDuration
指定された遷移の期間を取得する。
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateIdFrom, iStateIdTo, iPropId, pdwDuration
hTheme : [intptr] 型: HTHEME テーマデータのハンドル。
iPartId : [int] 型: int パートの ID。
iStateIdFrom : [int] 型: int 遷移前のパートの状態 ID。
iStateIdTo : [int] 型: int 遷移後のパートの状態 ID。
iPropId : [int] 型: int プロパティ ID。
pdwDuration : [var] 型: DWORD* 遷移期間 (ミリ秒単位) を受け取る変数のアドレス。
%inst
指定された遷移の期間を取得する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
GetWindowTheme
ビジュアルスタイルが適用されたウィンドウへのテーマハンドルを取得する。
%group
Win32 uxtheme
%prm
hwnd
hwnd : [intptr] 型: HWND ウィンドウのハンドル。
%inst
ビジュアルスタイルが適用されたウィンドウへのテーマハンドルを取得する。

[戻り値]
型: HTHEME OpenThemeData から返された最新のテーマハンドル。

[備考]
ウィンドウにビジュアルスタイルが適用されている場合、GetWindowTheme 関数は OpenThemeData
から返された最新のテーマハンドルを返す。ビジュアルスタイルが適用されていない場合、GetWindowTheme は NULL を返す。


%index
HitTestThemeBackground
ビジュアルスタイルで指定された背景内のポイントに対してヒットテストコードを取得する。
%group
Win32 uxtheme
%prm
hTheme, hdc, iPartId, iStateId, dwOptions, pRect, hrgn, ptTest, pwHitTestCode
hTheme : [intptr] 型: HTHEME ウィンドウの指定されたテーマデータへのハンドル。HTHEME を作成するには OpenThemeData を使用する。
hdc : [intptr] 型: HDC 描画時に使用する HDC。このパラメーターは NULL に設定できる。
iPartId : [int] 型: int パートを指定する int 型の値。Parts and States を参照。
iStateId : [int] 型: int パートの状態を指定する int 型の値。Parts and States を参照。
dwOptions : [int] 型: DWORD ヒットテストオプションを指定する DWORD。オプションの一覧は Hit Test Options を参照。
pRect : [var] 型: LPCRECT 背景の境界を表す論理座標系での矩形を含む RECT 構造体へのポインター。
hrgn : [intptr] 型: HRGN ヒットテスト領域の境界を指定するために使用できるリージョンへのハンドル。このパラメーターは NULL に設定できる。
ptTest : [int] 型: POINT
pwHitTestCode : [var] 型: WORD* ptTest のポイントが pRect または hrgn で囲まれた背景領域内にあるかどうかを示すヒットテストコードを受け取る WORD。返される値の一覧は Hit Test Return Values を参照。
%inst
ビジュアルスタイルで指定された背景内のポイントに対してヒットテストコードを取得する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
ptTest と pRect の値は、クライアントやスクリーンなど同じ座標系で指定する必要がある。hrgn
パラメーターを使用する場合は、pRect および ptTest と同じ座標系で指定する必要がある。


%index
IsAppThemed
現在のアプリケーションの UI がビジュアルスタイルで表示されているかを返す。
%group
Win32 uxtheme
%prm

%inst
現在のアプリケーションの UI がビジュアルスタイルで表示されているかを返す。

[戻り値]
型: BOOL 以下のいずれかの値を返す。
（以下省略）

[備考]
Windows 8
より前ではコントロールパネルからビジュアルスタイルをオフにできたため、アプリがビジュアルスタイル対応でもその時点では適用されていないことがあった。Windows
8 ではオフにできない。
DllMain やグローバルオブジェクトのコンストラクタ内で呼んではならない。戻り値が不正になる可能性がある。


%index
IsCompositionActive
デスクトップウィンドウマネージャー (DWM) のコンポジション効果がテーマで利用可能かどうかを判定する。
%group
Win32 uxtheme
%prm

%inst
デスクトップウィンドウマネージャー (DWM) のコンポジション効果がテーマで利用可能かどうかを判定する。

[戻り値]
型: BOOL コンポジション効果が利用可能な場合は TRUE、それ以外の場合は FALSE。

[備考]
コンポジション効果は DWM によって提供される。この関数はまず DWM
がアクティブかどうかを判定し、次にコンポジション効果が有効かどうかを確認する。


%index
IsThemeActive
現在のアプリに対してビジュアルスタイルが有効かを調べる。
%group
Win32 uxtheme
%prm

%inst
現在のアプリに対してビジュアルスタイルが有効かを調べる。

[戻り値]
型: BOOL 以下のいずれかの値を返す。
（以下省略）

[備考]
DllMain やグローバルオブジェクトのコンストラクタ内で呼んではならない。戻り値が不正になる可能性がある。


%index
IsThemeBackgroundPartiallyTransparent
ビジュアルスタイルで指定された背景に透明部分またはアルファブレンド部分が含まれているかどうかを取得する。
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId
hTheme : [intptr] 型: HTHEME ウィンドウの指定されたテーマデータへのハンドル。HTHEME を作成するには OpenThemeData を使用する。
iPartId : [int] 型: int パートを指定する int 型の値。Parts and States を参照。
iStateId : [int] 型: int パートの状態を指定する int 型の値。Parts and States を参照。
%inst
ビジュアルスタイルで指定された背景に透明部分またはアルファブレンド部分が含まれているかどうかを取得する。

[戻り値]
型: BOOL 次のいずれかの値を返す。
（以下省略）


%index
IsThemeDialogTextureEnabled
指定されたダイアログウィンドウが背景テクスチャリングをサポートしているかどうかを報告する。
%group
Win32 uxtheme
%prm
hwnd
hwnd : [intptr] 型: HWND ダイアログウィンドウを指定する HWND 値。
%inst
指定されたダイアログウィンドウが背景テクスチャリングをサポートしているかどうかを報告する。

[戻り値]
型: BOOL 次のいずれかの値を返す。
（以下省略）


%index
IsThemePartDefined
ビジュアルスタイルが指定されたパートおよび状態に対するパラメーターを定義しているかどうかを取得する。
%group
Win32 uxtheme
%prm
hTheme, iPartId, iStateId
hTheme : [intptr] 型: HTHEME ウィンドウの指定されたテーマデータへのハンドル。HTHEME を作成するには OpenThemeData を使用する。
iPartId : [int] 型: int パートを指定する int 型の値。Parts and States を参照。
iStateId : [int] 型: int 現在は使用されない。値は 0 でなければならない。
%inst
ビジュアルスタイルが指定されたパートおよび状態に対するパラメーターを定義しているかどうかを取得する。

[戻り値]
型: BOOL 次のいずれかの値を返す。
（以下省略）


%index
OpenThemeData
ウィンドウと関連クラスに対するテーマデータを開く。
%group
Win32 uxtheme
%prm
hwnd, pszClassList
hwnd : [intptr] 型: HWND テーマデータを必要とするウィンドウのハンドル。
pszClassList : [wstr] 型: LPCWSTR セミコロン区切りのクラスリストを含む文字列へのポインタ。
%inst
ウィンドウと関連クラスに対するテーマデータを開く。

[戻り値]
型: HTHEME OpenThemeData は各クラスを順にアクティブテーマのクラスデータセクションと照合する。一致が見つかれば
HTHEME を返し、なければ NULL を返す。

[備考]
pszClassList は単一名ではなくリストで、クラスと現在のビジュアルスタイルの最適マッチを得る機会を与える。例: ID_OK
のボタンなら L"OkButton;Button" を渡すと、OkButton エントリがあればそれが使われる。Aero
テーマのクラス名は AeroStyle.xml で定義されている。


%index
OpenThemeDataEx
指定されたテーマクラスに対するウィンドウに関連付けられたテーマデータを開く。
%group
Win32 uxtheme
%prm
hwnd, pszClassList, dwFlags
hwnd : [intptr] 型: HWND テーマを取得するウィンドウまたはコントロールへのハンドル。
pszClassList : [wstr] 型: LPCWSTR 一致させるクラス名をセミコロンで区切ったリスト。
dwFlags : [int] 型: DWORD
%inst
指定されたテーマクラスに対するウィンドウに関連付けられたテーマデータを開く。

[戻り値]
型: HTHEME 一致が見つかった場合は、テーマへの有効なハンドルが返される。それ以外の場合は NULL 値が返される。

[備考]
pszClassIdList で指定された文字列はセミコロンを区切り文字としてトークン化される。クラス名は 1
トークンずつ照合される。あるトークンに一致するものが見つからない場合は、次のトークンが照合される。一致が見つかった場合、関数の戻り値は一致したクラスに関連付けられたテーマハンドルとなる。Aero
テーマのクラス名は AeroStyle.xml で定義されている。


%index
OpenThemeDataForDpi
特定の DPI に関連付けられたテーマハンドルを開く OpenThemeData の派生関数。
%group
Win32 uxtheme
%prm
hwnd, pszClassList, dpi
hwnd : [intptr] テーマデータが必要なウィンドウのハンドル。
pszClassList : [wstr] セミコロンで区切られたクラスのリストを含む文字列へのポインター。
dpi : [int] テーマハンドルに関連付ける指定された DPI 値。この値が接続されているモニターに対応する値の集合外である場合、関数はエラーを返す。
%inst
特定の DPI に関連付けられたテーマハンドルを開く OpenThemeData の派生関数。

[戻り値]
OpenThemeData を参照。

[備考]
OpenThemeData は、Per Monitor v2 ウィンドウとともに使用された場合に、ウィンドウの DPI
に関連付けられたテーマハンドルを作成する。OpenThemeDataForDpi は、その DPI
のウィンドウを持っていない場合に、特定の DPI に対するテーマハンドルを開けるようにする。要求された DPI
値が現在接続されているディスプレイに対応していない場合、返されるテーマハンドルの動作は不定となる。テーマシステムは、現在接続されているディスプレイに対応する
DPI
値の集合に対してのみテーマアセットをロードする。テーマハンドルは、システムがテーマデータを再ロードするたびに無効となる。アプリケーションは
WM_THEMECHANGED を監視し、それに応じてすべてのテーマハンドルを閉じて再オープンする必要がある。この動作は、ハンドルが
OpenThemeData で開かれたか OpenThemeDataForDpi で開かれたかにかかわらず同じである。


%index
SetThemeAppProperties
呼び出し元のアプリケーションでビジュアルスタイルがどのように実装されるかを決定するフラグを設定する。
%group
Win32 uxtheme
%prm
dwFlags
dwFlags : [int] 型: DWORD 論理 OR で結合できる、次のビットフラグの 1 つ以上を指定する DWORD。
%inst
呼び出し元のアプリケーションでビジュアルスタイルがどのように実装されるかを決定するフラグを設定する。

[備考]
フラグを設定した後、変更を有効にするためにアプリケーションのメインウィンドウへ WM_THEMECHANGED メッセージを送信する。


%index
SetWindowTheme
ウィンドウがクラスで通常使用されるのとは異なるビジュアルスタイル情報を使うようにする。
%group
Win32 uxtheme
%prm
hwnd, pszSubAppName, pszSubIdList
hwnd : [intptr] 型: HWND ビジュアルスタイルを変更するウィンドウのハンドル。
pszSubAppName : [wstr] 型: LPCWSTR 呼び出し元アプリ名の代わりに使うアプリ名文字列へのポインタ。NULL の場合は呼び出し元アプリ名を使う。
pszSubIdList : [wstr] 型: LPCWSTR ウィンドウクラスが渡す実リストの代わりに使う、セミコロン区切りの CLSID 名リスト。NULL の場合はクラスからの ID リストを使う。
%inst
ウィンドウがクラスで通常使用されるのとは異なるビジュアルスタイル情報を使うようにする。

[戻り値]
型: HRESULT 成功時は S_OK、失敗時は HRESULT エラーコードを返す。

[備考]
テーママネージャはウィンドウの生存期間中、pszSubAppName と pszSubIdList
の関連付けを保持する(ビジュアルスタイルが変わっても)。SetWindowTheme 呼び出し完了時、ウィンドウに
WM_THEMECHANGED が送信されて新しいビジュアルスタイルが適用される。
pszSubAppName と pszSubIdList の両方が NULL の場合、テーママネージャは以前の関連付けを削除する。空文字列
(L" ") を指定するとどのセクションにも一致しないためビジュアルスタイルの適用を回避できる。


%index
SetWindowThemeAttribute
指定されたウィンドウにビジュアルスタイルがどのように適用されるかを制御する属性を設定する。
%group
Win32 uxtheme
%prm
hwnd, eAttribute, pvAttribute, cbAttribute
hwnd : [intptr] 型: HWND 変更を適用するウィンドウへのハンドル。
eAttribute : [int] 
pvAttribute : [intptr] 型: PVOID 設定する属性を指定するポインター。型は eAttribute 値によって決まる。
cbAttribute : [int] 型: DWORD pvAttribute が指すデータのバイトサイズを指定する。
%inst
指定されたウィンドウにビジュアルスタイルがどのように適用されるかを制御する属性を設定する。

[戻り値]
型: HRESULT 関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
UpdatePanningFeedback
パンジェスチャーの結果としてのウィンドウの状態についてクライアントを更新する。この関数は BeginPanningFeedback の呼び出し後にのみ呼び出すことができる。
%group
Win32 uxtheme
%prm
hwnd, lTotalOverpanOffsetX, lTotalOverpanOffsetY, fInInertia
hwnd : [intptr] 型: HWND フィードバックを受け取るターゲットウィンドウのハンドル。メソッドが成功するためには、これが BeginPanningFeedback で指定された HWND と同じである必要がある。
lTotalOverpanOffsetX : [int] 型: LONG スクロール可能領域の端に達してから、ウィンドウが水平方向に移動した総変位量。最大 30 ピクセルの変位が許可される。
lTotalOverpanOffsetY : [int] 型: LONG スクロール可能領域の端に達してから、ウィンドウが垂直方向に移動した総変位量。最大 30 ピクセルの変位が許可される。
fInInertia : [int] 型: BOOL アプリケーションが GF_INERTIA フラグが設定された WM_GESTURE メッセージを処理しているかどうかを示すフラグ。
%inst
パンジェスチャーの結果としてのウィンドウの状態についてクライアントを更新する。この関数は BeginPanningFeedback
の呼び出し後にのみ呼び出すことができる。

[戻り値]
型: BOOL 成功した場合は TRUE。

[備考]
この関数を逐次呼び出す場合は、最新の増分だけでなく常に増分の合計を渡す必要がある。

