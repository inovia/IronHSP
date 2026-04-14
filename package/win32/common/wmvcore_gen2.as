; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    wmvcore.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __wmvcore_gen2_as__
#define global __wmvcore_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "wmvcore.dll"
; winmdroot.Foundation.HRESULT WMCreateBackupRestorer(winmdroot.System.Com.IUnknown* pCallback, winmdroot.Media.WindowsMediaFormat.IWMLicenseBackup** ppBackup)
#cfunc global WMCreateBackupRestorer "WMCreateBackupRestorer" var, var

; winmdroot.Foundation.HRESULT WMCreateEditor(winmdroot.Media.WindowsMediaFormat.IWMMetadataEditor** ppEditor)
#cfunc global WMCreateEditor "WMCreateEditor" var

; winmdroot.Foundation.HRESULT WMCreateIndexer(winmdroot.Media.WindowsMediaFormat.IWMIndexer** ppIndexer)
#cfunc global WMCreateIndexer "WMCreateIndexer" var

; winmdroot.Foundation.HRESULT WMCreateProfileManager(winmdroot.Media.WindowsMediaFormat.IWMProfileManager** ppProfileManager)
#cfunc global WMCreateProfileManager "WMCreateProfileManager" var

; winmdroot.Foundation.HRESULT WMCreateReader(winmdroot.System.Com.IUnknown* pUnkCert, uint dwRights, winmdroot.Media.WindowsMediaFormat.IWMReader** ppReader)
#cfunc global WMCreateReader "WMCreateReader" var, int, var

; winmdroot.Foundation.HRESULT WMCreateSyncReader(winmdroot.System.Com.IUnknown* pUnkCert, uint dwRights, winmdroot.Media.WindowsMediaFormat.IWMSyncReader** ppSyncReader)
#cfunc global WMCreateSyncReader "WMCreateSyncReader" var, int, var

; winmdroot.Foundation.HRESULT WMCreateWriter(winmdroot.System.Com.IUnknown* pUnkCert, winmdroot.Media.WindowsMediaFormat.IWMWriter** ppWriter)
#cfunc global WMCreateWriter "WMCreateWriter" var, var

; winmdroot.Foundation.HRESULT WMCreateWriterFileSink(winmdroot.Media.WindowsMediaFormat.IWMWriterFileSink** ppSink)
#cfunc global WMCreateWriterFileSink "WMCreateWriterFileSink" var

; winmdroot.Foundation.HRESULT WMCreateWriterNetworkSink(winmdroot.Media.WindowsMediaFormat.IWMWriterNetworkSink** ppSink)
#cfunc global WMCreateWriterNetworkSink "WMCreateWriterNetworkSink" var

; winmdroot.Foundation.HRESULT WMCreateWriterPushSink(winmdroot.Media.WindowsMediaFormat.IWMWriterPushSink** ppSink)
#cfunc global WMCreateWriterPushSink "WMCreateWriterPushSink" var

; winmdroot.Foundation.HRESULT WMIsContentProtected(winmdroot.Foundation.PCWSTR pwszFileName, winmdroot.Foundation.BOOL* pfIsProtected)
#cfunc global WMIsContentProtected "WMIsContentProtected" wstr, var

#endif
