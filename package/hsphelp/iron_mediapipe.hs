;
; iron_mediapipe.hsp  HSP3 ヘルプ (日本語)
; MediaPipe 高レベルラッパ (hsptflite.dll を基盤)
;

%type
拡張命令 (モジュール)
%ver
1.0
%date
2026-04-15
%author
IronHSP / iron_mediapipe
%dll
iron_mediapipe.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_mediapipe.hsp は Google MediaPipe の .tflite モデル群を HSP
から使うための高レベルラッパモジュールです。hsptflite.dll 経由で
Tensorflow Lite C API を叩きます。

v1 実装範囲:
  - mp_hand_*   : 手検出 (palm_detector 1 段目のみ)
  - mp_pose_*   : スタブ (未実装)
  - mp_face_*   : スタブ (未実装)
  - mp_bgr_to_rgb / mp_resize_bilinear ヘルパ

モデルの入手については plugins/win32/hsptflite/third_party/tflite/
README.md の「モデル入手」節を参照してください。

%group
iron_mediapipe (MediaPipe推論)

%index
mp_hand_init
手検出 (MediaPipe Hand) の初期化

%prm
"palm_detector.tflite", "hand_landmarker.tflite"
第 2 引数は landmark モデル。v1 では使用しないため "" でも可。

%inst
MediaPipe Hand パイプラインを初期化します。2 段目の
hand_landmarker は v1 では呼び出されません (スタブ)。
失敗時は stat に負の値 (-100 はスタブビルド)。

%href
mp_hand_close
mp_hand_run

%index
mp_hand_close
手検出パイプラインの終了

%prm

%inst
ロードしたモデルを全て解放します。

%index
mp_hand_run
手検出の実行

%prm
var_rgb, w, h
var_rgb : RGB 8bit w*h*3 の生バイト列
w, h    : 画像のサイズ (ピクセル)

%inst
RGB 画像に対して palm_detector 推論を実行します。stat に検出数
(0..8) が返ります。

v1 の注記:
- 前処理は HSP 側 bilinear resize + 簡易正規化で、性能は二の次。
- 後処理の anchor decode / sigmoid / NMS は v1 では簡略化されており、
  実際の運用では C++ ヘルパ移植が推奨。

%href
mp_hand_count
mp_hand_bbox
mp_hand_score

%index
mp_hand_count
検出された手の数を取得

%prm
var_n

%index
mp_hand_score
検出信頼度を取得

%prm
idx, var_score
0.0 ～ 1.0 の sigmoid 済み信頼度。

%index
mp_hand_bbox
検出矩形を取得

%prm
idx, var_x, var_y, var_w, var_h
入力画像座標系でのバウンディングボックス。

%index
mp_hand_landmark
21 点ランドマークの取得 (v1 スタブ)

%prm
idx, pt_idx, var_x, var_y, var_z

%inst
v1 では常に 0 を返します。hand_landmarker (2 段目) の実装は
v2 で対応予定です。

%index
mp_pose_init
姿勢検出の初期化 (v1 スタブ)

%prm
"pose_landmark.tflite"

%inst
v1 では -100 を返してスタブ動作します。

%index
mp_pose_run
姿勢検出の実行 (v1 スタブ)

%prm
var_rgb, w, h

%index
mp_face_init
顔検出の初期化 (v1 スタブ)

%prm
"face_detector.tflite"

%index
mp_face_run
顔検出の実行 (v1 スタブ)

%prm
var_rgb, w, h

%index
mp_bgr_to_rgb
BGR → RGB 変換ヘルパ

%prm
var_bgr, var_rgb, w, h

%inst
bmscr 等で取得した 24bit BGR バッファを RGB に並び替えます。
var_rgb は自動で sdim されます。

%index
mp_resize_bilinear
バイリニア補間による画像リサイズ

%prm
var_src, sw, sh, var_dst, dw, dh, channels

%inst
素朴なバイリニア補間で画像をリサイズします。v1 では HSP 実装の
ためフレーム毎実行はやや重いです。
