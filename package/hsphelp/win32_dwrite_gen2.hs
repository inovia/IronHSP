; ============================================================
;   dwrite.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
DWriteCreateFactory
Creates a DirectWrite factory object that is used for subsequent creation of individual DirectWrite objects.
%group
Win32 dwrite
%prm
factoryType, iid, factory
factoryType : [int] Type: DWRITE_FACTORY_TYPE A value that specifies whether the factory object will be shared or isolated.
iid : [var] Type: REFIID A GUID value that identifies the DirectWrite factory interface, such as __uuidof(IDWriteFactory).
factory : [var] Type: IUnknown** An address of a pointer to the newly created DirectWrite factory object.
%inst
Creates a DirectWrite factory object that is used for subsequent
creation of individual DirectWrite objects.

[戻り値]
Type: HRESULT If this function succeeds, it returns S_OK. Otherwise,
it returns an HRESULT error code.

[備考]
This function creates a DirectWrite factory object that is used for
subsequent creation of individual DirectWrite objects. DirectWrite
factory contains internal state data such as font loader registration
and cached font data. In most cases it is recommended you use the
shared factory object, because it allows multiple components that use
DirectWrite to share internal DirectWrite state data, and thereby
reduce memory usage. However, there are cases when it is desirable to
reduce the impact of a component, such as a plug-in from an untrusted
source, on the rest of the process, by sandboxing and isolating it
from the rest of the process components. In such cases, it is
recommended you use an isolated factory for the sandboxed component.
The following example shows how to create a shared DirectWrite
factory.
This doc was truncated.

