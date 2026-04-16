;
; iron_bigdec.hsp  HSP3 ヘルプ (日本語)
; 任意精度 10 進小数演算 (Java BigDecimal 相当)
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
iron_bigdec.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
hspbigdec.dll が必要です。
ハンドルベース設計: 取得したハンドルは使い終わったら
必ず bigdec_release で解放してください。

内部表現:
  値 = unscaled (任意精度整数) × 10^(-scale)

%group
数学

;===========================================================
%index
bigdec
文字列から BigDecimal を生成
%group
数学
%prm
("decimal_str")

%inst
十進文字列から BigDecimal ハンドルを作成します。
指数表記 ("1.5e10") や符号付き ("-0.5") に対応します。

使い終わったハンドルは bigdec_release で解放してください。

%sample
#include "iron_bigdec.hsp"
h = bigdec("3.14159265358979")
mes bigdec_str(h)
bigdec_release h

%href
bigdec_from_d
bigdec_release
bigdec_str

;===========================================================
%index
bigdec_from_d
double 値から BigDecimal を生成
%group
数学
%prm
(val, precision)

%inst
double 値から指定精度の BigDecimal を作成します。
precision は小数点以下桁数 (0 ～ 18)。
double の誤差をそのまま持ち込むので、可能なら bigdec()
に文字列を渡す方が正確です。

%href
bigdec

;===========================================================
%index
bigdec_copy
BigDecimal の複製
%group
数学
%prm
(h)

%inst
既存ハンドル h の複製を作って返します。
元とコピーはそれぞれ独立で、両方とも解放が必要です。

%href
bigdec_release

;===========================================================
%index
bigdec_release
BigDecimal ハンドルの解放
%group
数学
%prm
h

%inst
BigDecimal が使用するメモリを解放します。
計算結果として返されたハンドルも全て解放が必要です。

%href
bigdec

;===========================================================
%index
bigdec_str
BigDecimal を文字列化 (指数表記あり)
%group
数学
%prm
(h)

%inst
BigDecimal を文字列に変換して返します。
非常に大きい/小さい値は Java 同様に 1.23E+10 のような
科学表記になります。

%href
bigdec_plain
bigdec_double

;===========================================================
%index
bigdec_plain
BigDecimal を文字列化 (指数表記なし)
%group
数学
%prm
(h)

%inst
指数表記を使わずに展開した十進文字列を返します。
0.00001 や 123456789000 のような表現になります。

%href
bigdec_str

;===========================================================
%index
bigdec_double
BigDecimal を double へ変換
%group
数学
%prm
(h)

%inst
BigDecimal を double に近似変換して返します。
double の有効桁 (約 15～17 桁) を超える精度は失われます。

%href
bigdec_str

;===========================================================
%index
bigdec_add
BigDecimal の加算
%group
数学
%prm
(a, b)

%inst
a + b の結果を新しいハンドルとして返します。
結果の scale は max(a.scale, b.scale) です。
呼び出し側でハンドルの解放が必要です。

%sample
#include "iron_bigdec.hsp"
a = bigdec("0.1")
b = bigdec("0.2")
c = bigdec_add(a, b)
mes bigdec_str(c)      ; → 0.3 (double の誤差無し)
bigdec_release a
bigdec_release b
bigdec_release c

%href
bigdec_sub
bigdec_mul
bigdec_div

;===========================================================
%index
bigdec_sub
BigDecimal の減算
%group
数学
%prm
(a, b)

%inst
a - b の結果を新しいハンドルとして返します。

%href
bigdec_add

;===========================================================
%index
bigdec_mul
BigDecimal の乗算
%group
数学
%prm
(a, b)

%inst
a × b の結果を新しいハンドルとして返します。
結果の scale は a.scale + b.scale になります。
(Java BigDecimal.multiply と同じ挙動)

%href
bigdec_div

;===========================================================
%index
bigdec_div
BigDecimal の除算
%group
数学
%prm
(a, b, precision, rounding_mode)

%inst
a ÷ b を計算し、小数点以下 precision 桁で rounding_mode に
従って丸めた新しいハンドルを返します。
b = 0 の場合は 0 が返ります。

rounding_mode:
  BIGDEC_HALF_UP   (0) 四捨五入
  BIGDEC_HALF_EVEN (1) 銀行丸め (偶数丸め)
  BIGDEC_DOWN      (2) 0 方向へ切り捨て
  BIGDEC_UP        (3) 0 から遠ざける方向へ切り上げ
  BIGDEC_FLOOR     (4) -∞ 方向へ
  BIGDEC_CEILING   (5) +∞ 方向へ

%sample
#include "iron_bigdec.hsp"
a = bigdec("1")
b = bigdec("3")
q = bigdec_div(a, b, 30, BIGDEC_HALF_UP)
mes bigdec_str(q)
; → 0.333333333333333333333333333333
bigdec_release a
bigdec_release b
bigdec_release q

%href
bigdec_mul
bigdec_round

;===========================================================
%index
bigdec_pow
BigDecimal のべき乗
%group
数学
%prm
(a, exp)

%inst
a の exp 乗を返します (exp は非負整数)。
結果の scale は a.scale × exp になります。
負の指数には未対応。

%href
bigdec_sqrt

;===========================================================
%index
bigdec_abs
BigDecimal の絶対値
%group
数学
%prm
(a)

%inst
|a| を返します。

%href
bigdec_neg

;===========================================================
%index
bigdec_neg
BigDecimal の符号反転
%group
数学
%prm
(a)

%inst
-a を返します。

%href
bigdec_abs

;===========================================================
%index
bigdec_round
BigDecimal を指定桁で丸める
%group
数学
%prm
(a, precision, mode)

%inst
a を小数点以下 precision 桁まで丸めた新しいハンドルを返します。
mode は bigdec_div と同じ丸めモード定数。

%href
bigdec_rescale

;===========================================================
%index
bigdec_rescale
BigDecimal の scale 再設定
%group
数学
%prm
(a, new_scale, mode)

%inst
a の scale を new_scale に変更した新しいハンドルを返します。
scale を大きくする場合は末尾に 0 を追加、小さくする場合は
mode に従って丸めます。

%href
bigdec_round
bigdec_scale

;===========================================================
%index
bigdec_cmp
BigDecimal の比較
%group
数学
%prm
(a, b)

%inst
a < b なら -1、a == b なら 0、a > b なら 1 を返します。
スケール差 (例: "1.0" と "1.00") は無視して数値として比較します。

%href
bigdec_add

;===========================================================
%index
bigdec_scale
BigDecimal のスケール取得
%group
数学
%prm
(h)

%inst
BigDecimal の scale (小数点以下の桁数) を返します。
"3.14159" なら 5、"1000" なら 0、"1.5e10" なら -9 など。

%href
bigdec_precision

;===========================================================
%index
bigdec_precision
BigDecimal の有効桁数取得
%group
数学
%prm
(h)

%inst
unscaled 値の十進表現に含まれる桁数 (有効桁数) を返します。
0 の場合は 1 を返します。

%href
bigdec_scale

;===========================================================
%index
bigdec_sqrt
BigDecimal の平方根
%group
数学
%prm
(a, precision)

%inst
√a を Newton 法で計算し、小数点以下 precision 桁まで
求めた新しいハンドルを返します。
a が負の場合は 0 が返ります。

%sample
#include "iron_bigdec.hsp"
two = bigdec("2")
r = bigdec_sqrt(two, 50)
mes bigdec_str(r)
; → 1.41421356237309504880168872420969807856967187537694
bigdec_release two
bigdec_release r

%href
bigdec_pow
