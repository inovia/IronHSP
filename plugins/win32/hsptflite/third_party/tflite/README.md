# Tensorflow Lite C API vendoring

`hsptflite.dll` は Google Tensorflow Lite の C API
(`libtensorflowlite_c.dll` / `tensorflowlite_c.dll`) を動的リンクして
使用します。ライセンスは Apache-2.0 です。

本リポジトリには TFLite の header / lib / dll はコミットしていません。
以下のいずれかの方法で手動配置してからビルドしてください。
未配置時は `__has_include` によりスタブビルドとなります (全関数が
`-100` を返すダミー)。

## 方法 1: 公式 prebuilt (推奨)

Tensorflow 公式が Windows x64 向けに `tensorflowlite_c.dll` (~3 MB) を
配布しています。

  https://www.tensorflow.org/lite/guide/build_cmake#build_tensorflow_lite_c_library

または、GitHub Release から直接入手:

  https://github.com/tensorflow/tensorflow/releases

配置先:

```
third_party/tflite/
  include/
    tensorflow/lite/c/c_api.h
    tensorflow/lite/c/c_api_types.h
    tensorflow/lite/c/common.h
    ...
  lib/
    x64/
      tensorflowlite_c.lib
      tensorflowlite_c.dll
    x86/
      tensorflowlite_c.lib     (x86 は公式 prebuilt 無し、自前ビルド)
      tensorflowlite_c.dll
```

## 方法 2: 自前ビルド

cmake で `tensorflow/lite/c` を `BUILD_SHARED_LIBS=ON` でビルドすると
`tensorflowlite_c.dll` が得られます。

```bash
git clone --depth=1 https://github.com/tensorflow/tensorflow.git
cd tensorflow
cmake -S tensorflow/lite/c -B build_tflitec -A x64 ^
      -DBUILD_SHARED_LIBS=ON -DTFLITE_ENABLE_XNNPACK=ON
cmake --build build_tflitec --config Release
```

生成された `Release/tensorflowlite_c.dll` と `tensorflowlite_c.lib` を
上記の配置先にコピーしてください。header 群は `tensorflow/lite/c/*.h`
を `third_party/tflite/include/tensorflow/lite/c/` にコピー。

## ビルド後

1. `hsptflite.vcxproj` の Link AdditionalDependencies に
   `tensorflowlite_c.lib` を追加 (現状スタブビルド用に未列挙)。
2. 生成された `hsptflite.dll` / `hsptflite_64.dll` と合わせて
   `tensorflowlite_c.dll` を HSP ランタイムと同じディレクトリ
   (`package/win32/runtime/`) にコピーして配布する。

## モデル入手

MediaPipe の `.task` ファイルは ZIP バンドルで中身に `.tflite` モデル
が入っています。`.task` を `.zip` にリネームして展開するか 7z で解凍:

  https://storage.googleapis.com/mediapipe-models/hand_landmarker/hand_landmarker/float16/latest/hand_landmarker.task

取り出した `hand_landmarker.tflite` / `palm_detection.tflite` を
`sample/iron/models/` に配置してサンプルから参照します。
