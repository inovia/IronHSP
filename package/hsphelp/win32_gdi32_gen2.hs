; ============================================================
;   gdi32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
gdi32.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の gdi32.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
DeleteObject
論理ペン、ブラシ、フォント、ビットマップ、リージョン、パレットを削除し、関連するシステムリソースをすべて解放する。削除後、指定されたハンドルは無効となる。
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
AbortDoc
AbortDoc 関数は、現在の印刷ジョブを停止し、最後に StartDoc 関数を呼んだ以降に描画された内容をすべて消去する。
%prm
hdc
hdc : [intptr] 印刷ジョブのデバイスコンテキストへのハンドル。
%inst
AbortDoc 関数は、現在の印刷ジョブを停止し、最後に StartDoc 関数を呼んだ以降に描画された内容をすべて消去する。

[戻り値]
関数が成功した場合、戻り値はゼロより大きい値となる。関数が失敗した場合、戻り値は SP_ERROR となる。

[備考]
注意:
これはブロッキングまたは同期関数であり、即座に戻らないことがある。この関数がどれくらい速く戻るかは、ネットワーク状態、プリントサーバーの構成、プリンタードライバーの実装といった、アプリケーション作成時には予測しにくい実行時要因に依存する。ユーザーインターフェイスとのやり取りを管理するスレッドからこの関数を呼び出すと、アプリケーションが応答しなくなったように見えることがある。アプリケーションは、エラーが発生した場合や、ユーザーがジョブをキャンセルした後で印刷ジョブを停止するために
AbortDoc 関数を呼ぶべきである。印刷ジョブを正常に終了するには、アプリケーションは EndDoc
関数を呼ぶ。プリントマネージャーで印刷ジョブが開始されていた場合、AbortDoc
を呼ぶとスプールジョブ全体が消去され、プリンターには何も送られない。プリントマネージャーで印刷ジョブが開始されていなかった場合、データは既にプリンターへ送られている可能性がある。この場合、プリンタードライバーは（可能なら）プリンターをリセットして印刷ジョブを終了する。


%index
AbortPath
AbortPath 関数は、指定したデバイスコンテキスト内のすべてのパスを閉じて破棄する。
%prm
hdc
hdc : [intptr] パスを破棄するデバイスコンテキストへのハンドル。
%inst
AbortPath 関数は、指定したデバイスコンテキスト内のすべてのパスを閉じて破棄する。

[戻り値]
関数が成功した場合、戻り値は非ゼロとなる。関数が失敗した場合、戻り値はゼロとなる。

[備考]

指定したデバイスコンテキストにオープンなパスブラケットがある場合、そのパスブラケットは閉じられ、パスは破棄される。デバイスコンテキストにクローズされたパスがある場合、そのパスは破棄される。


%index
AddFontMemResourceEx
AddFontMemResourceEx 関数は、メモリイメージからフォントリソースをシステムに追加する。
%prm
pFileView, cjSize, pvResrved, pNumFonts
pFileView : [intptr] フォントリソースへのポインタ。
cjSize : [int] pbFont が指すフォントリソースのバイト数。
pvResrved : [intptr] 予約。0 を指定する。
pNumFonts : [var] インストールされたフォントの数を格納する変数へのポインタ。
%inst
AddFontMemResourceEx 関数は、メモリイメージからフォントリソースをシステムに追加する。

[戻り値]

関数が成功した場合、戻り値は追加されたフォントを示すハンドルとなる。このハンドルは、システムにインストールされたフォントを一意に識別する。関数が失敗した場合、戻り値はゼロとなる。拡張エラー情報は得られない。

[備考]
この関数を使うと、アプリケーションはドキュメントや Web
ページに埋め込まれたフォントを取得できる。AddFontMemResourceEx
で追加されたフォントは常に呼び出し元プロセスにプライベートで、列挙不可能となる。1
つのメモリイメージに複数のフォントを含めることもできる。この関数が成功すると、pcFonts
は呼び出しの結果システムに追加されたフォント数を値に持つ DWORD へのポインタとなる。例えばアジアフォントの縦書き・横書き 2
種類なら 2 となる。関数が成功した場合、システムは独自にコピーを保持しているので、呼び出し元は pbFont
が指すメモリを解放してよい。インストールされたフォントを削除するには RemoveFontMemResourceEx
を呼ぶ。なお、プロセスが終了するときは、RemoveFontMemResource を呼ばなくてもシステムがフォントをアンロードする。


%index
AddFontResourceW
AddFontResource 関数は、指定したファイルからフォントリソースをシステムフォントテーブルに追加する。追加されたフォントは、その後どのアプリケーションからもテキスト出力に使用できる。(Unicode)
%prm
param0
param0 : [wstr] 
%inst
AddFontResource
関数は、指定したファイルからフォントリソースをシステムフォントテーブルに追加する。追加されたフォントは、その後どのアプリケーションからもテキスト出力に使用できる。(Unicode)

[戻り値]
関数が成功した場合、戻り値は追加されたフォントの数となる。関数が失敗した場合、戻り値はゼロとなる。拡張エラー情報は得られない。

[備考]

システムフォントテーブルにフォントを追加または削除するアプリケーションは、変更を他のウィンドウに通知するために、オペレーティングシステム上のすべてのトップレベルウィンドウに
WM_FONTCHANGE メッセージを送信すべきである。アプリケーションは SendMessage を呼び、hwnd パラメータに
HWND_BROADCAST を指定してこのメッセージを送信する。AddFontResource
で読み込んだフォントリソースが不要になったら、RemoveFontResource
を呼んで削除しなければならない。この関数は現在のセッションに対してのみフォントをインストールする。システム再起動後はそのフォントは存在しない。再起動後もフォントをインストール状態にするには、レジストリにフォントを登録する必要がある。レジストリに登録され
%windir%\fonts\
フォルダ以外の場所にインストールされたフォントは、いずれかのセッションで読み込まれている間は変更・削除・置き換えができない。これらのフォントを変更するには、まず
RemoveFontResource で削除し、フォントレジストリ
(HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows
NT\CurrentVersion\Fonts)
から削除して、システムを再起動する必要がある。再起動後はフォントが読み込まれなくなり変更可能となる。
> [!NOTE] > wingdi.h ヘッダは AddFontResource を、UNICODE
プリプロセッサ定数の定義に応じて自動的に ANSI 版か Unicode
版を選択するエイリアスとして定義する。エンコーディング中立のエイリアスとそうでないコードを混在させると、コンパイルや実行時のエラーにつながるミスマッチが生じることがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
AddFontResourceExW
AddFontResourceEx 関数は、指定したファイルからフォントリソースをシステムに追加する。AddFontResourceEx で追加したフォントはプライベートかつ列挙不可能とすることもできる。(Unicode)
%prm
name, fl, res
name : [wstr] 有効なフォントファイル名を含む、null 終端文字列へのポインタ。このパラメータには次のいずれかのファイルを指定できる。
fl : [int] 
res : [intptr] 予約。0 を指定する。
%inst
AddFontResourceEx 関数は、指定したファイルからフォントリソースをシステムに追加する。AddFontResourceEx
で追加したフォントはプライベートかつ列挙不可能とすることもできる。(Unicode)

[戻り値]
関数が成功した場合、戻り値は追加されたフォントの数となる。関数が失敗した場合、戻り値はゼロとなる。拡張エラー情報は得られない。

[備考]
この関数を使うと、プロセスは他のプロセスからアクセスを許さずにフォントを利用できる。アプリケーションは、AddFontResourceEx
で読み込んだフォントリソースが不要になったら、RemoveFontResourceEx
を呼んで削除しなければならない。この関数は現在のセッションに対してのみフォントをインストールする。システム再起動後はそのフォントは存在しない。再起動後もフォントをインストール状態にするには、レジストリにフォントを登録する必要がある。レジストリに登録され
%windir%\fonts\
フォルダ以外の場所にインストールされたフォントは、いずれかのセッションで読み込まれている間は変更・削除・置き換えができない。これらのフォントを変更するには、まず
RemoveFontResource で削除し、フォントレジストリ
(HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows
NT\CurrentVersion\Fonts)
から削除して、システムを再起動する必要がある。再起動後はフォントが読み込まれなくなり変更可能となる。
> [!NOTE] > wingdi.h ヘッダは AddFontResourceEx を、UNICODE
プリプロセッサ定数の定義に応じて自動的に ANSI 版か Unicode
版を選択するエイリアスとして定義する。エンコーディング中立のエイリアスとそうでないコードを混在させると、コンパイルや実行時のエラーにつながるミスマッチが生じることがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
AngleArc
AngleArc 関数は、線分と弧を描く。
%prm
hdc, x, y, r, StartAngle, SweepAngle
hdc : [intptr] デバイスコンテキストへのハンドル。
x : [int] 円の中心の x 座標（論理単位）。
y : [int] 円の中心の y 座標（論理単位）。
r : [int] 円の半径（論理単位）。正の値でなければならない。
StartAngle : [float] x 軸を基準とした開始角度（度単位）。
SweepAngle : [float] 開始角度を基準とした掃引角度（度単位）。
%inst
AngleArc 関数は、線分と弧を描く。

[戻り値]
関数が成功した場合、戻り値は非ゼロとなる。関数が失敗した場合、戻り値はゼロとなる。

[備考]
AngleArc
関数は、現在位置を弧の終点へ移動する。描かれる弧は、現在の変換とマッピングモードに応じて楕円に見えることがある。弧を描く前に、AngleArc
は現在位置から弧の始点までの線分を描く。弧は、指定した中心点を中心とする半径の仮想円を構築して描かれる。弧の始点は、円の x
軸から開始角度の度数だけ反時計回りに測って決定する。終点は、始点から掃引角度の度数だけ反時計回りに測って同様に決定する。掃引角度が 360
度を超える場合、弧は複数回掃引される。この関数は現在のペンを使って線を描く。図形は塗りつぶされない。


%index
AnimatePalette
AnimatePalette 関数は、指定した論理パレット内のエントリを置き換える。
%prm
hPal, iStartIndex, cEntries, ppe
hPal : [intptr] 論理パレットへのハンドル。
iStartIndex : [int] 置き換える論理パレットの最初のエントリ。
cEntries : [int] 置き換えるエントリの数。
ppe : [var] 現在のエントリを置き換えるために使用する PALETTEENTRY 構造体配列の最初のメンバへのポインタ。
%inst
AnimatePalette 関数は、指定した論理パレット内のエントリを置き換える。

[戻り値]
関数が成功した場合、戻り値は非ゼロとなる。関数が失敗した場合、戻り値はゼロとなる。

[備考]
アプリケーションは GetDeviceCaps を呼び RASTERCAPS
定数を指定することで、デバイスがパレット操作をサポートするかを判定できる。AnimatePalette 関数は、対応する
LOGPALETTE 構造体の palPalEntry メンバに PC_RESERVED
フラグが設定されたエントリのみを変更する。指定したパレットがアクティブウィンドウに関連付けられている場合、パレット内の色は直ちに置き換えられる。


%index
Arc
Arc 関数は楕円弧を描く。
%prm
hdc, x1, y1, x2, y2, x3, y3, x4, y4
hdc : [intptr] 描画を行うデバイスコンテキストへのハンドル。
x1 : [int] 外接矩形の左上隅の x 座標（論理単位）。
y1 : [int] 外接矩形の左上隅の y 座標（論理単位）。
x2 : [int] 外接矩形の右下隅の x 座標（論理単位）。
y2 : [int] 外接矩形の右下隅の y 座標（論理単位）。
x3 : [int] 弧の始点を定義する半径線の終点の x 座標（論理単位）。
y3 : [int] 弧の始点を定義する半径線の終点の y 座標（論理単位）。
x4 : [int] 弧の終点を定義する半径線の終点の x 座標（論理単位）。
y4 : [int] 弧の終点を定義する半径線の終点の y 座標（論理単位）。
%inst
Arc 関数は楕円弧を描く。

[戻り値]
弧が描かれた場合、戻り値は非ゼロとなる。弧が描かれなかった場合、戻り値はゼロとなる。

[備考]
(nLeftRect, nTopRect) と (nRightRect, nBottomRect)
の点は外接矩形を指定する。指定した外接矩形により形成される楕円が弧の曲線を定義する。弧は、外接矩形の中心から (nXStartArc,
nYStartArc) 点への半径線と交わる点から、現在の描画方向に沿って延びる。弧は、外接矩形の中心から (nXEndArc,
nYEndArc)
点への半径線と交わる点で終わる。始点と終点が同じ場合、完全な楕円が描かれる。弧は現在のペンで描かれ、塗りつぶされない。Arc
では現在位置は使用も更新もされない。デバイスコンテキストの現在の描画方向を取得・設定するには GetArcDirection と
SetArcDirection を使う。デフォルトの描画方向は反時計回りである。


%index
ArcTo
ArcTo 関数は楕円弧を描く。
%prm
hdc, left, top, right, bottom, xr1, yr1, xr2, yr2
hdc : [intptr] 描画を行うデバイスコンテキストへのハンドル。
left : [int] 外接矩形の左上隅の x 座標（論理単位）。
top : [int] 外接矩形の左上隅の y 座標（論理単位）。
right : [int] 外接矩形の右下隅の x 座標（論理単位）。
bottom : [int] 外接矩形の右下隅の y 座標（論理単位）。
xr1 : [int] 弧の始点を定義する半径の終点の x 座標（論理単位）。
yr1 : [int] 弧の始点を定義する半径の終点の y 座標（論理単位）。
xr2 : [int] 弧の終点を定義する半径の終点の x 座標（論理単位）。
yr2 : [int] 弧の終点を定義する半径の終点の y 座標（論理単位）。
%inst
ArcTo 関数は楕円弧を描く。

[戻り値]
関数が成功した場合、戻り値は非ゼロとなる。関数が失敗した場合、戻り値はゼロとなる。

[備考]
ArcTo は Arc に似ているが、現在位置が更新される点が異なる。(nLeftRect, nTopRect) と
(nRightRect, nBottomRect)
は外接矩形を指定する。指定した外接矩形により形成される楕円が弧の曲線を定義する。弧は、外接矩形の中心から (nXRadial1,
nYRadial1) 点への半径線と交わる点から反時計回りに延びる。弧は、外接矩形の中心から (nXRadial2, nYRadial2)
点への半径線と交わる点で終わる。始点と終点が同じ場合、完全な楕円が描かれる。現在位置から弧の始点までの線が描かれる。エラーが発生しなければ、現在位置は弧の終点に設定される。弧は現在のペンで描かれ、塗りつぶされない。


%index
BRUSHOBJ_hGetColorTransform
BRUSHOBJ_hGetColorTransform 関数は、指定したブラシのカラー変換を取得する。
%prm
pbo
pbo : [var] カラー変換を問い合わせる対象の BRUSHOBJ 構造体へのポインタ。カラー変換は、以前に DrvIcmCreateColorTransform を呼び出して作成したものである。
%inst
BRUSHOBJ_hGetColorTransform 関数は、指定したブラシのカラー変換を取得する。

[戻り値]
BRUSHOBJ_hGetColorTransform は、成功した場合、指定された BRUSHOBJ
構造体のカラー変換へのハンドルを返す。失敗した場合は NULL を返す。

[備考]
BRUSHOBJ_hGetColorTransform は、ICM が無効な場合 NULL を返す。変換オブジェクトのカラー変換は
XLATEOBJ_hGetColorTransform を呼んで取得する。


%index
BRUSHOBJ_pvAllocRbrush
BRUSHOBJ_pvAllocRbrush 関数は、指定したブラシのドライバ実体化のためのメモリを割り当てる。
%prm
pbo, cj
pbo : [var] 実体化を割り当てる対象の BRUSHOBJ 構造体へのポインタ。
cj : [int] 実体化に必要なサイズ（バイト単位）。
%inst
BRUSHOBJ_pvAllocRbrush 関数は、指定したブラシのドライバ実体化のためのメモリを割り当てる。

[戻り値]
関数が成功した場合、戻り値は割り当てられたメモリへのポインタとなる。失敗した場合は null となり、エラーコードがログに記録される。

[備考]
BRUSHOBJ_pvAllocRbrush は、ブラシ実体化のためのメモリを割り当てる。GDI
がメモリを管理し、ブラシが不要になると破棄する。この関数は、DrvRealizeBrush
呼び出しの後でブラシ実体化の実装からのみ呼ぶべきである。


%index
BRUSHOBJ_pvGetRbrush
BRUSHOBJ_pvGetRbrush 関数は、指定したブラシのドライバ実体化へのポインタを取得する。
%prm
pbo
pbo : [var] 実体化を要求する対象の BRUSHOBJ 構造体へのポインタ。
%inst
BRUSHOBJ_pvGetRbrush 関数は、指定したブラシのドライバ実体化へのポインタを取得する。

[戻り値]
関数が成功した場合、戻り値は実体化されたブラシへのポインタとなる。ブラシが実体化できない場合、戻り値は null
となり、エラーコードがログに記録される。

[備考]
BRUSHOBJ_pvGetRbrush は、ブラシがまだ実体化されていないパターンブラシのときに呼ばれる。すなわち、BRUSHOBJ
構造体の iSolidColor メンバが 0xFFFFFFFF で pvRbrush メンバが null
のときである。BRUSHOBJ_pvGetRbrush 呼び出し時にブラシが実体化されていなければ、GDI はドライバ提供の
DrvRealizeBrush 関数を呼んでドライバによる実体化を取得する。GDI は高速化のため、この実体化を BRUSHOBJ
構造体の pvRbrush メンバにキャッシュする。これにより、アプリケーションが同じブラシを別の描画操作で再利用するときに、ドライバは
BRUSHOBJ_pvGetRbrush を再度呼ぶ必要がない。


%index
BRUSHOBJ_ulGetBrushColor
BRUSHOBJ_ulGetBrushColor 関数は、指定したソリッドブラシの RGB カラーを返す。
%prm
pbo
pbo : [var] 色を問い合わせる対象の BRUSHOBJ 構造体へのポインタ。
%inst
BRUSHOBJ_ulGetBrushColor 関数は、指定したソリッドブラシの RGB カラーを返す。

[戻り値]
BRUSHOBJ_ulGetBrushColor は、ソリッドブラシの RGB
カラーを返す。指定したブラシがソリッドでない場合、この関数は -1 を返す。

[備考]
BRUSHOBJ 構造体の iSolidColor
メンバに保存される色は、ターゲットサーフェスのパレットに変換されたインデックス値である。BRUSHOBJ_ulGetBrushColor
を使うと、ドライバは iSolidColor の元の RGB カラー値を問い合わせることができる。


%index
BeginPath
BeginPath 関数は、指定したデバイスコンテキストでパスブラケットをオープンする。
%prm
hdc
hdc : [intptr] デバイスコンテキストへのハンドル。
%inst
BeginPath 関数は、指定したデバイスコンテキストでパスブラケットをオープンする。

[戻り値]
関数が成功した場合、戻り値は非ゼロとなる。関数が失敗した場合、戻り値はゼロとなる。

[備考]
パスブラケットがオープンされた後、アプリケーションは GDI 描画関数を呼んでパスに含める点を定義できる。アプリケーションは
EndPath を呼んでオープン中のパスブラケットを閉じることができる。アプリケーションがデバイスコンテキストに対して BeginPath
を呼ぶと、そのデバイスコンテキスト上の以前のパスはすべて破棄される。次のリストは使用できる描画関数を示す。
（以下省略）


%index
BitBlt
指定した元デバイスコンテキストから先デバイスコンテキストへ、矩形分のピクセル色データのビットブロック転送を行う。
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
CLIPOBJ_bEnum
CLIPOBJ_bEnum 関数は、指定したクリップ領域から矩形のバッチを列挙する。列挙順序は事前の CLIPOBJ_cEnumStart 呼び出しによって決まる。
%prm
pco, cj, pul
pco : [var] 列挙対象のクリップ領域を表す CLIPOBJ 構造体へのポインタ。
cj : [int] pv が指すバッファのサイズ（バイト単位）。
pul : [var] クリップ領域に関するデータを ENUMRECTS 構造体として受け取るバッファへのポインタ。
%inst
CLIPOBJ_bEnum 関数は、指定したクリップ領域から矩形のバッチを列挙する。列挙順序は事前の CLIPOBJ_cEnumStart
呼び出しによって決まる。

[戻り値]
ドライバがさらに列挙データを取得するためにこの関数を再度呼ぶ必要があれば戻り値は TRUE、列挙が完了していれば FALSE
となる。CLIPOBJ_bEnum がクリッピング矩形数 0 で TRUE を返すこともある。その場合、ドライバは何もせずに再度
CLIPOBJ_bEnum を呼ぶべきである。

[備考]
この関数を呼び出すループ構造の例を以下に示す。
（以下省略）


%index
CLIPOBJ_cEnumStart
CLIPOBJ_cEnumStart 関数は、指定したクリップ領域内の矩形を列挙するためのパラメータを設定する。
%prm
pco, bAll, iType, iDirection, cLimit
pco : [var] 列挙対象のクリップ領域を定義する CLIPOBJ 構造体へのポインタ。
bAll : [int] 領域全体を列挙するかどうかを指定する。領域全体を列挙する場合は TRUE、現在の描画操作に関連する部分のみを列挙する場合は FALSE を指定する。クリップ領域をキャッシュするドライバは領域全体を列挙する必要がある。
iType : [int] CLIPOBJ_bEnum によって書き込まれるデータ構造を指定する。現在は CT_RECTANGLES のみ指定可能で、領域は矩形のリストとして列挙される。
iDirection : [int] 矩形を列挙する順序を決定する。同じサーフェス上で DrvBitBlt 操作が並行して実行される場合、この順序が重要になることがある。順序がデバイスドライバにとって重要でなければ、複雑な領域に対しては CD_ANY を指定して GDI に列挙の最適化を任せるべきである。次のいずれかを指定できる。
cLimit : [int] 列挙する矩形の最大数。0 を指定するとカウントは省略される。
%inst
CLIPOBJ_cEnumStart 関数は、指定したクリップ領域内の矩形を列挙するためのパラメータを設定する。

[戻り値]
戻り値は列挙される矩形の数となる。カウントが cLimit を超える場合、戻り値は 0xFFFFFFFF となる。

[備考]

この関数の呼び出しの有無に関係なく領域は列挙できる。デフォルトでは、ドライバは関連する矩形のみを左上から列挙する。再度この関数を呼ぶことで列挙を再開できる。


%index
CLIPOBJ_ppoGetPath
CLIPOBJ_ppoGetPath 関数は、指定したクリップ領域の輪郭を含む PATHOBJ 構造体を作成する。
%prm
pco
pco : [var] 指定したクリップ領域を定義する CLIPOBJ 構造体へのポインタ。
%inst
CLIPOBJ_ppoGetPath 関数は、指定したクリップ領域の輪郭を含む PATHOBJ 構造体を作成する。

[戻り値]
関数が成功した場合、戻り値は PATHOBJ 構造体へのポインタとなる。失敗した場合は NULL となり、エラーコードがログに記録される。

[備考]
返された PATHOBJ 構造体は、ドライバが不要になった時点で EngDeletePath
を使って削除すべきである。クリッピングパスをダウンロードできるデバイスのドライバは、複雑な領域を定義するのにこの関数を好むかもしれない。


%index
CancelDC
CancelDC 関数は、指定したデバイスコンテキスト (DC) で進行中の操作をキャンセルする。
%prm
hdc
hdc : [intptr] DC へのハンドル。
%inst
CancelDC 関数は、指定したデバイスコンテキスト (DC) で進行中の操作をキャンセルする。

[戻り値]
関数が成功した場合、戻り値は非ゼロとなる。関数が失敗した場合、戻り値はゼロとなる。

[備考]
CancelDC 関数は、長時間に及ぶ描画操作をキャンセルするためにマルチスレッドアプリケーションで使われる。スレッド A
が長時間の描画操作を開始した場合、スレッド B
がこの関数を呼んでその操作をキャンセルできる。操作がキャンセルされると、影響を受けたスレッドはエラーを返し、その描画操作の結果は未定義となる。関数を呼んだ時点で描画操作が進行中でなかった場合も、結果は未定義である。


%index
CheckColorsInGamut
CheckColorsInGamut 関数は、指定した RGB 三組の集合が指定デバイスの出力ガモット内にあるかどうかを判定する。RGB 三組は入力論理色空間として解釈される。
%prm
hdc, lpRGBTriple, dlpBuffer, nCount
hdc : [intptr] 出力ガモットを確認する対象のデバイスコンテキストへのハンドル。
lpRGBTriple : [var] 確認する RGB 三組の配列へのポインタ。
dlpBuffer : [intptr] 結果を格納するバッファへのポインタ。このバッファは少なくとも nCount バイト以上の大きさが必要である。
nCount : [int] 三組配列の要素数。
%inst
CheckColorsInGamut 関数は、指定した RGB 三組の集合が指定デバイスの出力ガモット内にあるかどうかを判定する。RGB
三組は入力論理色空間として解釈される。

[戻り値]
関数が成功した場合、戻り値は非ゼロ値となる。関数が失敗した場合、戻り値はゼロとなる。

[備考]
この関数はテスト結果を lpBuffer が指すバッファに格納する。バッファ内の各バイトは RGB 三組に対応し、CM_IN_GAMUT
(= 0) から CM_OUT_OF_GAMUT (= 255) までの符号なしの値となる。値 0
はその色がガモット内であることを示し、非ゼロ値はガモット外であることを示す。0 < n < 255 となる整数 n に対して、結果値 n
+ 1 は対応する色が結果値 n に示される程度以上にガモットから外れていることを示す（ICC Profile Format
Specification による）。ICC Profile Format Specification の詳細は [Further
information](/windows/win32/wcs/further-information)
のソースを参照。なお、この関数が成功するためには、hDC パラメータで渡されるデバイスコンテキストハンドルに対して WCS
が有効になっている必要がある。WCS は SetICMMode 関数を呼んで有効化できる。


%index
ChoosePixelFormat
ChoosePixelFormat 関数は、デバイスコンテキストでサポートされる適切なピクセルフォーマットを、与えられたピクセルフォーマット仕様にマッチさせる。
%prm
hdc, ppfd
hdc : [intptr] ppfd が指すピクセルフォーマット記述子に最もよく一致するものを判定するために、関数が調査するデバイスコンテキストを指定する。
ppfd : [var] 要求されたピクセルフォーマットを指定する PIXELFORMATDESCRIPTOR 構造体へのポインタ。この文脈では、ppfd が指す PIXELFORMATDESCRIPTOR 構造体のメンバは次のように使用される。
%inst
ChoosePixelFormat
関数は、デバイスコンテキストでサポートされる適切なピクセルフォーマットを、与えられたピクセルフォーマット仕様にマッチさせる。

[戻り値]
関数が成功した場合、戻り値は与えられたピクセルフォーマット記述子に最も近いピクセルフォーマットインデックス（1
始まり）となる。関数が失敗した場合、戻り値はゼロとなる。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]
ChoosePixelFormat 関数で一致したピクセルフォーマットが要件を満たすかは利用者が確認しなければならない。例えば 24
ビット RGB カラーバッファ付きピクセルフォーマットを要求しても、デバイスコンテキストが 8 ビット RGB
カラーバッファのみしか提供しない場合、関数は 8 ビット RGB カラーバッファ付きピクセルフォーマットを返す。


%index
Chord
Chord 関数は弦（楕円と線分（割線と呼ばれる）の交差で囲まれた領域）を描く。弦は現在のペンで輪郭を描き、現在のブラシで塗りつぶす。
%prm
hdc, x1, y1, x2, y2, x3, y3, x4, y4
hdc : [intptr] 弦が描かれるデバイスコンテキストへのハンドル。
x1 : [int] 外接矩形の左上隅の x 座標（論理座標）。
y1 : [int] 外接矩形の左上隅の y 座標（論理座標）。
x2 : [int] 外接矩形の右下隅の x 座標（論理座標）。
y2 : [int] 外接矩形の右下隅の y 座標（論理座標）。
x3 : [int] 弦の始点を定義する半径の終点の x 座標（論理座標）。
y3 : [int] 弦の始点を定義する半径の終点の y 座標（論理座標）。
x4 : [int] 弦の終点を定義する半径の終点の x 座標（論理座標）。
y4 : [int] 弦の終点を定義する半径の終点の y 座標（論理座標）。
%inst
Chord 関数は弦（楕円と線分（割線と呼ばれる）の交差で囲まれた領域）を描く。弦は現在のペンで輪郭を描き、現在のブラシで塗りつぶす。

[戻り値]
関数が成功した場合、戻り値は非ゼロとなる。関数が失敗した場合、戻り値はゼロとなる。

[備考]
弦の曲線は、指定した外接矩形に収まる楕円によって定義される。曲線は楕円が最初の半径と交わる点から始まり、楕円が 2
番目の半径と交わる点まで反時計回りに延びる。最初の半径と曲線の交点から 2
番目の半径と曲線の交点まで線を引いて弦を閉じる。曲線の始点と終点が同じであれば、完全な楕円が描かれる。Chord
では現在位置は使用も更新もされない。


%index
DeleteEnhMetaFile
DeleteEnhMetaFile 関数は、拡張形式メタファイルまたは拡張形式メタファイルハンドルを削除する。
%prm
hmf
hmf : [intptr] 拡張メタファイルへのハンドル。
%inst
DeleteEnhMetaFile 関数は、拡張形式メタファイルまたは拡張形式メタファイルハンドルを削除する。

[戻り値]
関数が成功した場合、戻り値は非ゼロとなる。関数が失敗した場合、戻り値はゼロとなる。

[備考]
hemf パラメータがメモリ内に保存された拡張メタファイルを識別する場合、DeleteEnhMetaFile
関数はそのメタファイルを削除する。hemf
がディスク上に保存されたメタファイルを識別する場合、関数はメタファイルハンドルを削除するが、実際のメタファイルは破壊しない。アプリケーションは
GetEnhMetaFile を呼んでファイルを取得できる。


%index
CloseEnhMetaFile
CloseEnhMetaFile 関数は、拡張メタファイルデバイスコンテキストを閉じ、拡張形式メタファイルを識別するハンドルを返す。
%prm
hdc
hdc : [intptr] 拡張メタファイルデバイスコンテキストへのハンドル。
%inst
CloseEnhMetaFile 関数は、拡張メタファイルデバイスコンテキストを閉じ、拡張形式メタファイルを識別するハンドルを返す。

[戻り値]
関数が成功した場合、戻り値は拡張メタファイルへのハンドルとなる。関数が失敗した場合、戻り値は NULL となる。

[備考]
アプリケーションは、CloseEnhMetaFile が返した拡張メタファイルハンドルを使って次のタスクを行うことができる。
（以下省略）


%index
CloseFigure
CloseFigure 関数は、パス内のオープンな図形を閉じる。
%prm
hdc
hdc : [intptr] 図形を閉じるデバイスコンテキストへのハンドル。
%inst
CloseFigure 関数は、パス内のオープンな図形を閉じる。

[戻り値]
関数が成功した場合、戻り値は非ゼロとなる。関数が失敗した場合、戻り値はゼロとなる。

[備考]
CloseFigure 関数は、現在位置から図形の最初の点（通常は最後の MoveToEx
呼び出しで指定された点）まで線を引き、ライン結合スタイルで線を結合することで図形を閉じる。CloseFigure ではなく LineTo
を使って図形を閉じた場合、結合ではなくエンドキャップを使って角が作られる。CloseFigure
関数は、指定したデバイスコンテキストにオープンなパスブラケットがあるときにのみ呼ぶべきである。パス内の図形は、この関数で明示的に閉じられない限りオープン状態である（現在位置と図形の始点が同じであっても、図形はオープンになり得る）。CloseFigure
呼び出し後、線や曲線をパスに追加すると新しい図形が始まる。


%index
DeleteMetaFile
DeleteMetaFile 関数は、Windows 形式メタファイルまたは Windows 形式メタファイルハンドルを削除する。
%prm
hmf
hmf : [intptr] Windows 形式メタファイルへのハンドル。
%inst
DeleteMetaFile 関数は、Windows 形式メタファイルまたは Windows 形式メタファイルハンドルを削除する。

[戻り値]
関数が成功した場合、戻り値は非ゼロとなる。関数が失敗した場合、戻り値はゼロとなる。

[備考]
hmf パラメータが識別するメタファイルが（ディスクではなく）メモリ内に保存されている場合、DeleteMetaFile
で削除されると内容は失われる。


%index
CloseMetaFile
CloseMetaFile 関数は、メタファイルデバイスコンテキストを閉じ、Windows 形式メタファイルを識別するハンドルを返す。
%prm
hdc
hdc : [intptr] Windows 形式メタファイルを作成するために使用したメタファイルデバイスコンテキストへのハンドル。
%inst
CloseMetaFile 関数は、メタファイルデバイスコンテキストを閉じ、Windows 形式メタファイルを識別するハンドルを返す。

[戻り値]
関数が成功した場合、戻り値は Windows 形式メタファイルへのハンドルとなる。関数が失敗した場合、戻り値は NULL となる。

[備考]
Windows 形式メタファイルを新しい拡張形式メタファイルに変換するには SetWinMetaFileBits を使う。Windows
形式メタファイルハンドルが不要になったら、DeleteMetaFile を呼んでハンドルを削除すべきである。


%index
ColorCorrectPalette
ColorCorrectPalette 関数は、指定したデバイスコンテキストの WCS 1.0 パラメータを使ってパレットのエントリを補正する。
%prm
hdc, hPal, deFirst, num
hdc : [intptr] WCS パラメータを使用するデバイスコンテキスト。
hPal : [intptr] カラー補正するパレットへのハンドル。
deFirst : [int] カラー補正するパレットの最初のエントリ。
num : [int] カラー補正するエントリの数。
%inst
ColorCorrectPalette 関数は、指定したデバイスコンテキストの WCS 1.0
パラメータを使ってパレットのエントリを補正する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。


%index
ColorMatchToTarget
ColorMatchToTarget 関数を使うと、ターゲットデバイスに表示されるとおりの色をプレビューできる。
%prm
hdc, hdcTarget, action
hdc : [intptr] プレビュー用デバイスコンテキスト。一般的には画面。
hdcTarget : [intptr] ターゲットデバイスコンテキスト。一般的にはプリンタ。
action : [int] 
%inst
ColorMatchToTarget 関数を使うと、ターゲットデバイスに表示されるとおりの色をプレビューできる。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。

[備考]
ColorMatchToTarget は、あるカラー出力デバイスの色を別のカラー出力デバイス上で校正するために使用できる。uiAction
パラメータを CS_ENABLE に設定すると、その後 DC
への描画コマンドはターゲットデバイス上に表示されるとおりに色をレンダリングする。uiAction を CS_DISABLE
に設定すると校正はオフになる。ただし、現在のカラー変換は DC
から削除されるわけではなく、単に非アクティブになるだけである。ColorMatchToTarget
が呼ばれると、まずターゲットデバイスのカラー変換が実行され、次にその結果に対してプレビューデバイスへの変換が適用される。これは主にガモットマッピング条件を確認するために使われる。この関数を使う前に、両方のデバイスコンテキストで
WCS を有効にしておく必要がある。この関数はカスケードできない。uiAction を CS_ENABLE
に設定してターゲットへのカラーマッピングを有効にしている間、アプリケーションによる色空間やガモットマッピング方法の変更は無視される。これらの変更は、ターゲットへのカラーマッピングが無効化された後で有効になる。注意:
アプリケーションが CS_DELETE_TRANSFORM で変換を削除しなくてもメモリリークは発生しない。デバイスコンテキスト (DC)
が閉じられるか、アプリケーションの色空間が削除されると変換は削除される。ただし変換を再使用しない、あるいは DC
でこれ以上カラーマッチングを行わない場合は、メモリ解放のため明示的に変換を削除すべきである。uiAction を
CS_DELETE_TRANSFORM に設定するのは、ColorMatchToTarget
を呼ぶ前にカラーマネジメントが有効になっている場合のみとすべきである。


%index
CombineRgn
CombineRgn 関数は 2 つの領域を結合し、その結果を 3 番目の領域に格納する。2 つの領域は指定したモードに従って結合される。
%prm
hrgnDst, hrgnSrc1, hrgnSrc2, iMode
hrgnDst : [intptr] 他の 2 つの領域を結合して定義された寸法を持つ新しい領域へのハンドル（CombineRgn を呼び出す前にこの領域は存在していなければならない）。
hrgnSrc1 : [intptr] 結合する 2 つの領域のうち最初のものへのハンドル。
hrgnSrc2 : [intptr] 結合する 2 つの領域のうち 2 番目のものへのハンドル。
iMode : [int] 
%inst
CombineRgn 関数は 2 つの領域を結合し、その結果を 3 番目の領域に格納する。2 つの領域は指定したモードに従って結合される。

[戻り値]
戻り値は結果として得られる領域の種類を示す。次のいずれかの値となる。
（以下省略）

[備考]
3 つの領域は別々である必要はない。例えば hrgnSrc1 パラメータは hrgnDest パラメータと同じでもよい。


%index
CombineTransform
CombineTransform 関数は、ワールド空間からページ空間への 2 つの変換を連結する。
%prm
lpxfOut, lpxf1, lpxf2
lpxfOut : [var] 結合された変換を受け取る XFORM 構造体へのポインタ。
lpxf1 : [var] 最初の変換を指定する XFORM 構造体へのポインタ。
lpxf2 : [var] 2 番目の変換を指定する XFORM 構造体へのポインタ。
%inst
CombineTransform 関数は、ワールド空間からページ空間への 2 つの変換を連結する。

[戻り値]
関数が成功した場合、戻り値は非ゼロとなる。関数が失敗した場合、戻り値はゼロとなる。

[備考]
結合された変換を適用することは、最初の変換を適用してから 2 番目の変換を適用することと同じ効果を持つ。3
つの変換は別々である必要はない。例えば lpxform1 は lpxformResult と同じ XFORM 構造体を指してもよい。


%index
CopyEnhMetaFileW
CopyEnhMetaFile 関数は、拡張形式メタファイルの内容を指定したファイルにコピーする。(Unicode)
%prm
hEnh, lpFileName
hEnh : [intptr] コピーする拡張メタファイルへのハンドル。
lpFileName : [wstr] 宛先ファイル名へのポインタ。NULL の場合、ソースメタファイルはメモリにコピーされる。
%inst
CopyEnhMetaFile 関数は、拡張形式メタファイルの内容を指定したファイルにコピーする。(Unicode)

[戻り値]
関数が成功した場合、戻り値は拡張メタファイルのコピーへのハンドルとなる。関数が失敗した場合、戻り値は NULL となる。

[備考]
テキスト引数で Unicode 文字を使う必要がある場合は CopyEnhMetaFile をワイド文字関数として使う。テキスト引数で
Windows 文字セットの文字を使う必要がある場合はこの関数を ANSI
関数として使う。アプリケーションは一時的な操作のためにメモリ内に保存されたメタファイルを使うことができる。アプリケーションが拡張メタファイルハンドルを必要としなくなったら、DeleteEnhMetaFile
を呼んで削除すべきである。
> [!NOTE] > wingdi.h ヘッダは CopyEnhMetaFile を、UNICODE
プリプロセッサ定数の定義に応じて自動的に ANSI 版か Unicode
版を選択するエイリアスとして定義する。エンコーディング中立のエイリアスとそうでないコードを混在させると、コンパイルや実行時のエラーにつながるミスマッチが生じることがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
CopyMetaFileW
CopyMetaFile 関数は、Windows 形式メタファイルの内容を指定したファイルにコピーする。(Unicode)
%prm
param0, param1
param0 : [intptr] 
param1 : [wstr] 
%inst
CopyMetaFile 関数は、Windows 形式メタファイルの内容を指定したファイルにコピーする。(Unicode)

[戻り値]
関数が成功した場合、戻り値は Windows 形式メタファイルのコピーへのハンドルとなる。関数が失敗した場合、戻り値は NULL となる。

[備考]
テキスト引数で Unicode 文字を使う必要がある場合は、この関数をワイド文字関数として使う。テキスト引数で Windows
文字セットの文字を使う必要がある場合は、この関数を ANSI 関数として使う。アプリケーションが Windows
形式メタファイルハンドルを必要としなくなったら、DeleteMetaFile を呼んで削除すべきである。
> [!NOTE] > wingdi.h ヘッダは CopyMetaFile を、UNICODE プリプロセッサ定数の定義に応じて自動的に
ANSI 版か Unicode
版を選択するエイリアスとして定義する。エンコーディング中立のエイリアスとそうでないコードを混在させると、コンパイルや実行時のエラーにつながるミスマッチが生じることがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
CreateBitmap
指定した幅、高さ、色形式(カラープレーン数およびピクセルあたりのビット数)を持つビットマップを作成する。
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
CreateBitmapIndirect
CreateBitmapIndirect 関数は、指定された幅、高さ、色フォーマット（カラープレーンと bpp）を持つビットマップを作成する。
%prm
pbm
pbm : [var] ビットマップに関する情報を含む BITMAP 構造体へのポインタ。アプリケーションが bmWidth または bmHeight メンバを 0 に設定した場合、CreateBitmapIndirect は 1×1 ピクセルのモノクロビットマップへのハンドルを返す。
%inst
CreateBitmapIndirect 関数は、指定された幅、高さ、色フォーマット（カラープレーンと
bpp）を持つビットマップを作成する。

[戻り値]
関数が成功した場合、戻り値はビットマップへのハンドルとなる。関数が失敗した場合、戻り値は NULL
となる。この関数は次の値を返すことがある。
（以下省略）

[備考]
CreateBitmapIndirect 関数はデバイス依存ビットマップを作成する。ビットマップを作成した後は、SelectObject
を呼んでデバイスコンテキストに選択できる。ただし、ビットマップとデバイスコンテキストのフォーマットが同じ場合に限る。CreateBitmapIndirect
でカラービットマップも作成できるが、性能上の理由から、アプリケーションはモノクロビットマップを CreateBitmapIndirect
で作成し、カラービットマップは CreateCompatibleBitmap で作成すべきである。CreateBitmapIndirect
で得たカラービットマップをデバイスコンテキストに選択するたびに、システムはビットマップのフォーマットが選択先 DC
のフォーマットと一致するかを確認しなければならない。CreateCompatibleBitmap
はデバイスコンテキストを引数に取るので、そのデバイスコンテキストと同じフォーマットのビットマップを返す。よって、CreateCompatibleBitmap
で得たカラービットマップに対する SelectObject の呼び出しは、CreateBitmapIndirect
で得たものより高速になる。ビットマップがモノクロの場合、0 が前景色、1
が宛先デバイスコンテキストの背景色を表す。ビットマップが不要になったら DeleteObject を呼んで削除する。


%index
CreateBrushIndirect
CreateBrushIndirect 関数は、指定したスタイル、色、パターンを持つ論理ブラシを作成する。
%prm
plbrush
plbrush : [var] ブラシに関する情報を含む LOGBRUSH 構造体へのポインタ。
%inst
CreateBrushIndirect 関数は、指定したスタイル、色、パターンを持つ論理ブラシを作成する。

[戻り値]
関数が成功した場合、戻り値は論理ブラシを識別する。関数が失敗した場合、戻り値は NULL となる。

[備考]
ブラシは、システムが塗りつぶされた図形の内側を描画するために使用するビットマップである。アプリケーションは
CreateBrushIndirect でブラシを作成した後、SelectObject
を呼んで任意のデバイスコンテキストに選択できる。モノクロビットマップ（1 カラープレーン、1
bpp）から作成されたブラシは、現在のテキスト色と背景色で描画される。0 のビットで表されるピクセルは現在のテキスト色で、1
のビットで表されるピクセルは現在の背景色で描画される。ブラシが不要になったら DeleteObject を呼んで削除する。ICM:
ブラシ作成時にカラー処理は行われない。ただし、ブラシが ICM
対応のデバイスコンテキストに選択されたときにカラーマネジメントが実行される。


%index
DeleteColorSpace
DeleteColorSpace 関数は、指定した色空間を削除し破棄する。
%prm
hcs
hcs : [intptr] 削除する色空間へのハンドル。
%inst
DeleteColorSpace 関数は、指定した色空間を削除し破棄する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。


%index
CreateColorSpaceW
CreateColorSpace 関数は論理色空間を作成する。(Unicode)
%prm
lplcs
lplcs : [var] LOGCOLORSPACE データ構造へのポインタ。
%inst
CreateColorSpace 関数は論理色空間を作成する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は色空間を識別するハンドルとなる。関数が失敗した場合、戻り値は NULL となる。

[備考]
色空間が不要になったら DeleteColorSpace で削除する。Windows 95/98/Me:
CreateColorSpaceW は Microsoft Layer for Unicode
によりサポートされる。これを使用するには、Microsoft Layer for Unicode on Windows 95/98/Me
Systems で説明されているとおり、特定のファイルをアプリケーションに追加しなければならない。
> [!NOTE] > wingdi.h ヘッダは CreateColorSpace を、UNICODE
プリプロセッサ定数の定義に応じて自動的に ANSI 版か Unicode
版を選択するエイリアスとして定義する。エンコーディング中立のエイリアスとそうでないコードを混在させると、コンパイルや実行時のエラーにつながるミスマッチが生じることがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
CreateCompatibleBitmap
指定したデバイスコンテキストに関連付けられたデバイスと互換のあるビットマップを作成する。
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
CreateDCA
CreateDC 関数は、指定した名前のデバイス用にデバイスコンテキスト (DC) を作成する。(ANSI)
%prm
pwszDriver, pwszDevice, pszPort, pdm
pwszDriver : [str] DISPLAY または特定のディスプレイデバイス名を指定する null 終端文字列へのポインタ。印刷の場合、GDI はプリンタデバイスでは lpszDriver を無視するため、NULL を渡すことを推奨する。
pwszDevice : [str] プリントマネージャーで表示される、使用中の出力デバイスの名前（例：Epson FX-80）を指定する null 終端文字列へのポインタ。プリンターのモデル名ではない。lpszDevice パラメータは必ず使わなければならない。ディスプレイの有効な名前を取得するには EnumDisplayDevices を呼ぶ。lpszDriver が DISPLAY または特定のディスプレイデバイスのデバイス名の場合、lpszDevice は NULL かそのデバイス名と同じでなければならない。lpszDevice が NULL の場合、プライマリディスプレイデバイス用の DC が作成される。システムに複数のモニターがある場合、CreateDC(TEXT("DISPLAY"),NULL,NULL,NULL) を呼ぶとすべてのモニターをカバーする DC が作成される。
pszPort : [str] このパラメータは無視され、NULL に設定するべきである。16 ビット Windows との互換性のためだけに用意されている。
pdm : [var] デバイスドライバ向けのデバイス固有初期化データを含む DEVMODE 構造体へのポインタ。DocumentProperties 関数は、指定したデバイス用に値が設定されたこの構造体を取得する。デバイスドライバがユーザー指定のデフォルト初期化（あれば）を使うべき場合、pdm パラメータは NULL でなければならない。lpszDriver が DISPLAY の場合、pdm は NULL でなければならない。GDI はディスプレイデバイスの現在の DEVMODE を使う。
%inst
CreateDC 関数は、指定した名前のデバイス用にデバイスコンテキスト (DC) を作成する。(ANSI)

[戻り値]
関数が成功した場合、戻り値は指定したデバイス用 DC へのハンドルとなる。関数が失敗した場合、戻り値は NULL となる。

[備考]
DC へのハンドルは同時に 1 つのスレッドからしか使用できないことに注意。lpszDriver と lpszDevice
パラメータについては、ディスプレイの有効な名前を取得するには EnumDisplayDevices を呼ぶ。DC が不要になったら
DeleteDC を呼ぶ。lpszDriver または lpszDevice が DISPLAY の場合、CreateDC
を呼んだスレッドが作成された HDC を所有する。このスレッドが破棄されると HDC は無効になる。よって HDC
を作成して別スレッドへ渡し、最初のスレッドを終了させると、2 番目のスレッドはその HDC を使用できない。CreateDC
でディスプレイデバイス用 HDC を作成する場合、pdm には NULL か、lpszDevice が指定するディスプレイデバイスの現在の
DEVMODE と一致する DEVMODE へのポインタを渡さなければならない。NULL を渡し、現在のディスプレイデバイスの
DEVMODE と完全に一致させようとしないことを推奨する。CreateDC でプリンタデバイス用 HDC
を作成する場合、プリンタドライバが DEVMODE を検証する。プリンタドライバが DEVMODE
を無効と判断した場合（プリンタドライバが DEVMODE を変換または使用できない場合）、プリンタドライバはデフォルトの DEVMODE
を提供して HDC を作成する。ICM: ICM を有効にするには、pInitData パラメータが指す DEVMODE 構造体の
dmICMMethod メンバを適切な値に設定する。


%index
CreateDCW
CreateDC 関数は、指定した名前のデバイス用にデバイスコンテキスト (DC) を作成する。(Unicode)
%prm
pwszDriver, pwszDevice, pszPort, pdm
pwszDriver : [wstr] DISPLAY または特定のディスプレイデバイス名を指定する null 終端文字列へのポインタ。印刷の場合、GDI はプリンタデバイスでは lpszDriver を無視するため、NULL を渡すことを推奨する。
pwszDevice : [wstr] プリントマネージャーで表示される、使用中の出力デバイスの名前（例：Epson FX-80）を指定する null 終端文字列へのポインタ。プリンターのモデル名ではない。lpszDevice パラメータは必ず使わなければならない。ディスプレイの有効な名前を取得するには EnumDisplayDevices を呼ぶ。lpszDriver が DISPLAY または特定のディスプレイデバイスのデバイス名の場合、lpszDevice は NULL かそのデバイス名と同じでなければならない。lpszDevice が NULL の場合、プライマリディスプレイデバイス用の DC が作成される。システムに複数のモニターがある場合、CreateDC(TEXT("DISPLAY"),NULL,NULL,NULL) を呼ぶとすべてのモニターをカバーする DC が作成される。
pszPort : [wstr] このパラメータは無視され、NULL に設定するべきである。16 ビット Windows との互換性のためだけに用意されている。
pdm : [var] デバイスドライバ向けのデバイス固有初期化データを含む DEVMODE 構造体へのポインタ。DocumentProperties 関数は、指定したデバイス用に値が設定されたこの構造体を取得する。デバイスドライバがユーザー指定のデフォルト初期化（あれば）を使うべき場合、pdm パラメータは NULL でなければならない。lpszDriver が DISPLAY の場合、pdm は NULL でなければならない。GDI はディスプレイデバイスの現在の DEVMODE を使う。
%inst
CreateDC 関数は、指定した名前のデバイス用にデバイスコンテキスト (DC) を作成する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は指定したデバイス用 DC へのハンドルとなる。関数が失敗した場合、戻り値は NULL となる。

[備考]
DC へのハンドルは同時に 1 つのスレッドからしか使用できないことに注意。lpszDriver と lpszDevice
パラメータについては、ディスプレイの有効な名前を取得するには EnumDisplayDevices を呼ぶ。DC が不要になったら
DeleteDC を呼ぶ。lpszDriver または lpszDevice が DISPLAY の場合、CreateDC
を呼んだスレッドが作成された HDC を所有する。このスレッドが破棄されると HDC は無効になる。よって HDC
を作成して別スレッドへ渡し、最初のスレッドを終了させると、2 番目のスレッドはその HDC を使用できない。CreateDC
でディスプレイデバイス用 HDC を作成する場合、pdm には NULL か、lpszDevice が指定するディスプレイデバイスの現在の
DEVMODE と一致する DEVMODE へのポインタを渡さなければならない。NULL を渡し、現在のディスプレイデバイスの
DEVMODE と完全に一致させようとしないことを推奨する。CreateDC でプリンタデバイス用 HDC
を作成する場合、プリンタドライバが DEVMODE を検証する。プリンタドライバが DEVMODE
を無効と判断した場合（プリンタドライバが DEVMODE を変換または使用できない場合）、プリンタドライバはデフォルトの DEVMODE
を提供して HDC を作成する。ICM: ICM を有効にするには、pInitData パラメータが指す DEVMODE 構造体の
dmICMMethod メンバを適切な値に設定する。


%index
CreateDIBPatternBrush
CreateDIBPatternBrush 関数は、指定したデバイス独立ビットマップ (DIB) で指定されたパターンを持つ論理ブラシを作成する。
%prm
h, iUsage
h : [int] BITMAPINFO 構造体の直後にビットマップのピクセルを定義するバイト配列が続く、パックド DIB を含むグローバルメモリオブジェクトへのハンドル。
iUsage : [int] 
%inst
CreateDIBPatternBrush 関数は、指定したデバイス独立ビットマップ (DIB)
で指定されたパターンを持つ論理ブラシを作成する。

[戻り値]
関数が成功した場合、戻り値は論理ブラシを識別する。関数が失敗した場合、戻り値は NULL となる。

[備考]
アプリケーションが 2 色 DIB パターンブラシをモノクロデバイスコンテキストに選択した場合、システムは DIB
に指定された色を認識せず、デバイスコンテキストの現在の背景色と前景色を使ってパターンブラシを表示する。DIB の最初の色（DIB
カラーテーブルのオフセット 0）にマップされたピクセルは前景色で表示され、2 番目の色（カラーテーブルのオフセット
1）にマップされたピクセルは背景色で表示される。ブラシが不要になったら DeleteObject を呼んで削除する。ICM:
ブラシ作成時にカラー処理は行われない。ただし、ブラシが ICM
対応のデバイスコンテキストに選択されたときにカラーマネジメントが実行される。


%index
CreateDIBPatternBrushPt
CreateDIBPatternBrushPt 関数は、デバイス独立ビットマップ (DIB) で指定されたパターンを持つ論理ブラシを作成する。
%prm
lpPackedDIB, iUsage
lpPackedDIB : [intptr] BITMAPINFO 構造体の直後にビットマップのピクセルを定義するバイト配列が続くパックド DIB へのポインタ。
iUsage : [int] 
%inst
CreateDIBPatternBrushPt 関数は、デバイス独立ビットマップ (DIB)
で指定されたパターンを持つ論理ブラシを作成する。

[戻り値]
関数が成功した場合、戻り値は論理ブラシを識別する。関数が失敗した場合、戻り値は NULL となる。

[備考]
ブラシは、システムが塗りつぶされた図形の内側を描画するために使用するビットマップである。アプリケーションは
CreateDIBPatternBrushPt でブラシを作成した後、SelectObject
を呼んで任意のデバイスコンテキストに選択できる。ブラシが不要になったら DeleteObject を呼んで削除する。ICM:
ブラシ作成時にカラー処理は行われない。ただし、ブラシが ICM
対応のデバイスコンテキストに選択されたときにカラーマネジメントが実行される。


%index
CreateDIBSection
アプリケーションが直接書き込める DIB を作成する。
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
CreateDIBitmap
CreateDIBitmap 関数は DIB から互換ビットマップ (DDB) を作成し、必要に応じてビットマップビットを設定する。
%prm
hdc, pbmih, flInit, pjBits, pbmi, iUsage
hdc : [intptr] デバイスコンテキストへのハンドル。
pbmih : [var] ビットマップ情報ヘッダ構造体 BITMAPV5HEADER へのポインタ。fdwInit が CBM_INIT の場合、関数はビットマップ情報ヘッダ構造体を使ってビットマップに必要な幅、高さ、その他の情報を取得する。高さの正値は下から上の DIB を、負値は上から下の DIB を示すことに注意。CBM_INIT を fdwInit に指定して CreateDIBitmap を呼ぶことは、CreateCompatibleBitmap を呼んでデバイスのフォーマットの DDB を作成し、その後 SetDIBits を呼んで DIB ビットを DDB に変換することと等価である。
flInit : [int] システムがビットマップビットを初期化する方法を指定する。次の値が定義されている。
pjBits : [intptr] 初期ビットマップデータを含むバイト配列へのポインタ。データのフォーマットは、lpbmi パラメータが指す BITMAPINFO 構造体の biBitCount メンバに依存する。
pbmi : [var] lpbInit パラメータが指す配列の寸法と色フォーマットを記述する BITMAPINFO 構造体へのポインタ。
iUsage : [int] 
%inst
CreateDIBitmap 関数は DIB から互換ビットマップ (DDB) を作成し、必要に応じてビットマップビットを設定する。

[戻り値]
関数が成功した場合、戻り値は互換ビットマップへのハンドルとなる。関数が失敗した場合、戻り値は NULL となる。

[備考]
作成される DDB は、リファレンス DC のビット深度になる。異なるビット深度のビットマップを作成するには
CreateDIBSection を使う。デバイスが最適なビットマップ描画速度に達するためには、fdwInit に CBM_INIT
を指定する。そして DIB をビデオモードと同じ色深度にする。ビデオが 4 または 8 bpp の場合は DIB_PAL_COLORS
を使う。fdwInit パラメータの CBM_CREATDIB フラグはサポートされなくなった。ビットマップが不要になったら
DeleteObject を呼んで削除する。ICM:
カラーマネジメントは実行されない。作成された結果のビットマップの内容はカラーマッチされない。


%index
CreateDiscardableBitmap
CreateDiscardableBitmap 関数は、指定したデバイスと互換性のある破棄可能なビットマップを作成する。
%prm
hdc, cx, cy
hdc : [intptr] デバイスコンテキストへのハンドル。
cx : [int] ビットマップの幅（ピクセル単位）。
cy : [int] ビットマップの高さ（ピクセル単位）。
%inst
CreateDiscardableBitmap 関数は、指定したデバイスと互換性のある破棄可能なビットマップを作成する。

[戻り値]
関数が成功した場合、戻り値は互換ビットマップ (DDB) へのハンドルとなる。関数が失敗した場合、戻り値は NULL となる。

[備考]
ビットマップが不要になったら DeleteObject を呼んで削除する。


%index
CreateEllipticRgn
CreateEllipticRgn 関数は楕円リージョンを作成する。
%prm
x1, y1, x2, y2
x1 : [int] 楕円の外接矩形の左上隅の x 座標（論理単位）。
y1 : [int] 楕円の外接矩形の左上隅の y 座標（論理単位）。
x2 : [int] 楕円の外接矩形の右下隅の x 座標（論理単位）。
y2 : [int] 楕円の外接矩形の右下隅の y 座標（論理単位）。
%inst
CreateEllipticRgn 関数は楕円リージョンを作成する。

[戻り値]
関数が成功した場合、戻り値はリージョンへのハンドルとなる。関数が失敗した場合、戻り値は NULL となる。

[備考]
HRGN オブジェクトが不要になったら DeleteObject
を呼んで削除する。外接矩形は領域のサイズ・形状・向きを定義する。矩形の長辺は楕円の長軸の長さを定義し、短辺は短軸の長さを定義する。矩形の中心が長軸と短軸の交点を定義する。


%index
CreateEllipticRgnIndirect
CreateEllipticRgnIndirect 関数は楕円リージョンを作成する。
%prm
lprect
lprect : [var] 楕円の外接矩形の左上隅と右下隅の座標（論理単位）を含む RECT 構造体へのポインタ。
%inst
CreateEllipticRgnIndirect 関数は楕円リージョンを作成する。

[戻り値]
関数が成功した場合、戻り値はリージョンへのハンドルとなる。関数が失敗した場合、戻り値は NULL となる。

[備考]
HRGN オブジェクトが不要になったら DeleteObject
を呼んで削除する。外接矩形は領域のサイズ・形状・向きを定義する。矩形の長辺は楕円の長軸の長さを定義し、短辺は短軸の長さを定義する。矩形の中心が長軸と短軸の交点を定義する。


%index
CreateEnhMetaFileW
CreateEnhMetaFile 関数は拡張形式メタファイル用のデバイスコンテキストを作成する。このデバイスコンテキストはデバイス独立な図を保存するために使用できる。(Unicode)
%prm
hdc, lpFilename, lprc, lpDesc
hdc : [intptr] 拡張メタファイル用のリファレンスデバイスへのハンドル。NULL を指定可能。詳細は備考を参照。
lpFilename : [wstr] 作成する拡張メタファイルのファイル名へのポインタ。NULL の場合、拡張メタファイルはメモリ上に置かれ、DeleteEnhMetaFile で削除されると内容が失われる。
lprc : [var] 拡張メタファイルに保存する図の寸法（0.01 ミリ単位）を指定する RECT 構造体へのポインタ。
lpDesc : [wstr] 図を作成したアプリケーションの名前と図のタイトルを指定する文字列へのポインタ。NULL を指定可能。詳細は備考を参照。
%inst
CreateEnhMetaFile
関数は拡張形式メタファイル用のデバイスコンテキストを作成する。このデバイスコンテキストはデバイス独立な図を保存するために使用できる。(Unicode)

[戻り値]
関数が成功した場合、戻り値は拡張メタファイル用のデバイスコンテキストへのハンドルとなる。関数が失敗した場合、戻り値は NULL となる。

[備考]
テキスト引数で Unicode 文字を使う必要がある場合は CreateEnhMetaFile をワイド文字関数として使う。テキスト引数で
Windows 文字セットの文字を使う必要がある場合はこの関数を ANSI 関数として使う。システムは hdcRef
パラメータで指定されたリファレンスデバイスを使用して、図が元々表示されていたデバイスの解像度と単位を記録する。hdcRef パラメータが
NULL の場合、現在のディスプレイデバイスをリファレンスとして使う。lpRect パラメータが指す RECT 構造体の left と
top メンバは、それぞれ right と bottom メンバより小さくなければならない。矩形の辺上の点も図に含まれる。lpRect が
NULL の場合、グラフィックスデバイスインターフェイス (GDI)
はアプリケーションが描画した図を囲む最小矩形の寸法を計算する。可能な場合は lpRect
パラメータを指定すべきである。lpDescription パラメータが指す文字列は、アプリケーション名と図名の間に null
文字を含み、2 つの null 文字で終わらなければならない。例："XYZ Graphics Editor\0Bald
Eagle\0\0"（\0 は null 文字）。lpDescription が NULL
の場合、拡張メタファイルヘッダに対応するエントリは入らない。アプリケーションは、この関数で作成したデバイスコンテキストを使ってグラフィックス図を拡張メタファイルに保存する。このデバイスコンテキストを識別するハンドルは任意の
GDI 関数に渡せる。アプリケーションが図を拡張メタファイルに保存した後、PlayEnhMetaFile
を呼ぶことで任意の出力デバイス上に図を表示できる。図を表示する際、システムは lpRect
パラメータが指す矩形とリファレンスデバイスからの解像度データを使って図を配置・スケーリングする。この関数が返すデバイスコンテキストには、新しいデバイスコンテキストに関連付けられているのと同じデフォルト属性が含まれる。アプリケーションは
GetWinMetaFileBits を使って拡張メタファイルを古い Windows
メタファイル形式に変換しなければならない。拡張メタファイルのファイル名には .emf 拡張子を使うべきである。


%index
CreateFontW
指定された特性を持つ論理フォントを作成する。論理フォントは任意のデバイスのフォントとして選択できる。(Unicode)
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
CreateFontIndirectExW
CreateFontIndirectEx 関数は、指定した構造体内の特性を持つ論理フォントを指定する。このフォントはその後、任意のデバイスコンテキストの現在のフォントとして選択できる。(Unicode)
%prm
param0
param0 : [var] 
%inst
CreateFontIndirectEx
関数は、指定した構造体内の特性を持つ論理フォントを指定する。このフォントはその後、任意のデバイスコンテキストの現在のフォントとして選択できる。(Unicode)

[戻り値]
関数が成功した場合、戻り値は新しい ENUMLOGFONTEXDV
構造体へのハンドルとなる。関数が失敗した場合、戻り値はゼロとなる。拡張エラー情報は得られない。

[備考]
CreateFontIndirectEx 関数は、ENUMLOGFONTEXDV
構造体で指定された特性を持つ論理フォントを作成する。SelectObject でこのフォントが選択されると、GDI
のフォントマッパは論理フォントを既存の物理フォントとマッチングしようとする。完全一致が見つからなかった場合、要求された特性をできるだけ多く満たす代替を提供する。フォントが不要になったら
DeleteObject
を呼んで削除する。CreateFont、CreateFontIndirect、CreateFontIndirectEx
のフォントマッパは、ロケールに関係なく英語名とローカライズされた書体名の両方を認識する。
> [!NOTE] > wingdi.h ヘッダは CreateFontIndirectEx を、UNICODE
プリプロセッサ定数の定義に応じて自動的に ANSI 版か Unicode
版を選択するエイリアスとして定義する。エンコーディング中立のエイリアスとそうでないコードを混在させると、コンパイルや実行時のエラーにつながるミスマッチが生じることがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
CreateHalftonePalette
CreateHalftonePalette 関数は、指定したデバイスコンテキスト (DC) 用のハーフトーンパレットを作成する。
%prm
hdc
hdc : [intptr] デバイスコンテキストへのハンドル。
%inst
CreateHalftonePalette 関数は、指定したデバイスコンテキスト (DC) 用のハーフトーンパレットを作成する。

[戻り値]
関数が成功した場合、戻り値は論理ハーフトーンパレットへのハンドルとなる。関数が失敗した場合、戻り値はゼロとなる。

[備考]
アプリケーションは、デバイスコンテキストのストレッチモードが HALFTONE
に設定されている場合にハーフトーンパレットを作成すべきである。CreateHalftonePalette
が返した論理ハーフトーンパレットは、StretchBlt や StretchDIBits
を呼ぶ前にデバイスコンテキストに選択して実体化すべきである。パレットが不要になったら DeleteObject を呼んで削除する。


%index
CreateHatchBrush
指定されたハッチパターンと色を持つ論理ブラシを作成する。
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
CreateICA
CreateIC 関数は、指定したデバイス用の情報コンテキストを作成する。(ANSI)
%prm
pszDriver, pszDevice, pszPort, pdm
pszDriver : [str] デバイスドライバの名前（例：Epson）を指定する null 終端文字列へのポインタ。
pszDevice : [str] プリントマネージャーで表示される、使用中の出力デバイスの名前（例：Epson FX-80）を指定する null 終端文字列へのポインタ。プリンターのモデル名ではない。lpszDevice パラメータは必ず使用しなければならない。
pszPort : [str] このパラメータは無視され、NULL に設定するべきである。16 ビット Windows との互換性のためだけに用意されている。
pdm : [var] デバイスドライバ向けのデバイス固有初期化データを含む DEVMODE 構造体へのポインタ。DocumentProperties 関数は、指定したデバイス用に値が設定されたこの構造体を取得する。デバイスドライバがユーザー指定のデフォルト初期化（あれば）を使うべき場合、lpdvmInit パラメータは NULL でなければならない。
%inst
CreateIC 関数は、指定したデバイス用の情報コンテキストを作成する。(ANSI)

[戻り値]
関数が成功した場合、戻り値は情報コンテキストへのハンドルとなる。関数が失敗した場合、戻り値は NULL となる。

[備考]
情報 DC が不要になったら DeleteDC を呼ぶ。
> [!NOTE] > wingdi.h ヘッダは CreateIC を、UNICODE プリプロセッサ定数の定義に応じて自動的に
ANSI 版か Unicode
版を選択するエイリアスとして定義する。エンコーディング中立のエイリアスとそうでないコードを混在させると、コンパイルや実行時のエラーにつながるミスマッチが生じることがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
CreateICW
CreateIC 関数は、指定したデバイス用の情報コンテキストを作成する。(Unicode)
%prm
pszDriver, pszDevice, pszPort, pdm
pszDriver : [wstr] デバイスドライバの名前（例：Epson）を指定する null 終端文字列へのポインタ。
pszDevice : [wstr] プリントマネージャーで表示される、使用中の出力デバイスの名前（例：Epson FX-80）を指定する null 終端文字列へのポインタ。プリンターのモデル名ではない。lpszDevice パラメータは必ず使用しなければならない。
pszPort : [wstr] このパラメータは無視され、NULL に設定するべきである。16 ビット Windows との互換性のためだけに用意されている。
pdm : [var] デバイスドライバ向けのデバイス固有初期化データを含む DEVMODE 構造体へのポインタ。DocumentProperties 関数は、指定したデバイス用に値が設定されたこの構造体を取得する。デバイスドライバがユーザー指定のデフォルト初期化（あれば）を使うべき場合、lpdvmInit パラメータは NULL でなければならない。
%inst
CreateIC 関数は、指定したデバイス用の情報コンテキストを作成する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は情報コンテキストへのハンドルとなる。関数が失敗した場合、戻り値は NULL となる。

[備考]
情報 DC が不要になったら DeleteDC を呼ぶ。
> [!NOTE] > wingdi.h ヘッダは CreateIC を、UNICODE プリプロセッサ定数の定義に応じて自動的に
ANSI 版か Unicode
版を選択するエイリアスとして定義する。エンコーディング中立のエイリアスとそうでないコードを混在させると、コンパイルや実行時のエラーにつながるミスマッチが生じることがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
CreateMetaFileW
CreateMetaFile 関数は、Windows 形式メタファイル用のデバイスコンテキストを作成する。(Unicode)
%prm
pszFile
pszFile : [wstr] 作成する Windows 形式メタファイルのファイル名へのポインタ。NULL の場合、Windows 形式メタファイルはメモリ上に置かれ、DeleteMetaFile で削除されると内容が失われる。
%inst
CreateMetaFile 関数は、Windows 形式メタファイル用のデバイスコンテキストを作成する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は Windows 形式メタファイル用デバイスコンテキストへのハンドルとなる。関数が失敗した場合、戻り値は
NULL となる。

[備考]
テキスト引数で Unicode 文字を使う必要がある場合は CreateMetaFile をワイド文字関数として使う。テキスト引数で
Windows 文字セットの文字を使う必要がある場合はこの関数を ANSI 関数として使う。CreateMetaFile は
Windows 形式メタファイル関数である。この関数は、Windows-Format Metafiles に列挙されている 16 ビット
Windows ベースのアプリケーションのみをサポートする。16 ビット Windows の一部ではなかった PolyBezier などの
GDI 関数は記録・再生できない。この関数で作成されるデバイスコンテキストは、GDI 出力関数を Windows
形式メタファイルに記録するために使用できる。GetTextColor のような GDI クエリ関数とは併用できない。デバイスコンテキストが
GDI 出力関数で使用されるとき、その関数の戻り値は記録された場合は TRUE、それ以外は FALSE になる。SelectObject
でオブジェクトを選択すると、オブジェクトのコピーのみが記録される。オブジェクト自体は引き続きアプリケーションが所有する。スケーラブルな
Windows 形式メタファイルを作成するには、MM_ANISOTROPIC
マッピングモードでグラフィックス出力を記録する。ファイルにはビューポートの原点や範囲を変更する関数は含められず、SelectClipRgn
のようなデバイス依存関数も含められない。作成された Windows
メタファイルは、再生前に図のビューポート原点と範囲を定義することで、任意の出力デバイス形式にスケールしてレンダリングできる。
> [!NOTE] > wingdi.h ヘッダは CreateMetaFile を、UNICODE
プリプロセッサ定数の定義に応じて自動的に ANSI 版か Unicode
版を選択するエイリアスとして定義する。エンコーディング中立のエイリアスとそうでないコードを混在させると、コンパイルや実行時のエラーにつながるミスマッチが生じることがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
CreatePalette
CreatePalette 関数は論理パレットを作成する。
%prm
plpal
plpal : [var] 論理パレット内の色に関する情報を含む LOGPALETTE 構造体へのポインタ。
%inst
CreatePalette 関数は論理パレットを作成する。

[戻り値]
関数が成功した場合、戻り値は論理パレットへのハンドルとなる。関数が失敗した場合、戻り値は NULL となる。

[備考]
アプリケーションは GetDeviceCaps を呼び RASTERCAPS
定数を指定することで、デバイスがパレット操作をサポートするかを判定できる。論理パレットを作成した後、SelectPalette
を呼んでデバイスコンテキストに選択できる。デバイスコンテキストに選択されたパレットは RealizePalette
を呼ぶことで実体化できる。パレットが不要になったら DeleteObject を呼んで削除する。


%index
CreatePatternBrush
指定したビットマップパターンを持つ論理ブラシを作成する。ビットマップは CreateDIBSection で作成した DIB セクションビットマップでもデバイス依存ビットマップでもよい。
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
CreatePenIndirect
CreatePenIndirect 関数は、構造体で指定したスタイル、幅、色を持つ論理コスメティックペンを作成する。
%prm
plpen
plpen : [var] ペンのスタイル、幅、色を指定する LOGPEN 構造体へのポインタ。
%inst
CreatePenIndirect 関数は、構造体で指定したスタイル、幅、色を持つ論理コスメティックペンを作成する。

[戻り値]
関数が成功した場合、戻り値は論理コスメティックペンを識別するハンドルとなる。関数が失敗した場合、戻り値は NULL となる。

[備考]
論理ペンを作成した後、SelectObject
を呼んでデバイスコンテキストに選択できる。ペンがデバイスコンテキストに選択されると、線や曲線の描画に使用できる。ペンが不要になったら
DeleteObject を呼んで削除する。


%index
CreatePolyPolygonRgn
CreatePolyPolygonRgn 関数は、複数のポリゴンからなるリージョンを作成する。ポリゴンは重なってもよい。
%prm
pptl, pc, cPoly, iMode
pptl : [var] ポリゴンの頂点を論理単位で定義する POINT 構造体配列へのポインタ。ポリゴンは連続して指定する。各ポリゴンは閉じていると見なされ、各頂点は 1 度のみ指定する。
pc : [var] 整数配列へのポインタ。各整数は、lppt が指す配列内のいずれかのポリゴンの頂点数を指定する。
cPoly : [int] lpPolyCounts が指す配列内の整数の総数。
iMode : [int] 
%inst
CreatePolyPolygonRgn 関数は、複数のポリゴンからなるリージョンを作成する。ポリゴンは重なってもよい。

[戻り値]
関数が成功した場合、戻り値はリージョンへのハンドルとなる。関数が失敗した場合、戻り値はゼロとなる。

[備考]
HRGN オブジェクトが不要になったら DeleteObject を呼んで削除する。リージョン座標は 27
ビット符号付き整数として表現される。


%index
CreatePolygonRgn
CreatePolygonRgn 関数はポリゴンリージョンを作成する。
%prm
pptl, cPoint, iMode
pptl : [var] ポリゴンの頂点を論理単位で定義する POINT 構造体配列へのポインタ。ポリゴンは閉じていると見なされる。各頂点は 1 度のみ指定できる。
cPoint : [int] 配列内の点の数。
iMode : [int] 
%inst
CreatePolygonRgn 関数はポリゴンリージョンを作成する。

[戻り値]
関数が成功した場合、戻り値はリージョンへのハンドルとなる。関数が失敗した場合、戻り値は NULL となる。

[備考]
HRGN オブジェクトが不要になったら DeleteObject を呼んで削除する。リージョン座標は 27
ビット符号付き整数として表現される。Create<shape>Rgn 系メソッド（CreateRectRgn や
CreatePolygonRgn など）で作成されるリージョンは形状の内側のみを含み、形状の輪郭はリージョンから除外される。これは、2
つの連続する頂点を結ぶ線上の任意の点はリージョンに含まれないことを意味する。そのような点に対して PtInRegion を呼ぶと結果として
0 が返る。


%index
CreateRectRgn
CreateRectRgn 関数は矩形リージョンを作成する。
%prm
x1, y1, x2, y2
x1 : [int] リージョンの左上隅の x 座標（論理単位）。
y1 : [int] リージョンの左上隅の y 座標（論理単位）。
x2 : [int] リージョンの右下隅の x 座標（論理単位）。
y2 : [int] リージョンの右下隅の y 座標（論理単位）。
%inst
CreateRectRgn 関数は矩形リージョンを作成する。

[戻り値]
関数が成功した場合、戻り値はリージョンへのハンドルとなる。関数が失敗した場合、戻り値は NULL となる。

[備考]
HRGN オブジェクトが不要になったら DeleteObject を呼んで削除する。リージョン座標は 27
ビット符号付き整数として表現される。Create<shape>Rgn 系メソッド（CreateRectRgn や
CreatePolygonRgn など）で作成されるリージョンは形状の内側のみを含み、形状の輪郭はリージョンから除外される。これは、2
つの連続する頂点を結ぶ線上の任意の点はリージョンに含まれないことを意味する。そのような点に対して PtInRegion を呼ぶと結果として
0 が返る。


%index
CreateRectRgnIndirect
CreateRectRgnIndirect 関数は矩形リージョンを作成する。
%prm
lprect
lprect : [var] リージョンを定義する矩形の左上隅と右下隅の座標（論理単位）を含む RECT 構造体へのポインタ。
%inst
CreateRectRgnIndirect 関数は矩形リージョンを作成する。

[戻り値]
関数が成功した場合、戻り値はリージョンへのハンドルとなる。関数が失敗した場合、戻り値は NULL となる。

[備考]
HRGN オブジェクトが不要になったら DeleteObject を呼んで削除する。リージョン座標は 27
ビット符号付き整数として表現される。リージョンは下辺と右辺を含まない。


%index
CreateRoundRectRgn
CreateRoundRectRgn 関数は、角が丸い矩形リージョンを作成する。
%prm
x1, y1, x2, y2, w, h
x1 : [int] リージョンの左上隅の x 座標（デバイス単位）。
y1 : [int] リージョンの左上隅の y 座標（デバイス単位）。
x2 : [int] リージョンの右下隅の x 座標（デバイス単位）。
y2 : [int] リージョンの右下隅の y 座標（デバイス単位）。
w : [int] 丸い角を作成するために使用する楕円の幅（デバイス単位）。
h : [int] 丸い角を作成するために使用する楕円の高さ（デバイス単位）。
%inst
CreateRoundRectRgn 関数は、角が丸い矩形リージョンを作成する。

[戻り値]
関数が成功した場合、戻り値はリージョンへのハンドルとなる。関数が失敗した場合、戻り値は NULL となる。

[備考]
HRGN オブジェクトが不要になったら DeleteObject を呼んで削除する。リージョン座標は 27
ビット符号付き整数として表現される。


%index
CreateScalableFontResourceW
CreateScalableFontResource 関数は、スケーラブルフォント用のフォントリソースファイルを作成する。(Unicode)
%prm
fdwHidden, lpszFont, lpszFile, lpszPath
fdwHidden : [int] 
lpszFont : [wstr] 作成するフォントリソースファイルの名前を指定する null 終端文字列へのポインタ。既存のフォントリソースファイルを指定すると関数は失敗する。
lpszFile : [wstr] この関数がフォントリソースファイルを作成するために使用するスケーラブルフォントファイルの名前を指定する null 終端文字列へのポインタ。
lpszPath : [wstr] スケーラブルフォントファイルへのパスを指定する null 終端文字列へのポインタ。
%inst
CreateScalableFontResource
関数は、スケーラブルフォント用のフォントリソースファイルを作成する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は非ゼロとなる。関数が失敗した場合、戻り値はゼロとなる。lpszFontRes
が既存のフォントファイルを指定する場合、GetLastError は ERROR_FILE_EXISTS を返す。

[備考]
CreateScalableFontResource 関数は TrueType
フォントをインストールするアプリケーションで使用される。アプリケーションは CreateScalableFontResource
を使ってフォントリソースファイル（通常は .fot 拡張子）を作成し、その後 AddFontResource
を使ってフォントをインストールする。TrueType フォントファイル（通常は .ttf 拡張子）は AddFontResource
で使用するために Windows ディレクトリの System
サブディレクトリに置かれている必要がある。CreateScalableFontResource は現在、TrueType
技術のスケーラブルフォントのみをサポートする。lpszFontFile
パラメータがファイル名と拡張子のみを指定する場合、lpszCurrentPath
パラメータでパスを指定しなければならない。lpszFontFile パラメータが完全パスを指定する場合、lpszCurrentPath
パラメータは NULL または NULL へのポインタでなければならない。lpszFontFile
にファイル名と拡張子のみを指定し、lpszCurrentPath にパスを指定すると、lpszFontFile
の文字列がこのリソースに属する .ttf ファイルとして .fot ファイルにコピーされる。AddFontResource
が呼ばれると、オペレーティングシステムは .ttf ファイルが System ディレクトリ（ネットワークインストールの場合はメイン
Windows ディレクトリ）にコピーされていると仮定する。CreateScalableFontResource を呼ぶときには .ttf
ファイルがそのディレクトリにある必要はない。lpszCurrentPath
パラメータがディレクトリ情報を含むためである。この方法で作成されたリソースには絶対パス情報が含まれず、任意のインストールで使用できる。lpszFontFile
にパスを指定し lpszCurrentPath に NULL を指定すると、lpszFontFile の文字列が .fot
ファイルにコピーされる。この場合、AddFontResource が呼ばれるときに .ttf ファイルは
CreateScalableFontResource を呼んだ時点で lpszFontFile
に指定された場所になければならず、lpszCurrentPath
パラメータは不要となる。この方法で作成されたリソースにはパスとドライブへの絶対参照が含まれ、.ttf
ファイルが別の場所に移動されると動作しない。
> [!NOTE] > wingdi.h ヘッダは CreateScalableFontResource を、UNICODE
プリプロセッサ定数の定義に応じて自動的に ANSI 版か Unicode
版を選択するエイリアスとして定義する。エンコーディング中立のエイリアスとそうでないコードを混在させると、コンパイルや実行時のエラーにつながるミスマッチが生じることがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
CreateSolidBrush
指定された単色を持つ論理ブラシを作成する。
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
DPtoLP
DPtoLP 関数はデバイス座標を論理座標に変換する。変換は、デバイスコンテキストのマッピングモード、ウィンドウとビューポートの原点と範囲の設定、ワールド変換に依存する。
%prm
hdc, lppt, c
hdc : [intptr] デバイスコンテキストへのハンドル。
lppt : [var] POINT 構造体配列へのポインタ。各 POINT 構造体に含まれる x, y 座標が変換される。
c : [int] 配列内の点の数。
%inst
DPtoLP
関数はデバイス座標を論理座標に変換する。変換は、デバイスコンテキストのマッピングモード、ウィンドウとビューポートの原点と範囲の設定、ワールド変換に依存する。

[戻り値]
関数が成功した場合、戻り値は非ゼロとなる。関数が失敗した場合、戻り値はゼロとなる。

[備考]
DPtoLP 関数は、デバイス座標が 27 ビットを超えるか、変換後の論理座標が 32
ビットを超えると失敗する。そのようなオーバーフローの場合、すべての点の結果は未定義となる。


%index
DeleteDC
指定されたデバイスコンテキスト(DC)を削除する。
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
DescribePixelFormat
DescribePixelFormat 関数は、hdc に関連付けられたデバイスの iPixelFormat で識別されるピクセルフォーマットに関する情報を取得する。関数は ppfd が指す PIXELFORMATDESCRIPTOR 構造体のメンバをそのピクセルフォーマットデータで設定する。
%prm
hdc, iPixelFormat, nBytes, ppfd
hdc : [intptr] デバイスコンテキストを指定する。
iPixelFormat : [int] ピクセルフォーマットを指定するインデックス。デバイスコンテキストがサポートするピクセルフォーマットは正の 1 始まり整数インデックスで識別される。
nBytes : [int] ppfd が指す構造体のサイズ（バイト単位）。DescribePixelFormat はその構造体に nBytes バイトを超えるデータを格納しない。この値には sizeof(PIXELFORMATDESCRIPTOR) を設定する。
ppfd : [var] 関数がピクセルフォーマットデータでメンバを設定する PIXELFORMATDESCRIPTOR 構造体へのポインタ。関数は構造体にコピーしたバイト数を構造体の nSize メンバに格納する。呼び出し時に ppfd が NULL の場合、関数は構造体にデータを書き込まない。これはデバイスコンテキストの最大ピクセルフォーマットインデックスのみを取得したい場合に便利である。
%inst
DescribePixelFormat 関数は、hdc に関連付けられたデバイスの iPixelFormat
で識別されるピクセルフォーマットに関する情報を取得する。関数は ppfd が指す PIXELFORMATDESCRIPTOR
構造体のメンバをそのピクセルフォーマットデータで設定する。

[戻り値]
関数が成功した場合、戻り値はデバイスコンテキストの最大ピクセルフォーマットインデックスとなる。さらに、関数は ppfd が指す
PIXELFORMATDESCRIPTOR
構造体のメンバを指定したピクセルフォーマットに従って設定する。関数が失敗した場合、戻り値はゼロとなる。拡張エラー情報を取得するには
GetLastError を呼ぶ。


%index
DrawEscape
DrawEscape 関数は、グラフィックスデバイスインターフェイス (GDI) では直接利用できない、指定したビデオディスプレイの描画機能を提供する。
%prm
hdc, iEscape, cjIn, lpIn
hdc : [intptr] 指定したビデオディスプレイの DC へのハンドル。
iEscape : [int] 実行するエスケープ関数。
cjIn : [int] lpszInData パラメータが指すデータのバイト数。
lpIn : [str] 指定したエスケープに必要な入力構造体へのポインタ。
%inst
DrawEscape 関数は、グラフィックスデバイスインターフェイス (GDI)
では直接利用できない、指定したビデオディスプレイの描画機能を提供する。

[戻り値]
関数が成功した場合、戻り値はゼロより大きい値となる。ただし QUERYESCSUPPORT
描画エスケープは実装の有無のみを確認する。エスケープが実装されていない場合、戻り値はゼロとなる。エラーが発生した場合、戻り値はゼロより小さい値となる。

[備考]
アプリケーションが DrawEscape を呼ぶと、cbInput と lpszInData
で識別されるデータが指定したディスプレイドライバへ直接渡される。


%index
Ellipse
D2D1_ELLIPSE 構造体を作成する。
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
EndDoc
EndDoc 関数は印刷ジョブを終了する。
%prm
hdc
hdc : [intptr] 印刷ジョブのデバイスコンテキストへのハンドル。
%inst
EndDoc 関数は印刷ジョブを終了する。

[戻り値]
関数が成功した場合、戻り値はゼロより大きい値となる。関数が失敗した場合、戻り値はゼロ以下となる。

[備考]
注意:
これはブロッキングまたは同期関数であり、即座に戻らないことがある。この関数がどれくらい速く戻るかは、ネットワーク状態、プリントサーバーの構成、プリンタードライバーの実装といった、アプリケーション作成時には予測しにくい実行時要因に依存する。ユーザーインターフェイスとのやり取りを管理するスレッドからこの関数を呼び出すと、アプリケーションが応答しなくなったように見えることがある。アプリケーションは印刷ジョブを終えた直後に
EndDoc を呼ぶべきである。


%index
EndPage
EndPage 関数は、アプリケーションがページへの書き込みを終えたことをデバイスに通知する。この関数は通常、デバイスドライバに新しいページへ進むよう指示するために使用する。
%prm
hdc
hdc : [intptr] 印刷ジョブのデバイスコンテキストへのハンドル。
%inst
EndPage
関数は、アプリケーションがページへの書き込みを終えたことをデバイスに通知する。この関数は通常、デバイスドライバに新しいページへ進むよう指示するために使用する。

[戻り値]
関数が成功した場合、戻り値はゼロより大きい値となる。関数が失敗した場合、戻り値はゼロ以下となる。

[備考]
注意:
これはブロッキングまたは同期関数であり、即座に戻らないことがある。この関数がどれくらい速く戻るかは、ネットワーク状態、プリントサーバーの構成、プリンタードライバーの実装といった、アプリケーション作成時には予測しにくい実行時要因に依存する。ユーザーインターフェイスとのやり取りを管理するスレッドからこの関数を呼び出すと、アプリケーションが応答しなくなったように見えることがある。EndPage
の呼び出し後に必要があれば、ResetDC を使ってデバイスモードを変更する。ResetDC
を呼ぶとすべてのデバイスコンテキスト属性がデフォルト値にリセットされることに注意。EndPage と StartPage
はデバイスコンテキスト属性をリセットしない。デバイスコンテキスト属性は次のページにわたって一定に保たれる。次のページを印刷する前にオブジェクトを再選択したりマッピングモードを再設定したりする必要はない。ただし、そうすることで結果は同じになり、Windows
のバージョン間のコード差異を減らせる。スプールファイル内のページが約 350 MB
を超えると、エラーメッセージなしに印刷が失敗することがある。例えば大きな EMF
ファイルを印刷する場合に発生し得る。ページサイズの上限は、利用可能な仮想メモリ量、呼び出し元プロセスが割り当てているメモリ量、プロセスヒープの断片化の度合いなど、多くの要因に依存する。


%index
EndPath
EndPath 関数は、パスブラケットを閉じ、そのブラケットで定義されたパスを指定したデバイスコンテキストに選択する。
%prm
hdc
hdc : [intptr] 新しいパスを選択するデバイスコンテキストへのハンドル。
%inst
EndPath 関数は、パスブラケットを閉じ、そのブラケットで定義されたパスを指定したデバイスコンテキストに選択する。

[戻り値]
関数が成功した場合、戻り値は非ゼロとなる。関数が失敗した場合、戻り値はゼロとなる。


%index
EngDeleteSemaphore
EngDeleteSemaphore 関数は、システムのリソースリストからセマフォオブジェクトを削除する。
%prm
hsem
hsem : [intptr] 削除するセマフォへのハンドル。セマフォは EngCreateSemaphore で作成されたものである。
%inst
EngDeleteSemaphore 関数は、システムのリソースリストからセマフォオブジェクトを削除する。

[戻り値]
なし


%index
EngAcquireSemaphore
EngAcquireSemaphore 関数は、呼び出しスレッドの排他アクセス用にセマフォに関連付けられたリソースを獲得する。
%prm
hsem
hsem : [intptr] 獲得するリソースに関連付けられたセマフォへのハンドル。
%inst
EngAcquireSemaphore 関数は、呼び出しスレッドの排他アクセス用にセマフォに関連付けられたリソースを獲得する。

[戻り値]
なし

[備考]
EngAcquireSemaphore
は、セマフォに関連付けられたドライバリソースへの排他的アクセスを許可し、他のスレッドがセマフォのリソースにアクセスするのをロックアウトする。このルーチンの呼び出しの後は、できるだけ速やかに
EngReleaseSemaphore を呼ぶべきである。


%index
EngAlphaBlend
EngAlphaBlend 関数は、アルファブレンディング付きビットブロック転送機能を提供する。
%prm
psoDest, psoSrc, pco, pxlo, prclDest, prclSrc, pBlendObj
psoDest : [var] 描画先のサーフェスを識別する SURFOBJ 構造体へのポインタ。
psoSrc : [var] ソースサーフェスを識別する SURFOBJ 構造体へのポインタ。
pco : [var] CLIPOBJ 構造体へのポインタ。CLIPOBJ_Xxx サービスルーチンが、クリップ領域を矩形の集合として列挙するために提供される。この列挙は変更される宛先の領域を制限する。可能な限り GDI はクリッピングを単純化する。ただし EngBitBlt と異なり、出力をクリッピングする際の丸め誤差を避けるため、EngAlphaBlend は単一矩形で呼ばれることがある。
pxlo : [var] ソースサーフェスと宛先サーフェスの間でカラーインデックスをどう変換するかを指定する XLATEOBJ 構造体へのポインタ。ソースサーフェスがパレット管理されている場合、その色は RGB カラー値のルックアップテーブルへのインデックスで表される。この場合、GDI は XLATEOBJ 構造体に変換ベクトルを問い合わせ、任意のソースインデックスを宛先のカラーインデックスに高速変換できる。例えばソースが RGB だが宛先がパレット管理の場合は状況がより複雑になる。この場合、各ソース RGB 値に最も近い一致を宛先パレットで見つけなければならない。GDI はこのマッチング操作のために XLATEOBJ_iXlate サービスルーチンを呼ぶ。
prclDest : [var] 変更する矩形領域を定義する RECTL 構造体へのポインタ。この矩形は宛先サーフェスの座標系で指定し、左上と右下の 2 点で定義される。矩形を定義する 2 点は常に整列している。矩形は右下を含まない。すなわち、その下辺と右辺はブレンドの一部ではない。指定した矩形は宛先サーフェスからはみ出してもよく、その場合 GDI が適切にクリッピングを行う。EngAlphaBlend は決して空の宛先矩形で呼んではならない。
prclSrc : [var] コピーする領域を定義する RECTL 構造体へのポインタ。この矩形はソースサーフェスの座標系で指定し、左上と右下の 2 点で定義される。矩形を定義する 2 点は常に整列している。矩形は右下を含まない。ソース矩形はソースサーフェスの境界を超えてはならず、ソースサーフェスからはみ出してはならない。EngAlphaBlend は決して空のソース矩形で呼んではならない。マッピングは prclSrc と prclDest によって定義される。prclDest と prclSrc に指定された点は整数座標上にあり、これはピクセル中心に対応する。そのような 2 点で定義される矩形は、与えられた点を頂点とする幾何学的矩形と見なされるが、各座標から 0.5 を引いたものになる。(POINTL 構造体はこれらの分数座標頂点を指定する省略表記である。)
pBlendObj : [var] ソースサーフェスと宛先サーフェスの間で実行するブレンディング操作を記述する BLENDOBJ 構造体へのポインタ。この構造体は BLENDFUNCTION 構造体のラッパーであり、XLATEOBJ 構造体には含まれない、必要なソースおよび宛先のフォーマット情報を含む。BLENDFUNCTION は Microsoft Windows SDK ドキュメントで宣言されている。そのメンバは次のように定義される。BlendOp は実行するブレンド操作を定義する。現在この値は AC_SRC_OVER でなければならず、ソースビットマップがソースピクセルのアルファ値に基づいて宛先ビットマップの上に配置されることを意味する。このブレンド操作が扱うべき 3 つのケースがあり、本リファレンスページの備考で説明する。BlendFlags は予約され、現在 0 に設定される。SourceConstantAlpha はソースサーフェス全体に適用する一定のブレンド係数を定義する。値は [0,255] の範囲で、0 が完全に透明、255 が完全に不透明である。AlphaFormat はサーフェスがアルファチャンネルを持つかどうかを定義する。このメンバには次の値を任意に設定できる。
%inst
EngAlphaBlend 関数は、アルファブレンディング付きビットブロック転送機能を提供する。

[戻り値]
EngAlphaBlend は成功時に TRUE を返す。エラーが発生した場合、FALSE を返しエラーコードを報告する。

[備考]
アルファブレンディング付きビットブロック転送は次のサーフェス間でサポートされる。
（以下省略）


%index
EngAssociateSurface
EngAssociateSurface 関数は、指定したサーフェスを指定デバイスに属するものとしてマークする。
%prm
hsurf, hdev, flHooks
hsurf : [intptr] hdev に関連付けるサーフェスまたはビットマップへのハンドル。このハンドルは EngCreateBitmap または EngCreateDeviceBitmap によって返されたものである。
hdev : [intptr] サーフェスを関連付けるデバイスへのハンドル。これはドライバの DrvCompletePDEV 関数に渡された GDI 作成のハンドルである。
flHooks : [int] 
%inst
EngAssociateSurface 関数は、指定したサーフェスを指定デバイスに属するものとしてマークする。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。失敗した場合、ドライバは情報を実装中の GDI 関数へ送り、GDI
の戻り値を返すべきである。

[備考]
EngAssociateSurface は、プリンタドライバが「ルール」やデバイスフォントを実装したり、ディスプレイドライバが特殊な
blt ハードウェアを利用するのに使用できる。hsurf が識別するサーフェスが標準フォーマットビットマップの場合、ドライバは
flHooks のビットを設定して、自身が処理するサーフェスへの出力関数を指定できる。flHooks
にビットを設定すると、特定の出力関数は代わりにドライバへ送られる。これはフッキングと呼ばれる。ドライバが呼び出しをフックしない場合、標準フォーマットビットマップに対する描画は
GDI が自動的に管理する。サーフェスが関連付けられると、PDEV のデフォルトのパレットとスタイルステップを引き継ぐ。サーフェスは
DrvEnableSurface から返される前に関連付けられていなければならない。デフォルトでは、ドライバが
DrvCreateDeviceBitmap/DrvDeleteDeviceBitmap
を実装してデバイスビットマップをサポートする場合、GDI
はデバイスビットマップへの描画呼び出しとプライマリサーフェスへの描画呼び出しを自動的に同期しない。例えば GDI
は、別のスレッドがドライバの DrvTextOut の実装を実行してプライマリサーフェスに描画している間に、ドライバの DrvBitBlt
関数を呼んでデバイスビットマップに描画することがある。ドライバは複数のデバイスビットマップに同時に描画するために呼ばれることもある。DrvEnableSurface
がプライマリサーフェスへのハンドルを返した後、そのハンドルに対して EngAssociateSurface
を呼んではならない。状況によってはバグチェックを引き起こす可能性がある。詳細は Microsoft Knowledge Base 記事
330248 を参照。


%index
EngBitBlt
EngBitBlt 関数は、デバイス管理サーフェス間、またはデバイス管理サーフェスと GDI 管理の標準フォーマットビットマップ間で、汎用ビットブロック転送機能を提供する。
%prm
psoTrg, psoSrc, psoMask, pco, pxlo, prclTrg, pptlSrc, pptlMask, pbo, pptlBrush, rop4
psoTrg : [var] 描画先のサーフェスを識別する SURFOBJ 構造体へのポインタ。
psoSrc : [var] rop4 が必要とする場合の、ビットブロック転送操作のソースを定義する SURFOBJ 構造体へのポインタ。
psoMask : [var] マスクとして使用するサーフェスを定義する SURFOBJ 構造体へのポインタ。マスクは 1 ピクセルあたり 1 ビットのビットマップとして定義される。通常、マスクは宛先サーフェスで変更される領域を制限する。マスキングは値 0xAACC の rop4 で選択される。マスクが 0 のとき宛先サーフェスは影響を受けない。マスクは宛先矩形を覆うのに十分な大きさである。このパラメータの値が NULL かつ rop4 がマスクを必要とする場合、ブラシ内の暗黙のマスクが使用される。マスクが必要な場合、psoMask はブラシ内の暗黙のマスクを上書きする。
pco : [var] CLIPOBJ 構造体へのポインタ。CLIPOBJ_Xxx サービスルーチンが、クリップ領域を矩形の集合として列挙するために提供される。この列挙は変更される宛先の領域を制限する。可能な限り GDI はクリッピングを単純化する。例えばこの関数は決して単一クリッピング矩形では呼ばれない。GDI はこの関数を呼ぶ前に宛先矩形をクリップするので、追加のクリッピングは不要である。
pxlo : [var] ソースとターゲットのサーフェス間でカラーインデックスをどう変換するかを示す XLATEOBJ 構造体へのポインタ。
prclTrg : [var] 宛先サーフェスの座標系で変更する領域を定義する RECTL 構造体へのポインタ。矩形は左上と右下の 2 点で定義される。この矩形の下辺と右辺はビットブロック転送の一部ではない（右下を含まない）。EngBitBlt は決して空の宛先矩形で呼ばれない。矩形を定義する 2 点は常に整列している。
pptlSrc : [var] ソースが存在する場合の、ソース矩形の左上隅を定義する POINTL 構造体へのポインタ。ソースがない場合、ドライバはこのパラメータを無視すべきである。
pptlMask : [var] マスク内のどのピクセルが宛先矩形の左上隅に対応するかを定義する POINTL 構造体へのポインタ。psoMask にマスクが指定されない場合、ドライバはこのパラメータを無視すべきである。
pbo : [var] ビットブロック転送のパターンを定義するために使用する BRUSHOBJ 構造体へのポインタ。GDI の BRUSHOBJ_pvGetRbrush サービスルーチンがデバイスのブラシ実体化を取得する。rop4 パラメータがパターンを必要としない場合、ドライバはこのパラメータを無視できる。
pptlBrush : [var] 宛先サーフェス上のブラシ原点を定義する POINTL 構造体へのポインタ。ブラシの左上ピクセルがこの点に整列され、ブラシはその寸法に従って繰り返される。rop4 パラメータがパターンを必要としない場合、このパラメータは無視する。
rop4 : [int] マスク、パターン、ソース、宛先ピクセルがどのように組み合わされて宛先サーフェスへ出力ピクセルを書き込むかを定義するラスタ操作を表す。これは通常の三項 Rop3 操作の自然な拡張である四項ラスタ操作である。Rop4 には Rop3 の 8 個の定義ビットと類似する 16 個の関連ビットがある（Rop3 の他の冗長ビットは無視される）。Rop4 を実装する最も単純な方法は、その 2 バイトを別々に考えることである。下位バイトはマスクが 1 のときに計算すべき Rop3 を指定する。上位バイトはマスクが 0 のときに計算・適用できる Rop3 を指定する。
%inst
EngBitBlt 関数は、デバイス管理サーフェス間、またはデバイス管理サーフェスと GDI
管理の標準フォーマットビットマップ間で、汎用ビットブロック転送機能を提供する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。失敗した場合は FALSE となり、エラーコードがログに記録される。

[備考]
デバイスのサーフェスが標準フォーマットビットマップとして組織されている場合、ドライバは EngBitBlt を呼んで GDI
にビットブロック転送を実行させることができる。ドライバは、単純な転送を高速処理する特殊ハードウェアを持っているが複雑な転送付きの呼び出しは処理したくない場合などにこれを行う。ラスタ操作の詳細は
Microsoft Windows SDK ドキュメントを参照。


%index
EngCheckAbort
EngCheckAbort 関数は、印刷ジョブを終了すべきかどうかをプリンタグラフィックス DLL が判定できるようにする。
%prm
pso
pso : [var] 以前に GDI から受け取った SURFOBJ 構造体への、呼び出し元提供のポインタ。
%inst
EngCheckAbort 関数は、印刷ジョブを終了すべきかどうかをプリンタグラフィックス DLL が判定できるようにする。

[戻り値]
印刷ジョブを終了すべき場合、関数は TRUE を返す。印刷ジョブを終了すべきでない場合、または pso が有効な SURFOBJ
構造体を指していない場合、関数は FALSE を返す。

[備考]
プリンタグラフィックス DLL は、実行に 5 秒以上かかるグラフィックス DDI 関数内から EngCheckAbort
を呼ぶべきである。印刷ジョブを終了すべき場合、プリンタグラフィックス DLL は現在の操作を中止し、EngCheckAbort
を呼んだグラフィックス DDI 関数の戻り値として FALSE を指定して GDI に戻るべきである。


%index
EngComputeGlyphSet
EngComputeGlyphSet 関数は、デバイス上でサポートされるグリフセットを計算する。
%prm
nCodePage, nFirstChar, cChars
nCodePage : [int] サポートされるコードページ。
nFirstChar : [int] サポートされる最初の ANSI 文字の文字コード。
cChars : [int] サポートされる ANSI 文字数。
%inst
EngComputeGlyphSet 関数は、デバイス上でサポートされるグリフセットを計算する。

[戻り値]
グリフセットの計算に成功した場合、関数は FD_GLYPHSET 構造体へのポインタを返す。エラーが発生した場合、NULL を返す。

[備考]
ドライバは EngComputeGlyphSet を使って、nCodePage
で記述されるコードページ内のグリフのみを含むフォントのグリフセットを計算できる。EngComputeGlyphSet が返す
FD_GLYPHSET 構造体の使用が終わったら、ドライバは EngFreeMem を呼んでメモリを解放しなければならない。


%index
EngCopyBits
EngCopyBits 関数は、デバイス管理ラスタサーフェスと GDI 標準フォーマットビットマップとの間の変換を行う。
%prm
psoDest, psoSrc, pco, pxlo, prclDest, pptlSrc
psoDest : [var] コピー操作の宛先サーフェスを記述する SURFOBJ 構造体へのポインタ。
psoSrc : [var] コピー操作のソースサーフェスを記述する SURFOBJ 構造体へのポインタ。
pco : [var] 影響を受ける宛先サーフェスの領域を制限する CLIPOBJ 構造体へのポインタ。NULL 可。
pxlo : [var] ソースとターゲットのサーフェス間のカラーインデックスの変換を定義する XLATEOBJ 構造体へのポインタ。
prclDest : [var] 宛先サーフェスの座標系で変更する領域を定義する RECTL 構造体へのポインタ。矩形は右下を含まない。下辺と右辺はコピーの一部ではない。
pptlSrc : [var] ソース矩形の左上隅を定義する POINTL 構造体へのポインタ。
%inst
EngCopyBits 関数は、デバイス管理ラスタサーフェスと GDI 標準フォーマットビットマップとの間の変換を行う。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。失敗した場合はエラーをログに記録し FALSE を返す。

[備考]
標準フォーマットビットマップは単一プレーン、パックドピクセル形式である。各走査線は 4 バイト境界に整列される。これらのビットマップは
1, 4, 8, 16, 24, または 32 bpp である。標準フォーマット型のリストは EngCreateBitmap
関数を参照。GDI はシミュレーションからこの関数を呼ぶ。EngCopyBits は空の宛先矩形では呼ぶべきでなく、宛先矩形の 2
点は整列していなければならない。すなわち、最初の点は矩形の左上頂点、2 番目の点は右下頂点を表すべきである。


%index
EngCreateBitmap
EngCreateBitmap 関数は、GDI にビットマップを作成・管理するよう要求する。
%prm
sizl, lWidth, iFormat, fl, pvBits
sizl : [var] 作成するビットマップの幅と高さ（ピクセル単位）をメンバに含む SIZEL 構造体を指定する。SIZEL 構造体は SIZE 構造体と同一である。pvBits が NULL でない場合、この値はデバイス上で見えるすべてのピクセルを表すべきで、デバイスがオフスクリーンメモリを保持できるようにする。
lWidth : [int] ビットマップの割り当て幅を指定する。これは、ポインタを 1 走査線下に移動するために加える必要があるバイト数である。
iFormat : [int] 
fl : [int] 
pvBits : [intptr] 作成するビットマップの最初の走査線へのポインタ。NULL の場合、GDI はビットマップのピクセルのストレージ領域を割り当てる。NULL でなければ、ビットマップ用バッファへのポインタとなる。
%inst
EngCreateBitmap 関数は、GDI にビットマップを作成・管理するよう要求する。

[戻り値]
関数が正常に完了した場合、戻り値は作成されたビットマップを識別するハンドルとなる。それ以外の場合、戻り値は 0
となる。EngCreateBitmap はエラーコードをログに記録しない。

[備考]
ビットマップ用ストレージはドライバが任意に提供できる。ドライバは DrvEnableSurface
から戻る前に、EngAssociateSurface
を呼んで作成したビットマップをサーフェスとして関連付けるべきである。ビットマップが不要になったら EngDeleteSurface
で削除する。フレームバッファディスプレイドライバは、GDI がディスプレイへ直接描画できるように pvBits
パラメータを使うべきである。


%index
EngCreateClip
EngCreateClip 関数は、ドライバがコールバックで使用する CLIPOBJ 構造体を作成する。
%prm

%inst
EngCreateClip 関数は、ドライバがコールバックで使用する CLIPOBJ 構造体を作成する。

[戻り値]
関数が成功した場合、戻り値は新しく作成された CLIPOBJ 構造体へのポインタとなる。それ以外の場合は NULL となる。

[備考]
EngCreateClip が作成する CLIPOBJ 構造体により、GDI
はバンクされたフレームバッファに直接アクセスできる。構造体は、CLIPOBJ 構造体の iDComplexity メンバが
DC_TRIVIAL または DC_RECT に設定されるよう、ドライバが初期化しなければならない。iDComplexity が
DC_RECT に設定された場合、ドライバは CLIPOBJ の rclBounds
メンバをフレームバッファバンクの範囲に設定できる。ドライバは EngDeleteClip を使ってこの CLIPOBJ
構造体を削除しなければならない。


%index
EngCreateDeviceBitmap
EngCreateDeviceBitmap 関数は、デバイスビットマップ用のハンドルを作成するよう GDI に要求する。
%prm
dhsurf, sizl, iFormatCompat
dhsurf : [intptr] 作成するデバイスビットマップへのデバイスハンドル。
sizl : [var] 作成するビットマップの幅と高さを含む SIZEL 構造体を指定する。この構造体の cx, cy メンバはそれぞれビットマップの幅と高さ（ピクセル単位）を含む。SIZEL 構造体は SIZE 構造体と同一である。
iFormatCompat : [int] 作成するデバイスサーフェスの互換エンジンフォーマットを指定する。これは GDI が複雑な描画呼び出しをシミュレートするのに一時バッファが必要な場合に使われる。iFormatCompat に許される値は BMF_1BPP, BMF_4BPP, BMF_8BPP, BMF_16BPP, BMF_24BPP, BMF_32BPP である。
%inst
EngCreateDeviceBitmap 関数は、デバイスビットマップ用のハンドルを作成するよう GDI に要求する。

[戻り値]
関数が成功した場合、戻り値はビットマップを識別するハンドルとなる。それ以外の場合はゼロとなり、エラーコードがログに記録される。

[備考]
サーフェスは EngAssociateSurface を使って関連付けるべきである。ビットマップが不要になったら
EngDeleteSurface で削除する。


%index
EngCreateDeviceSurface
EngCreateDeviceSurface 関数は、ドライバが管理するデバイスサーフェスを作成し、そのハンドルを返す。
%prm
dhsurf, sizl, iFormatCompat
dhsurf : [intptr] デバイスが管理するサーフェスへのデバイスハンドル。このハンドルは、入出力のために SURFOBJ 構造体が渡されるときにドライバへ渡される。
sizl : [var] 作成するサーフェスの幅と高さを含む SIZEL 構造体を指定する。この構造体の cx, cy メンバはそれぞれサーフェスの幅と高さ（ピクセル単位）を含む。SIZEL 構造体は SIZE 構造体と同一である。
iFormatCompat : [int] 作成するデバイスサーフェスの互換エンジンフォーマットを指定する。これは GDI が複雑な描画呼び出しをシミュレートするのに一時バッファが必要な場合に使われる。
%inst
EngCreateDeviceSurface 関数は、ドライバが管理するデバイスサーフェスを作成し、そのハンドルを返す。

[戻り値]
関数が成功した場合、戻り値はサーフェスを識別するハンドルとなる。それ以外の場合はゼロとなり、エラーコードがログに記録される。

[備考]
サーフェスのストレージ領域はドライバが任意に提供できる。サーフェスは EngAssociateSurface
を使って関連付けるべきである。サーフェスが不要になったら EngDeleteSurface を使って削除する。


%index
EngCreatePalette
EngCreatePalette 関数は、RGB パレットを作成するよう GDI に要求を送る。
%prm
iMode, cColors, pulColors, flRed, flGreen, flBlue
iMode : [int] 
cColors : [int] iMode パラメータが PAL_INDEXED の場合、cColors は pulColors が指す配列に提供される色数を指定する。それ以外の場合、このパラメータはゼロにすべきである。
pulColors : [var] iMode が PAL_INDEXED の場合の ULONG 値配列の先頭へのポインタ。各 ULONG の下位 3 バイトがパレット内の RGB 色を定義する。
flRed : [int] iMode パラメータが PAL_BITFIELDS の場合、flRed, flGreen, flBlue パラメータは赤・緑・青に対応するビットを示すマスクである。各マスクは連続するビットで構成され、他のマスクと重なってはならない。GDI はビットフィールドのすべての組み合わせをサポートする。
flGreen : [int] iMode パラメータが PAL_BITFIELDS の場合、flRed, flGreen, flBlue パラメータは赤・緑・青に対応するビットを示すマスクである。各マスクは連続するビットで構成され、他のマスクと重なってはならない。GDI はビットフィールドのすべての組み合わせをサポートする。
flBlue : [int] iMode パラメータが PAL_BITFIELDS の場合、flRed, flGreen, flBlue パラメータは赤・緑・青に対応するビットを示すマスクである。各マスクは連続するビットで構成され、他のマスクと重なってはならない。GDI はビットフィールドのすべての組み合わせをサポートする。
%inst
EngCreatePalette 関数は、RGB パレットを作成するよう GDI に要求を送る。

[戻り値]
関数が成功した場合、戻り値は新しいパレットへのハンドルとなる。それ以外の場合はゼロとなり、エラーコードがログに記録される。

[備考]
ドライバは DEVINFO 構造体内にパレットへのポインタを返すことで、新しいパレットをデバイスに関連付けられる。デバイスに関連付けられた
PAL_INDEXED パレットは、最初のインデックスエントリを黒 (red = 0, green = 0, blue =
0)、最後のエントリを白 (255, 255, 255) に設定しなければならない。他のすべてのエントリは、インデックスが互いに 1
の補数であるエントリが大きく対比する色となるように設定する。例えば 16 エントリパレットのエントリ 0x9 が純緑 (0,255,0)
なら、エントリ 0x6 (=~0x9) は緑とよく対比する暗紫 (128,0,128)
のような色にする。このようにエントリを設定することで、XOR ラスタ操作が妥当に動作する。パレットが不要になったら
EngDeletePalette で削除すべきである。


%index
EngCreateSemaphore
EngCreateSemaphore 関数はセマフォオブジェクトを作成する。
%prm

%inst
EngCreateSemaphore 関数はセマフォオブジェクトを作成する。

[戻り値]
関数が成功した場合、戻り値はセマフォオブジェクトへのハンドルとなる。失敗した場合は null ポインタが返る。

[備考]
グラフィックスドライバは、リソース同期のためにセマフォオブジェクトを作成・使用できる。例えば次のようになる。
（以下省略）


%index
EngDeleteClip
EngDeleteClip 関数は、EngCreateClip で割り当てられた CLIPOBJ 構造体を削除する。
%prm
pco
pco : [var] 削除する CLIPOBJ 構造体へのポインタ。
%inst
EngDeleteClip 関数は、EngCreateClip で割り当てられた CLIPOBJ 構造体を削除する。

[戻り値]
なし


%index
EngDeletePalette
EngDeletePalette 関数は、指定したパレットを削除するよう GDI に要求を送る。
%prm
hpal
hpal : [intptr] 削除するパレットへのハンドル。このハンドルは EngCreatePalette によって提供される。
%inst
EngDeletePalette 関数は、指定したパレットを削除するよう GDI に要求を送る。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。それ以外の場合は FALSE を返す。


%index
EngDeletePath
EngDeletePath 関数は、以前 EngCreatePath で割り当てられたパスを削除する。
%prm
ppo
ppo : [var] 削除する PATHOBJ 構造体へのポインタ。
%inst
EngDeletePath 関数は、以前 EngCreatePath で割り当てられたパスを削除する。

[戻り値]
なし


%index
EngDeleteSurface
EngDeleteSurface 関数は、指定したサーフェスを削除する。
%prm
hsurf
hsurf : [intptr] 削除するサーフェスへのハンドル。このハンドルは HSURF または HBM である。
%inst
EngDeleteSurface 関数は、指定したサーフェスを削除する。

[戻り値]
EngDeleteSurface はサーフェスの削除に成功した場合 TRUE を返す。それ以外の場合は FALSE
を返し、エラーコードがログに記録される。


%index
EngEraseSurface
EngEraseSurface 関数は GDI を呼んでサーフェスを消去する。サーフェス上の指定矩形が指定色で塗りつぶされる。
%prm
pso, prcl, iColor
pso : [var] 消去するサーフェスへのポインタ。
prcl : [var] サーフェス上で消去するピクセルを定義する RECTL 構造体へのポインタ。この矩形は下辺と右辺を含まない。
iColor : [int] カラーインデックスを指定する。これは各ピクセルに書き込まれる値へのインデックスである。
%inst
EngEraseSurface 関数は GDI を呼んでサーフェスを消去する。サーフェス上の指定矩形が指定色で塗りつぶされる。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。それ以外の場合は FALSE となり、エラーコードが報告される。


%index
EngFillPath
EngFillPath 関数はパスを塗りつぶす。
%prm
pso, ppo, pco, pbo, pptlBrushOrg, mix, flOptions
pso : [var] 描画先のサーフェスを記述する SURFOBJ 構造体へのポインタ。
ppo : [var] 塗りつぶすパスを定義する PATHOBJ 構造体へのポインタ。パスを構成する線、ベジエ曲線などのデータを列挙するには PATHOBJ_Xxx サービスルーチンを使う。
pco : [var] CLIPOBJ 構造体へのポインタ。クリップ領域を矩形の集合として列挙するには CLIPOBJ_Xxx サービスルーチンを使う。
pbo : [var] 塗りつぶしに使用するパターンと色を定義する BRUSHOBJ 構造体へのポインタ。
pptlBrushOrg : [var] デバイス上でブラシパターンを整列させるためのブラシ原点を定義する POINTL 構造体へのポインタ。
mix : [int] ブラシに使用する前景および背景ラスタ操作を定義する。
flOptions : [int] パスを塗りつぶすときに使用するモードを指定する。この値は FP_WINDINGMODE または FP_ALTERNATEMODE のいずれかであるべきである。それ以外のフラグは無視すべきである。これらのモードの詳細は Path Fill Modes を参照。
%inst
EngFillPath 関数はパスを塗りつぶす。

[戻り値]
関数が GDI がパスを塗りつぶすことができた場合、戻り値は TRUE となる。それ以外の場合は FALSE
となり、エラーコードはログに記録されない。エラーが発生した場合、戻り値は FALSE となり、エラーコードがログに記録される。

[備考]
GDI はデバイス管理サーフェス上でパスを塗りつぶすたびに、塗りつぶし要件と次の GCAPS ビット (GCAPS_BEZIERS,
GCAPS_ALTERNATEFILL, GCAPS_WINDINGFILL) との比較に応じてこのエントリポイントを呼ぶことがある。


%index
EngFindResource
EngFindResource 関数は、モジュール内のリソースの位置を特定する。
%prm
h, iName, iType, pulSize
h : [intptr] リソースを含むモジュールへのハンドル。このハンドルは EngLoadModule から取得する。
iName : [int] 検索するリソースの名前を表す整数識別子。
iType : [int] 検索するリソースの種類を表す整数識別子。
pulSize : [var] リソースのサイズ（バイト単位）を返す ULONG へのポインタ。
%inst
EngFindResource 関数は、モジュール内のリソースの位置を特定する。

[戻り値]
関数の戻り値は、指定したリソースのアドレスへのポインタとなる。エラーが発生した場合、関数は NULL を返す。

[備考]
正常に見つかったリソースのサイズが pulSize に返される。


%index
EngFreeModule
EngFreeModule 関数はファイルをシステムメモリからアンマップする。
%prm
h
h : [intptr] 解放するメモリマップトファイルへのハンドル。このハンドルは EngLoadModule または EngLoadModuleForWrite から取得したものである。
%inst
EngFreeModule 関数はファイルをシステムメモリからアンマップする。

[戻り値]
なし


%index
EngGetCurrentCodePage
EngGetCurrentCodePage 関数は、システムのデフォルト OEM および ANSI コードページを返す。
%prm
OemCodePage, AnsiCodePage
OemCodePage : [var] システムのデフォルト OEM コードページを受け取る USHORT へのポインタ。
AnsiCodePage : [var] システムのデフォルト ANSI コードページを受け取る USHORT へのポインタ。
%inst
EngGetCurrentCodePage 関数は、システムのデフォルト OEM および ANSI コードページを返す。

[戻り値]
なし

[備考]
EngGetCurrentCodePage は、ANSI から Unicode
への変換にシステムが使用するデフォルトコードページを返す。これらの値はロケール設定に応じてブート時に設定される。


%index
EngGetDriverName
EngGetDriverName 関数は、ドライバ DLL の名前を返す。
%prm
hdev
hdev : [intptr] デバイスへのハンドル。これはドライバが DrvCompletePDEV の hdev パラメータとして受け取る GDI ハンドルである。
%inst
EngGetDriverName 関数は、ドライバ DLL の名前を返す。

[戻り値]
EngGetDriverName は、ドライバ DLL の名前が指定された null
終端文字列バッファへのポインタを返す。システムは、ドライバが Win32 AddPrinterDriver
ルーチンで最初にインストールされるとき、DRIVER_INFO_2 構造体からドライバ名を取得・保存する。


%index
EngGetPrinterDataFileName
EngGetPrinterDataFileName 関数は、プリンタのデータファイルの文字列名を取得する。
%prm
hdev
hdev : [intptr] デバイスへのハンドル。これはドライバが DrvCompletePDEV の hdev パラメータとして受け取る GDI ハンドルである。
%inst
EngGetPrinterDataFileName 関数は、プリンタのデータファイルの文字列名を取得する。

[戻り値]
EngGetPrinterDataFileName は、プリンタのデータファイル名が指定された null
終端文字列バッファへのポインタを返す。システムは、ドライバが Microsoft Win32 AddPrinterDriver
ルーチンで最初にインストールされるとき、DRIVER_INFO_2 構造体（Microsoft Windows SDK
ドキュメント参照）からプリンタのデータファイル名を取得・保存する。


%index
EngGradientFill
EngGradientFill 関数は、指定したプリミティブをシェーディングする。
%prm
psoDest, pco, pxlo, pVertex, nVertex, pMesh, nMesh, prclExtents, pptlDitherOrg, ulMode
psoDest : [var] 描画先のサーフェスを識別する SURFOBJ 構造体へのポインタ。
pco : [var] CLIPOBJ 構造体へのポインタ。CLIPOBJ_Xxx サービスルーチンが、クリップ領域を矩形の集合として列挙するために提供される。この列挙は変更される宛先の領域を制限する。可能な限り GDI はクリッピングを単純化する。
pxlo : [var] XLATEOBJ 構造体へのポインタ。この構造体は、32 bpp RGB フォーマットと宛先の間でカラーインデックスをどう変換すべきかを示す。ドライバは入力 COLOR16 カラー値を RGB に変換する責任がある。
pVertex : [var] TRIVERTEX 構造体配列へのポインタ。各エントリは位置情報と色情報を含む。TRIVERTEX 構造体は Microsoft Windows SDK ドキュメントで説明されている。
nVertex : [int] pVertex が指す配列内の TRIVERTEX 構造体の数を指定する。
pMesh : [intptr] pVertex が指す TRIVERTEX 要素の接続性を定義する構造体の配列へのポインタ。矩形を描画する場合、pMesh は GRADIENT_RECT 構造体配列を指し、各要素は矩形を定義する 2 つの TRIVERTEX 要素を指定する。TRIVERTEX 要素は矩形の対角頂点の任意の組み合わせを表せる。矩形描画は右下を含まない。TRIVERTEX と GRADIENT_RECT は Windows SDK ドキュメントで定義されている。三角形を描画する場合、pMesh は GRADIENT_TRIANGLE 構造体配列を指し、各要素は三角形を定義する 3 つの TRIVERTEX 要素を指定する。三角形描画は右下を含まない。GRADIENT_TRIANGLE 構造体は Windows SDK ドキュメントで定義されている。
nMesh : [int] pMesh が指す配列の要素数を指定する。
prclExtents : [var] グラデーション描画が行われる領域を定義する RECTL 構造体へのポインタ。点は宛先サーフェスの座標系で指定する。このパラメータは描画操作のサイズを推定するのに便利である。
pptlDitherOrg : [var] ディザリング用のサーフェス上の原点を定義する POINTL 構造体へのポインタ。ディザパターンの左上ピクセルがこの点に整列される。
ulMode : [int] 
%inst
EngGradientFill 関数は、指定したプリミティブをシェーディングする。

[戻り値]
EngGradientFill は成功時に TRUE を返す。それ以外の場合はエラーを報告し FALSE を返す。

[備考]
ドライバが DrvGradientFill をフックしているがサポートしない処理を要求された場合、EngGradientFill
を呼ぶべきである。各ピクセルでカラー値を計算するために使用する数式は、ulMode の値に依存する。
GDI は頂点のアルファ値を無視し、アルファをサポートするサーフェスではアルファチャンネルを変更しない。


%index
EngLineTo
EngLineTo 関数は、単一でソリッドな整数のみのコスメティックラインを描く。
%prm
pso, pco, pbo, x1, y1, x2, y2, prclBounds, mix
pso : [var] 描画先のサーフェスを記述する SURFOBJ 構造体へのポインタ。
pco : [var] レンダリングを行うクリップ領域を定義する CLIPOBJ 構造体へのポインタ。このクリップ領域の外のピクセルは影響を受けない。
pbo : [var] 線を描くときに使用するブラシを指定する BRUSHOBJ 構造体へのポインタ。
x1 : [int] 線の始点の整数 x 座標を指定する。
y1 : [int] 線の始点の整数 y 座標を指定する。
x2 : [int] 線の終点の整数 x 座標を指定する。
y2 : [int] 線の終点の整数 x 座標と y 座標を指定する。
prclBounds : [var] クリップされていない線を囲む矩形を記述する RECTL 構造体へのポインタ。ハードウェア線描画をサポートするドライバは、この矩形を使って、線がハードウェアでレンダリングできるほど小さな座標空間に収まるかを素早く判定できる。
mix : [int] 入ってくるパターンを既にデバイスサーフェス上にあるデータとどのように混合するかを定義する。下位バイトはラスタ操作を定義する。ラスタ操作コードの詳細は Microsoft Windows SDK ドキュメントを参照。
%inst
EngLineTo 関数は、単一でソリッドな整数のみのコスメティックラインを描く。

[戻り値]
EngLineTo は成功時に TRUE を返し、それ以外は FALSE を返す。

[備考]
DrvLineTo をフックしているドライバは、レンダリングサーフェスがデバイス独立ビットマップ (DIB) であるときに
EngLineTo を呼ぶことができる。


%index
EngLoadModule
EngLoadModule 関数は、指定したデータモジュールを読み取り用にシステムメモリへ読み込む。
%prm
pwsz
pwsz : [wstr] 読み込むデータファイルの名前を含む null 終端文字列へのポインタ。
%inst
EngLoadModule 関数は、指定したデータモジュールを読み取り用にシステムメモリへ読み込む。

[戻り値]
EngLoadModule が成功した場合、戻り値は読み込まれたモジュールへのハンドルとなる。それ以外の場合、戻り値は NULL となる。

[備考]
EngLoadModule
は読み取り専用で、データファイルをシステムメモリに読み込む。読み込まれたモジュールにアクセスするには、ドライバはこの関数が返したハンドルを引数に
EngMapModule を呼ぶべきである。pwsz が識別するファイルは %SystemRoot%\System32
ディレクトリ内、または %SystemRoot%\System32
配下のディレクトリ階層内に置かれている必要がある。書き込み可能なモジュールを読み込むには EngLoadModuleForWrite
を呼ぶ。実行可能コードとしてイメージを読み込む必要があるドライバは、この関数の代わりに EngLoadImage を呼ぶべきである。


%index
EngLockSurface
EngLockSurface 関数は、指定したサーフェス用のユーザーオブジェクトを作成する。この関数によりドライバは作成したサーフェスにアクセスできる。
%prm
hsurf
hsurf : [intptr] ロックするサーフェスへのハンドル。
%inst
EngLockSurface
関数は、指定したサーフェス用のユーザーオブジェクトを作成する。この関数によりドライバは作成したサーフェスにアクセスできる。

[戻り値]
EngLockSurface は成功時に SURFOBJ 構造体へのポインタを返す。それ以外の場合は NULL を返す。

[備考]

この関数により、ドライバは作成したサーフェスにアクセスできる。ドライバはサーフェスが不要になったらアンロックする責任がある。サーフェスは非常に短い時間だけロックすべきである。サーフェスをアンロックするには
EngUnlockSurface を使う。


%index
EngMarkBandingSurface
EngMarkBandingSurface 関数は、指定したサーフェスをバンディングサーフェスとしてマークする。
%prm
hsurf
hsurf : [intptr] バンディングサーフェスとしてマークするサーフェスへの呼び出し元提供のハンドル。
%inst
EngMarkBandingSurface 関数は、指定したサーフェスをバンディングサーフェスとしてマークする。

[戻り値]
EngMarkBandingSurface は成功時に TRUE を返し、それ以外は FALSE を返す。

[備考]
プリンタグラフィックス DLL が GDI 管理サーフェスを使用する場合、物理ページのビットマップ全体を保持できるサーフェスを
EngCreateBitmap で作成できないなら、EngMarkBandingSurface
を呼ばなければならない。EngCreateBitmap と EngMarkBandingSurface の両方は、プリンタグラフィックス
DLL の DrvEnableSurface 関数内から呼ぶべきである。hsurf に与えるハンドルは EngCreateBitmap
が返したビットマップハンドルでなければならない。プリンタグラフィックス DLL が EngMarkBandingSurface
を呼ぶ場合、DrvStartBanding と DrvNextBand 関数を定義しなければならない。


%index
EngMultiByteToUnicodeN
EngMultiByteToUnicodeN 関数は、現在の ANSI コードページを使って指定した ANSI ソース文字列を Unicode 文字列に変換する。
%prm
UnicodeString, MaxBytesInUnicodeString, BytesInUnicodeString, MultiByteString, BytesInMultiByteString
UnicodeString : [wstr] 結果の Unicode 文字列を受け取るバッファへのポインタ。
MaxBytesInUnicodeString : [int] UnicodeString に書き込む最大バイト数を指定する。この値が小さすぎて UnicodeString が MultiByteString の切り詰め版になっても、エラーは発生しない。
BytesInUnicodeString : [var] UnicodeString に書き込まれたバイト数を受け取る ULONG へのポインタ。
MultiByteString : [str] Unicode に変換する ANSI ソース文字列へのポインタ。
BytesInMultiByteString : [int] MultiByteString のバイト数を指定する。
%inst
EngMultiByteToUnicodeN 関数は、現在の ANSI コードページを使って指定した ANSI ソース文字列を
Unicode 文字列に変換する。

[戻り値]
なし


%index
EngMultiByteToWideChar
EngMultiByteToWideChar 関数は、指定したコードページを使って ANSI ソース文字列をワイド文字列に変換する。
%prm
CodePage, WideCharString, BytesInWideCharString, MultiByteString, BytesInMultiByteString
CodePage : [int] 変換に使用するコードページを指定する。
WideCharString : [wstr] 変換された文字列をコピーするバッファへのポインタ。
BytesInWideCharString : [int] WideCharString のサイズ（バイト単位）を指定する。WideCharString が変換結果を保持するのに十分な大きさでない場合、EngMultiByteToWideChar は文字列を切り詰め、エラーを報告しない。
MultiByteString : [str] 変換するマルチバイト文字列を含むバッファへのポインタ。
BytesInMultiByteString : [int] MultiByteString のバイト数を指定する。
%inst
EngMultiByteToWideChar 関数は、指定したコードページを使って ANSI ソース文字列をワイド文字列に変換する。

[戻り値]
EngMultiByteToWideChar は成功した場合、ワイド文字形式に変換したバイト数を返す。それ以外の場合、関数は -1
を返す。


%index
EngPaint
EngPaint 関数は、GDI に指定領域を塗りつぶさせる。
%prm
pso, pco, pbo, pptlBrushOrg, mix
pso : [var] 描画先のサーフェスを記述する SURFOBJ 構造体へのポインタ。
pco : [var] 塗りつぶす領域を定義する CLIPOBJ 構造体へのポインタ。CLIPOBJ_Xxx サービスルーチンが、クリップ領域を矩形の集合として列挙するために提供される。
pbo : [var] 塗りつぶしに使用するパターンと色を定義する BRUSHOBJ 構造体へのポインタ。
pptlBrushOrg : [var] デバイス上でブラシパターンを整列させるためのブラシ原点を定義する POINTL 構造体へのポインタ。
mix : [int] ブラシに使用する前景および背景ラスタ操作を定義する。
%inst
EngPaint 関数は、GDI に指定領域を塗りつぶさせる。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。それ以外の場合は FALSE となり、エラーコードがログに記録される。

[備考]
ベクターデバイスドライバは、EngCreatePath と PATHOBJ_Xxx
サービスルーチンの助けを借りてこの関数を実装できる。混合モードは、入ってくるパターンを既にデバイスサーフェス上にあるデータとどのように混合するかを定義する。MIX
データ型は、単一の ULONG にパックされた 2 つの ROP2
値からなる。下位バイトは前景ラスタ操作を、次のバイトは背景ラスタ操作を定義する。ラスタ操作コードの詳細は Microsoft
Windows SDK ドキュメントを参照。


%index
EngPlgBlt
EngPlgBlt 関数は、GDI に回転ビットブロック転送を実行させる。
%prm
psoTrg, psoSrc, psoMsk, pco, pxlo, pca, pptlBrushOrg, pptfx, prcl, pptl, iMode
psoTrg : [var] 描画先のサーフェスを記述する SURFOBJ 構造体へのポインタ。
psoSrc : [var] ビットブロック転送操作のソースサーフェスを記述する SURFOBJ 構造体へのポインタ。
psoMsk : [var] ソースのマスクを表す任意の SURFOBJ 構造体へのポインタ。これは 1 ピクセルあたり 1 ビットのビットマップである論理マップで定義される。このマスクはコピーされるソースの領域を制限する。マスクは暗黙の rop4 0xCCAA を持ち、マスクが 1 のところでソースをコピーし、マスクが 0 のところでは宛先をそのままにすべきことを意味する。このパラメータが NULL の場合、暗黙の rop4 は 0xCCCC で、ソース矩形のすべての場所でソースをコピーすべきことを意味する。マスクは関連するソースを含むのに十分な大きさが常にあり、タイリングは不要である。
pco : [var] 変更する宛先の領域を制限する CLIPOBJ 構造体へのポインタ。GDI 関数はクリップ領域を矩形の集合として列挙する。可能な限り GDI はクリッピングを単純化する。DrvBitBlt と異なり、EngPlgBlt は単一クリッピング矩形で呼ばれることがある。これにより出力をクリッピングする際の丸め誤差を防ぐ。
pxlo : [var] ソースとターゲットのサーフェス間でカラーインデックスをどう変換するかを定義する XLATEOBJ 構造体へのポインタ。この XLATEOBJ 構造体は、任意のソースインデックスの RGB 色を見つけるために問い合わせることができる。色を補間するには高品質な回転ビットブロック転送が必要である。
pca : [var] ビットを伸縮する前にソースビットマップに適用するカラー調整値を定義する COLORADJUSTMENT 構造体へのポインタ。詳細は Microsoft Windows SDK ドキュメントを参照。
pptlBrushOrg : [var] ハーフトーンブラシの原点を指定する POINTL 構造体へのポインタ。ハーフトーンブラシを使用するドライバは、ブラシのパターンの左上ピクセルをデバイスサーフェス上のこの点に整列させるべきである。
pptfx : [var] 宛先サーフェス上で平行四辺形を定義する 3 つの POINTFIX 構造体へのポインタ。4 番目の暗黙の頂点は D = B + C － A として与えられる。このデータ型の説明は GDI Data Types を参照。EngPlgBlt は A, B, C が一直線上にある状態では決して呼ばれない。
prcl : [var] ソースサーフェスの座標系で、コピーする領域を定義する RECTL 構造体へのポインタ。ソース矩形の点は整列している。EngPlgBlt は決して空のソース矩形では呼ばれない。
pptl : [var] 指定したマスク内のどのピクセルがソース矩形の左上ピクセルに対応するかを指定する POINTL 構造体へのポインタ。psoMsk が NULL の場合、このパラメータは無視する。
iMode : [int] 
%inst
EngPlgBlt 関数は、GDI に回転ビットブロック転送を実行させる。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。それ以外の場合は FALSE となり、エラーコードが報告される。

[備考]
EngPlgBlt は特定の種類の回転のみを実行する。この関数は、prcl
で定義された矩形から任意の平行四辺形へのビットブロック転送を実行する。平行四辺形は 3 点の配列を指す pptfx で定義される。prcl
のソース矩形は、整数座標から (-0.5,-0.5) ずれた角を持つ幾何学的矩形と見なされる。これは EngStretchBlt
のソース矩形と完全に一致する。ソース矩形は常に整列している。ソース矩形の左上隅は最初の点 A にマップされる。ソース矩形の右上隅は 2
番目の点 B にマップされる。ソース矩形の左下隅は 3 番目の点 C にマップされる。ソース矩形の右下隅は、与えられた 3
点をベクトルとして扱い計算することで定義される平行四辺形内の暗黙の点にマップされる。
（以下省略）


%index
EngQueryEMFInfo
(no summary)
%prm
hdev, pEMFInfo
hdev : [intptr] 
pEMFInfo : [var] 
%inst



%index
EngQueryLocalTime
EngQueryLocalTime 関数はローカル時刻を問い合わせる。
%prm
param0
param0 : [var] 
%inst
EngQueryLocalTime 関数はローカル時刻を問い合わせる。

[戻り値]
なし

[備考]
EngQueryLocalTime は、現在のロケールでの時刻を ENG_TIME_FIELDS 構造体で返す。


%index
EngReleaseSemaphore
EngReleaseSemaphore 関数は、指定したセマフォを解放する。
%prm
hsem
hsem : [intptr] 解放するセマフォへのハンドル。
%inst
EngReleaseSemaphore 関数は、指定したセマフォを解放する。

[戻り値]
なし

[備考]
EngReleaseSemaphore
は、ドライバのリソースに対するセマフォの排他ロックを解放し、特殊カーネル非同期プロシージャ呼び出しの配信を再有効化する。ロックと非同期プロシージャ呼び出しの一時停止は
EngAcquireSemaphore で取得されたものである。


%index
EngStretchBlt
EngStretchBlt 関数は、GDI に伸縮ビットブロック転送を実行させる。
%prm
psoDest, psoSrc, psoMask, pco, pxlo, pca, pptlHTOrg, prclDest, prclSrc, pptlMask, iMode
psoDest : [var] 描画先のサーフェスを記述する SURFOBJ 構造体へのポインタ。
psoSrc : [var] ビットブロック転送のソースサーフェスを記述する SURFOBJ 構造体へのポインタ。
psoMask : [var] ソースのマスクを定義する SURFOBJ 構造体へのポインタ。マスクは 1 ピクセルあたり 1 ビットのビットマップである論理マップで定義される。マスクはコピーされるソースの領域を制限する。このパラメータが指定されると、暗黙の rop4 0xCCAA を持ち、マスクが 1 のところでソースをコピーし、マスクが 0 のところでは宛先をそのままにすべきことを意味する。NULL の場合、rop4 は暗黙的に 0xCCCC で、ソース矩形のすべての場所でソースをコピーすべきことを意味する。
pco : [var] 宛先で変更する領域を制限する CLIPOBJ 構造体へのポインタ。GDI サービスがクリップ領域を矩形の集合として列挙するために提供される。可能な限り GDI はクリッピングを単純化する。ただし DrvBitBlt と異なり、EngStretchBlt は単一クリッピング矩形で呼ばれることがある。これにより出力をクリッピングする際の丸め誤差を防ぐ。
pxlo : [var] ソースとターゲットのサーフェス間でカラーインデックスをどう変換するかを指定する XLATEOBJ 構造体へのポインタ。この XLATEOBJ 構造体は、任意のソースインデックスの RGB 色を見つけるためにも問い合わせることができる。場合によっては高品質な伸縮ビットブロック転送が色を補間する必要がある。
pca : [var] ビットを伸縮する前にソースビットマップに適用するカラー調整値を定義する COLORADJUSTMENT 構造体へのポインタ。詳細は Microsoft Windows SDK ドキュメントを参照。
pptlHTOrg : [var] ハーフトーンブラシの原点を定義する POINTL 構造体へのポインタ。ハーフトーンブラシを使用するドライバは、ブラシのパターンの左上ピクセルをデバイスサーフェス上のこの点に整列させるべきである。
prclDest : [var] 宛先サーフェスの座標系で変更する領域を定義する RECTL 構造体へのポインタ。この矩形は整列していない 2 点で定義される。すなわち 2 番目の点の座標は必ずしも 1 番目の点より大きいとは限らない。記述される矩形は下辺と右辺を含まない。この関数は決して空の宛先矩形では呼ばれない。宛先矩形が整列していない場合、EngStretchBlt がそれを整列させる。
prclSrc : [var] ソースサーフェスの座標系で、コピーする領域を定義する RECTL 構造体へのポインタ。矩形は prclDest で定義される矩形にマップされる。この関数は決して空のソース矩形では呼ばれず、ソース矩形の点は常に整列している。マッピングは prclSrc と prclDest によって定義される。prclDest と prclSrc に指定された点は整数座標上にあり、これはピクセル中心に対応する。そのような 2 点で定義される矩形は、与えられた点を頂点とする幾何学的矩形と見なされるが、各座標から 0.5 を引いたものになる。(POINTL 構造体はこれらの分数座標頂点を指定する省略表記である。) 矩形の辺はピクセルと交わることはなく、ピクセルの集合の周りを通る。矩形内のピクセルは右下を含まない矩形に期待されるピクセルである。EngStretchBlt は幾何学的ソース矩形を幾何学的宛先矩形に正確にマップする。
pptlMask : [var] 指定したマスク内のピクセルで、ソース矩形の左上ピクセルに対応するものを定義する POINTL 構造体へのポインタ。マスクが指定されない場合、このパラメータは無視される。
iMode : [int] 出力ピクセルを得るためにソースピクセルをどう組み合わせるかを指定する。HALFTONE モードは他のモードより遅いが、より高品質な画像を生成する。
%inst
EngStretchBlt 関数は、GDI に伸縮ビットブロック転送を実行させる。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。それ以外の場合は FALSE となり、エラーコードが報告される。

[備考]
この関数により、GDI ビットマップとデバイスサーフェスに同じハーフトーニングアルゴリズムを適用できる。ドライバが
DrvStretchBlt をフックしているがサポートしない処理を要求された場合、EngStretchBlt を呼ぶべきである。


%index
EngStretchBltROP
EngStretchBltROP 関数は、ROP を使って伸縮ビットブロック転送を実行する。
%prm
psoDest, psoSrc, psoMask, pco, pxlo, pca, pptlHTOrg, prclDest, prclSrc, pptlMask, iMode, pbo, rop4
psoDest : [var] 描画先のサーフェスを記述する SURFOBJ 構造体へのポインタ。
psoSrc : [var] ビットブロック転送のソースサーフェスを記述する SURFOBJ 構造体へのポインタ。
psoMask : [var] ソースサーフェスのマスクを定義する SURFOBJ 構造体へのポインタ。マスクは 1 ピクセルあたり 1 ビットのビットマップである論理マップで定義される。通常、マスクは宛先サーフェスで変更される領域を制限する。このマスクは常にソースサーフェスと同じサイズであるべきである。
pco : [var] 宛先で変更する領域を制限する CLIPOBJ 構造体へのポインタ。CLIPOBJ_Xxx サービスルーチンが、クリップ領域を矩形の集合として列挙するために提供される。可能な限り GDI はクリッピングを単純化する。ただし EngBitBlt と異なり、EngStretchBltROP は単一クリッピング矩形で呼ばれることがある。これにより出力をクリッピングする際の丸め誤差を防ぐ。
pxlo : [var] ソースとターゲットのサーフェス間でカラーインデックスをどう変換するかを指定する XLATEOBJ 構造体へのポインタ。この XLATEOBJ 構造体は、任意のソースインデックスの RGB 色を見つけるためにも問い合わせることができる。場合によっては高品質な伸縮ビットブロック転送が色を補間する必要がある。
pca : [var] ビットを伸縮する前にソースビットマップに適用するカラー調整値を定義する COLORADJUSTMENT 構造体へのポインタ。詳細は Windows SDK ドキュメントを参照。
pptlHTOrg : [var] 宛先サーフェス上のハーフトーンブラシの原点を定義する POINTL 構造体へのポインタ。ハーフトーンブラシを使用する場合、GDI はブラシのパターンの左上ピクセルをこの点に整列させ、その寸法に従ってブラシを繰り返す。rop4 パラメータがパターンを必要としない場合、GDI はこのパラメータを無視する。
prclDest : [var] 変更する矩形領域を定義する RECTL 構造体へのポインタ。この矩形は宛先サーフェスの座標系で指定し、左上と右下の 2 点で定義される。矩形を定義する 2 点は常に整列しているわけではなく、すなわち 2 番目の点の座標は必ずしも 1 番目の点より大きいとは限らない。宛先矩形が整列していない場合、GDI がそれを整列させる。矩形は右下を含まない。すなわち、その下辺と右辺はコピーの一部ではない。EngStretchBltROP は決して空の宛先矩形で呼んではならない。
prclSrc : [var] コピーする領域を定義する RECTL 構造体へのポインタ。この矩形はソースサーフェスの座標系で指定し、左上と右下の 2 点で定義される。矩形を定義する 2 点は常に整列している。矩形は右下を含まない。すなわち、その下辺と右辺はコピーの一部ではない。この矩形は prclDest が指す矩形にマップされる。EngStretchBltROP は決して空のソース矩形で呼んではならない。
pptlMask : [var] prclMask が指すマスク内のピクセルを定義する POINTL 構造体へのポインタ。このピクセルは prclSrc が指すソース矩形の左上ピクセルに対応する。マスクが指定されない場合、このパラメータは無視される。すなわち prclMask が NULL の場合、GDI は pptlMask を無視する。
iMode : [int] 
pbo : [var] ビットブロック転送のパターンを定義するために使用する BRUSHOBJ 構造体へのポインタ。GDI の BRUSHOBJ_pvGetRbrush サービスルーチンがデバイスのブラシ実体化を取得する。rop4 パラメータがパターンを必要としない場合、GDI はこのパラメータを無視する。
rop4 : [int] マスク、パターン、ソース、宛先ピクセルがどのように組み合わされて宛先サーフェスへ出力ピクセルを書き込むかを定義するラスタ操作を表す。これは通常の三項 Rop3 操作の自然な拡張である四項ラスタ操作である。Rop4 には Rop3 の 8 個の定義ビットと類似する 16 個の関連ビットがある（Rop3 の他の冗長ビットは無視される）。Rop4 を実装する最も単純な方法は、その 2 バイトを別々に考えることである。下位バイトは psoMask が指すマスクが 1 のときに計算すべき Rop3 を指定する。上位バイトはマスクが 0 のときに計算・適用できる Rop3 を指定する。
%inst
EngStretchBltROP 関数は、ROP を使って伸縮ビットブロック転送を実行する。

[戻り値]
EngStretchBltROP は成功時に TRUE を返す。それ以外の場合はエラーを報告し FALSE を返す。

[備考]
ドライバが DrvStretchBltROP をフックしているがすべての操作をサポートできない場合、EngStretchBltROP
を呼ぶべきである。マッピングは prclSrc と prclDest によって定義される。prclDest と prclSrc
に指定された点は整数座標上にあり、これはピクセル中心に対応する。そのような 2
点で定義される矩形は、与えられた点を頂点とする幾何学的矩形と見なされるが、各座標から 0.5 を引いたものになる。(POINTL
構造体はこれらの分数座標頂点を指定する省略表記である。)


%index
EngTextOut
EngTextOut 関数は、GDI に指定位置でグリフ集合をレンダリングさせる。
%prm
pso, pstro, pfo, pco, prclExtra, prclOpaque, pboFore, pboOpaque, pptlOrg, mix
pso : [var] 書き込み先のサーフェスを記述する SURFOBJ 構造体へのポインタ。
pstro : [var] レンダリングするグリフと配置位置を定義する STROBJ 構造体へのポインタ。
pfo : [var] フォントとそのグリフに関する情報を取得するために使われる FONTOBJ 構造体へのポインタ。
pco : [var] レンダリングを行うクリップ領域を定義する CLIPOBJ 構造体へのポインタ。このクリップ領域の外のピクセルは影響を受けない。
prclExtra : [var] RECTL 構造体へのポインタ。このパラメータは常に NULL であるべきである。
prclOpaque : [var] 右下を含まない単一の不透明矩形を識別する RECTL 構造体へのポインタ。この矩形内のピクセル（前景でなくクリップされていないもの）は不透明ブラシでレンダリングされる。この矩形は常に描画されるテキストを囲む。NULL の場合、不透明ピクセルはレンダリングされない。
pboFore : [var] 前景ピクセルに使用するブラシオブジェクトを表す BRUSHOBJ 構造体へのポインタ。このブラシは常にソリッドカラーブラシである。
pboOpaque : [var] 不透明ピクセル用のブラシオブジェクトを表す BRUSHOBJ 構造体へのポインタ。このブラシの前景・背景の混合モードはどちらも R2_COPYPEN と仮定される。ドライバが DEVINFO 構造体の flGraphicsCaps メンバに GCAPS_ARBRUSHOPAQUE 機能ビットを設定しない限り、常にソリッドカラーブラシで呼ばれる。
pptlOrg : [var] 両方のブラシのブラシ原点を定義する POINTL 構造体へのポインタ。EngTextOut の呼び出し時にこのパラメータが 0 に設定されていると、一部のプリンタドライバでカラー画像が正しく印刷されないことがある。詳細は備考を参照。
mix : [int] pboFore 用の前景および背景ラスタ操作（混合モード）を指定する。
%inst
EngTextOut 関数は、GDI に指定位置でグリフ集合をレンダリングさせる。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。それ以外の場合は FALSE となり、エラーコードがログに記録される。

[備考]
ドライバが DrvTextOut をフックしているがグリフをレンダリングできない場合、EngTextOut を呼ぶべきである。注意:
ドライバはデバイス管理サーフェスに対して DrvTextOut をフックしている場合、EngTextOut
にパントできない。EngTextOut への入力パラメータは前景と不透明の 2
種類のピクセル集合を定義する。ドライバは、まず不透明ブラシで不透明ピクセルをレンダリングし、次に前景ブラシで前景ピクセルをレンダリングするプロセスと同一の結果になるようにサーフェスをレンダリングしなければならない。これらの各操作はクリッピングによって制限される。この関数の
pptlOrg パラメータが 0 に設定されると、Microsoft Windows Server 2003 (日本語版)
では一部のプリンタドライバがカラー画像を正しく印刷しないことがある。pptlOrg を 0（NULL
ポインタ値）に設定することは、ブラシ原点が定義されていないと解釈される。これを防ぐには、EngTextOut を呼ぶ前に pptlOrg
をメンバが (0,0) に設定された POINTL
構造体のアドレスで初期化する。前景および不透明ピクセルは、それを通して色がサーフェスに塗られるスクリーンとして扱われる。フォントのグリフ自体は色を持たない。EngTextOut
への入力パラメータは、グリフピクセルの集合、追加矩形の集合、不透明矩形、クリップ領域を定義する。ドライバは前景・不透明ピクセルの集合を計算してレンダリングしなければならない。混合モードは、入ってくるパターンを既にデバイスサーフェス上にあるデータとどのように混合するかを定義する。MIX
データ型は、単一の ULONG にパックされた 2 つの ROP2
値からなる。下位バイトは前景ラスタ操作を、次のバイトは背景ラスタ操作を定義する。ラスタ操作コードの詳細は Microsoft
Windows SDK ドキュメントを参照。


%index
EngTransparentBlt
EngTransparentBlt 関数は、透過付きビットブロック転送機能を提供する。
%prm
psoDst, psoSrc, pco, pxlo, prclDst, prclSrc, TransColor, bCalledFromBitBlt
psoDst : [var] 描画先のターゲットサーフェスを識別する SURFOBJ 構造体へのポインタ。
psoSrc : [var] ビットブロック転送のソースサーフェスを識別する SURFOBJ 構造体へのポインタ。
pco : [var] CLIPOBJ 構造体へのポインタ。CLIPOBJ_Xxx サービスルーチンが、クリップ領域を矩形の集合として列挙するために提供される。この列挙は変更される宛先の領域を制限する。可能な限り GDI はクリッピングを単純化する。
pxlo : [var] ターゲットサーフェスへ書き込むためにソースカラーインデックスをどう変換するかを示す XLATEOBJ 構造体へのポインタ。
prclDst : [var] 変更する矩形領域を定義する RECTL 構造体へのポインタ。この矩形は宛先サーフェスの座標系で指定し、左上と右下の 2 点で定義される。矩形は右下を含まない。すなわち、その下辺と右辺はビットブロック転送の一部ではない。矩形を定義する 2 点は常に整列している。ドライバは決して空の宛先矩形で EngTransparentBlt を呼んではならない。
prclSrc : [var] コピーする矩形領域を定義する RECTL 構造体へのポインタ。この矩形はソースサーフェスの座標系で指定し、左上と右下の 2 点で定義される。矩形を定義する 2 点は常に整列している。ソース矩形はソースサーフェスの境界を超えてはならず、ソースサーフェスからはみ出してはならない。この矩形は prclDst で定義される宛先矩形にマップされる。ドライバは決して空のソース矩形で EngTransparentBlt を呼んではならない。
TransColor : [int] ソースサーフェスのフォーマットでの物理透過色を指定する。これはソースサーフェスのパレットに変換されたカラーインデックス値である。詳細は備考を参照。
bCalledFromBitBlt : [int] 予約。このパラメータはゼロに設定しなければならない。
%inst
EngTransparentBlt 関数は、透過付きビットブロック転送機能を提供する。

[戻り値]
EngTransparentBlt は成功時に TRUE を返す。それ以外の場合は FALSE を返す。

[備考]
ドライバが DrvTransparentBlt をフックしているがサポートしない処理を要求された場合、EngTransparentBlt
を呼ぶべきである。透過付きビットブロック転送は、2 つのデバイス管理サーフェス間、またはデバイス管理サーフェスと GDI
管理の標準フォーマットビットマップとの間でサポートされる。現在、GDI は BMF_4BPP と BMF_8BPP
のソースサーフェスのみをサポートする。iTransparentColor
で指定された透過色に一致するソースサーフェス上のピクセルはコピーされない。透過 blt の詳細は Copying Bitmaps を参照。


%index
EngUnicodeToMultiByteN
EngUnicodeToMultiByteN 関数は、現在の ANSI コードページを使って指定した Unicode 文字列を ANSI 文字列に変換する。
%prm
MultiByteString, MaxBytesInMultiByteString, BytesInMultiByteString, UnicodeString, BytesInUnicodeString
MultiByteString : [str] 結果の ANSI 文字列を受け取るバッファへのポインタ。
MaxBytesInMultiByteString : [int] MultiByteString に書き込む最大バイト数を指定する。この値が小さすぎて MultiByteString が UnicodeString の切り詰め版になっても、エラーは発生しない。
BytesInMultiByteString : [var] MultiByteString に書き込まれたバイト数を受け取る ULONG へのポインタ。
UnicodeString : [wstr] ANSI に変換する Unicode ソース文字列へのポインタ。
BytesInUnicodeString : [int] UnicodeString のバイト数を指定する。
%inst
EngUnicodeToMultiByteN 関数は、現在の ANSI コードページを使って指定した Unicode 文字列を ANSI
文字列に変換する。

[戻り値]
なし


%index
EngUnlockSurface
EngUnlockSurface 関数は、GDI にサーフェスをアンロックさせる。
%prm
pso
pso : [var] アンロックするサーフェスを記述する SURFOBJ 構造体へのポインタ。
%inst
EngUnlockSurface 関数は、GDI にサーフェスをアンロックさせる。

[戻り値]
なし

[備考]
指定したサーフェスはこれ以前に EngLockSurface 呼び出しでロックされていなければならない。SURFOBJ
構造体へのポインタは、この呼び出しの後で使用してはならない。


%index
EngWideCharToMultiByte
EngWideCharToMultiByte 関数は、指定したコードページを使ってワイド文字列を ANSI ソース文字列に変換する。
%prm
CodePage, WideCharString, BytesInWideCharString, MultiByteString, BytesInMultiByteString
CodePage : [int] 変換に使用するコードページを指定する。
WideCharString : [wstr] 変換するワイド文字列を含むバッファへのポインタ。
BytesInWideCharString : [int] WideCharString のサイズ（バイト単位）を指定する。
MultiByteString : [str] 変換された文字列をコピーするバッファへのポインタ。
BytesInMultiByteString : [int] MultiByteString のバイト数を指定する。MultiByteString が変換結果を保持するのに十分な大きさでない場合、EngWideCharToMultiByte は文字列を切り詰め、エラーを報告しない。
%inst
EngWideCharToMultiByte 関数は、指定したコードページを使ってワイド文字列を ANSI ソース文字列に変換する。

[戻り値]
EngWideCharToMultiByte は成功した場合、マルチバイト形式に変換したバイト数を返す。それ以外の場合は -1 を返す。


%index
EnumEnhMetaFile
EnumEnhMetaFile 関数は、拡張形式メタファイル内のレコードを取得し、各レコードを指定したコールバック関数に渡すことで列挙する。
%prm
hdc, hmf, proc, param3, lpRect
hdc : [intptr] デバイスコンテキストへのハンドル。このハンドルはコールバック関数に渡される。
hmf : [intptr] 拡張メタファイルへのハンドル。
proc : [int] アプリケーション提供のコールバック関数へのポインタ。詳細は EnhMetaFileProc 関数を参照。
param3 : [intptr] 
lpRect : [var] 図の左上隅と右下隅の座標（論理単位）を指定する RECT 構造体へのポインタ。
%inst
EnumEnhMetaFile
関数は、拡張形式メタファイル内のレコードを取得し、各レコードを指定したコールバック関数に渡すことで列挙する。

[戻り値]

コールバック関数が拡張メタファイル内のすべてのレコードを正常に列挙した場合、戻り値は非ゼロとなる。コールバック関数がすべてのレコードを正常に列挙しなかった場合、戻り値はゼロとなる。

[備考]
lpRect パラメータが指す矩形の辺上の点も図に含まれる。hdc パラメータが NULL の場合、システムは lpRect
を無視する。コールバック関数が PlayEnhMetaFileRecord を呼ぶ場合、hdc
は有効なデバイスコンテキストを識別しなければならない。システムはデバイスコンテキストの変換とマッピングモードを使って、PlayEnhMetaFileRecord
で表示される図を変換する。EnumEnhMetaFile を使うと、ある拡張メタファイルを別のものに埋め込むことができる。


%index
EnumFontFamiliesW
EnumFontFamilies 関数は、指定したデバイスで利用可能な、指定フォントファミリ内のフォントを列挙する。(Unicode)
%prm
hdc, lpLogfont, lpProc, lParam
hdc : [intptr] フォントを列挙するデバイスコンテキストへのハンドル。
lpLogfont : [wstr] 目的のフォントのファミリ名を指定する、NULL終端文字列へのポインタ。lpszFamily が NULL の場合、EnumFontFamilies は利用可能な各タイプファミリのフォントを 1 つずつ選択して列挙する。
lpProc : [int] アプリケーション定義のコールバック関数へのポインタ。詳細は EnumFontFamProc を参照。
lParam : [intptr] アプリケーション提供のデータへのポインタ。データはフォント情報と共にコールバック関数に渡される。
%inst
EnumFontFamilies 関数は、指定したデバイスで利用可能な、指定フォントファミリ内のフォントを列挙する。(Unicode)

[戻り値]
戻り値はコールバック関数が最後に返した値である。その意味は実装依存である。

[備考]
EnumFontFamilies 関数は、lpszFamily
パラメータで指定された書体名を持つフォントごとに、そのフォント情報を取得し、lpEnumFontFamProc
パラメータで指定された関数に渡す。アプリケーション定義のコールバック関数は、フォント情報を任意に処理できる。列挙はフォントがなくなるか、コールバック関数が
0 を返すまで続けられる。SetGraphicsMode 関数によりデバイスコンテキストのグラフィックモードが GM_ADVANCED
に設定され、FontType パラメータに DEVICE_FONTTYPE フラグが渡されている場合、この関数はシステム上の Type 1
および OpenType フォントの一覧を返す。グラフィックモードが GM_ADVANCED でない場合は、Type
1、OpenType、TrueType フォントの一覧を返す。多くの東アジア言語のフォントには、英語名とローカライズ名の 2
つの書体名がある。EnumFonts、EnumFontFamilies、EnumFontFamiliesEx
は、システムロケールがフォントの言語と一致しない場合、英語の書体名を返す。


%index
EnumFontFamiliesExW
EnumFontFamiliesEx 関数は、LOGFONT 構造体で指定されたフォント特性に一致する、システム内のすべての一意な名前のフォントを列挙する。EnumFontFamiliesEx は、書体名、文字セット、またはその両方に基づいてフォントを列挙する。(Unicode)
%prm
hdc, lpLogfont, lpProc, lParam, dwFlags
hdc : [intptr] フォントを列挙するデバイスコンテキストへのハンドル。
lpLogfont : [var] 列挙するフォントに関する情報を含む LOGFONT 構造体へのポインタ。関数は次のメンバを調査する。
lpProc : [int] アプリケーション定義のコールバック関数へのポインタ。詳細は EnumFontFamExProc 関数を参照。
lParam : [intptr] アプリケーション定義の値。関数はこの値をフォント情報と共にコールバック関数に渡す。
dwFlags : [int] このパラメータは使用されず、ゼロでなければならない。
%inst
EnumFontFamiliesEx 関数は、LOGFONT
構造体で指定されたフォント特性に一致する、システム内のすべての一意な名前のフォントを列挙する。EnumFontFamiliesEx
は、書体名、文字セット、またはその両方に基づいてフォントを列挙する。(Unicode)

[戻り値]
戻り値はコールバック関数が返した最後の値となる。この値は指定したデバイスで利用可能なフォントファミリに依存する。

[備考]
EnumFontFamiliesEx
関数は、文字セットを識別するためにタグ付き書体名を使わない。代わりに常に正しい書体名と別個の文字セット値をコールバック関数に渡す。関数は
LOGFONT 構造体内の lfCharSet と lfFaceName
メンバの値に基づいてフォントを列挙する。EnumFontFamilies と同様に EnumFontFamiliesEx
はすべてのフォントスタイルを列挙する。フォントのすべてのスタイルが同じ文字セットをカバーするとは限らない。例えば Fontorama
Bold は ANSI、ギリシャ、キリル文字を含むかもしれないが、Fontorama Italic は ANSI
文字のみかもしれない。このため、たとえ ANSI
文字セットであっても、指定したフォントが特定の文字セットをカバーすると仮定しない方がよい。次の表は lfCharSet と
lfFaceName のさまざまな値の組み合わせの結果を示す。
（以下省略）


%index
EnumFontsW
EnumFonts 関数は、指定したデバイスで利用可能なフォントを列挙する。(Unicode)
%prm
hdc, lpLogfont, lpProc, lParam
hdc : [intptr] フォントを列挙する対象の HDC。
lpLogfont : [wstr] 目的のフォントの書体名を指定する NULL 終端文字列へのポインタ。lpFaceName が NULL の場合、EnumFonts は利用可能な各書体のフォントをランダムに 1 つ選択して列挙する。
lpProc : [int] アプリケーション定義のコールバック関数へのポインタ。詳細は EnumFontsProc を参照。
lParam : [intptr] アプリケーション定義のデータへのポインタ。このデータはフォント情報とともにコールバック関数へ渡される。
%inst
EnumFonts 関数は、指定したデバイスで利用可能なフォントを列挙する。(Unicode)

[戻り値]
戻り値はコールバック関数が最後に返した値である。その意味はアプリケーションが定義する。

[備考]
EnumFonts の代わりに EnumFontFamiliesEx を使用すること。EnumFontFamiliesEx 関数は
TrueType フォントに関連付けられたスタイル名を取得する点で EnumFonts 関数と異なる。EnumFontFamiliesEx
を使用すると、EnumFonts
関数では列挙できないフォントスタイルの情報を取得できる。多くの東アジア言語のフォントには、英語名とローカライズ名の 2
つの書体名がある。EnumFonts、EnumFontFamilies、EnumFontFamiliesEx
は、システムロケールがフォントの言語と一致しない場合、英語の書体名を返す。
> [!NOTE] > wingdi.h ヘッダは EnumFonts をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の有無に応じてこの関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立なエイリアスと非中立コードを混在させると、コンパイルまたは実行時エラーの原因となる不整合を引き起こすことがある。詳細は
[関数プロトタイプの規則](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
EnumICMProfilesW
EnumICMProfiles 関数は、指定したデバイスコンテキストに対してシステムがサポートする各種出力カラープロファイルを列挙する。(Unicode)
%prm
hdc, proc, param2
hdc : [intptr] デバイスコンテキストを指定する。
proc : [int] アプリケーションが定義したコールバック関数のプロシージャインスタンスアドレスを指定する(EnumICMProfilesProcCallback を参照)。
param2 : [intptr] 
%inst
EnumICMProfiles
関数は、指定したデバイスコンテキストに対してシステムがサポートする各種出力カラープロファイルを列挙する。(Unicode)

[戻り値]
アプリケーションが列挙を中断した場合、この関数は 0 を返す。列挙すべきカラープロファイルが存在しない場合、戻り値は -1
である。それ以外の場合、戻り値はコールバック関数が最後に返した値である。

[備考]
EnumICMProfiles 関数は、デバイスコンテキスト (DC) に関連付けられ、かつその DC
の設定に一致するプロファイルの一覧を返す。デバイスコンテキストには、特定のハードウェアデバイスに関連付けられていないデバイスプロファイルや、DC
の設定に一致しないデバイスプロファイルが含まれる場合がある。sRGB プロファイルはその例である。SetICMProfile
関数はこの種のプロファイルを DC に関連付けるために使用される。GetICMProfile 関数を使えば、EnumICMProfiles
関数では列挙されないプロファイルを取得できる。Windows 95/98/Me: EnumICMProfilesW は Microsoft
Layer for Unicode でサポートされる。使用するには、Windows 95/98/Me 向け Microsoft Layer
for Unicode の説明に従って、特定のファイルをアプリケーションに追加する必要がある。
> [!NOTE] > wingdi.h ヘッダは EnumICMProfiles をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の有無に応じてこの関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立なエイリアスと非中立コードを混在させると、コンパイルまたは実行時エラーの原因となる不整合を引き起こすことがある。詳細は
[関数プロトタイプの規則](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
EnumMetaFile
EnumMetaFile 関数は、Windows 形式メタファイル内の各レコードを取得して指定のコールバック関数に渡すことで、レコードを列挙する。
%prm
hdc, hmf, proc, param3
hdc : [intptr] デバイスコンテキストのハンドル。このハンドルはコールバック関数へ渡される。
hmf : [intptr] Windows 形式メタファイルのハンドル。
proc : [int] アプリケーションが用意するコールバック関数へのポインタ。詳細は EnumMetaFileProc を参照。
param3 : [intptr] 
%inst
EnumMetaFile 関数は、Windows
形式メタファイル内の各レコードを取得して指定のコールバック関数に渡すことで、レコードを列挙する。

[戻り値]
コールバック関数が Windows 形式メタファイル内のすべてのレコードを正常に列挙した場合、戻り値は 0
以外である。コールバック関数がすべてのレコードを正常に列挙できなかった場合、戻り値は 0 である。

[備考]
Windows 形式メタファイルを拡張形式メタファイルに変換するには、SetWinMetaFileBits
関数を使用する。EnumMetaFile 関数を使用すると、ある Windows
形式メタファイルを別のメタファイルに埋め込むことができる。


%index
EnumObjects
EnumObjects 関数は、指定したデバイスコンテキスト (DC) で利用可能なペンまたはブラシを列挙する。
%prm
hdc, nType, lpFunc, lParam
hdc : [intptr] DC のハンドル。
nType : [int] オブジェクトの種類。このパラメータには OBJ_BRUSH または OBJ_PEN を指定できる。
lpFunc : [int] アプリケーション定義のコールバック関数へのポインタ。コールバック関数の詳細は EnumObjectsProc を参照。
lParam : [intptr] アプリケーション定義のデータへのポインタ。このデータはオブジェクト情報とともにコールバック関数へ渡される。
%inst
EnumObjects 関数は、指定したデバイスコンテキスト (DC) で利用可能なペンまたはブラシを列挙する。

[戻り値]

関数が成功した場合、戻り値はコールバック関数が最後に返した値であり、その意味は利用者が定義する。オブジェクトを列挙できない場合(例:オブジェクトが多すぎる場合)、コールバック関数を呼び出さずに
0 を返す。


%index
EqualRgn
EqualRgn 関数は、指定した 2 つのリージョンが同一かどうかを判定する。2 つのリージョンのサイズと形状が等しい場合、それらは同一とみなされる。
%prm
hrgn1, hrgn2
hrgn1 : [intptr] リージョンのハンドル。
hrgn2 : [intptr] リージョンのハンドル。
%inst
EqualRgn 関数は、指定した 2 つのリージョンが同一かどうかを判定する。2
つのリージョンのサイズと形状が等しい場合、それらは同一とみなされる。

[戻り値]
2 つのリージョンが等しい場合、戻り値は 0 以外である。等しくない場合は 0 である。戻り値が ERROR
の場合は、少なくとも一方のリージョンハンドルが無効であることを意味する。


%index
Escape
アプリケーションが GDI 経由で利用できないシステム定義のデバイス機能にアクセスできるようにする。
%prm
hdc, iEscape, cjIn, pvIn, pvOut
hdc : [intptr] デバイスコンテキストのハンドル。
iEscape : [int] 実行するエスケープ関数。このパラメータには備考に列挙された定義済みエスケープ値のいずれかを指定しなければならない。アプリケーション独自のエスケープ値を使用する場合は ExtEscape 関数を利用する。
cjIn : [int] lpvInData パラメータが指すデータのバイト数。0 を指定することもできる。
pvIn : [str] 指定エスケープに必要な入力構造体へのポインタ。
pvOut : [intptr] このエスケープからの出力を受け取る構造体へのポインタ。データが返されない場合は NULL を指定する。
%inst
アプリケーションが GDI 経由で利用できないシステム定義のデバイス機能にアクセスできるようにする。

[戻り値]
関数が成功した場合、戻り値は 0 より大きい(ただし QUERYESCSUPPORT
プリンタエスケープの場合は実装の有無のみを確認する)。エスケープが実装されていない場合の戻り値は 0
である。関数が失敗した場合、戻り値はシステムエラーコードとなる。

[備考]
注意
これはブロッキング(同期)関数であり、すぐには戻らない可能性がある。戻るまでの時間は、ネットワーク状態、プリントサーバの構成、プリンタドライバの実装など、アプリケーション側では予測しにくい実行時要因に依存する。ユーザインタフェースを管理するスレッドからこの関数を呼び出すと、アプリケーションが応答不能に見えることがある。cbInput
に 0 を渡したときの動作は、nEscape
の値とエスケープを処理するドライバに依存する。元々のプリンタエスケープのうち、使用可能なのは以下のものだけである。
（以下省略）


%index
ExcludeClipRect
ExcludeClipRect 関数は、既存のクリッピングリージョンから指定した矩形を除いた新しいクリッピングリージョンを作成する。
%prm
hdc, left, top, right, bottom
hdc : [intptr] デバイスコンテキストのハンドル。
left : [int] 矩形の左上隅の x 座標(論理単位)。
top : [int] 矩形の左上隅の y 座標(論理単位)。
right : [int] 矩形の右下隅の x 座標(論理単位)。
bottom : [int] 矩形の右下隅の y 座標(論理単位)。
%inst
ExcludeClipRect 関数は、既存のクリッピングリージョンから指定した矩形を除いた新しいクリッピングリージョンを作成する。

[戻り値]
戻り値は新しいクリッピングリージョンの複雑度を表し、次のいずれかの値となる。
（以下省略）

[備考]
指定した矩形の下辺および右辺はクリッピングリージョンから除外されない。


%index
ExtCreatePen
ExtCreatePen 関数は、指定したスタイル、幅、ブラシ属性を持つ論理コスメティックまたはジオメトリックペンを作成する。
%prm
iPenStyle, cWidth, plbrush, cStyle, pstyle
iPenStyle : [int] タイプ、スタイル、端点、結合属性の組み合わせ。各カテゴリの値はビット OR 演算子 ( | ) で結合する。
cWidth : [int] ペンの幅。dwPenStyle が PS_GEOMETRIC の場合、幅は論理単位で指定する。PS_COSMETIC の場合、幅は 1 でなければならない。
plbrush : [var] LOGBRUSH 構造体へのポインタ。dwPenStyle が PS_COSMETIC の場合、lbColor メンバにはペンの色を指定し、lpStyle メンバには BS_SOLID を設定する必要がある。dwPenStyle が PS_GEOMETRIC の場合、ペンのブラシ属性を指定するためにすべてのメンバを使用しなければならない。
cStyle : [int] lpStyle 配列の長さ(DWORD 単位)。dwPenStyle が PS_USERSTYLE でない場合は 0 でなければならない。スタイル数は最大 16 個に制限される。
pstyle : [var] 配列へのポインタ。最初の値はユーザ定義スタイルにおける最初のダッシュの長さ、2 番目の値は最初のスペースの長さ、以下同様。dwPenStyle が PS_USERSTYLE でない場合、このポインタは NULL でなければならない。線描画中に lpStyle 配列を越えた場合、ポインタは配列の先頭にリセットされる。このとき dwStyleCount が偶数ならダッシュとスペースのパターンが繰り返される。一方、dwStyleCount が奇数の場合は、ポインタがリセットされるとパターンが反転する。つまり lpStyle の最初の要素はスペースを、2 番目はダッシュを表すようになり、以下同様となる。
%inst
ExtCreatePen 関数は、指定したスタイル、幅、ブラシ属性を持つ論理コスメティックまたはジオメトリックペンを作成する。

[戻り値]
関数が成功した場合、戻り値は論理ペンを識別するハンドルである。失敗した場合の戻り値は 0 である。

[備考]
ジオメトリックペンは任意の幅を持てるほか、ディザやパターンなどブラシの任意の属性を持つことができる。コスメティックペンは 1
ピクセル幅で単色のみだが、一般にジオメトリックペンより高速である。ジオメトリックペンの幅は常にワールド単位で指定する。コスメティックペンの幅は常に
1 である。端点と結合はジオメトリックペンに対してのみ指定する。論理ペンを作成した後、アプリケーションは SelectObject
関数を呼び出してデバイスコンテキストにそのペンを選択できる。ペンがデバイスコンテキストに選択された後、線や曲線の描画に使用できる。dwPenStyle
が PS_COSMETIC かつ PS_USERSTYLE の場合、lpStyle
配列の各要素はスタイル単位によるダッシュとスペースの長さを指定する。スタイル単位は、ペンで線を引くデバイスによって定義される。dwPenStyle
が PS_GEOMETRIC かつ PS_USERSTYLE の場合、lpStyle
配列の各要素は論理単位によるダッシュとスペースの長さを指定する。dwPenStyle が PS_ALTERNATE
の場合、スタイル単位は無視され、1 ピクセルおきに描画される。lplb が指す LOGBRUSH 構造体の lbStyle メンバが
BS_PATTERN の場合、lbHatch メンバが指すビットマップは DIB セクションであってはならない。DIB セクションは
CreateDIBSection で作成されるビットマップである。そのビットマップが DIB セクションの場合、ExtCreatePen
関数は失敗する。指定したペンが不要になったら、アプリケーションは DeleteObject 関数を呼び出してペンを削除すること。ICM:
ペンの作成時にはカラーマネジメントは行われない。ただし、ICM
対応のデバイスコンテキストにペンが選択されたときにはカラーマネジメントが行われる。


%index
ExtCreateRegion
ExtCreateRegion 関数は、指定したリージョンと変換データからリージョンを作成する。
%prm
lpx, nCount, lpData
lpx : [var] リージョンに対して行う変換を定義する XFORM 構造体へのポインタ。このポインタが NULL の場合、恒等変換が使用される。
nCount : [int] lpRgnData が指すデータのバイト数。
lpData : [var] 論理単位のリージョンデータを含む RGNDATA 構造体へのポインタ。
%inst
ExtCreateRegion 関数は、指定したリージョンと変換データからリージョンを作成する。

[戻り値]
関数が成功した場合、戻り値はリージョンの値である。失敗した場合の戻り値は NULL である。

[備考]
リージョンの座標は 27 ビット符号付き整数として表現される。アプリケーションは GetRegionData
関数を呼び出してリージョンのデータを取得できる。


%index
ExtEscape
ExtEscape 関数は、アプリケーションが GDI 経由で利用できないデバイス機能にアクセスできるようにする。
%prm
hdc, iEscape, cjInput, lpInData, cjOutput, lpOutData
hdc : [intptr] デバイスコンテキストのハンドル。
iEscape : [int] 実行するエスケープ関数。以下のいずれか、またはアプリケーション定義のエスケープ関数を指定できる。
cjInput : [int] lpszInData パラメータが指すデータのバイト数。
lpInData : [str] 指定エスケープに必要な入力構造体へのポインタ。備考も参照。
cjOutput : [int] lpszOutData パラメータが指すデータのバイト数。
lpOutData : [str] このエスケープからの出力を受け取る構造体へのポインタ。ExtEscape をクエリ関数として呼ぶ場合、このパラメータは NULL であってはならない。この構造体にデータを返さない場合は、cbOutput に 0 を指定する。備考も参照。
%inst
ExtEscape 関数は、アプリケーションが GDI 経由で利用できないデバイス機能にアクセスできるようにする。

[戻り値]
戻り値は関数の結果を示す。関数が成功した場合は 0 より大きい値となる(ただし QUERYESCSUPPORT
プリンタエスケープの場合は実装の有無のみを確認する)。エスケープが実装されていない場合、戻り値は 0 である。戻り値が 0
未満の場合はエラーを示す。

[備考]
注意
これはブロッキング(同期)関数であり、すぐには戻らない可能性がある。戻るまでの時間は、ネットワーク状態、プリントサーバの構成、プリンタドライバの実装など、アプリケーション側では予測しにくい実行時要因に依存する。ユーザインタフェースを管理するスレッドからこの関数を呼び出すと、アプリケーションが応答不能に見えることがある。この関数はドライバ定義のエスケープ値をデバイスに渡すために使用する。システム定義のエスケープ値(nEscape
で定義された値を除く)を渡すには Escape 関数を使用する。ExtEscape
はシステム定義エスケープでは正しく動作しない場合がある。特に、lpszInData
がポインタを含む構造体へのポインタであるようなエスケープは失敗する。ここで説明する動作は期待される動作だが、このモデルに従うかはドライバ次第である。lpszInData
と lpszOutData
が参照する変数は同じでも重なってもいけない。入力と出力のバッファサイズ変数が重なっていると、呼び出し後に正しい値にならない可能性がある。最良の結果を得るには、lpszInData
と lpszOutData は別々の変数を参照すべきである。CHECKJPEGFORMAT プリンタエスケープ関数は、プリンタが JPEG
画像の印刷をサポートしているかを判定する。CHECKJPEGFORMAT プリンタエスケープを使用する前に、QUERYESCSUPPORT
プリンタエスケープを呼び出してドライバが CHECKJPEGFORMAT をサポートするかを確認すること。CHECKJPEGFORMAT
の使用例は、「プリンタの JPEG/PNG サポートのテスト」を参照。CHECKPNGFORMAT プリンタエスケープ関数は、プリンタが
PNG 画像の印刷をサポートしているかを判定する。CHECKPNGFORMAT を使用する前に、QUERYESCSUPPORT
プリンタエスケープを呼び出してドライバがサポートするかを確認すること。サンプルコードは「プリンタの JPEG/PNG
サポートのテスト」を参照。DRAWPATTERNRECT プリンタエスケープは、Hewlett-Packard LaserJet または
LaserJet 互換プリンタ上で Page Control Language (PCL)
のパターンと罫線機能を使い、白、グレースケール、または塗りつぶしの黒い矩形を作成する。グレースケールとは、白黒ピクセルを特定の比率で混合したグレーのパターンである。DRAWPATTERNRECT
エスケープを使用する前に、アプリケーションは QUERYESCSUPPORT
エスケープで、プリンタがパターンや罫線を描画できるかを確認すべきである。
（以下省略）


%index
ExtFloodFill
ExtFloodFill 関数は、表示面の領域を現在のブラシで塗りつぶす。
%prm
hdc, x, y, color, type
hdc : [intptr] デバイスコンテキストのハンドル。
x : [int] 塗りつぶしを開始する点の x 座標(論理単位)。
y : [int] 塗りつぶしを開始する点の y 座標(論理単位)。
color : [int] 境界または塗りつぶし領域の色。color の解釈は fuFillType パラメータの値に依存する。COLORREF 値を作成するには RGB マクロを使用する。
type : [int] 
%inst
ExtFloodFill 関数は、表示面の領域を現在のブラシで塗りつぶす。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。

[備考]
この関数が失敗する可能性のある理由には次のようなものがある。
（以下省略）


%index
ExtSelectClipRgn
ExtSelectClipRgn 関数は、指定したリージョンを現在のクリッピングリージョンと指定モードで結合する。
%prm
hdc, hrgn, mode
hdc : [intptr] デバイスコンテキストのハンドル。
hrgn : [intptr] 選択するリージョンのハンドル。RGN_COPY モードが指定されていない限り、このハンドルは NULL であってはならない。
mode : [int] 
%inst
ExtSelectClipRgn 関数は、指定したリージョンを現在のクリッピングリージョンと指定モードで結合する。

[戻り値]
戻り値は新しいクリッピングリージョンの複雑度を表し、次のいずれかの値となる。
（以下省略)

[備考]

この関数の呼び出し中にエラーが発生しても、指定したデバイスコンテキストの以前のクリッピングリージョンは影響を受けない。ExtSelectClipRgn
関数は、指定したリージョンの座標がデバイス単位で与えられていると想定する。hrgn
パラメータで識別されるリージョンのコピーのみが使用される。リージョン自体は、呼び出し後に再利用したり削除したりできる。


%index
ExtTextOutW
ExtTextOut 関数は、現在選択されているフォント、背景色、テキスト色を使ってテキストを描画する。必要に応じてクリッピングや不透明描画の寸法を指定できる。(Unicode)
%prm
hdc, x, y, options, lprect, lpString, c, lpDx
hdc : [intptr] デバイスコンテキストのハンドル。
x : [int] 文字列の配置に使用する基準点の x 座標(論理座標)。
y : [int] 文字列の配置に使用する基準点の y 座標(論理座標)。
options : [int] 
lprect : [var] クリッピング、不透明描画、またはその両方に使用する矩形の寸法を論理座標で指定する、省略可能な RECT 構造体へのポインタ。
lpString : [wstr] 描画する文字列へのポインタ。cbCount で長さが指定されるため、NULL 終端である必要はない。
c : [int] lpString が指す文字列の長さ。この値は 8192 を超えてはならない。
lpDx : [var] 隣接する文字セルの原点間の距離を示す、省略可能な値の配列へのポインタ。例えば lpDx[i] 論理単位が、文字セル i と i+1 の原点を隔てる。
%inst
ExtTextOut
関数は、現在選択されているフォント、背景色、テキスト色を使ってテキストを描画する。必要に応じてクリッピングや不透明描画の寸法を指定できる。(Unicode)

[戻り値]
文字列が描画された場合、戻り値は 0 以外である。ただし、ExtTextOut の ANSI 版が ETO_GLYPH_INDEX
で呼ばれた場合、関数は何もしなくても TRUE を返す。関数が失敗した場合、戻り値は 0 である。

[備考]
指定されたデバイスコンテキストの現在のテキスト配置設定により、基準点がどのようにテキストの配置に使われるかが決まる。テキスト配置設定は
GetTextAlign 関数で取得でき、SetTextAlign
関数で変更できる。テキスト配置には以下の値を使用できる。水平および垂直配置に影響するフラグから 1
つだけ選択できる。さらに、現在位置を変更する 2 つのフラグのうち 1 つだけ選択できる。
（以下省略)


%index
FONTOBJ_cGetAllGlyphHandles
FONTOBJ_cGetAllGlyphHandles 関数は、デバイスドライバが GDI フォントのすべてのグリフハンドルを取得できるようにする。
%prm
pfo, phg
pfo : [var] ダウンロード対象の FONTOBJ 構造体へのポインタ。
phg : [var] フォント内のすべてのグリフハンドルを格納できる十分な大きさのバッファへのポインタ。このパラメータは NULL でもよい。
%inst
FONTOBJ_cGetAllGlyphHandles 関数は、デバイスドライバが GDI
フォントのすべてのグリフハンドルを取得できるようにする。

[戻り値]
戻り値はフォントがサポートするグリフハンドル数である。

[備考]

ドライバはフォント全体をダウンロードするためにこの関数を使用する。ドライバは出力を格納する十分な大きさのバッファを用意しなければならない。GDI
は関連付けられたフォントに属するすべてのグリフハンドルをこのバッファへコピーする。フォント内のグリフ数は、FONTOBJ_vGetInfo
を呼び出すか、phg パラメータに NULL を指定して FONTOBJ_cGetAllGlyphHandles
を呼び出すことで取得できる。


%index
FONTOBJ_cGetGlyphs
FONTOBJ_cGetGlyphs 関数は、グリフハンドルをグリフデータへのポインタに変換する、フォント利用者向けのサービスである。このポインタは次回の FONTOBJ_cGetGlyphs 呼び出しまで有効である。
%prm
pfo, iMode, cGlyph, phg, ppvGlyph
pfo : [var] 変換するグリフハンドルを含む FONTOBJ 構造体へのポインタ。
iMode : [int] 
cGlyph : [int] 変換するグリフ数を指定する。指定可能な値は 1 のみである(コードは指定値に関わらず 1 と仮定する)。
phg : [var] ドライバが指定する cGlyph 個の HGLYPH 構造体の配列へのポインタ。
ppvGlyph : [var] GLYPHDATA 構造体のアドレスを受け取るメモリ位置へのポインタ。この構造体の最初のメンバは GLYPHDEF 共用体で、iMode パラメータの値によって GLYPHBITS 構造体または PATHOBJ 構造体へのポインタを含む。iMode が FO_GLYPHBITS の場合、(*ppvGlyph)->gdf は GLYPHBITS 構造体のアドレスを含む。iMode が FO_PATHOBJ の場合、(*ppvGlyph)->gdf は PATHOBJ 構造体のアドレスを含む。
%inst
FONTOBJ_cGetGlyphs
関数は、グリフハンドルをグリフデータへのポインタに変換する、フォント利用者向けのサービスである。このポインタは次回の
FONTOBJ_cGetGlyphs 呼び出しまで有効である。

[戻り値]
関数が成功した場合、戻り値はドライバに渡されたポインタの個数である。失敗した場合は 0 を返し、エラーコードがログに記録される。

[備考]
この関数は、ドライバがフォントをキャッシュする場合に使用すべきである。


%index
FONTOBJ_pQueryGlyphAttrs
FONTOBJ_pQueryGlyphAttrs 関数は、フォントのグリフに関する情報を返す。
%prm
pfo, iMode
pfo : [var] 属性を要求するフォントを識別する FONTOBJ 構造体への、呼び出し元が指定するポインタ。
iMode : [int] 呼び出し元が指定するフラグで、要求するグリフ属性の種類を示す。次のフラグが定義されている。
%inst
FONTOBJ_pQueryGlyphAttrs 関数は、フォントのグリフに関する情報を返す。

[戻り値]
FONTOBJ_pQueryGlyphAttrs は FD_GLYPHATTR
構造体へのポインタを返す。無効な入力引数などのエラーが発生した場合、または FONTOBJ
構造体が示すフォントが縦書きフォントでない場合、この関数は NULL を返す。

[備考]
現在定義されている属性フラグは FO_ATTR_MODE_ROTATE
のみである。このフラグは、組み込みフォントラスタライザを備えたプリンタをサポートするプリンタドライバ向けのものである。ドライバは
FO_ATTR_MODE_ROTATE フラグを指定して FONTOBJ_pQueryGlyphAttrs
関数を呼び、縦書きフォント内のどのグリフを回転させる必要があるかを判定できる。縦書きフォントはフォント名が "@"
で始まる。現在のフォントが縦書きフォントかを判定するには、そのフォントの FONTOBJ 構造体の flFontType メンバに
FO_VERT_FACE フラグが立っているかを確認する。回転情報はこの関数の戻り値である FD_GLYPHATTR
構造体に格納される。FONTOBJ_pQueryGlyphAttrs 関数は GDI が提供する。プリンタドライバが
FONTOBJ_pQueryGlyphAttrs を呼び出すと、GDI は該当するフォントドライバの DrvQueryGlyphAttrs
関数を呼び出して要求情報を取得する。


%index
FONTOBJ_pfdg
FONTOBJ_pfdg 関数は、指定フォントに関連付けられた FD_GLYPHSET 構造体へのポインタを取得する。
%prm
pfo
pfo : [var] 関連する FD_GLYPHSET 構造体を返す対象の FONTOBJ 構造体へのポインタ。
%inst
FONTOBJ_pfdg 関数は、指定フォントに関連付けられた FD_GLYPHSET 構造体へのポインタを取得する。

[戻り値]
FONTOBJ_pfdg は、指定フォントに関連付けられた FD_GLYPHSET 構造体へのポインタを返す。

[備考]
プリンタドライバは FONTOBJ_pfdg を呼び出すことで、GDI フォントでサポートされる Unicode
コードポイントを判定できる。その後、類似のプリンタ常駐フォントを使って文字列を表示することでパフォーマンスを最適化できるかを判断できる。


%index
FONTOBJ_pvTrueTypeFontFile
FONTOBJ_pvTrueTypeFontFile 関数は、TrueType、OpenType、または Type1 フォントファイルのビューへのユーザモードポインタを取得する。
%prm
pfo, pcjFile
pfo : [var] TrueType、PostScript OpenType、または PostScript Type1 フォントが関連付けられた FONTOBJ 構造体へのポインタ。
pcjFile : [var] GDI がフォントファイルのビューのサイズ(バイト単位)を返す場所へのポインタ。
%inst
FONTOBJ_pvTrueTypeFontFile 関数は、TrueType、OpenType、または Type1
フォントファイルのビューへのユーザモードポインタを取得する。

[戻り値]
FONTOBJ_pvTrueTypeFontFile は成功するとフォントファイルのユーザモードビューへのポインタを返す。FONTOBJ
構造体が Type1 フォントを示す場合、戻り値は pfb ファイルのメモリマップイメージへのポインタである。それ以外の場合、この関数は
NULL を返す。

[備考]
FONTOBJ_pvTrueTypeFontFile は TrueType、OpenType、または Type1
フォントに対してのみ呼び出すべきである。FONTOBJ_pvTrueTypeFontFile が返すポインタは、呼び出し元の
DrvTextOut 関数のスコープ内でのみ有効である。つまり、ドライバは DrvTextOut を抜けて GDI
に制御を戻した後、このポインタが有効であると仮定してはならない。


%index
FONTOBJ_pxoGetXform
FONTOBJ_pxoGetXform 関数は、指定フォントの notional-to-device 変換を取得する。
%prm
pfo
pfo : [var] 変換を取得する対象の FONTOBJ 構造体へのポインタ。
%inst
FONTOBJ_pxoGetXform 関数は、指定フォントの notional-to-device 変換を取得する。

[戻り値]
戻り値は変換を記述する XFORMOBJ 構造体へのポインタである。この XFORMOBJ 構造体は XFORMOBJ_Xxx
サービスルーチンで使用できる。XFORMOBJ 構造体は次を仮定している。
（以下省略)

[備考]
ドライバは、ドライバが提供するフォントを実体化するために notional-to-device 変換を必要とする。


%index
FONTOBJ_vGetInfo
FONTOBJ_vGetInfo 関数は、関連付けられたフォントの情報を取得する。
%prm
pfo, cjSize, pfi
pfo : [var] 問い合わせる FONTOBJ 構造体へのポインタ。
cjSize : [int] pfi が指すバッファのサイズ(バイト単位)。
pfi : [var] ドライバがあらかじめ確保したバッファへのポインタ。GDI はこのバッファに FONTINFO 構造体を書き込む。
%inst
FONTOBJ_vGetInfo 関数は、関連付けられたフォントの情報を取得する。


%index
FillPath
FillPath 関数は、現在のパス内の開いている図形を閉じ、現在のブラシと多角形塗りつぶしモードでパス内部を塗りつぶす。
%prm
hdc
hdc : [intptr] 有効なパスを含むデバイスコンテキストのハンドル。
%inst
FillPath 関数は、現在のパス内の開いている図形を閉じ、現在のブラシと多角形塗りつぶしモードでパス内部を塗りつぶす。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。

[備考]
内部が塗りつぶされた後、パスは hdc が示す DC から破棄される。


%index
FillRgn
FillRgn 関数は、指定したブラシを使ってリージョンを塗りつぶす。
%prm
hdc, hrgn, hbr
hdc : [intptr] デバイスコンテキストのハンドル。
hrgn : [intptr] 塗りつぶすリージョンのハンドル。リージョンの座標は論理単位と見なされる。
hbr : [intptr] リージョンの塗りつぶしに使用するブラシのハンドル。
%inst
FillRgn 関数は、指定したブラシを使ってリージョンを塗りつぶす。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。


%index
FixBrushOrgEx
(no summary)
%prm
hdc, x, y, ptl
hdc : [intptr] 
x : [int] 
y : [int] 
ptl : [var] 
%inst



%index
FlattenPath
FlattenPath 関数は、現在のデバイスコンテキスト (DC) に選択されているパス内の曲線を変換し、各曲線を線分の列に変える。
%prm
hdc
hdc : [intptr] 有効なパスを含む DC のハンドル。
%inst
FlattenPath 関数は、現在のデバイスコンテキスト (DC) に選択されているパス内の曲線を変換し、各曲線を線分の列に変える。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。


%index
FloodFill
FloodFill 関数は、表示面の領域を現在のブラシで塗りつぶす。領域は color パラメータで指定された色で境界が定められていると見なされる。
%prm
hdc, x, y, color
hdc : [intptr] デバイスコンテキストのハンドル。
x : [int] 塗りつぶしを開始する点の x 座標(論理単位)。
y : [int] 塗りつぶしを開始する点の y 座標(論理単位)。
color : [int] 境界または塗りつぶし領域の色。COLORREF 値を作成するには RGB マクロを使用する。
%inst
FloodFill 関数は、表示面の領域を現在のブラシで塗りつぶす。領域は color
パラメータで指定された色で境界が定められていると見なされる。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。

[備考]
この関数が失敗する理由には次のようなものがある。
（以下省略）


%index
FrameRgn
FrameRgn 関数は、指定したブラシを使って指定リージョンの周囲に境界線を描画する。
%prm
hdc, hrgn, hbr, w, h
hdc : [intptr] デバイスコンテキストのハンドル。
hrgn : [intptr] 境界線で囲むリージョンのハンドル。リージョンの座標は論理単位と見なされる。
hbr : [intptr] 境界線の描画に使用するブラシのハンドル。
w : [int] 垂直ブラシストロークの幅(論理単位)を指定する。
h : [int] 水平ブラシストロークの高さ(論理単位)を指定する。
%inst
FrameRgn 関数は、指定したブラシを使って指定リージョンの周囲に境界線を描画する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。


%index
GdiAlphaBlend
GdiAlphaBlend 関数は、透明または半透明ピクセルを持つビットマップを表示する。
%prm
hdcDest, xoriginDest, yoriginDest, wDest, hDest, hdcSrc, xoriginSrc, yoriginSrc, wSrc, hSrc, ftn
hdcDest : [intptr] デスティネーションデバイスコンテキストのハンドル。
xoriginDest : [int] デスティネーション矩形の左上隅の x 座標(論理単位)。
yoriginDest : [int] デスティネーション矩形の左上隅の y 座標(論理単位)。
wDest : [int] デスティネーション矩形の幅(論理単位)。
hDest : [int] デスティネーション矩形の高さ(論理単位)。
hdcSrc : [intptr] ソースデバイスコンテキストのハンドル。
xoriginSrc : [int] ソース矩形の左上隅の x 座標(論理単位)。
yoriginSrc : [int] ソース矩形の左上隅の y 座標(論理単位)。
wSrc : [int] ソース矩形の幅(論理単位)。
hSrc : [int] ソース矩形の高さ(論理単位)。
ftn : [var] ソースおよびデスティネーションビットマップのアルファブレンド関数、ソースビットマップ全体に適用されるグローバルアルファ値、ソースビットマップのフォーマット情報。ソースとデスティネーションのブレンド関数は現在 AC_SRC_OVER に限定される。BLENDFUNCTION および EMRALPHABLEND 構造体を参照。
%inst
GdiAlphaBlend 関数は、透明または半透明ピクセルを持つビットマップを表示する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。失敗した場合は FALSE を返す。この関数は次の値を返すことがある。
（以下省略)

[備考]
注意 この関数は AlphaBlend
と同じである。ソース矩形とデスティネーション矩形のサイズが異なる場合、ソースビットマップはデスティネーション矩形に合うように伸縮される。SetStretchBltMode
関数が使用された場合、iStretchMode の値はこの関数では自動的に COLORONCOLOR
に変換される(BLACKONWHITE、WHITEONBLACK、HALFTONE は COLORONCOLOR
に変更される)。デスティネーションの座標は、デスティネーションデバイスコンテキストに現在設定されている変換で変換される。ソースの座標は、ソースデバイスコンテキストに現在設定されている変換で変換される。ソースデバイスコンテキストが拡張メタファイルデバイスコンテキストを示している場合、エラーが発生し(関数は
FALSE を返す)。デスティネーションとソースのビットマップのカラーフォーマットが異なる場合、GdiAlphaBlend
はソースビットマップをデスティネーションに合わせて変換する。GdiAlphaBlend
はミラーリングをサポートしない。ソースまたはデスティネーションの幅あるいは高さが負の場合、この呼び出しは失敗する。プリンタへの描画時には、まず
GetDeviceCaps に SHADEBLENDCAPS を指定して呼び出し、プリンタが GdiAlphaBlend
でのブレンドをサポートしているかを確認すること。ディスプレイ DC
ではすべてのブレンド操作がサポートされており、これらのフラグは操作がハードウェアで高速化されているかを示す。ソースとデスティネーションが同じサーフェス(つまり両方とも画面または同じメモリビットマップ)で、かつソース矩形とデスティネーション矩形が重なっている場合、エラーが発生し関数は
FALSE を返す。ソース矩形はソースサーフェス内に完全に収まっていなければならず、そうでなければエラーとなり FALSE
を返す。GdiAlphaBlend はソースまたはデスティネーションの幅または高さが負の場合に失敗する。BLENDFUNCTION の
SourceConstantAlpha
メンバは、ソースビットマップ全体に適用するアルファ透明度値を指定する。SourceConstantAlpha
値はピクセル毎のアルファ値と組み合わされる。SourceConstantAlpha が 0
の場合、画像は透明と見なされる。ピクセル毎のアルファ値のみを使用したい場合は SourceConstantAlpha に 255
(不透明を示す) を指定する。


%index
GdiComment
GdiComment 関数は、バッファから指定された拡張形式メタファイルへコメントをコピーする。
%prm
hdc, nSize, lpData
hdc : [intptr] 拡張メタファイルデバイスコンテキストのハンドル。
nSize : [int] コメントバッファの長さ(バイト単位)。
lpData : [var] コメントを含むバッファへのポインタ。
%inst
GdiComment 関数は、バッファから指定された拡張形式メタファイルへコメントをコピーする。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。

[備考]

コメントには、例えば画像のソースや作成日などの任意のプライベート情報を含めることができる。コメントはアプリケーション署名で始まり、その後にデータを続けるべきである。アプリケーション固有または位置固有のデータを含めてはならない。位置固有のデータはレコードの位置を指定するが、メタファイルは別のメタファイル内に埋め込まれる可能性があるため、含めるべきではない。パブリックコメントは、コメント署名識別子
GDICOMMENT_IDENTIFIER で始まるコメントである。次のパブリックコメントが定義されている。
（以下省略)


%index
GdiDeleteSpoolFileHandle
(no summary)
%prm
SpoolFileHandle
SpoolFileHandle : [intptr] 
%inst



%index
GdiEndDocEMF
(no summary)
%prm
SpoolFileHandle
SpoolFileHandle : [intptr] 
%inst



%index
GdiEndPageEMF
(no summary)
%prm
SpoolFileHandle, dwOptimization
SpoolFileHandle : [intptr] 
dwOptimization : [int] 
%inst



%index
GdiFlush
GdiFlush 関数は、呼び出しスレッドの現在のバッチをフラッシュする。
%prm

%inst
GdiFlush 関数は、呼び出しスレッドの現在のバッチをフラッシュする。

[戻り値]
現在のバッチ内のすべての関数が成功した場合、戻り値は 0 以外である。いずれかの関数が失敗した場合、戻り値は 0 であり、少なくとも 1
つの関数がエラーを返したことを示す。

[備考]
バッチ処理は、ブール値を返す GDI
描画関数の呼び出しに要する時間を最小化することで描画性能を向上させる。システムはこれらの関数呼び出しのパラメータを現在のバッチに蓄積し、次のいずれかによってバッチがフラッシュされたときに実際に関数を呼び出す。
（以下省略)


%index
GdiGetBatchLimit
GdiGetBatchLimit 関数は、呼び出しスレッドの現在のバッチに蓄積できる関数呼び出しの最大数を返す。この上限を超えるとシステムは現在のバッチをフラッシュする。
%prm

%inst
GdiGetBatchLimit
関数は、呼び出しスレッドの現在のバッチに蓄積できる関数呼び出しの最大数を返す。この上限を超えるとシステムは現在のバッチをフラッシュする。

[戻り値]
関数が成功した場合、戻り値はバッチ上限である。失敗した場合は 0 である。

[備考]
バッチ上限は GdiSetBatchLimit 関数で設定する。上限を 1
に設定するとバッチ処理は事実上無効になる。バッチ処理できるのはブール値を返す GDI 描画関数のみで、その他の GDI
関数呼び出しは直ちにバッチをフラッシュする。バッチ上限を超えたり GdiFlush
関数を呼び出したりした場合も現在のバッチはフラッシュされる。システムが関数呼び出しをバッチ化すると、関数は TRUE
を返す。関数の実際の戻り値は GdiFlush でバッチをフラッシュしたときのみ報告される。注意
バッチ上限はスレッドごとに維持される。バッチ処理を完全に無効化するには、各スレッドの初期化時に GdiSetBatchLimit(1)
を呼ぶ必要がある。


%index
GdiGetDC
(no summary)
%prm
SpoolFileHandle
SpoolFileHandle : [intptr] 
%inst



%index
GdiGetDevmodeForPage
(no summary)
%prm
SpoolFileHandle, dwPageNumber, pCurrDM, pLastDM
SpoolFileHandle : [intptr] 
dwPageNumber : [int] 
pCurrDM : [var] 
pLastDM : [var] 
%inst



%index
GdiGetPageCount
(no summary)
%prm
SpoolFileHandle
SpoolFileHandle : [intptr] 
%inst



%index
GdiGetPageHandle
(no summary)
%prm
SpoolFileHandle, Page, pdwPageType
SpoolFileHandle : [intptr] 
Page : [int] 
pdwPageType : [var] 
%inst



%index
GdiGetSpoolFileHandle
(no summary)
%prm
pwszPrinterName, pDevmode, pwszDocName
pwszPrinterName : [wstr] 
pDevmode : [var] 
pwszDocName : [wstr] 
%inst



%index
GdiGradientFill
GdiGradientFill 関数は、矩形および三角形構造を塗りつぶす。
%prm
hdc, pVertex, nVertex, pMesh, nCount, ulMode
hdc : [intptr] デスティネーションデバイスコンテキストのハンドル。
pVertex : [var] 三角形の頂点を定義する TRIVERTEX 構造体の配列へのポインタ。
nVertex : [int] pVertex 内の頂点数。
pMesh : [intptr] 三角形モードでは GRADIENT_TRIANGLE 構造体の配列、矩形モードでは GRADIENT_RECT 構造体の配列。
nCount : [int] pMesh 内の要素(三角形または矩形)の数。
ulMode : [int] 
%inst
GdiGradientFill 関数は、矩形および三角形構造を塗りつぶす。

[戻り値]
関数が成功した場合、戻り値は TRUE である。失敗した場合は FALSE である。

[備考]
注意 この関数は GradientFill と同じである。三角形に滑らかなシェーディングを追加するには、3 つの三角形端点を指定して
GdiGradientFill 関数を呼び出す。GDI
は線形補間して三角形を塗りつぶす。以下はシェーディングされた三角形の描画出力である。
（以下省略)


%index
GdiPlayPageEMF
(no summary)
%prm
SpoolFileHandle, hemf, prectDocument, prectBorder, prectClip
SpoolFileHandle : [intptr] 
hemf : [intptr] 
prectDocument : [var] 
prectBorder : [var] 
prectClip : [var] 
%inst



%index
GdiResetDCEMF
(no summary)
%prm
SpoolFileHandle, pCurrDM
SpoolFileHandle : [intptr] 
pCurrDM : [var] 
%inst



%index
GdiSetBatchLimit
GdiSetBatchLimit 関数は、呼び出しスレッドの現在のバッチに蓄積できる関数呼び出しの最大数を設定する。この上限を超えるとシステムは現在のバッチをフラッシュする。
%prm
dw
dw : [int] 設定するバッチ上限を指定する。0 を指定するとデフォルトの上限が設定される。1 を指定するとバッチ処理が無効になる。
%inst
GdiSetBatchLimit
関数は、呼び出しスレッドの現在のバッチに蓄積できる関数呼び出しの最大数を設定する。この上限を超えるとシステムは現在のバッチをフラッシュする。

[戻り値]
関数が成功した場合、戻り値は以前のバッチ上限である。失敗した場合は 0 である。

[備考]
現在のバッチに蓄積できるのはブール値を返す GDI 描画関数のみで、その他の GDI
関数呼び出しは直ちにバッチをフラッシュする。バッチ上限を超えたり GdiFlush
関数を呼び出したりした場合も現在のバッチはフラッシュされる。システムが関数呼び出しを蓄積すると、バッチ内にあることを示すために関数は
TRUE を返す。システムが現在のバッチをフラッシュして 2 回目にその関数を実行すると、戻り値は関数が成功したかによって TRUE
または FALSE となる。この 2 回目の戻り値は、GdiFlush でバッチをフラッシュしたときのみ報告される。注意
バッチ上限はスレッドごとに維持される。バッチ処理を完全に無効化するには、各スレッドの初期化時に GdiSetBatchLimit(1)
を呼ぶ必要がある。


%index
GdiStartDocEMF
(no summary)
%prm
SpoolFileHandle, pDocInfo
SpoolFileHandle : [intptr] 
pDocInfo : [var] 
%inst



%index
GdiStartPageEMF
(no summary)
%prm
SpoolFileHandle
SpoolFileHandle : [intptr] 
%inst



%index
GdiTransparentBlt
GdiTransparentBlt 関数は、指定されたソースデバイスコンテキストのピクセル矩形に対応するカラーデータのビットブロック転送を、デスティネーションデバイスコンテキストへ行う。
%prm
hdcDest, xoriginDest, yoriginDest, wDest, hDest, hdcSrc, xoriginSrc, yoriginSrc, wSrc, hSrc, crTransparent
hdcDest : [intptr] デスティネーションデバイスコンテキストのハンドル。
xoriginDest : [int] デスティネーション矩形の左上隅の x 座標(論理単位)。
yoriginDest : [int] デスティネーション矩形の左上隅の y 座標(論理単位)。
wDest : [int] デスティネーション矩形の幅(論理単位)。
hDest : [int] デスティネーション矩形の高さ(論理単位)。
hdcSrc : [intptr] ソースデバイスコンテキストのハンドル。
xoriginSrc : [int] ソース矩形の x 座標(論理単位)。
yoriginSrc : [int] ソース矩形の y 座標(論理単位)。
wSrc : [int] ソース矩形の幅(論理単位)。
hSrc : [int] ソース矩形の高さ(論理単位)。
crTransparent : [int] ソースビットマップ内で透明として扱う RGB カラー。
%inst
GdiTransparentBlt
関数は、指定されたソースデバイスコンテキストのピクセル矩形に対応するカラーデータのビットブロック転送を、デスティネーションデバイスコンテキストへ行う。

[戻り値]
関数が成功した場合、戻り値は TRUE である。失敗した場合は FALSE である。

[備考]
GdiTransparentBlt 関数は互換ビットマップ (DDB) で動作する。GdiTransparentBlt
関数はすべてのフォーマットのソースビットマップをサポートする。ただし 32bpp
ビットマップの場合、アルファ値をそのままコピーする。透明度付きの 32 ビット/ピクセルビットマップを指定するには AlphaBlend
を使用すること。ソース矩形とデスティネーション矩形のサイズが異なる場合、ソースビットマップはデスティネーション矩形に合うように伸縮される。SetStretchBltMode
関数を使用する場合、BLACKONWHITE および WHITEONBLACK の iStretchMode は
GdiTransparentBlt 関数では COLORONCOLOR
に変換される。デスティネーションデバイスコンテキストはデスティネーション座標の変換種別を指定し、ソースデバイスコンテキストはソース座標の変換種別を指定する。GdiTransparentBlt
は、ソースまたはデスティネーションの幅あるいは高さが負であってもビットマップをミラーリングしない。マルチモニターシステムで使用する場合、hdcSrc
と hdcDest は同じデバイスを参照している必要があり、そうでないと関数は失敗する。異なるデバイスの DC
間でデータを転送するには、GetDIBits を呼び出してメモリビットマップを DIB に変換する。2 つ目のデバイスに DIB
を表示するには、SetDIBits または StretchDIBits を呼び出す。


%index
GetArcDirection
GetArcDirection 関数は、指定したデバイスコンテキストの現在の弧の方向を取得する。弧および矩形関数は弧の方向を使用する。
%prm
hdc
hdc : [intptr] デバイスコンテキストのハンドル。
%inst
GetArcDirection 関数は、指定したデバイスコンテキストの現在の弧の方向を取得する。弧および矩形関数は弧の方向を使用する。

[戻り値]
戻り値は現在の弧の方向を示し、次のいずれかの値となる。
（以下省略)


%index
GetAspectRatioFilterEx
GetAspectRatioFilterEx 関数は、現在のアスペクト比フィルタの設定を取得する。
%prm
hdc, lpsize
hdc : [intptr] デバイスコンテキストのハンドル。
lpsize : [var] 現在のアスペクト比フィルタを受け取る SIZE 構造体へのポインタ。
%inst
GetAspectRatioFilterEx 関数は、現在のアスペクト比フィルタの設定を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。

[備考]
アスペクト比は、指定デバイス上の 1
ピクセルの幅と高さで形成される比である。システムは特定のデバイス向けにデザインされたフォントを選択するために、アスペクト比フィルタという特別なフィルタを提供する。アプリケーションは
SetMapperFlags 関数を呼び出すことで、指定アスペクト比に一致するフォントのみを取得するようシステムに指示できる。


%index
GetBitmapBits
GetBitmapBits 関数は、指定したデバイス依存 HBITMAP のビットマップビットをバッファへコピーする。
%prm
hbit, cb, lpvBits
hbit : [intptr] デバイス依存ビットマップのハンドル。
cb : [int] ビットマップからバッファへコピーするバイト数。
lpvBits : [intptr] ビットマップビットを受け取るバッファへのポインタ。ビットはバイト値の配列として格納される。
%inst
GetBitmapBits 関数は、指定したデバイス依存 HBITMAP のビットマップビットをバッファへコピーする。

[戻り値]
関数が成功した場合、戻り値はバッファへコピーしたバイト数である。失敗した場合は 0 である。


%index
GetBitmapDimensionEx
GetBitmapDimensionEx 関数は、互換 HBITMAP の寸法を取得する。取得される寸法は SetBitmapDimensionEx 関数で設定されたものでなければならない。
%prm
hbit, lpsize
hbit : [intptr] 互換 HBITMAP (DDB) のハンドル。
lpsize : [var] ビットマップの寸法を受け取る SIZE 構造体へのポインタ。詳細は備考を参照。
%inst
GetBitmapDimensionEx 関数は、互換 HBITMAP の寸法を取得する。取得される寸法は
SetBitmapDimensionEx 関数で設定されたものでなければならない。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。

[備考]
この関数は、ビットマップの高さと幅(0.01 mm
単位)のフィールドを含むデータ構造を返す。これらの寸法がまだ設定されていない場合、返される構造体のそれらのフィールドは 0 となる。


%index
GetBkColor
GetBkColor 関数は、指定したデバイスコンテキストの現在の背景色を返す。
%prm
hdc
hdc : [intptr] 背景色を取得するデバイスコンテキストのハンドル。
%inst
GetBkColor 関数は、指定したデバイスコンテキストの現在の背景色を返す。

[戻り値]
関数が成功した場合、戻り値は現在の背景色の COLORREF 値である。失敗した場合は CLR_INVALID を返す。


%index
GetBkMode
GetBkMode 関数は、指定したデバイスコンテキストの現在の背景混合モードを返す。デバイスコンテキストの背景混合モードは、テキスト、ハッチブラシ、実線以外のペンスタイルに影響する。
%prm
hdc
hdc : [intptr] 背景モードを取得するデバイスコンテキストのハンドル。
%inst
GetBkMode
関数は、指定したデバイスコンテキストの現在の背景混合モードを返す。デバイスコンテキストの背景混合モードは、テキスト、ハッチブラシ、実線以外のペンスタイルに影響する。

[戻り値]
関数が成功した場合、戻り値は現在の背景混合モード(OPAQUE または TRANSPARENT)である。失敗した場合は 0 である。


%index
GetBoundsRect
GetBoundsRect 関数は、指定したデバイスコンテキストについて現在蓄積されている境界矩形を取得する。
%prm
hdc, lprect, flags
hdc : [intptr] 境界矩形を取得する対象のデバイスコンテキストのハンドル。
lprect : [var] 現在の境界矩形を受け取る RECT 構造体へのポインタ。アプリケーションの矩形は論理座標で返され、境界矩形は画面座標で返される。
flags : [int] GetBoundsRect 関数の動作を指定する。このパラメータは次の値を取り得る。
%inst
GetBoundsRect 関数は、指定したデバイスコンテキストについて現在蓄積されている境界矩形を取得する。

[戻り値]
戻り値は蓄積された境界矩形の状態を示し、次のいずれかの値となる。
（以下省略)

[備考]
DCB_SET 値は DCB_ACCUMULATE と DCB_RESET
のビット値の組み合わせである。境界矩形が空かどうかを判定するために DCB_RESET
ビットを確認するアプリケーションは、DCB_ACCUMULATE ビットも確認しなければならない。境界矩形が空なのは、DCB_RESET
ビットが 1 かつ DCB_ACCUMULATE ビットが 0 の場合のみである。


%index
GetBrushOrgEx
GetBrushOrgEx 関数は、指定したデバイスコンテキストの現在のブラシ原点を取得する。この関数は GetBrushOrg 関数を置き換えるものである。
%prm
hdc, lppt
hdc : [intptr] デバイスコンテキストのハンドル。
lppt : [var] ブラシの原点(デバイス座標)を受け取る POINT 構造体へのポインタ。
%inst
GetBrushOrgEx 関数は、指定したデバイスコンテキストの現在のブラシ原点を取得する。この関数は GetBrushOrg
関数を置き換えるものである。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。

[備考]
ブラシは、塗りつぶし図形の内部を描画するためにシステムが使用するビットマップである。ブラシの原点は、ビットマップ内の 1
ピクセルの位置を指定する 0 から 7 の座標である。デフォルトのブラシ原点座標は (0,0) である。水平座標の場合、0
は最も左のピクセル列、7 は最も右のピクセル列に対応する。垂直座標の場合、0 は最上行、7
は最下行に対応する。任意の描画操作の開始時にシステムがブラシを配置する際、ブラシ原点で指定された位置がウィンドウのクライアント領域上のブラシ原点
(0,0) にマップされる。例えば原点が (2,3) に設定されていれば、システムはブラシの原点 (0,0)
をウィンドウのクライアント領域上の (2,3)
にマップする。親ウィンドウと子ウィンドウの背景を一致する色のブラシで塗りつぶすアプリケーションでは、親ウィンドウを描画した後、子ウィンドウを描画する前にブラシ原点を設定する必要があるかもしれない。システムはウィンドウ管理されるすべてのデバイスコンテキストのブラシ原点を自動的に追跡し、サーフェス上でパターンの整合を保つよう必要に応じてブラシを調整する。


%index
GetCharABCWidthsW
GetCharABCWidths 関数は、現在の TrueType フォントから指定範囲の連続する文字の幅(論理単位)を取得する。この関数は TrueType フォントでのみ成功する。(Unicode)
%prm
hdc, wFirst, wLast, lpABC
hdc : [intptr] デバイスコンテキストのハンドル。
wFirst : [int] 現在のフォントから連続する文字群の最初の文字。
wLast : [int] 現在のフォントから連続する文字群の最後の文字。
lpABC : [var] 文字幅(論理単位)を受け取る ABC 構造体の配列へのポインタ。この配列は、uFirstChar および uLastChar パラメータで指定された範囲の文字数以上の ABC 構造体を含んでいなければならない。
%inst
GetCharABCWidths 関数は、現在の TrueType
フォントから指定範囲の連続する文字の幅(論理単位)を取得する。この関数は TrueType フォントでのみ成功する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。

[備考]
TrueType ラスタライザは、特定のポイントサイズが選択された後に ABC 文字間隔を提供する。A
スペースはグリフを配置する前に現在位置に加える距離である。B スペースはグリフの黒い部分の幅である。C
スペースはグリフの右側に空白を設けるために現在位置に加える距離である。総前進幅は A+B+C
で指定される。GetCharABCWidths 関数が文字に対して負の A または C
幅を返す場合、その文字はアンダーハングまたはオーバーハングを含んでいる。ABC
幅をフォントデザイン単位に変換するには、OUTLINETEXTMETRIC 構造体の otmEMSquare
メンバに格納されている値を使用すべきである。この値は GetOutlineTextMetrics
関数で取得できる。現在選択されているフォントの範囲外の文字にはデフォルト文字の ABC 幅が使用される。非 TrueType
フォントの文字幅を取得するには GetCharWidth 関数を使用すべきである。
> [!NOTE] > wingdi.h ヘッダは GetCharABCWidths をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の有無に応じてこの関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立なエイリアスと非中立コードを混在させると、コンパイルまたは実行時エラーの原因となる不整合を引き起こすことがある。詳細は
[関数プロトタイプの規則](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetCharABCWidthsFloatW
GetCharABCWidthsFloat 関数は、現在のフォントから指定範囲の連続する文字の幅(論理単位)を取得する。(Unicode)
%prm
hdc, iFirst, iLast, lpABC
hdc : [intptr] デバイスコンテキストのハンドル。
iFirst : [int] ABC 幅を取得する連続文字群の最初の文字のコードポイントを指定する。
iLast : [int] ABC 幅を取得する連続文字群の最後の文字のコードポイントを指定する。この範囲は両端を含む。最後の文字が最初の文字より前にある場合はエラーが返される。
lpABC : [var] 文字幅(論理単位)を受け取る ABCFLOAT 構造体の配列へのポインタ。
%inst
GetCharABCWidthsFloat 関数は、現在のフォントから指定範囲の連続する文字の幅(論理単位)を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。

[備考]
TrueType フォントに対してのみ幅を返す GetCharABCWidths 関数と異なり、GetCharABCWidthsFloat
関数は任意のフォントの幅を取得する。返される幅は IEEE
浮動小数点形式である。現在のワールドからデバイスへの変換が恒等でない場合、返される幅はデバイス空間で整数でも非整数値となり得る。A
スペースはグリフを配置する前に現在位置に加える距離である。B スペースはグリフの黒い部分の幅である。C
スペースはグリフの右側に空白を設けるために現在位置に加える距離である。総前進幅は A+B+C で指定される。ABC
スペースは選択されたフォントの文字ベースラインに沿って測定される。現在選択されているフォントの範囲外の文字にはデフォルト文字の ABC
幅が使用される。
> [!NOTE] > wingdi.h ヘッダは GetCharABCWidthsFloat
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の有無に応じてこの関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立なエイリアスと非中立コードを混在させると、コンパイルまたは実行時エラーの原因となる不整合を引き起こすことがある。詳細は
[関数プロトタイプの規則](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetCharABCWidthsI
GetCharABCWidthsI 関数は、現在の TrueType フォントから指定範囲の連続するグリフインデックスの幅(論理単位)を取得する。この関数は TrueType フォントでのみ成功する。
%prm
hdc, giFirst, cgi, pgi, pabc
hdc : [intptr] デバイスコンテキストのハンドル。
giFirst : [int] 現在のフォントから連続するグリフインデックス群の最初のグリフインデックス。このパラメータは pgi パラメータが NULL の場合にのみ使用される。
cgi : [int] グリフインデックスの数。
pgi : [var] グリフインデックスを含む配列へのポインタ。このパラメータが NULL の場合、代わりに giFirst パラメータが使用される。cgi パラメータはこの配列内のグリフインデックス数を指定する。
pabc : [var] 文字幅(論理単位)を受け取る ABC 構造体の配列へのポインタ。この配列は、cgi パラメータで指定したグリフインデックス数以上の ABC 構造体を含んでいなければならない。
%inst
GetCharABCWidthsI 関数は、現在の TrueType
フォントから指定範囲の連続するグリフインデックスの幅(論理単位)を取得する。この関数は TrueType フォントでのみ成功する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。

[備考]
TrueType ラスタライザは、特定のポイントサイズが選択された後に ABC 文字間隔を提供する。A
スペースはグリフを配置する前に現在位置に加える距離である。B スペースはグリフの黒い部分の幅である。C
スペースはグリフの右側に空白を設けるために現在位置に加える距離である。総前進幅は A+B+C
で指定される。GetCharABCWidthsI 関数が文字に対して負の A または C
幅を返す場合、その文字はアンダーハングまたはオーバーハングを含んでいる。ABC
幅をフォントデザイン単位に変換するには、OUTLINETEXTMETRIC 構造体の otmEMSquare
メンバに格納されている値を使用すべきである。この値は GetOutlineTextMetrics
関数で取得できる。現在選択されているフォントの範囲外の文字にはデフォルト文字の ABC 幅が使用される。非 TrueType
フォントのグリフインデックスの幅を取得するには GetCharWidthI 関数を使用すべきである。


%index
GetCharWidthW
GetCharWidth 関数は、現在のフォントから指定範囲の連続する文字の幅(論理座標)を取得する。(Unicode)
%prm
hdc, iFirst, iLast, lpBuffer
hdc : [intptr] デバイスコンテキストのハンドル。
iFirst : [int] 連続する文字群の最初の文字。
iLast : [int] 連続する文字群の最後の文字。指定した最初の文字より前であってはならない。
lpBuffer : [var] 文字幅(論理座標)を受け取るバッファへのポインタ。
%inst
GetCharWidth 関数は、現在のフォントから指定範囲の連続する文字の幅(論理座標)を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。

[備考]
GetCharWidth は TrueType フォントに対しては使用できない。TrueType フォントの文字幅を取得するには
GetCharABCWidths を使用する。範囲は両端を含み、返される幅には iFirstChar および iLastChar
パラメータで指定した文字自身の幅も含まれる。現在のフォントに存在しない文字にはデフォルト文字の幅が割り当てられる。
> [!NOTE] > wingdi.h ヘッダは GetCharWidth をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の有無に応じてこの関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立なエイリアスと非中立コードを混在させると、コンパイルまたは実行時エラーの原因となる不整合を引き起こすことがある。詳細は
[関数プロトタイプの規則](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetCharWidth32A
GetCharWidth32 関数は、現在のフォントから指定範囲の連続する文字の幅(論理座標)を取得する。(ANSI)
%prm
hdc, iFirst, iLast, lpBuffer
hdc : [intptr] デバイスコンテキストのハンドル。
iFirst : [int] 連続する文字群の最初の文字。
iLast : [int] 連続する文字群の最後の文字。指定した最初の文字より前であってはならない。
lpBuffer : [var] 文字幅(論理座標)を受け取るバッファへのポインタ。
%inst
GetCharWidth32 関数は、現在のフォントから指定範囲の連続する文字の幅(論理座標)を取得する。(ANSI)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。

[備考]
GetCharWidth32 は TrueType フォントに対しては使用できない。TrueType フォントの文字幅を取得するには
GetCharABCWidths を使用する。範囲は両端を含み、返される幅には iFirstChar および iLastChar
パラメータで指定した文字自身の幅も含まれる。現在のフォントに存在しない文字にはデフォルト文字の幅が割り当てられる。


%index
GetCharWidth32W
GetCharWidth32 関数は、現在のフォントから指定範囲の連続する文字の幅(論理座標)を取得する。(Unicode)
%prm
hdc, iFirst, iLast, lpBuffer
hdc : [intptr] デバイスコンテキストのハンドル。
iFirst : [int] 連続する文字群の最初の文字。
iLast : [int] 連続する文字群の最後の文字。指定した最初の文字より前であってはならない。
lpBuffer : [var] 文字幅(論理座標)を受け取るバッファへのポインタ。
%inst
GetCharWidth32 関数は、現在のフォントから指定範囲の連続する文字の幅(論理座標)を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。

[備考]
GetCharWidth32 は TrueType フォントに対しては使用できない。TrueType フォントの文字幅を取得するには
GetCharABCWidths を使用する。範囲は両端を含み、返される幅には iFirstChar および iLastChar
パラメータで指定した文字自身の幅も含まれる。現在のフォントに存在しない文字にはデフォルト文字の幅が割り当てられる。


%index
GetCharWidthFloatW
GetCharWidthFloat 関数は、現在のフォントから指定範囲の連続する文字の小数幅を取得する。(Unicode)
%prm
hdc, iFirst, iLast, lpBuffer
hdc : [intptr] デバイスコンテキストのハンドル。
iFirst : [int] 連続する文字群の最初の文字のコードポイント。
iLast : [int] 連続する文字群の最後の文字のコードポイント。
lpBuffer : [var] 文字幅(論理単位)を受け取るバッファへのポインタ。
%inst
GetCharWidthFloat 関数は、現在のフォントから指定範囲の連続する文字の小数幅を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。

[備考]
返される幅は 32 ビット IEEE 浮動小数点形式である(幅は文字のベースラインに沿って測定される)。iFirstChar に文字
a、iLastChar に文字 z を指定すると、GetCharWidthFloat
はすべての小文字の幅を取得する。現在のフォントに存在しない文字にはデフォルト文字の幅が割り当てられる。
> [!NOTE] > wingdi.h ヘッダは GetCharWidthFloat をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の有無に応じてこの関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立なエイリアスと非中立コードを混在させると、コンパイルまたは実行時エラーの原因となる不整合を引き起こすことがある。詳細は
[関数プロトタイプの規則](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetCharWidthI
GetCharWidthI 関数は、現在のフォントから指定範囲の連続するグリフインデックスの幅(論理座標)を取得する。
%prm
hdc, giFirst, cgi, pgi, piWidths
hdc : [intptr] デバイスコンテキストのハンドル。
giFirst : [int] 連続するグリフインデックス群の最初のグリフインデックス。
cgi : [int] グリフインデックスの数。
pgi : [var] グリフインデックスの配列へのポインタ。このパラメータが NULL でない場合、giFirst パラメータの代わりに使用される。
piWidths : [var] 幅(論理座標)を受け取るバッファへのポインタ。
%inst
GetCharWidthI 関数は、現在のフォントから指定範囲の連続するグリフインデックスの幅(論理座標)を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。

[備考]
GetCharWidthI 関数は、pgi パラメータが NULL の場合、giFirst で指定された先頭グリフインデックスから cgi
で指定された個数の連続するグリフインデックスを処理する。そうでない場合は pgi が指すグリフインデックス配列を cgi
で指定された個数だけ処理する。現在のフォントに存在しない文字にはデフォルト文字の幅が割り当てられる。


%index
GetCharacterPlacementW
GetCharacterPlacement 関数は、文字列に関する情報(文字幅、キャレット位置決め、文字列内の順序、グリフ描画など)を取得する。(Unicode)
%prm
hdc, lpString, nCount, nMexExtent, lpResults, dwFlags
hdc : [intptr] デバイスコンテキストのハンドル。
lpString : [wstr] 処理対象の文字列へのポインタ。nCount で長さが指定されるため、NULL 終端である必要はない。
nCount : [int] lpString が指す文字列の長さ。
nMexExtent : [int] 文字列を処理する最大長(論理単位)。処理するとこの長さを超える文字は無視される。必要な順序付けやグリフ配列の計算は、含まれる文字にのみ適用される。このパラメータは dwFlags に GCP_MAXEXTENT 値が指定された場合にのみ使用される。関数が入力文字列を処理する際、合計長がまだ最大を超えていない場合にのみ、各文字とその長さが出力、長さ、その他の配列に追加される。上限に達すると処理が停止する。
lpResults : [var] 関数の結果を受け取る GCP_RESULTS 構造体へのポインタ。
dwFlags : [int] 
%inst
GetCharacterPlacement
関数は、文字列に関する情報(文字幅、キャレット位置決め、文字列内の順序、グリフ描画など)を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は文字列の幅と高さ(論理単位)である。幅は下位ワード、高さは上位ワードである。失敗した場合は 0 を返す。

[備考]
GetCharacterPlacement
は、国際設定や利用可能なフォントの種類に関係なくアプリケーションがテキストを正しく処理できるようにする。アプリケーションはこの関数を
ExtTextOut 関数の前に、また GetTextExtentPoint32 関数の代わりに(場合により GetCharWidth32
や GetCharABCWidths 関数の代わりに)使用する。GetCharacterPlacement
を使って文字間隔やインデックス配列を取得する必要があるのは、通常は揃えやカーニングが必要な場合のみである。非ラテン系フォントでは、アプリケーションは
ExtTextOut を呼ぶ前に GetCharacterPlacement
を使って文字間隔やインデックス配列を取得することで、ExtTextOut
のテキスト描画速度を向上できる。これは、同じテキストを繰り返し描画する場合や、キャレット位置決めに文字間隔を使う場合に特に有効である。ExtTextOut
の呼び出しで lpGlyphs 出力配列を使用する場合、ETO_GLYPH_INDEX
フラグを設定する必要がある。GetCharacterPlacement は GCP_RESULTS 構造体の
lpOrder、lpDX、lpCaretPos、lpOutString、lpGlyphs メンバを確認し、これらのメンバが NULL
でなければ対応する配列を埋める。配列を埋められない場合、対応するメンバを NULL
に設定する。有効な情報の取得を保証するため、アプリケーションは関数呼び出し前にメンバを有効なアドレスに設定し、呼び出し後にメンバの値を確認する責任を負う。GCP_JUSTIFY
または GCP_USEKERNING 値が指定された場合、lpDX あるいは lpCaretPos
メンバは有効なアドレスを持たなければならない。GCP_RESULTS.lpGlyphs
で返されるグリフインデックスはデバイスコンテキスト内の現在のフォントに固有であり、そのフォントが選択されている間にそのデバイスコンテキストでテキストを描画する目的でのみ使用すべきである点に注意。揃えを計算する際、文字列の末尾文字がスペースの場合、関数は計算前に文字列の長さを縮めてスペースを除去する。配列がスペースのみで構成されている場合、関数はエラーを返す。
ExtTextOut は DBCS 文字列のバイトごとに lpDx エントリを期待するが、GetCharacterPlacement
はグリフごとに lpDX エントリを割り当てる。この組み合わせで使うときの不整合を修正するには、GetGlyphIndices
を使用するか、DBCS バイトペアの 2 バイト目に対応する幅 0 のエントリを lpDX
配列に追加する。論理幅が入力文字列の先頭文字の幅より小さい場合、GCP_RESULTS.nMaxFit
に不正な値が返される。このような場合には、まず GetCharacterPlacement でグリフインデックスと lpDX
配列を取得し、次に各文字の前進幅を使って lpDX 配列で長さ計算を行う。nMaxFit
は先頭文字の幅より前進幅の合計が小さい文字数である。
> [!NOTE] > wingdi.h ヘッダは GetCharacterPlacement
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の有無に応じてこの関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立なエイリアスと非中立コードを混在させると、コンパイルまたは実行時エラーの原因となる不整合を引き起こすことがある。詳細は
[関数プロトタイプの規則](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetClipBox
GetClipBox 関数は、デバイス上の現在の可視領域を囲む最小の境界矩形の寸法を取得する。
%prm
hdc, lprect
hdc : [intptr] デバイスコンテキストのハンドル。
lprect : [var] 矩形の寸法(論理単位)を受け取る RECT 構造体へのポインタ。
%inst
GetClipBox 関数は、デバイス上の現在の可視領域を囲む最小の境界矩形の寸法を取得する。

[戻り値]
関数が成功した場合、戻り値はクリッピングボックスの複雑度を表し、次のいずれかの値となる。
（以下省略)


%index
GetClipRgn
GetClipRgn 関数は、指定したデバイスコンテキストの現在のアプリケーション定義クリッピングリージョンを識別するハンドルを取得する。
%prm
hdc, hrgn
hdc : [intptr] デバイスコンテキストのハンドル。
hrgn : [intptr] 関数呼び出し前は既存のリージョンのハンドル。関数から戻ると、このパラメータは現在のクリッピングリージョンのコピーのハンドルとなる。
%inst
GetClipRgn 関数は、指定したデバイスコンテキストの現在のアプリケーション定義クリッピングリージョンを識別するハンドルを取得する。

[戻り値]
関数が成功し、指定デバイスコンテキストにクリッピングリージョンが存在しない場合、戻り値は 0
である。関数が成功し、クリッピングリージョンが存在する場合、戻り値は 1 である。エラーが発生した場合、戻り値は -1 である。

[備考]
アプリケーション定義のクリッピングリージョンとは、SelectClipRgn
関数で指定されたクリッピングリージョンのことである。アプリケーションが BeginPaint
関数を呼び出したときに作成されるクリッピングリージョンではない。関数が成功した場合、hrgn
は現在のクリッピングリージョンのコピーのハンドルとなる。このコピーに対するその後の変更は、現在のクリッピングリージョンには影響しない。


%index
GetColorAdjustment
GetColorAdjustment 関数は、指定したデバイスコンテキスト (DC) の色調整値を取得する。
%prm
hdc, lpca
hdc : [intptr] デバイスコンテキストのハンドル。
lpca : [var] 色調整値を受け取る COLORADJUSTMENT 構造体へのポインタ。
%inst
GetColorAdjustment 関数は、指定したデバイスコンテキスト (DC) の色調整値を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。


%index
GetColorSpace
GetColorSpace 関数は、指定したデバイスコンテキストから入力カラースペースのハンドルを取得する。
%prm
hdc
hdc : [intptr] 入力カラースペースハンドルを取得する対象のデバイスコンテキストを指定する。
%inst
GetColorSpace 関数は、指定したデバイスコンテキストから入力カラースペースのハンドルを取得する。

[戻り値]
関数が成功した場合、戻り値は現在の入力カラースペースのハンドルである。失敗した場合は NULL を返す。

[備考]
GetColorSpace は、デバイスコンテキストのカラーマネジメントが有効かどうかに関わらず、入力カラースペースのハンドルを取得する。


%index
GetCurrentObject
GetCurrentObject 関数は、指定したデバイスコンテキスト (DC) に選択されている指定種類のオブジェクトのハンドルを取得する。
%prm
hdc, type
hdc : [intptr] DC のハンドル。
type : [int] 
%inst
GetCurrentObject 関数は、指定したデバイスコンテキスト (DC)
に選択されている指定種類のオブジェクトのハンドルを取得する。

[戻り値]
関数が成功した場合、戻り値は指定オブジェクトのハンドルである。失敗した場合は NULL を返す。

[備考]
アプリケーションは GetCurrentObject および GetObject 関数を使って、指定した DC
に現在選択されているグラフィックオブジェクトの記述を取得できる。


%index
GetCurrentPositionEx
GetCurrentPositionEx 関数は、現在位置を論理座標で取得する。
%prm
hdc, lppt
hdc : [intptr] デバイスコンテキストのハンドル。
lppt : [var] 現在位置の論理座標を受け取る POINT 構造体へのポインタ。
%inst
GetCurrentPositionEx 関数は、現在位置を論理座標で取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。


%index
GetDCBrushColor
GetDCBrushColor 関数は、指定したデバイスコンテキスト (DC) の現在のブラシ色を取得する。
%prm
hdc
hdc : [intptr] ブラシ色を取得する対象の DC のハンドル。
%inst
GetDCBrushColor 関数は、指定したデバイスコンテキスト (DC) の現在のブラシ色を取得する。

[戻り値]
関数が成功した場合、戻り値は現在の DC ブラシ色を表す COLORREF 値である。失敗した場合は CLR_INVALID を返す。

[備考]
ブラシ色の設定については SetDCBrushColor を参照。ICM: ICM が有効な場合はカラーマネジメントが行われる。


%index
GetDCOrgEx
GetDCOrgEx 関数は、指定したデバイスコンテキスト (DC) の最終変換原点を取得する。
%prm
hdc, lppt
hdc : [intptr] 最終変換原点を取得する対象の DC のハンドル。
lppt : [var] 最終変換原点(デバイス座標)を受け取る POINT 構造体へのポインタ。
%inst
GetDCOrgEx 関数は、指定したデバイスコンテキスト (DC) の最終変換原点を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。

[備考]
最終変換原点は画面の物理原点からの相対位置である。


%index
GetDCPenColor
GetDCPenColor 関数は、指定したデバイスコンテキスト (DC) の現在のペン色を取得する。
%prm
hdc
hdc : [intptr] ペン色を取得する対象の DC のハンドル。
%inst
GetDCPenColor 関数は、指定したデバイスコンテキスト (DC) の現在のペン色を取得する。

[戻り値]
関数が成功した場合、戻り値は現在の DC ペン色を表す COLORREF 値である。失敗した場合は CLR_INVALID を返す。

[備考]
ペン色の設定については SetDCPenColor を参照。ICM: ICM が有効な場合はカラーマネジメントが行われる。


%index
GetDIBColorTable
GetDIBColorTable 関数は、指定したデバイスコンテキストに現在選択されている DIB セクションビットマップのカラーテーブルの指定範囲のエントリから RGB (赤、緑、青) カラー値を取得する。
%prm
hdc, iStart, cEntries, prgbq
hdc : [intptr] デバイスコンテキストのハンドル。DIB セクションビットマップがこのデバイスコンテキストに選択されていなければならない。
iStart : [int] 取得する最初のカラーテーブルエントリを指定する、0 から始まるカラーテーブルインデックス。
cEntries : [int] 取得するカラーテーブルエントリ数。
prgbq : [var] DIB カラーテーブルのカラー情報を含む RGBQUAD データ構造の配列を受け取るバッファへのポインタ。バッファは cEntries の値と同じ数の RGBQUAD 構造体を格納できる十分な大きさでなければならない。
%inst
GetDIBColorTable 関数は、指定したデバイスコンテキストに現在選択されている DIB
セクションビットマップのカラーテーブルの指定範囲のエントリから RGB (赤、緑、青) カラー値を取得する。

[戻り値]
関数が成功した場合、戻り値は取得したカラーテーブルエントリ数である。失敗した場合は 0 である。

[備考]
GetDIBColorTable 関数は、1、4、または 8 bpp を使用する DIB
セクションビットマップのカラーテーブルを取得するために呼び出すべきである。ビットマップに関連付けられた BITMAPINFOHEADER
構造体の biBitCount メンバは 1 ピクセル当たりのビット数を指定する。biBitCount 値が 8 より大きい DIB
セクションビットマップにはカラーテーブルは存在しないが、関連付けられたカラーマスクが存在する。これらのカラーマスクを取得するには
GetObject 関数を呼び出す。


%index
GetDIBits
指定された互換ビットマップのビットを取得し、指定された形式の DIB としてバッファにコピーする。
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
GetDeviceCaps
GetDeviceCaps 関数は、指定したデバイスに固有の情報を取得する。
%prm
hdc, index
hdc : [intptr] DC のハンドル。
index : [int] 
%inst
GetDeviceCaps 関数は、指定したデバイスに固有の情報を取得する。

[戻り値]
戻り値は要求された項目の値を表す。nIndex が BITSPIXEL で、デバイスが 15bpp または 16bpp の場合、戻り値は
16 である。

[備考]
nIndex が SHADEBLENDCAPS の場合:
（以下省略)


%index
GetDeviceGammaRamp
GetDeviceGammaRamp 関数は、ハードウェアでダウンロード可能なガンマランプをサポートするドライバを持つダイレクトカラーディスプレイボードのガンマランプを取得する。
%prm
hdc, lpRamp
hdc : [intptr] 対象のダイレクトカラーディスプレイボードのデバイスコンテキストを指定する。
lpRamp : [intptr] 関数がカラーディスプレイボードの現在のガンマランプを格納するバッファを指す。ガンマランプは、それぞれ 256 個の WORD 要素を持つ 3 つの配列で指定され、フレームバッファ内の RGB 値とデジタルアナログコンバータ (DAC) 値のマッピングを保持する。配列の順序は赤、緑、青である。
%inst
GetDeviceGammaRamp
関数は、ハードウェアでダウンロード可能なガンマランプをサポートするドライバを持つダイレクトカラーディスプレイボードのガンマランプを取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。失敗した場合は FALSE である。

[備考]
ダイレクトカラー表示モードはカラールックアップテーブルを使用せず、通常は 16、24、または 32
ビットである。すべてのダイレクトカラービデオボードがロード可能なガンマランプをサポートするわけではない。GetDeviceGammaRamp
は、ハードウェアでのダウンロード可能なガンマランプをサポートするドライバを持つデバイスに対してのみ成功する。


%index
GetEnhMetaFileW
GetEnhMetaFile 関数は、指定ファイルに格納された拡張形式メタファイルを識別するハンドルを作成する。(Unicode)
%prm
lpName
lpName : [wstr] 拡張メタファイルの名前を指定する NULL 終端文字列へのポインタ。
%inst
GetEnhMetaFile 関数は、指定ファイルに格納された拡張形式メタファイルを識別するハンドルを作成する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は拡張メタファイルのハンドルである。失敗した場合は NULL である。

[備考]
アプリケーションが拡張メタファイルハンドルを不要になったら、DeleteEnhMetaFile
関数を呼び出してハンドルを削除する必要がある。GetEnhMetaFile 関数で処理するには、Windows
形式メタファイルを拡張形式に変換しておかなければならない。ファイルを変換するには SetWinMetaFileBits
関数を使用する。テキスト引数に Unicode 文字を使う必要がある場合はワイド文字版として、Windows
文字セットを使う必要がある場合は ANSI 版として使用する。


%index
GetEnhMetaFileBits
GetEnhMetaFileBits 関数は、指定した拡張形式メタファイルの内容を取得してバッファへコピーする。
%prm
hEMF, nSize, lpData
hEMF : [intptr] 拡張メタファイルのハンドル。
nSize : [int] データを受け取るバッファのサイズ(バイト単位)。
lpData : [var] メタファイルデータを受け取るバッファへのポインタ。バッファはデータを格納するのに十分な大きさでなければならない。lpbBuffer が NULL の場合、関数はデータを保持するのに必要なサイズを返す。
%inst
GetEnhMetaFileBits 関数は、指定した拡張形式メタファイルの内容を取得してバッファへコピーする。

[戻り値]
関数が成功し、バッファポインタが NULL
の場合、戻り値は拡張メタファイルのサイズ(バイト単位)である。関数が成功しバッファポインタが有効なポインタの場合、戻り値はバッファへコピーされたバイト数である。失敗した場合は
0 である。

[備考]
拡張メタファイルのビットが取得された後、SetEnhMetaFileBits
関数を呼び出してメモリベースのメタファイルを作成するために使用できる。GetEnhMetaFileBits
関数は拡張メタファイルハンドルを無効にしない。アプリケーションは不要になったハンドルを DeleteEnhMetaFile
関数で削除しなければならない。この関数で取得したメタファイルの内容は拡張形式である。Windows 形式でメタファイルの内容を取得するには
GetWinMetaFileBits 関数を使用する。


%index
GetEnhMetaFileDescriptionW
GetEnhMetaFileDescription 関数は、拡張形式メタファイルから任意のテキスト記述を取得し、指定バッファへコピーする。(Unicode)
%prm
hemf, cchBuffer, lpDescription
hemf : [intptr] 拡張メタファイルのハンドル。
cchBuffer : [int] データを受け取るバッファのサイズ(文字単位)。この文字数までがコピーされる。
lpDescription : [wstr] 任意のテキスト記述を受け取るバッファへのポインタ。
%inst
GetEnhMetaFileDescription
関数は、拡張形式メタファイルから任意のテキスト記述を取得し、指定バッファへコピーする。(Unicode)

[戻り値]
任意のテキスト記述が存在しバッファポインタが NULL
の場合、戻り値はテキスト文字列の長さ(文字単位)である。存在しバッファポインタが有効な場合、戻り値はバッファへコピーされた文字数である。テキスト記述が存在しない場合、戻り値は
0 である。関数が失敗した場合、戻り値は GDI_ERROR である。

[備考]
任意のテキスト記述は 2 つの文字列で構成される。1 つ目は拡張メタファイルを作成したアプリケーションを示し、2
つ目はメタファイルに含まれる画像を示す。文字列は NULL 文字で区切られ、2 つの NULL 文字で終端される。例:"XYZ
Graphics Editor\0Bald Eagle\0\0"(\0 は NULL 文字を表す)。テキスト引数に Unicode
文字を使う必要がある場合はワイド文字版として、Windows 文字セットを使う必要がある場合は ANSI 版として使用する。
> [!NOTE] > wingdi.h ヘッダは GetEnhMetaFileDescription
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の有無に応じてこの関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立なエイリアスと非中立コードを混在させると、コンパイルまたは実行時エラーの原因となる不整合を引き起こすことがある。詳細は
[関数プロトタイプの規則](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetEnhMetaFileHeader
GetEnhMetaFileHeader 関数は、指定した拡張形式メタファイルのヘッダを含むレコードを取得する。
%prm
hemf, nSize, lpEnhMetaHeader
hemf : [intptr] ヘッダを取得する対象の拡張メタファイルのハンドル。
nSize : [int] データを受け取るバッファのサイズ(バイト単位)。この分だけコピーされる。
lpEnhMetaHeader : [var] ヘッダレコードを受け取る ENHMETAHEADER 構造体へのポインタ。このパラメータが NULL の場合、関数はヘッダレコードのサイズを返す。
%inst
GetEnhMetaFileHeader 関数は、指定した拡張形式メタファイルのヘッダを含むレコードを取得する。

[戻り値]
関数が成功し構造体ポインタが NULL
の場合、戻り値はヘッダを含むレコードのサイズである。構造体ポインタが有効な場合、戻り値はコピーされたバイト数である。それ以外の場合は 0
である。

[備考]

拡張メタファイルヘッダには、メタファイルのサイズ(バイト単位)、メタファイルに格納された画像の寸法、格納レコード数、任意のテキスト記述へのオフセット、任意のパレットのサイズ、画像を作成したデバイスの解像度などの情報が含まれる。拡張メタファイルヘッダを含むレコードは常にメタファイル内の最初のレコードである。


%index
GetEnhMetaFilePaletteEntries
GetEnhMetaFilePaletteEntries 関数は、指定拡張メタファイルから任意のパレットエントリを取得する。
%prm
hemf, nNumEntries, lpPaletteEntries
hemf : [intptr] 拡張メタファイルのハンドル。
nNumEntries : [int] 任意のパレットから取得するエントリ数。
lpPaletteEntries : [var] パレットカラーを受け取る PALETTEENTRY 構造体の配列へのポインタ。配列は cEntries パラメータで指定されたエントリ数以上の構造体を含んでいなければならない。
%inst
GetEnhMetaFilePaletteEntries 関数は、指定拡張メタファイルから任意のパレットエントリを取得する。

[戻り値]
配列ポインタが NULL
で拡張メタファイルに任意のパレットが含まれている場合、戻り値はメタファイルのパレット内のエントリ数である。配列ポインタが有効で任意のパレットが含まれている場合、戻り値はコピーされたエントリ数である。メタファイルに任意のパレットが含まれていない場合、戻り値は
0 である。それ以外の場合は GDI_ERROR である。

[備考]
アプリケーションは、画像を作成してメタファイルに保存する前に CreatePalette および SetPaletteEntries
関数を呼び出すことで、拡張メタファイルに任意のパレットを格納できる。これにより、画像がさまざまなデバイスで表示されるときに一貫した色を得ることができる。拡張メタファイルに格納された画像を表示するアプリケーションは、GetEnhMetaFilePaletteEntries
関数を呼び出して任意のパレットの存在を確認できる。存在する場合、アプリケーションは再度この関数を呼び出してパレットエントリを取得し、CreatePalette
を使って論理パレットを作成し、SelectPalette でデバイスコンテキストに選択し、RealizePalette
で実体化する。論理パレットが実体化された後、PlayEnhMetaFile 関数を呼び出すと元の色で画像が表示される。


%index
GetEnhMetaFilePixelFormat
GetEnhMetaFilePixelFormat 関数は、拡張メタファイルのピクセルフォーマット情報を取得する。
%prm
hemf, cbBuffer, ppfd
hemf : [intptr] 拡張メタファイルを識別する。
cbBuffer : [int] ピクセルフォーマット情報をコピーするバッファのサイズ(バイト単位)を指定する。
ppfd : [var] 論理ピクセルフォーマット仕様を含む PIXELFORMATDESCRIPTOR 構造体へのポインタ。メタファイルはこの構造体を使って論理ピクセルフォーマット仕様を記録する。
%inst
GetEnhMetaFilePixelFormat 関数は、拡張メタファイルのピクセルフォーマット情報を取得する。

[戻り値]

関数が成功しピクセルフォーマットが見つかった場合、戻り値はメタファイルのピクセルフォーマットのサイズである。ピクセルフォーマットがない場合は
0 である。エラーが発生して関数が失敗した場合は GDI_ERROR である。拡張エラー情報を取得するには GetLastError
を呼ぶ。

[備考]
拡張メタファイルが ENHMETAHEADER
構造体にピクセルフォーマットを指定しており、そのピクセルフォーマットがバッファに収まる場合、ピクセルフォーマット情報が ppfd
にコピーされる。cbBuffer
がメタファイルのピクセルフォーマットを格納するには小さすぎる場合、バッファにはコピーされない。いずれの場合も関数はメタファイルのピクセルフォーマットのサイズを返す。メタファイル記録やその他の操作については「拡張メタファイル操作」を参照。


%index
GetFontData
GetFontData 関数は、TrueType フォントのフォントメトリックデータを取得する。
%prm
hdc, dwTable, dwOffset, pvBuffer, cjBuffer
hdc : [intptr] デバイスコンテキストのハンドル。
dwTable : [int] フォントデータを取得する対象のフォントメトリックテーブルの名前。このパラメータは Microsoft 社の TrueType フォントファイル仕様に記載されたメトリックテーブルのいずれかを指定できる。このパラメータが 0 の場合、TrueType フォントファイルではファイルの先頭から、TrueType コレクションファイルでは現在選択されているフォントのデータの先頭から情報を取得する。TrueType コレクションファイルのファイル先頭からデータを取得するには 'ttcf' (0x66637474) を指定する。
dwOffset : [int] 情報取得を開始する位置の、フォントメトリックテーブル先頭からのオフセット。このパラメータが 0 の場合、dwTable で指定されたテーブルの先頭から情報を取得する。この値がテーブルのサイズ以上の場合、エラーとなる。
pvBuffer : [intptr] フォント情報を受け取るバッファへのポインタ。このパラメータが NULL の場合、関数はフォントデータに必要なバッファサイズを返す。
cjBuffer : [int] 取得する情報の長さ(バイト単位)。このパラメータが 0 の場合、GetFontData は dwTable で指定されたデータのサイズを返す。
%inst
GetFontData 関数は、TrueType フォントのフォントメトリックデータを取得する。

[戻り値]
関数が成功した場合、戻り値は返されたバイト数である。失敗した場合は GDI_ERROR を返す。

[備考]
この関数は、フォント操作アプリケーションがフォントファイルから直接 TrueType
フォント情報を取得するために使われる。フォント埋め込みについては Font Embedding Reference
を参照。アプリケーションは GetFontData 関数を使って TrueType
フォントをドキュメントと一緒に保存することがある。そのためにアプリケーションは OUTLINETEXTMETRIC 構造体の
otmfsType メンバを確認し、フォントが埋め込み可能かを判断する。otmfsType のビット 1
が立っている場合、フォントは埋め込みを許可しない。ビット 1 がクリアなら埋め込み可能である。ビット 2
が立っている場合、埋め込みは読み取り専用となる。埋め込みが許可されている場合、アプリケーションは
dwTable、dwOffset、cbData に 0 を指定してフォントファイル全体を取得できる。非 TrueType
フォントに対してこの関数で情報取得を試みると、エラーが発生する。


%index
GetFontLanguageInfo
GetFontLanguageInfo 関数は、指定ディスプレイコンテキストで現在選択されているフォントに関する情報を返す。アプリケーションは通常、この情報と GetCharacterPlacement 関数を使って表示用の文字列を準備する。
%prm
hdc
hdc : [intptr] ディスプレイデバイスコンテキストのハンドル。
%inst
GetFontLanguageInfo
関数は、指定ディスプレイコンテキストで現在選択されているフォントに関する情報を返す。アプリケーションは通常、この情報と
GetCharacterPlacement 関数を使って表示用の文字列を準備する。

[戻り値]
戻り値は現在選択されているフォントの特性を表す。フォントが「正規化」されていて単純なラテン語フォントとして扱える場合は 0
を返し、エラーが発生した場合は GCP_ERROR を返す。それ以外の場合は次の値の組み合わせを返す。
（以下省略)


%index
GetFontUnicodeRanges
GetFontUnicodeRanges 関数は、フォントでサポートされている Unicode 文字に関する情報を返す。情報は GLYPHSET 構造体として返される。
%prm
hdc, lpgs
hdc : [intptr] デバイスコンテキストのハンドル。
lpgs : [var] グリフセット情報を受け取る GLYPHSET 構造体へのポインタ。このパラメータが NULL の場合、関数は情報を格納するのに必要な GLYPHSET 構造体のサイズを返す。
%inst
GetFontUnicodeRanges 関数は、フォントでサポートされている Unicode 文字に関する情報を返す。情報は
GLYPHSET 構造体として返される。

[戻り値]
関数が成功した場合、GLYPHSET 構造体に書き込まれたバイト数を返す。lpgs が NULL の場合は必要な GLYPHSET
構造体のサイズを返す。失敗した場合は 0 を返す。拡張エラー情報は利用できない。


%index
GetGlyphIndicesW
GetGlyphIndices 関数は、文字列をグリフインデックスの配列に変換する。この関数はフォント内にグリフが存在するかどうかを判定するためにも使用できる。(Unicode)
%prm
hdc, lpstr, c, pgi, fl
hdc : [intptr] デバイスコンテキストのハンドル。
lpstr : [wstr] 変換する文字列へのポインタ。
c : [int] lpstr が指す文字列の長さと、pgi が指すバッファのサイズ(WORD 単位)の両方。
pgi : [var] このバッファは次元 c でなければならない。正常に戻ると、文字列内の文字に対応するグリフインデックスの配列を含む。
fl : [int] サポートされていないグリフをどう扱うかを指定する。このパラメータには次の値を指定できる。
%inst
GetGlyphIndices
関数は、文字列をグリフインデックスの配列に変換する。この関数はフォント内にグリフが存在するかどうかを判定するためにも使用できる。(Unicode)

[戻り値]
関数が成功した場合、変換したバイト数(ANSI 版)または WORD 数(Unicode 版)を返す。失敗した場合は GDI_ERROR
を返す。

[備考]
この関数は lpstr
が指す文字列内の各文字に対する単一グリフ表現を特定しようとする。これはフォントファイル操作などの低レベル用途で有用だが、文字列をグリフにマップしたい高水準アプリケーションでは通常
Uniscribe 関数を使用する。
> [!NOTE] > wingdi.h ヘッダは GetGlyphIndices をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の有無に応じてこの関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立なエイリアスと非中立コードを混在させると、コンパイルまたは実行時エラーの原因となる不整合を引き起こすことがある。詳細は
[関数プロトタイプの規則](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetGlyphOutlineW
GetGlyphOutline 関数は、指定デバイスコンテキストに選択されている TrueType フォント内の文字のアウトラインまたはビットマップを取得する。(Unicode)
%prm
hdc, uChar, fuFormat, lpgm, cjBuffer, pvBuffer, lpmat2
hdc : [intptr] デバイスコンテキストのハンドル。
uChar : [int] データを取得する対象の文字。
fuFormat : [int] 
lpgm : [var] 文字セル内のグリフ配置を記述する GLYPHMETRICS 構造体へのポインタ。
cjBuffer : [int] アウトライン文字情報をコピーするバッファ (*lpvBuffer) のサイズ(バイト単位)。この値が 0 の場合、関数は必要なバッファサイズを返す。
pvBuffer : [intptr] アウトライン文字情報を受け取るバッファへのポインタ。この値が NULL の場合、関数は必要なバッファサイズを返す。
lpmat2 : [var] 文字の変換行列を指定する MAT2 構造体へのポインタ。
%inst
GetGlyphOutline 関数は、指定デバイスコンテキストに選択されている TrueType
フォント内の文字のアウトラインまたはビットマップを取得する。(Unicode)

[戻り値]
GGO_BITMAP、GGO_GRAY2_BITMAP、GGO_GRAY4_BITMAP、GGO_GRAY8_BITMAP、または
GGO_NATIVE が指定され、関数が成功した場合、戻り値は 0 より大きい。そうでない場合は GDI_ERROR
を返す。これらのフラグのいずれかが指定されバッファサイズまたはアドレスが 0
の場合、戻り値は必要なバッファサイズ(バイト単位)である。GGO_METRICS が指定され関数が失敗した場合、戻り値は
GDI_ERROR である。

[備考]
GetGlyphOutline
関数が返すグリフアウトラインはグリッドフィットされたグリフ(ビットマップ画像が元のグリフデザインにできるだけ近づくよう修正されたグリフ)に対するものである。アプリケーションが未修正のグリフアウトラインを必要とする場合、フォントの
em ユニットと同じサイズのフォント内の文字に対してグリフアウトラインを要求できる。フォントの em ユニット値は
OUTLINETEXTMETRIC 構造体の otmEMSquare メンバに格納される。GGO_BITMAP 指定時に
GetGlyphOutline が返すグリフビットマップは、DWORD
境界に整列され行指向のモノクロビットマップである。GGO_GRAY2_BITMAP 指定時は値の範囲 0 ～ 4
のバイト配列、GGO_GRAY4_BITMAP 指定時は値の範囲 0 ～ 16、GGO_GRAY8_BITMAP 指定時は値の範囲 0 ～
64 である。GGO_NATIVE 指定時に GetGlyphOutline
が返すネイティブバッファはグリフアウトラインである。グリフアウトラインは、TTPOLYGONHEADER 構造体とそれに続く 1
つ以上の曲線によって定義される輪郭の連続として返される。輪郭内の各曲線は TTPOLYCURVE 構造体と、それに続く POINTFX
データポイントによって定義される。POINTFX 点は相対移動ではなく絶対位置である。輪郭の始点は TTPOLYGONHEADER
構造体の pfxStart メンバで与えられる。各曲線の始点は前の曲線の最後の点または輪郭の始点である。曲線のデータポイント数は
TTPOLYCURVE 構造体の cpfx メンバに格納される。バッファ内の各輪郭のサイズ(バイト単位)は TTPOLYGONHEADER
構造体の cb
メンバに格納される。追加の曲線定義は先行する曲線に続いてバッファに詰め込まれ、追加の輪郭も先行する輪郭に続いて詰め込まれる。バッファにはバッファに収まるだけの輪郭が格納される。GLYPHMETRICS
構造体は文字セルの幅とグリフの文字セル内の位置を指定する。文字セルの原点はフォントのベースライン上のセル左側にある。グリフ原点の位置は文字セル原点を基準とした相対位置である。文字セルの高さ、ベースライン、その他フォント全体に共通のメトリックは
OUTLINETEXTMETRIC 構造体に含まれる。アプリケーションは lpMatrix パラメータに 2x2
変換行列を指定することで、ビットマップまたはネイティブ形式で取得される文字を変形できる。例えば、行列乗算によりせん断、回転、スケーリング、またはそれらの組み合わせを適用できる。グリフアウトラインに関する追加情報は
TrueType および OpenType 技術仕様に記載されている。
> [!NOTE] > wingdi.h ヘッダは GetGlyphOutline をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の有無に応じてこの関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立なエイリアスと非中立コードを混在させると、コンパイルまたは実行時エラーの原因となる不整合を引き起こすことがある。詳細は
[関数プロトタイプの規則](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetGraphicsMode
GetGraphicsMode 関数は、指定したデバイスコンテキストの現在のグラフィックモードを取得する。
%prm
hdc
hdc : [intptr] デバイスコンテキストのハンドル。
%inst
GetGraphicsMode 関数は、指定したデバイスコンテキストの現在のグラフィックモードを取得する。

[戻り値]
関数が成功した場合、戻り値は現在のグラフィックモードである。次のいずれかの値となる。
（以下省略)

[備考]
アプリケーションは SetGraphicsMode 関数を呼び出すことで、デバイスコンテキストのグラフィックモードを設定できる。


%index
GetICMProfileW
GetICMProfile 関数は、指定したデバイスコンテキストの現在の出力カラープロファイルのファイル名を取得する。(Unicode)
%prm
hdc, pBufSize, pszFilename
hdc : [intptr] カラープロファイルを取得する対象のデバイスコンテキストを指定する。
pBufSize : [var] lpszFilename が指すバッファのサイズを含む DWORD へのポインタ。この関数の ANSI 版ではサイズはバイト単位、Unicode 版では WCHAR 単位である。関数が成功すると、戻り時にこのパラメータは実際に使用されたバッファサイズを含む。ただしバッファが十分でない場合、この関数は FALSE を返す。この場合 GetLastError() は ERROR_INSUFFICIENT_BUFFER を返し、このパラメータが指す DWORD には lpszFilename バッファに必要なサイズが格納される。
pszFilename : [wstr] プロファイルのパス名を受け取るバッファを指す。
%inst
GetICMProfile 関数は、指定したデバイスコンテキストの現在の出力カラープロファイルのファイル名を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は TRUE である。lpszFilename が NULL で、必要なバッファサイズが lpcbName
にコピーされた場合も TRUE を返す。関数が失敗した場合は FALSE を返す。

[備考]
GetICMProfile
は、デバイスコンテキストのカラーマネジメントが有効かどうかに関わらず、現在の出力プロファイルのファイル名を取得する。デバイスコンテキストを与えると、GetICMProfile
は lpszFilename
パラメータを通じて、現在デバイスコンテキストで使用されているカラープロファイルを含むファイルのパス名を出力する。また lpcbName
パラメータを通じてパス名を含む文字列の長さを出力する。GetICMProfile が返すプロファイル名は EnumICMProfiles
が返すプロファイル一覧に含まれない可能性がある。EnumICMProfiles 関数は、デバイスコンテキスト (DC)
に関連付けられ、かつ DC の設定に一致するすべてのカラースペースプロファイルを返す。SetICMProfile
関数で現在のプロファイルを設定した場合、DC 設定に一致しないプロファイルが関連付けられることがある。例えば、SetICMProfile
関数でデバイス非依存の sRGB プロファイルを DC に関連付けることができる。このプロファイルはその DC の現在の WCS
プロファイルとして使用され、GetICMProfile 呼び出しではそのファイル名が返される。ただし、EnumICMProfiles
が返すプロファイル一覧には現れない。SetICMProfile
の呼び出し前にこの関数を呼び出すと、デバイスコンテキストのデフォルトプロファイルを取得するために使用できる。Windows
95/98/Me: GetICMProfileW は Microsoft Layer for Unicode
でサポートされる。使用するには、Windows 95/98/Me 向け Microsoft Layer for Unicode
の説明に従って、特定のファイルをアプリケーションに追加する必要がある。
> [!NOTE] > wingdi.h ヘッダは GetICMProfile をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の有無に応じてこの関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立なエイリアスと非中立コードを混在させると、コンパイルまたは実行時エラーの原因となる不整合を引き起こすことがある。詳細は
[関数プロトタイプの規則](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetKerningPairsW
GetKerningPairs 関数は、指定したデバイスコンテキストの現在選択されているフォントの文字カーニングペアを取得する。(Unicode)
%prm
hdc, nPairs, lpKernPair
hdc : [intptr] デバイスコンテキストのハンドル。
nPairs : [int] lpkrnpair 配列内のペア数。フォントが nNumPairs より多くのカーニングペアを持つ場合、関数はエラーを返す。
lpKernPair : [var] カーニングペアを受け取る KERNINGPAIR 構造体の配列へのポインタ。配列は nNumPairs パラメータで指定された数以上の構造体を含んでいなければならない。このパラメータが NULL の場合、関数はフォントのカーニングペアの総数を返す。
%inst
GetKerningPairs
関数は、指定したデバイスコンテキストの現在選択されているフォントの文字カーニングペアを取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は返されたカーニングペアの数である。失敗した場合は 0 である。

[備考]
> [!NOTE] > wingdi.h ヘッダは GetKerningPairs をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の有無に応じてこの関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立なエイリアスと非中立コードを混在させると、コンパイルまたは実行時エラーの原因となる不整合を引き起こすことがある。詳細は
[関数プロトタイプの規則](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetLayout
GetLayout 関数は、デバイスコンテキスト (DC) のレイアウトを返す。
%prm
hdc
hdc : [intptr] デバイスコンテキストのハンドル。
%inst
GetLayout 関数は、デバイスコンテキスト (DC) のレイアウトを返す。

[戻り値]
関数が成功した場合、現在のデバイスコンテキストのレイアウトフラグを返す。失敗した場合は GDI_ERROR
を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。

[備考]

レイアウトは、ウィンドウまたはデバイスコンテキスト内でテキストやグラフィックが現れる順序を指定する。既定は左から右である。GetLayout
関数は、既定が SetLayout
の呼び出しで変更されているかを返す。詳細はウィンドウ機能の「ウィンドウレイアウトとミラーリング」を参照。


%index
GetLogColorSpaceW
GetLogColorSpace 関数は、指定したハンドルで識別されるカラースペース定義を取得する。(Unicode)
%prm
hColorSpace, lpBuffer, nSize
hColorSpace : [intptr] カラースペースのハンドルを指定する。
lpBuffer : [var] LOGCOLORSPACE 構造体を受け取るバッファを指す。
nSize : [int] バッファの最大サイズを指定する。
%inst
GetLogColorSpace 関数は、指定したハンドルで識別されるカラースペース定義を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は TRUE である。失敗した場合は FALSE である。

[備考]
Windows 95/98/Me: GetLogColorSpaceW は Microsoft Layer for Unicode
でサポートされる。使用するには、Windows 95/98/Me 向け Microsoft Layer for Unicode
の説明に従って、特定のファイルをアプリケーションに追加する必要がある。
> [!NOTE] > wingdi.h ヘッダは GetLogColorSpace をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の有無に応じてこの関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立なエイリアスと非中立コードを混在させると、コンパイルまたは実行時エラーの原因となる不整合を引き起こすことがある。詳細は
[関数プロトタイプの規則](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetMapMode
GetMapMode 関数は、現在のマッピングモードを取得する。
%prm
hdc
hdc : [intptr] デバイスコンテキストのハンドル。
%inst
GetMapMode 関数は、現在のマッピングモードを取得する。

[戻り値]
関数が成功した場合、戻り値はマッピングモードを表す。失敗した場合は 0 である。

[備考]
以下は各種マッピングモードである。
（以下省略)


%index
GetMetaFileW
GetMetaFile 関数は、指定ファイルに格納されたメタファイルを識別するハンドルを作成する。(Unicode)
%prm
lpName
lpName : [wstr] メタファイルの名前を指定する NULL 終端文字列へのポインタ。
%inst
GetMetaFile 関数は、指定ファイルに格納されたメタファイルを識別するハンドルを作成する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はメタファイルのハンドルである。失敗した場合は NULL を返す。

[備考]
この関数は Win32 API では実装されていない。16 ビット版 Windows との互換性のために提供されている。Win32
アプリケーションでは GetEnhMetaFile 関数を使用する。
> [!NOTE] > wingdi.h ヘッダは GetMetaFile をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の有無に応じてこの関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立なエイリアスと非中立コードを混在させると、コンパイルまたは実行時エラーの原因となる不整合を引き起こすことがある。詳細は
[関数プロトタイプの規則](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetMetaFileBitsEx
GetMetaFileBitsEx 関数は、Windows 形式メタファイルの内容を取得して指定バッファへコピーする。
%prm
hMF, cbBuffer, lpData
hMF : [intptr] Windows 形式メタファイルのハンドル。
cbBuffer : [int] データを受け取るバッファのサイズ(バイト単位)。
lpData : [intptr] メタファイルデータを受け取るバッファへのポインタ。バッファはデータを格納するのに十分な大きさでなければならない。lpvData が NULL の場合、関数はデータを保持するのに必要なバイト数を返す。
%inst
GetMetaFileBitsEx 関数は、Windows 形式メタファイルの内容を取得して指定バッファへコピーする。

[戻り値]
関数が成功しバッファポインタが NULL
の場合、戻り値はバッファに必要なバイト数である。関数が成功しバッファポインタが有効なポインタの場合、戻り値はコピーされたバイト数である。失敗した場合は
0 である。

[備考]
Windows メタファイルのビットが取得された後、SetMetaFileBitsEx
関数を呼び出してメモリベースのメタファイルを作成するために使用できる。GetMetaFileBitsEx
関数はメタファイルハンドルを無効にしない。アプリケーションは DeleteMetaFile
関数を呼び出してこのハンドルを削除しなければならない。Windows
形式メタファイルを拡張形式メタファイルに変換するには、SetWinMetaFileBits 関数を使用する。


%index
GetMetaRgn
GetMetaRgn 関数は、指定したデバイスコンテキストの現在のメタリージョンを取得する。
%prm
hdc, hrgn
hdc : [intptr] デバイスコンテキストのハンドル。
hrgn : [intptr] 関数呼び出し前は既存のリージョンのハンドル。関数から戻ると、このパラメータは現在のメタリージョンのコピーのハンドルとなる。
%inst
GetMetaRgn 関数は、指定したデバイスコンテキストの現在のメタリージョンを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。

[備考]
関数が成功した場合、hrgn
は現在のメタリージョンのコピーのハンドルである。このコピーに対するその後の変更は、現在のメタリージョンには影響しない。デバイスコンテキストの現在のクリッピングリージョンは、そのクリッピングリージョンとメタリージョンの交差で定義される。


%index
GetMiterLimit
GetMiterLimit 関数は、指定したデバイスコンテキストのマイターリミットを取得する。
%prm
hdc, plimit
hdc : [intptr] デバイスコンテキストのハンドル。
plimit : [var] 現在のマイターリミットを受け取る浮動小数点値へのポインタ。
%inst
GetMiterLimit 関数は、指定したデバイスコンテキストのマイターリミットを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。

[備考]
マイターリミットは、マイター結合を持つジオメトリック線を描画するときに使用される。


%index
GetNearestColor
GetNearestColor 関数は、指定したカラー値が使われたときに表示される、システムパレット内の色を識別するカラー値を取得する。
%prm
hdc, color
hdc : [intptr] デバイスコンテキストのハンドル。
color : [int] 要求する色を識別するカラー値。COLORREF カラー値を作成するには RGB マクロを使用する。
%inst
GetNearestColor 関数は、指定したカラー値が使われたときに表示される、システムパレット内の色を識別するカラー値を取得する。

[戻り値]
関数が成功した場合、戻り値は指定カラー値が使われたときに表示される、システムパレット内の色を示すカラー値である。失敗した場合は
CLR_INVALID を返す。


%index
GetNearestPaletteIndex
GetNearestPaletteIndex 関数は、指定した論理パレット内で、指定カラー値に最も近いエントリのインデックスを取得する。
%prm
h, color
h : [intptr] 論理パレットのハンドル。
color : [int] 一致させる色。COLORREF カラー値を作成するには RGB マクロを使用する。
%inst
GetNearestPaletteIndex 関数は、指定した論理パレット内で、指定カラー値に最も近いエントリのインデックスを取得する。

[戻り値]
関数が成功した場合、戻り値は論理パレット内のエントリのインデックスである。失敗した場合は CLR_INVALID を返す。

[備考]
アプリケーションは GetDeviceCaps 関数を呼び出し RASTERCAPS
定数を指定することで、デバイスがパレット操作をサポートしているかを判定できる。指定した論理パレットに PC_EXPLICIT
フラグが立ったエントリが含まれる場合、戻り値は未定義である。


%index
GetObjectW
GetObjectW (Unicode) 関数 (wingdi.h) は、指定グラフィックオブジェクトに関する情報を取得する。
%prm
h, c, pv
h : [intptr] 
c : [int] 
pv : [intptr] 
%inst
GetObjectW (Unicode) 関数 (wingdi.h) は、指定グラフィックオブジェクトに関する情報を取得する。

[戻り値]
関数が成功し lpvObject が有効なポインタの場合、戻り値はバッファに格納されたバイト数である。関数が成功し lpvObject が
NULL の場合、戻り値はバッファに格納するのに必要なバイト数である。失敗した場合は 0 である。

[備考]
lpvObject
が指すバッファは、グラフィックオブジェクトの情報を受け取るのに十分な大きさでなければならない。グラフィックオブジェクトによっては、関数は
BITMAP、DIBSECTION、EXTLOGPEN、LOGBRUSH、LOGFONT、LOGPEN
構造体、または論理パレットのテーブルエントリ数を使用する。hgdiobj が CreateDIBSection の呼び出しで作成された
HBITMAP のハンドルで、指定バッファが十分な大きさを持つ場合、GetObject 関数は DIBSECTION 構造体を返す。さらに
DIBSECTION 内の BITMAP 構造体の bmBits メンバには、ビットマップのビット値へのポインタが含まれる。hgdiobj
がその他の方法で作成された HBITMAP のハンドルの場合、GetObject
はビットマップの幅、高さ、カラーフォーマットの情報のみを返す。ビットマップのビット値を取得するには GetDIBits または
GetBitmapBits 関数を呼び出す。hgdiobj が論理パレットのハンドルの場合、GetObject
はパレット内のエントリ数を示す 2 バイト整数を取得する。パレットを定義する LOGPALETTE
構造体は取得しない。パレットエントリに関する情報を取得するには GetPaletteEntries 関数を呼び出す。hgdiobj が
HFONT のハンドルの場合、返される LOGFONT はフォント作成に使われた LOGFONT である。Windows が正確な
LOGFONT を表現できず補間を行った場合、その補間は LOGFONT
に反映されない。例えば、縦書き描画をサポートしないフォントの縦書き版を要求すると、LOGFONT
ではフォントが縦書きであると示されるが、Windows は横書きで描画する。


%index
GetObjectType
GetObjectType は、指定オブジェクトの種類を取得する。
%prm
h
h : [intptr] グラフィックオブジェクトのハンドル。
%inst
GetObjectType は、指定オブジェクトの種類を取得する。

[戻り値]
関数が成功した場合、戻り値はオブジェクトを識別する。次のいずれかの値となる。
（以下省略)


%index
GetOutlineTextMetricsW
GetOutlineTextMetrics 関数は、TrueType フォントのテキストメトリックを取得する。(Unicode)
%prm
hdc, cjCopy, potm
hdc : [intptr] デバイスコンテキストのハンドル。
cjCopy : [int] テキストメトリックを受け取る配列のサイズ(バイト単位)。
potm : [var] OUTLINETEXTMETRIC 構造体へのポインタ。このパラメータが NULL の場合、関数は取得するメトリックデータに必要なバッファサイズを返す。
%inst
GetOutlineTextMetrics 関数は、TrueType フォントのテキストメトリックを取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外の値または必要なバッファサイズである。失敗した場合は 0 である。

[備考]
OUTLINETEXTMETRIC 構造体は、TrueType
フォント向けに提供されるほとんどのテキストメトリック情報(TEXTMETRIC 構造体を含む)を含む。OUTLINETEXTMETRIC
で返されるサイズは論理単位であり、現在のマッピングモードに依存する。
> [!NOTE] > wingdi.h ヘッダは GetOutlineTextMetrics
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の有無に応じてこの関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立なエイリアスと非中立コードを混在させると、コンパイルまたは実行時エラーの原因となる不整合を引き起こすことがある。詳細は
[関数プロトタイプの規則](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetPaletteEntries
GetPaletteEntries 関数は、指定した論理パレットから指定範囲のパレットエントリを取得する。
%prm
hpal, iStart, cEntries, pPalEntries
hpal : [intptr] 論理パレットのハンドル。
iStart : [int] 取得する論理パレットの最初のエントリ。
cEntries : [int] 取得する論理パレットのエントリ数。
pPalEntries : [var] パレットエントリを受け取る PALETTEENTRY 構造体の配列へのポインタ。配列は nEntries パラメータで指定された数以上の構造体を含んでいなければならない。
%inst
GetPaletteEntries 関数は、指定した論理パレットから指定範囲のパレットエントリを取得する。

[戻り値]
関数が成功し論理パレットのハンドルが有効なポインタ(NULL
でない)の場合、戻り値は論理パレットから取得されたエントリ数である。関数が成功し論理パレットのハンドルが NULL
の場合、戻り値は指定パレット内のエントリ数である。失敗した場合は 0 である。

[備考]
アプリケーションは GetDeviceCaps 関数を呼び出し RASTERCAPS
定数を指定することで、デバイスがパレット操作をサポートしているかを判定できる。nEntries
パラメータがパレット内に存在するエントリ数より多くのエントリを指定した場合、PALETTEENTRY 構造体の残りのメンバは変更されない。


%index
GetPath
GetPath 関数は、指定したデバイスコンテキストに選択されているパス内の線の端点および曲線の制御点を定義する座標を取得する。
%prm
hdc, apt, aj, cpt
hdc : [intptr] 閉じたパスを含むデバイスコンテキストのハンドル。
apt : [var] 線の端点と曲線の制御点(論理座標)を受け取る POINT 構造体の配列へのポインタ。
aj : [var] 
cpt : [int] lpPoints が指す配列に格納できる POINT 構造体の総数。この値は lpTypes が指す配列に配置できるバイト数と同じでなければならない。
%inst
GetPath 関数は、指定したデバイスコンテキストに選択されているパス内の線の端点および曲線の制御点を定義する座標を取得する。

[戻り値]
nSize パラメータが 0 以外の場合、戻り値は列挙された点の数である。nSize が 0
の場合、戻り値はパス内の点の総数である(このとき GetPath はバッファに何も書き込まない)。nSize が 0
以外でパス内の点数未満の場合、戻り値は 1 である。

[備考]
hdc
パラメータで識別されるデバイスコンテキストは閉じたパスを含んでいなければならない。パスの点は論理座標で返される。パス内の点はデバイス座標で格納されているので、GetPath
は現在の変換の逆変換を用いてデバイス座標から論理座標へ変換する。パス内のすべての曲線を線分に変換するには、GetPath を呼び出す前に
FlattenPath 関数を呼び出すとよい。


%index
GetPixel
指定された座標のピクセルの RGB カラー値を取得する。
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
GetPixelFormat
GetPixelFormat 関数は、指定したデバイスコンテキストの現在選択されているピクセルフォーマットのインデックスを取得する。
%prm
hdc
hdc : [intptr] 関数が返す現在選択されているピクセルフォーマットインデックスのデバイスコンテキストを指定する。
%inst
GetPixelFormat 関数は、指定したデバイスコンテキストの現在選択されているピクセルフォーマットのインデックスを取得する。

[戻り値]
関数が成功した場合、戻り値は指定デバイスコンテキストの現在選択されているピクセルフォーマットインデックスである。これは 1
から始まる正のインデックス値である。失敗した場合は 0 を返す。拡張エラー情報を取得するには GetLastError を呼ぶ。


%index
GetPolyFillMode
GetPolyFillMode 関数は、現在の多角形塗りつぶしモードを取得する。
%prm
hdc
hdc : [intptr] デバイスコンテキストのハンドル。
%inst
GetPolyFillMode 関数は、現在の多角形塗りつぶしモードを取得する。

[戻り値]
関数が成功した場合、戻り値は多角形塗りつぶしモードを指定し、次のいずれかの値となる。
（以下省略)


%index
GetROP2
GetROP2 関数は、指定したデバイスコンテキストの前景混合モードを取得する。混合モードは、ペンまたは内部色と画面上の既存の色を組み合わせて新しい色を作る方法を指定する。
%prm
hdc
hdc : [intptr] デバイスコンテキストのハンドル。
%inst
GetROP2
関数は、指定したデバイスコンテキストの前景混合モードを取得する。混合モードは、ペンまたは内部色と画面上の既存の色を組み合わせて新しい色を作る方法を指定する。

[戻り値]
関数が成功した場合、戻り値は前景混合モードを指定する。失敗した場合は 0 である。

[備考]
以下は前景混合モードである。
（以下省略)


%index
GetRandomRgn
GetRandomRgn 関数は、指定したデバイスコンテキストのシステムクリッピングリージョンを特定のリージョンへコピーする。
%prm
hdc, hrgn, i
hdc : [intptr] デバイスコンテキストのハンドル。
hrgn : [intptr] リージョンのハンドル。関数呼び出し前は既存のリージョンを示す。関数から戻ると、現在のシステムリージョンのコピーを示す。hrgn が以前指していたリージョンは上書きされる。
i : [int] このパラメータは SYSRGN でなければならない。
%inst
GetRandomRgn 関数は、指定したデバイスコンテキストのシステムクリッピングリージョンを特定のリージョンへコピーする。

[戻り値]
関数が成功した場合、戻り値は 1 である。失敗した場合は -1 である。取得対象のリージョンが NULL の場合、戻り値は 0
である。関数が失敗するか取得対象のリージョンが NULL の場合、hrgn は初期化されない。

[備考]
SYSRGN フラグを使用する際、ウィンドウの移動によりシステムクリッピングリージョンが最新でない場合がある点に注意。それでも
WM_PAINT 処理中の BeginPaint と EndPaint
ブロック内でシステムクリッピングリージョンを取得して使用するのは安全である。この場合、システムリージョンは更新リージョンとウィンドウの現在の可視領域の交差である。GetRandomRgn
の戻りから EndPaint までの間にウィンドウが移動すると、新たな WM_PAINT メッセージが発行される。これ以外の用途で
SYSRGN フラグを使用するとアプリケーションで描画エラーが発生する可能性がある。返されるリージョンは画面座標である。


%index
GetRasterizerCaps
GetRasterizerCaps 関数は、システムに TrueType フォントがインストールされているかを示すフラグを返す。
%prm
lpraststat, cjBytes
lpraststat : [var] ラスタライザに関する情報を受け取る RASTERIZER_STATUS 構造体へのポインタ。
cjBytes : [int] lprs パラメータが指す構造体へコピーするバイト数。
%inst
GetRasterizerCaps 関数は、システムに TrueType フォントがインストールされているかを示すフラグを返す。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。

[備考]
GetRasterizerCaps 関数により、アプリケーションやプリンタドライバは TrueType
フォントがインストールされているかを判定できる。RASTERIZER_STATUS 構造体の wFlags メンバに
TT_AVAILABLE フラグが立っている場合、少なくとも 1 つの TrueType
フォントがインストールされている。TT_ENABLED フラグが立っている場合、システムで TrueType
が有効である。実際にコピーされるバイト数は、cb パラメータで指定された値または RASTERIZER_STATUS
構造体の長さのうち小さい方である。


%index
GetRegionData
GetRegionData 関数は、リージョンを記述するデータで指定バッファを満たす。このデータにはリージョンを構成する矩形の寸法も含まれる。
%prm
hrgn, nCount, lpRgnData
hrgn : [intptr] リージョンのハンドル。
nCount : [int] lpRgnData バッファのサイズ(バイト単位)。
lpRgnData : [var] 情報を受け取る RGNDATA 構造体へのポインタ。リージョンの寸法は論理単位である。このパラメータが NULL の場合、戻り値はリージョンデータに必要なバイト数を含む。
%inst
GetRegionData
関数は、リージョンを記述するデータで指定バッファを満たす。このデータにはリージョンを構成する矩形の寸法も含まれる。

[戻り値]
関数が成功し dwCount が十分なバイト数を指定している場合、戻り値は常に dwCount である。dwCount
が小さすぎるか関数が失敗した場合、戻り値は 0 である。lpRgnData が NULL
の場合、戻り値は必要なバイト数である。失敗した場合は 0 である。

[備考]
GetRegionData 関数は ExtCreateRegion 関数と組み合わせて使用される。


%index
GetRgnBox
GetRgnBox 関数は、指定したリージョンの境界矩形を取得する。
%prm
hrgn, lprc
hrgn : [intptr] リージョンのハンドル。
lprc : [var] 境界矩形(論理単位)を受け取る RECT 構造体へのポインタ。
%inst
GetRgnBox 関数は、指定したリージョンの境界矩形を取得する。

[戻り値]
戻り値はリージョンの複雑度を表し、次のいずれかの値となる。
（以下省略)


%index
GetStockObject
ストックペン、ブラシ、フォント、パレットのいずれかへのハンドルを取得する。
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
GetStretchBltMode
GetStretchBltMode 関数は、現在のストレッチモードを取得する。ストレッチモードは、StretchBlt 関数の呼び出し時にビットマップが伸縮または圧縮されるときに、どのようにカラーデータが追加または削除されるかを定義する。
%prm
hdc
hdc : [intptr] デバイスコンテキストのハンドル。
%inst
GetStretchBltMode 関数は、現在のストレッチモードを取得する。ストレッチモードは、StretchBlt
関数の呼び出し時にビットマップが伸縮または圧縮されるときに、どのようにカラーデータが追加または削除されるかを定義する。

[戻り値]
関数が成功した場合、戻り値は現在のストレッチモードである。次のいずれかの値となる。
（以下省略)


%index
GetSystemPaletteEntries
GetSystemPaletteEntries 関数は、指定したデバイスコンテキスト (DC) に関連付けられたシステムパレットから指定範囲のパレットエントリを取得する。
%prm
hdc, iStart, cEntries, pPalEntries
hdc : [intptr] デバイスコンテキストのハンドル。
iStart : [int] システムパレットから取得する最初のエントリ。
cEntries : [int] システムパレットから取得するエントリ数。
pPalEntries : [var] パレットエントリを受け取る PALETTEENTRY 構造体の配列へのポインタ。配列は cEntries パラメータで指定された数以上の構造体を含んでいなければならない。このパラメータが NULL の場合、関数はパレット内のエントリの総数を返す。
%inst
GetSystemPaletteEntries 関数は、指定したデバイスコンテキスト (DC)
に関連付けられたシステムパレットから指定範囲のパレットエントリを取得する。

[戻り値]
関数が成功した場合、戻り値はパレットから取得されたエントリ数である。失敗した場合は 0 である。

[備考]
アプリケーションは GetDeviceCaps 関数を呼び出し RASTERCAPS
定数を指定することで、デバイスがパレット操作をサポートしているかを判定できる。


%index
GetSystemPaletteUse
GetSystemPaletteUse 関数は、指定したデバイスコンテキスト (DC) のシステム(物理)パレットの現在の状態を取得する。
%prm
hdc
hdc : [intptr] デバイスコンテキストのハンドル。
%inst
GetSystemPaletteUse 関数は、指定したデバイスコンテキスト (DC) のシステム(物理)パレットの現在の状態を取得する。

[戻り値]
関数が成功した場合、戻り値はシステムパレットの現在の状態である。このパラメータは次のいずれかの値となる。
（以下省略)

[備考]
既定では、システムパレットにはアプリケーションが論理パレットを実体化しても変更されない 20 個の静的色が含まれる。アプリケーションは
SetSystemPaletteUse 関数を呼び出すことでこれらの色の多くにアクセスできる。hdc
パラメータが識別するデバイスコンテキストはカラーパレットをサポートするデバイスを表していなければならない。アプリケーションは
GetDeviceCaps 関数を呼び出し RASTERCAPS
定数を指定することで、デバイスがカラーパレットをサポートしているかを判定できる。


%index
GetTextAlign
GetTextAlign 関数は、指定したデバイスコンテキストのテキスト配置設定を取得する。
%prm
hdc
hdc : [intptr] デバイスコンテキストのハンドル。
%inst
GetTextAlign 関数は、指定したデバイスコンテキストのテキスト配置設定を取得する。

[戻り値]
関数が成功した場合、戻り値はテキスト配置フラグの状態である。戻り値の詳細は備考を参照。戻り値は次の値の組み合わせである。
（以下省略)

[備考]
境界矩形は文字列内のすべての文字セルを囲む矩形である。その寸法は GetTextExtentPoint32
関数で取得できる。テキスト配置フラグは、TextOut や ExtTextOut 関数が文字列をその基準点(TextOut や
ExtTextOut に与える)に対してどのように配置するかを決定する。テキスト配置フラグは必ずしも単一ビットフラグではなく、0
に等しくなることもある。フラグは、以下のリストに示すような関連フラグのグループごとに調べる必要がある。
（以下省略)


%index
GetTextCharacterExtra
GetTextCharacterExtra 関数は、指定したデバイスコンテキストの現在の文字間隔を取得する。
%prm
hdc
hdc : [intptr] デバイスコンテキストのハンドル。
%inst
GetTextCharacterExtra 関数は、指定したデバイスコンテキストの現在の文字間隔を取得する。

[戻り値]
関数が成功した場合、戻り値は現在の文字間隔(論理座標)である。失敗した場合は 0x8000000 を返す。

[備考]
文字間隔は、TextOut や ExtTextOut
関数が行を書き出すときに各文字に対して加える、ベースラインに沿った余白(論理単位)を定義する。この間隔はテキスト行を伸ばすために使われる。


%index
GetTextCharset
指定したデバイスコンテキストに現在選択されている HFONT の文字セット識別子を取得する。
%prm
hdc
hdc : [intptr] デバイスコンテキストのハンドル。関数は、このデバイスコンテキストに選択されている HFONT の文字セット識別子を取得する。
%inst
指定したデバイスコンテキストに現在選択されている HFONT の文字セット識別子を取得する。

[戻り値]
成功した場合、指定デバイスコンテキストに現在選択されている HFONT
の文字セットを識別する値を返す。次の文字セット識別子が定義されている。関数が失敗した場合は DEFAULT_CHARSET を返す。


%index
GetTextCharsetInfo
指定したデバイスコンテキストに現在選択されている HFONT の文字セットに関する情報を取得する。
%prm
hdc, lpSig, dwFlags
hdc : [intptr] デバイスコンテキストのハンドル。関数は、このデバイスコンテキストに選択されている HFONT に関する情報を取得する。
lpSig : [var] フォント署名情報を受け取る FONTSIGNATURE データ構造体へのポインタ。TrueType フォントがデバイスコンテキストに現在選択されている場合、FONTSIGNATURE 構造体はフォントがグリフを提供するコードページと Unicode サブレンジを識別する情報を受け取る。TrueType 以外のフォントが選択されている場合、FONTSIGNATURE 構造体には 0 が設定される。この場合、アプリケーションは TranslateCharsetInfo 関数を使って文字セットの汎用フォント署名情報を取得すべきである。FONTSIGNATURE 情報が不要な場合、lpSig パラメータに NULL を指定する。この場合、アプリケーションは GetTextCharset 関数を呼び出すこともできる(これは lpSig に NULL を指定した GetTextCharsetInfo と等価である)。
dwFlags : [int] 予約済み。0 に設定しなければならない。
%inst
指定したデバイスコンテキストに現在選択されている HFONT の文字セットに関する情報を取得する。

[戻り値]
成功した場合、指定デバイスコンテキストに現在選択されている HFONT
の文字セットを識別する値を返す。次の文字セット識別子が定義されている。失敗した場合、戻り値は DEFAULT_CHARSET である。


%index
GetTextColor
GetTextColor 関数は、指定したデバイスコンテキストの現在のテキスト色を取得する。
%prm
hdc
hdc : [intptr] デバイスコンテキストのハンドル。
%inst
GetTextColor 関数は、指定したデバイスコンテキストの現在のテキスト色を取得する。

[戻り値]
関数が成功した場合、戻り値は現在のテキスト色を COLORREF 値として返す。失敗した場合は CLR_INVALID
を返す。拡張エラー情報は利用できない。

[備考]
テキスト色は、TextOut や ExtTextOut 関数で描画される文字の前景色を定義する。


%index
GetTextExtentExPointW
GetTextExtentExPoint 関数は、指定されたスペースに収まる指定文字列内の文字数を取得し、その各文字のテキスト長で配列を満たす。(Unicode)
%prm
hdc, lpszString, cchString, nMaxExtent, lpnFit, lpnDx, lpSize
hdc : [intptr] デバイスコンテキストのハンドル。
lpszString : [wstr] 長さを取得する対象の NULL 終端文字列へのポインタ。
cchString : [int] lpszStr パラメータが指す文字列内の文字数。ANSI 呼び出しでは文字列長をバイト単位で、Unicode 呼び出しでは WORD 単位で指定する。ANSI 関数では SBCS コードページ内の文字は 1 バイト、DBCS コードページ内のほとんどの文字は 2 バイトである。Unicode 関数では、現在定義されているほとんどの Unicode 文字(基本多言語面 (BMP) 内)は 1 WORD、Unicode サロゲートは 2 WORD である点に注意。
nMaxExtent : [int] 整形された文字列の最大許容幅(論理単位)。
lpnFit : [var] nMaxExtent パラメータで指定されたスペースに収まる文字の最大数を受け取る整数へのポインタ。lpnFit パラメータが NULL の場合、nMaxExtent パラメータは無視される。
lpnDx : [var] 部分文字列長を受け取る整数配列へのポインタ。配列の各要素は、文字列の先頭から nMaxExtent パラメータで指定されたスペースに収まる文字の 1 つまでの距離(論理単位)を示す。この配列は cchString パラメータで指定された文字数以上の要素を持たなければならない(配列全体が内部的に使用される)。関数は lpnFit パラメータで指定された文字数分だけ有効な値で配列を埋める。それ以外の値は無視されるべきである。alpDx が NULL の場合、関数は部分文字列幅を計算しない。複雑スクリプトでは、一連の文字が任意の数のグリフで表現されることがあり、alpDx 配列の lpnFit で指定された数までの値はコードポイントと 1 対 1 で対応する。やはり、alpDx 配列の残りの値は無視すべきである。
lpSize : [var] 文字列の寸法(論理単位)を受け取る SIZE 構造体へのポインタ。このパラメータは NULL であってはならない。
%inst
GetTextExtentExPoint
関数は、指定されたスペースに収まる指定文字列内の文字数を取得し、その各文字のテキスト長で配列を満たす。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。

[備考]
lpnFit と alpDx パラメータの両方が NULL の場合、GetTextExtentExPoint 関数の呼び出しは
GetTextExtentPoint 関数の呼び出しと等価である。ANSI 版 GetTextExtentExPoint では、lpDx
配列は lpString のバイト数と同じ数の INT 値を持つ。DBCS 文字の 2 バイトに対応する INT
値はそれぞれ合成文字全体の長さとなる。GetTextExtentExPoint の alpDx 値は ExtTextOut の lpDx
値と同じではない点に注意。lpDx で alpDx
値を使うには、最初に処理が必要である。この関数がテキストの長さを返すとき、テキストは水平である(つまり escapement は常に
0)と想定する。これはテキストの水平と垂直の両方の測定に当てはまる。0 以外の escapement
を指定するフォントを使用していても、この関数はテキストの長さを計算する際に角度を使わない。アプリケーションが明示的に変換する必要がある。ただし、グラフィックモードが
GM_ADVANCED に設定され、文字方向が印刷方向から 90
度異なる場合、この関数が返す値はこのルールに従わない。文字方向と印刷方向が一致する場合、この関数は SIZE 構造体として { cx :
116, cy : 18 } のような寸法を返す。文字方向と印刷方向が 90 度異なる場合、SIZE 構造体として { cx : 18,
cy : 116 } を返す。この関数は文字列内の各文字の累積長を返す。これを論理単位に丸めると、各文字の幅を論理単位に丸めて返す
GetCharWidth とは異なる結果となる。
> [!NOTE] > wingdi.h ヘッダは GetTextExtentExPoint
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の有無に応じてこの関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立なエイリアスと非中立コードを混在させると、コンパイルまたは実行時エラーの原因となる不整合を引き起こすことがある。詳細は
[関数プロトタイプの規則](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetTextExtentExPointI
GetTextExtentExPointI 関数は、指定されたスペースに収まる指定文字列内の文字数を取得し、その各文字のテキスト長で配列を満たす。
%prm
hdc, lpwszString, cwchString, nMaxExtent, lpnFit, lpnDx, lpSize
hdc : [intptr] デバイスコンテキストのハンドル。
lpwszString : [var] 長さを取得する対象のグリフインデックス配列へのポインタ。
cwchString : [int] pgiIn パラメータが指す配列内のグリフ数。
nMaxExtent : [int] 整形された文字列の最大許容幅(論理単位)。
lpnFit : [var] nMaxExtent パラメータで指定されたスペースに収まる文字の最大数を受け取る整数へのポインタ。lpnFit パラメータが NULL の場合、nMaxExtent パラメータは無視される。
lpnDx : [var] 部分グリフ長を受け取る整数配列へのポインタ。配列の各要素は、グリフインデックス配列の先頭から、nMaxExtent パラメータで指定されたスペースに収まるグリフの 1 つまでの距離(論理単位)を示す。この配列は cgi パラメータで指定されたグリフインデックス数以上の要素を持つ必要があるが、関数は lpnFit パラメータで指定された数のグリフインデックスに対してのみ長さを埋める。lpnFit が NULL の場合、関数は部分文字列幅を計算しない。
lpSize : [var] グリフインデックス配列の寸法(論理単位)を受け取る SIZE 構造体へのポインタ。この値は NULL であってはならない。
%inst
GetTextExtentExPointI
関数は、指定されたスペースに収まる指定文字列内の文字数を取得し、その各文字のテキスト長で配列を満たす。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。

[備考]
lpnFit と alpDx パラメータの両方が NULL の場合、GetTextExtentExPointI 関数の呼び出しは
GetTextExtentPointI 関数の呼び出しと等価である。この関数がテキストの長さを返すとき、テキストは水平である(つまり
escapement は常に 0)と想定する。これはテキストの水平と垂直の両方の測定に当てはまる。0 以外の escapement
を指定するフォントを使用していても、この関数はテキストの長さを計算する際に角度を使わない。アプリケーションが明示的に変換する必要がある。ただし、グラフィックモードが
GM_ADVANCED に設定され、文字方向が印刷方向から 90
度異なる場合、この関数が返す値はこのルールに従わない。文字方向と印刷方向が一致する場合、この関数は SIZE 構造体として { cx :
116, cy : 18 } のような寸法を返す。文字方向と印刷方向が 90 度異なる場合、SIZE 構造体として { cx : 18,
cy : 116 } を返す。


%index
GetTextExtentPointW
GetTextExtentPoint 関数は、指定したテキスト文字列の幅と高さを計算する。(Unicode)
%prm
hdc, lpString, c, lpsz
hdc : [intptr] デバイスコンテキストのハンドル。
lpString : [wstr] テキストを指定する文字列へのポインタ。cbString が文字列の長さを指定するため、0 終端である必要はない。
c : [int] lpString が指す文字列の長さ。
lpsz : [var] 文字列の寸法(論理単位)を受け取る SIZE 構造体へのポインタ。
%inst
GetTextExtentPoint 関数は、指定したテキスト文字列の幅と高さを計算する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。

[備考]
GetTextExtentPoint
関数は、現在選択されているフォントを使って文字列の寸法を計算する。幅と高さ(論理単位)はクリッピングを考慮せずに計算される。また、この関数はテキストが水平である(つまり
escapement が常に 0)と想定する。これはテキストの水平と垂直の両方の測定に当てはまる。0 以外の escapement
を指定するフォントを使用していても、この関数はテキストの長さを計算する際に角度を使わない。アプリケーションが明示的に変換する必要がある。一部のデバイスは文字間をカーニングするため、文字列内の各文字の長さの合計は文字列全体の長さと等しくならない場合がある。計算される文字列幅は
SetTextCharacterExtra 関数で設定された文字間隔を考慮する。
> [!NOTE] > wingdi.h ヘッダは GetTextExtentPoint をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の有無に応じてこの関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立なエイリアスと非中立コードを混在させると、コンパイルまたは実行時エラーの原因となる不整合を引き起こすことがある。詳細は
[関数プロトタイプの規則](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetTextExtentPoint32A
GetTextExtentPoint32 関数は、指定したテキスト文字列の幅と高さを計算する。(ANSI)
%prm
hdc, lpString, c, psizl
hdc : [intptr] デバイスコンテキストのハンドル。
lpString : [str] テキスト文字列を指定するバッファへのポインタ。c パラメータが文字列の長さを指定するため、NULL 終端である必要はない。
c : [int] lpString が指す文字列の長さ。
psizl : [var] 文字列の寸法(論理単位)を受け取る SIZE 構造体へのポインタ。
%inst
GetTextExtentPoint32 関数は、指定したテキスト文字列の幅と高さを計算する。(ANSI)

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。

[備考]
GetTextExtentPoint32
関数は、現在選択されているフォントを使って文字列の寸法を計算する。幅と高さ(論理単位)はクリッピングを考慮せずに計算される。一部のデバイスは文字間をカーニングするため、文字列内の各文字の長さの合計は文字列全体の長さと等しくならない場合がある。計算される文字列幅は、SetTextCharacterExtra
関数で設定された文字間隔と SetTextJustification
で設定された揃えを考慮する。これは画面への表示と印刷の両方に当てはまる。ただし、ExtTextOut で lpDx
が設定されている場合、GetTextExtentPoint32 は文字間隔や揃えを考慮しない。さらに、EMF
では印刷結果は常に文字間隔と揃えの両方を考慮する。画面に表示されるテキストを扱う場合、計算される文字列幅は
SetTextCharacterExtra で設定された文字間隔と SetTextJustification
で設定された揃えを考慮する。ただし、ExtTextOut で lpDx が設定されている場合、GetTextExtentPoint32
は文字間隔や揃えを考慮しない。一方、EMF で印刷する場合:
（以下省略)


%index
GetTextExtentPoint32W
指定した文字列の幅と高さを計算する。(Unicode)
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
GetTextExtentPointI
GetTextExtentPointI 関数は、指定したグリフインデックス配列の幅と高さを計算する。
%prm
hdc, pgiIn, cgi, psize
hdc : [intptr] デバイスコンテキストのハンドル。
pgiIn : [var] グリフインデックス配列へのポインタ。
cgi : [int] グリフインデックス数を指定する。
psize : [var] 文字列の寸法(論理単位)を受け取る SIZE 構造体へのポインタ。
%inst
GetTextExtentPointI 関数は、指定したグリフインデックス配列の幅と高さを計算する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。

[備考]
GetTextExtentPointI
関数は、現在選択されているフォントを使ってグリフインデックス配列の寸法を計算する。幅と高さ(論理単位)はクリッピングを考慮せずに計算される。この関数がテキストの長さを返すとき、テキストは水平である(つまり
escapement は常に 0)と想定する。これはテキストの水平と垂直の両方の測定に当てはまる。0 以外の escapement
を指定するフォントを使用していても、この関数はテキストの長さを計算する際に角度を使わない。アプリケーションが明示的に変換する必要がある。ただし、グラフィックモードが
GM_ADVANCED に設定され、文字方向が印刷方向から 90
度異なる場合、この関数が返す値はこのルールに従わない。文字方向と印刷方向が一致する場合、この関数は SIZE 構造体として { cx :
116, cy : 18 } のような寸法を返す。文字方向と印刷方向が 90 度異なる場合、SIZE 構造体として { cx : 18,
cy : 116 }
を返す。一部のデバイスは文字間をカーニングするため、各グリフインデックスの長さの合計はグリフインデックス配列全体の長さと等しくならない場合がある。計算される文字列幅は
SetTextCharacterExtra 関数で設定された文字間隔を考慮する。


%index
GetTextFaceW
GetTextFace 関数は、指定したデバイスコンテキストに選択されている HFONT の書体名を取得する。(Unicode)
%prm
hdc, c, lpName
hdc : [intptr] デバイスコンテキストのハンドル。
c : [int] lpFaceName が指すバッファの長さ。ANSI 関数では BYTE 数、Unicode 関数では WORD 数である。ANSI 関数では SBCS コードページ内の文字は 1 バイト、DBCS コードページ内のほとんどの文字は 2 バイトである。Unicode 関数では、現在定義されているほとんどの Unicode 文字(BMP 内)は 1 WORD、Unicode サロゲートは 2 WORD である点に注意。
lpName : [wstr] 書体名を受け取るバッファへのポインタ。このパラメータが NULL の場合、関数は終端 NULL 文字を含む名前の文字数を返す。
%inst
GetTextFace 関数は、指定したデバイスコンテキストに選択されている HFONT の書体名を取得する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はバッファへコピーされた文字数である。失敗した場合は 0 である。

[備考]
書体名は NULL 終端文字列としてコピーされる。名前が nCount パラメータで指定された文字数より長い場合、名前は切り詰められる。
> [!NOTE] > wingdi.h ヘッダは GetTextFace をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の有無に応じてこの関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立なエイリアスと非中立コードを混在させると、コンパイルまたは実行時エラーの原因となる不整合を引き起こすことがある。詳細は
[関数プロトタイプの規則](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
GetTextMetricsW
現在選択されているフォントのメトリックを指定バッファに格納する。(Unicode)
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
GetViewportExtEx
GetViewportExtEx 関数は、指定したデバイスコンテキストの現在のビューポートの x 方向および y 方向の長さを取得する。
%prm
hdc, lpsize
hdc : [intptr] デバイスコンテキストのハンドル。
lpsize : [var] x および y 方向の長さ(デバイス単位)を受け取る SIZE 構造体へのポインタ。
%inst
GetViewportExtEx 関数は、指定したデバイスコンテキストの現在のビューポートの x 方向および y 方向の長さを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。


%index
GetViewportOrgEx
GetViewportOrgEx 関数は、指定したデバイスコンテキストのビューポート原点の x 座標および y 座標を取得する。
%prm
hdc, lppoint
hdc : [intptr] デバイスコンテキストのハンドル。
lppoint : [var] 原点の座標(デバイス単位)を受け取る POINT 構造体へのポインタ。
%inst
GetViewportOrgEx 関数は、指定したデバイスコンテキストのビューポート原点の x 座標および y 座標を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。


%index
GetWinMetaFileBits
GetWinMetaFileBits 関数は、メタファイルから拡張形式レコードを Windows 形式レコードへ変換し、指定バッファへ格納する。
%prm
hemf, cbData16, pData16, iMapMode, hdcRef
hemf : [intptr] 拡張メタファイルのハンドル。
cbData16 : [int] 変換されたレコードをコピーするバッファのサイズ(バイト単位)。
pData16 : [var] 変換されたレコードを受け取るバッファへのポインタ。lpbBuffer が NULL の場合、GetWinMetaFileBits は変換されたメタファイルレコードの格納に必要なバイト数を返す。
iMapMode : [int] 変換後のメタファイルで使用するマッピングモード。
hdcRef : [intptr] 参照デバイスコンテキストのハンドル。
%inst
GetWinMetaFileBits 関数は、メタファイルから拡張形式レコードを Windows
形式レコードへ変換し、指定バッファへ格納する。

[戻り値]
関数が成功しバッファポインタが NULL
の場合、戻り値は変換されたレコードの格納に必要なバイト数である。関数が成功しバッファポインタが有効な場合、戻り値はメタファイルデータのサイズ(バイト単位)である。失敗した場合は
0 である。

[備考]
この関数は拡張メタファイルを Windows
形式メタファイルへ変換し、古い形式を認識するアプリケーションで画像を表示できるようにする。システムは参照デバイスコンテキストを使って変換後のメタファイルの解像度を決定する。GetWinMetaFileBits
関数は拡張メタファイルハンドルを無効にしない。アプリケーションは不要になったハンドルを DeleteEnhMetaFile
関数で解放すべきである。スケーラブルな Windows 形式メタファイルを作成するには、fnMapMode パラメータに
MM_ANISOTROPIC を指定する。メタファイル画像の左上隅は常に参照デバイスの原点にマップされる。


%index
GetWindowExtEx
この関数は、指定したデバイスコンテキストのウィンドウの x 方向および y 方向の長さを取得する。
%prm
hdc, lpsize
hdc : [intptr] デバイスコンテキストのハンドル。
lpsize : [var] ページ空間単位(論理単位)の x および y 方向の長さを受け取る SIZE 構造体へのポインタ。
%inst
この関数は、指定したデバイスコンテキストのウィンドウの x 方向および y 方向の長さを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。


%index
GetWindowOrgEx
GetWindowOrgEx 関数は、指定したデバイスコンテキストのウィンドウ原点の x 座標および y 座標を取得する。
%prm
hdc, lppoint
hdc : [intptr] デバイスコンテキストのハンドル。
lppoint : [var] ウィンドウ原点の座標(論理単位)を受け取る POINT 構造体へのポインタ。
%inst
GetWindowOrgEx 関数は、指定したデバイスコンテキストのウィンドウ原点の x 座標および y 座標を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。


%index
GetWorldTransform
GetWorldTransform 関数は、現在のワールド空間からページ空間への変換を取得する。
%prm
hdc, lpxf
hdc : [intptr] デバイスコンテキストのハンドル。
lpxf : [var] 現在のワールド空間からページ空間への変換を受け取る XFORM 構造体へのポインタ。
%inst
GetWorldTransform 関数は、現在のワールド空間からページ空間への変換を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外である。失敗した場合は 0 である。

[備考]
GetWorldTransform を呼び出す前にアプリケーションが ModifyWorldTransform
関数を呼び出していた場合、変換の精度が変化する可能性がある(変換値を格納する内部形式は FLOAT 値より高精度を使用するため)。


%index
HT_Get8BPPFormatPalette
HT_Get8BPPFormatPalette 関数は、標準の 8 ビット/ピクセルデバイス用のハーフトーンパレットを返す。
%prm
pPaletteEntry, RedGamma, GreenGamma, BlueGamma
pPaletteEntry : [var] PALETTEENTRY 構造体の配列へのポインタ(Microsoft Windows SDK ドキュメントを参照)。このポインタが NULL でない場合、GDI は 8 ビット/ピクセルのハーフトーンパレット全体を配置できる有効なメモリ領域を指していると想定する。
RedGamma : [int] 赤、緑、青のガンマ値を指定する。この USHORT 値は、暗黙の小数点の右側に下位 4 桁を持つ実数として解釈される。たとえば、ガンマ値 10000 は実数 1.0000 を表し、12345 は 1.2345 を表す。指定可能な最小ガンマ値は 0.0000、最大ガンマ値は 6.5535 である。
GreenGamma : [int] 赤、緑、青のガンマ値を指定する。この USHORT 値は、暗黙の小数点の右側に下位 4 桁を持つ実数として解釈される。たとえば、ガンマ値 10000 は実数 1.0000 を表し、12345 は 1.2345 を表す。指定可能な最小ガンマ値は 0.0000、最大ガンマ値は 6.5535 である。
BlueGamma : [int] 赤、緑、青のガンマ値を指定する。この USHORT 値は、暗黙の小数点の右側に下位 4 桁を持つ実数として解釈される。たとえば、ガンマ値 10000 は実数 1.0000 を表し、12345 は 1.2345 を表す。指定可能な最小ガンマ値は 0.0000、最大ガンマ値は 6.5535 である。
%inst
HT_Get8BPPFormatPalette 関数は、標準の 8 ビット/ピクセルデバイス用のハーフトーンパレットを返す。

[戻り値]
pPaletteEntry が NULL でない場合、戻り値は pPaletteEntry が指すメモリ位置から GDI が埋めた
PALETTEENTRY 構造体の数である。pPaletteEntry が NULL の場合、戻り値は 8
ビット/ピクセルのハーフトーンパレットを格納するために必要な PALETTEENTRY 構造体の総数である。

[備考]
HT_Get8BPPFormatPalette は、ドライバがシステム標準の 8
ビット/ピクセルハーフトーンパレットを取得するために使用できる、ハーフトーン関連の GDI サービスである。


%index
HT_Get8BPPMaskPalette
HT_Get8BPPMaskPalette 関数は、8 ビット/ピクセルデバイス用のマスクパレットを返す。
%prm
pPaletteEntry, Use8BPPMaskPal, CMYMask, RedGamma, GreenGamma, BlueGamma
pPaletteEntry : [var] 埋められる PALETTEENTRY 構造体(Windows SDK ドキュメントを参照)配列へのポインタ。GDI はこれを、8 ビット/ピクセルハーフトーンパレット全体を配置できる有効なメモリ領域を指していると想定する。Windows XP 以降で動作するドライバの場合、GDI は pPaletteEntry[0] を調べて、構成された CMY パレットをどのように返すかを決定する。pPaletteEntry[0] が 'RGB0' に設定されていれば、パレットは CMY_INVERTED モードの 1 つとなり、インデックスが反転される。つまり、パレットのインデックス 0 は黒、インデックス 255 は白となる。pPaletteEntry[0] が 'RGB0' に設定されていない場合、パレットは通常の CMY パレットとなり、インデックス 0 が白、インデックス 255 が黒となる。新しい要件とこのパラメータの使用方法の詳細については、「Using GDI 8-Bit-Per-Pixel CMY Mask Modes」を参照すること。Windows 2000 はドライバが pPaletteEntry[0] に配置した値を無視する。このため、Windows 2000 および Windows XP 以降で動作させるドライバで pPaletteEntry[0] を 'RGB0' に設定する場合、Windows XP 以降から受け取るビットマップは Windows 2000 から受け取るものと比べて色が反転している可能性がある。したがって、そのようなドライバはビットマップをダウンロードする前にパレットを検査しなければならない。
Use8BPPMaskPal : [int] 返されるパレットの種類を指定する。Use8BPPMaskPal が TRUE の場合、HT_Get8BPPMaskPalette は pPaletteEntry パラメータに、CMYMask で指定されたビットマスクで記述される CMY パレット(PALETTEENTRY 構造体の配列)のアドレスを設定する。Use8BPPMaskPal が FALSE の場合、この関数は pPaletteEntry に標準の RGB 8 ビット/ピクセルハーフトーンパレットのアドレスを設定する。
CMYMask : [int] 
RedGamma : [int] Use8BPPMaskPal が TRUE の場合、このパラメータの値は使用されない。その場合、ガンマ値は GDIINFO 構造体の ciDevice メンバで指定される。Use8BPPMaskPal が FALSE の場合、このパラメータは、GDI がパレットをガンマ補正する際に使用する赤・緑・青のうち赤のガンマ値を指定する。この USHORT 値は、小数点の右側に下位 4 桁を持つ実数として解釈される。たとえば、ガンマ値 10000 は実数 1.0000 を表し、12345 は 1.2345 を表す。指定可能な最小ガンマ値は 0.0000、最大ガンマ値は 6.5535 である。
GreenGamma : [int] Use8BPPMaskPal が TRUE の場合、このパラメータの値は使用されない。その場合、ガンマ値は GDIINFO 構造体の ciDevice メンバで指定される。Use8BPPMaskPal が FALSE の場合、このパラメータは、GDI がパレットをガンマ補正する際に使用する赤・緑・青のうち緑のガンマ値を指定する。この USHORT 値は、小数点の右側に下位 4 桁を持つ実数として解釈される。たとえば、ガンマ値 10000 は実数 1.0000 を表し、12345 は 1.2345 を表す。指定可能な最小ガンマ値は 0.0000、最大ガンマ値は 6.5535 である。
BlueGamma : [int] Use8BPPMaskPal が TRUE の場合、このパラメータの値は使用されない。その場合、ガンマ値は GDIINFO 構造体の ciDevice メンバで指定される。Use8BPPMaskPal が FALSE の場合、このパラメータは、GDI がパレットをガンマ補正する際に使用する赤・緑・青のうち青のガンマ値を指定する。この USHORT 値は、小数点の右側に下位 4 桁を持つ実数として解釈される。たとえば、ガンマ値 10000 は実数 1.0000 を表し、12345 は 1.2345 を表す。指定可能な最小ガンマ値は 0.0000、最大ガンマ値は 6.5535 である。
%inst
HT_Get8BPPMaskPalette 関数は、8 ビット/ピクセルデバイス用のマスクパレットを返す。

[戻り値]
pPaletteEntry が NULL でない場合、HT_Get8BPPMaskPalette は pPaletteEntry
が指す配列内に GDI が埋めた PALETTEENTRY 構造体の数を返す。pPaletteEntry が NULL
の場合、戻り値はハーフトーンパレットを格納するために必要な PALETTEENTRY 構造体の総数である。CMYMask
パラメータに不正な値が渡された場合、HT_Get8BPPMaskPalette は 0 を返す。

[備考]
PALETTEENTRY 構造体は Windows SDK ドキュメントに記載されている。Use8BPPMaskPal を FALSE
にして HT_Get8BPPMaskPalette を呼び出すことは、HT_Get8BPPFormatPalette
を呼び出すことと等価である。この関数とパラメータの使用方法の詳細については、「Using GDI 8-Bit-Per-Pixel CMY
Mask Modes」を参照すること。


%index
IntersectClipRect
IntersectClipRect 関数は、現在のクリッピング領域と指定した矩形の交差部分から新しいクリッピング領域を作成する。
%prm
hdc, left, top, right, bottom
hdc : [intptr] デバイスコンテキストへのハンドル。
left : [int] 矩形の左上隅の x 座標(論理単位)。
top : [int] 矩形の左上隅の y 座標(論理単位)。
right : [int] 矩形の右下隅の x 座標(論理単位)。
bottom : [int] 矩形の右下隅の y 座標(論理単位)。
%inst
IntersectClipRect 関数は、現在のクリッピング領域と指定した矩形の交差部分から新しいクリッピング領域を作成する。

[戻り値]
戻り値は新しいクリッピング領域の種類を示し、次のいずれかの値となる。
（以下省略）

[備考]
指定した矩形の下端と右端はクリッピング領域から除外される。クリッピング領域がまだ存在していない場合、システムは指定した HDC
にデフォルトのクリッピング領域を適用することがある。その後、デフォルトのクリッピング領域と関数パラメータで指定された矩形の交差部分から新しいクリッピング領域が作成される。


%index
InvertRgn
InvertRgn 関数は、指定したリージョン内の色を反転する。
%prm
hdc, hrgn
hdc : [intptr] デバイスコンテキストへのハンドル。
hrgn : [intptr] 色を反転させるリージョンへのハンドル。リージョンの座標は論理座標とみなされる。
%inst
InvertRgn 関数は、指定したリージョン内の色を反転する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
モノクロ画面では、InvertRgn
関数は白ピクセルを黒に、黒ピクセルを白にする。カラー画面では、この反転は画面の色生成に使用される技術の種類に依存する。


%index
LPtoDP
LPtoDP 関数は、論理座標をデバイス座標に変換する。変換はデバイスコンテキストのマッピングモード、ウィンドウとビューポートの原点と範囲の設定、およびワールド変換に依存する。
%prm
hdc, lppt, c
hdc : [intptr] デバイスコンテキストへのハンドル。
lppt : [var] POINT 構造体の配列へのポインタ。各 POINT 構造体に含まれる x 座標と y 座標が変換される。
c : [int] 配列内の点の数。
%inst
LPtoDP
関数は、論理座標をデバイス座標に変換する。変換はデバイスコンテキストのマッピングモード、ウィンドウとビューポートの原点と範囲の設定、およびワールド変換に依存する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
LPtoDP 関数は、論理座標が 32 ビットを超える場合、または変換後のデバイス座標が 27
ビットを超える場合に失敗する。そのようなオーバーフローが発生した場合、すべての点の結果は未定義となる。LPtoDP
は複雑な浮動小数点演算を行い、効率のためにキャッシュシステムを持つ。したがって、最初の LPtoDP 呼び出しの変換結果と、後の
LPtoDP 呼び出しの変換結果が厳密に一致しないことがある。同一のパラメータを渡す複数の LPtoDP
呼び出しの変換結果が厳密に一致することに依存するコードを書かないことを推奨する。


%index
LineDDA
LineDDA 関数は、指定した始点と終点で定義される線に対して、どのピクセルを強調表示すべきかを決定する。
%prm
xStart, yStart, xEnd, yEnd, lpProc, data
xStart : [int] 線の始点の x 座標(論理単位)を指定する。
yStart : [int] 線の始点の y 座標(論理単位)を指定する。
xEnd : [int] 線の終点の x 座標(論理単位)を指定する。
yEnd : [int] 線の終点の y 座標(論理単位)を指定する。
lpProc : [int] アプリケーション定義のコールバック関数へのポインタ。詳細は LineDDAProc コールバック関数を参照。
data : [intptr] アプリケーション定義データへのポインタ。
%inst
LineDDA 関数は、指定した始点と終点で定義される線に対して、どのピクセルを強調表示すべきかを決定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
LineDDA
関数は、線の終点を除いた線上の各点の座標を、アプリケーション定義のコールバック関数に渡す。座標を渡すのに加えて、既存のアプリケーション定義データも渡す。コールバック関数に渡される座標がビデオディスプレイ上のピクセルと一致するのは、デフォルトの変換およびマッピングモードが使用されている場合のみである。


%index
LineTo
現在位置から指定された点の直前までの直線を描画する。
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
MaskBlt
MaskBlt 関数は、指定したマスクとラスタ演算を使用して、ソースとコピー先のビットマップのカラーデータを結合する。
%prm
hdcDest, xDest, yDest, width, height, hdcSrc, xSrc, ySrc, hbmMask, xMask, yMask, rop
hdcDest : [intptr] コピー先のデバイスコンテキストへのハンドル。
xDest : [int] コピー先矩形の左上隅の x 座標(論理単位)。
yDest : [int] コピー先矩形の左上隅の y 座標(論理単位)。
width : [int] コピー先の矩形およびソースビットマップの幅(論理単位)。
height : [int] コピー先の矩形およびソースビットマップの高さ(論理単位)。
hdcSrc : [intptr] ビットマップのコピー元となるデバイスコンテキストへのハンドル。dwRop パラメータがソースを含まないラスタ操作を指定する場合は 0 でなければならない。
xSrc : [int] ソースビットマップの左上隅の x 座標(論理単位)。
ySrc : [int] ソースビットマップの左上隅の y 座標(論理単位)。
hbmMask : [intptr] ソースデバイスコンテキスト内のカラービットマップと結合する、モノクロのマスクビットマップへのハンドル。
xMask : [int] hbmMask パラメータで指定されたマスクビットマップの水平ピクセルオフセット。
yMask : [int] hbmMask パラメータで指定されたマスクビットマップの垂直ピクセルオフセット。
rop : [int] 関数がソースデータとコピー先データの結合を制御するのに使用する前景および背景の三項ラスタ演算コード(ROP)。背景ラスタ演算コードはこの値の上位ワードの上位バイトに、前景ラスタ演算コードはこの値の上位ワードの下位バイトに格納される。下位ワードは無視され、0 でなければならない。マクロ MAKEROP4 はこのような前景・背景ラスタ演算コードの組み合わせを作成する。この関数のコンテキストにおける前景と背景の説明については、後述の「解説」セクションを参照のこと。一般的なラスタ演算コード(ROP)の一覧は BitBlt 関数を参照。なお、CAPTUREBLT ROP は通常、印刷デバイスコンテキストには使用できない。
%inst
MaskBlt 関数は、指定したマスクとラスタ演算を使用して、ソースとコピー先のビットマップのカラーデータを結合する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
MaskBlt 関数はデバイス依存ビットマップを使用する。hbmMask で指定されたマスク内の値 1 は、その位置で dwRop
で指定された前景ラスタ演算コードを適用すべきことを示す。マスク内の値 0 は、その位置で dwRop
で指定された背景ラスタ演算コードを適用すべきことを示す。ラスタ演算がソースを必要とする場合、マスク矩形はソース矩形を覆っていなければならない。そうでないと関数は失敗する。ラスタ演算がソースを必要としない場合、マスク矩形はコピー先矩形を覆っていなければならない。そうでないと関数は失敗する。この関数の呼び出し時にソースデバイスコンテキストに回転または剪断変換が有効だとエラーになる。ただし、他の種類の変換は許可される。ソース、パターン、コピー先のビットマップのカラー形式が異なる場合、この関数はパターンまたはソース形式(あるいは両方)をコピー先の形式に合わせて変換する。マスクビットマップがモノクロビットマップでない場合、エラーが発生する。拡張メタファイルを記録中にソースデバイスコンテキストが拡張メタファイルデバイスコンテキストを指している場合、エラーが発生し(関数は
FALSE を返す)関数は失敗する。すべてのデバイスが MaskBlt 関数をサポートしているわけではない。アプリケーションは
GetDeviceCaps 関数を nIndex パラメータを RC_BITBLT
として呼び出し、デバイスがこの関数をサポートしているかを判定する必要がある。マスクビットマップが指定されない場合、この関数は前景ラスタ演算コードを用いて
BitBlt と全く同じ動作をする。ICM: blit
が発生してもカラー管理は行われない。マルチモニタシステムで使用される場合、hdcSrc と hdcDest
は同じデバイスを参照していなければならず、そうでなければ関数は失敗する。異なるデバイスの DC
間でデータを転送するには、GetDIBits を呼び出してメモリビットマップ(互換ビットマップ、または DDB)を DIB
に変換する。DIB を 2 台目のデバイスに表示するには、SetDIBits または StretchDIBits を呼び出す。


%index
ModifyWorldTransform
ModifyWorldTransform 関数は、指定したモードを使用してデバイスコンテキストのワールド変換を変更する。
%prm
hdc, lpxf, mode
hdc : [intptr] デバイスコンテキストへのハンドル。
lpxf : [var] 指定したデバイスコンテキストのワールド変換を変更するために使用する XFORM 構造体へのポインタ。
mode : [int] 
%inst
ModifyWorldTransform 関数は、指定したモードを使用してデバイスコンテキストのワールド変換を変更する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
ModifyWorldTransform 関数は、事前に SetGraphicsMode
関数を呼び出して指定したデバイスコンテキストのグラフィックスモードが GM_ADVANCED に設定されていなければ失敗する。同様に、まず
SetWorldTransform または ModifyWorldTransform
を呼んでワールド変換をデフォルトの恒等変換にリセットしない限り、デバイスコンテキストのグラフィックスモードをデフォルトの
GM_COMPATIBLE モードに戻すことはできない。


%index
MoveToEx
現在位置を指定された点に更新し、オプションで前の位置を返す。
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
OffsetClipRgn
OffsetClipRgn 関数は、デバイスコンテキストのクリッピング領域を指定したオフセットだけ移動する。
%prm
hdc, x, y
hdc : [intptr] デバイスコンテキストへのハンドル。
x : [int] 左右に移動する論理単位数。
y : [int] 上下に移動する論理単位数。
%inst
OffsetClipRgn 関数は、デバイスコンテキストのクリッピング領域を指定したオフセットだけ移動する。

[戻り値]
戻り値は新しいリージョンの複雑度を示し、次のいずれかの値となる。
（以下省略）


%index
OffsetRgn
OffsetRgn 関数は、指定したオフセットだけリージョンを移動する。
%prm
hrgn, x, y
hrgn : [intptr] 移動するリージョンへのハンドル。
x : [int] 左右に移動する論理単位数を指定する。
y : [int] 上下に移動する論理単位数を指定する。
%inst
OffsetRgn 関数は、指定したオフセットだけリージョンを移動する。

[戻り値]
戻り値は新しいリージョンの複雑度を示す。次のいずれかの値となる。
（以下省略）


%index
OffsetViewportOrgEx
OffsetViewportOrgEx 関数は、指定した水平・垂直オフセットを用いてデバイスコンテキストのビューポート原点を変更する。
%prm
hdc, x, y, lppt
hdc : [intptr] デバイスコンテキストへのハンドル。
x : [int] 水平方向のオフセット(デバイス単位)。
y : [int] 垂直方向のオフセット(デバイス単位)。
lppt : [var] POINT 構造体へのポインタ。以前のビューポート原点(デバイス単位)がこの構造体に格納される。lpPoint が NULL の場合、以前のビューポート原点は返されない。
%inst
OffsetViewportOrgEx 関数は、指定した水平・垂直オフセットを用いてデバイスコンテキストのビューポート原点を変更する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
新しい原点は、現在の原点と水平・垂直オフセットの合計となる。


%index
OffsetWindowOrgEx
OffsetWindowOrgEx 関数は、指定した水平・垂直オフセットを用いてデバイスコンテキストのウィンドウ原点を変更する。
%prm
hdc, x, y, lppt
hdc : [intptr] デバイスコンテキストへのハンドル。
x : [int] 水平方向のオフセット(論理単位)。
y : [int] 垂直方向のオフセット(論理単位)。
lppt : [var] POINT 構造体へのポインタ。以前のウィンドウ原点の論理座標がこの構造体に格納される。lpPoint が NULL の場合、以前の原点は返されない。
%inst
OffsetWindowOrgEx 関数は、指定した水平・垂直オフセットを用いてデバイスコンテキストのウィンドウ原点を変更する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。


%index
PATHOBJ_bEnum
PATHOBJ_bEnum 関数は、指定したパスから次の PATHDATA レコードを取得し、パス内の曲線を列挙する。
%prm
ppo, ppd
ppo : [var] 曲線や線を列挙する対象の PATHOBJ 構造体へのポインタ。
ppd : [var] 埋められる PATHDATA 構造体へのポインタ。
%inst
PATHOBJ_bEnum 関数は、指定したパスから次の PATHDATA レコードを取得し、パス内の曲線を列挙する。

[戻り値]
指定されたパスにさらに PATHDATA レコードが含まれる場合、戻り値は TRUE
となり、このサービスを再度呼び出す必要があることを示す。出力がパス内の最後の PATHDATA レコードである場合、戻り値は FALSE
となる。

[備考]
PATHOBJ_bEnum は PATHOBJ_vEnumStart の呼び出し後にのみ呼び出せる。PATHDATA
構造体はサブパス(パスの接続された部分)の全部または一部を記述する。たとえば、パス内でアプリケーションが MoveTo
を呼ぶと、新しいサブパスが開始される。


%index
PATHOBJ_bEnumClipLines
PATHOBJ_bEnumClipLines 関数は、指定したパスからクリップされた線分を列挙する。
%prm
ppo, cb, pcl
ppo : [var] 列挙するクリップ済みの線分を含む PATHOBJ 構造体へのポインタ。
cb : [int] 出力バッファのサイズ(バイト単位)を指定する。GDI はバッファ内のこの位置を超えて書き込むことはない。このパラメータの値は、少なくとも 1 つの RUN 構造体を持つ CLIPLINE 構造体を収納できるだけの大きさでなければならない。ドライバは複数の RUN 構造体のための領域を確保すべきである。
pcl : [var] CLIPLINE 構造体を受け取るバッファへのポインタ。この構造体には線分の元のクリップされていない制御点が含まれている(元の点がないと線の正しいピクセルを計算できない)。クリップされなかった線上のピクセルの集合を記述する RUN 構造体がこのバッファに書き込まれる。クリップ領域が複雑な場合、1 本の線分が多数の RUN 構造体に分割されることがある。その場合、線分のすべての RUN 構造体を列挙するために必要な回数だけ繰り返される。CLIPLINE 構造体には、元のクリップされていない線の始点と終点、およびその線の線分(RUN 構造体)が含まれており、それらが画面に表示される。
%inst
PATHOBJ_bEnumClipLines 関数は、指定したパスからクリップされた線分を列挙する。

[戻り値]
列挙すべき線分がまだある場合、戻り値は TRUE となり、このサービスを再度呼び出す必要があることを示す。そうでない場合は FALSE
となり、返された線分がパス内の最後の線分であることを示す。

[備考]
列挙は、ドライバがこの呼び出しを行う前に PATHOBJ_vEnumStartClipLines で開始しておかなければならない。


%index
PATHOBJ_vEnumStart
PATHOBJ_vEnumStart 関数は、指定された PATHOBJ 構造体に対して、ドライバがパス内の線や曲線を列挙するために PATHOBJ_bEnum を呼び出すことを通知する。
%prm
ppo
ppo : [var] 線や曲線を列挙する対象の PATHOBJ 構造体へのポインタ。
%inst
PATHOBJ_vEnumStart 関数は、指定された PATHOBJ 構造体に対して、ドライバがパス内の線や曲線を列挙するために
PATHOBJ_bEnum を呼び出すことを通知する。

[戻り値]
なし。

[備考]
PATHOBJ_vEnumStart は、列挙を再開するためにいつでも呼び出せる。


%index
PATHOBJ_vGetBounds
PATHOBJ_vGetBounds 関数は、指定したパスのバウンディング矩形を取得する。
%prm
ppo, prectfx
ppo : [var] バウンディング矩形を計算する対象のパスを記述する PATHOBJ 構造体へのポインタ。
prectfx : [var] RECTFX 構造体を書き込むアドレスへのポインタ。返される矩形は下端と右端を含まない。空の矩形は、RECTFX の 4 つのメンバをすべて 0 に設定することで指定する。このデータ型の説明については、GDI Data Types を参照。
%inst
PATHOBJ_vGetBounds 関数は、指定したパスのバウンディング矩形を取得する。

[戻り値]
なし。


%index
PaintRgn
PaintRgn 関数は、デバイスコンテキストに現在選択されているブラシを使用して、指定したリージョンを塗りつぶす。
%prm
hdc, hrgn
hdc : [intptr] デバイスコンテキストへのハンドル。
hrgn : [intptr] 塗りつぶすリージョンへのハンドル。リージョンの座標は論理座標とみなされる。
%inst
PaintRgn 関数は、デバイスコンテキストに現在選択されているブラシを使用して、指定したリージョンを塗りつぶす。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。


%index
PatBlt
PatBlt 関数は、指定したデバイスコンテキストに現在選択されているブラシを使用して、指定した矩形を塗りつぶす。ブラシの色と描画先の色は、指定したラスタ演算で組み合わされる。
%prm
hdc, x, y, w, h, rop
hdc : [intptr] デバイスコンテキストへのハンドル。
x : [int] 塗りつぶす矩形の左上隅の x 座標(論理単位)。
y : [int] 塗りつぶす矩形の左上隅の y 座標(論理単位)。
w : [int] 矩形の幅(論理単位)。
h : [int] 矩形の高さ(論理単位)。
rop : [int] 
%inst
PatBlt
関数は、指定したデバイスコンテキストに現在選択されているブラシを使用して、指定した矩形を塗りつぶす。ブラシの色と描画先の色は、指定したラスタ演算で組み合わされる。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
この関数の dwRop パラメータの値は、完全な 256
個の三項ラスタ演算コードの限定的な部分集合である。特に、ソース矩形を参照する演算コードは使用できない。すべてのデバイスが PatBlt
関数をサポートしているわけではない。詳細は GetDeviceCaps 関数の RC_BITBLT ケーパビリティの説明を参照。


%index
PathToRegion
PathToRegion 関数は、指定したデバイスコンテキストに選択されているパスからリージョンを作成する。結果のリージョンはデバイス座標を使用する。
%prm
hdc
hdc : [intptr] 閉じたパスを含むデバイスコンテキストへのハンドル。
%inst
PathToRegion
関数は、指定したデバイスコンテキストに選択されているパスからリージョンを作成する。結果のリージョンはデバイス座標を使用する。

[戻り値]
関数が成功した場合、戻り値は有効なリージョンを識別する。関数が失敗した場合、戻り値はゼロである。

[備考]
HRGN オブジェクトが不要になったら、DeleteObject 関数を呼び出して削除すること。hdc
パラメータで指定されたデバイスコンテキストには閉じたパスが含まれていなければならない。PathToRegion
がパスをリージョンに変換した後、システムは指定されたデバイスコンテキストから閉じたパスを破棄する。


%index
Pie
Pie 関数は、楕円と 2 本の半径線の交差部分で囲まれた扇形のくさびを描画する。パイは現在のペンで輪郭が描かれ、現在のブラシで塗りつぶされる。
%prm
hdc, left, top, right, bottom, xr1, yr1, xr2, yr2
hdc : [intptr] デバイスコンテキストへのハンドル。
left : [int] 境界矩形の左上隅の x 座標(論理座標)。
top : [int] 境界矩形の左上隅の y 座標(論理座標)。
right : [int] 境界矩形の右下隅の x 座標(論理座標)。
bottom : [int] 境界矩形の右下隅の y 座標(論理座標)。
xr1 : [int] 1 本目の半径線の端点の x 座標(論理座標)。
yr1 : [int] 1 本目の半径線の端点の y 座標(論理座標)。
xr2 : [int] 2 本目の半径線の端点の x 座標(論理座標)。
yr2 : [int] 2 本目の半径線の端点の y 座標(論理座標)。
%inst
Pie 関数は、楕円と 2
本の半径線の交差部分で囲まれた扇形のくさびを描画する。パイは現在のペンで輪郭が描かれ、現在のブラシで塗りつぶされる。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
パイの曲線は、指定した境界矩形に収まる楕円で定義される。曲線は楕円が 1 本目の半径線と交差する点から始まり、反時計回りに 2
本目の半径線と交差する点まで延びる。現在位置は Pie 関数では使用も更新もされない。


%index
PlayEnhMetaFile
PlayEnhMetaFile 関数は、指定した拡張形式メタファイルに格納されている絵を表示する。
%prm
hdc, hmf, lprect
hdc : [intptr] 絵を表示する出力デバイスのデバイスコンテキストへのハンドル。
hmf : [intptr] 拡張メタファイルへのハンドル。
lprect : [var] 絵を表示するために使用する境界矩形の座標を含む RECT 構造体へのポインタ。座標は論理単位で指定する。
%inst
PlayEnhMetaFile 関数は、指定した拡張形式メタファイルに格納されている絵を表示する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
アプリケーションが PlayEnhMetaFile
関数を呼び出すと、システムは拡張メタファイルヘッダー内の絵のフレームを使用して、lpRect
パラメータが指す矩形に絵をマッピングする(PlayEnhMetaFile
を呼ぶ前に出力デバイスのワールド変換を設定することで、この絵を剪断または回転させることもできる)。矩形の端に沿った点は絵に含まれる。拡張メタファイルの絵は、拡張メタファイルを再生する前に出力デバイスでクリッピング領域を定義することでクリップできる。拡張メタファイルにオプションのパレットが含まれている場合、アプリケーションは
PlayEnhMetaFile
を呼ぶ前に出力デバイスにカラーパレットを設定することで、一貫した色を得ることができる。オプションのパレットを取得するには
GetEnhMetaFilePaletteEntries
関数を使用する。新しく作成された拡張メタファイルのデバイスコンテキストにソース拡張メタファイルを PlayEnhMetaFile
で再生することで、拡張メタファイルを新しい拡張メタファイルに埋め込むこともできる。出力デバイスコンテキストの状態はこの関数によって保持される。拡張メタファイル内で作成されて削除されていないオブジェクトは、この関数によって削除される。この関数を停止するために、アプリケーションは別スレッドから
CancelDC 関数を呼び出して操作を終了できる。この場合、関数は FALSE を返す。


%index
PlayEnhMetaFileRecord
PlayEnhMetaFileRecord 関数は、レコードで識別される GDI 関数を実行することにより、拡張メタファイルレコードを再生する。
%prm
hdc, pht, pmr, cht
hdc : [intptr] EnumEnhMetaFile 関数に渡されたデバイスコンテキストへのハンドル。
pht : [var] メタファイル再生時に使用される GDI オブジェクトへのハンドルのテーブルへのポインタ。このテーブルの最初のエントリには拡張メタファイルのハンドルが含まれる。
pmr : [var] 再生する拡張メタファイルレコードへのポインタ。
cht : [int] ハンドルテーブル内のハンドル数。
%inst
PlayEnhMetaFileRecord 関数は、レコードで識別される GDI
関数を実行することにより、拡張メタファイルレコードを再生する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
これは拡張メタファイル関数である。アプリケーションは通常、EnumEnhMetaFile 関数と組み合わせて
PlayEnhMetaFileRecord を使用し、拡張形式メタファイルを 1
レコードずつ処理して再生する。hdc、lpHandletable、nHandles の各パラメータは、EnumEnhMetaFile
関数から EnhMetaFileProc
コールバックプロシージャに渡されたものと完全に同じでなければならない。PlayEnhMetaFileRecord
がレコードを認識しない場合、そのレコードを無視して TRUE を返す。


%index
PlayMetaFile
PlayMetaFile 関数は、指定した Windows 形式メタファイルに格納されている絵を指定デバイスに表示する。
%prm
hdc, hmf
hdc : [intptr] デバイスコンテキストへのハンドル。
hmf : [intptr] Windows 形式メタファイルへのハンドル。
%inst
PlayMetaFile 関数は、指定した Windows 形式メタファイルに格納されている絵を指定デバイスに表示する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
Windows 形式メタファイルを拡張形式メタファイルに変換するには、SetWinMetaFileBits 関数を使用する。Windows
形式メタファイルは複数回再生できる。PlayMetaFile
関数を呼び出してソースメタファイルをターゲットメタファイルのデバイスコンテキストに再生することで、Windows 形式メタファイルを別の
Windows 形式メタファイルに埋め込むこともできる。Windows
形式メタファイル内で作成されて削除されていないオブジェクトは、この関数によって削除される。この関数を停止するために、アプリケーションは別スレッドから
CancelDC 関数を呼び出して操作を終了できる。この場合、関数は FALSE を返す。


%index
PlayMetaFileRecord
PlayMetaFileRecord 関数は、レコードに含まれる GDI 関数を実行することによって、Windows 形式メタファイルレコードを再生する。
%prm
hdc, lpHandleTable, lpMR, noObjs
hdc : [intptr] デバイスコンテキストへのハンドル。
lpHandleTable : [var] メタファイル再生時に使用される GDI オブジェクトへのハンドルのテーブルを表す HANDLETABLE 構造体へのポインタ。
lpMR : [var] Windows 形式メタファイルレコードへのポインタ。
noObjs : [int] ハンドルテーブル内のハンドル数。
%inst
PlayMetaFileRecord 関数は、レコードに含まれる GDI 関数を実行することによって、Windows
形式メタファイルレコードを再生する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
Windows 形式メタファイルを拡張形式メタファイルに変換するには、SetWinMetaFileBits
関数を使用する。アプリケーションは通常、EnumMetaFile 関数と組み合わせて PlayMetaFileRecord
を使用し、Windows 形式メタファイルを 1 レコードずつ処理して再生する。lpHandletable と nHandles
の各パラメータは、EnumMetaFile から EnumMetaFileProc
コールバックプロシージャに渡されたものと同一でなければならない。PlayMetaFileRecord
関数がレコードを認識しない場合、そのレコードを無視して TRUE を返す。


%index
PlgBlt
PlgBlt 関数は、ソースデバイスコンテキスト内の指定矩形からコピー先デバイスコンテキスト内の指定平行四辺形へ、色データのビットをビットブロック転送する。
%prm
hdcDest, lpPoint, hdcSrc, xSrc, ySrc, width, height, hbmMask, xMask, yMask
hdcDest : [intptr] コピー先のデバイスコンテキストへのハンドル。
lpPoint : [var] コピー先平行四辺形の 3 つの角を識別する、論理空間内の 3 点の配列へのポインタ。ソース矩形の左上隅はこの配列の最初の点に、右上隅は 2 番目の点に、左下隅は 3 番目の点にマッピングされる。ソース矩形の右下隅は、平行四辺形の暗黙の 4 番目の点にマッピングされる。
hdcSrc : [intptr] コピー元のデバイスコンテキストへのハンドル。
xSrc : [int] ソース矩形の左上隅の x 座標(論理単位)。
ySrc : [int] ソース矩形の左上隅の y 座標(論理単位)。
width : [int] ソース矩形の幅(論理単位)。
height : [int] ソース矩形の高さ(論理単位)。
hbmMask : [intptr] ソース矩形の色をマスクするために使用するオプションのモノクロビットマップへのハンドル。
xMask : [int] モノクロビットマップの左上隅の x 座標(論理単位)。
yMask : [int] モノクロビットマップの左上隅の y 座標(論理単位)。
%inst
PlgBlt
関数は、ソースデバイスコンテキスト内の指定矩形からコピー先デバイスコンテキスト内の指定平行四辺形へ、色データのビットをビットブロック転送する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
PlgBlt 関数はデバイス依存ビットマップで動作する。平行四辺形の 4 番目の頂点(D)は、最初の 3
点(A、B、C)をベクトルとして扱い、D = B + C - A として計算される。ビットマスクが存在する場合、マスク内の値 1
はソースピクセル色をコピー先にコピーすることを示す。マスク内の値 0
はコピー先のピクセル色を変更しないことを示す。マスク矩形がソース矩形やコピー先矩形より小さい場合、関数はマスクパターンを複製する。ソースデバイスコンテキストにはスケーリング、平行移動、反射変換が許可されるが、回転や剪断変換は許可されない。マスクビットマップがモノクロビットマップでない場合、エラーが発生する。必要であれば、ピクセルをどう伸縮するかを決めるためにコピー先デバイスコンテキストのストレッチモードが使用される。拡張メタファイルを記録中にソースデバイスコンテキストが拡張メタファイルデバイスコンテキストを指している場合、エラーが発生する。コピー先座標はコピー先デバイスコンテキストに従って変換され、ソース座標はソースデバイスコンテキストに従って変換される。ソース変換に回転や剪断がある場合、エラーが返される。コピー先とソースの矩形のカラー形式が一致しない場合、PlgBlt
はソース矩形をコピー先矩形に合わせて変換する。すべてのデバイスが PlgBlt 関数をサポートしているわけではない。詳細は
GetDeviceCaps 関数の RC_BITBLT
ラスタケーパビリティの説明を参照。ソースとコピー先のデバイスコンテキストが互換性のないデバイスを表している場合、PlgBlt
はエラーを返す。マルチモニタシステムで使用される場合、hdcSrc と hdcDest
は同じデバイスを参照していなければならず、そうでなければ関数は失敗する。異なるデバイスの DC
間でデータを転送するには、GetDIBits を呼び出してメモリビットマップを DIB に変換する。DIB を 2
台目のデバイスに表示するには、SetDIBits または StretchDIBits を呼び出す。


%index
PolyBezier
PolyBezier 関数は、1 つ以上のベジェ曲線を描画する。
%prm
hdc, apt, cpt
hdc : [intptr] デバイスコンテキストへのハンドル。
apt : [var] 曲線の端点と制御点を含む POINT 構造体の配列へのポインタ(論理単位)。
cpt : [int] lppt 配列内の点の数。各ベジェ曲線は 2 つの制御点と 1 つの端点を必要とし、最初の曲線には追加の始点が必要なため、この値は描画する曲線の数の 3 倍に 1 を加えた値でなければならない。
%inst
PolyBezier 関数は、1 つ以上のベジェ曲線を描画する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
PolyBezier 関数は、lppt パラメータで指定した端点と制御点を使用して 3 次ベジェ曲線を描画する。最初の曲線は、2 番目と
3 番目の点を制御点として使用し、1 番目の点から 4 番目の点まで描画される。続く各曲線にはさらに 3
点ずつ必要で、前の曲線の終点が始点として使用され、次の 2 点が制御点、3 つ目が終点となる。現在位置は PolyBezier
関数では使用も更新もされない。図形は塗りつぶされない。この関数は現在のペンを使用して線を描画する。


%index
PolyBezierTo
PolyBezierTo 関数は、1 つ以上のベジェ曲線を描画する。
%prm
hdc, apt, cpt
hdc : [intptr] デバイスコンテキストへのハンドル。
apt : [var] 端点と制御点を含む POINT 構造体の配列へのポインタ(論理単位)。
cpt : [int] lppt 配列内の点の数。各ベジェ曲線には 2 つの制御点と 1 つの終点が必要なので、この値は描画する曲線数の 3 倍でなければならない。
%inst
PolyBezierTo 関数は、1 つ以上のベジェ曲線を描画する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
この関数は、lppt パラメータで指定した制御点を使用して 3 次ベジェ曲線を描画する。最初の曲線は、最初の 2
点を制御点として、現在位置から 3 番目の点まで描画される。続く各曲線にはさらに 3
点ずつ必要で、関数は前の曲線の終点を次の曲線の始点として使用する。PolyBezierTo
は現在位置を最後のベジェ曲線の終点に移動する。図形は塗りつぶされない。この関数は現在のペンを使用して線を描画する。


%index
PolyDraw
PolyDraw 関数は、一連の線分とベジェ曲線を描画する。
%prm
hdc, apt, aj, cpt
hdc : [intptr] デバイスコンテキストへのハンドル。
apt : [var] 各線分の端点、および各ベジェ曲線の端点と制御点を含む POINT 構造体の配列へのポインタ(論理単位)。
aj : [var] 
cpt : [int] lppt 配列内の点の総数。lpbTypes 配列内のバイト数と同じである。
%inst
PolyDraw 関数は、一連の線分とベジェ曲線を描画する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
PolyDraw 関数は、MoveToEx、LineTo、PolyBezierTo
関数を連続して呼び出す代わりに使用でき、不連続な図形を描画する。線と曲線は現在のペンで描画され、図形は塗りつぶされない。BeginPath
の呼び出しでアクティブなパスが開始されている場合、PolyDraw はそのパスに追加する。lppt 配列と lpbTypes
配列に含まれる点は、各点が MoveTo、LineTo、PolyBezierTo
操作のどれに属するかを示す。図形を閉じることもできる。この関数は現在位置を更新する。


%index
PolyPolygon
PolyPolygon 関数は、複数の閉じたポリゴンを描画する。各ポリゴンは現在のペンで輪郭が描かれ、現在のブラシとポリゴン塗りつぶしモードで塗りつぶされる。この関数で描画されるポリゴンは重なってもよい。
%prm
hdc, apt, asz, csz
hdc : [intptr] デバイスコンテキストへのハンドル。
apt : [var] ポリゴンの頂点を定義する POINT 構造体の配列へのポインタ(論理座標)。ポリゴンは連続して指定される。各ポリゴンは最後の頂点から最初の頂点へ線を引くことで自動的に閉じられる。各頂点は 1 回のみ指定すること。
asz : [var] 整数の配列へのポインタ。各整数は対応するポリゴンの点数を指定する。各整数は 2 以上でなければならない。
csz : [int] ポリゴンの総数。
%inst
PolyPolygon
関数は、複数の閉じたポリゴンを描画する。各ポリゴンは現在のペンで輪郭が描かれ、現在のブラシとポリゴン塗りつぶしモードで塗りつぶされる。この関数で描画されるポリゴンは重なってもよい。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]

現在位置はこの関数では使用も更新もされない。余分な点は無視される。より多くの点でポリゴンを描画するには、データを最大点数未満のグループに分割し、各グループごとに関数を呼び出す。なお、ポリゴンは
1 つのグループにのみ含まれることが望ましい。


%index
PolyPolyline
PolyPolyline 関数は、複数の連続した線分の系列を描画する。
%prm
hdc, apt, asz, csz
hdc : [intptr] デバイスコンテキストへのハンドル。
apt : [var] ポリラインの頂点を含む POINT 構造体の配列へのポインタ(論理単位)。ポリラインは連続して指定される。
asz : [var] 対応するポリラインの lppt 配列内の点数を指定する変数の配列へのポインタ。各エントリは 2 以上でなければならない。
csz : [int] lpdwPolyPoints 配列内のエントリの総数。
%inst
PolyPolyline 関数は、複数の連続した線分の系列を描画する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
線分は現在のペンで描画される。線分で形成される図形は塗りつぶされない。現在位置はこの関数では使用も更新もされない。


%index
PolyTextOutW
PolyTextOut 関数は、指定したデバイスコンテキストに現在選択されているフォントとテキスト色を使用して、複数の文字列を描画する。(Unicode)
%prm
hdc, ppt, nstrings
hdc : [intptr] デバイスコンテキストへのハンドル。
ppt : [var] 描画する文字列を記述する POLYTEXT 構造体の配列へのポインタ。配列には描画する各文字列ごとに 1 つの構造体が含まれる。
nstrings : [int] pptxt 配列内の POLYTEXT 構造体の数。
%inst
PolyTextOut
関数は、指定したデバイスコンテキストに現在選択されているフォントとテキスト色を使用して、複数の文字列を描画する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
各 POLYTEXT 構造体には、Windows が対応する文字列を揃えるために使用する参照点の座標が含まれる。アプリケーションは
SetTextAlign 関数を呼び出すことで、参照点の使い方を指定できる。アプリケーションは GetTextAlign
関数を呼び出すことで、指定したデバイスコンテキストの現在のテキスト配置設定を取得できる。単一のテキスト文字列を描画するには、アプリケーションは
ExtTextOut 関数を呼び出すべきである。**PolyTextOut**
は国際スクリプトサポートを自動的には処理しない。国際スクリプトサポートを得るには、代わりに **ExtTextOut**
を使用する。**ExtTextOut** は必要に応じて
[Uniscribe](/windows/win32/intl/uniscribe)
を使用し、フォントフォールバックを行う。さらに、**ExtTextOut**
はカーネルモードに遷移する前に呼び出しを内部的にバッチ処理するため、**PolyTextOut** と **ExtTextOut**
のパフォーマンスを比較する際の懸念の一部を軽減する。> [!TIP] > 異なる言語の表示を扱えるため、現代的な開発では
**PolyTextOut** より **ExtTextOut** の使用を強く推奨する。> [!NOTE] > wingdi.h
ヘッダーは PolyTextOut を、UNICODE プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または Unicode
版を自動的に選択するエイリアスとして定義している。エンコーディング中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイルエラーや実行時エラーを引き起こす不一致が発生することがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
Polygon
2 つ以上の頂点を直線で結んだ多角形を描画する。多角形は現在のペンで輪郭が描かれ、現在のブラシと多角形塗りつぶしモードで塗りつぶされる。
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
PolylineTo
PolylineTo 関数は、1 本以上の直線を描画する。
%prm
hdc, apt, cpt
hdc : [intptr] デバイスコンテキストへのハンドル。
apt : [var] 線の頂点を含む POINT 構造体の配列へのポインタ(論理単位)。
cpt : [int] 配列内の点数。
%inst
PolylineTo 関数は、1 本以上の直線を描画する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
Polyline 関数とは異なり、PolylineTo 関数は現在位置を使用・更新する。現在のペンを使用して、現在位置から lppt
パラメータで指定された最初の点まで線が引かれる。追加の各線について、関数は前の線の終点から lppt
で指定された次の点まで描画する。PolylineTo
は現在位置を最後の線の終点に移動する。この関数で描画される線分が閉じた図形を形成する場合でも、図形は塗りつぶされない。


%index
PtInRegion
PtInRegion 関数は、指定した点が指定したリージョン内にあるかどうかを判定する。
%prm
hrgn, x, y
hrgn : [intptr] 調査するリージョンへのハンドル。
x : [int] 点の x 座標(論理単位)を指定する。
y : [int] 点の y 座標(論理単位)を指定する。
%inst
PtInRegion 関数は、指定した点が指定したリージョン内にあるかどうかを判定する。

[戻り値]
指定した点がリージョン内にある場合、戻り値は非ゼロである。指定した点がリージョン内にない場合、戻り値はゼロである。


%index
PtVisible
PtVisible 関数は、指定した点がデバイスコンテキストのクリッピング領域内にあるかどうかを判定する。
%prm
hdc, x, y
hdc : [intptr] デバイスコンテキストへのハンドル。
x : [int] 点の x 座標(論理単位)。
y : [int] 点の y 座標(論理単位)。
%inst
PtVisible 関数は、指定した点がデバイスコンテキストのクリッピング領域内にあるかどうかを判定する。

[戻り値]
指定した点がデバイスコンテキストのクリッピング領域内にある場合、戻り値は TRUE(1)
である。指定した点がデバイスコンテキストのクリッピング領域内にない場合、戻り値は FALSE(0) である。HDC が無効な場合、戻り値は
(BOOL)-1 である。


%index
RealizePalette
RealizePalette 関数は、現在の論理パレットのパレットエントリをシステムパレットにマッピングする。
%prm
hdc
hdc : [intptr] 論理パレットが選択されているデバイスコンテキストへのハンドル。
%inst
RealizePalette 関数は、現在の論理パレットのパレットエントリをシステムパレットにマッピングする。

[戻り値]
関数が成功した場合、戻り値はシステムパレットにマッピングされた論理パレット内のエントリ数である。関数が失敗した場合、戻り値は
GDI_ERROR である。

[備考]
アプリケーションは、GetDeviceCaps 関数を呼び出して RASTERCAPS
定数を指定することで、デバイスがパレット操作をサポートしているかを判定できる。RealizePalette
関数は、指定したデバイスコンテキストに関連付けられたデバイスのパレットを変更する。デバイスコンテキストがメモリ DC の場合、DC
に選択されたビットマップのカラーテーブルが変更される。デバイスコンテキストがディスプレイ DC
の場合、そのデバイスの物理パレットが変更される。論理パレットは、カラーを多用するアプリケーションとシステムとの間のバッファとして機能し、これらのアプリケーションが他のウィンドウで表示される色と干渉することなく、必要なだけの色を使用できるようにする。アプリケーションのウィンドウがフォーカスを持ち、RealizePalette
関数を呼び出すと、システムは要求された色のうちできるだけ多くを実現しようとする。アクティブでないウィンドウを持つアプリケーションについても同様である。


%index
RectInRegion
RectInRegion 関数は、指定した矩形の一部がリージョンの境界内にあるかどうかを判定する。
%prm
hrgn, lprect
hrgn : [intptr] リージョンへのハンドル。
lprect : [var] 矩形の座標(論理単位)を含む RECT 構造体へのポインタ。矩形の下端と右端は含まれない。
%inst
RectInRegion 関数は、指定した矩形の一部がリージョンの境界内にあるかどうかを判定する。

[戻り値]

指定した矩形の一部でもリージョンの境界内にあれば、戻り値は非ゼロである。指定した矩形がリージョンの境界内にまったくなければ、戻り値はゼロである。


%index
RectVisible
RectVisible 関数は、指定した矩形の一部がデバイスコンテキストのクリッピング領域内にあるかどうかを判定する。
%prm
hdc, lprect
hdc : [intptr] デバイスコンテキストへのハンドル。
lprect : [var] 指定した矩形の論理座標を含む RECT 構造体へのポインタ。
%inst
RectVisible 関数は、指定した矩形の一部がデバイスコンテキストのクリッピング領域内にあるかどうかを判定する。

[戻り値]
現在の変換に回転がなく矩形がクリッピング領域内にある場合、戻り値は TRUE (1)
である。現在の変換に回転がなく矩形がクリッピング領域内にない場合、戻り値は FALSE (0)
である。現在の変換に回転があり矩形がクリッピング領域内にある場合、戻り値は 2
である。現在の変換に回転があり矩形がクリッピング領域内にない場合、戻り値は 1
である。その他の戻り値はすべてエラーコードと見なされる。いずれかのパラメータが無効な場合、戻り値は未定義である。


%index
Rectangle
矩形を描画する。矩形は現在のペンで輪郭を描かれ、現在のブラシで塗りつぶされる。
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
RemoveFontMemResourceEx
RemoveFontMemResourceEx 関数は、メモリイメージファイルから追加されたフォントを削除する。
%prm
h
h : [intptr] フォントリソースへのハンドル。このハンドルは AddFontMemResourceEx 関数によって返される。
%inst
RemoveFontMemResourceEx 関数は、メモリイメージファイルから追加されたフォントを削除する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報は利用できない。

[備考]
この関数は AddFontMemResourceEx
関数で追加されたフォントを削除する。フォントを削除するには、AddFontMemResourceEx
で使用されたのと同じパスとフラグを指定する。この関数は fh で指定されたフォントのみを削除する。


%index
RemoveFontResourceW
RemoveFontResource 関数は、指定したファイル内のフォントをシステムフォントテーブルから削除する。(Unicode)
%prm
lpFileName
lpFileName : [wstr] フォントリソースファイル名を表す NULL 終端文字列へのポインタ。
%inst
RemoveFontResource 関数は、指定したファイル内のフォントをシステムフォントテーブルから削除する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
アプリがシステムフォントテーブルにフォントを追加または削除した場合、WM_FONTCHANGE
メッセージをシステム内のすべてのトップレベルウィンドウに送信して他のウィンドウに変更を通知することを推奨する。アプリは
SendMessage 関数を hwnd パラメータに HWND_BROADCAST
を設定して呼び出すことでこのメッセージを送信する。フォントへの未参照がある場合、そのフォントを使用しているデバイスコンテキストがなくなるまで、関連リソースはロードされたままになる。さらに、フォントがフォントレジストリ(HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows
NT\CurrentVersion\Fonts)に登録されており、%windir%\fonts\
フォルダ以外の場所にインストールされている場合、他のアクティブなセッション(セッション 0
を含む)にロードされることがある。未参照のあるフォントを含む既存のフォントファイルを置き換えようとすると、RemoveFontResource
を呼び出した後でも、元のフォントが使用中のため削除できないというエラーが発生することがある。アプリケーションがフォントファイルの置き換えを必要とする場合、元のフォントの参照カウントをゼロに減らすために、このサンプルコードのように
RemoveFontResource
をループで呼び出す。エラーが続く場合は、フォントファイルが他のセッションに読み込まれたままであることを示す。フォントがフォントレジストリに登録されていないことを確認し、すべてのセッションからフォントをアンロードするためにシステムを再起動すること。注:
元のフォントファイルを使用しているアプリは、フォントがリロードされるまで元のファイルにアクセスでき、新しいフォントは使用されない。フォントをリロードするには
AddFontResource を呼び出す。このサンプルコードに示すように、RemoveFontResource
が成功した回数と同じ回数だけ AddFontResource を呼び出すことを推奨する。
（以下省略）


%index
RemoveFontResourceExW
RemoveFontResourceEx 関数は、指定したファイル内のフォントをシステムフォントテーブルから削除する。(Unicode)
%prm
name, fl, pdv
name : [wstr] フォントリソースファイル名を表す NULL 終端文字列へのポインタ。
fl : [int] システムから削除するフォントの特性。フォントを削除するには、使用するフラグが AddFontResourceEx 関数でフォントを追加したときと同じでなければならない。詳細は AddFontResourceEx 関数を参照。
pdv : [intptr] 予約済み。0 でなければならない。
%inst
RemoveFontResourceEx 関数は、指定したファイル内のフォントをシステムフォントテーブルから削除する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。拡張エラー情報は利用できない。

[備考]
この関数は、指定されたフラグが AddFontResourceEx
関数でフォントを追加したときと同じ場合にのみフォントを削除する。未参照のあるフォントを含む既存のフォントファイルを置き換えようとすると、RemoveFontResourceEx
を呼び出した後でも、元のフォントが使用中のため削除できないというエラーが発生することがある。アプリケーションがフォントファイルの置き換えを必要とする場合、元のフォントの参照カウントをゼロに減らすために、このサンプルコードのように
RemoveFontResourceEx
をループで呼び出す。エラーが続く場合は、フォントファイルが他のセッションに読み込まれたままであることを示す。フォントがフォントレジストリに登録されていないことを確認し、すべてのセッションからフォントをアンロードするためにシステムを再起動すること。注:
元のフォントファイルを使用しているアプリは、フォントがリロードされるまで元のファイルにアクセスでき、新しいフォントは使用されない。フォントをリロードするには
AddFontResourceEx を呼び出す。このサンプルコードに示すように、RemoveFontResourceEx
が成功した回数と同じ回数だけ AddFontResourceEx を呼び出すことを推奨する。
（以下省略）


%index
ResetDCA
ResetDC 関数は、指定した情報を使用して、指定したプリンタまたはプロッタのデバイスコンテキスト(DC)を更新する。(ANSI)
%prm
hdc, lpdm
hdc : [intptr] 更新する DC へのハンドル。
lpdm : [var] 新しい DC に関する情報を含む DEVMODE 構造体へのポインタ。
%inst
ResetDC 関数は、指定した情報を使用して、指定したプリンタまたはプロッタのデバイスコンテキスト(DC)を更新する。(ANSI)

[戻り値]
関数が成功した場合、戻り値は元の DC へのハンドルである。関数が失敗した場合、戻り値は NULL である。

[備考]
アプリケーションは通常、ウィンドウが WM_DEVMODECHANGE メッセージを受信したときに ResetDC
関数を使用する。ResetDC は、ドキュメントの印刷中に用紙の向きや用紙トレイを変更するためにも使用できる。ResetDC
関数はドライバ名、デバイス名、出力ポートを変更するためには使用できない。ユーザがポート接続やデバイス名を変更した場合、アプリケーションは元の
DC を削除し、新しい情報で新しい DC を作成しなければならない。アプリケーションは情報 DC を ResetDC
関数に渡すことができる。その場合、ResetDC は常にプリンタ DC を返す。ICM: hdc パラメータで指定された DC
のカラープロファイルは、DEVMODE 構造体の lpInitData メンバに含まれる情報に基づいてリセットされる。
> [!NOTE] > wingdi.h ヘッダーは ResetDC を、UNICODE プリプロセッサ定数の定義に基づいてこの関数の
ANSI 版または Unicode
版を自動的に選択するエイリアスとして定義している。エンコーディング中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイルエラーや実行時エラーを引き起こす不一致が発生することがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
ResetDCW
ResetDC 関数は、指定した情報を使用して、指定したプリンタまたはプロッタのデバイスコンテキスト(DC)を更新する。(Unicode)
%prm
hdc, lpdm
hdc : [intptr] 更新する DC へのハンドル。
lpdm : [var] 新しい DC に関する情報を含む DEVMODE 構造体へのポインタ。
%inst
ResetDC 関数は、指定した情報を使用して、指定したプリンタまたはプロッタのデバイスコンテキスト(DC)を更新する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は元の DC へのハンドルである。関数が失敗した場合、戻り値は NULL である。

[備考]
アプリケーションは通常、ウィンドウが WM_DEVMODECHANGE メッセージを受信したときに ResetDC
関数を使用する。ResetDC は、ドキュメントの印刷中に用紙の向きや用紙トレイを変更するためにも使用できる。ResetDC
関数はドライバ名、デバイス名、出力ポートを変更するためには使用できない。ユーザがポート接続やデバイス名を変更した場合、アプリケーションは元の
DC を削除し、新しい情報で新しい DC を作成しなければならない。アプリケーションは情報 DC を ResetDC
関数に渡すことができる。その場合、ResetDC は常にプリンタ DC を返す。ICM: hdc パラメータで指定された DC
のカラープロファイルは、DEVMODE 構造体の lpInitData メンバに含まれる情報に基づいてリセットされる。
> [!NOTE] > wingdi.h ヘッダーは ResetDC を、UNICODE プリプロセッサ定数の定義に基づいてこの関数の
ANSI 版または Unicode
版を自動的に選択するエイリアスとして定義している。エンコーディング中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイルエラーや実行時エラーを引き起こす不一致が発生することがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
ResizePalette
ResizePalette 関数は、指定した値に基づいて論理パレットのサイズを増減する。
%prm
hpal, n
hpal : [intptr] 変更するパレットへのハンドル。
n : [int] リサイズ後のパレットのエントリ数。エントリ数は 1024 に制限される。
%inst
ResizePalette 関数は、指定した値に基づいて論理パレットのサイズを増減する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
アプリケーションは、GetDeviceCaps 関数を呼び出して RASTERCAPS
定数を指定することで、デバイスがパレット操作をサポートしているかを判定できる。アプリケーションがパレットを縮小するために
ResizePalette を呼び出した場合、リサイズ後のパレットに残るエントリは変更されない。アプリケーションがパレットを拡大するために
ResizePalette を呼び出した場合、追加のパレットエントリは黒(赤・緑・青の値がすべて 0)に設定され、そのフラグは 0
に設定される。


%index
RestoreDC
RestoreDC 関数は、デバイスコンテキスト(DC)を指定した状態に復元する。DC は、SaveDC 関数の以前の呼び出しによって作成されたスタックから状態情報をポップすることで復元される。
%prm
hdc, nSavedDC
hdc : [intptr] DC へのハンドル。
nSavedDC : [int] 復元する保存状態。このパラメータが正の場合、nSavedDC は復元する特定の状態インスタンスを表す。このパラメータが負の場合、nSavedDC は現在の状態からの相対インスタンスを表す。たとえば -1 は直近に保存された状態を復元する。
%inst
RestoreDC 関数は、デバイスコンテキスト(DC)を指定した状態に復元する。DC は、SaveDC
関数の以前の呼び出しによって作成されたスタックから状態情報をポップすることで復元される。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
各 DC は保存された状態のスタックを保持する。SaveDC 関数は DC
の現在の状態を保存状態スタックにプッシュする。その状態は作成元と同じ DC
にのみ復元できる。状態が復元されると、保存された状態は破棄され、再利用できない。さらに、復元された状態の作成後に保存された状態もすべて破棄され、使用できなくなる。言い換えると、RestoreDC
関数は状態情報スタックから復元した状態(および後続のすべての状態)をポップする。


%index
RoundRect
RoundRect 関数は、丸い角を持つ矩形を描画する。矩形は現在のペンで輪郭が描かれ、現在のブラシで塗りつぶされる。
%prm
hdc, left, top, right, bottom, width, height
hdc : [intptr] デバイスコンテキストへのハンドル。
left : [int] 矩形の左上隅の x 座標(論理座標)。
top : [int] 矩形の左上隅の y 座標(論理座標)。
right : [int] 矩形の右下隅の x 座標(論理座標)。
bottom : [int] 矩形の右下隅の y 座標(論理座標)。
width : [int] 丸い角を描画するために使用する楕円の幅(論理座標)。
height : [int] 丸い角を描画するために使用する楕円の高さ(論理座標)。
%inst
RoundRect 関数は、丸い角を持つ矩形を描画する。矩形は現在のペンで輪郭が描かれ、現在のブラシで塗りつぶされる。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
現在位置はこの関数では使用も更新もされない。


%index
STROBJ_bEnum
STROBJ_bEnum 関数は、グリフのアイデンティティと位置を列挙する。
%prm
pstro, pc, ppgpos
pstro : [var] GLYPHPOS 情報を含む STROBJ 構造体へのポインタ。
pc : [var] GDI から返される GLYPHPOS 構造体の数を格納するポインタ。
ppgpos : [var] GDI が GLYPHPOS 構造体を書き込む配列へのポインタ。
%inst
STROBJ_bEnum 関数は、グリフのアイデンティティと位置を列挙する。

[戻り値]
列挙するグリフがまだある場合、戻り値は TRUE となる。列挙が完了した場合は FALSE となる。グリフを列挙できない場合、戻り値は
DDI_ERROR となり、エラーコードがログに記録される。

[備考]
ドライバがフォントをキャッシュする場合、グリフハンドルのみをダウンロードすべきである。返される情報は、DrvGetGlyphMode
に対するドライバの戻り値に依存する。ビットマップやアウトラインは FONTOBJ
構造体からも取得できる。プリンタドライバは、プリンタハードウェアが TrueType
フォントの内部レンダリングを提供する場合、STROBJ_bEnum の代わりに STROBJ_bEnumPositionsOnly
を呼ぶべきである。


%index
STROBJ_bEnumPositionsOnly
STROBJ_bEnumPositionsOnly 関数は、指定したテキスト文字列のグリフのアイデンティティと位置を列挙するが、キャッシュ済みグリフビットマップは作成しない。
%prm
pstro, pc, ppgpos
pstro : [var] テキスト文字列を記述する STROBJ 構造体への呼び出し元が提供するポインタ。これは通常、ドライバの DrvTextOut 関数が受け取る STROBJ 構造体である。
pc : [var] ppgpos が指すポインタが指す GLYPHPOS 構造体の数を GDI から受け取る、呼び出し元が提供するアドレス。
ppgpos : [var] GLYPHPOS 構造体の配列への GDI 提供のポインタを受け取る、呼び出し元が提供するアドレス(後述の「解説」セクションを参照)。
%inst
STROBJ_bEnumPositionsOnly
関数は、指定したテキスト文字列のグリフのアイデンティティと位置を列挙するが、キャッシュ済みグリフビットマップは作成しない。

[戻り値]
列挙するグリフがまだある場合、戻り値は TRUE となる。列挙が完了した場合は FALSE となる。グリフを列挙できない場合、戻り値は
DDI_ERROR となり、エラーコードがログに記録される。

[備考]
STROBJ_bEnumPositionsOnly 関数は通常、ドライバの DrvTextOut
関数内から呼び出される。STROBJ_bEnum と同じ動作を実行するが、1 つ重要な違いがある ? GDI
はグリフのキャッシュ済みビットマップを作成しない。STROBJ_bEnum
関数は、ドライバが最終的にこれらのビットマップを必要とすると仮定する。しかし、多くの新しいプリンタは内部ラスタライザを持ち、グリフのレンダリングに
GDI
を必要としない。そのようなプリンタの場合、サーバメモリ内でのグリフビットマップの自動レンダリングとキャッシュを排除することで、処理時間とメモリ割り当ての両方で大幅な節約が得られる。内部グリフラスタライズをサポートするプリンタでは、次のルールに従うべきである:
（以下省略）


%index
STROBJ_bGetAdvanceWidths
STROBJ_bGetAdvanceWidths 関数は、指定した文字列を構成するグリフの推定幅を示すベクトルの配列を取得する。
%prm
pso, iFirst, c, pptqD
pso : [var] テキスト文字列を記述する STROBJ 構造体への呼び出し元が提供するポインタ。これは通常、ドライバの DrvTextOut 関数が受け取る STROBJ 構造体である。
iFirst : [int] STROBJ 構造体で提供されたテキスト文字列へのゼロベースのインデックス。このインデックスは、幅を返す対象となる文字列の最初の文字を表す。呼び出し元が指定する。
c : [int] iFirst で指定された文字から始まる、幅の値を返す連続した文字数。呼び出し元が指定する。
pptqD : [var] (28.36, 28.36) 形式で文字幅を受け取る、c 個の POINTQF 構造体の配列への呼び出し元が提供するポインタ。このデータ型の説明は GDI Data Types を参照。
%inst
STROBJ_bGetAdvanceWidths 関数は、指定した文字列を構成するグリフの推定幅を示すベクトルの配列を取得する。

[戻り値]
操作が成功した場合、関数は TRUE を返す。そうでない場合は FALSE を返す。

[備考]
STROBJ_bGetAdvanceWidths 関数は、STROBJ_bEnum の代わりに
STROBJ_bEnumPositionsOnly を呼び出すプリンタドライバに役立つ。関数は pptqD
配列を文字列のグリフの推定幅で埋め、プリンタのグリフレンダリングハードウェアが正確な文字幅を返さない場合に、プリンタが文字列をレンダリングした後のプリンタ位置を計算するために使用できる。STROBJ_bEnumPositionsOnly
から返されるグリフ位置は、必ずしも STROBJ_bGetAdvanceWidths
から返される幅と正確に対応するわけではないことに注意。


%index
STROBJ_dwGetCodePage
STROBJ_dwGetCodePage 関数は、指定した STROBJ 構造体に関連付けられたコードページを返す。
%prm
pstro
pstro : [var] コードページを関連付ける STROBJ 構造体へのポインタ。
%inst
STROBJ_dwGetCodePage 関数は、指定した STROBJ 構造体に関連付けられたコードページを返す。

[戻り値]
STROBJ_dwGetCodePage は、Win32 API
レベルのテキスト出力呼び出しで使用されたフォントに関連付けられたコードページを識別する DWORD 値を返す。


%index
STROBJ_vEnumStart
STROBJ_vEnumStart 関数は、STROBJ_bEnum への後続呼び出しで GDI から返されるデータの形式(種類)を定義する。
%prm
pstro
pstro : [var] データ形式を定義する STROBJ 構造体へのポインタ。
%inst
STROBJ_vEnumStart 関数は、STROBJ_bEnum への後続呼び出しで GDI
から返されるデータの形式(種類)を定義する。

[戻り値]
なし。

[備考]
この関数は GLYPHPOS 配列の列挙を再開する。この関数はドライバが STROBJ_bEnum を呼び出す前に呼び出すべきである。


%index
SaveDC
SaveDC 関数は、選択されたオブジェクトとグラフィックモード(ビットマップ、ブラシ、パレット、フォント、ペン、リージョン、描画モード、マッピングモードなど)を記述するデータをコンテキストスタックにコピーすることで、指定したデバイスコンテキスト(DC)の現在の状態を保存する。
%prm
hdc
hdc : [intptr] 状態を保存する DC へのハンドル。
%inst
SaveDC
関数は、選択されたオブジェクトとグラフィックモード(ビットマップ、ブラシ、パレット、フォント、ペン、リージョン、描画モード、マッピングモードなど)を記述するデータをコンテキストスタックにコピーすることで、指定したデバイスコンテキスト(DC)の現在の状態を保存する。

[戻り値]
関数が成功した場合、戻り値は保存された状態を識別する。関数が失敗した場合、戻り値はゼロである。

[備考]
SaveDC 関数は、DC 状態の任意のインスタンスを任意の回数保存するために使用できる。保存された状態は RestoreDC
関数で復元できる。


%index
ScaleViewportExtEx
ScaleViewportExtEx 関数は、指定した被乗数と除数で形成される比率を使用して、デバイスコンテキストのビューポートを変更する。
%prm
hdc, xn, dx, yn, yd, lpsz
hdc : [intptr] デバイスコンテキストへのハンドル。
xn : [int] 現在の水平範囲に掛ける値。
dx : [int] 現在の水平範囲を割る値。
yn : [int] 現在の垂直範囲に掛ける値。
yd : [int] 現在の垂直範囲を割る値。
lpsz : [var] 以前のビューポート範囲(デバイス単位)を受け取る SIZE 構造体へのポインタ。lpSize が NULL の場合、このパラメータは使用されない。
%inst
ScaleViewportExtEx
関数は、指定した被乗数と除数で形成される比率を使用して、デバイスコンテキストのビューポートを変更する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
ビューポート範囲は次のように変更される:
（以下省略）


%index
ScaleWindowExtEx
ScaleWindowExtEx 関数は、指定した被乗数と除数で形成される比率を使用して、デバイスコンテキストのウィンドウを変更する。
%prm
hdc, xn, xd, yn, yd, lpsz
hdc : [intptr] デバイスコンテキストへのハンドル。
xn : [int] 現在の水平範囲に掛ける値。
xd : [int] 現在の水平範囲を割る値。
yn : [int] 現在の垂直範囲に掛ける値。
yd : [int] 現在の垂直範囲を割る値。
lpsz : [var] 以前のウィンドウ範囲(論理単位)を受け取る SIZE 構造体へのポインタ。lpSize が NULL の場合、このパラメータは使用されない。
%inst
ScaleWindowExtEx 関数は、指定した被乗数と除数で形成される比率を使用して、デバイスコンテキストのウィンドウを変更する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
ウィンドウ範囲は次のように変更される:
（以下省略）


%index
SelectClipPath
SelectClipPath 関数は、現在のパスをデバイスコンテキストのクリッピング領域として選択し、指定したモードで既存のクリッピング領域と新しい領域を結合する。
%prm
hdc, mode
hdc : [intptr] パスを持つデバイスコンテキストへのハンドル。
mode : [int] 
%inst
SelectClipPath
関数は、現在のパスをデバイスコンテキストのクリッピング領域として選択し、指定したモードで既存のクリッピング領域と新しい領域を結合する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
hdc パラメータで指定されるデバイスコンテキストには、閉じたパスが含まれていなければならない。


%index
SelectClipRgn
SelectClipRgn 関数は、指定したデバイスコンテキストの現在のクリッピング領域としてリージョンを選択する。
%prm
hdc, hrgn
hdc : [intptr] デバイスコンテキストへのハンドル。
hrgn : [intptr] 選択するリージョンへのハンドル。
%inst
SelectClipRgn 関数は、指定したデバイスコンテキストの現在のクリッピング領域としてリージョンを選択する。

[戻り値]
戻り値はリージョンの複雑度を指定し、次のいずれかの値となる。
（以下省略）

[備考]

選択されたリージョンのコピーのみが使用される。リージョン自体は他の任意の数のデバイスコンテキストに対して選択でき、また削除することもできる。SelectClipRgn
関数は、リージョンの座標がデバイス単位で指定されていると想定する。デバイスコンテキストのクリッピング領域を解除するには、NULL
のリージョンハンドルを指定する。


%index
SelectObject
指定されたデバイスコンテキスト(DC)にオブジェクトを選択する。新しいオブジェクトは同じ型の以前のオブジェクトを置き換える。
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
SelectPalette
SelectPalette 関数は、指定した論理パレットをデバイスコンテキストに選択する。
%prm
hdc, hPal, bForceBkgd
hdc : [intptr] デバイスコンテキストへのハンドル。
hPal : [intptr] 選択する論理パレットへのハンドル。
bForceBkgd : [int] 論理パレットを強制的に背景パレットにするかどうかを指定する。この値が TRUE の場合、RealizePalette 関数は論理パレットを物理パレット内の既存の色にできるだけ良い形でマッピングする。パレットが実現されるウィンドウがアクティブフォーカスを持たないスレッドに属していても、これは常に行われる。この値が FALSE の場合、RealizePalette はアプリケーションがフォアグラウンドにあるときに論理パレットをデバイスパレットにコピーする(hdc パラメータがメモリデバイスコンテキストの場合、このパラメータは無視される)。
%inst
SelectPalette 関数は、指定した論理パレットをデバイスコンテキストに選択する。

[戻り値]
関数が成功した場合、戻り値はデバイスコンテキストの以前の論理パレットへのハンドルである。関数が失敗した場合、戻り値は NULL である。

[備考]
アプリケーションは、GetDeviceCaps 関数を呼び出して RASTERCAPS
定数を指定することで、デバイスがパレット操作をサポートしているかを判定できる。アプリケーションは、デバイスコンテキストが互換性を持つ場合にのみ、論理パレットを複数のデバイスコンテキストに選択できる。そうでない場合
SelectPalette
は失敗する。別のデバイスコンテキストと互換性のあるデバイスコンテキストを作成するには、最初のデバイスコンテキストを引数として
CreateCompatibleDC
を呼び出す。論理パレットが複数のデバイスコンテキストに選択されている場合、論理パレットへの変更は、それが選択されているすべてのデバイスコンテキストに影響する。トップレベルウィンドウの子ウィンドウがそれぞれ独自のパレットを実現する場合、アプリケーションは
bForceBackground パラメータを TRUE にして SelectPalette
関数を呼び出すことがある。ただし、パレットを実現する必要がある子ウィンドウのみが bForceBackground を TRUE
に設定しなければならず、他の子ウィンドウはこの値を FALSE に設定しなければならない。


%index
SetAbortProc
SetAbortProc 関数は、スプール中に印刷ジョブをキャンセルできるようにするアプリケーション定義の中止関数を設定する。
%prm
hdc, proc
hdc : [intptr] 印刷ジョブのデバイスコンテキストへのハンドル。
proc : [int] アプリケーション定義の中止関数へのポインタ。コールバック関数の詳細は AbortProc コールバック関数を参照。
%inst
SetAbortProc 関数は、スプール中に印刷ジョブをキャンセルできるようにするアプリケーション定義の中止関数を設定する。

[戻り値]
関数が成功した場合、戻り値はゼロより大きい値である。関数が失敗した場合、戻り値は SP_ERROR である。

[備考]
注:
これはブロッキングまたは同期関数であり、すぐに返らない可能性がある。この関数がどれだけ早く返るかは、ネットワーク状態、印刷サーバの設定、プリンタドライバの実装といった、アプリケーションの作成時に予測が難しい実行時要因に依存する。ユーザインターフェイスとの対話を管理するスレッドからこの関数を呼び出すと、アプリケーションが応答しないように見えることがある。


%index
SetArcDirection
SetArcDirection 関数は、円弧と矩形関数に使用する描画方向を設定する。
%prm
hdc, dir
hdc : [intptr] デバイスコンテキストへのハンドル。
dir : [int] 
%inst
SetArcDirection 関数は、円弧と矩形関数に使用する描画方向を設定する。

[戻り値]
関数が成功した場合、戻り値は以前の円弧方向を指定する。関数が失敗した場合、戻り値はゼロである。

[備考]
デフォルトの方向は反時計回りである。SetArcDirection 関数は、次の関数が描画する方向を指定する:
（以下省略）


%index
SetBitmapBits
SetBitmapBits 関数は、ビットマップのカラーデータのビットを指定した値に設定する。
%prm
hbm, cb, pvBits
hbm : [intptr] 設定するビットマップへのハンドル。これは互換ビットマップ(DDB)でなければならない。
cb : [int] lpBits パラメータが指すバイト数。
pvBits : [intptr] 指定したビットマップのカラーデータを含むバイト配列へのポインタ。
%inst
SetBitmapBits 関数は、ビットマップのカラーデータのビットを指定した値に設定する。

[戻り値]
関数が成功した場合、戻り値はビットマップビットの設定に使用されたバイト数である。関数が失敗した場合、戻り値はゼロである。

[備考]
lpBits で指定される配列は WORD 整列されている必要がある。


%index
SetBitmapDimensionEx
SetBitmapDimensionEx 関数は、ビットマップに優先寸法を割り当てる。これらの寸法はアプリケーションが使用できるが、システムは使用しない。
%prm
hbm, w, h, lpsz
hbm : [intptr] ビットマップへのハンドル。このビットマップは DIB セクションビットマップであってはならない。
w : [int] ビットマップの幅(0.1 ミリメートル単位)。
h : [int] ビットマップの高さ(0.1 ミリメートル単位)。
lpsz : [var] ビットマップの以前の寸法を受け取る SIZE 構造体へのポインタ。このポインタは NULL でもよい。
%inst
SetBitmapDimensionEx
関数は、ビットマップに優先寸法を割り当てる。これらの寸法はアプリケーションが使用できるが、システムは使用しない。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
アプリケーションは、SetBitmapDimensionEx
関数でビットマップに割り当てられた寸法を、GetBitmapDimensionEx 関数を呼び出して取得できる。hBitmap
で指定されるビットマップは、CreateDIBSection 関数で作成された DIB セクションであってはならない。ビットマップが
DIB セクションの場合、SetBitmapDimensionEx 関数は失敗する。


%index
SetBkColor
現在の背景色を指定された色値、またはデバイスが指定値を表現できない場合は最も近い物理色に設定する。
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
SetBoundsRect
SetBoundsRect 関数は、指定したデバイスコンテキストのバウンディング矩形情報の蓄積を制御する。
%prm
hdc, lprect, flags
hdc : [intptr] バウンディング矩形を蓄積するデバイスコンテキストへのハンドル。
lprect : [var] バウンディング矩形を設定するために使用する RECT 構造体へのポインタ。矩形の寸法は論理座標で指定する。このパラメータは NULL でもよい。
flags : [int] 
%inst
SetBoundsRect 関数は、指定したデバイスコンテキストのバウンディング矩形情報の蓄積を制御する。

[戻り値]
関数が成功した場合、戻り値はバウンディング矩形の以前の状態を指定する。この状態は次の値の組み合わせとなる。
（以下省略）

[備考]
DCB_SET 値は DCB_ACCUMULATE と DCB_RESET のビット値の組み合わせである。DCB_RESET
ビットをチェックしてバウンディング矩形が空かどうかを判定するアプリケーションは、DCB_ACCUMULATE
ビットもチェックしなければならない。バウンディング矩形が空なのは、DCB_RESET ビットが 1 で DCB_ACCUMULATE
ビットが 0 の場合のみである。


%index
SetBrushOrgEx
SetBrushOrgEx 関数は、アプリケーションが指定したデバイスコンテキストに次に選択するブラシに GDI が割り当てるブラシ原点を設定する。
%prm
hdc, x, y, lppt
hdc : [intptr] デバイスコンテキストへのハンドル。
x : [int] 新しいブラシ原点の x 座標(デバイス単位)。この値がブラシの幅より大きい場合、その値はモジュロ演算子(nXOrg mod ブラシ幅)を使用して縮小される。
y : [int] 新しいブラシ原点の y 座標(デバイス単位)。この値がブラシの高さより大きい場合、その値はモジュロ演算子(nYOrg mod ブラシ高さ)を使用して縮小される。
lppt : [var] 以前のブラシ原点を受け取る POINT 構造体へのポインタ。以前のブラシ原点が不要な場合、このパラメータは NULL でもよい。
%inst
SetBrushOrgEx 関数は、アプリケーションが指定したデバイスコンテキストに次に選択するブラシに GDI
が割り当てるブラシ原点を設定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
ブラシは、システムが塗りつぶされた図形の内部を塗るために使用するビットマップである。ブラシ原点は、ビットマップ内の 1
ピクセルの位置を指定する座標のペアである。デフォルトのブラシ原点座標は (0,0) である。水平座標の場合、値 0
はピクセルの最左列に対応し、幅は最右列に対応する。垂直座標の場合、値 0
はピクセルの最上行に対応し、高さは最下行に対応する。システムはウィンドウ管理のすべてのデバイスコンテキストの原点を自動的に追跡し、サーフェス上のパターンの位置合わせを維持するために必要に応じてブラシを調整する。この呼び出しで設定されるブラシ原点は、クライアント領域の左上隅からの相対位置である。アプリケーションは、SetStretchBltMode
を使用してビットマップストレッチモードを HALFTONE に設定した後に SetBrushOrgEx
を呼び出すべきである。これはブラシの位置ずれを避けるために行う必要がある。システムはウィンドウ管理のすべてのデバイスコンテキストの原点を自動的に追跡し、サーフェス上のパターンの位置合わせを維持するために必要に応じてブラシを調整する。


%index
SetColorAdjustment
SetColorAdjustment 関数は、指定した値を使用してデバイスコンテキスト(DC)のカラー調整値を設定する。
%prm
hdc, lpca
hdc : [intptr] デバイスコンテキストへのハンドル。
lpca : [var] カラー調整値を含む COLORADJUSTMENT 構造体へのポインタ。
%inst
SetColorAdjustment 関数は、指定した値を使用してデバイスコンテキスト(DC)のカラー調整値を設定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
カラー調整値は、HALFTONE モードが設定されているときに StretchBlt および StretchDIBits
関数を呼び出した際のソースビットマップの入力カラーを調整するために使用される。


%index
SetColorSpace
SetColorSpace 関数は、指定したデバイスコンテキストの入力カラースペースを定義する。
%prm
hdc, hcs
hdc : [intptr] デバイスコンテキストへのハンドルを指定する。
hcs : [intptr] 設定するカラースペースへのハンドルを識別する。
%inst
SetColorSpace 関数は、指定したデバイスコンテキストの入力カラースペースを定義する。

[戻り値]
この関数が成功した場合、戻り値は置き換えられる hColorSpace へのハンドルである。この関数が失敗した場合、戻り値は NULL
である。


%index
SetDCBrushColor
SetDCBrushColor 関数は、現在のデバイスコンテキスト(DC)のブラシ色を指定したカラー値に設定する。デバイスが指定したカラー値を表現できない場合、色は最も近い物理色に設定される。
%prm
hdc, color
hdc : [intptr] DC へのハンドル。
color : [int] 新しいブラシの色。
%inst
SetDCBrushColor
関数は、現在のデバイスコンテキスト(DC)のブラシ色を指定したカラー値に設定する。デバイスが指定したカラー値を表現できない場合、色は最も近い物理色に設定される。

[戻り値]
関数が成功した場合、戻り値は以前の DC ブラシ色を COLORREF 値として指定する。関数が失敗した場合、戻り値は
CLR_INVALID である。

[備考]
ストック DC_BRUSH が DC に選択されている場合、ストックブラシが選択解除されるまで、以降のすべての描画は DC
ブラシの色を使用して行われる。デフォルトの DC_BRUSH の色は白である。関数は、ストックブラシ DC_BRUSH が DC
に選択されていなくても、以前の DC_BRUSH の色を返す。ただし、これはストック DC_BRUSH が DC
に選択されるまで描画操作で使用されない。DC_BRUSH または DC_PEN を引数とする GetStockObject
関数は、SetDCPenColor および SetDCBrushColor 関数と相互に置き換えて使用できる。ICM: ICM
が有効な場合、カラー管理が実行される。


%index
SetDCPenColor
SetDCPenColor 関数は、現在のデバイスコンテキスト(DC)のペン色を指定したカラー値に設定する。デバイスが指定したカラー値を表現できない場合、色は最も近い物理色に設定される。
%prm
hdc, color
hdc : [intptr] DC へのハンドル。
color : [int] 新しいペンの色。
%inst
SetDCPenColor
関数は、現在のデバイスコンテキスト(DC)のペン色を指定したカラー値に設定する。デバイスが指定したカラー値を表現できない場合、色は最も近い物理色に設定される。

[戻り値]
関数が成功した場合、戻り値は以前の DC ペン色を COLORREF 値として指定する。関数が失敗した場合、戻り値は
CLR_INVALID である。

[備考]
関数は、ストックペン DC_PEN が DC に選択されていなくても、以前の DC_PEN の色を返す。ただし、これはストック
DC_PEN が DC に選択されるまで描画操作で使用されない。DC_BRUSH または DC_PEN を引数とする
GetStockObject 関数は、SetDCPenColor および SetDCBrushColor
関数と相互に置き換えて使用できる。ICM: ICM が有効な場合、カラー管理が実行される。


%index
SetDIBColorTable
SetDIBColorTable 関数は、指定したデバイスコンテキストに現在選択されている DIB のカラーテーブル内の範囲のエントリに、RGB(赤、緑、青)カラー値を設定する。
%prm
hdc, iStart, cEntries, prgbq
hdc : [intptr] デバイスコンテキスト。このデバイスコンテキストに DIB が選択されていなければならない。
iStart : [int] 設定する最初のカラーテーブルエントリを指定するゼロベースのカラーテーブルインデックス。
cEntries : [int] 設定するカラーテーブルのエントリ数。
prgbq : [var] DIB のカラーテーブル用の新しいカラー情報を含む RGBQUAD 構造体の配列へのポインタ。
%inst
SetDIBColorTable 関数は、指定したデバイスコンテキストに現在選択されている DIB
のカラーテーブル内の範囲のエントリに、RGB(赤、緑、青)カラー値を設定する。

[戻り値]
関数が成功した場合、戻り値は関数が設定したカラーテーブルのエントリ数である。関数が失敗した場合、戻り値はゼロである。

[備考]
この関数は、1、4、または 8 bpp を使用する DIB
のカラーテーブルを設定するために呼び出すべきである。ビットマップに関連付けられた BITMAPINFOHEADER 構造体の
BitCount メンバがビット/ピクセル数を指定する。biBitCount 値が 8
を超えるデバイス独立ビットマップはカラーテーブルを持たない。ビットマップに関連付けられた BITMAPV5HEADER 構造体の
bV5BitCount メンバがビット/ピクセル数を指定する。bV5BitCount 値が 8
を超えるデバイス独立ビットマップはカラーテーブルを持たない。ICM: カラー管理は実行されない。


%index
SetDIBits
指定された DIB の色データを使用して互換ビットマップ(DDB)のピクセルを設定する。
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
SetDIBitsToDevice
SetDIBitsToDevice 関数は、DIB、JPEG、または PNG 画像のカラーデータを使用して、コピー先デバイスコンテキストに関連付けられたデバイス上の指定矩形内のピクセルを設定する。
%prm
hdc, xDest, yDest, w, h, xSrc, ySrc, StartScan, cLines, lpvBits, lpbmi, ColorUse
hdc : [intptr] デバイスコンテキストへのハンドル。
xDest : [int] コピー先矩形の左上隅の x 座標(論理単位)。
yDest : [int] コピー先矩形の左上隅の y 座標(論理単位)。
w : [int] 画像の幅(論理単位)。
h : [int] 画像の高さ(論理単位)。
xSrc : [int] 画像の左下隅の x 座標(論理単位)。
ySrc : [int] 画像の左下隅の y 座標(論理単位)。
StartScan : [int] 画像内の開始スキャンライン。
cLines : [int] lpvBits パラメータが指す配列に含まれる DIB スキャンラインの数。
lpvBits : [intptr] バイト配列として格納されたカラーデータへのポインタ。詳細は後述の「解説」セクションを参照。
lpbmi : [var] DIB に関する情報を含む BITMAPINFO 構造体へのポインタ。
ColorUse : [int] BITMAPINFO 構造体の bmiColors メンバが明示的な赤、緑、青 (RGB) 値を含むか、パレットへのインデックスを含むかを示す。詳細は後述の「解説」セクションを参照。
%inst
SetDIBitsToDevice 関数は、DIB、JPEG、または PNG
画像のカラーデータを使用して、コピー先デバイスコンテキストに関連付けられたデバイス上の指定矩形内のピクセルを設定する。

[戻り値]
関数が成功した場合、戻り値は設定されたスキャンラインの数である。スキャンラインが 0 設定された場合(dwHeight が 0
のときなど)、あるいは関数が失敗した場合、関数は 0 を返す。ドライバが SetDIBitsToDevice に渡された JPEG または
PNG ファイル画像をサポートできない場合、関数は失敗して GDI_ERROR を返す。失敗した場合、アプリケーションは独自の JPEG
または PNG サポートにフォールバックして画像をビットマップに展開し、そのビットマップを SetDIBitsToDevice
に渡す必要がある。

[備考]
最適なビットマップ描画速度は、ビットマップビットがシステムパレットへのインデックスである場合に得られる。アプリケーションは
GetSystemPaletteEntries
関数を呼び出してシステムパレットの色とインデックスを取得できる。色とインデックスを取得した後、アプリケーションは DIB
を作成できる。システムパレットの詳細は Colors を参照。RLE 圧縮ビットマップを除いて、スキャンラインは DWORD
に整列しなければならない。ボトムアップ DIB の原点はビットマップの左下隅であり、トップダウン DIB の原点は左上隅である。大きな
DIB のビットをデバイスサーフェスに設定するために必要なメモリ量を減らすには、アプリケーションは SetDIBitsToDevice
を繰り返し呼び出し、毎回 lpvBits 配列にビットマップの異なる部分を配置することで、出力を帯状化できる。uStartScan と
cScanLines パラメータの値は、lpvBits 配列に含まれるビットマップの部分を識別する。SetDIBitsToDevice
関数は、フォアグラウンドでフルスクリーンの MS-DOS
セッションが実行されているときに、バックグラウンドで実行されているプロセスから呼び出された場合、エラーを返す。
（以下省略）


%index
SetDeviceGammaRamp
SetDeviceGammaRamp 関数は、ハードウェアでダウンロード可能なガンマランプをサポートするドライバを持つダイレクトカラー表示ボード上にガンマランプを設定する。
%prm
hdc, lpRamp
hdc : [intptr] 対象のダイレクトカラー表示ボードのデバイスコンテキストを指定する。
lpRamp : [intptr] 設定するガンマランプを含むバッファへのポインタ。ガンマランプは、それぞれ 256 の WORD 要素を持つ 3 つの配列で指定され、フレームバッファ内の RGB 値とデジタルアナログコンバータ(DAC)値の間のマッピングを含む。配列の順序は赤、緑、青である。DAC の独立性を高めるため、RGB 値は各 WORD の最上位ビットに格納されていなければならない。
%inst
SetDeviceGammaRamp
関数は、ハードウェアでダウンロード可能なガンマランプをサポートするドライバを持つダイレクトカラー表示ボード上にガンマランプを設定する。

[戻り値]
この関数が成功した場合、戻り値は TRUE である。この関数が失敗した場合、戻り値は FALSE である。

[備考]
ダイレクトカラー表示モードはカラールックアップテーブルを使用せず、通常 16、24、または 32
ビットである。すべてのダイレクトカラービデオボードがロード可能なガンマランプをサポートしているわけではない。SetDeviceGammaRamp
は、ハードウェアでダウンロード可能なガンマランプをサポートするドライバを持つデバイスでのみ成功する。> [!NOTE] > この API
は実行に自明でない時間を要することがある。一部のハードウェアでは返るのに 200ms かかることもある。


%index
SetEnhMetaFileBits
SetEnhMetaFileBits 関数は、指定したデータからメモリベースの拡張形式メタファイルを作成する。
%prm
nSize, pb
nSize : [int] 提供されたデータのサイズ(バイト単位)を指定する。
pb : [var] 拡張メタファイルデータを含むバッファへのポインタ(バッファ内のデータは GetEnhMetaFileBits 関数を呼び出して取得されたと想定される)。
%inst
SetEnhMetaFileBits 関数は、指定したデータからメモリベースの拡張形式メタファイルを作成する。

[戻り値]
関数が成功した場合、戻り値はメモリベースの拡張メタファイルへのハンドルである。関数が失敗した場合、戻り値は NULL である。

[備考]
アプリケーションが拡張メタファイルハンドルを必要としなくなったら、DeleteEnhMetaFile
関数を呼び出してハンドルを削除するべきである。SetEnhMetaFileBits 関数は Windows
形式のメタファイルデータを受け付けない。Windows 形式メタファイルをインポートするには、SetWinMetaFileBits
関数を使用する。


%index
SetGraphicsMode
SetGraphicsMode 関数は、指定したデバイスコンテキストのグラフィックスモードを設定する。
%prm
hdc, iMode
hdc : [intptr] デバイスコンテキストへのハンドル。
iMode : [int] 
%inst
SetGraphicsMode 関数は、指定したデバイスコンテキストのグラフィックスモードを設定する。

[戻り値]
関数が成功した場合、戻り値は古いグラフィックスモードである。関数が失敗した場合、戻り値はゼロである。

[備考]
グラフィックスモードによってグラフィックス出力が異なる領域は 3 つある:
（以下省略）


%index
SetICMMode
SetICMMode 関数は、指定したデバイスコンテキスト(DC)上でイメージカラーマネジメントを有効化、無効化、または問い合わせる。
%prm
hdc, mode
hdc : [intptr] デバイスコンテキストへのハンドルを識別する。
mode : [int] イメージカラーマネジメントをオンまたはオフにする。このパラメータは次の定数値のいずれかを取ることができる。
%inst
SetICMMode 関数は、指定したデバイスコンテキスト(DC)上でイメージカラーマネジメントを有効化、無効化、または問い合わせる。

[戻り値]
この関数が成功した場合、戻り値は非ゼロ値である。この関数が失敗した場合、戻り値はゼロである。ICM_QUERY
が指定されて関数が成功した場合、返される非ゼロ値は現在のモードを示す ICM_ON または ICM_OFF である。

[備考]
システムがデバイスの状態に一致する ICC カラープロファイルを見つけられない場合、SetICMMode
は失敗してゼロを返す。デバイスコンテキスト(DC)に対して WCS が有効になると、ほとんどの Win32 API 関数を使って DC
に渡される色はカラーマッチングされる。主な例外は BitBlt と StretchBlt である。ある DC から別の DC
へのビットブロック転送(blit)を行う場合、2 つの DC
はすでに互換性があり、カラー補正は必要ないと仮定される。そうでない場合、カラー補正が実行されることがある。具体的には、デバイス独立ビットマップ(DIB)を
blit のソースとして使用し、blit を WCS が有効な DC
に行う場合、カラーマッチングが実行される。これが望ましくない場合、BitBlt または StretchBlt を呼ぶ前に
SetICMMode を呼び出して、コピー先 DC の WCS をオフにする。CreateCompatibleDC 関数を使用して DC
内にビットマップを作成する場合、ビットマップは 2 回カラーマッチングされる可能性がある。1 回は作成時、もう 1 回は blit
が実行されるときである。理由は、CreateCompatibleDC 関数で作成された DC 内のビットマップは、ソース DC
の現在のブラシ、ペン、パレットを取得するためである。しかし、新しい DC では WCS がデフォルトで無効になる。その後
SetICMMode 関数を使って新しい DC で WCS を有効にすると、カラー補正が行われる。CreateCompatibleDC
関数の使用による二重のカラー補正を防ぐには、CreateCompatibleDC 関数を呼び出す前に SetICMMode
関数を使って、ソース DC の WCS をオフにする。プリンタ DC から互換 DC
が作成されるとき(CreateCompatibleDC を参照)、プリンタ DC
に対して有効であれば、デフォルトでカラーマッチングが常に実行される。SetDIBitsToDevice または StretchDIBits
を使用してプリンタ DC に blit
を実行する場合、プリンタのデフォルトカラープロファイルが使用される。これが望ましくない場合、SetDIBitsToDevice または
StretchDIBits を呼ぶ前に SetICMMode を呼び出して、プリンタ DC の WCS をオフにする。また、WCS
を有効にしてプリンタ DC に印刷する場合、StartPage 関数の各呼び出しの後に WCS を再度オンにするために
SetICMMode 関数を呼ぶ必要がある。StartPage 関数は RestoreDC と SaveDC
関数を呼び出し、その結果プリンタ DC の WCS がオフになる。


%index
SetICMProfileW
SetICMProfile 関数は、指定したカラープロファイルを指定したデバイスコンテキスト(DC)の出力プロファイルとして設定する。(Unicode)
%prm
hdc, lpFileName
hdc : [intptr] カラープロファイルを設定するデバイスコンテキストを指定する。
lpFileName : [wstr] 設定するカラープロファイルのパス名を指定する。
%inst
SetICMProfile
関数は、指定したカラープロファイルを指定したデバイスコンテキスト(DC)の出力プロファイルとして設定する。(Unicode)

[戻り値]
この関数が成功した場合、戻り値は TRUE である。この関数が失敗した場合、戻り値は FALSE である。

[備考]
SetICMProfile
は、カラープロファイルをデバイスコンテキストに関連付ける。そのデバイスコンテキストの出力プロファイルとなる。カラープロファイルは特定のデバイスに関連付けられている必要はない。sRGB
のようなデバイス独立プロファイルも使用できる。カラープロファイルがハードウェアデバイスに関連付けられていない場合、GetICMProfile
からは返されるが、EnumICMProfiles からは返されない。Windows 95 以降では、プリンタ用の PostScript
デバイスドライバは CMYK カラーモデルを想定していることに注意。したがって、すべての PostScript プリンタは CMYK
カラープロファイルを使用しなければならない。Windows 2000 にはこの制限はない。SetICMProfile は互換 DC では
RGB プロファイルのみをサポートする。Windows 95/98/Me: SetICMProfileW は Microsoft
Layer for Unicode でサポートされる。これを使用するには、「Microsoft Layer for Unicode on
Windows 95/98/Me Systems」の概要に従って、特定のファイルをアプリケーションに追加しなければならない。
> [!NOTE] > wingdi.h ヘッダーは SetICMProfile を、UNICODE
プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または Unicode
版を自動的に選択するエイリアスとして定義している。エンコーディング中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイルエラーや実行時エラーを引き起こす不一致が発生することがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
SetLayout
SetLayout 関数は、デバイスコンテキスト(DC)のレイアウトを変更する。
%prm
hdc, l
hdc : [intptr] DC へのハンドル。
l : [int] 
%inst
SetLayout 関数は、デバイスコンテキスト(DC)のレイアウトを変更する。

[戻り値]
関数が成功した場合、DC の以前のレイアウトを返す。関数が失敗した場合、GDI_ERROR を返す。

[備考]

レイアウトは、ウィンドウまたはデバイスコンテキスト内でテキストとグラフィックスがどの順序で現れるかを指定する。デフォルトは左から右である。SetLayout
関数はこれを右から左に変更する。これはアラビア語やヘブライ語の文化における標準である。LAYOUT_RTL
フラグが選択されると、通常右または左を指定するフラグは反転される。混乱を避けるため、次の表に示すような標準フラグの代替語を定義することを検討すること。
（以下省略）


%index
SetMapMode
SetMapMode 関数は、指定したデバイスコンテキストのマッピングモードを設定する。マッピングモードは、ページ空間単位をデバイス空間単位に変換するための測定単位を定義し、デバイスの x 軸と y 軸の方向も定義する。
%prm
hdc, iMode
hdc : [intptr] デバイスコンテキストへのハンドル。
iMode : [int] 
%inst
SetMapMode
関数は、指定したデバイスコンテキストのマッピングモードを設定する。マッピングモードは、ページ空間単位をデバイス空間単位に変換するための測定単位を定義し、デバイスの
x 軸と y 軸の方向も定義する。

[戻り値]
関数が成功した場合、戻り値は以前のマッピングモードを識別する。関数が失敗した場合、戻り値はゼロである。

[備考]
MM_TEXT
モードは、アプリケーションがデバイスピクセル(サイズはデバイスによって異なる)で作業できるようにする。MM_HIENGLISH、MM_HIMETRIC、MM_LOENGLISH、MM_LOMETRIC、MM_TWIPS
モードは、物理的に意味のある単位(インチやミリメートルなど)で描画するアプリケーションに有用である。MM_ISOTROPIC モードは
1:1 のアスペクト比を保証する。MM_ANISOTROPIC モードは x 座標と y 座標を独立に調整できるようにする。


%index
SetMapperFlags
SetMapperFlags 関数は、フォントマッパーが論理フォントを物理フォントにマッピングする際に使用するアルゴリズムを変更する。
%prm
hdc, flags
hdc : [intptr] フォントマッパーフラグを含むデバイスコンテキストへのハンドル。
flags : [int] フォントマッパーがフォントのアスペクト比を現在のデバイスのアスペクト比に合わせるよう試みるかどうかを指定する。ビット 0 がセットされている場合、マッパーは一致するフォントのみを選択する。
%inst
SetMapperFlags 関数は、フォントマッパーが論理フォントを物理フォントにマッピングする際に使用するアルゴリズムを変更する。

[戻り値]
関数が成功した場合、戻り値はフォントマッパーフラグの以前の値である。関数が失敗した場合、戻り値は GDI_ERROR である。

[備考]
dwFlag パラメータが設定され、一致するフォントが存在しない場合、Windows
は新しいアスペクト比を選択し、その比率に一致するフォントを取得する。dwFlag パラメータの残りのビットは 0 でなければならない。


%index
SetMetaFileBitsEx
SetMetaFileBitsEx 関数は、指定したデータからメモリベースの Windows 形式メタファイルを作成する。
%prm
cbBuffer, lpData
cbBuffer : [int] Windows 形式メタファイルのサイズ(バイト単位)を指定する。
lpData : [var] Windows 形式メタファイルを含むバッファへのポインタ(データは GetMetaFileBitsEx 関数を使って取得されたと想定される)。
%inst
SetMetaFileBitsEx 関数は、指定したデータからメモリベースの Windows 形式メタファイルを作成する。

[戻り値]
関数が成功した場合、戻り値はメモリベースの Windows 形式メタファイルへのハンドルである。関数が失敗した場合、戻り値は NULL
である。

[備考]
Windows 形式メタファイルを拡張形式メタファイルに変換するには、SetWinMetaFileBits
関数を使用する。アプリケーションが SetMetaFileBitsEx
で返されたメタファイルハンドルを必要としなくなったら、DeleteMetaFile 関数を呼び出して削除すべきである。


%index
SetMetaRgn
SetMetaRgn 関数は、指定したデバイスコンテキストの現在のクリッピング領域を現在のメタリージョンと交差させ、その結合されたリージョンを指定したデバイスコンテキストの新しいメタリージョンとして保存する。
%prm
hdc
hdc : [intptr] デバイスコンテキストへのハンドル。
%inst
SetMetaRgn
関数は、指定したデバイスコンテキストの現在のクリッピング領域を現在のメタリージョンと交差させ、その結合されたリージョンを指定したデバイスコンテキストの新しいメタリージョンとして保存する。

[戻り値]
戻り値は新しいクリッピング領域の複雑度を指定し、次のいずれかの値となる。
（以下省略）

[備考]
デバイスコンテキストの現在のクリッピング領域は、そのクリッピング領域とメタリージョンの交差部分によって定義される。SetMetaRgn
関数は、アプリケーションの元のデバイスコンテキストが SaveDC 関数を呼び出して保存された後にのみ呼び出すべきである。


%index
SetMiterLimit
SetMiterLimit 関数は、指定したデバイスコンテキストのマイタ結合の長さの制限を設定する。
%prm
hdc, limit, old
hdc : [intptr] デバイスコンテキストへのハンドル。
limit : [float] デバイスコンテキストの新しいマイタ制限を指定する。
old : [var] 以前のマイタ制限を受け取る浮動小数点値へのポインタ。このパラメータが NULL の場合、以前のマイタ制限は返されない。
%inst
SetMiterLimit 関数は、指定したデバイスコンテキストのマイタ結合の長さの制限を設定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]

マイタ長は、結合部の内側にある線の壁の交点から結合部の外側にある線の壁の交点までの距離として定義される。マイタ制限は、マイタ長と線の幅の最大許容比率である。デフォルトのマイタ制限は
10.0 である。注: eNewLimit を 1.0f 未満の浮動小数点値に設定すると、関数は失敗する。


%index
SetPaletteEntries
SetPaletteEntries 関数は、論理パレット内の範囲のエントリに RGB(赤、緑、青)カラー値とフラグを設定する。
%prm
hpal, iStart, cEntries, pPalEntries
hpal : [intptr] 論理パレットへのハンドル。
iStart : [int] 設定する最初の論理パレットエントリ。
cEntries : [int] 設定する論理パレットエントリの数。
pPalEntries : [var] RGB 値とフラグを含む PALETTEENTRY 構造体の配列の最初のメンバへのポインタ。
%inst
SetPaletteEntries 関数は、論理パレット内の範囲のエントリに RGB(赤、緑、青)カラー値とフラグを設定する。

[戻り値]
関数が成功した場合、戻り値は論理パレットに設定されたエントリ数である。関数が失敗した場合、戻り値はゼロである。

[備考]
アプリケーションは、GetDeviceCaps 関数を呼び出して RASTERCAPS
定数を指定することで、デバイスがパレット操作をサポートしているかを判定できる。論理パレットが選択されて実現されていても、パレットへの変更はサーフェス上の物理パレットには影響しない。新しい論理パレットをサーフェスに設定するには、RealizePalette
を再度呼び出す必要がある。


%index
SetPixel
指定された座標のピクセルを指定された色に設定する。
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
SetPixelFormat
SetPixelFormat 関数は、指定したデバイスコンテキストのピクセル形式を iPixelFormat インデックスで指定された形式に設定する。
%prm
hdc, format, ppfd
hdc : [intptr] ピクセル形式を設定するデバイスコンテキストを指定する。
format : [int] 設定するピクセル形式を識別するインデックス。デバイスコンテキストでサポートされる様々なピクセル形式は 1 ベースのインデックスで識別される。
ppfd : [var] 論理ピクセル形式の仕様を含む PIXELFORMATDESCRIPTOR 構造体へのポインタ。システムのメタファイルコンポーネントはこの構造体を使用して論理ピクセル形式の仕様を記録する。この構造体は SetPixelFormat 関数の動作に他の影響を与えない。
%inst
SetPixelFormat 関数は、指定したデバイスコンテキストのピクセル形式を iPixelFormat
インデックスで指定された形式に設定する。

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE である。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]
hdc がウィンドウを参照している場合、SetPixelFormat
関数の呼び出しはウィンドウのピクセル形式も変更する。ウィンドウのピクセル形式を複数回設定すると、ウィンドウマネージャやマルチスレッドアプリケーションに大きな複雑さをもたらすため、許可されない。アプリケーションはウィンドウのピクセル形式を一度だけ設定できる。ウィンドウのピクセル形式が設定されたら、変更できない。wglCreateContext
関数を呼び出す前に、デバイスコンテキスト内でピクセル形式を選択するべきである。wglCreateContext
関数は、デバイスコンテキストの選択されたピクセル形式でデバイス上に描画するためのレンダリングコンテキストを作成する。OpenGL
ウィンドウは独自のピクセル形式を持つ。このため、OpenGL
ウィンドウのクライアント領域に対して取得したデバイスコンテキストのみがそのウィンドウに描画できる。その結果、OpenGL ウィンドウは
WS_CLIPCHILDREN および WS_CLIPSIBLINGS スタイルで作成すべきである。さらに、ウィンドウクラスの属性には
CS_PARENTDC スタイルを含めるべきではない。


%index
SetPixelV
SetPixelV 関数は、指定した座標のピクセルを指定した色の最も近い近似値に設定する。点はクリッピング領域およびデバイスサーフェスの可視部分になければならない。
%prm
hdc, x, y, color
hdc : [intptr] デバイスコンテキストへのハンドル。
x : [int] 設定する点の x 座標(論理単位)。
y : [int] 設定する点の y 座標(論理単位)。
color : [int] 点を塗るために使用する色。COLORREF カラー値を作成するには RGB マクロを使用する。
%inst
SetPixelV
関数は、指定した座標のピクセルを指定した色の最も近い近似値に設定する。点はクリッピング領域およびデバイスサーフェスの可視部分になければならない。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
すべてのデバイスが SetPixelV 関数をサポートしているわけではない。詳細は GetDeviceCaps 関数の RC_BITBLT
ケーパビリティの説明を参照。SetPixelV は実際に描画された点のカラー値を返す必要がないため、SetPixel より高速である。


%index
SetPolyFillMode
SetPolyFillMode 関数は、ポリゴンを塗りつぶす関数のためのポリゴン塗りつぶしモードを設定する。
%prm
hdc, mode
hdc : [intptr] デバイスコンテキストへのハンドル。
mode : [int] 
%inst
SetPolyFillMode 関数は、ポリゴンを塗りつぶす関数のためのポリゴン塗りつぶしモードを設定する。

[戻り値]
戻り値は以前の塗りつぶしモードを指定する。エラーが発生した場合、戻り値はゼロである。

[備考]
一般に、モードが異なるのは複雑で重なり合うポリゴンを塗りつぶさなければならない場合のみである(例: 中央に五角形を持つ五芒星を形成する 5
辺のポリゴン)。このような場合、ALTERNATE モードはポリゴン内の閉じた領域を 1
つおきに塗りつぶす(つまり星の尖った部分)が、WINDING
モードはすべての領域(つまり尖った部分と五角形)を塗りつぶす。塗りつぶしモードが ALTERNATE の場合、GDI
は各スキャンライン上の奇数番目と偶数番目のポリゴンの辺の間の領域を塗りつぶす。つまり、GDI は 1 番目と 2 番目の辺の間、3 番目と
4 番目の辺の間、といった領域を塗りつぶす。塗りつぶしモードが WINDING の場合、GDI
は非ゼロの巻き数値を持つ任意の領域を塗りつぶす。この値は、ポリゴンを描画するために使用されたペンがその領域を何回回るかとして定義される。ポリゴンの各辺の方向が重要である。


%index
SetROP2
現在の前景混合モードを設定する。
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
SetRectRgn
SetRectRgn 関数は、リージョンを指定した座標を持つ矩形リージョンに変換する。
%prm
hrgn, left, top, right, bottom
hrgn : [intptr] リージョンへのハンドル。
left : [int] 矩形リージョンの左上隅の x 座標(論理単位)を指定する。
top : [int] 矩形リージョンの左上隅の y 座標(論理単位)を指定する。
right : [int] 矩形リージョンの右下隅の x 座標(論理単位)を指定する。
bottom : [int] 矩形リージョンの右下隅の y 座標(論理単位)を指定する。
%inst
SetRectRgn 関数は、リージョンを指定した座標を持つ矩形リージョンに変換する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
リージョンは矩形の下端と右端を含まない。


%index
SetStretchBltMode
SetStretchBltMode 関数は、指定したデバイスコンテキスト内のビットマップストレッチモードを設定する。
%prm
hdc, mode
hdc : [intptr] デバイスコンテキストへのハンドル。
mode : [int] 
%inst
SetStretchBltMode 関数は、指定したデバイスコンテキスト内のビットマップストレッチモードを設定する。

[戻り値]
関数が成功した場合、戻り値は以前のストレッチモードである。関数が失敗した場合、戻り値はゼロである。この関数は次の値を返すことができる。
（以下省略）

[備考]
ストレッチモードは、アプリケーションが StretchBlt
関数を呼び出したときにシステムがビットマップの行または列を表示デバイス上の既存のピクセルとどのように結合するかを定義する。BLACKONWHITE
(STRETCH_ANDSCANS) と WHITEONBLACK (STRETCH_ORSCANS)
モードは、通常モノクロビットマップの前景ピクセルを保持するために使用される。COLORONCOLOR
(STRETCH_DELETESCANS) モードは、通常カラービットマップで色を保持するために使用される。HALFTONE モードは他の
3 つのモードより遅く、ソース画像の処理量も多いが、高品質の画像を生成する。また、HALFTONE
モードを設定した後にブラシの位置ずれを避けるために SetBrushOrgEx
を呼び出す必要があることに注意。デバイスドライバのケーパビリティに応じて追加のストレッチモードも利用できる場合がある。


%index
SetSystemPaletteUse
SetSystemPaletteUse 関数は、システムパレットが 2 または 20 の静的カラーを含むかをアプリケーションが指定できるようにする。
%prm
hdc, use
hdc : [intptr] デバイスコンテキストへのハンドル。このデバイスコンテキストはカラーパレットをサポートするデバイスを参照していなければならない。
use : [int] 
%inst
SetSystemPaletteUse 関数は、システムパレットが 2 または 20
の静的カラーを含むかをアプリケーションが指定できるようにする。

[戻り値]
関数が成功した場合、戻り値は以前のシステムパレットである。SYSPAL_NOSTATIC、SYSPAL_NOSTATIC256、または
SYSPAL_STATIC のいずれかとなる。関数が失敗した場合、戻り値は SYSPAL_ERROR である。

[備考]
アプリケーションは、GetDeviceCaps 関数を呼び出して RASTERCAPS
定数を指定することで、デバイスがパレット操作をサポートしているかを判定できる。アプリケーションウィンドウがフォアグラウンドに移動して
SYSPAL_NOSTATIC 値が設定されている場合、アプリケーションは GetSysColor
関数を呼び出して現在のシステムカラー設定を保存しなければならない。また、黒と白のみを使用して合理的な値を設定するために
SetSysColors
を呼び出す必要がある。アプリケーションがバックグラウンドに戻ったり終了したりする場合、以前のシステムカラーを復元しなければならない。関数が
SYSPAL_ERROR
を返した場合、指定したデバイスコンテキストは無効であるか、カラーパレットをサポートしていない。アプリケーションはウィンドウが最大化され入力フォーカスを持つ場合にのみこの関数を呼び出さなければならない。アプリケーションが
uUsage を SYSPAL_NOSTATIC にして SetSystemPaletteUse
を呼び出すと、システムは純白と純黒用にシステムパレット内の 2 つのエントリを引き続き確保する。uUsage を
SYSPAL_NOSTATIC に設定してこの関数を呼び出した後、アプリケーションは次の手順を実行しなければならない:
（以下省略）


%index
SetTextAlign
SetTextAlign 関数は、指定したデバイスコンテキストのテキスト配置フラグを設定する。
%prm
hdc, align
hdc : [intptr] デバイスコンテキストへのハンドル。
align : [int] 次のリストの値のマスクを使用したテキスト配置。水平および垂直配置に影響を与えるフラグからは 1 つのみを選択できる。さらに、現在位置を変更する 2 つのフラグからも 1 つのみを選択できる。
%inst
SetTextAlign 関数は、指定したデバイスコンテキストのテキスト配置フラグを設定する。

[戻り値]
関数が成功した場合、戻り値は以前のテキスト配置設定である。関数が失敗した場合、戻り値は GDI_ERROR である。

[備考]
TextOut および ExtTextOut
関数は、テキスト配置フラグを使用してディスプレイや他のデバイス上にテキスト文字列を配置する。フラグは参照点とテキストを囲む矩形との関係を指定する。参照点は現在位置またはテキスト出力関数に渡された点である。テキストを囲む矩形は、テキスト文字列内の文字セルによって形成される。左揃えテキストを得る最良の方法は、次のいずれかを使用することである
（以下省略）


%index
SetTextCharacterExtra
SetTextCharacterExtra 関数は、文字間スペースを設定する。文字間スペースは、システムがテキスト行を書き出すときに、ブレーク文字を含む各文字に追加される。
%prm
hdc, extra
hdc : [intptr] デバイスコンテキストへのハンドル。
extra : [int] 各文字に追加する追加スペースの量(論理単位)。現在のマッピングモードが MM_TEXT でない場合、nCharExtra パラメータは変換され、最も近いピクセルに丸められる。
%inst
SetTextCharacterExtra
関数は、文字間スペースを設定する。文字間スペースは、システムがテキスト行を書き出すときに、ブレーク文字を含む各文字に追加される。

[戻り値]
関数が成功した場合、戻り値は以前の文字間スペースである。関数が失敗した場合、戻り値は 0x80000000 である。

[備考]

この関数は主に既存のアプリケーションとの互換性のためにサポートされている。新しいアプリケーションは通常、この関数の呼び出しを避けるべきである。複雑なスクリプト(テキスト整形を必要とするスクリプト。アラビア語スクリプトがその例)と互換性がないためである。推奨されるアプローチは、この関数を呼び出してから
TextOut を呼ぶ代わりに、ExtTextOut を呼び出してその lpDx パラメータで幅を提供することである。


%index
SetTextColor
指定されたデバイスコンテキストのテキスト色を指定された色に設定する。
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
SetTextJustification
SetTextJustification 関数は、システムがテキスト文字列内のブレーク文字に追加すべきスペースの量を指定する。このスペースは、アプリケーションが TextOut または ExtTextOut 関数を呼び出したときに追加される。
%prm
hdc, extra, count
hdc : [intptr] デバイスコンテキストへのハンドル。
extra : [int] テキスト行に追加する追加スペースの合計(論理単位)。現在のマッピングモードが MM_TEXT でない場合、nBreakExtra パラメータで識別される値は変換され、最も近いピクセルに丸められる。
count : [int] 行内のブレーク文字の数。
%inst
SetTextJustification
関数は、システムがテキスト文字列内のブレーク文字に追加すべきスペースの量を指定する。このスペースは、アプリケーションが TextOut
または ExtTextOut 関数を呼び出したときに追加される。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
ブレーク文字は通常スペース文字(ASCII
32)であるが、フォントによって別の文字として定義されることもある。フォントのブレーク文字を取得するには GetTextMetrics
関数を使用できる。TextOut
関数は、指定された追加スペースを行内のブレーク文字に均等に配分する。GetTextExtentPoint32 関数は常に
SetTextJustification 関数と共に使用される。GetTextExtentPoint32
関数は、位置合わせ前の指定行の幅を計算するときに、位置合わせを考慮することもあれば、しないこともある。詳細は
GetTextExtentPoint32 を参照。適切な nBreakExtra
値を計算する前に、この幅を知る必要がある。SetTextJustification
は、異なるフォントで複数の文字列を含む行の位置合わせに使用できる。この場合、各文字列を個別に位置合わせしなければならない。位置合わせ中に丸め誤差が発生することがあるため、システムは現在の誤差値を定義する実行時誤差項を保持する。複数の実行を含む行を位置合わせする場合、GetTextExtentPoint
は次の実行の範囲を計算する際にこの誤差項を自動的に使用し、TextOut
が新しい実行に誤差を混ぜ込めるようにする。各行が位置合わせされた後、この誤差項は次の行に組み込まれないようにクリアしなければならない。項は
nBreakExtra を 0 に設定して SetTextJustification を呼び出すことでクリアできる。


%index
SetViewportExtEx
指定した値を使用して、デバイスコンテキストのビューポートの水平および垂直範囲を設定する。
%prm
hdc, x, y, lpsz
hdc : [intptr] デバイスコンテキストへのハンドル。
x : [int] ビューポートの水平範囲(デバイス単位)。
y : [int] ビューポートの垂直範囲(デバイス単位)。
lpsz : [var] 以前のビューポート範囲(デバイス単位)を受け取る SIZE 構造体へのポインタ。lpSize が NULL の場合、このパラメータは使用されない。
%inst
指定した値を使用して、デバイスコンテキストのビューポートの水平および垂直範囲を設定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]

ビューポートはデバイス空間のデバイス座標系を指す。範囲は軸の最大値である。この関数はビューポートの水平軸と垂直軸の最大値をデバイス座標(またはピクセル)で設定する。ページ空間とデバイス空間の間のマッピングでは、SetWindowExtEx
と SetViewportExtEx がウィンドウとビューポート間のスケーリングファクタを決定する。詳細は Transformation
of Coordinate Spaces を参照。次のマッピングモードが設定されている場合、SetWindowExtEx および
SetViewportExtEx 関数への呼び出しは無視される。
（以下省略）


%index
SetViewportOrgEx
SetViewportOrgEx 関数は、どのデバイス点がウィンドウ原点 (0,0) にマッピングされるかを指定する。
%prm
hdc, x, y, lppt
hdc : [intptr] デバイスコンテキストへのハンドル。
x : [int] 新しいビューポート原点の x 座標(デバイス単位)。
y : [int] 新しいビューポート原点の y 座標(デバイス単位)。
lppt : [var] 以前のビューポート原点(デバイス座標)を受け取る POINT 構造体へのポインタ。lpPoint が NULL の場合、このパラメータは使用されない。
%inst
SetViewportOrgEx 関数は、どのデバイス点がウィンドウ原点 (0,0) にマッピングされるかを指定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
この関数は(SetViewportExtEx および SetWindowExtEx
と共に)論理座標空間(ウィンドウとも呼ばれる)からデバイス座標空間(ビューポート)へのマッピングを定義するのに役立つ。SetViewportOrgEx
は、どのデバイス点が論理点 (0,0) にマッピングされるかを指定する。これは、論理点 (0,0)
が左上隅を指さなくなるように軸をシフトする効果がある。
（以下省略）


%index
SetWinMetaFileBits
SetWinMetaFileBits 関数は、メタファイルを古い Windows 形式から新しい拡張形式に変換し、新しいメタファイルをメモリに格納する。
%prm
nSize, lpMeta16Data, hdcRef, lpMFP
nSize : [int] Windows 形式メタファイルを含むバッファのサイズ(バイト単位)。
lpMeta16Data : [var] Windows 形式メタファイルデータを含むバッファへのポインタ(データは GetMetaFileBitsEx または GetWinMetaFileBits 関数を使って取得されたと想定される)。
hdcRef : [intptr] 参照デバイスコンテキストへのハンドル。
lpMFP : [var] メタファイル画像の推奨サイズと画像作成時に使用されたマッピングモードを含む METAFILEPICT 構造体へのポインタ。
%inst
SetWinMetaFileBits 関数は、メタファイルを古い Windows
形式から新しい拡張形式に変換し、新しいメタファイルをメモリに格納する。

[戻り値]
関数が成功した場合、戻り値はメモリベースの拡張メタファイルへのハンドルである。関数が失敗した場合、戻り値は NULL である。

[備考]
Windows は参照デバイスコンテキストの解像度データと METAFILEPICT
構造体内のデータを使用して画像をスケーリングする。hdcRef パラメータが NULL
の場合、システムは現在の出力デバイスの解像度データを使用する。lpmfp パラメータが NULL の場合、システムは
MM_ANISOTROPIC マッピングモードを使用して画像をデバイスサーフェス全体に合わせてスケーリングする。METAFILEPICT
構造体の hMF
メンバは使用されない。アプリケーションが拡張メタファイルハンドルを必要としなくなったら、DeleteEnhMetaFile
関数を呼び出して削除すべきである。この関数によって返されるハンドルは他の拡張メタファイル関数と共に使用できる。参照デバイスコンテキストがメタファイルが元々作成されたデバイスと同一でない場合、デバイス単位を使用する一部の
GDI 関数が画像を正しく描画しないことがある。


%index
SetWindowExtEx
SetWindowExtEx 関数は、指定した値を使用してデバイスコンテキストのウィンドウの水平および垂直範囲を設定する。
%prm
hdc, x, y, lpsz
hdc : [intptr] デバイスコンテキストへのハンドル。
x : [int] ウィンドウの水平範囲(論理単位)。
y : [int] ウィンドウの垂直範囲(論理単位)。
lpsz : [var] 以前のウィンドウ範囲(論理単位)を受け取る SIZE 構造体へのポインタ。lpSize が NULL の場合、このパラメータは使用されない。
%inst
SetWindowExtEx 関数は、指定した値を使用してデバイスコンテキストのウィンドウの水平および垂直範囲を設定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]

ウィンドウはページ空間の論理座標系を指す。範囲は軸の最大値である。この関数はウィンドウの水平軸と垂直軸の最大値を論理座標で設定する。ページ空間とデバイス空間の間のマッピングでは、SetViewportExtEx
と SetWindowExtEx がウィンドウとビューポート間のスケーリングファクタを決定する。詳細は Transformation of
Coordinate Spaces を参照。次のマッピングモードが設定されている場合、SetWindowExtEx および
SetViewportExtEx 関数への呼び出しは無視される:
（以下省略）


%index
SetWindowOrgEx
SetWindowOrgEx 関数は、どのウィンドウ点がビューポート原点 (0,0) にマッピングされるかを指定する。
%prm
hdc, x, y, lppt
hdc : [intptr] デバイスコンテキストへのハンドル。
x : [int] 新しいウィンドウ原点の x 座標(論理単位)。
y : [int] 新しいウィンドウ原点の y 座標(論理単位)。
lppt : [var] 以前のウィンドウ原点(論理単位)を受け取る POINT 構造体へのポインタ。lpPoint が NULL の場合、このパラメータは使用されない。
%inst
SetWindowOrgEx 関数は、どのウィンドウ点がビューポート原点 (0,0) にマッピングされるかを指定する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]

これは論理座標空間(ウィンドウとも呼ばれる)からデバイス座標空間(ビューポート)へのマッピングを定義するのに役立つ。SetWindowOrgEx
は、どの論理点がデバイス点 (0,0) にマッピングされるかを指定する。これは、論理点 (0,0)
が左上隅を指さなくなるように軸をシフトする効果がある。
（以下省略）


%index
SetWorldTransform
SetWorldTransform 関数は、指定したデバイスコンテキストのワールド空間とページ空間の間の 2 次元線形変換を設定する。この変換はグラフィックス出力をスケーリング、回転、剪断、または平行移動するために使用できる。
%prm
hdc, lpxf
hdc : [intptr] デバイスコンテキストへのハンドル。
lpxf : [var] 変換データを含む XFORM 構造体へのポインタ。
%inst
SetWorldTransform 関数は、指定したデバイスコンテキストのワールド空間とページ空間の間の 2
次元線形変換を設定する。この変換はグラフィックス出力をスケーリング、回転、剪断、または平行移動するために使用できる。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
以下は変換行列である(要素表記の数字は、逆ではなく、1 ベースの列番号に続く 1 ベースの行番号であることに注意)。
（以下省略）


%index
StartDocW
StartDoc 関数は印刷ジョブを開始する。(Unicode)
%prm
hdc, lpdi
hdc : [intptr] 印刷ジョブのデバイスコンテキストへのハンドル。
lpdi : [var] ドキュメントファイル名と出力ファイル名を含む DOCINFO 構造体へのポインタ。
%inst
StartDoc 関数は印刷ジョブを開始する。(Unicode)

[戻り値]
関数が成功した場合、戻り値はゼロより大きい。この値はドキュメントの印刷ジョブ識別子である。関数が失敗した場合、戻り値はゼロ以下である。

[備考]
注:
これはブロッキングまたは同期関数であり、すぐに返らない可能性がある。この関数がどれだけ早く返るかは、ネットワーク状態、印刷サーバの設定、プリンタドライバの実装といった、アプリケーションの作成時に予測が難しい実行時要因に依存する。ユーザインターフェイスとの対話を管理するスレッドからこの関数を呼び出すと、アプリケーションが応答しないように見えることがある。アプリケーションは印刷ジョブを開始する直前に
StartDoc
関数を呼び出すべきである。この関数を使うことで、複数ページのドキュメントが他の印刷ジョブと混ざらないようにする。アプリケーションは、StartDoc
から返された値を使って印刷ジョブの優先度を取得または設定できる。GetJob または SetJob 関数を呼び出し、必要な引数の 1
つとしてこの値を提供する。


%index
StartPage
StartPage 関数は、プリンタドライバがデータを受け付けられるようにする。
%prm
hdc
hdc : [intptr] 印刷ジョブのデバイスコンテキストへのハンドル。
%inst
StartPage 関数は、プリンタドライバがデータを受け付けられるようにする。

[戻り値]
関数が成功した場合、戻り値はゼロより大きい。関数が失敗した場合、戻り値はゼロ以下である。

[備考]
注:
これはブロッキングまたは同期関数であり、すぐに返らない可能性がある。この関数がどれだけ早く返るかは、ネットワーク状態、印刷サーバの設定、プリンタドライバの実装といった、アプリケーションの作成時に予測が難しい実行時要因に依存する。ユーザインターフェイスとの対話を管理するスレッドからこの関数を呼び出すと、アプリケーションが応答しないように見えることがある。システムは
StartPage と EndPage 関数の呼び出しの間に ResetDC
関数を無効にする。つまり、ページ境界以外ではデバイスモードを変更できない。EndPage を呼び出した後、必要であれば ResetDC
を呼び出してデバイスモードを変更できる。ResetDC
の呼び出しは、すべてのデバイスコンテキスト属性をデフォルト値にリセットすることに注意。EndPage も StartPage
もデバイスコンテキスト属性をリセットしない。デバイスコンテキスト属性は後続のページ間で保持される。次のページを印刷する前にオブジェクトを再度選択したりマッピングモードを設定したりする必要はないが、そうしても同じ結果が得られ、Windows
のバージョン間のコード差異を減らせる。


%index
StretchBlt
元矩形から先矩形へビットマップをコピーし、必要に応じて先矩形の寸法に合うようにビットマップを伸縮する。
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
StretchDIBits
StretchDIBits 関数は、DIB、JPEG、または PNG 画像のピクセル矩形のカラーデータを指定したコピー先矩形にコピーする。
%prm
hdc, xDest, yDest, DestWidth, DestHeight, xSrc, ySrc, SrcWidth, SrcHeight, lpBits, lpbmi, iUsage, rop
hdc : [intptr] コピー先のデバイスコンテキストへのハンドル。
xDest : [int] コピー先矩形の左上隅の x 座標(論理単位)。
yDest : [int] コピー先矩形の左上隅の y 座標(論理単位)。
DestWidth : [int] コピー先矩形の幅(論理単位)。
DestHeight : [int] コピー先矩形の高さ(論理単位)。
xSrc : [int] 画像内のソース矩形の x 座標(ピクセル単位)。
ySrc : [int] 画像内のソース矩形の y 座標(ピクセル単位)。
SrcWidth : [int] 画像内のソース矩形の幅(ピクセル単位)。
SrcHeight : [int] 画像内のソース矩形の高さ(ピクセル単位)。
lpBits : [intptr] バイト配列として格納された画像ビットへのポインタ。詳細は「解説」セクションを参照。
lpbmi : [var] DIB に関する情報を含む BITMAPINFO 構造体へのポインタ。
iUsage : [int] 
rop : [int] ソースピクセル、コピー先デバイスコンテキストの現在のブラシ、およびコピー先ピクセルをどのように組み合わせて新しい画像を形成するかを指定するラスタ演算コード。一般的なラスタ演算コードの一覧は BitBlt を参照。
%inst
StretchDIBits 関数は、DIB、JPEG、または PNG 画像のピクセル矩形のカラーデータを指定したコピー先矩形にコピーする。

[戻り値]

関数が成功した場合、戻り値はコピーされたスキャンラインの数である。この値は鏡像化されたコンテンツに対して負になり得ることに注意。関数が失敗した場合、またはスキャンラインがコピーされなかった場合、戻り値は
0 である。ドライバが StretchDIBits に渡された JPEG または PNG
ファイル画像をサポートできない場合、関数は失敗して GDI_ERROR を返す。失敗した場合、アプリケーションは独自の JPEG または
PNG サポートにフォールバックして画像をビットマップに展開し、そのビットマップを StretchDIBits に渡す必要がある。

[備考]
ボトムアップ DIB の原点は左下隅にあり、トップダウン DIB の原点は左上隅にある。StretchDIBits は、nSrcWidth
と nDestWidth パラメータの符号、または nSrcHeight と nDestHeight
パラメータの符号が異なる場合、ビットマップの鏡像を作成する。nSrcWidth と nDestWidth の符号が異なる場合、関数は x
軸に沿ったビットマップの鏡像を作成する。nSrcHeight と nDestHeight の符号が異なる場合、関数は y
軸に沿ったビットマップの鏡像を作成する。StretchDIBits は、DIB の BITMAPINFOHEADER 構造体の
biHeight メンバの符号が負の場合、トップダウン画像を作成する。コード例は Sizing a JPEG or PNG Image
を参照。この関数は JPEG または PNG
画像をソース画像として渡すことを可能にする。各パラメータの使用方法は同じだが、次の例外がある:
（以下省略）


%index
StrokeAndFillPath
StrokeAndFillPath 関数は、パス内の開いた図形を閉じ、現在のペンを使用してパスの輪郭をストロークし、現在のブラシを使用して内部を塗りつぶす。
%prm
hdc
hdc : [intptr] デバイスコンテキストへのハンドル。
%inst
StrokeAndFillPath
関数は、パス内の開いた図形を閉じ、現在のペンを使用してパスの輪郭をストロークし、現在のブラシを使用して内部を塗りつぶす。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
hdc パラメータで指定されたデバイスコンテキストには閉じたパスが含まれていなければならない。StrokeAndFillPath
関数は、パス内のすべての開いた図形を閉じて、パスのストロークと塗りつぶしを個別に行うのと同じ効果を持つが、ペンが太くても塗りつぶし領域がストローク領域と重ならない点が異なる。


%index
StrokePath
StrokePath 関数は、現在のペンを使用して指定したパスを描画する。
%prm
hdc
hdc : [intptr] 完成したパスを含むデバイスコンテキストへのハンドル。
%inst
StrokePath 関数は、現在のペンを使用して指定したパスを描画する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
StrokePath で描画されるパスは、EndPath の呼び出しを通じて完成していなければならない。EndPath
が呼ばれていないパスに対してこの関数を呼び出すと、この関数は失敗してゼロを返す。StrokeAndFillPath
のような他のパス描画関数とは異なり、StrokePath はパス上の最初の点から最後の点まで直線を描いてパスを閉じることは試みない。


%index
SwapBuffers
SwapBuffers 関数は、指定したデバイスコンテキストが参照するウィンドウの現在のピクセル形式にバックバッファが含まれる場合、フロントバッファとバックバッファを入れ替える。
%prm
param0
param0 : [intptr] 
%inst
SwapBuffers
関数は、指定したデバイスコンテキストが参照するウィンドウの現在のピクセル形式にバックバッファが含まれる場合、フロントバッファとバックバッファを入れ替える。

[戻り値]
関数が成功した場合、戻り値は TRUE である。関数が失敗した場合、戻り値は FALSE である。拡張エラー情報を取得するには
GetLastError を呼ぶ。

[備考]

デバイスコンテキストが参照するウィンドウの現在のピクセル形式にバックバッファが含まれていない場合、この呼び出しには効果がなく、関数が返る時点でバックバッファの内容は未定義となる。マルチスレッドアプリケーションの場合、SwapBuffers
を呼び出す前に、同じウィンドウに描画している他のスレッドの描画コマンドをフラッシュすること。


%index
TextOutW
現在選択されているフォント、背景色、テキスト色を使って指定位置に文字列を書き込む。(Unicode)
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


%index
TranslateCharsetInfo
文字セット情報を変換し、変換先構造体のすべてのメンバを適切な値に設定する。
%prm
lpSrc, lpCs, dwFlags
lpSrc : [var] dwFlags が TCI_SRCFONTSIG に設定されている場合は FONTSIGNATURE 構造体の fsCsb メンバへのポインタ。そうでない場合、このパラメータはソースを示す DWORD 値に設定される。
lpCs : [var] 変換された文字セット情報を受け取る CHARSETINFO 構造体へのポインタ。
dwFlags : [int] 
%inst
文字セット情報を変換し、変換先構造体のすべてのメンバを適切な値に設定する。

[戻り値]
成功した場合は非ゼロ値、そうでない場合は 0 を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼ぶことができる。


%index
UnrealizeObject
UnrealizeObject 関数は、ブラシの原点をリセットするか、論理パレットをリセットする。
%prm
h
h : [intptr] 
%inst
UnrealizeObject 関数は、ブラシの原点をリセットするか、論理パレットをリセットする。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
UnrealizeObject 関数はストックオブジェクトと共に使用すべきではない。たとえば、GetStockObject
(DEFAULT_PALETTE) を呼び出して取得されるデフォルトパレットはストックオブジェクトである。hgdiobj
で識別されるパレットは、デバイスコンテキストの現在選択されているパレットでよい。hgdiobj
がブラシの場合、UnrealizeObject は何もせず、関数は TRUE を返す。ブラシの原点を設定するには
SetBrushOrgEx を使用する。


%index
UpdateColors
UpdateColors 関数は、指定したデバイスコンテキストのクライアント領域内の現在の色を、現在実現されている論理パレットに再マッピングすることで、クライアント領域を更新する。
%prm
hdc
hdc : [intptr] デバイスコンテキストへのハンドル。
%inst
UpdateColors
関数は、指定したデバイスコンテキストのクライアント領域内の現在の色を、現在実現されている論理パレットに再マッピングすることで、クライアント領域を更新する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
アプリケーションは、GetDeviceCaps 関数を呼び出して RASTERCAPS
定数を指定することで、デバイスがパレット操作をサポートしているかを判定できる。実現された論理パレットを持つ非アクティブなウィンドウは、システムパレットが変更されたときにクライアント領域を再描画する代わりに
UpdateColors を呼び出すことができる。UpdateColors
関数は通常、領域の再描画よりも速くクライアント領域を更新する。ただし、UpdateColors
はシステムパレットが変更される前の各ピクセルの色に基づいてカラー変換を実行するため、この関数を呼び出すたびに色精度の一部が失われる。この関数は
WM_PALETTECHANGED メッセージを受信した直後に呼び出さなければならない。


%index
UpdateICMRegKeyW
UpdateICMRegKey 関数は、システム内のカラープロファイルとカラーマネジメントモジュールを管理する。(Unicode)
%prm
reserved, lpszCMID, lpszFileName, command
reserved : [int] 予約済み。0 に設定しなければならない。
lpszCMID : [wstr] プロファイルで使用するカラー管理 DLL の ICC プロファイル識別子を指定する文字列を指す。
lpszFileName : [wstr] 完全修飾された ICC カラープロファイルファイル名、または DEVMODE 構造体を指す。
command : [int] 
%inst
UpdateICMRegKey 関数は、システム内のカラープロファイルとカラーマネジメントモジュールを管理する。(Unicode)

[戻り値]
この関数が成功した場合、戻り値は TRUE である。この関数が失敗した場合、戻り値は FALSE である。

[備考]
すべてのパラメータがすべての関数で使用されるわけではない。nCommand
パラメータは実行する関数を指定する。この関数は後方互換性のために残されており、将来の ICM
のバージョンでは削除される可能性がある。Windows 95/98/Me: UpdateICMRegKeyW は Microsoft
Layer for Unicode でサポートされる。これを使用するには、「Microsoft Layer for Unicode on
Windows 95/98/Me Systems」の概要に従って、特定のファイルをアプリケーションに追加しなければならない。
> [!NOTE] > wingdi.h ヘッダーは UpdateICMRegKey を、UNICODE
プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または Unicode
版を自動的に選択するエイリアスとして定義している。エンコーディング中立なエイリアスをエンコーディング中立でないコードと混在させると、コンパイルエラーや実行時エラーを引き起こす不一致が発生することがある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
WidenPath
WidenPath 関数は、指定したデバイスコンテキストに現在選択されているペンを使用してパスをストロークした場合に塗られる領域として、現在のパスを再定義する。
%prm
hdc
hdc : [intptr] 閉じたパスを含むデバイスコンテキストへのハンドル。
%inst
WidenPath
関数は、指定したデバイスコンテキストに現在選択されているペンを使用してパスをストロークした場合に塗られる領域として、現在のパスを再定義する。

[戻り値]
関数が成功した場合、戻り値は非ゼロである。関数が失敗した場合、戻り値はゼロである。

[備考]
WidenPath 関数は、現在のペンが ExtCreatePen 関数で作成された幾何学的ペンである場合、または CreatePen
関数で作成され、デバイス単位で幅が 1 を超えるペンである場合にのみ成功する。hdc
パラメータで指定されたデバイスコンテキストには閉じたパスが含まれていなければならない。パス内のベジェ曲線は、広げられた曲線を近似する直線の列に変換される。したがって、WidenPath
の呼び出し後、パス内にベジェ曲線は残らない。


%index
XFORMOBJ_bApplyXform
XFORMOBJ_bApplyXform 関数は、指定した変換またはその逆変換を、指定した点の配列に適用する。
%prm
pxo, iMode, cPoints, pvIn, pvOut
pxo : [var] pvIn 配列に適用する変換を定義する XFORMOBJ 構造体へのポインタ。
iMode : [int] 変換と入出力データ型を識別する。このパラメータは次のいずれかの値を取ることができる:
cPoints : [int] 変換する pvIn 内の点の数を指定する。
pvIn : [intptr] 入力点の配列へのポインタ。点の形式は iMode パラメータで指定される。
pvOut : [intptr] 変換された点を受け取るバッファへのポインタ。iMode パラメータが点の形式を指定する。
%inst
XFORMOBJ_bApplyXform 関数は、指定した変換またはその逆変換を、指定した点の配列に適用する。

[戻り値]
すべての点がオーバーフローなしで変換された場合、戻り値は TRUE である。pxo、pvIn、pvOut のいずれかが NULL
の場合、または変換中にオーバーフローが発生した場合、FALSE が返される。


%index
XLATEOBJ_cGetPalette
XLATEOBJ_cGetPalette 関数は、指定したパレットから RGB カラーまたはビットフィールド形式を取得する。
%prm
pxlo, iPal, cPal, pPal
pxlo : [var] GDI が要求された情報を取得する XLATEOBJ 構造体へのポインタ。
iPal : [int] 
cPal : [int] pPal が指すバッファ内のエントリ数を指定する。これはパレットの総サイズより小さくてもよい。
pPal : [var] GDI が要求されたパレット情報を書き込むバッファへのポインタ。iPal が XO_SRCPALETTE または XO_DESTPALETTE で、それぞれのパレットタイプが PAL_INDEXED の場合、各エントリは 24 ビット RGB 値である。iPal が XO_SRCBITFIELDS または XO_DESTBITFIELDS で、それぞれのパレットタイプが PAL_BITFIELDS、PAL_RGB、または PAL_BGR の場合、pPal は赤、緑、青のカラーマスクを表す 3 つの ULONG マスクを指す。
%inst
XLATEOBJ_cGetPalette 関数は、指定したパレットから RGB カラーまたはビットフィールド形式を取得する。

[戻り値]
XLATEOBJ_cGetPalette は、pPal が NULL でない場合、書き込まれたエントリ数を返す。XLATEOBJ が
NULL またはそのパレットが無効な場合、値 0 が返される。pxlo が指すデータが iPal
の値と一致しない場合も、XLATEOBJ_cGetPalette は 0 を返す。たとえば、指されるデータがビットフィールドだが iPal
が XO_SRCPALETTE または XO_DESTPALETTE に設定されている場合、XLATEOBJ_cGetPalette は
0 を返す。同様に、pxlo が指すデータがパレットだが iPal が XO_SRCBITFIELDS または
XO_DESTBITFIELDS に設定されている場合も、XLATEOBJ_cGetPalette は 0 を返す。

[備考]
ドライバはカラーブレンディングの一部の方法を実行するためにパレットに関する情報を持たなければならない。


%index
XLATEOBJ_hGetColorTransform
XLATEOBJ_hGetColorTransform 関数は、指定した変換オブジェクトのカラー変換を返す。
%prm
pxlo
pxlo : [var] カラー変換が問い合わされる XLATEOBJ 構造体へのポインタ。カラー変換は DrvIcmCreateColorTransform への以前の呼び出しで作成されたものである。
%inst
XLATEOBJ_hGetColorTransform 関数は、指定した変換オブジェクトのカラー変換を返す。

[戻り値]
XLATEOBJ_hGetColorTransform は、成功時に指定した XLATEOBJ
のカラー変換へのハンドルを返す。そうでない場合は NULL を返す。

[備考]
XLATEOBJ_hGetColorTransform は、ホスト ICM コンテキストで呼び出された場合、または ICM が無効な場合に
NULL を返す。ブラシのカラー変換は BRUSHOBJ_hGetColorTransform を呼び出すことで取得する。


%index
XLATEOBJ_iXlate
XLATEOBJ_iXlate 関数は、ソースパレットのカラーインデックスを変換先パレット内の最も近いインデックスに変換する。
%prm
pxlo, iColor
pxlo : [var] ソースパレットを定義する XLATEOBJ 構造体へのポインタ。
iColor : [int] 変換するカラーインデックスを指定する。
%inst
XLATEOBJ_iXlate 関数は、ソースパレットのカラーインデックスを変換先パレット内の最も近いインデックスに変換する。

[戻り値]
関数が成功した場合、戻り値は変換先パレットへのインデックスである。関数が失敗した場合、-1 が返される。


%index
XLATEOBJ_piVector
XLATEOBJ_piVector 関数は、ドライバがソースインデックスを変換先インデックスに変換するために使用できる変換ベクトルを取得する。
%prm
pxlo
pxlo : [var] インデックス付きソースオブジェクトを定義する XLATEOBJ 構造体へのポインタ。
%inst
XLATEOBJ_piVector
関数は、ドライバがソースインデックスを変換先インデックスに変換するために使用できる変換ベクトルを取得する。

[戻り値]
関数が成功した場合、戻り値は変換エントリのベクトルへのポインタである。そうでない場合は NULL となり、エラーコードがログに記録される。

[備考]
この関数はソースパレットがインデックス付きパレットである場合にのみ使用できる。

