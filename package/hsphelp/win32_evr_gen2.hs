; ============================================================
;   evr.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
MFGetPlaneSize
非圧縮ビデオ形式について画像サイズ (バイト単位) を取得する。(MFGetPlaneSize)
%group
Win32 evr
%prm
format, dwWidth, dwHeight, pdwPlaneSize
format : [int] ビデオ形式を指定する FOURCC コードまたは D3DFORMAT 値。
dwWidth : [int] 画像の幅 (ピクセル単位)。
dwHeight : [int] 画像の高さ (ピクセル単位)。
pdwPlaneSize : [var] 1 フレームのサイズ (バイト単位) を受け取る。形式が圧縮されているか認識されない場合、この値は 0 となる。
%inst
非圧縮ビデオ形式について画像サイズ (バイト単位) を取得する。(MFGetPlaneSize)

[戻り値]
関数は HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。

[備考]
この関数は MFCalculateImageSize 関数と等価である。
注: Windows 7 より前では、この関数は evr.dll からエクスポートされていた。Windows 7 以降では
mfplat.dll からエクスポートされ、evr.dll は mfplat.dll を呼び出すスタブ関数をエクスポートする。


%index
MFCreateVideoMixer
Enhanced Video Renderer (EVR) の既定のビデオミキサーを作成する。
%group
Win32 evr
%prm
pOwner, riidDevice, riid, ppv
pOwner : [var] このオブジェクトの所有者へのポインタ。オブジェクトが集約されている場合は、集約オブジェクトの IUnknown インターフェースへのポインタを渡す。そうでない場合はこのパラメータを NULL に設定する。
riidDevice : [var] ビデオ処理に使用するビデオデバイスインターフェースの IID。現在サポートされている値は IID_IDirect3DDevice9 のみである。
riid : [var] ビデオミキサーで要求するインターフェースの IID。ビデオミキサーは IMFTransform インターフェースを公開する。
ppv : [var] 要求されたインターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
Enhanced Video Renderer (EVR) の既定のビデオミキサーを作成する。

[戻り値]
関数は HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。


%index
MFCreateVideoMixerAndPresenter
Enhanced Video Renderer (EVR) の既定のビデオミキサーとビデオプレゼンターを作成する。
%group
Win32 evr
%prm
pMixerOwner, pPresenterOwner, riidMixer, ppvVideoMixer, riidPresenter, ppvVideoPresenter
pMixerOwner : [var] ビデオミキサーの所有者へのポインタ。ミキサーが集約されている場合は、集約オブジェクトの IUnknown インターフェースへのポインタを渡す。そうでない場合はこのパラメータを NULL に設定する。
pPresenterOwner : [var] ビデオプレゼンターの所有者へのポインタ。プレゼンターが集約されている場合は、集約オブジェクトの IUnknown インターフェースへのポインタを渡す。そうでない場合はこのパラメータを NULL に設定する。
riidMixer : [var] ビデオミキサーで要求するインターフェースの IID。ビデオミキサーは IMFTransform インターフェースを公開する。
ppvVideoMixer : [var] ビデオミキサーで要求されたインターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
riidPresenter : [var] ビデオプレゼンターで要求するインターフェースの IID。ビデオプレゼンターは IMFVideoPresenter インターフェースを公開する。
ppvVideoPresenter : [var] ビデオプレゼンターで要求されたインターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
Enhanced Video Renderer (EVR) の既定のビデオミキサーとビデオプレゼンターを作成する。

[戻り値]
関数は HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。


%index
MFCreateVideoPresenter
Enhanced Video Renderer (EVR) の既定のビデオプレゼンターを作成する。
%group
Win32 evr
%prm
pOwner, riidDevice, riid, ppVideoPresenter
pOwner : [var] オブジェクトの所有者へのポインタ。オブジェクトが集約されている場合は、集約オブジェクトの IUnknown インターフェースへのポインタを渡す。そうでない場合はこのパラメータを NULL に設定する。
riidDevice : [var] ビデオ処理に使用するビデオデバイスインターフェースの IID。現在サポートされている値は IID_IDirect3DDevice9 のみである。
riid : [var] ビデオプレゼンターで要求するインターフェースの IID。ビデオプレゼンターは IMFVideoPresenter インターフェースを公開する。
ppVideoPresenter : [var] ビデオプレゼンターで要求されたインターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
Enhanced Video Renderer (EVR) の既定のビデオプレゼンターを作成する。

[戻り値]
関数は HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。


%index
MFCreateVideoSampleAllocator
ビデオサンプルを割り当てるオブジェクトを作成する。
%group
Win32 evr
%prm
riid, ppSampleAllocator
riid : [var] 
ppSampleAllocator : [var] 要求されたインターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
ビデオサンプルを割り当てるオブジェクトを作成する。

[戻り値]
関数が成功すると S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
MFCreateVideoSampleFromSurface
Direct3D サーフェスを管理するメディアサンプルを作成する。
%group
Win32 evr
%prm
pUnkSurface, ppSample
pUnkSurface : [var] Direct3D サーフェスの IUnknown インターフェースへのポインタ。このパラメータは NULL でも構わない。
ppSample : [var] サンプルの IMFSample インターフェースへのポインタを受け取る。呼び出し元はインターフェースを解放する必要がある。
%inst
Direct3D サーフェスを管理するメディアサンプルを作成する。

[戻り値]
このコールバック関数が成功すると S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
この関数によって作成されるメディアサンプルは、IMFSample に加えて以下のインターフェースを公開する。
このドキュメントは省略されている。


%index
MFIsFormatYUV
FOURCC コードまたは D3DFORMAT 値が YUV 形式であるかを問い合わせる。
%group
Win32 evr
%prm
Format
Format : [int] FOURCC コードまたは D3DFORMAT 値。
%inst
FOURCC コードまたは D3DFORMAT 値が YUV 形式であるかを問い合わせる。

[戻り値]
関数は以下のいずれかの値を返す。
このドキュメントは省略されている。

[備考]
この関数は Format が YUV 形式を指定しているかどうかをチェックする。すべての YUV
形式がこの関数で認識されるわけではない。ただし、この関数で認識されない YUV 形式は、ビデオレンダリングや DirectX Video
Acceleration (DXVA) でサポートされない可能性が高い。

