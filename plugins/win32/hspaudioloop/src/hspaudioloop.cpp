//
//  hspaudioloop.dll - WASAPI audio loopback capture for HSP
//
//  Captures system audio output (what you hear) to a WAV file.
//  Uses WASAPI loopback mode (Vista+).
//
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <mmdeviceapi.h>
#include <audioclient.h>
#include <cstdio>
#include <string>
#include <cstring>

#pragma comment(lib, "ole32.lib")

// UTF-8 → UTF-16 helper
static std::wstring utf8_to_wide(const char *s) {
    if (!s || !s[0]) return L"";
    int len = MultiByteToWideChar(CP_UTF8, 0, s, -1, NULL, 0);
    std::wstring w(len, 0);
    MultiByteToWideChar(CP_UTF8, 0, s, -1, &w[0], len);
    return w;
}
static std::string wide_to_utf8(const wchar_t *w) {
    if (!w || !w[0]) return "";
    int len = WideCharToMultiByte(CP_UTF8, 0, w, -1, NULL, 0, NULL, NULL);
    std::string s(len, 0);
    WideCharToMultiByte(CP_UTF8, 0, w, -1, &s[0], len, NULL, NULL);
    return s;
}


#define EXPORT extern "C" __declspec(dllexport)

static IMMDeviceEnumerator *g_enumerator = nullptr;
static IMMDevice *g_device = nullptr;
static IAudioClient *g_client = nullptr;
static IAudioCaptureClient *g_capture = nullptr;
static WAVEFORMATEX *g_format = nullptr;
static bool g_recording = false;
static FILE *g_wavfp = nullptr;
static DWORD g_data_size = 0;

static void write_wav_header(FILE *fp, WAVEFORMATEX *wf, DWORD dataSize)
{
    fseek(fp, 0, SEEK_SET);
    DWORD fileSize = 36 + dataSize;
    fwrite("RIFF", 1, 4, fp);
    fwrite(&fileSize, 4, 1, fp);
    fwrite("WAVE", 1, 4, fp);
    fwrite("fmt ", 1, 4, fp);
    DWORD fmtSize = 16;
    WORD audioFmt = 1; // PCM
    if (wf->wFormatTag == WAVE_FORMAT_IEEE_FLOAT) audioFmt = 3;
    fwrite(&fmtSize, 4, 1, fp);
    fwrite(&audioFmt, 2, 1, fp);
    fwrite(&wf->nChannels, 2, 1, fp);
    fwrite(&wf->nSamplesPerSec, 4, 1, fp);
    fwrite(&wf->nAvgBytesPerSec, 4, 1, fp);
    fwrite(&wf->nBlockAlign, 2, 1, fp);
    fwrite(&wf->wBitsPerSample, 2, 1, fp);
    fwrite("data", 1, 4, fp);
    fwrite(&dataSize, 4, 1, fp);
}

//------------------------------------------------------------
// audioloop_start(filename) - Start recording to WAV file
//   Returns 0 on success.
//------------------------------------------------------------
EXPORT int __cdecl audioloop_start(const char *filename)
{
    if (g_recording) return -1;

    CoInitializeEx(nullptr, COINIT_MULTITHREADED);

    HRESULT hr;
    hr = CoCreateInstance(__uuidof(MMDeviceEnumerator), nullptr, CLSCTX_ALL,
                          __uuidof(IMMDeviceEnumerator), (void **)&g_enumerator);
    if (FAILED(hr)) return -2;

    hr = g_enumerator->GetDefaultAudioEndpoint(eRender, eConsole, &g_device);
    if (FAILED(hr)) return -3;

    hr = g_device->Activate(__uuidof(IAudioClient), CLSCTX_ALL, nullptr, (void **)&g_client);
    if (FAILED(hr)) return -4;

    hr = g_client->GetMixFormat(&g_format);
    if (FAILED(hr)) return -5;

    // AUDCLNT_STREAMFLAGS_LOOPBACK = 0x00020000
    hr = g_client->Initialize(AUDCLNT_SHAREMODE_SHARED, 0x00020000,
                               10000000, 0, g_format, nullptr);
    if (FAILED(hr)) return -6;

    hr = g_client->GetService(__uuidof(IAudioCaptureClient), (void **)&g_capture);
    if (FAILED(hr)) return -7;

    g_wavfp = _wfopen(utf8_to_wide(filename).c_str(), L"wb");
    if (!g_wavfp) return -8;

    // Write placeholder header
    g_data_size = 0;
    write_wav_header(g_wavfp, g_format, 0);

    hr = g_client->Start();
    if (FAILED(hr)) { fclose(g_wavfp); g_wavfp = nullptr; return -9; }

    g_recording = true;
    return 0;
}

//------------------------------------------------------------
// audioloop_poll() - Poll and write captured audio data
//   Call this periodically (every 50-100ms). Returns bytes written.
//------------------------------------------------------------
EXPORT int __cdecl audioloop_poll()
{
    if (!g_recording || !g_capture || !g_wavfp) return -1;

    UINT32 packetLength = 0;
    int totalWritten = 0;

    g_capture->GetNextPacketSize(&packetLength);
    while (packetLength > 0) {
        BYTE *data = nullptr;
        UINT32 numFrames = 0;
        DWORD flags = 0;

        HRESULT hr = g_capture->GetBuffer(&data, &numFrames, &flags, nullptr, nullptr);
        if (FAILED(hr)) break;

        int bytes = numFrames * g_format->nBlockAlign;
        if (flags & 0x2) { // AUDCLNT_BUFFERFLAGS_SILENT
            // Write silence
            char zeros[4096] = {};
            int remaining = bytes;
            while (remaining > 0) {
                int chunk = remaining < 4096 ? remaining : 4096;
                fwrite(zeros, 1, chunk, g_wavfp);
                remaining -= chunk;
            }
        } else {
            fwrite(data, 1, bytes, g_wavfp);
        }
        g_data_size += bytes;
        totalWritten += bytes;

        g_capture->ReleaseBuffer(numFrames);
        g_capture->GetNextPacketSize(&packetLength);
    }
    return totalWritten;
}

//------------------------------------------------------------
// audioloop_stop() - Stop recording and finalize WAV
//------------------------------------------------------------
EXPORT int __cdecl audioloop_stop()
{
    if (!g_recording) return -1;
    g_recording = false;

    if (g_client) g_client->Stop();

    // Update WAV header with final data size
    if (g_wavfp && g_format) {
        write_wav_header(g_wavfp, g_format, g_data_size);
        fclose(g_wavfp);
        g_wavfp = nullptr;
    }

    if (g_format) { CoTaskMemFree(g_format); g_format = nullptr; }
    if (g_capture) { g_capture->Release(); g_capture = nullptr; }
    if (g_client) { g_client->Release(); g_client = nullptr; }
    if (g_device) { g_device->Release(); g_device = nullptr; }
    if (g_enumerator) { g_enumerator->Release(); g_enumerator = nullptr; }

    return 0;
}

//------------------------------------------------------------
// audioloop_get_info(channels, sample_rate, bits)
//------------------------------------------------------------
EXPORT int __cdecl audioloop_get_info(int *channels, int *sample_rate, int *bits)
{
    if (!g_format) return -1;
    *channels = g_format->nChannels;
    *sample_rate = g_format->nSamplesPerSec;
    *bits = g_format->wBitsPerSample;
    return 0;
}

BOOL WINAPI DllMain(HINSTANCE h, DWORD r, LPVOID p) {
    if (r == DLL_PROCESS_DETACH && g_recording) audioloop_stop();
    return TRUE;
}
