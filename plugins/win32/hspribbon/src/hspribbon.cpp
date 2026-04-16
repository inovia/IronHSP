//
//  hspribbon.dll - Windows Ribbon Framework plugin for HSP
//
//  Uses the native Windows Ribbon Framework (UIRibbon COM).
//  Requires Windows 7+ and a compiled ribbon markup (.bml) resource.
//
//  For simplicity, this implementation provides:
//  1. Loading a pre-compiled ribbon markup
//  2. Initializing the ribbon on a HWND
//  3. Handling command callbacks
//
//  The ribbon markup XML must be compiled with uicc.exe (Windows SDK)
//  and linked as a resource, OR loaded from a .bml file at runtime.
//
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <UIRibbon.h>
#include <UIRibbonPropertyHelpers.h>
#include <cstdio>

#pragma comment(lib, "propsys.lib")
#pragma comment(lib, "shlwapi.lib")

#define EXPORT extern "C" __declspec(dllexport)

// Forward declarations
class CApplication;
class CCommandHandler;

static IUIFramework *g_pFramework = nullptr;
static CApplication *g_pApplication = nullptr;
static HWND g_hWnd = 0;

// Callback function pointer type for HSP
typedef void (*HSP_RIBBON_CALLBACK)(int cmdId, int verb);
static HSP_RIBBON_CALLBACK g_callback = nullptr;

//------------------------------------------------------------
// IUICommandHandler implementation
//------------------------------------------------------------
class CCommandHandler : public IUICommandHandler
{
    LONG m_refCount;
public:
    CCommandHandler() : m_refCount(1) {}

    // IUnknown
    STDMETHOD(QueryInterface)(REFIID riid, void **ppv) {
        if (riid == __uuidof(IUnknown) || riid == __uuidof(IUICommandHandler)) {
            *ppv = static_cast<IUICommandHandler*>(this);
            AddRef();
            return S_OK;
        }
        *ppv = nullptr;
        return E_NOINTERFACE;
    }
    STDMETHOD_(ULONG, AddRef)() { return InterlockedIncrement(&m_refCount); }
    STDMETHOD_(ULONG, Release)() {
        LONG c = InterlockedDecrement(&m_refCount);
        if (c == 0) delete this;
        return c;
    }

    // IUICommandHandler
    STDMETHOD(Execute)(UINT nCmdID, UI_EXECUTIONVERB verb,
                       const PROPERTYKEY *key, const PROPVARIANT *ppropvarValue,
                       IUISimplePropertySet *pCommandExecutionProperties) {
        if (g_callback) g_callback(nCmdID, (int)verb);
        return S_OK;
    }

    STDMETHOD(UpdateProperty)(UINT nCmdID, REFPROPERTYKEY key,
                              const PROPVARIANT *ppropvarCurrentValue,
                              PROPVARIANT *ppropvarNewValue) {
        return E_NOTIMPL;
    }
};

//------------------------------------------------------------
// IUIApplication implementation
//------------------------------------------------------------
class CApplication : public IUIApplication
{
    LONG m_refCount;
    CCommandHandler *m_pHandler;
public:
    CApplication() : m_refCount(1), m_pHandler(new CCommandHandler()) {}
    ~CApplication() { if (m_pHandler) m_pHandler->Release(); }

    STDMETHOD(QueryInterface)(REFIID riid, void **ppv) {
        if (riid == __uuidof(IUnknown) || riid == __uuidof(IUIApplication)) {
            *ppv = static_cast<IUIApplication*>(this);
            AddRef();
            return S_OK;
        }
        *ppv = nullptr;
        return E_NOINTERFACE;
    }
    STDMETHOD_(ULONG, AddRef)() { return InterlockedIncrement(&m_refCount); }
    STDMETHOD_(ULONG, Release)() {
        LONG c = InterlockedDecrement(&m_refCount);
        if (c == 0) delete this;
        return c;
    }

    STDMETHOD(OnViewChanged)(UINT32 viewId, UI_VIEWTYPE typeID,
                             IUnknown *view, UI_VIEWVERB verb, INT32 uReasonCode) {
        return E_NOTIMPL;
    }

    STDMETHOD(OnCreateUICommand)(UINT32 commandId, UI_COMMANDTYPE typeID,
                                  IUICommandHandler **commandHandler) {
        if (m_pHandler) {
            m_pHandler->AddRef();
            *commandHandler = m_pHandler;
            return S_OK;
        }
        return E_FAIL;
    }

    STDMETHOD(OnDestroyUICommand)(UINT32 commandId, UI_COMMANDTYPE typeID,
                                   IUICommandHandler *commandHandler) {
        return E_NOTIMPL;
    }
};

//------------------------------------------------------------
// ribbon_init(hwnd) - Initialize ribbon framework
//------------------------------------------------------------
EXPORT int __cdecl ribbon_init(HWND hWnd)
{
    if (g_pFramework) return 0; // already initialized

    CoInitializeEx(nullptr, COINIT_APARTMENTTHREADED);

    HRESULT hr = CoCreateInstance(CLSID_UIRibbonFramework, nullptr, CLSCTX_INPROC_SERVER,
                                   __uuidof(IUIFramework), (void **)&g_pFramework);
    if (FAILED(hr)) return -1;

    g_pApplication = new CApplication();
    g_hWnd = hWnd;

    hr = g_pFramework->Initialize(hWnd, g_pApplication);
    if (FAILED(hr)) return -2;

    return 0;
}

//------------------------------------------------------------
// ribbon_load_markup(resource_name) - Load compiled ribbon markup
//   The markup must be embedded as a resource or loaded from file.
//   resource_name: resource name in the exe/dll
//------------------------------------------------------------
EXPORT int __cdecl ribbon_load_markup(const wchar_t *resourceName)
{
    if (!g_pFramework) return -1;

    HRESULT hr = g_pFramework->LoadUI(GetModuleHandle(nullptr), resourceName);
    if (FAILED(hr)) return -2;

    return 0;
}

//------------------------------------------------------------
// ribbon_set_callback(callback_ptr) - Set command callback
//------------------------------------------------------------
EXPORT int __cdecl ribbon_set_callback(HSP_RIBBON_CALLBACK cb)
{
    g_callback = cb;
    return 0;
}

//------------------------------------------------------------
// ribbon_destroy() - Cleanup
//------------------------------------------------------------
EXPORT int __cdecl ribbon_destroy()
{
    if (g_pFramework) {
        g_pFramework->Destroy();
        g_pFramework->Release();
        g_pFramework = nullptr;
    }
    if (g_pApplication) {
        g_pApplication->Release();
        g_pApplication = nullptr;
    }
    return 0;
}

//------------------------------------------------------------
// ribbon_get_height() - Get ribbon height in pixels
//------------------------------------------------------------
EXPORT int __cdecl ribbon_get_height()
{
    if (!g_pFramework) return 0;

    IUIRibbon *pRibbon = nullptr;
    HRESULT hr = g_pFramework->GetView(0, __uuidof(IUIRibbon), (void **)&pRibbon);
    if (FAILED(hr) || !pRibbon) return 0;

    UINT32 height = 0;
    pRibbon->GetHeight(&height);
    pRibbon->Release();
    return (int)height;
}

BOOL WINAPI DllMain(HINSTANCE h, DWORD r, LPVOID p) {
    if (r == DLL_PROCESS_DETACH) ribbon_destroy();
    return TRUE;
}
