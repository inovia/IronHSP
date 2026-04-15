; ============================================================
;   comdlg32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
comdlg32.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の comdlg32.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
CommDlgExtendedError
CommDlgExtendedError 関数 (commdlg.h) はコモンダイアログボックスのエラーコードを返す。
%prm

%inst
CommDlgExtendedError 関数 (commdlg.h) はコモンダイアログボックスのエラーコードを返す。

[戻り値]
型: DWORD
直近のコモンダイアログ関数の呼び出しが成功した場合、戻り値は未定義となる。ユーザーがダイアログボックスを閉じる、またはキャンセルしたために
FALSE が返された場合、戻り値は 0 となる。それ以外の場合、戻り値は 0
以外のエラーコードとなる。CommDlgExtendedError
関数は、いずれのコモンダイアログボックス関数についても一般的なエラーコードを返すことができる。さらに、特定のコモンダイアログボックスでのみ返されるエラーコードもある。これらのエラーコードはすべて
Cderr.h で定義されている。任意のコモンダイアログボックス関数で返される可能性のある一般的なエラーコードを以下に示す。
（以下省略）


%index
GetFileTitleW
指定されたファイルの名前を取得する。(Unicode)
%prm
param0, Buf, cchSize
param0 : [wstr] 
Buf : [wstr] 型: LPTSTR ファイル名を受け取るバッファ。
cchSize : [int] 型: WORD lpszTitle パラメータが指すバッファの長さ（文字数）。
%inst
指定されたファイルの名前を取得する。(Unicode)

[戻り値]
型: short 関数が成功した場合、戻り値は 0
である。ファイル名が無効な場合、戻り値は不定である。エラーが発生した場合、戻り値は負の数となる。lpszTitle
パラメータが指すバッファが小さすぎる場合、戻り値は必要なバッファサイズ（文字数）を表す正の整数となる。必要なバッファサイズには終端の
null 文字も含まれる。

[備考]
GetFileTitle
は正当なファイル名でのみ呼び出すべきである。不正なファイル名を使用した場合の結果は未定義である。ファイル名を格納するために必要なバッファサイズを取得するには、lpszTitle
に NULL、cchSize に 0 を指定して関数を呼び出す。関数は必要なサイズを返す。GetFileTitle
はシステムがファイル名をユーザーに表示する際に使用する文字列を返す。表示名は、ユーザーがファイル名表示の設定で拡張子表示を有効にしている場合にのみ拡張子を含む。そのため、返される文字列はファイルシステム関数の呼び出しに使用する場合、ファイルを正確に識別できないことがある。lpszTitle
バッファが小さすぎる場合、GetFileTitle は表示名を保持するために必要なサイズを返す。ただし、必要サイズと lpszFile
バッファに元々指定された文字との間に保証された関係はない。例えば、lpszTitle に NULL、cchSize に 0 を指定して
GetFileTitle を呼び出し、その戻り値を lpszFile
文字列のインデックスとして使用してはならない。同様の結果（およびより優れた性能）は、strrchr、wcsrchr、_mbsrchr
などの C ランタイムライブラリ関数で達成できることが多い。
> [!NOTE] > commdlg.h ヘッダは GetFileTitle を、UNICODE
プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または Unicode
版を自動的に選択するエイリアスとして定義している。エンコーディング中立なエイリアスとエンコーディング中立でないコードを混在させると、コンパイルや実行時のエラーにつながる不一致が発生する場合がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。

