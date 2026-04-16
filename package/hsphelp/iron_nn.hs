;
; iron_nn.hsp  HSP3 ヘルプ (日本語)
; ニューラルネットワーク
;

%type
拡張命令
%ver
3.8
%date
2026/04/17
%author
IronHSP
%dll
iron_nn.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
AI

%index
nn_sigmoid
シグモイド関数
%group
AI
%prm
(x)

%inst
0.0～1.0 の値を返します。

%href
nn_predict

%index
nn_predict
パーセプトロン予測
%group
AI
%prm
(x1, x2, w1, w2, bias)

%inst
2入力パーセプトロンの出力を返します。

%href
nn_train_xor

%index
nn_train_xor
XOR学習
%group
AI
%prm
weights, epochs

%inst
XOR問題を指定エポック数で学習します。
