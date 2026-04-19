# hsponnx.dll — ONNX Runtime plugin for HSP

Microsoft ONNX Runtime を HSP から使い、ONNX モデルで推論 (画像分類・
物体検出・音声・NLP ほか) ができるプラグイン。

## API 抜粋

```
onnx_init
onnx_shutdown
onnx_load_model   "path.onnx",     var_handle
onnx_close        h
onnx_input_count  h,               var_n
onnx_input_name   h, idx,          var_str, str_len
onnx_input_shape  h, idx,          var_dims_array, var_rank
onnx_output_count h,               var_n
onnx_run          h, var_in_f32, in_count, var_out_f32, out_count
```

## ビルド手順

### 1. ONNX Runtime を DL (NuGet)

```powershell
cd third_party/onnxruntime
curl -L -o onnx.nupkg https://www.nuget.org/api/v2/package/Microsoft.ML.OnnxRuntime/1.20.1
7z x onnx.nupkg -onupkg
cp -r nupkg/build/native/include .
mkdir -p lib/x64 lib/x86
cp nupkg/runtimes/win-x64/native/{onnxruntime.dll,onnxruntime.lib} lib/x64/
cp nupkg/runtimes/win-x86/native/{onnxruntime.dll,onnxruntime.lib} lib/x86/
rm -rf nupkg onnx.nupkg
```

### 2. ビルド

```powershell
msbuild hsponnx.vcxproj /p:Configuration=Release /p:Platform=x64    # → hsponnx_64.dll
msbuild hsponnx.vcxproj /p:Configuration=Release /p:Platform=Win32  # → hsponnx.dll
```

### 3. 配置

```powershell
cp Release/hsponnx_64.dll ../../../package/win32/
cp Release/hsponnx.dll    ../../../package/win32/
cp third_party/onnxruntime/lib/x64/onnxruntime.dll ../../../package/win32/
```

## テスト

```
cd package/win32/sample/iron
../../iron_test_runner.exe --compiler=../../hspcmp64.exe \
    --runtime=../../hsp3cl_net_test_64.exe --compath=../../common/ \
    test_onnx.hsp
```

実モデル推論のフルサンプルは `sample_onnx.hsp` (既存)、MediaPipe 手検出デモは
`sample_cam_ai.hsp`。

## 制限

- `onnxruntime.dll` (~11MB) の配布が必要
- DirectML GPU 対応には別 NuGet (`Microsoft.ML.OnnxRuntime.DirectML`) +
  `DirectML.dll` 同梱

## 参考

- ONNX Runtime: https://onnxruntime.ai/
- Model Zoo: https://github.com/onnx/models
