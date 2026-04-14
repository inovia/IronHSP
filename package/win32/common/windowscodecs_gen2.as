; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    windowscodecs.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __windowscodecs_gen2_as__
#define global __windowscodecs_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "windowscodecs.dll"
; winmdroot.Foundation.HRESULT WICConvertBitmapSource(global::System.Guid* dstFormat, winmdroot.Graphics.Imaging.IWICBitmapSource* pISrc, winmdroot.Graphics.Imaging.IWICBitmapSource** ppIDst)
#cfunc global WICConvertBitmapSource "WICConvertBitmapSource" var, var, var

; winmdroot.Foundation.HRESULT WICCreateBitmapFromSection(uint width, uint height, global::System.Guid* pixelFormat, winmdroot.Foundation.HANDLE hSection, uint stride, uint offset, winmdroot.Graphics.Imaging.IWICBitmap** ppIBitmap)
#cfunc global WICCreateBitmapFromSection "WICCreateBitmapFromSection" int, int, var, intptr, int, int, var

; winmdroot.Foundation.HRESULT WICCreateBitmapFromSectionEx(uint width, uint height, global::System.Guid* pixelFormat, winmdroot.Foundation.HANDLE hSection, uint stride, uint offset, winmdroot.Graphics.Imaging.WICSectionAccessLevel desiredAccessLevel, winmdroot.Graphics.Imaging.IWICBitmap** ppIBitmap)
#cfunc global WICCreateBitmapFromSectionEx "WICCreateBitmapFromSectionEx" int, int, var, intptr, int, int, int, var

; winmdroot.Foundation.HRESULT WICGetMetadataContentSize(global::System.Guid* guidContainerFormat, winmdroot.Graphics.Imaging.IWICMetadataWriter* pIWriter, ulong* pcbSize)
#cfunc global WICGetMetadataContentSize "WICGetMetadataContentSize" var, var, var

; winmdroot.Foundation.HRESULT WICMapGuidToShortName(global::System.Guid* guid, uint cchName, winmdroot.Foundation.PWSTR wzName, uint* pcchActual)
#cfunc global WICMapGuidToShortName "WICMapGuidToShortName" var, int, wstr, var

; winmdroot.Foundation.HRESULT WICMapSchemaToName(global::System.Guid* guidMetadataFormat, winmdroot.Foundation.PWSTR pwzSchema, uint cchName, winmdroot.Foundation.PWSTR wzName, uint* pcchActual)
#cfunc global WICMapSchemaToName "WICMapSchemaToName" var, wstr, int, wstr, var

; winmdroot.Foundation.HRESULT WICMapShortNameToGuid(winmdroot.Foundation.PCWSTR wzName, global::System.Guid* pguid)
#cfunc global WICMapShortNameToGuid "WICMapShortNameToGuid" wstr, var

; winmdroot.Foundation.HRESULT WICMatchMetadataContent(global::System.Guid* guidContainerFormat, [Optional] global::System.Guid* pguidVendor, winmdroot.System.Com.IStream* pIStream, global::System.Guid* pguidMetadataFormat)
#cfunc global WICMatchMetadataContent "WICMatchMetadataContent" var, var, var, var

; winmdroot.Foundation.HRESULT WICSerializeMetadataContent(global::System.Guid* guidContainerFormat, winmdroot.Graphics.Imaging.IWICMetadataWriter* pIWriter, uint dwPersistOptions, winmdroot.System.Com.IStream* pIStream)
#cfunc global WICSerializeMetadataContent "WICSerializeMetadataContent" var, var, int, var

#endif
