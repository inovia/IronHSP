//
//  hspvcam.dll -- IronHSP DirectShow Virtual Webcam
//
//  This single-file DLL serves two purposes:
//
//  (A) DirectShow capture source filter
//      - Registered via regsvr32 as a Video Capture Source
//      - Runs inside the consuming application's process (Zoom/Teams/OBS/etc.)
//      - Reads frames from cross-process shared memory
//      - Implements IBaseFilter / IPin / IAMStreamConfig / IKsPropertySet
//
//  (B) HSP-facing exports (loaded by HSP process)
//      - vcam_create(w, h, fps)   -- create shared memory + event
//      - vcam_send_frame(buf, sz) -- push BGRA frame
//      - vcam_is_connected()      -- check if filter is reading
//      - vcam_close()             -- destroy
//
//  Cross-process communication:
//      Shared memory : "IronHSP_VCam_SharedMem"
//      Frame event   : "IronHSP_VCam_FrameReady"
//      Alive event   : "IronHSP_VCam_Alive"
//
//  Shared memory layout:
//      VCamSharedHeader (64 bytes) + BGRA pixel data (w*h*4)
//

#define WIN32_LEAN_AND_MEAN
#define COBJMACROS
#include <windows.h>
#include <initguid.h>
#include <objbase.h>
#include <strmif.h>
#include <uuids.h>
#include <olectl.h>
#include <amvideo.h>
#include <dvdmedia.h>
#include <vfwmsgs.h>
#include <ks.h>
#include <ksproxy.h>
#include <ksmedia.h>
#include <cstdio>
#include <cstring>
#include <atomic>
#include <mutex>

#pragma comment(lib, "ole32.lib")
#pragma comment(lib, "oleaut32.lib")
#pragma comment(lib, "strmiids.lib")
#pragma comment(lib, "advapi32.lib")
#pragma comment(lib, "user32.lib")
#pragma comment(lib, "gdi32.lib")

// ============================================================
//  GUIDs
// ============================================================

// {8A5E2CE1-78D4-4E58-B4D7-1A2B3C4D5E6F}
DEFINE_GUID(CLSID_IronHSPVCam,
    0x8a5e2ce1, 0x78d4, 0x4e58,
    0xb4, 0xd7, 0x1a, 0x2b, 0x3c, 0x4d, 0x5e, 0x6f);

static const wchar_t FILTER_NAME[] = L"IronHSP Virtual Camera";

// ============================================================
//  Shared memory layout
// ============================================================
#pragma pack(push, 1)
struct VCamSharedHeader {
    int  width;              // frame width
    int  height;             // frame height
    int  fps;                // frame rate
    int  frame_counter;      // incremented each send
    int  consumer_alive;     // filter sets to 1 while active
    int  producer_active;    // HSP sets to 1 while open
    int  reserved[10];       // pad to 64 bytes total
};
#pragma pack(pop)

static const wchar_t SHM_NAME[]   = L"IronHSP_VCam_SharedMem";
static const wchar_t EVT_FRAME[]  = L"IronHSP_VCam_FrameReady";
static const wchar_t EVT_ALIVE[]  = L"IronHSP_VCam_Alive";

// Default resolution when no producer is active
static const int DEFAULT_W   = 1280;
static const int DEFAULT_H   = 720;
static const int DEFAULT_FPS = 30;

// ============================================================
//  DLL globals
// ============================================================
static HMODULE g_hModule  = NULL;
static LONG    g_cDllRef  = 0;

// ============================================================
//  HSP-side state (producer)
// ============================================================
static HANDLE             g_prodMapFile  = NULL;
static HANDLE             g_prodEvent    = NULL;
static HANDLE             g_prodAlive    = NULL;
static VCamSharedHeader*  g_prodHeader   = NULL;
static BYTE*              g_prodPixels   = NULL;
static int                g_prodW        = 0;
static int                g_prodH        = 0;
static int                g_prodFps      = 0;
static size_t             g_prodPixelSz  = 0;
static bool               g_prodOpen     = false;
static std::mutex         g_prodMutex;

// ============================================================
//  Forward declarations
// ============================================================
class CVCamFilter;
class CVCamPin;

// ============================================================
//  Helper: RAII CriticalSection
// ============================================================
class CAutoLock {
    CRITICAL_SECTION* m_pCS;
public:
    CAutoLock(CRITICAL_SECTION* pcs) : m_pCS(pcs) { EnterCriticalSection(m_pCS); }
    ~CAutoLock() { LeaveCriticalSection(m_pCS); }
};

// ============================================================
//  CVCamPin -- output pin
// ============================================================
class CVCamPin : public IPin, public IQualityControl, public IAMStreamConfig,
                 public IKsPropertySet, public IMediaSeeking {
    LONG                m_cRef;
    CVCamFilter*        m_pFilter;
    IPin*               m_pConnected;
    AM_MEDIA_TYPE       m_mt;
    CRITICAL_SECTION    m_csPin;

    // Shared memory handles (consumer side)
    HANDLE              m_hMap;
    HANDLE              m_hEvtFrame;
    HANDLE              m_hEvtAlive;
    VCamSharedHeader*   m_pHeader;
    BYTE*               m_pPixels;

    // Streaming
    HANDLE              m_hThread;
    volatile bool       m_bStreaming;
    REFERENCE_TIME      m_rtStart;

    int                 m_width;
    int                 m_height;
    int                 m_fps;

    void FreeMediaType(AM_MEDIA_TYPE* pmt) {
        if (pmt->cbFormat) { CoTaskMemFree(pmt->pbFormat); pmt->pbFormat = NULL; pmt->cbFormat = 0; }
        if (pmt->pUnk) { pmt->pUnk->Release(); pmt->pUnk = NULL; }
    }

    void CopyMediaType(AM_MEDIA_TYPE* dst, const AM_MEDIA_TYPE* src) {
        *dst = *src;
        if (src->cbFormat) {
            dst->pbFormat = (BYTE*)CoTaskMemAlloc(src->cbFormat);
            if (dst->pbFormat) memcpy(dst->pbFormat, src->pbFormat, src->cbFormat);
        }
        if (dst->pUnk) dst->pUnk->AddRef();
    }

    bool OpenSharedMemory() {
        m_hMap = OpenFileMappingW(FILE_MAP_ALL_ACCESS, FALSE, SHM_NAME);
        if (!m_hMap) return false;

        // Map just header first to get size
        VCamSharedHeader* hdr = (VCamSharedHeader*)MapViewOfFile(m_hMap, FILE_MAP_ALL_ACCESS, 0, 0, sizeof(VCamSharedHeader));
        if (!hdr) { CloseHandle(m_hMap); m_hMap = NULL; return false; }

        int w = hdr->width;
        int h = hdr->height;
        int fps = hdr->fps;
        UnmapViewOfFile(hdr);

        if (w <= 0 || h <= 0 || fps <= 0) {
            CloseHandle(m_hMap); m_hMap = NULL; return false;
        }

        size_t totalSize = sizeof(VCamSharedHeader) + (size_t)w * h * 4;
        BYTE* buf = (BYTE*)MapViewOfFile(m_hMap, FILE_MAP_ALL_ACCESS, 0, 0, totalSize);
        if (!buf) { CloseHandle(m_hMap); m_hMap = NULL; return false; }

        m_pHeader = (VCamSharedHeader*)buf;
        m_pPixels = buf + sizeof(VCamSharedHeader);
        m_width   = w;
        m_height  = h;
        m_fps     = fps;

        m_hEvtFrame = OpenEventW(EVENT_ALL_ACCESS, FALSE, EVT_FRAME);
        m_hEvtAlive = OpenEventW(EVENT_ALL_ACCESS, FALSE, EVT_ALIVE);

        // Signal that consumer is alive
        if (m_pHeader) m_pHeader->consumer_alive = 1;

        return true;
    }

    void CloseSharedMemory() {
        if (m_pHeader) { m_pHeader->consumer_alive = 0; }
        if (m_pHeader) { UnmapViewOfFile(m_pHeader); m_pHeader = NULL; m_pPixels = NULL; }
        if (m_hMap) { CloseHandle(m_hMap); m_hMap = NULL; }
        if (m_hEvtFrame) { CloseHandle(m_hEvtFrame); m_hEvtFrame = NULL; }
        if (m_hEvtAlive) { CloseHandle(m_hEvtAlive); m_hEvtAlive = NULL; }
    }

    void FillBitmapInfo(BITMAPINFOHEADER* bih, int w, int h) {
        ZeroMemory(bih, sizeof(*bih));
        bih->biSize        = sizeof(BITMAPINFOHEADER);
        bih->biWidth       = w;
        bih->biHeight      = h;   // bottom-up for DirectShow
        bih->biPlanes      = 1;
        bih->biBitCount    = 32;
        bih->biCompression = BI_RGB;
        bih->biSizeImage   = w * h * 4;
    }

    void GetDefaultMediaType(AM_MEDIA_TYPE* pmt) {
        ZeroMemory(pmt, sizeof(*pmt));
        pmt->majortype            = MEDIATYPE_Video;
        pmt->subtype              = MEDIASUBTYPE_RGB32;
        pmt->bFixedSizeSamples    = TRUE;
        pmt->bTemporalCompression = FALSE;
        pmt->lSampleSize          = m_width * m_height * 4;
        pmt->formattype           = FORMAT_VideoInfo;
        pmt->cbFormat             = sizeof(VIDEOINFOHEADER);
        pmt->pbFormat             = (BYTE*)CoTaskMemAlloc(sizeof(VIDEOINFOHEADER));

        VIDEOINFOHEADER* vih = (VIDEOINFOHEADER*)pmt->pbFormat;
        ZeroMemory(vih, sizeof(*vih));
        vih->AvgTimePerFrame = 10000000LL / m_fps;
        vih->dwBitRate       = m_width * m_height * 32 * m_fps;
        FillBitmapInfo(&vih->bmiHeader, m_width, m_height);
    }

    static DWORD WINAPI StreamThread(LPVOID pv) {
        CVCamPin* pin = (CVCamPin*)pv;
        pin->DoStream();
        return 0;
    }

    void DoStream();

public:
    CVCamPin(CVCamFilter* pFilter);
    ~CVCamPin();

    // IUnknown
    STDMETHODIMP QueryInterface(REFIID riid, void** ppv) override;
    STDMETHODIMP_(ULONG) AddRef() override { return InterlockedIncrement(&m_cRef); }
    STDMETHODIMP_(ULONG) Release() override {
        LONG c = InterlockedDecrement(&m_cRef);
        if (c == 0) delete this;
        return c;
    }

    // IPin
    STDMETHODIMP Connect(IPin* pReceivePin, const AM_MEDIA_TYPE* pmt) override;
    STDMETHODIMP ReceiveConnection(IPin*, const AM_MEDIA_TYPE*) override { return E_UNEXPECTED; }
    STDMETHODIMP Disconnect() override;
    STDMETHODIMP ConnectedTo(IPin** ppPin) override;
    STDMETHODIMP ConnectionMediaType(AM_MEDIA_TYPE* pmt) override;
    STDMETHODIMP QueryPinInfo(PIN_INFO* pInfo) override;
    STDMETHODIMP QueryDirection(PIN_DIRECTION* pDir) override { if (!pDir) return E_POINTER; *pDir = PINDIR_OUTPUT; return S_OK; }
    STDMETHODIMP QueryId(LPWSTR* Id) override;
    STDMETHODIMP QueryAccept(const AM_MEDIA_TYPE* pmt) override;
    STDMETHODIMP EnumMediaTypes(IEnumMediaTypes** ppEnum) override;
    STDMETHODIMP QueryInternalConnections(IPin**, ULONG*) override { return E_NOTIMPL; }
    STDMETHODIMP EndOfStream() override { return S_OK; }
    STDMETHODIMP BeginFlush() override { return S_OK; }
    STDMETHODIMP EndFlush() override { return S_OK; }
    STDMETHODIMP NewSegment(REFERENCE_TIME, REFERENCE_TIME, double) override { return S_OK; }

    // IQualityControl
    STDMETHODIMP Notify(IBaseFilter*, Quality) override { return S_OK; }
    STDMETHODIMP SetSink(IQualityControl*) override { return S_OK; }

    // IAMStreamConfig
    STDMETHODIMP SetFormat(AM_MEDIA_TYPE* pmt) override;
    STDMETHODIMP GetFormat(AM_MEDIA_TYPE** ppmt) override;
    STDMETHODIMP GetNumberOfCapabilities(int* piCount, int* piSize) override;
    STDMETHODIMP GetStreamCaps(int iIndex, AM_MEDIA_TYPE** ppmt, BYTE* pSCC) override;

    // IKsPropertySet
    STDMETHODIMP Set(REFGUID guidPropSet, DWORD dwPropID, LPVOID pInstanceData, DWORD cbInstanceData, LPVOID pPropData, DWORD cbPropData) override { return E_NOTIMPL; }
    STDMETHODIMP Get(REFGUID guidPropSet, DWORD dwPropID, LPVOID pInstanceData, DWORD cbInstanceData, LPVOID pPropData, DWORD cbPropData, DWORD* pcbReturned) override;
    STDMETHODIMP QuerySupported(REFGUID guidPropSet, DWORD dwPropID, DWORD* pTypeSupport) override;

    // IMediaSeeking (stub -- required by some apps)
    STDMETHODIMP GetCapabilities(DWORD* p) override { if (p) *p = 0; return S_OK; }
    STDMETHODIMP CheckCapabilities(DWORD*) override { return E_NOTIMPL; }
    STDMETHODIMP IsFormatSupported(const GUID* p) override { return (p && *p == TIME_FORMAT_MEDIA_TIME) ? S_OK : S_FALSE; }
    STDMETHODIMP QueryPreferredFormat(GUID* p) override { if (p) *p = TIME_FORMAT_MEDIA_TIME; return S_OK; }
    STDMETHODIMP GetTimeFormat(GUID* p) override { if (p) *p = TIME_FORMAT_MEDIA_TIME; return S_OK; }
    STDMETHODIMP IsUsingTimeFormat(const GUID* p) override { return (p && *p == TIME_FORMAT_MEDIA_TIME) ? S_OK : S_FALSE; }
    STDMETHODIMP SetTimeFormat(const GUID*) override { return E_NOTIMPL; }
    STDMETHODIMP GetDuration(LONGLONG* p) override { if (p) *p = 0; return S_OK; }
    STDMETHODIMP GetStopPosition(LONGLONG* p) override { if (p) *p = 0; return S_OK; }
    STDMETHODIMP GetCurrentPosition(LONGLONG* p) override { if (p) *p = 0; return S_OK; }
    STDMETHODIMP ConvertTimeFormat(LONGLONG*, const GUID*, LONGLONG, const GUID*) override { return E_NOTIMPL; }
    STDMETHODIMP SetPositions(LONGLONG*, DWORD, LONGLONG*, DWORD) override { return E_NOTIMPL; }
    STDMETHODIMP GetPositions(LONGLONG* pCur, LONGLONG* pStop) override { if (pCur) *pCur = 0; if (pStop) *pStop = 0; return S_OK; }
    STDMETHODIMP GetAvailable(LONGLONG* pEarly, LONGLONG* pLate) override { if (pEarly) *pEarly = 0; if (pLate) *pLate = 0; return S_OK; }
    STDMETHODIMP SetRate(double) override { return E_NOTIMPL; }
    STDMETHODIMP GetRate(double* p) override { if (p) *p = 1.0; return S_OK; }
    STDMETHODIMP GetPreroll(LONGLONG* p) override { if (p) *p = 0; return S_OK; }

    // Streaming control
    HRESULT StartStreaming();
    HRESULT StopStreaming();
};

// ============================================================
//  CVCamFilter -- the filter
// ============================================================
class CVCamFilter : public IBaseFilter, public IAMFilterMiscFlags, public ISpecifyPropertyPages {
    LONG                m_cRef;
    FILTER_STATE        m_State;
    IFilterGraph*       m_pGraph;
    IReferenceClock*    m_pClock;
    CVCamPin*           m_pPin;
    CRITICAL_SECTION    m_csFilter;
    wchar_t             m_wszName[128];

public:
    CVCamFilter();
    ~CVCamFilter();

    CRITICAL_SECTION* GetFilterLock() { return &m_csFilter; }
    FILTER_STATE GetState() const { return m_State; }
    IFilterGraph* GetGraph() const { return m_pGraph; }
    IReferenceClock* GetClock() const { return m_pClock; }

    // IUnknown
    STDMETHODIMP QueryInterface(REFIID riid, void** ppv) override;
    STDMETHODIMP_(ULONG) AddRef() override { return InterlockedIncrement(&m_cRef); }
    STDMETHODIMP_(ULONG) Release() override {
        LONG c = InterlockedDecrement(&m_cRef);
        if (c == 0) delete this;
        return c;
    }

    // IPersist
    STDMETHODIMP GetClassID(CLSID* pClsID) override { if (!pClsID) return E_POINTER; *pClsID = CLSID_IronHSPVCam; return S_OK; }

    // IMediaFilter
    STDMETHODIMP Stop() override;
    STDMETHODIMP Pause() override;
    STDMETHODIMP Run(REFERENCE_TIME tStart) override;
    STDMETHODIMP GetState(DWORD dwMSTimeout, FILTER_STATE* pState) override { if (!pState) return E_POINTER; *pState = m_State; return S_OK; }
    STDMETHODIMP SetSyncSource(IReferenceClock* pClock) override;
    STDMETHODIMP GetSyncSource(IReferenceClock** ppClock) override;

    // IBaseFilter
    STDMETHODIMP EnumPins(IEnumPins** ppEnum) override;
    STDMETHODIMP FindPin(LPCWSTR Id, IPin** ppPin) override;
    STDMETHODIMP QueryFilterInfo(FILTER_INFO* pInfo) override;
    STDMETHODIMP JoinFilterGraph(IFilterGraph* pGraph, LPCWSTR pName) override;
    STDMETHODIMP QueryVendorInfo(LPWSTR*) override { return E_NOTIMPL; }

    // IAMFilterMiscFlags
    STDMETHODIMP_(ULONG) GetMiscFlags() override { return AM_FILTER_MISC_FLAGS_IS_SOURCE; }

    // ISpecifyPropertyPages
    STDMETHODIMP GetPages(CAUUID* pPages) override { if (!pPages) return E_POINTER; pPages->cElems = 0; pPages->pElems = NULL; return S_OK; }
};

// ============================================================
//  IEnumPins
// ============================================================
class CEnumPins : public IEnumPins {
    LONG m_cRef;
    CVCamFilter* m_pFilter;
    int m_pos;
public:
    CEnumPins(CVCamFilter* pf, int pos = 0) : m_cRef(1), m_pFilter(pf), m_pos(pos) { m_pFilter->AddRef(); InterlockedIncrement(&g_cDllRef); }
    ~CEnumPins() { m_pFilter->Release(); InterlockedDecrement(&g_cDllRef); }

    STDMETHODIMP QueryInterface(REFIID riid, void** ppv) override {
        if (riid == IID_IUnknown || riid == IID_IEnumPins) { *ppv = this; AddRef(); return S_OK; }
        *ppv = NULL; return E_NOINTERFACE;
    }
    STDMETHODIMP_(ULONG) AddRef() override { return InterlockedIncrement(&m_cRef); }
    STDMETHODIMP_(ULONG) Release() override { LONG c = InterlockedDecrement(&m_cRef); if (!c) delete this; return c; }

    STDMETHODIMP Next(ULONG cPins, IPin** ppPins, ULONG* pcFetched) override;
    STDMETHODIMP Skip(ULONG c) override { m_pos += (int)c; return (m_pos <= 1) ? S_OK : S_FALSE; }
    STDMETHODIMP Reset() override { m_pos = 0; return S_OK; }
    STDMETHODIMP Clone(IEnumPins** ppEnum) override { *ppEnum = new CEnumPins(m_pFilter, m_pos); return S_OK; }
};

// ============================================================
//  IEnumMediaTypes
// ============================================================
class CEnumMediaTypes : public IEnumMediaTypes {
    LONG m_cRef;
    CVCamPin* m_pPin;
    int m_pos;
public:
    CEnumMediaTypes(CVCamPin* pp, int pos = 0) : m_cRef(1), m_pPin(pp), m_pos(pos) { m_pPin->AddRef(); InterlockedIncrement(&g_cDllRef); }
    ~CEnumMediaTypes() { m_pPin->Release(); InterlockedDecrement(&g_cDllRef); }

    STDMETHODIMP QueryInterface(REFIID riid, void** ppv) override {
        if (riid == IID_IUnknown || riid == IID_IEnumMediaTypes) { *ppv = this; AddRef(); return S_OK; }
        *ppv = NULL; return E_NOINTERFACE;
    }
    STDMETHODIMP_(ULONG) AddRef() override { return InterlockedIncrement(&m_cRef); }
    STDMETHODIMP_(ULONG) Release() override { LONG c = InterlockedDecrement(&m_cRef); if (!c) delete this; return c; }

    STDMETHODIMP Next(ULONG cTypes, AM_MEDIA_TYPE** ppTypes, ULONG* pcFetched) override;
    STDMETHODIMP Skip(ULONG c) override { m_pos += (int)c; return (m_pos <= 1) ? S_OK : S_FALSE; }
    STDMETHODIMP Reset() override { m_pos = 0; return S_OK; }
    STDMETHODIMP Clone(IEnumMediaTypes** pp) override { *pp = new CEnumMediaTypes(m_pPin, m_pos); return S_OK; }
};

// ============================================================
//  Class Factory
// ============================================================
class CClassFactory : public IClassFactory {
    LONG m_cRef;
public:
    CClassFactory() : m_cRef(1) { InterlockedIncrement(&g_cDllRef); }
    ~CClassFactory() { InterlockedDecrement(&g_cDllRef); }

    STDMETHODIMP QueryInterface(REFIID riid, void** ppv) override {
        if (riid == IID_IUnknown || riid == IID_IClassFactory) { *ppv = this; AddRef(); return S_OK; }
        *ppv = NULL; return E_NOINTERFACE;
    }
    STDMETHODIMP_(ULONG) AddRef() override { return InterlockedIncrement(&m_cRef); }
    STDMETHODIMP_(ULONG) Release() override { LONG c = InterlockedDecrement(&m_cRef); if (!c) delete this; return c; }

    STDMETHODIMP CreateInstance(IUnknown* pOuter, REFIID riid, void** ppv) override {
        if (pOuter) return CLASS_E_NOAGGREGATION;
        CVCamFilter* pFilter = new CVCamFilter();
        HRESULT hr = pFilter->QueryInterface(riid, ppv);
        pFilter->Release();
        return hr;
    }
    STDMETHODIMP LockServer(BOOL fLock) override {
        if (fLock) InterlockedIncrement(&g_cDllRef);
        else InterlockedDecrement(&g_cDllRef);
        return S_OK;
    }
};

// ============================================================
//  CVCamFilter implementation
// ============================================================
CVCamFilter::CVCamFilter() : m_cRef(1), m_State(State_Stopped), m_pGraph(NULL), m_pClock(NULL), m_pPin(NULL) {
    InitializeCriticalSection(&m_csFilter);
    m_wszName[0] = 0;
    m_pPin = new CVCamPin(this);
    InterlockedIncrement(&g_cDllRef);
}

CVCamFilter::~CVCamFilter() {
    if (m_pPin) m_pPin->Release();
    if (m_pClock) m_pClock->Release();
    DeleteCriticalSection(&m_csFilter);
    InterlockedDecrement(&g_cDllRef);
}

STDMETHODIMP CVCamFilter::QueryInterface(REFIID riid, void** ppv) {
    if (!ppv) return E_POINTER;
    if (riid == IID_IUnknown)              { *ppv = static_cast<IBaseFilter*>(this); AddRef(); return S_OK; }
    if (riid == IID_IPersist)              { *ppv = static_cast<IBaseFilter*>(this); AddRef(); return S_OK; }
    if (riid == IID_IMediaFilter)          { *ppv = static_cast<IBaseFilter*>(this); AddRef(); return S_OK; }
    if (riid == IID_IBaseFilter)           { *ppv = static_cast<IBaseFilter*>(this); AddRef(); return S_OK; }
    if (riid == IID_IAMFilterMiscFlags)    { *ppv = static_cast<IAMFilterMiscFlags*>(this); AddRef(); return S_OK; }
    if (riid == IID_ISpecifyPropertyPages) { *ppv = static_cast<ISpecifyPropertyPages*>(this); AddRef(); return S_OK; }
    *ppv = NULL;
    return E_NOINTERFACE;
}

STDMETHODIMP CVCamFilter::Stop() {
    CAutoLock lock(&m_csFilter);
    m_pPin->StopStreaming();
    m_State = State_Stopped;
    return S_OK;
}

STDMETHODIMP CVCamFilter::Pause() {
    CAutoLock lock(&m_csFilter);
    if (m_State == State_Stopped) {
        m_pPin->StartStreaming();
    }
    m_State = State_Paused;
    return S_OK;
}

STDMETHODIMP CVCamFilter::Run(REFERENCE_TIME tStart) {
    CAutoLock lock(&m_csFilter);
    if (m_State == State_Stopped) {
        m_pPin->StartStreaming();
    }
    m_State = State_Running;
    return S_OK;
}

STDMETHODIMP CVCamFilter::SetSyncSource(IReferenceClock* pClock) {
    CAutoLock lock(&m_csFilter);
    if (m_pClock) m_pClock->Release();
    m_pClock = pClock;
    if (m_pClock) m_pClock->AddRef();
    return S_OK;
}

STDMETHODIMP CVCamFilter::GetSyncSource(IReferenceClock** ppClock) {
    if (!ppClock) return E_POINTER;
    CAutoLock lock(&m_csFilter);
    *ppClock = m_pClock;
    if (m_pClock) m_pClock->AddRef();
    return S_OK;
}

STDMETHODIMP CVCamFilter::EnumPins(IEnumPins** ppEnum) {
    if (!ppEnum) return E_POINTER;
    *ppEnum = new CEnumPins(this);
    return S_OK;
}

STDMETHODIMP CVCamFilter::FindPin(LPCWSTR Id, IPin** ppPin) {
    if (!ppPin) return E_POINTER;
    if (wcscmp(Id, L"Output") == 0) {
        *ppPin = m_pPin;
        m_pPin->AddRef();
        return S_OK;
    }
    *ppPin = NULL;
    return VFW_E_NOT_FOUND;
}

STDMETHODIMP CVCamFilter::QueryFilterInfo(FILTER_INFO* pInfo) {
    if (!pInfo) return E_POINTER;
    wcscpy_s(pInfo->achName, FILTER_NAME);
    pInfo->pGraph = m_pGraph;
    if (m_pGraph) m_pGraph->AddRef();
    return S_OK;
}

STDMETHODIMP CVCamFilter::JoinFilterGraph(IFilterGraph* pGraph, LPCWSTR pName) {
    CAutoLock lock(&m_csFilter);
    m_pGraph = pGraph;  // weak ref, no AddRef
    if (pName) wcscpy_s(m_wszName, pName);
    else m_wszName[0] = 0;
    return S_OK;
}

// ============================================================
//  CEnumPins implementation
// ============================================================
STDMETHODIMP CEnumPins::Next(ULONG cPins, IPin** ppPins, ULONG* pcFetched) {
    if (!ppPins) return E_POINTER;
    ULONG fetched = 0;
    while (fetched < cPins && m_pos < 1) {
        IPin* pPin = NULL;
        m_pFilter->FindPin(L"Output", &pPin);
        ppPins[fetched++] = pPin;
        m_pos++;
    }
    if (pcFetched) *pcFetched = fetched;
    return (fetched == cPins) ? S_OK : S_FALSE;
}

// ============================================================
//  CEnumMediaTypes implementation
// ============================================================
STDMETHODIMP CEnumMediaTypes::Next(ULONG cTypes, AM_MEDIA_TYPE** ppTypes, ULONG* pcFetched) {
    if (!ppTypes) return E_POINTER;
    ULONG fetched = 0;
    while (fetched < cTypes && m_pos < 1) {
        AM_MEDIA_TYPE* pmt = (AM_MEDIA_TYPE*)CoTaskMemAlloc(sizeof(AM_MEDIA_TYPE));
        if (!pmt) return E_OUTOFMEMORY;
        m_pPin->GetFormat(&pmt);
        // GetFormat allocates, but we need it in CoTaskMem-allocated pmt
        // Actually GetFormat returns allocated pmt, so free our stub and use theirs
        CoTaskMemFree(pmt);
        m_pPin->GetFormat(&ppTypes[fetched]);
        fetched++;
        m_pos++;
    }
    if (pcFetched) *pcFetched = fetched;
    return (fetched == cTypes) ? S_OK : S_FALSE;
}

// ============================================================
//  CVCamPin implementation
// ============================================================
CVCamPin::CVCamPin(CVCamFilter* pFilter) : m_cRef(1), m_pFilter(pFilter), m_pConnected(NULL),
    m_hMap(NULL), m_hEvtFrame(NULL), m_hEvtAlive(NULL), m_pHeader(NULL), m_pPixels(NULL),
    m_hThread(NULL), m_bStreaming(false), m_rtStart(0),
    m_width(DEFAULT_W), m_height(DEFAULT_H), m_fps(DEFAULT_FPS)
{
    InitializeCriticalSection(&m_csPin);
    ZeroMemory(&m_mt, sizeof(m_mt));

    // Try to open shared memory to get actual resolution
    if (OpenSharedMemory()) {
        // Got it -- use producer's resolution
        CloseSharedMemory(); // We'll reopen during streaming
    }

    InterlockedIncrement(&g_cDllRef);
}

CVCamPin::~CVCamPin() {
    StopStreaming();
    CloseSharedMemory();
    FreeMediaType(&m_mt);
    DeleteCriticalSection(&m_csPin);
    InterlockedDecrement(&g_cDllRef);
}

STDMETHODIMP CVCamPin::QueryInterface(REFIID riid, void** ppv) {
    if (!ppv) return E_POINTER;
    if (riid == IID_IUnknown)           { *ppv = static_cast<IPin*>(this); AddRef(); return S_OK; }
    if (riid == IID_IPin)               { *ppv = static_cast<IPin*>(this); AddRef(); return S_OK; }
    if (riid == IID_IQualityControl)    { *ppv = static_cast<IQualityControl*>(this); AddRef(); return S_OK; }
    if (riid == IID_IAMStreamConfig)    { *ppv = static_cast<IAMStreamConfig*>(this); AddRef(); return S_OK; }
    if (riid == IID_IKsPropertySet)     { *ppv = static_cast<IKsPropertySet*>(this); AddRef(); return S_OK; }
    if (riid == IID_IMediaSeeking)      { *ppv = static_cast<IMediaSeeking*>(this); AddRef(); return S_OK; }
    *ppv = NULL;
    return E_NOINTERFACE;
}

STDMETHODIMP CVCamPin::Connect(IPin* pReceivePin, const AM_MEDIA_TYPE* pmt) {
    if (!pReceivePin) return E_POINTER;

    CAutoLock lock(&m_csPin);
    if (m_pConnected) return VFW_E_ALREADY_CONNECTED;

    // Try to open shared memory again to get latest resolution
    if (OpenSharedMemory()) {
        CloseSharedMemory();
    }

    AM_MEDIA_TYPE mt;
    if (pmt && pmt->majortype != GUID_NULL) {
        CopyMediaType(&mt, pmt);
    } else {
        GetDefaultMediaType(&mt);
    }

    HRESULT hr = pReceivePin->ReceiveConnection(this, &mt);
    if (SUCCEEDED(hr)) {
        FreeMediaType(&m_mt);
        CopyMediaType(&m_mt, &mt);
        m_pConnected = pReceivePin;
        m_pConnected->AddRef();
    }
    FreeMediaType(&mt);
    return hr;
}

STDMETHODIMP CVCamPin::Disconnect() {
    CAutoLock lock(&m_csPin);
    if (!m_pConnected) return S_FALSE;
    StopStreaming();
    m_pConnected->Release();
    m_pConnected = NULL;
    FreeMediaType(&m_mt);
    ZeroMemory(&m_mt, sizeof(m_mt));
    return S_OK;
}

STDMETHODIMP CVCamPin::ConnectedTo(IPin** ppPin) {
    if (!ppPin) return E_POINTER;
    CAutoLock lock(&m_csPin);
    if (!m_pConnected) { *ppPin = NULL; return VFW_E_NOT_CONNECTED; }
    *ppPin = m_pConnected;
    m_pConnected->AddRef();
    return S_OK;
}

STDMETHODIMP CVCamPin::ConnectionMediaType(AM_MEDIA_TYPE* pmt) {
    if (!pmt) return E_POINTER;
    CAutoLock lock(&m_csPin);
    if (!m_pConnected) return VFW_E_NOT_CONNECTED;
    CopyMediaType(pmt, &m_mt);
    return S_OK;
}

STDMETHODIMP CVCamPin::QueryPinInfo(PIN_INFO* pInfo) {
    if (!pInfo) return E_POINTER;
    pInfo->pFilter = m_pFilter;
    m_pFilter->AddRef();
    pInfo->dir = PINDIR_OUTPUT;
    wcscpy_s(pInfo->achName, L"Output");
    return S_OK;
}

STDMETHODIMP CVCamPin::QueryId(LPWSTR* Id) {
    if (!Id) return E_POINTER;
    *Id = (LPWSTR)CoTaskMemAlloc(sizeof(L"Output"));
    if (!*Id) return E_OUTOFMEMORY;
    wcscpy(*Id, L"Output");
    return S_OK;
}

STDMETHODIMP CVCamPin::QueryAccept(const AM_MEDIA_TYPE* pmt) {
    if (!pmt) return E_POINTER;
    if (pmt->majortype != MEDIATYPE_Video) return S_FALSE;
    if (pmt->subtype != MEDIASUBTYPE_RGB32) return S_FALSE;
    if (pmt->formattype != FORMAT_VideoInfo) return S_FALSE;
    return S_OK;
}

STDMETHODIMP CVCamPin::EnumMediaTypes(IEnumMediaTypes** ppEnum) {
    if (!ppEnum) return E_POINTER;
    *ppEnum = new CEnumMediaTypes(this);
    return S_OK;
}

// IAMStreamConfig
STDMETHODIMP CVCamPin::SetFormat(AM_MEDIA_TYPE* pmt) {
    if (!pmt) return E_POINTER;
    if (pmt->majortype != MEDIATYPE_Video) return VFW_E_INVALIDMEDIATYPE;
    if (pmt->formattype == FORMAT_VideoInfo && pmt->cbFormat >= sizeof(VIDEOINFOHEADER)) {
        VIDEOINFOHEADER* vih = (VIDEOINFOHEADER*)pmt->pbFormat;
        m_width  = vih->bmiHeader.biWidth;
        m_height = abs(vih->bmiHeader.biHeight);
        if (vih->AvgTimePerFrame > 0) {
            m_fps = (int)(10000000LL / vih->AvgTimePerFrame);
        }
    }
    return S_OK;
}

STDMETHODIMP CVCamPin::GetFormat(AM_MEDIA_TYPE** ppmt) {
    if (!ppmt) return E_POINTER;
    *ppmt = (AM_MEDIA_TYPE*)CoTaskMemAlloc(sizeof(AM_MEDIA_TYPE));
    if (!*ppmt) return E_OUTOFMEMORY;
    GetDefaultMediaType(*ppmt);
    return S_OK;
}

STDMETHODIMP CVCamPin::GetNumberOfCapabilities(int* piCount, int* piSize) {
    if (!piCount || !piSize) return E_POINTER;
    *piCount = 1;
    *piSize  = sizeof(VIDEO_STREAM_CONFIG_CAPS);
    return S_OK;
}

STDMETHODIMP CVCamPin::GetStreamCaps(int iIndex, AM_MEDIA_TYPE** ppmt, BYTE* pSCC) {
    if (iIndex != 0) return S_FALSE;
    if (!ppmt || !pSCC) return E_POINTER;

    *ppmt = (AM_MEDIA_TYPE*)CoTaskMemAlloc(sizeof(AM_MEDIA_TYPE));
    if (!*ppmt) return E_OUTOFMEMORY;
    GetDefaultMediaType(*ppmt);

    VIDEO_STREAM_CONFIG_CAPS* caps = (VIDEO_STREAM_CONFIG_CAPS*)pSCC;
    ZeroMemory(caps, sizeof(*caps));
    caps->guid               = FORMAT_VideoInfo;
    caps->VideoStandard      = 0;
    caps->InputSize.cx       = m_width;
    caps->InputSize.cy       = m_height;
    caps->MinCroppingSize.cx = m_width;
    caps->MinCroppingSize.cy = m_height;
    caps->MaxCroppingSize.cx = m_width;
    caps->MaxCroppingSize.cy = m_height;
    caps->CropGranularityX   = 1;
    caps->CropGranularityY   = 1;
    caps->CropAlignX         = 1;
    caps->CropAlignY         = 1;
    caps->MinOutputSize.cx   = m_width;
    caps->MinOutputSize.cy   = m_height;
    caps->MaxOutputSize.cx   = m_width;
    caps->MaxOutputSize.cy   = m_height;
    caps->OutputGranularityX = 1;
    caps->OutputGranularityY = 1;
    caps->StretchTapsX       = 0;
    caps->StretchTapsY       = 0;
    caps->ShrinkTapsX        = 0;
    caps->ShrinkTapsY        = 0;
    caps->MinFrameInterval   = 10000000LL / m_fps;
    caps->MaxFrameInterval   = 10000000LL / m_fps;
    caps->MinBitsPerSecond   = m_width * m_height * 32;
    caps->MaxBitsPerSecond   = m_width * m_height * 32 * m_fps;

    return S_OK;
}

// IKsPropertySet
STDMETHODIMP CVCamPin::Get(REFGUID guidPropSet, DWORD dwPropID, LPVOID pInstanceData, DWORD cbInstanceData,
                            LPVOID pPropData, DWORD cbPropData, DWORD* pcbReturned) {
    if (guidPropSet != AMPROPSETID_Pin) return E_PROP_SET_UNSUPPORTED;
    if (dwPropID != AMPROPERTY_PIN_CATEGORY) return E_PROP_ID_UNSUPPORTED;
    if (cbPropData < sizeof(GUID)) return E_UNEXPECTED;
    *(GUID*)pPropData = PIN_CATEGORY_CAPTURE;
    if (pcbReturned) *pcbReturned = sizeof(GUID);
    return S_OK;
}

STDMETHODIMP CVCamPin::QuerySupported(REFGUID guidPropSet, DWORD dwPropID, DWORD* pTypeSupport) {
    if (guidPropSet != AMPROPSETID_Pin) return E_PROP_SET_UNSUPPORTED;
    if (dwPropID != AMPROPERTY_PIN_CATEGORY) return E_PROP_ID_UNSUPPORTED;
    if (pTypeSupport) *pTypeSupport = KSPROPERTY_SUPPORT_GET;
    return S_OK;
}

// Streaming
HRESULT CVCamPin::StartStreaming() {
    CAutoLock lock(&m_csPin);
    if (m_bStreaming) return S_OK;

    if (!OpenSharedMemory()) {
        // No producer yet -- we'll generate blank frames
    }

    m_bStreaming = true;
    m_hThread = CreateThread(NULL, 0, StreamThread, this, 0, NULL);
    return S_OK;
}

HRESULT CVCamPin::StopStreaming() {
    {
        CAutoLock lock(&m_csPin);
        if (!m_bStreaming) return S_OK;
        m_bStreaming = false;
    }

    if (m_hThread) {
        // Signal the frame event to unblock the thread
        if (m_hEvtFrame) SetEvent(m_hEvtFrame);
        WaitForSingleObject(m_hThread, 5000);
        CloseHandle(m_hThread);
        m_hThread = NULL;
    }

    CloseSharedMemory();
    return S_OK;
}

void CVCamPin::DoStream() {
    IMemInputPin* pMemInput = NULL;
    if (m_pConnected) {
        m_pConnected->QueryInterface(IID_IMemInputPin, (void**)&pMemInput);
    }
    if (!pMemInput) { m_bStreaming = false; return; }

    // Get allocator
    IMemAllocator* pAlloc = NULL;
    pMemInput->GetAllocator(&pAlloc);
    if (!pAlloc) {
        // Try to provide one
        CoCreateInstance(CLSID_MemoryAllocator, NULL, CLSCTX_INPROC_SERVER,
                        IID_IMemAllocator, (void**)&pAlloc);
        if (pAlloc) {
            ALLOCATOR_PROPERTIES props = {};
            props.cBuffers = 1;
            props.cbBuffer = m_width * m_height * 4;
            props.cbAlign  = 1;
            ALLOCATOR_PROPERTIES actual;
            pAlloc->SetProperties(&props, &actual);
            pMemInput->NotifyAllocator(pAlloc, FALSE);
        }
    }

    if (!pAlloc) {
        pMemInput->Release();
        m_bStreaming = false;
        return;
    }

    {
        ALLOCATOR_PROPERTIES props = {};
        props.cBuffers = 1;
        props.cbBuffer = m_width * m_height * 4;
        props.cbAlign  = 1;
        ALLOCATOR_PROPERTIES actual;
        pAlloc->SetProperties(&props, &actual);
    }

    pAlloc->Commit();

    REFERENCE_TIME frameDuration = 10000000LL / m_fps;
    REFERENCE_TIME rtNow = 0;
    int lastFrameCounter = -1;

    while (m_bStreaming) {
        // Wait for new frame or timeout (render blank if no producer)
        DWORD waitMs = 1000 / m_fps;
        if (m_hEvtFrame) {
            WaitForSingleObject(m_hEvtFrame, waitMs);
        } else {
            Sleep(waitMs);
            // Try to reconnect to shared memory
            OpenSharedMemory();
        }

        if (!m_bStreaming) break;

        IMediaSample* pSample = NULL;
        HRESULT hr = pAlloc->GetBuffer(&pSample, NULL, NULL, 0);
        if (FAILED(hr) || !pSample) { Sleep(1); continue; }

        BYTE* pBuf = NULL;
        pSample->GetPointer(&pBuf);
        long cbBuf = pSample->GetSize();
        long needed = m_width * m_height * 4;

        if (pBuf && cbBuf >= needed) {
            bool gotFrame = false;
            if (m_pHeader && m_pPixels && m_pHeader->producer_active) {
                // Copy from shared memory -- flip vertically for DirectShow (bottom-up)
                int stride = m_width * 4;
                for (int y = 0; y < m_height; y++) {
                    memcpy(pBuf + y * stride,
                           m_pPixels + (m_height - 1 - y) * stride,
                           stride);
                }
                lastFrameCounter = m_pHeader->frame_counter;
                gotFrame = true;
            }

            if (!gotFrame) {
                // Generate a dark blue "no signal" frame
                DWORD* px = (DWORD*)pBuf;
                int total = m_width * m_height;
                for (int i = 0; i < total; i++) {
                    px[i] = 0xFF402000;  // BGRA: dark blue
                }
            }

            pSample->SetActualDataLength(needed);

            REFERENCE_TIME rtEnd = rtNow + frameDuration;
            pSample->SetTime(&rtNow, &rtEnd);
            pSample->SetSyncPoint(TRUE);
            pSample->SetPreroll(FALSE);
            pSample->SetDiscontinuity(rtNow == 0 ? TRUE : FALSE);

            hr = pMemInput->Receive(pSample);
            rtNow = rtEnd;
        }

        pSample->Release();

        if (FAILED(hr)) break;
    }

    pAlloc->Decommit();
    pAlloc->Release();
    pMemInput->Release();
}

// ============================================================
//  COM DLL exports
// ============================================================
BOOL APIENTRY DllMain(HMODULE hModule, DWORD dwReason, LPVOID lpReserved) {
    switch (dwReason) {
    case DLL_PROCESS_ATTACH:
        g_hModule = hModule;
        DisableThreadLibraryCalls(hModule);
        break;
    }
    return TRUE;
}

extern "C" HRESULT __stdcall DllGetClassObject(REFCLSID rclsid, REFIID riid, void** ppv) {
    if (!ppv) return E_POINTER;
    if (rclsid != CLSID_IronHSPVCam) return CLASS_E_CLASSNOTAVAILABLE;
    CClassFactory* pFactory = new CClassFactory();
    HRESULT hr = pFactory->QueryInterface(riid, ppv);
    pFactory->Release();
    return hr;
}

extern "C" HRESULT __stdcall DllCanUnloadNow() {
    return (g_cDllRef == 0) ? S_OK : S_FALSE;
}

// ============================================================
//  Registration helpers
// ============================================================
static HRESULT SetKeyValue(HKEY hKey, const wchar_t* subkey, const wchar_t* name, const wchar_t* value) {
    HKEY hSub;
    LONG r = RegCreateKeyExW(hKey, subkey, 0, NULL, 0, KEY_WRITE, NULL, &hSub, NULL);
    if (r != ERROR_SUCCESS) return HRESULT_FROM_WIN32(r);
    r = RegSetValueExW(hSub, name, 0, REG_SZ, (const BYTE*)value, (DWORD)(wcslen(value) + 1) * sizeof(wchar_t));
    RegCloseKey(hSub);
    return HRESULT_FROM_WIN32(r);
}

static void DeleteKeyTree(HKEY hParent, const wchar_t* subkey) {
    HKEY hKey;
    if (RegOpenKeyExW(hParent, subkey, 0, KEY_ALL_ACCESS, &hKey) == ERROR_SUCCESS) {
        wchar_t name[256];
        while (RegEnumKeyW(hKey, 0, name, 256) == ERROR_SUCCESS) {
            DeleteKeyTree(hKey, name);
        }
        RegCloseKey(hKey);
    }
    RegDeleteKeyW(hParent, subkey);
}

extern "C" HRESULT __stdcall DllRegisterServer() {
    wchar_t dllPath[MAX_PATH];
    GetModuleFileNameW(g_hModule, dllPath, MAX_PATH);

    // CLSID string
    wchar_t clsidStr[64];
    StringFromGUID2(CLSID_IronHSPVCam, clsidStr, 64);

    // Register CLSID
    wchar_t keyBuf[256];
    _snwprintf_s(keyBuf, 256, L"CLSID\\%s", clsidStr);

    HRESULT hr;
    hr = SetKeyValue(HKEY_CLASSES_ROOT, keyBuf, NULL, FILTER_NAME);
    if (FAILED(hr)) return hr;

    wchar_t subBuf[256];
    _snwprintf_s(subBuf, 256, L"%s\\InprocServer32", keyBuf);
    hr = SetKeyValue(HKEY_CLASSES_ROOT, subBuf, NULL, dllPath);
    if (FAILED(hr)) return hr;
    hr = SetKeyValue(HKEY_CLASSES_ROOT, subBuf, L"ThreadingModel", L"Both");
    if (FAILED(hr)) return hr;

    // Register as Video Capture Source
    // CLSID_VideoInputDeviceCategory = {860BB310-5D01-11d0-BD3B-00A0C911CE86}
    wchar_t catStr[64];
    StringFromGUID2(CLSID_VideoInputDeviceCategory, catStr, 64);

    wchar_t instKey[512];
    _snwprintf_s(instKey, 512, L"CLSID\\%s\\Instance\\%s", catStr, clsidStr);

    hr = SetKeyValue(HKEY_CLASSES_ROOT, instKey, L"FriendlyName", FILTER_NAME);
    if (FAILED(hr)) return hr;
    hr = SetKeyValue(HKEY_CLASSES_ROOT, instKey, L"CLSID", clsidStr);
    if (FAILED(hr)) return hr;

    return S_OK;
}

extern "C" HRESULT __stdcall DllUnregisterServer() {
    wchar_t clsidStr[64];
    StringFromGUID2(CLSID_IronHSPVCam, clsidStr, 64);

    // Remove CLSID
    wchar_t keyBuf[256];
    _snwprintf_s(keyBuf, 256, L"CLSID\\%s", clsidStr);
    DeleteKeyTree(HKEY_CLASSES_ROOT, keyBuf);

    // Remove from Video Input Device Category
    wchar_t catStr[64];
    StringFromGUID2(CLSID_VideoInputDeviceCategory, catStr, 64);

    wchar_t instKey[512];
    _snwprintf_s(instKey, 512, L"CLSID\\%s\\Instance\\%s", catStr, clsidStr);
    DeleteKeyTree(HKEY_CLASSES_ROOT, instKey);

    return S_OK;
}

// ============================================================
//  HSP-facing exports (producer side)
// ============================================================

extern "C" __declspec(dllexport) int __cdecl vcam_create(int width, int height, int fps) {
    if (width <= 0 || height <= 0 || fps <= 0) return -1;

    std::lock_guard<std::mutex> lock(g_prodMutex);
    if (g_prodOpen) return -1;  // already open

    size_t pixelSize = (size_t)width * height * 4;
    size_t totalSize = sizeof(VCamSharedHeader) + pixelSize;

    // Create shared memory
    HANDLE hMap = CreateFileMappingW(
        INVALID_HANDLE_VALUE, NULL, PAGE_READWRITE,
        (DWORD)(totalSize >> 32), (DWORD)(totalSize & 0xFFFFFFFF),
        SHM_NAME
    );
    if (!hMap) return -1;

    BYTE* pBuf = (BYTE*)MapViewOfFile(hMap, FILE_MAP_ALL_ACCESS, 0, 0, totalSize);
    if (!pBuf) { CloseHandle(hMap); return -1; }

    VCamSharedHeader* hdr = (VCamSharedHeader*)pBuf;
    ZeroMemory(hdr, sizeof(VCamSharedHeader));
    hdr->width           = width;
    hdr->height          = height;
    hdr->fps             = fps;
    hdr->frame_counter   = 0;
    hdr->consumer_alive  = 0;
    hdr->producer_active = 1;

    BYTE* pPixels = pBuf + sizeof(VCamSharedHeader);
    ZeroMemory(pPixels, pixelSize);

    // Create events
    HANDLE hEvtFrame = CreateEventW(NULL, FALSE, FALSE, EVT_FRAME);
    if (!hEvtFrame) { UnmapViewOfFile(pBuf); CloseHandle(hMap); return -1; }

    HANDLE hEvtAlive = CreateEventW(NULL, FALSE, FALSE, EVT_ALIVE);
    if (!hEvtAlive) { CloseHandle(hEvtFrame); UnmapViewOfFile(pBuf); CloseHandle(hMap); return -1; }

    g_prodMapFile = hMap;
    g_prodEvent   = hEvtFrame;
    g_prodAlive   = hEvtAlive;
    g_prodHeader  = hdr;
    g_prodPixels  = pPixels;
    g_prodW       = width;
    g_prodH       = height;
    g_prodFps     = fps;
    g_prodPixelSz = pixelSize;
    g_prodOpen    = true;

    return 0;
}

extern "C" __declspec(dllexport) int __cdecl vcam_send_frame(const void* bgra_data, int size) {
    std::lock_guard<std::mutex> lock(g_prodMutex);
    if (!g_prodOpen || !bgra_data || size <= 0) return -1;

    size_t copySize = ((size_t)size < g_prodPixelSz) ? (size_t)size : g_prodPixelSz;
    memcpy(g_prodPixels, bgra_data, copySize);
    g_prodHeader->frame_counter++;
    SetEvent(g_prodEvent);

    return 0;
}

extern "C" __declspec(dllexport) int __cdecl vcam_is_connected() {
    std::lock_guard<std::mutex> lock(g_prodMutex);
    if (!g_prodOpen) return 0;
    return (g_prodHeader->consumer_alive != 0) ? 1 : 0;
}

extern "C" __declspec(dllexport) int __cdecl vcam_close() {
    std::lock_guard<std::mutex> lock(g_prodMutex);
    if (!g_prodOpen) return -1;

    g_prodHeader->producer_active = 0;

    if (g_prodHeader) { UnmapViewOfFile(g_prodHeader); g_prodHeader = NULL; g_prodPixels = NULL; }
    if (g_prodMapFile) { CloseHandle(g_prodMapFile); g_prodMapFile = NULL; }
    if (g_prodEvent) { CloseHandle(g_prodEvent); g_prodEvent = NULL; }
    if (g_prodAlive) { CloseHandle(g_prodAlive); g_prodAlive = NULL; }

    g_prodOpen = false;
    return 0;
}

// ============================================================
//  Legacy / compatibility exports (required by DEF file)
// ============================================================

extern "C" __declspec(dllexport) int __cdecl vcam_send_from_screen(int x, int y, int w, int h) {
    std::lock_guard<std::mutex> lock(g_prodMutex);
    if (!g_prodOpen) return -1;

    int capW = (w > 0) ? w : g_prodW;
    int capH = (h > 0) ? h : g_prodH;

    HDC hScreenDC = GetDC(NULL);
    if (!hScreenDC) return -1;

    HDC hMemDC = CreateCompatibleDC(hScreenDC);
    if (!hMemDC) { ReleaseDC(NULL, hScreenDC); return -1; }

    BITMAPINFO bmi = {};
    bmi.bmiHeader.biSize        = sizeof(BITMAPINFOHEADER);
    bmi.bmiHeader.biWidth       = g_prodW;
    bmi.bmiHeader.biHeight      = -(int)g_prodH;  // top-down
    bmi.bmiHeader.biPlanes      = 1;
    bmi.bmiHeader.biBitCount    = 32;
    bmi.bmiHeader.biCompression = BI_RGB;

    BYTE* pBits = NULL;
    HBITMAP hBmp = CreateDIBSection(hMemDC, &bmi, DIB_RGB_COLORS, (void**)&pBits, NULL, 0);
    if (!hBmp) { DeleteDC(hMemDC); ReleaseDC(NULL, hScreenDC); return -1; }

    HGDIOBJ hOld = SelectObject(hMemDC, hBmp);

    if (capW == g_prodW && capH == g_prodH) {
        BitBlt(hMemDC, 0, 0, g_prodW, g_prodH, hScreenDC, x, y, SRCCOPY);
    } else {
        SetStretchBltMode(hMemDC, HALFTONE);
        StretchBlt(hMemDC, 0, 0, g_prodW, g_prodH, hScreenDC, x, y, capW, capH, SRCCOPY);
    }

    memcpy(g_prodPixels, pBits, g_prodPixelSz);
    g_prodHeader->frame_counter++;
    SetEvent(g_prodEvent);

    SelectObject(hMemDC, hOld);
    DeleteObject(hBmp);
    DeleteDC(hMemDC);
    ReleaseDC(NULL, hScreenDC);

    return 0;
}

extern "C" __declspec(dllexport) int __cdecl vcam_get_info(int* w, int* h, int* fps) {
    std::lock_guard<std::mutex> lock(g_prodMutex);
    if (!g_prodOpen) return -1;
    if (w)   *w   = g_prodW;
    if (h)   *h   = g_prodH;
    if (fps) *fps = g_prodFps;
    return 0;
}

// MF Virtual Camera は hspvcam_mf.cpp で実装 (Win11+)
