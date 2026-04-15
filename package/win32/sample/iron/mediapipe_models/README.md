# MediaPipe モデル配置

このディレクトリは .gitignore で .tflite / .task を除外しています。
サンプル実行前に以下の手順でモデルをダウンロードしてください。

## 1. hand_landmarker.task をダウンロード

```
curl -O https://storage.googleapis.com/mediapipe-models/hand_landmarker/hand_landmarker/float16/latest/hand_landmarker.task
```

## 2. .task は ZIP なので 7z で展開して .tflite を取り出す

```
7z x hand_landmarker.task
```

以下の 2 ファイルが取り出されます:

- `hand_detector.tflite` (~2.3 MB) — palm detector (1 段目)
- `hand_landmarks_detector.tflite` (~5.5 MB) — 21 点 landmark (2 段目)

## 3. hsptflite_64.dll と tensorflowlite_c.dll を同じディレクトリに配置

```
cp ../../../../../plugins/win32/hsptflite/Release/hsptflite_64.dll .
cp ../../../../../plugins/win32/hsptflite/third_party/tflite/lib/x64/tensorflowlite_c.dll .
```

## 4. テスト画像

好きな手の画像を `hand_test.jpg` として置いてください。MediaPipe の公式
サンプル画像を使うなら:

```
curl -o hand_test.jpg https://storage.googleapis.com/mediapipe-tasks/hand_landmarker/woman_hands.jpg
```

## 5. サンプル実行

`../sample_mediapipe_hand.hsp` を HSP から実行 (hsp3net 64bit)。

## 既知の制約

- 現状 x64 ビルドのみ (ValYouW/tflite-dist の Windows prebuilt が x86_64 のみ)
- hsp3net 64bit ランタイムで `$202 OLDDLL` プラグイン呼び出しに Error 38
  が出る問題があり、実機 HSP からの動作確認は 32bit でしかできていない。
  アルゴリズム検証は Python reference (ai_edge_litert / mediapipe.tasks)
  との output 一致で確認済み。
