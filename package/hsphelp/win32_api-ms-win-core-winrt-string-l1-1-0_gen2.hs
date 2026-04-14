; ============================================================
;   api-ms-win-core-winrt-string-l1-1-0.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
WindowsDeleteString
Decrements the reference count of a string buffer.
%group
Win32 api-ms-win-core-winrt-string-l1-1-0
%prm
string
string : [int] 
%inst
Decrements the reference count of a string buffer.

[戻り値]
Type: HRESULT This function always returns S_OK.

[備考]
Use the WindowsDeleteString function to de-allocate an
[**HSTRING**](/windows/win32/winrt/hstring). Calling
WindowsDeleteString decrements the reference count of the backing
buffer, and if the reference count reaches 0, the Windows Runtime
de-allocates the buffer.

