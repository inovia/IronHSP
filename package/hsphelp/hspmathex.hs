;
; hspmathex.hs  HSP3 ヘルプ (日本語)
; 拡張数値演算プラグイン (任意精度整数 / 任意精度10進小数 / SIMD)
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
hspmathex.dll

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
hspmathex.dll は次の 3 種類の API を 1 つの DLL で提供します。

------------------------------------------------------------
(1) HSPVAR 拡張型 - 通常の変数と同じ感覚で扱える任意精度数値型
------------------------------------------------------------

  #include "hspmathex.as"

  追加される変数型:
    bigint  ... 任意精度整数         (Java の BigInteger 相当)
    bigdec  ... 任意精度10進固定小数 (Java の BigDecimal 相当)

  これらの型の変数は + - * / \ & | ^ == != < > <= >= 等の演算子で
  自然に書けます。文字列化は str()、型名は vartype() で取得できます。
  変数の寿命管理 (メモリ解放) は HSPVAR 機構が自動で行うため、
  ハンドルを明示的に解放する必要はありません。

------------------------------------------------------------
(2) ハンドルベース API - 高速・低オーバーヘッドのスタイル
------------------------------------------------------------

  bi_*       : BigInt  操作 (bi_create_str / bi_add / bi_mul / ...)
  bigdec_*   : BigDec  操作 (bigdec_create / bigdec_div / bigdec_sqrt / ...)

  整数や文字列からハンドル (int) を生成し、各演算関数はハンドルを
  受け取って結果ハンドルを返します。不要になったハンドルは必ず
  bi_free / bigdec_free で解放してください。忘れるとリークします。
  ハンドル 0 は常に無効値です (失敗時に返されます)。

------------------------------------------------------------
(3) SIMD API - SSE/AVX/AVX2 ベクトル演算
------------------------------------------------------------

  simd_has_*      : 実行 CPU の SIMD 対応判定 (CPUID + XGETBV)
  simd_cpu_name   : CPU ブランド名取得
  simd_*_d        : double 配列演算   (AVX 優先、SSE2 フォールバック)
  simd_*_i        : int32  配列演算   (AVX2 優先、SSE2 フォールバック)
  simd_*_f        : float  配列演算   (AVX 優先、SSE  フォールバック)
  simd_matmul_*   : 行列積             (row-major, f/d 両対応)
  simd_pixel_*    : 画像処理 (alpha ブレンド / グレースケール)

  SIMD 関数群は C ABI の __cdecl としてエクスポートされているため、
  通常は iron_simd.hsp のラッパを介して呼び出すのが簡単です。
  #uselib で直接呼ぶこともできます。

------------------------------------------------------------
依存: hspmathex.dll (x64 では hspmathex_64.dll) を実行ファイルと
      同じディレクトリに配置してください。

サンプル:
  #include "hspmathex.as"
  a = bigint("12345678901234567890")
  b = bigint("99999999999999999999")
  c = a + b
  mes str(c)
  mes vartype(a)
  stop

;============================================================
; (1) HSPVAR 拡張型
;============================================================

%index
bigint
任意精度整数値を生成 (HSPVAR 型)
%group
hspmathex
%prm
"decimal_str"
"decimal_str" : 10進文字列表現 ("-" 先頭可)
%inst
bigint("...") は任意精度整数 (bigint 型) の値を生成します。
生成された値は通常の変数に代入でき、+ - * / \ & | ^ == != < > 等の
演算子が HSP の組み込み型と同じ書式で使えます。
文字列化は str()、型名の取得は vartype() で行います。

桁数に理論上の上限はありません (メモリが許す限り)。
変数のメモリ解放は HSPVAR 機構により自動で行われます。

  a = bigint("100")
  b = bigint("200")
  c = a + b           ; => 300 (bigint 型)
  mes str(c)
  mes vartype(a)      ; => "bigint"

%href
bigdec
bi_create_str
bi_add
%sample
#include "hspmathex.as"
a = bigint("12345678901234567890")
b = bigint("99999999999999999999")
c = a + b
mes "a = "+str(a)
mes "b = "+str(b)
mes "a+b = "+str(c)
mes "vartype(a) = "+vartype(a)
stop

%index
bigdec
任意精度10進固定小数値を生成 (HSPVAR 型)
%group
hspmathex
%prm
"decimal_str"
"decimal_str" : 10進文字列表現 (符号・小数点・指数表記 "e"/"E" が使える)
%inst
bigdec("...") は任意精度10進固定小数 (bigdec 型) の値を生成します。
10進の小数点以下を正確に保持するので、金額計算のように誤差が
許されない演算に適しています (IEEE754 double では 0.1+0.2 != 0.3
となる問題が起きません)。

  pi = bigdec("3.141592653589793238462643383279")
  r  = bigdec("10")
  c  = pi * r * bigdec("2")      ; 円周
  mes str(c)
  mes vartype(pi)                ; => "bigdec"

除算 (/) はデフォルトで 30 桁で切り捨てです。
より詳細に丸めモード・桁数を制御したい場合はハンドル API の
bigdec_div を使用してください。

%href
bigint
bigdec_create
bigdec_div
%sample
#include "hspmathex.as"
a = bigdec("0.1")
b = bigdec("0.2")
c = a + b
mes "a = "+str(a)
mes "b = "+str(b)
mes "a+b = "+str(c)   ; 浮動小数点と違い、正確に 0.3 になる
stop

;============================================================
; (2a) BigInt ハンドル API
;============================================================

%index
bi_create_int
int から BigInt ハンドルを生成
%group
hspmathex
%prm
v
v : 生成元の 32bit 整数値
%inst
32bit 整数値 v から BigInt のハンドルを生成し、return 値として
返します (関数形式)。不要になったら必ず bi_free で解放してください。
ハンドル 0 は無効値 (生成失敗) を意味します。

%href
bi_create_str
bi_create_int64_split
bi_free
%sample
#include "hspmathex.as"
h = bi_create_int(12345)
sdim s, 64
bi_to_str h, s, 10
mes s                 ; => 12345
bi_free h
stop

%index
bi_create_int64_split
2 つの int32 から 64bit 値を合成して BigInt を生成
%group
hspmathex
%prm
lo, hi
lo : 64bit 値の下位 32bit
hi : 64bit 値の上位 32bit
%inst
HSP の標準型には 64bit 整数が無いため、2 つの int32 (lo, hi) に
分割された 64bit 値から BigInt ハンドルを生成します。
lo は符号無し、hi は符号付きとして扱い、結果は
  (hi << 32) | (lo & 0xFFFFFFFF)
となります。不要になったら bi_free で解放してください。

%href
bi_create_int
bi_to_int64_split
%sample
#include "hspmathex.as"
; 10000000000 (= 0x2540BE400) を生成
lo = 0x540BE400 : hi = 0x2
h  = bi_create_int64_split(lo, hi)
sdim s, 64
bi_to_str h, s, 10
mes s
bi_free h
stop

%index
bi_create_str
10進文字列から BigInt ハンドルを生成
%group
hspmathex
%prm
"s"
"s" : 10進文字列 ("-" 先頭可)
%inst
10進文字列 s から BigInt のハンドルを生成します。
桁数に制限はありません。パース失敗時はハンドル 0 が返ります。
不要になったら bi_free で解放してください。

%href
bi_create_int
bi_to_str
%sample
#include "hspmathex.as"
h = bi_create_str("123456789012345678901234567890")
sdim s, 128
bi_to_str h, s, 10
mes s
bi_free h
stop

%index
bi_clone
BigInt ハンドルを複製
%group
hspmathex
%prm
h
h : 複製元ハンドル
%inst
BigInt ハンドル h と同じ値を持つ新しいハンドルを生成して返します。
BigInt は値セマンティクスで扱うべきなので、他の変数に「コピー」
したい場合は必ず bi_clone を通してください (同じハンドルを共有
すると片方の bi_free で両方が無効になります)。

%href
bi_create_int
bi_free
%sample
#include "hspmathex.as"
a = bi_create_str("1000")
b = bi_clone(a)
bi_free a        ; a を解放しても b は有効
sdim s, 64
bi_to_str b, s, 10
mes s            ; => 1000
bi_free b
stop

%index
bi_free
BigInt ハンドルを解放
%group
hspmathex
%prm
h
h : 解放するハンドル
%inst
BigInt ハンドル h を解放します。
解放忘れはメモリリークになるので、ハンドル API を使う際には
生成したハンドルは必ず bi_free で解放してください。
ハンドル 0 を渡した場合は何もしません (安全)。

%href
bi_create_int
bi_clone
%sample
#include "hspmathex.as"
h = bi_create_int(42)
bi_free h
stop

%index
bi_to_str
BigInt を指定基数の文字列に変換
%group
hspmathex
%prm
h, var, radix
h     : BigInt ハンドル
var   : 出力文字列バッファ変数
radix : 基数 (2-36)
%inst
BigInt ハンドル h の値を radix 進数の文字列に変換して var に格納
します。var は sdim 等であらかじめ十分なサイズを確保しておく必要
があります (10 進で 1 桁あたり log10(2)*bit 程度)。

stat は成功時 0、失敗時に非 0 が返ります。

%href
bi_to_hex
bi_to_int32
bi_to_int64
%sample
#include "hspmathex.as"
h = bi_create_str("123456789012345")
sdim s, 64
bi_to_str h, s, 10
mes "10進: "+s
bi_to_str h, s, 2
mes "2進: "+s
bi_free h
stop

%index
bi_to_hex
BigInt を16進文字列に変換
%group
hspmathex
%prm
h, var, upper
h     : BigInt ハンドル
var   : 出力文字列バッファ変数
upper : 1=大文字 A-F / 0=小文字 a-f
%inst
BigInt ハンドル h の値を16進文字列に変換し var に格納します。
bi_to_str(h, var, 16) とほぼ同じですが、大文字/小文字の指定が
できる点が異なります。

%href
bi_to_str
%sample
#include "hspmathex.as"
h = bi_create_str("255")
sdim s, 32
bi_to_hex h, s, 1
mes s            ; => FF
bi_free h
stop

%index
bi_to_int64
BigInt を 2 つの int32 (64bit 分割) に変換
%group
hspmathex
%prm
h, var
h   : BigInt ハンドル
var : 出力変数 (int 配列 2 要素以上)
%inst
BigInt ハンドル h の値を 64bit として取り出し、2 つの int32 に
分割して var に格納します。
  var(0) : 下位 32bit (符号無し相当のビットパターン)
  var(1) : 上位 32bit (符号付き)

値が 64bit に収まらない場合は下位 64bit だけが取り出されます。
stat は成功時 0 です。

%href
bi_to_int64_split
bi_to_int32
bi_create_int64_split
%sample
#include "hspmathex.as"
h = bi_create_str("10000000000")   ; 0x2540BE400
dim v, 2
bi_to_int64 h, v
mes "lo = "+strf("0x%08X", v(0))
mes "hi = "+strf("0x%08X", v(1))
bi_free h
stop

%index
bi_to_int64_split
BigInt を 2 つの変数に 64bit 分割して取り出す
%group
hspmathex
%prm
h, lo_var, hi_var
h      : BigInt ハンドル
lo_var : 下位 32bit を格納する変数
hi_var : 上位 32bit を格納する変数
%inst
BigInt ハンドル h の値を 64bit として取り出し、下位 32bit を lo_var
に、上位 32bit を hi_var に格納します。
bi_to_int64 は配列を使いますが、こちらは別々の変数として受け取れる
便利形です。

%href
bi_to_int64
bi_create_int64_split
%sample
#include "hspmathex.as"
h = bi_create_str("10000000000")
bi_to_int64_split h, lo, hi
mes "lo = "+strf("0x%08X", lo)
mes "hi = "+strf("0x%08X", hi)
bi_free h
stop

%index
bi_to_int32
BigInt を 32bit 整数に変換
%group
hspmathex
%prm
h
h : BigInt ハンドル
%inst
BigInt ハンドル h の値を 32bit 整数として取り出して return 値で
返します (関数形式)。値が 32bit に収まらない場合は下位 32bit だけ
が返ります (切り詰め)。

%href
bi_to_int64
bi_to_str
%sample
#include "hspmathex.as"
h = bi_create_int(12345)
mes str(bi_to_int32(h))
bi_free h
stop

%index
bi_add
BigInt 加算 (a + b)
%group
hspmathex
%prm
a, b
a : BigInt ハンドル (被加数)
b : BigInt ハンドル (加数)
%inst
a + b を計算し、結果を新しい BigInt ハンドルとして return します。
a, b は変更されません。結果ハンドルは不要になったら bi_free で
解放してください。

%href
bi_sub
bi_mul
bi_div
%sample
#include "hspmathex.as"
a = bi_create_str("99999999999999999999")
b = bi_create_str("1")
c = bi_add(a, b)
sdim s, 64
bi_to_str c, s, 10
mes s
bi_free a : bi_free b : bi_free c
stop

%index
bi_sub
BigInt 減算 (a - b)
%group
hspmathex
%prm
a, b
a : BigInt ハンドル (被減数)
b : BigInt ハンドル (減数)
%inst
a - b を計算し、結果を新しい BigInt ハンドルとして return します。
結果が負になる場合もそのまま表現されます。
結果ハンドルは不要になったら bi_free してください。

%href
bi_add
bi_neg
%sample
#include "hspmathex.as"
a = bi_create_str("100")
b = bi_create_str("30")
c = bi_sub(a, b)   ; => 70
sdim s, 32
bi_to_str c, s, 10
mes s
bi_free a : bi_free b : bi_free c
stop

%index
bi_mul
BigInt 乗算 (a * b)
%group
hspmathex
%prm
a, b
a, b : BigInt ハンドル
%inst
a * b を計算し、結果を新しい BigInt ハンドルとして return します。
桁数が膨大になる場合は内部で Karatsuba 系アルゴリズムが使われる
ので、通常の筆算乗算より高速です。
結果ハンドルは不要になったら bi_free してください。

%href
bi_add
bi_pow
%sample
#include "hspmathex.as"
a = bi_create_str("123456789")
b = bi_create_str("987654321")
c = bi_mul(a, b)
sdim s, 64
bi_to_str c, s, 10
mes s
bi_free a : bi_free b : bi_free c
stop

%index
bi_div
BigInt 除算 (a / b, 切り捨て)
%group
hspmathex
%prm
a, b
a : BigInt ハンドル (被除数)
b : BigInt ハンドル (除数)
%inst
a / b の商を BigInt として return します (整数除算、余りは切り捨て)。
余りも必要な場合は別途 bi_mod を呼ぶか、事前に bigdec_div で
浮動小数精度の商を取るか検討してください。
b が 0 の場合はハンドル 0 が返ります。

%href
bi_mod
bi_mul
bigdec_div
%sample
#include "hspmathex.as"
a = bi_create_str("1000000000000")
b = bi_create_str("7")
q = bi_div(a, b)
sdim s, 64
bi_to_str q, s, 10
mes s
bi_free a : bi_free b : bi_free q
stop

%index
bi_mod
BigInt 剰余 (a mod b)
%group
hspmathex
%prm
a, b
a : BigInt ハンドル
b : BigInt ハンドル (b > 0 推奨)
%inst
a を b で割った余りを BigInt として return します。
負数に対する挙動は「結果の符号は a と同じ」です (C 言語の %
と同じ truncated modulo)。b が 0 の場合はハンドル 0 が返ります。

%href
bi_div
%sample
#include "hspmathex.as"
a = bi_create_str("100")
b = bi_create_str("7")
r = bi_mod(a, b)  ; => 2
sdim s, 32
bi_to_str r, s, 10
mes s
bi_free a : bi_free b : bi_free r
stop

%index
bi_and
BigInt ビット AND (a & b)
%group
hspmathex
%prm
a, b
a, b : BigInt ハンドル
%inst
a と b のビット単位 AND を計算し、結果ハンドルを return します。
負数は 2 の補数表現として扱われます。

%href
bi_or
bi_xor
%sample
#include "hspmathex.as"
a = bi_create_str("0xFF00FF00")
b = bi_create_str("0x0F0F0F0F")
c = bi_and(a, b)
sdim s, 32
bi_to_hex c, s, 1
mes s
bi_free a : bi_free b : bi_free c
stop

%index
bi_or
BigInt ビット OR (a | b)
%group
hspmathex
%prm
a, b
a, b : BigInt ハンドル
%inst
a と b のビット単位 OR を計算し、結果ハンドルを return します。

%href
bi_and
bi_xor
%sample
#include "hspmathex.as"
a = bi_create_int(0x00FF)
b = bi_create_int(0xFF00)
c = bi_or(a, b)
mes str(bi_to_int32(c))   ; => 65535
bi_free a : bi_free b : bi_free c
stop

%index
bi_xor
BigInt ビット XOR (a ^ b)
%group
hspmathex
%prm
a, b
a, b : BigInt ハンドル
%inst
a と b のビット単位 XOR を計算し、結果ハンドルを return します。

%href
bi_and
bi_or
%sample
#include "hspmathex.as"
a = bi_create_int(0xFFFF)
b = bi_create_int(0x0F0F)
c = bi_xor(a, b)
mes strf("0x%X", bi_to_int32(c))
bi_free a : bi_free b : bi_free c
stop

%index
bi_pow
BigInt 冪乗 (a ^ exp)
%group
hspmathex
%prm
a, exp
a   : BigInt ハンドル (底)
exp : 指数 (int, 非負)
%inst
a の exp 乗を BigInt として return します。exp は通常の int です。
exp が非常に大きい場合は結果の桁数が爆発的に増えるので注意
してください (メモリ消費と計算時間)。

%href
bi_mul
bigdec_pow
%sample
#include "hspmathex.as"
a = bi_create_str("2")
c = bi_pow(a, 256)     ; 2^256
sdim s, 256
bi_to_str c, s, 10
mes s
bi_free a : bi_free c
stop

%index
bi_gcd
BigInt 最大公約数
%group
hspmathex
%prm
a, b
a, b : BigInt ハンドル
%inst
a と b の最大公約数 (GCD) を BigInt として return します。
a, b が 0 の場合でもエラーにはなりません (GCD(0, x) = x)。

%href
bi_mul
bi_div
%sample
#include "hspmathex.as"
a = bi_create_str("462")
b = bi_create_str("1071")
g = bi_gcd(a, b)   ; => 21
mes str(bi_to_int32(g))
bi_free a : bi_free b : bi_free g
stop

%index
bi_abs
BigInt 絶対値
%group
hspmathex
%prm
h
h : BigInt ハンドル
%inst
h の絶対値 |h| を新しい BigInt ハンドルとして return します。

%href
bi_neg
%sample
#include "hspmathex.as"
a = bi_create_str("-12345")
b = bi_abs(a)
mes str(bi_to_int32(b))   ; => 12345
bi_free a : bi_free b
stop

%index
bi_neg
BigInt 符号反転 (-h)
%group
hspmathex
%prm
h
h : BigInt ハンドル
%inst
h の符号を反転した値 -h を新しい BigInt ハンドルとして return
します。

%href
bi_abs
bi_sub
%sample
#include "hspmathex.as"
a = bi_create_str("100")
b = bi_neg(a)
mes str(bi_to_int32(b))   ; => -100
bi_free a : bi_free b
stop

%index
bi_cmp
BigInt 比較 (a と b)
%group
hspmathex
%prm
a, b
a, b : BigInt ハンドル
%inst
a と b を比較し、
  a <  b  : 負の整数
  a == b  : 0
  a >  b  : 正の整数
を return します (C の strcmp 風)。
具体的な大小だけ知りたい場合は return 値の符号だけ見れば十分です。

%href
bi_add
bi_sub
%sample
#include "hspmathex.as"
a = bi_create_str("100")
b = bi_create_str("200")
if bi_cmp(a, b) < 0 : mes "a < b"
bi_free a : bi_free b
stop

%index
bi_shl
BigInt 左シフト (a << n)
%group
hspmathex
%prm
a, n
a : BigInt ハンドル
n : シフトビット数 (非負, int)
%inst
a を n ビット左にシフトした値を BigInt として return します。
n が負の場合の挙動は未定義なので、0 以上を渡してください。

%href
bi_shr
bi_mul
%sample
#include "hspmathex.as"
a = bi_create_int(1)
b = bi_shl(a, 100)    ; 2^100
sdim s, 64
bi_to_str b, s, 10
mes s
bi_free a : bi_free b
stop

%index
bi_shr
BigInt 右シフト (a >> n, 算術)
%group
hspmathex
%prm
a, n
a : BigInt ハンドル
n : シフトビット数 (非負, int)
%inst
a を n ビット右にシフトした値を BigInt として return します。
負の値に対しては算術シフト (符号拡張) になります。

%href
bi_shl
bi_div
%sample
#include "hspmathex.as"
a = bi_create_str("1024")
b = bi_shr(a, 3)      ; 1024 >> 3 = 128
mes str(bi_to_int32(b))
bi_free a : bi_free b
stop

%index
bi_bitlen
BigInt のビット長
%group
hspmathex
%prm
h
h : BigInt ハンドル
%inst
|h| を 2 進表現したときのビット数を int で return します。
0 の場合は 0 を返します。
負数の場合は絶対値のビット長が返ります。

%href
bi_shl
bi_shr
%sample
#include "hspmathex.as"
a = bi_create_str("1024")
mes str(bi_bitlen(a))    ; => 11
bi_free a
stop

;============================================================
; (2b) BigDecimal ハンドル API
;============================================================

%index
bigdec_create
文字列から BigDec ハンドルを生成
%group
hspmathex
%prm
"s"
"s" : 10進文字列 (符号・小数点・指数表記対応)
%inst
文字列 s から BigDec ハンドルを生成します。
"3.14", "-0.001", "1.5e10" のような表記が受け付けられます。
パース失敗時はハンドル 0 が返ります。
不要になったら bigdec_free で解放してください。

%href
bigdec_create_from_double
bigdec_free
%sample
#include "hspmathex.as"
h = bigdec_create("3.141592653589793238462643383279")
sdim s, 64
bigdec_to_str h, s, 0
mes s
bigdec_free h
stop

%index
bigdec_create_from_double
double から BigDec ハンドルを生成
%group
hspmathex
%prm
v, scale
v     : 生成元 double 値
scale : 小数点以下の桁数 (スケール)
%inst
double 値 v を指定 scale で丸めて BigDec ハンドルを生成します。
double には 2 進の丸め誤差があるため、10 進で厳密な値が必要な
場合は bigdec_create("...") 経由の文字列生成を推奨します。

%href
bigdec_create
bigdec_scale
%sample
#include "hspmathex.as"
h = bigdec_create_from_double(3.14, 5)
sdim s, 32
bigdec_to_str h, s, 0
mes s
bigdec_free h
stop

%index
bigdec_clone
BigDec ハンドルを複製
%group
hspmathex
%prm
h
h : 複製元ハンドル
%inst
BigDec ハンドル h と同じ値を持つ新しいハンドルを生成して return
します。変数間で「値コピー」したい場合に使います。
結果ハンドルは不要になったら bigdec_free してください。

%href
bigdec_create
bigdec_free
%sample
#include "hspmathex.as"
a = bigdec_create("3.14")
b = bigdec_clone(a)
bigdec_free a     ; a を解放しても b は有効
bigdec_free b
stop

%index
bigdec_free
BigDec ハンドルを解放
%group
hspmathex
%prm
h
h : 解放するハンドル
%inst
BigDec ハンドル h を解放します。
解放忘れはメモリリークになります。ハンドル 0 を渡した場合は
何もしません (安全)。

%href
bigdec_create
%sample
#include "hspmathex.as"
h = bigdec_create("1.23")
bigdec_free h
stop

%index
bigdec_to_str
BigDec を文字列に変換 (toString)
%group
hspmathex
%prm
h, var, unused
h      : BigDec ハンドル
var    : 出力文字列バッファ変数
unused : 予約 (0 を渡す)
%inst
BigDec ハンドル h の値を文字列に変換して var に格納します。
非常に大きい/小さい値は指数表記 (1.5E+20 など) になることがあり
ます。指数表記を避けたい場合は bigdec_to_plain_str を使ってくだ
さい。

var は sdim 等で十分なサイズを確保しておく必要があります。

%href
bigdec_to_plain_str
bigdec_to_double
%sample
#include "hspmathex.as"
h = bigdec_create("12345.6789")
sdim s, 64
bigdec_to_str h, s, 0
mes s
bigdec_free h
stop

%index
bigdec_to_plain_str
BigDec を指数表記なしの文字列に変換
%group
hspmathex
%prm
h, var, unused
h      : BigDec ハンドル
var    : 出力文字列バッファ変数
unused : 予約 (0 を渡す)
%inst
BigDec ハンドル h の値を指数表記を使わない純粋な10進文字列
("0.0000001" や "10000000000000" のような形) として var に格納
します。人間が読みやすい形で表示したい場合に便利です。

%href
bigdec_to_str
%sample
#include "hspmathex.as"
h = bigdec_create("1.5e-10")
sdim s, 128
bigdec_to_plain_str h, s, 0
mes s              ; => 0.00000000015
bigdec_free h
stop

%index
bigdec_to_double
BigDec を double に変換
%group
hspmathex
%prm
h, var
h   : BigDec ハンドル
var : 出力変数 (double)
%inst
BigDec ハンドル h の値を double に変換して var に格納します。
変換時に IEEE754 の精度まで丸められるので、元の精度が保持され
ない場合があります。

%href
bigdec_to_str
bigdec_create_from_double
%sample
#include "hspmathex.as"
h = bigdec_create("3.141592653589793")
bigdec_to_double h, v
mes str(v)
bigdec_free h
stop

%index
bigdec_add
BigDec 加算 (a + b)
%group
hspmathex
%prm
a, b
a, b : BigDec ハンドル
%inst
a + b を計算し、結果を新しい BigDec ハンドルとして return します。
結果のスケール (小数点以下の桁数) は a, b のうち大きい方になります。

%href
bigdec_sub
bigdec_mul
%sample
#include "hspmathex.as"
a = bigdec_create("0.1")
b = bigdec_create("0.2")
c = bigdec_add(a, b)
sdim s, 32
bigdec_to_str c, s, 0
mes s               ; => 0.3 (正確)
bigdec_free a : bigdec_free b : bigdec_free c
stop

%index
bigdec_sub
BigDec 減算 (a - b)
%group
hspmathex
%prm
a, b
a, b : BigDec ハンドル
%inst
a - b を計算し、結果を新しい BigDec ハンドルとして return します。

%href
bigdec_add
bigdec_neg
%sample
#include "hspmathex.as"
a = bigdec_create("1.0")
b = bigdec_create("0.3")
c = bigdec_sub(a, b)   ; => 0.7
sdim s, 32
bigdec_to_str c, s, 0
mes s
bigdec_free a : bigdec_free b : bigdec_free c
stop

%index
bigdec_mul
BigDec 乗算 (a * b)
%group
hspmathex
%prm
a, b
a, b : BigDec ハンドル
%inst
a * b を計算し、結果を新しい BigDec ハンドルとして return します。
結果のスケールは (scale(a) + scale(b)) になります。
精度を抑えたい場合は bigdec_scale や bigdec_round で丸めてください。

%href
bigdec_add
bigdec_div
bigdec_round
%sample
#include "hspmathex.as"
a = bigdec_create("1.5")
b = bigdec_create("2.5")
c = bigdec_mul(a, b)   ; => 3.75
sdim s, 32
bigdec_to_str c, s, 0
mes s
bigdec_free a : bigdec_free b : bigdec_free c
stop

%index
bigdec_div
BigDec 除算 (a / b, 精度・丸め指定)
%group
hspmathex
%prm
a, b, scale, roundMode
a         : BigDec ハンドル (被除数)
b         : BigDec ハンドル (除数)
scale     : 結果の小数点以下桁数
roundMode : 丸めモード (BIGDEC_HALF_UP など)
%inst
a / b を scale 桁・指定丸めモードで計算した BigDec を return します。
b が 0 の場合はハンドル 0 が返ります。

丸めモード:
  BIGDEC_HALF_UP   (0) : 5 以上切り上げ (一般的な四捨五入)
  BIGDEC_HALF_EVEN (1) : 銀行丸め (偶数側に丸める)
  BIGDEC_DOWN      (2) : 0 方向に切り捨て
  BIGDEC_UP        (3) : 0 から離れる方向に切り上げ
  BIGDEC_FLOOR     (4) : -無限大 方向に切り捨て
  BIGDEC_CEILING   (5) : +無限大 方向に切り上げ

%href
bigdec_mul
bigdec_round
bigdec_scale
%sample
#include "hspmathex.as"
a = bigdec_create("1")
b = bigdec_create("3")
c = bigdec_div(a, b, 20, BIGDEC_HALF_UP)   ; 20 桁精度
sdim s, 64
bigdec_to_str c, s, 0
mes s               ; => 0.33333333333333333333
bigdec_free a : bigdec_free b : bigdec_free c
stop

%index
bigdec_pow
BigDec 冪乗 (a ^ exp)
%group
hspmathex
%prm
a, exp
a   : BigDec ハンドル (底)
exp : 指数 (int, 非負)
%inst
a の exp 乗を BigDec として return します。exp は int。
負の指数や小数指数は未対応です (正確な BigDec 演算では有限桁に
収まらないため)。必要なら double 経由の pow を使うか、ユーザー
側で Taylor 展開を組んでください。

%href
bigdec_mul
bi_pow
%sample
#include "hspmathex.as"
a = bigdec_create("1.01")
c = bigdec_pow(a, 100)   ; 複利 1% を 100 回
sdim s, 64
bigdec_to_str c, s, 0
mes s
bigdec_free a : bigdec_free c
stop

%index
bigdec_abs
BigDec 絶対値
%group
hspmathex
%prm
h
h : BigDec ハンドル
%inst
|h| を新しい BigDec として return します。
%href
bigdec_neg
%sample
#include "hspmathex.as"
a = bigdec_create("-3.14")
b = bigdec_abs(a)
sdim s, 32
bigdec_to_str b, s, 0
mes s          ; => 3.14
bigdec_free a : bigdec_free b
stop

%index
bigdec_neg
BigDec 符号反転 (-h)
%group
hspmathex
%prm
h
h : BigDec ハンドル
%inst
h の符号を反転した BigDec を return します。

%href
bigdec_abs
bigdec_sub
%sample
#include "hspmathex.as"
a = bigdec_create("3.14")
b = bigdec_neg(a)
sdim s, 32
bigdec_to_str b, s, 0
mes s          ; => -3.14
bigdec_free a : bigdec_free b
stop

%index
bigdec_round
BigDec を指定精度で丸める
%group
hspmathex
%prm
h, precision, roundMode
h         : BigDec ハンドル
precision : 有効桁数 (MathContext の precision)
roundMode : 丸めモード (BIGDEC_HALF_UP など)
%inst
BigDec h を指定された有効桁数で丸めた新しい BigDec を return
します。precision は「先頭から何桁で打ち切るか」で、scale
(小数点以下桁数) とは異なる点に注意してください。

丸めモードは bigdec_div と同じ BIGDEC_* 定数が使えます。

%href
bigdec_scale
bigdec_div
%sample
#include "hspmathex.as"
a = bigdec_create("3.14159265358979")
b = bigdec_round(a, 5, BIGDEC_HALF_UP)  ; 有効 5 桁
sdim s, 32
bigdec_to_str b, s, 0
mes s          ; => 3.1416
bigdec_free a : bigdec_free b
stop

%index
bigdec_scale
BigDec のスケール (小数点以下桁数) を変更
%group
hspmathex
%prm
h, newScale, roundMode
h         : BigDec ハンドル
newScale  : 新しい小数点以下桁数
roundMode : 丸めモード
%inst
BigDec h のスケールを newScale に変更した新しい BigDec を return
します。
  newScale が現在より大きい  : 0 でパディング (値は変わらない)
  newScale が現在より小さい  : roundMode に従って丸める

金額計算で「必ず小数点以下 2 桁に整える」といった用途に便利です。

%href
bigdec_round
bigdec_get_scale
%sample
#include "hspmathex.as"
a = bigdec_create("12.3456")
b = bigdec_scale(a, 2, BIGDEC_HALF_UP)
sdim s, 32
bigdec_to_str b, s, 0
mes s          ; => 12.35
bigdec_free a : bigdec_free b
stop

%index
bigdec_cmp
BigDec 比較 (a と b)
%group
hspmathex
%prm
a, b
a, b : BigDec ハンドル
%inst
a と b を比較し、
  a <  b : 負の整数
  a == b : 0
  a >  b : 正の整数
を return します。スケールが違っても「数学的に同じ値」なら 0 を
返します (例: 1.0 と 1.00 は等しい)。

%href
bigdec_add
bigdec_sub
%sample
#include "hspmathex.as"
a = bigdec_create("1.0")
b = bigdec_create("1.00")
mes str(bigdec_cmp(a, b))  ; => 0
bigdec_free a : bigdec_free b
stop

%index
bigdec_get_scale
BigDec のスケール (小数点以下桁数) を取得
%group
hspmathex
%prm
h
h : BigDec ハンドル
%inst
BigDec h のスケール (小数点以下の桁数) を int で return します。
負のスケールもあり得ます (例: "120" を scale=-1 で持つと "12e1")。

%href
bigdec_scale
bigdec_get_precision
%sample
#include "hspmathex.as"
h = bigdec_create("3.14159")
mes str(bigdec_get_scale(h))    ; => 5
bigdec_free h
stop

%index
bigdec_get_precision
BigDec の有効桁数を取得
%group
hspmathex
%prm
h
h : BigDec ハンドル
%inst
BigDec h の有効桁数 (precision, 先頭の 0 を除いた有効数字の桁数)
を int で return します。

%href
bigdec_get_scale
bigdec_round
%sample
#include "hspmathex.as"
h = bigdec_create("3.14159")
mes str(bigdec_get_precision(h))  ; => 6
bigdec_free h
stop

%index
bigdec_sqrt
BigDec 平方根
%group
hspmathex
%prm
h, scale
h     : BigDec ハンドル (非負)
scale : 結果の小数点以下桁数
%inst
BigDec h の平方根を scale 桁で計算した BigDec を return します。
Newton 法で反復計算されます。h が負の場合はハンドル 0 が返ります。

scale は必要桁数を明示的に指定してください (例: 20-50 など)。
scale を大きくすると計算時間が増えます。

%href
bigdec_pow
bigdec_div
%sample
#include "hspmathex.as"
a = bigdec_create("2")
b = bigdec_sqrt(a, 30)
sdim s, 64
bigdec_to_str b, s, 0
mes s          ; => 1.414213562373095048801688724209
bigdec_free a : bigdec_free b
stop

;============================================================
; (3) SIMD API
;   ※ 通常は iron_simd.hsp のラッパ経由で使うのを推奨
;============================================================

%index
simd_has_sse
SSE 対応判定
%group
hspmathex
%prm

%inst
実行中の CPU が SSE 命令をサポートしているかを判定し、
1 (対応) / 0 (非対応) を return します。
DLL ロード時に CPUID で一度だけ検出され、以後は定数的に返ります。

%href
simd_has_sse2
simd_has_avx
simd_cpu_name
%sample
#include "hspmathex.as"
#uselib "hspmathex.dll"
#cfunc simd_has_sse "simd_has_sse"
mes "SSE: "+simd_has_sse()
stop

%index
simd_has_sse2
SSE2 対応判定
%group
hspmathex
%prm

%inst
CPU が SSE2 命令をサポートしているかを判定し 1/0 を return します。

%href
simd_has_sse
simd_has_avx
%sample
#include "hspmathex.as"
#uselib "hspmathex.dll"
#cfunc simd_has_sse2 "simd_has_sse2"
mes "SSE2: "+simd_has_sse2()
stop

%index
simd_has_avx
AVX 対応判定
%group
hspmathex
%prm

%inst
CPU+OS が AVX 命令をサポートしているかを判定し 1/0 を return します。
CPUID だけでなく XGETBV による OS サポート確認も行われます。

%href
simd_has_avx2
simd_has_avx512
%sample
#include "hspmathex.as"
#uselib "hspmathex.dll"
#cfunc simd_has_avx "simd_has_avx"
mes "AVX: "+simd_has_avx()
stop

%index
simd_has_avx2
AVX2 対応判定
%group
hspmathex
%prm

%inst
CPU+OS が AVX2 命令をサポートしているかを判定し 1/0 を return します。
SIMD 整数演算の多くは AVX2 で高速化されます。

%href
simd_has_avx
simd_has_avx512
%sample
#include "hspmathex.as"
#uselib "hspmathex.dll"
#cfunc simd_has_avx2 "simd_has_avx2"
mes "AVX2: "+simd_has_avx2()
stop

%index
simd_has_avx512
AVX-512 対応判定
%group
hspmathex
%prm

%inst
CPU+OS が AVX-512 Foundation (AVX-512F) をサポートしているかを
判定し 1/0 を return します。XGETBV による ZMM レジスタの OS 有効
化確認も行われます。

%href
simd_has_avx2
%sample
#include "hspmathex.as"
#uselib "hspmathex.dll"
#cfunc simd_has_avx512 "simd_has_avx512"
mes "AVX-512: "+simd_has_avx512()
stop

%index
simd_cpu_name
CPU ブランド名取得
%group
hspmathex
%prm
var, maxlen
var    : 出力文字列バッファ変数
maxlen : var のサイズ (64 推奨)
%inst
CPUID の拡張機能 0x80000002-0x80000004 から得られる CPU の
ブランド名文字列 (例: "Intel(R) Core(TM) i7-...") を var に格納
します。stat は成功時 0、失敗時 -1。

%href
simd_has_sse
simd_has_avx2
%sample
#include "hspmathex.as"
#uselib "hspmathex.dll"
#func simd_cpu_name "simd_cpu_name" var, int
sdim name, 64
simd_cpu_name name, 64
mes name
stop

%index
simd_add_d
double 配列加算 (out = a + b)
%group
hspmathex
%prm
a, b, out, n
a, b : double 配列 (入力, 長さ n)
out  : double 配列 (出力, 長さ n)
n    : 要素数
%inst
要素ごとに a(i) + b(i) を計算して out(i) に格納します。
AVX があれば 4 要素ずつ、無ければ SSE2 で 2 要素ずつ処理します。

stat は成功時 0、引数不正 (NULL / n<=0) の時 -1。

%href
simd_sub_d
simd_mul_d
simd_div_d
%sample
#include "hspmathex.as"
#uselib "hspmathex.dll"
#func simd_add_d "simd_add_d" var, var, var, int
ddim a, 4 : ddim b, 4 : ddim c, 4
a = 1.0, 2.0, 3.0, 4.0
b = 10.0, 20.0, 30.0, 40.0
simd_add_d a, b, c, 4
repeat 4 : mes str(c(cnt)) : loop
stop

%index
simd_sub_d
double 配列減算 (out = a - b)
%group
hspmathex
%prm
a, b, out, n
a, b, out : double 配列
n         : 要素数
%inst
要素ごとに a(i) - b(i) を out(i) に格納します。
%href
simd_add_d
%sample
#include "hspmathex.as"
; iron_simd.hsp 経由の利用を推奨
stop

%index
simd_mul_d
double 配列乗算 (out = a * b)
%group
hspmathex
%prm
a, b, out, n
a, b, out : double 配列
n         : 要素数
%inst
要素ごとに a(i) * b(i) を out(i) に格納します。
%href
simd_add_d
simd_scale_d
%sample
#include "hspmathex.as"
; iron_simd.hsp 経由の利用を推奨
stop

%index
simd_div_d
double 配列除算 (out = a / b)
%group
hspmathex
%prm
a, b, out, n
a, b, out : double 配列
n         : 要素数
%inst
要素ごとに a(i) / b(i) を out(i) に格納します。
b(i) が 0 の位置は IEEE754 の無限大/NaN になります。
%href
simd_mul_d
%sample
#include "hspmathex.as"
; iron_simd.hsp 経由の利用を推奨
stop

%index
simd_scale_d
double 配列スカラー倍 (out = a * s)
%group
hspmathex
%prm
a, s, out, n
a, out : double 配列
s      : double スカラー
n      : 要素数
%inst
a の各要素を同じスカラー s で掛けて out に格納します。
a = a*s の形で使うと配列一括スケーリングに便利です。
%href
simd_mul_d
%sample
#include "hspmathex.as"
; iron_simd.hsp 経由の利用を推奨
stop

%index
simd_dot_d
double 配列の内積
%group
hspmathex
%prm
a, b, n, result
a, b   : double 配列
n      : 要素数
result : double (出力)
%inst
a・b = Σ a(i)*b(i) を計算して result に格納します。
AVX があれば 4 要素並列で累算します。
%href
simd_sum_d
simd_mul_d
%sample
#include "hspmathex.as"
; iron_simd.hsp 経由の利用を推奨
stop

%index
simd_sum_d
double 配列の総和
%group
hspmathex
%prm
a, n, result
a      : double 配列
n      : 要素数
result : double (出力)
%inst
Σ a(i) を計算して result に格納します。
%href
simd_dot_d
simd_min_d
simd_max_d
%sample
#include "hspmathex.as"
; iron_simd.hsp 経由の利用を推奨
stop

%index
simd_min_d
double 配列の最小値
%group
hspmathex
%prm
a, n, result
a      : double 配列
n      : 要素数
result : double (出力)
%inst
a(i) のうち最小値を result に格納します。
%href
simd_max_d
%sample
#include "hspmathex.as"
; iron_simd.hsp 経由の利用を推奨
stop

%index
simd_max_d
double 配列の最大値
%group
hspmathex
%prm
a, n, result
a      : double 配列
n      : 要素数
result : double (出力)
%inst
a(i) のうち最大値を result に格納します。
%href
simd_min_d
%sample
#include "hspmathex.as"
; iron_simd.hsp 経由の利用を推奨
stop

%index
simd_abs_d
double 配列の絶対値
%group
hspmathex
%prm
a, out, n
a, out : double 配列
n      : 要素数
%inst
要素ごとに |a(i)| を out(i) に格納します。AVX があれば符号ビット
マスクで一気に処理します。
%href
simd_sqrt_d
%sample
#include "hspmathex.as"
; iron_simd.hsp 経由の利用を推奨
stop

%index
simd_sqrt_d
double 配列の平方根
%group
hspmathex
%prm
a, out, n
a, out : double 配列
n      : 要素数
%inst
要素ごとに sqrt(a(i)) を out(i) に格納します。
a(i) が負の位置は NaN になります。
%href
simd_abs_d
%sample
#include "hspmathex.as"
; iron_simd.hsp 経由の利用を推奨
stop

%index
simd_add_i
int32 配列加算 (out = a + b)
%group
hspmathex
%prm
a, b, out, n
a, b, out : int 配列
n         : 要素数
%inst
要素ごとに a(i) + b(i) を out(i) に格納します。
AVX2 があれば 8 要素ずつ、無ければ SSE2 で 4 要素ずつ処理します。
オーバーフロー時は 32bit ラップアラウンドします。
%href
simd_sub_i
simd_mul_i
simd_sum_i
%sample
#include "hspmathex.as"
; iron_simd.hsp 経由の利用を推奨
stop

%index
simd_sub_i
int32 配列減算 (out = a - b)
%group
hspmathex
%prm
a, b, out, n
a, b, out : int 配列
n         : 要素数
%inst
要素ごとに a(i) - b(i) を out(i) に格納します。
%href
simd_add_i
%sample
#include "hspmathex.as"
; iron_simd.hsp 経由の利用を推奨
stop

%index
simd_mul_i
int32 配列乗算 (out = a * b)
%group
hspmathex
%prm
a, b, out, n
a, b, out : int 配列
n         : 要素数
%inst
要素ごとに a(i) * b(i) を out(i) に格納します。
下位 32bit のみが出力されます (オーバーフロー切り捨て)。
%href
simd_add_i
%sample
#include "hspmathex.as"
; iron_simd.hsp 経由の利用を推奨
stop

%index
simd_sum_i
int32 配列の総和
%group
hspmathex
%prm
a, n, result
a      : int 配列
n      : 要素数
result : int (出力)
%inst
Σ a(i) を計算して result に格納します。内部では int64 で累算し、
最終結果を int32 範囲にクランプ (飽和) します。
%href
simd_min_i
simd_max_i
%sample
#include "hspmathex.as"
; iron_simd.hsp 経由の利用を推奨
stop

%index
simd_min_i
int32 配列の最小値
%group
hspmathex
%prm
a, n, result
a      : int 配列
n      : 要素数
result : int (出力)
%inst
a(i) のうち最小値を result に格納します。
%href
simd_max_i
%sample
#include "hspmathex.as"
; iron_simd.hsp 経由の利用を推奨
stop

%index
simd_max_i
int32 配列の最大値
%group
hspmathex
%prm
a, n, result
a      : int 配列
n      : 要素数
result : int (出力)
%inst
a(i) のうち最大値を result に格納します。
%href
simd_min_i
%sample
#include "hspmathex.as"
; iron_simd.hsp 経由の利用を推奨
stop

%index
simd_and_i
int32 配列のビット AND
%group
hspmathex
%prm
a, b, out, n
a, b, out : int 配列
n         : 要素数
%inst
要素ごとに a(i) & b(i) を out(i) に格納します。
%href
simd_or_i
simd_xor_i
%sample
#include "hspmathex.as"
; iron_simd.hsp 経由の利用を推奨
stop

%index
simd_or_i
int32 配列のビット OR
%group
hspmathex
%prm
a, b, out, n
a, b, out : int 配列
n         : 要素数
%inst
要素ごとに a(i) | b(i) を out(i) に格納します。
%href
simd_and_i
simd_xor_i
%sample
#include "hspmathex.as"
; iron_simd.hsp 経由の利用を推奨
stop

%index
simd_xor_i
int32 配列のビット XOR
%group
hspmathex
%prm
a, b, out, n
a, b, out : int 配列
n         : 要素数
%inst
要素ごとに a(i) ^ b(i) を out(i) に格納します。
%href
simd_and_i
simd_or_i
%sample
#include "hspmathex.as"
; iron_simd.hsp 経由の利用を推奨
stop

%index
simd_add_f
float 配列加算 (out = a + b)
%group
hspmathex
%prm
a, b, out, n
a, b, out : float 配列
n         : 要素数
%inst
要素ごとに a(i) + b(i) を out(i) に格納します。
AVX があれば 8 要素ずつ、SSE で 4 要素ずつ処理します。
HSP では float 配列を直接扱えないため、通常はバイナリバッファ上の
単精度データに対して使います。
%href
simd_dot_f
simd_sum_f
%sample
#include "hspmathex.as"
; iron_simd.hsp 経由の利用を推奨
stop

%index
simd_dot_f
float 配列の内積
%group
hspmathex
%prm
a, b, n, result
a, b   : float 配列
n      : 要素数
result : float (出力)
%inst
a・b = Σ a(i)*b(i) を計算して result に格納します。
%href
simd_sum_f
simd_dot_d
%sample
#include "hspmathex.as"
; iron_simd.hsp 経由の利用を推奨
stop

%index
simd_sum_f
float 配列の総和
%group
hspmathex
%prm
a, n, result
a      : float 配列
n      : 要素数
result : float (出力)
%inst
Σ a(i) を計算して result に格納します。
%href
simd_sum_d
simd_dot_f
%sample
#include "hspmathex.as"
; iron_simd.hsp 経由の利用を推奨
stop

%index
simd_matmul_f
float 行列積 C = A * B
%group
hspmathex
%prm
a, b, c, m, n, k
a : float 行列 A (m x n, row-major)
b : float 行列 B (n x k, row-major)
c : float 行列 C (m x k, row-major, 出力)
m, n, k : 次元サイズ
%inst
row-major の行列積 C = A * B を計算します。
出力行列 C のサイズは m*k 要素分 (float) 確保しておいてください。
AVX があれば 8 列ずつ並列化されます。

小～中規模向けのシンプルな実装で、BLAS ほど最適化されていません
(大規模行列では専用 BLAS 等の採用を検討してください)。
%href
simd_matmul_d
%sample
#include "hspmathex.as"
; iron_simd.hsp 経由の利用を推奨
stop

%index
simd_matmul_d
double 行列積 C = A * B
%group
hspmathex
%prm
a, b, c, m, n, k
a : double 行列 A (m x n, row-major)
b : double 行列 B (n x k, row-major)
c : double 行列 C (m x k, row-major, 出力)
m, n, k : 次元サイズ
%inst
row-major の行列積 C = A * B を double 精度で計算します。
AVX があれば 4 列ずつ並列化されます。
%href
simd_matmul_f
%sample
#include "hspmathex.as"
; iron_simd.hsp 経由の利用を推奨
stop

%index
simd_pixel_blend
ピクセル配列の α ブレンド
%group
hspmathex
%prm
a, b, out, n, alpha
a, b   : uint8 配列 (バイトバッファ)
out    : uint8 配列 (出力)
n      : バイト数
alpha  : ブレンド係数 (0.0-1.0, float)
%inst
out(i) = a(i) * (1 - alpha) + b(i) * alpha を各バイトで計算し、
0-255 でクランプして出力します。
AVX2 があれば 8 バイトずつ並列化されます。
RGBA 画像であれば n = width * height * 4 を渡します。

alpha が範囲外の場合は 0.0-1.0 にクランプされます。
%href
simd_pixel_grayscale
%sample
#include "hspmathex.as"
; iron_simd.hsp 経由の利用を推奨
stop

%index
simd_pixel_grayscale
RGBA -> グレースケール変換
%group
hspmathex
%prm
rgba, out, n
rgba : uint8 配列 (RGBA 形式, 長さ n バイト, n は 4 の倍数)
out  : uint8 配列 (長さ n/4, 単一チャンネル)
n    : rgba のバイト数
%inst
BT.601 の輝度重み (0.299R + 0.587G + 0.114B) で RGBA を単一
チャンネル 8bit グレースケールに変換します。
内部では 8bit 固定小数点演算です (77*R + 150*G + 29*B + 128) >> 8。

このルーチンはキャッシュバウンドなため、現状スカラ実装のみを
提供しています (SIMD 化は実測で効果が小さかった)。
%href
simd_pixel_blend
%sample
#include "hspmathex.as"
; iron_simd.hsp 経由の利用を推奨
stop
