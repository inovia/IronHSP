//============================================================
//   hspwinrtspeech.dll — Live mic speech recognition via WinRT
//
//   Windows.Media.SpeechRecognition.SpeechRecognizer (WinRT) を
//   C++/WinRT で叩いてマイク入力からの音声認識を HSP に提供する
//   helper DLL。
//
//   重要: WinRT SpeechRecognition は microphone-only。
//   WAV ファイル等の事前録音音声は受け付けない仕様。
//   ファイルから文字起こししたい場合は SPEECH_BACKEND_WHISPER /
//   SPEECH_BACKEND_VOSK / SPEECH_BACKEND_SAPI を使ってください。
//
//   特徴:
//     - Win10/11 標準、追加 DL 不要
//     - 多言語: OS にインストール済みの音声認識言語に依存
//       (en-US は標準、ja-JP は別途 Speech Pack インストール要)
//     - ライブマイクからの dictation
//     - C++/WinRT (header-only) で C++17 必須
//
//   エクスポート:
//     int  winrt_speech_open(const char* lang)
//          lang : "en-US" / "ja-JP" / "" (システム既定)
//     int  winrt_speech_listen_once(int handle, char* text, int len)
//          マイクから 1 回の発話を取得 (ブロッキング、最大 ~10 秒)
//     void winrt_speech_close(int handle)
//============================================================

#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>

#include <winrt/base.h>
#include <winrt/Windows.Foundation.h>
#include <winrt/Windows.Foundation.Collections.h>
#include <winrt/Windows.Globalization.h>
#include <winrt/Windows.Media.SpeechRecognition.h>

#include <string>
#include <vector>
#include <cstring>

#pragma comment(lib, "windowsapp.lib")

#define HSPWINRT_EXPORT extern "C" __declspec(dllexport)

namespace {

using namespace winrt;
using namespace winrt::Windows::Foundation;
using namespace winrt::Windows::Globalization;
using namespace winrt::Windows::Media::SpeechRecognition;

constexpr int MAX_HANDLES = 16;

struct WinRTSpeechState {
    bool active = false;
    SpeechRecognizer recognizer{nullptr};
    std::wstring lang;
};

static WinRTSpeechState g_states[MAX_HANDLES];
static bool g_apartment_inited = false;

int FindFreeHandle() {
    for (int i = 0; i < MAX_HANDLES; i++) {
        if (!g_states[i].active) return i;
    }
    return -1;
}

static std::wstring AnsiToWide(const char* s) {
    if (!s) return L"";
    int wlen = MultiByteToWideChar(CP_ACP, 0, s, -1, NULL, 0);
    std::vector<wchar_t> buf(wlen);
    MultiByteToWideChar(CP_ACP, 0, s, -1, buf.data(), wlen);
    return std::wstring(buf.data());
}

static std::string WideToUtf8(std::wstring_view w) {
    if (w.empty()) return "";
    int n = WideCharToMultiByte(CP_UTF8, 0, w.data(), (int)w.size(), NULL, 0, NULL, NULL);
    std::vector<char> buf(n);
    WideCharToMultiByte(CP_UTF8, 0, w.data(), (int)w.size(), buf.data(), n, NULL, NULL);
    return std::string(buf.data(), n);
}

} // namespace

//============================================================
// Exports
//============================================================

HSPWINRT_EXPORT int __stdcall winrt_speech_open(const char* lang) {
    int handle = FindFreeHandle();
    if (handle < 0) return -1;
    WinRTSpeechState& s = g_states[handle];

    try {
        if (!g_apartment_inited) {
            init_apartment(apartment_type::single_threaded);
            g_apartment_inited = true;
        }

        SpeechRecognizer recognizer = nullptr;
        if (lang && *lang) {
            std::wstring wl = AnsiToWide(lang);
            hstring hl{ wl };
            Language language{ hl };
            recognizer = SpeechRecognizer{ language };
            s.lang = wl;
        } else {
            recognizer = SpeechRecognizer{};
        }

        // Compile (dictation default constraint)
        auto compileResult = recognizer.CompileConstraintsAsync().get();
        if (compileResult.Status() != SpeechRecognitionResultStatus::Success) {
            return -1;
        }

        s.recognizer = recognizer;
        s.active = true;
        return handle;
    } catch (const winrt::hresult_error&) {
        return -1;
    } catch (...) {
        return -1;
    }
}

HSPWINRT_EXPORT int __stdcall winrt_speech_listen_once(int handle, char* out_text, int out_len) {
    if (handle < 0 || handle >= MAX_HANDLES) return -1;
    WinRTSpeechState& s = g_states[handle];
    if (!s.active) return -1;
    if (!out_text || out_len <= 0) return -1;
    out_text[0] = 0;

    try {
        // RecognizeAsync は 1 phrase を取って完了 (最大 ~10 秒)
        auto result = s.recognizer.RecognizeAsync().get();

        if (result.Status() != SpeechRecognitionResultStatus::Success) {
            return -1;
        }

        auto wtext = result.Text();
        std::wstring_view wview{ wtext.c_str(), wtext.size() };
        std::string utf8 = WideToUtf8(wview);

        int n = (int)utf8.size();
        if (n >= out_len) n = out_len - 1;
        memcpy(out_text, utf8.data(), n);
        out_text[n] = 0;
        return n;
    } catch (const winrt::hresult_error&) {
        return -1;
    } catch (...) {
        return -1;
    }
}

HSPWINRT_EXPORT void __stdcall winrt_speech_close(int handle) {
    if (handle < 0 || handle >= MAX_HANDLES) return;
    WinRTSpeechState& s = g_states[handle];
    if (!s.active) return;
    s.recognizer = nullptr;
    s.lang.clear();
    s.active = false;
}

BOOL WINAPI DllMain(HMODULE, DWORD reason, LPVOID) {
    if (reason == DLL_PROCESS_DETACH) {
        for (int i = 0; i < MAX_HANDLES; i++) {
            if (g_states[i].active) winrt_speech_close(i);
        }
    }
    return TRUE;
}
