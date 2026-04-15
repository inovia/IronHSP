//============================================================
//   hsponnx.dll v2 — ONNX Runtime host plugin for IronHSP
//
//   Microsoft ONNX Runtime (onnxruntime_c_api.h) を embed して、
//   HSP から .onnx モデルを load / run できる薄いラッパ。
//   DirectML execution provider によるGPU推論にも対応する。
//
//   v2 (2026-04-15): OLDDLL $202 → typed #func 形式に全面移行。
//   HSPEXINFO callback は一切使わず、各 export 関数は普通の C 関数。
//
//   v1 スコープ:
//     - Session 16 並列ハンドル
//     - Model load (ファイルパス)
//     - Input / Output meta 取得 (count / name / shape / rank)
//     - 1 input / 1 output, float32 tensor の単純な run
//     - DML / CPU backend 切り替え
//
//   HSP API (全て typed #func):
//     onnx_init
//     onnx_shutdown
//     onnx_load_model     "path", var_h
//     onnx_close           h
//     onnx_input_count     h, var_int
//     onnx_input_name      h, idx, var_buf, buf_size
//     onnx_input_shape     h, idx, var_shape, var_rank
//     onnx_output_count    h, var_int
//     onnx_output_name     h, idx, var_buf, buf_size
//     onnx_output_shape    h, idx, var_shape, var_rank
//     onnx_set_backend_dml h
//     onnx_set_backend_cpu h
//     onnx_run             h, var_in_buf, var_in_shape, in_rank,
//                             var_out_buf, var_out_shape, var_out_rank
//
//   NOTE:
//     - __has_include("onnxruntime_c_api.h") が false の環境では
//       stub ビルドとなり、全関数は -100 / 0 を返す。
//     - onnxruntime.dll / DirectML.dll は実行時に同ディレクトリに配置。
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

// ---------- ONNX Runtime ----------
//
// 注意: onnxruntime の header / .lib / .dll は本リポジトリに vendor して
// いない。third_party/onnxruntime/README.md に従い NuGet or zip から
// 配置してからビルドすること。
//
#if __has_include("onnxruntime_c_api.h")
  #include "onnxruntime_c_api.h"
  #if __has_include("dml_provider_factory.h")
    #include "dml_provider_factory.h"
    #define HSPONNX_HAVE_DML 1
  #else
    #define HSPONNX_HAVE_DML 0
  #endif
  #define HSPONNX_HAVE_ORT 1
#else
  #define HSPONNX_HAVE_ORT 0
  #define HSPONNX_HAVE_DML 0
  // minimal forward decl so the stub compiles without the header
  struct OrtApi;
  struct OrtEnv;
  struct OrtSession;
  struct OrtSessionOptions;
  struct OrtAllocator;
  struct OrtMemoryInfo;
  struct OrtValue;
  typedef struct OrtStatus OrtStatus;
#endif

#define HSPONNX_EXPORT extern "C" __declspec(dllexport)

// ============================================================
// 共通 helpers
// ============================================================
namespace {

static void copy_to_buf(const char* src, char* out, int out_size) {
    if (!out || out_size <= 0) return;
    if (!src) src = "";
    int n = (int)strlen(src);
    if (n >= out_size) n = out_size - 1;
    if (n > 0) memcpy(out, src, (size_t)n);
    out[n] = 0;
}

} // namespace

// ============================================================
// Session handle table
// ============================================================
struct SessionState {
    bool              used = false;
    OrtSession*       session = nullptr;
    OrtSessionOptions* options = nullptr;
    int               backend = 0; // 0=CPU, 1=DML
    std::wstring      model_path;
};

static std::array<SessionState, 16> g_sessions;

#if HSPONNX_HAVE_ORT
static const OrtApi* g_ort = nullptr;
static OrtEnv*       g_env = nullptr;
#endif

static int alloc_slot() {
    for (int i = 0; i < (int)g_sessions.size(); ++i) {
        if (!g_sessions[i].used) return i;
    }
    return -1;
}

static void free_slot(int h) {
    if (h < 0 || h >= (int)g_sessions.size()) return;
    SessionState& s = g_sessions[h];
    if (!s.used) return;
#if HSPONNX_HAVE_ORT
    if (g_ort) {
        if (s.session) g_ort->ReleaseSession(s.session);
        if (s.options) g_ort->ReleaseSessionOptions(s.options);
    }
#endif
    s.session = nullptr;
    s.options = nullptr;
    s.model_path.clear();
    s.used = false;
}

static SessionState* get_slot(int h) {
    if (h < 0 || h >= (int)g_sessions.size()) return nullptr;
    if (!g_sessions[h].used) return nullptr;
    return &g_sessions[h];
}

// ============================================================
// HSP exports (typed #func 新形式)
// ============================================================

// onnx_init
HSPONNX_EXPORT int __stdcall onnx_init() {
#if HSPONNX_HAVE_ORT
    if (!g_ort) {
        g_ort = OrtGetApiBase()->GetApi(ORT_API_VERSION);
    }
    if (g_ort && !g_env) {
        g_ort->CreateEnv(ORT_LOGGING_LEVEL_WARNING, "hsponnx", &g_env);
    }
#endif
    return 0;
}

// onnx_shutdown
HSPONNX_EXPORT int __stdcall onnx_shutdown() {
    for (int i = 0; i < (int)g_sessions.size(); ++i) free_slot(i);
#if HSPONNX_HAVE_ORT
    if (g_ort && g_env) {
        g_ort->ReleaseEnv(g_env);
        g_env = nullptr;
    }
    g_ort = nullptr;
#endif
    return 0;
}

// onnx_load_model "path", var_h
HSPONNX_EXPORT int __stdcall onnx_load_model(const char* path, int* out_h) {
    if (!out_h) return -1;
    *out_h = -1;
    if (!path) return 0;

#if !HSPONNX_HAVE_ORT
    *out_h = -100; // not linked
    return 0;
#else
    if (!g_ort || !g_env) {
        if (!g_ort) g_ort = OrtGetApiBase()->GetApi(ORT_API_VERSION);
        if (g_ort && !g_env)
            g_ort->CreateEnv(ORT_LOGGING_LEVEL_WARNING, "hsponnx", &g_env);
    }
    int h = alloc_slot();
    if (h < 0) { *out_h = -1; return 0; }
    SessionState& s = g_sessions[h];

    int wlen = MultiByteToWideChar(CP_ACP, 0, path, -1, nullptr, 0);
    s.model_path.assign((size_t)wlen, L'\0');
    MultiByteToWideChar(CP_ACP, 0, path, -1, s.model_path.data(), wlen);

    OrtStatus* st = g_ort->CreateSessionOptions(&s.options);
    if (st) { g_ort->ReleaseStatus(st); *out_h = -2; return 0; }

    st = g_ort->CreateSession(g_env, s.model_path.c_str(), s.options, &s.session);
    if (st) {
        g_ort->ReleaseStatus(st);
        g_ort->ReleaseSessionOptions(s.options);
        s.options = nullptr;
        *out_h = -3;
        return 0;
    }

    s.used = true;
    s.backend = 0;
    *out_h = h;
    return 0;
#endif
}

// onnx_close h
HSPONNX_EXPORT int __stdcall onnx_close(int h) {
    free_slot(h);
    return 0;
}

// ---- input/output count ----
HSPONNX_EXPORT int __stdcall onnx_input_count(int h, int* out_n) {
    int n = -1;
    SessionState* s = get_slot(h);
#if HSPONNX_HAVE_ORT
    if (s && g_ort) {
        size_t cnt = 0;
        OrtStatus* st = g_ort->SessionGetInputCount(s->session, &cnt);
        if (!st) n = (int)cnt; else g_ort->ReleaseStatus(st);
    }
#else
    (void)s;
#endif
    if (out_n) *out_n = n;
    return 0;
}

HSPONNX_EXPORT int __stdcall onnx_output_count(int h, int* out_n) {
    int n = -1;
    SessionState* s = get_slot(h);
#if HSPONNX_HAVE_ORT
    if (s && g_ort) {
        size_t cnt = 0;
        OrtStatus* st = g_ort->SessionGetOutputCount(s->session, &cnt);
        if (!st) n = (int)cnt; else g_ort->ReleaseStatus(st);
    }
#else
    (void)s;
#endif
    if (out_n) *out_n = n;
    return 0;
}

// ---- input/output name ----
HSPONNX_EXPORT int __stdcall onnx_input_name(int h, int idx, char* out_buf, int out_size) {
    if (out_buf && out_size > 0) out_buf[0] = 0;
    SessionState* s = get_slot(h);
#if HSPONNX_HAVE_ORT
    if (s && g_ort) {
        OrtAllocator* alloc = nullptr;
        g_ort->GetAllocatorWithDefaultOptions(&alloc);
        char* name = nullptr;
        OrtStatus* st = g_ort->SessionGetInputName(s->session, (size_t)idx, alloc, &name);
        if (!st && name) {
            copy_to_buf(name, out_buf, out_size);
            g_ort->AllocatorFree(alloc, name);
            return 0;
        }
        if (st) g_ort->ReleaseStatus(st);
    }
#else
    (void)s; (void)idx;
#endif
    return 0;
}

HSPONNX_EXPORT int __stdcall onnx_output_name(int h, int idx, char* out_buf, int out_size) {
    if (out_buf && out_size > 0) out_buf[0] = 0;
    SessionState* s = get_slot(h);
#if HSPONNX_HAVE_ORT
    if (s && g_ort) {
        OrtAllocator* alloc = nullptr;
        g_ort->GetAllocatorWithDefaultOptions(&alloc);
        char* name = nullptr;
        OrtStatus* st = g_ort->SessionGetOutputName(s->session, (size_t)idx, alloc, &name);
        if (!st && name) {
            copy_to_buf(name, out_buf, out_size);
            g_ort->AllocatorFree(alloc, name);
            return 0;
        }
        if (st) g_ort->ReleaseStatus(st);
    }
#else
    (void)s; (void)idx;
#endif
    return 0;
}

// ---- shape helper ----
#if HSPONNX_HAVE_ORT
static int fetch_shape_io(SessionState* s, int io /*0=in,1=out*/, int idx,
                          int* out_shape, int max_dims, int* out_rank)
{
    if (!g_ort || !s) return -1;
    OrtTypeInfo* tinfo = nullptr;
    OrtStatus* st = (io == 0)
        ? g_ort->SessionGetInputTypeInfo(s->session, (size_t)idx, &tinfo)
        : g_ort->SessionGetOutputTypeInfo(s->session, (size_t)idx, &tinfo);
    if (st) { g_ort->ReleaseStatus(st); return -2; }
    const OrtTensorTypeAndShapeInfo* ti = nullptr;
    g_ort->CastTypeInfoToTensorInfo(tinfo, &ti);
    if (!ti) { g_ort->ReleaseTypeInfo(tinfo); return -3; }
    size_t dims = 0;
    g_ort->GetDimensionsCount(ti, &dims);
    std::vector<int64_t> buf(dims);
    if (dims > 0) g_ort->GetDimensions(ti, buf.data(), dims);
    int rank = (int)dims;
    if (rank > max_dims) rank = max_dims;
    for (int i = 0; i < rank; ++i) out_shape[i] = (int)buf[i];
    *out_rank = rank;
    g_ort->ReleaseTypeInfo(tinfo);
    return 0;
}
#endif

HSPONNX_EXPORT int __stdcall onnx_input_shape(int h, int idx, int* out_shape, int* out_rank) {
    SessionState* s = get_slot(h);
#if HSPONNX_HAVE_ORT
    if (s && out_shape) {
        int rank = 0;
        fetch_shape_io(s, 0, idx, out_shape, 8, &rank);
        if (out_rank) *out_rank = rank;
    } else if (out_rank) {
        *out_rank = 0;
    }
#else
    (void)s; (void)idx; (void)out_shape;
    if (out_rank) *out_rank = 0;
#endif
    return 0;
}

HSPONNX_EXPORT int __stdcall onnx_output_shape(int h, int idx, int* out_shape, int* out_rank) {
    SessionState* s = get_slot(h);
#if HSPONNX_HAVE_ORT
    if (s && out_shape) {
        int rank = 0;
        fetch_shape_io(s, 1, idx, out_shape, 8, &rank);
        if (out_rank) *out_rank = rank;
    } else if (out_rank) {
        *out_rank = 0;
    }
#else
    (void)s; (void)idx; (void)out_shape;
    if (out_rank) *out_rank = 0;
#endif
    return 0;
}

// ---- backend switching ----
HSPONNX_EXPORT int __stdcall onnx_set_backend_dml(int h) {
    SessionState* s = get_slot(h);
    if (!s) return 0;
#if HSPONNX_HAVE_ORT && HSPONNX_HAVE_DML
    if (g_ort && s->session) {
        g_ort->ReleaseSession(s->session);
        s->session = nullptr;
    }
    if (g_ort && s->options) {
        g_ort->ReleaseSessionOptions(s->options);
        s->options = nullptr;
    }
    OrtStatus* st = g_ort->CreateSessionOptions(&s->options);
    if (st) { g_ort->ReleaseStatus(st); return 0; }
    g_ort->DisableMemPattern(s->options);
    g_ort->SetSessionExecutionMode(s->options, ORT_SEQUENTIAL);
    OrtSessionOptionsAppendExecutionProvider_DML(s->options, 0);
    g_ort->CreateSession(g_env, s->model_path.c_str(), s->options, &s->session);
    s->backend = 1;
#endif
    return 0;
}

HSPONNX_EXPORT int __stdcall onnx_set_backend_cpu(int h) {
    SessionState* s = get_slot(h);
    if (!s) return 0;
#if HSPONNX_HAVE_ORT
    if (g_ort && s->session) {
        g_ort->ReleaseSession(s->session);
        s->session = nullptr;
    }
    if (g_ort && s->options) {
        g_ort->ReleaseSessionOptions(s->options);
        s->options = nullptr;
    }
    g_ort->CreateSessionOptions(&s->options);
    g_ort->CreateSession(g_env, s->model_path.c_str(), s->options, &s->session);
    s->backend = 0;
#endif
    return 0;
}

// ---- run (1 input / 1 output, float32) ----
// onnx_run h, var_in_buf, var_in_shape, in_rank,
//             var_out_buf, var_out_shape, var_out_rank
HSPONNX_EXPORT int __stdcall onnx_run(
    int h,
    void* in_data_v, int* in_shape_i, int in_rank,
    void* out_data_v, int* out_shape_i, int* out_rank_out)
{
    SessionState* s = get_slot(h);
    if (!s) return 0;
#if !HSPONNX_HAVE_ORT
    (void)in_data_v; (void)in_shape_i; (void)in_rank;
    (void)out_data_v; (void)out_shape_i; (void)out_rank_out;
    return 0;
#else
    if (!g_ort) return 0;

    float* in_data = (float*)in_data_v;
    if (!in_data || !in_shape_i || in_rank <= 0 || in_rank > 8) return 0;

    int64_t in_shape[8];
    size_t  in_count = 1;
    for (int i = 0; i < in_rank; ++i) {
        in_shape[i] = (int64_t)in_shape_i[i];
        if (in_shape[i] <= 0) in_shape[i] = 1;
        in_count *= (size_t)in_shape[i];
    }

    OrtMemoryInfo* meminfo = nullptr;
    g_ort->CreateCpuMemoryInfo(OrtArenaAllocator, OrtMemTypeDefault, &meminfo);

    OrtValue* in_tensor = nullptr;
    OrtStatus* st = g_ort->CreateTensorWithDataAsOrtValue(
        meminfo, in_data, in_count * sizeof(float),
        in_shape, (size_t)in_rank,
        ONNX_TENSOR_ELEMENT_DATA_TYPE_FLOAT, &in_tensor);
    if (st) { g_ort->ReleaseStatus(st); g_ort->ReleaseMemoryInfo(meminfo); return 0; }

    OrtAllocator* alloc = nullptr;
    g_ort->GetAllocatorWithDefaultOptions(&alloc);
    char* in_name  = nullptr;
    char* out_name = nullptr;
    g_ort->SessionGetInputName(s->session, 0, alloc, &in_name);
    g_ort->SessionGetOutputName(s->session, 0, alloc, &out_name);
    const char* ins[1]  = { in_name };
    const char* outs[1] = { out_name };
    const OrtValue* in_vals[1] = { in_tensor };
    OrtValue* out_tensor = nullptr;

    st = g_ort->Run(s->session, nullptr,
                    ins, in_vals, 1,
                    outs, 1, &out_tensor);
    g_ort->ReleaseValue(in_tensor);
    g_ort->ReleaseMemoryInfo(meminfo);
    if (in_name)  g_ort->AllocatorFree(alloc, in_name);
    if (out_name) g_ort->AllocatorFree(alloc, out_name);
    if (st) { g_ort->ReleaseStatus(st); return 0; }

    OrtTensorTypeAndShapeInfo* oti = nullptr;
    g_ort->GetTensorTypeAndShape(out_tensor, &oti);
    size_t orank = 0;
    g_ort->GetDimensionsCount(oti, &orank);
    std::vector<int64_t> odims(orank);
    g_ort->GetDimensions(oti, odims.data(), orank);
    size_t elem = 1;
    for (size_t i = 0; i < orank; ++i) elem *= (size_t)(odims[i] > 0 ? odims[i] : 1);
    g_ort->ReleaseTensorTypeAndShapeInfo(oti);

    float* out_raw = nullptr;
    g_ort->GetTensorMutableData(out_tensor, (void**)&out_raw);

    float* out_buf = (float*)out_data_v;
    if (out_buf && out_raw) memcpy(out_buf, out_raw, elem * sizeof(float));
    if (out_shape_i) {
        for (size_t i = 0; i < orank && i < 8; ++i) out_shape_i[i] = (int)odims[i];
    }
    if (out_rank_out) *out_rank_out = (int)orank;

    g_ort->ReleaseValue(out_tensor);
    return 0;
#endif
}

// ============================================================
// DllMain
// ============================================================
BOOL WINAPI DllMain(HINSTANCE, DWORD reason, LPVOID) {
    if (reason == DLL_PROCESS_DETACH) {
        for (int i = 0; i < (int)g_sessions.size(); ++i) free_slot(i);
#if HSPONNX_HAVE_ORT
        if (g_ort && g_env) {
            g_ort->ReleaseEnv(g_env);
            g_env = nullptr;
        }
        g_ort = nullptr;
#endif
    }
    return TRUE;
}
