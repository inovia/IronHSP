;============================================================
;  hspduckdb.as — DuckDB C API プラグイン宣言 (新形式 typed #func)
;
;  HSP コマンド名は従来互換 (duckdb_xxx)。DLL 実体名は hspduckdb_xxx
;  にリネームして DuckDB 本体の同名シンボルとの衝突を回避。
;============================================================

#ifndef __hspduckdb_as__
#define __hspduckdb_as__

#uselib "hspduckdb.dll"
#func global duckdb_open_db          "hspduckdb_open_db"          str, var
#func global duckdb_close_db         "hspduckdb_close_db"         int
#func global duckdb_exec             "hspduckdb_exec"             int, str, var
#func global duckdb_query            "hspduckdb_query"            int, str, var
#func global duckdb_result_rows      "hspduckdb_result_rows"      int, var
#func global duckdb_result_cols      "hspduckdb_result_cols"      int, var
#func global duckdb_result_col_name  "hspduckdb_result_col_name"  int, int, var, int
#func global duckdb_result_cell_str  "hspduckdb_result_cell_str"  int, int, int, var, int
#func global duckdb_result_cell_dbl  "hspduckdb_result_cell_dbl"  int, int, int, var
#func global duckdb_result_free      "hspduckdb_result_free"      int

#endif
