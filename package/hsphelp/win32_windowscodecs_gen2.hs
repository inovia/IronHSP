; ============================================================
;   windowscodecs.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
WICConvertBitmapSource
Obtains a IWICBitmapSource in the desired pixel format from a given IWICBitmapSource.
%group
Win32 windowscodecs
%prm
dstFormat, pISrc, ppIDst
dstFormat : [var] Type: REFWICPixelFormatGUID The pixel format to convert to.
pISrc : [var] Type: IWICBitmapSource* The source bitmap.
ppIDst : [var] Type: IWICBitmapSource** A pointer to the null-initialized destination bitmap pointer.
%inst
Obtains a IWICBitmapSource in the desired pixel format from a given
IWICBitmapSource.

[戻り値]
Type: HRESULT If this function succeeds, it returns **S_OK**.
Otherwise, it returns an **HRESULT** error code.

[備考]
If the pISrc bitmap is already in the desired format, then pISrc is
copied to the destination bitmap pointer and a reference is added. If
it is not in the desired format however, WICConvertBitmapSource will
instantiate a dstFormat format converter and initialize it with
pISrc.


%index
WICCreateBitmapFromSection
Returns a IWICBitmapSource that is backed by the pixels of a Windows Graphics Device Interface (GDI) section handle. (WICCreateBitmapFromSection)
%group
Win32 windowscodecs
%prm
width, height, pixelFormat, hSection, stride, offset, ppIBitmap
width : [int] Type: UINT The width of the bitmap pixels.
height : [int] Type: UINT The height of the bitmap pixels.
pixelFormat : [var] Type: REFWICPixelFormatGUID The pixel format of the bitmap.
hSection : [intptr] Type: HANDLE The section handle. This is a file mapping object handle returned by the CreateFileMapping function.
stride : [int] Type: UINT The byte count of each scanline.
offset : [int] Type: UINT The offset into the section.
ppIBitmap : [var] Type: IWICBitmap** A pointer that receives the bitmap.
%inst
Returns a IWICBitmapSource that is backed by the pixels of a Windows
Graphics Device Interface (GDI) section handle.
(WICCreateBitmapFromSection)

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
The WICCreateBitmapFromSection function calls the
WICCreateBitmapFromSectionEx function with the desiredAccessLevel
parameter set to WICSectionAccessLevelRead.


%index
WICCreateBitmapFromSectionEx
Returns a IWICBitmapSource that is backed by the pixels of a Windows Graphics Device Interface (GDI) section handle. (WICCreateBitmapFromSectionEx)
%group
Win32 windowscodecs
%prm
width, height, pixelFormat, hSection, stride, offset, desiredAccessLevel, ppIBitmap
width : [int] Type: UINT The width of the bitmap pixels.
height : [int] Type: UINT The height of the bitmap pixels.
pixelFormat : [var] Type: REFWICPixelFormatGUID The pixel format of the bitmap.
hSection : [intptr] Type: HANDLE The section handle. This is a file mapping object handle returned by the CreateFileMapping function.
stride : [int] Type: UINT The byte count of each scanline.
offset : [int] Type: UINT The offset into the section.
desiredAccessLevel : [int] Type: WICSectionAccessLevel The desired access level.
ppIBitmap : [var] Type: IWICBitmap** A pointer that receives the bitmap.
%inst
Returns a IWICBitmapSource that is backed by the pixels of a Windows
Graphics Device Interface (GDI) section handle.
(WICCreateBitmapFromSectionEx)

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
WICGetMetadataContentSize
Returns the size of the metadata content contained by the specified IWICMetadataWriter. The returned size accounts for the header and the length of the metadata.
%group
Win32 windowscodecs
%prm
guidContainerFormat, pIWriter, pcbSize
guidContainerFormat : [var] Type: REFGUID The container GUID.
pIWriter : [var] Type: IWICMetadataWriter* The IWICMetadataWriter that contains the content.
pcbSize : [var] Type: ULARGE_INTEGER* A pointer that receives the size of the metadata content.
%inst
Returns the size of the metadata content contained by the specified
IWICMetadataWriter. The returned size accounts for the header and the
length of the metadata.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
WICMapGuidToShortName
Obtains the short name associated with a given GUID.
%group
Win32 windowscodecs
%prm
guid, cchName, wzName, pcchActual
guid : [var] Type: REFGUID The GUID to retrieve the short name for.
cchName : [int] Type: UINT The size of the wzName buffer.
wzName : [wstr] Type: WCHAR* A pointer that receives the short name associated with the GUID.
pcchActual : [var] Type: UINT* The actual size needed to retrieve the entire short name associated with the GUID.
%inst
Obtains the short name associated with a given GUID.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
Windows Imaging Component (WIC) short name mappings can be found
within the following registry key: HKEY_CLASSES_ROOT CLSID
{FAE3D380-FEA4-4623-8C75-C6B61110B681} Namespace ...


%index
WICMapSchemaToName
Obtains the name associated with a given schema.
%group
Win32 windowscodecs
%prm
guidMetadataFormat, pwzSchema, cchName, wzName, pcchActual
guidMetadataFormat : [var] Type: REFGUID The metadata format GUID.
pwzSchema : [wstr] Type: LPWSTR The URI string of the schema for which the name is to be retrieved.
cchName : [int] Type: UINT The size of the wzName buffer.
wzName : [wstr] Type: WCHAR* A pointer to a buffer that receives the schema's name. To obtain the required buffer size, call WICMapSchemaToName with cchName set to 0 and wzName set to NULL.
pcchActual : [var] Type: UINT The actual buffer size needed to retrieve the entire schema name.
%inst
Obtains the name associated with a given schema.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
You can extend the schema name mapping by adding to the following
registry key:
HKEY_CLASSES_ROOT CLSID {FAE3D380-FEA4-4623-8C75-C6B61110B681}
Schemas BB5ACC38-F216-4CEC-A6C5-5F6E739763A9 ...
For more information, see How to Write a WIC-Enabled Codec.


%index
WICMapShortNameToGuid
Obtains the GUID associated with the given short name.
%group
Win32 windowscodecs
%prm
wzName, pguid
wzName : [wstr] Type: const WCHAR* A pointer to the short name.
pguid : [var] Type: GUID* A pointer that receives the GUID associated with the given short name.
%inst
Obtains the GUID associated with the given short name.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
You can extend the short name mapping by adding to the following
registry key:
HKEY_CLASSES_ROOT CLSID {FAE3D380-FEA4-4623-8C75-C6B61110B681}
Namespace ...
For more information, see How to Write a WIC-Enabled Codec.


%index
WICMatchMetadataContent
Obtains a metadata format GUID for a specified container format and vendor that best matches the content within a given stream.
%group
Win32 windowscodecs
%prm
guidContainerFormat, pguidVendor, pIStream, pguidMetadataFormat
guidContainerFormat : [var] Type: REFGUID The container format GUID.
pguidVendor : [var] Type: const GUID* The vendor GUID.
pIStream : [var] Type: IStream* The content stream in which to match a metadata format.
pguidMetadataFormat : [var] Type: GUID* A pointer that receives a metadata format GUID for the given parameters.
%inst
Obtains a metadata format GUID for a specified container format and
vendor that best matches the content within a given stream.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.


%index
WICSerializeMetadataContent
Writes metadata into a given stream.
%group
Win32 windowscodecs
%prm
guidContainerFormat, pIWriter, dwPersistOptions, pIStream
guidContainerFormat : [var] Type: REFGUID The container format GUID.
pIWriter : [var] Type: IWICMetadataWriter* The metadata writer to write metadata to the stream.
dwPersistOptions : [int] Type: DWORD The WICPersistOptions options to use when writing the metadata.
pIStream : [var] Type: IStream* A pointer to the stream in which to write the metadata.
%inst
Writes metadata into a given stream.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

