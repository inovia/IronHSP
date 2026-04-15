# DuckDB vendoring

`hspduckdb.dll` は DuckDB (https://duckdb.org) の **amalgamation** を
embed してビルドします。ライセンスは MIT です。

本リポジトリには DuckDB の実ソースはコミットしていません
(サイズ ~5 MB / ライセンス分離のため)。以下の手順で配置してから
`hspduckdb.vcxproj` をビルドしてください。

## 手順

1. DuckDB Releases ページ (https://github.com/duckdb/duckdb/releases)
   から `libduckdb-src.zip` をダウンロード。
2. 展開して以下のファイルを本ディレクトリ (`third_party/duckdb/`) に
   コピー:
   - `duckdb.h`
   - `duckdb.hpp` (optional, C++ API 用)
   - `duckdb.cpp`  (amalgamation の実体)

以下の構成になります:

```
plugins/win32/hspduckdb/third_party/duckdb/
├── duckdb.h
├── duckdb.hpp        (optional)
├── duckdb.cpp
├── LICENSE
└── README.md         (このファイル)
```

3. `hspduckdb.vcxproj` の `ItemGroup` にある
   `<!-- <ClCompile Include="third_party\duckdb\duckdb.cpp" /> -->`
   のコメントを外して、amalgamation をビルド対象に含める。

## なし (stub) ビルド

amalgamation を配置しない状態でも、`hspduckdb.cpp` は
`__has_include("duckdb.h")` が false になり stub 実装として
コンパイルできます (全関数が -100 を返す)。

## 動作確認済みバージョン

初回ビルド後にコミット SHA / タグをここに記載してください。
想定: DuckDB 1.1.x 系 (2025 年時点安定版)。

## ビルドオプションメモ

- DuckDB amalgamation は C++17 以上が必要 (vcxproj で stdcpp17 指定済み)
- `_CRT_SECURE_NO_WARNINGS` 必要
- 警告抑制: `/wd4996 /wd4267 /wd4244` などを vcxproj で追加済み
- DuckDB は内部で pthread ではなく std::thread を使うのでリンク追加不要
- サイズは Release / x64 で ~30 MB の DLL (template 展開が多い)

## 特徴

DuckDB の強力な点として以下が HSP からそのまま使えます:

```hsp
duckdb_open_db ":memory:", db
duckdb_query db, "SELECT * FROM 'data.csv' LIMIT 10", rh
duckdb_query db, "SELECT * FROM 'data.parquet' WHERE id > 100", rh
duckdb_query db, "INSTALL httpfs; LOAD httpfs; SELECT * FROM 'https://example.com/data.csv'", rh
```

CSV / Parquet / JSON / httpfs 拡張が全て組み込み済みで、HSP 側からは
SQL 文字列を投げるだけで済みます。

## ライセンス

DuckDB は MIT ライセンスです。amalgamation 配布物に同梱される
`LICENSE` ファイルをそのまま配布物に同梱してください。
