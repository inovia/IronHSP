//============================================================
//   hsptflite.dll — Tensorflow Lite C API host plugin for IronHSP
//
//   Google Tensorflow Lite の C API (tensorflow/lite/c/c_api.h) を
//   embed して、HSP から .tflite モデルを load / 推論できる薄い
//   ラッパ。MediaPipe を HSP から利用するための基盤として設計。
//
//   v1 スコープ:
//     - Interpreter 16 並列ハンドル
//     - Model load (ファイルパス)
//     - Input / Output 数、shape、dtype の取得
//     - 入出力テンソルへのバイナリ直接 set/get
//     - 同期 Invoke
//
//   HSP API (全て OLDDLL $202 signature):
//     tflite_init
//     tflite_shutdown
//     tflite_load            "path", var_hid
//     tflite_close           hid
//     tflite_num_threads     hid, n
//     tflite_input_count     hid, var_n
//     tflite_output_count    hid, var_n
//     tflite_input_shape     hid, idx, var_shape_arr, var_rank
//     tflite_output_shape    hid, idx, var_shape_arr, var_rank
//     tflite_input_type      hid, idx, var_type
//     tflite_output_type     hid, idx, var_type
//     tflite_input_resize    hid, idx, var_shape_arr, rank
//     tflite_set_input       hid, idx, var_buf, byte_len
//     tflite_get_output      hid, idx, var_buf, byte_len
//     tflite_invoke          hid
//
//   NOTE:
//     - __has_include("tensorflow/lite/c/c_api.h") が false の環境
//       では stub ビルドとなり、全関数は -100 を返す。
//     - tensorflowlite_c.dll は実行時に同ディレクトリに配置。
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

// ---------- TFLite C API ----------
//
// 注意: tensorflow lite の header / .lib / .dll は本リポジトリに
// vendor していない。third_party/tflite/README.md に従い prebuilt の
// tensorflowlite_c を配置してからビルドすること。
//
#if __has_include("tensorflow/lite/c/c_api.h")
  #include "tensorflow/lite/c/c_api.h"
  #if __has_include("tensorflow/lite/c/c_api_types.h")
    #include "tensorflow/lite/c/c_api_types.h"
  #endif
  #define HSPTFLITE_HAVE_TFL 1
#else
  #define HSPTFLITE_HAVE_TFL 0
  // minimal forward decl so the stub compiles without the header
  struct TfLiteModel;
  struct TfLiteInterpreter;
  struct TfLiteInterpreterOptions;
  struct TfLiteTensor;
#endif

#define HSPTFLITE_EXPORT extern "C" __declspec(dllexport)

// ============================================================
// HSP helpers (hsponnx.cpp と同等)
// ============================================================
namespace {

HSPEXINFO* g_hei = nullptr;
inline void   set_hei(HSPEXINFO* hei) { g_hei = hei; }
inline int    getint() { return g_hei->HspFunc_prm_geti(); }
inline char*  getstr() { return g_hei->HspFunc_prm_gets(); }

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

static void write_int_to_pval(PVal* pv, int v) {
    if (!pv || pv->flag != HSPVAR_FLAG_INT) return;
    pv->offset = 0;
    HspVarProc* proc = g_hei->HspFunc_getproc(pv->flag);
    proc->Set(pv, proc->GetPtr(pv), &v);
}

static void* get_var_rawptr(PVal* pv) {
    if (!pv) return nullptr;
    HspVarProc* proc = g_hei->HspFunc_getproc(pv->flag);
    pv->offset = 0;
    return proc->GetPtr(pv);
}

static int* get_int_array(PVal* pv) {
    if (!pv || pv->flag != HSPVAR_FLAG_INT) return nullptr;
    return (int*)get_var_rawptr(pv);
}

} // namespace

// ============================================================
// Interpreter handle table
// ============================================================
struct TfLiteSlot {
    bool                      used = false;
    TfLiteModel*              model = nullptr;
    TfLiteInterpreterOptions* options = nullptr;
    TfLiteInterpreter*        interp = nullptr;
    int                       num_threads = 1;
    std::string               path;
};

static std::array<TfLiteSlot, 16> g_slots;

static int alloc_slot() {
    for (int i = 0; i < (int)g_slots.size(); ++i) {
        if (!g_slots[i].used) return i;
    }
    return -1;
}

static void free_slot(int h) {
    if (h < 0 || h >= (int)g_slots.size()) return;
    TfLiteSlot& s = g_slots[h];
    if (!s.used) return;
#if HSPTFLITE_HAVE_TFL
    if (s.interp)  TfLiteInterpreterDelete(s.interp);
    if (s.options) TfLiteInterpreterOptionsDelete(s.options);
    if (s.model)   TfLiteModelDelete(s.model);
#endif
    s.interp  = nullptr;
    s.options = nullptr;
    s.model   = nullptr;
    s.path.clear();
    s.num_threads = 1;
    s.used = false;
}

static TfLiteSlot* get_slot(int h) {
    if (h < 0 || h >= (int)g_slots.size()) return nullptr;
    if (!g_slots[h].used) return nullptr;
    return &g_slots[h];
}

// ============================================================
// HSP exports
// ============================================================

// tflite_init
HSPTFLITE_EXPORT BOOL WINAPI tflite_init(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    return 0;
}

// tflite_shutdown
HSPTFLITE_EXPORT BOOL WINAPI tflite_shutdown(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    for (int i = 0; i < (int)g_slots.size(); ++i) free_slot(i);
    return 0;
}

// tflite_load "path", var_hid
HSPTFLITE_EXPORT BOOL WINAPI tflite_load(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    const char* path = getstr();
    if (!path) { write_int_to_var(-1); return 0; }

#if !HSPTFLITE_HAVE_TFL
    (void)path;
    write_int_to_var(-100); // not linked
    return 0;
#else
    int h = alloc_slot();
    if (h < 0) { write_int_to_var(-1); return 0; }
    TfLiteSlot& s = g_slots[h];
    s.path = path;

    s.model = TfLiteModelCreateFromFile(path);
    if (!s.model) { write_int_to_var(-2); return 0; }

    s.options = TfLiteInterpreterOptionsCreate();
    if (!s.options) {
        TfLiteModelDelete(s.model); s.model = nullptr;
        write_int_to_var(-3); return 0;
    }
    TfLiteInterpreterOptionsSetNumThreads(s.options, s.num_threads);

    s.interp = TfLiteInterpreterCreate(s.model, s.options);
    if (!s.interp) {
        TfLiteInterpreterOptionsDelete(s.options); s.options = nullptr;
        TfLiteModelDelete(s.model); s.model = nullptr;
        write_int_to_var(-4); return 0;
    }
    if (TfLiteInterpreterAllocateTensors(s.interp) != kTfLiteOk) {
        TfLiteInterpreterDelete(s.interp);  s.interp = nullptr;
        TfLiteInterpreterOptionsDelete(s.options); s.options = nullptr;
        TfLiteModelDelete(s.model); s.model = nullptr;
        write_int_to_var(-5); return 0;
    }

    s.used = true;
    write_int_to_var(h);
    return 0;
#endif
}

// tflite_close hid
HSPTFLITE_EXPORT BOOL WINAPI tflite_close(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    free_slot(h);
    return 0;
}

// tflite_num_threads hid, n
HSPTFLITE_EXPORT BOOL WINAPI tflite_num_threads(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    int n = getint();
    TfLiteSlot* s = get_slot(h);
    if (!s) return 0;
    s->num_threads = n < 1 ? 1 : n;
#if HSPTFLITE_HAVE_TFL
    // options を作り直して interpreter を再構築
    if (s->interp)  { TfLiteInterpreterDelete(s->interp);   s->interp = nullptr; }
    if (s->options) { TfLiteInterpreterOptionsDelete(s->options); s->options = nullptr; }
    s->options = TfLiteInterpreterOptionsCreate();
    if (!s->options) return 0;
    TfLiteInterpreterOptionsSetNumThreads(s->options, s->num_threads);
    s->interp = TfLiteInterpreterCreate(s->model, s->options);
    if (s->interp) TfLiteInterpreterAllocateTensors(s->interp);
#endif
    return 0;
}

// ---- input/output count ----
HSPTFLITE_EXPORT BOOL WINAPI tflite_input_count(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    TfLiteSlot* s = get_slot(h);
    int n = -1;
#if HSPTFLITE_HAVE_TFL
    if (s && s->interp) n = TfLiteInterpreterGetInputTensorCount(s->interp);
#else
    (void)s;
#endif
    write_int_to_var(n);
    return 0;
}

HSPTFLITE_EXPORT BOOL WINAPI tflite_output_count(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    TfLiteSlot* s = get_slot(h);
    int n = -1;
#if HSPTFLITE_HAVE_TFL
    if (s && s->interp) n = TfLiteInterpreterGetOutputTensorCount(s->interp);
#else
    (void)s;
#endif
    write_int_to_var(n);
    return 0;
}

// ---- shape ----
HSPTFLITE_EXPORT BOOL WINAPI tflite_input_shape(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    int idx = getint();
    APTR a1, a2;
    PVal* pv_sh = getva_pval(&a1);
    PVal* pv_rk = getva_pval(&a2);
    TfLiteSlot* s = get_slot(h);
    int* shape = get_int_array(pv_sh);
#if HSPTFLITE_HAVE_TFL
    if (s && s->interp && shape) {
        TfLiteTensor* t = TfLiteInterpreterGetInputTensor(s->interp, idx);
        int rank = 0;
        if (t) {
            rank = TfLiteTensorNumDims(t);
            if (rank < 0) rank = 0;
            if (rank > 8) rank = 8;
            for (int i = 0; i < rank; ++i) shape[i] = TfLiteTensorDim(t, i);
        }
        write_int_to_pval(pv_rk, rank);
    } else {
        write_int_to_pval(pv_rk, 0);
    }
#else
    (void)s; (void)idx; (void)shape;
    write_int_to_pval(pv_rk, 0);
#endif
    return 0;
}

HSPTFLITE_EXPORT BOOL WINAPI tflite_output_shape(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    int idx = getint();
    APTR a1, a2;
    PVal* pv_sh = getva_pval(&a1);
    PVal* pv_rk = getva_pval(&a2);
    TfLiteSlot* s = get_slot(h);
    int* shape = get_int_array(pv_sh);
#if HSPTFLITE_HAVE_TFL
    if (s && s->interp && shape) {
        const TfLiteTensor* t = TfLiteInterpreterGetOutputTensor(s->interp, idx);
        int rank = 0;
        if (t) {
            rank = TfLiteTensorNumDims(t);
            if (rank < 0) rank = 0;
            if (rank > 8) rank = 8;
            for (int i = 0; i < rank; ++i) shape[i] = TfLiteTensorDim(t, i);
        }
        write_int_to_pval(pv_rk, rank);
    } else {
        write_int_to_pval(pv_rk, 0);
    }
#else
    (void)s; (void)idx; (void)shape;
    write_int_to_pval(pv_rk, 0);
#endif
    return 0;
}

// ---- type ----
//   TfLiteType を HSP 側向けに正規化:
//   0=f32 1=u8 2=i32 3=i64 4=f16 5=i8 6=bool 7=str 8=complex64 99=unknown
static int map_tflite_type(int t) {
#if HSPTFLITE_HAVE_TFL
    switch (t) {
        case kTfLiteFloat32: return 0;
        case kTfLiteUInt8:   return 1;
        case kTfLiteInt32:   return 2;
        case kTfLiteInt64:   return 3;
        case kTfLiteFloat16: return 4;
        case kTfLiteInt8:    return 5;
        case kTfLiteBool:    return 6;
        case kTfLiteString:  return 7;
        default: return 99;
    }
#else
    (void)t; return 99;
#endif
}

HSPTFLITE_EXPORT BOOL WINAPI tflite_input_type(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    int idx = getint();
    TfLiteSlot* s = get_slot(h);
    int ty = -1;
#if HSPTFLITE_HAVE_TFL
    if (s && s->interp) {
        TfLiteTensor* t = TfLiteInterpreterGetInputTensor(s->interp, idx);
        if (t) ty = map_tflite_type((int)TfLiteTensorType(t));
    }
#else
    (void)s; (void)idx;
#endif
    write_int_to_var(ty);
    return 0;
}

HSPTFLITE_EXPORT BOOL WINAPI tflite_output_type(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    int idx = getint();
    TfLiteSlot* s = get_slot(h);
    int ty = -1;
#if HSPTFLITE_HAVE_TFL
    if (s && s->interp) {
        const TfLiteTensor* t = TfLiteInterpreterGetOutputTensor(s->interp, idx);
        if (t) ty = map_tflite_type((int)TfLiteTensorType(t));
    }
#else
    (void)s; (void)idx;
#endif
    write_int_to_var(ty);
    return 0;
}

// ---- input resize ----
// tflite_input_resize hid, idx, var_shape_arr, rank
HSPTFLITE_EXPORT BOOL WINAPI tflite_input_resize(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    int idx = getint();
    APTR a;
    PVal* pv_sh = getva_pval(&a);
    int rank = getint();
    TfLiteSlot* s = get_slot(h);
    int* shape = get_int_array(pv_sh);
    if (!s || !shape || rank <= 0 || rank > 8) return 0;
#if HSPTFLITE_HAVE_TFL
    if (s->interp) {
        TfLiteInterpreterResizeInputTensor(s->interp, idx, shape, rank);
        TfLiteInterpreterAllocateTensors(s->interp);
    }
#else
    (void)idx;
#endif
    return 0;
}

// ---- set input ----
// tflite_set_input hid, idx, var_buf, byte_len
HSPTFLITE_EXPORT BOOL WINAPI tflite_set_input(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    int idx = getint();
    APTR a;
    PVal* pv_buf = getva_pval(&a);
    int byte_len = getint();
    TfLiteSlot* s = get_slot(h);
    if (!s || !pv_buf || byte_len <= 0) return 0;
    void* src = get_var_rawptr(pv_buf);
    if (!src) return 0;
#if HSPTFLITE_HAVE_TFL
    if (s->interp) {
        TfLiteTensor* t = TfLiteInterpreterGetInputTensor(s->interp, idx);
        if (t) {
            size_t tb = TfLiteTensorByteSize(t);
            size_t copy = (size_t)byte_len < tb ? (size_t)byte_len : tb;
            TfLiteTensorCopyFromBuffer(t, src, copy);
        }
    }
#else
    (void)idx;
#endif
    return 0;
}

// ---- get output ----
// tflite_get_output hid, idx, var_buf, byte_len
HSPTFLITE_EXPORT BOOL WINAPI tflite_get_output(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    int idx = getint();
    APTR a;
    PVal* pv_buf = getva_pval(&a);
    int byte_len = getint();
    TfLiteSlot* s = get_slot(h);
    if (!s || !pv_buf || byte_len <= 0) return 0;
    void* dst = get_var_rawptr(pv_buf);
    if (!dst) return 0;
#if HSPTFLITE_HAVE_TFL
    if (s->interp) {
        const TfLiteTensor* t = TfLiteInterpreterGetOutputTensor(s->interp, idx);
        if (t) {
            size_t tb = TfLiteTensorByteSize(t);
            size_t copy = (size_t)byte_len < tb ? (size_t)byte_len : tb;
            TfLiteTensorCopyToBuffer(t, dst, copy);
        }
    }
#else
    (void)idx;
#endif
    return 0;
}

// ---- invoke ----
HSPTFLITE_EXPORT BOOL WINAPI tflite_invoke(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    TfLiteSlot* s = get_slot(h);
    if (!s) return 0;
#if HSPTFLITE_HAVE_TFL
    if (s->interp) TfLiteInterpreterInvoke(s->interp);
#endif
    return 0;
}

// ============================================================
// DllMain
// ============================================================
BOOL WINAPI DllMain(HINSTANCE, DWORD reason, LPVOID) {
    if (reason == DLL_PROCESS_DETACH) {
        for (int i = 0; i < (int)g_slots.size(); ++i) free_slot(i);
    }
    return TRUE;
}
