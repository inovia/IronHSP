//============================================================
//   hspble.dll — Bluetooth LE GATT client for IronHSP (新形式)
//
//   Windows.Devices.Bluetooth (WinRT) を C++/WinRT で叩いて
//   BLE デバイスのスキャン / GATT read / write / notify を提供。
//
//   v2 (2026-04-15): OLDDLL $202 → typed #func 形式に全面移行。
//
//   HSP API (typed #func):
//     ble_init
//     ble_shutdown
//     ble_scan_start
//     ble_scan_stop
//     ble_scan_poll        var_addr_buf, addr_size, var_name_buf, name_size, var_rssi
//                           -> stat 1/0
//     ble_connect          "addr", var_h                 -> var_h に device handle
//     ble_disconnect       dev_h
//     ble_services         dev_h, var_buf, buf_size
//     ble_characteristics  dev_h, "svc", var_buf, buf_size
//     ble_read             dev_h, "svc", "chr", var_buf, buf_size, var_len
//     ble_write            dev_h, "svc", "chr", var_buf, len
//     ble_notify_enable    dev_h, "svc", "chr"
//     ble_notify_poll      dev_h, "chr", var_buf, buf_size, var_len  -> stat 1/0
//
//   __has_include でヘッダ無し環境では全関数スタブ。
//============================================================

#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>

#include <string>
#include <vector>
#include <deque>
#include <unordered_map>
#include <mutex>
#include <cstring>
#include <cstdio>
#include <cstdint>

#define HSPBLE_EXPORT extern "C" __declspec(dllexport)

static void copy_str_to_buf(const std::string& src, char* out, int out_size)
{
    if (!out || out_size <= 0) return;
    int n = (int)src.size();
    if (n >= out_size) n = out_size - 1;
    if (n > 0) memcpy(out, src.data(), (size_t)n);
    out[n] = 0;
}
static int copy_bytes_to_buf(const uint8_t* src, size_t n, void* out, int out_size)
{
    if (!out || out_size <= 0) return 0;
    if ((int)n > out_size) n = (size_t)out_size;
    if (n > 0 && src) memcpy(out, src, n);
    return (int)n;
}

// ============================================================
// __has_include fallback
// ============================================================
#if defined(__has_include)
#  if __has_include(<winrt/Windows.Devices.Bluetooth.h>) && \
      __has_include(<winrt/Windows.Devices.Bluetooth.Advertisement.h>) && \
      __has_include(<winrt/Windows.Devices.Bluetooth.GenericAttributeProfile.h>)
#    define HSPBLE_HAVE_BLE 1
#  else
#    define HSPBLE_HAVE_BLE 0
#  endif
#else
#  define HSPBLE_HAVE_BLE 1
#endif

#if HSPBLE_HAVE_BLE

#include <winrt/base.h>
#include <winrt/Windows.Foundation.h>
#include <winrt/Windows.Foundation.Collections.h>
#include <winrt/Windows.Storage.Streams.h>
#include <winrt/Windows.Devices.Bluetooth.h>
#include <winrt/Windows.Devices.Bluetooth.Advertisement.h>
#include <winrt/Windows.Devices.Bluetooth.GenericAttributeProfile.h>

#pragma comment(lib, "windowsapp.lib")

namespace ble_impl {

using namespace winrt;
using namespace winrt::Windows::Foundation;
using namespace winrt::Windows::Foundation::Collections;
using namespace winrt::Windows::Storage::Streams;
using namespace winrt::Windows::Devices::Bluetooth;
using namespace winrt::Windows::Devices::Bluetooth::Advertisement;
using namespace winrt::Windows::Devices::Bluetooth::GenericAttributeProfile;

constexpr int MAX_DEV = 16;

struct ScanEntry {
    uint64_t    addr = 0;
    std::string name;
    int         rssi = 0;
};

struct NotifyQueueEntry {
    std::string chr_uuid;
    std::vector<uint8_t> data;
};

struct Device {
    bool                             active = false;
    uint64_t                         addr = 0;
    BluetoothLEDevice                dev{ nullptr };
    std::unordered_map<std::string, GattDeviceService> services;
    std::unordered_map<std::string, GattCharacteristic> chrs;
    std::unordered_map<std::string, winrt::event_token> tokens;
    std::mutex                       notify_mtx;
    std::deque<NotifyQueueEntry>     notify_queue;
};

static Device                       g_devices[MAX_DEV];
static std::mutex                   g_mutex;
static bool                         g_ready = false;

static BluetoothLEAdvertisementWatcher g_watcher{ nullptr };
static std::mutex                      g_scan_mtx;
static std::deque<ScanEntry>           g_scan_queue;
static winrt::event_token              g_scan_token{};

static std::string WideToAnsi(const wchar_t* w, size_t wlen)
{
    if (!w || wlen == 0) return "";
    int n = WideCharToMultiByte(CP_ACP, 0, w, (int)wlen, nullptr, 0, nullptr, nullptr);
    if (n <= 0) return "";
    std::vector<char> buf(n);
    WideCharToMultiByte(CP_ACP, 0, w, (int)wlen, buf.data(), n, nullptr, nullptr);
    return std::string(buf.data(), n);
}
static std::string HStringToAnsi(hstring const& h)
{ return WideToAnsi(h.c_str(), h.size()); }

static std::string GuidToString(winrt::guid const& g)
{
    char buf[64];
    _snprintf_s(buf, _TRUNCATE,
        "%08x-%04x-%04x-%02x%02x-%02x%02x%02x%02x%02x%02x",
        g.Data1, g.Data2, g.Data3,
        g.Data4[0], g.Data4[1], g.Data4[2], g.Data4[3],
        g.Data4[4], g.Data4[5], g.Data4[6], g.Data4[7]);
    return buf;
}

static uint64_t ParseMac(const char* s)
{
    if (!s) return 0;
    unsigned v[6] = {};
    int n = sscanf_s(s, "%02x:%02x:%02x:%02x:%02x:%02x",
                     &v[0], &v[1], &v[2], &v[3], &v[4], &v[5]);
    if (n != 6) return 0;
    uint64_t r = 0;
    for (int i = 0; i < 6; ++i) r = (r << 8) | v[i];
    return r;
}
static std::string FormatMac(uint64_t a)
{
    char buf[32];
    _snprintf_s(buf, _TRUNCATE, "%02x:%02x:%02x:%02x:%02x:%02x",
        (unsigned)((a >> 40) & 0xff),
        (unsigned)((a >> 32) & 0xff),
        (unsigned)((a >> 24) & 0xff),
        (unsigned)((a >> 16) & 0xff),
        (unsigned)((a >> 8)  & 0xff),
        (unsigned)( a        & 0xff));
    return buf;
}

static std::vector<uint8_t> BufferToBytes(IBuffer const& buf)
{
    if (!buf) return {};
    uint32_t len = buf.Length();
    std::vector<uint8_t> out(len);
    if (len > 0) {
        DataReader reader = DataReader::FromBuffer(buf);
        for (uint32_t i = 0; i < len; ++i) out[i] = reader.ReadByte();
    }
    return out;
}
static IBuffer BytesToBuffer(const uint8_t* p, size_t n)
{
    DataWriter writer;
    for (size_t i = 0; i < n; ++i) writer.WriteByte(p[i]);
    return writer.DetachBuffer();
}

static int FindFreeDev()
{
    for (int i = 0; i < MAX_DEV; ++i)
        if (!g_devices[i].active) return i;
    return -1;
}

static void StartScan()
{
    if (g_watcher) return;
    g_watcher = BluetoothLEAdvertisementWatcher{};
    g_watcher.ScanningMode(BluetoothLEScanningMode::Active);
    g_scan_token = g_watcher.Received(
        [](BluetoothLEAdvertisementWatcher const&,
           BluetoothLEAdvertisementReceivedEventArgs const& args)
        {
            ScanEntry e;
            e.addr = args.BluetoothAddress();
            e.rssi = args.RawSignalStrengthInDBm();
            try {
                auto adv = args.Advertisement();
                if (adv) {
                    auto local = adv.LocalName();
                    if (!local.empty())
                        e.name = HStringToAnsi(local);
                }
            } catch (...) {}
            std::lock_guard<std::mutex> lk(g_scan_mtx);
            if (g_scan_queue.size() < 4096)
                g_scan_queue.push_back(std::move(e));
        });
    g_watcher.Start();
}

static void StopScan()
{
    if (!g_watcher) return;
    try { g_watcher.Stop(); } catch (...) {}
    try { g_watcher.Received(g_scan_token); } catch (...) {}
    g_watcher = nullptr;
    std::lock_guard<std::mutex> lk(g_scan_mtx);
    g_scan_queue.clear();
}

static int Connect(uint64_t addr)
{
    std::lock_guard<std::mutex> lk(g_mutex);
    int idx = FindFreeDev();
    if (idx < 0) return -1;
    try {
        auto dev = BluetoothLEDevice::FromBluetoothAddressAsync(addr).get();
        if (!dev) return -2;
        g_devices[idx].active = true;
        g_devices[idx].addr   = addr;
        g_devices[idx].dev    = dev;
        return idx;
    } catch (...) { return -3; }
}

static void Disconnect(int idx)
{
    if (idx < 0 || idx >= MAX_DEV) return;
    std::lock_guard<std::mutex> lk(g_mutex);
    auto& d = g_devices[idx];
    if (!d.active) return;

    for (auto& kv : d.tokens) {
        auto it = d.chrs.find(kv.first);
        if (it != d.chrs.end()) {
            try { it->second.ValueChanged(kv.second); } catch (...) {}
        }
    }
    d.tokens.clear();
    d.chrs.clear();
    d.services.clear();
    d.dev = nullptr;
    d.active = false;
    d.addr = 0;
    {
        std::lock_guard<std::mutex> lk2(d.notify_mtx);
        d.notify_queue.clear();
    }
}

static GattDeviceService GetService(Device& d, const std::string& svc_l)
{
    auto it = d.services.find(svc_l);
    if (it != d.services.end()) return it->second;

    auto res = d.dev.GetGattServicesAsync(BluetoothCacheMode::Cached).get();
    if (res.Status() != GattCommunicationStatus::Success) return nullptr;

    for (auto const& s : res.Services()) {
        auto uid = GuidToString(s.Uuid());
        if (uid == svc_l) {
            d.services.insert_or_assign(uid, s);
            return s;
        }
    }
    return nullptr;
}

static GattCharacteristic GetCharacteristic(
    Device& d, const std::string& svc_l, const std::string& chr_l)
{
    auto it = d.chrs.find(chr_l);
    if (it != d.chrs.end()) return it->second;

    auto svc = GetService(d, svc_l);
    if (!svc) return nullptr;

    auto res = svc.GetCharacteristicsAsync(BluetoothCacheMode::Cached).get();
    if (res.Status() != GattCommunicationStatus::Success) return nullptr;
    for (auto const& c : res.Characteristics()) {
        auto uid = GuidToString(c.Uuid());
        if (uid == chr_l) {
            d.chrs.insert_or_assign(uid, c);
            return c;
        }
    }
    return nullptr;
}

} // namespace ble_impl

using namespace ble_impl;

// ============================================================
// HSP exports (typed #func)
// ============================================================

HSPBLE_EXPORT int __stdcall ble_init()
{
    ble_impl::g_ready = true;
    return 0;
}

HSPBLE_EXPORT int __stdcall ble_shutdown()
{
    StopScan();
    for (int i = 0; i < MAX_DEV; ++i) Disconnect(i);
    ble_impl::g_ready = false;
    return 0;
}

HSPBLE_EXPORT int __stdcall ble_scan_start()
{
    try { StartScan(); return 0; } catch (...) { return -1; }
}

HSPBLE_EXPORT int __stdcall ble_scan_stop()
{
    StopScan();
    return 0;
}

// ble_scan_poll(var_addr_buf, addr_size, var_name_buf, name_size, var_rssi) -> stat 1/0
HSPBLE_EXPORT int __stdcall ble_scan_poll(
    char* addr_buf, int addr_size,
    char* name_buf, int name_size,
    int* out_rssi)
{
    if (addr_buf && addr_size > 0) addr_buf[0] = 0;
    if (name_buf && name_size > 0) name_buf[0] = 0;
    if (out_rssi) *out_rssi = 0;

    ScanEntry e;
    bool has = false;
    {
        std::lock_guard<std::mutex> lk(g_scan_mtx);
        if (!g_scan_queue.empty()) {
            e = std::move(g_scan_queue.front());
            g_scan_queue.pop_front();
            has = true;
        }
    }
    if (!has) return 0;

    copy_str_to_buf(FormatMac(e.addr), addr_buf, addr_size);
    copy_str_to_buf(e.name, name_buf, name_size);
    if (out_rssi) *out_rssi = e.rssi;
    return 1;
}

// ble_connect("addr", var_h)
HSPBLE_EXPORT int __stdcall ble_connect(const char* addr_s, int* out_h)
{
    if (out_h) *out_h = -1;
    uint64_t addr = ParseMac(addr_s);
    if (addr == 0) return -1;
    int h = Connect(addr);
    if (out_h) *out_h = h;
    return 0;
}

HSPBLE_EXPORT int __stdcall ble_disconnect(int h)
{
    Disconnect(h);
    return 0;
}

// ble_services(h, var_buf, buf_size)
HSPBLE_EXPORT int __stdcall ble_services(int h, char* out_buf, int out_size)
{
    if (out_buf && out_size > 0) out_buf[0] = 0;
    if (h < 0 || h >= MAX_DEV) return -1;
    auto& d = g_devices[h];
    if (!d.active) return -2;
    try {
        auto res = d.dev.GetGattServicesAsync(BluetoothCacheMode::Uncached).get();
        if (res.Status() != GattCommunicationStatus::Success) return -3;
        std::string out;
        for (auto const& s : res.Services()) {
            auto uid = GuidToString(s.Uuid());
            if (!out.empty()) out += '\n';
            out += uid;
            d.services.insert_or_assign(uid, s);
        }
        copy_str_to_buf(out, out_buf, out_size);
        return 0;
    } catch (...) { return -4; }
}

// ble_characteristics(h, "svc", var_buf, buf_size)
HSPBLE_EXPORT int __stdcall ble_characteristics(
    int h, const char* svc_s, char* out_buf, int out_size)
{
    if (out_buf && out_size > 0) out_buf[0] = 0;
    if (h < 0 || h >= MAX_DEV) return -1;
    auto& d = g_devices[h];
    if (!d.active) return -2;
    try {
        std::string svc_l = svc_s ? svc_s : "";
        auto svc = GetService(d, svc_l);
        if (!svc) return -3;
        auto res = svc.GetCharacteristicsAsync(BluetoothCacheMode::Uncached).get();
        if (res.Status() != GattCommunicationStatus::Success) return -4;
        std::string out;
        for (auto const& c : res.Characteristics()) {
            auto uid = GuidToString(c.Uuid());
            if (!out.empty()) out += '\n';
            out += uid;
            d.chrs.insert_or_assign(uid, c);
        }
        copy_str_to_buf(out, out_buf, out_size);
        return 0;
    } catch (...) { return -5; }
}

// ble_read(h, "svc", "chr", var_buf, buf_size, var_len)
HSPBLE_EXPORT int __stdcall ble_read(
    int h, const char* svc_s, const char* chr_s,
    void* out_buf, int out_size, int* out_len)
{
    if (out_len) *out_len = 0;
    if (h < 0 || h >= MAX_DEV) return -1;
    auto& d = g_devices[h];
    if (!d.active) return -2;
    try {
        auto c = GetCharacteristic(d, svc_s ? svc_s : "", chr_s ? chr_s : "");
        if (!c) return -3;
        auto res = c.ReadValueAsync(BluetoothCacheMode::Uncached).get();
        if (res.Status() != GattCommunicationStatus::Success) return -4;
        auto bytes = BufferToBytes(res.Value());
        int n = copy_bytes_to_buf(bytes.data(), bytes.size(), out_buf, out_size);
        if (out_len) *out_len = n;
        return 0;
    } catch (...) { return -5; }
}

// ble_write(h, "svc", "chr", var_buf, len)
HSPBLE_EXPORT int __stdcall ble_write(
    int h, const char* svc_s, const char* chr_s,
    const void* in_buf, int len)
{
    if (!in_buf || len <= 0) return -2;
    if (h < 0 || h >= MAX_DEV) return -3;
    auto& d = g_devices[h];
    if (!d.active) return -4;
    try {
        auto c = GetCharacteristic(d, svc_s ? svc_s : "", chr_s ? chr_s : "");
        if (!c) return -5;
        auto ib = BytesToBuffer((const uint8_t*)in_buf, (size_t)len);
        auto st = c.WriteValueAsync(ib, GattWriteOption::WriteWithResponse).get();
        return (st == GattCommunicationStatus::Success) ? 0 : -6;
    } catch (...) { return -7; }
}

// ble_notify_enable(h, "svc", "chr")
HSPBLE_EXPORT int __stdcall ble_notify_enable(
    int h, const char* svc_s, const char* chr_s)
{
    if (h < 0 || h >= MAX_DEV) return -1;
    auto& d = g_devices[h];
    if (!d.active) return -2;
    try {
        std::string chr_l = chr_s ? chr_s : "";
        auto c = GetCharacteristic(d, svc_s ? svc_s : "", chr_l);
        if (!c) return -3;
        auto status = c.WriteClientCharacteristicConfigurationDescriptorAsync(
            GattClientCharacteristicConfigurationDescriptorValue::Notify).get();
        if (status != GattCommunicationStatus::Success) return -4;

        Device* pd = &d;
        std::string key = chr_l;
        if (d.tokens.count(key)) return 0;
        auto tok = c.ValueChanged(
            [pd, key](GattCharacteristic const&,
                      GattValueChangedEventArgs const& args)
            {
                auto bytes = BufferToBytes(args.CharacteristicValue());
                NotifyQueueEntry e;
                e.chr_uuid = key;
                e.data     = std::move(bytes);
                std::lock_guard<std::mutex> lk(pd->notify_mtx);
                if (pd->notify_queue.size() < 1024)
                    pd->notify_queue.push_back(std::move(e));
            });
        d.tokens[key] = tok;
        return 0;
    } catch (...) { return -5; }
}

// ble_notify_poll(h, "chr", var_buf, buf_size, var_len) -> 1/0
HSPBLE_EXPORT int __stdcall ble_notify_poll(
    int h, const char* chr_s,
    void* out_buf, int out_size, int* out_len)
{
    if (out_len) *out_len = 0;
    if (h < 0 || h >= MAX_DEV) return 0;
    auto& d = g_devices[h];
    if (!d.active) return 0;

    std::string want = chr_s ? chr_s : "";
    NotifyQueueEntry e;
    bool got = false;
    {
        std::lock_guard<std::mutex> lk(d.notify_mtx);
        for (auto it = d.notify_queue.begin(); it != d.notify_queue.end(); ++it) {
            if (want.empty() || it->chr_uuid == want) {
                e = std::move(*it);
                d.notify_queue.erase(it);
                got = true;
                break;
            }
        }
    }
    if (!got) return 0;
    int n = copy_bytes_to_buf(e.data.data(), e.data.size(), out_buf, out_size);
    if (out_len) *out_len = n;
    return 1;
}

// ============================================================
// DllMain
// ============================================================
BOOL WINAPI DllMain(HMODULE, DWORD reason, LPVOID)
{
    switch (reason) {
    case DLL_PROCESS_ATTACH:
        try {
            winrt::init_apartment(winrt::apartment_type::multi_threaded);
        } catch (...) {}
        break;
    case DLL_PROCESS_DETACH:
        try { StopScan(); } catch (...) {}
        for (int i = 0; i < MAX_DEV; ++i) {
            try { Disconnect(i); } catch (...) {}
        }
        break;
    }
    return TRUE;
}

#else // !HSPBLE_HAVE_BLE — stub build

HSPBLE_EXPORT int __stdcall ble_init() { return -1; }
HSPBLE_EXPORT int __stdcall ble_shutdown() { return -1; }
HSPBLE_EXPORT int __stdcall ble_scan_start() { return -1; }
HSPBLE_EXPORT int __stdcall ble_scan_stop() { return -1; }
HSPBLE_EXPORT int __stdcall ble_scan_poll(char*, int, char*, int, int*) { return 0; }
HSPBLE_EXPORT int __stdcall ble_connect(const char*, int* out_h)
{ if (out_h) *out_h = -1; return -1; }
HSPBLE_EXPORT int __stdcall ble_disconnect(int) { return -1; }
HSPBLE_EXPORT int __stdcall ble_services(int, char*, int) { return -1; }
HSPBLE_EXPORT int __stdcall ble_characteristics(int, const char*, char*, int) { return -1; }
HSPBLE_EXPORT int __stdcall ble_read(int, const char*, const char*, void*, int, int*) { return -1; }
HSPBLE_EXPORT int __stdcall ble_write(int, const char*, const char*, const void*, int) { return -1; }
HSPBLE_EXPORT int __stdcall ble_notify_enable(int, const char*, const char*) { return -1; }
HSPBLE_EXPORT int __stdcall ble_notify_poll(int, const char*, void*, int, int*) { return 0; }

BOOL WINAPI DllMain(HMODULE, DWORD, LPVOID) { return TRUE; }

#endif // HSPBLE_HAVE_BLE
