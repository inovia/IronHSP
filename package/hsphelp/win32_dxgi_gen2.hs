; ============================================================
;   dxgi.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
CreateDXGIFactory
Creates a DXGI 1.0 factory that you can use to generate other DXGI objects.
%group
Win32 dxgi
%prm
riid, ppFactory
riid : [var] Type: REFIID The globally unique identifier (GUID) of the IDXGIFactory object referenced by the ppFactory parameter.
ppFactory : [var] Type: void** Address of a pointer to an IDXGIFactory object.
%inst
Creates a DXGI 1.0 factory that you can use to generate other DXGI
objects.

[戻り値]
Type: HRESULT Returns S_OK if successful; otherwise, returns one of
the following DXGI_ERROR.

[備考]
Use a DXGI factory to generate objects that enumerate adapters,
create swap chains, and associate a window with the alt+enter key
sequence for toggling to and from the fullscreen display mode. If the
CreateDXGIFactory function succeeds, the reference count on the
IDXGIFactory interface is incremented. To avoid a memory leak, when
you finish using the interface, call the IDXGIFactory::Release method
to release the interface. Note Do not mix the use of DXGI 1.0
(IDXGIFactory) and DXGI 1.1 (IDXGIFactory1) in an application. Use
IDXGIFactory or IDXGIFactory1, but not both in an application. Note
CreateDXGIFactory fails if your app's DllMain function calls it. For
more info about how DXGI responds from DllMain, see DXGI Responses
from DLLMain.
This doc was truncated.


%index
CreateDXGIFactory1
Creates a DXGI 1.1 factory that you can use to generate other DXGI objects.
%group
Win32 dxgi
%prm
riid, ppFactory
riid : [var] Type: REFIID The globally unique identifier (GUID) of the IDXGIFactory1 object referenced by the ppFactory parameter.
ppFactory : [var] Type: void** Address of a pointer to an IDXGIFactory1 object.
%inst
Creates a DXGI 1.1 factory that you can use to generate other DXGI
objects.

[戻り値]
Type: HRESULT Returns S_OK if successful; an error code otherwise.
For a list of error codes, see DXGI_ERROR.

[備考]
Use a DXGI 1.1 factory to generate objects that enumerate adapters,
create swap chains, and associate a window with the alt+enter key
sequence for toggling to and from the full-screen display mode. If
the CreateDXGIFactory1 function succeeds, the reference count on the
IDXGIFactory1 interface is incremented. To avoid a memory leak, when
you finish using the interface, call the IDXGIFactory1::Release
method to release the interface. This entry point is not supported by
DXGI 1.0, which shipped in Windows Vista and Windows Server 2008.
DXGI 1.1 support is required, which is available on Windows 7,
Windows Server 2008 R2, and as an update to Windows Vista with
Service Pack 2 (SP2) (KB 971644) and Windows Server 2008 (KB 971512).
Note Do not mix the use of DXGI 1.0 (IDXGIFactory) and DXGI 1.1
(IDXGIFactory1) in an application. Use IDXGIFactory or IDXGIFactory1,
but not both in an application. Note CreateDXGIFactory1 fails if your
app's DllMain function calls it. For more info about how DXGI
responds from DllMain, see DXGI Responses from DLLMain.
This doc was truncated.


%index
CreateDXGIFactory2
Creates a DXGI 1.3 factory that you can use to generate other DXGI objects.
%group
Win32 dxgi
%prm
Flags, riid, ppFactory
Flags : [int] Type: UINT Valid values include the DXGI_CREATE_FACTORY_DEBUG (0x01) flag, and zero.
riid : [var] Type: REFIID The globally unique identifier (GUID) of the IDXGIFactory2 object referenced by the ppFactory parameter.
ppFactory : [var] Type: void** Address of a pointer to an IDXGIFactory2 object.
%inst
Creates a DXGI 1.3 factory that you can use to generate other DXGI
objects.

[戻り値]
Type: HRESULT Returns S_OK if successful; an error code otherwise.
For a list of error codes, see DXGI_ERROR.

[備考]
This function accepts a flag indicating whether DXGIDebug.dll is
loaded. The function otherwise behaves identically to
CreateDXGIFactory1.


%index
DXGIDeclareAdapterRemovalSupport
Allows a process to indicate that it's resilient to any of its graphics devices being removed.
%group
Win32 dxgi
%prm

%inst
Allows a process to indicate that it's resilient to any of its
graphics devices being removed.

[戻り値]
Type: HRESULT Returns S_OK if successful; an error code otherwise. If
this function is called after device creation, it returns
DXGI_ERROR_INVALID_CALL. If this is not the first time that this
function is called, it returns DXGI_ERROR_ALREADY_EXISTS. For a full
list of error codes, see DXGI_ERROR.

[備考]
This function is graphics API-agnostic, meaning that apps running on
other APIs, such as OpenGL and Vulkan, would also apply. This
function should be called once per process and before any device
creation.


%index
DXGIGetDebugInterface1
Retrieves an interface that Windows Store apps use for debugging the Microsoft DirectX Graphics Infrastructure (DXGI).
%group
Win32 dxgi
%prm
Flags, riid, pDebug
Flags : [int] Not used.
riid : [var] The globally unique identifier (GUID) of the requested interface type, which can be the identifier for the IDXGIDebug, IDXGIDebug1, or IDXGIInfoQueue interfaces.
pDebug : [var] A pointer to a buffer that receives a pointer to the debugging interface.
%inst
Retrieves an interface that Windows Store apps use for debugging the
Microsoft DirectX Graphics Infrastructure (DXGI).

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The DXGIGetDebugInterface1 function returns E_NOINTERFACE on systems
without the Windows Software Development Kit (SDK) installed, because
it's a development-time aid.

