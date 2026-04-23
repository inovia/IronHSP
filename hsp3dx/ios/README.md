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

## 起動時間計測 / 最適化

### iOS 起動時間の内訳 (2026-04-24 調査)

Simulator (iPhone 15 / iOS 17) で `sample_simple.hsp` (Live2D なし) 計測:

| フェーズ | 所要 |
|---|---|
| `DxLib_Init` 全体 | **~2.4 秒** (調査前) / **~1.9 秒** (調査後) |
| └ `InitializeSoundSystem` (AVAudioSession + OpenAL) | 836 ms |
| └ `Graphics_Initialize::Timing0_PF` (EAGLContext + GL) | 198 ms |
| └ `Graphics_Initialize::InitFontManage` | 78 ms |
| └ `Graphics_Initialize` 末尾の 6x ScreenFlip warmup | ~~1166 ms~~ → **iOS ではスキップ** |
| bundle → Documents コピー (22 files / 5 MB) | 39 ms |
| `hsp3dxcl_init` | 4 ms |
| (Live2D サンプルの場合はさらに HSP VM 内で +12-15 秒、Cubism model/shader load) | |

### 実装済み最適化

**DxGraphics.cpp の 6x ScreenFlip warmup を iOS のみスキップ**
([dxlib_angle_sdl2/dxlib_portable/DxGraphics.cpp](../dxlib_angle_sdl2/dxlib_portable/DxGraphics.cpp) の
`#if !(defined(__APPLE__) && TARGET_OS_IPHONE)`)。DxLib 原作者が FPS 計測値の安定化の
ために `Graphics_Initialize` 末尾で ScreenFlip を 6 回空回ししているが、iOS Simulator では
1 flip ≈ 194ms (Metal 翻訳経由) かかるためここだけで 1.17 秒の起動遅延になっていた。
FPS 計測は実行開始後に正しく更新されるので省略可能。実測で起動時間 **2.4s → 1.9s (~-0.5s)** に短縮
(差分の一部は後続 `SetDrawScreen` に流れ込むが正味の改善はある)。

### 起動時間の再計測方法

[template/project.yml](template/project.yml) の `GCC_PREPROCESSOR_DEFINITIONS` で
`HSP3DX_IOS_STARTUP_TIMING=1` をコメント解除 → `xcodegen generate` + rebuild。
各フェーズに `printf("[TIMING_...] ...")` が仕込まれているので
`xcrun simctl launch --console booted com.ironhsp.hsp3dx` の stdout で観測できる。

## 未対応

- WebSocket (`dx_ws_*`) は stub のまま (Phase 3.2 で `NSURLSessionWebSocketTask` 実装予定)
- 実機 signing / Team ID 設定 (Phase 3.3)
- マルチタッチ動作確認 (実装は hgio_dx 共通だが iOS での動作は未検証)
- プッシュ通知 / In-App Purchase / GameKit 連携 (必要になったら)
- **Simulator 起動 Live2D の初期黒画面は HSP VM 側 Cubism model load が支配的** (実機では短いと予想、実機検証待ち)
