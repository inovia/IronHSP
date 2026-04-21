# hsp3dx 作業ログ

hsp3dx プロジェクトのセッション単位の作業記録。リバース年代順 (新しい作業が上)。
仕様書 ([hsp3dx_spec.md](../../docs/hsp3dx_spec.md)) は **決めごと** を、本ログは
**何をしたか・何に詰まったか・なぜそう決めたか** を書く。

---

## 2026-04-21 (Phase 5.4a: HTTP クライアント)

### (これから commit) @ 20:16 — Phase 5.4a: dx_http_* (WinHTTP)

**実装**
- `hsp3dx_http.h` 新規: cross-platform HTTP API (blocking、UTF-8 前提)
- `hsp3dx_http_win.cpp` 新規: WinHTTP 実装
  - URL / path / headers すべて **malloc 動的確保** (長い URL / body 対応)
  - `WinHttpCrackUrl` で URL 解析、`WinHttpOpen` / `Connect` / `OpenRequest` /
    `SendRequest` / `ReceiveResponse` / `QueryDataAvailable` + `ReadData`
  - TLS 自動 (`WINHTTP_FLAG_SECURE` for https)
- 追加 dx_* 命令 (iron_dxlib.as + extcmd):
  - `0x160 dx_http_set_timeout ms`
  - `0x161 dx_http_set_header "Header: value\r\n..."` (空でクリア)
  - `0x162 dx_http_get "url", var_body` (stat=status)
  - `0x163 dx_http_post "url", "body", var_body, "content-type"`
  - `0x164 dx_http_set_user_agent "name"`

**詰まりどころ**
1. **code_gets の共有バッファ問題** — url と body を連続 `code_gets()` で取ると、
   2 回目の呼出で 1 回目の戻り値が上書きされる → POST で url が body で上書きされ
   失敗 (status=0)。修正: `_strdup` で heap へ複製してから使用
2. **mes の \n 処理** — レスポンス本文に含まれる `\n` が DxLib DrawString で
   複数行描画されるが、hsp3dx 側の cur_y は 1 行分しか進めず、次の mes と重なる
   → `\n` で分割して 1 行ずつ DrawString + advance_mes_y する方式に変更
3. **バッファ固定長の撤廃** — url[2048] / body[65536] スタック確保から、
   `_strdup` / `malloc` の動的確保に移行。ブラウザ級の長い URL / large body 対応
4. **User-Agent カスタマイズ** — `WinHttpOpen` に渡す UA を引数化、
   `dx_http_set_user_agent` で HSP 側から設定可能

**サンプル** `sample_http.hsp`:
- httpbin.org に GET + POST (JSON body) して status/body 表示
- 実機確認: GET/POST 両方 status 200 受信 ✅

**残 (Phase 5.4b/c)**
- JSON パース / 生成 (picojson ベースを予定)
- WebSocket (WinHTTP WebSocket API)

---

## 2026-04-21 (Phase 5.3: DxLib API 自動コード生成)

### (これから commit) @ 20:15 — Phase 5.3: DxLib 512 関数を自動生成で追加

**やったこと**
- **`tools/hsp3dx_dxlib_gen/gen_dxlib_bindings.py`** 新規: Python 正規表現で
  DxLib.h をパースし、以下を自動生成:
  - `package/win32/common/iron_dxlib_auto.as` — #regcmd/#cmd エントリ
  - `hsp3dx/src/hsp3dx_dxlib_auto.cpp` — dispatcher switch 全 case
- フィルタ条件:
  - `extern int FuncName(...)` 形式、戻り値 int のみ
  - 引数型は int / float / double / const TCHAR * のみ
  - VECTOR / callback / struct / 出力ポインタ関数は skip (方針 1 の原則)
  - Phase 1/5.1/5.2 で手書き実装済みの関数名は skip (重複回避)
  - `DxLib_` プレフィックスは命名時に剥がす (`dx_dx_lib_...` 重複回避)
- opcode 範囲 **0x200〜0x3FF** (512 枠) を自動生成用に予約
- `hsp3dx_extcmd.cpp` の default case で `hsp3dx_dxlib_auto_dispatch()` を呼ぶ
  フォールスルー機構を追加
- 結果: `parsed: 2094  accepted: 941  truncated: 512 to fit opcode range`
  → **512 個の新規 dx_* 命令が HSP から呼べる** ように

**詰まりどころ**
- `MailApp_Send` / `HTTP_*` / `SetProxySetting` / `URLConvert` / 一部 UDP 系など
  14 関数が未定義シンボルでリンクエラー
- ユーザーからの「別の lib ファイルに入ってない?」の質問でそう思い全 lib 検索
- 結論: **どの lib にも存在しない**。これらは iOS/Android/Emscripten 版の
  DxLib でのみ実装されていて、Windows VC バイナリには入っていない関数群
  (HTTP/Mail/Proxy はモバイル向け機能)
- SKIP_NAMES 集中ブラックリストで除外 (iOS/Android 版対応時に `#ifdef HSPWIN`
  で条件化する形で将来復活可能)

**サンプル** `sample_auto.hsp`:
- `#include "iron_dxlib_auto.as"` で 512 命令使用可能に
- `dx_get_now_count` / `dx_get_rand 999` / `dx_sleep_thread` /
  `dx_set_always_run_flag` の 4 命令を呼び出して動作検証

**累計**
- extcmd 手書き 40+ 個 + 自動生成 512 個 = **552+ 個**
- reffunc 9 個
- サンプル 14 本

**意義**
hsp3dish の hgimg4 ですら手書きで opcode 定義していたのに対し、hsp3dx は
DxLib.h を直接解析して自動生成することで、**開発の手間を 1 桁削減**。
新版 DxLib SDK が出るたびに再生成すれば追随が楽。

---

## 2026-04-21 (Phase 1.11: celdiv / pget / gfilter / gmulcolor / rgbcolor)

### (これから commit) @ 20:14 — Phase 1.11: スプライトシート + 色・ピクセル操作

**追加 opcode**
- `0x00d pget x, y` — ピクセル色読み取り、`stat` に 0xRRGGBB で格納
- `0x03d celdiv ID, cell_w, cell_h, origin_x, origin_y` — スプライトシート分割
- `0x03e celput ID, frame, zx, zy, rot` — celdiv 設定済 ID ならフレーム番号でセル選択、
  `DrawRectRotaGraph` でサブ矩形描画
- `0x03f gfilter mode` — 0=nearest (デフォルト) / 1=linear / 2=anisotropic
- `0x04e rgbcolor 0xRRGGBB` — パック int から色設定 (`color r,g,b` の簡易版)
- `0x05d gmulcolor r, g, b` — 描画乗算カラー (`SetDrawBright`)

**サンプル** `sample_cel.hsp`:
- `test_sprites.png` (128×32、32×32 × 4 フレーム) を celdiv で分割
- 4 フレーム等寸 + 右にアニメーション (3× 拡大)
- gmulcolor で赤スプライト減光 (乗算なので茶色に、色置換ではない)
- gfilter 1 で線形補間拡大
- rgbcolor で水色文字
- pget で画面中央ピクセル値取得 → HUD 表示

**詰まりどころ (ユーザー指摘)**
- gmulcolor (128, 255, 128) を赤スプライトに適用 → 「緑に染まる」と期待したが茶色に
  → gmulcolor は乗算カラーで色置換ではない。赤 (255, 80, 80) × (0.5, 1.0, 0.5) = 茶色
    (127, 80, 40) は仕様通り。サンプルコメントを「減光/色調補正」に修正
- 色置換したい場合は元スプライトが白など全チャネル成分ありのもの推奨

**動作確認**
- スプライトシートアニメーション動作 OK、拡大・線形補間・色調整すべて ✅

---

## 2026-04-21 (Phase 5.2: 3D プリミティブ + MV1 モデル + 動画)

### (これから commit) @ 20:13 — Phase 5.2: 3D 描画基礎

**追加 dx_* 命令 (iron_dxlib.as + hsp3dx_extcmd.cpp)**
- 3D プリミティブ / カメラ (0x130 台):
  - `dx_setcamerapos cx,cy,cz, tx,ty,tz` — カメラ視点+注視点 (SetCameraPositionAndTarget_UpVecY)
  - `dx_setcameraperspective fov_deg` — 透視投影 (SetupCamera_Perspective、度→rad 内部変換)
  - `dx_drawsphere3d x,y,z,r,div,difcol,spccol,fill` — 球体
  - `dx_drawcube3d x1..z2, difcol,spccol,fill` — 直方体
  - `dx_setbgcolor3d r,g,b` — 3D 背景色 (SetBackgroundColor)
  - `dx_setuselighting flag` — 照明 ON/OFF
  - `dx_setlightdir dx,dy,dz` — 平行光源方向
  - `dx_setzbuffer flag` — Z バッファ (SetUseZBuffer3D + SetWriteZBuffer3D)
- 3D モデル (0x140 台、MV1 format):
  - `dx_mv1load "file"` — MV1LoadModel、stat にハンドル
  - `dx_mv1draw handle` / `dx_mv1setpos h,x,y,z` / `dx_mv1setrot h,rx,ry,rz` /
    `dx_mv1setscale h,sx,sy,sz` / `dx_mv1delete h`
- 動画再生 (0x150 台):
  - `dx_loadmovie "file", ID` — LoadGraph 経由で buffer[ID] に
  - `dx_playmoviegraph ID` / `dx_pausemoviegraph ID` / `dx_stopmoviegraph ID`

**サンプル** `sample_3d.hsp`:
- 濃紺 3D 背景、透視投影 60 度
- 中央に赤い球、周囲を回転する 6 色キューブ、下に緑の地面
- カメラが周回しつつ上下揺れる
- 2D テキスト HUD を 3D 上にオーバーレイ

**詰まりどころ (ユーザー実機フィードバックで段階修正)**

1. **キューブが白い** — `DrawCube3D` の DifColor は DxLib `GetColor()` pack 形式が必要。
   HSP の `0xRRGGBB` リテラルをそのまま渡すと変な解釈に。修正: `GetColor((col>>16)&0xFF, (col>>8)&0xFF, col&0xFF)` 経由。
2. **照明 OFF でも spccol が加算される** — `DrawCube3D` の SpcColor は照明無関係に加算挙動。
   0xFFFFFF だと白くなる。修正: spccol = 0x000000 を渡す。
3. **地面が画面上部に** — 実は描画順序の問題ではなく、Z バッファ OFF で後から描いた
   地面が前のオブジェクトを上書きしていた。修正: `dx_setzbuffer 1`。
4. **Z バッファ有効で描画がちらつく** — Z バッファがクリアされておらず前フレームの
   深度値が残っていた。修正: `boxf` を `cls` に変更 (DxLib ClearDrawScreen は色+Z を同時クリア)。
5. **カメラ角度が急で地面が中央までせり出して見える** — カメラ y=150 → y=60 に下げ、
   目線を地平線近くに調整。

**メモリ追加**
- `reference_dxlib_3d_gotchas.md` — 上記 5 点の落とし穴を記録 (次回再発防止)

**実機確認**
- 球・キューブ・地面すべて正しい色で描画、Z 深度も正常 ✅
- 2D 文字 HUD が 3D シーン上に正しくオーバーレイ表示

**Phase 5.2 残 (将来)**
- MV1 モデルの実データ読み込み検証 (x file / PMD 等、テストモデル未配置)
- 動画再生実機検証 (テスト動画未配置)
- ネットワーク / シェーダー (本格的に必要になったとき)

---

## 2026-04-21 (Phase 5.1: dx_* 命令公開基盤)

### (これから commit) @ 20:12 — Phase 5.1: iron_dxlib.as + dx_* 命令群

**やったこと**
- `package/win32/common/iron_dxlib.as` 新規: `#regcmd 9` + `#cmd dx_* $opcode`
  による独自キーワード登録 (hgimg4.as と同パターン)
- opcode 0x100 台を dx_* 命令用に予約、hsp3dx_extcmd.cpp に実装:
  - `0x100 dx_drawcircleaa` — AA 円 (DrawCircleAA)
  - `0x101 dx_drawlineaa` — AA 線 (DrawLineAA)
  - `0x102 dx_drawboxaa` — AA 矩形 (DrawBoxAA)
  - `0x103 dx_drawtriangle` — 三角 (DrawTriangle、AA 扱い)
  - `0x104 dx_drawmodigraph` — 4 頂点画像変形 (DrawModiGraph)
  - `0x110 dx_getjoypad` — ジョイパッド状態 ビットフィールド
  - `0x111 dx_joyanalog` — アナログスティック入力
  - `0x120 dx_setwaitvsync` — VSync 切替
  - `0x121 dx_setfullscreen` — フルスクリーン切替

**サンプル** `sample_dx.hsp`:
- AA 円 + 回転する放射 AA 線 (8 本)
- AA 塗り box + 枠 / AA 三角
- DrawModiGraph で波打つロゴ (4 頂点を sin で動かす)
- ジョイパッド状態 HUD 表示

**詰まりどころ**
- `~` を行継続に書いたら HSP パースエラー (HSP は continue char 不明)
  → 1 行にまとめた
- `iron_dxlib.as` が hspcmp から見つからない
  → 今のところ bin/Release/ にコピー。hspcmp の search path 検討 (将来)

**動作確認**
- ビルド成功、sample_dx.ax 1323 bytes コンパイル成功
- 実機で AA 描画 / DrawModiGraph 波打ち / 全機能動作確認 ✅
  (ジョイパッド未接続のため pad=0 表示、コード自体は動作)

**意義**
hspcmp 改造や DLL ハックを避けつつ、hgimg4 方式の **`#regcmd`/`#cmd` で
独自キーワード** を hsp3dx に追加できることを実証。Phase 5.2/5.3 でさらに
dx_* 命令を増やしていく基盤が整った。hsp3dish との差別化 (AA 描画 / 変形
描画 / ジョイパッド等、HSP 標準にない DxLib 機能) が実用形に。

---

## 2026-04-21 (Phase 1.10 + #regcmd 発見 + mmvol スケール訂正)

### (これから commit) @ 20:11 — Phase 1.10 + #regcmd 機構発見

**追加 opcode**
- `0x035 grect x, y, angle, wx, wy` — 回転塗り矩形 (DrawTriangle ×2)
- `0x036 grotate srcID, sx, sy, angle [, wx, wy]` — 回転画像コピー (DrawRotaGraph)
- `0x038 gradf x, y, w, h, mode, c1, c2` — 2 色グラデーション塗り
- `0x042 mmvol ID, vol` — サウンド音量
- `0x043 mmpan ID, pan` — サウンド定位 (-10000..+10000)
- `0x044 mmstat ID` — 再生中判定を stat に

**`#regcmd` / `#cmd` 機構発見**
- hspcmp 改造も `#uselib` ハックも不要で HSP キーワードを動的追加できる正攻法
- HSP3Dish hgimg4 が使用 (`package/win32/common/hgimg4.as`)
- 構文: `#regcmd 9` + `#cmd name $opcode` → opcode 0xN に name キーワード割付
- Phase 5.1 の `dx_*` 命令基盤がこれで解決、hspcmp 拡張も DLL ハックも不要に
- メモリ `reference_hsp_regcmd.md` 記録

**詰まりどころ: mmvol 0..255 誤解**
- 初回実装 `SetVolumeSoundMem` を 0..255 リニアと誤解、HSP mmvol (0..1000) を
  255 にマップ
- ユーザー実機テスト「BGM 聞こえない、ボリューム MAX でもダメ」
- `mmvol` を no-op にして BGM 単体テストで鳴ることを確認 → `SetVolumeSoundMem`
  自体が原因と特定
- 実際の DxLib スケールは **0..10000** (ヘッダコメントは "100 で 1 dB 単位
  0 〜 10000" で紛らわしいが挙動は線形)
- 255 渡し = DxLib の 2.55% → ほぼ無音だった
- 修正: `vol * 10` で 0..10000 マップ、BGM 正常化 ✅
- メモリ `reference_dxlib_setvolumesoundmem_scale.md` 記録

**サンプル**
`sample_mmvol.hsp`: ↑↓ で BGM 音量 (0..1000)、←→ で pan (-10000..10000)、
SPACE で SE 再生、mmstat で SE 再生中ステータス表示。背景は gradf 縦グラデ、
左に回転赤矩形 (grect)、右に回転ロゴ (grotate)。

**実機確認**
- 全機能動作確認済 ✅
- BGM 音量変化 / 左右パン / SE 発音 / 回転矩形 / グラデ背景すべて OK

---

## 2026-04-21 (Phase 1 完了 + 仕様訂正 + Phase 2.0 + Phase 5.0)

### (これから commit) @ 20:10 — Phase 5.0: gzoom / bmpsave / hsvcolor / ginfo

Phase 3/4 (mobile) より先に、Windows で目に見える機能追加。hspcmp が既に
知っている HSP 標準 opcode のうち未実装だった 4 つを extcmd/reffunc に追加。

**追加 opcode**
- `0x1f gzoom dw,dh,srcID,sx,sy,w,h` → DxLib DrawRectExtendGraph
  gmode 経由で blend mode 反映。拡大縮小スプライト描画。
- `0x21 bmpsave "file"` → DxLib SaveDrawScreen
  現在描画対象 (通常はメイン画面) を BMP として保存。
- `0x22 hsvcolor h,s,v` → HSV(0..255,0..255,0..255) → RGB 変換 + GetColor
  `color` の HSV 版、色相グラデーション作れる。
- `0x100 ginfo(p)` (reffunc) → グラフィック情報 (mouse/color/cur/view/screen 等)
  HSP 標準の ginfo システム関数。p=12,13 で画面サイズ等。

**サンプル** `sample_effects.hsp`:
- HSV 色相が循環する背景
- gzoom で拡大縮小するロゴ
- 円周状に 12 個配置した虹色の円 (HSV + 加算合成)
- **S キー** で `capture.bmp` にスクリーンショット保存
- ginfo(12)/ginfo(13) で画面サイズ取得

**動作確認**
- ビルド成功 (警告ゼロ)
- ユーザー実機で確認 ✅

**Phase 5 残り** (別作業)
- 5.1: dx_* 命令公開基盤 (hspcmp 拡張 or #uselib hijack) — 検討した結果
       両方インフラ重く、Phase 3/4 (mobile) の後で再検討
- 5.2: joypad / AA drawing / movie / network
- 5.3: DxLib.h パース + 自動コード生成 (→ 500 関数)

---

## 2026-04-21 (Phase 1 完了 + 仕様訂正 + Phase 2.0 scaffold)

### (これから commit) @ 20:09 — Phase 2.0: platform abstraction I/O API

**やったこと**
- `hsp3dx_platform_io.h` 新規: UTF-8 パスで読み込み専用のファイル I/O 抽象 API
  - stream 型: `hsp3dx_fopen` / `fread` / `fsize` / `fclose`
  - 便利関数: `hsp3dx_load_file_all` (malloc バッファにロード、free 関数付き)
  - 存在確認: `hsp3dx_file_size_if_exists` (サイズ or -1)
- `hsp3dx_platform_io_win.cpp` 新規: UTF-8 → wchar_t 変換 + `_wfopen` ベースで実装
- vcxproj に追加、ビルド成功

**設計意図**
* Win: Phase 1 実装そのままで OK、この API は scaffold (Win impl を載せたのは
  symbol を解決させるため)
* iOS (Phase 3): `hsp3dx_platform_io_ios.mm` を追加、`[NSBundle pathForResource:]`
  で bundle 内ファイルパスを取ってから fopen
* Android (Phase 4): `hsp3dx_platform_io_ndk.cpp` を追加、`AAssetManager_open`
  ベースで実装

**未着手 (Phase 2.1 / 2.2)**
* 2.1: VM `.ax` ローダ (Hsp3::Reset 内の dpm_readalloc) を platform_io 経由に書き換え
       Win は既存の fopen でも動くので急がない
* 2.2: picload / celload / mmload を mobile で `*FromMem` 系 (CreateGraphFromMem /
       LoadSoundMemByMemImage) に切替える橋渡し。Win は LoadGraph / LoadSoundMem で OK

Phase 3/4 実装時に「iOS/Android 側の実装を追加するだけ」で動くようになっている
ことが重要。Windows 実行バイナリは Phase 1 からサイズほぼ変わらず。

---

### (これから commit) @ 20:08 — 仕様訂正: hsp3dx_cnv 見送り、bundle/assets 統一

**経緯**
- ユーザー指摘: 「なんで .ax はバンドルじゃなくて C 配列で、画像/音声は bundle なの？」
- 実はその通りで、iOS bundle / Android assets は任意ファイルタイプを同梱可能。
  `.ax` だけ別経路 (`const uint8_t[]` の C ソース) にする合理的理由がない
- Phase 0 時点で hsp3cnv を AOT 翻訳器と誤解した残り火が設計に残っていた。
  Route B (runtime interpret) 確定後、`hsp3dx_cnv` は「単純バイト配列化ツール」
  に位置づけ直したが、それ自体が不要だった

**訂正内容**
- `docs/hsp3dx_spec.md / .html` の §6.2 iOS / §6.3 Android を `.ax` も画像/音声と
  同じく bundle / assets 経由に統一
- §6.4 を新設: Win = fopen / iOS = NSBundle / Android = AAssetManager の
  platform abstraction で全ファイル統一アクセス
- §7 Phase 計画: 旧 Phase 2 (`hsp3dx_cnv` / `hsp3dx_pack`) を**見送り**に。
  新 Phase 2 = platform abstraction I/O 層に再定義
- `.ax` 隠蔽が必要な特殊ケース向けの `hsp3dx_cnv` は Phase 6 以降のオプション扱い

**Phase 1 一旦完了サマリ (20:07 557a9f97)**
- extcmd 27 / reffunc 8
- sample_mes / sample_draw / sample_pic / sample_sprite / sample_input /
  sample_sound / sample_sysvar / sample_shooter の 8 本 (sample_shooter は
  60fps 自機+弾+敵+星+SCORE の総合サンプル)
- UTF-8 日本語 / X ボタン / ESC 終了 / 60fps / 音声ループ 全部動作

---

## 2026-04-21 (Phase 1.2 → 1.9)

### (これから commit) @ 20:07 — Phase 1.9: 総合シューティングサンプル + getkey VK 互換

**やったこと**
- `sample_shooter.hsp` — 自機 / 弾 / 敵 / 星背景 / 当たり判定 / SCORE 表示 の
  ミニシューティング (HSP 2838 bytes)
  - celload x 4 / mmload x 2 / celput / stick / getkey / ginfo 的 sysvar 全部使う
  - 60fps / 32 発弾 / 16 体敵 / 40 個星 同時
- Python Pillow / wave でアセット生成:
  - shooter_player.png (青三角船 32x32)
  - shooter_enemy.png (赤インベーダー 28x28)
  - shooter_bullet.png (黄弾 8x12)
  - shooter_star.png (白星 4x4)
  - shooter_shoot.wav (0.08 秒ブリップ)
  - shooter_hit.wav (0.15 秒爆発ノイズ)

**詰まりどころ: getkey の VK ↔ DIK コード問題**
- 初回テストで ESC キーが反応せず終了できない
- 原因: DxLib の `CheckHitKey` は **DirectInput 形式 DIK コード** (ESC=0x01) を
  受け取るが、HSP の getkey は伝統的に **Windows VK コード** (VK_ESCAPE=27) を
  受け取る仕様
- 私の getkey は CheckHitKey をそのまま使っていたため、`getkey v, 27` が
  DIK コード 27 (= KEY_INPUT_INSERT?) を見ていた
- **修正**: getkey を `GetAsyncKeyState(vk) & 0x8000` に切替、VK コードで HSP 互換
- stick は DIK コード固定 (arrow/space/enter/LMB) で内部完結してるので変更不要
- mobile 版では同等の VK→ネイティブキー写像が別途必要 (TODO 記録)

**動作確認**
- ビルド成功、hsp3dx.exe 7.1 MB
- 実機で自機移動・射撃・敵撃破・スコア加算・ESC 終了すべて OK ✅

**Phase 1 一旦完了**
- extcmd 27 / reffunc 8 / サンプル 7 本
- 描画 / 画像 / 入力 / 音声 / sysvar 全部動作、X ボタン / ESC 終了対応
- UTF-8 日本語表示 OK

---

### (これから commit) @ 20:06 — Phase 1.8: sysvar/reffunc 拡充 + exist の罠

**やったこと**
- reffunc を paren-aware に改良: `*type == TYPE_MARK && *val == '('` で関数形式を検出
- **hspcmp/hspcmd.cpp の keyword table を参照して正確な arg ID を取得** (最初は arg ID を
  適当に割り当てていて間違っていた)
- 追加実装:
  - `0x003 hwnd` — DxLib GetMainWindowHandle
  - `0x004 hinstance` — GetModuleHandle
  - `0x005 hdc` — 現状 0 返し (HDC は DxLib が直接公開していない)
  - `0x102 dirinfo(p)` — p=0 cwd / 1 exe dir / 4 cmdline / 6 langcode
  - `0x103 sysinfo(p)` — p=0 "Windows" / 1 CPU / 2 "DxLib" / 3 language

**詰まりどころ: HSPERR_INVALID_PARAMETER (30) の原因**
- 初回テストで起動時にエラーダイアログが出る問題
- ユーザーからの報告で bisect (mini2〜mini6) で `exist("start.ax")` が原因と判明
- `exist` は TYPE_INTCMD (文) で、hsp3typeinit_intcmd は cmdfunc のみ設定して
  reffunc は NULL のまま
- 式の中で `exist(...)` を評価すると `info->reffunc == NULL` で hsp3code.cpp:881 が
  HSPERR_INVALID_PARAMETER を throw
- これは標準 HSP でも同じ挙動 (hsp3dx のバグではない仕様)
- 正しい使い方: `exist "file"` 実行後に `strsize` で結果を取る
- メモリ `reference_hsp_exist_is_statement.md` に記録 (getpath / noteinfo / dirlist も同じ)

**動作確認**
- サンプル修正 (exist 式 → statement + strsize) で実機エラーなく表示 ✅
- sysinfo / dirinfo / strlen / mousex / hwnd すべて正しく表示される

---

### (これから commit) @ 20:05 — Phase 1.7: 音声 (mmload / mmplay / mmstop)

**やったこと**
- sound handle テーブル `s_snd_handle[256]` + `s_snd_option[256]` 追加
- `init_sounds_once()` で handle を -1 に初期化
- **opcode 実装**:
  - `0x08 mmload "file", ID, option` — LoadSoundMem、option 1 = BGM loop
  - `0x09 mmplay ID` — PlaySoundMem、option に応じて DX_PLAYTYPE_LOOP / DX_PLAYTYPE_BACK
  - `0x0a mmstop [ID]` — ID=-1 (省略) で全停止、指定時は StopSoundMem
- サンプル `sample_sound.hsp` + `test_bgm.wav` (3 秒和音ループ) + `test_se.wav` (0.3 秒ビープ)
  Python wave モジュールで自動生成

**動作確認**
- ビルド成功
- 実機で BGM 自動再生 + スペース SE + ESC 全停止+終了 確認 ✅

---

### (これから commit) @ 20:04 — Phase 1.6: 入力 (getkey / stick / mouse + sysvar)

**やったこと**
- **cmdfunc 追加**:
  - `0x23 getkey var, keycode` — `CheckHitKey(keycode)` を 0/1 で変数に代入
  - `0x2c mouse x, y` — `SetMousePoint(x,y)` (引数省略時は no-op)
  - `0x34 stick var, nonstop, exkey` — 方向キー / space / enter / 左マウス を
    ビットフィールド (0x01〜0x80) で返す、`exkey` 非 0 で ESC / 右マウスも含む
- **reffunc 全面書き直し**: TYPE_EXTSYSVAR は `(` `)` を取らないシステム変数なので、
  paren チェックを削除。`mousex` (0x000) / `mousey` (0x001) / `mousew` (0x002) 実装
- **`hsp3dxcl_msgfunc` に `ProcessMessage()` を追加**: wait/await 中もウィンドウ
  メッセージを処理しないと X ボタンが効かない/マウス入力がペンディングになる問題。
  ProcessMessage が -1 を返したら RUNMODE_END で VM を終了扱い → X ボタン正常化

**サンプル** `sample_input.hsp`:
- 矢印キーで黄色い円を移動
- スペースで色シャッフル
- マウスカーソルに白丸追従
- HUD で座標表示
- 60fps ループ (`await 16`)
- X ボタンで閉じられる

**動作確認**
- ビルド成功
- 実機で矢印移動・色変化・マウス追従・X 終了すべて確認 ✅

---

### (これから commit) @ 20:03 — Phase 1.5: buffer / gsel / celload / celput / gcopy / gmode

**やったこと**
- **buffer 管理テーブル**追加: `s_buf_handle[256]` / `s_buf_w[]` / `s_buf_h[]`
  ID 0 = DX_SCREEN_BACK (常に)、ID 1+ = MakeScreen / LoadGraph の graph handle
- **gmode 状態**追加: `s_gmode` / `s_gmode_w` / `s_gmode_h` / `s_gmode_alpha`
- `apply_gmode_blend()` ヘルパ: HSP gmode → DxLib SetDrawBlendMode マッピング
  - 0/2 → NOBLEND、3 → ALPHA、5 → ADD、6 → SUB
- 実装 extcmd 追加:
  - `0x1d gsel ID` — SetDrawScreen(resolve_draw_target(ID))
  - `0x1e gcopy srcID, sx, sy, w, h` — DrawRectGraph + 描画後 cur_x += w
  - `0x20 gmode mode, w, h, alpha` — 状態更新
  - `0x29 buffer ID, w, h` — MakeScreen + s_buf_handle[ID] 登録
  - `0x2a/0x2b screen/bgscr` — ID=0 のみ (サイズ変更は現状無視)、他はエラー
  - `0x3c celload "file", ID` — LoadGraph + handle 登録、ID<0 で空きを自動割当、stat に確定 ID
  - `0x3e celput ID [, frame, zx, zy, rot]` — DrawRotaGraph (画像中心を cur_x/cur_y に合わせる HSP 仕様)
- サンプル `hsp3dx/samples/sample_sprite.hsp` 追加: 通常 / 半分 / 半透明 / 加算 / 部分コピーの 5 パターン描画

**動作確認**
- ビルド成功 (警告ゼロ)
- 実機で sample_sprite 表示確認 → 青背景に 5 パターンのロゴ描画 + 白文字が出る ✅

---

### (これから commit) @ 20:02 — Phase 1.4: font + picload

**やったこと**
- `0x14 font "name", size, style` 実装
  - name 空なら size 変更のみ、空でなければ `ChangeFont(name)` でデフォルトフォント切替
  - size は `SetFontSize`、style bit 0 (bold) は `SetFontThickness` で反映
  - s_font_size (mes 行送り) も size+4 で更新
  - italic / effsize は Phase 1.5 以降で対応
- `0x17 picload "file" [, mode]` 実装
  - `LoadGraph` → `DrawGraph(s_cur_x, s_cur_y, handle, TRUE)` → `DeleteGraph`
  - 失敗時は `HSPERR_PICTURE_MISSING` throw
  - 即描画 + 即 dispose の MVP、ハンドル保持は Phase 1.5 (celload) で対応
- `hsp3dx/samples/test_logo.png` 追加 (128x128 青背景 + 黄丸、Python Pillow で生成)
- `hsp3dx/samples/sample_pic.hsp` 追加 (font サイズ変更 + 画像表示 + 日本語文字)

**動作確認**
- ビルド成功 (警告ゼロ)
- 実機で sample_pic の表示確認 → 青背景 + ロゴ画像 + 白/黄の文字が出る ✅

---

### (これから commit) @ 20:01 — Phase 1.3: pos/color/cls/redraw + pset/line/boxf/circle

**やったこと**
- 描画モデルを再設計: 「console バッファに書いて main で再描画」方式を捨て、
  **「extcmd から直接 DxLib の back buffer に描く」** 方式に変更
  (HSP 本来の挙動 = 描画はその場で back buffer に積まれ、redraw 1 で flip)
- `hsp3dx_console.{h,cpp}` は UTF-8→wchar_t 変換 utility だけに縮退、console バッファは削除
- 描画状態の global: `s_cur_x` / `s_cur_y` / `s_cur_color` / `s_font_size`
- 実装 extcmd 追加:
  - `0x0c pset` — DrawPixel
  - `0x11 pos` — 描画カーソル位置更新
  - `0x12 circle` — HSP の bbox 指定を DxLib DrawCircle の中心+半径に変換
  - `0x13 cls` — ClearDrawScreen + 位置リセット
  - `0x18 color r,g,b` — DxLib GetColor で packed color 更新
  - `0x1b redraw` — ビット 0 立ってたら ScreenFlip、0 は no-op
  - `0x2f line` — DrawLine、描画後に cur_x/cur_y 更新
  - `0x31 boxf` — DrawBox (fill=TRUE)
- main.cpp 刷新: VM 起動時に 1 回 Clear+Flip、VM 終了後 1 回 Flip、その後は
  ClearDrawScreen しないで ESC 待ち (VM の描画が消えないようにする)
- サンプル `hsp3dx/samples/sample_draw.hsp` 追加: 青背景 + 黄円 + 赤線 + 白文字

**詰まりどころ**
- 最初の実装では main ループが毎フレーム ClearDrawScreen していたため、VM 終了後に
  VM が描画したグラフィックが消えてしまう (text overlay だけ残る) 問題があった。
  → 描画モデルを根本から見直し、back buffer の内容は VM が管理する方式に
- HSP の `circle x1,y1,x2,y2,fill` は bounding box、DxLib は中心+半径なので変換必要

**動作確認**
- ビルド成功、hsp3dx.exe 6.95 MB、警告ゼロ
- 実機で sample_draw 表示確認 → 青背景 + 黄円 + 赤線 + 白文字が正しく表示 ✅

**2 度目の mojibake (sample_draw.hsp で再発) とその検証**
- 最初 `sample_draw.hsp` に `#cmpopt utf8 1` を書き忘れ → `hspcmp64 -i -u` で
  コンパイルしても出力が SJIS になった (ユーザー指摘で判明)
- この発生をきっかけに hspcmp64 の UTF-8 挙動を 7 組み合わせで実測検証
- **判明した真のルール**:
  1. `-u` cmdline 単体は **効かない** (ヘルプ記載と実挙動が違う)
  2. `#cmpopt utf8 1` が出力 UTF-8 化の本命スイッチ
  3. `-i` cmdline は入力 UTF-8 解釈に必須、`#cmpopt` では代替不可
  4. **`#cmpopt utf8 1` + `-i` のセット** が正しい UTF-8 ビルド手順
- 既存メモリ `reference_hspcmp_utf8_flags.md` を実測結果で全面書き直し
- `sample_mes.hsp` / `sample_draw.hsp` / `phase1_setup.md` のビルド手順も修正

**Phase 1 サブフェーズ進捗**
- 1.0 ✅ scaffold
- 1.1 ✅ VM 統合
- 1.2 ✅ mes / title / dialog (UTF-8)
- 1.3 ✅ pos / color / cls / redraw / pset / line / boxf / circle ← **これ**
- 1.4 未: font / picload / gcopy / gmode / celput
- 1.5 未: 音声 (DxLib LoadSoundMem / PlaySoundMem ラップ)
- 1.6 未: 入力 (stick / getkey / mouse / GetJoypadInputState)
- 1.7 未: 3 サンプル動作確認

---

## 2026-04-21 (Phase 1.2: mes 命令 + 文字列描画)

### (これから commit) @ 20:00 — Phase 1.2: mes / title / dialog 実装 + console バッファ + UTF-8 描画 (実機で日本語表示 OK)

**やったこと**
- **`hsp3dx_console.{h,cpp}`** 新規 — mes / print 用のテキストリングバッファ
  (64 行 × 512 bytes)。改行毎に新しい行を追加、最大行超過時は先頭をスクロール
- **`hsp3dx_extcmd.cpp`** 新規 (`hsp3dx_stubs.cpp` を置き換え) — cmdfunc_extcmd と
  reffunc_function を実装、Phase 1.2 スコープ:
  - `0x03` dialog: Win32 `MessageBoxA` で暫定代用
  - `0x0f` mes / print: `hsp3dx_console_append` でバッファに追記
  - `0x10` title: DxLib `SetMainWindowText` 経由でウィンドウタイトル更新
  - それ以外の extcmd は `HSPERR_UNSUPPORTED_FUNCTION` を throw
  - reffunc も全部 UNSUPPORTED throw (Phase 1.3 で sysinfo/dirinfo/exist 実装予定)
- **main.cpp** のレンダループに `hsp3dx_console_render_dxlib(10, 10, 0xFFFFFF)` を追加、
  VM が mes で書いた内容が画面に白文字で表示される
- **vcxproj** を更新: stubs.cpp 除去 → extcmd.cpp + console.cpp 追加

**詰まりどころ (UNICODE 問題)**
- 最初は `UNICODE;_UNICODE` を削除したが、`hsp3utfcnv.cpp` / `dpmread.cpp` /
  `supio_win_unicode.cpp` は `_tfopen` / `TEXT()` / `GetModuleFileName` など TCHAR
  マクロを使っているので UNICODE 必須。削ると wchar_t ↔ char 変換エラーが再発
- 一方で DxLib は UNICODE 定義下で `DrawString` が `const wchar_t*` を要求、
  `SetUseCharCodeFormat(DX_CHARCODEFORMAT_UTF8)` も UNICODE 版では無効化される
  仕様 (DxLib.h コメントより)
- **解決策**: global UNICODE 有効のまま、hsp3dx_console.cpp 側で UTF-8 char* を
  `MultiByteToWideChar(CP_UTF8, ...)` で wchar_t* に変換してから DxLib に渡す運用

**動作確認**
- ビルド成功: hsp3dx.exe 6.95 MB、警告ゼロ
- `start.hsp` (`mes "hello, hsp3dx!"` + 日本語 UTF-8 `mes` + `end`) を hspcmp64 で
  `.ax` に変換
- ユーザー実機で hsp3dx.exe を起動 → **ウィンドウに hello メッセージが正しく表示** ✅
- **Phase 1.2 実機動作確認 完了**

**mojibake 対応の経緯**
- 初回表示で日本語部分 "これは UTF-8 文字列" が "縺薙丨縺ッ UTF-8 譁・ュ恰・" に化けた
- .ax の hex dump で原因判明: "これ" が UTF-8 `E3 81 93 E3 82 8C` ではなく
  `E7 B8 BA E8 96 99` (= 縺薙の UTF-8 エンコーディング) として格納されていた
- 理由: `hspcmp64` を `-u` (出力 UTF-8) のみで実行、`-i` (入力 UTF-8) を指定していなかった
  ため、UTF-8 ソースを SJIS と誤認して 2 バイトごとに Unicode 文字へ誤変換、それを UTF-8 で出力
- `-i -u` 両方指定で再コンパイル → 正しい UTF-8 バイト列 `E3 81 93...` が .ax に格納 → 表示 OK
- hsp3dx ランタイム側のコードには問題なし (ビルド更新不要)

**詰まりどころ (再発防止ドキュメント)**
- `#cmpopt utf8 1` だけでは入力エンコーディングが SJIS のまま → 必ず hspcmp コマンドライン
  に `-i` を指定する必要あり
- `phase1_setup.md` に `-i -u` 両方必須の注意を赤字で追記

**追加成果物**
- `hsp3dx/samples/sample_mes.hsp` — Phase 1.2 動作確認用サンプル (UTF-8)
- `phase1_setup.md` の「動作確認」セクションを実機再現手順に更新

**決めごと**
- UNICODE 定義は global で有効、DxLib 境界で `MultiByteToWideChar` 明示変換
- mes の \n は `code_getdi(0)` が 0 (通常 mes) なら付加、1 (print) なら付加しない
- テキストレンダリングは固定 18px 行高 (Phase 1.3 で font サイズ可変化予定)

---

## 2026-04-20 (初日: Phase 0 全走破 + Phase 1.0 起点 + Phase 1.1 VM 統合)

### 01444ec7 @ 20:59 — Phase 1.1: hsp3 VM コア統合 + hsp3dxcl ドライバ

**やったこと**
- **設計訂正**: VM ベースを `hsp3embed` fork から **`hsp3/` コア (`Hsp3` クラス) fork** に変更
  - 根拠: `hsp3embed` の `Hsp3r::Reset()` は `__HspInit(Hsp3r*)` を **hsp3cnv が .ax ごとに
    自動生成** する前提で、AOT 翻訳モデル専用。Route B (runtime .ax interpret) と非互換
  - `hsp3/` の `Hsp3::Reset(int mode)` は runtime で `.ax` ファイルを読み込んで HSPHED 解析
    まで自己完結。標準 `hsp3cl.exe` が採用している方式
  - 仕様書 §1 / §3.5 / §6.2 / §6.3 / §9 を訂正、MD/HTML 両方
- **vcxproj 更新**: `hsp3/` コアの 19 ファイル + `win32gui/supio_win_unicode.cpp` を追加
- **`hsp3dxcl.{h,cpp}` 新規作成** — `hsp3/win32/hsp3cl.cpp` を参考に、COM / ComCtrl /
  Win32 MessagePump / Debug Dialog / DLL ロードを削った cross-platform ミニマル版:
  - `Hsp3` インスタンス管理
  - `Hsp3::Reset()` で .ax ロード
  - `msgfunc` は tick ベース wait のみ (PeekMessage 依存なし)
  - `code_execcmd()` を呼ぶ実行ループ
- **`hsp3dx_stubs.cpp` 新規作成** — `hsp3typeinit_cl_extcmd` / `hsp3typeinit_cl_extfunc` の
  空実装 (Phase 1.2 で mes / wait / await 等を実装予定)
- **`main.cpp` 書き直し** — DxLib init → VM init + .ax ロード → VM 実行 → ESC 待ち → 終了
- **Preprocessor 追加**: `HSP64` / `HSPWIN` / `HSPUTF8` / `UNICODE` / `_UNICODE` /
  `_CRT_SECURE_NO_WARNINGS`
- **ビルド成功**: `hsp3dx.exe` 6.94 MB (Phase 1.0 比 +150 KB = hsp3 VM コア 19 ファイル分)

**詰まりどころ**
- 初回ビルドで `supio_win_unicode.cpp` に大量の `wchar_t → char` 変換エラー
  → 原因: `UNICODE` / `_UNICODE` マクロが未定義だったため TCHAR マクロが ANSI 版 API に展開
    されていた。`hsp3utfcnv.cpp` / `dpmread.cpp` でも同様
  → 対策: preprocessor に `UNICODE;_UNICODE` 追加で `_wfopen` / `MessageBoxW` 等 wide 版
    に正しく展開され、すべて解消

**制約 (Phase 1.1 時点)**
- 拡張命令 (`mes` / `wait` / `await` / `exist` など) は未実装スタブ
  → 実際の HSP 命令を含む .ax を走らせると runtime error になる見込み
  → Phase 1.2 で extcmd テーブルを埋めていく
- 起動時の挙動: DxLib ウィンドウが開き、`start.ax` を読み込み試行。実行が終わったら
  ESC で終了
- 実動作確認 (GUI) は sandbox 環境では実行不可のため未検証。コンパイル/リンクの成功のみ確認

**決めごと**
- VM ベース確定: `hsp3/` コア、`hsp3embed` は採用しない
- Phase 6 到達時に hsp3net 系への統合判断を再考する点は据え置き

### ed9117ec @ 20:57 — DxLib SDK 配置 + Phase 1.0 の初回ビルド成功

### ed9117ec @ 20:57 — DxLib SDK 配置 + 初回ビルド成功

**やったこと**
- `DxLib_VC3_24f.zip` (206 MB) を `https://dxlib.xsrv.jp/DxLib/DxLib_VC3_24f.zip` からダウンロード
- 展開して日本語フォルダ「プロジェクトに追加すべきファイル_VC用」の中身 (約 424 ファイル)
  を `hsp3dx/extlib/dxlib_win/DxLib_VC/` にフラット配置 (SDK 本体は `.gitignore` 済)
- vcxproj を flat 配置に合わせて修正:
  - include path と lib path を同じ `DxLib_VC/` に統一
  - `DxLib_x64.lib` の明示リンク指定を削除 (`DxLib.h` 内 `#pragma comment(lib,...)` が自動選択)
  - `/utf-8` フラグ追加 (UTF-8 ソース固定のため必須)
  - `/wd4828` で DxLib.h 内 SJIS 日本語コメントの警告抑制
- `hsp3dx.exe` (6.78 MB) を VS 2022 v143 / x64 / Release / MT で **ビルド成功**、警告ゼロ

**詰まりどころ**
- 初回ビルドで大量の構文エラーが連鎖発生 → 原因は MSVC が UTF-8 ソースを SJIS として誤解釈
  していたため (WC 4819 警告が手がかり)。`/utf-8` 追加で解消
- DxLib ライセンス条項は公式ダウンロードページに直リンクがなく、配布 zip 内 `DxLib.txt`
  (SJIS) に書かれていた → `iconv` で UTF-8 変換して確認

**決めごと**
- DxLib は git 管理しない (ユーザー個別 DL)
- 再配布時には `DX Library Copyright (C) 2001-2025 Takumi Yamada.` 表記を入れる
- 商用利用 OK、ライセンス料なし (山田巧氏の寛容な方針)

### 0ea34c57 @ 20:56 — DxLib 公式 DL URL 調査 + iOS/Android extlib プレースホルダ

**やったこと**
- `https://dxlib.xsrv.jp/dxdload.html` を WebFetch で調査、3 プラットフォーム分の zip URL 取得
  - Windows: `DxLib_VC3_24f.zip` (~206 MB)
  - Android:  `DxLib_Android3_24f.zip` (~75 MB)
  - iOS:      `DxLib_iOS3_24f.zip` (~78 MB)
- 最新版は **Ver3.24f** (仕様書 §5.2 の UTF-8 モード要件合致)
- Phase 3/4 用の `hsp3dx/extlib/dxlib_{ios,android}/README.md` を先に作成 (将来忘れない)
- `.gitignore` に 3 プラットフォーム分の除外ルール追加

### c5af57fa @ 20:55 — Phase 1.0 Windows 版 scaffold

**やったこと**
- `hsp3dx/extlib/dxlib_win/README.md` — DxLib SDK 取得・配置手順
- `hsp3dx/src/` スケルトン:
  - `main.cpp` — WinMain (`.ax` ロード + DxLib init + 空ループ、ESC で終了)
  - `hgio_dx.{h,cpp}` — hgio 互換 API を DxLib 呼び出しに転送する層 (init / ProcessMessage /
    ScreenFlip / CheckHitKey / GetMousePoint のみ)
- `hsp3dx/win32/hsp3dx.vcxproj` — VS 2022 v143 / x64 / `_HSP64`/`HSP3DX` define / MT CRT
- `hsp3dx/docs/phase1_setup.md` — Phase 1 サブ Phase 進捗表 + ビルド手順
- `.gitignore` — DxLib SDK と `hsp3dx/{bin,obj}` 除外

---

### 69b02a21 @ 20:54 — §3.7 コールバック方針 (iOS/Android 制約対応)

**やったこと**
- iOS の W^X 制約 (動的コード生成禁止) と Android 10+ の制限強化を整理
- コールバック 3 技法の対応表: 静的スロット trampoline ✅ / 動的 trampoline ❌ iOS / CLR thunk ❌ iOS
- **hsp3dx は静的スロット方式を採用** — ビルド時に signature family ごとに N 個の C 関数を
  事前生成し、スロット ID → HSP ラベル ID マップで dispatch
- HSP3 classic の `callback` 命令 / hsp3net の `#defcbcom` は mobile 動作不可と明記
- Phase 対応: Phase 1 不使用 → Phase 5 導入 → Phase 6 本命 (SetMovieSurfaceCallback など)

### 81475bc2 @ 20:53 — §3 型システムの進化計画

**やったこと**
- DxLib の float / struct (VECTOR / MATRIX / VERTEX3D) / 構造体配列 / コールバック使用状況を整理
- hsp3net にあって hsp3embed に無い型機構: `#cfuncf` / `#cfuncst` / `NSTRUCT` / `#defcbcom`
- 3 方針の比較表:
  - 方針 1: プラグインで全吸収 (スカラ分解) — Phase 1-3
  - 方針 2: float + `#cfuncf` だけ追加 — Phase 4-5
  - 方針 3: NSTRUCT / cfuncst フル移植 — Phase 6
- Phase 6 到達時に hsp3embed / hsp3net / hsp3 のどれを長期ベースにするか再考する判断ポイント明記
- MD/HTML 両方で §番号を 3→4, 4→5, … に繰り下げ、TOC / anchor 更新

### f7a26c2c @ 20:52 — Route B 採用 (全プラットフォーム VM interpret)

**やったこと**
- **VM ベースを `hsp3embed` fork に確定** (リポジトリ内に既存、HSPIOS/HSPNDK 分岐 + iOS/misc.mm
  があり mobile ビルド実績あり)
- **過去の誤認識を訂正**: 「hsp3cnv は .ax をバイト配列化するだけ」は誤り。実際は各 HSP タスクを
  `static void L0001(void){...}` に AOT 翻訳する code generator。HSP3Dish mobile は AOT 方式
- Route A (hsp3dish AOT) と Route B (全 VM interpret) を比較し、**差別化を重視して Route B を採用**
- hsp3dx_cnv は単純なバイト配列書き出しツールに再定義 (hsp3cnv 流用しない)
- ランタイム構成図を 2 層 (hgio_dx + dxlib_core) に書き直し

**ユーザー指摘で判明した重要な事実**
- HSP3Dish iOS/Android は `.ax` を直接読んでいない → AOT 翻訳で C++ になって native ビルドされる
  ため。初回説明時に誤って「バイト列埋め込み」と言っていた

### a47469c8 @ 20:51 — HTML 版仕様書

**やったこと**
- `docs/hsp3dx_spec.html` を既存 docs/ の CSS スタイル (wstr_design.html 他共通) で整形
- TOC, hgio 差し替え戦略の ASCII 図、OK/NG プラグインのカラー区分、Phase バッジなど視覚化

### 91a73a5e @ 20:50 — Phase 0 設計資料 + 移行ツール + ディレクトリ雛形

**やったこと**
- `docs/hsp3dx_spec.md` 初版: HSP コマンド採用/除外分類、文字コード規則、Phase 計画
- `tools/hsp3dx_sjis2utf8/` — .NET 8 CLI、`.hsp` / `.as` を Shift-JIS → UTF-8 (BOM なし) 変換
  - BOM / ASCII / 既に UTF-8 のファイルは自動スキップ
  - `--dir --recursive --dry-run` オプション
  - `dotnet build` 成功、SJIS "テストデータ" → UTF-8 変換 smoke test pass
- `hsp3dx/samples/` — Phase 1 用検証サンプル雛形 (DrawGraph / Sound / Mouse)
- `hsp3dx/{win32,ios,ndk}/README.md` — 各プラットフォームビルド構成の配置先プレースホルダ

---

## 次回作業予定: Phase 1.1 — hsp3embed VM 組み込み

**目標**: `hsp3dx.exe` が `.ax` を読んで実行できるようにする

**タスク候補**
1. `hsp3embed/*.cpp` を vcxproj に追加 (`hsp3embed.cpp` / `hsp3code.cpp` / `hsp3r.cpp` /
   `hspsource.cpp` / `hspvar_util.cpp` / `misc.cpp`)
2. 依存する `hsp3/` 配下のコアソース (VM 本体、型システム、命令ディスパッチ) も追加
3. `hsp3eb_init` / `hsp3eb_exec` を main.cpp から呼ぶ経路を通す
4. `.ax` バイト列を hsp3embed に食わせる仕組み (`__HspInit` 代替 or 独自ローダ)
5. 動作確認用の最小 `.ax` (`mes "hello"` だけ) を実行

**事前の調査が必要なこと**
- `__HspInit( Hsp3r *hsp )` は hsp3embed.cpp 内で `extern` 宣言されているだけ。実体は
  どこに定義されているか要確認 (`hsp3cl_64` / `hsp3dish` どちらか)
- hsp3embed の start.ax ロード経路 (直接 `.ax` を読む API がないように見える)
- `HSPDISHGP` / `USE_OBAQ` などの define を hsp3dx でどう扱うか
