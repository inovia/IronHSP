# hspwasm 同一 WASM 共有デモ

同じ `shared.wasm` (131 byte) を:

- **HSP** から `hspwasm.dll` (Wasm3 embed) 経由で実行 — `sample_wasm_shared.hsp`
- **ブラウザ** から `WebAssembly.instantiate` 経由で実行 — `browser.html`

両方で同じ結果になることを確認するデモです。

## ファイル

| ファイル | 役割 |
|---|---|
| `shared.wasm` | 131 byte の WebAssembly モジュール。`add` / `mul` / `fib` / `sum_to` を export |
| `sample_wasm_shared.hsp` | HSP サンプル (`#include "iron_wasm.hsp"`) |
| `browser.html` | ブラウザサンプル (`fetch` + `WebAssembly.instantiate`) |
| `build_shared_wasm.py` | `shared.wasm` を生成する Python スクリプト (再生成用、wat2wasm 不要) |

## shared.wasm の中身 (疑似 WAT)

```wat
(module
  (func (export "add")    (param i32 i32) (result i32)
    local.get 0  local.get 1  i32.add)
  (func (export "mul")    (param i32 i32) (result i32)
    local.get 0  local.get 1  i32.mul)
  (func (export "fib")    (param i32) (result i32)
    (if (result i32) (i32.lt_s (local.get 0) (i32.const 2))
      (then (local.get 0))
      (else (i32.add
              (call $fib (i32.sub (local.get 0) (i32.const 1)))
              (call $fib (i32.sub (local.get 0) (i32.const 2)))))))
  (func (export "sum_to") (param i32) (result i32)
    (if (result i32) (i32.lt_s (local.get 0) (i32.const 1))
      (then (i32.const 0))
      (else (i32.add
              (local.get 0)
              (call $sum_to (i32.sub (local.get 0) (i32.const 1))))))))
```

## 期待値

| 呼び出し | 結果 |
|---|---:|
| `add(12, 30)`  | 42 |
| `mul(7, 6)`    | 42 |
| `fib(10)`      | 55 |
| `fib(20)`      | 6765 |
| `sum_to(100)`  | 5050 |

## 実行方法

### HSP 側

1. `hspwasm.dll` (32bit) または `hspwasm_64.dll` (64bit) を HSP ランタイムに配置
2. このディレクトリで `hsp3cl sample_wasm_shared.hsp` を実行

### ブラウザ側

`fetch` は `file://` から動かないブラウザがあるので、このディレクトリで軽量 HTTP サーバを立てる:

```
python -m http.server 8080
```

その後 http://localhost:8080/browser.html をブラウザで開く。

## ポイント

- **バイナリ互換**: HSP と Chrome/Edge (V8) は異なる WASM ランタイム (Wasm3 vs V8 TurboFan) だが、WASM 仕様準拠なので同じバイナリが同じ結果を返す。
- **131 byte**: `shared.wasm` は Python で直接バイナリフォーマットを書き起こしただけ。wat2wasm も clang も使っていない。`build_shared_wasm.py` を参照。
- **実用上の意義**: Rust / Go / Zig / C / AssemblyScript で書いた 1 つの `.wasm` が、ブラウザ・HSP・他のランタイム全てで再利用できる。IronHSP 上では HSP 側が I/O と UI を担当し、重い数値計算だけ WASM に任せる設計が自然。
