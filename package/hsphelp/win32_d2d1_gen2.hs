; ============================================================
;   d2d1.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
d2d1.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の d2d1.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
D2D1ComputeMaximumScaleFactor
指定された変換が任意のベクトルを伸ばしうる最大係数を計算する。
%prm
matrix
matrix : [var] 入力の変換行列。
%inst
指定された変換が任意のベクトルを伸ばしうる最大係数を計算する。

[戻り値]
スケールファクター。

[備考]
形式的には、入力行列を M とすると、このメソッドはすべてのベクトル V について |V * M| / |V| の最大値を返す (|.|
は長さを表す)。
注意 これは M がベクトルに与える影響を記述しているため (点ではなく)、M の平行移動成分 (_31、_32) は無視される。


%index
D2D1ConvertColorSpace
指定された色をある色空間から別の色空間へ変換する。
%prm
sourceColorSpace, destinationColorSpace, color
sourceColorSpace : [int] 型: D2D1_COLOR_SPACE 変換元の色空間。
destinationColorSpace : [int] 型: D2D1_COLOR_SPACE 変換先の色空間。
color : [var] 型: const D2D1_COLOR_F* 変換元の色。
%inst
指定された色をある色空間から別の色空間へ変換する。

[戻り値]
型: D2D1_COLOR_F 変換後の色。


%index
D2D1CreateDevice
指定された DXGI デバイスに関連付けられた新しい Direct2D デバイスを作成する。
%prm
dxgiDevice, creationProperties, d2dDevice
dxgiDevice : [var] Direct2D デバイスと関連付ける DXGI デバイス。
creationProperties : [var] Direct2D デバイスに適用するプロパティ。
d2dDevice : [var] この関数から戻るとき、Direct2D デバイスへのポインタのアドレスが格納される。
%inst
指定された DXGI デバイスに関連付けられた新しい Direct2D デバイスを作成する。

[戻り値]
この関数は HRESULT を返す。取りうる値の一部を下の表に示す (これらに限らない)。
このドキュメントは省略されている。

[備考]
この関数は ID2D1Factory1 も新規に作成し、ID2D1Resource::GetFactory
経由で取得できる。作成プロパティを指定しない場合、d2dDevice はスレッディングモードを dxgiDevice
から継承し、デバッグトレースは無効となる。


%index
D2D1CreateDeviceContext
DXGI サーフェスに関連付けられた新しい Direct2D デバイスコンテキストを作成する。
%prm
dxgiSurface, creationProperties, d2dDeviceContext
dxgiSurface : [var] Direct2D デバイスコンテキストと関連付ける DXGI サーフェス。
creationProperties : [var] Direct2D デバイスコンテキストに適用するプロパティ。
d2dDeviceContext : [var] この関数から戻るとき、Direct2D デバイスコンテキストへのポインタのアドレスが格納される。
%inst
DXGI サーフェスに関連付けられた新しい Direct2D デバイスコンテキストを作成する。

[戻り値]
この関数は HRESULT を返す。取りうる値の一部を下の表に示す (これらに限らない)。
このドキュメントは省略されている。

[備考]
この関数は ID2D1Factory1 も新規に作成し、ID2D1Resource::GetFactory 経由で取得できる。また、新しい
ID2D1Device も作成され、ID2D1DeviceContext::GetDevice 経由で取得できる。DXGI デバイスは
dxgiSurface を通じて暗黙に指定される。creationProperties を指定しない場合、Direct2D デバイスは
dxgiSurface が示す DXGI デバイスからスレッディングモードを継承し、デバッグトレースは無効となる。


%index
D2D1CreateFactory
D2D1CreateFactory(D2D1_FACTORY_TYPE,REFIID,D2D1_FACTORY_OPTIONS*,void**) は、Direct2D リソースの作成に使用できるファクトリオブジェクトを作成する。
%prm
factoryType, riid, pFactoryOptions, ppIFactory
factoryType : [int] 型: D2D1_FACTORY_TYPE ファクトリおよびそれが生成するリソースのスレッディングモデル。
riid : [var] 型: REFIID `__uuidof(ID2D1Factory)` を用いて取得される ID2D1Factory の IID への参照。
pFactoryOptions : [var] 型: const D2D1_FACTORY_OPTIONS* デバッグレイヤーに提供する詳細度のレベル。
ppIFactory : [var] 型: void** このメソッドから戻るとき、新しいファクトリへのポインタのアドレスが格納される。
%inst

D2D1CreateFactory(D2D1_FACTORY_TYPE,REFIID,D2D1_FACTORY_OPTIONS*,void**)
は、Direct2D リソースの作成に使用できるファクトリオブジェクトを作成する。

[戻り値]
型: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
関数が成功すると **S_OK** を返す。失敗時は
[**HRESULT**](/windows/win32/com/structure-of-com-error-codes)
[エラーコード](/windows/win32/com/com-error-codes-10) を返す。

[備考]
ID2D1Factory インターフェースは Direct2D の出発点を提供する。一般に、ファクトリオブジェクトの 1
インスタンスから作成されたオブジェクトは、同じインスタンスから作成された他のリソースとは併用できるが、別のファクトリインスタンスから作成されたリソースとは併用できない。


%index
D2D1GetGradientMeshInteriorPointsFromCoonsPatch
Coons パッチを定義する点に基づいて、グラデーションメッシュパッチの内部点を返す。
%prm
pPoint0, pPoint1, pPoint2, pPoint3, pPoint4, pPoint5, pPoint6, pPoint7, pPoint8, pPoint9, pPoint10, pPoint11, pTensorPoint11, pTensorPoint12, pTensorPoint21, pTensorPoint22
pPoint0 : [var] 型: D2D1_POINT_2F* 位置 0 にある制御点の座標空間上の位置。
pPoint1 : [var] 型: D2D1_POINT_2F* 位置 1 にある制御点の座標空間上の位置。
pPoint2 : [var] 型: D2D1_POINT_2F* 位置 2 にある制御点の座標空間上の位置。
pPoint3 : [var] 型: D2D1_POINT_2F* 位置 3 にある制御点の座標空間上の位置。
pPoint4 : [var] 型: D2D1_POINT_2F* 位置 4 にある制御点の座標空間上の位置。
pPoint5 : [var] 型: D2D1_POINT_2F* 位置 5 にある制御点の座標空間上の位置。
pPoint6 : [var] 型: D2D1_POINT_2F* 位置 6 にある制御点の座標空間上の位置。
pPoint7 : [var] 型: D2D1_POINT_2F* 位置 7 にある制御点の座標空間上の位置。
pPoint8 : [var] 型: D2D1_POINT_2F* 位置 8 にある制御点の座標空間上の位置。
pPoint9 : [var] 型: D2D1_POINT_2F* 位置 9 にある制御点の座標空間上の位置。
pPoint10 : [var] 型: D2D1_POINT_2F* 位置 10 にある制御点の座標空間上の位置。
pPoint11 : [var] 型: D2D1_POINT_2F* 位置 11 にある制御点の座標空間上の位置。
pTensorPoint11 : [var] 型: D2D1_POINT_2F* D2D1_GRADIENT_MESH_PATCH 構造体の point11 に対応するグラデーションメッシュの内部点を返す。
pTensorPoint12 : [var] 型: D2D1_POINT_2F* D2D1_GRADIENT_MESH_PATCH 構造体の point12 に対応するグラデーションメッシュの内部点を返す。
pTensorPoint21 : [var] 型: D2D1_POINT_2F* D2D1_GRADIENT_MESH_PATCH 構造体の point21 に対応するグラデーションメッシュの内部点を返す。
pTensorPoint22 : [var] 型: D2D1_POINT_2F* D2D1_GRADIENT_MESH_PATCH 構造体の point22 に対応するグラデーションメッシュの内部点を返す。
%inst
Coons パッチを定義する点に基づいて、グラデーションメッシュパッチの内部点を返す。

[備考]
この関数は GradientMeshPatchFromCoonsPatch 関数から呼び出されるもので、直接利用することを想定していない。


%index
D2D1InvertMatrix
指定された行列の反転を試みる。
%prm
matrix
matrix : [var] 型: D2D1_MATRIX_3X2_F* 反転対象の行列。
%inst
指定された行列の反転を試みる。

[戻り値]
型: BOOL 行列が反転できた場合は true、それ以外は false。


%index
D2D1IsMatrixInvertible
指定された行列が反転可能かを示す。
%prm
matrix
matrix : [var] 型: const D2D1_MATRIX_3X2_F* 検査対象の行列。
%inst
指定された行列が反転可能かを示す。

[戻り値]
型: BOOL 行列が反転可能な場合は true、それ以外は false。


%index
D2D1MakeRotateMatrix
指定された点を中心に、指定された角度で回転させる変換を作成する。
%prm
angle, center, matrix
angle : [float] 型: FLOAT 時計回りの回転角度 (度単位)。
center : [var] 型: D2D1_POINT_2F 回転の中心となる点。
matrix : [var] 型: D2D1_MATRIX_3X2_F* このメソッドから戻るとき、新しい回転変換が格納される。このパラメータ用の領域は呼び出し側で確保する必要がある。
%inst
指定された点を中心に、指定された角度で回転させる変換を作成する。

[備考]
回転は 2D サーフェスの平面内で行われる。


%index
D2D1MakeSkewMatrix
指定された x 軸角度、y 軸角度、中心点を持つせん断変換を作成する。
%prm
angleX, angleY, center, matrix
angleX : [float] 型: FLOAT x 軸のせん断角度。y 軸から反時計回りに度単位で測定する。
angleY : [float] 型: FLOAT y 軸のせん断角度。x 軸から反時計回りに度単位で測定する。
center : [var] 型: D2D1_POINT_2F せん断操作の中心点。
matrix : [var] 型: D2D1_MATRIX_3X2_F* このメソッドから戻るとき、せん断変換が格納される。このパラメータ用の領域は呼び出し側で確保する必要がある。
%inst
指定された x 軸角度、y 軸角度、中心点を持つせん断変換を作成する。


%index
D2D1SinCos
角度のサインおよびコサインを返す。
%prm
angle, s, c
angle : [float] 型: FLOAT 計算対象の角度。
s : [var] 型: FLOAT* 角度のサイン。
c : [var] 型: FLOAT* 角度のコサイン。
%inst
角度のサインおよびコサインを返す。


%index
D2D1Tan
角度のタンジェントを返す。
%prm
angle
angle : [float] 型: FLOAT タンジェントを求める角度。
%inst
角度のタンジェントを返す。

[戻り値]
型: FLOAT 角度のタンジェント。


%index
D2D1Vec3Length
3 次元ベクトルの長さを返す。
%prm
x, y, z
x : [float] 型: FLOAT ベクトルの x 値。
y : [float] 型: FLOAT ベクトルの y 値。
z : [float] 型: FLOAT ベクトルの z 値。
%inst
3 次元ベクトルの長さを返す。

[戻り値]
型: FLOAT ベクトルの長さ。

