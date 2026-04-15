; ============================================================
;   normaliz.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
normaliz.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の normaliz.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
IdnToAscii
国際化ドメイン名 (IDN) またはその他の国際化ラベルを、Punycode 転送エンコーディング構文で名前を表現する ASCII 文字列の Unicode (ワイド文字) 表現に変換する。
%prm
dwFlags, lpUnicodeCharStr, cchUnicodeChar, lpASCIICharStr, cchASCIIChar
dwFlags : [int] 変換オプションを指定するフラグ。指定可能な値を次の表に示す。
lpUnicodeCharStr : [wstr] IDN またはその他の国際化ラベルを表す Unicode 文字列へのポインタ。
cchUnicodeChar : [int] lpUnicodeCharStr が示す入力 Unicode 文字列の文字数。
lpASCIICharStr : [wstr] ASCII 文字セットの文字のみで構成される Unicode 文字列を受け取るバッファへのポインタ。この関数から戻った時点で、バッファには lpUnicodeCharStr で渡された文字列を Punycode で表現した ASCII 文字列が格納される。あるいは、cchASCIIChar が 0 に設定されている場合、この関数はこのパラメータに NULL を取得することもできる。その場合、関数はこのバッファに必要なサイズを返す。
cchASCIIChar : [int] lpASCIICharStr が示すバッファのサイズ。アプリケーションがこのパラメータを 0 に設定すると、lpASCIICharStr に NULL を取得できる。
%inst
国際化ドメイン名 (IDN) またはその他の国際化ラベルを、Punycode 転送エンコーディング構文で名前を表現する ASCII
文字列の Unicode (ワイド文字) 表現に変換する。

[戻り値]
成功した場合、lpASCIICharStr に取得された文字数を返す。取得された文字列は、入力 Unicode 文字列が NULL
終端されている場合にのみ NULL 終端される。関数が成功し、cchASCIIChar の値が 0
の場合、必要なサイズを文字数で返す。これには入力バッファに含まれていれば終端 NULL 文字も含まれる。失敗した場合は 0
を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼び出す。次のいずれかのエラーコードが返される可能性がある:
このドキュメントは省略されている。

[備考]
入力文字列の長さが終端の NULL 文字なしで明示的に指定された場合、この関数は出力文字列を NULL 終端しない。この関数で出力文字列を
NULL 終端させるには、アプリケーションは cchUnicodeChar パラメータに -1 を指定するか、入力文字列の終端 NULL
文字を明示的にカウントする必要がある。なお、入力文字列に制御文字 (U+0001 から U+0020) または "delete" 文字
(U+007F) が含まれる場合、この関数は常に失敗する。U+0000 は終端の NULL
文字としてのみ出現できるため、入力文字列の他の位置に U+0000 が出現すると、この関数は常に失敗する。Windows XP,
Windows Server 2003: サポートされなくなった。必要なヘッダファイルおよび DLL は Microsoft
Internationalized Domain Name (IDN) Mitigation API
に含まれており、現在はダウンロードできない。


%index
IdnToUnicode
国際化ドメイン名 (IDN) またはその他の国際化ラベルの Punycode 形式を、通常の Unicode UTF-16 エンコーディング構文に変換する。
%prm
dwFlags, lpASCIICharStr, cchASCIIChar, lpUnicodeCharStr, cchUnicodeChar
dwFlags : [int] 変換オプションを指定するフラグ。詳細な定義については、IdnToAscii の dwFlags パラメータを参照のこと。
lpASCIICharStr : [wstr] IDN またはその他の国際化ラベルの Punycode エンコーディングを表す文字列へのポインタ。この文字列は ASCII 文字のみで構成されている必要があり、Punycode エンコードされた Unicode を含むことができる。関数は Punycode の値を UTF-16 の値にデコードする。
cchASCIIChar : [int] lpASCIICharStr が示す入力文字列の文字数。
lpUnicodeCharStr : [wstr] 入力文字列の Punycode 値に対応する通常の Unicode UTF-16 エンコーディングを受け取るバッファへのポインタ。あるいは、cchUnicodeChar が 0 に設定されている場合、この関数はこのパラメータに NULL を取得することもできる。その場合、関数はこのバッファに必要なサイズを返す。
cchUnicodeChar : [int] lpUnicodeCharStr が示すバッファのサイズ (文字数)。アプリケーションがサイズを 0 に設定すると、lpUnicodeCharStr に NULL を取得し、関数に必要なバッファサイズを返させることができる。
%inst
国際化ドメイン名 (IDN) またはその他の国際化ラベルの Punycode 形式を、通常の Unicode UTF-16
エンコーディング構文に変換する。

[戻り値]
成功した場合、lpUnicodeCharStr に取得された文字数を返す。取得された文字列は、入力文字列が NULL
終端されている場合にのみ NULL 終端される。関数が成功し、cchUnicodeChar の値が 0
の場合、必要なサイズを文字数で返す。これには入力バッファに含まれていれば終端 NULL 文字も含まれる。失敗した場合は 0
を返す。拡張エラー情報を取得するには、アプリケーションは GetLastError
を呼び出す。次のいずれかのエラーコードが返される可能性がある:
このドキュメントは省略されている。

[備考]
IdnToAscii の Remarks を参照のこと。

