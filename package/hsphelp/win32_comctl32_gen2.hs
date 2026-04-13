; ============================================================
;   comctl32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
ImageList_Destroy
イメージリストを破棄する。
%group
Win32 comctl32
%prm
himl
himl : [intptr] 型: HIMAGELIST 破棄するイメージリストへのハンドル。
%inst
イメージリストを破棄する。

[戻り値]
型: BOOL 成功した場合は 0 以外、それ以外は 0。


%index
ImageList_Add
イメージリストに 1 つ以上のイメージを追加する。(ImageList_Add)
%group
Win32 comctl32
%prm
himl, hbmImage, hbmMask
himl : [intptr] 型: HIMAGELIST イメージリストへのハンドル。
hbmImage : [intptr] 型: HBITMAP イメージを含むビットマップへのハンドル。イメージ数はビットマップの幅から推論される。
hbmMask : [intptr] 型: HBITMAP マスクを含むビットマップへのハンドル。イメージリストでマスクが使用されない場合は無視される。NULL を指定できる。
%inst
イメージリストに 1 つ以上のイメージを追加する。(ImageList_Add)

[戻り値]
型: int 成功した場合は最初の新しいイメージのインデックス、それ以外は -1。

[備考]
ImageList_Add はビットマップを内部データ構造にコピーする。関数が戻った後、DeleteObject で hbmImage と
hbmMask を必ず削除する。


%index
ImageList_Create
新しいイメージリストを作成する。
%group
Win32 comctl32
%prm
cx, cy, flags, cInitial, cGrow
cx : [int] 型: int 各イメージの幅(ピクセル単位)。
cy : [int] 型: int 各イメージの高さ(ピクセル単位)。
flags : [int] 型: UINT 作成するイメージリストの種類を指定するビットフラグのセット。Image List Creation Flags の組み合わせ。
cInitial : [int] 型: int イメージリストが初期に格納するイメージ数。
cGrow : [int] 型: int システムが新しいイメージのために空きを作る必要があるときにイメージリストが成長できるイメージ数。
%inst
新しいイメージリストを作成する。

[戻り値]
型: HIMAGELIST 成功した場合はイメージリストへのハンドル、それ以外は NULL。

[備考]
使用が終わったら ImageList_Destroy を呼んで破棄する。Comctl32.dll バージョン 6
を使うにはマニフェストで指定する必要がある。


%index
ImageList_Draw
指定したデバイスコンテキストにイメージリスト項目を描画する。(ImageList_Draw)
%group
Win32 comctl32
%prm
himl, i, hdcDst, x, y, fStyle
himl : [intptr] 型: HIMAGELIST イメージリストへのハンドル。
i : [int] 型: int 描画するイメージの 0 ベースインデックス。
hdcDst : [intptr] 型: HDC 先デバイスコンテキストへのハンドル。
x : [int] 型: int 指定デバイスコンテキスト内で描画する x 座標。
y : [int] 型: int 指定デバイスコンテキスト内で描画する y 座標。
fStyle : [int] 型: UINT
%inst
指定したデバイスコンテキストにイメージリスト項目を描画する。(ImageList_Draw)

[戻り値]
型: BOOL 成功した場合は 0 以外、それ以外は 0。

[備考]
オーバーレイイメージは i で指定される主イメージの上に透過的に描画される。fStyle でオーバーレイイメージを指定するには、1
ベースのオーバーレイイメージインデックスをシフトする INDEXTOOVERLAYMASK マクロを使う。事前に
ImageList_SetOverlayImage でオーバーレイイメージとして指定しておく必要がある。


%index
ImageList_GetImageCount
イメージリスト内のイメージ数を取得する。
%group
Win32 comctl32
%prm
himl
himl : [intptr] 型: HIMAGELIST イメージリストへのハンドル。
%inst
イメージリスト内のイメージ数を取得する。

[戻り値]
型: int イメージ数を返す。


%index
InitCommonControlsEx
コモンコントロール DLL(Comctl32.dll)がロードされていることを保証し、DLL から特定のコモンコントロールクラスを登録する。コモンコントロールを作成する前にアプリケーションはこの関数を呼ぶ必要がある。
%group
Win32 comctl32
%prm
picce
picce : [var] 型: const LPINITCOMMONCONTROLSEX どのコントロールクラスを登録するかを指定する情報を含む INITCOMMONCONTROLSEX 構造体へのポインタ。
%inst
コモンコントロール DLL(Comctl32.dll)がロードされていることを保証し、DLL
から特定のコモンコントロールクラスを登録する。コモンコントロールを作成する前にアプリケーションはこの関数を呼ぶ必要がある。

[戻り値]
型: BOOL 成功した場合は TRUE、それ以外は FALSE。

[備考]
InitCommonControlsEx の各呼び出しの効果は累積的である。例えば ICC_UPDOWN_CLASS で呼ばれた後に
ICC_HOTKEY_CLASS で呼ばれた場合、アップダウンとホットキーのコモンコントロールクラスの両方が登録される。

