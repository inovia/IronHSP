# hsp3dx/ios

iOS 版 `libhsp3dx.a` と Xcode プロジェクトテンプレを配置予定 (Phase 3)。

## 想定構成

```
ios/
  libhsp3dx/
    libhsp3dx.xcodeproj          HSP VM + hgio_dx + dxlib_core を static lib ビルド
    src/
      hgio_dx_ios.mm             iOS DxLib 差し替え層 (Objective-C++)
      axload_ios.mm              bundle 内埋め込み .ax を読む
  template/
    hsp3dx_template.xcodeproj    ユーザー配布用テンプレプロジェクト
    Resources/
      start.cpp                  hsp3dx_cnv で生成された .ax バイト埋め込み C++
      assets/                    画像 / 音声など
```

## 依存

- DxLib iOS 版 SDK
- Xcode 15 以上 (Swift 不使用、Objective-C++ のみ)
- iOS 13.0 以上 (DxLib 最低要件に合わせる)

## 配布フロー (Phase 3 予定)

1. ユーザーが `your_game.hsp` を hspcmp で `.ax` にコンパイル (UTF-8 / hsp64 1)
2. `hsp3dx_cnv start.ax start.cpp` で `.ax` を C++ バイト配列に埋め込み
3. `hsp3dx_template.xcodeproj` に `start.cpp` と assets を配置
4. Xcode でビルドして `.ipa` 作成
