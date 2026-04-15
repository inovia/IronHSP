//============================================================
//   hsptflite.dll v2 — Tensorflow Lite C API host plugin for IronHSP
//
//   Google Tensorflow Lite の C API (tensorflow/lite/c/c_api.h) を
//   embed して、HSP から .tflite モデルを load / 推論できる薄い
//   ラッパ。MediaPipe を HSP から利用するための基盤として設計。
//
//   v2 (2026-04-15): OLDDLL $202 → typed #func 形式に全面移行。
//   HSPEXINFO callback は一切使わず、各 export 関数は普通の C 関数。
//
//   HSP API (全て typed #func):
//     tflite_init
//     tflite_shutdown
//     tflite_load            "path", var_hid
//     tflite_close           hid
//     tflite_num_threads     hid, n
//     tflite_input_count     hid, var_n
//     tflite_output_count    hid, var_n
//     tflite_input_shape     hid, idx, var_shape, var_rank
//     tflite_output_shape    hid, idx, var_shape, var_rank
//     tflite_input_type      hid, idx, var_type
//     tflite_output_type     hid, idx, var_type
//     tflite_input_resize    hid, idx, var_shape, rank
//     tflite_set_input       hid, idx, var_buf, byte_len
//     tflite_get_output      hid, idx, var_buf, byte_len
//     tflite_invoke          hid
//
//     mp_palm_detect         hid, var_rgb, w, h, thresh, var_boxes, var_count
//     mp_hand_landmark       hid, var_rgb, w, h, x1, y1, x2, y2, var_xy, var_conf
//     mp_bgr_to_rgb          var_bgr, w, h, var_rgb
//     mp_letterbox_resize    var_src, sw, sh, src_ch, var_dst, dw, dh, var_params
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

#include <algorithm>
#include <cmath>

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
// HSP exports (typed #func 新形式)
// ============================================================

HSPTFLITE_EXPORT int __stdcall tflite_init() {
    return 0;
}

HSPTFLITE_EXPORT int __stdcall tflite_shutdown() {
    for (int i = 0; i < (int)g_slots.size(); ++i) free_slot(i);
    return 0;
}

// tflite_load "path", var_hid
HSPTFLITE_EXPORT int __stdcall tflite_load(const char* path, int* out_h) {
    if (out_h) *out_h = -1;
    if (!path) return 0;

#if !HSPTFLITE_HAVE_TFL
    if (out_h) *out_h = -100;
    return 0;
#else
    int h = alloc_slot();
    if (h < 0) return 0;
    TfLiteSlot& s = g_slots[h];
    s.path = path;

    s.model = TfLiteModelCreateFromFile(path);
    if (!s.model) { if (out_h) *out_h = -2; return 0; }

    s.options = TfLiteInterpreterOptionsCreate();
    if (!s.options) {
        TfLiteModelDelete(s.model); s.model = nullptr;
        if (out_h) *out_h = -3; return 0;
    }
    TfLiteInterpreterOptionsSetNumThreads(s.options, s.num_threads);

    s.interp = TfLiteInterpreterCreate(s.model, s.options);
    if (!s.interp) {
        TfLiteInterpreterOptionsDelete(s.options); s.options = nullptr;
        TfLiteModelDelete(s.model); s.model = nullptr;
        if (out_h) *out_h = -4; return 0;
    }
    if (TfLiteInterpreterAllocateTensors(s.interp) != kTfLiteOk) {
        TfLiteInterpreterDelete(s.interp);  s.interp = nullptr;
        TfLiteInterpreterOptionsDelete(s.options); s.options = nullptr;
        TfLiteModelDelete(s.model); s.model = nullptr;
        if (out_h) *out_h = -5; return 0;
    }

    s.used = true;
    if (out_h) *out_h = h;
    return 0;
#endif
}

HSPTFLITE_EXPORT int __stdcall tflite_close(int h) {
    free_slot(h);
    return 0;
}

HSPTFLITE_EXPORT int __stdcall tflite_num_threads(int h, int n) {
    TfLiteSlot* s = get_slot(h);
    if (!s) return 0;
    s->num_threads = n < 1 ? 1 : n;
#if HSPTFLITE_HAVE_TFL
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
HSPTFLITE_EXPORT int __stdcall tflite_input_count(int h, int* out_n) {
    int n = -1;
    TfLiteSlot* s = get_slot(h);
#if HSPTFLITE_HAVE_TFL
    if (s && s->interp) n = TfLiteInterpreterGetInputTensorCount(s->interp);
#else
    (void)s;
#endif
    if (out_n) *out_n = n;
    return 0;
}

HSPTFLITE_EXPORT int __stdcall tflite_output_count(int h, int* out_n) {
    int n = -1;
    TfLiteSlot* s = get_slot(h);
#if HSPTFLITE_HAVE_TFL
    if (s && s->interp) n = TfLiteInterpreterGetOutputTensorCount(s->interp);
#else
    (void)s;
#endif
    if (out_n) *out_n = n;
    return 0;
}

// ---- shape ----
HSPTFLITE_EXPORT int __stdcall tflite_input_shape(int h, int idx, int* out_shape, int* out_rank) {
    TfLiteSlot* s = get_slot(h);
#if HSPTFLITE_HAVE_TFL
    if (s && s->interp && out_shape) {
        TfLiteTensor* t = TfLiteInterpreterGetInputTensor(s->interp, idx);
        int rank = 0;
        if (t) {
            rank = TfLiteTensorNumDims(t);
            if (rank < 0) rank = 0;
            if (rank > 8) rank = 8;
            for (int i = 0; i < rank; ++i) out_shape[i] = TfLiteTensorDim(t, i);
        }
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

HSPTFLITE_EXPORT int __stdcall tflite_output_shape(int h, int idx, int* out_shape, int* out_rank) {
    TfLiteSlot* s = get_slot(h);
#if HSPTFLITE_HAVE_TFL
    if (s && s->interp && out_shape) {
        const TfLiteTensor* t = TfLiteInterpreterGetOutputTensor(s->interp, idx);
        int rank = 0;
        if (t) {
            rank = TfLiteTensorNumDims(t);
            if (rank < 0) rank = 0;
            if (rank > 8) rank = 8;
            for (int i = 0; i < rank; ++i) out_shape[i] = TfLiteTensorDim(t, i);
        }
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

HSPTFLITE_EXPORT int __stdcall tflite_input_type(int h, int idx, int* out_ty) {
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
    if (out_ty) *out_ty = ty;
    return 0;
}

HSPTFLITE_EXPORT int __stdcall tflite_output_type(int h, int idx, int* out_ty) {
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
    if (out_ty) *out_ty = ty;
    return 0;
}

// ---- input resize ----
HSPTFLITE_EXPORT int __stdcall tflite_input_resize(int h, int idx, int* shape, int rank) {
    TfLiteSlot* s = get_slot(h);
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
HSPTFLITE_EXPORT int __stdcall tflite_set_input(int h, int idx, void* src, int byte_len) {
    TfLiteSlot* s = get_slot(h);
    if (!s || !src || byte_len <= 0) return 0;
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
HSPTFLITE_EXPORT int __stdcall tflite_get_output(int h, int idx, void* dst, int byte_len) {
    TfLiteSlot* s = get_slot(h);
    if (!s || !dst || byte_len <= 0) return 0;
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
HSPTFLITE_EXPORT int __stdcall tflite_invoke(int h) {
    TfLiteSlot* s = get_slot(h);
    if (!s) return 0;
#if HSPTFLITE_HAVE_TFL
    if (s->interp) TfLiteInterpreterInvoke(s->interp);
#endif
    return 0;
}

// ============================================================
// MediaPipe helpers (palm detector / hand landmarker 用)
// ============================================================
//
// 全て $202 OLDDLL 定石。HSP 側に MediaPipe hand パイプラインを
// ワンコールで提供するための高レベル API。
//
//   mp_palm_detect        hid, var_rgb, w, h, score_thresh*1000,
//                         var_out_boxes(int*16*5), var_out_count
//   mp_hand_landmark      hid, var_rgb, w, h, x1, y1, x2, y2,
//                         var_out_xy(int*21*2), var_out_conf*1000
//   mp_bgr_to_rgb         var_bgr, w, h, var_rgb
//   mp_letterbox_resize   var_src, sw, sh, src_ch,
//                         var_dst, dw, dh, var_params(int*4)
//
// MediaPipe palm_detection (v1 lite / full) anchor 仕様:
//   input             : 192x192
//   num_layers        : 4
//   strides           : [8, 16, 16, 16]
//   aspect_ratios     : [1.0]
//   anchors/cell      : 2 (全 layer 共通)
//   feature_map_sizes : 24, 12, 12, 12
//   total anchors     : 24*24*2 + 12*12*2*3 = 1152 + 864 = 2016
//   回帰出力 18ch     : [cx, cy, w, h, kp0.x, kp0.y, ..., kp6.x, kp6.y]
//                       全て 192x192 space のピクセル単位
//                       (anchor 中心 + dx/dy, box は 192x192 絶対値)
//
// 参照: google/mediapipe ssd_anchors_calculator.cc +
//       modules/palm_detection/palm_detection_cpu.pbtxt

namespace mp {

struct Anchor { float cx, cy, w, h; }; // 正規化 (0..1)

// MediaPipe palm detector v1: 2016 anchor を生成 (一度だけ)
static const std::vector<Anchor>& palm_anchors() {
    static std::vector<Anchor> cache;
    if (!cache.empty()) return cache;
    cache.reserve(2016);
    const int   input_sz      = 192;
    const int   strides[4]    = { 8, 16, 16, 16 };
    const int   num_layers    = 4;
    const int   anchors_per   = 2;     // 全 layer 2 anchors/cell
    const float off_x = 0.5f, off_y = 0.5f;
    for (int layer = 0; layer < num_layers; ++layer) {
        int stride = strides[layer];
        int fm = input_sz / stride;    // 24 or 12
        for (int y = 0; y < fm; ++y) {
            for (int x = 0; x < fm; ++x) {
                float cx = (x + off_x) / (float)fm;
                float cy = (y + off_y) / (float)fm;
                for (int a = 0; a < anchors_per; ++a) {
                    Anchor an;
                    an.cx = cx;
                    an.cy = cy;
                    an.w  = 1.0f;
                    an.h  = 1.0f;
                    cache.push_back(an);
                }
            }
        }
    }
    return cache;
}

static inline float sigmoidf(float x) {
    if (x >= 0) return 1.0f / (1.0f + std::exp(-x));
    float e = std::exp(x);
    return e / (1.0f + e);
}

// letterbox: src (sw,sh,src_ch, 8bit) → dst_f32 (dw,dh,3, [-1..1] or [0..1])
// norm_mode: 0 = (v-127.5)/127.5 (palm)
//            1 = v/255.0          (landmark)
// params_out: [scale_x*10000, scale_y*10000, offset_x, offset_y]
//   逆変換: src_x = (dst_x - offset_x) / scale * 10000
static void letterbox_resize_rgb_to_f32(
    const uint8_t* src, int sw, int sh, int src_ch,
    float* dst, int dw, int dh,
    int norm_mode,
    int params_out[4])
{
    // scale: 長辺に合わせる
    float rw = (float)dw / (float)sw;
    float rh = (float)dh / (float)sh;
    float r  = rw < rh ? rw : rh;
    int nw = (int)std::floor(sw * r + 0.5f);
    int nh = (int)std::floor(sh * r + 0.5f);
    int ox = (dw - nw) / 2;
    int oy = (dh - nh) / 2;

    // zero pad
    for (int i = 0; i < dw * dh * 3; ++i) {
        dst[i] = (norm_mode == 0) ? -1.0f : 0.0f;
    }

    // bilinear resize + normalize
    // src の (sx, sy) を float で参照する
    for (int y = 0; y < nh; ++y) {
        float fy = ((float)y + 0.5f) / (float)nh * (float)sh - 0.5f;
        int   y0 = (int)std::floor(fy);
        float dy = fy - (float)y0;
        if (y0 < 0)      { y0 = 0; dy = 0; }
        if (y0 >= sh - 1){ y0 = sh - 1; dy = 0; }
        int y1i = y0 + 1; if (y1i > sh - 1) y1i = sh - 1;
        for (int x = 0; x < nw; ++x) {
            float fx = ((float)x + 0.5f) / (float)nw * (float)sw - 0.5f;
            int   x0 = (int)std::floor(fx);
            float dx = fx - (float)x0;
            if (x0 < 0)      { x0 = 0; dx = 0; }
            if (x0 >= sw - 1){ x0 = sw - 1; dx = 0; }
            int x1i = x0 + 1; if (x1i > sw - 1) x1i = sw - 1;

            for (int c = 0; c < 3; ++c) {
                int sc = (c < src_ch) ? c : 0;     // mono → broadcast
                float p00 = (float)src[(y0 * sw + x0) * src_ch + sc];
                float p01 = (float)src[(y0 * sw + x1i) * src_ch + sc];
                float p10 = (float)src[(y1i * sw + x0) * src_ch + sc];
                float p11 = (float)src[(y1i * sw + x1i) * src_ch + sc];
                float pv = (1 - dy) * ((1 - dx) * p00 + dx * p01)
                         +      dy  * ((1 - dx) * p10 + dx * p11);
                float f;
                if (norm_mode == 0) f = (pv - 127.5f) / 127.5f;
                else                f = pv / 255.0f;
                dst[((oy + y) * dw + (ox + x)) * 3 + c] = f;
            }
        }
    }

    if (params_out) {
        params_out[0] = (int)(r * 10000.0f);
        params_out[1] = (int)(r * 10000.0f);
        params_out[2] = ox;
        params_out[3] = oy;
    }
}

// 単純 IoU
static inline float iou_xyxy(int ax1, int ay1, int ax2, int ay2,
                             int bx1, int by1, int bx2, int by2) {
    int ix1 = ax1 > bx1 ? ax1 : bx1;
    int iy1 = ay1 > by1 ? ay1 : by1;
    int ix2 = ax2 < bx2 ? ax2 : bx2;
    int iy2 = ay2 < by2 ? ay2 : by2;
    int iw = ix2 - ix1; if (iw < 0) iw = 0;
    int ih = iy2 - iy1; if (ih < 0) ih = 0;
    int inter = iw * ih;
    int a = (ax2 - ax1) * (ay2 - ay1);
    int b = (bx2 - bx1) * (by2 - by1);
    int uni = a + b - inter;
    if (uni <= 0) return 0.0f;
    return (float)inter / (float)uni;
}

} // namespace mp

// ------------------------------------------------------------
// mp_palm_detect hid, var_rgb, w, h, score_thresh_i,
//                var_out_boxes, var_out_count
// ------------------------------------------------------------
HSPTFLITE_EXPORT int __stdcall mp_palm_detect(
    int h, void* rgb_v, int w, int ih, int thresh_i,
    int* out_boxes, int* out_count)
{
    if (out_count) *out_count = 0;
    TfLiteSlot* s = get_slot(h);
    if (!s || !rgb_v || !out_boxes) return 0;
    uint8_t* rgb = (uint8_t*)rgb_v;

#if !HSPTFLITE_HAVE_TFL
    (void)w; (void)ih; (void)thresh_i;
    return 0;
#else
    if (!s->interp) return 0;

    const int IN_W = 192, IN_H = 192;
    // MediaPipe Tasks hand_detector は [0..1] 正規化 (norm_mode=1)
    std::vector<float> inbuf(IN_W * IN_H * 3, 0.0f);
    int params[4] = { 0, 0, 0, 0 };
    mp::letterbox_resize_rgb_to_f32(rgb, w, ih, 3, inbuf.data(),
                                    IN_W, IN_H, 1, params);
    float scale = (float)params[0] / 10000.0f;
    int   off_x = params[2];
    int   off_y = params[3];

    TfLiteTensor* tin = TfLiteInterpreterGetInputTensor(s->interp, 0);
    if (!tin) return 0;
    TfLiteTensorCopyFromBuffer(tin, inbuf.data(), inbuf.size() * sizeof(float));
    if (TfLiteInterpreterInvoke(s->interp) != kTfLiteOk) return 0;

    // 出力取得: 18*2016 の regressor と 1*2016 の score
    // index 0/1 の順序はモデルによって入れ替わる可能性があるので
    // shape 末尾で判断する
    const TfLiteTensor* t0 = TfLiteInterpreterGetOutputTensor(s->interp, 0);
    const TfLiteTensor* t1 = TfLiteInterpreterGetOutputTensor(s->interp, 1);
    if (!t0 || !t1) return 0;

    const TfLiteTensor *tReg = t0, *tSco = t1;
    // 末尾次元が 18 の方が regressor
    if (TfLiteTensorNumDims(t0) >= 1 &&
        TfLiteTensorDim(t0, TfLiteTensorNumDims(t0) - 1) == 1) {
        tSco = t0; tReg = t1;
    }

    const int N = 2016, RS = 18;
    std::vector<float> reg(N * RS);
    std::vector<float> sco(N);
    TfLiteTensorCopyToBuffer(tReg, reg.data(), reg.size() * sizeof(float));
    TfLiteTensorCopyToBuffer(tSco, sco.data(), sco.size() * sizeof(float));

    const auto& anchors = mp::palm_anchors();
    int n_anchors = (int)anchors.size();
    if (n_anchors > N) n_anchors = N;

    float thresh = (float)thresh_i / 1000.0f;

    // decode candidates
    struct Cand { int x1, y1, x2, y2; float sc; };
    std::vector<Cand> cands;
    cands.reserve(64);

    for (int i = 0; i < n_anchors; ++i) {
        float sc_raw = sco[i];
        float sc_p   = mp::sigmoidf(sc_raw);
        if (sc_p < thresh) continue;

        const float* r = &reg[i * RS];
        float dx = r[0];
        float dy = r[1];
        float dw = r[2];
        float dh = r[3];
        // anchor は正規化 (0..1) で保持、192 を掛けてピクセルへ
        float ax = anchors[i].cx * (float)IN_W;
        float ay = anchors[i].cy * (float)IN_H;
        // MediaPipe 慣例: 回帰値はすでに 192x192 space の px
        float cx = ax + dx;
        float cy = ay + dy;
        float bw = dw;
        float bh = dh;
        float x1f = cx - bw * 0.5f;
        float y1f = cy - bh * 0.5f;
        float x2f = cx + bw * 0.5f;
        float y2f = cy + bh * 0.5f;

        // letterbox 逆変換 → 元画像座標
        x1f = (x1f - (float)off_x) / scale;
        y1f = (y1f - (float)off_y) / scale;
        x2f = (x2f - (float)off_x) / scale;
        y2f = (y2f - (float)off_y) / scale;

        Cand c;
        c.x1 = (int)x1f; c.y1 = (int)y1f;
        c.x2 = (int)x2f; c.y2 = (int)y2f;
        c.sc = sc_p;
        if (c.x2 <= c.x1 || c.y2 <= c.y1) continue;
        cands.push_back(c);
    }

    // score 降順にソート
    std::sort(cands.begin(), cands.end(),
              [](const Cand& a, const Cand& b) { return a.sc > b.sc; });

    // NMS (IoU > 0.3)
    std::vector<Cand> keep;
    keep.reserve(16);
    for (size_t i = 0; i < cands.size() && keep.size() < 16; ++i) {
        bool sup = false;
        for (size_t j = 0; j < keep.size(); ++j) {
            float io = mp::iou_xyxy(cands[i].x1, cands[i].y1,
                                    cands[i].x2, cands[i].y2,
                                    keep[j].x1, keep[j].y1,
                                    keep[j].x2, keep[j].y2);
            if (io > 0.3f) { sup = true; break; }
        }
        if (!sup) keep.push_back(cands[i]);
    }

    // 書き出し
    for (size_t i = 0; i < keep.size(); ++i) {
        out_boxes[i * 5 + 0] = keep[i].x1;
        out_boxes[i * 5 + 1] = keep[i].y1;
        out_boxes[i * 5 + 2] = keep[i].x2;
        out_boxes[i * 5 + 3] = keep[i].y2;
        out_boxes[i * 5 + 4] = (int)(keep[i].sc * 1000.0f);
    }
    if (out_count) *out_count = (int)keep.size();
    return 0;
#endif
}

// ------------------------------------------------------------
// mp_hand_landmark hid, var_rgb, w, h, x1, y1, x2, y2,
//                  var_out_xy(int*42), var_out_conf
// ------------------------------------------------------------
HSPTFLITE_EXPORT int __stdcall mp_hand_landmark(
    int h, void* rgb_v, int w, int ih,
    int x1, int y1, int x2, int y2,
    int* out_xy, int* out_conf)
{
    if (out_conf) *out_conf = 0;
    TfLiteSlot* s = get_slot(h);
    if (!s || !rgb_v || !out_xy) return 0;
    uint8_t* rgb = (uint8_t*)rgb_v;

#if !HSPTFLITE_HAVE_TFL
    (void)w; (void)ih; (void)x1; (void)y1; (void)x2; (void)y2;
    return 0;
#else
    if (!s->interp) return 0;

    // bbox を 1.5 倍に拡張 + 正方形化
    float cx = (float)(x1 + x2) * 0.5f;
    float cy = (float)(y1 + y2) * 0.5f;
    float bw = (float)(x2 - x1);
    float bh = (float)(y2 - y1);
    float side = (bw > bh ? bw : bh) * 1.5f;
    if (side < 1.0f) return 0;
    int rx1 = (int)std::floor(cx - side * 0.5f);
    int ry1 = (int)std::floor(cy - side * 0.5f);
    int rx2 = rx1 + (int)side;
    int ry2 = ry1 + (int)side;

    // ROI を RGB で切り出し (元画像外は 0)
    int rw = rx2 - rx1;
    int rh = ry2 - ry1;
    if (rw <= 0 || rh <= 0) return 0;
    std::vector<uint8_t> roi((size_t)rw * rh * 3, 0);
    for (int y = 0; y < rh; ++y) {
        int sy = ry1 + y;
        if (sy < 0 || sy >= ih) continue;
        for (int x = 0; x < rw; ++x) {
            int sx = rx1 + x;
            if (sx < 0 || sx >= w) continue;
            roi[((size_t)y * rw + x) * 3 + 0] = rgb[((size_t)sy * w + sx) * 3 + 0];
            roi[((size_t)y * rw + x) * 3 + 1] = rgb[((size_t)sy * w + sx) * 3 + 1];
            roi[((size_t)y * rw + x) * 3 + 2] = rgb[((size_t)sy * w + sx) * 3 + 2];
        }
    }

    const int IN_W = 224, IN_H = 224;
    std::vector<float> inbuf((size_t)IN_W * IN_H * 3, 0.0f);
    int params[4];
    mp::letterbox_resize_rgb_to_f32(roi.data(), rw, rh, 3,
                                    inbuf.data(), IN_W, IN_H, 1, params);
    // ROI は既に正方形なので letterbox は no-op に近い (scale = IN_W/rw)

    TfLiteTensor* tin = TfLiteInterpreterGetInputTensor(s->interp, 0);
    if (!tin) return 0;
    TfLiteTensorCopyFromBuffer(tin, inbuf.data(), inbuf.size() * sizeof(float));
    if (TfLiteInterpreterInvoke(s->interp) != kTfLiteOk) return 0;

    // 出力テンソル: 順序は [63, 1, 1, 63] を期待するが、
    // shape で探す
    int n_out = TfLiteInterpreterGetOutputTensorCount(s->interp);
    const TfLiteTensor* tLm = nullptr;
    const TfLiteTensor* tPs = nullptr;
    for (int i = 0; i < n_out; ++i) {
        const TfLiteTensor* t = TfLiteInterpreterGetOutputTensor(s->interp, i);
        if (!t) continue;
        int rank = TfLiteTensorNumDims(t);
        int last = (rank > 0) ? TfLiteTensorDim(t, rank - 1) : 0;
        if (last == 63 && !tLm) tLm = t;
        else if (last == 1 && !tPs) tPs = t; // 最初に出た 1 要素を presence とみなす
    }
    if (!tLm) return 0;

    float lm[63];
    TfLiteTensorCopyToBuffer(tLm, lm, sizeof(lm));
    float pres_raw = 0.0f;
    if (tPs) TfLiteTensorCopyToBuffer(tPs, &pres_raw, sizeof(float));
    float pres = mp::sigmoidf(pres_raw);

    // lm は 224x224 space の (x, y, z)。
    // letterbox 情報で ROI 座標系に戻して、さらに元画像座標系へ
    float scale = (float)params[0] / 10000.0f;
    int   ox = params[2], oy = params[3];

    for (int i = 0; i < 21; ++i) {
        float px = lm[i * 3 + 0];
        float py = lm[i * 3 + 1];
        // dst(224x224) → ROI(rw, rh)
        float rxf = (px - (float)ox) / scale;
        float ryf = (py - (float)oy) / scale;
        // ROI → 元画像
        int sx = rx1 + (int)rxf;
        int sy = ry1 + (int)ryf;
        out_xy[i * 2 + 0] = sx;
        out_xy[i * 2 + 1] = sy;
    }
    if (out_conf) *out_conf = (int)(pres * 1000.0f);
    return 0;
#endif
}

// ------------------------------------------------------------
// mp_bgr_to_rgb var_bgr, w, h, var_rgb
// ------------------------------------------------------------
HSPTFLITE_EXPORT int __stdcall mp_bgr_to_rgb(void* src_v, int w, int h, void* dst_v) {
    if (!src_v || !dst_v || w <= 0 || h <= 0) return 0;
    const uint8_t* src = (const uint8_t*)src_v;
    uint8_t*       dst = (uint8_t*)dst_v;
    int n = w * h;
    for (int i = 0; i < n; ++i) {
        dst[i * 3 + 0] = src[i * 3 + 2];
        dst[i * 3 + 1] = src[i * 3 + 1];
        dst[i * 3 + 2] = src[i * 3 + 0];
    }
    return 0;
}

// ------------------------------------------------------------
// mp_letterbox_resize var_src, sw, sh, src_ch,
//                     var_dst, dw, dh, var_params
//   dst は 8bit RGB (w*h*3) としてそのまま書き戻す版。
//   (C++ 側で float 入力を作る用途とは別に、HSP から下処理したい場合用)
// ------------------------------------------------------------
HSPTFLITE_EXPORT int __stdcall mp_letterbox_resize(
    void* src_v, int sw, int sh, int sc,
    void* dst_v, int dw, int dh, int* prm)
{
    if (!src_v || !dst_v || sw <= 0 || sh <= 0 || dw <= 0 || dh <= 0) return 0;
    const uint8_t* src = (const uint8_t*)src_v;
    uint8_t*       dst = (uint8_t*)dst_v;
    if (sc != 1 && sc != 3) sc = 3;

    float rw = (float)dw / (float)sw;
    float rh = (float)dh / (float)sh;
    float r  = rw < rh ? rw : rh;
    int nw = (int)std::floor(sw * r + 0.5f);
    int nh = (int)std::floor(sh * r + 0.5f);
    int ox = (dw - nw) / 2;
    int oy = (dh - nh) / 2;

    std::memset(dst, 0, (size_t)dw * dh * 3);

    for (int y = 0; y < nh; ++y) {
        float fy = ((float)y + 0.5f) / (float)nh * (float)sh - 0.5f;
        int   y0 = (int)std::floor(fy);
        float dyf = fy - (float)y0;
        if (y0 < 0)      { y0 = 0; dyf = 0; }
        if (y0 >= sh - 1){ y0 = sh - 1; dyf = 0; }
        int y1i = y0 + 1; if (y1i > sh - 1) y1i = sh - 1;
        for (int x = 0; x < nw; ++x) {
            float fx = ((float)x + 0.5f) / (float)nw * (float)sw - 0.5f;
            int   x0 = (int)std::floor(fx);
            float dxf = fx - (float)x0;
            if (x0 < 0)      { x0 = 0; dxf = 0; }
            if (x0 >= sw - 1){ x0 = sw - 1; dxf = 0; }
            int x1i = x0 + 1; if (x1i > sw - 1) x1i = sw - 1;
            for (int c = 0; c < 3; ++c) {
                int sci = (c < sc) ? c : 0;
                float p00 = (float)src[(y0 * sw + x0) * sc + sci];
                float p01 = (float)src[(y0 * sw + x1i) * sc + sci];
                float p10 = (float)src[(y1i * sw + x0) * sc + sci];
                float p11 = (float)src[(y1i * sw + x1i) * sc + sci];
                float pv = (1 - dyf) * ((1 - dxf) * p00 + dxf * p01)
                         +      dyf  * ((1 - dxf) * p10 + dxf * p11);
                int pi = (int)(pv + 0.5f);
                if (pi < 0) pi = 0;
                if (pi > 255) pi = 255;
                dst[((oy + y) * dw + (ox + x)) * 3 + c] = (uint8_t)pi;
            }
        }
    }

    if (prm) {
        prm[0] = (int)(r * 10000.0f);
        prm[1] = (int)(r * 10000.0f);
        prm[2] = ox;
        prm[3] = oy;
    }
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
