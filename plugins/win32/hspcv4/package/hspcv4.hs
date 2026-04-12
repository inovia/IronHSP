;
;   hspcv4.hs - HSP Help Manager 用ヘルプソース
;   hspcv4 プラグイン (OpenCV 4.x) のコマンドリファレンス
;

%type
拡張命令
%ver
0.1
%note
hspcv4.as をインクルードすること。
OpenCV 4.12.0 を静的リンクした 32bit / 64bit DLL です。

%date
2026/04/12
%author
HNWorks / IronHSP
%dll
hspcv4
%url
https://github.com/
%port
Win



;==========================================================================
; 画像の基本操作
;==========================================================================

%index
cv4load
画像ファイルの読み込み
%group
hspcv4 基本命令
%prm
id, filename
id : 画像ハンドル ID (int)
filename : 読み込むファイル名 (string)
%inst
画像ファイルを読み込んで int ハンドル ID に格納します。
ファイル形式は PNG / JPEG / BMP / TIFF / WebP / OpenJPEG が
静的リンクで利用可能です。
読み込み後の画像は常に 3ch BGR 形式になります。
同じ ID に再度 cv4load すると上書きされます。
失敗時は stat に非 0 のエラーコードが入ります。
%href
cv4save,cv4del,cv4info



%index
cv4save
画像ファイルの保存
%group
hspcv4 基本命令
%prm
id, filename
id : 画像ハンドル ID (int)
filename : 保存先ファイル名 (string)
%inst
ハンドル ID の画像を指定したファイルに保存します。
拡張子 (.png / .jpg / .bmp 等) で自動的にフォーマットが決まります。
失敗時は stat に非 0 のエラーコードが入ります。
%href
cv4load



%index
cv4del
画像ハンドルの解放
%group
hspcv4 基本命令
%prm
id
id : 解放するハンドル ID
%inst
指定したハンドル ID に割り当てられていた画像リソースを解放します。
存在しない ID を指定しても害はありません (no-op)。
%href
cv4reset



%index
cv4reset
全ハンドルの解放
%group
hspcv4 基本命令
%inst
すべての画像ハンドルを解放し、開いている OpenCV ウィンドウを
すべて閉じます。プログラム終了時やリセット時に使用します。
%href
cv4del



%index
cv4info
画像情報の取得
%group
hspcv4 基本命令
%prm
id, var_sx, var_sy, var_ch
id : 画像ハンドル ID
var_sx : 幅を受け取る int 変数
var_sy : 高さを受け取る int 変数
var_ch : チャンネル数を受け取る int 変数
%inst
画像ハンドルの幅・高さ・チャンネル数を 3 つの int 変数に格納します。
チャンネル数は通常 1 (グレースケール) または 3 (BGR カラー)。



;==========================================================================
; 色空間・サイズ変換
;==========================================================================

%index
cv4cvt
色空間の変換
%group
hspcv4 基本命令
%prm
dst_id, src_id, code
dst_id : 変換結果を格納するハンドル ID
src_id : 変換元のハンドル ID
code : 変換コード (CV4_BGR2GRAY 等)
%inst
src_id の画像を指定した色空間コードで変換し、結果を dst_id に格納します。
dst_id と src_id は同じハンドルでも構いません。
利用できる変換コードの例:
^p
CV4_BGR2GRAY  : BGR -> グレースケール
CV4_GRAY2BGR  : グレー -> BGR (3ch 化)
CV4_BGR2HSV   : BGR -> HSV
CV4_HSV2BGR   : HSV -> BGR
CV4_BGR2RGB   : BGR -> RGB
CV4_BGR2BGRA  : BGR -> BGRA (4ch 化)
CV4_BGRA2BGR  : BGRA -> BGR
^p



%index
cv4resize
画像のリサイズ
%group
hspcv4 基本命令
%prm
dst_id, src_id, new_w, new_h
dst_id : リサイズ結果を格納するハンドル ID
src_id : リサイズ元のハンドル ID
new_w : 新しい幅 (int)
new_h : 新しい高さ (int)
%inst
src_id の画像を new_w x new_h にリサイズして dst_id に格納します。
補間は双線形 (INTER_LINEAR) 固定です。



;==========================================================================
; HSP 画面との相互転送
;==========================================================================

%index
cv4getimg
HSP画面への転送
%group
hspcv4 基本命令
%prm
id
id : 転送元のハンドル ID
%inst
ハンドル ID の画像を HSP のカレントウィンドウの左上 (0,0) に
貼り付けます。pos 命令の位置は無視されます。
グレースケールや BGRA は自動で 3ch BGR に変換されます。
HSP の DIB 形式 (bottom-up) に合わせて上下反転も自動で行います。
^p
描画後は必ず redraw 0 / redraw 1 で挟むか、
あらかじめ redraw 0 にしてから呼んで redraw 1 で反映してください。
^p
%href
cv4putimg



%index
cv4putimg
HSP画面からの取り込み
%group
hspcv4 基本命令
%prm
id
id : 取り込み先のハンドル ID
%inst
HSP のカレントウィンドウの内容をそのまま BGR カラー画像として
id に取り込みます。HSP の DIB 形式 (bottom-up) は自動で
上下反転され、OpenCV 側では top-down な通常の cv::Mat になります。
%href
cv4getimg



;==========================================================================
; 描画命令
;==========================================================================

%index
cv4line
直線の描画
%group
hspcv4 描画命令
%prm
id, x1, y1, x2, y2, b, g, r, thickness
id : 描画先のハンドル ID
x1, y1, x2, y2 : 始点と終点の座標
b, g, r : 色 (0～255、OpenCV 慣習で B, G, R の順)
thickness : 線の太さ (省略時 1)
%inst
ハンドル ID の画像に直線を描画します。
色は OpenCV の慣習に合わせて B, G, R の順で指定してください。



%index
cv4rect
矩形の描画
%group
hspcv4 描画命令
%prm
id, x, y, w, h, b, g, r, thickness
id : 描画先のハンドル ID
x, y : 矩形の左上座標
w, h : 矩形の幅と高さ
b, g, r : 色
thickness : 線の太さ (-1 を指定すると塗りつぶし)
%inst
ハンドル ID の画像に矩形を描画します。
thickness に -1 を渡すと塗りつぶしになります。



%index
cv4circle
円の描画
%group
hspcv4 描画命令
%prm
id, cx, cy, radius, b, g, r, thickness
id : 描画先のハンドル ID
cx, cy : 中心の座標
radius : 半径
b, g, r : 色
thickness : 線の太さ (-1 で塗りつぶし)
%inst
ハンドル ID の画像に円を描画します。



%index
cv4text
テキストの描画
%group
hspcv4 描画命令
%prm
id, "text", x, y, scale, b, g, r, thickness
id : 描画先のハンドル ID
text : 描画する文字列 (ASCII のみ)
x, y : ベースライン左端の座標
scale : フォントの倍率 (double、1.0 で標準サイズ)
b, g, r : 色
thickness : 線の太さ (省略時 1)
%inst
ハンドル ID の画像に文字列を描画します。
フォントは HERSHEY_SIMPLEX 固定です。
日本語などの非 ASCII 文字は表示できません (文字化けします)。
LINE_AA によるアンチエイリアスが有効になっています。



;==========================================================================
; フィルタ命令
;==========================================================================

%index
cv4blur
平均ぼかし
%group
hspcv4 フィルタ命令
%prm
dst_id, src_id, ksize
dst_id, src_id : ハンドル ID (同一可)
ksize : ぼかしのカーネルサイズ (int、正方形)
%inst
cv::blur を呼んで画像を平均ぼかしします。
dst_id と src_id は同じハンドルでも構いません。



%index
cv4gauss
ガウシアンぼかし
%group
hspcv4 フィルタ命令
%prm
dst_id, src_id, ksize, sigma
dst_id, src_id : ハンドル ID
ksize : カーネルサイズ (奇数推奨、偶数は自動で +1)
sigma : ガウス分布の標準偏差 (double、0.0 で自動)
%inst
cv::GaussianBlur によるガウシアンぼかし。
ksize が偶数だった場合は自動的に奇数に補正されます。



%index
cv4median
メジアンフィルタ
%group
hspcv4 フィルタ命令
%prm
dst_id, src_id, ksize
dst_id, src_id : ハンドル ID
ksize : カーネルサイズ (3 以上の奇数)
%inst
cv::medianBlur によるメジアンフィルタ。
ごま塩ノイズの除去に効果があります。



%index
cv4canny
Canny エッジ検出
%group
hspcv4 フィルタ命令
%prm
dst_id, src_id, thresh1, thresh2, aperture
dst_id, src_id : ハンドル ID
thresh1, thresh2 : 2 つのしきい値 (int)
aperture : Sobel の開口サイズ (省略時 3)
%inst
cv::Canny によるエッジ検出。
src はあらかじめ cv4cvt で CV4_BGR2GRAY によりグレースケール化
しておくことを推奨します。
出力は 1ch の 2 値画像 (エッジ = 255、それ以外 = 0) になります。



%index
cv4thresh
2値化
%group
hspcv4 フィルタ命令
%prm
dst_id, src_id, thresh, maxval, type
dst_id, src_id : ハンドル ID
thresh : しきい値 (int)
maxval : 2 値化後の最大値 (通常 255)
type : 変換タイプ (CV4_THRESH_BINARY 等)
%inst
cv::threshold による 2 値化。
type に指定できる定数:
^p
CV4_THRESH_BINARY      : 標準の 2 値化
CV4_THRESH_BINARY_INV  : 反転 2 値化
CV4_THRESH_TRUNC       : しきい値で切り捨て
CV4_THRESH_TOZERO      : しきい値未満を 0 に
CV4_THRESH_TOZERO_INV  : しきい値以上を 0 に
CV4_THRESH_OTSU        : 大津の方法 (自動しきい値、BINARY 等と OR する)
CV4_THRESH_TRIANGLE    : トライアングル法 (同上)
^p
使用例: cv4thresh dst, src, 0, 255, CV4_THRESH_BINARY | CV4_THRESH_OTSU



;==========================================================================
; 幾何変換
;==========================================================================

%index
cv4flip
画像の反転
%group
hspcv4 幾何変換
%prm
dst_id, src_id, flipcode
dst_id, src_id : ハンドル ID
flipcode : 0=上下反転、1=左右反転、-1=両方
%inst
cv::flip による反転。



%index
cv4rotate
中心回転
%group
hspcv4 幾何変換
%prm
dst_id, src_id, angle, scale
dst_id, src_id : ハンドル ID
angle : 回転角 (double、度単位、反時計回り)
scale : 倍率 (double、省略時 1.0)
%inst
画像の中心を軸として angle 度の回転 + scale 倍の拡縮を行います。
出力サイズは入力と同じ (はみ出した部分は切り捨て)。



%index
cv4crop
画像の切り抜き
%group
hspcv4 幾何変換
%prm
dst_id, src_id, x, y, w, h
dst_id, src_id : ハンドル ID
x, y, w, h : 切り抜く矩形 (ROI)
%inst
src_id の (x, y) から (w x h) の矩形を切り抜き、dst_id に独立な
Mat として格納します。範囲外を指定した場合はエラーになります。



%index
cv4warp
アフィン変換
%group
hspcv4 幾何変換
%prm
dst_id, src_id, m00, m01, m02, m10, m11, m12, out_w, out_h
dst_id, src_id : ハンドル ID
m00～m12 : 2x3 アフィン行列の要素 (double)
out_w, out_h : 出力画像のサイズ
%inst
2x3 のアフィン行列を直接指定して cv::warpAffine を呼びます。
任意の出力サイズを指定できるので、平行移動やせん断にも使えます。



;==========================================================================
; 玄人向け: OpenCV ウィンドウ
;==========================================================================

%index
cv4_show
OpenCVウィンドウに表示
%group
hspcv4 玄人向け
%prm
id, "window_name"
id : ハンドル ID
window_name : ウィンドウタイトル (同名ならそのウィンドウを更新)
%inst
ハンドル ID の画像を OpenCV のウィンドウに表示します (非ブロッキング)。
ウィンドウが存在しなければ cv::namedWindow で新規作成されます。
内部で cv::pollKey を 1 回呼んで即座に描画更新します。
%href
cv4_wait_key,cv4_close_window



%index
cv4_wait_key
キー入力の待機
%group
hspcv4 玄人向け
%prm
var_key, ms
var_key : キーコードを受け取る int 変数 (未押下は -1)
ms : タイムアウト (ミリ秒、0 で無限)
%inst
OpenCV ウィンドウ上でのキー入力を待ちます。
cv::pollKey を 10ms 周期でポーリングする実装のため、HSP の
メインウィンドウのメッセージポンプとは競合しません。
^p
stat = 0 : キーが押された (var_key にキーコード)
stat = 1 : タイムアウト (var_key = -1)
^p
cv::waitKey と違い、HSP の GUI と安全に共存できます。
%href
cv4_show,cv4_close_window



%index
cv4_close_window
OpenCVウィンドウを閉じる
%group
hspcv4 玄人向け
%prm
"window_name"
window_name : 閉じるウィンドウのタイトル
%inst
cv::destroyWindow で指定ウィンドウを閉じます。
%href
cv4_close_all



%index
cv4_close_all
全てのOpenCVウィンドウを閉じる
%group
hspcv4 玄人向け
%inst
cv::destroyAllWindows で開いているすべての OpenCV ウィンドウを
閉じます。
%href
cv4_close_window



;==========================================================================
; 玄人向け: 顔検出
;==========================================================================

%index
cv4_cascade_load
カスケード分類器の読み込み
%group
hspcv4 玄人向け
%prm
cid, "xmlpath"
cid : カスケードハンドル ID (int)
xmlpath : Haar / LBP cascade の XML ファイルパス
%inst
cv::CascadeClassifier::load を呼んでカスケード分類器をロードします。
標準の Haar cascade XML は OpenCV の
build/opencv_install_XX/etc/haarcascades/ ディレクトリに入っています。
%href
cv4_detect,cv4_cascade_free



%index
cv4_cascade_free
カスケード分類器の解放
%group
hspcv4 玄人向け
%prm
cid
cid : カスケードハンドル ID
%inst
カスケードハンドルを解放します。



%index
cv4_detect
物体検出の実行
%group
hspcv4 玄人向け
%prm
cid, img_id, rects_array, var_count, scale, min_neighbors
cid : カスケードハンドル ID
img_id : 検出対象の画像ハンドル ID
rects_array : cv_rect 構造体の配列 (stdim で確保)
var_count : 検出数を受け取る int 変数
scale : スケールファクタ (double、省略時 1.1)
min_neighbors : 近傍検出数 (int、省略時 3)
%inst
cascade.detectMultiScale を呼んで物体検出を実行します。
検出結果の矩形を rects_array に書き込み、検出数を var_count に
格納します。rects_array のサイズを超えた分は切り捨てられます。
^p
使い方の例:
    #include "hspcv4.as"
    stdim rects, cv_rect, 64
    cv4_cascade_load 0, "haarcascade_frontalface_default.xml"
    cv4load 0, "photo.jpg"
    cv4_detect 0, 0, rects, n, 1.1, 3
    repeat n
        cv4rect 0, rects(cnt).x, rects(cnt).y, rects(cnt).w, rects(cnt).h, 0,255,0, 2
    loop
    cv4save 0, "out.jpg"
^p
%href
cv4_cascade_load



;==========================================================================
; 玄人向け: 動画 I/O
;==========================================================================

%index
cv4_video_open
動画ソースを開く
%group
hspcv4 玄人向け
%prm
vid, "path_or_index"
vid : VideoCapture ハンドル ID
path_or_index : カメラ index (数字文字列) またはファイルパス
%inst
cv::VideoCapture::open でカメラまたは動画ファイルを開きます。
"0" / "1" のように数字のみの文字列を指定するとカメラ index として
扱われ、それ以外はファイルパスとして扱われます。
%href
cv4_video_read,cv4_video_close



%index
cv4_video_read
1フレームを読み出す
%group
hspcv4 玄人向け
%prm
vid, frame_id
vid : VideoCapture ハンドル ID
frame_id : 読み出したフレームを格納する Mat ハンドル ID
%inst
1 フレームを読み出して frame_id に格納します。
stat = 0 で成功、stat = 1 で終端 (ファイル終了や読込失敗) です。



%index
cv4_video_info
動画情報の取得
%group
hspcv4 玄人向け
%prm
vid, var_w, var_h, var_fps, var_total
vid : VideoCapture ハンドル ID
var_w, var_h, var_fps, var_total : 情報を格納する int 変数
%inst
VideoCapture の幅・高さ・fps・総フレーム数を 4 つの int 変数に
格納します。カメラなど一部のソースでは var_total = 0 になります。



%index
cv4_video_close
動画ソースを閉じる
%group
hspcv4 玄人向け
%prm
vid
vid : VideoCapture ハンドル ID
%inst
VideoCapture を解放します。



%index
cv4_writer_open
動画ファイルへの書き出し開始
%group
hspcv4 玄人向け
%prm
wid, "path", "fourcc", fps, w, h
wid : VideoWriter ハンドル ID
path : 出力ファイルパス
fourcc : 4 文字のコーデック指定 ("MJPG", "XVID", "mp4v" 等)
fps : フレームレート (double)
w, h : フレームサイズ
%inst
cv::VideoWriter::open で動画ファイルを書き出し用に開きます。
注意: OpenCV 静的ビルドで FFmpeg を含まない場合、利用できる
コーデックが限られます (MJPG が動かない環境もあります)。



%index
cv4_writer_write
1フレームを書き込む
%group
hspcv4 玄人向け
%prm
wid, frame_id
wid : VideoWriter ハンドル ID
frame_id : 書き込むフレームの Mat ハンドル ID
%inst
指定フレームを動画ファイルに書き込みます。
フレームのサイズは cv4_writer_open で指定したサイズと一致する
必要があります。



%index
cv4_writer_close
動画ファイルへの書き出し終了
%group
hspcv4 玄人向け
%prm
wid
wid : VideoWriter ハンドル ID
%inst
VideoWriter を解放し、動画ファイルを閉じます。



;==========================================================================
; 玄人向け: DNN (ONNX 推論)
;==========================================================================

%index
cv4_dnn_load
ONNXモデルの読み込み
%group
hspcv4 玄人向け
%prm
nid, "model.onnx"
nid : DNN ハンドル ID
model.onnx : ONNX 形式のモデルファイルパス
%inst
cv::dnn::readNetFromONNX で ONNX モデルを読み込みます。
%href
cv4_dnn_free,cv4_dnn_set_input



%index
cv4_dnn_free
DNNモデルの解放
%group
hspcv4 玄人向け
%prm
nid
nid : DNN ハンドル ID



%index
cv4_dnn_set_input
入力画像の前処理とセット
%group
hspcv4 玄人向け
%prm
nid, img_id, scale, mean_b, mean_g, mean_r, w, h, swap_rb
nid : DNN ハンドル ID
img_id : 入力画像の Mat ハンドル ID
scale : 画素値のスケール (例: 1.0/255.0 で [0,1] 正規化)
mean_b, mean_g, mean_r : チャンネルごとの平均値 (引き算で正規化)
w, h : 入力サイズ
swap_rb : 非 0 で BGR→RGB スワップ
%inst
cv::dnn::blobFromImage で画像を 4D テンソル (1, C, H, W) に変換し、
Net::setInput で入力レイヤにセットします。
OpenCV 由来のモデルは BGR のままが多いので swap_rb=0、
PyTorch/TensorFlow からエクスポートしたモデルは多くの場合 RGB
なので swap_rb=1 を指定します。



%index
cv4_dnn_forward
推論の実行
%group
hspcv4 玄人向け
%prm
nid, out_id
nid : DNN ハンドル ID
out_id : 出力 blob を格納する Mat ハンドル ID
%inst
cv::dnn::Net::forward を呼んで推論を実行し、結果の blob を
Mat ハンドルとして保存します。
分類タスクの場合は出力 blob は通常 [1, N] (N = クラス数) で、
続けて cv4_dnn_argmax で最大スコアのクラスを取得できます。



%index
cv4_dnn_argmax
分類結果のargmax取得
%group
hspcv4 玄人向け
%prm
out_id, var_class, var_score
out_id : 出力 blob のハンドル ID
var_class : 最大スコアのクラス index を受け取る int 変数
var_score : 最大スコア (x10000 固定小数点) を受け取る int 変数
%inst
出力 blob を 1 行に reshape して argmax を計算し、最大値のクラス
index をスコアを返します。
^p
スコアは HSP の int に収まるよう スコア×10000 の固定小数点で
返されます。HSP 側で /10000.0 することで float 相当のスコアを
得られます。
^p
使い方:
    cv4_dnn_argmax 2, cls, score_x10000
    score = double(score_x10000) / 10000.0
    mes strf("class=%d score=%.4f", cls, score)
