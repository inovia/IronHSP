;
; iron_stl.hsp  HSP3 ヘルプ (日本語)
; STL (STereoLithography) ローダ & 描画 (Pure HSP)
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
iron_stl.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_stl.hsp は ASCII / Binary 両フォーマットの STL ファイルを Pure HSP で
読み込み、三角形メッシュとして保持するモジュールです。DxLib の
DrawTriangle3DD と組み合わせて 3D モデルを HSP で描画できます。

  #include "iron_stl.hsp"

保持形式:
  mesh は double 配列、1 三角形あたり 12 要素:
    [0..2]  v0 (x, y, z)
    [3..5]  v1
    [6..8]  v2
    [9..11] normal

ASCII / Binary の自動判別:
  Binary STL の "offset 80 から 4 byte の三角形数 N" から期待ファイル
  サイズ (84 + 50 * N) を計算し一致したら Binary、そうでなければ ASCII
  として解析します。

%group
iron_stl (STL 読込)

%index
stl_load
STL ファイルを読み込む
%prm
var mesh, var n_tri, "file.stl"
mesh : 出力 double 配列 (自動確保)
n_tri : 読み込んだ三角形数
%inst
ASCII / Binary どちらの STL も自動判別で読み込みます。
正常終了時 stat = 0、エラー時 stat < 0 が返ります。



%index
stl_bounds
AABB (bounding box) を計算
%prm
var mesh, n_tri, var mins, var maxs
mins : 3 要素 double (x_min, y_min, z_min)
maxs : 3 要素 double (x_max, y_max, z_max)
%inst
ロードしたメッシュの軸並行バウンディングボックスを計算します。



%index
stl_normalize
メッシュを原点中心 + 指定サイズに正規化
%prm
var mesh, n_tri, target_size
target_size : 正規化後の最大辺長 (m 推奨)
%inst
メッシュを AABB 中心が原点になるよう平行移動し、最大寸法が
target_size になるようスケーリングします。AR でマーカー辺長に合わせて
表示する際に便利です。



%index
stl_draw_dxlib
DxLib で三角形メッシュを描画
%prm
var mesh, n_tri, color, face_flag
color : DxLib のカラー値 (GetColor 等)
face_flag : 0=塗りつぶし / 1=ワイヤーフレーム
%inst
DrawTriangle3DD を内部で n_tri 回呼び出して描画します。
DxLib_Init / SetDrawScreen / 3D カメラ設定は呼び出し側の責務です。
