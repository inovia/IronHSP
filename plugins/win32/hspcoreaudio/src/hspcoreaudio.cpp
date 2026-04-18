//============================================================
//   hspcoreaudio.dll — Windows CoreAudio 制御プラグイン
//
//   システム全体 / アプリ単位の音量制御、ピークメーター取得。
//   外部 SDK 不要 (Windows SDK のみで動作)。
//
//   HSP API (typed #func):
//     coreaudio_init
//     coreaudio_shutdown
//
//     ; システム (デフォルト再生) 音量 (0.0〜1.0)
//     coreaudio_system_get_volume  var_dbl
//     coreaudio_system_set_volume  dbl
//     coreaudio_system_get_mute    var_int
//     coreaudio_system_set_mute    int
//     coreaudio_system_get_peak    var_dbl        ; 現在の peak level
//
//     ; アプリ単位セッション列挙
//     coreaudio_session_count      var_int
//     coreaudio_session_name       idx, var_str, buf_size   ; exe 名
//     coreaudio_session_pid        idx, var_int
//     coreaudio_session_get_volume idx, var_dbl
//     coreaudio_session_set_volume idx, dbl
//     coreaudio_session_get_mute   idx, var_int
//     coreaudio_session_set_mute   idx, int
//     coreaudio_session_get_peak   idx, var_dbl
//
//     ; デバイス列挙
//     coreaudio_device_count       direction, var_int   ; 0=render, 1=capture
//     coreaudio_device_name        idx, direction, var_str, buf_size
//     coreaudio_device_get_default direction, var_str, buf_size  ; default の name
//
//   依存 (Windows SDK):
//     MMDeviceAPI.h / AudioClient.h / endpointvolume.h / audiopolicy.h
//============================================================

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <mmdeviceapi.h>
#include <endpointvolume.h>
#include <audiopolicy.h>
#include <audioclient.h>
#include <functiondiscoverykeys_devpkey.h>
#include <string>
#include <vector>
#include <cstring>

#pragma comment(lib, "Ole32.lib")
#pragma comment(lib, "Oleaut32.lib")

#define HSPCA_EXPORT extern "C" __declspec(dllexport)

// ============================================================
// State
// ============================================================
static bool g_initialized = false;
static IMMDeviceEnumerator* g_enumerator = nullptr;

struct SessionInfo {
    IAudioSessionControl2*  ctrl2     = nullptr;
    ISimpleAudioVolume*     volume    = nullptr;
    IAudioMeterInformation* meter     = nullptr;
    DWORD                   pid       = 0;
    std::string             exe_name;
};
static std::vector<SessionInfo> g_sessions;

static void safe_release(IUnknown** p)
{
    if (p && *p) { (*p)->Release(); *p = nullptr; }
}

static void clear_sessions()
{
    for (auto& s : g_sessions) {
        safe_release(reinterpret_cast<IUnknown**>(&s.ctrl2));
        safe_release(reinterpret_cast<IUnknown**>(&s.volume));
        safe_release(reinterpret_cast<IUnknown**>(&s.meter));
    }
    g_sessions.clear();
}

static std::string utf16_to_cp932(const wchar_t* wstr, int wlen = -1)
{
    if (!wstr) return std::string();
    int need = WideCharToMultiByte(CP_ACP, 0, wstr, wlen, nullptr, 0, nullptr, nullptr);
    if (need <= 0) return std::string();
    std::string out((size_t)need, '\0');
    WideCharToMultiByte(CP_ACP, 0, wstr, wlen, out.data(), need, nullptr, nullptr);
    if (wlen == -1 && !out.empty() && out.back() == '\0') out.pop_back();
    return out;
}

static void copy_to_buf(const std::string& s, char* out, int out_size)
{
    if (!out || out_size <= 0) return;
    int n = (int)s.size();
    if (n >= out_size) n = out_size - 1;
    memcpy(out, s.data(), (size_t)n);
    out[n] = 0;
}

static std::string pid_to_exe_name(DWORD pid)
{
    if (pid == 0) return "System";
    HANDLE h = OpenProcess(PROCESS_QUERY_LIMITED_INFORMATION, FALSE, pid);
    if (!h) return std::string();
    wchar_t buf[MAX_PATH] = L"";
    DWORD sz = MAX_PATH;
    if (!QueryFullProcessImageNameW(h, 0, buf, &sz)) {
        CloseHandle(h);
        return std::string();
    }
    CloseHandle(h);
    // basename
    const wchar_t* slash = wcsrchr(buf, L'\\');
    const wchar_t* base = slash ? slash + 1 : buf;
    return utf16_to_cp932(base);
}

// ============================================================
// init / shutdown
// ============================================================
HSPCA_EXPORT int __stdcall coreaudio_init()
{
    if (g_initialized) return 0;
    HRESULT hr = CoInitializeEx(nullptr, COINIT_MULTITHREADED);
    if (FAILED(hr) && hr != RPC_E_CHANGED_MODE) {
        return -1;
    }
    hr = CoCreateInstance(__uuidof(MMDeviceEnumerator), nullptr,
        CLSCTX_ALL, __uuidof(IMMDeviceEnumerator),
        reinterpret_cast<void**>(&g_enumerator));
    if (FAILED(hr)) return -2;
    g_initialized = true;
    return 0;
}

HSPCA_EXPORT int __stdcall coreaudio_shutdown()
{
    clear_sessions();
    safe_release(reinterpret_cast<IUnknown**>(&g_enumerator));
    if (g_initialized) {
        CoUninitialize();
        g_initialized = false;
    }
    return 0;
}

// ============================================================
// helpers: get default render device + endpoint volume
// ============================================================
static IMMDevice* get_default_device(EDataFlow flow = eRender)
{
    if (!g_enumerator) return nullptr;
    IMMDevice* dev = nullptr;
    g_enumerator->GetDefaultAudioEndpoint(flow, eMultimedia, &dev);
    return dev;
}

static IAudioEndpointVolume* get_endpoint_volume()
{
    IMMDevice* dev = get_default_device(eRender);
    if (!dev) return nullptr;
    IAudioEndpointVolume* v = nullptr;
    dev->Activate(__uuidof(IAudioEndpointVolume), CLSCTX_ALL, nullptr,
                  reinterpret_cast<void**>(&v));
    dev->Release();
    return v;
}

static IAudioMeterInformation* get_endpoint_meter()
{
    IMMDevice* dev = get_default_device(eRender);
    if (!dev) return nullptr;
    IAudioMeterInformation* m = nullptr;
    dev->Activate(__uuidof(IAudioMeterInformation), CLSCTX_ALL, nullptr,
                  reinterpret_cast<void**>(&m));
    dev->Release();
    return m;
}

// ============================================================
// system volume
// ============================================================
HSPCA_EXPORT int __stdcall coreaudio_system_get_volume(double* out_vol)
{
    if (!g_initialized || !out_vol) return -1;
    IAudioEndpointVolume* v = get_endpoint_volume();
    if (!v) return -2;
    float level = 0.0f;
    HRESULT hr = v->GetMasterVolumeLevelScalar(&level);
    v->Release();
    if (FAILED(hr)) return -3;
    *out_vol = (double)level;
    return 0;
}

HSPCA_EXPORT int __stdcall coreaudio_system_set_volume(double vol)
{
    if (!g_initialized) return -1;
    if (vol < 0.0) vol = 0.0;
    if (vol > 1.0) vol = 1.0;
    IAudioEndpointVolume* v = get_endpoint_volume();
    if (!v) return -2;
    HRESULT hr = v->SetMasterVolumeLevelScalar((float)vol, nullptr);
    v->Release();
    return FAILED(hr) ? -3 : 0;
}

HSPCA_EXPORT int __stdcall coreaudio_system_get_mute(int* out_mute)
{
    if (!g_initialized || !out_mute) return -1;
    IAudioEndpointVolume* v = get_endpoint_volume();
    if (!v) return -2;
    BOOL b = FALSE;
    HRESULT hr = v->GetMute(&b);
    v->Release();
    if (FAILED(hr)) return -3;
    *out_mute = b ? 1 : 0;
    return 0;
}

HSPCA_EXPORT int __stdcall coreaudio_system_set_mute(int mute)
{
    if (!g_initialized) return -1;
    IAudioEndpointVolume* v = get_endpoint_volume();
    if (!v) return -2;
    HRESULT hr = v->SetMute(mute != 0 ? TRUE : FALSE, nullptr);
    v->Release();
    return FAILED(hr) ? -3 : 0;
}

HSPCA_EXPORT int __stdcall coreaudio_system_get_peak(double* out_peak)
{
    if (!g_initialized || !out_peak) return -1;
    IAudioMeterInformation* m = get_endpoint_meter();
    if (!m) return -2;
    float peak = 0.0f;
    HRESULT hr = m->GetPeakValue(&peak);
    m->Release();
    if (FAILED(hr)) return -3;
    *out_peak = (double)peak;
    return 0;
}

// ============================================================
// session enumeration (per-app)
// ============================================================
HSPCA_EXPORT int __stdcall coreaudio_session_count(int* out_count)
{
    if (!g_initialized || !out_count) return -1;
    clear_sessions();

    IMMDevice* dev = get_default_device(eRender);
    if (!dev) { *out_count = 0; return -2; }

    IAudioSessionManager2* mgr = nullptr;
    HRESULT hr = dev->Activate(__uuidof(IAudioSessionManager2), CLSCTX_ALL,
                               nullptr, reinterpret_cast<void**>(&mgr));
    dev->Release();
    if (FAILED(hr)) { *out_count = 0; return -3; }

    IAudioSessionEnumerator* en = nullptr;
    hr = mgr->GetSessionEnumerator(&en);
    mgr->Release();
    if (FAILED(hr)) { *out_count = 0; return -4; }

    int n = 0;
    en->GetCount(&n);
    for (int i = 0; i < n; ++i) {
        IAudioSessionControl* c = nullptr;
        en->GetSession(i, &c);
        if (!c) continue;
        SessionInfo info;
        c->QueryInterface(__uuidof(IAudioSessionControl2),
                          reinterpret_cast<void**>(&info.ctrl2));
        c->QueryInterface(__uuidof(ISimpleAudioVolume),
                          reinterpret_cast<void**>(&info.volume));
        c->QueryInterface(__uuidof(IAudioMeterInformation),
                          reinterpret_cast<void**>(&info.meter));
        c->Release();
        if (info.ctrl2) {
            DWORD pid = 0;
            info.ctrl2->GetProcessId(&pid);
            info.pid = pid;
            info.exe_name = pid_to_exe_name(pid);
        }
        g_sessions.push_back(info);
    }
    en->Release();
    *out_count = (int)g_sessions.size();
    return 0;
}

HSPCA_EXPORT int __stdcall coreaudio_session_name(int idx, char* out, int out_size)
{
    if (idx < 0 || idx >= (int)g_sessions.size()) return -1;
    copy_to_buf(g_sessions[idx].exe_name, out, out_size);
    return 0;
}

HSPCA_EXPORT int __stdcall coreaudio_session_pid(int idx, int* out_pid)
{
    if (idx < 0 || idx >= (int)g_sessions.size() || !out_pid) return -1;
    *out_pid = (int)g_sessions[idx].pid;
    return 0;
}

HSPCA_EXPORT int __stdcall coreaudio_session_get_volume(int idx, double* out_vol)
{
    if (idx < 0 || idx >= (int)g_sessions.size() || !out_vol) return -1;
    auto& s = g_sessions[idx];
    if (!s.volume) return -2;
    float level = 0.0f;
    HRESULT hr = s.volume->GetMasterVolume(&level);
    if (FAILED(hr)) return -3;
    *out_vol = (double)level;
    return 0;
}

HSPCA_EXPORT int __stdcall coreaudio_session_set_volume(int idx, double vol)
{
    if (idx < 0 || idx >= (int)g_sessions.size()) return -1;
    auto& s = g_sessions[idx];
    if (!s.volume) return -2;
    if (vol < 0.0) vol = 0.0;
    if (vol > 1.0) vol = 1.0;
    HRESULT hr = s.volume->SetMasterVolume((float)vol, nullptr);
    return FAILED(hr) ? -3 : 0;
}

HSPCA_EXPORT int __stdcall coreaudio_session_get_mute(int idx, int* out_mute)
{
    if (idx < 0 || idx >= (int)g_sessions.size() || !out_mute) return -1;
    auto& s = g_sessions[idx];
    if (!s.volume) return -2;
    BOOL b = FALSE;
    HRESULT hr = s.volume->GetMute(&b);
    if (FAILED(hr)) return -3;
    *out_mute = b ? 1 : 0;
    return 0;
}

HSPCA_EXPORT int __stdcall coreaudio_session_set_mute(int idx, int mute)
{
    if (idx < 0 || idx >= (int)g_sessions.size()) return -1;
    auto& s = g_sessions[idx];
    if (!s.volume) return -2;
    HRESULT hr = s.volume->SetMute(mute != 0 ? TRUE : FALSE, nullptr);
    return FAILED(hr) ? -3 : 0;
}

HSPCA_EXPORT int __stdcall coreaudio_session_get_peak(int idx, double* out_peak)
{
    if (idx < 0 || idx >= (int)g_sessions.size() || !out_peak) return -1;
    auto& s = g_sessions[idx];
    if (!s.meter) return -2;
    float peak = 0.0f;
    HRESULT hr = s.meter->GetPeakValue(&peak);
    if (FAILED(hr)) return -3;
    *out_peak = (double)peak;
    return 0;
}

// ============================================================
// device enumeration
// ============================================================
HSPCA_EXPORT int __stdcall coreaudio_device_count(int direction, int* out_count)
{
    if (!g_initialized || !out_count || !g_enumerator) return -1;
    IMMDeviceCollection* col = nullptr;
    HRESULT hr = g_enumerator->EnumAudioEndpoints(
        direction == 1 ? eCapture : eRender, DEVICE_STATE_ACTIVE, &col);
    if (FAILED(hr)) { *out_count = 0; return -2; }
    UINT n = 0;
    col->GetCount(&n);
    col->Release();
    *out_count = (int)n;
    return 0;
}

static std::string get_device_name(IMMDevice* dev)
{
    if (!dev) return std::string();
    IPropertyStore* props = nullptr;
    HRESULT hr = dev->OpenPropertyStore(STGM_READ, &props);
    if (FAILED(hr)) return std::string();
    PROPVARIANT pv;
    PropVariantInit(&pv);
    std::string name;
    if (SUCCEEDED(props->GetValue(PKEY_Device_FriendlyName, &pv)) && pv.vt == VT_LPWSTR) {
        name = utf16_to_cp932(pv.pwszVal);
    }
    PropVariantClear(&pv);
    props->Release();
    return name;
}

HSPCA_EXPORT int __stdcall coreaudio_device_name(int idx, int direction, char* out, int out_size)
{
    if (!g_initialized || !g_enumerator) return -1;
    IMMDeviceCollection* col = nullptr;
    HRESULT hr = g_enumerator->EnumAudioEndpoints(
        direction == 1 ? eCapture : eRender, DEVICE_STATE_ACTIVE, &col);
    if (FAILED(hr)) return -2;
    IMMDevice* dev = nullptr;
    col->Item(idx, &dev);
    col->Release();
    if (!dev) return -3;
    std::string name = get_device_name(dev);
    dev->Release();
    copy_to_buf(name, out, out_size);
    return 0;
}

HSPCA_EXPORT int __stdcall coreaudio_device_get_default(int direction, char* out, int out_size)
{
    if (!g_initialized || !g_enumerator) return -1;
    IMMDevice* dev = nullptr;
    HRESULT hr = g_enumerator->GetDefaultAudioEndpoint(
        direction == 1 ? eCapture : eRender, eMultimedia, &dev);
    if (FAILED(hr) || !dev) return -2;
    std::string name = get_device_name(dev);
    dev->Release();
    copy_to_buf(name, out, out_size);
    return 0;
}

// ============================================================
// DllMain
// ============================================================
BOOL WINAPI DllMain(HINSTANCE, DWORD reason, LPVOID)
{
    if (reason == DLL_PROCESS_DETACH) {
        coreaudio_shutdown();
    }
    return TRUE;
}
