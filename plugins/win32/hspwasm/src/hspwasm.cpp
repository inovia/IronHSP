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

// 新形式 (typed #func) 移行済。HSPEXINFO / HspFunc_prm_* 非依存。

// ---------- Wasm3 ----------
//
// 注意: Wasm3 の実ソースは本リポジトリには vendor していない。
// plugins/win32/hspwasm/third_party/wasm3/README.md に記載の手順で
// `git clone https://github.com/wasm3/wasm3` を実行してから build する。
//
// vcxproj 側で third_party\wasm3\source\*.c を ClCompile に追加し、
// AdditionalIncludeDirectories に third_party\wasm3\source を加える。
//
#if __has_include("wasm3.h")
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
// HSP exports (新形式 typed #func)
//   DLL 実体名は hspwasm_xxx にプレフィックス。.as 側で HSP コマンド名と分離。
// ============================================================

// wasm_load "path", var_hid
HSPWASM_EXPORT int __stdcall hspwasm_load(const char* path, int* out_h)
{
    if (out_h) *out_h = -1;
    if (!path) return -1;

    FILE* fp = fopen(path, "rb");
    if (!fp) { if (out_h) *out_h = -10; return 0; }
    fseek(fp, 0, SEEK_END);
    long sz = ftell(fp);
    fseek(fp, 0, SEEK_SET);
    if (sz <= 0) { fclose(fp); if (out_h) *out_h = -11; return 0; }
    std::vector<uint8_t> buf((size_t)sz);
    size_t got = fread(buf.data(), 1, (size_t)sz, fp);
    fclose(fp);
    if (got != (size_t)sz) { if (out_h) *out_h = -12; return 0; }

    int h = load_from_bytes(std::move(buf));
    if (out_h) *out_h = h;
    return 0;
}

// wasm_load_mem var_buf, len, var_hid
HSPWASM_EXPORT int __stdcall hspwasm_load_mem(void* src, int len, int* out_h)
{
    if (out_h) *out_h = -1;
    if (!src || len <= 0) return 0;
    std::vector<uint8_t> bytes((size_t)len);
    memcpy(bytes.data(), src, (size_t)len);
    int h = load_from_bytes(std::move(bytes));
    if (out_h) *out_h = h;
    return 0;
}

// wasm_close hid
HSPWASM_EXPORT int __stdcall hspwasm_close(int h)
{
    free_slot(h);
    return 0;
}

// wasm_clear
HSPWASM_EXPORT int __stdcall hspwasm_clear()
{
    for (int i = 0; i < (int)g_modules.size(); ++i) free_slot(i);
    return 0;
}

// wasm_memory_size hid, var_int
HSPWASM_EXPORT int __stdcall hspwasm_memory_size(int h, int* out)
{
    if (out) *out = -1;
    ModuleState* m = get_slot(h);
    if (!m) return 0;
#if HSPWASM_HAVE_WASM3
    uint32_t sz = m3_GetMemorySize(m->runtime);
    if (out) *out = (int)sz;
#else
    if (out) *out = -100;
#endif
    return 0;
}

// wasm_memory_read hid, offset, var_dst, len, var_int_result
HSPWASM_EXPORT int __stdcall hspwasm_memory_read(int h, int off, void* dst, int len, int* out_rc)
{
    if (out_rc) *out_rc = -1;
    ModuleState* m = get_slot(h);
    if (!m || !dst || len <= 0) return 0;
#if HSPWASM_HAVE_WASM3
    uint32_t mem_sz = 0;
    uint8_t* mem = (uint8_t*)m3_GetMemory(m->runtime, &mem_sz, 0);
    if (!mem) { if (out_rc) *out_rc = -2; return 0; }
    if ((uint32_t)off + (uint32_t)len > mem_sz) { if (out_rc) *out_rc = -3; return 0; }
    memcpy(dst, mem + off, (size_t)len);
    if (out_rc) *out_rc = 0;
#else
    if (out_rc) *out_rc = -100;
#endif
    return 0;
}

// wasm_memory_write hid, offset, var_src, len, var_int_result
HSPWASM_EXPORT int __stdcall hspwasm_memory_write(int h, int off, void* src, int len, int* out_rc)
{
    if (out_rc) *out_rc = -1;
    ModuleState* m = get_slot(h);
    if (!m || !src || len <= 0) return 0;
#if HSPWASM_HAVE_WASM3
    uint32_t mem_sz = 0;
    uint8_t* mem = (uint8_t*)m3_GetMemory(m->runtime, &mem_sz, 0);
    if (!mem) { if (out_rc) *out_rc = -2; return 0; }
    if ((uint32_t)off + (uint32_t)len > mem_sz) { if (out_rc) *out_rc = -3; return 0; }
    memcpy(mem + off, src, (size_t)len);
    if (out_rc) *out_rc = 0;
#else
    if (out_rc) *out_rc = -100;
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

// wasm_call_i hid, "name", array_args, argc, var_int_ret
HSPWASM_EXPORT int __stdcall hspwasm_call_i(int h, const char* name,
                                            int* args, int argc, int* out_ret)
{
    if (out_ret) *out_ret = -1;
    ModuleState* m = get_slot(h);
    if (!m || !name) return 0;
#if HSPWASM_HAVE_WASM3
    int32_t ret = 0;
    if (!call_fn_i32args(m->runtime, name, args, argc, &ret, sizeof(ret))) {
        if (out_ret) *out_ret = -2;
        return 0;
    }
    if (out_ret) *out_ret = (int)ret;
#else
    (void)args; (void)argc;
    if (out_ret) *out_ret = -100;
#endif
    return 0;
}

// wasm_call_i64 hid, "name", array_args, argc, var_double (i64 を double bit-cast)
HSPWASM_EXPORT int __stdcall hspwasm_call_i64(int h, const char* name,
                                              int* args, int argc, double* out_ret)
{
    if (out_ret) *out_ret = 0.0;
    ModuleState* m = get_slot(h);
    if (!m || !name) return 0;
#if HSPWASM_HAVE_WASM3
    int64_t ret64 = 0;
    if (!call_fn_i32args(m->runtime, name, args, argc, &ret64, sizeof(ret64))) {
        return 0;
    }
    if (out_ret) memcpy(out_ret, &ret64, sizeof(double));
#else
    (void)args; (void)argc;
#endif
    return 0;
}

// wasm_call_d hid, "name", array_args, argc, var_double (f64 戻り)
HSPWASM_EXPORT int __stdcall hspwasm_call_d(int h, const char* name,
                                            int* args, int argc, double* out_ret)
{
    if (out_ret) *out_ret = 0.0;
    ModuleState* m = get_slot(h);
    if (!m || !name) return 0;
#if HSPWASM_HAVE_WASM3
    double ret = 0.0;
    if (!call_fn_i32args(m->runtime, name, args, argc, &ret, sizeof(ret))) {
        return 0;
    }
    if (out_ret) *out_ret = ret;
#else
    (void)args; (void)argc;
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
