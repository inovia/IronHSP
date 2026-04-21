# hsp3dx

HSP3 + **DxLib** を同じ `.ax` 1 本で Windows / iOS / Android を動かすクロスプラットフォームランタイム。

- HSP3Dish との差別化 = **DxLib の 2000 関数超の API** (3D / エフェクト / 動画 / ネットワークなど) が mobile でも同じ API で呼べる
- 3 プラットフォームで **同一 `.ax` バイト列** を VM がインタプリト実行
- 文字コードは **UTF-8 固定** (3 プラットフォーム共通化のため)

## 仕様

→ [docs/hsp3dx_spec.md](../docs/hsp3dx_spec.md)

## 現状 (2026-04-21): Phase 4 (Android) 完了 — Win + Android の 2 プラットフォーム同一 `.ax` 実行

| Phase | 内容 | 状態 |
|---|---|---|
| Phase 0 | 仕様書 / SJIS→UTF-8 移行ツール / ディレクトリ雛形 | ✅ |
| Phase 1 | Windows 版 `hsp3dx.exe` MVP (HSP 標準描画 + DxLib コア) | ✅ |
| Phase 2 | プラットフォーム I/O 抽象層 | ✅ |
| Phase 5.0 | エフェクト (gzoom / bmpsave / hsvcolor / ginfo) | ✅ |
| Phase 5.1 | dx_* (`#regcmd`+`#cmd` 機構)、AA 描画 / ジョイパッド | ✅ |
| Phase 5.2 | 3D プリミティブ / MV1 モデル / 動画再生 | ✅ |
| Phase 5.3 | DxLib API 自動生成 (初期 512 関数) | ✅ |
| Phase 5.4a/b/c | HTTP / JSON / WebSocket クライアント | ✅ |
| Phase 5.5a-n | `#defstruct` 対応 / ref 引数 / struct 戻り値 / callback / Polygon | ✅ |
| Phase 4.a-c | Android ビルド骨格 (NDK / CMake / NativeActivity) | ✅ |
| Phase 4.d-f | Android サンプル検証 / タッチ入力 / 画面フィット | ✅ |
| Phase 4.g | Android HTTP 本実装 (JNI → HttpURLConnection) | ✅ |
| Phase 4.h | Android ドキュメント | ✅ |
| Phase 4.i | `screen` 命令で論理解像度切替 / `dx_getdispsize` | ✅ |
| Phase 4.j | Android マルチタッチ (`dx_getmtouchnum` / `dx_getmtouch`) | ✅ |
| Phase 4.k | Android WebSocket 本実装 (OkHttp 3.14.9) | ✅ |
| Phase 4.l | HTTP multipart/form-data アップロード | ✅ |
| Phase 3 | iOS 版 `libhsp3dx.a` + Xcode テンプレ | 未着手 |

詳細: [ndk/README.md](ndk/README.md) (Android)

## API 実装カバレッジ

| 区分 | 件数 |
|---|---|
| DxLib.h `extern` 総数 | 2466 |
| 手書き `dx_*` 拡張命令 (iron_dxlib.as) | 73 |
| 自動生成 文形式 `dx_*` (iron_dxlib_auto.as) | 1650 |
| 自動生成 **式形式** `dx_*_f` (iron_dxlib_auto_f.as、`#ccmd`) | 1144 |
| **合計 HSP から叩ける呼び出し口** | **2867** |
| 追加: HTTP / JSON / WebSocket 独自命令 | 46 |
| 追加: DxLib コールバック (5 種) | 5 |

`#defstruct` ベースの NSTRUCT 型で VECTOR / MATRIX / COLOR_F 等の DxLib 構造体を
直接扱える。ref 引数 (out-param) と struct 戻り値も自動生成で対応済。

Phase 5.5p で hspcmp に新規追加した `#ccmd` ディレクティブ
(文形式 `#cmd` の式形式版、`#func`/`#cfunc` と同じ対応関係)
により、`v = dx_GetColor_f(255, 0, 0)` のような式呼び出しが可能。

## 使い方

```hsp
#bootopt hsp64 1
#cmpopt utf8 1
#include "iron_dxlib.as"

; HSP 組み込み命令はそのまま
color 20, 30, 60
boxf 0, 0, 640, 480

; DxLib 独自命令は dx_ プレフィックス
dx_setcamerapos 0, 100, -400, 0, 0, 0
dx_drawsphere3d_s 0, 0, 0, 80, 16, 0xFF4040, 0, 1   ; scalar 版 (handwritten)

; 直接版 (auto-gen、DxLib 原関数名そのまま) も使える
#defstruct VECTOR
    #field float x
    #field float y
    #field float z
#endstruct
stdim v, VECTOR
v->x = 0.0 : v->y = 0.0 : v->z = 0.0
dx_DrawSphere3D v, 80.0, 16, 0xFF4040, 0, 1         ; VECTOR 版 (auto-gen)

; 式形式 (#ccmd、スカラー戻り値の関数)
col = dx_GetColor_f(255, 128, 64)                   ; v = func(args) の形

redraw 1
repeat : await 16 : getkey k, 27 : if k : break : loop
end
```

コンパイル: `hspcmp64.exe -i -d your_script.hsp`
実行: `hsp3dx.exe your_script.ax`

## ディレクトリ構成

```
hsp3dx/
  samples/         動作確認用サンプル (25 本、全コンパイル OK)
  src/             hsp3dx ランタイム C++ ソース
  win32/           Windows 版 hsp3dx.exe の vcxproj
  extlib/          DxLib SDK (win32 / ios / android) + picojson
  ios/             Phase 3 で Xcode プロジェクトを配置 (未着手)
  ndk/             Phase 4 で Android Studio プロジェクトを配置 (未着手)
```

## 関連ツール

- [tools/hsp3dx_dxlib_gen/](../tools/hsp3dx_dxlib_gen/) — DxLib.h から `iron_dxlib_auto.{as,cpp,hs}` を再生成 (1650 関数)
- [tools/hsp3dx_sjis2utf8/](../tools/hsp3dx_sjis2utf8/) — 既存 SJIS `.hsp` → UTF-8 一括変換

## サンプル

| サンプル | 内容 |
|---|---|
| sample_3d / sample_3d_vec | 3D プリミティブ (球/立方体/三角形/カプセル/コーン) |
| sample_polygon | VERTEX3D 配列で DrawPolygon3D |
| sample_http / sample_http_ex | HTTP GET/POST/PUT/DELETE/PATCH/download/multipart |
| sample_json | JSON パース / 構築 (picojson) |
| sample_ws | WebSocket (wss://) |
| sample_struct_smoke | `#defstruct` 基本動作 |
| sample_struct_array | 配列要素 + CHAR_ARRAY |
| sample_struct_nested | ネスト構造体 + union |
| sample_outparam_smoke | ref 引数 (VectorAdd / VectorNormalize 等) |
| sample_ret_smoke | struct / LONGLONG 戻り値 |
| sample_callback | 非同期画像ロード完了コールバック |
| sample_auto | 自動生成命令の呼び出し例 |

## ヘルプファイル (.hs)

- [package/hsphelp/iron_dxlib.hs](../package/hsphelp/iron_dxlib.hs) — 手書き dx_* (77 命令) 日本語詳細
- [package/hsphelp/iron_dxlib_auto.hs](../package/hsphelp/iron_dxlib_auto.hs) — 自動生成 1650 命令の索引 + 原関数シグネチャ
