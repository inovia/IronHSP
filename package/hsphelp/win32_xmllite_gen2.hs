; ============================================================
;   xmllite.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
xmllite.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の xmllite.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
CreateXmlReader
(no summary)
%prm
riid, ppvObject, pMalloc
riid : [var] 
ppvObject : [var] 
pMalloc : [var] 
%inst



%index
CreateXmlReaderInputWithEncodingCodePage
(no summary)
%prm
pInputStream, pMalloc, nEncodingCodePage, fEncodingHint, pwszBaseUri, ppInput
pInputStream : [var] 
pMalloc : [var] 
nEncodingCodePage : [int] 
fEncodingHint : [int] 
pwszBaseUri : [wstr] 
ppInput : [var] 
%inst



%index
CreateXmlReaderInputWithEncodingName
(no summary)
%prm
pInputStream, pMalloc, pwszEncodingName, fEncodingHint, pwszBaseUri, ppInput
pInputStream : [var] 
pMalloc : [var] 
pwszEncodingName : [wstr] 
fEncodingHint : [int] 
pwszBaseUri : [wstr] 
ppInput : [var] 
%inst



%index
CreateXmlWriter
(no summary)
%prm
riid, ppvObject, pMalloc
riid : [var] 
ppvObject : [var] 
pMalloc : [var] 
%inst



%index
CreateXmlWriterOutputWithEncodingCodePage
(no summary)
%prm
pOutputStream, pMalloc, nEncodingCodePage, ppOutput
pOutputStream : [var] 
pMalloc : [var] 
nEncodingCodePage : [int] 
ppOutput : [var] 
%inst



%index
CreateXmlWriterOutputWithEncodingName
(no summary)
%prm
pOutputStream, pMalloc, pwszEncodingName, ppOutput
pOutputStream : [var] 
pMalloc : [var] 
pwszEncodingName : [wstr] 
ppOutput : [var] 
%inst


