# 実 DxLib load 検証用 .mv1 ファイル

mv1conv で 5 種類の入力フォーマットから生成した .mv1。
DxLib 本家ランタイムでのロード + 描画が validator となる。

## 生成経路

| ファイル | 入力 | 三角形数 | ボーン | 備考 |
|---|---|---|---|---|
| duck_from_gpb.mv1     | GamePlay `.gpb` (hgimg4 サンプル)     | 4210  | 0  | 静的メッシュ |
| cube_from_usdz.mv1    | Pixar USD `.usdz` (tinyusdz test)     | 12    | 0  | 静的メッシュ |
| cat_from_usdz.mv1     | Pixar USD `.usdz` (tinyusdz test)     | 18    | 0  | 静的 + テクスチャ |
| alicia_from_pmx.mv1   | MikuMikuDance `.pmx` (assimp test)    | 8672  | 1  | 7 マテリアル + 1 bone (刃物モデル) |
| skeleton_from_fbx.mv1 | Autodesk `.fbx` (assimp test)         | 2112  | 21 | **スキンメッシュ + ボーン階層** |

## 検証方法

### A. DxLibModelViewer (GUI)

```
hsp3dx/extlib/dxlib_android/DxLib_Android/Tool/DxLibModelViewer/DxLibModelViewer_64bit.exe
```

を起動し、ドラッグ&ドロップで `.mv1` を開く。

- ✅ モデルが 3D 空間で表示される → writer 正常
- ❌ エラーダイアログ / 真っ黒 → writer のデータに DxLib 拒否部分あり

### B. hsp3dx HSP スクリプト

```hsp
; verify.hsp (hsp3dx runtime で実行)
#include "iron_dxlib.as"
ChangeWindowMode 1
DxLib_Init

handle = MV1LoadModel("duck_from_gpb.mv1")
if handle < 0 : logmes "FAIL": DxLib_End: end

logmes "OK handle=" + handle
WaitKey
DxLib_End
end
```

### C. 最小 C++ + DxLibMake 静的リンク (fully headless)

`tools/mv1conv/verify_cpp/` に簡易テストを追加予定。

## 既知の制約

- mv1conv の現在の writer は:
  - FrameNum = 1 (static) or 1 + ボーン数 (skin)
  - 全 mesh は Frame[0] を container とする (mesh ごとに別 frame には分けない)
  - VertexType = NORMAL (static) or SKIN_4BONE (skin)
  - インデックス型 = U32 固定 (観測値と異なる場合あり)
  - MaxBoneBlendNum = 4
  - DXA 圧縮 = greedy LZSS (DxLib オリジナルと同等圧縮率)

DxLib 側がロード失敗する場合は、mv1conv の `dump` で構造を吐き出して
元の DxLib サンプルと比較するのが一番早いデバッグ手段。
