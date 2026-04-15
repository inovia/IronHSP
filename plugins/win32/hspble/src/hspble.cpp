//============================================================
//   hspble.dll — Bluetooth LE GATT client for IronHSP
//
//   Windows.Devices.Bluetooth (WinRT) を C++/WinRT で叩いて
//   BLE デバイスのスキャン / GATT read / write / notify を提供。
//
//   HSP API (OLDDLL $202):
//     ble_init
//     ble_shutdown
//     ble_scan_start
//     ble_scan_stop
//     ble_scan_poll    var_addr, var_name, var_rssi   -> stat 1/0
//     ble_connect      "addr"                         -> stat = device_h
//     ble_disconnect   dev_h
//     ble_services     dev_h, var_list
//     ble_characteristics dev_h, "svc", var_list
//     ble_read         dev_h, "svc", "chr", var_buf, var_len
//     ble_write        dev_h, "svc", "chr", var_buf, len
//     ble_notify_enable dev_h, "svc", "chr"
//     ble_notify_poll  dev_h, "chr", var_buf, var_len -> stat 1/0
//
//   実装メモ:
//     - init_apartment は multi_threaded。async は .get() で同期待ち
//     - スキャン結果は BluetoothLEAdvertisementWatcher::Received で
//       受け取り、内部キュー (mutex 保護) に貯めて poll で取り出す
//     - 複数デバイス対応 (16 スロット)
//     - notify 受信データも char_uuid ごとにキューに貯めて poll
//     - __has_include でヘッダ無し環境では全関数スタブ
//============================================================

#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>

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
#pragma warning(pop)

#include <string>
#include <vector>
#include <deque>
#include <unordered_map>
#include <mutex>
#include <cstring>
#include <cstdio>
#include <cstdint>

#define HSPBLE_EXPORT extern "C" __declspec(dllexport)

// ============================================================
// HSPEXINFO helpers
// ============================================================
namespace {
HSPEXINFO* g_hei = nullptr;
inline void  set_hei(HSPEXINFO* hei) { g_hei = hei; }
inline int   getint() { return g_hei->HspFunc_prm_geti(); }
inline char* getstr() { return g_hei->HspFunc_prm_gets(); }

static void write_str_to_var(const std::string& s)
{
    PVal* pv = nullptr;
    APTR a = g_hei->HspFunc_prm_getva(&pv);
    if (!pv || pv->flag != HSPVAR_FLAG_STR) return;
    pv->offset = a;
    HspVarProc* proc = g_hei->HspFunc_getproc(pv->flag);
    proc->Set(pv, proc->GetPtr(pv), (void*)s.c_str());
}
static void write_int_to_var(int v)
{
    PVal* pv = nullptr;
    APTR a = g_hei->HspFunc_prm_getva(&pv);
    if (!pv || pv->flag != HSPVAR_FLAG_INT) return;
    pv->offset = a;
    HspVarProc* proc = g_hei->HspFunc_getproc(pv->flag);
    proc->Set(pv, proc->GetPtr(pv), &v);
}
static void write_buf_to_var(const void* data, size_t n)
{
    PVal* pv = nullptr;
    APTR a = g_hei->HspFunc_prm_getva(&pv);
    if (!pv || pv->flag != HSPVAR_FLAG_STR) return;
    pv->offset = a;
    g_hei->HspFunc_dim(pv, HSPVAR_FLAG_STR, (int)n + 1, 0, 0, 0, 0);
    if (n > 0) memcpy(pv->pt, data, n);
    ((char*)pv->pt)[n] = 0;
}
static std::vector<uint8_t> read_var_buf()
{
    PVal* pv = nullptr;
    APTR a = g_hei->HspFunc_prm_getva(&pv);
    if (!pv || pv->flag != HSPVAR_FLAG_STR) return {};
    pv->offset = a;
    const char* p = (const char*)pv->pt;
    if (!p) return {};
    // HSP str var は nul 終端保証 but バイナリなので len も別途受け取る想定
    // ここでは strlen で取得してしまうと 0x00 で切れる。呼び出し側で
    // 常に len 引数を別途渡してもらうことで対処 (read_var_buf は未使用)
    size_t n = strlen(p);
    return std::vector<uint8_t>(p, p + n);
}
} // namespace

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
    std::string chr_uuid;   // lowercase GUID
    std::vector<uint8_t> data;
};

struct Device {
    bool                             active = false;
    uint64_t                         addr = 0;
    BluetoothLEDevice                dev{ nullptr };
    // (service_uuid -> GattDeviceService)
    std::unordered_map<std::string, GattDeviceService> services;
    // (chr_uuid -> GattCharacteristic)
    std::unordered_map<std::string, GattCharacteristic> chrs;
    // ValueChanged トークン (解除用)
    std::unordered_map<std::string, winrt::event_token> tokens;
    // notification キュー
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

// ------------------------- helpers -------------------------
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
{
    return WideToAnsi(h.c_str(), h.size());
}

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

static bool ParseGuid(const char* s, winrt::guid& out)
{
    if (!s) return false;
    unsigned d1; unsigned d2, d3;
    unsigned b[8];
    int n = sscanf_s(s, "%08x-%04x-%04x-%02x%02x-%02x%02x%02x%02x%02x%02x",
        &d1, &d2, &d3,
        &b[0], &b[1], &b[2], &b[3], &b[4], &b[5], &b[6], &b[7]);
    if (n != 11) return false;
    out.Data1 = d1;
    out.Data2 = (uint16_t)d2;
    out.Data3 = (uint16_t)d3;
    for (int i = 0; i < 8; ++i) out.Data4[i] = (uint8_t)b[i];
    return true;
}

// "AA:BB:CC:DD:EE:FF" -> uint64
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

// IBuffer -> vector<uint8>
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

// ------------------------- scan ---------------------------
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

// ------------------------ connect -------------------------
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

    // 全 ValueChanged を解除
    for (auto& kv : d.tokens) {
        auto it = d.chrs.find(kv.first);
        if (it != d.chrs.end()) {
            try { it->second.ValueChanged(kv.second); } catch (...) {}
        }
    }
    d.tokens.clear();
    d.chrs.clear();
    // 取得済みサービスは Close 不要 (WinRT ref-counted)
    d.services.clear();
    d.dev = nullptr;
    d.active = false;
    d.addr = 0;
    {
        std::lock_guard<std::mutex> lk2(d.notify_mtx);
        d.notify_queue.clear();
    }
}

// service_uuid を lowercase 正規化して取得 / キャッシュ
static GattDeviceService GetService(Device& d, const std::string& svc_l)
{
    auto it = d.services.find(svc_l);
    if (it != d.services.end()) return it->second;

    auto res = d.dev.GetGattServicesAsync(
        BluetoothCacheMode::Cached).get();
    if (res.Status() != GattCommunicationStatus::Success)
        return nullptr;

    auto svcs = res.Services();
    for (auto const& s : svcs) {
        auto uid = GuidToString(s.Uuid());
        if (uid == svc_l) {
            d.services[uid] = s;
            return s;
        }
    }
    return nullptr;
}

static GattCharacteristic GetCharacteristic(
    Device& d, const std::string& svc_l, const std::string& chr_l)
{
    // char cache key は chr_uuid 単独 (同じ chr uuid が複数サービスに
    // またがるケースはまれなので妥協)
    auto it = d.chrs.find(chr_l);
    if (it != d.chrs.end()) return it->second;

    auto svc = GetService(d, svc_l);
    if (!svc) return nullptr;

    auto res = svc.GetCharacteristicsAsync(BluetoothCacheMode::Cached).get();
    if (res.Status() != GattCommunicationStatus::Success) return nullptr;
    auto chrs = res.Characteristics();
    for (auto const& c : chrs) {
        auto uid = GuidToString(c.Uuid());
        if (uid == chr_l) {
            d.chrs[uid] = c;
            return c;
        }
    }
    return nullptr;
}

} // namespace ble_impl

// ============================================================
// HSP exports
// ============================================================
using namespace ble_impl;

HSPBLE_EXPORT BOOL WINAPI ble_init(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1;(void)p2;(void)p3;
    set_hei(hei);
    ble_impl::g_ready = true;
    return 0;
}

HSPBLE_EXPORT BOOL WINAPI ble_shutdown(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1;(void)p2;(void)p3;
    set_hei(hei);
    StopScan();
    for (int i = 0; i < MAX_DEV; ++i) Disconnect(i);
    ble_impl::g_ready = false;
    return 0;
}

HSPBLE_EXPORT BOOL WINAPI ble_scan_start(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1;(void)p2;(void)p3;
    set_hei(hei);
    try { StartScan(); return 0; } catch (...) { return -1; }
}

HSPBLE_EXPORT BOOL WINAPI ble_scan_stop(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1;(void)p2;(void)p3;
    set_hei(hei);
    StopScan();
    return 0;
}

// ble_scan_poll var_addr, var_name, var_rssi -> stat 1/0
HSPBLE_EXPORT BOOL WINAPI ble_scan_poll(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1;(void)p2;(void)p3;
    set_hei(hei);
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
    if (!has) {
        write_str_to_var("");
        write_str_to_var("");
        write_int_to_var(0);
        return 0;
    }
    write_str_to_var(FormatMac(e.addr));
    write_str_to_var(e.name);
    write_int_to_var(e.rssi);
    return 1;
}

HSPBLE_EXPORT BOOL WINAPI ble_connect(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1;(void)p2;(void)p3;
    set_hei(hei);
    const char* addr_s = getstr();
    uint64_t addr = ParseMac(addr_s);
    if (addr == 0) return -1;
    return Connect(addr);
}

HSPBLE_EXPORT BOOL WINAPI ble_disconnect(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1;(void)p2;(void)p3;
    set_hei(hei);
    int h = getint();
    Disconnect(h);
    return 0;
}

HSPBLE_EXPORT BOOL WINAPI ble_services(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1;(void)p2;(void)p3;
    set_hei(hei);
    int h = getint();
    if (h < 0 || h >= MAX_DEV) { write_str_to_var(""); return -1; }
    auto& d = g_devices[h];
    if (!d.active) { write_str_to_var(""); return -2; }
    try {
        auto res = d.dev.GetGattServicesAsync(
            BluetoothCacheMode::Uncached).get();
        if (res.Status() != GattCommunicationStatus::Success) {
            write_str_to_var("");
            return -3;
        }
        std::string out;
        auto svcs = res.Services();
        for (auto const& s : svcs) {
            auto uid = GuidToString(s.Uuid());
            if (!out.empty()) out += '\n';
            out += uid;
            // cache
            d.services[uid] = s;
        }
        write_str_to_var(out);
        return 0;
    } catch (...) { write_str_to_var(""); return -4; }
}

HSPBLE_EXPORT BOOL WINAPI ble_characteristics(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1;(void)p2;(void)p3;
    set_hei(hei);
    int h = getint();
    const char* svc_s = getstr();
    if (h < 0 || h >= MAX_DEV) { write_str_to_var(""); return -1; }
    auto& d = g_devices[h];
    if (!d.active) { write_str_to_var(""); return -2; }
    try {
        std::string svc_l = svc_s ? svc_s : "";
        auto svc = GetService(d, svc_l);
        if (!svc) { write_str_to_var(""); return -3; }
        auto res = svc.GetCharacteristicsAsync(
            BluetoothCacheMode::Uncached).get();
        if (res.Status() != GattCommunicationStatus::Success) {
            write_str_to_var(""); return -4;
        }
        std::string out;
        for (auto const& c : res.Characteristics()) {
            auto uid = GuidToString(c.Uuid());
            if (!out.empty()) out += '\n';
            out += uid;
            d.chrs[uid] = c;
        }
        write_str_to_var(out);
        return 0;
    } catch (...) { write_str_to_var(""); return -5; }
}

// ble_read dev_h, "svc", "chr", var_buf, var_len
HSPBLE_EXPORT BOOL WINAPI ble_read(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1;(void)p2;(void)p3;
    set_hei(hei);
    int h = getint();
    const char* svc_s = getstr();
    const char* chr_s = getstr();
    if (h < 0 || h >= MAX_DEV) { write_buf_to_var(nullptr, 0); write_int_to_var(0); return -1; }
    auto& d = g_devices[h];
    if (!d.active) { write_buf_to_var(nullptr, 0); write_int_to_var(0); return -2; }
    try {
        auto c = GetCharacteristic(d, svc_s ? svc_s : "", chr_s ? chr_s : "");
        if (!c) { write_buf_to_var(nullptr, 0); write_int_to_var(0); return -3; }
        auto res = c.ReadValueAsync(BluetoothCacheMode::Uncached).get();
        if (res.Status() != GattCommunicationStatus::Success) {
            write_buf_to_var(nullptr, 0);
            write_int_to_var(0);
            return -4;
        }
        auto bytes = BufferToBytes(res.Value());
        write_buf_to_var(bytes.data(), bytes.size());
        write_int_to_var((int)bytes.size());
        return 0;
    } catch (...) {
        write_buf_to_var(nullptr, 0);
        write_int_to_var(0);
        return -5;
    }
}

// ble_write dev_h, "svc", "chr", var_buf, len
HSPBLE_EXPORT BOOL WINAPI ble_write(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1;(void)p2;(void)p3;
    set_hei(hei);
    int h = getint();
    const char* svc_s = getstr();
    const char* chr_s = getstr();
    // var_buf : 読み取って len バイトだけ使う
    PVal* pv = nullptr;
    APTR a = g_hei->HspFunc_prm_getva(&pv);
    int len = getint();
    if (!pv || pv->flag != HSPVAR_FLAG_STR) return -1;
    pv->offset = a;
    const uint8_t* data = (const uint8_t*)pv->pt;
    if (!data || len <= 0) return -2;

    if (h < 0 || h >= MAX_DEV) return -3;
    auto& d = g_devices[h];
    if (!d.active) return -4;
    try {
        auto c = GetCharacteristic(d, svc_s ? svc_s : "", chr_s ? chr_s : "");
        if (!c) return -5;
        auto ib = BytesToBuffer(data, (size_t)len);
        auto st = c.WriteValueAsync(ib,
            GattWriteOption::WriteWithResponse).get();
        return (st == GattCommunicationStatus::Success) ? 0 : -6;
    } catch (...) { return -7; }
}

// ble_notify_enable dev_h, "svc", "chr"
HSPBLE_EXPORT BOOL WINAPI ble_notify_enable(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1;(void)p2;(void)p3;
    set_hei(hei);
    int h = getint();
    const char* svc_s = getstr();
    const char* chr_s = getstr();
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

        // ValueChanged 登録。既に登録済ならスキップ。
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

// ble_notify_poll dev_h, "chr", var_buf, var_len -> stat 1/0
HSPBLE_EXPORT BOOL WINAPI ble_notify_poll(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1;(void)p2;(void)p3;
    set_hei(hei);
    int h = getint();
    const char* chr_s = getstr();
    if (h < 0 || h >= MAX_DEV) {
        write_buf_to_var(nullptr, 0); write_int_to_var(0); return 0;
    }
    auto& d = g_devices[h];
    if (!d.active) {
        write_buf_to_var(nullptr, 0); write_int_to_var(0); return 0;
    }

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
    if (!got) {
        write_buf_to_var(nullptr, 0);
        write_int_to_var(0);
        return 0;
    }
    write_buf_to_var(e.data.data(), e.data.size());
    write_int_to_var((int)e.data.size());
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

HSPBLE_EXPORT BOOL WINAPI ble_init(HSPEXINFO* hei, int, int, int){ set_hei(hei); return -1; }
HSPBLE_EXPORT BOOL WINAPI ble_shutdown(HSPEXINFO* hei, int, int, int){ set_hei(hei); return -1; }
HSPBLE_EXPORT BOOL WINAPI ble_scan_start(HSPEXINFO* hei, int, int, int){ set_hei(hei); return -1; }
HSPBLE_EXPORT BOOL WINAPI ble_scan_stop(HSPEXINFO* hei, int, int, int){ set_hei(hei); return -1; }
HSPBLE_EXPORT BOOL WINAPI ble_scan_poll(HSPEXINFO* hei, int, int, int){ set_hei(hei); return 0; }
HSPBLE_EXPORT BOOL WINAPI ble_connect(HSPEXINFO* hei, int, int, int){ set_hei(hei); (void)getstr(); return -1; }
HSPBLE_EXPORT BOOL WINAPI ble_disconnect(HSPEXINFO* hei, int, int, int){ set_hei(hei); (void)getint(); return -1; }
HSPBLE_EXPORT BOOL WINAPI ble_services(HSPEXINFO* hei, int, int, int){ set_hei(hei); return -1; }
HSPBLE_EXPORT BOOL WINAPI ble_characteristics(HSPEXINFO* hei, int, int, int){ set_hei(hei); return -1; }
HSPBLE_EXPORT BOOL WINAPI ble_read(HSPEXINFO* hei, int, int, int){ set_hei(hei); return -1; }
HSPBLE_EXPORT BOOL WINAPI ble_write(HSPEXINFO* hei, int, int, int){ set_hei(hei); return -1; }
HSPBLE_EXPORT BOOL WINAPI ble_notify_enable(HSPEXINFO* hei, int, int, int){ set_hei(hei); return -1; }
HSPBLE_EXPORT BOOL WINAPI ble_notify_poll(HSPEXINFO* hei, int, int, int){ set_hei(hei); return 0; }

BOOL WINAPI DllMain(HMODULE, DWORD, LPVOID) { return TRUE; }

#endif // HSPBLE_HAVE_BLE
