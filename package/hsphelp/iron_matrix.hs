%dll
; iron_matrix 行列演算
%ver
3.8
%date
2026/04/16
%author
IronHSP
%note
純HSP実装。外部DLL不要。
%type
ユーザー定義命令
%group
数学

%index
mat_mul
行列積 C = A * B
%prm
A, B, C, n
%inst
n×n 行列 (double配列)。
%href
mat_identity

%index
mat_identity
単位行列
%prm
M, n
%inst

%href
mat_transpose

%index
mat_transpose
転置行列
%prm
A, B, n
%inst

%href
mat_det2

%index
mat_det2
2x2 行列式
%prm
(A)
%inst

%href
mat_det3

%index
mat_det3
3x3 行列式
%prm
(A)
%inst

%href
vec_dot

%index
vec_dot
内積
%prm
(A, B, n)
%inst

%href
vec_cross

%index
vec_cross
外積 (3D)
%prm
A, B, C
%inst

