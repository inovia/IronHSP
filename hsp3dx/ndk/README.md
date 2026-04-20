# hsp3dx/ndk

Android 版 `libhsp3dx.so` と Android Studio プロジェクトテンプレを配置予定 (Phase 4)。

## 想定構成

```
ndk/
  libhsp3dx/
    CMakeLists.txt               HSP VM + hgio_dx + dxlib_core を shared lib ビルド
    src/
      hgio_dx_ndk.cpp            Android DxLib 差し替え層
      axload_android.cpp         assets 内 .ax を AAssetManager 経由で読む
  template/
    hsp3dx_template/             Gradle プロジェクトテンプレ
      app/
        src/main/
          cpp/start.cpp          hsp3dx_cnv で生成された .ax バイト埋め込み
          java/...               JNI 呼び出しと GLSurfaceView / SurfaceView ランチャー
          assets/                画像 / 音声など
```

## 依存

- DxLib Android 版 SDK
- Android Studio Hedgehog 以上
- NDK r26+
- minSdk 21 (Android 5.0)、targetSdk は最新

## 配布フロー (Phase 4 予定)

1. ユーザーが `your_game.hsp` を hspcmp で `.ax` にコンパイル (UTF-8 / hsp64 1)
2. `hsp3dx_cnv start.ax start.cpp` で C++ バイト配列化
3. `hsp3dx_template/` の `app/src/main/cpp/start.cpp` に配置、assets もコピー
4. Android Studio でビルドして `.apk` / `.aab` 作成
