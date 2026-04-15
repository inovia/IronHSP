//============================================================
//   hspwasm.dll — WebAssembly (Wasm3) host plugin for IronHSP
//
//   Wasm3 (pure C, interpreter-only) を embed した HSP プラグイン。
//   HSP から .wasm モジュールを load し、エクスポート関数を呼び、
//   linear memory を read/write できる薄いラッパ。
//
//   v1 スコープ:
//     - module load/close (file / memory), 16 並列ハンドル
//     - call_i / call_i64 / call_d (i32/i64/f32/f64 引数/戻り)
//     - memory_size / memory_read / memory_write
//   v2 以降:
//     - host imports (#defcbcom thunk 流用)
//     - WASI (fd_write / fd_read / pre-opened dir)
//
//   HSP API (全て OLDDLL $202 signature):
//     wasm_load     "path",           var_hid
//     wasm_load_mem var_buf, len,     var_hid
//     wasm_close    hid
//     wasm_clear
//     wasm_memory_size  hid,                          var_int
//     wasm_memory_read  hid, offset, var_dst, len,    var_int
//     wasm_memory_write hid, offset, var_src, len,    var_int
//     wasm_call_i       hid, "name", array_args, argc, var_ret
//     wasm_call_i64     hid, "name", array_args, argc, var_ret  (var_ret は double として i64 格納)
//     wasm_call_d       hid, "name", array_args, argc, var_dbl  (double 戻り)
//
//   NOTE: 引数配列は全て int[] で渡す (i32 のみ)。f32/f64 引数 や 混在型は
//         今回非対応。Rust / C の多くの compute 関数は i32-only で十分。
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

// ---------- HSP SDK ----------
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

// ---------- Wasm3 ----------
//
// 注意: Wasm3 の実ソースは本リポジトリには vendor していない。
// plugins/win32/hspwasm/third_party/wasm3/README.md に記載の手順で
// `git clone https://github.com/wasm3/wasm3` を実行してから build する。
//
// vcxproj 側で third_party\wasm3\source\*.c を ClCompile に追加し、
// AdditionalIncludeDirectories に third_party\wasm3\source を加える。
//
#if __has_include("m3_api_defs.h")
  #include "wasm3.h"
  #define HSPWASM_HAVE_WASM3 1
#else
  // ビルド時に wasm3 未配置だと __has_include が false となり、
  // stub で DLL はビルド可能 (実行時に "wasm3 not linked" を返す)。
  // README の手順で clone すれば自動的に有効化される。
  #define HSPWASM_HAVE_WASM3 0
  typedef struct M3Environment* IM3Environment;
  typedef struct M3Runtime*     IM3Runtime;
  typedef struct M3Module*      IM3Module;
  typedef struct M3Function*    IM3Function;
  typedef const char*           M3Result;
  static const char* m3Err_none = nullptr;
#endif

#define HSPWASM_EXPORT extern "C" __declspec(dllexport)

// ============================================================
// HSP helpers (hspjson.cpp と同等)
// ============================================================
namespace {

HSPEXINFO* g_hei = nullptr;
inline void   set_hei(HSPEXINFO* hei) { g_hei = hei; }
inline int    getint() { return g_hei->HspFunc_prm_geti(); }
inline char*  getstr() { return g_hei->HspFunc_prm_gets(); }
inline double getdbl() { return g_hei->HspFunc_prm_getd(); }

// getva で PVal* を取得 (変数引数). APTR は offset。
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

// 変数の生バッファ先頭とサイズを取る
static void* get_var_rawptr(PVal* pv) {
    if (!pv) return nullptr;
    HspVarProc* proc = g_hei->HspFunc_getproc(pv->flag);
    pv->offset = 0;
    return proc->GetPtr(pv);
}

// int 配列の先頭アドレスを取る (array 引数受け取り用)
static int* get_int_array(PVal* pv) {
    if (!pv || pv->flag != HSPVAR_FLAG_INT) return nullptr;
    return (int*)get_var_rawptr(pv);
}

} // namespace

// ============================================================
// Module handle table
// ============================================================
struct ModuleState {
    bool          used = false;
    IM3Environment env = nullptr;
    IM3Runtime    runtime = nullptr;
    IM3Module     module = nullptr;
    std::vector<uint8_t> wasm_bytes;  // LoadModule はバイト列所有権を runtime 側に移すが
                                      // ParseModule に渡したバッファは runtime 破棄まで
                                      // 生存していなければならないので保持する。
};

static std::array<ModuleState, 16> g_modules;

static int alloc_slot() {
    for (int i = 0; i < (int)g_modules.size(); ++i) {
        if (!g_modules[i].used) return i;
    }
    return -1;
}

static void free_slot(int h) {
    if (h < 0 || h >= (int)g_modules.size()) return;
    ModuleState& m = g_modules[h];
    if (!m.used) return;
#if HSPWASM_HAVE_WASM3
    if (m.runtime) m3_FreeRuntime(m.runtime);
    if (m.env)     m3_FreeEnvironment(m.env);
#endif
    m.runtime = nullptr;
    m.env = nullptr;
    m.module = nullptr;
    m.wasm_bytes.clear();
    m.wasm_bytes.shrink_to_fit();
    m.used = false;
}

static ModuleState* get_slot(int h) {
    if (h < 0 || h >= (int)g_modules.size()) return nullptr;
    if (!g_modules[h].used) return nullptr;
    return &g_modules[h];
}

// ---- common: raw bytes から 1 つの module を runtime に load ----
static int load_from_bytes(std::vector<uint8_t>&& bytes) {
#if !HSPWASM_HAVE_WASM3
    (void)bytes;
    return -100; // wasm3 not linked (vendor 未配置)
#else
    int h = alloc_slot();
    if (h < 0) return -1;            // ハンドル満杯
    ModuleState& m = g_modules[h];
    m.wasm_bytes = std::move(bytes);

    const uint32_t STACK_SIZE = 64 * 1024;

    m.env = m3_NewEnvironment();
    if (!m.env) { free_slot(h); return -2; }

    m.runtime = m3_NewRuntime(m.env, STACK_SIZE, nullptr);
    if (!m.runtime) { free_slot(h); return -3; }

    M3Result r = m3_ParseModule(m.env, &m.module,
                                m.wasm_bytes.data(),
                                (uint32_t)m.wasm_bytes.size());
    if (r) { free_slot(h); return -4; }

    r = m3_LoadModule(m.runtime, m.module);
    if (r) { free_slot(h); return -5; }

    m.used = true;
    return h;
#endif
}

// ============================================================
// HSP exports
// ============================================================

// wasm_load "path", var_hid
HSPWASM_EXPORT BOOL WINAPI wasm_load(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    const char* path = getstr();
    if (!path) { write_int_to_var(-1); return 0; }

    FILE* fp = fopen(path, "rb");
    if (!fp) { write_int_to_var(-10); return 0; }
    fseek(fp, 0, SEEK_END);
    long sz = ftell(fp);
    fseek(fp, 0, SEEK_SET);
    if (sz <= 0) { fclose(fp); write_int_to_var(-11); return 0; }
    std::vector<uint8_t> buf((size_t)sz);
    size_t got = fread(buf.data(), 1, (size_t)sz, fp);
    fclose(fp);
    if (got != (size_t)sz) { write_int_to_var(-12); return 0; }

    int h = load_from_bytes(std::move(buf));
    write_int_to_var(h);
    return 0;
}

// wasm_load_mem var_buf, len, var_hid
HSPWASM_EXPORT BOOL WINAPI wasm_load_mem(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    APTR a;
    PVal* pv = getva_pval(&a);
    int len = getint();
    if (!pv || len <= 0) { write_int_to_var(-1); return 0; }
    void* src = get_var_rawptr(pv);
    if (!src) { write_int_to_var(-2); return 0; }

    std::vector<uint8_t> bytes((size_t)len);
    memcpy(bytes.data(), src, (size_t)len);
    int h = load_from_bytes(std::move(bytes));
    write_int_to_var(h);
    return 0;
}

// wasm_close hid
HSPWASM_EXPORT BOOL WINAPI wasm_close(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    free_slot(h);
    return 0;
}

// wasm_clear
HSPWASM_EXPORT BOOL WINAPI wasm_clear(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)hei; (void)p1; (void)p2; (void)p3;
    for (int i = 0; i < (int)g_modules.size(); ++i) free_slot(i);
    return 0;
}

// wasm_memory_size hid, var_int
HSPWASM_EXPORT BOOL WINAPI wasm_memory_size(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    ModuleState* m = get_slot(h);
    if (!m) { write_int_to_var(-1); return 0; }
#if HSPWASM_HAVE_WASM3
    uint32_t sz = m3_GetMemorySize(m->runtime);
    write_int_to_var((int)sz);
#else
    write_int_to_var(-100);
#endif
    return 0;
}

// wasm_memory_read hid, offset, var_dst, len, var_int_result
HSPWASM_EXPORT BOOL WINAPI wasm_memory_read(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    int off = getint();
    APTR a;
    PVal* pv_dst = getva_pval(&a);
    int len = getint();
    ModuleState* m = get_slot(h);
    if (!m || !pv_dst || len <= 0) { write_int_to_var(-1); return 0; }

#if HSPWASM_HAVE_WASM3
    uint32_t mem_sz = 0;
    uint8_t* mem = (uint8_t*)m3_GetMemory(m->runtime, &mem_sz, 0);
    if (!mem) { write_int_to_var(-2); return 0; }
    if ((uint32_t)off + (uint32_t)len > mem_sz) { write_int_to_var(-3); return 0; }
    void* dst = get_var_rawptr(pv_dst);
    if (!dst) { write_int_to_var(-4); return 0; }
    memcpy(dst, mem + off, (size_t)len);
    write_int_to_var(0);
#else
    write_int_to_var(-100);
#endif
    return 0;
}

// wasm_memory_write hid, offset, var_src, len, var_int_result
HSPWASM_EXPORT BOOL WINAPI wasm_memory_write(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    int off = getint();
    APTR a;
    PVal* pv_src = getva_pval(&a);
    int len = getint();
    ModuleState* m = get_slot(h);
    if (!m || !pv_src || len <= 0) { write_int_to_var(-1); return 0; }

#if HSPWASM_HAVE_WASM3
    uint32_t mem_sz = 0;
    uint8_t* mem = (uint8_t*)m3_GetMemory(m->runtime, &mem_sz, 0);
    if (!mem) { write_int_to_var(-2); return 0; }
    if ((uint32_t)off + (uint32_t)len > mem_sz) { write_int_to_var(-3); return 0; }
    void* src = get_var_rawptr(pv_src);
    if (!src) { write_int_to_var(-4); return 0; }
    memcpy(mem + off, src, (size_t)len);
    write_int_to_var(0);
#else
    write_int_to_var(-100);
#endif
    return 0;
}

// ============================================================
// call helpers
// ============================================================
//
// Wasm3 の関数呼び出しは:
//   M3Result m3_Call(IM3Function fn, uint32_t argc, const void** argv);
// ここで argv[i] は **各引数のアドレス** を持つ配列。
// (値そのものではない) i32 引数なら &int32_t の配列。
//
// 戻り値は:
//   m3_GetResultsV(fn, &out) / m3_GetResults(fn, retc, const void** retp)
// retp[i] は **書き込み先アドレス** の配列。i32 戻り値なら &int32_t を渡す。
//

#if HSPWASM_HAVE_WASM3
static bool call_fn_i32args(IM3Runtime runtime, const char* name,
                            const int* args, int argc,
                            void* out_ret, size_t ret_size_hint)
{
    IM3Function fn = nullptr;
    if (m3_FindFunction(&fn, runtime, name)) return false;

    const void* argv[16];
    if (argc < 0) argc = 0;
    if (argc > 16) argc = 16;
    for (int i = 0; i < argc; ++i) argv[i] = &args[i];

    if (m3_Call(fn, (uint32_t)argc, argv)) return false;

    if (out_ret) {
        const void* rets[1] = { out_ret };
        (void)ret_size_hint;
        // 返り値数は関数シグネチャから決まるが、呼び出し側が望む
        // 1 つだけ取りに行く。0 なら何もしない。
        if (m3_GetResults(fn, 1, rets)) {
            // 戻り値がない関数の場合はゼロ埋めしてる想定にする
        }
    }
    return true;
}
#endif

// wasm_call_i hid, "name", array_args, argc, var_ret
HSPWASM_EXPORT BOOL WINAPI wasm_call_i(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    const char* name = getstr();
    APTR a;
    PVal* pv_args = getva_pval(&a);
    int argc = getint();
    ModuleState* m = get_slot(h);
    if (!m || !name) { write_int_to_var(-1); return 0; }

#if HSPWASM_HAVE_WASM3
    int* args = get_int_array(pv_args);
    int32_t ret = 0;
    if (!call_fn_i32args(m->runtime, name, args, argc, &ret, sizeof(ret))) {
        write_int_to_var(-2); return 0;
    }
    write_int_to_var((int)ret);
#else
    write_int_to_var(-100);
#endif
    return 0;
}

// wasm_call_i64 hid, "name", array_args, argc, var_double (i64 を double bit-cast)
// HSP は int64 型を持たないので、double 変数にビットパターン格納して返す。
// HSP 側で double → int64 reinterpret するか、下位 32bit だけ使うのが現実的。
HSPWASM_EXPORT BOOL WINAPI wasm_call_i64(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    const char* name = getstr();
    APTR a;
    PVal* pv_args = getva_pval(&a);
    int argc = getint();
    ModuleState* m = get_slot(h);
    if (!m || !name) { write_double_to_var(0.0); return 0; }

#if HSPWASM_HAVE_WASM3
    int* args = get_int_array(pv_args);
    int64_t ret64 = 0;
    if (!call_fn_i32args(m->runtime, name, args, argc, &ret64, sizeof(ret64))) {
        write_double_to_var(0.0); return 0;
    }
    double d;
    memcpy(&d, &ret64, sizeof(d));
    write_double_to_var(d);
#else
    write_double_to_var(0.0);
#endif
    return 0;
}

// wasm_call_d hid, "name", array_args, argc, var_double (f64 戻り)
HSPWASM_EXPORT BOOL WINAPI wasm_call_d(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    const char* name = getstr();
    APTR a;
    PVal* pv_args = getva_pval(&a);
    int argc = getint();
    ModuleState* m = get_slot(h);
    if (!m || !name) { write_double_to_var(0.0); return 0; }

#if HSPWASM_HAVE_WASM3
    int* args = get_int_array(pv_args);
    double ret = 0.0;
    if (!call_fn_i32args(m->runtime, name, args, argc, &ret, sizeof(ret))) {
        write_double_to_var(0.0); return 0;
    }
    write_double_to_var(ret);
#else
    write_double_to_var(0.0);
#endif
    return 0;
}

// ============================================================
// DllMain
// ============================================================
BOOL WINAPI DllMain(HINSTANCE, DWORD reason, LPVOID) {
    if (reason == DLL_PROCESS_DETACH) {
        for (int i = 0; i < (int)g_modules.size(); ++i) free_slot(i);
    }
    return TRUE;
}
