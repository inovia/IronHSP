#include "vmd_import.hpp"
#include <algorithm>
#include <cstdio>
#include <cstdint>
#include <cstring>
#include <filesystem>
#include <string>
#include <unordered_map>
#include <vector>
#include <windows.h>

namespace mv1conv {

namespace {

// Shift-JIS → UTF-8 変換 (Windows API)
std::string sjis_to_utf8(const unsigned char *data, std::size_t n) {
    // n byte 内で NUL 終端を探す
    std::size_t len = 0;
    while (len < n && data[len] != 0) ++len;
    if (len == 0) return {};
    int wlen = MultiByteToWideChar(932, 0, reinterpret_cast<const char *>(data), (int)len, nullptr, 0);
    if (wlen <= 0) return {};
    std::wstring w(wlen, L'\0');
    MultiByteToWideChar(932, 0, reinterpret_cast<const char *>(data), (int)len, w.data(), wlen);
    int u8len = WideCharToMultiByte(CP_UTF8, 0, w.data(), wlen, nullptr, 0, nullptr, nullptr);
    std::string s(u8len, '\0');
    WideCharToMultiByte(CP_UTF8, 0, w.data(), wlen, s.data(), u8len, nullptr, nullptr);
    return s;
}

}  // anonymous

LoadResult attach_vmd(const std::string &vmd_path, const ModelIR &existing_model) {
    LoadResult r;
    r.ir = existing_model;  // 既存 IR をコピー

    std::FILE *fp = std::fopen(vmd_path.c_str(), "rb");
    if (!fp) { r.error = "cannot open vmd: " + vmd_path; return r; }
    std::error_code ec;
    auto sz = std::filesystem::file_size(vmd_path, ec);
    if (ec || sz < 50) { r.error = "vmd: file too small"; std::fclose(fp); return r; }
    std::vector<std::uint8_t> buf(sz);
    if (std::fread(buf.data(), 1, buf.size(), fp) != buf.size()) {
        r.error = "vmd: short read"; std::fclose(fp); return r;
    }
    std::fclose(fp);

    const std::uint8_t *p = buf.data();
    const std::uint8_t *end = buf.data() + buf.size();

    // Header: "Vocaloid Motion Data 0002" (30 bytes) + model name (20 bytes、SJIS)
    if (p + 30 > end || std::memcmp(p, "Vocaloid Motion Data", 20) != 0) {
        r.error = "vmd: missing Vocaloid Motion Data magic";
        return r;
    }
    std::string version(reinterpret_cast<const char *>(p + 20), 10);
    (void)version;
    p += 30;
    if (p + 20 > end) { r.error = "vmd: truncated header"; return r; }
    std::string modelNameSjis = sjis_to_utf8(p, 20);
    p += 20;
    (void)modelNameSjis;

    // BoneKey count + BoneKeys
    if (p + 4 > end) { r.error = "vmd: missing bone count"; return r; }
    std::uint32_t boneKeyN;
    std::memcpy(&boneKeyN, p, 4); p += 4;

    // bone 名 → ir.bones index map
    std::unordered_map<std::string, int> boneByName;
    for (std::size_t i = 0; i < r.ir.bones.size(); ++i) {
        boneByName[r.ir.bones[i].name] = static_cast<int>(i);
    }

    // bone 名 → キー列 (pos+rot)
    struct VmdBoneKey {
        float time;   // フレーム (1/30 s 単位) → 秒に変換
        float pos[3];
        float quat[4];
    };
    std::unordered_map<std::string, std::vector<VmdBoneKey>> boneKeys;

    const std::size_t boneKeyStride = 15 + 4 + 12 + 16 + 64;  // = 111 bytes/key
    for (std::uint32_t i = 0; i < boneKeyN; ++i) {
        if (p + boneKeyStride > end) { r.error = "vmd: bone keys truncated"; return r; }
        std::string bname = sjis_to_utf8(p, 15);
        p += 15;
        std::uint32_t frame; std::memcpy(&frame, p, 4); p += 4;
        float pos[3];  std::memcpy(pos, p, 12); p += 12;
        float quat[4]; std::memcpy(quat, p, 16); p += 16;
        p += 64;  // interpolation curve (skip)

        auto it = boneByName.find(bname);
        if (it == boneByName.end()) continue;  // model に無い bone は skip
        VmdBoneKey k;
        k.time = frame / 30.0f;
        k.pos[0] = pos[0]; k.pos[1] = pos[1]; k.pos[2] = pos[2];
        k.quat[0] = quat[0]; k.quat[1] = quat[1]; k.quat[2] = quat[2]; k.quat[3] = quat[3];
        boneKeys[bname].push_back(k);
    }

    // 各 bone キーをフレーム順にソート
    for (auto &[name, keys] : boneKeys) {
        std::sort(keys.begin(), keys.end(), [](const VmdBoneKey &a, const VmdBoneKey &b){
            return a.time < b.time;
        });
    }

    // IR の anim セクションに新しい AnimSet を追加
    AnimSetIR aset;
    // VMD ファイル名 (拡張子除去) を AnimSet 名にする
    std::filesystem::path vp(vmd_path);
    aset.name = vp.stem().string();
    aset.flag = 0;
    float maxSetT = 0.0f;

    for (const auto &[name, keys] : boneKeys) {
        if (keys.empty()) continue;
        auto it = boneByName.find(name);
        if (it == boneByName.end()) continue;
        int boneIdx = it->second;

        AnimIR an;
        // skin 時 frame idx = 1 + meshCount + boneIdx (writer 規約)
        an.target_frame_index = boneIdx;  // writer 側で bones offset を加算しない構造なので、
                                          //   ここは bone index のみ。
        // bones の Frame index は writer 側 = bonesBaseIdx + boneIdx。
        // ModelIR の anim.target_frame_index は Frame 絶対 index を期待する。
        // → 補正: 外側で再調整する (後述) か、1 + meshCount + boneIdx にする。
        // 暫定: writer の extract_animations と同じ生成を目指すなら frame index 計算を使う。
        // ここでは「最終的な MV1 frame index」 = 1 (root) + meshes + boneIdx を入れる。
        an.target_frame_index = static_cast<std::int32_t>(1 + r.ir.meshes.size() + boneIdx);
        float maxChT = 0.0f;

        // Translate KeySet (VECTOR)
        AnimKeySetIR ks_t;
        ks_t.data_type = AnimKeySetIR::DT_TRANSLATE;
        ks_t.key_type = AnimKeySetIR::KT_VECTOR;
        ks_t.key_times.reserve(keys.size());
        ks_t.key_values.reserve(keys.size() * 3);
        for (const auto &k : keys) {
            ks_t.key_times.push_back(k.time);
            ks_t.key_values.push_back(k.pos[0]);
            ks_t.key_values.push_back(k.pos[1]);
            ks_t.key_values.push_back(k.pos[2]);
            if (k.time > maxChT) maxChT = k.time;
        }
        an.keyset_indices.push_back(r.ir.anim_keysets.size());
        r.ir.anim_keysets.push_back(std::move(ks_t));

        // Rotate KeySet (QUATERNION_X = xyzw)
        AnimKeySetIR ks_r;
        ks_r.data_type = AnimKeySetIR::DT_ROTATE;
        ks_r.key_type = AnimKeySetIR::KT_QUATERNION_X;
        ks_r.key_times.reserve(keys.size());
        ks_r.key_values.reserve(keys.size() * 4);
        for (const auto &k : keys) {
            ks_r.key_times.push_back(k.time);
            ks_r.key_values.push_back(k.quat[0]);
            ks_r.key_values.push_back(k.quat[1]);
            ks_r.key_values.push_back(k.quat[2]);
            ks_r.key_values.push_back(k.quat[3]);
        }
        an.keyset_indices.push_back(r.ir.anim_keysets.size());
        r.ir.anim_keysets.push_back(std::move(ks_r));

        an.max_time = maxChT;
        if (maxChT > maxSetT) maxSetT = maxChT;

        aset.anim_indices.push_back(r.ir.anims.size());
        r.ir.anims.push_back(std::move(an));
    }

    // ==================== Face (表情) keys ====================
    // Face key は 15 byte name (SJIS) + 4 byte frame + 4 byte weight (float)
    std::unordered_map<std::string, std::vector<std::pair<float, float>>> faceKeys;  // name → [(time, weight)]
    if (p + 4 <= end) {
        std::uint32_t faceKeyN;
        std::memcpy(&faceKeyN, p, 4); p += 4;
        const std::size_t faceKeyStride = 15 + 4 + 4;
        for (std::uint32_t i = 0; i < faceKeyN; ++i) {
            if (p + faceKeyStride > end) break;
            std::string fname = sjis_to_utf8(p, 15);
            p += 15;
            std::uint32_t frame; std::memcpy(&frame, p, 4); p += 4;
            float w; std::memcpy(&w, p, 4); p += 4;
            faceKeys[fname].emplace_back(frame / 30.0f, w);
        }
    }

    // shape name → ShapeIR index map
    std::unordered_map<std::string, int> shapeByName;
    for (std::size_t i = 0; i < r.ir.shapes.size(); ++i) {
        shapeByName[r.ir.shapes[i].name] = static_cast<int>(i);
    }
    // 各 face → TRACE single AnimIR with single SHAPE keyset
    for (auto &[name, keys] : faceKeys) {
        auto it = shapeByName.find(name);
        if (it == shapeByName.end()) continue;
        std::sort(keys.begin(), keys.end());
        AnimIR an;
        an.target_frame_index = 0;  // root frame を対象 (MV1 は frame 単位だがここでは root)
        float maxT = 0;
        AnimKeySetIR ks;
        ks.data_type = AnimKeySetIR::DT_SHAPE;
        ks.key_type = AnimKeySetIR::KT_LINEAR;
        ks.target_shape_index = it->second;
        ks.key_times.reserve(keys.size());
        ks.key_values.reserve(keys.size());
        for (const auto &[t, w] : keys) {
            ks.key_times.push_back(t);
            ks.key_values.push_back(w);
            if (t > maxT) maxT = t;
        }
        an.max_time = maxT;
        an.keyset_indices.push_back(r.ir.anim_keysets.size());
        r.ir.anim_keysets.push_back(std::move(ks));

        aset.anim_indices.push_back(r.ir.anims.size());
        r.ir.anims.push_back(std::move(an));
        if (maxT > maxSetT) maxSetT = maxT;
    }

    aset.max_time = maxSetT;
    if (!aset.anim_indices.empty()) {
        r.ir.anim_sets.push_back(std::move(aset));
    } else {
        r.error = "vmd: no matching bones/faces (VMD 対象が model bone/shape 名と一致しません)";
    }

    // ==================== Camera / Light / Shadow / IK keys (skip) ====================
    // VMD の camera/light/shadow/IK は MV1 に対応構造が無いため skip のみ。
    // Camera: 61 byte/key (frame + dist + pos3 + rot3 + interp24 + angle + persp)
    // Light:  28 byte/key (frame + color3 + direction3)
    // Shadow: 9 byte/key  (frame + mode + distance)
    // IKKey:  追加の u32 + 可変 — ファイル末尾までだけ skip で OK
    // 詳細な parse は不要なのでここで終了。

    return r;
}

}
