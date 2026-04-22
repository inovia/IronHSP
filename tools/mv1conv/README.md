# mv1conv

DxLib `.mv1` ファイル形式の reader / (将来の) writer / converter。
仕様書 [`docs/mv1_file_format.md`](../../docs/mv1_file_format.md) の validator も兼ねる。

## 目的

- STL / OBJ+MTL / PLY / 3MF / VRML / X / GLB/GLTF / VRM / FBX / USD/USDZ / GPB → `.mv1` 一括コンバータを C++20 で実装する長期計画の Phase 1。
- Reader を先行実装して spec のギャップを洗い出す (writer は spec が reader で完全検証できてから着手)。

## ビルド

```sh
cmake -B build -G "Visual Studio 17 2022" -A x64
cmake --build build --config Release
```

出力: `build/Release/mv1conv.exe`

## 使い方

```sh
mv1conv dump   path/to/file.mv1             # ヘッダ / Textures / Materials / TriangleLists を dump
mv1conv decode path/to/file.mv1 out.bin     # DXA 展開済みの生バッファを out.bin に書き出し
```

## 検証済サンプル

`samples/` に置いた DxLib 3.24f 同梱 `.mv1` を全て reader で通過:

- `SimpleModel.mv1` — 5 frame / 4 material / 3 texture / 5 mesh / 632 triangle
- `SimpleModelVertexColor.mv1` — 頂点色、テクスチャなし
- `SimplePillarStage.mv1` — 静的ステージ 1 mesh / 2 material
- `ColTestStage.mv1` — 衝突テストステージ 5 mesh
- `DxChara.mv1` — 25 ボーンスキンメッシュ + 9 アニメセット / 225 アニメ

## reader 実装で見つかった spec バグ

| # | 旧 spec | 実装/検証結果 | 対応 |
|---|---|---|---|
| 1 | `Version = 1` | 実ファイルは `Version = 0` (`DxModel.cpp` L18028: `FHeader->Version = 0`) | spec 訂正 |
| 2 | 「DXA 伸長データの先頭に `MV1MODEL_FILEHEADER_F1` が置かれる」 | 実際は `FHeader+4` に展開 — `CheckID[4]` はファイル magic を流用し DXA ブロックには含まれない | spec 訂正、reader は decode 結果の先頭に `"MV11"` 4 byte を自前で補完 |
| 3 | 「ヘッダは 128 byte 程度」 | 実際は 304 byte 固定 | spec 訂正、`static_assert` で固定 |
| 4 | `MV1_TEXTURE_F1` サイズ記載なし | 68 byte (ScaleU/V + Padding 込み) | `static_assert` 追加 |
| 5 | 「文字列プール offset = 0 は valid な先頭文字列」 | 0 = null 便宜 (Name=0 を「名前なし」扱いにしないと AlphaFilePath が誤って先頭文字列を指す) | reader 側で 0 を null 判定 |

## 構造

```
src/
├── dxa.{hpp,cpp}         DXA LZSS 派生デコーダ (自己参照コピー対応)
├── mv1_f1.hpp            *_F1 構造体 + static_assert (MVP: 5 型)
├── mv1_reader.{hpp,cpp}  Mv1File: .mv1 → バッファ + 各種 at<T>(offset) アクセサ
├── mv1_dump.{hpp,cpp}    Header / Textures / Materials / TriangleLists の人間向け出力
└── main.cpp              CLI: dump / decode
```

## 次のステップ

- Reader 拡張: `MV1_FRAME_F1` (階層) / `MV1_MESH_F1` (頂点データ) / `MV1_SKIN_BONE_F1` / Anim / Shape
- 入力側パーサ (assimp / ufbx / tinyusdz)
- DXA Encoder + MV1 Writer
- Round-trip 検証 (load → save → load → byte compare)
