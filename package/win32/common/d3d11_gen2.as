; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    d3d11.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __d3d11_gen2_as__
#define global __d3d11_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "d3d11.dll"
; winmdroot.Foundation.HRESULT CreateDirect3D11DeviceFromDXGIDevice(winmdroot.Graphics.Dxgi.IDXGIDevice* dxgiDevice, winmdroot.System.WinRT.IInspectable** graphicsDevice)
#cfunc global CreateDirect3D11DeviceFromDXGIDevice "CreateDirect3D11DeviceFromDXGIDevice" var, var

; winmdroot.Foundation.HRESULT CreateDirect3D11SurfaceFromDXGISurface(winmdroot.Graphics.Dxgi.IDXGISurface* dgxiSurface, winmdroot.System.WinRT.IInspectable** graphicsSurface)
#cfunc global CreateDirect3D11SurfaceFromDXGISurface "CreateDirect3D11SurfaceFromDXGISurface" var, var

; winmdroot.Foundation.HRESULT D3D11CreateDevice([Optional] winmdroot.Graphics.Dxgi.IDXGIAdapter* pAdapter, winmdroot.Graphics.Direct3D.D3D_DRIVER_TYPE DriverType, winmdroot.Foundation.HMODULE Software, winmdroot.Graphics.Direct3D11.D3D11_CREATE_DEVICE_FLAG Flags, [Optional] winmdroot.Graphics.Direct3D.D3D_FEATURE_LEVEL* pFeatureLevels, uint FeatureLevels, uint SDKVersion, [Optional] winmdroot.Graphics.Direct3D11.ID3D11Device** ppDevice, [Optional] winmdroot.Graphics.Direct3D.D3D_FEATURE_LEVEL* pFeatureLevel, [Optional] winmdroot.Graphics.Direct3D11.ID3D11DeviceContext** ppImmediateContext)
#cfunc global D3D11CreateDevice "D3D11CreateDevice" var, int, intptr, int, var, int, int, var, var, var

; winmdroot.Foundation.HRESULT D3D11CreateDeviceAndSwapChain([Optional] winmdroot.Graphics.Dxgi.IDXGIAdapter* pAdapter, winmdroot.Graphics.Direct3D.D3D_DRIVER_TYPE DriverType, winmdroot.Foundation.HMODULE Software, winmdroot.Graphics.Direct3D11.D3D11_CREATE_DEVICE_FLAG Flags, [Optional] winmdroot.Graphics.Direct3D.D3D_FEATURE_LEVEL* pFeatureLevels, uint FeatureLevels, uint SDKVersion, [Optional] winmdroot.Graphics.Dxgi.DXGI_SWAP_CHAIN_DESC* pSwapChainDesc, [Optional] winmdroot.Graphics.Dxgi.IDXGISwapChain** ppSwapChain, [Optional] winmdroot.Graphics.Direct3D11.ID3D11Device** ppDevice, [Optional] winmdroot.Graphics.Direct3D.D3D_FEATURE_LEVEL* pFeatureLevel, [Optional] winmdroot.Graphics.Direct3D11.ID3D11DeviceContext** ppImmediateContext)
#cfunc global D3D11CreateDeviceAndSwapChain "D3D11CreateDeviceAndSwapChain" var, int, intptr, int, var, int, int, var, var, var, var, var

; winmdroot.Foundation.HRESULT D3D11On12CreateDevice(winmdroot.System.Com.IUnknown* pDevice, uint Flags, [Optional] winmdroot.Graphics.Direct3D.D3D_FEATURE_LEVEL* pFeatureLevels, uint FeatureLevels, [Optional] winmdroot.System.Com.IUnknown** ppCommandQueues, uint NumQueues, uint NodeMask, [Optional] winmdroot.Graphics.Direct3D11.ID3D11Device** ppDevice, [Optional] winmdroot.Graphics.Direct3D11.ID3D11DeviceContext** ppImmediateContext, [Optional] winmdroot.Graphics.Direct3D.D3D_FEATURE_LEVEL* pChosenFeatureLevel)
#cfunc global D3D11On12CreateDevice "D3D11On12CreateDevice" var, int, var, int, var, int, int, var, var, var

#endif
