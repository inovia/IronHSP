//
//  hspcapture.dll - DXGI Desktop Duplication screen capture for HSP
//
//  Captures the primary monitor screen to a pixel buffer.
//  Uses IDXGIOutputDuplication (Windows 8+).
//
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <d3d11.h>
#include <dxgi1_2.h>
#include <cstring>
#include <cstdio>

#pragma comment(lib, "d3d11.lib")
#pragma comment(lib, "dxgi.lib")

#define EXPORT extern "C" __declspec(dllexport)

static ID3D11Device *g_device = nullptr;
static ID3D11DeviceContext *g_context = nullptr;
static IDXGIOutputDuplication *g_dup = nullptr;
static ID3D11Texture2D *g_staging = nullptr;
static int g_width = 0, g_height = 0;

//------------------------------------------------------------
// capture_init() - Initialize DXGI duplication
//   Returns 0 on success, negative on error.
//------------------------------------------------------------
EXPORT int __cdecl capture_init()
{
    if (g_dup) return 0; // already initialized

    D3D_FEATURE_LEVEL featureLevel;
    HRESULT hr = D3D11CreateDevice(nullptr, D3D_DRIVER_TYPE_HARDWARE, nullptr,
        D3D11_CREATE_DEVICE_BGRA_SUPPORT, nullptr, 0, D3D11_SDK_VERSION,
        &g_device, &featureLevel, &g_context);
    if (FAILED(hr)) return -1;

    IDXGIDevice *dxgiDevice = nullptr;
    g_device->QueryInterface(__uuidof(IDXGIDevice), (void **)&dxgiDevice);
    IDXGIAdapter *adapter = nullptr;
    dxgiDevice->GetAdapter(&adapter);
    IDXGIOutput *output = nullptr;
    adapter->EnumOutputs(0, &output);
    IDXGIOutput1 *output1 = nullptr;
    output->QueryInterface(__uuidof(IDXGIOutput1), (void **)&output1);

    hr = output1->DuplicateOutput(g_device, &g_dup);
    output1->Release();
    output->Release();
    adapter->Release();
    dxgiDevice->Release();

    if (FAILED(hr)) return -2;

    DXGI_OUTDUPL_DESC desc;
    g_dup->GetDesc(&desc);
    g_width = desc.ModeDesc.Width;
    g_height = desc.ModeDesc.Height;

    // Create staging texture for CPU access
    D3D11_TEXTURE2D_DESC texDesc = {};
    texDesc.Width = g_width;
    texDesc.Height = g_height;
    texDesc.MipLevels = 1;
    texDesc.ArraySize = 1;
    texDesc.Format = DXGI_FORMAT_B8G8R8A8_UNORM;
    texDesc.SampleDesc.Count = 1;
    texDesc.Usage = D3D11_USAGE_STAGING;
    texDesc.CPUAccessFlags = D3D11_CPU_ACCESS_READ;
    g_device->CreateTexture2D(&texDesc, nullptr, &g_staging);

    return 0;
}

//------------------------------------------------------------
// capture_get_size(w, h) - Get screen dimensions
//------------------------------------------------------------
EXPORT int __cdecl capture_get_size(int *w, int *h)
{
    *w = g_width;
    *h = g_height;
    return 0;
}

//------------------------------------------------------------
// capture_frame(out_buf, buf_size) - Capture one frame
//   Writes BGRA pixel data to out_buf.
//   Returns 0 on success, -1 on timeout, negative on error.
//------------------------------------------------------------
EXPORT int __cdecl capture_frame(char *out_buf, int buf_size)
{
    if (!g_dup || !g_staging) return -1;

    IDXGIResource *resource = nullptr;
    DXGI_OUTDUPL_FRAME_INFO info;
    HRESULT hr = g_dup->AcquireNextFrame(100, &info, &resource);
    if (hr == DXGI_ERROR_WAIT_TIMEOUT) return -1; // no new frame
    if (FAILED(hr)) return -2;

    ID3D11Texture2D *tex = nullptr;
    resource->QueryInterface(__uuidof(ID3D11Texture2D), (void **)&tex);
    g_context->CopyResource(g_staging, tex);
    tex->Release();
    resource->Release();
    g_dup->ReleaseFrame();

    D3D11_MAPPED_SUBRESOURCE mapped;
    hr = g_context->Map(g_staging, 0, D3D11_MAP_READ, 0, &mapped);
    if (FAILED(hr)) return -3;

    int row_bytes = g_width * 4;
    int needed = g_height * row_bytes;
    if (buf_size < needed) {
        g_context->Unmap(g_staging, 0);
        return -4;
    }

    for (int y = 0; y < g_height; y++) {
        memcpy(out_buf + y * row_bytes, (char *)mapped.pData + y * mapped.RowPitch, row_bytes);
    }
    g_context->Unmap(g_staging, 0);
    return 0;
}

//------------------------------------------------------------
// capture_save_bmp(filename) - Capture and save as BMP
//------------------------------------------------------------
EXPORT int __cdecl capture_save_bmp(const char *filename)
{
    if (!g_dup || !g_staging) return -1;

    IDXGIResource *resource = nullptr;
    DXGI_OUTDUPL_FRAME_INFO info;
    HRESULT hr = g_dup->AcquireNextFrame(500, &info, &resource);
    if (FAILED(hr)) return -2;

    ID3D11Texture2D *tex = nullptr;
    resource->QueryInterface(__uuidof(ID3D11Texture2D), (void **)&tex);
    g_context->CopyResource(g_staging, tex);
    tex->Release();
    resource->Release();
    g_dup->ReleaseFrame();

    D3D11_MAPPED_SUBRESOURCE mapped;
    hr = g_context->Map(g_staging, 0, D3D11_MAP_READ, 0, &mapped);
    if (FAILED(hr)) return -3;

    // Write BMP
    int row_bytes = g_width * 4;
    int img_size = g_height * row_bytes;
    int file_size = 54 + img_size;

    FILE *fp = fopen(filename, "wb");
    if (!fp) { g_context->Unmap(g_staging, 0); return -4; }

    // BMP header
    unsigned char hdr[54] = {};
    hdr[0] = 'B'; hdr[1] = 'M';
    *(int *)(hdr + 2) = file_size;
    *(int *)(hdr + 10) = 54;
    *(int *)(hdr + 14) = 40;
    *(int *)(hdr + 18) = g_width;
    *(int *)(hdr + 22) = -g_height; // top-down
    *(short *)(hdr + 26) = 1;
    *(short *)(hdr + 28) = 32;
    fwrite(hdr, 1, 54, fp);

    for (int y = 0; y < g_height; y++) {
        fwrite((char *)mapped.pData + y * mapped.RowPitch, 1, row_bytes, fp);
    }
    fclose(fp);
    g_context->Unmap(g_staging, 0);
    return 0;
}

//------------------------------------------------------------
// capture_bye() - Cleanup
//------------------------------------------------------------
EXPORT int __cdecl capture_bye()
{
    if (g_staging) { g_staging->Release(); g_staging = nullptr; }
    if (g_dup) { g_dup->Release(); g_dup = nullptr; }
    if (g_context) { g_context->Release(); g_context = nullptr; }
    if (g_device) { g_device->Release(); g_device = nullptr; }
    g_width = g_height = 0;
    return 0;
}

BOOL WINAPI DllMain(HINSTANCE h, DWORD r, LPVOID p) {
    if (r == DLL_PROCESS_DETACH) capture_bye();
    return TRUE;
}
