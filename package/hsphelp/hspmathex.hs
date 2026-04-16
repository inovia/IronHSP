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
hspmathex.dll は以下の 2 つの機能を 1 つの DLL で提供します。

(1) HSPVAR 拡張型 — 通常の変数と同じ感覚で使える任意精度数値型

  #include "hspmathex.as"

  追加される変数型:
    bigint  … 任意精度整数         (Java の BigInteger 相当)
    bigdec  … 任意精度10進固定小数 (Java の BigDecimal 相当)

  これらの型の変数は + - * / 等の演算子で自然に書けます。
  文字列化は str()、型名は vartype() で取得できます。

(2) ハンドルベース API — 従来のスタイル

  bi_*       : BigInt 操作 (bi_create_str / bi_add / bi_mul / ...)
  bigdec_*   : BigDecimal 操作 (bigdec_create / bigdec_div / bigdec_sqrt / ...)
  simd_*     : SIMD (AVX2) ベクトル演算

依存: hspmathex.dll (x64 では hspmathex_64.dll) を実行ファイルと同じ
ディレクトリに配置してください。

サンプル:
  #include "hspmathex.as"
  a = bigint("12345678901234567890")
  b = bigint("99999999999999999999")
  c = a + b
  mes str(c)
  mes vartype(a)
  stop

%index
bigint
任意精度整数値を生成
%group
hspmathex
%prm
"decimal_str"
"decimal_str" : 10進文字列表現 ("-" 先頭可)
%inst
bigint("...") は任意精度整数 (bigint 型) を生成します。
生成された値は通常の変数に代入でき、+ - * / \ & | ^ == != 等の演算子が
使えます。

  a = bigint("100")
  b = bigint("200")
  c = a + b           ; => 300 (bigint 型)
  mes str(c)
  mes vartype(a)      ; => "bigint"

%href
bigdec
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
任意精度10進固定小数値を生成
%group
hspmathex
%prm
"decimal_str"
"decimal_str" : 10進文字列表現 (符号・小数点・指数表記 "e"/"E" が使える)
%inst
bigdec("...") は任意精度10進固定小数 (bigdec 型) を生成します。
10進の小数点以下を正確に保持するので、金額計算などに使えます。

  pi = bigdec("3.141592653589793238462643383279")
  r  = bigdec("10")
  c  = pi * r * bigdec("2")      ; 円周
  mes str(c)
  mes vartype(pi)                ; => "bigdec"

除算 (/) は 30 桁で切り捨てです。

%href
bigint
%sample
#include "hspmathex.as"
a = bigdec("0.1")
b = bigdec("0.2")
c = a + b
mes "a = "+str(a)
mes "b = "+str(b)
mes "a+b = "+str(c)   ; 浮動小数点と違い、正確に 0.3 になる
stop
