; ============================================================
;   d3d11.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
d3d11.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の d3d11.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
CreateDirect3D11DeviceFromDXGIDevice
IDXGIDevice から IDirect3DDevice のインスタンスを作成する。
%prm
dxgiDevice, graphicsDevice
dxgiDevice : [var] 型: **[IDXGIDevice](/windows/desktop/api/dxgi/nn-dxgi-idxgidevice)\*** Direct3DDevice を作成する元となる [IDXGIDevice](/windows/desktop/api/dxgi/nn-dxgi-idxgidevice)。
graphicsDevice : [var] 型: **[IInspectable](/windows/desktop/api/inspectable/nn-inspectable-iinspectable)\*\*** DXGIDevice をラップする Direct3DDevice インスタンス。
%inst
IDXGIDevice から IDirect3DDevice のインスタンスを作成する。

[戻り値]
型: [**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
関数が成功すると **S_OK** を返す。失敗時は
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
[エラーコード](/windows/desktop/com/com-error-codes-10) を返す。

[備考]
[C++/WinRT](/windows/uwp/cpp-and-winrt-apis/index) の使用を推奨するが、C++/CX
を使っている場合は **CreateDirect3D11DeviceFromDXGIDevice** ではなく
[CreateDirect3DDevice](/windows/desktop/api/d3d11/nf-d3d11-d3d11createdevice)
を呼び出すべきである。WRL を使っている場合は、このコード例のように
**CreateDirect3D11DeviceFromDXGIDevice** を利用できる。
このドキュメントは省略されている。


%index
CreateDirect3D11SurfaceFromDXGISurface
IDXGISurface から IDirect3DSurface のインスタンスを作成する。
%prm
dgxiSurface, graphicsSurface
dgxiSurface : [var] 
graphicsSurface : [var] 型: **[IInspectable](/windows/desktop/api/inspectable/nn-inspectable-iinspectable)\*\*** [IDXGISurface](/windows/desktop/api/dxgi/nn-dxgi-idxgisurface) をラップする [IDirect3DSurface](/uwp/api/windows.graphics.directx.direct3d11.idirect3dsurface) インスタンス。
%inst
IDXGISurface から IDirect3DSurface のインスタンスを作成する。

[戻り値]
型: [**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
関数が成功すると **S_OK** を返す。失敗時は
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
[エラーコード](/windows/desktop/com/com-error-codes-10) を返す。

[備考]
[C++/WinRT](/windows/uwp/cpp-and-winrt-apis/index) の使用を推奨するが、C++/CX
を使っている場合は **CreateDirect3D11DeviceFromDXGIDevice** ではなく
[CreateDirect3DSurface](./nf-windows-graphics-directx-direct3d11-interop-createdirect3dsurface.md)
を呼び出すべきである。WRL を使っている場合は、このコード例のように
**CreateDirect3D11DeviceFromDXGIDevice** を利用できる。
このドキュメントは省略されている。


%index
D3D11CreateDevice
ディスプレイアダプタを表すデバイスを作成する。(D3D11CreateDevice)
%prm
pAdapter, DriverType, Software, Flags, pFeatureLevels, FeatureLevels, SDKVersion, ppDevice, pFeatureLevel, ppImmediateContext
pAdapter : [var] 型: IDXGIAdapter* デバイス作成時に使用するビデオアダプタへのポインタ。既定のアダプタを使う場合は NULL を渡す。既定のアダプタは IDXGIFactory1::EnumAdapters が最初に列挙するアダプタである。注意 DXGI 1.0 (IDXGIFactory) と DXGI 1.1 (IDXGIFactory1) を 1 つのアプリケーションで混在させてはならない。IDXGIFactory または IDXGIFactory1 のどちらか一方だけを使う。
DriverType : [int] 型: D3D_DRIVER_TYPE 作成するドライバ種別を表す D3D_DRIVER_TYPE。
Software : [intptr] 型: HMODULE ソフトウェアラスタライザを実装する DLL へのハンドル。DriverType が D3D_DRIVER_TYPE_SOFTWARE の場合、Software は NULL であってはならない。ハンドルは LoadLibrary、LoadLibraryEx、GetModuleHandle のいずれかで取得する。
Flags : [int] 型: UINT 有効にするランタイムレイヤー (D3D11_CREATE_DEVICE_FLAG を参照)。複数の値をビット単位 OR で組み合わせ可能。
pFeatureLevels : [var] 型: const D3D_FEATURE_LEVEL* 試行する機能レベルの順序を決める D3D_FEATURE_LEVEL 配列へのポインタ。pFeatureLevels に NULL を設定した場合、この関数は以下の既定の機能レベル配列を使用する。
FeatureLevels : [int] 型: UINT pFeatureLevels の要素数。
SDKVersion : [int] 型: UINT SDK バージョン。D3D11_SDK_VERSION を指定する。
ppDevice : [var] 型: ID3D11Device** 作成されたデバイスを表す ID3D11Device オブジェクトへのポインタのアドレスを返す。このパラメータが NULL の場合、ID3D11Device は返されない。
pFeatureLevel : [var] 型: D3D_FEATURE_LEVEL* 成功時、pFeatureLevels 配列のうち最初に成功した D3D_FEATURE_LEVEL を返す。どの機能レベルがサポートされているか判定する必要がない場合は NULL を指定する。
ppImmediateContext : [var] 型: ID3D11DeviceContext** デバイスコンテキストを表す ID3D11DeviceContext オブジェクトへのポインタのアドレスを返す。このパラメータが NULL の場合、ID3D11DeviceContext は返されない。
%inst
ディスプレイアダプタを表すデバイスを作成する。(D3D11CreateDevice)

[戻り値]
型: HRESULT このメソッドは Direct3D 11 の戻りコードのいずれかを返すことがある。
pAdapter に NULL 以外を設定しつつ DriverType を D3D_DRIVER_TYPE_HARDWARE
にすると、このメソッドは E_INVALIDARG を返す。
Flags に D3D11_CREATE_DEVICE_DEBUG
を指定したがコンピュータ上に不適切なバージョンのデバッグレイヤーしかインストールされていない場合、このメソッドは
DXGI_ERROR_SDK_COMPONENT_MISSING を返す。正しいバージョンを入手するには最新の Windows SDK
をインストールすること。

[備考]
このエントリポイントは Direct3D 11 ランタイムによりサポートされる。Direct3D 11 ランタイムは Windows
7、Windows Server 2008 R2、および Windows Vista の更新プログラム (KB971644)
として提供されている。
Windows 8、Windows Server 2012、および Platform Update for Windows 7
がインストールされた Windows 7 / Windows Server 2008 R2 で利用可能な Direct3D 11.1
デバイス (ID3D11Device1) を作成するには、まずこの関数で ID3D11Device を作成し、その後
ID3D11Device オブジェクトの QueryInterface メソッドを呼び出して ID3D11Device1
インターフェースを取得する。
Windows 8.1 および Windows Server 2012 R2 で利用可能な Direct3D 11.2 デバイス
(ID3D11Device2) を作成するには、まずこの関数で ID3D11Device を作成し、その後 ID3D11Device
オブジェクトの QueryInterface メソッドを呼び出して ID3D11Device2 インターフェースを取得する。
デバイスを作成せずに pFeatureLevel だけでサポートされる機能レベルを判定するには、ppDevice と
ppImmediateContext の両方を NULL に設定する。
例については How To: Create a Device and Immediate Context
を参照。デバイスとスワップチェーンを同時に作成するには D3D11CreateDeviceAndSwapChain を使用する。
pAdapter パラメータに NULL 以外の値を指定する場合、DriverType パラメータには
D3D_DRIVER_TYPE_UNKNOWN 値を指定しなければならない。pAdapter に NULL 以外を設定しつつ
DriverType を D3D_DRIVER_TYPE_HARDWARE にすると、D3D11CreateDevice は
E_INVALIDARG の HRESULT を返す。
このドキュメントは省略されている。


%index
D3D11CreateDeviceAndSwapChain
ディスプレイアダプタを表すデバイスと、描画に使用するスワップチェーンを作成する。
%prm
pAdapter, DriverType, Software, Flags, pFeatureLevels, FeatureLevels, SDKVersion, pSwapChainDesc, ppSwapChain, ppDevice, pFeatureLevel, ppImmediateContext
pAdapter : [var] 型: IDXGIAdapter* デバイス作成時に使用するビデオアダプタへのポインタ。既定のアダプタを使う場合は NULL を渡す。既定のアダプタは IDXGIFactory1::EnumAdapters が最初に列挙するアダプタである。注意 DXGI 1.0 (IDXGIFactory) と DXGI 1.1 (IDXGIFactory1) を 1 つのアプリケーションで混在させてはならない。IDXGIFactory または IDXGIFactory1 のどちらか一方だけを使う。
DriverType : [int] 型: D3D_DRIVER_TYPE 作成するドライバ種別を表す D3D_DRIVER_TYPE。
Software : [intptr] 型: HMODULE ソフトウェアラスタライザを実装する DLL へのハンドル。DriverType が D3D_DRIVER_TYPE_SOFTWARE の場合、Software は NULL であってはならない。ハンドルは LoadLibrary、LoadLibraryEx、GetModuleHandle のいずれかで取得する。D3D_DRIVER_TYPE が D3D_DRIVER_TYPE_SOFTWARE の場合は非 NULL、それ以外は NULL とする。
Flags : [int] 型: UINT 有効にするランタイムレイヤー (D3D11_CREATE_DEVICE_FLAG を参照)。複数の値をビット単位 OR で組み合わせ可能。
pFeatureLevels : [var] 型: const D3D_FEATURE_LEVEL* 試行する機能レベルの順序を決める D3D_FEATURE_LEVEL 配列へのポインタ。pFeatureLevels に NULL を設定した場合、この関数は以下の既定の機能レベル配列を使用する。
FeatureLevels : [int] 型: UINT pFeatureLevels の要素数。
SDKVersion : [int] 型: UINT SDK バージョン。D3D11_SDK_VERSION を指定する。
pSwapChainDesc : [var] 型: const DXGI_SWAP_CHAIN_DESC* スワップチェーンの初期化パラメータを保持するスワップチェーン記述 (DXGI_SWAP_CHAIN_DESC を参照) へのポインタ。
ppSwapChain : [var] 型: IDXGISwapChain** 描画に使用されるスワップチェーンを表す IDXGISwapChain オブジェクトへのポインタのアドレスを返す。
ppDevice : [var] 型: ID3D11Device** 作成されたデバイスを表す ID3D11Device オブジェクトへのポインタのアドレスを返す。このパラメータが NULL の場合、ID3D11Device は返されない。
pFeatureLevel : [var] 型: D3D_FEATURE_LEVEL* デバイスがサポートする機能レベル配列の先頭要素を表す D3D_FEATURE_LEVEL へのポインタを返す。どの機能レベルがサポートされているか判定する必要がない場合は NULL を指定する。
ppImmediateContext : [var] 型: ID3D11DeviceContext** デバイスコンテキストを表す ID3D11DeviceContext オブジェクトへのポインタのアドレスを返す。このパラメータが NULL の場合、ID3D11DeviceContext は返されない。
%inst
ディスプレイアダプタを表すデバイスと、描画に使用するスワップチェーンを作成する。

[戻り値]
型: HRESULT このメソッドは Direct3D 11 の戻りコードのいずれかを返すことがある。
Session 0 プロセス内で呼び出した場合は DXGI_ERROR_NOT_CURRENTLY_AVAILABLE を返す。
pAdapter に NULL 以外を設定しつつ DriverType を D3D_DRIVER_TYPE_HARDWARE
にすると、E_INVALIDARG を返す。
Flags に D3D11_CREATE_DEVICE_DEBUG
を指定したがコンピュータ上に不適切なバージョンのデバッグレイヤーしかインストールされていない場合、DXGI_ERROR_SDK_COMPONENT_MISSING
を返す。正しいバージョンを入手するには最新の Windows SDK をインストールすること。

[備考]
注意 このメソッドを Session 0 プロセス内で呼び出すと DXGI_ERROR_NOT_CURRENTLY_AVAILABLE
を返す。 このエントリポイントは Direct3D 11 ランタイムによりサポートされ、Windows 7、Windows Server
2008 R2、および Windows Vista の更新プログラム (KB971644) として提供されている。
Windows 8、Windows Server 2012、および Platform Update for Windows 7
がインストールされた Windows 7 / Windows Server 2008 R2 で利用可能な Direct3D 11.1
デバイス (ID3D11Device1) を作成するには、まずこの関数で ID3D11Device を作成し、その後
ID3D11Device オブジェクトの QueryInterface メソッドを呼び出して ID3D11Device1
インターフェースを取得する。
Windows 8.1 および Windows Server 2012 R2 で利用可能な Direct3D 11.2 デバイス
(ID3D11Device2) を作成するには、まずこの関数で ID3D11Device を作成し、その後 ID3D11Device
オブジェクトの QueryInterface メソッドを呼び出して ID3D11Device2 インターフェースを取得する。
入力パラメータの依存関係の詳細については D3D11CreateDevice
の備考も参照すること。スワップチェーンを作成せずにデバイスだけを作成するには D3D11CreateDevice 関数を使用する。
pAdapter パラメータに NULL 以外の値を指定する場合、DriverType パラメータには
D3D_DRIVER_TYPE_UNKNOWN 値を指定しなければならない。pAdapter に NULL 以外を設定しつつ
DriverType を D3D_DRIVER_TYPE_HARDWARE
にすると、D3D11CreateDeviceAndSwapChain は E_INVALIDARG の HRESULT を返す。
関数シグネチャ PFN_D3D11_CREATE_DEVICE_AND_SWAP_CHAIN は typedef
として提供されているので、静的リンクせずに動的リンク技法 (GetProcAddress) を使うこともできる。
使用上の注意 注意 D3D11CreateDeviceAndSwapChain 関数は Windows
ストアアプリでは利用できない。代わりに Windows ストアアプリでは D3D11CreateDevice 関数と
IDXGIFactory2::CreateSwapChainForCoreWindow メソッドを用いる。 注意
この関数はスワップチェーン作成の最近の追加機能をサポートするように更新されていない。最新のスワップチェーン作成手段については
IDXGIFactory2 のメソッド
(CreateSwapChainForHwnd、CreateSwapChainForCoreWindow、CreateSwapChainForComposition
を含む) を参照。 Windows Phone 8: この API はサポートされる。


%index
D3D11On12CreateDevice
Direct3D 12 の機能を用いて Direct3D 11 機能を提供するデバイスを作成する。Direct3D 11 との相互運用に使う既存の Direct3D 12 デバイスを指定する。
%prm
pDevice, Flags, pFeatureLevels, FeatureLevels, ppCommandQueues, NumQueues, NodeMask, ppDevice, ppImmediateContext, pChosenFeatureLevel
pDevice : [var] 型: IUnknown* Direct3D 11 との相互運用に使用する既存の Direct3D 12 デバイスを指定する。NULL にできない。
Flags : [int] 型: UINT D3D11_CREATE_DEVICE_FLAG のフラグを 1 つ以上ビット単位 OR で組み合わせた値。D3D11CreateDeviceAndSwapChain が使うのと同じフラグで、有効にするランタイムレイヤーを指定する。フラグはデバイスフラグと互換性がなければならず、NodeMask は present API に渡した NodeMask のサブセットでなければならない。
pFeatureLevels : [var] 型: const D3D_FEATURE_LEVEL* 以下のいずれかを含む配列。
FeatureLevels : [int] 型: UINT *pFeatureLevels* 配列のサイズ (要素数)。
ppCommandQueues : [var] 型: IUnknown* const * D3D11On12 が使用する一意なキューの配列。これらのキューは 3D コマンドキュー種別でなければならない。
NumQueues : [int] 型: UINT *ppCommandQueues* 配列のサイズ (要素数)。
NodeMask : [int] 型: UINT 使用する Direct3D 12 デバイスのノード。1 ビットだけを設定できる。
ppDevice : [var] 型: ID3D11Device** 返される ID3D11Device へのポインタ。NULL を指定してもよい。
ppImmediateContext : [var] 型: ID3D11DeviceContext** 返される ID3D11DeviceContext へのポインタ。NULL を指定してもよい。
pChosenFeatureLevel : [var] 型: D3D_FEATURE_LEVEL* 返される機能レベルへのポインタ。NULL を指定してもよい。
%inst
Direct3D 12 の機能を用いて Direct3D 11 機能を提供するデバイスを作成する。Direct3D 11
との相互運用に使う既存の Direct3D 12 デバイスを指定する。

[戻り値]
型: HRESULT このメソッドは D3D11CreateDevice に記載されている Direct3D 12
の戻りコードのいずれかを返す。Flags に D3D11_CREATE_DEVICE_DEBUG
を指定したがコンピュータ上に不適切なバージョンのデバッグレイヤーしかインストールされていない場合、DXGI_ERROR_SDK_COMPONENT_MISSING
を返す。正しいバージョンを入手するには最新の Windows SDK をインストールすること。

[備考]
関数シグネチャ PFN_D3D11ON12_CREATE_DEVICE は typedef
として提供されているので、静的リンクせずに動的リンク技法 (GetProcAddress) を使うこともできる。

