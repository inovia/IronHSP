# アルゴリズム サンプル集 (全 50 本、動作確認済)

HSP で書かれたアルゴリズム教材。全ファイルが `hsp3cl_net_64.exe` /
`hsp3cl_net_test_64.exe` で動作確認済。

サンプル配置: [`package/win32/sample/algorithms/`](../package/win32/sample/algorithms/)

## ファイル一覧 (計 50 アルゴリズム / 10 ファイル)

| # | ファイル | 収録アルゴリズム (各 5 個) |
|---|---|---|
| 01 | `01_string_distance.hsp` | Levenshtein / Hamming / Jaro-Winkler / SoundEx / Bigram Jaccard |
| 02 | `02_string_search.hsp`   | Naive / KMP / Boyer-Moore / Rabin-Karp / StrReverse |
| 03 | `03_sort.hsp`            | QuickSort / MergeSort / HeapSort / RadixSort / CountingSort |
| 04 | `04_search.hsp`          | BinarySearch / TernarySearch / InterpolationSearch / JumpSearch / BFS+DFS |
| 05 | `05_graph.hsp`           | Dijkstra / Bellman-Ford / Floyd-Warshall / Kruskal+UF / TopoSort |
| 06 | `06_number_theory.hsp`   | GCD+LCM / ExtEuclidean+ModInv / ModPow / Sieve / EulerPhi |
| 07 | `07_dp.hsp`              | 0/1 Knapsack / UnboundedKnapsack / LIS / CoinChange / EditDistance+Trace |
| 08 | `08_data_structures.hsp` | UnionFind / FenwickTree / PriorityQueue / Stack / Queue |
| 09 | `09_numeric.hsp`         | Newton 法 / Simpson積分 / RK4 / Gauss-Jordan |
| 10 | `10_geometry.hsp`        | PointInPolygon / SegIntersect / TriangleArea / CRC32 / FNV-1a |

## 動作確認

全 10 ファイルを `hspcmp64 *.hsp && hsp3cl_net_test_64 *.ax` で実行し、
期待値どおりの出力を確認済 (2026-04-19)。

## 使い方

```sh
# 個別実行
hspcmp64 01_string_distance.hsp
hsp3cl_net_test_64 01_string_distance.ax

# 全部一括実行 (Bash)
for f in *.hsp; do
  hspcmp64 "$f" && hsp3cl_net_test_64 "${f%.hsp}.ax"
done
```

## 実装時に踏んだ HSP 固有の罠

詳細は `memory/reference_hsp_module_quirks.md` を参照。本サンプル集作成中に
発見した主なポイント:

1. **`str` パラメータに `peek()` 不可** — `var _a` に変更 + 呼び出し側で
   変数経由 (`s = "x" : f(s)`)
2. **`break` / `continue` は `if {}` ブロックからは escape できない** —
   インライン形式 `if X : break` を使うか、フラグ変数で回避
3. **HSP 予約名** — `line` / `pos` / `default` / `_f` / `_r` / `rank`
   (関数) 等は `local` 名に使えない。`_` プレフィックス推奨
4. **`else : if` 連鎖は NG** — `if X : Y : else : Z` または
   `if X { Y } else { Z }` 形式のみ
5. **`mes strf(...)` を複数行に分割不可** — 1 行に収めるか変数経由
6. **`#defcfunc` は関数呼び出し形式のみ** — `f x, y, z` (command) は NG、
   `r = f(x, y, z)` (function) にする必要あり
7. **`for/next` の `break`** — 安全には `repeat/loop` + `cnt + start` で
   代用
