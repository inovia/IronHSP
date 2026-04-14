; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    wmvcore.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __wmvcore_gen2_as__
#define __wmvcore_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "wmvcore.dll"
; winmdroot.Foundation.HRESULT WMCreateBackupRestorer(winmdroot.System.Com.IUnknown* pCallback, winmdroot.Media.WindowsMediaFormat.IWMLicenseBackup** ppBackup)
#cfunc WMCreateBackupRestorer "WMCreateBackupRestorer" var, var

; winmdroot.Foundation.HRESULT WMCreateEditor(winmdroot.Media.WindowsMediaFormat.IWMMetadataEditor** ppEditor)
#cfunc WMCreateEditor "WMCreateEditor" var

; winmdroot.Foundation.HRESULT WMCreateIndexer(winmdroot.Media.WindowsMediaFormat.IWMIndexer** ppIndexer)
#cfunc WMCreateIndexer "WMCreateIndexer" var

; winmdroot.Foundation.HRESULT WMCreateProfileManager(winmdroot.Media.WindowsMediaFormat.IWMProfileManager** ppProfileManager)
#cfunc WMCreateProfileManager "WMCreateProfileManager" var

; winmdroot.Foundation.HRESULT WMCreateReader(winmdroot.System.Com.IUnknown* pUnkCert, uint dwRights, winmdroot.Media.WindowsMediaFormat.IWMReader** ppReader)
#cfunc WMCreateReader "WMCreateReader" var, int, var

; winmdroot.Foundation.HRESULT WMCreateSyncReader(winmdroot.System.Com.IUnknown* pUnkCert, uint dwRights, winmdroot.Media.WindowsMediaFormat.IWMSyncReader** ppSyncReader)
#cfunc WMCreateSyncReader "WMCreateSyncReader" var, int, var

; winmdroot.Foundation.HRESULT WMCreateWriter(winmdroot.System.Com.IUnknown* pUnkCert, winmdroot.Media.WindowsMediaFormat.IWMWriter** ppWriter)
#cfunc WMCreateWriter "WMCreateWriter" var, var

; winmdroot.Foundation.HRESULT WMCreateWriterFileSink(winmdroot.Media.WindowsMediaFormat.IWMWriterFileSink** ppSink)
#cfunc WMCreateWriterFileSink "WMCreateWriterFileSink" var

; winmdroot.Foundation.HRESULT WMCreateWriterNetworkSink(winmdroot.Media.WindowsMediaFormat.IWMWriterNetworkSink** ppSink)
#cfunc WMCreateWriterNetworkSink "WMCreateWriterNetworkSink" var

; winmdroot.Foundation.HRESULT WMCreateWriterPushSink(winmdroot.Media.WindowsMediaFormat.IWMWriterPushSink** ppSink)
#cfunc WMCreateWriterPushSink "WMCreateWriterPushSink" var

; winmdroot.Foundation.HRESULT WMIsContentProtected(winmdroot.Foundation.PCWSTR pwszFileName, winmdroot.Foundation.BOOL* pfIsProtected)
#cfunc WMIsContentProtected "WMIsContentProtected" wstr, var

#endif
