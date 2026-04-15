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

#ifndef HSPWIN
#define HSPWIN
#endif
#if defined(_WIN64) && !defined(HSP64)
#define HSP64
#endif
#pragma warning(push)
#pragma warning(disable: 4819)
#include "../../../../hsp3/hsp3debug.h"
#include "../../../../hsp3/hsp3struct.h"
#include "../../../../hsp3/hspwnd.h"
#pragma warning(pop)

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

// ============================================================
// HSP helpers
// ============================================================
namespace {

HSPEXINFO* g_hei = nullptr;
inline void   set_hei(HSPEXINFO* hei) { g_hei = hei; }
inline int    getint() { return g_hei->HspFunc_prm_geti(); }
inline char*  getstr() { return g_hei->HspFunc_prm_gets(); }
inline double getdbl() { return g_hei->HspFunc_prm_getd(); }

inline PVal* getva_pval(APTR* out_aptr) {
    PVal* pv = nullptr;
    APTR a = g_hei->HspFunc_prm_getva(&pv);
    if (out_aptr) *out_aptr = a;
    return pv;
}

static void write_int_to_var(int v) {
    PVal* pv = nullptr;
    APTR a = g_hei->HspFunc_prm_getva(&pv);
    if (!pv || pv->flag != HSPVAR_FLAG_INT) return;
    pv->offset = a;
    HspVarProc* proc = g_hei->HspFunc_getproc(pv->flag);
    proc->Set(pv, proc->GetPtr(pv), &v);
}

static void write_double_to_var(double v) {
    PVal* pv = nullptr;
    APTR a = g_hei->HspFunc_prm_getva(&pv);
    if (!pv || pv->flag != HSPVAR_FLAG_DOUBLE) return;
    pv->offset = a;
    HspVarProc* proc = g_hei->HspFunc_getproc(pv->flag);
    proc->Set(pv, proc->GetPtr(pv), &v);
}

static void write_str_to_var(const char* s) {
    PVal* pv = nullptr;
    APTR a = g_hei->HspFunc_prm_getva(&pv);
    if (!pv || pv->flag != HSPVAR_FLAG_STR) return;
    pv->offset = a;
    HspVarProc* proc = g_hei->HspFunc_getproc(pv->flag);
    const char* src = s ? s : "";
    proc->Set(pv, proc->GetPtr(pv), (void*)src);
}

} // namespace

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
// HSP exports
// ============================================================

// duckdb_open_db "file", var_handle
HSPDUCKDB_EXPORT BOOL WINAPI duckdb_open_db(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    const char* path = getstr();
    if (!path) { write_int_to_var(-1); return 0; }
#if HSPDUCKDB_HAVE
    int h = alloc_db_slot();
    if (h < 0) { write_int_to_var(-2); return 0; }
    DbState& d = g_dbs[h];
    const char* dbfile = (strcmp(path, ":memory:") == 0) ? nullptr : path;
    if (duckdb_open(dbfile, &d.db) != DuckDBSuccess) {
        write_int_to_var(-3); return 0;
    }
    if (duckdb_connect(d.db, &d.con) != DuckDBSuccess) {
        duckdb_close(&d.db);
        write_int_to_var(-4); return 0;
    }
    d.used = true;
    write_int_to_var(h);
#else
    write_int_to_var(-100);
#endif
    return 0;
}

// duckdb_close_db handle
HSPDUCKDB_EXPORT BOOL WINAPI duckdb_close_db(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    free_db(h);
    return 0;
}

// duckdb_exec handle, "sql", var_rc
HSPDUCKDB_EXPORT BOOL WINAPI duckdb_exec(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    const char* sql = getstr();
    DbState* d = get_db(h);
    if (!d || !sql) { write_int_to_var(-1); return 0; }
#if HSPDUCKDB_HAVE
    duckdb_result tmp;
    duckdb_state st = duckdb_query(d->con, sql, &tmp);
    if (st == DuckDBSuccess) {
        duckdb_destroy_result(&tmp);
        write_int_to_var(0);
    } else {
        duckdb_destroy_result(&tmp);
        write_int_to_var(-2);
    }
#else
    write_int_to_var(-100);
#endif
    return 0;
}

// duckdb_query handle, "sql", var_result_handle
HSPDUCKDB_EXPORT BOOL WINAPI duckdb_query(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    const char* sql = getstr();
    DbState* d = get_db(h);
    if (!d || !sql) { write_int_to_var(-1); return 0; }
#if HSPDUCKDB_HAVE
    int rh = alloc_res_slot();
    if (rh < 0) { write_int_to_var(-2); return 0; }
    ResultState& r = g_results[rh];
    duckdb_state st = ::duckdb_query(d->con, sql, &r.res);
    if (st != DuckDBSuccess) {
        duckdb_destroy_result(&r.res);
        write_int_to_var(-3);
        return 0;
    }
    r.n_rows = duckdb_row_count(&r.res);
    r.n_cols = duckdb_column_count(&r.res);
    r.used = true;
    write_int_to_var(rh);
#else
    write_int_to_var(-100);
#endif
    return 0;
}

// duckdb_result_rows rh, var_rows
HSPDUCKDB_EXPORT BOOL WINAPI duckdb_result_rows(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int rh = getint();
    ResultState* r = get_res(rh);
    if (!r) { write_int_to_var(-1); return 0; }
#if HSPDUCKDB_HAVE
    write_int_to_var((int)r->n_rows);
#else
    write_int_to_var(-100);
#endif
    return 0;
}

// duckdb_result_cols rh, var_cols
HSPDUCKDB_EXPORT BOOL WINAPI duckdb_result_cols(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int rh = getint();
    ResultState* r = get_res(rh);
    if (!r) { write_int_to_var(-1); return 0; }
#if HSPDUCKDB_HAVE
    write_int_to_var((int)r->n_cols);
#else
    write_int_to_var(-100);
#endif
    return 0;
}

// duckdb_result_col_name rh, col, var_str
HSPDUCKDB_EXPORT BOOL WINAPI duckdb_result_col_name(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int rh = getint();
    int col = getint();
#if HSPDUCKDB_HAVE
    ResultState* r = get_res(rh);
    if (!r || col < 0 || (idx_t)col >= r->n_cols) { write_str_to_var(""); return 0; }
    const char* name = duckdb_column_name(&r->res, (idx_t)col);
    write_str_to_var(name ? name : "");
#else
    (void)rh; (void)col;
    write_str_to_var("");
#endif
    return 0;
}

// duckdb_result_cell_str rh, row, col, var_str
HSPDUCKDB_EXPORT BOOL WINAPI duckdb_result_cell_str(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int rh  = getint();
    int row = getint();
    int col = getint();
#if HSPDUCKDB_HAVE
    ResultState* r = get_res(rh);
    if (!r || row < 0 || col < 0 || (idx_t)row >= r->n_rows || (idx_t)col >= r->n_cols) {
        write_str_to_var(""); return 0;
    }
    char* s = duckdb_value_varchar(&r->res, (idx_t)col, (idx_t)row);
    if (!s) { write_str_to_var(""); return 0; }
    write_str_to_var(s);
    duckdb_free(s);
#else
    (void)rh; (void)row; (void)col;
    write_str_to_var("");
#endif
    return 0;
}

// duckdb_result_cell_dbl rh, row, col, var_dbl
HSPDUCKDB_EXPORT BOOL WINAPI duckdb_result_cell_dbl(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int rh  = getint();
    int row = getint();
    int col = getint();
#if HSPDUCKDB_HAVE
    ResultState* r = get_res(rh);
    if (!r || row < 0 || col < 0 || (idx_t)row >= r->n_rows || (idx_t)col >= r->n_cols) {
        write_double_to_var(0.0); return 0;
    }
    double v = duckdb_value_double(&r->res, (idx_t)col, (idx_t)row);
    write_double_to_var(v);
#else
    (void)rh; (void)row; (void)col;
    write_double_to_var(0.0);
#endif
    return 0;
}

// duckdb_result_free rh
HSPDUCKDB_EXPORT BOOL WINAPI duckdb_result_free(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int rh = getint();
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
