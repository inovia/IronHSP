//============================================================
//   hspdb.dll — SQLite 3 wrapper for HSP
//
//   SQLite amalgamation (sqlite3.c single file) を同梱して HSP から
//   SQLite データベースを操作できるようにするヘルパ DLL。
//
//   API (全 3 系統):
//     1. DB open/close
//     2. exec (SQL 1 文を実行)
//     3. query (SELECT 結果を 1 行ずつ取得)
//
//   エクスポート:
//     int  db_open(const char* path) → handle
//     int  db_exec(int handle, const char* sql) → SQLite error code
//     int  db_query(int handle, const char* sql) → query handle (qh)
//     int  db_step(int qh) → 1=行あり / 0=終端 / <0=エラー
//     int  db_col_count(int qh)
//     int  db_col_name(int qh, int col, char* buf, int len)
//     int  db_col_text(int qh, int col, char* buf, int len)
//     int  db_col_int(int qh, int col)
//     double db_col_dbl(int qh, int col)
//     void db_query_close(int qh)
//     int  db_last_rowid(int handle) → 直前の INSERT の rowid
//     int  db_changes(int handle) → 直前の INSERT/UPDATE/DELETE の行数
//     const char* db_errmsg(int handle)
//     void db_close(int handle)
//============================================================

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <cstring>
#include <cstdlib>

#include "sqlite3.h"

#pragma comment(lib, "kernel32.lib")

#define HSPDB_EXPORT extern "C" __declspec(dllexport)

namespace {

constexpr int MAX_DB = 32;
constexpr int MAX_QUERY = 64;

struct DbState {
    bool active = false;
    sqlite3* db = nullptr;
};

struct QueryState {
    bool active = false;
    int db_handle = -1;
    sqlite3_stmt* stmt = nullptr;
};

static DbState g_dbs[MAX_DB];
static QueryState g_queries[MAX_QUERY];

int FindFreeDb() {
    for (int i = 0; i < MAX_DB; i++) if (!g_dbs[i].active) return i;
    return -1;
}

int FindFreeQuery() {
    for (int i = 0; i < MAX_QUERY; i++) if (!g_queries[i].active) return i;
    return -1;
}

} // namespace

//============================================================
// Exports
//============================================================

HSPDB_EXPORT int __stdcall db_open(const char* path) {
    if (!path) return -1;
    int handle = FindFreeDb();
    if (handle < 0) return -1;
    DbState& s = g_dbs[handle];

    int rc = sqlite3_open(path, &s.db);
    if (rc != SQLITE_OK || !s.db) {
        if (s.db) sqlite3_close(s.db);
        s.db = nullptr;
        return -1;
    }
    s.active = true;
    return handle;
}

HSPDB_EXPORT int __stdcall db_exec(int handle, const char* sql) {
    if (handle < 0 || handle >= MAX_DB) return -1;
    DbState& s = g_dbs[handle];
    if (!s.active || !s.db || !sql) return -1;
    char* errmsg = nullptr;
    int rc = sqlite3_exec(s.db, sql, NULL, NULL, &errmsg);
    if (errmsg) sqlite3_free(errmsg);
    return rc;
}

HSPDB_EXPORT int __stdcall db_query(int handle, const char* sql) {
    if (handle < 0 || handle >= MAX_DB) return -1;
    DbState& s = g_dbs[handle];
    if (!s.active || !s.db || !sql) return -1;

    int qh = FindFreeQuery();
    if (qh < 0) return -1;
    QueryState& q = g_queries[qh];
    q.db_handle = handle;
    q.stmt = nullptr;

    int rc = sqlite3_prepare_v2(s.db, sql, -1, &q.stmt, NULL);
    if (rc != SQLITE_OK || !q.stmt) {
        q.stmt = nullptr;
        return -1;
    }
    q.active = true;
    return qh;
}

HSPDB_EXPORT int __stdcall db_step(int qh) {
    if (qh < 0 || qh >= MAX_QUERY) return -1;
    QueryState& q = g_queries[qh];
    if (!q.active || !q.stmt) return -1;
    int rc = sqlite3_step(q.stmt);
    if (rc == SQLITE_ROW) return 1;
    if (rc == SQLITE_DONE) return 0;
    return -1;
}

HSPDB_EXPORT int __stdcall db_col_count(int qh) {
    if (qh < 0 || qh >= MAX_QUERY) return 0;
    QueryState& q = g_queries[qh];
    if (!q.active || !q.stmt) return 0;
    return sqlite3_column_count(q.stmt);
}

HSPDB_EXPORT int __stdcall db_col_name(int qh, int col, char* buf, int buflen) {
    if (qh < 0 || qh >= MAX_QUERY || !buf || buflen <= 0) return -1;
    QueryState& q = g_queries[qh];
    if (!q.active || !q.stmt) return -1;
    const char* name = sqlite3_column_name(q.stmt, col);
    if (!name) { buf[0] = 0; return 0; }
    int n = (int)strlen(name);
    if (n >= buflen) n = buflen - 1;
    memcpy(buf, name, n);
    buf[n] = 0;
    return n;
}

HSPDB_EXPORT int __stdcall db_col_text(int qh, int col, char* buf, int buflen) {
    if (qh < 0 || qh >= MAX_QUERY || !buf || buflen <= 0) return -1;
    QueryState& q = g_queries[qh];
    if (!q.active || !q.stmt) return -1;
    const unsigned char* txt = sqlite3_column_text(q.stmt, col);
    if (!txt) { buf[0] = 0; return 0; }
    int n = (int)strlen((const char*)txt);
    if (n >= buflen) n = buflen - 1;
    memcpy(buf, txt, n);
    buf[n] = 0;
    return n;
}

HSPDB_EXPORT int __stdcall db_col_int(int qh, int col) {
    if (qh < 0 || qh >= MAX_QUERY) return 0;
    QueryState& q = g_queries[qh];
    if (!q.active || !q.stmt) return 0;
    return sqlite3_column_int(q.stmt, col);
}

HSPDB_EXPORT double __stdcall db_col_dbl(int qh, int col) {
    if (qh < 0 || qh >= MAX_QUERY) return 0.0;
    QueryState& q = g_queries[qh];
    if (!q.active || !q.stmt) return 0.0;
    return sqlite3_column_double(q.stmt, col);
}

HSPDB_EXPORT void __stdcall db_query_close(int qh) {
    if (qh < 0 || qh >= MAX_QUERY) return;
    QueryState& q = g_queries[qh];
    if (!q.active) return;
    if (q.stmt) {
        sqlite3_finalize(q.stmt);
        q.stmt = nullptr;
    }
    q.active = false;
    q.db_handle = -1;
}

HSPDB_EXPORT int __stdcall db_last_rowid(int handle) {
    if (handle < 0 || handle >= MAX_DB) return -1;
    DbState& s = g_dbs[handle];
    if (!s.active || !s.db) return -1;
    return (int)sqlite3_last_insert_rowid(s.db);
}

HSPDB_EXPORT int __stdcall db_changes(int handle) {
    if (handle < 0 || handle >= MAX_DB) return -1;
    DbState& s = g_dbs[handle];
    if (!s.active || !s.db) return -1;
    return sqlite3_changes(s.db);
}

HSPDB_EXPORT int __stdcall db_errmsg(int handle, char* buf, int buflen) {
    if (handle < 0 || handle >= MAX_DB || !buf || buflen <= 0) return -1;
    DbState& s = g_dbs[handle];
    if (!s.active || !s.db) return -1;
    const char* msg = sqlite3_errmsg(s.db);
    if (!msg) { buf[0] = 0; return 0; }
    int n = (int)strlen(msg);
    if (n >= buflen) n = buflen - 1;
    memcpy(buf, msg, n);
    buf[n] = 0;
    return n;
}

HSPDB_EXPORT void __stdcall db_close(int handle) {
    if (handle < 0 || handle >= MAX_DB) return;
    DbState& s = g_dbs[handle];
    if (!s.active) return;

    // Close outstanding queries for this DB
    for (int q = 0; q < MAX_QUERY; q++) {
        if (g_queries[q].active && g_queries[q].db_handle == handle) {
            db_query_close(q);
        }
    }

    if (s.db) {
        sqlite3_close(s.db);
        s.db = nullptr;
    }
    s.active = false;
}

BOOL WINAPI DllMain(HMODULE, DWORD reason, LPVOID) {
    if (reason == DLL_PROCESS_DETACH) {
        for (int q = 0; q < MAX_QUERY; q++) if (g_queries[q].active) db_query_close(q);
        for (int d = 0; d < MAX_DB;    d++) if (g_dbs[d].active)     db_close(d);
    }
    return TRUE;
}
