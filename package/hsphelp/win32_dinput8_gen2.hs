; ============================================================
;   dinput8.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
dinput8.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の dinput8.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
DirectInput8Create
(no summary)
%prm
hinst, dwVersion, riidltf, ppvOut, punkOuter
hinst : [intptr] 
dwVersion : [int] 
riidltf : [var] 
ppvOut : [var] 
punkOuter : [var] 
%inst


