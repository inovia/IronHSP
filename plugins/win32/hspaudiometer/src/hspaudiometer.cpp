//============================================================
//   hspaudiometer.dll — WASAPI ループバックサウンドメーター
//
//   システム再生音を WASAPI ループバックキャプチャで取得し、
//   RMS / peak / dBFS / 8 バンドスペクトラム値を HSP へ返す。
//
//   HSP API (typed #func):
//     sm_open           ; WASAPI loopback スタート (default render デバイス)
//     sm_close
//     sm_poll           ; 最新データを内部バッファへ取り込む (毎フレーム呼ぶ)
//     sm_get_rms        var_dbl   ; 直近 ~20ms の RMS (0.0〜1.0)
//     sm_get_peak       var_dbl   ; 直近 ~20ms のピーク絶対値
//     sm_get_dbfs       var_dbl   ; RMS の dBFS (-inf〜0)
//     sm_get_band       int idx, var_dbl    ; 8 バンドスペクトラム (idx 0..7)
//     sm_get_sample_rate  var_int
//
//   バンド分割: 単純なサブサンプル平均 (ゾーン分け)。
//     b0: 〜250Hz     (サブ低域)
//     b1: 250〜500    (低)
//     b2: 500〜1k     (中低)
//     b3: 1k〜2k      (中)
//     b4: 2k〜4k      (高中)
//     b5: 4k〜8k      (高)
//     b6: 8k〜16k     (超高)
//     b7: 16k〜        (サブ超高)
//   (FFT は簡易な Cooley-Tukey radix-2、N=1024 固定)
//============================================================

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <mmdeviceapi.h>
#include <audioclient.h>
#include <functiondiscoverykeys_devpkey.h>
#include <cmath>
#include <vector>
#include <complex>
#include <mutex>

#pragma comment(lib, "Ole32.lib")

#define HSPSM_EXPORT extern "C" __declspec(dllexport)

// ============================================================
// Global state
// ============================================================
static bool                      g_opened = false;
static IMMDeviceEnumerator*      g_enum   = nullptr;
static IMMDevice*                g_dev    = nullptr;
static IAudioClient*             g_client = nullptr;
static IAudioCaptureClient*      g_cap    = nullptr;
static WAVEFORMATEX*              g_fmt    = nullptr;
static std::vector<float>        g_ring;              // 直近 N サンプル (mono に縮約)
static size_t                    g_ring_pos = 0;
static const size_t              FFT_N      = 1024;
static std::mutex                g_mu;

static std::vector<std::complex<double>> g_fft_w;     // twiddle factors

// ============================================================
// FFT (Cooley-Tukey radix-2, in-place)
// ============================================================
static void fft_init_twiddles()
{
    g_fft_w.resize(FFT_N / 2);
    for (size_t k = 0; k < FFT_N / 2; ++k) {
        double a = -2.0 * 3.14159265358979323846 * (double)k / (double)FFT_N;
        g_fft_w[k] = std::complex<double>(std::cos(a), std::sin(a));
    }
}

static void fft_inplace(std::vector<std::complex<double>>& data)
{
    size_t n = data.size();
    // bit-reversal
    size_t j = 0;
    for (size_t i = 1; i < n; ++i) {
        size_t bit = n >> 1;
        for (; j & bit; bit >>= 1) j ^= bit;
        j ^= bit;
        if (i < j) std::swap(data[i], data[j]);
    }
    for (size_t len = 2; len <= n; len <<= 1) {
        size_t half = len >> 1;
        size_t step = n / len;
        for (size_t i = 0; i < n; i += len) {
            for (size_t k = 0; k < half; ++k) {
                auto t = g_fft_w[k * step] * data[i + k + half];
                data[i + k + half] = data[i + k] - t;
                data[i + k]        = data[i + k] + t;
            }
        }
    }
}

// ============================================================
// init helpers
// ============================================================
static void free_all()
{
    std::lock_guard<std::mutex> lk(g_mu);
    if (g_client) g_client->Stop();
    if (g_cap)    { g_cap->Release();    g_cap    = nullptr; }
    if (g_client) { g_client->Release(); g_client = nullptr; }
    if (g_fmt)    { CoTaskMemFree(g_fmt); g_fmt   = nullptr; }
    if (g_dev)    { g_dev->Release();    g_dev    = nullptr; }
    if (g_enum)   { g_enum->Release();   g_enum   = nullptr; }
    g_ring.clear();
    g_ring_pos = 0;
    g_opened = false;
}

// ============================================================
// sm_open / sm_close
// ============================================================
HSPSM_EXPORT int __stdcall sm_open()
{
    if (g_opened) return 0;
    HRESULT hr = CoInitializeEx(nullptr, COINIT_MULTITHREADED);
    if (FAILED(hr) && hr != RPC_E_CHANGED_MODE) return -1;

    hr = CoCreateInstance(__uuidof(MMDeviceEnumerator), nullptr, CLSCTX_ALL,
                          __uuidof(IMMDeviceEnumerator),
                          reinterpret_cast<void**>(&g_enum));
    if (FAILED(hr)) return -2;

    hr = g_enum->GetDefaultAudioEndpoint(eRender, eMultimedia, &g_dev);
    if (FAILED(hr)) { free_all(); return -3; }

    hr = g_dev->Activate(__uuidof(IAudioClient), CLSCTX_ALL, nullptr,
                         reinterpret_cast<void**>(&g_client));
    if (FAILED(hr)) { free_all(); return -4; }

    hr = g_client->GetMixFormat(&g_fmt);
    if (FAILED(hr)) { free_all(); return -5; }

    // Loopback capture: AUDCLNT_STREAMFLAGS_LOOPBACK
    REFERENCE_TIME req_dur = 200 * 10000; // 200ms buffer
    hr = g_client->Initialize(AUDCLNT_SHAREMODE_SHARED,
                              AUDCLNT_STREAMFLAGS_LOOPBACK,
                              req_dur, 0, g_fmt, nullptr);
    if (FAILED(hr)) { free_all(); return -6; }

    hr = g_client->GetService(__uuidof(IAudioCaptureClient),
                              reinterpret_cast<void**>(&g_cap));
    if (FAILED(hr)) { free_all(); return -7; }

    hr = g_client->Start();
    if (FAILED(hr)) { free_all(); return -8; }

    g_ring.assign(FFT_N, 0.0f);
    g_ring_pos = 0;
    if (g_fft_w.empty()) fft_init_twiddles();

    g_opened = true;
    return 0;
}

HSPSM_EXPORT int __stdcall sm_close()
{
    free_all();
    return 0;
}

// ============================================================
// sm_poll : 最新 PCM を読み出してリングバッファへ追加
// ============================================================
HSPSM_EXPORT int __stdcall sm_poll()
{
    if (!g_opened || !g_cap || !g_fmt) return -1;
    std::lock_guard<std::mutex> lk(g_mu);

    UINT32 packet_size = 0;
    HRESULT hr = g_cap->GetNextPacketSize(&packet_size);
    if (FAILED(hr)) return -2;

    while (packet_size != 0) {
        BYTE* data = nullptr;
        UINT32 frames = 0;
        DWORD flags = 0;
        hr = g_cap->GetBuffer(&data, &frames, &flags, nullptr, nullptr);
        if (FAILED(hr)) return -3;
        if (frames > 0) {
            int ch = g_fmt->nChannels;
            int bps = g_fmt->wBitsPerSample;
            bool is_float = (g_fmt->wFormatTag == WAVE_FORMAT_IEEE_FLOAT);
            if (g_fmt->wFormatTag == WAVE_FORMAT_EXTENSIBLE) {
                // 多くの loopback は IEEE_FLOAT EXTENSIBLE
                is_float = true;
            }
            const float* fp = reinterpret_cast<const float*>(data);
            const short* sp = reinterpret_cast<const short*>(data);
            if (flags & AUDCLNT_BUFFERFLAGS_SILENT) {
                for (UINT32 i = 0; i < frames; ++i) {
                    g_ring[g_ring_pos] = 0.0f;
                    g_ring_pos = (g_ring_pos + 1) % FFT_N;
                }
            } else {
                for (UINT32 i = 0; i < frames; ++i) {
                    float mono = 0.0f;
                    if (is_float) {
                        for (int c = 0; c < ch; ++c) mono += fp[i * ch + c];
                    } else if (bps == 16) {
                        for (int c = 0; c < ch; ++c) mono += (float)sp[i * ch + c] / 32768.0f;
                    }
                    mono /= (float)ch;
                    g_ring[g_ring_pos] = mono;
                    g_ring_pos = (g_ring_pos + 1) % FFT_N;
                }
            }
        }
        g_cap->ReleaseBuffer(frames);
        hr = g_cap->GetNextPacketSize(&packet_size);
        if (FAILED(hr)) return -4;
    }
    return 0;
}

// ============================================================
// metrics
// ============================================================
HSPSM_EXPORT int __stdcall sm_get_rms(double* out)
{
    if (!g_opened || !out) return -1;
    std::lock_guard<std::mutex> lk(g_mu);
    double sum = 0.0;
    // 直近 FFT_N/4 サンプル (~ 5.8 ms @ 44.1kHz, ~5.3 ms @ 48kHz)
    size_t N = FFT_N / 4;
    for (size_t i = 0; i < N; ++i) {
        size_t idx = (g_ring_pos + FFT_N - 1 - i) % FFT_N;
        double v = g_ring[idx];
        sum += v * v;
    }
    *out = std::sqrt(sum / (double)N);
    return 0;
}

HSPSM_EXPORT int __stdcall sm_get_peak(double* out)
{
    if (!g_opened || !out) return -1;
    std::lock_guard<std::mutex> lk(g_mu);
    double mx = 0.0;
    size_t N = FFT_N / 4;
    for (size_t i = 0; i < N; ++i) {
        size_t idx = (g_ring_pos + FFT_N - 1 - i) % FFT_N;
        double v = std::abs((double)g_ring[idx]);
        if (v > mx) mx = v;
    }
    *out = mx;
    return 0;
}

HSPSM_EXPORT int __stdcall sm_get_dbfs(double* out)
{
    if (!g_opened || !out) return -1;
    double rms;
    if (sm_get_rms(&rms) < 0) return -2;
    if (rms <= 1e-9) { *out = -120.0; return 0; }
    *out = 20.0 * std::log10(rms);
    return 0;
}

HSPSM_EXPORT int __stdcall sm_get_band(int band_idx, double* out)
{
    if (!g_opened || !out || band_idx < 0 || band_idx >= 8) return -1;
    std::lock_guard<std::mutex> lk(g_mu);

    // リングバッファの最新 FFT_N サンプルを取り出して FFT
    std::vector<std::complex<double>> x(FFT_N);
    for (size_t i = 0; i < FFT_N; ++i) {
        size_t idx = (g_ring_pos + i) % FFT_N;
        // Hann window
        double w = 0.5 * (1.0 - std::cos(2.0 * 3.14159265358979323846 * i / (FFT_N - 1)));
        x[i] = std::complex<double>((double)g_ring[idx] * w, 0.0);
    }
    fft_inplace(x);

    double sr = g_fmt ? (double)g_fmt->nSamplesPerSec : 48000.0;
    double bin_hz = sr / (double)FFT_N;

    // band 境界 (Hz)
    static const double bands[9] = {
        0, 250, 500, 1000, 2000, 4000, 8000, 16000, 24000
    };
    double lo = bands[band_idx];
    double hi = bands[band_idx + 1];
    size_t lo_bin = (size_t)(lo / bin_hz);
    size_t hi_bin = (size_t)(hi / bin_hz);
    if (hi_bin > FFT_N / 2) hi_bin = FFT_N / 2;
    if (lo_bin >= hi_bin)  { *out = 0.0; return 0; }

    double sum = 0.0;
    for (size_t i = lo_bin; i < hi_bin; ++i) {
        double mag = std::abs(x[i]) / (double)FFT_N * 2.0;
        sum += mag;
    }
    double n = (double)(hi_bin - lo_bin);
    *out = sum / (n > 0 ? n : 1);
    return 0;
}

HSPSM_EXPORT int __stdcall sm_get_sample_rate(int* out)
{
    if (!g_opened || !out || !g_fmt) return -1;
    *out = (int)g_fmt->nSamplesPerSec;
    return 0;
}

BOOL WINAPI DllMain(HINSTANCE, DWORD reason, LPVOID)
{
    if (reason == DLL_PROCESS_DETACH) free_all();
    return TRUE;
}
