; ============================================================
;   gdi32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
BitBlt
指定した元デバイスコンテキストから先デバイスコンテキストへ、矩形分のピクセル色データのビットブロック転送を行う。
%group
Win32 gdi32
%prm
hdc, x, y, cx, cy, hdcSrc, x1, y1, rop
hdc : [intptr] 先デバイスコンテキストへのハンドル。
x : [int] 先矩形の左上隅の x 座標(論理単位)。
y : [int] 先矩形の左上隅の y 座標(論理単位)。
cx : [int] 元と先の矩形の幅(論理単位)。
cy : [int] 元と先の矩形の高さ(論理単位)。
hdcSrc : [intptr] 元デバイスコンテキストへのハンドル。
x1 : [int] 元矩形の左上隅の x 座標(論理単位)。
y1 : [int] 元矩形の左上隅の y 座標(論理単位)。
rop : [int] ラスタ操作コード。元矩形の色データと先矩形の色データをどのように結合して最終的な色を得るかを定義する。
%inst
指定した元デバイスコンテキストから先デバイスコンテキストへ、矩形分のピクセル色データのビットブロック転送を行う。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報を得るには GetLastError を呼び出す。

[備考]
BitBlt は先 DC に対してのみクリッピングを行う。元 DC
に回転やせん断変換が有効な場合はエラー。色形式が異なる場合は元を先に合わせて変換する。すべてのデバイスが BitBlt
をサポートするわけではなく、GetDeviceCaps の RC_BITBLT で確認できる。元と先が異なるデバイスの DC
の場合はエラーとなる。その場合は GetDIBits で DIB に変換して SetDIBits または StretchDIBits
を使う。ICM: blit 時にカラーマネジメントは行われない。
（以下省略）


%index
DeleteObject
論理ペン、ブラシ、フォント、ビットマップ、リージョン、パレットを削除し、関連するシステムリソースをすべて解放する。削除後、指定されたハンドルは無効となる。
%group
Win32 gdi32
%prm
ho
ho : [intptr] 論理ペン、ブラシ、フォント、ビットマップ、リージョン、パレットへのハンドル。
%inst

論理ペン、ブラシ、フォント、ビットマップ、リージョン、パレットを削除し、関連するシステムリソースをすべて解放する。削除後、指定されたハンドルは無効となる。

[戻り値]
関数が成功した場合、戻り値は 0 以外。指定ハンドルが無効、または現在 DC に選択中の場合は 0。

[備考]
DC
に選択中の描画オブジェクト(ペンやブラシ)は削除してはならない。パターンブラシを削除してもそれに関連付けられたビットマップは削除されない。ビットマップは別途削除する必要がある。


%index
CreateBitmap
指定した幅、高さ、色形式(カラープレーン数およびピクセルあたりのビット数)を持つビットマップを作成する。
%group
Win32 gdi32
%prm
nWidth, nHeight, nPlanes, nBitCount, lpBits
nWidth : [int] ビットマップの幅(ピクセル単位)。
nHeight : [int] ビットマップの高さ(ピクセル単位)。
nPlanes : [int] デバイスが使用するカラープレーン数。
nBitCount : [int] 1 ピクセルの色を表現するのに必要なビット数。
lpBits : [intptr] ピクセル矩形の色を設定するための色データ配列へのポインタ。矩形内の各スキャンラインは word 境界で整列している必要がある(整列していない場合は 0 でパディング)。
%inst
指定した幅、高さ、色形式(カラープレーン数およびピクセルあたりのビット数)を持つビットマップを作成する。

[戻り値]
関数が成功した場合、戻り値はビットマップへのハンドル。失敗した場合は NULL。
（以下省略）

[備考]
CreateBitmap はデバイス依存ビットマップ(DDB)を作成する。作成後は SelectObject で DC
に選択できるが、ビットマップと DC の形式が一致する必要がある。色ビットマップには CreateCompatibleBitmap
のほうがパフォーマンス上推奨される。モノクロビットマップでは 0 が前景色、1 が背景色。nWidth または nHeight に 0
を指定すると 1x1 モノクロビットマップが返る。不要になったら DeleteObject で削除する。


%index
CreateCompatibleBitmap
指定したデバイスコンテキストに関連付けられたデバイスと互換のあるビットマップを作成する。
%group
Win32 gdi32
%prm
hdc, cx, cy
hdc : [intptr] デバイスコンテキストへのハンドル。
cx : [int] ビットマップの幅(ピクセル単位)。
cy : [int] ビットマップの高さ(ピクセル単位)。
%inst
指定したデバイスコンテキストに関連付けられたデバイスと互換のあるビットマップを作成する。

[戻り値]
関数が成功した場合、戻り値は互換ビットマップ(DDB)へのハンドル。失敗した場合は NULL。

[備考]
作成されるビットマップの色形式は hdc
パラメータが識別するデバイスの色形式と一致する。このビットマップは元のデバイスと互換のある任意のメモリ DC に選択できる。メモリ DC
が作成された直後は 1x1 モノクロビットマップが選択されているため、その DC を CreateCompatibleBitmap
に渡すとモノクロビットマップが作成される。色ビットマップを作成するには、メモリ DC 作成に使用した元の HDC を渡す。


%index
CreateCompatibleDC
指定したデバイスと互換のあるメモリデバイスコンテキスト(DC)を作成する。
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] 既存の DC へのハンドル。NULL の場合、アプリケーションの現在のスクリーンと互換のメモリ DC を作成する。
%inst
指定したデバイスと互換のあるメモリデバイスコンテキスト(DC)を作成する。

[戻り値]
関数が成功した場合、戻り値はメモリ DC へのハンドル。失敗した場合は NULL。

[備考]
メモリ DC はメモリ上にのみ存在する。作成時点の表示面は 1x1 のモノクロピクセル。描画前に、適切な幅と高さのビットマップを
CreateCompatibleBitmap
で作成して選択する必要がある。作成後の属性は既定値に設定される。CreateCompatibleDC
はラスタ操作をサポートするデバイスでのみ使用可能。不要になったら DeleteDC を呼ぶ(DeleteObject に HDC
を渡すことも可能)。hdc が NULL の場合、呼び出し元スレッドが HDC を所有し、そのスレッドが終了すると無効になる。


%index
CreateDIBSection
アプリケーションが直接書き込める DIB を作成する。
%group
Win32 gdi32
%prm
hdc, pbmi, usage, ppvBits, hSection, offset
hdc : [intptr] デバイスコンテキストへのハンドル。iUsage が DIB_PAL_COLORS の場合、この DC の論理パレットを使用して DIB の色を初期化する。
pbmi : [var] DIB の寸法や色などの属性を指定する BITMAPINFO 構造体へのポインタ。
usage : [int] pbmi が指す BITMAPINFO 構造体の bmiColors 配列メンバに格納されるデータの種類(論理パレットインデックスまたは RGB 値)。
ppvBits : [var] DIB ビット値の位置を指すポインタを受け取る変数へのポインタ。
hSection : [intptr] DIB の作成に使用するファイルマッピングオブジェクトへのハンドル。NULL を指定できる。NULL 以外の場合、CreateFileMapping を PAGE_READWRITE または PAGE_WRITECOPY フラグで作成したハンドルでなければならない。
offset : [int] hSection が参照するファイルマッピングオブジェクトの先頭からの、ビットマップビット値記憶位置のオフセット。hSection が NULL の場合は無視される。DWORD の倍数でなければならない。
%inst
アプリケーションが直接書き込める DIB を作成する。

[戻り値]
関数が成功した場合、戻り値は新しく作成された DIB へのハンドルで、*ppvBits はビットマップビット値を指す。失敗した場合は
NULL で *ppvBits も NULL。
（以下省略）

[備考]
hSection が NULL の場合、システムが DIB 用メモリを割り当てる。DeleteObject で DIB
を削除するとメモリも解放される。hSection が NULL でない場合、DeleteObject 後に自分で hSection
を閉じる必要がある。CreateDIBSection は BITMAPINFOHEADER の
biXPelsPerMeter/biYPelsPerMeter を使用せず、解像度情報を BITMAPINFO に提供しない。GDI
サブシステムが作成されたビットマップへの描画を完了するまで、自分で書き込む前に GdiFlush で同期する必要がある。ICM:
カラーマネジメントは行われない。


%index
CreateFontW
指定された特性を持つ論理フォントを作成する。論理フォントは任意のデバイスのフォントとして選択できる。(Unicode)
%group
Win32 gdi32
%prm
cHeight, cWidth, cEscapement, cOrientation, cWeight, bItalic, bUnderline, bStrikeOut, iCharSet, iOutPrecision, iClipPrecision, iQuality, iPitchAndFamily, pszFaceName
cHeight : [int] フォントの文字セルまたは文字の高さ(論理単位)。文字高さ(em 高さ)は文字セル高さから internal-leading 値を引いた値。
cWidth : [int] 要求フォントの文字の平均幅(論理単位)。0 の場合、フォントマッパーは最も近い値を選択する。
cEscapement : [int] escapement ベクトルとデバイスの x 軸との角度(10 分の 1 度単位)。escapement ベクトルはテキスト行の基準線と平行。グラフィックスモードが GM_ADVANCED の場合は文字の方向角と独立に指定可能。GM_COMPATIBLE の場合は escapement と orientation の両方を指定し、nEscapement と nOrientation を同じ値にする必要がある。
cOrientation : [int] 各文字の基準線とデバイスの x 軸との角度(10 分の 1 度単位)。
cWeight : [int] フォントの太さ(0~1000)。例えば 400 が normal、700 が bold。0 の場合は既定値が使用される。
bItalic : [int] TRUE の場合、イタリックフォントを指定する。
bUnderline : [int] TRUE の場合、下線付きフォントを指定する。
bStrikeOut : [int] TRUE の場合、取り消し線付きフォントを指定する。
iCharSet : [int] 文字セット。以下の値が定義済み:
iOutPrecision : [int] 
iClipPrecision : [int] 
iQuality : [int] 
iPitchAndFamily : [int] 
pszFaceName : [wstr] フォントの書体名を指定する NULL 終端文字列へのポインタ。文字列長は終端 NULL を含めて 32 文字以下。NULL または空文字列の場合、GDI は指定された他の属性と一致する最初のフォントを使用する。
%inst
指定された特性を持つ論理フォントを作成する。論理フォントは任意のデバイスのフォントとして選択できる。(Unicode)

[戻り値]
関数が成功した場合、戻り値は論理フォントへのハンドル。失敗した場合は NULL。

[備考]
不要になったら DeleteObject
で削除すること。ベンダーの著作権保護のため、選択されたフォント名を正確に報告すべきである。利用可能なフォントはシステムにより異なるため、要求したフォントが必ず選択されるとは限らない。フォントマッパーは
CreateFont/CreateFontIndirect/CreateFontIndirectEx
で英語および地域化された書体名の両方を認識する。
（以下省略）


%index
CreateFontIndirectW
指定された特性を持つ論理フォントを作成する。(Unicode)
%group
Win32 gdi32
%prm
lplf
lplf : [var] 論理フォントの特性を定義する LOGFONT 構造体へのポインタ。
%inst
指定された特性を持つ論理フォントを作成する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は論理フォントへのハンドル。失敗した場合は NULL。

[備考]
LOGFONT 構造体に指定された特性を持つ論理フォントを作成する。SelectObject で選択すると、GDI
のフォントマッパーは論理フォントと既存の物理フォントの一致を試みる。完全一致が見つからない場合、可能な限り要求に近い特性を持つ代替フォントを提供する。地域によっては
EnumFontFamiliesEx で適切な書体名を取得してから CreateFont/CreateFontIndirect
を使うのがよい。不要になったら DeleteObject で削除する。


%index
CreateHatchBrush
指定されたハッチパターンと色を持つ論理ブラシを作成する。
%group
Win32 gdi32
%prm
iHatch, color
iHatch : [int] 
color : [int] ハッチに使用するブラシの前景色。COLORREF 値は RGB マクロで作成する。
%inst
指定されたハッチパターンと色を持つ論理ブラシを作成する。

[戻り値]
関数が成功した場合、戻り値は論理ブラシを識別する。失敗した場合は NULL。

[備考]
ブラシは塗りつぶされた図形の内部を描画するためにシステムが使用するビットマップ。作成後は SelectObject で任意の DC
に選択できる。ハッチブラシで親/子ウィンドウ両方の背景を同じ色で塗る場合、子ウィンドウ背景を描く前に SetBrushOrgEx
でブラシ原点を設定する必要がある。不要になったら DeleteObject で削除する。ICM:
ブラシ作成時にはカラーマネジメントは行われず、ICM 有効な DC に選択されたときに行われる。


%index
CreatePatternBrush
指定したビットマップパターンを持つ論理ブラシを作成する。ビットマップは CreateDIBSection で作成した DIB セクションビットマップでもデバイス依存ビットマップでもよい。
%group
Win32 gdi32
%prm
hbm
hbm : [intptr] 論理ブラシの作成に使用するビットマップへのハンドル。
%inst
指定したビットマップパターンを持つ論理ブラシを作成する。ビットマップは CreateDIBSection で作成した DIB
セクションビットマップでもデバイス依存ビットマップでもよい。

[戻り値]
関数が成功した場合、戻り値は論理ブラシを識別する。失敗した場合は NULL。

[備考]
パターンブラシは塗りつぶされた図形の内部を描画するためにシステムが使用するビットマップ。CreatePatternBrush
で作成後、SelectObject で任意の DC に選択できる。DeleteObject
でパターンブラシを削除してもビットマップには影響しないので、同じビットマップから何度でもブラシを作成できる。モノクロビットマップから作成した場合、0
は現在のテキスト色、1 は現在の背景色で描画される。


%index
CreatePen
指定されたスタイル、幅、色を持つ論理ペンを作成する。ペンは DC に選択して線や曲線の描画に使用できる。
%group
Win32 gdi32
%prm
iStyle, cWidth, color
iStyle : [int] 
cWidth : [int] ペンの幅(論理単位)。0 の場合、現在の変換に関わらず 1 ピクセル幅。PS_DASH、PS_DOT、PS_DASHDOT、PS_DASHDOTDOT スタイルで 1 より大きい幅を指定した場合、CreatePen は PS_SOLID スタイルの指定幅ペンを返す。
color : [int] ペンの色への参照。COLORREF 構造体は RGB マクロで生成する。
%inst
指定されたスタイル、幅、色を持つ論理ペンを作成する。ペンは DC に選択して線や曲線の描画に使用できる。

[戻り値]
関数が成功した場合、戻り値は論理ペンを識別するハンドル。失敗した場合は NULL。

[備考]
論理ペン作成後、SelectObject で DC に選択して線や曲線を描画できる。nWidth が 0 の場合、現在の変換に関わらず線は
1 ピクセル幅。nWidth が 1 より大きい場合、fnPenStyle は
PS_NULL、PS_SOLID、PS_INSIDEFRAME
のいずれかでなければならない。PS_DASH、PS_DOT、PS_DASHDOT、PS_DASHDOTDOT
を使う場合、破線間のギャップを透明にするには SetBkMode で TRANSPARENT を設定する。不要になったら
DeleteObject で削除する。


%index
CreateSolidBrush
指定された単色を持つ論理ブラシを作成する。
%group
Win32 gdi32
%prm
color
color : [int] ブラシの色。COLORREF 値は RGB マクロで作成する。
%inst
指定された単色を持つ論理ブラシを作成する。

[戻り値]
関数が成功した場合、戻り値は論理ブラシを識別する。失敗した場合は NULL。

[備考]
HBRUSH オブジェクトが不要になったら DeleteObject
で削除する。ソリッドブラシは塗りつぶされた図形の内部を描画するためにシステムが使用するビットマップ。システムカラーブラシを使うには、CreateSolidBrush(GetSysColor(nIndex))
ではなく GetSysColorBrush(nIndex) を使うことで、キャッシュされたブラシが返されるため効率が良い。


%index
DeleteDC
指定されたデバイスコンテキスト(DC)を削除する。
%group
Win32 gdi32
%prm
hdc
hdc : [intptr] デバイスコンテキストへのハンドル。
%inst
指定されたデバイスコンテキスト(DC)を削除する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
GetDC で取得したハンドルの DC を DeleteDC で削除してはならない。代わりに ReleaseDC を呼び出して解放する。


%index
Ellipse
D2D1_ELLIPSE 構造体を作成する。
%group
Win32 gdi32
%prm
hdc, left, top, right, bottom
hdc : [intptr] 
left : [int] 
top : [int] 
right : [int] 
bottom : [int] 
%inst
D2D1_ELLIPSE 構造体を作成する。

[戻り値]
型: D2D1_ELLIPSE 新しい楕円。


%index
GetDIBits
指定された互換ビットマップのビットを取得し、指定された形式の DIB としてバッファにコピーする。
%group
Win32 gdi32
%prm
hdc, hbm, start, cLines, lpvBits, lpbmi, usage
hdc : [intptr] デバイスコンテキストへのハンドル。
hbm : [intptr] ビットマップへのハンドル。互換ビットマップ(DDB)でなければならない。
start : [int] 取得する最初のスキャンライン。
cLines : [int] 取得するスキャンライン数。
lpvBits : [intptr] ビットマップデータを受け取るバッファへのポインタ。NULL の場合、関数はビットマップの寸法と形式を lpbmi が指す BITMAPINFO 構造体に渡す。
lpbmi : [var] DIB データの希望する形式を指定する BITMAPINFO 構造体へのポインタ。
usage : [int] 
%inst
指定された互換ビットマップのビットを取得し、指定された形式の DIB としてバッファにコピーする。

[戻り値]
lpvBits が非 NULL で関数が成功した場合、戻り値はコピーされたスキャンライン数。lpvBits が NULL で
BITMAPINFO 構造体の埋め込みに成功した場合は 0 以外。失敗した場合は 0。
（以下省略）

[備考]
DIB の要求形式が内部形式と一致する場合、ビットマップの RGB 値がコピーされる。一致しない場合はカラーテーブルが合成される。
（以下省略）


%index
GetPixel
指定された座標のピクセルの RGB カラー値を取得する。
%group
Win32 gdi32
%prm
hdc, x, y
hdc : [intptr] デバイスコンテキストへのハンドル。
x : [int] 検査するピクセルの x 座標(論理単位)。
y : [int] 検査するピクセルの y 座標(論理単位)。
%inst
指定された座標のピクセルの RGB カラー値を取得する。

[戻り値]
戻り値はピクセルの RGB を指定する COLORREF 値。ピクセルが現在のクリッピング領域外の場合は
CLR_INVALID(0xFFFFFFFF)。

[備考]
ピクセルは現在のクリッピング領域内にある必要がある。すべてのデバイスが GetPixel
をサポートするわけではなく、GetDeviceCaps で確認すべき。DC にビットマップが選択されていない場合、すべてのピクセルで
CLR_INVALID が返る。


%index
GetStockObject
ストックペン、ブラシ、フォント、パレットのいずれかへのハンドルを取得する。
%group
Win32 gdi32
%prm
i
i : [int] 
%inst
ストックペン、ブラシ、フォント、パレットのいずれかへのハンドルを取得する。

[戻り値]
関数が成功した場合、戻り値は要求した論理オブジェクトへのハンドル。失敗した場合は NULL。

[備考]
ダイアログやウィンドウで使用される現在のフォントを取得するのにこの関数を用いるのは推奨されない。代わりに
SystemParametersInfo を SPI_GETNONCLIENTMETRICS
で呼ぶこと。DKGRAY_BRUSH、GRAY_BRUSH、LTGRAY_BRUSH ストックオブジェクトは CS_HREDRAW と
CS_VREDRAW を持つウィンドウでのみ使用する。HOLLOW_BRUSH と NULL_BRUSH は同等。DeleteObject
でストックオブジェクトを削除する必要はない(害もない)。DC_BRUSH と DC_PEN は
SetDCBrushColor/SetDCPenColor と組み合わせて使える。


%index
GetTextExtentPoint32W
指定した文字列の幅と高さを計算する。(Unicode)
%group
Win32 gdi32
%prm
hdc, lpString, c, psizl
hdc : [intptr] デバイスコンテキストへのハンドル。
lpString : [wstr] テキスト文字列を指定するバッファへのポインタ。c でサイズを指定するため NULL 終端である必要はない。
c : [int] lpString が指す文字列の長さ。
psizl : [var] 文字列の寸法(論理単位)を受け取る SIZE 構造体へのポインタ。
%inst
指定した文字列の幅と高さを計算する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
GetTextExtentPoint32
は現在選択されているフォントを使用して文字列の寸法を計算する。幅と高さはクリッピングを考慮せずに計算される。一部のデバイスは文字詰めを行うため、文字ごとの幅の合計と文字列全体の幅は一致しない場合がある。計算される文字列幅は
SetTextCharacterExtra で設定された文字間スペーシングと SetTextJustification
で設定されたジャスティフィケーションを考慮する。
（以下省略）


%index
GetTextMetricsW
現在選択されているフォントのメトリックを指定バッファに格納する。(Unicode)
%group
Win32 gdi32
%prm
hdc, lptm
hdc : [intptr] デバイスコンテキストへのハンドル。
lptm : [var] テキストメトリックを受け取る TEXTMETRIC 構造体へのポインタ。
%inst
現在選択されているフォントのメトリックを指定バッファに格納する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
フォントが TrueType フォントかを判定するには、DC に選択した後 GetTextMetrics
を呼び、TEXTMETRIC.tmPitchAndFamily の TMPF_TRUETYPE を確認する。GetDC が返す DC
は初期化されておらず、既定で "System" (ビットマップフォント)が選択されているため、DC にフォントを選択する必要がある。


%index
LineTo
現在位置から指定された点の直前までの直線を描画する。
%group
Win32 gdi32
%prm
hdc, x, y
hdc : [intptr] デバイスコンテキストへのハンドル。
x : [int] 線の終点の x 座標(論理単位)。
y : [int] 線の終点の y 座標(論理単位)。
%inst
現在位置から指定された点の直前までの直線を描画する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
線は現在のペンを使用して描画される(ペンがジオメトリックペンの場合は現在のブラシも使用)。LineTo
が成功すると、現在位置は指定された終点に設定される。


%index
MoveToEx
現在位置を指定された点に更新し、オプションで前の位置を返す。
%group
Win32 gdi32
%prm
hdc, x, y, lppt
hdc : [intptr] デバイスコンテキストへのハンドル。
x : [int] 新しい位置の x 座標(論理単位)。
y : [int] 新しい位置の y 座標(論理単位)。
lppt : [var] 前の現在位置を受け取る POINT 構造体へのポインタ。NULL の場合、前の位置は返されない。
%inst
現在位置を指定された点に更新し、オプションで前の位置を返す。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
MoveToEx はすべての描画関数に影響する。


%index
Polygon
2 つ以上の頂点を直線で結んだ多角形を描画する。多角形は現在のペンで輪郭が描かれ、現在のブラシと多角形塗りつぶしモードで塗りつぶされる。
%group
Win32 gdi32
%prm
hdc, apt, cpt
hdc : [intptr] デバイスコンテキストへのハンドル。
apt : [var] 論理座標で多角形の頂点を指定する POINT 構造体の配列へのポインタ。
cpt : [int] 配列内の頂点数。2 以上でなければならない。
%inst
2 つ以上の頂点を直線で結んだ多角形を描画する。多角形は現在のペンで輪郭が描かれ、現在のブラシと多角形塗りつぶしモードで塗りつぶされる。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
多角形は最後の頂点から最初の頂点への線を引くことで自動的に閉じられる。Polygon
関数は現在位置を使用も更新もしない。追加の点は無視される。最大点数を超える場合はグループに分割して呼び出し、各線分を接続する。


%index
Polyline
指定した配列の点を接続することで一連の線分を描画する。
%group
Win32 gdi32
%prm
hdc, apt, cpt
hdc : [intptr] デバイスコンテキストへのハンドル。
apt : [var] POINT 構造体の配列(論理単位)へのポインタ。
cpt : [int] 配列内の点数。2 以上でなければならない。
%inst
指定した配列の点を接続することで一連の線分を描画する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
線は現在のペンを使用して最初の点から後続の点まで描画される。LineTo や PolylineTo と異なり、Polyline
は現在位置を使用も更新もしない。


%index
Rectangle
矩形を描画する。矩形は現在のペンで輪郭を描かれ、現在のブラシで塗りつぶされる。
%group
Win32 gdi32
%prm
hdc, left, top, right, bottom
hdc : [intptr] デバイスコンテキストへのハンドル。
left : [int] 矩形の左上隅の x 座標(論理単位)。
top : [int] 矩形の左上隅の y 座標(論理単位)。
right : [int] 矩形の右下隅の x 座標(論理単位)。
bottom : [int] 矩形の右下隅の y 座標(論理単位)。
%inst
矩形を描画する。矩形は現在のペンで輪郭を描かれ、現在のブラシで塗りつぶされる。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
現在位置は Rectangle によって使用も更新もされない。描画される矩形は下端と右端を含まない。PS_NULL
ペンを使うと、矩形の寸法は高さ 1 ピクセル分、幅 1 ピクセル分少なくなる。


%index
SelectObject
指定されたデバイスコンテキスト(DC)にオブジェクトを選択する。新しいオブジェクトは同じ型の以前のオブジェクトを置き換える。
%group
Win32 gdi32
%prm
hdc, h
hdc : [intptr] DC へのハンドル。
h : [intptr] 選択するオブジェクトへのハンドル。指定されるオブジェクトは以下の関数のいずれかで作成されていなければならない。
%inst
指定されたデバイスコンテキスト(DC)にオブジェクトを選択する。新しいオブジェクトは同じ型の以前のオブジェクトを置き換える。

[戻り値]

選択されたオブジェクトがリージョンでなく、関数が成功した場合、戻り値は置き換えられるオブジェクトへのハンドル。リージョンの場合は次のいずれかの値。
（以下省略）

[備考]

この関数は指定された型の以前に選択されていたオブジェクトを返す。新しいオブジェクトで描画を終えたら、元の既定オブジェクトに置き換えるべきである。1
つのビットマップを同時に複数の DC に選択することはできない。ICM: 選択対象がブラシまたはペンの場合、カラーマネジメントが行われる。


%index
SetBkColor
現在の背景色を指定された色値、またはデバイスが指定値を表現できない場合は最も近い物理色に設定する。
%group
Win32 gdi32
%prm
hdc, color
hdc : [intptr] デバイスコンテキストへのハンドル。
color : [int] 新しい背景色。COLORREF 値は RGB マクロで作成する。
%inst
現在の背景色を指定された色値、またはデバイスが指定値を表現できない場合は最も近い物理色に設定する。

[戻り値]
関数が成功した場合、戻り値は以前の背景色(COLORREF 値)。失敗した場合は CLR_INVALID。

[備考]
この関数は CreatePen で作成されたペンを使って描画された破線間のギャップを埋める(ExtCreatePen
で作成されたペンは対象外)。SetBkColor は TextOut と ExtTextOut の背景色も設定する。背景モードが
OPAQUE
なら、背景色は破線のギャップ、ハッチブラシのギャップ、文字セルを埋めるのに使われる。ビットマップのカラー/モノクロ変換時にも使われる。


%index
SetBkMode
指定されたデバイスコンテキストの背景混合モードを設定する。背景混合モードはテキスト、ハッチブラシ、実線でないペンスタイルで使用される。
%group
Win32 gdi32
%prm
hdc, mode
hdc : [intptr] デバイスコンテキストへのハンドル。
mode : [int] 
%inst
指定されたデバイスコンテキストの背景混合モードを設定する。背景混合モードはテキスト、ハッチブラシ、実線でないペンスタイルで使用される。

[戻り値]
関数が成功した場合、戻り値は以前の背景モード。失敗した場合は 0。

[備考]
SetBkMode は CreatePen で作成されたペンで描画される線のスタイルに影響する。ExtCreatePen
で作成されたペンには影響しない。


%index
SetDIBits
指定された DIB の色データを使用して互換ビットマップ(DDB)のピクセルを設定する。
%group
Win32 gdi32
%prm
hdc, hbm, start, cLines, lpBits, lpbmi, ColorUse
hdc : [intptr] デバイスコンテキストへのハンドル。
hbm : [intptr] 指定された DIB の色データで変更される互換ビットマップ(DDB)へのハンドル。
start : [int] lpvBits 配列内のデバイス独立色データの開始スキャンライン。
cLines : [int] デバイス独立色データを含む配列内のスキャンライン数。
lpBits : [intptr] バイト配列として保存された DIB 色データへのポインタ。ビットマップ値の形式は lpbmi の BITMAPINFO 構造体の biBitCount メンバに依存する。
lpbmi : [var] DIB に関する情報を含む BITMAPINFO 構造体へのポインタ。
ColorUse : [int] 
%inst
指定された DIB の色データを使用して互換ビットマップ(DDB)のピクセルを設定する。

[戻り値]
関数が成功した場合、戻り値はコピーされたスキャンライン数。失敗した場合は 0。
（以下省略）

[備考]
最適な描画速度は、ビットマップビットがシステムパレットのインデックスの場合に得られる。GetSystemPaletteEntries
でシステムパレットの色とインデックスを取得できる。hdc は fuColorUse が DIB_PAL_COLORS
の場合のみ使用される。hbmp は呼び出し時に DC に選択されていてはならない。スキャンラインは RLE 圧縮を除き DWORD
境界で整列している必要がある。ボトムアップ DIB の原点は左下、トップダウン DIB の原点は左上。ICM: SetICMMode で
ICM_ON が設定されている場合にカラーマネジメントが行われる。


%index
SetPixel
指定された座標のピクセルを指定された色に設定する。
%group
Win32 gdi32
%prm
hdc, x, y, color
hdc : [intptr] デバイスコンテキストへのハンドル。
x : [int] 設定する点の x 座標(論理単位)。
y : [int] 設定する点の y 座標(論理単位)。
color : [int] 点を描くのに使用する色。COLORREF 値は RGB マクロで作成する。
%inst
指定された座標のピクセルを指定された色に設定する。

[戻り値]
関数が成功した場合、戻り値は関数がピクセルを設定した RGB
値。これは指定した色と異なる場合がある(正確な一致が見つからない場合)。失敗した場合は -1。
（以下省略）

[備考]
ピクセル座標が現在のクリッピング領域外の場合、関数は失敗する。すべてのデバイスが SetPixel をサポートするわけではない。詳細は
GetDeviceCaps を参照。


%index
SetROP2
現在の前景混合モードを設定する。
%group
Win32 gdi32
%prm
hdc, rop2
hdc : [intptr] デバイスコンテキストへのハンドル。
rop2 : [int] 
%inst
現在の前景混合モードを設定する。

[戻り値]
関数が成功した場合、戻り値は以前の混合モード。失敗した場合は 0。

[備考]
混合モードは、現在のペンで描画する際に GDI が元と先の色をどのように結合するかを定義する。混合モードは AND、OR、XOR、NOT
を使った 2 変数のすべての論理関数を表すバイナリラスタ操作コードである。ラスタデバイスでのみ使用可能(ベクタデバイスでは使用不可)。


%index
SetTextColor
指定されたデバイスコンテキストのテキスト色を指定された色に設定する。
%group
Win32 gdi32
%prm
hdc, color
hdc : [intptr] デバイスコンテキストへのハンドル。
color : [int] テキストの色。
%inst
指定されたデバイスコンテキストのテキスト色を指定された色に設定する。

[戻り値]
関数が成功した場合、戻り値は以前のテキスト色への色参照(COLORREF 値)。失敗した場合は CLR_INVALID。

[備考]
テキスト色は TextOut および ExtTextOut
で書き込まれる各文字の顔面を描画するために使用される。ビットマップのカラー/モノクロ変換時にも使用される。


%index
StretchBlt
元矩形から先矩形へビットマップをコピーし、必要に応じて先矩形の寸法に合うようにビットマップを伸縮する。
%group
Win32 gdi32
%prm
hdcDest, xDest, yDest, wDest, hDest, hdcSrc, xSrc, ySrc, wSrc, hSrc, rop
hdcDest : [intptr] 先デバイスコンテキストへのハンドル。
xDest : [int] 先矩形の左上隅の x 座標(論理単位)。
yDest : [int] 先矩形の左上隅の y 座標(論理単位)。
wDest : [int] 先矩形の幅(論理単位)。
hDest : [int] 先矩形の高さ(論理単位)。
hdcSrc : [intptr] 元デバイスコンテキストへのハンドル。
xSrc : [int] 元矩形の左上隅の x 座標(論理単位)。
ySrc : [int] 元矩形の左上隅の y 座標(論理単位)。
wSrc : [int] 元矩形の幅(論理単位)。
hSrc : [int] 元矩形の高さ(論理単位)。
rop : [int] 実行するラスタ操作。ラスタ操作コードは、ブラシ、元ビットマップ、先ビットマップを伴う出力操作でシステムが色をどう結合するかを定義する。一般的な ROP のリストは BitBlt を参照。なお、CAPTUREBLT ROP は一般にプリンタデバイスコンテキストでは使用できない。
%inst
元矩形から先矩形へビットマップをコピーし、必要に応じて先矩形の寸法に合うようにビットマップを伸縮する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
StretchBlt
はメモリ上で元ビットマップを伸縮し、先矩形にコピーする。パターンまたは先ピクセルの色データは伸縮後に結合される。拡張メタファイル記録中に元
DC が拡張メタファイル DC の場合はエラー。ラスタ操作がブラシを必要とする場合、先 DC
に現在選択されているブラシが使用される。元の変換に回転やせん断がある場合はエラー。色形式が一致しない場合は変換される。幅や高さの符号が異なる場合はミラーイメージが作成される。ICM:
カラーマネジメントは行われない。複数モニタ環境では元と先が同じデバイスでなければならない。
（以下省略）


%index
TextOutW
現在選択されているフォント、背景色、テキスト色を使って指定位置に文字列を書き込む。(Unicode)
%group
Win32 gdi32
%prm
hdc, x, y, lpString, c
hdc : [intptr] デバイスコンテキストへのハンドル。
x : [int] システムが文字列を整列させる基準点の x 座標(論理座標)。
y : [int] システムが文字列を整列させる基準点の y 座標(論理座標)。
lpString : [wstr] 描画する文字列へのポインタ。cchString で長さを指定するため、NULL 終端である必要はない。
c : [int] lpString が指す文字列の長さ(文字単位)。
%inst
現在選択されているフォント、背景色、テキスト色を使って指定位置に文字列を書き込む。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。

[備考]
基準点の解釈は現在のテキスト整列モードに依存する。モードの取得には GetTextAlign、設定には SetTextAlign
を使う。水平および垂直整列に影響するフラグから 1 つだけ、および現在位置を変更する 2 つのフラグから 1 つだけ選択できる。
（以下省略）

