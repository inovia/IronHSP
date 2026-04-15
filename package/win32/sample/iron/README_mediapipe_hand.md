# sample_mediapipe_hand.hsp

MediaPipe の palm detection を HSP から動かすサンプルです。
hsptflite.dll (Tensorflow Lite C API ラッパ) + iron_mediapipe.hsp を
使って、画像から手のバウンディングボックスを検出します。

## 必要なもの

### ランタイム DLL

- `hsptflite.dll` (Win32) または `hsptflite_64.dll` (x64)
- `tensorflowlite_c.dll` (Google 公式 prebuilt)

いずれも HSP ランタイムと同じディレクトリに配置してください。
tensorflowlite_c.dll の入手方法は
`plugins/win32/hsptflite/third_party/tflite/README.md` を参照。

### モデル

MediaPipe の `.task` ファイルは ZIP バンドルで、中身に複数の
`.tflite` モデルが入っています。以下の手順で `palm_detection.tflite`
を取り出してください。

1. MediaPipe Hand Landmarker のモデルをダウンロード:

   https://storage.googleapis.com/mediapipe-models/hand_landmarker/hand_landmarker/float16/latest/hand_landmarker.task

2. `.task` を `.zip` にリネームするか 7z で開く:

   ```
   7z x hand_landmarker.task -omodels/
   ```

3. 中に含まれる `palm_detection_full.tflite` (または
   `palm_detection_lite.tflite`) をこのサンプル配下の `models/`
   ディレクトリに配置:

   ```
   sample/iron/models/palm_detection_full.tflite
   ```

### 入力画像

`hand.jpg` という名前で手の写った任意の画像 (24bit JPEG) を
サンプルと同じディレクトリに置いてください。

## 実行

```
hsp3.exe sample_mediapipe_hand.hsp
```

## 注意点 (v1 の既知の妥協)

- iron_mediapipe.hsp の anchor decode と NMS は v1 では簡略化されて
  おり、実際の検出ロジックは TODO 扱いです。palm_detector の
  invoke までは通りますが、結果は常に 0 件を返します。
- 完全な検出には C++ 側に anchor/NMS ヘルパを実装する必要があり、
  これは v2 での対応予定です。
- hand_landmarker (21 点ランドマーク) の 2 段目推論は v1 未実装。
