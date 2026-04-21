# hsp3dx/ndk

hsp3dx の **Android 版 APK ビルド用テンプレート** (Phase 4 完了、2026-04-21)。

Win 版と同じ `.ax` バイナリを Android 端末で動かすための NativeActivity ベースの
Android Studio / Gradle プロジェクトです。

## 現状 (Phase 4.a〜4.g 完了)

| サブフェーズ | 内容 | 状態 |
|---|---|---|
| 4.a | NDK ビルド骨格 (CMake / AGP / NativeActivity) | ✅ |
| 4.b/c | DxLib Android SDK リンク、hsp3dx.so ビルド成功 | ✅ |
| 4.d/e | サンプル `.ax` を Android で実行確認 (draw / 3d / json) | ✅ |
| 4.f | タッチ入力 (mousex/mousey/stick で取得可) + 画面フィット letterbox | ✅ |
| 4.f-ext | `dx_setscreenfit` で letterbox / ストレッチ切替 | ✅ |
| 4.g | HTTP 本実装 (HspHttp.java + JNI → HttpURLConnection) | ✅ |

未着手:
- WebSocket (dx_ws_*) は Android では stub 実装のまま (Phase 5.4c 相当)
- multipart/form-data アップロード (Phase 4.x)

## 動作環境

- Android NDK r23.1 以上 (対応確認済: r23.1.7779620)
- Android SDK / Build Tools (targetSdk 34 以上)
- Gradle 7.6.4 / AGP 7.4.2 (テンプレ同梱)
- minSdk 21 (Android 5.0) / targetSdk 34

対応 ABI: `arm64-v8a` / `x86_64` (armeabi-v7a / x86 も DxLib 側に .a は存在するがビルドから除外)

## ディレクトリ構成

```
hsp3dx/ndk/
  README.md             ← このファイル
  template/             Android Studio プロジェクト本体
    build.gradle        プロジェクト root
    settings.gradle
    app/
      build.gradle      モジュール
      src/main/
        AndroidManifest.xml   NativeActivity 登録 + INTERNET permission
        assets/
          start.ax      ここにコンパイル済み .ax を配置 (hsp3dx ランタイムが起動時に読む)
        cpp/
          CMakeLists.txt   hsp3 VM + hsp3dx src + dxlib_android の link 設定
        java/com/ironhsp/hsp3dx/
          HspHttp.java  HTTP JNI helper (HttpURLConnection)
        res/            strings.xml 等 (アプリ名のみ)
```

## ビルド手順

### 1. 自分の `.hsp` を `.ax` にコンパイル

```cmd
package\win32\hspcmp64.exe ^
    -i -u ^
    --compath=package\win32\common\ ^
    my_game.hsp
```

- `-i` 入力 UTF-8 / `-u` 出力 UTF-8 (hsp3dx は UTF-8 固定なので両方必須)
- `#bootopt hsp64 1` / `#cmpopt utf8 1` をスクリプト先頭に書く
- `#include "iron_dxlib.as"` で DxLib 命令 (dx_*) を取り込む

### 2. `.ax` を assets に配置

```sh
cp my_game.ax hsp3dx/ndk/template/app/src/main/assets/start.ax
```

ファイル名は **必ず `start.ax`** (ランタイムがこの名前固定で読む)。

### 3. 追加リソース (PNG/WAV 等) も assets に配置

```
app/src/main/assets/
  start.ax
  images/logo.png
  se/click.wav
```

HSP 側からは `picload "images/logo.png"` のような相対パスで読めます
(ランタイムが assets を内部 private dir に展開してから fopen で読む仕組み)。

ただし現状の Phase 4 では **`start.ax` のみ** 自動展開。他のアセットは
コード側で `FileRead_open` / `FileRead_read` を呼んで展開する必要があります
(`main_ndk.cpp` の `extract_asset` 参照)。

### 4. Gradle でビルド

```sh
cd hsp3dx/ndk/template
./gradlew.bat assembleDebug          # Windows
./gradlew assembleDebug              # macOS / Linux
```

成果物: `app/build/outputs/apk/debug/app-debug.apk` (約 19 MB)

### 5. エミュレータ / 実機にインストール

```sh
adb install -r app/build/outputs/apk/debug/app-debug.apk
adb shell am start -n com.ironhsp.hsp3dx/android.app.NativeActivity
```

## 開発時のサンプル差し替え (APK ビルド不要)

`assets/start.ax` を書き換えるには APK リビルド＋再インストールが必要ですが、
開発中は `start_override.ax` 機構で回避できます。

```sh
# コンパイルしたサンプルを端末にプッシュ
adb push sample_foo.ax /data/local/tmp/ax_override.bin
adb shell "run-as com.ironhsp.hsp3dx sh -c \
  'cp /data/local/tmp/ax_override.bin /data/data/com.ironhsp.hsp3dx/files/start_override.ax'"

# アプリを再起動
adb shell am force-stop com.ironhsp.hsp3dx
adb shell am start -n com.ironhsp.hsp3dx/android.app.NativeActivity
```

起動時、`files/start_override.ax` があれば assets の `start.ax` より優先されます。

## Android 固有の注意点

### パッケージ名の変更

デフォルト `com.ironhsp.hsp3dx` を自分のアプリに変えるには:

1. `app/build.gradle` の `namespace` / `applicationId` を変更
2. `app/src/main/java/com/ironhsp/hsp3dx/HspHttp.java` のパスとパッケージ宣言を変更
3. `HspHttp` を呼び出している `src/hsp3dx_http_ndk.cpp` の
   `"com.ironhsp.hsp3dx.HspHttp"` 文字列も変更

### 画面サイズとフィット

論理解像度は **640×480 固定**。物理画面にアスペクト比維持で letterbox 表示
(上下 or 左右に黒帯) されます。ストレッチ表示に切替えたい場合:

```hsp
dx_setscreenfit 1   ; 0=比率維持(default) / 1=ストレッチ / 2=等倍(予約)
```

### タッチ入力

`mousex` / `mousey` / `stick` (bit 0x40 = 左ボタン扱い) でタッチ座標・状態を取得。
物理座標は内部で論理 640×480 系に変換済みです。マルチタッチは現状未対応。

### HTTP

`dx_http_get` / `dx_http_post` 等が JNI 経由で `HttpURLConnection` を呼びます。
`AndroidManifest.xml` には `<uses-permission android:name="android.permission.INTERNET"/>`
が必要 (テンプレで既に設定済み)。

HTTPS のみのサイト用に `android:usesCleartextTraffic="true"` も既定で ON
(HTTP 通信も許可)。不要な場合は削除してください。

### 未対応

- マルチタッチ (現状 1 本指のみ)
- 画面回転時のリロード (固定: 縦のみ対応)
- WebSocket (dx_ws_*)
- multipart/form-data アップロード
- Cookie 持続 (セッション)
- Basic 認証ヘルパの base64 エンコード

## 動作確認済みサンプル

| サンプル | 内容 | 状態 |
|---|---|---|
| sample_mes | HSP 標準描画 | ✅ |
| sample_draw | 図形描画 | ✅ |
| sample_3d | DxLib 3D プリミティブ | ✅ |
| sample_json | picojson パース / 構築 | ✅ |
| sample_http | httpbin.org GET/POST | ✅ |
| sample_touch | タッチ入力 + 画面サイズ | ✅ |
