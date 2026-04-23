# mv1conv

DxLib `.mv1` ファイル形式の reader / writer / converter。
仕様書 [`docs/mv1_file_format.md`](../../docs/mv1_file_format.md) の validator も兼ねる。

## 概要

- `.mv1` ↔ 任意フォーマット (OBJ/STL/PLY/X/GLB/GLTF/VRM/WRL/PMD/PMX/GPB/FBX/DAE/3DS/USDZ 等) の相互変換
- skin mesh、blend shape (morph)、animation、physics、toon、VRM 拡張対応
- VMD (MMD motion) の attach
- DxLib 3.24f で load 可能な互換フォーマット生成 (16/16 検証済)

## ビルド

```sh
cmake -B build -G "Visual Studio 17 2022" -A x64
cmake --build build --config Release --parallel 8
```

出力: `build/Release/mv1conv.exe` (約 6 MB、assimp + exporter 組込)

### assimp 無効化 (軽量版)

```sh
cmake -B build -DMV1CONV_USE_ASSIMP=OFF
```

→ FBX/DAE/3DS/USDZ/VRM extensions 非対応の代わりに本体 500 KB 未満、
初回ビルド数秒。組込 loader (OBJ/STL/PLY/X ASCII/GLB 最小/WRL 2.0/PMD/PMX/GPB) は残る。

## 使い方

```sh
# 任意フォーマット → .mv1
mv1conv convert model.pmx out.mv1
mv1conv convert character.fbx out.mv1 --no-bones   # bones 除去
mv1conv convert in.obj out.mv1                      # obj + mtl (同dir の PNG 自動コピー)

# .mv1 → 他フォーマット
mv1conv export in.mv1 out.glb                       # assimp Exporter 経由
mv1conv export in.mv1 out.fbx

# VMD モーションを付与
mv1conv attach-anim character.mv1 motion.vmd out.mv1

# 複数ファイル一括
mv1conv batch -o outdir/ file1.fbx file2.pmx file3.glb

# 内部構造表示
mv1conv dump file.mv1
mv1conv decode file.mv1 out.bin    # DXA 展開後の生バッファ出力 (debug)
mv1conv repack file.mv1 out.mv1    # DXA 再圧縮 round-trip テスト

# help
mv1conv --help
```

### 環境変数

| 変数 | 効果 |
|------|------|
| `MV1CONV_NO_COPY_TEX=1` | texture 自動コピーを無効化 |
| `MV1CONV_VIA_BLENDER=1` | FBX 失敗時に Blender 経由で .glb 変換 fallback |
| `MV1CONV_BLENDER=/path` | Blender 実行ファイル明示 |
| `MV1CONV_VRM_MMD_NAMES=1` | VRM humanoid bone を MMD 日本語名に変換 (VMD 互換用) |
| `MV1CONV_X_USE_BUILTIN=1` | `.x` を組込 loader で (デフォルト: assimp) |
| `MV1CONV_NO_TEX=1` | texture 全削除 (debug) |
| `MV1CONV_NO_UV=1` | UV 全削除 (debug) |
| `MV1CONV_ONLY_MESH=N` | mesh #N のみ残す |
| `MV1CONV_FIRST_N=N` | 先頭 N meshes のみ残す |

## 対応状況

### MV1 Reader/Writer

| 機能 | Reader (mv1→IR) | Writer (IR→mv1) |
|------|:---:|:---:|
| Header / Frame / Mesh / Material / Texture / TriangleList | ✓ | ✓ |
| DXA compression (LZSS + 自己参照) | ✓ | ✓ (greedy) |
| Static mesh | ✓ | ✓ |
| Skin bone + weight | ✓ | ✓ |
| **Animation** (AnimSet / Anim / AnimKeySet) | ✓ (raw_blob passthrough) | ✓ (simple layout + raw passthrough) |
| **Morph / Shape** (blend shape) | ✓ | ✓ |
| **Physics** (rigid body + joint) | ✓ | ✓ |
| **Toon** (MV1_MATERIAL_TOON_F1) | ✓ | ✓ |
| Material layers (diffuse/specular/normal/emissive) | ✓ | ✓ |

### 入力フォーマット

| 形式 | 対応 |
|------|------|
| OBJ + MTL | ✓ built-in (Kd/Ka/Ks/Ke/Ns/d/map_Kd) |
| STL (ASCII + Binary) | ✓ built-in |
| PLY (ASCII + binary_little_endian) | ✓ built-in |
| X (DirectX ASCII) | ✓ built-in / binary は assimp 経由 |
| GLB / GLTF | ✓ built-in (minimal) + assimp (embedded texture 抽出) |
| VRM | ✓ glTF base + 拡張 (humanoid rename / MToon / SpringBone) |
| WRL (VRML 2.0) | ✓ built-in |
| PMD | ✓ built-in (静的、Shift-JIS) |
| PMX 2.0/2.1 | ✓ built-in (スキン / モーフ / 物理) |
| GPB (gameplay) | ✓ built-in (hgimg4/pronama3d 全サンプル) |
| FBX 2011+ | ✓ assimp (古い FBX は Autodesk FBX Converter 2013 要) |
| DAE (Collada) / 3DS / 3MF / Blend / USDZ / 他 40+ | ✓ assimp |
| VMD | ✓ built-in (attach-anim で付与) |
| MV1 | ✓ built-in (round-trip) |

### 出力フォーマット (assimp Exporter 経由)

| 形式 | 対応 |
|------|------|
| OBJ | ✓ |
| GLTF 2.0 / GLB | ✓ |
| DAE (Collada) | ✓ |
| PLY | ✓ |
| STL | ✓ |
| FBX | ✓ |

※ 逆変換では geometry + material のみ。bone/anim は未移植 (assimp Exporter 側で大幅なコード追加要)。

### VRM 拡張

| 項目 | 対応 |
|------|------|
| humanoid bone rename (0.x / 1.0) | ✓ |
| humanoid → MMD 日本語名マッピング | ✓ (`MV1CONV_VRM_MMD_NAMES=1`) |
| MToon (0.x materialProperties) | ✓ outline width/color |
| MToon (1.0 VRMC_materials_mtoon) | ✓ outlineWidth/Color |
| SpringBone (1.0 VRMC_springBone) | 部分的 (joint 各 node を RigidBody + Joint 化) |

## テスト

```sh
bash tests/roundtrip.sh
```

## reader 実装で見つかった spec バグ

| # | 旧 spec | 実装/検証結果 | 対応 |
|---|---|---|---|
| 1 | `Version = 1` | 実ファイルは `Version = 0` | spec 訂正 |
| 2 | 伸長データ先頭が `MV1MODEL_FILEHEADER_F1` | `FHeader+4` に展開 (CheckID 別扱い) | spec 訂正 |
| 3 | ヘッダ 128 byte | 実 304 byte 固定 | spec 訂正 |
| 4 | `MV1_TEXTURE_F1` サイズ記載なし | 68 byte | static_assert 追加 |
| 5 | 文字列プール offset = 0 valid | 0 = null 便宜 | reader 側で 0 を null 判定 |

## Writer の落とし穴

自作 writer で踏む罠は [docs/mv1_file_format.md の Writer の落とし穴章](../../docs/mv1_file_format.md#writer-の落とし穴) にまとめ済み。主要:

- **`ChangeMatrixTable` / `ChangeDrawMaterialTable` を 0 にしてはいけない** (256B zeroed buffer 推奨)
- **Skin 時 `TriangleListSkinPosition4BNum` = per-corner 合計、`TriangleListNormalPositionNum` = 0**
- **`MeshPositionSize = PositionNum × (skin?44:12)`** (MaxBoneBlendNum 依存)
- **`NON_TOON_OUTLINE` フラグ立てたら `VertexNum` ビット分のデータを書く**
- **Frame 階層**: static は top-level 兄弟、skin は root + children
- **AnimKeySet.KeyData は FHeader 絶対 offset** (blob-relative ではない)

## 構造

```
src/
├── dxa.{hpp,cpp}         DXA LZSS デコーダ + greedy encoder
├── mv1_f1.hpp            *_F1 struct + static_assert
├── mv1_ir.hpp            中間表現 (ModelIR / MeshIR / MaterialIR / BoneIR /
│                          AnimKeySetIR / AnimIR / AnimSetIR / ShapeIR /
│                          PhysicsRigidBodyIR / PhysicsJointIR)
├── mv1_reader.{hpp,cpp}  Mv1File: バイト単位アクセサ
├── mv1_to_ir.{hpp,cpp}   .mv1 → ModelIR (逆写像)
├── mv1_writer.{hpp,cpp}  ModelIR → .mv1
├── mv1_dump.{hpp,cpp}    debug 出力
├── obj_*.{hpp,cpp}       OBJ import/export
├── stl_import.*, ply_import.*, x_import.*, pmd_import.*, pmx_import.*
├── glb_import.*, wrl_import.*, gpb_import.*
├── vmd_import.*          MMD motion
├── vrm_import.*          VRM 拡張 (humanoid / MToon / SpringBone)
├── assimp_import.{hpp,cpp}  FBX/DAE/3DS/USDZ 等 via assimp
├── assimp_export.{hpp,cpp}  MV1 → FBX/GLB/DAE 等 via assimp Exporter
└── main.cpp              CLI
```
