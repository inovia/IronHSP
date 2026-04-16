;
; iron_simd.hsp  HSP3 ヘルプ (日本語)
; SSE/AVX SIMD 配列演算プラグイン
;

%type
拡張命令
%ver
3.8
%date
2026/04/18
%author
IronHSP
%dll
iron_simd.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_simd.hsp は hspsimd.dll を介して、HSP の int / double / float 配列に対し
SSE / AVX / AVX2 SIMD 命令による高速な一括演算を提供します。

  #include "iron_simd.hsp"

[SIMD とは]
SIMD (Single Instruction, Multiple Data) は 1 命令で複数データを同時処理する
CPU 拡張機能です。SSE2 (128bit) は double を 2 個ずつ、AVX/AVX2 (256bit) は
double を 4 個ずつ、float を 8 個ずつ、int32 を 8 個ずつ並列計算します。
1000000 要素のループでも、AVX2 では理論上約 4 倍 (double) / 8 倍 (float) の
スループットが得られます。

[CPU 機能検出]
ロード時に CPUID + XGETBV で利用可能な命令セットを検出し、
AVX2 > SSE2 > scalar の順で最適な実装を自動選択します。iron_simd_features
で現在の CPU が対応している機能文字列を取得できます。

[引数の渡し方]
配列ポインタは HSP の varptr() によりプラグインに渡されます。
  ddim a, n          (double 配列)
  dim  a, n          (int 配列)
  sdim a, 4 * n      (float 配列; バイト列として 4*n バイト確保)
iron_simd_* 命令は array 引数を受け取り内部で varptr() を呼ぶので、
利用側は通常の配列変数をそのまま渡せば OK です。

[非整列アクセス]
すべての load/store は loadu/storeu を使い、16/32 バイト整列を要求しません。
したがって HSP のヒープアロケータから返される任意のアドレスで安全です。

[対応 CPU]
  SSE2   : 2001 年以降の全 x86-64 CPU が必須で対応
  AVX    : Intel Sandy Bridge (2011), AMD Bulldozer (2011) 以降
  AVX2   : Intel Haswell (2013), AMD Excavator (2015) / Zen (2017) 以降
  AVX512 : Intel Skylake-X (2017) / Ice Lake 以降 (対応命令は未使用)

%group
iron_simd (SIMD配列演算)

;============================================================
;  CPU 機能検出
;============================================================

%index
iron_simd_has_sse
SSE 対応判定
%group
iron_simd - CPU機能
%inst
SSE 命令セットを CPU が対応しているか返します。
x86-64 CPU では事実上常に 1。
stat = 1 なら対応、0 なら非対応。

%index
iron_simd_has_sse2
SSE2 対応判定
%group
iron_simd - CPU機能
%inst
SSE2 命令セットを CPU が対応しているか返します。
x64 プロセッサでは常に 1。stat=1 で対応。

%index
iron_simd_has_avx
AVX 対応判定
%group
iron_simd - CPU機能
%inst
AVX (256bit 浮動小数点 SIMD) 対応判定。OS レベルの YMM レジスタ
保存対応も XGETBV で確認済み。stat=1 なら AVX 実装を使用します。

%index
iron_simd_has_avx2
AVX2 対応判定
%group
iron_simd - CPU機能
%inst
AVX2 (256bit 整数 SIMD) 対応判定。
int 配列系の演算は AVX2 があるとフル速度で動作します。
stat=1 で対応。

%index
iron_simd_has_avx512
AVX-512 対応判定
%group
iron_simd - CPU機能
%inst
AVX-512 Foundation + OS ZMM 対応判定 (将来拡張用)。
現バージョンの hspsimd.dll は AVX-512 専用コードは持ちませんが、
情報取得のために提供されています。

%index
iron_simd_cpu_name
CPU ブランド文字列の取得
%group
iron_simd - CPU機能
%prm
name
name : 受け取る文字列変数
%inst
CPUID の拡張ブランド文字列を取得します (例: "Intel(R) Core(TM)
i7-12700K CPU @ 3.60GHz")。
内部で 128 バイトの sdim を行い CPU 名を格納します。

例:
  iron_simd_cpu_name cpu
  mes "CPU: " + cpu

%index
iron_simd_features
対応 SIMD 機能の文字列取得
%group
iron_simd - CPU機能
%prm
out
out : 受け取る文字列変数
%inst
対応している SIMD 機能をスペース区切りの文字列で取得します。
例: "SSE SSE2 AVX AVX2 "

例:
  iron_simd_features feat
  mes "SIMD: " + feat

;============================================================
;  double 配列演算
;============================================================

%index
iron_simd_add_d
double 配列の要素加算
%group
iron_simd - double配列
%prm
a, b, out, n
a, b : 入力 double 配列 (ddim)
out  : 出力 double 配列 (ddim)
n    : 要素数
%inst
out(i) = a(i) + b(i) を n 個まとめて計算します。
AVX があれば 4 個ずつ、SSE2 のみなら 2 個ずつ並列処理し、
残りはスカラで埋めます。in-place (a と out 同一) も可能。

例:
  ddim x, 8 : ddim y, 8 : ddim z, 8
  repeat 8 : x(cnt) = 1.0 * cnt : y(cnt) = 10.0 : loop
  iron_simd_add_d x, y, z, 8

%index
iron_simd_sub_d
double 配列の要素減算
%group
iron_simd - double配列
%prm
a, b, out, n
%inst
out(i) = a(i) - b(i) を n 個まとめて計算。

%index
iron_simd_mul_d
double 配列の要素乗算
%group
iron_simd - double配列
%prm
a, b, out, n
%inst
out(i) = a(i) * b(i) を n 個まとめて計算。

%index
iron_simd_div_d
double 配列の要素除算
%group
iron_simd - double配列
%prm
a, b, out, n
%inst
out(i) = a(i) / b(i) を n 個まとめて計算。
b(i)=0 の結果は IEEE754 に従い +inf / -inf / NaN となります。

%index
iron_simd_scale_d
double 配列のスカラ倍
%group
iron_simd - double配列
%prm
a, scalar, out, n
a      : 入力 double 配列
scalar : double のスカラ値
out    : 出力 double 配列
n      : 要素数
%inst
out(i) = a(i) * scalar を計算します。
スカラはベクトルにブロードキャストされ、AVX で 4 要素並列。

例:
  iron_simd_scale_d x, 0.5, y, 100     ; y = x * 0.5

%index
iron_simd_dot_d
double 配列の内積
%group
iron_simd - double配列
%prm
a, b, n, result
result : 内積結果を受け取る double 変数
%inst
result = Σ a(i) * b(i) を計算します。
AVX の場合 256bit アキュムレータに積和を蓄積し、最後に水平和。
浮動小数の総和順序は SIMD 内では並列化の都合で保証されず、
厳密に scalar と同じ値にはならない可能性があります (誤差範囲内)。

例:
  iron_simd_dot_d a, b, 1024, dot
  mes "dot = " + dot

%index
iron_simd_sum_d
double 配列の総和
%group
iron_simd - double配列
%prm
a, n, result
result : 総和を受け取る double 変数
%inst
result = Σ a(i)

%index
iron_simd_min_d
double 配列の最小値
%group
iron_simd - double配列
%prm
a, n, result
%inst
result = min a(i)。AVX の場合 _mm256_min_pd を使用。

%index
iron_simd_max_d
double 配列の最大値
%group
iron_simd - double配列
%prm
a, n, result
%inst
result = max a(i)。

%index
iron_simd_abs_d
double 配列の絶対値
%group
iron_simd - double配列
%prm
a, out, n
%inst
out(i) = |a(i)|。IEEE754 の符号ビットをマスクで落とす実装。

%index
iron_simd_sqrt_d
double 配列の平方根
%group
iron_simd - double配列
%prm
a, out, n
%inst
out(i) = sqrt(a(i))。負値は NaN になります。

;============================================================
;  int32 配列演算
;============================================================

%index
iron_simd_add_i
int 配列の要素加算
%group
iron_simd - int配列
%prm
a, b, out, n
%inst
out(i) = a(i) + b(i)。AVX2 で 8 個並列、SSE2 で 4 個並列。
32bit のオーバーフローは切り捨て (ラップアラウンド)。

%index
iron_simd_sub_i
int 配列の要素減算
%group
iron_simd - int配列
%prm
a, b, out, n
%inst
out(i) = a(i) - b(i)

%index
iron_simd_mul_i
int 配列の要素乗算
%group
iron_simd - int配列
%prm
a, b, out, n
%inst
out(i) = a(i) * b(i) (下位 32bit)。AVX2 の _mm256_mullo_epi32 使用。

%index
iron_simd_sum_i
int 配列の総和
%group
iron_simd - int配列
%prm
a, n, result
%inst
result = Σ a(i)。内部は 64bit で累積しオーバーフローしても
正しく集計しますが、戻り値 result は int32 にクランプされます。

%index
iron_simd_min_i
int 配列の最小値
%group
iron_simd - int配列
%prm
a, n, result

%index
iron_simd_max_i
int 配列の最大値
%group
iron_simd - int配列
%prm
a, n, result

%index
iron_simd_and_i
int 配列のビット AND
%group
iron_simd - int配列
%prm
a, b, out, n
%inst
out(i) = a(i) & b(i)。マスク処理やフラグ集合演算に便利。

%index
iron_simd_or_i
int 配列のビット OR
%group
iron_simd - int配列
%prm
a, b, out, n
%inst
out(i) = a(i) | b(i)

%index
iron_simd_xor_i
int 配列のビット XOR
%group
iron_simd - int配列
%prm
a, b, out, n
%inst
out(i) = a(i) ^ b(i)

;============================================================
;  float32 配列演算
;============================================================

%index
iron_simd_add_f
float 配列の要素加算
%group
iron_simd - float配列
%prm
a, b, out, n
a, b : 入力 float 配列 (sdim 4*n でバイト列として確保)
out  : 出力 float 配列
n    : 要素数
%inst
32bit float 版。HSP は float 型を持たないため sdim でバイト列
として確保し varptr で渡します。通常は double 版を使う方が
簡便ですが、OpenGL / DirectX / WASM などの相互運用で float 配列が
必要な場合に使用します。AVX で 8 個並列。

%index
iron_simd_dot_f
float 配列の内積
%group
iron_simd - float配列
%prm
a, b, n, result

%index
iron_simd_sum_f
float 配列の総和
%group
iron_simd - float配列
%prm
a, n, result

;============================================================
;  行列演算
;============================================================

%index
iron_simd_matmul_f
float 行列積 C = A * B
%group
iron_simd - 行列演算
%prm
A, B, C, m, n, k
A : 入力行列 (m x n)
B : 入力行列 (n x k)
C : 出力行列 (m x k)
m, n, k : 行列サイズ
%inst
row-major レイアウトで C = A * B を計算します (C は m 行 k 列)。
出力は常にゼロ初期化してから積和されます。
内ループで A の要素をブロードキャストし、B の行ベクトルと積和する
"broadcast + fma" スタイル。AVX 環境では 8 列ずつ並列処理。

例 (2x3 * 3x4 = 2x4):
  sdim A, 4 * 2 * 3
  sdim B, 4 * 3 * 4
  sdim C, 4 * 2 * 4
  ; ...行列に値を詰める...
  iron_simd_matmul_f A, B, C, 2, 3, 4

%index
iron_simd_matmul_d
double 行列積 C = A * B
%group
iron_simd - 行列演算
%prm
A, B, C, m, n, k
%inst
double 版行列積。AVX で 4 列並列。
ddim で確保した row-major 配列を渡します。

;============================================================
;  画像 / ピクセル演算
;============================================================

%index
iron_simd_pixel_blend
2 画像のアルファブレンド
%group
iron_simd - 画像
%prm
a, b, out, n, alpha
a, b  : 入力バッファ (RGBA 連続バイト列)
out   : 出力バッファ
n     : バイト数 (RGBA の場合 width*height*4)
alpha : ブレンド係数 (0.0 .. 1.0)
%inst
out(i) = a(i) * (1 - alpha) + b(i) * alpha を全バイトに適用します。
alpha=0 で a そのまま、alpha=1 で b そのまま。
AVX2 で 8 バイト単位に変換して並列計算。
UI のフェード効果や 2 画像クロスフェードに最適。

例:
  ; 50% ミックス
  iron_simd_pixel_blend img_a, img_b, img_out, 1920*1080*4, 0.5

%index
iron_simd_pixel_grayscale
RGBA → グレースケール変換
%group
iron_simd - 画像
%prm
rgba, out, n
rgba : 入力 RGBA バイト列
out  : 出力 (1 バイト / ピクセル)
n    : 入力バイト数 (4 の倍数であること)
%inst
BT.601 輝度係数 (0.299R + 0.587G + 0.114B) で RGBA を単チャネル
グレースケールに変換します。out の長さは n/4 バイト。
