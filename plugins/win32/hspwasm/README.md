# hspwasm.dll — WebAssembly (Wasm3) plugin for HSP

`.wasm` モジュールを HSP から load してエクスポート関数を呼び出せる薄いラッパ。
Wasm3 (pure C interpreter, ~150KB) を embed。

## API 概要

32-bit/64-bit 両対応。`hspwasm.as` を `#include` すると `_HSP64` 自動切り替え。

```
wasm_load     "path",           var_hid
wasm_load_mem var_buf, len,     var_hid
wasm_close    hid
wasm_clear
wasm_memory_size  hid,                          var_int
wasm_memory_read  hid, offset, var_dst, len,    var_int
wasm_memory_write hid, offset, var_src, len,    var_int
wasm_call_i       hid, "name", array_args, argc, var_ret
wasm_call_i64     hid, "name", array_args, argc, var_ret
wasm_call_d       hid, "name", array_args, argc, var_dbl
```

`iron_wasm.hsp` に `wasm_call0` ～ `wasm_call8` の固定アリティラッパあり。

## ビルド手順

### Wasm3 vendor 済

`third_party/wasm3/` にソース一式が vendor されている (7.8MB)。
何もしなくてもそのまま build できる。

### ビルド

Visual Studio 2022 (v143) または CLI から:

```powershell
msbuild hspwasm.vcxproj /p:Configuration=Release /p:Platform=x64   # → Release/hspwasm_64.dll
msbuild hspwasm.vcxproj /p:Configuration=Release /p:Platform=Win32 # → Release/hspwasm.dll
```

ビルドした DLL を `package/win32/` にコピーして完成。

## 制限事項 (v1)

- `i32` 引数のみ (`f32`/`f64`/`i64` 引数は非対応)
- Host imports 非対応 (wasm 側から HSP を呼ぶ機構なし)
- WASI 非対応 (`fd_write` / `fd_read` / ファイルシステム I/O 不可)
- 16 並列モジュールハンドル制限

v2 で host imports + WASI サブセット対応予定。

## サンプル

`package/win32/sample/iron/wasm_shared/sample_wasm_shared.hsp` — ブラウザと HSP で
同じ `shared.wasm` を呼んで結果が一致することを確認するデモ。

## テスト

```
cd package/win32/sample/iron
../../iron_test_runner.exe --compiler=../../hspcmp64.exe \
    --runtime=../../hsp3cl_net_test_64.exe --compath=../../common/ \
    test_wasm.hsp
```

7 cases / 7 pass を期待。

## 参考

- Wasm3: https://github.com/wasm3/wasm3
- WebAssembly spec: https://webassembly.org/
