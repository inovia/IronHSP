# hsptoast.dll — Windows toast-style notification plugin

Shell_NotifyIconW + `NIIF_INFO/NIIF_WARNING/NIIF_ERROR` で Windows 10/11 の
トースト通知 (画面右下、サウンド付き) を出す最小 DLL。PowerShell 不要 /
WinRT 不要 / 追加 SDK 不要。

## API (`hsptoast.as`)

```
hsptoast_show_info  "title", "body"   ; 青 i アイコン
hsptoast_show_warn  "title", "body"   ; 黄 ! アイコン
hsptoast_show_error "title", "body"   ; 赤 × アイコン
hsptoast_clear                        ; トレイアイコンを消す
```

`iron_toast.hsp` ラッパ:

```hsp
#include "iron_toast.hsp"
toast         "IronHSP", "ビルドが完了しました"
toast_warning "警告", "ファイルが見つかりません"
toast_error   "エラー", "接続できません"
toast_clear
```

タイトル/本文は **UTF-8** で渡す (DLL 側で UTF-16 に変換)。

## ビルド

```powershell
msbuild hsptoast.vcxproj /p:Configuration=Release /p:Platform=x64    # → hsptoast_64.dll
msbuild hsptoast.vcxproj /p:Configuration=Release /p:Platform=Win32  # → hsptoast.dll
```

追加 SDK 不要 (Windows SDK 標準の shell32.lib + user32.lib)。

## 実装メモ

- `NOTIFYICONDATAW` を使う (W API)。ANSI 版 (A) だと日本語が CP932 扱いで
  UTF-8 を渡した時に化けるため W に統一
- DllMain の `DLL_PROCESS_DETACH` で `NIM_DELETE` を呼んでトレイに残らないよう
  にしている
- 固定のトレイ ID (`0xC7F00001`) で、2 回目以降の show は `NIM_MODIFY`
- トースト非表示設定 (Windows の「集中モード」等) の時は内部ログには出るが
  視覚的に通知されない可能性あり

## テスト

```
cd package/win32/sample/iron
../../iron_test_runner.exe --compiler=../../hspcmp64.exe \
    --runtime=../../hsp3cl_net_test_64.exe --compath=../../common/ \
    test_toast.hsp
```

4 case。実際にはトーストが画面に 4 回出る (info / warn / error / clear)。

## 参考

- Shell_NotifyIconW: https://learn.microsoft.com/en-us/windows/win32/api/shellapi/nf-shellapi-shell_notifyiconw
- NOTIFYICONDATAW: https://learn.microsoft.com/en-us/windows/win32/api/shellapi/ns-shellapi-notifyicondataw
