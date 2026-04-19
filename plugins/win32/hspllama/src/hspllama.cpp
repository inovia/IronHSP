//============================================================
//   hspllama.dll v2 — llama.cpp host plugin for IronHSP (新形式)
//
//   llama.cpp (https://github.com/ggerganov/llama.cpp) を embed
//   した local LLM 推論プラグイン。
//
//   v2 (2026-04-15): OLDDLL $202 → typed #func 形式に全面移行。
//   HSPEXINFO callback を一切使わず、各 export 関数は普通の C 関数。
//
//   HSP API (全て typed #func):
//     llama_init                                          初期化
//     llama_shutdown                                      終了処理
//     llama_load     "model.gguf", n_ctx, n_gpu, var_h    → var_h に handle
//     llama_close    h
//     llama_complete h, "prompt", max_tokens, var_buf, buf_size
//     llama_chat     h, "system", "user", max_tokens, var_buf, buf_size
//     llama_stream_begin h, "prompt", max_tokens
//     llama_stream_next  var_buf, buf_size                空文字 = eos
//     llama_stream_end
//     llama_n_ctx    h, var_int
//     llama_n_vocab  h, var_int
//
//   呼び出し例:
//     #include "hspllama.as"
//         llama_init
//         llama_load "model.gguf", 512, 0, h
//         if h < 0 : end
//         sdim reply, 4096
//         llama_complete h, "The capital of Japan is", 32, reply, 4096
//         mes reply
//         llama_close h
//         llama_shutdown
//
//   NOTE:
//     - __has_include("llama.h") が false の環境では全 API がスタブ動作
//     - 詳細は third_party/llamacpp/README.md
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
// Session handle table
// ============================================================
struct LlamaState {
    bool            used = false;
    llama_model*    model = nullptr;
    llama_context*  ctx = nullptr;
    int             n_ctx = 2048;
    int             n_vocab = 0;
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

// 文字列を HSP 側のバッファに安全コピー (null 終端付き)
static void copy_to_buf(const std::string& src, char* out, int out_size) {
    if (!out || out_size <= 0) return;
    int n = (int)src.size();
    if (n >= out_size) n = out_size - 1;
    if (n > 0) memcpy(out, src.data(), (size_t)n);
    out[n] = 0;
}

static void copy_to_buf(const char* src, char* out, int out_size) {
    if (!out || out_size <= 0) return;
    if (!src) src = "";
    int n = (int)strlen(src);
    if (n >= out_size) n = out_size - 1;
    if (n > 0) memcpy(out, src, (size_t)n);
    out[n] = 0;
}

// ============================================================
// Streaming state (1 active stream at a time)
// ============================================================
struct StreamState {
    bool          active = false;
    int           slot_h = -1;
    int           max_tokens = 0;
    int           emitted = 0;
    std::string   fake_text;  // stub / フォールバック用
    size_t        fake_pos = 0;
#if HSPLLAMA_HAVE_LLAMA
    // 真のストリーミング実装で使う
    llama_sampler* smpl = nullptr;
    const llama_vocab* vocab = nullptr;
    std::string    carry;       // まだ返し切れていないバイト (連続呼び出しでチャンク化)
    bool           eos = false;
#endif
};
static StreamState g_stream;

// ============================================================
// 内部: 同期推論ループ (do_complete_impl)
// ============================================================
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

    // greedy sampler
    llama_sampler_chain_params sp = llama_sampler_chain_default_params();
    llama_sampler* smpl = llama_sampler_chain_init(sp);
    llama_sampler_chain_add(smpl, llama_sampler_init_greedy());

    // prompt まとめて decode
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

// ============================================================
// HSP exports (typed #func 形式)
//   全て int __stdcall 戻り値、引数は普通の C 型
// ============================================================

// llama_init  ─ 引数なし
HSPLLAMA_EXPORT int __stdcall hspllama_init() {
#if HSPLLAMA_HAVE_LLAMA
    // ggml backends (CPU, ggml-cpu-*.dll 等) を読み込んでから llama init
    ggml_backend_load_all();
    llama_backend_init();
#endif
    return 0;
}

// llama_shutdown ─ 引数なし
HSPLLAMA_EXPORT int __stdcall hspllama_shutdown() {
    for (int i = 0; i < (int)g_slots.size(); ++i) free_slot(i);
#if HSPLLAMA_HAVE_LLAMA
    llama_backend_free();
#endif
    return 0;
}

// llama_load(path, n_ctx, n_gpu_layers, var_h_int)
HSPLLAMA_EXPORT int __stdcall hspllama_load(
    const char* path, int n_ctx, int n_gpu_layers, int* out_h)
{
    if (!out_h) return -1;
    *out_h = -1;
    if (!path) return -1;
    if (n_ctx <= 0) n_ctx = 2048;

#if !HSPLLAMA_HAVE_LLAMA
    (void)n_gpu_layers;
    *out_h = -100; // not linked
    return 0;
#else
    int h = alloc_slot();
    if (h < 0) { *out_h = -1; return 0; }
    LlamaState& s = g_slots[h];

    llama_model_params mparams = llama_model_default_params();
    mparams.n_gpu_layers = n_gpu_layers;

    s.model = llama_model_load_from_file(path, mparams);
    if (!s.model) { *out_h = -2; return 0; }

    llama_context_params cparams = llama_context_default_params();
    cparams.n_ctx = (uint32_t)n_ctx;
    s.ctx = llama_init_from_model(s.model, cparams);
    if (!s.ctx) {
        llama_model_free(s.model);
        s.model = nullptr;
        *out_h = -3;
        return 0;
    }
    s.n_ctx   = n_ctx;
    s.n_vocab = llama_vocab_n_tokens(llama_model_get_vocab(s.model));
    s.used = true;
    *out_h = h;
    return 0;
#endif
}

// llama_close(h)
HSPLLAMA_EXPORT int __stdcall hspllama_close(int h) {
    free_slot(h);
    return 0;
}

// llama_complete(h, prompt, max_tokens, var_buf, buf_size)
HSPLLAMA_EXPORT int __stdcall hspllama_complete(
    int h, const char* prompt, int max_tokens, char* out_buf, int out_size)
{
    if (out_buf && out_size > 0) out_buf[0] = 0;
    LlamaState* s = get_slot(h);
    if (!s || !prompt) return -1;
#if HSPLLAMA_HAVE_LLAMA
    std::string out = do_complete_impl(s, prompt, max_tokens);
    copy_to_buf(out, out_buf, out_size);
#else
    (void)max_tokens;
    copy_to_buf("[hspllama stub: llama.cpp not linked]", out_buf, out_size);
#endif
    return 0;
}

// llama_chat(h, system, user, max_tokens, var_buf, buf_size)
HSPLLAMA_EXPORT int __stdcall hspllama_chat(
    int h, const char* sys, const char* usr, int max_tokens,
    char* out_buf, int out_size)
{
    if (out_buf && out_size > 0) out_buf[0] = 0;
    LlamaState* s = get_slot(h);
    if (!s || !usr) return -1;

#if HSPLLAMA_HAVE_LLAMA
    // 単純連結 → do_complete_impl
    // 将来 llama_chat_apply_template でモデル付属テンプレに置き換え予定
    std::string prompt;
    if (sys && sys[0]) {
        prompt += "[SYSTEM]\n";
        prompt += sys;
        prompt += "\n[USER]\n";
    }
    prompt += usr;
    prompt += "\n[ASSISTANT]\n";
    std::string out = do_complete_impl(s, prompt.c_str(), max_tokens);
    copy_to_buf(out, out_buf, out_size);
#else
    (void)sys; (void)max_tokens;
    copy_to_buf("[hspllama stub: llama.cpp not linked]", out_buf, out_size);
#endif
    return 0;
}

// llama_stream_begin(h, prompt, max_tokens)
//   prompt をトークン化 → 初回 decode まで済ませてステート保存。
//   以降 hspllama_stream_next を繰り返し呼ぶとトークン 1 つずつ返す。
HSPLLAMA_EXPORT int __stdcall hspllama_stream_begin(
    int h, const char* prompt, int max_tokens)
{
#if HSPLLAMA_HAVE_LLAMA
    // 前回のストリームが残ってれば掃除
    if (g_stream.active && g_stream.smpl) {
        llama_sampler_free(g_stream.smpl);
        g_stream.smpl = nullptr;
    }
#endif
    g_stream = StreamState{};
    g_stream.slot_h     = h;
    g_stream.max_tokens = max_tokens > 0 ? max_tokens : 256;

#if HSPLLAMA_HAVE_LLAMA
    LlamaState* s = get_slot(h);
    if (!s || !s->ctx || !s->model || !prompt) {
        g_stream.fake_text = "[hspllama: invalid handle or null prompt]";
        g_stream.active = true;
        return 0;
    }

    const llama_vocab* vocab = llama_model_get_vocab(s->model);
    if (!vocab) {
        g_stream.fake_text = "[hspllama: no vocab]";
        g_stream.active = true;
        return 0;
    }

    // KV cache を前回呼び出しの残渣ごとクリア
    llama_memory_t mem = llama_get_memory(s->ctx);
    if (mem) llama_memory_clear(mem, true);

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
    if (n_tokens <= 0) {
        g_stream.fake_text = "[hspllama: tokenize failed]";
        g_stream.active = true;
        return 0;
    }
    tokens.resize((size_t)n_tokens);

    // greedy sampler (同期 API と揃える)
    llama_sampler_chain_params sp = llama_sampler_chain_default_params();
    g_stream.smpl = llama_sampler_chain_init(sp);
    llama_sampler_chain_add(g_stream.smpl, llama_sampler_init_greedy());

    llama_batch batch = llama_batch_get_one(tokens.data(), (int32_t)tokens.size());
    if (llama_decode(s->ctx, batch) != 0) {
        llama_sampler_free(g_stream.smpl);
        g_stream.smpl = nullptr;
        g_stream.fake_text = "[hspllama: prompt decode failed]";
        g_stream.active = true;
        return 0;
    }

    g_stream.vocab  = vocab;
    g_stream.eos    = false;
    g_stream.carry.clear();
    g_stream.active = true;
    g_stream.fake_text.clear();
    g_stream.fake_pos = 0;
    return 0;
#else
    g_stream.fake_text = "[hspllama stub] ";
    g_stream.fake_pos  = 0;
    g_stream.active    = true;
    return 0;
#endif
}

// llama_stream_next(var_buf, buf_size)
//   1 トークン分の detokenize 結果 (UTF-8) を out_buf に書き込む。
//   空文字列を書いた場合は EOS (ストリーム終了)。
HSPLLAMA_EXPORT int __stdcall hspllama_stream_next(char* out_buf, int out_size) {
    if (out_buf && out_size > 0) out_buf[0] = 0;
    if (!g_stream.active || out_size < 2) return 0;

#if HSPLLAMA_HAVE_LLAMA
    // 真のストリーミング (vocab/sampler あり)
    if (g_stream.vocab && g_stream.smpl && g_stream.fake_text.empty()) {
        LlamaState* s = get_slot(g_stream.slot_h);
        if (!s || !s->ctx) { g_stream.active = false; return 0; }

        // carry に残ってるバイトがあれば先に吐く
        if (!g_stream.carry.empty()) {
            int take = (int)g_stream.carry.size();
            if (take >= out_size) take = out_size - 1;
            memcpy(out_buf, g_stream.carry.data(), (size_t)take);
            out_buf[take] = 0;
            g_stream.carry.erase(0, (size_t)take);
            return 0;
        }

        if (g_stream.eos || g_stream.emitted >= g_stream.max_tokens) {
            g_stream.active = false;
            return 0;
        }

        llama_token id = llama_sampler_sample(g_stream.smpl, s->ctx, -1);
        if (id < 0 || llama_vocab_is_eog(g_stream.vocab, id)) {
            g_stream.eos = true;
            g_stream.active = false;
            return 0;
        }

        char detok[256];
        int n = llama_detokenize(g_stream.vocab, &id, 1,
                                 detok, (int)sizeof(detok),
                                 false, false);
        if (n > 0) {
            int take = n < (out_size - 1) ? n : (out_size - 1);
            memcpy(out_buf, detok, (size_t)take);
            out_buf[take] = 0;
            if (n > take) g_stream.carry.assign(detok + take, (size_t)(n - take));
        }

        // 次トークンのため 1 件 decode
        llama_batch nb = llama_batch_get_one(&id, 1);
        if (llama_decode(s->ctx, nb) != 0) {
            g_stream.eos = true;
        }
        ++g_stream.emitted;
        return 0;
    }
#endif

    // フォールバック (fake_text から 1 文字ずつ返す)
    if (g_stream.fake_pos >= g_stream.fake_text.size()
        || g_stream.emitted >= g_stream.max_tokens) {
        g_stream.active = false;
        return 0;
    }
    out_buf[0] = g_stream.fake_text[g_stream.fake_pos++];
    out_buf[1] = 0;
    ++g_stream.emitted;
    return 0;
}

// llama_stream_end
HSPLLAMA_EXPORT int __stdcall hspllama_stream_end() {
    g_stream.active = false;
#if HSPLLAMA_HAVE_LLAMA
    if (g_stream.smpl) {
        llama_sampler_free(g_stream.smpl);
        g_stream.smpl = nullptr;
    }
    g_stream.vocab = nullptr;
    g_stream.carry.clear();
    g_stream.eos = false;
#endif
    g_stream.fake_text.clear();
    g_stream.fake_pos = 0;
    g_stream.emitted = 0;
    return 0;
}

// llama_n_ctx(h, var_int)
HSPLLAMA_EXPORT int __stdcall hspllama_n_ctx(int h, int* out) {
    LlamaState* s = get_slot(h);
    if (out) *out = s ? s->n_ctx : -1;
    return 0;
}

// llama_n_vocab(h, var_int)
HSPLLAMA_EXPORT int __stdcall hspllama_n_vocab(int h, int* out) {
    LlamaState* s = get_slot(h);
    if (out) *out = s ? s->n_vocab : -1;
    return 0;
}
