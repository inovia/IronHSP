/*
 * hspwasapi.cpp -- WASAPI audio capture / render plugin for IronHSP
 *
 * Handle-based design (max 16 simultaneous devices).
 * Event-driven capture with worker thread.
 * WAV file output with proper header finalization.
 * PCM ring buffer for real-time visualization.
 * UTF-8 filenames via MultiByteToWideChar + _wfopen.
 *
 * Exports are __cdecl for HSP #cfunc / #func.
 */

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <initguid.h>
#include <mmdeviceapi.h>
#include <audioclient.h>
#include <functiondiscoverykeys_devpkey.h>
#include <avrt.h>
#include <strsafe.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#pragma comment(lib, "ole32.lib")
#pragma comment(lib, "avrt.lib")

#define EXPORT extern "C" __declspec(dllexport)

/* ================================================================
 *  Constants
 * ================================================================ */
static const int MAX_DEVICES = 16;
static const int RING_SIZE   = 65536;   /* samples (not bytes) */

/* ================================================================
 *  WAV header (44 bytes, canonical PCM)
 * ================================================================ */
#pragma pack(push, 1)
struct WavHeader {
    char     riff[4];        /* "RIFF" */
    DWORD    fileSize;       /* total - 8 */
    char     wave[4];        /* "WAVE" */
    char     fmt_[4];        /* "fmt " */
    DWORD    fmtSize;        /* 16 */
    WORD     formatTag;      /* 1 = PCM */
    WORD     channels;
    DWORD    sampleRate;
    DWORD    byteRate;
    WORD     blockAlign;
    WORD     bitsPerSample;
    char     data[4];        /* "data" */
    DWORD    dataSize;
};
#pragma pack(pop)

static void MakeWavHeader(WavHeader *h, int ch, int hz, int bps, DWORD dataBytes)
{
    memcpy(h->riff, "RIFF", 4);
    memcpy(h->wave, "WAVE", 4);
    memcpy(h->fmt_, "fmt ", 4);
    memcpy(h->data, "data", 4);
    h->fmtSize       = 16;
    h->formatTag      = 1;
    h->channels       = (WORD)ch;
    h->sampleRate     = (DWORD)hz;
    h->bitsPerSample  = (WORD)bps;
    h->blockAlign     = (WORD)(ch * bps / 8);
    h->byteRate       = (DWORD)(hz * h->blockAlign);
    h->dataSize       = dataBytes;
    h->fileSize       = (DWORD)(sizeof(WavHeader) - 8 + dataBytes);
}

/* ================================================================
 *  Per-handle state
 * ================================================================ */
enum DeviceState { DS_FREE = 0, DS_OPEN, DS_RUNNING };
enum DeviceDir   { DIR_CAPTURE = 0, DIR_RENDER = 1 };

struct DeviceSlot {
    DeviceState          state;
    DeviceDir            direction;
    int                  channels;
    int                  sampleRate;
    int                  bitsPerSample;
    size_t               frameSize;

    IMMDevice           *mmDevice;
    IAudioClient        *audioClient;
    IAudioCaptureClient *captureClient;
    IAudioRenderClient  *renderClient;

    /* events & thread */
    HANDLE               hShutdown;
    HANDLE               hReady;
    HANDLE               hThread;

    /* WAV file output */
    FILE                *wavFile;
    DWORD                wavDataBytes;

    /* ring buffer (16-bit samples, interleaved) */
    short                ring[RING_SIZE];
    volatile LONG        ringWrite;   /* next write position */
    volatile LONG        ringRead;    /* next read position  */

    /* peak level (updated by worker) */
    volatile LONG        peakLevel;

    CRITICAL_SECTION     cs;
};

static DeviceSlot g_slots[MAX_DEVICES];
static bool       g_comInit = false;

/* ================================================================
 *  Helpers
 * ================================================================ */
template <class T>
static void SafeRelease(T **pp)
{
    if (*pp) { (*pp)->Release(); *pp = nullptr; }
}

static FILE *OpenFileUTF8(const char *utf8path, const wchar_t *mode)
{
    wchar_t wpath[1024];
    int n = MultiByteToWideChar(CP_UTF8, 0, utf8path, -1, wpath, 1024);
    if (n <= 0) return nullptr;
    return _wfopen(wpath, mode);
}

static void SlotReset(DeviceSlot *s)
{
    s->state          = DS_FREE;
    s->mmDevice       = nullptr;
    s->audioClient    = nullptr;
    s->captureClient  = nullptr;
    s->renderClient   = nullptr;
    s->hShutdown      = nullptr;
    s->hReady         = nullptr;
    s->hThread        = nullptr;
    s->wavFile        = nullptr;
    s->wavDataBytes   = 0;
    s->ringWrite      = 0;
    s->ringRead       = 0;
    s->peakLevel      = 0;
    s->channels       = 0;
    s->sampleRate     = 0;
    s->bitsPerSample  = 0;
    s->frameSize      = 0;
}

/* Push interleaved 16-bit samples into ring buffer and update peak */
static void RingPush(DeviceSlot *s, const BYTE *pData, UINT32 frames, DWORD flags)
{
    int totalSamples = (int)(frames * s->channels);
    int peak = (int)s->peakLevel;

    for (int i = 0; i < totalSamples; i++) {
        short sample = 0;
        if (!(flags & AUDCLNT_BUFFERFLAGS_SILENT)) {
            if (s->bitsPerSample == 16) {
                sample = ((const short *)pData)[i];
            } else if (s->bitsPerSample == 8) {
                sample = (short)(((const unsigned char *)pData)[i] - 128) << 8;
            } else if (s->bitsPerSample == 24) {
                /* take upper 16 bits of 24-bit sample */
                int off = i * 3;
                int val = (int)((signed char)pData[off + 2]) << 16
                        | (int)(pData[off + 1]) << 8
                        | (int)(pData[off]);
                sample = (short)(val >> 8);
            } else if (s->bitsPerSample == 32) {
                sample = (short)(((const int *)pData)[i] >> 16);
            }
        }
        int abs_s = sample < 0 ? -sample : sample;
        if (abs_s > peak) peak = abs_s;

        LONG pos = s->ringWrite % RING_SIZE;
        s->ring[pos] = sample;
        InterlockedIncrement(&s->ringWrite);
    }
    InterlockedExchange(&s->peakLevel, (LONG)peak);
}

/* ================================================================
 *  Capture worker thread
 * ================================================================ */
static DWORD WINAPI CaptureWorker(LPVOID param)
{
    DeviceSlot *s = (DeviceSlot *)param;
    HRESULT hr = CoInitializeEx(nullptr, COINIT_MULTITHREADED);
    if (FAILED(hr)) return (DWORD)hr;

    DWORD mmcssIdx = 0;
    HANDLE mmcss = AvSetMmThreadCharacteristics(L"Audio", &mmcssIdx);

    HANDLE waitArr[2] = { s->hShutdown, s->hReady };
    bool running = true;
    while (running) {
        DWORD r = WaitForMultipleObjects(2, waitArr, FALSE, INFINITE);
        if (r == WAIT_OBJECT_0) {
            running = false;
            break;
        }
        /* hReady fired */
        UINT32 packetLen = 0;
        hr = s->captureClient->GetNextPacketSize(&packetLen);
        if (FAILED(hr)) continue;

        while (packetLen != 0) {
            BYTE   *pData = nullptr;
            UINT32  frames = 0;
            DWORD   flags  = 0;
            hr = s->captureClient->GetBuffer(&pData, &frames, &flags, nullptr, nullptr);
            if (FAILED(hr)) break;

            EnterCriticalSection(&s->cs);
            /* ring buffer */
            RingPush(s, pData, frames, flags);
            /* WAV file */
            if (s->wavFile && frames > 0) {
                DWORD bytes = frames * (DWORD)s->frameSize;
                if (flags & AUDCLNT_BUFFERFLAGS_SILENT) {
                    /* write silence */
                    void *zeroBuf = calloc(1, bytes);
                    if (zeroBuf) {
                        fwrite(zeroBuf, 1, bytes, s->wavFile);
                        free(zeroBuf);
                    }
                } else {
                    fwrite(pData, 1, bytes, s->wavFile);
                }
                s->wavDataBytes += bytes;
            }
            LeaveCriticalSection(&s->cs);

            s->captureClient->ReleaseBuffer(frames);
            s->captureClient->GetNextPacketSize(&packetLen);
        }
    }

    if (mmcss) AvRevertMmThreadCharacteristics(mmcss);
    CoUninitialize();
    return 0;
}

/* ================================================================
 *  Render worker thread (plays WAV-like data -- future use)
 *  For now, render mode opens the device but no worker is needed
 *  unless streaming. We provide a stub.
 * ================================================================ */

/* ================================================================
 *  Device enumeration helpers
 * ================================================================ */
static HRESULT EnumDevices(int direction, IMMDeviceCollection **ppCol)
{
    IMMDeviceEnumerator *pEnum = nullptr;
    HRESULT hr = CoCreateInstance(__uuidof(MMDeviceEnumerator), nullptr,
                                  CLSCTX_INPROC_SERVER, IID_PPV_ARGS(&pEnum));
    if (FAILED(hr)) return hr;
    EDataFlow flow = (direction == DIR_RENDER) ? eRender : eCapture;
    hr = pEnum->EnumAudioEndpoints(flow, DEVICE_STATE_ACTIVE, ppCol);
    SafeRelease(&pEnum);
    return hr;
}

static bool GetDevFriendlyName(IMMDeviceCollection *col, UINT idx, wchar_t *name, size_t cch)
{
    IMMDevice *dev = nullptr;
    HRESULT hr = col->Item(idx, &dev);
    if (FAILED(hr)) return false;
    IPropertyStore *ps = nullptr;
    hr = dev->OpenPropertyStore(STGM_READ, &ps);
    SafeRelease(&dev);
    if (FAILED(hr)) return false;
    PROPVARIANT pv;
    PropVariantInit(&pv);
    hr = ps->GetValue(PKEY_Device_FriendlyName, &pv);
    SafeRelease(&ps);
    if (FAILED(hr)) return false;
    StringCchCopy(name, cch, pv.vt == VT_LPWSTR ? pv.pwszVal : L"Unknown");
    PropVariantClear(&pv);
    return true;
}

/* ================================================================
 *  Exported API
 * ================================================================ */

EXPORT int __cdecl wasapi_init(void)
{
    if (g_comInit) return 0;
    HRESULT hr = CoInitializeEx(nullptr, COINIT_MULTITHREADED);
    /* S_FALSE means already initialised on this thread -- that's OK */
    if (FAILED(hr) && hr != RPC_E_CHANGED_MODE) return -1;
    for (int i = 0; i < MAX_DEVICES; i++) SlotReset(&g_slots[i]);
    g_comInit = true;
    return 0;
}

EXPORT int __cdecl wasapi_device_count(int direction)
{
    IMMDeviceCollection *col = nullptr;
    if (FAILED(EnumDevices(direction, &col))) return 0;
    UINT cnt = 0;
    col->GetCount(&cnt);
    SafeRelease(&col);
    return (int)cnt;
}

EXPORT int __cdecl wasapi_device_name(int direction, int index, char *name, int maxlen)
{
    if (!name || maxlen <= 0) return -1;
    IMMDeviceCollection *col = nullptr;
    if (FAILED(EnumDevices(direction, &col))) return -1;
    wchar_t wname[512];
    bool ok = GetDevFriendlyName(col, (UINT)index, wname, 512);
    SafeRelease(&col);
    if (!ok) return -2;
    WideCharToMultiByte(CP_UTF8, 0, wname, -1, name, maxlen, nullptr, nullptr);
    return 0;
}

EXPORT int __cdecl wasapi_open(int direction, int device_idx, int ch, int hz, int bps)
{
    /* find free slot */
    int handle = -1;
    for (int i = 0; i < MAX_DEVICES; i++) {
        if (g_slots[i].state == DS_FREE) { handle = i; break; }
    }
    if (handle < 0) return -1;

    DeviceSlot *s = &g_slots[handle];
    SlotReset(s);
    InitializeCriticalSection(&s->cs);

    /* defaults */
    if (ch  <= 0) ch  = 2;
    if (hz  <= 0) hz  = 44100;
    if (bps <= 0) bps = 16;
    s->direction     = (DeviceDir)direction;
    s->channels      = ch;
    s->sampleRate    = hz;
    s->bitsPerSample = bps;
    s->frameSize     = (size_t)(ch * bps / 8);

    /* enumerate & pick device */
    IMMDeviceEnumerator *pEnum = nullptr;
    HRESULT hr = CoCreateInstance(__uuidof(MMDeviceEnumerator), nullptr,
                                  CLSCTX_INPROC_SERVER, IID_PPV_ARGS(&pEnum));
    if (FAILED(hr)) goto fail;

    if (device_idx < 0) {
        /* default device */
        EDataFlow flow = (direction == DIR_RENDER) ? eRender : eCapture;
        hr = pEnum->GetDefaultAudioEndpoint(flow, eConsole, &s->mmDevice);
    } else {
        IMMDeviceCollection *col = nullptr;
        EDataFlow flow = (direction == DIR_RENDER) ? eRender : eCapture;
        hr = pEnum->EnumAudioEndpoints(flow, DEVICE_STATE_ACTIVE, &col);
        if (SUCCEEDED(hr)) {
            hr = col->Item((UINT)device_idx, &s->mmDevice);
            SafeRelease(&col);
        }
    }
    SafeRelease(&pEnum);
    if (FAILED(hr) || !s->mmDevice) goto fail;

    /* activate audio client */
    hr = s->mmDevice->Activate(__uuidof(IAudioClient), CLSCTX_INPROC_SERVER,
                               nullptr, (void **)&s->audioClient);
    if (FAILED(hr)) goto fail;

    {
        /* build WAVEFORMATEXTENSIBLE */
        WAVEFORMATEXTENSIBLE wfx = {};
        wfx.Format.wFormatTag      = WAVE_FORMAT_EXTENSIBLE;
        wfx.Format.nChannels       = (WORD)ch;
        wfx.Format.nSamplesPerSec  = (DWORD)hz;
        wfx.Format.wBitsPerSample  = (WORD)bps;
        wfx.Format.nBlockAlign     = (WORD)(ch * bps / 8);
        wfx.Format.nAvgBytesPerSec = (DWORD)(hz * wfx.Format.nBlockAlign);
        wfx.Format.cbSize          = 22;
        wfx.Samples.wValidBitsPerSample = (WORD)bps;
        wfx.SubFormat = KSDATAFORMAT_SUBTYPE_PCM;
        if (ch == 1) {
            wfx.dwChannelMask = SPEAKER_FRONT_CENTER;
        } else {
            wfx.dwChannelMask = SPEAKER_FRONT_LEFT | SPEAKER_FRONT_RIGHT;
        }

        REFERENCE_TIME defPeriod = 0, minPeriod = 0;
        s->audioClient->GetDevicePeriod(&defPeriod, &minPeriod);

        DWORD streamFlags = AUDCLNT_STREAMFLAGS_EVENTCALLBACK | AUDCLNT_STREAMFLAGS_NOPERSIST;
        hr = s->audioClient->Initialize(AUDCLNT_SHAREMODE_SHARED, streamFlags,
                                        defPeriod, 0, (WAVEFORMATEX *)&wfx, nullptr);
        if (FAILED(hr)) {
            /* try with device's mix format as fallback */
            WAVEFORMATEX *pMix = nullptr;
            s->audioClient->GetMixFormat(&pMix);
            if (pMix) {
                /* re-activate (Initialize can only be called once) */
                SafeRelease(&s->audioClient);
                s->mmDevice->Activate(__uuidof(IAudioClient), CLSCTX_INPROC_SERVER,
                                      nullptr, (void **)&s->audioClient);
                hr = s->audioClient->Initialize(AUDCLNT_SHAREMODE_SHARED, streamFlags,
                                                defPeriod, 0, pMix, nullptr);
                if (SUCCEEDED(hr)) {
                    s->channels      = pMix->nChannels;
                    s->sampleRate    = pMix->nSamplesPerSec;
                    s->bitsPerSample = pMix->wBitsPerSample;
                    s->frameSize     = (size_t)(pMix->nBlockAlign);
                }
                CoTaskMemFree(pMix);
            }
            if (FAILED(hr)) goto fail;
        }
    }

    /* events */
    s->hShutdown = CreateEventEx(nullptr, nullptr, 0, EVENT_MODIFY_STATE | SYNCHRONIZE);
    s->hReady    = CreateEventEx(nullptr, nullptr, 0, EVENT_MODIFY_STATE | SYNCHRONIZE);
    if (!s->hShutdown || !s->hReady) goto fail;

    hr = s->audioClient->SetEventHandle(s->hReady);
    if (FAILED(hr)) goto fail;

    /* get service */
    if (direction == DIR_CAPTURE) {
        hr = s->audioClient->GetService(IID_PPV_ARGS(&s->captureClient));
    } else {
        hr = s->audioClient->GetService(IID_PPV_ARGS(&s->renderClient));
    }
    if (FAILED(hr)) goto fail;

    s->state = DS_OPEN;
    return handle;

fail:
    SafeRelease(&s->captureClient);
    SafeRelease(&s->renderClient);
    SafeRelease(&s->audioClient);
    SafeRelease(&s->mmDevice);
    if (s->hShutdown) { CloseHandle(s->hShutdown); s->hShutdown = nullptr; }
    if (s->hReady)    { CloseHandle(s->hReady);    s->hReady    = nullptr; }
    DeleteCriticalSection(&s->cs);
    SlotReset(s);
    return -1;
}

EXPORT int __cdecl wasapi_start_file(int handle, const char *filename)
{
    if (handle < 0 || handle >= MAX_DEVICES) return -1;
    DeviceSlot *s = &g_slots[handle];
    if (s->state != DS_OPEN) return -2;

    /* open WAV file */
    if (filename && filename[0]) {
        s->wavFile = OpenFileUTF8(filename, L"wb");
        if (!s->wavFile) return -3;
        /* write placeholder header */
        WavHeader hdr;
        MakeWavHeader(&hdr, s->channels, s->sampleRate, s->bitsPerSample, 0);
        fwrite(&hdr, sizeof(hdr), 1, s->wavFile);
        fflush(s->wavFile);
        s->wavDataBytes = 0;
    }

    /* start worker thread (capture only for now) */
    if (s->direction == DIR_CAPTURE) {
        s->hThread = CreateThread(nullptr, 0, CaptureWorker, s, 0, nullptr);
        if (!s->hThread) return -4;
        SetThreadPriority(s->hThread, THREAD_PRIORITY_TIME_CRITICAL);
    }

    /* start audio engine */
    HRESULT hr = s->audioClient->Start();
    if (FAILED(hr)) return -5;

    s->state = DS_RUNNING;
    return 0;
}

EXPORT int __cdecl wasapi_stop(int handle)
{
    if (handle < 0 || handle >= MAX_DEVICES) return -1;
    DeviceSlot *s = &g_slots[handle];
    if (s->state != DS_RUNNING) return -2;

    /* stop audio engine */
    s->audioClient->Stop();

    /* signal shutdown & wait for thread */
    if (s->hShutdown) SetEvent(s->hShutdown);
    if (s->hThread) {
        WaitForSingleObject(s->hThread, 3000);
        CloseHandle(s->hThread);
        s->hThread = nullptr;
    }

    /* finalize WAV */
    EnterCriticalSection(&s->cs);
    if (s->wavFile) {
        /* rewrite header with correct sizes */
        fseek(s->wavFile, 0, SEEK_SET);
        WavHeader hdr;
        MakeWavHeader(&hdr, s->channels, s->sampleRate, s->bitsPerSample, s->wavDataBytes);
        fwrite(&hdr, sizeof(hdr), 1, s->wavFile);
        fflush(s->wavFile);
        fclose(s->wavFile);
        s->wavFile = nullptr;
    }
    LeaveCriticalSection(&s->cs);

    s->state = DS_OPEN;
    /* reset peak */
    InterlockedExchange(&s->peakLevel, 0);
    return 0;
}

EXPORT int __cdecl wasapi_get_pcm(int handle, short *buf, int max_samples)
{
    if (handle < 0 || handle >= MAX_DEVICES) return 0;
    DeviceSlot *s = &g_slots[handle];

    int avail = (int)(s->ringWrite - s->ringRead);
    if (avail < 0) avail = 0;
    if (avail > max_samples) avail = max_samples;

    for (int i = 0; i < avail; i++) {
        LONG pos = s->ringRead % RING_SIZE;
        buf[i] = s->ring[pos];
        InterlockedIncrement(&s->ringRead);
    }
    return avail;
}

EXPORT int __cdecl wasapi_get_level(int handle)
{
    if (handle < 0 || handle >= MAX_DEVICES) return 0;
    /* read & reset peak (return the peak since last call) */
    LONG val = InterlockedExchange(&g_slots[handle].peakLevel, 0);
    return (int)val;
}

EXPORT int __cdecl wasapi_get_info(int handle, int *ch, int *hz, int *bps)
{
    if (handle < 0 || handle >= MAX_DEVICES) return -1;
    DeviceSlot *s = &g_slots[handle];
    if (s->state == DS_FREE) return -2;
    if (ch)  *ch  = s->channels;
    if (hz)  *hz  = s->sampleRate;
    if (bps) *bps = s->bitsPerSample;
    return 0;
}

EXPORT int __cdecl wasapi_close(int handle)
{
    if (handle < 0 || handle >= MAX_DEVICES) return -1;
    DeviceSlot *s = &g_slots[handle];
    if (s->state == DS_FREE) return 0;

    /* stop if running */
    if (s->state == DS_RUNNING) wasapi_stop(handle);

    SafeRelease(&s->captureClient);
    SafeRelease(&s->renderClient);
    SafeRelease(&s->audioClient);
    SafeRelease(&s->mmDevice);

    if (s->hShutdown) { CloseHandle(s->hShutdown); s->hShutdown = nullptr; }
    if (s->hReady)    { CloseHandle(s->hReady);    s->hReady    = nullptr; }
    DeleteCriticalSection(&s->cs);

    SlotReset(s);
    return 0;
}

EXPORT int __cdecl wasapi_shutdown(void)
{
    for (int i = 0; i < MAX_DEVICES; i++) {
        if (g_slots[i].state != DS_FREE) wasapi_close(i);
    }
    if (g_comInit) {
        CoUninitialize();
        g_comInit = false;
    }
    return 0;
}

/* ================================================================
 *  DLL entry point
 * ================================================================ */
BOOL APIENTRY DllMain(HMODULE, DWORD reason, LPVOID)
{
    if (reason == DLL_PROCESS_DETACH) {
        wasapi_shutdown();
    }
    return TRUE;
}
