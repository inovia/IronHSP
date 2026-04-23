# mv1conv: DxLib MV1 サブセット抽出計画

## 背景

現在の mv1conv は独自 writer で .mv1 を出力しているが、
DxLib 公式ビューア (DxLibModelViewer_64bit) との互換性で深刻な沼にハマった。

### 本セッション (2026-04-23) で判明した要対応項目
1. `ChangeMatrixTable` / `ChangeDrawMaterialTable` サイズ + bit pattern
2. `Frame.Flag = MV1_FRAMEFLAG_VISIBLE (0x01)` **必須** (これが無いと不可視)
3. `Mesh.UseVertexDiffuseColor = 1` 必須
4. `Mesh.ChangeInfo` (Target/CheckBit/Size/Fill) 各値
5. `TriangleList.UseBone[54]` 固定上限 + top-weight 選定
6. index 型 U8/U16/U32 と VertFlag ビットの厳密整合
7. skin モデルは **1 frame に多メッシュ集約** (未対応、現 writer は 1 mesh = 1 frame)
8. Shape セクションの `TargetMeshVertexNum` / `SkinPosition4BNum` 集計
9. per-corner vs per-unique-vertex の使い分け
10. Outline bits 反転意味論 (0 = 有効、1 = 無効)
11. Specular color = `0x00000000` 固定

### 達成状況 (2026-04-23 時点)
- **cube (static)**: 公式ビューアで表示 (ただし normal smooth のため shading 違和感)
- **Yukari obj (static)**: 表示されるが normal / texture パスで見た目破損
- **skin モデル全般** (DxChara/Alicia/Yukari PMD): 表示されず。
  最大頂点座標が 0 になる (skin matrix 計算の結果全頂点が原点収束)

## 方針

**DxLib 本家の MV1 ロード/セーブ処理を抽出して流用する。**

現 writer は破棄。以下のパイプラインに置き換え:
```
.glb/.vrm/.stl/.wrl/.gpb/.obj/.ply/.pmx/.pmd/.fbx/.dae
        ↓  (既存の importer 群 ~ 保持)
    ModelIR (既存)
        ↓  (新規: ir_to_dxlib.cpp)
    DxLib 内部構造 (MV1_MODEL_BASE / MV1_FRAME_BASE 等) の populate
        ↓  (DxLib 本家 API)
    MV1SaveModelToMV1File
        ↓
    .mv1 (公式互換完全保証)
```

## 抽出対象ファイル

### 必須コア (DxLib 3.24f / `hsp3dx/dxlib_angle_sdl2/extlib/DxLibMake/` より)
| ファイル | 行数 | 役割 |
|---|---|---|
| DxModel.cpp | ~34,000 | モデル管理コア (load + save + runtime 操作) |
| DxModelRead.cpp | ~8,000 | 各フォーマット dispatch |
| DxModelLoader0.cpp | ~4,400 | .mv1 reader (DXA 展開含む) |
| DxModelLoader1.cpp | ~2,400 | .x reader (DirectX retained mode) |
| DxModelLoader2.cpp | ~1,800 | .pmd reader (MMD) |
| DxModelLoader3.cpp | ~3,400 | .pmx reader (MMD 新版) |
| DxModelLoader4.cpp | ~4,200 | .mqo reader (Metasequoia) |
| DxModelLoaderVMD.cpp | ~1,200 | .vmd (MMD motion) |
| DxMath.cpp | ~8,000 | 行列/ベクトル/クォータニオン数学 |
| DxChar.cpp | ~9,500 | SJIS/UTF-8 文字コード変換 |
| DxCharCodeTable.cpp | ~大 | 文字コードテーブル (DxChar 依存) |
| DxBaseFunc.cpp | 約 | DxLib 基本ユーティリティ |
| DxFile.cpp | 中 | ファイル I/O 抽象化 |
| DxMemory.cpp | 小 | DXALLOC/DXFREE (カスタムアロケータ) |
| DxHandle.cpp | 小 | ハンドル管理 |
| DxArchive_.cpp | 中 | DXA アーカイブ展開 |
| DxLog.cpp | 小 | ログ出力 (stub 可能) |
| DxBaseImage.cpp 一部 | | テクスチャ読込 (MV1 から呼ばれるもののみ) |

### スタブ化対象 (empty / no-op 実装)
| ファイル | 理由 |
|---|---|
| DxGraphics.cpp | 描画 API (Direct3D 依存) - MV1 load/save には不要 |
| DxGraphicsFilter.cpp | 画像フィルタ |
| DxMask.cpp | マスク機能 |
| DxMovie.cpp | 動画再生 |
| DxSound.cpp | サウンド |
| DxSoundConvert.cpp | サウンド変換 |
| DxInput.cpp | 入力 |
| DxInputString.cpp | 文字入力 |
| DxNetwork.cpp | ネットワーク |
| DxFont.cpp | フォント |
| DxUseCLib.cpp | 各種 C ライブラリ wrapper |
| DxLive2DCubism4.cpp | Live2D |
| DxUseCLibPhysics.cpp | Bullet 物理 |

DX_NON_* フラグで無効化できるものは DxCompileConfig.h で一括指定。

### 推奨 DxCompileConfig.h 設定 (MV1 サブセット向け)
```cpp
#define DX_PLATFORM_HEADLESS_MV1ONLY  // 新規プラットフォーム分岐

#define DX_NON_GRAPHICS
#define DX_NON_2DDRAW
#define DX_NON_DIRECT3D9
#define DX_NON_DIRECT3D11
#define DX_NON_DSHOW_MP3
#define DX_NON_DSHOW_MOVIE
#define DX_NON_MEDIA_FOUNDATION
#define DX_NON_MOVIE
#define DX_NON_SOUND
#define DX_NON_ACM
#define DX_NON_OGGVORBIS
#define DX_NON_OGGTHEORA
#define DX_NON_OPUS
#define DX_NON_BEEP
#define DX_NON_INPUT
#define DX_NON_INPUTSTRING
#define DX_NON_KEYEX
#define DX_NON_NETWORK
#define DX_NON_FONT
#define DX_NON_MASK
#define DX_NON_FILTER
#define DX_NON_NORMAL_DRAW_SHADER
#define DX_NON_LIVE2D_CUBISM4
#define DX_NON_BULLET_PHYSICS  // (MV1 内部 physics は別フラグ)
#define DX_NON_ASYNCLOAD
#define DX_NON_STOPTASKSWITCH
#define DX_NON_SAVEFUNCTION
#define DX_NON_PRINTF_DX
#define DX_NON_LOG             // (または必要なら有効)
#define DX_NON_SOFTIMAGE
#define DX_NON_INLINE_ASM

// ※ DX_NON_MODEL は当然 **有効化しない** (MV1 本体)
// ※ DXA は必要 (mv1 ファイル圧縮)
```

## 新規実装

### `mv1conv/src/ir_to_dxlib.cpp` (新規)
ModelIR から DxLib 内部構造を populate する関数群:

```cpp
// 新規 API
int ir_to_dxlib_model(const ModelIR &ir);  // → MV1 model handle (-1 on error)

// 内部で使用する DxLib 内部 API 例:
// MV1_MODEL_BASE* CreateEmptyModelBase(...);
// AddFrame(MV1_MODEL_BASE*, name, parent, translate, rotate, scale);
// AddMesh(MV1_MODEL_BASE*, frame, material);
// SetMeshVertexPosition(MV1_MODEL_BASE*, mesh, vertex_idx, position);
// SetMeshVertexNormal / TexCoord / BoneWeight ...
// AddSkinBone(MV1_MODEL_BASE*, frame, inv_bind_matrix);
// ... 等
```

**注意**: DxLib の公開 API は "ファイルから読む" が主で、プログラムから組み立てる API は
限定的。内部 `MV1_MODEL_BASE` を直接操作する private 関数を呼ぶ必要があるため、
DxModel.cpp 内の build helper を public にするパッチが必要。

### 代替案: 中間フォーマット経由
DxLib API 組み立てが難しい場合、中間フォーマット (`.x` 等) を emit して
MV1LoadModel 経由で読ませる:
```
IR → [write as .x in memory] → DxLib MV1LoadFromMem → MV1SaveModelToMV1File
```
`.x` はテキスト・単純構造で書きやすい。ただし skin weight や morph に制限。

## 旧コード削除

以下を破棄 (→ git で保持、別 branch 等に退避):
- `src/mv1_writer.cpp` / `.hpp`
- `src/mv1_to_ir.cpp` / `.hpp` (DxLib MV1LoadModel + MV1Get* で置換)
- `src/mv1_reader.cpp` / `.hpp` (必要なら DxLib API で代用)
- `src/mv1_f1.hpp` (DxLib が struct 提供)
- `src/mv1_enums.hpp` (DxLib が提供)
- `src/dxa.cpp` / `.hpp` (DxLib 内 DxArchive_ に置換)

保持:
- 全 `*_import.cpp` (glb/vrm/stl/wrl/gpb/obj/ply/pmx/pmd/...)
- `assimp_import.cpp` / `assimp_export.cpp`
- `main.cpp` (引数 parse と dispatch)
- `mv1_dump.cpp` (デバッグ用、DxLib API で再実装)

## 工数試算

| フェーズ | 内容 | 見積 |
|---|---|---|
| 1. ファイル抽出 | DxLib .cpp/.h を mv1conv/dxlib_mv1/ にコピー | 2h |
| 2. DX_NON_* 設定 | DxCompileConfig.h カスタマイズ、HEADLESS 分岐 | 1h |
| 3. stub 実装 | 非 MV1 subsystem の empty impl | 4h |
| 4. ビルド通し | link 通るまで stub 拡張を繰り返す | 4h |
| 5. API 露出 | MV1_MODEL_BASE 直接操作の関数群を public に | 3h |
| 6. ir_to_dxlib | 新規コンバータ実装 | 4h |
| 7. 既存統合 | main.cpp の save 経路を切替 | 2h |
| 8. 旧コード削除 | mv1_writer 等削除、依存整理 | 2h |
| 9. regression 再構築 | 公式ビューアで全 24 + Alicia/Yukari の表示確認 | 3h |
| **合計** | | **25h** (~3 営業日) |

## 実行順序

1. **ブランチ切る**: `git checkout -b mv1conv-dxlib-extract`
2. **scaffold**: `tools/mv1conv/dxlib_mv1/` にファイル置き場作成
3. **最小コンパイル PoC**: DxModel.cpp 一枚だけ link させてみる (依存発見)
4. **段階的 stub 追加**: リンクエラーを 1 個ずつ潰す
5. **MV1LoadModel で読み込みテスト**: 既存 DxChara.mv1 を load → 成功確認
6. **MV1SaveModelToMV1File で保存テスト**: load → save で round-trip 成功確認
7. **ir_to_dxlib 実装**: ここで初めて書き込み経路完成
8. **main.cpp 切替**: 新経路で全 importer 動作確認
9. **規定テスト + 公式ビューア**: cube/Yukari/Alicia/DxChara 全て描画確認

## リスク / 留意事項

- **DxLib ソース規模**: DxModel.cpp だけで 34K 行。依存深いかも
- **private API アクセス**: MV1_MODEL_BASE 直接操作のためパッチ必要
- **DXA 依存**: mv1 save 時に DXA 圧縮する。DxArchive_.cpp が必要
- **Bullet physics**: MV1 の physics 情報 (PMX 由来) を save したい場合 bullet が必要
  かも。とりあえず DX_NON_BULLET_PHYSICS で外して後回し
- **character encoding**: model name に日本語。SJIS/UTF-8 変換コードが要るため DxChar.cpp 必須
- **font texture**: DX_NON_FONT は行けそうだがモデル名表示に関わる code が残る可能性
- **既存 regression**: 24 シナリオの load_check は DxLib 本家使用 → そのまま流用可。
  逆エクスポート (`export .mv1 → .gltf 等`) は assimp_export 経由で引き続き使用
