; ============================================================
;   xmllite.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
CreateXmlReader
(no summary)
%group
Win32 xmllite
%prm
riid, ppvObject, pMalloc
riid : [var] 
ppvObject : [var] 
pMalloc : [var] 
%inst



%index
CreateXmlReaderInputWithEncodingCodePage
(no summary)
%group
Win32 xmllite
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
%group
Win32 xmllite
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
%group
Win32 xmllite
%prm
riid, ppvObject, pMalloc
riid : [var] 
ppvObject : [var] 
pMalloc : [var] 
%inst



%index
CreateXmlWriterOutputWithEncodingCodePage
(no summary)
%group
Win32 xmllite
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
%group
Win32 xmllite
%prm
pOutputStream, pMalloc, pwszEncodingName, ppOutput
pOutputStream : [var] 
pMalloc : [var] 
pwszEncodingName : [wstr] 
ppOutput : [var] 
%inst


