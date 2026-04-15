; ============================================================
;   comctl32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
comctl32.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の comctl32.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
ImageList_Destroy
イメージリストを破棄する。
%prm
himl
himl : [intptr] 型: HIMAGELIST 破棄するイメージリストへのハンドル。
%inst
イメージリストを破棄する。

[戻り値]
型: BOOL 成功した場合は 0 以外、それ以外は 0。


%index
DestroyPropertySheetPage
プロパティシートのページを破棄する。アプリケーションは、PropertySheet 関数に渡されなかったページに対してこの関数を呼び出す必要がある。
%prm
param0
param0 : [intptr] 
%inst
プロパティシートのページを破棄する。アプリケーションは、PropertySheet
関数に渡されなかったページに対してこの関数を呼び出す必要がある。

[戻り値]
型: BOOL 成功した場合は 0 以外を返し、それ以外は 0 を返す。


%index
CreateMappedBitmap
ツールバーで使用するビットマップを作成する。
%prm
hInstance, idBitmap, wFlags, lpColorMap, iNumMaps
hInstance : [intptr] 型: HINSTANCE ビットマップリソースを含む実行可能ファイルのモジュールインスタンスへのハンドル。
idBitmap : [int] 型: INT_PTR ビットマップリソースのリソース識別子。
wFlags : [int] 型: UINT ビットマップフラグ。このパラメータにはゼロまたは次の値を指定できる。
lpColorMap : [var] 型: LPCOLORMAP ビットマップのマッピングに必要な色情報を格納した COLORMAP 構造体へのポインタ。このパラメータが NULL の場合、関数は既定のカラーマップを使用する。
iNumMaps : [int] 型: int lpColorMap が指すカラーマップの個数。
%inst
ツールバーで使用するビットマップを作成する。

[戻り値]
型: HBITMAP 成功した場合はビットマップへのハンドルを返し、失敗した場合は NULL を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]

この関数は、ビットマップリソースで指定されたビットマップデータおよび色と、カラーマッピング情報を用いて新しいビットマップを作成する。この関数は、カラーマップを持つ画像、すなわち
256 色以下の画像に対してのみ完全にサポートされる。


%index
CreatePropertySheetPageW
プロパティシート用の新しいページを作成する。(Unicode)
%prm
constPropSheetPagePointer
constPropSheetPagePointer : [var] 型: LPCPROPSHEETPAGE プロパティシートに含めるページを定義する PROPSHEETPAGE 構造体へのポインタ。
%inst
プロパティシート用の新しいページを作成する。(Unicode)

[戻り値]
型: HPROPSHEETPAGE 成功した場合は新しいプロパティページへのハンドルを返し、失敗した場合は NULL を返す。

[備考]
メモ: コモンコントロール バージョン 7.0 より前では、この関数はビジュアルスタイルをサポートしていなかった。アプリケーションは
PropertySheet 関数を使用して、新しいページを含むプロパティシートを作成する。Aero ウィザードスタイル
(PSH_AEROWIZARD) を使用しない場合、アプリケーションは PSM_ADDPAGE
メッセージを使用して既存のプロパティシートに新しいページを追加できる。Windows 95: システムは最大 16,364
個のウィンドウハンドルをサポートする。
> [!NOTE] > prsht.h ヘッダは CreatePropertySheetPage
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に応じて ANSI または Unicode
版を自動的に選択する。エンコーディング中立でないコードと中立エイリアスを混在させると、コンパイルまたは実行時エラーにつながる不整合が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
CreateStatusWindowW
通常、アプリケーションの状態を表示するために使用されるステータスウィンドウを作成する。(Unicode)
%prm
style, lpszText, hwndParent, wID
style : [int] 型: LONG ステータスウィンドウのウィンドウスタイル。このパラメータには WS_CHILD スタイルを含める必要があり、通常は WS_VISIBLE スタイルも含めるべきである。
lpszText : [wstr] 型: LPCTSTR 最初のパートに表示するステータステキストを指定する、NULL 終端文字列へのポインタ。
hwndParent : [intptr] 型: HWND 親ウィンドウへのハンドル。
wID : [int] 型: UINT ステータスウィンドウのコントロール識別子。ウィンドウプロシージャはこの値を使用して、親ウィンドウに送信するメッセージを識別する。
%inst
通常、アプリケーションの状態を表示するために使用されるステータスウィンドウを作成する。(Unicode)

[戻り値]
型: HWND 成功した場合はステータスウィンドウへのハンドルを返し、失敗した場合は NULL を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
CreateStatusWindow 関数は CreateWindow
関数を呼び出してウィンドウを作成する。パラメータは変更せずにそのまま渡され、位置・幅・高さの各パラメータは CreateWindow
の既定値に設定される。
> [!NOTE] > commctrl.h ヘッダは CreateStatusWindow
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に応じて ANSI または Unicode
版を自動的に選択する。エンコーディング中立でないコードと中立エイリアスを混在させると、コンパイルまたは実行時エラーにつながる不整合が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
CreateUpDownControl
アップダウンコントロールを作成する。メモ: この関数は廃止されている。16 ビット関数であり、範囲と位置に 32 ビット値を扱うことができない。
%prm
dwStyle, x, y, cx, cy, hParent, nID, hInst, hBuddy, nUpper, nLower, nPos
dwStyle : [int] 型: DWORD コントロールのウィンドウスタイル。このパラメータには WS_CHILD、WS_BORDER、WS_VISIBLE の各スタイルを含めるべきであり、アップダウンコントロール固有のウィンドウスタイルも任意に含めることができる。
x : [int] 型: int コントロールの左上隅の水平座標（クライアント座標）。
y : [int] 型: int コントロールの左上隅の垂直座標（クライアント座標）。
cx : [int] 型: int アップダウンコントロールの幅（ピクセル単位）。
cy : [int] 型: int アップダウンコントロールの高さ（ピクセル単位）。
hParent : [intptr] 型: HWND アップダウンコントロールの親ウィンドウへのハンドル。
nID : [int] 型: int アップダウンコントロールの識別子。
hInst : [intptr] 型: HINSTANCE アップダウンコントロールを作成するアプリケーションのモジュールインスタンスへのハンドル。
hBuddy : [intptr] 型: HWND アップダウンコントロールに関連付けられるウィンドウへのハンドル。このパラメータが NULL の場合、コントロールにはバディウィンドウがない。
nUpper : [int] 型: int アップダウンコントロールの上限値（範囲）。
nLower : [int] 型: int アップダウンコントロールの下限値（範囲）。
nPos : [int] 型: int コントロールの位置。
%inst
アップダウンコントロールを作成する。メモ: この関数は廃止されている。16 ビット関数であり、範囲と位置に 32
ビット値を扱うことができない。

[戻り値]
型: HWND 関数が成功した場合、戻り値はアップダウンコントロールのウィンドウハンドルである。関数が失敗した場合、戻り値は NULL
である。


%index
DPA_Destroy
動的ポインタ配列 (DPA) を解放する。
%prm
hdpa
hdpa : [intptr] 型: HDPA DPA へのハンドル。
%inst
動的ポインタ配列 (DPA) を解放する。

[戻り値]
型: BOOL 成功した場合は TRUE、失敗した場合は FALSE を返す。


%index
DPA_Clone
動的ポインタ配列 (DPA) を複製する。
%prm
hdpa, hdpaNew
hdpa : [intptr] 型: const HDPA コピー元となる既存の DPA のハンドル。
hdpaNew : [intptr] 型: HDPA NULL の場合、hdpaSource から新しい配列がコピーされる。
%inst
動的ポインタ配列 (DPA) を複製する。

[戻り値]
型: HDPA 成功した場合は新しいまたは変更された DPA (hdpaNew) へのハンドルを返し、それ以外は NULL を返す。

[備考]
DPA_Clone は名前でエクスポートされておらず、公開ヘッダファイルにも宣言されていない。使用するには、GetProcAddress
を使用して ComCtl32.dll から序数 331 を要求し、関数ポインタを取得する必要がある。


%index
DPA_Create
動的ポインタ配列 (DPA) を作成する。
%prm
cItemGrow
cItemGrow : [int] 型: int DPA の拡張が必要になったときに、配列を拡張する要素数。
%inst
動的ポインタ配列 (DPA) を作成する。

[戻り値]
型: HDPA 成功した場合は DPA へのハンドルを返し、呼び出しが失敗した場合は NULL を返す。


%index
DPA_CreateEx
指定されたサイズとヒープの場所を使用して、動的ポインタ配列 (DPA) を作成する。
%prm
cpGrow, hheap
cpGrow : [int] 型: int DPA の拡張が必要になったときに、配列を拡張する要素数。
hheap : [intptr] 型: HANDLE 配列を格納するヒープへのハンドル。
%inst
指定されたサイズとヒープの場所を使用して、動的ポインタ配列 (DPA) を作成する。

[戻り値]
型: HDPA 成功した場合は DPA へのハンドルを返し、呼び出しが失敗した場合は NULL を返す。

[備考]
DPA_CreateEx は名前でエクスポートされていない。使用するには、GetProcAddress を使用して
ComCtl32.dll から序数 340 を要求し、関数ポインタを取得する必要がある。


%index
DPA_DeleteAllPtrs
動的ポインタ配列 (DPA) からすべての項目を削除し、それに応じて DPA を縮小する。
%prm
hdpa
hdpa : [intptr] 型: HDPA DPA へのハンドル。
%inst
動的ポインタ配列 (DPA) からすべての項目を削除し、それに応じて DPA を縮小する。

[戻り値]
型: BOOL 成功した場合は TRUE を、失敗した場合は FALSE を返す。


%index
DPA_DeletePtr
動的ポインタ配列 (DPA) から項目を削除する。削除後は必要に応じて DPA が縮小される。
%prm
hdpa, i
hdpa : [intptr] 型: HDPA DPA へのハンドル。
i : [int] 型: int DPA から削除する項目のインデックス。
%inst
動的ポインタ配列 (DPA) から項目を削除する。削除後は必要に応じて DPA が縮小される。

[戻り値]
削除された項目を返し、呼び出しが失敗した場合は NULL を返す。


%index
DPA_DestroyCallback
動的ポインタ配列 (DPA) の各要素に対して pfnCB を呼び出した後、DPA を解放する。
%prm
hdpa, pfnCB, pData
hdpa : [intptr] 型: HDPA DPA へのハンドル。
pfnCB : [int] 型: PFNDPAENUMCALLBACK コールバック関数へのポインタ。コールバック関数のプロトタイプについては PFNDPAENUMCALLBACK を参照。
pData : [intptr] 型: void* コールバックデータへのポインタ。pData は pfnCB にパラメータとして渡される。
%inst
動的ポインタ配列 (DPA) の各要素に対して pfnCB を呼び出した後、DPA を解放する。


%index
DPA_EnumCallback
動的ポインタ配列 (DPA) を列挙し、各項目に対して pfnCB を呼び出す。
%prm
hdpa, pfnCB, pData
hdpa : [intptr] 型: HDPA DPA へのハンドル。
pfnCB : [int] 型: PFNDPAENUMCALLBACK コールバック関数へのポインタ。コールバック関数のプロトタイプについては PFNDPAENUMCALLBACK を参照。
pData : [intptr] 型: void* コールバックデータへのポインタ。pData は pfnCB にパラメータとして渡される。
%inst
動的ポインタ配列 (DPA) を列挙し、各項目に対して pfnCB を呼び出す。


%index
DPA_GetPtr
動的ポインタ配列 (DPA) から項目を取得する。
%prm
hdpa, i
hdpa : [intptr] 型: HDPA DPA へのハンドル。
i : [int] 型: int 取得する項目のインデックス。
%inst
動的ポインタ配列 (DPA) から項目を取得する。

[戻り値]
指定された項目を返し、呼び出しが失敗した場合は NULL を返す。


%index
DPA_GetPtrIndex
動的ポインタ配列 (DPA) 内で一致する項目のインデックスを取得する。
%prm
hdpa, p
hdpa : [intptr] 型: HDPA 既存の DPA へのハンドル。
p : [intptr] 型: const void* hdpa 内で検索する項目へのポインタ。
%inst
動的ポインタ配列 (DPA) 内で一致する項目のインデックスを取得する。

[戻り値]
型: int 項目が見つかった場合は pvoid が指す項目のインデックスを返し、見つからなかった場合は -1 を返す。

[備考]
DPA_GetPtrIndex は名前でエクスポートされていない。使用するには、GetProcAddress を使用して
ComCtl32.dll から序数 333 を要求し、関数ポインタを取得する必要がある。


%index
DPA_Grow
動的ポインタ配列 (DPA) のポインタ数を変更する。
%prm
pdpa, cp
pdpa : [intptr] 型: HDPA 既存の DPA へのハンドル。
cp : [int] 型: int DPA に必要とするポインタ数。
%inst
動的ポインタ配列 (DPA) のポインタ数を変更する。

[戻り値]
型: BOOL 成功した場合は TRUE を、失敗した場合は FALSE を返す。

[備考]
cp が既に DPA にあるポインタ数より少ない場合、DPA は変更されない。cp が DPA
内のポインタ数より多い場合、追加されたポインタは NULL で初期化される。


%index
DPA_InsertPtr
動的ポインタ配列 (DPA) の指定された位置に新しい項目を挿入する。必要に応じて DPA は新しい項目を収めるために拡張される。
%prm
hdpa, i, p
hdpa : [intptr] 型: HDPA DPA へのハンドル。
i : [int] 型: int 新しい項目を挿入する位置。
p : [intptr] 型: void* 挿入する項目へのポインタ。
%inst
動的ポインタ配列 (DPA) の指定された位置に新しい項目を挿入する。必要に応じて DPA は新しい項目を収めるために拡張される。

[戻り値]
型: int 新しい項目のインデックスを返し、挿入が失敗した場合は -1 を返す。


%index
DPA_LoadStream
指定されたコールバック関数を呼び出して各要素を読み込むことにより、ストリームから動的ポインタ配列 (DPA) をロードする。
%prm
phdpa, pfn, pstream, pvInstData
phdpa : [intptr] 型: HDPA* DPA へのハンドル。
pfn : [int] 型: PFNDPASTREAM コールバック関数。コールバック関数のプロトタイプについては PFNDPASTREAM を参照。
pstream : [var] 型: IStream* IStream オブジェクト。
pvInstData : [intptr] 型: void* コールバックデータへのポインタ。pvInstData は pfn にパラメータとして渡される。
%inst
指定されたコールバック関数を呼び出して各要素を読み込むことにより、ストリームから動的ポインタ配列 (DPA) をロードする。

[戻り値]
型: HRESULT 次のいずれかの値を返す。
（以下省略）

[備考]
この関数は ComCtl32.dll から直接呼び出す必要がある。序数は 9 である。コールバックは pvInstData
のデータをストリームに書き込む責任を持つ。


%index
DPA_Merge
2 つの動的ポインタ配列 (DPA) の内容を結合する。
%prm
hdpaDest, hdpaSrc, dwFlags, pfnCompare, pfnMerge, lParam
hdpaDest : [intptr] 型: HDPA 最初の DPA へのハンドル。この配列は事前にソートしておいてもよい。関数から返ったときには、マージされた配列のハンドルが格納される。
hdpaSrc : [intptr] 型: HDPA 2 番目の DPA へのハンドル。この配列は事前にソートしておいてもよい。
dwFlags : [int] 型: DWORD 2 つの配列をマージする方法を決定するオプション。DPAM_NORMAL、DPAM_UNION、DPAM_UNION は相互排他的であり、これらのフラグのうち 1 つだけを設定でき、DPAM_SORTED と組み合わせることができる。
pfnCompare : [int] 型: PFNDPACOMPARE 2 つの DPA からそれぞれ 1 つずつ要素を取り出して、それらが同一項目かどうかを判定する PFNDPACOMPARE コールバック関数。同一であれば、pfnCompare が指すコールバック関数が呼び出される。
pfnMerge : [int] 型: PFNDPAMERGE PFNDPACOMPARE により同一項目と判定された要素が両方の DPA に存在する場合に、その内容をマージする PFNDPAMERGE コールバック関数。
lParam : [intptr] 型: LPARAM 等価性を判定する比較の基準を宣言するために使用される追加のパラメータ。
%inst
2 つの動的ポインタ配列 (DPA) の内容を結合する。

[戻り値]
型: BOOL 成功した場合は TRUE、失敗した場合は FALSE を返す。

[備考]
DPA_Merge は名前でエクスポートされていない。使用するには、GetProcAddress を使用して ComCtl32.dll
から序数 11 を要求し、関数ポインタを取得する必要がある。


%index
DPA_SaveStream
ヘッダを書き出した後、指定されたコールバック関数を呼び出して各要素を書き込むことにより、動的ポインタ配列 (DPA) をストリームに保存する。
%prm
hdpa, pfn, pstream, pvInstData
hdpa : [intptr] 型: HDPA DPA へのハンドルを受け取る。
pfn : [int] 型: PFNDPASTREAM コールバック関数。コールバック関数のプロトタイプについては PFNDPASTREAM を参照。
pstream : [var] 型: IStream* IStream オブジェクト。
pvInstData : [intptr] 型: void* コールバックデータへのポインタ。pvInstData は pfn にパラメータとして渡される。
%inst
ヘッダを書き出した後、指定されたコールバック関数を呼び出して各要素を書き込むことにより、動的ポインタ配列 (DPA)
をストリームに保存する。

[戻り値]
型: HRESULT 次のいずれかの値を返す。
（以下省略）

[備考]
この関数は ComCtl32.dll から直接呼び出す必要がある。序数は 10 である。コールバックは pvInstData
のデータをストリームに書き込む責任を持つ。


%index
DPA_Search
動的ポインタ配列 (DPA) 内で項目を検索する。
%prm
hdpa, pFind, iStart, pfnCompare, lParam, options
hdpa : [intptr] 型: HDPA DPA へのハンドル。
pFind : [intptr] 型: void* 検索するポインタ。
iStart : [int] 型: int 検索を開始するインデックス。
pfnCompare : [int] 型: PFNDPACOMPARE 比較関数へのポインタ。比較関数のプロトタイプについては PFNDPACOMPARE を参照。
lParam : [intptr] 型: LPARAM pfnCmp に渡される追加のパラメータ。
options : [int] 型: UINT このパラメータには、次の値のうち 1 つ以上を指定できる。
%inst
動的ポインタ配列 (DPA) 内で項目を検索する。

[戻り値]
型: int DPA 内で項目が見つかった場所のインデックスを返し、項目が見つからなかった場合は -1 を返す。


%index
DPA_SetPtr
動的ポインタ配列 (DPA) の項目に値を割り当てる。
%prm
hdpa, i, p
hdpa : [intptr] 型: HDPA DPA へのハンドル。
i : [int] 型: int DPA 内の項目のインデックス。メモ: インデックスが DPA の現在のサイズを超える場合、DPA はそれを収めるために拡張される。項目を連続して割り当てる必要はない。
p : [intptr] 型: void* 指定された DPA の項目に割り当てる値へのポインタ。
%inst
動的ポインタ配列 (DPA) の項目に値を割り当てる。

[戻り値]
型: BOOL 成功した場合は TRUE を、失敗した場合は FALSE を返す。


%index
DPA_Sort
動的ポインタ配列 (DPA) 内の項目をソートする。
%prm
hdpa, pfnCompare, lParam
hdpa : [intptr] 型: HDPA DPA へのハンドル。
pfnCompare : [int] 型: PFNDPACOMPARE 比較関数へのポインタ。比較関数のプロトタイプについては PFNDPACOMPARE を参照。
lParam : [intptr] 型: LPARAM pfnCmp に渡される追加のパラメータ。
%inst
動的ポインタ配列 (DPA) 内の項目をソートする。

[戻り値]
型: BOOL 成功した場合は TRUE を、失敗した場合は FALSE を返す。


%index
DSA_Destroy
動的構造体配列 (DSA) を解放する。
%prm
hdsa
hdsa : [intptr] 型: HDSA 破棄する DSA へのハンドル。
%inst
動的構造体配列 (DSA) を解放する。

[戻り値]
型: BOOL 成功した場合は TRUE、失敗した場合は FALSE を返す。


%index
DSA_Create
動的構造体配列 (DSA) を作成する。
%prm
cbItem, cItemGrow
cbItem : [int] 型: int 項目のサイズ（バイト単位）。
cItemGrow : [int] 型: int DSA の拡張が必要になったときに、配列を拡張する項目数。
%inst
動的構造体配列 (DSA) を作成する。

[戻り値]
型: HDSA 成功した場合は DSA へのハンドルを返し、作成に失敗した場合は NULL を返す。

[備考]
動的ポインタ配列 (DPA) とは異なり、DSA は任意のサイズの要素を含むことができる。これにより、構造体を配列に直接格納できる。


%index
DSA_DeleteAllItems
動的構造体配列 (DSA) からすべての項目を削除する。
%prm
hdsa
hdsa : [intptr] 型: HDSA 既存の DSA へのハンドル。
%inst
動的構造体配列 (DSA) からすべての項目を削除する。

[戻り値]
型: BOOL 項目が正常に削除された場合は TRUE、それ以外は FALSE を返す。


%index
DSA_DeleteItem
動的構造体配列 (DSA) から項目を削除する。
%prm
hdsa, i
hdsa : [intptr] 型: HDSA 既存の DSA へのハンドル。
i : [int] 型: int 削除する項目のゼロから始まるインデックス。
%inst
動的構造体配列 (DSA) から項目を削除する。

[戻り値]
型: BOOL 項目が正常に削除された場合は TRUE、それ以外は FALSE を返す。

[備考]
DSA_DeleteItem は名前でエクスポートされていない。使用するには、GetProcAddress を使用して
ComCtl32.dll から序数 326 を要求し、関数ポインタを取得する必要がある。


%index
DSA_DestroyCallback
動的構造体配列 (DSA) を列挙し、各項目に対して指定されたコールバック関数を呼び出す。配列の末尾に達したら DSA を解放する。
%prm
hdsa, pfnCB, pData
hdsa : [intptr] 型: HDSA 走査して破棄する DSA へのハンドル。
pfnCB : [int] 型: PFNDSAENUMCALLBACK コールバック関数へのポインタ。コールバック関数のプロトタイプについては PFNDSAENUMCALLBACK を参照。
pData : [intptr] 型: void* コールバックデータへのポインタ。このポインタは pfnCB にパラメータとして渡される。
%inst
動的構造体配列 (DSA) を列挙し、各項目に対して指定されたコールバック関数を呼び出す。配列の末尾に達したら DSA を解放する。


%index
DSA_EnumCallback
動的構造体配列 (DSA) を列挙し、各項目に対して pfnCB を呼び出す。
%prm
hdsa, pfnCB, pData
hdsa : [intptr] 型: HDSA 既存の DSA へのハンドル。
pfnCB : [int] 型: PFNDAENUMCALLBACK* コールバック関数へのポインタ。コールバック関数のプロトタイプについては PFNDSAENUMCALLBACK を参照。
pData : [intptr] 型: void* コールバックデータへのポインタ。pData は pfnCB にパラメータとして渡される。
%inst
動的構造体配列 (DSA) を列挙し、各項目に対して pfnCB を呼び出す。


%index
DSA_GetItem
動的構造体配列 (DSA) から要素を取得する。
%prm
hdsa, i, pitem
hdsa : [intptr] 型: HDSA 要素を含む DSA へのハンドル。
i : [int] 型: int 取得する要素のインデックス（ゼロから始まる）。
pitem : [intptr] 型: void* DSA の指定された要素のコピーを格納するバッファへのポインタ。
%inst
動的構造体配列 (DSA) から要素を取得する。

[戻り値]
型: BOOL 成功した場合は TRUE を、失敗した場合は FALSE を返す。

[備考]
DSA_GetItem は名前でエクスポートされていない。使用するには、GetProcAddress を使用して ComCtl32.dll
から序数 322
を要求し、関数ポインタを取得する必要がある。この関数で取得した要素ポインタを使用して、その要素のデータを直接変更できる。ただし、その後の挿入や破棄操作によって、このポインタ値が無効になったり、別の要素を指すようになる可能性があることに注意。


%index
DSA_GetItemPtr
動的構造体配列 (DSA) から要素へのポインタを取得する。
%prm
hdsa, i
hdsa : [intptr] 型: HDSA 要素を含む DSA へのハンドル。
i : [int] 型: int 取得する要素のインデックス（ゼロから始まる）。
%inst
動的構造体配列 (DSA) から要素へのポインタを取得する。

[戻り値]
指定された要素へのポインタを返し、呼び出しが失敗した場合は NULL を返す。

[備考]

この関数が返す要素ポインタを使用して、その要素のデータを直接変更できる。ただし、その後の挿入や破棄操作によって、このポインタ値が無効になったり、別の要素を指すようになる可能性があることに注意。


%index
DSA_InsertItem
動的構造体配列 (DSA) に新しい項目を挿入する。必要に応じて DSA は新しい項目を収めるために拡張される。
%prm
hdsa, i, pitem
hdsa : [intptr] 型: HDSA 項目を挿入する DSA へのハンドル。
i : [int] 型: int 新しい項目を挿入する DSA 内の位置。配列の末尾に項目を挿入するには DSA_APPEND を指定する。
pitem : [intptr] 型: void* 挿入する項目へのポインタ。
%inst
動的構造体配列 (DSA) に新しい項目を挿入する。必要に応じて DSA は新しい項目を収めるために拡張される。

[戻り値]
型: int 挿入が成功した場合は新しい項目のインデックスを返し、失敗した場合は DSA_ERR (-1) を返す。

[備考]
pItem が指す実際のデータは DSA にコピーされる。そのため、元の項目に対する後続の操作はコピーに影響しない。


%index
DSA_SetItem
動的構造体配列 (DSA) の要素の内容を設定する。
%prm
hdsa, i, pitem
hdsa : [intptr] 型: HDSA 要素を含む既存の DSA へのハンドル。
i : [int] 型: int 設定する項目のゼロから始まるインデックス。
pitem : [intptr] 型: void* 配列内の指定された項目を置き換える項目へのポインタ。
%inst
動的構造体配列 (DSA) の要素の内容を設定する。

[戻り値]
型: BOOL 成功した場合は TRUE、失敗した場合は FALSE を返す。

[備考]
DSA_SetItem は名前でエクスポートされていない。使用するには、GetProcAddress を使用して ComCtl32.dll
から序数 325 を要求し、関数ポインタを取得する必要がある。


%index
DefSubclassProc
ウィンドウのサブクラスチェーン内の次のハンドラを呼び出す。サブクラスチェーンの最後のハンドラは、そのウィンドウの元のウィンドウプロシージャを呼び出す。
%prm
hWnd, uMsg, wParam, lParam
hWnd : [intptr] 型: HWND サブクラス化されているウィンドウへのハンドル。
uMsg : [int] 型: UINT ウィンドウメッセージを指定する unsigned int 型の値。
wParam : [intptr] 型: WPARAM 追加のメッセージ情報を指定する。このパラメータの内容はウィンドウメッセージの値に依存する。
lParam : [intptr] 型: LPARAM 追加のメッセージ情報を指定する。このパラメータの内容はウィンドウメッセージの値に依存する。メモ: 64 ビット版 Windows では LPARAM は 64 ビット値である。
%inst

ウィンドウのサブクラスチェーン内の次のハンドラを呼び出す。サブクラスチェーンの最後のハンドラは、そのウィンドウの元のウィンドウプロシージャを呼び出す。

[戻り値]
型: LRESULT 戻り値は送信されたメッセージに固有である。この値は無視すべきである。

[備考]
既定のウィンドウプロシージャを自分で呼び出す必要はない。この関数が自動的に呼び出す。SUBCLASS
モジュールは、ウィンドウのサブクラス化に使用されるヘルパー関数を定義している。このコードはサブクラス化されたウィンドウに単一のプロパティを保持し、必要に応じて各種サブクラスコールバックをクライアントにディスパッチする。クライアントには参照データと既定処理
API が提供される。サブクラスコールバックは、コールバック関数ポインタと符号なし ID
値の一意の組み合わせで識別される。各コールバックは DWORD 1
個分の参照データを保持でき、メッセージをフィルタするために呼び出されたときにコールバック関数に渡される。コールバックに対して参照カウントは行われない。SetWindowSubclass
を繰り返し呼び出して参照データ要素の値を変更してもよい。警告:
サブクラスヘルパー関数を使用してスレッドをまたいでウィンドウをサブクラス化することはできない。


%index
DrawInsert
指定されたドラッグリストボックスの親ウィンドウに挿入アイコンを描画する。
%prm
handParent, hLB, nItem
handParent : [intptr] 型: HWND ドラッグリストボックスの親ウィンドウへのハンドル。
hLB : [intptr] 型: HWND ドラッグリストボックスへのハンドル。
nItem : [int] 型: int 描画するアイコン項目の識別子。
%inst
指定されたドラッグリストボックスの親ウィンドウに挿入アイコンを描画する。


%index
DrawStatusTextW
DrawStatusText 関数は、境界線付きのステータスウィンドウのスタイルで指定されたテキストを描画する。(Unicode)
%prm
hDC, lprc, pszText, uFlags
hDC : [intptr] 型: HDC ウィンドウの表示コンテキストへのハンドル。
lprc : [var] 型: LPCRECT テキストを描画する矩形の位置（クライアント座標）を含む RECT 構造体へのポインタ。関数は指定された矩形の縁のすぐ内側に境界線を描画する。
pszText : [wstr] 型: LPCTSTR 表示するテキストを指定する NULL 終端文字列へのポインタ。文字列中のタブ文字によって、文字列が左揃え・右揃え・中央揃えのいずれになるかが決まる。
uFlags : [int] 型: UINT テキスト描画フラグ。このパラメータには次の値の組み合わせを指定できる。
%inst
DrawStatusText 関数は、境界線付きのステータスウィンドウのスタイルで指定されたテキストを描画する。(Unicode)

[備考]
通常のウィンドウはテキストを左から右 (LTR) に表示する。ヘブライ語やアラビア語のように右から左 (RTL)
に読む言語を表示するためにウィンドウをミラーリングすることもできる。通常、pszText
文字列は親ウィンドウのテキストと同じ方向に表示される。SBT_RTLREADING が設定されている場合、pszText
文字列は親ウィンドウのテキストとは逆方向に読まれる。
> [!NOTE] > commctrl.h ヘッダは DrawStatusText をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて ANSI または Unicode
版を自動的に選択する。エンコーディング中立でないコードと中立エイリアスを混在させると、コンパイルまたは実行時エラーにつながる不整合が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
FlatSB_EnableScrollBar
フラットスクロールバーの片方または両方の方向ボタンを有効または無効にする。ウィンドウに対してフラットスクロールバーが初期化されていない場合、この関数は標準の EnableScrollBar 関数を呼び出す。
%prm
param0, param1, param2
param0 : [intptr] 
param1 : [int] 
param2 : [int] 
%inst

フラットスクロールバーの片方または両方の方向ボタンを有効または無効にする。ウィンドウに対してフラットスクロールバーが初期化されていない場合、この関数は標準の
EnableScrollBar 関数を呼び出す。

[戻り値]
型: BOOL スクロールバーが変更された場合は 0 以外を、それ以外は 0 を返す。

[備考]
メモ: フラットスクロールバー関数は Comctl32.dll バージョン 4.71 から 5.82
で実装されている。Comctl32.dll バージョン 6.00 以降ではフラットスクロールバーはサポートされない。


%index
FlatSB_GetScrollInfo
フラットスクロールバーの情報を取得する。ウィンドウに対してフラットスクロールバーが初期化されていない場合、この関数は標準の GetScrollInfo 関数を呼び出す。
%prm
param0, code, param2
param0 : [intptr] 
code : [int] 型: int
param2 : [var] 
%inst
フラットスクロールバーの情報を取得する。ウィンドウに対してフラットスクロールバーが初期化されていない場合、この関数は標準の
GetScrollInfo 関数を呼び出す。

[戻り値]
型: BOOL 成功した場合は 0 以外を、失敗した場合は 0 を返す。

[備考]
メモ: フラットスクロールバー関数は Comctl32.dll バージョン 4.71 から 5.82
で実装されている。Comctl32.dll バージョン 6.00 以降ではフラットスクロールバーはサポートされない。


%index
FlatSB_GetScrollPos
フラットスクロールバー内のつまみの位置を取得する。ウィンドウに対してフラットスクロールバーが初期化されていない場合、この関数は標準の GetScrollPos 関数を呼び出す。
%prm
param0, code
param0 : [intptr] 
code : [int] 型: int
%inst
フラットスクロールバー内のつまみの位置を取得する。ウィンドウに対してフラットスクロールバーが初期化されていない場合、この関数は標準の
GetScrollPos 関数を呼び出す。

[戻り値]
型: int 指定されたフラットスクロールバーの現在のつまみの位置を返す。

[備考]
メモ: フラットスクロールバー関数は Comctl32.dll バージョン 4.71 から 5.82
で実装されている。Comctl32.dll バージョン 6.00 以降ではフラットスクロールバーはサポートされない。


%index
FlatSB_GetScrollProp
フラットスクロールバーのプロパティを取得する。この関数は、このウィンドウに対して InitializeFlatSB が呼び出されているかどうかの判定にも使用できる。
%prm
param0, propIndex, param2
param0 : [intptr] 
propIndex : [int] 型: UINT 何を取得するかを決定するパラメータ。
param2 : [var] 
%inst
フラットスクロールバーのプロパティを取得する。この関数は、このウィンドウに対して InitializeFlatSB
が呼び出されているかどうかの判定にも使用できる。

[戻り値]
型: BOOL 成功した場合は 0 以外を、失敗した場合は 0 を返す。index が WSB_PROP_HSTYLE
の場合、このウィンドウに対して InitializeFlatSB が呼び出されていれば 0 以外を、そうでなければ 0 を返す。

[備考]
メモ: フラットスクロールバー関数は Comctl32.dll バージョン 4.71 から 5.82
で実装されている。Comctl32.dll バージョン 6.00 以降ではフラットスクロールバーはサポートされない。


%index
FlatSB_GetScrollRange
フラットスクロールバーのスクロール範囲を取得する。ウィンドウに対してフラットスクロールバーが初期化されていない場合、この関数は標準の GetScrollRange 関数を呼び出す。
%prm
param0, code, param2, param3
param0 : [intptr] 
code : [int] 型: int
param2 : [var] 
param3 : [var] 
%inst
フラットスクロールバーのスクロール範囲を取得する。ウィンドウに対してフラットスクロールバーが初期化されていない場合、この関数は標準の
GetScrollRange 関数を呼び出す。

[戻り値]
型: BOOL 成功した場合は 0 以外を、失敗した場合は 0 を返す。

[備考]
メモ: フラットスクロールバー関数は Comctl32.dll バージョン 4.71 から 5.82
で実装されている。Comctl32.dll バージョン 6.00 以降ではフラットスクロールバーはサポートされない。


%index
FlatSB_SetScrollInfo
フラットスクロールバーの情報を設定する。ウィンドウに対してフラットスクロールバーが初期化されていない場合、この関数は標準の SetScrollInfo 関数を呼び出す。
%prm
param0, code, psi, fRedraw
param0 : [intptr] 
code : [int] 型: int
psi : [var] 型: LPSCROLLINFO 指定されたスクロールバーの新しい情報を含む SCROLLINFO 構造体へのポインタ。cbSize と
fRedraw : [int] 型: BOOL 変更を反映するためにスクロールバーをただちに再描画するかどうかを指定する。このパラメータが TRUE の場合はスクロールバーが再描画され、FALSE の場合は再描画されない。
%inst
フラットスクロールバーの情報を設定する。ウィンドウに対してフラットスクロールバーが初期化されていない場合、この関数は標準の
SetScrollInfo 関数を呼び出す。

[戻り値]
型: int 現在のスクロール位置を返す。FlatSB_SetScrollInfo
の呼び出しによってスクロール位置が変更された場合、変更前の位置が返される。

[備考]
メモ: フラットスクロールバー関数は Comctl32.dll バージョン 4.71 から 5.82
で実装されている。Comctl32.dll バージョン 6.00 以降ではフラットスクロールバーはサポートされない。


%index
FlatSB_SetScrollPos
フラットスクロールバー内のつまみの現在位置を設定する。ウィンドウに対してフラットスクロールバーが初期化されていない場合、この関数は標準の SetScrollPos 関数を呼び出す。
%prm
param0, code, pos, fRedraw
param0 : [intptr] 
code : [int] 型: int
pos : [int] 型: int 新しいつまみの位置。
fRedraw : [int] 型: BOOL 変更を反映するためにスクロールバーをただちに再描画するかどうかを指定する。このパラメータが TRUE の場合はスクロールバーが再描画され、FALSE の場合は再描画されない。
%inst
フラットスクロールバー内のつまみの現在位置を設定する。ウィンドウに対してフラットスクロールバーが初期化されていない場合、この関数は標準の
SetScrollPos 関数を呼び出す。

[戻り値]
型: int 指定されたフラットスクロールバーにおけるつまみの変更前の位置を返す。

[備考]
メモ: フラットスクロールバー関数は Comctl32.dll バージョン 4.71 から 5.82
で実装されている。Comctl32.dll バージョン 6.00 以降ではフラットスクロールバーはサポートされない。


%index
FlatSB_SetScrollProp
フラットスクロールバーのプロパティを設定する。
%prm
param0, index, newValue, param3
param0 : [intptr] 
index : [int] 型: UINT 何を設定するかを決定する。
newValue : [int] 型: INT_PTR 設定する新しい値。このパラメータは index に渡されたフラグに依存する。
param3 : [int] 
%inst
フラットスクロールバーのプロパティを設定する。

[戻り値]
型: BOOL 成功した場合は 0 以外を、失敗した場合は 0 を返す。

[備考]
メモ: フラットスクロールバー関数は Comctl32.dll バージョン 4.71 から 5.82
で実装されている。Comctl32.dll バージョン 6.00 以降ではフラットスクロールバーはサポートされない。


%index
FlatSB_SetScrollRange
フラットスクロールバーのスクロール範囲を設定する。ウィンドウに対してフラットスクロールバーが初期化されていない場合、この関数は標準の SetScrollRange 関数を呼び出す。
%prm
param0, code, min, max, fRedraw
param0 : [intptr] 
code : [int] 型: int
min : [int] 型: int 新しいスクロール範囲の最小値。
max : [int] 型: int 新しいスクロール範囲の最大値。
fRedraw : [int] 型: BOOL 変更を反映するためにスクロールバーをただちに再描画するかどうかを指定する。このパラメータが TRUE の場合はスクロールバーが再描画され、FALSE の場合は再描画されない。
%inst
フラットスクロールバーのスクロール範囲を設定する。ウィンドウに対してフラットスクロールバーが初期化されていない場合、この関数は標準の
SetScrollRange 関数を呼び出す。

[戻り値]
型: int 成功した場合は 0 以外を、失敗した場合は 0 を返す。

[備考]
メモ: フラットスクロールバー関数は Comctl32.dll バージョン 4.71 から 5.82
で実装されている。Comctl32.dll バージョン 6.00 以降ではフラットスクロールバーはサポートされない。


%index
FlatSB_ShowScrollBar
フラットスクロールバーを表示または非表示にする。ウィンドウに対してフラットスクロールバーが初期化されていない場合、この関数は標準の ShowScrollBar 関数を呼び出す。
%prm
param0, code, param2
param0 : [intptr] 
code : [int] 型: int
param2 : [int] 
%inst
フラットスクロールバーを表示または非表示にする。ウィンドウに対してフラットスクロールバーが初期化されていない場合、この関数は標準の
ShowScrollBar 関数を呼び出す。

[戻り値]
型: BOOL 成功した場合は 0 以外を、失敗した場合は 0 を返す。

[備考]
メモ: フラットスクロールバー関数は Comctl32.dll バージョン 4.71 から 5.82
で実装されている。Comctl32.dll バージョン 6.00 以降ではフラットスクロールバーはサポートされない。


%index
GetEffectiveClientRect
指定されたすべてのコントロールを含む、クライアント領域内の矩形の寸法を計算する。
%prm
hWnd, lprc, lpInfo
hWnd : [intptr] 型: HWND 確認するクライアント領域を持つウィンドウへのハンドル。
lprc : [var] 型: LPRECT 矩形の寸法を受け取る RECT 構造体へのポインタ。
lpInfo : [var] 型: const INT* クライアント領域内のコントロールを識別する整数の NULL 終端配列へのポインタ。各コントロールは 2 個連続した要素を必要とする。各ペアの最初の要素は 0 以外でなければならず、2 番目の要素はコントロール識別子でなければならない。最初のペアはメニューを表し、無視される。配列の終端を示すために最後の要素は 0 でなければならない。
%inst
指定されたすべてのコントロールを含む、クライアント領域内の矩形の寸法を計算する。

[備考]
lprc
配列内のウィンドウが表示されている場合、または親が表示状態になったときに表示される場合、その矩形は有効なクライアント矩形から差し引かれる。


%index
GetMUILanguage
特定のプロセスに対してコモンコントロールが現在使用している言語を取得する。
%prm

%inst
特定のプロセスに対してコモンコントロールが現在使用している言語を取得する。

[戻り値]
型: LANGID アプリケーションが InitMUILanguage
を呼び出してコモンコントロール用に指定した言語の言語識別子を返す。GetMUILanguage
は、呼び出し元のプロセスに対する値を返す。InitMUILanguage
が呼び出されていない場合、または同じプロセスから呼び出されていない場合、GetMUILanguage は言語中立の LANGID である
MAKELANGID(LANG_NEUTRAL, SUBLANG_NEUTRAL) を返す。

[備考]
ローカライズの詳細については、Windows アプリケーションの国際化を参照。


%index
ImageList_Add
イメージリストに 1 つ以上のイメージを追加する。(ImageList_Add)
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
ImageList_AddMasked
指定されたビットマップからマスクを生成しながら、イメージリストに画像を追加する。(ImageList_AddMasked)
%prm
himl, hbmImage, crMask
himl : [intptr] 型: HIMAGELIST イメージリストへのハンドル。
hbmImage : [intptr] 型: HBITMAP 1 つ以上の画像を含むビットマップへのハンドル。画像の個数はビットマップの幅から推測される。
crMask : [int] 型: COLORREF マスクの生成に使用する色。指定されたビットマップのこの色の各ピクセルは黒に変更され、対応するマスクのビットが 1 に設定される。このパラメータが CLR_DEFAULT の場合、座標 (0,0) のピクセルの色がマスクとして使用される。
%inst
指定されたビットマップからマスクを生成しながら、イメージリストに画像を追加する。(ImageList_AddMasked)

[戻り値]
型: int 成功した場合は最初の新しい画像のインデックスを返し、それ以外は -1 を返す。

[備考]
ImageList_AddMasked 関数は、ビットマップを内部データ構造にコピーする。8bpp
を超える色深度のビットマップはサポートされない。関数が戻った後は、DeleteObject 関数を使って必ず hbmImage
を削除すること。


%index
ImageList_BeginDrag
画像のドラッグを開始する。(ImageList_BeginDrag)
%prm
himlTrack, iTrack, dxHotspot, dyHotspot
himlTrack : [intptr] 型: HIMAGELIST イメージリストへのハンドル。
iTrack : [int] 型: int ドラッグする画像のインデックス。
dxHotspot : [int] 型: int 画像の左上隅に対するドラッグ位置の x 座標。
dyHotspot : [int] 型: int 画像の左上隅に対するドラッグ位置の y 座標。
%inst
画像のドラッグを開始する。(ImageList_BeginDrag)

[戻り値]
型: BOOL 成功した場合は 0 以外を、失敗した場合は 0 を返す。

[備考]
この関数は、ドラッグに使用される一時的なイメージリストを作成する。その後の WM_MOUSEMOVE
メッセージに応答して、ImageList_DragMove
関数を使用してドラッグ画像を移動できる。ドラッグ操作を終了するには、ImageList_EndDrag 関数を使用する。


%index
ImageList_Copy
指定されたイメージリスト内で画像をコピーする。
%prm
himlDst, iDst, himlSrc, iSrc, uFlags
himlDst : [intptr] 型: HIMAGELIST コピー操作の対象となるイメージリストへのハンドル。現在のバージョンの Windows では、himlDst と himlSrc は同一でなければならない。
iDst : [int] 型: int コピー操作のコピー先として使用される画像のゼロから始まるインデックス。
himlSrc : [intptr] 型: HIMAGELIST コピー操作の対象となるイメージリストへのハンドル。現在のバージョンの Windows では、himlDst と himlSrc は同一でなければならない。
iSrc : [int] 型: int コピー操作のコピー元として使用される画像のゼロから始まるインデックス。
uFlags : [int] 型: UINT
%inst
指定されたイメージリスト内で画像をコピーする。

[戻り値]
型: BOOL 成功した場合は 0 以外を、失敗した場合は 0 を返す。


%index
ImageList_Create
新しいイメージリストを作成する。
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
ImageList_DragEnter
ウィンドウ内の指定された位置にドラッグ画像を表示する。
%prm
hwndLock, x, y
hwndLock : [intptr] 型: HWND ドラッグ画像を所有するウィンドウへのハンドル。
x : [int] 型: int ドラッグ画像を表示する x 座標。座標はウィンドウの左上隅を基準とし、クライアント領域ではない。
y : [int] 型: int ドラッグ画像を表示する y 座標。座標はウィンドウの左上隅を基準とし、クライアント領域ではない。
%inst
ウィンドウ内の指定された位置にドラッグ画像を表示する。

[戻り値]
型: BOOL 成功した場合は 0 以外を、失敗した場合は 0 を返す。

[備考]
ドラッグ操作を開始するには、ImageList_BeginDrag 関数を使用する。


%index
ImageList_DragLeave
指定されたウィンドウのロックを解除し、ドラッグ画像を非表示にして、ウィンドウを更新できるようにする。
%prm
hwndLock
hwndLock : [intptr] 型: HWND ドラッグ画像を所有するウィンドウへのハンドル。
%inst
指定されたウィンドウのロックを解除し、ドラッグ画像を非表示にして、ウィンドウを更新できるようにする。

[戻り値]
型: BOOL 成功した場合は 0 以外を、失敗した場合は 0 を返す。


%index
ImageList_DragMove
ドラッグアンドドロップ操作中にドラッグされている画像を移動する。この関数は通常、WM_MOUSEMOVE メッセージへの応答として呼び出される。(ImageList_DragMove)
%prm
x, y
x : [int] 型: int ドラッグ画像を表示する x 座標。座標はウィンドウの左上隅を基準とし、クライアント領域ではない。
y : [int] 型: int ドラッグ画像を表示する y 座標。座標はウィンドウの左上隅を基準とし、クライアント領域ではない。
%inst
ドラッグアンドドロップ操作中にドラッグされている画像を移動する。この関数は通常、WM_MOUSEMOVE
メッセージへの応答として呼び出される。(ImageList_DragMove)

[戻り値]
型: BOOL 成功した場合は 0 以外を、失敗した場合は 0 を返す。

[備考]
ドラッグ操作を開始するには、ImageList_BeginDrag 関数を使用する。


%index
ImageList_DragShowNolock
ドラッグされている画像を表示または非表示にする。(ImageList_DragShowNolock)
%prm
fShow
fShow : [int] 型: BOOL ドラッグされている画像を表示するか非表示にするかを指定する値。画像を表示するには TRUE を、非表示にするには FALSE を指定する。
%inst
ドラッグされている画像を表示または非表示にする。(ImageList_DragShowNolock)

[戻り値]
型: BOOL 成功した場合は 0 以外を、失敗した場合は 0 を返す。


%index
ImageList_Draw
指定したデバイスコンテキストにイメージリスト項目を描画する。(ImageList_Draw)
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
ImageList_DrawEx
指定されたデバイスコンテキストにイメージリストの項目を描画する。この関数は指定された描画スタイルを使用し、画像を指定された色とブレンドする。
%prm
himl, i, hdcDst, x, y, dx, dy, rgbBk, rgbFg, fStyle
himl : [intptr] 型: HIMAGELIST イメージリストへのハンドル。
i : [int] 型: int 描画する画像のインデックス。
hdcDst : [intptr] 型: HDC コピー先のデバイスコンテキストへのハンドル。
x : [int] 型: int 指定されたデバイスコンテキスト内で描画する x 座標。
y : [int] 型: int 指定されたデバイスコンテキスト内で描画する y 座標。
dx : [int] 型: int 画像の左上隅を基準とした、描画する画像の部分の幅。dx と dy が 0 の場合、関数は画像全体を描画する。この関数はパラメータの妥当性を保証しない。
dy : [int] 型: int 画像の左上隅を基準とした、描画する画像の部分の高さ。dx と dy が 0 の場合、関数は画像全体を描画する。この関数はパラメータの妥当性を保証しない。
rgbBk : [int] 型: COLORREF
rgbFg : [int] 型: COLORREF
fStyle : [int] 型: UINT
%inst

指定されたデバイスコンテキストにイメージリストの項目を描画する。この関数は指定された描画スタイルを使用し、画像を指定された色とブレンドする。

[戻り値]
型: BOOL 成功した場合は 0 以外を、失敗した場合は 0 を返す。

[備考]
オーバーレイ画像は、i パラメータで指定されたプライマリ画像の上に透過的に描画される。fStyle
パラメータでオーバーレイ画像を指定するには、INDEXTOOVERLAYMASK マクロを使用してオーバーレイ画像の 1
から始まるインデックスをシフトする。OR 演算子を使用して、マクロの戻り値を fStyle
パラメータで指定された描画スタイルフラグと論理的に結合する。この画像は、あらかじめ ImageList_SetOverlayImage
関数を使用してオーバーレイ画像として指定しておく必要がある。


%index
ImageList_DrawIndirect
IMAGELISTDRAWPARAMS 構造体に基づいてイメージリストの画像を描画する。
%prm
pimldp
pimldp : [var] 型: IMAGELISTDRAWPARAMS* 描画操作に関する情報を含む IMAGELISTDRAWPARAMS 構造体へのポインタ。
%inst
IMAGELISTDRAWPARAMS 構造体に基づいてイメージリストの画像を描画する。

[戻り値]
型: BOOL 成功した場合は 0 以外を、失敗した場合は 0 を返す。


%index
ImageList_Duplicate
既存のイメージリストの複製を作成する。
%prm
himl
himl : [intptr] 型: HIMAGELIST 複製するイメージリストへのハンドル。元のイメージリストに含まれる通常画像のすべての情報が新しいイメージリストにコピーされる。オーバーレイ画像はコピーされない。
%inst
既存のイメージリストの複製を作成する。

[戻り値]
型: HIMAGELIST 成功した場合は新しい複製イメージリストへのハンドルを返し、それ以外は NULL を返す。


%index
ImageList_EndDrag
ドラッグ操作を終了する。(ImageList_EndDrag)
%prm

%inst
ドラッグ操作を終了する。(ImageList_EndDrag)

[備考]
ImageList_EndDrag
関数が呼び出されると、一時的なイメージリストが破棄される。ドラッグ操作を開始するには、ImageList_BeginDrag
関数を使用する。


%index
ImageList_GetBkColor
イメージリストの現在の背景色を取得する。
%prm
himl
himl : [intptr] 型: HIMAGELIST イメージリストへのハンドル。
%inst
イメージリストの現在の背景色を取得する。

[戻り値]
型: COLORREF 戻り値は背景色である。


%index
ImageList_GetDragImage
ドラッグ画像に使用される一時的なイメージリストを取得する。この関数は、現在のドラッグ位置とドラッグ位置に対するドラッグ画像のオフセットも取得する。
%prm
ppt, pptHotspot
ppt : [var] 型: POINT* 現在のドラッグ位置を受け取る POINT 構造体へのポインタ。NULL を指定できる。
pptHotspot : [var] 型: POINT* ドラッグ位置に対するドラッグ画像のオフセットを受け取る POINT 構造体へのポインタ。NULL を指定できる。
%inst

ドラッグ画像に使用される一時的なイメージリストを取得する。この関数は、現在のドラッグ位置とドラッグ位置に対するドラッグ画像のオフセットも取得する。

[戻り値]
型: HIMAGELIST 成功した場合はイメージリストへのハンドルを返し、それ以外は NULL を返す。

[備考]
ImageList_EndDrag
関数が呼び出されると、一時的なイメージリストが破棄される。ドラッグ操作を開始するには、ImageList_BeginDrag
関数を使用する。


%index
ImageList_GetIcon
イメージリスト内の画像とマスクからアイコンを作成する。
%prm
himl, i, flags
himl : [intptr] 型: HIMAGELIST イメージリストへのハンドル。
i : [int] 型: int 画像のインデックス。
flags : [int] 型: UINT 描画スタイルを指定するフラグの組み合わせ。値の一覧については、ImageList_Draw 関数の fStyle パラメータの説明を参照。
%inst
イメージリスト内の画像とマスクからアイコンを作成する。

[戻り値]
型: HICON 成功した場合はアイコンへのハンドルを返し、それ以外は NULL を返す。

[備考]
この関数から返されたアイコンを破棄するのは、呼び出し側アプリケーションの責任である。DestroyIcon 関数を使用して破棄する。


%index
ImageList_GetIconSize
イメージリスト内の画像の寸法を取得する。イメージリスト内のすべての画像は同じ寸法を持つ。
%prm
himl, cx, cy
himl : [intptr] 型: HIMAGELIST イメージリストへのハンドル。
cx : [var] 型: int* 各画像の幅（ピクセル単位）を受け取る整数変数へのポインタ。
cy : [var] 型: int* 各画像の高さ（ピクセル単位）を受け取る整数変数へのポインタ。
%inst
イメージリスト内の画像の寸法を取得する。イメージリスト内のすべての画像は同じ寸法を持つ。

[戻り値]
型: BOOL 成功した場合は 0 以外を、失敗した場合は 0 を返す。


%index
ImageList_GetImageCount
イメージリスト内のイメージ数を取得する。
%prm
himl
himl : [intptr] 型: HIMAGELIST イメージリストへのハンドル。
%inst
イメージリスト内のイメージ数を取得する。

[戻り値]
型: int イメージ数を返す。


%index
ImageList_GetImageInfo
画像に関する情報を取得する。
%prm
himl, i, pImageInfo
himl : [intptr] 型: HIMAGELIST イメージリストへのハンドル。
i : [int] 型: int 画像のインデックス。
pImageInfo : [var] 型: IMAGEINFO* 画像に関する情報を受け取る IMAGEINFO 構造体へのポインタ。この構造体の情報を使用して、画像のビットマップを直接操作できる。
%inst
画像に関する情報を取得する。

[戻り値]
型: BOOL 成功した場合は 0 以外を、失敗した場合は 0 を返す。

[備考]
アプリケーションは、ImageList_GetImageInfo で取得したビットマップを破棄するために DeleteObject
を呼び出してはならない。アプリケーションが ImageList_Destroy 関数を呼び出したときに、システムがビットマップを破棄する。


%index
ImageList_LoadImageW
指定されたビットマップからイメージリストを作成する。(Unicode)
%prm
hi, lpbmp, cx, cGrow, crMask, uType, uFlags
hi : [intptr] 型: HINSTANCE リソースを含むインスタンスへのハンドル。ファイルから画像を読み込む場合や OEM リソースを読み込む場合、このパラメータは NULL を指定できる。
lpbmp : [wstr] 型: LPCTSTR 読み込む画像。uFlags パラメータに LR_LOADFROMFILE が含まれている場合、lpbmp は読み込む画像を含むファイルの名前を表す NULL 終端文字列のアドレスである。hi パラメータが NULL でなく、LR_LOADFROMFILE が指定されていない場合、lpbmp は hi モジュール内の画像リソースの名前を含む NULL 終端文字列のアドレスである。hi が NULL で LR_LOADFROMFILE が指定されていない場合、このパラメータの LOWORD は読み込む OEM 画像の識別子でなければならない。この値を作成するには、Winuser.h で定義された OEM 画像識別子のいずれかを MAKEINTRESOURCE マクロで使用する。これらの識別子には次のプレフィックスが付いている。
cx : [int] 型: int 各画像の幅。各画像の高さと画像の初期個数は、指定されたリソースの寸法から推測される。
cGrow : [int] 型: int 新しい画像のための領域が必要になったときにイメージリストを拡張できる画像数。このパラメータは、サイズ変更後のイメージリストに含めることができる新しい画像の数を表す。
crMask : [int] 型: COLORREF マスクの生成に使用する色。指定されたビットマップ、カーソル、アイコンのこの色の各ピクセルは黒に変更され、対応するマスクのビットが 1 に設定される。このパラメータが CLR_NONE の場合、マスクは生成されない。このパラメータが CLR_DEFAULT の場合、画像の左上隅のピクセルの色がマスクの色として扱われる。
uType : [int] 型: UINT 読み込む画像の種類を指定するフラグ。このパラメータは、ビットマップを読み込むことを示すために IMAGE_BITMAP でなければならない。
uFlags : [int] 型: UINT
%inst
指定されたビットマップからイメージリストを作成する。(Unicode)

[戻り値]
型: HIMAGELIST 成功した場合はイメージリストへのハンドルを返し、それ以外は NULL を返す。

[備考]
LR_LOADTRANSPARENT は画像を透過的に読み込むわけではない。すべての背景ピクセルが COLOR_WINDOW
に変更されているために透過に見える不透明なイメージリストを作成する。画像が COLOR_WINDOW
以外の背景色の上に描画されると、画像は正しく描画されない。また、LR_LOADTRANSPARENT と
LR_LOADMAP3DCOLORS は、ImageList_LoadImage
が呼び出された時点で有効だったシステムカラーを使用する。その後システムカラーが変更された場合、アプリケーションは色を再マッピングするために画像を再読み込みする必要がある。
> [!NOTE] > commctrl.h ヘッダは ImageList_LoadImage
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に応じて ANSI または Unicode
版を自動的に選択する。エンコーディング中立でないコードと中立エイリアスを混在させると、コンパイルまたは実行時エラーにつながる不整合が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
ImageList_Merge
2 つの既存画像を結合して新しい画像を作成する。この関数は、画像を格納する新しいイメージリストも作成する。
%prm
himl1, i1, himl2, i2, dx, dy
himl1 : [intptr] 型: HIMAGELIST 1 つ目のイメージリストへのハンドル。
i1 : [int] 型: int 1 つ目の既存画像のインデックス。
himl2 : [intptr] 型: HIMAGELIST 2 つ目のイメージリストへのハンドル。
i2 : [int] 型: int 2 つ目の既存画像のインデックス。
dx : [int] 型: int 1 つ目の画像に対する 2 つ目の画像の x 方向のオフセット。
dy : [int] 型: int 1 つ目の画像に対する 2 つ目の画像の y 方向のオフセット。
%inst
2 つの既存画像を結合して新しい画像を作成する。この関数は、画像を格納する新しいイメージリストも作成する。

[戻り値]
型: HIMAGELIST 成功した場合は新しいイメージリストへのハンドルを返し、それ以外は NULL を返す。

[備考]
新しい画像は、2 つ目の既存画像が 1 つ目の上に透過的に描画されたものになる。新しい画像のマスクは、2 つの既存画像のマスクに対して論理
OR 演算を行った結果である。


%index
ImageList_Read
ストリームからイメージリストを読み込む。
%prm
pstm
pstm : [var] 型: LPSTREAM ストリームへのポインタ。
%inst
ストリームからイメージリストを読み込む。

[戻り値]
型: HIMAGELIST 成功した場合はイメージリストへのハンドルを返し、それ以外は NULL を返す。


%index
ImageList_Remove
イメージリストから画像を削除する。(ImageList_Remove)
%prm
himl, i
himl : [intptr] 型: HIMAGELIST イメージリストへのハンドル。
i : [int] 型: int 削除する画像のインデックス。このパラメータが -1 の場合、関数はすべての画像を削除する。
%inst
イメージリストから画像を削除する。(ImageList_Remove)

[戻り値]
型: BOOL 成功した場合は 0 以外を、失敗した場合は 0 を返す。

[備考]
画像が削除されると、画像インデックスが常にゼロからイメージリスト内の画像数より 1
少ない範囲に収まるように、残りの画像のインデックスが調整される。たとえば、インデックス 0 の画像を削除すると、画像 1 が画像 0
になり、画像 2 が画像 1 になる、というように続く。


%index
ImageList_Replace
イメージリスト内の画像を新しい画像に置き換える。(ImageList_Replace)
%prm
himl, i, hbmImage, hbmMask
himl : [intptr] 型: HIMAGELIST イメージリストへのハンドル。
i : [int] 型: int 置き換える画像のインデックス。
hbmImage : [intptr] 型: HBITMAP 画像を含むビットマップへのハンドル。
hbmMask : [intptr] 型: HBITMAP マスクを含むビットマップへのハンドル。イメージリストでマスクが使用されていない場合、このパラメータは無視される。
%inst
イメージリスト内の画像を新しい画像に置き換える。(ImageList_Replace)

[戻り値]
型: BOOL 成功した場合は 0 以外を、失敗した場合は 0 を返す。

[備考]
ImageList_Replace 関数は、ビットマップを内部データ構造にコピーする。関数が戻った後は、DeleteObject
関数を使って必ず hbmImage と hbmMask を削除すること。


%index
ImageList_ReplaceIcon
画像をアイコンまたはカーソルで置き換える。(ImageList_ReplaceIcon)
%prm
himl, i, hicon
himl : [intptr] 型: HIMAGELIST イメージリストへのハンドル。
i : [int] 型: int 置き換える画像のインデックス。i が -1 の場合、関数はリストの末尾に画像を追加する。
hicon : [intptr] 型: HICON 新しい画像のためのビットマップとマスクを含むアイコンまたはカーソルへのハンドル。
%inst
画像をアイコンまたはカーソルで置き換える。(ImageList_ReplaceIcon)

[戻り値]
型: int 成功した場合は画像のインデックスを返し、それ以外は -1 を返す。

[備考]
システムは hicon を保存しないため、アイコンまたはカーソルが CreateIcon
関数で作成されたものであれば、関数が戻った後に破棄できる。hicon が LoadIcon
関数で読み込まれたものであれば破棄する必要はない。システムは不要になったアイコンリソースを自動的に解放する。


%index
ImageList_SetBkColor
イメージリストの背景色を設定する。この関数は、アイコンを追加した場合、または白黒ビットマップで ImageList_AddMasked を使用した場合にのみ機能する。マスクがないと画像全体が描画されるため、背景色は見えない。
%prm
himl, clrBk
himl : [intptr] 型: HIMAGELIST イメージリストへのハンドル。
clrBk : [int] 型: COLORREF 設定する背景色。このパラメータに CLR_NONE 値を指定することもでき、その場合は画像がマスクを使用して透過的に描画される。
%inst
イメージリストの背景色を設定する。この関数は、アイコンを追加した場合、または白黒ビットマップで ImageList_AddMasked
を使用した場合にのみ機能する。マスクがないと画像全体が描画されるため、背景色は見えない。

[戻り値]
型: COLORREF 成功した場合は変更前の背景色を返し、それ以外は CLR_NONE を返す。


%index
ImageList_SetDragCursorImage
指定された画像（通常はマウスカーソル画像）を現在のドラッグ画像と結合して、新しいドラッグ画像を作成する。
%prm
himlDrag, iDrag, dxHotspot, dyHotspot
himlDrag : [intptr] 型: HIMAGELIST ドラッグ画像と結合する新しい画像を含むイメージリストへのハンドル。
iDrag : [int] 型: int ドラッグ画像と結合する新しい画像のインデックス。
dxHotspot : [int] 型: int 新しい画像内のホットスポットの x 座標。
dyHotspot : [int] 型: int 新しい画像内のホットスポットの y 座標。
%inst
指定された画像（通常はマウスカーソル画像）を現在のドラッグ画像と結合して、新しいドラッグ画像を作成する。

[戻り値]
型: BOOL 成功した場合は 0 以外を、失敗した場合は 0 を返す。


%index
ImageList_SetIconSize
イメージリスト内の画像の寸法を設定し、リストからすべての画像を削除する。(ImageList_SetIconSize)
%prm
himl, cx, cy
himl : [intptr] 型: HIMAGELIST イメージリストへのハンドル。
cx : [int] 型: int イメージリスト内の画像の幅（ピクセル単位）。イメージリスト内のすべての画像は同じ寸法を持つ。
cy : [int] 型: int イメージリスト内の画像の高さ（ピクセル単位）。イメージリスト内のすべての画像は同じ寸法を持つ。
%inst
イメージリスト内の画像の寸法を設定し、リストからすべての画像を削除する。(ImageList_SetIconSize)

[戻り値]
型: BOOL 成功した場合は 0 以外を、失敗した場合は 0 を返す。


%index
ImageList_SetImageCount
既存のイメージリストのサイズを変更する。(ImageList_SetImageCount)
%prm
himl, uNewCount
himl : [intptr] 型: HIMAGELIST サイズを変更するイメージリストへのハンドル。
uNewCount : [int] 型: UINT イメージリストの新しいサイズを指定する値。
%inst
既存のイメージリストのサイズを変更する。(ImageList_SetImageCount)

[戻り値]
型: BOOL 成功した場合は 0 以外を、失敗した場合は 0 を返す。

[備考]
アプリケーションがこの関数でイメージリストを拡張する場合、ImageList_Replace
関数を使用して新しい画像を追加する必要がある。アプリケーションが新しいインデックスに有効な画像を追加しない場合、新しいインデックスを使用する描画操作の結果は予測できない。この関数でイメージリストのサイズを小さくすると、切り捨てられた画像は解放される。


%index
ImageList_SetOverlayImage
オーバーレイマスクとして使用される画像のリストに、指定された画像を追加する。イメージリストはバージョン 4.70 以前で最大 4 個、バージョン 4.71 で最大 15 個のオーバーレイマスクを持つことができる。関数は指定された画像にオーバーレイマスクのインデックスを割り当てる。
%prm
himl, iImage, iOverlay
himl : [intptr] 型: HIMAGELIST イメージリストへのハンドル。
iImage : [int] 型: int himl イメージリスト内の画像のゼロから始まるインデックス。このインデックスはオーバーレイマスクとして使用する画像を識別する。
iOverlay : [int] 型: int オーバーレイマスクの 1 から始まるインデックス。
%inst
オーバーレイマスクとして使用される画像のリストに、指定された画像を追加する。イメージリストはバージョン 4.70 以前で最大 4
個、バージョン 4.71 で最大 15
個のオーバーレイマスクを持つことができる。関数は指定された画像にオーバーレイマスクのインデックスを割り当てる。

[戻り値]
型: BOOL 成功した場合は 0 以外を、失敗した場合は 0 を返す。

[備考]

オーバーレイマスクとは、別の画像の上に透過的に描画される画像のことである。画像の上にオーバーレイマスクを描画するには、ImageList_Draw
または ImageList_DrawEx 関数を呼び出す。これらの関数の fStyle
パラメータでは、INDEXTOOVERLAYMASK
マクロを使用してオーバーレイマスクのインデックスを指定できる。このメソッドは、イメージリストがマスク付きで作成されていない限り失敗し、E_INVALIDARG
を返す。


%index
ImageList_Write
ストリームにイメージリストを書き込む。(ImageList_Write)
%prm
himl, pstm
himl : [intptr] 型: HIMAGELIST イメージリストへのハンドル。
pstm : [var] 型: LPSTREAM ストリームへのポインタ。
%inst
ストリームにイメージリストを書き込む。(ImageList_Write)

[戻り値]
型: BOOL 成功した場合は 0 以外を、失敗した場合は 0 を返す。


%index
InitCommonControls
特定のコモンコントロールのウィンドウクラスを登録および初期化する。この関数は廃止されている。新しいアプリケーションは InitCommonControlsEx 関数を使用するべきである。
%prm

%inst
特定のコモンコントロールのウィンドウクラスを登録および初期化する。この関数は廃止されている。新しいアプリケーションは
InitCommonControlsEx 関数を使用するべきである。

[備考]
Comctl32.dll バージョン 5.x では、InitCommonControls を通じて登録できるのは Windows 95
クラス (ICC_WIN95_CLASSES)
のみである。追加のコモンコントロールクラスが必要なプログラムは、InitCommonControlsEx
関数を使用しなければならない。Comctl32.dll バージョン 6.0 以降では、InitCommonControls
は何も行わない。アプリケーションは InitCommonControlsEx
を通じてすべてのコモンコントロールを明示的に登録する必要がある。


%index
InitCommonControlsEx
コモンコントロール DLL(Comctl32.dll)がロードされていることを保証し、DLL から特定のコモンコントロールクラスを登録する。コモンコントロールを作成する前にアプリケーションはこの関数を呼ぶ必要がある。
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


%index
InitMUILanguage
アプリケーションが、システム言語とは異なる言語をコモンコントロールで使用することを指定できるようにする。
%prm
uiLang
uiLang : [int] 型: LANGID コモンコントロールで使用する言語の言語識別子。
%inst
アプリケーションが、システム言語とは異なる言語をコモンコントロールで使用することを指定できるようにする。

[備考]

この関数により、アプリケーションはシステムの言語設定をオーバーライドし、コモンコントロールに別の言語を指定できる。選択された言語は、InitMUILanguage
を呼び出したプロセスにのみ適用される。ローカライズの詳細については、Windows アプリケーションの国際化を参照。


%index
InitializeFlatSB
特定のウィンドウに対してフラットスクロールバーを初期化する。
%prm
param0
param0 : [intptr] 
%inst
特定のウィンドウに対してフラットスクロールバーを初期化する。

[戻り値]
型: BOOL 成功した場合は 0 以外を、失敗した場合は 0 を返す。

[備考]

この関数は、他のフラットスクロールバー関数が呼び出される前に呼び出さなければならない。ウィンドウは既定でフラットスクロールバーを受け取る。スクロールバーのスタイルは
FlatSB_SetScrollProp 関数で変更できる。メモ: フラットスクロールバー関数は Comctl32.dll バージョン
4.71 から 5.82 で実装されている。Comctl32.dll バージョン 6.00
以降ではフラットスクロールバーはサポートされない。


%index
LBItemFromPt
リストボックス内の指定された点にある項目のインデックスを取得する。
%prm
hLB, pt, bAutoScroll
hLB : [intptr] 型: HWND 調べるリストボックスへのハンドル。
pt : [int] 型: POINT 調べるスクリーン座標を含む POINT 構造体。
bAutoScroll : [int] 型: BOOL スクロールフラグ。このパラメータが TRUE で、指定された点がリストボックスの直上または直下にある場合、関数はリストボックスを 1 行スクロールして -1 を返す。それ以外の場合、関数はリストボックスをスクロールしない。
%inst
リストボックス内の指定された点にある項目のインデックスを取得する。

[戻り値]
型: int 点がリスト項目の上にある場合は項目識別子を返し、それ以外は -1 を返す。

[備考]
LBItemFromPt
関数は、前回スクロールしてから最小限の時間が経過している場合にのみリストボックスをスクロールする。このタイミング制御は、DL_DRAGGING
通知コードや WM_MOUSEMOVE
メッセージが処理されているときのように、関数が急速に繰り返し呼び出された場合にリストボックスが速くスクロールし過ぎるのを防ぐ。指定された点がリストボックスのクライアント領域の外にあり、かつ
bAutoScroll が TRUE の場合、関数は項目識別子を返す代わりにリストボックスをスクロールする。


%index
MakeDragList
指定された単一選択リストボックスをドラッグリストボックスに変更する。
%prm
hLB
hLB : [intptr] 型: HWND 単一選択リストボックスへのハンドル。
%inst
指定された単一選択リストボックスをドラッグリストボックスに変更する。

[戻り値]
型: BOOL 成功した場合は 0 以外を、失敗した場合は 0 を返す。


%index
MenuHelp
WM_MENUSELECT メッセージと WM_COMMAND メッセージを処理し、現在のメニューに関するヘルプテキストを指定されたステータスウィンドウに表示する。
%prm
uMsg, wParam, lParam, hMainMenu, hInst, hwndStatus, lpwIDs
uMsg : [int] 型: UINT 処理対象のメッセージ。WM_MENUSELECT または WM_COMMAND のいずれかを指定できる。
wParam : [intptr] 型: WPARAM uMsg で指定されたメッセージの wParam。
lParam : [intptr] 型: LPARAM uMsg で指定されたメッセージの lParam。
hMainMenu : [intptr] 型: HMENU アプリケーションのメインメニューへのハンドル。
hInst : [intptr] 型: HINSTANCE 文字列リソースを含むモジュールへのハンドル。
hwndStatus : [intptr] 型: HWND ステータスウィンドウへのハンドル。
lpwIDs : [var] 型: LPUINT 文字列リソース識別子とメニューハンドルのペアを含む値の配列へのポインタ。関数は選択されたメニューのハンドルを配列内で検索し、見つかった場合は対応するリソース識別子を使用して適切なヘルプ文字列を読み込む。
%inst
WM_MENUSELECT メッセージと WM_COMMAND
メッセージを処理し、現在のメニューに関するヘルプテキストを指定されたステータスウィンドウに表示する。

[備考]
MenuHelp 関数はヘルパー関数である。ヘルパー関数はプログラミングを容易にするために用意されている。頻繁に使用される一連の呼び出しを
1 回の呼び出しにまとめている。MenuHelp は WM_MENUSELECT メッセージと WM_COMMAND
メッセージを送信するために使用する。


%index
PropertySheetW
プロパティシートを作成し、指定されたプロパティシートヘッダ構造体で定義されたページを追加する。(Unicode)
%prm
param0
param0 : [var] 
%inst
プロパティシートを作成し、指定されたプロパティシートヘッダ構造体で定義されたページを追加する。(Unicode)

[戻り値]
型: INT_PTR モーダルプロパティシートの場合、戻り値は次のとおりである。
（以下省略）

[備考]
拡張エラー情報を取得するには GetLastError を呼び出す。プロパティシートに 100
ページ以上追加しようとすると、この関数は失敗するが、エラー原因は示されない。PropertySheet は -1
を返すが、GetLastError は 0 を返す。メモ: 以降の注意事項は、Aero ウィザードスタイル
(PSH_AEROWIZARD)
を使用しないウィザードおよびウィザードでないプロパティシートにのみ該当する。既定では、PropertySheet
関数はモーダルダイアログボックスを作成する。PROPSHEETHEADER 構造体の dwFlags メンバで PSH_MODELESS
フラグが指定されている場合、PropertySheet
はモードレスダイアログボックスを作成し、作成直後に戻る。この場合、PropertySheet
の戻り値はモードレスダイアログボックスのウィンドウハンドルである。モードレスプロパティシートの場合、メッセージループは
PSM_ISDIALOGMESSAGE
を使用してプロパティシートダイアログボックスにメッセージを渡す必要がある。メッセージループは、ダイアログボックスを破棄するタイミングを判断するために
PSM_GETCURRENTPAGEHWND を使用する必要がある。ユーザーが OK または Cancel
ボタンをクリックすると、PSM_GETCURRENTPAGEHWND は NULL を返す。その後、DestroyWindow
関数を使用してダイアログボックスを破棄できる。
バージョン 5.80。PropertySheet
の戻り値は、モーダルプロパティシートとモードレスプロパティシートで異なる情報を持つ。場合によっては、モードレスプロパティシートがモーダルであった場合に
PropertySheet から受け取るはずだった情報を必要とすることがある。特に、ID_PSREBOOTSYSTEM または
ID_PSRESTARTWINDOWS
が返されたはずかどうかを知る必要があるかもしれない。モードレスプロパティシートは、PSM_GETCURRENTPAGEHWND が
NULL を返すまで待ち、その後 PSM_GETRESULT メッセージを送信することで、モーダルプロパティシートが
PropertySheet から受け取るはずだった値を取得できる。
> [!NOTE] > prsht.h ヘッダは PropertySheet をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて ANSI または Unicode
版を自動的に選択する。エンコーディング中立でないコードと中立エイリアスを混在させると、コンパイルまたは実行時エラーにつながる不整合が生じる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
RemoveWindowSubclass
ウィンドウからサブクラスコールバックを削除する。
%prm
hWnd, pfnSubclass, uIdSubclass
hWnd : [intptr] 型: HWND サブクラス化されているウィンドウのハンドル。
pfnSubclass : [int] 型: SUBCLASSPROC ウィンドウプロシージャへのポインタ。このポインタとサブクラス ID によって、このサブクラスコールバックが一意に識別される。コールバック関数のプロトタイプについては SUBCLASSPROC を参照。
uIdSubclass : [int] 型: UINT_PTR UINT_PTR 型のサブクラス ID。この ID とコールバックポインタによって、このサブクラスコールバックが一意に識別される。メモ: 64 ビット版 Windows ではこれは 64 ビット値である。
%inst
ウィンドウからサブクラスコールバックを削除する。

[戻り値]
型: BOOL サブクラスコールバックが正常に削除された場合は TRUE、それ以外は FALSE を返す。

[備考]
サブクラスコールバックは、コールバックアドレスと呼び出し元プロセスが定義したサブクラス ID の組み合わせで識別される。SUBCLASS
モジュールは、ウィンドウのサブクラス化に使用されるヘルパー関数を定義している。このコードはサブクラス化されたウィンドウに単一のプロパティを保持し、必要に応じて各種サブクラスコールバックをクライアントにディスパッチする。クライアントには参照データと既定処理
API が提供される。コールバックに対して参照カウントは行われない。SetWindowSubclass
を繰り返し呼び出して参照データ要素の値を変更してもよい。警告:
サブクラスヘルパー関数を使用してスレッドをまたいでウィンドウをサブクラス化することはできない。


%index
SetWindowSubclass
ウィンドウサブクラスコールバックをインストールまたは更新する。
%prm
hWnd, pfnSubclass, uIdSubclass, dwRefData
hWnd : [intptr] 型: HWND サブクラス化されるウィンドウのハンドル。
pfnSubclass : [int] 型: SUBCLASSPROC ウィンドウプロシージャへのポインタ。このポインタとサブクラス ID によって、このサブクラスコールバックが一意に識別される。コールバック関数のプロトタイプについては SUBCLASSPROC を参照。
uIdSubclass : [int] 型: UINT_PTR サブクラス ID。この ID とサブクラスプロシージャを合わせてサブクラスが一意に識別される。サブクラスを削除するには、サブクラスプロシージャとこの値を RemoveWindowSubclass 関数に渡す。この値はサブクラスプロシージャの uIdSubclass パラメータで渡される。
dwRefData : [int] 型: DWORD_PTR 参照データへの DWORD_PTR。この値の意味は呼び出し元アプリケーションによって決定される。この値はサブクラスプロシージャの dwRefData パラメータで渡される。ウィンドウハンドル、サブクラスプロシージャ、uIdSubclass のそれぞれの組み合わせに、異なる dwRefData が関連付けられる。
%inst
ウィンドウサブクラスコールバックをインストールまたは更新する。

[戻り値]
型: BOOL サブクラスコールバックが正常にインストールされた場合は TRUE、それ以外は FALSE を返す。

[備考]
サブクラスコールバックは、コールバックアドレスと呼び出し元が定義したサブクラス ID の組み合わせで識別される。コールバックアドレスと
ID
のペアがまだインストールされていない場合、この関数はサブクラスをインストールする。ペアが既にインストールされている場合、この関数は参照データを更新するだけである。各コールバックは
DWORD_PTR 1
個分の参照データを保持でき、メッセージをフィルタするために呼び出されたときにコールバック関数に渡される。コールバックに対して参照カウントは行われない。SetWindowSubclass
を繰り返し呼び出して参照データ要素の値を変更してもよい。警告:
サブクラスヘルパー関数を使用してスレッドをまたいでウィンドウをサブクラス化することはできない。


%index
ShowHideMenuCtl
指定されたメニュー項目のチェックマーク属性を設定または解除し、対応するコントロールを表示または非表示にする。
%prm
hWnd, uFlags, lpInfo
hWnd : [intptr] 型: HWND メニューとコントロールを含むウィンドウへのハンドル。
uFlags : [int] 型: UINT_PTR チェックマークを受け取るか失うメニュー項目の識別子。
lpInfo : [var] 型: LPINT 値のペアを含む配列へのポインタ。最初のペアの 2 番目の値は、アプリケーションのメインメニューへのハンドルでなければならない。以降の各ペアは、メニュー項目識別子とコントロールウィンドウ識別子からなる。関数は配列内で uFlags と一致する値を検索し、値が見つかった場合はメニュー項目のチェックを切り替え、対応するコントロールの表示を切り替える。
%inst
指定されたメニュー項目のチェックマーク属性を設定または解除し、対応するコントロールを表示または非表示にする。

[戻り値]
型: BOOL 成功した場合は 0 以外を、失敗した場合は 0 を返す。


%index
Str_SetPtrW
ppszCurrent に pszNew のコピーを設定し、必要に応じて変更前の値を解放する。
%prm
ppsz, psz
ppsz : [var] 型: LPTSTR* 現在の文字列へのポインタのアドレス。現在の文字列は解放され、ポインタは pszNew のコピーに設定される。
psz : [wstr] 型: LPCTSTR ppszCurrent にコピーする文字列へのポインタ。
%inst
ppszCurrent に pszNew のコピーを設定し、必要に応じて変更前の値を解放する。

[戻り値]
型: BOOL 成功した場合は TRUE、それ以外は FALSE を返す。

[備考]
Str_SetPtrW の ANSI 版である Str_SetPtrA
は、名前でエクスポートされておらず、公開ヘッダファイルにも宣言されていない。使用するには、GetProcAddress を使用して
ComCtl32.dll から序数 234 を要求し、関数ポインタを取得する必要がある。


%index
UninitializeFlatSB
特定のウィンドウに対してフラットスクロールバーの初期化を解除する。指定されたウィンドウは標準のスクロールバーに戻る。
%prm
param0
param0 : [intptr] 
%inst
特定のウィンドウに対してフラットスクロールバーの初期化を解除する。指定されたウィンドウは標準のスクロールバーに戻る。

[戻り値]
型: HRESULT 次のいずれかの値を返す。
（以下省略）

[備考]
メモ: フラットスクロールバー関数は Comctl32.dll バージョン 4.71 から 5.82
で実装されている。Comctl32.dll バージョン 6.00 以降ではフラットスクロールバーはサポートされない。

