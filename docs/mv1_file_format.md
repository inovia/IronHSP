# DxLib `.mv1` ファイル形式仕様書

**対象:** DxLib 3.24f の MV1 モデルファイル (Ver.1)
**出典:** `DxModel.cpp` (loader) + `DxModelFile.h` (バイナリ構造体 `*_F1`)
**文字コード表記:** リトルエンディアン、C 構造体の直接シリアライズ

---

## 概要

`.mv1` は DxLib 独自の 3D モデルファイル形式で、他形式 (`.mqo` / `.pmd` / `.pmx` / `.x` / `.fbx` / `.vmd`) を読み込んだ後のランタイム構造体を丸ごとバイナリ化したキャッシュ的なフォーマット。利点:

- **1 パス読み込み** — `MV1LoadModel` で即座にハンドル化
- **DXA 圧縮** — 本体はファイルの 4 バイトマジック直後から DXA (DxLib Archive) で圧縮される
- **全機能サポート** — スキンメッシュ (4/8/FREE ボーン) / シェイプ / アニメーション / 物理 / トゥーン輪郭

保存は `MV1SaveModelToMV1File()` で、読み込みは他形式と同じ `MV1LoadModel()` の裏で自動判定される (マジック `"MV11"` で分岐)。

---

## ファイル全体レイアウト

```
+-------+-----------------------------+
| off   | 内容                        |
+-------+-----------------------------+
| 0x00  | Magic  "MV11" (4 bytes)     |
+-------+-----------------------------+
| 0x04  | DXA 圧縮ブロック            |
|       |   伸長すると                |
|       |   MV1MODEL_FILEHEADER_F1    |
|       |   + 可変長データ群          |
+-------+-----------------------------+
```

- **Magic**: ASCII 4 バイト `M V 1 1`。`1` = バージョン 1 相当。これ以外は即 `-1` エラー。
- **DXA 圧縮**: `DXA_Decode(src + 4, NULL)` で伸長後サイズを取得、バッファ確保、再 `DXA_Decode` で実データ展開。アルゴリズムは DxLib 独自の LZSS 派生 (本文参照: `DxArchive_.cpp`)。

伸長されたデータの先頭 (= `off = 0` + 4 byte 分の magic は含まず `MV11` 後から) に `MV1MODEL_FILEHEADER_F1` が置かれ、同じバッファ内の後続オフセットに各種配列やポインタ先が連続配置される。構造体メンバー内の **ポインタ相当の DWORD は「このバッファ先頭からのバイトオフセット」を格納** (ロード時にポインタへ変換される)。

---

## ルートヘッダ `MV1MODEL_FILEHEADER_F1`

128 バイト程度の固定長ヘッダ。主要フィールド:

| offset | type | name | 意味 |
|---|---|---|---|
| 0x00 | BYTE[4] | `CheckID[4]` | `"MV11"` (DXA 伸長後にも同じ magic が入る) |
| 0x04 | DWORD | `Version` | 1 |
| 0x08 | int | `RightHandType` | TRUE=右手系 / FALSE=左手系 |
| 0x0C | int | `AutoCreateNormal` | 法線自動計算使用 |
| 0x10 | int | `ChangeDrawMaterialTableSize` | 描画マテリアル変更管理用ビット数 |
| 0x14 | int | `ChangeMatrixTableSize` | 行列変更管理用ビット数 |
| 0x18 | DWORD | `ChangeDrawMaterialTable` (ptr) | 描画用マテリアル変更確認用ビットデータ |
| 0x1C | DWORD | `ChangeMatrixTable` (ptr) | 行列変更確認用ビットデータ |
| 0x20 | int | `FrameNum` | 階層データ (フレーム) 数 |
| 0x24 | DWORD | `Frame` (ptr) | `MV1_FRAME_F1[]` の先頭 |
| 0x28 | int | `TopFrameNum` | ルート階層 (親なし) フレーム数 |
| 0x2C | DWORD | `FirstTopFrame` (ptr) | 最初のルートフレーム |
| 0x30 | DWORD | `LastTopFrame` (ptr) | 最後のルートフレーム |
| 0x34 | int | `FrameUseSkinBoneNum` | フレームが使用するボーン総数 |
| 0x38 | DWORD | `FrameUseSkinBone` (ptr) | `MV1_SKIN_BONE_F1*[]` の先頭 |
| 0x3C | int | `MaterialNum` | マテリアル数 |
| 0x40 | DWORD | `Material` (ptr) | `MV1_MATERIAL_F1[]` |
| 0x44 | int | `TextureNum` | テクスチャ数 |
| 0x48 | DWORD | `Texture` (ptr) | `MV1_TEXTURE_F1[]` |
| 0x4C | int | `MeshNum` | メッシュ数 |
| 0x50 | DWORD | `Mesh` (ptr) | `MV1_MESH_F1[]` |
| 0x54 | int | `LightNum` | ライト数 |
| 0x58 | DWORD | `Light` (ptr) | `MV1_LIGHT_F1[]` |
| 0x5C | int | `SkinBoneNum` | スキンボーン数 |
| 0x60 | DWORD | `SkinBone` (ptr) | `MV1_SKIN_BONE_F1[]` |
| 0x64 | int | `SkinBoneUseFrameNum` | ボーンを使用するフレーム数 |
| 0x68 | DWORD | `SkinBoneUseFrame` (ptr) | `MV1_SKIN_BONE_USE_FRAME_F1*[]` |
| 0x6C | int | `TriangleListNum` | トライアングルリスト数 |
| 0x70 | DWORD | `TriangleList` (ptr) | `MV1_TRIANGLE_LIST_F1[]` |
| 0x74 | DWORD | `VertexData` (ptr) | 頂点データブロック先頭 |
| 0x78 | DWORD | `VertexDataSize` | 頂点データブロックの合計バイト数 |
| ... | int×10 | `TriangleListNormalPositionNum` ... `TriangleListIndexNum` | ボーン別頂点総数カウンタ群 |
| ... | int | `TriangleNum` | モデル全体の三角形数 |
| ... | int | `TriangleListVertexNum` | トライアングルリストの頂点総数 |
| ... | int | `StringSize` | 文字列データサイズ |
| ... | DWORD | `StringBuffer` (ptr) | 文字列プール先頭 (null 終端連結) |
| ... | int | `OriginalAnimKeyDataSize` | アニメキー元サイズ |
| ... | int | `AnimKeyDataSize` | アニメキーデータサイズ (圧縮後) |
| ... | DWORD | `AnimKeyData` (ptr) | アニメキー可変長データ |
| ... | int | `AnimKeySetNum` | アニメキーセット数 |
| ... | int | `AnimKeySetUnitSize` | `MV1_ANIM_KEYSET_F1` サイズ |
| ... | DWORD | `AnimKeySet` (ptr) | アニメキーセット配列 |
| ... | int | `AnimNum` | アニメ数 |
| ... | int | `AnimUnitSize` | `MV1_ANIM_F1` サイズ |
| ... | DWORD | `Anim` (ptr) | アニメ配列 |
| ... | int | `AnimSetNum` | アニメセット数 |
| ... | DWORD | `AnimSet` (ptr) | アニメセット配列 |
| ... | DWORD[4] | `UserData[4]` | ユーザー任意 |
| ... | DWORD | `Shape` (ptr) | `MV1_FILEHEAD_SHAPE_F1*`、なければ NULL |
| ... | DWORD | `Physics` (ptr) | `MV1_FILEHEAD_PHYSICS_F1*`、なければ NULL |
| ... | BYTE | `MaterialNumberOrderDraw` | マテリアル番号昇順で描画するか |
| ... | BYTE | `IsStringUTF8` | `StringBuffer` が UTF-8 か (1) / Shift-JIS か (0) |
| ... | BYTE[2] | `Padding1[2]` | 0 |
| ... | DWORD[13] | `Padding2[13]` | 0 (将来拡張用) |

---

## 階層データ `MV1_FRAME_F1`

モデルの骨格 (ボーン) + メッシュコンテナ。親子ツリー構造:

| 役割 | フィールド |
|---|---|
| ツリー連結 | `DimPrev` / `DimNext` (配列順) / `Parent` / `FirstChild` / `LastChild` / `Prev` / `Next` |
| 基本情報 | `Name` / `Index` / `Flag` (`MV1_FRAMEFLAG_VISIBLE` 等) |
| 変換 | `Translate` (VECTOR) / `Scale` / `Rotate` + `RotateOrder` / `Quaternion` (FLOAT4) / `PreRotate` / `PostRotate` |
| 統計 | `TotalMeshNum` / `TotalChildNum` / `TriangleNum` / `VertexNum` |
| メッシュ | `MeshNum` / `Mesh` (ptr to `MV1_MESH_F1[]`) |
| スキンボーン | `SkinBoneNum` / `SkinBone` / `UseSkinBoneNum` / `UseSkinBone` (ボーンリスト) |
| 法線 | `SmoothingAngle` (ラジアン) / `AutoCreateNormal` |
| 座標/法線データ | `PositionNum` / `NormalNum` / `PositionAndNormalData` (ptr) |
| シェイプ | `FrameShape` (ptr, NULL 可) |
| 変更管理 | `ChangeDrawMaterialInfo` / `ChangeMatrixInfo` (各 `MV1_CHANGE_F1`) |
| その他 | `Light` (ptr、ライト本体) / `VertFlag` / `MaxBoneBlendNum` |

### `PositionAndNormalData` の構造

`VertFlag` ビット (`MV1_FRAME_VERT_FLAG_*` 群) に応じて可変レイアウト。ヘッダで要素タイプを切替:

```
[MV1_FRAME_VERT_FLAG_POSITION_B16 が立っている場合]
  MV1_POSITION_16BIT_SUBINFO_F1 x ;   // float Min; float Width;
  MV1_POSITION_16BIT_SUBINFO_F1 y ;
  MV1_POSITION_16BIT_SUBINFO_F1 z ;

[PositionNum 回繰返し: 座標]
  POSITION_B16 立っていれば WORD×3、立っていなければ float×3

[PositionNum 回繰返し: スキニング情報 (MATRIX_WEIGHT_NONE でない場合)]
  MaxBoneBlendNum 分、又はインデックス=-1 で終端
    インデックス値 (MATRIX_INDEX_MASK 指定型: u8 / u16)
    ウェイト値    (MATRIX_WEIGHT_MASK 指定型: u8 / u16)

[法線: MV1_FRAME_NORMAL_TYPE_NONE でない場合]
  NormalNum 回繰返し: NORMAL_TYPE_MASK 指定型 (s8 / s16 / float)
```

法線型フラグ (`MV1_FRAME_NORMAL_TYPE_*`):
- `NONE` (0) — 法線なし (自動計算)
- `S8` (1) — 各成分 signed char (-127..127 で [-1..1])
- `S16` (2) — 各成分 signed short
- `F32` (3) — float 3 成分

### ボーンウェイト圧縮

`MATRIX_WEIGHT_TYPE_U8` / `U16` で頂点ウェイトを 8/16 bit に圧縮可能 (生 float なら 4 byte/weight)。

---

## メッシュ `MV1_MESH_F1`

フレームに属する描画単位。1 マテリアル = 1 メッシュが基本。

| 役割 | フィールド |
|---|---|
| 親 | `Container` (ptr to MV1_FRAME_F1) |
| マテリアル | `Material` (ptr) |
| 頂点色 | `UseVertexDiffuseColor` / `UseVertexSpecularColor` / `NotOneDiffuseAlpha` |
| 形状 | `Shape` (1=シェイプメッシュ) |
| 描画制御 | `Visible` / `BackCulling` (0=なし, 1=表, 2=裏) |
| UV | `UVSetUnitNum` (UV ペア数) / `UVUnitNum` (UV 成分数) |
| 頂点フラグ | `VertFlag` (`MV1_MESH_VERT_FLAG_*`) |
| 頂点数/面数 | `VertexNum` / `FaceNum` |
| 頂点データ | `VertexData` (ptr) |
| トライアングルリスト | `TriangleListNum` / `TriangleList` (ptr) |

### `VertexData` 構造

```
[先頭に一度だけ: VertFlag に MV1_MESH_VERT_FLAG_COMMON_COLOR が立っている場合]
  COLOR_U8 DiffuseColor ;    // 全頂点共通色
  COLOR_U8 SpecularColor ;

[VertexNum 回繰返し: 座標インデックス]
  POS_IND_TYPE_MASK 指定型 (none / u8 / u16 / u32)

[VertexNum 回繰返し: 法線インデックス]
  NRM_IND_TYPE_MASK 指定型

[VertexNum 回繰返し: 頂点カラー (COMMON_COLOR でない場合)]
  COLOR_U8 diffuse + COLOR_U8 specular

[VertexNum 回繰返し: UV 値]
  UVUnitNum * UVSetUnitNum 個、float×2 又は u16×2 (UV_U16 指定時、65535=1.0)

[VertexNum 回繰返し: トゥーン輪郭抑止情報 (NON_TOON_OUTLINE 立っている場合のみ)]
  1 頂点 1 ビット、余り 8 bit 未満はパディング
```

---

## マテリアル `MV1_MATERIAL_F1`

| フィールド | 意味 |
|---|---|
| `Name` / `Index` | 名前 / インデックス |
| `Diffuse` / `Ambient` / `Specular` / `Emissive` | `COLOR_F` (float×4) |
| `Power` | スペキュラパワー |
| `Alpha` | 不透明度 |
| `DiffuseLayerNum` / `DiffuseLayer[8]` | `MV1_MATERIAL_LAYER_F1` の 8 段配列 (1 段目以降は BlendType 有効) |
| `SpecularLayerNum` / `SpecularLayer[8]` | スペキュラマップ |
| `NormalLayerNum` / `NormalLayer[8]` | 法線マップ |
| `UseAlphaTest` / `AlphaFunc` / `AlphaRef` | アルファテスト |
| `DrawBlendMode` / `DrawBlendParam` | 出力時ブレンド |
| `ToonInfo` (ptr or NULL) | `MV1_MATERIAL_TOON_F1` へのオフセット |

### マテリアルレイヤー `MV1_MATERIAL_LAYER_F1`

```c
struct MV1_MATERIAL_LAYER_F1 {
    int Texture ;           // MV1_TEXTURE_F1 のインデックス
    int BlendType ;         // DX_MATERIAL_BLENDTYPE_ADDITIVE など
    DWORD Padding[4] ;
} ;
```

### トゥーン情報 `MV1_MATERIAL_TOON_F1`

```c
struct MV1_MATERIAL_TOON_F1 {
    int   Type ;                    // DX_MATERIAL_TYPE_TOON など
    int   DiffuseGradTexture ;      // ディフューズグラデ texture index (-1=デフォルト)
    int   SpecularGradTexture ;     // スペキュラグラデ
    int   DiffuseGradBlendType ;    // ブレンドタイプ
    int   SpecularGradBlendType ;
    float OutLineWidth ;            // 輪郭線幅 (0..1)
    COLOR_F OutLineColor ;
    float OutLineDotWidth ;         // ドット単位幅
    BYTE  EnableSphereMap ;         // スフィアマップ有効
    BYTE  SphereMapBlendType ;
    short SphereMapTexture ;
    DWORD Padding[2] ;
} ;
```

---

## テクスチャ `MV1_TEXTURE_F1`

| フィールド | 意味 |
|---|---|
| `Name` / `Index` | 名前 / インデックス |
| `ColorFilePath` | カラーチャンネル画像の相対パス (文字列プールへのオフセット) |
| `AlphaFilePath` | アルファチャンネル別画像の相対パス (単独使用時) |
| `BumpImageFlag` / `BumpImageNextPixelLength` | バンプマップ情報 |
| `AddressModeU` / `AddressModeV` | `MV1_TEXTURE_ADDRESS_MODE_WRAP / MIRROR / CLAMP / BORDER` |
| `FilterMode` | `MV1_TEXTURE_FILTER_MODE_POINT / LINEAR` など |
| `Flag` | `MV1_TEXTURE_FLAG_REVERSE` / `BMP32_ALL_ZERO_ALPHA_TO_XRGB8` / `VALID_SCALE_UV` |
| `ScaleU` / `ScaleV` | UV スケール (`VALID_SCALE_UV` 時のみ) |

---

## トライアングルリスト `MV1_TRIANGLE_LIST_F1`

```c
struct MV1_TRIANGLE_LIST_F1 {
    DWORD  DimPrev, DimNext ;
    int    Index ;
    DWORD  Container ;                 // ptr to MV1_MESH_F1
    WORD   VertexType ;                // MV1_VERTEX_TYPE_NORMAL / SKIN_4BONE / SKIN_8BONE / SKIN_FREEBONE
    WORD   Flag ;                      // MV1_TRIANGLE_LIST_FLAG_* (インデックス型 + 法線型)
    WORD   VertexNum ;
    WORD   IndexNum ;
    DWORD  MeshVertexIndexAndIndexData ;
    DWORD  Padding[2] ;
} ;
```

### `MeshVertexIndexAndIndexData` 構造

```
[VertexType == SKIN_4BONE / SKIN_8BONE の場合]
  WORD UseBoneNum ;          // 使用ボーン数
  WORD BoneIndices[UseBoneNum] ;

[VertexType == SKIN_FREEBONE の場合]
  WORD MaxBoneNum ;          // 最大使用ボーン数のみ

[VertexNum 個のメッシュ頂点インデックス]
  Flag & MV1_TRIANGLE_LIST_FLAG_MVERT_INDEX_MASK に応じた型 (u8/u16/u32)

[IndexNum 個の頂点インデックス]
  Flag & MV1_TRIANGLE_LIST_FLAG_INDEX_MASK に応じた型
```

---

## スキンボーン `MV1_SKIN_BONE_F1`

```c
struct MV1_SKIN_BONE_F1 {
    DWORD          DimPrev, DimNext ;
    int            Index ;
    int            BoneFrame ;                       // ボーンとして使うフレーム index
    MATRIX_4X4CT_F ModelLocalMatrix ;                // 4x4 行 3 行形式 (省略 4 行目)
    int            ModelLocalMatrixIsTranslateOnly ; // 並進のみ=1
    int            UseFrameNum ;
    DWORD          UseFrame ;                        // MV1_SKIN_BONE_USE_FRAME_F1[]
    DWORD          Padding[2] ;
} ;
```

---

## ライト `MV1_LIGHT_F1`

`MV1_LIGHT_TYPE_POINT` / `DIRECTIONAL` / `SPOT`。色 3 種 (Diffuse/Specular/Ambient)、減衰係数 3 つ (`Attenuation0..2`)、スポット角 2 つ (`Theta`/`Phi`)、フォールオフ、有効距離。

---

## アニメーション

3 層構造:

1. **`MV1_ANIMSET_F1`** — 「歩行」「攻撃」等のアニメーション集合。`Name` で名前アクセス可。
2. **`MV1_ANIM_F1`** — セット内の各アニメ。対象フレーム・回転オーダー・キーセット配列を持つ。
3. **`MV1_ANIM_KEYSET_F1`** — キーフレーム列本体。

### キーセットのデータフォーマット

`Type` (`MV1_ANIMKEY_TYPE_*`) × `DataType` (`ROTATE` / `TRANSLATE` / `SCALE` / `MATRIX` / `SHAPE` 等) の組合せでキー格納形式が変わる。`Flag` ビット (`MV1_ANIM_KEYSET_FLAG_*`) で時間・キー値の圧縮形態を切替:

- `KEY_ONE` — キー数は 1 (時間軸無し、静的)
- `KEYNUM_B` / `KEYNUM_W` — キー数を 1 byte / 2 byte で格納
- `TIME_BIT16` / `TIME_UNIT` / `TIME_UNIT_ST_W` / `_ST_Z` / `_UN_W` — 時間軸を 16bit / 固定間隔 (start+unit) / 0 開始 等で圧縮
- `KEY_BIT16` — キー値を 16bit 化 (Min + Unit * 16bit_index の形式)

KeyData ブロックの可変長レイアウトは `DxModelFile.h` 130-175 行のコメントに詳細記述あり。

### キー値型

- `MV1_ANIM_KEY_MATRIX4X4C_F1` — float[4][3] (4 列目 (0,0,0,1) 固定)
- `MV1_ANIM_KEY_MATRIX3X3_F1` — float[3][3]
- `MV1_ANIM_KEY_MATRIX3X3_B16_F1` — WORD[3][3] (16bit 圧縮)
- Quaternion 版 (`MV1_ROTATE_F1` union の `Qt` 型)

### 16bit 補助情報 `MV1_ANIM_KEY_16BIT_F1`

```c
struct MV1_ANIM_KEY_16BIT_F1 {
    BYTE Min ;   // bit7: zero指標 / bit6: 符号 / bit5: 指数符号 / bit4-0: 指数 (10^-15 ... 10^15)
    BYTE Unit ;  // bit7: 指数符号 / bit6-4: 指数 (10^-7 ... 10^7) / bit3-0: 乗算整数値 (0-15)
} ;
```

→ 実値 = `Min * 10^sMin + unit16bit * Unit * 10^sUnit * mulInt`。16bit インデックスを用いて小さなダイナミックレンジを表現。

---

## シェイプ (モーフ) `MV1_FILEHEAD_SHAPE_F1`

顔表情等のモーフターゲット。`MV1_SHAPE_F1` は複数の `MV1_SHAPE_MESH_F1` を持ち、各々が `MV1_SHAPE_VERTEX_F1[]` を保持。シェイプ頂点は base からの差分を保存 (Position/Normal)。`IsVertexPress=1` で頂点データ圧縮対応。

---

## 物理演算 `MV1_FILEHEAD_PHYSICS_F1`

Bullet Physics 用の剛体 + ジョイント情報。

- **剛体** `MV1_PHYSICS_RIGIDBODY_F1`: ShapeType (0=球 / 1=箱 / 2=カプセル) + W/H/D、位置/回転、重さ、摩擦、弾性、タイプ (Bone 追従 / 自由 / Bone 位置揃え)
- **ジョイント** `MV1_PHYSICS_JOINT_F1`: 2 剛体間の bound、位置/回転制限、スプリング定数

---

## 座標系の注意

| フィールド | 意味 |
|---|---|
| `RightHandType` | TRUE で右手系 (OpenGL 系) / FALSE で左手系 (DirectX 系) |
| 頂点 UV V | 下向きが正 (画像メモリ順と一致) |

loader 側で座標系変換を行うかどうかは呼び出し側次第。

---

## 文字列プール `StringBuffer`

全 `Name` / `ColorFilePath` 等は "文字列プール" に連結格納された null 終端文字列の先頭からのバイトオフセット。`IsStringUTF8` フラグで UTF-8 / Shift-JIS を選択。

---

## バージョニング

現行は `Version = 1` のみ。将来の `"MV12"` 等の拡張に備え、loader は `CheckID == "MV11"` のみ受理する設計。

---

## 制限事項 / 注意点

1. **DXA 圧縮は必須** — 非圧縮の 4 byte 以降を直接書いても読めない。`DXA_Encode` 経由でのみ生成。
2. **ポインタ相当 DWORD** — 32bit バイトオフセット。2GB 超のモデルは未対応。
3. **Padding フィールド** — 構造体サイズを 4/8 byte 境界に揃えるための 0 埋め。将来の拡張予約。
4. **エンディアン** — リトルエンディアン固定 (big-endian プラットフォームでは loader 側で変換要)。
5. **PMX 由来モデルのトゥーン輪郭** — `MV1_MESH_VERT_FLAG_NON_TOON_OUTLINE` フラグで頂点単位に ON/OFF 指定。
6. **LightData (`MV1_LIGHT_F1`)** の `MV1_LIGHT_F1` は `MV1_FRAME_F1.Light` 経由でフレームに属する (独立ライトリストは `Light` / `LightNum` 参照)。

---

## 参考: MV1LoadModel の主な処理フロー

```
1. "MV11" マジック確認
2. DXA_Decode で伸長後サイズ取得 → 確保 → 再 DXA_Decode
3. MV1MODEL_FILEHEADER_F1 を解析
4. オフセット → ポインタ変換 (全ての配列とネスト構造)
5. 文字列プールから Name / FilePath 等を wchar_t にコピー
6. MV1_MODEL_BASE 構造体 (ランタイム表現) を malloc 一括確保してフィールド単位コピー
7. テクスチャファイルを LoadGraph で順次ロード (ColorFilePath / AlphaFilePath)
8. ハンドル値を返却 (DX_HANDLETYPE_MODEL)
```

---

## ファイル構造参考図

```
┌─────────────────────────────────────────────┐
│ Magic "MV11" (4 bytes)                      │
├─────────────────────────────────────────────┤
│ DXA compressed block                        │
│  ╭─────────────────────────────────╮        │
│  │ MV1MODEL_FILEHEADER_F1 (~128B)  │        │
│  │   CheckID / Version             │        │
│  │   FrameNum + Frame ptr          │────┐   │
│  │   MaterialNum + Material ptr    │──┐ │   │
│  │   TextureNum + Texture ptr      │┐ │ │   │
│  │   MeshNum + Mesh ptr            │┼─┐ │   │
│  │   TriangleListNum + TL ptr      │┼│┼─┐   │
│  │   SkinBoneNum + SkinBone ptr    │┼│┼│┼─┐ │
│  │   VertexData ptr                │┼│┼│┼│┼─┐
│  │   StringBuffer ptr              │┼│┼│┼│┼│┼─┐
│  │   AnimSetNum + AnimSet ptr      │┼│┼│┼│┼│┼│┼─┐
│  │   Shape ptr / Physics ptr       │┼│┼│┼│┼│┼│┼│┼─┐
│  ╰─────────────────────────────────╯│ │ │ │ │ │  │
│  ╭──────────────────────────────────┘ │ │ │ │ │  │
│  │ MV1_TEXTURE_F1 [TextureNum]        │ │ │ │ │  │
│  ╰────────────────────────────────────┘ │ │ │ │  │
│  ╭──────────────────────────────────────┘ │ │ │  │
│  │ MV1_MATERIAL_F1 [MaterialNum]          │ │ │  │
│  ╰────────────────────────────────────────┘ │ │  │
│  ╭──────────────────────────────────────────┘ │  │
│  │ MV1_FRAME_F1 [FrameNum]                    │  │
│  │   with PositionAndNormalData inline        │  │
│  ╰────────────────────────────────────────────┘  │
│  ╭──────────────────────────────────────────────┘
│  │ MV1_MESH_F1 [MeshNum]                       
│  │   with VertexData inline                    
│  ╰────────────────────────────────────────────
│  ...
│  ╭────────────────────────────────────────────
│  │ StringBuffer (UTF-8 or Shift-JIS, null-concat)
│  ╰────────────────────────────────────────────
│  ╭────────────────────────────────────────────
│  │ AnimKeyData (可変長、フラグで圧縮形式切替)
│  ╰────────────────────────────────────────────
└─────────────────────────────────────────────┘
```

---

## 生成ツール

`MV1SaveModelToMV1File()` の引数:

- `MHandle` — 保存対象モデルハンドル
- `FileName` — 出力パス
- `SaveType` — 0=アニメ込み / 1=ジオメトリのみ / 2=アニメのみ
- `AnimMHandle` — 別モデルのアニメを借りる場合
- `AnimNameCheck` — アニメ名照合モード
- `Normal8BitFlag` — 法線 8bit 圧縮
- `Position16BitFlag` — 座標 16bit 圧縮
- `Weight8BitFlag` — スキンウェイト 8bit 圧縮
- `Anim16BitFlag` — アニメキー 16bit 圧縮

圧縮フラグを立てるとファイル容量は 40〜60% 削減されるが精度低下に注意。

---

*このドキュメントは DxLib 3.24f 時点の `.mv1` フォーマット (Version 1, `"MV11"` magic) を対象とする。将来のバージョン拡張には未対応。*
