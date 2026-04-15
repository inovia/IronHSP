; ============================================================
;   ncrypt.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
ncrypt.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の ncrypt.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
NCryptFreeObject
CNG キーストレージオブジェクトを解放する。
%prm
hObject
hObject : [int] 解放するオブジェクトのハンドル。プロバイダハンドル (NCRYPT_PROV_HANDLE) またはキーハンドル (NCRYPT_KEY_HANDLE) のいずれかを指定できる。
%inst
CNG キーストレージオブジェクトを解放する。

[戻り値]
関数の成功または失敗を示すステータスコードを返す。
返される可能性のあるコードには、次のものが含まれるが、これらに限定されない。
このドキュメントは省略されている。

[備考]
サービスは StartService 関数からこの関数を呼び出してはならない。サービスが StartService
関数からこの関数を呼び出すと、デッドロックが発生し、サービスが応答しなくなる可能性がある。

