# hspwebview2 redist

## WebView2Loader.dll

`hspwebview2.vcxproj` の既定設定では `WebView2LoaderStatic.lib` にリンクするため
`WebView2Loader.dll` を同梱する必要はありません。

もし動的リンク版 (`WebView2Loader.lib` + `WebView2Loader.dll`) を使う構成に
変更した場合は、以下を満たしてください。

- `WebView2Loader.dll` (Win32) を `hspwebview2.dll` と同じフォルダに配置
- `WebView2Loader.dll` (x64) を `hspwebview2_64.dll` と同じフォルダに配置

NuGet `Microsoft.Web.WebView2` の `build/native/x86/WebView2Loader.dll`
および `build/native/x64/WebView2Loader.dll` から入手できます。

## WebView2 Runtime (Evergreen)

エンドユーザーの PC には **Microsoft Edge WebView2 Runtime** が必要です。
これは Windows 10 (21H2 以降) / Windows 11 には標準で入っています。
インストールされていない環境向けには Evergreen Bootstrapper を配布してください。

- <https://developer.microsoft.com/microsoft-edge/webview2/>

※ Runtime 自体は hspwebview2 に同梱するものではなく、不要ならユーザーに
インストールを促すかインストーラでチェインインストールします。
