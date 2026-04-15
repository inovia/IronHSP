; ============================================================
;   api-ms-win-core-winrt-string-l1-1-0.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
api-ms-win-core-winrt-string-l1-1-0.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の api-ms-win-core-winrt-string-l1-1-0.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
WindowsDeleteString
文字列バッファの参照カウントをデクリメントする。
%prm
string
string : [int] 
%inst
文字列バッファの参照カウントをデクリメントする。

[戻り値]
型: HRESULT この関数は常に S_OK を返す。

[備考]
WindowsDeleteString 関数を使うと
[**HSTRING**](/windows/win32/winrt/hstring)
を解放できる。WindowsDeleteString を呼び出すと、裏側のバッファの参照カウントがデクリメントされ、参照カウントが 0
になると Windows ランタイムがバッファを解放する。

