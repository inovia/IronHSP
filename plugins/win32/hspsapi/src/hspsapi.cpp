//============================================================
//   hspsapi.dll — Speech recognition via Windows SAPI 5
//
//   Win32 標準の sapi.dll (ISpRecognizer / ISpRecoContext /
//   ISpRecoGrammar / ISpStream) を C++ で薄くラップして HSP から
//   オフライン音声認識を 1 行で叩けるようにする helper DLL。
//
//   特徴:
//     - Windows 標準、追加 DL 不要 (sapi.dll は OS 同梱)
//     - 言語: OS の Speech Recognition Language に依存
//       (英語は Win10 以降標準、日本語は別途 Speech Pack インストール要)
//     - WAV ファイル → ディクテーションテキスト
//
//   注意:
//     - 認識品質は whisper.cpp / Vosk より低い
//     - 日本語認識は Windows 設定 → 言語 → 音声認識 で日本語を
//       インストールしないと動かない
//     - ライブマイクキャプチャは未実装 (WAV のみ)
//
//   エクスポート:
//     int  sapi_open(const char* lang)
//          lang : "en-US" / "ja-JP" / "" (デフォルト = システム既定)
//     int  sapi_transcribe_wav(int handle, const char* wav_path, char* text, int len)
//     void sapi_close(int handle)
//============================================================

#define WIN32_LEAN_AND_MEAN
#define _WIN32_DCOM
#include <windows.h>
#include <objbase.h>
#include <sapi.h>
#include <sphelper.h>
#include <atlbase.h>
#include <cstring>
#include <string>
#include <vector>

#pragma comment(lib, "ole32.lib")
#pragma comment(lib, "sapi.lib")

#define HSPSAPI_EXPORT extern "C" __declspec(dllexport)

namespace {

constexpr int MAX_HANDLES = 16;

struct SapiState {
    bool active = false;
    ISpRecognizer* recognizer = nullptr;
    ISpRecoContext* context = nullptr;
    ISpRecoGrammar* grammar = nullptr;
    std::wstring lang;
};

static SapiState g_states[MAX_HANDLES];

template <typename T> inline void SafeRelease(T*& p) {
    if (p) { p->Release(); p = nullptr; }
}

int FindFreeHandle() {
    for (int i = 0; i < MAX_HANDLES; i++) {
        if (!g_states[i].active) return i;
    }
    return -1;
}

// Wide → ANSI (UTF-8) 変換
static std::string WideToAnsi(LPCWSTR w) {
    if (!w) return "";
    int len = WideCharToMultiByte(CP_UTF8, 0, w, -1, NULL, 0, NULL, NULL);
    if (len <= 0) return "";
    std::vector<char> buf(len);
    WideCharToMultiByte(CP_UTF8, 0, w, -1, buf.data(), len, NULL, NULL);
    return std::string(buf.data());
}

} // namespace

//============================================================
// Exports
//============================================================

HSPSAPI_EXPORT int __stdcall sapi_open(const char* lang) {
    int handle = FindFreeHandle();
    if (handle < 0) return -1;
    SapiState& s = g_states[handle];

    HRESULT hr;

    // SpInprocRecognizer (audio file からの認識用)
    hr = CoCreateInstance(CLSID_SpInprocRecognizer, NULL, CLSCTX_ALL,
                          IID_ISpRecognizer, (void**)&s.recognizer);
    if (FAILED(hr) || !s.recognizer) return -1;

    // 言語指定がある場合は対応エンジンを選ぶ
    if (lang && *lang) {
        // ANSI → wide
        int wlen = MultiByteToWideChar(CP_ACP, 0, lang, -1, NULL, 0);
        std::vector<wchar_t> wlang(wlen);
        MultiByteToWideChar(CP_ACP, 0, lang, -1, wlang.data(), wlen);
        s.lang = wlang.data();

        ISpObjectToken* token = nullptr;
        std::wstring requirements = L"Language=" + std::wstring(wlang.data());
        if (SUCCEEDED(SpFindBestToken(SPCAT_RECOGNIZERS, requirements.c_str(), NULL, &token)) && token) {
            s.recognizer->SetRecognizer(token);
            token->Release();
        }
    }

    // RecoContext
    hr = s.recognizer->CreateRecoContext(&s.context);
    if (FAILED(hr) || !s.context) {
        SafeRelease(s.recognizer);
        return -1;
    }
    s.context->SetNotifyWin32Event();
    s.context->SetInterest(SPFEI(SPEI_RECOGNITION) | SPFEI(SPEI_END_SR_STREAM),
                           SPFEI(SPEI_RECOGNITION) | SPFEI(SPEI_END_SR_STREAM));

    // ディクテーション grammar
    hr = s.context->CreateGrammar(0, &s.grammar);
    if (FAILED(hr) || !s.grammar) {
        SafeRelease(s.context);
        SafeRelease(s.recognizer);
        return -1;
    }
    s.grammar->LoadDictation(NULL, SPLO_STATIC);
    s.grammar->SetDictationState(SPRS_INACTIVE);  // open 時点では止めておく

    s.active = true;
    return handle;
}

HSPSAPI_EXPORT int __stdcall sapi_transcribe_wav(int handle, const char* wav_path,
                                                 char* out_text, int out_len) {
    if (handle < 0 || handle >= MAX_HANDLES) return -1;
    SapiState& s = g_states[handle];
    if (!s.active) return -1;
    if (!out_text || out_len <= 0) return -1;
    out_text[0] = 0;

    // WAV path → wide
    int wlen = MultiByteToWideChar(CP_ACP, 0, wav_path, -1, NULL, 0);
    if (wlen <= 0) return -1;
    std::vector<wchar_t> wpath(wlen);
    MultiByteToWideChar(CP_ACP, 0, wav_path, -1, wpath.data(), wlen);

    // ISpStream で WAV を開く
    CComPtr<ISpStream> stream;
    HRESULT hr = SPBindToFile(wpath.data(), SPFM_OPEN_READONLY, &stream,
                              &SPDFID_WaveFormatEx, NULL);
    if (FAILED(hr) || !stream) return -1;

    s.recognizer->SetInput(stream, TRUE);
    s.recognizer->SetRecoState(SPRST_ACTIVE);
    s.grammar->SetDictationState(SPRS_ACTIVE);

    // イベントループ
    HANDLE evt = s.context->GetNotifyEventHandle();
    std::string concat;

    bool finished = false;
    int safety = 0;
    while (!finished && safety < 6000) {     // 最大 ~10 分待機
        DWORD wr = WaitForSingleObject(evt, 100);
        if (wr == WAIT_TIMEOUT) {
            safety++;
            continue;
        }

        SPEVENT event = {};
        ULONG fetched = 0;
        while (s.context->GetEvents(1, &event, &fetched) == S_OK) {
            if (event.eEventId == SPEI_RECOGNITION) {
                ISpRecoResult* result = (ISpRecoResult*)event.lParam;
                if (result) {
                    LPWSTR phrase = nullptr;
                    if (SUCCEEDED(result->GetText(SP_GETWHOLEPHRASE, SP_GETWHOLEPHRASE,
                                                  FALSE, &phrase, NULL)) && phrase) {
                        if (!concat.empty()) concat += " ";
                        concat += WideToAnsi(phrase);
                        CoTaskMemFree(phrase);
                    }
                }
            } else if (event.eEventId == SPEI_END_SR_STREAM) {
                finished = true;
            }
            SpClearEvent(&event);
            if (finished) break;
        }
    }

    s.recognizer->SetRecoState(SPRST_INACTIVE);
    s.grammar->SetDictationState(SPRS_INACTIVE);

    int n = (int)concat.size();
    if (n >= out_len) n = out_len - 1;
    memcpy(out_text, concat.data(), n);
    out_text[n] = 0;
    return n;
}

HSPSAPI_EXPORT void __stdcall sapi_close(int handle) {
    if (handle < 0 || handle >= MAX_HANDLES) return;
    SapiState& s = g_states[handle];
    if (!s.active) return;
    SafeRelease(s.grammar);
    SafeRelease(s.context);
    SafeRelease(s.recognizer);
    s.lang.clear();
    s.active = false;
}

BOOL WINAPI DllMain(HMODULE, DWORD reason, LPVOID) {
    if (reason == DLL_PROCESS_ATTACH) {
        CoInitializeEx(NULL, COINIT_APARTMENTTHREADED | COINIT_DISABLE_OLE1DDE);
    } else if (reason == DLL_PROCESS_DETACH) {
        for (int i = 0; i < MAX_HANDLES; i++) {
            if (g_states[i].active) sapi_close(i);
        }
        CoUninitialize();
    }
    return TRUE;
}
