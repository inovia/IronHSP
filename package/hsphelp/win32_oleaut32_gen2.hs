; ============================================================
;   oleaut32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
SysFreeString
SysAllocString、SysAllocStringByteLen、SysReAllocString、SysAllocStringLen、SysReAllocStringLen で以前に割り当てられた文字列の割り当てを解除する。
%group
Win32 oleaut32
%prm
bstrString
bstrString : [int] 以前に割り当てられた文字列。NULL の場合、関数は単に戻る。
%inst

SysAllocString、SysAllocStringByteLen、SysReAllocString、SysAllocStringLen、SysReAllocStringLen
で以前に割り当てられた文字列の割り当てを解除する。


%index
SysAllocString
新しい文字列を割り当て、渡された文字列をそれにコピーする。
%group
Win32 oleaut32
%prm
psz
psz : [wstr] コピーする文字列。
%inst
新しい文字列を割り当て、渡された文字列をそれにコピーする。

[戻り値]
成功した場合は文字列を返す。psz が長さ 0 の文字列なら長さ 0 の BSTR を返す。psz が NULL またはメモリ不足なら
NULL を返す。

[備考]
SysAllocString で作成された文字列は SysFreeString で解放できる。


%index
SysStringLen
BSTR の長さを返す。
%group
Win32 oleaut32
%prm
pbstr
pbstr : [int] 以前に割り当てられた文字列。
%inst
BSTR の長さを返す。

[戻り値]
bstr の文字数(終端 NULL を含まない)。bstr が NULL の場合は 0。

[備考]
返される値は、BSTR が埋め込み NULL 文字を含む場合 strlen(bstr) と異なる場合がある。この関数は常に、BSTR
の割り当てに使われた SysAllocStringLen の cch パラメータで指定された文字数を返す。

