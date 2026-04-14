; ============================================================
;   d3d11.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
CreateDirect3D11DeviceFromDXGIDevice
Creates an instance of IDirect3DDevice from an IDXGIDevice.
%group
Win32 d3d11
%prm
dxgiDevice, graphicsDevice
dxgiDevice : [var] Type: **[IDXGIDevice](/windows/desktop/api/dxgi/nn-dxgi-idxgidevice)\*** The [IDXGIDevice](/windows/desktop/api/dxgi/nn-dxgi-idxgidevice) to create the Direct3DDevice from.
graphicsDevice : [var] Type: **[IInspectable](/windows/desktop/api/inspectable/nn-inspectable-iinspectable)\*\*** A Direct3DDevice instance that wraps the DXGIDevice.
%inst
Creates an instance of IDirect3DDevice from an IDXGIDevice.

[戻り値]
Type:
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes) If
the function succeeds, it returns **S_OK**. Otherwise, it returns an
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
[error code](/windows/desktop/com/com-error-codes-10).

[備考]
While we recommend
[C++/WinRT](/windows/uwp/cpp-and-winrt-apis/index), if you're using
C++/CX then you should call
[CreateDirect3DDevice](/windows/desktop/api/d3d11/nf-d3d11-d3d11createdevice)
instead of **CreateDirect3D11DeviceFromDXGIDevice**. If you're using
WRL then **CreateDirect3D11DeviceFromDXGIDevice** can be used as
shown in this code example.
This doc was truncated.


%index
CreateDirect3D11SurfaceFromDXGISurface
Creates an instance of IDirect3DSurface from an IDXGISurface.
%group
Win32 d3d11
%prm
dgxiSurface, graphicsSurface
dgxiSurface : [var] 
graphicsSurface : [var] Type: **[IInspectable](/windows/desktop/api/inspectable/nn-inspectable-iinspectable)\*\*** An [IDirect3DSurface](/uwp/api/windows.graphics.directx.direct3d11.idirect3dsurface) instance that wraps the [IDXGISurface](/windows/desktop/api/dxgi/nn-dxgi-idxgisurface).
%inst
Creates an instance of IDirect3DSurface from an IDXGISurface.

[戻り値]
Type:
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes) If
the function succeeds, it returns **S_OK**. Otherwise, it returns an
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
[error code](/windows/desktop/com/com-error-codes-10).

[備考]
While we recommend
[C++/WinRT](/windows/uwp/cpp-and-winrt-apis/index), if you're using
C++/CX then you should call
[CreateDirect3DSurface](./nf-windows-graphics-directx-direct3d11-interop-createdirect3dsurface.md)
instead of **CreateDirect3D11DeviceFromDXGIDevice**. If you're using
WRL then **CreateDirect3D11DeviceFromDXGIDevice** can be used as
shown in this code example.
This doc was truncated.


%index
D3D11CreateDevice
Creates a device that represents the display adapter. (D3D11CreateDevice)
%group
Win32 d3d11
%prm
pAdapter, DriverType, Software, Flags, pFeatureLevels, FeatureLevels, SDKVersion, ppDevice, pFeatureLevel, ppImmediateContext
pAdapter : [var] Type: IDXGIAdapter* A pointer to the video adapter to use when creating a device. Pass NULL to use the default adapter, which is the first adapter that is enumerated by IDXGIFactory1::EnumAdapters. Note??Do not mix the use of DXGI 1.0 (IDXGIFactory) and DXGI 1.1 (IDXGIFactory1) in an application. Use IDXGIFactory or IDXGIFactory1, but not both in an application.
DriverType : [int] Type: D3D_DRIVER_TYPE The D3D_DRIVER_TYPE, which represents the driver type to create.
Software : [intptr] Type: HMODULE A handle to a DLL that implements a software rasterizer. If DriverType is D3D_DRIVER_TYPE_SOFTWARE, Software must not be NULL. Get the handle by calling LoadLibrary, LoadLibraryEx , or GetModuleHandle.
Flags : [int] Type: UINT The runtime layers to enable (see D3D11_CREATE_DEVICE_FLAG); values can be bitwise OR'd together.
pFeatureLevels : [var] Type: const D3D_FEATURE_LEVEL* A pointer to an array of D3D_FEATURE_LEVELs, which determine the order of feature levels to attempt to create. If pFeatureLevels is set to NULL, this function uses the following array of feature levels:
FeatureLevels : [int] Type: UINT The number of elements in pFeatureLevels.
SDKVersion : [int] Type: UINT The SDK version; use D3D11_SDK_VERSION.
ppDevice : [var] Type: ID3D11Device** Returns the address of a pointer to an ID3D11Device object that represents the device created. If this parameter is NULL, no ID3D11Device will be returned.
pFeatureLevel : [var] Type: D3D_FEATURE_LEVEL* If successful, returns the first D3D_FEATURE_LEVEL from the pFeatureLevels array which succeeded. Supply NULL as an input if you don't need to determine which feature level is supported.
ppImmediateContext : [var] Type: ID3D11DeviceContext** Returns the address of a pointer to an ID3D11DeviceContext object that represents the device context. If this parameter is NULL, no ID3D11DeviceContext will be returned.
%inst
Creates a device that represents the display adapter.
(D3D11CreateDevice)

[戻り値]
Type: HRESULT This method can return one of the Direct3D 11 Return
Codes.
This method returns E_INVALIDARG if you set the pAdapter parameter to
a non-NULL value and the DriverType parameter to the
D3D_DRIVER_TYPE_HARDWARE value.
This method returns DXGI_ERROR_SDK_COMPONENT_MISSING if you specify
D3D11_CREATE_DEVICE_DEBUG in Flags and the incorrect version of the
debug layer is installed on your computer. Install the latest Windows
SDK to get the correct version.

[備考]
This entry-point is supported by the Direct3D 11 runtime, which is
available on Windows 7, Windows Server 2008 R2, and as an update to
Windows Vista (KB971644).
To create a Direct3D 11.1 device (ID3D11Device1), which is available
on Windows 8, Windows Server 2012, and Windows 7 and Windows Server
2008 R2 with the Platform Update for Windows 7 installed, you first
create a ID3D11Device with this function, and then call the
QueryInterface method on the ID3D11Device object to obtain the
ID3D11Device1 interface.
To create a Direct3D 11.2 device (ID3D11Device2), which is available
on Windows 8.1 and Windows Server 2012 R2, you first create a
ID3D11Device with this function, and then call the QueryInterface
method on the ID3D11Device object to obtain the ID3D11Device2
interface.
Set ppDevice and ppImmediateContext to NULL to determine which
feature level is supported by looking at pFeatureLevel without
creating a device.
For an example, see How To: Create a Device and Immediate Context; to
create a device and a swap chain at the same time, use
D3D11CreateDeviceAndSwapChain.
If you set the pAdapter parameter to a non-NULL value, you must also
set the DriverType parameter to the D3D_DRIVER_TYPE_UNKNOWN value. If
you set the pAdapter parameter to a non-NULL value and the DriverType
parameter to the D3D_DRIVER_TYPE_HARDWARE value, D3D11CreateDevice
returns an HRESULT of E_INVALIDARG.
This doc was truncated.


%index
D3D11CreateDeviceAndSwapChain
Creates a device that represents the display adapter and a swap chain used for rendering.
%group
Win32 d3d11
%prm
pAdapter, DriverType, Software, Flags, pFeatureLevels, FeatureLevels, SDKVersion, pSwapChainDesc, ppSwapChain, ppDevice, pFeatureLevel, ppImmediateContext
pAdapter : [var] Type: IDXGIAdapter* A pointer to the video adapter to use when creating a device. Pass NULL to use the default adapter, which is the first adapter enumerated by IDXGIFactory1::EnumAdapters. Note??Do not mix the use of DXGI 1.0 (IDXGIFactory) and DXGI 1.1 (IDXGIFactory1) in an application. Use IDXGIFactory or IDXGIFactory1, but not both in an application.
DriverType : [int] Type: D3D_DRIVER_TYPE The D3D_DRIVER_TYPE, which represents the driver type to create.
Software : [intptr] Type: HMODULE A handle to a DLL that implements a software rasterizer. If DriverType is D3D_DRIVER_TYPE_SOFTWARE, Software must not be NULL. Get the handle by calling LoadLibrary, LoadLibraryEx , or GetModuleHandle. The value should be non-NULL when D3D_DRIVER_TYPE is D3D_DRIVER_TYPE_SOFTWARE and NULL otherwise.
Flags : [int] Type: UINT The runtime layers to enable (see D3D11_CREATE_DEVICE_FLAG); values can be bitwise OR'd together.
pFeatureLevels : [var] Type: const D3D_FEATURE_LEVEL* A pointer to an array of D3D_FEATURE_LEVELs, which determine the order of feature levels to attempt to create. If pFeatureLevels is set to NULL, this function uses the following array of feature levels:
FeatureLevels : [int] Type: UINT The number of elements in pFeatureLevels.
SDKVersion : [int] Type: UINT The SDK version; use D3D11_SDK_VERSION.
pSwapChainDesc : [var] Type: const DXGI_SWAP_CHAIN_DESC* A pointer to a swap chain description (see DXGI_SWAP_CHAIN_DESC) that contains initialization parameters for the swap chain.
ppSwapChain : [var] Type: IDXGISwapChain** Returns the address of a pointer to the IDXGISwapChain object that represents the swap chain used for rendering.
ppDevice : [var] Type: ID3D11Device** Returns the address of a pointer to an ID3D11Device object that represents the device created. If this parameter is  NULL, no ID3D11Device will be returned'.
pFeatureLevel : [var] Type: D3D_FEATURE_LEVEL* Returns a pointer to a D3D_FEATURE_LEVEL, which represents the first element in an array of feature levels supported by the device. Supply NULL as an input if you don't need to determine which feature level is supported.
ppImmediateContext : [var] Type: ID3D11DeviceContext** Returns the address of a pointer to an ID3D11DeviceContext object that represents the device context. If this parameter is NULL, no ID3D11DeviceContext will be returned.
%inst
Creates a device that represents the display adapter and a swap chain
used for rendering.

[戻り値]
Type: HRESULT This method can return one of the Direct3D 11 Return
Codes.
This method returns DXGI_ERROR_NOT_CURRENTLY_AVAILABLE if you call it
in a Session 0 process.
This method returns E_INVALIDARG if you set the pAdapter parameter to
a non-NULL value and the DriverType parameter to the
D3D_DRIVER_TYPE_HARDWARE value.
This method returns DXGI_ERROR_SDK_COMPONENT_MISSING if you specify
D3D11_CREATE_DEVICE_DEBUG in Flags and the incorrect version of the
debug layer is installed on your computer. Install the latest Windows
SDK to get the correct version.

[備考]
Note If you call this method in a Session 0 process, it returns
DXGI_ERROR_NOT_CURRENTLY_AVAILABLE. This entry-point is supported by
the Direct3D 11 runtime, which is available on Windows 7, Windows
Server 2008 R2, and as an update to Windows Vista (KB971644).
To create a Direct3D 11.1 device (ID3D11Device1), which is available
on Windows 8, Windows Server 2012, and Windows 7 and Windows Server
2008 R2 with the Platform Update for Windows 7 installed, you first
create a ID3D11Device with this function, and then call the
QueryInterface method on the ID3D11Device object to obtain the
ID3D11Device1 interface.
To create a Direct3D 11.2 device (ID3D11Device2), which is available
on Windows 8.1 and Windows Server 2012 R2, you first create a
ID3D11Device with this function, and then call the QueryInterface
method on the ID3D11Device object to obtain the ID3D11Device2
interface.
Also, see the remarks section in D3D11CreateDevice for details about
input parameter dependencies. To create a device without creating a
swap chain, use the D3D11CreateDevice function.
If you set the pAdapter parameter to a non-NULL value, you must also
set the DriverType parameter to the D3D_DRIVER_TYPE_UNKNOWN value. If
you set the pAdapter parameter to a non-NULL value and the DriverType
parameter to the D3D_DRIVER_TYPE_HARDWARE value,
D3D11CreateDeviceAndSwapChain returns an HRESULT of E_INVALIDARG.
The function signature PFN_D3D11_CREATE_DEVICE_AND_SWAP_CHAIN is
provided as a typedef, so that you can use dynamic linking techniques
(GetProcAddress) instead of statically linking.
Usage notes Note The D3D11CreateDeviceAndSwapChain function does not
exist for Windows Store apps. Instead, Windows Store apps use the
D3D11CreateDevice function and then use the
IDXGIFactory2::CreateSwapChainForCoreWindow method. Note This
function has not been updated to support recent additional features
of swap chain creation. For the most up-to-date swap chain creation
methods, refer to the methods of IDXGIFactory2 (including
CreateSwapChainForHwnd, CreateSwapChainForCoreWindow and
CreateSwapChainForComposition). Windows Phone 8: This API is
supported.


%index
D3D11On12CreateDevice
Creates a device that uses Direct3D 11 functionality in Direct3D 12, specifying a pre-existing Direct3D 12 device to use for Direct3D 11 interop.
%group
Win32 d3d11
%prm
pDevice, Flags, pFeatureLevels, FeatureLevels, ppCommandQueues, NumQueues, NodeMask, ppDevice, ppImmediateContext, pChosenFeatureLevel
pDevice : [var] Type: IUnknown* Specifies a pre-existing Direct3D 12 device to use for Direct3D 11 interop. May not be NULL.
Flags : [int] Type: UINT One or more bitwise OR'd flags from D3D11_CREATE_DEVICE_FLAG. These are the same flags as those used by D3D11CreateDeviceAndSwapChain. Specifies which runtime layers to enable. Flags must be compatible with device flags, and its NodeMask must be a subset of the NodeMask provided to the present API.
pFeatureLevels : [var] Type: const D3D_FEATURE_LEVEL* An array of any of the following:
FeatureLevels : [int] Type: UINT The size of (that is, the number of elements in) the *pFeatureLevels* array.
ppCommandQueues : [var] Type: IUnknown* const * An array of unique queues for D3D11On12 to use. The queues must be of the 3D command queue type.
NumQueues : [int] Type: UINT The size of (that is, the number of elements in) the *ppCommandQueues* array.
NodeMask : [int] Type: UINT Which node of the Direct3D 12 device to use. Only 1 bit may be set.
ppDevice : [var] Type: ID3D11Device** Pointer to the returned ID3D11Device. May be NULL.
ppImmediateContext : [var] Type: ID3D11DeviceContext** A pointer to the returned ID3D11DeviceContext. May be NULL.
pChosenFeatureLevel : [var] Type: D3D_FEATURE_LEVEL* A pointer to the returned feature level. May be NULL.
%inst
Creates a device that uses Direct3D 11 functionality in Direct3D 12,
specifying a pre-existing Direct3D 12 device to use for Direct3D 11
interop.

[戻り値]
Type: HRESULT This method returns one of the Direct3D 12 Return Codes
that are documented for D3D11CreateDevice. This method returns
DXGI_ERROR_SDK_COMPONENT_MISSING if you specify
D3D11_CREATE_DEVICE_DEBUG in Flags and the incorrect version of the
debug layer is installed on your computer. Install the latest Windows
SDK to get the correct version.

[備考]
The function signature PFN_D3D11ON12_CREATE_DEVICE is provided as a
typedef, so that you can use dynamic linking techniques
(GetProcAddress) instead of statically linking.

