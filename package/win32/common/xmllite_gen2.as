; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    xmllite.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __xmllite_gen2_as__
#define __xmllite_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "xmllite.dll"
; winmdroot.Foundation.HRESULT CreateXmlReader(global::System.Guid* riid, void** ppvObject, [Optional] winmdroot.System.Com.IMalloc* pMalloc)
#cfunc CreateXmlReader "CreateXmlReader" var, var, var

; winmdroot.Foundation.HRESULT CreateXmlReaderInputWithEncodingCodePage(winmdroot.System.Com.IUnknown* pInputStream, [Optional] winmdroot.System.Com.IMalloc* pMalloc, uint nEncodingCodePage, winmdroot.Foundation.BOOL fEncodingHint, winmdroot.Foundation.PCWSTR pwszBaseUri, winmdroot.System.Com.IUnknown** ppInput)
#cfunc CreateXmlReaderInputWithEncodingCodePage "CreateXmlReaderInputWithEncodingCodePage" var, var, int, int, wstr, var

; winmdroot.Foundation.HRESULT CreateXmlReaderInputWithEncodingName(winmdroot.System.Com.IUnknown* pInputStream, [Optional] winmdroot.System.Com.IMalloc* pMalloc, winmdroot.Foundation.PCWSTR pwszEncodingName, winmdroot.Foundation.BOOL fEncodingHint, winmdroot.Foundation.PCWSTR pwszBaseUri, winmdroot.System.Com.IUnknown** ppInput)
#cfunc CreateXmlReaderInputWithEncodingName "CreateXmlReaderInputWithEncodingName" var, var, wstr, int, wstr, var

; winmdroot.Foundation.HRESULT CreateXmlWriter(global::System.Guid* riid, void** ppvObject, [Optional] winmdroot.System.Com.IMalloc* pMalloc)
#cfunc CreateXmlWriter "CreateXmlWriter" var, var, var

; winmdroot.Foundation.HRESULT CreateXmlWriterOutputWithEncodingCodePage(winmdroot.System.Com.IUnknown* pOutputStream, [Optional] winmdroot.System.Com.IMalloc* pMalloc, uint nEncodingCodePage, winmdroot.System.Com.IUnknown** ppOutput)
#cfunc CreateXmlWriterOutputWithEncodingCodePage "CreateXmlWriterOutputWithEncodingCodePage" var, var, int, var

; winmdroot.Foundation.HRESULT CreateXmlWriterOutputWithEncodingName(winmdroot.System.Com.IUnknown* pOutputStream, [Optional] winmdroot.System.Com.IMalloc* pMalloc, winmdroot.Foundation.PCWSTR pwszEncodingName, winmdroot.System.Com.IUnknown** ppOutput)
#cfunc CreateXmlWriterOutputWithEncodingName "CreateXmlWriterOutputWithEncodingName" var, var, wstr, var

#endif
