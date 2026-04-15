//============================================================
//   hspduckdb.dll — DuckDB C API ラッパ (IronHSP プラグイン)
//
//   DuckDB (https://duckdb.org) の公式 C API を embed し、HSP から
//   open / exec / query / result fetch を呼べる薄いラッパ。
//
//   DuckDB は amalgamation として `duckdb.h` + `duckdb.c` (または .cpp)
//   を提供しているので、third_party/duckdb/ に配置してビルドする。
//   amalgamation 未配置時は __has_include フォールバックで stub ビルド
//   可能 (全関数が -100 を返す)。
//
//   HSP API (全て OLDDLL $202):
//     duckdb_open_db        "file",                     var_handle
//     duckdb_close_db       handle
//     duckdb_exec           handle, "sql",              var_rc
//     duckdb_query          handle, "sql",              var_result_handle
//     duckdb_result_rows    rh,                         var_rows
//     duckdb_result_cols    rh,                         var_cols
//     duckdb_result_col_name rh, col,                   var_str
//     duckdb_result_cell_str rh, row, col,              var_str
//     duckdb_result_cell_dbl rh, row, col,              var_dbl
//     duckdb_result_free    rh
//
//   特徴:
//     - file = ":memory:" で in-memory DB
//     - `SELECT * FROM 'data.csv'` / `'data.parquet'` がそのまま動く
//============================================================

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <string>
#include <vector>
#include <array>
#include <cstring>
#include <cstdio>
#include <cstdlib>
#include <cstdint>

// 新形式 (typed #func) 移行済。HSPEXINFO / HspFunc_prm_* 非依存。

// ---------- DuckDB ----------
//
// 注意: DuckDB amalgamation は本リポジトリには vendor していない。
// plugins/win32/hspduckdb/third_party/duckdb/README.md に記載の手順で
// https://duckdb.org/docs/installation/ から `libduckdb-src.zip` を
// ダウンロードし、`duckdb.h` / `duckdb.cpp` を third_party/duckdb/ に
// 配置してから vcxproj をビルドする。
//
#if __has_include("duckdb.h")
  #include "duckdb.h"
  #define HSPDUCKDB_HAVE 1
#else
  #define HSPDUCKDB_HAVE 0
  // stub 型定義
  typedef void* duckdb_database;
  typedef void* duckdb_connection;
  typedef struct { void* __padding[8]; } duckdb_result;
  typedef int duckdb_state;
#endif

#define HSPDUCKDB_EXPORT extern "C" __declspec(dllexport)

// 文字列を HSP 側バッファへ null 終端付きで安全コピー
static void copy_to_buf(const char* src, char* out, int out_size)
{
    if (!out || out_size <= 0) return;
    if (!src) src = "";
    int n = (int)strlen(src);
    if (n >= out_size) n = out_size - 1;
    if (n > 0) memcpy(out, src, (size_t)n);
    out[n] = 0;
}

// ============================================================
// DB handle table
// ============================================================
struct DbState {
    bool used = false;
#if HSPDUCKDB_HAVE
    duckdb_database  db  = nullptr;
    duckdb_connection con = nullptr;
#endif
};

struct ResultState {
    bool used = false;
#if HSPDUCKDB_HAVE
    duckdb_result res{};
    idx_t n_rows = 0;
    idx_t n_cols = 0;
#else
    int n_rows = 0;
    int n_cols = 0;
#endif
};

static std::array<DbState,     16> g_dbs;
static std::array<ResultState, 32> g_results;

static int alloc_db_slot() {
    for (int i = 0; i < (int)g_dbs.size(); ++i) if (!g_dbs[i].used) return i;
    return -1;
}
static int alloc_res_slot() {
    for (int i = 0; i < (int)g_results.size(); ++i) if (!g_results[i].used) return i;
    return -1;
}
static DbState*     get_db(int h)  { if (h<0||h>=(int)g_dbs.size())     return nullptr; return g_dbs[h].used     ? &g_dbs[h]     : nullptr; }
static ResultState* get_res(int h) { if (h<0||h>=(int)g_results.size()) return nullptr; return g_results[h].used ? &g_results[h] : nullptr; }

static void free_db(int h) {
    DbState* d = get_db(h);
    if (!d) return;
#if HSPDUCKDB_HAVE
    if (d->con) duckdb_disconnect(&d->con);
    if (d->db)  duckdb_close(&d->db);
    d->con = nullptr;
    d->db  = nullptr;
#endif
    d->used = false;
}

static void free_res(int h) {
    ResultState* r = get_res(h);
    if (!r) return;
#if HSPDUCKDB_HAVE
    duckdb_destroy_result(&r->res);
    r->n_rows = 0;
    r->n_cols = 0;
#endif
    r->used = false;
}

// ============================================================
// HSP exports (新形式 typed #func)
//   DLL 実体名は hspduckdb_xxx にプレフィックス。DuckDB C API の
//   同名シンボル (duckdb_query 等) との衝突を回避する。
// ============================================================

// duckdb_open_db "file", var_handle
HSPDUCKDB_EXPORT int __stdcall hspduckdb_open_db(const char* path, int* out_h)
{
    if (out_h) *out_h = -1;
    if (!path) return 0;
#if HSPDUCKDB_HAVE
    int h = alloc_db_slot();
    if (h < 0) { if (out_h) *out_h = -2; return 0; }
    DbState& d = g_dbs[h];
    const char* dbfile = (strcmp(path, ":memory:") == 0) ? nullptr : path;
    if (duckdb_open(dbfile, &d.db) != DuckDBSuccess) {
        if (out_h) *out_h = -3; return 0;
    }
    if (duckdb_connect(d.db, &d.con) != DuckDBSuccess) {
        duckdb_close(&d.db);
        if (out_h) *out_h = -4; return 0;
    }
    d.used = true;
    if (out_h) *out_h = h;
#else
    if (out_h) *out_h = -100;
#endif
    return 0;
}

// duckdb_close_db handle
HSPDUCKDB_EXPORT int __stdcall hspduckdb_close_db(int h)
{
    free_db(h);
    return 0;
}

// duckdb_exec handle, "sql", var_rc
HSPDUCKDB_EXPORT int __stdcall hspduckdb_exec(int h, const char* sql, int* out_rc)
{
    if (out_rc) *out_rc = -1;
#if HSPDUCKDB_HAVE
    DbState* d = get_db(h);
    if (!d || !sql) return 0;
    duckdb_result tmp;
    duckdb_state st = duckdb_query(d->con, sql, &tmp);
    if (st == DuckDBSuccess) {
        duckdb_destroy_result(&tmp);
        if (out_rc) *out_rc = 0;
    } else {
        duckdb_destroy_result(&tmp);
        if (out_rc) *out_rc = -2;
    }
#else
    (void)h; (void)sql;
    if (out_rc) *out_rc = -100;
#endif
    return 0;
}

// duckdb_query handle, "sql", var_result_handle
HSPDUCKDB_EXPORT int __stdcall hspduckdb_query(int h, const char* sql, int* out_rh)
{
    if (out_rh) *out_rh = -1;
#if HSPDUCKDB_HAVE
    DbState* d = get_db(h);
    if (!d || !sql) return 0;
    int rh = alloc_res_slot();
    if (rh < 0) { if (out_rh) *out_rh = -2; return 0; }
    ResultState& r = g_results[rh];
    duckdb_state st = duckdb_query(d->con, sql, &r.res);
    if (st != DuckDBSuccess) {
        duckdb_destroy_result(&r.res);
        if (out_rh) *out_rh = -3;
        return 0;
    }
    r.n_rows = duckdb_row_count(&r.res);
    r.n_cols = duckdb_column_count(&r.res);
    r.used = true;
    if (out_rh) *out_rh = rh;
#else
    (void)h; (void)sql;
    if (out_rh) *out_rh = -100;
#endif
    return 0;
}

// duckdb_result_rows rh, var_rows
HSPDUCKDB_EXPORT int __stdcall hspduckdb_result_rows(int rh, int* out)
{
    if (out) *out = -1;
#if HSPDUCKDB_HAVE
    ResultState* r = get_res(rh);
    if (!r) return 0;
    if (out) *out = (int)r->n_rows;
#else
    (void)rh;
    if (out) *out = -100;
#endif
    return 0;
}

// duckdb_result_cols rh, var_cols
HSPDUCKDB_EXPORT int __stdcall hspduckdb_result_cols(int rh, int* out)
{
    if (out) *out = -1;
#if HSPDUCKDB_HAVE
    ResultState* r = get_res(rh);
    if (!r) return 0;
    if (out) *out = (int)r->n_cols;
#else
    (void)rh;
    if (out) *out = -100;
#endif
    return 0;
}

// duckdb_result_col_name rh, col, var_buf, buf_size
HSPDUCKDB_EXPORT int __stdcall hspduckdb_result_col_name(
    int rh, int col, char* out_buf, int out_size)
{
    if (out_buf && out_size > 0) out_buf[0] = 0;
#if HSPDUCKDB_HAVE
    ResultState* r = get_res(rh);
    if (!r || col < 0 || (idx_t)col >= r->n_cols) return 0;
    const char* name = duckdb_column_name(&r->res, (idx_t)col);
    copy_to_buf(name, out_buf, out_size);
#else
    (void)rh; (void)col;
#endif
    return 0;
}

// duckdb_result_cell_str rh, row, col, var_buf, buf_size
HSPDUCKDB_EXPORT int __stdcall hspduckdb_result_cell_str(
    int rh, int row, int col, char* out_buf, int out_size)
{
    if (out_buf && out_size > 0) out_buf[0] = 0;
#if HSPDUCKDB_HAVE
    ResultState* r = get_res(rh);
    if (!r || row < 0 || col < 0 ||
        (idx_t)row >= r->n_rows || (idx_t)col >= r->n_cols) return 0;
    char* s = duckdb_value_varchar(&r->res, (idx_t)col, (idx_t)row);
    if (!s) return 0;
    copy_to_buf(s, out_buf, out_size);
    duckdb_free(s);
#else
    (void)rh; (void)row; (void)col;
#endif
    return 0;
}

// duckdb_result_cell_dbl rh, row, col, var_dbl
HSPDUCKDB_EXPORT int __stdcall hspduckdb_result_cell_dbl(
    int rh, int row, int col, double* out)
{
    if (out) *out = 0.0;
#if HSPDUCKDB_HAVE
    ResultState* r = get_res(rh);
    if (!r || row < 0 || col < 0 ||
        (idx_t)row >= r->n_rows || (idx_t)col >= r->n_cols) return 0;
    double v = duckdb_value_double(&r->res, (idx_t)col, (idx_t)row);
    if (out) *out = v;
#else
    (void)rh; (void)row; (void)col;
#endif
    return 0;
}

// duckdb_result_free rh
HSPDUCKDB_EXPORT int __stdcall hspduckdb_result_free(int rh)
{
    free_res(rh);
    return 0;
}

// ============================================================
// DllMain
// ============================================================
BOOL WINAPI DllMain(HINSTANCE, DWORD reason, LPVOID) {
    if (reason == DLL_PROCESS_DETACH) {
        for (int i = 0; i < (int)g_results.size(); ++i) free_res(i);
        for (int i = 0; i < (int)g_dbs.size();     ++i) free_db(i);
    }
    return TRUE;
}
