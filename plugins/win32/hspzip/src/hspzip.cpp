//============================================================
//   hspzip.dll — ZIP archive read/write via miniz
//
//   miniz (public domain single-file zlib/zip library) をラップして
//   HSP から ZIP ファイルの読み書きを 1 行で行えるようにする
//   ヘルパ DLL。
//
//   依存: third_party/miniz/miniz.c (同梱、amalgamated)
//
//   エクスポート:
//     int  zip_open_read(const char* path)
//     int  zip_open_write(const char* path)
//     int  zip_count(int handle) — エントリ数
//     int  zip_entry_name(int handle, int idx, char* buf, int len)
//     int  zip_entry_size(int handle, int idx) — 非圧縮サイズ
//     int  zip_extract_file(int handle, int idx, const char* out_path)
//     int  zip_extract_mem(int handle, int idx, void* buf, int max)
//     int  zip_add_file(int handle, const char* entry_name, const char* src_path)
//     int  zip_add_mem(int handle, const char* entry_name, const void* data, int len)
//     void zip_close(int handle)
//============================================================

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <cstring>
#include <cstdlib>
#include <cstdio>

#define MINIZ_NO_DEFLATE_APIS 0
#include "miniz.h"

#pragma comment(lib, "kernel32.lib")

#define HSPZIP_EXPORT extern "C" __declspec(dllexport)

namespace {

constexpr int MAX_HANDLES = 16;

struct ZipState {
    bool active = false;
    bool write_mode = false;
    mz_zip_archive zip = {};
};

static ZipState g_states[MAX_HANDLES];

int FindFreeHandle() {
    for (int i = 0; i < MAX_HANDLES; i++) {
        if (!g_states[i].active) return i;
    }
    return -1;
}

} // namespace

//============================================================
// Exports
//============================================================

HSPZIP_EXPORT int __stdcall zip_open_read(const char* path) {
    if (!path) return -1;
    int handle = FindFreeHandle();
    if (handle < 0) return -1;
    ZipState& s = g_states[handle];

    memset(&s.zip, 0, sizeof(s.zip));
    if (!mz_zip_reader_init_file(&s.zip, path, 0)) return -1;
    s.active = true;
    s.write_mode = false;
    return handle;
}

HSPZIP_EXPORT int __stdcall zip_open_write(const char* path) {
    if (!path) return -1;
    int handle = FindFreeHandle();
    if (handle < 0) return -1;
    ZipState& s = g_states[handle];

    memset(&s.zip, 0, sizeof(s.zip));
    if (!mz_zip_writer_init_file(&s.zip, path, 0)) return -1;
    s.active = true;
    s.write_mode = true;
    return handle;
}

HSPZIP_EXPORT int __stdcall zip_count(int handle) {
    if (handle < 0 || handle >= MAX_HANDLES) return -1;
    ZipState& s = g_states[handle];
    if (!s.active || s.write_mode) return -1;
    return (int)mz_zip_reader_get_num_files(&s.zip);
}

HSPZIP_EXPORT int __stdcall zip_entry_name(int handle, int idx, char* buf, int buflen) {
    if (handle < 0 || handle >= MAX_HANDLES) return -1;
    ZipState& s = g_states[handle];
    if (!s.active || s.write_mode || !buf || buflen <= 0) return -1;
    buf[0] = 0;
    mz_uint n = mz_zip_reader_get_filename(&s.zip, (mz_uint)idx, buf, (mz_uint)buflen);
    return (int)n;
}

HSPZIP_EXPORT int __stdcall zip_entry_size(int handle, int idx) {
    if (handle < 0 || handle >= MAX_HANDLES) return -1;
    ZipState& s = g_states[handle];
    if (!s.active || s.write_mode) return -1;
    mz_zip_archive_file_stat st = {};
    if (!mz_zip_reader_file_stat(&s.zip, (mz_uint)idx, &st)) return -1;
    return (int)st.m_uncomp_size;
}

HSPZIP_EXPORT int __stdcall zip_extract_file(int handle, int idx, const char* out_path) {
    if (handle < 0 || handle >= MAX_HANDLES || !out_path) return 0;
    ZipState& s = g_states[handle];
    if (!s.active || s.write_mode) return 0;
    return mz_zip_reader_extract_to_file(&s.zip, (mz_uint)idx, out_path, 0) ? 1 : 0;
}

HSPZIP_EXPORT int __stdcall zip_extract_mem(int handle, int idx, void* buf, int max_bytes) {
    if (handle < 0 || handle >= MAX_HANDLES || !buf || max_bytes <= 0) return -1;
    ZipState& s = g_states[handle];
    if (!s.active || s.write_mode) return -1;
    mz_zip_archive_file_stat st = {};
    if (!mz_zip_reader_file_stat(&s.zip, (mz_uint)idx, &st)) return -1;
    size_t copy = (size_t)st.m_uncomp_size;
    if ((int)copy > max_bytes) copy = (size_t)max_bytes;
    if (!mz_zip_reader_extract_to_mem(&s.zip, (mz_uint)idx, buf, copy, 0)) return -1;
    return (int)copy;
}

HSPZIP_EXPORT int __stdcall zip_add_file(int handle, const char* entry_name, const char* src_path) {
    if (handle < 0 || handle >= MAX_HANDLES || !entry_name || !src_path) return 0;
    ZipState& s = g_states[handle];
    if (!s.active || !s.write_mode) return 0;
    return mz_zip_writer_add_file(&s.zip, entry_name, src_path, NULL, 0, MZ_DEFAULT_COMPRESSION) ? 1 : 0;
}

HSPZIP_EXPORT int __stdcall zip_add_mem(int handle, const char* entry_name, const void* data, int len) {
    if (handle < 0 || handle >= MAX_HANDLES || !entry_name || !data || len < 0) return 0;
    ZipState& s = g_states[handle];
    if (!s.active || !s.write_mode) return 0;
    return mz_zip_writer_add_mem(&s.zip, entry_name, data, (size_t)len, MZ_DEFAULT_COMPRESSION) ? 1 : 0;
}

HSPZIP_EXPORT void __stdcall zip_close(int handle) {
    if (handle < 0 || handle >= MAX_HANDLES) return;
    ZipState& s = g_states[handle];
    if (!s.active) return;
    if (s.write_mode) {
        mz_zip_writer_finalize_archive(&s.zip);
        mz_zip_writer_end(&s.zip);
    } else {
        mz_zip_reader_end(&s.zip);
    }
    s.active = false;
    s.write_mode = false;
}

BOOL WINAPI DllMain(HMODULE, DWORD reason, LPVOID) {
    if (reason == DLL_PROCESS_DETACH) {
        for (int i = 0; i < MAX_HANDLES; i++) {
            if (g_states[i].active) zip_close(i);
        }
    }
    return TRUE;
}
