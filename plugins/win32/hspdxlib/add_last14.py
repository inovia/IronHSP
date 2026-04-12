import json

with open(r"j:\HNWorks\IronHSP_2026\plugins\win32\hspdxlib\dxlib_help.json", "r", encoding="utf-8") as f:
    data = json.load(f)

new_funcs = {
    "CreateColorData": {
        "summary": "カラーデータ構造体 (COLORDATA) を作成する",
        "description": "カラーデータ構造体 (COLORDATA) を作成します。\n指定したビット深度やマスク値に基づいてカラーデータを構築します。\nテクスチャのフォーマット情報を手動で構築する際に使用します。\n\n戻り値: 0:成功  -1:エラー",
        "params": "",
        "returns": "0:成功  -1:エラー"
    },
    "GetDSoundObj": {
        "summary": "DirectSound のインターフェースオブジェクトを取得する",
        "description": "DirectSound のインターフェースオブジェクトを取得します。\nDxLib の音声処理をバイパスして DirectSound API を直接操作したい場合に使用します。\n※ 上級者向けの関数です。通常のサウンド再生には LoadSoundMem / PlaySoundMem を使用してください。\n\n戻り値: DirectSound オブジェクトへのポインタ",
        "params": "",
        "returns": "DirectSound オブジェクトへのポインタ"
    },
    "GetFontName": {
        "summary": "現在のデフォルトフォントのフォント名を取得する",
        "description": "現在のデフォルトフォントのフォント名を取得します。\nChangeFont で変更したフォント名を確認する際に使用します。\n\n戻り値: フォント名の文字列へのポインタ",
        "params": "",
        "returns": "フォント名の文字列へのポインタ"
    },
    "GetFontNameToHandle": {
        "summary": "指定のフォントハンドルに設定されているフォント名を取得する",
        "description": "指定のフォントハンドルに設定されているフォント名を取得します。\nCreateFontToHandle で作成したフォントの名前を確認する際に使用します。\n\n引数:\n  FontHandle: フォントハンドル\n\n戻り値: フォント名の文字列へのポインタ",
        "params": "FontHandle: フォントハンドル",
        "returns": "フォント名の文字列へのポインタ"
    },
    "GetImageAddressSoftImage": {
        "summary": "ソフトウェアイメージのピクセルデータのメモリアドレスを取得する",
        "description": "ソフトウェアイメージのピクセルデータが格納されているメモリアドレスを取得します。\nピクセルデータを直接読み書きしたい場合に使用します。\n※ 上級者向けの関数です。取得したアドレスへの不正なアクセスはクラッシュの原因になります。\n\n引数:\n  SIHandle: ソフトウェアイメージハンドル\n\n戻り値: ピクセルデータのメモリアドレス",
        "params": "SIHandle: ソフトウェアイメージハンドル",
        "returns": "ピクセルデータのメモリアドレス"
    },
    "Live2D_Model_GetParameterId": {
        "summary": "Live2D Cubism 4 モデルのパラメータ ID 文字列を取得する",
        "description": "Live2D Cubism 4 モデルのパラメータ ID 文字列を取得します。\nパラメータのインデックス番号からパラメータの識別名を取得します。\n取得したパラメータ ID は Live2D_Model_SetParameterValue 等で使用できます。\n\n引数:\n  ModelHandle: Live2D モデルハンドル\n  ParameterIndex: パラメータのインデックス\n\n戻り値: パラメータ ID 文字列へのポインタ",
        "params": "ModelHandle: Live2D モデルハンドル\nParameterIndex: パラメータのインデックス",
        "returns": "パラメータ ID 文字列へのポインタ"
    },
    "MV1GetAnimTargetFrameName": {
        "summary": "3Dモデルのアニメーション対象フレームの名前を取得する",
        "description": "3Dモデルのアニメーションが対象としているフレームの名前を取得します。\nアニメーションがどのボーン/フレームに影響を与えるかを確認する際に使用します。\n\n引数:\n  MHandle: モデルハンドル\n  AnimIndex: アニメーションのインデックス\n  AnimFrameIndex: アニメーション内のフレームインデックス\n\n戻り値: フレーム名の文字列へのポインタ",
        "params": "MHandle: モデルハンドル\nAnimIndex: アニメーションのインデックス\nAnimFrameIndex: アニメーション内のフレームインデックス",
        "returns": "フレーム名の文字列へのポインタ"
    },
    "MV1GetShapeName": {
        "summary": "3Dモデルのシェイプ（モーフターゲット）の名前を取得する",
        "description": "3Dモデルのシェイプ（モーフターゲット/ブレンドシェイプ）の名前を取得します。\n表情モーフやブレンドシェイプの識別に使用します。\n\n引数:\n  MHandle: モデルハンドル\n  ShapeIndex: シェイプのインデックス\n\n戻り値: シェイプ名の文字列へのポインタ",
        "params": "MHandle: モデルハンドル\nShapeIndex: シェイプのインデックス",
        "returns": "シェイプ名の文字列へのポインタ"
    },
    "MV1GetTextureAlphaFilePath": {
        "summary": "3Dモデルのテクスチャのアルファ画像ファイルパスを取得する",
        "description": "3Dモデルのテクスチャに設定されているアルファチャンネル画像のファイルパスを取得します。\n\n引数:\n  MHandle: モデルハンドル\n  TexIndex: テクスチャのインデックス\n\n戻り値: アルファ画像ファイルパスの文字列へのポインタ（設定されていない場合は空文字列）",
        "params": "MHandle: モデルハンドル\nTexIndex: テクスチャのインデックス",
        "returns": "ファイルパスの文字列へのポインタ"
    },
    "MV1GetTextureColorFilePath": {
        "summary": "3Dモデルのテクスチャのカラー画像ファイルパスを取得する",
        "description": "3Dモデルのテクスチャに設定されているカラー画像のファイルパスを取得します。\nモデルが使用しているテクスチャ画像のパスを確認する際に使用します。\n\n引数:\n  MHandle: モデルハンドル\n  TexIndex: テクスチャのインデックス\n\n戻り値: カラー画像ファイルパスの文字列へのポインタ",
        "params": "MHandle: モデルハンドル\nTexIndex: テクスチャのインデックス",
        "returns": "ファイルパスの文字列へのポインタ"
    },
    "VCos": {
        "summary": "2つのベクトル間の角度の余弦（コサイン）値を計算する",
        "description": "2つのベクトル間の角度の余弦（コサイン）値を計算します。\n2つのベクトルがなす角度を調べるために使用します。\n\n計算式: cos(theta) = (In1・In2) / (|In1| * |In2|)\n\n戻り値が 1.0 なら同じ方向、0.0 なら直角、-1.0 なら反対方向です。\n\n引数:\n  In1, In2: 角度を求める2つのベクトル (VECTOR)\n\n戻り値: 余弦値 (-1.0 ~ 1.0)",
        "params": "In1: ベクトル1 (VECTOR)\nIn2: ベクトル2 (VECTOR)",
        "returns": "余弦値 (-1.0 ~ 1.0)"
    },
    "VRad": {
        "summary": "2つのベクトル間の角度をラジアン単位で計算する",
        "description": "2つのベクトル間の角度をラジアン単位で計算します。\nVCos が余弦値を返すのに対し、この関数は角度そのものを返します。\n\n計算式: acos( (In1・In2) / (|In1| * |In2|) )\n\n引数:\n  In1, In2: 角度を求める2つのベクトル (VECTOR)\n\n戻り値: 角度（ラジアン、0.0 ~ PI）\n※ 度数法に変換するには 戻り値 * 180.0 / PI",
        "params": "In1: ベクトル1 (VECTOR)\nIn2: ベクトル2 (VECTOR)",
        "returns": "角度（ラジアン、0.0 ~ PI）"
    },
    "VRotQ": {
        "summary": "クォータニオンによるベクトルの回転を行う（float版）",
        "description": "クォータニオンによるベクトルの回転を行います。（float版）\n任意の軸周りの回転を表現できるクォータニオン (FLOAT4) を使用してベクトルを回転させます。\n\n引数:\n  P: 回転させるベクトル (VECTOR)\n  Q: 回転を表すクォータニオン (FLOAT4)\n\n戻り値: 回転後のベクトル (VECTOR)\n\n※ #cfuncst で宣言されています。戻り値は VECTOR(12バイト) へのポインタです。",
        "params": "P: 回転させるベクトル (VECTOR)\nQ: 回転を表すクォータニオン (FLOAT4)",
        "returns": "回転後のベクトル (VECTOR)"
    },
    "VRotQD": {
        "summary": "クォータニオンによるベクトルの回転を行う（double版）",
        "description": "クォータニオンによるベクトルの回転を行います。（double版）\nVRotQ の倍精度浮動小数点数版です。\n\n引数:\n  P: 回転させるベクトル (VECTOR_D)\n  Q: 回転を表すクォータニオン (DOUBLE4)\n\n戻り値: 回転後のベクトル (VECTOR_D)\n\n※ #cfuncst で宣言されています。戻り値は VECTOR_D(24バイト) へのポインタです。",
        "params": "P: 回転させるベクトル (VECTOR_D)\nQ: 回転を表すクォータニオン (DOUBLE4)",
        "returns": "回転後のベクトル (VECTOR_D)"
    },
}

for name, info in new_funcs.items():
    data[name] = info

with open(r"j:\HNWorks\IronHSP_2026\plugins\win32\hspdxlib\dxlib_help.json", "w", encoding="utf-8") as f:
    json.dump(data, f, ensure_ascii=False, indent=2)

print(f"Added {len(new_funcs)} functions. Total: {len(data)}")
