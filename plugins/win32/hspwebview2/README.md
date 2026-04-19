# hspwebview2.dll — Microsoft Edge WebView2 plugin for HSP

HSP ウィンドウに WebView2 (Chromium Edge) をアタッチして HTML/JS を表示、
HSP ↔ JS 双方向メッセージを扱えるプラグイン。

## 必要条件

- **WebView2 Runtime** が OS に install 済み (Windows 10/11 標準、
  なければ https://developer.microsoft.com/microsoft-edge/webview2/ から)

## API 抜粋

```
wv2_init       "user_data_dir"
wv2_attach     hwnd, x, y, w, h                 ; → stat = webview handle
wv2_navigate   wh, "https://..."
wv2_execute_script wh, "document.title", var_text, text_max
wv2_post_message   wh, "json-or-string"
wv2_poll_message   wh, var_text, text_max       ; → stat = received bytes
wv2_close      wh
```

## ビルド手順

### 1. WebView2 SDK (NuGet) を DL

```powershell
cd third_party/webview2
curl -L -o webview2.nupkg https://www.nuget.org/api/v2/package/Microsoft.Web.WebView2/1.0.3351.48
7z x webview2.nupkg -onupkg
# include/, x64/, x86/ を third_party/webview2/ 直下に配置
cp -r nupkg/build/native/{include,x64,x86} .
rm -rf nupkg webview2.nupkg
```

### 2. ビルド

```powershell
msbuild hspwebview2.vcxproj /p:Configuration=Release /p:Platform=x64    # → hspwebview2_64.dll
msbuild hspwebview2.vcxproj /p:Configuration=Release /p:Platform=Win32  # → hspwebview2.dll
```

リンクには `WebView2LoaderStatic.lib` + `version.lib` を使う (vcxproj
既設定)。WebView2Loader.dll を別途配布する必要なし。

## テスト

```
cd package/win32/sample/iron
../../iron_test_runner.exe --compiler=../../hspcmp64.exe \
    --runtime=../../hsp3cl_net_test_64.exe --compath=../../common/ \
    test_webview2.hsp
```

実描画は GUI 依存なので自動テストは軽量 (bad handle で crash しない確認のみ)。
フル描画テストは `sample_webview2.hsp` / `sample_webview2_bridge.hsp`。

## 参考

- WebView2 docs: https://learn.microsoft.com/en-us/microsoft-edge/webview2/
- NuGet: https://www.nuget.org/packages/Microsoft.Web.WebView2/
