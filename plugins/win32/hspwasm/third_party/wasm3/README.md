# Wasm3 vendoring

`hspwasm.dll` は Wasm3 (https://github.com/wasm3/wasm3) の source/ ディレクトリを
そのまま C ソースとして embed してビルドします。ライセンスは MIT です。

本リポジトリには Wasm3 の実ソースはコミットしていません (サイズ / ライセンス分離の
ため)。以下の手順で手動 clone してから vcxproj をビルドしてください。

## 手順

```bash
cd plugins/win32/hspwasm/third_party
rm -rf wasm3    # この README と LICENSE をバックアップしておいてから
git clone --depth 1 https://github.com/wasm3/wasm3.git wasm3
```

これで以下の構成になります:

```
plugins/win32/hspwasm/third_party/wasm3/
├── source/
│   ├── wasm3.h
│   ├── m3_core.c
│   ├── m3_env.c
│   ├── m3_compile.c
│   ├── m3_exec.c
│   ├── m3_parse.c
│   ├── m3_module.c
│   ├── m3_function.c
│   ├── m3_info.c
│   ├── m3_code.c
│   ├── m3_bind.c
│   ├── m3_api_libc.c
│   ├── m3_api_wasi.c
│   └── ...
├── LICENSE
└── README.md  (wasm3 本体のもの; これとは別ファイル)
```

hspwasm.vcxproj は `third_party\wasm3\source\*.c` を個別に
ClCompile に列挙しています。wasm3 のファイル構成が変わったら
vcxproj の ItemGroup を更新してください。

## 動作確認済みコミット

2024 年時点の main ブランチ (v0.5.x) でビルド・動作確認予定。
具体的なコミット SHA は初回ビルド後にここに記載します。

## ビルド時の define

- `d_m3HasWASI=0` — WASI を無効化 (v1 は pure compute のみ)
- `d_m3HasTracer=0` — tracer 機能を無効化 (必要なら vcxproj に追加)
- それ以外はデフォルト設定で動作

## なし (stub) ビルド

wasm3 を clone せずに `hspwasm.cpp` だけで試しにビルドする場合、
`__has_include("m3_api_defs.h")` が false になり、stub 実装として
コンパイルできます (全関数が -100 を返す)。vcxproj の ClCompile
列挙はファイル欠如でビルドエラーになるため、その場合は
`hspwasm.vcxproj` から `third_party\wasm3\source\*.c` の行を
一時的に削除してください。

## ライセンス

Wasm3 は MIT ライセンスです。clone 時に取得される LICENSE
ファイルを同梱配布してください。
