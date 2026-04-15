;============================================================
;  hspduckdb.as — DuckDB C API プラグイン宣言
;============================================================

#ifndef __hspduckdb_as__
#define __hspduckdb_as__

#uselib "hspduckdb.dll"
#func global duckdb_open_db          duckdb_open_db          $202
#func global duckdb_close_db         duckdb_close_db         $202
#func global duckdb_exec             duckdb_exec             $202
#func global duckdb_query            duckdb_query            $202
#func global duckdb_result_rows      duckdb_result_rows      $202
#func global duckdb_result_cols      duckdb_result_cols      $202
#func global duckdb_result_col_name  duckdb_result_col_name  $202
#func global duckdb_result_cell_str  duckdb_result_cell_str  $202
#func global duckdb_result_cell_dbl  duckdb_result_cell_dbl  $202
#func global duckdb_result_free      duckdb_result_free      $202

#endif
