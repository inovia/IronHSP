;
; iron_ga.hsp  HSP3 ヘルプ (日本語)
; 遺伝的アルゴリズム
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
iron_ga.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
Pure HSP

%group
AI

%index
ga_init
個体群を初期化
%group
AI
%prm
pop_size, gene_max

%inst
個体群サイズと遺伝子最大値を指定して初期化します。

%href
ga_evaluate

%index
ga_evaluate
適応度を設定
%group
AI
%prm
fitness_arr

%inst
各個体の適応度を配列で設定します。

%href
ga_evolve

%index
ga_evolve
世代を進化
%group
AI
%prm


%inst
トーナメント選択 + 交叉 + 突然変異で次世代を生成します。

%href
ga_best

%index
ga_best
最良個体を取得
%group
AI
%prm
()

%inst
現在の最良個体の遺伝子値を返します。
