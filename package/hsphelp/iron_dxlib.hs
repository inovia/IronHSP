;
; iron_dxlib.hs — hsp3dx 手書き dx_* 命令の HSP Help
; 対応は iron_dxlib.as (77 命令、opcode 0x100〜0x1CF)
;
; 自動生成の DxLib フル binding は iron_dxlib_auto.hs を参照。
;

%dll
iron_dxlib
%ver
hsp3dx 5.5
%date
2026/04/21
%author
IronHSP Project
%url
https://dxlib.xsrv.jp/
%note
hsp3dx で #include "iron_dxlib.as" すれば利用可能 (iron_dxlib_auto.as も自動 include される)
%type
hsp3dx 手書き拡張命令
%port
Win / (iOS, Android は Phase 3,4)

;--------------------------------------------------------------
;  アンチエイリアス描画
;--------------------------------------------------------------
%index
dx_drawcircleaa
アンチエイリアス付きの円を描画
%group
DxLib 描画 (AA)
%prm
p1,p2 : 中心座標 (x, y)
p3    : 半径
p4    : 色 (0xRRGGBB)
p5    : 塗りつぶし (0=枠のみ / 1=塗り、デフォルト 1)
p6    : 線の太さ (枠描画時、デフォルト 1.0)
%inst
DxLib DrawCircleAA を呼び出して、縁が滑らかな円を描画します。
^p
通常の HSP の circle とは異なり、サブピクセル精度で描画されるため
高解像度環境できれいな輪郭になります。
%sample
dx_drawcircleaa 320.0, 240.0, 80.0, 0xFFCC44, 1
%href
dx_drawlineaa
dx_drawboxaa

%index
dx_drawlineaa
アンチエイリアス付きの直線を描画
%group
DxLib 描画 (AA)
%prm
p1,p2 : 始点 (x1, y1)
p3,p4 : 終点 (x2, y2)
p5    : 色 (0xRRGGBB)
p6    : 線の太さ (デフォルト 1.0)
%inst
DxLib DrawLineAA を呼び出します。斜線のジャギーが気にならなくなります。

%index
dx_drawboxaa
アンチエイリアス付きの矩形を描画
%group
DxLib 描画 (AA)
%prm
p1,p2 : 左上 (x1, y1)
p3,p4 : 右下 (x2, y2)
p5    : 色 (0xRRGGBB)
p6    : 塗りつぶし (0=枠 / 1=塗り、デフォルト 1)
p7    : 線の太さ (デフォルト 1.0)
%inst
DxLib DrawBoxAA を呼び出します。

%index
dx_drawtriangle
三角形を描画
%group
DxLib 描画 (AA)
%prm
p1,p2 : 頂点 1 (x1, y1)
p3,p4 : 頂点 2 (x2, y2)
p5,p6 : 頂点 3 (x3, y3)
p7    : 色 (0xRRGGBB)
p8    : 塗りつぶし (0=枠 / 1=塗り)
%inst
DxLib DrawTriangle を呼び出して 2D 三角形を描画します。
3D 版は dx_drawtriangle3d を使用してください。

;--------------------------------------------------------------
;  自由変形
;--------------------------------------------------------------
%index
dx_drawmodigraph
4 頂点指定で画像を歪めて描画
%group
DxLib 描画
%prm
p1    : 画像 ID (buffer で確保済の graph handle)
p2,p3 : 左上 (x1, y1)
p4,p5 : 右上 (x2, y2)
p6,p7 : 右下 (x3, y3)
p8,p9 : 左下 (x4, y4)
%inst
DxLib DrawModiGraph を呼び出して、4 つの頂点座標を指定して画像を
任意の四角形に変形して描画します。疑似 3D 表現や自由変形エフェクトに。

;--------------------------------------------------------------
;  ジョイパッド入力
;--------------------------------------------------------------
%index
dx_getjoypad
ジョイパッド入力状態取得
%group
DxLib 入力
%prm
p1 : 受け取り変数 (int、ビットフィールド)
p2 : パッド番号 (0〜、デフォルト 0)
%inst
DxLib GetJoypadInputState を呼び出して、ボタン押下状態をビットフィールドで変数に格納します。
^p
主なビット定数 (PAD_INPUT_*):
  左 右 上 下 / A B X Y / L R / START SELECT 等

%index
dx_joyanalog
ジョイパッドアナログ L スティック取得
%group
DxLib 入力
%prm
p1 : X 受け取り変数 (int、-1000〜1000)
p2 : Y 受け取り変数 (int、-1000〜1000)
p3 : パッド番号 (デフォルト 0)
%inst
DxLib GetJoypadAnalogInput を呼び出して、アナログスティックの
X/Y 値を変数に格納します。

;--------------------------------------------------------------
;  画面フィルタ / エフェクト
;--------------------------------------------------------------
%index
dx_setwaitvsync
VSync 待機の ON/OFF
%group
DxLib 設定
%prm
p1 : 0=OFF / 1=ON
%inst
VSync 待機の有無を切り替えます。OFF にするとフレームレート上限が
外れますが画面がちらつく場合があります。

%index
dx_setfullscreen
フルスクリーン切替
%group
DxLib 設定
%prm
p1 : 0=ウィンドウ / 1=フルスクリーン
%inst
フルスクリーンモードを切り替えます。

;--------------------------------------------------------------
;  3D プリミティブ / カメラ
;--------------------------------------------------------------
%index
dx_setcamerapos
3D カメラの視点と注視点を設定
%group
DxLib カメラ
%prm
p1,p2,p3 : 視点 (cx, cy, cz)
p4,p5,p6 : 注視点 (tx, ty, tz)
%inst
DxLib SetCameraPositionAndTarget_UpVecY を呼び出します。
上方向は +Y 固定。任意の up vector を指定したい場合は
自動生成側の dx_SetCameraPositionAndTargetAndUpVec を使用。

%index
dx_setcameraperspective
3D カメラの視野角 (透視投影) を設定
%group
DxLib カメラ
%prm
p1 : 視野角 (度、例 60.0)
%inst
DxLib は内部で ラジアン に換算するので度数で OK。

%index
dx_drawsphere3d
3D 球を描画
%group
DxLib 3D 描画
%prm
p1,p2,p3 : 中心 (x, y, z)
p4       : 半径
p5       : 分割数 (8〜32 程度)
p6       : 拡散色 DifColor (0xRRGGBB)
p7       : 鏡面色 SpcColor (0=オフ)
p8       : 塗りつぶし (0=ワイヤーフレーム / 1=塗り)
%inst
DxLib DrawSphere3D を呼び出します。
VECTOR 版は dx_DrawSphere3D (自動生成側) を使用。

%index
dx_drawcube3d
3D 立方体を座標指定で描画
%group
DxLib 3D 描画
%prm
p1,p2,p3 : 最小角 (x1, y1, z1)
p4,p5,p6 : 最大角 (x2, y2, z2)
p7       : 拡散色
p8       : 鏡面色
p9       : 塗りつぶし
%inst
DxLib DrawCube3D を呼び出します。VECTOR 版は dx_drawcube3dv を使用。

%index
dx_setbgcolor3d
3D 背景色を設定
%group
DxLib 3D 描画
%prm
p1,p2,p3 : RGB (各 0〜255)
%inst
DxLib SetBackgroundColor を呼び出します。cls でクリアされる色になります。

%index
dx_setuselighting
3D 照明 ON/OFF
%group
DxLib ライト
%prm
p1 : 0=OFF (DifColor フラット表示) / 1=ON
%inst
DxLib SetUseLighting を呼び出します。OFF だと各ポリゴンが単色で
フラットに表示されます (色優先のデモに使える)。

%index
dx_setlightdir
平行光源の方向を設定
%group
DxLib ライト
%prm
p1,p2,p3 : 方向ベクトル (dx, dy, dz)
%inst
DxLib SetLightDirection を呼び出します。正規化は内部で行われます。

%index
dx_setzbuffer
Z バッファ (深度テスト) の ON/OFF
%group
DxLib 3D 描画
%prm
p1 : 0=OFF / 1=ON
%inst
DxLib SetUseZBuffer3D + SetWriteZBuffer3D を一括設定します。
3D 描画時は基本 ON。cls で毎フレームクリアされる。

;--------------------------------------------------------------
;  3D モデル (MV1)
;--------------------------------------------------------------
%index
dx_mv1load
MV1 3D モデルをロード
%group
DxLib MV1 モデル
%prm
p1 : ファイル名 (mv1 / x / pmd / pmx / mqo / fbx 等)
%inst
DxLib MV1LoadModel を呼び出します。
^p
戻り値 stat にハンドルが入ります。-1 の場合はロード失敗。

%index
dx_mv1draw
MV1 モデルを描画
%group
DxLib MV1 モデル
%prm
p1 : モデルハンドル (dx_mv1load の stat 値)
%inst
DxLib MV1DrawModel を呼び出します。

%index
dx_mv1setpos
MV1 モデルの位置を設定
%group
DxLib MV1 モデル
%prm
p1 : モデルハンドル
p2,p3,p4 : ワールド座標 (x, y, z)
%inst
DxLib MV1SetPosition を呼び出します。

%index
dx_mv1setrot
MV1 モデルの回転 (XYZ オイラー) を設定
%group
DxLib MV1 モデル
%prm
p1 : モデルハンドル
p2,p3,p4 : 回転 (rx, ry, rz、ラジアン)
%inst
DxLib MV1SetRotationXYZ を呼び出します。度数で扱いたい場合は
deg2rad(v) = v * 3.14159265 / 180.0 で変換してください。

%index
dx_mv1setscale
MV1 モデルのスケールを設定
%group
DxLib MV1 モデル
%prm
p1 : モデルハンドル
p2,p3,p4 : スケール (sx, sy, sz、1.0 が等倍)
%inst
DxLib MV1SetScale を呼び出します。

%index
dx_mv1delete
MV1 モデルを破棄
%group
DxLib MV1 モデル
%prm
p1 : モデルハンドル
%inst
DxLib MV1DeleteModel を呼び出します。スクリプト終了時は自動解放
されますが、動的に多数のモデルを出し入れする場合は明示的に呼んでください。

;--------------------------------------------------------------
;  動画再生
;--------------------------------------------------------------
%index
dx_loadmovie
動画ファイルを graph handle として読み込み
%group
DxLib 動画 / 再生
%prm
p1 : ファイル名 (mp4 / wmv / avi 等、Media Foundation 対応形式)
p2 : 割り当て先の buffer ID
%inst
DxLib LoadMovie を呼び出して、buffer(p2) に graph handle として
配置します。以降 gcopy 等で buffer(p2) を参照すれば再生中フレームを
コピーできます。

%index
dx_playmoviegraph
読み込み済み動画を再生開始
%group
DxLib 動画 / 再生
%prm
p1 : buffer ID
%inst
PlayMovieToGraph を呼び出します。

%index
dx_pausemoviegraph
動画を一時停止
%group
DxLib 動画 / 再生
%prm
p1 : buffer ID
%inst
PauseMovieToGraph を呼び出します。

%index
dx_stopmoviegraph
動画を停止
%group
DxLib 動画 / 再生
%prm
p1 : buffer ID
%inst
PauseMovieToGraph で停止します (DxLib に Stop は無いが Pause で代用)。

;--------------------------------------------------------------
;  HTTP クライアント (Phase 5.4a/a+)
;--------------------------------------------------------------
%index
dx_http_set_timeout
HTTP リクエストのタイムアウト (ms) を設定
%group
hsp3dx HTTP
%prm
p1 : タイムアウト (ms、デフォルト 30000)
%inst
以降のすべての dx_http_* で使われる、resolve/connect/send/receive
共通のタイムアウトを設定します。

%index
dx_http_set_header
追加リクエストヘッダを設定 (空文字でクリア)
%group
hsp3dx HTTP
%prm
p1 : "Name: value\r\nName2: value2\r\n..." 形式の文字列
%inst
以降のすべての dx_http_* に付加される追加ヘッダを設定します。
^p
空文字を渡すとクリア。

%index
dx_http_get
HTTP GET
%group
hsp3dx HTTP
%prm
p1 : URL (http:// / https://)
p2 : レスポンス body を受け取る変数
%inst
stat に HTTP ステータスコード (200/404/...)、失敗時 0。
^p
gzip / deflate は自動解凍、HTTP/2 はサーバが対応すれば使用。

%index
dx_http_post
HTTP POST
%group
hsp3dx HTTP
%prm
p1 : URL
p2 : body 文字列
p3 : レスポンス body を受け取る変数
p4 : Content-Type (例 "application/json")
%inst
stat に HTTP ステータスコード。

%index
dx_http_set_user_agent
User-Agent を設定
%group
hsp3dx HTTP
%prm
p1 : UA 文字列 (例 "MyApp/1.0")
%inst
以降の dx_http_* に使う User-Agent を差し替えます。空=デフォルト ("hsp3dx/1.0")。

%index
dx_http_put
HTTP PUT
%group
hsp3dx HTTP
%prm
p1 : URL
p2 : body
p3 : レスポンス受け取り変数
p4 : Content-Type
%inst
dx_http_post と同じ引数構造。

%index
dx_http_delete
HTTP DELETE
%group
hsp3dx HTTP
%prm
p1 : URL
p2 : レスポンス受け取り変数
%inst
body なし。

%index
dx_http_patch
HTTP PATCH
%group
hsp3dx HTTP
%prm
p1 : URL
p2 : body
p3 : レスポンス受け取り変数
p4 : Content-Type
%inst
dx_http_post と同じ引数構造。

%index
dx_http_download
URL からファイルをダウンロード
%group
hsp3dx HTTP
%prm
p1 : URL
p2 : 保存先ファイルパス (UTF-8)
%inst
ストリーム保存なので巨大ファイルも OK。
^p
stat に HTTP ステータスコード、strsize に保存バイト数。

%index
dx_http_get_res_header
直前のレスポンスから任意ヘッダを取得
%group
hsp3dx HTTP
%prm
p1 : ヘッダ名 (例 "Content-Type"、大文字小文字無視)
p2 : 受け取り変数
%inst
dx_http_get/post/put/delete/patch の直後に呼び出し可能。
^p
stat = 0 で見つかった、stat = -1 で無し。

%index
dx_http_set_basic_auth
Basic 認証ヘッダを次のリクエストに付加
%group
hsp3dx HTTP
%prm
p1 : ユーザー名
p2 : パスワード
%inst
内部で "Authorization: Basic <base64>" を追加ヘッダに合成します。
dx_http_set_header "" でクリアできます。

%index
dx_http_cookie_clear
Cookie ジャーをクリア (セッションリセット)
%group
hsp3dx HTTP
%inst
ランタイム内で共有されている Cookie 保持状態をリセットします。

%index
dx_http_cookie_enable
Cookie 保持の ON/OFF
%group
hsp3dx HTTP
%prm
p1 : 0=OFF / 1=ON (デフォルト ON)
%inst
プロセス内で自動的に維持される Cookie ジャーの有効/無効を切り替えます。

%index
dx_http_mp_begin
multipart/form-data 構築開始
%group
hsp3dx HTTP
%inst
以降 dx_http_mp_add_text / add_file でパートを追加し、
dx_http_mp_post で送信、dx_http_mp_end で状態をクリアします。

%index
dx_http_mp_add_text
multipart に text フィールドを追加
%group
hsp3dx HTTP
%prm
p1 : フィールド名
p2 : 値
%inst
フォームの通常テキスト入力相当。

%index
dx_http_mp_add_file
multipart にファイルを追加
%group
hsp3dx HTTP
%prm
p1 : フィールド名
p2 : ファイルパス
p3 : Content-Type (省略時は拡張子から自動推定)
p4 : サーバに見せるファイル名 (省略時は basename)
%inst
ファイルをバイナリで読み込み、multipart body に組み込みます。

%index
dx_http_mp_post
multipart を POST 送信
%group
hsp3dx HTTP
%prm
p1 : URL
p2 : レスポンス受け取り変数
%inst
stat に HTTP ステータスコード。

%index
dx_http_mp_end
multipart 構築状態をクリア
%group
hsp3dx HTTP
%inst
内部バッファを解放します。次の dx_http_mp_begin までに呼ぶ。

;--------------------------------------------------------------
;  JSON (Phase 5.4b)
;--------------------------------------------------------------
%index
dx_json_parse
JSON 文字列をパース
%group
hsp3dx JSON
%prm
p1 : JSON ソース文字列
%inst
stat にドキュメントハンドル、失敗時 -1。
使い終わったら dx_json_free で解放。

%index
dx_json_new_obj
空の JSON object を新規作成
%group
hsp3dx JSON
%inst
stat にハンドル。

%index
dx_json_new_arr
空の JSON array を新規作成
%group
hsp3dx JSON
%inst
stat にハンドル。

%index
dx_json_free
JSON ドキュメントを解放
%group
hsp3dx JSON
%prm
p1 : ハンドル

%index
dx_json_stringify
JSON をシリアライズ (文字列化)
%group
hsp3dx JSON
%prm
p1 : ハンドル
p2 : 出力先変数
p3 : 0=minify / 1=pretty (デフォルト 0)
%inst
stat にバイト数。

%index
dx_json_type
path の値型を取得
%group
hsp3dx JSON
%prm
p1 : ハンドル
p2 : path 文字列 (例 "user.items[0].name")
%inst
stat = 0=null / 1=bool / 2=number / 3=string / 4=array / 5=object / -1=無し

%index
dx_json_size
配列/オブジェクトの要素数を取得
%group
hsp3dx JSON
%prm
p1 : ハンドル
p2 : path
%inst
stat に要素数。array/object 以外は -1。

%index
dx_json_key
object の idx 番目のキー名を取得
%group
hsp3dx JSON
%prm
p1 : ハンドル
p2 : path
p3 : インデックス (0〜)
p4 : 受け取り変数

%index
dx_json_get_str
path の値を文字列で取得
%group
hsp3dx JSON
%prm
p1 : ハンドル
p2 : path
p3 : 受け取り変数
p4 : デフォルト値 (省略可)

%index
dx_json_get_int
path の値を整数で取得
%group
hsp3dx JSON
%prm
p1 : ハンドル
p2 : path
p3 : デフォルト値
%inst
stat に値。

%index
dx_json_get_double
path の値を double で取得
%group
hsp3dx JSON
%prm
p1 : ハンドル
p2 : path
p3 : 受け取り変数 (double)

%index
dx_json_get_bool
path の値を bool で取得
%group
hsp3dx JSON
%prm
p1 : ハンドル
p2 : path
p3 : デフォルト値
%inst
stat に 0/1。

%index
dx_json_set_str
path に文字列をセット (中間 obj/arr 自動生成)
%group
hsp3dx JSON
%prm
p1 : ハンドル
p2 : path
p3 : 値

%index
dx_json_set_int
path に整数をセット
%group
hsp3dx JSON

%index
dx_json_set_double
path に double をセット (変数引数)
%group
hsp3dx JSON

%index
dx_json_set_bool
path に bool をセット
%group
hsp3dx JSON

%index
dx_json_set_null
path に null をセット
%group
hsp3dx JSON

%index
dx_json_set_obj
path に空 object をセット
%group
hsp3dx JSON

%index
dx_json_set_arr
path に空 array をセット
%group
hsp3dx JSON

%index
dx_json_remove
path の要素を削除
%group
hsp3dx JSON
%prm
p1 : ハンドル
p2 : path
%inst
object の key、または array の要素を削除。

;--------------------------------------------------------------
;  WebSocket (Phase 5.4c)
;--------------------------------------------------------------
%index
dx_ws_connect
WebSocket サーバに接続
%group
hsp3dx WebSocket
%prm
p1 : URL ("ws://..." / "wss://...")
p2 : 追加ヘッダ (省略可、"Origin: ...\r\n" 等)
p3 : タイムアウト ms (デフォルト 10000)
%inst
stat に WS ハンドル、失敗時 -1。

%index
dx_ws_close
WebSocket を切断
%group
hsp3dx WebSocket
%prm
p1 : ハンドル
p2 : close code (デフォルト 1000)

%index
dx_ws_free
WebSocket ハンドルを解放
%group
hsp3dx WebSocket
%prm
p1 : ハンドル
%inst
内部 background thread を停止し、リソースを解放します。

%index
dx_ws_send_text
テキストメッセージを送信
%group
hsp3dx WebSocket
%prm
p1 : ハンドル
p2 : 文字列

%index
dx_ws_send_binary
バイナリメッセージを送信
%group
hsp3dx WebSocket
%prm
p1 : ハンドル
p2 : バッファ変数
p3 : 送信バイト数

%index
dx_ws_recv
メッセージを受信 (キューから取り出し)
%group
hsp3dx WebSocket
%prm
p1 : ハンドル
p2 : 受け取り変数
p3 : timeout ms (0=即時ポーリング)
%inst
stat: 0=TEXT を受信 / 1=BINARY / -1=切断 or エラー / -2=タイムアウト。
strsize に実バイト数。

%index
dx_ws_status
接続状態を取得
%group
hsp3dx WebSocket
%prm
p1 : ハンドル
%inst
stat: 0=OPEN / 1=CONNECTING / 2=CLOSING / 3=CLOSED

;--------------------------------------------------------------
;  VECTOR 引数の 3D プリミティブ (Phase 5.5b)
;--------------------------------------------------------------
%index
dx_drawline3d
3D 直線を VECTOR 2 点で描画
%group
DxLib 3D 描画 (VECTOR)
%prm
p1 : 始点 (VECTOR 型の NSTRUCT 変数)
p2 : 終点 (同)
p3 : 色 (0xRRGGBB)
%inst
HSP 側は以下のように VECTOR を宣言して使います:
^p
  #defstruct VECTOR
  ^p#field float x
  ^p#field float y
  ^p#field float z
  ^p#endstruct
  ^p
  stdim a, VECTOR
  a->x = 10.0 : a->y = 0.0 : a->z = 0.0
  dx_drawline3d a, b, 0xFFFFFF

%index
dx_drawtriangle3d
3D 三角形を VECTOR 3 点で描画
%group
DxLib 3D 描画 (VECTOR)
%prm
p1 : 頂点 1 (VECTOR)
p2 : 頂点 2 (VECTOR)
p3 : 頂点 3 (VECTOR)
p4 : 色
p5 : 塗りつぶし (0/1)

%index
dx_drawcube3dv
3D 立方体を VECTOR 2 点 (対角) で描画
%group
DxLib 3D 描画 (VECTOR)
%prm
p1 : 最小角 (VECTOR)
p2 : 最大角 (VECTOR)
p3 : 拡散色
p4 : 鏡面色
p5 : 塗りつぶし
%inst
スカラー版は dx_drawcube3d。

%index
dx_drawcapsule3d
3D カプセルを VECTOR 2 点で描画
%group
DxLib 3D 描画 (VECTOR)
%prm
p1 : 端点 1 (VECTOR)
p2 : 端点 2 (VECTOR)
p3 : 半径 (double)
p4 : 分割数 (8〜24 程度)
p5 : 拡散色
p6 : 鏡面色
p7 : 塗りつぶし

%index
dx_drawcone3d
3D 円錐を描画
%group
DxLib 3D 描画 (VECTOR)
%prm
p1 : 頂点 (VECTOR、先端)
p2 : 底面中心 (VECTOR)
p3 : 底面半径
p4 : 分割数
p5 : 拡散色
p6 : 鏡面色
p7 : 塗りつぶし
