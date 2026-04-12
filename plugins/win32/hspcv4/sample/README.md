# hspcv4 サンプル集

## 前提

- `hspcv4.dll` が `../Release/` か PATH 上にあること
- このディレクトリから見える位置に `hspcv4.as` があること
  (`../package/hspcv4.as` を相対指定 or `#include` のパスを通す)

## サンプル一覧

| ファイル | 内容 |
|---|---|
| [sample_basic.hsp](sample_basic.hsp)     | 画像の読込/情報表示/保存の最小例 |
| [sample_drawing.hsp](sample_drawing.hsp) | 描画 4 種 (line/rect/circle/text) |
| [sample_filter.hsp](sample_filter.hsp)   | フィルタ 5 種 (blur/gauss/median/canny/thresh) |
| [sample_geo.hsp](sample_geo.hsp)         | 幾何変換 4 種 (flip/rotate/crop/warp) |
| [sample_hsp_bridge.hsp](sample_hsp_bridge.hsp) | cv4getimg/putimg による HSP 画面との相互転送 |
| [sample_face_detect.hsp](sample_face_detect.hsp) | Haar cascade による顔検出 (玄人向け API + cv_rect) |
| [sample_video_capture.hsp](sample_video_capture.hsp) | カメラ or 動画ファイルからの読込 + プレビュー |
| [sample_dnn_classify.hsp](sample_dnn_classify.hsp) | ONNX モデルによる画像分類 |

## サンプル画像

`test_image.png` は IronHSP 同梱の `hsp3dish` サンプル画像 (りんごスプライト)
をコピーしたものです。

## Cascade XML について

`sample_face_detect.hsp` は OpenCV の
`haarcascade_frontalface_default.xml` が必要です。ビルド時に
`plugins/win32/hspcv4/build/opencv_install_XX/etc/haarcascades/`
に配置されるので、そこからコピーしてきてください。

## ONNX モデルについて

`sample_dnn_classify.hsp` は小さな ONNX 分類モデルが必要です。
例えば [MobileNetV2](https://github.com/onnx/models/tree/main/validated/vision/classification/mobilenet)
等をダウンロードして利用してください。
