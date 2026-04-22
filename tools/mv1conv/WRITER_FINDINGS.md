# Writer DxLib 互換性の調査結果 (2026-04-22)

## 現状

mv1conv writer は我々の Reader では round-trip 通るが、**DxLib ロード時に
全 0/8 が正常動作せず** (crash または handle は返るが描画されない)。

## 根本原因: Frame 構造が DxLib 慣習と違う

### DxLib の慣習 (SimpleModel.mv1 観測)

```
Frame[0] ""         mesh=1 (main body) pos=242 nrm=242 PandN=0x1800
Frame[1] "円柱"     mesh=1              pos=34  nrm=66  PandN=0x2648
Frame[2] "子円柱"   mesh=1              pos=34  nrm=66  PandN=0x2980  parent=Frame[1]
Frame[3] "立方体"   mesh=1              pos=8   nrm=24  PandN=0x2CB8  parent=Frame[0]
Frame[4] "子立方体" mesh=1              pos=8   nrm=24  PandN=??      parent=Frame[3]

Mesh[0].Container = Frame[0]
Mesh[1].Container = Frame[1]
...
Mesh[4].Container = Frame[4]
```

**1 frame = 1 mesh の原則**。各 frame が独自の PandN (position + normal blob)
を持ち、親子階層で構造化される。

### 我々の writer が生成している構造

```
Frame[0] "root"  mesh=N (全メッシュ)  PandN=0x... (全データ融合)
Mesh[0..N-1].Container = Frame[0]  ← 全メッシュが同じ container!
```

全メッシュが Frame[0] に集約され、PandN が 1 つしかない。DxLib はこの
構造を想定しておらず、描画パイプラインが頂点データを引けずに crash。

## VertexData 配置の誤解

旧 mv1conv は `Mesh.VertexData` を per-mesh 独立 blob と解釈していたが、
DxLib 側 (`DxModel.cpp` L6740〜) は **単一 VertexData 巨大 blob** に以下の
配列が固定順で詰まっていることを想定する:

```
1. TriangleListNormalPosition[N]  (MV1_TLIST_NORMAL_POS)
2. TriangleListSkinPosition4B[N]  (MV1_TLIST_SKIN_POS_4B)
3. TriangleListSkinPosition8B[N]
4. TriangleListSkinPositionFREEB (bytes)
5. MeshVertexIndex[N]  (DWORD)
6. MeshFace[N]         (MV1_MESH_FACE)
7. MeshNormal[N]       (MV1_MESH_NORMAL)
8. MeshPosition (bytes = MeshPositionSize)  ← Frame.PositionAndNormalData はここを指す
9. MeshVertex (bytes = MeshVertexSize)      ← Mesh.VertexData はここを指す
```

Loader は `FHeader->VertexData` から開始して各配列を counts で進めて
ポインタを再構築する。つまり **配列のサイズを Header で正確に指定し、
VertexData blob 内に fixed order で配置** する必要がある。

## 次セッションで修正すべき Writer 構造 (推定 2-3 日作業)

### 1. Frame 構造を 1-frame-per-mesh に変更

- Frame[0] = root (name="", mesh=first mesh's index)
- Frame[1..N-1] = each subsequent mesh's frame (parent=Frame[0] or hierarchy)
- 各 frame に自前の PositionAndNormalData オフセット
- 各 frame に自前の PositionNum / NormalNum / VertexNum / TriangleNum

### 2. VertexData blob を DxLib 形式で組み立て

固定順序で結合:
```
for each triangle_list: TriangleListNormalPosition[]   ← 未実装 (まず重要)
for each triangle_list: TriangleListSkin4B/8B/FREEB   ← スキン用
MeshVertexIndex[] の連結
MeshFace[] の連結
MeshNormal[] の連結
MeshPosition (bytes) の連結
MeshVertex (bytes) の連結
```

各 Mesh.VertexData / Frame.PositionAndNormalData を **この blob 内の
対応するオフセット** に設定する。

### 3. MV1_TLIST_NORMAL_POS / MV1_MESH_FACE / MV1_MESH_NORMAL / MV1_MESH_POSITION
/ MV1_MESH_VERTEX の実サイズを確認し、正しくレイアウト

`DxModel.h` にこれらの構造体定義あり。まず sizeof() を確認して writer に
反映。

### 4. ChangeMatrixTable / ChangeDrawMaterialTable

現在 empty を書いているが、DxLib は `MV1_CHANGE_F1.Target` がこの
table 内の offset を指すことを想定。サイズ ChangeMatrixTableSize も header
で正しくセットすべき。

## 現時点の Writer 実用範囲

**0/8 DxLib 互換** — つまり全く実用にならない。

Reader のみ実用段階:
- 5/5 DxLib サンプル byte-identical round-trip
- 10 形式 (obj/stl/ply/x/glb/wrl/pmd/pmx/gpb + assimp 40+ + USD) 全部 IR 抽出成功

## 参考: 関連ソース位置

- Save path: `DxModel.cpp` L17739-L20100 (`MV1SaveModelToMV1File_WCHAR_T`)
- Load path: `DxModel.cpp` L6680-L7200 (`LoadBaseFileFromFHeader` 相当)
- Header assembly: L18022-18200 (TempBufferUseSize で offset 連鎖)
- VertexBuffer assembly: L18329-18500 (`F1Frame->PositionAndNormalData = VertexDataSize`)
- Struct sizes: `DxModelFile.h`
- Runtime struct layout: `DxModel.h`
