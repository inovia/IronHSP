//============================================================
//   hspmidi.dll — Win32 winmm ベース MIDI in/out プラグイン
//
//   依存: winmm.lib ( midiOut* / midiIn* )
//   構造: hspjson.cpp と同じ「単一ソース + OLDDLL ($202) 規約」スタイル
//
//   HSP API (概要):
//
//     --- MIDI out ---
//     midi_out_count                         → stat = デバイス数
//     midi_out_name    var_str, devid        → デバイス名を var に格納 (cp932)
//     midi_out_open    devid                 → stat = 0 成功 / 負エラー
//     midi_out_close                         → stat = 0 / 負エラー
//     midi_out_short   status, data1, data2  → shortmsg 送信
//     midi_out_note_on    ch, note, vel      → $90 + ch
//     midi_out_note_off   ch, note, vel      → $80 + ch
//     midi_out_program_change ch, program    → $C0 + ch
//     midi_out_reset                         → midiOutReset
//
//     --- MIDI in (ポーリング式) ---
//     midi_in_count                               → stat
//     midi_in_name    var_str, devid              → cp932
//     midi_in_open    devid                       → 0/err
//     midi_in_start                               → midiInStart
//     midi_in_stop                                → midiInStop
//     midi_in_close                               → midiInClose
//     midi_in_poll    var_status, var_d1, var_d2  → stat = 1 取得 / 0 空
//
//   戻り値規約: 0 = 成功 / 負数 = エラー (MMRESULT を負符号化)
//
//   v1 制約:
//     - MIDI out / in それぞれハンドルは 1 個ずつ (static)
//     - MIDI in はコールバックから内部リングバッファ (1024) に詰め、
//       HSP 側は midi_in_poll で取り出す (CRITICAL_SECTION で保護)
//     - SysEx は未サポート (short message のみ)
//============================================================

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <mmsystem.h>
#include <string>
#include <cstring>
#include <cstdio>
#include <cstdint>

#pragma comment(lib, "winmm.lib")

// HSP SDK
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

#define HSPMIDI_EXPORT extern "C" __declspec(dllexport)

// ============================================================
// HSPEXINFO helpers (hspjson.cpp と同じ定石)
// ============================================================
namespace {

HSPEXINFO* g_hei = nullptr;
inline void   set_hei(HSPEXINFO* hei) { g_hei = hei; }
inline int    getint() { return g_hei->HspFunc_prm_geti(); }
// (getstr はこのプラグインでは未使用だが、将来の拡張用に残す)
// inline char*  getstr() { return g_hei->HspFunc_prm_gets(); }

static void write_str_to_var(const std::string& s)
{
    PVal* pv = nullptr;
    APTR a = g_hei->HspFunc_prm_getva(&pv);
    if (!pv) return;
    if (pv->flag != HSPVAR_FLAG_STR) return;
    pv->offset = a;
    HspVarProc* proc = g_hei->HspFunc_getproc(pv->flag);
    proc->Set(pv, proc->GetPtr(pv), (void*)s.c_str());
}

static void write_int_to_var(int v)
{
    PVal* pv = nullptr;
    APTR a = g_hei->HspFunc_prm_getva(&pv);
    if (!pv) return;
    if (pv->flag != HSPVAR_FLAG_INT) return;
    pv->offset = a;
    HspVarProc* proc = g_hei->HspFunc_getproc(pv->flag);
    proc->Set(pv, proc->GetPtr(pv), &v);
}

// UTF-16 → cp932 (ACP) 変換。デバイス名表示用。
static std::string wide_to_cp932(const wchar_t* w)
{
    if (!w) return std::string();
    int need = WideCharToMultiByte(CP_ACP, 0, w, -1, nullptr, 0, nullptr, nullptr);
    if (need <= 0) return std::string();
    std::string s(need - 1, '\0');
    WideCharToMultiByte(CP_ACP, 0, w, -1, &s[0], need, nullptr, nullptr);
    return s;
}

} // namespace

// ============================================================
// MIDI out state (単一ハンドル)
// ============================================================
static HMIDIOUT g_hmo = nullptr;

// ============================================================
// MIDI in state + リングバッファ
// ============================================================
struct MidiInMsg {
    DWORD status;  // data1 = (msg >> 8) & 0xFF ではなく分離済みで保存
    DWORD d1;
    DWORD d2;
};

static constexpr int    MIDI_IN_RING_SIZE = 1024;
static HMIDIIN          g_hmi = nullptr;
static CRITICAL_SECTION g_in_cs;
static bool             g_in_cs_init = false;
static MidiInMsg        g_in_ring[MIDI_IN_RING_SIZE];
static int              g_in_head = 0;  // 読出し位置
static int              g_in_tail = 0;  // 書込み位置
// 空: head == tail / 満杯: (tail + 1) % SIZE == head

static void ensure_cs()
{
    if (!g_in_cs_init) {
        InitializeCriticalSection(&g_in_cs);
        g_in_cs_init = true;
    }
}

static void push_msg(DWORD dwMidiMessage)
{
    // dwMidiMessage: low byte = status, 2nd = data1, 3rd = data2
    MidiInMsg m;
    m.status = dwMidiMessage & 0xFF;
    m.d1     = (dwMidiMessage >> 8)  & 0xFF;
    m.d2     = (dwMidiMessage >> 16) & 0xFF;

    EnterCriticalSection(&g_in_cs);
    int next = (g_in_tail + 1) % MIDI_IN_RING_SIZE;
    if (next == g_in_head) {
        // 満杯 → 一番古いものを捨てる (head を進める)
        g_in_head = (g_in_head + 1) % MIDI_IN_RING_SIZE;
    }
    g_in_ring[g_in_tail] = m;
    g_in_tail = next;
    LeaveCriticalSection(&g_in_cs);
}

static bool pop_msg(MidiInMsg& out)
{
    bool ok = false;
    EnterCriticalSection(&g_in_cs);
    if (g_in_head != g_in_tail) {
        out = g_in_ring[g_in_head];
        g_in_head = (g_in_head + 1) % MIDI_IN_RING_SIZE;
        ok = true;
    }
    LeaveCriticalSection(&g_in_cs);
    return ok;
}

// winmm から呼ばれる MIDI in コールバック (ワーカースレッド)
static void CALLBACK MidiInProc(HMIDIIN, UINT wMsg, DWORD_PTR,
                                DWORD_PTR dwParam1, DWORD_PTR /*dwParam2*/)
{
    if (wMsg == MIM_DATA) {
        push_msg((DWORD)dwParam1);
    }
    // MIM_LONGDATA (SysEx) は未対応
}

// ============================================================
// MIDI OUT 命令
// ============================================================

// midi_out_count  → stat
HSPMIDI_EXPORT BOOL WINAPI midi_out_count(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    return (BOOL)midiOutGetNumDevs();
}

// midi_out_name var_str, devid
HSPMIDI_EXPORT BOOL WINAPI midi_out_name(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    // 第1引数: var_str  (先に取得)
    PVal* pv = nullptr;
    APTR a = g_hei->HspFunc_prm_getva(&pv);
    int devid = getint();

    MIDIOUTCAPSW caps;
    ZeroMemory(&caps, sizeof(caps));
    MMRESULT r = midiOutGetDevCapsW((UINT_PTR)devid, &caps, sizeof(caps));
    std::string name;
    if (r == MMSYSERR_NOERROR) {
        name = wide_to_cp932(caps.szPname);
    }

    if (pv && pv->flag == HSPVAR_FLAG_STR) {
        pv->offset = a;
        HspVarProc* proc = g_hei->HspFunc_getproc(pv->flag);
        proc->Set(pv, proc->GetPtr(pv), (void*)name.c_str());
    }
    return (r == MMSYSERR_NOERROR) ? 0 : -(int)r;
}

// midi_out_open devid
HSPMIDI_EXPORT BOOL WINAPI midi_out_open(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int devid = getint();
    if (g_hmo) {
        midiOutClose(g_hmo);
        g_hmo = nullptr;
    }
    HMIDIOUT h = nullptr;
    MMRESULT r = midiOutOpen(&h, (UINT)devid, 0, 0, CALLBACK_NULL);
    if (r != MMSYSERR_NOERROR) return -(int)r;
    g_hmo = h;
    return 0;
}

// midi_out_close
HSPMIDI_EXPORT BOOL WINAPI midi_out_close(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)hei; (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    if (!g_hmo) return 0;
    MMRESULT r = midiOutReset(g_hmo);
    (void)r;
    MMRESULT r2 = midiOutClose(g_hmo);
    g_hmo = nullptr;
    return (r2 == MMSYSERR_NOERROR) ? 0 : -(int)r2;
}

// 内部: short message 送信
static int send_short(BYTE status, BYTE d1, BYTE d2)
{
    if (!g_hmo) return -1;
    DWORD msg = (DWORD)status | ((DWORD)d1 << 8) | ((DWORD)d2 << 16);
    MMRESULT r = midiOutShortMsg(g_hmo, msg);
    return (r == MMSYSERR_NOERROR) ? 0 : -(int)r;
}

// midi_out_short status, data1, data2
HSPMIDI_EXPORT BOOL WINAPI midi_out_short(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int st = getint();
    int d1 = getint();
    int d2 = getint();
    return (BOOL)send_short((BYTE)(st & 0xFF), (BYTE)(d1 & 0x7F), (BYTE)(d2 & 0x7F));
}

// midi_out_note_on ch, note, vel
HSPMIDI_EXPORT BOOL WINAPI midi_out_note_on(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int ch   = getint();
    int note = getint();
    int vel  = getint();
    return (BOOL)send_short((BYTE)(0x90 | (ch & 0x0F)),
                            (BYTE)(note & 0x7F), (BYTE)(vel & 0x7F));
}

// midi_out_note_off ch, note, vel
HSPMIDI_EXPORT BOOL WINAPI midi_out_note_off(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int ch   = getint();
    int note = getint();
    int vel  = getint();
    return (BOOL)send_short((BYTE)(0x80 | (ch & 0x0F)),
                            (BYTE)(note & 0x7F), (BYTE)(vel & 0x7F));
}

// midi_out_program_change ch, program
HSPMIDI_EXPORT BOOL WINAPI midi_out_program_change(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    int ch   = getint();
    int prog = getint();
    return (BOOL)send_short((BYTE)(0xC0 | (ch & 0x0F)),
                            (BYTE)(prog & 0x7F), 0);
}

// midi_out_reset
HSPMIDI_EXPORT BOOL WINAPI midi_out_reset(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)hei; (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    if (!g_hmo) return -1;
    MMRESULT r = midiOutReset(g_hmo);
    return (r == MMSYSERR_NOERROR) ? 0 : -(int)r;
}

// ============================================================
// MIDI IN 命令 (ポーリング式)
// ============================================================

// midi_in_count → stat
HSPMIDI_EXPORT BOOL WINAPI midi_in_count(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    return (BOOL)midiInGetNumDevs();
}

// midi_in_name var_str, devid
HSPMIDI_EXPORT BOOL WINAPI midi_in_name(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    PVal* pv = nullptr;
    APTR a = g_hei->HspFunc_prm_getva(&pv);
    int devid = getint();

    MIDIINCAPSW caps;
    ZeroMemory(&caps, sizeof(caps));
    MMRESULT r = midiInGetDevCapsW((UINT_PTR)devid, &caps, sizeof(caps));
    std::string name;
    if (r == MMSYSERR_NOERROR) {
        name = wide_to_cp932(caps.szPname);
    }

    if (pv && pv->flag == HSPVAR_FLAG_STR) {
        pv->offset = a;
        HspVarProc* proc = g_hei->HspFunc_getproc(pv->flag);
        proc->Set(pv, proc->GetPtr(pv), (void*)name.c_str());
    }
    return (r == MMSYSERR_NOERROR) ? 0 : -(int)r;
}

// midi_in_open devid
HSPMIDI_EXPORT BOOL WINAPI midi_in_open(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    ensure_cs();
    int devid = getint();

    if (g_hmi) {
        midiInStop(g_hmi);
        midiInClose(g_hmi);
        g_hmi = nullptr;
    }
    // リングバッファクリア
    EnterCriticalSection(&g_in_cs);
    g_in_head = g_in_tail = 0;
    LeaveCriticalSection(&g_in_cs);

    HMIDIIN h = nullptr;
    MMRESULT r = midiInOpen(&h, (UINT)devid,
                            (DWORD_PTR)(void*)MidiInProc,
                            0,
                            CALLBACK_FUNCTION);
    if (r != MMSYSERR_NOERROR) return -(int)r;
    g_hmi = h;
    return 0;
}

// midi_in_start
HSPMIDI_EXPORT BOOL WINAPI midi_in_start(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)hei; (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    if (!g_hmi) return -1;
    MMRESULT r = midiInStart(g_hmi);
    return (r == MMSYSERR_NOERROR) ? 0 : -(int)r;
}

// midi_in_stop
HSPMIDI_EXPORT BOOL WINAPI midi_in_stop(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)hei; (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    if (!g_hmi) return -1;
    MMRESULT r = midiInStop(g_hmi);
    return (r == MMSYSERR_NOERROR) ? 0 : -(int)r;
}

// midi_in_close
HSPMIDI_EXPORT BOOL WINAPI midi_in_close(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)hei; (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    if (!g_hmi) return 0;
    midiInStop(g_hmi);
    MMRESULT r = midiInClose(g_hmi);
    g_hmi = nullptr;
    return (r == MMSYSERR_NOERROR) ? 0 : -(int)r;
}

// midi_in_poll var_status, var_d1, var_d2
//   リングバッファから 1 件取り出して stat=1 (取得成功) / 0 (空)
HSPMIDI_EXPORT BOOL WINAPI midi_in_poll(HSPEXINFO* hei, int p1, int p2, int p3)
{
    (void)p1; (void)p2; (void)p3;
    set_hei(hei);
    ensure_cs();

    MidiInMsg m;
    bool got = pop_msg(m);
    if (!got) {
        // 3 つとも 0 を書く
        write_int_to_var(0);
        write_int_to_var(0);
        write_int_to_var(0);
        return 0;
    }
    write_int_to_var((int)m.status);
    write_int_to_var((int)m.d1);
    write_int_to_var((int)m.d2);
    return 1;
}

// ============================================================
// DllMain — プロセス終了時のクリーンアップ
// ============================================================
BOOL WINAPI DllMain(HINSTANCE /*hinst*/, DWORD reason, LPVOID /*reserved*/)
{
    if (reason == DLL_PROCESS_DETACH) {
        if (g_hmo) { midiOutReset(g_hmo); midiOutClose(g_hmo); g_hmo = nullptr; }
        if (g_hmi) { midiInStop(g_hmi);   midiInClose(g_hmi);  g_hmi = nullptr; }
        if (g_in_cs_init) {
            DeleteCriticalSection(&g_in_cs);
            g_in_cs_init = false;
        }
    }
    return TRUE;
}
