;
; iron_bigint.hsp  HSP3 ヘルプ (日本語)
; 任意精度整数 (BigInteger)
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
iron_bigint.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_bigint.hsp は hspbigint.dll のラッパです。
Java の BigInteger / Python の int 相当の任意精度整数を
ハンドルベースで扱います。

  #include "iron_bigint.hsp"

依存: hspbigint.dll (または hspbigint_64.dll) を実行ファイルと
同じディレクトリに配置してください。

ハンドル管理:
  各 bi() / bi_* 関数は新しいハンドル (int) を返します。
  使い終わったら bi_free で解放してください。

  プール方式 (推奨): bi_push / bi_pop のブロック内で取得した
  ハンドルは自動的に追跡され、bi_pop で一括解放されます。

    bi_push
      a = bi("100") : b = bi("50")
      c = bi_add(a, b)
      mes bi_str(c)
    bi_pop

%group
iron_bigint (任意精度整数)

%index
bi
文字列から BigInt を生成
%group
iron_bigint
%prm
"text"

%inst
10進数文字列から任意精度整数を生成してハンドルを返します。
先頭に "+" / "-" を付けることも可能です。失敗時 0。

例:
  a = bi("123456789012345678901234567890")
  mes bi_str(a)
  bi_free a

%href
bi_from
bi_str
bi_free

%index
bi_from
int から BigInt を生成
%group
iron_bigint
%prm
value

%inst
32bit 整数から BigInt を生成します。

%index
bi_from64
64bit int から BigInt を生成
%group
iron_bigint
%prm
lo, hi

%inst
64bit 整数 (低位 32bit + 高位 32bit) から BigInt を生成します。

%index
bi_clone
ハンドルを複製
%group
iron_bigint
%prm
h

%inst
既存ハンドルの値を複製した新しいハンドルを返します。

%index
bi_free
ハンドルを解放
%group
iron_bigint
%prm
h

%inst
bi() 等で取得したハンドルを解放します。

%index
bi_push
プール開始
%group
iron_bigint
%prm

%inst
自動解放プールを開始します。以後 bi_* で取得したハンドルは
プールに追跡され、対応する bi_pop で一括解放されます。

%index
bi_pop
プール終了 (一括解放)
%group
iron_bigint
%prm

%inst
bi_push で開始したプール内のハンドルを一括解放します。
bi_push とネストして入れ子にもできます。

%index
bi_str
BigInt を 10進文字列に変換
%group
iron_bigint
%prm
h

%inst
ハンドルの値を 10進文字列に変換して返します (defcfunc)。

%index
bi_hex
BigInt を 16進文字列に変換
%group
iron_bigint
%prm
h

%inst
ハンドルの値を 16進 (大文字) 文字列に変換して返します。

%index
bi_int
BigInt の下位 32bit を整数として取得
%group
iron_bigint
%prm
h

%inst
下位 32bit を int として取得します (オーバーフローは切り捨て)。

%index
bi_int64
BigInt の下位 64bit を lo/hi で取得
%group
iron_bigint
%prm
h, var lo, var hi

%inst
下位 64bit を lo/hi 2つの int に分けて取得します。

%index
bi_bitlen
bit 長を取得
%group
iron_bigint
%prm
h

%inst
絶対値を表現するのに必要な bit 数を返します (0 のとき 0)。

%index
bi_add
BigInt 加算
%group
iron_bigint
%prm
a, b

%inst
a + b を新しいハンドルで返します。

%index
bi_sub
BigInt 減算
%group
iron_bigint
%prm
a, b

%inst
a - b を新しいハンドルで返します。

%index
bi_mul
BigInt 乗算
%group
iron_bigint
%prm
a, b

%inst
a * b を新しいハンドルで返します。

%index
bi_div
BigInt 除算 (商)
%group
iron_bigint
%prm
a, b

%inst
a / b (整数商) を新しいハンドルで返します。0 除算の場合 0。

%index
bi_mod
BigInt 剰余
%group
iron_bigint
%prm
a, b

%inst
a % b を新しいハンドルで返します (符号は被除数 a と同じ / C 流 trunc)。

%index
bi_pow
BigInt 冪乗
%group
iron_bigint
%prm
a, exponent

%inst
a ^ exponent (exponent は通常の int) を返します。
exponent が負の場合は 0 を返します。

例:
  ; 2^1000
  p = bi_pow(bi("2"), 1000)
  mes bi_str(p)

%index
bi_gcd
最大公約数
%group
iron_bigint
%prm
a, b

%inst
|a| と |b| の最大公約数を返します。

%index
bi_abs
絶対値
%group
iron_bigint
%prm
a

%inst
|a| を返します。

%index
bi_neg
符号反転
%group
iron_bigint
%prm
a

%inst
-a を返します (0 は 0 のまま)。

%index
bi_cmp
比較
%group
iron_bigint
%prm
a, b

%inst
a < b なら -1、a = b なら 0、a > b なら 1 を返します。

%index
bi_eq
等値判定
%group
iron_bigint
%prm
a, b

%inst
a = b なら 1、違えば 0。

%index
bi_lt
小なり判定
%group
iron_bigint
%prm
a, b

%inst
a < b なら 1、違えば 0。

%index
bi_gt
大なり判定
%group
iron_bigint
%prm
a, b

%inst
a > b なら 1、違えば 0。

%index
bi_shl
左シフト
%group
iron_bigint
%prm
a, bits

%inst
a << bits を返します。

%index
bi_shr
右シフト
%group
iron_bigint
%prm
a, bits

%inst
a >> bits を返します。

%index
bi_and
ビット AND
%group
iron_bigint
%prm
a, b

%inst
|a| AND |b| を返します (符号は無視)。

%index
bi_or
ビット OR
%group
iron_bigint
%prm
a, b

%inst
|a| OR |b| を返します。

%index
bi_xor
ビット XOR
%group
iron_bigint
%prm
a, b

%inst
|a| XOR |b| を返します。
