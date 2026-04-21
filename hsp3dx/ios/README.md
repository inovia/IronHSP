# hsp3dx/ios

hsp3dx の **iOS 版 Xcode プロジェクトテンプレート** (Phase 3、2026-04-21 着手)。

Win/Android と同じ `.ax` バイナリを iOS シミュレータ / 実機で動かすための、
`libDxLib_iOS.a` 内部の `UIApplicationMain` → `ios_main` 構造を活用した
xcodegen ベースの Xcode プロジェクトです。

## 現状 (Phase 3.0、実機ビルド未検証)

| サブフェーズ | 内容 | 状態 |
|---|---|---|
| 3.0 | project.yml (xcodegen) / Info.plist / main_ios.mm | ✅ ソース作成済 |
| 3.0 | HTTP 本実装 (NSURLSession + multipart) | ✅ |
| 3.0 | ファイル I/O 抽象 (hsp3dx_platform_io_ios.mm) | ✅ |
| 3.1 | シミュレータビルド確認 | ⏳ Mac 側検証待ち |
| 3.2 | WebSocket (NSURLSessionWebSocketTask) | ❌ stub のまま |
| 3.3 | 実機ビルド / signing | ❌ |

## 動作環境

- macOS 12+ (Xcode 14 以上)
- Xcode 14+ / iOS SDK 14+
- `xcodegen` (`brew install xcodegen`)
- 最小 deployment target: iOS 14

## ディレクトリ構成

```
hsp3dx/ios/
  README.md              ← このファイル
  template/
    project.yml          ← Xcode プロジェクト生成元 (xcodegen)
    Sources/
      Info.plist         ← 最小 iOS Info.plist
    Data/
      start.ax           ← bundle に同梱される HSP バイトコード
```

## ビルド手順 (Mac 側)

### 1. `.ax` を配置

```sh
# Windows 側で hspcmp コンパイルしたものを、共有経由で取得
cp my_game.ax /Volumes/HNWorks/IronHSP_2026/hsp3dx/ios/template/Data/start.ax
```

### 2. xcodegen で Xcode プロジェクト生成

```sh
cd /Volumes/HNWorks/IronHSP_2026/hsp3dx/ios/template
xcodegen generate
```

`hsp3dx.xcodeproj` が自動生成される。

### 3. シミュレータビルド + 起動

```sh
# ビルドのみ
xcodebuild -project hsp3dx.xcodeproj \
           -scheme hsp3dx \
           -destination 'generic/platform=iOS Simulator' \
           -sdk iphonesimulator \
           build

# GUI で開いて Cmd+R で実行
open hsp3dx.xcodeproj
```

### 4. 開発時サンプル差し替え (リビルド不要)

シミュレータなら app container に直接ファイルを置ける:

```sh
APP_DATA=$(xcrun simctl get_app_container booted com.ironhsp.hsp3dx data)
cp my_sample.ax "$APP_DATA/Documents/start_override.ax"
xcrun simctl terminate booted com.ironhsp.hsp3dx
xcrun simctl launch booted com.ironhsp.hsp3dx
```

起動時に `Documents/start_override.ax` があれば bundle の `Data/start.ax` より優先される
(Android の `files/start_override.ax` 機構と同じ)。

## iOS 固有の実装メモ

### エントリポイント

DxLib iOS は `libDxLib_iOS.a` 内部で `UIApplicationMain` / `AppDelegate` を持ち、
ユーザー側は `int ios_main(void)` を書くだけで済みます
(Android の `android_main` と同構造)。詳細は [main_ios.mm](../src/main_ios.mm)。

### DxLib iOS の API 差分

- `GetDocumentsDirPath` / `GetLibraryCachesDirPath` / `GetTmpDirPath` などパス取得
- `GetDisplayResolution_iOS` / `GetLanguage_iOS` / `GetCountry_iOS`
- `GetDeviceMotionInfo_iOS` (モーションセンサー)
- `PlayVibration_iOS` (振動)
- `StartInputStringDialogBox` (モーダル入力ダイアログ)
- `GetTouchInput` / `SetFullScreenScalingMode` は Android / iOS 共通 → hgio_dx 側で
  `#if defined(__ANDROID__) || defined(__APPLE__)` 分岐で流用

### NSURLSession 経由の HTTP

Android と異なり JNI ブリッジ不要、Obj-C++ (`.mm`) で NSURLSession を直接呼べる。
multipart も自前で `--boundary` 組み立てて `NSMutableData` に詰めるだけ。
詳細は [hsp3dx_http_ios.mm](../src/hsp3dx_http_ios.mm)。

## 未対応

- WebSocket (`dx_ws_*`) は stub のまま (Phase 3.2 で `NSURLSessionWebSocketTask` 実装予定)
- 実機 signing / Team ID 設定 (Phase 3.3)
- マルチタッチ動作確認 (実装は hgio_dx 共通だが iOS での動作は未検証)
- プッシュ通知 / In-App Purchase / GameKit 連携 (必要になったら)
