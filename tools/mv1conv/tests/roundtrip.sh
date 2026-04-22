#!/usr/bin/env bash
# mv1conv の end-to-end round-trip テスト。
#   1. sample .mv1 → .obj (reader)
#   2. .obj → .mv1 (writer)
#   3. 出来た .mv1 を dump して TriangleNum を検証
#   4. repack で byte-identical 往復
set -eu
cd "$(dirname "$0")/.."

MV1CONV=${MV1CONV:-./build/Release/mv1conv.exe}

if [[ ! -x "$MV1CONV" ]]; then
    echo "build first: cmake --build build --config Release" >&2
    exit 1
fi

OUT=build/test_out
mkdir -p "$OUT"

echo "=== 1. Sample .mv1 reader pass ==="
for mv1 in samples/*.mv1; do
    name=$(basename "$mv1" .mv1)
    tri=$("$MV1CONV" dump "$mv1" | grep "TriangleNum " | awk '{print $3}')
    printf "  %-28s tri=%s\n" "$name" "$tri"
done

echo "=== 2. Static mesh MV1 → OBJ → MV1 round-trip ==="
for name in SimpleModel SimplePillarStage SimpleModelVertexColor ColTestStage; do
    mv1=samples/${name}.mv1
    obj=$OUT/${name}.obj
    rebuilt=$OUT/${name}.rebuilt.mv1
    "$MV1CONV" obj "$mv1" "$obj" >/dev/null
    orig_tri=$(grep -c '^f ' "$obj")
    "$MV1CONV" from-obj "$obj" "$rebuilt" 2>&1 | grep "re-load OK"
    built_tri=$("$MV1CONV" dump "$rebuilt" | grep "TriangleNum " | awk '{print $3}')
    if [[ "$orig_tri" == "$built_tri" ]]; then
        printf "  %-28s OK (%s tri)\n" "$name" "$orig_tri"
    else
        printf "  %-28s FAIL: obj %s vs rebuilt %s\n" "$name" "$orig_tri" "$built_tri" >&2
        exit 1
    fi
done

echo "=== 3. DXA repack byte-identical (all 5 samples) ==="
for mv1 in samples/*.mv1; do
    name=$(basename "$mv1" .mv1)
    repacked=$OUT/${name}.repack.mv1
    if "$MV1CONV" repack "$mv1" "$repacked" 2>&1 | grep -q "round-trip byte-identical"; then
        printf "  %-28s OK\n" "$name"
    else
        printf "  %-28s FAIL\n" "$name" >&2
        exit 1
    fi
done

echo "=== 4. External formats → .mv1 ==="

# OBJ (4 面体)
cat >"$OUT/tet.obj" <<'EOF'
v 0 0 0
v 1 0 0
v 0 1 0
v 0 0 1
f 1 2 3
f 1 2 4
f 1 3 4
f 2 3 4
EOF

# STL ASCII (三角形 1 枚)
cat >"$OUT/tri.stl" <<'EOF'
solid tri
facet normal 0 1 0
  outer loop
    vertex 0 0 0
    vertex 1 0 0
    vertex 0 0 1
  endloop
endfacet
endsolid tri
EOF

# PLY ASCII (矩形 2 triangle)
cat >"$OUT/quad.ply" <<'EOF'
ply
format ascii 1.0
element vertex 4
property float x
property float y
property float z
element face 2
property list uchar int vertex_indices
end_header
0 0 0
1 0 0
1 1 0
0 1 0
3 0 1 2
3 0 2 3
EOF

# X ASCII (4 面体)
cat >"$OUT/tet.x" <<'EOF'
xof 0303txt 0032
Mesh {
    4;
    0.0;0.0;0.0;,
    1.0;0.0;0.0;,
    0.0;1.0;0.0;,
    0.0;0.0;1.0;;
    4;
    3;0,1,2;,
    3;0,1,3;,
    3;0,2,3;,
    3;1,2,3;;
}
EOF

# GLB 生成 (Python)
python - <<'PY'
import struct, json
positions = [(0,0,0),(1,0,0),(0,1,0),(0,0,1)]
indices = [0,1,2, 0,1,3, 0,2,3, 1,2,3]
pos_bytes = b''.join(struct.pack('<fff', *p) for p in positions)
idx_bytes = b''.join(struct.pack('<H', i) for i in indices)
pad = (4 - len(idx_bytes) % 4) % 4
bin_data = pos_bytes + idx_bytes + b'\x00'*pad
gltf = {
  "asset": {"version":"2.0"}, "scene":0, "scenes":[{"nodes":[0]}], "nodes":[{"mesh":0}],
  "meshes":[{"primitives":[{"attributes":{"POSITION":0},"indices":1}]}],
  "accessors":[
    {"bufferView":0,"componentType":5126,"count":4,"type":"VEC3"},
    {"bufferView":1,"componentType":5123,"count":12,"type":"SCALAR"}],
  "bufferViews":[
    {"buffer":0,"byteOffset":0,"byteLength":len(pos_bytes)},
    {"buffer":0,"byteOffset":len(pos_bytes),"byteLength":len(idx_bytes)}],
  "buffers":[{"byteLength":len(bin_data)}]
}
js = json.dumps(gltf, separators=(',',':'))
js += ' '*((4-len(js)%4)%4)
jb = js.encode('utf-8')
total = 12 + 8 + len(jb) + 8 + len(bin_data)
with open(r'build/test_out/tet.glb','wb') as f:
    f.write(b'glTF' + struct.pack('<II',2,total))
    f.write(struct.pack('<I', len(jb)) + b'JSON' + jb)
    f.write(struct.pack('<I', len(bin_data)) + b'BIN\x00' + bin_data)
PY

# VRML (4 面体)
cat >"$OUT/tet.wrl" <<'EOF'
#VRML V2.0 utf8
Shape {
  geometry IndexedFaceSet {
    coord Coordinate {
      point [ 0 0 0, 1 0 0, 0 1 0, 0 0 1 ]
    }
    coordIndex [ 0 1 2 -1  0 1 3 -1  0 2 3 -1  1 2 3 -1 ]
  }
}
EOF

# PMD (Python で生成)
python - <<'PY'
import struct
out = bytearray()
out += b'Pmd' + struct.pack('<f', 1.0)
out += b'test'.ljust(20, b'\x00') + b'c'.ljust(256, b'\x00')
out += struct.pack('<I', 4)
for pos in [(0,0,0),(1,0,0),(0,1,0),(0,0,1)]:
    out += struct.pack('<fff', *pos) + struct.pack('<fff', 0,1,0) + struct.pack('<ff', 0,0)
    out += struct.pack('<HH', 0,0) + struct.pack('<B', 100) + struct.pack('<B', 0)
out += struct.pack('<I', 12)
for i in [0,1,2, 0,1,3, 0,2,3, 1,2,3]: out += struct.pack('<H', i)
out += struct.pack('<I', 1)
out += struct.pack('<fff', 0.8,0.3,0.1) + struct.pack('<f', 1.0) + struct.pack('<f', 25.0)
out += struct.pack('<fff', 0.2,0.2,0.2) + struct.pack('<fff', 0.1,0.1,0.1)
out += struct.pack('<B', 255) + struct.pack('<B', 0) + struct.pack('<I', 12) + b'\x00'*20
with open('build/test_out/tet.pmd','wb') as f: f.write(out)
PY

# assimp path: 組込されていればテスト FBX / DAE / 3DS / 3MF も通す
ASSIMP_TEST_ROOT=build/_deps/assimp-src/test/models
if [[ -d "$ASSIMP_TEST_ROOT" ]]; then
    echo ""
    echo "=== 5. assimp-backed formats → .mv1 ==="
    # それぞれ assimp テストモデルを 1 つだけ試す (shared build 既存のもの)
    for pair in \
        "FBX/animation_with_skeleton.fbx:fbx1" \
        "Collada/duck.dae:dae1" \
        "3DS/cubes_with_alpha.3DS:3ds1"; do
        src="${pair%%:*}"
        tag="${pair##*:}"
        if [[ -f "$ASSIMP_TEST_ROOT/$src" ]]; then
            out="$OUT/${tag}.mv1"
            if "$MV1CONV" convert "$ASSIMP_TEST_ROOT/$src" "$out" 2>&1 | grep -q "re-load OK"; then
                tri=$("$MV1CONV" dump "$out" | grep "TriangleNum " | awk '{print $3}')
                printf "  %-45s → %s (tri=%s)\n" "$src" "$(basename "$out")" "$tri"
            else
                printf "  %-45s FAIL\n" "$src" >&2
            fi
        fi
    done
fi

# GPB (hgimg4 サンプル、5 ファイル)
GPB_ROOT=../../package/win32/sample/hgimg4/res
if [[ -d "$GPB_ROOT" ]]; then
    echo ""
    echo "=== 6. GPB (GamePlay Binary) → .mv1 ==="
    for g in duck sphaceship tamane tamane2; do
        src="$GPB_ROOT/${g}.gpb"
        if [[ -f "$src" ]]; then
            out="$OUT/${g}_from_gpb.mv1"
            if "$MV1CONV" convert "$src" "$out" 2>&1 | grep -q "re-load OK"; then
                tri=$("$MV1CONV" dump "$out" | grep "TriangleNum " | awk '{print $3}')
                printf "  %-20s → %s (tri=%s)\n" "${g}.gpb" "$(basename "$out")" "$tri"
            else
                printf "  %-20s FAIL\n" "${g}.gpb" >&2
                exit 1
            fi
        fi
    done
fi

for fmt in tet.obj tri.stl quad.ply tet.x tet.glb tet.wrl tet.pmd; do
    out=$OUT/${fmt%.*}_from_${fmt##*.}.mv1
    if "$MV1CONV" convert "$OUT/$fmt" "$out" 2>&1 | grep -q "re-load OK"; then
        tri=$("$MV1CONV" dump "$out" | grep "TriangleNum " | awk '{print $3}')
        printf "  %-24s → %s (tri=%s)\n" "$fmt" "$(basename "$out")" "$tri"
    else
        printf "  %-24s FAIL\n" "$fmt" >&2
        exit 1
    fi
done

echo ""
echo "ALL TESTS PASSED"
