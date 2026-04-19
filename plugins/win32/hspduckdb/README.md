# hspduckdb.dll — DuckDB C API plugin for HSP

埋め込み型の分析用 SQL データベース [DuckDB](https://duckdb.org) を HSP から
使えるプラグイン。amalgamation 方式で DuckDB 本体をリンク内蔵するので、
別途 `duckdb.dll` を配布する必要なし。

## API (x64 のみ実機能化、x86 は stub)

```
duckdb_open_db    "path_or_:memory:",      var_db_handle
duckdb_close_db   db_handle
duckdb_exec       db_handle, "SQL",        var_rc
duckdb_query      db_handle, "SQL",        var_result_handle
duckdb_result_rows     rh, var_nrows
duckdb_result_cols     rh, var_ncols
duckdb_result_col_name rh, col_idx,      var_str, str_len
duckdb_result_cell_str rh, row, col,     var_str, str_len
duckdb_result_cell_dbl rh, row, col,     var_dbl
duckdb_result_free     rh
```

`iron_duckdb.hsp` に高級ラッパあり。

## ビルド手順

### 1. DuckDB amalgamation を DL

```powershell
cd third_party/duckdb
curl -L -o libduckdb-src.zip https://github.com/duckdb/duckdb/releases/download/v1.2.2/libduckdb-src.zip
7z x libduckdb-src.zip
```

`duckdb.h` / `duckdb.hpp` / `duckdb.cpp` (~18 MB) が生成される。

### 2. ビルド (x64 のみ)

```powershell
msbuild hspduckdb.vcxproj /p:Configuration=Release /p:Platform=x64
# → Release/hspduckdb_64.dll (~16 MB)
```

必要な vcxproj 設定:
- `DUCKDB_STATIC_BUILD` プリプロセッサ定義 (amalgamation を静的リンクする)
- `_WIN32_WINNT=0x0A00` / `WINVER=0x0A00` / `WIN32_LEAN_AND_MEAN` / `NOMINMAX`
- `SDLCheck=false` (amalgamation は uninitialized pointer warning が多い)
- 追加 lib: `ws2_32.lib;rstrtmgr.lib;bcrypt.lib`

### 3. 配置

```powershell
cp Release/hspduckdb_64.dll ../../../package/win32/
```

## サンプル / テスト

- `package/win32/sample/iron/sample_duckdb.hsp` — テーブル作成 + 集計クエリ
- `package/win32/sample/iron/test_duckdb.hsp` — 7 case 自動テスト

```
cd package/win32/sample/iron
../../iron_test_runner.exe --compiler=../../hspcmp64.exe \
    --runtime=../../hsp3cl_net_test_64.exe --compath=../../common/ \
    test_duckdb.hsp
```

## 制限 / 注意

- **x64 のみ**: amalgamation が 16MB と大きい、i386 は stub ビルドで運用推奨
- `duckdb_result_cell_dbl` は整数型 (`INT`/`BIGINT`) に対して 0 を返すことがあるので、
  スカラ値を確実に取るなら `duckdb_result_cell_str` 経由が無難
- `duckdb_value_double` は DuckDB 内部で legacy 扱い (将来バージョンで削除可能性)

## 参考

- DuckDB: https://duckdb.org
- C API docs: https://duckdb.org/docs/api/c
