//============================================================
//   hspvosk.dll — Offline speech-to-text via Vosk (Kaldi)
//
//   alphacephei/vosk-api の libvosk.dll を C++ で薄くラップして
//   HSP から呼び出せるようにする helper DLL。
//
//   特徴:
//     - オフライン (ネットワーク不要)
//     - 軽量 (model 50 MB 〜)
//     - 多言語対応 (英語/日本語/中国語/フランス語/ロシア語... 24 言語以上)
//     - WAV / 生 PCM (s16/float32) から推論
//     - 連続認識 (partial result) もサポート
//
//   依存:
//     third_party/vosk-win64-0.3.45/libvosk.dll, libvosk.lib, vosk_api.h
//
//   モデル DL:
//     https://alphacephei.com/vosk/models
//     vosk-model-small-ja-0.22 (47 MB) や vosk-model-small-en-us-0.15 等
//
//   エクスポート:
//     int  vosk_open(const char* model_path, int sample_rate)
//     int  vosk_transcribe_wav(int handle, const char* wav_path, char* text, int len)
//     int  vosk_transcribe_pcm_s16(int handle, const short* pcm, int sample_count, char* text, int len)
//     void vosk_close(int handle)
//============================================================

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <vector>
#include <string>
#include <fstream>

#include "vosk_api.h"

#pragma comment(lib, "kernel32.lib")
#pragma comment(lib, "user32.lib")
#pragma comment(lib, "libvosk.lib")

#define HSPVOSK_EXPORT extern "C" __declspec(dllexport)

namespace {

constexpr int MAX_HANDLES = 16;

struct VoskState {
    bool active = false;
    VoskModel* model = nullptr;
    VoskRecognizer* recognizer = nullptr;
    int sample_rate = 16000;
    std::string model_path;
};

static VoskState g_states[MAX_HANDLES];
static bool g_log_set = false;

int FindFreeHandle() {
    for (int i = 0; i < MAX_HANDLES; i++) {
        if (!g_states[i].active) return i;
    }
    return -1;
}

// Vosk JSON 結果から "text" 値を抽出 (簡易: 最初の "text":"..." を見つける)
static std::string ExtractTextFromJson(const char* json) {
    if (!json) return "";
    const char* p = strstr(json, "\"text\"");
    if (!p) return "";
    p = strchr(p, ':');
    if (!p) return "";
    p++;
    while (*p && (*p == ' ' || *p == '\t')) p++;
    if (*p != '"') return "";
    p++;
    std::string out;
    while (*p && *p != '"') {
        if (*p == '\\' && p[1]) {
            p++;
            if (*p == 'n')      out += '\n';
            else if (*p == 't') out += '\t';
            else if (*p == 'r') out += '\r';
            else                out += *p;
            p++;
        } else {
            out += *p++;
        }
    }
    return out;
}

// 16bit PCM WAV loader → s16 配列に展開 (ダウンミックス込)
static bool LoadWavToS16Mono(const char* path, int target_sr, std::vector<short>& out) {
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
        char id[4]; uint32_t sz;
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
            pcm16.resize(sz / 2);
            f.read((char*)pcm16.data(), sz);
            break;
        } else {
            f.seekg(sz, std::ios::cur);
        }
    }
    if (channels == 0 || sampleRate == 0 || pcm16.empty()) return false;

    // モノラル化
    size_t frames = pcm16.size() / channels;
    std::vector<short> mono(frames);
    for (size_t i = 0; i < frames; i++) {
        int sum = 0;
        for (int c = 0; c < channels; c++) sum += pcm16[i * channels + c];
        mono[i] = (short)(sum / channels);
    }

    // リサンプル (target_sr が違う場合)
    if ((int)sampleRate == target_sr) {
        out = std::move(mono);
        return true;
    }
    double ratio = (double)target_sr / (double)sampleRate;
    size_t outN = (size_t)(frames * ratio);
    out.resize(outN);
    for (size_t i = 0; i < outN; i++) {
        double srcPos = (double)i / ratio;
        size_t srcIdx = (size_t)srcPos;
        double frac = srcPos - srcIdx;
        if (srcIdx + 1 < frames) {
            out[i] = (short)((1.0 - frac) * mono[srcIdx] + frac * mono[srcIdx + 1]);
        } else if (srcIdx < frames) {
            out[i] = mono[srcIdx];
        } else {
            out[i] = 0;
        }
    }
    return true;
}

} // namespace

//============================================================
// Exports
//============================================================

HSPVOSK_EXPORT int __stdcall hvosk_open(const char* model_path, int sample_rate) {
    if (!model_path) return -1;
    if (sample_rate <= 0) sample_rate = 16000;

    if (!g_log_set) {
        vosk_set_log_level(-1);  // silence
        g_log_set = true;
    }

    int handle = FindFreeHandle();
    if (handle < 0) return -1;
    VoskState& s = g_states[handle];

    s.model = vosk_model_new(model_path);
    if (!s.model) return -1;

    s.recognizer = vosk_recognizer_new(s.model, (float)sample_rate);
    if (!s.recognizer) {
        vosk_model_free(s.model);
        s.model = nullptr;
        return -1;
    }

    s.sample_rate = sample_rate;
    s.model_path = model_path;
    s.active = true;
    return handle;
}

HSPVOSK_EXPORT int __stdcall hvosk_transcribe_pcm_s16(int handle, const short* pcm, int sample_count,
                                                     char* out_text, int out_len) {
    if (handle < 0 || handle >= MAX_HANDLES) return -1;
    VoskState& s = g_states[handle];
    if (!s.active || !s.recognizer || !pcm || sample_count <= 0) return -1;
    if (!out_text || out_len <= 0) return -1;
    out_text[0] = 0;

    int byte_len = sample_count * (int)sizeof(short);
    vosk_recognizer_accept_waveform_s(s.recognizer, pcm, sample_count);
    const char* json = vosk_recognizer_final_result(s.recognizer);

    std::string text = ExtractTextFromJson(json);
    int n = (int)text.size();
    if (n >= out_len) n = out_len - 1;
    memcpy(out_text, text.data(), n);
    out_text[n] = 0;
    return n;
}

HSPVOSK_EXPORT int __stdcall hvosk_transcribe_wav(int handle, const char* wav_path,
                                                 char* out_text, int out_len) {
    if (handle < 0 || handle >= MAX_HANDLES) return -1;
    VoskState& s = g_states[handle];
    if (!s.active) return -1;

    std::vector<short> pcm;
    if (!LoadWavToS16Mono(wav_path, s.sample_rate, pcm)) return -1;
    return hvosk_transcribe_pcm_s16(handle, pcm.data(), (int)pcm.size(), out_text, out_len);
}

// 連続認識用: PCM chunk を食わせる
//   戻り値: 1 = 完全な phrase が確定 (final result 取得可能)
//           0 = まだ途中 (partial result 取得可能)
//          -1 = エラー
HSPVOSK_EXPORT int __stdcall hvosk_accept_pcm_s16(int handle, const short* pcm, int sample_count) {
    if (handle < 0 || handle >= MAX_HANDLES) return -1;
    VoskState& s = g_states[handle];
    if (!s.active || !s.recognizer || !pcm || sample_count <= 0) return -1;
    return vosk_recognizer_accept_waveform_s(s.recognizer, pcm, sample_count);
}

HSPVOSK_EXPORT int __stdcall hvosk_partial_result(int handle, char* out_text, int out_len) {
    if (handle < 0 || handle >= MAX_HANDLES) return -1;
    VoskState& s = g_states[handle];
    if (!s.active || !s.recognizer) return -1;
    if (!out_text || out_len <= 0) return -1;
    out_text[0] = 0;

    const char* json = vosk_recognizer_partial_result(s.recognizer);
    // partial result JSON: {"partial":"..."}
    // _ExtractTextFromJson は "text" を探すので partial 用の簡易版
    std::string result;
    if (json) {
        const char* p = strstr(json, "\"partial\"");
        if (p) {
            p = strchr(p, ':');
            if (p) {
                p++;
                while (*p && (*p == ' ' || *p == '\t')) p++;
                if (*p == '"') {
                    p++;
                    while (*p && *p != '"') {
                        if (*p == '\\' && p[1]) {
                            p++;
                            result += *p++;
                        } else {
                            result += *p++;
                        }
                    }
                }
            }
        }
    }
    int n = (int)result.size();
    if (n >= out_len) n = out_len - 1;
    memcpy(out_text, result.data(), n);
    out_text[n] = 0;
    return n;
}

HSPVOSK_EXPORT int __stdcall hvosk_final_result(int handle, char* out_text, int out_len) {
    if (handle < 0 || handle >= MAX_HANDLES) return -1;
    VoskState& s = g_states[handle];
    if (!s.active || !s.recognizer) return -1;
    if (!out_text || out_len <= 0) return -1;
    out_text[0] = 0;

    const char* json = vosk_recognizer_final_result(s.recognizer);
    std::string result = ExtractTextFromJson(json);
    int n = (int)result.size();
    if (n >= out_len) n = out_len - 1;
    memcpy(out_text, result.data(), n);
    out_text[n] = 0;
    return n;
}

HSPVOSK_EXPORT void __stdcall hvosk_reset(int handle) {
    if (handle < 0 || handle >= MAX_HANDLES) return;
    VoskState& s = g_states[handle];
    if (!s.active || !s.recognizer) return;
    vosk_recognizer_reset(s.recognizer);
}

HSPVOSK_EXPORT void __stdcall hvosk_close(int handle) {
    if (handle < 0 || handle >= MAX_HANDLES) return;
    VoskState& s = g_states[handle];
    if (!s.active) return;
    if (s.recognizer) {
        vosk_recognizer_free(s.recognizer);
        s.recognizer = nullptr;
    }
    if (s.model) {
        vosk_model_free(s.model);
        s.model = nullptr;
    }
    s.model_path.clear();
    s.active = false;
}

BOOL WINAPI DllMain(HMODULE, DWORD reason, LPVOID) {
    if (reason == DLL_PROCESS_DETACH) {
        for (int i = 0; i < MAX_HANDLES; i++) {
            if (g_states[i].active) hvosk_close(i);
        }
    }
    return TRUE;
}
