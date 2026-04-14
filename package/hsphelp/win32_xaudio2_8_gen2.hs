; ============================================================
;   xaudio2_8.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
CreateAudioReverb
(no summary)
%group
Win32 xaudio2_8
%prm
ppApo
ppApo : [var] 
%inst



%index
CreateAudioVolumeMeter
(no summary)
%group
Win32 xaudio2_8
%prm
ppApo
ppApo : [var] 
%inst



%index
CreateFX
Creates an instance of the requested XAPOFX effect.
%group
Win32 xaudio2_8
%prm
clsid, pEffect, pInitDat, InitDataByteSize
clsid : [var] ID of the effect to create. Use the __uuidof on the effect class name to get the CLSID for an effect. For example, __uuidof(FXReverb) would provide the CLSID for the FXReverb effect. For a list of effects provided by XAPOFX, see XAPOFX Overview. For an example of retrieving the CLSID for an effect, see How to: Use XAPOFX in XAudio2.
pEffect : [var] Receives a pointer to the created XAPO instance. If CreateFX fails, pEffect  is untouched.
pInitDat : [intptr] 
InitDataByteSize : [int] Size of pInitData in bytes. This is zero if pInitData is NULL.
%inst
Creates an instance of the requested XAPOFX effect.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The created XAPO will have a reference count of 1. Client code must
call IUnknown::Release after passing the XAPO to XAudio2 to allow
XAudio2 to dispose of the XAPO when it is no longer needed. Use
IXAudio2::CreateSourceVoice or IXAudio2Voice::SetEffectChain to pass
an XAPO to XAudio2.
Note The DirectX SDK version of this function doesn't have the
pInitData or InitDataByteSize parameters as it only takes the first 2
parameters. To set initial parameters for the XAPOFX effect that is
created with the DirectX SDK version of this function, you must bind
that effect to a voice and use IXAudio2Voice::SetEffectParameters.
For info about how to do this, see How to: Use XAPOFX in XAudio2.
Platform Requirements Windows 10 (XAudio2.9); Windows 8, Windows
Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)


%index
XAudio2CreateWithVersionInfo
(no summary)
%group
Win32 xaudio2_8
%prm
ppXAudio2, Flags, XAudio2Processor, ntddiVersion
ppXAudio2 : [var] 
Flags : [int] 
XAudio2Processor : [int] 
ntddiVersion : [int] 
%inst


