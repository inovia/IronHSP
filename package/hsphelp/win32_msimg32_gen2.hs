; ============================================================
;   msimg32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
msimg32.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の msimg32.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
AlphaBlend
透明または半透明のピクセルを持つビットマップを表示する。
%prm
hdcDest, xoriginDest, yoriginDest, wDest, hDest, hdcSrc, xoriginSrc, yoriginSrc, wSrc, hSrc, ftn
hdcDest : [intptr] 先デバイスコンテキストへのハンドル。
xoriginDest : [int] 先矩形の左上隅の x 座標(論理単位)。
yoriginDest : [int] 先矩形の左上隅の y 座標(論理単位)。
wDest : [int] 先矩形の幅(論理単位)。
hDest : [int] 先矩形の高さ(論理単位)。
hdcSrc : [intptr] 元デバイスコンテキストへのハンドル。
xoriginSrc : [int] 元矩形の左上隅の x 座標(論理単位)。
yoriginSrc : [int] 元矩形の左上隅の y 座標(論理単位)。
wSrc : [int] 元矩形の幅(論理単位)。
hSrc : [int] 元矩形の高さ(論理単位)。
ftn : [var] 元と先のビットマップに対するアルファブレンド関数、元全体へ適用するグローバルアルファ値、および元の形式情報。現状、ブレンド関数は AC_SRC_OVER に限定される。BLENDFUNCTION および EMRALPHABLEND 構造体を参照。
%inst
透明または半透明のピクセルを持つビットマップを表示する。

[戻り値]
関数が成功した場合、戻り値は TRUE。失敗した場合は FALSE。

[備考]
元と先の矩形のサイズが異なる場合、元ビットマップは先の矩形に合わせて伸縮される。SetStretchBltMode
が使われている場合、iStretchMode は自動的に COLORONCOLOR
に変換される。元と先で色形式が異なる場合は変換される。ミラーリングはサポートされず、幅または高さが負の場合は失敗する。プリンタへ描画する際は
GetDeviceCaps の SHADEBLENDCAPS
で対応を確認する。元と先が同一のサーフェスで矩形が重なる場合はエラー。BLENDFUNCTION の
SourceConstantAlpha は元ビットマップ全体へ適用するアルファ値で、ピクセル単位のアルファ値と組み合わされる。0
は透明、255 は不透明。
（以下省略）


%index
GradientFill
矩形および三角形構造体を塗りつぶす。
%prm
hdc, pVertex, nVertex, pMesh, nMesh, ulMode
hdc : [intptr] 先デバイスコンテキストへのハンドル。
pVertex : [var] 各頂点を定義する TRIVERTEX 構造体の配列へのポインタ。
nVertex : [int] pVertex 内の頂点数。
pMesh : [intptr] 三角形モードの GRADIENT_TRIANGLE 構造体配列、または矩形モードの GRADIENT_RECT 構造体配列。
nMesh : [int] pMesh 内の要素(三角形または矩形)数。
ulMode : [int] 
%inst
矩形および三角形構造体を塗りつぶす。

[戻り値]
関数が成功した場合、戻り値は TRUE。失敗した場合は FALSE。

[備考]
三角形に滑らかなシェーディングを追加するには、GradientFill に三角形の 3 頂点を渡す。GDI
は線形補間して三角形を塗りつぶす。
（以下省略）


%index
TransparentBlt
指定された元デバイスコンテキストから先デバイスコンテキストへ、透過色を考慮して矩形分のピクセル色データのビットブロック転送を行う。
%prm
hdcDest, xoriginDest, yoriginDest, wDest, hDest, hdcSrc, xoriginSrc, yoriginSrc, wSrc, hSrc, crTransparent
hdcDest : [intptr] 先デバイスコンテキストへのハンドル。
xoriginDest : [int] 先矩形の左上隅の x 座標(論理単位)。
yoriginDest : [int] 先矩形の左上隅の y 座標(論理単位)。
wDest : [int] 先矩形の幅(論理単位)。
hDest : [int] 先矩形の高さ(論理単位)。
hdcSrc : [intptr] 元デバイスコンテキストへのハンドル。
xoriginSrc : [int] 元矩形の x 座標(論理単位)。
yoriginSrc : [int] 元矩形の y 座標(論理単位)。
wSrc : [int] 元矩形の幅(論理単位)。
hSrc : [int] 元矩形の高さ(論理単位)。
crTransparent : [int] 元ビットマップ内で透過として扱う RGB 色。
%inst
指定された元デバイスコンテキストから先デバイスコンテキストへ、透過色を考慮して矩形分のピクセル色データのビットブロック転送を行う。

[戻り値]
関数が成功した場合、戻り値は TRUE。失敗した場合は FALSE。

[備考]
TransparentBlt は互換ビットマップ(DDB)で動作する。すべての形式の元ビットマップをサポートするが、32bpp
の場合はアルファ値をそのままコピーする。32bpp ビットマップの透過には AlphaBlend
を使うこと。元と先の矩形のサイズが異なる場合は伸縮される。SetStretchBltMode の
BLACKONWHITE/WHITEONBLACK は TransparentBlt では COLORONCOLOR
に変換される。幅や高さが負でもミラーリングは行われない。複数モニタ環境では元と先が同じデバイスでなければならない。

