; ============================================================
;   dwmapi.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
DwmAttachMilContent
この関数は実装されていない。(DwmAttachMilContent)
%group
Win32 dwmapi
%prm
hwnd
hwnd : [intptr] 
%inst
この関数は実装されていない。(DwmAttachMilContent)

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
DwmDefWindowProc
非クライアント領域内での Desktop Window Manager (DWM) ヒットテスト用の既定ウィンドウプロシージャ。
%group
Win32 dwmapi
%prm
hWnd, msg, wParam, lParam, plResult
hWnd : [intptr] メッセージを受け取ったウィンドウプロシージャのハンドル。
msg : [int] メッセージ。
wParam : [intptr] 追加のメッセージ情報を指定する。このパラメータの内容は msg パラメータの値に依存する。
lParam : [intptr] 追加のメッセージ情報を指定する。このパラメータの内容は msg パラメータの値に依存する。
plResult : [intptr] このメソッドが正常に戻ったとき、ヒットテストの結果を受け取る LRESULT 値へのポインタ。
%inst
非クライアント領域内での Desktop Window Manager (DWM) ヒットテスト用の既定ウィンドウプロシージャ。

[戻り値]
DwmDefWindowProc がメッセージを処理した場合は TRUE、そうでない場合は FALSE を返す。

[備考]
標準のキャプションボタンを含むカスタムフレームを作成する場合、WM_NCHITTEST
およびその他の非クライアントヒットテストメッセージはまず DwmDefWindowProc 関数に渡す必要がある。これにより DWM
がキャプションボタンに対するヒットテストを提供できるようになる。DwmDefWindowProc
が非クライアントヒットテストメッセージを処理しない場合、これらのメッセージのさらなる処理が必要になることがある。


%index
DwmDetachMilContent
この関数は実装されていない。(DwmDetachMilContent)
%group
Win32 dwmapi
%prm
hwnd
hwnd : [intptr] 
%inst
この関数は実装されていない。(DwmDetachMilContent)

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


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
DwmEnableComposition
Desktop Window Manager (DWM) のコンポジションを有効または無効にする。
%group
Win32 dwmapi
%prm
uCompositionAction
uCompositionAction : [int] DWM コンポジションを有効にするには DWM_EC_ENABLECOMPOSITION、無効にするには DWM_EC_DISABLECOMPOSITION を指定する。
%inst
Desktop Window Manager (DWM) のコンポジションを有効または無効にする。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
DWM コンポジションを無効にすると、デスクトップ全体で無効になる。コンポジションを無効にしていたすべてのプロセスが
DwmEnableComposition で再度有効化するか終了すると、DWM コンポジションは自動的に再有効化される。DWM
コンポジションが有効または無効になるたびに WM_DWMCOMPOSITIONCHANGED 通知が送信される。


%index
DwmEnableMMCSS
呼び出し元プロセスが生存している間、Desktop Window Manager (DWM) に Multimedia Class Schedule Service (MMCSS) スケジューリングへの参加または辞退を通知する。
%group
Win32 dwmapi
%prm
fEnableMMCSS
fEnableMMCSS : [int] DWM に MMCSS スケジューリングへの参加を指示する場合は TRUE、参加を辞退または終了する場合は FALSE を指定する。
%inst
呼び出し元プロセスが生存している間、Desktop Window Manager (DWM) に Multimedia Class
Schedule Service (MMCSS) スケジューリングへの参加または辞退を通知する。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
DwmEnableMMCSS で MMCSS を有効にしたいずれかのプロセスがアクティブで、MMCSS を無効化するために以前に
DwmEnableMMCSS を呼び出していない限り、DWM は MMCSS によってスケジューリングされる。


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
DwmFlush
現在保留中のすべての Microsoft DirectX サーフェス更新が完了する次の present まで呼び出し元をブロックする flush 呼び出しを発行する。これにより、非常に複雑なシーンや優先度の極めて低い呼び出しプロセスを補正する。
%group
Win32 dwmapi
%prm

%inst
現在保留中のすべての Microsoft DirectX サーフェス更新が完了する次の present まで呼び出し元をブロックする
flush 呼び出しを発行する。これにより、非常に複雑なシーンや優先度の極めて低い呼び出しプロセスを補正する。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
DwmFlush は、呼び出し元アプリケーションがキューに入れた DirectX
の変更が画面に描画されるまで待機してから戻る。セッション全体のレンダリングバッチをフラッシュするわけではない。


%index
DwmGetColorizationColor
Desktop Window Manager (DWM) のガラスコンポジションに使用されている現在の色を取得する。
%group
Win32 dwmapi
%prm
pcrColorization, pfOpaqueBlend
pcrColorization : [var] 関数が正常に戻ったとき、ガラスコンポジションに使用されている現在の色を受け取る値へのポインタ。色のフォーマットは 0xAARRGGBB 形式である。
pfOpaqueBlend : [var] 関数が正常に戻ったとき、色が不透明ブレンドであるかどうかを示す値へのポインタ。不透明ブレンドの場合は TRUE、そうでない場合は FALSE。
%inst
Desktop Window Manager (DWM) のガラスコンポジションに使用されている現在の色を取得する。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
pcrColorization が指す値は 0xAARRGGBB 形式である。COLORREF をはじめとする多くの Microsoft
Win32 API は 0x00BBGGRR 形式を使用する。意図した色が使用されるよう注意すること。


%index
DwmGetCompositionTimingInfo
指定されたウィンドウの現在のコンポジションタイミング情報を取得する。
%group
Win32 dwmapi
%prm
hwnd, pTimingInfo
hwnd : [intptr] コンポジションタイミング情報を取得するウィンドウのハンドル。
pTimingInfo : [var] 関数が正常に戻ったとき、ウィンドウの現在のコンポジションタイミング情報を受け取る DWM_TIMING_INFO 構造体へのポインタ。この関数を呼び出す前に構造体の cbSize メンバーを設定しておく必要がある。
%inst
指定されたウィンドウの現在のコンポジションタイミング情報を取得する。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
DwmGetGraphicsStreamClient
この関数は実装されていない。(DwmGetGraphicsStreamClient)
%group
Win32 dwmapi
%prm
uIndex, pClientUuid
uIndex : [int] 
pClientUuid : [var] 
%inst
この関数は実装されていない。(DwmGetGraphicsStreamClient)

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
DwmGetGraphicsStreamTransformHint
この関数は実装されていない。(DwmGetGraphicsStreamTransformHint)
%group
Win32 dwmapi
%prm
uIndex, pTransform
uIndex : [int] 
pTransform : [var] 
%inst
この関数は実装されていない。(DwmGetGraphicsStreamTransformHint)

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
DwmGetTransportAttributes
トランスポートの属性を取得する。
%group
Win32 dwmapi
%prm
pfIsRemoting, pfIsConnected, pDwGeneration
pfIsRemoting : [var] トランスポートがリモーティングをサポートしているかどうかを示す BOOL 値へのポインタ。サポートしている場合は TRUE、そうでない場合は FALSE。
pfIsConnected : [var] トランスポートが接続されているかどうかを示す BOOL 値へのポインタ。接続されている場合は TRUE、そうでない場合は FALSE。
pDwGeneration : [var] トランスポートの世代値を受け取る DWORD へのポインタ。
%inst
トランスポートの属性を取得する。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
DwmGetUnmetTabRequirements
この関数は Windows で実装されることのなかった実験的機能の一部であった。効果はなく、使用すべきではない。
%group
Win32 dwmapi
%prm
appWindow, value
appWindow : [intptr] このパラメータは使用されない。
value : [var] 
%inst
この関数は Windows で実装されることのなかった実験的機能の一部であった。効果はなく、使用すべきではない。


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
DwmInvalidateIconicBitmaps
アプリケーションがウィンドウから以前に提供したアイコン形式のビットマップ（サムネイルおよびピーク表示の両方）をすべてリフレッシュすべきであることを示すために呼び出す。
%group
Win32 dwmapi
%prm
hwnd
hwnd : [intptr] この呼び出しによってビットマップが無効化されるウィンドウまたはタブのハンドル。このウィンドウは呼び出し元プロセスに属している必要がある。
%inst

アプリケーションがウィンドウから以前に提供したアイコン形式のビットマップ（サムネイルおよびピーク表示の両方）をすべてリフレッシュすべきであることを示すために呼び出す。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
この関数を呼び出すと、Desktop Window Manager (DWM)
は対象ウィンドウの現在のビットマップを無効化し、次に必要となったときに新しいビットマップをそのウィンドウに要求するようになる。DwmInvalidateIconicBitmaps
は頻繁に呼び出すべきではない。頻繁に呼び出すと、新しいビットマップの作成と取得が発生し、性能低下を招く可能性がある。


%index
DwmIsCompositionEnabled
Desktop Window Manager (DWM) のコンポジションが有効かどうかを示す値を取得する。Windows 7 以前のマシン上のアプリケーションは、WM_DWMCOMPOSITIONCHANGED 通知を処理することでコンポジション状態の変化を監視できる。
%group
Win32 dwmapi
%prm
pfEnabled
pfEnabled : [var] 関数が正常に戻ったとき、DWM コンポジションが有効である場合は TRUE、そうでない場合は FALSE を受け取る値へのポインタ。
%inst
Desktop Window Manager (DWM) のコンポジションが有効かどうかを示す値を取得する。Windows 7
以前のマシン上のアプリケーションは、WM_DWMCOMPOSITIONCHANGED
通知を処理することでコンポジション状態の変化を監視できる。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
DwmModifyPreviousDxFrameDuration
前のフレームを表示するモニターのリフレッシュ回数を変更する。DwmModifyPreviousDxFrameDuration はサポートされなくなった。Windows 8.1 以降、DwmModifyPreviousDxFrameDuration の呼び出しは常に E_NOTIMPL を返す。
%group
Win32 dwmapi
%prm
hwnd, cRefreshes, fRelative
hwnd : [intptr] 前のフレームに新しい持続時間を適用するウィンドウのハンドル。
cRefreshes : [int] 前のフレームに適用するリフレッシュ回数。
fRelative : [int] cRefreshes に与えた値が現在の値に対する相対値（加算または減算される）の場合は TRUE、現在の値を置き換える場合は FALSE。
%inst
前のフレームを表示するモニターのリフレッシュ回数を変更する。DwmModifyPreviousDxFrameDuration
はサポートされなくなった。Windows 8.1 以降、DwmModifyPreviousDxFrameDuration の呼び出しは常に
E_NOTIMPL を返す。

[戻り値]
この関数は DWM が動作していない場合でも常に S_OK を返す。


%index
DwmQueryThumbnailSourceSize
Desktop Window Manager (DWM) サムネイルのソースサイズを取得する。
%group
Win32 dwmapi
%prm
hThumbnail, pSize
hThumbnail : [int] ソースウィンドウのサイズを取得する対象のサムネイルのハンドル。
pSize : [var] 関数が正常に戻ったとき、ソースサムネイルのサイズを受け取る SIZE 構造体へのポインタ。
%inst
Desktop Window Manager (DWM) サムネイルのソースサイズを取得する。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
DwmRegisterThumbnail
送信先ウィンドウとソースウィンドウの間に Desktop Window Manager (DWM) サムネイル関係を作成する。
%group
Win32 dwmapi
%prm
hwndDestination, hwndSource, phThumbnailId
hwndDestination : [intptr] DWM サムネイルを使用するウィンドウのハンドル。送信先ウィンドウハンドルにトップレベルウィンドウ以外のものを設定すると、戻り値は E_INVALIDARG となる。
hwndSource : [intptr] サムネイルソースとして使用するウィンドウのハンドル。ソースウィンドウハンドルにトップレベルウィンドウ以外のものを設定すると、戻り値は E_INVALIDARG となる。
phThumbnailId : [var] 関数が正常に戻ったとき、DWM サムネイルの登録を表すハンドルへのポインタ。
%inst
送信先ウィンドウとソースウィンドウの間に Desktop Window Manager (DWM) サムネイル関係を作成する。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
DWM サムネイル関係を登録してもデスクトップコンポジションは変更されない。サムネイルの位置決めについては
DwmUpdateThumbnailProperties 関数のドキュメントを参照。hwndDestination
で指定するウィンドウは、デスクトップウィンドウそのものか、DwmRegisterThumbnail
を呼び出しているプロセスが所有するものである必要がある。これは、アプリケーションが他のアプリケーションのコンテンツに影響を与えるのを防ぐためである。この関数で取得したサムネイル登録ハンドルはグローバルに一意ではないが、プロセス内では一意である。サムネイルの登録解除には
DwmUnregisterThumbnail 関数を呼び出す。これは関係を登録したプロセス内で行う必要がある。


%index
DwmRenderGesture
タッチ接触がジェスチャーとして認識されたこと、および DWM がそのジェスチャーに対するフィードバックを描画すべきであることを Desktop Window Manager (DWM) に通知する。
%group
Win32 dwmapi
%prm
gt, cContacts, pdwPointerID, pPoints
gt : [int] 
cContacts : [int] 接触点の数。
pdwPointerID : [var] ポインタ ID。
pPoints : [var] 接触点。
%inst
タッチ接触がジェスチャーとして認識されたこと、および DWM がそのジェスチャーに対するフィードバックを描画すべきであることを
Desktop Window Manager (DWM) に通知する。


%index
DwmSetDxFrameDuration
提示されたフレームを表示するモニターのリフレッシュ回数を設定する。DwmSetDxFrameDuration はサポートされなくなった。Windows 8.1 以降、DwmSetDxFrameDuration の呼び出しは常に E_NOTIMPL を返す。
%group
Win32 dwmapi
%prm
hwnd, cRefreshes
hwnd : [intptr] 提示されたフレームを表示するウィンドウのハンドル。
cRefreshes : [int] 提示されたフレームを表示するリフレッシュ回数。
%inst
提示されたフレームを表示するモニターのリフレッシュ回数を設定する。DwmSetDxFrameDuration
はサポートされなくなった。Windows 8.1 以降、DwmSetDxFrameDuration の呼び出しは常に E_NOTIMPL
を返す。

[戻り値]
この関数はフレーム持続時間が変更されない場合や DWM が動作していない場合でも、常に S_OK を返す。

[備考]
DWM
は提示されたフレームを少なくとも指定されたモニターリフレッシュ回数の間表示しようとする。現在のコンポジションレートによっては、ちょうど指定回数だけ表示することは不可能な場合がある。フレームが
DWM に遅れて提示されたり、DWM
のコンポジションが遅れたりすると、フレームが要求された回数より少ない回数しか表示されない、あるいは完全にスキップされる可能性がある。


%index
DwmSetIconicLivePreviewBitmap
ウィンドウまたはタブのライブプレビュー（Peek プレビューとも呼ばれる）を表示するための静的なアイコン形式ビットマップを設定する。タスクバーはこのビットマップを使用してウィンドウまたはタブのフルサイズプレビューを表示できる。
%group
Win32 dwmapi
%prm
hwnd, hbmp, pptClient, dwSITFlags
hwnd : [intptr] ウィンドウのハンドル。このウィンドウは呼び出し元プロセスに属している必要がある。
hbmp : [intptr] hwnd で指定されたウィンドウを表すビットマップのハンドル。
pptClient : [var] ホストウィンドウのフレームから見た、タブウィンドウのクライアント領域（クライアントウィンドウのフレーム内のコンテンツ領域）のオフセット。このオフセットにより、フレームなしで描画される際にもタブウィンドウの内容をライブプレビュー内で正しく描画できる。
dwSITFlags : [int] ライブプレビューの表示オプション。このパラメータは 0 または次の値を指定できる。
%inst
ウィンドウまたはタブのライブプレビュー（Peek
プレビューとも呼ばれる）を表示するための静的なアイコン形式ビットマップを設定する。タスクバーはこのビットマップを使用してウィンドウまたはタブのフルサイズプレビューを表示できる。

[戻り値]
関数が成功した場合は S_OK
を返し、それ以外の場合はエラー値を返す。なお、このビットマップはキャッシュされないため、アプリケーションがこの関数を呼び出した時点でウィンドウがプレビュー表示されていない場合、関数は成功コードを返すがビットマップは破棄され使用されない。

[備考]
ウィンドウのライブプレビュー（Peek
プレビューとも呼ばれる）は、ユーザーがタスクバー上のウィンドウのサムネイルにマウスポインタを重ねたり、ALT+TAB
ウィンドウでサムネイルにフォーカスを与えたりすると表示される。このビューはウィンドウのフルサイズビューであり、スナップショットでもアイコン形式の表現でもよい。ウィンドウは通常
WM_DWMSENDICONICLIVEPREVIEWBITMAP メッセージへの応答として
DwmSetIconicLivePreviewBitmap
関数を呼び出す。返されるビットマップはウィンドウまたはフレームのクライアント領域より大きくてはならず、32
ビットの色深度を持つ必要がある。Desktop Window Manager (DWM)
はビットマップのコピーを使用するが、呼び出し元は元のビットマップの所有権を保持し、不要になった時点でリソースを解放する責任を負う。DWM
はライブプレビュー表現の表示を停止すると、ビットマップのコピーを保持しなくなる。


%index
DwmSetIconicThumbnail
ウィンドウまたはタブにサムネイル表現として使用する静的なアイコン形式ビットマップを設定する。タスクバーはこのビットマップを当該ウィンドウまたはタブのサムネイル切り替え対象として使用できる。
%group
Win32 dwmapi
%prm
hwnd, hbmp, dwSITFlags
hwnd : [intptr] ウィンドウまたはタブのハンドル。このウィンドウは呼び出し元プロセスに属している必要がある。
hbmp : [intptr] hwnd で指定されたウィンドウを表すビットマップのハンドル。
dwSITFlags : [int] 
%inst

ウィンドウまたはタブにサムネイル表現として使用する静的なアイコン形式ビットマップを設定する。タスクバーはこのビットマップを当該ウィンドウまたはタブのサムネイル切り替え対象として使用できる。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
アプリケーションは通常、ウィンドウに対する WM_DWMSENDICONICTHUMBNAIL メッセージを受信した後に
DwmSetIconicThumbnail 関数を呼び出す。サムネイルはそのメッセージで指定された最大の x 座標および y
座標を超えてはならない。サムネイルは 32 ビットの色深度を持つ必要もある。アプリケーションは
DwmInvalidateIconicBitmaps
を呼び出すことで、アイコン形式のサムネイルおよびライブプレビュービットマップが古くなっておりリフレッシュすべきであることを Desktop
Window Manager (DWM) に示す。その後 DWM は必要なときにウィンドウから新しいバージョンを要求する。ただし、DWM
のビットマップキャッシュが満杯の場合、DWM は更新版を要求しない。DWM
はビットマップのコピーを使用するが、メモリ制約のためアプリケーションはいつでもこのコピーを解放できる。コピーが解放されてもウィンドウには通知されないが、サムネイルが再度必要になったときに後続の
WM_DWMSENDICONICTHUMBNAIL
リクエストを受け取る場合がある。呼び出し元は元のビットマップの所有権を保持し、不要になった時点でリソースを解放する責任を負う。


%index
DwmSetPresentParameters
フレームコンポジション用のプレゼントパラメータを設定する。DwmSetPresentParameters はサポートされなくなった。Windows 8.1 以降、DwmSetPresentParameters の呼び出しは常に E_NOTIMPL を返す。
%group
Win32 dwmapi
%prm
hwnd, pPresentParams
hwnd : [intptr] プレゼントパラメータを適用するウィンドウのハンドル。
pPresentParams : [var] フレームコンポジション用の DWM ビデオフレームパラメータを含む DWM_PRESENT_PARAMETERS 構造体へのポインタ。
%inst
フレームコンポジション用のプレゼントパラメータを設定する。DwmSetPresentParameters
はサポートされなくなった。Windows 8.1 以降、DwmSetPresentParameters の呼び出しは常に
E_NOTIMPL を返す。

[戻り値]
この関数は常に S_OK を返す。


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


%index
DwmShowContact
特定のタッチまたはペンの接触に応じて描画する視覚フィードバックの種類を指定するために、アプリやフレームワークから呼び出される。
%group
Win32 dwmapi
%prm
dwPointerID, eShowContact
dwPointerID : [int] 接触のポインタ ID。タッチまたはペンの接触はそれぞれ検出時に一意の ID が付与される。
eShowContact : [int] 
%inst
特定のタッチまたはペンの接触に応じて描画する視覚フィードバックの種類を指定するために、アプリやフレームワークから呼び出される。

[戻り値]
dwPointerID が画面上に現在存在する接触のものと一致しない場合、この関数は E_INVALIDARG を返す。それ以外の場合は
S_OK を返す。

[備考]
この関数は UI スレッドから呼び出しても安全である。


%index
DwmTetherContact
ユーザーへのタッチおよびドラッグ操作のグラフィカルフィードバックを有効にする。
%group
Win32 dwmapi
%prm
dwPointerID, fEnable, ptTether
dwPointerID : [int] ポインタ ID。
fEnable : [int] 接触が有効かどうかを示す。
ptTether : [int] テザー。
%inst
ユーザーへのタッチおよびドラッグ操作のグラフィカルフィードバックを有効にする。


%index
DwmTransitionOwnedWindow
ツールウィンドウのアニメーションを Desktop Window Manager (DWM) と協調させる。
%group
Win32 dwmapi
%prm
hwnd, target
hwnd : [intptr] ウィンドウのハンドル。
target : [int] 
%inst
ツールウィンドウのアニメーションを Desktop Window Manager (DWM) と協調させる。


%index
DwmUnregisterThumbnail
DwmRegisterThumbnail 関数によって作成された Desktop Window Manager (DWM) サムネイル関係を削除する。
%group
Win32 dwmapi
%prm
hThumbnailId
hThumbnailId : [int] 削除するサムネイル関係のハンドル。NULL や存在しないハンドルを指定すると戻り値は E_INVALIDARG となる。
%inst
DwmRegisterThumbnail 関数によって作成された Desktop Window Manager (DWM)
サムネイル関係を削除する。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
DWM サムネイル関係の登録解除は、関係を登録したプロセス内で行う必要がある。


%index
DwmUpdateThumbnailProperties
Desktop Window Manager (DWM) サムネイルのプロパティを更新する。
%group
Win32 dwmapi
%prm
hThumbnailId, ptnProperties
hThumbnailId : [int] 更新する DWM サムネイルのハンドル。NULL や無効なサムネイル、他のプロセスが所有するサムネイルを指定すると戻り値は E_INVALIDARG となる。
ptnProperties : [var] 新しいサムネイルプロパティを含む DWM_THUMBNAIL_PROPERTIES 構造体へのポインタ。
%inst
Desktop Window Manager (DWM) サムネイルのプロパティを更新する。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
DwmRegisterThumbnail
関数で作成されたサムネイル関係は、この関数が呼び出されるまで送信先ウィンドウに描画されない。後続の呼び出しは指定されたプロパティに従ってサムネイルを更新する。

