# WebView2 SDK 配置手順

`hspwebview2.dll` のビルドには Microsoft Edge WebView2 SDK のヘッダ
(`WebView2.h` ほか) と、静的リンク用の `WebView2LoaderStatic.lib` が必要です。
NuGet パッケージ **Microsoft.Web.WebView2** から取得して、このディレクトリに
以下のレイアウトで配置してください。

```
plugins/win32/hspwebview2/third_party/webview2/
├── README.md                (このファイル)
├── include/
│   ├── WebView2.h
│   ├── WebView2EnvironmentOptions.h
│   └── ...
├── x86/
│   ├── WebView2LoaderStatic.lib
│   └── WebView2Loader.dll    (再配布用、任意)
└── x64/
    ├── WebView2LoaderStatic.lib
    └── WebView2Loader.dll
```

## 取得方法

### A) NuGet CLI を使う場合

```
nuget install Microsoft.Web.WebView2 -OutputDirectory .nuget
```

展開された `Microsoft.Web.WebView2.<version>/build/native/` 配下に
`include/` と `x86/` / `x64/` があるので、その中身を本ディレクトリへコピー。

### B) nupkg を手動展開する場合

`microsoft.web.webview2.<version>.nupkg` は zip なので拡張子を `.zip` に
変えて展開し、`build/native/include` / `build/native/x86` /
`build/native/x64` の内容を本ディレクトリへコピーしてください。

## ランタイム

Microsoft Edge WebView2 Runtime (evergreen bootstrapper) はほぼすべての
Windows 10/11 に既にインストールされています。別途インストールする場合は:
<https://developer.microsoft.com/microsoft-edge/webview2/>

## 静的リンクについて

本プラグインは `WebView2LoaderStatic.lib` にリンクします。これにより
`WebView2Loader.dll` を配布物に含める必要がなくなります。動的リンク版
(`WebView2Loader.lib` + `WebView2Loader.dll`) に切り替える場合は
`hspwebview2.vcxproj` の `AdditionalDependencies` を書き換えて、
`redist/` の `WebView2Loader.dll` を実行ファイルと同じ場所に配置してください。

## ビルドできない場合のフォールバック

`WebView2.h` が見つからない場合、`hspwebview2.cpp` は自動的に
`HSPWV2_STUB` モードでビルドされ、全関数が `-1` を返すだけの DLL になります。
この場合はランタイムで実際の WebView2 操作ができないため、SDK 配置後に
再ビルドしてください。
