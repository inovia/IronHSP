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

echo "=== 4. External formats (STL / PLY) → .mv1 → dump ==="
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

"$MV1CONV" convert "$OUT/tri.stl"  "$OUT/tri.mv1"  2>&1 | grep "re-load OK"
"$MV1CONV" convert "$OUT/quad.ply" "$OUT/quad.mv1" 2>&1 | grep "re-load OK"

echo ""
echo "ALL TESTS PASSED"
