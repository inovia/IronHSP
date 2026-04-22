#include "mv1_reader.hpp"
#include "dxa.hpp"
#include <cstdio>
#include <cstring>
#include <filesystem>

namespace mv1conv {

namespace {

std::vector<std::uint8_t> read_all(const std::string &path, std::string &err) {
    std::vector<std::uint8_t> buf;
    std::FILE *fp = std::fopen(path.c_str(), "rb");
    if (!fp) { err = "cannot open: " + path; return buf; }
    std::error_code ec;
    auto size = std::filesystem::file_size(path, ec);
    if (ec) { err = "file_size failed: " + ec.message(); std::fclose(fp); return buf; }
    buf.resize(static_cast<std::size_t>(size));
    if (std::fread(buf.data(), 1, buf.size(), fp) != buf.size()) {
        err = "short read: " + path;
        buf.clear();
    }
    std::fclose(fp);
    return buf;
}

}

Mv1File Mv1File::load(const std::string &path) {
    Mv1File r;
    std::string err;
    auto file = read_all(path, err);
    if (!err.empty()) { r.error_ = err; return r; }
    return from_bytes(std::span<const std::uint8_t>(file.data(), file.size()));
}

Mv1File Mv1File::from_bytes(std::span<const std::uint8_t> file_bytes) {
    Mv1File r;
    if (file_bytes.size() < 4 + 9) {
        r.error_ = "file too small";
        return r;
    }
    if (std::memcmp(file_bytes.data(), "MV11", 4) != 0) {
        r.error_ = "magic mismatch (not 'MV11')";
        return r;
    }
    // DxLib の設計: 保存時は CheckID(4 byte) + DXA(残り) でファイル書出、
    // ロード時は FHeader+4 に DXA 展開 (CheckID 4 byte は外側 magic を流用)。
    // 我々もバッファ先頭 4 byte に "MV11" を置き、DXA 結果を offset 4 以降に貼る。
    auto dxa_src = file_bytes.subspan(4);
    const std::uint32_t dec_size = dxa::decoded_size(dxa_src);
    r.storage_.resize(static_cast<std::size_t>(dec_size) + 4);
    std::memcpy(r.storage_.data(), "MV11", 4);

    auto decoded = dxa::decode(dxa_src);
    if (!decoded.ok()) {
        r.error_ = "DXA decode: " + decoded.error;
        return r;
    }
    if (decoded.data.size() != dec_size) {
        r.error_ = "DXA size mismatch (" +
                   std::to_string(decoded.data.size()) + " vs " +
                   std::to_string(dec_size) + ")";
        return r;
    }
    std::memcpy(r.storage_.data() + 4, decoded.data.data(), decoded.data.size());
    r.buffer_ = std::span<const std::uint8_t>(r.storage_.data(), r.storage_.size());

    auto hdr = r.header();
    if (!hdr) {
        r.error_ = "decoded buffer too small for header (size=" +
                   std::to_string(r.buffer_.size()) + ", need=" +
                   std::to_string(sizeof(f1::MV1MODEL_FILEHEADER_F1)) + ")";
        return r;
    }
    if (std::memcmp(hdr->CheckID, "MV11", 4) != 0) {
        r.error_ = "inner CheckID != 'MV11'";  // ここは自前書込みなので通常 ok
        return r;
    }
    // Version は実ファイルでは 0 (DxLib 3.24f 現行)。将来拡張用フィールドのため特に制約はかけない
    return r;
}

const f1::MV1MODEL_FILEHEADER_F1 *Mv1File::header() const {
    if (buffer_.size() < sizeof(f1::MV1MODEL_FILEHEADER_F1)) return nullptr;
    return reinterpret_cast<const f1::MV1MODEL_FILEHEADER_F1 *>(buffer_.data());
}

std::string_view Mv1File::cstr_in_pool(f1::DWORD pool_offset) const {
    if (pool_offset == 0) return {}; // 0 = null pointer convention
    auto hdr = header();
    if (!hdr) return {};
    if (hdr->StringBuffer == 0 || hdr->StringSize <= 0) return {};
    const std::size_t pool_base = hdr->StringBuffer;
    if (pool_base >= buffer_.size()) return {};
    const std::size_t pool_end = pool_base + static_cast<std::size_t>(hdr->StringSize);
    if (pool_end > buffer_.size()) return {};
    if (pool_offset >= static_cast<f1::DWORD>(hdr->StringSize)) return {};
    const char *s = reinterpret_cast<const char *>(buffer_.data() + pool_base + pool_offset);
    std::size_t maxlen = pool_end - (pool_base + pool_offset);
    std::size_t n = 0;
    while (n < maxlen && s[n] != '\0') ++n;
    return std::string_view(s, n);
}

}
