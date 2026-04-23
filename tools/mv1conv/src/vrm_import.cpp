#include "vrm_import.hpp"
#include "mini_json.hpp"
#include <cmath>
#include <cstdio>
#include <cstring>
#include <filesystem>
#include <string>
#include <unordered_map>
#include <vector>

namespace mv1conv {

namespace {

// VRM humanoid name → MMD 日本語 bone 名
const std::unordered_map<std::string, std::string> &mmd_bone_table() {
    static const std::unordered_map<std::string, std::string> m = {
        {"hips", "センター"},       {"spine", "上半身"},
        {"chest", "上半身2"},       {"upperChest", "上半身2"},
        {"neck", "首"},             {"head", "頭"},
        {"leftEye", "左目"},        {"rightEye", "右目"},
        {"jaw", "顎"},
        {"leftShoulder", "左肩"},   {"leftUpperArm", "左腕"},
        {"leftLowerArm", "左ひじ"}, {"leftHand", "左手首"},
        {"rightShoulder", "右肩"},  {"rightUpperArm", "右腕"},
        {"rightLowerArm", "右ひじ"},{"rightHand", "右手首"},
        {"leftUpperLeg", "左足"},   {"leftLowerLeg", "左ひざ"},
        {"leftFoot", "左足首"},     {"leftToes", "左つま先"},
        {"rightUpperLeg", "右足"},  {"rightLowerLeg", "右ひざ"},
        {"rightFoot", "右足首"},    {"rightToes", "右つま先"},
        {"leftThumbProximal","左親指１"},{"leftThumbIntermediate","左親指２"},{"leftThumbDistal","左親指先"},
        {"leftIndexProximal","左人指１"},{"leftIndexIntermediate","左人指２"},{"leftIndexDistal","左人指３"},
        {"leftMiddleProximal","左中指１"},{"leftMiddleIntermediate","左中指２"},{"leftMiddleDistal","左中指３"},
        {"leftRingProximal","左薬指１"},{"leftRingIntermediate","左薬指２"},{"leftRingDistal","左薬指３"},
        {"leftLittleProximal","左小指１"},{"leftLittleIntermediate","左小指２"},{"leftLittleDistal","左小指３"},
        {"rightThumbProximal","右親指１"},{"rightThumbIntermediate","右親指２"},{"rightThumbDistal","右親指先"},
        {"rightIndexProximal","右人指１"},{"rightIndexIntermediate","右人指２"},{"rightIndexDistal","右人指３"},
        {"rightMiddleProximal","右中指１"},{"rightMiddleIntermediate","右中指２"},{"rightMiddleDistal","右中指３"},
        {"rightRingProximal","右薬指１"},{"rightRingIntermediate","右薬指２"},{"rightRingDistal","右薬指３"},
        {"rightLittleProximal","右小指１"},{"rightLittleIntermediate","右小指２"},{"rightLittleDistal","右小指３"},
    };
    return m;
}

// GLB から JSON chunk のみ取り出し
std::string read_glb_json(const std::string &path, std::string &err) {
    std::FILE *fp = std::fopen(path.c_str(), "rb");
    if (!fp) { err = "cannot open: " + path; return {}; }
    std::error_code ec;
    auto sz = std::filesystem::file_size(path, ec);
    if (ec) { std::fclose(fp); err = "file_size fail"; return {}; }
    std::vector<std::uint8_t> all(sz);
    if (std::fread(all.data(), 1, all.size(), fp) != all.size()) { std::fclose(fp); err = "short read"; return {}; }
    std::fclose(fp);
    if (all.size() < 12 || std::memcmp(all.data(), "glTF", 4) != 0) {
        err = "not a GLB"; return {};
    }
    std::uint32_t total;
    std::memcpy(&total, all.data() + 8, 4);
    const std::uint8_t *cp = all.data() + 12;
    const std::uint8_t *cpEnd = all.data() + std::min<std::size_t>(total, all.size());
    while (cp + 8 <= cpEnd) {
        std::uint32_t clen, ctype;
        std::memcpy(&clen,  cp + 0, 4);
        std::memcpy(&ctype, cp + 4, 4);
        cp += 8;
        if (cp + clen > cpEnd) break;
        if (ctype == 0x4E4F534A) {
            return std::string(reinterpret_cast<const char *>(cp), clen);
        }
        cp += clen;
    }
    err = "no JSON chunk"; return {};
}

}  // anon

LoadResult apply_vrm_extensions(const std::string &vrm_path, const ModelIR &in_model,
                                bool mmd_names) {
    LoadResult r;
    r.ir = in_model;

    std::string err;
    std::string jsonStr = read_glb_json(vrm_path, err);
    if (jsonStr.empty()) return r;  // 通常 GLB でも通るので非エラー

    std::string jerr;
    auto root = json::parse(jsonStr.data(), jsonStr.size(), jerr);
    if (!root.is_object()) return r;

    const auto &extensions = root["extensions"];
    if (!extensions.is_object()) return r;

    int renamed = 0, toonApplied = 0;
    auto applyBoneMap = [&](const std::string &nodeName, const std::string &humanoidName) {
        const auto &tbl = mmd_bone_table();
        auto it = tbl.find(humanoidName);
        std::string dst = (mmd_names && it != tbl.end()) ? it->second : humanoidName;
        for (auto &b : r.ir.bones) {
            if (b.name == nodeName) { b.name = dst; ++renamed; break; }
        }
    };

    // node 名取得ヘルパ
    const auto &nodes = root["nodes"];
    auto nodeName = [&](int idx) -> std::string {
        if (!nodes.is_array() || idx < 0 || idx >= static_cast<int>(nodes.size())) return {};
        const auto &n = nodes[static_cast<std::size_t>(idx)];
        if (!n.is_object()) return {};
        return n["name"].as_string();
    };

    // ---- VRM 0.x: humanoid.humanBones[] ----
    const auto &vrm0 = extensions["VRM"];
    if (vrm0.is_object()) {
        const auto &hbs = vrm0["humanoid"]["humanBones"];
        if (hbs.is_array()) {
            for (std::size_t i = 0; i < hbs.size(); ++i) {
                const auto &hb = hbs[i];
                if (!hb.is_object()) continue;
                std::string boneName = hb["bone"].as_string();
                int nodeIdx = static_cast<int>(hb["node"].as_number(-1));
                std::string nName = nodeName(nodeIdx);
                if (!boneName.empty() && !nName.empty()) applyBoneMap(nName, boneName);
            }
        }
        // MToon materialProperties
        const auto &mats = vrm0["materialProperties"];
        if (mats.is_array()) {
            for (std::size_t i = 0; i < mats.size() && i < r.ir.materials.size(); ++i) {
                const auto &mp = mats[i];
                if (!mp.is_object()) continue;
                if (mp["shader"].as_string().find("MToon") == std::string::npos) continue;
                auto &mat = r.ir.materials[i];
                mat.is_toon = true;
                const auto &vec = mp["vectorProperties"];
                if (vec.is_object()) {
                    const auto &oc = vec["_OutlineColor"];
                    if (oc.is_array() && oc.size() >= 4) {
                        mat.toon_outline_color = {
                            static_cast<float>(oc[0].as_number()),
                            static_cast<float>(oc[1].as_number()),
                            static_cast<float>(oc[2].as_number()),
                            static_cast<float>(oc[3].as_number()),
                        };
                    }
                }
                const auto &flo = mp["floatProperties"];
                if (flo.is_object()) {
                    double ow = flo["_OutlineWidth"].as_number();
                    if (ow != 0) mat.toon_outline_width = static_cast<float>(ow);
                }
                ++toonApplied;
            }
        }
    }

    // ---- VRM 1.0 (VRMC_vrm): humanoid.humanBones is object {name: {node: N}, ...} ----
    const auto &vrm1 = extensions["VRMC_vrm"];
    if (vrm1.is_object()) {
        const auto &hbs = vrm1["humanoid"]["humanBones"];
        if (hbs.is_object()) {
            for (const auto &[humanoidName, ent] : hbs.obj()) {
                if (!ent.is_object()) continue;
                int nodeIdx = static_cast<int>(ent["node"].as_number(-1));
                std::string nName = nodeName(nodeIdx);
                if (!nName.empty()) applyBoneMap(nName, humanoidName);
            }
        }
    }

    // ---- VRM 1.0 MToon (VRMC_materials_mtoon): material ごとの拡張 ----
    // glTF では materials[].extensions.VRMC_materials_mtoon で参照
    const auto &mats = root["materials"];
    if (mats.is_array()) {
        for (std::size_t i = 0; i < mats.size() && i < r.ir.materials.size(); ++i) {
            const auto &mj = mats[i];
            if (!mj.is_object()) continue;
            const auto &mext = mj["extensions"]["VRMC_materials_mtoon"];
            if (!mext.is_object()) continue;
            auto &mat = r.ir.materials[i];
            mat.is_toon = true;
            const auto &ow = mext["outlineWidthFactor"];
            if (ow.is_number()) mat.toon_outline_width = static_cast<float>(ow.as_number());
            const auto &oc = mext["outlineColorFactor"];
            if (oc.is_array() && oc.size() >= 3) {
                mat.toon_outline_color = {
                    static_cast<float>(oc[0].as_number()),
                    static_cast<float>(oc[1].as_number()),
                    static_cast<float>(oc[2].as_number()),
                    1.0f,
                };
            }
            ++toonApplied;
        }
    }

    // ---- VRM 0.x / 1.0 共通: _MainTex / baseColorTexture を diffuse に上書き ----
    // assimp の glTF loader は MToon 拡張がある material で、本来の _MainTex ではなく
    // _ShadeTexture (shadeMultiplyTexture、影色テクスチャ) を aiTextureType_DIFFUSE に
    // 入れてしまう。結果、mat.diffuse_texture が影色テクスチャを指す。
    // VRM の本来の main texture を明示的に解決して上書きする。
    int diffuseFixed = 0;
    {
        // glTF textures[]: texIdx → imageIdx
        const auto &gtex = root["textures"];
        std::vector<int> texToImg;
        if (gtex.is_array()) {
            texToImg.assign(gtex.size(), -1);
            for (std::size_t i = 0; i < gtex.size(); ++i) {
                const auto &t = gtex[i];
                if (t.is_object()) texToImg[i] = static_cast<int>(t["source"].as_number(-1));
            }
        }
        // imageIdx → IR texture index (embedded_tex_{N}.<ext> で prefix 一致)
        auto imgToIR = [&](int imageIdx) -> int {
            if (imageIdx < 0) return -1;
            std::string prefix = "embedded_tex_" + std::to_string(imageIdx) + ".";
            for (std::size_t i = 0; i < r.ir.textures.size(); ++i) {
                const auto &p = r.ir.textures[i].color_path;
                if (p.size() > prefix.size() && p.compare(0, prefix.size(), prefix) == 0)
                    return static_cast<int>(i);
            }
            return -1;
        };
        auto gtfTexToIR = [&](int gtfTexIdx) -> int {
            if (gtfTexIdx < 0 || gtfTexIdx >= static_cast<int>(texToImg.size())) return -1;
            return imgToIR(texToImg[gtfTexIdx]);
        };

        // VRM 0.x: extensions.VRM.materialProperties[i].textureProperties._MainTex
        if (vrm0.is_object()) {
            const auto &mps = vrm0["materialProperties"];
            if (mps.is_array()) {
                for (std::size_t i = 0; i < mps.size() && i < r.ir.materials.size(); ++i) {
                    const auto &mp = mps[i];
                    if (!mp.is_object()) continue;
                    const auto &tp = mp["textureProperties"];
                    if (!tp.is_object()) continue;
                    const auto &mainTex = tp["_MainTex"];
                    if (!mainTex.is_number()) continue;
                    int irIdx = gtfTexToIR(static_cast<int>(mainTex.as_number(-1)));
                    if (irIdx >= 0) {
                        r.ir.materials[i].diffuse_texture = irIdx;
                        ++diffuseFixed;
                    }
                }
            }
        }

        // VRM 1.0: MToon 拡張付き material のみ、pbrMetallicRoughness.baseColorTexture.index
        const auto &gmats = root["materials"];
        if (gmats.is_array()) {
            for (std::size_t i = 0; i < gmats.size() && i < r.ir.materials.size(); ++i) {
                const auto &mj = gmats[i];
                if (!mj.is_object()) continue;
                const auto &mtoon = mj["extensions"]["VRMC_materials_mtoon"];
                if (!mtoon.is_object()) continue;
                const auto &bct = mj["pbrMetallicRoughness"]["baseColorTexture"];
                if (!bct.is_object()) continue;
                int irIdx = gtfTexToIR(static_cast<int>(bct["index"].as_number(-1)));
                if (irIdx >= 0) {
                    r.ir.materials[i].diffuse_texture = irIdx;
                    ++diffuseFixed;
                }
            }
        }
    }

    // ---- VRM 1.0 SpringBone (VRMC_springBone): 髪/スカート揺れ物理 ----
    // MV1 の Physics (RigidBody + Joint) に部分変換。
    // VRM の SpringBone は "colliderGroup" と "spring" 配列で構成され、
    // 各 spring は joints[].node (node index) を辿ってチェーン構造を成す。
    // 最小実装: 各 spring joint node を RigidBody (球形) として追加し、
    // 連続 node 間に Joint を作る。パラメータは SpringBone 側から取れるだけ取る。
    const auto &vrm1sb = extensions["VRMC_springBone"];
    if (vrm1sb.is_object()) {
        const auto &springs = vrm1sb["springs"];
        if (springs.is_array() && !r.ir.bones.empty()) {
            // ---- Colliders (固定球/カプセル) を先に RigidBody として登録 ----
            // colliders[]: {shape:{sphere:{offset,radius} | capsule:{offset,tail,radius}}, node: N}
            std::unordered_map<int, int> colliderIdxToRb;
            std::unordered_map<std::string, int> boneIdxByName;
            for (std::size_t bi = 0; bi < r.ir.bones.size(); ++bi)
                boneIdxByName[r.ir.bones[bi].name] = static_cast<int>(bi);

            const auto &colliders = vrm1sb["colliders"];
            if (colliders.is_array()) {
                for (std::size_t ci = 0; ci < colliders.size(); ++ci) {
                    const auto &cd = colliders[ci];
                    if (!cd.is_object()) continue;
                    int nodeIdx = static_cast<int>(cd["node"].as_number(-1));
                    std::string nName = nodeName(nodeIdx);
                    auto it = boneIdxByName.find(nName);
                    if (it == boneIdxByName.end()) continue;

                    const auto &shape = cd["shape"];
                    ModelIR::PhysicsRigidBodyIR rb;
                    rb.name = "collider_" + std::to_string(ci) + "_" + nName;
                    rb.target_bone = it->second;
                    rb.body_type = 0;  // bone 追従 (衝突のみ、動かない)
                    if (shape["sphere"].is_object()) {
                        const auto &sph = shape["sphere"];
                        rb.shape_type = 0;  // sphere
                        rb.shape_w = static_cast<float>(sph["radius"].as_number(0.1));
                        const auto &off = sph["offset"];
                        if (off.is_array() && off.size() >= 3) {
                            rb.position[0] = static_cast<float>(off[0].as_number());
                            rb.position[1] = static_cast<float>(off[1].as_number());
                            rb.position[2] = static_cast<float>(off[2].as_number());
                        }
                    } else if (shape["capsule"].is_object()) {
                        const auto &cap = shape["capsule"];
                        rb.shape_type = 2;  // capsule
                        rb.shape_w = static_cast<float>(cap["radius"].as_number(0.1));
                        const auto &off = cap["offset"];
                        const auto &tail = cap["tail"];
                        if (off.is_array() && tail.is_array() && off.size() >= 3 && tail.size() >= 3) {
                            rb.position[0] = static_cast<float>(off[0].as_number());
                            rb.position[1] = static_cast<float>(off[1].as_number());
                            rb.position[2] = static_cast<float>(off[2].as_number());
                            // capsule 高さ = tail - offset の距離
                            float dx = static_cast<float>(tail[0].as_number()) - rb.position[0];
                            float dy = static_cast<float>(tail[1].as_number()) - rb.position[1];
                            float dz = static_cast<float>(tail[2].as_number()) - rb.position[2];
                            rb.shape_h = std::sqrt(dx*dx + dy*dy + dz*dz);
                        }
                    } else {
                        rb.shape_type = 0; rb.shape_w = 0.1f;
                    }
                    colliderIdxToRb[static_cast<int>(ci)] = static_cast<int>(r.ir.physics_rigid_bodies.size());
                    r.ir.physics_rigid_bodies.push_back(std::move(rb));
                }
            }

            int springRbAdded = 0;
            for (std::size_t si = 0; si < springs.size(); ++si) {
                const auto &sp = springs[si];
                if (!sp.is_object()) continue;
                const auto &joints = sp["joints"];
                if (!joints.is_array()) continue;

                // center: spring 全体の基準 bone (optional)
                int centerBone = -1;
                if (sp["center"].is_number()) {
                    int nodeIdx = static_cast<int>(sp["center"].as_number(-1));
                    std::string nName = nodeName(nodeIdx);
                    auto it = boneIdxByName.find(nName);
                    if (it != boneIdxByName.end()) centerBone = it->second;
                }
                (void)centerBone;  // MV1 には直接対応無し

                std::vector<int> chainRb;
                for (std::size_t ji = 0; ji < joints.size(); ++ji) {
                    const auto &jnt = joints[ji];
                    if (!jnt.is_object()) continue;
                    int nodeIdx = static_cast<int>(jnt["node"].as_number(-1));
                    std::string nName = nodeName(nodeIdx);
                    auto it = boneIdxByName.find(nName);
                    if (it == boneIdxByName.end()) continue;

                    ModelIR::PhysicsRigidBodyIR rb;
                    rb.name = "spring_" + nName;
                    rb.target_bone = it->second;
                    rb.shape_type = 0;  // sphere
                    rb.shape_w = static_cast<float>(jnt["hitRadius"].as_number(0.1));
                    rb.weight = static_cast<float>(jnt["dragForce"].as_number(0.5));
                    rb.pos_dim = static_cast<float>(jnt["gravityPower"].as_number(0.0));
                    // stiffness を friction に格納 (近似)
                    rb.friction = static_cast<float>(jnt["stiffness"].as_number(1.0));
                    rb.body_type = 1;  // 物理
                    int rbIdx = static_cast<int>(r.ir.physics_rigid_bodies.size());
                    r.ir.physics_rigid_bodies.push_back(std::move(rb));
                    chainRb.push_back(rbIdx);
                    ++springRbAdded;
                }
                // chain 内で連続 pair に Joint を生成
                for (std::size_t k = 0; k + 1 < chainRb.size(); ++k) {
                    ModelIR::PhysicsJointIR jt;
                    jt.name = "spring_joint_" + std::to_string(si) + "_" + std::to_string(k);
                    jt.rigid_a = chainRb[k];
                    jt.rigid_b = chainRb[k + 1];
                    r.ir.physics_joints.push_back(std::move(jt));
                }
                // colliderGroups で参照される collider との干渉 joint (skip、
                // MV1 Joint は pair base で spring/constrain 情報が足りない)
            }
            if (springRbAdded > 0 || !colliderIdxToRb.empty()) {
                std::fprintf(stderr,
                    "VRM SpringBone: %zu colliders + %d spring joints RB, %zu joints\n",
                    colliderIdxToRb.size(), springRbAdded, r.ir.physics_joints.size());
            }
        }
    }

    if (renamed > 0 || toonApplied > 0 || diffuseFixed > 0) {
        std::fprintf(stderr,
            "VRM: %d bones renamed, %d MToon materials applied, %d diffuse textures fixed\n",
            renamed, toonApplied, diffuseFixed);
    }
    return r;
}

}
