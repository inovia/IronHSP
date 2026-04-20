# hsp3dx/extlib/dxlib_android

**DxLib Android 版 SDK の配置先。Phase 4 (Android 版 hsp3dx) で使う**。SDK 本体はリポジトリに含まれない (`.gitignore` で除外)。

## 取得手順

1. 公式ダウンロードページ https://dxlib.xsrv.jp/dxdload.html にアクセス
2. **Android 用パッケージ** をダウンロード
   - 直リンク (Ver3.24f 時点): https://dxlib.xsrv.jp/DxLib/DxLib_Android3_24f.zip
   - サイズ: 約 75 MB
3. zip を展開して、本ディレクトリに配置 (具体的な構造は zip の `README.txt` に従う)

## 使い方 (Phase 4 予定)

Android Studio + NDK でビルドする際、`CMakeLists.txt` から DxLib の arm64-v8a / armeabi-v7a / x86_64 いずれかのアーキテクチャに対する静的ライブラリをリンクする形で使う。詳細は Phase 4 で `hsp3dx/ndk/` のテンプレを作成する際に文書化予定。

## 現状 (Phase 1.0)

本ディレクトリは Phase 4 までプレースホルダ。配置作業は Android 版着手時に行えば OK。
