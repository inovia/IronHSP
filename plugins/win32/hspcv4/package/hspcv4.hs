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
        cv4rect 0, rects(cnt)->x, rects(cnt)->y, rects(cnt)->w, rects(cnt)->h, 0,255,0, 2
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



;==========================================================================
; Phase 3 : morphology / gradient / histogram / thresholding / hough /
;           template matching / pyramids / Mat accessors
;==========================================================================

%index
cv4_erode
モルフォロジー収縮
%group
hspcv4 モルフォロジー
%prm
dst_id, src_id, shape, ksize, iterations
dst_id, src_id : ハンドル ID
shape : 構造要素形状 (CV4_MORPH_RECT / CROSS / ELLIPSE)
ksize : 構造要素サイズ (int、奇数推奨)
iterations : 繰り返し回数 (省略時 1)
%inst
cv::erode による収縮フィルタ。前景 (明るい領域) が縮みます。
ノイズ除去、対象の輪郭分離などに使います。
%href
cv4_dilate,cv4_morph_open,cv4_morph_close



%index
cv4_dilate
モルフォロジー膨張
%group
hspcv4 モルフォロジー
%prm
dst_id, src_id, shape, ksize, iterations
dst_id, src_id : ハンドル ID
shape : 構造要素形状 (CV4_MORPH_RECT / CROSS / ELLIPSE)
ksize : 構造要素サイズ
iterations : 繰り返し回数 (省略時 1)
%inst
cv::dilate による膨張フィルタ。前景が広がります。
細線のつながりを太らせる、輪郭の穴埋めなどに使います。
%href
cv4_erode



%index
cv4_morph_open
オープニング (収縮→膨張)
%group
hspcv4 モルフォロジー
%prm
dst_id, src_id, shape, ksize
%inst
cv::morphologyEx(MORPH_OPEN)。小さいノイズ点の除去に効果的。
%href
cv4_morph_close



%index
cv4_morph_close
クロージング (膨張→収縮)
%group
hspcv4 モルフォロジー
%prm
dst_id, src_id, shape, ksize
%inst
cv::morphologyEx(MORPH_CLOSE)。前景内の小さい穴の埋めに効果的。
%href
cv4_morph_open



%index
cv4_morph_gradient
モルフォロジー勾配
%group
hspcv4 モルフォロジー
%prm
dst_id, src_id, shape, ksize
%inst
cv::morphologyEx(MORPH_GRADIENT)。膨張と収縮の差分で輪郭を抽出。



%index
cv4_morph_tophat
トップハット変換
%group
hspcv4 モルフォロジー
%prm
dst_id, src_id, shape, ksize
%inst
cv::morphologyEx(MORPH_TOPHAT)。src とオープニングの差分。
明るい小さい物体を抽出するのに使います。



%index
cv4_morph_blackhat
ブラックハット変換
%group
hspcv4 モルフォロジー
%prm
dst_id, src_id, shape, ksize
%inst
cv::morphologyEx(MORPH_BLACKHAT)。クロージングと src の差分。
暗い小さい物体を抽出するのに使います。



%index
cv4_sobel
Sobel 勾配
%group
hspcv4 勾配オペレータ
%prm
dst_id, src_id, dx, dy, ksize
dx, dy : 微分次数 (0 か 1 を指定)
ksize : Sobel カーネルサイズ (省略時 3)
%inst
cv::Sobel で x / y 方向の勾配を計算。内部で convertScaleAbs により
CV_8U に正規化して返します。



%index
cv4_scharr
Scharr 勾配
%group
hspcv4 勾配オペレータ
%prm
dst_id, src_id, dx, dy
%inst
cv::Scharr で勾配を計算。ksize=3 の Sobel より精度の高い
オペレータです。内部で convertScaleAbs で正規化します。



%index
cv4_laplacian
ラプラシアン
%group
hspcv4 勾配オペレータ
%prm
dst_id, src_id, ksize
%inst
cv::Laplacian で 2 階微分のエッジを計算。convertScaleAbs で正規化。



%index
cv4_equalize_hist
ヒストグラム平坦化
%group
hspcv4 ヒストグラム
%prm
dst_id, src_id
%inst
cv::equalizeHist でグレースケール画像のコントラストを平坦化します。
入力がカラーの場合は内部でグレースケールに変換します。



%index
cv4_clahe
適応的ヒストグラム平坦化 (CLAHE)
%group
hspcv4 ヒストグラム
%prm
dst_id, src_id, clip_limit, grid
clip_limit : コントラスト制限値 (double、2.0 が標準)
grid : タイル分割数 (8 で 8x8 のグリッド)
%inst
cv::createCLAHE による適応的ヒストグラム平坦化。
画像を小さいタイルに分割し、各タイルで個別に平坦化を行うため、
明暗差の大きい画像でも局所的なコントラスト改善が期待できます。



%index
cv4_normalize
正規化
%group
hspcv4 ヒストグラム
%prm
dst_id, src_id, alpha, beta, norm_type
alpha, beta : 出力範囲 (double)
norm_type : 正規化タイプ (CV4_NORM_MINMAX / L1 / L2 / INF)
%inst
cv::normalize。MINMAX の場合は [alpha, beta] の範囲に線形スケーリング、
L1/L2 の場合は alpha をノルム値として正規化します。



%index
cv4_lut
ルックアップテーブル変換
%group
hspcv4 ヒストグラム
%prm
dst_id, src_id, lut_var
lut_var : 256 要素の int 配列 (0～255 の値)
%inst
cv::LUT による画素値変換。lut_var[入力値] が出力値になります。
γ補正、色反転、特定の色域調整などに使用します。
例: 色反転なら lut(i) = 255 - i



%index
cv4_adaptive_thresh
適応二値化
%group
hspcv4 フィルタ命令
%prm
dst_id, src_id, maxval, adaptive_method, thresh_type, block_size, C
maxval : 2 値化の最大値 (通常 255)
adaptive_method : CV4_ADAPTIVE_MEAN_C / CV4_ADAPTIVE_GAUSSIAN_C
thresh_type : CV4_THRESH_BINARY / CV4_THRESH_BINARY_INV
block_size : 局所領域のサイズ (奇数)
C : 局所平均から引く値 (double)
%inst
cv::adaptiveThreshold。画像全体で 1 つのしきい値ではなく、
局所領域ごとにしきい値を決めて 2 値化します。
照明ムラのある画像の 2 値化に強いです。



%index
cv4_distance_transform
距離変換
%group
hspcv4 フィルタ命令
%prm
dst_id, src_id, distance_type, mask_size
distance_type : CV4_DIST_L1 / L2 / C
mask_size : 3 か 5
%inst
cv::distanceTransform。src は 8-bit 1ch の 2 値画像を想定。
各前景ピクセルから最寄りの背景ピクセルまでの距離を計算して
0..255 に正規化します。



%index
cv4_hough_lines
Hough 直線検出
%group
hspcv4 Hough 変換
%prm
out_mat_id, src_id, rho, theta, threshold
src_id : 2 値エッジ画像 (cv4_canny の結果など)
rho : 動径分解能 (double、ピクセル単位)
theta : 角度分解能 (double、ラジアン)
threshold : 検出しきい値 (int)
%inst
cv::HoughLines で直線を検出します。結果は Nx2 の CV_32F Mat
(rho, theta の対) として返されます。cv4_mat_shape と
cv4_mat_getf で読んでください。



%index
cv4_hough_linesp
確率的 Hough 直線検出
%group
hspcv4 Hough 変換
%prm
out_mat_id, src_id, rho, theta, threshold, min_len, max_gap
min_len : 検出する線分の最小長
max_gap : 同一線分とみなす最大ギャップ
%inst
cv::HoughLinesP。通常の HoughLines より速く、結果は
Nx4 の CV_32S Mat (x1, y1, x2, y2) として返されます。



%index
cv4_hough_circles
Hough 円検出
%group
hspcv4 Hough 変換
%prm
out_mat_id, src_id, dp, min_dist, param1, param2, min_radius, max_radius
dp : アキュムレータ分解能 (1.0 で入力と同じ)
min_dist : 検出する円同士の最小距離
param1 : Canny の高しきい値
param2 : アキュムレータしきい値
min_radius, max_radius : 検出する円の半径範囲
%inst
cv::HoughCircles で円を検出します。結果は Nx3 の CV_32F Mat
(cx, cy, radius)。内部で HOUGH_GRADIENT モードを使用。



%index
cv4_match_template
テンプレートマッチング
%group
hspcv4 フィルタ命令
%prm
out_mat_id, src_id, templ_id, method
method : CV4_TM_SQDIFF / _NORMED / CCORR / CCORR_NORMED / CCOEFF / CCOEFF_NORMED
%inst
cv::matchTemplate。src の中で templ と一致する位置を探索します。
結果は類似度マップで、最大(または最小)値の座標を
cv4_min_max_loc で取得します。



%index
cv4_pyr_up
画像ピラミッド拡大
%group
hspcv4 幾何変換
%prm
dst_id, src_id
%inst
cv::pyrUp により src を 2 倍に拡大 (ガウシアンブラー経由)。



%index
cv4_pyr_down
画像ピラミッド縮小
%group
hspcv4 幾何変換
%prm
dst_id, src_id
%inst
cv::pyrDown により src を 1/2 に縮小 (ガウシアンブラー経由)。



%index
cv4_mat_shape
Mat のサイズ情報取得
%group
hspcv4 Mat アクセッサ
%prm
id, var_rows, var_cols, var_type, var_channels
%inst
Mat の行数、列数、型、チャネル数を 4 つの int 変数に格納します。
Hough 結果や DNN 出力など、何が入っているか分からない Mat の
形を調べるのに使います。



%index
cv4_mat_geti
Mat の整数ピクセル値取得
%group
hspcv4 Mat アクセッサ
%prm
id, row, col, var_value
%inst
整数型 (CV_8U / CV_8S / CV_16U / CV_16S / CV_32S) の Mat から
(row, col) のピクセル値を int 変数に格納します。1ch 専用。



%index
cv4_mat_getf
Mat の浮動小数点ピクセル値取得
%group
hspcv4 Mat アクセッサ
%prm
id, row, col, var_value_x10000
%inst
浮動小数点型 (CV_32F / CV_64F) の Mat から (row, col) のピクセル値を
取得し、値 × 10000 の int 固定小数点として var_value_x10000 に格納します。
HSP 側で /10000.0 で double に戻してください。



%index
cv4_min_max_loc
Mat の最小値・最大値と位置
%group
hspcv4 Mat アクセッサ
%prm
id, var_min_x10000, var_max_x10000, var_min_x, var_min_y, var_max_x, var_max_y
%inst
cv::minMaxLoc で Mat の最小/最大値とその座標を取得します。
値は x10000 固定小数点 (HSP int)、座標は普通の int です。
cv4_match_template の結果から最適位置を求めるのに使います。



;==========================================================================
; Phase 4 : core Mat operations (arithmetic / bitwise / stats / channels)
;==========================================================================

%index
cv4_add
Mat の加算
%group
hspcv4 Mat 演算
%prm
dst_id, a_id, b_id
%inst
cv::add(a, b)。飽和演算付き (0..255 にクランプ)。



%index
cv4_sub
Mat の減算
%group
hspcv4 Mat 演算
%prm
dst_id, a_id, b_id
%inst
cv::subtract(a, b)。飽和演算付き。



%index
cv4_mul
Mat の乗算
%group
hspcv4 Mat 演算
%prm
dst_id, a_id, b_id, scale
scale : 乗算後のスケーリング係数 (double、省略時 1.0)
%inst
cv::multiply。要素ごとの乗算。



%index
cv4_div
Mat の除算
%group
hspcv4 Mat 演算
%prm
dst_id, a_id, b_id, scale
%inst
cv::divide。要素ごとの除算。



%index
cv4_abs_diff
Mat の絶対差分
%group
hspcv4 Mat 演算
%prm
dst_id, a_id, b_id
%inst
cv::absdiff(a, b)。|a - b| を計算。動体検知などに使用。



%index
cv4_add_weighted
重み付き加算
%group
hspcv4 Mat 演算
%prm
dst_id, a_id, alpha, b_id, beta, gamma
%inst
cv::addWeighted。dst = a * alpha + b * beta + gamma。
画像のブレンドやクロスフェードに。



%index
cv4_add_scalar
スカラーの加算
%group
hspcv4 Mat 演算
%prm
dst_id, src_id, s_b, s_g, s_r
%inst
cv::add(src, Scalar(b, g, r))。src の各画素に一様な値を加算。



%index
cv4_mul_scalar
スカラー倍
%group
hspcv4 Mat 演算
%prm
dst_id, src_id, scale
%inst
src の全画素を scale 倍します。convertTo を使用。



%index
cv4_bit_and
ビットごとの AND
%group
hspcv4 ビット演算
%prm
dst_id, a_id, b_id



%index
cv4_bit_or
ビットごとの OR
%group
hspcv4 ビット演算
%prm
dst_id, a_id, b_id



%index
cv4_bit_xor
ビットごとの XOR
%group
hspcv4 ビット演算
%prm
dst_id, a_id, b_id



%index
cv4_bit_not
ビットごとの NOT
%group
hspcv4 ビット演算
%prm
dst_id, src_id



%index
cv4_compare
要素ごとの比較
%group
hspcv4 Mat 演算
%prm
dst_id, a_id, b_id, cmp_op
cmp_op : CV4_CMP_EQ / GT / GE / LT / LE / NE
%inst
cv::compare。条件を満たす画素は 255、それ以外は 0 の Mat を返します。



%index
cv4_mean
平均値
%group
hspcv4 統計
%prm
id, var_mean_b_x10000, var_mean_g_x10000, var_mean_r_x10000
%inst
cv::mean。チャネルごとの平均値を x10000 固定小数点で返します。
1ch 画像の場合は var_mean_b にのみ有効値が入ります。



%index
cv4_sum
合計値
%group
hspcv4 統計
%prm
id, var_sum_b, var_sum_g, var_sum_r
%inst
cv::sum。チャネルごとの合計値を int でそのまま格納します
(オーバーフローに注意)。



%index
cv4_count_nonzero
非ゼロ画素数
%group
hspcv4 統計
%prm
id, var_count
%inst
cv::countNonZero。画像内の値が 0 でない画素の数を返します。
カラー画像の場合はグレースケールに変換してから計算します。



%index
cv4_split
チャネル分離
%group
hspcv4 Mat 演算
%prm
src_id, b_id, g_id, r_id
%inst
cv::split。3ch の画像を B/G/R の 1ch 画像 3 枚に分解します。



%index
cv4_merge
チャネル結合
%group
hspcv4 Mat 演算
%prm
dst_id, b_id, g_id, r_id
%inst
cv::merge。1ch 画像 3 枚を 1 つの 3ch 画像に結合します。



%index
cv4_mat_zeros
0 で初期化した Mat の作成
%group
hspcv4 Mat 演算
%prm
dst_id, rows, cols, channels
channels : 1 または 3 (CV_8UC1 / CV_8UC3)
%inst
指定サイズ・チャネル数の全 0 Mat を作成します。



%index
cv4_mat_full
指定色で塗りつぶした Mat の作成
%group
hspcv4 Mat 演算
%prm
dst_id, rows, cols, b, g, r
%inst
3ch CV_8U の Mat を作成して Scalar(b, g, r) で塗りつぶします。



%index
cv4_copy_masked
マスク付きコピー
%group
hspcv4 Mat 演算
%prm
dst_id, src_id, mask_id
%inst
cv::Mat::copyTo(dst, mask)。mask の非 0 部分のみ src を dst に
コピーします。dst が空でなければ既存の内容を保持します。



;==========================================================================
; Phase 5 : contours and shape analysis
;==========================================================================

%index
cv4_find_contours
輪郭の検出
%group
hspcv4 輪郭解析
%prm
cid, src_id, mode, method
cid : contour set のハンドル ID
src_id : 2 値画像 (1ch)
mode : CV4_RETR_EXTERNAL / LIST / CCOMP / TREE
method : CV4_CHAIN_APPROX_NONE / SIMPLE / TC89_L1 / TC89_KCOS
%inst
cv::findContours で輪郭集合を検出し、cid に格納します。
検出後は cv4_contours_count と各種アクセッサで個々の輪郭を
参照できます。
%href
cv4_contours_count,cv4_draw_contours,cv4_bounding_rect



%index
cv4_contours_free
contour set の解放
%group
hspcv4 輪郭解析
%prm
cid



%index
cv4_contours_count
輪郭の個数取得
%group
hspcv4 輪郭解析
%prm
cid, var_count



%index
cv4_draw_contours
輪郭の描画
%group
hspcv4 輪郭解析
%prm
dst_id, cid, index, b, g, r, thickness
index : 描画する輪郭の番号 (-1 で全輪郭)
%inst
cv::drawContours で輪郭を描画します。



%index
cv4_contour_area
輪郭の面積
%group
hspcv4 輪郭解析
%prm
cid, index, var_area
%inst
cv::contourArea。輪郭で囲まれた領域の面積を int で返します。



%index
cv4_contour_length
輪郭の周囲長
%group
hspcv4 輪郭解析
%prm
cid, index, closed, var_length_x100
closed : 閉曲線なら 1、開いた線なら 0
%inst
cv::arcLength。周囲長を長さ × 100 の固定小数点で返します。



%index
cv4_bounding_rect
外接矩形
%group
hspcv4 輪郭解析
%prm
cid, index, var_x, var_y, var_w, var_h
%inst
cv::boundingRect。輪郭を囲む軸並行矩形の x, y, w, h を返します。



%index
cv4_min_area_rect
最小面積外接矩形
%group
hspcv4 輪郭解析
%prm
cid, index, var_cx_x10, var_cy_x10, var_w_x10, var_h_x10, var_angle_x100
%inst
cv::minAreaRect。輪郭を囲む最小面積の回転矩形。中心 / サイズは x10、
角度は x100 の固定小数点で返します。



%index
cv4_min_enclosing_circle
最小外接円
%group
hspcv4 輪郭解析
%prm
cid, index, var_cx_x10, var_cy_x10, var_r_x10
%inst
cv::minEnclosingCircle。輪郭を囲む最小の円。中心 / 半径は x10 固定小数点。



%index
cv4_approx_poly_dp
多角形近似
%group
hspcv4 輪郭解析
%prm
src_cid, index, dst_cid, epsilon, closed
epsilon : 近似精度 (double、小さいほど正確)
%inst
cv::approxPolyDP。Douglas-Peucker アルゴリズムで輪郭を多角形に
単純化します。結果は dst_cid に 1 つの輪郭として格納されます。



%index
cv4_convex_hull
凸包
%group
hspcv4 輪郭解析
%prm
src_cid, index, dst_cid
%inst
cv::convexHull。輪郭の凸包を dst_cid に格納します。



%index
cv4_contour_size
輪郭の頂点数
%group
hspcv4 輪郭解析
%prm
cid, index, var_n



%index
cv4_contour_point
輪郭の特定頂点座標
%group
hspcv4 輪郭解析
%prm
cid, index, pt_idx, var_x, var_y



%index
cv4_moments
モーメントから重心と面積
%group
hspcv4 輪郭解析
%prm
cid, index, var_cx_x10, var_cy_x10, var_m00
%inst
cv::moments。重心座標を x10 固定小数点で、0 次モーメント
(面積 m00) を int で返します。



;==========================================================================
; Phase 6 : features2d (ORB / AKAZE / SIFT / matchers)
;==========================================================================

%index
cv4_orb_detect_compute
ORB 特徴点検出
%group
hspcv4 特徴点
%prm
kp_id, desc_id, img_id, nfeatures
nfeatures : 最大特徴点数 (省略時 500)
%inst
cv::ORB::create で検出器を生成し detectAndCompute を呼びます。
キーポイント集合を kp_id、記述子 Mat を desc_id に格納します。
%href
cv4_kp_get,cv4_bf_match



%index
cv4_akaze_detect_compute
AKAZE 特徴点検出
%group
hspcv4 特徴点
%prm
kp_id, desc_id, img_id



%index
cv4_sift_detect_compute
SIFT 特徴点検出
%group
hspcv4 特徴点
%prm
kp_id, desc_id, img_id, nfeatures



%index
cv4_good_features_to_track
コーナー検出 (Shi-Tomasi)
%group
hspcv4 特徴点
%prm
kp_id, img_id, max_corners, quality_level, min_distance
%inst
cv::goodFeaturesToTrack。良好なコーナー候補を検出して
キーポイント集合として kp_id に格納します。オプティカルフロー
(cv4_optflow_lk) の入力として使うことができます。



%index
cv4_corner_harris
Harris コーナー応答
%group
hspcv4 特徴点
%prm
dst_id, src_id, block_size, ksize, k
%inst
cv::cornerHarris。コーナー応答値を計算した Mat を返します。
しきい値処理で実際のコーナー位置を取り出します。



%index
cv4_bf_match
総当たりマッチング
%group
hspcv4 特徴点
%prm
match_id, desc1_id, desc2_id, norm_type
norm_type : CV4_NORM_L2 (SIFT 用) / CV4_NORM_HAMMING (ORB/AKAZE 用)
%inst
cv::BFMatcher (crossCheck=true) で 2 つの記述子集合をマッチング
します。結果は match set として match_id に格納されます。



%index
cv4_kp_free
キーポイント集合の解放
%group
hspcv4 特徴点
%prm
kp_id



%index
cv4_kp_count
キーポイント数
%group
hspcv4 特徴点
%prm
kp_id, var_n



%index
cv4_kp_get
特定キーポイントの情報取得
%group
hspcv4 特徴点
%prm
kp_id, idx, var_x_x10, var_y_x10, var_size_x10, var_angle_x100, var_response_x10000
%inst
キーポイント[idx] の座標、スケール、主軸方向、検出応答を
それぞれ固定小数点で返します。



%index
cv4_match_free
マッチ集合の解放
%group
hspcv4 特徴点
%prm
match_id



%index
cv4_match_count
マッチ数
%group
hspcv4 特徴点
%prm
match_id, var_n



%index
cv4_match_get
特定マッチの情報取得
%group
hspcv4 特徴点
%prm
match_id, idx, var_query_idx, var_train_idx, var_distance_x10000



%index
cv4_draw_keypoints
キーポイントの描画
%group
hspcv4 特徴点
%prm
dst_id, src_id, kp_id, flags
flags : cv::DrawMatchesFlags (0=既定、4=RICH で方向付き描画)
%inst
cv::drawKeypoints でキーポイントを画像に描画します。



%index
cv4_draw_matches
マッチの描画
%group
hspcv4 特徴点
%prm
dst_id, img1_id, kp1_id, img2_id, kp2_id, match_id
%inst
cv::drawMatches で 2 枚の画像を横並びにして対応点を線で結びます。



;==========================================================================
; Phase 7 : photo module (denoising / inpaint / bilateral / stylization)
;==========================================================================

%index
cv4_bilateral
バイラテラルフィルタ
%group
hspcv4 フィルタ命令
%prm
dst_id, src_id, d, sigma_color, sigma_space
d : 周辺領域の直径
sigma_color : 色空間の分散
sigma_space : 座標空間の分散
%inst
cv::bilateralFilter。エッジを保存しつつ平滑化する高級フィルタ。



%index
cv4_denoise
ノイズ除去 (Non-Local Means)
%group
hspcv4 フィルタ命令
%prm
dst_id, src_id, h, template_window, search_window
%inst
cv::fastNlMeansDenoising(Colored)。チャネル数に応じて自動選択します。
h は強度パラメータ (10 前後が標準)。



%index
cv4_inpaint
画像の修復 (インペイント)
%group
hspcv4 フィルタ命令
%prm
dst_id, src_id, mask_id, radius, method
method : 0=TELEA, 1=NS (Navier-Stokes)
%inst
cv::inpaint。mask の非 0 部分を周囲から補間して修復します。
傷消し、ロゴ消しなどに使用。



%index
cv4_seamless_clone
シームレスクローン
%group
hspcv4 photo
%prm
dst_id, src_id, dst_base_id, mask_id, cx, cy, flags
flags : 1=NORMAL_CLONE, 2=MIXED_CLONE, 3=MONOCHROME_TRANSFER
%inst
cv::seamlessClone。src の mask 部分を dst_base の (cx, cy) 中心に
シームレスに合成します。パスパウェル合成の OpenCV 実装。



%index
cv4_decolor
カラー→グレー変換 (知覚ベース)
%group
hspcv4 photo
%prm
dst_gray_id, src_id
%inst
cv::decolor。BGR2GRAY より知覚的に良好なグレー画像を生成します。



%index
cv4_detail_enhance
ディテール強調
%group
hspcv4 photo
%prm
dst_id, src_id, sigma_s, sigma_r



%index
cv4_edge_preserve
エッジ保存フィルタ
%group
hspcv4 photo
%prm
dst_id, src_id, flags, sigma_s, sigma_r
flags : 1=RECURS_FILTER, 2=NORMCONV_FILTER
%inst
cv::edgePreservingFilter。バイラテラルの高速版のような効果。



%index
cv4_stylization
スタイライズ (絵画風)
%group
hspcv4 photo
%prm
dst_id, src_id, sigma_s, sigma_r
%inst
cv::stylization。入力画像を絵画風に変換します。



%index
cv4_pencil_sketch
鉛筆画風変換
%group
hspcv4 photo
%prm
dst_gray_id, dst_color_id, src_id, sigma_s, sigma_r, shade_factor
%inst
cv::pencilSketch。グレースケールとカラーの 2 種類の鉛筆画風画像を
同時に生成します。



;==========================================================================
; Phase 8 : video (optical flow / bg sub / trackers)
;==========================================================================

%index
cv4_optflow_farneback
Farneback 密オプティカルフロー
%group
hspcv4 動画解析
%prm
flow_mat_id, prev_id, next_id
%inst
cv::calcOpticalFlowFarneback。2 枚のフレーム間のすべての画素の
動きベクトルを計算します。結果は HxWx2 の CV_32F Mat
(dx, dy) として返されます。



%index
cv4_optflow_lk
Lucas-Kanade 疎オプティカルフロー
%group
hspcv4 動画解析
%prm
out_kp_id, status_mat_id, prev_id, next_id, prev_kp_id
prev_kp_id : 追跡元のキーポイント集合
%inst
cv::calcOpticalFlowPyrLK。prev_kp のキーポイントを次フレームで
追跡した結果を out_kp に格納し、追跡成否 (1=成功/0=失敗) を
status_mat に Nx1 CV_8U として格納します。



%index
cv4_bgsub_create_mog2
MOG2 背景差分の生成
%group
hspcv4 動画解析
%prm
bg_id, history, var_thresh, detect_shadows
%inst
cv::createBackgroundSubtractorMOG2。連続フレームを処理して
動体 (前景) を抽出します。



%index
cv4_bgsub_create_knn
KNN 背景差分の生成
%group
hspcv4 動画解析
%prm
bg_id, history, dist2_thresh, detect_shadows



%index
cv4_bgsub_apply
背景差分の適用
%group
hspcv4 動画解析
%prm
bg_id, src_id, fg_mask_id, learning_rate
%inst
入力フレーム src に背景差分を適用し、前景マスクを fg_mask に
格納します。learning_rate は -1 で自動。



%index
cv4_bgsub_free
背景差分ハンドルの解放
%group
hspcv4 動画解析
%prm
bg_id



%index
cv4_tracker_create_mil
MIL トラッカの生成
%group
hspcv4 動画解析
%prm
tid
%inst
cv::TrackerMIL::create。Multiple Instance Learning ベースの
オンライン学習トラッカ。OpenCV 4.x の main モジュールに含まれる
唯一のライブラリトラッカです (KCF/CSRT は contrib 同梱)。



%index
cv4_tracker_init
トラッカ初期化
%group
hspcv4 動画解析
%prm
tid, img_id, x, y, w, h
%inst
初期フレームと追跡対象の矩形をトラッカに登録します。



%index
cv4_tracker_update
トラッカ更新
%group
hspcv4 動画解析
%prm
tid, img_id, var_x, var_y, var_w, var_h
%inst
次フレームで追跡対象を探索して新しい位置を返します。
stat = 0 で成功、stat = 1 で追跡ロスト。



%index
cv4_tracker_free
トラッカの解放
%group
hspcv4 動画解析
%prm
tid



;==========================================================================
; Phase 9 : calib3d basics
;==========================================================================

%index
cv4_find_homography
ホモグラフィの推定
%group
hspcv4 幾何変換
%prm
h_mat_id, kp1_id, kp2_id, match_id, ransac_thresh
%inst
cv::findHomography (RANSAC ベース)。対応点ペアから 3x3 の
透視変換行列を推定します。cv4_bf_match の結果から使えます。



%index
cv4_warp_perspective
透視変換の適用
%group
hspcv4 幾何変換
%prm
dst_id, src_id, h_mat_id, out_w, out_h



%index
cv4_get_perspective_transform
透視変換行列の生成
%group
hspcv4 幾何変換
%prm
h_mat_id, sx1, sy1, sx2, sy2, sx3, sy3, sx4, sy4, dx1, dy1, dx2, dy2, dx3, dy3, dx4, dy4
%inst
cv::getPerspectiveTransform。4 点対応から 3x3 透視変換行列を作成します。



%index
cv4_get_affine_transform
アフィン変換行列の生成
%group
hspcv4 幾何変換
%prm
m_mat_id, sx1, sy1, sx2, sy2, sx3, sy3, dx1, dy1, dx2, dy2, dx3, dy3
%inst
cv::getAffineTransform。3 点対応から 2x3 アフィン変換行列を作成します。
cv4warp と組み合わせて使用。



;==========================================================================
; Phase 10 : objdetect extras (HOG + QR)
;==========================================================================

%index
cv4_hog_detect_people
HOG 人物検出
%group
hspcv4 物体検出
%prm
rects_array, var_count, img_id, hit_thresh
rects_array : stdim rects, cv_rect, N で確保した構造体配列
%inst
cv::HOGDescriptor + getDefaultPeopleDetector。
組み込みの人物検出用 SVM で検出を行います。
結果は cv_rect 配列に書き込まれます (Phase 2e の cv4_detect と同じ形式)。



%index
cv4_qr_detect
QR コードの検出
%group
hspcv4 物体検出
%prm
rects_array, var_count, img_id
%inst
cv::QRCodeDetector::detect。検出された QR コードの外接矩形を
cv_rect 配列に格納します。



%index
cv4_qr_decode
QR コードの検出とデコード
%group
hspcv4 物体検出
%prm
img_id, var_str
var_str : デコード結果を受け取る str 変数
%inst
cv::QRCodeDetector::detectAndDecode。空文字列の場合は検出失敗または
空の QR コードを意味します。



;==========================================================================
; Phase 11 : imgcodecs extras (imread flags / memory buffer I/O)
;==========================================================================

%index
cv4_imread_flags
フラグ指定付き画像読み込み
%group
hspcv4 基本命令
%prm
id, filename, flags
flags : CV4_IMREAD_UNCHANGED / GRAYSCALE / COLOR / ANYDEPTH / ANYCOLOR
%inst
cv4load のフラグ指定版。GRAYSCALE を指定すると 1ch 画像として
読み込みます。UNCHANGED はアルファチャネルも含めて読み込みます。



%index
cv4_imencode
Mat をメモリバッファにエンコード
%group
hspcv4 基本命令
%prm
ext, id, buffer_var, var_size
ext : ".png" / ".jpg" / ".bmp" 等
buffer_var : str 変数 (エンコード結果のバイト列)
var_size : 実際のバイト数を格納する int 変数
%inst
cv::imencode。Mat を指定フォーマットでメモリにエンコードします。
PNG 等には NUL バイトが含まれるので strlen で長さを測れません。
必ず var_size の値を使って後続の cv4_imdecode に渡してください。



%index
cv4_imdecode
メモリバッファから Mat を復元
%group
hspcv4 基本命令
%prm
id, buffer_var, size
%inst
cv::imdecode。size バイトのバイナリデータから Mat を復元します。
netload で取得した PNG/JPEG バイト列を直接 Mat にできます。



;==========================================================================
; Phase 12 : stitching / drawing extras / misc
;==========================================================================

%index
cv4_stitch
パノラマ合成
%group
hspcv4 物体検出
%prm
dst_id, img_ids_array, count
img_ids_array : HSP int 配列 (hspcv4 画像ハンドル ID のリスト)
count : 使用する要素数
%inst
cv::Stitcher::PANORAMA モードで複数画像からパノラマ画像を合成します。
画像間で十分な重なり (20% 以上) と特徴点が必要です。



%index
cv4_draw_arrow
矢印の描画
%group
hspcv4 描画命令
%prm
id, x1, y1, x2, y2, b, g, r, thickness, tip_len_x100
tip_len_x100 : 矢尻の相対長さ x100 (省略時 10 = 0.10)
%inst
cv::arrowedLine。



%index
cv4_draw_marker
マーカーの描画
%group
hspcv4 描画命令
%prm
id, cx, cy, b, g, r, marker_type, size, thickness
marker_type : 0=CROSS, 1=TILTED_CROSS, 2=STAR, 3=DIAMOND, 4=SQUARE, 5=TRIANGLE_UP, 6=TRIANGLE_DOWN
%inst
cv::drawMarker。特徴点や重心などに各種マーカーを描画します。



%index
cv4_draw_ellipse
楕円の描画
%group
hspcv4 描画命令
%prm
id, cx, cy, rx, ry, angle, start_angle, end_angle, b, g, r, thickness
%inst
cv::ellipse。楕円弧や扇形を描画できます。



%index
cv4_fill_poly
塗りつぶし多角形
%group
hspcv4 描画命令
%prm
id, points_array, point_count, b, g, r
points_array : int 配列 [x0,y0,x1,y1,...]
%inst
cv::fillPoly で塗りつぶし多角形を描画します。



%index
cv4_mat_clone
Mat の複製
%group
hspcv4 Mat 演算
%prm
dst_id, src_id
%inst
cv::Mat::clone による独立コピー。元の src を変更しても dst に
影響しません。



%index
cv4_put_pixel
ピクセル値の書き込み
%group
hspcv4 Mat アクセッサ
%prm
id, x, y, b, g, r
%inst
CV_8UC1 / CV_8UC3 の Mat の特定画素に値を書き込みます。
グレースケール (1ch) の場合は b のみが使われます。



%index
cv4_get_pixel
ピクセル値の読み取り
%group
hspcv4 Mat アクセッサ
%prm
id, x, y, var_b, var_g, var_r
%inst
特定画素の値を 3 つの int 変数に格納します。
グレースケールの場合は 3 変数すべてに同じ値が入ります。



%index
cv4_build_version
OpenCV のバージョン文字列取得
%group
hspcv4 その他
%prm
var_str
%inst
cv::getVersionString() でビルドされている OpenCV のバージョン
(例: "4.12.0") を str 変数に格納します。
