#include "mv1_via_pmx.hpp"
#include "ir_to_pmx.hpp"

#include <cstdio>
#include <cstdlib>
#include <filesystem>
#include <fstream>
#include <random>

#ifdef _WIN32
#include <windows.h>
#endif

namespace mv1conv {

namespace {

// mv1_dxlib_saver.exe の場所を解決。
// 1. 環境変数 MV1CONV_SAVER_PATH があればそれを使う
// 2. mv1conv.exe と同じディレクトリを探す
// 3. "mv1_dxlib_saver.exe" (PATH 解決)
std::string find_saver_exe() {
    if (const char *env = std::getenv("MV1CONV_SAVER_PATH")) {
        if (std::filesystem::exists(env)) return env;
    }

#ifdef _WIN32
    wchar_t self_w[MAX_PATH];
    DWORD n = GetModuleFileNameW(nullptr, self_w, MAX_PATH);
    if (n > 0 && n < MAX_PATH) {
        std::filesystem::path self(self_w);
        auto candidate = self.parent_path() / L"mv1_dxlib_saver.exe";
        if (std::filesystem::exists(candidate)) {
            return candidate.string();
        }
    }
#endif

    return "mv1_dxlib_saver.exe";
}

std::string generate_temp_pmx_path() {
    std::random_device rd;
    std::mt19937_64 rng(rd());
    auto temp_dir = std::filesystem::temp_directory_path();
    auto path = temp_dir / ("mv1conv_" + std::to_string(rng()) + ".pmx");
    return path.string();
}

#ifdef _WIN32
// Windows: CreateProcessW で subprocess を起動、stderr を親に継承。
bool run_saver_subprocess(const std::string &saver_exe,
                          const std::string &input_pmx,
                          const std::string &output_mv1,
                          std::string &err_msg) {
    // コマンドライン組立。パスに空白があるので各引数をダブルクオート。
    auto wide = [](const std::string &s) {
        int n = MultiByteToWideChar(CP_UTF8, 0, s.c_str(), -1, nullptr, 0);
        std::wstring w(n, L'\0');
        MultiByteToWideChar(CP_UTF8, 0, s.c_str(), -1, w.data(), n);
        if (!w.empty() && w.back() == L'\0') w.pop_back();
        return w;
    };
    std::wstring cmd;
    cmd += L'"'; cmd += wide(saver_exe); cmd += L"\" \"";
    cmd += wide(input_pmx); cmd += L"\" \"";
    cmd += wide(output_mv1); cmd += L'"';

    std::vector<wchar_t> cmd_mut(cmd.begin(), cmd.end());
    cmd_mut.push_back(0);

    STARTUPINFOW si{};
    si.cb = sizeof(si);
    si.dwFlags = STARTF_USESTDHANDLES;
    si.hStdInput  = GetStdHandle(STD_INPUT_HANDLE);
    si.hStdOutput = GetStdHandle(STD_OUTPUT_HANDLE);
    si.hStdError  = GetStdHandle(STD_ERROR_HANDLE);

    PROCESS_INFORMATION pi{};
    BOOL ok = CreateProcessW(nullptr,
                             cmd_mut.data(),
                             nullptr, nullptr,
                             TRUE /* inherit handles */,
                             0, nullptr, nullptr,
                             &si, &pi);
    if (!ok) {
        err_msg = "CreateProcessW failed: " + saver_exe;
        return false;
    }
    WaitForSingleObject(pi.hProcess, INFINITE);
    DWORD exit_code = 1;
    GetExitCodeProcess(pi.hProcess, &exit_code);
    CloseHandle(pi.hProcess);
    CloseHandle(pi.hThread);
    if (exit_code != 0) {
        err_msg = "mv1_dxlib_saver returned " + std::to_string(exit_code);
        return false;
    }
    return true;
}
#else
bool run_saver_subprocess(const std::string &saver_exe,
                          const std::string &input_pmx,
                          const std::string &output_mv1,
                          std::string &err_msg) {
    std::string cmd = "\"" + saver_exe + "\" \"" + input_pmx + "\" \"" + output_mv1 + "\"";
    int ret = std::system(cmd.c_str());
    if (ret != 0) {
        err_msg = "mv1_dxlib_saver returned " + std::to_string(ret);
        return false;
    }
    return true;
}
#endif

} // anonymous

Mv1ViaPmxResult save_mv1_via_pmx(const ModelIR &ir, const std::string &output_path) {
    Mv1ViaPmxResult res;

    // 1. IR → PMX バイト列
    std::string enc_err;
    auto pmx_bytes = ir_to_pmx(ir, &enc_err);
    if (pmx_bytes.empty()) {
        res.error = "ir_to_pmx failed: " + enc_err;
        return res;
    }

    // 2. tempfile.pmx に書き出し
    std::string temp_pmx = generate_temp_pmx_path();
    {
        std::ofstream ofs(temp_pmx, std::ios::binary);
        if (!ofs) {
            res.error = "failed to open tempfile for write: " + temp_pmx;
            return res;
        }
        ofs.write(reinterpret_cast<const char *>(pmx_bytes.data()),
                  static_cast<std::streamsize>(pmx_bytes.size()));
    }

    // 3. subprocess 起動
    std::string saver = find_saver_exe();
    std::string subprocess_err;
    bool ok = run_saver_subprocess(saver, temp_pmx, output_path, subprocess_err);

    // 4. クリーンアップ (MV1CONV_KEEP_TEMP_PMX=1 で保持)
    if (!std::getenv("MV1CONV_KEEP_TEMP_PMX")) {
        std::error_code ec;
        std::filesystem::remove(temp_pmx, ec);
    } else {
        std::fprintf(stderr, "[mv1conv] kept temp pmx: %s\n", temp_pmx.c_str());
    }

    if (!ok) {
        res.error = subprocess_err;
        return res;
    }
    res.ok = true;
    return res;
}

} // namespace mv1conv
