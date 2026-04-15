//============================================================
//   hspllama.dll — llama.cpp (GGML) host plugin for IronHSP
//
//   llama.cpp (https://github.com/ggerganov/llama.cpp) を embed
//   した local LLM 推論プラグイン。whisper.cpp / wasm3 と同じく
//   vendor せず README の git clone 手順で取り込む。
//
//   v1 スコープ:
//     - Model 4 並列ハンドル (LLM は VRAM を食うので少なめ)
//     - load / close
//     - 同期 complete (prompt → 1 回で結果文字列)
//     - chat (system + user, chat template)
//     - streaming (begin / next / end)
//     - n_ctx / n_vocab
//
//   HSP API (全て OLDDLL $202 signature):
//     llama_init
//     llama_shutdown
//     llama_load         "model.gguf" [, n_ctx] [, n_gpu_layers], var_h
//     llama_close        h
//     llama_complete     h, "prompt", max_tokens, var_result_str
//     llama_chat         h, "system", "user", max_tokens, var_result_str
//     llama_stream_begin h, "prompt", max_tokens
//     llama_stream_next  var_token_str   → stat 1=continue 0=eos
//     llama_stream_end
//     llama_n_ctx        h, var_int
//     llama_n_vocab      h, var_int
//
//   NOTE:
//     - __has_include("llama.h") が false の環境では全 API が
//       スタブ実装となり、complete / chat は「[llama.cpp not linked]」
//       を返す。stream は即座に eos。
//     - 実ビルドには CMake で llama.cpp を static lib として
//       作成して .lib をリンクするか、ソース全部 ClCompile する必要あり。
//       README 参照。
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

// ---------- llama.cpp ----------
#if __has_include("llama.h")
  #include "llama.h"
  #include "ggml-backend.h"
  #define HSPLLAMA_HAVE_LLAMA 1
#else
  #define HSPLLAMA_HAVE_LLAMA 0
  // opaque forward for stub
  struct llama_model;
  struct llama_context;
#endif

#define HSPLLAMA_EXPORT extern "C" __declspec(dllexport)

// ============================================================
// HSP helpers
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

static void write_str_to_var(const char* s) {
    PVal* pv = nullptr;
    APTR a = g_hei->HspFunc_prm_getva(&pv);
    if (!pv || pv->flag != HSPVAR_FLAG_STR) return;
    pv->offset = a;
    HspVarProc* proc = g_hei->HspFunc_getproc(pv->flag);
    proc->Set(pv, proc->GetPtr(pv), (void*)(s ? s : ""));
}

} // namespace

// ============================================================
// Session handle table
// ============================================================
struct LlamaState {
    bool            used = false;
    llama_model*    model = nullptr;
    llama_context*  ctx = nullptr;
    int             n_ctx = 2048;
    int             n_vocab = 0;
    std::string     chat_template; // 将来 template 名
};

static std::array<LlamaState, 4> g_slots;

static int alloc_slot() {
    for (int i = 0; i < (int)g_slots.size(); ++i) {
        if (!g_slots[i].used) return i;
    }
    return -1;
}

static void free_slot(int h) {
    if (h < 0 || h >= (int)g_slots.size()) return;
    LlamaState& s = g_slots[h];
    if (!s.used) return;
#if HSPLLAMA_HAVE_LLAMA
    if (s.ctx)   llama_free(s.ctx);
    if (s.model) llama_model_free(s.model);
#endif
    s.ctx = nullptr;
    s.model = nullptr;
    s.n_ctx = 0;
    s.n_vocab = 0;
    s.used = false;
}

static LlamaState* get_slot(int h) {
    if (h < 0 || h >= (int)g_slots.size()) return nullptr;
    if (!g_slots[h].used) return nullptr;
    return &g_slots[h];
}

// ============================================================
// Streaming state (1 active stream at a time, HSP 側で直列化)
// ============================================================
struct StreamState {
    bool          active = false;
    int           slot_h = -1;
    int           max_tokens = 0;
    int           emitted = 0;
    std::string   fake_text;  // stub 用: あらかじめ用意した応答を 1 文字ずつ返す
    size_t        fake_pos = 0;
#if HSPLLAMA_HAVE_LLAMA
    // TODO: 実装時は llama_batch / sampler 等ここに持つ
#endif
};
static StreamState g_stream;

// ============================================================
// HSP exports
// ============================================================

// llama_init
HSPLLAMA_EXPORT BOOL WINAPI hspllama_init(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
#if HSPLLAMA_HAVE_LLAMA
    // ggml backends (CPU, ggml-cpu-*.dll 等) を読み込んでから llama init
    ggml_backend_load_all();
    llama_backend_init();
#endif
    return 0;
}

// llama_shutdown
HSPLLAMA_EXPORT BOOL WINAPI hspllama_shutdown(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    for (int i = 0; i < (int)g_slots.size(); ++i) free_slot(i);
#if HSPLLAMA_HAVE_LLAMA
    llama_backend_free();
#endif
    return 0;
}

// llama_load "model.gguf", n_ctx, n_gpu_layers, var_h
HSPLLAMA_EXPORT BOOL WINAPI hspllama_load(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    const char* path = getstr();
    int n_ctx        = getint();
    int n_gpu_layers = getint();
    if (n_ctx <= 0) n_ctx = 2048;

#if !HSPLLAMA_HAVE_LLAMA
    (void)path; (void)n_gpu_layers;
    write_int_to_var(-100); // not linked
    return 0;
#else
    int h = alloc_slot();
    if (h < 0) { write_int_to_var(-1); return 0; }
    LlamaState& s = g_slots[h];

    llama_model_params mparams = llama_model_default_params();
    mparams.n_gpu_layers = n_gpu_layers;

    s.model = llama_model_load_from_file(path, mparams);
    if (!s.model) { write_int_to_var(-2); return 0; }

    llama_context_params cparams = llama_context_default_params();
    cparams.n_ctx = (uint32_t)n_ctx;
    s.ctx = llama_init_from_model(s.model, cparams);
    if (!s.ctx) {
        llama_model_free(s.model);
        s.model = nullptr;
        write_int_to_var(-3);
        return 0;
    }
    s.n_ctx   = n_ctx;
    s.n_vocab = llama_vocab_n_tokens(llama_model_get_vocab(s.model));
    s.used = true;
    write_int_to_var(h);
    return 0;
#endif
}

// llama_close h
HSPLLAMA_EXPORT BOOL WINAPI hspllama_close(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    free_slot(h);
    return 0;
}

// ---- 内部: ストリーム実装なしの同期推論 ----
#if HSPLLAMA_HAVE_LLAMA
static std::string do_complete_impl(LlamaState* s, const char* prompt, int max_tokens)
{
    if (!s || !s->ctx || !s->model || !prompt) return std::string();
    if (max_tokens <= 0) max_tokens = 256;

    const llama_vocab* vocab = llama_model_get_vocab(s->model);
    if (!vocab) return std::string();

    // tokenize
    int prompt_len = (int)strlen(prompt);
    std::vector<llama_token> tokens;
    tokens.resize((size_t)prompt_len + 16);
    int n_tokens = llama_tokenize(vocab, prompt, prompt_len,
                                  tokens.data(), (int)tokens.size(),
                                  /*add_special*/ true,
                                  /*parse_special*/ true);
    if (n_tokens < 0) {
        tokens.resize((size_t)(-n_tokens));
        n_tokens = llama_tokenize(vocab, prompt, prompt_len,
                                  tokens.data(), (int)tokens.size(),
                                  true, true);
    }
    if (n_tokens <= 0) return std::string();
    tokens.resize((size_t)n_tokens);

    // sampler chain: greedy で安定動作 (temperature/top_p は将来オプション化)
    llama_sampler_chain_params sp = llama_sampler_chain_default_params();
    llama_sampler* smpl = llama_sampler_chain_init(sp);
    llama_sampler_chain_add(smpl, llama_sampler_init_greedy());

    // 初回 decode (prompt まとめて)
    llama_batch batch = llama_batch_get_one(tokens.data(), (int32_t)tokens.size());
    if (llama_decode(s->ctx, batch) != 0) {
        llama_sampler_free(smpl);
        return std::string();
    }

    std::string out;
    out.reserve((size_t)max_tokens * 4);
    char detok_buf[256];

    for (int i = 0; i < max_tokens; ++i) {
        llama_token id = llama_sampler_sample(smpl, s->ctx, -1);
        if (id < 0 || llama_vocab_is_eog(vocab, id)) break;

        int n = llama_detokenize(vocab, &id, 1,
                                 detok_buf, (int)sizeof(detok_buf),
                                 /*remove_special*/ false,
                                 /*unparse_special*/ false);
        if (n > 0) {
            out.append(detok_buf, (size_t)n);
        }

        // 1 トークンを追加 decode
        llama_batch nb = llama_batch_get_one(&id, 1);
        if (llama_decode(s->ctx, nb) != 0) break;
    }

    llama_sampler_free(smpl);
    return out;
}
#endif

// llama_complete h, "prompt", max_tokens, var_result_str
HSPLLAMA_EXPORT BOOL WINAPI hspllama_complete(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    const char* prompt = getstr();
    int max_tokens = getint();
    LlamaState* s = get_slot(h);
    if (!s || !prompt) { write_str_to_var(""); return 0; }
#if HSPLLAMA_HAVE_LLAMA
    std::string out = do_complete_impl(s, prompt, max_tokens);
    write_str_to_var(out.c_str());
#else
    (void)max_tokens;
    write_str_to_var("[hspllama stub: llama.cpp not linked]");
#endif
    return 0;
}

// llama_chat h, "system", "user", max_tokens, var_result_str
HSPLLAMA_EXPORT BOOL WINAPI hspllama_chat(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    const char* sys = getstr();
    char sys_copy[4096];
    strncpy_s(sys_copy, sys ? sys : "", _TRUNCATE);
    const char* usr = getstr();
    int max_tokens = getint();
    LlamaState* s = get_slot(h);
    if (!s || !usr) { write_str_to_var(""); return 0; }

#if HSPLLAMA_HAVE_LLAMA
    // llama_chat_apply_template で system + user を chat template に変換 →
    // do_complete_impl に渡す。テンプレート名はモデルに埋め込まれた
    // metadata の chat_template を使用 (llama.cpp 側で自動選択可)。
    //
    // 現状は stub 相当で、system/user を単純連結してから complete。
    std::string prompt;
    if (sys_copy[0]) {
        prompt += "[SYSTEM]\n";
        prompt += sys_copy;
        prompt += "\n[USER]\n";
    }
    prompt += usr;
    prompt += "\n[ASSISTANT]\n";
    std::string out = do_complete_impl(s, prompt.c_str(), max_tokens);
    write_str_to_var(out.c_str());
#else
    (void)max_tokens;
    write_str_to_var("[hspllama stub: llama.cpp not linked]");
#endif
    return 0;
}

// llama_stream_begin h, "prompt", max_tokens
HSPLLAMA_EXPORT BOOL WINAPI hspllama_stream_begin(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    const char* prompt = getstr();
    int max_tokens = getint();
    (void)prompt;
    g_stream = StreamState{};
    g_stream.active = true;
    g_stream.slot_h = h;
    g_stream.max_tokens = max_tokens;
    g_stream.emitted = 0;
#if HSPLLAMA_HAVE_LLAMA
    // TODO: tokenize(prompt), 初回 decode
    g_stream.fake_text = "[stream impl pending]";
#else
    g_stream.fake_text = "[hspllama stub] ";
#endif
    g_stream.fake_pos = 0;
    return 0;
}

// llama_stream_next var_token_str → stat 1=continue 0=eos
// BOOL 戻り値を HSP ctx->stat に反映させるのは OLDDLL の contract ではないため、
// 実際には write_int_to_var(1/0) + write_str_to_var を両方呼ぶのが筋。
// しかし API 定義的には token_str 1 個のみ受ける形になっているので、ここでは
// hei->HspFunc_* の呼び出し順で、trailing var_int があれば stat を書く、
// なければ単に文字列を返し、コール側で llama_stream_next の stat は使わない
// (HSP 3 の stat は #func BOOL 戻り値の影響を受けないため、iron_llama.hsp 側で
// 別途「空文字 = eos」判定する設計にする)。
HSPLLAMA_EXPORT BOOL WINAPI hspllama_stream_next(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    if (!g_stream.active) { write_str_to_var(""); return 0; }

    // stub: fake_text を 1 文字ずつ返す。EOS は空文字を返して active=false。
    if (g_stream.fake_pos >= g_stream.fake_text.size()
        || g_stream.emitted >= g_stream.max_tokens)
    {
        g_stream.active = false;
        write_str_to_var("");
        return 0;
    }
    char buf[2] = { g_stream.fake_text[g_stream.fake_pos++], 0 };
    ++g_stream.emitted;
    write_str_to_var(buf);
    return 0;
}

HSPLLAMA_EXPORT BOOL WINAPI hspllama_stream_end(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    g_stream.active = false;
    g_stream.fake_text.clear();
    g_stream.fake_pos = 0;
    g_stream.emitted = 0;
    return 0;
}

HSPLLAMA_EXPORT BOOL WINAPI hspllama_n_ctx(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    LlamaState* s = get_slot(h);
    write_int_to_var(s ? s->n_ctx : -1);
    return 0;
}

HSPLLAMA_EXPORT BOOL WINAPI hspllama_n_vocab(HSPEXINFO* hei, int p1, int p2, int p3) {
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int h = getint();
    LlamaState* s = get_slot(h);
    write_int_to_var(s ? s->n_vocab : -1);
    return 0;
}

// ============================================================
// DllMain
// ============================================================
BOOL WINAPI DllMain(HINSTANCE, DWORD reason, LPVOID) {
    if (reason == DLL_PROCESS_DETACH) {
        for (int i = 0; i < (int)g_slots.size(); ++i) free_slot(i);
#if HSPLLAMA_HAVE_LLAMA
        llama_backend_free();
#endif
    }
    return TRUE;
}
