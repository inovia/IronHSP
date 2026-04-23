# mv1conv: DxLib 経由 MV1 生成計画 (案 B: PMX 中間フォーマット経由)

## 経緯

### 2026-04-23 午前: 自作 writer 路線の行き詰まり
- cube / yukari_obj (static) は公式ビューア描画成功
- `Frame.Flag = MV1_FRAMEFLAG_VISIBLE (0x01)` 必須など 11 個の沼項目発見
- skin モデル (DxChara/Alicia/Yukari PMD) は描画されず (最大頂点座標 0)
- 根本原因: 公式は "1 frame に複数メッシュ集約"、自作 writer は "1 mesh = 1 frame"
- 自作 writer の品質保証は実質不可能と判断

### 2026-04-23 午後 (初期案 A): DxLib source 抽出方式
DxLibMake/ 全体を `mv1conv/dxlib_mv1/` にコピー → DX_NON_* で削る方針を検討。

しかし調査の結果、致命的な制約判明:
- `DX_NON_GRAPHICS` → 自動的に `DX_NON_MODEL` が定義される (DxCompileConfig.h L314-316)
- DxModel.cpp は DxGraphics.h の型定義依存 → Graphics を外せない
- さらに `MV1_MODEL_BASE` をプログラムから組み立てる public API が無い
- → 公開関数を private helper 呼び出しにパッチする必要あり (DxLib 本家コードに手を入れる)
- 工数 ~25h、しかも本家コードパッチで品質保証リスク

### 2026-04-23 決定 (案 B): PMX 中間フォーマット経由
既存の prebuilt DxLib static lib (`hsp3dx/extlib/dxlib_win/DxLib_VC/`) をそのまま流用:
```
各 importer → ModelIR → PMX バイト列 (メモリ) → MV1LoadModelFromMem → MV1SaveModelToMV1File → .mv1
```

#### 案 B の利点
- **DxLib 本家コードに一切手を入れない** (品質 100% 保証)
- 既存 `mv1_ref_gen` が既に DxLib lib リンク済 (依存追加ゼロ)
- PMX は skin/morph/bone/texture/physics 全サポート
- MMD コミュニティのドキュメントが豊富
- 既存の全 importer (glb/vrm/stl/wrl/gpb/obj/ply/fbx/pmd/pmx/...) 保持

#### 案 B のデメリット
- PMX writer を書く (~8h、spec は well-documented)
- UTF-16 little-endian の text field (対処必要だが自明)
- MV1 固有機能 (DxLib 独自マテリアル設定等) は PMX で表現できない → デフォルト値

## 新アーキテクチャ

### プロセス分離 (MSVC ランタイム制約)
DxLib は `/MT` (multithreaded static) 前提、assimp は `/MD` (multithreaded dll) デフォルト。
両方同一 exe にリンク不可 → 2 プロセス構成:

```
mv1conv.exe (/MD, assimp-linked)        mv1_dxlib_saver.exe (/MT, DxLib-linked)
├─ 各種 importer                         ├─ .pmx load (MV1LoadModelFromMem)
├─ IR 構築                                └─ MV1SaveModelToMV1File → .mv1
├─ ir_to_pmx.cpp → tempfile.pmx
└─ subprocess: mv1_dxlib_saver tempfile.pmx out.mv1
```

### 新規/変更ファイル

| ファイル | 状態 | 内容 |
|---|---|---|
| `src/ir_to_pmx.cpp` / `.hpp` | 新規 | IR → PMX バイト列エンコーダ |
| `test_ref/mv1_dxlib_saver.cpp` | 新規 | PMX→MV1 変換 helper exe (/MT) |
| `src/main.cpp` | 修正 | .mv1 出力時に ir→pmx→subprocess 呼び出しに変更 |
| `CMakeLists.txt` | 修正 | mv1_dxlib_saver target 追加 |
| `src/mv1_writer.cpp/hpp` | **削除** | 自作 writer 路線破棄 |
| `src/mv1_to_ir.cpp/hpp` | 削除 | 自前 MV1 reader も DxLib 側で代替可 |
| `src/mv1_reader.cpp/hpp` | 削除 | 同上 |
| `src/mv1_f1.hpp` | 削除 | 独自構造体不要 |
| `src/mv1_enums.hpp` | 削除 | 独自 enum 不要 |
| `src/dxa.cpp/hpp` | 削除 | DxLib 内蔵 DXA 使用 |
| 全 `*_import.cpp` | **保持** | glb/vrm/stl/wrl/gpb/obj/ply/pmx/pmd/... |
| `assimp_export.cpp` | 保持 | 逆変換 (.mv1 → .gltf 等) |

## PMX 2.0 フォーマット仕様 (要点のみ)

### ファイル構造
```
[Header]                    ← "PMX ", version(float), globals
[ModelInfo]                 ← name_jp, name_en, comment_jp, comment_en
[VertexList]                ← count + vertex data[]
[FaceList]                  ← count + indices[] (triangles)
[TextureList]               ← count + path[]
[MaterialList]              ← count + material[]
[BoneList]                  ← count + bone[]
[MorphList]                 ← count + morph[]
[DisplayFrameList]          ← UI 用、本プロジェクトは最小値
[RigidBodyList]             ← physics、空でも可
[JointList]                 ← physics、空でも可
[SoftBodyList]              ← 2.1 のみ、省略可
```

### Header (Globals 8 byte array)
```
[0] encoding:    0=UTF-16 LE, 1=UTF-8   → UTF-8 採用推奨
[1] add_uv_count: 0-4                   → 0
[2] vertex_idx:  1/2/4                  → count に応じ
[3] texture_idx: 1/2/4
[4] material_idx: 1/2/4
[5] bone_idx:    1/2/4
[6] morph_idx:   1/2/4
[7] rigid_idx:   1/2/4
```

### TextField (text 型)
```
i32 byte_length
u8[byte_length] utf8_bytes  (encoding=1 の場合)
```

### Vertex (weight_type に依存)
```
vec3 position
vec3 normal
vec2 uv
vec4 × add_uv_count  (省略)
u8 weight_type (0=BDEF1, 1=BDEF2, 2=BDEF4, 3=SDEF, 4=QDEF)
<weight data>
float edge_ratio
```

### Face
```
vertex_idx × 3 per triangle
```

### Bone
```
text name_jp
text name_en
vec3 position
bone_idx parent (-1=root)
i32 layer (default 0)
u16 flag
  bit 0x0001: 接続先=bone (not vec3)
  bit 0x0002: 回転可能
  bit 0x0004: 移動可能
  bit 0x0008: 表示
  bit 0x0010: 操作可
  bit 0x0020: IK
  ...
<conditional fields based on flag>
```

### 実装上の最適化
- 全頂点 BDEF1 (parent bone へ full weight) + skin の場合のみ BDEF4
- 全マテリアル 1 本: diffuse=白, specular=黒, ambient=黒
- morph は当面空 (将来 SHAPE 対応時に拡張)
- display frame は最小 (root bone 1 個)
- physics は空

## 工数試算 (案 B)

| フェーズ | 内容 | 見積 |
|---|---|---|
| 1. PMX spec 精読 | MMD wiki + 複数 open source impl 参照 | 1h |
| 2. ir_to_pmx.cpp 骨格 | Header/ModelInfo/Vertex/Face/Texture/Material | 3h |
| 3. Bone 対応 | hierarchy + IK 無視で十分 | 2h |
| 4. Skin weight 変換 | IR 4-weight → BDEF4 | 1h |
| 5. mv1_dxlib_saver.cpp | DxLib load/save の thin wrapper | 2h |
| 6. CMakeLists 拡張 | /MT 別 target、assimp との切り分け | 1h |
| 7. main.cpp 統合 | tempfile 書き出し + subprocess 呼び出し | 1h |
| 8. regression 実行 | cube/yukari_obj/DxChara/Alicia PMX 動作確認 | 2h |
| 9. 旧コード削除 | mv1_writer 一式 | 0.5h |
| **合計** | | **13.5h** (~2 営業日) |

## リスク / 留意事項

- **DxLib.lib の PMX loader 品質**: 既存 mv1_ref_gen でテスト可能 (.pmx を load できれば OK)
- **UTF-8 vs UTF-16**: PMX は両方対応、encoding byte で切り替え。UTF-8 採用でシンプル
- **Bone index 型**: 255 bones 超は u16、大規模モデルで注意 (現 Alicia 524 bones 対応済)
- **morph 非対応期**: 初期版は morph 省略 → SHAPE 情報は失われる
  - 後続改修で対応 (PMX morph section 追加)
- **DxLib /MT 制約**: subprocess 方式で回避 (既存 mv1_ref_gen と同パターン)
- **tempfile 管理**: Windows GetTempPath + PID + random suffix で競合回避

## 実行順序

1. **PMX spec 確認**: reference 実装を 2-3 件参照 (Blender MMD addon / pmx.js 等)
2. **minimum viable PMX**: cube (static, 1 material, 1 frame) を emit
3. **mv1_dxlib_saver PoC**: cube.pmx → cube.mv1 → 公式ビューア描画確認
4. **skin 対応**: Alicia PMX 経由で skin 動作確認 (そもそも入力が .pmx なので pass-through 相当)
5. **bone + weight**: glTF/FBX からの skin を PMX 経由で .mv1 化
6. **morph**: 必要に応じ後続で追加

## 関連

- DxLib public API: `MV1LoadModelFromMem` ([DxLib.h:5167](../../../hsp3dx/dxlib_angle_sdl2/extlib/DxLibMake/DxLib.h#L5167))
- 既存 DxLib-linked helper: `test_ref/ref_gen.cpp` (CMakeLists L82-96)
- PMX 仕様参考: MMD wiki / Blender MMD Tools / three-pmx-parser
