; ============================================================
;   opengl32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
opengl32.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の opengl32.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
glAccum
glAccum 関数はアキュムレーションバッファに対して操作を行う。
%prm
op, value
op : [int] アキュムレーションバッファの操作。以下のシンボル定数を受け付ける。GL_ACCUM: 現在読み取り対象として選択されているバッファから R、G、B、A の値を取得する (glReadBuffer 参照)。各成分値を 2^n-1 で除算し (n は現在選択中のバッファで各色成分に割り当てられたビット数)、得られた [0,1] 範囲の浮動小数点値を value で乗算してアキュムレーションバッファの対応ピクセル成分に加算する。GL_LOAD: GL_ACCUM と同様だが、アキュムレーションバッファの現在値を計算に使用しない。すなわち現在選択中のバッファからの値を 2^n-1 で除算し value を乗じて対応するセルに格納し、現在値を上書きする。GL_ADD: アキュムレーションバッファ内の各 R、G、B、A に value を加算する。GL_MULT: 各 R、G、B、A に value を乗算し、スケール後の値を対応する場所に戻す。GL_RETURN: アキュムレーションバッファの値を現在書き込み対象のカラーバッファに転送する。各成分に value を乗算し、さらに 2^n-1 を乗算して [0, 2^n-1] にクランプし対応するディスプレイバッファセルに格納する。この転送時に適用されるフラグメント操作は、ピクセル所有権、シザー、ディザリング、カラー書き込みマスクのみである。
value : [float] アキュムレーションバッファ操作に使用する浮動小数点値。op パラメータが value の使われ方を決定する。
%inst
glAccum 関数はアキュムレーションバッファに対して操作を行う。

[戻り値]
この関数は値を返さない。

[備考]

アキュムレーションバッファは拡張レンジのカラーバッファである。直接画像をレンダリングするのではなく、カラーバッファにレンダリングされた画像を描画後にアキュムレーションバッファの内容に加算する。異なる変換行列で生成した画像を累積することで、アンチエイリアシング
(点・線・ポリゴン)、モーションブラー、被写界深度などの効果を作れる。各ピクセルは R、G、B、A 値から成る。1
成分あたりのビット数は実装依存で、glGetIntegerv を GL_ACCUM_RED_BITS / GREEN / BLUE /
ALPHA_BITS で呼び出して取得できる。ビット数によらず、各成分の値範囲は [-1, 1]
である。アキュムレーションバッファのピクセルはフレームバッファのピクセルと 1 対 1 で対応する。第 1 引数 op
は操作を選択するシンボル定数、第 2 引数 value はその操作で使用する浮動小数点値である。操作は
GL_ACCUM、GL_LOAD、GL_ADD、GL_MULT、GL_RETURN の 5
種類。全ての操作は現在のシザー領域に制限され、各ピクセルの R、G、B、A に同じく適用される。操作結果が [-1, 1]
の範囲外となった場合、ピクセル成分の内容は未定義である。アキュムレーションバッファをクリアするには glClearAccum で
R、G、B、A 値を指定し、glClear をアキュムレーションバッファ有効で実行する。関連情報は glGet
(GL_ACCUM_*_BITS) で取得できる。


%index
glAlphaFunc
glAlphaFunc 関数はアルファテスト関数を設定する。
%prm
func, ref
func : [int] アルファ比較関数。以下のシンボル定数とその意味を受け付ける。GL_NEVER: 決してパスしない。GL_LESS: 入力アルファ値が参照値未満のときパスする。GL_EQUAL: 入力アルファ値が参照値に等しいときパスする。GL_LEQUAL: 入力アルファ値が参照値以下のときパスする。GL_GREATER: 入力アルファ値が参照値より大きいときパスする。GL_NOTEQUAL: 入力アルファ値が参照値と異なるときパスする。GL_GEQUAL: 入力アルファ値が参照値以上のときパスする。GL_ALWAYS: 常にパスする (既定値)。
ref : [int] 
%inst
glAlphaFunc 関数はアルファテスト関数を設定する。

[戻り値]
この関数は値を返さない。

[備考]
アルファテストは、入力フラグメントのアルファ値と定数参照値との比較結果に応じてフラグメントを破棄する。glAlphaFunc
は参照値と比較関数を指定する。比較はアルファテストが有効なときのみ行われる (glEnable の GL_ALPHA_TEST
を参照)。func と ref は描画条件を指定する。入力アルファ値は func で指定された関数により ref
と比較される。比較がパスすれば以降のステンシル/デプステストを条件として描画される。パスしなければそのピクセル位置のフレームバッファは変更されない。glAlphaFunc
は点・線・ポリゴン・ビットマップのスキャン変換、pixel draw/copy
等に起因する全てのピクセル書き込みに作用する。画面クリア操作には影響しない。アルファテストは RGBA モードでのみ行われる。関連情報は
glGet (GL_ALPHA_TEST_FUNC / REF) および glIsEnabled (GL_ALPHA_TEST)
で取得できる。


%index
glAreTexturesResident
glAreTexturesResident 関数は、指定されたテクスチャオブジェクトがテクスチャメモリに常駐しているかを判定する。
%prm
n, textures, residences
n : [int] 照会するテクスチャの数。
textures : [var] 照会するテクスチャ名を格納した配列のアドレス。
residences : [var] テクスチャの常駐状態が返される配列のアドレス。textures の各要素で指名されたテクスチャの常駐状態が residences の対応する要素に返される。
%inst
glAreTexturesResident 関数は、指定されたテクスチャオブジェクトがテクスチャメモリに常駐しているかを判定する。

[備考]
テクスチャメモリが限られているマシンでは、OpenGL
はテクスチャメモリ内に常駐するテクスチャのワーキングセットを確立する。これらは非常駐テクスチャよりはるかに効率的にバインドできる。glAreTexturesResident
は textures の n 個のテクスチャの常駐状態を照会する。全てが常駐なら GL_TRUE を返し residences
は変更しない。いずれかが非常駐なら GL_FALSE を返し、詳細が residences に返される。residences の要素が
GL_TRUE なら対応するテクスチャは常駐している。単一のバインド済みテクスチャを照会するには glGetTexParameter を
target にそのテクスチャターゲットを、pname に GL_TEXTURE_RESIDENT
を指定して呼び出す。既定テクスチャの常駐状態はこの方法で照会する必要がある。glAreTexturesResident
は表示リストに含められない。この関数は呼び出し時点の常駐状態を返すが、それ以降の常駐を保証するものではない。仮想メモリ上にあるテクスチャ
(テクスチャメモリが存在しない場合) は常に常駐とみなされる。注意: glAreTexturesResident は OpenGL 1.1
以降でのみ利用可能である。


%index
glArrayElement
glArrayElement 関数は頂点の描画に使用する配列要素を指定する。
%prm
i
i : [int] 
%inst
glArrayElement 関数は頂点の描画に使用する配列要素を指定する。

[戻り値]
この関数は値を返さない。

[備考]
glBegin / glEnd のペアの中で glArrayElement
を使用し、点・線・ポリゴンプリミティブの頂点および属性データを指定する。この関数は、有効化された頂点配列の index
の位置にある頂点・属性データを用いて単一頂点のデータを指定する。配列データをインデックスでアクセスしてプリミティブを構築でき、先頭から順にストリーミングする必要はない。単一の頂点のみを指定するため、個々のプリミティブに対して明示的に属性を設定できる。例えば三角形ごとに
1
つの法線を設定できる。表示リスト内で呼ぶと、必要な配列データも表示リストに記録される。配列ポインタと有効値は表示リスト作成時に決定され、実行時ではない。静的配列データはいつでも読み込みキャッシュできる。静的配列の要素を変更してから配列を再指定しない場合、その後の呼び出し結果は未定義。glEnableClientState(GL_VERTEX_ARRAY)
を先に呼ばずに glArrayElement を呼ぶと描画は行われないが、有効配列に対応する属性は変更される。glBegin /
glEnd ペア内で配列を指定してもエラーは発生しないが結果は未定義。注意: OpenGL 1.1 以降でのみ利用可能。


%index
glBegin
glBegin と glEnd 関数はプリミティブまたは同種プリミティブ群の頂点を区切る。
%prm
mode
mode : [int] glBegin と後続の glEnd の間で指定された頂点から生成されるプリミティブ。受け付けるシンボル定数と意味は次のとおり。GL_POINTS: 各頂点を単一点として扱う。頂点 n が点 n を定義し、N 個の点が描画される。GL_LINES: 各頂点ペアを独立した線分として扱う。頂点 2n-1, 2n が線 n を定義し、N/2 本描画される。GL_LINE_STRIP: 最初の頂点から最後へ接続された線分群を描画する。頂点 n, n+1 が線 n を定義し、N-1 本描画される。GL_LINE_LOOP: 最初の頂点から最後へ、さらに最初に戻る接続線分群。最終線は頂点 N と 1 で定義され、N 本描画される。GL_TRIANGLES: 頂点を 3 個ずつ独立した三角形として扱う。頂点 3n-2, 3n-1, 3n が三角形 n を定義し、N/3 個描画される。GL_TRIANGLE_STRIP: 接続された三角形群。最初の 2 頂点以降、1 頂点ごとに三角形を 1 個定義する。奇数 n では頂点 n, n+1, n+2、偶数 n では n+1, n, n+2 で三角形 n を定義し、N-2 個描画される。GL_TRIANGLE_FAN: 接続された三角形群。頂点 1, n+1, n+2 で三角形 n を定義し、N-2 個描画される。GL_QUADS: 頂点を 4 個ずつ独立した四角形として扱う。頂点 4n-3, 4n-2, 4n-1, 4n で四角形 n を定義し、N/4 個描画される。GL_QUAD_STRIP: 接続された四角形群。最初のペア以降、1 頂点ペアごとに 1 個の四角形を定義する。頂点 2n-1, 2n, 2n+2, 2n+1 で四角形 n を定義し、N/2-1 個描画される。頂点の使用順が独立データの場合と異なる点に注意。GL_POLYGON: 単一の凸ポリゴンを描画する。頂点 1 から N がポリゴンを定義する。
%inst
glBegin と glEnd 関数はプリミティブまたは同種プリミティブ群の頂点を区切る。

[戻り値]
この関数は値を返さない。

[備考]
glBegin と glEnd はプリミティブまたは同種プリミティブ群を定義する頂点を区切る。glBegin は mode 引数を 1
つ受け取り、10 種類のプリミティブのいずれを構成するかを指定する。glBegin と glEnd の間で利用可能な関数は
glVertex、glColor、glIndex、glNormal、glTexCoord、glEvalCoord、glEvalPoint、glMaterial、glEdgeFlag
の各ファミリに限られる。これら以外を含む表示リストを glCallList / glCallLists で実行することも可能。それ以外の
OpenGL 関数を呼び出すとエラーフラグがセットされ呼び出しは無視される。mode の値に関わらず glBegin / glEnd
間の頂点数に上限はない。不完全に指定された線・三角形・四角形・ポリゴンは描画されない。プリミティブごとの最小頂点数: 点 1、線
2、三角形 3、四角形 4、ポリゴン 3。特定倍数が必要なモード: GL_LINES (2)、GL_TRIANGLES
(3)、GL_QUADS (4)、GL_QUAD_STRIP (2)。


%index
glBindTexture
glBindTexture 関数はテクスチャターゲットにバインドされる名前付きテクスチャを作成する。
%prm
target, texture
target : [int] テクスチャをバインドするターゲット。GL_TEXTURE_1D または GL_TEXTURE_2D でなければならない。
texture : [int] テクスチャの名前。現在使用中のテクスチャ名であってはならない。
%inst
glBindTexture 関数はテクスチャターゲットにバインドされる名前付きテクスチャを作成する。

[戻り値]
この関数は値を返さない。

[備考]
glBindTexture は名前付きテクスチャの作成を可能にする。target に GL_TEXTURE_1D または
GL_TEXTURE_2D、texture
に新しいテクスチャ名を指定して呼び出すと、その名前が該当テクスチャターゲットにバインドされる。テクスチャがターゲットにバインドされると、そのターゲットに対する以前のバインドは効力を失う。テクスチャ名は符号なし整数で、値
0 は各ターゲットの既定テクスチャを表す予約値。テクスチャ名と内容は現在の OpenGL
レンダリングコンテキストの共有表示リスト空間に対してローカルであり、2
つのコンテキストはそれらを共有する場合に限りテクスチャ名を共有する。新しい名前群は glGenTextures
で生成できる。初回バインド時にテクスチャは対象ターゲットの次元を取り、GL_TEXTURE_1D にバインドされたら 1
次元、GL_TEXTURE_2D なら 2
次元となる。ターゲットへの操作は、そのターゲットにバインドされたテクスチャにも影響する。バインドは、同じターゲットに別のテクスチャがバインドされるか、glDeleteTextures
で削除されるまで有効。glTexImage* で再ロードするより glBindTexture
によるバインドの方が通常ははるかに高速。テクスチャ優先度制御は glPrioritizeTextures
を参照。glBindTexture は表示リストに含められる。注意: OpenGL 1.1 以降でのみ利用可能。関連情報は glGet
(GL_TEXTURE_1D_BINDING / 2D_BINDING) で取得できる。


%index
glBitmap
glBitmap 関数はビットマップを描画する。
%prm
width, height, xorig, yorig, xmove, ymove, bitmap
width : [int] ビットマップ画像のピクセル単位の幅。
height : [int] ビットマップ画像のピクセル単位の高さ。
xorig : [float] ビットマップ画像内の原点の x 位置。原点はビットマップの左下隅から測定され、右方向と上方向が正の軸となる。
yorig : [float] ビットマップ画像内の原点の y 位置。原点はビットマップの左下隅から測定され、右方向と上方向が正の軸となる。
xmove : [float] ビットマップ描画後に現在のラスタ位置に加算される x オフセット。
ymove : [float] ビットマップ描画後に現在のラスタ位置に加算される y オフセット。
bitmap : [var] ビットマップ画像のアドレス。
%inst
glBitmap 関数はビットマップを描画する。

[戻り値]
この関数は値を返さない。

[備考]
ビットマップは 2 値画像である。描画されると、ビットマップは現在のラスタ位置を基準に配置され、ビットマップ内の 1
に対応するフレームバッファピクセルが現在のラスタカラーまたはインデックスで書き込まれる。0
に対応するピクセルは変更されない。ビットマップ画像データは glDrawPixels のように解釈され、width と height
がその関数の引数に対応し、type は GL_BITMAP、format は GL_COLOR_INDEX
となる。glPixelStore のモードはビットマップデータの解釈に影響するが、glPixelTransfer
のモードは影響しない。現在のラスタ位置が無効なら glBitmap は無視される。そうでない場合、ビットマップの左下隅は (xr -
xorig, yr - yorig) のウィンドウ座標に配置され、(xr, yr) はラスタ位置。ビットマップ内の各 1
に対応してフラグメントが生成され、現在のラスタ z
座標、色・インデックス、テクスチャ座標を用いる。生成されたフラグメントは点・線・ポリゴンと同様、テクスチャマッピング・フォグ・フラグメント単位の操作
(アルファ・デプステスト等) を受ける。描画後、ラスタ位置の x, y は xmove, ymove でオフセットされる。z
座標や色・インデックス・テクスチャ座標は変更されない。関連情報は glGet (GL_CURRENT_RASTER_*) で取得できる。


%index
glBlendFunc
glBlendFunc 関数はピクセル演算を指定する。
%prm
sfactor, dfactor
sfactor : [int] R、G、B、A のソースブレンド係数の計算方法を指定する。以下 9 つのシンボル定数を受け付ける: GL_ZERO、GL_ONE、GL_DST_COLOR、GL_ONE_MINUS_DST_COLOR、GL_SRC_ALPHA、GL_ONE_MINUS_SRC_ALPHA、GL_DST_ALPHA、GL_ONE_MINUS_DST_ALPHA、GL_SRC_ALPHA_SATURATE。
dfactor : [int] R、G、B、A の宛先ブレンド係数の計算方法を指定する。以下 8 つのシンボル定数を受け付ける: GL_ZERO、GL_ONE、GL_SRC_COLOR、GL_ONE_MINUS_SRC_COLOR、GL_SRC_ALPHA、GL_ONE_MINUS_SRC_ALPHA、GL_DST_ALPHA、GL_ONE_MINUS_DST_ALPHA。
%inst
glBlendFunc 関数はピクセル演算を指定する。

[戻り値]
この関数は値を返さない。

[備考]
RGB モードでは、ピクセルは入力 (ソース) RGBA 値とフレームバッファ内の既存 (宛先) RGBA
値をブレンドする関数で描画できる。既定ではブレンドは無効。glEnable / glDisable に GL_BLEND
を渡して有効/無効を切り替える。有効時、glBlendFunc がブレンドの動作を定義する。sfactor は 9
種類のソース色成分スケール方法、dfactor は 8 種類の宛先色成分スケール方法を指定する。各方法は R、G、B、A の 4
つのスケール係数を定義する。ソース/宛先色成分を (Rs,Gs,Bs,As)、(Rd,Gd,Bd,Ad) とし、それぞれ 0 から
(kR,kG,kB,kA) = (2^mR-1,...) の整数値を取る。スケール係数は 8 種類の定数に対応し、値域は
[0,1]。RGBA モードのブレンド結果は R = min(kR, Rs*sR + Rd*dR)、G, B, A
も同様。具体的な係数表は MSDN 参照。ブレンド算術は整数色値を用いるため厳密には規定されないが、1
に等しいブレンド係数は被乗数を変更せず、0 は結果を 0 にすることが保証される。


%index
glCallList
glCallList 関数は表示リストを実行する。
%prm
list
list : [int] 実行する表示リストの整数名。
%inst
glCallList 関数は表示リストを実行する。

[戻り値]
この関数は値を返さない。

[備考]
glCallList
を呼ぶと指名された表示リストの実行が開始される。表示リストに保存された関数群が、表示リストを使わずに呼び出した場合と同じ順序で実行される。list
が表示リストとして定義されていない場合、glCallList は無視される。glCallList
は表示リスト内にも現れることができる。無限再帰を防ぐため、表示リスト実行時のネストレベルには上限が設けられている (最低
64、実装依存)。OpenGL のステートは glCallList
呼び出しをまたいで保存・復元されないため、実行中の変更は終了後も残る。ステートを維持するには glPushAttrib /
glPopAttrib / glPushMatrix / glPopMatrix を使用する。glCallList は glBegin /
glEnd 間でも実行可能 (表示リストがこの区間で許される関数のみを含む場合)。関連情報は glGet
(GL_MAX_LIST_NESTING) および glIsList で取得できる。


%index
glCallLists
glCallLists 関数は表示リスト群を実行する。
%prm
n, type, lists
n : [int] 実行する表示リストの数。
type : [int] lists 内の値の型。以下のシンボル定数を受け付ける。GL_BYTE: lists は符号付きバイト配列 (-128 から 127)。GL_UNSIGNED_BYTE: 符号なしバイト配列 (0 から 255)。GL_SHORT: 符号付き 2 バイト整数配列 (-32768 から 32767)。GL_UNSIGNED_SHORT: 符号なし 2 バイト整数配列 (0 から 65535)。GL_INT: 符号付き 4 バイト整数配列。GL_UNSIGNED_INT: 符号なし 4 バイト整数配列。GL_FLOAT: 4 バイト浮動小数点配列。GL_2_BYTES: 符号なしバイト配列。各 2 バイトペアが 1 つの表示リスト名を指定 (256*first + second)。GL_3_BYTES: 3 バイト単位 (65536*first + 256*second + third)。GL_4_BYTES: 4 バイト単位 (16777216*first + 65536*second + 256*third + fourth)。
lists : [intptr] 表示リスト内の名前オフセット配列のアドレス。ポインタ型は void で、オフセットはバイト、ショート、int、float のいずれかを取りうる (type による)。
%inst
glCallLists 関数は表示リスト群を実行する。

[戻り値]
この関数は値を返さない。

[備考]
glCallLists は lists
に渡された名前リスト内の各表示リストを実行させる。結果として各表示リストに保存された関数群が順次実行される。未定義の表示リスト名は無視される。glCallLists
は効率的な表示リスト実行手段を提供する。n は実行する表示リストの数を指定し、名前形式は type で指定する。リストは NULL
終端ではなく、n が lists から取得する個数を決める。glListBase は lists
の各名前に加算される符号なしオフセットを指定する追加の間接参照レベルを提供する。glCallLists
は表示リスト内にも現れることができる。ネストレベルの上限は最低 64 で実装依存。OpenGL
のステートは呼び出しをまたいで保存・復元されない。glPushAttrib / glPopAttrib / glPushMatrix /
glPopMatrix でステートを維持できる。glBegin / glEnd 間でも実行可能 (許される関数のみの場合)。関連情報は
glGet (GL_LIST_BASE / GL_MAX_LIST_NESTING) および glIsList で取得できる。


%index
glClear
glClear 関数はバッファを事前設定値にクリアする。
%prm
mask
mask : [int] クリアするバッファを示すマスクのビット単位 OR。マスクは以下の 4 つ。GL_COLOR_BUFFER_BIT: 現在カラー書き込みが有効なバッファ。GL_DEPTH_BUFFER_BIT: デプスバッファ。GL_ACCUM_BUFFER_BIT: アキュムレーションバッファ。GL_STENCIL_BUFFER_BIT: ステンシルバッファ。
%inst
glClear 関数はバッファを事前設定値にクリアする。

[戻り値]
この関数は値を返さない。

[備考]
glClear はウィンドウのビットプレーン領域を、glClearColor / glClearIndex / glClearDepth
/ glClearStencil / glClearAccum で事前に選択された値に設定する。glDrawBuffer
で複数のバッファを選択することで複数のカラーバッファを同時にクリアできる。ピクセル所有権テスト、シザーテスト、ディザリング、バッファ書き込みマスクは
glClear
の動作に影響する。シザーボックスがクリア領域を制限する。アルファ関数、ブレンド関数、論理演算、ステンシル、テクスチャマッピング、z
バッファリングは無視される。引数 mask は、クリアするバッファを示すいくつかの値のビット単位
OR。各バッファのクリア値は、そのバッファに対する設定に依存する。バッファが存在しない場合、そのバッファへの glClear
呼び出しは無効。関連情報は glGet (GL_ACCUM_CLEAR_VALUE / GL_DEPTH_CLEAR_VALUE /
GL_INDEX_CLEAR_VALUE / GL_COLOR_CLEAR_VALUE / GL_STENCIL_CLEAR_VALUE)
で取得できる。


%index
glClearAccum
glClearAccum 関数はアキュムレーションバッファのクリア値を指定する。
%prm
red, green, blue, alpha
red : [float] アキュムレーションバッファクリア時に使用する赤の値。既定値は 0。
green : [float] アキュムレーションバッファクリア時に使用する緑の値。既定値は 0。
blue : [float] アキュムレーションバッファクリア時に使用する青の値。既定値は 0。
alpha : [float] アキュムレーションバッファクリア時に使用するアルファ値。既定値は 0。
%inst
glClearAccum 関数はアキュムレーションバッファのクリア値を指定する。

[戻り値]
この関数は値を返さない。

[備考]
glClearAccum は glClear でアキュムレーションバッファをクリアする際に使用される R、G、B、A
値を指定する。指定値は [-1, 1] 範囲にクランプされる。関連情報は glGet (GL_ACCUM_CLEAR_VALUE)
で取得できる。


%index
glClearColor
glClearColor 関数はカラーバッファのクリア値を指定する。
%prm
red, green, blue, alpha
red : [float] glClear がカラーバッファをクリアする際に使用する赤の値。既定値は 0。
green : [float] glClear がカラーバッファをクリアする際に使用する緑の値。既定値は 0。
blue : [float] glClear がカラーバッファをクリアする際に使用する青の値。既定値は 0。
alpha : [float] glClear がカラーバッファをクリアする際に使用するアルファ値。既定値は 0。
%inst
glClearColor 関数はカラーバッファのクリア値を指定する。

[戻り値]
この関数は値を返さない。

[備考]
glClearColor は glClear でカラーバッファをクリアする際に使用される R、G、B、A 値を指定する。指定値は [0,
1] 範囲にクランプされる。関連情報は glGet (GL_ACCUM_CLEAR_VALUE /
GL_COLOR_CLEAR_VALUE) で取得できる。


%index
glClearDepth
glClearDepth 関数はデプスバッファのクリア値を指定する。
%prm
depth
depth : [double] デプスバッファクリア時に使用するデプス値。
%inst
glClearDepth 関数はデプスバッファのクリア値を指定する。

[戻り値]
この関数は値を返さない。

[備考]
glClearDepth は glClear でデプスバッファをクリアする際に使用されるデプス値を指定する。指定値は [0, 1]
範囲にクランプされる。関連情報は glGet (GL_DEPTH_CLEAR_VALUE) で取得できる。


%index
glClearIndex
glClearIndex 関数はカラーインデックスバッファのクリア値を指定する。
%prm
c
c : [float] カラーインデックスバッファクリア時に使用するインデックス。既定値は 0。
%inst
glClearIndex 関数はカラーインデックスバッファのクリア値を指定する。

[戻り値]
この関数は値を返さない。

[備考]
glClearIndex は glClear でカラーインデックスバッファをクリアする際に使用されるインデックスを指定する。c
パラメータはクランプされず、二進小数点以下の精度が未指定な固定小数点値に変換される。その整数部は 2^m-1 でマスクされる (m
はフレームバッファに格納されるカラーインデックスのビット数)。関連情報は glGet (GL_INDEX_CLEAR_VALUE /
GL_INDEX_BITS) で取得できる。


%index
glClearStencil
glClearStencil 関数はステンシルバッファのクリア値を指定する。
%prm
s
s : [int] ステンシルバッファクリア時に使用するインデックス。既定値は 0。
%inst
glClearStencil 関数はステンシルバッファのクリア値を指定する。

[戻り値]
この関数は値を返さない。

[備考]
glClearStencil は glClear でステンシルバッファをクリアする際に使用されるインデックスを指定する。s は 2^m-1
でマスクされる (m はステンシルバッファのビット数)。関連情報は glGet (GL_STENCIL_CLEAR_VALUE /
GL_STENCIL_BITS) で取得できる。


%index
glClipPlane
glClipPlane 関数は全ての幾何図形がクリッピングされる平面を指定する。
%prm
plane, equation
plane : [int] 位置決め対象のクリッピング平面。GL_CLIP_PLANEi 形式のシンボル名 (i は 0 から GL_MAX_CLIP_PLANES - 1 の整数) を受け付ける。
equation : [var] 平面方程式として解釈される 4 つの倍精度浮動小数点値の配列のアドレス。
%inst
glClipPlane 関数は全ての幾何図形がクリッピングされる平面を指定する。

[戻り値]
この関数は値を返さない。

[備考]
幾何図形は常に x、y、z の 6 平面フラスタム境界に対してクリッピングされる。glClipPlane
は、軸に垂直とは限らない追加の平面を指定でき、全ての幾何図形はそれらに対してもクリッピングされる。最大
GL_MAX_CLIP_PLANES 個 (全ての実装で最低 6)
を指定可能。結果のクリッピング領域は半空間の交差であり、常に凸となる。glClipPlane は 4
成分の平面方程式で半空間を指定する。呼び出し時に equation
はモデルビュー行列の逆行列で変換され、アイ座標系で格納される。以後のモデルビュー行列の変更は格納された方程式に影響しない。頂点のアイ座標と格納された方程式の内積が正または
0 なら、その頂点はクリッピング平面に対して「内側」となる。そうでなければ「外側」。glEnable / glDisable に
GL_CLIP_PLANEi を指定してクリッピング平面を有効/無効化する。既定では全てのクリッピング平面はアイ座標系で
(0,0,0,0) かつ無効。GL_CLIP_PLANEi = GL_CLIP_PLANE0 + i が常に成り立つ。関連情報は
glGetClipPlane および glIsEnabled (GL_CLIP_PLANEi) で取得できる。


%index
glColor3b
現在色を設定する。
%prm
red, green, blue
red : [int] 現在色の新しい赤の値。
green : [int] 現在色の新しい緑の値。
blue : [int] 現在色の新しい青の値。
%inst
現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
GL は現在の単値カラーインデックスと現在の 4 値 RGBA カラーの両方を保持する。glColor は新しい 4 値 RGBA
カラーを設定する。glColor3 系は R、G、B を明示的に指定しアルファを 1.0 に暗黙設定。glColor4 系は 4
成分すべてを明示指定。glColor3b / 4b / 3s / 4s / 3i / 4i は符号付きバイト/ショート/long
整数を引数に取る。名前に v
が付く形式は配列へのポインタを受け取る。現在色は浮動小数点形式で格納される。符号なし整数成分は最大表現可能値が 1.0、0 が 0.0
に線形マップされる。符号付き整数成分は最大正値が 1.0、最大負値が -1.0 に線形マップされる (0 は厳密には 0.0
にならない)。浮動小数点値は直接マップされる。浮動小数点・符号付き整数とも現在色更新前に [0,1]
へはクランプされないが、補間やカラーバッファへの書き込み前にはクランプされる。


%index
glColor3bv
既存の色値配列から現在色を設定する。
%prm
v
v : [var] R、G、B の値を含む配列へのポインタ。
%inst
既存の色値配列から現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。名前に v が付く形式は配列値へのポインタを受け取る。


%index
glColor3d
現在色を設定する。
%prm
red, green, blue
red : [double] 現在色の新しい赤の値。
green : [double] 現在色の新しい緑の値。
blue : [double] 現在色の新しい青の値。
%inst
現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。d は倍精度浮動小数点を引数に取る。


%index
glColor3dv
既存の色値配列から現在色を設定する。
%prm
v
v : [var] R、G、B の値を含む配列へのポインタ。
%inst
既存の色値配列から現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。dv は倍精度浮動小数点配列を受け取る。


%index
glColor3f
現在色を設定する。
%prm
red, green, blue
red : [float] 現在色の新しい赤の値。
green : [float] 現在色の新しい緑の値。
blue : [float] 現在色の新しい青の値。
%inst
現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。f は単精度浮動小数点を引数に取る。


%index
glColor3fv
既存の色値配列から現在色を設定する。
%prm
v
v : [var] R、G、B の値を含む配列へのポインタ。
%inst
既存の色値配列から現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。fv は単精度浮動小数点配列を受け取る。


%index
glColor3i
現在色を設定する。
%prm
red, green, blue
red : [int] 現在色の新しい赤の値。
green : [int] 現在色の新しい緑の値。
blue : [int] 現在色の新しい青の値。
%inst
現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。i は符号付き 32 bit 整数を引数に取る。


%index
glColor3iv
既存の色値配列から現在色を設定する。
%prm
v
v : [var] R、G、B の値を含む配列へのポインタ。
%inst
既存の色値配列から現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。iv は符号付き 32 bit 整数配列を受け取る。


%index
glColor3s
現在色を設定する。
%prm
red, green, blue
red : [int] 現在色の新しい赤の値。
green : [int] 現在色の新しい緑の値。
blue : [int] 現在色の新しい青の値。
%inst
現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。s は符号付き 16 bit 整数を引数に取る。


%index
glColor3sv
既存の色値配列から現在色を設定する。
%prm
v
v : [var] R、G、B の値を含む配列へのポインタ。
%inst
既存の色値配列から現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。sv は符号付き 16 bit 整数配列を受け取る。


%index
glColor3ub
現在色を設定する。
%prm
red, green, blue
red : [int] 現在色の新しい赤の値。
green : [int] 現在色の新しい緑の値。
blue : [int] 現在色の新しい青の値。
%inst
現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。ub は符号なしバイトを引数に取る。


%index
glColor3ubv
既存の色値配列から現在色を設定する。
%prm
v
v : [var] R、G、B の値を含む配列へのポインタ。
%inst
既存の色値配列から現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。ubv は符号なしバイト配列を受け取る。


%index
glColor3ui
現在色を設定する。
%prm
red, green, blue
red : [int] 現在色の新しい赤の値。
green : [int] 現在色の新しい緑の値。
blue : [int] 現在色の新しい青の値。
%inst
現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。ui は符号なし 32 bit 整数を引数に取る。


%index
glColor3uiv
既存の色値配列から現在色を設定する。
%prm
v
v : [var] R、G、B の値を含む配列へのポインタ。
%inst
既存の色値配列から現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。uiv は符号なし 32 bit 整数配列を受け取る。


%index
glColor3us
現在色を設定する。
%prm
red, green, blue
red : [int] 現在色の新しい赤の値。
green : [int] 現在色の新しい緑の値。
blue : [int] 現在色の新しい青の値。
%inst
現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。us は符号なし 16 bit 整数を引数に取る。


%index
glColor3usv
既存の色値配列から現在色を設定する。
%prm
v
v : [var] R、G、B の値を含む配列へのポインタ。
%inst
既存の色値配列から現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。usv は符号なし 16 bit 整数配列を受け取る。


%index
glColor4b
現在色を設定する。
%prm
red, green, blue, alpha
red : [int] 現在色の新しい赤の値。
green : [int] 現在色の新しい緑の値。
blue : [int] 現在色の新しい青の値。
alpha : [int] 現在色の新しいアルファ値。
%inst
現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。glColor4 は R、G、B、A を明示指定する。b は符号付きバイトを引数に取る。


%index
glColor4bv
既存の色値配列から現在色を設定する。
%prm
v
v : [var] R、G、B、A の値を含む配列へのポインタ。
%inst
既存の色値配列から現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。bv は符号付きバイト配列を受け取る。


%index
glColor4d
現在色を設定する。
%prm
red, green, blue, alpha
red : [double] 現在色の新しい赤の値。
green : [double] 現在色の新しい緑の値。
blue : [double] 現在色の新しい青の値。
alpha : [double] 現在色の新しいアルファ値。
%inst
現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。d は倍精度浮動小数点を引数に取る。


%index
glColor4dv
既存の色値配列から現在色を設定する。
%prm
v
v : [var] R、G、B、A の値を含む配列へのポインタ。
%inst
既存の色値配列から現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。dv は倍精度浮動小数点配列を受け取る。


%index
glColor4f
現在色を設定する。
%prm
red, green, blue, alpha
red : [float] 現在色の新しい赤の値。
green : [float] 現在色の新しい緑の値。
blue : [float] 現在色の新しい青の値。
alpha : [float] 現在色の新しいアルファ値。
%inst
現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。f は単精度浮動小数点を引数に取る。


%index
glColor4fv
既存の色値配列から現在色を設定する。
%prm
v
v : [var] R、G、B、A の値を含む配列へのポインタ。
%inst
既存の色値配列から現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。fv は単精度浮動小数点配列を受け取る。


%index
glColor4i
現在色を設定する。
%prm
red, green, blue, alpha
red : [int] 現在色の新しい赤の値。
green : [int] 現在色の新しい緑の値。
blue : [int] 現在色の新しい青の値。
alpha : [int] 現在色の新しいアルファ値。
%inst
現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。i は符号付き 32 bit 整数を引数に取る。


%index
glColor4iv
既存の色値配列から現在色を設定する。
%prm
v
v : [var] R、G、B、A の値を含む配列へのポインタ。
%inst
既存の色値配列から現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。iv は符号付き 32 bit 整数配列を受け取る。


%index
glColor4s
現在色を設定する。
%prm
red, green, blue, alpha
red : [int] 現在色の新しい赤の値。
green : [int] 現在色の新しい緑の値。
blue : [int] 現在色の新しい青の値。
alpha : [int] 現在色の新しいアルファ値。
%inst
現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。s は符号付き 16 bit 整数を引数に取る。


%index
glColor4sv
既存の色値配列から現在色を設定する。
%prm
v
v : [var] R、G、B、A の値を含む配列へのポインタ。
%inst
既存の色値配列から現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。sv は符号付き 16 bit 整数配列を受け取る。


%index
glColor4ub
現在色を設定する。
%prm
red, green, blue, alpha
red : [int] 現在色の新しい赤の値。
green : [int] 現在色の新しい緑の値。
blue : [int] 現在色の新しい青の値。
alpha : [int] 現在色の新しいアルファ値。
%inst
現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。ub は符号なしバイトを引数に取る。


%index
glColor4ubv
既存の色値配列から現在色を設定する。
%prm
v
v : [var] R、G、B、A の値を含む配列へのポインタ。
%inst
既存の色値配列から現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。ubv は符号なしバイト配列を受け取る。


%index
glColor4ui
現在色を設定する。
%prm
red, green, blue, alpha
red : [int] 現在色の新しい赤の値。
green : [int] 現在色の新しい緑の値。
blue : [int] 現在色の新しい青の値。
alpha : [int] 現在色の新しいアルファ値。
%inst
現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。ui は符号なし 32 bit 整数を引数に取る。


%index
glColor4uiv
既存の色値配列から現在色を設定する。
%prm
v
v : [var] R、G、B、A の値を含む配列へのポインタ。
%inst
既存の色値配列から現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。uiv は符号なし 32 bit 整数配列を受け取る。


%index
glColor4us
現在色を設定する。
%prm
red, green, blue, alpha
red : [int] 現在色の新しい赤の値。
green : [int] 現在色の新しい緑の値。
blue : [int] 現在色の新しい青の値。
alpha : [int] 現在色の新しいアルファ値。
%inst
現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。us は符号なし 16 bit 整数を引数に取る。


%index
glColor4usv
既存の色値配列から現在色を設定する。
%prm
v
v : [var] R、G、B、A の値を含む配列へのポインタ。
%inst
既存の色値配列から現在色を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glColor3b の説明を参照。usv は符号なし 16 bit 整数配列を受け取る。


%index
glColorMask
glColorMask 関数はフレームバッファ色成分の書き込みを有効/無効にする。
%prm
red, green, blue, alpha
red : [int] フレームバッファに赤を書き込めるかを指定する。既定値は GL_TRUE で、色成分を書き込めることを意味する。
green : [int] フレームバッファに緑を書き込めるかを指定する。既定値は GL_TRUE で、色成分を書き込めることを意味する。
blue : [int] フレームバッファに青を書き込めるかを指定する。既定値は GL_TRUE で、色成分を書き込めることを意味する。
alpha : [int] フレームバッファにアルファを書き込めるかを指定する。既定値は GL_TRUE で、色成分を書き込めることを意味する。
%inst
glColorMask 関数はフレームバッファ色成分の書き込みを有効/無効にする。

[戻り値]
この関数は値を返さない。

[備考]
glColorMask はフレームバッファの個別の色成分を書き込めるかどうかを指定する。例えば red が GL_FALSE
なら、どのピクセルの赤成分も変更されない。マスクを変更しても、現在の色、インデックス値、レンダリング状態には影響しない。関連情報は
glGet (GL_COLOR_WRITEMASK) で取得できる。


%index
glColorMaterial
glColorMaterial 関数はマテリアル色を現在色で追跡させる。
%prm
face, mode
face : [int] 表面・裏面・両面のいずれのマテリアルパラメータを現在色で追跡させるかを指定する。受け付ける値は GL_FRONT、GL_BACK、GL_FRONT_AND_BACK。既定値は GL_FRONT_AND_BACK。
mode : [int] 現在色で追跡するマテリアルパラメータを指定する。受け付ける値は GL_EMISSION、GL_AMBIENT、GL_DIFFUSE、GL_SPECULAR、GL_AMBIENT_AND_DIFFUSE。既定値は GL_AMBIENT_AND_DIFFUSE。
%inst
glColorMaterial 関数はマテリアル色を現在色で追跡させる。

[戻り値]
この関数は値を返さない。

[備考]
glColorMaterial は、どのマテリアルパラメータが現在色を追跡するかを指定する。GL_COLOR_MATERIAL
を有効にすると、face で指定されるマテリアルの mode で指定されるパラメータが、glColor
系の呼び出しで指定された現在色に追従する。これにより glMaterial
を使わずに色を変えられ、効率的なマテリアル変更が可能になる。glMaterial
を呼び出しても追跡されているパラメータが上書きされるが、その後 glColor を呼ぶと再度上書きされる。関連情報は glGet
(GL_COLOR_MATERIAL_PARAMETER / GL_COLOR_MATERIAL_FACE) および
glIsEnabled (GL_COLOR_MATERIAL) で取得できる。


%index
glColorPointer
glColorPointer 関数はカラー配列を定義する。
%prm
size, type, stride, pointer
size : [int] カラーあたりの成分数。3 または 4 でなければならない。
type : [int] カラー配列の各色成分のデータ型。指定可能な定数: GL_BYTE、GL_UNSIGNED_BYTE、GL_SHORT、GL_UNSIGNED_SHORT、GL_INT、GL_UNSIGNED_INT、GL_FLOAT、GL_DOUBLE。
stride : [int] 連続するカラー間のバイトオフセット。stride が 0 のとき、カラーは配列内に密に格納されている。
pointer : [intptr] カラー配列内の最初のカラー要素の最初の成分へのポインタ。
%inst
glColorPointer 関数はカラー配列を定義する。

[戻り値]
この関数は値を返さない。

[備考]
glColorPointer はレンダリング時に使用する色成分配列の位置とデータ形式を指定する。stride は 1
つのカラーから次のカラーまでのバイトオフセットを決定し、カラーを他の頂点属性と一緒にパックすることを可能にする。0
なら密にパックされているとみなす。有効化するには glEnableClientState に GL_COLOR_ARRAY
を指定する。通常 glDrawArrays / glDrawElements / glArrayElement
と組み合わせて使用する。注意: OpenGL 1.1 以降でのみ利用可能。関連情報は glGet (GL_COLOR_ARRAY /
GL_COLOR_ARRAY_SIZE / GL_COLOR_ARRAY_TYPE / GL_COLOR_ARRAY_STRIDE)
および glGetPointerv (GL_COLOR_ARRAY_POINTER) で取得できる。


%index
glCopyPixels
glCopyPixels 関数はフレームバッファ内のピクセルをコピーする。
%prm
x, y, width, height, type
x : [int] コピーするピクセル矩形領域の左下隅のウィンドウ x 平面座標。
y : [int] コピーするピクセル矩形領域の左下隅のウィンドウ y 平面座標。
width : [int] コピーするピクセル矩形領域の幅。非負でなければならない。
height : [int] コピーするピクセル矩形領域の高さ。非負でなければならない。
type : [int] glCopyPixels がカラー値・デプス値・ステンシル値のいずれをコピーするかを指定する。受け付けるシンボル定数は次のとおり。このドキュメントは省略されている。
%inst
glCopyPixels 関数はフレームバッファ内のピクセルをコピーする。

[戻り値]
この関数は値を返さない。

[備考]
glCopyPixels
は指定されたフレームバッファ位置から現在のラスタ位置を基準とする領域へ、スクリーン整列のピクセル矩形をコピーする。動作は type が
GL_COLOR で現在の読み取りバッファ (glReadBuffer 参照) がカラー情報を含む場合、type が GL_DEPTH
でデプスバッファがある場合、type が GL_STENCIL でステンシルバッファがある場合にのみ定義される。x, y
はソースの左下隅、width と height はコピー領域のサイズ。データは glDrawPixels と同じ変換を通るが、pixel
transfer モードは適用されない。関連情報は glGet (GL_CURRENT_RASTER_POSITION /
GL_CURRENT_RASTER_POSITION_VALID) で取得できる。


%index
glCopyTexImage1D
glCopyTexImage1D 関数はフレームバッファから 1 次元テクスチャ画像にピクセルをコピーする。
%prm
target, level, internalFormat, x, y, width, border
target : [int] 変更するイメージデータのターゲット。GL_TEXTURE_1D でなければならない。
level : [int] 詳細度レベル番号。レベル 0 が基底画像。レベル n は n 番目のミップマップ縮小画像。
internalFormat : [int] テクスチャデータの内部フォーマットと解像度。以下のシンボル値のいずれかでなければならない。このドキュメントは省略されている。
x : [int] コピーするピクセル行の左下隅のウィンドウ x 平面座標。
y : [int] コピーするピクセル行の左下隅のウィンドウ y 平面座標。
width : [int] テクスチャ画像の幅。0 または 2^n + 2*border (ある整数 n で) でなければならない。テクスチャ画像の高さは 1。
border : [int] ボーダーの幅。0 または 1 でなければならない。
%inst
glCopyTexImage1D 関数はフレームバッファから 1 次元テクスチャ画像にピクセルをコピーする。

[戻り値]
この関数は値を返さない。

[備考]
glCopyTexImage1D は glTexImage1D のようにメインメモリからではなく、現在のフレームバッファのピクセルを用いて
1 次元テクスチャ画像を定義する。現在の読み取りバッファ (glReadBuffer 参照)
からピクセルを読み取る。読み取り時にピクセル転送モードは適用されるが、ピクセルストアモードは適用されない。注意: OpenGL 1.1
以降でのみ利用可能。


%index
glCopyTexImage2D
glCopyTexImage2D 関数はフレームバッファから 2 次元テクスチャ画像にピクセルをコピーする。
%prm
target, level, internalFormat, x, y, width, height, border
target : [int] 変更するイメージデータのターゲット。GL_TEXTURE_2D でなければならない。
level : [int] 詳細度レベル番号。レベル 0 が基底画像。レベル n は n 番目のミップマップ縮小画像。
internalFormat : [int] テクスチャデータの内部フォーマットと解像度。internalFormat には 1、2、3、4 は使用できない。以下のシンボル値のいずれかを取りうる。このドキュメントは省略されている。
x : [int] コピーするピクセル矩形領域の左下隅のウィンドウ x 平面座標。
y : [int] コピーするピクセル矩形領域の左下隅のウィンドウ y 平面座標。
width : [int] テクスチャ画像の幅。2^n + 2*border (ある整数 n で) でなければならない。
height : [int] テクスチャ画像の高さ。2^n + 2*border (ある整数 n で) でなければならない。
border : [int] ボーダーの幅。0 または 1 でなければならない。
%inst
glCopyTexImage2D 関数はフレームバッファから 2 次元テクスチャ画像にピクセルをコピーする。

[戻り値]
この関数は値を返さない。

[備考]
glCopyTexImage2D は glTexImage2D のようにメインメモリからではなく、現在のフレームバッファのピクセルを用いて
2 次元テクスチャ画像を定義する。現在の読み取りバッファ (glReadBuffer 参照) からピクセルを読み取る。注意: OpenGL
1.1 以降でのみ利用可能。


%index
glCopyTexSubImage1D
glCopyTexSubImage1D 関数はフレームバッファから 1 次元テクスチャ画像のサブ画像をコピーする。
%prm
target, level, xoffset, x, y, width
target : [int] 変更するイメージデータのターゲット。GL_TEXTURE_1D でなければならない。
level : [int] 詳細度レベル番号。レベル 0 が基底画像。レベル n は n 番目のミップマップ縮小画像。
xoffset : [int] テクスチャ配列内のテクセルオフセット。
x : [int] コピーするピクセル行の左下隅のウィンドウ x 平面座標。
y : [int] コピーするピクセル行の左下隅のウィンドウ y 平面座標。
width : [int] テクスチャ画像のサブイメージの幅。幅 0 のサブイメージを指定しても効果はない。
%inst
glCopyTexSubImage1D 関数はフレームバッファから 1 次元テクスチャ画像のサブ画像をコピーする。

[戻り値]
この関数は値を返さない。

[備考]
glCopyTexSubImage1D は glTexSubImage1D
のようにメインメモリからではなく、現在のフレームバッファのピクセルを用いて 1 次元テクスチャ画像の一部を置き換える。注意: OpenGL
1.1 以降でのみ利用可能。


%index
glCopyTexSubImage2D
glCopyTexSubImage2D 関数はフレームバッファから 2 次元テクスチャ画像のサブ画像をコピーする。
%prm
target, level, xoffset, yoffset, x, y, width, height
target : [int] 変更するイメージデータのターゲット。GL_TEXTURE_2D でなければならない。
level : [int] 詳細度レベル番号。レベル 0 が基底画像。レベル n は n 番目のミップマップ縮小画像。
xoffset : [int] テクスチャ配列内の x 方向のテクセルオフセット。
yoffset : [int] テクスチャ配列内の y 方向のテクセルオフセット。
x : [int] コピーするピクセル行の左下隅のウィンドウ x 平面座標。
y : [int] コピーするピクセル行の左下隅のウィンドウ y 平面座標。
width : [int] テクスチャ画像のサブイメージの幅。幅 0 のサブイメージを指定しても効果はない。
height : [int] テクスチャ画像のサブイメージの高さ。幅 0 のサブイメージを指定しても効果はない。
%inst
glCopyTexSubImage2D 関数はフレームバッファから 2 次元テクスチャ画像のサブ画像をコピーする。

[戻り値]
この関数は値を返さない。

[備考]
glCopyTexSubImage2D は glTexSubImage2D
のようにメインメモリからではなく、現在のフレームバッファのピクセルを用いて 2 次元テクスチャ画像の矩形領域を置き換える。注意:
OpenGL 1.1 以降でのみ利用可能。


%index
glCullFace
glCullFace 関数は表面または裏面のファセットをカリング可能にするかを指定する。
%prm
mode
mode : [int] 表面を向いたファセットと裏面を向いたファセットのいずれをカリング対象とするかを指定する。GL_FRONT、GL_BACK、GL_FRONT_AND_BACK を受け付ける。既定値は GL_BACK。
%inst
glCullFace 関数は表面または裏面のファセットをカリング可能にするかを指定する。

[戻り値]
この関数は値を返さない。

[備考]
glCullFace は、ファセットカリングが有効なとき、mode
で指定された表面または裏面のファセットをカリングするよう指定する。カリングは glEnable / glDisable に
GL_CULL_FACE を指定して切り替える。ファセットは表面にも裏面にもなりうる。glFrontFace
でどちらが表かを指定する。glCullFace で GL_FRONT_AND_BACK
を指定すると、どのファセットも描画されなくなるが、点と線には影響しない。関連情報は glIsEnabled (GL_CULL_FACE)
および glGet (GL_CULL_FACE_MODE) で取得できる。


%index
glDeleteLists
glDeleteLists 関数は連続する表示リスト群を削除する。
%prm
list, range
list : [int] 削除する最初の表示リストの整数名。
range : [int] 削除する表示リストの数。
%inst
glDeleteLists 関数は連続する表示リスト群を削除する。

[戻り値]
この関数は値を返さない。

[備考]
glDeleteLists は連続する表示リスト群を削除させる。list は削除する最初の表示リストの名前、range
は削除する数。空の表示リスト (名前使用中だが内容なし) と定義されていない表示リスト名は無視される。削除後、それらの名前は再び
glGenLists で自由に使用できる。関連情報は glIsList で取得できる。


%index
glDeleteTextures
glDeleteTextures 関数は名前付きテクスチャを削除する。
%prm
n, textures
n : [int] 削除するテクスチャの数。
textures : [var] 削除するテクスチャ配列。
%inst
glDeleteTextures 関数は名前付きテクスチャを削除する。

[戻り値]
この関数は値を返さない。

[備考]
glDeleteTextures は textures 配列の要素で指名された n
個のテクスチャを削除する。削除後、テクスチャは内容も次元も持たず、名前は再利用可能となる (glGenTextures
で再生成されるか、glBindTexture
で新しく使われるまで)。現在バインドされているテクスチャを削除すると、影響のあったターゲットには既定テクスチャ (名前 0)
がバインドされる。存在しないテクスチャ名や値 0 を渡しても無視され、エラーは発生しない。注意: OpenGL 1.1
以降でのみ利用可能。


%index
glDepthFunc
glDepthFunc 関数はデプス比較に使用する値を指定する。
%prm
func
func : [int] デプス比較関数。受け付けるシンボル定数は GL_NEVER、GL_LESS、GL_EQUAL、GL_LEQUAL、GL_GREATER、GL_NOTEQUAL、GL_GEQUAL、GL_ALWAYS。既定値は GL_LESS。
%inst
glDepthFunc 関数はデプス比較に使用する値を指定する。

[戻り値]
この関数は値を返さない。

[備考]
glDepthFunc は入力ピクセルの z 値とデプスバッファ内の z 値を比較する関数を指定する。デプステストが有効
(glEnable GL_DEPTH_TEST) なときのみ比較される。デプステストは既定で無効。関連情報は glGet
(GL_DEPTH_FUNC) および glIsEnabled (GL_DEPTH_TEST) で取得できる。


%index
glDepthMask
glDepthMask 関数はデプスバッファへの書き込みを有効/無効にする。
%prm
flag
flag : [int] デプスバッファへの書き込みを有効/無効にするための値を指定する。flag が GL_FALSE なら書き込み無効、GL_TRUE なら有効。
%inst
glDepthMask 関数はデプスバッファへの書き込みを有効/無効にする。

[戻り値]
この関数は値を返さない。

[備考]
glDepthMask はデプスバッファが書き込み可能かを指定する。flag が GL_FALSE
ならデプスバッファの書き込みは無効。GL_TRUE なら有効。関連情報は glGet (GL_DEPTH_WRITEMASK)
で取得できる。


%index
glDepthRange
glDepthRange 関数は z 座標から深度値への線形マッピングを指定する。
%prm
zNear, zFar
zNear : [double] 近クリッピング平面のマッピング。範囲は [0, 1]。既定値は 0。
zFar : [double] 遠クリッピング平面のマッピング。範囲は [0, 1]。既定値は 1。
%inst
glDepthRange 関数は z 座標から深度値への線形マッピングを指定する。

[戻り値]
この関数は値を返さない。

[備考]
クリッピングと w による除算の後、z 座標は近クリッピング平面と遠クリッピング平面に対応して 0.0 から 1.0
の範囲となる。glDepthRange はこの正規化された z 座標範囲からウィンドウ z
座標への線形マッピングを指定する。実際のデプスバッファ実装によらず、ウィンドウ座標のデプス値は 0.0 から 1.0 の範囲とみなされる
(カラー成分と同様)。よって受け付けられる値もこの範囲にクランプされる。既定 (0, 1) は近平面を 0、遠平面を 1
にマップし、デプスバッファ範囲を完全に使い切る。zNear < zFar である必要はなく、(1, 0)
のような逆マッピングも許される。関連情報は glGet (GL_DEPTH_RANGE) で取得できる。


%index
glDisable
glDisable 関数は OpenGL 機能を無効にする。
%prm
cap
cap : [int] 無効にする GL 機能を示すシンボル定数。詳細は glEnable の解説を参照。
%inst
glDisable 関数は OpenGL 機能を無効にする。

[戻り値]
この関数は値を返さない。

[備考]
glEnable と glDisable は、さまざまな OpenGL 機能を有効/無効にする。両者はどちらか 1 つの引数 cap
を取り、どの機能を有効/無効にするかを示すシンボル定数である。glDisable は以下の機能を無効にできる: GL_ALPHA_TEST
(アルファテスト)、GL_AUTO_NORMAL (評価された頂点に対する自動法線生成)、GL_BLEND
(ブレンド)、GL_CLIP_PLANEi (ユーザー定義クリップ面)、GL_COLOR_LOGIC_OP /
GL_INDEX_LOGIC_OP (論理演算)、GL_COLOR_MATERIAL (マテリアル色追跡)、GL_CULL_FACE
(カリング)、GL_DEPTH_TEST (デプステスト)、GL_DITHER (ディザリング)、GL_FOG
(フォグ)、GL_LIGHTi / GL_LIGHTING (ライティング)、GL_LINE_SMOOTH /
GL_LINE_STIPPLE (線のアンチエイリアシング/破線)、GL_MAP1_* / GL_MAP2_*
(評価器)、GL_NORMALIZE (法線正規化)、GL_POINT_SMOOTH
(点のアンチエイリアシング)、GL_POLYGON_OFFSET_FILL/LINE/POINT
(ポリゴンオフセット)、GL_POLYGON_SMOOTH/STIPPLE
(ポリゴンのアンチ/スティップル)、GL_SCISSOR_TEST、GL_STENCIL_TEST、GL_TEXTURE_1D/2D、GL_TEXTURE_GEN_Q/R/S/T。有効/無効な機能は
glIsEnabled または glGet で照会できる。glEnable / glDisable は glBegin / glEnd
ペア内では使用できない。このドキュメントは省略されている。


%index
glDisableClientState
glDisableClientState 関数はクライアントサイド機能を無効にする。
%prm
array
array : [int] 無効にするクライアントサイド機能を示すシンボル定数。受け付ける値は GL_COLOR_ARRAY、GL_EDGE_FLAG_ARRAY、GL_INDEX_ARRAY、GL_NORMAL_ARRAY、GL_TEXTURE_COORD_ARRAY、GL_VERTEX_ARRAY。
%inst
glDisableClientState 関数はクライアントサイド機能を無効にする。

[戻り値]
この関数は値を返さない。

[備考]
glEnableClientState / glDisableClientState は、個別の頂点配列機能を有効/無効にする。array
パラメータはどの機能を切り替えるかを指定する。既定では、すべてのクライアントサイド機能は無効である。glDrawArrays /
glDrawElements / glArrayElement / glInterleavedArrays
を呼び出した際、有効な配列のデータが使用される。注意: OpenGL 1.1 以降でのみ利用可能。


%index
glDrawArrays
glDrawArrays 関数は配列データから複数の幾何プリミティブを描画する。
%prm
mode, first, count
mode : [int] 構築するプリミティブの種類。受け付けるシンボル定数は GL_POINTS、GL_LINE_STRIP、GL_LINE_LOOP、GL_LINES、GL_TRIANGLE_STRIP、GL_TRIANGLE_FAN、GL_TRIANGLES、GL_QUAD_STRIP、GL_QUADS、GL_POLYGON。
first : [int] 有効化された配列内で最初のインデックスを指定する。
count : [int] レンダリングするインデックスの数。
%inst
glDrawArrays 関数は配列データから複数の幾何プリミティブを描画する。

[戻り値]
この関数は値を返さない。

[備考]
glDrawArrays は複数の幾何プリミティブを 1 回の呼び出しで描画する。個別の OpenGL
関数で頂点・法線・色を渡す代わりに、頂点・法線・色の別々の配列を事前指定しておき、glDrawArrays 1
回の呼び出しで同種プリミティブ列を定義できる。呼び出し時、first を起点として各有効配列から count
個の連続要素が使用される。mode でプリミティブの種類を指定する。戻り後、glDrawArrays
が変更した頂点属性の値は未定義。例えば GL_COLOR_ARRAY
が有効だった場合、現在の色の値は未定義となる。glDrawArrays は glBegin / glEnd ペア内では許されない。注意:
OpenGL 1.1 以降でのみ利用可能。


%index
glDrawBuffer
glDrawBuffer 関数は描画対象のカラーバッファを指定する。
%prm
mode
mode : [int] 描画対象の色バッファを指定する (最大 4 つ)。受け付けるシンボル定数は次のとおり。GL_NONE: どのバッファにも描画しない。GL_FRONT_LEFT: フロント左バッファ。GL_FRONT_RIGHT: フロント右バッファ。GL_BACK_LEFT: バック左バッファ。GL_BACK_RIGHT: バック右バッファ。GL_FRONT: 両フロント (左右)。GL_BACK: 両バック (左右)。GL_LEFT: 左 (フロント+バック)。GL_RIGHT: 右 (フロント+バック)。GL_FRONT_AND_BACK: 全 4 つ。GL_AUXi: 補助バッファ i (GL_AUX0 から GL_AUX3 まで、実装依存)。シングルバッファ環境では GL_FRONT_LEFT、GL_FRONT_RIGHT、GL_FRONT、GL_LEFT、GL_RIGHT、GL_FRONT_AND_BACK、GL_AUXi がデフォルトで有効。ダブルバッファ環境では GL_BACK_LEFT も加わる。
%inst
glDrawBuffer 関数は描画対象のカラーバッファを指定する。

[戻り値]
この関数は値を返さない。

[備考]
GL の実装は複数のバッファを持ちうる。glDrawBuffer は描画対象となるカラーバッファを指定する。シンボル定数は、どの単一
(または複数) のカラーバッファに描画を向けるかを定義する。選択されなかったバッファは glDrawBuffer
の影響を受けないピクセル書き込み以外では変更されない。無効なバッファ (例: ステレオでない環境で GL_FRONT_RIGHT)
を指定しようとするとエラーが生成される。関連情報は glGet (GL_DRAW_BUFFER) で取得できる。


%index
glDrawElements
glDrawElements 関数は配列データから幾何プリミティブを描画する。
%prm
mode, count, type, indices
mode : [int] 構築するプリミティブの種類。受け付けるシンボル定数は GL_POINTS、GL_LINE_STRIP、GL_LINE_LOOP、GL_LINES、GL_TRIANGLE_STRIP、GL_TRIANGLE_FAN、GL_TRIANGLES、GL_QUAD_STRIP、GL_QUADS、GL_POLYGON。
count : [int] レンダリングする要素数。
type : [int] インデックスの値の型。GL_UNSIGNED_BYTE、GL_UNSIGNED_SHORT、GL_UNSIGNED_INT のいずれか。
indices : [intptr] インデックスへのポインタ。
%inst
glDrawElements 関数は配列データから幾何プリミティブを描画する。

[戻り値]
この関数は値を返さない。

[備考]
glDrawElements
は少ない関数呼び出し回数で複数の幾何プリミティブを指定できる。頂点・法線・色を個別に渡す代わりに、配列を事前指定しておき、glDrawElements
1 回の呼び出しで同種プリミティブ列を定義できる。呼び出し時、indices から count 個の連続要素が使われ、mode
がプリミティブの種類を指定する。GL_VERTEX_ARRAY
が有効でなければ幾何プリミティブは生成されない。戻り後、glDrawElements
が変更した頂点属性の値は未定義。glDrawElements は glBegin / glEnd ペア内では許されない。注意:
OpenGL 1.1 以降でのみ利用可能。


%index
glDrawPixels
glDrawPixels 関数はピクセルデータのブロックをフレームバッファに書き込む。
%prm
width, height, format, type, pixels
width : [int] ピクセル矩形の幅。
height : [int] ピクセル矩形の高さ。
format : [int] ピクセルデータの形式。受け付けるシンボル定数は GL_COLOR_INDEX、GL_STENCIL_INDEX、GL_DEPTH_COMPONENT、GL_RGBA、GL_RED、GL_GREEN、GL_BLUE、GL_ALPHA、GL_RGB、GL_LUMINANCE、GL_LUMINANCE_ALPHA。このドキュメントは省略されている。
type : [int] pixels のデータ型。受け付けるシンボル定数は次のとおり。GL_UNSIGNED_BYTE: 符号なし 8 bit 整数。GL_BYTE: 符号付き 8 bit 整数。GL_BITMAP: 符号なし 8 bit 整数内の単一ビット列。GL_UNSIGNED_SHORT: 符号なし 16 bit 整数。GL_SHORT: 符号付き 16 bit 整数。GL_UNSIGNED_INT: 符号なし 32 bit 整数。GL_INT: 符号付き 32 bit 整数。GL_FLOAT: 単精度浮動小数点。
pixels : [intptr] ピクセルデータへのポインタ。
%inst
glDrawPixels 関数はピクセルデータのブロックをフレームバッファに書き込む。

[戻り値]
この関数は値を返さない。

[備考]
glDrawPixels はメモリからピクセルデータを読み取り、現在のラスタ位置を基準にフレームバッファへ書き込む。現在のラスタ位置は
glRasterPos で設定でき、glGet (GL_CURRENT_RASTER_POSITION)
で照会できる。メモリ内のピクセルデータのエンコードと、フレームバッファに配置される前の処理は glPixelStore /
glPixelTransfer / glPixelMap / glPixelZoom で設定する。width, height
はピクセル矩形の寸法、format と type はピクセル配列の形式と型を指定する。pixels
はピクセルデータへのポインタ。処理の流れは概ね「読み出し -> unpack -> pixel transfer -> ラスタ化 ->
ピクセルごとの操作 -> フレームバッファ」となる。関連情報は glGet (GL_CURRENT_RASTER_*)
で取得できる。このドキュメントは省略されている。


%index
glEdgeFlag
エッジを境界または非境界としてフラグ付けする。
%prm
flag
flag : [int] 現在のエッジフラグ値を指定する。TRUE または FALSE。
%inst
エッジを境界または非境界としてフラグ付けする。

[戻り値]
この関数は値を返さない。

[備考]
glBegin / glEnd 間で glPolygonMode が GL_LINE / GL_POINT
でレンダリングされるポリゴン、分離三角形、分離四角形の各頂点は、境界エッジか非境界エッジかを示すブール値を持ちうる。glEdgeFlag
および glEdgeFlagv はこのエッジフラグを更新する。現在のエッジフラグ値は GL_TRUE (境界) または GL_FALSE
(非境界) のいずれか。現在のエッジフラグ値が GL_FALSE のとき glBegin / glEnd
間で指定された頂点は非境界エッジの頂点となり、GL_TRUE なら境界エッジの頂点となる。glPolygonMode が GL_FILL
の場合、現在のエッジフラグ値は無視される。glEdgeFlagPointer
で頂点配列の一部としてエッジフラグを指定することもできる。関連情報は glGet (GL_EDGE_FLAG) で取得できる。


%index
glEdgeFlagPointer
glEdgeFlagPointer 関数はエッジフラグ配列を定義する。
%prm
stride, pointer
stride : [int] 連続するエッジフラグ間のバイトオフセット。stride が 0 なら、エッジフラグは配列内に密にパックされている。
pointer : [intptr] 配列内の最初のエッジフラグへのポインタ。
%inst
glEdgeFlagPointer 関数はエッジフラグ配列を定義する。

[戻り値]
この関数は値を返さない。

[備考]
glEdgeFlagPointer はレンダリング時に使用するブール型エッジフラグ配列の位置とデータを指定する。stride は 1
つのエッジフラグから次のフラグまでのバイトオフセットを決定し、他の頂点属性と一緒にパックすることを可能にする。0
なら密にパックされている。有効化するには glEnableClientState に GL_EDGE_FLAG_ARRAY
を指定する。通常 glDrawArrays / glDrawElements / glArrayElement
と組み合わせて使用する。注意: OpenGL 1.1 以降でのみ利用可能。関連情報は glGet (GL_EDGE_FLAG_ARRAY
/ GL_EDGE_FLAG_ARRAY_STRIDE) および glGetPointerv
(GL_EDGE_FLAG_ARRAY_POINTER) で取得できる。


%index
glEdgeFlagv
エッジを境界または非境界としてフラグ付けする。
%prm
flag
flag : [var] 現在のエッジフラグ値を置き換える単一のブール要素を含む配列へのポインタ。
%inst
エッジを境界または非境界としてフラグ付けする。

[戻り値]
この関数は値を返さない。

[備考]
glEdgeFlag を参照。glEdgeFlagv はポインタ経由で単一のブール値を受け取る版。


%index
glEnable
glEnable と glDisable 関数は OpenGL 機能を有効/無効にする。
%prm
cap
cap : [int] OpenGL 機能を示すシンボル定数。cap に指定可能な値は Remarks を参照。
%inst
glEnable と glDisable 関数は OpenGL 機能を有効/無効にする。

[戻り値]
この関数は値を返さない。

[備考]
glEnable と glDisable は、さまざまな OpenGL 機能を有効/無効にする。glIsEnabled / glGet
で有効な機能を照会できる。glEnable で有効にできる機能の一覧: GL_ALPHA_TEST
(アルファテスト)、GL_AUTO_NORMAL (評価された曲面の自動法線生成)、GL_BLEND
(ブレンド)、GL_CLIP_PLANEi (ユーザー定義クリップ平面)、GL_COLOR_LOGIC_OP /
GL_INDEX_LOGIC_OP (論理演算)、GL_COLOR_MATERIAL (マテリアル色追跡)、GL_CULL_FACE
(ポリゴンカリング)、GL_DEPTH_TEST (デプステスト)、GL_DITHER (ディザリング)、GL_FOG
(フォグ)、GL_LIGHTi / GL_LIGHTING (ライティング)、GL_LINE_SMOOTH /
GL_LINE_STIPPLE (線アンチエイリアシング/破線)、GL_MAP1_COLOR_4 など GL_MAP1_* および
GL_MAP2_* (1D/2D 評価器)、GL_NORMALIZE (法線正規化)、GL_POINT_SMOOTH
(点アンチエイリアシング)、GL_POLYGON_OFFSET_FILL/LINE/POINT
(ポリゴンオフセット)、GL_POLYGON_SMOOTH (ポリゴンアンチエイリアシング)、GL_POLYGON_STIPPLE
(ポリゴンスティップル)、GL_SCISSOR_TEST (シザーテスト)、GL_STENCIL_TEST
(ステンシルテスト)、GL_TEXTURE_1D / GL_TEXTURE_2D (1D/2D
テクスチャマッピング)、GL_TEXTURE_GEN_Q / R / S / T (テクスチャ座標自動生成)。glEnable /
glDisable は glBegin / glEnd ペア内では使用できない。関連情報は glGet / glIsEnabled
で取得できる。このドキュメントは省略されている。


%index
glEnableClientState
glEnableClientState と glDisableClientState 関数は配列の有効化/無効化を行う。
%prm
array
array : [int] 有効/無効にする配列を示すシンボル定数。受け付ける値: GL_COLOR_ARRAY (色配列)、GL_EDGE_FLAG_ARRAY (エッジフラグ配列)、GL_INDEX_ARRAY (インデックス配列)、GL_NORMAL_ARRAY (法線配列)、GL_TEXTURE_COORD_ARRAY (テクスチャ座標配列)、GL_VERTEX_ARRAY (頂点配列)。
%inst
glEnableClientState と glDisableClientState 関数は配列の有効化/無効化を行う。

[戻り値]
この関数は値を返さない。

[備考]
glEnableClientState / glDisableClientState は個別の配列を有効/無効にする。array
パラメータはどの配列を切り替えるかを指定する。既定ではすべての配列が無効。glDrawArrays / glDrawElements /
glArrayElement / glInterleavedArrays を呼び出した際、有効な配列のデータが使われる。注意:
OpenGL 1.1 以降でのみ利用可能。


%index
glEnd
glBegin と glEnd 関数はプリミティブまたは同種プリミティブ群の頂点を区切る。
%prm

%inst
glBegin と glEnd 関数はプリミティブまたは同種プリミティブ群の頂点を区切る。

[戻り値]
この関数はパラメータを持たず、値も返さない。

[備考]
glBegin と glEnd はプリミティブまたは同種プリミティブ群を定義する頂点を区切る。glEnd は glBegin
の対応を閉じる。詳細は glBegin の解説を参照。glBegin / glEnd 間で利用可能な関数は
glVertex、glColor、glIndex、glNormal、glTexCoord、glEvalCoord、glEvalPoint、glMaterial、glEdgeFlag
の各ファミリに限られる。それ以外の OpenGL 関数を呼ぶとエラーフラグがセットされ無視される。


%index
glEndList
glNewList と glEndList 関数は表示リストを作成または置き換える。
%prm

%inst
glNewList と glEndList 関数は表示リストを作成または置き換える。

[戻り値]
この関数はパラメータを持たず、値も返さない。

[備考]
表示リストは、後続の実行のために保存された OpenGL コマンド群である。表示リストは glNewList
で作成する。glNewList / glEndList で囲まれた間に発行される OpenGL コマンドは、次の 1
つを除き、表示リストに追加される: GL_COMPILE
モードの場合、表示リストの作成のみが行われ、コマンドは実行されない。GL_COMPILE_AND_EXECUTE
モードでは、コマンドが保存されると同時に実行もされる。表示リスト作成中、一部の関数は表示リストに入れずに直接実行される
(glIsList、glGenLists、glDeleteLists、glFeedbackBuffer、glSelectBuffer、glRenderMode、glReadPixels、glPixelStore、glFlush、glFinish、glIsEnabled、glGet*、glAreTexturesResident
など)。glNewList 呼び出しと対応する glEndList の間で glNewList を再度呼び出すと
GL_INVALID_OPERATION エラーが発生する。


%index
glEvalCoord1d
glEvalCoord1d 関数は有効な 1 次元マップを評価する。
%prm
u
u : [double] 先行する glMap1 関数で定義された基底関数に対する定義域座標 u となる値。
%inst
glEvalCoord1d 関数は有効な 1 次元マップを評価する。

[戻り値]
この関数は値を返さない。

[備考]
glEvalCoord1d は引数 u で有効な 1 次元マップを評価する。マップは glMap1
で定義する。評価されたマップは頂点・法線・テクスチャ座標・色・色インデックス値を生成でき、glVertex、glNormal、glTexCoord、glColor、glIndex
関数を呼ぶのと同じ効果を持つ
(ただし現在の法線/色/テクスチャ座標/インデックスは変更されない)。マップは個別に有効/無効化でき、複数有効なら対応するすべての属性が評価される。関連情報は
glMap1 / glMap2 / glMapGrid / glEvalMesh / glEvalPoint を参照。


%index
glEvalCoord1dv
glEvalCoord1dv 関数は有効な 1 次元マップを評価する。
%prm
u
u : [var] 定義域座標 u を含む配列へのポインタ。
%inst
glEvalCoord1dv 関数は有効な 1 次元マップを評価する。

[戻り値]
この関数は値を返さない。

[備考]
glEvalCoord1d を参照。dv は配列ポインタを受け取る版。


%index
glEvalCoord1f
glEvalCoord1f 関数は有効な 1 次元マップを評価する。
%prm
u
u : [float] 先行する glMap1 関数で定義された基底関数に対する定義域座標 u となる値。
%inst
glEvalCoord1f 関数は有効な 1 次元マップを評価する。

[戻り値]
この関数は値を返さない。

[備考]
glEvalCoord1d を参照。単精度版。


%index
glEvalCoord1fv
glEvalCoord1fv 関数は有効な 1 次元マップを評価する。
%prm
u
u : [var] 定義域座標 u を含む配列へのポインタ。
%inst
glEvalCoord1fv 関数は有効な 1 次元マップを評価する。

[戻り値]
この関数は値を返さない。

[備考]
glEvalCoord1d を参照。単精度配列ポインタ版。


%index
glEvalCoord2d
glEvalCoord2d 関数は有効な 2 次元マップを評価する。
%prm
u, v
u : [double] 先行する glMap2 関数で定義された基底関数に対する定義域座標 u となる値。
v : [double] 先行する glMap2 関数で定義された基底関数に対する定義域座標 v となる値。
%inst
glEvalCoord2d 関数は有効な 2 次元マップを評価する。

[戻り値]
この関数は値を返さない。

[備考]
glEvalCoord2d は 2 つの定義域値 u, v を用いて有効な 2 次元マップを評価する。マップは glMap2
で定義する。評価結果は頂点・法線・テクスチャ座標・色・色インデックスを生成しうる。詳細は glEvalCoord1d の解説を参照。


%index
glEvalCoord2dv
glEvalCoord2dv 関数は有効な 2 次元マップを評価する。
%prm
u
u : [var] 定義域座標 u を含む配列へのポインタ。
%inst
glEvalCoord2dv 関数は有効な 2 次元マップを評価する。

[戻り値]
この関数は値を返さない。

[備考]
glEvalCoord2d を参照。dv は配列ポインタ版。


%index
glEvalCoord2f
glEvalCoord2f 関数は有効な 2 次元マップを評価する。
%prm
u, v
u : [float] 先行する glMap2 関数で定義された基底関数に対する定義域座標 u となる値。
v : [float] 先行する glMap2 関数で定義された基底関数に対する定義域座標 v となる値。
%inst
glEvalCoord2f 関数は有効な 2 次元マップを評価する。

[戻り値]
この関数は値を返さない。

[備考]
glEvalCoord2d を参照。単精度版。


%index
glEvalCoord2fv
glEvalCoord2fv 関数は有効な 2 次元マップを評価する。
%prm
u
u : [var] 定義域座標 u を含む配列へのポインタ。
%inst
glEvalCoord2fv 関数は有効な 2 次元マップを評価する。

[戻り値]
この関数は値を返さない。

[備考]
glEvalCoord2d を参照。単精度配列ポインタ版。


%index
glEvalMesh1
点または線の 1 次元グリッドを計算する。
%prm
mode, i1, i2
mode : [int] 点または線の 1 次元メッシュを計算するかを指定する値。受け付けるシンボル定数は GL_POINT、GL_LINE。
i1 : [int] グリッド定義域変数 i の最初の整数値。
i2 : [int] グリッド定義域変数 i の最後の整数値。
%inst
点または線の 1 次元グリッドを計算する。

[戻り値]
この関数は値を返さない。


%index
glEvalMesh2
点または線の 2 次元グリッドを計算する。
%prm
mode, i1, i2, j1, j2
mode : [int] 点・線・ポリゴンのいずれかの 2 次元メッシュを計算するかを指定する値。受け付けるシンボル定数は GL_POINT、GL_LINE、GL_FILL。
i1 : [int] グリッド定義域変数 i の最初の整数値。
i2 : [int] グリッド定義域変数 i の最後の整数値。
j1 : [int] グリッド定義域変数 j の最初の整数値。
j2 : [int] グリッド定義域変数 j の最後の整数値。
%inst
点または線の 2 次元グリッドを計算する。

[戻り値]
この関数は値を返さない。


%index
glEvalPoint1
glEvalPoint1 と glEvalPoint2 関数はメッシュ内の単一点を生成・評価する。
%prm
i
i : [int] グリッド定義域変数 i の整数値。
%inst
glEvalPoint1 と glEvalPoint2 関数はメッシュ内の単一点を生成・評価する。

[戻り値]
この関数は値を返さない。

[備考]
glMapGrid と glEvalMesh は連携して効率的に一連のマップ位置を生成・評価する。glEvalPoint
は同じ方式を使って 1 つの点を生成・評価する。glEvalPoint1 は引数 i を取り、1 次元マップをグリッド定義域座標 i
で評価する。等価な glEvalCoord 呼び出しは u = i*Δu + u_min の形になる。関連情報は glEvalCoord
/ glEvalMesh / glMap1 / glMap2 / glMapGrid を参照。


%index
glEvalPoint2
glEvalPoint1 と glEvalPoint2 関数はメッシュ内の単一点を生成・評価する。
%prm
i, j
i : [int] グリッド定義域変数 i の整数値。
j : [int] グリッド定義域変数 j の整数値。
%inst
glEvalPoint1 と glEvalPoint2 関数はメッシュ内の単一点を生成・評価する。

[戻り値]
この関数は値を返さない。

[備考]
glEvalPoint1 を参照。glEvalPoint2 は 2 次元版で i, j のグリッド座標で 2 次元マップを評価する。


%index
glFeedbackBuffer
glFeedbackBuffer 関数はフィードバックモードを制御する。
%prm
size, type, buffer
size : [int] buffer に書き込める最大値数。
type : [int] 各頂点について返す情報を示すシンボル定数。受け付ける値は GL_2D、GL_3D、GL_3D_COLOR、GL_3D_COLOR_TEXTURE、GL_4D_COLOR_TEXTURE。それぞれ頂点ごとに返される値の数と内容を決定する。
buffer : [var] フィードバックデータを返す。
%inst
glFeedbackBuffer 関数はフィードバックモードを制御する。

[戻り値]
この関数は値を返さない。


%index
glFinish
glFinish 関数は全ての OpenGL 実行が完了するまでブロックする。
%prm

%inst
glFinish 関数は全ての OpenGL 実行が完了するまでブロックする。

[戻り値]
この関数はパラメータを持たず、値も返さない。

[備考]
glFinish は、先行して呼び出された全ての OpenGL 関数の効果が完了するまで戻らない。この効果には全ての変更
(フレームバッファ内容、state 変更、ピクセル転送の効果など) が含まれる。glFinish は呼び出し側を同期させる待機関数である。


%index
glFlush
glFlush 関数は OpenGL 関数の実行を有限時間内に強制する。
%prm

%inst
glFlush 関数は OpenGL 関数の実行を有限時間内に強制する。

[戻り値]
この関数はパラメータを持たず、値も返さない。

[備考]
OpenGL 実装はコマンドをさまざまな場所 (ネットワークバッファ、グラフィックスアクセラレータ自体など)
にバッファリングしうる。glFlush はこれらのバッファを空にし、すべての発行済みコマンドを OpenGL パイプラインに進めて、GL
状態を更新するのに必要なことがアクセラレータハードウェアによって行われるようにする。glFlush
はすべての発行済み操作が完了することを保証するわけではないが、有限時間内に完了することを保証する。glFinish
と異なり、すべての操作が完了するのを待たずに戻る。


%index
glFogf
glFogf 関数はフォグパラメータを指定する。
%prm
pname, param1
pname : [int] 単一値のフォグパラメータを指定する。受け付ける値: GL_FOG_MODE (使用するフォグ式のシンボル定数。GL_LINEAR、GL_EXP、GL_EXP2 のいずれか。既定は GL_EXP)、GL_FOG_DENSITY (フォグ密度。GL_EXP/GL_EXP2 モードで使用、非負でなければならない。既定は 1.0)、GL_FOG_START (線形フォグの近距離。GL_LINEAR モードで使用。既定は 0.0)、GL_FOG_END (線形フォグの遠距離。GL_LINEAR モードで使用。既定は 1.0)、GL_FOG_INDEX (カラーインデックスモード時のフォグカラーインデックス。既定は 0)。
param1 : [float] 
%inst
glFogf 関数はフォグパラメータを指定する。

[戻り値]
この関数は値を返さない。

[備考]
glEnable / glDisable に GL_FOG を指定してフォグを有効/無効化する。glFog は pname
で指定されたフォグパラメータを value 値に設定する。フォグは RGBA と色インデックスモードの両方に影響する。RGBA
モードでは各フラグメントに対しフォグ因子 f を [0, 1] にクランプした後、現在のフォグ色 C_f と入力色 C_r を c =
f*C_r + (1-f)*C_f で線形補間する。色インデックスモードではインデックス i に (1-f) * i_f
を加算する。fog factor の計算は GL_FOG_MODE により異なる: GL_LINEAR は f = (end-z) /
(end-start)、GL_EXP は f = exp(-d*z)、GL_EXP2 は f = exp(-(d*z)^2)。関連情報は
glGet (GL_FOG_COLOR / GL_FOG_INDEX / GL_FOG_DENSITY / GL_FOG_START /
GL_FOG_END / GL_FOG_MODE) および glIsEnabled (GL_FOG) で取得できる。


%index
glFogfv
glFogfv 関数はフォグパラメータを指定する。
%prm
pname, params
pname : [int] フォグパラメータを指定する。受け付ける値は GL_FOG_MODE、GL_FOG_DENSITY、GL_FOG_START、GL_FOG_END、GL_FOG_INDEX、GL_FOG_COLOR。単一値パラメータの説明は glFogf を参照。GL_FOG_COLOR は params に 4 値 (R, G, B, A) を指定し、フォグ色となる。各成分は [0, 1] にクランプされる。既定は (0, 0, 0, 0)。
params : [int] 
%inst
glFogfv 関数はフォグパラメータを指定する。

[戻り値]
この関数は値を返さない。

[備考]
glFogf の説明を参照。fv は配列ポインタ版で、ベクトル値を受け取れる (例: GL_FOG_COLOR)。


%index
glFogi
glFogi 関数はフォグパラメータを指定する。
%prm
pname, param1
pname : [int] 単一値のフォグパラメータを指定する。受け付ける値とその意味は glFogf と同じ。整数版。
param1 : [int] 
%inst
glFogi 関数はフォグパラメータを指定する。

[戻り値]
この関数は値を返さない。

[備考]
glFogf の説明を参照。整数版。


%index
glFogiv
glFogiv 関数はフォグパラメータを指定する。
%prm
pname, params
pname : [int] フォグパラメータを指定する。受け付ける値は glFogfv と同じ。整数配列版。GL_FOG_COLOR を指定した場合、整数値は浮動小数点に線形マップされてからクランプされる。
params : [int] 
%inst
glFogiv 関数はフォグパラメータを指定する。

[戻り値]
この関数は値を返さない。

[備考]
glFogf の説明を参照。iv は整数配列ポインタ版。


%index
glFrontFace
glFrontFace 関数は表面を向くポリゴンと裏面を向くポリゴンを定義する。
%prm
mode
mode : [int] 表面を向くポリゴンの向き。GL_CW および GL_CCW を受け付ける。既定値は GL_CCW。
%inst
glFrontFace 関数は表面を向くポリゴンと裏面を向くポリゴンを定義する。

[戻り値]
この関数は値を返さない。

[備考]

不透明な閉曲面のみからなるシーンでは、裏面を向くポリゴンは決して可視にならない。これらを描画前に除去することで画像の品質に影響せずに描画を高速化できる。glFrontFace
は表面の向きを指定することで、glCullFace が表裏いずれをカリングするかを決定する。glFrontFace に GL_CCW
を渡すと、スクリーン座標系で頂点が反時計回りの順に射影されるポリゴンが表面となる。GL_CW なら時計回りが表面となる。関連情報は
glGet (GL_FRONT_FACE) で取得できる。


%index
glFrustum
glFrustum 関数は現在の行列に透視行列を乗算する。
%prm
left, right, bottom, top, zNear, zFar
left : [double] 左の垂直クリッピング平面の座標。
right : [double] 右の垂直クリッピング平面の座標。
bottom : [double] 下の水平クリッピング平面の座標。
top : [double] 上の水平クリッピング平面の座標。
zNear : [double] 近デプスクリッピング平面までの距離。正でなければならない。
zFar : [double] 遠デプスクリッピング平面までの距離。正でなければならない。
%inst
glFrustum 関数は現在の行列に透視行列を乗算する。

[戻り値]
この関数は値を返さない。

[備考]
glFrustum は透視投影を生成する透視行列を記述する。(left, bottom, -zNear) と (right, top,
-zNear) は、近クリッピング平面上の点でビュー面の左下と右上の隅にマップされるウィンドウ上の点を指定する。-zFar
は遠クリッピング平面の位置を指定する。zNear と zFar はどちらも正でなければならない。現在の行列は glFrustum
で定義される行列と乗算され、積で置き換えられる (詳細は
glMultMatrix)。フラスタム行列を使うと、glRotate、glTranslate、glScale
などの変換と組み合わせて目的のカメラ投影を生成できる。深度バッファの精度は zNear と zFar の比に影響され、比が大きくなる
(zFar / zNear) ほど近接するデプスが区別しにくくなる。関連情報は glGet (GL_MATRIX_MODE) を参照。


%index
glGenLists
glGenLists 関数は連続した空の表示リスト集合を生成する。
%prm
range
range : [int] 生成する連続した空の表示リストの数。
%inst
glGenLists 関数は連続した空の表示リスト集合を生成する。

[備考]
glGenLists は引数 range を 1 つ取り、range 個の連続した空の表示リスト n, n+1, ...,
n+range-1 が作成されるような整数 n を返す。要求された数の連続した空の表示リストが作成できない場合、または range が 0
の場合、戻り値は 0 となる。


%index
glGenTextures
glGenTextures 関数はテクスチャ名を生成する。
%prm
n, textures
n : [int] 生成するテクスチャ名の数。
textures : [var] 生成されたテクスチャ名を格納する配列の先頭要素へのポインタ。
%inst
glGenTextures 関数はテクスチャ名を生成する。

[戻り値]
この関数は値を返さない。

[備考]
glGenTextures は textures パラメータに n
個のテクスチャ名を返す。テクスチャ名は必ずしも連続する整数ではない。glGenTextures で返された名前は、その後
glDeleteTextures で削除されない限り、再度 glGenTextures で返されることはない。また、戻されたテクスチャ名は
glBindTexture に渡されるまでテクスチャオブジェクトとしての状態を持たず、次元や内容も持たない。glBindTexture
に初めて渡された時点で初めてテクスチャとなる。注意: OpenGL 1.1 以降でのみ利用可能。


%index
glGetBooleanv
glGetBooleanv 関数は選択されたパラメータの値を返す。
%prm
pname, params
pname : [int] 返すパラメータ値。OpenGL が保持する多数の状態変数のシンボル定数のいずれかを指定する。主な例: GL_ACCUM_*_BITS (アキュムレーションバッファの各色成分のビット数)、GL_ACCUM_CLEAR_VALUE (クリア値)、GL_ALPHA_TEST (アルファテストの有効状態)、GL_ALPHA_TEST_FUNC / REF、GL_ATTRIB_STACK_DEPTH、GL_AUTO_NORMAL、GL_AUX_BUFFERS、GL_BLEND / BLEND_DST / BLEND_SRC、GL_CLIENT_ATTRIB_STACK_DEPTH、GL_CLIP_PLANEi、GL_COLOR_ARRAY / _SIZE / _STRIDE / _TYPE、GL_COLOR_CLEAR_VALUE、GL_COLOR_LOGIC_OP、GL_COLOR_MATERIAL / _FACE / _PARAMETER、GL_COLOR_WRITEMASK、GL_CULL_FACE / _MODE、GL_CURRENT_COLOR / _INDEX / _NORMAL / _RASTER_COLOR / _RASTER_DISTANCE / _RASTER_INDEX / _RASTER_POSITION / _POSITION_VALID / _RASTER_TEXTURE_COORDS / _TEXTURE_COORDS、GL_DEPTH_BIAS / _BITS / _CLEAR_VALUE / _FUNC / _RANGE / _SCALE / _TEST / _WRITEMASK、GL_DITHER、GL_DOUBLEBUFFER、GL_DRAW_BUFFER、GL_EDGE_FLAG / _ARRAY / _ARRAY_STRIDE、GL_FEEDBACK_BUFFER_POINTER / _SIZE / _TYPE、GL_FOG / _COLOR / _DENSITY / _END / _HINT / _INDEX / _MODE / _START、GL_FRONT_FACE、GL_INDEX_ARRAY / _STRIDE / _TYPE / _BITS / _CLEAR_VALUE / _LOGIC_OP / _MODE / _OFFSET / _SHIFT / _WRITEMASK、GL_LIGHTi / _LIGHTING、GL_LIGHT_MODEL_AMBIENT / _LOCAL_VIEWER / _TWO_SIDE、GL_LINE_SMOOTH / _SMOOTH_HINT / _STIPPLE / _STIPPLE_PATTERN / _STIPPLE_REPEAT / _WIDTH / _WIDTH_GRANULARITY / _WIDTH_RANGE、GL_LIST_BASE / _INDEX / _MODE / _MAX_LIST_NESTING、GL_LOGIC_OP、GL_MAP1_* / MAP2_* (評価器関連)、GL_MATRIX_MODE、GL_MAX_ATTRIB_STACK_DEPTH / _CLIENT_ATTRIB_STACK_DEPTH / _CLIP_PLANES / _EVAL_ORDER / _LIGHTS / _LIST_NESTING / _MODELVIEW_STACK_DEPTH / _NAME_STACK_DEPTH / _PIXEL_MAP_TABLE / _PROJECTION_STACK_DEPTH / _TEXTURE_SIZE / _TEXTURE_STACK_DEPTH / _VIEWPORT_DIMS、GL_MODELVIEW_MATRIX / _STACK_DEPTH、GL_NAME_STACK_DEPTH、GL_NORMAL_ARRAY / _STRIDE / _TYPE、GL_NORMALIZE、GL_PACK_* / UNPACK_* (ピクセルストア)、GL_PERSPECTIVE_CORRECTION_HINT、GL_PIXEL_MAP_*_SIZE、GL_POINT_SIZE / _SMOOTH / _SIZE_GRANULARITY / _SIZE_RANGE、GL_POLYGON_MODE / _OFFSET_FACTOR / _OFFSET_UNITS / _OFFSET_FILL / _OFFSET_LINE / _OFFSET_POINT / _SMOOTH / _STIPPLE、GL_PROJECTION_MATRIX / _STACK_DEPTH、GL_READ_BUFFER、GL_RED_BIAS / _BITS / _SCALE、GL_RENDER_MODE、GL_RGBA_MODE、GL_SCISSOR_BOX / _TEST、GL_SHADE_MODEL、GL_STENCIL_BITS / _CLEAR_VALUE / _FAIL / _FUNC / _PASS_DEPTH_FAIL / _PASS_DEPTH_PASS / _REF / _TEST / _VALUE_MASK / _WRITEMASK、GL_STEREO、GL_SUBPIXEL_BITS、GL_TEXTURE_1D / _2D / _BINDING_1D / _BINDING_2D / _COORD_ARRAY / _COORD_ARRAY_SIZE / _COORD_ARRAY_STRIDE / _COORD_ARRAY_TYPE / _ENV_COLOR / _ENV_MODE / _GEN_Q / _GEN_R / _GEN_S / _GEN_T / _MATRIX / _STACK_DEPTH、GL_VERTEX_ARRAY / _SIZE / _STRIDE / _TYPE、GL_VIEWPORT、GL_ZOOM_X / _Y など。詳細は OpenGL リファレンスを参照のこと。このドキュメントは省略されている。
params : [int] 
%inst
glGetBooleanv 関数は選択されたパラメータの値を返す。

[戻り値]
この関数は値を返さない。

[備考]
この関数は OpenGL の単純な状態変数の値を返す。pname は取得する状態変数を示すシンボル定数、params
は値を格納する位置へのポインタ。データ型は glGetBooleanv / glGetDoublev / glGetFloatv /
glGetIntegerv の関数名で決まる。値の型が実際の型と一致しない場合、線形マッピングが行われる。浮動小数点のブール値は 0.0
で GL_FALSE、他は GL_TRUE となる。整数への変換はブール値 GL_TRUE が 1、GL_FALSE が 0
となる。シザーボックス、ビューポート、色クリア値など複数値を持つパラメータもある。pname
が複数の情報を表す場合、複数の値が返される。関連情報は glGetClipPlane / glGetError / glGetLight
/ glGetMaterial / glGetPixelMap / glGetPolygonStipple / glGetString /
glGetTexEnv / glGetTexGen / glGetTexImage / glGetTexLevelParameter /
glGetTexParameter / glIsEnabled / glIsList を参照。


%index
glGetClipPlane
glGetClipPlane 関数は指定されたクリッピング平面の係数を返す。
%prm
plane, equation
plane : [int] クリッピング平面。クリッピング平面の数は実装依存だが、少なくとも 6 つがサポートされる。これらは GL_CLIP_PLANE0 から GL_CLIP_PLANEi - 1 までのシンボル名で識別される。ここで i は実装がサポートするクリッピング平面の数である。
equation : [var] plane のアイ座標系における平面方程式の係数を表す 4 つの倍精度値を返す。
%inst
glGetClipPlane 関数は指定されたクリッピング平面の係数を返す。

[戻り値]
この関数は値を返さない。

[備考]
glGetClipPlane は plane の平面方程式の 4 係数を equation に返す。GL_CLIP_PLANEi =
GL_CLIP_PLANE0 + i が常に成り立つ。関連情報は glClipPlane / glIsEnabled を参照。


%index
glGetDoublev
glGetDoublev 関数は選択されたパラメータの値を返す。
%prm
pname, params
pname : [int] 返すパラメータ値。シンボル定数は glGetBooleanv の pname 説明を参照 (GL_ACCUM_*、GL_ALPHA_TEST_*、GL_BLEND_*、GL_CLIP_PLANEi、GL_COLOR_*、GL_CURRENT_*、GL_DEPTH_*、GL_FOG_*、GL_LIGHT*、GL_MATRIX_*、GL_MAX_*、GL_MODELVIEW_MATRIX、GL_PROJECTION_MATRIX、GL_TEXTURE_MATRIX、GL_VIEWPORT、GL_ZOOM_* など、すべての単純状態変数)。詳細は OpenGL リファレンスを参照のこと。このドキュメントは省略されている。
params : [int] 
%inst
glGetDoublev 関数は選択されたパラメータの値を返す。

[戻り値]
この関数は値を返さない。

[備考]
この関数は OpenGL の単純な状態変数の値を返す。詳細は glGetBooleanv の remarks
を参照。glGetDoublev は倍精度浮動小数点値を返す版。整数値は double に線形マップされ、ブール値は GL_TRUE が
1.0、GL_FALSE が 0.0 となる。


%index
glGetError
glGetError 関数はエラー情報を返す。
%prm

%inst
glGetError 関数はエラー情報を返す。

[戻り値]
この関数はパラメータを持たない。glGetError は以下のエラーコードのいずれかを返す。GL_NO_ERROR:
エラーは記録されていない。GL_INVALID_ENUM: 引数に受け付けられない値が渡された。GL_INVALID_VALUE:
数値引数が範囲外である。GL_INVALID_OPERATION:
現在の状態で操作が許可されていない。GL_STACK_OVERFLOW:
操作によってスタックがオーバーフローした。GL_STACK_UNDERFLOW:
操作によってスタックがアンダーフローした。GL_OUT_OF_MEMORY: コマンドを実行するのに十分なメモリがない。OpenGL
の状態は未定義であるが、コマンドは無視される (OpenGL 実装の終了以外の選択肢はない)。

[備考]

検出可能な各エラーには数値コードとシンボル名が割り当てられる。エラー発生時、エラーフラグが該当するエラーコード値に設定される。glGetError
が呼ばれるまで、それ以上のエラー発生はフラグに影響しない (つまり元のエラーが上書きされない)。glGetError
は現在のエラーコード値を返し、その後フラグを GL_NO_ERROR に戻す。エラー発生時はエラー状態が変わるまで OpenGL
関数の実行結果は未定義となる場合がある。コンテキストに複数のエラーコードがキューされている場合があるが、glGetError は 1
つずつ返し、GL_NO_ERROR が返るまで呼ぶ必要がある。


%index
glGetFloatv
glGetFloatv 関数は選択されたパラメータの値を返す。
%prm
pname, params
pname : [int] 返すパラメータ値。シンボル定数は glGetBooleanv の pname 説明を参照 (GL_ACCUM_*、GL_ALPHA_TEST_*、GL_BLEND_*、GL_CLIP_PLANEi、GL_COLOR_*、GL_CURRENT_*、GL_DEPTH_*、GL_FOG_*、GL_LIGHT*、GL_MATRIX_*、GL_MAX_*、GL_MODELVIEW_MATRIX、GL_PROJECTION_MATRIX、GL_TEXTURE_MATRIX、GL_VIEWPORT、GL_ZOOM_* など、すべての単純状態変数)。詳細は OpenGL リファレンスを参照のこと。このドキュメントは省略されている。
params : [int] 
%inst
glGetFloatv 関数は選択されたパラメータの値を返す。

[戻り値]
この関数は値を返さない。

[備考]
この関数は OpenGL の単純な状態変数の値を返す。詳細は glGetBooleanv の remarks
を参照。glGetFloatv は単精度浮動小数点値を返す版。整数値は float に線形マップされ、ブール値は GL_TRUE が
1.0、GL_FALSE が 0.0 となる。


%index
glGetIntegerv
glGetIntegerv 関数は選択されたパラメータの値を返す。
%prm
pname, params
pname : [int] 返すパラメータ値。シンボル定数は glGetBooleanv の pname 説明を参照 (GL_ACCUM_*、GL_ALPHA_TEST_*、GL_BLEND_*、GL_CLIP_PLANEi、GL_COLOR_*、GL_CURRENT_*、GL_DEPTH_*、GL_FOG_*、GL_LIGHT*、GL_MATRIX_*、GL_MAX_*、GL_MODELVIEW_MATRIX、GL_PROJECTION_MATRIX、GL_TEXTURE_MATRIX、GL_VIEWPORT、GL_ZOOM_* など、すべての単純状態変数)。詳細は OpenGL リファレンスを参照のこと。このドキュメントは省略されている。
params : [int] 
%inst
glGetIntegerv 関数は選択されたパラメータの値を返す。

[戻り値]
この関数は値を返さない。

[備考]
この関数は OpenGL の単純な状態変数の値を返す。詳細は glGetBooleanv の remarks
を参照。glGetIntegerv は整数値を返す版。浮動小数点値は丸められて整数になり、ブール値は GL_TRUE が
1、GL_FALSE が 0 となる。


%index
glGetLightfv
glGetLightfv と glGetLightiv 関数は光源パラメータ値を返す。
%prm
light, pname, params
light : [int] 光源。光源の数は実装依存だが、少なくとも 8 つの光源がサポートされる。GL_LIGHT0 から GL_LIGHTi - 1 までのシンボル名で識別される。GL_LIGHTi = GL_LIGHT0 + i が常に成り立つ。
pname : [int] light の光源パラメータ。受け付けるシンボル名: GL_AMBIENT (環境光成分、4 値 RGBA)、GL_DIFFUSE (拡散光成分、4 値 RGBA)、GL_SPECULAR (鏡面光成分、4 値 RGBA)、GL_POSITION (光源位置、4 値 X/Y/Z/W、モデルビュー行列で変換済みのアイ座標系)、GL_SPOT_DIRECTION (スポットライト方向、3 値)、GL_SPOT_EXPONENT (スポット指数、単一値)、GL_SPOT_CUTOFF (スポットカットオフ角、単一値)、GL_CONSTANT_ATTENUATION (定数減衰係数)、GL_LINEAR_ATTENUATION (線形減衰係数)、GL_QUADRATIC_ATTENUATION (2 次減衰係数)。このドキュメントは省略されている。
params : [int] 
%inst
glGetLightfv と glGetLightiv 関数は光源パラメータ値を返す。

[戻り値]
この関数は値を返さない。


%index
glGetLightiv
glGetLightfv と glGetLightiv 関数は光源パラメータ値を返す。
%prm
light, pname, params
light : [int] 光源。光源の数は実装依存だが、少なくとも 8 つの光源がサポートされる。GL_LIGHT0 から GL_LIGHTi - 1 までのシンボル名で識別される。GL_LIGHTi = GL_LIGHT0 + i が常に成り立つ。
pname : [int] light の光源パラメータ。glGetLightfv の pname 説明を参照。整数版。このドキュメントは省略されている。
params : [int] 
%inst
glGetLightfv と glGetLightiv 関数は光源パラメータ値を返す。

[戻り値]
この関数は値を返さない。


%index
glGetMapdv
glGetMapdv、glGetMapfv、glGetMapiv 関数は評価器パラメータを返す。
%prm
target, query, v
target : [int] マップのシンボル名。受け付ける値は GL_MAP1_COLOR_4、GL_MAP1_INDEX、GL_MAP1_NORMAL、GL_MAP1_TEXTURE_COORD_1、GL_MAP1_TEXTURE_COORD_2、GL_MAP1_TEXTURE_COORD_3、GL_MAP1_TEXTURE_COORD_4、GL_MAP1_VERTEX_3、GL_MAP1_VERTEX_4 およびそれらの GL_MAP2_* 版。
query : [int] 返すパラメータを指定する。受け付けるシンボル名: GL_COEFF (制御点を返す。順序とサイズはマップの次元と成分数に依存)、GL_ORDER (次数。1D は 1 値、2D は 2 値)、GL_DOMAIN (マップの定義域を返す)。このドキュメントは省略されている。
v : [var] 要求されたデータを返す。
%inst
glGetMapdv、glGetMapfv、glGetMapiv 関数は評価器パラメータを返す。

[戻り値]
この関数は値を返さない。

[備考]
glGetMap は評価器パラメータを返す (glMap1 と glMap2 が評価器を定義する)。target
は評価されるマップ、query はどのパラメータを返すかを指定する。倍精度浮動小数点版。


%index
glGetMapfv
glGetMapdv、glGetMapfv、glGetMapiv 関数は評価器パラメータを返す。
%prm
target, query, v
target : [int] マップのシンボル名。glGetMapdv の target 説明を参照。
query : [int] 返すパラメータを指定する。GL_COEFF、GL_ORDER、GL_DOMAIN を受け付ける。glGetMapdv の query 説明を参照。このドキュメントは省略されている。
v : [var] 要求されたデータを返す。
%inst
glGetMapdv、glGetMapfv、glGetMapiv 関数は評価器パラメータを返す。

[戻り値]
この関数は値を返さない。

[備考]
glGetMap は評価器パラメータを返す。glGetMapdv の解説を参照。単精度浮動小数点版。


%index
glGetMapiv
glGetMapdv、glGetMapfv、glGetMapiv 関数は評価器パラメータを返す。
%prm
target, query, v
target : [int] マップのシンボル名。glGetMapdv の target 説明を参照。
query : [int] 返すパラメータを指定する。GL_COEFF、GL_ORDER、GL_DOMAIN を受け付ける。glGetMapdv の query 説明を参照。このドキュメントは省略されている。
v : [var] 要求されたデータを返す。
%inst
glGetMapdv、glGetMapfv、glGetMapiv 関数は評価器パラメータを返す。

[戻り値]
この関数は値を返さない。

[備考]
glGetMap 関数は評価器パラメータを返す。glGetMapdv の解説を参照。整数版。


%index
glGetMaterialfv
glGetMaterialfv と glGetMaterialiv 関数はマテリアルパラメータを返す。
%prm
face, pname, params
face : [int] 照会する 2 つのマテリアルのどちらを指定するか。GL_FRONT または GL_BACK を受け付け、表面と裏面のマテリアルを表す。
pname : [int] 返すマテリアルパラメータ。受け付ける値: GL_AMBIENT (環境反射 RGBA)、GL_DIFFUSE (拡散反射 RGBA)、GL_SPECULAR (鏡面反射 RGBA)、GL_EMISSION (発光 RGBA)、GL_SHININESS (鏡面反射指数、単一値)、GL_COLOR_INDEXES (環境・拡散・鏡面の色インデックス、3 値)。このドキュメントは省略されている。
params : [int] 
%inst
glGetMaterialfv と glGetMaterialiv 関数はマテリアルパラメータを返す。

[戻り値]
この関数は値を返さない。

[備考]
glGetMaterial は face のマテリアル pname パラメータの値を params に返す。エラーが生成されると
params の内容は変更されない。関連情報は glMaterial を参照。


%index
glGetMaterialiv
glGetMaterialfv と glGetMaterialiv 関数はマテリアルパラメータを返す。
%prm
face, pname, params
face : [int] 照会する 2 つのマテリアルのどちらを指定するか。GL_FRONT または GL_BACK を受け付け、表面と裏面のマテリアルを表す。
pname : [int] 返すマテリアルパラメータ。glGetMaterialfv の pname 説明を参照。整数版。このドキュメントは省略されている。
params : [int] 
%inst
glGetMaterialfv と glGetMaterialiv 関数はマテリアルパラメータを返す。

[戻り値]
この関数は値を返さない。

[備考]
glGetMaterial は face のマテリアル pname パラメータの値を params に返す。エラーが生成されると
params の内容は変更されない。関連情報は glMaterial を参照。


%index
glGetPixelMapfv
glGetPixelMapfv、glGetPixelMapuiv、glGetPixelMapusv 関数は指定されたピクセルマップを返す。
%prm
map, values
map : [int] 返すピクセルマップの名前。受け付ける値: GL_PIXEL_MAP_I_TO_I、GL_PIXEL_MAP_S_TO_S、GL_PIXEL_MAP_I_TO_R、GL_PIXEL_MAP_I_TO_G、GL_PIXEL_MAP_I_TO_B、GL_PIXEL_MAP_I_TO_A、GL_PIXEL_MAP_R_TO_R、GL_PIXEL_MAP_G_TO_G、GL_PIXEL_MAP_B_TO_B、GL_PIXEL_MAP_A_TO_A。
values : [var] ピクセルマップの内容を返す。
%inst
glGetPixelMapfv、glGetPixelMapuiv、glGetPixelMapusv 関数は指定されたピクセルマップを返す。

[戻り値]
この関数は値を返さない。

[備考]
map パラメータに受け付けられる値は glPixelMap を参照。glGetPixelMap は map
で指定された現在設定中のピクセルマップの内容を values に返す。glGetPixelMap は非浮動小数点マップを浮動小数点へ
(または逆方向へ) 変換して返すことができる。結果は glPixelMap で指定された時の形式とは異なりうるが、glPixelStore
で変更されない限り正常に再読み込み可能。単一ピクセルマップのサイズは glGet (GL_PIXEL_MAP_*_SIZE)
で照会できる。単精度版。


%index
glGetPixelMapuiv
glGetPixelMapfv、glGetPixelMapuiv、glGetPixelMapusv 関数は指定したピクセルマップを返す。| glGetPixelMapuiv 関数 (Gl.h)
%prm
map, values
map : [int] 返すピクセルマップの名前。受け付ける値: GL_PIXEL_MAP_I_TO_I、GL_PIXEL_MAP_S_TO_S、GL_PIXEL_MAP_I_TO_R、GL_PIXEL_MAP_I_TO_G、GL_PIXEL_MAP_I_TO_B、GL_PIXEL_MAP_I_TO_A、GL_PIXEL_MAP_R_TO_R、GL_PIXEL_MAP_G_TO_G、GL_PIXEL_MAP_B_TO_B、GL_PIXEL_MAP_A_TO_A。
values : [var] ピクセルマップの内容を返す。
%inst
glGetPixelMapfv、glGetPixelMapuiv、glGetPixelMapusv 関数は指定したピクセルマップを返す。|
glGetPixelMapuiv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
map パラメータに受け付けられる値の説明は glPixelMap を参照。glGetPixelMap は map
で指定したピクセルマップの内容を values に返す。ピクセルマップは
glReadPixels、glDrawPixels、glCopyPixels、glTexImage1D、glTexImage2D
実行時に、カラーインデックス・ステンシルインデックス・カラー成分・デプス成分を別の値にマップするために使う。符号なし整数値を要求した場合、マップ内の浮動小数点値は線形に
[0, 2^b-1] に変換される (b は要求ビット数)。符号なしショートも同様に [0, 2^16-1]
に変換される。glGetPixelMap を表示リストに含めることはできない。エラーが生成された場合、values
の内容は変更されない。関連情報は glGet (GL_PIXEL_MAP_*_SIZE / GL_MAX_PIXEL_MAP_TABLE)
で取得できる。


%index
glGetPixelMapusv
glGetPixelMapfv、glGetPixelMapuiv、glGetPixelMapusv 関数は指定したピクセルマップを返す。| glGetPixelMapusv 関数 (Gl.h)
%prm
map, values
map : [int] 返すピクセルマップの名前。受け付ける値は GL_PIXEL_MAP_I_TO_I、GL_PIXEL_MAP_S_TO_S、GL_PIXEL_MAP_I_TO_R、GL_PIXEL_MAP_I_TO_G、GL_PIXEL_MAP_I_TO_B、GL_PIXEL_MAP_I_TO_A、GL_PIXEL_MAP_R_TO_R、GL_PIXEL_MAP_G_TO_G、GL_PIXEL_MAP_B_TO_B、GL_PIXEL_MAP_A_TO_A。
values : [var] ピクセルマップの内容を返す。
%inst
glGetPixelMapfv、glGetPixelMapuiv、glGetPixelMapusv 関数は指定したピクセルマップを返す。|
glGetPixelMapusv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
map パラメータに受け付けられる値の説明は glPixelMap を参照。glGetPixelMap は map
で指定したピクセルマップの内容を values に返す。ピクセルマップは
glReadPixels、glDrawPixels、glCopyPixels、glTexImage1D、glTexImage2D
実行時に、カラーインデックス・ステンシルインデックス・カラー成分・デプス成分を別の値にマップするために使う。符号なし整数値を要求した場合、マップ内の浮動小数点値は線形に
[0, 2^b-1] に変換される (b は要求ビット数)。符号なしショートも同様に [0, 2^16-1]
に変換される。glGetPixelMap を表示リストに含めることはできない。エラーが生成された場合、values
の内容は変更されない。関連情報は glGet (GL_PIXEL_MAP_*_SIZE / GL_MAX_PIXEL_MAP_TABLE)
で取得できる。


%index
glGetPointerv
glGetPointerv 関数は頂点データ配列のアドレスを返す。
%prm
pname, params
pname : [int] 返す配列ポインタの種類を次のシンボル定数から指定する: GL_COLOR_ARRAY_POINTER、GL_EDGE_FLAG_ARRAY_POINTER、GL_FEEDBACK_BUFFER_POINTER、GL_INDEX_ARRAY_POINTER、GL_NORMAL_ARRAY_POINTER、GL_TEXTURE_COORD_ARRAY_POINTER、GL_SELECTION_BUFFER_POINTER、GL_VERTEX_ARRAY_POINTER。
params : [int] 
%inst
glGetPointerv 関数は頂点データ配列のアドレスを返す。

[戻り値]
この関数は値を返さない。

[備考]
glGetPointerv は配列ポインタ情報を返す。pname は返すポインタ種別を指定するシンボル定数、params
は返されるデータを格納する位置へのポインタ。


%index
glGetPolygonStipple
glGetPolygonStipple 関数はポリゴンスティップルパターンを返す。
%prm
mask
mask : [var] スティップルパターンを返す。
%inst
glGetPolygonStipple 関数はポリゴンスティップルパターンを返す。

[戻り値]
この関数は値を返さない。

[備考]
glGetPolygonStipple は 32x32 のポリゴンスティップルパターンを mask に返す。パターンは
glReadPixels を height/width=32、type=GL_BITMAP、format=GL_COLOR_INDEX
で呼び、スティップルパターンが内部の 32x32 カラーインデックスバッファに格納されているかのようにメモリへパックされる。ただし
glReadPixels と異なり、ピクセル転送操作 (シフト、オフセット、ピクセルマップ)
は返されるスティップル画像には適用されない。エラーが生成された場合、mask の内容は変更されない。


%index
glGetString
glGetString 関数は現在の OpenGL 接続を説明する文字列を返す。
%prm
name
name : [int] 次のシンボル定数のいずれか。GL_VENDOR: 実装を担当する会社名を返す。GL_RENDERER: 特定構成 (通常ハードウェアプラットフォーム) に依存するレンダラ識別子を返す。GL_VERSION: 現 GL 接続のバージョン番号または GL 実装のリリース番号を返す。GL_EXTENSIONS: この実装でサポートされる拡張機能リストを空白区切りで返す。
%inst
glGetString 関数は現在の OpenGL 接続を説明する文字列を返す。

[備考]
glGetString は現在の OpenGL 接続の状況を説明する静的文字列へのポインタを返す。OpenGL
には実装の性能特性を問い合わせる機能が含まれないため、アプリケーションは既知プラットフォームを識別して OpenGL
の使い方を調整することが期待される。GL_VENDOR と GL_RENDERER
の組み合わせはプラットフォームを一意に指定し、リリース間で変化しない。GL_VERSION と GL_EXTENSIONS
は異なるリリースで異なる可能性がある。GL_EXTENSIONS の各拡張名は空白で区切られる。エラーが生成された場合は NULL
を返す。注意: glGetString を glBegin/glEnd 間で呼ぶとエラー GL_INVALID_OPERATION
が生成される。関連情報は glGet で取得できる。


%index
glGetTexEnvfv
glGetTexEnvfv、glGetTexEnviv 関数はテクスチャ環境パラメータを返す。| glGetTexEnvfv 関数 (Gl.h)
%prm
target, pname, params
target : [int] テクスチャ環境。GL_TEXTURE_ENV でなければならない。
pname : [int] テクスチャ環境パラメータのシンボル名。GL_TEXTURE_ENV_MODE (現在のテクスチャ関数モード: GL_MODULATE、GL_DECAL、GL_BLEND、GL_REPLACE のいずれか) と GL_TEXTURE_ENV_COLOR (テクスチャ環境カラー。整数値は線形に [-1,1] にマップされる) を受け付ける。
params : [int] 
%inst
glGetTexEnvfv、glGetTexEnviv 関数はテクスチャ環境パラメータを返す。| glGetTexEnvfv 関数
(Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glGetTexEnv は glTexEnv で指定したテクスチャ環境の選択値を params に返す。target
はテクスチャ環境を指定し、現在は GL_TEXTURE_ENV のみ定義されサポートされる。pname
は特定のテクスチャ環境パラメータを指定する。エラーが生成された場合、params の内容は変更されない。


%index
glGetTexEnviv
glGetTexEnvfv、glGetTexEnviv 関数はテクスチャ環境パラメータを返す。| glGetTexEnviv 関数 (Gl.h)
%prm
target, pname, params
target : [int] テクスチャ環境。GL_TEXTURE_ENV でなければならない。
pname : [int] テクスチャ環境パラメータのシンボル名。GL_TEXTURE_ENV_MODE (現在のテクスチャ関数モード: GL_MODULATE、GL_DECAL、GL_BLEND、GL_REPLACE のいずれか) と GL_TEXTURE_ENV_COLOR (テクスチャ環境カラー。整数値は線形に [-1,1] にマップされる) を受け付ける。
params : [int] 
%inst
glGetTexEnvfv、glGetTexEnviv 関数はテクスチャ環境パラメータを返す。| glGetTexEnviv 関数
(Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glGetTexEnv は glTexEnv で指定したテクスチャ環境の選択値を params に返す。target
はテクスチャ環境を指定し、現在は GL_TEXTURE_ENV のみ定義されサポートされる。pname
は特定のテクスチャ環境パラメータを指定する。エラーが生成された場合、params の内容は変更されない。


%index
glGetTexGendv
glGetTexGendv、glGetTexGenfv、glGetTexGeniv 関数はテクスチャ座標生成パラメータを返す。| glGetTexGendv 関数 (Gl.h)
%prm
coord, pname, params
coord : [int] テクスチャ座標。GL_S、GL_T、GL_R、GL_Q のいずれかでなければならない。
pname : [int] 返す値のシンボル名。GL_TEXTURE_GEN_MODE (現在のテクスチャ座標生成関数: GL_OBJECT_LINEAR、GL_EYE_LINEAR、GL_SPHERE_MAP のいずれか) か、テクスチャ生成平面方程式 GL_OBJECT_PLANE (オブジェクト線形生成関数用の参照平面方程式) または GL_EYE_PLANE (アイ線形生成関数用の参照平面方程式) のいずれかでなければならない。
params : [int] 
%inst
glGetTexGendv、glGetTexGenfv、glGetTexGeniv 関数はテクスチャ座標生成パラメータを返す。|
glGetTexGendv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glGetTexGen は glTexGen で指定したテクスチャ座標生成関数の選択パラメータを params に返す。coord
はシンボル定数 GL_S、GL_T、GL_R、GL_Q を用いて (s, t, r, q)
のいずれかを指定する。エラーが生成された場合、params の内容は変更されない。


%index
glGetTexGenfv
glGetTexGendv、glGetTexGenfv、glGetTexGeniv 関数はテクスチャ座標生成パラメータを返す。| glGetTexGenfv 関数 (Gl.h)
%prm
coord, pname, params
coord : [int] テクスチャ座標。GL_S、GL_T、GL_R、GL_Q のいずれかでなければならない。
pname : [int] 返す値のシンボル名。GL_TEXTURE_GEN_MODE (現在のテクスチャ座標生成関数: GL_OBJECT_LINEAR、GL_EYE_LINEAR、GL_SPHERE_MAP のいずれか) か、テクスチャ生成平面方程式 GL_OBJECT_PLANE (オブジェクト線形生成関数用の参照平面方程式) または GL_EYE_PLANE (アイ線形生成関数用の参照平面方程式) のいずれかでなければならない。
params : [int] 
%inst
glGetTexGendv、glGetTexGenfv、glGetTexGeniv 関数はテクスチャ座標生成パラメータを返す。|
glGetTexGenfv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glGetTexGen は glTexGen で指定したテクスチャ座標生成関数の選択パラメータを params に返す。coord
はシンボル定数 GL_S、GL_T、GL_R、GL_Q を用いて (s, t, r, q)
のいずれかを指定する。エラーが生成された場合、params の内容は変更されない。


%index
glGetTexGeniv
glGetTexGendv、glGetTexGenfv、glGetTexGeniv 関数はテクスチャ座標生成パラメータを返す。| glGetTexGeniv 関数 (Gl.h)
%prm
coord, pname, params
coord : [int] テクスチャ座標。GL_S、GL_T、GL_R、GL_Q のいずれかでなければならない。
pname : [int] 返す値のシンボル名。GL_TEXTURE_GEN_MODE (現在のテクスチャ座標生成関数: GL_OBJECT_LINEAR、GL_EYE_LINEAR、GL_SPHERE_MAP のいずれか) か、テクスチャ生成平面方程式 GL_OBJECT_PLANE (オブジェクト線形生成関数用の参照平面方程式) または GL_EYE_PLANE (アイ線形生成関数用の参照平面方程式) のいずれかでなければならない。
params : [int] 
%inst
glGetTexGendv、glGetTexGenfv、glGetTexGeniv 関数はテクスチャ座標生成パラメータを返す。|
glGetTexGeniv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glGetTexGen は glTexGen で指定したテクスチャ座標生成関数の選択パラメータを params に返す。coord
はシンボル定数 GL_S、GL_T、GL_R、GL_Q を用いて (s, t, r, q)
のいずれかを指定する。エラーが生成された場合、params の内容は変更されない。


%index
glGetTexImage
glGetTexImage 関数はテクスチャ画像を返す。
%prm
target, level, format, type, pixels
target : [int] 取得するテクスチャを指定する。GL_TEXTURE_1D と GL_TEXTURE_2D を受け付ける。
level : [int] 目的画像の詳細度レベル番号。レベル 0 が基本イメージレベルで、レベル n は n 段階目のミップマップ縮小画像。
format : [int] 返されるデータのピクセルフォーマット。サポートされるフォーマットは GL_RED、GL_GREEN、GL_BLUE、GL_ALPHA、GL_RGB、GL_RGBA、GL_LUMINANCE、GL_BGR_EXT、GL_BGRA_EXT、GL_LUMINANCE_ALPHA。
type : [int] 返されるデータのピクセル型。サポートされる型は GL_UNSIGNED_BYTE、GL_BYTE、GL_UNSIGNED_SHORT、GL_SHORT、GL_UNSIGNED_INT、GL_INT、GL_FLOAT。
pixels : [intptr] テクスチャ画像を返す。type で指定された型の配列へのポインタであるべき。
%inst
glGetTexImage 関数はテクスチャ画像を返す。

[戻り値]
この関数は値を返さない。

[備考]
glGetTexImage はテクスチャ画像を pixels に返す。target は目的画像が
glTexImage1D(GL_TEXTURE_1D) と glTexImage2D(GL_TEXTURE_2D)
のどちらで指定されたかを示す。level は目的画像の詳細度レベル、format と type
は返される画像配列のフォーマットと型を指定する。受け付ける値の説明はそれぞれ glTexImage1D と glDrawPixels
を参照。glGetTexImage はテクスチャ画像を反転せずに pixels に復元する (つまり画像の左下隅が pixels
の最初の位置になる)。glPixelStore の整列指定はピクセル転送操作と同じくピクセル格納に影響する。glGetTexImage
は表示リストに含められない。テクスチャ画像に割り当てられる精度は実装依存だが、フレームバッファの色精度と同等以上。エラーが生成された場合、pixels
の内容は変更されない。


%index
glGetTexLevelParameterfv
glGetTexLevelParameterfv、glGetTexLevelParameteriv 関数は特定の詳細度レベルに対するテクスチャパラメータ値を返す。| glGetTexLevelParameterfv 関数 (Gl.h)
%prm
target, level, pname, params
target : [int] 対象テクスチャのシンボル名。GL_TEXTURE_1D、GL_TEXTURE_2D、GL_PROXY_TEXTURE_1D、GL_PROXY_TEXTURE_2D のいずれか。
level : [int] 目的画像の詳細度レベル番号。レベル 0 が基本イメージレベルで、レベル n は n 段階目のミップマップ縮小画像。
pname : [int] テクスチャパラメータのシンボル名。GL_TEXTURE_WIDTH/HEIGHT/INTERNAL_FORMAT/BORDER/RED_SIZE/GREEN_SIZE/BLUE_SIZE/ALPHA_SIZE/LUMINANCE_SIZE/INTENSITY_SIZE/COMPONENTS を受け付ける。プロキシテクスチャでは幅・高さ・境界・内部フォーマットが問い合わせ可能だが、プロキシテクスチャには実データが無い点に注意する。
params : [int] 
%inst
glGetTexLevelParameterfv、glGetTexLevelParameteriv
関数は特定の詳細度レベルに対するテクスチャパラメータ値を返す。| glGetTexLevelParameterfv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glGetTexLevelParameter は、level で指定した特定の詳細度レベルに対するテクスチャパラメータ値を params
に返す。target
は対象テクスチャを指定し、GL_TEXTURE_1D、GL_TEXTURE_2D、GL_PROXY_TEXTURE_1D、GL_PROXY_TEXTURE_2D
のいずれか。pname は値を取得するパラメータ名。エラーが生成された場合、params の内容は変更されない。


%index
glGetTexLevelParameteriv
glGetTexLevelParameterfv、glGetTexLevelParameteriv 関数は特定の詳細度レベルに対するテクスチャパラメータ値を返す。| glGetTexLevelParameteriv 関数 (Gl.h)
%prm
target, level, pname, params
target : [int] 対象テクスチャのシンボル名。GL_TEXTURE_1D、GL_TEXTURE_2D、GL_PROXY_TEXTURE_1D、GL_PROXY_TEXTURE_2D のいずれか。
level : [int] 目的画像の詳細度レベル番号。レベル 0 が基本イメージレベルで、レベル n は n 段階目のミップマップ縮小画像。
pname : [int] テクスチャパラメータのシンボル名。GL_TEXTURE_WIDTH/HEIGHT/INTERNAL_FORMAT/BORDER/RED_SIZE/GREEN_SIZE/BLUE_SIZE/ALPHA_SIZE/LUMINANCE_SIZE/INTENSITY_SIZE/COMPONENTS を受け付ける。プロキシテクスチャでは幅・高さ・境界・内部フォーマットが問い合わせ可能だが、プロキシテクスチャには実データが無い点に注意する。
params : [int] 
%inst
glGetTexLevelParameterfv、glGetTexLevelParameteriv
関数は特定の詳細度レベルに対するテクスチャパラメータ値を返す。| glGetTexLevelParameteriv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glGetTexLevelParameter は、level で指定した特定の詳細度レベルに対するテクスチャパラメータ値を params
に返す。target
は対象テクスチャを指定し、GL_TEXTURE_1D、GL_TEXTURE_2D、GL_PROXY_TEXTURE_1D、GL_PROXY_TEXTURE_2D
のいずれか。pname は値を取得するパラメータ名。エラーが生成された場合、params の内容は変更されない。


%index
glGetTexParameterfv
glGetTexParameterfv、glGetTexParameteriv 関数はテクスチャパラメータ値を返す。| glGetTexParameterfv 関数 (Gl.h)
%prm
target, pname, params
target : [int] 対象テクスチャのシンボル名。GL_TEXTURE_1D と GL_TEXTURE_2D を受け付ける。
pname : [int] テクスチャパラメータのシンボル名。GL_TEXTURE_MAG_FILTER/MIN_FILTER/WRAP_S/WRAP_T/BORDER_COLOR/PRIORITY/RESIDENT を受け付ける。それぞれ拡大フィルタ、縮小フィルタ、s/t 座標のラップモード、境界色 (4 成分)、テクスチャ優先度、常駐フラグを返す。
params : [int] 
%inst
glGetTexParameterfv、glGetTexParameteriv 関数はテクスチャパラメータ値を返す。|
glGetTexParameterfv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glGetTexParameter は pname で指定したテクスチャパラメータの値を params に返す。target
は対象テクスチャを定義し、GL_TEXTURE_1D または GL_TEXTURE_2D を指定して 1 次元または 2
次元テクスチャリングを指定する。pname は glTexParameter
と同じシンボルを同じ解釈で受け付ける。エラーが生成された場合、params の内容は変更されない。


%index
glGetTexParameteriv
glGetTexParameterfv、glGetTexParameteriv 関数はテクスチャパラメータ値を返す。| glGetTexParameteriv 関数 (Gl.h)
%prm
target, pname, params
target : [int] 対象テクスチャのシンボル名。GL_TEXTURE_1D と GL_TEXTURE_2D を受け付ける。
pname : [int] テクスチャパラメータのシンボル名。GL_TEXTURE_MAG_FILTER/MIN_FILTER/WRAP_S/WRAP_T/BORDER_COLOR/PRIORITY/RESIDENT を受け付ける。それぞれ拡大フィルタ、縮小フィルタ、s/t 座標のラップモード、境界色 (4 成分)、テクスチャ優先度、常駐フラグを返す。
params : [int] 
%inst
glGetTexParameterfv、glGetTexParameteriv 関数はテクスチャパラメータ値を返す。|
glGetTexParameteriv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glGetTexParameter は pname で指定したテクスチャパラメータの値を params に返す。target
は対象テクスチャを定義し、GL_TEXTURE_1D または GL_TEXTURE_2D を指定して 1 次元または 2
次元テクスチャリングを指定する。pname は glTexParameter
と同じシンボルを同じ解釈で受け付ける。エラーが生成された場合、params の内容は変更されない。


%index
glHint
glHint 関数は実装依存のヒントを指定する。
%prm
target, mode
target : [int] 制御する動作を示すシンボル定数。受け付ける値: GL_FOG_HINT (フォグ計算の品質を指示)、GL_LINE_SMOOTH_HINT (アンチエイリアス線のサンプリング品質)、GL_PERSPECTIVE_CORRECTION_HINT (カラー・テクスチャ座標の透視補正品質)、GL_POINT_SMOOTH_HINT (アンチエイリアス点のサンプリング品質)、GL_POLYGON_SMOOTH_HINT (アンチエイリアスポリゴンのサンプリング品質)。
mode : [int] 望む動作を示すシンボル定数。受け付ける値: GL_FASTEST (最も効率の良いオプションを選択する)、GL_NICEST (最も高品質なオプションを選択する)、GL_DONT_CARE (好みがないことを示す)。
%inst
glHint 関数は実装依存のヒントを指定する。

[戻り値]
この関数は値を返さない。

[備考]
解釈に余地がある場合、OpenGL の特定動作をヒントで制御できる。ヒントは 2 つの引数で指定する。target
は制御する動作を示すシンボル定数、mode
は望む動作を示すシンボル定数。ヒントを指示できる実装面は定義されているものの、その解釈は実装依存である。glHint
は無視される場合がある。


%index
glIndexMask
glIndexMask 関数はカラーインデックスバッファの個々のビット書き込みを制御する。
%prm
mask
mask : [int] カラーインデックスバッファの個々のビット書き込みを有効/無効にするビットマスク。初期状態では全ビットが 1。
%inst
glIndexMask 関数はカラーインデックスバッファの個々のビット書き込みを制御する。

[戻り値]
この関数は値を返さない。

[備考]
glIndexMask はカラーインデックスバッファへの個々のビット書き込みを制御する。mask の下位 n ビット (n
はカラーインデックスバッファのビット数) がマスクとして働き、1 の位置は対応ビットを書き込み可能とし、0
の位置は書き込み禁止にする。このマスクはカラーインデックスモードのみで使用され、現在書き込み用に選択されているバッファ
(glDrawBuffer 参照) にのみ作用する。初期状態では全ビットが書き込み可能。関連情報は glGet
(GL_INDEX_WRITEMASK / GL_INDEX_BITS) で取得できる。


%index
glIndexPointer
glIndexPointer 関数はカラーインデックス配列を定義する。
%prm
type, stride, pointer
type : [int] 配列内の各カラーインデックスのデータ型。次のシンボル定数を用いる: GL_SHORT、GL_INT、GL_FLOAT、GL_DOUBLE。
stride : [int] 連続するカラーインデックス間のバイトオフセット。stride が 0 のとき、配列内にカラーインデックスが密に詰めて格納される。
pointer : [intptr] 配列内の最初のカラーインデックスへのポインタ。
%inst
glIndexPointer 関数はカラーインデックス配列を定義する。

[戻り値]
この関数は値を返さない。

[備考]
glIndexPointer はレンダリング時に使用するカラーインデックス配列の位置とデータを指定する。type
は各インデックスのデータ型、stride
はインデックス間のバイトオフセットで、頂点と属性を単一配列にパックするか別々の配列に格納するかを選べる。実装によっては単一配列に格納したほうが効率的なことがある
(glInterleavedArrays 参照)。glEnableClientState(GL_INDEX_ARRAY)
でインデックス配列を有効化する。無効時は描画関数でアクセスされない。glIndexPointer は通常 OpenGL
のクライアント側で実装されるため、コンテキストごとのクライアントステートに属し、表示リストに保存されない。注意: OpenGL 1.1
以降でのみ利用可能。


%index
glIndexd
glIndexd 関数は現在のカラーインデックスを設定する。
%prm
c
c : [double] 現在のカラーインデックスの新しい値。
%inst
glIndexd 関数は現在のカラーインデックスを設定する。

[戻り値]
この関数は値を返さない。

[備考]
glIndex* は現在の (単一値の) カラーインデックスを更新する。引数は 1
つで、カラーインデックスの新しい値である。現在のインデックスは浮動小数点値として保持される。整数値は特別なマッピングなしに直接浮動小数点へ変換される。カラーインデックスバッファの表現可能範囲外のインデックスはクランプされない。ただしインデックスは
(有効な場合) ディザリング前に固定小数点形式に変換され、フレームバッファ内のインデックス表現に対応しないビットはマスクされる。関連情報は
glGet (GL_CURRENT_INDEX) で取得できる。


%index
glIndexdv
glIndexdv 関数は現在のカラーインデックスを設定する。
%prm
c
c : [var] 現在のカラーインデックスの新しい値を含む 1 要素配列へのポインタ。
%inst
glIndexdv 関数は現在のカラーインデックスを設定する。

[戻り値]
この関数は値を返さない。

[備考]
glIndex* は現在の (単一値の) カラーインデックスを更新する。引数は 1
つで、カラーインデックスの新しい値である。現在のインデックスは浮動小数点値として保持される。整数値は特別なマッピングなしに直接浮動小数点へ変換される。カラーインデックスバッファの表現可能範囲外のインデックスはクランプされない。ただしインデックスは
(有効な場合) ディザリング前に固定小数点形式に変換され、フレームバッファ内のインデックス表現に対応しないビットはマスクされる。関連情報は
glGet (GL_CURRENT_INDEX) で取得できる。


%index
glIndexf
glIndexf 関数は現在のカラーインデックスを設定する。
%prm
c
c : [float] 現在のカラーインデックスの新しい値。
%inst
glIndexf 関数は現在のカラーインデックスを設定する。

[戻り値]
この関数は値を返さない。

[備考]
glIndex* は現在の (単一値の) カラーインデックスを更新する。引数は 1
つで、カラーインデックスの新しい値である。現在のインデックスは浮動小数点値として保持される。整数値は特別なマッピングなしに直接浮動小数点へ変換される。カラーインデックスバッファの表現可能範囲外のインデックスはクランプされない。ただしインデックスは
(有効な場合) ディザリング前に固定小数点形式に変換され、フレームバッファ内のインデックス表現に対応しないビットはマスクされる。関連情報は
glGet (GL_CURRENT_INDEX) で取得できる。


%index
glIndexfv
glIndexfv 関数は現在のカラーインデックスを設定する。
%prm
c
c : [var] 現在のカラーインデックスの新しい値を含む 1 要素配列へのポインタ。
%inst
glIndexfv 関数は現在のカラーインデックスを設定する。

[戻り値]
この関数は値を返さない。

[備考]
glIndex* は現在の (単一値の) カラーインデックスを更新する。引数は 1
つで、カラーインデックスの新しい値である。現在のインデックスは浮動小数点値として保持される。整数値は特別なマッピングなしに直接浮動小数点へ変換される。カラーインデックスバッファの表現可能範囲外のインデックスはクランプされない。ただしインデックスは
(有効な場合) ディザリング前に固定小数点形式に変換され、フレームバッファ内のインデックス表現に対応しないビットはマスクされる。関連情報は
glGet (GL_CURRENT_INDEX) で取得できる。


%index
glIndexi
glIndexi 関数は現在のカラーインデックスを設定する。
%prm
c
c : [int] 現在のカラーインデックスの新しい値。
%inst
glIndexi 関数は現在のカラーインデックスを設定する。

[戻り値]
この関数は値を返さない。

[備考]
glIndex* は現在の (単一値の) カラーインデックスを更新する。引数は 1
つで、カラーインデックスの新しい値である。現在のインデックスは浮動小数点値として保持される。整数値は特別なマッピングなしに直接浮動小数点へ変換される。カラーインデックスバッファの表現可能範囲外のインデックスはクランプされない。ただしインデックスは
(有効な場合) ディザリング前に固定小数点形式に変換され、フレームバッファ内のインデックス表現に対応しないビットはマスクされる。関連情報は
glGet (GL_CURRENT_INDEX) で取得できる。


%index
glIndexiv
glIndexiv 関数は現在のカラーインデックスを設定する。
%prm
c
c : [var] 現在のカラーインデックスの新しい値を含む 1 要素配列へのポインタ。
%inst
glIndexiv 関数は現在のカラーインデックスを設定する。

[戻り値]
この関数は値を返さない。

[備考]
glIndex* は現在の (単一値の) カラーインデックスを更新する。引数は 1
つで、カラーインデックスの新しい値である。現在のインデックスは浮動小数点値として保持される。整数値は特別なマッピングなしに直接浮動小数点へ変換される。カラーインデックスバッファの表現可能範囲外のインデックスはクランプされない。ただしインデックスは
(有効な場合) ディザリング前に固定小数点形式に変換され、フレームバッファ内のインデックス表現に対応しないビットはマスクされる。関連情報は
glGet (GL_CURRENT_INDEX) で取得できる。


%index
glIndexs
glIndexs 関数は現在のカラーインデックスを設定する。
%prm
c
c : [int] 現在のカラーインデックスの新しい値。
%inst
glIndexs 関数は現在のカラーインデックスを設定する。

[戻り値]
この関数は値を返さない。

[備考]
glIndex* は現在の (単一値の) カラーインデックスを更新する。引数は 1
つで、カラーインデックスの新しい値である。現在のインデックスは浮動小数点値として保持される。整数値は特別なマッピングなしに直接浮動小数点へ変換される。カラーインデックスバッファの表現可能範囲外のインデックスはクランプされない。ただしインデックスは
(有効な場合) ディザリング前に固定小数点形式に変換され、フレームバッファ内のインデックス表現に対応しないビットはマスクされる。関連情報は
glGet (GL_CURRENT_INDEX) で取得できる。


%index
glIndexsv
glIndexsv 関数は現在のカラーインデックスを設定する。
%prm
c
c : [var] 現在のカラーインデックスの新しい値を含む 1 要素配列へのポインタ。
%inst
glIndexsv 関数は現在のカラーインデックスを設定する。

[戻り値]
この関数は値を返さない。

[備考]
glIndex* は現在の (単一値の) カラーインデックスを更新する。引数は 1
つで、カラーインデックスの新しい値である。現在のインデックスは浮動小数点値として保持される。整数値は特別なマッピングなしに直接浮動小数点へ変換される。カラーインデックスバッファの表現可能範囲外のインデックスはクランプされない。ただしインデックスは
(有効な場合) ディザリング前に固定小数点形式に変換され、フレームバッファ内のインデックス表現に対応しないビットはマスクされる。関連情報は
glGet (GL_CURRENT_INDEX) で取得できる。


%index
glIndexub
(no summary)
%prm
c
c : [int] 
%inst



%index
glIndexubv
(no summary)
%prm
c
c : [var] 
%inst



%index
glInitNames
glInitNames 関数はネームスタックを初期化する。
%prm

%inst
glInitNames 関数はネームスタックを初期化する。

[戻り値]
この関数は引数を持たず、値を返さない。

[備考]
glInitNames
はネームスタックを既定の空状態に初期化する。ネームスタックはセレクションモード中に、レンダリングコマンド群を一意に識別するために使われる順序付き符号なし整数集合である。レンダーモードが
GL_SELECT でない間、ネームスタックは常に空で、そのとき glInitNames を呼んでも無視される。関連情報は glGet
(GL_NAME_STACK_DEPTH / GL_MAX_NAME_STACK_DEPTH) および glRenderMode
で取得できる。


%index
glInterleavedArrays
glInterleavedArrays 関数は、より大きな集約配列内でインターリーブされた複数配列を同時に指定・有効化する。
%prm
format, stride, pointer
format : [int] 有効化する配列の型。次のシンボル定数のいずれかを指定する: GL_V2F、GL_V3F、GL_C4UB_V2F、GL_C4UB_V3F、GL_C3F_V3F、GL_N3F_V3F、GL_C4F_N3F_V3F、GL_T2F_V3F、GL_T4F_V4F、GL_T2F_C4UB_V3F、GL_T2F_C3F_V3F、GL_T2F_N3F_V3F、GL_T2F_C4F_N3F_V3F、GL_T4F_C4F_N3F_V4F。
stride : [int] 集約配列要素間のバイトオフセット。
pointer : [intptr] 集約配列の最初の要素へのポインタ。
%inst
glInterleavedArrays 関数は、より大きな集約配列内でインターリーブされた複数配列を同時に指定・有効化する。

[戻り値]
この関数は値を返さない。

[備考]
glInterleavedArrays
では、より大きな集約配列要素の一部となる複数のインターリーブされたカラー・法線・テクスチャ・頂点配列を同時に指定・有効化できる。メモリアーキテクチャによっては、別々の配列を指定するより効率的である。stride
が 0 なら集約要素は連続して格納され、そうでなければ要素間に stride バイトが空く。format
は集約配列から個々の配列をどう取り出すかを記述するキーで、T (テクスチャ座標配列)、C (カラー配列)、N (法線配列)、V
(頂点配列) の有無と成分数・型を示す。各配列はそれぞれ glEnableClientState
で有効化され、既定の配列ポインタ/ストライドに上書きされる。頂点配列は常に最後に置かれる。注意: OpenGL 1.1
以降でのみ利用可能。


%index
glIsEnabled
glIsEnabled 関数は機能が有効かどうかを検査する。
%prm
cap
cap : [int] OpenGL の機能を示すシンボル定数。GL_ALPHA_TEST、GL_AUTO_NORMAL、GL_BLEND、GL_CLIP_PLANEi、GL_COLOR_ARRAY、GL_COLOR_LOGIC_OP、GL_COLOR_MATERIAL、GL_CULL_FACE、GL_DEPTH_TEST、GL_DITHER、GL_EDGE_FLAG_ARRAY、GL_FOG、GL_INDEX_ARRAY、GL_INDEX_LOGIC_OP、GL_LIGHTi、GL_LIGHTING、GL_LINE_SMOOTH、GL_LINE_STIPPLE、GL_MAP1_*、GL_MAP2_*、GL_NORMAL_ARRAY、GL_NORMALIZE、GL_POINT_SMOOTH、GL_POLYGON_OFFSET_FILL/LINE/POINT、GL_POLYGON_SMOOTH、GL_POLYGON_STIPPLE、GL_SCISSOR_TEST、GL_STENCIL_TEST、GL_TEXTURE_1D、GL_TEXTURE_2D、GL_TEXTURE_COORD_ARRAY、GL_TEXTURE_GEN_Q/R/S/T、GL_VERTEX_ARRAY などを受け付ける。 このドキュメントは省略されている。
%inst
glIsEnabled 関数は機能が有効かどうかを検査する。

[備考]
glIsEnabled は cap が有効化された機能のとき GL_TRUE を返し、そうでなければ GL_FALSE を返す。


%index
glIsList
glIsList 関数は表示リストの存在を検査する。
%prm
list
list : [int] 表示リスト名の候補。
%inst
glIsList 関数は表示リストの存在を検査する。

[備考]
glIsList は list が表示リストの名前なら GL_TRUE、そうでなければ GL_FALSE を返す。


%index
glIsTexture
glIsTexture 関数は名前がテクスチャに対応するかを判定する。
%prm
texture
texture : [int] テクスチャ名となる値。
%inst
glIsTexture 関数は名前がテクスチャに対応するかを判定する。

[備考]
texture パラメータが現在テクスチャ名であれば glIsTexture は GL_TRUE を返す。texture が 0
の場合、あるいは現在テクスチャ名でない非 0 値やエラー発生時には GL_FALSE を返す。glIsTexture
呼び出しは表示リストに含められない。注意: OpenGL 1.1 以降でのみ利用可能。


%index
glLightModelf
glLightModelf 関数はライティングモデルパラメータを設定する。
%prm
pname, param1
pname : [int] 単一値のライティングモデルパラメータ。GL_LIGHT_MODEL_LOCAL_VIEWER (0 でない場合は視点位置からスペキュラ反射角を計算し、そうでなければ視線を -z 方向平行とみなす。既定 0)、GL_LIGHT_MODEL_TWO_SIDE (0 でない場合は両面ライティングを有効化し、裏面ポリゴンは裏向きマテリアルで計算する。既定 0) を受け付ける。
param1 : [float] 
%inst
glLightModelf 関数はライティングモデルパラメータを設定する。

[戻り値]
この関数は値を返さない。

[備考]
glLightModel* はライティングモデルのパラメータを設定する。pname はパラメータ名、param は新しい値である。RGBA
モードでは頂点のライティング後の色は、マテリアルの発光強度、マテリアルアンビエント反射率とライティングモデルのシーンアンビエント強度の積、および有効な各光源の寄与の合計となる。各光源はアンビエント・ディフューズ・スペキュラの
3
項の和を寄与する。アンビエント寄与はマテリアルと光源のアンビエント色の積、ディフューズ寄与はマテリアルと光源のディフューズ色に法線と光源方向の内積を乗じた値、スペキュラ寄与は半角ベクトルと法線の内積を
GL_SHININESS 乗した値で決まる。既定では両面ライティングは無効で、裏面ポリゴンも表面マテリアルで計算される。関連情報は
glGet (GL_LIGHT_MODEL_AMBIENT / LOCAL_VIEWER / TWO_SIDE) および
glIsEnabled (GL_LIGHTING) で取得できる。


%index
glLightModelfv
glLightModelfv 関数はライティングモデルパラメータを設定する。
%prm
pname, params
pname : [int] ライティングモデルパラメータ。単一値のライティングモデルパラメータ。GL_LIGHT_MODEL_LOCAL_VIEWER (0 でない場合は視点位置からスペキュラ反射角を計算し、そうでなければ視線を -z 方向平行とみなす。既定 0)、GL_LIGHT_MODEL_TWO_SIDE (0 でない場合は両面ライティングを有効化し、裏面ポリゴンは裏向きマテリアルで計算する。既定 0) を受け付ける。 さらに GL_LIGHT_MODEL_AMBIENT (シーン全体のアンビエント強度。既定 (0.2, 0.2, 0.2, 1.0)) を受け付ける。
params : [int] 
%inst
glLightModelfv 関数はライティングモデルパラメータを設定する。

[戻り値]
この関数は値を返さない。

[備考]
glLightModel* はライティングモデルのパラメータを設定する。pname はパラメータ名、param は新しい値である。RGBA
モードでは頂点のライティング後の色は、マテリアルの発光強度、マテリアルアンビエント反射率とライティングモデルのシーンアンビエント強度の積、および有効な各光源の寄与の合計となる。各光源はアンビエント・ディフューズ・スペキュラの
3
項の和を寄与する。アンビエント寄与はマテリアルと光源のアンビエント色の積、ディフューズ寄与はマテリアルと光源のディフューズ色に法線と光源方向の内積を乗じた値、スペキュラ寄与は半角ベクトルと法線の内積を
GL_SHININESS 乗した値で決まる。既定では両面ライティングは無効で、裏面ポリゴンも表面マテリアルで計算される。関連情報は
glGet (GL_LIGHT_MODEL_AMBIENT / LOCAL_VIEWER / TWO_SIDE) および
glIsEnabled (GL_LIGHTING) で取得できる。


%index
glLightModeli
glLightModeli 関数はライティングモデルパラメータを設定する。
%prm
pname, param1
pname : [int] 単一値のライティングモデルパラメータ。GL_LIGHT_MODEL_LOCAL_VIEWER (0 でない場合は視点位置からスペキュラ反射角を計算し、そうでなければ視線を -z 方向平行とみなす。既定 0)、GL_LIGHT_MODEL_TWO_SIDE (0 でない場合は両面ライティングを有効化し、裏面ポリゴンは裏向きマテリアルで計算する。既定 0) を受け付ける。
param1 : [int] 
%inst
glLightModeli 関数はライティングモデルパラメータを設定する。

[戻り値]
この関数は値を返さない。

[備考]
glLightModel* はライティングモデルのパラメータを設定する。pname はパラメータ名、param は新しい値である。RGBA
モードでは頂点のライティング後の色は、マテリアルの発光強度、マテリアルアンビエント反射率とライティングモデルのシーンアンビエント強度の積、および有効な各光源の寄与の合計となる。各光源はアンビエント・ディフューズ・スペキュラの
3
項の和を寄与する。アンビエント寄与はマテリアルと光源のアンビエント色の積、ディフューズ寄与はマテリアルと光源のディフューズ色に法線と光源方向の内積を乗じた値、スペキュラ寄与は半角ベクトルと法線の内積を
GL_SHININESS 乗した値で決まる。既定では両面ライティングは無効で、裏面ポリゴンも表面マテリアルで計算される。関連情報は
glGet (GL_LIGHT_MODEL_AMBIENT / LOCAL_VIEWER / TWO_SIDE) および
glIsEnabled (GL_LIGHTING) で取得できる。


%index
glLightModeliv
glLightModeliv 関数はライティングモデルパラメータを設定する。
%prm
pname, params
pname : [int] ライティングモデルパラメータ。単一値のライティングモデルパラメータ。GL_LIGHT_MODEL_LOCAL_VIEWER (0 でない場合は視点位置からスペキュラ反射角を計算し、そうでなければ視線を -z 方向平行とみなす。既定 0)、GL_LIGHT_MODEL_TWO_SIDE (0 でない場合は両面ライティングを有効化し、裏面ポリゴンは裏向きマテリアルで計算する。既定 0) を受け付ける。 さらに GL_LIGHT_MODEL_AMBIENT (シーン全体のアンビエント強度。既定 (0.2, 0.2, 0.2, 1.0)) を受け付ける。
params : [int] 
%inst
glLightModeliv 関数はライティングモデルパラメータを設定する。

[戻り値]
この関数は値を返さない。

[備考]
glLightModel* はライティングモデルのパラメータを設定する。pname はパラメータ名、param は新しい値である。RGBA
モードでは頂点のライティング後の色は、マテリアルの発光強度、マテリアルアンビエント反射率とライティングモデルのシーンアンビエント強度の積、および有効な各光源の寄与の合計となる。各光源はアンビエント・ディフューズ・スペキュラの
3
項の和を寄与する。アンビエント寄与はマテリアルと光源のアンビエント色の積、ディフューズ寄与はマテリアルと光源のディフューズ色に法線と光源方向の内積を乗じた値、スペキュラ寄与は半角ベクトルと法線の内積を
GL_SHININESS 乗した値で決まる。既定では両面ライティングは無効で、裏面ポリゴンも表面マテリアルで計算される。関連情報は
glGet (GL_LIGHT_MODEL_AMBIENT / LOCAL_VIEWER / TWO_SIDE) および
glIsEnabled (GL_LIGHTING) で取得できる。


%index
glLightf
glLightf 関数は光源パラメータ値を返す。
%prm
light, pname, param2
light : [int] 光源の識別子。可能な光源数は実装依存だが最低 8 個をサポート。GL_LIGHTi の形のシンボル名で識別され、i は 0 から GL_MAX_LIGHTS - 1 の値。
pname : [int] light の単一値光源パラメータ。GL_SPOT_EXPONENT (スポット指数、既定 0)、GL_SPOT_CUTOFF (スポット角 [0,90] または 180、既定 180)、GL_CONSTANT_ATTENUATION / GL_LINEAR_ATTENUATION / GL_QUADRATIC_ATTENUATION (距離減衰係数、既定 1/0/0) を受け付ける。
param2 : [float] 
%inst
glLightf 関数は光源パラメータ値を返す。

[戻り値]
この関数は値を返さない。


%index
glLightfv
glLightfv 関数は光源パラメータ値を返す。
%prm
light, pname, params
light : [int] 光源の識別子。可能な光源数は実装依存だが最低 8 個をサポート。GL_LIGHTi の形のシンボル名で識別され、i は 0 から GL_MAX_LIGHTS - 1 の値。
pname : [int] light の光源パラメータ。light の単一値光源パラメータ。GL_SPOT_EXPONENT (スポット指数、既定 0)、GL_SPOT_CUTOFF (スポット角 [0,90] または 180、既定 180)、GL_CONSTANT_ATTENUATION / GL_LINEAR_ATTENUATION / GL_QUADRATIC_ATTENUATION (距離減衰係数、既定 1/0/0) を受け付ける。 さらに GL_AMBIENT (アンビエント強度、既定 (0,0,0,1))、GL_DIFFUSE (ディフューズ強度、GL_LIGHT0 の既定 (1,1,1,1)、他は (0,0,0,1))、GL_SPECULAR (スペキュラ強度、GL_LIGHT0 の既定 (1,1,1,1)、他は (0,0,0,1))、GL_POSITION (位置。w=0 なら方向光、それ以外は位置光)、GL_SPOT_DIRECTION (スポット方向、既定 (0,0,-1)) を受け付ける。
params : [int] 
%inst
glLightfv 関数は光源パラメータ値を返す。

[戻り値]
この関数は値を返さない。


%index
glLighti
glLighti 関数は光源パラメータ値を返す。
%prm
light, pname, param2
light : [int] 光源の識別子。可能な光源数は実装依存だが最低 8 個をサポート。GL_LIGHTi の形のシンボル名で識別され、i は 0 から GL_MAX_LIGHTS - 1 の値。
pname : [int] light の単一値光源パラメータ。GL_SPOT_EXPONENT (スポット指数、既定 0)、GL_SPOT_CUTOFF (スポット角 [0,90] または 180、既定 180)、GL_CONSTANT_ATTENUATION / GL_LINEAR_ATTENUATION / GL_QUADRATIC_ATTENUATION (距離減衰係数、既定 1/0/0) を受け付ける。
param2 : [int] 
%inst
glLighti 関数は光源パラメータ値を返す。

[戻り値]
この関数は値を返さない。


%index
glLightiv
glLightiv 関数は光源パラメータ値を返す。
%prm
light, pname, params
light : [int] 光源の識別子。可能な光源数は実装依存だが最低 8 個をサポート。GL_LIGHTi の形のシンボル名で識別され、i は 0 から GL_MAX_LIGHTS - 1 の値。
pname : [int] light の光源パラメータ。light の単一値光源パラメータ。GL_SPOT_EXPONENT (スポット指数、既定 0)、GL_SPOT_CUTOFF (スポット角 [0,90] または 180、既定 180)、GL_CONSTANT_ATTENUATION / GL_LINEAR_ATTENUATION / GL_QUADRATIC_ATTENUATION (距離減衰係数、既定 1/0/0) を受け付ける。 さらに GL_AMBIENT (アンビエント強度、既定 (0,0,0,1))、GL_DIFFUSE (ディフューズ強度、GL_LIGHT0 の既定 (1,1,1,1)、他は (0,0,0,1))、GL_SPECULAR (スペキュラ強度、GL_LIGHT0 の既定 (1,1,1,1)、他は (0,0,0,1))、GL_POSITION (位置。w=0 なら方向光、それ以外は位置光)、GL_SPOT_DIRECTION (スポット方向、既定 (0,0,-1)) を受け付ける。
params : [int] 
%inst
glLightiv 関数は光源パラメータ値を返す。

[戻り値]
この関数は値を返さない。


%index
glLineStipple
glLineStipple 関数は線スティップルパターンを指定する。
%prm
factor, pattern
factor : [int] 線スティップルパターンの各ビットに対する乗数。factor が 3 なら、パターンの各ビットが次のビットに進む前に 3 回使われる。factor は [1, 256] にクランプされ、既定は 1。
pattern : [int] 線のラスタライズ時にどのフラグメントを描画するかを決定するビットパターンを表す 16 ビット整数。ビット 0 が最初に使われ、既定パターンは全 1。
%inst
glLineStipple 関数は線スティップルパターンを指定する。

[戻り値]
この関数は値を返さない。

[備考]
glLineStipple
は線スティップルパターンを指定する。線スティップリングはラスタライズで生成された特定フラグメントをマスクし、描画しない。マスクは 16
ビットパターン pattern、繰り返し数 factor、整数カウンタ s の 3 パラメータで行う。s は glBegin
呼び出し時および glBegin(GL_LINES)/glEnd 系列の各線分生成前に 0
にリセットされ、単位幅エイリアス線のフラグメント生成ごと、あるいはアンチエイリアス線の区間ごとに増分される。ビット (s/factor)
mod 16 が 0 のフラグメントは描画されない。スティップリングは glEnable/glDisable の
GL_LINE_STIPPLE で有効/無効を切り替える。既定は無効 (直線は常時描画)。関連情報は glGet
(GL_LINE_STIPPLE_PATTERN / GL_LINE_STIPPLE_REPEAT) および glIsEnabled
(GL_LINE_STIPPLE) で取得できる。


%index
glLineWidth
glLineWidth 関数はラスタライズされる線の幅を指定する。
%prm
width
width : [float] ラスタライズされる線の幅。既定は 1.0。
%inst
glLineWidth 関数はラスタライズされる線の幅を指定する。

[戻り値]
この関数は値を返さない。

[備考]
glLineWidth はエイリアスとアンチエイリアス両方のラスタライズ線幅を指定する。1.0
以外の線幅はアンチエイリアスの有無で効果が変わる。線アンチエイリアスは glEnable/glDisable の
GL_LINE_SMOOTH で制御する。無効時は、指定幅を最も近い整数に丸めた値が実際の幅となる (0 に丸められたら 1
として扱う)。有効時は指定幅そのものが使われ、最小 1.0 ピクセルから実装依存の最大幅まで対応する。幅は常に非負で、負値はエラー
GL_INVALID_VALUE を生成する。関連情報は glGet (GL_LINE_WIDTH /
GL_LINE_WIDTH_GRANULARITY / GL_LINE_WIDTH_RANGE) および glIsEnabled
(GL_LINE_SMOOTH) で取得できる。


%index
glListBase
glListBase 関数は glCallLists 用の表示リストベースを設定する。
%prm
base
base : [int] 
%inst
glListBase 関数は glCallLists 用の表示リストベースを設定する。

[戻り値]
この関数は値を返さない。

[備考]
glListBase はオフセットの配列を指定する。表示リスト名は各オフセットに base
を加算して生成される。有効な表示リストを参照する名前は実行され、それ以外は無視される。関連情報は glGet (GL_LIST_BASE)
で取得できる。


%index
glLoadIdentity
glLoadIdentity 関数は現在の行列を単位行列に置き換える。
%prm

%inst
glLoadIdentity 関数は現在の行列を単位行列に置き換える。

[戻り値]
この関数は引数を持たず、値を返さない。

[備考]
glLoadIdentity は現在の行列を単位行列に置き換える。意味的には単位行列を指定した glLoadMatrix
呼び出しと等価だが、実装によっては効率的である。関連情報は glGet (GL_MATRIX_MODE /
GL_MODELVIEW_MATRIX / GL_PROJECTION_MATRIX / GL_TEXTURE_MATRIX)
で取得できる。


%index
glLoadMatrixd
glLoadMatrixd 関数は現在の行列を任意行列に置き換える。| glLoadMatrixd 関数 (Gl.h)
%prm
m
m : [var] 列優先順で連続 16 個の値として格納された 4x4 行列へのポインタ。
%inst
glLoadMatrixd 関数は現在の行列を任意行列に置き換える。| glLoadMatrixd 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glLoadMatrix は現在の行列を m
で指定した行列に置き換える。現在の行列はプロジェクション行列・モデルビュー行列・テクスチャ行列のいずれかで、現在の行列モード
(glMatrixMode 参照) で決まる。m は列優先順 (column-major order) で格納された 4x4
の単精度または倍精度浮動小数点行列を指す。関連情報は glGet (GL_MATRIX_MODE /
GL_MODELVIEW_MATRIX / GL_PROJECTION_MATRIX / GL_TEXTURE_MATRIX)
で取得できる。


%index
glLoadMatrixf
glLoadMatrixf 関数は現在の行列を任意行列に置き換える。| glLoadMatrixf 関数 (Gl.h)
%prm
m
m : [var] 列優先順で連続 16 個の値として格納された 4x4 行列へのポインタ。
%inst
glLoadMatrixf 関数は現在の行列を任意行列に置き換える。| glLoadMatrixf 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glLoadMatrix は現在の行列を m
で指定した行列に置き換える。現在の行列はプロジェクション行列・モデルビュー行列・テクスチャ行列のいずれかで、現在の行列モード
(glMatrixMode 参照) で決まる。m は列優先順 (column-major order) で格納された 4x4
の単精度または倍精度浮動小数点行列を指す。関連情報は glGet (GL_MATRIX_MODE /
GL_MODELVIEW_MATRIX / GL_PROJECTION_MATRIX / GL_TEXTURE_MATRIX)
で取得できる。


%index
glLoadName
glLoadName 関数はネームスタックに名前を読み込む。
%prm
name
name : [int] ネームスタック最上段の値を置き換える名前。
%inst
glLoadName 関数はネームスタックに名前を読み込む。

[戻り値]
この関数は値を返さない。

[備考]
glLoadName は当初空のネームスタックの最上段の値を name
で置き換える。ネームスタックはセレクションモード中にレンダリングコマンド群を一意に識別するための順序付き符号なし整数集合。レンダーモードが
GL_SELECT でない間は常に空で、このとき glLoadName は無視される。関連情報は glGet
(GL_NAME_STACK_DEPTH / GL_MAX_NAME_STACK_DEPTH) および glRenderMode
で取得できる。


%index
glLogicOp
glLogicOp 関数はカラーインデックス描画用の論理的ピクセル演算を指定する。
%prm
opcode
opcode : [int] 論理演算を選択するシンボル定数。s をソースビット、d を宛先ビットとして次を受け付ける: GL_CLEAR (0)、GL_SET (1)、GL_COPY (s)、GL_COPY_INVERTED (~s)、GL_NOOP (d)、GL_INVERT (~d)、GL_AND (s & d)、GL_NAND (~(s & d))、GL_OR (s | d)、GL_NOR (~(s | d))、GL_XOR (s ^ d)、GL_EQUIV (~(s ^ d))、GL_AND_REVERSE (s & ~d)、GL_AND_INVERTED (~s & d)、GL_OR_REVERSE (s | ~d)、GL_OR_INVERTED (~s | d)。
%inst
glLogicOp 関数はカラーインデックス描画用の論理的ピクセル演算を指定する。

[戻り値]
この関数は値を返さない。

[備考]
glLogicOp
は、有効化時に入力カラーインデックスとフレームバッファの対応位置のカラーインデックスとの間に適用される論理演算を指定する。論理演算は
glEnable/glDisable に GL_LOGIC_OP を渡して有効/無効を切り替える。opcode
は下記のシンボル定数から選ぶ。s は入力カラーインデックス、d はフレームバッファのインデックス。C
言語の演算子と同じ記法で、ビットごとに同じ演算が実行される。論理演算は RGBA モードでは無視される
(GL_COLOR_LOGIC_OP が OpenGL 1.1 以降で定義される)。関連情報は glGet
(GL_LOGIC_OP_MODE) および glIsEnabled (GL_LOGIC_OP) で取得できる。


%index
glMap1d
glMap1d 関数は 1 次元エバリュエータを定義する。| glMap1d 関数 (Gl.h)
%prm
target, u1, u2, stride, order, points
target : [int] エバリュエータが生成する値の種類。シンボル定数。target は points にどの種類の制御点が与えられ、マップ評価時にどの種類の出力が生成されるかを示す。9 つの定義済み値を取りうる: GL_MAP1_VERTEX_3 / GL_MAP1_VERTEX_4 (x,y,z (,w) の頂点座標)、GL_MAP1_INDEX (カラーインデックス)、GL_MAP1_COLOR_4 (R,G,B,A)、GL_MAP1_NORMAL (法線ベクトル)、GL_MAP1_TEXTURE_COORD_1..4 (s [,t [,r [,q]]] テクスチャ座標)。
u1 : [double] glEvalCoord1 に渡される u から、このコマンドで指定される方程式が評価する変数 u^ への線形マッピング。
u2 : [double] glEvalCoord1 に渡される u から、このコマンドで指定される方程式が評価する変数 u^ への線形マッピング。
stride : [int] points が参照するデータ構造内で、ある制御点の先頭から次の制御点の先頭までにある float または double の個数。これにより任意のデータ構造に制御点を埋め込める。制約は、1 つの制御点の値が連続したメモリ位置を占めなければならない点のみ。
order : [int] 制御点の数。正でなければならない。
points : [var] 制御点の配列へのポインタ。
%inst
glMap1d 関数は 1 次元エバリュエータを定義する。| glMap1d 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
エバリュエータは多項式または有理多項式マッピングを用いて頂点・法線・テクスチャ座標・カラーを生成する手段を提供する。評価結果は通常の
glVertex / glNormal / glTexCoord / glColor
を用いた場合と同じ後続ステージへ送られるが、現在の法線・テクスチャ座標・カラーを更新しない点が異なる。次数 1 から
GL_MAX_EVAL_ORDER までの多項式 / 有理多項式スプラインを定義でき、内部でバーンスタイン多項式表現を用いる。target
は生成値の種類と制御点の意味を指定し、u1/u2 は u のマッピング、order は制御点の個数、stride
は制御点間の浮動小数点数、points は制御点配列へのポインタ。エバリュエータを有効化するには glEnable に target
を渡す。値を評価するには glEvalCoord1 を使う。関連情報は glGet
(GL_MAX_EVAL_ORDER)、glGetMap、glIsEnabled で取得できる。


%index
glMap1f
glMap1f 関数は 1 次元エバリュエータを定義する。| glMap1f 関数 (Gl.h)
%prm
target, u1, u2, stride, order, points
target : [int] エバリュエータが生成する値の種類。シンボル定数。target は points にどの種類の制御点が与えられ、マップ評価時にどの種類の出力が生成されるかを示す。9 つの定義済み値を取りうる: GL_MAP1_VERTEX_3 / GL_MAP1_VERTEX_4 (x,y,z (,w) の頂点座標)、GL_MAP1_INDEX (カラーインデックス)、GL_MAP1_COLOR_4 (R,G,B,A)、GL_MAP1_NORMAL (法線ベクトル)、GL_MAP1_TEXTURE_COORD_1..4 (s [,t [,r [,q]]] テクスチャ座標)。
u1 : [float] glEvalCoord1 に渡される u から、このコマンドで指定される方程式が評価する変数 u^ への線形マッピング。
u2 : [float] glEvalCoord1 に渡される u から、このコマンドで指定される方程式が評価する変数 u^ への線形マッピング。
stride : [int] points が参照するデータ構造内で、ある制御点の先頭から次の制御点の先頭までにある float または double の個数。これにより任意のデータ構造に制御点を埋め込める。制約は、1 つの制御点の値が連続したメモリ位置を占めなければならない点のみ。
order : [int] 制御点の数。正でなければならない。
points : [var] 制御点の配列へのポインタ。
%inst
glMap1f 関数は 1 次元エバリュエータを定義する。| glMap1f 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
エバリュエータは多項式または有理多項式マッピングを用いて頂点・法線・テクスチャ座標・カラーを生成する手段を提供する。評価結果は通常の
glVertex / glNormal / glTexCoord / glColor
を用いた場合と同じ後続ステージへ送られるが、現在の法線・テクスチャ座標・カラーを更新しない点が異なる。次数 1 から
GL_MAX_EVAL_ORDER までの多項式 / 有理多項式スプラインを定義でき、内部でバーンスタイン多項式表現を用いる。target
は生成値の種類と制御点の意味を指定し、u1/u2 は u のマッピング、order は制御点の個数、stride
は制御点間の浮動小数点数、points は制御点配列へのポインタ。エバリュエータを有効化するには glEnable に target
を渡す。値を評価するには glEvalCoord1 を使う。関連情報は glGet
(GL_MAX_EVAL_ORDER)、glGetMap、glIsEnabled で取得できる。


%index
glMap2d
glMap2d 関数は 2 次元エバリュエータを定義する。| glMap2d 関数 (Gl.h)
%prm
target, u1, u2, ustride, uorder, v1, v2, vstride, vorder, points
target : [int] エバリュエータが生成する値の種類。次のシンボル定数を受け付ける: GL_MAP2_VERTEX_3 / GL_MAP2_VERTEX_4、GL_MAP2_INDEX、GL_MAP2_COLOR_4、GL_MAP2_NORMAL、GL_MAP2_TEXTURE_COORD_1..4。意味は glMap1 の対応定数と同じ。
u1 : [double] glEvalCoord2 に渡される u から、このコマンドで指定される方程式が評価する 2 変数のうちの u^ への線形マッピング。
u2 : [double] glEvalCoord2 に渡される u から、このコマンドで指定される方程式が評価する 2 変数のうちの u^ への線形マッピング。
ustride : [int] 制御点 R_ij の先頭から R_(i+1)j の先頭までの float/double の個数 (i, j はそれぞれ u, v のインデックス)。任意のデータ構造に制御点を埋め込める。制約は 1 つの制御点の値が連続したメモリ位置を占めなければならない点のみ。
uorder : [int] u 軸方向の制御点配列の次元。正でなければならない。
v1 : [double] glEvalCoord2 に渡される v から、このコマンドで指定される方程式が評価する 2 変数のうちの v^ への線形マッピング。
v2 : [double] glEvalCoord2 に渡される v から、このコマンドで指定される方程式が評価する 2 変数のうちの v^ への線形マッピング。
vstride : [int] 制御点 R_ij の先頭から R_i(j+1) の先頭までの float/double の個数 (i, j はそれぞれ u, v のインデックス)。任意のデータ構造に制御点を埋め込める。制約は 1 つの制御点の値が連続したメモリ位置を占めなければならない点のみ。
vorder : [int] v 軸方向の制御点配列の次元。正でなければならない。
points : [var] 制御点の配列へのポインタ。
%inst
glMap2d 関数は 2 次元エバリュエータを定義する。| glMap2d 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
エバリュエータは多項式または有理多項式マッピングを用いて 2 変数 u, v
で頂点・法線・テクスチャ座標・カラーを生成する手段を提供する。生成値は通常の glVertex / glNormal /
glTexCoord / glColor を用いた場合と同じ後続ステージへ送られるが、現在の法線・テクスチャ座標・カラーを更新しない。次数
1 から GL_MAX_EVAL_ORDER までの多項式 /
有理多項式スプラインを定義でき、内部でバーンスタイン多項式表現を用いる。target は生成値の種類と制御点の意味、u1/u2/v1/v2
は u, v のマッピング、uorder/vorder は u, v 軸の制御点数、ustride/vstride
は制御点間の浮動小数点数、points は 2 次元配列の先頭へのポインタ。エバリュエータを有効化するには glEnable に
target を渡し、値を評価するには glEvalCoord2 を使う。


%index
glMap2f
glMap2f 関数は 2 次元エバリュエータを定義する。| glMap2f 関数 (Gl.h)
%prm
target, u1, u2, ustride, uorder, v1, v2, vstride, vorder, points
target : [int] エバリュエータが生成する値の種類。次のシンボル定数を受け付ける: GL_MAP2_VERTEX_3 / GL_MAP2_VERTEX_4、GL_MAP2_INDEX、GL_MAP2_COLOR_4、GL_MAP2_NORMAL、GL_MAP2_TEXTURE_COORD_1..4。意味は glMap1 の対応定数と同じ。
u1 : [float] glEvalCoord2 に渡される u から、このコマンドで指定される方程式が評価する 2 変数のうちの u^ への線形マッピング。
u2 : [float] glEvalCoord2 に渡される u から、このコマンドで指定される方程式が評価する 2 変数のうちの u^ への線形マッピング。
ustride : [int] 制御点 R_ij の先頭から R_(i+1)j の先頭までの float/double の個数 (i, j はそれぞれ u, v のインデックス)。任意のデータ構造に制御点を埋め込める。制約は 1 つの制御点の値が連続したメモリ位置を占めなければならない点のみ。
uorder : [int] u 軸方向の制御点配列の次元。正でなければならない。
v1 : [float] glEvalCoord2 に渡される v から、このコマンドで指定される方程式が評価する 2 変数のうちの v^ への線形マッピング。
v2 : [float] glEvalCoord2 に渡される v から、このコマンドで指定される方程式が評価する 2 変数のうちの v^ への線形マッピング。
vstride : [int] 制御点 R_ij の先頭から R_i(j+1) の先頭までの float/double の個数 (i, j はそれぞれ u, v のインデックス)。任意のデータ構造に制御点を埋め込める。制約は 1 つの制御点の値が連続したメモリ位置を占めなければならない点のみ。
vorder : [int] v 軸方向の制御点配列の次元。正でなければならない。
points : [var] 制御点の配列へのポインタ。
%inst
glMap2f 関数は 2 次元エバリュエータを定義する。| glMap2f 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
エバリュエータは多項式または有理多項式マッピングを用いて 2 変数 u, v
で頂点・法線・テクスチャ座標・カラーを生成する手段を提供する。生成値は通常の glVertex / glNormal /
glTexCoord / glColor を用いた場合と同じ後続ステージへ送られるが、現在の法線・テクスチャ座標・カラーを更新しない。次数
1 から GL_MAX_EVAL_ORDER までの多項式 /
有理多項式スプラインを定義でき、内部でバーンスタイン多項式表現を用いる。target は生成値の種類と制御点の意味、u1/u2/v1/v2
は u, v のマッピング、uorder/vorder は u, v 軸の制御点数、ustride/vstride
は制御点間の浮動小数点数、points は 2 次元配列の先頭へのポインタ。エバリュエータを有効化するには glEnable に
target を渡し、値を評価するには glEvalCoord2 を使う。


%index
glMapGrid1d
1 次元メッシュを定義する。| glMapGrid1d 関数 (Gl.h)
%prm
un, u1, u2
un : [int] グリッド範囲 [u1, u2] の分割数。正でなければならない。
u1 : [double] 整数グリッドドメイン値 i = 0 に対するマッピングとして使われる値。
u2 : [double] 整数グリッドドメイン値 i = un に対するマッピングとして使われる値。
%inst
1 次元メッシュを定義する。| glMapGrid1d 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glMapGrid と glEvalMesh
は、等間隔のマップドメイン値群を効率的に生成・評価するために組み合わせて使う。glEvalMesh は 1 次元または 2
次元グリッドの整数ドメインを走査し、値域は glMap1 / glMap2 で指定した評価マップのドメインとなる。glMapGrid1 と
glMapGrid2 は整数グリッド座標 i (または i, j) と浮動小数点評価マップ座標 u (または u, v)
との間の線形グリッドマッピングを指定する。glMapGrid1 は整数 i=0 を u1、i=un を u2 にマップし、[u1, u2]
区間を un 個の等分割に分ける。関連情報は glGet (GL_MAP1_GRID_DOMAIN /
GL_MAP1_GRID_SEGMENTS)、glMap1、glMap2、glEvalMesh で取得できる。


%index
glMapGrid1f
1 次元メッシュを定義する。| glMapGrid1f 関数 (Gl.h)
%prm
un, u1, u2
un : [int] グリッド範囲 [u1, u2] の分割数。正でなければならない。
u1 : [float] 整数グリッドドメイン値 i = 0 に対するマッピングとして使われる値。
u2 : [float] 整数グリッドドメイン値 i = un に対するマッピングとして使われる値。
%inst
1 次元メッシュを定義する。| glMapGrid1f 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glMapGrid と glEvalMesh
は、等間隔のマップドメイン値群を効率的に生成・評価するために組み合わせて使う。glEvalMesh は 1 次元または 2
次元グリッドの整数ドメインを走査し、値域は glMap1 / glMap2 で指定した評価マップのドメインとなる。glMapGrid1 と
glMapGrid2 は整数グリッド座標 i (または i, j) と浮動小数点評価マップ座標 u (または u, v)
との間の線形グリッドマッピングを指定する。glMapGrid1 は整数 i=0 を u1、i=un を u2 にマップし、[u1, u2]
区間を un 個の等分割に分ける。関連情報は glGet (GL_MAP1_GRID_DOMAIN /
GL_MAP1_GRID_SEGMENTS)、glMap1、glMap2、glEvalMesh で取得できる。


%index
glMapGrid2d
1 次元メッシュを定義する。| glMapGrid2d 関数 (Gl.h)
%prm
un, u1, u2, vn, v1, v2
un : [int] グリッド範囲 [u1, u2] の分割数。正でなければならない。
u1 : [double] 整数グリッドドメイン値 i = 0 に対するマッピングとして使われる値。
u2 : [double] 整数グリッドドメイン値 i = un に対するマッピングとして使われる値。
vn : [int] グリッド範囲 [v1, v2] の分割数。
v1 : [double] 整数グリッドドメイン値 j = 0 に対するマッピングとして使われる値。
v2 : [double] 整数グリッドドメイン値 j = vn に対するマッピングとして使われる値。
%inst
1 次元メッシュを定義する。| glMapGrid2d 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glMapGrid と glEvalMesh
は、等間隔のマップドメイン値群を効率的に生成・評価するために組み合わせて使う。glMapGrid2 は u 方向と v 方向の 2
軸について、整数グリッド座標 (i, j) を浮動小数点評価マップ座標 (u, v) に線形マッピングする。i=0 → u1、i=un →
u2、j=0 → v1、j=vn → v2。関連情報は glGet (GL_MAP2_GRID_DOMAIN /
GL_MAP2_GRID_SEGMENTS)、glMap1、glMap2、glEvalMesh で取得できる。


%index
glMapGrid2f
1 次元メッシュを定義する。| glMapGrid2f 関数 (Gl.h)
%prm
un, u1, u2, vn, v1, v2
un : [int] グリッド範囲 [u1, u2] の分割数。正でなければならない。
u1 : [float] 整数グリッドドメイン値 i = 0 に対するマッピングとして使われる値。
u2 : [float] 整数グリッドドメイン値 i = un に対するマッピングとして使われる値。
vn : [int] グリッド範囲 [v1, v2] の分割数。
v1 : [float] 整数グリッドドメイン値 j = 0 に対するマッピングとして使われる値。
v2 : [float] 整数グリッドドメイン値 j = vn に対するマッピングとして使われる値。
%inst
1 次元メッシュを定義する。| glMapGrid2f 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glMapGrid と glEvalMesh
は、等間隔のマップドメイン値群を効率的に生成・評価するために組み合わせて使う。glMapGrid2 は u 方向と v 方向の 2
軸について、整数グリッド座標 (i, j) を浮動小数点評価マップ座標 (u, v) に線形マッピングする。i=0 → u1、i=un →
u2、j=0 → v1、j=vn → v2。関連情報は glGet (GL_MAP2_GRID_DOMAIN /
GL_MAP2_GRID_SEGMENTS)、glMap1、glMap2、glEvalMesh で取得できる。


%index
glMaterialf
glMaterialf 関数はライティングモデル用のマテリアルパラメータを指定する。
%prm
face, pname, param2
face : [int] 更新するフェース。GL_FRONT、GL_BACK、GL_FRONT_AND_BACK のいずれかでなければならない。
pname : [int] 更新するフェースの単一値マテリアルパラメータ。GL_SHININESS でなければならない。値 [0, 128] のスペキュラ指数を指定する (既定 0)。
param2 : [float] 
%inst
glMaterialf 関数はライティングモデル用のマテリアルパラメータを指定する。

[戻り値]
この関数は値を返さない。

[備考]
glMaterial* はマテリアルパラメータに値を割り当てる。マテリアルパラメータには対応する 2 組のセットがあり、1 つは前面
(front-facing)
用で、点・線・ビットマップや両面ライティング無効時の全ポリゴン、または有効時の前面ポリゴンの陰影付けに使われる。もう 1 つは背面
(back-facing) 用で、両面ライティング有効時の背面ポリゴンのみに使われる。片面・両面ライティング計算の詳細は
glLightModel を参照。glMaterial* は 3 つの引数を取る。face は更新対象フェース、pname
はパラメータ名、最後の引数は新しい値。関連情報は glGet (GL_MATERIAL / GL_COLOR_MATERIAL_*)
および glIsEnabled (GL_LIGHTING / GL_COLOR_MATERIAL) で取得できる。


%index
glMaterialfv
glMaterialfv 関数はライティングモデル用のマテリアルパラメータを指定する。
%prm
face, pname, params
face : [int] 更新するフェース。GL_FRONT、GL_BACK、GL_FRONT_AND_BACK のいずれかでなければならない。
pname : [int] 更新するフェースのマテリアルパラメータ。GL_AMBIENT (アンビエント反射、既定 (0.2, 0.2, 0.2, 1.0))、GL_DIFFUSE (ディフューズ反射、既定 (0.8, 0.8, 0.8, 1.0))、GL_SPECULAR (スペキュラ反射、既定 (0, 0, 0, 1.0))、GL_EMISSION (発光色、既定 (0, 0, 0, 1.0))、GL_SHININESS (スペキュラ指数 [0, 128]、既定 0)、GL_AMBIENT_AND_DIFFUSE (アンビエントとディフューズに同じ値を設定)、GL_COLOR_INDEXES (カラーインデックスモードのアンビエント/ディフューズ/スペキュラ指数) を受け付ける。
params : [int] 
%inst
glMaterialfv 関数はライティングモデル用のマテリアルパラメータを指定する。

[戻り値]
この関数は値を返さない。

[備考]
glMaterial* はマテリアルパラメータに値を割り当てる。マテリアルパラメータには対応する 2 組のセットがあり、1 つは前面
(front-facing)
用で、点・線・ビットマップや両面ライティング無効時の全ポリゴン、または有効時の前面ポリゴンの陰影付けに使われる。もう 1 つは背面
(back-facing) 用で、両面ライティング有効時の背面ポリゴンのみに使われる。片面・両面ライティング計算の詳細は
glLightModel を参照。glMaterial* は 3 つの引数を取る。face は更新対象フェース、pname
はパラメータ名、最後の引数は新しい値。関連情報は glGet (GL_MATERIAL / GL_COLOR_MATERIAL_*)
および glIsEnabled (GL_LIGHTING / GL_COLOR_MATERIAL) で取得できる。


%index
glMateriali
glMateriali 関数はライティングモデル用のマテリアルパラメータを指定する。
%prm
face, pname, param2
face : [int] 更新するフェース。GL_FRONT、GL_BACK、GL_FRONT_AND_BACK のいずれかでなければならない。
pname : [int] 更新するフェースの単一値マテリアルパラメータ。GL_SHININESS でなければならない。値 [0, 128] のスペキュラ指数を指定する (既定 0)。
param2 : [int] 
%inst
glMateriali 関数はライティングモデル用のマテリアルパラメータを指定する。

[戻り値]
この関数は値を返さない。

[備考]
glMaterial* はマテリアルパラメータに値を割り当てる。マテリアルパラメータには対応する 2 組のセットがあり、1 つは前面
(front-facing)
用で、点・線・ビットマップや両面ライティング無効時の全ポリゴン、または有効時の前面ポリゴンの陰影付けに使われる。もう 1 つは背面
(back-facing) 用で、両面ライティング有効時の背面ポリゴンのみに使われる。片面・両面ライティング計算の詳細は
glLightModel を参照。glMaterial* は 3 つの引数を取る。face は更新対象フェース、pname
はパラメータ名、最後の引数は新しい値。関連情報は glGet (GL_MATERIAL / GL_COLOR_MATERIAL_*)
および glIsEnabled (GL_LIGHTING / GL_COLOR_MATERIAL) で取得できる。


%index
glMaterialiv
glMaterialiv 関数はライティングモデル用のマテリアルパラメータを指定する。
%prm
face, pname, params
face : [int] 更新するフェース。GL_FRONT、GL_BACK、GL_FRONT_AND_BACK のいずれかでなければならない。
pname : [int] 更新するフェースのマテリアルパラメータ。GL_AMBIENT (アンビエント反射、既定 (0.2, 0.2, 0.2, 1.0))、GL_DIFFUSE (ディフューズ反射、既定 (0.8, 0.8, 0.8, 1.0))、GL_SPECULAR (スペキュラ反射、既定 (0, 0, 0, 1.0))、GL_EMISSION (発光色、既定 (0, 0, 0, 1.0))、GL_SHININESS (スペキュラ指数 [0, 128]、既定 0)、GL_AMBIENT_AND_DIFFUSE (アンビエントとディフューズに同じ値を設定)、GL_COLOR_INDEXES (カラーインデックスモードのアンビエント/ディフューズ/スペキュラ指数) を受け付ける。
params : [int] 
%inst
glMaterialiv 関数はライティングモデル用のマテリアルパラメータを指定する。

[戻り値]
この関数は値を返さない。

[備考]
glMaterial* はマテリアルパラメータに値を割り当てる。マテリアルパラメータには対応する 2 組のセットがあり、1 つは前面
(front-facing)
用で、点・線・ビットマップや両面ライティング無効時の全ポリゴン、または有効時の前面ポリゴンの陰影付けに使われる。もう 1 つは背面
(back-facing) 用で、両面ライティング有効時の背面ポリゴンのみに使われる。片面・両面ライティング計算の詳細は
glLightModel を参照。glMaterial* は 3 つの引数を取る。face は更新対象フェース、pname
はパラメータ名、最後の引数は新しい値。関連情報は glGet (GL_MATERIAL / GL_COLOR_MATERIAL_*)
および glIsEnabled (GL_LIGHTING / GL_COLOR_MATERIAL) で取得できる。


%index
glMatrixMode
glMatrixMode 関数はどの行列が現在の行列かを指定する。
%prm
mode
mode : [int] 後続の行列演算の対象となる行列スタック。mode は次の 3 つの値のいずれかを取る。GL_MODELVIEW: 後続の行列演算をモデルビュー行列スタックに適用する。GL_PROJECTION: 後続の行列演算をプロジェクション行列スタックに適用する。GL_TEXTURE: 後続の行列演算をテクスチャ行列スタックに適用する。
%inst
glMatrixMode 関数はどの行列が現在の行列かを指定する。

[戻り値]
この関数は値を返さない。

[備考]
glMatrixMode は現在の行列モードを設定する。関連情報は glGet (GL_MATRIX_MODE) で取得できる。


%index
glMultMatrixd
glMultMatrixd 関数は現在の行列に任意行列を乗算する。| glMultMatrixd 関数 (Gl.h)
%prm
m
m : [var] 列優先順で連続 16 個の値として格納された 4x4 行列へのポインタ。
%inst
glMultMatrixd 関数は現在の行列に任意行列を乗算する。| glMultMatrixd 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glMultMatrix は現在の行列と m で指定した行列の積で現在の行列を置き換える。すなわち M を現在の行列、T
を渡された行列とすると、M は M × T に置き換わる。現在の行列は現在の行列モード (glMatrixMode 参照)
で決まるプロジェクション・モデルビュー・テクスチャ行列のいずれか。m は列優先順で格納された 4x4
の単精度または倍精度浮動小数点行列を指す。OpenGL で多くの行列演算は列ベクトル (ポスト乗算) 表現を使うため、M × T
による変換は T を先に適用した後 M を適用するのと等価となる。関連情報は glGet (GL_MATRIX_MODE /
GL_MODELVIEW_MATRIX / GL_PROJECTION_MATRIX / GL_TEXTURE_MATRIX)
で取得できる。


%index
glMultMatrixf
glMultMatrixf 関数は現在の行列に任意行列を乗算する。| glMultMatrixf 関数 (Gl.h)
%prm
m
m : [var] 列優先順で連続 16 個の値として格納された 4x4 行列へのポインタ。
%inst
glMultMatrixf 関数は現在の行列に任意行列を乗算する。| glMultMatrixf 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glMultMatrix は現在の行列と m で指定した行列の積で現在の行列を置き換える。すなわち M を現在の行列、T
を渡された行列とすると、M は M × T に置き換わる。現在の行列は現在の行列モード (glMatrixMode 参照)
で決まるプロジェクション・モデルビュー・テクスチャ行列のいずれか。m は列優先順で格納された 4x4
の単精度または倍精度浮動小数点行列を指す。OpenGL で多くの行列演算は列ベクトル (ポスト乗算) 表現を使うため、M × T
による変換は T を先に適用した後 M を適用するのと等価となる。関連情報は glGet (GL_MATRIX_MODE /
GL_MODELVIEW_MATRIX / GL_PROJECTION_MATRIX / GL_TEXTURE_MATRIX)
で取得できる。


%index
glNewList
glNewList と glEndList 関数は表示リストを作成または置き換える。| glNewList 関数 (Gl.h)
%prm
list, mode
list : [int] 表示リスト名。
mode : [int] コンパイルモード。GL_COMPILE (コマンドを表示リストに単純にコンパイルする) と GL_COMPILE_AND_EXECUTE (コマンドを実行しつつ表示リストにコンパイルする) を受け付ける。
%inst
glNewList と glEndList 関数は表示リストを作成または置き換える。| glNewList 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
表示リストは後続実行用に保存された OpenGL コマンド群である。glNewList で作成する。以降のコマンドは glEndList
が呼ばれるまで発行順に表示リストに格納される。glNewList は 2 つの引数を取る。第 1 引数 list
は表示リストの一意名となる正整数で、glGenLists で生成・予約でき、glIsList で一意性を検査できる。第 2 引数 mode
は GL_COMPILE か GL_COMPILE_AND_EXECUTE のシンボル定数。GL_COMPILE
は表示リストに関数を格納するだけで描画はせず、GL_COMPILE_AND_EXECUTE
では格納と同時に実行される。表示リストに含められない関数もあり、それらが表示リスト作成中に呼ばれると即座に実行されて無視される。glNewList
呼び出し中にエラーが発生すると、その呼び出しは無視されるが表示リストは作成される。glEndList で終了し、glCallList /
glCallLists で実行する。関連情報は glGet / glGenLists / glIsList で取得できる。


%index
glNormal3b
現在の法線ベクトルを設定する。| glNormal3b 関数 (Gl.h)
%prm
nx, ny, nz
nx : [int] 新しい現在法線ベクトルの x 座標を指定する。
ny : [int] 新しい現在法線ベクトルの y 座標を指定する。
nz : [int] 新しい現在法線ベクトルの z 座標を指定する。
%inst
現在の法線ベクトルを設定する。| glNormal3b 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glNormal3* を呼ぶと、現在の法線が与えられた座標に設定される。バイト・ショート・整数引数は、最大正整数値を
1.0、最小負整数値を -1.0
にマップする線形変換により浮動小数点形式に変換される。指定された法線は単位長である必要はない。正規化が有効なら変換後に正規化される。正規化は
glEnable / glDisable の GL_NORMALIZE で制御する。関連情報は glGet
(GL_CURRENT_NORMAL) および glIsEnabled (GL_NORMALIZE) で取得できる。


%index
glNormal3bv
現在の法線ベクトルを設定する。| glNormal3bv 関数 (Gl.h)
%prm
v
v : [var] 新しい現在法線の x, y, z 座標からなる 3 要素配列へのポインタ。
%inst
現在の法線ベクトルを設定する。| glNormal3bv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glNormal3* を呼ぶと、現在の法線が与えられた座標に設定される。バイト・ショート・整数引数は、最大正整数値を
1.0、最小負整数値を -1.0
にマップする線形変換により浮動小数点形式に変換される。指定された法線は単位長である必要はない。正規化が有効なら変換後に正規化される。正規化は
glEnable / glDisable の GL_NORMALIZE で制御する。関連情報は glGet
(GL_CURRENT_NORMAL) および glIsEnabled (GL_NORMALIZE) で取得できる。


%index
glNormal3d
現在の法線ベクトルを設定する。| glNormal3d 関数 (Gl.h)
%prm
nx, ny, nz
nx : [double] 新しい現在法線ベクトルの x 座標を指定する。
ny : [double] 新しい現在法線ベクトルの y 座標を指定する。
nz : [double] 新しい現在法線ベクトルの z 座標を指定する。
%inst
現在の法線ベクトルを設定する。| glNormal3d 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glNormal3* を呼ぶと、現在の法線が与えられた座標に設定される。バイト・ショート・整数引数は、最大正整数値を
1.0、最小負整数値を -1.0
にマップする線形変換により浮動小数点形式に変換される。指定された法線は単位長である必要はない。正規化が有効なら変換後に正規化される。正規化は
glEnable / glDisable の GL_NORMALIZE で制御する。関連情報は glGet
(GL_CURRENT_NORMAL) および glIsEnabled (GL_NORMALIZE) で取得できる。


%index
glNormal3dv
現在の法線ベクトルを設定する。| glNormal3dv 関数 (Gl.h)
%prm
v
v : [var] 新しい現在法線の x, y, z 座標からなる 3 要素配列へのポインタ。
%inst
現在の法線ベクトルを設定する。| glNormal3dv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glNormal3* を呼ぶと、現在の法線が与えられた座標に設定される。バイト・ショート・整数引数は、最大正整数値を
1.0、最小負整数値を -1.0
にマップする線形変換により浮動小数点形式に変換される。指定された法線は単位長である必要はない。正規化が有効なら変換後に正規化される。正規化は
glEnable / glDisable の GL_NORMALIZE で制御する。関連情報は glGet
(GL_CURRENT_NORMAL) および glIsEnabled (GL_NORMALIZE) で取得できる。


%index
glNormal3f
現在の法線ベクトルを設定する。| glNormal3f 関数 (Gl.h)
%prm
nx, ny, nz
nx : [float] 新しい現在法線ベクトルの x 座標を指定する。
ny : [float] 新しい現在法線ベクトルの y 座標を指定する。
nz : [float] 新しい現在法線ベクトルの z 座標を指定する。
%inst
現在の法線ベクトルを設定する。| glNormal3f 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glNormal3* を呼ぶと、現在の法線が与えられた座標に設定される。バイト・ショート・整数引数は、最大正整数値を
1.0、最小負整数値を -1.0
にマップする線形変換により浮動小数点形式に変換される。指定された法線は単位長である必要はない。正規化が有効なら変換後に正規化される。正規化は
glEnable / glDisable の GL_NORMALIZE で制御する。関連情報は glGet
(GL_CURRENT_NORMAL) および glIsEnabled (GL_NORMALIZE) で取得できる。


%index
glNormal3fv
現在の法線ベクトルを設定する。| glNormal3fv 関数 (Gl.h)
%prm
v
v : [var] 新しい現在法線の x, y, z 座標からなる 3 要素配列へのポインタ。
%inst
現在の法線ベクトルを設定する。| glNormal3fv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glNormal3* を呼ぶと、現在の法線が与えられた座標に設定される。バイト・ショート・整数引数は、最大正整数値を
1.0、最小負整数値を -1.0
にマップする線形変換により浮動小数点形式に変換される。指定された法線は単位長である必要はない。正規化が有効なら変換後に正規化される。正規化は
glEnable / glDisable の GL_NORMALIZE で制御する。関連情報は glGet
(GL_CURRENT_NORMAL) および glIsEnabled (GL_NORMALIZE) で取得できる。


%index
glNormal3i
現在の法線ベクトルを設定する。| glNormal3i 関数 (Gl.h)
%prm
nx, ny, nz
nx : [int] 新しい現在法線ベクトルの x 座標を指定する。
ny : [int] 新しい現在法線ベクトルの y 座標を指定する。
nz : [int] 新しい現在法線ベクトルの z 座標を指定する。
%inst
現在の法線ベクトルを設定する。| glNormal3i 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glNormal3* を呼ぶと、現在の法線が与えられた座標に設定される。バイト・ショート・整数引数は、最大正整数値を
1.0、最小負整数値を -1.0
にマップする線形変換により浮動小数点形式に変換される。指定された法線は単位長である必要はない。正規化が有効なら変換後に正規化される。正規化は
glEnable / glDisable の GL_NORMALIZE で制御する。関連情報は glGet
(GL_CURRENT_NORMAL) および glIsEnabled (GL_NORMALIZE) で取得できる。


%index
glNormal3iv
現在の法線ベクトルを設定する。| glNormal3iv 関数 (Gl.h)
%prm
v
v : [var] 新しい現在法線の x, y, z 座標からなる 3 要素配列へのポインタ。
%inst
現在の法線ベクトルを設定する。| glNormal3iv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glNormal3* を呼ぶと、現在の法線が与えられた座標に設定される。バイト・ショート・整数引数は、最大正整数値を
1.0、最小負整数値を -1.0
にマップする線形変換により浮動小数点形式に変換される。指定された法線は単位長である必要はない。正規化が有効なら変換後に正規化される。正規化は
glEnable / glDisable の GL_NORMALIZE で制御する。関連情報は glGet
(GL_CURRENT_NORMAL) および glIsEnabled (GL_NORMALIZE) で取得できる。


%index
glNormal3s
現在の法線ベクトルを設定する。| glNormal3s 関数 (Gl.h)
%prm
nx, ny, nz
nx : [int] 新しい現在法線ベクトルの x 座標を指定する。
ny : [int] 新しい現在法線ベクトルの y 座標を指定する。
nz : [int] 新しい現在法線ベクトルの z 座標を指定する。
%inst
現在の法線ベクトルを設定する。| glNormal3s 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glNormal3* を呼ぶと、現在の法線が与えられた座標に設定される。バイト・ショート・整数引数は、最大正整数値を
1.0、最小負整数値を -1.0
にマップする線形変換により浮動小数点形式に変換される。指定された法線は単位長である必要はない。正規化が有効なら変換後に正規化される。正規化は
glEnable / glDisable の GL_NORMALIZE で制御する。関連情報は glGet
(GL_CURRENT_NORMAL) および glIsEnabled (GL_NORMALIZE) で取得できる。


%index
glNormal3sv
現在の法線ベクトルを設定する。| glNormal3sv 関数 (Gl.h)
%prm
v
v : [var] 新しい現在法線の x, y, z 座標からなる 3 要素配列へのポインタ。
%inst
現在の法線ベクトルを設定する。| glNormal3sv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glNormal3* を呼ぶと、現在の法線が与えられた座標に設定される。バイト・ショート・整数引数は、最大正整数値を
1.0、最小負整数値を -1.0
にマップする線形変換により浮動小数点形式に変換される。指定された法線は単位長である必要はない。正規化が有効なら変換後に正規化される。正規化は
glEnable / glDisable の GL_NORMALIZE で制御する。関連情報は glGet
(GL_CURRENT_NORMAL) および glIsEnabled (GL_NORMALIZE) で取得できる。


%index
glNormalPointer
glNormalPointer 関数は法線配列を定義する。
%prm
type, stride, pointer
type : [int] 配列内の各座標のデータ型。次のシンボル定数を用いる: GL_BYTE、GL_SHORT、GL_INT、GL_FLOAT、GL_DOUBLE。
stride : [int] 連続する法線間のバイトオフセット。stride が 0 のとき配列内に法線が密に詰めて格納される。
pointer : [intptr] 配列内の最初の法線へのポインタ。
%inst
glNormalPointer 関数は法線配列を定義する。

[戻り値]
この関数は値を返さない。

[備考]
glNormalPointer はレンダリング時に使用する法線配列の位置とデータを指定する。type は各座標のデータ型、stride
は法線間のバイトオフセットで、頂点と属性を単一配列にパックするか別々の配列に格納するかを選べる。実装によっては単一配列に格納したほうが効率的なことがある
(glInterleavedArrays 参照)。glEnableClientState(GL_NORMAL_ARRAY)
で法線配列を有効化する。無効時は描画関数でアクセスされない。glNormalPointer
は通常クライアント側で実装されるためクライアントステートに属し、表示リストに保存されない。注意: OpenGL 1.1
以降でのみ利用可能。


%index
glOrtho
glOrtho 関数は現在の行列に正射影行列を乗算する。
%prm
left, right, bottom, top, zNear, zFar
left : [double] 左側の垂直クリッピング平面の座標。
right : [double] 右側の垂直クリッピング平面の座標。
bottom : [double] 下側の水平クリッピング平面の座標。
top : [double] 上側の水平クリッピング平面の座標。
zNear : [double] 近方のデプスクリッピング平面までの距離。平面が視点の後ろにある場合は負値。
zFar : [double] 遠方のデプスクリッピング平面までの距離。平面が視点の後ろにある場合は負値。
%inst
glOrtho 関数は現在の行列に正射影行列を乗算する。

[戻り値]
この関数は値を返さない。

[備考]
glOrtho は平行投影を生成する透視行列を記述する。視点が (0,0,0) にあるとして、(left, bottom, -zNear)
と (right, top, -zNear)
はそれぞれウィンドウの左下隅と右上隅にマップされるニアクリッピング平面上の点を指定する。zFar
はファークリッピング平面の位置を指定する。zNear と zFar は正負どちらも取りうる。対応する行列は列優先順で 2/(r-l),
0, 0, 0, 0, 2/(t-b), 0, 0, 0, 0, -2/(f-n), 0, -(r+l)/(r-l),
-(t+b)/(t-b), -(f+n)/(f-n), 1
となる。現在の行列はこの行列との積で置き換えられる。以前のプロジェクション行列をリセットするには先に glLoadIdentity
を呼ぶ。関連情報は glGet (GL_MATRIX_MODE / GL_MODELVIEW_MATRIX /
GL_PROJECTION_MATRIX / GL_TEXTURE_MATRIX) で取得できる。


%index
glPassThrough
glPassThrough 関数はフィードバックバッファにマーカーを配置する。
%prm
token
token : [float] フィードバックバッファに配置されるマーカー値。GL_PASS_THROUGH_TOKEN という一意の識別値で示される。
%inst
glPassThrough 関数はフィードバックバッファにマーカーを配置する。

[戻り値]
この関数は値を返さない。

[備考]
フィードバックは glRenderMode に GL_FEEDBACK を指定して選択される OpenGL
レンダリングモードである。フィードバックモードではラスタライズによるピクセル生成は行われず、代わりにラスタライズされたはずのプリミティブに関する情報がアプリケーションに返される。フィードバックバッファの内容については
glFeedbackBuffer を参照。glPassThrough
はフィードバックモード実行時にユーザー定義のマーカーをフィードバックバッファへ挿入する。token
はプリミティブのように返される。glPassThrough はフィードバックモードでないと効果がなく、glBegin / glEnd
ペア内では使用できない。関連情報は glFeedbackBuffer、glPassThrough
(GL_PASS_THROUGH_TOKEN)、glRenderMode、glGet (GL_RENDER_MODE) で取得できる。


%index
glPixelMapfv
glPixelMapfv 関数はピクセル転送マップを設定する。
%prm
map, mapsize, values
map : [int] シンボルマップ名。10 種類のマップは次のとおり。GL_PIXEL_MAP_I_TO_I (カラーインデックスをカラーインデックスにマップ)、GL_PIXEL_MAP_S_TO_S (ステンシルインデックスをステンシルインデックスにマップ)、GL_PIXEL_MAP_I_TO_R/G/B/A (カラーインデックスを R/G/B/A 成分にマップ)、GL_PIXEL_MAP_R_TO_R / GL_PIXEL_MAP_G_TO_G / GL_PIXEL_MAP_B_TO_B / GL_PIXEL_MAP_A_TO_A (色成分をそれぞれ同名成分にマップ)。
mapsize : [int] 定義するマップのサイズ。
values : [var] mapsize 個の値の配列。
%inst
glPixelMapfv 関数はピクセル転送マップを設定する。

[戻り値]
この関数は値を返さない。

[備考]
glPixelMap は
glCopyPixels、glCopyTexImage1D/2D、glCopyTexSubImage1D/2D、glDrawPixels、glReadPixels、glTexImage1D/2D、glTexSubImage1D/2D
が使用する変換テーブル (マップ) を設定する。マップの使用法は glPixelTransfer で詳説される。map は 10
種類のマップ名のいずれか、mapsize は定義するマップサイズ、values は mapsize 個の値の配列。I_TO_R/G/B/A
および R_TO_R 等は浮動小数点値として扱われ、R_TO_R/G_TO_G/B_TO_B/A_TO_A は [0,1]
にクランプされる。I_TO_I と S_TO_S のテーブルは符号なし整数の表を生成する。カラーマップサイズは 2 のべき乗で 1 から
GL_MAX_PIXEL_MAP_TABLE (最小 32) の範囲。エラーが生成された場合、対応するマップは変更されない。関連情報は
glGet (GL_PIXEL_MAP_*_SIZE / GL_MAX_PIXEL_MAP_TABLE) で取得できる。


%index
glPixelMapuiv
glPixelMapuiv 関数はピクセル転送マップを設定する。
%prm
map, mapsize, values
map : [int] シンボルマップ名。10 種類のマップは次のとおり。GL_PIXEL_MAP_I_TO_I (カラーインデックスをカラーインデックスにマップ)、GL_PIXEL_MAP_S_TO_S (ステンシルインデックスをステンシルインデックスにマップ)、GL_PIXEL_MAP_I_TO_R/G/B/A (カラーインデックスを R/G/B/A 成分にマップ)、GL_PIXEL_MAP_R_TO_R / GL_PIXEL_MAP_G_TO_G / GL_PIXEL_MAP_B_TO_B / GL_PIXEL_MAP_A_TO_A (色成分をそれぞれ同名成分にマップ)。
mapsize : [int] 定義するマップのサイズ。
values : [var] mapsize 個の値の配列。
%inst
glPixelMapuiv 関数はピクセル転送マップを設定する。

[戻り値]
この関数は値を返さない。

[備考]
glPixelMap は
glCopyPixels、glCopyTexImage1D/2D、glCopyTexSubImage1D/2D、glDrawPixels、glReadPixels、glTexImage1D/2D、glTexSubImage1D/2D
が使用する変換テーブル (マップ) を設定する。マップの使用法は glPixelTransfer で詳説される。map は 10
種類のマップ名のいずれか、mapsize は定義するマップサイズ、values は mapsize 個の値の配列。I_TO_R/G/B/A
および R_TO_R 等は浮動小数点値として扱われ、R_TO_R/G_TO_G/B_TO_B/A_TO_A は [0,1]
にクランプされる。I_TO_I と S_TO_S のテーブルは符号なし整数の表を生成する。カラーマップサイズは 2 のべき乗で 1 から
GL_MAX_PIXEL_MAP_TABLE (最小 32) の範囲。エラーが生成された場合、対応するマップは変更されない。関連情報は
glGet (GL_PIXEL_MAP_*_SIZE / GL_MAX_PIXEL_MAP_TABLE) で取得できる。


%index
glPixelMapusv
glPixelMapusv 関数はピクセル転送マップを設定する。
%prm
map, mapsize, values
map : [int] シンボルマップ名。10 種類のマップは次のとおり。GL_PIXEL_MAP_I_TO_I (カラーインデックスをカラーインデックスにマップ)、GL_PIXEL_MAP_S_TO_S (ステンシルインデックスをステンシルインデックスにマップ)、GL_PIXEL_MAP_I_TO_R/G/B/A (カラーインデックスを R/G/B/A 成分にマップ)、GL_PIXEL_MAP_R_TO_R / GL_PIXEL_MAP_G_TO_G / GL_PIXEL_MAP_B_TO_B / GL_PIXEL_MAP_A_TO_A (色成分をそれぞれ同名成分にマップ)。
mapsize : [int] 定義するマップのサイズ。
values : [var] mapsize 個の値の配列。
%inst
glPixelMapusv 関数はピクセル転送マップを設定する。

[戻り値]
この関数は値を返さない。

[備考]
glPixelMap は
glCopyPixels、glCopyTexImage1D/2D、glCopyTexSubImage1D/2D、glDrawPixels、glReadPixels、glTexImage1D/2D、glTexSubImage1D/2D
が使用する変換テーブル (マップ) を設定する。マップの使用法は glPixelTransfer で詳説される。map は 10
種類のマップ名のいずれか、mapsize は定義するマップサイズ、values は mapsize 個の値の配列。I_TO_R/G/B/A
および R_TO_R 等は浮動小数点値として扱われ、R_TO_R/G_TO_G/B_TO_B/A_TO_A は [0,1]
にクランプされる。I_TO_I と S_TO_S のテーブルは符号なし整数の表を生成する。カラーマップサイズは 2 のべき乗で 1 から
GL_MAX_PIXEL_MAP_TABLE (最小 32) の範囲。エラーが生成された場合、対応するマップは変更されない。関連情報は
glGet (GL_PIXEL_MAP_*_SIZE / GL_MAX_PIXEL_MAP_TABLE) で取得できる。


%index
glPixelStoref
ピクセル格納モードを設定する。| glPixelStoref 関数 (Gl.h)
%prm
pname, param1
pname : [int] 設定するパラメータのシンボル名。格納パラメータのうち 6 つはピクセルデータをクライアントメモリに返す方法に影響するので glReadPixels に対してのみ意味を持つ。6 つは glDrawPixels/glPolygonStipple/glBitmap/glTexImage*/glTexSubImage* のピクセル取り出し方に影響する。GL_PACK_SWAP_BYTES / GL_UNPACK_SWAP_BYTES (バイト順反転の真偽、既定 FALSE)、GL_PACK_LSB_FIRST / GL_UNPACK_LSB_FIRST (GL_BITMAP データ内のビット順序、既定 FALSE)、GL_PACK_ROW_LENGTH / GL_UNPACK_ROW_LENGTH (行あたりピクセル数、0 なら width を使う)、GL_PACK_SKIP_PIXELS / GL_UNPACK_SKIP_PIXELS (先頭スキップピクセル数)、GL_PACK_SKIP_ROWS / GL_UNPACK_SKIP_ROWS (先頭スキップ行数)、GL_PACK_ALIGNMENT / GL_UNPACK_ALIGNMENT (各行先頭のバイト整列、1/2/4/8 のいずれか、既定 4) を受け付ける。 このドキュメントは省略されている。
param1 : [float] 
%inst
ピクセル格納モードを設定する。| glPixelStoref 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glPixelStore は、後続の glDrawPixels / glReadPixels、ポリゴンスティップルパターン
(glPolygonStipple)、ビットマップ (glBitmap)、テクスチャパターン (glTexImage1D/2D,
glTexSubImage1D/2D) のパックまたはアンパックに影響するピクセル格納モードを設定する。pname
は変更するパラメータ、param は新しい値。パラメータの型・初期値・有効範囲はパラメータごとに定義されている (GL_PACK_*
はフレームバッファからクライアントメモリへ返す際、GL_UNPACK_*
はクライアントメモリから取り出す際に使われる)。glPixelStore* 呼び出しに与えた浮動小数点値は、ブール型パラメータに対しては
FALSE (0.0) か TRUE (それ以外) に変換され、整数パラメータに対しては最も近い整数に丸められる。関連情報は glGet
(GL_PACK_* / GL_UNPACK_*) で取得できる。


%index
glPixelStorei
ピクセル格納モードを設定する。| glPixelStorei 関数 (Gl.h)
%prm
pname, param1
pname : [int] 設定するパラメータのシンボル名。格納パラメータのうち 6 つはピクセルデータをクライアントメモリに返す方法に影響するので glReadPixels に対してのみ意味を持つ。6 つは glDrawPixels/glPolygonStipple/glBitmap/glTexImage*/glTexSubImage* のピクセル取り出し方に影響する。GL_PACK_SWAP_BYTES / GL_UNPACK_SWAP_BYTES (バイト順反転の真偽、既定 FALSE)、GL_PACK_LSB_FIRST / GL_UNPACK_LSB_FIRST (GL_BITMAP データ内のビット順序、既定 FALSE)、GL_PACK_ROW_LENGTH / GL_UNPACK_ROW_LENGTH (行あたりピクセル数、0 なら width を使う)、GL_PACK_SKIP_PIXELS / GL_UNPACK_SKIP_PIXELS (先頭スキップピクセル数)、GL_PACK_SKIP_ROWS / GL_UNPACK_SKIP_ROWS (先頭スキップ行数)、GL_PACK_ALIGNMENT / GL_UNPACK_ALIGNMENT (各行先頭のバイト整列、1/2/4/8 のいずれか、既定 4) を受け付ける。 このドキュメントは省略されている。
param1 : [int] 
%inst
ピクセル格納モードを設定する。| glPixelStorei 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glPixelStore は、後続の glDrawPixels / glReadPixels、ポリゴンスティップルパターン
(glPolygonStipple)、ビットマップ (glBitmap)、テクスチャパターン (glTexImage1D/2D,
glTexSubImage1D/2D) のパックまたはアンパックに影響するピクセル格納モードを設定する。pname
は変更するパラメータ、param は新しい値。パラメータの型・初期値・有効範囲はパラメータごとに定義されている (GL_PACK_*
はフレームバッファからクライアントメモリへ返す際、GL_UNPACK_*
はクライアントメモリから取り出す際に使われる)。glPixelStore* 呼び出しに与えた浮動小数点値は、ブール型パラメータに対しては
FALSE (0.0) か TRUE (それ以外) に変換され、整数パラメータに対しては最も近い整数に丸められる。関連情報は glGet
(GL_PACK_* / GL_UNPACK_*) で取得できる。


%index
glPixelTransferf
glPixelTransferf、glPixelTransferi 関数はピクセル転送モードを設定する。| glPixelTransferf 関数 (Gl.h)
%prm
pname, param1
pname : [int] 設定するピクセル転送パラメータのシンボル名。以下のパラメータが glPixelTransfer で設定可能: GL_MAP_COLOR (Boolean、既定 FALSE)、GL_MAP_STENCIL (Boolean、既定 FALSE)、GL_INDEX_SHIFT (integer、既定 0)、GL_INDEX_OFFSET (integer、既定 0)、GL_RED_SCALE / GL_GREEN_SCALE / GL_BLUE_SCALE / GL_ALPHA_SCALE / GL_DEPTH_SCALE (float、既定 1)、GL_RED_BIAS / GL_GREEN_BIAS / GL_BLUE_BIAS / GL_ALPHA_BIAS / GL_DEPTH_BIAS (float、既定 0)。
param1 : [float] 
%inst
glPixelTransferf、glPixelTransferi 関数はピクセル転送モードを設定する。|
glPixelTransferf 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glPixelTransfer は、後続の
glCopyPixels、glCopyTexImage1D/2D、glCopyTexSubImage1D/2D、glDrawPixels、glReadPixels、glTexImage1D/2D、glTexSubImage1D/2D
の動作に影響するピクセル転送モードを設定する。これらコマンドでピクセル成分はフラグメントやテクスチャ成分として扱われる前に、スケール・バイアス・マッピングで変換される。RGBA
モードの色成分 (赤・緑・青・アルファ) はそれぞれ対応するスケールとバイアスを掛けて足し、[0,1] にクランプされる。その後
GL_MAP_COLOR が真なら GL_PIXEL_MAP_R_TO_R 等のテーブルでマップされる。カラーインデックスは
GL_INDEX_SHIFT と GL_INDEX_OFFSET で変換され、GL_MAP_COLOR が真なら
GL_PIXEL_MAP_I_TO_I テーブルでマップされる。ステンシルインデックスも同様に GL_INDEX_SHIFT と
GL_INDEX_OFFSET で変換され、GL_MAP_STENCIL が真なら GL_PIXEL_MAP_S_TO_S
でマップされる。デプス成分はスケールとバイアスを掛けて [0,1] にクランプされる。glPixelTransfer
は表示リストに含められる。関連情報は glGet (各パラメータ名) および glPixelMap で取得できる。
このドキュメントは省略されている。


%index
glPixelTransferi
glPixelTransferf、glPixelTransferi 関数はピクセル転送モードを設定する。| glPixelTransferi 関数 (Gl.h)
%prm
pname, param1
pname : [int] 設定するピクセル転送パラメータのシンボル名。以下のパラメータが glPixelTransfer で設定可能: GL_MAP_COLOR (Boolean、既定 FALSE)、GL_MAP_STENCIL (Boolean、既定 FALSE)、GL_INDEX_SHIFT (integer、既定 0)、GL_INDEX_OFFSET (integer、既定 0)、GL_RED_SCALE / GL_GREEN_SCALE / GL_BLUE_SCALE / GL_ALPHA_SCALE / GL_DEPTH_SCALE (float、既定 1)、GL_RED_BIAS / GL_GREEN_BIAS / GL_BLUE_BIAS / GL_ALPHA_BIAS / GL_DEPTH_BIAS (float、既定 0)。
param1 : [int] 
%inst
glPixelTransferf、glPixelTransferi 関数はピクセル転送モードを設定する。|
glPixelTransferi 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glPixelTransfer は、後続の
glCopyPixels、glCopyTexImage1D/2D、glCopyTexSubImage1D/2D、glDrawPixels、glReadPixels、glTexImage1D/2D、glTexSubImage1D/2D
の動作に影響するピクセル転送モードを設定する。これらコマンドでピクセル成分はフラグメントやテクスチャ成分として扱われる前に、スケール・バイアス・マッピングで変換される。RGBA
モードの色成分 (赤・緑・青・アルファ) はそれぞれ対応するスケールとバイアスを掛けて足し、[0,1] にクランプされる。その後
GL_MAP_COLOR が真なら GL_PIXEL_MAP_R_TO_R 等のテーブルでマップされる。カラーインデックスは
GL_INDEX_SHIFT と GL_INDEX_OFFSET で変換され、GL_MAP_COLOR が真なら
GL_PIXEL_MAP_I_TO_I テーブルでマップされる。ステンシルインデックスも同様に GL_INDEX_SHIFT と
GL_INDEX_OFFSET で変換され、GL_MAP_STENCIL が真なら GL_PIXEL_MAP_S_TO_S
でマップされる。デプス成分はスケールとバイアスを掛けて [0,1] にクランプされる。glPixelTransfer
は表示リストに含められる。関連情報は glGet (各パラメータ名) および glPixelMap で取得できる。
このドキュメントは省略されている。


%index
glPixelZoom
glPixelZoom 関数はピクセルズーム係数を指定する。
%prm
xfactor, yfactor
xfactor : [float] ピクセル書き込み操作の x 方向ズーム係数。
yfactor : [float] ピクセル書き込み操作の y 方向ズーム係数。
%inst
glPixelZoom 関数はピクセルズーム係数を指定する。

[戻り値]
この関数は値を返さない。

[備考]
glPixelZoom は x, y ズーム係数を指定する。glDrawPixels や glCopyPixels の実行時に、(xr,
yr) を現在のラスタ位置、ある要素がピクセル矩形の n 行 m 列目にあるとすると、中心座標が (xr + m*xfactor, yr
+ n*yfactor) の矩形内に含まれるピクセルが置換候補となる。矩形の下辺または左辺上に中心を持つピクセルも変更される。既定の x,
y ズーム係数は 1.0。xfactor または yfactor が負なら、対応する方向のピクセル描画方向が反転する。ズーム係数は
glPixelStore のパラメータとは独立。関連情報は glGet (GL_ZOOM_X / GL_ZOOM_Y) で取得できる。


%index
glPointSize
glPointSize 関数はラスタライズされる点の直径を指定する。
%prm
size
size : [float] ラスタライズされる点の直径。既定は 1.0。
%inst
glPointSize 関数はラスタライズされる点の直径を指定する。

[戻り値]
この関数は値を返さない。

[備考]
glPointSize はエイリアスとアンチエイリアス両方のラスタライズ点の直径を指定する。1.0
以外のサイズはアンチエイリアスの有無で効果が変わる。点アンチエイリアスは glEnable/glDisable の
GL_POINT_SMOOTH で制御する。無効時は指定サイズを最も近い整数に丸めた値が実際のサイズとなる (0 になった場合は 1
として扱う)。大きな点はサイズ×サイズのピクセル四角形として塗られる。有効時は指定サイズそのものが使われ、点はディスク形状でラスタライズされ、各ピクセルのカバレッジ値が計算される。指定サイズは非負でなければならない。実装ごとのサポート範囲は
GL_POINT_SIZE_RANGE で、粒度は GL_POINT_SIZE_GRANULARITY で取得できる。関連情報は
glGet (GL_POINT_SIZE / GL_POINT_SIZE_RANGE /
GL_POINT_SIZE_GRANULARITY) および glIsEnabled (GL_POINT_SMOOTH) で取得できる。


%index
glPolygonMode
glPolygonMode 関数はポリゴンのラスタライズモードを選択する。
%prm
face, mode
face : [int] mode を適用するポリゴン。前面ポリゴン用に GL_FRONT、背面ポリゴン用に GL_BACK、両面用に GL_FRONT_AND_BACK のいずれかでなければならない。
mode : [int] ポリゴンのラスタライズ方法。前面・背面とも既定は GL_FILL。GL_POINT: 頂点を単一点として扱い、点として描画する。GL_LINE: ポリゴンの境界辺を線分として描画する。GL_FILL: ポリゴンの内部を塗りつぶす。
%inst
glPolygonMode 関数はポリゴンのラスタライズモードを選択する。

[戻り値]
この関数は値を返さない。

[備考]
glPolygonMode はラスタライズ用ポリゴン解釈を制御する。face は mode を適用するポリゴン (前面
GL_FRONT、背面 GL_BACK、両方 GL_FRONT_AND_BACK)
を指定する。ポリゴンモードは最終ラスタライズにのみ影響する
(ポリゴンの頂点はライティングされ、クリッピング・カリング後に適用される)。背面を塗りつぶし前面を輪郭描画する例:
glPolygonMode(GL_FRONT, GL_LINE)。頂点は glEdgeFlag または glEdgeFlagv
により境界か非境界としてマークされ、GL_LINE モードで描画されるのは境界辺のみ。関連情報は glGet
(GL_POLYGON_MODE) で取得できる。


%index
glPolygonOffset
glPolygonOffset 関数は OpenGL がデプス値を計算する際のスケールと単位を設定する。
%prm
factor, units
factor : [float] 各ポリゴンに対する可変のデプスオフセットを作成するスケール係数。初期値は 0。
units : [float] 実装依存の値と掛け合わせて定デプスオフセットを作る値。初期値は 0。
%inst
glPolygonOffset 関数は OpenGL がデプス値を計算する際のスケールと単位を設定する。

[戻り値]
この関数は値を返さない。

[備考]
GL_POLYGON_OFFSET が有効なとき、各フラグメントのデプス値は頂点から補間された後にオフセットされる。オフセット値は
factor * Δz + r * units で、Δz はポリゴンのスクリーン面積に対するデプス変化の尺度、r
は実装ごとに確実に解像可能なオフセットを生成する最小値。オフセットはデプステスト実行前、デプスバッファへの書き込み前に加算される。glPolygonOffset
は隠線画像のレンダリング、隠面除去、同一ジオメトリでのシェーディング切替えなどで有用。GL_POLYGON_OFFSET は
glEnable/glDisable で GL_POLYGON_OFFSET_FILL/LINE/POINT を渡して個別に有効化する
(ポリゴンモード GL_FILL/LINE/POINT に対応)。関連情報は glGet
(GL_POLYGON_OFFSET_FACTOR / UNITS) および glIsEnabled で取得できる。


%index
glPolygonStipple
glPolygonStipple 関数はポリゴンスティップリングパターンを設定する。
%prm
mask
mask : [var] glDrawPixels がピクセルをアンパックするのと同じ方法でメモリからアンパックされる 32x32 スティップルパターンへのポインタ。
%inst
glPolygonStipple 関数はポリゴンスティップリングパターンを設定する。

[戻り値]
この関数は値を返さない。

[備考]
glPolygonStipple はポリゴンスティップリングパターンを設定する。線スティップリング (glLineStipple 参照)
と同様、ラスタライズ生成フラグメントをマスクしてパターンを作る。スティップリングはポリゴンアンチエイリアスと独立。mask は 32x32
スティップルパターンへのポインタで、glDrawPixels の
height/width=32、format=GL_COLOR_INDEX、type=GL_BITMAP
で与えたピクセルデータと同じ形でメモリに格納される。スティップルパターンは 32x32 の 1
ビット色インデックス配列として表現される。パターンは glPixelStore の GL_UNPACK_*
パラメータの影響を受ける。スティップリングは glEnable/glDisable の GL_POLYGON_STIPPLE
で有効/無効化する。関連情報は glGetPolygonStipple / glPixelStore で取得できる。


%index
glPopAttrib
属性スタックをポップする。
%prm

%inst
属性スタックをポップする。

[戻り値]
この関数は引数を持たず、値を返さない。

[備考]
glPushAttrib は属性スタックに保存する状態変数群を示すマスクを 1
つ引数に取る。マスク中のビット設定にはシンボル定数が使われ、これらの OR で構築する。特別なマスク GL_ALL_ATTRIB_BITS
で全ての保存可能状態を保存できる。glPopAttrib は最後の glPushAttrib
で保存した状態変数を復元する。保存されていないものは変更されない。満杯の属性スタックへのプッシュ、または空スタックからのポップはエラーフラグを立て、他の変更は行われない。最小スタック深度は
16。関連情報は glGet (GL_ATTRIB_STACK_DEPTH / GL_MAX_ATTRIB_STACK_DEPTH)
で取得できる。


%index
glPopClientAttrib
glPushClientAttrib と glPopClientAttrib 関数はクライアント属性スタック上でクライアントステート変数群を保存・復元する。| glPopClientAttrib 関数 (Gl.h)
%prm

%inst
glPushClientAttrib と glPopClientAttrib
関数はクライアント属性スタック上でクライアントステート変数群を保存・復元する。| glPopClientAttrib 関数 (Gl.h)

[戻り値]
この関数は引数を持たず、値を返さない。

[備考]
glPushClientAttrib はクライアント属性スタックに保存するクライアントステート変数群をマスクで指定する。ビット単位 OR
で受け付けシンボル定数を結合してマスクを構築する。glPopClientAttrib は最後の glPushClientAttrib
で保存したクライアントステート変数を復元する。保存されていないものは変更されない。満杯のクライアント属性スタックへのプッシュ、空スタックからのポップはエラーフラグを立て、他の変更は行われない。クライアントステートはサーバ側ステートと区別される。GL_CLIENT_PIXEL_STORE_BIT
と GL_CLIENT_VERTEX_ARRAY_BIT のみが保存可能。glPushClientAttrib と
glPopClientAttrib は表示リストに含められない。注意: OpenGL 1.1 以降でのみ利用可能。関連情報は glGet
(GL_CLIENT_ATTRIB_STACK_DEPTH / GL_MAX_CLIENT_ATTRIB_STACK_DEPTH)
で取得できる。


%index
glPopMatrix
glPushMatrix と glPopMatrix 関数は現在の行列スタックをプッシュ・ポップする。| glPopMatrix 関数 (Gl.h)
%prm

%inst
glPushMatrix と glPopMatrix 関数は現在の行列スタックをプッシュ・ポップする。| glPopMatrix 関数
(Gl.h)

[戻り値]
この関数は引数を持たず、値を返さない。

[備考]
各行列モードごとに行列スタックが存在する。GL_MODELVIEW モードのスタック深度は最小 32、GL_PROJECTION と
GL_TEXTURE の深度は最小 2。任意モードの現在の行列はそのモードのスタック最上段の行列。glPushMatrix
は現在の行列スタックを 1 段下げ、現在行列を複製する (プッシュ後は最上段と直下が同一)。glPopMatrix
は現在の行列スタックをポップし、現在行列を直下の行列で置き換える。満杯のスタックへのプッシュ、空のスタックからのポップはエラーフラグを立てる。関連情報は
glGet (GL_MATRIX_MODE / GL_MODELVIEW_MATRIX / GL_PROJECTION_MATRIX /
GL_TEXTURE_MATRIX / GL_MAX_MODELVIEW_STACK_DEPTH /
GL_MAX_PROJECTION_STACK_DEPTH / GL_MAX_TEXTURE_STACK_DEPTH /
GL_MODELVIEW_STACK_DEPTH / GL_PROJECTION_STACK_DEPTH /
GL_TEXTURE_STACK_DEPTH) で取得できる。


%index
glPopName
glPushName と glPopName 関数はネームスタックをプッシュ・ポップする。| glPopName 関数 (Gl.h)
%prm

%inst
glPushName と glPopName 関数はネームスタックをプッシュ・ポップする。| glPopName 関数 (Gl.h)

[戻り値]
この関数は引数を持たず、値を返さない。

[備考]
glPushName は当初空のネームスタックに name をプッシュする。glPopName は 1
つの名前をスタック最上段からポップする。ネームスタックはセレクションモード中にレンダリングコマンド群を一意に識別するための順序付き符号なし整数集合。レンダーモードが
GL_SELECT でない間は常に空で、このとき glPushName と glPopName
は無視される。満杯のネームスタックへのプッシュ、空スタックからのポップはエラーフラグを立てる。関連情報は glGet
(GL_NAME_STACK_DEPTH / GL_MAX_NAME_STACK_DEPTH) および glRenderMode
で取得できる。


%index
glPrioritizeTextures
glPrioritizeTextures 関数はテクスチャの常駐優先度を設定する。
%prm
n, textures, priorities
n : [int] 優先度を設定するテクスチャの数。
textures : [var] 優先度を設定するテクスチャ名を含む配列の最初の要素へのポインタ。
priorities : [var] テクスチャ優先度を含む配列の最初の要素へのポインタ。priorities の各要素の優先度は、textures の対応する要素で指名されたテクスチャに適用される。
%inst
glPrioritizeTextures 関数はテクスチャの常駐優先度を設定する。

[戻り値]
この関数は値を返さない。

[備考]
glPrioritizeTextures は priorities で指定された n 個のテクスチャ優先度を textures
で指名された n 個のテクスチャに割り当てる。テクスチャメモリが限られたマシンでは、OpenGL
はテクスチャメモリ常駐の「ワーキングセット」を確立する。常駐テクスチャは非常駐より効率的にバインドできる。各テクスチャに優先度を指定することで常駐させるべきテクスチャを決定できる。priorities
の優先度は [0, 1] にクランプされ、0 は最低、1 は最高。既定のテクスチャ優先度は glTexParameter で
GL_TEXTURE_PRIORITY により設定され、glPrioritizeTextures
はそれを上書きする。既に存在するテクスチャの優先度のみが設定され、存在しないテクスチャ名は無視される。glPrioritizeTextures
は表示リストに含められない。注意: OpenGL 1.1 以降でのみ利用可能。関連情報は glAreTexturesResident /
glBindTexture / glGetTexParameter で取得できる。


%index
glPushAttrib
属性スタックにプッシュする。
%prm
mask
mask : [int] 保存する属性を示すマスク。シンボルマスク定数と関連する OpenGL ステートは次のとおり (それぞれ保存される属性を列挙): GL_ACCUM_BUFFER_BIT (アキュムレーションバッファクリア値)、GL_COLOR_BUFFER_BIT (GL_ALPHA_TEST 有効フラグ・関数・参照値、GL_BLEND 有効フラグ・ソース/宛先関数、GL_DITHER 有効フラグ、GL_DRAW_BUFFER 設定、GL_LOGIC_OP 有効フラグ・関数、クリア値、書き込みマスク)、GL_CURRENT_BIT (現在 RGBA 色・カラーインデックス・法線・テクスチャ座標・ラスタ位置・関連色・ラスタテクスチャ座標・GL_EDGE_FLAG)、GL_DEPTH_BUFFER_BIT、GL_ENABLE_BIT、GL_EVAL_BIT、GL_FOG_BIT、GL_HINT_BIT、GL_LIGHTING_BIT、GL_LINE_BIT、GL_LIST_BIT、GL_PIXEL_MODE_BIT、GL_POINT_BIT、GL_POLYGON_BIT、GL_POLYGON_STIPPLE_BIT、GL_SCISSOR_BIT、GL_STENCIL_BUFFER_BIT、GL_TEXTURE_BIT、GL_TRANSFORM_BIT、GL_VIEWPORT_BIT、GL_ALL_ATTRIB_BITS。 このドキュメントは省略されている。
%inst
属性スタックにプッシュする。

[戻り値]
この関数は値を返さない。

[備考]
glPushAttrib は属性スタックに保存する状態変数群を示すマスクを 1
つ引数に取る。マスク中のビット設定にはシンボル定数が使われ、論理 OR 演算でそれらを結合して構築する。特別なマスク
GL_ALL_ATTRIB_BITS で全ての保存可能状態を保存できる。glPopAttrib は最後の glPushAttrib
で保存した状態変数を復元する。保存されていないものは変更されない。満杯の属性スタックへのプッシュ、空スタックからのポップはエラーフラグを立て、他の変更は行われない。最小スタック深度は
16。関連情報は glGet (GL_ATTRIB_STACK_DEPTH / GL_MAX_ATTRIB_STACK_DEPTH)
で取得できる。


%index
glPushClientAttrib
glPushClientAttrib と glPopClientAttrib 関数はクライアント属性スタック上でクライアントステート変数群を保存・復元する。| glPushClientAttrib 関数 (Gl.h)
%prm
mask
mask : [int] 保存する属性を示すマスク。シンボルマスク定数と関連する OpenGL クライアントステート: GL_CLIENT_PIXEL_STORE_BIT (ピクセル格納モード: GL_PACK_* と GL_UNPACK_* の全パラメータ)、GL_CLIENT_VERTEX_ARRAY_BIT (頂点配列状態: GL_VERTEX_ARRAY 有効フラグとポインタ/サイズ/型/ストライド、法線配列、カラー配列、インデックス配列、テクスチャ座標配列、エッジフラグ配列の同等状態)、GL_CLIENT_ALL_ATTRIB_BITS (全ビット)。
%inst
glPushClientAttrib と glPopClientAttrib
関数はクライアント属性スタック上でクライアントステート変数群を保存・復元する。| glPushClientAttrib 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glPushClientAttrib はクライアント属性スタックに保存するクライアントステート変数群をマスクで指定する。ビット単位 OR
で受け付けシンボル定数を結合してマスクを構築する。glPopClientAttrib は最後の glPushClientAttrib
で保存したクライアントステート変数を復元する。保存されていないものは変更されない。満杯のクライアント属性スタックへのプッシュ、空スタックからのポップはエラーフラグを立て、他の変更は行われない。クライアントステートはサーバ側ステートと区別される。GL_CLIENT_PIXEL_STORE_BIT
と GL_CLIENT_VERTEX_ARRAY_BIT のみが保存可能。glPushClientAttrib と
glPopClientAttrib は表示リストに含められない。注意: OpenGL 1.1 以降でのみ利用可能。関連情報は glGet
(GL_CLIENT_ATTRIB_STACK_DEPTH / GL_MAX_CLIENT_ATTRIB_STACK_DEPTH)
で取得できる。


%index
glPushMatrix
glPushMatrix と glPopMatrix 関数は現在の行列スタックをプッシュ・ポップする。| glPushMatrix 関数 (Gl.h)
%prm

%inst
glPushMatrix と glPopMatrix 関数は現在の行列スタックをプッシュ・ポップする。| glPushMatrix 関数
(Gl.h)

[戻り値]
この関数は引数を持たず、値を返さない。

[備考]
各行列モードごとに行列スタックが存在する。GL_MODELVIEW モードのスタック深度は最小 32、GL_PROJECTION と
GL_TEXTURE の深度は最小 2。任意モードの現在の行列はそのモードのスタック最上段の行列。glPushMatrix
は現在の行列スタックを 1 段下げ、現在行列を複製する (プッシュ後は最上段と直下が同一)。glPopMatrix
は現在の行列スタックをポップし、現在行列を直下の行列で置き換える。満杯のスタックへのプッシュ、空のスタックからのポップはエラーフラグを立てる。関連情報は
glGet (GL_MATRIX_MODE / GL_MODELVIEW_MATRIX / GL_PROJECTION_MATRIX /
GL_TEXTURE_MATRIX / GL_MAX_MODELVIEW_STACK_DEPTH /
GL_MAX_PROJECTION_STACK_DEPTH / GL_MAX_TEXTURE_STACK_DEPTH /
GL_MODELVIEW_STACK_DEPTH / GL_PROJECTION_STACK_DEPTH /
GL_TEXTURE_STACK_DEPTH) で取得できる。


%index
glPushName
glPushName と glPopName 関数はネームスタックをプッシュ・ポップする。| glPushName 関数 (Gl.h)
%prm
name
name : [int] ネームスタックにプッシュされる名前。
%inst
glPushName と glPopName 関数はネームスタックをプッシュ・ポップする。| glPushName 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glPushName は当初空のネームスタックに name をプッシュする。glPopName は 1
つの名前をスタック最上段からポップする。ネームスタックはセレクションモード中にレンダリングコマンド群を一意に識別するための順序付き符号なし整数集合。レンダーモードが
GL_SELECT でない間は常に空で、このとき glPushName と glPopName
は無視される。満杯のネームスタックへのプッシュ、空スタックからのポップはエラーフラグを立てる。関連情報は glGet
(GL_NAME_STACK_DEPTH / GL_MAX_NAME_STACK_DEPTH) および glRenderMode
で取得できる。


%index
glRasterPos2d
ピクセル操作用のラスタ位置を指定する。| glRasterPos2d 関数 (Gl.h)
%prm
x, y
x : [double] 現在のラスタ位置の x 座標を指定する。
y : [double] 現在のラスタ位置の y 座標を指定する。
%inst
ピクセル操作用のラスタ位置を指定する。| glRasterPos2d 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
OpenGL はウィンドウ座標で 3D
位置を保持する。この位置をラスタ位置と呼び、サブピクセル精度で保持される。ピクセル・ビットマップ書き込み操作の位置決めに使われる
(glBitmap、glDrawPixels、glCopyPixels 参照)。現在のラスタ位置は 3 つのウィンドウ座標 (x, y,
z)、クリップ座標 w 値、アイ座標距離、有効ビット、関連する色データとテクスチャ座標から成る。w
座標はクリップ座標で、ウィンドウ座標に投影されない。glRasterPos4 は x, y, z, w
を指定する。glRasterPos3 は w=1、glRasterPos2 は z=0, w=1
で指定する。ラスタ位置の座標はモデルビュー行列とプロジェクション行列で変換され、通常の頂点と同様にビューボリュームに対してクリップテストされる。位置がクリップされれば有効ビットはクリアされ、現在のラスタ位置は未定義となる。そうでなければ有効ビットが設定される。ラスタ位置が有効な場合、ラスタ位置に関連する色データは現在の色・インデックスから設定される
(ライティング有効時は通常の頂点と同様に計算される)。ラスタテクスチャ座標は現在のテクスチャ座標から変換される。関連情報は glGet
(GL_CURRENT_RASTER_POSITION / GL_CURRENT_RASTER_POSITION_VALID /
GL_CURRENT_RASTER_DISTANCE / GL_CURRENT_RASTER_COLOR /
GL_CURRENT_RASTER_INDEX / GL_CURRENT_RASTER_TEXTURE_COORDS) で取得できる。
このドキュメントは省略されている。


%index
glRasterPos2dv
ピクセル操作用のラスタ位置を指定する。| glRasterPos2dv 関数 (Gl.h)
%prm
v
v : [var] 現在のラスタ位置の x, y 座標を指定する 2 要素配列へのポインタ。
%inst
ピクセル操作用のラスタ位置を指定する。| glRasterPos2dv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
OpenGL はウィンドウ座標で 3D
位置を保持する。この位置をラスタ位置と呼び、サブピクセル精度で保持される。ピクセル・ビットマップ書き込み操作の位置決めに使われる
(glBitmap、glDrawPixels、glCopyPixels 参照)。現在のラスタ位置は 3 つのウィンドウ座標 (x, y,
z)、クリップ座標 w 値、アイ座標距離、有効ビット、関連する色データとテクスチャ座標から成る。w
座標はクリップ座標で、ウィンドウ座標に投影されない。glRasterPos4 は x, y, z, w
を指定する。glRasterPos3 は w=1、glRasterPos2 は z=0, w=1
で指定する。ラスタ位置の座標はモデルビュー行列とプロジェクション行列で変換され、通常の頂点と同様にビューボリュームに対してクリップテストされる。位置がクリップされれば有効ビットはクリアされ、現在のラスタ位置は未定義となる。そうでなければ有効ビットが設定される。ラスタ位置が有効な場合、ラスタ位置に関連する色データは現在の色・インデックスから設定される
(ライティング有効時は通常の頂点と同様に計算される)。ラスタテクスチャ座標は現在のテクスチャ座標から変換される。関連情報は glGet
(GL_CURRENT_RASTER_POSITION / GL_CURRENT_RASTER_POSITION_VALID /
GL_CURRENT_RASTER_DISTANCE / GL_CURRENT_RASTER_COLOR /
GL_CURRENT_RASTER_INDEX / GL_CURRENT_RASTER_TEXTURE_COORDS) で取得できる。
このドキュメントは省略されている。


%index
glRasterPos2f
ピクセル操作用のラスタ位置を指定する。| glRasterPos2f 関数 (Gl.h)
%prm
x, y
x : [float] 現在のラスタ位置の x 座標を指定する。
y : [float] 現在のラスタ位置の y 座標を指定する。
%inst
ピクセル操作用のラスタ位置を指定する。| glRasterPos2f 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
OpenGL はウィンドウ座標で 3D
位置を保持する。この位置をラスタ位置と呼び、サブピクセル精度で保持される。ピクセル・ビットマップ書き込み操作の位置決めに使われる
(glBitmap、glDrawPixels、glCopyPixels 参照)。現在のラスタ位置は 3 つのウィンドウ座標 (x, y,
z)、クリップ座標 w 値、アイ座標距離、有効ビット、関連する色データとテクスチャ座標から成る。w
座標はクリップ座標で、ウィンドウ座標に投影されない。glRasterPos4 は x, y, z, w
を指定する。glRasterPos3 は w=1、glRasterPos2 は z=0, w=1
で指定する。ラスタ位置の座標はモデルビュー行列とプロジェクション行列で変換され、通常の頂点と同様にビューボリュームに対してクリップテストされる。位置がクリップされれば有効ビットはクリアされ、現在のラスタ位置は未定義となる。そうでなければ有効ビットが設定される。ラスタ位置が有効な場合、ラスタ位置に関連する色データは現在の色・インデックスから設定される
(ライティング有効時は通常の頂点と同様に計算される)。ラスタテクスチャ座標は現在のテクスチャ座標から変換される。関連情報は glGet
(GL_CURRENT_RASTER_POSITION / GL_CURRENT_RASTER_POSITION_VALID /
GL_CURRENT_RASTER_DISTANCE / GL_CURRENT_RASTER_COLOR /
GL_CURRENT_RASTER_INDEX / GL_CURRENT_RASTER_TEXTURE_COORDS) で取得できる。
このドキュメントは省略されている。


%index
glRasterPos2fv
ピクセル操作用のラスタ位置を指定する。| glRasterPos2fv 関数 (Gl.h)
%prm
v
v : [var] 現在のラスタ位置の x, y 座標を指定する 2 要素配列へのポインタ。
%inst
ピクセル操作用のラスタ位置を指定する。| glRasterPos2fv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
OpenGL はウィンドウ座標で 3D
位置を保持する。この位置をラスタ位置と呼び、サブピクセル精度で保持される。ピクセル・ビットマップ書き込み操作の位置決めに使われる
(glBitmap、glDrawPixels、glCopyPixels 参照)。現在のラスタ位置は 3 つのウィンドウ座標 (x, y,
z)、クリップ座標 w 値、アイ座標距離、有効ビット、関連する色データとテクスチャ座標から成る。w
座標はクリップ座標で、ウィンドウ座標に投影されない。glRasterPos4 は x, y, z, w
を指定する。glRasterPos3 は w=1、glRasterPos2 は z=0, w=1
で指定する。ラスタ位置の座標はモデルビュー行列とプロジェクション行列で変換され、通常の頂点と同様にビューボリュームに対してクリップテストされる。位置がクリップされれば有効ビットはクリアされ、現在のラスタ位置は未定義となる。そうでなければ有効ビットが設定される。ラスタ位置が有効な場合、ラスタ位置に関連する色データは現在の色・インデックスから設定される
(ライティング有効時は通常の頂点と同様に計算される)。ラスタテクスチャ座標は現在のテクスチャ座標から変換される。関連情報は glGet
(GL_CURRENT_RASTER_POSITION / GL_CURRENT_RASTER_POSITION_VALID /
GL_CURRENT_RASTER_DISTANCE / GL_CURRENT_RASTER_COLOR /
GL_CURRENT_RASTER_INDEX / GL_CURRENT_RASTER_TEXTURE_COORDS) で取得できる。
このドキュメントは省略されている。


%index
glRasterPos2i
ピクセル操作用のラスタ位置を指定する。| glRasterPos2i 関数 (Gl.h)
%prm
x, y
x : [int] 現在のラスタ位置の x 座標を指定する。
y : [int] 現在のラスタ位置の y 座標を指定する。
%inst
ピクセル操作用のラスタ位置を指定する。| glRasterPos2i 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
OpenGL はウィンドウ座標で 3D
位置を保持する。この位置をラスタ位置と呼び、サブピクセル精度で保持される。ピクセル・ビットマップ書き込み操作の位置決めに使われる
(glBitmap、glDrawPixels、glCopyPixels 参照)。現在のラスタ位置は 3 つのウィンドウ座標 (x, y,
z)、クリップ座標 w 値、アイ座標距離、有効ビット、関連する色データとテクスチャ座標から成る。w
座標はクリップ座標で、ウィンドウ座標に投影されない。glRasterPos4 は x, y, z, w
を指定する。glRasterPos3 は w=1、glRasterPos2 は z=0, w=1
で指定する。ラスタ位置の座標はモデルビュー行列とプロジェクション行列で変換され、通常の頂点と同様にビューボリュームに対してクリップテストされる。位置がクリップされれば有効ビットはクリアされ、現在のラスタ位置は未定義となる。そうでなければ有効ビットが設定される。ラスタ位置が有効な場合、ラスタ位置に関連する色データは現在の色・インデックスから設定される
(ライティング有効時は通常の頂点と同様に計算される)。ラスタテクスチャ座標は現在のテクスチャ座標から変換される。関連情報は glGet
(GL_CURRENT_RASTER_POSITION / GL_CURRENT_RASTER_POSITION_VALID /
GL_CURRENT_RASTER_DISTANCE / GL_CURRENT_RASTER_COLOR /
GL_CURRENT_RASTER_INDEX / GL_CURRENT_RASTER_TEXTURE_COORDS) で取得できる。
このドキュメントは省略されている。


%index
glRasterPos2iv
ピクセル操作用のラスタ位置を指定する。| glRasterPos2iv 関数 (Gl.h)
%prm
v
v : [var] 現在のラスタ位置の x, y 座標を指定する 2 要素配列へのポインタ。
%inst
ピクセル操作用のラスタ位置を指定する。| glRasterPos2iv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
OpenGL はウィンドウ座標で 3D
位置を保持する。この位置をラスタ位置と呼び、サブピクセル精度で保持される。ピクセル・ビットマップ書き込み操作の位置決めに使われる
(glBitmap、glDrawPixels、glCopyPixels 参照)。現在のラスタ位置は 3 つのウィンドウ座標 (x, y,
z)、クリップ座標 w 値、アイ座標距離、有効ビット、関連する色データとテクスチャ座標から成る。w
座標はクリップ座標で、ウィンドウ座標に投影されない。glRasterPos4 は x, y, z, w
を指定する。glRasterPos3 は w=1、glRasterPos2 は z=0, w=1
で指定する。ラスタ位置の座標はモデルビュー行列とプロジェクション行列で変換され、通常の頂点と同様にビューボリュームに対してクリップテストされる。位置がクリップされれば有効ビットはクリアされ、現在のラスタ位置は未定義となる。そうでなければ有効ビットが設定される。ラスタ位置が有効な場合、ラスタ位置に関連する色データは現在の色・インデックスから設定される
(ライティング有効時は通常の頂点と同様に計算される)。ラスタテクスチャ座標は現在のテクスチャ座標から変換される。関連情報は glGet
(GL_CURRENT_RASTER_POSITION / GL_CURRENT_RASTER_POSITION_VALID /
GL_CURRENT_RASTER_DISTANCE / GL_CURRENT_RASTER_COLOR /
GL_CURRENT_RASTER_INDEX / GL_CURRENT_RASTER_TEXTURE_COORDS) で取得できる。
このドキュメントは省略されている。


%index
glRasterPos2s
ピクセル操作用のラスタ位置を指定する。| glRasterPos2s 関数 (Gl.h)
%prm
x, y
x : [int] 現在のラスタ位置の x 座標を指定する。
y : [int] 現在のラスタ位置の y 座標を指定する。
%inst
ピクセル操作用のラスタ位置を指定する。| glRasterPos2s 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
OpenGL はウィンドウ座標で 3D
位置を保持する。この位置をラスタ位置と呼び、サブピクセル精度で保持される。ピクセル・ビットマップ書き込み操作の位置決めに使われる
(glBitmap、glDrawPixels、glCopyPixels 参照)。現在のラスタ位置は 3 つのウィンドウ座標 (x, y,
z)、クリップ座標 w 値、アイ座標距離、有効ビット、関連する色データとテクスチャ座標から成る。w
座標はクリップ座標で、ウィンドウ座標に投影されない。glRasterPos4 は x, y, z, w
を指定する。glRasterPos3 は w=1、glRasterPos2 は z=0, w=1
で指定する。ラスタ位置の座標はモデルビュー行列とプロジェクション行列で変換され、通常の頂点と同様にビューボリュームに対してクリップテストされる。位置がクリップされれば有効ビットはクリアされ、現在のラスタ位置は未定義となる。そうでなければ有効ビットが設定される。ラスタ位置が有効な場合、ラスタ位置に関連する色データは現在の色・インデックスから設定される
(ライティング有効時は通常の頂点と同様に計算される)。ラスタテクスチャ座標は現在のテクスチャ座標から変換される。関連情報は glGet
(GL_CURRENT_RASTER_POSITION / GL_CURRENT_RASTER_POSITION_VALID /
GL_CURRENT_RASTER_DISTANCE / GL_CURRENT_RASTER_COLOR /
GL_CURRENT_RASTER_INDEX / GL_CURRENT_RASTER_TEXTURE_COORDS) で取得できる。
このドキュメントは省略されている。


%index
glRasterPos2sv
ピクセル操作用のラスタ位置を指定する。| glRasterPos2sv 関数 (Gl.h)
%prm
v
v : [var] 現在のラスタ位置の x, y 座標を指定する 2 要素配列へのポインタ。
%inst
ピクセル操作用のラスタ位置を指定する。| glRasterPos2sv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
OpenGL はウィンドウ座標で 3D
位置を保持する。この位置をラスタ位置と呼び、サブピクセル精度で保持される。ピクセル・ビットマップ書き込み操作の位置決めに使われる
(glBitmap、glDrawPixels、glCopyPixels 参照)。現在のラスタ位置は 3 つのウィンドウ座標 (x, y,
z)、クリップ座標 w 値、アイ座標距離、有効ビット、関連する色データとテクスチャ座標から成る。w
座標はクリップ座標で、ウィンドウ座標に投影されない。glRasterPos4 は x, y, z, w
を指定する。glRasterPos3 は w=1、glRasterPos2 は z=0, w=1
で指定する。ラスタ位置の座標はモデルビュー行列とプロジェクション行列で変換され、通常の頂点と同様にビューボリュームに対してクリップテストされる。位置がクリップされれば有効ビットはクリアされ、現在のラスタ位置は未定義となる。そうでなければ有効ビットが設定される。ラスタ位置が有効な場合、ラスタ位置に関連する色データは現在の色・インデックスから設定される
(ライティング有効時は通常の頂点と同様に計算される)。ラスタテクスチャ座標は現在のテクスチャ座標から変換される。関連情報は glGet
(GL_CURRENT_RASTER_POSITION / GL_CURRENT_RASTER_POSITION_VALID /
GL_CURRENT_RASTER_DISTANCE / GL_CURRENT_RASTER_COLOR /
GL_CURRENT_RASTER_INDEX / GL_CURRENT_RASTER_TEXTURE_COORDS) で取得できる。
このドキュメントは省略されている。


%index
glRasterPos3d
ピクセル操作用のラスタ位置を指定する。| glRasterPos3d 関数 (Gl.h)
%prm
x, y, z
x : [double] 現在のラスタ位置の x 座標を指定する。
y : [double] 現在のラスタ位置の y 座標を指定する。
z : [double] 現在のラスタ位置の z 座標を指定する。
%inst
ピクセル操作用のラスタ位置を指定する。| glRasterPos3d 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
OpenGL はウィンドウ座標で 3D
位置を保持する。この位置をラスタ位置と呼び、サブピクセル精度で保持される。ピクセル・ビットマップ書き込み操作の位置決めに使われる
(glBitmap、glDrawPixels、glCopyPixels 参照)。現在のラスタ位置は 3 つのウィンドウ座標 (x, y,
z)、クリップ座標 w 値、アイ座標距離、有効ビット、関連する色データとテクスチャ座標から成る。w
座標はクリップ座標で、ウィンドウ座標に投影されない。glRasterPos4 は x, y, z, w
を指定する。glRasterPos3 は w=1、glRasterPos2 は z=0, w=1
で指定する。ラスタ位置の座標はモデルビュー行列とプロジェクション行列で変換され、通常の頂点と同様にビューボリュームに対してクリップテストされる。位置がクリップされれば有効ビットはクリアされ、現在のラスタ位置は未定義となる。そうでなければ有効ビットが設定される。ラスタ位置が有効な場合、ラスタ位置に関連する色データは現在の色・インデックスから設定される
(ライティング有効時は通常の頂点と同様に計算される)。ラスタテクスチャ座標は現在のテクスチャ座標から変換される。関連情報は glGet
(GL_CURRENT_RASTER_POSITION / GL_CURRENT_RASTER_POSITION_VALID /
GL_CURRENT_RASTER_DISTANCE / GL_CURRENT_RASTER_COLOR /
GL_CURRENT_RASTER_INDEX / GL_CURRENT_RASTER_TEXTURE_COORDS) で取得できる。
このドキュメントは省略されている。


%index
glRasterPos3dv
ピクセル操作用のラスタ位置を指定する。| glRasterPos3dv 関数 (Gl.h)
%prm
v
v : [var] 現在のラスタ位置の x, y, z 座標を指定する 3 要素配列へのポインタ。
%inst
ピクセル操作用のラスタ位置を指定する。| glRasterPos3dv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
OpenGL はウィンドウ座標で 3D
位置を保持する。この位置をラスタ位置と呼び、サブピクセル精度で保持される。ピクセル・ビットマップ書き込み操作の位置決めに使われる
(glBitmap、glDrawPixels、glCopyPixels 参照)。現在のラスタ位置は 3 つのウィンドウ座標 (x, y,
z)、クリップ座標 w 値、アイ座標距離、有効ビット、関連する色データとテクスチャ座標から成る。w
座標はクリップ座標で、ウィンドウ座標に投影されない。glRasterPos4 は x, y, z, w
を指定する。glRasterPos3 は w=1、glRasterPos2 は z=0, w=1
で指定する。ラスタ位置の座標はモデルビュー行列とプロジェクション行列で変換され、通常の頂点と同様にビューボリュームに対してクリップテストされる。位置がクリップされれば有効ビットはクリアされ、現在のラスタ位置は未定義となる。そうでなければ有効ビットが設定される。ラスタ位置が有効な場合、ラスタ位置に関連する色データは現在の色・インデックスから設定される
(ライティング有効時は通常の頂点と同様に計算される)。ラスタテクスチャ座標は現在のテクスチャ座標から変換される。関連情報は glGet
(GL_CURRENT_RASTER_POSITION / GL_CURRENT_RASTER_POSITION_VALID /
GL_CURRENT_RASTER_DISTANCE / GL_CURRENT_RASTER_COLOR /
GL_CURRENT_RASTER_INDEX / GL_CURRENT_RASTER_TEXTURE_COORDS) で取得できる。
このドキュメントは省略されている。


%index
glRasterPos3f
ピクセル操作用のラスタ位置を指定する。| glRasterPos3f 関数 (Gl.h)
%prm
x, y, z
x : [float] 現在のラスタ位置の x 座標を指定する。
y : [float] 現在のラスタ位置の y 座標を指定する。
z : [float] 現在のラスタ位置の z 座標を指定する。
%inst
ピクセル操作用のラスタ位置を指定する。| glRasterPos3f 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
OpenGL はウィンドウ座標で 3D
位置を保持する。この位置をラスタ位置と呼び、サブピクセル精度で保持される。ピクセル・ビットマップ書き込み操作の位置決めに使われる
(glBitmap、glDrawPixels、glCopyPixels 参照)。現在のラスタ位置は 3 つのウィンドウ座標 (x, y,
z)、クリップ座標 w 値、アイ座標距離、有効ビット、関連する色データとテクスチャ座標から成る。w
座標はクリップ座標で、ウィンドウ座標に投影されない。glRasterPos4 は x, y, z, w
を指定する。glRasterPos3 は w=1、glRasterPos2 は z=0, w=1
で指定する。ラスタ位置の座標はモデルビュー行列とプロジェクション行列で変換され、通常の頂点と同様にビューボリュームに対してクリップテストされる。位置がクリップされれば有効ビットはクリアされ、現在のラスタ位置は未定義となる。そうでなければ有効ビットが設定される。ラスタ位置が有効な場合、ラスタ位置に関連する色データは現在の色・インデックスから設定される
(ライティング有効時は通常の頂点と同様に計算される)。ラスタテクスチャ座標は現在のテクスチャ座標から変換される。関連情報は glGet
(GL_CURRENT_RASTER_POSITION / GL_CURRENT_RASTER_POSITION_VALID /
GL_CURRENT_RASTER_DISTANCE / GL_CURRENT_RASTER_COLOR /
GL_CURRENT_RASTER_INDEX / GL_CURRENT_RASTER_TEXTURE_COORDS) で取得できる。
このドキュメントは省略されている。


%index
glRasterPos3fv
ピクセル操作用のラスタ位置を指定する。| glRasterPos3fv 関数 (Gl.h)
%prm
v
v : [var] 現在のラスタ位置の x, y, z 座標を指定する 3 要素配列へのポインタ。
%inst
ピクセル操作用のラスタ位置を指定する。| glRasterPos3fv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
OpenGL はウィンドウ座標で 3D
位置を保持する。この位置をラスタ位置と呼び、サブピクセル精度で保持される。ピクセル・ビットマップ書き込み操作の位置決めに使われる
(glBitmap、glDrawPixels、glCopyPixels 参照)。現在のラスタ位置は 3 つのウィンドウ座標 (x, y,
z)、クリップ座標 w 値、アイ座標距離、有効ビット、関連する色データとテクスチャ座標から成る。w
座標はクリップ座標で、ウィンドウ座標に投影されない。glRasterPos4 は x, y, z, w
を指定する。glRasterPos3 は w=1、glRasterPos2 は z=0, w=1
で指定する。ラスタ位置の座標はモデルビュー行列とプロジェクション行列で変換され、通常の頂点と同様にビューボリュームに対してクリップテストされる。位置がクリップされれば有効ビットはクリアされ、現在のラスタ位置は未定義となる。そうでなければ有効ビットが設定される。ラスタ位置が有効な場合、ラスタ位置に関連する色データは現在の色・インデックスから設定される
(ライティング有効時は通常の頂点と同様に計算される)。ラスタテクスチャ座標は現在のテクスチャ座標から変換される。関連情報は glGet
(GL_CURRENT_RASTER_POSITION / GL_CURRENT_RASTER_POSITION_VALID /
GL_CURRENT_RASTER_DISTANCE / GL_CURRENT_RASTER_COLOR /
GL_CURRENT_RASTER_INDEX / GL_CURRENT_RASTER_TEXTURE_COORDS) で取得できる。
このドキュメントは省略されている。


%index
glRasterPos3i
ピクセル操作用のラスタ位置を指定する。| glRasterPos3i 関数 (Gl.h)
%prm
x, y, z
x : [int] 現在のラスタ位置の x 座標を指定する。
y : [int] 現在のラスタ位置の y 座標を指定する。
z : [int] 現在のラスタ位置の z 座標を指定する。
%inst
ピクセル操作用のラスタ位置を指定する。| glRasterPos3i 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
OpenGL はウィンドウ座標で 3D
位置を保持する。この位置をラスタ位置と呼び、サブピクセル精度で保持される。ピクセル・ビットマップ書き込み操作の位置決めに使われる
(glBitmap、glDrawPixels、glCopyPixels 参照)。現在のラスタ位置は 3 つのウィンドウ座標 (x, y,
z)、クリップ座標 w 値、アイ座標距離、有効ビット、関連する色データとテクスチャ座標から成る。w
座標はクリップ座標で、ウィンドウ座標に投影されない。glRasterPos4 は x, y, z, w
を指定する。glRasterPos3 は w=1、glRasterPos2 は z=0, w=1
で指定する。ラスタ位置の座標はモデルビュー行列とプロジェクション行列で変換され、通常の頂点と同様にビューボリュームに対してクリップテストされる。位置がクリップされれば有効ビットはクリアされ、現在のラスタ位置は未定義となる。そうでなければ有効ビットが設定される。ラスタ位置が有効な場合、ラスタ位置に関連する色データは現在の色・インデックスから設定される
(ライティング有効時は通常の頂点と同様に計算される)。ラスタテクスチャ座標は現在のテクスチャ座標から変換される。関連情報は glGet
(GL_CURRENT_RASTER_POSITION / GL_CURRENT_RASTER_POSITION_VALID /
GL_CURRENT_RASTER_DISTANCE / GL_CURRENT_RASTER_COLOR /
GL_CURRENT_RASTER_INDEX / GL_CURRENT_RASTER_TEXTURE_COORDS) で取得できる。
このドキュメントは省略されている。


%index
glRasterPos3iv
ピクセル操作用のラスタ位置を指定する。| glRasterPos3iv 関数 (Gl.h)
%prm
v
v : [var] 現在のラスタ位置の x, y, z 座標を指定する 3 要素配列へのポインタ。
%inst
ピクセル操作用のラスタ位置を指定する。| glRasterPos3iv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
OpenGL はウィンドウ座標で 3D
位置を保持する。この位置をラスタ位置と呼び、サブピクセル精度で保持される。ピクセル・ビットマップ書き込み操作の位置決めに使われる
(glBitmap、glDrawPixels、glCopyPixels 参照)。現在のラスタ位置は 3 つのウィンドウ座標 (x, y,
z)、クリップ座標 w 値、アイ座標距離、有効ビット、関連する色データとテクスチャ座標から成る。w
座標はクリップ座標で、ウィンドウ座標に投影されない。glRasterPos4 は x, y, z, w
を指定する。glRasterPos3 は w=1、glRasterPos2 は z=0, w=1
で指定する。ラスタ位置の座標はモデルビュー行列とプロジェクション行列で変換され、通常の頂点と同様にビューボリュームに対してクリップテストされる。位置がクリップされれば有効ビットはクリアされ、現在のラスタ位置は未定義となる。そうでなければ有効ビットが設定される。ラスタ位置が有効な場合、ラスタ位置に関連する色データは現在の色・インデックスから設定される
(ライティング有効時は通常の頂点と同様に計算される)。ラスタテクスチャ座標は現在のテクスチャ座標から変換される。関連情報は glGet
(GL_CURRENT_RASTER_POSITION / GL_CURRENT_RASTER_POSITION_VALID /
GL_CURRENT_RASTER_DISTANCE / GL_CURRENT_RASTER_COLOR /
GL_CURRENT_RASTER_INDEX / GL_CURRENT_RASTER_TEXTURE_COORDS) で取得できる。
このドキュメントは省略されている。


%index
glRasterPos3s
ピクセル操作用のラスタ位置を指定する。| glRasterPos3s 関数 (Gl.h)
%prm
x, y, z
x : [int] 現在のラスタ位置の x 座標を指定する。
y : [int] 現在のラスタ位置の y 座標を指定する。
z : [int] 現在のラスタ位置の z 座標を指定する。
%inst
ピクセル操作用のラスタ位置を指定する。| glRasterPos3s 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
OpenGL はウィンドウ座標で 3D
位置を保持する。この位置をラスタ位置と呼び、サブピクセル精度で保持される。ピクセル・ビットマップ書き込み操作の位置決めに使われる
(glBitmap、glDrawPixels、glCopyPixels 参照)。現在のラスタ位置は 3 つのウィンドウ座標 (x, y,
z)、クリップ座標 w 値、アイ座標距離、有効ビット、関連する色データとテクスチャ座標から成る。w
座標はクリップ座標で、ウィンドウ座標に投影されない。glRasterPos4 は x, y, z, w
を指定する。glRasterPos3 は w=1、glRasterPos2 は z=0, w=1
で指定する。ラスタ位置の座標はモデルビュー行列とプロジェクション行列で変換され、通常の頂点と同様にビューボリュームに対してクリップテストされる。位置がクリップされれば有効ビットはクリアされ、現在のラスタ位置は未定義となる。そうでなければ有効ビットが設定される。ラスタ位置が有効な場合、ラスタ位置に関連する色データは現在の色・インデックスから設定される
(ライティング有効時は通常の頂点と同様に計算される)。ラスタテクスチャ座標は現在のテクスチャ座標から変換される。関連情報は glGet
(GL_CURRENT_RASTER_POSITION / GL_CURRENT_RASTER_POSITION_VALID /
GL_CURRENT_RASTER_DISTANCE / GL_CURRENT_RASTER_COLOR /
GL_CURRENT_RASTER_INDEX / GL_CURRENT_RASTER_TEXTURE_COORDS) で取得できる。
このドキュメントは省略されている。


%index
glRasterPos3sv
ピクセル操作用のラスタ位置を指定する。| glRasterPos3sv 関数 (Gl.h)
%prm
v
v : [var] 現在のラスタ位置の x, y, z 座標を指定する 3 要素配列へのポインタ。
%inst
ピクセル操作用のラスタ位置を指定する。| glRasterPos3sv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
OpenGL はウィンドウ座標で 3D
位置を保持する。この位置をラスタ位置と呼び、サブピクセル精度で保持される。ピクセル・ビットマップ書き込み操作の位置決めに使われる
(glBitmap、glDrawPixels、glCopyPixels 参照)。現在のラスタ位置は 3 つのウィンドウ座標 (x, y,
z)、クリップ座標 w 値、アイ座標距離、有効ビット、関連する色データとテクスチャ座標から成る。w
座標はクリップ座標で、ウィンドウ座標に投影されない。glRasterPos4 は x, y, z, w
を指定する。glRasterPos3 は w=1、glRasterPos2 は z=0, w=1
で指定する。ラスタ位置の座標はモデルビュー行列とプロジェクション行列で変換され、通常の頂点と同様にビューボリュームに対してクリップテストされる。位置がクリップされれば有効ビットはクリアされ、現在のラスタ位置は未定義となる。そうでなければ有効ビットが設定される。ラスタ位置が有効な場合、ラスタ位置に関連する色データは現在の色・インデックスから設定される
(ライティング有効時は通常の頂点と同様に計算される)。ラスタテクスチャ座標は現在のテクスチャ座標から変換される。関連情報は glGet
(GL_CURRENT_RASTER_POSITION / GL_CURRENT_RASTER_POSITION_VALID /
GL_CURRENT_RASTER_DISTANCE / GL_CURRENT_RASTER_COLOR /
GL_CURRENT_RASTER_INDEX / GL_CURRENT_RASTER_TEXTURE_COORDS) で取得できる。
このドキュメントは省略されている。


%index
glRasterPos4d
ピクセル操作用のラスタ位置を指定する。| glRasterPos4d 関数 (Gl.h)
%prm
x, y, z, w
x : [double] 現在のラスタ位置の x 座標を指定する。
y : [double] 現在のラスタ位置の y 座標を指定する。
z : [double] 現在のラスタ位置の z 座標を指定する。
w : [double] 現在のラスタ位置の w 座標。
%inst
ピクセル操作用のラスタ位置を指定する。| glRasterPos4d 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
OpenGL はウィンドウ座標で 3D
位置を保持する。この位置をラスタ位置と呼び、サブピクセル精度で保持される。ピクセル・ビットマップ書き込み操作の位置決めに使われる
(glBitmap、glDrawPixels、glCopyPixels 参照)。現在のラスタ位置は 3 つのウィンドウ座標 (x, y,
z)、クリップ座標 w 値、アイ座標距離、有効ビット、関連する色データとテクスチャ座標から成る。w
座標はクリップ座標で、ウィンドウ座標に投影されない。glRasterPos4 は x, y, z, w
を指定する。glRasterPos3 は w=1、glRasterPos2 は z=0, w=1
で指定する。ラスタ位置の座標はモデルビュー行列とプロジェクション行列で変換され、通常の頂点と同様にビューボリュームに対してクリップテストされる。位置がクリップされれば有効ビットはクリアされ、現在のラスタ位置は未定義となる。そうでなければ有効ビットが設定される。ラスタ位置が有効な場合、ラスタ位置に関連する色データは現在の色・インデックスから設定される
(ライティング有効時は通常の頂点と同様に計算される)。ラスタテクスチャ座標は現在のテクスチャ座標から変換される。関連情報は glGet
(GL_CURRENT_RASTER_POSITION / GL_CURRENT_RASTER_POSITION_VALID /
GL_CURRENT_RASTER_DISTANCE / GL_CURRENT_RASTER_COLOR /
GL_CURRENT_RASTER_INDEX / GL_CURRENT_RASTER_TEXTURE_COORDS) で取得できる。
このドキュメントは省略されている。


%index
glRasterPos4dv
ピクセル操作用のラスタ位置を指定する。| glRasterPos4dv 関数 (Gl.h)
%prm
v
v : [var] 現在のラスタ位置の x, y, z, w 座標を指定する 4 要素配列へのポインタ。
%inst
ピクセル操作用のラスタ位置を指定する。| glRasterPos4dv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
OpenGL はウィンドウ座標で 3D
位置を保持する。この位置をラスタ位置と呼び、サブピクセル精度で保持される。ピクセル・ビットマップ書き込み操作の位置決めに使われる
(glBitmap、glDrawPixels、glCopyPixels 参照)。現在のラスタ位置は 3 つのウィンドウ座標 (x, y,
z)、クリップ座標 w 値、アイ座標距離、有効ビット、関連する色データとテクスチャ座標から成る。w
座標はクリップ座標で、ウィンドウ座標に投影されない。glRasterPos4 は x, y, z, w
を指定する。glRasterPos3 は w=1、glRasterPos2 は z=0, w=1
で指定する。ラスタ位置の座標はモデルビュー行列とプロジェクション行列で変換され、通常の頂点と同様にビューボリュームに対してクリップテストされる。位置がクリップされれば有効ビットはクリアされ、現在のラスタ位置は未定義となる。そうでなければ有効ビットが設定される。ラスタ位置が有効な場合、ラスタ位置に関連する色データは現在の色・インデックスから設定される
(ライティング有効時は通常の頂点と同様に計算される)。ラスタテクスチャ座標は現在のテクスチャ座標から変換される。関連情報は glGet
(GL_CURRENT_RASTER_POSITION / GL_CURRENT_RASTER_POSITION_VALID /
GL_CURRENT_RASTER_DISTANCE / GL_CURRENT_RASTER_COLOR /
GL_CURRENT_RASTER_INDEX / GL_CURRENT_RASTER_TEXTURE_COORDS) で取得できる。
このドキュメントは省略されている。


%index
glRasterPos4f
ピクセル操作用のラスタ位置を指定する。| glRasterPos4f 関数 (Gl.h)
%prm
x, y, z, w
x : [float] 現在のラスタ位置の x 座標を指定する。
y : [float] 現在のラスタ位置の y 座標を指定する。
z : [float] 現在のラスタ位置の z 座標を指定する。
w : [float] 現在のラスタ位置の w 座標。
%inst
ピクセル操作用のラスタ位置を指定する。| glRasterPos4f 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
OpenGL はウィンドウ座標で 3D
位置を保持する。この位置をラスタ位置と呼び、サブピクセル精度で保持される。ピクセル・ビットマップ書き込み操作の位置決めに使われる
(glBitmap、glDrawPixels、glCopyPixels 参照)。現在のラスタ位置は 3 つのウィンドウ座標 (x, y,
z)、クリップ座標 w 値、アイ座標距離、有効ビット、関連する色データとテクスチャ座標から成る。w
座標はクリップ座標で、ウィンドウ座標に投影されない。glRasterPos4 は x, y, z, w
を指定する。glRasterPos3 は w=1、glRasterPos2 は z=0, w=1
で指定する。ラスタ位置の座標はモデルビュー行列とプロジェクション行列で変換され、通常の頂点と同様にビューボリュームに対してクリップテストされる。位置がクリップされれば有効ビットはクリアされ、現在のラスタ位置は未定義となる。そうでなければ有効ビットが設定される。ラスタ位置が有効な場合、ラスタ位置に関連する色データは現在の色・インデックスから設定される
(ライティング有効時は通常の頂点と同様に計算される)。ラスタテクスチャ座標は現在のテクスチャ座標から変換される。関連情報は glGet
(GL_CURRENT_RASTER_POSITION / GL_CURRENT_RASTER_POSITION_VALID /
GL_CURRENT_RASTER_DISTANCE / GL_CURRENT_RASTER_COLOR /
GL_CURRENT_RASTER_INDEX / GL_CURRENT_RASTER_TEXTURE_COORDS) で取得できる。
このドキュメントは省略されている。


%index
glRasterPos4fv
ピクセル操作用のラスタ位置を指定する。| glRasterPos4fv 関数 (Gl.h)
%prm
v
v : [var] 現在のラスタ位置の x, y, z, w 座標を指定する 4 要素配列へのポインタ。
%inst
ピクセル操作用のラスタ位置を指定する。| glRasterPos4fv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
OpenGL はウィンドウ座標で 3D
位置を保持する。この位置をラスタ位置と呼び、サブピクセル精度で保持される。ピクセル・ビットマップ書き込み操作の位置決めに使われる
(glBitmap、glDrawPixels、glCopyPixels 参照)。現在のラスタ位置は 3 つのウィンドウ座標 (x, y,
z)、クリップ座標 w 値、アイ座標距離、有効ビット、関連する色データとテクスチャ座標から成る。w
座標はクリップ座標で、ウィンドウ座標に投影されない。glRasterPos4 は x, y, z, w
を指定する。glRasterPos3 は w=1、glRasterPos2 は z=0, w=1
で指定する。ラスタ位置の座標はモデルビュー行列とプロジェクション行列で変換され、通常の頂点と同様にビューボリュームに対してクリップテストされる。位置がクリップされれば有効ビットはクリアされ、現在のラスタ位置は未定義となる。そうでなければ有効ビットが設定される。ラスタ位置が有効な場合、ラスタ位置に関連する色データは現在の色・インデックスから設定される
(ライティング有効時は通常の頂点と同様に計算される)。ラスタテクスチャ座標は現在のテクスチャ座標から変換される。関連情報は glGet
(GL_CURRENT_RASTER_POSITION / GL_CURRENT_RASTER_POSITION_VALID /
GL_CURRENT_RASTER_DISTANCE / GL_CURRENT_RASTER_COLOR /
GL_CURRENT_RASTER_INDEX / GL_CURRENT_RASTER_TEXTURE_COORDS) で取得できる。
このドキュメントは省略されている。


%index
glRasterPos4i
ピクセル操作用のラスタ位置を指定する。| glRasterPos4i 関数 (Gl.h)
%prm
x, y, z, w
x : [int] 現在のラスタ位置の x 座標を指定する。
y : [int] 現在のラスタ位置の y 座標を指定する。
z : [int] 現在のラスタ位置の z 座標を指定する。
w : [int] 現在のラスタ位置の w 座標。
%inst
ピクセル操作用のラスタ位置を指定する。| glRasterPos4i 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
OpenGL はウィンドウ座標で 3D
位置を保持する。この位置をラスタ位置と呼び、サブピクセル精度で保持される。ピクセル・ビットマップ書き込み操作の位置決めに使われる
(glBitmap、glDrawPixels、glCopyPixels 参照)。現在のラスタ位置は 3 つのウィンドウ座標 (x, y,
z)、クリップ座標 w 値、アイ座標距離、有効ビット、関連する色データとテクスチャ座標から成る。w
座標はクリップ座標で、ウィンドウ座標に投影されない。glRasterPos4 は x, y, z, w
を指定する。glRasterPos3 は w=1、glRasterPos2 は z=0, w=1
で指定する。ラスタ位置の座標はモデルビュー行列とプロジェクション行列で変換され、通常の頂点と同様にビューボリュームに対してクリップテストされる。位置がクリップされれば有効ビットはクリアされ、現在のラスタ位置は未定義となる。そうでなければ有効ビットが設定される。ラスタ位置が有効な場合、ラスタ位置に関連する色データは現在の色・インデックスから設定される
(ライティング有効時は通常の頂点と同様に計算される)。ラスタテクスチャ座標は現在のテクスチャ座標から変換される。関連情報は glGet
(GL_CURRENT_RASTER_POSITION / GL_CURRENT_RASTER_POSITION_VALID /
GL_CURRENT_RASTER_DISTANCE / GL_CURRENT_RASTER_COLOR /
GL_CURRENT_RASTER_INDEX / GL_CURRENT_RASTER_TEXTURE_COORDS) で取得できる。
このドキュメントは省略されている。


%index
glRasterPos4iv
ピクセル操作用のラスタ位置を指定する。| glRasterPos4iv 関数 (Gl.h)
%prm
v
v : [var] 現在のラスタ位置の x, y, z, w 座標を指定する 4 要素配列へのポインタ。
%inst
ピクセル操作用のラスタ位置を指定する。| glRasterPos4iv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
OpenGL はウィンドウ座標で 3D
位置を保持する。この位置をラスタ位置と呼び、サブピクセル精度で保持される。ピクセル・ビットマップ書き込み操作の位置決めに使われる
(glBitmap、glDrawPixels、glCopyPixels 参照)。現在のラスタ位置は 3 つのウィンドウ座標 (x, y,
z)、クリップ座標 w 値、アイ座標距離、有効ビット、関連する色データとテクスチャ座標から成る。w
座標はクリップ座標で、ウィンドウ座標に投影されない。glRasterPos4 は x, y, z, w
を指定する。glRasterPos3 は w=1、glRasterPos2 は z=0, w=1
で指定する。ラスタ位置の座標はモデルビュー行列とプロジェクション行列で変換され、通常の頂点と同様にビューボリュームに対してクリップテストされる。位置がクリップされれば有効ビットはクリアされ、現在のラスタ位置は未定義となる。そうでなければ有効ビットが設定される。ラスタ位置が有効な場合、ラスタ位置に関連する色データは現在の色・インデックスから設定される
(ライティング有効時は通常の頂点と同様に計算される)。ラスタテクスチャ座標は現在のテクスチャ座標から変換される。関連情報は glGet
(GL_CURRENT_RASTER_POSITION / GL_CURRENT_RASTER_POSITION_VALID /
GL_CURRENT_RASTER_DISTANCE / GL_CURRENT_RASTER_COLOR /
GL_CURRENT_RASTER_INDEX / GL_CURRENT_RASTER_TEXTURE_COORDS) で取得できる。
このドキュメントは省略されている。


%index
glRasterPos4s
ピクセル操作用のラスタ位置を指定する。| glRasterPos4s 関数 (Gl.h)
%prm
x, y, z, w
x : [int] 現在のラスタ位置の x 座標を指定する。
y : [int] 現在のラスタ位置の y 座標を指定する。
z : [int] 現在のラスタ位置の z 座標を指定する。
w : [int] 現在のラスタ位置の w 座標。
%inst
ピクセル操作用のラスタ位置を指定する。| glRasterPos4s 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
OpenGL はウィンドウ座標の 3D
位置を保持する。この位置はラスタ位置と呼ばれ、サブピクセル精度で保持される。ピクセルやビットマップの書き込み操作の位置決めに使われる
(glBitmap、glDrawPixels、glCopyPixels 参照)。現在のラスタ位置は 3 つのウィンドウ座標 (x, y,
z)、クリップ座標 w 値、アイ座標距離、有効ビット、関連するカラーデータとテクスチャ座標から構成される。w
はクリップ座標であり、ウィンドウ座標へは射影されない。glRasterPos4 はオブジェクト座標 x, y, z, w
を明示的に指定する。glRasterPos3 は w が暗黙的に 1 に設定され、glRasterPos2 は z=0、w=1
に設定される。glRasterPos が提示するオブジェクト座標は glVertex
と同様に扱われ、現在のモデルビュー行列と投影行列で変換されてクリッピング段階に渡される。頂点がカリングされなければウィンドウ座標に射影・スケールされ、それが新しい現在のラスタ位置となり
GL_CURRENT_RASTER_POSITION_VALID
フラグが設定される。カリングされた場合は有効ビットがクリアされ、ラスタ位置と関連色/テクスチャ座標は未定義になる。ライティングが有効な場合、GL_CURRENT_RASTER_COLOR
(RGBA モード) または GL_CURRENT_RASTER_INDEX (カラーインデックスモード)
はライティング計算結果の色に設定される。ライティング無効時は現在のカラー (GL_CURRENT_COLOR) またはカラーインデックス
(GL_CURRENT_INDEX) で更新される。同様に GL_CURRENT_RASTER_TEXTURE_COORDS
はテクスチャ行列とテクスチャ生成関数に基づいて GL_CURRENT_TEXTURE_COORDS
から更新される。最後に、モデルビュー行列のみで変換した頂点の原点からの距離が GL_CURRENT_RASTER_DISTANCE
を置き換える。初期値はラスタ位置 (0,0,0,1)、距離 0、有効ビットあり、RGBA (1,1,1,1)、カラーインデックス
1、テクスチャ座標 (0,0,0,1)。注意: ラスタ位置は glRasterPos と glBitmap
の両方で変更される。ラスタ位置座標が無効な場合、ラスタ位置に基づく描画コマンドは無視される。関連情報は glGet
(GL_CURRENT_RASTER_POSITION / _VALID / _DISTANCE / _COLOR / _INDEX /
_TEXTURE_COORDS) で取得できる。


%index
glRasterPos4sv
ピクセル操作用のラスタ位置を指定する。| glRasterPos4sv 関数 (Gl.h)
%prm
v
v : [var] 現在のラスタ位置の x, y, z, w 座標を指定する 4 要素配列へのポインタ。
%inst
ピクセル操作用のラスタ位置を指定する。| glRasterPos4sv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
OpenGL はウィンドウ座標の 3D
位置を保持する。この位置はラスタ位置と呼ばれ、サブピクセル精度で保持される。ピクセルやビットマップの書き込み操作の位置決めに使われる
(glBitmap、glDrawPixels、glCopyPixels 参照)。現在のラスタ位置は 3 つのウィンドウ座標 (x, y,
z)、クリップ座標 w 値、アイ座標距離、有効ビット、関連するカラーデータとテクスチャ座標から構成される。w
はクリップ座標であり、ウィンドウ座標へは射影されない。glRasterPos4 はオブジェクト座標 x, y, z, w
を明示的に指定する。glRasterPos3 は w が暗黙的に 1 に設定され、glRasterPos2 は z=0、w=1
に設定される。glRasterPos が提示するオブジェクト座標は glVertex
と同様に扱われ、現在のモデルビュー行列と投影行列で変換されてクリッピング段階に渡される。頂点がカリングされなければウィンドウ座標に射影・スケールされ、それが新しい現在のラスタ位置となり
GL_CURRENT_RASTER_POSITION_VALID
フラグが設定される。カリングされた場合は有効ビットがクリアされ、ラスタ位置と関連色/テクスチャ座標は未定義になる。ライティングが有効な場合、GL_CURRENT_RASTER_COLOR
(RGBA モード) または GL_CURRENT_RASTER_INDEX (カラーインデックスモード)
はライティング計算結果の色に設定される。ライティング無効時は現在のカラー (GL_CURRENT_COLOR) またはカラーインデックス
(GL_CURRENT_INDEX) で更新される。同様に GL_CURRENT_RASTER_TEXTURE_COORDS
はテクスチャ行列とテクスチャ生成関数に基づいて GL_CURRENT_TEXTURE_COORDS
から更新される。最後に、モデルビュー行列のみで変換した頂点の原点からの距離が GL_CURRENT_RASTER_DISTANCE
を置き換える。初期値はラスタ位置 (0,0,0,1)、距離 0、有効ビットあり、RGBA (1,1,1,1)、カラーインデックス
1、テクスチャ座標 (0,0,0,1)。注意: ラスタ位置は glRasterPos と glBitmap
の両方で変更される。ラスタ位置座標が無効な場合、ラスタ位置に基づく描画コマンドは無視される。関連情報は glGet
(GL_CURRENT_RASTER_POSITION / _VALID / _DISTANCE / _COLOR / _INDEX /
_TEXTURE_COORDS) で取得できる。


%index
glReadBuffer
glReadBuffer 関数はピクセル用のカラーバッファソースを選択する。
%prm
mode
mode : [int] カラーバッファ。受け付ける値は GL_FRONT_LEFT、GL_FRONT_RIGHT、GL_BACK_LEFT、GL_BACK_RIGHT、GL_FRONT、GL_BACK、GL_LEFT、GL_RIGHT、GL_AUX i (i は 0 から GL_AUX_BUFFERS-1 の範囲)。
%inst
glReadBuffer 関数はピクセル用のカラーバッファソースを選択する。

[戻り値]
この関数は値を返さない。

[備考]
glReadBuffer は後続の glReadPixels と glCopyPixels
のソースとなるカラーバッファを指定する。mode は 12 種類以上の定義済み値のいずれかを受け付ける (GL_AUX0~GL_AUX3
は常に定義される)。完全に構成されたシステムでは GL_FRONT、GL_LEFT、GL_FRONT_LEFT は front-left
バッファを、GL_FRONT_RIGHT と GL_RIGHT は front-right を、GL_BACK_LEFT と
GL_BACK は back-left を指す。非ステレオダブルバッファ構成は front-left と back-left
のみ、シングルバッファ構成はステレオなら front-left/right、非ステレオなら front-left
のみを持つ。存在しないバッファを指定するとエラーになる。既定値はシングルバッファ構成で GL_FRONT、ダブルバッファ構成で
GL_BACK。関連情報は glGet (GL_READ_BUFFER) で取得できる。


%index
glReadPixels
glReadPixels 関数はフレームバッファからピクセルブロックを読み込む。
%prm
x, y, width, height, format, type, pixels
x : [int] フレームバッファから読まれる最初のピクセルのウィンドウ x 座標。y 座標と合わせて矩形ピクセルブロックの左下隅の位置を指定する。
y : [int] フレームバッファから読まれる最初のピクセルのウィンドウ y 座標。x 座標と合わせて矩形ピクセルブロックの左下隅の位置を指定する。
width : [int] ピクセル矩形の幅。
height : [int] ピクセル矩形の高さ。width / height が 1 の場合は単一ピクセルに対応する。
format : [int] ピクセルデータのフォーマット。受け付ける主な値: GL_COLOR_INDEX (カラーインデックス。固定小数化、GL_INDEX_SHIFT/OFFSET 適用後 GL_PIXEL_MAP_I_TO_R/G/B/A で色成分に変換)、GL_STENCIL_INDEX (ステンシル値。glReadPixels 用)、GL_DEPTH_COMPONENT (デプス値。浮動小数化し GL_DEPTH_SCALE/BIAS を適用後 [0,1] にクランプ)、GL_RED/GL_GREEN/GL_BLUE/GL_ALPHA (それぞれ単一成分を浮動小数化して RGBA 要素に組み立て、scale/bias 適用後クランプ)、GL_RGB (RGB トリプル)、GL_RGBA (完全 RGBA)、GL_BGR_EXT/GL_BGRA_EXT (Windows DIB のメモリレイアウトに一致するフォーマット)、GL_LUMINANCE (単一輝度値を R/G/B に複製しアルファに 1.0 を付加)、GL_LUMINANCE_ALPHA (輝度/アルファペア)。
type : [int] ピクセルデータのデータ型。次のいずれかを指定する: GL_UNSIGNED_BYTE、GL_BYTE、GL_BITMAP、GL_UNSIGNED_SHORT、GL_SHORT、GL_UNSIGNED_INT、GL_INT、GL_FLOAT。それぞれのインデックスマスクと成分変換式は元の表を参照。
pixels : [intptr] ピクセルデータを返す。
%inst
glReadPixels 関数はフレームバッファからピクセルブロックを読み込む。

[戻り値]
この関数は値を返さない。


%index
glRectd
glRectd 関数は矩形を描画する。
%prm
x1, y1, x2, y2
x1 : [double] 矩形の頂点の x 座標。
y1 : [double] 矩形の頂点の y 座標。
x2 : [double] 矩形の対頂点の x 座標。
y2 : [double] 矩形の対頂点の y 座標。
%inst
glRectd 関数は矩形を描画する。

[戻り値]
この関数は値を返さない。

[備考]
glRectd は 2 つのコーナー点として矩形を効率的に指定する。各 rect コマンドは 4 引数を取り、(x, y) の連続ペア 2
組または (x, y) ペアを含む配列へのポインタ 2 つとして整理される。生成される矩形は z=0
平面に定義される。glRectd(x1,y1,x2,y2) は次のシーケンスと完全に等価である: glBegin(GL_POLYGON);
glVertex2(x1,y1); glVertex2(x2,y1); glVertex2(x2,y2);
glVertex2(x1,y2); glEnd();。第 2 頂点が第 1 頂点の右上にあれば矩形は反時計回りで構築される点に注意。


%index
glRectdv
glRectdv 関数は矩形を描画する。
%prm
v1, v2
v1 : [var] 矩形の一方の頂点へのポインタ。
v2 : [var] 矩形の対頂点へのポインタ。
%inst
glRectdv 関数は矩形を描画する。

[戻り値]
この関数は値を返さない。

[備考]
glRectd は 2 つのコーナー点として矩形を効率的に指定する。各 rect コマンドは 4 引数を取り、(x, y) の連続ペア 2
組または (x, y) ペアを含む配列へのポインタ 2 つとして整理される。生成される矩形は z=0
平面に定義される。glRectd(x1,y1,x2,y2) は次のシーケンスと完全に等価である: glBegin(GL_POLYGON);
glVertex2(x1,y1); glVertex2(x2,y1); glVertex2(x2,y2);
glVertex2(x1,y2); glEnd();。第 2 頂点が第 1 頂点の右上にあれば矩形は反時計回りで構築される点に注意。


%index
glRectf
glRectf 関数は矩形を描画する。
%prm
x1, y1, x2, y2
x1 : [float] 矩形の頂点の x 座標。
y1 : [float] 矩形の頂点の y 座標。
x2 : [float] 矩形の対頂点の x 座標。
y2 : [float] 矩形の対頂点の y 座標。
%inst
glRectf 関数は矩形を描画する。

[戻り値]
この関数は値を返さない。

[備考]
glRectf は 2 つのコーナー点として矩形を効率的に指定する。各 rect コマンドは 4 引数を取り、(x, y) の連続ペア 2
組または (x, y) ペアを含む配列へのポインタ 2 つとして整理される。生成される矩形は z=0
平面に定義される。glRectf(x1,y1,x2,y2) は次のシーケンスと完全に等価である: glBegin(GL_POLYGON);
glVertex2(x1,y1); glVertex2(x2,y1); glVertex2(x2,y2);
glVertex2(x1,y2); glEnd();。第 2 頂点が第 1 頂点の右上にあれば矩形は反時計回りで構築される点に注意。


%index
glRectfv
glRectfv 関数は矩形を描画する。
%prm
v1, v2
v1 : [var] 矩形の一方の頂点へのポインタ。
v2 : [var] 矩形の対頂点へのポインタ。
%inst
glRectfv 関数は矩形を描画する。

[戻り値]
この関数は値を返さない。

[備考]
glRectf は 2 つのコーナー点として矩形を効率的に指定する。各 rect コマンドは 4 引数を取り、(x, y) の連続ペア 2
組または (x, y) ペアを含む配列へのポインタ 2 つとして整理される。生成される矩形は z=0
平面に定義される。glRectf(x1,y1,x2,y2) は次のシーケンスと完全に等価である: glBegin(GL_POLYGON);
glVertex2(x1,y1); glVertex2(x2,y1); glVertex2(x2,y2);
glVertex2(x1,y2); glEnd();。第 2 頂点が第 1 頂点の右上にあれば矩形は反時計回りで構築される点に注意。


%index
glRecti
glRecti 関数は矩形を描画する。
%prm
x1, y1, x2, y2
x1 : [int] 矩形の頂点の x 座標。
y1 : [int] 矩形の頂点の y 座標。
x2 : [int] 矩形の対頂点の x 座標。
y2 : [int] 矩形の対頂点の y 座標。
%inst
glRecti 関数は矩形を描画する。

[戻り値]
この関数は値を返さない。

[備考]
glRecti は 2 つのコーナー点として矩形を効率的に指定する。各 rect コマンドは 4 引数を取り、(x, y) の連続ペア 2
組または (x, y) ペアを含む配列へのポインタ 2 つとして整理される。生成される矩形は z=0
平面に定義される。glRecti(x1,y1,x2,y2) は次のシーケンスと完全に等価である: glBegin(GL_POLYGON);
glVertex2(x1,y1); glVertex2(x2,y1); glVertex2(x2,y2);
glVertex2(x1,y2); glEnd();。第 2 頂点が第 1 頂点の右上にあれば矩形は反時計回りで構築される点に注意。


%index
glRectiv
glRectiv 関数は矩形を描画する。
%prm
v1, v2
v1 : [var] 矩形の一方の頂点へのポインタ。
v2 : [var] 矩形の対頂点へのポインタ。
%inst
glRectiv 関数は矩形を描画する。

[戻り値]
この関数は値を返さない。

[備考]
glRecti は 2 つのコーナー点として矩形を効率的に指定する。各 rect コマンドは 4 引数を取り、(x, y) の連続ペア 2
組または (x, y) ペアを含む配列へのポインタ 2 つとして整理される。生成される矩形は z=0
平面に定義される。glRecti(x1,y1,x2,y2) は次のシーケンスと完全に等価である: glBegin(GL_POLYGON);
glVertex2(x1,y1); glVertex2(x2,y1); glVertex2(x2,y2);
glVertex2(x1,y2); glEnd();。第 2 頂点が第 1 頂点の右上にあれば矩形は反時計回りで構築される点に注意。


%index
glRects
glRects 関数は矩形を描画する。
%prm
x1, y1, x2, y2
x1 : [int] 矩形の頂点の x 座標。
y1 : [int] 矩形の頂点の y 座標。
x2 : [int] 矩形の対頂点の x 座標。
y2 : [int] 矩形の対頂点の y 座標。
%inst
glRects 関数は矩形を描画する。

[戻り値]
この関数は値を返さない。

[備考]
glRects は 2 つのコーナー点として矩形を効率的に指定する。各 rect コマンドは 4 引数を取り、(x, y) の連続ペア 2
組または (x, y) ペアを含む配列へのポインタ 2 つとして整理される。生成される矩形は z=0
平面に定義される。glRects(x1,y1,x2,y2) は次のシーケンスと完全に等価である: glBegin(GL_POLYGON);
glVertex2(x1,y1); glVertex2(x2,y1); glVertex2(x2,y2);
glVertex2(x1,y2); glEnd();。第 2 頂点が第 1 頂点の右上にあれば矩形は反時計回りで構築される点に注意。


%index
glRectsv
glRectsv 関数は矩形を描画する。
%prm
v1, v2
v1 : [var] 矩形の一方の頂点へのポインタ。
v2 : [var] 矩形の対頂点へのポインタ。
%inst
glRectsv 関数は矩形を描画する。

[戻り値]
この関数は値を返さない。

[備考]
glRects は 2 つのコーナー点として矩形を効率的に指定する。各 rect コマンドは 4 引数を取り、(x, y) の連続ペア 2
組または (x, y) ペアを含む配列へのポインタ 2 つとして整理される。生成される矩形は z=0
平面に定義される。glRects(x1,y1,x2,y2) は次のシーケンスと完全に等価である: glBegin(GL_POLYGON);
glVertex2(x1,y1); glVertex2(x2,y1); glVertex2(x2,y2);
glVertex2(x1,y2); glEnd();。第 2 頂点が第 1 頂点の右上にあれば矩形は反時計回りで構築される点に注意。


%index
glRenderMode
glRenderMode 関数はラスタ化モードを設定する。
%prm
mode
mode : [int] ラスタ化モード。次の 3 つの値を受け付ける。既定値は GL_RENDER。GL_RENDER (レンダーモード。プリミティブをラスタ化しピクセルフラグメントを生成、フレームバッファに書き込む通常モード兼既定)、GL_SELECT (セレクションモード。ピクセルフラグメントは生成されず、描画されたであろうプリミティブの名前レコードがセレクトバッファに返される。事前に glSelectBuffer で作成しておく必要がある)、GL_FEEDBACK (フィードバックモード。ピクセルフラグメントは生成されず、描画されたであろう頂点の座標と属性がフィードバックバッファに返される。事前に glFeedbackBuffer で作成しておく必要がある)。
%inst
glRenderMode 関数はラスタ化モードを設定する。

[備考]
glRenderMode は 1 引数 mode を取り、上記 3 つの定義済み値のいずれかを取り得る。glRenderMode
の戻り値は引数 mode ではなく呼び出し時のレンダーモードによって決まる。3 種類のレンダーモードに対する戻り値: GL_RENDER
は 0、GL_SELECT はセレクトバッファに転送されたヒットレコード数、GL_FEEDBACK
はフィードバックバッファに転送された値の数 (頂点数ではない)。詳細は glSelectBuffer、glFeedbackBuffer
を参照。エラーが生成された場合、現在のレンダーモードに関わらず 0 を返す。関連情報は glGet (GL_RENDER_MODE)
で取得できる。


%index
glRotated
glRotated 関数は現在の行列に回転行列を乗じる。
%prm
angle, x, y, z
angle : [double] 回転角度 (度)。
x : [double] ベクトルの x 座標。
y : [double] ベクトルの y 座標。
z : [double] ベクトルの z 座標。
%inst
glRotated 関数は現在の行列に回転行列を乗じる。

[戻り値]
この関数は値を返さない。

[備考]
glRotated は原点から (x, y, z) への方向ベクトルを軸とした angle 度の反時計回り回転行列を計算する。現在の行列
(glMatrixMode 参照) にこの回転行列を乗じ、その積で現在の行列を置き換える。すなわち M が現在の行列で R
が回転行列なら、M は M?R に置き換わる。行列モードが GL_MODELVIEW または GL_PROJECTION
なら、glRotated 呼び出し以降に描画される全オブジェクトが回転する。回転前の座標系を保存/復元するには glPushMatrix
/ glPopMatrix を使う。関連情報は glGet (GL_RENDER_MODE / GL_MATRIX_MODE /
GL_MODELVIEW_MATRIX / GL_PROJECTION_MATRIX / GL_TEXTURE_MATRIX)
で取得できる。


%index
glRotatef
glRotatef 関数は現在の行列に回転行列を乗じる。
%prm
angle, x, y, z
angle : [float] 回転角度 (度)。
x : [float] ベクトルの x 座標。
y : [float] ベクトルの y 座標。
z : [float] ベクトルの z 座標。
%inst
glRotatef 関数は現在の行列に回転行列を乗じる。

[戻り値]
この関数は値を返さない。

[備考]
glRotatef は原点から (x, y, z) への方向ベクトルを軸とした angle 度の反時計回り回転行列を計算する。現在の行列
(glMatrixMode 参照) にこの回転行列を乗じ、その積で現在の行列を置き換える。すなわち M が現在の行列で R
が回転行列なら、M は M?R に置き換わる。行列モードが GL_MODELVIEW または GL_PROJECTION
なら、glRotatef 呼び出し以降に描画される全オブジェクトが回転する。回転前の座標系を保存/復元するには glPushMatrix
/ glPopMatrix を使う。関連情報は glGet (GL_RENDER_MODE / GL_MATRIX_MODE /
GL_MODELVIEW_MATRIX / GL_PROJECTION_MATRIX / GL_TEXTURE_MATRIX)
で取得できる。


%index
glScaled
glScaled / glScalef 関数は現在の行列に一般スケーリング行列を乗じる。| glScaled 関数 (Gl.h)
%prm
x, y, z
x : [double] x 軸に沿ったスケール係数。
y : [double] y 軸に沿ったスケール係数。
z : [double] z 軸に沿ったスケール係数。
%inst
glScaled / glScalef 関数は現在の行列に一般スケーリング行列を乗じる。| glScaled 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glScaled は x, y, z 軸に沿った一般スケーリングを行う。3 つの引数は各軸に沿ったスケール係数を示す。現在の行列
(glMatrixMode 参照) にこのスケール行列を乗じ、その積で現在の行列を置き換える。M が現在の行列で S がスケール行列なら
M は M?S に置き換わる。行列モードが GL_MODELVIEW または GL_PROJECTION なら、glScaled
呼び出し以降に描画される全オブジェクトがスケールされる。スケール前の座標系を保存/復元するには glPushMatrix /
glPopMatrix を使う。1.0 以外のスケール係数をモデルビュー行列に適用しライティングが有効な場合、法線の自動正規化
(glEnable / glDisable に GL_NORMALIZE) も有効にすべき。関連情報は glGet
(GL_MATRIX_MODE / GL_MODELVIEW_MATRIX / GL_PROJECTION_MATRIX /
GL_TEXTURE_MATRIX) で取得できる。


%index
glScalef
glScaled / glScalef 関数は現在の行列に一般スケーリング行列を乗じる。| glScalef 関数 (Gl.h)
%prm
x, y, z
x : [float] x 軸に沿ったスケール係数。
y : [float] y 軸に沿ったスケール係数。
z : [float] z 軸に沿ったスケール係数。
%inst
glScaled / glScalef 関数は現在の行列に一般スケーリング行列を乗じる。| glScalef 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glScalef は x, y, z 軸に沿った一般スケーリングを行う。3 つの引数は各軸に沿ったスケール係数を示す。現在の行列
(glMatrixMode 参照) にこのスケール行列を乗じ、その積で現在の行列を置き換える。M が現在の行列で S がスケール行列なら
M は M?S に置き換わる。行列モードが GL_MODELVIEW または GL_PROJECTION なら、glScalef
呼び出し以降に描画される全オブジェクトがスケールされる。スケール前の座標系を保存/復元するには glPushMatrix /
glPopMatrix を使う。1.0 以外のスケール係数をモデルビュー行列に適用しライティングが有効な場合、法線の自動正規化
(glEnable / glDisable に GL_NORMALIZE) も有効にすべき。関連情報は glGet
(GL_MATRIX_MODE / GL_MODELVIEW_MATRIX / GL_PROJECTION_MATRIX /
GL_TEXTURE_MATRIX) で取得できる。


%index
glScissor
glScissor 関数はシザーボックスを定義する。
%prm
x, y, width, height
x : [int] シザーボックス左下隅の x (縦軸) 座標。
y : [int] シザーボックス左下隅の y (横軸) 座標。x と y で左下隅を指定する。初期値は (0,0)。
width : [int] シザーボックスの幅。
height : [int] シザーボックスの高さ。OpenGL コンテキストが最初にウィンドウへアタッチされたとき、width / height はウィンドウの寸法に設定される。
%inst
glScissor 関数はシザーボックスを定義する。

[戻り値]
この関数は値を返さない。

[備考]
glScissor はウィンドウ座標でシザーボックスと呼ばれる矩形を定義する。最初の 2 引数 x, y
はボックスの左下隅を、width, height は幅と高さを指定する。シザーテストは glEnable / glDisable に
GL_SCISSOR_TEST
を指定して有効化/無効化する。シザーテストが有効な間、シザーボックス内のピクセルのみが描画コマンドで変更可能となる。ウィンドウ座標はフレームバッファピクセルの共有コーナーで整数値を取るため、glScissor(0,0,1,1)
はウィンドウの左下ピクセルのみを変更可能とし、glScissor(0,0,0,0)
は全ピクセルの変更を禁止する。無効時はシザーボックスがウィンドウ全体を含むのと同じ扱い。関連情報は glGet
(GL_SCISSOR_BOX) と glIsEnabled (GL_SCISSOR_TEST) で取得できる。


%index
glSelectBuffer
glSelectBuffer 関数はセレクションモード値用のバッファを確立する。
%prm
size, buffer
size : [int] buffer のサイズ。
buffer : [var] 選択データを返す。
%inst
glSelectBuffer 関数はセレクションモード値用のバッファを確立する。

[戻り値]
この関数は値を返さない。

[備考]
glSelectBuffer は 2 引数を取る。buffer は符号なし整数配列へのポインタ、size
はその配列サイズ。レンダリングモードが GL_SELECT のとき (glRenderMode 参照)、buffer はネームスタック
(glInitNames、glLoadName、glPushName) からの値を返す。glSelectBuffer
はセレクションモード有効化前に発行し、レンダリングモードが GL_SELECT
の間は発行してはならない。セレクションはウィンドウのある領域に描画されるプリミティブを判定するために使う。領域は現在のモデルビューと透視行列で定義される。セレクションモードではラスタ化からピクセルフラグメントは生成されず、代わりにプリミティブが視錐台およびユーザー定義クリップ平面で定まるクリップ体積と交差すると、そのプリミティブはセレクションヒットを引き起こす
(ポリゴンはカリングされるとヒットしない)。ネームスタックが変更されるか glRenderMode
が呼ばれると、前回イベント以降にヒットがあれば buffer
にヒットレコードがコピーされる。ヒットレコードはイベント時のネームスタックの名前数、前回イベント以降ヒットした全頂点の最小/最大デプス値、ネームスタックの内容
(ボトムから順) で構成される。デプス値は最大の符号なし整数値がウィンドウ座標デプス 1.0、0 が 0.0
に対応するようマップされる。内部インデックスはセレクションモードに入るたび 0
にリセットされる。ヒットレコードが残り領域より大きい場合は入る分だけコピーされオーバーフローフラグが立つ。ネームスタックが空のときコピーされるレコードは
0 と最小/最大デプス値のみで構成される。GL_SELECT 以外を引数として glRenderMode
を呼ぶとセレクションモードを抜ける。GL_SELECT モード中に glRenderMode
が呼ばれると、コピーされたヒットレコード数を返し、オーバーフローフラグとセレクションバッファポインタをリセットしネームスタックを空にする。オーバーフロービットが立っていたら負のヒットレコード数を返す。buffer
の内容は GL_SELECT 以外で glRenderMode が呼ばれるまで未定義。glBegin/glEnd プリミティブと
glRasterPos 呼び出しはヒットを発生させ得る。関連情報は glGet (GL_NAME_STACK_DEPTH) で取得できる。


%index
glShadeModel
glShadeModel 関数はフラットまたはスムーズシェーディングを選択する。
%prm
mode
mode : [int] シェーディング手法を表すシンボル値。GL_FLAT と GL_SMOOTH を受け付ける。既定値は GL_SMOOTH。
%inst
glShadeModel 関数はフラットまたはスムーズシェーディングを選択する。

[戻り値]
この関数は値を返さない。

[備考]
OpenGL
のプリミティブはフラットまたはスムーズシェーディングを持てる。既定のスムーズシェーディングでは、頂点の計算カラーがプリミティブのラスタ化時に補間され、各ピクセルフラグメントに異なる色が割り当てられる。フラットシェーディングは
1
つの頂点の計算カラーを選び、そのプリミティブのラスタ化で生成される全フラグメントに割り当てる。いずれもライティングが有効ならその結果、無効なら頂点指定時の現在カラーが使われる。点ではフラットとスムーズは区別できない。glBegin
から数えて、フラットシェーディングされた線分 i の色は頂点 i+1 (第 2 頂点)
の計算カラーになる。フラットシェーディングされたポリゴンは表に示す頂点の色が使われる。これは単一ポリゴン以外では最後の指定頂点であり、単一ポリゴンの場合は最初の頂点が色を決める。フラット/スムーズは
glShadeModel に GL_FLAT/GL_SMOOTH を指定する。関連情報は glGet (GL_SHADE_MODEL)
で取得できる。


%index
glStencilFunc
glStencilFunc 関数はステンシルテスト用の関数と参照値を設定する。
%prm
func, ref, mask
func : [int] テスト関数。次の 8 トークンが有効: GL_NEVER (常に失敗)、GL_LESS / GL_LEQUAL / GL_GREATER / GL_GEQUAL / GL_EQUAL / GL_NOTEQUAL ((ref & mask) と (stencil & mask) の比較が条件を満たすとき合格)、GL_ALWAYS (常に合格)。
ref : [int] 
mask : [int] テスト実行時に参照値および格納されたステンシル値の両方と AND されるマスク。
%inst
glStencilFunc 関数はステンシルテスト用の関数と参照値を設定する。

[戻り値]
この関数は値を返さない。

[備考]
ステンシリングは z バッファリング同様にピクセル単位で描画を有効/無効にする。OpenGL
の描画プリミティブでステンシルプレーンに描き、その後ジオメトリや画像をレンダリングする際にステンシルプレーンで画面の一部をマスクする。ステンシリングは通常マルチパスレンダリングでデカール、輪郭線、CSG
描画などの特殊効果に使われる。ステンシルテストは参照値とステンシルバッファの値の比較結果に基づきピクセルを条件付きで除外する。glEnable
/ glDisable に GL_STENCIL_TEST を指定して有効化する。テスト結果に応じた動作は glStencilOp
で指定する。func はステンシル比較関数を決めるシンボル定数で 8 種類のいずれかを受け付ける。ref は比較に使う整数参照値で [0,
2^n - 1] にクランプされる (n はステンシルバッファのビットプレーン数)。mask は参照値と格納値の両方とビット AND
され、AND 結果が比較に使われる。比較に成功した場合のみピクセルがラスタ化の次段階に渡される。stencil
値はすべて符号なし整数として扱われる。初期状態ではステンシルテストは無効。ステンシルバッファが無い場合、変更は起こらず常に合格扱いとなる。関連情報は
glGet (GL_STENCIL_FUNC / VALUE_MASK / REF / BITS) と glIsEnabled
(GL_STENCIL_TEST) で取得できる。


%index
glStencilMask
glStencilMask 関数はステンシルプレーン内の個々のビット書き込みを制御する。
%prm
mask
mask : [int] ステンシルプレーン内の個々のビット書き込みを有効化/無効化するビットマスク。初期値はすべて 1。
%inst
glStencilMask 関数はステンシルプレーン内の個々のビット書き込みを制御する。

[戻り値]
この関数は値を返さない。

[備考]
glStencilMask はステンシルプレーン内の個々のビット書き込みを制御する。mask の下位 n ビット (n
はステンシルバッファのビット数) がマスクを指定する。マスクが 1 の位置はステンシルバッファの対応ビットが書き込み可能となり、0
の位置は書き込み保護される。初期状態では全ビットが書き込み可能。関連情報は glGet (GL_STENCIL_WRITEMASK /
GL_STENCIL_BITS) で取得できる。


%index
glStencilOp
glStencilOp 関数はステンシルテスト動作を設定する。
%prm
fail, zfail, zpass
fail : [int] ステンシルテスト失敗時の動作。6 つのシンボル定数を受け付ける。GL_KEEP (現在値を保つ)、GL_ZERO (ステンシルバッファ値を 0 にする)、GL_REPLACE (glStencilFunc で指定した ref に設定する)、GL_INCR (現在値をインクリメント。表現可能最大値にクランプ)、GL_DECR (デクリメント。0 にクランプ)、GL_INVERT (ビット反転)。
zfail : [int] ステンシルテストは合格したがデプステストが失敗したときのステンシル動作。fail と同じシンボル定数を受け付ける。
zpass : [int] ステンシルテストとデプステストの両方が合格したとき、またはステンシルテストが合格しデプスバッファが無いかデプステストが無効なときのステンシル動作。fail と同じシンボル定数を受け付ける。
%inst
glStencilOp 関数はステンシルテスト動作を設定する。

[戻り値]
この関数は値を返さない。

[備考]
ステンシリングは z バッファリング同様にピクセル単位で描画を有効/無効にする。OpenGL
の描画プリミティブでステンシルプレーンに描き、その後ジオメトリや画像をレンダリングする際にステンシルプレーンで画面の一部をマスクする。マルチパスレンダリングでデカール、輪郭線、CSG
描画などの特殊効果に使われる。ステンシルテストはステンシルバッファの値と参照値との比較結果に基づきピクセルを条件付きで除外する。glEnable
/ glDisable に GL_STENCIL_TEST を指定して有効化し、glStencilFunc
で制御する。glStencilOp は 3
つの引数で、ステンシリング有効時の格納ステンシル値の扱いを指定する。ステンシルテストが失敗した場合はピクセルのカラー/デプスバッファは変更されず、fail
がステンシルバッファ内容の扱いを指定する。ステンシル値は符号なし整数として扱われ、増減時は 0 と 2^n-1 (n は
GL_STENCIL_BITS) にクランプされる。残り 2 つの引数は後続のデプステストが合格 (zpass) または失敗
(zfail) した場合のステンシル動作を指定する。fail と同じ 6 つのシンボル定数を使う。デプスバッファが無いか無効な場合
zfail は無視され、fail と zpass
がそれぞれステンシルテスト失敗時/合格時の動作を指定する。初期状態ではステンシルテストは無効。ステンシルバッファが無い場合、glStencilOp
の呼び出しに関わらず常に合格扱いとなる。関連情報は glGet (GL_STENCIL_FAIL / PASS_DEPTH_PASS /
PASS_DEPTH_FAIL / BITS) と glIsEnabled (GL_STENCIL_TEST) で取得できる。


%index
glTexCoord1d
現在のテクスチャ座標を設定する。| glTexCoord1d 関数 (Gl.h)
%prm
s
s : [double] s テクスチャ座標。
%inst
現在のテクスチャ座標を設定する。| glTexCoord1d 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord1dv
現在のテクスチャ座標を設定する。| glTexCoord1dv 関数 (Gl.h)
%prm
v
v : [var] テクスチャ座標配列へのポインタ。
%inst
現在のテクスチャ座標を設定する。| glTexCoord1dv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord1f
現在のテクスチャ座標を設定する。| glTexCoord1f 関数 (Gl.h)
%prm
s
s : [float] s テクスチャ座標。
%inst
現在のテクスチャ座標を設定する。| glTexCoord1f 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord1fv
現在のテクスチャ座標を設定する。| glTexCoord1fv 関数 (Gl.h)
%prm
v
v : [var] テクスチャ座標配列へのポインタ。
%inst
現在のテクスチャ座標を設定する。| glTexCoord1fv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord1i
現在のテクスチャ座標を設定する。| glTexCoord1i 関数 (Gl.h)
%prm
s
s : [int] s テクスチャ座標。
%inst
現在のテクスチャ座標を設定する。| glTexCoord1i 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord1iv
現在のテクスチャ座標を設定する。| glTexCoord1iv 関数 (Gl.h)
%prm
v
v : [var] テクスチャ座標配列へのポインタ。
%inst
現在のテクスチャ座標を設定する。| glTexCoord1iv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord1s
現在のテクスチャ座標を設定する。| glTexCoord1s 関数 (Gl.h)
%prm
s
s : [int] s テクスチャ座標。
%inst
現在のテクスチャ座標を設定する。| glTexCoord1s 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord1sv
現在のテクスチャ座標を設定する。| glTexCoord1sv 関数 (Gl.h)
%prm
v
v : [var] テクスチャ座標配列へのポインタ。
%inst
現在のテクスチャ座標を設定する。| glTexCoord1sv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord2d
現在のテクスチャ座標を設定する。| glTexCoord2d 関数 (Gl.h)
%prm
s, t
s : [double] s テクスチャ座標。
t : [double] t テクスチャ座標。
%inst
現在のテクスチャ座標を設定する。| glTexCoord2d 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord2dv
現在のテクスチャ座標を設定する。| glTexCoord2dv 関数 (Gl.h)
%prm
v
v : [var] s, t テクスチャ座標を指定する 2 要素配列へのポインタ。
%inst
現在のテクスチャ座標を設定する。| glTexCoord2dv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord2f
(no summary)
%prm
s, t
s : [float] 
t : [float] 
%inst



%index
glTexCoord2fv
現在のテクスチャ座標を設定する。| glTexCoord2fv 関数 (Gl.h)
%prm
v
v : [var] s, t テクスチャ座標を指定する 2 要素配列へのポインタ。
%inst
現在のテクスチャ座標を設定する。| glTexCoord2fv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord2i
現在のテクスチャ座標を設定する。| glTexCoord2i 関数 (Gl.h)
%prm
s, t
s : [int] s テクスチャ座標。
t : [int] t テクスチャ座標。
%inst
現在のテクスチャ座標を設定する。| glTexCoord2i 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord2iv
現在のテクスチャ座標を設定する。| glTexCoord2iv 関数 (Gl.h)
%prm
v
v : [var] s, t テクスチャ座標を指定する 2 要素配列へのポインタ。
%inst
現在のテクスチャ座標を設定する。| glTexCoord2iv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord2s
現在のテクスチャ座標を設定する。| glTexCoord2s 関数 (Gl.h)
%prm
s, t
s : [int] s テクスチャ座標。
t : [int] t テクスチャ座標。
%inst
現在のテクスチャ座標を設定する。| glTexCoord2s 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord2sv
現在のテクスチャ座標を設定する。| glTexCoord2sv 関数 (Gl.h)
%prm
v
v : [var] s, t テクスチャ座標を指定する 2 要素配列へのポインタ。
%inst
現在のテクスチャ座標を設定する。| glTexCoord2sv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord3d
現在のテクスチャ座標を設定する。| glTexCoord3d 関数 (Gl.h)
%prm
s, t, r
s : [double] s テクスチャ座標。
t : [double] t テクスチャ座標。
r : [double] r テクスチャ座標。
%inst
現在のテクスチャ座標を設定する。| glTexCoord3d 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord3dv
現在のテクスチャ座標を設定する。| glTexCoord3dv 関数 (Gl.h)
%prm
v
v : [var] s, t, r テクスチャ座標を指定する 3 要素配列へのポインタ。
%inst
現在のテクスチャ座標を設定する。| glTexCoord3dv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord3f
(no summary)
%prm
s, t, r
s : [float] 
t : [float] 
r : [float] 
%inst



%index
glTexCoord3fv
現在のテクスチャ座標を設定する。| glTexCoord3fv 関数 (Gl.h)
%prm
v
v : [var] s, t, r テクスチャ座標を指定する 3 要素配列へのポインタ。
%inst
現在のテクスチャ座標を設定する。| glTexCoord3fv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord3i
現在のテクスチャ座標を設定する。| glTexCoord3i 関数 (Gl.h)
%prm
s, t, r
s : [int] s テクスチャ座標。
t : [int] t テクスチャ座標。
r : [int] r テクスチャ座標。
%inst
現在のテクスチャ座標を設定する。| glTexCoord3i 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord3iv
現在のテクスチャ座標を設定する。| glTexCoord3iv 関数 (Gl.h)
%prm
v
v : [var] s, t, r テクスチャ座標を指定する 3 要素配列へのポインタ。
%inst
現在のテクスチャ座標を設定する。| glTexCoord3iv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord3s
現在のテクスチャ座標を設定する。| glTexCoord3s 関数 (Gl.h)
%prm
s, t, r
s : [int] s テクスチャ座標。
t : [int] t テクスチャ座標。
r : [int] r テクスチャ座標。
%inst
現在のテクスチャ座標を設定する。| glTexCoord3s 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord3sv
現在のテクスチャ座標を設定する。| glTexCoord3sv 関数 (Gl.h)
%prm
v
v : [var] s, t, r テクスチャ座標を指定する 3 要素配列へのポインタ。
%inst
現在のテクスチャ座標を設定する。| glTexCoord3sv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord4d
現在のテクスチャ座標を設定する。| glTexCoord4d 関数 (Gl.h)
%prm
s, t, r, q
s : [double] s テクスチャ座標。
t : [double] t テクスチャ座標。
r : [double] r テクスチャ座標。
q : [double] q テクスチャ座標。
%inst
現在のテクスチャ座標を設定する。| glTexCoord4d 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord4dv
現在のテクスチャ座標を設定する。| glTexCoord4dv 関数 (Gl.h)
%prm
v
v : [var] s, t, r, q テクスチャ座標を指定する 4 要素配列へのポインタ。
%inst
現在のテクスチャ座標を設定する。| glTexCoord4dv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord4f
現在のテクスチャ座標を設定する。| glTexCoord4f 関数 (Gl.h)
%prm
s, t, r, q
s : [float] s テクスチャ座標。
t : [float] t テクスチャ座標。
r : [float] r テクスチャ座標。
q : [float] q テクスチャ座標。
%inst
現在のテクスチャ座標を設定する。| glTexCoord4f 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord4fv
現在のテクスチャ座標を設定する。| glTexCoord4fv 関数 (Gl.h)
%prm
v
v : [var] s, t, r, q テクスチャ座標を指定する 4 要素配列へのポインタ。
%inst
現在のテクスチャ座標を設定する。| glTexCoord4fv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord4i
現在のテクスチャ座標を設定する。| glTexCoord4i 関数 (Gl.h)
%prm
s, t, r, q
s : [int] s テクスチャ座標。
t : [int] t テクスチャ座標。
r : [int] r テクスチャ座標。
q : [int] q テクスチャ座標。
%inst
現在のテクスチャ座標を設定する。| glTexCoord4i 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord4iv
現在のテクスチャ座標を設定する。| glTexCoord4iv 関数 (Gl.h)
%prm
v
v : [var] s, t, r, q テクスチャ座標を指定する 4 要素配列へのポインタ。
%inst
現在のテクスチャ座標を設定する。| glTexCoord4iv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord4s
現在のテクスチャ座標を設定する。| glTexCoord4s 関数 (Gl.h)
%prm
s, t, r, q
s : [int] s テクスチャ座標。
t : [int] t テクスチャ座標。
r : [int] r テクスチャ座標。
q : [int] q テクスチャ座標。
%inst
現在のテクスチャ座標を設定する。| glTexCoord4s 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoord4sv
現在のテクスチャ座標を設定する。| glTexCoord4sv 関数 (Gl.h)
%prm
v
v : [var] s, t, r, q テクスチャ座標を指定する 4 要素配列へのポインタ。
%inst
現在のテクスチャ座標を設定する。| glTexCoord4sv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexCoord はポリゴン頂点に関連付けられたデータの一部である現在のテクスチャ座標を設定する。glTexCoord は 1～4
次元のテクスチャ座標を指定する。glTexCoord1 は (s,0,0,1)、glTexCoord2 は
(s,t,0,1)、glTexCoord3 は (s,t,r,1)、glTexCoord4 は (s,t,r,q)
を設定する。現在のテクスチャ座標はいつでも更新でき、glBegin / glEnd の間でも呼び出せる。関連情報は glGet
(GL_CURRENT_TEXTURE_COORDS) で取得できる。


%index
glTexCoordPointer
glTexCoordPointer 関数はテクスチャ座標配列を定義する。
%prm
size, type, stride, pointer
size : [int] 配列要素あたりの座標数。size は 1、2、3、4 のいずれか。
type : [int] 配列内の各テクスチャ座標のデータ型。GL_SHORT、GL_INT、GL_FLOAT、GL_DOUBLE のシンボル定数を使う。
stride : [int] 連続する配列要素間のバイトオフセット。stride が 0 なら配列要素は密にパックされる。
pointer : [intptr] 配列内の最初の要素の最初の座標へのポインタ。
%inst
glTexCoordPointer 関数はテクスチャ座標配列を定義する。

[戻り値]
この関数は値を返さない。

[備考]
glTexCoordPointer はレンダリング時に使用するテクスチャ座標配列の位置とデータを指定する。size
は配列の各要素に使われる座標数、type は各テクスチャ座標のデータ型、stride は配列要素間のバイトオフセットを指定し、頂点と属性を
1 つの配列にパックするか別配列に格納するかを可能にする。実装によっては 1 つの配列に格納する方が別配列より効率的な場合がある
(glInterleavedArrays 参照)。テクスチャ座標配列を指定すると size、type、stride、pointer
はクライアント側状態として保存される。glEnableClientState に GL_TEXTURE_COORD_ARRAY
を指定して有効化する。有効時は glDrawArrays、glDrawElements、glArrayElement
がテクスチャ座標配列を使う。既定では無効。glTexCoordPointer は表示リストに含められない。クライアント側状態のため
glPushAttrib / glPopAttrib では保存/復元されない。glBegin / glEnd
ペア内で呼び出してもエラーは生成されないが結果は未定義。関連情報は glIsEnabled
(GL_TEXTURE_COORD_ARRAY)、glGet
(GL_TEXTURE_COORD_ARRAY_SIZE/STRIDE/COUNT/TYPE)、glGetPointerv
(GL_TEXTURE_COORD_ARRAY_POINTER) で取得できる。


%index
glTexEnvf
glTexEnvf 関数はテクスチャ環境パラメータを設定する。
%prm
target, pname, param2
target : [int] テクスチャ環境。GL_TEXTURE_ENV でなければならない。
pname : [int] 単一値テクスチャ環境パラメータのシンボル名。GL_TEXTURE_ENV_MODE でなければならない。
param2 : [float] 
%inst
glTexEnvf 関数はテクスチャ環境パラメータを設定する。

[戻り値]
この関数は値を返さない。

[備考]
テクスチャ環境は、フラグメントがテクスチャリングされるときにテクスチャ値がどう解釈されるかを指定する。target は
GL_TEXTURE_ENV、pname は GL_TEXTURE_ENV_MODE でなければならない。定義されているテクスチャ関数は
GL_MODULATE、GL_DECAL、GL_BLEND の 3
種類。テクスチャ関数はフラグメントに適用されるテクスチャ画像値を用いてフラグメントに作用し、そのフラグメントの RGBA
カラーを生成する。テクスチャ画像から取り出される RGBA 値は [0,1] の範囲。添字 f は入力フラグメント、t
はテクスチャ画像、c はテクスチャ環境カラー、v はテクスチャ関数が生成する値を表す。テクスチャ画像はテクスチャ要素ごとに最大 4
成分を持てる (glTexImage1D / glTexImage2D 参照)。
このドキュメントは省略されている。


%index
glTexEnvfv
glTexEnvfv 関数はテクスチャ環境パラメータを設定する。
%prm
target, pname, params
target : [int] テクスチャ環境。GL_TEXTURE_ENV でなければならない。
pname : [int] 単一値テクスチャ環境パラメータのシンボル名。GL_TEXTURE_ENV_MODE と GL_TEXTURE_ENV_COLOR を受け付ける。
params : [int] 
%inst
glTexEnvfv 関数はテクスチャ環境パラメータを設定する。

[戻り値]
この関数は値を返さない。

[備考]
テクスチャ環境は、フラグメントがテクスチャリングされるときにテクスチャ値がどう解釈されるかを指定する。target は
GL_TEXTURE_ENV でなければならない。pname は GL_TEXTURE_ENV_MODE か
GL_TEXTURE_ENV_COLOR のいずれか。pname が GL_TEXTURE_ENV_MODE の場合、params
はテクスチャ関数のシンボル名 (またはそのポインタ) を指す。定義されているテクスチャ関数は
GL_MODULATE、GL_DECAL、GL_BLEND の 3
種類。テクスチャ関数はフラグメントに適用されるテクスチャ画像値を用いてフラグメントに作用し、そのフラグメントの RGBA
カラーを生成する。テクスチャ画像から取り出される RGBA 値は [0,1] の範囲。添字 f は入力フラグメント、t
はテクスチャ画像、c はテクスチャ環境カラー、v はテクスチャ関数が生成する値を表す。テクスチャ画像はテクスチャ要素ごとに最大 4
成分を持てる (glTexImage1D / glTexImage2D 参照)。
このドキュメントは省略されている。


%index
glTexEnvi
glTexEnvi 関数はテクスチャ環境パラメータを設定する。
%prm
target, pname, param2
target : [int] テクスチャ環境。GL_TEXTURE_ENV でなければならない。
pname : [int] 単一値テクスチャ環境パラメータのシンボル名。GL_TEXTURE_ENV_MODE でなければならない。
param2 : [int] 
%inst
glTexEnvi 関数はテクスチャ環境パラメータを設定する。

[戻り値]
この関数は値を返さない。

[備考]
テクスチャ環境は、フラグメントがテクスチャリングされるときにテクスチャ値がどう解釈されるかを指定する。target は
GL_TEXTURE_ENV、pname は GL_TEXTURE_ENV_MODE でなければならない。定義されているテクスチャ関数は
GL_MODULATE、GL_DECAL、GL_BLEND の 3
種類。テクスチャ関数はフラグメントに適用されるテクスチャ画像値を用いてフラグメントに作用し、そのフラグメントの RGBA
カラーを生成する。テクスチャ画像から取り出される RGBA 値は [0,1] の範囲。添字 f は入力フラグメント、t
はテクスチャ画像、c はテクスチャ環境カラー、v はテクスチャ関数が生成する値を表す。テクスチャ画像はテクスチャ要素ごとに最大 4
成分を持てる (glTexImage1D / glTexImage2D 参照)。
このドキュメントは省略されている。


%index
glTexEnviv
glTexEnviv 関数はテクスチャ環境パラメータを設定する。
%prm
target, pname, params
target : [int] テクスチャ環境。GL_TEXTURE_ENV でなければならない。
pname : [int] 単一値テクスチャ環境パラメータのシンボル名。GL_TEXTURE_ENV_MODE と GL_TEXTURE_ENV_COLOR を受け付ける。
params : [int] 
%inst
glTexEnviv 関数はテクスチャ環境パラメータを設定する。

[戻り値]
この関数は値を返さない。

[備考]
テクスチャ環境は、フラグメントがテクスチャリングされるときにテクスチャ値がどう解釈されるかを指定する。target は
GL_TEXTURE_ENV でなければならない。pname は GL_TEXTURE_ENV_MODE か
GL_TEXTURE_ENV_COLOR のいずれか。pname が GL_TEXTURE_ENV_MODE の場合、params
はテクスチャ関数のシンボル名 (またはそのポインタ) を指す。定義されているテクスチャ関数は
GL_MODULATE、GL_DECAL、GL_BLEND の 3
種類。テクスチャ関数はフラグメントに適用されるテクスチャ画像値を用いてフラグメントに作用し、そのフラグメントの RGBA
カラーを生成する。テクスチャ画像から取り出される RGBA 値は [0,1] の範囲。添字 f は入力フラグメント、t
はテクスチャ画像、c はテクスチャ環境カラー、v はテクスチャ関数が生成する値を表す。テクスチャ画像はテクスチャ要素ごとに最大 4
成分を持てる (glTexImage1D / glTexImage2D 参照)。
このドキュメントは省略されている。


%index
glTexGend
テクスチャ座標の生成を制御する。| glTexGend 関数 (Gl.h)
%prm
coord, pname, param2
coord : [int] テクスチャ座標。GL_S、GL_T、GL_R、GL_Q のいずれかでなければならない。
pname : [int] テクスチャ座標生成関数のシンボル名。
param2 : [double] 
%inst
テクスチャ座標の生成を制御する。| glTexGend 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexGen はテクスチャ座標生成関数を選択するか、関数の係数を供給する。coord は (s,t,r,q) のうち 1 つを
GL_S、GL_T、GL_R、GL_Q のシンボルで指定する。pname は
GL_TEXTURE_GEN_MODE、GL_OBJECT_PLANE、GL_EYE_PLANE のいずれかでなければならない。pname
が GL_TEXTURE_GEN_MODE の場合、param はモード
GL_OBJECT_LINEAR、GL_EYE_LINEAR、GL_SPHERE_MAP
のいずれかを指定する。GL_OBJECT_PLANE か GL_EYE_PLANE の場合、param
は対応するテクスチャ生成関数の係数を含む。GL_OBJECT_LINEAR
ではオブジェクト座標から計算する関数が使われ、海抜を参照平面とする地形のテクスチャマッピングなどに利用できる。GL_EYE_LINEAR
ではアイ座標から計算され、glTexGen 呼び出し時のモデルビュー行列が適用される。M
が悪条件または特異なら生成テクスチャ座標は不正確/未定義となり得る。param
の値はアイ座標での参照平面を定義する。GL_SPHERE_MAP かつ coord が GL_S または GL_T の場合、s/t
は反射ベクトルと単位法線から計算される。glEnable / glDisable に GL_TEXTURE_GEN_S/T/R/Q
を指定して有効化/無効化する。有効時は対応する生成関数で計算され、無効時は現在のテクスチャ座標が使われる。初期状態では全生成関数が
GL_EYE_LINEAR で無効、s 平面方程式は (1,0,0,0)、t は (0,1,0,0)、r/q は
(0,0,0,0)。関連情報は glGetTexGen と glIsEnabled (GL_TEXTURE_GEN_S/T/R/Q)
で取得できる。


%index
glTexGendv
テクスチャ座標の生成を制御する。| glTexGendv 関数 (Gl.h)
%prm
coord, pname, params
coord : [int] テクスチャ座標。GL_S、GL_T、GL_R、GL_Q のいずれかでなければならない。
pname : [int] テクスチャ座標生成関数のシンボル名。
params : [int] 
%inst
テクスチャ座標の生成を制御する。| glTexGendv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexGen はテクスチャ座標生成関数を選択するか、関数の係数を供給する。coord は (s,t,r,q) のうち 1 つを
GL_S、GL_T、GL_R、GL_Q のシンボルで指定する。pname は
GL_TEXTURE_GEN_MODE、GL_OBJECT_PLANE、GL_EYE_PLANE のいずれかでなければならない。pname
が GL_TEXTURE_GEN_MODE の場合、param はモード
GL_OBJECT_LINEAR、GL_EYE_LINEAR、GL_SPHERE_MAP
のいずれかを指定する。GL_OBJECT_PLANE か GL_EYE_PLANE の場合、param
は対応するテクスチャ生成関数の係数を含む。GL_OBJECT_LINEAR
ではオブジェクト座標から計算する関数が使われ、海抜を参照平面とする地形のテクスチャマッピングなどに利用できる。GL_EYE_LINEAR
ではアイ座標から計算され、glTexGen 呼び出し時のモデルビュー行列が適用される。M
が悪条件または特異なら生成テクスチャ座標は不正確/未定義となり得る。param
の値はアイ座標での参照平面を定義する。GL_SPHERE_MAP かつ coord が GL_S または GL_T の場合、s/t
は反射ベクトルと単位法線から計算される。glEnable / glDisable に GL_TEXTURE_GEN_S/T/R/Q
を指定して有効化/無効化する。有効時は対応する生成関数で計算され、無効時は現在のテクスチャ座標が使われる。初期状態では全生成関数が
GL_EYE_LINEAR で無効、s 平面方程式は (1,0,0,0)、t は (0,1,0,0)、r/q は
(0,0,0,0)。関連情報は glGetTexGen と glIsEnabled (GL_TEXTURE_GEN_S/T/R/Q)
で取得できる。


%index
glTexGenf
テクスチャ座標の生成を制御する。| glTexGenf 関数 (Gl.h)
%prm
coord, pname, param2
coord : [int] テクスチャ座標。GL_S、GL_T、GL_R、GL_Q のいずれかでなければならない。
pname : [int] テクスチャ座標生成関数のシンボル名。
param2 : [float] 
%inst
テクスチャ座標の生成を制御する。| glTexGenf 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexGen はテクスチャ座標生成関数を選択するか、関数の係数を供給する。coord は (s,t,r,q) のうち 1 つを
GL_S、GL_T、GL_R、GL_Q のシンボルで指定する。pname は
GL_TEXTURE_GEN_MODE、GL_OBJECT_PLANE、GL_EYE_PLANE のいずれかでなければならない。pname
が GL_TEXTURE_GEN_MODE の場合、param はモード
GL_OBJECT_LINEAR、GL_EYE_LINEAR、GL_SPHERE_MAP
のいずれかを指定する。GL_OBJECT_PLANE か GL_EYE_PLANE の場合、param
は対応するテクスチャ生成関数の係数を含む。GL_OBJECT_LINEAR
ではオブジェクト座標から計算する関数が使われ、海抜を参照平面とする地形のテクスチャマッピングなどに利用できる。GL_EYE_LINEAR
ではアイ座標から計算され、glTexGen 呼び出し時のモデルビュー行列が適用される。M
が悪条件または特異なら生成テクスチャ座標は不正確/未定義となり得る。param
の値はアイ座標での参照平面を定義する。GL_SPHERE_MAP かつ coord が GL_S または GL_T の場合、s/t
は反射ベクトルと単位法線から計算される。glEnable / glDisable に GL_TEXTURE_GEN_S/T/R/Q
を指定して有効化/無効化する。有効時は対応する生成関数で計算され、無効時は現在のテクスチャ座標が使われる。初期状態では全生成関数が
GL_EYE_LINEAR で無効、s 平面方程式は (1,0,0,0)、t は (0,1,0,0)、r/q は
(0,0,0,0)。関連情報は glGetTexGen と glIsEnabled (GL_TEXTURE_GEN_S/T/R/Q)
で取得できる。


%index
glTexGenfv
テクスチャ座標の生成を制御する。| glTexGenfv 関数 (Gl.h)
%prm
coord, pname, params
coord : [int] テクスチャ座標。GL_S、GL_T、GL_R、GL_Q のいずれかでなければならない。
pname : [int] テクスチャ座標生成関数のシンボル名。
params : [int] 
%inst
テクスチャ座標の生成を制御する。| glTexGenfv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexGen はテクスチャ座標生成関数を選択するか、関数の係数を供給する。coord は (s,t,r,q) のうち 1 つを
GL_S、GL_T、GL_R、GL_Q のシンボルで指定する。pname は
GL_TEXTURE_GEN_MODE、GL_OBJECT_PLANE、GL_EYE_PLANE のいずれかでなければならない。pname
が GL_TEXTURE_GEN_MODE の場合、param はモード
GL_OBJECT_LINEAR、GL_EYE_LINEAR、GL_SPHERE_MAP
のいずれかを指定する。GL_OBJECT_PLANE か GL_EYE_PLANE の場合、param
は対応するテクスチャ生成関数の係数を含む。GL_OBJECT_LINEAR
ではオブジェクト座標から計算する関数が使われ、海抜を参照平面とする地形のテクスチャマッピングなどに利用できる。GL_EYE_LINEAR
ではアイ座標から計算され、glTexGen 呼び出し時のモデルビュー行列が適用される。M
が悪条件または特異なら生成テクスチャ座標は不正確/未定義となり得る。param
の値はアイ座標での参照平面を定義する。GL_SPHERE_MAP かつ coord が GL_S または GL_T の場合、s/t
は反射ベクトルと単位法線から計算される。glEnable / glDisable に GL_TEXTURE_GEN_S/T/R/Q
を指定して有効化/無効化する。有効時は対応する生成関数で計算され、無効時は現在のテクスチャ座標が使われる。初期状態では全生成関数が
GL_EYE_LINEAR で無効、s 平面方程式は (1,0,0,0)、t は (0,1,0,0)、r/q は
(0,0,0,0)。関連情報は glGetTexGen と glIsEnabled (GL_TEXTURE_GEN_S/T/R/Q)
で取得できる。


%index
glTexGeni
テクスチャ座標の生成を制御する。| glTexGeni 関数 (Gl.h)
%prm
coord, pname, param2
coord : [int] テクスチャ座標。GL_S、GL_T、GL_R、GL_Q のいずれかでなければならない。
pname : [int] テクスチャ座標生成関数のシンボル名。
param2 : [int] 
%inst
テクスチャ座標の生成を制御する。| glTexGeni 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexGen はテクスチャ座標生成関数を選択するか、関数の係数を供給する。coord は (s,t,r,q) のうち 1 つを
GL_S、GL_T、GL_R、GL_Q のシンボルで指定する。pname は
GL_TEXTURE_GEN_MODE、GL_OBJECT_PLANE、GL_EYE_PLANE のいずれかでなければならない。pname
が GL_TEXTURE_GEN_MODE の場合、param はモード
GL_OBJECT_LINEAR、GL_EYE_LINEAR、GL_SPHERE_MAP
のいずれかを指定する。GL_OBJECT_PLANE か GL_EYE_PLANE の場合、param
は対応するテクスチャ生成関数の係数を含む。GL_OBJECT_LINEAR
ではオブジェクト座標から計算する関数が使われ、海抜を参照平面とする地形のテクスチャマッピングなどに利用できる。GL_EYE_LINEAR
ではアイ座標から計算され、glTexGen 呼び出し時のモデルビュー行列が適用される。M
が悪条件または特異なら生成テクスチャ座標は不正確/未定義となり得る。param
の値はアイ座標での参照平面を定義する。GL_SPHERE_MAP かつ coord が GL_S または GL_T の場合、s/t
は反射ベクトルと単位法線から計算される。glEnable / glDisable に GL_TEXTURE_GEN_S/T/R/Q
を指定して有効化/無効化する。有効時は対応する生成関数で計算され、無効時は現在のテクスチャ座標が使われる。初期状態では全生成関数が
GL_EYE_LINEAR で無効、s 平面方程式は (1,0,0,0)、t は (0,1,0,0)、r/q は
(0,0,0,0)。関連情報は glGetTexGen と glIsEnabled (GL_TEXTURE_GEN_S/T/R/Q)
で取得できる。


%index
glTexGeniv
テクスチャ座標の生成を制御する。| glTexGeniv 関数 (Gl.h)
%prm
coord, pname, params
coord : [int] テクスチャ座標。GL_S、GL_T、GL_R、GL_Q のいずれかでなければならない。
pname : [int] テクスチャ座標生成関数のシンボル名。
params : [int] 
%inst
テクスチャ座標の生成を制御する。| glTexGeniv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glTexGen はテクスチャ座標生成関数を選択するか、関数の係数を供給する。coord は (s,t,r,q) のうち 1 つを
GL_S、GL_T、GL_R、GL_Q のシンボルで指定する。pname は
GL_TEXTURE_GEN_MODE、GL_OBJECT_PLANE、GL_EYE_PLANE のいずれかでなければならない。pname
が GL_TEXTURE_GEN_MODE の場合、param はモード
GL_OBJECT_LINEAR、GL_EYE_LINEAR、GL_SPHERE_MAP
のいずれかを指定する。GL_OBJECT_PLANE か GL_EYE_PLANE の場合、param
は対応するテクスチャ生成関数の係数を含む。GL_OBJECT_LINEAR
ではオブジェクト座標から計算する関数が使われ、海抜を参照平面とする地形のテクスチャマッピングなどに利用できる。GL_EYE_LINEAR
ではアイ座標から計算され、glTexGen 呼び出し時のモデルビュー行列が適用される。M
が悪条件または特異なら生成テクスチャ座標は不正確/未定義となり得る。param
の値はアイ座標での参照平面を定義する。GL_SPHERE_MAP かつ coord が GL_S または GL_T の場合、s/t
は反射ベクトルと単位法線から計算される。glEnable / glDisable に GL_TEXTURE_GEN_S/T/R/Q
を指定して有効化/無効化する。有効時は対応する生成関数で計算され、無効時は現在のテクスチャ座標が使われる。初期状態では全生成関数が
GL_EYE_LINEAR で無効、s 平面方程式は (1,0,0,0)、t は (0,1,0,0)、r/q は
(0,0,0,0)。関連情報は glGetTexGen と glIsEnabled (GL_TEXTURE_GEN_S/T/R/Q)
で取得できる。


%index
glTexImage1D
glTexImage1D 関数は 1 次元テクスチャ画像を指定する。
%prm
target, level, internalformat, width, border, format, type, pixels
target : [int] 対象テクスチャ。GL_TEXTURE_1D でなければならない。
level : [int] 詳細度レベル番号。レベル 0 が基本イメージレベル、レベル n は n 段階目のミップマップ縮小画像。
internalformat : [int] テクスチャのカラー成分数を指定する。1、2、3、4 のいずれか、または次のシンボル定数のいずれか: GL_ALPHA、GL_ALPHA4/8/12/16、GL_LUMINANCE、GL_LUMINANCE4/8/12/16、GL_LUMINANCE_ALPHA、GL_LUMINANCE4_ALPHA4/6_ALPHA2/8_ALPHA8/12_ALPHA4/12_ALPHA12/16_ALPHA16、GL_INTENSITY、GL_INTENSITY4/8/12/16、GL_RGB、GL_R3_G3_B2、GL_RGB4/5/8/10/12/16、GL_RGBA、GL_RGBA2/4、GL_RGB5_A1、GL_RGBA8、GL_RGB10_A2、GL_RGBA12、GL_RGBA16。
width : [int] テクスチャ画像の幅。ある整数 n について 2^n + 2*border でなければならない。テクスチャ画像の高さは 1。
border : [int] 境界の幅。0 か 1 でなければならない。
format : [int] ピクセルデータのフォーマット。受け付ける主な値: GL_COLOR_INDEX (カラーインデックス。固定小数化、GL_INDEX_SHIFT/OFFSET 適用後 GL_PIXEL_MAP_I_TO_R/G/B/A で色成分に変換)、GL_STENCIL_INDEX (ステンシル値。glReadPixels 用)、GL_DEPTH_COMPONENT (デプス値。浮動小数化し GL_DEPTH_SCALE/BIAS を適用後 [0,1] にクランプ)、GL_RED/GL_GREEN/GL_BLUE/GL_ALPHA (それぞれ単一成分を浮動小数化して RGBA 要素に組み立て、scale/bias 適用後クランプ)、GL_RGB (RGB トリプル)、GL_RGBA (完全 RGBA)、GL_BGR_EXT/GL_BGRA_EXT (Windows DIB のメモリレイアウトに一致するフォーマット)、GL_LUMINANCE (単一輝度値を R/G/B に複製しアルファに 1.0 を付加)、GL_LUMINANCE_ALPHA (輝度/アルファペア)。
type : [int] ピクセルデータのデータ型。受け付けるシンボル値: GL_UNSIGNED_BYTE、GL_BYTE、GL_BITMAP、GL_UNSIGNED_SHORT、GL_SHORT、GL_UNSIGNED_INT、GL_INT、GL_FLOAT。
pixels : [intptr] メモリ内の画像データへのポインタ。
%inst
glTexImage1D 関数は 1 次元テクスチャ画像を指定する。

[戻り値]
この関数は値を返さない。

[備考]
glTexImage1D は 1
次元テクスチャ画像を指定する。テクスチャリングは指定されたテクスチャ画像の一部を、テクスチャリング有効な各グラフィカルプリミティブにマップする。1
次元テクスチャリングは glEnable / glDisable に GL_TEXTURE_1D
を指定して有効化/無効化する。引数はテクスチャ画像のパラメータ (width、境界幅、詳細度レベル番号、カラー成分数) を表す。最後の 3
引数は画像のメモリ表現を記述し、glDrawPixels で使うピクセルフォーマットと同一。データは type
に応じて符号付き/符号なしのバイト・ショート・ロング、または単精度浮動小数点数列として pixels から読まれ、format に応じて
1～4 個ずつ要素にグループ化される。type が GL_BITMAP のときデータは符号なしバイト列として扱われ (format は
GL_COLOR_INDEX でなければならない)、各バイトはビット順が GL_UNPACK_LSB_FIRST で決まる 8 個の 1
ビット要素として扱われる。テクスチャ画像はテクスチャ要素ごとに最大 4 成分を持つ。1 成分は R のみ、2 成分は R/A、3 成分は
R/G/B、4 成分は RGBA を使う。カラーインデックスモードでは効果を持たない。GL_STENCIL_INDEX と
GL_DEPTH_COMPONENT 以外は glDrawPixels と同じ形式で表現できる。glPixelStore と
glPixelTransfer は glDrawPixels と同じく影響する。width=0
のテクスチャ画像はヌルテクスチャを表し、レベル 0 で指定するとテクスチャリング無効と同じ扱い。関連情報は
glGetTexImage、glIsEnabled (GL_TEXTURE_1D) で取得できる。


%index
glTexImage2D
glTexImage2D 関数は 2 次元テクスチャ画像を指定する。
%prm
target, level, internalformat, width, height, border, format, type, pixels
target : [int] 対象テクスチャ。GL_TEXTURE_2D でなければならない。
level : [int] 詳細度レベル番号。レベル 0 が基本イメージレベル、レベル n は n 段階目のミップマップ縮小画像。
internalformat : [int] テクスチャのカラー成分数。1～4、または GL_ALPHA、GL_ALPHA4/8/12/16、GL_LUMINANCE、GL_LUMINANCE4/8/12/16、GL_LUMINANCE_ALPHA 系、GL_INTENSITY、GL_INTENSITY4/8/12/16、GL_R3_G3_B2、GL_RGB、GL_RGB4/5/8/10/12/16、GL_RGBA、GL_RGBA2/4、GL_RGB5_A1、GL_RGBA8、GL_RGB10_A2、GL_RGBA12、GL_RGBA16 のいずれかでなければならない。
width : [int] テクスチャ画像の幅。ある整数 n について 2^n + 2*border でなければならない。
height : [int] テクスチャ画像の高さ。ある整数 m について 2^m + 2*border でなければならない。
border : [int] 境界の幅。0 か 1 でなければならない。
format : [int] ピクセルデータのフォーマット。受け付ける主な値: GL_COLOR_INDEX (カラーインデックス。固定小数化、GL_INDEX_SHIFT/OFFSET 適用後 GL_PIXEL_MAP_I_TO_R/G/B/A で色成分に変換)、GL_STENCIL_INDEX (ステンシル値。glReadPixels 用)、GL_DEPTH_COMPONENT (デプス値。浮動小数化し GL_DEPTH_SCALE/BIAS を適用後 [0,1] にクランプ)、GL_RED/GL_GREEN/GL_BLUE/GL_ALPHA (それぞれ単一成分を浮動小数化して RGBA 要素に組み立て、scale/bias 適用後クランプ)、GL_RGB (RGB トリプル)、GL_RGBA (完全 RGBA)、GL_BGR_EXT/GL_BGRA_EXT (Windows DIB のメモリレイアウトに一致するフォーマット)、GL_LUMINANCE (単一輝度値を R/G/B に複製しアルファに 1.0 を付加)、GL_LUMINANCE_ALPHA (輝度/アルファペア)。
type : [int] ピクセルデータのデータ型。受け付けるシンボル値: GL_UNSIGNED_BYTE、GL_BYTE、GL_BITMAP、GL_UNSIGNED_SHORT、GL_SHORT、GL_UNSIGNED_INT、GL_INT、GL_FLOAT。
pixels : [intptr] メモリ内の画像データへのポインタ。
%inst
glTexImage2D 関数は 2 次元テクスチャ画像を指定する。

[戻り値]
この関数は値を返さない。

[備考]
glTexImage2D は 2
次元テクスチャ画像を指定する。テクスチャリングは指定されたテクスチャ画像の一部を、テクスチャリング有効な各グラフィカルプリミティブにマップする。2
次元テクスチャリングは glEnable / glDisable に GL_TEXTURE_2D
を指定して有効化/無効化する。引数はテクスチャ画像のパラメータ (height、width、境界幅、詳細度レベル番号、カラー成分数)
を表す。最後の 3 引数は画像のメモリ表現を記述し、glDrawPixels と同一。データは type
に応じて符号付き/符号なしのバイト・ショート・ロング、または単精度浮動小数点数列として pixels から読まれ、format に応じて
1～4 個ずつ要素にグループ化される。type が GL_BITMAP のときデータは符号なしバイト列として扱われ (format は
GL_COLOR_INDEX)、ビット順は GL_UNPACK_LSB_FIRST で決まる。type に受け付ける値は
glDrawPixels を参照。テクスチャ画像はテクスチャ要素ごとに最大 4
成分を持つ。カラーインデックスモードでは効果を持たない。GL_STENCIL_INDEX と GL_DEPTH_COMPONENT 以外は
glDrawPixels と同じ形式で表現できる。glPixelStore と glPixelTransfer は
glDrawPixels と同じく影響する。height か width が 0 のテクスチャ画像はヌルテクスチャを表し、レベル 0
で指定するとテクスチャリング無効と同じ扱い。関連情報は glGetTexImage、glIsEnabled (GL_TEXTURE_2D)
で取得できる。


%index
glTexParameterf
テクスチャパラメータを設定する。| glTexParameterf 関数 (Gl.h)
%prm
target, pname, param2
target : [int] 対象テクスチャ。GL_TEXTURE_1D または GL_TEXTURE_2D でなければならない。
pname : [int] 単一値テクスチャパラメータのシンボル名。pname は次のシンボルを受け付ける: GL_TEXTURE_MIN_FILTER (テクスチャ縮小関数。1 ピクセルが 1 テクスチャ要素以上にマップされる場合に使われる。6 種類の関数がある)、GL_TEXTURE_MAG_FILTER (テクスチャ拡大関数。GL_NEAREST または GL_LINEAR)、GL_TEXTURE_WRAP_S (s 座標のラップ。GL_CLAMP または GL_REPEAT、既定 GL_REPEAT)、GL_TEXTURE_WRAP_T (t 座標のラップ。同上)、GL_TEXTURE_BORDER_COLOR (境界色。params に RGBA の 4 値、既定 (0,0,0,0))、GL_TEXTURE_PRIORITY (現在バインドされているテクスチャの常駐優先度。[0,1])。
param2 : [float] 
%inst
テクスチャパラメータを設定する。| glTexParameterf 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
テクスチャマッピングは、デカールやセロハンの収縮包装のように画像を物体の表面に適用する手法である。画像は (s, t)
座標系を持つテクスチャ空間で作成される。テクスチャは 1 次元または 2
次元の画像と、画像からサンプルを導く方法を決定するパラメータの集合からなる。glTexParameter は params の値を
pname で指定したテクスチャパラメータに代入する。target は対象テクスチャ (GL_TEXTURE_1D または
GL_TEXTURE_2D)
を定義する。縮小処理でより多くのテクスチャ要素をサンプリングするほどエイリアシングは目立たなくなる。GL_NEAREST と
GL_LINEAR は他の 4 つより高速だが 1 個または 4
個のテクスチャ要素しかサンプリングしないためモアレやギザギザを生じうる。GL_TEXTURE_MIN_FILTER の既定値は
GL_NEAREST_MIPMAP_LINEAR。テクスチャリングが有効で MIN_FILTER
がミップマップを要求する関数のとき、現在定義されているテクスチャ画像の寸法がミップマップの正しい順序に従わない、必要数より少ない、または成分数が異なる場合は、テクスチャマッピング無効と同じ扱いになる。線形フィルタリングは
2D テクスチャでは 4 近傍、1D テクスチャでは 2 近傍のテクスチャ要素にアクセスする。


%index
glTexParameterfv
テクスチャパラメータを設定する。| glTexParameterfv 関数 (Gl.h)
%prm
target, pname, params
target : [int] 対象テクスチャ。GL_TEXTURE_1D または GL_TEXTURE_2D でなければならない。
pname : [int] 単一値テクスチャパラメータのシンボル名。pname は次のシンボルを受け付ける: GL_TEXTURE_MIN_FILTER (テクスチャ縮小関数。1 ピクセルが 1 テクスチャ要素以上にマップされる場合に使われる。6 種類の関数がある)、GL_TEXTURE_MAG_FILTER (テクスチャ拡大関数。GL_NEAREST または GL_LINEAR)、GL_TEXTURE_WRAP_S (s 座標のラップ。GL_CLAMP または GL_REPEAT、既定 GL_REPEAT)、GL_TEXTURE_WRAP_T (t 座標のラップ。同上)、GL_TEXTURE_BORDER_COLOR (境界色。params に RGBA の 4 値、既定 (0,0,0,0))、GL_TEXTURE_PRIORITY (現在バインドされているテクスチャの常駐優先度。[0,1])。
params : [int] 
%inst
テクスチャパラメータを設定する。| glTexParameterfv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
テクスチャマッピングは、デカールやセロハンの収縮包装のように画像を物体の表面に適用する手法である。画像は (s, t)
座標系を持つテクスチャ空間で作成される。テクスチャは 1 次元または 2
次元の画像と、画像からサンプルを導く方法を決定するパラメータの集合からなる。glTexParameter は params の値を
pname で指定したテクスチャパラメータに代入する。target は対象テクスチャ (GL_TEXTURE_1D または
GL_TEXTURE_2D)
を定義する。縮小処理でより多くのテクスチャ要素をサンプリングするほどエイリアシングは目立たなくなる。GL_NEAREST と
GL_LINEAR は他の 4 つより高速だが 1 個または 4
個のテクスチャ要素しかサンプリングしないためモアレやギザギザを生じうる。GL_TEXTURE_MIN_FILTER の既定値は
GL_NEAREST_MIPMAP_LINEAR。MIN_FILTER
がミップマップを要求する関数のとき、テクスチャ画像の寸法がミップマップの正しい順序に従わない、必要数より少ない、または成分数が異なる場合は、テクスチャマッピング無効と同じ扱いになる。線形フィルタリングは
2D テクスチャでは 4 近傍、1D テクスチャでは 2 近傍のテクスチャ要素にアクセスする。関連情報は
glGetTexParameter で取得できる。


%index
glTexParameteri
テクスチャパラメータを設定する。| glTexParameteri 関数 (Gl.h)
%prm
target, pname, param2
target : [int] 対象テクスチャ。GL_TEXTURE_1D または GL_TEXTURE_2D でなければならない。
pname : [int] 単一値テクスチャパラメータのシンボル名。pname は次のシンボルを受け付ける: GL_TEXTURE_MIN_FILTER (テクスチャ縮小関数。1 ピクセルが 1 テクスチャ要素以上にマップされる場合に使われる。6 種類の関数がある)、GL_TEXTURE_MAG_FILTER (テクスチャ拡大関数。GL_NEAREST または GL_LINEAR)、GL_TEXTURE_WRAP_S (s 座標のラップ。GL_CLAMP または GL_REPEAT、既定 GL_REPEAT)、GL_TEXTURE_WRAP_T (t 座標のラップ。同上)、GL_TEXTURE_BORDER_COLOR (境界色。params に RGBA の 4 値、既定 (0,0,0,0))、GL_TEXTURE_PRIORITY (現在バインドされているテクスチャの常駐優先度。[0,1])。
param2 : [int] 
%inst
テクスチャパラメータを設定する。| glTexParameteri 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
テクスチャマッピングは、デカールやセロハンの収縮包装のように画像を物体の表面に適用する手法である。画像は (s, t)
座標系を持つテクスチャ空間で作成される。テクスチャは 1 次元または 2
次元の画像と、画像からサンプルを導く方法を決定するパラメータの集合からなる。glTexParameter は params の値を
pname で指定したテクスチャパラメータに代入する。target は対象テクスチャ (GL_TEXTURE_1D または
GL_TEXTURE_2D)
を定義する。縮小処理でより多くのテクスチャ要素をサンプリングするほどエイリアシングは目立たなくなる。GL_NEAREST と
GL_LINEAR は他の 4 つより高速だが 1 個または 4
個のテクスチャ要素しかサンプリングしないためモアレやギザギザを生じうる。GL_TEXTURE_MIN_FILTER の既定値は
GL_NEAREST_MIPMAP_LINEAR。MIN_FILTER
がミップマップを要求する関数のとき、テクスチャ画像の寸法がミップマップの正しい順序に従わない、必要数より少ない、または成分数が異なる場合は、テクスチャマッピング無効と同じ扱いになる。線形フィルタリングは
2D テクスチャでは 4 近傍、1D テクスチャでは 2 近傍のテクスチャ要素にアクセスする。関連情報は
glGetTexParameter で取得できる。


%index
glTexParameteriv
テクスチャパラメータを設定する。| glTexParameteriv 関数 (Gl.h)
%prm
target, pname, params
target : [int] 対象テクスチャ。GL_TEXTURE_1D または GL_TEXTURE_2D でなければならない。
pname : [int] 単一値テクスチャパラメータのシンボル名。pname は次のシンボルを受け付ける: GL_TEXTURE_MIN_FILTER (テクスチャ縮小関数。1 ピクセルが 1 テクスチャ要素以上にマップされる場合に使われる。6 種類の関数がある)、GL_TEXTURE_MAG_FILTER (テクスチャ拡大関数。GL_NEAREST または GL_LINEAR)、GL_TEXTURE_WRAP_S (s 座標のラップ。GL_CLAMP または GL_REPEAT、既定 GL_REPEAT)、GL_TEXTURE_WRAP_T (t 座標のラップ。同上)、GL_TEXTURE_BORDER_COLOR (境界色。params に RGBA の 4 値、既定 (0,0,0,0))、GL_TEXTURE_PRIORITY (現在バインドされているテクスチャの常駐優先度。[0,1])。
params : [int] 
%inst
テクスチャパラメータを設定する。| glTexParameteriv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
テクスチャマッピングは、デカールやセロハンの収縮包装のように画像を物体の表面に適用する手法である。画像は (s, t)
座標系を持つテクスチャ空間で作成される。テクスチャは 1 次元または 2
次元の画像と、画像からサンプルを導く方法を決定するパラメータの集合からなる。glTexParameter は params の値を
pname で指定したテクスチャパラメータに代入する。target は対象テクスチャ (GL_TEXTURE_1D または
GL_TEXTURE_2D)
を定義する。縮小処理でより多くのテクスチャ要素をサンプリングするほどエイリアシングは目立たなくなる。GL_NEAREST と
GL_LINEAR は他の 4 つより高速だが 1 個または 4
個のテクスチャ要素しかサンプリングしないためモアレやギザギザを生じうる。GL_TEXTURE_MIN_FILTER の既定値は
GL_NEAREST_MIPMAP_LINEAR。MIN_FILTER
がミップマップを要求する関数のとき、テクスチャ画像の寸法がミップマップの正しい順序に従わない、必要数より少ない、または成分数が異なる場合は、テクスチャマッピング無効と同じ扱いになる。線形フィルタリングは
2D テクスチャでは 4 近傍、1D テクスチャでは 2 近傍のテクスチャ要素にアクセスする。関連情報は
glGetTexParameter で取得できる。


%index
glTexSubImage1D
glTexSubImage1D 関数は既存の 1 次元テクスチャ画像の一部を指定する。glTexSubImage1D で新しいテクスチャを定義することはできない。
%prm
target, level, xoffset, width, format, type, pixels
target : [int] 対象テクスチャ。GL_TEXTURE_1D でなければならない。
level : [int] 詳細度レベル番号。レベル 0 が基本イメージ、レベル n は n 段階目のミップマップ縮小画像。
xoffset : [int] テクスチャ配列内の x 方向のテクセルオフセット。
width : [int] テクスチャサブ画像の幅。
format : [int] ピクセルデータのフォーマット。受け付ける主な値: GL_COLOR_INDEX (カラーインデックス。固定小数化、GL_INDEX_SHIFT/OFFSET 適用後 GL_PIXEL_MAP_I_TO_R/G/B/A で色成分に変換)、GL_STENCIL_INDEX (ステンシル値。glReadPixels 用)、GL_DEPTH_COMPONENT (デプス値。浮動小数化し GL_DEPTH_SCALE/BIAS を適用後 [0,1] にクランプ)、GL_RED/GL_GREEN/GL_BLUE/GL_ALPHA (それぞれ単一成分を浮動小数化して RGBA 要素に組み立て、scale/bias 適用後クランプ)、GL_RGB (RGB トリプル)、GL_RGBA (完全 RGBA)、GL_BGR_EXT/GL_BGRA_EXT (Windows DIB のメモリレイアウトに一致するフォーマット)、GL_LUMINANCE (単一輝度値を R/G/B に複製しアルファに 1.0 を付加)、GL_LUMINANCE_ALPHA (輝度/アルファペア)。
type : [int] ピクセルデータのデータ型。受け付けるシンボル値: GL_UNSIGNED_BYTE、GL_BYTE、GL_BITMAP、GL_UNSIGNED_SHORT、GL_SHORT、GL_UNSIGNED_INT、GL_INT、GL_FLOAT。
pixels : [intptr] メモリ内の画像データへのポインタ。
%inst
glTexSubImage1D 関数は既存の 1 次元テクスチャ画像の一部を指定する。glTexSubImage1D
で新しいテクスチャを定義することはできない。

[戻り値]
この関数は値を返さない。

[備考]
プリミティブの 1 次元テクスチャリングは glEnable / glDisable に GL_TEXTURE_1D
を指定して有効化/無効化する。テクスチャリング中は指定したテクスチャ画像の一部が有効な各プリミティブにマップされる。glTexSubImage1D
は既存の 1 次元テクスチャ画像の連続するサブ画像をテクスチャリング用に指定する。pixels が参照するテクセルは、xoffset から
xoffset + (width-1) までの x
インデックス範囲の既存テクスチャ配列領域を置き換える。この領域は元のテクスチャ配列の範囲外のテクセルを含めることはできない。width=0
のサブ画像指定は効果を持たずエラーも生成しない。カラーインデックスモードではテクスチャリングは効果を持たない。一般にテクスチャ画像は
glDrawPixels と同じデータ形式で表現できるが、GL_STENCIL_INDEX と GL_DEPTH_COMPONENT
は使用できない。glPixelStore と glPixelTransfer のモードは glDrawPixels
と同じくテクスチャ画像に影響する。関連情報は glGetTexImage、glIsEnabled (GL_TEXTURE_1D)
で取得できる。


%index
glTexSubImage2D
glTexSubImage2D 関数は既存のテクスチャ画像の一部を指定する。glTexSubImage2D で新しいテクスチャを定義することはできない。
%prm
target, level, xoffset, yoffset, width, height, format, type, pixels
target : [int] 対象テクスチャ。GL_TEXTURE_2D でなければならない。
level : [int] 詳細度レベル番号。レベル 0 が基本イメージ、レベル n は n 段階目のミップマップ縮小画像。
xoffset : [int] テクスチャ配列内の x 方向のテクセルオフセット。
yoffset : [int] テクスチャ配列内の y 方向のテクセルオフセット。
width : [int] テクスチャサブ画像の幅。
height : [int] テクスチャサブ画像の高さ。
format : [int] ピクセルデータのフォーマット。受け付ける主な値: GL_COLOR_INDEX (カラーインデックス。固定小数化、GL_INDEX_SHIFT/OFFSET 適用後 GL_PIXEL_MAP_I_TO_R/G/B/A で色成分に変換)、GL_STENCIL_INDEX (ステンシル値。glReadPixels 用)、GL_DEPTH_COMPONENT (デプス値。浮動小数化し GL_DEPTH_SCALE/BIAS を適用後 [0,1] にクランプ)、GL_RED/GL_GREEN/GL_BLUE/GL_ALPHA (それぞれ単一成分を浮動小数化して RGBA 要素に組み立て、scale/bias 適用後クランプ)、GL_RGB (RGB トリプル)、GL_RGBA (完全 RGBA)、GL_BGR_EXT/GL_BGRA_EXT (Windows DIB のメモリレイアウトに一致するフォーマット)、GL_LUMINANCE (単一輝度値を R/G/B に複製しアルファに 1.0 を付加)、GL_LUMINANCE_ALPHA (輝度/アルファペア)。
type : [int] ピクセルデータのデータ型。受け付けるシンボル値: GL_UNSIGNED_BYTE、GL_BYTE、GL_BITMAP、GL_UNSIGNED_SHORT、GL_SHORT、GL_UNSIGNED_INT、GL_INT、GL_FLOAT。
pixels : [intptr] メモリ内の画像データへのポインタ。
%inst
glTexSubImage2D 関数は既存のテクスチャ画像の一部を指定する。glTexSubImage2D
で新しいテクスチャを定義することはできない。

[戻り値]
この関数は値を返さない。

[備考]
プリミティブの 2 次元テクスチャリングは glEnable / glDisable に GL_TEXTURE_2D
を指定して有効化する。テクスチャリング中は指定したテクスチャ画像の一部が有効な各プリミティブにマップされる。glTexSubImage2D
は既存の 2 次元テクスチャ画像の連続するサブ画像をテクスチャリング用に指定する。pixels が参照するテクセルは、xoffset から
xoffset + (width-1) までの x インデックス、yoffset から yoffset + (height-1) までの
y インデックスの既存テクスチャ配列領域を置き換える。この領域は元のテクスチャ配列の範囲外を含めることはできない。width=0
のサブ画像指定は効果を持たずエラーも生成しない。カラーインデックスモードでは効果を持たない。一般にテクスチャ画像は
GL_STENCIL_INDEX と GL_DEPTH_COMPONENT 以外は glDrawPixels
と同じデータ形式で表現できる。glPixelStore と glPixelTransfer は glDrawPixels
と同じく影響する。関連情報は glGetTexImage、glIsEnabled (GL_TEXTURE_2D) で取得できる。


%index
glTranslated
glTranslated 関数は現在の行列に平行移動行列を乗じる。
%prm
x, y, z
x : [double] 平行移動ベクトルの x 座標。
y : [double] 平行移動ベクトルの y 座標。
z : [double] 平行移動ベクトルの z 座標。
%inst
glTranslated 関数は現在の行列に平行移動行列を乗じる。

[戻り値]
この関数は値を返さない。

[備考]
glTranslated は (x, y, z) で指定される平行移動を行う。平行移動ベクトルは 4x4
平行移動行列の計算に使われる。現在の行列 (glMatrixMode 参照) にこの行列を乗じ、その積で現在の行列を置き換える。M
が現在の行列で T が平行移動行列なら M は M?T に置き換わる。行列モードが GL_MODELVIEW または
GL_PROJECTION なら、glTranslated
呼び出し以降に描画される全オブジェクトが平行移動する。移動前の座標系を保存/復元するには glPushMatrix /
glPopMatrix を使う。関連情報は glGet (GL_MATRIX_MODE / GL_MODELVIEW_MATRIX /
GL_PROJECTION_MATRIX / GL_TEXTURE_MATRIX) で取得できる。


%index
glTranslatef
glTranslatef 関数は現在の行列に平行移動行列を乗じる。
%prm
x, y, z
x : [float] 平行移動ベクトルの x 座標。
y : [float] 平行移動ベクトルの y 座標。
z : [float] 平行移動ベクトルの z 座標。
%inst
glTranslatef 関数は現在の行列に平行移動行列を乗じる。

[戻り値]
この関数は値を返さない。

[備考]
glTranslatef は (x, y, z) で指定される平行移動を行う。平行移動ベクトルは 4x4
平行移動行列の計算に使われる。現在の行列 (glMatrixMode 参照) にこの行列を乗じ、その積で現在の行列を置き換える。M
が現在の行列で T が平行移動行列なら M は M?T に置き換わる。行列モードが GL_MODELVIEW または
GL_PROJECTION なら、glTranslatef
呼び出し以降に描画される全オブジェクトが平行移動する。移動前の座標系を保存/復元するには glPushMatrix /
glPopMatrix を使う。関連情報は glGet (GL_MATRIX_MODE / GL_MODELVIEW_MATRIX /
GL_PROJECTION_MATRIX / GL_TEXTURE_MATRIX) で取得できる。


%index
glVertex2d
頂点を指定する。| glVertex2d 関数 (Gl.h)
%prm
x, y
x : [double] 頂点の x 座標を指定する。
y : [double] 頂点の y 座標を指定する。
%inst
頂点を指定する。| glVertex2d 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glVertex 関数群は glBegin / glEnd ペア内で使い、点・線・ポリゴンの頂点を指定する。glVertex
呼び出し時には現在のカラー、法線、テクスチャ座標が頂点に関連付けられる。x, y のみ指定時は z=0.0、w=1.0 が既定。x, y,
z 指定時は w=1.0 が既定。glBegin / glEnd ペア外で glVertex を呼ぶと動作は未定義。


%index
glVertex2dv
頂点を指定する。| glVertex2dv 関数 (Gl.h)
%prm
v
v : [var] 頂点の x, y 座標である 2 要素配列へのポインタ。
%inst
頂点を指定する。| glVertex2dv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。


%index
glVertex2f
頂点を指定する。| glVertex2f 関数 (Gl.h)
%prm
x, y
x : [float] 頂点の x 座標を指定する。
y : [float] 頂点の y 座標を指定する。
%inst
頂点を指定する。| glVertex2f 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glVertex 関数群は glBegin / glEnd ペア内で使い、点・線・ポリゴンの頂点を指定する。glVertex
呼び出し時には現在のカラー、法線、テクスチャ座標が頂点に関連付けられる。x, y のみ指定時は z=0.0、w=1.0 が既定。x, y,
z 指定時は w=1.0 が既定。glBegin / glEnd ペア外で glVertex を呼ぶと動作は未定義。


%index
glVertex2fv
頂点を指定する。| glVertex2fv 関数 (Gl.h)
%prm
v
v : [var] 頂点の x, y 座標である 2 要素配列へのポインタ。
%inst
頂点を指定する。| glVertex2fv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。


%index
glVertex2i
頂点を指定する。| glVertex2i 関数 (Gl.h)
%prm
x, y
x : [int] 頂点の x 座標を指定する。
y : [int] 頂点の y 座標を指定する。
%inst
頂点を指定する。| glVertex2i 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glVertex 関数群は glBegin / glEnd ペア内で使い、点・線・ポリゴンの頂点を指定する。glVertex
呼び出し時には現在のカラー、法線、テクスチャ座標が頂点に関連付けられる。x, y のみ指定時は z=0.0、w=1.0 が既定。x, y,
z 指定時は w=1.0 が既定。glBegin / glEnd ペア外で glVertex を呼ぶと動作は未定義。


%index
glVertex2iv
頂点を指定する。| glVertex2iv 関数 (Gl.h)
%prm
v
v : [var] 頂点の x, y 座標である 2 要素配列へのポインタ。
%inst
頂点を指定する。| glVertex2iv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。


%index
glVertex2s
頂点を指定する。| glVertex2s 関数 (Gl.h)
%prm
x, y
x : [int] 頂点の x 座標を指定する。
y : [int] 頂点の y 座標を指定する。
%inst
頂点を指定する。| glVertex2s 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glVertex 関数群は glBegin / glEnd ペア内で使い、点・線・ポリゴンの頂点を指定する。glVertex
呼び出し時には現在のカラー、法線、テクスチャ座標が頂点に関連付けられる。x, y のみ指定時は z=0.0、w=1.0 が既定。x, y,
z 指定時は w=1.0 が既定。glBegin / glEnd ペア外で glVertex を呼ぶと動作は未定義。


%index
glVertex2sv
頂点を指定する。| glVertex2sv 関数 (Gl.h)
%prm
v
v : [var] 頂点の x, y 座標である 2 要素配列へのポインタ。
%inst
頂点を指定する。| glVertex2sv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。


%index
glVertex3d
頂点を指定する。| glVertex3d 関数 (Gl.h)
%prm
x, y, z
x : [double] 頂点の x 座標を指定する。
y : [double] 頂点の y 座標を指定する。
z : [double] 頂点の z 座標を指定する。
%inst
頂点を指定する。| glVertex3d 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glVertex 関数群は glBegin / glEnd ペア内で使い、点・線・ポリゴンの頂点を指定する。glVertex
呼び出し時には現在のカラー、法線、テクスチャ座標が頂点に関連付けられる。x, y のみ指定時は z=0.0、w=1.0 が既定。x, y,
z 指定時は w=1.0 が既定。glBegin / glEnd ペア外で glVertex を呼ぶと動作は未定義。


%index
glVertex3dv
頂点を指定する。| glVertex3dv 関数 (Gl.h)
%prm
v
v : [var] 頂点の x, y, z 座標である 3 要素配列へのポインタ。
%inst
頂点を指定する。| glVertex3dv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。


%index
glVertex3f
頂点を指定する。| glVertex3f 関数 (Gl.h)
%prm
x, y, z
x : [float] 頂点の x 座標を指定する。
y : [float] 頂点の y 座標を指定する。
z : [float] 頂点の z 座標を指定する。
%inst
頂点を指定する。| glVertex3f 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glVertex 関数群は glBegin / glEnd ペア内で使い、点・線・ポリゴンの頂点を指定する。glVertex
呼び出し時には現在のカラー、法線、テクスチャ座標が頂点に関連付けられる。x, y のみ指定時は z=0.0、w=1.0 が既定。x, y,
z 指定時は w=1.0 が既定。glBegin / glEnd ペア外で glVertex を呼ぶと動作は未定義。


%index
glVertex3fv
頂点を指定する。| glVertex3fv 関数 (Gl.h)
%prm
v
v : [var] 頂点の x, y, z 座標である 3 要素配列へのポインタ。
%inst
頂点を指定する。| glVertex3fv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。


%index
glVertex3i
頂点を指定する。| glVertex3i 関数 (Gl.h)
%prm
x, y, z
x : [int] 頂点の x 座標を指定する。
y : [int] 頂点の y 座標を指定する。
z : [int] 頂点の z 座標を指定する。
%inst
頂点を指定する。| glVertex3i 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glVertex 関数群は glBegin / glEnd ペア内で使い、点・線・ポリゴンの頂点を指定する。glVertex
呼び出し時には現在のカラー、法線、テクスチャ座標が頂点に関連付けられる。x, y のみ指定時は z=0.0、w=1.0 が既定。x, y,
z 指定時は w=1.0 が既定。glBegin / glEnd ペア外で glVertex を呼ぶと動作は未定義。


%index
glVertex3iv
頂点を指定する。| glVertex3iv 関数 (Gl.h)
%prm
v
v : [var] 頂点の x, y, z 座標である 3 要素配列へのポインタ。
%inst
頂点を指定する。| glVertex3iv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。


%index
glVertex3s
頂点を指定する。| glVertex3s 関数 (Gl.h)
%prm
x, y, z
x : [int] 頂点の x 座標を指定する。
y : [int] 頂点の y 座標を指定する。
z : [int] 頂点の z 座標を指定する。
%inst
頂点を指定する。| glVertex3s 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glVertex 関数群は glBegin / glEnd ペア内で使い、点・線・ポリゴンの頂点を指定する。glVertex
呼び出し時には現在のカラー、法線、テクスチャ座標が頂点に関連付けられる。x, y のみ指定時は z=0.0、w=1.0 が既定。x, y,
z 指定時は w=1.0 が既定。glBegin / glEnd ペア外で glVertex を呼ぶと動作は未定義。


%index
glVertex3sv
頂点を指定する。| glVertex3sv 関数 (Gl.h)
%prm
v
v : [var] 頂点の x, y, z 座標である 3 要素配列へのポインタ。
%inst
頂点を指定する。| glVertex3sv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。


%index
glVertex4d
頂点を指定する。| glVertex4d 関数 (Gl.h)
%prm
x, y, z, w
x : [double] 頂点の x 座標を指定する。
y : [double] 頂点の y 座標を指定する。
z : [double] 頂点の z 座標を指定する。
w : [double] 頂点の w 座標を指定する。
%inst
頂点を指定する。| glVertex4d 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glVertex 関数群は glBegin / glEnd ペア内で使い、点・線・ポリゴンの頂点を指定する。glVertex
呼び出し時には現在のカラー、法線、テクスチャ座標が頂点に関連付けられる。x, y のみ指定時は z=0.0、w=1.0 が既定。x, y,
z 指定時は w=1.0 が既定。glBegin / glEnd ペア外で glVertex を呼ぶと動作は未定義。


%index
glVertex4dv
頂点を指定する。| glVertex4dv 関数 (Gl.h)
%prm
v
v : [var] 頂点の x, y, z, w 座標である 4 要素配列へのポインタ。
%inst
頂点を指定する。| glVertex4dv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。


%index
glVertex4f
頂点を指定する。| glVertex4f 関数 (Gl.h)
%prm
x, y, z, w
x : [float] 頂点の x 座標を指定する。
y : [float] 頂点の y 座標を指定する。
z : [float] 頂点の z 座標を指定する。
w : [float] 頂点の w 座標を指定する。
%inst
頂点を指定する。| glVertex4f 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glVertex 関数群は glBegin / glEnd ペア内で使い、点・線・ポリゴンの頂点を指定する。glVertex
呼び出し時には現在のカラー、法線、テクスチャ座標が頂点に関連付けられる。x, y のみ指定時は z=0.0、w=1.0 が既定。x, y,
z 指定時は w=1.0 が既定。glBegin / glEnd ペア外で glVertex を呼ぶと動作は未定義。


%index
glVertex4fv
頂点を指定する。| glVertex4fv 関数 (Gl.h)
%prm
v
v : [var] 頂点の x, y, z, w 座標である 4 要素配列へのポインタ。
%inst
頂点を指定する。| glVertex4fv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。


%index
glVertex4i
頂点を指定する。| glVertex4i 関数 (Gl.h)
%prm
x, y, z, w
x : [int] 頂点の x 座標を指定する。
y : [int] 頂点の y 座標を指定する。
z : [int] 頂点の z 座標を指定する。
w : [int] 頂点の w 座標を指定する。
%inst
頂点を指定する。| glVertex4i 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glVertex 関数群は glBegin / glEnd ペア内で使い、点・線・ポリゴンの頂点を指定する。glVertex
呼び出し時には現在のカラー、法線、テクスチャ座標が頂点に関連付けられる。x, y のみ指定時は z=0.0、w=1.0 が既定。x, y,
z 指定時は w=1.0 が既定。glBegin / glEnd ペア外で glVertex を呼ぶと動作は未定義。


%index
glVertex4iv
頂点を指定する。| glVertex4iv 関数 (Gl.h)
%prm
v
v : [var] 頂点の x, y, z, w 座標である 4 要素配列へのポインタ。
%inst
頂点を指定する。| glVertex4iv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。


%index
glVertex4s
頂点を指定する。| glVertex4s 関数 (Gl.h)
%prm
x, y, z, w
x : [int] 頂点の x 座標を指定する。
y : [int] 頂点の y 座標を指定する。
z : [int] 頂点の z 座標を指定する。
w : [int] 頂点の w 座標を指定する。
%inst
頂点を指定する。| glVertex4s 関数 (Gl.h)

[戻り値]
この関数は値を返さない。

[備考]
glVertex 関数群は glBegin / glEnd ペア内で使い、点・線・ポリゴンの頂点を指定する。glVertex
呼び出し時には現在のカラー、法線、テクスチャ座標が頂点に関連付けられる。x, y のみ指定時は z=0.0、w=1.0 が既定。x, y,
z 指定時は w=1.0 が既定。glBegin / glEnd ペア外で glVertex を呼ぶと動作は未定義。


%index
glVertex4sv
頂点を指定する。| glVertex4sv 関数 (Gl.h)
%prm
v
v : [var] 頂点の x, y, z, w 座標である 4 要素配列へのポインタ。
%inst
頂点を指定する。| glVertex4sv 関数 (Gl.h)

[戻り値]
この関数は値を返さない。


%index
glVertexPointer
glVertexPointer 関数は頂点データ配列を定義する。
%prm
size, type, stride, pointer
size : [int] 頂点あたりの座標数。size は 2、3、4 のいずれか。
type : [int] 配列内の各座標のデータ型。GL_SHORT、GL_INT、GL_FLOAT、GL_DOUBLE のシンボル定数を使う。
stride : [int] 連続する頂点間のバイトオフセット。stride が 0 なら頂点は密にパックされる。
pointer : [intptr] 配列内の最初の頂点の最初の座標へのポインタ。
%inst
glVertexPointer 関数は頂点データ配列を定義する。

[戻り値]
この関数は値を返さない。

[備考]
glVertexPointer はレンダリング時に使用する頂点座標配列の位置とデータを指定する。size は頂点あたりの座標数、type
は各頂点座標のデータ型、stride は頂点間のバイトオフセットを指定し、頂点と属性を 1
つの配列にパックするか別配列に格納するかを可能にする (glInterleavedArrays
参照)。glEnableClientState に GL_VERTEX_ARRAY を指定して頂点配列を有効化する。有効時は
glDrawArrays、glDrawElements、glArrayElement
が頂点配列を使う。既定では無効。glVertexPointer は表示リストに含められない。クライアント側状態のため
glPushAttrib / glPopAttrib では保存/復元されない。glBegin / glEnd
ペア内で呼び出してもエラーは生成されないが結果は未定義。関連情報は glGet
(GL_VERTEX_ARRAY_SIZE/STRIDE/COUNT/TYPE)、glGetPointerv
(GL_VERTEX_ARRAY_POINTER)、glIsEnabled (GL_VERTEX_ARRAY) で取得できる。


%index
glViewport
glViewport 関数はビューポートを設定する。
%prm
x, y, width, height
x : [int] ビューポート矩形の左下隅 (ピクセル単位)。既定値は (0,0)。
y : [int] ビューポート矩形の左下隅 (ピクセル単位)。既定値は (0,0)。
width : [int] ビューポートの幅。OpenGL コンテキストが最初にウィンドウへアタッチされたとき、width / height はウィンドウの寸法に設定される。
height : [int] ビューポートの高さ。OpenGL コンテキストが最初にウィンドウへアタッチされたとき、width / height はウィンドウの寸法に設定される。
%inst
glViewport 関数はビューポートを設定する。

[戻り値]
この関数は値を返さない。

[備考]
glViewport は正規化デバイス座標からウィンドウ座標への x, y
のアフィン変換を指定する。ビューポートの幅と高さは実装依存の範囲に暗黙にクランプされる。この範囲は glGet
(GL_MAX_VIEWPORT_DIMS) で問い合わせる。関連情報は glGet (GL_VIEWPORT /
GL_MAX_VIEWPORT_DIMS) で取得できる。


%index
wglDeleteContext
wglDeleteContext 関数は指定された OpenGL レンダリングコンテキストを削除する。
%prm
param0
param0 : [intptr] 
%inst
wglDeleteContext 関数は指定された OpenGL レンダリングコンテキストを削除する。

[戻り値]
関数が成功した場合は TRUE、失敗した場合は FALSE を返す。拡張エラー情報は GetLastError で取得する。

[備考]
他のスレッドのカレントコンテキストである OpenGL
レンダリングコンテキストを削除することはエラーである。ただし、呼び出しスレッド自身のカレントコンテキストである場合、wglDeleteContext
は削除前にそのレンダリングコンテキストを非カレントにする。wglDeleteContext は wglMakeCurrent で
OpenGL レンダリングコンテキストに関連付けられたデバイスコンテキストを削除しない。wglDeleteContext を呼び出した後は
DeleteDC で関連付けられたデバイスコンテキストを削除する必要がある。


%index
wglCopyContext
wglCopyContext 関数はある OpenGL レンダリングコンテキストから別のレンダリングコンテキストへ選択したレンダリング状態のグループをコピーする。
%prm
param0, param1, param2
param0 : [intptr] 
param1 : [intptr] 
param2 : [int] 
%inst
wglCopyContext 関数はある OpenGL
レンダリングコンテキストから別のレンダリングコンテキストへ選択したレンダリング状態のグループをコピーする。

[戻り値]
関数が成功した場合は TRUE、失敗した場合は FALSE を返す。拡張エラー情報は GetLastError で取得する。

[備考]
wglCopyContext を使うと 2 つのレンダリングコンテキストのレンダリング状態を同期できる。同じプロセス内の 2
つのレンダリングコンテキスト間でのみコピー可能で、両方が同じ OpenGL
実装でなければならない。例えば、同じプロセス内で同一ピクセルフォーマットの 2
つのレンダリングコンテキスト間ではいつでもレンダリング状態をコピーできる。コピーできる状態情報は glPushAttrib
で利用できるものと同じ。一部の状態 (ピクセルパック/アンパック状態、レンダーモード状態、セレクト状態、フィードバック状態など)
はコピーできない。wglCopyContext 呼び出し時は、コピー先 hglrcDst がどのスレッドのカレントでもないことを確認する。


%index
wglCreateContext
wglCreateContext 関数は hdc が参照するデバイスへの描画に適した新しい OpenGL レンダリングコンテキストを作成する。レンダリングコンテキストはデバイスコンテキストと同じピクセルフォーマットを持つ。
%prm
param0
param0 : [intptr] 
%inst
wglCreateContext 関数は hdc が参照するデバイスへの描画に適した新しい OpenGL
レンダリングコンテキストを作成する。レンダリングコンテキストはデバイスコンテキストと同じピクセルフォーマットを持つ。

[戻り値]
成功時は OpenGL レンダリングコンテキストへの有効なハンドルを返す。失敗時は NULL。拡張エラー情報は GetLastError
で取得する。

[備考]

レンダリングコンテキストはデバイスコンテキストとは異なる。レンダリングコンテキストを作成する前にデバイスコンテキストのピクセルフォーマットを設定する。詳細は
SetPixelFormat 関数を参照。OpenGL
を使うには、レンダリングコンテキストを作成し、それをスレッドのカレントレンダリングコンテキストとして選択した後、OpenGL
関数を呼ぶ。使い終わったら wglDeleteContext で破棄する。次のコード例は wglCreateContext
の使い方を示す。
このドキュメントは省略されている。


%index
wglCreateLayerContext
wglCreateLayerContext 関数はデバイスコンテキスト上の指定したレイヤープレーンへ描画するための新しい OpenGL レンダリングコンテキストを作成する。
%prm
param0, param1
param0 : [intptr] 
param1 : [int] 
%inst
wglCreateLayerContext 関数はデバイスコンテキスト上の指定したレイヤープレーンへ描画するための新しい OpenGL
レンダリングコンテキストを作成する。

[戻り値]
成功時は OpenGL レンダリングコンテキストへのハンドルを返す。失敗時は NULL。拡張エラー情報は GetLastError
で取得する。

[備考]
レンダリングコンテキストは、すべての OpenGL コマンドが通過するポートである。OpenGL 呼び出しを行うすべてのスレッドは、1
つのカレント (アクティブ)
なレンダリングコンテキストを持つ必要がある。レンダリングコンテキストはデバイスコンテキストとは異なる。レンダリングコンテキストは
OpenGL 固有の情報を持ち、デバイスコンテキストは GDI
固有の情報を持つ。レンダリングコンテキストを作成する前に、SetPixelFormat
関数でデバイスコンテキストのピクセルフォーマットを設定する。レンダリングコンテキストは、同一ピクセルフォーマットを持つウィンドウの指定したレイヤープレーンでのみ使用できる。マルチスレッドの
OpenGL
アプリケーションでは、レンダリングコンテキストを作成し、それをスレッドのカレントレンダリングコンテキストとして選択し、そのスレッドで
OpenGL 呼び出しを行う。スレッドのレンダリングコンテキストを使い終わったら wglDeleteContext を呼ぶ。


%index
wglDescribeLayerPlane
wglDescribeLayerPlane 関数は指定したピクセルフォーマットのレイヤープレーンに関する情報を取得する。
%prm
param0, param1, param2, param3, param4
param0 : [intptr] 
param1 : [int] 
param2 : [int] 
param3 : [int] 
param4 : [var] 
%inst
wglDescribeLayerPlane 関数は指定したピクセルフォーマットのレイヤープレーンに関する情報を取得する。

[戻り値]
成功時は TRUE を返し、wglDescribeLayerPlane は指定したピクセルフォーマット (iPixelFormat)
の指定したレイヤープレーン (iLayerPlane) に従って plpd が指す LAYERPLANEDESCRIPTOR
のメンバーを設定する。失敗時は FALSE を返す。

[備考]
プレーンの番号付け (iLayerPlane) は順序を決定する。番号が大きいプレーンは番号が小さいプレーンの上に重ねられる。


%index
wglGetCurrentContext
wglGetCurrentContext 関数は呼び出しスレッドのカレント OpenGL レンダリングコンテキストへのハンドルを取得する。
%prm

%inst
wglGetCurrentContext 関数は呼び出しスレッドのカレント OpenGL レンダリングコンテキストへのハンドルを取得する。

[戻り値]
呼び出しスレッドがカレント OpenGL レンダリングコンテキストを持つ場合、wglGetCurrentContext
はそのレンダリングコンテキストへのハンドルを返す。そうでない場合は NULL を返す。

[備考]
スレッドのカレント OpenGL レンダリングコンテキストは wglMakeCurrent
によりデバイスコンテキストに関連付けられる。wglGetCurrentDC でカレント OpenGL
レンダリングコンテキストに関連付けられたデバイスコンテキストへのハンドルを取得できる。


%index
wglGetCurrentDC
wglGetCurrentDC 関数は呼び出しスレッドのカレント OpenGL レンダリングコンテキストに関連付けられたデバイスコンテキストへのハンドルを取得する。
%prm

%inst
wglGetCurrentDC 関数は呼び出しスレッドのカレント OpenGL
レンダリングコンテキストに関連付けられたデバイスコンテキストへのハンドルを取得する。

[戻り値]
呼び出しスレッドがカレント OpenGL レンダリングコンテキストを持つ場合、wglMakeCurrent
によりそのレンダリングコンテキストに関連付けられたデバイスコンテキストへのハンドルを返す。そうでない場合は NULL を返す。

[備考]
デバイスコンテキストは wglMakeCurrent 呼び出し時に OpenGL
レンダリングコンテキストに関連付けられる。wglGetCurrentContext で呼び出しスレッドのカレント OpenGL
レンダリングコンテキストへのハンドルを取得できる。


%index
wglGetLayerPaletteEntries
指定したデバイスコンテキストの指定したカラーインデックスレイヤープレーンからパレットエントリを取得する。
%prm
param0, param1, param2, param3, param4
param0 : [intptr] 
param1 : [int] 
param2 : [int] 
param3 : [int] 
param4 : [var] 
%inst
指定したデバイスコンテキストの指定したカラーインデックスレイヤープレーンからパレットエントリを取得する。

[戻り値]
型: int
関数が成功した場合、戻り値はウィンドウの指定したレイヤープレーンのパレットに設定されたエントリ数。失敗時またはピクセルフォーマットが選択されていない場合は
0。拡張エラー情報は GetLastError で取得する。

[備考]
ウィンドウの各カラーインデックスレイヤープレーンは、レイヤープレーンのビットプレーン数 n に対してサイズ 2^n
のパレットを持つ。パレットの透明インデックスは変更できない。レイヤーパレットを実現するには wglRealizeLayerPalette
を使う。初期状態ではレイヤーパレットには白のエントリのみが含まれる。


%index
wglGetProcAddress
wglGetProcAddress 関数はカレント OpenGL レンダリングコンテキストで使用する OpenGL 拡張関数のアドレスを返す。
%prm
param0
param0 : [str] 
%inst
wglGetProcAddress 関数はカレント OpenGL レンダリングコンテキストで使用する OpenGL
拡張関数のアドレスを返す。

[戻り値]
関数成功時は拡張関数のアドレスを返す。カレントレンダリングコンテキストが無いか失敗時は NULL。拡張エラー情報は
GetLastError で取得する。

[備考]
OpenGL
ライブラリは関数の複数実装をサポートする。あるレンダリングコンテキストでサポートされる拡張関数は別のレンダリングコンテキストで利用できるとは限らない。したがってアプリケーション内のあるレンダリングコンテキストでは
wglGetProcAddress が返す関数アドレスのみを使うこと。lpszProc が指す拡張関数の綴りと大文字小文字は OpenGL
がサポート/実装する関数と同一でなければならない。拡張関数は OpenGL からエクスポートされないため、ベンダー固有拡張関数のアドレスは
wglGetProcAddress
で取得しなければならない。拡張関数アドレスはピクセルフォーマットごとに一意で、同じピクセルフォーマットのすべてのレンダリングコンテキストで共有される。


%index
wglMakeCurrent
wglMakeCurrent 関数は指定された OpenGL レンダリングコンテキストを呼び出しスレッドのカレントレンダリングコンテキストにする。
%prm
param0, param1
param0 : [intptr] 
param1 : [intptr] 
%inst
wglMakeCurrent 関数は指定された OpenGL
レンダリングコンテキストを呼び出しスレッドのカレントレンダリングコンテキストにする。

[戻り値]
wglMakeCurrent 関数が成功した場合は TRUE、それ以外は FALSE を返す。拡張エラー情報は GetLastError
で取得する。

[備考]
hdc は OpenGL がサポートする描画サーフェスを参照する必要がある。hglrc 作成時に wglCreateContext
に渡した hdc と同じである必要はないが、同じデバイス上で同じピクセルフォーマットでなければならない。hdc の GDI
変換やクリッピングはレンダリングコンテキストではサポートされない。カレントレンダリングコンテキストはそのレンダリングコンテキストが非カレントになるまで
hdc を使う。新しいレンダリングコンテキストへ切り替える前に、OpenGL
は呼び出しスレッドのカレントだった以前のレンダリングコンテキストをフラッシュする。スレッドはカレントレンダリングコンテキストを 1
つ持てる。プロセスはマルチスレッドにより複数のレンダリングコンテキストを持てる。スレッドは OpenGL
関数呼び出し前にカレントレンダリングコンテキストを設定する必要があり、未設定なら全 OpenGL
呼び出しは無視される。レンダリングコンテキストは一度に 1
つのスレッドにしかカレントにできず、複数スレッドで同時にカレントにすることはできない。アプリケーションは異なるレンダリングコンテキストを異なるスレッドにカレントにしてマルチスレッド描画を行える。エラー発生時
wglMakeCurrent はスレッドのカレントレンダリングコンテキストを非カレントにしてから返る。


%index
wglRealizeLayerPalette
wglRealizeLayerPalette 関数は指定したカラーインデックスレイヤープレーンのパレットエントリを物理パレットへマップするか、RGBA レイヤープレーンのパレットを初期化する。
%prm
param0, param1, param2
param0 : [intptr] 
param1 : [int] 
param2 : [int] 
%inst
wglRealizeLayerPalette
関数は指定したカラーインデックスレイヤープレーンのパレットエントリを物理パレットへマップするか、RGBA
レイヤープレーンのパレットを初期化する。

[戻り値]
関数が成功した場合、bRealize が TRUE で物理パレットが利用できない場合でも戻り値は
TRUE。失敗時またはピクセルフォーマットが選択されていない場合は FALSE。拡張エラー情報は GetLastError で取得する。

[備考]

レイヤープレーンの物理パレットはレイヤープレーンを持つウィンドウ間で共有される資源である。複数ウィンドウが同じ物理レイヤープレーンのパレットを実現しようとすると、一度に
1 つのパレットしか実現されない。wglRealizeLayerPalette
呼び出し時にはフォアグラウンドウィンドウのレイヤーパレットが常に最初に実現される。ウィンドウのレイヤーパレットが実現されるとき、エントリは常に物理パレットへ
1 対 1 でマップされる。GDI
論理パレットと異なり、他ウィンドウのレイヤーパレットを現在の物理パレットへマップすることはない。ウィンドウがフォアグラウンドになるたびに、レイヤープレーンのピクセル型が
RGBA であっても再度 wglRealizeLayerPalette
を呼び出してレイヤーパレットを実現する必要がある。wglRealizeLayerPalette
はメインプレーンのパレットを実現しないので、メインプレーンパレットには GDI のパレット関数を使う。


%index
wglSetLayerPaletteEntries
指定したデバイスコンテキストの指定したカラーインデックスレイヤープレーンにパレットエントリを設定する。
%prm
param0, param1, param2, param3, param4
param0 : [intptr] 
param1 : [int] 
param2 : [int] 
param3 : [int] 
param4 : [var] 
%inst
指定したデバイスコンテキストの指定したカラーインデックスレイヤープレーンにパレットエントリを設定する。

[戻り値]
型: int
関数が成功した場合、戻り値はウィンドウの指定したレイヤープレーンのパレットに設定されたエントリ数。失敗時またはピクセルフォーマットが選択されていない場合は
0。拡張エラー情報は GetLastError で取得する。

[備考]
ウィンドウの各カラーインデックスプレーンは、レイヤープレーンのビットプレーン数 n に対してサイズ 2^n
のパレットを持つ。パレットの透明インデックスは変更できない。レイヤーパレットを実現するには wglRealizeLayerPalette
を使う。初期状態ではレイヤーパレットには白のエントリのみが含まれる。wglSetLayerPaletteEntries
はメインプレーンパレットのエントリを設定しない。メインプレーンパレットを更新するには GDI のパレット関数を使う。


%index
wglShareLists
wglShareLists 関数は複数の OpenGL レンダリングコンテキストが単一の表示リスト空間を共有することを可能にする。
%prm
param0, param1
param0 : [intptr] 
param1 : [intptr] 
%inst
wglShareLists 関数は複数の OpenGL レンダリングコンテキストが単一の表示リスト空間を共有することを可能にする。

[戻り値]
関数成功時は TRUE。失敗時は FALSE で表示リストは共有されない。拡張エラー情報は GetLastError で取得する。

[備考]
OpenGL レンダリングコンテキストを作成すると、それ自身の表示リスト空間を持つ。wglShareLists
はあるレンダリングコンテキストが別のレンダリングコンテキストの表示リスト空間を共有できるようにする。任意数のレンダリングコンテキストが単一の表示リスト空間を共有できる。共有した時点からレンダリングコンテキストが削除されるまで、そのレンダリングコンテキストは常にその共有表示リスト空間を使う。共有表示リスト空間の最後のレンダリングコンテキストが削除されると共有表示リスト空間も削除される。共有表示リスト空間内のすべての表示リストインデックスと定義が共有される。共有できるのは同じプロセス内のレンダリングコンテキストのみ。ただしプロセス内すべてのレンダリングコンテキストが共有できるわけではなく、共有可能なのは同じ
OpenGL
実装を使うレンダリングコンテキスト同士のみ。同一ピクセルフォーマットの全クライアントレンダリングコンテキストはいつでも共有可能。共有表示リストの全レンダリングコンテキストは同一ピクセルフォーマットを使う必要があり、そうでない場合の結果は
OpenGL 実装依存。注意: wglShareLists は OpenGL バージョン 1.01 以降でのみ利用可能。バージョン番号は
glGetString で取得できる。


%index
wglSwapLayerBuffers
wglSwapLayerBuffers 関数は指定されたデバイスコンテキストが参照するウィンドウのオーバーレイ、アンダーレイ、メインプレーンのフロント/バックバッファを入れ替える。
%prm
param0, param1
param0 : [intptr] 
param1 : [int] 
%inst
wglSwapLayerBuffers
関数は指定されたデバイスコンテキストが参照するウィンドウのオーバーレイ、アンダーレイ、メインプレーンのフロント/バックバッファを入れ替える。

[戻り値]
関数が成功した場合は TRUE、失敗した場合は FALSE を返す。拡張エラー情報は GetLastError で取得する。

[備考]
レイヤープレーンがバックバッファを含まない場合、wglSwapLayerBuffers
の呼び出しはそのレイヤープレーンに何の効果も持たない。呼び出し後のバックバッファ内容の状態はレイヤープレーンの
LAYERPLANEDESCRIPTOR、メインプレーンの PIXELFORMATDESCRIPTOR
で示される。wglSwapLayerBuffers
は指定されたレイヤープレーンのフロント/バックバッファを同時に入れ替える。一部のデバイスはレイヤープレーンを個別に入れ替えられず、すべてをグループとして入れ替える。PIXELFORMATDESCRIPTOR
の PFD_SWAP_LAYER_BUFFERS フラグが立っているデバイスは個別入れ替えに対応し wglSwapLayerBuffers
を呼べる。マルチスレッドアプリケーションでは、wglSwapLayerBuffers
呼び出し前に同じウィンドウへ描画する全スレッドの描画コマンドをクリアする。


%index
wglSwapMultipleBuffers
(no summary)
%prm
param0, param1
param0 : [int] 
param1 : [var] 
%inst



%index
wglUseFontBitmapsW
wglUseFontBitmaps 関数はカレント OpenGL レンダリングコンテキストで使用するビットマップ表示リスト群を作成する。(Unicode)
%prm
param0, param1, param2, param3
param0 : [intptr] 
param1 : [int] 
param2 : [int] 
param3 : [int] 
%inst
wglUseFontBitmaps 関数はカレント OpenGL
レンダリングコンテキストで使用するビットマップ表示リスト群を作成する。(Unicode)

[戻り値]
関数が成功した場合は TRUE、失敗した場合は FALSE を返す。拡張エラー情報は GetLastError で取得する。

[備考]
wglUseFontBitmaps はカレント OpenGL レンダリングコンテキストに count
個の表示リストを定義する。各表示リストは listBase から始まる識別番号を持ち、glBitmap
への単一の呼び出しから構成される。ビットマップ listBase + i の定義は hdc
で指定したデバイスコンテキストで現在選択中のフォントのグリフ first + i
から取られる。グリフが未定義ならその表示リストは空となる。wglUseFontBitmaps
はスクリーン平面にビットマップテキストを作成し、OpenGL でのオブジェクトラベリングを可能にする。Microsoft の OpenGL
実装の現バージョンではダブルバッファピクセルフォーマットのデバイスコンテキストに対して GDI 呼び出しができない。そのため GDI
のフォント/テキスト関数は使えないが、wglUseFontBitmaps
を使えばこの制限を回避してダブルバッファデバイスコンテキストにテキストを描画できる。各 glBitmap
呼び出しのパラメータは次のように決定される。
このドキュメントは省略されている。


%index
wglUseFontOutlinesW
wglUseFontOutlines 関数は、カレントレンダリングコンテキストで使用する、デバイスコンテキストで現在選択中のアウトラインフォントの各グリフに対応する表示リスト群を作成する。(Unicode)
%prm
param0, param1, param2, param3, param4, param5, param6, param7
param0 : [intptr] 
param1 : [int] 
param2 : [int] 
param3 : [int] 
param4 : [float] 
param5 : [float] 
param6 : [int] 
param7 : [var] 
%inst
wglUseFontOutlines
関数は、カレントレンダリングコンテキストで使用する、デバイスコンテキストで現在選択中のアウトラインフォントの各グリフに対応する表示リスト群を作成する。(Unicode)

[戻り値]
関数成功時は TRUE。失敗時は FALSE で表示リストは生成されない。拡張エラー情報は GetLastError で取得する。

[備考]
wglUseFontOutlines
はカレントレンダリングコンテキストの表示リストでアウトラインフォントのグリフを定義する。TrueType
フォントのみで動作し、ストロークフォントやラスタフォントはサポートされない。各表示リストは線分かポリゴンで構成され、listBase
から始まる一意の識別番号を持つ。グリフのアウトラインは 2 次 B
スプライン曲線を線分に細分化して近似され、アウトラインと補間中点との距離が deviation の値以内になるまで分割される。これは
format が WGL_FONT_LINES の場合の最終形式。WGL_FONT_OUTLINES
を指定した場合、生成される表示リストには法線が含まれないためライティングは正しく機能しない。線の正しいライティングを得るには
WGL_FONT_POLYGONS を使い glPolygonMode(GL_FRONT, GL_LINE) を設定する。format に
WGL_FONT_POLYGONS
を指定するとアウトラインはさらに三角形・三角形ファン・三角形ストリップ・四角形ストリップにテッセレートされ、各グリフの面が作成される。WGL_FONT_POLYGONS
では生成される表示リストは glFrontFace(GL_CW) または glFrontFace(GL_CCW)
を呼ぶため、現在の前面値が変更されうる。WGL_FONT_POLYGONS でテキストを最適に表示するには次のように背面をカリングする。
このドキュメントは省略されている。

