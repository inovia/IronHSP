# Cubism SDK for Native (hsp3dx DxLib 3.24f 用)

ここに [Live2D Cubism SDK for Native](https://www.live2d.com/download/cubism-sdk/) **4-r.7** を展開して配置します。

**重要:** hsp3dx がバンドルする DxLib 3.24f prebuilt は Cubism Core **4** 系 API を要求します (`csmGetDrawableRenderOrders` など)。Cubism 5 では同 API が rename されているため、Cubism 5 DLL では動きません。

Desktop SDL2 fork (Mac/Linux/Web) は別途 [../../dxlib_angle_sdl2/extlib/cubism/](../../dxlib_angle_sdl2/extlib/cubism/) で Cubism **5-r.5** を使用 (SDL2 fork 側は source build なので Cubism 5 API に合わせられる)。

**SDK 本体は `.gitignore` で commit 除外**されています (Live2D Inc. の個別ライセンスのため)。
各開発者が Live2D 公式から規約同意のうえ個別 DL してください。

## 配置手順

1. [Live2D 公式](https://www.live2d.com/download/cubism-sdk/) から `CubismSdkForNative-5-r.5.zip` を DL
2. このディレクトリに展開、`CubismSdkForNative-5-r.5/` 配下の内容を直接ここへフラット化

展開後の期待レイアウト:

```
cubism_sdk_native/
├── README.md           (このファイル、commit される)
├── README_SDK.md       (SDK 付属 README を rename したもの)
├── CHANGELOG.md
├── Core/
│   ├── dll/
│   ├── include/        Live2DCubismCore.h
│   └── lib/
│       ├── android/    armeabi-v7a / arm64-v8a / x86 / x86_64
│       ├── ios/        iphoneos / iphonesimulator (Debug/Release)
│       ├── linux/      x86_64
│       ├── macos/      x86_64 / arm64
│       └── windows/    x86 / x86_64, toolset 141/142/143
├── Framework/          Cubism Framework C++ source
├── LICENSE.md
└── Samples/
```

## 利用状況

- **Windows**: [DxLib 本家](https://dxlib.xsrv.jp/) の Live2D 有効版 prebuilt が使える
- **Android / iOS**: `DxLibEnableLive2D_{Android,iOS}_3_24f.zip` を DxLib SDK に上書き + ここの Core lib を link
- **Desktop SDL2** (Mac/Linux/Web): [../../dxlib_angle_sdl2/extlib/cubism/](../../dxlib_angle_sdl2/extlib/cubism/) に一部 bundle 済 (Framework source + Core Win)。他 platform Core はここから流用可

## ライセンス

SDK 本体は [Live2D Proprietary Software 使用許諾](https://www.live2d.com/eula/live2d-proprietary-software-license-agreement_jp.html)。
フリー素材版 / 商用版で条件が異なるため、配布アプリに同梱する際は要確認。
