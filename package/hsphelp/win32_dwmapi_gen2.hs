; ============================================================
;   dwmapi.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
DwmEnableBlurBehindWindow
指定されたウィンドウでブラー効果を有効にする。
%group
Win32 dwmapi
%prm
hWnd, pBlurBehind
hWnd : [intptr] ブラー効果を適用するウィンドウへのハンドル。
pBlurBehind : [var] `[in]` ブラー効果のデータを提供する DWM_BLURBEHIND 構造体へのポインタ。
%inst
指定されたウィンドウでブラー効果を有効にする。

[戻り値]
成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコード。

[備考]
Windows 8 以降ではレンダリング方式の変更により、この関数を呼び出してもブラー効果は適用されない。DWM_BLURBEHIND
構造体の fEnable を TRUE に設定することでブラーを有効化する。この関数は BeginPaint
の直前に呼ぶこと。ウィンドウ内のアルファ値は尊重される。一部の GDI
操作はアルファ値を保持しないため子ウィンドウの扱いには注意が必要。DWM_BLURBEHIND
内のリージョンは呼び出し元の所有となり、呼び出し後すぐに解放可能。この関数はトップレベルウィンドウでのみ呼び出せる。DWM
コンポジションが切り替わるたびに再呼び出しが必要(WM_DWMCOMPOSITIONCHANGED で処理)。


%index
DwmExtendFrameIntoClientArea
ウィンドウフレームをクライアント領域に拡張する。
%group
Win32 dwmapi
%prm
hWnd, pMarInset
hWnd : [intptr] フレームをクライアント領域へ拡張するウィンドウへのハンドル。
pMarInset : [var] フレームをクライアント領域に拡張する際に使用するマージンを記述する MARGINS 構造体へのポインタ。
%inst
ウィンドウフレームをクライアント領域に拡張する。

[戻り値]
成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコード。

[備考]
DWM コンポジションが切り替わるたびにこの関数を呼ぶ必要がある(WM_DWMCOMPOSITIONCHANGED
で処理)。負のマージン値を使用すると「シート・オブ・グラス」効果を作成できる。


%index
DwmGetWindowAttribute
ウィンドウに適用されている DWM 属性の現在値を取得する。
%group
Win32 dwmapi
%prm
hwnd, dwAttribute, pvAttribute, cbAttribute
hwnd : [intptr] 属性値を取得するウィンドウへのハンドル。
dwAttribute : [int] 取得する値を記述するフラグ(DWMWINDOWATTRIBUTE 列挙体の値)。どの属性を取得するかを指定し、pvAttribute は属性値を受け取るオブジェクトを指す。
pvAttribute : [intptr] 属性の現在値を受け取る変数へのポインタ。取得される値の型は dwAttribute の値に依存する。DWMWINDOWATTRIBUTE 列挙体の各フラグの行に、どの型へのポインタを渡すべきかが示されている。
cbAttribute : [int] pvAttribute で受け取る属性値のサイズ(バイト単位)。取得される値の型とそのバイトサイズは dwAttribute の値に依存する。
%inst
ウィンドウに適用されている DWM 属性の現在値を取得する。

[戻り値]
型: HRESULT 関数が成功した場合、S_OK を返す。それ以外の場合は HRESULT エラーコード。


%index
DwmSetWindowAttribute
ウィンドウの DWM 非クライアント領域レンダリング属性の値を設定する。
%group
Win32 dwmapi
%prm
hwnd, dwAttribute, pvAttribute, cbAttribute
hwnd : [intptr] 属性値を設定するウィンドウへのハンドル。
dwAttribute : [int] 設定する値を記述するフラグ(DWMWINDOWATTRIBUTE 列挙体の値)。どの属性を設定するかを指定し、pvAttribute は属性値を含むオブジェクトを指す。
pvAttribute : [intptr] 設定する属性値を含むオブジェクトへのポインタ。値の型は dwAttribute の値に依存する。
cbAttribute : [int] pvAttribute で設定する属性値のサイズ(バイト単位)。型とバイトサイズは dwAttribute の値に依存する。
%inst
ウィンドウの DWM 非クライアント領域レンダリング属性の値を設定する。

[戻り値]
型: HRESULT 関数が成功した場合、S_OK を返す。それ以外の場合は HRESULT エラーコード。Desktop
Composition が無効化されている場合(Windows 7 以前)、DWM_E_COMPOSITIONDISABLED を返す。

[備考]
dwAttribute に DWMWA_NCRENDERING_ENABLED
を指定してこの関数を呼び出すのは無効。非クライアント領域レンダリングの有効/無効を切り替えるには
DWMWA_NCRENDERING_POLICY 属性に対して設定する。

