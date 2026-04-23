# DxLib `.mv1` ファイル形式仕様書

**対象:** DxLib 3.24f の MV1 モデルファイル (Ver.1)
**出典:** `DxModel.cpp` / `DxArchive_.cpp` (loader) + `DxModelFile.h` / `DxLib.h` / `DxModel.h` (バイナリ構造体と enum)
**文字コード表記:** リトルエンディアン、C 構造体の直接シリアライズ (padding は明示)

## 目次

1. [概要](#概要)
2. [ファイル全体レイアウト](#ファイル全体レイアウト)
3. [DXA 圧縮アルゴリズム詳細](#dxa-圧縮アルゴリズム詳細) ★
4. [ルートヘッダ `MV1MODEL_FILEHEADER_F1`](#ルートヘッダ-mv1model_fileheader_f1)
5. [階層データ `MV1_FRAME_F1`](#階層データ-mv1_frame_f1)
6. [メッシュ `MV1_MESH_F1`](#メッシュ-mv1_mesh_f1)
7. [マテリアル `MV1_MATERIAL_F1`](#マテリアル-mv1_material_f1)
8. [テクスチャ `MV1_TEXTURE_F1`](#テクスチャ-mv1_texture_f1)
9. [トライアングルリスト `MV1_TRIANGLE_LIST_F1`](#トライアングルリスト-mv1_triangle_list_f1)
10. [スキンボーン `MV1_SKIN_BONE_F1`](#スキンボーン-mv1_skin_bone_f1)
11. [ライト `MV1_LIGHT_F1`](#ライト-mv1_light_f1)
12. [アニメーション](#アニメーション)
13. [シェイプ (モーフ)](#シェイプ-モーフ-mv1_filehead_shape_f1)
14. [物理演算](#物理演算-mv1_filehead_physics_f1)
15. [座標系の注意](#座標系の注意)
16. [文字列プール](#文字列プール-stringbuffer)
17. [バージョニング](#バージョニング)
18. [制限事項](#制限事項--注意点)
19. [Writer の落とし穴](#writer-の落とし穴) ⚠️
20. [付録 A: 全 enum 値一覧](#付録-a-全-enum-値一覧) ★
21. [付録 B: 可変長セクションの byte レイアウト詳細](#付録-b-可変長セクションの-byte-レイアウト詳細) ★
22. [付録 C: 16bit 圧縮値のデコード式](#付録-c-16bit-圧縮値のデコード式) ★
23. [付録 D: MATRIX_4X4CT_F / FLOAT4 の実メモリ配置](#付録-d-matrix_4x4ct_f--float4-の実メモリ配置) ★
24. [付録 E: リファレンス C パーサ (最小読み取り実装)](#付録-e-リファレンス-c-パーサ-最小読み取り実装) ★

★印 = 拡充版で追加された章

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
| 0x00  | Magic  "MV11" (4 bytes)     |   ← MV1MODEL_FILEHEADER_F1.CheckID[4] と同一のバイト列
+-------+-----------------------------+
| 0x04  | DXA 圧縮ブロック            |
|       |   伸長すると                |
|       |   MV1MODEL_FILEHEADER_F1 の |
|       |   Version 以降 + 可変長     |
|       |   データ群                  |
+-------+-----------------------------+
```

- **Magic**: ASCII 4 バイト `M V 1 1`。これ以外は即 `-1` エラー。この 4 byte は「`MV1MODEL_FILEHEADER_F1` の `CheckID[4]`」でもある — つまり **CheckID は DXA 圧縮に含まれず、ファイル magic をそのまま `FHeader` の先頭 4 byte に流用する** 設計 (`DxModel.cpp` L14921: `DXA_Decode( file+4, (BYTE*)FHeader + 4 )`)。
- **DXA 圧縮**: `DXA_Decode(src + 4, NULL)` で伸長後サイズを取得、バッファ確保、再 `DXA_Decode` で `FHeader+4` 以降に実データ展開。アルゴリズムは DxLib 独自の LZSS 派生 (本文参照: `DxArchive_.cpp`)。
- **`Version` は `0`** (DxLib 3.24f 時点)。古い記述の「Version = 1」は誤り。Magic の `'1'` はバージョンではなく形式識別子。

伸長されたデータは「`MV1MODEL_FILEHEADER_F1` の `Version` フィールド (offset 4) 以降」としてメモリに貼られ、同じバッファ内の後続オフセットに各種配列やポインタ先が連続配置される。従って **パーサ実装側は decode 結果の先頭に `"MV11"` 4 byte を自前で補って `FHeader` として reinterpret する** のが簡単 (`mv1conv` はこの方式)。構造体メンバー内の **ポインタ相当の DWORD は「このバッファ (CheckID 込み) 先頭からのバイトオフセット」を格納** (ロード時にポインタへ変換される)。ポインタ値 `0` は null。

---

## DXA 圧縮アルゴリズム詳細

出典: `DxArchive_.cpp` の `DXA_Encode` / `DXA_Decode`。純粋 LZSS (Huffman 併用なし)。`.mv1` の magic `"MV11"` 直後から始まるバイト列がこの形式。

### 9 byte 固定ヘッダ

| offset | type | 意味 |
|---|---|---|
| 0 | DWORD (LE) | `OriginalSize` 元のバイト数 |
| 4 | DWORD (LE) | `CompressedSize` 圧縮後バイト数 (この 9 byte ヘッダを含む) |
| 8 | BYTE | `KeyCode` マッチ開始マーカ (圧縮元データに存在しないバイト値が選ばれる) |

### 本体 (stream)

リテラル byte と backref の混在列。どちらかの判別は「現バイトが `KeyCode` か否か」で行う:

- **リテラル** (通常バイト): `byte != KeyCode` → そのまま出力
- **エスケープ済みリテラル** (`KeyCode` そのもの): `KeyCode KeyCode` → 1 個の `KeyCode` を出力
- **マッチ参照**: `KeyCode <flags> [<extlen>] <addr...>` → 過去データからコピー

### マッチ参照エンコード

`KeyCode` の直後のバイトを `flags` と呼ぶ (値が `KeyCode` 以上の場合は **デコード時に -1 する** 補正あり):

```
bit 7-3: (match_length - 4) の下位 5 bit (0..31)
bit 2  : 拡張長フラグ (1 なら次 1 byte で長さ bit 8-5 を追加)
bit 1-0: アドレス byte 数
           00 = 1 byte  (1..256 back)
           01 = 2 byte  (1..65536 back)
           10 = 3 byte  (1..16777216 back)
```

`flags` の次は:
- 拡張長が立っていれば `extlen` (1 byte): これで `length |= (extlen << 5)` し、合計 13 bit の長さを扱える
- アドレス byte 数分の little-endian 整数 (保存時 -1 のバイアス付き、デコード時 +1)

### パラメータ定数

| 名称 | 値 | 意味 |
|---|---|---|
| `MIN_COMPRESS` | 4 | これ以上のマッチ長のみ圧縮に使う |
| `MAX_COPYSIZE` | **8195** (5bit + 8bit + `MIN_COMPRESS`) | 最大マッチ長 (decoder は 13bit しか読まない) |
| `MAX_POSITION` | 16 MB (1<<24) | 最大 lookback 距離 |

> **注**: 旧 spec に `0x7FFF (32,767)` と書いてあったのは誤り。実 decoder は
> `length = ((flags>>3) & 0x1F) | (ext_byte << 5); length += 4` で組み立てるので、
> 最大長は `0x1FFF + 4 = 8195` byte。`mv1conv` の encoder も 8195 で cap している。

### デコード疑似コード

```c
uint32_t DXA_Decode_Size( const uint8_t *src )
{
    return read_u32_le( src + 0 ) ;   // OriginalSize
}

int DXA_Decode( const uint8_t *src, uint8_t *dst )
{
    uint32_t origSize = read_u32_le( src + 0 ) ;
    uint32_t compSize = read_u32_le( src + 4 ) ;
    uint8_t  key      = src[ 8 ] ;
    const uint8_t *sp = src + 9 ;
    const uint8_t *spEnd = src + compSize ;
    uint8_t  *dp = dst ;

    while ( sp < spEnd ) {
        if ( *sp != key ) {                 /* リテラル */
            *dp++ = *sp++ ;
            continue ;
        }
        if ( sp[ 1 ] == key ) {             /* エスケープ済 KeyCode */
            *dp++ = key ;
            sp += 2 ;
            continue ;
        }

        /* マッチ参照 */
        uint8_t flags = sp[ 1 ] ;
        if ( flags > key ) flags-- ;        /* デコード補正 */
        sp += 2 ;

        uint32_t length = ( flags >> 3 ) & 0x1F ;
        if ( flags & 0x04 ) {               /* 拡張長 */
            length |= ( uint32_t )( *sp++ ) << 5 ;
        }
        length += 4 ;                        /* MIN_COMPRESS 加算 */

        uint32_t distance = 0 ;
        switch ( flags & 0x03 ) {
        case 0 : distance =   *sp++ ;                                       break ;
        case 1 : distance =   read_u16_le( sp ) ;                 sp += 2 ; break ;
        case 2 : distance =   read_u16_le( sp ) | ( sp[ 2 ] << 16 ) ; sp += 3 ; break ;
        }
        distance += 1 ;                      /* デコード補正 */

        /* 自己参照コピー (distance < length) の場合、少しずつ展開 */
        if ( distance < length ) {
            uint32_t part = distance ;
            while ( length > part ) {
                memcpy( dp, dp - part, part ) ;
                dp     += part ;
                length -= part ;
                part   += part ;              /* 2 倍ずつ広げる */
            }
            memcpy( dp, dp - distance * 2, length ) ;  /* 残り */
            dp += length ;
        } else {
            memcpy( dp, dp - distance, length ) ;
            dp += length ;
        }
    }
    return ( int )origSize ;
}
```

### `.mv1` ファイルから DXA ブロックを取り出す

```c
uint32_t get_dxa_size( const uint8_t *file, size_t fileLen )
{
    if ( fileLen < 4 + 9 ) return 0 ;
    if ( memcmp( file, "MV11", 4 ) != 0 ) return 0 ;
    return read_u32_le( file + 4 + 4 ) ;  /* DXA ヘッダの CompressedSize */
}
```

- ファイル全体のサイズ = `4 (magic) + CompressedSize (DXA 圧縮部分含む)`
- 伸長後サイズ = `OriginalSize` (DXA ヘッダの先頭 4 byte)

### Encode 側の注意

- `KeyCode` の選定 = 入力データ中に最も少ないバイト値を 0..255 から線形探索 (`DXA_GetKeyCode`)。稀な値ほど stream が短くなる。
- `match_length` が `MIN_COMPRESS` 未満 or match が見つからない場合はリテラル書き出し。
- 長い一致を優先 (greedy LZSS)、backtrack や lazy matching は実装されていない。

### 暗号化について

本セクションで扱う `DXA_Encode/Decode` は **ファイル内部圧縮** 専用で、`.dxa` アーカイブの鍵付き暗号化 (`DXArchive` クラス内蔵) とは **別物**。`.mv1` には暗号化はない。

---

## ルートヘッダ `MV1MODEL_FILEHEADER_F1`

**正確に 304 バイト (0x130)** の固定長ヘッダ (4 byte align)。主要フィールド:

| offset | type | name | 意味 |
|---|---|---|---|
| 0x00 | BYTE[4] | `CheckID[4]` | `"MV11"` — **ファイル magic を流用、DXA ブロックには含まれない** |
| 0x04 | DWORD | `Version` | `0` (DxLib 3.24f 現行。旧仕様書の「1」は誤り) |
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

ヘッダ全長: **304 byte (0x130)**。`mv1conv` の `static_assert(sizeof(MV1MODEL_FILEHEADER_F1) == 304)` で確認可能。

> **検証済サンプル** (mv1conv reader 通過): `SimpleModel.mv1` / `SimpleModelVertexColor.mv1` / `SimplePillarStage.mv1` / `ColTestStage.mv1` / `DxChara.mv1` (DxLib_VC3_24f 同梱)。全てで magic `MV11` / `Version=0` / `IsStringUTF8=1` / `MaterialNumberOrderDraw=0` を確認。

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
7. ⚠️ **`ChangeMatrixTable` / `ChangeDrawMaterialTable` は 0 にしてはいけない** — 詳細は [writer の落とし穴](#writer-の落とし穴) 参照。

---

## Writer の落とし穴

DxLib 互換の `.mv1` を自作 writer で生成する際、loader で **必ず** crash する罠を以下に列挙。

### ⚠️ `ChangeMatrixTable` / `ChangeDrawMaterialTable` は必ず非 0 の buffer を指すべき

| フィールド | 型 | 意味 |
|-----------|-----|-----|
| `ChangeDrawMaterialTableSize` | int | 描画マテリアル変更追跡用 bit-flag table のバイト数 |
| `ChangeMatrixTableSize`       | int | 行列変更追跡用 bit-flag table のバイト数 |
| `ChangeDrawMaterialTable`     | DWORD (offset) | 上記 bit-flag table の実データ位置 |
| `ChangeMatrixTable`           | DWORD (offset) | 同上 |

**これらを 0 / 空にしてはいけない**。DxLib は frame / mesh / material の状態変化を
1 bit / element で追跡する runtime テーブルを持ち、load 時にこの領域を memcpy
して `MBase->ChangeMatrixTable` 等のポインタに設定する。サイズ 0 で確保する
と runtime の bit 操作で境界外 write が発生し、debug allocator の
MagicID tag 破壊 → `GetAllocSize Error : メモリタグの MagicID が不正です`
→ crash に至る。

**データ依存で再現する** 厄介な症状で、frame 数が閾値 (5 前後、buffer 配置次第)
を超えると初めて crash する。試行錯誤で原因特定が非常に困難。

#### 正しい書き方

- サイズは `max(FrameNum, MeshNum, MaterialNum)` bit 分の DWORD 整列を確保。
- 実務上 **256 byte (2048 bit) を固定で確保** して全ゼロ埋めすれば安全マージン
  で事足りる (通常 frame 数は数十〜数百)。
- `ChangeMatrixTable` / `ChangeDrawMaterialTable` は上記 buffer 先頭への
  ファイルオフセットを指す。両者 **別々** の buffer にすること。

```cpp
// Writer 実装例 (C++)
const int32_t changeTableSize = 256;  // 2048 bit、frame 数に応じて可変でも可
uint32_t offChangeDrawMatTable = append_zero_bytes(changeTableSize);  // 全 0
uint32_t offChangeMatTable     = append_zero_bytes(changeTableSize);  // 全 0

hdr.ChangeDrawMaterialTableSize = changeTableSize;
hdr.ChangeDrawMaterialTable     = offChangeDrawMatTable;
hdr.ChangeMatrixTableSize       = changeTableSize;
hdr.ChangeMatrixTable           = offChangeMatTable;
```

各 `MV1_FRAME_F1` / `MV1_MESH_F1` の `ChangeInfo` (`MV1_CHANGE_F1`) フィールドは
すべて 0 で OK (runtime で table への offset を逆算するため、`Target` /
`Fill` = 0 のままで一貫している)。

### ⚠️ `NON_TOON_OUTLINE` フラグを立てたら bit data を忘れずに

`MV1_MESH_F1.VertFlag` bit 6 (`MV1_MESH_VERT_FLAG_NON_TOON_OUTLINE`) を
立てた場合、`VertexData` blob の末尾に **`VertexNum` ビット分のデータ** を
書く必要がある (各頂点の `ToonOutLineScale > 0` か否か 1 bit)。省略するとフラグ
が立っているのに bit data が無いとして load 時に overrun する。

全頂点を「輪郭なし」にするなら `0xFF` で埋める (bit=1 = ToonOutLineScale=0)。
その後 4 byte 整列までゼロ padding。

### ⚠️ `TriangleListNormalPositionNum` は per-corner 合計であるべき

非 skin の `MV1_VERTEX_TYPE_NORMAL` な triangle list では、この値は
**全 triangle list の `VertexNum` 合計** でなければならない (DxLib は
`MV1_TLIST_NORMAL_POS[N]` のメモリを N 個分確保し、各 TL が自分の
`VertexNum` 分をスライス消費する)。ずれると 16 byte align 再計算で
末尾の TL が overflow する。

### ⚠️ Frame 階層は DxLib save と同じ形に

- **Static mesh**: 合成 root frame は作らず、各 mesh frame を `TopFrameNum=M`
  の top-level 兄弟にして `Prev`/`Next` で連結する。
- **Skin mesh**: root frame を 1 つ作り、mesh frames と bones はその子。
  `TopFrameNum=1`。

空の root を挟むと一部の `FirstChild` / `LastChild` 走査で特定条件下に crash。

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

---

## 付録 A: 全 enum 値一覧

本文で参照する定数の実数値。出典: `DxLib.h` / `DxModel.h` / `DxModelFile.h`。

### A.1 `MV1_VERTEX_TYPE_*` — 頂点型 (`MV1_TRIANGLE_LIST_F1.VertexType`)

| 名称 | 値 | 意味 |
|---|---|---|
| `MV1_VERTEX_TYPE_NORMAL`        | 0 | 通常メッシュ (スキンなし) |
| `MV1_VERTEX_TYPE_SKIN_4BONE`    | 1 | スキンメッシュ 1〜4 ボーン |
| `MV1_VERTEX_TYPE_SKIN_8BONE`    | 2 | スキンメッシュ 5〜8 ボーン |
| `MV1_VERTEX_TYPE_SKIN_FREEBONE` | 3 | 9 ボーン以上の可変長スキン |

### A.2 `MV1_ROTATE_TYPE_*` — 回転表現

| 名称 | 値 | 意味 |
|---|---|---|
| `MV1_ROTATE_TYPE_XYZROT`     | 0 | Euler 角 (XYZ 軸) |
| `MV1_ROTATE_TYPE_QUATERNION` | 1 | クォータニオン |
| `MV1_ROTATE_TYPE_MATRIX`     | 2 | 行列 (MATRIX_4X4CT_F) |
| `MV1_ROTATE_TYPE_ZAXIS`      | 3 | Z 軸 + ローカルベクトル + スケール |

### A.3 `MV1_ROTATE_ORDER_*` — Euler 角オーダー

| 名称 | 値 |
|---|---|
| `MV1_ROTATE_ORDER_XYZ` | 0 |
| `MV1_ROTATE_ORDER_XZY` | 1 |
| `MV1_ROTATE_ORDER_YZX` | 2 |
| `MV1_ROTATE_ORDER_YXZ` | 3 |
| `MV1_ROTATE_ORDER_ZXY` | 4 |
| `MV1_ROTATE_ORDER_ZYX` | 5 |

### A.4 `MV1_ANIMKEY_TYPE_*` — アニメキーのデータエンコード

| 名称 | 値 | 意味 |
|---|---|---|
| `MV1_ANIMKEY_TYPE_QUATERNION_X`  | 0 | クォータニオン (X ファイル形式) |
| `MV1_ANIMKEY_TYPE_VECTOR`        | 1 | ベクトル |
| `MV1_ANIMKEY_TYPE_MATRIX4X4C`    | 2 | 4x4 行列 (4 行目固定) |
| `MV1_ANIMKEY_TYPE_MATRIX3X3`     | 3 | 3x3 行列 |
| `MV1_ANIMKEY_TYPE_FLAT`          | 4 | 定数補間 (階段関数) |
| `MV1_ANIMKEY_TYPE_LINEAR`        | 5 | 線形補間 |
| `MV1_ANIMKEY_TYPE_BLEND`         | 6 | スプライン補間 |
| `MV1_ANIMKEY_TYPE_QUATERNION_VMD`| 7 | クォータニオン (VMD 形式) |

### A.5 `MV1_ANIMKEY_DATATYPE_*` — アニメキーの対象

| 名称 | 値 | 意味 |
|---|---|---|
| `MV1_ANIMKEY_DATATYPE_ROTATE`       | 0  | 全軸回転 |
| `MV1_ANIMKEY_DATATYPE_ROTATE_X`     | 1  | X 軸回転 |
| `MV1_ANIMKEY_DATATYPE_ROTATE_Y`     | 2  | Y 軸回転 |
| `MV1_ANIMKEY_DATATYPE_ROTATE_Z`     | 3  | Z 軸回転 |
| `MV1_ANIMKEY_DATATYPE_SCALE`        | 5  | 全軸スケール |
| `MV1_ANIMKEY_DATATYPE_SCALE_X`      | 6  | X スケール |
| `MV1_ANIMKEY_DATATYPE_SCALE_Y`      | 7  | Y スケール |
| `MV1_ANIMKEY_DATATYPE_SCALE_Z`      | 8  | Z スケール |
| `MV1_ANIMKEY_DATATYPE_TRANSLATE`    | 10 | 全軸並進 |
| `MV1_ANIMKEY_DATATYPE_TRANSLATE_X`  | 11 | X 並進 |
| `MV1_ANIMKEY_DATATYPE_TRANSLATE_Y`  | 12 | Y 並進 |
| `MV1_ANIMKEY_DATATYPE_TRANSLATE_Z`  | 13 | Z 並進 |
| `MV1_ANIMKEY_DATATYPE_MATRIX4X4C`   | 15 | 4x4 行列 |
| `MV1_ANIMKEY_DATATYPE_MATRIX3X3`    | 17 | 3x3 行列 |
| `MV1_ANIMKEY_DATATYPE_SHAPE`        | 18 | シェイプ (モーフ) ウェイト |
| `MV1_ANIMKEY_DATATYPE_OTHRE`        | 20 | その他 (typo は原文ママ: OTHER ではなく OTHRE) |

### A.6 `MV1_LIGHT_TYPE_*`

| 名称 | 値 |
|---|---|
| `MV1_LIGHT_TYPE_POINT`       | 0 |
| `MV1_LIGHT_TYPE_SPOT`        | 1 |
| `MV1_LIGHT_TYPE_DIRECTIONAL` | 2 |

### A.7 `MV1_FRAMEFLAG_*` (ビットフラグ)

| 名称 | bit | 意味 |
|---|---|---|
| `MV1_FRAMEFLAG_VISIBLE`            | 0x0001 | 表示 |
| `MV1_FRAMEFLAG_IGNOREPARENTTRANS`  | 0x0002 | 親の変換を無視 |
| `MV1_FRAMEFLAG_PREROTATE`          | 0x0004 | 前回転 (PreRotate) 有効 |
| `MV1_FRAMEFLAG_POSTROTATE`         | 0x0008 | 後回転 (PostRotate) 有効 |
| `MV1_FRAMEFLAG_TANGENT_BINORMAL`   | 0x0010 | 接線 / 従法線データあり |

### A.8 `DX_MATERIAL_TYPE_*` (`MV1_MATERIAL_TOON_F1.Type`)

| 名称 | 値 | 意味 |
|---|---|---|
| `DX_MATERIAL_TYPE_NORMAL`                             | 0 | 通常 |
| `DX_MATERIAL_TYPE_TOON`                               | 1 | トゥーン |
| `DX_MATERIAL_TYPE_TOON_2`                             | 2 | トゥーン (MMD 互換) |
| `DX_MATERIAL_TYPE_MAT_SPEC_LUMINANCE_UNORM`           | 3 | スペキュラ輝度 (0..1 正規化) |
| `DX_MATERIAL_TYPE_MAT_SPEC_LUMINANCE_CLIP_UNORM`      | 4 | 同 (クリップ付き) |
| `DX_MATERIAL_TYPE_MAT_SPEC_LUMINANCE_CMP_GREATEREQUAL`| 5 | 同 (≥ 比較) |
| `DX_MATERIAL_TYPE_MAT_SPEC_POWER_UNORM`               | 6 | スペキュラ強度 |
| `DX_MATERIAL_TYPE_MAT_SPEC_POWER_CLIP_UNORM`          | 7 | 同 (クリップ付き) |
| `DX_MATERIAL_TYPE_MAT_SPEC_POWER_CMP_GREATEREQUAL`    | 8 | 同 (≥ 比較) |

### A.9 `DX_MATERIAL_BLENDTYPE_*` (レイヤブレンド種別)

| 名称 | 値 |
|---|---|
| `DX_MATERIAL_BLENDTYPE_TRANSLUCENT` | 0 |
| `DX_MATERIAL_BLENDTYPE_ADDITIVE`    | 1 |
| `DX_MATERIAL_BLENDTYPE_MODULATE`    | 2 |
| `DX_MATERIAL_BLENDTYPE_NONE`        | 3 |

### A.10 `MV1_LAYERBLEND_TYPE_*`

| 名称 | 値 |
|---|---|
| `MV1_LAYERBLEND_TYPE_TRANSLUCENT` | 0 |
| `MV1_LAYERBLEND_TYPE_ADDITIVE`    | 1 |
| `MV1_LAYERBLEND_TYPE_MODULATE`    | 2 |
| `MV1_LAYERBLEND_TYPE_MODULATE2`   | 3 |

### A.11 `DX_BLENDMODE_*` (描画時ブレンド、`MV1_MATERIAL_F1.DrawBlendMode`)

主要値のみ (全 38 種):

| 名称 | 値 |
|---|---|
| `DX_BLENDMODE_NOBLEND`       | 0 |
| `DX_BLENDMODE_ALPHA`         | 1 |
| `DX_BLENDMODE_ADD`           | 2 |
| `DX_BLENDMODE_SUB`           | 3 |
| `DX_BLENDMODE_MUL`           | 4 |
| `DX_BLENDMODE_INVSRC`        | 10 |
| `DX_BLENDMODE_PMA_ALPHA`     | 17 |
| `DX_BLENDMODE_PMA_ADD`       | 18 |
| `DX_BLENDMODE_CUSTOM`        | 32 |

### A.12 `MV1_TEXTURE_ADDRESS_MODE_*`

| 名称 | 値 |
|---|---|
| `MV1_TEXTURE_ADDRESS_MODE_WRAP`   | 0 |
| `MV1_TEXTURE_ADDRESS_MODE_MIRROR` | 1 |
| `MV1_TEXTURE_ADDRESS_MODE_CLAMP`  | 2 |

### A.13 `MV1_TEXTURE_FILTER_MODE_*`

| 名称 | 値 |
|---|---|
| `MV1_TEXTURE_FILTER_MODE_POINT`       | 0 |
| `MV1_TEXTURE_FILTER_MODE_LINEAR`      | 1 |
| `MV1_TEXTURE_FILTER_MODE_ANISOTROPIC` | 2 |

### A.14 `MV1_ANIM_KEYSET_FLAG_*` (16bit ビットフラグ)

| 名称 | bit |
|---|---|
| `MV1_ANIM_KEYSET_FLAG_KEY_ONE`          | 0x0001 |
| `MV1_ANIM_KEYSET_FLAG_KEYNUM_B`         | 0x0002 |
| `MV1_ANIM_KEYSET_FLAG_KEYNUM_W`         | 0x0004 |
| `MV1_ANIM_KEYSET_FLAG_TIME_UNIT`        | 0x0008 |
| `MV1_ANIM_KEYSET_FLAG_TIME_UNIT_ST_W`   | 0x0010 |
| `MV1_ANIM_KEYSET_FLAG_TIME_UNIT_ST_Z`   | 0x0020 |
| `MV1_ANIM_KEYSET_FLAG_TIME_UNIT_UN_W`   | 0x0040 |
| `MV1_ANIM_KEYSET_FLAG_TIME_BIT16`       | 0x0080 |
| `MV1_ANIM_KEYSET_FLAG_KEY_BIT16`        | 0x0100 |
| `MV1_ANIM_KEYSET_FLAG_KEY_MP_PP`        | 0x0200 |
| `MV1_ANIM_KEYSET_FLAG_KEY_Z_TP`         | 0x0400 |

### A.15 `MV1_FRAME_VERT_FLAG_*`

| 名称 | bit |
|---|---|
| `MV1_FRAME_VERT_FLAG_NORMAL_TYPE_MASK`          | 0x0003 |
| `MV1_FRAME_VERT_FLAG_POSITION_B16`              | 0x0004 |
| `MV1_FRAME_VERT_FLAG_MATRIX_WEIGHT_NONE`        | 0x0008 |
| `MV1_FRAME_VERT_FLAG_MATRIX_INDEX_MASK`         | 0x0010 |
| `MV1_FRAME_VERT_FLAG_MATRIX_WEIGHT_MASK`        | 0x0020 |
| `MV1_FRAME_VERT_FLAG_NOMRAL_TANGENT_BINORMAL`   | 0x0040 |

### A.16 `MV1_MESH_VERT_FLAG_*`

| 名称 | bit |
|---|---|
| `MV1_MESH_VERT_FLAG_POS_IND_TYPE_MASK` | 0x0003 |
| `MV1_MESH_VERT_FLAG_NRM_IND_TYPE_MASK` | 0x000c |
| `MV1_MESH_VERT_FLAG_UV_U16`            | 0x0010 |
| `MV1_MESH_VERT_FLAG_COMMON_COLOR`      | 0x0020 |
| `MV1_MESH_VERT_FLAG_NON_TOON_OUTLINE`  | 0x0040 |

### A.17 `MV1_TRIANGLE_LIST_FLAG_*`

| 名称 | bit |
|---|---|
| `MV1_TRIANGLE_LIST_FLAG_MVERT_INDEX_MASK` | 0x0003 |
| `MV1_TRIANGLE_LIST_FLAG_INDEX_MASK`       | 0x000c |

### A.18 `MV1_TEXTURE_FLAG_*`

| 名称 | bit |
|---|---|
| `MV1_TEXTURE_FLAG_REVERSE`                          | 0x0001 |
| `MV1_TEXTURE_FLAG_BMP32_ALL_ZERO_ALPHA_TO_XRGB8`    | 0x0002 |
| `MV1_TEXTURE_FLAG_VALID_SCALE_UV`                   | 0x0004 |

### A.19 各種型コード

**`MV1_FRAME_NORMAL_TYPE_*`** (2 bit):

| 名称 | 値 | サイズ/頂点 |
|---|---|---|
| `NONE` | 0 | 0 (自動計算) |
| `S8`   | 1 | 3 byte |
| `S16`  | 2 | 6 byte |
| `F32`  | 3 | 12 byte |

**`MV1_FRAME_MATRIX_INDEX_TYPE_*` / `MV1_FRAME_MATRIX_WEIGHT_TYPE_*`** (各 1 bit):

| 名称 | 値 | サイズ |
|---|---|---|
| `U8`  | 0 | 1 byte |
| `U16` | 1 | 2 byte |

**`MV1_MESH_VERT_INDEX_TYPE_*`** (2 bit):

| 名称 | 値 | サイズ |
|---|---|---|
| `NONE` | 0 | 0 |
| `U8`   | 1 | 1 byte |
| `U16`  | 2 | 2 byte |
| `U32`  | 3 | 4 byte |

**`MV1_TRIANGLE_LIST_INDEX_TYPE_*`** (2 bit):

| 名称 | 値 | サイズ |
|---|---|---|
| `U8`  | 0 | 1 byte |
| `U16` | 1 | 2 byte |
| `U32` | 2 | 4 byte |

### A.20 ハンドル型

| 名称 | 値 |
|---|---|
| `DX_HANDLETYPE_MODEL_BASE` | 13 |
| `DX_HANDLETYPE_MODEL`      | 14 |

`MATERIAL_TYPEPARAM_MAX_NUM` = 4 (MV1_MATERIAL_BASE.TypeParam の要素数)

---

## 付録 B: 可変長セクションの byte レイアウト詳細

### B.1 `MV1_MESH_F1.VertexData`

`MV1_MESH_F1.VertFlag` と `UVUnitNum` / `UVSetUnitNum` に応じて可変長。
`VertexData` の読み出し順序:

```
┌─────────────────────────────────────────────────────┐
│ [step 1] 共通色 (VertFlag & COMMON_COLOR が true)   │
│    COLOR_U8 DiffuseColor ;  // 4 byte (B,G,R,A)     │
│    COLOR_U8 SpecularColor ; // 4 byte               │
├─────────────────────────────────────────────────────┤
│ [step 2] 位置インデックス × VertexNum               │
│    size_per_elem = sizeof_index_type(               │
│        VertFlag & MV1_MESH_VERT_FLAG_POS_IND_TYPE_MASK)│
│    合計サイズ = VertexNum * size_per_elem           │
├─────────────────────────────────────────────────────┤
│ [step 3] 法線インデックス × VertexNum               │
│    size_per_elem = sizeof_index_type(               │
│        (VertFlag & MV1_MESH_VERT_FLAG_NRM_IND_TYPE_MASK) >> 2)│
├─────────────────────────────────────────────────────┤
│ [step 4] 頂点色 × VertexNum (COMMON_COLOR が false) │
│    COLOR_U8 Diffuse + COLOR_U8 Specular = 8 byte/頂点│
├─────────────────────────────────────────────────────┤
│ [step 5] UV 値 × VertexNum × (UVUnitNum * UVSetUnitNum)│
│    UV_U16 フラグ立ち: WORD (16bit 固定少数、65535=1.0) │
│    UV_U16 フラグ無し: float                         │
│    各 UV ペアは (u, v) の 2 成分                    │
│    合計 = VertexNum * UVUnitNum * UVSetUnitNum * 2 *│
│           (UV_U16 ? 2 : 4)                          │
├─────────────────────────────────────────────────────┤
│ [step 6] トゥーン輪郭抑止ビット × VertexNum         │
│    (NON_TOON_OUTLINE フラグが立っている場合のみ)    │
│    1 頂点 1 bit、LSB から詰める                     │
│    合計 = ceil( VertexNum / 8 ) byte                │
└─────────────────────────────────────────────────────┘
```

疑似コード:

```c
size_t sizeof_index_type( int type_code ) {
    switch ( type_code ) {
    case 0 /*NONE*/: return 0 ;
    case 1 /*U8*/  : return 1 ;
    case 2 /*U16*/ : return 2 ;
    case 3 /*U32*/ : return 4 ;
    }
    return 0 ;
}

size_t calc_vertex_data_size( MV1_MESH_F1 *m ) {
    size_t s = 0 ;
    if ( m->VertFlag & 0x0020 /*COMMON_COLOR*/ ) s += 8 ;
    int posType = m->VertFlag & 0x3 ;
    int nrmType = ( m->VertFlag >> 2 ) & 0x3 ;
    s += (size_t)m->VertexNum * sizeof_index_type( posType ) ;
    s += (size_t)m->VertexNum * sizeof_index_type( nrmType ) ;
    if ( !( m->VertFlag & 0x0020 ) ) s += (size_t)m->VertexNum * 8 ;
    int uvUnit = m->UVUnitNum * m->UVSetUnitNum ;
    size_t uvElem = ( m->VertFlag & 0x0010 /*UV_U16*/ ) ? 2 : 4 ;
    s += (size_t)m->VertexNum * uvUnit * 2 * uvElem ;
    if ( m->VertFlag & 0x0040 /*NON_TOON_OUTLINE*/ )
        s += ( (size_t)m->VertexNum + 7 ) / 8 ;
    return s ;
}
```

### B.2 `MV1_FRAME_F1.PositionAndNormalData`

`VertFlag` + `PositionNum` / `NormalNum` / `MaxBoneBlendNum` に応じて可変:

```
┌─────────────────────────────────────────────────────┐
│ [step 1] POSITION_B16 フラグ立ちの時のみ            │
│    MV1_POSITION_16BIT_SUBINFO_F1 xSubinfo ; /* 8B */│
│    MV1_POSITION_16BIT_SUBINFO_F1 ySubinfo ; /* 8B */│
│    MV1_POSITION_16BIT_SUBINFO_F1 zSubinfo ; /* 8B */│
│       struct { float Min; float Width; } ;          │
├─────────────────────────────────────────────────────┤
│ [step 2] 座標データ × PositionNum                   │
│    POSITION_B16 立っていれば WORD[3] (6 byte)       │
│                 立っていなければ float[3] (12 byte) │
│                                                     │
│    WORD 値 w (0..65535) からの復元:                 │
│       x = xSubinfo.Min + (w / 65535.0) * xSubinfo.Width│
│       (y, z も同様)                                 │
├─────────────────────────────────────────────────────┤
│ [step 3] スキニング情報 (!MATRIX_WEIGHT_NONE の場合)│
│    座標 × PositionNum 回:                           │
│      MaxBoneBlendNum ボーンぶん or インデックス=-1ま│
│       {                                             │
│         bone_index (U8 or U16, MATRIX_INDEX_MASK 依存)│
│         weight     (U8 or U16, MATRIX_WEIGHT_MASK 依存)│
│       }                                             │
│    終端条件: -1 (U8=0xFF, U16=0xFFFF) を bone_index │
│              で読んだら、その weight は読まず次頂点へ│
├─────────────────────────────────────────────────────┤
│ [step 4] 法線データ × NormalNum                     │
│    (VertFlag & NORMAL_TYPE_MASK) に応じて型:        │
│      NONE (0) = スキップ                            │
│      S8   (1) = s8 × 3    (3 byte)                  │
│      S16  (2) = s16 × 3   (6 byte)                  │
│      F32  (3) = float × 3 (12 byte)                 │
│                                                     │
│    S8/S16 の場合は (-1.0 .. +1.0) を (-127..127) /  │
│    (-32767..32767) にマップ。デコード時に正規化要。 │
│                                                     │
│    TANGENT_BINORMAL フラグ立ち時は法線 3 成分の後に │
│    接線 + 従法線の 2 ベクトル (同じ型) が続く       │
└─────────────────────────────────────────────────────┘
```

### B.3 `MV1_TRIANGLE_LIST_F1.MeshVertexIndexAndIndexData`

```
┌─────────────────────────────────────────────────────┐
│ [step 1] 使用ボーン情報 (VertexType 依存)           │
│                                                     │
│   NORMAL (0):        なし (0 byte)                  │
│                                                     │
│   SKIN_4BONE (1):                                   │
│     WORD UseBoneNum ;                               │
│     WORD BoneIndices[ UseBoneNum ] ;                │
│                                                     │
│   SKIN_8BONE (2):                                   │
│     WORD UseBoneNum ;                               │
│     WORD BoneIndices[ UseBoneNum ] ;                │
│                                                     │
│   SKIN_FREEBONE (3):                                │
│     WORD MaxBoneNum ;  /* 1 頂点あたりの最大使用数 */│
├─────────────────────────────────────────────────────┤
│ [step 2] メッシュ頂点インデックス × VertexNum       │
│     型: (Flag & MVERT_INDEX_MASK) に応じて U8/U16/U32│
├─────────────────────────────────────────────────────┤
│ [step 3] 頂点インデックス × IndexNum                │
│     型: ((Flag & INDEX_MASK) >> 2) に応じて U8/U16/U32│
│     3 個で 1 三角形                                 │
└─────────────────────────────────────────────────────┘
```

**SKIN_FREEBONE の追加情報**: `MaxBoneNum` は 1 頂点が参照する最大ボーン数。各頂点のボーン並びは別途 `MV1_FRAME_F1.PositionAndNormalData` 内に格納される (step 3 の可変長スキニング情報、`-1` 終端)。

### B.4 文字列プール `StringBuffer` のアクセス

```c
const char *get_string( uint8_t *base, uint32_t strOffset ) {
    return (const char *)( base + header->StringBuffer + strOffset ) ;
}
```

- `strOffset` は `StringBuffer` 先頭からの byte 単位オフセット
- 各文字列は null 終端
- `IsStringUTF8 == 1` なら UTF-8、`0` なら Shift-JIS (CP932)
- `Name = 0` の場合は無名 (NULL 文字列扱い)

---

## 付録 C: 16bit 圧縮値のデコード式

アニメキー値を 16bit で格納する場合、`MV1_ANIM_KEY_16BIT_F1` 補助構造体 2 byte で「最小値」と「単位」を記述し、16bit index からの浮動小数復元は以下のビットパック:

### C.1 `MV1_ANIM_KEY_16BIT_F1`

```c
struct MV1_ANIM_KEY_16BIT_F1 {
    uint8_t Min  ;   /* 最小値の符号付き浮動小数 (ビットパック) */
    uint8_t Unit ;   /* 16bit 値 1 あたりの刻み値 (ビットパック)   */
} ;
```

**`Min` のビットレイアウト** (1 byte):

| ビット | 意味 |
|---|---|
| bit 7   | ゼロフラグ (1=Min が 0、以下無視) |
| bit 6   | 符号 (0=正, 1=負) |
| bit 5   | 指数符号 (0=正指数, 1=負指数) |
| bit 4-0 | 指数値 (0..31、実指数は 0..15) |

復元式:
```
if ( bit7 == 1 ) : minVal = 0.0
else            : sign = ( bit6 ? -1.0 : +1.0 )
                  expSign = ( bit5 ? -1 : +1 )
                  exponent = (bit4..bit0) & 0x1F
                  minVal = sign * 10^( expSign * exponent )
```

**`Unit` のビットレイアウト** (1 byte):

| ビット | 意味 |
|---|---|
| bit 7   | 指数符号 (0=正, 1=負) |
| bit 6-4 | 指数値 (0..7、実指数は 0..7) |
| bit 3-0 | 乗算整数値 (0..15) |

復元式:
```
expSign = ( bit7 ? -1 : +1 )
exponent = (bit6..bit4) & 0x07
mulInt   = (bit3..bit0) & 0x0F     /* 0 の場合は 1 扱い */
unitVal  = mulInt * 10^( expSign * exponent )
```

### C.2 16bit キー index から実値へ

```
u16 rawIndex ;   /* 0..65535 */
float realValue = minVal + rawIndex * unitVal ;
```

### C.3 特別エンコード (`MV1_ANIM_KEYSET_FLAG_KEY_MP_PP` / `_Z_TP`)

`MP_PP` フラグが立っている場合、16bit index 0..65535 は `[-π, +π]` に直接マッピングされる:
```
angle = ( rawIndex / 65535.0 ) * 2π - π
```

`Z_TP` フラグが立っている場合は `[0, 2π]`:
```
angle = ( rawIndex / 65535.0 ) * 2π
```

これらのフラグ時は `Min`/`Unit` 補助情報は **省略される** (2 byte 節約)。

### C.4 時間値の 16bit 圧縮

`TIME_BIT16` フラグ立ちで、時間軸も 16bit 化:
- 補助情報 `MV1_ANIM_KEY_16BIT_F1 timeSubInfo` が前置 (2 byte)
- 各キー時刻 = `timeSubInfo.Min + rawTime16 * timeSubInfo.Unit`

`TIME_UNIT` フラグ立ちで、全キーが等間隔 (= 個別時刻記録を省略):
- `TIME_UNIT_ST_W` → 開始時刻を WORD (2 byte)
- `TIME_UNIT_ST_Z` → 開始時刻は 0
- (どちらも無い場合) → 開始時刻は float (4 byte)
- `TIME_UNIT_UN_W` → 単位時間を WORD、無ければ float
- i 番目のキー時刻 = `startTime + i * unitTime`

### C.5 キー数の可変長圧縮

| フラグ | キー数の格納 |
|---|---|
| `KEY_ONE`                 | キー数 = 1 (格納なし) |
| `KEYNUM_B`                | 1 byte (0..255) |
| `KEYNUM_W`                | 2 byte (0..65535) |
| (どれも立ってない) | 4 byte (DWORD) |

---

## 付録 D: `MATRIX_4X4CT_F` / `FLOAT4` の実メモリ配置

### D.1 `MATRIX_4X4CT_F`

4 行 3 列の row-major レイアウト。4 行目は暗黙的に `(0, 0, 0, 1)` 固定。

```c
typedef struct {
    float m[ 4 ][ 3 ] ;   /* row-major: m[row][col] */
} MATRIX_4X4CT_F ;
```

**メモリ上の並び** (48 byte = 12 float):
```
Offset  Element
0x00    m[0][0]   Basis X axis .x
0x04    m[0][1]   Basis X axis .y
0x08    m[0][2]   Basis X axis .z
0x0C    m[1][0]   Basis Y axis .x
0x10    m[1][1]   Basis Y axis .y
0x14    m[1][2]   Basis Y axis .z
0x18    m[2][0]   Basis Z axis .x
0x1C    m[2][1]   Basis Z axis .y
0x20    m[2][2]   Basis Z axis .z
0x24    m[3][0]   Translation .x
0x28    m[3][1]   Translation .y
0x2C    m[3][2]   Translation .z
```

並進成分は `m[3][0..2]` (4 行目の最初の 3 要素)。

### D.2 完全 4x4 への展開

```
[m[0][0]  m[0][1]  m[0][2]  0]
[m[1][0]  m[1][1]  m[1][2]  0]
[m[2][0]  m[2][1]  m[2][2]  0]
[m[3][0]  m[3][1]  m[3][2]  1]
```

DxLib の変換規約は **行ベクトル × 行列** (`v' = v * M`)。すなわち、点 `p = (px, py, pz, 1)` を左から掛けると:
```
p' = p * M
p'.x = px*m[0][0] + py*m[1][0] + pz*m[2][0] + 1*m[3][0]
p'.y = px*m[0][1] + py*m[1][1] + pz*m[2][1] + 1*m[3][1]
p'.z = px*m[0][2] + py*m[1][2] + pz*m[2][2] + 1*m[3][2]
```

### D.3 `FLOAT4` (クォータニオン用)

```c
typedef struct {
    float x, y, z, w ;
} FLOAT4 ;
```

**`MV1_FRAME_F1.Quaternion` の格納順は `(x, y, z, w)`**。w が最後。ほとんどの 3D ライブラリと同じ順だが、一部の他形式 (例えば `.x` ファイル) は `(w, x, y, z)` なので変換時注意。

### D.4 `COLOR_F` と `COLOR_U8`

```c
typedef struct { float r, g, b, a ; } COLOR_F ;   /* 16 byte */
```

```c
typedef struct { uint8_t r, g, b, a ; } COLOR_U8 ; /* 4 byte */
```

**警告**: `COLOR_U8` は DxLib 内部では実際には **`b, g, r, a` の順でメモリに格納** される (BGRA バイト順。DirectX ARGB と互換)。この順序は `DxLib.h` の定義で確認済。`.mv1` 内の頂点色でもこの BGRA 順で書き出される。

### D.5 `VECTOR`

```c
typedef struct { float x, y, z ; } VECTOR ;   /* 12 byte */
```

### D.6 Endian / alignment

- 全て little-endian
- 構造体は通常 4 byte alignment、`DWORD Padding[]` で調整済
- 32bit / 64bit ビルド両対応 (struct 内の `DWORD` は pointer 型でも 4 byte を維持、load 時にポインタ化)

---

## 付録 E: リファレンス C パーサ (最小読み取り実装)

`.mv1` ファイルを開いて、モデルの主要情報 (頂点数 / 三角形数 / マテリアル数 / テクスチャパス) を標準出力する最小コード例。C99 移植性を重視し外部依存なし。

```c
/* mv1_dump.c - .mv1 ファイルの最小ダンパ */
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>

/* ---- DXA decode (付録 A の疑似コード実装) ---- */

static uint32_t rd_u32( const uint8_t *p ) {
    return ( uint32_t )p[ 0 ]
         | ( ( uint32_t )p[ 1 ] << 8 )
         | ( ( uint32_t )p[ 2 ] << 16 )
         | ( ( uint32_t )p[ 3 ] << 24 ) ;
}
static uint16_t rd_u16( const uint8_t *p ) {
    return ( uint16_t )p[ 0 ] | ( ( uint16_t )p[ 1 ] << 8 ) ;
}

static int dxa_decode( const uint8_t *src, size_t srcLen, uint8_t *dst, uint32_t *origSizeOut )
{
    if ( srcLen < 9 ) return -1 ;
    uint32_t origSize = rd_u32( src ) ;
    uint32_t compSize = rd_u32( src + 4 ) ;
    uint8_t  key      = src[ 8 ] ;
    if ( origSizeOut ) *origSizeOut = origSize ;
    if ( dst == NULL )   return 0 ;
    if ( srcLen < compSize ) return -1 ;

    const uint8_t *sp = src + 9 ;
    const uint8_t *spEnd = src + compSize ;
    uint8_t *dp = dst ;

    while ( sp < spEnd ) {
        if ( *sp != key ) { *dp++ = *sp++ ; continue ; }
        if ( sp[ 1 ] == key ) { *dp++ = key ; sp += 2 ; continue ; }

        uint8_t flags = sp[ 1 ] ;
        if ( flags > key ) flags-- ;
        sp += 2 ;

        uint32_t length = ( uint32_t )( flags >> 3 ) ;
        if ( flags & 0x04 ) { length |= ( uint32_t )( *sp++ ) << 5 ; }
        length += 4 ;

        uint32_t dist = 0 ;
        switch ( flags & 0x03 ) {
            case 0: dist = *sp++ ; break ;
            case 1: dist = rd_u16( sp ) ; sp += 2 ; break ;
            case 2: dist = rd_u16( sp ) | ( ( uint32_t )sp[ 2 ] << 16 ) ; sp += 3 ; break ;
        }
        dist += 1 ;

        if ( dist < length ) {
            uint32_t part = dist ;
            while ( length > part ) {
                memmove( dp, dp - part, part ) ;
                dp += part ; length -= part ; part += part ;
            }
            memmove( dp, dp - ( part / 2 ) - ( dist > part / 2 ? ( dist - part / 2 ) : 0 ), length ) ;
            dp += length ;
        } else {
            memmove( dp, dp - dist, length ) ;
            dp += length ;
        }
    }
    return 0 ;
}

/* ---- MV1 主要構造体 (read-only、padding は必要最小限まで無視) ---- */

#pragma pack(push, 4)
typedef struct { float r, g, b, a ; } COLOR_F ;

typedef struct {
    uint8_t CheckID[ 4 ] ;
    uint32_t Version ;
    int32_t  RightHandType ;
    int32_t  AutoCreateNormal ;
    int32_t  ChangeDrawMaterialTableSize ;
    int32_t  ChangeMatrixTableSize ;
    uint32_t ChangeDrawMaterialTable ;
    uint32_t ChangeMatrixTable ;
    int32_t  FrameNum ;
    uint32_t Frame ;
    int32_t  TopFrameNum ;
    uint32_t FirstTopFrame ;
    uint32_t LastTopFrame ;
    int32_t  FrameUseSkinBoneNum ;
    uint32_t FrameUseSkinBone ;
    int32_t  MaterialNum ;
    uint32_t Material ;
    int32_t  TextureNum ;
    uint32_t Texture ;
    int32_t  MeshNum ;
    uint32_t Mesh ;
    int32_t  LightNum ;
    uint32_t Light ;
    int32_t  SkinBoneNum ;
    uint32_t SkinBone ;
    int32_t  SkinBoneUseFrameNum ;
    uint32_t SkinBoneUseFrame ;
    int32_t  TriangleListNum ;
    uint32_t TriangleList ;
    uint32_t VertexData ;
    uint32_t VertexDataSize ;
    int32_t  TriangleListNormalPositionNum ;
    int32_t  TriangleListSkinPosition4BNum ;
    int32_t  TriangleListSkinPosition8BNum ;
    int32_t  TriangleListSkinPositionFREEBSize ;
    int32_t  MeshPositionSize ;
    int32_t  MeshNormalNum ;
    int32_t  MeshVertexSize ;
    int32_t  MeshFaceNum ;
    int32_t  MeshVertexIndexNum ;
    int32_t  TriangleListIndexNum ;
    int32_t  TriangleNum ;
    int32_t  TriangleListVertexNum ;
    int32_t  StringSize ;
    uint32_t StringBuffer ;
    /* 以降は省略可 (この demo では使わない) */
} MV1MODEL_FILEHEADER_F1 ;

typedef struct {
    uint32_t DimPrev, DimNext ;
    uint32_t Name ;
    int32_t  Index ;
    uint32_t ColorFilePath ;
    uint32_t AlphaFilePath ;
    int32_t  BumpImageFlag ;
    float    BumpImageNextPixelLength ;
    int32_t  AddressModeU ;
    int32_t  AddressModeV ;
    int32_t  FilterMode ;
    uint32_t UserData[ 2 ] ;
    uint8_t  Flag ;
    uint8_t  Padding1[ 3 ] ;
    float    ScaleU, ScaleV ;
    uint32_t Padding ;
} MV1_TEXTURE_F1 ;

typedef struct {
    uint32_t DimPrev, DimNext ;
    uint32_t Name ;
    int32_t  Index ;
    COLOR_F  Diffuse ;
    COLOR_F  Ambient ;
    COLOR_F  Specular ;
    COLOR_F  Emissive ;
    float    Power ;
    float    Alpha ;
    int32_t  DiffuseLayerNum ;
    struct { int32_t Texture ; int32_t BlendType ; uint32_t Padding[ 4 ] ; } DiffuseLayer[ 8 ] ;
    /* 以降省略 */
} MV1_MATERIAL_F1_HEAD ;
#pragma pack(pop)

/* ---- メイン ---- */

int main( int argc, char **argv ) {
    if ( argc != 2 ) { fprintf( stderr, "usage: %s file.mv1\n", argv[ 0 ] ) ; return 1 ; }

    FILE *fp = fopen( argv[ 1 ], "rb" ) ;
    if ( !fp ) { perror( argv[ 1 ] ) ; return 1 ; }
    fseek( fp, 0, SEEK_END ) ;
    size_t fileLen = ( size_t )ftell( fp ) ;
    fseek( fp, 0, SEEK_SET ) ;
    uint8_t *fileBuf = malloc( fileLen ) ;
    fread( fileBuf, 1, fileLen, fp ) ;
    fclose( fp ) ;

    if ( memcmp( fileBuf, "MV11", 4 ) != 0 ) {
        fprintf( stderr, "Not a MV11 file\n" ) ; return 1 ;
    }

    /* DXA 伸長 */
    uint32_t origSize = 0 ;
    dxa_decode( fileBuf + 4, fileLen - 4, NULL, &origSize ) ;
    uint8_t *base = malloc( origSize ) ;
    dxa_decode( fileBuf + 4, fileLen - 4, base, NULL ) ;
    free( fileBuf ) ;

    /* ルートヘッダ */
    MV1MODEL_FILEHEADER_F1 *h = ( MV1MODEL_FILEHEADER_F1 * )base ;

    printf( "=== MV1 Dump ===\n" ) ;
    printf( "Version:       %u\n", h->Version ) ;
    printf( "RightHand:     %s\n", h->RightHandType ? "yes" : "no" ) ;
    printf( "Frames:        %d\n", h->FrameNum ) ;
    printf( "Meshes:        %d\n", h->MeshNum ) ;
    printf( "Materials:     %d\n", h->MaterialNum ) ;
    printf( "Textures:      %d\n", h->TextureNum ) ;
    printf( "SkinBones:     %d\n", h->SkinBoneNum ) ;
    printf( "Triangles:     %d\n", h->TriangleNum ) ;
    printf( "TotalVertices: %d\n", h->TriangleListVertexNum ) ;
    printf( "StringPool:    %d bytes\n", h->StringSize ) ;

    /* テクスチャ一覧 */
    MV1_TEXTURE_F1 *tex = ( MV1_TEXTURE_F1 * )( base + h->Texture ) ;
    const char *strPool = ( const char * )( base + h->StringBuffer ) ;
    printf( "\n--- Textures ---\n" ) ;
    for ( int i = 0 ; i < h->TextureNum ; ++i ) {
        const char *name = tex[ i ].Name ? ( strPool + tex[ i ].Name ) : "(null)" ;
        const char *path = tex[ i ].ColorFilePath ? ( strPool + tex[ i ].ColorFilePath ) : "(null)" ;
        printf( "  [%d] name=%s  path=%s\n", i, name, path ) ;
    }

    /* マテリアル一覧 */
    printf( "\n--- Materials ---\n" ) ;
    MV1_MATERIAL_F1_HEAD *mat = ( MV1_MATERIAL_F1_HEAD * )( base + h->Material ) ;
    /* 注: MV1_MATERIAL_F1 の実サイズを調べて stride 計算が必要。このデモでは先頭のみ表示 */
    const char *mname = mat[ 0 ].Name ? ( strPool + mat[ 0 ].Name ) : "(null)" ;
    printf( "  [0] name=%s  Diffuse=(%.2f,%.2f,%.2f,%.2f)  DiffuseLayerNum=%d\n",
            mname,
            mat[ 0 ].Diffuse.r, mat[ 0 ].Diffuse.g, mat[ 0 ].Diffuse.b, mat[ 0 ].Diffuse.a,
            mat[ 0 ].DiffuseLayerNum ) ;

    free( base ) ;
    return 0 ;
}
```

### コンパイル例

```bash
gcc -O2 -std=c99 -o mv1_dump mv1_dump.c
./mv1_dump model.mv1
```

### 想定出力

```
=== MV1 Dump ===
Version:       1
RightHand:     yes
Frames:        42
Meshes:        8
Materials:     8
Textures:      5
SkinBones:     38
Triangles:     12480
TotalVertices: 38450
StringPool:    1024 bytes

--- Textures ---
  [0] name=body  path=textures/body.png
  [1] name=face  path=textures/face.png
  ...
```

### このコードの限界

- `MV1_MATERIAL_F1_HEAD` は先頭一致の部分定義。全フィールドを読むには `DxModelFile.h` の完全定義に合わせる。
- 頂点 / 三角形データの展開は本格的な実装を要する (可変長セクション B.1〜B.3 参照)。
- アニメーション読み取りは 16bit 圧縮デコードロジック (付録 C) が必要。
- `_pragma pack(4)` は MSVC / GCC / Clang で互換。他コンパイラは `__attribute__((packed))` に書き換え。

---

## 改訂履歴

| 日時 | 内容 |
|---|---|
| 2026-04-22 22:29 | 初版 (概観 + 主要構造体) |
| 2026-04-22 22:32 | 拡充版: DXA 圧縮仕様 + 全 enum 値 + 可変長 byte 図 + 16bit 圧縮式 + MATRIX 詳細 + リファレンス C パーサを追加 |
