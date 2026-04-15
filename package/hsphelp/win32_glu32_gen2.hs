; ============================================================
;   glu32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
gluBeginCurve
gluBeginCurve と gluEndCurve は NURBS 曲線定義を区切る。 | gluBeginCurve 関数 (Glu.h)
%group
Win32 glu32
%prm
nobj
nobj : [intptr] NURBS オブジェクト (**gluNewNurbsRenderer** で作成)。
%inst
gluBeginCurve と gluEndCurve は NURBS 曲線定義を区切る。 | gluBeginCurve 関数
(Glu.h)

[戻り値]
この関数は値を返さない。

[備考]
**gluBeginCurve** で NURBS 曲線定義の開始をマークする。**gluBeginCurve**
呼び出し後、曲線属性を定義するために **gluNurbsCurve** を 1 回以上呼び出す。**gluNurbsCurve**
呼び出しのうち 1 つはちょうど GL_MAP1_VERTEX_3 または GL_MAP1_VERTEX_4
の曲線型でなければならない。NURBS 曲線定義の終了をマークするには **gluEndCurve** を呼び出す。NURBS 曲線は
OpenGL evaluator により線分列としてレンダリングされる。レンダリング中は
**glPushAttrib**(GL_EVAL_BIT) と **glPopAttrib** により evaluator
状態が保存される。


%index
gluBeginPolygon
gluBeginPolygon と gluEndPolygon はポリゴン記述を区切る。 | gluBeginPolygon 関数 (Glu.h)
%group
Win32 glu32
%prm
tess
tess : [intptr] テッセレーションオブジェクト (**gluNewTess** で作成)。
%inst
gluBeginPolygon と gluEndPolygon はポリゴン記述を区切る。 | gluBeginPolygon 関数
(Glu.h)

[戻り値]
この関数は値を返さない。

[備考]
**gluBeginPolygon** と **gluEndPolygon** で非凸ポリゴンの定義を区切る。1.
**gluBeginPolygon** を呼ぶ。2. 各頂点に対して **gluTessVertex**、新しい輪郭の開始には
**gluNextContour** を呼ぶ。3. **gluEndPolygon**
で定義終了を通知する。**gluEndPolygon**
が呼ばれるとポリゴンがテッセレートされ、生成された三角形がコールバックで通知される。


%index
gluBeginSurface
gluBeginSurface と gluEndSurface は NURBS サーフェス定義を区切る。 | gluBeginSurface 関数 (Glu.h)
%group
Win32 glu32
%prm
nobj
nobj : [intptr] NURBS オブジェクト (**gluNewNurbsRenderer** で作成)。
%inst
gluBeginSurface と gluEndSurface は NURBS サーフェス定義を区切る。 |
gluBeginSurface 関数 (Glu.h)

[戻り値]
この関数は値を返さない。

[備考]
**gluBeginSurface** と **gluEndSurface** は NURBS
サーフェス定義の開始と終了をマークする。サーフェスは **gluNurbsSurface** の呼び出しで定義する。1.
**gluBeginSurface** で開始をマークする。2. **gluNurbsSurface** を 1
回以上呼び出す。これらのうち 1 つはちょうど GL_MAP2_VERTEX_3 または GL_MAP2_VERTEX_4
の型でなければならない。3. **gluEndSurface**
で終了をマークする。**gluBeginTrim**、**gluPwlCurve**、**gluNurbsCurve**、**gluEndTrim**
で NURBS サーフェスのトリミングをサポートする。NURBS サーフェスは OpenGL evaluator
によりポリゴン集合としてレンダリングされる。


%index
gluBeginTrim
gluBeginTrim と gluEndTrim は NURBS トリミングループ定義を区切る。 | gluBeginTrim 関数 (Glu.h)
%group
Win32 glu32
%prm
nobj
nobj : [intptr] NURBS オブジェクト (**gluNewNurbsRenderer** で作成)。
%inst
gluBeginTrim と gluEndTrim は NURBS トリミングループ定義を区切る。 | gluBeginTrim 関数
(Glu.h)

[戻り値]
この関数は値を返さない。

[備考]
**gluBeginTrim** と **gluEndTrim** でトリミングループを区切る。トリミングループは NURBS
サーフェスの境界を定義する閉曲線 (向き付き曲線セグメントの集合) である。**gluBeginSurface** と
**gluEndSurface** の間で NURBS サーフェス定義に含める。1 つの NURBS
サーフェス定義は複数のトリミングループを含められる。例えば穴の開いた長方形のようなサーフェスでは、外枠用と穴用の 2 つのループを使う。1
つのトリミングループは複数の曲線セグメント (線形 **gluPwlCurve**、単一 NURBS
**gluNurbsCurve**、またはこれらの組み合わせ)
から構成できる。**gluBeginTrim**/**gluEndTrim** 間で呼べるのは **gluPwlCurve** と
**gluNurbsCurve** のみである。NURBS サーフェスの表示領域はトリミング曲線の左側 (曲線パラメータが増加する方向)
となる。すなわち反時計回りのループの内側、時計回りのループの外側が保持される。曲線終端は正確に一致する必要があり、十分近ければ強制的に一致させられ、そうでなければエラーとなる。複数曲線の向きは一貫している必要がある。ネストしたループも向きが交互に正しければ使用できる。自己交差や曲線同士の交差はエラー。トリミング情報が与えられない場合はサーフェス全体が描画される。


%index
gluBuild1DMipmaps
gluBuild1DMipmaps 関数は 1 次元ミップマップを生成する。
%group
Win32 glu32
%prm
target, components, width, format, type, data
target : [int] 対象テクスチャ。GL_TEXTURE_1D でなければならない。
components : [int] テクスチャのカラーコンポーネント数。1、2、3、4 のいずれか。
width : [int] テクスチャ画像の幅。
format : [int] ピクセルデータの形式。有効値: GL_COLOR_INDEX, GL_RED, GL_GREEN, GL_BLUE, GL_ALPHA, GL_RGB, GL_RGBA, GL_BGR_EXT, GL_BGRA_EXT, GL_LUMINANCE, GL_LUMINANCE_ALPHA。
type : [int] *data* のデータ型。有効値: GL_UNSIGNED_BYTE, GL_BYTE, GL_BITMAP, GL_UNSIGNED_SHORT, GL_SHORT, GL_UNSIGNED_INT, GL_INT, GL_FLOAT。
data : [intptr] メモリ内の画像データへのポインタ。
%inst
gluBuild1DMipmaps 関数は 1 次元ミップマップを生成する。

[戻り値]
この関数は値を返さない。

[備考]
**gluBuild1DMipmaps** は入力画像を取得し、**gluScaleImage**
を使って全ミップマップ画像を生成する。各画像は **glTexImage1D** で読み込まれる。入力画像の幅が 2
のべき乗でない場合、生成前に最も近い 2 のべき乗にスケールされる。戻り値 0 は成功を示し、そうでなければ GLU エラーコードが返る。


%index
gluBuild2DMipmaps
gluBuild2DMipmaps 関数は 2 次元ミップマップを生成する。
%group
Win32 glu32
%prm
target, components, width, height, format, type, data
target : [int] 対象テクスチャ。GL_TEXTURE_2D でなければならない。
components : [int] テクスチャのカラーコンポーネント数。1、2、3、4 のいずれか。
width : [int] テクスチャ画像の幅。
height : [int] テクスチャ画像の高さ。
format : [int] ピクセルデータの形式。有効値: GL_COLOR_INDEX, GL_RED, GL_GREEN, GL_BLUE, GL_ALPHA, GL_RGB, GL_RGBA, GL_BGR_EXT, GL_BGRA_EXT, GL_LUMINANCE, GL_LUMINANCE_ALPHA。
type : [int] *data* のデータ型。有効値: GL_UNSIGNED_BYTE, GL_BYTE, GL_BITMAP, GL_UNSIGNED_SHORT, GL_SHORT, GL_UNSIGNED_INT, GL_INT, GL_FLOAT。
data : [intptr] メモリ内の画像データへのポインタ。
%inst
gluBuild2DMipmaps 関数は 2 次元ミップマップを生成する。

[戻り値]
この関数は値を返さない。

[備考]
**gluBuild2DMipmaps** は入力画像を取得し、**gluScaleImage**
で全ミップマップ画像を生成する。各画像は **glTexImage2D** で読み込まれる。入力画像の寸法が 2
のべき乗でない場合、生成前に幅・高さの両方が 2 のべき乗にスケールされる。戻り値 0 は成功を示し、そうでなければ GLU
エラーコードが返る。


%index
gluCylinder
gluCylinder 関数は円柱を描画する。
%group
Win32 glu32
%prm
qobj, baseRadius, topRadius, height, slices, stacks
qobj : [intptr] Quadric オブジェクト (**gluNewQuadric** で作成)。
baseRadius : [double] *z* = 0 における円柱の半径。
topRadius : [double] *z* = *height* における円柱の半径。
height : [double] 円柱の高さ。
slices : [int] z 軸周りの分割数。
stacks : [int] z 軸方向の分割数。
%inst
gluCylinder 関数は円柱を描画する。

[戻り値]
この関数は値を返さない。

[備考]
**gluCylinder** は z 軸に沿って向き付けされた円柱を描画する。底面は *z* = 0、上面は *z* =
*height* に配置される。球と同様に slices と stacks で分割される。*topRadius* を 0
にすると円錐が生成される。向きが GLU_OUTSIDE (**gluQuadricOrientation**) の場合、法線は z
軸から離れる方向を向く。テクスチャが有効 (**gluQuadricTexture**) の場合、*t* は *z* = 0 で 0.0
から *z* = *height* で 1.0 まで線形変化し、*s* は y+ 軸 0.0、x+ 軸 0.25、y- 軸 0.5、x-
軸 0.75、y+ 軸で 1.0 に戻る。


%index
gluDeleteNurbsRenderer
gluDeleteNurbsRenderer 関数は NURBS オブジェクトを破棄する。
%group
Win32 glu32
%prm
nobj
nobj : [intptr] 破棄する NURBS オブジェクト (**gluNewNurbsRenderer** で作成)。
%inst
gluDeleteNurbsRenderer 関数は NURBS オブジェクトを破棄する。

[戻り値]
この関数は値を返さない。

[備考]
**gluDeleteNurbsRenderer** は NURBS オブジェクトを破棄し、使用していたメモリを解放する。呼び出し後は
*nobj* を使用できない。


%index
gluDeleteQuadric
gluDeleteQuadric 関数は Quadric オブジェクトを破棄する。
%group
Win32 glu32
%prm
state
state : [intptr] 破棄する Quadric オブジェクト (**gluNewQuadric** で作成)。
%inst
gluDeleteQuadric 関数は Quadric オブジェクトを破棄する。

[戻り値]
この関数は値を返さない。

[備考]
**gluDeleteQuadric** は Quadric オブジェクトを破棄しメモリを解放する。呼び出し後は *state*
を使用できない。


%index
gluDeleteTess
gluDeleteTess 関数はテッセレーションオブジェクトを破棄する。
%group
Win32 glu32
%prm
tess
tess : [intptr] 破棄するテッセレーションオブジェクト (**gluNewTess** で作成)。
%inst
gluDeleteTess 関数はテッセレーションオブジェクトを破棄する。

[戻り値]
この関数は値を返さない。

[備考]
**gluDeleteTess** は指定テッセレーションオブジェクトを破棄しメモリを解放する。


%index
gluDisk
gluDisk 関数は円盤を描画する。
%group
Win32 glu32
%prm
qobj, innerRadius, outerRadius, slices, loops
qobj : [intptr] Quadric オブジェクト (**gluNewQuadric** で作成)。
innerRadius : [double] 円盤の内半径 (0 でもよい)。
outerRadius : [double] 円盤の外半径。
slices : [int] z 軸周りの分割数。
loops : [int] 原点周りで円盤を分割する同心円リング数。
%inst
gluDisk 関数は円盤を描画する。

[戻り値]
この関数は値を返さない。

[備考]
**gluDisk** は *z* = 0 平面に円盤を描画する。外半径は *outerRadius*、内半径は
*innerRadius* の同心円穴を持つ。*innerRadius* が 0 なら穴はない。円盤は z 軸周りに slices、z
軸周りに loops で分割される。向きに関して、正の *z* 側が外側と見なされる。GLU_OUTSIDE なら法線は正 z
軸方向を指す。テクスチャが有効なら座標は線形に生成される。


%index
gluEndCurve
gluBeginCurve と gluEndCurve は NURBS 曲線定義を区切る。 | gluEndCurve 関数 (Glu.h)
%group
Win32 glu32
%prm
nobj
nobj : [intptr] NURBS オブジェクト (**gluNewNurbsRenderer** で作成)。
%inst
gluBeginCurve と gluEndCurve は NURBS 曲線定義を区切る。 | gluEndCurve 関数
(Glu.h)

[戻り値]
この関数は値を返さない。

[備考]
**gluBeginCurve** で NURBS 曲線定義の開始をマークする。**gluBeginCurve**
後、**gluNurbsCurve** を 1 回以上呼ぶ。うち 1 つは GL_MAP1_VERTEX_3 または
GL_MAP1_VERTEX_4 型でなければならない。終了は **gluEndCurve** でマークする。NURBS 曲線は
OpenGL evaluator により線分列としてレンダリングされる。


%index
gluEndPolygon
gluBeginPolygon と gluEndPolygon はポリゴン記述を区切る。 | gluEndPolygon 関数 (Glu.h)
%group
Win32 glu32
%prm
tess
tess : [intptr] テッセレーションオブジェクト (**gluNewTess** で作成)。
%inst
gluBeginPolygon と gluEndPolygon はポリゴン記述を区切る。 | gluEndPolygon 関数
(Glu.h)

[戻り値]
この関数は値を返さない。

[備考]
**gluBeginPolygon** と **gluEndPolygon** で非凸ポリゴンの定義を区切る。1.
**gluBeginPolygon** を呼ぶ。2. 頂点ごとに **gluTessVertex**、新輪郭ごとに
**gluNextContour** を呼ぶ。3. **gluEndPolygon**
で定義終了を通知する。ポリゴンはテッセレートされ三角形がコールバックで通知される。


%index
gluEndSurface
gluBeginSurface と gluEndSurface は NURBS サーフェス定義を区切る。 | gluEndSurface 関数 (Glu.h)
%group
Win32 glu32
%prm
nobj
nobj : [intptr] NURBS オブジェクト (**gluNewNurbsRenderer** で作成)。
%inst
gluBeginSurface と gluEndSurface は NURBS サーフェス定義を区切る。 | gluEndSurface
関数 (Glu.h)

[戻り値]
この関数は値を返さない。

[備考]
**gluBeginSurface** と **gluEndSurface** は NURBS
サーフェス定義の開始と終了をマークし、**gluNurbsSurface** で定義する。1. **gluBeginSurface**
で開始をマークする。2. **gluNurbsSurface** を 1 回以上呼ぶ。うち 1 つは GL_MAP2_VERTEX_3
または GL_MAP2_VERTEX_4 型でなければならない。3. **gluEndSurface**
で終了をマークする。**gluBeginTrim**、**gluPwlCurve**、**gluNurbsCurve**、**gluEndTrim**
がトリミングをサポートする。


%index
gluEndTrim
gluBeginTrim と gluEndTrim は NURBS トリミングループ定義を区切る。 | gluEndTrim 関数 (Glu.h)
%group
Win32 glu32
%prm
nobj
nobj : [intptr] NURBS オブジェクト (**gluNewNurbsRenderer** で作成)。
%inst
gluBeginTrim と gluEndTrim は NURBS トリミングループ定義を区切る。 | gluEndTrim 関数
(Glu.h)

[戻り値]
この関数は値を返さない。

[備考]
**gluBeginTrim** と **gluEndTrim** でトリミングループを区切る。トリミングループは NURBS
サーフェスの境界を定義する閉曲線である。**gluBeginSurface** と **gluEndSurface**
の間でサーフェス定義に含める。1 つのサーフェスは複数のトリミングループを持てる。各ループは複数曲線セグメント
(**gluPwlCurve** や **gluNurbsCurve** またはその組み合わせ)
から構成できる。**gluBeginTrim**/**gluEndTrim** 間で呼べるのは **gluPwlCurve** と
**gluNurbsCurve**
のみ。表示領域は曲線の左側。反時計回りループの内側、時計回りループの外側が保持される。曲線終端は正確に一致する必要があり、近ければ強制一致される。自己交差・相互交差はエラーとなる。


%index
gluErrorString
gluErrorString 関数は OpenGL または GLU のエラーコードから ANSI エラー文字列を生成する。
%group
Win32 glu32
%prm
errCode
errCode : [int] OpenGL または GLU のエラーコード。
%inst
gluErrorString 関数は OpenGL または GLU のエラーコードから ANSI エラー文字列を生成する。

[備考]
**gluErrorString** は OpenGL または GLU のエラーコードからエラー文字列を生成する。文字列は ISO
Latin 1 形式である。例えば **gluErrorString**(GL_OUT_OF_MEMORY) は "out of
memory" を返す。標準の GLU エラーコードは
GLU_INVALID_ENUM、GLU_INVALID_VALUE、GLU_OUT_OF_MEMORY である。OpenGL
のエラーコードについては **glGetError** を参照。**gluErrorString** は ANSI
のみでエラー文字列を生成する。可能なら ANSI/Unicode 両対応の **gluErrorStringWIN**
を使用する方がローカライズしやすい。


%index
gluErrorUnicodeStringEXT
(no summary)
%group
Win32 glu32
%prm
errCode
errCode : [int] 
%inst



%index
gluGetNurbsProperty
gluGetNurbsProperty 関数は NURBS プロパティを取得する。
%group
Win32 glu32
%prm
nobj, property, value
nobj : [intptr] NURBS オブジェクト (**gluNewNurbsRenderer** で作成)。
property : [int] 取得するプロパティ。有効値: GLU_SAMPLING_TOLERANCE、GLU_DISPLAY_MODE、GLU_CULLING、GLU_AUTO_LOAD_MATRIX、GLU_PARAMETRIC_TOLERANCE、GLU_SAMPLING_METHOD、GLU_U_STEP、GLU_V_STEP。
value : [var] 指定プロパティの値を書き込むロケーションへのポインタ。
%inst
gluGetNurbsProperty 関数は NURBS プロパティを取得する。

[戻り値]
この関数は値を返さない。

[備考]
**gluGetNurbsProperty** で NURBS オブジェクトに格納されたプロパティを取得する。プロパティは NURBS
曲線・サーフェスのレンダリング方法に影響する。詳細は **gluNurbsProperty** を参照。


%index
gluGetString
gluGetString 関数は GLU バージョン番号またはサポートされている GLU 拡張呼び出しを示す文字列を取得する。
%group
Win32 glu32
%prm
name
name : [int] GLU のバージョン番号 (GLU_VERSION) またはベンダー固有拡張呼び出し (GLU_EXTENSIONS) のいずれか。
%inst
gluGetString 関数は GLU バージョン番号またはサポートされている GLU 拡張呼び出しを示す文字列を取得する。

[備考]
**gluGetString** は静的な NULL 終端文字列へのポインタを返す。*name* が GLU_VERSION
の場合、戻り値は GLU のバージョン番号を表す。バージョン番号の形式は次のとおり。このドキュメントは省略されている。


%index
gluGetTessProperty
gluGetTessProperty 関数はテッセレーションオブジェクトのプロパティを取得する。
%group
Win32 glu32
%prm
tess, which, value
tess : [intptr] テッセレーションオブジェクト (**gluNewTess** で作成)。
which : [int] 取得するプロパティ。有効値: GLU_TESS_WINDING_RULE、GLU_TESS_BOUNDARY_ONLY、GLU_TESS_TOLERANCE。
value : [var] 指定プロパティの値を書き込むロケーションへのポインタ。
%inst
gluGetTessProperty 関数はテッセレーションオブジェクトのプロパティを取得する。

[戻り値]
この関数は値を返さない。

[備考]
**gluGetTessProperty**
はテッセレーションオブジェクトに格納されたプロパティを取得する。プロパティはテッセレーションオブジェクトの解釈・レンダリング方法に影響する。詳細は
**gluTessProperty** を参照。


%index
gluLoadSamplingMatrices
gluLoadSamplingMatrices 関数は NURBS のサンプリング行列とカリング行列をロードする。
%group
Win32 glu32
%prm
nobj, modelMatrix, projMatrix, viewport
nobj : [intptr] NURBS オブジェクト (**gluNewNurbsRenderer** で作成)。
modelMatrix : [var] モデルビュー行列 (**glGetFloatv** から取得)。
projMatrix : [var] 射影行列 (**glGetFloatv** から取得)。
viewport : [var] ビューポート (**glGetIntegerv** から取得)。
%inst
gluLoadSamplingMatrices 関数は NURBS のサンプリング行列とカリング行列をロードする。

[戻り値]
この関数は値を返さない。

[備考]
**gluLoadSamplingMatrices** は *modelMatrix*、*projMatrix*、*viewport*
を使って *nobj* に格納されたサンプリング行列とカリング行列を再計算する。サンプリング行列は
GLU_SAMPLING_TOLERANCE を満たすためにどれだけ細かくテッセレートするかを決定する。カリング行列は NURBS
曲線・サーフェスをレンダリング前にカリングするかを決定する (GLU_CULLING がオンのとき)。この関数は
GLU_AUTO_LOAD_MATRIX がオフの場合にのみ必要である。GLU_AUTO_LOAD_MATRIX
をオンにしておく方が便利だが、現在のモデルビュー行列・射影行列・ビューポートを取得するための OpenGL
サーバーへのラウンドトリップが必要となる。


%index
gluLookAt
gluLookAt 関数はビュー変換を定義する。
%group
Win32 glu32
%prm
eyex, eyey, eyez, centerx, centery, centerz, upx, upy, upz
eyex : [double] 視点の位置。
eyey : [double] 視点の位置。
eyez : [double] 視点の位置。
centerx : [double] 参照点の位置。
centery : [double] 参照点の位置。
centerz : [double] 参照点の位置。
upx : [double] 上方向ベクトル。
upy : [double] 上方向ベクトル。
upz : [double] 上方向ベクトル。
%inst
gluLookAt 関数はビュー変換を定義する。

[戻り値]
この関数は値を返さない。

[備考]
**gluLookAt** は視点、シーン中心を示す参照点、上方向ベクトルからビュー行列を生成する。行列は参照点を負の z
軸に、視点を原点にマップするため、典型的な射影行列を使うとシーンの中心がビューポートの中心にマップされる。上方向ベクトルは視線と平行であってはならない。**gluLookAt**
で生成された行列は現在の行列に右から乗算される。


%index
gluNewNurbsRenderer
gluNewNurbsRenderer 関数は NURBS オブジェクトを作成する。
%group
Win32 glu32
%prm

%inst
gluNewNurbsRenderer 関数は NURBS オブジェクトを作成する。

[備考]
この関数に引数はない。**gluNewNurbsRenderer** は新しい NURBS
オブジェクトを作成してそのポインタを返す。NURBS のレンダリング・制御関数を呼ぶときにこのオブジェクトを参照する。戻り値が 0
の場合はメモリ不足を意味する。


%index
gluNewQuadric
gluNewQuadric 関数は Quadric オブジェクトを作成する。
%group
Win32 glu32
%prm

%inst
gluNewQuadric 関数は Quadric オブジェクトを作成する。

[備考]
この関数に引数はない。**gluNewQuadric** は新しい Quadric オブジェクトを作成してそのポインタを返す。戻り値が 0
の場合はメモリ不足を意味する。


%index
gluNewTess
gluNewTess 関数はテッセレーションオブジェクトを作成する。
%group
Win32 glu32
%prm

%inst
gluNewTess 関数はテッセレーションオブジェクトを作成する。

[備考]
この関数に引数はない。**gluNewTess** は新しいテッセレーションオブジェクトを作成してそのポインタを返す。戻り値が 0
の場合はメモリ不足を意味する。


%index
gluNextContour
gluNextContour 関数は別の輪郭の開始をマークする。
%group
Win32 glu32
%prm
tess, type
tess : [intptr] テッセレーションオブジェクト (**gluNewTess** で作成)。
type : [int] 定義される輪郭の型。GLU_EXTERIOR は外側境界、GLU_INTERIOR は内側境界 (穴など)、GLU_UNKNOWN はライブラリが解析、GLU_CCW/GLU_CW は最初の輪郭を外側とし、同方向のものを外側、逆を内側と判定する。このドキュメントは省略されている。
%inst
gluNextContour 関数は別の輪郭の開始をマークする。

[戻り値]
この関数は値を返さない。

[備考]
**gluNextContour** は複数輪郭を持つポリゴンを記述するために使う。最初の輪郭を一連の **gluTessVertex**
呼び出しで記述した後、**gluNextContour** 呼び出しで前輪郭の終了と次輪郭の開始を示す。新しい輪郭に対して再度
**gluTessVertex** を呼び、これを繰り返す。*type*
は次の輪郭の型を定義する。最初の輪郭の型を指定するため、最初の輪郭の前に **gluNextContour**
を呼び出せる。呼ばない場合は GLU_EXTERIOR としてマークされる。


%index
gluNurbsCallback
gluNurbsCallback 関数は NURBS オブジェクトのコールバックを定義する。
%group
Win32 glu32
%prm
nobj, which, fn
nobj : [intptr] NURBS オブジェクト (**gluNewNurbsRenderer** で作成)。
which : [int] 定義するコールバック。唯一の有効値は GLU_ERROR で、エラー発生時にエラー関数が呼ばれる。引数は **GLenum** 型で具体的エラーを示す。NURBS 固有の 37 個のエラー (GLU_NURBS_ERROR1 ～ GLU_NURBS_ERROR37) があり、**gluErrorString** で説明文字列を取得できる。
fn : [int] コールバック関数へのポインタ。
%inst
gluNurbsCallback 関数は NURBS オブジェクトのコールバックを定義する。

[戻り値]
この関数は値を返さない。

[備考]
**gluNurbsCallback** は NURBS
オブジェクトで使用されるコールバックを定義する。既に定義されていれば置き換えられる。*fn* が **NULL**
なら既存コールバックは消去される。


%index
gluNurbsCurve
gluNurbsCurve 関数は NURBS 曲線の形状を定義する。
%group
Win32 glu32
%prm
nobj, nknots, knot, stride, ctlarray, order, type
nobj : [intptr] NURBS オブジェクト (**gluNewNurbsRenderer** で作成)。
nknots : [int] *knot* のノット数。*nknots* は制御点数 + オーダーに等しい。
knot : [var] *nknots* 個の非減少ノット値の配列。
stride : [int] 連続する制御点間のオフセット (単精度浮動小数点値の数)。
ctlarray : [var] 制御点の配列へのポインタ。座標は *type* に合致する必要がある。
order : [int] NURBS 曲線のオーダー。*order* = degree + 1、したがって 3 次曲線なら 4。
type : [int] 曲線の型。**gluBeginCurve**/**gluEndCurve** 間で定義された曲線なら、GL_MAP1_VERTEX_3 や GL_MAP1_COLOR_4 など任意の 1 次元 evaluator 型を使える。**gluBeginTrim**/**gluEndTrim** 間では GLU_MAP1_TRIM_2 または GLU_MAP1_TRIM_3 のみ有効。
%inst
gluNurbsCurve 関数は NURBS 曲線の形状を定義する。

[戻り値]
この関数は値を返さない。

[備考]
**gluNurbsCurve** が **gluBeginCurve**/**gluEndCurve**
対の中にあるときはレンダリング対象の曲線を表す。位置・テクスチャ・色座標はそれぞれ別の **gluNurbsCurve**
呼び出しで関連付ける。1 対の中で同じ種別の呼び出しを 2 度以上してはならない。位置は GL_MAP1_VERTEX_3 または
GL_MAP1_VERTEX_4 でちょうど 1 回呼ぶ。**gluBeginTrim**/**gluEndTrim**
対の中ではトリミング曲線を表し、GLU_MAP1_TRIM_2 なら 2 次元 (*u*, *v*)
パラメータ空間、GLU_MAP1_TRIM_3 なら同次 (*u*, *v*, *w*) 空間で曲線を定義する。


%index
gluNurbsProperty
gluNurbsProperty 関数は NURBS プロパティを設定する。
%group
Win32 glu32
%prm
nobj, property, value
nobj : [intptr] NURBS オブジェクト (**gluNewNurbsRenderer** で作成)。
property : [int] 設定するプロパティ。GLU_SAMPLING_TOLERANCE (サンプリング方法が GLU_PATH_LENGTH のときの最大エッジ長ピクセル、既定 50.0)、GLU_DISPLAY_MODE (サーフェスの描画方法: GLU_FILL, GLU_OUTLINE_POLYGON, GLU_OUTLINE_PATCH)、GLU_CULLING (制御点が現ビューポート外のカーブをテッセレーション前に破棄するか、既定 GL_FALSE)、GLU_AUTO_LOAD_MATRIX (既定 GL_TRUE で NURBS コードが射影行列・モデルビュー行列・ビューポートをダウンロードする)、GLU_PARAMETRIC_TOLERANCE (GLU_PARAMETRIC_ERROR 時の最大距離ピクセル、既定 0.5)、GLU_SAMPLING_METHOD (テッセレーション方法: GLU_PATH_LENGTH, GLU_PARAMETRIC_ERROR, GLU_DOMAIN_DISTANCE)、GLU_U_STEP, GLU_V_STEP (GLU_DOMAIN_DISTANCE 時の単位長あたりサンプル数、既定 100)。このドキュメントは省略されている。
value : [float] 指定プロパティに設定する値。*value* は数値または GLU_PATH_LENGTH、GLU_PARAMETRIC_ERROR、GLU_DOMAIN_DISTANCE の 3 値のいずれか。GLU_PATH_LENGTH は既定でテッセレーションポリゴンのエッジ最大長を GLU_SAMPLING_TOLERANCE 以下にする。GLU_PARAMETRIC_ERROR は GLU_PARAMETRIC_TOLERANCE を最大距離とする。GLU_DOMAIN_DISTANCE はパラメトリック座標で *u*/*v* 方向の単位長あたりサンプル数を指定する。
%inst
gluNurbsProperty 関数は NURBS プロパティを設定する。

[戻り値]
この関数は値を返さない。

[備考]
**gluNurbsProperty** は NURBS オブジェクトに格納されたプロパティを制御する。これらのプロパティは NURBS
曲線のレンダリング方法に影響する。


%index
gluNurbsSurface
gluNurbsSurface 関数は NURBS サーフェスの形状を定義する。
%group
Win32 glu32
%prm
nobj, sknot_count, sknot, tknot_count, tknot, s_stride, t_stride, ctlarray, sorder, torder, type
nobj : [intptr] NURBS オブジェクト (**gluNewNurbsRenderer** で作成)。*sknot_count* はパラメトリック *u* 方向のノット数。
sknot_count : [int] 
sknot : [var] パラメトリック *u* 方向の *sknot_count* 個の非減少ノット値の配列。*tknot_count* はパラメトリック *v* 方向のノット数。
tknot_count : [int] 
tknot : [var] パラメトリック *v* 方向の *tknot_count* 個の非減少ノット値の配列。*s_stride*/*t_stride* は *ctlarray* 内での *u*/*v* 方向連続制御点間のオフセット (単精度浮動小数点値)。
s_stride : [int] 
t_stride : [int] 
ctlarray : [var] NURBS サーフェスの制御点配列。パラメトリック *u*/*v* 方向の連続制御点間オフセットは *s_stride* と *t_stride* で与えられる。
sorder : [int] パラメトリック *u* 方向のオーダー。degree + 1 (3 次なら 4)。
torder : [int] パラメトリック *v* 方向のオーダー。degree + 1 (3 次なら 4)。
type : [int] サーフェスの型。GL_MAP2_VERTEX_3 や GL_MAP2_COLOR_4 など任意の 2 次元 evaluator 型を指定できる。
%inst
gluNurbsSurface 関数は NURBS サーフェスの形状を定義する。

[戻り値]
この関数は値を返さない。

[備考]
**gluNurbsSurface** は NURBS サーフェス定義内で使用し、トリミング前の形状を記述する。開始は
**gluBeginSurface**、終了は **gluEndSurface** でマークする。NURBS
サーフェス定義内でのみ呼び出せる。位置・テクスチャ・色座標はそれぞれ別の **gluNurbsSurface**
で関連付ける。位置はちょうど 1 回 GL_MAP2_VERTEX_3 または GL_MAP2_VERTEX_4
で呼ぶ。**gluBeginTrim**/**gluEndTrim** 間の
**gluNurbsCurve**/**gluPwlCurve** でトリミングできる。*u* に *sknot_count* 個、*v*
に *tknot_count* 個のノット、オーダー *sorder*/*torder* のとき、制御点数は (*sknot_count*
- *sorder*) × (*tknot_count* - *torder*) でなければならない。


%index
gluOrtho2D
gluOrtho2D 関数は 2 次元正射投影行列を定義する。
%group
Win32 glu32
%prm
left, right, bottom, top
left : [double] 左側垂直クリッピング平面の座標。
right : [double] 右側垂直クリッピング平面の座標。
bottom : [double] 下側水平クリッピング平面の座標。
top : [double] 上側水平クリッピング平面の座標。
%inst
gluOrtho2D 関数は 2 次元正射投影行列を定義する。

[戻り値]
この関数は値を返さない。

[備考]
**gluOrtho2D** は 2 次元正射投影ビュー領域を設定する。**glOrtho** を zNear = -1、zFar = 1
で呼ぶのと等価である。


%index
gluPartialDisk
gluPartialDisk 関数は円盤の弧を描画する。
%group
Win32 glu32
%prm
qobj, innerRadius, outerRadius, slices, loops, startAngle, sweepAngle
qobj : [intptr] Quadric オブジェクト (**gluNewQuadric** で作成)。
innerRadius : [double] 部分円盤の内半径 (0 でもよい)。
outerRadius : [double] 部分円盤の外半径。
slices : [int] z 軸周りの分割数。
loops : [int] 原点周りで部分円盤を分割する同心円リング数。
startAngle : [double] 円盤部分の開始角度 (度単位)。
sweepAngle : [double] 円盤部分の掃引角度 (度単位)。
%inst
gluPartialDisk 関数は円盤の弧を描画する。

[戻り値]
この関数は値を返さない。

[備考]
**gluPartialDisk** は *z* = 0 平面に部分円盤を描画する。完全な円盤と同じだが、*startAngle* から
*startAngle* + *sweepAngle* の部分だけが含まれる (0 度は y+ 軸、90 度は x+ 軸、180 度は
y- 軸、270 度は x- 軸)。半径は *outerRadius*、内側に *innerRadius*
の穴。*innerRadius* が 0 なら穴なし。z 軸周りに slices、同心円に loops で分割される。正の z 側が外側。


%index
gluPerspective
gluPerspective 関数は透視投影行列を設定する。
%group
Win32 glu32
%prm
fovy, aspect, zNear, zFar
fovy : [double] y 方向の視野角 (度単位)。
aspect : [double] x 方向の視界を決めるアスペクト比。x (幅) 対 y (高さ) の比。
zNear : [double] 視点から近方クリッピング平面までの距離 (常に正)。
zFar : [double] 視点から遠方クリッピング平面までの距離 (常に正)。
%inst
gluPerspective 関数は透視投影行列を設定する。

[戻り値]
この関数は値を返さない。

[備考]
**gluPerspective** はワールド座標系への視野錘台を指定する。一般にアスペクト比は関連ビューポートに一致させる。例えば
*aspect* = 2.0 は x 方向が y 方向の 2 倍の視野角。ビューポートが横 2 倍なら歪みなく表示される。生成行列は
**glMultMatrix** と同様に現在行列に乗算される。代わりに行列スタックにロードするには、**gluPerspective**
の前に **glLoadIdentity** を呼ぶ。


%index
gluPickMatrix
gluPickMatrix 関数はピッキング領域を定義する。
%group
Win32 glu32
%prm
x, y, width, height, viewport
x : [double] ピッキング領域の x ウィンドウ座標。
y : [double] ピッキング領域の y ウィンドウ座標。
width : [double] ウィンドウ座標系でのピッキング領域の幅。
height : [double] ウィンドウ座標系でのピッキング領域の高さ。
viewport : [var] 現在のビューポート (**glGetIntegerv** から取得)。
%inst
gluPickMatrix 関数はピッキング領域を定義する。

[戻り値]
この関数は値を返さない。

[備考]
**gluPickMatrix** はビューポートの小領域に描画を制限するための射影行列を生成する。1.
**gluPickMatrix** でカーソル周辺の小領域に描画制限する。2. **glRenderMode**
で選択モードに入り、シーンを再レンダリングする。カーソル近傍で描画されるはずだったプリミティブは識別され選択バッファに保存される。生成行列は現在行列に右から乗算される。1.
**glLoadIdentity** で透視行列スタックに単位行列をロードする。2. **gluPickMatrix** を呼ぶ。3.
**gluPerspective** のような関数を呼んで透視行列にピック行列を乗算する。NURBS のピック時は
GLU_AUTO_LOAD_MATRIX をオフにしないとピック時と非ピック時で分割が異なることに注意。


%index
gluProject
gluProject 関数はオブジェクト座標をウィンドウ座標にマップする。
%group
Win32 glu32
%prm
objx, objy, objz, modelMatrix, projMatrix, viewport, winx, winy, winz
objx : [double] x オブジェクト座標。
objy : [double] y オブジェクト座標。
objz : [double] z オブジェクト座標。
modelMatrix : [var] 現在のモデルビュー行列 (**glGetDoublev** から取得)。
projMatrix : [var] 現在の射影行列 (**glGetDoublev** から取得)。
viewport : [var] 現在のビューポート (**glGetIntegerv** から取得)。
winx : [var] 計算された x ウィンドウ座標。
winy : [var] 計算された y ウィンドウ座標。
winz : [var] 計算された z ウィンドウ座標。
%inst
gluProject 関数はオブジェクト座標をウィンドウ座標にマップする。

[戻り値]
関数が成功すると戻り値は GL_TRUE となる。関数が失敗した場合、戻り値は GL_FALSE となる。

[備考]
**gluProject** は *modelMatrix*、*projMatrix*、*viewport*
を使って指定オブジェクト座標をウィンドウ座標に変換する。結果は *winx*、*winy*、*winz* に格納される。


%index
gluPwlCurve
gluPwlCurve 関数は区分線形 NURBS トリミング曲線を記述する。
%group
Win32 glu32
%prm
nobj, count, array, stride, type
nobj : [intptr] NURBS オブジェクト (**gluNewNurbsRenderer** で作成)。
count : [int] 曲線上の点数。
array : [var] 曲線点を含む配列。
stride : [int] 曲線上の点間のオフセット (単精度浮動小数点値の数)。
type : [int] 曲線の型。GLU_MAP1_TRIM_2 または GLU_MAP1_TRIM_3 でなければならない。
%inst
gluPwlCurve 関数は区分線形 NURBS トリミング曲線を記述する。

[戻り値]
この関数は値を返さない。

[備考]
**gluPwlCurve** は NURBS サーフェス用の区分線形トリミング曲線を記述する。区分線形曲線はトリミングされる NURBS
サーフェスのパラメータ空間上の点座標リストから成り、点は線分で結ばれる。実曲線の近似なら、結果のパスがアプリの解像度で曲線に見える程度に十分近い点にする必要がある。*type*
が GLU_MAP1_TRIM_2 なら 2 次元 (*u*, *v*) パラメータ空間、GLU_MAP1_TRIM_3 なら同次
(*u*, *v*, *w*) 空間の曲線を表す。


%index
gluQuadricCallback
gluQuadricCallback 関数は Quadric オブジェクトのコールバックを定義する。
%group
Win32 glu32
%prm
qobj, which, fn
qobj : [intptr] Quadric オブジェクト (**gluNewQuadric** で作成)。
which : [int] 定義するコールバック。唯一の有効値は GLU_ERROR で、エラー発生時に呼ばれる。引数は **GLenum** 型で具体的エラーを示し、**gluErrorString** で説明文字列を取得できる。
fn : [int] 呼び出される関数。
%inst
gluQuadricCallback 関数は Quadric オブジェクトのコールバックを定義する。

[戻り値]
この関数は値を返さない。

[備考]
**gluQuadricCallback** は Quadric
オブジェクトで使用される新しいコールバックを定義する。既に定義されていれば置き換えられる。*fn* が **NULL**
なら既存コールバックは消去される。


%index
gluQuadricDrawStyle
gluQuadricDrawStyle 関数は Quadric の描画スタイルを指定する。
%group
Win32 glu32
%prm
quadObject, drawStyle
quadObject : [intptr] Quadric オブジェクト (**gluNewQuadric** で作成)。
drawStyle : [int] 描画スタイル。GLU_FILL (ポリゴンプリミティブ、反時計回り)、GLU_LINE (線集合)、GLU_SILHOUETTE (同一平面のエッジは描かない線集合)、GLU_POINT (点集合) のいずれか。
%inst
gluQuadricDrawStyle 関数は Quadric の描画スタイルを指定する。

[戻り値]
この関数は値を返さない。

[備考]
**gluQuadricDrawStyle** は **quadObject** でレンダリングされる Quadric
の描画スタイルを指定する。


%index
gluQuadricNormals
gluQuadricNormals 関数は Quadric に使う法線の種類を指定する。
%group
Win32 glu32
%prm
quadObject, normals
quadObject : [intptr] Quadric オブジェクト (**gluNewQuadric** で作成)。
normals : [int] 生成する法線の型。GLU_NONE (法線なし)、GLU_FLAT (面ごとに 1 法線)、GLU_SMOOTH (頂点ごとに 1 法線、既定)。
%inst
gluQuadricNormals 関数は Quadric に使う法線の種類を指定する。

[戻り値]
この関数は値を返さない。

[備考]
**gluQuadricNormals** は **quadObject** でレンダリングされる Quadric
に使う法線の種類を指定する。


%index
gluQuadricOrientation
gluQuadricOrientation 関数は Quadric の内/外向きを指定する。
%group
Win32 glu32
%prm
quadObject, orientation
quadObject : [intptr] Quadric オブジェクト (**gluNewQuadric** で作成)。
orientation : [int] 向き。GLU_OUTSIDE (法線を外向きに、既定)、GLU_INSIDE (法線を内向きに)。
%inst
gluQuadricOrientation 関数は Quadric の内/外向きを指定する。

[戻り値]
この関数は値を返さない。

[備考]
**gluQuadricOrientation** は **quadObject** でレンダリングされる Quadric
の向きを指定する。外側/内側の解釈は描画される Quadric に依存する。


%index
gluQuadricTexture
gluQuadricTexture 関数は Quadric にテクスチャを適用するかを指定する。
%group
Win32 glu32
%prm
quadObject, textureCoords
quadObject : [intptr] Quadric オブジェクト (**gluNewQuadric** で作成)。
textureCoords : [int] テクスチャ座標を生成するかを示すフラグ。GL_TRUE で生成、GL_FALSE で生成しない (既定)。
%inst
gluQuadricTexture 関数は Quadric にテクスチャを適用するかを指定する。

[戻り値]
この関数は値を返さない。

[備考]
**gluQuadricTexture** は **quadObject** でレンダリングされる Quadric
にテクスチャ座標を生成するかを指定する。座標生成方法は描画される Quadric に依存する。


%index
gluScaleImage
gluScaleImage 関数は画像を任意サイズにスケールする。
%group
Win32 glu32
%prm
format, widthin, heightin, typein, datain, widthout, heightout, typeout, dataout
format : [int] ピクセルデータの形式。有効シンボル: GL_COLOR_INDEX, GL_STENCIL_INDEX, GL_DEPTH_COMPONENT, GL_RED, GL_GREEN, GL_BLUE, GL_ALPHA, GL_RGB, GL_RGBA, GL_BGR_EXT, GL_BGRA_EXT, GL_LUMINANCE, GL_LUMINANCE_ALPHA。
widthin : [int] スケールされるソース画像の幅。
heightin : [int] スケールされるソース画像の高さ。
typein : [int] *datain* のデータ型。GL_UNSIGNED_BYTE, GL_BYTE, GL_BITMAP, GL_UNSIGNED_SHORT, GL_SHORT, GL_UNSIGNED_INT, GL_INT, GL_FLOAT のいずれか。
datain : [intptr] ソース画像へのポインタ。
widthout : [int] 出力画像の幅。
heightout : [int] 出力画像の高さ。
typeout : [int] *dataout* のデータ型。同上のいずれか。
dataout : [intptr] 出力画像へのポインタ。
%inst
gluScaleImage 関数は画像を任意サイズにスケールする。

[戻り値]
関数が成功すると戻り値は 0 となる。関数が失敗した場合、戻り値は GLU エラーコードとなる (**gluErrorString**
参照)。

[備考]
**gluScaleImage** は pixel store
モードを使ってソース画像からデータをアンパックし、出力画像にパックしながらピクセル画像をスケールする。縮小時はボックスフィルタでサンプリング、拡大時は線形補間を行う。


%index
gluSphere
gluSphere 関数は球を描画する。
%group
Win32 glu32
%prm
qobj, radius, slices, stacks
qobj : [intptr] Quadric オブジェクト (**gluNewQuadric** で作成)。
radius : [double] 球の半径。
slices : [int] z 軸周りの分割数 (経線に相当)。
stacks : [int] z 軸方向の分割数 (緯線に相当)。
%inst
gluSphere 関数は球を描画する。

[戻り値]
この関数は値を返さない。

[備考]
**gluSphere** は原点中心・指定半径の球を描画する。z 軸周りに slices、z 軸方向に stacks で分割される
(経度・緯度のように)。GLU_OUTSIDE なら法線は球中心から離れる方向を向く。テクスチャが有効なら *t* は *z* =
-*radius* で 0.0 から *z* = *radius* で 1.0 まで (経線上で線形)、*s* は y+ 軸 0.0 から
x+ 軸 0.25、y- 軸 0.5、x- 軸 0.75、y+ 軸 1.0 まで変化する。


%index
gluTessBeginContour
gluTessBeginContour と gluTessEndContour は輪郭記述を区切る。 | gluTessBeginContour 関数 (Glu.h)
%group
Win32 glu32
%prm
tess
tess : [intptr] テッセレーションオブジェクト (**gluNewTess** で作成)。
%inst
gluTessBeginContour と gluTessEndContour は輪郭記述を区切る。 |
gluTessBeginContour 関数 (Glu.h)

[戻り値]
この関数は値を返さない。

[備考]
**gluTessBeginContour** と **gluTessEndPolygon** はポリゴン輪郭の定義を区切る。各
**gluTessBeginContour**/**gluTessEndPolygon** 対の中には 0 個以上の
**gluTessVertex** 呼び出しがあり得る。頂点は閉じた輪郭を指定する
(最後の頂点は自動的に最初の頂点に結ばれる)。**gluTessBeginContour** は
**gluTessBeginPolygon** と **gluTessEndPolygon** の間でのみ呼び出せる。


%index
gluTessBeginPolygon
gluTessBeginPolygon と gluTessEndPolygon はポリゴン記述を区切る。 | gluTessBeginPolygon 関数 (Glu.h)
%group
Win32 glu32
%prm
tess, polygon_data
tess : [intptr] テッセレーションオブジェクト (**gluNewTess** で作成)。*polygon_data* はプログラマ定義のポリゴンデータ構造体へのポインタ。
polygon_data : [intptr] 
%inst
gluTessBeginPolygon と gluTessEndPolygon はポリゴン記述を区切る。 |
gluTessBeginPolygon 関数 (Glu.h)

[戻り値]
この関数は値を返さない。

[備考]
**gluTessBeginPolygon** と **gluTessEndPolygon** は非凸ポリゴンの定義を区切る。各対の中で
1 つ以上の **gluTessBeginContour** を含む。各輪郭内には 0 個以上の **gluTessVertex**
呼び出しがある。頂点は閉じた輪郭を指定する。*polygon_data*
はプログラマ定義データ構造体へのポインタで、適切なコールバックが指定されていればコールバックに返されるので、ポリゴンごとの情報を格納する便利な方法となる。**gluTessEndPolygon**
呼び出し時にテッセレートされ、結果の三角形がコールバックで通知される。


%index
gluTessCallback
gluTessCallback 関数はテッセレーションオブジェクトのコールバックを定義する。
%group
Win32 glu32
%prm
tess, which, fn
tess : [intptr] テッセレーションオブジェクト (**gluNewTess** で作成)。
which : [int] 定義するコールバック。有効値: GLU_TESS_BEGIN、GLU_TESS_BEGIN_DATA、GLU_TESS_EDGE_FLAG、GLU_TESS_EDGE_FLAG_DATA、GLU_TESS_VERTEX、GLU_TESS_VERTEX_DATA、GLU_TESS_END、GLU_TESS_END_DATA、GLU_TESS_COMBINE、GLU_TESS_COMBINE_DATA、GLU_TESS_ERROR、GLU_TESS_ERROR_DATA。
fn : [int] 呼び出される関数。
%inst
gluTessCallback 関数はテッセレーションオブジェクトのコールバックを定義する。

[戻り値]
この関数は値を返さない。

[備考]
**gluTessCallback**
はテッセレーションオブジェクトで使用されるコールバックを指定する。既に定義されていれば置き換えられる。*fn* が **NULL**
なら既存は未定義となる。テッセレーションオブジェクトはこれらのコールバックを用いてポリゴンがどのように三角形に分割されるかを記述する。各コールバックにはポリゴンデータ付き
(_DATA) と無し 2 種類がある。GLU_TESS_BEGIN は glBegin
相当でプリミティブ開始を通知、GL_TRIANGLE_FAN/GL_TRIANGLE_STRIP/GL_TRIANGLES または
GL_LINE_LOOP を受け取る。GLU_TESS_EDGE_FLAG は glEdgeFlag
相当で境界判定用。GLU_TESS_VERTEX は三角形頂点を通知。GLU_TESS_END
はプリミティブ終了。GLU_TESS_COMBINE は交差検出時・特徴マージ時に新頂点を作る。GLU_TESS_ERROR
は各種エラーを通知する。詳細は元ドキュメント参照。このドキュメントは省略されている。


%index
gluTessEndContour
gluTessBeginContour と gluTessEndContour は輪郭記述を区切る。 | gluTessEndContour 関数 (Glu.h)
%group
Win32 glu32
%prm
tess
tess : [intptr] テッセレーションオブジェクト (**gluNewTess** で作成)。
%inst
gluTessBeginContour と gluTessEndContour は輪郭記述を区切る。 |
gluTessEndContour 関数 (Glu.h)

[戻り値]
この関数は値を返さない。

[備考]
**gluTessBeginContour** と **gluTessEndContour** はポリゴン輪郭の定義を区切る。各対の中には
0 個以上の **gluTessVertex**
呼び出しがあり得る。頂点は閉じた輪郭を指定する。**gluTessBeginContour** は
**gluTessBeginPolygon** と **gluTessEndPolygon** の間でのみ呼び出せる。


%index
gluTessEndPolygon
gluTessBeginPolygon と gluTessEndPolygon はポリゴン記述を区切る。 | gluTessEndPolygon 関数 (Glu.h)
%group
Win32 glu32
%prm
tess
tess : [intptr] テッセレーションオブジェクト (**gluNewTess** で作成)。
%inst
gluTessBeginPolygon と gluTessEndPolygon はポリゴン記述を区切る。 |
gluTessEndPolygon 関数 (Glu.h)

[戻り値]
この関数は値を返さない。

[備考]
**gluTessBeginPolygon** と **gluTessEndPolygon** は非凸ポリゴンの定義を区切る。各対の中で
1 つ以上の **gluTessBeginContour** を含み、各輪郭内に 0 個以上の **gluTessVertex**
呼び出しがある。頂点は閉じた輪郭を指定する。*polygon_data*
はプログラマ定義データ構造体へのポインタで、コールバックに返される。**gluTessEndPolygon**
呼び出し時にテッセレートされ、結果の三角形がコールバックで通知される。


%index
gluTessNormal
gluTessNormal 関数はポリゴンの法線を指定する。
%group
Win32 glu32
%prm
tess, x, y, z
tess : [intptr] テッセレーションオブジェクト (**gluNewTess** で作成)。
x : [double] 法線の x 成分。
y : [double] 法線の y 成分。
z : [double] 法線の z 成分。
%inst
gluTessNormal 関数はポリゴンの法線を指定する。

[戻り値]
この関数は値を返さない。

[備考]
**gluTessNormal**
は定義するポリゴンの法線を記述する。全入力データはテッセレーション前にこの法線に垂直な平面に射影され、出力三角形は全て法線に対して反時計回りに向きづけられる
(逆順を得るには法線を反転)。例えば全ポリゴンが x-y 平面上にあることが分かっている場合、描画前に
**gluTessNormal**(tess, 0.0, 0.0, 1.0) を呼ぶ。(0.0, 0.0, 0.0) (既定)
を与えた場合、法線は頂点への平面フィッティングで決まる。向きは入力輪郭の符号付き面積合計が非負となるよう選ばれる。設定した法線は次の呼び出しまで持続する。


%index
gluTessProperty
gluTessProperty 関数はテッセレーションオブジェクトのプロパティを設定する。
%group
Win32 glu32
%prm
tess, which, value
tess : [intptr] テッセレーションオブジェクト (**gluNewTess** で作成)。
which : [int] 設定するプロパティ。有効値: GLU_TESS_WINDING_RULE、GLU_TESS_BOUNDARY_ONLY、GLU_TESS_TOLERANCE。GLU_TESS_WINDING_RULE はポリゴンのどの部分が内側かを決める (GLU_TESS_WINDING_ODD/NONZERO/POSITIVE/NEGATIVE/ABS_GEQ_TWO)。GLU_TESS_BOUNDARY_ONLY (Boolean) を GL_TRUE にするとテッセレーションの代わりに内外を分離する閉じた輪郭集合が返される。GLU_TESS_TOLERANCE は出力サイズ削減のための特徴マージの許容誤差を指定する (ヒントのみ、既定 0)。
value : [double] 指定プロパティの値。
%inst
gluTessProperty 関数はテッセレーションオブジェクトのプロパティを設定する。

[戻り値]
この関数は値を返さない。

[備考]
**gluTessProperty**
はテッセレーションオブジェクトに格納されたプロパティを制御する。プロパティはポリゴンの解釈・レンダリング方法に影響する。


%index
gluTessVertex
gluTessVertex 関数はポリゴンの頂点を指定する。
%group
Win32 glu32
%prm
tess, coords, data
tess : [intptr] テッセレーションオブジェクト (**gluNewTess** で作成)。
coords : [var] 頂点の位置。
data : [intptr] 頂点コールバックでプログラムに返されるポインタ。
%inst
gluTessVertex 関数はポリゴンの頂点を指定する。

[戻り値]
この関数は値を返さない。

[備考]
**gluTessVertex** はユーザが定義中のポリゴンの頂点を記述する。連続呼び出しで閉じた輪郭を記述する。例えば四角形なら 4
回呼ぶ。**gluTessBeginContour** と **gluTessEndContour** の間でのみ呼び出せる。*data*
は通常頂点位置と色・法線等の頂点属性を含む構造体を指すポインタで、テッセレーション後に GLU_VERTEX
コールバックでプログラムに返される。


%index
gluUnProject
gluUnProject 関数はウィンドウ座標をオブジェクト座標にマップする。
%group
Win32 glu32
%prm
winx, winy, winz, modelMatrix, projMatrix, viewport, objx, objy, objz
winx : [double] マップ対象の x ウィンドウ座標。
winy : [double] マップ対象の y ウィンドウ座標。
winz : [double] マップ対象の z ウィンドウ座標。
modelMatrix : [var] モデルビュー行列 (**glGetDoublev** から取得)。
projMatrix : [var] 射影行列 (**glGetDoublev** から取得)。
viewport : [var] ビューポート (**glGetIntegerv** から取得)。
objx : [var] 計算された x オブジェクト座標。
objy : [var] 計算された y オブジェクト座標。
objz : [var] 計算された z オブジェクト座標。
%inst
gluUnProject 関数はウィンドウ座標をオブジェクト座標にマップする。

[戻り値]
関数が成功すると戻り値は GL_TRUE となる。関数が失敗した場合、戻り値は GL_FALSE となる。

[備考]
**gluUnProject** は *modelMatrix*、*projMatrix*、*viewport*
を使って指定ウィンドウ座標をオブジェクト座標にマップする。結果は *objx*、*objy*、*objz* に格納される。

