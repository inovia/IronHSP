; ============================================================
;   ole32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
BindMoniker
Locates an object by means of its moniker, activates the object if it is inactive, and retrieves a pointer to the specified interface on that object.
%group
Win32 ole32
%prm
pmk, grfOpt, iidResult, ppvResult
pmk : [var] A pointer to the object's moniker. See IMoniker.
grfOpt : [int] This parameter is reserved for future use and must be 0.
iidResult : [var] The interface identifier to be used to communicate with the object.
ppvResult : [var] The address of pointer variable that receives the interface pointer requested in iidResult. Upon successful return, *ppvResult contains the requested interface pointer. If an error occurs, *ppvResult is NULL. If the call is successful, the caller is responsible for releasing the pointer with a call to the object's IUnknown::Release method.
%inst
Locates an object by means of its moniker, activates the object if it
is inactive, and retrieves a pointer to the specified interface on
that object.

[戻り値]
This function can return the following error codes, or any of the
error values returned by the IMoniker::BindToObject method.
This doc was truncated.

[備考]
BindMoniker is a helper function supplied as a convenient way for a
client that has the moniker of an object to obtain a pointer to one
of that object's interfaces. BindMoniker packages the following
calls:
This doc was truncated.


%index
CoAllowSetForegroundWindow
This function passes the foreground privilege (the privilege to set the foreground window) from one process to another. The process that has the foreground privilege can call this function to pass that privilege on to a local COM server process.
%group
Win32 ole32
%prm
pUnk, lpvReserved
pUnk : [var] A pointer to the IUnknown interface on the proxy of the target COM server.
lpvReserved : [intptr] This parameter is reserved and must be NULL.
%inst
This function passes the foreground privilege (the privilege to set
the foreground window) from one process to another. The process that
has the foreground privilege can call this function to pass that
privilege on to a local COM server process.

[戻り値]
This function can return the following values.
This doc was truncated.

[備考]
The system restricts which processes can call the SetForegroundWindow
and AllowSetForegroundWindow functions to set the foreground window.
As a result, an application is blocked from stealing the focus from
another application even when the user is interacting with it. Use
CoAllowSetForegroundWindow to pass on the foreground privilege from a
process that has it to a process that does not yet have it. This can
be done transitively: passing the privilege from one process to
another, and then to another, and so on. CoAllowSetForegroundWindow
enables a user that has a custom interface to get the same behavior
that happens for OLE interfaces where a change of window is expected
(primarily associated with linking and embedding). Behind the scenes,
the IForegroundTransfer interface is used to yield the foreground
window between processes. A standard COM-provided proxy already
implements IForegroundTransfer, so you don't have to do any extra
work if you're using a standard proxy. Just call
CoAllowSetForegroundWindow to transfer the foreground privilege to
any out-of-process COM object.


%index
CoBuildVersion
(no summary)
%group
Win32 ole32
%prm

%inst



%index
CoDosDateTimeToFileTime
Converts the MS-DOS representation of the time and date to a FILETIME structure used by Windows.
%group
Win32 ole32
%prm
nDosDate, nDosTime, lpFileTime
nDosDate : [int] The MS-DOS date.
nDosTime : [int] The MS-DOS time.
lpFileTime : [var] A pointer to the FILETIME structure.
%inst
Converts the MS-DOS representation of the time and date to a FILETIME
structure used by Windows.

[戻り値]
If the function succeeds, the return value is TRUE; otherwise, it is
FALSE, probably because of invalid arguments.

[備考]
An MS-DOS date has the following format.
This doc was truncated.


%index
CoFileTimeToDosDateTime
Converts a FILETIME into MS-DOS date and time values.
%group
Win32 ole32
%prm
lpFileTime, lpDosDate, lpDosTime
lpFileTime : [var] A pointer to the FILETIME structure.
lpDosDate : [var] Receives the MS-DOS date.
lpDosTime : [var] Receives the MS-DOS time.
%inst
Converts a FILETIME into MS-DOS date and time values.

[戻り値]
If the function succeeds, the return value is TRUE; otherwise, it is
FALSE.


%index
CoFreeAllLibraries
Frees all the DLLs that have been loaded with the CoLoadLibrary function (called internally by CoGetClassObject), regardless of whether they are currently in use.
%group
Win32 ole32
%prm

%inst
Frees all the DLLs that have been loaded with the CoLoadLibrary
function (called internally by CoGetClassObject), regardless of
whether they are currently in use.

[備考]
To unload libraries, CoFreeAllLibraries uses a list of loaded DLLs
for each process that the COM library maintains. The CoUninitialize
and OleUninitialize functions call CoFreeAllLibraries internally, so
applications usually have no need to call this function directly.


%index
CoFreeLibrary
Frees a library that, when loaded, was specified to be freed explicitly.
%group
Win32 ole32
%prm
hInst
hInst : [intptr] A handle to the library module to be freed, as returned by the CoLoadLibrary function.
%inst
Frees a library that, when loaded, was specified to be freed
explicitly.

[備考]
The CoFreeLibrary function should be called to free a library that is
to be freed explicitly. This is established when the library is
loaded with the bAutoFree parameter of CoLoadLibrary set to FALSE. It
is illegal to free a library explicitly when the corresponding
CoLoadLibrary call specifies that it be freed automatically (the
bAutoFree parameter is set to TRUE).


%index
CoGetInterceptor
Instantiates the appropriate interceptor for the specified interface to be intercepted and returns the newly created interceptor.
%group
Win32 ole32
%prm
iidIntercepted, punkOuter, iid, ppv
iidIntercepted : [var] A reference to the identifier of the interface for which an interceptor is to be returned.
punkOuter : [var] If this parameter is NULL, the object is not being created as part of an aggregate. Otherwise, this parameter is a pointer to the aggregate object's IUnknown interface (the controlling IUnknown).
iid : [var] A reference to the identifier of the interface desired on the interceptor.
ppv : [var] The address of a pointer variable that receives the interface pointer requested in iid. Upon successful return, **ppv contains the requested interceptor pointer.
%inst
Instantiates the appropriate interceptor for the specified interface
to be intercepted and returns the newly created interceptor.

[戻り値]
This function can return the following values.
This doc was truncated.


%index
CoGetInterceptorFromTypeInfo
(no summary)
%group
Win32 ole32
%prm
iidIntercepted, punkOuter, typeInfo, iid, ppv
iidIntercepted : [var] 
punkOuter : [var] 
typeInfo : [var] 
iid : [var] 
ppv : [var] 
%inst



%index
CoGetObject
Converts a display name into a moniker that identifies the object named, and then binds to the object identified by the moniker.
%group
Win32 ole32
%prm
pszName, pBindOptions, riid, ppv
pszName : [wstr] The display name of the object to be created.
pBindOptions : [var] The binding options used to create a moniker that creates the actual object. For details, see BIND_OPTS. This parameter can be NULL.
riid : [var] A reference to the identifier of an interface that is implemented on the object to be created.
ppv : [var] The address of a pointer to the interface specified by riid on the object that is created.
%inst
Converts a display name into a moniker that identifies the object
named, and then binds to the object identified by the moniker.

[戻り値]
This function can return the standard return values E_FAIL,
E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
This doc was truncated.

[備考]
CoGetObject encapsulates calls to the COM library functions
CreateBindCtx, MkParseDisplayName, and IMoniker::BindToObject.


%index
CoInitialize
現在のスレッドで COM ライブラリを初期化し、同時実行モデルをシングルスレッドアパートメント(STA)として識別する。
%group
Win32 ole32
%prm
pvReserved
pvReserved : [intptr] このパラメータは予約されており、NULL を指定する必要がある。
%inst
現在のスレッドで COM ライブラリを初期化し、同時実行モデルをシングルスレッドアパートメント(STA)として識別する。

[戻り値]
標準の戻り値 E_INVALIDARG、E_OUTOFMEMORY、E_UNEXPECTED のほか、次の値を返すことがある。
（以下省略）

[備考]
COM ライブラリの関数を呼び出す前にスレッド上で COM ライブラリを初期化する必要がある(CoGetMalloc
とメモリ割り当て関数を除く)。スレッドの同時実行モデルは一度設定されると変更できず、マルチスレッドとして初期化済みのアパートメントに対する
CoInitialize 呼び出しは RPC_E_CHANGED_MODE で失敗する。CoInitializeEx
は同等の機能に加えて同時実行モデルを明示的に指定するパラメータを持ち、今後のアプリケーションは CoInitializeEx
を使用すべきである。成功した各 CoInitialize/CoInitializeEx 呼び出し(S_FALSE を含む)は
CoUninitialize 呼び出しと対応させる。DllMain からこれらの関数を呼び出してはならない。
（以下省略）


%index
CoInstall
Installs the requested COM server application.
%group
Win32 ole32
%prm
pbc, dwFlags, pClassSpec, pQuery, pszCodeBase
pbc : [var] Reserved for future use; this value must be NULL.
dwFlags : [int] Reserved for future use; this value must be 0.
pClassSpec : [var] A pointer to a uCLSSPEC union. The tyspec member must be set to TYSPEC_CLSID and the clsid member must be set to the CLSID to be installed. For more information, see TYSPEC.
pQuery : [var] A pointer to a QUERYCONTEXT structure. The dwContext field must be set to the desired CLSCTX value. For more information, see QUERYCONTEXT.
pszCodeBase : [wstr] Reserved for future use; this value must be NULL.
%inst
Installs the requested COM server application.

[戻り値]
This function supports the standard return value E_INVALIDARG, as
well as the following.
This doc was truncated.


%index
CoIsOle1Class
Determines whether the specified CLSID represents an OLE 1 object.
%group
Win32 ole32
%prm
rclsid
rclsid : [var] The CLSID to be checked.
%inst
Determines whether the specified CLSID represents an OLE 1 object.

[戻り値]
If the CLSID refers to an OLE 1 object, the return value is TRUE;
otherwise, it is FALSE.

[備考]
The CoIsOle1Class function determines whether an object class is from
OLE 1. You can use it to prevent linking to embedded OLE 1 objects
within a container, which OLE 1 objects do not support. After a
container has determined that copied data represents an embedded
object, the container code can call CoIsOle1Class to determine
whether the embedded object is an OLE 1 object. If CoIsOle1Class
returns TRUE, the container does not offer CF_LINKSOURCE as one of
its clipboard formats. This is one of several OLE compatibility
functions. The following compatibility functions, listed below, can
be used to convert the storage formats of objects between OLE 1 and
OLE.
This doc was truncated.


%index
CoLoadLibrary
Loads a specific DLL into the caller's process.
%group
Win32 ole32
%prm
lpszLibName, bAutoFree
lpszLibName : [wstr] The name of the library to be loaded.
bAutoFree : [int] This parameter is maintained for compatibility with 16-bit applications, but is ignored.
%inst
Loads a specific DLL into the caller's process.

[戻り値]
If the function succeeds, the return value is a handle to the loaded
library; otherwise, it is NULL.

[備考]
The CoGetClassObject function does not call CoLoadLibrary.
CoLoadLibrary loads a DLL specified by the lpszLibName parameter into
the process that called CoGetClassObject. Containers should not call
CoLoadLibrary directly. Internally, a reference count is kept on the
loaded DLL by using CoLoadLibrary to increment the count and the
CoFreeLibrary function to decrement it.


%index
CoRegisterMessageFilter
Registers with OLE the instance of an IMessageFilter interface, which is to be used for handling concurrency issues on the current thread.
%group
Win32 ole32
%prm
lpMessageFilter, lplpMessageFilter
lpMessageFilter : [var] A pointer to the IMessageFilter interface on the message filter. This message filter should be registered on the current thread, replacing the previous message filter (if any). This parameter can be NULL, indicating that no message filter should be registered on the current thread. Note that this function calls AddRef on the interface pointer to the message filter.
lplpMessageFilter : [var] Address of the IMessageFilter* pointer variable that receives the interface pointer to the previously registered message filter. If there was no previously registered message filter for the current thread, the value of *lplpMessageFilter is NULL.
%inst
Registers with OLE the instance of an IMessageFilter interface, which
is to be used for handling concurrency issues on the current thread.

[戻り値]
If the instance was registered or revoked successfully, the return
value is S_OK; otherwise, it is S_FALSE.

[備考]
To revoke the registered message filter, pass the previous message
filter (possibly NULL) as the lpMessageFilter parameter to
CoRegisterMessageFilter.


%index
CoTreatAsClass
Establishes or removes an emulation, in which objects of one class are treated as objects of a different class.
%group
Win32 ole32
%prm
clsidOld, clsidNew
clsidOld : [var] The CLSID of the object to be emulated.
clsidNew : [var] The CLSID of the object that should emulate the original object. This replaces any existing emulation for clsidOld. This parameter can be CLSID_NULL, in which case any existing emulation for clsidOld is removed.
%inst
Establishes or removes an emulation, in which objects of one class
are treated as objects of a different class.

[戻り値]
This function can return the standard return values E_INVALIDARG, as
well as the following values.
This doc was truncated.

[備考]
This function sets the TreatAs entry in the registry for the
specified object, allowing the object to be emulated by another
application. Emulation allows an application to open and edit an
object of a different format, while retaining the original format of
the object. After this entry is set, whenever any function such as
CoGetClassObject specifies the object's original CLSID (clsidOld), it
is transparently forwarded to the new CLSID (clsidNew), thus
launching the application associated with the TreatAs CLSID. When the
object is saved, it can be saved in its native format, which may
result in loss of edits not supported by the original format. If your
application supports emulation, call CoTreatAsClass in the following
situations:
This doc was truncated.


%index
CreateAntiMoniker
Creates and returns a new anti-moniker.
%group
Win32 ole32
%prm
ppmk
ppmk : [var] The address of an IMoniker* pointer variable that receives the interface pointer to the new anti-moniker. When successful, the function has called AddRef on the anti-moniker and the caller is responsible for calling Release. When an error occurs, the anti-moniker pointer is NULL.
%inst
Creates and returns a new anti-moniker.

[戻り値]
This function can return the standard return values E_OUTOFMEMORY and
S_OK.

[備考]
You would call this function only if you are writing your own moniker
class (implementing the IMoniker interface). If you are writing a new
moniker class that has no internal structure, you can use
CreateAntiMoniker in your implementation of the IMoniker::Inverse
method, and then check for an anti-moniker in your implementation of
IMoniker::ComposeWith. Like the ".." directory, which acts as the
inverse to any directory name just preceding it in a path, an
anti-moniker acts as the inverse of a simple moniker that precedes it
in a composite moniker. An anti-moniker is used as the inverse of
simple monikers with no internal structure. For example, the
system-provided implementations of file monikers, item monikers, and
pointer monikers all use anti-monikers as their inverse;
consequently, an anti-moniker composed to the right of one of these
monikers composes to nothing. A moniker client (an object that is
using a moniker to bind to another object) typically does not know
the class of a given moniker, so the client cannot be sure that an
anti-moniker is the inverse. Therefore, to get the inverse of a
moniker, you would call IMoniker::Inverse rather than
CreateAntiMoniker. To remove the last piece of a composite moniker,
you would do the following:
This doc was truncated.


%index
CreateBindCtx
Returns a pointer to an implementation of IBindCtx (a bind context object). This object stores information about a particular moniker-binding operation.
%group
Win32 ole32
%prm
reserved, ppbc
reserved : [int] This parameter is reserved and must be 0.
ppbc : [var] Address of an IBindCtx* pointer variable that receives the interface pointer to the new bind context object. When the function is successful, the caller is responsible for calling Release on the bind context. A NULL value for the bind context indicates that an error occurred.
%inst
Returns a pointer to an implementation of IBindCtx (a bind context
object). This object stores information about a particular
moniker-binding operation.

[戻り値]
This function can return the standard return values E_OUTOFMEMORY and
S_OK.

[備考]
CreateBindCtx is most commonly used in the process of binding a
moniker (locating and getting a pointer to an interface by
identifying it through a moniker), as in the following steps:
This doc was truncated.


%index
CreateClassMoniker
Creates a class moniker that refers to the specified class.
%group
Win32 ole32
%prm
rclsid, ppmk
rclsid : [var] A reference to the CLSID of the object type to which this moniker binds.
ppmk : [var] The address of an IMoniker* pointer variable that receives the interface pointer to the new class moniker. On successful return, the function has called AddRef on the moniker and the caller is responsible for calling Release. When an error occurs, the value of the moniker pointer is NULL.
%inst
Creates a class moniker that refers to the specified class.

[戻り値]
This function can return the following values.
This doc was truncated.

[備考]
The class moniker will support the binding to a fresh instance of the
class identified by the CLSID in rclsid.


%index
CreateDataAdviseHolder
The CreateDataAdviseHolder function (ole2.h) retrieves a pointer to the OLE implementation of IDataAdviseHolder on the data advise holder object.
%group
Win32 ole32
%prm
ppDAHolder
ppDAHolder : [var] Address of an IDataAdviseHolder pointer variable that receives the interface pointer to the new advise holder object.
%inst
The CreateDataAdviseHolder function (ole2.h) retrieves a pointer to
the OLE implementation of IDataAdviseHolder on the data advise holder
object.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
Call CreateDataAdviseHolder in your implementation of
IDataObject::DAdvise to get a pointer to the OLE implementation of
IDataAdviseHolder interface. With this pointer, you can then complete
the implementation of IDataObject::DAdvise by calling the
IDataAdviseHolder::Advise method, which creates an advisory
connection between the calling object and the data object.


%index
CreateDataCache
Retrieves a pointer to a new instance of an OLE-provided implementation of a data cache.
%group
Win32 ole32
%prm
pUnkOuter, rclsid, iid, ppv
pUnkOuter : [var] If the cache is to be created as part of an aggregate, pointer to the controlling IUnknown of the aggregate. If not, the parameter should be NULL.
rclsid : [var] CLSID used to generate icon labels. This value is typically CLSID_NULL.
iid : [var] Reference to the identifier of the interface the caller wants to use to communicate with the cache. This value is typically IID_IOleCache (defined in the OLE headers to equal the interface identifier for IOleCache).
ppv : [var] Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *ppvObj contains the requested interface pointer to the supplied cache object.
%inst
Retrieves a pointer to a new instance of an OLE-provided
implementation of a data cache.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
The cache object created by CreateDataCache supports the IOleCache,
IOleCache2, and IOleCacheControl interfaces for controlling the
cache. It also supports the IPersistStorage, IDataObject (without
advise sinks), IViewObject, and IViewObject2 interfaces.


%index
CreateFileMoniker
Creates a file moniker based on the specified path.
%group
Win32 ole32
%prm
lpszPathName, ppmk
lpszPathName : [wstr] The path on which this moniker is to be based. This parameter can specify a relative path, a UNC path, or a drive-letter-based path. If based on a relative path, the resulting moniker must be composed onto another file moniker before it can be bound.
ppmk : [var] The address of an IMoniker* pointer variable that receives the interface pointer to the new file moniker. When successful, the function has called AddRef on the file moniker and the caller is responsible for calling Release. When an error occurs, the value of the interface pointer is NULL.
%inst
Creates a file moniker based on the specified path.

[戻り値]
This function can return the standard return value E_OUTOFMEMORY, as
well as the following values.
This doc was truncated.

[備考]
CreateFileMoniker creates a moniker for an object that is stored in a
file. A moniker provider (an object that provides monikers to other
objects) can call this function to create a moniker to identify a
file-based object that it controls, and can then make the pointer to
this moniker available to other objects. An object identified by a
file moniker must also implement the IPersistFile interface so it can
be loaded when a file moniker is bound. When each object resides in
its own file, as in an OLE server application that supports linking
only to file-based documents in their entirety, file monikers are the
only type of moniker necessary. To identify objects smaller than a
file, the moniker provider must use another type of moniker (such as
an item moniker) in addition to file monikers, creating a composite
moniker. Composite monikers would be needed in an OLE server
application that supports linking to objects smaller than a document
(such as sections of a document or embedded objects). A file moniker
can be composed to the right only of another file moniker when the
first moniker is based on an absolute path and the other is a
relative path, resulting in a single file moniker based on the
combination of the two paths. A moniker composed to the right of
another moniker must be a refinement of that moniker, and the file
moniker represents the largest unit of storage. To identify objects
stored within a file, you would compose other types of monikers
(usually item monikers) to the right of a file moniker.


%index
CreateGenericComposite
Performs a generic composition of two monikers and supplies a pointer to the resulting composite moniker.
%group
Win32 ole32
%prm
pmkFirst, pmkRest, ppmkComposite
pmkFirst : [var] A pointer to the moniker to be composed to the left of the moniker that pmkRest points to. Can point to any kind of moniker, including a generic composite.
pmkRest : [var] A pointer to the moniker to be composed to the right of the moniker to which pmkFirst points. Can point to any kind of moniker compatible with the type of the pmkRest moniker, including a generic composite.
ppmkComposite : [var] The address of an IMoniker* pointer variable that receives the interface pointer to the composite moniker object that is the result of composing pmkFirst and pmkRest. This object supports the OLE composite moniker implementation of IMoniker. When successful, the function has called AddRef on the moniker and the caller is responsible for calling Release. If either pmkFirst or pmkRest are NULL, the supplied pointer is the one that is non-NULL. If both pmkFirst and pmkRest are NULL, or if an error occurs, the returned pointer is NULL.
%inst
Performs a generic composition of two monikers and supplies a pointer
to the resulting composite moniker.

[戻り値]
This function can return the standard return value E_OUTOFMEMORY, as
well as the following values.
This doc was truncated.

[備考]
CreateGenericComposite joins two monikers into one. The moniker
classes being joined can be different, subject only to the rules of
composition. Call this function only if you are writing a new moniker
class by implementing the IMoniker interface, within an
implementation of IMoniker::ComposeWith that includes generic
composition capability. Moniker providers should call ComposeWith to
compose two monikers together. Implementations of ComposeWith should
(as do OLE implementations) attempt, when reasonable for the class,
to perform non-generic compositions first, in which two monikers of
the same class are combined. If this is not possible, the
implementation can call CreateGenericComposite to do a generic
composition, which combines two monikers of different classes, within
the rules of composition. You can define new types of non-generic
compositions if you write a new moniker class. During the process of
composing the two monikers, CreateGenericComposite makes all possible
simplifications. Consider the example where pmkFirst is the generic
composite moniker, A + B + C, and pmkRest is the generic composite
moniker, C -1 + B -1 + Z (where C -1 is the inverse of C). The
function first composes C to C -1, which composes to nothing. Then it
composes B and B -1 to nothing. Finally, it composes A to Z, and
supplies a pointer to the generic composite moniker, A + Z.


%index
CreateILockBytesOnHGlobal
Creates a byte array object that uses an HGLOBAL memory handle to store the bytes intended for in-memory storage of a compound file.
%group
Win32 ole32
%prm
hGlobal, fDeleteOnRelease, pplkbyt
hGlobal : [int] A memory handle allocated by the GlobalAlloc function, or if NULL a new handle is to be allocated instead. The handle must be allocated as moveable and nondiscardable.
fDeleteOnRelease : [int] A flag  that specifies whether the underlying handle for this byte array object should be automatically freed when the object is released. If set to FALSE, the caller must free the hGlobal after the final release. If set to TRUE, the final release will automatically free the hGlobal parameter.
pplkbyt : [var] The address of ILockBytes pointer variable that receives the interface pointer to the new byte array object.
%inst
Creates a byte array object that uses an HGLOBAL memory handle to
store the bytes intended for in-memory storage of a compound file.

[戻り値]
This function supports the standard return values E_INVALIDARG and
E_OUTOFMEMORY, as well as the following:

[備考]
If hGlobal is NULL, the CreateILockBytesOnHGlobal allocates a new
memory handle and the byte array is empty initially. If hGlobal is
not NULL, the initial contents of the byte array object are the
current contents of the memory block. Thus, this function can be used
to open an existing byte array in memory, for example to reload a
storage object previously created by the StgCreateDocfileOnILockBytes
function. The memory handle and its contents are undisturbed by the
creation of the new byte array object. The initial size of the byte
array is the size of hGlobal as returned by the GlobalSize function.
This is not necessarily the same size that was originally allocated
for the handle because of rounding. If the logical size of the byte
array is important, follow the call to CreateILockBytesOnHGlobal with
a call to ILockBytes::SetSize. After creating the byte array object
with CreateStreamOnHGlobal, StgCreateDocfileOnILockBytes can be used
to create a new storage object in memory, or
StgOpenStorageOnILockBytes can be used to reopen a previously
existing storage object that is already contained in the memory
block. GetHGlobalFromILockBytes can be called to retrieve the memory
handle associated with the byte array object. If a memory handle is
passed to CreateILockBytesOnHGlobal or if GetHGlobalFromILockBytes is
called, the memory handle of this function can be directly accessed
by the caller while it is still in use by the byte array object.
Appropriate caution should be exercised in the use of this capability
and its implications:
This doc was truncated.


%index
CreateItemMoniker
Creates an item moniker that identifies an object within a containing object (typically a compound document).
%group
Win32 ole32
%prm
lpszDelim, lpszItem, ppmk
lpszDelim : [wstr] A pointer to a wide character string (two bytes per character) zero-terminated string containing the delimiter (typically "!") used to separate this item's display name from the display name of its containing object.
lpszItem : [wstr] A pointer to a zero-terminated string indicating the containing object's name for the object being identified. This name can later be used to retrieve a pointer to the object in a call to IOleItemContainer::GetObject.
ppmk : [var] The address of an IMoniker* pointer variable that receives the interface pointer to the item moniker. When successful, the function has called AddRef on the item moniker and the caller is responsible for calling Release. If an error occurs, the supplied interface pointer has a NULL value.
%inst
Creates an item moniker that identifies an object within a containing
object (typically a compound document).

[戻り値]
This function can return the standard return values E_OUTOFMEMORY and
S_OK.

[備考]
A moniker provider, which hands out monikers to identify its objects
so they are accessible to other parties, would call CreateItemMoniker
to identify its objects with item monikers. Item monikers are based
on a string, and identify objects that are contained within another
object and can be individually identified using a string. The
containing object must also implement the IOleContainer interface.
Most moniker providers are OLE applications that support linking.
Applications that support linking to objects smaller than file-based
documents, such as a server application that allows linking to a
selection within a document, should use item monikers to identify the
objects. Container applications that allow linking to embedded
objects use item monikers to identify the embedded objects.
The lpszItem parameter is the name used by the document to uniquely
identify the object. For example, if the object being identified is a
cell range in a spreadsheet, an appropriate name might be something
like "A1:E7." An appropriate name when the object being identified is
an embedded object might be something like "embedobj1." The
containing object must provide an implementation of the
IOleItemContainer interface that can interpret this name and locate
the corresponding object. This allows the item moniker to be bound to
the object it identifies. Item monikers are not used in isolation.
They must be composed with a moniker that identifies the containing
object as well. For example, if the object being identified is a cell
range contained in a file-based document, the item moniker
identifying that object must be composed with the file moniker
identifying that document, resulting in a composite moniker that is
the equivalent of "C:\work\sales.xls!A1:E7." Nested containers are
allowed also, as in the case where an object is contained within an
embedded object inside another document. The complete moniker of such
an object would be the equivalent of
"C:\work\report.doc!embedobj1!A1:E7." In this case, each containing
object must call CreateItemMoniker and provide its own implementation
of the IOleItemContainer interface.


%index
CreateObjrefMoniker
Creates an OBJREF moniker based on a pointer to an object.
%group
Win32 ole32
%prm
punk, ppmk
punk : [var] A pointer to the IUnknown interface on the object that the moniker is to represent.
ppmk : [var] Address of a pointer to the IMoniker interface on the OBJREF moniker that was created.
%inst
Creates an OBJREF moniker based on a pointer to an object.

[戻り値]
This function can return the standard return values E_OUTOFMEMORY,
E_UNEXPECTED, and S_OK.

[備考]
Clients use OBJREF monikers to obtain a marshaled pointer to a
running object in the servers address space. The server typically
calls CreateObjrefMoniker to create an OBJREF moniker and then calls
IMoniker::GetDisplayName, and finally releases the moniker. The
display name for an OBJREF moniker is of the form:
OBJREF:nnnnnnnn Where nnnnnnnn is an arbitrarily long base-64
encoding that encapsulates the computer location, process endpoint,
and interface pointer ID (IPID) of the running object The display
name can then be transferred to the client as text. For example, the
display name can reside on an HTML page that the client downloads.
The client can pass the display name to MkParseDisplayName, which
creates an OBJREF moniker based on the display name. A call to the
monikers IMoniker::BindToObject method then obtains a marshaled
pointer to the running instance on the server. For example, a
server-side COM component contained in an Active Server Page can
create an OBJREF moniker, obtain its display name, and write the
display name to the HTML output that is sent to the client browser. A
script that runs on the client side can use the display name to get
access to the running object itself. A client-side Visual Basic
script, for instance, could store the display name in a variable
called strMyName and include this line: objMyInstance =
GetObject(strMyName) The script engine internally makes the calls to
MkParseDisplayName and IMoniker::BindToObject, and the script can
then use objMyInstance to refer directly to the running object.


%index
CreateOleAdviseHolder
Creates an advise holder object for managing compound document notifications. It returns a pointer to the object's OLE implementation of the IOleAdviseHolder interface.
%group
Win32 ole32
%prm
ppOAHolder
ppOAHolder : [var] Address of IOleAdviseHolder pointer variable that receives the interface pointer to the new advise holder object.
%inst
Creates an advise holder object for managing compound document
notifications. It returns a pointer to the object's OLE
implementation of the IOleAdviseHolder interface.

[戻り値]
This function returns S_OK on success and supports the standard
return value E_OUTOFMEMORY.

[備考]
The function CreateOleAdviseHolder creates an instance of an advise
holder, which supports the OLE implementation of the IOleAdviseHolder
interface. The methods of this interface are intended to be used to
implement the advisory methods of IOleObject, and, when advisory
connections have been set up with objects supporting an advisory
sink, to send notifications of changes in the object to the advisory
sink. The advise holder returned by CreateOleAdviseHolder will
suffice for the great majority of applications. The OLE-provided
implementation does not, however, support
IOleAdviseHolder::EnumAdvise, so if you need to use this method, you
will need to implement your own advise holder.


%index
CreatePointerMoniker
Creates a pointer moniker based on a pointer to an object.
%group
Win32 ole32
%prm
punk, ppmk
punk : [var] A pointer to an IUnknown interface on the object to be identified by the resulting moniker.
ppmk : [var] The address of an IMoniker* pointer variable that receives the interface pointer to the new pointer moniker. When successful, the function has called AddRef on the moniker and the caller is responsible for calling Release. When an error occurs, the returned interface pointer has a NULL value.
%inst
Creates a pointer moniker based on a pointer to an object.

[戻り値]
This function can return the standard return values E_OUTOFMEMORY,
E_UNEXPECTED, and S_OK.

[備考]
A pointer moniker wraps an existing interface pointer in a moniker
that can be passed to those interfaces that require monikers. Pointer
monikers allow an object that has no persistent representation to
participate in a moniker-binding operation.
Pointer monikers are not commonly used, so this function is not often
called.


%index
CreateStdProgressIndicator
(no summary)
%group
Win32 ole32
%prm
hwndParent, pszTitle, pIbscCaller, ppIbsc
hwndParent : [intptr] 
pszTitle : [wstr] 
pIbscCaller : [var] 
ppIbsc : [var] 
%inst



%index
DoDragDrop
Carries out an OLE drag and drop operation.
%group
Win32 ole32
%prm
pDataObj, pDropSource, dwOKEffects, pdwEffect
pDataObj : [var] Pointer to the IDataObject interface on a data object that contains the data being dragged.
pDropSource : [var] Pointer to an implementation of the IDropSource interface, which is used to communicate with the source during the drag operation.
dwOKEffects : [int] Effects the source allows in the OLE drag-and-drop operation. Most significant is whether it permits a move. The dwOKEffect and pdwEffect parameters obtain values from the DROPEFFECT enumeration. For a list of values, see DROPEFFECT.
pdwEffect : [var] Pointer to a value that indicates how the OLE drag-and-drop operation affected the source data. The pdwEffect parameter is set only if the operation is not canceled.
%inst
Carries out an OLE drag and drop operation.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
If you are developing an application that can act as a data source
for an OLE drag-and-drop operation, you must call DoDragDrop when you
detect that the user has started an OLE drag-and-drop operation.
The DoDragDrop function enters a loop in which it calls various
methods in the IDropSource and IDropTarget interfaces. (For a
successful drag-and-drop operation, the application acting as the
data source must also implement IDropSource, while the target
application must implement IDropTarget.)
This doc was truncated.


%index
FmtIdToPropStgName
Converts a property set format identifier (FMTID) to its storage or stream name.
%group
Win32 ole32
%prm
pfmtid, oszName
pfmtid : [var] A pointer to the FMTID of the property set.
oszName : [wstr] A pointer to a null-terminated string that receives the storage or stream name of the property set identified by pfmtid. The array allocated for this string must be at least CCH_MAX_PROPSTG_NAME (32) characters in length.
%inst
Converts a property set format identifier (FMTID) to its storage or
stream name.

[戻り値]
This function supports the standard return value E_INVALIDARG as well
as the following:

[備考]
FmtIdToPropStgName maps a property set FMTID to its stream name for a
simple property set or to its storage name for a nonsimple property
set. This function is useful in creating or opening a property set
using the PROPSETFLAG_UNBUFFERED value with the StgCreatePropStg and
StgOpenPropStg functions. For more information about
PROPSETFLAG_UNBUFFERED, see PROPSETFLAG Constants.


%index
FreePropVariantArray
The FreePropVariantArray function calls PropVariantClear on each of the PROPVARIANT structures in the rgvars array to make the value zero for each of the members of the array.
%group
Win32 ole32
%prm
cVariants, rgvars
cVariants : [int] Count of elements in the PROPVARIANT array (rgvars).
rgvars : [var] Pointer to an initialized array of PROPVARIANT structures for which any deallocatable elements are to be freed. On exit, all zeroes are written to the PROPVARIANT structure (thus tagging them as VT_EMPTY).
%inst
The FreePropVariantArray function calls PropVariantClear on each of
the PROPVARIANT structures in the rgvars array to make the value zero
for each of the members of the array.

[戻り値]
This function returns HRESULT.

[備考]
FreePropVariantArray calls PropVariantClear on an array of
PROPVARIANT structures to clear all the valid members. All valid
PROPVARIANT structures are freed. If any of the PROPVARIANT
structures contain illegal VT types, valid members are freed and the
function returns STG_E_INVALIDPARAMETER. Passing NULL for rgvars is
legal, and produces a return code of S_OK.


%index
GetClassFile
Returns the CLSID associated with the specified file name.
%group
Win32 ole32
%prm
szFilename, pclsid
szFilename : [wstr] A pointer to the filename for which you are requesting the associated CLSID.
pclsid : [var] A pointer to the location where the associated CLSID is written on return.
%inst
Returns the CLSID associated with the specified file name.

[戻り値]
This function can return any of the file system errors, as well as
the following values.
This doc was truncated.

[備考]
When given a file name, GetClassFile finds the CLSID associated with
that file. Examples of its use are in the OleCreateFromFile function,
which is passed a file name and requires an associated CLSID, and in
the OLE implementation of IMoniker::BindToObject, which, when a link
to a file-based document is activated, calls GetClassFile to locate
the object application that can open the file.
GetClassFile uses the following strategies to determine an
appropriate CLSID:
This doc was truncated.


%index
GetConvertStg
The GetConvertStg function returns the current value of the convert bit for the specified storage object.
%group
Win32 ole32
%prm
pStg
pStg : [var] IStorage pointer to the storage object from which the convert bit is to be retrieved.
%inst
The GetConvertStg function returns the current value of the convert
bit for the specified storage object.

[戻り値]
IStorage::OpenStream, IStorage::OpenStorage, and
ISequentialStream::Read storage and stream access errors.

[備考]
The GetConvertStg function is called by object servers that support
the conversion of an object from one format to another. The server
must be able to read the storage object using the format of its
previous class identifier (CLSID) and write the object using the
format of its new CLSID to support the object's conversion. For
example, a spreadsheet created by one application can be converted to
the format used by a different application. The convert bit is set by
a call to the SetConvertStg function. A container application can
call this function on the request of an end user, or a setup program
can call it when installing a new version of an application. An end
user requests converting an object through the Convert To dialog box.
When an object is converted, the new CLSID is permanently assigned to
the object, so the object is subsequently associated with the new
CLSID. Then, when the object is activated, its server calls the
GetConvertStg function to retrieve the value of the convert bit from
the storage object. If the bit is set, the object's CLSID has been
changed, and the server must read the old format and write the new
format for the storage object. After retrieving the bit value, the
object application should clear the convert bit by calling the
SetConvertStg function with its fConvert parameter set to FALSE.


%index
GetHGlobalFromILockBytes
The GetHGlobalFromILockBytes function retrieves a global memory handle to a byte array object created using the CreateILockBytesOnHGlobal function.
%group
Win32 ole32
%prm
plkbyt, phglobal
plkbyt : [var] Pointer to the ILockBytes interface on the byte-array object previously created by a call to the CreateILockBytesOnHGlobal function.
phglobal : [var] Pointer to the current memory handle used by the specified byte-array object.
%inst
The GetHGlobalFromILockBytes function retrieves a global memory
handle to a byte array object created using the
CreateILockBytesOnHGlobal function.

[戻り値]
This function returns HRESULT.

[備考]
After a call to CreateILockBytesOnHGlobal, which creates a byte array
object on global memory, GetHGlobalFromILockBytes retrieves a pointer
to the handle of the global memory underlying the byte array object.
The handle this function returns might be different from the original
handle due to intervening calls to the GlobalReAlloc function. The
contents of the returned memory handle can be written to a clean disk
file, and then opened as a storage object using the StgOpenStorage
function. This function only works within the same process from which
the byte array was created.


%index
GetRunningObjectTable
Returns a pointer to the IRunningObjectTable interface on the local running object table (ROT).
%group
Win32 ole32
%prm
reserved, pprot
reserved : [int] This parameter is reserved and must be 0.
pprot : [var] The address of an IRunningObjectTable* pointer variable that receives the interface pointer to the local ROT. When the function is successful, the caller is responsible for calling Release on the interface pointer. If an error occurs, *pprot is undefined.
%inst
Returns a pointer to the IRunningObjectTable interface on the local
running object table (ROT).

[戻り値]
This function can return the standard return values E_UNEXPECTED and
S_OK.

[備考]
Each workstation has a local ROT that maintains a table of the
objects that have been registered as running on that computer. This
function returns an IRunningObjectTable interface pointer, which
provides access to that table. Moniker providers, which hand out
monikers that identify objects so they are accessible to others,
should call GetRunningObjectTable. Use the interface pointer returned
by this function to register your objects when they begin running, to
record the times that those objects are modified, and to revoke their
registrations when they stop running. See the IRunningObjectTable
interface for more information.
Compound-document link sources are the most common example of moniker
providers. These include server applications that support linking to
their documents (or portions of a document) and container
applications that support linking to embeddings within their
documents. Server applications that do not support linking can also
use the ROT to cooperate with container applications that support
linking to embeddings. If you are implementing the IMoniker interface
to write a new moniker class, and you need an interface pointer to
the ROT, call IBindCtx::GetRunningObjectTable rather than the
GetRunningObjectTable function. This allows future implementations of
the IBindCtx interface to modify binding behavior.


%index
IsAccelerator
Determines whether the specified keystroke maps to an accelerator in the specified accelerator table.
%group
Win32 ole32
%prm
hAccel, cAccelEntries, lpMsg, lpwCmd
hAccel : [intptr] A handle to the accelerator table.
cAccelEntries : [int] The number of entries in the accelerator table.
lpMsg : [var] A pointer to the keystroke message to be translated.
lpwCmd : [var] A pointer to a variable  to receive the corresponding command identifier if there is an accelerator for the keystroke. This parameter may be NULL.
%inst
Determines whether the specified keystroke maps to an accelerator in
the specified accelerator table.

[戻り値]
If the message is for the object application, the return value is
TRUE. If the message is not for the object and should be forwarded to
the container, the return value is FALSE.

[備考]
While an object is active in-place, the object always has first
chance to translate the keystrokes into accelerators. If the
keystroke corresponds to one of its accelerators, the object must not
call the OleTranslateAccelerator function - even if its call to the
TranslateAccelerator function fails. Failure to process keystrokes in
this manner can lead to inconsistent behavior. If the keystroke is
not one of the object's accelerators, then the object must call
OleTranslateAccelerator to let the container try its accelerator
translation. The object's server can call IsAccelerator to determine
if the accelerator message belongs to it. Some servers do accelerator
translation on their own and do not call TranslateAccelerator. Those
applications will not call IsAccelerator, because they already have
the information.


%index
MkParseDisplayName
Converts a string into a moniker that identifies the object named by the string.
%group
Win32 ole32
%prm
pbc, szUserName, pchEaten, ppmk
pbc : [var] A pointer to the IBindCtx interface on the bind context object to be used in this binding operation.
szUserName : [wstr] A pointer to the display name to be parsed.
pchEaten : [var] A pointer to the number of characters of szUserName that were consumed. If the function is successful, *pchEaten is the length of szUserName; otherwise, it is the number of characters successfully parsed.
ppmk : [var] The address of the IMoniker* pointer variable that receives the interface pointer to the moniker that was built from szUserName. When successful, the function has called AddRef on the moniker and the caller is responsible for calling Release. If an error occurs, the specified interface pointer will contain as much of the moniker that the method was able to create before the error occurred.
%inst
Converts a string into a moniker that identifies the object named by
the string.

[戻り値]
This function can return the standard return value E_OUTOFMEMORY, as
well as the following values.
This doc was truncated.

[備考]
The MkParseDisplayName function parses a human-readable name into a
moniker that can be used to identify a link source. The resulting
moniker can be a simple moniker (such as a file moniker), or it can
be a generic composite made up of the component moniker pieces. For
example, the display name "c:\mydir\somefile!item 1" could be parsed
into the following generic composite moniker: FileMoniker based on
"c:\mydir\somefile") + (ItemMoniker based on "item 1"). The most
common use of MkParseDisplayName is in the implementation of the
standard Links dialog box, which allows an end user to specify the
source of a linked object by typing in a string. You may also need to
call MkParseDisplayName if your application supports a macro language
that permits remote references (reference to elements outside of the
document).
Parsing a display name often requires activating the same objects
that would be activated during a binding operation, so it can be just
as expensive (in terms of performance) as binding. Objects that are
bound during the parsing operation are cached in the bind context
passed to the function. If you plan to bind the moniker returned by
MkParseDisplayName, it is best to do so immediately after the
function returns, using the same bind context, which removes the need
to activate objects a second time. MkParseDisplayName parses as much
of the display name as it understands into a moniker. The function
then calls IMoniker::ParseDisplayName on the newly created moniker,
passing the remainder of the display name. The moniker returned by
ParseDisplayName is composed onto the end of the existing moniker
and, if any of the display name remains unparsed, ParseDisplayName is
called on the result of the composition. This process is repeated
until the entire display name has been parsed. MkParseDisplayName
attempts the following strategies to parse the beginning of the
display name, using the first one that succeeds:
This doc was truncated.


%index
MonikerCommonPrefixWith
Creates a new moniker based on the common prefix that this moniker (the one comprising the data of this moniker object) shares with another moniker.
%group
Win32 ole32
%prm
pmkThis, pmkOther, ppmkCommon
pmkThis : [var] A pointer to the IMoniker interface on one of the monikers for which a common prefix is sought; usually the moniker in which this call is used to implement IMoniker::CommonPrefixWith.
pmkOther : [var] A pointer to the IMoniker interface on the moniker to be compared with the first moniker.
ppmkCommon : [var] The address of an IMoniker* pointer variable that receives the interface pointer to the moniker based on the common prefix of pmkThis and pmkOther. When successful, the function has called AddRef on the moniker and the caller is responsible for calling Release. If an error occurs, the supplied interface pointer value is NULL.
%inst
Creates a new moniker based on the common prefix that this moniker
(the one comprising the data of this moniker object) shares with
another moniker.

[戻り値]
This function can return the standard return values E_OUTOFMEMORY and
E_UNEXPECTED, as well as the following values.
This doc was truncated.

[備考]
Your implementation of IMoniker::CommonPrefixWith should first check
whether the other moniker is of a type that you recognize and handle
in a special way. If not, you should call MonikerCommonPrefixWith,
passing itself as pmkThis and the other moniker as pmkOther.
MonikerCommonPrefixWith correctly handles the cases where either
moniker is a generic composite.
You should call this function only if pmkThis and pmkOther are both
absolute monikers (where an absolute moniker is either a file moniker
or a generic composite whose leftmost component is a file moniker,
and where the file moniker represents an absolute path). Do not call
this function on relative monikers.


%index
MonikerRelativePathTo
Provides a moniker that, when composed onto the end of the first specified moniker (or one with a similar structure), yields the second specified moniker.
%group
Win32 ole32
%prm
pmkSrc, pmkDest, ppmkRelPath, dwReserved
pmkSrc : [var] A pointer to the IMoniker interface on the moniker that, when composed with the relative moniker to be created, produces pmkDest. This moniker identifies the "source" of the relative moniker to be created.
pmkDest : [var] A pointer to the IMoniker interface on the moniker to be expressed relative to pmkSrc. This moniker identifies the destination of the relative moniker to be created.
ppmkRelPath : [var] The address of an IMoniker* pointer variable that receives the interface pointer to the new relative moniker. When successful, the function has called AddRef on the moniker and the caller is responsible for calling Release. If an error occurs, the interface pointer value is NULL.
dwReserved : [int] This parameter is reserved and must be nonzero.
%inst
Provides a moniker that, when composed onto the end of the first
specified moniker (or one with a similar structure), yields the
second specified moniker.

[戻り値]
This function can return the standard return values E_INVALIDARG,
E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
This doc was truncated.

[備考]
Your implementation of IMoniker::RelativePathTo should first check
whether the other moniker is of a type you recognize and handle in a
special way. If not, you should call MonikerRelativePathTo, passing
itself as pmkThis and the other moniker as pmkOther.
MonikerRelativePathTo correctly handles the cases where either
moniker is a generic composite.
You should call this function only if pmkSrc and pmkDest are both
absolute monikers, where an absolute moniker is either a file moniker
or a generic composite whose leftmost component is a file moniker,
and where the file moniker represents an absolute path. Do not call
this function on relative monikers.


%index
OleBuildVersion
This function is obsolete.
%group
Win32 ole32
%prm

%inst
This function is obsolete.

[戻り値]
Obsolete.


%index
OleConvertIStorageToOLESTREAM
The OleConvertIStorageToOLESTREAM function converts the specified storage object from OLE 2 structured storage to the OLE 1 storage object model but does not include the presentation data. This is one of several compatibility functions.
%group
Win32 ole32
%prm
pstg, lpolestream
pstg : [var] Pointer to the IStorage interface on the storage object to be converted to an OLE 1 storage.
lpolestream : [var] Pointer to an OLE 1 stream structure where the persistent representation of the object is saved using the OLE 1 storage model.
%inst
The OleConvertIStorageToOLESTREAM function converts the specified
storage object from OLE 2 structured storage to the OLE 1 storage
object model but does not include the presentation data. This is one
of several compatibility functions.

[戻り値]
This function supports the standard return value E_INVALIDARG, in
addition to the following:

[備考]
This function converts an OLE 2 storage object to OLE 1 format. The
OLESTREAM structure code implemented for OLE 1 must be available. On
entry, the stream to which lpolestm points should be created and
positioned just as it would be for an OleSaveToStream call. On exit,
the stream contains the persistent representation of the object using
OLE 1 storage. Note Paintbrush objects are dealt with differently
from other objects because their native data is in device-independent
bitmap (DIB) format. When Paintbrush objects are converted using
OleConvertIStorageToOLESTREAM, no presentation data is added to the
OLESTREAM structure. To include presentation data, use the
OleConvertIStorageToOLESTREAMEx function instead.


%index
OleConvertIStorageToOLESTREAMEx
The OleConvertIStorageToOLESTREAMEx function converts the specified storage object from OLE 2 structured storage to the OLE 1 storage object model, including the presentation data.
%group
Win32 ole32
%prm
pstg, cfFormat, lWidth, lHeight, dwSize, pmedium, polestm
pstg : [var] Pointer to the IStorage interface on the storage object to be converted to an OLE 1 storage.
cfFormat : [int] Format of the presentation data. May be NULL, in which case the lWidth, lHeight, dwSize, and pmedium parameters are ignored.
lWidth : [int] Width of the object presentation data in HIMETRIC units.
lHeight : [int] Height of the object presentation data in HIMETRIC units.
dwSize : [int] Size of the data, in bytes, to be converted.
pmedium : [var] Pointer to the STGMEDIUM structure for the serialized data to be converted.
polestm : [var] Pointer to a stream where the persistent representation of the object is saved using the OLE 1 storage model.
%inst
The OleConvertIStorageToOLESTREAMEx function converts the specified
storage object from OLE 2 structured storage to the OLE 1 storage
object model, including the presentation data.

[戻り値]
This function supports the standard return value E_INVALIDARG, in
addition to the following:

[備考]
The OleConvertIStorageToOLESTREAMEx function converts an OLE 2
storage object to OLE 1 format. It differs from the
OleConvertIStorageToOLESTREAM function in that the
OleConvertIStorageToOLESTREAMEx function also passes the presentation
data to the OLE 1 storage object, whereas the
OleConvertIStorageToOLESTREAM function does not. Because
OleConvertIStorageToOLESTREAMEx can specify which presentation data
to convert, it can be used by applications that do not use OLE
default caching resources but do use OLE's conversion resources. The
value of the tymed member of STGMEDIUM must be either TYMED_HGLOBAL
or TYMED_ISTREAM; refer to the TYMED enumeration for more
information. The medium is not released by the
OleConvertIStorageToOLESTREAMEx function.


%index
OleConvertOLESTREAMToIStorage
Converts the specified object from the OLE 1 storage model to an OLE 2 structured storage object without specifying presentation data.
%group
Win32 ole32
%prm
lpolestream, pstg, ptd
lpolestream : [var] A pointer to a stream that contains the persistent representation of the object in the OLE 1 storage format.
pstg : [var] A pointer to the IStorage interface on the OLE 2 structured storage object.
ptd : [var] A pointer to the DVTARGETDEVICE structure that specifies the target device for which the OLE 1 object is rendered.
%inst
Converts the specified object from the OLE 1 storage model to an OLE
2 structured storage object without specifying presentation data.

[戻り値]
This function supports the standard return value E_INVALIDARG, in
addition to the following:

[備考]
This function converts an OLE 1 object to an OLE 2 structured storage
object. Use this function to update OLE 1 objects to OLE 2 objects
when a new version of the object application supports OLE 2. On
entry, the lpolestm parameter should be created and positioned just
as it would be for an OleLoadFromStream function call. On exit, the
lpolestm parameter is positioned just as it would be on exit from an
OleLoadFromStream function, and the pstg parameter contains the
uncommitted persistent representation of the OLE 2 storage object.
For OLE 1 objects that use native data for their presentation, the
OleConvertOLESTREAMToIStorage function returns
CONVERT10_S_NO_PRESENTATION. On receiving this return value, callers
should call IOleObject::Update to get the presentation data so it can
be written to storage. Applications that do not use the OLE default
caching resources, but use the conversion resources, can use an
alternate function, OleConvertOLESTREAMToIStorageEx, which can
specify the presentation data to convert. In the
OleConvertOLESTREAMToIStorageEx function, the presentation data read
from the OLESTREAM structure is passed out and the newly created OLE
2 storage object does not contain a presentation stream. The
following procedure describes the conversion process using
OleConvertOLESTREAMToIStorage. Converting an OLE 1 object to an OLE 2
storage object
This doc was truncated.


%index
OleConvertOLESTREAMToIStorage2
(no summary)
%group
Win32 ole32
%prm
lpolestream, pstg, ptd, opt, pvCallbackContext, pQueryConvertOLELinkCallback
lpolestream : [var] 
pstg : [var] 
ptd : [var] 
opt : [int] 
pvCallbackContext : [intptr] 
pQueryConvertOLELinkCallback : [int] 
%inst



%index
OleConvertOLESTREAMToIStorageEx
The OleConvertOLESTREAMToIStorageEx function converts the specified object from the OLE 1 storage model to an OLE 2 structured storage object including presentation data. This is one of several compatibility functions.
%group
Win32 ole32
%prm
polestm, pstg, pcfFormat, plwWidth, plHeight, pdwSize, pmedium
polestm : [var] Pointer to the stream that contains the persistent representation of the object in the OLE 1 storage format.
pstg : [var] Pointer to the OLE 2 structured storage object.
pcfFormat : [var] Pointer to where the format of the presentation data is returned. May be NULL, indicating the absence of presentation data.
plwWidth : [var] Pointer to where the width value (in HIMETRIC) of the presentation data is returned.
plHeight : [var] Pointer to where the height value (in HIMETRIC) of the presentation data is returned.
pdwSize : [var] Pointer to where the size in bytes of the converted data is returned.
pmedium : [var] Pointer to where the STGMEDIUM structure for the converted serialized data is returned.
%inst
The OleConvertOLESTREAMToIStorageEx function converts the specified
object from the OLE 1 storage model to an OLE 2 structured storage
object including presentation data. This is one of several
compatibility functions.

[戻り値]
This function returns HRESULT.

[備考]
This function converts an OLE 1 object to an OLE 2 structured storage
object. You can use this function to update OLE 1 objects to OLE 2
objects when a new version of the object application supports OLE 2.
This function differs from the OleConvertOLESTREAMToIStorage function
in that the presentation data read from the OLESTREAM structure is
passed out and the newly created OLE 2 storage object does not
contain a presentation stream. Since this function can specify which
presentation data to convert, it can be used by applications that do
not use OLE's default caching resources but do use the conversion
resources. The tymed member of STGMEDIUM can only be TYMED_NULL or
TYMED_ISTREAM. If it is TYMED_NULL, the data will be returned in a
global handle through the hGlobal member of STGMEDIUM, otherwise data
will be written into the pstm member of this structure.


%index
OleConvertOLESTREAMToIStorageEx2
(no summary)
%group
Win32 ole32
%prm
polestm, pstg, pcfFormat, plwWidth, plHeight, pdwSize, pmedium, opt, pvCallbackContext, pQueryConvertOLELinkCallback
polestm : [var] 
pstg : [var] 
pcfFormat : [var] 
plwWidth : [var] 
plHeight : [var] 
pdwSize : [var] 
pmedium : [var] 
opt : [int] 
pvCallbackContext : [intptr] 
pQueryConvertOLELinkCallback : [int] 
%inst



%index
OleCreate
The OleCreate function (ole2.h) creates an embedded object identified by a CLSID. It can implement the menu item that allows the end user to insert an object.
%group
Win32 ole32
%prm
rclsid, riid, renderopt, pFormatEtc, pClientSite, pStg, ppvObj
rclsid : [var] CLSID of the embedded object that is to be created.
riid : [var] Reference to the identifier of the interface, usually IID_IOleObject (defined in the OLE headers as the interface identifier for IOleObject), through which the caller will communicate with the new object.
renderopt : [int] A value from the enumeration OLERENDER, indicating the locally cached drawing capabilities the newly created object is to have. The OLERENDER value chosen affects the possible values for the pFormatEtc parameter.
pFormatEtc : [var] Depending on which of the OLERENDER flags is used as the value of renderopt, pointer to one of the FORMATETC enumeration values. Refer to the OLERENDER enumeration for restrictions. This parameter, along with the renderopt parameter, specifies what the new object can cache initially.
pClientSite : [var] If you want OleCreate to call IOleObject::SetClientSite, pointer to the IOleClientSite interface on the container. The value may be NULL, in which case you must specifically call IOleObject::SetClientSite before attempting operations.
pStg : [var] Pointer to an instance of the IStorage interface on the storage object. This parameter may not be NULL.
ppvObj : [var] Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *ppvObject contains the requested interface pointer.
%inst
The OleCreate function (ole2.h) creates an embedded object identified
by a CLSID. It can implement the menu item that allows the end user
to insert an object.

[戻り値]
This function returns S_OK on success and supports the standard
return value E_OUTOFMEMORY.
This doc was truncated.

[備考]
The OleCreate function creates a new embedded object, and is
typically called to implement the menu item Insert New Object. When
OleCreate returns, the object it has created is blank (contains no
data), unless renderopt is OLERENDER_DRAW or OLERENDER_FORMAT, and is
loaded. Containers typically then call the OleRun function or
IOleObject::DoVerb to show the object for initial editing.
The rclsid parameter specifies the CLSID of the requested object.
CLSIDs of registered objects are stored in the system registry. When
an application user selects Insert Object, a selection box allows the
user to select the type of object desired from those in the registry.
When OleCreate is used to implement the Insert Object menu item, the
CLSID associated with the selected item is assigned to the rclsid
parameter of OleCreate.
The riid parameter specifies the interface the client will use to
communicate with the new object. Upon successful return, the
ppvObject parameter holds a pointer to the requested interface.
The created object's cache contains information that allows a
presentation of a contained object when the container is opened.
Information about what should be cached is passed in the renderopt
and pFormatetc values. When OleCreate returns, the created object's
cache is not necessarily filled. Instead, the cache is filled the
first time the object enters the running state. The caller can add
additional cache control with a call to IOleCache::Cache after the
return of OleCreate and before the object is run. If renderopt is
OLERENDER_DRAW or OLERENDER_FORMAT, OleCreate requires that the
object support the IOleCache interface. There is no such requirement
for any other value of renderopt. If pClientSite is non-NULL,
OleCreate calls IOleObject::SetClientSite through the pClientSite
pointer. IOleClientSite is the primary interface by which an object
requests services from its container. If pClientSite is NULL, you
must make a specific call to IOleObject::SetClientSite before
attempting any operations.


%index
OleCreateDefaultHandler
Creates a new instance of the default embedding handler. This instance is initialized so it creates a local server when the embedded object enters the running state.
%group
Win32 ole32
%prm
clsid, pUnkOuter, riid, lplpObj
clsid : [var] CLSID identifying the OLE server to be loaded when the embedded object enters the running state.
pUnkOuter : [var] Pointer to the controlling IUnknown interface if the handler is to be aggregated; NULL if it is not to be aggregated.
riid : [var] Reference to the identifier of the interface, usually IID_IOleObject, through which the caller will communicate with the handler.
lplpObj : [var] Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *ppvObj contains the requested interface pointer on the newly created handler.
%inst
Creates a new instance of the default embedding handler. This
instance is initialized so it creates a local server when the
embedded object enters the running state.

[戻り値]
This function returns NOERROR on success and supports the standard
return value E_OUTOFMEMORY.

[備考]
OleCreateDefaultHandler creates a new instance of the default
embedding handler, initialized so it creates a local server
identified by the clsid parameter when the embedded object enters the
running state. If you are writing a handler and want to use the
services of the default handler, call OleCreateDefaultHandler. OLE
also calls it internally when the CLSID specified in an object
creation call is not registered.
If the given class does not have a special handler, a call to
OleCreateDefaultHandler produces the same results as a call to the
CoCreateInstance function with the class context parameter assigned
the value CLSCTX_INPROC_HANDLER.


%index
OleCreateEmbeddingHelper
Creates an OLE embedding helper object using application-supplied code aggregated with pieces of the OLE default object handler. This helper object can be created and used in a specific context and role, as determined by the caller.
%group
Win32 ole32
%prm
clsid, pUnkOuter, flags, pCF, riid, lplpObj
clsid : [var] CLSID of the class to be helped.
pUnkOuter : [var] If the embedding helper is to be aggregated, pointer to the outer object's controlling IUnknown interface. If it is not to be aggregated, although this is rare, the value should be NULL.
flags : [int] DWORD containing flags that specify the role and creation context for the embedding helper. For legal values, see the following Remarks section.
pCF : [var] Pointer to the IClassFactory interface on the class object the function uses to create the secondary object. In some situations, this value may be NULL. For more information, see the following Remarks section.
riid : [var] Reference to the identifier of the interface desired by the caller.
lplpObj : [var] Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *ppvObj contains the requested interface pointer on the newly created embedding helper.
%inst
Creates an OLE embedding helper object using application-supplied
code aggregated with pieces of the OLE default object handler. This
helper object can be created and used in a specific context and role,
as determined by the caller.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
The OleCreateEmbeddingHelper function creates an object that supports
the same interface implementations found in the default handler, but
which has additional hooks that allow it to be used more generally
than just as a handler object. The following two calls produce the
same result:
This doc was truncated.


%index
OleCreateEx
Extends OleCreate functionality by supporting more efficient instantiation of objects in containers requiring caching of multiple presentation formats or data, instead of the single format supported by OleCreate.
%group
Win32 ole32
%prm
rclsid, riid, dwFlags, renderopt, cFormats, rgAdvf, rgFormatEtc, lpAdviseSink, rgdwConnection, pClientSite, pStg, ppvObj
rclsid : [var] Identifies the class of the object to create.
riid : [var] Reference to the identifier of the interface of the object to return.
dwFlags : [int] This value can be 0 or OLECREATE_LEAVERUNNING    (0x00000001).
renderopt : [int] Value taken from the OLERENDER enumeration.
cFormats : [int] When renderopt is OLERENDER_FORMAT, indicates the number of FORMATETC structures in the rgFormatEtc array, which must be at least one. In all other cases, this parameter must be zero.
rgAdvf : [var] When renderopt is OLERENDER_FORMAT, points to an array of cFormats DWORD elements, each of which is a combination of values from the ADVF enumeration. Each element of this array is passed in as the advf parameter to a call to either IOleCache::Cache or IDataObject::DAdvise, depending on whether pAdviseSink is NULL or non-NULL (see below). In all other cases, this parameter must be NULL.
rgFormatEtc : [var] When renderopt is OLERENDER_FORMAT, points to an array of cFormats FORMATETC structures. When pAdviseSink is NULL, each element of this array is passed as the pFormatEtc parameter to a call to the object's IOleCache::Cache. This populates the data and presentation cache managed by the objects in-process handler (typically the default handler) with presentation or other cacheable data. When pAdviseSink is non-NULL, each element of this array is passed as the pFormatEtc parameter to a call to IDataObject::DAdvise. This allows the caller (typically an OLE Container) to do its own caching or processing of data received from the object. In all other cases, this parameter must be NULL.
lpAdviseSink : [var] When renderopt is OLERENDER_FORMAT, may be either a valid IAdviseSink pointer, indicating custom caching or processing of data advises, or NULL, indicating default caching of data formats. In all other cases, this parameter must be NULL.
rgdwConnection : [var] Location to return the array of dwConnection values returned when the pAdviseSink interface is registered for each advisory connection using IDataObject::DAdvise, or NULL if the returned advisory connections are not needed. Must be NULL, if pAdviseSink is NULL.
pClientSite : [var] Pointer to the primary interface through which the object will request services from its container. This parameter may be NULL, in which case it is the caller's responsibility to establish the client site as soon as possible using IOleObject::SetClientSite.
pStg : [var] Pointer to the storage to use for the object and any default data or presentation caching established for it. This parameter may not be NULL.
ppvObj : [var] Address of output pointer variable that receives the interface pointer requested in riid. Upon successful return, *ppvObj contains the requested interface pointer on the newly created object.
%inst
Extends OleCreate functionality by supporting more efficient
instantiation of objects in containers requiring caching of multiple
presentation formats or data, instead of the single format supported
by OleCreate.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
The following call to OleCreate:
This doc was truncated.


%index
OleCreateFromData
Creates an embedded object from a data transfer object retrieved either from the clipboard or as part of an OLE drag-and-drop operation. It is intended to be used to implement a paste from an OLE drag-and-drop operation.
%group
Win32 ole32
%prm
pSrcDataObj, riid, renderopt, pFormatEtc, pClientSite, pStg, ppvObj
pSrcDataObj : [var] Pointer to the IDataObject interface on the data transfer object that holds the data from which the object is created.
riid : [var] Reference to the identifier of the interface the caller later uses to communicate with the new object (usually IID_IOleObject, defined in the OLE headers as the interface identifier for IOleObject).
renderopt : [int] Value from the enumeration OLERENDER that indicates the locally cached drawing or data-retrieval capabilities the newly created object is to have. Additional considerations are described in the following Remarks section.
pFormatEtc : [var] Pointer to a value from the enumeration OLERENDER that indicates the locally cached drawing or data-retrieval capabilities the newly created object is to have. The OLERENDER value chosen affects the possible values for the pFormatEtc parameter.
pClientSite : [var] Pointer to an instance of IOleClientSite, the primary interface through which the object will request services from its container. This parameter can be NULL.
pStg : [var] Pointer to the IStorage interface on the storage object. This parameter may not be NULL.
ppvObj : [var] Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *ppvObj contains the requested interface pointer on the newly created object.
%inst
Creates an embedded object from a data transfer object retrieved
either from the clipboard or as part of an OLE drag-and-drop
operation. It is intended to be used to implement a paste from an OLE
drag-and-drop operation.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
The OleCreateFromData function creates an embedded object from a data
transfer object supporting the IDataObject interface. The data object
in this case is either the type retrieved from the clipboard with a
call to the OleGetClipboard function or is part of an OLE
drag-and-drop operation (the data object is passed to a call to
IDropTarget::Drop). If either the FileName or FileNameW clipboard
format (CF_FILENAME) is present in the data transfer object, and
CF_EMBEDDEDOBJECT or CF_EMBEDSOURCE do not exist, OleCreateFromData
first attempts to create a package containing the indicated file.
Generally, it takes the first available format. If OleCreateFromData
cannot create a package, it tries to create an object using the
CF_EMBEDDEDOBJECT format. If that format is not available,
OleCreateFromData tries to create it with the CF_EMBEDSOURCE format.
If neither of these formats is available and the data transfer object
supports the IPersistStorage interface, OleCreateFromData calls the
object's IPersistStorage::Save to have the object save itself.
If an existing linked object is selected, then copied, it appears on
the clipboard as just another embeddable object. Consequently, a
paste operation that invokes OleCreateFromData may create a linked
object. After the paste operation, the container should call the
QueryInterface function, requesting IID_IOleLink (defined in the OLE
headers as the interface identifier for IOleLink), to determine if a
linked object was created.
Use the renderopt and pFormatetc parameters to control the caching
capability of the newly created object. For general information about
using the interaction of these parameters to determine what is to be
cached, refer to the OLERENDER enumeration. There are, however, some
additional specific effects of these parameters on the way
OleCreateFromData initializes the cache.
When OleCreateFromData uses either the CF_EMBEDDEDOBJECT or the
CF_EMBEDSOURCE clipboard format to create the embedded object, the
main difference between the two is where the cache-initialization
data is stored:
This doc was truncated.


%index
OleCreateFromDataEx
Extends OleCreateFromData functionality by supporting more efficient instantiation of objects in containers requiring caching of multiple formats of presentation or data, instead of the single format supported by OleCreateFromData.
%group
Win32 ole32
%prm
pSrcDataObj, riid, dwFlags, renderopt, cFormats, rgAdvf, rgFormatEtc, lpAdviseSink, rgdwConnection, pClientSite, pStg, ppvObj
pSrcDataObj : [var] Pointer to the data transfer object holding the new data used to create the new object. (see OleCreateFromData).
riid : [var] Reference to the identifier of the interface of the object to return.
dwFlags : [int] This parameter can be 0 or OLECREATE_LEAVERUNNING (0x00000001).
renderopt : [int] Value taken from the OLERENDER enumeration.
cFormats : [int] When renderopt is OLERENDER_FORMAT, indicates the number of FORMATETC structures in the rgFormatEtc array, which must be at least one. In all other cases, this parameter must be zero.
rgAdvf : [var] When renderopt is OLERENDER_FORMAT, points to an array of DWORD elements, each of which is a combination of values from the ADVF enumeration. Each element of this array is passed in as the advf parameter to a call to either IOleCache::Cache or IDataObject::DAdvise, depending on whether pAdviseSink is NULL or non-NULL (see below). In all other cases, this parameter must be NULL.
rgFormatEtc : [var] When renderopt is OLERENDER_FORMAT, points to an array of FORMATETC structures. When pAdviseSink is NULL, each element of this array is passed as the pFormatEtc parameter to a call to the object's IOleCache::Cache. This populates the data and presentation cache managed by the object's in-process handler (typically the default handler) with presentation or other cacheable data. When pAdviseSink is non-NULL, each element of this array is passed as the pFormatEtc parameter to a call to IDataObject::DAdvise. This allows the caller (typically an OLE Container) to do its own caching or processing of data received from the object.
lpAdviseSink : [var] When renderopt is OLERENDER_FORMAT, may be either a valid IAdviseSink pointer, indicating custom caching or processing of data advises, or NULL, indicating default caching of data formats.
rgdwConnection : [var] Location to return the array of dwConnection values returned when the IAdviseSink interface is registered for each advisory connection using IDataObject::DAdvise, or NULL if the returned advisory connections are not needed. This parameter must be NULL if pAdviseSink is NULL.
pClientSite : [var] Pointer to the primary interface through which the object will request services from its container. This parameter may be NULL, in which case it is the caller's responsibility to establish the client site as soon as possible using IOleObject::SetClientSite.
pStg : [var] Pointer to the storage to use for the object and any default data or presentation caching established for it.
ppvObj : [var] Address of output pointer variable that receives the interface pointer requested in riid. Upon successful return, *ppvObj contains the requested interface pointer on the newly created object.
%inst
Extends OleCreateFromData functionality by supporting more efficient
instantiation of objects in containers requiring caching of multiple
formats of presentation or data, instead of the single format
supported by OleCreateFromData.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
The following call to OleCreateFromData:
This doc was truncated.


%index
OleCreateFromFile
The OleCreateFromFile function (ole2.h) creates an embedded object from the contents of a named file.
%group
Win32 ole32
%prm
rclsid, lpszFileName, riid, renderopt, lpFormatEtc, pClientSite, pStg, ppvObj
rclsid : [var] This parameter is reserved and must be CLSID_NULL.
lpszFileName : [wstr] Pointer to a string specifying the full path of the file from which the object should be initialized.
riid : [var] Reference to the identifier of the interface the caller later uses to communicate with the new object (usually IID_IOleObject, defined in the OLE headers as the interface ID of IOleObject).
renderopt : [int] Value from the enumeration OLERENDER that indicates the locally cached drawing or data-retrieval capabilities the newly created object is to have. The OLERENDER value chosen affects the possible values for the lpFormatEtc parameter.
lpFormatEtc : [var] Depending on which of the OLERENDER flags is used as the value of renderopt, pointer to one of the FORMATETC enumeration values. Refer also to the OLERENDER enumeration for restrictions.
pClientSite : [var] Pointer to an instance of IOleClientSite, the primary interface through which the object will request services from its container. This parameter can be NULL.
pStg : [var] Pointer to the IStorage interface on the storage object. This parameter cannot be NULL.
ppvObj : [var] Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *ppvObj contains the requested interface pointer on the newly created object.
%inst
The OleCreateFromFile function (ole2.h) creates an embedded object
from the contents of a named file.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
The OleCreateFromFile function creates a new embedded object from the
contents of a named file. If the ProgID in the registration database
contains the PackageOnFileDrop key, it creates a package. If not, the
function calls the GetClassFile function to get the CLSID associated
with the lpszFileName parameter, and then creates an OLE 2-embedded
object associated with that CLSID. The rclsid parameter of
OleCreateFromFile will always be ignored, and should be set to
CLSID_NULL. As for other OleCreateXxx functions, the newly created
object is not shown to the user for editing, which requires a DoVerb
operation. It is used to implement insert file operations.


%index
OleCreateFromFileEx
Extends OleCreateFromFile functionality by supporting more efficient instantiation of objects in containers requiring caching of multiple presentation formats or data, instead of the single format supported by OleCreateFromFile.
%group
Win32 ole32
%prm
rclsid, lpszFileName, riid, dwFlags, renderopt, cFormats, rgAdvf, rgFormatEtc, lpAdviseSink, rgdwConnection, pClientSite, pStg, ppvObj
rclsid : [var] This parameter is reserved and must be CLSID_NULL.
lpszFileName : [wstr] Pointer to the name of the file from which the new object should be initialized.
riid : [var] Reference to the identifier of the interface of the object to return.
dwFlags : [int] This parameter can be 0 or OLECREATE_LEAVERUNNING (0x00000001).
renderopt : [int] Value taken from the OLERENDER enumeration.
cFormats : [int] When renderopt is OLERENDER_FORMAT, indicates the number of FORMATETC structures in the rgFormatEtc array, which must be at least one. In all other cases, this parameter must be zero.
rgAdvf : [var] When renderopt is OLERENDER_FORMAT, points to an array of DWORD elements, each of which is a combination of values from the ADVF enumeration. Each element of this array is passed in as the advf parameter to a call to either IOleCache::Cache or IDataObject::DAdvise, depending on whether pAdviseSink is NULL or non-NULL (see below). In all other cases, this parameter must be NULL.
rgFormatEtc : [var] When renderopt is OLERENDER_FORMAT, points to an array of FORMATETC structures. When pAdviseSink is NULL, each element of this array is passed as the pFormatEtc parameter to a call to the object's IOleCache::Cache. This populates the data and presentation cache managed by the objects in-process handler (typically the default handler) with presentation or other cacheable data. When pAdviseSink is non-NULL, each element of this array is passed as the pFormatEtc parameter to a call to IDataObject::DAdvise. This allows the caller (typically an OLE Container) to do its own caching or processing of data received from the object.
lpAdviseSink : [var] When renderopt is OLERENDER_FORMAT, may be either a valid IAdviseSink pointer, indicating custom caching or processing of data advises, or NULL, indicating default caching of data formats.
rgdwConnection : [var] Location to return the array of dwConnection values returned when the pAdviseSink interface is registered for each advisory connection using IDataObject::DAdvise, or NULL if the returned advisory connections are not needed. This parameter must be NULL if pAdviseSink is NULL.
pClientSite : [var] Pointer to the primary interface through which the object will request services from its container. This parameter may be NULL, in which case it is the caller's responsibility to establish the client site as soon as possible using IOleObject::SetClientSite.
pStg : [var] Pointer to the storage to use for the object and any default data or presentation caching established for it.
ppvObj : [var] Address of output pointer variable that receives the interface pointer requested in riid. Upon successful return, *ppvObj contains the requested interface pointer on the newly created object.
%inst
Extends OleCreateFromFile functionality by supporting more efficient
instantiation of objects in containers requiring caching of multiple
presentation formats or data, instead of the single format supported
by OleCreateFromFile.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
The following call to OleCreateFromFile:
This doc was truncated.


%index
OleCreateLink
Creates an OLE compound-document linked object.
%group
Win32 ole32
%prm
pmkLinkSrc, riid, renderopt, lpFormatEtc, pClientSite, pStg, ppvObj
pmkLinkSrc : [var] Pointer to the IMoniker interface on the moniker that can be used to locate the source of the linked object.
riid : [var] Reference to the identifier of the interface the caller later uses to communicate with the new object (usually IID_IOleObject, defined in the OLE headers as the interface identifier for IOleObject).
renderopt : [int] Specifies a value from the enumeration OLERENDER that indicates the locally cached drawing or data-retrieval capabilities the newly created object is to have. Additional considerations are described in the Remarks section below.
lpFormatEtc : [var] Pointer to a value from the enumeration OLERENDER that indicates the locally cached drawing or data-retrieval capabilities the newly created object is to have. The OLERENDER value chosen affects the possible values for the lpFormatEtc parameter.
pClientSite : [var] Pointer to an instance of IOleClientSite, the primary interface through which the object will request services from its container. This parameter can be NULL.
pStg : [var] Pointer to the IStorage interface on the storage object. This parameter cannot be NULL.
ppvObj : [var] Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *ppvObj contains the requested interface pointer on the newly created object.
%inst
Creates an OLE compound-document linked object.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
Call OleCreateLink to allow a container to create a link to an
object.


%index
OleCreateLinkEx
Extends OleCreateLink functionality by supporting more efficient instantiation of objects in containers requiring caching of multiple formats of presentations or data, instead of the single format supported by OleCreateLink.
%group
Win32 ole32
%prm
pmkLinkSrc, riid, dwFlags, renderopt, cFormats, rgAdvf, rgFormatEtc, lpAdviseSink, rgdwConnection, pClientSite, pStg, ppvObj
pmkLinkSrc : [var] Pointer to a moniker to the object to create a link to.
riid : [var] Reference to the identifier of the interface of the object to return.
dwFlags : [int] This parameter can be 0 or OLECREATE_LEAVERUNNING (0x00000001).
renderopt : [int] Value taken from the OLERENDER enumeration.
cFormats : [int] When renderopt is OLERENDER_FORMAT, indicates the number of FORMATETC structures in the rgFormatEtc array, which must be at least one. In all other cases, this parameter must be zero.
rgAdvf : [var] When renderopt is OLERENDER_FORMAT, points to an array of DWORD elements, each of which is a combination of values from the ADVF enumeration. Each element of this array is passed in as the advf parameter to a call to either IOleCache::Cache or IDataObject::DAdvise, depending on whether pAdviseSink is NULL or non-NULL (see below). In all other cases, this parameter must be NULL.
rgFormatEtc : [var] When renderopt is OLERENDER_FORMAT, points to an array of FORMATETC structures. When pAdviseSink is NULL, each element of this array is passed as the pFormatEtc parameter to a call to the object's IOleCache::Cache. This populates the data and presentation cache managed by the objects in-process handler (typically the default handler) with presentation or other cacheable data. When pAdviseSink is non-NULL, each element of this array is passed as the pFormatEtc parameter to a call to IDataObject::DAdvise. This allows the caller (typically an OLE Container) to do its own caching or processing of data received from the object.
lpAdviseSink : [var] When renderopt is OLERENDER_FORMAT, may be either a valid IAdviseSink pointer, indicating custom caching or processing of data advises, or NULL, indicating default caching of data formats.
rgdwConnection : [var] Location to return the array of dwConnection values returned when the IAdviseSink interface is registered for each advisory connection using IDataObject::DAdvise, or NULL if the returned advisory connections are not needed. This parameter must be NULL if pAdviseSink is NULL.
pClientSite : [var] Pointer to the primary interface through which the object will request services from its container. This parameter can be NULL, in which case it is the caller's responsibility to establish the client site as soon as possible using IOleObject::SetClientSite.
pStg : [var] Pointer to the storage to use for the object and any default data or presentation caching established for it.
ppvObj : [var] Address of output pointer variable that receives the interface pointer requested in riid. Upon successful return, *ppvObj contains the requested interface pointer on the newly created object.
%inst
Extends OleCreateLink functionality by supporting more efficient
instantiation of objects in containers requiring caching of multiple
formats of presentations or data, instead of the single format
supported by OleCreateLink.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
The following call to OleCreateLink:
This doc was truncated.


%index
OleCreateLinkFromData
Creates a linked object from a data transfer object retrieved either from the clipboard or as part of an OLE drag-and-drop operation.
%group
Win32 ole32
%prm
pSrcDataObj, riid, renderopt, pFormatEtc, pClientSite, pStg, ppvObj
pSrcDataObj : [var] Pointer to the IDataObject interface on the data transfer object from which the linked object is to be created.
riid : [var] Reference to the identifier of interface the caller later uses to communicate with the new object (usually IID_IOleObject, defined in the OLE headers as the interface identifier for IOleObject).
renderopt : [int] Value from the enumeration OLERENDER that indicates the locally cached drawing or data-retrieval capabilities the newly created object is to have. Additional considerations are described in the following Remarks section.
pFormatEtc : [var] Pointer to a value from the enumeration OLERENDER that indicates the locally cached drawing or data-retrieval capabilities the newly created object is to have. The OLERENDER value chosen affects the possible values for the pFormatEtc parameter.
pClientSite : [var] Pointer to an instance of IOleClientSite, the primary interface through which the object will request services from its container. This parameter can be NULL.
pStg : [var] Pointer to the IStorage interface on the storage object. This parameter cannot be NULL.
ppvObj : [var] Address of pointer variable that receives the interface pointer requested in riid. Upon successful return,   ppvObj contains the requested interface pointer on the newly created object.
%inst
Creates a linked object from a data transfer object retrieved either
from the clipboard or as part of an OLE drag-and-drop operation.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
The OleCreateLinkFromData function is used to implement either a
paste-link or a drag-link operation. Its operation is similar to that
of the OleCreateFromData function, except that it creates a link, and
looks for different data formats. If the CF_LINKSOURCE format is not
present, and either the FileName or FileNameW clipboard format is
present in the data transfer object, OleCreateLinkFromData creates a
package containing the link to the indicated file.
You use the renderopt and pFormatetc parameters to control the
caching capability of the newly created object. For general
information on how to determine what is to be cached, refer to the
OLERENDER enumeration for a description of the interaction between
renderopt and pFormatetc. There are, however, some additional
specific effects of these parameters on the way OleCreateLinkFromData
initializes the cache, as follows.
This doc was truncated.


%index
OleCreateLinkFromDataEx
Extends OleCreateLinkFromData functionality by supporting more efficient instantiation of objects in containers requiring caching of multiple formats of presentations or data, instead of the single format supported by OleCreateLinkFromData.
%group
Win32 ole32
%prm
pSrcDataObj, riid, dwFlags, renderopt, cFormats, rgAdvf, rgFormatEtc, lpAdviseSink, rgdwConnection, pClientSite, pStg, ppvObj
pSrcDataObj : [var] Pointer to the data object to create a link object from.
riid : [var] Reference to the identifier of the interface of the object to return.
dwFlags : [int] This parameter can be 0 or OLECREATE_LEAVERUNNING (0x00000001).
renderopt : [int] Value taken from the OLERENDER enumeration.
cFormats : [int] When renderopt is OLERENDER_FORMAT, indicates the number of FORMATETC structures in the rgFormatEtc array, which must be at least one. In all other cases, this parameter must be zero.
rgAdvf : [var] When renderopt is OLERENDER_FORMAT, points to an array of DWORD elements, each of which is a combination of values from the ADVF enumeration. Each element of this array is passed in as the advf parameter to a call to either IOleCache::Cache or IDataObject::DAdvise, depending on whether pAdviseSink is NULL or non-NULL (see below). In all other cases, this parameter must be NULL.
rgFormatEtc : [var] When renderopt is OLERENDER_FORMAT, points to an array of FORMATETC structures. When pAdviseSink is NULL, each element of this array is passed as the pFormatEtc parameter to a call to the object's IOleCache::Cache. This populates the data and presentation cache managed by the objects in-process handler (typically the default handler) with presentation or other cacheable data. When pAdviseSink is non-NULL, each element of this array is passed as the pFormatEtc parameter to a call to IDataObject::DAdvise. This allows the caller (typically an OLE Container) to do its own caching or processing of data received from the object.
lpAdviseSink : [var] When renderopt is OLERENDER_FORMAT, may be either a valid IAdviseSink pointer, indicating custom caching or processing of data advises, or NULL, indicating default caching of data formats.
rgdwConnection : [var] Location to return the array of dwConnection values returned when the pAdviseSink interface is registered for each advisory connection using IDataObject::DAdvise, or NULL if the returned advisory connections are not needed. This parameter must be NULL if pAdviseSink is NULL.
pClientSite : [var] Pointer to the primary interface through which the object will request services from its container. This parameter can be NULL, in which case it is the caller's responsibility to establish the client site as soon as possible using IOleObject::SetClientSite.
pStg : [var] Pointer to the storage to use for the object and any default data or presentation caching established for it.
ppvObj : [var] Address of output pointer variable that receives the interface pointer requested in riid. Upon successful return, *ppvObj contains the requested interface pointer on the newly created object.
%inst
Extends OleCreateLinkFromData functionality by supporting more
efficient instantiation of objects in containers requiring caching of
multiple formats of presentations or data, instead of the single
format supported by OleCreateLinkFromData.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
The following call to OleCreateLinkFromData:
This doc was truncated.


%index
OleCreateLinkToFile
Creates an object that is linked to a file.
%group
Win32 ole32
%prm
lpszFileName, riid, renderopt, lpFormatEtc, pClientSite, pStg, ppvObj
lpszFileName : [wstr] Pointer to a string naming the source file to be linked to.
riid : [var] Reference to the identifier of the interface the caller later uses to communicate with the new object (usually IID_IOleObject, defined in the OLE headers as the interface identifier for IOleObject).
renderopt : [int] Value from the enumeration OLERENDER that indicates the locally cached drawing or data-retrieval capabilities the newly created object is to have. Additional considerations are described in the following Remarks section.
lpFormatEtc : [var] Pointer to a value from the enumeration OLERENDER that indicates the locally cached drawing or data-retrieval capabilities the newly created object is to have. The OLERENDER value chosen affects the possible values for the pFormatEtc parameter.
pClientSite : [var] Pointer to an instance of IOleClientSite, the primary interface through which the object will request services from its container. This parameter can be NULL.
pStg : [var] Pointer to the IStorage interface on the storage object. This parameter cannot be NULL.
ppvObj : [var] Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *ppvObj contains the requested interface pointer on the newly created object.
%inst
Creates an object that is linked to a file.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
The OleCreateLinkToFile function differs from the OleCreateLink
function because it can create links both to files that are not aware
of OLE, as well as to those that are using the Windows Packager.


%index
OleCreateLinkToFileEx
Extends OleCreateLinkToFile functionality by supporting more efficient instantiation of objects in containers requiring caching of multiple formats of presentations or data, instead of the single format supported by OleCreateLinkToFile.
%group
Win32 ole32
%prm
lpszFileName, riid, dwFlags, renderopt, cFormats, rgAdvf, rgFormatEtc, lpAdviseSink, rgdwConnection, pClientSite, pStg, ppvObj
lpszFileName : [wstr] Pointer to the name of the file to create a link to.
riid : [var] Reference to the identifier of the interface of the object to return.
dwFlags : [int] This parameter can be 0 or OLECREATE_LEAVERUNNING (0x00000001).
renderopt : [int] Value taken from the OLERENDER enumeration.
cFormats : [int] When renderopt is OLERENDER_FORMAT, indicates the number of FORMATETC structures in the rgFormatEtc array, which must be at least one. In all other cases, this parameter must be zero.
rgAdvf : [var] When renderopt is OLERENDER_FORMAT, points to an array of DWORD elements, each of which is a combination of values from the ADVF enumeration. Each element of this array is passed in as the advf parameter to a call to either IOleCache::Cache or IDataObject::DAdvise, depending on whether pAdviseSink is NULL or non-NULL (see below). In all other cases, this parameter must be NULL.
rgFormatEtc : [var] When renderopt is OLERENDER_FORMAT, points to an array of FORMATETC structures. When pAdviseSink is NULL, each element of this array is passed as the pFormatEtc parameter to a call to the object's IOleCache::Cache. This populates the data and presentation cache managed by the objects in-process handler (typically the default handler) with presentation or other cacheable data. When pAdviseSink is non-NULL, each element of this array is passed as the pFormatEtc parameter to a call to IDataObject::DAdvise. This allows the caller (typically an OLE Container) to do its own caching or processing of data received from the object.
lpAdviseSink : [var] When renderopt is OLERENDER_FORMAT, may be either a valid IAdviseSink pointer, indicating custom caching or processing of data advises, or NULL, indicating default caching of data formats.
rgdwConnection : [var] Location to return the array of dwConnection values returned when the IAdviseSink interface is registered for each advisory connection using IDataObject::DAdvise, or NULL if the returned advisory connections are not needed. This parameter must be NULL if pAdviseSink is NULL.
pClientSite : [var] Pointer to the primary interface through which the object will request services from its container. This parameter may be NULL, in which case it is the caller's responsibility to establish the client site as soon as possible using IOleObject::SetClientSite.
pStg : [var] Pointer to the storage to use for the object and any default data or presentation caching established for it.
ppvObj : [var] Address of output pointer variable that receives the interface pointer requested in riid. Upon successful return, *ppvObj contains the requested interface pointer on the newly created object.
%inst
Extends OleCreateLinkToFile functionality by supporting more
efficient instantiation of objects in containers requiring caching of
multiple formats of presentations or data, instead of the single
format supported by OleCreateLinkToFile.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
The following call to OleCreateLinkToFile:
This doc was truncated.


%index
OleCreateMenuDescriptor
Creates and returns an OLE menu descriptor (that is, an OLE-provided data structure that describes the menus) for OLE to use when dispatching menu messages and commands.
%group
Win32 ole32
%prm
hmenuCombined, lpMenuWidths
hmenuCombined : [intptr] Handle to the combined menu created by the object.
lpMenuWidths : [var] Pointer to an array of six LONG values giving the number of menus in each group.
%inst
Creates and returns an OLE menu descriptor (that is, an OLE-provided
data structure that describes the menus) for OLE to use when
dispatching menu messages and commands.

[戻り値]
Returns the handle to the descriptor, or NULL if insufficient memory
is available.

[備考]
The OleCreateMenuDescriptor function can be called by the object to
create a descriptor for the composite menu. OLE then uses this
descriptor to dispatch menu messages and commands. To free the shared
menu descriptor when it is no longer needed, the container should
call the companion helper function, OleDestroyMenuDescriptor.


%index
OleCreateStaticFromData
Creates a static object, that contains only a representation, with no native data, from a data transfer object.
%group
Win32 ole32
%prm
pSrcDataObj, iid, renderopt, pFormatEtc, pClientSite, pStg, ppvObj
pSrcDataObj : [var] Pointer to the IDataObject interface on the data transfer object that holds the data from which the object will be created.
iid : [var] Reference to the identifier of the interface with which the caller is to communicate with the new object (usually IID_IOleObject, defined in the OLE headers as the interface identifier for IOleObject).
renderopt : [int] Value from the enumeration OLERENDER indicating the locally cached drawing or data-retrieval capabilities that the container wants in the newly created component. It is an error to pass the render options OLERENDER_NONE or OLERENDER_ASIS to this function.
pFormatEtc : [var] Depending on which of the OLERENDER flags is used as the value of renderopt, may be a pointer to one of the FORMATETC enumeration values. Refer to the OLERENDER enumeration for restrictions.
pClientSite : [var] Pointer to an instance of IOleClientSite, the primary interface through which the object will request services from its container. This parameter can be NULL.
pStg : [var] Pointer to the IStorage interface for storage for the object. This parameter cannot be NULL.
ppvObj : [var] Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *ppvObj contains the requested interface pointer on the newly created object.
%inst
Creates a static object, that contains only a representation, with no
native data, from a data transfer object.

[戻り値]
This function returns S_OK on success.

[備考]
The OleCreateStaticFromData function can convert any object, as long
as it provides an IDataObject interface, to a static object. It is
useful in implementing the Convert To Picture option for OLE linking
or embedding.
Static objects can be created only if the source supports one of the
OLE-rendered clipboard formats: CF_METAFILEPICT, CF_DIB, or CF_
BITMAP, and CF_ENHMETAFILE.
You can also call OleCreateStaticFromData to paste a static object
from the clipboard. To determine whether an object is static, call
the OleQueryCreateFromData function, which returns OLE_S_STATIC if
one of CF_METAFILEPICT, CF_DIB, CF_BITMAP, or CF_ENHMETAFILE is
present and an OLE format is not present. This indicates that you
should call OleCreateStaticFromData rather than the OleCreateFromData
function to create the object.
The new static object is of class CLSID_StaticMetafile in the case of
CF_METAFILEPICT, CLSID_StaticDib in the case of CF_DIB or CF_BITMAP,
or CLSID_Picture_EnhMetafile in the case of CF_ENHMETAFILE. The
static object sets the OLEMISC_STATIC and OLE_CANTLINKINSIDE bits
returned from IOleObject::GetMiscStatus. The static object will have
the aspect DVASPECT_CONTENT and a LINDEX of -1. The pSrcDataObject is
still valid after OleCreateStaticFromData returns. It is the caller's
responsibility to free pSrcDataObject - OLE does not release it.
There cannot be more than one presentation stream in a static object.


%index
OleDestroyMenuDescriptor
Called by the container to free the shared menu descriptor allocated by the OleCreateMenuDescriptor function.
%group
Win32 ole32
%prm
holemenu
holemenu : [int] Handle to the shared menu descriptor that was returned by the OleCreateMenuDescriptor function.
%inst
Called by the container to free the shared menu descriptor allocated
by the OleCreateMenuDescriptor function.

[戻り値]
This function does not return a value.


%index
OleDoAutoConvert
Automatically converts an object to a new class if automatic conversion for that object class is set in the registry.
%group
Win32 ole32
%prm
pStg, pClsidNew
pStg : [var] A pointer to the IStorage interface on the storage object to be converted.
pClsidNew : [var] A pointer to the new CLSID for the object being converted. If there was no automatic conversion, this may be the same as the original class.
%inst
Automatically converts an object to a new class if automatic
conversion for that object class is set in the registry.

[戻り値]
This function can return the standard return values E_INVALIDARG,
E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
This doc was truncated.

[備考]
OleDoAutoConvert automatically converts an object if automatic
conversion has previously been specified in the registry by the
OleSetAutoConvert function. Object conversion means that the object
is permanently associated with a new CLSID. Automatic conversion is
typically specified by the setup program for a new version of an
object application, so that objects created by its older versions can
be automatically updated. The storage object must be in the unloaded
state when OleDoAutoConvert is called. A container application that
supports object conversion should call OleDoAutoConvert each time it
loads an object. If the container uses the OleLoad helper function,
it need not call OleDoAutoConvert explicitly because OleLoad calls it
internally. OleDoAutoConvert first determines whether any conversion
is required by calling the OleGetAutoConvert function, which, if no
conversion is required, returns S_OK. If the object requires
conversion, OleDoAutoConvert modifies and converts the storage object
by activating the new object application. The new object application
reads the existing data format, but saves the object in the new
native format for the object application. If the object to be
automatically converted is an OLE 1 object, the ItemName string is
stored in a stream called "\1Ole10ItemName." If this stream does not
exist, the object's item name is NULL.


%index
OleDraw
The OleDraw function (ole2.h) enables drawing objects more easily. You can use it instead of calling IViewObject::Draw directly.
%group
Win32 ole32
%prm
pUnknown, dwAspect, hdcDraw, lprcBounds
pUnknown : [var] Pointer to the IUnknown interface on the view object that is to be drawn.
dwAspect : [int] How the object is to be represented. Representations include content, an icon, a thumbnail, or a printed document. Possible values are taken from the DVASPECT enumeration.
hdcDraw : [intptr] Device context on which to draw. Cannot be a metafile device context.
lprcBounds : [var] Pointer to a RECT structure specifying the rectangle in which the object should be drawn. This parameter is converted to a RECTL structure and passed to IViewObject::Draw.
%inst
The OleDraw function (ole2.h) enables drawing objects more easily.
You can use it instead of calling IViewObject::Draw directly.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
The OleDraw helper function calls the QueryInterface method for the
object specified (pUnk), asking for an IViewObject interface on that
object. Then, OleDraw converts the RECT structure to a RECTL
structure, and calls IViewObject::Draw as follows:
This doc was truncated.


%index
OleDuplicateData
Duplicates the data found in the specified handle and returns a handle to the duplicated data. The source data is in a clipboard format. Use this function to help implement some of the data transfer interfaces such as IDataObject.
%group
Win32 ole32
%prm
hSrc, cfFormat, uiFlags
hSrc : [intptr] Handle of the source data.
cfFormat : [int] Clipboard format of the source data.
uiFlags : [int] Flags to be used to allocate global memory for the copied data. These flags are passed to GlobalAlloc. If the value of uiFlags is NULL, GMEM_MOVEABLE is used as a default flag.
%inst
Duplicates the data found in the specified handle and returns a
handle to the duplicated data. The source data is in a clipboard
format. Use this function to help implement some of the data transfer
interfaces such as IDataObject.

[戻り値]
On success the HANDLE to the source data is returned; on failure a
NULL value is returned.

[備考]
The CF_METAFILEPICT, CF_PALETTE, or CF_BITMAP formats receive special
handling. They are GDI handles and a new GDI object must be created
instead of just copying the bytes. All other formats are duplicated
byte-wise.


%index
OleFlushClipboard
Carries out the clipboard shutdown sequence. It also releases the IDataObject pointer that was placed on the clipboard by the OleSetClipboard function.
%group
Win32 ole32
%prm

%inst
Carries out the clipboard shutdown sequence. It also releases the
IDataObject pointer that was placed on the clipboard by the
OleSetClipboard function.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
OleFlushClipboard renders the data from a data object onto the
clipboard and releases the IDataObject pointer to the data object.
While the application that put the data object on the clipboard is
running, the clipboard holds only a pointer to the data object, thus
saving memory. If you are writing an application that acts as the
source of a clipboard operation, you can call the OleFlushClipboard
function when your application is closed, such as when the user exits
from your application. Calling OleFlushClipboard enables pasting and
paste-linking of OLE objects after application shutdown. Before
calling OleFlushClipboard, you can easily determine if your data is
still on the clipboard with a call to the OleIsCurrentClipboard
function. OleFlushClipboard leaves all formats offered by the data
transfer object, including the OLE 1 compatibility formats, on the
clipboard so they are available after application shutdown. In
addition to OLE 1 compatibility formats, these include all formats
offered on a global handle medium (all except for TYMED_FILE) and
formatted with a NULL target device. For example, if a data-source
application offers a particular clipboard format (say cfFOO) on an
IStorage object, and calls the OleFlushClipboard function, the
storage object is copied into memory and the hglobal memory handle is
put on the clipboard. To retrieve the information on the clipboard,
you can call the OleGetClipboard function from another application,
which creates a default data object, and the hglobal from the
clipboard again becomes a storage object. Furthermore, the FORMATETC
enumerator and the IDataObject::QueryGetData method would all
correctly indicate that the original clipboard format (cfFOO) is
again available on a TYMED_ISTORAGE. To empty the clipboard, call the
OleSetClipboard function specifying a NULL value for its parameter.
The application should call this when it closes if there is no need
to leave data on the clipboard after shutdown, or if data will be
placed on the clipboard using the standard Windows clipboard
functions.


%index
OleGetAutoConvert
Determines whether the registry is set for objects of a specified CLSID to be automatically converted to another CLSID, and if so, retrieves the new CLSID.
%group
Win32 ole32
%prm
clsidOld, pClsidNew
clsidOld : [var] The CLSID for the object.
pClsidNew : [var] A pointer to a variable to receive the new CLSID, if any. If auto-conversion for clsidOld is not set in the registry, clsidOld is returned. The pClsidNew parameter is never NULL.
%inst
Determines whether the registry is set for objects of a specified
CLSID to be automatically converted to another CLSID, and if so,
retrieves the new CLSID.

[戻り値]
This function can return the standard return values E_INVALIDARG,
E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
This doc was truncated.

[備考]
OleGetAutoConvert returns the AutoConvertTo entry in the registry for
the specified object. The AutoConvertTo subkey specifies whether
objects of a given CLSID are to be automatically converted to a new
CLSID. This is usually used to convert files created by older
versions of an application to the current version. If there is no
AutoConvertTo entry, this function returns the value of clsidOld. The
OleDoAutoConvert function calls OleGetAutoConvert to determine
whether the object specified is to be converted. A container
application that supports object conversion should call
OleDoAutoConvert each time it loads an object. If the container uses
the OleLoad helper function, it need not call OleDoAutoConvert
explicitly because OleLoad calls it internally. To set up automatic
conversion of a given class, you can call the OleSetAutoConvert
function (typically in the setup program of an application
installation). This function uses the AutoConvertTo subkey to tag a
class of objects for automatic conversion to a different class of
objects. This is a subkey of the CLSID key.


%index
OleGetClipboard
Retrieves a data object that you can use to access the contents of the clipboard.
%group
Win32 ole32
%prm
ppDataObj
ppDataObj : [var] Address of IDataObject pointer variable that receives the interface pointer to the clipboard data object.
%inst
Retrieves a data object that you can use to access the contents of
the clipboard.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
Caution Clipboard data is not trusted. Parse the data carefully
before using it in your application. If you are writing an
application that can accept data from the clipboard, call the
OleGetClipboard function to get a pointer to the IDataObject
interface that you can use to retrieve the contents of the clipboard.
OleGetClipboard handles three cases:
This doc was truncated.


%index
OleGetClipboardWithEnterpriseInfo
Enables Windows Information Protection enlightened applications to retrieve an IDataObject from the OLE Clipboard accompanied by Windows Information Protection information about the data and the source application.
%group
Win32 ole32
%prm
dataObject, dataEnterpriseId, sourceDescription, targetDescription, dataDescription
dataObject : [var] Address of IDataObject pointer variable that receives the interface pointer to the clipboard data object.
dataEnterpriseId : [var] The enterprise id of the application that set the clipboard data. If the data is personal, this will be an empty string.
sourceDescription : [var] The description of the application that set the clipboard.
targetDescription : [var] The         description of the caller's application to be used in auditing.
dataDescription : [var] The description of the data object to be used in auditing.
%inst
Enables Windows Information Protection enlightened applications to
retrieve an IDataObject from the OLE Clipboard accompanied by Windows
Information Protection information about the data and the source
application.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
Caution Clipboard data is not trusted. Parse the data carefully
before using it in your application. If you are writing an
application that can accept data from the clipboard, call the
OleGetClipboardWithEnterpriseInfo function to get a pointer to the
IDataObject interface that you can use to retrieve the contents of
the clipboard. OleGetClipboardWithEnterpriseInfo handles three cases:
This doc was truncated.


%index
OleGetIconOfClass
Returns a handle to a metafile containing an icon and a string label for the specified CLSID.
%group
Win32 ole32
%prm
rclsid, lpszLabel, fUseTypeAsLabel
rclsid : [var] The CLSID for which the icon and string are to be requested.
lpszLabel : [wstr] A pointer to the label for the icon.
fUseTypeAsLabel : [int] Indicates whether to use the user type string in the CLSID as the icon label.
%inst
Returns a handle to a metafile containing an icon and a string label
for the specified CLSID.

[戻り値]
If the function succeeds, the return value is a handle to a metafile
that contains and icon and label for the specified CLSID. Otherwise,
the function returns NULL.


%index
OleGetIconOfFile
Returns a handle to a metafile containing an icon and string label for the specified file name.
%group
Win32 ole32
%prm
lpszPath, fUseFileAsLabel
lpszPath : [wstr] A pointer to a file for which the icon and string are to be requested.
fUseFileAsLabel : [int] Indicates whether to use the file name as the icon label.
%inst
Returns a handle to a metafile containing an icon and string label
for the specified file name.

[戻り値]
If the function succeeds, the return value is a handle to a metafile
that contains and icon and label for the specified file. If there is
no CLSID in the registration database for the file, then the function
returns the string "Document". If lpszPath is NULL, the function
returns NULL.


%index
OleInitialize
Initializes the COM library on the current apartment, identifies the concurrency model as single-thread apartment (STA), and enables additional functionality described in the Remarks section below.
%group
Win32 ole32
%prm
pvReserved
pvReserved : [intptr] This parameter is reserved and must be NULL.
%inst
Initializes the COM library on the current apartment, identifies the
concurrency model as single-thread apartment (STA), and enables
additional functionality described in the Remarks section below.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
Applications that use the following functionality must call
OleInitialize before calling any other function in the COM library:
This doc was truncated.


%index
OleIsCurrentClipboard
Determines whether the data object pointer previously placed on the clipboard by the OleSetClipboard function is still on the clipboard.
%group
Win32 ole32
%prm
pDataObj
pDataObj : [var] Pointer to the IDataObject interface on the data object containing clipboard data of interest, which the caller previously placed on the clipboard.
%inst
Determines whether the data object pointer previously placed on the
clipboard by the OleSetClipboard function is still on the clipboard.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
OleIsCurrentClipboard only works for the data object used in the
OleSetClipboard function. It cannot be called by the consumer of the
data object to determine if the object that was on the clipboard at
the previous OleGetClipboard call is still on the clipboard.


%index
OleIsRunning
Determines whether a compound document object is currently in the running state.
%group
Win32 ole32
%prm
pObject
pObject : [var] Pointer to the IOleObject interface on the object of interest.
%inst
Determines whether a compound document object is currently in the
running state.

[戻り値]
The return value is TRUE if the object is running; otherwise, it is
FALSE.

[備考]
You can use OleIsRunning and IRunnableObject::IsRunning
interchangeably. OleIsRunning queries the object for a pointer to the
IRunnableObject interface and calls its IRunnableObject::IsRunning
method. If successful, the function returns the results of the call
to IRunnableObject::IsRunning.


%index
OleLoad
Loads into memory an object nested within a specified storage object.
%group
Win32 ole32
%prm
pStg, riid, pClientSite, ppvObj
pStg : [var] Pointer to the IStorage interface on the storage object from which to load the specified object.
riid : [var] Reference to the identifier of the interface that the caller wants to use to communicate with the object after it is loaded.
pClientSite : [var] Pointer to the IOleClientSite interface on the client site object being loaded.
ppvObj : [var] Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *ppvObj contains the requested interface pointer on the newly loaded object.
%inst
Loads into memory an object nested within a specified storage object.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
OLE containers load objects into memory by calling this function.
When calling the OleLoad function, the container application passes
in a pointer to the open storage object in which the nested object is
stored. Typically, the nested object to be loaded is a child storage
object to the container's root storage object. Using the OLE
information stored with the object, the object handler (usually, the
default handler) attempts to load the object. On completion of the
OleLoad function, the object is said to be in the loaded state with
its object application not running. Some applications load all of the
object's native data. Containers often defer loading the contained
objects until required to do so. For example, until an object is
scrolled into view and needs to be drawn, it does not need to be
loaded. The OleLoad function performs the following steps:
This doc was truncated.


%index
OleLoadFromStream
The OleLoadFromStream function (ole2.h) loads an object from the stream.
%group
Win32 ole32
%prm
pStm, iidInterface, ppvObj
pStm : [var] Pointer to the IStream interface on the stream from which the object is to be loaded.
iidInterface : [var] Interface identifier (IID) the caller wants to use to communicate with the object after it is loaded.
ppvObj : [var] Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *ppvObj contains the requested interface pointer on the newly loaded object.
%inst
The OleLoadFromStream function (ole2.h) loads an object from the
stream.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
Important Security Note: Calling this method with untrusted data is a
security risk. Call this method only with trusted data. This function
can be used to load an object that supports the IPersistStream
interface. The CLSID of the object must immediately precede the
object's data in the stream, which is accomplished by the companion
function OleSaveToStream (or the operations it wraps, which are
described under that topic).
If the CLSID for the stream is CLSID_NULL, the ppvObj parameter is
set to NULL.


%index
OleLockRunning
Locks an already running object into its running state or unlocks it from its running state. (OleLockRunning)
%group
Win32 ole32
%prm
pUnknown, fLock, fLastUnlockCloses
pUnknown : [var] Pointer to the IUnknown interface on the object, which the function uses to query for a pointer to IRunnableObject.
fLock : [int] TRUE locks the object into its running state. FALSE unlocks the object from its running state.
fLastUnlockCloses : [int] TRUE specifies that if the connection being released is the last external lock on the object, the object should close. FALSE specifies that the object should remain open until closed by the user or another process.
%inst
Locks an already running object into its running state or unlocks it
from its running state. (OleLockRunning)

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
The OleLockRunning function saves you the trouble of calling the
IRunnableObject::LockRunning method. You can use OleLockRunning and
IRunnableObject::LockRunning interchangeably. With the IUnknown
pointer passed in with the pUnknown parameter, OleLockRunning queries
for an IRunnableObject pointer. If successful, it calls
IRunnableObject::LockRunning and returns the results of the call.
For more information on using this function, see
IRunnableObject::LockRunning.


%index
OleMetafilePictFromIconAndLabel
Creates a metafile in which the specified icon and label are drawn.
%group
Win32 ole32
%prm
hIcon, lpszLabel, lpszSourceFile, iIconIndex
hIcon : [intptr] Handle to the icon that is to be drawn into the metafile. This parameter can be NULL. If hIcon is NULL, this function returns NULL without creating a metafile.
lpszLabel : [wstr] The icon label. This parameter can be NULL. If lpszLabel is NULL, the resulting metafile will not include a label.
lpszSourceFile : [wstr] The path and file name of the icon file. This string can be obtained through the user interface or from the registration database. This parameter can be NULL.
iIconIndex : [int] The location of the icon within the file named by lpszSourceFile, expressed as an offset in bytes from the beginning of file.
%inst
Creates a metafile in which the specified icon and label are drawn.

[戻り値]
A global handle to a METAFILEPICT structure containing the icon and
label. The metafile uses the MM_ANISOTROPIC mapping mode. If an error
occurs, the returned handle is NULL. In this case, the caller can
call GetLastError to obtain further information.

[備考]
This function is called by OleGetIconOfFile and OleGetIconOfClass. If
lpszSourceFile is not NULL and iIconIndex is not 0, the name of the
source file passed in lpszSourceFile and the index passed by
iIconIndex are added to the created metafile as a comment record.


%index
OleNoteObjectVisible
Increments or decrements an external reference that keeps an object in the running state.
%group
Win32 ole32
%prm
pUnknown, fVisible
pUnknown : [var] Pointer to the IUnknown interface on the object that is to be locked or unlocked.
fVisible : [int] Whether the object is visible. If TRUE, OLE increments the reference count to hold the object visible and alive regardless of external or internal IUnknown::AddRef and IUnknown::Release operations, registrations, or revocation. If FALSE, OLE releases its hold (decrements the reference count) and the object can be closed.
%inst
Increments or decrements an external reference that keeps an object
in the running state.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
The OleNoteObjectVisible function calls the CoLockObjectExternal
function. It is provided as a separate function to reinforce the need
to lock an object when it becomes visible to the user and to release
the object when it becomes invisible. This creates a strong lock on
behalf of the user to ensure that the object cannot be closed by its
container while it is visible.


%index
OleQueryCreateFromData
Checks whether a data object has one of the formats that would allow it to become an embedded object through a call to either the OleCreateFromData or OleCreateStaticFromData function.
%group
Win32 ole32
%prm
pSrcDataObject
pSrcDataObject : [var] Pointer to the IDataObject interface on the data transfer object to be queried.
%inst
Checks whether a data object has one of the formats that would allow
it to become an embedded object through a call to either the
OleCreateFromData or OleCreateStaticFromData function.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
When an application retrieves a data transfer object through a call
to the OleGetClipboard function, the application should call
OleQueryCreateFromData as part of the process of deciding to enable
or disable the Edit/Paste or Edit/Paste Special... commands. It tests
for the presence of the following formats in the data object:
This doc was truncated.


%index
OleQueryLinkFromData
Determines whether an OLE linked object (rather than an OLE embedded object) can be created from a clipboard data object.
%group
Win32 ole32
%prm
pSrcDataObject
pSrcDataObject : [var] Pointer to the IDataObject interface on the clipboard data object from which the object is to be created.
%inst
Determines whether an OLE linked object (rather than an OLE embedded
object) can be created from a clipboard data object.

[戻り値]
Returns S_OK if the OleCreateLinkFromData function can be used to
create the linked object; otherwise S_FALSE.

[備考]
The OleQueryLinkFromData function is similar to the
OleQueryCreateFromData function, but determines whether an OLE linked
object (rather than an OLE embedded object) can be created from the
clipboard data object. If the return value is S_OK, the application
can then attempt to create the object with a call to
OleCreateLinkFromData. A successful return from OleQueryLinkFromData
does not, however, guarantee the successful creation of a link.


%index
OleRegEnumFormatEtc
Creates an enumeration object that can be used to enumerate data formats that an OLE object server has registered in the system registry.
%group
Win32 ole32
%prm
clsid, dwDirection, ppenum
clsid : [var] CLSID of the class whose formats are being requested.
dwDirection : [int] Indicates whether to enumerate formats that can be passed to IDataObject::GetData or formats that can be passed to IDataObject::SetData. Possible values are taken from the enumeration DATADIR.
ppenum : [var] Address of IEnumFORMATETC pointer variable that receives the interface pointer to the enumeration object.
%inst
Creates an enumeration object that can be used to enumerate data
formats that an OLE object server has registered in the system
registry.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
Object applications can ask OLE to create an enumeration object for
FORMATETC structures to enumerate supported data formats in one of
two ways. One way is to call OleRegEnumFormatEtc. The other is to
return OLE_S_USEREG in response to calls by the default object
handler to IDataObject::EnumFormatEtc. OLE_S_USEREG instructs the
default handler to call OleRegEnumFormatEtc. Because DLL object
applications cannot return OLE_S_USEREG, they must call
OleRegEnumFormatEtc rather than delegating the job to the object
handler. With the supplied IEnumFORMATETC pointer to the object, you
can call the standard enumeration object methods to do the
enumeration.
The OleRegEnumFormatEtc function and its sibling functions,
OleRegGetUserType, OleRegGetMiscStatus, and OleRegEnumVerbs, provide
a way for developers of custom DLL object applications to emulate the
behavior of OLE's default object handler in getting information about
objects from the registry. By using these functions, you avoid the
considerable work of writing your own, and the pitfalls inherent in
working directly in the registry. In addition, you get future
enhancements and optimizations of these functions without having to
code them yourself.


%index
OleRegEnumVerbs
Supplies an enumeration of the registered verbs for the specified class. Developers of custom DLL object applications use this function to emulate the behavior of the default object handler.
%group
Win32 ole32
%prm
clsid, ppenum
clsid : [var] Class identifier whose verbs are being requested.
ppenum : [var] Address of IEnumOLEVERB* pointer variable that receives the interface pointer to the new enumeration object.
%inst
Supplies an enumeration of the registered verbs for the specified
class. Developers of custom DLL object applications use this function
to emulate the behavior of the default object handler.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
Object applications can ask OLE to create an enumeration object for
OLEVERB structures to enumerate supported verbs in one of two ways.
One way is to call OleRegEnumVerbs. The other way is to return
OLE_S_USEREG in response to calls by the default object handler to
IOleObject::EnumVerbs. OLE_S_USEREG instructs the default handler to
call OleRegEnumVerbs. Because DLL object applications cannot return
OLE_S_USEREG, they must call OleRegEnumVerbs rather than delegating
the job to the object handler. With the supplied IEnumOLEVERB pointer
to the object, you can call the standard enumeration object methods
to do the enumeration. The OleRegEnumVerbs function and its sibling
functions, OleRegGetUserType, OleRegGetMiscStatus, and
OleRegEnumFormatEtc, provide a way for developers of custom DLL
object applications to emulate the behavior of OLE's default object
handler in getting information about objects from the registry. By
using these functions, you avoid the considerable work of writing
your own, and the pitfalls inherent in working directly in the
registry. In addition, you get future enhancements and optimizations
of these functions without having to code them yourself.


%index
OleRegGetMiscStatus
Returns miscellaneous information about the presentation and behaviors supported by the specified CLSID from the registry.
%group
Win32 ole32
%prm
clsid, dwAspect, pdwStatus
clsid : [var] The CLSID of the class for which status information is to be requested.
dwAspect : [int] The presentation aspect of the class for which information is requested. Possible values are taken from the DVASPECT enumeration.
pdwStatus : [var] A pointer to the variable that receives the status information.
%inst
Returns miscellaneous information about the presentation and
behaviors supported by the specified CLSID from the registry.

[戻り値]
This function can return the standard return value E_OUTOFMEMORY, as
well as the following values.
This doc was truncated.

[備考]
Object applications can ask OLE to get miscellaneous status
information in one of two ways. One way is to call
OleRegGetMiscStatus. The other is to return OLE_S_USEREG in response
to calls by the default object handler to IOleObject::GetMiscStatus.
OLE_S_USEREG instructs the default handler to call
OleRegGetMiscStatus. Because DLL object applications cannot return
OLE_S_USEREG, they must call OleRegGetMiscStatus rather than
delegating the job to the object handler.
OleRegGetMiscStatus and its sibling functions, OleRegGetUserType,
OleRegEnumFormatEtc, and OleRegEnumVerbs, provide a way for
developers of custom DLL object applications to emulate the behavior
of OLE's default object handler in getting information about objects
from the registry. By using these functions, you avoid the
considerable work of writing your own, and the pitfalls inherent in
working directly in the registry. In addition, you get future
enhancements and optimizations of these functions without having to
code them yourself.


%index
OleRegGetUserType
Gets the user type of the specified class from the registry.
%group
Win32 ole32
%prm
clsid, dwFormOfType, pszUserType
clsid : [var] The CLSID of the class for which the user type is to be requested.
dwFormOfType : [int] The form of the user-presentable string. Possible values are taken from the enumeration USERCLASSTYPE.
pszUserType : [var] A pointer to a string that receives the user type.
%inst
Gets the user type of the specified class from the registry.

[戻り値]
This function can return the standard return value E_OUTOFMEMORY, as
well as the following values.
This doc was truncated.

[備考]
Object applications can ask OLE to get the user type name of a
specified class in one of two ways. One way is to call
OleRegGetUserType. The other is to return OLE_S_USEREG in response to
calls by the default object handler to IOleObject::GetUserType.
OLE_S_USEREG instructs the default handler to call OleRegGetUserType.
Because DLL object applications cannot return OLE_S_USEREG, they must
call OleRegGetUserType, rather than delegating the job to the object
handler.
The OleRegGetUserType function and its sibling functions,
OleRegGetMiscStatus, OleRegEnumFormatEtc, and OleRegEnumVerbs,
provide a way for developers of custom DLL object applications to
emulate the behavior of OLE's default object handler in getting
information about objects from the registry. By using these
functions, you avoid the considerable work of writing your own, and
the pitfalls inherent in working directly in the registry. In
addition, you get future enhancements and optimizations of these
functions without having to code them yourself.


%index
OleRun
Puts an OLE compound document object into the running state.
%group
Win32 ole32
%prm
pUnknown
pUnknown : [var] Pointer to the IUnknown interface on the object, with which it will query for a pointer to the IRunnableObject interface, and then call its Run method.
%inst
Puts an OLE compound document object into the running state.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
The OleRun function puts an object in the running state. The
implementation of OleRun was changed in OLE 2.01 to coincide with the
publication of the IRunnableObject interface. You can use OleRun and
IRunnableObject::Run interchangeably. OleRun queries the object for a
pointer to IRunnableObject. If successful, the function returns the
results of calling the IRunnableObject::Run method. For more
information on using this function, see IRunnableObject::Run.


%index
OleSave
Saves an object opened in transacted mode into the specified storage object.
%group
Win32 ole32
%prm
pPS, pStg, fSameAsLoad
pPS : [var] Pointer to the IPersistStorage interface on the object to be saved.
pStg : [var] Pointer to the IStorage interface on the destination storage object to which the object indicated in pPS is to be saved.
fSameAsLoad : [int] TRUE indicates that pStg is the same storage object from which the object was loaded or created; FALSE indicates that pStg was loaded or created from a different storage object.
%inst
Saves an object opened in transacted mode into the specified storage
object.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
The OleSave helper function handles the common situation in which an
object is open in transacted mode and is then to be saved into the
specified storage object which uses the OLE-provided compound file
implementation. Transacted mode means that changes to the object are
buffered until either of the IStorage::Commit or IStorage::Revert is
called. Callers can handle other situations by calling the
IPersistStorage and IStorage interfaces directly.
OleSave does the following:
This doc was truncated.


%index
OleSaveToStream
The OleSaveToStream function (ole2.h) saves an object with the IPersistStream interface on it to the specified stream.
%group
Win32 ole32
%prm
pPStm, pStm
pPStm : [var] Pointer to the IPersistStream interface on the object to be saved to the stream. The pPStm parameter cannot be NULL.
pStm : [var] Pointer to the IStream interface on the stream in which the object is to be saved.
%inst
The OleSaveToStream function (ole2.h) saves an object with the
IPersistStream interface on it to the specified stream.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
This function simplifies saving an object that implements the
IPersistStream interface to a stream. In this stream, the object's
CLSID precedes its data. When the stream is retrieved, the CLSID
permits the proper code to be associated with the data. The
OleSaveToStream function does the following:
This doc was truncated.


%index
OleSetAutoConvert
Specifies a CLSID for automatic conversion to a different class when an object of that class is loaded.
%group
Win32 ole32
%prm
clsidOld, clsidNew
clsidOld : [var] The CLSID of the object class to be converted.
clsidNew : [var] The CLSID of the object class that should replace clsidOld. This new CLSID replaces any existing auto-conversion information in the registry for clsidOld. If this value is CLSID_NULL, any existing auto-conversion information for clsidOld is removed from the registry.
%inst
Specifies a CLSID for automatic conversion to a different class when
an object of that class is loaded.

[戻り値]
This function can return the standard return values E_INVALIDARG,
E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
This doc was truncated.

[備考]
OleSetAutoConvert goes to the system registry, finds the
AutoConvertTo subkey under the CLSID specified by clsidOld, and sets
it to clsidNew. This function does not validate whether an
appropriate registry entry for clsidNew currently exists. These
entries appear in the registry as subkeys of the CLSID key. Object
conversion means that the object's data is permanently associated
with a new CLSID. Automatic conversion is typically specified in the
setup program of a new version of an object application, so objects
created by its older versions can be automatically updated to the new
version.
For example, it may be necessary to convert spreadsheets that were
created with earlier versions of a spreadsheet application to the new
version. The spreadsheet objects from earlier versions have different
CLSIDs than the new version. For each earlier version that you want
automatically updated, you would call OleSetAutoConvert in the setup
program, specifying the CLSID of the old version, and that of the new
one. Then, whenever a user loads an object from a previous version,
it would be automatically updated. To support automatic conversion of
objects, a server that supports conversion must be prepared to
manually convert objects that have the format of an earlier version
of the server. Automatic conversion relies internally on this
manual-conversion support. Before setting the desired AutoConvertTo
value, setup programs should also call OleSetAutoConvert to remove
any existing conversion for the new class, by specifying the new
class as the clsidOld parameter, and setting the clsidNew parameter
to CLSID_NULL.


%index
OleSetClipboard
Places a pointer to a specific data object onto the clipboard. This makes the data object accessible to the OleGetClipboard function.
%group
Win32 ole32
%prm
pDataObj
pDataObj : [var] Pointer to the IDataObject interface on the data object from which the data to be placed on the clipboard can be obtained. This parameter can be NULL; in which case the clipboard is emptied.
%inst
Places a pointer to a specific data object onto the clipboard. This
makes the data object accessible to the OleGetClipboard function.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
If you are writing an application that can act as the source of a
clipboard operation, you must do the following:
This doc was truncated.


%index
OleSetContainedObject
Notifies an object that it is embedded in an OLE container, which ensures that reference counting is done correctly for containers that support links to embedded objects. (OleSetContainedObject)
%group
Win32 ole32
%prm
pUnknown, fContained
pUnknown : [var] Pointer to the IUnknown interface of the object.
fContained : [int] TRUE if the object is an embedded object; FALSE otherwise.
%inst
Notifies an object that it is embedded in an OLE container, which
ensures that reference counting is done correctly for containers that
support links to embedded objects. (OleSetContainedObject)

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
The OleSetContainedObject function notifies an object that it is
embedded in an OLE container. The implementation of
OleSetContainedObject was changed in OLE 2.01 to coincide with the
publication of the IRunnableObject interface. You can use
OleSetContainedObject and the IRunnableObject::SetContainedObject
method interchangeably. The OleSetContainedObject function queries
the object for a pointer to the IRunnableObject interface. If
successful, the function returns the results of calling
IRunnableObject::SetContainedObject.


%index
OleSetMenuDescriptor
Installs or removes OLE dispatching code from the container's frame window.
%group
Win32 ole32
%prm
holemenu, hwndFrame, hwndActiveObject, lpFrame, lpActiveObj
holemenu : [int] Handle to the composite menu descriptor returned by the OleCreateMenuDescriptor function. If NULL, the dispatching code is unhooked.
hwndFrame : [intptr] Handle to the container's frame window where the in-place composite menu is to be installed.
hwndActiveObject : [intptr] Handle to the object's in-place activation window. OLE dispatches menu messages and commands to this window.
lpFrame : [var] Pointer to the IOleInPlaceFrame interface on the container's frame window.
lpActiveObj : [var] Pointer to the IOleInPlaceActiveObject interface on the active in-place object.
%inst
Installs or removes OLE dispatching code from the container's frame
window.

[戻り値]
This function returns S_OK on success.

[備考]
The container should call OleSetMenuDescriptor to install the
dispatching code on hwndFrame when the object calls the
IOleInPlaceFrame::SetMenu method, or to remove the dispatching code
by passing NULL as the value for holemenu to OleSetMenuDescriptor. If
both the lpFrame and lpActiveObj parameters are non-NULL, OLE
installs the context-sensitive help F1 message filter for the
application. Otherwise, the application must supply its own message
filter.


%index
OleTranslateAccelerator
Called by the object application, allows an object's container to translate accelerators according to the container's accelerator table.
%group
Win32 ole32
%prm
lpFrame, lpFrameInfo, lpmsg
lpFrame : [var] Pointer to the IOleInPlaceFrame interface to which the keystroke might be sent.
lpFrameInfo : [var] Pointer to an OLEINPLACEFRAMEINFO structure containing the accelerator table obtained from the container.
lpmsg : [var] Pointer to an MSG structure containing the keystroke.
%inst
Called by the object application, allows an object's container to
translate accelerators according to the container's accelerator
table.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
Object servers call OleTranslateAccelerator to allow the object's
container to translate accelerator keystrokes according to the
container's accelerator table, pointed to by lpFrameInfo. While a
contained object is the active object, the object's server always has
first chance at translating any messages received. If this is not
desired, the server calls OleTranslateAccelerator to give the
object's container a chance. If the keyboard input matches an
accelerator found in the container-provided accelerator table,
OleTranslateAccelerator passes the message and its command identifier
on to the container through the
IOleInPlaceFrame::TranslateAccelerator method. This method returns
S_OK if the keystroke is consumed; otherwise it returns S_FALSE.
Accelerator tables for containers should be defined so they will work
properly with object applications that do their own accelerator
keystroke translations. These tables should take the form:
This doc was truncated.


%index
OleUninitialize
Closes the COM library on the apartment, releases any class factories, other COM objects, or servers held by the apartment, disables RPC on the apartment, and frees any resources the apartment maintains.
%group
Win32 ole32
%prm

%inst
Closes the COM library on the apartment, releases any class
factories, other COM objects, or servers held by the apartment,
disables RPC on the apartment, and frees any resources the apartment
maintains.

[備考]
Call OleUninitialize on application shutdown, as the last COM library
call, if the apartment was initialized with a call to OleInitialize.
OleUninitialize calls the CoUninitialize function internally to shut
down the OLE Component Object(COM) Library. If the COM library was
initialized on the apartment with a call to CoInitialize or
CoInitializeEx, it must be closed with a call to CoUninitialize. The
OleInitialize and OleUninitialize calls must be balanced. If there
are multiple calls to the OleInitialize function, there must be the
same number of calls to OleUninitialize; only the OleUninitialize
call corresponding to the OleInitialize call that actually
initialized the library can close it. Because there is no way to
control the order in which in-process servers are loaded or unloaded,
do not call OleInitialize or OleUninitialize from the DllMain
function.


%index
PropStgNameToFmtId
Converts a property set storage or stream name to its format identifier.
%group
Win32 ole32
%prm
oszName, pfmtid
oszName : [wstr] A pointer to a null-terminated Unicode string that contains the stream name of a simple property set or the storage name of a nonsimple property set.
pfmtid : [var] A pointer to a FMTID variable that receives the format identifier of the property set specified by oszName.
%inst
Converts a property set storage or stream name to its format
identifier.

[戻り値]
This function supports the standard return value E_INVALIDARG as well
as the following:

[備考]
The PropStgNameToFmtId function maps the stream name of a simple
property set or the storage name of a nonsimple property set to its
format identifier. This function is useful in creating or opening a
property set using the PROPSETFLAG_UNBUFFERED value with the
StgCreatePropStg and StgOpenPropStg functions. For more information
about PROPSETFLAG_UNBUFFERED, see PROPSETFLAG Constants.


%index
PropVariantClear
Frees all elements that can be freed in a given PROPVARIANT structure.
%group
Win32 ole32
%prm
pvar
pvar : [var] A pointer to an initialized PROPVARIANT structure for which any deallocatable elements are to be freed. On return, all zeroes are written to the PROPVARIANT structure.
%inst
Frees all elements that can be freed in a given PROPVARIANT
structure.

[戻り値]
This function returns HRESULT.

[備考]
At any level of indirection, NULL pointers are ignored. For example,
the pvar parameter points to a PROPVARIANT structure of type VT_CF.
The pclipdata member of the PROPVARIANT structure points to a
CLIPDATA structure. The pClipData pointer in the CLIPDATA structure
is NULL. In this example, the pClipData pointer is ignored. However,
the CLIPDATA structure pointed to by the pclipdata member of the
PROPVARIANT structure is freed. On return, this function writes
zeroes to the specified PROPVARIANT structure, so the VT-type is
VT_EMPTY. Passing NULL as the pvar parameter produces a return code
of S_OK. Note Do not use this function to initialize PROPVARIANT
structures. Instead, initialize these structures using the
PropVariantInit macro (defined in Propidl.h).


%index
PropVariantCopy
The PropVariantCopy function copies the contents of one PROPVARIANT structure to another.
%group
Win32 ole32
%prm
pvarDest, pvarSrc
pvarDest : [var] Pointer to an uninitialized PROPVARIANT structure that receives the copy.
pvarSrc : [var] Pointer to the PROPVARIANT structure to be copied.
%inst
The PropVariantCopy function copies the contents of one PROPVARIANT
structure to another.

[戻り値]
This function returns HRESULT.

[備考]
Copies a PROPVARIANT structure by value so the original pvarSrc and
new pvarDest parameters may be freed independently with calls to
PropVariantClear. PropVariantCopy does not free the destination as
the VariantCopy function does. For nonsimple PROPVARIANT types such
as VT_STREAM, VT_STORAGE, and so forth, which require a subobject,
the copy is made by reference. The pointer is copied, and
[IUnknown::AddRef](../unknwn/nf-unknwn-iunknown-addref.md) is called
on it. It is illegal to pass NULL for either pvarDest or pvarSrc.


%index
ReadClassStg
The ReadClassStg function reads the CLSID previously written to a storage object with the WriteClassStg function.
%group
Win32 ole32
%prm
pStg, pclsid
pStg : [var] Pointer to the IStorage interface on the storage object containing the CLSID to be retrieved.
pclsid : [var] Pointer to where the CLSID is written. May return CLSID_NULL.
%inst
The ReadClassStg function reads the CLSID previously written to a
storage object with the WriteClassStg function.

[戻り値]
This function supports the standard return value E_OUTOFMEMORY, in
addition to the following: This function also returns any of the
error values returned by the IStorage::Stat method.

[備考]
ReadClassStg is a helper function that calls the IStorage::Stat
method and retrieves the CLSID previously written to the storage
object with a call to WriteClassStg from the STATSTG structure.


%index
ReadClassStm
Reads the CLSID previously written to a stream object with the WriteClassStm function.
%group
Win32 ole32
%prm
pStm, pclsid
pStm : [var] A pointer to the IStream interface on the stream object that contains the CLSID to be read. This CLSID must have been previously written to the stream object using WriteClassStm.
pclsid : [var] A pointer to where the CLSID is to be written.
%inst
Reads the CLSID previously written to a stream object with the
WriteClassStm function.

[戻り値]
This function also returns any of the error values returned by the
ISequentialStream::Read method.

[備考]
Most applications do not call the ReadClassStm function directly. COM
calls it before making a call to an object's IPersistStream::Load
implementation.


%index
ReadFmtUserTypeStg
The ReadFmtUserTypeStg function returns the clipboard format and user type previously saved with the WriteFmtUserTypeStg function.
%group
Win32 ole32
%prm
pstg, pcf, lplpszUserType
pstg : [var] Pointer to the IStorage interface on the storage object from which the information is to be read.
pcf : [var] Pointer to where the clipboard format is to be written on return. It can be NULL, indicating the format is of no interest to the caller.
lplpszUserType : [var] Address of LPWSTR pointer variable that receives a pointer to the null-terminated Unicode user-type string. The caller can specify NULL for this parameter, which indicates that the user type is of no interest. This function allocates memory for the string. The caller is responsible for freeing the memory with CoTaskMemFree.
%inst
The ReadFmtUserTypeStg function returns the clipboard format and user
type previously saved with the WriteFmtUserTypeStg function.

[戻り値]
This function supports the standard return values E_FAIL,
E_INVALIDARG, and E_OUTOFMEMORY, in addition to the following: This
function also returns any of the error values returned by the
ISequentialStream::Read method.

[備考]
ReadFmtUserTypeStg returns the clipboard format and the user type
string from the specified storage object. The WriteClassStg function
must have been called before calling the ReadFmtUserTypeStg function.


%index
RegisterDragDrop
Registers the specified window as one that can be the target of an OLE drag-and-drop operation and specifies the IDropTarget instance to use for drop operations.
%group
Win32 ole32
%prm
hwnd, pDropTarget
hwnd : [intptr] Handle to a window that can be a target for an OLE drag-and-drop operation.
pDropTarget : [var] Pointer to the IDropTarget interface on the object that is to be the target of a drag-and-drop operation in a specified window. This interface is used to communicate OLE drag-and-drop information for that window.
%inst
Registers the specified window as one that can be the target of an
OLE drag-and-drop operation and specifies the IDropTarget instance to
use for drop operations.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
If your application can accept dropped objects during OLE
drag-and-drop operations, you must call the RegisterDragDrop
function. Do this whenever one of your application windows is
available as a potential drop target, i.e., when the window appears
unobscured on the screen. The application thread that calls the
RegisterDragDrop function must be pumping messages, presumably by
calling the GetMessage function with a NULLhWnd parameter, because
OLE creates windows on the thread that need messages processed. If
this requirement is not met, any application that drags an object
over the window that is registered as a drop target will hang until
the target application closes. The RegisterDragDrop function only
registers one window at a time, so you must call it for each
application window capable of accepting dropped objects. As the mouse
passes over unobscured portions of the target window during an OLE
drag-and-drop operation, the DoDragDrop function calls the specified
IDropTarget::DragOver method for the current window. When a drop
operation actually occurs in a given window, the DoDragDrop function
calls IDropTarget::Drop. The RegisterDragDrop function also calls the
IUnknown::AddRef method on the IDropTarget pointer.


%index
ReleaseStgMedium
Frees the specified storage medium.
%group
Win32 ole32
%prm
param0
param0 : [var] 
%inst
Frees the specified storage medium.

[備考]
The ReleaseStgMedium function calls the appropriate method or
function to release the specified storage medium. Use this function
during data transfer operations where storage medium structures are
parameters, such as IDataObject::GetData or IDataObject::SetData. In
addition to identifying the type of the storage medium, this
structure specifies the appropriate Release method for releasing the
storage medium when it is no longer needed. It is common to pass a
STGMEDIUM from one body of code to another, such as in
IDataObject::GetData, in which the one called can allocate a medium
and return it to the caller. ReleaseStgMedium permits flexibility in
whether the receiving body of code owns the medium, or whether the
original provider of the medium still owns it, in which case the
receiving code needs to inform the provider that it can free the
medium. When the original provider of the medium is responsible for
freeing the medium, the provider calls ReleaseStgMedium, specifying
the medium and the appropriate IUnknown pointer as the punkForRelease
structure member. Depending on the type of storage medium being
freed, one of the following actions is taken, followed by a call to
the IUnknown::Release method on the specified IUnknown pointer.
This doc was truncated.


%index
RevokeDragDrop
Revokes the registration of the specified application window as a potential target for OLE drag-and-drop operations.
%group
Win32 ole32
%prm
hwnd
hwnd : [intptr] Handle to a window previously registered as a target for an OLE drag-and-drop operation.
%inst
Revokes the registration of the specified application window as a
potential target for OLE drag-and-drop operations.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
When your application window is no longer available as a potential
target for an OLE drag-and-drop operation, you must call
RevokeDragDrop. This function calls the IUnknown::Release method for
your drop target interface.


%index
SNB_UserFree
(no summary)
%group
Win32 ole32
%prm
param0, param1
param0 : [var] 
param1 : [var] 
%inst



%index
SNB_UserFree64
(no summary)
%group
Win32 ole32
%prm
param0, param1
param0 : [var] 
param1 : [var] 
%inst



%index
SNB_UserMarshal
(no summary)
%group
Win32 ole32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst



%index
SNB_UserMarshal64
(no summary)
%group
Win32 ole32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst



%index
SNB_UserSize
(no summary)
%group
Win32 ole32
%prm
param0, param1, param2
param0 : [var] 
param1 : [int] 
param2 : [var] 
%inst



%index
SNB_UserSize64
(no summary)
%group
Win32 ole32
%prm
param0, param1, param2
param0 : [var] 
param1 : [int] 
param2 : [var] 
%inst



%index
SNB_UserUnmarshal
(no summary)
%group
Win32 ole32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst



%index
SNB_UserUnmarshal64
(no summary)
%group
Win32 ole32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst



%index
STGMEDIUM_UserFree
The STGMEDIUM_UserFree function (oleidl.h) frees resources on the server side when called by RPC stub files.
%group
Win32 ole32
%prm
param0, param1
param0 : [var] 
param1 : [var] 
%inst
The STGMEDIUM_UserFree function (oleidl.h) frees resources on the
server side when called by RPC stub files.


%index
STGMEDIUM_UserFree64
The STGMEDIUM_UserFree64 function (oleidl.h) frees resources on the server side when called by RPC stub files.
%group
Win32 ole32
%prm
param0, param1
param0 : [var] 
param1 : [var] 
%inst
The STGMEDIUM_UserFree64 function (oleidl.h) frees resources on the
server side when called by RPC stub files.


%index
STGMEDIUM_UserMarshal
The STGMEDIUM_UserMarshal function (oleidl.h) marshals a STGMEDIUM object into the RPC buffer.
%group
Win32 ole32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
The STGMEDIUM_UserMarshal function (oleidl.h) marshals a STGMEDIUM
object into the RPC buffer.


%index
STGMEDIUM_UserMarshal64
The STGMEDIUM_UserMarshal64 function (oleidl.h) marshals a STGMEDIUM object into the RPC buffer.
%group
Win32 ole32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
The STGMEDIUM_UserMarshal64 function (oleidl.h) marshals a STGMEDIUM
object into the RPC buffer.


%index
STGMEDIUM_UserSize
The STGMEDIUM_UserSize function (oleidl.h) calculates the wire size of the STGMEDIUM object and gets its handle and data.
%group
Win32 ole32
%prm
param0, param1, param2
param0 : [var] 
param1 : [int] 
param2 : [var] 
%inst
The STGMEDIUM_UserSize function (oleidl.h) calculates the wire size
of the STGMEDIUM object and gets its handle and data.


%index
STGMEDIUM_UserSize64
The STGMEDIUM_UserSize64 function (oleidl.h) calculates the wire size of the STGMEDIUM object and gets its handle and data.
%group
Win32 ole32
%prm
param0, param1, param2
param0 : [var] 
param1 : [int] 
param2 : [var] 
%inst
The STGMEDIUM_UserSize64 function (oleidl.h) calculates the wire size
of the STGMEDIUM object and gets its handle and data.


%index
STGMEDIUM_UserUnmarshal
The STGMEDIUM_UserUnmarshal function (oleidl.h) unmarshals a STGMEDIUM object from the RPC buffer.
%group
Win32 ole32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
The STGMEDIUM_UserUnmarshal function (oleidl.h) unmarshals a
STGMEDIUM object from the RPC buffer.


%index
STGMEDIUM_UserUnmarshal64
The STGMEDIUM_UserUnmarshal64 function (oleidl.h) unmarshals a STGMEDIUM object from the RPC buffer.
%group
Win32 ole32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
The STGMEDIUM_UserUnmarshal64 function (oleidl.h) unmarshals a
STGMEDIUM object from the RPC buffer.


%index
SetConvertStg
The SetConvertStg function sets the convert bit in a storage object to indicate that the object is to be converted to a new class when it is opened. The setting can be retrieved with a call to the GetConvertStg function.
%group
Win32 ole32
%prm
pStg, fConvert
pStg : [var] IStorage pointer to the storage object in which to set the conversion bit.
fConvert : [int] If TRUE, sets the conversion bit for the object to indicate the object is to be converted when opened. If FALSE, clears the conversion bit.
%inst
The SetConvertStg function sets the convert bit in a storage object
to indicate that the object is to be converted to a new class when it
is opened. The setting can be retrieved with a call to the
GetConvertStg function.

[戻り値]
See the IStorage::CreateStream, IStorage::OpenStream,
ISequentialStream::Read, and ISequentialStream::Write methods for
possible storage and stream access errors.

[備考]
The SetConvertStg function determines the status of the convert bit
in a contained object. It is called by both the container application
and the server in the process of converting an object from one class
to another. When a user specifies through a Convert To dialog (which
the container produces with a call to the OleUIConvert function) that
an object is to be converted, the container must take the following
steps:
This doc was truncated.


%index
StgConvertPropertyToVariant
Converts a SERIALIZEDPROPERTYVALUE data type to a PROPVARIANT data type.
%group
Win32 ole32
%prm
pprop, CodePage, pvar, pma
pprop : [var] A pointer to SERIALIZEDPROPERTYVALUE.
CodePage : [int] A property set codepage.
pvar : [var] A pointer to PROPVARIANT.
pma : [var] A pointer to a class that implements the IMemoryAllocator abstract class.
%inst
Converts a SERIALIZEDPROPERTYVALUE data type to a PROPVARIANT data
type.

[戻り値]
Returns TRUE is the property converted was an indirect type
(VT_STREAM or VT_STREAMED_OBJECT); otherwise FALSE.

[備考]
This function converts a property to a PROPVARIANT data type. If the
function fails, it throws an exception that represents an NT_STATUS
such as STATUS_INVALID_PARAMETER.


%index
StgConvertVariantToProperty
Converts a PROPVARIANT data type to a SERIALIZEDPROPERTYVALUE data type.
%group
Win32 ole32
%prm
pvar, CodePage, pprop, pcb, pid, fReserved, pcIndirect
pvar : [var] A  pointer to PROPVARIANT.
CodePage : [int] A property set codepage.
pprop : [var] Optional. A pointer to SERIALIZEDPROPERTYVALUE.
pcb : [var] A pointer to the remaining stream length, updated to the actual property size on return.
pid : [int] The propid (used if indirect).
fReserved : [int] Reserver. The value must be FALSE.
pcIndirect : [var] Optional. A pointer to the indirect property count.
%inst
Converts a PROPVARIANT data type to a SERIALIZEDPROPERTYVALUE data
type.

[戻り値]
Returns a pointer to SERIALIZEDPROPERTYVALUE.

[備考]
This function converts a PROPVARIANT to a property. If the function
fails it throws an exception that represents STATUS_INVALID_PARAMETER
NT_STATUS.


%index
StgCreateDocfile
Creates a new compound file storage object using the COM-provided compound file implementation for the IStorage interface.
%group
Win32 ole32
%prm
pwcsName, grfMode, reserved, ppstgOpen
pwcsName : [wstr] A pointer to a null-terminated Unicode string name for the compound file being created. It is passed uninterpreted to the file system. This can be a relative name or NULL. If NULL, a temporary compound file is allocated with a unique name.
grfMode : [int] Specifies the access mode to use when opening the new storage object. For more information, see STGM Constants. If the caller specifies transacted mode together with STGM_CREATE or STGM_CONVERT, the overwrite or conversion takes place when the commit operation is called for the root storage. If IStorage::Commit is not called for the root storage object, previous contents of the file will be restored. STGM_CREATE and STGM_CONVERT cannot be combined with the STGM_NOSNAPSHOT flag, because a snapshot copy is required when a file is overwritten or converted in the transacted mode.
reserved : [int] Reserved for future use; must be zero.
ppstgOpen : [var] A pointer to the location of the IStorage pointer to the new storage object.
%inst
Creates a new compound file storage object using the COM-provided
compound file implementation for the IStorage interface.

[戻り値]
StgCreateDocfile can also return any file system errors or system
errors wrapped in an HRESULT. For more information, see Error
Handling Strategies and Handling Unknown Errors.

[備考]
The StgCreateDocfile function creates a new storage object using the
COM-provided, compound-file implementation for the IStorage
interface. The name of the open compound file can be retrieved by
calling the IStorage::Stat method. StgCreateDocfile creates the file
if it does not exist. If it does exist, the use of the STGM_CREATE,
STGM_CONVERT, and STGM_FAILIFTHERE flags in the grfMode parameter
indicate how to proceed. For more information, see STGM Constants. If
the compound file is opened in transacted mode (the grfMode parameter
specifies STGM_TRANSACTED) and a file with this name already exists,
the existing file is not altered until all outstanding changes are
committed. If the calling process lacks write access to the existing
file (because of access control in the file system), the grfMode
parameter can only specify STGM_READ and not STGM_WRITE or
STGM_READWRITE. The resulting new open compound file can still be
written to, but a subsequent commit operation will fail (in
transacted mode, write permissions are enforced at commit time).
Specifying STGM_SIMPLE provides a much faster implementation of a
compound file object in a limited, but frequently used case. This can
be used by applications that require a compound-file implementation
with multiple streams and no storages. The simple mode does not
support all of the methods on IStorage. For more information, see
STGM Constants. If the grfMode parameter specifies STGM_TRANSACTED
and no file yet exists with the name specified by the pwcsName
parameter, the file is created immediately. In an access-controlled
file system, the caller must have write permissions in the file
system directory in which the compound file is created. If
STGM_TRANSACTED is not specified, and STGM_CREATE is specified, an
existing file with the same name is destroyed before the new file is
created. StgCreateDocfile can be used to create a temporary compound
file by passing a NULL value for the pwcsName parameter. However,
these files are temporary only in the sense that they have a
system-provided unique name ? likely one that is meaningless to the
user. The caller is responsible for deleting the temporary file when
finished with it, unless STGM_DELETEONRELEASE was specified for the
grfMode parameter.


%index
StgCreateDocfileOnILockBytes
Creates and opens a new compound file storage object on top of a byte-array object provided by the caller.
%group
Win32 ole32
%prm
plkbyt, grfMode, reserved, ppstgOpen
plkbyt : [var] A pointer to the ILockBytes interface on the underlying byte-array object on which to create a compound file.
grfMode : [int] Specifies the access mode to use when opening the new compound file. For more information, see STGM Constants and the Remarks section below.
reserved : [int] Reserved for future use; must be zero.
ppstgOpen : [var] A pointer to the location of the IStorage pointer on the new storage object.
%inst
Creates and opens a new compound file storage object on top of a
byte-array object provided by the caller.

[戻り値]
The StgCreateDocfileOnILockBytes function can also return any file
system errors, or system errors wrapped in an HRESULT, or ILockBytes
interface error return values. For more information, see Error
Handling Strategies and Handling Unknown Errors.

[備考]
The StgCreateDocfileOnILockBytes function creates a storage object on
top of a byte array object using the COM-provided, compound-file
implementation of the IStorage interface.
StgCreateDocfileOnILockBytes can be used to store a document in an
arbitrary data store, such as memory or a relational database. The
byte array (indicated by the pLkbyt parameter, which points to the
ILockBytes interface on the object) is used for the underlying
storage in place of a disk file. Except for specifying a
programmer-provided byte-array object, StgCreateDocfileOnILockBytes
is similar to the StgCreateDocfile function. The newly created
compound file is opened according to the access modes in the grfMode
parameter, subject to the following restrictions: Sharing mode
behavior and transactional isolation depend on the ILockBytes
implementation supporting LockRegion and UnlockRegion with
LOCK_ONLYONCE semantics. Implementations can indicate to structured
storage they support this functionality by setting the LOCK_ONLYONCE
bit in the grfLocksSupported member of STATSTG. If an ILockBytes
implementation does not support this functionality, sharing modes
will not be enforced, and root-level transactional commits will not
coordinate properly with other transactional instances opened on the
same byte array. Applications that use an ILockBytes implementation
that does not support region locking, such as the
CreateStreamOnHGlobal implementation, should avoid opening multiple
concurrent instances on the same byte array.
StgCreateDocfileOnILockBytes does not support simple mode. The
STGM_SIMPLE flag, if present, is ignored. For conversion purposes,
the file is considered to already exist. As a result, it is not
useful to use the STGM_FAILIFTHERE value, because it causes an error
to be returned. However, both STGM_CREATE and STGM_CONVERT remain
useful. The ability to build a compound file on top of a byte-array
object is provided to support having the data (underneath an IStorage
and IStream tree structure) live in a nonpersistent space. Given this
capability, there is nothing preventing a document that is stored in
a file from using this facility. For example, a container might do
this to minimize the impact on its file format caused by adopting
COM. However, it is recommended that COM documents adopt the IStorage
interface for their own outer-level storage. This has the following
advantages:
This doc was truncated.


%index
StgCreatePropSetStg
Creates a property set storage object from a specified storage object.
%group
Win32 ole32
%prm
pStorage, dwReserved, ppPropSetStg
pStorage : [var] A pointer to the storage object that contains or will contain one or more property sets.
dwReserved : [int] Reserved for future use; must be zero.
ppPropSetStg : [var] A pointer to IPropertySetStorage* pointer variable that receives the interface pointer to the property-set storage object.
%inst
Creates a property set storage object from a specified storage
object.

[戻り値]
This function supports the standard return value E_INVALIDARG as well
as the following:

[備考]
The StgCreatePropSetStg function creates an IPropertySetStorage
interface that will act on the given IStorage interface specified by
the pStorage parameter. This function does not modify this IStorage
by itself, although subsequent calls to the IPropertySetStorage
interface might. StgCreatePropSetStg calls IUnknown::AddRef on the
storage object specified by pStorage. The caller must release the
object when it is no longer required by calling Release.


%index
StgCreatePropStg
Creates and opens a property set in a specified storage or stream object.
%group
Win32 ole32
%prm
pUnk, fmtid, pclsid, grfFlags, dwReserved, ppPropStg
pUnk : [var] A pointer to the IUnknown interface on the storage or stream object that stores the new property set.
fmtid : [var] The FMTID of the property set to be created.
pclsid : [var] A Pointer to the initial CLSID for this property set. May be NULL, in which case pclsid is set to all zeroes.
grfFlags : [int] The values from PROPSETFLAG Constants that determine how the property set is created and opened.
dwReserved : [int] Reserved; must be zero.
ppPropStg : [var] The address of an IPropertyStorage* pointer variable that receives the interface pointer to the new property set.
%inst
Creates and opens a property set in a specified storage or stream
object.

[戻り値]
This function supports the standard return values E_INVALIDARG and
E_UNEXPECTED, in addition to the following:

[備考]
StgCreatePropStg creates and opens a new property set which supplies
the system-provided, stand-alone implementation of the
IPropertyStorage interface. The new property set is contained in the
storage or stream object specified by pUnk. The value of the grfFlags
parameter indicates whether pUnk specifies a storage or stream
object. For example, if PROPSETFLAG_NONSIMPLE is set, then pUnk can
be queried for an IStorage interface on a storage object. In either
case, this function calls pUnk->AddRef for the storage or stream
object containing the property set. It is the responsibility of the
caller to release the object when it is no longer needed. This
function is similar to the IPropertySetStorage::Create method.
However, StgCreatePropStg adds the pUnk parameter and supports the
PROPSETFLAG_UNBUFFERED value for the grfFlags parameter. Use this
function instead of the Create method if you have an IStorage
interface that does not support the IPropertySetStorage interface, or
if you want to use the PROPSETFLAG_UNBUFFERED value. For more
information about using this PROPSETFLAG_UNBUFFERED enumeration
value, see PROPSETFLAG Constants. The property set automatically
contains code page and locale identifier (ID) properties. These are
set to the current system default and the current user default,
respectively. The grfFlags parameter is a combination of values taken
from PROPSETFLAG Constants. The new enumeration value
PROPSETFLAG_UNBUFFERED is supported. For more information, see
PROPSETFLAG Constants. This function is exported out of the
redistributable Iprop.dll, which is included in Windows NT 4.0 with
Service Pack 2 (SP2) and later and available as a redistributable in
Windows 95, Windows 98 and later. In Windows 2000 and Windows XP, it
is exported out of ole32.dll. It can also be exported out of
iprop.dll in Windows 2000 and Windows XP, but the call gets forwarded
to ole32.dll.


%index
StgCreateStorageEx
Creates a new storage object using a provided implementation for the IStorage or IPropertySetStorage interfaces.
%group
Win32 ole32
%prm
pwcsName, grfMode, stgfmt, grfAttrs, pStgOptions, pSecurityDescriptor, riid, ppObjectOpen
pwcsName : [wstr] A pointer to the path of the file to create. It is passed uninterpreted to the file system. This can be a relative name or NULL. If NULL, a temporary file is allocated with a unique name. If non-NULL, the string size must not exceed MAX_PATH characters.
grfMode : [int] A value that specifies the access mode to use when opening the new storage object. For more information, see STGM Constants. If the caller specifies transacted mode together with STGM_CREATE or STGM_CONVERT, the overwrite or conversion takes place when the commit operation is called for the root storage. If IStorage::Commit is not called for the root storage object, previous contents of the file will be restored. STGM_CREATE and STGM_CONVERT cannot be combined with the STGM_NOSNAPSHOT flag, because a snapshot copy is required when a file is overwritten or converted in the transacted mode.
stgfmt : [int] A value that specifies the storage file format. For more information, see the STGFMT enumeration.
grfAttrs : [int] A value that depends on the value of the stgfmt parameter.
pStgOptions : [var] The pStgOptions parameter is valid only if the stgfmt parameter is set to STGFMT_DOCFILE. If the stgfmt parameter is set to STGFMT_DOCFILE, pStgOptions points to the STGOPTIONS structure, which specifies features of the storage object, such as the sector size. This parameter may be NULL, which creates a storage object with a default sector size of 512 bytes. If non-NULL, the ulSectorSize member must be set to either 512 or 4096. If set to 4096, STGM_SIMPLE may not be specified in the grfMode parameter. The usVersion member must be set before calling StgCreateStorageEx. For more information, see STGOPTIONS.
pSecurityDescriptor : [int] Enables the ACLs to be set when the file is created. If not NULL, needs to be a pointer to the  SECURITY_ATTRIBUTES structure. See CreateFile for information on how to set ACLs on files. Windows Server?2003, Windows?2000 Server, Windows?XP and Windows?2000 Professional:??Value must be NULL.
riid : [var] A value that specifies the interface identifier (IID) of the interface pointer to return. This IID may be for the IStorage interface or the IPropertySetStorage interface.
ppObjectOpen : [var] A pointer to an interface pointer variable that receives a pointer for an interface on the new storage object; contains NULL if operation failed.
%inst
Creates a new storage object using a provided implementation for the
IStorage or IPropertySetStorage interfaces.

[戻り値]
This function can also return any file system errors or system errors
wrapped in an HRESULT. For more information, see Error Handling
Strategies and Handling Unknown Errors.

[備考]
When an application modifies its file, it usually creates a copy of
the original. The StgCreateStorageEx function is one way for creating
a copy. This function works indirectly with the Encrypting File
System (EFS) duplication API. When you use this function, you will
need to set the options for the file storage in the STGOPTIONS
structure. StgCreateStorageEx is a superset of the StgCreateDocfile
function, and should be used by new code. Future enhancements to
Structured Storage will be exposed through the StgCreateStorageEx
function. See the following Requirements section for information on
supported platforms. The StgCreateStorageEx function creates a new
storage object using one of the system-provided, structured-storage
implementations. This function can be used to obtain an IStorage
compound file implementation, an IPropertySetStorage compound file
implementation, or to obtain an IPropertySetStorage NTFS
implementation. When a new file is created, the storage
implementation used depends on the flag that you specify and on the
type of drive on which the file is stored. For more information, see
the STGFMT enumeration. StgCreateStorageEx creates the file if it
does not exist. If it does exist, the use of the STGM_CREATE,
STGM_CONVERT, and STGM_FAILIFTHERE flags in the grfMode parameter
indicate how to proceed. For more information on these values, see
STGM Constants. It is not valid, in direct mode, to specify the
STGM_READ mode in the grfMode parameter (direct mode is indicated by
not specifying the STGM_TRANSACTED flag). This function cannot be
used to open an existing file; use the StgOpenStorageEx function
instead. You can use the StgCreateStorageEx function to get access to
the root storage of a structured-storage document or the property set
storage of any file that supports property sets. See the STGFMT
documentation for information about which IIDs are supported for
different STGFMT values. When a file is created with this function to
access the NTFS property set implementation, special sharing rules
apply. For more information, see IPropertySetStorage-NTFS
Implementation. If a compound file is created in transacted mode (by
specifying STGM_TRANSACTED) and read-only mode (by specifying
STGM_READ), it is possible to make changes to the returned storage
object. For example, it is possible to call IStorage::CreateStream.
However, it is not possible to commit those changes by calling
IStorage::Commit. Therefore, such changes will be lost. Specifying
STGM_SIMPLE provides a much faster implementation of a compound file
object in a limited, but frequently used case involving applications
that require a compound file implementation with multiple streams and
no storages. For more information, see STGM Constants. It is not
valid to specify that STGM_TRANSACTED if STGM_SIMPLE is specified.
The simple mode does not support all the methods on IStorage.
Specifically, in simple mode, supported IStorage methods are
CreateStream, Commit, and SetClass as well as the COM IUnknown
methods of QueryInterface, AddRef and Release. In addition,
SetElementTimes is supported with a NULL name, allowing applications
to set times on a root storage. All the other methods of IStorage
return STG_E_INVALIDFUNCTION. If the grfMode parameter specifies
STGM_TRANSACTED and no file yet exists with the name specified by the
pwcsName parameter, the file is created immediately. In an
access-controlled file system, the caller must have write permissions
for the file system directory in which the compound file is created.
If STGM_TRANSACTED is not specified, and STGM_CREATE is specified, an
existing file with the same name is destroyed before creating the new
file. You can also use StgCreateStorageEx to create a temporary
compound file by passing a NULL value for the pwcsName parameter.
However, these files are temporary only in the sense that they have a
unique system-provided name ? one that is probably meaningless to the
user. The caller is responsible for deleting the temporary file when
finished with it, unless STGM_DELETEONRELEASE was specified for the
grfMode parameter. For more information on these flags, see STGM
Constants.


%index
StgGetIFillLockBytesOnFile
Opens a wrapper object on a temporary file.
%group
Win32 ole32
%prm
pwcsName, ppflb
pwcsName : [wstr] A pointer to the null-terminated unicode string name of the file for which a wrapper object is created.
ppflb : [var] A pointer to IFillLockBytes* pointer variable that receives the interface pointer to the new byte array wrapper object.
%inst
Opens a wrapper object on a temporary file.

[戻り値]
This function supports the standard return values E_OUTOFMEMORY,
E_UNEXPECTED, E_INVALIDARG, and E_FAIL, in addition to the following:
The StgGetIFillLockBytesOnFile function can also return any file
system errors.

[備考]
The moniker that manages the downloading of the file specified in
pwcsName calls this function in the course of creating the
asynchronous storage necessary to manage the asynchronous downloading
of data. The moniker first creates a temporary file, then calls this
function to create the wrapper object on that file. Finally, the
moniker calls StgOpenAsyncDocfileOnIFillLockBytes to open the root
storage of the compound file to be downloaded into the temporary
file.


%index
StgGetIFillLockBytesOnILockBytes
Creates a new wrapper object on a byte array object provided by the caller.
%group
Win32 ole32
%prm
pilb, ppflb
pilb : [var] Pointer to an existing byte array object.
ppflb : [var] Pointer to IFillLockBytes pointer variable that receives the interface pointer to the new byte array wrapper object.
%inst
Creates a new wrapper object on a byte array object provided by the
caller.

[戻り値]
This function supports the standard return values E_UNEXPECTED and
E_FAIL, as well as the following:

[備考]
The StgGetIFillLockBytesOnILockBytes function makes it possible to
create an asynchronous storage wrapper object on a custom byte-array
object. For example, if you wanted to implement asynchronous storage
on a database for which you have already created a byte-array object,
you would call this function to create the wrapper object for the
byte array. To do so, the function creates a new wrapper object and
then initializes it by passing it a pointer to the existing
byte-array object.


%index
StgIsStorageFile
The StgIsStorageFile function indicates whether a particular disk file contains a storage object.
%group
Win32 ole32
%prm
pwcsName
pwcsName : [wstr] Pointer to the null-terminated Unicode string name of the disk file to be examined. The pwcsName parameter is passed uninterpreted to the underlying file system.
%inst
The StgIsStorageFile function indicates whether a particular disk
file contains a storage object.

[戻り値]
StgIsStorageFile function can also return any file system errors or
system errors wrapped in an HRESULT. See Error Handling Strategies
and Handling Unknown Errors

[備考]
At the beginning of the disk file underlying a storage object is a
signature distinguishing a storage object from other file formats.
The StgIsStorageFile function is useful to applications whose
documents use a disk file format that might or might not use storage
objects. If a root compound file has been created in transacted mode
but not yet committed, this method still return S_OK.


%index
StgIsStorageILockBytes
The StgIsStorageILockBytes function indicates whether the specified byte array contains a storage object.
%group
Win32 ole32
%prm
plkbyt
plkbyt : [var] ILockBytes pointer to the byte array to be examined.
%inst
The StgIsStorageILockBytes function indicates whether the specified
byte array contains a storage object.

[戻り値]
This function can also return any file system errors, or system
errors wrapped in an HRESULT, or ILockBytes interface error return
values. See Error Handling Strategies and Handling Unknown Errors

[備考]
At the beginning of the byte array underlying a storage object is a
signature distinguishing a storage object (supporting the IStorage
interface) from other file formats. The StgIsStorageILockBytes
function is useful to applications whose documents use a byte array
(a byte array object supports the ILockBytes interface) that might or
might not use storage objects.


%index
StgOpenAsyncDocfileOnIFillLockBytes
Opens an existing root asynchronous storage object on a byte-array wrapper object provided by the caller.
%group
Win32 ole32
%prm
pflb, grfMode, asyncFlags, ppstgOpen
pflb : [var] A IFillLockBytes pointer to the byte-array wrapper object that contains the storage object to be opened.
grfMode : [int] A value that specifies the access mode to use to open the storage object. The most common access mode, taken from STGM Constants, is STGM_READ.
asyncFlags : [int] A value that indicates whether a connection point on a storage is inherited by its substorages and streams. ASYNC_MODE_COMPATIBILITY indicates that the connection point is inherited; ASYNC_MODE_DEFAULT indicates that the connection point is not inherited.
ppstgOpen : [var] A pointer to IStorage* pointer variable that receives the interface pointer to the root asynchronous storage object.
%inst
Opens an existing root asynchronous storage object on a byte-array
wrapper object provided by the caller.

[戻り値]
This function supports the standard return values E_OUTOFMEMORY,
E_UNEXPECTED, E_INVALIDARG, and E_FAIL, as well as the following:

[備考]
The root storage of the asynchronous storage object is opened
according to the access mode in the grfMode parameter. A pointer to
the IStorage interface on the opened storage object is supplied
through the ppstgOpen parameter. The byte array wrapper object must
have been previously instantiated through a call to the
StgGetIFillLockBytesOnFile function.
StgOpenAsyncDocfileOnIFillLockBytes does not support priority access
mode or exclusions. Otherwise, it works in much the same way as the
StgOpenStorageOnILockBytes function. The returned storage object has
a connection point for IProgressNotify.


%index
StgOpenPropStg
Opens a specified property set in a specified storage or stream object.
%group
Win32 ole32
%prm
pUnk, fmtid, grfFlags, dwReserved, ppPropStg
pUnk : [var] The interface pointer for IUnknown interface on the storage or stream object that contains the requested property set object.
fmtid : [var] The FMTID of the property set to be opened.
grfFlags : [int] The values from PROPSETFLAG Constants.
dwReserved : [int] Reserved for future use; must be zero.
ppPropStg : [var] A pointer to an IPropertyStorage* pointer variable that receives the interface pointer to the requested property set.
%inst
Opens a specified property set in a specified storage or stream
object.

[戻り値]
This function supports the standard return values E_INVALIDARG and
E_UNEXPECTED, in addition to the following:

[備考]
StgOpenPropStg opens the requested property set and supplies the
system-provided, stand-alone implementation of the IPropertyStorage
interface. The requested property set is contained in the storage or
stream object specified by pUnk. The value of the grfFlags parameter
indicates whether pUnk specifies a storage or stream object. For
example, if PROPSETFLAG_NONSIMPLE is set, then pUnk can be queried
for an IStorage interface on a storage object. In either case, this
function calls pUnk->AddRef for the storage or stream object
containing the property set. The caller must release the object when
no longer required. This function is similar to the
IPropertySetStorage::Open method. However, StgOpenPropStg adds the
pUnk and grfFlags parameters, including the PROPSETFLAG_UNBUFFERED
value for the grfFlags parameter. Use this function instead of the
Open method if you have an IStorage interface that does not support
the IPropertySetStorage interface, or if you want to use the
PROPSETFLAG_UNBUFFERED value. For more information about using
PROPSETFLAG_UNBUFFERED, see PROPSETFLAG Constants. The grfFlags
parameter is a combination of values taken from PROPSETFLAG
Constants. The new enumeration value PROPSETFLAG_UNBUFFERED is
supported. For more information, see PROPSETFLAG Constants. This
function is exported out of the redistributable iprop.dll, which is
included in Windows NT 4.0 with Service Pack 2 (SP2) and available as
a redistributable in Windows 95 and later. In Windows 2000, it is
exported out of Ole32.dll. It can also be exported out of iprop.dll
in Windows 2000, but the call gets forwarded to ole32.dll.


%index
StgOpenStorage
Opens an existing root storage object in the file system.
%group
Win32 ole32
%prm
pwcsName, pstgPriority, grfMode, snbExclude, reserved, ppstgOpen
pwcsName : [wstr] A pointer to the path of the null-terminated Unicode string file that contains the storage object to open. This parameter is ignored if the pstgPriority parameter is not NULL.
pstgPriority : [var] A pointer to the IStorage interface that should be NULL. If not NULL, this parameter is used as described below in the Remarks section. After StgOpenStorage returns, the storage object specified in pStgPriority may have been released and should no longer be used.
grfMode : [int] Specifies the access mode to use to open the storage object.
snbExclude : [var] If not NULL, pointer to a block of elements in the storage to be excluded as the storage object is opened. The exclusion occurs regardless of whether a snapshot copy happens on the open. Can be NULL.
reserved : [int] Indicates reserved for future use; must be zero.
ppstgOpen : [var] A pointer to a IStorage* pointer variable that receives the interface pointer to the opened storage.
%inst
Opens an existing root storage object in the file system.

[戻り値]
The StgOpenStorage function can also return any file system errors or
system errors wrapped in an HRESULT. For more information, see Error
Handling Strategies and Handling Unknown Errors.

[備考]
The StgOpenStorage function opens the specified root storage object
according to the access mode in the grfMode parameter, and, if
successful, supplies an IStorage pointer to the opened storage object
in the ppstgOpen parameter. To support the simple mode for saving a
storage object with no substorages, the StgOpenStorage function
accepts one of the following two flag combinations as valid modes in
the grfMode parameter.
This doc was truncated.


%index
StgOpenStorageEx
Opens an existing root storage object in the file system. Use this function to open Compound Files and regular files.
%group
Win32 ole32
%prm
pwcsName, grfMode, stgfmt, grfAttrs, pStgOptions, pSecurityDescriptor, riid, ppObjectOpen
pwcsName : [wstr] A pointer to the path of the null-terminated Unicode string file that contains the storage object. This string size cannot exceed MAX_PATH characters. Windows Server?2003 and Windows?XP/2000:??Unlike the CreateFile function, the MAX_PATH limit cannot be exceeded by using the "\\?\" prefix.
grfMode : [int] A value that specifies the access mode to open the new storage object. For more information, see STGM Constants. If the caller specifies transacted mode together with STGM_CREATE or STGM_CONVERT, the overwrite or conversion occurs when the commit operation is called for the root storage. If IStorage::Commit is not called for the root storage object, previous contents of the file will be restored. STGM_CREATE and STGM_CONVERT cannot be combined with the STGM_NOSNAPSHOT flag, because a snapshot copy is required when a file is overwritten or converted in transacted mode. If the storage object is opened in direct mode (STGM_DIRECT) with access to either STGM_WRITE or STGM_READWRITE, the sharing mode must be STGM_SHARE_EXCLUSIVE unless the STGM_DIRECT_SWMR mode is specified. For more information, see the Remarks section. If the storage object is opened in direct mode with access to STGM_READ, the sharing mode must be either STGM_SHARE_EXCLUSIVE or STGM_SHARE_DENY_WRITE, unless STGM_PRIORITY or STGM_DIRECT_SWMR is specified. For more information, see the Remarks section. The mode in which a file is opened can affect implementation performance. For more information, see Compound File Implementation Limits.
stgfmt : [int] A value that specifies the storage file format. For more information, see the STGFMT enumeration.
grfAttrs : [int] A value that depends upon the value of the stgfmt parameter. STGFMT_DOCFILE must be zero (0) or FILE_FLAG_NO_BUFFERING. For more information about this value, see CreateFile. If the sector size of the file, specified in pStgOptions, is not an integer multiple of the physical sector size of the underlying disk, then this operation will fail. All other values of stgfmt must be zero.
pStgOptions : [var] A pointer to an STGOPTIONS structure that contains data about the storage object opened. The pStgOptions parameter is valid only if the stgfmt parameter is set to STGFMT_DOCFILE. The usVersion member must be set before calling StgOpenStorageEx. For more information, see the STGOPTIONS structure.
pSecurityDescriptor : [int] Reserved; must be zero.
riid : [var] A value that specifies the GUID of the interface pointer to return. Can also be the header-specified value for IID_IStorage to obtain the IStorage interface or for IID_IPropertySetStorage to obtain the IPropertySetStorage interface.
ppObjectOpen : [var] The address of an interface pointer variable that receives a pointer for an interface on the storage object opened; contains NULL if operation failed.
%inst
Opens an existing root storage object in the file system. Use this
function to open Compound Files and regular files.

[戻り値]
This function can also return any file system errors or system errors
wrapped in an HRESULT. For more information, see Error Handling
Strategies and Handling Unknown Errors.

[備考]
StgOpenStorageEx is a superset of the StgOpenStorage function, and
should be used by new code. Future enhancements to structured storage
will be exposed through this function. For more information about
supported platforms, see the Requirements section. The
StgOpenStorageEx function opens the specified root storage object
according to the access mode in the grfMode parameter, and, if
successful, supplies an interface pointer for the opened storage
object in the ppObjectOpen parameter. This function can be used to
obtain an IStorage compound file implementation, an
IPropertySetStorage compound file implementation, or an NTFS file
system implementation of IPropertySetStorage. When you open a file,
the system selects a structured storage implementation depending on
which STGFMT flag you specify on the file type and on the type of
drive where the file is stored. Use the StgOpenStorageEx function to
access the root storage of a structured storage document or the
property set storage of any file that supports property sets. For
more information about which interface identifiers (IIDs) are
supported for the different STGFMT values, see STGFMT. When a file is
opened with this function to access the NTFS property set
implementation, special sharing rules apply. For more information,
see IPropertySetStorage-NTFS Implementation. If a compound file is
opened in transacted mode, by specifying STGM_TRANSACTED, and
read-only mode, by specifying STGM_READ, it is possible to change the
returned storage object. For example, it is possible to call
IStorage::CreateStream. However, it is not possible to commit those
changes by calling IStorage::Commit. Therefore, such changes will be
lost. It is not valid to use the STGM_CREATE, STGM_DELETEONRELEASE,
or STGM_CONVERT flags in the grfMode parameter for this function. To
support the simple mode for saving a storage object with no
substorages, the StgOpenStorageEx function accepts one of the
following two flag combinations as valid modes in the grfMode
parameter:
This doc was truncated.


%index
StgOpenStorageOnILockBytes
The StgOpenStorageOnILockBytes function opens an existing storage object that does not reside in a disk file, but instead has an underlying byte array provided by the caller.
%group
Win32 ole32
%prm
plkbyt, pstgPriority, grfMode, snbExclude, reserved, ppstgOpen
plkbyt : [var] ILockBytes pointer to the underlying byte array object that contains the storage object to be opened.
pstgPriority : [var] A pointer to the IStorage interface that should be NULL. If not NULL, this parameter is used as described below in the Remarks section. After StgOpenStorageOnILockBytes returns, the storage object specified in pStgPriority may have been released and should no longer be used.
grfMode : [int] Specifies the access mode to use to open the storage object. For more information, see STGM Constants and the Remarks section below.
snbExclude : [var] Can be NULL. If not NULL, this parameter points to a block of elements in this storage that are to be excluded as the storage object is opened. This exclusion occurs independently of whether a snapshot copy happens on the open.
reserved : [int] Indicates reserved for future use; must be zero.
ppstgOpen : [var] Points to the location of an IStorage pointer to the opened storage on successful return.
%inst
The StgOpenStorageOnILockBytes function opens an existing storage
object that does not reside in a disk file, but instead has an
underlying byte array provided by the caller.

[戻り値]
The StgOpenStorageOnILockBytes function can also return any file
system errors, or system errors wrapped in an HRESULT, or ILockBytes
interface error return values. See Error Handling Strategies and
Handling Unknown Errors.

[備考]
StgOpenStorageOnILockBytes opens the specified root storage object. A
pointer to the IStorage interface on the opened storage object is
supplied through the ppstgOpen parameter. The storage object must
have been previously created by the StgCreateDocfileOnILockBytes
function. Except for specifying a programmer-provided byte-array
object, StgOpenStorageOnILockBytes is similar to the StgOpenStorage
function. The storage object is opened according to the access modes
in the grfMode parameter, subject to the following restrictions:
Sharing mode behavior and transactional isolation depend on the
ILockBytes implementation supporting LockRegion and UnlockRegion with
LOCK_ONLYONCE semantics. Implementations can indicate to structured
storage they support this functionality by setting the LOCK_ONLYONCE
bit in the grfLocksSupported member of STATSTG. If an ILockBytes
implementation does not support this functionality, sharing modes
will not be enforced, and root-level transactional commits will not
coordinate properly with other transactional instances opened on the
same byte array. Applications that use an ILockBytes implementation
that does not support region locking, such as the
CreateStreamOnHGlobal implementation, should avoid opening multiple
concurrent instances on the same byte array.
StgOpenStorageOnILockBytes does not support simple mode. The
STGM_SIMPLE flag, if present, is ignored. The pStgPriority parameter
is intended as a convenience for callers replacing an existing
storage object, often one opened in priority mode, with a new storage
object opened on the same byte array. Unlike the pStgPriority
parameter of StgOpenStorage, this parameter does not affect the open
operation performed by StgOpenStorageOnILockBytes and is simply an
existing storage object the caller would like released. Callers
should always pass NULL for this parameter because
StgOpenStorageOnILockBytes releases the object under some
circumstances, and does not release it under other circumstances. The
use of the pStgPriority parameter can be duplicated by the caller in
a safer manner by instead releasing the object before calling
StgOpenStorageOnILockBytes, as shown in the following example:
This doc was truncated.


%index
StgPropertyLengthAsVariant
The StgPropertyLengthAsVariant function examines a SERIALIZEDPROPERTYVALUE and returns the amount of memory that this property would occupy as a PROPVARIANT.
%group
Win32 ole32
%prm
pProp, cbProp, CodePage, bReserved
pProp : [var] A pointer to a SERIALIZEDPROPERTYVALUE.
cbProp : [int] The size of the pProp buffer in bytes.
CodePage : [int] A property set code page.
bReserved : [int] Reserved. Must be 0.
%inst
The StgPropertyLengthAsVariant function examines a
SERIALIZEDPROPERTYVALUE and returns the amount of memory that this
property would occupy as a PROPVARIANT.

[戻り値]
Returns the amount of memory the property would occupy as a
PROPVARIANT.

[備考]
Use this function to decide whether or not to deserialize a property
value in a low-memory scenario. Most applications will have no need
to call this function.


%index
StgSetTimes
The StgSetTimes function sets the creation, access, and modification times of the indicated file, if supported by the underlying file system.
%group
Win32 ole32
%prm
lpszName, pctime, patime, pmtime
lpszName : [wstr] Pointer to the name of the file to be changed.
pctime : [var] Pointer to the new value for the creation time.
patime : [var] Pointer to the new value for the access time.
pmtime : [var] Pointer to the new value for the modification time.
%inst
The StgSetTimes function sets the creation, access, and modification
times of the indicated file, if supported by the underlying file
system.

[戻り値]
The StgSetTimes function can also return any file system errors or
system errors wrapped in an HRESULT. See Error Handling Strategies
and Handling Unknown Errors.

[備考]
The StgSetTimes function sets the time values for the specified file.
Each of the time value parameters can be NULL, indicating that no
modification should occur. It is possible that one or more of these
time values are not supported by the underlying file system. This
function sets the times that can be set and ignores the rest.


%index
WriteClassStg
The WriteClassStg function stores the specified class identifier (CLSID) in a storage object.
%group
Win32 ole32
%prm
pStg, rclsid
pStg : [var] IStorage pointer to the storage object that gets a new CLSID.
rclsid : [var] Pointer to the CLSID to be stored with the object.
%inst
The WriteClassStg function stores the specified class identifier
(CLSID) in a storage object.

[戻り値]
This function returns HRESULT.

[備考]
The WriteClassStg function writes a CLSID to the specified storage
object so that it can be read by the ReadClassStg function. Container
applications typically call this function before calling the
IPersistStorage::Save method.


%index
WriteClassStm
The WriteClassStm function stores the specified CLSID in the stream.
%group
Win32 ole32
%prm
pStm, rclsid
pStm : [var] IStream pointer to the stream into which the CLSID is to be written.
rclsid : [var] Specifies the CLSID to write to the stream.
%inst
The WriteClassStm function stores the specified CLSID in the stream.

[戻り値]
This function returns HRESULT.

[備考]
The WriteClassStm function writes a CLSID to the specified stream
object so it can be read by the ReadClassStm function. Most
applications do not call WriteClassStm directly. OLE calls it before
making a call to an object's IPersistStream::Save method.


%index
WriteFmtUserTypeStg
The WriteFmtUserTypeStg function writes a clipboard format and user type to the storage object.
%group
Win32 ole32
%prm
pstg, cf, lpszUserType
pstg : [var] IStorage pointer to the storage object where the information is to be written.
cf : [int] Specifies the clipboard format that describes the structure of the native area of the storage object. The format tag includes the policy for the names of streams and substorages within this storage object and the rules for interpreting data within those streams.
lpszUserType : [wstr] Pointer to a null-terminated Unicode string that specifies the object's current user type. The user type value, itself, cannot be NULL. This is the type returned by the IOleObject::GetUserType method. If this function is transported to a remote machine where the object class does not exist, this persistently stored user type can be shown to the user in dialog boxes.
%inst
The WriteFmtUserTypeStg function writes a clipboard format and user
type to the storage object.

[戻り値]
This function returns HRESULT.

[備考]
The WriteFmtUserTypeStg function must be called in an object's
implementation of the IPersistStorage::Save method. It must also be
called by document-level objects that use structured storage for
their persistent representation in their save sequence. To read the
information saved, applications call the ReadFmtUserTypeStg function.

