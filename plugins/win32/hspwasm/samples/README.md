# hspwasm サンプル wasm モジュール

v1 テスト用の最小 wasm モジュールの作り方。

## add.wasm (wat2wasm 版)

`add.wat`:

```wat
(module
  (func (export "add") (param i32 i32) (result i32)
    local.get 0
    local.get 1
    i32.add)
  (memory (export "memory") 1))
```

```bash
wat2wasm add.wat -o add.wasm
```

## add.wasm (Rust 版)

```rust
// lib.rs
#![no_std]

#[panic_handler]
fn panic(_: &core::panic::PanicInfo) -> ! { loop {} }

#[no_mangle]
pub extern "C" fn add(a: i32, b: i32) -> i32 { a + b }
```

`Cargo.toml`:

```toml
[package]
name = "add"
version = "0.1.0"
edition = "2021"

[lib]
crate-type = ["cdylib"]

[profile.release]
opt-level = "z"
lto = true
strip = true
```

```bash
cargo build --target wasm32-unknown-unknown --release
# → target/wasm32-unknown-unknown/release/add.wasm
```

## その他の候補 (v1 動作確認用)

- `mt19937.wasm` — C の MT19937 を emscripten -sSTANDALONE_WASM で build
- `regex.wasm` — Rust の regex crate を wasm32-unknown-unknown で build (複雑)

## 配置

サンプルは `package/win32/sample/iron/sample_wasm.hsp` と同じディレクトリに
`add.wasm` を置くと sample_wasm.hsp がそのまま動きます。
