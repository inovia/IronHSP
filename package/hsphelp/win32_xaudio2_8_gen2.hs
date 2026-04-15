; ============================================================
;   xaudio2_8.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
xaudio2_8.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の xaudio2_8.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
CreateAudioReverb
(no summary)
%prm
ppApo
ppApo : [var] 
%inst



%index
CreateAudioVolumeMeter
(no summary)
%prm
ppApo
ppApo : [var] 
%inst



%index
CreateFX
指定された XAPOFX エフェクトのインスタンスを作成する。
%prm
clsid, pEffect, pInitDat, InitDataByteSize
clsid : [var] 作成するエフェクトの ID。エフェクトクラス名に対して __uuidof を用いると、当該エフェクトの CLSID を取得できる。たとえば __uuidof(FXReverb) は FXReverb エフェクトの CLSID を返す。XAPOFX が提供するエフェクト一覧については XAPOFX Overview を参照。エフェクト CLSID 取得の例は How to: Use XAPOFX in XAudio2 を参照。
pEffect : [var] 作成された XAPO インスタンスへのポインタを受け取る。CreateFX が失敗した場合、pEffect は変更されない。
pInitDat : [intptr] 
InitDataByteSize : [int] pInitData のサイズ (バイト単位)。pInitData が NULL のときは 0 になる。
%inst
指定された XAPOFX エフェクトのインスタンスを作成する。

[戻り値]
関数が成功すると S_OK を返す。失敗時は HRESULT エラーコードを返す。

[備考]
作成された XAPO の参照カウントは 1 となる。クライアントコードは、XAPO を XAudio2 に渡した後、不要になったときに
XAudio2 が XAPO を破棄できるよう、IUnknown::Release を呼び出す必要がある。XAPO を XAudio2
に渡すには IXAudio2::CreateSourceVoice または IXAudio2Voice::SetEffectChain
を使用する。
注意 DirectX SDK 版の本関数は最初の 2 つの引数しか取らず、pInitData と InitDataByteSize
引数を持たない。DirectX SDK 版で作成した XAPOFX
エフェクトの初期パラメータを設定するには、エフェクトをボイスにバインドした上で
IXAudio2Voice::SetEffectParameters を使用する必要がある。詳細は How to: Use XAPOFX
in XAudio2 を参照。 プラットフォーム要件 Windows 10 (XAudio2.9)、Windows 8、Windows
Phone 8 (XAudio 2.8)、DirectX SDK (XAudio 2.7)


%index
XAudio2CreateWithVersionInfo
(no summary)
%prm
ppXAudio2, Flags, XAudio2Processor, ntddiVersion
ppXAudio2 : [var] 
Flags : [int] 
XAudio2Processor : [int] 
ntddiVersion : [int] 
%inst


