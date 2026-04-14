//============================================================
//   hspwhisper.dll — Offline speech-to-text via whisper.cpp
//
//   ggerganov/whisper.cpp の whisper_init_from_file_with_params /
//   whisper_full / whisper_get_segment_text を C++ で薄くラップして
//   HSP から呼び出せるようにする helper DLL。
//
//   特徴:
//     - オフライン (ネットワーク不要、API キー不要)
//     - GGML 量子化モデル (tiny ~75MB, base ~140MB, small ~470MB,
//       medium ~1.5GB, large ~3GB) を選択可能
//     - 多言語対応 (日本語含む)
//     - WAV ファイル / 生 PCM 配列 から推論
//
//   依存:
//     third_party/whisper.cpp (cmake build 済の whisper.lib + ggml*.lib)
//
//   モデル DL:
//     curl -L -o models/ggml-base.bin \
//       https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-base.bin
//
//   エクスポート:
//     int  whisper_open(const char* model_path)
//          → handle (>=0) / -1 失敗
//
//     int  whisper_transcribe_wav(int handle, const char* wav_path,
//                                  const char* lang, char* text, int text_len)
//          → bytes written to text, -1 失敗
//
//     int  whisper_transcribe_pcm(int handle, const float* pcm_f32,
//                                  int sample_count, const char* lang,
//                                  char* text, int text_len)
//          → bytes written to text, -1 失敗
//          (16kHz mono float32 想定)
//
//     void whisper_close(int handle)
//============================================================

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <vector>
#include <string>
#include <fstream>

#include "whisper.h"

#pragma comment(lib, "kernel32.lib")
#pragma comment(lib, "user32.lib")

#define HSPWHISPER_EXPORT extern "C" __declspec(dllexport)

namespace {

constexpr int MAX_HANDLES = 16;

struct WhisperState {
    bool active = false;
    whisper_context* ctx = nullptr;
    std::string model_path;
};

static WhisperState g_states[MAX_HANDLES];

int FindFreeHandle() {
    for (int i = 0; i < MAX_HANDLES; i++) {
        if (!g_states[i].active) return i;
    }
    return -1;
}

// 簡易 WAV loader
//   読み込み: 16bit signed PCM のみ
//   出力: 16kHz mono float32 の vector (リサンプル + ダウンミックスも実施)
static bool LoadWavTo16kMono(const char* path, std::vector<float>& out) {
    out.clear();
    std::ifstream f(path, std::ios::binary);
    if (!f) return false;

    char riff[4]; f.read(riff, 4);
    if (memcmp(riff, "RIFF", 4) != 0) return false;
    uint32_t fileSize; f.read((char*)&fileSize, 4);
    char wave[4]; f.read(wave, 4);
    if (memcmp(wave, "WAVE", 4) != 0) return false;

    uint16_t channels = 0;
    uint32_t sampleRate = 0;
    uint16_t bitsPerSample = 0;
    uint16_t format = 0;
    std::vector<int16_t> pcm16;

    while (f) {
        char id[4];
        uint32_t sz;
        if (!f.read(id, 4)) break;
        if (!f.read((char*)&sz, 4)) break;

        if (memcmp(id, "fmt ", 4) == 0) {
            std::vector<char> fmt(sz);
            f.read(fmt.data(), sz);
            format        = *(uint16_t*)(fmt.data() + 0);
            channels      = *(uint16_t*)(fmt.data() + 2);
            sampleRate    = *(uint32_t*)(fmt.data() + 4);
            bitsPerSample = *(uint16_t*)(fmt.data() + 14);
        } else if (memcmp(id, "data", 4) == 0) {
            if (format != 1 || bitsPerSample != 16) return false;
            size_t samples = sz / 2;
            pcm16.resize(samples);
            f.read((char*)pcm16.data(), sz);
            break;
        } else {
            f.seekg(sz, std::ios::cur);
        }
    }

    if (channels == 0 || sampleRate == 0 || pcm16.empty()) return false;

    // モノラル化 (チャンネル平均)
    size_t frameCount = pcm16.size() / channels;
    std::vector<float> mono(frameCount);
    for (size_t i = 0; i < frameCount; i++) {
        int sum = 0;
        for (int c = 0; c < channels; c++) {
            sum += pcm16[i * channels + c];
        }
        mono[i] = (float)sum / (float)channels / 32768.0f;
    }

    // 16kHz リサンプル (簡易線形補間)
    if (sampleRate == 16000) {
        out = std::move(mono);
        return true;
    }
    double ratio = 16000.0 / (double)sampleRate;
    size_t outSamples = (size_t)((double)frameCount * ratio);
    out.resize(outSamples);
    for (size_t i = 0; i < outSamples; i++) {
        double srcPos = (double)i / ratio;
        size_t srcIdx = (size_t)srcPos;
        double frac = srcPos - (double)srcIdx;
        if (srcIdx + 1 < frameCount) {
            out[i] = (float)((1.0 - frac) * mono[srcIdx] + frac * mono[srcIdx + 1]);
        } else if (srcIdx < frameCount) {
            out[i] = mono[srcIdx];
        } else {
            out[i] = 0.0f;
        }
    }
    return true;
}

// 内部: 推論本体 (PCM float32 16k mono を受けて全 segment テキストを連結)
static int RunInference(WhisperState& s, const float* pcm, int n_samples, const char* lang, char* out_text, int out_len) {
    if (!s.active || !s.ctx || !pcm || n_samples <= 0) return -1;
    if (!out_text || out_len <= 0) return -1;
    out_text[0] = 0;

    whisper_full_params params = whisper_full_default_params(WHISPER_SAMPLING_GREEDY);
    params.print_progress = false;
    params.print_special = false;
    params.print_timestamps = false;
    params.print_realtime = false;
    params.translate = false;
    if (lang && *lang) {
        params.language = lang;
    } else {
        params.language = "auto";
    }
    params.n_threads = 4;

    int rc = whisper_full(s.ctx, params, pcm, n_samples);
    if (rc != 0) return -1;

    int n_seg = whisper_full_n_segments(s.ctx);
    std::string concat;
    for (int i = 0; i < n_seg; i++) {
        const char* t = whisper_full_get_segment_text(s.ctx, i);
        if (t) concat += t;
    }

    int n = (int)concat.size();
    if (n >= out_len) n = out_len - 1;
    memcpy(out_text, concat.data(), n);
    out_text[n] = 0;
    return n;
}

} // namespace

//============================================================
// Exports
//============================================================

HSPWHISPER_EXPORT int __stdcall whisper_open(const char* model_path) {
    if (!model_path) return -1;
    int handle = FindFreeHandle();
    if (handle < 0) return -1;

    WhisperState& s = g_states[handle];

    whisper_context_params cparams = whisper_context_default_params();
    cparams.use_gpu = false;          // CPU 推論 (GPU 版は別ビルド要)

    s.ctx = whisper_init_from_file_with_params(model_path, cparams);
    if (!s.ctx) return -1;
    s.model_path = model_path;
    s.active = true;
    return handle;
}

HSPWHISPER_EXPORT int __stdcall whisper_transcribe_wav(int handle, const char* wav_path,
                                                       const char* lang,
                                                       char* out_text, int out_len) {
    if (handle < 0 || handle >= MAX_HANDLES) return -1;
    WhisperState& s = g_states[handle];
    if (!s.active) return -1;

    std::vector<float> pcm;
    if (!LoadWavTo16kMono(wav_path, pcm)) return -1;

    return RunInference(s, pcm.data(), (int)pcm.size(), lang, out_text, out_len);
}

HSPWHISPER_EXPORT int __stdcall whisper_transcribe_pcm(int handle, const float* pcm_f32,
                                                       int sample_count, const char* lang,
                                                       char* out_text, int out_len) {
    if (handle < 0 || handle >= MAX_HANDLES) return -1;
    WhisperState& s = g_states[handle];
    if (!s.active) return -1;
    return RunInference(s, pcm_f32, sample_count, lang, out_text, out_len);
}

HSPWHISPER_EXPORT void __stdcall whisper_close(int handle) {
    if (handle < 0 || handle >= MAX_HANDLES) return;
    WhisperState& s = g_states[handle];
    if (!s.active) return;
    if (s.ctx) {
        whisper_free(s.ctx);
        s.ctx = nullptr;
    }
    s.model_path.clear();
    s.active = false;
}

BOOL WINAPI DllMain(HMODULE, DWORD reason, LPVOID) {
    if (reason == DLL_PROCESS_DETACH) {
        for (int i = 0; i < MAX_HANDLES; i++) {
            if (g_states[i].active) whisper_close(i);
        }
    }
    return TRUE;
}
