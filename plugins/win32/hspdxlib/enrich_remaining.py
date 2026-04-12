#!/usr/bin/env python3
"""Enrich the remaining 43 short-description functions."""
import json

enrichments = {
    "AddSoundData": "メモリ上の音声データからサウンドハンドルを作成します。\nLoadSoundMem はファイルから読み込みますが、この関数はメモリ上のデータから直接サウンドハンドルを作成します。\nWAV形式等の音声データバッファとそのサイズを指定して使用します。\n\n戻り値: -1以外:サウンドハンドル  -1:エラー",

    "CalcPolygon32bitIndexedBinormalAndTangentsToShader": "シェーダー用のポリゴン頂点データに対して、UV座標から接線(Tangent)と従法線(Binormal)を計算してセットします。32bitインデックスバッファを使用するバージョンです。\n法線マッピング（ノーマルマップ）を使用するシェーダーでは、各頂点に接線空間の情報が必要です。この関数はUV座標から自動的にそれを計算します。\n\n戻り値: 0:成功  -1:エラー",

    "CalcPolygonIndexedBinormalAndTangentsToShader": "シェーダー用のポリゴン頂点データに対して、UV座標から接線(Tangent)と従法線(Binormal)を計算してセットします。16bitインデックスバッファを使用するバージョンです。\n法線マッピング（ノーマルマップ）を使用するシェーダーでは、各頂点に接線空間の情報が必要です。\n\n戻り値: 0:成功  -1:エラー",

    "ConvertMatrixDtoF": "double型の要素を持つ MATRIX_D 構造体を、float型の要素を持つ MATRIX 構造体に変換します。\n倍精度で計算した行列を単精度の描画関数に渡す際に使用します。精度は落ちますが処理速度が向上します。\n\n引数:\n  InD: 変換元のdouble型行列 (MATRIX_D)\n  OutF: 変換先のfloat型行列 (MATRIX)\n\n戻り値: 0:成功  -1:エラー",

    "DrawObtainsNString": "指定された描画領域に収まるように、自動的に改行しながら文字列を描画します。\n長いテキストを矩形領域内に表示したい場合に便利です。テキストが領域からはみ出す場合は自動的に折り返されます。\n\n引数:\n  x, y: 描画開始座標\n  Width: 描画領域の幅\n  Height: 描画領域の高さ\n  String: 描画する文字列\n  Color: 描画色\n\n戻り値: 実際に描画した行数",

    "DrawObtainsNString_CharClip": "DrawObtainsNString と同じく描画領域に収まるように改行しながら文字列を描画しますが、クリッピング処理が文字単位で行われます。\n文字の途中で切れることなく、文字単位で領域内に収めます。\n\n戻り値: 実際に描画した行数",

    "DrawObtainsNString_WordClip": "DrawObtainsNString と同じく描画領域に収まるように改行しながら文字列を描画しますが、クリッピング処理が単語単位で行われます。\n英文テキスト等で単語の途中で改行されるのを防ぎます。\n\n戻り値: 実際に描画した行数",

    "DxSetAllocSizeTrap": "DxLib 内部のメモリデバッグ用関数です。指定されたサイズのメモリ確保が行われた際にブレークポイントを発生させます。\nメモリリークやメモリ破壊の調査時に使用します。通常のアプリケーション開発では使用しません。\n\n引数:\n  Size: トラップ対象のメモリ確保サイズ（バイト数）",

    "FileRead_createInfo": "ファイル検索用の情報ハンドルを作成します。ワイルドカードを使用してファイルの列挙を行う際に使用します。\n\nFilePath にはワイルドカード（*.txt 等）を含むパスを指定します。\n作成した情報ハンドルを FileRead_findFirst / FileRead_findNext で使用してファイルを列挙できます。\n使用後は FileRead_deleteInfo で削除してください。\n\n戻り値: -1:エラー  -1以外:ファイル情報ハンドル",

    "GetMaskScreenData": "マスクスクリーンの指定された矩形部分をマスクハンドルに転送します。\nマスク機能を使用して描画の一部を制限する際に使用します。\n\n引数:\n  x1, y1: 転送元矩形の左上座標\n  x2, y2: 転送元矩形の右下座標\n  MaskHandle: 転送先のマスクハンドル\n\n戻り値: 0:成功  -1:エラー",

    "GetPrivateProfileStringDx": "Windows API の GetPrivateProfileString と同等の機能を提供する DxLib 版です。\nINI ファイルから指定されたセクションとキーの値を文字列として取得します。\nDxLib のファイルアクセス機能（DXアーカイブ対応等）を使用してINIファイルにアクセスします。\n\n引数:\n  AppName: セクション名\n  KeyName: キー名\n  Default: キーが見つからなかった場合のデフォルト値\n  ReturnedString: 取得した文字列を格納するバッファ\n  Size: バッファサイズ\n  FileName: INIファイルのパス\n\n戻り値: 取得した文字列の文字数",

    "GetRectSize": "矩形(RECT構造体)の幅と高さを求めます。\nwidth = right - left, height = bottom - top を計算します。\n\n引数:\n  Rect: サイズを求める矩形\n  Width: 幅を格納する変数のポインタ\n  Height: 高さを格納する変数のポインタ\n\n戻り値: 0:成功  -1:エラー",

    "HashCRC32": "バイナリデータを元に CRC32 ハッシュ値を計算します。\nデータの整合性チェックやファイルの同一性確認に使用します。\nCRC32 は高速なハッシュアルゴリズムですが、暗号用途には適していません。\n\n引数:\n  SrcData: ハッシュ計算の対象データへのポインタ\n  SrcDataSize: データのサイズ（バイト数）\n\n戻り値: CRC32 ハッシュ値（unsigned int）",

    "HitCheck_Capsule_Capsule": "3D空間でカプセル同士の当たり判定を行います。\nカプセルは「線分を中心軸とした円柱＋両端の半球」の形状です。キャラクターの衝突判定によく使用されます。\n\n引数:\n  Cap1Pos1, Cap1Pos2: カプセル1の中心軸の両端座標 (VECTOR)\n  Cap1R: カプセル1の半径\n  Cap2Pos1, Cap2Pos2: カプセル2の中心軸の両端座標 (VECTOR)\n  Cap2R: カプセル2の半径\n\n戻り値: TRUE:当たっている  FALSE:当たっていない",

    "HitCheck_Capsule_Triangle": "3D空間でカプセルと三角形の当たり判定を行います。\nキャラクターと地形ポリゴンの衝突判定に使用できます。\n\n引数:\n  CapPos1, CapPos2: カプセルの中心軸の両端座標 (VECTOR)\n  CapR: カプセルの半径\n  TriPos1, TriPos2, TriPos3: 三角形の3頂点座標 (VECTOR)\n\n戻り値: TRUE:当たっている  FALSE:当たっていない",

    "HitCheck_Line_Cube": "3D空間で線分と直方体(箱)の当たり判定を行います。\nレイキャスティングやレーザー判定などに使用できます。\n\n引数:\n  LinePos1, LinePos2: 線分の両端座標 (VECTOR)\n  CubePos1, CubePos2: 直方体の対角の2頂点座標 (VECTOR)\n\n戻り値: TRUE:当たっている  FALSE:当たっていない",

    "HitCheck_Line_Sphere": "3D空間で線分と球の当たり判定を行います。\nレイキャスティングや弾道計算に使用できます。\n\n引数:\n  LinePos1, LinePos2: 線分の両端座標 (VECTOR)\n  SphereCenterPos: 球の中心座標 (VECTOR)\n  SphereR: 球の半径\n\n戻り値: TRUE:当たっている  FALSE:当たっていない",

    "HitCheck_Point_Cone": "3D空間で点と円錐の当たり判定を行います。\n点が円錐の内部にあるかどうかを判定します。\n\n引数:\n  PointPos: 判定する点の座標 (VECTOR)\n  ConeTopPos: 円錐の頂点座標 (VECTOR)\n  ConeBottomPos: 円錐の底面中心座標 (VECTOR)\n  ConeR: 円錐の底面半径\n\n戻り値: TRUE:当たっている  FALSE:当たっていない",

    "HitCheck_Sphere_Capsule": "3D空間で球とカプセルの当たり判定を行います。\n\n引数:\n  SphereCenterPos: 球の中心座標 (VECTOR)\n  SphereR: 球の半径\n  CapPos1, CapPos2: カプセルの中心軸の両端座標 (VECTOR)\n  CapR: カプセルの半径\n\n戻り値: TRUE:当たっている  FALSE:当たっていない",

    "HitCheck_Triangle_Triangle": "3D空間で三角形同士の当たり判定を行います。\n2つの三角形が交差しているかどうかを判定します。ポリゴン同士の衝突判定に使用できます。\n\n引数:\n  Tri1Pos1-3: 三角形1の3頂点座標 (VECTOR)\n  Tri2Pos1-3: 三角形2の3頂点座標 (VECTOR)\n\n戻り値: TRUE:当たっている  FALSE:当たっていない",

    "Plane_Point_Analyse": "平面と点の最接近点情報を解析します。\n点から平面への最短距離や、平面上の最近接点の座標を計算します。結果は PLANE_POINT_RESULT 構造体に格納されます。\n\n引数:\n  PlanePos: 平面上の1点の座標 (VECTOR)\n  PlaneNormal: 平面の法線ベクトル (VECTOR)\n  PointPos: 対象の点の座標 (VECTOR)\n  Result: 結果を格納する構造体 (PLANE_POINT_RESULT)\n\n戻り値: 0:成功  -1:エラー",

    "RectAdjust": "矩形の座標値を正規化します。left > right や top > bottom になっている場合に値を入れ替えて正しい矩形にします。\n描画関数等に渡す前に矩形の値を正規化するために使用します。\n\n引数:\n  Rect: 正規化する矩形 (RECT構造体へのポインタ)\n\n戻り値: 0:成功  -1:エラー",

    "RectClipping": "矩形のクリッピング処理を行います。元の矩形を指定されたクリッピング矩形の範囲内に収めます。\n画面外にはみ出した矩形を画面内に収める際などに使用します。\n\n引数:\n  Rect: クリッピングする矩形 (RECT構造体へのポインタ)\n  ClippedRect: クリッピング範囲の矩形 (RECT構造体へのポインタ)\n\n戻り値: 0:矩形が残っている  -1:矩形が完全にクリッピングされた",

    "ResetKeyInputStringColor2": "SetKeyInputStringColor2 で設定したキー入力文字列の各要素の色をデフォルトの状態に戻します。\n\n戻り値: 0:成功  -1:エラー",

    "Segment_Point_Analyse": "線分と点の最接近点情報を解析します。\n線分上で点に最も近い座標と、その距離の二乗を計算します。結果は SEGMENT_POINT_RESULT 構造体に格納されます。\n\n引数:\n  SegPos1, SegPos2: 線分の両端座標 (VECTOR)\n  PointPos: 対象の点の座標 (VECTOR)\n  Result: 結果を格納する構造体\n\n戻り値: 0:成功  -1:エラー",

    "Segment_Segment_Analyse": "2つの線分の最接近点情報を解析します。\n2本の線分間の最短距離と、それぞれの線分上の最近接点の座標を計算します。結果は SEGMENT_SEGMENT_RESULT 構造体に格納されます。\n\n引数:\n  Seg1Pos1, Seg1Pos2: 線分1の両端座標 (VECTOR)\n  Seg2Pos1, Seg2Pos2: 線分2の両端座標 (VECTOR)\n  Result: 結果を格納する構造体\n\n戻り値: 0:成功  -1:エラー",

    "Segment_Triangle_Analyse": "線分と三角形の最接近点情報を解析します。\n線分と三角形間の最短距離と、それぞれの最近接点の座標を計算します。結果は SEGMENT_TRIANGLE_RESULT 構造体に格納されます。\n\n引数:\n  SegPos1, SegPos2: 線分の両端座標 (VECTOR)\n  TriPos1, TriPos2, TriPos3: 三角形の3頂点座標 (VECTOR)\n  Result: 結果を格納する構造体\n\n戻り値: 0:成功  -1:エラー",

    "TriangleBarycenter": "指定の座標から三角形の重心座標（バリセントリック座標）を求めます。\n3頂点に対する重み（w1, w2, w3）を計算し、指定座標 = Pos1*w1 + Pos2*w2 + Pos3*w3 となる重みを返します。\nテクスチャ座標の補間や物理計算に使用します。\n\n引数:\n  TriPos1-3: 三角形の3頂点座標 (VECTOR)\n  Position: 重心を求める対象座標 (VECTOR)\n  w1, w2, w3: 各頂点の重みを格納する変数\n\n戻り値: 0:成功  -1:エラー",

    "Triangle_Point_Analyse": "三角形と点の最接近点情報を解析します。\n三角形上で点に最も近い座標と、その距離の二乗を計算します。結果は TRIANGLE_POINT_RESULT 構造体に格納されます。\n\n引数:\n  TriPos1, TriPos2, TriPos3: 三角形の3頂点座標 (VECTOR)\n  PointPos: 対象の点の座標 (VECTOR)\n  Result: 結果を格納する構造体\n\n戻り値: 0:成功  -1:エラー",

    "VectorAdd": "Out = In1 + In2 のベクトル加算を行います。\nVAdd 関数と同等ですが、この関数は結果を Out パラメータに格納します。\n\n引数:\n  Out: 計算結果を格納するベクトル (VECTOR*)\n  In1: 加算元ベクトル1 (VECTOR*)\n  In2: 加算元ベクトル2 (VECTOR*)\n\nOut の各要素は In1.x+In2.x, In1.y+In2.y, In1.z+In2.z となります。",

    "VectorConvertDtoF": "double型のベクトル(VECTOR_D)をfloat型のベクトル(VECTOR)に変換します。\n倍精度で計算したベクトルを単精度の描画関数に渡す際に使用します。\n\n引数:\n  Out: 変換先のfloat型ベクトル (VECTOR*)\n  In: 変換元のdouble型ベクトル (VECTOR_D*)",

    "VectorInnerProduct": "2つのベクトルの内積（ドット積）を計算します。\nVDot 関数と同等ですが、この関数は結果を戻り値ではなく Out パラメータに格納します。\n\n計算式: *Out = In1.x*In2.x + In1.y*In2.y + In1.z*In2.z\n\n内積はベクトル間の角度の計算に使用します。値が正なら鋭角、0なら直角、負なら鈍角です。",

    "VectorMultiply": "ベクトルの各成分同士の乗算を行います。\nOut.x = In1.x * In2.x, Out.y = In1.y * In2.y, Out.z = In1.z * In2.z\n\nこれは数学的なベクトル積（外積）ではなく、成分ごとの乗算（アダマール積）です。\n\n引数:\n  Out: 計算結果を格納するベクトル (VECTOR*)\n  In1, In2: 乗算元ベクトル (VECTOR*)",

    "VectorNormalize": "ベクトルを正規化して単位ベクトル（長さ1のベクトル）にします。\nVNorm 関数と同等ですが、この関数は結果を Out パラメータに格納します。\n\n計算式: 長さ = sqrt(x*x + y*y + z*z), Out = In / 長さ\n\nゼロベクトルを正規化すると不正な値になるので注意してください。",

    "VectorOuterProduct": "2つのベクトルの外積（クロス積）を計算します。\nVCross 関数と同等ですが、この関数は結果を Out パラメータに格納します。\n\n外積の結果は2つの入力ベクトルに垂直なベクトルになります。ポリゴンの法線計算に使用します。",

    "VectorRotationX": "ベクトルをX軸を中心に回転させます。\n回転角度はラジアン単位で指定します（360度 = 2*PI）。\n\n引数:\n  Out: 回転結果を格納するベクトル (VECTOR*)\n  In: 回転するベクトル (VECTOR*)\n  Angle: 回転角度（ラジアン）",

    "VectorRotationY": "ベクトルをY軸を中心に回転させます。\n回転角度はラジアン単位で指定します（360度 = 2*PI）。\n\n引数:\n  Out: 回転結果を格納するベクトル (VECTOR*)\n  In: 回転するベクトル (VECTOR*)\n  Angle: 回転角度（ラジアン）",

    "VectorRotationZ": "ベクトルをZ軸を中心に回転させます。\n回転角度はラジアン単位で指定します（360度 = 2*PI）。\n\n引数:\n  Out: 回転結果を格納するベクトル (VECTOR*)\n  In: 回転するベクトル (VECTOR*)\n  Angle: 回転角度（ラジアン）",

    "VectorScale": "ベクトルをスカラー倍します。\nVScale 関数と同等ですが、この関数は結果を Out パラメータに格納します。\n\n計算式: Out.x = In.x * Scale, Out.y = In.y * Scale, Out.z = In.z * Scale",

    "VectorSub": "Out = In1 - In2 のベクトル減算を行います。\nVSub 関数と同等ですが、この関数は結果を Out パラメータに格納します。\n\nOut の各要素は In1.x-In2.x, In1.y-In2.y, In1.z-In2.z となります。",

    "VectorTransform": "ベクトルと4x4行列の乗算を行います（w成分は1と仮定）。\nVTransform 関数と同等ですが、この関数は結果を Out パラメータに格納します。\n\n座標変換（回転＋平行移動）に使用します。w=1 のため平行移動成分が適用されます。",

    "VectorTransform4": "ベクトルと4x4行列の乗算を行います（w成分を明示的に指定）。\nVectorTransform と異なり、w の値を引数で渡すことができます。\n\n射影変換など w!=1 の変換に使用します。",

    "VectorTransformSR": "ベクトルと4x4行列の回転部分（3x3部分）のみを乗算します。\nVTransformSR 関数と同等ですが、この関数は結果を Out パラメータに格納します。\n\n平行移動成分を無視して回転のみ適用する場合に使用します。法線ベクトルの変換等に使います。",
}

with open(r"j:\HNWorks\IronHSP_2026\plugins\win32\hspdxlib\dxlib_help.json", "r", encoding="utf-8") as f:
    data = json.load(f)

updated = 0
for name, desc in enrichments.items():
    if name in data:
        data[name]["description"] = desc
        updated += 1

with open(r"j:\HNWorks\IronHSP_2026\plugins\win32\hspdxlib\dxlib_help.json", "w", encoding="utf-8") as f:
    json.dump(data, f, ensure_ascii=False, indent=2)

print(f"Updated {updated} functions")
