# hspcv4 — OpenCV 4.x plugin for IronHSP

HSP から OpenCV 4.x の機能を利用するためのプラグイン DLL。

- **hspcv4.dll** (Win32, 静的リンク)
- **hspcv4_64.dll** (x64, 静的リンク)

既存の `hspcv` (OpenCV 1.x C API) は後方互換を目的とせず、全面刷新した新 API。

## ビルド手順

事前準備:
- Windows 10 以降 (curl/tar が標準で入っていること)
- Visual Studio 2022 (C++ デスクトップワークロード、CMake コンポーネント)

初回セットアップ + ビルド:

```
cd plugins\win32\hspcv4\build
setup_opencv.bat       :: OpenCV 4.12.0 を DL して third_party\ に展開
build_all.bat          :: 32bit/64bit 両方の OpenCV を静的ビルド
```

個別ビルド:

```
build_opencv_64.bat    :: x64 のみ
build_opencv_32.bat    :: Win32 のみ
```

詳細は `docs/hspcv4_build.html` を参照。

### オプション: FFmpeg 対応 (動画コーデック拡張)

既定では FFmpeg 非同梱です (cv::VideoWriter で MJPG/H264/MP4 等は
書き出せません)。有効にしたい場合:

```
set HSPCV4_WITH_FFMPEG=1
build\build_all.bat
```

OpenCV がビルド時に `opencv_videoio_ffmpeg*.dll` を GitHub から
自動ダウンロードします。実行時はこの DLL を hsp3.exe と同じ
ディレクトリに配置する必要があります。詳細は
`docs/hspcv4_build.html` の「オプション: FFmpeg 対応」節を参照。

## ディレクトリ構成

```
hspcv4/
├── build/              ビルドバッチと生成物 (third_party 以下は git 管理外)
├── docs/               ドキュメント
├── src/                hspcv4 本体の C++ ソース (Phase 1 以降で追加)
├── package/            .as / .hs (Phase 1 以降で追加)
└── third_party/        OpenCV ソース (setup_opencv.bat が配置、git 管理外)
```
