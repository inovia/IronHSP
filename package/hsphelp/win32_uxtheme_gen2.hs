; ============================================================
;   uxtheme.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

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

