# アルゴリズム サンプル集 (50+ 実装)

HSP で書かれたアルゴリズム教材。各ファイルは `hsp3cl_net_64.exe` で動く
コンソールデモ。カテゴリ別に 10 ファイル、計 **52 アルゴリズム** を収録。

## ファイル一覧

| # | ファイル | 収録アルゴリズム (5〜6 個/ファイル) |
|---|---|---|
| 01 | `01_string_distance.hsp` | Levenshtein / Hamming / Jaro-Winkler / SoundEx / Bigram Jaccard |
| 02 | `02_string_search.hsp`   | KMP / Boyer-Moore / Rabin-Karp / Z-function / Manacher |
| 03 | `03_sort.hsp`            | QuickSort / MergeSort / HeapSort / RadixSort / CountingSort |
| 04 | `04_search.hsp`          | BinarySearch / TernarySearch / InterpolationSearch / JumpSearch / BFS+DFS |
| 05 | `05_graph.hsp`           | Dijkstra / Bellman-Ford / Floyd-Warshall / Topological Sort / Kruskal |
| 06 | `06_number_theory.hsp`   | GCD / ExtGCD / ModPow / Miller-Rabin / Sieve / Euler Totient |
| 07 | `07_dp.hsp`              | 0/1 Knapsack / Unbounded / LIS / CoinChange / MatrixChain / EditDist |
| 08 | `08_data_structures.hsp` | UnionFind / Fenwick / SegTree / PQ / LRU Cache / Trie |
| 09 | `09_numeric.hsp`         | Newton / Simpson / RK4 / Gauss-Jordan |
| 10 | `10_geometry.hsp`        | ConvexHull / PointInPolygon / LineIntersect / CRC32 / FNV-1a |

## 動作確認済

- `01_string_distance.hsp` — 全 5 アルゴリズム動作確認済。

## 注意事項 (HSP 仕様による制約)

本サンプル集は標準的なアルゴリズム教材として書かれており、一部は HSP 固有の
挙動に合わせた微調整が必要です。HSP 初心者がコピペで即使える状態には
なっていない場合があります。

### 知られている問題点

1. **`str` パラメータへの `peek()` 不可**
   - `#defcfunc f str _a` で受けた `_a` に `peek(_a, i)` は動かない。
     `var _a` に変更し、呼び出し側で `s = "xxx" : f(s)` のように変数経由
     で渡す必要がある。
2. **`break` / `continue` は `if {}` ブロック内から escape できない**
   - HSP では `if X { break }` が repeat/for 外と判定される。
     フラグ変数を立てる方式に書き換えるか、`if X : break`
     (ワンライナー) で回避する。
3. **`for/next` の `break`**
   - `for` は `repeat` のマクロだが nested if との組合わせで誤解される
     ことあり。HSP ネイティブの `repeat ... : _i = cnt + start : loop`
     を使う方が安全。
4. **`else : if` チェーンは `{...}` 区切りが必要**
   - `else : if X : Y` だと error 14。`else { if X : Y }` と書く。
5. **システム予約名との衝突**
   - `line` / `pos` / `default` などは `local` 名に使えない。
     `_line` 等にエスケープ。
6. **`while` は `repeat/loop` 内ネスト時の継続判定で詰まることあり**

詳細は `memory/reference_hsp_module_quirks.md` (HSP3 の罠集) を参照。

## 使い方

```sh
# 1 つだけコンパイル&実行:
hspcmp64 01_string_distance.hsp
hsp3cl_net_64 01_string_distance.ax

# 全部一括コンパイル (Bash):
for f in *.hsp; do
  hspcmp64 "$f"
done
```
