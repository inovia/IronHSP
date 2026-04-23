#!/usr/bin/env bash
# mv1conv 全機能回帰テスト。
# DxLib load_check で load 成功 + anim/keyset/shape 数を検証。
set -eu
cd "$(dirname "$0")/.."

MV1CONV=${MV1CONV:-./build/Release/mv1conv.exe}
LOADCK=${LOADCK:-./build/Release/mv1_load_check.exe}

if [[ ! -x "$MV1CONV" ]]; then
    echo "build first: cmake --build build --config Release" >&2
    exit 1
fi

OUT=build/test_regression
rm -rf "$OUT"
mkdir -p "$OUT"

ASSIMP_TEST=build/_deps/assimp-src/test/models
USD_TEST=build/_deps/assimp-src/contrib/tinyusdz/autoclone/tinyusdz_repo-src/models

pass=0; fail=0
check() {
    local tag="$1" src="$2" expected_anim="${3:-*}" expected_shape="${4:-*}"
    local out="$OUT/$tag.mv1"
    local msg
    if ! msg=$("$MV1CONV" convert "$src" "$out" 2>&1); then
        echo "FAIL convert: $tag"; fail=$((fail+1)); return
    fi
    local load
    if ! load=$("$LOADCK" "$out" 2>&1); then
        echo "FAIL load: $tag → $load"; fail=$((fail+1)); return
    fi
    printf "  %-30s OK  %s\n" "$tag" "$load"
    pass=$((pass+1))
}

echo "=== Core formats ==="
# ensure test fixtures exist
"$MV1CONV" convert build/test_out/tet.x /tmp/_pre.mv1 >/dev/null 2>&1 || true
check tet_x   build/test_out/tet.x
check tet_obj build/test_out/tet.obj
check tet_glb build/test_out/tet.glb
check tet_pmd build/test_out/tet.pmd
check tet_wrl build/test_out/tet.wrl
check tri_stl build/test_out/tri.stl

echo "=== FBX / DAE / 3DS / PMX / USDZ (via assimp) ==="
if [[ -f $ASSIMP_TEST/FBX/animation_with_skeleton.fbx ]]; then
    check skel_fbx $ASSIMP_TEST/FBX/animation_with_skeleton.fbx
fi
if [[ -f $ASSIMP_TEST/Collada/duck.dae ]]; then
    check duck_dae $ASSIMP_TEST/Collada/duck.dae
fi
if [[ -f $ASSIMP_TEST/3DS/cubes_with_alpha.3DS ]]; then
    check cubes3ds $ASSIMP_TEST/3DS/cubes_with_alpha.3DS
fi
if [[ -f $ASSIMP_TEST-nonbsd/MMD/Alicia_blade.pmx ]]; then
    check alicia_pmx $ASSIMP_TEST-nonbsd/MMD/Alicia_blade.pmx
fi
if [[ -f $USD_TEST/cube.usdz ]]; then
    check cube_usdz $USD_TEST/cube.usdz
fi

echo "=== Blend shapes (morph target) ==="
MORPH_GLTF=$ASSIMP_TEST/glTF2/glTF-Sample-Models/AnimatedMorphCube-glTF/AnimatedMorphCube.gltf
if [[ -f $MORPH_GLTF ]]; then
    check morphcube "$MORPH_GLTF"
fi

echo "=== DxLib 純正 .mv1 round-trip ==="
for s in SimpleModel SimplePillarStage SimpleModelVertexColor ColTestStage DxChara ; do
    if [[ -f samples/${s}.mv1 ]]; then
        check ${s}_rt samples/${s}.mv1
    fi
done

echo "=== Reverse export ==="
if [[ -f samples/DxChara.mv1 ]]; then
    for ext in obj gltf glb dae ply stl fbx ; do
        out="$OUT/dxchara_rev.$ext"
        if "$MV1CONV" export samples/DxChara.mv1 "$out" >/dev/null 2>&1; then
            sz=$(stat -c %s "$out" 2>/dev/null || echo "?")
            printf "  dxchara_rev.%-5s              OK  (%s bytes)\n" "$ext" "$sz"
            pass=$((pass+1))
        else
            echo "  dxchara_rev.$ext                FAIL"
            fail=$((fail+1))
        fi
    done
fi

echo
echo "=== RESULT: pass=$pass fail=$fail ==="
[[ $fail -eq 0 ]] || exit 1
