# ONNX Runtime vendoring

`hsponnx.dll` は Microsoft ONNX Runtime (https://github.com/microsoft/onnxruntime) を
動的リンクして使用します。ライセンスは MIT です。

本リポジトリには ONNX Runtime の header / lib / dll はコミットしていません。
以下のいずれかの方法で手動配置してからビルドしてください。

## 方法 1: NuGet (推奨)

1. Visual Studio の NuGet パッケージマネージャで以下を入手:
   - `Microsoft.ML.OnnxRuntime`           (CPU only)
   - `Microsoft.ML.OnnxRuntime.DirectML`  (DirectML GPU 対応版, 推奨)
2. パッケージ内の以下を本ディレクトリへコピー:

```
third_party/onnxruntime/
  include/
    onnxruntime_c_api.h
    dml_provider_factory.h   (DirectML 版のみ)
    ...
  lib/
    x64/
      onnxruntime.lib
      onnxruntime.dll
      DirectML.dll           (DirectML 版のみ)
    x86/
      onnxruntime.lib
      onnxruntime.dll
```

3. `hsponnx.vcxproj` の Link AdditionalDependencies に
   `onnxruntime.lib` を追加 (現状 stub ビルド用に未列挙)。

4. ビルド成果物 `hsponnx.dll` と合わせて
   `onnxruntime.dll` / `DirectML.dll` を HSP ランタイムと同じディレクトリ
   (`package/win32/runtime/`) にコピーして配布する。

## 方法 2: 公式 zip

1. https://github.com/microsoft/onnxruntime/releases から
   `onnxruntime-win-x64-1.x.x.zip` / `onnxruntime-win-x64-directml-1.x.x.zip` を取得
2. `include/` と `lib/` を上と同じレイアウトで配置

## スタブビルド (onnxruntime 未配置)

`hsponnx.cpp` は `__has_include("onnxruntime_c_api.h")` で存在チェックしており、
header がない場合は全 API がスタブ実装 (`-100` を返すだけ) としてビルドされます。
AI ランタイムを配備しない環境でもビルドが通り、他プラグインと同時に配布可能です。

## DirectML について

`dml_provider_factory.h` が同梱された DirectML 版を使うと、
`onnx_set_backend_dml` で GPU 推論が有効化されます。DirectX 12 対応の
Windows 10 以降 (Intel / NVIDIA / AMD / Qualcomm すべて) で動作します。

## 動作確認済みバージョン

- ONNX Runtime 1.17.x / 1.18.x (未確認, Phase L7 時点で想定)

## ライセンス

MIT License. 配布時は LICENSE ファイル同梱が必要です。
